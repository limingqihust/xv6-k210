
/home/lmq/Desktop/xv6-k210/test/build/riscv64/read:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a845                	j	10b2 <__start_main>

0000000000001004 <test_read>:
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

void test_read() {
    1004:	712d                	addi	sp,sp,-288
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	e7a50513          	addi	a0,a0,-390 # 1e80 <__clone+0x2c>
void test_read() {
    100e:	ee06                	sd	ra,280(sp)
    1010:	ea22                	sd	s0,272(sp)
	TEST_START(__func__);
    1012:	29e000ef          	jal	ra,12b0 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	ef250513          	addi	a0,a0,-270 # 1f08 <__func__.1165>
    101e:	292000ef          	jal	ra,12b0 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	e7650513          	addi	a0,a0,-394 # 1e98 <__clone+0x44>
    102a:	286000ef          	jal	ra,12b0 <puts>
	int fd = open("./text.txt", O_RDWR | O_CREATE);
    102e:	04200593          	li	a1,66
    1032:	00001517          	auipc	a0,0x1
    1036:	e7650513          	addi	a0,a0,-394 # 1ea8 <__clone+0x54>
    103a:	3a5000ef          	jal	ra,1bde <open>
	char buf[256];
	int size = read(fd, buf, 256);
    103e:	10000613          	li	a2,256
    1042:	080c                	addi	a1,sp,16
	int fd = open("./text.txt", O_RDWR | O_CREATE);
    1044:	842a                	mv	s0,a0
	int size = read(fd, buf, 256);
    1046:	3cd000ef          	jal	ra,1c12 <read>
	assert(size >= 0);
    104a:	02051793          	slli	a5,a0,0x20
	int size = read(fd, buf, 256);
    104e:	0005061b          	sext.w	a2,a0
	assert(size >= 0);
    1052:	0207cf63          	bltz	a5,1090 <test_read+0x8c>

	write(STDOUT, buf, size);
    1056:	080c                	addi	a1,sp,16
    1058:	4505                	li	a0,1
    105a:	3c3000ef          	jal	ra,1c1c <write>
	close(fd);
    105e:	8522                	mv	a0,s0
    1060:	3a7000ef          	jal	ra,1c06 <close>
	TEST_END(__func__);
    1064:	00001517          	auipc	a0,0x1
    1068:	e7450513          	addi	a0,a0,-396 # 1ed8 <__clone+0x84>
    106c:	244000ef          	jal	ra,12b0 <puts>
    1070:	00001517          	auipc	a0,0x1
    1074:	e9850513          	addi	a0,a0,-360 # 1f08 <__func__.1165>
    1078:	238000ef          	jal	ra,12b0 <puts>
    107c:	00001517          	auipc	a0,0x1
    1080:	e1c50513          	addi	a0,a0,-484 # 1e98 <__clone+0x44>
    1084:	22c000ef          	jal	ra,12b0 <puts>
}
    1088:	60f2                	ld	ra,280(sp)
    108a:	6452                	ld	s0,272(sp)
    108c:	6115                	addi	sp,sp,288
    108e:	8082                	ret
	assert(size >= 0);
    1090:	00001517          	auipc	a0,0x1
    1094:	e2850513          	addi	a0,a0,-472 # 1eb8 <__clone+0x64>
    1098:	e432                	sd	a2,8(sp)
    109a:	4c0000ef          	jal	ra,155a <panic>
    109e:	6622                	ld	a2,8(sp)
    10a0:	bf5d                	j	1056 <test_read+0x52>

00000000000010a2 <main>:

int main(void) {
    10a2:	1141                	addi	sp,sp,-16
    10a4:	e406                	sd	ra,8(sp)
	test_read();
    10a6:	f5fff0ef          	jal	ra,1004 <test_read>
	return 0;
}
    10aa:	60a2                	ld	ra,8(sp)
    10ac:	4501                	li	a0,0
    10ae:	0141                	addi	sp,sp,16
    10b0:	8082                	ret

00000000000010b2 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10b2:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10b4:	4108                	lw	a0,0(a0)
{
    10b6:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10b8:	05a1                	addi	a1,a1,8
{
    10ba:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10bc:	fe7ff0ef          	jal	ra,10a2 <main>
    10c0:	3ad000ef          	jal	ra,1c6c <exit>
	return 0;
}
    10c4:	60a2                	ld	ra,8(sp)
    10c6:	4501                	li	a0,0
    10c8:	0141                	addi	sp,sp,16
    10ca:	8082                	ret

00000000000010cc <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10cc:	7179                	addi	sp,sp,-48
    10ce:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10d0:	12054b63          	bltz	a0,1206 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10d4:	02b577bb          	remuw	a5,a0,a1
    10d8:	00001697          	auipc	a3,0x1
    10dc:	e4068693          	addi	a3,a3,-448 # 1f18 <digits>
    buf[16] = 0;
    10e0:	00010c23          	sb	zero,24(sp)
    i = 15;
    10e4:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    10e8:	1782                	slli	a5,a5,0x20
    10ea:	9381                	srli	a5,a5,0x20
    10ec:	97b6                	add	a5,a5,a3
    10ee:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10f2:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10f6:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10fa:	16b56263          	bltu	a0,a1,125e <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    10fe:	02e8763b          	remuw	a2,a6,a4
    1102:	1602                	slli	a2,a2,0x20
    1104:	9201                	srli	a2,a2,0x20
    1106:	9636                	add	a2,a2,a3
    1108:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    110c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1110:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1114:	12e86963          	bltu	a6,a4,1246 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    1118:	02e5f63b          	remuw	a2,a1,a4
    111c:	1602                	slli	a2,a2,0x20
    111e:	9201                	srli	a2,a2,0x20
    1120:	9636                	add	a2,a2,a3
    1122:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1126:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    112a:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    112e:	10e5ef63          	bltu	a1,a4,124c <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1132:	02e8763b          	remuw	a2,a6,a4
    1136:	1602                	slli	a2,a2,0x20
    1138:	9201                	srli	a2,a2,0x20
    113a:	9636                	add	a2,a2,a3
    113c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1140:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1144:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1148:	10e86563          	bltu	a6,a4,1252 <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    114c:	02e5f63b          	remuw	a2,a1,a4
    1150:	1602                	slli	a2,a2,0x20
    1152:	9201                	srli	a2,a2,0x20
    1154:	9636                	add	a2,a2,a3
    1156:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115a:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    115e:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1162:	0ee5eb63          	bltu	a1,a4,1258 <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    1166:	02e8763b          	remuw	a2,a6,a4
    116a:	1602                	slli	a2,a2,0x20
    116c:	9201                	srli	a2,a2,0x20
    116e:	9636                	add	a2,a2,a3
    1170:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1174:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1178:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    117c:	0ce86263          	bltu	a6,a4,1240 <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    1180:	02e5f63b          	remuw	a2,a1,a4
    1184:	1602                	slli	a2,a2,0x20
    1186:	9201                	srli	a2,a2,0x20
    1188:	9636                	add	a2,a2,a3
    118a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    118e:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1192:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1196:	0ce5e663          	bltu	a1,a4,1262 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    119a:	02e8763b          	remuw	a2,a6,a4
    119e:	1602                	slli	a2,a2,0x20
    11a0:	9201                	srli	a2,a2,0x20
    11a2:	9636                	add	a2,a2,a3
    11a4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a8:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11ac:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11b0:	0ae86c63          	bltu	a6,a4,1268 <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    11b4:	02e5f63b          	remuw	a2,a1,a4
    11b8:	1602                	slli	a2,a2,0x20
    11ba:	9201                	srli	a2,a2,0x20
    11bc:	9636                	add	a2,a2,a3
    11be:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c2:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11c6:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11ca:	0ae5e263          	bltu	a1,a4,126e <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    11ce:	1782                	slli	a5,a5,0x20
    11d0:	9381                	srli	a5,a5,0x20
    11d2:	97b6                	add	a5,a5,a3
    11d4:	0007c703          	lbu	a4,0(a5)
    11d8:	4599                	li	a1,6
    11da:	4795                	li	a5,5
    11dc:	00e10723          	sb	a4,14(sp)

    if (sign)
    11e0:	00055963          	bgez	a0,11f2 <printint.constprop.0+0x126>
        buf[i--] = '-';
    11e4:	1018                	addi	a4,sp,32
    11e6:	973e                	add	a4,a4,a5
    11e8:	02d00693          	li	a3,45
    11ec:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    11f0:	85be                	mv	a1,a5
    write(f, s, l);
    11f2:	003c                	addi	a5,sp,8
    11f4:	4641                	li	a2,16
    11f6:	9e0d                	subw	a2,a2,a1
    11f8:	4505                	li	a0,1
    11fa:	95be                	add	a1,a1,a5
    11fc:	221000ef          	jal	ra,1c1c <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1200:	70a2                	ld	ra,40(sp)
    1202:	6145                	addi	sp,sp,48
    1204:	8082                	ret
        x = -xx;
    1206:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    120a:	02b677bb          	remuw	a5,a2,a1
    120e:	00001697          	auipc	a3,0x1
    1212:	d0a68693          	addi	a3,a3,-758 # 1f18 <digits>
    buf[16] = 0;
    1216:	00010c23          	sb	zero,24(sp)
    i = 15;
    121a:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    121e:	1782                	slli	a5,a5,0x20
    1220:	9381                	srli	a5,a5,0x20
    1222:	97b6                	add	a5,a5,a3
    1224:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1228:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    122c:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1230:	ecb677e3          	bgeu	a2,a1,10fe <printint.constprop.0+0x32>
        buf[i--] = '-';
    1234:	02d00793          	li	a5,45
    1238:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    123c:	45b9                	li	a1,14
    123e:	bf55                	j	11f2 <printint.constprop.0+0x126>
    1240:	47a5                	li	a5,9
    1242:	45a9                	li	a1,10
    1244:	bf71                	j	11e0 <printint.constprop.0+0x114>
    1246:	47b5                	li	a5,13
    1248:	45b9                	li	a1,14
    124a:	bf59                	j	11e0 <printint.constprop.0+0x114>
    124c:	47b1                	li	a5,12
    124e:	45b5                	li	a1,13
    1250:	bf41                	j	11e0 <printint.constprop.0+0x114>
    1252:	47ad                	li	a5,11
    1254:	45b1                	li	a1,12
    1256:	b769                	j	11e0 <printint.constprop.0+0x114>
    1258:	47a9                	li	a5,10
    125a:	45ad                	li	a1,11
    125c:	b751                	j	11e0 <printint.constprop.0+0x114>
    i = 15;
    125e:	45bd                	li	a1,15
    1260:	bf49                	j	11f2 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1262:	47a1                	li	a5,8
    1264:	45a5                	li	a1,9
    1266:	bfad                	j	11e0 <printint.constprop.0+0x114>
    1268:	479d                	li	a5,7
    126a:	45a1                	li	a1,8
    126c:	bf95                	j	11e0 <printint.constprop.0+0x114>
    126e:	4799                	li	a5,6
    1270:	459d                	li	a1,7
    1272:	b7bd                	j	11e0 <printint.constprop.0+0x114>

0000000000001274 <getchar>:
{
    1274:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1276:	00f10593          	addi	a1,sp,15
    127a:	4605                	li	a2,1
    127c:	4501                	li	a0,0
{
    127e:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1280:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1284:	18f000ef          	jal	ra,1c12 <read>
}
    1288:	60e2                	ld	ra,24(sp)
    128a:	00f14503          	lbu	a0,15(sp)
    128e:	6105                	addi	sp,sp,32
    1290:	8082                	ret

0000000000001292 <putchar>:
{
    1292:	1101                	addi	sp,sp,-32
    1294:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1296:	00f10593          	addi	a1,sp,15
    129a:	4605                	li	a2,1
    129c:	4505                	li	a0,1
{
    129e:	ec06                	sd	ra,24(sp)
    char byte = c;
    12a0:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12a4:	179000ef          	jal	ra,1c1c <write>
}
    12a8:	60e2                	ld	ra,24(sp)
    12aa:	2501                	sext.w	a0,a0
    12ac:	6105                	addi	sp,sp,32
    12ae:	8082                	ret

00000000000012b0 <puts>:
{
    12b0:	1141                	addi	sp,sp,-16
    12b2:	e406                	sd	ra,8(sp)
    12b4:	e022                	sd	s0,0(sp)
    12b6:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12b8:	580000ef          	jal	ra,1838 <strlen>
    12bc:	862a                	mv	a2,a0
    12be:	85a2                	mv	a1,s0
    12c0:	4505                	li	a0,1
    12c2:	15b000ef          	jal	ra,1c1c <write>
}
    12c6:	60a2                	ld	ra,8(sp)
    12c8:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12ca:	957d                	srai	a0,a0,0x3f
    return r;
    12cc:	2501                	sext.w	a0,a0
}
    12ce:	0141                	addi	sp,sp,16
    12d0:	8082                	ret

00000000000012d2 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12d2:	7171                	addi	sp,sp,-176
    12d4:	fc56                	sd	s5,56(sp)
    12d6:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    12d8:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12da:	18bc                	addi	a5,sp,120
{
    12dc:	e8ca                	sd	s2,80(sp)
    12de:	e4ce                	sd	s3,72(sp)
    12e0:	e0d2                	sd	s4,64(sp)
    12e2:	f85a                	sd	s6,48(sp)
    12e4:	f486                	sd	ra,104(sp)
    12e6:	f0a2                	sd	s0,96(sp)
    12e8:	eca6                	sd	s1,88(sp)
    12ea:	fcae                	sd	a1,120(sp)
    12ec:	e132                	sd	a2,128(sp)
    12ee:	e536                	sd	a3,136(sp)
    12f0:	e93a                	sd	a4,144(sp)
    12f2:	f142                	sd	a6,160(sp)
    12f4:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    12f6:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12f8:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    12fc:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1300:	00001b17          	auipc	s6,0x1
    1304:	be8b0b13          	addi	s6,s6,-1048 # 1ee8 <__clone+0x94>
    buf[i++] = '0';
    1308:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    130c:	00001997          	auipc	s3,0x1
    1310:	c0c98993          	addi	s3,s3,-1012 # 1f18 <digits>
        if (!*s)
    1314:	00054783          	lbu	a5,0(a0)
    1318:	16078a63          	beqz	a5,148c <printf+0x1ba>
    131c:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    131e:	19278163          	beq	a5,s2,14a0 <printf+0x1ce>
    1322:	00164783          	lbu	a5,1(a2)
    1326:	0605                	addi	a2,a2,1
    1328:	fbfd                	bnez	a5,131e <printf+0x4c>
    132a:	84b2                	mv	s1,a2
        l = z - a;
    132c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1330:	85aa                	mv	a1,a0
    1332:	8622                	mv	a2,s0
    1334:	4505                	li	a0,1
    1336:	0e7000ef          	jal	ra,1c1c <write>
        if (l)
    133a:	18041c63          	bnez	s0,14d2 <printf+0x200>
        if (s[1] == 0)
    133e:	0014c783          	lbu	a5,1(s1)
    1342:	14078563          	beqz	a5,148c <printf+0x1ba>
        switch (s[1])
    1346:	1d478063          	beq	a5,s4,1506 <printf+0x234>
    134a:	18fa6663          	bltu	s4,a5,14d6 <printf+0x204>
    134e:	06400713          	li	a4,100
    1352:	1ae78063          	beq	a5,a4,14f2 <printf+0x220>
    1356:	07000713          	li	a4,112
    135a:	1ce79963          	bne	a5,a4,152c <printf+0x25a>
            printptr(va_arg(ap, uint64));
    135e:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1360:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1364:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1366:	631c                	ld	a5,0(a4)
    1368:	0721                	addi	a4,a4,8
    136a:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    136c:	00479293          	slli	t0,a5,0x4
    1370:	00879f93          	slli	t6,a5,0x8
    1374:	00c79f13          	slli	t5,a5,0xc
    1378:	01079e93          	slli	t4,a5,0x10
    137c:	01479e13          	slli	t3,a5,0x14
    1380:	01879313          	slli	t1,a5,0x18
    1384:	01c79893          	slli	a7,a5,0x1c
    1388:	02479813          	slli	a6,a5,0x24
    138c:	02879513          	slli	a0,a5,0x28
    1390:	02c79593          	slli	a1,a5,0x2c
    1394:	03079693          	slli	a3,a5,0x30
    1398:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    139c:	03c7d413          	srli	s0,a5,0x3c
    13a0:	01c7d39b          	srliw	t2,a5,0x1c
    13a4:	03c2d293          	srli	t0,t0,0x3c
    13a8:	03cfdf93          	srli	t6,t6,0x3c
    13ac:	03cf5f13          	srli	t5,t5,0x3c
    13b0:	03cede93          	srli	t4,t4,0x3c
    13b4:	03ce5e13          	srli	t3,t3,0x3c
    13b8:	03c35313          	srli	t1,t1,0x3c
    13bc:	03c8d893          	srli	a7,a7,0x3c
    13c0:	03c85813          	srli	a6,a6,0x3c
    13c4:	9171                	srli	a0,a0,0x3c
    13c6:	91f1                	srli	a1,a1,0x3c
    13c8:	92f1                	srli	a3,a3,0x3c
    13ca:	9371                	srli	a4,a4,0x3c
    13cc:	96ce                	add	a3,a3,s3
    13ce:	974e                	add	a4,a4,s3
    13d0:	944e                	add	s0,s0,s3
    13d2:	92ce                	add	t0,t0,s3
    13d4:	9fce                	add	t6,t6,s3
    13d6:	9f4e                	add	t5,t5,s3
    13d8:	9ece                	add	t4,t4,s3
    13da:	9e4e                	add	t3,t3,s3
    13dc:	934e                	add	t1,t1,s3
    13de:	98ce                	add	a7,a7,s3
    13e0:	93ce                	add	t2,t2,s3
    13e2:	984e                	add	a6,a6,s3
    13e4:	954e                	add	a0,a0,s3
    13e6:	95ce                	add	a1,a1,s3
    13e8:	0006c083          	lbu	ra,0(a3)
    13ec:	0002c283          	lbu	t0,0(t0)
    13f0:	00074683          	lbu	a3,0(a4)
    13f4:	000fcf83          	lbu	t6,0(t6)
    13f8:	000f4f03          	lbu	t5,0(t5)
    13fc:	000ece83          	lbu	t4,0(t4)
    1400:	000e4e03          	lbu	t3,0(t3)
    1404:	00034303          	lbu	t1,0(t1)
    1408:	0008c883          	lbu	a7,0(a7)
    140c:	0003c383          	lbu	t2,0(t2)
    1410:	00084803          	lbu	a6,0(a6)
    1414:	00054503          	lbu	a0,0(a0)
    1418:	0005c583          	lbu	a1,0(a1)
    141c:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1420:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1424:	9371                	srli	a4,a4,0x3c
    1426:	8bbd                	andi	a5,a5,15
    1428:	974e                	add	a4,a4,s3
    142a:	97ce                	add	a5,a5,s3
    142c:	005105a3          	sb	t0,11(sp)
    1430:	01f10623          	sb	t6,12(sp)
    1434:	01e106a3          	sb	t5,13(sp)
    1438:	01d10723          	sb	t4,14(sp)
    143c:	01c107a3          	sb	t3,15(sp)
    1440:	00610823          	sb	t1,16(sp)
    1444:	011108a3          	sb	a7,17(sp)
    1448:	00710923          	sb	t2,18(sp)
    144c:	010109a3          	sb	a6,19(sp)
    1450:	00a10a23          	sb	a0,20(sp)
    1454:	00b10aa3          	sb	a1,21(sp)
    1458:	00110b23          	sb	ra,22(sp)
    145c:	00d10ba3          	sb	a3,23(sp)
    1460:	00810523          	sb	s0,10(sp)
    1464:	00074703          	lbu	a4,0(a4)
    1468:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    146c:	002c                	addi	a1,sp,8
    146e:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1470:	00e10c23          	sb	a4,24(sp)
    1474:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1478:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    147c:	7a0000ef          	jal	ra,1c1c <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1480:	00248513          	addi	a0,s1,2
        if (!*s)
    1484:	00054783          	lbu	a5,0(a0)
    1488:	e8079ae3          	bnez	a5,131c <printf+0x4a>
    }
    va_end(ap);
}
    148c:	70a6                	ld	ra,104(sp)
    148e:	7406                	ld	s0,96(sp)
    1490:	64e6                	ld	s1,88(sp)
    1492:	6946                	ld	s2,80(sp)
    1494:	69a6                	ld	s3,72(sp)
    1496:	6a06                	ld	s4,64(sp)
    1498:	7ae2                	ld	s5,56(sp)
    149a:	7b42                	ld	s6,48(sp)
    149c:	614d                	addi	sp,sp,176
    149e:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14a0:	00064783          	lbu	a5,0(a2)
    14a4:	84b2                	mv	s1,a2
    14a6:	01278963          	beq	a5,s2,14b8 <printf+0x1e6>
    14aa:	b549                	j	132c <printf+0x5a>
    14ac:	0024c783          	lbu	a5,2(s1)
    14b0:	0605                	addi	a2,a2,1
    14b2:	0489                	addi	s1,s1,2
    14b4:	e7279ce3          	bne	a5,s2,132c <printf+0x5a>
    14b8:	0014c783          	lbu	a5,1(s1)
    14bc:	ff2788e3          	beq	a5,s2,14ac <printf+0x1da>
        l = z - a;
    14c0:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14c4:	85aa                	mv	a1,a0
    14c6:	8622                	mv	a2,s0
    14c8:	4505                	li	a0,1
    14ca:	752000ef          	jal	ra,1c1c <write>
        if (l)
    14ce:	e60408e3          	beqz	s0,133e <printf+0x6c>
    14d2:	8526                	mv	a0,s1
    14d4:	b581                	j	1314 <printf+0x42>
        switch (s[1])
    14d6:	07800713          	li	a4,120
    14da:	04e79963          	bne	a5,a4,152c <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    14de:	6782                	ld	a5,0(sp)
    14e0:	45c1                	li	a1,16
    14e2:	4388                	lw	a0,0(a5)
    14e4:	07a1                	addi	a5,a5,8
    14e6:	e03e                	sd	a5,0(sp)
    14e8:	be5ff0ef          	jal	ra,10cc <printint.constprop.0>
        s += 2;
    14ec:	00248513          	addi	a0,s1,2
    14f0:	bf51                	j	1484 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    14f2:	6782                	ld	a5,0(sp)
    14f4:	45a9                	li	a1,10
    14f6:	4388                	lw	a0,0(a5)
    14f8:	07a1                	addi	a5,a5,8
    14fa:	e03e                	sd	a5,0(sp)
    14fc:	bd1ff0ef          	jal	ra,10cc <printint.constprop.0>
        s += 2;
    1500:	00248513          	addi	a0,s1,2
    1504:	b741                	j	1484 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1506:	6782                	ld	a5,0(sp)
    1508:	6380                	ld	s0,0(a5)
    150a:	07a1                	addi	a5,a5,8
    150c:	e03e                	sd	a5,0(sp)
    150e:	c421                	beqz	s0,1556 <printf+0x284>
            l = strnlen(a, 200);
    1510:	0c800593          	li	a1,200
    1514:	8522                	mv	a0,s0
    1516:	40e000ef          	jal	ra,1924 <strnlen>
    write(f, s, l);
    151a:	0005061b          	sext.w	a2,a0
    151e:	85a2                	mv	a1,s0
    1520:	4505                	li	a0,1
    1522:	6fa000ef          	jal	ra,1c1c <write>
        s += 2;
    1526:	00248513          	addi	a0,s1,2
    152a:	bfa9                	j	1484 <printf+0x1b2>
    char byte = c;
    152c:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1530:	4605                	li	a2,1
    1532:	002c                	addi	a1,sp,8
    1534:	4505                	li	a0,1
    char byte = c;
    1536:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    153a:	6e2000ef          	jal	ra,1c1c <write>
    char byte = c;
    153e:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1542:	4605                	li	a2,1
    1544:	002c                	addi	a1,sp,8
    1546:	4505                	li	a0,1
    char byte = c;
    1548:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    154c:	6d0000ef          	jal	ra,1c1c <write>
        s += 2;
    1550:	00248513          	addi	a0,s1,2
    1554:	bf05                	j	1484 <printf+0x1b2>
                a = "(null)";
    1556:	845a                	mv	s0,s6
    1558:	bf65                	j	1510 <printf+0x23e>

000000000000155a <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    155a:	1141                	addi	sp,sp,-16
    155c:	e406                	sd	ra,8(sp)
    puts(m);
    155e:	d53ff0ef          	jal	ra,12b0 <puts>
    exit(-100);
}
    1562:	60a2                	ld	ra,8(sp)
    exit(-100);
    1564:	f9c00513          	li	a0,-100
}
    1568:	0141                	addi	sp,sp,16
    exit(-100);
    156a:	a709                	j	1c6c <exit>

000000000000156c <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    156c:	02000793          	li	a5,32
    1570:	00f50663          	beq	a0,a5,157c <isspace+0x10>
    1574:	355d                	addiw	a0,a0,-9
    1576:	00553513          	sltiu	a0,a0,5
    157a:	8082                	ret
    157c:	4505                	li	a0,1
}
    157e:	8082                	ret

0000000000001580 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1580:	fd05051b          	addiw	a0,a0,-48
}
    1584:	00a53513          	sltiu	a0,a0,10
    1588:	8082                	ret

000000000000158a <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    158a:	02000613          	li	a2,32
    158e:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1590:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1594:	ff77069b          	addiw	a3,a4,-9
    1598:	04c70d63          	beq	a4,a2,15f2 <atoi+0x68>
    159c:	0007079b          	sext.w	a5,a4
    15a0:	04d5f963          	bgeu	a1,a3,15f2 <atoi+0x68>
        s++;
    switch (*s)
    15a4:	02b00693          	li	a3,43
    15a8:	04d70a63          	beq	a4,a3,15fc <atoi+0x72>
    15ac:	02d00693          	li	a3,45
    15b0:	06d70463          	beq	a4,a3,1618 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15b4:	fd07859b          	addiw	a1,a5,-48
    15b8:	4625                	li	a2,9
    15ba:	873e                	mv	a4,a5
    15bc:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15be:	4e01                	li	t3,0
    while (isdigit(*s))
    15c0:	04b66a63          	bltu	a2,a1,1614 <atoi+0x8a>
    int n = 0, neg = 0;
    15c4:	4501                	li	a0,0
    while (isdigit(*s))
    15c6:	4825                	li	a6,9
    15c8:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    15cc:	0025179b          	slliw	a5,a0,0x2
    15d0:	9d3d                	addw	a0,a0,a5
    15d2:	fd07031b          	addiw	t1,a4,-48
    15d6:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15da:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15de:	0685                	addi	a3,a3,1
    15e0:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15e4:	0006071b          	sext.w	a4,a2
    15e8:	feb870e3          	bgeu	a6,a1,15c8 <atoi+0x3e>
    return neg ? n : -n;
    15ec:	000e0563          	beqz	t3,15f6 <atoi+0x6c>
}
    15f0:	8082                	ret
        s++;
    15f2:	0505                	addi	a0,a0,1
    15f4:	bf71                	j	1590 <atoi+0x6>
    15f6:	4113053b          	subw	a0,t1,a7
    15fa:	8082                	ret
    while (isdigit(*s))
    15fc:	00154783          	lbu	a5,1(a0)
    1600:	4625                	li	a2,9
        s++;
    1602:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1606:	fd07859b          	addiw	a1,a5,-48
    160a:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    160e:	4e01                	li	t3,0
    while (isdigit(*s))
    1610:	fab67ae3          	bgeu	a2,a1,15c4 <atoi+0x3a>
    1614:	4501                	li	a0,0
}
    1616:	8082                	ret
    while (isdigit(*s))
    1618:	00154783          	lbu	a5,1(a0)
    161c:	4625                	li	a2,9
        s++;
    161e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1622:	fd07859b          	addiw	a1,a5,-48
    1626:	0007871b          	sext.w	a4,a5
    162a:	feb665e3          	bltu	a2,a1,1614 <atoi+0x8a>
        neg = 1;
    162e:	4e05                	li	t3,1
    1630:	bf51                	j	15c4 <atoi+0x3a>

0000000000001632 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1632:	16060d63          	beqz	a2,17ac <memset+0x17a>
    1636:	40a007b3          	neg	a5,a0
    163a:	8b9d                	andi	a5,a5,7
    163c:	00778713          	addi	a4,a5,7
    1640:	482d                	li	a6,11
    1642:	0ff5f593          	andi	a1,a1,255
    1646:	fff60693          	addi	a3,a2,-1
    164a:	17076263          	bltu	a4,a6,17ae <memset+0x17c>
    164e:	16e6ea63          	bltu	a3,a4,17c2 <memset+0x190>
    1652:	16078563          	beqz	a5,17bc <memset+0x18a>
    1656:	00b50023          	sb	a1,0(a0)
    165a:	4705                	li	a4,1
    165c:	00150e93          	addi	t4,a0,1
    1660:	14e78c63          	beq	a5,a4,17b8 <memset+0x186>
    1664:	00b500a3          	sb	a1,1(a0)
    1668:	4709                	li	a4,2
    166a:	00250e93          	addi	t4,a0,2
    166e:	14e78d63          	beq	a5,a4,17c8 <memset+0x196>
    1672:	00b50123          	sb	a1,2(a0)
    1676:	470d                	li	a4,3
    1678:	00350e93          	addi	t4,a0,3
    167c:	12e78b63          	beq	a5,a4,17b2 <memset+0x180>
    1680:	00b501a3          	sb	a1,3(a0)
    1684:	4711                	li	a4,4
    1686:	00450e93          	addi	t4,a0,4
    168a:	14e78163          	beq	a5,a4,17cc <memset+0x19a>
    168e:	00b50223          	sb	a1,4(a0)
    1692:	4715                	li	a4,5
    1694:	00550e93          	addi	t4,a0,5
    1698:	12e78c63          	beq	a5,a4,17d0 <memset+0x19e>
    169c:	00b502a3          	sb	a1,5(a0)
    16a0:	471d                	li	a4,7
    16a2:	00650e93          	addi	t4,a0,6
    16a6:	12e79763          	bne	a5,a4,17d4 <memset+0x1a2>
    16aa:	00750e93          	addi	t4,a0,7
    16ae:	00b50323          	sb	a1,6(a0)
    16b2:	4f1d                	li	t5,7
    16b4:	00859713          	slli	a4,a1,0x8
    16b8:	8f4d                	or	a4,a4,a1
    16ba:	01059e13          	slli	t3,a1,0x10
    16be:	01c76e33          	or	t3,a4,t3
    16c2:	01859313          	slli	t1,a1,0x18
    16c6:	006e6333          	or	t1,t3,t1
    16ca:	02059893          	slli	a7,a1,0x20
    16ce:	011368b3          	or	a7,t1,a7
    16d2:	02859813          	slli	a6,a1,0x28
    16d6:	40f60333          	sub	t1,a2,a5
    16da:	0108e833          	or	a6,a7,a6
    16de:	03059693          	slli	a3,a1,0x30
    16e2:	00d866b3          	or	a3,a6,a3
    16e6:	03859713          	slli	a4,a1,0x38
    16ea:	97aa                	add	a5,a5,a0
    16ec:	ff837813          	andi	a6,t1,-8
    16f0:	8f55                	or	a4,a4,a3
    16f2:	00f806b3          	add	a3,a6,a5
    16f6:	e398                	sd	a4,0(a5)
    16f8:	07a1                	addi	a5,a5,8
    16fa:	fed79ee3          	bne	a5,a3,16f6 <memset+0xc4>
    16fe:	ff837693          	andi	a3,t1,-8
    1702:	00de87b3          	add	a5,t4,a3
    1706:	01e6873b          	addw	a4,a3,t5
    170a:	0ad30663          	beq	t1,a3,17b6 <memset+0x184>
    170e:	00b78023          	sb	a1,0(a5)
    1712:	0017069b          	addiw	a3,a4,1
    1716:	08c6fb63          	bgeu	a3,a2,17ac <memset+0x17a>
    171a:	00b780a3          	sb	a1,1(a5)
    171e:	0027069b          	addiw	a3,a4,2
    1722:	08c6f563          	bgeu	a3,a2,17ac <memset+0x17a>
    1726:	00b78123          	sb	a1,2(a5)
    172a:	0037069b          	addiw	a3,a4,3
    172e:	06c6ff63          	bgeu	a3,a2,17ac <memset+0x17a>
    1732:	00b781a3          	sb	a1,3(a5)
    1736:	0047069b          	addiw	a3,a4,4
    173a:	06c6f963          	bgeu	a3,a2,17ac <memset+0x17a>
    173e:	00b78223          	sb	a1,4(a5)
    1742:	0057069b          	addiw	a3,a4,5
    1746:	06c6f363          	bgeu	a3,a2,17ac <memset+0x17a>
    174a:	00b782a3          	sb	a1,5(a5)
    174e:	0067069b          	addiw	a3,a4,6
    1752:	04c6fd63          	bgeu	a3,a2,17ac <memset+0x17a>
    1756:	00b78323          	sb	a1,6(a5)
    175a:	0077069b          	addiw	a3,a4,7
    175e:	04c6f763          	bgeu	a3,a2,17ac <memset+0x17a>
    1762:	00b783a3          	sb	a1,7(a5)
    1766:	0087069b          	addiw	a3,a4,8
    176a:	04c6f163          	bgeu	a3,a2,17ac <memset+0x17a>
    176e:	00b78423          	sb	a1,8(a5)
    1772:	0097069b          	addiw	a3,a4,9
    1776:	02c6fb63          	bgeu	a3,a2,17ac <memset+0x17a>
    177a:	00b784a3          	sb	a1,9(a5)
    177e:	00a7069b          	addiw	a3,a4,10
    1782:	02c6f563          	bgeu	a3,a2,17ac <memset+0x17a>
    1786:	00b78523          	sb	a1,10(a5)
    178a:	00b7069b          	addiw	a3,a4,11
    178e:	00c6ff63          	bgeu	a3,a2,17ac <memset+0x17a>
    1792:	00b785a3          	sb	a1,11(a5)
    1796:	00c7069b          	addiw	a3,a4,12
    179a:	00c6f963          	bgeu	a3,a2,17ac <memset+0x17a>
    179e:	00b78623          	sb	a1,12(a5)
    17a2:	2735                	addiw	a4,a4,13
    17a4:	00c77463          	bgeu	a4,a2,17ac <memset+0x17a>
    17a8:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17ac:	8082                	ret
    17ae:	472d                	li	a4,11
    17b0:	bd79                	j	164e <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17b2:	4f0d                	li	t5,3
    17b4:	b701                	j	16b4 <memset+0x82>
    17b6:	8082                	ret
    17b8:	4f05                	li	t5,1
    17ba:	bded                	j	16b4 <memset+0x82>
    17bc:	8eaa                	mv	t4,a0
    17be:	4f01                	li	t5,0
    17c0:	bdd5                	j	16b4 <memset+0x82>
    17c2:	87aa                	mv	a5,a0
    17c4:	4701                	li	a4,0
    17c6:	b7a1                	j	170e <memset+0xdc>
    17c8:	4f09                	li	t5,2
    17ca:	b5ed                	j	16b4 <memset+0x82>
    17cc:	4f11                	li	t5,4
    17ce:	b5dd                	j	16b4 <memset+0x82>
    17d0:	4f15                	li	t5,5
    17d2:	b5cd                	j	16b4 <memset+0x82>
    17d4:	4f19                	li	t5,6
    17d6:	bdf9                	j	16b4 <memset+0x82>

00000000000017d8 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17d8:	00054783          	lbu	a5,0(a0)
    17dc:	0005c703          	lbu	a4,0(a1)
    17e0:	00e79863          	bne	a5,a4,17f0 <strcmp+0x18>
    17e4:	0505                	addi	a0,a0,1
    17e6:	0585                	addi	a1,a1,1
    17e8:	fbe5                	bnez	a5,17d8 <strcmp>
    17ea:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17ec:	9d19                	subw	a0,a0,a4
    17ee:	8082                	ret
    17f0:	0007851b          	sext.w	a0,a5
    17f4:	bfe5                	j	17ec <strcmp+0x14>

00000000000017f6 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17f6:	ce05                	beqz	a2,182e <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17f8:	00054703          	lbu	a4,0(a0)
    17fc:	0005c783          	lbu	a5,0(a1)
    1800:	cb0d                	beqz	a4,1832 <strncmp+0x3c>
    if (!n--)
    1802:	167d                	addi	a2,a2,-1
    1804:	00c506b3          	add	a3,a0,a2
    1808:	a819                	j	181e <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    180a:	00a68e63          	beq	a3,a0,1826 <strncmp+0x30>
    180e:	0505                	addi	a0,a0,1
    1810:	00e79b63          	bne	a5,a4,1826 <strncmp+0x30>
    1814:	00054703          	lbu	a4,0(a0)
    1818:	0005c783          	lbu	a5,0(a1)
    181c:	cb19                	beqz	a4,1832 <strncmp+0x3c>
    181e:	0005c783          	lbu	a5,0(a1)
    1822:	0585                	addi	a1,a1,1
    1824:	f3fd                	bnez	a5,180a <strncmp+0x14>
        ;
    return *l - *r;
    1826:	0007051b          	sext.w	a0,a4
    182a:	9d1d                	subw	a0,a0,a5
    182c:	8082                	ret
        return 0;
    182e:	4501                	li	a0,0
}
    1830:	8082                	ret
    1832:	4501                	li	a0,0
    return *l - *r;
    1834:	9d1d                	subw	a0,a0,a5
    1836:	8082                	ret

0000000000001838 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1838:	00757793          	andi	a5,a0,7
    183c:	cf89                	beqz	a5,1856 <strlen+0x1e>
    183e:	87aa                	mv	a5,a0
    1840:	a029                	j	184a <strlen+0x12>
    1842:	0785                	addi	a5,a5,1
    1844:	0077f713          	andi	a4,a5,7
    1848:	cb01                	beqz	a4,1858 <strlen+0x20>
        if (!*s)
    184a:	0007c703          	lbu	a4,0(a5)
    184e:	fb75                	bnez	a4,1842 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1850:	40a78533          	sub	a0,a5,a0
}
    1854:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1856:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1858:	6394                	ld	a3,0(a5)
    185a:	00000597          	auipc	a1,0x0
    185e:	6965b583          	ld	a1,1686(a1) # 1ef0 <__clone+0x9c>
    1862:	00000617          	auipc	a2,0x0
    1866:	69663603          	ld	a2,1686(a2) # 1ef8 <__clone+0xa4>
    186a:	a019                	j	1870 <strlen+0x38>
    186c:	6794                	ld	a3,8(a5)
    186e:	07a1                	addi	a5,a5,8
    1870:	00b68733          	add	a4,a3,a1
    1874:	fff6c693          	not	a3,a3
    1878:	8f75                	and	a4,a4,a3
    187a:	8f71                	and	a4,a4,a2
    187c:	db65                	beqz	a4,186c <strlen+0x34>
    for (; *s; s++)
    187e:	0007c703          	lbu	a4,0(a5)
    1882:	d779                	beqz	a4,1850 <strlen+0x18>
    1884:	0017c703          	lbu	a4,1(a5)
    1888:	0785                	addi	a5,a5,1
    188a:	d379                	beqz	a4,1850 <strlen+0x18>
    188c:	0017c703          	lbu	a4,1(a5)
    1890:	0785                	addi	a5,a5,1
    1892:	fb6d                	bnez	a4,1884 <strlen+0x4c>
    1894:	bf75                	j	1850 <strlen+0x18>

0000000000001896 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1896:	00757713          	andi	a4,a0,7
{
    189a:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    189c:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18a0:	cb19                	beqz	a4,18b6 <memchr+0x20>
    18a2:	ce25                	beqz	a2,191a <memchr+0x84>
    18a4:	0007c703          	lbu	a4,0(a5)
    18a8:	04b70e63          	beq	a4,a1,1904 <memchr+0x6e>
    18ac:	0785                	addi	a5,a5,1
    18ae:	0077f713          	andi	a4,a5,7
    18b2:	167d                	addi	a2,a2,-1
    18b4:	f77d                	bnez	a4,18a2 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18b6:	4501                	li	a0,0
    if (n && *s != c)
    18b8:	c235                	beqz	a2,191c <memchr+0x86>
    18ba:	0007c703          	lbu	a4,0(a5)
    18be:	04b70363          	beq	a4,a1,1904 <memchr+0x6e>
        size_t k = ONES * c;
    18c2:	00000517          	auipc	a0,0x0
    18c6:	63e53503          	ld	a0,1598(a0) # 1f00 <__clone+0xac>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18ca:	471d                	li	a4,7
        size_t k = ONES * c;
    18cc:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18d0:	02c77a63          	bgeu	a4,a2,1904 <memchr+0x6e>
    18d4:	00000897          	auipc	a7,0x0
    18d8:	61c8b883          	ld	a7,1564(a7) # 1ef0 <__clone+0x9c>
    18dc:	00000817          	auipc	a6,0x0
    18e0:	61c83803          	ld	a6,1564(a6) # 1ef8 <__clone+0xa4>
    18e4:	431d                	li	t1,7
    18e6:	a029                	j	18f0 <memchr+0x5a>
    18e8:	1661                	addi	a2,a2,-8
    18ea:	07a1                	addi	a5,a5,8
    18ec:	02c37963          	bgeu	t1,a2,191e <memchr+0x88>
    18f0:	6398                	ld	a4,0(a5)
    18f2:	8f29                	xor	a4,a4,a0
    18f4:	011706b3          	add	a3,a4,a7
    18f8:	fff74713          	not	a4,a4
    18fc:	8f75                	and	a4,a4,a3
    18fe:	01077733          	and	a4,a4,a6
    1902:	d37d                	beqz	a4,18e8 <memchr+0x52>
    1904:	853e                	mv	a0,a5
    1906:	97b2                	add	a5,a5,a2
    1908:	a021                	j	1910 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    190a:	0505                	addi	a0,a0,1
    190c:	00f50763          	beq	a0,a5,191a <memchr+0x84>
    1910:	00054703          	lbu	a4,0(a0)
    1914:	feb71be3          	bne	a4,a1,190a <memchr+0x74>
    1918:	8082                	ret
    return n ? (void *)s : 0;
    191a:	4501                	li	a0,0
}
    191c:	8082                	ret
    return n ? (void *)s : 0;
    191e:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1920:	f275                	bnez	a2,1904 <memchr+0x6e>
}
    1922:	8082                	ret

0000000000001924 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1924:	1101                	addi	sp,sp,-32
    1926:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1928:	862e                	mv	a2,a1
{
    192a:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    192c:	4581                	li	a1,0
{
    192e:	e426                	sd	s1,8(sp)
    1930:	ec06                	sd	ra,24(sp)
    1932:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1934:	f63ff0ef          	jal	ra,1896 <memchr>
    return p ? p - s : n;
    1938:	c519                	beqz	a0,1946 <strnlen+0x22>
}
    193a:	60e2                	ld	ra,24(sp)
    193c:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    193e:	8d05                	sub	a0,a0,s1
}
    1940:	64a2                	ld	s1,8(sp)
    1942:	6105                	addi	sp,sp,32
    1944:	8082                	ret
    1946:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1948:	8522                	mv	a0,s0
}
    194a:	6442                	ld	s0,16(sp)
    194c:	64a2                	ld	s1,8(sp)
    194e:	6105                	addi	sp,sp,32
    1950:	8082                	ret

0000000000001952 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1952:	00b547b3          	xor	a5,a0,a1
    1956:	8b9d                	andi	a5,a5,7
    1958:	eb95                	bnez	a5,198c <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    195a:	0075f793          	andi	a5,a1,7
    195e:	e7b1                	bnez	a5,19aa <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1960:	6198                	ld	a4,0(a1)
    1962:	00000617          	auipc	a2,0x0
    1966:	58e63603          	ld	a2,1422(a2) # 1ef0 <__clone+0x9c>
    196a:	00000817          	auipc	a6,0x0
    196e:	58e83803          	ld	a6,1422(a6) # 1ef8 <__clone+0xa4>
    1972:	a029                	j	197c <strcpy+0x2a>
    1974:	e118                	sd	a4,0(a0)
    1976:	6598                	ld	a4,8(a1)
    1978:	05a1                	addi	a1,a1,8
    197a:	0521                	addi	a0,a0,8
    197c:	00c707b3          	add	a5,a4,a2
    1980:	fff74693          	not	a3,a4
    1984:	8ff5                	and	a5,a5,a3
    1986:	0107f7b3          	and	a5,a5,a6
    198a:	d7ed                	beqz	a5,1974 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    198c:	0005c783          	lbu	a5,0(a1)
    1990:	00f50023          	sb	a5,0(a0)
    1994:	c785                	beqz	a5,19bc <strcpy+0x6a>
    1996:	0015c783          	lbu	a5,1(a1)
    199a:	0505                	addi	a0,a0,1
    199c:	0585                	addi	a1,a1,1
    199e:	00f50023          	sb	a5,0(a0)
    19a2:	fbf5                	bnez	a5,1996 <strcpy+0x44>
        ;
    return d;
}
    19a4:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19a6:	0505                	addi	a0,a0,1
    19a8:	df45                	beqz	a4,1960 <strcpy+0xe>
            if (!(*d = *s))
    19aa:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19ae:	0585                	addi	a1,a1,1
    19b0:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    19b4:	00f50023          	sb	a5,0(a0)
    19b8:	f7fd                	bnez	a5,19a6 <strcpy+0x54>
}
    19ba:	8082                	ret
    19bc:	8082                	ret

00000000000019be <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19be:	00b547b3          	xor	a5,a0,a1
    19c2:	8b9d                	andi	a5,a5,7
    19c4:	1a079863          	bnez	a5,1b74 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19c8:	0075f793          	andi	a5,a1,7
    19cc:	16078463          	beqz	a5,1b34 <strncpy+0x176>
    19d0:	ea01                	bnez	a2,19e0 <strncpy+0x22>
    19d2:	a421                	j	1bda <strncpy+0x21c>
    19d4:	167d                	addi	a2,a2,-1
    19d6:	0505                	addi	a0,a0,1
    19d8:	14070e63          	beqz	a4,1b34 <strncpy+0x176>
    19dc:	1a060863          	beqz	a2,1b8c <strncpy+0x1ce>
    19e0:	0005c783          	lbu	a5,0(a1)
    19e4:	0585                	addi	a1,a1,1
    19e6:	0075f713          	andi	a4,a1,7
    19ea:	00f50023          	sb	a5,0(a0)
    19ee:	f3fd                	bnez	a5,19d4 <strncpy+0x16>
    19f0:	4805                	li	a6,1
    19f2:	1a061863          	bnez	a2,1ba2 <strncpy+0x1e4>
    19f6:	40a007b3          	neg	a5,a0
    19fa:	8b9d                	andi	a5,a5,7
    19fc:	4681                	li	a3,0
    19fe:	18061a63          	bnez	a2,1b92 <strncpy+0x1d4>
    1a02:	00778713          	addi	a4,a5,7
    1a06:	45ad                	li	a1,11
    1a08:	18b76363          	bltu	a4,a1,1b8e <strncpy+0x1d0>
    1a0c:	1ae6eb63          	bltu	a3,a4,1bc2 <strncpy+0x204>
    1a10:	1a078363          	beqz	a5,1bb6 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a14:	00050023          	sb	zero,0(a0)
    1a18:	4685                	li	a3,1
    1a1a:	00150713          	addi	a4,a0,1
    1a1e:	18d78f63          	beq	a5,a3,1bbc <strncpy+0x1fe>
    1a22:	000500a3          	sb	zero,1(a0)
    1a26:	4689                	li	a3,2
    1a28:	00250713          	addi	a4,a0,2
    1a2c:	18d78e63          	beq	a5,a3,1bc8 <strncpy+0x20a>
    1a30:	00050123          	sb	zero,2(a0)
    1a34:	468d                	li	a3,3
    1a36:	00350713          	addi	a4,a0,3
    1a3a:	16d78c63          	beq	a5,a3,1bb2 <strncpy+0x1f4>
    1a3e:	000501a3          	sb	zero,3(a0)
    1a42:	4691                	li	a3,4
    1a44:	00450713          	addi	a4,a0,4
    1a48:	18d78263          	beq	a5,a3,1bcc <strncpy+0x20e>
    1a4c:	00050223          	sb	zero,4(a0)
    1a50:	4695                	li	a3,5
    1a52:	00550713          	addi	a4,a0,5
    1a56:	16d78d63          	beq	a5,a3,1bd0 <strncpy+0x212>
    1a5a:	000502a3          	sb	zero,5(a0)
    1a5e:	469d                	li	a3,7
    1a60:	00650713          	addi	a4,a0,6
    1a64:	16d79863          	bne	a5,a3,1bd4 <strncpy+0x216>
    1a68:	00750713          	addi	a4,a0,7
    1a6c:	00050323          	sb	zero,6(a0)
    1a70:	40f80833          	sub	a6,a6,a5
    1a74:	ff887593          	andi	a1,a6,-8
    1a78:	97aa                	add	a5,a5,a0
    1a7a:	95be                	add	a1,a1,a5
    1a7c:	0007b023          	sd	zero,0(a5)
    1a80:	07a1                	addi	a5,a5,8
    1a82:	feb79de3          	bne	a5,a1,1a7c <strncpy+0xbe>
    1a86:	ff887593          	andi	a1,a6,-8
    1a8a:	9ead                	addw	a3,a3,a1
    1a8c:	00b707b3          	add	a5,a4,a1
    1a90:	12b80863          	beq	a6,a1,1bc0 <strncpy+0x202>
    1a94:	00078023          	sb	zero,0(a5)
    1a98:	0016871b          	addiw	a4,a3,1
    1a9c:	0ec77863          	bgeu	a4,a2,1b8c <strncpy+0x1ce>
    1aa0:	000780a3          	sb	zero,1(a5)
    1aa4:	0026871b          	addiw	a4,a3,2
    1aa8:	0ec77263          	bgeu	a4,a2,1b8c <strncpy+0x1ce>
    1aac:	00078123          	sb	zero,2(a5)
    1ab0:	0036871b          	addiw	a4,a3,3
    1ab4:	0cc77c63          	bgeu	a4,a2,1b8c <strncpy+0x1ce>
    1ab8:	000781a3          	sb	zero,3(a5)
    1abc:	0046871b          	addiw	a4,a3,4
    1ac0:	0cc77663          	bgeu	a4,a2,1b8c <strncpy+0x1ce>
    1ac4:	00078223          	sb	zero,4(a5)
    1ac8:	0056871b          	addiw	a4,a3,5
    1acc:	0cc77063          	bgeu	a4,a2,1b8c <strncpy+0x1ce>
    1ad0:	000782a3          	sb	zero,5(a5)
    1ad4:	0066871b          	addiw	a4,a3,6
    1ad8:	0ac77a63          	bgeu	a4,a2,1b8c <strncpy+0x1ce>
    1adc:	00078323          	sb	zero,6(a5)
    1ae0:	0076871b          	addiw	a4,a3,7
    1ae4:	0ac77463          	bgeu	a4,a2,1b8c <strncpy+0x1ce>
    1ae8:	000783a3          	sb	zero,7(a5)
    1aec:	0086871b          	addiw	a4,a3,8
    1af0:	08c77e63          	bgeu	a4,a2,1b8c <strncpy+0x1ce>
    1af4:	00078423          	sb	zero,8(a5)
    1af8:	0096871b          	addiw	a4,a3,9
    1afc:	08c77863          	bgeu	a4,a2,1b8c <strncpy+0x1ce>
    1b00:	000784a3          	sb	zero,9(a5)
    1b04:	00a6871b          	addiw	a4,a3,10
    1b08:	08c77263          	bgeu	a4,a2,1b8c <strncpy+0x1ce>
    1b0c:	00078523          	sb	zero,10(a5)
    1b10:	00b6871b          	addiw	a4,a3,11
    1b14:	06c77c63          	bgeu	a4,a2,1b8c <strncpy+0x1ce>
    1b18:	000785a3          	sb	zero,11(a5)
    1b1c:	00c6871b          	addiw	a4,a3,12
    1b20:	06c77663          	bgeu	a4,a2,1b8c <strncpy+0x1ce>
    1b24:	00078623          	sb	zero,12(a5)
    1b28:	26b5                	addiw	a3,a3,13
    1b2a:	06c6f163          	bgeu	a3,a2,1b8c <strncpy+0x1ce>
    1b2e:	000786a3          	sb	zero,13(a5)
    1b32:	8082                	ret
            ;
        if (!n || !*s)
    1b34:	c645                	beqz	a2,1bdc <strncpy+0x21e>
    1b36:	0005c783          	lbu	a5,0(a1)
    1b3a:	ea078be3          	beqz	a5,19f0 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b3e:	479d                	li	a5,7
    1b40:	02c7ff63          	bgeu	a5,a2,1b7e <strncpy+0x1c0>
    1b44:	00000897          	auipc	a7,0x0
    1b48:	3ac8b883          	ld	a7,940(a7) # 1ef0 <__clone+0x9c>
    1b4c:	00000817          	auipc	a6,0x0
    1b50:	3ac83803          	ld	a6,940(a6) # 1ef8 <__clone+0xa4>
    1b54:	431d                	li	t1,7
    1b56:	6198                	ld	a4,0(a1)
    1b58:	011707b3          	add	a5,a4,a7
    1b5c:	fff74693          	not	a3,a4
    1b60:	8ff5                	and	a5,a5,a3
    1b62:	0107f7b3          	and	a5,a5,a6
    1b66:	ef81                	bnez	a5,1b7e <strncpy+0x1c0>
            *wd = *ws;
    1b68:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b6a:	1661                	addi	a2,a2,-8
    1b6c:	05a1                	addi	a1,a1,8
    1b6e:	0521                	addi	a0,a0,8
    1b70:	fec363e3          	bltu	t1,a2,1b56 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b74:	e609                	bnez	a2,1b7e <strncpy+0x1c0>
    1b76:	a08d                	j	1bd8 <strncpy+0x21a>
    1b78:	167d                	addi	a2,a2,-1
    1b7a:	0505                	addi	a0,a0,1
    1b7c:	ca01                	beqz	a2,1b8c <strncpy+0x1ce>
    1b7e:	0005c783          	lbu	a5,0(a1)
    1b82:	0585                	addi	a1,a1,1
    1b84:	00f50023          	sb	a5,0(a0)
    1b88:	fbe5                	bnez	a5,1b78 <strncpy+0x1ba>
        ;
tail:
    1b8a:	b59d                	j	19f0 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1b8c:	8082                	ret
    1b8e:	472d                	li	a4,11
    1b90:	bdb5                	j	1a0c <strncpy+0x4e>
    1b92:	00778713          	addi	a4,a5,7
    1b96:	45ad                	li	a1,11
    1b98:	fff60693          	addi	a3,a2,-1
    1b9c:	e6b778e3          	bgeu	a4,a1,1a0c <strncpy+0x4e>
    1ba0:	b7fd                	j	1b8e <strncpy+0x1d0>
    1ba2:	40a007b3          	neg	a5,a0
    1ba6:	8832                	mv	a6,a2
    1ba8:	8b9d                	andi	a5,a5,7
    1baa:	4681                	li	a3,0
    1bac:	e4060be3          	beqz	a2,1a02 <strncpy+0x44>
    1bb0:	b7cd                	j	1b92 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bb2:	468d                	li	a3,3
    1bb4:	bd75                	j	1a70 <strncpy+0xb2>
    1bb6:	872a                	mv	a4,a0
    1bb8:	4681                	li	a3,0
    1bba:	bd5d                	j	1a70 <strncpy+0xb2>
    1bbc:	4685                	li	a3,1
    1bbe:	bd4d                	j	1a70 <strncpy+0xb2>
    1bc0:	8082                	ret
    1bc2:	87aa                	mv	a5,a0
    1bc4:	4681                	li	a3,0
    1bc6:	b5f9                	j	1a94 <strncpy+0xd6>
    1bc8:	4689                	li	a3,2
    1bca:	b55d                	j	1a70 <strncpy+0xb2>
    1bcc:	4691                	li	a3,4
    1bce:	b54d                	j	1a70 <strncpy+0xb2>
    1bd0:	4695                	li	a3,5
    1bd2:	bd79                	j	1a70 <strncpy+0xb2>
    1bd4:	4699                	li	a3,6
    1bd6:	bd69                	j	1a70 <strncpy+0xb2>
    1bd8:	8082                	ret
    1bda:	8082                	ret
    1bdc:	8082                	ret

0000000000001bde <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1bde:	87aa                	mv	a5,a0
    1be0:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1be2:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1be6:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1bea:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1bec:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bee:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1bf2:	2501                	sext.w	a0,a0
    1bf4:	8082                	ret

0000000000001bf6 <openat>:
    register long a7 __asm__("a7") = n;
    1bf6:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1bfa:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bfe:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c02:	2501                	sext.w	a0,a0
    1c04:	8082                	ret

0000000000001c06 <close>:
    register long a7 __asm__("a7") = n;
    1c06:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c0a:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c0e:	2501                	sext.w	a0,a0
    1c10:	8082                	ret

0000000000001c12 <read>:
    register long a7 __asm__("a7") = n;
    1c12:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c16:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c1a:	8082                	ret

0000000000001c1c <write>:
    register long a7 __asm__("a7") = n;
    1c1c:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c20:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c24:	8082                	ret

0000000000001c26 <getpid>:
    register long a7 __asm__("a7") = n;
    1c26:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c2a:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c2e:	2501                	sext.w	a0,a0
    1c30:	8082                	ret

0000000000001c32 <getppid>:
    register long a7 __asm__("a7") = n;
    1c32:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c36:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c3a:	2501                	sext.w	a0,a0
    1c3c:	8082                	ret

0000000000001c3e <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c3e:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c42:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c46:	2501                	sext.w	a0,a0
    1c48:	8082                	ret

0000000000001c4a <fork>:
    register long a7 __asm__("a7") = n;
    1c4a:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c4e:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c50:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c52:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c56:	2501                	sext.w	a0,a0
    1c58:	8082                	ret

0000000000001c5a <clone>:
// 子进程执行的执行的函数指针 | 函数参数 | 栈地址 | 栈的大小 | 标志位
pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c5a:	85b2                	mv	a1,a2
    1c5c:	863a                	mv	a2,a4
    if (stack)
    1c5e:	c191                	beqz	a1,1c62 <clone+0x8>
	stack += stack_size;
    1c60:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c62:	4781                	li	a5,0
    1c64:	4701                	li	a4,0
    1c66:	4681                	li	a3,0
    1c68:	2601                	sext.w	a2,a2
    1c6a:	a2ed                	j	1e54 <__clone>

0000000000001c6c <exit>:
    register long a7 __asm__("a7") = n;
    1c6c:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c70:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c74:	8082                	ret

0000000000001c76 <waitpid>:
    register long a7 __asm__("a7") = n;
    1c76:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c7a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c7c:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c80:	2501                	sext.w	a0,a0
    1c82:	8082                	ret

0000000000001c84 <exec>:
    register long a7 __asm__("a7") = n;
    1c84:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1c88:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1c8c:	2501                	sext.w	a0,a0
    1c8e:	8082                	ret

0000000000001c90 <execve>:
    register long a7 __asm__("a7") = n;
    1c90:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c94:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1c98:	2501                	sext.w	a0,a0
    1c9a:	8082                	ret

0000000000001c9c <times>:
    register long a7 __asm__("a7") = n;
    1c9c:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1ca0:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1ca4:	2501                	sext.w	a0,a0
    1ca6:	8082                	ret

0000000000001ca8 <get_time>:

int64 get_time()
{
    1ca8:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1caa:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cae:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cb0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cb2:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cb6:	2501                	sext.w	a0,a0
    1cb8:	ed09                	bnez	a0,1cd2 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cba:	67a2                	ld	a5,8(sp)
    1cbc:	3e800713          	li	a4,1000
    1cc0:	00015503          	lhu	a0,0(sp)
    1cc4:	02e7d7b3          	divu	a5,a5,a4
    1cc8:	02e50533          	mul	a0,a0,a4
    1ccc:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1cce:	0141                	addi	sp,sp,16
    1cd0:	8082                	ret
        return -1;
    1cd2:	557d                	li	a0,-1
    1cd4:	bfed                	j	1cce <get_time+0x26>

0000000000001cd6 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1cd6:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cda:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1cde:	2501                	sext.w	a0,a0
    1ce0:	8082                	ret

0000000000001ce2 <time>:
    register long a7 __asm__("a7") = n;
    1ce2:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1ce6:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1cea:	2501                	sext.w	a0,a0
    1cec:	8082                	ret

0000000000001cee <sleep>:

int sleep(unsigned long long time)
{
    1cee:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1cf0:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1cf2:	850a                	mv	a0,sp
    1cf4:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1cf6:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1cfa:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cfc:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d00:	e501                	bnez	a0,1d08 <sleep+0x1a>
    return 0;
    1d02:	4501                	li	a0,0
}
    1d04:	0141                	addi	sp,sp,16
    1d06:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d08:	4502                	lw	a0,0(sp)
}
    1d0a:	0141                	addi	sp,sp,16
    1d0c:	8082                	ret

0000000000001d0e <set_priority>:
    register long a7 __asm__("a7") = n;
    1d0e:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d12:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d16:	2501                	sext.w	a0,a0
    1d18:	8082                	ret

0000000000001d1a <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d1a:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d1e:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d22:	8082                	ret

0000000000001d24 <munmap>:
    register long a7 __asm__("a7") = n;
    1d24:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d28:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d2c:	2501                	sext.w	a0,a0
    1d2e:	8082                	ret

0000000000001d30 <wait>:

int wait(int *code)
{
    1d30:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d32:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d36:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d38:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d3a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d3c:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d40:	2501                	sext.w	a0,a0
    1d42:	8082                	ret

0000000000001d44 <spawn>:
    register long a7 __asm__("a7") = n;
    1d44:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d48:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d4c:	2501                	sext.w	a0,a0
    1d4e:	8082                	ret

0000000000001d50 <mailread>:
    register long a7 __asm__("a7") = n;
    1d50:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d54:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d58:	2501                	sext.w	a0,a0
    1d5a:	8082                	ret

0000000000001d5c <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d5c:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d60:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d64:	2501                	sext.w	a0,a0
    1d66:	8082                	ret

0000000000001d68 <fstat>:
    register long a7 __asm__("a7") = n;
    1d68:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d6c:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d70:	2501                	sext.w	a0,a0
    1d72:	8082                	ret

0000000000001d74 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d74:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d76:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d7a:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d7c:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d80:	2501                	sext.w	a0,a0
    1d82:	8082                	ret

0000000000001d84 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1d84:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d86:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1d8a:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d8c:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1d90:	2501                	sext.w	a0,a0
    1d92:	8082                	ret

0000000000001d94 <link>:

int link(char *old_path, char *new_path)
{
    1d94:	87aa                	mv	a5,a0
    1d96:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1d98:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1d9c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1da0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1da2:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1da6:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1da8:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1dac:	2501                	sext.w	a0,a0
    1dae:	8082                	ret

0000000000001db0 <unlink>:

int unlink(char *path)
{
    1db0:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1db2:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1db6:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1dba:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dbc:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1dc0:	2501                	sext.w	a0,a0
    1dc2:	8082                	ret

0000000000001dc4 <uname>:
    register long a7 __asm__("a7") = n;
    1dc4:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1dc8:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1dcc:	2501                	sext.w	a0,a0
    1dce:	8082                	ret

0000000000001dd0 <brk>:
    register long a7 __asm__("a7") = n;
    1dd0:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1dd4:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1dd8:	2501                	sext.w	a0,a0
    1dda:	8082                	ret

0000000000001ddc <getcwd>:
    register long a7 __asm__("a7") = n;
    1ddc:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dde:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1de2:	8082                	ret

0000000000001de4 <chdir>:
    register long a7 __asm__("a7") = n;
    1de4:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1de8:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1dec:	2501                	sext.w	a0,a0
    1dee:	8082                	ret

0000000000001df0 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1df0:	862e                	mv	a2,a1
    1df2:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1df4:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1df6:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1dfa:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dfe:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e00:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e02:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <getdents>:
    register long a7 __asm__("a7") = n;
    1e0a:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e0e:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e12:	2501                	sext.w	a0,a0
    1e14:	8082                	ret

0000000000001e16 <pipe>:
    register long a7 __asm__("a7") = n;
    1e16:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e1a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e1c:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e20:	2501                	sext.w	a0,a0
    1e22:	8082                	ret

0000000000001e24 <dup>:
    register long a7 __asm__("a7") = n;
    1e24:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e26:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	8082                	ret

0000000000001e2e <dup2>:
    register long a7 __asm__("a7") = n;
    1e2e:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e30:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e32:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e36:	2501                	sext.w	a0,a0
    1e38:	8082                	ret

0000000000001e3a <mount>:
    register long a7 __asm__("a7") = n;
    1e3a:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e3e:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e42:	2501                	sext.w	a0,a0
    1e44:	8082                	ret

0000000000001e46 <umount>:
    register long a7 __asm__("a7") = n;
    1e46:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e4a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e4c:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e50:	2501                	sext.w	a0,a0
    1e52:	8082                	ret

0000000000001e54 <__clone>:
.global __clone
.type  __clone, %function
# 函数指针 | 栈地址 | 标志位
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e54:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e56:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e58:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e5a:	8532                	mv	a0,a2
	mv a2, a4
    1e5c:	863a                	mv	a2,a4
	mv a3, a5
    1e5e:	86be                	mv	a3,a5
	mv a4, a6
    1e60:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e62:	0dc00893          	li	a7,220
	ecall
    1e66:	00000073          	ecall

	beqz a0, 1f
    1e6a:	c111                	beqz	a0,1e6e <__clone+0x1a>
	# Parent
	ret
    1e6c:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e6e:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e70:	6522                	ld	a0,8(sp)
	jalr a1
    1e72:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e74:	05d00893          	li	a7,93
	ecall
    1e78:	00000073          	ecall
