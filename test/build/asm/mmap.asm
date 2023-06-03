
/home/lmq/Desktop/xv6-k210/test/build/riscv64/mmap:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a8c5                	j	10f2 <__start_main>

0000000000001004 <test_mmap>:
 * "  Hello, mmap success"
 * 测试失败时输出：
 * "mmap error."
 */
static struct kstat kst;
void test_mmap(void){
    1004:	1101                	addi	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	eaa50513          	addi	a0,a0,-342 # 1eb0 <__clone+0x2e>
void test_mmap(void){
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e426                	sd	s1,8(sp)
    TEST_START(__func__);
    1014:	2dc000ef          	jal	ra,12f0 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	fd850513          	addi	a0,a0,-40 # 1ff0 <__func__.1193>
    1020:	2d0000ef          	jal	ra,12f0 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	ea450513          	addi	a0,a0,-348 # 1ec8 <__clone+0x46>
    102c:	2c4000ef          	jal	ra,12f0 <puts>
    char *array;
    const char *str = "  Hello, mmap successfully!";
    int fd;

    fd = open("test_mmap.txt", O_RDWR | O_CREATE);
    1030:	04200593          	li	a1,66
    1034:	00001517          	auipc	a0,0x1
    1038:	ea450513          	addi	a0,a0,-348 # 1ed8 <__clone+0x56>
    103c:	3d1000ef          	jal	ra,1c0c <open>
    1040:	842a                	mv	s0,a0
    write(fd, str, strlen(str));
    1042:	00001517          	auipc	a0,0x1
    1046:	ea650513          	addi	a0,a0,-346 # 1ee8 <__clone+0x66>
    104a:	01d000ef          	jal	ra,1866 <strlen>
    104e:	862a                	mv	a2,a0
    1050:	00001597          	auipc	a1,0x1
    1054:	e9858593          	addi	a1,a1,-360 # 1ee8 <__clone+0x66>
    1058:	8522                	mv	a0,s0
    105a:	3f1000ef          	jal	ra,1c4a <write>
    fstat(fd, &kst);
    105e:	00001497          	auipc	s1,0x1
    1062:	f1248493          	addi	s1,s1,-238 # 1f70 <kst>
    1066:	85a6                	mv	a1,s1
    1068:	8522                	mv	a0,s0
    106a:	52d000ef          	jal	ra,1d96 <fstat>
    printf("file len: %d\n", kst.st_size);
    106e:	788c                	ld	a1,48(s1)
    1070:	00001517          	auipc	a0,0x1
    1074:	e9850513          	addi	a0,a0,-360 # 1f08 <__clone+0x86>
    1078:	29a000ef          	jal	ra,1312 <printf>
    //映射的起始位置，映射的长度，可写|可读,映射文件 | 共享映射，文件描述符，偏移量
    array = mmap(NULL, kst.st_size, PROT_WRITE | PROT_READ, MAP_FILE | MAP_SHARED, fd, 0);
    107c:	788c                	ld	a1,48(s1)
    107e:	4781                	li	a5,0
    1080:	8722                	mv	a4,s0
    1082:	4685                	li	a3,1
    1084:	460d                	li	a2,3
    1086:	4501                	li	a0,0
    1088:	4c1000ef          	jal	ra,1d48 <mmap>
    // printf("return array: %x\n", array);

    if (array == MAP_FAILED) 
    108c:	57fd                	li	a5,-1
    108e:	00f50c63          	beq	a0,a5,10a6 <test_mmap+0xa2>
    }

    close(fd);

    TEST_END(__func__);
}
    1092:	6442                	ld	s0,16(sp)
    1094:	60e2                	ld	ra,24(sp)
    1096:	64a2                	ld	s1,8(sp)
    1098:	85aa                	mv	a1,a0
	    printf("mmap content: %s\n", array);
    109a:	00001517          	auipc	a0,0x1
    109e:	e9e50513          	addi	a0,a0,-354 # 1f38 <__clone+0xb6>
}
    10a2:	6105                	addi	sp,sp,32
	    printf("mmap content: %s\n", array);
    10a4:	a4bd                	j	1312 <printf>
	    printf("mmap error.\n");
    10a6:	00001517          	auipc	a0,0x1
    10aa:	e7250513          	addi	a0,a0,-398 # 1f18 <__clone+0x96>
    10ae:	264000ef          	jal	ra,1312 <printf>
    close(fd);
    10b2:	8522                	mv	a0,s0
    10b4:	381000ef          	jal	ra,1c34 <close>
    TEST_END(__func__);
    10b8:	00001517          	auipc	a0,0x1
    10bc:	e7050513          	addi	a0,a0,-400 # 1f28 <__clone+0xa6>
    10c0:	230000ef          	jal	ra,12f0 <puts>
    10c4:	00001517          	auipc	a0,0x1
    10c8:	f2c50513          	addi	a0,a0,-212 # 1ff0 <__func__.1193>
    10cc:	224000ef          	jal	ra,12f0 <puts>
}
    10d0:	6442                	ld	s0,16(sp)
    10d2:	60e2                	ld	ra,24(sp)
    10d4:	64a2                	ld	s1,8(sp)
    TEST_END(__func__);
    10d6:	00001517          	auipc	a0,0x1
    10da:	df250513          	addi	a0,a0,-526 # 1ec8 <__clone+0x46>
}
    10de:	6105                	addi	sp,sp,32
    TEST_END(__func__);
    10e0:	ac01                	j	12f0 <puts>

00000000000010e2 <main>:

int main(void){
    10e2:	1141                	addi	sp,sp,-16
    10e4:	e406                	sd	ra,8(sp)
    test_mmap();
    10e6:	f1fff0ef          	jal	ra,1004 <test_mmap>
    return 0;
    10ea:	60a2                	ld	ra,8(sp)
    10ec:	4501                	li	a0,0
    10ee:	0141                	addi	sp,sp,16
    10f0:	8082                	ret

00000000000010f2 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10f2:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10f4:	4108                	lw	a0,0(a0)
{
    10f6:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10f8:	05a1                	addi	a1,a1,8
{
    10fa:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10fc:	fe7ff0ef          	jal	ra,10e2 <main>
    1100:	39b000ef          	jal	ra,1c9a <exit>
	return 0;
}
    1104:	60a2                	ld	ra,8(sp)
    1106:	4501                	li	a0,0
    1108:	0141                	addi	sp,sp,16
    110a:	8082                	ret

000000000000110c <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    110c:	7179                	addi	sp,sp,-48
    110e:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1110:	12054b63          	bltz	a0,1246 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1114:	02b577bb          	remuw	a5,a0,a1
    1118:	00001697          	auipc	a3,0x1
    111c:	ee868693          	addi	a3,a3,-280 # 2000 <digits>
    buf[16] = 0;
    1120:	00010c23          	sb	zero,24(sp)
    i = 15;
    1124:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    1128:	1782                	slli	a5,a5,0x20
    112a:	9381                	srli	a5,a5,0x20
    112c:	97b6                	add	a5,a5,a3
    112e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1132:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1136:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    113a:	16b56263          	bltu	a0,a1,129e <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    113e:	02e8763b          	remuw	a2,a6,a4
    1142:	1602                	slli	a2,a2,0x20
    1144:	9201                	srli	a2,a2,0x20
    1146:	9636                	add	a2,a2,a3
    1148:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    114c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1150:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1154:	12e86963          	bltu	a6,a4,1286 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    1158:	02e5f63b          	remuw	a2,a1,a4
    115c:	1602                	slli	a2,a2,0x20
    115e:	9201                	srli	a2,a2,0x20
    1160:	9636                	add	a2,a2,a3
    1162:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1166:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    116a:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    116e:	10e5ef63          	bltu	a1,a4,128c <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1172:	02e8763b          	remuw	a2,a6,a4
    1176:	1602                	slli	a2,a2,0x20
    1178:	9201                	srli	a2,a2,0x20
    117a:	9636                	add	a2,a2,a3
    117c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1180:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1184:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1188:	10e86563          	bltu	a6,a4,1292 <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    118c:	02e5f63b          	remuw	a2,a1,a4
    1190:	1602                	slli	a2,a2,0x20
    1192:	9201                	srli	a2,a2,0x20
    1194:	9636                	add	a2,a2,a3
    1196:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    119a:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    119e:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11a2:	0ee5eb63          	bltu	a1,a4,1298 <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    11a6:	02e8763b          	remuw	a2,a6,a4
    11aa:	1602                	slli	a2,a2,0x20
    11ac:	9201                	srli	a2,a2,0x20
    11ae:	9636                	add	a2,a2,a3
    11b0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b4:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11b8:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11bc:	0ce86263          	bltu	a6,a4,1280 <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    11c0:	02e5f63b          	remuw	a2,a1,a4
    11c4:	1602                	slli	a2,a2,0x20
    11c6:	9201                	srli	a2,a2,0x20
    11c8:	9636                	add	a2,a2,a3
    11ca:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ce:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11d2:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11d6:	0ce5e663          	bltu	a1,a4,12a2 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    11da:	02e8763b          	remuw	a2,a6,a4
    11de:	1602                	slli	a2,a2,0x20
    11e0:	9201                	srli	a2,a2,0x20
    11e2:	9636                	add	a2,a2,a3
    11e4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11e8:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11ec:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11f0:	0ae86c63          	bltu	a6,a4,12a8 <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    11f4:	02e5f63b          	remuw	a2,a1,a4
    11f8:	1602                	slli	a2,a2,0x20
    11fa:	9201                	srli	a2,a2,0x20
    11fc:	9636                	add	a2,a2,a3
    11fe:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1202:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1206:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    120a:	0ae5e263          	bltu	a1,a4,12ae <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    120e:	1782                	slli	a5,a5,0x20
    1210:	9381                	srli	a5,a5,0x20
    1212:	97b6                	add	a5,a5,a3
    1214:	0007c703          	lbu	a4,0(a5)
    1218:	4599                	li	a1,6
    121a:	4795                	li	a5,5
    121c:	00e10723          	sb	a4,14(sp)

    if (sign)
    1220:	00055963          	bgez	a0,1232 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1224:	1018                	addi	a4,sp,32
    1226:	973e                	add	a4,a4,a5
    1228:	02d00693          	li	a3,45
    122c:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    1230:	85be                	mv	a1,a5
    write(f, s, l);
    1232:	003c                	addi	a5,sp,8
    1234:	4641                	li	a2,16
    1236:	9e0d                	subw	a2,a2,a1
    1238:	4505                	li	a0,1
    123a:	95be                	add	a1,a1,a5
    123c:	20f000ef          	jal	ra,1c4a <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1240:	70a2                	ld	ra,40(sp)
    1242:	6145                	addi	sp,sp,48
    1244:	8082                	ret
        x = -xx;
    1246:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    124a:	02b677bb          	remuw	a5,a2,a1
    124e:	00001697          	auipc	a3,0x1
    1252:	db268693          	addi	a3,a3,-590 # 2000 <digits>
    buf[16] = 0;
    1256:	00010c23          	sb	zero,24(sp)
    i = 15;
    125a:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    125e:	1782                	slli	a5,a5,0x20
    1260:	9381                	srli	a5,a5,0x20
    1262:	97b6                	add	a5,a5,a3
    1264:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1268:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    126c:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1270:	ecb677e3          	bgeu	a2,a1,113e <printint.constprop.0+0x32>
        buf[i--] = '-';
    1274:	02d00793          	li	a5,45
    1278:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    127c:	45b9                	li	a1,14
    127e:	bf55                	j	1232 <printint.constprop.0+0x126>
    1280:	47a5                	li	a5,9
    1282:	45a9                	li	a1,10
    1284:	bf71                	j	1220 <printint.constprop.0+0x114>
    1286:	47b5                	li	a5,13
    1288:	45b9                	li	a1,14
    128a:	bf59                	j	1220 <printint.constprop.0+0x114>
    128c:	47b1                	li	a5,12
    128e:	45b5                	li	a1,13
    1290:	bf41                	j	1220 <printint.constprop.0+0x114>
    1292:	47ad                	li	a5,11
    1294:	45b1                	li	a1,12
    1296:	b769                	j	1220 <printint.constprop.0+0x114>
    1298:	47a9                	li	a5,10
    129a:	45ad                	li	a1,11
    129c:	b751                	j	1220 <printint.constprop.0+0x114>
    i = 15;
    129e:	45bd                	li	a1,15
    12a0:	bf49                	j	1232 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    12a2:	47a1                	li	a5,8
    12a4:	45a5                	li	a1,9
    12a6:	bfad                	j	1220 <printint.constprop.0+0x114>
    12a8:	479d                	li	a5,7
    12aa:	45a1                	li	a1,8
    12ac:	bf95                	j	1220 <printint.constprop.0+0x114>
    12ae:	4799                	li	a5,6
    12b0:	459d                	li	a1,7
    12b2:	b7bd                	j	1220 <printint.constprop.0+0x114>

00000000000012b4 <getchar>:
{
    12b4:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12b6:	00f10593          	addi	a1,sp,15
    12ba:	4605                	li	a2,1
    12bc:	4501                	li	a0,0
{
    12be:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12c0:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12c4:	17d000ef          	jal	ra,1c40 <read>
}
    12c8:	60e2                	ld	ra,24(sp)
    12ca:	00f14503          	lbu	a0,15(sp)
    12ce:	6105                	addi	sp,sp,32
    12d0:	8082                	ret

00000000000012d2 <putchar>:
{
    12d2:	1101                	addi	sp,sp,-32
    12d4:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12d6:	00f10593          	addi	a1,sp,15
    12da:	4605                	li	a2,1
    12dc:	4505                	li	a0,1
{
    12de:	ec06                	sd	ra,24(sp)
    char byte = c;
    12e0:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12e4:	167000ef          	jal	ra,1c4a <write>
}
    12e8:	60e2                	ld	ra,24(sp)
    12ea:	2501                	sext.w	a0,a0
    12ec:	6105                	addi	sp,sp,32
    12ee:	8082                	ret

00000000000012f0 <puts>:
{
    12f0:	1141                	addi	sp,sp,-16
    12f2:	e406                	sd	ra,8(sp)
    12f4:	e022                	sd	s0,0(sp)
    12f6:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12f8:	56e000ef          	jal	ra,1866 <strlen>
    12fc:	862a                	mv	a2,a0
    12fe:	85a2                	mv	a1,s0
    1300:	4505                	li	a0,1
    1302:	149000ef          	jal	ra,1c4a <write>
}
    1306:	60a2                	ld	ra,8(sp)
    1308:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    130a:	957d                	srai	a0,a0,0x3f
    return r;
    130c:	2501                	sext.w	a0,a0
}
    130e:	0141                	addi	sp,sp,16
    1310:	8082                	ret

0000000000001312 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1312:	7171                	addi	sp,sp,-176
    1314:	fc56                	sd	s5,56(sp)
    1316:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1318:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    131a:	18bc                	addi	a5,sp,120
{
    131c:	e8ca                	sd	s2,80(sp)
    131e:	e4ce                	sd	s3,72(sp)
    1320:	e0d2                	sd	s4,64(sp)
    1322:	f85a                	sd	s6,48(sp)
    1324:	f486                	sd	ra,104(sp)
    1326:	f0a2                	sd	s0,96(sp)
    1328:	eca6                	sd	s1,88(sp)
    132a:	fcae                	sd	a1,120(sp)
    132c:	e132                	sd	a2,128(sp)
    132e:	e536                	sd	a3,136(sp)
    1330:	e93a                	sd	a4,144(sp)
    1332:	f142                	sd	a6,160(sp)
    1334:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1336:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1338:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    133c:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1340:	00001b17          	auipc	s6,0x1
    1344:	c10b0b13          	addi	s6,s6,-1008 # 1f50 <__clone+0xce>
    buf[i++] = '0';
    1348:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    134c:	00001997          	auipc	s3,0x1
    1350:	cb498993          	addi	s3,s3,-844 # 2000 <digits>
        if (!*s)
    1354:	00054783          	lbu	a5,0(a0)
    1358:	16078a63          	beqz	a5,14cc <printf+0x1ba>
    135c:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    135e:	19278163          	beq	a5,s2,14e0 <printf+0x1ce>
    1362:	00164783          	lbu	a5,1(a2)
    1366:	0605                	addi	a2,a2,1
    1368:	fbfd                	bnez	a5,135e <printf+0x4c>
    136a:	84b2                	mv	s1,a2
        l = z - a;
    136c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1370:	85aa                	mv	a1,a0
    1372:	8622                	mv	a2,s0
    1374:	4505                	li	a0,1
    1376:	0d5000ef          	jal	ra,1c4a <write>
        if (l)
    137a:	18041c63          	bnez	s0,1512 <printf+0x200>
        if (s[1] == 0)
    137e:	0014c783          	lbu	a5,1(s1)
    1382:	14078563          	beqz	a5,14cc <printf+0x1ba>
        switch (s[1])
    1386:	1d478063          	beq	a5,s4,1546 <printf+0x234>
    138a:	18fa6663          	bltu	s4,a5,1516 <printf+0x204>
    138e:	06400713          	li	a4,100
    1392:	1ae78063          	beq	a5,a4,1532 <printf+0x220>
    1396:	07000713          	li	a4,112
    139a:	1ce79963          	bne	a5,a4,156c <printf+0x25a>
            printptr(va_arg(ap, uint64));
    139e:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13a0:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13a4:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13a6:	631c                	ld	a5,0(a4)
    13a8:	0721                	addi	a4,a4,8
    13aa:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13ac:	00479293          	slli	t0,a5,0x4
    13b0:	00879f93          	slli	t6,a5,0x8
    13b4:	00c79f13          	slli	t5,a5,0xc
    13b8:	01079e93          	slli	t4,a5,0x10
    13bc:	01479e13          	slli	t3,a5,0x14
    13c0:	01879313          	slli	t1,a5,0x18
    13c4:	01c79893          	slli	a7,a5,0x1c
    13c8:	02479813          	slli	a6,a5,0x24
    13cc:	02879513          	slli	a0,a5,0x28
    13d0:	02c79593          	slli	a1,a5,0x2c
    13d4:	03079693          	slli	a3,a5,0x30
    13d8:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13dc:	03c7d413          	srli	s0,a5,0x3c
    13e0:	01c7d39b          	srliw	t2,a5,0x1c
    13e4:	03c2d293          	srli	t0,t0,0x3c
    13e8:	03cfdf93          	srli	t6,t6,0x3c
    13ec:	03cf5f13          	srli	t5,t5,0x3c
    13f0:	03cede93          	srli	t4,t4,0x3c
    13f4:	03ce5e13          	srli	t3,t3,0x3c
    13f8:	03c35313          	srli	t1,t1,0x3c
    13fc:	03c8d893          	srli	a7,a7,0x3c
    1400:	03c85813          	srli	a6,a6,0x3c
    1404:	9171                	srli	a0,a0,0x3c
    1406:	91f1                	srli	a1,a1,0x3c
    1408:	92f1                	srli	a3,a3,0x3c
    140a:	9371                	srli	a4,a4,0x3c
    140c:	96ce                	add	a3,a3,s3
    140e:	974e                	add	a4,a4,s3
    1410:	944e                	add	s0,s0,s3
    1412:	92ce                	add	t0,t0,s3
    1414:	9fce                	add	t6,t6,s3
    1416:	9f4e                	add	t5,t5,s3
    1418:	9ece                	add	t4,t4,s3
    141a:	9e4e                	add	t3,t3,s3
    141c:	934e                	add	t1,t1,s3
    141e:	98ce                	add	a7,a7,s3
    1420:	93ce                	add	t2,t2,s3
    1422:	984e                	add	a6,a6,s3
    1424:	954e                	add	a0,a0,s3
    1426:	95ce                	add	a1,a1,s3
    1428:	0006c083          	lbu	ra,0(a3)
    142c:	0002c283          	lbu	t0,0(t0)
    1430:	00074683          	lbu	a3,0(a4)
    1434:	000fcf83          	lbu	t6,0(t6)
    1438:	000f4f03          	lbu	t5,0(t5)
    143c:	000ece83          	lbu	t4,0(t4)
    1440:	000e4e03          	lbu	t3,0(t3)
    1444:	00034303          	lbu	t1,0(t1)
    1448:	0008c883          	lbu	a7,0(a7)
    144c:	0003c383          	lbu	t2,0(t2)
    1450:	00084803          	lbu	a6,0(a6)
    1454:	00054503          	lbu	a0,0(a0)
    1458:	0005c583          	lbu	a1,0(a1)
    145c:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1460:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1464:	9371                	srli	a4,a4,0x3c
    1466:	8bbd                	andi	a5,a5,15
    1468:	974e                	add	a4,a4,s3
    146a:	97ce                	add	a5,a5,s3
    146c:	005105a3          	sb	t0,11(sp)
    1470:	01f10623          	sb	t6,12(sp)
    1474:	01e106a3          	sb	t5,13(sp)
    1478:	01d10723          	sb	t4,14(sp)
    147c:	01c107a3          	sb	t3,15(sp)
    1480:	00610823          	sb	t1,16(sp)
    1484:	011108a3          	sb	a7,17(sp)
    1488:	00710923          	sb	t2,18(sp)
    148c:	010109a3          	sb	a6,19(sp)
    1490:	00a10a23          	sb	a0,20(sp)
    1494:	00b10aa3          	sb	a1,21(sp)
    1498:	00110b23          	sb	ra,22(sp)
    149c:	00d10ba3          	sb	a3,23(sp)
    14a0:	00810523          	sb	s0,10(sp)
    14a4:	00074703          	lbu	a4,0(a4)
    14a8:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14ac:	002c                	addi	a1,sp,8
    14ae:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14b0:	00e10c23          	sb	a4,24(sp)
    14b4:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14b8:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14bc:	78e000ef          	jal	ra,1c4a <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14c0:	00248513          	addi	a0,s1,2
        if (!*s)
    14c4:	00054783          	lbu	a5,0(a0)
    14c8:	e8079ae3          	bnez	a5,135c <printf+0x4a>
    }
    va_end(ap);
}
    14cc:	70a6                	ld	ra,104(sp)
    14ce:	7406                	ld	s0,96(sp)
    14d0:	64e6                	ld	s1,88(sp)
    14d2:	6946                	ld	s2,80(sp)
    14d4:	69a6                	ld	s3,72(sp)
    14d6:	6a06                	ld	s4,64(sp)
    14d8:	7ae2                	ld	s5,56(sp)
    14da:	7b42                	ld	s6,48(sp)
    14dc:	614d                	addi	sp,sp,176
    14de:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14e0:	00064783          	lbu	a5,0(a2)
    14e4:	84b2                	mv	s1,a2
    14e6:	01278963          	beq	a5,s2,14f8 <printf+0x1e6>
    14ea:	b549                	j	136c <printf+0x5a>
    14ec:	0024c783          	lbu	a5,2(s1)
    14f0:	0605                	addi	a2,a2,1
    14f2:	0489                	addi	s1,s1,2
    14f4:	e7279ce3          	bne	a5,s2,136c <printf+0x5a>
    14f8:	0014c783          	lbu	a5,1(s1)
    14fc:	ff2788e3          	beq	a5,s2,14ec <printf+0x1da>
        l = z - a;
    1500:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1504:	85aa                	mv	a1,a0
    1506:	8622                	mv	a2,s0
    1508:	4505                	li	a0,1
    150a:	740000ef          	jal	ra,1c4a <write>
        if (l)
    150e:	e60408e3          	beqz	s0,137e <printf+0x6c>
    1512:	8526                	mv	a0,s1
    1514:	b581                	j	1354 <printf+0x42>
        switch (s[1])
    1516:	07800713          	li	a4,120
    151a:	04e79963          	bne	a5,a4,156c <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    151e:	6782                	ld	a5,0(sp)
    1520:	45c1                	li	a1,16
    1522:	4388                	lw	a0,0(a5)
    1524:	07a1                	addi	a5,a5,8
    1526:	e03e                	sd	a5,0(sp)
    1528:	be5ff0ef          	jal	ra,110c <printint.constprop.0>
        s += 2;
    152c:	00248513          	addi	a0,s1,2
    1530:	bf51                	j	14c4 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    1532:	6782                	ld	a5,0(sp)
    1534:	45a9                	li	a1,10
    1536:	4388                	lw	a0,0(a5)
    1538:	07a1                	addi	a5,a5,8
    153a:	e03e                	sd	a5,0(sp)
    153c:	bd1ff0ef          	jal	ra,110c <printint.constprop.0>
        s += 2;
    1540:	00248513          	addi	a0,s1,2
    1544:	b741                	j	14c4 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1546:	6782                	ld	a5,0(sp)
    1548:	6380                	ld	s0,0(a5)
    154a:	07a1                	addi	a5,a5,8
    154c:	e03e                	sd	a5,0(sp)
    154e:	c421                	beqz	s0,1596 <printf+0x284>
            l = strnlen(a, 200);
    1550:	0c800593          	li	a1,200
    1554:	8522                	mv	a0,s0
    1556:	3fc000ef          	jal	ra,1952 <strnlen>
    write(f, s, l);
    155a:	0005061b          	sext.w	a2,a0
    155e:	85a2                	mv	a1,s0
    1560:	4505                	li	a0,1
    1562:	6e8000ef          	jal	ra,1c4a <write>
        s += 2;
    1566:	00248513          	addi	a0,s1,2
    156a:	bfa9                	j	14c4 <printf+0x1b2>
    char byte = c;
    156c:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1570:	4605                	li	a2,1
    1572:	002c                	addi	a1,sp,8
    1574:	4505                	li	a0,1
    char byte = c;
    1576:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    157a:	6d0000ef          	jal	ra,1c4a <write>
    char byte = c;
    157e:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1582:	4605                	li	a2,1
    1584:	002c                	addi	a1,sp,8
    1586:	4505                	li	a0,1
    char byte = c;
    1588:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    158c:	6be000ef          	jal	ra,1c4a <write>
        s += 2;
    1590:	00248513          	addi	a0,s1,2
    1594:	bf05                	j	14c4 <printf+0x1b2>
                a = "(null)";
    1596:	845a                	mv	s0,s6
    1598:	bf65                	j	1550 <printf+0x23e>

000000000000159a <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    159a:	02000793          	li	a5,32
    159e:	00f50663          	beq	a0,a5,15aa <isspace+0x10>
    15a2:	355d                	addiw	a0,a0,-9
    15a4:	00553513          	sltiu	a0,a0,5
    15a8:	8082                	ret
    15aa:	4505                	li	a0,1
}
    15ac:	8082                	ret

00000000000015ae <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15ae:	fd05051b          	addiw	a0,a0,-48
}
    15b2:	00a53513          	sltiu	a0,a0,10
    15b6:	8082                	ret

00000000000015b8 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b8:	02000613          	li	a2,32
    15bc:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15be:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c2:	ff77069b          	addiw	a3,a4,-9
    15c6:	04c70d63          	beq	a4,a2,1620 <atoi+0x68>
    15ca:	0007079b          	sext.w	a5,a4
    15ce:	04d5f963          	bgeu	a1,a3,1620 <atoi+0x68>
        s++;
    switch (*s)
    15d2:	02b00693          	li	a3,43
    15d6:	04d70a63          	beq	a4,a3,162a <atoi+0x72>
    15da:	02d00693          	li	a3,45
    15de:	06d70463          	beq	a4,a3,1646 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15e2:	fd07859b          	addiw	a1,a5,-48
    15e6:	4625                	li	a2,9
    15e8:	873e                	mv	a4,a5
    15ea:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15ec:	4e01                	li	t3,0
    while (isdigit(*s))
    15ee:	04b66a63          	bltu	a2,a1,1642 <atoi+0x8a>
    int n = 0, neg = 0;
    15f2:	4501                	li	a0,0
    while (isdigit(*s))
    15f4:	4825                	li	a6,9
    15f6:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    15fa:	0025179b          	slliw	a5,a0,0x2
    15fe:	9d3d                	addw	a0,a0,a5
    1600:	fd07031b          	addiw	t1,a4,-48
    1604:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1608:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    160c:	0685                	addi	a3,a3,1
    160e:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1612:	0006071b          	sext.w	a4,a2
    1616:	feb870e3          	bgeu	a6,a1,15f6 <atoi+0x3e>
    return neg ? n : -n;
    161a:	000e0563          	beqz	t3,1624 <atoi+0x6c>
}
    161e:	8082                	ret
        s++;
    1620:	0505                	addi	a0,a0,1
    1622:	bf71                	j	15be <atoi+0x6>
    1624:	4113053b          	subw	a0,t1,a7
    1628:	8082                	ret
    while (isdigit(*s))
    162a:	00154783          	lbu	a5,1(a0)
    162e:	4625                	li	a2,9
        s++;
    1630:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1634:	fd07859b          	addiw	a1,a5,-48
    1638:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    163c:	4e01                	li	t3,0
    while (isdigit(*s))
    163e:	fab67ae3          	bgeu	a2,a1,15f2 <atoi+0x3a>
    1642:	4501                	li	a0,0
}
    1644:	8082                	ret
    while (isdigit(*s))
    1646:	00154783          	lbu	a5,1(a0)
    164a:	4625                	li	a2,9
        s++;
    164c:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1650:	fd07859b          	addiw	a1,a5,-48
    1654:	0007871b          	sext.w	a4,a5
    1658:	feb665e3          	bltu	a2,a1,1642 <atoi+0x8a>
        neg = 1;
    165c:	4e05                	li	t3,1
    165e:	bf51                	j	15f2 <atoi+0x3a>

0000000000001660 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1660:	16060d63          	beqz	a2,17da <memset+0x17a>
    1664:	40a007b3          	neg	a5,a0
    1668:	8b9d                	andi	a5,a5,7
    166a:	00778713          	addi	a4,a5,7
    166e:	482d                	li	a6,11
    1670:	0ff5f593          	andi	a1,a1,255
    1674:	fff60693          	addi	a3,a2,-1
    1678:	17076263          	bltu	a4,a6,17dc <memset+0x17c>
    167c:	16e6ea63          	bltu	a3,a4,17f0 <memset+0x190>
    1680:	16078563          	beqz	a5,17ea <memset+0x18a>
    1684:	00b50023          	sb	a1,0(a0)
    1688:	4705                	li	a4,1
    168a:	00150e93          	addi	t4,a0,1
    168e:	14e78c63          	beq	a5,a4,17e6 <memset+0x186>
    1692:	00b500a3          	sb	a1,1(a0)
    1696:	4709                	li	a4,2
    1698:	00250e93          	addi	t4,a0,2
    169c:	14e78d63          	beq	a5,a4,17f6 <memset+0x196>
    16a0:	00b50123          	sb	a1,2(a0)
    16a4:	470d                	li	a4,3
    16a6:	00350e93          	addi	t4,a0,3
    16aa:	12e78b63          	beq	a5,a4,17e0 <memset+0x180>
    16ae:	00b501a3          	sb	a1,3(a0)
    16b2:	4711                	li	a4,4
    16b4:	00450e93          	addi	t4,a0,4
    16b8:	14e78163          	beq	a5,a4,17fa <memset+0x19a>
    16bc:	00b50223          	sb	a1,4(a0)
    16c0:	4715                	li	a4,5
    16c2:	00550e93          	addi	t4,a0,5
    16c6:	12e78c63          	beq	a5,a4,17fe <memset+0x19e>
    16ca:	00b502a3          	sb	a1,5(a0)
    16ce:	471d                	li	a4,7
    16d0:	00650e93          	addi	t4,a0,6
    16d4:	12e79763          	bne	a5,a4,1802 <memset+0x1a2>
    16d8:	00750e93          	addi	t4,a0,7
    16dc:	00b50323          	sb	a1,6(a0)
    16e0:	4f1d                	li	t5,7
    16e2:	00859713          	slli	a4,a1,0x8
    16e6:	8f4d                	or	a4,a4,a1
    16e8:	01059e13          	slli	t3,a1,0x10
    16ec:	01c76e33          	or	t3,a4,t3
    16f0:	01859313          	slli	t1,a1,0x18
    16f4:	006e6333          	or	t1,t3,t1
    16f8:	02059893          	slli	a7,a1,0x20
    16fc:	011368b3          	or	a7,t1,a7
    1700:	02859813          	slli	a6,a1,0x28
    1704:	40f60333          	sub	t1,a2,a5
    1708:	0108e833          	or	a6,a7,a6
    170c:	03059693          	slli	a3,a1,0x30
    1710:	00d866b3          	or	a3,a6,a3
    1714:	03859713          	slli	a4,a1,0x38
    1718:	97aa                	add	a5,a5,a0
    171a:	ff837813          	andi	a6,t1,-8
    171e:	8f55                	or	a4,a4,a3
    1720:	00f806b3          	add	a3,a6,a5
    1724:	e398                	sd	a4,0(a5)
    1726:	07a1                	addi	a5,a5,8
    1728:	fed79ee3          	bne	a5,a3,1724 <memset+0xc4>
    172c:	ff837693          	andi	a3,t1,-8
    1730:	00de87b3          	add	a5,t4,a3
    1734:	01e6873b          	addw	a4,a3,t5
    1738:	0ad30663          	beq	t1,a3,17e4 <memset+0x184>
    173c:	00b78023          	sb	a1,0(a5)
    1740:	0017069b          	addiw	a3,a4,1
    1744:	08c6fb63          	bgeu	a3,a2,17da <memset+0x17a>
    1748:	00b780a3          	sb	a1,1(a5)
    174c:	0027069b          	addiw	a3,a4,2
    1750:	08c6f563          	bgeu	a3,a2,17da <memset+0x17a>
    1754:	00b78123          	sb	a1,2(a5)
    1758:	0037069b          	addiw	a3,a4,3
    175c:	06c6ff63          	bgeu	a3,a2,17da <memset+0x17a>
    1760:	00b781a3          	sb	a1,3(a5)
    1764:	0047069b          	addiw	a3,a4,4
    1768:	06c6f963          	bgeu	a3,a2,17da <memset+0x17a>
    176c:	00b78223          	sb	a1,4(a5)
    1770:	0057069b          	addiw	a3,a4,5
    1774:	06c6f363          	bgeu	a3,a2,17da <memset+0x17a>
    1778:	00b782a3          	sb	a1,5(a5)
    177c:	0067069b          	addiw	a3,a4,6
    1780:	04c6fd63          	bgeu	a3,a2,17da <memset+0x17a>
    1784:	00b78323          	sb	a1,6(a5)
    1788:	0077069b          	addiw	a3,a4,7
    178c:	04c6f763          	bgeu	a3,a2,17da <memset+0x17a>
    1790:	00b783a3          	sb	a1,7(a5)
    1794:	0087069b          	addiw	a3,a4,8
    1798:	04c6f163          	bgeu	a3,a2,17da <memset+0x17a>
    179c:	00b78423          	sb	a1,8(a5)
    17a0:	0097069b          	addiw	a3,a4,9
    17a4:	02c6fb63          	bgeu	a3,a2,17da <memset+0x17a>
    17a8:	00b784a3          	sb	a1,9(a5)
    17ac:	00a7069b          	addiw	a3,a4,10
    17b0:	02c6f563          	bgeu	a3,a2,17da <memset+0x17a>
    17b4:	00b78523          	sb	a1,10(a5)
    17b8:	00b7069b          	addiw	a3,a4,11
    17bc:	00c6ff63          	bgeu	a3,a2,17da <memset+0x17a>
    17c0:	00b785a3          	sb	a1,11(a5)
    17c4:	00c7069b          	addiw	a3,a4,12
    17c8:	00c6f963          	bgeu	a3,a2,17da <memset+0x17a>
    17cc:	00b78623          	sb	a1,12(a5)
    17d0:	2735                	addiw	a4,a4,13
    17d2:	00c77463          	bgeu	a4,a2,17da <memset+0x17a>
    17d6:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17da:	8082                	ret
    17dc:	472d                	li	a4,11
    17de:	bd79                	j	167c <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17e0:	4f0d                	li	t5,3
    17e2:	b701                	j	16e2 <memset+0x82>
    17e4:	8082                	ret
    17e6:	4f05                	li	t5,1
    17e8:	bded                	j	16e2 <memset+0x82>
    17ea:	8eaa                	mv	t4,a0
    17ec:	4f01                	li	t5,0
    17ee:	bdd5                	j	16e2 <memset+0x82>
    17f0:	87aa                	mv	a5,a0
    17f2:	4701                	li	a4,0
    17f4:	b7a1                	j	173c <memset+0xdc>
    17f6:	4f09                	li	t5,2
    17f8:	b5ed                	j	16e2 <memset+0x82>
    17fa:	4f11                	li	t5,4
    17fc:	b5dd                	j	16e2 <memset+0x82>
    17fe:	4f15                	li	t5,5
    1800:	b5cd                	j	16e2 <memset+0x82>
    1802:	4f19                	li	t5,6
    1804:	bdf9                	j	16e2 <memset+0x82>

0000000000001806 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1806:	00054783          	lbu	a5,0(a0)
    180a:	0005c703          	lbu	a4,0(a1)
    180e:	00e79863          	bne	a5,a4,181e <strcmp+0x18>
    1812:	0505                	addi	a0,a0,1
    1814:	0585                	addi	a1,a1,1
    1816:	fbe5                	bnez	a5,1806 <strcmp>
    1818:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    181a:	9d19                	subw	a0,a0,a4
    181c:	8082                	ret
    181e:	0007851b          	sext.w	a0,a5
    1822:	bfe5                	j	181a <strcmp+0x14>

0000000000001824 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1824:	ce05                	beqz	a2,185c <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1826:	00054703          	lbu	a4,0(a0)
    182a:	0005c783          	lbu	a5,0(a1)
    182e:	cb0d                	beqz	a4,1860 <strncmp+0x3c>
    if (!n--)
    1830:	167d                	addi	a2,a2,-1
    1832:	00c506b3          	add	a3,a0,a2
    1836:	a819                	j	184c <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1838:	00a68e63          	beq	a3,a0,1854 <strncmp+0x30>
    183c:	0505                	addi	a0,a0,1
    183e:	00e79b63          	bne	a5,a4,1854 <strncmp+0x30>
    1842:	00054703          	lbu	a4,0(a0)
    1846:	0005c783          	lbu	a5,0(a1)
    184a:	cb19                	beqz	a4,1860 <strncmp+0x3c>
    184c:	0005c783          	lbu	a5,0(a1)
    1850:	0585                	addi	a1,a1,1
    1852:	f3fd                	bnez	a5,1838 <strncmp+0x14>
        ;
    return *l - *r;
    1854:	0007051b          	sext.w	a0,a4
    1858:	9d1d                	subw	a0,a0,a5
    185a:	8082                	ret
        return 0;
    185c:	4501                	li	a0,0
}
    185e:	8082                	ret
    1860:	4501                	li	a0,0
    return *l - *r;
    1862:	9d1d                	subw	a0,a0,a5
    1864:	8082                	ret

0000000000001866 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1866:	00757793          	andi	a5,a0,7
    186a:	cf89                	beqz	a5,1884 <strlen+0x1e>
    186c:	87aa                	mv	a5,a0
    186e:	a029                	j	1878 <strlen+0x12>
    1870:	0785                	addi	a5,a5,1
    1872:	0077f713          	andi	a4,a5,7
    1876:	cb01                	beqz	a4,1886 <strlen+0x20>
        if (!*s)
    1878:	0007c703          	lbu	a4,0(a5)
    187c:	fb75                	bnez	a4,1870 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    187e:	40a78533          	sub	a0,a5,a0
}
    1882:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1884:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1886:	6394                	ld	a3,0(a5)
    1888:	00000597          	auipc	a1,0x0
    188c:	6d05b583          	ld	a1,1744(a1) # 1f58 <__clone+0xd6>
    1890:	00000617          	auipc	a2,0x0
    1894:	6d063603          	ld	a2,1744(a2) # 1f60 <__clone+0xde>
    1898:	a019                	j	189e <strlen+0x38>
    189a:	6794                	ld	a3,8(a5)
    189c:	07a1                	addi	a5,a5,8
    189e:	00b68733          	add	a4,a3,a1
    18a2:	fff6c693          	not	a3,a3
    18a6:	8f75                	and	a4,a4,a3
    18a8:	8f71                	and	a4,a4,a2
    18aa:	db65                	beqz	a4,189a <strlen+0x34>
    for (; *s; s++)
    18ac:	0007c703          	lbu	a4,0(a5)
    18b0:	d779                	beqz	a4,187e <strlen+0x18>
    18b2:	0017c703          	lbu	a4,1(a5)
    18b6:	0785                	addi	a5,a5,1
    18b8:	d379                	beqz	a4,187e <strlen+0x18>
    18ba:	0017c703          	lbu	a4,1(a5)
    18be:	0785                	addi	a5,a5,1
    18c0:	fb6d                	bnez	a4,18b2 <strlen+0x4c>
    18c2:	bf75                	j	187e <strlen+0x18>

00000000000018c4 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18c4:	00757713          	andi	a4,a0,7
{
    18c8:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18ca:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ce:	cb19                	beqz	a4,18e4 <memchr+0x20>
    18d0:	ce25                	beqz	a2,1948 <memchr+0x84>
    18d2:	0007c703          	lbu	a4,0(a5)
    18d6:	04b70e63          	beq	a4,a1,1932 <memchr+0x6e>
    18da:	0785                	addi	a5,a5,1
    18dc:	0077f713          	andi	a4,a5,7
    18e0:	167d                	addi	a2,a2,-1
    18e2:	f77d                	bnez	a4,18d0 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18e4:	4501                	li	a0,0
    if (n && *s != c)
    18e6:	c235                	beqz	a2,194a <memchr+0x86>
    18e8:	0007c703          	lbu	a4,0(a5)
    18ec:	04b70363          	beq	a4,a1,1932 <memchr+0x6e>
        size_t k = ONES * c;
    18f0:	00000517          	auipc	a0,0x0
    18f4:	67853503          	ld	a0,1656(a0) # 1f68 <__clone+0xe6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18f8:	471d                	li	a4,7
        size_t k = ONES * c;
    18fa:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18fe:	02c77a63          	bgeu	a4,a2,1932 <memchr+0x6e>
    1902:	00000897          	auipc	a7,0x0
    1906:	6568b883          	ld	a7,1622(a7) # 1f58 <__clone+0xd6>
    190a:	00000817          	auipc	a6,0x0
    190e:	65683803          	ld	a6,1622(a6) # 1f60 <__clone+0xde>
    1912:	431d                	li	t1,7
    1914:	a029                	j	191e <memchr+0x5a>
    1916:	1661                	addi	a2,a2,-8
    1918:	07a1                	addi	a5,a5,8
    191a:	02c37963          	bgeu	t1,a2,194c <memchr+0x88>
    191e:	6398                	ld	a4,0(a5)
    1920:	8f29                	xor	a4,a4,a0
    1922:	011706b3          	add	a3,a4,a7
    1926:	fff74713          	not	a4,a4
    192a:	8f75                	and	a4,a4,a3
    192c:	01077733          	and	a4,a4,a6
    1930:	d37d                	beqz	a4,1916 <memchr+0x52>
    1932:	853e                	mv	a0,a5
    1934:	97b2                	add	a5,a5,a2
    1936:	a021                	j	193e <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1938:	0505                	addi	a0,a0,1
    193a:	00f50763          	beq	a0,a5,1948 <memchr+0x84>
    193e:	00054703          	lbu	a4,0(a0)
    1942:	feb71be3          	bne	a4,a1,1938 <memchr+0x74>
    1946:	8082                	ret
    return n ? (void *)s : 0;
    1948:	4501                	li	a0,0
}
    194a:	8082                	ret
    return n ? (void *)s : 0;
    194c:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    194e:	f275                	bnez	a2,1932 <memchr+0x6e>
}
    1950:	8082                	ret

0000000000001952 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1952:	1101                	addi	sp,sp,-32
    1954:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1956:	862e                	mv	a2,a1
{
    1958:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    195a:	4581                	li	a1,0
{
    195c:	e426                	sd	s1,8(sp)
    195e:	ec06                	sd	ra,24(sp)
    1960:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1962:	f63ff0ef          	jal	ra,18c4 <memchr>
    return p ? p - s : n;
    1966:	c519                	beqz	a0,1974 <strnlen+0x22>
}
    1968:	60e2                	ld	ra,24(sp)
    196a:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    196c:	8d05                	sub	a0,a0,s1
}
    196e:	64a2                	ld	s1,8(sp)
    1970:	6105                	addi	sp,sp,32
    1972:	8082                	ret
    1974:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1976:	8522                	mv	a0,s0
}
    1978:	6442                	ld	s0,16(sp)
    197a:	64a2                	ld	s1,8(sp)
    197c:	6105                	addi	sp,sp,32
    197e:	8082                	ret

0000000000001980 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1980:	00b547b3          	xor	a5,a0,a1
    1984:	8b9d                	andi	a5,a5,7
    1986:	eb95                	bnez	a5,19ba <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1988:	0075f793          	andi	a5,a1,7
    198c:	e7b1                	bnez	a5,19d8 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    198e:	6198                	ld	a4,0(a1)
    1990:	00000617          	auipc	a2,0x0
    1994:	5c863603          	ld	a2,1480(a2) # 1f58 <__clone+0xd6>
    1998:	00000817          	auipc	a6,0x0
    199c:	5c883803          	ld	a6,1480(a6) # 1f60 <__clone+0xde>
    19a0:	a029                	j	19aa <strcpy+0x2a>
    19a2:	e118                	sd	a4,0(a0)
    19a4:	6598                	ld	a4,8(a1)
    19a6:	05a1                	addi	a1,a1,8
    19a8:	0521                	addi	a0,a0,8
    19aa:	00c707b3          	add	a5,a4,a2
    19ae:	fff74693          	not	a3,a4
    19b2:	8ff5                	and	a5,a5,a3
    19b4:	0107f7b3          	and	a5,a5,a6
    19b8:	d7ed                	beqz	a5,19a2 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19ba:	0005c783          	lbu	a5,0(a1)
    19be:	00f50023          	sb	a5,0(a0)
    19c2:	c785                	beqz	a5,19ea <strcpy+0x6a>
    19c4:	0015c783          	lbu	a5,1(a1)
    19c8:	0505                	addi	a0,a0,1
    19ca:	0585                	addi	a1,a1,1
    19cc:	00f50023          	sb	a5,0(a0)
    19d0:	fbf5                	bnez	a5,19c4 <strcpy+0x44>
        ;
    return d;
}
    19d2:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19d4:	0505                	addi	a0,a0,1
    19d6:	df45                	beqz	a4,198e <strcpy+0xe>
            if (!(*d = *s))
    19d8:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19dc:	0585                	addi	a1,a1,1
    19de:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    19e2:	00f50023          	sb	a5,0(a0)
    19e6:	f7fd                	bnez	a5,19d4 <strcpy+0x54>
}
    19e8:	8082                	ret
    19ea:	8082                	ret

00000000000019ec <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19ec:	00b547b3          	xor	a5,a0,a1
    19f0:	8b9d                	andi	a5,a5,7
    19f2:	1a079863          	bnez	a5,1ba2 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19f6:	0075f793          	andi	a5,a1,7
    19fa:	16078463          	beqz	a5,1b62 <strncpy+0x176>
    19fe:	ea01                	bnez	a2,1a0e <strncpy+0x22>
    1a00:	a421                	j	1c08 <strncpy+0x21c>
    1a02:	167d                	addi	a2,a2,-1
    1a04:	0505                	addi	a0,a0,1
    1a06:	14070e63          	beqz	a4,1b62 <strncpy+0x176>
    1a0a:	1a060863          	beqz	a2,1bba <strncpy+0x1ce>
    1a0e:	0005c783          	lbu	a5,0(a1)
    1a12:	0585                	addi	a1,a1,1
    1a14:	0075f713          	andi	a4,a1,7
    1a18:	00f50023          	sb	a5,0(a0)
    1a1c:	f3fd                	bnez	a5,1a02 <strncpy+0x16>
    1a1e:	4805                	li	a6,1
    1a20:	1a061863          	bnez	a2,1bd0 <strncpy+0x1e4>
    1a24:	40a007b3          	neg	a5,a0
    1a28:	8b9d                	andi	a5,a5,7
    1a2a:	4681                	li	a3,0
    1a2c:	18061a63          	bnez	a2,1bc0 <strncpy+0x1d4>
    1a30:	00778713          	addi	a4,a5,7
    1a34:	45ad                	li	a1,11
    1a36:	18b76363          	bltu	a4,a1,1bbc <strncpy+0x1d0>
    1a3a:	1ae6eb63          	bltu	a3,a4,1bf0 <strncpy+0x204>
    1a3e:	1a078363          	beqz	a5,1be4 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a42:	00050023          	sb	zero,0(a0)
    1a46:	4685                	li	a3,1
    1a48:	00150713          	addi	a4,a0,1
    1a4c:	18d78f63          	beq	a5,a3,1bea <strncpy+0x1fe>
    1a50:	000500a3          	sb	zero,1(a0)
    1a54:	4689                	li	a3,2
    1a56:	00250713          	addi	a4,a0,2
    1a5a:	18d78e63          	beq	a5,a3,1bf6 <strncpy+0x20a>
    1a5e:	00050123          	sb	zero,2(a0)
    1a62:	468d                	li	a3,3
    1a64:	00350713          	addi	a4,a0,3
    1a68:	16d78c63          	beq	a5,a3,1be0 <strncpy+0x1f4>
    1a6c:	000501a3          	sb	zero,3(a0)
    1a70:	4691                	li	a3,4
    1a72:	00450713          	addi	a4,a0,4
    1a76:	18d78263          	beq	a5,a3,1bfa <strncpy+0x20e>
    1a7a:	00050223          	sb	zero,4(a0)
    1a7e:	4695                	li	a3,5
    1a80:	00550713          	addi	a4,a0,5
    1a84:	16d78d63          	beq	a5,a3,1bfe <strncpy+0x212>
    1a88:	000502a3          	sb	zero,5(a0)
    1a8c:	469d                	li	a3,7
    1a8e:	00650713          	addi	a4,a0,6
    1a92:	16d79863          	bne	a5,a3,1c02 <strncpy+0x216>
    1a96:	00750713          	addi	a4,a0,7
    1a9a:	00050323          	sb	zero,6(a0)
    1a9e:	40f80833          	sub	a6,a6,a5
    1aa2:	ff887593          	andi	a1,a6,-8
    1aa6:	97aa                	add	a5,a5,a0
    1aa8:	95be                	add	a1,a1,a5
    1aaa:	0007b023          	sd	zero,0(a5)
    1aae:	07a1                	addi	a5,a5,8
    1ab0:	feb79de3          	bne	a5,a1,1aaa <strncpy+0xbe>
    1ab4:	ff887593          	andi	a1,a6,-8
    1ab8:	9ead                	addw	a3,a3,a1
    1aba:	00b707b3          	add	a5,a4,a1
    1abe:	12b80863          	beq	a6,a1,1bee <strncpy+0x202>
    1ac2:	00078023          	sb	zero,0(a5)
    1ac6:	0016871b          	addiw	a4,a3,1
    1aca:	0ec77863          	bgeu	a4,a2,1bba <strncpy+0x1ce>
    1ace:	000780a3          	sb	zero,1(a5)
    1ad2:	0026871b          	addiw	a4,a3,2
    1ad6:	0ec77263          	bgeu	a4,a2,1bba <strncpy+0x1ce>
    1ada:	00078123          	sb	zero,2(a5)
    1ade:	0036871b          	addiw	a4,a3,3
    1ae2:	0cc77c63          	bgeu	a4,a2,1bba <strncpy+0x1ce>
    1ae6:	000781a3          	sb	zero,3(a5)
    1aea:	0046871b          	addiw	a4,a3,4
    1aee:	0cc77663          	bgeu	a4,a2,1bba <strncpy+0x1ce>
    1af2:	00078223          	sb	zero,4(a5)
    1af6:	0056871b          	addiw	a4,a3,5
    1afa:	0cc77063          	bgeu	a4,a2,1bba <strncpy+0x1ce>
    1afe:	000782a3          	sb	zero,5(a5)
    1b02:	0066871b          	addiw	a4,a3,6
    1b06:	0ac77a63          	bgeu	a4,a2,1bba <strncpy+0x1ce>
    1b0a:	00078323          	sb	zero,6(a5)
    1b0e:	0076871b          	addiw	a4,a3,7
    1b12:	0ac77463          	bgeu	a4,a2,1bba <strncpy+0x1ce>
    1b16:	000783a3          	sb	zero,7(a5)
    1b1a:	0086871b          	addiw	a4,a3,8
    1b1e:	08c77e63          	bgeu	a4,a2,1bba <strncpy+0x1ce>
    1b22:	00078423          	sb	zero,8(a5)
    1b26:	0096871b          	addiw	a4,a3,9
    1b2a:	08c77863          	bgeu	a4,a2,1bba <strncpy+0x1ce>
    1b2e:	000784a3          	sb	zero,9(a5)
    1b32:	00a6871b          	addiw	a4,a3,10
    1b36:	08c77263          	bgeu	a4,a2,1bba <strncpy+0x1ce>
    1b3a:	00078523          	sb	zero,10(a5)
    1b3e:	00b6871b          	addiw	a4,a3,11
    1b42:	06c77c63          	bgeu	a4,a2,1bba <strncpy+0x1ce>
    1b46:	000785a3          	sb	zero,11(a5)
    1b4a:	00c6871b          	addiw	a4,a3,12
    1b4e:	06c77663          	bgeu	a4,a2,1bba <strncpy+0x1ce>
    1b52:	00078623          	sb	zero,12(a5)
    1b56:	26b5                	addiw	a3,a3,13
    1b58:	06c6f163          	bgeu	a3,a2,1bba <strncpy+0x1ce>
    1b5c:	000786a3          	sb	zero,13(a5)
    1b60:	8082                	ret
            ;
        if (!n || !*s)
    1b62:	c645                	beqz	a2,1c0a <strncpy+0x21e>
    1b64:	0005c783          	lbu	a5,0(a1)
    1b68:	ea078be3          	beqz	a5,1a1e <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b6c:	479d                	li	a5,7
    1b6e:	02c7ff63          	bgeu	a5,a2,1bac <strncpy+0x1c0>
    1b72:	00000897          	auipc	a7,0x0
    1b76:	3e68b883          	ld	a7,998(a7) # 1f58 <__clone+0xd6>
    1b7a:	00000817          	auipc	a6,0x0
    1b7e:	3e683803          	ld	a6,998(a6) # 1f60 <__clone+0xde>
    1b82:	431d                	li	t1,7
    1b84:	6198                	ld	a4,0(a1)
    1b86:	011707b3          	add	a5,a4,a7
    1b8a:	fff74693          	not	a3,a4
    1b8e:	8ff5                	and	a5,a5,a3
    1b90:	0107f7b3          	and	a5,a5,a6
    1b94:	ef81                	bnez	a5,1bac <strncpy+0x1c0>
            *wd = *ws;
    1b96:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b98:	1661                	addi	a2,a2,-8
    1b9a:	05a1                	addi	a1,a1,8
    1b9c:	0521                	addi	a0,a0,8
    1b9e:	fec363e3          	bltu	t1,a2,1b84 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1ba2:	e609                	bnez	a2,1bac <strncpy+0x1c0>
    1ba4:	a08d                	j	1c06 <strncpy+0x21a>
    1ba6:	167d                	addi	a2,a2,-1
    1ba8:	0505                	addi	a0,a0,1
    1baa:	ca01                	beqz	a2,1bba <strncpy+0x1ce>
    1bac:	0005c783          	lbu	a5,0(a1)
    1bb0:	0585                	addi	a1,a1,1
    1bb2:	00f50023          	sb	a5,0(a0)
    1bb6:	fbe5                	bnez	a5,1ba6 <strncpy+0x1ba>
        ;
tail:
    1bb8:	b59d                	j	1a1e <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1bba:	8082                	ret
    1bbc:	472d                	li	a4,11
    1bbe:	bdb5                	j	1a3a <strncpy+0x4e>
    1bc0:	00778713          	addi	a4,a5,7
    1bc4:	45ad                	li	a1,11
    1bc6:	fff60693          	addi	a3,a2,-1
    1bca:	e6b778e3          	bgeu	a4,a1,1a3a <strncpy+0x4e>
    1bce:	b7fd                	j	1bbc <strncpy+0x1d0>
    1bd0:	40a007b3          	neg	a5,a0
    1bd4:	8832                	mv	a6,a2
    1bd6:	8b9d                	andi	a5,a5,7
    1bd8:	4681                	li	a3,0
    1bda:	e4060be3          	beqz	a2,1a30 <strncpy+0x44>
    1bde:	b7cd                	j	1bc0 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1be0:	468d                	li	a3,3
    1be2:	bd75                	j	1a9e <strncpy+0xb2>
    1be4:	872a                	mv	a4,a0
    1be6:	4681                	li	a3,0
    1be8:	bd5d                	j	1a9e <strncpy+0xb2>
    1bea:	4685                	li	a3,1
    1bec:	bd4d                	j	1a9e <strncpy+0xb2>
    1bee:	8082                	ret
    1bf0:	87aa                	mv	a5,a0
    1bf2:	4681                	li	a3,0
    1bf4:	b5f9                	j	1ac2 <strncpy+0xd6>
    1bf6:	4689                	li	a3,2
    1bf8:	b55d                	j	1a9e <strncpy+0xb2>
    1bfa:	4691                	li	a3,4
    1bfc:	b54d                	j	1a9e <strncpy+0xb2>
    1bfe:	4695                	li	a3,5
    1c00:	bd79                	j	1a9e <strncpy+0xb2>
    1c02:	4699                	li	a3,6
    1c04:	bd69                	j	1a9e <strncpy+0xb2>
    1c06:	8082                	ret
    1c08:	8082                	ret
    1c0a:	8082                	ret

0000000000001c0c <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c0c:	87aa                	mv	a5,a0
    1c0e:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c10:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c14:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c18:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c1a:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c1c:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c20:	2501                	sext.w	a0,a0
    1c22:	8082                	ret

0000000000001c24 <openat>:
    register long a7 __asm__("a7") = n;
    1c24:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c28:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c2c:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c30:	2501                	sext.w	a0,a0
    1c32:	8082                	ret

0000000000001c34 <close>:
    register long a7 __asm__("a7") = n;
    1c34:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c38:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c3c:	2501                	sext.w	a0,a0
    1c3e:	8082                	ret

0000000000001c40 <read>:
    register long a7 __asm__("a7") = n;
    1c40:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c44:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c48:	8082                	ret

0000000000001c4a <write>:
    register long a7 __asm__("a7") = n;
    1c4a:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c4e:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c52:	8082                	ret

0000000000001c54 <getpid>:
    register long a7 __asm__("a7") = n;
    1c54:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c58:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c5c:	2501                	sext.w	a0,a0
    1c5e:	8082                	ret

0000000000001c60 <getppid>:
    register long a7 __asm__("a7") = n;
    1c60:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c64:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c68:	2501                	sext.w	a0,a0
    1c6a:	8082                	ret

0000000000001c6c <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c6c:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c70:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c74:	2501                	sext.w	a0,a0
    1c76:	8082                	ret

0000000000001c78 <fork>:
    register long a7 __asm__("a7") = n;
    1c78:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c7c:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c7e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c80:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c84:	2501                	sext.w	a0,a0
    1c86:	8082                	ret

0000000000001c88 <clone>:
// 子进程执行的执行的函数指针 | 函数参数 | 栈地址 | 栈的大小 | 标志位
pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c88:	85b2                	mv	a1,a2
    1c8a:	863a                	mv	a2,a4
    if (stack)
    1c8c:	c191                	beqz	a1,1c90 <clone+0x8>
	stack += stack_size;
    1c8e:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c90:	4781                	li	a5,0
    1c92:	4701                	li	a4,0
    1c94:	4681                	li	a3,0
    1c96:	2601                	sext.w	a2,a2
    1c98:	a2ed                	j	1e82 <__clone>

0000000000001c9a <exit>:
    register long a7 __asm__("a7") = n;
    1c9a:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c9e:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1ca2:	8082                	ret

0000000000001ca4 <waitpid>:
    register long a7 __asm__("a7") = n;
    1ca4:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1ca8:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1caa:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cae:	2501                	sext.w	a0,a0
    1cb0:	8082                	ret

0000000000001cb2 <exec>:
    register long a7 __asm__("a7") = n;
    1cb2:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cb6:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cba:	2501                	sext.w	a0,a0
    1cbc:	8082                	ret

0000000000001cbe <execve>:
    register long a7 __asm__("a7") = n;
    1cbe:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cc2:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cc6:	2501                	sext.w	a0,a0
    1cc8:	8082                	ret

0000000000001cca <times>:
    register long a7 __asm__("a7") = n;
    1cca:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cce:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cd2:	2501                	sext.w	a0,a0
    1cd4:	8082                	ret

0000000000001cd6 <get_time>:

int64 get_time()
{
    1cd6:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cd8:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cdc:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cde:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ce0:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1ce4:	2501                	sext.w	a0,a0
    1ce6:	ed09                	bnez	a0,1d00 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ce8:	67a2                	ld	a5,8(sp)
    1cea:	3e800713          	li	a4,1000
    1cee:	00015503          	lhu	a0,0(sp)
    1cf2:	02e7d7b3          	divu	a5,a5,a4
    1cf6:	02e50533          	mul	a0,a0,a4
    1cfa:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1cfc:	0141                	addi	sp,sp,16
    1cfe:	8082                	ret
        return -1;
    1d00:	557d                	li	a0,-1
    1d02:	bfed                	j	1cfc <get_time+0x26>

0000000000001d04 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d04:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d08:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d0c:	2501                	sext.w	a0,a0
    1d0e:	8082                	ret

0000000000001d10 <time>:
    register long a7 __asm__("a7") = n;
    1d10:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d14:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d18:	2501                	sext.w	a0,a0
    1d1a:	8082                	ret

0000000000001d1c <sleep>:

int sleep(unsigned long long time)
{
    1d1c:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d1e:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d20:	850a                	mv	a0,sp
    1d22:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d24:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d28:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d2a:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d2e:	e501                	bnez	a0,1d36 <sleep+0x1a>
    return 0;
    1d30:	4501                	li	a0,0
}
    1d32:	0141                	addi	sp,sp,16
    1d34:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d36:	4502                	lw	a0,0(sp)
}
    1d38:	0141                	addi	sp,sp,16
    1d3a:	8082                	ret

0000000000001d3c <set_priority>:
    register long a7 __asm__("a7") = n;
    1d3c:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d40:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d44:	2501                	sext.w	a0,a0
    1d46:	8082                	ret

0000000000001d48 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d48:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d4c:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d50:	8082                	ret

0000000000001d52 <munmap>:
    register long a7 __asm__("a7") = n;
    1d52:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d56:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d5a:	2501                	sext.w	a0,a0
    1d5c:	8082                	ret

0000000000001d5e <wait>:

int wait(int *code)
{
    1d5e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d60:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d64:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d66:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d68:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d6a:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d6e:	2501                	sext.w	a0,a0
    1d70:	8082                	ret

0000000000001d72 <spawn>:
    register long a7 __asm__("a7") = n;
    1d72:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d76:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d7a:	2501                	sext.w	a0,a0
    1d7c:	8082                	ret

0000000000001d7e <mailread>:
    register long a7 __asm__("a7") = n;
    1d7e:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d82:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d86:	2501                	sext.w	a0,a0
    1d88:	8082                	ret

0000000000001d8a <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d8a:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d8e:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d92:	2501                	sext.w	a0,a0
    1d94:	8082                	ret

0000000000001d96 <fstat>:
    register long a7 __asm__("a7") = n;
    1d96:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d9a:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d9e:	2501                	sext.w	a0,a0
    1da0:	8082                	ret

0000000000001da2 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1da2:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1da4:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1da8:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1daa:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dae:	2501                	sext.w	a0,a0
    1db0:	8082                	ret

0000000000001db2 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1db2:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1db4:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1db8:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dba:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <link>:

int link(char *old_path, char *new_path)
{
    1dc2:	87aa                	mv	a5,a0
    1dc4:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1dc6:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1dca:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dce:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dd0:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1dd4:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dd6:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1dda:	2501                	sext.w	a0,a0
    1ddc:	8082                	ret

0000000000001dde <unlink>:

int unlink(char *path)
{
    1dde:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1de0:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1de4:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1de8:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dea:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1dee:	2501                	sext.w	a0,a0
    1df0:	8082                	ret

0000000000001df2 <uname>:
    register long a7 __asm__("a7") = n;
    1df2:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1df6:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1dfa:	2501                	sext.w	a0,a0
    1dfc:	8082                	ret

0000000000001dfe <brk>:
    register long a7 __asm__("a7") = n;
    1dfe:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e02:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <getcwd>:
    register long a7 __asm__("a7") = n;
    1e0a:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e0c:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e10:	8082                	ret

0000000000001e12 <chdir>:
    register long a7 __asm__("a7") = n;
    1e12:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e16:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e1a:	2501                	sext.w	a0,a0
    1e1c:	8082                	ret

0000000000001e1e <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e1e:	862e                	mv	a2,a1
    1e20:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e22:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e24:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e28:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e2c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e2e:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e30:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <getdents>:
    register long a7 __asm__("a7") = n;
    1e38:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e3c:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <pipe>:
    register long a7 __asm__("a7") = n;
    1e44:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e48:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e4a:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e4e:	2501                	sext.w	a0,a0
    1e50:	8082                	ret

0000000000001e52 <dup>:
    register long a7 __asm__("a7") = n;
    1e52:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e54:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e58:	2501                	sext.w	a0,a0
    1e5a:	8082                	ret

0000000000001e5c <dup2>:
    register long a7 __asm__("a7") = n;
    1e5c:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e5e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e60:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e64:	2501                	sext.w	a0,a0
    1e66:	8082                	ret

0000000000001e68 <mount>:
    register long a7 __asm__("a7") = n;
    1e68:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e6c:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e70:	2501                	sext.w	a0,a0
    1e72:	8082                	ret

0000000000001e74 <umount>:
    register long a7 __asm__("a7") = n;
    1e74:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e78:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e7a:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e7e:	2501                	sext.w	a0,a0
    1e80:	8082                	ret

0000000000001e82 <__clone>:
.global __clone
.type  __clone, %function
# 函数指针 | 栈地址 | 标志位
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e82:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e84:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e86:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e88:	8532                	mv	a0,a2
	mv a2, a4
    1e8a:	863a                	mv	a2,a4
	mv a3, a5
    1e8c:	86be                	mv	a3,a5
	mv a4, a6
    1e8e:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e90:	0dc00893          	li	a7,220
	ecall
    1e94:	00000073          	ecall

	beqz a0, 1f
    1e98:	c111                	beqz	a0,1e9c <__clone+0x1a>
	# Parent
	ret
    1e9a:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e9c:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e9e:	6522                	ld	a0,8(sp)
	jalr a1
    1ea0:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ea2:	05d00893          	li	a7,93
	ecall
    1ea6:	00000073          	ecall
