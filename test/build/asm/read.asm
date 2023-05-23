
/home/lmq/lmq/cscc/xv6-k210/test/build/riscv64/read:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a07d                	j	10b0 <__start_main>

0000000000001004 <test_read>:
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

void test_read() {
    1004:	712d                	addi	sp,sp,-288
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	e7a50513          	addi	a0,a0,-390 # 1e80 <__clone+0x2e>
void test_read() {
    100e:	ee06                	sd	ra,280(sp)
    1010:	ea22                	sd	s0,272(sp)
	TEST_START(__func__);
    1012:	29c000ef          	jal	ra,12ae <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	ef250513          	addi	a0,a0,-270 # 1f08 <__func__.1165>
    101e:	290000ef          	jal	ra,12ae <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	e7650513          	addi	a0,a0,-394 # 1e98 <__clone+0x46>
    102a:	284000ef          	jal	ra,12ae <puts>
	int fd = open("./text.txt", 0);
    102e:	4581                	li	a1,0
    1030:	00001517          	auipc	a0,0x1
    1034:	e7850513          	addi	a0,a0,-392 # 1ea8 <__clone+0x56>
    1038:	3a5000ef          	jal	ra,1bdc <open>
	char buf[256];
	int size = read(fd, buf, 256);
    103c:	10000613          	li	a2,256
    1040:	080c                	addi	a1,sp,16
	int fd = open("./text.txt", 0);
    1042:	842a                	mv	s0,a0
	int size = read(fd, buf, 256);
    1044:	3cd000ef          	jal	ra,1c10 <read>
	assert(size >= 0);
    1048:	02051793          	slli	a5,a0,0x20
	int size = read(fd, buf, 256);
    104c:	0005061b          	sext.w	a2,a0
	assert(size >= 0);
    1050:	0207cf63          	bltz	a5,108e <test_read+0x8a>

	write(STDOUT, buf, size);
    1054:	080c                	addi	a1,sp,16
    1056:	4505                	li	a0,1
    1058:	3c3000ef          	jal	ra,1c1a <write>
	close(fd);
    105c:	8522                	mv	a0,s0
    105e:	3a7000ef          	jal	ra,1c04 <close>
	TEST_END(__func__);
    1062:	00001517          	auipc	a0,0x1
    1066:	e7650513          	addi	a0,a0,-394 # 1ed8 <__clone+0x86>
    106a:	244000ef          	jal	ra,12ae <puts>
    106e:	00001517          	auipc	a0,0x1
    1072:	e9a50513          	addi	a0,a0,-358 # 1f08 <__func__.1165>
    1076:	238000ef          	jal	ra,12ae <puts>
    107a:	00001517          	auipc	a0,0x1
    107e:	e1e50513          	addi	a0,a0,-482 # 1e98 <__clone+0x46>
    1082:	22c000ef          	jal	ra,12ae <puts>
}
    1086:	60f2                	ld	ra,280(sp)
    1088:	6452                	ld	s0,272(sp)
    108a:	6115                	addi	sp,sp,288
    108c:	8082                	ret
	assert(size >= 0);
    108e:	00001517          	auipc	a0,0x1
    1092:	e2a50513          	addi	a0,a0,-470 # 1eb8 <__clone+0x66>
    1096:	e432                	sd	a2,8(sp)
    1098:	4c0000ef          	jal	ra,1558 <panic>
    109c:	6622                	ld	a2,8(sp)
    109e:	bf5d                	j	1054 <test_read+0x50>

00000000000010a0 <main>:

int main(void) {
    10a0:	1141                	addi	sp,sp,-16
    10a2:	e406                	sd	ra,8(sp)
	test_read();
    10a4:	f61ff0ef          	jal	ra,1004 <test_read>
	return 0;
}
    10a8:	60a2                	ld	ra,8(sp)
    10aa:	4501                	li	a0,0
    10ac:	0141                	addi	sp,sp,16
    10ae:	8082                	ret

00000000000010b0 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10b0:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10b2:	4108                	lw	a0,0(a0)
{
    10b4:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10b6:	05a1                	addi	a1,a1,8
{
    10b8:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10ba:	fe7ff0ef          	jal	ra,10a0 <main>
    10be:	3ad000ef          	jal	ra,1c6a <exit>
	return 0;
}
    10c2:	60a2                	ld	ra,8(sp)
    10c4:	4501                	li	a0,0
    10c6:	0141                	addi	sp,sp,16
    10c8:	8082                	ret

00000000000010ca <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10ca:	7179                	addi	sp,sp,-48
    10cc:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10ce:	12054b63          	bltz	a0,1204 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10d2:	02b577bb          	remuw	a5,a0,a1
    10d6:	00001697          	auipc	a3,0x1
    10da:	e4268693          	addi	a3,a3,-446 # 1f18 <digits>
    buf[16] = 0;
    10de:	00010c23          	sb	zero,24(sp)
    i = 15;
    10e2:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    10e6:	1782                	slli	a5,a5,0x20
    10e8:	9381                	srli	a5,a5,0x20
    10ea:	97b6                	add	a5,a5,a3
    10ec:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10f0:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10f4:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10f8:	16b56263          	bltu	a0,a1,125c <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    10fc:	02e8763b          	remuw	a2,a6,a4
    1100:	1602                	slli	a2,a2,0x20
    1102:	9201                	srli	a2,a2,0x20
    1104:	9636                	add	a2,a2,a3
    1106:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    110a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    110e:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1112:	12e86963          	bltu	a6,a4,1244 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    1116:	02e5f63b          	remuw	a2,a1,a4
    111a:	1602                	slli	a2,a2,0x20
    111c:	9201                	srli	a2,a2,0x20
    111e:	9636                	add	a2,a2,a3
    1120:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1124:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1128:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    112c:	10e5ef63          	bltu	a1,a4,124a <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1130:	02e8763b          	remuw	a2,a6,a4
    1134:	1602                	slli	a2,a2,0x20
    1136:	9201                	srli	a2,a2,0x20
    1138:	9636                	add	a2,a2,a3
    113a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    113e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1142:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1146:	10e86563          	bltu	a6,a4,1250 <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    114a:	02e5f63b          	remuw	a2,a1,a4
    114e:	1602                	slli	a2,a2,0x20
    1150:	9201                	srli	a2,a2,0x20
    1152:	9636                	add	a2,a2,a3
    1154:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1158:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    115c:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1160:	0ee5eb63          	bltu	a1,a4,1256 <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    1164:	02e8763b          	remuw	a2,a6,a4
    1168:	1602                	slli	a2,a2,0x20
    116a:	9201                	srli	a2,a2,0x20
    116c:	9636                	add	a2,a2,a3
    116e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1172:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1176:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    117a:	0ce86263          	bltu	a6,a4,123e <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    117e:	02e5f63b          	remuw	a2,a1,a4
    1182:	1602                	slli	a2,a2,0x20
    1184:	9201                	srli	a2,a2,0x20
    1186:	9636                	add	a2,a2,a3
    1188:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    118c:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1190:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1194:	0ce5e663          	bltu	a1,a4,1260 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    1198:	02e8763b          	remuw	a2,a6,a4
    119c:	1602                	slli	a2,a2,0x20
    119e:	9201                	srli	a2,a2,0x20
    11a0:	9636                	add	a2,a2,a3
    11a2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a6:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11aa:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11ae:	0ae86c63          	bltu	a6,a4,1266 <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    11b2:	02e5f63b          	remuw	a2,a1,a4
    11b6:	1602                	slli	a2,a2,0x20
    11b8:	9201                	srli	a2,a2,0x20
    11ba:	9636                	add	a2,a2,a3
    11bc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c0:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11c4:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11c8:	0ae5e263          	bltu	a1,a4,126c <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    11cc:	1782                	slli	a5,a5,0x20
    11ce:	9381                	srli	a5,a5,0x20
    11d0:	97b6                	add	a5,a5,a3
    11d2:	0007c703          	lbu	a4,0(a5)
    11d6:	4599                	li	a1,6
    11d8:	4795                	li	a5,5
    11da:	00e10723          	sb	a4,14(sp)

    if (sign)
    11de:	00055963          	bgez	a0,11f0 <printint.constprop.0+0x126>
        buf[i--] = '-';
    11e2:	1018                	addi	a4,sp,32
    11e4:	973e                	add	a4,a4,a5
    11e6:	02d00693          	li	a3,45
    11ea:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    11ee:	85be                	mv	a1,a5
    write(f, s, l);
    11f0:	003c                	addi	a5,sp,8
    11f2:	4641                	li	a2,16
    11f4:	9e0d                	subw	a2,a2,a1
    11f6:	4505                	li	a0,1
    11f8:	95be                	add	a1,a1,a5
    11fa:	221000ef          	jal	ra,1c1a <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11fe:	70a2                	ld	ra,40(sp)
    1200:	6145                	addi	sp,sp,48
    1202:	8082                	ret
        x = -xx;
    1204:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1208:	02b677bb          	remuw	a5,a2,a1
    120c:	00001697          	auipc	a3,0x1
    1210:	d0c68693          	addi	a3,a3,-756 # 1f18 <digits>
    buf[16] = 0;
    1214:	00010c23          	sb	zero,24(sp)
    i = 15;
    1218:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    121c:	1782                	slli	a5,a5,0x20
    121e:	9381                	srli	a5,a5,0x20
    1220:	97b6                	add	a5,a5,a3
    1222:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1226:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    122a:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    122e:	ecb677e3          	bgeu	a2,a1,10fc <printint.constprop.0+0x32>
        buf[i--] = '-';
    1232:	02d00793          	li	a5,45
    1236:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    123a:	45b9                	li	a1,14
    123c:	bf55                	j	11f0 <printint.constprop.0+0x126>
    123e:	47a5                	li	a5,9
    1240:	45a9                	li	a1,10
    1242:	bf71                	j	11de <printint.constprop.0+0x114>
    1244:	47b5                	li	a5,13
    1246:	45b9                	li	a1,14
    1248:	bf59                	j	11de <printint.constprop.0+0x114>
    124a:	47b1                	li	a5,12
    124c:	45b5                	li	a1,13
    124e:	bf41                	j	11de <printint.constprop.0+0x114>
    1250:	47ad                	li	a5,11
    1252:	45b1                	li	a1,12
    1254:	b769                	j	11de <printint.constprop.0+0x114>
    1256:	47a9                	li	a5,10
    1258:	45ad                	li	a1,11
    125a:	b751                	j	11de <printint.constprop.0+0x114>
    i = 15;
    125c:	45bd                	li	a1,15
    125e:	bf49                	j	11f0 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1260:	47a1                	li	a5,8
    1262:	45a5                	li	a1,9
    1264:	bfad                	j	11de <printint.constprop.0+0x114>
    1266:	479d                	li	a5,7
    1268:	45a1                	li	a1,8
    126a:	bf95                	j	11de <printint.constprop.0+0x114>
    126c:	4799                	li	a5,6
    126e:	459d                	li	a1,7
    1270:	b7bd                	j	11de <printint.constprop.0+0x114>

0000000000001272 <getchar>:
{
    1272:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1274:	00f10593          	addi	a1,sp,15
    1278:	4605                	li	a2,1
    127a:	4501                	li	a0,0
{
    127c:	ec06                	sd	ra,24(sp)
    char byte = 0;
    127e:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1282:	18f000ef          	jal	ra,1c10 <read>
}
    1286:	60e2                	ld	ra,24(sp)
    1288:	00f14503          	lbu	a0,15(sp)
    128c:	6105                	addi	sp,sp,32
    128e:	8082                	ret

0000000000001290 <putchar>:
{
    1290:	1101                	addi	sp,sp,-32
    1292:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1294:	00f10593          	addi	a1,sp,15
    1298:	4605                	li	a2,1
    129a:	4505                	li	a0,1
{
    129c:	ec06                	sd	ra,24(sp)
    char byte = c;
    129e:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12a2:	179000ef          	jal	ra,1c1a <write>
}
    12a6:	60e2                	ld	ra,24(sp)
    12a8:	2501                	sext.w	a0,a0
    12aa:	6105                	addi	sp,sp,32
    12ac:	8082                	ret

00000000000012ae <puts>:
{
    12ae:	1141                	addi	sp,sp,-16
    12b0:	e406                	sd	ra,8(sp)
    12b2:	e022                	sd	s0,0(sp)
    12b4:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12b6:	580000ef          	jal	ra,1836 <strlen>
    12ba:	862a                	mv	a2,a0
    12bc:	85a2                	mv	a1,s0
    12be:	4505                	li	a0,1
    12c0:	15b000ef          	jal	ra,1c1a <write>
}
    12c4:	60a2                	ld	ra,8(sp)
    12c6:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12c8:	957d                	srai	a0,a0,0x3f
    return r;
    12ca:	2501                	sext.w	a0,a0
}
    12cc:	0141                	addi	sp,sp,16
    12ce:	8082                	ret

00000000000012d0 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12d0:	7171                	addi	sp,sp,-176
    12d2:	fc56                	sd	s5,56(sp)
    12d4:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    12d6:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12d8:	18bc                	addi	a5,sp,120
{
    12da:	e8ca                	sd	s2,80(sp)
    12dc:	e4ce                	sd	s3,72(sp)
    12de:	e0d2                	sd	s4,64(sp)
    12e0:	f85a                	sd	s6,48(sp)
    12e2:	f486                	sd	ra,104(sp)
    12e4:	f0a2                	sd	s0,96(sp)
    12e6:	eca6                	sd	s1,88(sp)
    12e8:	fcae                	sd	a1,120(sp)
    12ea:	e132                	sd	a2,128(sp)
    12ec:	e536                	sd	a3,136(sp)
    12ee:	e93a                	sd	a4,144(sp)
    12f0:	f142                	sd	a6,160(sp)
    12f2:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    12f4:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12f6:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    12fa:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    12fe:	00001b17          	auipc	s6,0x1
    1302:	beab0b13          	addi	s6,s6,-1046 # 1ee8 <__clone+0x96>
    buf[i++] = '0';
    1306:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    130a:	00001997          	auipc	s3,0x1
    130e:	c0e98993          	addi	s3,s3,-1010 # 1f18 <digits>
        if (!*s)
    1312:	00054783          	lbu	a5,0(a0)
    1316:	16078a63          	beqz	a5,148a <printf+0x1ba>
    131a:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    131c:	19278163          	beq	a5,s2,149e <printf+0x1ce>
    1320:	00164783          	lbu	a5,1(a2)
    1324:	0605                	addi	a2,a2,1
    1326:	fbfd                	bnez	a5,131c <printf+0x4c>
    1328:	84b2                	mv	s1,a2
        l = z - a;
    132a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    132e:	85aa                	mv	a1,a0
    1330:	8622                	mv	a2,s0
    1332:	4505                	li	a0,1
    1334:	0e7000ef          	jal	ra,1c1a <write>
        if (l)
    1338:	18041c63          	bnez	s0,14d0 <printf+0x200>
        if (s[1] == 0)
    133c:	0014c783          	lbu	a5,1(s1)
    1340:	14078563          	beqz	a5,148a <printf+0x1ba>
        switch (s[1])
    1344:	1d478063          	beq	a5,s4,1504 <printf+0x234>
    1348:	18fa6663          	bltu	s4,a5,14d4 <printf+0x204>
    134c:	06400713          	li	a4,100
    1350:	1ae78063          	beq	a5,a4,14f0 <printf+0x220>
    1354:	07000713          	li	a4,112
    1358:	1ce79963          	bne	a5,a4,152a <printf+0x25a>
            printptr(va_arg(ap, uint64));
    135c:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    135e:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1362:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1364:	631c                	ld	a5,0(a4)
    1366:	0721                	addi	a4,a4,8
    1368:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    136a:	00479293          	slli	t0,a5,0x4
    136e:	00879f93          	slli	t6,a5,0x8
    1372:	00c79f13          	slli	t5,a5,0xc
    1376:	01079e93          	slli	t4,a5,0x10
    137a:	01479e13          	slli	t3,a5,0x14
    137e:	01879313          	slli	t1,a5,0x18
    1382:	01c79893          	slli	a7,a5,0x1c
    1386:	02479813          	slli	a6,a5,0x24
    138a:	02879513          	slli	a0,a5,0x28
    138e:	02c79593          	slli	a1,a5,0x2c
    1392:	03079693          	slli	a3,a5,0x30
    1396:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    139a:	03c7d413          	srli	s0,a5,0x3c
    139e:	01c7d39b          	srliw	t2,a5,0x1c
    13a2:	03c2d293          	srli	t0,t0,0x3c
    13a6:	03cfdf93          	srli	t6,t6,0x3c
    13aa:	03cf5f13          	srli	t5,t5,0x3c
    13ae:	03cede93          	srli	t4,t4,0x3c
    13b2:	03ce5e13          	srli	t3,t3,0x3c
    13b6:	03c35313          	srli	t1,t1,0x3c
    13ba:	03c8d893          	srli	a7,a7,0x3c
    13be:	03c85813          	srli	a6,a6,0x3c
    13c2:	9171                	srli	a0,a0,0x3c
    13c4:	91f1                	srli	a1,a1,0x3c
    13c6:	92f1                	srli	a3,a3,0x3c
    13c8:	9371                	srli	a4,a4,0x3c
    13ca:	96ce                	add	a3,a3,s3
    13cc:	974e                	add	a4,a4,s3
    13ce:	944e                	add	s0,s0,s3
    13d0:	92ce                	add	t0,t0,s3
    13d2:	9fce                	add	t6,t6,s3
    13d4:	9f4e                	add	t5,t5,s3
    13d6:	9ece                	add	t4,t4,s3
    13d8:	9e4e                	add	t3,t3,s3
    13da:	934e                	add	t1,t1,s3
    13dc:	98ce                	add	a7,a7,s3
    13de:	93ce                	add	t2,t2,s3
    13e0:	984e                	add	a6,a6,s3
    13e2:	954e                	add	a0,a0,s3
    13e4:	95ce                	add	a1,a1,s3
    13e6:	0006c083          	lbu	ra,0(a3)
    13ea:	0002c283          	lbu	t0,0(t0)
    13ee:	00074683          	lbu	a3,0(a4)
    13f2:	000fcf83          	lbu	t6,0(t6)
    13f6:	000f4f03          	lbu	t5,0(t5)
    13fa:	000ece83          	lbu	t4,0(t4)
    13fe:	000e4e03          	lbu	t3,0(t3)
    1402:	00034303          	lbu	t1,0(t1)
    1406:	0008c883          	lbu	a7,0(a7)
    140a:	0003c383          	lbu	t2,0(t2)
    140e:	00084803          	lbu	a6,0(a6)
    1412:	00054503          	lbu	a0,0(a0)
    1416:	0005c583          	lbu	a1,0(a1)
    141a:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    141e:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1422:	9371                	srli	a4,a4,0x3c
    1424:	8bbd                	andi	a5,a5,15
    1426:	974e                	add	a4,a4,s3
    1428:	97ce                	add	a5,a5,s3
    142a:	005105a3          	sb	t0,11(sp)
    142e:	01f10623          	sb	t6,12(sp)
    1432:	01e106a3          	sb	t5,13(sp)
    1436:	01d10723          	sb	t4,14(sp)
    143a:	01c107a3          	sb	t3,15(sp)
    143e:	00610823          	sb	t1,16(sp)
    1442:	011108a3          	sb	a7,17(sp)
    1446:	00710923          	sb	t2,18(sp)
    144a:	010109a3          	sb	a6,19(sp)
    144e:	00a10a23          	sb	a0,20(sp)
    1452:	00b10aa3          	sb	a1,21(sp)
    1456:	00110b23          	sb	ra,22(sp)
    145a:	00d10ba3          	sb	a3,23(sp)
    145e:	00810523          	sb	s0,10(sp)
    1462:	00074703          	lbu	a4,0(a4)
    1466:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    146a:	002c                	addi	a1,sp,8
    146c:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    146e:	00e10c23          	sb	a4,24(sp)
    1472:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1476:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    147a:	7a0000ef          	jal	ra,1c1a <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    147e:	00248513          	addi	a0,s1,2
        if (!*s)
    1482:	00054783          	lbu	a5,0(a0)
    1486:	e8079ae3          	bnez	a5,131a <printf+0x4a>
    }
    va_end(ap);
}
    148a:	70a6                	ld	ra,104(sp)
    148c:	7406                	ld	s0,96(sp)
    148e:	64e6                	ld	s1,88(sp)
    1490:	6946                	ld	s2,80(sp)
    1492:	69a6                	ld	s3,72(sp)
    1494:	6a06                	ld	s4,64(sp)
    1496:	7ae2                	ld	s5,56(sp)
    1498:	7b42                	ld	s6,48(sp)
    149a:	614d                	addi	sp,sp,176
    149c:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    149e:	00064783          	lbu	a5,0(a2)
    14a2:	84b2                	mv	s1,a2
    14a4:	01278963          	beq	a5,s2,14b6 <printf+0x1e6>
    14a8:	b549                	j	132a <printf+0x5a>
    14aa:	0024c783          	lbu	a5,2(s1)
    14ae:	0605                	addi	a2,a2,1
    14b0:	0489                	addi	s1,s1,2
    14b2:	e7279ce3          	bne	a5,s2,132a <printf+0x5a>
    14b6:	0014c783          	lbu	a5,1(s1)
    14ba:	ff2788e3          	beq	a5,s2,14aa <printf+0x1da>
        l = z - a;
    14be:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14c2:	85aa                	mv	a1,a0
    14c4:	8622                	mv	a2,s0
    14c6:	4505                	li	a0,1
    14c8:	752000ef          	jal	ra,1c1a <write>
        if (l)
    14cc:	e60408e3          	beqz	s0,133c <printf+0x6c>
    14d0:	8526                	mv	a0,s1
    14d2:	b581                	j	1312 <printf+0x42>
        switch (s[1])
    14d4:	07800713          	li	a4,120
    14d8:	04e79963          	bne	a5,a4,152a <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    14dc:	6782                	ld	a5,0(sp)
    14de:	45c1                	li	a1,16
    14e0:	4388                	lw	a0,0(a5)
    14e2:	07a1                	addi	a5,a5,8
    14e4:	e03e                	sd	a5,0(sp)
    14e6:	be5ff0ef          	jal	ra,10ca <printint.constprop.0>
        s += 2;
    14ea:	00248513          	addi	a0,s1,2
    14ee:	bf51                	j	1482 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    14f0:	6782                	ld	a5,0(sp)
    14f2:	45a9                	li	a1,10
    14f4:	4388                	lw	a0,0(a5)
    14f6:	07a1                	addi	a5,a5,8
    14f8:	e03e                	sd	a5,0(sp)
    14fa:	bd1ff0ef          	jal	ra,10ca <printint.constprop.0>
        s += 2;
    14fe:	00248513          	addi	a0,s1,2
    1502:	b741                	j	1482 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1504:	6782                	ld	a5,0(sp)
    1506:	6380                	ld	s0,0(a5)
    1508:	07a1                	addi	a5,a5,8
    150a:	e03e                	sd	a5,0(sp)
    150c:	c421                	beqz	s0,1554 <printf+0x284>
            l = strnlen(a, 200);
    150e:	0c800593          	li	a1,200
    1512:	8522                	mv	a0,s0
    1514:	40e000ef          	jal	ra,1922 <strnlen>
    write(f, s, l);
    1518:	0005061b          	sext.w	a2,a0
    151c:	85a2                	mv	a1,s0
    151e:	4505                	li	a0,1
    1520:	6fa000ef          	jal	ra,1c1a <write>
        s += 2;
    1524:	00248513          	addi	a0,s1,2
    1528:	bfa9                	j	1482 <printf+0x1b2>
    char byte = c;
    152a:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    152e:	4605                	li	a2,1
    1530:	002c                	addi	a1,sp,8
    1532:	4505                	li	a0,1
    char byte = c;
    1534:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1538:	6e2000ef          	jal	ra,1c1a <write>
    char byte = c;
    153c:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1540:	4605                	li	a2,1
    1542:	002c                	addi	a1,sp,8
    1544:	4505                	li	a0,1
    char byte = c;
    1546:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    154a:	6d0000ef          	jal	ra,1c1a <write>
        s += 2;
    154e:	00248513          	addi	a0,s1,2
    1552:	bf05                	j	1482 <printf+0x1b2>
                a = "(null)";
    1554:	845a                	mv	s0,s6
    1556:	bf65                	j	150e <printf+0x23e>

0000000000001558 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1558:	1141                	addi	sp,sp,-16
    155a:	e406                	sd	ra,8(sp)
    puts(m);
    155c:	d53ff0ef          	jal	ra,12ae <puts>
    exit(-100);
}
    1560:	60a2                	ld	ra,8(sp)
    exit(-100);
    1562:	f9c00513          	li	a0,-100
}
    1566:	0141                	addi	sp,sp,16
    exit(-100);
    1568:	a709                	j	1c6a <exit>

000000000000156a <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    156a:	02000793          	li	a5,32
    156e:	00f50663          	beq	a0,a5,157a <isspace+0x10>
    1572:	355d                	addiw	a0,a0,-9
    1574:	00553513          	sltiu	a0,a0,5
    1578:	8082                	ret
    157a:	4505                	li	a0,1
}
    157c:	8082                	ret

000000000000157e <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    157e:	fd05051b          	addiw	a0,a0,-48
}
    1582:	00a53513          	sltiu	a0,a0,10
    1586:	8082                	ret

0000000000001588 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1588:	02000613          	li	a2,32
    158c:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    158e:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1592:	ff77069b          	addiw	a3,a4,-9
    1596:	04c70d63          	beq	a4,a2,15f0 <atoi+0x68>
    159a:	0007079b          	sext.w	a5,a4
    159e:	04d5f963          	bgeu	a1,a3,15f0 <atoi+0x68>
        s++;
    switch (*s)
    15a2:	02b00693          	li	a3,43
    15a6:	04d70a63          	beq	a4,a3,15fa <atoi+0x72>
    15aa:	02d00693          	li	a3,45
    15ae:	06d70463          	beq	a4,a3,1616 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15b2:	fd07859b          	addiw	a1,a5,-48
    15b6:	4625                	li	a2,9
    15b8:	873e                	mv	a4,a5
    15ba:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15bc:	4e01                	li	t3,0
    while (isdigit(*s))
    15be:	04b66a63          	bltu	a2,a1,1612 <atoi+0x8a>
    int n = 0, neg = 0;
    15c2:	4501                	li	a0,0
    while (isdigit(*s))
    15c4:	4825                	li	a6,9
    15c6:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    15ca:	0025179b          	slliw	a5,a0,0x2
    15ce:	9d3d                	addw	a0,a0,a5
    15d0:	fd07031b          	addiw	t1,a4,-48
    15d4:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15d8:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15dc:	0685                	addi	a3,a3,1
    15de:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15e2:	0006071b          	sext.w	a4,a2
    15e6:	feb870e3          	bgeu	a6,a1,15c6 <atoi+0x3e>
    return neg ? n : -n;
    15ea:	000e0563          	beqz	t3,15f4 <atoi+0x6c>
}
    15ee:	8082                	ret
        s++;
    15f0:	0505                	addi	a0,a0,1
    15f2:	bf71                	j	158e <atoi+0x6>
    15f4:	4113053b          	subw	a0,t1,a7
    15f8:	8082                	ret
    while (isdigit(*s))
    15fa:	00154783          	lbu	a5,1(a0)
    15fe:	4625                	li	a2,9
        s++;
    1600:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1604:	fd07859b          	addiw	a1,a5,-48
    1608:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    160c:	4e01                	li	t3,0
    while (isdigit(*s))
    160e:	fab67ae3          	bgeu	a2,a1,15c2 <atoi+0x3a>
    1612:	4501                	li	a0,0
}
    1614:	8082                	ret
    while (isdigit(*s))
    1616:	00154783          	lbu	a5,1(a0)
    161a:	4625                	li	a2,9
        s++;
    161c:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1620:	fd07859b          	addiw	a1,a5,-48
    1624:	0007871b          	sext.w	a4,a5
    1628:	feb665e3          	bltu	a2,a1,1612 <atoi+0x8a>
        neg = 1;
    162c:	4e05                	li	t3,1
    162e:	bf51                	j	15c2 <atoi+0x3a>

0000000000001630 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1630:	16060d63          	beqz	a2,17aa <memset+0x17a>
    1634:	40a007b3          	neg	a5,a0
    1638:	8b9d                	andi	a5,a5,7
    163a:	00778713          	addi	a4,a5,7
    163e:	482d                	li	a6,11
    1640:	0ff5f593          	andi	a1,a1,255
    1644:	fff60693          	addi	a3,a2,-1
    1648:	17076263          	bltu	a4,a6,17ac <memset+0x17c>
    164c:	16e6ea63          	bltu	a3,a4,17c0 <memset+0x190>
    1650:	16078563          	beqz	a5,17ba <memset+0x18a>
    1654:	00b50023          	sb	a1,0(a0)
    1658:	4705                	li	a4,1
    165a:	00150e93          	addi	t4,a0,1
    165e:	14e78c63          	beq	a5,a4,17b6 <memset+0x186>
    1662:	00b500a3          	sb	a1,1(a0)
    1666:	4709                	li	a4,2
    1668:	00250e93          	addi	t4,a0,2
    166c:	14e78d63          	beq	a5,a4,17c6 <memset+0x196>
    1670:	00b50123          	sb	a1,2(a0)
    1674:	470d                	li	a4,3
    1676:	00350e93          	addi	t4,a0,3
    167a:	12e78b63          	beq	a5,a4,17b0 <memset+0x180>
    167e:	00b501a3          	sb	a1,3(a0)
    1682:	4711                	li	a4,4
    1684:	00450e93          	addi	t4,a0,4
    1688:	14e78163          	beq	a5,a4,17ca <memset+0x19a>
    168c:	00b50223          	sb	a1,4(a0)
    1690:	4715                	li	a4,5
    1692:	00550e93          	addi	t4,a0,5
    1696:	12e78c63          	beq	a5,a4,17ce <memset+0x19e>
    169a:	00b502a3          	sb	a1,5(a0)
    169e:	471d                	li	a4,7
    16a0:	00650e93          	addi	t4,a0,6
    16a4:	12e79763          	bne	a5,a4,17d2 <memset+0x1a2>
    16a8:	00750e93          	addi	t4,a0,7
    16ac:	00b50323          	sb	a1,6(a0)
    16b0:	4f1d                	li	t5,7
    16b2:	00859713          	slli	a4,a1,0x8
    16b6:	8f4d                	or	a4,a4,a1
    16b8:	01059e13          	slli	t3,a1,0x10
    16bc:	01c76e33          	or	t3,a4,t3
    16c0:	01859313          	slli	t1,a1,0x18
    16c4:	006e6333          	or	t1,t3,t1
    16c8:	02059893          	slli	a7,a1,0x20
    16cc:	011368b3          	or	a7,t1,a7
    16d0:	02859813          	slli	a6,a1,0x28
    16d4:	40f60333          	sub	t1,a2,a5
    16d8:	0108e833          	or	a6,a7,a6
    16dc:	03059693          	slli	a3,a1,0x30
    16e0:	00d866b3          	or	a3,a6,a3
    16e4:	03859713          	slli	a4,a1,0x38
    16e8:	97aa                	add	a5,a5,a0
    16ea:	ff837813          	andi	a6,t1,-8
    16ee:	8f55                	or	a4,a4,a3
    16f0:	00f806b3          	add	a3,a6,a5
    16f4:	e398                	sd	a4,0(a5)
    16f6:	07a1                	addi	a5,a5,8
    16f8:	fed79ee3          	bne	a5,a3,16f4 <memset+0xc4>
    16fc:	ff837693          	andi	a3,t1,-8
    1700:	00de87b3          	add	a5,t4,a3
    1704:	01e6873b          	addw	a4,a3,t5
    1708:	0ad30663          	beq	t1,a3,17b4 <memset+0x184>
    170c:	00b78023          	sb	a1,0(a5)
    1710:	0017069b          	addiw	a3,a4,1
    1714:	08c6fb63          	bgeu	a3,a2,17aa <memset+0x17a>
    1718:	00b780a3          	sb	a1,1(a5)
    171c:	0027069b          	addiw	a3,a4,2
    1720:	08c6f563          	bgeu	a3,a2,17aa <memset+0x17a>
    1724:	00b78123          	sb	a1,2(a5)
    1728:	0037069b          	addiw	a3,a4,3
    172c:	06c6ff63          	bgeu	a3,a2,17aa <memset+0x17a>
    1730:	00b781a3          	sb	a1,3(a5)
    1734:	0047069b          	addiw	a3,a4,4
    1738:	06c6f963          	bgeu	a3,a2,17aa <memset+0x17a>
    173c:	00b78223          	sb	a1,4(a5)
    1740:	0057069b          	addiw	a3,a4,5
    1744:	06c6f363          	bgeu	a3,a2,17aa <memset+0x17a>
    1748:	00b782a3          	sb	a1,5(a5)
    174c:	0067069b          	addiw	a3,a4,6
    1750:	04c6fd63          	bgeu	a3,a2,17aa <memset+0x17a>
    1754:	00b78323          	sb	a1,6(a5)
    1758:	0077069b          	addiw	a3,a4,7
    175c:	04c6f763          	bgeu	a3,a2,17aa <memset+0x17a>
    1760:	00b783a3          	sb	a1,7(a5)
    1764:	0087069b          	addiw	a3,a4,8
    1768:	04c6f163          	bgeu	a3,a2,17aa <memset+0x17a>
    176c:	00b78423          	sb	a1,8(a5)
    1770:	0097069b          	addiw	a3,a4,9
    1774:	02c6fb63          	bgeu	a3,a2,17aa <memset+0x17a>
    1778:	00b784a3          	sb	a1,9(a5)
    177c:	00a7069b          	addiw	a3,a4,10
    1780:	02c6f563          	bgeu	a3,a2,17aa <memset+0x17a>
    1784:	00b78523          	sb	a1,10(a5)
    1788:	00b7069b          	addiw	a3,a4,11
    178c:	00c6ff63          	bgeu	a3,a2,17aa <memset+0x17a>
    1790:	00b785a3          	sb	a1,11(a5)
    1794:	00c7069b          	addiw	a3,a4,12
    1798:	00c6f963          	bgeu	a3,a2,17aa <memset+0x17a>
    179c:	00b78623          	sb	a1,12(a5)
    17a0:	2735                	addiw	a4,a4,13
    17a2:	00c77463          	bgeu	a4,a2,17aa <memset+0x17a>
    17a6:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17aa:	8082                	ret
    17ac:	472d                	li	a4,11
    17ae:	bd79                	j	164c <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17b0:	4f0d                	li	t5,3
    17b2:	b701                	j	16b2 <memset+0x82>
    17b4:	8082                	ret
    17b6:	4f05                	li	t5,1
    17b8:	bded                	j	16b2 <memset+0x82>
    17ba:	8eaa                	mv	t4,a0
    17bc:	4f01                	li	t5,0
    17be:	bdd5                	j	16b2 <memset+0x82>
    17c0:	87aa                	mv	a5,a0
    17c2:	4701                	li	a4,0
    17c4:	b7a1                	j	170c <memset+0xdc>
    17c6:	4f09                	li	t5,2
    17c8:	b5ed                	j	16b2 <memset+0x82>
    17ca:	4f11                	li	t5,4
    17cc:	b5dd                	j	16b2 <memset+0x82>
    17ce:	4f15                	li	t5,5
    17d0:	b5cd                	j	16b2 <memset+0x82>
    17d2:	4f19                	li	t5,6
    17d4:	bdf9                	j	16b2 <memset+0x82>

00000000000017d6 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17d6:	00054783          	lbu	a5,0(a0)
    17da:	0005c703          	lbu	a4,0(a1)
    17de:	00e79863          	bne	a5,a4,17ee <strcmp+0x18>
    17e2:	0505                	addi	a0,a0,1
    17e4:	0585                	addi	a1,a1,1
    17e6:	fbe5                	bnez	a5,17d6 <strcmp>
    17e8:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17ea:	9d19                	subw	a0,a0,a4
    17ec:	8082                	ret
    17ee:	0007851b          	sext.w	a0,a5
    17f2:	bfe5                	j	17ea <strcmp+0x14>

00000000000017f4 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17f4:	ce05                	beqz	a2,182c <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17f6:	00054703          	lbu	a4,0(a0)
    17fa:	0005c783          	lbu	a5,0(a1)
    17fe:	cb0d                	beqz	a4,1830 <strncmp+0x3c>
    if (!n--)
    1800:	167d                	addi	a2,a2,-1
    1802:	00c506b3          	add	a3,a0,a2
    1806:	a819                	j	181c <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1808:	00a68e63          	beq	a3,a0,1824 <strncmp+0x30>
    180c:	0505                	addi	a0,a0,1
    180e:	00e79b63          	bne	a5,a4,1824 <strncmp+0x30>
    1812:	00054703          	lbu	a4,0(a0)
    1816:	0005c783          	lbu	a5,0(a1)
    181a:	cb19                	beqz	a4,1830 <strncmp+0x3c>
    181c:	0005c783          	lbu	a5,0(a1)
    1820:	0585                	addi	a1,a1,1
    1822:	f3fd                	bnez	a5,1808 <strncmp+0x14>
        ;
    return *l - *r;
    1824:	0007051b          	sext.w	a0,a4
    1828:	9d1d                	subw	a0,a0,a5
    182a:	8082                	ret
        return 0;
    182c:	4501                	li	a0,0
}
    182e:	8082                	ret
    1830:	4501                	li	a0,0
    return *l - *r;
    1832:	9d1d                	subw	a0,a0,a5
    1834:	8082                	ret

0000000000001836 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1836:	00757793          	andi	a5,a0,7
    183a:	cf89                	beqz	a5,1854 <strlen+0x1e>
    183c:	87aa                	mv	a5,a0
    183e:	a029                	j	1848 <strlen+0x12>
    1840:	0785                	addi	a5,a5,1
    1842:	0077f713          	andi	a4,a5,7
    1846:	cb01                	beqz	a4,1856 <strlen+0x20>
        if (!*s)
    1848:	0007c703          	lbu	a4,0(a5)
    184c:	fb75                	bnez	a4,1840 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    184e:	40a78533          	sub	a0,a5,a0
}
    1852:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1854:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1856:	6394                	ld	a3,0(a5)
    1858:	00000597          	auipc	a1,0x0
    185c:	6985b583          	ld	a1,1688(a1) # 1ef0 <__clone+0x9e>
    1860:	00000617          	auipc	a2,0x0
    1864:	69863603          	ld	a2,1688(a2) # 1ef8 <__clone+0xa6>
    1868:	a019                	j	186e <strlen+0x38>
    186a:	6794                	ld	a3,8(a5)
    186c:	07a1                	addi	a5,a5,8
    186e:	00b68733          	add	a4,a3,a1
    1872:	fff6c693          	not	a3,a3
    1876:	8f75                	and	a4,a4,a3
    1878:	8f71                	and	a4,a4,a2
    187a:	db65                	beqz	a4,186a <strlen+0x34>
    for (; *s; s++)
    187c:	0007c703          	lbu	a4,0(a5)
    1880:	d779                	beqz	a4,184e <strlen+0x18>
    1882:	0017c703          	lbu	a4,1(a5)
    1886:	0785                	addi	a5,a5,1
    1888:	d379                	beqz	a4,184e <strlen+0x18>
    188a:	0017c703          	lbu	a4,1(a5)
    188e:	0785                	addi	a5,a5,1
    1890:	fb6d                	bnez	a4,1882 <strlen+0x4c>
    1892:	bf75                	j	184e <strlen+0x18>

0000000000001894 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1894:	00757713          	andi	a4,a0,7
{
    1898:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    189a:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    189e:	cb19                	beqz	a4,18b4 <memchr+0x20>
    18a0:	ce25                	beqz	a2,1918 <memchr+0x84>
    18a2:	0007c703          	lbu	a4,0(a5)
    18a6:	04b70e63          	beq	a4,a1,1902 <memchr+0x6e>
    18aa:	0785                	addi	a5,a5,1
    18ac:	0077f713          	andi	a4,a5,7
    18b0:	167d                	addi	a2,a2,-1
    18b2:	f77d                	bnez	a4,18a0 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18b4:	4501                	li	a0,0
    if (n && *s != c)
    18b6:	c235                	beqz	a2,191a <memchr+0x86>
    18b8:	0007c703          	lbu	a4,0(a5)
    18bc:	04b70363          	beq	a4,a1,1902 <memchr+0x6e>
        size_t k = ONES * c;
    18c0:	00000517          	auipc	a0,0x0
    18c4:	64053503          	ld	a0,1600(a0) # 1f00 <__clone+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18c8:	471d                	li	a4,7
        size_t k = ONES * c;
    18ca:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18ce:	02c77a63          	bgeu	a4,a2,1902 <memchr+0x6e>
    18d2:	00000897          	auipc	a7,0x0
    18d6:	61e8b883          	ld	a7,1566(a7) # 1ef0 <__clone+0x9e>
    18da:	00000817          	auipc	a6,0x0
    18de:	61e83803          	ld	a6,1566(a6) # 1ef8 <__clone+0xa6>
    18e2:	431d                	li	t1,7
    18e4:	a029                	j	18ee <memchr+0x5a>
    18e6:	1661                	addi	a2,a2,-8
    18e8:	07a1                	addi	a5,a5,8
    18ea:	02c37963          	bgeu	t1,a2,191c <memchr+0x88>
    18ee:	6398                	ld	a4,0(a5)
    18f0:	8f29                	xor	a4,a4,a0
    18f2:	011706b3          	add	a3,a4,a7
    18f6:	fff74713          	not	a4,a4
    18fa:	8f75                	and	a4,a4,a3
    18fc:	01077733          	and	a4,a4,a6
    1900:	d37d                	beqz	a4,18e6 <memchr+0x52>
    1902:	853e                	mv	a0,a5
    1904:	97b2                	add	a5,a5,a2
    1906:	a021                	j	190e <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1908:	0505                	addi	a0,a0,1
    190a:	00f50763          	beq	a0,a5,1918 <memchr+0x84>
    190e:	00054703          	lbu	a4,0(a0)
    1912:	feb71be3          	bne	a4,a1,1908 <memchr+0x74>
    1916:	8082                	ret
    return n ? (void *)s : 0;
    1918:	4501                	li	a0,0
}
    191a:	8082                	ret
    return n ? (void *)s : 0;
    191c:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    191e:	f275                	bnez	a2,1902 <memchr+0x6e>
}
    1920:	8082                	ret

0000000000001922 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1922:	1101                	addi	sp,sp,-32
    1924:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1926:	862e                	mv	a2,a1
{
    1928:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    192a:	4581                	li	a1,0
{
    192c:	e426                	sd	s1,8(sp)
    192e:	ec06                	sd	ra,24(sp)
    1930:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1932:	f63ff0ef          	jal	ra,1894 <memchr>
    return p ? p - s : n;
    1936:	c519                	beqz	a0,1944 <strnlen+0x22>
}
    1938:	60e2                	ld	ra,24(sp)
    193a:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    193c:	8d05                	sub	a0,a0,s1
}
    193e:	64a2                	ld	s1,8(sp)
    1940:	6105                	addi	sp,sp,32
    1942:	8082                	ret
    1944:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1946:	8522                	mv	a0,s0
}
    1948:	6442                	ld	s0,16(sp)
    194a:	64a2                	ld	s1,8(sp)
    194c:	6105                	addi	sp,sp,32
    194e:	8082                	ret

0000000000001950 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1950:	00b547b3          	xor	a5,a0,a1
    1954:	8b9d                	andi	a5,a5,7
    1956:	eb95                	bnez	a5,198a <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1958:	0075f793          	andi	a5,a1,7
    195c:	e7b1                	bnez	a5,19a8 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    195e:	6198                	ld	a4,0(a1)
    1960:	00000617          	auipc	a2,0x0
    1964:	59063603          	ld	a2,1424(a2) # 1ef0 <__clone+0x9e>
    1968:	00000817          	auipc	a6,0x0
    196c:	59083803          	ld	a6,1424(a6) # 1ef8 <__clone+0xa6>
    1970:	a029                	j	197a <strcpy+0x2a>
    1972:	e118                	sd	a4,0(a0)
    1974:	6598                	ld	a4,8(a1)
    1976:	05a1                	addi	a1,a1,8
    1978:	0521                	addi	a0,a0,8
    197a:	00c707b3          	add	a5,a4,a2
    197e:	fff74693          	not	a3,a4
    1982:	8ff5                	and	a5,a5,a3
    1984:	0107f7b3          	and	a5,a5,a6
    1988:	d7ed                	beqz	a5,1972 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    198a:	0005c783          	lbu	a5,0(a1)
    198e:	00f50023          	sb	a5,0(a0)
    1992:	c785                	beqz	a5,19ba <strcpy+0x6a>
    1994:	0015c783          	lbu	a5,1(a1)
    1998:	0505                	addi	a0,a0,1
    199a:	0585                	addi	a1,a1,1
    199c:	00f50023          	sb	a5,0(a0)
    19a0:	fbf5                	bnez	a5,1994 <strcpy+0x44>
        ;
    return d;
}
    19a2:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19a4:	0505                	addi	a0,a0,1
    19a6:	df45                	beqz	a4,195e <strcpy+0xe>
            if (!(*d = *s))
    19a8:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19ac:	0585                	addi	a1,a1,1
    19ae:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    19b2:	00f50023          	sb	a5,0(a0)
    19b6:	f7fd                	bnez	a5,19a4 <strcpy+0x54>
}
    19b8:	8082                	ret
    19ba:	8082                	ret

00000000000019bc <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19bc:	00b547b3          	xor	a5,a0,a1
    19c0:	8b9d                	andi	a5,a5,7
    19c2:	1a079863          	bnez	a5,1b72 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19c6:	0075f793          	andi	a5,a1,7
    19ca:	16078463          	beqz	a5,1b32 <strncpy+0x176>
    19ce:	ea01                	bnez	a2,19de <strncpy+0x22>
    19d0:	a421                	j	1bd8 <strncpy+0x21c>
    19d2:	167d                	addi	a2,a2,-1
    19d4:	0505                	addi	a0,a0,1
    19d6:	14070e63          	beqz	a4,1b32 <strncpy+0x176>
    19da:	1a060863          	beqz	a2,1b8a <strncpy+0x1ce>
    19de:	0005c783          	lbu	a5,0(a1)
    19e2:	0585                	addi	a1,a1,1
    19e4:	0075f713          	andi	a4,a1,7
    19e8:	00f50023          	sb	a5,0(a0)
    19ec:	f3fd                	bnez	a5,19d2 <strncpy+0x16>
    19ee:	4805                	li	a6,1
    19f0:	1a061863          	bnez	a2,1ba0 <strncpy+0x1e4>
    19f4:	40a007b3          	neg	a5,a0
    19f8:	8b9d                	andi	a5,a5,7
    19fa:	4681                	li	a3,0
    19fc:	18061a63          	bnez	a2,1b90 <strncpy+0x1d4>
    1a00:	00778713          	addi	a4,a5,7
    1a04:	45ad                	li	a1,11
    1a06:	18b76363          	bltu	a4,a1,1b8c <strncpy+0x1d0>
    1a0a:	1ae6eb63          	bltu	a3,a4,1bc0 <strncpy+0x204>
    1a0e:	1a078363          	beqz	a5,1bb4 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a12:	00050023          	sb	zero,0(a0)
    1a16:	4685                	li	a3,1
    1a18:	00150713          	addi	a4,a0,1
    1a1c:	18d78f63          	beq	a5,a3,1bba <strncpy+0x1fe>
    1a20:	000500a3          	sb	zero,1(a0)
    1a24:	4689                	li	a3,2
    1a26:	00250713          	addi	a4,a0,2
    1a2a:	18d78e63          	beq	a5,a3,1bc6 <strncpy+0x20a>
    1a2e:	00050123          	sb	zero,2(a0)
    1a32:	468d                	li	a3,3
    1a34:	00350713          	addi	a4,a0,3
    1a38:	16d78c63          	beq	a5,a3,1bb0 <strncpy+0x1f4>
    1a3c:	000501a3          	sb	zero,3(a0)
    1a40:	4691                	li	a3,4
    1a42:	00450713          	addi	a4,a0,4
    1a46:	18d78263          	beq	a5,a3,1bca <strncpy+0x20e>
    1a4a:	00050223          	sb	zero,4(a0)
    1a4e:	4695                	li	a3,5
    1a50:	00550713          	addi	a4,a0,5
    1a54:	16d78d63          	beq	a5,a3,1bce <strncpy+0x212>
    1a58:	000502a3          	sb	zero,5(a0)
    1a5c:	469d                	li	a3,7
    1a5e:	00650713          	addi	a4,a0,6
    1a62:	16d79863          	bne	a5,a3,1bd2 <strncpy+0x216>
    1a66:	00750713          	addi	a4,a0,7
    1a6a:	00050323          	sb	zero,6(a0)
    1a6e:	40f80833          	sub	a6,a6,a5
    1a72:	ff887593          	andi	a1,a6,-8
    1a76:	97aa                	add	a5,a5,a0
    1a78:	95be                	add	a1,a1,a5
    1a7a:	0007b023          	sd	zero,0(a5)
    1a7e:	07a1                	addi	a5,a5,8
    1a80:	feb79de3          	bne	a5,a1,1a7a <strncpy+0xbe>
    1a84:	ff887593          	andi	a1,a6,-8
    1a88:	9ead                	addw	a3,a3,a1
    1a8a:	00b707b3          	add	a5,a4,a1
    1a8e:	12b80863          	beq	a6,a1,1bbe <strncpy+0x202>
    1a92:	00078023          	sb	zero,0(a5)
    1a96:	0016871b          	addiw	a4,a3,1
    1a9a:	0ec77863          	bgeu	a4,a2,1b8a <strncpy+0x1ce>
    1a9e:	000780a3          	sb	zero,1(a5)
    1aa2:	0026871b          	addiw	a4,a3,2
    1aa6:	0ec77263          	bgeu	a4,a2,1b8a <strncpy+0x1ce>
    1aaa:	00078123          	sb	zero,2(a5)
    1aae:	0036871b          	addiw	a4,a3,3
    1ab2:	0cc77c63          	bgeu	a4,a2,1b8a <strncpy+0x1ce>
    1ab6:	000781a3          	sb	zero,3(a5)
    1aba:	0046871b          	addiw	a4,a3,4
    1abe:	0cc77663          	bgeu	a4,a2,1b8a <strncpy+0x1ce>
    1ac2:	00078223          	sb	zero,4(a5)
    1ac6:	0056871b          	addiw	a4,a3,5
    1aca:	0cc77063          	bgeu	a4,a2,1b8a <strncpy+0x1ce>
    1ace:	000782a3          	sb	zero,5(a5)
    1ad2:	0066871b          	addiw	a4,a3,6
    1ad6:	0ac77a63          	bgeu	a4,a2,1b8a <strncpy+0x1ce>
    1ada:	00078323          	sb	zero,6(a5)
    1ade:	0076871b          	addiw	a4,a3,7
    1ae2:	0ac77463          	bgeu	a4,a2,1b8a <strncpy+0x1ce>
    1ae6:	000783a3          	sb	zero,7(a5)
    1aea:	0086871b          	addiw	a4,a3,8
    1aee:	08c77e63          	bgeu	a4,a2,1b8a <strncpy+0x1ce>
    1af2:	00078423          	sb	zero,8(a5)
    1af6:	0096871b          	addiw	a4,a3,9
    1afa:	08c77863          	bgeu	a4,a2,1b8a <strncpy+0x1ce>
    1afe:	000784a3          	sb	zero,9(a5)
    1b02:	00a6871b          	addiw	a4,a3,10
    1b06:	08c77263          	bgeu	a4,a2,1b8a <strncpy+0x1ce>
    1b0a:	00078523          	sb	zero,10(a5)
    1b0e:	00b6871b          	addiw	a4,a3,11
    1b12:	06c77c63          	bgeu	a4,a2,1b8a <strncpy+0x1ce>
    1b16:	000785a3          	sb	zero,11(a5)
    1b1a:	00c6871b          	addiw	a4,a3,12
    1b1e:	06c77663          	bgeu	a4,a2,1b8a <strncpy+0x1ce>
    1b22:	00078623          	sb	zero,12(a5)
    1b26:	26b5                	addiw	a3,a3,13
    1b28:	06c6f163          	bgeu	a3,a2,1b8a <strncpy+0x1ce>
    1b2c:	000786a3          	sb	zero,13(a5)
    1b30:	8082                	ret
            ;
        if (!n || !*s)
    1b32:	c645                	beqz	a2,1bda <strncpy+0x21e>
    1b34:	0005c783          	lbu	a5,0(a1)
    1b38:	ea078be3          	beqz	a5,19ee <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b3c:	479d                	li	a5,7
    1b3e:	02c7ff63          	bgeu	a5,a2,1b7c <strncpy+0x1c0>
    1b42:	00000897          	auipc	a7,0x0
    1b46:	3ae8b883          	ld	a7,942(a7) # 1ef0 <__clone+0x9e>
    1b4a:	00000817          	auipc	a6,0x0
    1b4e:	3ae83803          	ld	a6,942(a6) # 1ef8 <__clone+0xa6>
    1b52:	431d                	li	t1,7
    1b54:	6198                	ld	a4,0(a1)
    1b56:	011707b3          	add	a5,a4,a7
    1b5a:	fff74693          	not	a3,a4
    1b5e:	8ff5                	and	a5,a5,a3
    1b60:	0107f7b3          	and	a5,a5,a6
    1b64:	ef81                	bnez	a5,1b7c <strncpy+0x1c0>
            *wd = *ws;
    1b66:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b68:	1661                	addi	a2,a2,-8
    1b6a:	05a1                	addi	a1,a1,8
    1b6c:	0521                	addi	a0,a0,8
    1b6e:	fec363e3          	bltu	t1,a2,1b54 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b72:	e609                	bnez	a2,1b7c <strncpy+0x1c0>
    1b74:	a08d                	j	1bd6 <strncpy+0x21a>
    1b76:	167d                	addi	a2,a2,-1
    1b78:	0505                	addi	a0,a0,1
    1b7a:	ca01                	beqz	a2,1b8a <strncpy+0x1ce>
    1b7c:	0005c783          	lbu	a5,0(a1)
    1b80:	0585                	addi	a1,a1,1
    1b82:	00f50023          	sb	a5,0(a0)
    1b86:	fbe5                	bnez	a5,1b76 <strncpy+0x1ba>
        ;
tail:
    1b88:	b59d                	j	19ee <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1b8a:	8082                	ret
    1b8c:	472d                	li	a4,11
    1b8e:	bdb5                	j	1a0a <strncpy+0x4e>
    1b90:	00778713          	addi	a4,a5,7
    1b94:	45ad                	li	a1,11
    1b96:	fff60693          	addi	a3,a2,-1
    1b9a:	e6b778e3          	bgeu	a4,a1,1a0a <strncpy+0x4e>
    1b9e:	b7fd                	j	1b8c <strncpy+0x1d0>
    1ba0:	40a007b3          	neg	a5,a0
    1ba4:	8832                	mv	a6,a2
    1ba6:	8b9d                	andi	a5,a5,7
    1ba8:	4681                	li	a3,0
    1baa:	e4060be3          	beqz	a2,1a00 <strncpy+0x44>
    1bae:	b7cd                	j	1b90 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bb0:	468d                	li	a3,3
    1bb2:	bd75                	j	1a6e <strncpy+0xb2>
    1bb4:	872a                	mv	a4,a0
    1bb6:	4681                	li	a3,0
    1bb8:	bd5d                	j	1a6e <strncpy+0xb2>
    1bba:	4685                	li	a3,1
    1bbc:	bd4d                	j	1a6e <strncpy+0xb2>
    1bbe:	8082                	ret
    1bc0:	87aa                	mv	a5,a0
    1bc2:	4681                	li	a3,0
    1bc4:	b5f9                	j	1a92 <strncpy+0xd6>
    1bc6:	4689                	li	a3,2
    1bc8:	b55d                	j	1a6e <strncpy+0xb2>
    1bca:	4691                	li	a3,4
    1bcc:	b54d                	j	1a6e <strncpy+0xb2>
    1bce:	4695                	li	a3,5
    1bd0:	bd79                	j	1a6e <strncpy+0xb2>
    1bd2:	4699                	li	a3,6
    1bd4:	bd69                	j	1a6e <strncpy+0xb2>
    1bd6:	8082                	ret
    1bd8:	8082                	ret
    1bda:	8082                	ret

0000000000001bdc <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1bdc:	87aa                	mv	a5,a0
    1bde:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1be0:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1be4:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1be8:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1bea:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bec:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1bf0:	2501                	sext.w	a0,a0
    1bf2:	8082                	ret

0000000000001bf4 <openat>:
    register long a7 __asm__("a7") = n;
    1bf4:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1bf8:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bfc:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c00:	2501                	sext.w	a0,a0
    1c02:	8082                	ret

0000000000001c04 <close>:
    register long a7 __asm__("a7") = n;
    1c04:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c08:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c0c:	2501                	sext.w	a0,a0
    1c0e:	8082                	ret

0000000000001c10 <read>:
    register long a7 __asm__("a7") = n;
    1c10:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c14:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c18:	8082                	ret

0000000000001c1a <write>:
    register long a7 __asm__("a7") = n;
    1c1a:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c1e:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c22:	8082                	ret

0000000000001c24 <getpid>:
    register long a7 __asm__("a7") = n;
    1c24:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c28:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c2c:	2501                	sext.w	a0,a0
    1c2e:	8082                	ret

0000000000001c30 <getppid>:
    register long a7 __asm__("a7") = n;
    1c30:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c34:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c38:	2501                	sext.w	a0,a0
    1c3a:	8082                	ret

0000000000001c3c <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c3c:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c40:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c44:	2501                	sext.w	a0,a0
    1c46:	8082                	ret

0000000000001c48 <fork>:
    register long a7 __asm__("a7") = n;
    1c48:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c4c:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c4e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c50:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c54:	2501                	sext.w	a0,a0
    1c56:	8082                	ret

0000000000001c58 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c58:	85b2                	mv	a1,a2
    1c5a:	863a                	mv	a2,a4
    if (stack)
    1c5c:	c191                	beqz	a1,1c60 <clone+0x8>
	stack += stack_size;
    1c5e:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c60:	4781                	li	a5,0
    1c62:	4701                	li	a4,0
    1c64:	4681                	li	a3,0
    1c66:	2601                	sext.w	a2,a2
    1c68:	a2ed                	j	1e52 <__clone>

0000000000001c6a <exit>:
    register long a7 __asm__("a7") = n;
    1c6a:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c6e:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c72:	8082                	ret

0000000000001c74 <waitpid>:
    register long a7 __asm__("a7") = n;
    1c74:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c78:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c7a:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c7e:	2501                	sext.w	a0,a0
    1c80:	8082                	ret

0000000000001c82 <exec>:
    register long a7 __asm__("a7") = n;
    1c82:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1c86:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1c8a:	2501                	sext.w	a0,a0
    1c8c:	8082                	ret

0000000000001c8e <execve>:
    register long a7 __asm__("a7") = n;
    1c8e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c92:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1c96:	2501                	sext.w	a0,a0
    1c98:	8082                	ret

0000000000001c9a <times>:
    register long a7 __asm__("a7") = n;
    1c9a:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1c9e:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1ca2:	2501                	sext.w	a0,a0
    1ca4:	8082                	ret

0000000000001ca6 <get_time>:

int64 get_time()
{
    1ca6:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1ca8:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cac:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cae:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cb0:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cb4:	2501                	sext.w	a0,a0
    1cb6:	ed09                	bnez	a0,1cd0 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cb8:	67a2                	ld	a5,8(sp)
    1cba:	3e800713          	li	a4,1000
    1cbe:	00015503          	lhu	a0,0(sp)
    1cc2:	02e7d7b3          	divu	a5,a5,a4
    1cc6:	02e50533          	mul	a0,a0,a4
    1cca:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1ccc:	0141                	addi	sp,sp,16
    1cce:	8082                	ret
        return -1;
    1cd0:	557d                	li	a0,-1
    1cd2:	bfed                	j	1ccc <get_time+0x26>

0000000000001cd4 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1cd4:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cd8:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1cdc:	2501                	sext.w	a0,a0
    1cde:	8082                	ret

0000000000001ce0 <time>:
    register long a7 __asm__("a7") = n;
    1ce0:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1ce4:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1ce8:	2501                	sext.w	a0,a0
    1cea:	8082                	ret

0000000000001cec <sleep>:

int sleep(unsigned long long time)
{
    1cec:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1cee:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1cf0:	850a                	mv	a0,sp
    1cf2:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1cf4:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1cf8:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cfa:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1cfe:	e501                	bnez	a0,1d06 <sleep+0x1a>
    return 0;
    1d00:	4501                	li	a0,0
}
    1d02:	0141                	addi	sp,sp,16
    1d04:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d06:	4502                	lw	a0,0(sp)
}
    1d08:	0141                	addi	sp,sp,16
    1d0a:	8082                	ret

0000000000001d0c <set_priority>:
    register long a7 __asm__("a7") = n;
    1d0c:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d10:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d14:	2501                	sext.w	a0,a0
    1d16:	8082                	ret

0000000000001d18 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d18:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d1c:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d20:	8082                	ret

0000000000001d22 <munmap>:
    register long a7 __asm__("a7") = n;
    1d22:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d26:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d2a:	2501                	sext.w	a0,a0
    1d2c:	8082                	ret

0000000000001d2e <wait>:

int wait(int *code)
{
    1d2e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d30:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d34:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d36:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d38:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d3a:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d3e:	2501                	sext.w	a0,a0
    1d40:	8082                	ret

0000000000001d42 <spawn>:
    register long a7 __asm__("a7") = n;
    1d42:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d46:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d4a:	2501                	sext.w	a0,a0
    1d4c:	8082                	ret

0000000000001d4e <mailread>:
    register long a7 __asm__("a7") = n;
    1d4e:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d52:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d56:	2501                	sext.w	a0,a0
    1d58:	8082                	ret

0000000000001d5a <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d5a:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d5e:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d62:	2501                	sext.w	a0,a0
    1d64:	8082                	ret

0000000000001d66 <fstat>:
    register long a7 __asm__("a7") = n;
    1d66:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d6a:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d6e:	2501                	sext.w	a0,a0
    1d70:	8082                	ret

0000000000001d72 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d72:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d74:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d78:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d7a:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d7e:	2501                	sext.w	a0,a0
    1d80:	8082                	ret

0000000000001d82 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1d82:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d84:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1d88:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d8a:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1d8e:	2501                	sext.w	a0,a0
    1d90:	8082                	ret

0000000000001d92 <link>:

int link(char *old_path, char *new_path)
{
    1d92:	87aa                	mv	a5,a0
    1d94:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1d96:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1d9a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d9e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1da0:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1da4:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1da6:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1daa:	2501                	sext.w	a0,a0
    1dac:	8082                	ret

0000000000001dae <unlink>:

int unlink(char *path)
{
    1dae:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1db0:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1db4:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1db8:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dba:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <uname>:
    register long a7 __asm__("a7") = n;
    1dc2:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1dc6:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <brk>:
    register long a7 __asm__("a7") = n;
    1dce:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1dd2:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <getcwd>:
    register long a7 __asm__("a7") = n;
    1dda:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ddc:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1de0:	8082                	ret

0000000000001de2 <chdir>:
    register long a7 __asm__("a7") = n;
    1de2:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1de6:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1dea:	2501                	sext.w	a0,a0
    1dec:	8082                	ret

0000000000001dee <mkdir>:

int mkdir(const char *path, mode_t mode){
    1dee:	862e                	mv	a2,a1
    1df0:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1df2:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1df4:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1df8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dfc:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dfe:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e00:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <getdents>:
    register long a7 __asm__("a7") = n;
    1e08:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e0c:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <pipe>:
    register long a7 __asm__("a7") = n;
    1e14:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e18:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e1a:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e1e:	2501                	sext.w	a0,a0
    1e20:	8082                	ret

0000000000001e22 <dup>:
    register long a7 __asm__("a7") = n;
    1e22:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e24:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <dup2>:
    register long a7 __asm__("a7") = n;
    1e2c:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e2e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e30:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <mount>:
    register long a7 __asm__("a7") = n;
    1e38:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e3c:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <umount>:
    register long a7 __asm__("a7") = n;
    1e44:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e48:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e4a:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e4e:	2501                	sext.w	a0,a0
    1e50:	8082                	ret

0000000000001e52 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e52:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e54:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e56:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e58:	8532                	mv	a0,a2
	mv a2, a4
    1e5a:	863a                	mv	a2,a4
	mv a3, a5
    1e5c:	86be                	mv	a3,a5
	mv a4, a6
    1e5e:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e60:	0dc00893          	li	a7,220
	ecall
    1e64:	00000073          	ecall

	beqz a0, 1f
    1e68:	c111                	beqz	a0,1e6c <__clone+0x1a>
	# Parent
	ret
    1e6a:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e6c:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e6e:	6522                	ld	a0,8(sp)
	jalr a1
    1e70:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e72:	05d00893          	li	a7,93
	ecall
    1e76:	00000073          	ecall
