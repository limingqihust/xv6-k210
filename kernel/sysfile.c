//
// File-system system calls.
// Mostly argument checking, since we don't trust
// user code, and calls into file.c and fs.c.
//


#include "include/types.h"
#include "include/riscv.h"
#include "include/param.h"
#include "include/stat.h"
#include "include/spinlock.h"
#include "include/proc.h"
#include "include/sleeplock.h"
#include "include/file.h"
#include "include/pipe.h"
#include "include/fcntl.h"
#include "include/fat32.h"
#include "include/syscall.h"
#include "include/string.h"
#include "include/printf.h"
#include "include/vm.h"


// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == NULL)
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
}

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *p = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(p->ofile[fd] == 0){
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
}

uint64
sys_dup(void)
{
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}

uint64
sys_read(void)
{
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    return -1;
  return fileread(f, p, n);
}

uint64
sys_write(void)
{
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    return -1;
  return filewrite(f, p, n);
}

uint64
sys_close(void)
{
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
  myproc()->ofile[fd] = 0;
  fileclose(f);
  return 0;
}

uint64
sys_fstat(void)
{
  struct file *f;
  uint64 st; // user pointer to struct stat

  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    return -1;
  return filestat(f, st);
}

static struct dirent*
create(char *path, short type, int mode)
{
  struct dirent *ep, *dp;
  char name[FAT32_MAX_FILENAME + 1];

  if((dp = enameparent(path, name)) == NULL)
    return NULL;

  if (type == T_DIR) {
    mode = ATTR_DIRECTORY;
  } else if (mode & O_RDONLY) {
    mode = ATTR_READ_ONLY;
  } else {
    mode = 0;  
  }

  elock(dp);
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    eunlock(dp);
    eput(dp);
    return NULL;
  }
  
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
      (type == T_FILE && (ep->attribute & ATTR_DIRECTORY))) {
    eunlock(dp);
    eput(ep);
    eput(dp);
    return NULL;
  }

  eunlock(dp);
  eput(dp);

  elock(ep);
  return ep;
}

uint64
sys_open(void)
{
  char path[FAT32_MAX_PATH];
  int fd, omode;
  struct file *f;
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    return -1;
  if(omode & O_CREATE){
    ep = create(path, T_FILE, omode);
    if(ep == NULL){
      return -1;
    }
  } else {
    if((ep = ename(path)) == NULL){
      return -1;
    }
    elock(ep);
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
      eunlock(ep);
      eput(ep);
      return -1;
    }
  }

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    if (f) {
      fileclose(f);
    }
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    etrunc(ep);
  }

  f->type = FD_ENTRY;
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
  f->ep = ep;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);

  eunlock(ep);

  return fd;
}

uint64
sys_mkdir(void)
{
  char path[FAT32_MAX_PATH];
  struct dirent *ep;

  if(argstr(1, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    return -1;
  }
  eunlock(ep);
  eput(ep);
  return 0;
}

uint64
sys_chdir(void)
{
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  struct proc *p = myproc();
  
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    return -1;
  }
  elock(ep);
  if(!(ep->attribute & ATTR_DIRECTORY)){
    eunlock(ep);
    eput(ep);
    return -1;
  }
  eunlock(ep);
  eput(p->cwd);
  p->cwd = ep;
  return 0;
}

uint64
sys_pipe(void)
{
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();

  if(argaddr(0, &fdarray) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      p->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  // if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
  //    copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
     copyout2(fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    p->ofile[fd0] = 0;
    p->ofile[fd1] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  return 0;
}

// To open console device.
uint64
sys_dev(void)
{
  int fd, omode;
  int major, minor;
  struct file *f;

  if(argint(0, &omode) < 0 || argint(1, &major) < 0 || argint(2, &minor) < 0){
    return -1;
  }

  if(omode & O_CREATE){
    panic("dev file on FAT");
  }

  if(major < 0 || major >= NDEV)
    return -1;

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    return -1;
  }

  f->type = FD_DEVICE;
  f->off = 0;
  f->ep = 0;
  f->major = major;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);

  return fd;
}

// To support ls command
uint64
sys_readdir(void)
{
  struct file *f;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    return -1;
  return dirnext(f, p);
}

// get absolute cwd string
uint64
sys_getcwd(void)
{
  uint64 addr;
  if (argaddr(0, &addr) < 0)
    return -1;

  struct dirent *de = myproc()->cwd;
  char path[FAT32_MAX_PATH];
  char *s;
  int len;

  if (de->parent == NULL) {
    s = "/";
  } else {
    s = path + FAT32_MAX_PATH - 1;
    *s = '\0';
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= path)          // can't reach root "/"
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
      de = de->parent;
    }
  }

  // if (copyout(myproc()->pagetable, addr, s, strlen(s) + 1) < 0)
  if (copyout2(addr, s, strlen(s) + 1) < 0)
    return -1;
  
  return addr;

}

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct dirent *dp)
{
  struct dirent ep;
  int count;
  int ret;
  ep.valid = 0;
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
  return ret == -1;
}

uint64
sys_remove(void)
{
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  int len;
  if((len = argstr(0, path, FAT32_MAX_PATH)) <= 0)
    return -1;

  char *s = path + len - 1;
  while (s >= path && *s == '/') {
    s--;
  }
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    return -1;
  }
  
  if((ep = ename(path)) == NULL){
    return -1;
  }
  elock(ep);
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
      eunlock(ep);
      eput(ep);
      return -1;
  }
  elock(ep->parent);      // Will this lead to deadlock?
  eremove(ep);
  eunlock(ep->parent);
  eunlock(ep);
  eput(ep);

  return 0;
}

// Must hold too many locks at a time! It's possible to raise a deadlock.
// Because this op takes some steps, we can't promise
uint64
sys_rename(void)
{
  char old[FAT32_MAX_PATH], new[FAT32_MAX_PATH];
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
      return -1;
  }

  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
  int srclock = 0;
  char *name;
  if ((src = ename(old)) == NULL || (pdst = enameparent(new, old)) == NULL
      || (name = formatname(old)) == NULL) {
    goto fail;          // src doesn't exist || dst parent doesn't exist || illegal new name
  }
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    if (ep == src) {    // In what universe can we move a directory into its child?
      goto fail;
    }
  }

  uint off;
  elock(src);     // must hold child's lock before acquiring parent's, because we do so in other similar cases
  srclock = 1;
  elock(pdst);
  dst = dirlookup(pdst, name, &off);
  if (dst != NULL) {
    eunlock(pdst);
    if (src == dst) {
      goto fail;
    } else if (src->attribute & dst->attribute & ATTR_DIRECTORY) {
      elock(dst);
      if (!isdirempty(dst)) {    // it's ok to overwrite an empty dir
        eunlock(dst);
        goto fail;
      }
      elock(pdst);
    } else {                    // src is not a dir || dst exists and is not an dir
      goto fail;
    }
  }

  if (dst) {
    eremove(dst);
    eunlock(dst);
  }
  memmove(src->filename, name, FAT32_MAX_FILENAME);
  emake(pdst, src, off);
  if (src->parent != pdst) {
    eunlock(pdst);
    elock(src->parent);
  }
  eremove(src);
  eunlock(src->parent);
  struct dirent *psrc = src->parent;  // src must not be root, or it won't pass the for-loop test
  src->parent = edup(pdst);
  src->off = off;
  src->valid = 1;
  eunlock(src);

  eput(psrc);
  if (dst) {
    eput(dst);
  }
  eput(pdst);
  eput(src);

  return 0;

fail:
  if (srclock)
    eunlock(src);
  if (dst)
    eput(dst);
  if (pdst)
    eput(pdst);
  if (src)
    eput(src);
  return -1;
}

// added by lmq for SYS_openat
uint64
sys_openat(void)
{
  int dirfd;
  if(argint(0, &dirfd) < 0)
    return -1;
  struct dirent *de = myproc()->cwd;
  if(dirfd!=AT_FDCWD)
  {
    de=myproc()->ofile[dirfd]->ep;
  }
  char cur_path[FAT32_MAX_PATH];  // openat工作目录 可以为当前目录 也可以被指定
  memset(cur_path,0,FAT32_MAX_PATH);
  char* s=NULL;
  int len;

  // 获得openat工作目录路径
  if (de->parent == NULL) {
    s = "/";
  } 
  else {
    s = cur_path + FAT32_MAX_PATH - 1;
    *s = '\0';
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= cur_path)          // can't reach root "/"
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
      de = de->parent;
    }
  }
  
  // 获得openat的文件路径 openat工作目录+相对路径
  char absolute_path[FAT32_MAX_PATH];
  memset(absolute_path,0,FAT32_MAX_PATH);
  strncpy(absolute_path,s,strlen(s));

  int fd,omode;
  struct file *f;
  struct dirent *ep;
  char relative_path[FAT32_MAX_PATH];
  if(argstr(1, relative_path, FAT32_MAX_PATH) < 0 || argint(2,&omode) < 0)
    return -1;
  
  if(relative_path[0]=='/')                               // 为绝对路径 忽略dirfd
  {
    memset(absolute_path,0,FAT32_MAX_PATH);
    strncpy(absolute_path,relative_path,strlen(relative_path));
  }
  else if(relative_path[0]=='.' && relative_path[1]=='/') // 为显式相对路径
  {
    strncpy(absolute_path+strlen(absolute_path),
            relative_path+1,
            strlen(relative_path+1));
  }
  else if (relative_path[0]=='.' && relative_path[1]=='.')// 显示相对路径 没有实现
  {
    panic("openat not support ..");
  }
  else                                                    // 为隐式相对路径
  {
    int absolute_path_old_len=strlen(absolute_path);
    absolute_path[absolute_path_old_len]='/';
    absolute_path[absolute_path_old_len+1]='\0';
    strncpy(absolute_path+strlen(absolute_path),
            relative_path,
            strlen(relative_path));
  }

  // 根据路径名打开文件
  if(omode & O_CREATE){                         // 创建文件
    ep = create(absolute_path, T_FILE, omode);
    if(ep == NULL){
      return -1;
    }
  } 
  else if(omode & O_DIRECTORY)                  // 打开一个目录
  {
    
    if((ep=ename(absolute_path))==NULL)         // 获取目录项
    {
      return -1;
    }
    elock(ep);
    if(!(ep->attribute & ATTR_DIRECTORY))       // 该文件不是目录文件
    {
      eunlock(ep);
      eput(ep);
      return -1;
    }
  }
  else {
    if((ep = ename(absolute_path)) == NULL){
      return -1;
    }
    elock(ep);
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
      eunlock(ep);
      eput(ep);
      return -1;
    }
  }

  
  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    if (f) {
      fileclose(f);
    }
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    etrunc(ep);
  }

  // 设置权限
  f->type = FD_ENTRY;
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
  f->ep = ep;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);

  eunlock(ep);

  return fd;
}


// added by lmq for SYS_mkdirat
uint64
sys_mkdirat(void)
{
  int dirfd,omode;
  char des_path[FAT32_MAX_PATH];
  if(argint(0, &dirfd) < 0 || argstr(1,des_path,FAT32_MAX_PATH)<0 || argint(2,&omode)<0)
    return -1;


  // 如果dirfd不为AT_FDCWD 则获得dirfd的路径
  char cur_path[FAT32_MAX_PATH];
  memset(cur_path,0,FAT32_MAX_PATH);
  char* s=NULL;
  int len;
  if(dirfd!=AT_FDCWD)
  {
    struct dirent* de=myproc()->ofile[dirfd]->ep;
    if (de->parent == NULL) {
      s = "/";
    } 
    else {
      s = cur_path + FAT32_MAX_PATH - 1;
      *s = '\0';
      while (de->parent) {
        len = strlen(de->filename);
        s -= len;
        if (s <= cur_path)          // can't reach root "/"
          return -1;
        strncpy(s, de->filename, len);
        *--s = '/';
        de = de->parent;
      }
    }
    memset(cur_path,0,FAT32_MAX_PATH);
    strncpy(cur_path,s,strlen(s));
    if(des_path[0]!='/')
    {
      if(des_path[0]=='.' && des_path[1]=='/')
      {
        strncpy(cur_path+strlen(cur_path),des_path+1,strlen(des_path+1));
        memset(des_path,0,FAT32_MAX_PATH);
        strncpy(des_path,cur_path,strlen(cur_path));
      }
      else if(des_path[0]=='.' && des_path[1]=='.')
      {
        panic("mkdirat not support ..\n");
      }
      else
      {
        cur_path[strlen(cur_path)]='/';
        strncpy(cur_path+strlen(cur_path),des_path,strlen(des_path));
        memset(des_path,0,FAT32_MAX_PATH);
        strncpy(des_path,cur_path,strlen(cur_path));
      }
    }
    
  }

  struct dirent* ep;
  if((ep = create(des_path, T_DIR, omode)) == 0)
  {
    return -1;
  }

  eunlock(ep);
  eput(ep);
  return 0;
}

// added by lmq for SYS_dup3
uint64
sys_dup3(void)
{
  struct file *f;
  int new_fd;
  struct proc* p=myproc();

  if(argfd(0, 0, &f) < 0 || argint(1,&new_fd)<0)
    return -1;
  if(p->ofile[new_fd]!=0)        // 文件描述符[new_fd]已被占用
  {
    return -1;
  }
  p->ofile[new_fd] = f;
  filedup(f);
  return new_fd;
}

// added by lmq for SYS_getdents64
struct linux_dirent64 {
  uint64          d_ino;	    // 索引结点号    
  long long int   d_off;	    // 到下一个dirent的偏移    
  unsigned short  d_reclen;	  // 当前dirent的长度    
  unsigned char   d_type;	    // 文件类型    
  char            d_name[];	  // 文件名
};
uint64 
sys_getdents64(void)
{
  int fd,len;                   // fd:要读取的目录的文件描述符
  struct file* f;
  struct linux_dirent64* dirp64;// dirp64:存储信息的地址

  if(argfd(0,&fd,&f)<0 || argaddr(1,(uint64*)&dirp64)<0 || argint(2,&len))
  {
    return -1;
  }
  int filename_len=strlen(f->ep->filename);
  if(filename_len>len)
  {
    return -1;
  }
  if(f->ep->parent==NULL)   // this direntry is root
  {
    if(copyout2((uint64)dirp64->d_name, "/", 1) < 0 ||
      copyout2((uint64)&(dirp64->d_type),(char*)&f->type,sizeof(f->type) < 0 ))
    return -1;
  }
  else if(copyout2((uint64)dirp64->d_name, f->ep->filename, filename_len) < 0 ||
        copyout2((uint64)&(dirp64->d_type),(char*)&f->type,sizeof(f->type) < 0 ))
    return -1;

  return filename_len+sizeof(f->type);
}


// added by lmq for SYS_fstat
typedef unsigned int mode_t;
typedef long int off_t;
struct kstat {
        uint64 st_dev;
        uint64 st_ino;
        mode_t st_mode;
        uint32 st_nlink;
        uint32 st_uid;
        uint32 st_gid;
        uint64 st_rdev;
        unsigned long __pad;
        off_t st_size;
        uint32 st_blksize;
        int __pad2;
        uint64 st_blocks;
        long st_atime_sec;
        long st_atime_nsec;
        long st_mtime_sec;
        long st_mtime_nsec;
        long st_ctime_sec;
        long st_ctime_nsec;
        unsigned __unused[2];
};
uint64
sys_fstat_cscc(void)
{
  struct file* f;
  uint64 addr;
  if(argfd(0,0,&f)<0 || argaddr(1,&addr)<0)
  {
    return -1;
  }

  struct kstat st;
  if(f->type!=FD_ENTRY)
    return -1;
  elock(f->ep);
  st.st_dev=f->ep->dev;
  st.st_ino=0;
  st.st_mode=f->type;
  st.st_nlink=f->ref;
  st.st_gid=0;
  st.st_uid=0;
  st.st_rdev=0;
  st.st_size=f->ep->file_size;
  st.st_blocks=0;
  st.st_blksize=0;
  st.st_atime_sec=0;
  st.st_atime_nsec=0;
  st.st_mtime_nsec=0;
  st.st_mtime_sec=0;
  st.st_ctime_nsec=0;
  st.st_ctime_sec=0;
  eunlock(f->ep);
  if((copyout2(addr,(char*)&st,sizeof(struct kstat)))<0)
    return -1;
  return 0;
}

// lzq link
uint64
sys_linkat(void){
//    //先实现link，再适配
//    char path[FAT32_MAX_PATH];// file
//    char name[FAT32_MAX_FILENAME + 1];//dir name
//    struct dirent *ep,*dp;
//    if(argstr(1, path, FAT32_MAX_PATH) < 0)
//        return -1;
//    if((ep = ename(path)) == NULL)
//        return -1;
    return 0;
}
uint64
sys_unlink(void){
    char path[FAT32_MAX_PATH];// file
    char name[FAT32_MAX_FILENAME + 1];//dir name
    struct dirent *ep,*dp;
    if(argstr(1, path, FAT32_MAX_PATH) < 0)
        return -1;
    if((ep = ename(path)) == NULL)
        return -1;
    if((dp = enameparent(path, name)) == NULL)
        return -1;
    elock(dp);
    elock(ep);
    eremove(ep);
    eunlock(ep);
    eunlock(dp);
    eput(dp);
    return 0;
}
//lzq mount
// 建立设备文件 内核态应该以 主设备号 ：副设备号 管理设备即（设备类型，该类型第几个设备）
uint64
open_dev(int major, int omode)
{
    int fd;
//    int minor;
    struct file *f;
//    if(omode & O_CREATE){
//        panic("dev file on FAT");
//    }
    if(major < 0 || major >= NDEV)
        return -1;

    if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
        if(f)
            fileclose(f);
        return -1;
    }

    f->type = FD_DEVICE;
    f->off = 0;
    f->ep = 0;
    f->major = major;
    f->readable = !(omode & O_WRONLY);
    f->writable = (omode & O_WRONLY) || (omode & O_RDWR);

    return fd;
}
// test mount 1 /dev/vda2 /mnt
uint64
sys_mount(void)
{
    char special[FAT32_MAX_PATH];
    char dir[FAT32_MAX_PATH]; //挂载设备,挂载点,挂载的文件系统类型
    if (argstr(0, special, FAT32_MAX_PATH) < 0 || argstr(1, dir, FAT32_MAX_PATH) < 0)
        return -1;
    //fstype， flags挂载参数， data传递给文件系统的字符串参数，可为NULL；

    //建立目标文件夹
    struct dirent * dp, *devp;
    dp = create(dir, T_DIR, O_CREATE);
    if (dp == NULL || dp->attribute != ATTR_DIRECTORY) {
        eput(dp); // 指定的挂载点不存在或者不是目录
        return -1;
    }
    devp = ename(special);
    int major = devp->dev;
    //    struct fat *newfat;   理论上可能要给新设备加载文件系统？
    int dev = open_dev(major, O_RDWR); //用作设备号(fd)
    if (dev < 0)
        return -1;
    dp->dev = dev;
    dp->parent = dp;
    dp->valid = 1;
    return 0;
}
uint64
sys_umount2(void)
{
  return 0;
}


// added by lmq for SYS_mmap
uint64
sys_mmap(void){
    return 0;
    uint64 addr;    // 映射起始位置
    int len;        // 映射的长度
    int prot;       // 映射的内存保护方式，可取：PROT_EXEC, PROT_READ, PROT_WRITE, PROT_NONE
    int flags;      // 映射是否与其他进程共享的标志，
    int fd;         // 被映射的文件句柄，
    int off;        // 文件偏移量；

    struct file *f;
    if(argaddr(0, &addr) < 0 || argint(1, &len) < 0 || argint(2, &prot) < 0 ||
       argint(3, &flags) < 0 || argfd(4, &fd, &f) < 0 || argint(5, &off) < 0)
        return -1;

    if(len>PGSIZE)
    {
      panic("mmap: len > PGSIZE");
    }

    // 获取虚拟地址
    uint64 va=0;

    if(addr==NULL)
    {
      va = myproc()->sz;
      myproc()->sz+=PGSIZE;
    }
    else
    {
      va=addr;
    }

    // 获取物理地址
    uint64 pa=0;
    if(f->type!=FD_ENTRY)
    {
      panic("mmap: f->type!=FD_ENTRY");
    }
    struct dirent* ep=f->ep;
    pa=get_pa_of_entry(ep,off,len);
    printf("%s\n",pa);
    if(mappages(myproc()->pagetable,va,PGSIZE, pa, PTE_W|PTE_X|PTE_R|PTE_U) != 0)
      return -1;
    printf("%d\n",walkaddr(myproc()->pagetable,va));
    return pa;
}


// added by lmq for SYS_munmap
uint64
sys_munmap(void)
{
  char special[FAT32_MAX_PATH];
  if (argstr(0, special, FAT32_MAX_PATH) < 0)
      return -1;
  struct dirent * dp, * ep;
  char parent_name[FAT32_MAX_FILENAME + 1];
  ep = ename(special);
  dp = enameparent(special, parent_name);
  elock(dp);
  elock(ep);
  eremove(ep); //是不是应该递归删除所有entry？
  eunlock(ep);
  eunlock(dp);
  eput(dp);
  return 0;
}