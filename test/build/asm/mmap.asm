
/home/lmq/lmq/cscc/xv6-k210/test/build/riscv64/mmap:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a201                	j	1102 <__start_main>

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
    100a:	eba50513          	addi	a0,a0,-326 # 1ec0 <__clone+0x2e>
void test_mmap(void){
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e04a                	sd	s2,0(sp)
    1014:	e426                	sd	s1,8(sp)
    TEST_START(__func__);
    1016:	2ea000ef          	jal	ra,1300 <puts>
    101a:	00001517          	auipc	a0,0x1
    101e:	fe650513          	addi	a0,a0,-26 # 2000 <__func__.1193>
    1022:	2de000ef          	jal	ra,1300 <puts>
    1026:	00001517          	auipc	a0,0x1
    102a:	eb250513          	addi	a0,a0,-334 # 1ed8 <__clone+0x46>
    102e:	2d2000ef          	jal	ra,1300 <puts>
    char *array;
    const char *str = "  Hello, mmap successfully!";
    int fd;

    fd = open("test_mmap.txt", O_RDWR | O_CREATE);
    1032:	04200593          	li	a1,66
    1036:	00001517          	auipc	a0,0x1
    103a:	eb250513          	addi	a0,a0,-334 # 1ee8 <__clone+0x56>
    103e:	3df000ef          	jal	ra,1c1c <open>
    1042:	842a                	mv	s0,a0
    write(fd, str, strlen(str));
    1044:	00001517          	auipc	a0,0x1
    1048:	eb450513          	addi	a0,a0,-332 # 1ef8 <__clone+0x66>
    104c:	02b000ef          	jal	ra,1876 <strlen>
    1050:	862a                	mv	a2,a0
    1052:	00001597          	auipc	a1,0x1
    1056:	ea658593          	addi	a1,a1,-346 # 1ef8 <__clone+0x66>
    105a:	8522                	mv	a0,s0
    105c:	3ff000ef          	jal	ra,1c5a <write>
    fstat(fd, &kst);
    1060:	00001917          	auipc	s2,0x1
    1064:	f2090913          	addi	s2,s2,-224 # 1f80 <kst>
    1068:	85ca                	mv	a1,s2
    106a:	8522                	mv	a0,s0
    106c:	53b000ef          	jal	ra,1da6 <fstat>
    printf("file len: %d\n", kst.st_size);
    1070:	03093583          	ld	a1,48(s2)
    1074:	00001517          	auipc	a0,0x1
    1078:	ea450513          	addi	a0,a0,-348 # 1f18 <__clone+0x86>
    107c:	2a6000ef          	jal	ra,1322 <printf>
    array = mmap(NULL, kst.st_size, PROT_WRITE | PROT_READ, MAP_FILE | MAP_SHARED, fd, 0);
    1080:	03093583          	ld	a1,48(s2)
    1084:	4781                	li	a5,0
    1086:	8722                	mv	a4,s0
    1088:	4685                	li	a3,1
    108a:	460d                	li	a2,3
    108c:	4501                	li	a0,0
    108e:	4cb000ef          	jal	ra,1d58 <mmap>
    //printf("return array: %x\n", array);

    if (array == MAP_FAILED) {
    1092:	57fd                	li	a5,-1
    1094:	04f50863          	beq	a0,a5,10e4 <test_mmap+0xe0>
	printf("mmap error.\n");
    }else{
	printf("mmap content: %s\n", array);
    1098:	85aa                	mv	a1,a0
    109a:	84aa                	mv	s1,a0
    109c:	00001517          	auipc	a0,0x1
    10a0:	e9c50513          	addi	a0,a0,-356 # 1f38 <__clone+0xa6>
    10a4:	27e000ef          	jal	ra,1322 <printf>
	//printf("%s\n", str);

	munmap(array, kst.st_size);
    10a8:	03093583          	ld	a1,48(s2)
    10ac:	8526                	mv	a0,s1
    10ae:	4b5000ef          	jal	ra,1d62 <munmap>
    }

    close(fd);
    10b2:	8522                	mv	a0,s0
    10b4:	391000ef          	jal	ra,1c44 <close>

    TEST_END(__func__);
    10b8:	00001517          	auipc	a0,0x1
    10bc:	e9850513          	addi	a0,a0,-360 # 1f50 <__clone+0xbe>
    10c0:	240000ef          	jal	ra,1300 <puts>
    10c4:	00001517          	auipc	a0,0x1
    10c8:	f3c50513          	addi	a0,a0,-196 # 2000 <__func__.1193>
    10cc:	234000ef          	jal	ra,1300 <puts>
}
    10d0:	6442                	ld	s0,16(sp)
    10d2:	60e2                	ld	ra,24(sp)
    10d4:	64a2                	ld	s1,8(sp)
    10d6:	6902                	ld	s2,0(sp)
    TEST_END(__func__);
    10d8:	00001517          	auipc	a0,0x1
    10dc:	e0050513          	addi	a0,a0,-512 # 1ed8 <__clone+0x46>
}
    10e0:	6105                	addi	sp,sp,32
    TEST_END(__func__);
    10e2:	ac39                	j	1300 <puts>
	printf("mmap error.\n");
    10e4:	00001517          	auipc	a0,0x1
    10e8:	e4450513          	addi	a0,a0,-444 # 1f28 <__clone+0x96>
    10ec:	236000ef          	jal	ra,1322 <printf>
    10f0:	b7c9                	j	10b2 <test_mmap+0xae>

00000000000010f2 <main>:

int main(void){
    10f2:	1141                	addi	sp,sp,-16
    10f4:	e406                	sd	ra,8(sp)
    test_mmap();
    10f6:	f0fff0ef          	jal	ra,1004 <test_mmap>
    return 0;
}
    10fa:	60a2                	ld	ra,8(sp)
    10fc:	4501                	li	a0,0
    10fe:	0141                	addi	sp,sp,16
    1100:	8082                	ret

0000000000001102 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1102:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1104:	4108                	lw	a0,0(a0)
{
    1106:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1108:	05a1                	addi	a1,a1,8
{
    110a:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    110c:	fe7ff0ef          	jal	ra,10f2 <main>
    1110:	39b000ef          	jal	ra,1caa <exit>
	return 0;
}
    1114:	60a2                	ld	ra,8(sp)
    1116:	4501                	li	a0,0
    1118:	0141                	addi	sp,sp,16
    111a:	8082                	ret

000000000000111c <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    111c:	7179                	addi	sp,sp,-48
    111e:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1120:	12054b63          	bltz	a0,1256 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1124:	02b577bb          	remuw	a5,a0,a1
    1128:	00001697          	auipc	a3,0x1
    112c:	ee868693          	addi	a3,a3,-280 # 2010 <digits>
    buf[16] = 0;
    1130:	00010c23          	sb	zero,24(sp)
    i = 15;
    1134:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    1138:	1782                	slli	a5,a5,0x20
    113a:	9381                	srli	a5,a5,0x20
    113c:	97b6                	add	a5,a5,a3
    113e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1142:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1146:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    114a:	16b56263          	bltu	a0,a1,12ae <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    114e:	02e8763b          	remuw	a2,a6,a4
    1152:	1602                	slli	a2,a2,0x20
    1154:	9201                	srli	a2,a2,0x20
    1156:	9636                	add	a2,a2,a3
    1158:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1160:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1164:	12e86963          	bltu	a6,a4,1296 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    1168:	02e5f63b          	remuw	a2,a1,a4
    116c:	1602                	slli	a2,a2,0x20
    116e:	9201                	srli	a2,a2,0x20
    1170:	9636                	add	a2,a2,a3
    1172:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1176:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    117a:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    117e:	10e5ef63          	bltu	a1,a4,129c <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1182:	02e8763b          	remuw	a2,a6,a4
    1186:	1602                	slli	a2,a2,0x20
    1188:	9201                	srli	a2,a2,0x20
    118a:	9636                	add	a2,a2,a3
    118c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1190:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1194:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1198:	10e86563          	bltu	a6,a4,12a2 <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    119c:	02e5f63b          	remuw	a2,a1,a4
    11a0:	1602                	slli	a2,a2,0x20
    11a2:	9201                	srli	a2,a2,0x20
    11a4:	9636                	add	a2,a2,a3
    11a6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11aa:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11ae:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11b2:	0ee5eb63          	bltu	a1,a4,12a8 <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    11b6:	02e8763b          	remuw	a2,a6,a4
    11ba:	1602                	slli	a2,a2,0x20
    11bc:	9201                	srli	a2,a2,0x20
    11be:	9636                	add	a2,a2,a3
    11c0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c4:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11c8:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11cc:	0ce86263          	bltu	a6,a4,1290 <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    11d0:	02e5f63b          	remuw	a2,a1,a4
    11d4:	1602                	slli	a2,a2,0x20
    11d6:	9201                	srli	a2,a2,0x20
    11d8:	9636                	add	a2,a2,a3
    11da:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11de:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11e2:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11e6:	0ce5e663          	bltu	a1,a4,12b2 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    11ea:	02e8763b          	remuw	a2,a6,a4
    11ee:	1602                	slli	a2,a2,0x20
    11f0:	9201                	srli	a2,a2,0x20
    11f2:	9636                	add	a2,a2,a3
    11f4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11f8:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11fc:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1200:	0ae86c63          	bltu	a6,a4,12b8 <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    1204:	02e5f63b          	remuw	a2,a1,a4
    1208:	1602                	slli	a2,a2,0x20
    120a:	9201                	srli	a2,a2,0x20
    120c:	9636                	add	a2,a2,a3
    120e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1212:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1216:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    121a:	0ae5e263          	bltu	a1,a4,12be <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    121e:	1782                	slli	a5,a5,0x20
    1220:	9381                	srli	a5,a5,0x20
    1222:	97b6                	add	a5,a5,a3
    1224:	0007c703          	lbu	a4,0(a5)
    1228:	4599                	li	a1,6
    122a:	4795                	li	a5,5
    122c:	00e10723          	sb	a4,14(sp)

    if (sign)
    1230:	00055963          	bgez	a0,1242 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1234:	1018                	addi	a4,sp,32
    1236:	973e                	add	a4,a4,a5
    1238:	02d00693          	li	a3,45
    123c:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    1240:	85be                	mv	a1,a5
    write(f, s, l);
    1242:	003c                	addi	a5,sp,8
    1244:	4641                	li	a2,16
    1246:	9e0d                	subw	a2,a2,a1
    1248:	4505                	li	a0,1
    124a:	95be                	add	a1,a1,a5
    124c:	20f000ef          	jal	ra,1c5a <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1250:	70a2                	ld	ra,40(sp)
    1252:	6145                	addi	sp,sp,48
    1254:	8082                	ret
        x = -xx;
    1256:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    125a:	02b677bb          	remuw	a5,a2,a1
    125e:	00001697          	auipc	a3,0x1
    1262:	db268693          	addi	a3,a3,-590 # 2010 <digits>
    buf[16] = 0;
    1266:	00010c23          	sb	zero,24(sp)
    i = 15;
    126a:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    126e:	1782                	slli	a5,a5,0x20
    1270:	9381                	srli	a5,a5,0x20
    1272:	97b6                	add	a5,a5,a3
    1274:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1278:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    127c:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1280:	ecb677e3          	bgeu	a2,a1,114e <printint.constprop.0+0x32>
        buf[i--] = '-';
    1284:	02d00793          	li	a5,45
    1288:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    128c:	45b9                	li	a1,14
    128e:	bf55                	j	1242 <printint.constprop.0+0x126>
    1290:	47a5                	li	a5,9
    1292:	45a9                	li	a1,10
    1294:	bf71                	j	1230 <printint.constprop.0+0x114>
    1296:	47b5                	li	a5,13
    1298:	45b9                	li	a1,14
    129a:	bf59                	j	1230 <printint.constprop.0+0x114>
    129c:	47b1                	li	a5,12
    129e:	45b5                	li	a1,13
    12a0:	bf41                	j	1230 <printint.constprop.0+0x114>
    12a2:	47ad                	li	a5,11
    12a4:	45b1                	li	a1,12
    12a6:	b769                	j	1230 <printint.constprop.0+0x114>
    12a8:	47a9                	li	a5,10
    12aa:	45ad                	li	a1,11
    12ac:	b751                	j	1230 <printint.constprop.0+0x114>
    i = 15;
    12ae:	45bd                	li	a1,15
    12b0:	bf49                	j	1242 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    12b2:	47a1                	li	a5,8
    12b4:	45a5                	li	a1,9
    12b6:	bfad                	j	1230 <printint.constprop.0+0x114>
    12b8:	479d                	li	a5,7
    12ba:	45a1                	li	a1,8
    12bc:	bf95                	j	1230 <printint.constprop.0+0x114>
    12be:	4799                	li	a5,6
    12c0:	459d                	li	a1,7
    12c2:	b7bd                	j	1230 <printint.constprop.0+0x114>

00000000000012c4 <getchar>:
{
    12c4:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12c6:	00f10593          	addi	a1,sp,15
    12ca:	4605                	li	a2,1
    12cc:	4501                	li	a0,0
{
    12ce:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12d0:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12d4:	17d000ef          	jal	ra,1c50 <read>
}
    12d8:	60e2                	ld	ra,24(sp)
    12da:	00f14503          	lbu	a0,15(sp)
    12de:	6105                	addi	sp,sp,32
    12e0:	8082                	ret

00000000000012e2 <putchar>:
{
    12e2:	1101                	addi	sp,sp,-32
    12e4:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12e6:	00f10593          	addi	a1,sp,15
    12ea:	4605                	li	a2,1
    12ec:	4505                	li	a0,1
{
    12ee:	ec06                	sd	ra,24(sp)
    char byte = c;
    12f0:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12f4:	167000ef          	jal	ra,1c5a <write>
}
    12f8:	60e2                	ld	ra,24(sp)
    12fa:	2501                	sext.w	a0,a0
    12fc:	6105                	addi	sp,sp,32
    12fe:	8082                	ret

0000000000001300 <puts>:
{
    1300:	1141                	addi	sp,sp,-16
    1302:	e406                	sd	ra,8(sp)
    1304:	e022                	sd	s0,0(sp)
    1306:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1308:	56e000ef          	jal	ra,1876 <strlen>
    130c:	862a                	mv	a2,a0
    130e:	85a2                	mv	a1,s0
    1310:	4505                	li	a0,1
    1312:	149000ef          	jal	ra,1c5a <write>
}
    1316:	60a2                	ld	ra,8(sp)
    1318:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    131a:	957d                	srai	a0,a0,0x3f
    return r;
    131c:	2501                	sext.w	a0,a0
}
    131e:	0141                	addi	sp,sp,16
    1320:	8082                	ret

0000000000001322 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1322:	7171                	addi	sp,sp,-176
    1324:	fc56                	sd	s5,56(sp)
    1326:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1328:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    132a:	18bc                	addi	a5,sp,120
{
    132c:	e8ca                	sd	s2,80(sp)
    132e:	e4ce                	sd	s3,72(sp)
    1330:	e0d2                	sd	s4,64(sp)
    1332:	f85a                	sd	s6,48(sp)
    1334:	f486                	sd	ra,104(sp)
    1336:	f0a2                	sd	s0,96(sp)
    1338:	eca6                	sd	s1,88(sp)
    133a:	fcae                	sd	a1,120(sp)
    133c:	e132                	sd	a2,128(sp)
    133e:	e536                	sd	a3,136(sp)
    1340:	e93a                	sd	a4,144(sp)
    1342:	f142                	sd	a6,160(sp)
    1344:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1346:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1348:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    134c:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1350:	00001b17          	auipc	s6,0x1
    1354:	c10b0b13          	addi	s6,s6,-1008 # 1f60 <__clone+0xce>
    buf[i++] = '0';
    1358:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    135c:	00001997          	auipc	s3,0x1
    1360:	cb498993          	addi	s3,s3,-844 # 2010 <digits>
        if (!*s)
    1364:	00054783          	lbu	a5,0(a0)
    1368:	16078a63          	beqz	a5,14dc <printf+0x1ba>
    136c:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    136e:	19278163          	beq	a5,s2,14f0 <printf+0x1ce>
    1372:	00164783          	lbu	a5,1(a2)
    1376:	0605                	addi	a2,a2,1
    1378:	fbfd                	bnez	a5,136e <printf+0x4c>
    137a:	84b2                	mv	s1,a2
        l = z - a;
    137c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1380:	85aa                	mv	a1,a0
    1382:	8622                	mv	a2,s0
    1384:	4505                	li	a0,1
    1386:	0d5000ef          	jal	ra,1c5a <write>
        if (l)
    138a:	18041c63          	bnez	s0,1522 <printf+0x200>
        if (s[1] == 0)
    138e:	0014c783          	lbu	a5,1(s1)
    1392:	14078563          	beqz	a5,14dc <printf+0x1ba>
        switch (s[1])
    1396:	1d478063          	beq	a5,s4,1556 <printf+0x234>
    139a:	18fa6663          	bltu	s4,a5,1526 <printf+0x204>
    139e:	06400713          	li	a4,100
    13a2:	1ae78063          	beq	a5,a4,1542 <printf+0x220>
    13a6:	07000713          	li	a4,112
    13aa:	1ce79963          	bne	a5,a4,157c <printf+0x25a>
            printptr(va_arg(ap, uint64));
    13ae:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13b0:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13b4:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13b6:	631c                	ld	a5,0(a4)
    13b8:	0721                	addi	a4,a4,8
    13ba:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13bc:	00479293          	slli	t0,a5,0x4
    13c0:	00879f93          	slli	t6,a5,0x8
    13c4:	00c79f13          	slli	t5,a5,0xc
    13c8:	01079e93          	slli	t4,a5,0x10
    13cc:	01479e13          	slli	t3,a5,0x14
    13d0:	01879313          	slli	t1,a5,0x18
    13d4:	01c79893          	slli	a7,a5,0x1c
    13d8:	02479813          	slli	a6,a5,0x24
    13dc:	02879513          	slli	a0,a5,0x28
    13e0:	02c79593          	slli	a1,a5,0x2c
    13e4:	03079693          	slli	a3,a5,0x30
    13e8:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13ec:	03c7d413          	srli	s0,a5,0x3c
    13f0:	01c7d39b          	srliw	t2,a5,0x1c
    13f4:	03c2d293          	srli	t0,t0,0x3c
    13f8:	03cfdf93          	srli	t6,t6,0x3c
    13fc:	03cf5f13          	srli	t5,t5,0x3c
    1400:	03cede93          	srli	t4,t4,0x3c
    1404:	03ce5e13          	srli	t3,t3,0x3c
    1408:	03c35313          	srli	t1,t1,0x3c
    140c:	03c8d893          	srli	a7,a7,0x3c
    1410:	03c85813          	srli	a6,a6,0x3c
    1414:	9171                	srli	a0,a0,0x3c
    1416:	91f1                	srli	a1,a1,0x3c
    1418:	92f1                	srli	a3,a3,0x3c
    141a:	9371                	srli	a4,a4,0x3c
    141c:	96ce                	add	a3,a3,s3
    141e:	974e                	add	a4,a4,s3
    1420:	944e                	add	s0,s0,s3
    1422:	92ce                	add	t0,t0,s3
    1424:	9fce                	add	t6,t6,s3
    1426:	9f4e                	add	t5,t5,s3
    1428:	9ece                	add	t4,t4,s3
    142a:	9e4e                	add	t3,t3,s3
    142c:	934e                	add	t1,t1,s3
    142e:	98ce                	add	a7,a7,s3
    1430:	93ce                	add	t2,t2,s3
    1432:	984e                	add	a6,a6,s3
    1434:	954e                	add	a0,a0,s3
    1436:	95ce                	add	a1,a1,s3
    1438:	0006c083          	lbu	ra,0(a3)
    143c:	0002c283          	lbu	t0,0(t0)
    1440:	00074683          	lbu	a3,0(a4)
    1444:	000fcf83          	lbu	t6,0(t6)
    1448:	000f4f03          	lbu	t5,0(t5)
    144c:	000ece83          	lbu	t4,0(t4)
    1450:	000e4e03          	lbu	t3,0(t3)
    1454:	00034303          	lbu	t1,0(t1)
    1458:	0008c883          	lbu	a7,0(a7)
    145c:	0003c383          	lbu	t2,0(t2)
    1460:	00084803          	lbu	a6,0(a6)
    1464:	00054503          	lbu	a0,0(a0)
    1468:	0005c583          	lbu	a1,0(a1)
    146c:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1470:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1474:	9371                	srli	a4,a4,0x3c
    1476:	8bbd                	andi	a5,a5,15
    1478:	974e                	add	a4,a4,s3
    147a:	97ce                	add	a5,a5,s3
    147c:	005105a3          	sb	t0,11(sp)
    1480:	01f10623          	sb	t6,12(sp)
    1484:	01e106a3          	sb	t5,13(sp)
    1488:	01d10723          	sb	t4,14(sp)
    148c:	01c107a3          	sb	t3,15(sp)
    1490:	00610823          	sb	t1,16(sp)
    1494:	011108a3          	sb	a7,17(sp)
    1498:	00710923          	sb	t2,18(sp)
    149c:	010109a3          	sb	a6,19(sp)
    14a0:	00a10a23          	sb	a0,20(sp)
    14a4:	00b10aa3          	sb	a1,21(sp)
    14a8:	00110b23          	sb	ra,22(sp)
    14ac:	00d10ba3          	sb	a3,23(sp)
    14b0:	00810523          	sb	s0,10(sp)
    14b4:	00074703          	lbu	a4,0(a4)
    14b8:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14bc:	002c                	addi	a1,sp,8
    14be:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14c0:	00e10c23          	sb	a4,24(sp)
    14c4:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14c8:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14cc:	78e000ef          	jal	ra,1c5a <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14d0:	00248513          	addi	a0,s1,2
        if (!*s)
    14d4:	00054783          	lbu	a5,0(a0)
    14d8:	e8079ae3          	bnez	a5,136c <printf+0x4a>
    }
    va_end(ap);
}
    14dc:	70a6                	ld	ra,104(sp)
    14de:	7406                	ld	s0,96(sp)
    14e0:	64e6                	ld	s1,88(sp)
    14e2:	6946                	ld	s2,80(sp)
    14e4:	69a6                	ld	s3,72(sp)
    14e6:	6a06                	ld	s4,64(sp)
    14e8:	7ae2                	ld	s5,56(sp)
    14ea:	7b42                	ld	s6,48(sp)
    14ec:	614d                	addi	sp,sp,176
    14ee:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14f0:	00064783          	lbu	a5,0(a2)
    14f4:	84b2                	mv	s1,a2
    14f6:	01278963          	beq	a5,s2,1508 <printf+0x1e6>
    14fa:	b549                	j	137c <printf+0x5a>
    14fc:	0024c783          	lbu	a5,2(s1)
    1500:	0605                	addi	a2,a2,1
    1502:	0489                	addi	s1,s1,2
    1504:	e7279ce3          	bne	a5,s2,137c <printf+0x5a>
    1508:	0014c783          	lbu	a5,1(s1)
    150c:	ff2788e3          	beq	a5,s2,14fc <printf+0x1da>
        l = z - a;
    1510:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1514:	85aa                	mv	a1,a0
    1516:	8622                	mv	a2,s0
    1518:	4505                	li	a0,1
    151a:	740000ef          	jal	ra,1c5a <write>
        if (l)
    151e:	e60408e3          	beqz	s0,138e <printf+0x6c>
    1522:	8526                	mv	a0,s1
    1524:	b581                	j	1364 <printf+0x42>
        switch (s[1])
    1526:	07800713          	li	a4,120
    152a:	04e79963          	bne	a5,a4,157c <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    152e:	6782                	ld	a5,0(sp)
    1530:	45c1                	li	a1,16
    1532:	4388                	lw	a0,0(a5)
    1534:	07a1                	addi	a5,a5,8
    1536:	e03e                	sd	a5,0(sp)
    1538:	be5ff0ef          	jal	ra,111c <printint.constprop.0>
        s += 2;
    153c:	00248513          	addi	a0,s1,2
    1540:	bf51                	j	14d4 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    1542:	6782                	ld	a5,0(sp)
    1544:	45a9                	li	a1,10
    1546:	4388                	lw	a0,0(a5)
    1548:	07a1                	addi	a5,a5,8
    154a:	e03e                	sd	a5,0(sp)
    154c:	bd1ff0ef          	jal	ra,111c <printint.constprop.0>
        s += 2;
    1550:	00248513          	addi	a0,s1,2
    1554:	b741                	j	14d4 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1556:	6782                	ld	a5,0(sp)
    1558:	6380                	ld	s0,0(a5)
    155a:	07a1                	addi	a5,a5,8
    155c:	e03e                	sd	a5,0(sp)
    155e:	c421                	beqz	s0,15a6 <printf+0x284>
            l = strnlen(a, 200);
    1560:	0c800593          	li	a1,200
    1564:	8522                	mv	a0,s0
    1566:	3fc000ef          	jal	ra,1962 <strnlen>
    write(f, s, l);
    156a:	0005061b          	sext.w	a2,a0
    156e:	85a2                	mv	a1,s0
    1570:	4505                	li	a0,1
    1572:	6e8000ef          	jal	ra,1c5a <write>
        s += 2;
    1576:	00248513          	addi	a0,s1,2
    157a:	bfa9                	j	14d4 <printf+0x1b2>
    char byte = c;
    157c:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1580:	4605                	li	a2,1
    1582:	002c                	addi	a1,sp,8
    1584:	4505                	li	a0,1
    char byte = c;
    1586:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    158a:	6d0000ef          	jal	ra,1c5a <write>
    char byte = c;
    158e:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1592:	4605                	li	a2,1
    1594:	002c                	addi	a1,sp,8
    1596:	4505                	li	a0,1
    char byte = c;
    1598:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    159c:	6be000ef          	jal	ra,1c5a <write>
        s += 2;
    15a0:	00248513          	addi	a0,s1,2
    15a4:	bf05                	j	14d4 <printf+0x1b2>
                a = "(null)";
    15a6:	845a                	mv	s0,s6
    15a8:	bf65                	j	1560 <printf+0x23e>

00000000000015aa <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15aa:	02000793          	li	a5,32
    15ae:	00f50663          	beq	a0,a5,15ba <isspace+0x10>
    15b2:	355d                	addiw	a0,a0,-9
    15b4:	00553513          	sltiu	a0,a0,5
    15b8:	8082                	ret
    15ba:	4505                	li	a0,1
}
    15bc:	8082                	ret

00000000000015be <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15be:	fd05051b          	addiw	a0,a0,-48
}
    15c2:	00a53513          	sltiu	a0,a0,10
    15c6:	8082                	ret

00000000000015c8 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c8:	02000613          	li	a2,32
    15cc:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15ce:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d2:	ff77069b          	addiw	a3,a4,-9
    15d6:	04c70d63          	beq	a4,a2,1630 <atoi+0x68>
    15da:	0007079b          	sext.w	a5,a4
    15de:	04d5f963          	bgeu	a1,a3,1630 <atoi+0x68>
        s++;
    switch (*s)
    15e2:	02b00693          	li	a3,43
    15e6:	04d70a63          	beq	a4,a3,163a <atoi+0x72>
    15ea:	02d00693          	li	a3,45
    15ee:	06d70463          	beq	a4,a3,1656 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15f2:	fd07859b          	addiw	a1,a5,-48
    15f6:	4625                	li	a2,9
    15f8:	873e                	mv	a4,a5
    15fa:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15fc:	4e01                	li	t3,0
    while (isdigit(*s))
    15fe:	04b66a63          	bltu	a2,a1,1652 <atoi+0x8a>
    int n = 0, neg = 0;
    1602:	4501                	li	a0,0
    while (isdigit(*s))
    1604:	4825                	li	a6,9
    1606:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    160a:	0025179b          	slliw	a5,a0,0x2
    160e:	9d3d                	addw	a0,a0,a5
    1610:	fd07031b          	addiw	t1,a4,-48
    1614:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1618:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    161c:	0685                	addi	a3,a3,1
    161e:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1622:	0006071b          	sext.w	a4,a2
    1626:	feb870e3          	bgeu	a6,a1,1606 <atoi+0x3e>
    return neg ? n : -n;
    162a:	000e0563          	beqz	t3,1634 <atoi+0x6c>
}
    162e:	8082                	ret
        s++;
    1630:	0505                	addi	a0,a0,1
    1632:	bf71                	j	15ce <atoi+0x6>
    1634:	4113053b          	subw	a0,t1,a7
    1638:	8082                	ret
    while (isdigit(*s))
    163a:	00154783          	lbu	a5,1(a0)
    163e:	4625                	li	a2,9
        s++;
    1640:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1644:	fd07859b          	addiw	a1,a5,-48
    1648:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    164c:	4e01                	li	t3,0
    while (isdigit(*s))
    164e:	fab67ae3          	bgeu	a2,a1,1602 <atoi+0x3a>
    1652:	4501                	li	a0,0
}
    1654:	8082                	ret
    while (isdigit(*s))
    1656:	00154783          	lbu	a5,1(a0)
    165a:	4625                	li	a2,9
        s++;
    165c:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1660:	fd07859b          	addiw	a1,a5,-48
    1664:	0007871b          	sext.w	a4,a5
    1668:	feb665e3          	bltu	a2,a1,1652 <atoi+0x8a>
        neg = 1;
    166c:	4e05                	li	t3,1
    166e:	bf51                	j	1602 <atoi+0x3a>

0000000000001670 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1670:	16060d63          	beqz	a2,17ea <memset+0x17a>
    1674:	40a007b3          	neg	a5,a0
    1678:	8b9d                	andi	a5,a5,7
    167a:	00778713          	addi	a4,a5,7
    167e:	482d                	li	a6,11
    1680:	0ff5f593          	andi	a1,a1,255
    1684:	fff60693          	addi	a3,a2,-1
    1688:	17076263          	bltu	a4,a6,17ec <memset+0x17c>
    168c:	16e6ea63          	bltu	a3,a4,1800 <memset+0x190>
    1690:	16078563          	beqz	a5,17fa <memset+0x18a>
    1694:	00b50023          	sb	a1,0(a0)
    1698:	4705                	li	a4,1
    169a:	00150e93          	addi	t4,a0,1
    169e:	14e78c63          	beq	a5,a4,17f6 <memset+0x186>
    16a2:	00b500a3          	sb	a1,1(a0)
    16a6:	4709                	li	a4,2
    16a8:	00250e93          	addi	t4,a0,2
    16ac:	14e78d63          	beq	a5,a4,1806 <memset+0x196>
    16b0:	00b50123          	sb	a1,2(a0)
    16b4:	470d                	li	a4,3
    16b6:	00350e93          	addi	t4,a0,3
    16ba:	12e78b63          	beq	a5,a4,17f0 <memset+0x180>
    16be:	00b501a3          	sb	a1,3(a0)
    16c2:	4711                	li	a4,4
    16c4:	00450e93          	addi	t4,a0,4
    16c8:	14e78163          	beq	a5,a4,180a <memset+0x19a>
    16cc:	00b50223          	sb	a1,4(a0)
    16d0:	4715                	li	a4,5
    16d2:	00550e93          	addi	t4,a0,5
    16d6:	12e78c63          	beq	a5,a4,180e <memset+0x19e>
    16da:	00b502a3          	sb	a1,5(a0)
    16de:	471d                	li	a4,7
    16e0:	00650e93          	addi	t4,a0,6
    16e4:	12e79763          	bne	a5,a4,1812 <memset+0x1a2>
    16e8:	00750e93          	addi	t4,a0,7
    16ec:	00b50323          	sb	a1,6(a0)
    16f0:	4f1d                	li	t5,7
    16f2:	00859713          	slli	a4,a1,0x8
    16f6:	8f4d                	or	a4,a4,a1
    16f8:	01059e13          	slli	t3,a1,0x10
    16fc:	01c76e33          	or	t3,a4,t3
    1700:	01859313          	slli	t1,a1,0x18
    1704:	006e6333          	or	t1,t3,t1
    1708:	02059893          	slli	a7,a1,0x20
    170c:	011368b3          	or	a7,t1,a7
    1710:	02859813          	slli	a6,a1,0x28
    1714:	40f60333          	sub	t1,a2,a5
    1718:	0108e833          	or	a6,a7,a6
    171c:	03059693          	slli	a3,a1,0x30
    1720:	00d866b3          	or	a3,a6,a3
    1724:	03859713          	slli	a4,a1,0x38
    1728:	97aa                	add	a5,a5,a0
    172a:	ff837813          	andi	a6,t1,-8
    172e:	8f55                	or	a4,a4,a3
    1730:	00f806b3          	add	a3,a6,a5
    1734:	e398                	sd	a4,0(a5)
    1736:	07a1                	addi	a5,a5,8
    1738:	fed79ee3          	bne	a5,a3,1734 <memset+0xc4>
    173c:	ff837693          	andi	a3,t1,-8
    1740:	00de87b3          	add	a5,t4,a3
    1744:	01e6873b          	addw	a4,a3,t5
    1748:	0ad30663          	beq	t1,a3,17f4 <memset+0x184>
    174c:	00b78023          	sb	a1,0(a5)
    1750:	0017069b          	addiw	a3,a4,1
    1754:	08c6fb63          	bgeu	a3,a2,17ea <memset+0x17a>
    1758:	00b780a3          	sb	a1,1(a5)
    175c:	0027069b          	addiw	a3,a4,2
    1760:	08c6f563          	bgeu	a3,a2,17ea <memset+0x17a>
    1764:	00b78123          	sb	a1,2(a5)
    1768:	0037069b          	addiw	a3,a4,3
    176c:	06c6ff63          	bgeu	a3,a2,17ea <memset+0x17a>
    1770:	00b781a3          	sb	a1,3(a5)
    1774:	0047069b          	addiw	a3,a4,4
    1778:	06c6f963          	bgeu	a3,a2,17ea <memset+0x17a>
    177c:	00b78223          	sb	a1,4(a5)
    1780:	0057069b          	addiw	a3,a4,5
    1784:	06c6f363          	bgeu	a3,a2,17ea <memset+0x17a>
    1788:	00b782a3          	sb	a1,5(a5)
    178c:	0067069b          	addiw	a3,a4,6
    1790:	04c6fd63          	bgeu	a3,a2,17ea <memset+0x17a>
    1794:	00b78323          	sb	a1,6(a5)
    1798:	0077069b          	addiw	a3,a4,7
    179c:	04c6f763          	bgeu	a3,a2,17ea <memset+0x17a>
    17a0:	00b783a3          	sb	a1,7(a5)
    17a4:	0087069b          	addiw	a3,a4,8
    17a8:	04c6f163          	bgeu	a3,a2,17ea <memset+0x17a>
    17ac:	00b78423          	sb	a1,8(a5)
    17b0:	0097069b          	addiw	a3,a4,9
    17b4:	02c6fb63          	bgeu	a3,a2,17ea <memset+0x17a>
    17b8:	00b784a3          	sb	a1,9(a5)
    17bc:	00a7069b          	addiw	a3,a4,10
    17c0:	02c6f563          	bgeu	a3,a2,17ea <memset+0x17a>
    17c4:	00b78523          	sb	a1,10(a5)
    17c8:	00b7069b          	addiw	a3,a4,11
    17cc:	00c6ff63          	bgeu	a3,a2,17ea <memset+0x17a>
    17d0:	00b785a3          	sb	a1,11(a5)
    17d4:	00c7069b          	addiw	a3,a4,12
    17d8:	00c6f963          	bgeu	a3,a2,17ea <memset+0x17a>
    17dc:	00b78623          	sb	a1,12(a5)
    17e0:	2735                	addiw	a4,a4,13
    17e2:	00c77463          	bgeu	a4,a2,17ea <memset+0x17a>
    17e6:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17ea:	8082                	ret
    17ec:	472d                	li	a4,11
    17ee:	bd79                	j	168c <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17f0:	4f0d                	li	t5,3
    17f2:	b701                	j	16f2 <memset+0x82>
    17f4:	8082                	ret
    17f6:	4f05                	li	t5,1
    17f8:	bded                	j	16f2 <memset+0x82>
    17fa:	8eaa                	mv	t4,a0
    17fc:	4f01                	li	t5,0
    17fe:	bdd5                	j	16f2 <memset+0x82>
    1800:	87aa                	mv	a5,a0
    1802:	4701                	li	a4,0
    1804:	b7a1                	j	174c <memset+0xdc>
    1806:	4f09                	li	t5,2
    1808:	b5ed                	j	16f2 <memset+0x82>
    180a:	4f11                	li	t5,4
    180c:	b5dd                	j	16f2 <memset+0x82>
    180e:	4f15                	li	t5,5
    1810:	b5cd                	j	16f2 <memset+0x82>
    1812:	4f19                	li	t5,6
    1814:	bdf9                	j	16f2 <memset+0x82>

0000000000001816 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1816:	00054783          	lbu	a5,0(a0)
    181a:	0005c703          	lbu	a4,0(a1)
    181e:	00e79863          	bne	a5,a4,182e <strcmp+0x18>
    1822:	0505                	addi	a0,a0,1
    1824:	0585                	addi	a1,a1,1
    1826:	fbe5                	bnez	a5,1816 <strcmp>
    1828:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    182a:	9d19                	subw	a0,a0,a4
    182c:	8082                	ret
    182e:	0007851b          	sext.w	a0,a5
    1832:	bfe5                	j	182a <strcmp+0x14>

0000000000001834 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1834:	ce05                	beqz	a2,186c <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1836:	00054703          	lbu	a4,0(a0)
    183a:	0005c783          	lbu	a5,0(a1)
    183e:	cb0d                	beqz	a4,1870 <strncmp+0x3c>
    if (!n--)
    1840:	167d                	addi	a2,a2,-1
    1842:	00c506b3          	add	a3,a0,a2
    1846:	a819                	j	185c <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1848:	00a68e63          	beq	a3,a0,1864 <strncmp+0x30>
    184c:	0505                	addi	a0,a0,1
    184e:	00e79b63          	bne	a5,a4,1864 <strncmp+0x30>
    1852:	00054703          	lbu	a4,0(a0)
    1856:	0005c783          	lbu	a5,0(a1)
    185a:	cb19                	beqz	a4,1870 <strncmp+0x3c>
    185c:	0005c783          	lbu	a5,0(a1)
    1860:	0585                	addi	a1,a1,1
    1862:	f3fd                	bnez	a5,1848 <strncmp+0x14>
        ;
    return *l - *r;
    1864:	0007051b          	sext.w	a0,a4
    1868:	9d1d                	subw	a0,a0,a5
    186a:	8082                	ret
        return 0;
    186c:	4501                	li	a0,0
}
    186e:	8082                	ret
    1870:	4501                	li	a0,0
    return *l - *r;
    1872:	9d1d                	subw	a0,a0,a5
    1874:	8082                	ret

0000000000001876 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1876:	00757793          	andi	a5,a0,7
    187a:	cf89                	beqz	a5,1894 <strlen+0x1e>
    187c:	87aa                	mv	a5,a0
    187e:	a029                	j	1888 <strlen+0x12>
    1880:	0785                	addi	a5,a5,1
    1882:	0077f713          	andi	a4,a5,7
    1886:	cb01                	beqz	a4,1896 <strlen+0x20>
        if (!*s)
    1888:	0007c703          	lbu	a4,0(a5)
    188c:	fb75                	bnez	a4,1880 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    188e:	40a78533          	sub	a0,a5,a0
}
    1892:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1894:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1896:	6394                	ld	a3,0(a5)
    1898:	00000597          	auipc	a1,0x0
    189c:	6d05b583          	ld	a1,1744(a1) # 1f68 <__clone+0xd6>
    18a0:	00000617          	auipc	a2,0x0
    18a4:	6d063603          	ld	a2,1744(a2) # 1f70 <__clone+0xde>
    18a8:	a019                	j	18ae <strlen+0x38>
    18aa:	6794                	ld	a3,8(a5)
    18ac:	07a1                	addi	a5,a5,8
    18ae:	00b68733          	add	a4,a3,a1
    18b2:	fff6c693          	not	a3,a3
    18b6:	8f75                	and	a4,a4,a3
    18b8:	8f71                	and	a4,a4,a2
    18ba:	db65                	beqz	a4,18aa <strlen+0x34>
    for (; *s; s++)
    18bc:	0007c703          	lbu	a4,0(a5)
    18c0:	d779                	beqz	a4,188e <strlen+0x18>
    18c2:	0017c703          	lbu	a4,1(a5)
    18c6:	0785                	addi	a5,a5,1
    18c8:	d379                	beqz	a4,188e <strlen+0x18>
    18ca:	0017c703          	lbu	a4,1(a5)
    18ce:	0785                	addi	a5,a5,1
    18d0:	fb6d                	bnez	a4,18c2 <strlen+0x4c>
    18d2:	bf75                	j	188e <strlen+0x18>

00000000000018d4 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18d4:	00757713          	andi	a4,a0,7
{
    18d8:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18da:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18de:	cb19                	beqz	a4,18f4 <memchr+0x20>
    18e0:	ce25                	beqz	a2,1958 <memchr+0x84>
    18e2:	0007c703          	lbu	a4,0(a5)
    18e6:	04b70e63          	beq	a4,a1,1942 <memchr+0x6e>
    18ea:	0785                	addi	a5,a5,1
    18ec:	0077f713          	andi	a4,a5,7
    18f0:	167d                	addi	a2,a2,-1
    18f2:	f77d                	bnez	a4,18e0 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18f4:	4501                	li	a0,0
    if (n && *s != c)
    18f6:	c235                	beqz	a2,195a <memchr+0x86>
    18f8:	0007c703          	lbu	a4,0(a5)
    18fc:	04b70363          	beq	a4,a1,1942 <memchr+0x6e>
        size_t k = ONES * c;
    1900:	00000517          	auipc	a0,0x0
    1904:	67853503          	ld	a0,1656(a0) # 1f78 <__clone+0xe6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1908:	471d                	li	a4,7
        size_t k = ONES * c;
    190a:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    190e:	02c77a63          	bgeu	a4,a2,1942 <memchr+0x6e>
    1912:	00000897          	auipc	a7,0x0
    1916:	6568b883          	ld	a7,1622(a7) # 1f68 <__clone+0xd6>
    191a:	00000817          	auipc	a6,0x0
    191e:	65683803          	ld	a6,1622(a6) # 1f70 <__clone+0xde>
    1922:	431d                	li	t1,7
    1924:	a029                	j	192e <memchr+0x5a>
    1926:	1661                	addi	a2,a2,-8
    1928:	07a1                	addi	a5,a5,8
    192a:	02c37963          	bgeu	t1,a2,195c <memchr+0x88>
    192e:	6398                	ld	a4,0(a5)
    1930:	8f29                	xor	a4,a4,a0
    1932:	011706b3          	add	a3,a4,a7
    1936:	fff74713          	not	a4,a4
    193a:	8f75                	and	a4,a4,a3
    193c:	01077733          	and	a4,a4,a6
    1940:	d37d                	beqz	a4,1926 <memchr+0x52>
    1942:	853e                	mv	a0,a5
    1944:	97b2                	add	a5,a5,a2
    1946:	a021                	j	194e <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1948:	0505                	addi	a0,a0,1
    194a:	00f50763          	beq	a0,a5,1958 <memchr+0x84>
    194e:	00054703          	lbu	a4,0(a0)
    1952:	feb71be3          	bne	a4,a1,1948 <memchr+0x74>
    1956:	8082                	ret
    return n ? (void *)s : 0;
    1958:	4501                	li	a0,0
}
    195a:	8082                	ret
    return n ? (void *)s : 0;
    195c:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    195e:	f275                	bnez	a2,1942 <memchr+0x6e>
}
    1960:	8082                	ret

0000000000001962 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1962:	1101                	addi	sp,sp,-32
    1964:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1966:	862e                	mv	a2,a1
{
    1968:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    196a:	4581                	li	a1,0
{
    196c:	e426                	sd	s1,8(sp)
    196e:	ec06                	sd	ra,24(sp)
    1970:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1972:	f63ff0ef          	jal	ra,18d4 <memchr>
    return p ? p - s : n;
    1976:	c519                	beqz	a0,1984 <strnlen+0x22>
}
    1978:	60e2                	ld	ra,24(sp)
    197a:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    197c:	8d05                	sub	a0,a0,s1
}
    197e:	64a2                	ld	s1,8(sp)
    1980:	6105                	addi	sp,sp,32
    1982:	8082                	ret
    1984:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1986:	8522                	mv	a0,s0
}
    1988:	6442                	ld	s0,16(sp)
    198a:	64a2                	ld	s1,8(sp)
    198c:	6105                	addi	sp,sp,32
    198e:	8082                	ret

0000000000001990 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1990:	00b547b3          	xor	a5,a0,a1
    1994:	8b9d                	andi	a5,a5,7
    1996:	eb95                	bnez	a5,19ca <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1998:	0075f793          	andi	a5,a1,7
    199c:	e7b1                	bnez	a5,19e8 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    199e:	6198                	ld	a4,0(a1)
    19a0:	00000617          	auipc	a2,0x0
    19a4:	5c863603          	ld	a2,1480(a2) # 1f68 <__clone+0xd6>
    19a8:	00000817          	auipc	a6,0x0
    19ac:	5c883803          	ld	a6,1480(a6) # 1f70 <__clone+0xde>
    19b0:	a029                	j	19ba <strcpy+0x2a>
    19b2:	e118                	sd	a4,0(a0)
    19b4:	6598                	ld	a4,8(a1)
    19b6:	05a1                	addi	a1,a1,8
    19b8:	0521                	addi	a0,a0,8
    19ba:	00c707b3          	add	a5,a4,a2
    19be:	fff74693          	not	a3,a4
    19c2:	8ff5                	and	a5,a5,a3
    19c4:	0107f7b3          	and	a5,a5,a6
    19c8:	d7ed                	beqz	a5,19b2 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19ca:	0005c783          	lbu	a5,0(a1)
    19ce:	00f50023          	sb	a5,0(a0)
    19d2:	c785                	beqz	a5,19fa <strcpy+0x6a>
    19d4:	0015c783          	lbu	a5,1(a1)
    19d8:	0505                	addi	a0,a0,1
    19da:	0585                	addi	a1,a1,1
    19dc:	00f50023          	sb	a5,0(a0)
    19e0:	fbf5                	bnez	a5,19d4 <strcpy+0x44>
        ;
    return d;
}
    19e2:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19e4:	0505                	addi	a0,a0,1
    19e6:	df45                	beqz	a4,199e <strcpy+0xe>
            if (!(*d = *s))
    19e8:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19ec:	0585                	addi	a1,a1,1
    19ee:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    19f2:	00f50023          	sb	a5,0(a0)
    19f6:	f7fd                	bnez	a5,19e4 <strcpy+0x54>
}
    19f8:	8082                	ret
    19fa:	8082                	ret

00000000000019fc <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19fc:	00b547b3          	xor	a5,a0,a1
    1a00:	8b9d                	andi	a5,a5,7
    1a02:	1a079863          	bnez	a5,1bb2 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a06:	0075f793          	andi	a5,a1,7
    1a0a:	16078463          	beqz	a5,1b72 <strncpy+0x176>
    1a0e:	ea01                	bnez	a2,1a1e <strncpy+0x22>
    1a10:	a421                	j	1c18 <strncpy+0x21c>
    1a12:	167d                	addi	a2,a2,-1
    1a14:	0505                	addi	a0,a0,1
    1a16:	14070e63          	beqz	a4,1b72 <strncpy+0x176>
    1a1a:	1a060863          	beqz	a2,1bca <strncpy+0x1ce>
    1a1e:	0005c783          	lbu	a5,0(a1)
    1a22:	0585                	addi	a1,a1,1
    1a24:	0075f713          	andi	a4,a1,7
    1a28:	00f50023          	sb	a5,0(a0)
    1a2c:	f3fd                	bnez	a5,1a12 <strncpy+0x16>
    1a2e:	4805                	li	a6,1
    1a30:	1a061863          	bnez	a2,1be0 <strncpy+0x1e4>
    1a34:	40a007b3          	neg	a5,a0
    1a38:	8b9d                	andi	a5,a5,7
    1a3a:	4681                	li	a3,0
    1a3c:	18061a63          	bnez	a2,1bd0 <strncpy+0x1d4>
    1a40:	00778713          	addi	a4,a5,7
    1a44:	45ad                	li	a1,11
    1a46:	18b76363          	bltu	a4,a1,1bcc <strncpy+0x1d0>
    1a4a:	1ae6eb63          	bltu	a3,a4,1c00 <strncpy+0x204>
    1a4e:	1a078363          	beqz	a5,1bf4 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a52:	00050023          	sb	zero,0(a0)
    1a56:	4685                	li	a3,1
    1a58:	00150713          	addi	a4,a0,1
    1a5c:	18d78f63          	beq	a5,a3,1bfa <strncpy+0x1fe>
    1a60:	000500a3          	sb	zero,1(a0)
    1a64:	4689                	li	a3,2
    1a66:	00250713          	addi	a4,a0,2
    1a6a:	18d78e63          	beq	a5,a3,1c06 <strncpy+0x20a>
    1a6e:	00050123          	sb	zero,2(a0)
    1a72:	468d                	li	a3,3
    1a74:	00350713          	addi	a4,a0,3
    1a78:	16d78c63          	beq	a5,a3,1bf0 <strncpy+0x1f4>
    1a7c:	000501a3          	sb	zero,3(a0)
    1a80:	4691                	li	a3,4
    1a82:	00450713          	addi	a4,a0,4
    1a86:	18d78263          	beq	a5,a3,1c0a <strncpy+0x20e>
    1a8a:	00050223          	sb	zero,4(a0)
    1a8e:	4695                	li	a3,5
    1a90:	00550713          	addi	a4,a0,5
    1a94:	16d78d63          	beq	a5,a3,1c0e <strncpy+0x212>
    1a98:	000502a3          	sb	zero,5(a0)
    1a9c:	469d                	li	a3,7
    1a9e:	00650713          	addi	a4,a0,6
    1aa2:	16d79863          	bne	a5,a3,1c12 <strncpy+0x216>
    1aa6:	00750713          	addi	a4,a0,7
    1aaa:	00050323          	sb	zero,6(a0)
    1aae:	40f80833          	sub	a6,a6,a5
    1ab2:	ff887593          	andi	a1,a6,-8
    1ab6:	97aa                	add	a5,a5,a0
    1ab8:	95be                	add	a1,a1,a5
    1aba:	0007b023          	sd	zero,0(a5)
    1abe:	07a1                	addi	a5,a5,8
    1ac0:	feb79de3          	bne	a5,a1,1aba <strncpy+0xbe>
    1ac4:	ff887593          	andi	a1,a6,-8
    1ac8:	9ead                	addw	a3,a3,a1
    1aca:	00b707b3          	add	a5,a4,a1
    1ace:	12b80863          	beq	a6,a1,1bfe <strncpy+0x202>
    1ad2:	00078023          	sb	zero,0(a5)
    1ad6:	0016871b          	addiw	a4,a3,1
    1ada:	0ec77863          	bgeu	a4,a2,1bca <strncpy+0x1ce>
    1ade:	000780a3          	sb	zero,1(a5)
    1ae2:	0026871b          	addiw	a4,a3,2
    1ae6:	0ec77263          	bgeu	a4,a2,1bca <strncpy+0x1ce>
    1aea:	00078123          	sb	zero,2(a5)
    1aee:	0036871b          	addiw	a4,a3,3
    1af2:	0cc77c63          	bgeu	a4,a2,1bca <strncpy+0x1ce>
    1af6:	000781a3          	sb	zero,3(a5)
    1afa:	0046871b          	addiw	a4,a3,4
    1afe:	0cc77663          	bgeu	a4,a2,1bca <strncpy+0x1ce>
    1b02:	00078223          	sb	zero,4(a5)
    1b06:	0056871b          	addiw	a4,a3,5
    1b0a:	0cc77063          	bgeu	a4,a2,1bca <strncpy+0x1ce>
    1b0e:	000782a3          	sb	zero,5(a5)
    1b12:	0066871b          	addiw	a4,a3,6
    1b16:	0ac77a63          	bgeu	a4,a2,1bca <strncpy+0x1ce>
    1b1a:	00078323          	sb	zero,6(a5)
    1b1e:	0076871b          	addiw	a4,a3,7
    1b22:	0ac77463          	bgeu	a4,a2,1bca <strncpy+0x1ce>
    1b26:	000783a3          	sb	zero,7(a5)
    1b2a:	0086871b          	addiw	a4,a3,8
    1b2e:	08c77e63          	bgeu	a4,a2,1bca <strncpy+0x1ce>
    1b32:	00078423          	sb	zero,8(a5)
    1b36:	0096871b          	addiw	a4,a3,9
    1b3a:	08c77863          	bgeu	a4,a2,1bca <strncpy+0x1ce>
    1b3e:	000784a3          	sb	zero,9(a5)
    1b42:	00a6871b          	addiw	a4,a3,10
    1b46:	08c77263          	bgeu	a4,a2,1bca <strncpy+0x1ce>
    1b4a:	00078523          	sb	zero,10(a5)
    1b4e:	00b6871b          	addiw	a4,a3,11
    1b52:	06c77c63          	bgeu	a4,a2,1bca <strncpy+0x1ce>
    1b56:	000785a3          	sb	zero,11(a5)
    1b5a:	00c6871b          	addiw	a4,a3,12
    1b5e:	06c77663          	bgeu	a4,a2,1bca <strncpy+0x1ce>
    1b62:	00078623          	sb	zero,12(a5)
    1b66:	26b5                	addiw	a3,a3,13
    1b68:	06c6f163          	bgeu	a3,a2,1bca <strncpy+0x1ce>
    1b6c:	000786a3          	sb	zero,13(a5)
    1b70:	8082                	ret
            ;
        if (!n || !*s)
    1b72:	c645                	beqz	a2,1c1a <strncpy+0x21e>
    1b74:	0005c783          	lbu	a5,0(a1)
    1b78:	ea078be3          	beqz	a5,1a2e <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b7c:	479d                	li	a5,7
    1b7e:	02c7ff63          	bgeu	a5,a2,1bbc <strncpy+0x1c0>
    1b82:	00000897          	auipc	a7,0x0
    1b86:	3e68b883          	ld	a7,998(a7) # 1f68 <__clone+0xd6>
    1b8a:	00000817          	auipc	a6,0x0
    1b8e:	3e683803          	ld	a6,998(a6) # 1f70 <__clone+0xde>
    1b92:	431d                	li	t1,7
    1b94:	6198                	ld	a4,0(a1)
    1b96:	011707b3          	add	a5,a4,a7
    1b9a:	fff74693          	not	a3,a4
    1b9e:	8ff5                	and	a5,a5,a3
    1ba0:	0107f7b3          	and	a5,a5,a6
    1ba4:	ef81                	bnez	a5,1bbc <strncpy+0x1c0>
            *wd = *ws;
    1ba6:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ba8:	1661                	addi	a2,a2,-8
    1baa:	05a1                	addi	a1,a1,8
    1bac:	0521                	addi	a0,a0,8
    1bae:	fec363e3          	bltu	t1,a2,1b94 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bb2:	e609                	bnez	a2,1bbc <strncpy+0x1c0>
    1bb4:	a08d                	j	1c16 <strncpy+0x21a>
    1bb6:	167d                	addi	a2,a2,-1
    1bb8:	0505                	addi	a0,a0,1
    1bba:	ca01                	beqz	a2,1bca <strncpy+0x1ce>
    1bbc:	0005c783          	lbu	a5,0(a1)
    1bc0:	0585                	addi	a1,a1,1
    1bc2:	00f50023          	sb	a5,0(a0)
    1bc6:	fbe5                	bnez	a5,1bb6 <strncpy+0x1ba>
        ;
tail:
    1bc8:	b59d                	j	1a2e <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1bca:	8082                	ret
    1bcc:	472d                	li	a4,11
    1bce:	bdb5                	j	1a4a <strncpy+0x4e>
    1bd0:	00778713          	addi	a4,a5,7
    1bd4:	45ad                	li	a1,11
    1bd6:	fff60693          	addi	a3,a2,-1
    1bda:	e6b778e3          	bgeu	a4,a1,1a4a <strncpy+0x4e>
    1bde:	b7fd                	j	1bcc <strncpy+0x1d0>
    1be0:	40a007b3          	neg	a5,a0
    1be4:	8832                	mv	a6,a2
    1be6:	8b9d                	andi	a5,a5,7
    1be8:	4681                	li	a3,0
    1bea:	e4060be3          	beqz	a2,1a40 <strncpy+0x44>
    1bee:	b7cd                	j	1bd0 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bf0:	468d                	li	a3,3
    1bf2:	bd75                	j	1aae <strncpy+0xb2>
    1bf4:	872a                	mv	a4,a0
    1bf6:	4681                	li	a3,0
    1bf8:	bd5d                	j	1aae <strncpy+0xb2>
    1bfa:	4685                	li	a3,1
    1bfc:	bd4d                	j	1aae <strncpy+0xb2>
    1bfe:	8082                	ret
    1c00:	87aa                	mv	a5,a0
    1c02:	4681                	li	a3,0
    1c04:	b5f9                	j	1ad2 <strncpy+0xd6>
    1c06:	4689                	li	a3,2
    1c08:	b55d                	j	1aae <strncpy+0xb2>
    1c0a:	4691                	li	a3,4
    1c0c:	b54d                	j	1aae <strncpy+0xb2>
    1c0e:	4695                	li	a3,5
    1c10:	bd79                	j	1aae <strncpy+0xb2>
    1c12:	4699                	li	a3,6
    1c14:	bd69                	j	1aae <strncpy+0xb2>
    1c16:	8082                	ret
    1c18:	8082                	ret
    1c1a:	8082                	ret

0000000000001c1c <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c1c:	87aa                	mv	a5,a0
    1c1e:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c20:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c24:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c28:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c2a:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c2c:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c30:	2501                	sext.w	a0,a0
    1c32:	8082                	ret

0000000000001c34 <openat>:
    register long a7 __asm__("a7") = n;
    1c34:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c38:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c3c:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c40:	2501                	sext.w	a0,a0
    1c42:	8082                	ret

0000000000001c44 <close>:
    register long a7 __asm__("a7") = n;
    1c44:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c48:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c4c:	2501                	sext.w	a0,a0
    1c4e:	8082                	ret

0000000000001c50 <read>:
    register long a7 __asm__("a7") = n;
    1c50:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c54:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c58:	8082                	ret

0000000000001c5a <write>:
    register long a7 __asm__("a7") = n;
    1c5a:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c5e:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c62:	8082                	ret

0000000000001c64 <getpid>:
    register long a7 __asm__("a7") = n;
    1c64:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c68:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c6c:	2501                	sext.w	a0,a0
    1c6e:	8082                	ret

0000000000001c70 <getppid>:
    register long a7 __asm__("a7") = n;
    1c70:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c74:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c78:	2501                	sext.w	a0,a0
    1c7a:	8082                	ret

0000000000001c7c <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c7c:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c80:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c84:	2501                	sext.w	a0,a0
    1c86:	8082                	ret

0000000000001c88 <fork>:
    register long a7 __asm__("a7") = n;
    1c88:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c8c:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c8e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c90:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c94:	2501                	sext.w	a0,a0
    1c96:	8082                	ret

0000000000001c98 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c98:	85b2                	mv	a1,a2
    1c9a:	863a                	mv	a2,a4
    if (stack)
    1c9c:	c191                	beqz	a1,1ca0 <clone+0x8>
	stack += stack_size;
    1c9e:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1ca0:	4781                	li	a5,0
    1ca2:	4701                	li	a4,0
    1ca4:	4681                	li	a3,0
    1ca6:	2601                	sext.w	a2,a2
    1ca8:	a2ed                	j	1e92 <__clone>

0000000000001caa <exit>:
    register long a7 __asm__("a7") = n;
    1caa:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cae:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cb2:	8082                	ret

0000000000001cb4 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cb4:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cb8:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cba:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cbe:	2501                	sext.w	a0,a0
    1cc0:	8082                	ret

0000000000001cc2 <exec>:
    register long a7 __asm__("a7") = n;
    1cc2:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cc6:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cca:	2501                	sext.w	a0,a0
    1ccc:	8082                	ret

0000000000001cce <execve>:
    register long a7 __asm__("a7") = n;
    1cce:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cd2:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cd6:	2501                	sext.w	a0,a0
    1cd8:	8082                	ret

0000000000001cda <times>:
    register long a7 __asm__("a7") = n;
    1cda:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cde:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1ce2:	2501                	sext.w	a0,a0
    1ce4:	8082                	ret

0000000000001ce6 <get_time>:

int64 get_time()
{
    1ce6:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1ce8:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cec:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cee:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cf0:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cf4:	2501                	sext.w	a0,a0
    1cf6:	ed09                	bnez	a0,1d10 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cf8:	67a2                	ld	a5,8(sp)
    1cfa:	3e800713          	li	a4,1000
    1cfe:	00015503          	lhu	a0,0(sp)
    1d02:	02e7d7b3          	divu	a5,a5,a4
    1d06:	02e50533          	mul	a0,a0,a4
    1d0a:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d0c:	0141                	addi	sp,sp,16
    1d0e:	8082                	ret
        return -1;
    1d10:	557d                	li	a0,-1
    1d12:	bfed                	j	1d0c <get_time+0x26>

0000000000001d14 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d14:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d18:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d1c:	2501                	sext.w	a0,a0
    1d1e:	8082                	ret

0000000000001d20 <time>:
    register long a7 __asm__("a7") = n;
    1d20:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d24:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d28:	2501                	sext.w	a0,a0
    1d2a:	8082                	ret

0000000000001d2c <sleep>:

int sleep(unsigned long long time)
{
    1d2c:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d2e:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d30:	850a                	mv	a0,sp
    1d32:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d34:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d38:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d3a:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d3e:	e501                	bnez	a0,1d46 <sleep+0x1a>
    return 0;
    1d40:	4501                	li	a0,0
}
    1d42:	0141                	addi	sp,sp,16
    1d44:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d46:	4502                	lw	a0,0(sp)
}
    1d48:	0141                	addi	sp,sp,16
    1d4a:	8082                	ret

0000000000001d4c <set_priority>:
    register long a7 __asm__("a7") = n;
    1d4c:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d50:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d54:	2501                	sext.w	a0,a0
    1d56:	8082                	ret

0000000000001d58 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d58:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d5c:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d60:	8082                	ret

0000000000001d62 <munmap>:
    register long a7 __asm__("a7") = n;
    1d62:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d66:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d6a:	2501                	sext.w	a0,a0
    1d6c:	8082                	ret

0000000000001d6e <wait>:

int wait(int *code)
{
    1d6e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d70:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d74:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d76:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d78:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d7a:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d7e:	2501                	sext.w	a0,a0
    1d80:	8082                	ret

0000000000001d82 <spawn>:
    register long a7 __asm__("a7") = n;
    1d82:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d86:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d8a:	2501                	sext.w	a0,a0
    1d8c:	8082                	ret

0000000000001d8e <mailread>:
    register long a7 __asm__("a7") = n;
    1d8e:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d92:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d96:	2501                	sext.w	a0,a0
    1d98:	8082                	ret

0000000000001d9a <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d9a:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d9e:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1da2:	2501                	sext.w	a0,a0
    1da4:	8082                	ret

0000000000001da6 <fstat>:
    register long a7 __asm__("a7") = n;
    1da6:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1daa:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dae:	2501                	sext.w	a0,a0
    1db0:	8082                	ret

0000000000001db2 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1db2:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1db4:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1db8:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dba:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dc2:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dc4:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1dc8:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dca:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1dce:	2501                	sext.w	a0,a0
    1dd0:	8082                	ret

0000000000001dd2 <link>:

int link(char *old_path, char *new_path)
{
    1dd2:	87aa                	mv	a5,a0
    1dd4:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1dd6:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1dda:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dde:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1de0:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1de4:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1de6:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1dea:	2501                	sext.w	a0,a0
    1dec:	8082                	ret

0000000000001dee <unlink>:

int unlink(char *path)
{
    1dee:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1df0:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1df4:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1df8:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfa:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1dfe:	2501                	sext.w	a0,a0
    1e00:	8082                	ret

0000000000001e02 <uname>:
    register long a7 __asm__("a7") = n;
    1e02:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e06:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e0a:	2501                	sext.w	a0,a0
    1e0c:	8082                	ret

0000000000001e0e <brk>:
    register long a7 __asm__("a7") = n;
    1e0e:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e12:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e16:	2501                	sext.w	a0,a0
    1e18:	8082                	ret

0000000000001e1a <getcwd>:
    register long a7 __asm__("a7") = n;
    1e1a:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e1c:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e20:	8082                	ret

0000000000001e22 <chdir>:
    register long a7 __asm__("a7") = n;
    1e22:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e26:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	8082                	ret

0000000000001e2e <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e2e:	862e                	mv	a2,a1
    1e30:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e32:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e34:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e38:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e3c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e3e:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e40:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e44:	2501                	sext.w	a0,a0
    1e46:	8082                	ret

0000000000001e48 <getdents>:
    register long a7 __asm__("a7") = n;
    1e48:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e4c:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e50:	2501                	sext.w	a0,a0
    1e52:	8082                	ret

0000000000001e54 <pipe>:
    register long a7 __asm__("a7") = n;
    1e54:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e58:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5a:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <dup>:
    register long a7 __asm__("a7") = n;
    1e62:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e64:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e68:	2501                	sext.w	a0,a0
    1e6a:	8082                	ret

0000000000001e6c <dup2>:
    register long a7 __asm__("a7") = n;
    1e6c:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e6e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e70:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e74:	2501                	sext.w	a0,a0
    1e76:	8082                	ret

0000000000001e78 <mount>:
    register long a7 __asm__("a7") = n;
    1e78:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e7c:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e80:	2501                	sext.w	a0,a0
    1e82:	8082                	ret

0000000000001e84 <umount>:
    register long a7 __asm__("a7") = n;
    1e84:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e88:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e8a:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e8e:	2501                	sext.w	a0,a0
    1e90:	8082                	ret

0000000000001e92 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e92:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e94:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e96:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e98:	8532                	mv	a0,a2
	mv a2, a4
    1e9a:	863a                	mv	a2,a4
	mv a3, a5
    1e9c:	86be                	mv	a3,a5
	mv a4, a6
    1e9e:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ea0:	0dc00893          	li	a7,220
	ecall
    1ea4:	00000073          	ecall

	beqz a0, 1f
    1ea8:	c111                	beqz	a0,1eac <__clone+0x1a>
	# Parent
	ret
    1eaa:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1eac:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1eae:	6522                	ld	a0,8(sp)
	jalr a1
    1eb0:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1eb2:	05d00893          	li	a7,93
	ecall
    1eb6:	00000073          	ecall
