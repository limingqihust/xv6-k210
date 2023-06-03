#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

char buf[512];
void test_getdents(void){
    TEST_START(__func__);
    int fd, nread;
    struct linux_dirent64 *dirp64;
    dirp64 = buf;
    //fd = open(".", O_DIRECTORY);
    fd = open(".", O_RDONLY);
    printf("open fd:%d\n", fd);             // 该目录的文件描述符要大于1

	nread = getdents(fd, dirp64, 512);
	printf("getdents fd:%d\n", nread);      // 读取的字节数大于1
	assert(nread != -1);
	printf("getdents success.\n%s\n", dirp64->d_name);      // 名字要大于等于1

	/*
	for(int bpos = 0; bpos < nread;){
	    d = (struct dirent *)(buf + bpos);
	    printf(  "%s\t", d->d_name);
	    bpos += d->d_reclen;
	}
	*/

    printf("\n");
    close(fd);
    TEST_END(__func__);
}

int main(void){
    test_getdents();
    return 0;
}
