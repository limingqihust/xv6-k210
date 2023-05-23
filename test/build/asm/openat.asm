
/home/lzq/Desktop/oscomp/test/build/riscv64/openat：     文件格式 elf64-littleriscv


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
    1004:	1141                	add	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	eda50513          	add	a0,a0,-294 # 1ee0 <__clone+0x2c>
void test_openat(void) {
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1012:	312000ef          	jal	1324 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	f9a50513          	add	a0,a0,-102 # 1fb0 <__func__.0>
    101e:	306000ef          	jal	1324 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	ed650513          	add	a0,a0,-298 # 1ef8 <__clone+0x44>
    102a:	2fa000ef          	jal	1324 <puts>
    //int fd_dir = open(".", O_RDONLY | O_CREATE);
    int fd_dir = open("./mnt", O_DIRECTORY);
    102e:	002005b7          	lui	a1,0x200
    1032:	00001517          	auipc	a0,0x1
    1036:	ed650513          	add	a0,a0,-298 # 1f08 <__clone+0x54>
    103a:	405000ef          	jal	1c3e <open>
    103e:	842a                	mv	s0,a0
    printf("open dir fd: %d\n", fd_dir);
    1040:	85aa                	mv	a1,a0
    1042:	00001517          	auipc	a0,0x1
    1046:	ece50513          	add	a0,a0,-306 # 1f10 <__clone+0x5c>
    104a:	2fc000ef          	jal	1346 <printf>
    int fd = openat(fd_dir, "test_openat.txt", O_CREATE | O_RDWR);
    104e:	00001597          	auipc	a1,0x1
    1052:	eda58593          	add	a1,a1,-294 # 1f28 <__clone+0x74>
    1056:	8522                	mv	a0,s0
    1058:	04200613          	li	a2,66
    105c:	3fb000ef          	jal	1c56 <openat>
    1060:	842a                	mv	s0,a0
    printf("openat fd: %d\n", fd);
    1062:	85aa                	mv	a1,a0
    1064:	00001517          	auipc	a0,0x1
    1068:	ed450513          	add	a0,a0,-300 # 1f38 <__clone+0x84>
    106c:	2da000ef          	jal	1346 <printf>
    assert(fd > 0);
    1070:	02805f63          	blez	s0,10ae <test_openat+0xaa>
    printf("openat success.\n");
    1074:	00001517          	auipc	a0,0x1
    1078:	ef450513          	add	a0,a0,-268 # 1f68 <__clone+0xb4>
    107c:	2ca000ef          	jal	1346 <printf>
    write(fd, buf, strlen(buf));
    int size = read(fd, buf, 256);
    if (size > 0) printf("  openat success.\n");
    else printf("  openat error.\n");
    */
    close(fd);	
    1080:	8522                	mv	a0,s0
    1082:	3e5000ef          	jal	1c66 <close>
	
    TEST_END(__func__);
    1086:	00001517          	auipc	a0,0x1
    108a:	efa50513          	add	a0,a0,-262 # 1f80 <__clone+0xcc>
    108e:	296000ef          	jal	1324 <puts>
    1092:	00001517          	auipc	a0,0x1
    1096:	f1e50513          	add	a0,a0,-226 # 1fb0 <__func__.0>
    109a:	28a000ef          	jal	1324 <puts>
}
    109e:	6402                	ld	s0,0(sp)
    10a0:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    10a2:	00001517          	auipc	a0,0x1
    10a6:	e5650513          	add	a0,a0,-426 # 1ef8 <__clone+0x44>
}
    10aa:	0141                	add	sp,sp,16
    TEST_END(__func__);
    10ac:	aca5                	j	1324 <puts>
    assert(fd > 0);
    10ae:	00001517          	auipc	a0,0x1
    10b2:	e9a50513          	add	a0,a0,-358 # 1f48 <__clone+0x94>
    10b6:	50a000ef          	jal	15c0 <panic>
    10ba:	bf6d                	j	1074 <test_openat+0x70>

00000000000010bc <main>:

int main(void) {
    10bc:	1141                	add	sp,sp,-16
    10be:	e406                	sd	ra,8(sp)
    test_openat();
    10c0:	f45ff0ef          	jal	1004 <test_openat>
    return 0;
}
    10c4:	60a2                	ld	ra,8(sp)
    10c6:	4501                	li	a0,0
    10c8:	0141                	add	sp,sp,16
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
    10d0:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10d2:	05a1                	add	a1,a1,8
{
    10d4:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10d6:	fe7ff0ef          	jal	10bc <main>
    10da:	3f3000ef          	jal	1ccc <exit>
	return 0;
}
    10de:	60a2                	ld	ra,8(sp)
    10e0:	4501                	li	a0,0
    10e2:	0141                	add	sp,sp,16
    10e4:	8082                	ret

00000000000010e6 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10e6:	7179                	add	sp,sp,-48
    10e8:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10ea:	12054863          	bltz	a0,121a <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10ee:	02b577bb          	remuw	a5,a0,a1
    10f2:	00001697          	auipc	a3,0x1
    10f6:	ece68693          	add	a3,a3,-306 # 1fc0 <digits>
    buf[16] = 0;
    10fa:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10fe:	0005871b          	sext.w	a4,a1
    1102:	1782                	sll	a5,a5,0x20
    1104:	9381                	srl	a5,a5,0x20
    1106:	97b6                	add	a5,a5,a3
    1108:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    110c:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1110:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1114:	1ab56663          	bltu	a0,a1,12c0 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    1118:	02e8763b          	remuw	a2,a6,a4
    111c:	1602                	sll	a2,a2,0x20
    111e:	9201                	srl	a2,a2,0x20
    1120:	9636                	add	a2,a2,a3
    1122:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1126:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    112a:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    112e:	12e86c63          	bltu	a6,a4,1266 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1132:	02e5f63b          	remuw	a2,a1,a4
    1136:	1602                	sll	a2,a2,0x20
    1138:	9201                	srl	a2,a2,0x20
    113a:	9636                	add	a2,a2,a3
    113c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1140:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1144:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1148:	12e5e863          	bltu	a1,a4,1278 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    114c:	02e8763b          	remuw	a2,a6,a4
    1150:	1602                	sll	a2,a2,0x20
    1152:	9201                	srl	a2,a2,0x20
    1154:	9636                	add	a2,a2,a3
    1156:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    115e:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1162:	12e86463          	bltu	a6,a4,128a <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1166:	02e5f63b          	remuw	a2,a1,a4
    116a:	1602                	sll	a2,a2,0x20
    116c:	9201                	srl	a2,a2,0x20
    116e:	9636                	add	a2,a2,a3
    1170:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1174:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1178:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    117c:	12e5e063          	bltu	a1,a4,129c <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    1180:	02e8763b          	remuw	a2,a6,a4
    1184:	1602                	sll	a2,a2,0x20
    1186:	9201                	srl	a2,a2,0x20
    1188:	9636                	add	a2,a2,a3
    118a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    118e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1192:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1196:	0ae86f63          	bltu	a6,a4,1254 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    119a:	02e5f63b          	remuw	a2,a1,a4
    119e:	1602                	sll	a2,a2,0x20
    11a0:	9201                	srl	a2,a2,0x20
    11a2:	9636                	add	a2,a2,a3
    11a4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a8:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11ac:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11b0:	0ee5ef63          	bltu	a1,a4,12ae <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    11b4:	02e8763b          	remuw	a2,a6,a4
    11b8:	1602                	sll	a2,a2,0x20
    11ba:	9201                	srl	a2,a2,0x20
    11bc:	9636                	add	a2,a2,a3
    11be:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c2:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11c6:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11ca:	0ee86d63          	bltu	a6,a4,12c4 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    11ce:	02e5f63b          	remuw	a2,a1,a4
    11d2:	1602                	sll	a2,a2,0x20
    11d4:	9201                	srl	a2,a2,0x20
    11d6:	9636                	add	a2,a2,a3
    11d8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11dc:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11e0:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11e4:	0ee5e963          	bltu	a1,a4,12d6 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11e8:	1782                	sll	a5,a5,0x20
    11ea:	9381                	srl	a5,a5,0x20
    11ec:	96be                	add	a3,a3,a5
    11ee:	0006c783          	lbu	a5,0(a3)
    11f2:	4599                	li	a1,6
    11f4:	00f10723          	sb	a5,14(sp)

    if (sign)
    11f8:	00055763          	bgez	a0,1206 <printint.constprop.0+0x120>
        buf[i--] = '-';
    11fc:	02d00793          	li	a5,45
    1200:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1204:	4595                	li	a1,5
    write(f, s, l);
    1206:	003c                	add	a5,sp,8
    1208:	4641                	li	a2,16
    120a:	9e0d                	subw	a2,a2,a1
    120c:	4505                	li	a0,1
    120e:	95be                	add	a1,a1,a5
    1210:	26d000ef          	jal	1c7c <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1214:	70a2                	ld	ra,40(sp)
    1216:	6145                	add	sp,sp,48
    1218:	8082                	ret
        x = -xx;
    121a:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    121e:	02b677bb          	remuw	a5,a2,a1
    1222:	00001697          	auipc	a3,0x1
    1226:	d9e68693          	add	a3,a3,-610 # 1fc0 <digits>
    buf[16] = 0;
    122a:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    122e:	0005871b          	sext.w	a4,a1
    1232:	1782                	sll	a5,a5,0x20
    1234:	9381                	srl	a5,a5,0x20
    1236:	97b6                	add	a5,a5,a3
    1238:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    123c:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1240:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1244:	ecb67ae3          	bgeu	a2,a1,1118 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1248:	02d00793          	li	a5,45
    124c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1250:	45b9                	li	a1,14
    1252:	bf55                	j	1206 <printint.constprop.0+0x120>
    1254:	45a9                	li	a1,10
    if (sign)
    1256:	fa0558e3          	bgez	a0,1206 <printint.constprop.0+0x120>
        buf[i--] = '-';
    125a:	02d00793          	li	a5,45
    125e:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1262:	45a5                	li	a1,9
    1264:	b74d                	j	1206 <printint.constprop.0+0x120>
    1266:	45b9                	li	a1,14
    if (sign)
    1268:	f8055fe3          	bgez	a0,1206 <printint.constprop.0+0x120>
        buf[i--] = '-';
    126c:	02d00793          	li	a5,45
    1270:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1274:	45b5                	li	a1,13
    1276:	bf41                	j	1206 <printint.constprop.0+0x120>
    1278:	45b5                	li	a1,13
    if (sign)
    127a:	f80556e3          	bgez	a0,1206 <printint.constprop.0+0x120>
        buf[i--] = '-';
    127e:	02d00793          	li	a5,45
    1282:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1286:	45b1                	li	a1,12
    1288:	bfbd                	j	1206 <printint.constprop.0+0x120>
    128a:	45b1                	li	a1,12
    if (sign)
    128c:	f6055de3          	bgez	a0,1206 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1290:	02d00793          	li	a5,45
    1294:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1298:	45ad                	li	a1,11
    129a:	b7b5                	j	1206 <printint.constprop.0+0x120>
    129c:	45ad                	li	a1,11
    if (sign)
    129e:	f60554e3          	bgez	a0,1206 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12a2:	02d00793          	li	a5,45
    12a6:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12aa:	45a9                	li	a1,10
    12ac:	bfa9                	j	1206 <printint.constprop.0+0x120>
    12ae:	45a5                	li	a1,9
    if (sign)
    12b0:	f4055be3          	bgez	a0,1206 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12b4:	02d00793          	li	a5,45
    12b8:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12bc:	45a1                	li	a1,8
    12be:	b7a1                	j	1206 <printint.constprop.0+0x120>
    i = 15;
    12c0:	45bd                	li	a1,15
    12c2:	b791                	j	1206 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    12c4:	45a1                	li	a1,8
    if (sign)
    12c6:	f40550e3          	bgez	a0,1206 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12ca:	02d00793          	li	a5,45
    12ce:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12d2:	459d                	li	a1,7
    12d4:	bf0d                	j	1206 <printint.constprop.0+0x120>
    12d6:	459d                	li	a1,7
    if (sign)
    12d8:	f20557e3          	bgez	a0,1206 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12dc:	02d00793          	li	a5,45
    12e0:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12e4:	4599                	li	a1,6
    12e6:	b705                	j	1206 <printint.constprop.0+0x120>

00000000000012e8 <getchar>:
{
    12e8:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12ea:	00f10593          	add	a1,sp,15
    12ee:	4605                	li	a2,1
    12f0:	4501                	li	a0,0
{
    12f2:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12f4:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12f8:	17b000ef          	jal	1c72 <read>
}
    12fc:	60e2                	ld	ra,24(sp)
    12fe:	00f14503          	lbu	a0,15(sp)
    1302:	6105                	add	sp,sp,32
    1304:	8082                	ret

0000000000001306 <putchar>:
{
    1306:	1101                	add	sp,sp,-32
    1308:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    130a:	00f10593          	add	a1,sp,15
    130e:	4605                	li	a2,1
    1310:	4505                	li	a0,1
{
    1312:	ec06                	sd	ra,24(sp)
    char byte = c;
    1314:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1318:	165000ef          	jal	1c7c <write>
}
    131c:	60e2                	ld	ra,24(sp)
    131e:	2501                	sext.w	a0,a0
    1320:	6105                	add	sp,sp,32
    1322:	8082                	ret

0000000000001324 <puts>:
{
    1324:	1141                	add	sp,sp,-16
    1326:	e406                	sd	ra,8(sp)
    1328:	e022                	sd	s0,0(sp)
    132a:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    132c:	574000ef          	jal	18a0 <strlen>
    1330:	862a                	mv	a2,a0
    1332:	85a2                	mv	a1,s0
    1334:	4505                	li	a0,1
    1336:	147000ef          	jal	1c7c <write>
}
    133a:	60a2                	ld	ra,8(sp)
    133c:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    133e:	957d                	sra	a0,a0,0x3f
    return r;
    1340:	2501                	sext.w	a0,a0
}
    1342:	0141                	add	sp,sp,16
    1344:	8082                	ret

0000000000001346 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1346:	7171                	add	sp,sp,-176
    1348:	f85a                	sd	s6,48(sp)
    134a:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    134c:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    134e:	18bc                	add	a5,sp,120
{
    1350:	e8ca                	sd	s2,80(sp)
    1352:	e4ce                	sd	s3,72(sp)
    1354:	e0d2                	sd	s4,64(sp)
    1356:	fc56                	sd	s5,56(sp)
    1358:	f486                	sd	ra,104(sp)
    135a:	f0a2                	sd	s0,96(sp)
    135c:	eca6                	sd	s1,88(sp)
    135e:	fcae                	sd	a1,120(sp)
    1360:	e132                	sd	a2,128(sp)
    1362:	e536                	sd	a3,136(sp)
    1364:	e93a                	sd	a4,144(sp)
    1366:	f142                	sd	a6,160(sp)
    1368:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    136a:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    136c:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1370:	07300a13          	li	s4,115
    1374:	07800a93          	li	s5,120
    buf[i++] = '0';
    1378:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    137c:	00001997          	auipc	s3,0x1
    1380:	c4498993          	add	s3,s3,-956 # 1fc0 <digits>
        if (!*s)
    1384:	00054783          	lbu	a5,0(a0)
    1388:	16078a63          	beqz	a5,14fc <printf+0x1b6>
    138c:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    138e:	19278d63          	beq	a5,s2,1528 <printf+0x1e2>
    1392:	00164783          	lbu	a5,1(a2)
    1396:	0605                	add	a2,a2,1
    1398:	fbfd                	bnez	a5,138e <printf+0x48>
    139a:	84b2                	mv	s1,a2
        l = z - a;
    139c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13a0:	85aa                	mv	a1,a0
    13a2:	8622                	mv	a2,s0
    13a4:	4505                	li	a0,1
    13a6:	0d7000ef          	jal	1c7c <write>
        if (l)
    13aa:	1a041463          	bnez	s0,1552 <printf+0x20c>
        if (s[1] == 0)
    13ae:	0014c783          	lbu	a5,1(s1)
    13b2:	14078563          	beqz	a5,14fc <printf+0x1b6>
        switch (s[1])
    13b6:	1b478063          	beq	a5,s4,1556 <printf+0x210>
    13ba:	14fa6b63          	bltu	s4,a5,1510 <printf+0x1ca>
    13be:	06400713          	li	a4,100
    13c2:	1ee78063          	beq	a5,a4,15a2 <printf+0x25c>
    13c6:	07000713          	li	a4,112
    13ca:	1ae79963          	bne	a5,a4,157c <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13ce:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13d0:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13d4:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13d6:	631c                	ld	a5,0(a4)
    13d8:	0721                	add	a4,a4,8
    13da:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13dc:	00479293          	sll	t0,a5,0x4
    13e0:	00879f93          	sll	t6,a5,0x8
    13e4:	00c79f13          	sll	t5,a5,0xc
    13e8:	01079e93          	sll	t4,a5,0x10
    13ec:	01479e13          	sll	t3,a5,0x14
    13f0:	01879313          	sll	t1,a5,0x18
    13f4:	01c79893          	sll	a7,a5,0x1c
    13f8:	02479813          	sll	a6,a5,0x24
    13fc:	02879513          	sll	a0,a5,0x28
    1400:	02c79593          	sll	a1,a5,0x2c
    1404:	03079693          	sll	a3,a5,0x30
    1408:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    140c:	03c7d413          	srl	s0,a5,0x3c
    1410:	01c7d39b          	srlw	t2,a5,0x1c
    1414:	03c2d293          	srl	t0,t0,0x3c
    1418:	03cfdf93          	srl	t6,t6,0x3c
    141c:	03cf5f13          	srl	t5,t5,0x3c
    1420:	03cede93          	srl	t4,t4,0x3c
    1424:	03ce5e13          	srl	t3,t3,0x3c
    1428:	03c35313          	srl	t1,t1,0x3c
    142c:	03c8d893          	srl	a7,a7,0x3c
    1430:	03c85813          	srl	a6,a6,0x3c
    1434:	9171                	srl	a0,a0,0x3c
    1436:	91f1                	srl	a1,a1,0x3c
    1438:	92f1                	srl	a3,a3,0x3c
    143a:	9371                	srl	a4,a4,0x3c
    143c:	96ce                	add	a3,a3,s3
    143e:	974e                	add	a4,a4,s3
    1440:	944e                	add	s0,s0,s3
    1442:	92ce                	add	t0,t0,s3
    1444:	9fce                	add	t6,t6,s3
    1446:	9f4e                	add	t5,t5,s3
    1448:	9ece                	add	t4,t4,s3
    144a:	9e4e                	add	t3,t3,s3
    144c:	934e                	add	t1,t1,s3
    144e:	98ce                	add	a7,a7,s3
    1450:	93ce                	add	t2,t2,s3
    1452:	984e                	add	a6,a6,s3
    1454:	954e                	add	a0,a0,s3
    1456:	95ce                	add	a1,a1,s3
    1458:	0006c083          	lbu	ra,0(a3)
    145c:	0002c283          	lbu	t0,0(t0)
    1460:	00074683          	lbu	a3,0(a4)
    1464:	000fcf83          	lbu	t6,0(t6)
    1468:	000f4f03          	lbu	t5,0(t5)
    146c:	000ece83          	lbu	t4,0(t4)
    1470:	000e4e03          	lbu	t3,0(t3)
    1474:	00034303          	lbu	t1,0(t1)
    1478:	0008c883          	lbu	a7,0(a7)
    147c:	0003c383          	lbu	t2,0(t2)
    1480:	00084803          	lbu	a6,0(a6)
    1484:	00054503          	lbu	a0,0(a0)
    1488:	0005c583          	lbu	a1,0(a1)
    148c:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1490:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1494:	9371                	srl	a4,a4,0x3c
    1496:	8bbd                	and	a5,a5,15
    1498:	974e                	add	a4,a4,s3
    149a:	97ce                	add	a5,a5,s3
    149c:	005105a3          	sb	t0,11(sp)
    14a0:	01f10623          	sb	t6,12(sp)
    14a4:	01e106a3          	sb	t5,13(sp)
    14a8:	01d10723          	sb	t4,14(sp)
    14ac:	01c107a3          	sb	t3,15(sp)
    14b0:	00610823          	sb	t1,16(sp)
    14b4:	011108a3          	sb	a7,17(sp)
    14b8:	00710923          	sb	t2,18(sp)
    14bc:	010109a3          	sb	a6,19(sp)
    14c0:	00a10a23          	sb	a0,20(sp)
    14c4:	00b10aa3          	sb	a1,21(sp)
    14c8:	00110b23          	sb	ra,22(sp)
    14cc:	00d10ba3          	sb	a3,23(sp)
    14d0:	00810523          	sb	s0,10(sp)
    14d4:	00074703          	lbu	a4,0(a4)
    14d8:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14dc:	002c                	add	a1,sp,8
    14de:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14e0:	00e10c23          	sb	a4,24(sp)
    14e4:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14e8:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14ec:	790000ef          	jal	1c7c <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14f0:	00248513          	add	a0,s1,2
        if (!*s)
    14f4:	00054783          	lbu	a5,0(a0)
    14f8:	e8079ae3          	bnez	a5,138c <printf+0x46>
    }
    va_end(ap);
}
    14fc:	70a6                	ld	ra,104(sp)
    14fe:	7406                	ld	s0,96(sp)
    1500:	64e6                	ld	s1,88(sp)
    1502:	6946                	ld	s2,80(sp)
    1504:	69a6                	ld	s3,72(sp)
    1506:	6a06                	ld	s4,64(sp)
    1508:	7ae2                	ld	s5,56(sp)
    150a:	7b42                	ld	s6,48(sp)
    150c:	614d                	add	sp,sp,176
    150e:	8082                	ret
        switch (s[1])
    1510:	07579663          	bne	a5,s5,157c <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1514:	6782                	ld	a5,0(sp)
    1516:	45c1                	li	a1,16
    1518:	4388                	lw	a0,0(a5)
    151a:	07a1                	add	a5,a5,8
    151c:	e03e                	sd	a5,0(sp)
    151e:	bc9ff0ef          	jal	10e6 <printint.constprop.0>
        s += 2;
    1522:	00248513          	add	a0,s1,2
    1526:	b7f9                	j	14f4 <printf+0x1ae>
    1528:	84b2                	mv	s1,a2
    152a:	a039                	j	1538 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    152c:	0024c783          	lbu	a5,2(s1)
    1530:	0605                	add	a2,a2,1
    1532:	0489                	add	s1,s1,2
    1534:	e72794e3          	bne	a5,s2,139c <printf+0x56>
    1538:	0014c783          	lbu	a5,1(s1)
    153c:	ff2788e3          	beq	a5,s2,152c <printf+0x1e6>
        l = z - a;
    1540:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1544:	85aa                	mv	a1,a0
    1546:	8622                	mv	a2,s0
    1548:	4505                	li	a0,1
    154a:	732000ef          	jal	1c7c <write>
        if (l)
    154e:	e60400e3          	beqz	s0,13ae <printf+0x68>
    1552:	8526                	mv	a0,s1
    1554:	bd05                	j	1384 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    1556:	6782                	ld	a5,0(sp)
    1558:	6380                	ld	s0,0(a5)
    155a:	07a1                	add	a5,a5,8
    155c:	e03e                	sd	a5,0(sp)
    155e:	cc21                	beqz	s0,15b6 <printf+0x270>
            l = strnlen(a, 200);
    1560:	0c800593          	li	a1,200
    1564:	8522                	mv	a0,s0
    1566:	424000ef          	jal	198a <strnlen>
    write(f, s, l);
    156a:	0005061b          	sext.w	a2,a0
    156e:	85a2                	mv	a1,s0
    1570:	4505                	li	a0,1
    1572:	70a000ef          	jal	1c7c <write>
        s += 2;
    1576:	00248513          	add	a0,s1,2
    157a:	bfad                	j	14f4 <printf+0x1ae>
    return write(stdout, &byte, 1);
    157c:	4605                	li	a2,1
    157e:	002c                	add	a1,sp,8
    1580:	4505                	li	a0,1
    char byte = c;
    1582:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1586:	6f6000ef          	jal	1c7c <write>
    char byte = c;
    158a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    158e:	4605                	li	a2,1
    1590:	002c                	add	a1,sp,8
    1592:	4505                	li	a0,1
    char byte = c;
    1594:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1598:	6e4000ef          	jal	1c7c <write>
        s += 2;
    159c:	00248513          	add	a0,s1,2
    15a0:	bf91                	j	14f4 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    15a2:	6782                	ld	a5,0(sp)
    15a4:	45a9                	li	a1,10
    15a6:	4388                	lw	a0,0(a5)
    15a8:	07a1                	add	a5,a5,8
    15aa:	e03e                	sd	a5,0(sp)
    15ac:	b3bff0ef          	jal	10e6 <printint.constprop.0>
        s += 2;
    15b0:	00248513          	add	a0,s1,2
    15b4:	b781                	j	14f4 <printf+0x1ae>
                a = "(null)";
    15b6:	00001417          	auipc	s0,0x1
    15ba:	9da40413          	add	s0,s0,-1574 # 1f90 <__clone+0xdc>
    15be:	b74d                	j	1560 <printf+0x21a>

00000000000015c0 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15c0:	1141                	add	sp,sp,-16
    15c2:	e406                	sd	ra,8(sp)
    puts(m);
    15c4:	d61ff0ef          	jal	1324 <puts>
    exit(-100);
}
    15c8:	60a2                	ld	ra,8(sp)
    exit(-100);
    15ca:	f9c00513          	li	a0,-100
}
    15ce:	0141                	add	sp,sp,16
    exit(-100);
    15d0:	adf5                	j	1ccc <exit>

00000000000015d2 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d2:	02000793          	li	a5,32
    15d6:	00f50663          	beq	a0,a5,15e2 <isspace+0x10>
    15da:	355d                	addw	a0,a0,-9
    15dc:	00553513          	sltiu	a0,a0,5
    15e0:	8082                	ret
    15e2:	4505                	li	a0,1
}
    15e4:	8082                	ret

00000000000015e6 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15e6:	fd05051b          	addw	a0,a0,-48
}
    15ea:	00a53513          	sltiu	a0,a0,10
    15ee:	8082                	ret

00000000000015f0 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f0:	02000693          	li	a3,32
    15f4:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15f6:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15fa:	ff77871b          	addw	a4,a5,-9
    15fe:	04d78c63          	beq	a5,a3,1656 <atoi+0x66>
    1602:	0007861b          	sext.w	a2,a5
    1606:	04e5f863          	bgeu	a1,a4,1656 <atoi+0x66>
        s++;
    switch (*s)
    160a:	02b00713          	li	a4,43
    160e:	04e78963          	beq	a5,a4,1660 <atoi+0x70>
    1612:	02d00713          	li	a4,45
    1616:	06e78263          	beq	a5,a4,167a <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    161a:	fd06069b          	addw	a3,a2,-48
    161e:	47a5                	li	a5,9
    1620:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1622:	4301                	li	t1,0
    while (isdigit(*s))
    1624:	04d7e963          	bltu	a5,a3,1676 <atoi+0x86>
    int n = 0, neg = 0;
    1628:	4501                	li	a0,0
    while (isdigit(*s))
    162a:	48a5                	li	a7,9
    162c:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1630:	0025179b          	sllw	a5,a0,0x2
    1634:	9fa9                	addw	a5,a5,a0
    1636:	fd06059b          	addw	a1,a2,-48
    163a:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    163e:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1642:	0705                	add	a4,a4,1
    1644:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    1648:	0006861b          	sext.w	a2,a3
    164c:	ff08f0e3          	bgeu	a7,a6,162c <atoi+0x3c>
    return neg ? n : -n;
    1650:	00030563          	beqz	t1,165a <atoi+0x6a>
}
    1654:	8082                	ret
        s++;
    1656:	0505                	add	a0,a0,1
    1658:	bf79                	j	15f6 <atoi+0x6>
    return neg ? n : -n;
    165a:	40f5853b          	subw	a0,a1,a5
    165e:	8082                	ret
    while (isdigit(*s))
    1660:	00154603          	lbu	a2,1(a0)
    1664:	47a5                	li	a5,9
        s++;
    1666:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    166a:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    166e:	4301                	li	t1,0
    while (isdigit(*s))
    1670:	2601                	sext.w	a2,a2
    1672:	fad7fbe3          	bgeu	a5,a3,1628 <atoi+0x38>
    1676:	4501                	li	a0,0
}
    1678:	8082                	ret
    while (isdigit(*s))
    167a:	00154603          	lbu	a2,1(a0)
    167e:	47a5                	li	a5,9
        s++;
    1680:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1684:	fd06069b          	addw	a3,a2,-48
    1688:	2601                	sext.w	a2,a2
    168a:	fed7e6e3          	bltu	a5,a3,1676 <atoi+0x86>
        neg = 1;
    168e:	4305                	li	t1,1
    1690:	bf61                	j	1628 <atoi+0x38>

0000000000001692 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1692:	18060163          	beqz	a2,1814 <memset+0x182>
    1696:	40a006b3          	neg	a3,a0
    169a:	0076f793          	and	a5,a3,7
    169e:	00778813          	add	a6,a5,7
    16a2:	48ad                	li	a7,11
    16a4:	0ff5f713          	zext.b	a4,a1
    16a8:	fff60593          	add	a1,a2,-1
    16ac:	17186563          	bltu	a6,a7,1816 <memset+0x184>
    16b0:	1705ed63          	bltu	a1,a6,182a <memset+0x198>
    16b4:	16078363          	beqz	a5,181a <memset+0x188>
    16b8:	00e50023          	sb	a4,0(a0)
    16bc:	0066f593          	and	a1,a3,6
    16c0:	16058063          	beqz	a1,1820 <memset+0x18e>
    16c4:	00e500a3          	sb	a4,1(a0)
    16c8:	4589                	li	a1,2
    16ca:	16f5f363          	bgeu	a1,a5,1830 <memset+0x19e>
    16ce:	00e50123          	sb	a4,2(a0)
    16d2:	8a91                	and	a3,a3,4
    16d4:	00350593          	add	a1,a0,3
    16d8:	4e0d                	li	t3,3
    16da:	ce9d                	beqz	a3,1718 <memset+0x86>
    16dc:	00e501a3          	sb	a4,3(a0)
    16e0:	4691                	li	a3,4
    16e2:	00450593          	add	a1,a0,4
    16e6:	4e11                	li	t3,4
    16e8:	02f6f863          	bgeu	a3,a5,1718 <memset+0x86>
    16ec:	00e50223          	sb	a4,4(a0)
    16f0:	4695                	li	a3,5
    16f2:	00550593          	add	a1,a0,5
    16f6:	4e15                	li	t3,5
    16f8:	02d78063          	beq	a5,a3,1718 <memset+0x86>
    16fc:	fff50693          	add	a3,a0,-1
    1700:	00e502a3          	sb	a4,5(a0)
    1704:	8a9d                	and	a3,a3,7
    1706:	00650593          	add	a1,a0,6
    170a:	4e19                	li	t3,6
    170c:	e691                	bnez	a3,1718 <memset+0x86>
    170e:	00750593          	add	a1,a0,7
    1712:	00e50323          	sb	a4,6(a0)
    1716:	4e1d                	li	t3,7
    1718:	00871693          	sll	a3,a4,0x8
    171c:	01071813          	sll	a6,a4,0x10
    1720:	8ed9                	or	a3,a3,a4
    1722:	01871893          	sll	a7,a4,0x18
    1726:	0106e6b3          	or	a3,a3,a6
    172a:	0116e6b3          	or	a3,a3,a7
    172e:	02071813          	sll	a6,a4,0x20
    1732:	02871313          	sll	t1,a4,0x28
    1736:	0106e6b3          	or	a3,a3,a6
    173a:	40f608b3          	sub	a7,a2,a5
    173e:	03071813          	sll	a6,a4,0x30
    1742:	0066e6b3          	or	a3,a3,t1
    1746:	0106e6b3          	or	a3,a3,a6
    174a:	03871313          	sll	t1,a4,0x38
    174e:	97aa                	add	a5,a5,a0
    1750:	ff88f813          	and	a6,a7,-8
    1754:	0066e6b3          	or	a3,a3,t1
    1758:	983e                	add	a6,a6,a5
    175a:	e394                	sd	a3,0(a5)
    175c:	07a1                	add	a5,a5,8
    175e:	ff079ee3          	bne	a5,a6,175a <memset+0xc8>
    1762:	ff88f793          	and	a5,a7,-8
    1766:	0078f893          	and	a7,a7,7
    176a:	00f586b3          	add	a3,a1,a5
    176e:	01c787bb          	addw	a5,a5,t3
    1772:	0a088b63          	beqz	a7,1828 <memset+0x196>
    1776:	00e68023          	sb	a4,0(a3)
    177a:	0017859b          	addw	a1,a5,1
    177e:	08c5fb63          	bgeu	a1,a2,1814 <memset+0x182>
    1782:	00e680a3          	sb	a4,1(a3)
    1786:	0027859b          	addw	a1,a5,2
    178a:	08c5f563          	bgeu	a1,a2,1814 <memset+0x182>
    178e:	00e68123          	sb	a4,2(a3)
    1792:	0037859b          	addw	a1,a5,3
    1796:	06c5ff63          	bgeu	a1,a2,1814 <memset+0x182>
    179a:	00e681a3          	sb	a4,3(a3)
    179e:	0047859b          	addw	a1,a5,4
    17a2:	06c5f963          	bgeu	a1,a2,1814 <memset+0x182>
    17a6:	00e68223          	sb	a4,4(a3)
    17aa:	0057859b          	addw	a1,a5,5
    17ae:	06c5f363          	bgeu	a1,a2,1814 <memset+0x182>
    17b2:	00e682a3          	sb	a4,5(a3)
    17b6:	0067859b          	addw	a1,a5,6
    17ba:	04c5fd63          	bgeu	a1,a2,1814 <memset+0x182>
    17be:	00e68323          	sb	a4,6(a3)
    17c2:	0077859b          	addw	a1,a5,7
    17c6:	04c5f763          	bgeu	a1,a2,1814 <memset+0x182>
    17ca:	00e683a3          	sb	a4,7(a3)
    17ce:	0087859b          	addw	a1,a5,8
    17d2:	04c5f163          	bgeu	a1,a2,1814 <memset+0x182>
    17d6:	00e68423          	sb	a4,8(a3)
    17da:	0097859b          	addw	a1,a5,9
    17de:	02c5fb63          	bgeu	a1,a2,1814 <memset+0x182>
    17e2:	00e684a3          	sb	a4,9(a3)
    17e6:	00a7859b          	addw	a1,a5,10
    17ea:	02c5f563          	bgeu	a1,a2,1814 <memset+0x182>
    17ee:	00e68523          	sb	a4,10(a3)
    17f2:	00b7859b          	addw	a1,a5,11
    17f6:	00c5ff63          	bgeu	a1,a2,1814 <memset+0x182>
    17fa:	00e685a3          	sb	a4,11(a3)
    17fe:	00c7859b          	addw	a1,a5,12
    1802:	00c5f963          	bgeu	a1,a2,1814 <memset+0x182>
    1806:	00e68623          	sb	a4,12(a3)
    180a:	27b5                	addw	a5,a5,13
    180c:	00c7f463          	bgeu	a5,a2,1814 <memset+0x182>
    1810:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1814:	8082                	ret
    1816:	482d                	li	a6,11
    1818:	bd61                	j	16b0 <memset+0x1e>
    char *p = dest;
    181a:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    181c:	4e01                	li	t3,0
    181e:	bded                	j	1718 <memset+0x86>
    1820:	00150593          	add	a1,a0,1
    1824:	4e05                	li	t3,1
    1826:	bdcd                	j	1718 <memset+0x86>
    1828:	8082                	ret
    char *p = dest;
    182a:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    182c:	4781                	li	a5,0
    182e:	b7a1                	j	1776 <memset+0xe4>
    1830:	00250593          	add	a1,a0,2
    1834:	4e09                	li	t3,2
    1836:	b5cd                	j	1718 <memset+0x86>

0000000000001838 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1838:	00054783          	lbu	a5,0(a0)
    183c:	0005c703          	lbu	a4,0(a1)
    1840:	00e79863          	bne	a5,a4,1850 <strcmp+0x18>
    1844:	0505                	add	a0,a0,1
    1846:	0585                	add	a1,a1,1
    1848:	fbe5                	bnez	a5,1838 <strcmp>
    184a:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    184c:	9d19                	subw	a0,a0,a4
    184e:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1850:	0007851b          	sext.w	a0,a5
    1854:	bfe5                	j	184c <strcmp+0x14>

0000000000001856 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1856:	ca15                	beqz	a2,188a <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1858:	00054783          	lbu	a5,0(a0)
    if (!n--)
    185c:	167d                	add	a2,a2,-1
    185e:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1862:	eb99                	bnez	a5,1878 <strncmp+0x22>
    1864:	a815                	j	1898 <strncmp+0x42>
    1866:	00a68e63          	beq	a3,a0,1882 <strncmp+0x2c>
    186a:	0505                	add	a0,a0,1
    186c:	00f71b63          	bne	a4,a5,1882 <strncmp+0x2c>
    1870:	00054783          	lbu	a5,0(a0)
    1874:	cf89                	beqz	a5,188e <strncmp+0x38>
    1876:	85b2                	mv	a1,a2
    1878:	0005c703          	lbu	a4,0(a1)
    187c:	00158613          	add	a2,a1,1
    1880:	f37d                	bnez	a4,1866 <strncmp+0x10>
        ;
    return *l - *r;
    1882:	0007851b          	sext.w	a0,a5
    1886:	9d19                	subw	a0,a0,a4
    1888:	8082                	ret
        return 0;
    188a:	4501                	li	a0,0
}
    188c:	8082                	ret
    return *l - *r;
    188e:	0015c703          	lbu	a4,1(a1)
    1892:	4501                	li	a0,0
    1894:	9d19                	subw	a0,a0,a4
    1896:	8082                	ret
    1898:	0005c703          	lbu	a4,0(a1)
    189c:	4501                	li	a0,0
    189e:	b7e5                	j	1886 <strncmp+0x30>

00000000000018a0 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18a0:	00757793          	and	a5,a0,7
    18a4:	cf89                	beqz	a5,18be <strlen+0x1e>
    18a6:	87aa                	mv	a5,a0
    18a8:	a029                	j	18b2 <strlen+0x12>
    18aa:	0785                	add	a5,a5,1
    18ac:	0077f713          	and	a4,a5,7
    18b0:	cb01                	beqz	a4,18c0 <strlen+0x20>
        if (!*s)
    18b2:	0007c703          	lbu	a4,0(a5)
    18b6:	fb75                	bnez	a4,18aa <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18b8:	40a78533          	sub	a0,a5,a0
}
    18bc:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18be:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18c0:	6394                	ld	a3,0(a5)
    18c2:	00000597          	auipc	a1,0x0
    18c6:	6d65b583          	ld	a1,1750(a1) # 1f98 <__clone+0xe4>
    18ca:	00000617          	auipc	a2,0x0
    18ce:	6d663603          	ld	a2,1750(a2) # 1fa0 <__clone+0xec>
    18d2:	a019                	j	18d8 <strlen+0x38>
    18d4:	6794                	ld	a3,8(a5)
    18d6:	07a1                	add	a5,a5,8
    18d8:	00b68733          	add	a4,a3,a1
    18dc:	fff6c693          	not	a3,a3
    18e0:	8f75                	and	a4,a4,a3
    18e2:	8f71                	and	a4,a4,a2
    18e4:	db65                	beqz	a4,18d4 <strlen+0x34>
    for (; *s; s++)
    18e6:	0007c703          	lbu	a4,0(a5)
    18ea:	d779                	beqz	a4,18b8 <strlen+0x18>
    18ec:	0017c703          	lbu	a4,1(a5)
    18f0:	0785                	add	a5,a5,1
    18f2:	d379                	beqz	a4,18b8 <strlen+0x18>
    18f4:	0017c703          	lbu	a4,1(a5)
    18f8:	0785                	add	a5,a5,1
    18fa:	fb6d                	bnez	a4,18ec <strlen+0x4c>
    18fc:	bf75                	j	18b8 <strlen+0x18>

00000000000018fe <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18fe:	00757713          	and	a4,a0,7
{
    1902:	87aa                	mv	a5,a0
    1904:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1908:	cb19                	beqz	a4,191e <memchr+0x20>
    190a:	ce25                	beqz	a2,1982 <memchr+0x84>
    190c:	0007c703          	lbu	a4,0(a5)
    1910:	00b70763          	beq	a4,a1,191e <memchr+0x20>
    1914:	0785                	add	a5,a5,1
    1916:	0077f713          	and	a4,a5,7
    191a:	167d                	add	a2,a2,-1
    191c:	f77d                	bnez	a4,190a <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    191e:	4501                	li	a0,0
    if (n && *s != c)
    1920:	c235                	beqz	a2,1984 <memchr+0x86>
    1922:	0007c703          	lbu	a4,0(a5)
    1926:	06b70063          	beq	a4,a1,1986 <memchr+0x88>
        size_t k = ONES * c;
    192a:	00000517          	auipc	a0,0x0
    192e:	67e53503          	ld	a0,1662(a0) # 1fa8 <__clone+0xf4>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1932:	471d                	li	a4,7
        size_t k = ONES * c;
    1934:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1938:	04c77763          	bgeu	a4,a2,1986 <memchr+0x88>
    193c:	00000897          	auipc	a7,0x0
    1940:	65c8b883          	ld	a7,1628(a7) # 1f98 <__clone+0xe4>
    1944:	00000817          	auipc	a6,0x0
    1948:	65c83803          	ld	a6,1628(a6) # 1fa0 <__clone+0xec>
    194c:	431d                	li	t1,7
    194e:	a029                	j	1958 <memchr+0x5a>
    1950:	1661                	add	a2,a2,-8
    1952:	07a1                	add	a5,a5,8
    1954:	00c37c63          	bgeu	t1,a2,196c <memchr+0x6e>
    1958:	6398                	ld	a4,0(a5)
    195a:	8f29                	xor	a4,a4,a0
    195c:	011706b3          	add	a3,a4,a7
    1960:	fff74713          	not	a4,a4
    1964:	8f75                	and	a4,a4,a3
    1966:	01077733          	and	a4,a4,a6
    196a:	d37d                	beqz	a4,1950 <memchr+0x52>
    196c:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    196e:	e601                	bnez	a2,1976 <memchr+0x78>
    1970:	a809                	j	1982 <memchr+0x84>
    1972:	0505                	add	a0,a0,1
    1974:	c619                	beqz	a2,1982 <memchr+0x84>
    1976:	00054783          	lbu	a5,0(a0)
    197a:	167d                	add	a2,a2,-1
    197c:	feb79be3          	bne	a5,a1,1972 <memchr+0x74>
    1980:	8082                	ret
    return n ? (void *)s : 0;
    1982:	4501                	li	a0,0
}
    1984:	8082                	ret
    if (n && *s != c)
    1986:	853e                	mv	a0,a5
    1988:	b7fd                	j	1976 <memchr+0x78>

000000000000198a <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    198a:	1101                	add	sp,sp,-32
    198c:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    198e:	862e                	mv	a2,a1
{
    1990:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1992:	4581                	li	a1,0
{
    1994:	e426                	sd	s1,8(sp)
    1996:	ec06                	sd	ra,24(sp)
    1998:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    199a:	f65ff0ef          	jal	18fe <memchr>
    return p ? p - s : n;
    199e:	c519                	beqz	a0,19ac <strnlen+0x22>
}
    19a0:	60e2                	ld	ra,24(sp)
    19a2:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19a4:	8d05                	sub	a0,a0,s1
}
    19a6:	64a2                	ld	s1,8(sp)
    19a8:	6105                	add	sp,sp,32
    19aa:	8082                	ret
    19ac:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19ae:	8522                	mv	a0,s0
}
    19b0:	6442                	ld	s0,16(sp)
    19b2:	64a2                	ld	s1,8(sp)
    19b4:	6105                	add	sp,sp,32
    19b6:	8082                	ret

00000000000019b8 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19b8:	00a5c7b3          	xor	a5,a1,a0
    19bc:	8b9d                	and	a5,a5,7
    19be:	eb95                	bnez	a5,19f2 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19c0:	0075f793          	and	a5,a1,7
    19c4:	e7b1                	bnez	a5,1a10 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19c6:	6198                	ld	a4,0(a1)
    19c8:	00000617          	auipc	a2,0x0
    19cc:	5d063603          	ld	a2,1488(a2) # 1f98 <__clone+0xe4>
    19d0:	00000817          	auipc	a6,0x0
    19d4:	5d083803          	ld	a6,1488(a6) # 1fa0 <__clone+0xec>
    19d8:	a029                	j	19e2 <strcpy+0x2a>
    19da:	05a1                	add	a1,a1,8
    19dc:	e118                	sd	a4,0(a0)
    19de:	6198                	ld	a4,0(a1)
    19e0:	0521                	add	a0,a0,8
    19e2:	00c707b3          	add	a5,a4,a2
    19e6:	fff74693          	not	a3,a4
    19ea:	8ff5                	and	a5,a5,a3
    19ec:	0107f7b3          	and	a5,a5,a6
    19f0:	d7ed                	beqz	a5,19da <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19f2:	0005c783          	lbu	a5,0(a1)
    19f6:	00f50023          	sb	a5,0(a0)
    19fa:	c785                	beqz	a5,1a22 <strcpy+0x6a>
    19fc:	0015c783          	lbu	a5,1(a1)
    1a00:	0505                	add	a0,a0,1
    1a02:	0585                	add	a1,a1,1
    1a04:	00f50023          	sb	a5,0(a0)
    1a08:	fbf5                	bnez	a5,19fc <strcpy+0x44>
        ;
    return d;
}
    1a0a:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a0c:	0505                	add	a0,a0,1
    1a0e:	df45                	beqz	a4,19c6 <strcpy+0xe>
            if (!(*d = *s))
    1a10:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a14:	0585                	add	a1,a1,1
    1a16:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a1a:	00f50023          	sb	a5,0(a0)
    1a1e:	f7fd                	bnez	a5,1a0c <strcpy+0x54>
}
    1a20:	8082                	ret
    1a22:	8082                	ret

0000000000001a24 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a24:	00a5c7b3          	xor	a5,a1,a0
    1a28:	8b9d                	and	a5,a5,7
    1a2a:	e3b5                	bnez	a5,1a8e <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a2c:	0075f793          	and	a5,a1,7
    1a30:	cf99                	beqz	a5,1a4e <strncpy+0x2a>
    1a32:	ea09                	bnez	a2,1a44 <strncpy+0x20>
    1a34:	a421                	j	1c3c <strncpy+0x218>
    1a36:	0585                	add	a1,a1,1
    1a38:	0075f793          	and	a5,a1,7
    1a3c:	167d                	add	a2,a2,-1
    1a3e:	0505                	add	a0,a0,1
    1a40:	c799                	beqz	a5,1a4e <strncpy+0x2a>
    1a42:	c225                	beqz	a2,1aa2 <strncpy+0x7e>
    1a44:	0005c783          	lbu	a5,0(a1)
    1a48:	00f50023          	sb	a5,0(a0)
    1a4c:	f7ed                	bnez	a5,1a36 <strncpy+0x12>
            ;
        if (!n || !*s)
    1a4e:	ca31                	beqz	a2,1aa2 <strncpy+0x7e>
    1a50:	0005c783          	lbu	a5,0(a1)
    1a54:	cba1                	beqz	a5,1aa4 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a56:	479d                	li	a5,7
    1a58:	02c7fc63          	bgeu	a5,a2,1a90 <strncpy+0x6c>
    1a5c:	00000897          	auipc	a7,0x0
    1a60:	53c8b883          	ld	a7,1340(a7) # 1f98 <__clone+0xe4>
    1a64:	00000817          	auipc	a6,0x0
    1a68:	53c83803          	ld	a6,1340(a6) # 1fa0 <__clone+0xec>
    1a6c:	431d                	li	t1,7
    1a6e:	a039                	j	1a7c <strncpy+0x58>
            *wd = *ws;
    1a70:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a72:	1661                	add	a2,a2,-8
    1a74:	05a1                	add	a1,a1,8
    1a76:	0521                	add	a0,a0,8
    1a78:	00c37b63          	bgeu	t1,a2,1a8e <strncpy+0x6a>
    1a7c:	6198                	ld	a4,0(a1)
    1a7e:	011707b3          	add	a5,a4,a7
    1a82:	fff74693          	not	a3,a4
    1a86:	8ff5                	and	a5,a5,a3
    1a88:	0107f7b3          	and	a5,a5,a6
    1a8c:	d3f5                	beqz	a5,1a70 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a8e:	ca11                	beqz	a2,1aa2 <strncpy+0x7e>
    1a90:	0005c783          	lbu	a5,0(a1)
    1a94:	0585                	add	a1,a1,1
    1a96:	00f50023          	sb	a5,0(a0)
    1a9a:	c789                	beqz	a5,1aa4 <strncpy+0x80>
    1a9c:	167d                	add	a2,a2,-1
    1a9e:	0505                	add	a0,a0,1
    1aa0:	fa65                	bnez	a2,1a90 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1aa2:	8082                	ret
    1aa4:	4805                	li	a6,1
    1aa6:	14061b63          	bnez	a2,1bfc <strncpy+0x1d8>
    1aaa:	40a00733          	neg	a4,a0
    1aae:	00777793          	and	a5,a4,7
    1ab2:	4581                	li	a1,0
    1ab4:	12061c63          	bnez	a2,1bec <strncpy+0x1c8>
    1ab8:	00778693          	add	a3,a5,7
    1abc:	48ad                	li	a7,11
    1abe:	1316e563          	bltu	a3,a7,1be8 <strncpy+0x1c4>
    1ac2:	16d5e263          	bltu	a1,a3,1c26 <strncpy+0x202>
    1ac6:	14078c63          	beqz	a5,1c1e <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1aca:	00050023          	sb	zero,0(a0)
    1ace:	00677693          	and	a3,a4,6
    1ad2:	14068263          	beqz	a3,1c16 <strncpy+0x1f2>
    1ad6:	000500a3          	sb	zero,1(a0)
    1ada:	4689                	li	a3,2
    1adc:	14f6f863          	bgeu	a3,a5,1c2c <strncpy+0x208>
    1ae0:	00050123          	sb	zero,2(a0)
    1ae4:	8b11                	and	a4,a4,4
    1ae6:	12070463          	beqz	a4,1c0e <strncpy+0x1ea>
    1aea:	000501a3          	sb	zero,3(a0)
    1aee:	4711                	li	a4,4
    1af0:	00450693          	add	a3,a0,4
    1af4:	02f77563          	bgeu	a4,a5,1b1e <strncpy+0xfa>
    1af8:	00050223          	sb	zero,4(a0)
    1afc:	4715                	li	a4,5
    1afe:	00550693          	add	a3,a0,5
    1b02:	00e78e63          	beq	a5,a4,1b1e <strncpy+0xfa>
    1b06:	fff50713          	add	a4,a0,-1
    1b0a:	000502a3          	sb	zero,5(a0)
    1b0e:	8b1d                	and	a4,a4,7
    1b10:	12071263          	bnez	a4,1c34 <strncpy+0x210>
    1b14:	00750693          	add	a3,a0,7
    1b18:	00050323          	sb	zero,6(a0)
    1b1c:	471d                	li	a4,7
    1b1e:	40f80833          	sub	a6,a6,a5
    1b22:	ff887593          	and	a1,a6,-8
    1b26:	97aa                	add	a5,a5,a0
    1b28:	95be                	add	a1,a1,a5
    1b2a:	0007b023          	sd	zero,0(a5)
    1b2e:	07a1                	add	a5,a5,8
    1b30:	feb79de3          	bne	a5,a1,1b2a <strncpy+0x106>
    1b34:	ff887593          	and	a1,a6,-8
    1b38:	00787813          	and	a6,a6,7
    1b3c:	00e587bb          	addw	a5,a1,a4
    1b40:	00b68733          	add	a4,a3,a1
    1b44:	0e080063          	beqz	a6,1c24 <strncpy+0x200>
    1b48:	00070023          	sb	zero,0(a4)
    1b4c:	0017869b          	addw	a3,a5,1
    1b50:	f4c6f9e3          	bgeu	a3,a2,1aa2 <strncpy+0x7e>
    1b54:	000700a3          	sb	zero,1(a4)
    1b58:	0027869b          	addw	a3,a5,2
    1b5c:	f4c6f3e3          	bgeu	a3,a2,1aa2 <strncpy+0x7e>
    1b60:	00070123          	sb	zero,2(a4)
    1b64:	0037869b          	addw	a3,a5,3
    1b68:	f2c6fde3          	bgeu	a3,a2,1aa2 <strncpy+0x7e>
    1b6c:	000701a3          	sb	zero,3(a4)
    1b70:	0047869b          	addw	a3,a5,4
    1b74:	f2c6f7e3          	bgeu	a3,a2,1aa2 <strncpy+0x7e>
    1b78:	00070223          	sb	zero,4(a4)
    1b7c:	0057869b          	addw	a3,a5,5
    1b80:	f2c6f1e3          	bgeu	a3,a2,1aa2 <strncpy+0x7e>
    1b84:	000702a3          	sb	zero,5(a4)
    1b88:	0067869b          	addw	a3,a5,6
    1b8c:	f0c6fbe3          	bgeu	a3,a2,1aa2 <strncpy+0x7e>
    1b90:	00070323          	sb	zero,6(a4)
    1b94:	0077869b          	addw	a3,a5,7
    1b98:	f0c6f5e3          	bgeu	a3,a2,1aa2 <strncpy+0x7e>
    1b9c:	000703a3          	sb	zero,7(a4)
    1ba0:	0087869b          	addw	a3,a5,8
    1ba4:	eec6ffe3          	bgeu	a3,a2,1aa2 <strncpy+0x7e>
    1ba8:	00070423          	sb	zero,8(a4)
    1bac:	0097869b          	addw	a3,a5,9
    1bb0:	eec6f9e3          	bgeu	a3,a2,1aa2 <strncpy+0x7e>
    1bb4:	000704a3          	sb	zero,9(a4)
    1bb8:	00a7869b          	addw	a3,a5,10
    1bbc:	eec6f3e3          	bgeu	a3,a2,1aa2 <strncpy+0x7e>
    1bc0:	00070523          	sb	zero,10(a4)
    1bc4:	00b7869b          	addw	a3,a5,11
    1bc8:	ecc6fde3          	bgeu	a3,a2,1aa2 <strncpy+0x7e>
    1bcc:	000705a3          	sb	zero,11(a4)
    1bd0:	00c7869b          	addw	a3,a5,12
    1bd4:	ecc6f7e3          	bgeu	a3,a2,1aa2 <strncpy+0x7e>
    1bd8:	00070623          	sb	zero,12(a4)
    1bdc:	27b5                	addw	a5,a5,13
    1bde:	ecc7f2e3          	bgeu	a5,a2,1aa2 <strncpy+0x7e>
    1be2:	000706a3          	sb	zero,13(a4)
}
    1be6:	8082                	ret
    1be8:	46ad                	li	a3,11
    1bea:	bde1                	j	1ac2 <strncpy+0x9e>
    1bec:	00778693          	add	a3,a5,7
    1bf0:	48ad                	li	a7,11
    1bf2:	fff60593          	add	a1,a2,-1
    1bf6:	ed16f6e3          	bgeu	a3,a7,1ac2 <strncpy+0x9e>
    1bfa:	b7fd                	j	1be8 <strncpy+0x1c4>
    1bfc:	40a00733          	neg	a4,a0
    1c00:	8832                	mv	a6,a2
    1c02:	00777793          	and	a5,a4,7
    1c06:	4581                	li	a1,0
    1c08:	ea0608e3          	beqz	a2,1ab8 <strncpy+0x94>
    1c0c:	b7c5                	j	1bec <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c0e:	00350693          	add	a3,a0,3
    1c12:	470d                	li	a4,3
    1c14:	b729                	j	1b1e <strncpy+0xfa>
    1c16:	00150693          	add	a3,a0,1
    1c1a:	4705                	li	a4,1
    1c1c:	b709                	j	1b1e <strncpy+0xfa>
tail:
    1c1e:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c20:	4701                	li	a4,0
    1c22:	bdf5                	j	1b1e <strncpy+0xfa>
    1c24:	8082                	ret
tail:
    1c26:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c28:	4781                	li	a5,0
    1c2a:	bf39                	j	1b48 <strncpy+0x124>
    1c2c:	00250693          	add	a3,a0,2
    1c30:	4709                	li	a4,2
    1c32:	b5f5                	j	1b1e <strncpy+0xfa>
    1c34:	00650693          	add	a3,a0,6
    1c38:	4719                	li	a4,6
    1c3a:	b5d5                	j	1b1e <strncpy+0xfa>
    1c3c:	8082                	ret

0000000000001c3e <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c3e:	87aa                	mv	a5,a0
    1c40:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c42:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c46:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c4a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c4c:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c4e:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c52:	2501                	sext.w	a0,a0
    1c54:	8082                	ret

0000000000001c56 <openat>:
    register long a7 __asm__("a7") = n;
    1c56:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c5a:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c5e:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c62:	2501                	sext.w	a0,a0
    1c64:	8082                	ret

0000000000001c66 <close>:
    register long a7 __asm__("a7") = n;
    1c66:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c6a:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c6e:	2501                	sext.w	a0,a0
    1c70:	8082                	ret

0000000000001c72 <read>:
    register long a7 __asm__("a7") = n;
    1c72:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c76:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c7a:	8082                	ret

0000000000001c7c <write>:
    register long a7 __asm__("a7") = n;
    1c7c:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c80:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c84:	8082                	ret

0000000000001c86 <getpid>:
    register long a7 __asm__("a7") = n;
    1c86:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c8a:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c8e:	2501                	sext.w	a0,a0
    1c90:	8082                	ret

0000000000001c92 <getppid>:
    register long a7 __asm__("a7") = n;
    1c92:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c96:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c9a:	2501                	sext.w	a0,a0
    1c9c:	8082                	ret

0000000000001c9e <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c9e:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1ca2:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1ca6:	2501                	sext.w	a0,a0
    1ca8:	8082                	ret

0000000000001caa <fork>:
    register long a7 __asm__("a7") = n;
    1caa:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cae:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cb0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cb2:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cb6:	2501                	sext.w	a0,a0
    1cb8:	8082                	ret

0000000000001cba <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cba:	85b2                	mv	a1,a2
    1cbc:	863a                	mv	a2,a4
    if (stack)
    1cbe:	c191                	beqz	a1,1cc2 <clone+0x8>
	stack += stack_size;
    1cc0:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cc2:	4781                	li	a5,0
    1cc4:	4701                	li	a4,0
    1cc6:	4681                	li	a3,0
    1cc8:	2601                	sext.w	a2,a2
    1cca:	a2ed                	j	1eb4 <__clone>

0000000000001ccc <exit>:
    register long a7 __asm__("a7") = n;
    1ccc:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cd0:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cd4:	8082                	ret

0000000000001cd6 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cd6:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cda:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cdc:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1ce0:	2501                	sext.w	a0,a0
    1ce2:	8082                	ret

0000000000001ce4 <exec>:
    register long a7 __asm__("a7") = n;
    1ce4:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1ce8:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cec:	2501                	sext.w	a0,a0
    1cee:	8082                	ret

0000000000001cf0 <execve>:
    register long a7 __asm__("a7") = n;
    1cf0:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cf4:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cf8:	2501                	sext.w	a0,a0
    1cfa:	8082                	ret

0000000000001cfc <times>:
    register long a7 __asm__("a7") = n;
    1cfc:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d00:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d04:	2501                	sext.w	a0,a0
    1d06:	8082                	ret

0000000000001d08 <get_time>:

int64 get_time()
{
    1d08:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d0a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d0e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d10:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d12:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d16:	2501                	sext.w	a0,a0
    1d18:	ed09                	bnez	a0,1d32 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d1a:	67a2                	ld	a5,8(sp)
    1d1c:	3e800713          	li	a4,1000
    1d20:	00015503          	lhu	a0,0(sp)
    1d24:	02e7d7b3          	divu	a5,a5,a4
    1d28:	02e50533          	mul	a0,a0,a4
    1d2c:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d2e:	0141                	add	sp,sp,16
    1d30:	8082                	ret
        return -1;
    1d32:	557d                	li	a0,-1
    1d34:	bfed                	j	1d2e <get_time+0x26>

0000000000001d36 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d36:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d3a:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d3e:	2501                	sext.w	a0,a0
    1d40:	8082                	ret

0000000000001d42 <time>:
    register long a7 __asm__("a7") = n;
    1d42:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d46:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d4a:	2501                	sext.w	a0,a0
    1d4c:	8082                	ret

0000000000001d4e <sleep>:

int sleep(unsigned long long time)
{
    1d4e:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d50:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d52:	850a                	mv	a0,sp
    1d54:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d56:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d5a:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d5c:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d60:	e501                	bnez	a0,1d68 <sleep+0x1a>
    return 0;
    1d62:	4501                	li	a0,0
}
    1d64:	0141                	add	sp,sp,16
    1d66:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d68:	4502                	lw	a0,0(sp)
}
    1d6a:	0141                	add	sp,sp,16
    1d6c:	8082                	ret

0000000000001d6e <set_priority>:
    register long a7 __asm__("a7") = n;
    1d6e:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d72:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d76:	2501                	sext.w	a0,a0
    1d78:	8082                	ret

0000000000001d7a <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d7a:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d7e:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d82:	8082                	ret

0000000000001d84 <munmap>:
    register long a7 __asm__("a7") = n;
    1d84:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d88:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d8c:	2501                	sext.w	a0,a0
    1d8e:	8082                	ret

0000000000001d90 <wait>:

int wait(int *code)
{
    1d90:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d92:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d96:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d98:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d9a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d9c:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1da0:	2501                	sext.w	a0,a0
    1da2:	8082                	ret

0000000000001da4 <spawn>:
    register long a7 __asm__("a7") = n;
    1da4:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1da8:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dac:	2501                	sext.w	a0,a0
    1dae:	8082                	ret

0000000000001db0 <mailread>:
    register long a7 __asm__("a7") = n;
    1db0:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db4:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1db8:	2501                	sext.w	a0,a0
    1dba:	8082                	ret

0000000000001dbc <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dbc:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc0:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <fstat>:
    register long a7 __asm__("a7") = n;
    1dc8:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dcc:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dd4:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dd6:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dda:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ddc:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1de0:	2501                	sext.w	a0,a0
    1de2:	8082                	ret

0000000000001de4 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1de4:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1de6:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1dea:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dec:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <link>:

int link(char *old_path, char *new_path)
{
    1df4:	87aa                	mv	a5,a0
    1df6:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1df8:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1dfc:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e00:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e02:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e06:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e08:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e0c:	2501                	sext.w	a0,a0
    1e0e:	8082                	ret

0000000000001e10 <unlink>:

int unlink(char *path)
{
    1e10:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e12:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e16:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e1a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e1c:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e20:	2501                	sext.w	a0,a0
    1e22:	8082                	ret

0000000000001e24 <uname>:
    register long a7 __asm__("a7") = n;
    1e24:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e28:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e2c:	2501                	sext.w	a0,a0
    1e2e:	8082                	ret

0000000000001e30 <brk>:
    register long a7 __asm__("a7") = n;
    1e30:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e34:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e38:	2501                	sext.w	a0,a0
    1e3a:	8082                	ret

0000000000001e3c <getcwd>:
    register long a7 __asm__("a7") = n;
    1e3c:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e3e:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e42:	8082                	ret

0000000000001e44 <chdir>:
    register long a7 __asm__("a7") = n;
    1e44:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e48:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e4c:	2501                	sext.w	a0,a0
    1e4e:	8082                	ret

0000000000001e50 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e50:	862e                	mv	a2,a1
    1e52:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e54:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e56:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e5a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e5e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e60:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e62:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e66:	2501                	sext.w	a0,a0
    1e68:	8082                	ret

0000000000001e6a <getdents>:
    register long a7 __asm__("a7") = n;
    1e6a:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e6e:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e72:	2501                	sext.w	a0,a0
    1e74:	8082                	ret

0000000000001e76 <pipe>:
    register long a7 __asm__("a7") = n;
    1e76:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e7a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e7c:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e80:	2501                	sext.w	a0,a0
    1e82:	8082                	ret

0000000000001e84 <dup>:
    register long a7 __asm__("a7") = n;
    1e84:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e86:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e8a:	2501                	sext.w	a0,a0
    1e8c:	8082                	ret

0000000000001e8e <dup2>:
    register long a7 __asm__("a7") = n;
    1e8e:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e90:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e92:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e96:	2501                	sext.w	a0,a0
    1e98:	8082                	ret

0000000000001e9a <mount>:
    register long a7 __asm__("a7") = n;
    1e9a:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e9e:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ea2:	2501                	sext.w	a0,a0
    1ea4:	8082                	ret

0000000000001ea6 <umount>:
    register long a7 __asm__("a7") = n;
    1ea6:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1eaa:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eac:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1eb0:	2501                	sext.w	a0,a0
    1eb2:	8082                	ret

0000000000001eb4 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1eb4:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1eb6:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1eb8:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1eba:	8532                	mv	a0,a2
	mv a2, a4
    1ebc:	863a                	mv	a2,a4
	mv a3, a5
    1ebe:	86be                	mv	a3,a5
	mv a4, a6
    1ec0:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ec2:	0dc00893          	li	a7,220
	ecall
    1ec6:	00000073          	ecall

	beqz a0, 1f
    1eca:	c111                	beqz	a0,1ece <__clone+0x1a>
	# Parent
	ret
    1ecc:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ece:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ed0:	6522                	ld	a0,8(sp)
	jalr a1
    1ed2:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ed4:	05d00893          	li	a7,93
	ecall
    1ed8:	00000073          	ecall
