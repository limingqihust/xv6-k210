#define O_RDONLY  0x000
#define O_WRONLY  0x001
#define O_RDWR    0x002
#define O_APPEND  0x004
// modified by lmq for SYS_close
#define O_CREATE  (0x200 | 0x40)
#define O_TRUNC   0x400
// added by lmq for SYS_openat
#define O_DIRECTORY 0x0200000
