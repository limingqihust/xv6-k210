
/home/lmq/Desktop/xv6-k210/test/build/riscv64/openat:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0e9                	j	10cc <__start_main>

0000000000001004 <test_openat>:
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

void test_openat(void) {
    1004:	1141                	addi	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	e9250513          	addi	a0,a0,-366 # 1e98 <__clone+0x2a>
void test_openat(void) {
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1012:	2b8000ef          	jal	ra,12ca <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	f5250513          	addi	a0,a0,-174 # 1f68 <__func__.1166>
    101e:	2ac000ef          	jal	ra,12ca <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	e8e50513          	addi	a0,a0,-370 # 1eb0 <__clone+0x42>
    102a:	2a0000ef          	jal	ra,12ca <puts>
    //int fd_dir = open(".", O_RDONLY | O_CREATE);
    int fd_dir = open("./mnt", O_DIRECTORY);
    102e:	002005b7          	lui	a1,0x200
    1032:	00001517          	auipc	a0,0x1
    1036:	e8e50513          	addi	a0,a0,-370 # 1ec0 <__clone+0x52>
    103a:	3bf000ef          	jal	ra,1bf8 <open>
    103e:	842a                	mv	s0,a0
    printf("open dir fd: %d\n", fd_dir);
    1040:	85aa                	mv	a1,a0
    1042:	00001517          	auipc	a0,0x1
    1046:	e8650513          	addi	a0,a0,-378 # 1ec8 <__clone+0x5a>
    104a:	2a2000ef          	jal	ra,12ec <printf>
    int fd = openat(fd_dir, "test_openat.txt", O_CREATE | O_RDWR);
    104e:	00001597          	auipc	a1,0x1
    1052:	e9258593          	addi	a1,a1,-366 # 1ee0 <__clone+0x72>
    1056:	8522                	mv	a0,s0
    1058:	04200613          	li	a2,66
    105c:	3b5000ef          	jal	ra,1c10 <openat>
    1060:	842a                	mv	s0,a0
    printf("openat fd: %d\n", fd);
    1062:	85aa                	mv	a1,a0
    1064:	00001517          	auipc	a0,0x1
    1068:	e8c50513          	addi	a0,a0,-372 # 1ef0 <__clone+0x82>
    106c:	280000ef          	jal	ra,12ec <printf>
    assert(fd > 0);
    1070:	02805f63          	blez	s0,10ae <test_openat+0xaa>
    printf("openat success.\n");
    1074:	00001517          	auipc	a0,0x1
    1078:	eac50513          	addi	a0,a0,-340 # 1f20 <__clone+0xb2>
    107c:	270000ef          	jal	ra,12ec <printf>
    write(fd, buf, strlen(buf));
    int size = read(fd, buf, 256);
    if (size > 0) printf("  openat success.\n");
    else printf("  openat error.\n");
    */
    close(fd);	
    1080:	8522                	mv	a0,s0
    1082:	39f000ef          	jal	ra,1c20 <close>
	
    TEST_END(__func__);
    1086:	00001517          	auipc	a0,0x1
    108a:	eb250513          	addi	a0,a0,-334 # 1f38 <__clone+0xca>
    108e:	23c000ef          	jal	ra,12ca <puts>
    1092:	00001517          	auipc	a0,0x1
    1096:	ed650513          	addi	a0,a0,-298 # 1f68 <__func__.1166>
    109a:	230000ef          	jal	ra,12ca <puts>
}
    109e:	6402                	ld	s0,0(sp)
    10a0:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    10a2:	00001517          	auipc	a0,0x1
    10a6:	e0e50513          	addi	a0,a0,-498 # 1eb0 <__clone+0x42>
}
    10aa:	0141                	addi	sp,sp,16
    TEST_END(__func__);
    10ac:	ac39                	j	12ca <puts>
    assert(fd > 0);
    10ae:	00001517          	auipc	a0,0x1
    10b2:	e5250513          	addi	a0,a0,-430 # 1f00 <__clone+0x92>
    10b6:	4be000ef          	jal	ra,1574 <panic>
    10ba:	bf6d                	j	1074 <test_openat+0x70>

00000000000010bc <main>:

int main(void) {
    10bc:	1141                	addi	sp,sp,-16
    10be:	e406                	sd	ra,8(sp)
    test_openat();
    10c0:	f45ff0ef          	jal	ra,1004 <test_openat>
    return 0;
}
    10c4:	60a2                	ld	ra,8(sp)
    10c6:	4501                	li	a0,0
    10c8:	0141                	addi	sp,sp,16
    10ca:	8082                	ret

00000000000010cc <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10cc:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10ce:	4108                	lw	a0,0(a0)
{
    10d0:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10d2:	05a1                	addi	a1,a1,8
{
    10d4:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10d6:	fe7ff0ef          	jal	ra,10bc <main>
    10da:	3ad000ef          	jal	ra,1c86 <exit>
	return 0;
}
    10de:	60a2                	ld	ra,8(sp)
    10e0:	4501                	li	a0,0
    10e2:	0141                	addi	sp,sp,16
    10e4:	8082                	ret

00000000000010e6 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10e6:	7179                	addi	sp,sp,-48
    10e8:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10ea:	12054b63          	bltz	a0,1220 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10ee:	02b577bb          	remuw	a5,a0,a1
    10f2:	00001697          	auipc	a3,0x1
    10f6:	e8668693          	addi	a3,a3,-378 # 1f78 <digits>
    buf[16] = 0;
    10fa:	00010c23          	sb	zero,24(sp)
    i = 15;
    10fe:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    1102:	1782                	slli	a5,a5,0x20
    1104:	9381                	srli	a5,a5,0x20
    1106:	97b6                	add	a5,a5,a3
    1108:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    110c:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1110:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1114:	16b56263          	bltu	a0,a1,1278 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1118:	02e8763b          	remuw	a2,a6,a4
    111c:	1602                	slli	a2,a2,0x20
    111e:	9201                	srli	a2,a2,0x20
    1120:	9636                	add	a2,a2,a3
    1122:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1126:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    112a:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    112e:	12e86963          	bltu	a6,a4,1260 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    1132:	02e5f63b          	remuw	a2,a1,a4
    1136:	1602                	slli	a2,a2,0x20
    1138:	9201                	srli	a2,a2,0x20
    113a:	9636                	add	a2,a2,a3
    113c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1140:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1144:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1148:	10e5ef63          	bltu	a1,a4,1266 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    114c:	02e8763b          	remuw	a2,a6,a4
    1150:	1602                	slli	a2,a2,0x20
    1152:	9201                	srli	a2,a2,0x20
    1154:	9636                	add	a2,a2,a3
    1156:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    115e:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1162:	10e86563          	bltu	a6,a4,126c <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    1166:	02e5f63b          	remuw	a2,a1,a4
    116a:	1602                	slli	a2,a2,0x20
    116c:	9201                	srli	a2,a2,0x20
    116e:	9636                	add	a2,a2,a3
    1170:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1174:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1178:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    117c:	0ee5eb63          	bltu	a1,a4,1272 <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    1180:	02e8763b          	remuw	a2,a6,a4
    1184:	1602                	slli	a2,a2,0x20
    1186:	9201                	srli	a2,a2,0x20
    1188:	9636                	add	a2,a2,a3
    118a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    118e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1192:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1196:	0ce86263          	bltu	a6,a4,125a <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    119a:	02e5f63b          	remuw	a2,a1,a4
    119e:	1602                	slli	a2,a2,0x20
    11a0:	9201                	srli	a2,a2,0x20
    11a2:	9636                	add	a2,a2,a3
    11a4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a8:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11ac:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11b0:	0ce5e663          	bltu	a1,a4,127c <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    11b4:	02e8763b          	remuw	a2,a6,a4
    11b8:	1602                	slli	a2,a2,0x20
    11ba:	9201                	srli	a2,a2,0x20
    11bc:	9636                	add	a2,a2,a3
    11be:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c2:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11c6:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11ca:	0ae86c63          	bltu	a6,a4,1282 <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    11ce:	02e5f63b          	remuw	a2,a1,a4
    11d2:	1602                	slli	a2,a2,0x20
    11d4:	9201                	srli	a2,a2,0x20
    11d6:	9636                	add	a2,a2,a3
    11d8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11dc:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11e0:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11e4:	0ae5e263          	bltu	a1,a4,1288 <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    11e8:	1782                	slli	a5,a5,0x20
    11ea:	9381                	srli	a5,a5,0x20
    11ec:	97b6                	add	a5,a5,a3
    11ee:	0007c703          	lbu	a4,0(a5)
    11f2:	4599                	li	a1,6
    11f4:	4795                	li	a5,5
    11f6:	00e10723          	sb	a4,14(sp)

    if (sign)
    11fa:	00055963          	bgez	a0,120c <printint.constprop.0+0x126>
        buf[i--] = '-';
    11fe:	1018                	addi	a4,sp,32
    1200:	973e                	add	a4,a4,a5
    1202:	02d00693          	li	a3,45
    1206:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    120a:	85be                	mv	a1,a5
    write(f, s, l);
    120c:	003c                	addi	a5,sp,8
    120e:	4641                	li	a2,16
    1210:	9e0d                	subw	a2,a2,a1
    1212:	4505                	li	a0,1
    1214:	95be                	add	a1,a1,a5
    1216:	221000ef          	jal	ra,1c36 <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    121a:	70a2                	ld	ra,40(sp)
    121c:	6145                	addi	sp,sp,48
    121e:	8082                	ret
        x = -xx;
    1220:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1224:	02b677bb          	remuw	a5,a2,a1
    1228:	00001697          	auipc	a3,0x1
    122c:	d5068693          	addi	a3,a3,-688 # 1f78 <digits>
    buf[16] = 0;
    1230:	00010c23          	sb	zero,24(sp)
    i = 15;
    1234:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    1238:	1782                	slli	a5,a5,0x20
    123a:	9381                	srli	a5,a5,0x20
    123c:	97b6                	add	a5,a5,a3
    123e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1242:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1246:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    124a:	ecb677e3          	bgeu	a2,a1,1118 <printint.constprop.0+0x32>
        buf[i--] = '-';
    124e:	02d00793          	li	a5,45
    1252:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1256:	45b9                	li	a1,14
    1258:	bf55                	j	120c <printint.constprop.0+0x126>
    125a:	47a5                	li	a5,9
    125c:	45a9                	li	a1,10
    125e:	bf71                	j	11fa <printint.constprop.0+0x114>
    1260:	47b5                	li	a5,13
    1262:	45b9                	li	a1,14
    1264:	bf59                	j	11fa <printint.constprop.0+0x114>
    1266:	47b1                	li	a5,12
    1268:	45b5                	li	a1,13
    126a:	bf41                	j	11fa <printint.constprop.0+0x114>
    126c:	47ad                	li	a5,11
    126e:	45b1                	li	a1,12
    1270:	b769                	j	11fa <printint.constprop.0+0x114>
    1272:	47a9                	li	a5,10
    1274:	45ad                	li	a1,11
    1276:	b751                	j	11fa <printint.constprop.0+0x114>
    i = 15;
    1278:	45bd                	li	a1,15
    127a:	bf49                	j	120c <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    127c:	47a1                	li	a5,8
    127e:	45a5                	li	a1,9
    1280:	bfad                	j	11fa <printint.constprop.0+0x114>
    1282:	479d                	li	a5,7
    1284:	45a1                	li	a1,8
    1286:	bf95                	j	11fa <printint.constprop.0+0x114>
    1288:	4799                	li	a5,6
    128a:	459d                	li	a1,7
    128c:	b7bd                	j	11fa <printint.constprop.0+0x114>

000000000000128e <getchar>:
{
    128e:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1290:	00f10593          	addi	a1,sp,15
    1294:	4605                	li	a2,1
    1296:	4501                	li	a0,0
{
    1298:	ec06                	sd	ra,24(sp)
    char byte = 0;
    129a:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    129e:	18f000ef          	jal	ra,1c2c <read>
}
    12a2:	60e2                	ld	ra,24(sp)
    12a4:	00f14503          	lbu	a0,15(sp)
    12a8:	6105                	addi	sp,sp,32
    12aa:	8082                	ret

00000000000012ac <putchar>:
{
    12ac:	1101                	addi	sp,sp,-32
    12ae:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12b0:	00f10593          	addi	a1,sp,15
    12b4:	4605                	li	a2,1
    12b6:	4505                	li	a0,1
{
    12b8:	ec06                	sd	ra,24(sp)
    char byte = c;
    12ba:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12be:	179000ef          	jal	ra,1c36 <write>
}
    12c2:	60e2                	ld	ra,24(sp)
    12c4:	2501                	sext.w	a0,a0
    12c6:	6105                	addi	sp,sp,32
    12c8:	8082                	ret

00000000000012ca <puts>:
{
    12ca:	1141                	addi	sp,sp,-16
    12cc:	e406                	sd	ra,8(sp)
    12ce:	e022                	sd	s0,0(sp)
    12d0:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12d2:	580000ef          	jal	ra,1852 <strlen>
    12d6:	862a                	mv	a2,a0
    12d8:	85a2                	mv	a1,s0
    12da:	4505                	li	a0,1
    12dc:	15b000ef          	jal	ra,1c36 <write>
}
    12e0:	60a2                	ld	ra,8(sp)
    12e2:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12e4:	957d                	srai	a0,a0,0x3f
    return r;
    12e6:	2501                	sext.w	a0,a0
}
    12e8:	0141                	addi	sp,sp,16
    12ea:	8082                	ret

00000000000012ec <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12ec:	7171                	addi	sp,sp,-176
    12ee:	fc56                	sd	s5,56(sp)
    12f0:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    12f2:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12f4:	18bc                	addi	a5,sp,120
{
    12f6:	e8ca                	sd	s2,80(sp)
    12f8:	e4ce                	sd	s3,72(sp)
    12fa:	e0d2                	sd	s4,64(sp)
    12fc:	f85a                	sd	s6,48(sp)
    12fe:	f486                	sd	ra,104(sp)
    1300:	f0a2                	sd	s0,96(sp)
    1302:	eca6                	sd	s1,88(sp)
    1304:	fcae                	sd	a1,120(sp)
    1306:	e132                	sd	a2,128(sp)
    1308:	e536                	sd	a3,136(sp)
    130a:	e93a                	sd	a4,144(sp)
    130c:	f142                	sd	a6,160(sp)
    130e:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1310:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1312:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1316:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    131a:	00001b17          	auipc	s6,0x1
    131e:	c2eb0b13          	addi	s6,s6,-978 # 1f48 <__clone+0xda>
    buf[i++] = '0';
    1322:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1326:	00001997          	auipc	s3,0x1
    132a:	c5298993          	addi	s3,s3,-942 # 1f78 <digits>
        if (!*s)
    132e:	00054783          	lbu	a5,0(a0)
    1332:	16078a63          	beqz	a5,14a6 <printf+0x1ba>
    1336:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1338:	19278163          	beq	a5,s2,14ba <printf+0x1ce>
    133c:	00164783          	lbu	a5,1(a2)
    1340:	0605                	addi	a2,a2,1
    1342:	fbfd                	bnez	a5,1338 <printf+0x4c>
    1344:	84b2                	mv	s1,a2
        l = z - a;
    1346:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    134a:	85aa                	mv	a1,a0
    134c:	8622                	mv	a2,s0
    134e:	4505                	li	a0,1
    1350:	0e7000ef          	jal	ra,1c36 <write>
        if (l)
    1354:	18041c63          	bnez	s0,14ec <printf+0x200>
        if (s[1] == 0)
    1358:	0014c783          	lbu	a5,1(s1)
    135c:	14078563          	beqz	a5,14a6 <printf+0x1ba>
        switch (s[1])
    1360:	1d478063          	beq	a5,s4,1520 <printf+0x234>
    1364:	18fa6663          	bltu	s4,a5,14f0 <printf+0x204>
    1368:	06400713          	li	a4,100
    136c:	1ae78063          	beq	a5,a4,150c <printf+0x220>
    1370:	07000713          	li	a4,112
    1374:	1ce79963          	bne	a5,a4,1546 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    1378:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    137a:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    137e:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1380:	631c                	ld	a5,0(a4)
    1382:	0721                	addi	a4,a4,8
    1384:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1386:	00479293          	slli	t0,a5,0x4
    138a:	00879f93          	slli	t6,a5,0x8
    138e:	00c79f13          	slli	t5,a5,0xc
    1392:	01079e93          	slli	t4,a5,0x10
    1396:	01479e13          	slli	t3,a5,0x14
    139a:	01879313          	slli	t1,a5,0x18
    139e:	01c79893          	slli	a7,a5,0x1c
    13a2:	02479813          	slli	a6,a5,0x24
    13a6:	02879513          	slli	a0,a5,0x28
    13aa:	02c79593          	slli	a1,a5,0x2c
    13ae:	03079693          	slli	a3,a5,0x30
    13b2:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13b6:	03c7d413          	srli	s0,a5,0x3c
    13ba:	01c7d39b          	srliw	t2,a5,0x1c
    13be:	03c2d293          	srli	t0,t0,0x3c
    13c2:	03cfdf93          	srli	t6,t6,0x3c
    13c6:	03cf5f13          	srli	t5,t5,0x3c
    13ca:	03cede93          	srli	t4,t4,0x3c
    13ce:	03ce5e13          	srli	t3,t3,0x3c
    13d2:	03c35313          	srli	t1,t1,0x3c
    13d6:	03c8d893          	srli	a7,a7,0x3c
    13da:	03c85813          	srli	a6,a6,0x3c
    13de:	9171                	srli	a0,a0,0x3c
    13e0:	91f1                	srli	a1,a1,0x3c
    13e2:	92f1                	srli	a3,a3,0x3c
    13e4:	9371                	srli	a4,a4,0x3c
    13e6:	96ce                	add	a3,a3,s3
    13e8:	974e                	add	a4,a4,s3
    13ea:	944e                	add	s0,s0,s3
    13ec:	92ce                	add	t0,t0,s3
    13ee:	9fce                	add	t6,t6,s3
    13f0:	9f4e                	add	t5,t5,s3
    13f2:	9ece                	add	t4,t4,s3
    13f4:	9e4e                	add	t3,t3,s3
    13f6:	934e                	add	t1,t1,s3
    13f8:	98ce                	add	a7,a7,s3
    13fa:	93ce                	add	t2,t2,s3
    13fc:	984e                	add	a6,a6,s3
    13fe:	954e                	add	a0,a0,s3
    1400:	95ce                	add	a1,a1,s3
    1402:	0006c083          	lbu	ra,0(a3)
    1406:	0002c283          	lbu	t0,0(t0)
    140a:	00074683          	lbu	a3,0(a4)
    140e:	000fcf83          	lbu	t6,0(t6)
    1412:	000f4f03          	lbu	t5,0(t5)
    1416:	000ece83          	lbu	t4,0(t4)
    141a:	000e4e03          	lbu	t3,0(t3)
    141e:	00034303          	lbu	t1,0(t1)
    1422:	0008c883          	lbu	a7,0(a7)
    1426:	0003c383          	lbu	t2,0(t2)
    142a:	00084803          	lbu	a6,0(a6)
    142e:	00054503          	lbu	a0,0(a0)
    1432:	0005c583          	lbu	a1,0(a1)
    1436:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    143a:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    143e:	9371                	srli	a4,a4,0x3c
    1440:	8bbd                	andi	a5,a5,15
    1442:	974e                	add	a4,a4,s3
    1444:	97ce                	add	a5,a5,s3
    1446:	005105a3          	sb	t0,11(sp)
    144a:	01f10623          	sb	t6,12(sp)
    144e:	01e106a3          	sb	t5,13(sp)
    1452:	01d10723          	sb	t4,14(sp)
    1456:	01c107a3          	sb	t3,15(sp)
    145a:	00610823          	sb	t1,16(sp)
    145e:	011108a3          	sb	a7,17(sp)
    1462:	00710923          	sb	t2,18(sp)
    1466:	010109a3          	sb	a6,19(sp)
    146a:	00a10a23          	sb	a0,20(sp)
    146e:	00b10aa3          	sb	a1,21(sp)
    1472:	00110b23          	sb	ra,22(sp)
    1476:	00d10ba3          	sb	a3,23(sp)
    147a:	00810523          	sb	s0,10(sp)
    147e:	00074703          	lbu	a4,0(a4)
    1482:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1486:	002c                	addi	a1,sp,8
    1488:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    148a:	00e10c23          	sb	a4,24(sp)
    148e:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1492:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1496:	7a0000ef          	jal	ra,1c36 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    149a:	00248513          	addi	a0,s1,2
        if (!*s)
    149e:	00054783          	lbu	a5,0(a0)
    14a2:	e8079ae3          	bnez	a5,1336 <printf+0x4a>
    }
    va_end(ap);
}
    14a6:	70a6                	ld	ra,104(sp)
    14a8:	7406                	ld	s0,96(sp)
    14aa:	64e6                	ld	s1,88(sp)
    14ac:	6946                	ld	s2,80(sp)
    14ae:	69a6                	ld	s3,72(sp)
    14b0:	6a06                	ld	s4,64(sp)
    14b2:	7ae2                	ld	s5,56(sp)
    14b4:	7b42                	ld	s6,48(sp)
    14b6:	614d                	addi	sp,sp,176
    14b8:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14ba:	00064783          	lbu	a5,0(a2)
    14be:	84b2                	mv	s1,a2
    14c0:	01278963          	beq	a5,s2,14d2 <printf+0x1e6>
    14c4:	b549                	j	1346 <printf+0x5a>
    14c6:	0024c783          	lbu	a5,2(s1)
    14ca:	0605                	addi	a2,a2,1
    14cc:	0489                	addi	s1,s1,2
    14ce:	e7279ce3          	bne	a5,s2,1346 <printf+0x5a>
    14d2:	0014c783          	lbu	a5,1(s1)
    14d6:	ff2788e3          	beq	a5,s2,14c6 <printf+0x1da>
        l = z - a;
    14da:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14de:	85aa                	mv	a1,a0
    14e0:	8622                	mv	a2,s0
    14e2:	4505                	li	a0,1
    14e4:	752000ef          	jal	ra,1c36 <write>
        if (l)
    14e8:	e60408e3          	beqz	s0,1358 <printf+0x6c>
    14ec:	8526                	mv	a0,s1
    14ee:	b581                	j	132e <printf+0x42>
        switch (s[1])
    14f0:	07800713          	li	a4,120
    14f4:	04e79963          	bne	a5,a4,1546 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    14f8:	6782                	ld	a5,0(sp)
    14fa:	45c1                	li	a1,16
    14fc:	4388                	lw	a0,0(a5)
    14fe:	07a1                	addi	a5,a5,8
    1500:	e03e                	sd	a5,0(sp)
    1502:	be5ff0ef          	jal	ra,10e6 <printint.constprop.0>
        s += 2;
    1506:	00248513          	addi	a0,s1,2
    150a:	bf51                	j	149e <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    150c:	6782                	ld	a5,0(sp)
    150e:	45a9                	li	a1,10
    1510:	4388                	lw	a0,0(a5)
    1512:	07a1                	addi	a5,a5,8
    1514:	e03e                	sd	a5,0(sp)
    1516:	bd1ff0ef          	jal	ra,10e6 <printint.constprop.0>
        s += 2;
    151a:	00248513          	addi	a0,s1,2
    151e:	b741                	j	149e <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1520:	6782                	ld	a5,0(sp)
    1522:	6380                	ld	s0,0(a5)
    1524:	07a1                	addi	a5,a5,8
    1526:	e03e                	sd	a5,0(sp)
    1528:	c421                	beqz	s0,1570 <printf+0x284>
            l = strnlen(a, 200);
    152a:	0c800593          	li	a1,200
    152e:	8522                	mv	a0,s0
    1530:	40e000ef          	jal	ra,193e <strnlen>
    write(f, s, l);
    1534:	0005061b          	sext.w	a2,a0
    1538:	85a2                	mv	a1,s0
    153a:	4505                	li	a0,1
    153c:	6fa000ef          	jal	ra,1c36 <write>
        s += 2;
    1540:	00248513          	addi	a0,s1,2
    1544:	bfa9                	j	149e <printf+0x1b2>
    char byte = c;
    1546:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    154a:	4605                	li	a2,1
    154c:	002c                	addi	a1,sp,8
    154e:	4505                	li	a0,1
    char byte = c;
    1550:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1554:	6e2000ef          	jal	ra,1c36 <write>
    char byte = c;
    1558:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    155c:	4605                	li	a2,1
    155e:	002c                	addi	a1,sp,8
    1560:	4505                	li	a0,1
    char byte = c;
    1562:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1566:	6d0000ef          	jal	ra,1c36 <write>
        s += 2;
    156a:	00248513          	addi	a0,s1,2
    156e:	bf05                	j	149e <printf+0x1b2>
                a = "(null)";
    1570:	845a                	mv	s0,s6
    1572:	bf65                	j	152a <printf+0x23e>

0000000000001574 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1574:	1141                	addi	sp,sp,-16
    1576:	e406                	sd	ra,8(sp)
    puts(m);
    1578:	d53ff0ef          	jal	ra,12ca <puts>
    exit(-100);
}
    157c:	60a2                	ld	ra,8(sp)
    exit(-100);
    157e:	f9c00513          	li	a0,-100
}
    1582:	0141                	addi	sp,sp,16
    exit(-100);
    1584:	a709                	j	1c86 <exit>

0000000000001586 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1586:	02000793          	li	a5,32
    158a:	00f50663          	beq	a0,a5,1596 <isspace+0x10>
    158e:	355d                	addiw	a0,a0,-9
    1590:	00553513          	sltiu	a0,a0,5
    1594:	8082                	ret
    1596:	4505                	li	a0,1
}
    1598:	8082                	ret

000000000000159a <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    159a:	fd05051b          	addiw	a0,a0,-48
}
    159e:	00a53513          	sltiu	a0,a0,10
    15a2:	8082                	ret

00000000000015a4 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a4:	02000613          	li	a2,32
    15a8:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15aa:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ae:	ff77069b          	addiw	a3,a4,-9
    15b2:	04c70d63          	beq	a4,a2,160c <atoi+0x68>
    15b6:	0007079b          	sext.w	a5,a4
    15ba:	04d5f963          	bgeu	a1,a3,160c <atoi+0x68>
        s++;
    switch (*s)
    15be:	02b00693          	li	a3,43
    15c2:	04d70a63          	beq	a4,a3,1616 <atoi+0x72>
    15c6:	02d00693          	li	a3,45
    15ca:	06d70463          	beq	a4,a3,1632 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15ce:	fd07859b          	addiw	a1,a5,-48
    15d2:	4625                	li	a2,9
    15d4:	873e                	mv	a4,a5
    15d6:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15d8:	4e01                	li	t3,0
    while (isdigit(*s))
    15da:	04b66a63          	bltu	a2,a1,162e <atoi+0x8a>
    int n = 0, neg = 0;
    15de:	4501                	li	a0,0
    while (isdigit(*s))
    15e0:	4825                	li	a6,9
    15e2:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    15e6:	0025179b          	slliw	a5,a0,0x2
    15ea:	9d3d                	addw	a0,a0,a5
    15ec:	fd07031b          	addiw	t1,a4,-48
    15f0:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15f4:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15f8:	0685                	addi	a3,a3,1
    15fa:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15fe:	0006071b          	sext.w	a4,a2
    1602:	feb870e3          	bgeu	a6,a1,15e2 <atoi+0x3e>
    return neg ? n : -n;
    1606:	000e0563          	beqz	t3,1610 <atoi+0x6c>
}
    160a:	8082                	ret
        s++;
    160c:	0505                	addi	a0,a0,1
    160e:	bf71                	j	15aa <atoi+0x6>
    1610:	4113053b          	subw	a0,t1,a7
    1614:	8082                	ret
    while (isdigit(*s))
    1616:	00154783          	lbu	a5,1(a0)
    161a:	4625                	li	a2,9
        s++;
    161c:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1620:	fd07859b          	addiw	a1,a5,-48
    1624:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1628:	4e01                	li	t3,0
    while (isdigit(*s))
    162a:	fab67ae3          	bgeu	a2,a1,15de <atoi+0x3a>
    162e:	4501                	li	a0,0
}
    1630:	8082                	ret
    while (isdigit(*s))
    1632:	00154783          	lbu	a5,1(a0)
    1636:	4625                	li	a2,9
        s++;
    1638:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    163c:	fd07859b          	addiw	a1,a5,-48
    1640:	0007871b          	sext.w	a4,a5
    1644:	feb665e3          	bltu	a2,a1,162e <atoi+0x8a>
        neg = 1;
    1648:	4e05                	li	t3,1
    164a:	bf51                	j	15de <atoi+0x3a>

000000000000164c <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    164c:	16060d63          	beqz	a2,17c6 <memset+0x17a>
    1650:	40a007b3          	neg	a5,a0
    1654:	8b9d                	andi	a5,a5,7
    1656:	00778713          	addi	a4,a5,7
    165a:	482d                	li	a6,11
    165c:	0ff5f593          	andi	a1,a1,255
    1660:	fff60693          	addi	a3,a2,-1
    1664:	17076263          	bltu	a4,a6,17c8 <memset+0x17c>
    1668:	16e6ea63          	bltu	a3,a4,17dc <memset+0x190>
    166c:	16078563          	beqz	a5,17d6 <memset+0x18a>
    1670:	00b50023          	sb	a1,0(a0)
    1674:	4705                	li	a4,1
    1676:	00150e93          	addi	t4,a0,1
    167a:	14e78c63          	beq	a5,a4,17d2 <memset+0x186>
    167e:	00b500a3          	sb	a1,1(a0)
    1682:	4709                	li	a4,2
    1684:	00250e93          	addi	t4,a0,2
    1688:	14e78d63          	beq	a5,a4,17e2 <memset+0x196>
    168c:	00b50123          	sb	a1,2(a0)
    1690:	470d                	li	a4,3
    1692:	00350e93          	addi	t4,a0,3
    1696:	12e78b63          	beq	a5,a4,17cc <memset+0x180>
    169a:	00b501a3          	sb	a1,3(a0)
    169e:	4711                	li	a4,4
    16a0:	00450e93          	addi	t4,a0,4
    16a4:	14e78163          	beq	a5,a4,17e6 <memset+0x19a>
    16a8:	00b50223          	sb	a1,4(a0)
    16ac:	4715                	li	a4,5
    16ae:	00550e93          	addi	t4,a0,5
    16b2:	12e78c63          	beq	a5,a4,17ea <memset+0x19e>
    16b6:	00b502a3          	sb	a1,5(a0)
    16ba:	471d                	li	a4,7
    16bc:	00650e93          	addi	t4,a0,6
    16c0:	12e79763          	bne	a5,a4,17ee <memset+0x1a2>
    16c4:	00750e93          	addi	t4,a0,7
    16c8:	00b50323          	sb	a1,6(a0)
    16cc:	4f1d                	li	t5,7
    16ce:	00859713          	slli	a4,a1,0x8
    16d2:	8f4d                	or	a4,a4,a1
    16d4:	01059e13          	slli	t3,a1,0x10
    16d8:	01c76e33          	or	t3,a4,t3
    16dc:	01859313          	slli	t1,a1,0x18
    16e0:	006e6333          	or	t1,t3,t1
    16e4:	02059893          	slli	a7,a1,0x20
    16e8:	011368b3          	or	a7,t1,a7
    16ec:	02859813          	slli	a6,a1,0x28
    16f0:	40f60333          	sub	t1,a2,a5
    16f4:	0108e833          	or	a6,a7,a6
    16f8:	03059693          	slli	a3,a1,0x30
    16fc:	00d866b3          	or	a3,a6,a3
    1700:	03859713          	slli	a4,a1,0x38
    1704:	97aa                	add	a5,a5,a0
    1706:	ff837813          	andi	a6,t1,-8
    170a:	8f55                	or	a4,a4,a3
    170c:	00f806b3          	add	a3,a6,a5
    1710:	e398                	sd	a4,0(a5)
    1712:	07a1                	addi	a5,a5,8
    1714:	fed79ee3          	bne	a5,a3,1710 <memset+0xc4>
    1718:	ff837693          	andi	a3,t1,-8
    171c:	00de87b3          	add	a5,t4,a3
    1720:	01e6873b          	addw	a4,a3,t5
    1724:	0ad30663          	beq	t1,a3,17d0 <memset+0x184>
    1728:	00b78023          	sb	a1,0(a5)
    172c:	0017069b          	addiw	a3,a4,1
    1730:	08c6fb63          	bgeu	a3,a2,17c6 <memset+0x17a>
    1734:	00b780a3          	sb	a1,1(a5)
    1738:	0027069b          	addiw	a3,a4,2
    173c:	08c6f563          	bgeu	a3,a2,17c6 <memset+0x17a>
    1740:	00b78123          	sb	a1,2(a5)
    1744:	0037069b          	addiw	a3,a4,3
    1748:	06c6ff63          	bgeu	a3,a2,17c6 <memset+0x17a>
    174c:	00b781a3          	sb	a1,3(a5)
    1750:	0047069b          	addiw	a3,a4,4
    1754:	06c6f963          	bgeu	a3,a2,17c6 <memset+0x17a>
    1758:	00b78223          	sb	a1,4(a5)
    175c:	0057069b          	addiw	a3,a4,5
    1760:	06c6f363          	bgeu	a3,a2,17c6 <memset+0x17a>
    1764:	00b782a3          	sb	a1,5(a5)
    1768:	0067069b          	addiw	a3,a4,6
    176c:	04c6fd63          	bgeu	a3,a2,17c6 <memset+0x17a>
    1770:	00b78323          	sb	a1,6(a5)
    1774:	0077069b          	addiw	a3,a4,7
    1778:	04c6f763          	bgeu	a3,a2,17c6 <memset+0x17a>
    177c:	00b783a3          	sb	a1,7(a5)
    1780:	0087069b          	addiw	a3,a4,8
    1784:	04c6f163          	bgeu	a3,a2,17c6 <memset+0x17a>
    1788:	00b78423          	sb	a1,8(a5)
    178c:	0097069b          	addiw	a3,a4,9
    1790:	02c6fb63          	bgeu	a3,a2,17c6 <memset+0x17a>
    1794:	00b784a3          	sb	a1,9(a5)
    1798:	00a7069b          	addiw	a3,a4,10
    179c:	02c6f563          	bgeu	a3,a2,17c6 <memset+0x17a>
    17a0:	00b78523          	sb	a1,10(a5)
    17a4:	00b7069b          	addiw	a3,a4,11
    17a8:	00c6ff63          	bgeu	a3,a2,17c6 <memset+0x17a>
    17ac:	00b785a3          	sb	a1,11(a5)
    17b0:	00c7069b          	addiw	a3,a4,12
    17b4:	00c6f963          	bgeu	a3,a2,17c6 <memset+0x17a>
    17b8:	00b78623          	sb	a1,12(a5)
    17bc:	2735                	addiw	a4,a4,13
    17be:	00c77463          	bgeu	a4,a2,17c6 <memset+0x17a>
    17c2:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17c6:	8082                	ret
    17c8:	472d                	li	a4,11
    17ca:	bd79                	j	1668 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17cc:	4f0d                	li	t5,3
    17ce:	b701                	j	16ce <memset+0x82>
    17d0:	8082                	ret
    17d2:	4f05                	li	t5,1
    17d4:	bded                	j	16ce <memset+0x82>
    17d6:	8eaa                	mv	t4,a0
    17d8:	4f01                	li	t5,0
    17da:	bdd5                	j	16ce <memset+0x82>
    17dc:	87aa                	mv	a5,a0
    17de:	4701                	li	a4,0
    17e0:	b7a1                	j	1728 <memset+0xdc>
    17e2:	4f09                	li	t5,2
    17e4:	b5ed                	j	16ce <memset+0x82>
    17e6:	4f11                	li	t5,4
    17e8:	b5dd                	j	16ce <memset+0x82>
    17ea:	4f15                	li	t5,5
    17ec:	b5cd                	j	16ce <memset+0x82>
    17ee:	4f19                	li	t5,6
    17f0:	bdf9                	j	16ce <memset+0x82>

00000000000017f2 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17f2:	00054783          	lbu	a5,0(a0)
    17f6:	0005c703          	lbu	a4,0(a1)
    17fa:	00e79863          	bne	a5,a4,180a <strcmp+0x18>
    17fe:	0505                	addi	a0,a0,1
    1800:	0585                	addi	a1,a1,1
    1802:	fbe5                	bnez	a5,17f2 <strcmp>
    1804:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1806:	9d19                	subw	a0,a0,a4
    1808:	8082                	ret
    180a:	0007851b          	sext.w	a0,a5
    180e:	bfe5                	j	1806 <strcmp+0x14>

0000000000001810 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1810:	ce05                	beqz	a2,1848 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1812:	00054703          	lbu	a4,0(a0)
    1816:	0005c783          	lbu	a5,0(a1)
    181a:	cb0d                	beqz	a4,184c <strncmp+0x3c>
    if (!n--)
    181c:	167d                	addi	a2,a2,-1
    181e:	00c506b3          	add	a3,a0,a2
    1822:	a819                	j	1838 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1824:	00a68e63          	beq	a3,a0,1840 <strncmp+0x30>
    1828:	0505                	addi	a0,a0,1
    182a:	00e79b63          	bne	a5,a4,1840 <strncmp+0x30>
    182e:	00054703          	lbu	a4,0(a0)
    1832:	0005c783          	lbu	a5,0(a1)
    1836:	cb19                	beqz	a4,184c <strncmp+0x3c>
    1838:	0005c783          	lbu	a5,0(a1)
    183c:	0585                	addi	a1,a1,1
    183e:	f3fd                	bnez	a5,1824 <strncmp+0x14>
        ;
    return *l - *r;
    1840:	0007051b          	sext.w	a0,a4
    1844:	9d1d                	subw	a0,a0,a5
    1846:	8082                	ret
        return 0;
    1848:	4501                	li	a0,0
}
    184a:	8082                	ret
    184c:	4501                	li	a0,0
    return *l - *r;
    184e:	9d1d                	subw	a0,a0,a5
    1850:	8082                	ret

0000000000001852 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1852:	00757793          	andi	a5,a0,7
    1856:	cf89                	beqz	a5,1870 <strlen+0x1e>
    1858:	87aa                	mv	a5,a0
    185a:	a029                	j	1864 <strlen+0x12>
    185c:	0785                	addi	a5,a5,1
    185e:	0077f713          	andi	a4,a5,7
    1862:	cb01                	beqz	a4,1872 <strlen+0x20>
        if (!*s)
    1864:	0007c703          	lbu	a4,0(a5)
    1868:	fb75                	bnez	a4,185c <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    186a:	40a78533          	sub	a0,a5,a0
}
    186e:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1870:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1872:	6394                	ld	a3,0(a5)
    1874:	00000597          	auipc	a1,0x0
    1878:	6dc5b583          	ld	a1,1756(a1) # 1f50 <__clone+0xe2>
    187c:	00000617          	auipc	a2,0x0
    1880:	6dc63603          	ld	a2,1756(a2) # 1f58 <__clone+0xea>
    1884:	a019                	j	188a <strlen+0x38>
    1886:	6794                	ld	a3,8(a5)
    1888:	07a1                	addi	a5,a5,8
    188a:	00b68733          	add	a4,a3,a1
    188e:	fff6c693          	not	a3,a3
    1892:	8f75                	and	a4,a4,a3
    1894:	8f71                	and	a4,a4,a2
    1896:	db65                	beqz	a4,1886 <strlen+0x34>
    for (; *s; s++)
    1898:	0007c703          	lbu	a4,0(a5)
    189c:	d779                	beqz	a4,186a <strlen+0x18>
    189e:	0017c703          	lbu	a4,1(a5)
    18a2:	0785                	addi	a5,a5,1
    18a4:	d379                	beqz	a4,186a <strlen+0x18>
    18a6:	0017c703          	lbu	a4,1(a5)
    18aa:	0785                	addi	a5,a5,1
    18ac:	fb6d                	bnez	a4,189e <strlen+0x4c>
    18ae:	bf75                	j	186a <strlen+0x18>

00000000000018b0 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18b0:	00757713          	andi	a4,a0,7
{
    18b4:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18b6:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ba:	cb19                	beqz	a4,18d0 <memchr+0x20>
    18bc:	ce25                	beqz	a2,1934 <memchr+0x84>
    18be:	0007c703          	lbu	a4,0(a5)
    18c2:	04b70e63          	beq	a4,a1,191e <memchr+0x6e>
    18c6:	0785                	addi	a5,a5,1
    18c8:	0077f713          	andi	a4,a5,7
    18cc:	167d                	addi	a2,a2,-1
    18ce:	f77d                	bnez	a4,18bc <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18d0:	4501                	li	a0,0
    if (n && *s != c)
    18d2:	c235                	beqz	a2,1936 <memchr+0x86>
    18d4:	0007c703          	lbu	a4,0(a5)
    18d8:	04b70363          	beq	a4,a1,191e <memchr+0x6e>
        size_t k = ONES * c;
    18dc:	00000517          	auipc	a0,0x0
    18e0:	68453503          	ld	a0,1668(a0) # 1f60 <__clone+0xf2>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18e4:	471d                	li	a4,7
        size_t k = ONES * c;
    18e6:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18ea:	02c77a63          	bgeu	a4,a2,191e <memchr+0x6e>
    18ee:	00000897          	auipc	a7,0x0
    18f2:	6628b883          	ld	a7,1634(a7) # 1f50 <__clone+0xe2>
    18f6:	00000817          	auipc	a6,0x0
    18fa:	66283803          	ld	a6,1634(a6) # 1f58 <__clone+0xea>
    18fe:	431d                	li	t1,7
    1900:	a029                	j	190a <memchr+0x5a>
    1902:	1661                	addi	a2,a2,-8
    1904:	07a1                	addi	a5,a5,8
    1906:	02c37963          	bgeu	t1,a2,1938 <memchr+0x88>
    190a:	6398                	ld	a4,0(a5)
    190c:	8f29                	xor	a4,a4,a0
    190e:	011706b3          	add	a3,a4,a7
    1912:	fff74713          	not	a4,a4
    1916:	8f75                	and	a4,a4,a3
    1918:	01077733          	and	a4,a4,a6
    191c:	d37d                	beqz	a4,1902 <memchr+0x52>
    191e:	853e                	mv	a0,a5
    1920:	97b2                	add	a5,a5,a2
    1922:	a021                	j	192a <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1924:	0505                	addi	a0,a0,1
    1926:	00f50763          	beq	a0,a5,1934 <memchr+0x84>
    192a:	00054703          	lbu	a4,0(a0)
    192e:	feb71be3          	bne	a4,a1,1924 <memchr+0x74>
    1932:	8082                	ret
    return n ? (void *)s : 0;
    1934:	4501                	li	a0,0
}
    1936:	8082                	ret
    return n ? (void *)s : 0;
    1938:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    193a:	f275                	bnez	a2,191e <memchr+0x6e>
}
    193c:	8082                	ret

000000000000193e <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    193e:	1101                	addi	sp,sp,-32
    1940:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1942:	862e                	mv	a2,a1
{
    1944:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1946:	4581                	li	a1,0
{
    1948:	e426                	sd	s1,8(sp)
    194a:	ec06                	sd	ra,24(sp)
    194c:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    194e:	f63ff0ef          	jal	ra,18b0 <memchr>
    return p ? p - s : n;
    1952:	c519                	beqz	a0,1960 <strnlen+0x22>
}
    1954:	60e2                	ld	ra,24(sp)
    1956:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1958:	8d05                	sub	a0,a0,s1
}
    195a:	64a2                	ld	s1,8(sp)
    195c:	6105                	addi	sp,sp,32
    195e:	8082                	ret
    1960:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1962:	8522                	mv	a0,s0
}
    1964:	6442                	ld	s0,16(sp)
    1966:	64a2                	ld	s1,8(sp)
    1968:	6105                	addi	sp,sp,32
    196a:	8082                	ret

000000000000196c <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    196c:	00b547b3          	xor	a5,a0,a1
    1970:	8b9d                	andi	a5,a5,7
    1972:	eb95                	bnez	a5,19a6 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1974:	0075f793          	andi	a5,a1,7
    1978:	e7b1                	bnez	a5,19c4 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    197a:	6198                	ld	a4,0(a1)
    197c:	00000617          	auipc	a2,0x0
    1980:	5d463603          	ld	a2,1492(a2) # 1f50 <__clone+0xe2>
    1984:	00000817          	auipc	a6,0x0
    1988:	5d483803          	ld	a6,1492(a6) # 1f58 <__clone+0xea>
    198c:	a029                	j	1996 <strcpy+0x2a>
    198e:	e118                	sd	a4,0(a0)
    1990:	6598                	ld	a4,8(a1)
    1992:	05a1                	addi	a1,a1,8
    1994:	0521                	addi	a0,a0,8
    1996:	00c707b3          	add	a5,a4,a2
    199a:	fff74693          	not	a3,a4
    199e:	8ff5                	and	a5,a5,a3
    19a0:	0107f7b3          	and	a5,a5,a6
    19a4:	d7ed                	beqz	a5,198e <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19a6:	0005c783          	lbu	a5,0(a1)
    19aa:	00f50023          	sb	a5,0(a0)
    19ae:	c785                	beqz	a5,19d6 <strcpy+0x6a>
    19b0:	0015c783          	lbu	a5,1(a1)
    19b4:	0505                	addi	a0,a0,1
    19b6:	0585                	addi	a1,a1,1
    19b8:	00f50023          	sb	a5,0(a0)
    19bc:	fbf5                	bnez	a5,19b0 <strcpy+0x44>
        ;
    return d;
}
    19be:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19c0:	0505                	addi	a0,a0,1
    19c2:	df45                	beqz	a4,197a <strcpy+0xe>
            if (!(*d = *s))
    19c4:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19c8:	0585                	addi	a1,a1,1
    19ca:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    19ce:	00f50023          	sb	a5,0(a0)
    19d2:	f7fd                	bnez	a5,19c0 <strcpy+0x54>
}
    19d4:	8082                	ret
    19d6:	8082                	ret

00000000000019d8 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19d8:	00b547b3          	xor	a5,a0,a1
    19dc:	8b9d                	andi	a5,a5,7
    19de:	1a079863          	bnez	a5,1b8e <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19e2:	0075f793          	andi	a5,a1,7
    19e6:	16078463          	beqz	a5,1b4e <strncpy+0x176>
    19ea:	ea01                	bnez	a2,19fa <strncpy+0x22>
    19ec:	a421                	j	1bf4 <strncpy+0x21c>
    19ee:	167d                	addi	a2,a2,-1
    19f0:	0505                	addi	a0,a0,1
    19f2:	14070e63          	beqz	a4,1b4e <strncpy+0x176>
    19f6:	1a060863          	beqz	a2,1ba6 <strncpy+0x1ce>
    19fa:	0005c783          	lbu	a5,0(a1)
    19fe:	0585                	addi	a1,a1,1
    1a00:	0075f713          	andi	a4,a1,7
    1a04:	00f50023          	sb	a5,0(a0)
    1a08:	f3fd                	bnez	a5,19ee <strncpy+0x16>
    1a0a:	4805                	li	a6,1
    1a0c:	1a061863          	bnez	a2,1bbc <strncpy+0x1e4>
    1a10:	40a007b3          	neg	a5,a0
    1a14:	8b9d                	andi	a5,a5,7
    1a16:	4681                	li	a3,0
    1a18:	18061a63          	bnez	a2,1bac <strncpy+0x1d4>
    1a1c:	00778713          	addi	a4,a5,7
    1a20:	45ad                	li	a1,11
    1a22:	18b76363          	bltu	a4,a1,1ba8 <strncpy+0x1d0>
    1a26:	1ae6eb63          	bltu	a3,a4,1bdc <strncpy+0x204>
    1a2a:	1a078363          	beqz	a5,1bd0 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a2e:	00050023          	sb	zero,0(a0)
    1a32:	4685                	li	a3,1
    1a34:	00150713          	addi	a4,a0,1
    1a38:	18d78f63          	beq	a5,a3,1bd6 <strncpy+0x1fe>
    1a3c:	000500a3          	sb	zero,1(a0)
    1a40:	4689                	li	a3,2
    1a42:	00250713          	addi	a4,a0,2
    1a46:	18d78e63          	beq	a5,a3,1be2 <strncpy+0x20a>
    1a4a:	00050123          	sb	zero,2(a0)
    1a4e:	468d                	li	a3,3
    1a50:	00350713          	addi	a4,a0,3
    1a54:	16d78c63          	beq	a5,a3,1bcc <strncpy+0x1f4>
    1a58:	000501a3          	sb	zero,3(a0)
    1a5c:	4691                	li	a3,4
    1a5e:	00450713          	addi	a4,a0,4
    1a62:	18d78263          	beq	a5,a3,1be6 <strncpy+0x20e>
    1a66:	00050223          	sb	zero,4(a0)
    1a6a:	4695                	li	a3,5
    1a6c:	00550713          	addi	a4,a0,5
    1a70:	16d78d63          	beq	a5,a3,1bea <strncpy+0x212>
    1a74:	000502a3          	sb	zero,5(a0)
    1a78:	469d                	li	a3,7
    1a7a:	00650713          	addi	a4,a0,6
    1a7e:	16d79863          	bne	a5,a3,1bee <strncpy+0x216>
    1a82:	00750713          	addi	a4,a0,7
    1a86:	00050323          	sb	zero,6(a0)
    1a8a:	40f80833          	sub	a6,a6,a5
    1a8e:	ff887593          	andi	a1,a6,-8
    1a92:	97aa                	add	a5,a5,a0
    1a94:	95be                	add	a1,a1,a5
    1a96:	0007b023          	sd	zero,0(a5)
    1a9a:	07a1                	addi	a5,a5,8
    1a9c:	feb79de3          	bne	a5,a1,1a96 <strncpy+0xbe>
    1aa0:	ff887593          	andi	a1,a6,-8
    1aa4:	9ead                	addw	a3,a3,a1
    1aa6:	00b707b3          	add	a5,a4,a1
    1aaa:	12b80863          	beq	a6,a1,1bda <strncpy+0x202>
    1aae:	00078023          	sb	zero,0(a5)
    1ab2:	0016871b          	addiw	a4,a3,1
    1ab6:	0ec77863          	bgeu	a4,a2,1ba6 <strncpy+0x1ce>
    1aba:	000780a3          	sb	zero,1(a5)
    1abe:	0026871b          	addiw	a4,a3,2
    1ac2:	0ec77263          	bgeu	a4,a2,1ba6 <strncpy+0x1ce>
    1ac6:	00078123          	sb	zero,2(a5)
    1aca:	0036871b          	addiw	a4,a3,3
    1ace:	0cc77c63          	bgeu	a4,a2,1ba6 <strncpy+0x1ce>
    1ad2:	000781a3          	sb	zero,3(a5)
    1ad6:	0046871b          	addiw	a4,a3,4
    1ada:	0cc77663          	bgeu	a4,a2,1ba6 <strncpy+0x1ce>
    1ade:	00078223          	sb	zero,4(a5)
    1ae2:	0056871b          	addiw	a4,a3,5
    1ae6:	0cc77063          	bgeu	a4,a2,1ba6 <strncpy+0x1ce>
    1aea:	000782a3          	sb	zero,5(a5)
    1aee:	0066871b          	addiw	a4,a3,6
    1af2:	0ac77a63          	bgeu	a4,a2,1ba6 <strncpy+0x1ce>
    1af6:	00078323          	sb	zero,6(a5)
    1afa:	0076871b          	addiw	a4,a3,7
    1afe:	0ac77463          	bgeu	a4,a2,1ba6 <strncpy+0x1ce>
    1b02:	000783a3          	sb	zero,7(a5)
    1b06:	0086871b          	addiw	a4,a3,8
    1b0a:	08c77e63          	bgeu	a4,a2,1ba6 <strncpy+0x1ce>
    1b0e:	00078423          	sb	zero,8(a5)
    1b12:	0096871b          	addiw	a4,a3,9
    1b16:	08c77863          	bgeu	a4,a2,1ba6 <strncpy+0x1ce>
    1b1a:	000784a3          	sb	zero,9(a5)
    1b1e:	00a6871b          	addiw	a4,a3,10
    1b22:	08c77263          	bgeu	a4,a2,1ba6 <strncpy+0x1ce>
    1b26:	00078523          	sb	zero,10(a5)
    1b2a:	00b6871b          	addiw	a4,a3,11
    1b2e:	06c77c63          	bgeu	a4,a2,1ba6 <strncpy+0x1ce>
    1b32:	000785a3          	sb	zero,11(a5)
    1b36:	00c6871b          	addiw	a4,a3,12
    1b3a:	06c77663          	bgeu	a4,a2,1ba6 <strncpy+0x1ce>
    1b3e:	00078623          	sb	zero,12(a5)
    1b42:	26b5                	addiw	a3,a3,13
    1b44:	06c6f163          	bgeu	a3,a2,1ba6 <strncpy+0x1ce>
    1b48:	000786a3          	sb	zero,13(a5)
    1b4c:	8082                	ret
            ;
        if (!n || !*s)
    1b4e:	c645                	beqz	a2,1bf6 <strncpy+0x21e>
    1b50:	0005c783          	lbu	a5,0(a1)
    1b54:	ea078be3          	beqz	a5,1a0a <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b58:	479d                	li	a5,7
    1b5a:	02c7ff63          	bgeu	a5,a2,1b98 <strncpy+0x1c0>
    1b5e:	00000897          	auipc	a7,0x0
    1b62:	3f28b883          	ld	a7,1010(a7) # 1f50 <__clone+0xe2>
    1b66:	00000817          	auipc	a6,0x0
    1b6a:	3f283803          	ld	a6,1010(a6) # 1f58 <__clone+0xea>
    1b6e:	431d                	li	t1,7
    1b70:	6198                	ld	a4,0(a1)
    1b72:	011707b3          	add	a5,a4,a7
    1b76:	fff74693          	not	a3,a4
    1b7a:	8ff5                	and	a5,a5,a3
    1b7c:	0107f7b3          	and	a5,a5,a6
    1b80:	ef81                	bnez	a5,1b98 <strncpy+0x1c0>
            *wd = *ws;
    1b82:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b84:	1661                	addi	a2,a2,-8
    1b86:	05a1                	addi	a1,a1,8
    1b88:	0521                	addi	a0,a0,8
    1b8a:	fec363e3          	bltu	t1,a2,1b70 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b8e:	e609                	bnez	a2,1b98 <strncpy+0x1c0>
    1b90:	a08d                	j	1bf2 <strncpy+0x21a>
    1b92:	167d                	addi	a2,a2,-1
    1b94:	0505                	addi	a0,a0,1
    1b96:	ca01                	beqz	a2,1ba6 <strncpy+0x1ce>
    1b98:	0005c783          	lbu	a5,0(a1)
    1b9c:	0585                	addi	a1,a1,1
    1b9e:	00f50023          	sb	a5,0(a0)
    1ba2:	fbe5                	bnez	a5,1b92 <strncpy+0x1ba>
        ;
tail:
    1ba4:	b59d                	j	1a0a <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1ba6:	8082                	ret
    1ba8:	472d                	li	a4,11
    1baa:	bdb5                	j	1a26 <strncpy+0x4e>
    1bac:	00778713          	addi	a4,a5,7
    1bb0:	45ad                	li	a1,11
    1bb2:	fff60693          	addi	a3,a2,-1
    1bb6:	e6b778e3          	bgeu	a4,a1,1a26 <strncpy+0x4e>
    1bba:	b7fd                	j	1ba8 <strncpy+0x1d0>
    1bbc:	40a007b3          	neg	a5,a0
    1bc0:	8832                	mv	a6,a2
    1bc2:	8b9d                	andi	a5,a5,7
    1bc4:	4681                	li	a3,0
    1bc6:	e4060be3          	beqz	a2,1a1c <strncpy+0x44>
    1bca:	b7cd                	j	1bac <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bcc:	468d                	li	a3,3
    1bce:	bd75                	j	1a8a <strncpy+0xb2>
    1bd0:	872a                	mv	a4,a0
    1bd2:	4681                	li	a3,0
    1bd4:	bd5d                	j	1a8a <strncpy+0xb2>
    1bd6:	4685                	li	a3,1
    1bd8:	bd4d                	j	1a8a <strncpy+0xb2>
    1bda:	8082                	ret
    1bdc:	87aa                	mv	a5,a0
    1bde:	4681                	li	a3,0
    1be0:	b5f9                	j	1aae <strncpy+0xd6>
    1be2:	4689                	li	a3,2
    1be4:	b55d                	j	1a8a <strncpy+0xb2>
    1be6:	4691                	li	a3,4
    1be8:	b54d                	j	1a8a <strncpy+0xb2>
    1bea:	4695                	li	a3,5
    1bec:	bd79                	j	1a8a <strncpy+0xb2>
    1bee:	4699                	li	a3,6
    1bf0:	bd69                	j	1a8a <strncpy+0xb2>
    1bf2:	8082                	ret
    1bf4:	8082                	ret
    1bf6:	8082                	ret

0000000000001bf8 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1bf8:	87aa                	mv	a5,a0
    1bfa:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1bfc:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c00:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c04:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c06:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c08:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c0c:	2501                	sext.w	a0,a0
    1c0e:	8082                	ret

0000000000001c10 <openat>:
    register long a7 __asm__("a7") = n;
    1c10:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c14:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c18:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c1c:	2501                	sext.w	a0,a0
    1c1e:	8082                	ret

0000000000001c20 <close>:
    register long a7 __asm__("a7") = n;
    1c20:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c24:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c28:	2501                	sext.w	a0,a0
    1c2a:	8082                	ret

0000000000001c2c <read>:
    register long a7 __asm__("a7") = n;
    1c2c:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c30:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c34:	8082                	ret

0000000000001c36 <write>:
    register long a7 __asm__("a7") = n;
    1c36:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c3a:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c3e:	8082                	ret

0000000000001c40 <getpid>:
    register long a7 __asm__("a7") = n;
    1c40:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c44:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c48:	2501                	sext.w	a0,a0
    1c4a:	8082                	ret

0000000000001c4c <getppid>:
    register long a7 __asm__("a7") = n;
    1c4c:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c50:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c54:	2501                	sext.w	a0,a0
    1c56:	8082                	ret

0000000000001c58 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c58:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c5c:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c60:	2501                	sext.w	a0,a0
    1c62:	8082                	ret

0000000000001c64 <fork>:
    register long a7 __asm__("a7") = n;
    1c64:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c68:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c6a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c6c:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c70:	2501                	sext.w	a0,a0
    1c72:	8082                	ret

0000000000001c74 <clone>:
// 子进程执行的执行的函数指针 | 函数参数 | 栈地址 | 栈的大小 | 标志位
pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c74:	85b2                	mv	a1,a2
    1c76:	863a                	mv	a2,a4
    if (stack)
    1c78:	c191                	beqz	a1,1c7c <clone+0x8>
	stack += stack_size;
    1c7a:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c7c:	4781                	li	a5,0
    1c7e:	4701                	li	a4,0
    1c80:	4681                	li	a3,0
    1c82:	2601                	sext.w	a2,a2
    1c84:	a2ed                	j	1e6e <__clone>

0000000000001c86 <exit>:
    register long a7 __asm__("a7") = n;
    1c86:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c8a:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c8e:	8082                	ret

0000000000001c90 <waitpid>:
    register long a7 __asm__("a7") = n;
    1c90:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c94:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c96:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c9a:	2501                	sext.w	a0,a0
    1c9c:	8082                	ret

0000000000001c9e <exec>:
    register long a7 __asm__("a7") = n;
    1c9e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1ca2:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1ca6:	2501                	sext.w	a0,a0
    1ca8:	8082                	ret

0000000000001caa <execve>:
    register long a7 __asm__("a7") = n;
    1caa:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cae:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cb2:	2501                	sext.w	a0,a0
    1cb4:	8082                	ret

0000000000001cb6 <times>:
    register long a7 __asm__("a7") = n;
    1cb6:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cba:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cbe:	2501                	sext.w	a0,a0
    1cc0:	8082                	ret

0000000000001cc2 <get_time>:

int64 get_time()
{
    1cc2:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cc4:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cc8:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cca:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ccc:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cd0:	2501                	sext.w	a0,a0
    1cd2:	ed09                	bnez	a0,1cec <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cd4:	67a2                	ld	a5,8(sp)
    1cd6:	3e800713          	li	a4,1000
    1cda:	00015503          	lhu	a0,0(sp)
    1cde:	02e7d7b3          	divu	a5,a5,a4
    1ce2:	02e50533          	mul	a0,a0,a4
    1ce6:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1ce8:	0141                	addi	sp,sp,16
    1cea:	8082                	ret
        return -1;
    1cec:	557d                	li	a0,-1
    1cee:	bfed                	j	1ce8 <get_time+0x26>

0000000000001cf0 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1cf0:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cf4:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1cf8:	2501                	sext.w	a0,a0
    1cfa:	8082                	ret

0000000000001cfc <time>:
    register long a7 __asm__("a7") = n;
    1cfc:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d00:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d04:	2501                	sext.w	a0,a0
    1d06:	8082                	ret

0000000000001d08 <sleep>:

int sleep(unsigned long long time)
{
    1d08:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d0a:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d0c:	850a                	mv	a0,sp
    1d0e:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d10:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d14:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d16:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d1a:	e501                	bnez	a0,1d22 <sleep+0x1a>
    return 0;
    1d1c:	4501                	li	a0,0
}
    1d1e:	0141                	addi	sp,sp,16
    1d20:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d22:	4502                	lw	a0,0(sp)
}
    1d24:	0141                	addi	sp,sp,16
    1d26:	8082                	ret

0000000000001d28 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d28:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d2c:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d30:	2501                	sext.w	a0,a0
    1d32:	8082                	ret

0000000000001d34 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d34:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d38:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d3c:	8082                	ret

0000000000001d3e <munmap>:
    register long a7 __asm__("a7") = n;
    1d3e:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d42:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d46:	2501                	sext.w	a0,a0
    1d48:	8082                	ret

0000000000001d4a <wait>:

int wait(int *code)
{
    1d4a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d4c:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d50:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d52:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d54:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d56:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d5a:	2501                	sext.w	a0,a0
    1d5c:	8082                	ret

0000000000001d5e <spawn>:
    register long a7 __asm__("a7") = n;
    1d5e:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d62:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d66:	2501                	sext.w	a0,a0
    1d68:	8082                	ret

0000000000001d6a <mailread>:
    register long a7 __asm__("a7") = n;
    1d6a:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d6e:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d72:	2501                	sext.w	a0,a0
    1d74:	8082                	ret

0000000000001d76 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d76:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d7a:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d7e:	2501                	sext.w	a0,a0
    1d80:	8082                	ret

0000000000001d82 <fstat>:
    register long a7 __asm__("a7") = n;
    1d82:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d86:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d8a:	2501                	sext.w	a0,a0
    1d8c:	8082                	ret

0000000000001d8e <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d8e:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d90:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d94:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d96:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d9a:	2501                	sext.w	a0,a0
    1d9c:	8082                	ret

0000000000001d9e <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1d9e:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1da0:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1da4:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da6:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1daa:	2501                	sext.w	a0,a0
    1dac:	8082                	ret

0000000000001dae <link>:

int link(char *old_path, char *new_path)
{
    1dae:	87aa                	mv	a5,a0
    1db0:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1db2:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1db6:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dba:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dbc:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1dc0:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dc2:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <unlink>:

int unlink(char *path)
{
    1dca:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dcc:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1dd0:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1dd4:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd6:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1dda:	2501                	sext.w	a0,a0
    1ddc:	8082                	ret

0000000000001dde <uname>:
    register long a7 __asm__("a7") = n;
    1dde:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1de2:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1de6:	2501                	sext.w	a0,a0
    1de8:	8082                	ret

0000000000001dea <brk>:
    register long a7 __asm__("a7") = n;
    1dea:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1dee:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1df2:	2501                	sext.w	a0,a0
    1df4:	8082                	ret

0000000000001df6 <getcwd>:
    register long a7 __asm__("a7") = n;
    1df6:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df8:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1dfc:	8082                	ret

0000000000001dfe <chdir>:
    register long a7 __asm__("a7") = n;
    1dfe:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e02:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e0a:	862e                	mv	a2,a1
    1e0c:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e0e:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e10:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e14:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e18:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e1a:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e1c:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e20:	2501                	sext.w	a0,a0
    1e22:	8082                	ret

0000000000001e24 <getdents>:
    register long a7 __asm__("a7") = n;
    1e24:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e28:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e2c:	2501                	sext.w	a0,a0
    1e2e:	8082                	ret

0000000000001e30 <pipe>:
    register long a7 __asm__("a7") = n;
    1e30:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e34:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e36:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e3a:	2501                	sext.w	a0,a0
    1e3c:	8082                	ret

0000000000001e3e <dup>:
    register long a7 __asm__("a7") = n;
    1e3e:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e40:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e44:	2501                	sext.w	a0,a0
    1e46:	8082                	ret

0000000000001e48 <dup2>:
    register long a7 __asm__("a7") = n;
    1e48:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e4a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e4c:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e50:	2501                	sext.w	a0,a0
    1e52:	8082                	ret

0000000000001e54 <mount>:
    register long a7 __asm__("a7") = n;
    1e54:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e58:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e5c:	2501                	sext.w	a0,a0
    1e5e:	8082                	ret

0000000000001e60 <umount>:
    register long a7 __asm__("a7") = n;
    1e60:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e64:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e66:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <__clone>:
.global __clone
.type  __clone, %function
# 函数指针 | 栈地址 | 标志位
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e6e:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e70:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e72:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e74:	8532                	mv	a0,a2
	mv a2, a4
    1e76:	863a                	mv	a2,a4
	mv a3, a5
    1e78:	86be                	mv	a3,a5
	mv a4, a6
    1e7a:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e7c:	0dc00893          	li	a7,220
	ecall
    1e80:	00000073          	ecall

	beqz a0, 1f
    1e84:	c111                	beqz	a0,1e88 <__clone+0x1a>
	# Parent
	ret
    1e86:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e88:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e8a:	6522                	ld	a0,8(sp)
	jalr a1
    1e8c:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e8e:	05d00893          	li	a7,93
	ecall
    1e92:	00000073          	ecall
