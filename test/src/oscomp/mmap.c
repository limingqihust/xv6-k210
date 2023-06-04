#include "unistd.h"
#include "string.h"
#include "stdio.h"
#include "stdlib.h"

/*
 * 测试成功时输出：
 * "  Hello, mmap success"
 * 测试失败时输出：
 * "mmap error."
 */
static struct kstat kst;
void test_mmap(void){
    TEST_START(__func__);
    char *array;
    const char *str = "  Hello, mmap successfully!";
    int fd;

    fd = open("test_mmap.txt", O_RDWR | O_CREATE);
    write(fd, str, strlen(str));
    fstat(fd, &kst);
    printf("file len: %d\n", kst.st_size);
    //映射的起始位置，映射的长度，可写|可读,映射文件 | 共享映射，文件描述符，偏移量
    array = mmap(NULL, kst.st_size, PROT_WRITE | PROT_READ, MAP_FILE | MAP_SHARED, fd, 0);

    if (array == MAP_FAILED) 
    {
	    printf("mmap error.\n");
    }
    else
    {
	    printf("mmap content: %s\n", array);
	    array[0]='A';
        munmap(array, kst.st_size);
    }

    close(fd);
    fd = open("test_mmap.txt", O_RDWR | O_CREATE);
    char buf[256];
    read(fd,buf,256);
    printf("after munmap content of test_mmap.txt:%s\n",buf);
    TEST_END(__func__);
}

int main(void){
    test_mmap();
    return 0;
}