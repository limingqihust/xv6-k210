
/home/lmq/Desktop/xv6-k210/test/build/riscv64/mmap:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	aa15                	j	1136 <__start_main>

0000000000001004 <test_mmap>:
 * "  Hello, mmap success"
 * 测试失败时输出：
 * "mmap error."
 */
static struct kstat kst;
void test_mmap(void){
    1004:	712d                	addi	sp,sp,-288
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	eea50513          	addi	a0,a0,-278 # 1ef0 <__clone+0x2a>
void test_mmap(void){
    100e:	ee06                	sd	ra,280(sp)
    1010:	ea22                	sd	s0,272(sp)
    1012:	e24a                	sd	s2,256(sp)
    1014:	e626                	sd	s1,264(sp)
    TEST_START(__func__);
    1016:	31e000ef          	jal	ra,1334 <puts>
    101a:	00001517          	auipc	a0,0x1
    101e:	04650513          	addi	a0,a0,70 # 2060 <__func__.1193>
    1022:	312000ef          	jal	ra,1334 <puts>
    1026:	00001517          	auipc	a0,0x1
    102a:	ee250513          	addi	a0,a0,-286 # 1f08 <__clone+0x42>
    102e:	306000ef          	jal	ra,1334 <puts>
    char *array;
    const char *str = "  Hello, mmap successfully!";
    int fd;

    fd = open("test_mmap.txt", O_RDWR | O_CREATE);
    1032:	04200593          	li	a1,66
    1036:	00001517          	auipc	a0,0x1
    103a:	ee250513          	addi	a0,a0,-286 # 1f18 <__clone+0x52>
    103e:	413000ef          	jal	ra,1c50 <open>
    1042:	842a                	mv	s0,a0
    write(fd, str, strlen(str));
    1044:	00001517          	auipc	a0,0x1
    1048:	ee450513          	addi	a0,a0,-284 # 1f28 <__clone+0x62>
    104c:	05f000ef          	jal	ra,18aa <strlen>
    1050:	862a                	mv	a2,a0
    1052:	00001597          	auipc	a1,0x1
    1056:	ed658593          	addi	a1,a1,-298 # 1f28 <__clone+0x62>
    105a:	8522                	mv	a0,s0
    105c:	433000ef          	jal	ra,1c8e <write>
    fstat(fd, &kst);
    1060:	00001917          	auipc	s2,0x1
    1064:	f8090913          	addi	s2,s2,-128 # 1fe0 <kst>
    1068:	85ca                	mv	a1,s2
    106a:	8522                	mv	a0,s0
    106c:	56f000ef          	jal	ra,1dda <fstat>
    printf("file len: %d\n", kst.st_size);
    1070:	03093583          	ld	a1,48(s2)
    1074:	00001517          	auipc	a0,0x1
    1078:	ed450513          	addi	a0,a0,-300 # 1f48 <__clone+0x82>
    107c:	2da000ef          	jal	ra,1356 <printf>
    //映射的起始位置，映射的长度，可写|可读,映射文件 | 共享映射，文件描述符，偏移量
    array = mmap(NULL, kst.st_size, PROT_WRITE | PROT_READ, MAP_FILE | MAP_SHARED, fd, 0);
    1080:	03093583          	ld	a1,48(s2)
    1084:	4781                	li	a5,0
    1086:	8722                	mv	a4,s0
    1088:	4685                	li	a3,1
    108a:	460d                	li	a2,3
    108c:	4501                	li	a0,0
    108e:	4ff000ef          	jal	ra,1d8c <mmap>

    if (array == MAP_FAILED) 
    1092:	57fd                	li	a5,-1
    1094:	08f50263          	beq	a0,a5,1118 <test_mmap+0x114>
    {
	    printf("mmap error.\n");
    }
    else
    {
	    printf("mmap content: %s\n", array);
    1098:	84aa                	mv	s1,a0
    109a:	85aa                	mv	a1,a0
    109c:	00001517          	auipc	a0,0x1
    10a0:	ecc50513          	addi	a0,a0,-308 # 1f68 <__clone+0xa2>
    10a4:	2b2000ef          	jal	ra,1356 <printf>
	    array[0]='A';
    10a8:	04100793          	li	a5,65
    10ac:	00f48023          	sb	a5,0(s1)
        munmap(array, kst.st_size);
    10b0:	03093583          	ld	a1,48(s2)
    10b4:	8526                	mv	a0,s1
    10b6:	4e1000ef          	jal	ra,1d96 <munmap>
    }

    close(fd);
    10ba:	8522                	mv	a0,s0
    10bc:	3bd000ef          	jal	ra,1c78 <close>
    fd = open("test_mmap.txt", O_RDWR | O_CREATE);
    10c0:	04200593          	li	a1,66
    10c4:	00001517          	auipc	a0,0x1
    10c8:	e5450513          	addi	a0,a0,-428 # 1f18 <__clone+0x52>
    10cc:	385000ef          	jal	ra,1c50 <open>
    char buf[256];
    read(fd,buf,256);
    10d0:	10000613          	li	a2,256
    10d4:	858a                	mv	a1,sp
    10d6:	3af000ef          	jal	ra,1c84 <read>
    printf("after munmap content of test_mmap.txt:%s\n",buf);
    10da:	858a                	mv	a1,sp
    10dc:	00001517          	auipc	a0,0x1
    10e0:	ea450513          	addi	a0,a0,-348 # 1f80 <__clone+0xba>
    10e4:	272000ef          	jal	ra,1356 <printf>
    TEST_END(__func__);
    10e8:	00001517          	auipc	a0,0x1
    10ec:	ec850513          	addi	a0,a0,-312 # 1fb0 <__clone+0xea>
    10f0:	244000ef          	jal	ra,1334 <puts>
    10f4:	00001517          	auipc	a0,0x1
    10f8:	f6c50513          	addi	a0,a0,-148 # 2060 <__func__.1193>
    10fc:	238000ef          	jal	ra,1334 <puts>
    1100:	00001517          	auipc	a0,0x1
    1104:	e0850513          	addi	a0,a0,-504 # 1f08 <__clone+0x42>
    1108:	22c000ef          	jal	ra,1334 <puts>
}
    110c:	60f2                	ld	ra,280(sp)
    110e:	6452                	ld	s0,272(sp)
    1110:	64b2                	ld	s1,264(sp)
    1112:	6912                	ld	s2,256(sp)
    1114:	6115                	addi	sp,sp,288
    1116:	8082                	ret
	    printf("mmap error.\n");
    1118:	00001517          	auipc	a0,0x1
    111c:	e4050513          	addi	a0,a0,-448 # 1f58 <__clone+0x92>
    1120:	236000ef          	jal	ra,1356 <printf>
    1124:	bf59                	j	10ba <test_mmap+0xb6>

0000000000001126 <main>:

int main(void){
    1126:	1141                	addi	sp,sp,-16
    1128:	e406                	sd	ra,8(sp)
    test_mmap();
    112a:	edbff0ef          	jal	ra,1004 <test_mmap>
    return 0;
    112e:	60a2                	ld	ra,8(sp)
    1130:	4501                	li	a0,0
    1132:	0141                	addi	sp,sp,16
    1134:	8082                	ret

0000000000001136 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1136:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1138:	4108                	lw	a0,0(a0)
{
    113a:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    113c:	05a1                	addi	a1,a1,8
{
    113e:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1140:	fe7ff0ef          	jal	ra,1126 <main>
    1144:	39b000ef          	jal	ra,1cde <exit>
	return 0;
}
    1148:	60a2                	ld	ra,8(sp)
    114a:	4501                	li	a0,0
    114c:	0141                	addi	sp,sp,16
    114e:	8082                	ret

0000000000001150 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1150:	7179                	addi	sp,sp,-48
    1152:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1154:	12054b63          	bltz	a0,128a <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1158:	02b577bb          	remuw	a5,a0,a1
    115c:	00001697          	auipc	a3,0x1
    1160:	f1468693          	addi	a3,a3,-236 # 2070 <digits>
    buf[16] = 0;
    1164:	00010c23          	sb	zero,24(sp)
    i = 15;
    1168:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    116c:	1782                	slli	a5,a5,0x20
    116e:	9381                	srli	a5,a5,0x20
    1170:	97b6                	add	a5,a5,a3
    1172:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1176:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    117a:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    117e:	16b56263          	bltu	a0,a1,12e2 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1182:	02e8763b          	remuw	a2,a6,a4
    1186:	1602                	slli	a2,a2,0x20
    1188:	9201                	srli	a2,a2,0x20
    118a:	9636                	add	a2,a2,a3
    118c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1190:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1194:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1198:	12e86963          	bltu	a6,a4,12ca <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    119c:	02e5f63b          	remuw	a2,a1,a4
    11a0:	1602                	slli	a2,a2,0x20
    11a2:	9201                	srli	a2,a2,0x20
    11a4:	9636                	add	a2,a2,a3
    11a6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11aa:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11ae:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    11b2:	10e5ef63          	bltu	a1,a4,12d0 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    11b6:	02e8763b          	remuw	a2,a6,a4
    11ba:	1602                	slli	a2,a2,0x20
    11bc:	9201                	srli	a2,a2,0x20
    11be:	9636                	add	a2,a2,a3
    11c0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c4:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11c8:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    11cc:	10e86563          	bltu	a6,a4,12d6 <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    11d0:	02e5f63b          	remuw	a2,a1,a4
    11d4:	1602                	slli	a2,a2,0x20
    11d6:	9201                	srli	a2,a2,0x20
    11d8:	9636                	add	a2,a2,a3
    11da:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11de:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11e2:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11e6:	0ee5eb63          	bltu	a1,a4,12dc <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    11ea:	02e8763b          	remuw	a2,a6,a4
    11ee:	1602                	slli	a2,a2,0x20
    11f0:	9201                	srli	a2,a2,0x20
    11f2:	9636                	add	a2,a2,a3
    11f4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11f8:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11fc:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1200:	0ce86263          	bltu	a6,a4,12c4 <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    1204:	02e5f63b          	remuw	a2,a1,a4
    1208:	1602                	slli	a2,a2,0x20
    120a:	9201                	srli	a2,a2,0x20
    120c:	9636                	add	a2,a2,a3
    120e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1212:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1216:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    121a:	0ce5e663          	bltu	a1,a4,12e6 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    121e:	02e8763b          	remuw	a2,a6,a4
    1222:	1602                	slli	a2,a2,0x20
    1224:	9201                	srli	a2,a2,0x20
    1226:	9636                	add	a2,a2,a3
    1228:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    122c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1230:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1234:	0ae86c63          	bltu	a6,a4,12ec <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    1238:	02e5f63b          	remuw	a2,a1,a4
    123c:	1602                	slli	a2,a2,0x20
    123e:	9201                	srli	a2,a2,0x20
    1240:	9636                	add	a2,a2,a3
    1242:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1246:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    124a:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    124e:	0ae5e263          	bltu	a1,a4,12f2 <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    1252:	1782                	slli	a5,a5,0x20
    1254:	9381                	srli	a5,a5,0x20
    1256:	97b6                	add	a5,a5,a3
    1258:	0007c703          	lbu	a4,0(a5)
    125c:	4599                	li	a1,6
    125e:	4795                	li	a5,5
    1260:	00e10723          	sb	a4,14(sp)

    if (sign)
    1264:	00055963          	bgez	a0,1276 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1268:	1018                	addi	a4,sp,32
    126a:	973e                	add	a4,a4,a5
    126c:	02d00693          	li	a3,45
    1270:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    1274:	85be                	mv	a1,a5
    write(f, s, l);
    1276:	003c                	addi	a5,sp,8
    1278:	4641                	li	a2,16
    127a:	9e0d                	subw	a2,a2,a1
    127c:	4505                	li	a0,1
    127e:	95be                	add	a1,a1,a5
    1280:	20f000ef          	jal	ra,1c8e <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1284:	70a2                	ld	ra,40(sp)
    1286:	6145                	addi	sp,sp,48
    1288:	8082                	ret
        x = -xx;
    128a:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    128e:	02b677bb          	remuw	a5,a2,a1
    1292:	00001697          	auipc	a3,0x1
    1296:	dde68693          	addi	a3,a3,-546 # 2070 <digits>
    buf[16] = 0;
    129a:	00010c23          	sb	zero,24(sp)
    i = 15;
    129e:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    12a2:	1782                	slli	a5,a5,0x20
    12a4:	9381                	srli	a5,a5,0x20
    12a6:	97b6                	add	a5,a5,a3
    12a8:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    12ac:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    12b0:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    12b4:	ecb677e3          	bgeu	a2,a1,1182 <printint.constprop.0+0x32>
        buf[i--] = '-';
    12b8:	02d00793          	li	a5,45
    12bc:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    12c0:	45b9                	li	a1,14
    12c2:	bf55                	j	1276 <printint.constprop.0+0x126>
    12c4:	47a5                	li	a5,9
    12c6:	45a9                	li	a1,10
    12c8:	bf71                	j	1264 <printint.constprop.0+0x114>
    12ca:	47b5                	li	a5,13
    12cc:	45b9                	li	a1,14
    12ce:	bf59                	j	1264 <printint.constprop.0+0x114>
    12d0:	47b1                	li	a5,12
    12d2:	45b5                	li	a1,13
    12d4:	bf41                	j	1264 <printint.constprop.0+0x114>
    12d6:	47ad                	li	a5,11
    12d8:	45b1                	li	a1,12
    12da:	b769                	j	1264 <printint.constprop.0+0x114>
    12dc:	47a9                	li	a5,10
    12de:	45ad                	li	a1,11
    12e0:	b751                	j	1264 <printint.constprop.0+0x114>
    i = 15;
    12e2:	45bd                	li	a1,15
    12e4:	bf49                	j	1276 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    12e6:	47a1                	li	a5,8
    12e8:	45a5                	li	a1,9
    12ea:	bfad                	j	1264 <printint.constprop.0+0x114>
    12ec:	479d                	li	a5,7
    12ee:	45a1                	li	a1,8
    12f0:	bf95                	j	1264 <printint.constprop.0+0x114>
    12f2:	4799                	li	a5,6
    12f4:	459d                	li	a1,7
    12f6:	b7bd                	j	1264 <printint.constprop.0+0x114>

00000000000012f8 <getchar>:
{
    12f8:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12fa:	00f10593          	addi	a1,sp,15
    12fe:	4605                	li	a2,1
    1300:	4501                	li	a0,0
{
    1302:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1304:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1308:	17d000ef          	jal	ra,1c84 <read>
}
    130c:	60e2                	ld	ra,24(sp)
    130e:	00f14503          	lbu	a0,15(sp)
    1312:	6105                	addi	sp,sp,32
    1314:	8082                	ret

0000000000001316 <putchar>:
{
    1316:	1101                	addi	sp,sp,-32
    1318:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    131a:	00f10593          	addi	a1,sp,15
    131e:	4605                	li	a2,1
    1320:	4505                	li	a0,1
{
    1322:	ec06                	sd	ra,24(sp)
    char byte = c;
    1324:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1328:	167000ef          	jal	ra,1c8e <write>
}
    132c:	60e2                	ld	ra,24(sp)
    132e:	2501                	sext.w	a0,a0
    1330:	6105                	addi	sp,sp,32
    1332:	8082                	ret

0000000000001334 <puts>:
{
    1334:	1141                	addi	sp,sp,-16
    1336:	e406                	sd	ra,8(sp)
    1338:	e022                	sd	s0,0(sp)
    133a:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    133c:	56e000ef          	jal	ra,18aa <strlen>
    1340:	862a                	mv	a2,a0
    1342:	85a2                	mv	a1,s0
    1344:	4505                	li	a0,1
    1346:	149000ef          	jal	ra,1c8e <write>
}
    134a:	60a2                	ld	ra,8(sp)
    134c:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    134e:	957d                	srai	a0,a0,0x3f
    return r;
    1350:	2501                	sext.w	a0,a0
}
    1352:	0141                	addi	sp,sp,16
    1354:	8082                	ret

0000000000001356 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1356:	7171                	addi	sp,sp,-176
    1358:	fc56                	sd	s5,56(sp)
    135a:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    135c:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    135e:	18bc                	addi	a5,sp,120
{
    1360:	e8ca                	sd	s2,80(sp)
    1362:	e4ce                	sd	s3,72(sp)
    1364:	e0d2                	sd	s4,64(sp)
    1366:	f85a                	sd	s6,48(sp)
    1368:	f486                	sd	ra,104(sp)
    136a:	f0a2                	sd	s0,96(sp)
    136c:	eca6                	sd	s1,88(sp)
    136e:	fcae                	sd	a1,120(sp)
    1370:	e132                	sd	a2,128(sp)
    1372:	e536                	sd	a3,136(sp)
    1374:	e93a                	sd	a4,144(sp)
    1376:	f142                	sd	a6,160(sp)
    1378:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    137a:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    137c:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1380:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1384:	00001b17          	auipc	s6,0x1
    1388:	c3cb0b13          	addi	s6,s6,-964 # 1fc0 <__clone+0xfa>
    buf[i++] = '0';
    138c:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1390:	00001997          	auipc	s3,0x1
    1394:	ce098993          	addi	s3,s3,-800 # 2070 <digits>
        if (!*s)
    1398:	00054783          	lbu	a5,0(a0)
    139c:	16078a63          	beqz	a5,1510 <printf+0x1ba>
    13a0:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13a2:	19278163          	beq	a5,s2,1524 <printf+0x1ce>
    13a6:	00164783          	lbu	a5,1(a2)
    13aa:	0605                	addi	a2,a2,1
    13ac:	fbfd                	bnez	a5,13a2 <printf+0x4c>
    13ae:	84b2                	mv	s1,a2
        l = z - a;
    13b0:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13b4:	85aa                	mv	a1,a0
    13b6:	8622                	mv	a2,s0
    13b8:	4505                	li	a0,1
    13ba:	0d5000ef          	jal	ra,1c8e <write>
        if (l)
    13be:	18041c63          	bnez	s0,1556 <printf+0x200>
        if (s[1] == 0)
    13c2:	0014c783          	lbu	a5,1(s1)
    13c6:	14078563          	beqz	a5,1510 <printf+0x1ba>
        switch (s[1])
    13ca:	1d478063          	beq	a5,s4,158a <printf+0x234>
    13ce:	18fa6663          	bltu	s4,a5,155a <printf+0x204>
    13d2:	06400713          	li	a4,100
    13d6:	1ae78063          	beq	a5,a4,1576 <printf+0x220>
    13da:	07000713          	li	a4,112
    13de:	1ce79963          	bne	a5,a4,15b0 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    13e2:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13e4:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13e8:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13ea:	631c                	ld	a5,0(a4)
    13ec:	0721                	addi	a4,a4,8
    13ee:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13f0:	00479293          	slli	t0,a5,0x4
    13f4:	00879f93          	slli	t6,a5,0x8
    13f8:	00c79f13          	slli	t5,a5,0xc
    13fc:	01079e93          	slli	t4,a5,0x10
    1400:	01479e13          	slli	t3,a5,0x14
    1404:	01879313          	slli	t1,a5,0x18
    1408:	01c79893          	slli	a7,a5,0x1c
    140c:	02479813          	slli	a6,a5,0x24
    1410:	02879513          	slli	a0,a5,0x28
    1414:	02c79593          	slli	a1,a5,0x2c
    1418:	03079693          	slli	a3,a5,0x30
    141c:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1420:	03c7d413          	srli	s0,a5,0x3c
    1424:	01c7d39b          	srliw	t2,a5,0x1c
    1428:	03c2d293          	srli	t0,t0,0x3c
    142c:	03cfdf93          	srli	t6,t6,0x3c
    1430:	03cf5f13          	srli	t5,t5,0x3c
    1434:	03cede93          	srli	t4,t4,0x3c
    1438:	03ce5e13          	srli	t3,t3,0x3c
    143c:	03c35313          	srli	t1,t1,0x3c
    1440:	03c8d893          	srli	a7,a7,0x3c
    1444:	03c85813          	srli	a6,a6,0x3c
    1448:	9171                	srli	a0,a0,0x3c
    144a:	91f1                	srli	a1,a1,0x3c
    144c:	92f1                	srli	a3,a3,0x3c
    144e:	9371                	srli	a4,a4,0x3c
    1450:	96ce                	add	a3,a3,s3
    1452:	974e                	add	a4,a4,s3
    1454:	944e                	add	s0,s0,s3
    1456:	92ce                	add	t0,t0,s3
    1458:	9fce                	add	t6,t6,s3
    145a:	9f4e                	add	t5,t5,s3
    145c:	9ece                	add	t4,t4,s3
    145e:	9e4e                	add	t3,t3,s3
    1460:	934e                	add	t1,t1,s3
    1462:	98ce                	add	a7,a7,s3
    1464:	93ce                	add	t2,t2,s3
    1466:	984e                	add	a6,a6,s3
    1468:	954e                	add	a0,a0,s3
    146a:	95ce                	add	a1,a1,s3
    146c:	0006c083          	lbu	ra,0(a3)
    1470:	0002c283          	lbu	t0,0(t0)
    1474:	00074683          	lbu	a3,0(a4)
    1478:	000fcf83          	lbu	t6,0(t6)
    147c:	000f4f03          	lbu	t5,0(t5)
    1480:	000ece83          	lbu	t4,0(t4)
    1484:	000e4e03          	lbu	t3,0(t3)
    1488:	00034303          	lbu	t1,0(t1)
    148c:	0008c883          	lbu	a7,0(a7)
    1490:	0003c383          	lbu	t2,0(t2)
    1494:	00084803          	lbu	a6,0(a6)
    1498:	00054503          	lbu	a0,0(a0)
    149c:	0005c583          	lbu	a1,0(a1)
    14a0:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14a4:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14a8:	9371                	srli	a4,a4,0x3c
    14aa:	8bbd                	andi	a5,a5,15
    14ac:	974e                	add	a4,a4,s3
    14ae:	97ce                	add	a5,a5,s3
    14b0:	005105a3          	sb	t0,11(sp)
    14b4:	01f10623          	sb	t6,12(sp)
    14b8:	01e106a3          	sb	t5,13(sp)
    14bc:	01d10723          	sb	t4,14(sp)
    14c0:	01c107a3          	sb	t3,15(sp)
    14c4:	00610823          	sb	t1,16(sp)
    14c8:	011108a3          	sb	a7,17(sp)
    14cc:	00710923          	sb	t2,18(sp)
    14d0:	010109a3          	sb	a6,19(sp)
    14d4:	00a10a23          	sb	a0,20(sp)
    14d8:	00b10aa3          	sb	a1,21(sp)
    14dc:	00110b23          	sb	ra,22(sp)
    14e0:	00d10ba3          	sb	a3,23(sp)
    14e4:	00810523          	sb	s0,10(sp)
    14e8:	00074703          	lbu	a4,0(a4)
    14ec:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14f0:	002c                	addi	a1,sp,8
    14f2:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14f4:	00e10c23          	sb	a4,24(sp)
    14f8:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14fc:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1500:	78e000ef          	jal	ra,1c8e <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1504:	00248513          	addi	a0,s1,2
        if (!*s)
    1508:	00054783          	lbu	a5,0(a0)
    150c:	e8079ae3          	bnez	a5,13a0 <printf+0x4a>
    }
    va_end(ap);
}
    1510:	70a6                	ld	ra,104(sp)
    1512:	7406                	ld	s0,96(sp)
    1514:	64e6                	ld	s1,88(sp)
    1516:	6946                	ld	s2,80(sp)
    1518:	69a6                	ld	s3,72(sp)
    151a:	6a06                	ld	s4,64(sp)
    151c:	7ae2                	ld	s5,56(sp)
    151e:	7b42                	ld	s6,48(sp)
    1520:	614d                	addi	sp,sp,176
    1522:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1524:	00064783          	lbu	a5,0(a2)
    1528:	84b2                	mv	s1,a2
    152a:	01278963          	beq	a5,s2,153c <printf+0x1e6>
    152e:	b549                	j	13b0 <printf+0x5a>
    1530:	0024c783          	lbu	a5,2(s1)
    1534:	0605                	addi	a2,a2,1
    1536:	0489                	addi	s1,s1,2
    1538:	e7279ce3          	bne	a5,s2,13b0 <printf+0x5a>
    153c:	0014c783          	lbu	a5,1(s1)
    1540:	ff2788e3          	beq	a5,s2,1530 <printf+0x1da>
        l = z - a;
    1544:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1548:	85aa                	mv	a1,a0
    154a:	8622                	mv	a2,s0
    154c:	4505                	li	a0,1
    154e:	740000ef          	jal	ra,1c8e <write>
        if (l)
    1552:	e60408e3          	beqz	s0,13c2 <printf+0x6c>
    1556:	8526                	mv	a0,s1
    1558:	b581                	j	1398 <printf+0x42>
        switch (s[1])
    155a:	07800713          	li	a4,120
    155e:	04e79963          	bne	a5,a4,15b0 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    1562:	6782                	ld	a5,0(sp)
    1564:	45c1                	li	a1,16
    1566:	4388                	lw	a0,0(a5)
    1568:	07a1                	addi	a5,a5,8
    156a:	e03e                	sd	a5,0(sp)
    156c:	be5ff0ef          	jal	ra,1150 <printint.constprop.0>
        s += 2;
    1570:	00248513          	addi	a0,s1,2
    1574:	bf51                	j	1508 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    1576:	6782                	ld	a5,0(sp)
    1578:	45a9                	li	a1,10
    157a:	4388                	lw	a0,0(a5)
    157c:	07a1                	addi	a5,a5,8
    157e:	e03e                	sd	a5,0(sp)
    1580:	bd1ff0ef          	jal	ra,1150 <printint.constprop.0>
        s += 2;
    1584:	00248513          	addi	a0,s1,2
    1588:	b741                	j	1508 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    158a:	6782                	ld	a5,0(sp)
    158c:	6380                	ld	s0,0(a5)
    158e:	07a1                	addi	a5,a5,8
    1590:	e03e                	sd	a5,0(sp)
    1592:	c421                	beqz	s0,15da <printf+0x284>
            l = strnlen(a, 200);
    1594:	0c800593          	li	a1,200
    1598:	8522                	mv	a0,s0
    159a:	3fc000ef          	jal	ra,1996 <strnlen>
    write(f, s, l);
    159e:	0005061b          	sext.w	a2,a0
    15a2:	85a2                	mv	a1,s0
    15a4:	4505                	li	a0,1
    15a6:	6e8000ef          	jal	ra,1c8e <write>
        s += 2;
    15aa:	00248513          	addi	a0,s1,2
    15ae:	bfa9                	j	1508 <printf+0x1b2>
    char byte = c;
    15b0:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    15b4:	4605                	li	a2,1
    15b6:	002c                	addi	a1,sp,8
    15b8:	4505                	li	a0,1
    char byte = c;
    15ba:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15be:	6d0000ef          	jal	ra,1c8e <write>
    char byte = c;
    15c2:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15c6:	4605                	li	a2,1
    15c8:	002c                	addi	a1,sp,8
    15ca:	4505                	li	a0,1
    char byte = c;
    15cc:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15d0:	6be000ef          	jal	ra,1c8e <write>
        s += 2;
    15d4:	00248513          	addi	a0,s1,2
    15d8:	bf05                	j	1508 <printf+0x1b2>
                a = "(null)";
    15da:	845a                	mv	s0,s6
    15dc:	bf65                	j	1594 <printf+0x23e>

00000000000015de <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15de:	02000793          	li	a5,32
    15e2:	00f50663          	beq	a0,a5,15ee <isspace+0x10>
    15e6:	355d                	addiw	a0,a0,-9
    15e8:	00553513          	sltiu	a0,a0,5
    15ec:	8082                	ret
    15ee:	4505                	li	a0,1
}
    15f0:	8082                	ret

00000000000015f2 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15f2:	fd05051b          	addiw	a0,a0,-48
}
    15f6:	00a53513          	sltiu	a0,a0,10
    15fa:	8082                	ret

00000000000015fc <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15fc:	02000613          	li	a2,32
    1600:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1602:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1606:	ff77069b          	addiw	a3,a4,-9
    160a:	04c70d63          	beq	a4,a2,1664 <atoi+0x68>
    160e:	0007079b          	sext.w	a5,a4
    1612:	04d5f963          	bgeu	a1,a3,1664 <atoi+0x68>
        s++;
    switch (*s)
    1616:	02b00693          	li	a3,43
    161a:	04d70a63          	beq	a4,a3,166e <atoi+0x72>
    161e:	02d00693          	li	a3,45
    1622:	06d70463          	beq	a4,a3,168a <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1626:	fd07859b          	addiw	a1,a5,-48
    162a:	4625                	li	a2,9
    162c:	873e                	mv	a4,a5
    162e:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1630:	4e01                	li	t3,0
    while (isdigit(*s))
    1632:	04b66a63          	bltu	a2,a1,1686 <atoi+0x8a>
    int n = 0, neg = 0;
    1636:	4501                	li	a0,0
    while (isdigit(*s))
    1638:	4825                	li	a6,9
    163a:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    163e:	0025179b          	slliw	a5,a0,0x2
    1642:	9d3d                	addw	a0,a0,a5
    1644:	fd07031b          	addiw	t1,a4,-48
    1648:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    164c:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1650:	0685                	addi	a3,a3,1
    1652:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1656:	0006071b          	sext.w	a4,a2
    165a:	feb870e3          	bgeu	a6,a1,163a <atoi+0x3e>
    return neg ? n : -n;
    165e:	000e0563          	beqz	t3,1668 <atoi+0x6c>
}
    1662:	8082                	ret
        s++;
    1664:	0505                	addi	a0,a0,1
    1666:	bf71                	j	1602 <atoi+0x6>
    1668:	4113053b          	subw	a0,t1,a7
    166c:	8082                	ret
    while (isdigit(*s))
    166e:	00154783          	lbu	a5,1(a0)
    1672:	4625                	li	a2,9
        s++;
    1674:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1678:	fd07859b          	addiw	a1,a5,-48
    167c:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1680:	4e01                	li	t3,0
    while (isdigit(*s))
    1682:	fab67ae3          	bgeu	a2,a1,1636 <atoi+0x3a>
    1686:	4501                	li	a0,0
}
    1688:	8082                	ret
    while (isdigit(*s))
    168a:	00154783          	lbu	a5,1(a0)
    168e:	4625                	li	a2,9
        s++;
    1690:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1694:	fd07859b          	addiw	a1,a5,-48
    1698:	0007871b          	sext.w	a4,a5
    169c:	feb665e3          	bltu	a2,a1,1686 <atoi+0x8a>
        neg = 1;
    16a0:	4e05                	li	t3,1
    16a2:	bf51                	j	1636 <atoi+0x3a>

00000000000016a4 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16a4:	16060d63          	beqz	a2,181e <memset+0x17a>
    16a8:	40a007b3          	neg	a5,a0
    16ac:	8b9d                	andi	a5,a5,7
    16ae:	00778713          	addi	a4,a5,7
    16b2:	482d                	li	a6,11
    16b4:	0ff5f593          	andi	a1,a1,255
    16b8:	fff60693          	addi	a3,a2,-1
    16bc:	17076263          	bltu	a4,a6,1820 <memset+0x17c>
    16c0:	16e6ea63          	bltu	a3,a4,1834 <memset+0x190>
    16c4:	16078563          	beqz	a5,182e <memset+0x18a>
    16c8:	00b50023          	sb	a1,0(a0)
    16cc:	4705                	li	a4,1
    16ce:	00150e93          	addi	t4,a0,1
    16d2:	14e78c63          	beq	a5,a4,182a <memset+0x186>
    16d6:	00b500a3          	sb	a1,1(a0)
    16da:	4709                	li	a4,2
    16dc:	00250e93          	addi	t4,a0,2
    16e0:	14e78d63          	beq	a5,a4,183a <memset+0x196>
    16e4:	00b50123          	sb	a1,2(a0)
    16e8:	470d                	li	a4,3
    16ea:	00350e93          	addi	t4,a0,3
    16ee:	12e78b63          	beq	a5,a4,1824 <memset+0x180>
    16f2:	00b501a3          	sb	a1,3(a0)
    16f6:	4711                	li	a4,4
    16f8:	00450e93          	addi	t4,a0,4
    16fc:	14e78163          	beq	a5,a4,183e <memset+0x19a>
    1700:	00b50223          	sb	a1,4(a0)
    1704:	4715                	li	a4,5
    1706:	00550e93          	addi	t4,a0,5
    170a:	12e78c63          	beq	a5,a4,1842 <memset+0x19e>
    170e:	00b502a3          	sb	a1,5(a0)
    1712:	471d                	li	a4,7
    1714:	00650e93          	addi	t4,a0,6
    1718:	12e79763          	bne	a5,a4,1846 <memset+0x1a2>
    171c:	00750e93          	addi	t4,a0,7
    1720:	00b50323          	sb	a1,6(a0)
    1724:	4f1d                	li	t5,7
    1726:	00859713          	slli	a4,a1,0x8
    172a:	8f4d                	or	a4,a4,a1
    172c:	01059e13          	slli	t3,a1,0x10
    1730:	01c76e33          	or	t3,a4,t3
    1734:	01859313          	slli	t1,a1,0x18
    1738:	006e6333          	or	t1,t3,t1
    173c:	02059893          	slli	a7,a1,0x20
    1740:	011368b3          	or	a7,t1,a7
    1744:	02859813          	slli	a6,a1,0x28
    1748:	40f60333          	sub	t1,a2,a5
    174c:	0108e833          	or	a6,a7,a6
    1750:	03059693          	slli	a3,a1,0x30
    1754:	00d866b3          	or	a3,a6,a3
    1758:	03859713          	slli	a4,a1,0x38
    175c:	97aa                	add	a5,a5,a0
    175e:	ff837813          	andi	a6,t1,-8
    1762:	8f55                	or	a4,a4,a3
    1764:	00f806b3          	add	a3,a6,a5
    1768:	e398                	sd	a4,0(a5)
    176a:	07a1                	addi	a5,a5,8
    176c:	fed79ee3          	bne	a5,a3,1768 <memset+0xc4>
    1770:	ff837693          	andi	a3,t1,-8
    1774:	00de87b3          	add	a5,t4,a3
    1778:	01e6873b          	addw	a4,a3,t5
    177c:	0ad30663          	beq	t1,a3,1828 <memset+0x184>
    1780:	00b78023          	sb	a1,0(a5)
    1784:	0017069b          	addiw	a3,a4,1
    1788:	08c6fb63          	bgeu	a3,a2,181e <memset+0x17a>
    178c:	00b780a3          	sb	a1,1(a5)
    1790:	0027069b          	addiw	a3,a4,2
    1794:	08c6f563          	bgeu	a3,a2,181e <memset+0x17a>
    1798:	00b78123          	sb	a1,2(a5)
    179c:	0037069b          	addiw	a3,a4,3
    17a0:	06c6ff63          	bgeu	a3,a2,181e <memset+0x17a>
    17a4:	00b781a3          	sb	a1,3(a5)
    17a8:	0047069b          	addiw	a3,a4,4
    17ac:	06c6f963          	bgeu	a3,a2,181e <memset+0x17a>
    17b0:	00b78223          	sb	a1,4(a5)
    17b4:	0057069b          	addiw	a3,a4,5
    17b8:	06c6f363          	bgeu	a3,a2,181e <memset+0x17a>
    17bc:	00b782a3          	sb	a1,5(a5)
    17c0:	0067069b          	addiw	a3,a4,6
    17c4:	04c6fd63          	bgeu	a3,a2,181e <memset+0x17a>
    17c8:	00b78323          	sb	a1,6(a5)
    17cc:	0077069b          	addiw	a3,a4,7
    17d0:	04c6f763          	bgeu	a3,a2,181e <memset+0x17a>
    17d4:	00b783a3          	sb	a1,7(a5)
    17d8:	0087069b          	addiw	a3,a4,8
    17dc:	04c6f163          	bgeu	a3,a2,181e <memset+0x17a>
    17e0:	00b78423          	sb	a1,8(a5)
    17e4:	0097069b          	addiw	a3,a4,9
    17e8:	02c6fb63          	bgeu	a3,a2,181e <memset+0x17a>
    17ec:	00b784a3          	sb	a1,9(a5)
    17f0:	00a7069b          	addiw	a3,a4,10
    17f4:	02c6f563          	bgeu	a3,a2,181e <memset+0x17a>
    17f8:	00b78523          	sb	a1,10(a5)
    17fc:	00b7069b          	addiw	a3,a4,11
    1800:	00c6ff63          	bgeu	a3,a2,181e <memset+0x17a>
    1804:	00b785a3          	sb	a1,11(a5)
    1808:	00c7069b          	addiw	a3,a4,12
    180c:	00c6f963          	bgeu	a3,a2,181e <memset+0x17a>
    1810:	00b78623          	sb	a1,12(a5)
    1814:	2735                	addiw	a4,a4,13
    1816:	00c77463          	bgeu	a4,a2,181e <memset+0x17a>
    181a:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    181e:	8082                	ret
    1820:	472d                	li	a4,11
    1822:	bd79                	j	16c0 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1824:	4f0d                	li	t5,3
    1826:	b701                	j	1726 <memset+0x82>
    1828:	8082                	ret
    182a:	4f05                	li	t5,1
    182c:	bded                	j	1726 <memset+0x82>
    182e:	8eaa                	mv	t4,a0
    1830:	4f01                	li	t5,0
    1832:	bdd5                	j	1726 <memset+0x82>
    1834:	87aa                	mv	a5,a0
    1836:	4701                	li	a4,0
    1838:	b7a1                	j	1780 <memset+0xdc>
    183a:	4f09                	li	t5,2
    183c:	b5ed                	j	1726 <memset+0x82>
    183e:	4f11                	li	t5,4
    1840:	b5dd                	j	1726 <memset+0x82>
    1842:	4f15                	li	t5,5
    1844:	b5cd                	j	1726 <memset+0x82>
    1846:	4f19                	li	t5,6
    1848:	bdf9                	j	1726 <memset+0x82>

000000000000184a <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    184a:	00054783          	lbu	a5,0(a0)
    184e:	0005c703          	lbu	a4,0(a1)
    1852:	00e79863          	bne	a5,a4,1862 <strcmp+0x18>
    1856:	0505                	addi	a0,a0,1
    1858:	0585                	addi	a1,a1,1
    185a:	fbe5                	bnez	a5,184a <strcmp>
    185c:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    185e:	9d19                	subw	a0,a0,a4
    1860:	8082                	ret
    1862:	0007851b          	sext.w	a0,a5
    1866:	bfe5                	j	185e <strcmp+0x14>

0000000000001868 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1868:	ce05                	beqz	a2,18a0 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    186a:	00054703          	lbu	a4,0(a0)
    186e:	0005c783          	lbu	a5,0(a1)
    1872:	cb0d                	beqz	a4,18a4 <strncmp+0x3c>
    if (!n--)
    1874:	167d                	addi	a2,a2,-1
    1876:	00c506b3          	add	a3,a0,a2
    187a:	a819                	j	1890 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    187c:	00a68e63          	beq	a3,a0,1898 <strncmp+0x30>
    1880:	0505                	addi	a0,a0,1
    1882:	00e79b63          	bne	a5,a4,1898 <strncmp+0x30>
    1886:	00054703          	lbu	a4,0(a0)
    188a:	0005c783          	lbu	a5,0(a1)
    188e:	cb19                	beqz	a4,18a4 <strncmp+0x3c>
    1890:	0005c783          	lbu	a5,0(a1)
    1894:	0585                	addi	a1,a1,1
    1896:	f3fd                	bnez	a5,187c <strncmp+0x14>
        ;
    return *l - *r;
    1898:	0007051b          	sext.w	a0,a4
    189c:	9d1d                	subw	a0,a0,a5
    189e:	8082                	ret
        return 0;
    18a0:	4501                	li	a0,0
}
    18a2:	8082                	ret
    18a4:	4501                	li	a0,0
    return *l - *r;
    18a6:	9d1d                	subw	a0,a0,a5
    18a8:	8082                	ret

00000000000018aa <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18aa:	00757793          	andi	a5,a0,7
    18ae:	cf89                	beqz	a5,18c8 <strlen+0x1e>
    18b0:	87aa                	mv	a5,a0
    18b2:	a029                	j	18bc <strlen+0x12>
    18b4:	0785                	addi	a5,a5,1
    18b6:	0077f713          	andi	a4,a5,7
    18ba:	cb01                	beqz	a4,18ca <strlen+0x20>
        if (!*s)
    18bc:	0007c703          	lbu	a4,0(a5)
    18c0:	fb75                	bnez	a4,18b4 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18c2:	40a78533          	sub	a0,a5,a0
}
    18c6:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18c8:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18ca:	6394                	ld	a3,0(a5)
    18cc:	00000597          	auipc	a1,0x0
    18d0:	6fc5b583          	ld	a1,1788(a1) # 1fc8 <__clone+0x102>
    18d4:	00000617          	auipc	a2,0x0
    18d8:	6fc63603          	ld	a2,1788(a2) # 1fd0 <__clone+0x10a>
    18dc:	a019                	j	18e2 <strlen+0x38>
    18de:	6794                	ld	a3,8(a5)
    18e0:	07a1                	addi	a5,a5,8
    18e2:	00b68733          	add	a4,a3,a1
    18e6:	fff6c693          	not	a3,a3
    18ea:	8f75                	and	a4,a4,a3
    18ec:	8f71                	and	a4,a4,a2
    18ee:	db65                	beqz	a4,18de <strlen+0x34>
    for (; *s; s++)
    18f0:	0007c703          	lbu	a4,0(a5)
    18f4:	d779                	beqz	a4,18c2 <strlen+0x18>
    18f6:	0017c703          	lbu	a4,1(a5)
    18fa:	0785                	addi	a5,a5,1
    18fc:	d379                	beqz	a4,18c2 <strlen+0x18>
    18fe:	0017c703          	lbu	a4,1(a5)
    1902:	0785                	addi	a5,a5,1
    1904:	fb6d                	bnez	a4,18f6 <strlen+0x4c>
    1906:	bf75                	j	18c2 <strlen+0x18>

0000000000001908 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1908:	00757713          	andi	a4,a0,7
{
    190c:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    190e:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1912:	cb19                	beqz	a4,1928 <memchr+0x20>
    1914:	ce25                	beqz	a2,198c <memchr+0x84>
    1916:	0007c703          	lbu	a4,0(a5)
    191a:	04b70e63          	beq	a4,a1,1976 <memchr+0x6e>
    191e:	0785                	addi	a5,a5,1
    1920:	0077f713          	andi	a4,a5,7
    1924:	167d                	addi	a2,a2,-1
    1926:	f77d                	bnez	a4,1914 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1928:	4501                	li	a0,0
    if (n && *s != c)
    192a:	c235                	beqz	a2,198e <memchr+0x86>
    192c:	0007c703          	lbu	a4,0(a5)
    1930:	04b70363          	beq	a4,a1,1976 <memchr+0x6e>
        size_t k = ONES * c;
    1934:	00000517          	auipc	a0,0x0
    1938:	6a453503          	ld	a0,1700(a0) # 1fd8 <__clone+0x112>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    193c:	471d                	li	a4,7
        size_t k = ONES * c;
    193e:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1942:	02c77a63          	bgeu	a4,a2,1976 <memchr+0x6e>
    1946:	00000897          	auipc	a7,0x0
    194a:	6828b883          	ld	a7,1666(a7) # 1fc8 <__clone+0x102>
    194e:	00000817          	auipc	a6,0x0
    1952:	68283803          	ld	a6,1666(a6) # 1fd0 <__clone+0x10a>
    1956:	431d                	li	t1,7
    1958:	a029                	j	1962 <memchr+0x5a>
    195a:	1661                	addi	a2,a2,-8
    195c:	07a1                	addi	a5,a5,8
    195e:	02c37963          	bgeu	t1,a2,1990 <memchr+0x88>
    1962:	6398                	ld	a4,0(a5)
    1964:	8f29                	xor	a4,a4,a0
    1966:	011706b3          	add	a3,a4,a7
    196a:	fff74713          	not	a4,a4
    196e:	8f75                	and	a4,a4,a3
    1970:	01077733          	and	a4,a4,a6
    1974:	d37d                	beqz	a4,195a <memchr+0x52>
    1976:	853e                	mv	a0,a5
    1978:	97b2                	add	a5,a5,a2
    197a:	a021                	j	1982 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    197c:	0505                	addi	a0,a0,1
    197e:	00f50763          	beq	a0,a5,198c <memchr+0x84>
    1982:	00054703          	lbu	a4,0(a0)
    1986:	feb71be3          	bne	a4,a1,197c <memchr+0x74>
    198a:	8082                	ret
    return n ? (void *)s : 0;
    198c:	4501                	li	a0,0
}
    198e:	8082                	ret
    return n ? (void *)s : 0;
    1990:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1992:	f275                	bnez	a2,1976 <memchr+0x6e>
}
    1994:	8082                	ret

0000000000001996 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1996:	1101                	addi	sp,sp,-32
    1998:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    199a:	862e                	mv	a2,a1
{
    199c:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    199e:	4581                	li	a1,0
{
    19a0:	e426                	sd	s1,8(sp)
    19a2:	ec06                	sd	ra,24(sp)
    19a4:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19a6:	f63ff0ef          	jal	ra,1908 <memchr>
    return p ? p - s : n;
    19aa:	c519                	beqz	a0,19b8 <strnlen+0x22>
}
    19ac:	60e2                	ld	ra,24(sp)
    19ae:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19b0:	8d05                	sub	a0,a0,s1
}
    19b2:	64a2                	ld	s1,8(sp)
    19b4:	6105                	addi	sp,sp,32
    19b6:	8082                	ret
    19b8:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19ba:	8522                	mv	a0,s0
}
    19bc:	6442                	ld	s0,16(sp)
    19be:	64a2                	ld	s1,8(sp)
    19c0:	6105                	addi	sp,sp,32
    19c2:	8082                	ret

00000000000019c4 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19c4:	00b547b3          	xor	a5,a0,a1
    19c8:	8b9d                	andi	a5,a5,7
    19ca:	eb95                	bnez	a5,19fe <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19cc:	0075f793          	andi	a5,a1,7
    19d0:	e7b1                	bnez	a5,1a1c <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19d2:	6198                	ld	a4,0(a1)
    19d4:	00000617          	auipc	a2,0x0
    19d8:	5f463603          	ld	a2,1524(a2) # 1fc8 <__clone+0x102>
    19dc:	00000817          	auipc	a6,0x0
    19e0:	5f483803          	ld	a6,1524(a6) # 1fd0 <__clone+0x10a>
    19e4:	a029                	j	19ee <strcpy+0x2a>
    19e6:	e118                	sd	a4,0(a0)
    19e8:	6598                	ld	a4,8(a1)
    19ea:	05a1                	addi	a1,a1,8
    19ec:	0521                	addi	a0,a0,8
    19ee:	00c707b3          	add	a5,a4,a2
    19f2:	fff74693          	not	a3,a4
    19f6:	8ff5                	and	a5,a5,a3
    19f8:	0107f7b3          	and	a5,a5,a6
    19fc:	d7ed                	beqz	a5,19e6 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19fe:	0005c783          	lbu	a5,0(a1)
    1a02:	00f50023          	sb	a5,0(a0)
    1a06:	c785                	beqz	a5,1a2e <strcpy+0x6a>
    1a08:	0015c783          	lbu	a5,1(a1)
    1a0c:	0505                	addi	a0,a0,1
    1a0e:	0585                	addi	a1,a1,1
    1a10:	00f50023          	sb	a5,0(a0)
    1a14:	fbf5                	bnez	a5,1a08 <strcpy+0x44>
        ;
    return d;
}
    1a16:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a18:	0505                	addi	a0,a0,1
    1a1a:	df45                	beqz	a4,19d2 <strcpy+0xe>
            if (!(*d = *s))
    1a1c:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a20:	0585                	addi	a1,a1,1
    1a22:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1a26:	00f50023          	sb	a5,0(a0)
    1a2a:	f7fd                	bnez	a5,1a18 <strcpy+0x54>
}
    1a2c:	8082                	ret
    1a2e:	8082                	ret

0000000000001a30 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a30:	00b547b3          	xor	a5,a0,a1
    1a34:	8b9d                	andi	a5,a5,7
    1a36:	1a079863          	bnez	a5,1be6 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a3a:	0075f793          	andi	a5,a1,7
    1a3e:	16078463          	beqz	a5,1ba6 <strncpy+0x176>
    1a42:	ea01                	bnez	a2,1a52 <strncpy+0x22>
    1a44:	a421                	j	1c4c <strncpy+0x21c>
    1a46:	167d                	addi	a2,a2,-1
    1a48:	0505                	addi	a0,a0,1
    1a4a:	14070e63          	beqz	a4,1ba6 <strncpy+0x176>
    1a4e:	1a060863          	beqz	a2,1bfe <strncpy+0x1ce>
    1a52:	0005c783          	lbu	a5,0(a1)
    1a56:	0585                	addi	a1,a1,1
    1a58:	0075f713          	andi	a4,a1,7
    1a5c:	00f50023          	sb	a5,0(a0)
    1a60:	f3fd                	bnez	a5,1a46 <strncpy+0x16>
    1a62:	4805                	li	a6,1
    1a64:	1a061863          	bnez	a2,1c14 <strncpy+0x1e4>
    1a68:	40a007b3          	neg	a5,a0
    1a6c:	8b9d                	andi	a5,a5,7
    1a6e:	4681                	li	a3,0
    1a70:	18061a63          	bnez	a2,1c04 <strncpy+0x1d4>
    1a74:	00778713          	addi	a4,a5,7
    1a78:	45ad                	li	a1,11
    1a7a:	18b76363          	bltu	a4,a1,1c00 <strncpy+0x1d0>
    1a7e:	1ae6eb63          	bltu	a3,a4,1c34 <strncpy+0x204>
    1a82:	1a078363          	beqz	a5,1c28 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a86:	00050023          	sb	zero,0(a0)
    1a8a:	4685                	li	a3,1
    1a8c:	00150713          	addi	a4,a0,1
    1a90:	18d78f63          	beq	a5,a3,1c2e <strncpy+0x1fe>
    1a94:	000500a3          	sb	zero,1(a0)
    1a98:	4689                	li	a3,2
    1a9a:	00250713          	addi	a4,a0,2
    1a9e:	18d78e63          	beq	a5,a3,1c3a <strncpy+0x20a>
    1aa2:	00050123          	sb	zero,2(a0)
    1aa6:	468d                	li	a3,3
    1aa8:	00350713          	addi	a4,a0,3
    1aac:	16d78c63          	beq	a5,a3,1c24 <strncpy+0x1f4>
    1ab0:	000501a3          	sb	zero,3(a0)
    1ab4:	4691                	li	a3,4
    1ab6:	00450713          	addi	a4,a0,4
    1aba:	18d78263          	beq	a5,a3,1c3e <strncpy+0x20e>
    1abe:	00050223          	sb	zero,4(a0)
    1ac2:	4695                	li	a3,5
    1ac4:	00550713          	addi	a4,a0,5
    1ac8:	16d78d63          	beq	a5,a3,1c42 <strncpy+0x212>
    1acc:	000502a3          	sb	zero,5(a0)
    1ad0:	469d                	li	a3,7
    1ad2:	00650713          	addi	a4,a0,6
    1ad6:	16d79863          	bne	a5,a3,1c46 <strncpy+0x216>
    1ada:	00750713          	addi	a4,a0,7
    1ade:	00050323          	sb	zero,6(a0)
    1ae2:	40f80833          	sub	a6,a6,a5
    1ae6:	ff887593          	andi	a1,a6,-8
    1aea:	97aa                	add	a5,a5,a0
    1aec:	95be                	add	a1,a1,a5
    1aee:	0007b023          	sd	zero,0(a5)
    1af2:	07a1                	addi	a5,a5,8
    1af4:	feb79de3          	bne	a5,a1,1aee <strncpy+0xbe>
    1af8:	ff887593          	andi	a1,a6,-8
    1afc:	9ead                	addw	a3,a3,a1
    1afe:	00b707b3          	add	a5,a4,a1
    1b02:	12b80863          	beq	a6,a1,1c32 <strncpy+0x202>
    1b06:	00078023          	sb	zero,0(a5)
    1b0a:	0016871b          	addiw	a4,a3,1
    1b0e:	0ec77863          	bgeu	a4,a2,1bfe <strncpy+0x1ce>
    1b12:	000780a3          	sb	zero,1(a5)
    1b16:	0026871b          	addiw	a4,a3,2
    1b1a:	0ec77263          	bgeu	a4,a2,1bfe <strncpy+0x1ce>
    1b1e:	00078123          	sb	zero,2(a5)
    1b22:	0036871b          	addiw	a4,a3,3
    1b26:	0cc77c63          	bgeu	a4,a2,1bfe <strncpy+0x1ce>
    1b2a:	000781a3          	sb	zero,3(a5)
    1b2e:	0046871b          	addiw	a4,a3,4
    1b32:	0cc77663          	bgeu	a4,a2,1bfe <strncpy+0x1ce>
    1b36:	00078223          	sb	zero,4(a5)
    1b3a:	0056871b          	addiw	a4,a3,5
    1b3e:	0cc77063          	bgeu	a4,a2,1bfe <strncpy+0x1ce>
    1b42:	000782a3          	sb	zero,5(a5)
    1b46:	0066871b          	addiw	a4,a3,6
    1b4a:	0ac77a63          	bgeu	a4,a2,1bfe <strncpy+0x1ce>
    1b4e:	00078323          	sb	zero,6(a5)
    1b52:	0076871b          	addiw	a4,a3,7
    1b56:	0ac77463          	bgeu	a4,a2,1bfe <strncpy+0x1ce>
    1b5a:	000783a3          	sb	zero,7(a5)
    1b5e:	0086871b          	addiw	a4,a3,8
    1b62:	08c77e63          	bgeu	a4,a2,1bfe <strncpy+0x1ce>
    1b66:	00078423          	sb	zero,8(a5)
    1b6a:	0096871b          	addiw	a4,a3,9
    1b6e:	08c77863          	bgeu	a4,a2,1bfe <strncpy+0x1ce>
    1b72:	000784a3          	sb	zero,9(a5)
    1b76:	00a6871b          	addiw	a4,a3,10
    1b7a:	08c77263          	bgeu	a4,a2,1bfe <strncpy+0x1ce>
    1b7e:	00078523          	sb	zero,10(a5)
    1b82:	00b6871b          	addiw	a4,a3,11
    1b86:	06c77c63          	bgeu	a4,a2,1bfe <strncpy+0x1ce>
    1b8a:	000785a3          	sb	zero,11(a5)
    1b8e:	00c6871b          	addiw	a4,a3,12
    1b92:	06c77663          	bgeu	a4,a2,1bfe <strncpy+0x1ce>
    1b96:	00078623          	sb	zero,12(a5)
    1b9a:	26b5                	addiw	a3,a3,13
    1b9c:	06c6f163          	bgeu	a3,a2,1bfe <strncpy+0x1ce>
    1ba0:	000786a3          	sb	zero,13(a5)
    1ba4:	8082                	ret
            ;
        if (!n || !*s)
    1ba6:	c645                	beqz	a2,1c4e <strncpy+0x21e>
    1ba8:	0005c783          	lbu	a5,0(a1)
    1bac:	ea078be3          	beqz	a5,1a62 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bb0:	479d                	li	a5,7
    1bb2:	02c7ff63          	bgeu	a5,a2,1bf0 <strncpy+0x1c0>
    1bb6:	00000897          	auipc	a7,0x0
    1bba:	4128b883          	ld	a7,1042(a7) # 1fc8 <__clone+0x102>
    1bbe:	00000817          	auipc	a6,0x0
    1bc2:	41283803          	ld	a6,1042(a6) # 1fd0 <__clone+0x10a>
    1bc6:	431d                	li	t1,7
    1bc8:	6198                	ld	a4,0(a1)
    1bca:	011707b3          	add	a5,a4,a7
    1bce:	fff74693          	not	a3,a4
    1bd2:	8ff5                	and	a5,a5,a3
    1bd4:	0107f7b3          	and	a5,a5,a6
    1bd8:	ef81                	bnez	a5,1bf0 <strncpy+0x1c0>
            *wd = *ws;
    1bda:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bdc:	1661                	addi	a2,a2,-8
    1bde:	05a1                	addi	a1,a1,8
    1be0:	0521                	addi	a0,a0,8
    1be2:	fec363e3          	bltu	t1,a2,1bc8 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1be6:	e609                	bnez	a2,1bf0 <strncpy+0x1c0>
    1be8:	a08d                	j	1c4a <strncpy+0x21a>
    1bea:	167d                	addi	a2,a2,-1
    1bec:	0505                	addi	a0,a0,1
    1bee:	ca01                	beqz	a2,1bfe <strncpy+0x1ce>
    1bf0:	0005c783          	lbu	a5,0(a1)
    1bf4:	0585                	addi	a1,a1,1
    1bf6:	00f50023          	sb	a5,0(a0)
    1bfa:	fbe5                	bnez	a5,1bea <strncpy+0x1ba>
        ;
tail:
    1bfc:	b59d                	j	1a62 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1bfe:	8082                	ret
    1c00:	472d                	li	a4,11
    1c02:	bdb5                	j	1a7e <strncpy+0x4e>
    1c04:	00778713          	addi	a4,a5,7
    1c08:	45ad                	li	a1,11
    1c0a:	fff60693          	addi	a3,a2,-1
    1c0e:	e6b778e3          	bgeu	a4,a1,1a7e <strncpy+0x4e>
    1c12:	b7fd                	j	1c00 <strncpy+0x1d0>
    1c14:	40a007b3          	neg	a5,a0
    1c18:	8832                	mv	a6,a2
    1c1a:	8b9d                	andi	a5,a5,7
    1c1c:	4681                	li	a3,0
    1c1e:	e4060be3          	beqz	a2,1a74 <strncpy+0x44>
    1c22:	b7cd                	j	1c04 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c24:	468d                	li	a3,3
    1c26:	bd75                	j	1ae2 <strncpy+0xb2>
    1c28:	872a                	mv	a4,a0
    1c2a:	4681                	li	a3,0
    1c2c:	bd5d                	j	1ae2 <strncpy+0xb2>
    1c2e:	4685                	li	a3,1
    1c30:	bd4d                	j	1ae2 <strncpy+0xb2>
    1c32:	8082                	ret
    1c34:	87aa                	mv	a5,a0
    1c36:	4681                	li	a3,0
    1c38:	b5f9                	j	1b06 <strncpy+0xd6>
    1c3a:	4689                	li	a3,2
    1c3c:	b55d                	j	1ae2 <strncpy+0xb2>
    1c3e:	4691                	li	a3,4
    1c40:	b54d                	j	1ae2 <strncpy+0xb2>
    1c42:	4695                	li	a3,5
    1c44:	bd79                	j	1ae2 <strncpy+0xb2>
    1c46:	4699                	li	a3,6
    1c48:	bd69                	j	1ae2 <strncpy+0xb2>
    1c4a:	8082                	ret
    1c4c:	8082                	ret
    1c4e:	8082                	ret

0000000000001c50 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c50:	87aa                	mv	a5,a0
    1c52:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c54:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c58:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c5c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c5e:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c60:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c64:	2501                	sext.w	a0,a0
    1c66:	8082                	ret

0000000000001c68 <openat>:
    register long a7 __asm__("a7") = n;
    1c68:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c6c:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c70:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c74:	2501                	sext.w	a0,a0
    1c76:	8082                	ret

0000000000001c78 <close>:
    register long a7 __asm__("a7") = n;
    1c78:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c7c:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c80:	2501                	sext.w	a0,a0
    1c82:	8082                	ret

0000000000001c84 <read>:
    register long a7 __asm__("a7") = n;
    1c84:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c88:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c8c:	8082                	ret

0000000000001c8e <write>:
    register long a7 __asm__("a7") = n;
    1c8e:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c92:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c96:	8082                	ret

0000000000001c98 <getpid>:
    register long a7 __asm__("a7") = n;
    1c98:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c9c:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1ca0:	2501                	sext.w	a0,a0
    1ca2:	8082                	ret

0000000000001ca4 <getppid>:
    register long a7 __asm__("a7") = n;
    1ca4:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1ca8:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cac:	2501                	sext.w	a0,a0
    1cae:	8082                	ret

0000000000001cb0 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cb0:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cb4:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1cb8:	2501                	sext.w	a0,a0
    1cba:	8082                	ret

0000000000001cbc <fork>:
    register long a7 __asm__("a7") = n;
    1cbc:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cc0:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cc2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cc4:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cc8:	2501                	sext.w	a0,a0
    1cca:	8082                	ret

0000000000001ccc <clone>:
// 子进程执行的执行的函数指针 | 函数参数 | 栈地址 | 栈的大小 | 标志位
pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1ccc:	85b2                	mv	a1,a2
    1cce:	863a                	mv	a2,a4
    if (stack)
    1cd0:	c191                	beqz	a1,1cd4 <clone+0x8>
	stack += stack_size;
    1cd2:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cd4:	4781                	li	a5,0
    1cd6:	4701                	li	a4,0
    1cd8:	4681                	li	a3,0
    1cda:	2601                	sext.w	a2,a2
    1cdc:	a2ed                	j	1ec6 <__clone>

0000000000001cde <exit>:
    register long a7 __asm__("a7") = n;
    1cde:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1ce2:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1ce6:	8082                	ret

0000000000001ce8 <waitpid>:
    register long a7 __asm__("a7") = n;
    1ce8:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cec:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cee:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cf2:	2501                	sext.w	a0,a0
    1cf4:	8082                	ret

0000000000001cf6 <exec>:
    register long a7 __asm__("a7") = n;
    1cf6:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cfa:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cfe:	2501                	sext.w	a0,a0
    1d00:	8082                	ret

0000000000001d02 <execve>:
    register long a7 __asm__("a7") = n;
    1d02:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d06:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d0a:	2501                	sext.w	a0,a0
    1d0c:	8082                	ret

0000000000001d0e <times>:
    register long a7 __asm__("a7") = n;
    1d0e:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d12:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d16:	2501                	sext.w	a0,a0
    1d18:	8082                	ret

0000000000001d1a <get_time>:

int64 get_time()
{
    1d1a:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d1c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d20:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d22:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d24:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d28:	2501                	sext.w	a0,a0
    1d2a:	ed09                	bnez	a0,1d44 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d2c:	67a2                	ld	a5,8(sp)
    1d2e:	3e800713          	li	a4,1000
    1d32:	00015503          	lhu	a0,0(sp)
    1d36:	02e7d7b3          	divu	a5,a5,a4
    1d3a:	02e50533          	mul	a0,a0,a4
    1d3e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d40:	0141                	addi	sp,sp,16
    1d42:	8082                	ret
        return -1;
    1d44:	557d                	li	a0,-1
    1d46:	bfed                	j	1d40 <get_time+0x26>

0000000000001d48 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d48:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d4c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d50:	2501                	sext.w	a0,a0
    1d52:	8082                	ret

0000000000001d54 <time>:
    register long a7 __asm__("a7") = n;
    1d54:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d58:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d5c:	2501                	sext.w	a0,a0
    1d5e:	8082                	ret

0000000000001d60 <sleep>:

int sleep(unsigned long long time)
{
    1d60:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d62:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d64:	850a                	mv	a0,sp
    1d66:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d68:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d6c:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d6e:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d72:	e501                	bnez	a0,1d7a <sleep+0x1a>
    return 0;
    1d74:	4501                	li	a0,0
}
    1d76:	0141                	addi	sp,sp,16
    1d78:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d7a:	4502                	lw	a0,0(sp)
}
    1d7c:	0141                	addi	sp,sp,16
    1d7e:	8082                	ret

0000000000001d80 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d80:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d84:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d88:	2501                	sext.w	a0,a0
    1d8a:	8082                	ret

0000000000001d8c <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d8c:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d90:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d94:	8082                	ret

0000000000001d96 <munmap>:
    register long a7 __asm__("a7") = n;
    1d96:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d9a:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d9e:	2501                	sext.w	a0,a0
    1da0:	8082                	ret

0000000000001da2 <wait>:

int wait(int *code)
{
    1da2:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1da4:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1da8:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1daa:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dac:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dae:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1db2:	2501                	sext.w	a0,a0
    1db4:	8082                	ret

0000000000001db6 <spawn>:
    register long a7 __asm__("a7") = n;
    1db6:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dba:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <mailread>:
    register long a7 __asm__("a7") = n;
    1dc2:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc6:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dce:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd2:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <fstat>:
    register long a7 __asm__("a7") = n;
    1dda:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dde:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1de2:	2501                	sext.w	a0,a0
    1de4:	8082                	ret

0000000000001de6 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1de6:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1de8:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dec:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dee:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1df2:	2501                	sext.w	a0,a0
    1df4:	8082                	ret

0000000000001df6 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1df6:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1df8:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1dfc:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfe:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e02:	2501                	sext.w	a0,a0
    1e04:	8082                	ret

0000000000001e06 <link>:

int link(char *old_path, char *new_path)
{
    1e06:	87aa                	mv	a5,a0
    1e08:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e0a:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e0e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e12:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e14:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e18:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e1a:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e1e:	2501                	sext.w	a0,a0
    1e20:	8082                	ret

0000000000001e22 <unlink>:

int unlink(char *path)
{
    1e22:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e24:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e28:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e2c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e2e:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <uname>:
    register long a7 __asm__("a7") = n;
    1e36:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e3a:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e3e:	2501                	sext.w	a0,a0
    1e40:	8082                	ret

0000000000001e42 <brk>:
    register long a7 __asm__("a7") = n;
    1e42:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e46:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e4a:	2501                	sext.w	a0,a0
    1e4c:	8082                	ret

0000000000001e4e <getcwd>:
    register long a7 __asm__("a7") = n;
    1e4e:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e50:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e54:	8082                	ret

0000000000001e56 <chdir>:
    register long a7 __asm__("a7") = n;
    1e56:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e5a:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e62:	862e                	mv	a2,a1
    1e64:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e66:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e68:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e6c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e70:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e72:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e74:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e78:	2501                	sext.w	a0,a0
    1e7a:	8082                	ret

0000000000001e7c <getdents>:
    register long a7 __asm__("a7") = n;
    1e7c:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e80:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e84:	2501                	sext.w	a0,a0
    1e86:	8082                	ret

0000000000001e88 <pipe>:
    register long a7 __asm__("a7") = n;
    1e88:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e8c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e8e:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e92:	2501                	sext.w	a0,a0
    1e94:	8082                	ret

0000000000001e96 <dup>:
    register long a7 __asm__("a7") = n;
    1e96:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e98:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e9c:	2501                	sext.w	a0,a0
    1e9e:	8082                	ret

0000000000001ea0 <dup2>:
    register long a7 __asm__("a7") = n;
    1ea0:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1ea2:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea4:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <mount>:
    register long a7 __asm__("a7") = n;
    1eac:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eb0:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1eb4:	2501                	sext.w	a0,a0
    1eb6:	8082                	ret

0000000000001eb8 <umount>:
    register long a7 __asm__("a7") = n;
    1eb8:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ebc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ebe:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ec2:	2501                	sext.w	a0,a0
    1ec4:	8082                	ret

0000000000001ec6 <__clone>:
.global __clone
.type  __clone, %function
# 函数指针 | 栈地址 | 标志位
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ec6:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1ec8:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1eca:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ecc:	8532                	mv	a0,a2
	mv a2, a4
    1ece:	863a                	mv	a2,a4
	mv a3, a5
    1ed0:	86be                	mv	a3,a5
	mv a4, a6
    1ed2:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ed4:	0dc00893          	li	a7,220
	ecall
    1ed8:	00000073          	ecall

	beqz a0, 1f
    1edc:	c111                	beqz	a0,1ee0 <__clone+0x1a>
	# Parent
	ret
    1ede:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ee0:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ee2:	6522                	ld	a0,8(sp)
	jalr a1
    1ee4:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ee6:	05d00893          	li	a7,93
	ecall
    1eea:	00000073          	ecall
