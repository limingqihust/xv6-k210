
/home/lmq/lmq/cscc/xv6-k210/test/build/riscv64/write:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a851                	j	1096 <__start_main>

0000000000001004 <test_write>:
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"

void test_write(){
    1004:	1141                	addi	sp,sp,-16
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	e5a50513          	addi	a0,a0,-422 # 1e60 <__clone+0x28>
void test_write(){
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
	TEST_START(__func__);
    1012:	282000ef          	jal	ra,1294 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	eea50513          	addi	a0,a0,-278 # 1f00 <__func__.1191>
    101e:	276000ef          	jal	ra,1294 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	e5650513          	addi	a0,a0,-426 # 1e78 <__clone+0x40>
    102a:	26a000ef          	jal	ra,1294 <puts>
	const char *str = "Hello operating system contest.\n";
	int str_len = strlen(str);
    102e:	00001517          	auipc	a0,0x1
    1032:	e5a50513          	addi	a0,a0,-422 # 1e88 <__clone+0x50>
    1036:	7e6000ef          	jal	ra,181c <strlen>
    103a:	0005041b          	sext.w	s0,a0
	assert(write(STDOUT, str, str_len) == str_len);
    103e:	8622                	mv	a2,s0
    1040:	00001597          	auipc	a1,0x1
    1044:	e4858593          	addi	a1,a1,-440 # 1e88 <__clone+0x50>
    1048:	4505                	li	a0,1
    104a:	3b7000ef          	jal	ra,1c00 <write>
    104e:	00850863          	beq	a0,s0,105e <test_write+0x5a>
    1052:	00001517          	auipc	a0,0x1
    1056:	e5e50513          	addi	a0,a0,-418 # 1eb0 <__clone+0x78>
    105a:	4e4000ef          	jal	ra,153e <panic>
	TEST_END(__func__);
    105e:	00001517          	auipc	a0,0x1
    1062:	e7250513          	addi	a0,a0,-398 # 1ed0 <__clone+0x98>
    1066:	22e000ef          	jal	ra,1294 <puts>
    106a:	00001517          	auipc	a0,0x1
    106e:	e9650513          	addi	a0,a0,-362 # 1f00 <__func__.1191>
    1072:	222000ef          	jal	ra,1294 <puts>
}
    1076:	6402                	ld	s0,0(sp)
    1078:	60a2                	ld	ra,8(sp)
	TEST_END(__func__);
    107a:	00001517          	auipc	a0,0x1
    107e:	dfe50513          	addi	a0,a0,-514 # 1e78 <__clone+0x40>
}
    1082:	0141                	addi	sp,sp,16
	TEST_END(__func__);
    1084:	ac01                	j	1294 <puts>

0000000000001086 <main>:

int main(void) {
    1086:	1141                	addi	sp,sp,-16
    1088:	e406                	sd	ra,8(sp)
	test_write();
    108a:	f7bff0ef          	jal	ra,1004 <test_write>
	return 0;
}
    108e:	60a2                	ld	ra,8(sp)
    1090:	4501                	li	a0,0
    1092:	0141                	addi	sp,sp,16
    1094:	8082                	ret

0000000000001096 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1096:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1098:	4108                	lw	a0,0(a0)
{
    109a:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    109c:	05a1                	addi	a1,a1,8
{
    109e:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10a0:	fe7ff0ef          	jal	ra,1086 <main>
    10a4:	3ad000ef          	jal	ra,1c50 <exit>
	return 0;
}
    10a8:	60a2                	ld	ra,8(sp)
    10aa:	4501                	li	a0,0
    10ac:	0141                	addi	sp,sp,16
    10ae:	8082                	ret

00000000000010b0 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10b0:	7179                	addi	sp,sp,-48
    10b2:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10b4:	12054b63          	bltz	a0,11ea <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10b8:	02b577bb          	remuw	a5,a0,a1
    10bc:	00001697          	auipc	a3,0x1
    10c0:	e5468693          	addi	a3,a3,-428 # 1f10 <digits>
    buf[16] = 0;
    10c4:	00010c23          	sb	zero,24(sp)
    i = 15;
    10c8:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    10cc:	1782                	slli	a5,a5,0x20
    10ce:	9381                	srli	a5,a5,0x20
    10d0:	97b6                	add	a5,a5,a3
    10d2:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10d6:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10da:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10de:	16b56263          	bltu	a0,a1,1242 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    10e2:	02e8763b          	remuw	a2,a6,a4
    10e6:	1602                	slli	a2,a2,0x20
    10e8:	9201                	srli	a2,a2,0x20
    10ea:	9636                	add	a2,a2,a3
    10ec:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10f0:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    10f4:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10f8:	12e86963          	bltu	a6,a4,122a <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    10fc:	02e5f63b          	remuw	a2,a1,a4
    1100:	1602                	slli	a2,a2,0x20
    1102:	9201                	srli	a2,a2,0x20
    1104:	9636                	add	a2,a2,a3
    1106:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    110a:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    110e:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1112:	10e5ef63          	bltu	a1,a4,1230 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1116:	02e8763b          	remuw	a2,a6,a4
    111a:	1602                	slli	a2,a2,0x20
    111c:	9201                	srli	a2,a2,0x20
    111e:	9636                	add	a2,a2,a3
    1120:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1124:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1128:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    112c:	10e86563          	bltu	a6,a4,1236 <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    1130:	02e5f63b          	remuw	a2,a1,a4
    1134:	1602                	slli	a2,a2,0x20
    1136:	9201                	srli	a2,a2,0x20
    1138:	9636                	add	a2,a2,a3
    113a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    113e:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1142:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1146:	0ee5eb63          	bltu	a1,a4,123c <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    114a:	02e8763b          	remuw	a2,a6,a4
    114e:	1602                	slli	a2,a2,0x20
    1150:	9201                	srli	a2,a2,0x20
    1152:	9636                	add	a2,a2,a3
    1154:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1158:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    115c:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1160:	0ce86263          	bltu	a6,a4,1224 <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    1164:	02e5f63b          	remuw	a2,a1,a4
    1168:	1602                	slli	a2,a2,0x20
    116a:	9201                	srli	a2,a2,0x20
    116c:	9636                	add	a2,a2,a3
    116e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1172:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1176:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    117a:	0ce5e663          	bltu	a1,a4,1246 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    117e:	02e8763b          	remuw	a2,a6,a4
    1182:	1602                	slli	a2,a2,0x20
    1184:	9201                	srli	a2,a2,0x20
    1186:	9636                	add	a2,a2,a3
    1188:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    118c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1190:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1194:	0ae86c63          	bltu	a6,a4,124c <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    1198:	02e5f63b          	remuw	a2,a1,a4
    119c:	1602                	slli	a2,a2,0x20
    119e:	9201                	srli	a2,a2,0x20
    11a0:	9636                	add	a2,a2,a3
    11a2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a6:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11aa:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11ae:	0ae5e263          	bltu	a1,a4,1252 <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    11b2:	1782                	slli	a5,a5,0x20
    11b4:	9381                	srli	a5,a5,0x20
    11b6:	97b6                	add	a5,a5,a3
    11b8:	0007c703          	lbu	a4,0(a5)
    11bc:	4599                	li	a1,6
    11be:	4795                	li	a5,5
    11c0:	00e10723          	sb	a4,14(sp)

    if (sign)
    11c4:	00055963          	bgez	a0,11d6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    11c8:	1018                	addi	a4,sp,32
    11ca:	973e                	add	a4,a4,a5
    11cc:	02d00693          	li	a3,45
    11d0:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    11d4:	85be                	mv	a1,a5
    write(f, s, l);
    11d6:	003c                	addi	a5,sp,8
    11d8:	4641                	li	a2,16
    11da:	9e0d                	subw	a2,a2,a1
    11dc:	4505                	li	a0,1
    11de:	95be                	add	a1,a1,a5
    11e0:	221000ef          	jal	ra,1c00 <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11e4:	70a2                	ld	ra,40(sp)
    11e6:	6145                	addi	sp,sp,48
    11e8:	8082                	ret
        x = -xx;
    11ea:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    11ee:	02b677bb          	remuw	a5,a2,a1
    11f2:	00001697          	auipc	a3,0x1
    11f6:	d1e68693          	addi	a3,a3,-738 # 1f10 <digits>
    buf[16] = 0;
    11fa:	00010c23          	sb	zero,24(sp)
    i = 15;
    11fe:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    1202:	1782                	slli	a5,a5,0x20
    1204:	9381                	srli	a5,a5,0x20
    1206:	97b6                	add	a5,a5,a3
    1208:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    120c:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1210:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1214:	ecb677e3          	bgeu	a2,a1,10e2 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1218:	02d00793          	li	a5,45
    121c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1220:	45b9                	li	a1,14
    1222:	bf55                	j	11d6 <printint.constprop.0+0x126>
    1224:	47a5                	li	a5,9
    1226:	45a9                	li	a1,10
    1228:	bf71                	j	11c4 <printint.constprop.0+0x114>
    122a:	47b5                	li	a5,13
    122c:	45b9                	li	a1,14
    122e:	bf59                	j	11c4 <printint.constprop.0+0x114>
    1230:	47b1                	li	a5,12
    1232:	45b5                	li	a1,13
    1234:	bf41                	j	11c4 <printint.constprop.0+0x114>
    1236:	47ad                	li	a5,11
    1238:	45b1                	li	a1,12
    123a:	b769                	j	11c4 <printint.constprop.0+0x114>
    123c:	47a9                	li	a5,10
    123e:	45ad                	li	a1,11
    1240:	b751                	j	11c4 <printint.constprop.0+0x114>
    i = 15;
    1242:	45bd                	li	a1,15
    1244:	bf49                	j	11d6 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1246:	47a1                	li	a5,8
    1248:	45a5                	li	a1,9
    124a:	bfad                	j	11c4 <printint.constprop.0+0x114>
    124c:	479d                	li	a5,7
    124e:	45a1                	li	a1,8
    1250:	bf95                	j	11c4 <printint.constprop.0+0x114>
    1252:	4799                	li	a5,6
    1254:	459d                	li	a1,7
    1256:	b7bd                	j	11c4 <printint.constprop.0+0x114>

0000000000001258 <getchar>:
{
    1258:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    125a:	00f10593          	addi	a1,sp,15
    125e:	4605                	li	a2,1
    1260:	4501                	li	a0,0
{
    1262:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1264:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1268:	18f000ef          	jal	ra,1bf6 <read>
}
    126c:	60e2                	ld	ra,24(sp)
    126e:	00f14503          	lbu	a0,15(sp)
    1272:	6105                	addi	sp,sp,32
    1274:	8082                	ret

0000000000001276 <putchar>:
{
    1276:	1101                	addi	sp,sp,-32
    1278:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    127a:	00f10593          	addi	a1,sp,15
    127e:	4605                	li	a2,1
    1280:	4505                	li	a0,1
{
    1282:	ec06                	sd	ra,24(sp)
    char byte = c;
    1284:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1288:	179000ef          	jal	ra,1c00 <write>
}
    128c:	60e2                	ld	ra,24(sp)
    128e:	2501                	sext.w	a0,a0
    1290:	6105                	addi	sp,sp,32
    1292:	8082                	ret

0000000000001294 <puts>:
{
    1294:	1141                	addi	sp,sp,-16
    1296:	e406                	sd	ra,8(sp)
    1298:	e022                	sd	s0,0(sp)
    129a:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    129c:	580000ef          	jal	ra,181c <strlen>
    12a0:	862a                	mv	a2,a0
    12a2:	85a2                	mv	a1,s0
    12a4:	4505                	li	a0,1
    12a6:	15b000ef          	jal	ra,1c00 <write>
}
    12aa:	60a2                	ld	ra,8(sp)
    12ac:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12ae:	957d                	srai	a0,a0,0x3f
    return r;
    12b0:	2501                	sext.w	a0,a0
}
    12b2:	0141                	addi	sp,sp,16
    12b4:	8082                	ret

00000000000012b6 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12b6:	7171                	addi	sp,sp,-176
    12b8:	fc56                	sd	s5,56(sp)
    12ba:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    12bc:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12be:	18bc                	addi	a5,sp,120
{
    12c0:	e8ca                	sd	s2,80(sp)
    12c2:	e4ce                	sd	s3,72(sp)
    12c4:	e0d2                	sd	s4,64(sp)
    12c6:	f85a                	sd	s6,48(sp)
    12c8:	f486                	sd	ra,104(sp)
    12ca:	f0a2                	sd	s0,96(sp)
    12cc:	eca6                	sd	s1,88(sp)
    12ce:	fcae                	sd	a1,120(sp)
    12d0:	e132                	sd	a2,128(sp)
    12d2:	e536                	sd	a3,136(sp)
    12d4:	e93a                	sd	a4,144(sp)
    12d6:	f142                	sd	a6,160(sp)
    12d8:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    12da:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12dc:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    12e0:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    12e4:	00001b17          	auipc	s6,0x1
    12e8:	bfcb0b13          	addi	s6,s6,-1028 # 1ee0 <__clone+0xa8>
    buf[i++] = '0';
    12ec:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12f0:	00001997          	auipc	s3,0x1
    12f4:	c2098993          	addi	s3,s3,-992 # 1f10 <digits>
        if (!*s)
    12f8:	00054783          	lbu	a5,0(a0)
    12fc:	16078a63          	beqz	a5,1470 <printf+0x1ba>
    1300:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1302:	19278163          	beq	a5,s2,1484 <printf+0x1ce>
    1306:	00164783          	lbu	a5,1(a2)
    130a:	0605                	addi	a2,a2,1
    130c:	fbfd                	bnez	a5,1302 <printf+0x4c>
    130e:	84b2                	mv	s1,a2
        l = z - a;
    1310:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1314:	85aa                	mv	a1,a0
    1316:	8622                	mv	a2,s0
    1318:	4505                	li	a0,1
    131a:	0e7000ef          	jal	ra,1c00 <write>
        if (l)
    131e:	18041c63          	bnez	s0,14b6 <printf+0x200>
        if (s[1] == 0)
    1322:	0014c783          	lbu	a5,1(s1)
    1326:	14078563          	beqz	a5,1470 <printf+0x1ba>
        switch (s[1])
    132a:	1d478063          	beq	a5,s4,14ea <printf+0x234>
    132e:	18fa6663          	bltu	s4,a5,14ba <printf+0x204>
    1332:	06400713          	li	a4,100
    1336:	1ae78063          	beq	a5,a4,14d6 <printf+0x220>
    133a:	07000713          	li	a4,112
    133e:	1ce79963          	bne	a5,a4,1510 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    1342:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1344:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1348:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    134a:	631c                	ld	a5,0(a4)
    134c:	0721                	addi	a4,a4,8
    134e:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1350:	00479293          	slli	t0,a5,0x4
    1354:	00879f93          	slli	t6,a5,0x8
    1358:	00c79f13          	slli	t5,a5,0xc
    135c:	01079e93          	slli	t4,a5,0x10
    1360:	01479e13          	slli	t3,a5,0x14
    1364:	01879313          	slli	t1,a5,0x18
    1368:	01c79893          	slli	a7,a5,0x1c
    136c:	02479813          	slli	a6,a5,0x24
    1370:	02879513          	slli	a0,a5,0x28
    1374:	02c79593          	slli	a1,a5,0x2c
    1378:	03079693          	slli	a3,a5,0x30
    137c:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1380:	03c7d413          	srli	s0,a5,0x3c
    1384:	01c7d39b          	srliw	t2,a5,0x1c
    1388:	03c2d293          	srli	t0,t0,0x3c
    138c:	03cfdf93          	srli	t6,t6,0x3c
    1390:	03cf5f13          	srli	t5,t5,0x3c
    1394:	03cede93          	srli	t4,t4,0x3c
    1398:	03ce5e13          	srli	t3,t3,0x3c
    139c:	03c35313          	srli	t1,t1,0x3c
    13a0:	03c8d893          	srli	a7,a7,0x3c
    13a4:	03c85813          	srli	a6,a6,0x3c
    13a8:	9171                	srli	a0,a0,0x3c
    13aa:	91f1                	srli	a1,a1,0x3c
    13ac:	92f1                	srli	a3,a3,0x3c
    13ae:	9371                	srli	a4,a4,0x3c
    13b0:	96ce                	add	a3,a3,s3
    13b2:	974e                	add	a4,a4,s3
    13b4:	944e                	add	s0,s0,s3
    13b6:	92ce                	add	t0,t0,s3
    13b8:	9fce                	add	t6,t6,s3
    13ba:	9f4e                	add	t5,t5,s3
    13bc:	9ece                	add	t4,t4,s3
    13be:	9e4e                	add	t3,t3,s3
    13c0:	934e                	add	t1,t1,s3
    13c2:	98ce                	add	a7,a7,s3
    13c4:	93ce                	add	t2,t2,s3
    13c6:	984e                	add	a6,a6,s3
    13c8:	954e                	add	a0,a0,s3
    13ca:	95ce                	add	a1,a1,s3
    13cc:	0006c083          	lbu	ra,0(a3)
    13d0:	0002c283          	lbu	t0,0(t0)
    13d4:	00074683          	lbu	a3,0(a4)
    13d8:	000fcf83          	lbu	t6,0(t6)
    13dc:	000f4f03          	lbu	t5,0(t5)
    13e0:	000ece83          	lbu	t4,0(t4)
    13e4:	000e4e03          	lbu	t3,0(t3)
    13e8:	00034303          	lbu	t1,0(t1)
    13ec:	0008c883          	lbu	a7,0(a7)
    13f0:	0003c383          	lbu	t2,0(t2)
    13f4:	00084803          	lbu	a6,0(a6)
    13f8:	00054503          	lbu	a0,0(a0)
    13fc:	0005c583          	lbu	a1,0(a1)
    1400:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1404:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1408:	9371                	srli	a4,a4,0x3c
    140a:	8bbd                	andi	a5,a5,15
    140c:	974e                	add	a4,a4,s3
    140e:	97ce                	add	a5,a5,s3
    1410:	005105a3          	sb	t0,11(sp)
    1414:	01f10623          	sb	t6,12(sp)
    1418:	01e106a3          	sb	t5,13(sp)
    141c:	01d10723          	sb	t4,14(sp)
    1420:	01c107a3          	sb	t3,15(sp)
    1424:	00610823          	sb	t1,16(sp)
    1428:	011108a3          	sb	a7,17(sp)
    142c:	00710923          	sb	t2,18(sp)
    1430:	010109a3          	sb	a6,19(sp)
    1434:	00a10a23          	sb	a0,20(sp)
    1438:	00b10aa3          	sb	a1,21(sp)
    143c:	00110b23          	sb	ra,22(sp)
    1440:	00d10ba3          	sb	a3,23(sp)
    1444:	00810523          	sb	s0,10(sp)
    1448:	00074703          	lbu	a4,0(a4)
    144c:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1450:	002c                	addi	a1,sp,8
    1452:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1454:	00e10c23          	sb	a4,24(sp)
    1458:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    145c:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1460:	7a0000ef          	jal	ra,1c00 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1464:	00248513          	addi	a0,s1,2
        if (!*s)
    1468:	00054783          	lbu	a5,0(a0)
    146c:	e8079ae3          	bnez	a5,1300 <printf+0x4a>
    }
    va_end(ap);
}
    1470:	70a6                	ld	ra,104(sp)
    1472:	7406                	ld	s0,96(sp)
    1474:	64e6                	ld	s1,88(sp)
    1476:	6946                	ld	s2,80(sp)
    1478:	69a6                	ld	s3,72(sp)
    147a:	6a06                	ld	s4,64(sp)
    147c:	7ae2                	ld	s5,56(sp)
    147e:	7b42                	ld	s6,48(sp)
    1480:	614d                	addi	sp,sp,176
    1482:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1484:	00064783          	lbu	a5,0(a2)
    1488:	84b2                	mv	s1,a2
    148a:	01278963          	beq	a5,s2,149c <printf+0x1e6>
    148e:	b549                	j	1310 <printf+0x5a>
    1490:	0024c783          	lbu	a5,2(s1)
    1494:	0605                	addi	a2,a2,1
    1496:	0489                	addi	s1,s1,2
    1498:	e7279ce3          	bne	a5,s2,1310 <printf+0x5a>
    149c:	0014c783          	lbu	a5,1(s1)
    14a0:	ff2788e3          	beq	a5,s2,1490 <printf+0x1da>
        l = z - a;
    14a4:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14a8:	85aa                	mv	a1,a0
    14aa:	8622                	mv	a2,s0
    14ac:	4505                	li	a0,1
    14ae:	752000ef          	jal	ra,1c00 <write>
        if (l)
    14b2:	e60408e3          	beqz	s0,1322 <printf+0x6c>
    14b6:	8526                	mv	a0,s1
    14b8:	b581                	j	12f8 <printf+0x42>
        switch (s[1])
    14ba:	07800713          	li	a4,120
    14be:	04e79963          	bne	a5,a4,1510 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    14c2:	6782                	ld	a5,0(sp)
    14c4:	45c1                	li	a1,16
    14c6:	4388                	lw	a0,0(a5)
    14c8:	07a1                	addi	a5,a5,8
    14ca:	e03e                	sd	a5,0(sp)
    14cc:	be5ff0ef          	jal	ra,10b0 <printint.constprop.0>
        s += 2;
    14d0:	00248513          	addi	a0,s1,2
    14d4:	bf51                	j	1468 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    14d6:	6782                	ld	a5,0(sp)
    14d8:	45a9                	li	a1,10
    14da:	4388                	lw	a0,0(a5)
    14dc:	07a1                	addi	a5,a5,8
    14de:	e03e                	sd	a5,0(sp)
    14e0:	bd1ff0ef          	jal	ra,10b0 <printint.constprop.0>
        s += 2;
    14e4:	00248513          	addi	a0,s1,2
    14e8:	b741                	j	1468 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    14ea:	6782                	ld	a5,0(sp)
    14ec:	6380                	ld	s0,0(a5)
    14ee:	07a1                	addi	a5,a5,8
    14f0:	e03e                	sd	a5,0(sp)
    14f2:	c421                	beqz	s0,153a <printf+0x284>
            l = strnlen(a, 200);
    14f4:	0c800593          	li	a1,200
    14f8:	8522                	mv	a0,s0
    14fa:	40e000ef          	jal	ra,1908 <strnlen>
    write(f, s, l);
    14fe:	0005061b          	sext.w	a2,a0
    1502:	85a2                	mv	a1,s0
    1504:	4505                	li	a0,1
    1506:	6fa000ef          	jal	ra,1c00 <write>
        s += 2;
    150a:	00248513          	addi	a0,s1,2
    150e:	bfa9                	j	1468 <printf+0x1b2>
    char byte = c;
    1510:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1514:	4605                	li	a2,1
    1516:	002c                	addi	a1,sp,8
    1518:	4505                	li	a0,1
    char byte = c;
    151a:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    151e:	6e2000ef          	jal	ra,1c00 <write>
    char byte = c;
    1522:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1526:	4605                	li	a2,1
    1528:	002c                	addi	a1,sp,8
    152a:	4505                	li	a0,1
    char byte = c;
    152c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1530:	6d0000ef          	jal	ra,1c00 <write>
        s += 2;
    1534:	00248513          	addi	a0,s1,2
    1538:	bf05                	j	1468 <printf+0x1b2>
                a = "(null)";
    153a:	845a                	mv	s0,s6
    153c:	bf65                	j	14f4 <printf+0x23e>

000000000000153e <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    153e:	1141                	addi	sp,sp,-16
    1540:	e406                	sd	ra,8(sp)
    puts(m);
    1542:	d53ff0ef          	jal	ra,1294 <puts>
    exit(-100);
}
    1546:	60a2                	ld	ra,8(sp)
    exit(-100);
    1548:	f9c00513          	li	a0,-100
}
    154c:	0141                	addi	sp,sp,16
    exit(-100);
    154e:	a709                	j	1c50 <exit>

0000000000001550 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1550:	02000793          	li	a5,32
    1554:	00f50663          	beq	a0,a5,1560 <isspace+0x10>
    1558:	355d                	addiw	a0,a0,-9
    155a:	00553513          	sltiu	a0,a0,5
    155e:	8082                	ret
    1560:	4505                	li	a0,1
}
    1562:	8082                	ret

0000000000001564 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1564:	fd05051b          	addiw	a0,a0,-48
}
    1568:	00a53513          	sltiu	a0,a0,10
    156c:	8082                	ret

000000000000156e <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    156e:	02000613          	li	a2,32
    1572:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1574:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1578:	ff77069b          	addiw	a3,a4,-9
    157c:	04c70d63          	beq	a4,a2,15d6 <atoi+0x68>
    1580:	0007079b          	sext.w	a5,a4
    1584:	04d5f963          	bgeu	a1,a3,15d6 <atoi+0x68>
        s++;
    switch (*s)
    1588:	02b00693          	li	a3,43
    158c:	04d70a63          	beq	a4,a3,15e0 <atoi+0x72>
    1590:	02d00693          	li	a3,45
    1594:	06d70463          	beq	a4,a3,15fc <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1598:	fd07859b          	addiw	a1,a5,-48
    159c:	4625                	li	a2,9
    159e:	873e                	mv	a4,a5
    15a0:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15a2:	4e01                	li	t3,0
    while (isdigit(*s))
    15a4:	04b66a63          	bltu	a2,a1,15f8 <atoi+0x8a>
    int n = 0, neg = 0;
    15a8:	4501                	li	a0,0
    while (isdigit(*s))
    15aa:	4825                	li	a6,9
    15ac:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    15b0:	0025179b          	slliw	a5,a0,0x2
    15b4:	9d3d                	addw	a0,a0,a5
    15b6:	fd07031b          	addiw	t1,a4,-48
    15ba:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15be:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15c2:	0685                	addi	a3,a3,1
    15c4:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15c8:	0006071b          	sext.w	a4,a2
    15cc:	feb870e3          	bgeu	a6,a1,15ac <atoi+0x3e>
    return neg ? n : -n;
    15d0:	000e0563          	beqz	t3,15da <atoi+0x6c>
}
    15d4:	8082                	ret
        s++;
    15d6:	0505                	addi	a0,a0,1
    15d8:	bf71                	j	1574 <atoi+0x6>
    15da:	4113053b          	subw	a0,t1,a7
    15de:	8082                	ret
    while (isdigit(*s))
    15e0:	00154783          	lbu	a5,1(a0)
    15e4:	4625                	li	a2,9
        s++;
    15e6:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    15ea:	fd07859b          	addiw	a1,a5,-48
    15ee:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    15f2:	4e01                	li	t3,0
    while (isdigit(*s))
    15f4:	fab67ae3          	bgeu	a2,a1,15a8 <atoi+0x3a>
    15f8:	4501                	li	a0,0
}
    15fa:	8082                	ret
    while (isdigit(*s))
    15fc:	00154783          	lbu	a5,1(a0)
    1600:	4625                	li	a2,9
        s++;
    1602:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1606:	fd07859b          	addiw	a1,a5,-48
    160a:	0007871b          	sext.w	a4,a5
    160e:	feb665e3          	bltu	a2,a1,15f8 <atoi+0x8a>
        neg = 1;
    1612:	4e05                	li	t3,1
    1614:	bf51                	j	15a8 <atoi+0x3a>

0000000000001616 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1616:	16060d63          	beqz	a2,1790 <memset+0x17a>
    161a:	40a007b3          	neg	a5,a0
    161e:	8b9d                	andi	a5,a5,7
    1620:	00778713          	addi	a4,a5,7
    1624:	482d                	li	a6,11
    1626:	0ff5f593          	andi	a1,a1,255
    162a:	fff60693          	addi	a3,a2,-1
    162e:	17076263          	bltu	a4,a6,1792 <memset+0x17c>
    1632:	16e6ea63          	bltu	a3,a4,17a6 <memset+0x190>
    1636:	16078563          	beqz	a5,17a0 <memset+0x18a>
    163a:	00b50023          	sb	a1,0(a0)
    163e:	4705                	li	a4,1
    1640:	00150e93          	addi	t4,a0,1
    1644:	14e78c63          	beq	a5,a4,179c <memset+0x186>
    1648:	00b500a3          	sb	a1,1(a0)
    164c:	4709                	li	a4,2
    164e:	00250e93          	addi	t4,a0,2
    1652:	14e78d63          	beq	a5,a4,17ac <memset+0x196>
    1656:	00b50123          	sb	a1,2(a0)
    165a:	470d                	li	a4,3
    165c:	00350e93          	addi	t4,a0,3
    1660:	12e78b63          	beq	a5,a4,1796 <memset+0x180>
    1664:	00b501a3          	sb	a1,3(a0)
    1668:	4711                	li	a4,4
    166a:	00450e93          	addi	t4,a0,4
    166e:	14e78163          	beq	a5,a4,17b0 <memset+0x19a>
    1672:	00b50223          	sb	a1,4(a0)
    1676:	4715                	li	a4,5
    1678:	00550e93          	addi	t4,a0,5
    167c:	12e78c63          	beq	a5,a4,17b4 <memset+0x19e>
    1680:	00b502a3          	sb	a1,5(a0)
    1684:	471d                	li	a4,7
    1686:	00650e93          	addi	t4,a0,6
    168a:	12e79763          	bne	a5,a4,17b8 <memset+0x1a2>
    168e:	00750e93          	addi	t4,a0,7
    1692:	00b50323          	sb	a1,6(a0)
    1696:	4f1d                	li	t5,7
    1698:	00859713          	slli	a4,a1,0x8
    169c:	8f4d                	or	a4,a4,a1
    169e:	01059e13          	slli	t3,a1,0x10
    16a2:	01c76e33          	or	t3,a4,t3
    16a6:	01859313          	slli	t1,a1,0x18
    16aa:	006e6333          	or	t1,t3,t1
    16ae:	02059893          	slli	a7,a1,0x20
    16b2:	011368b3          	or	a7,t1,a7
    16b6:	02859813          	slli	a6,a1,0x28
    16ba:	40f60333          	sub	t1,a2,a5
    16be:	0108e833          	or	a6,a7,a6
    16c2:	03059693          	slli	a3,a1,0x30
    16c6:	00d866b3          	or	a3,a6,a3
    16ca:	03859713          	slli	a4,a1,0x38
    16ce:	97aa                	add	a5,a5,a0
    16d0:	ff837813          	andi	a6,t1,-8
    16d4:	8f55                	or	a4,a4,a3
    16d6:	00f806b3          	add	a3,a6,a5
    16da:	e398                	sd	a4,0(a5)
    16dc:	07a1                	addi	a5,a5,8
    16de:	fed79ee3          	bne	a5,a3,16da <memset+0xc4>
    16e2:	ff837693          	andi	a3,t1,-8
    16e6:	00de87b3          	add	a5,t4,a3
    16ea:	01e6873b          	addw	a4,a3,t5
    16ee:	0ad30663          	beq	t1,a3,179a <memset+0x184>
    16f2:	00b78023          	sb	a1,0(a5)
    16f6:	0017069b          	addiw	a3,a4,1
    16fa:	08c6fb63          	bgeu	a3,a2,1790 <memset+0x17a>
    16fe:	00b780a3          	sb	a1,1(a5)
    1702:	0027069b          	addiw	a3,a4,2
    1706:	08c6f563          	bgeu	a3,a2,1790 <memset+0x17a>
    170a:	00b78123          	sb	a1,2(a5)
    170e:	0037069b          	addiw	a3,a4,3
    1712:	06c6ff63          	bgeu	a3,a2,1790 <memset+0x17a>
    1716:	00b781a3          	sb	a1,3(a5)
    171a:	0047069b          	addiw	a3,a4,4
    171e:	06c6f963          	bgeu	a3,a2,1790 <memset+0x17a>
    1722:	00b78223          	sb	a1,4(a5)
    1726:	0057069b          	addiw	a3,a4,5
    172a:	06c6f363          	bgeu	a3,a2,1790 <memset+0x17a>
    172e:	00b782a3          	sb	a1,5(a5)
    1732:	0067069b          	addiw	a3,a4,6
    1736:	04c6fd63          	bgeu	a3,a2,1790 <memset+0x17a>
    173a:	00b78323          	sb	a1,6(a5)
    173e:	0077069b          	addiw	a3,a4,7
    1742:	04c6f763          	bgeu	a3,a2,1790 <memset+0x17a>
    1746:	00b783a3          	sb	a1,7(a5)
    174a:	0087069b          	addiw	a3,a4,8
    174e:	04c6f163          	bgeu	a3,a2,1790 <memset+0x17a>
    1752:	00b78423          	sb	a1,8(a5)
    1756:	0097069b          	addiw	a3,a4,9
    175a:	02c6fb63          	bgeu	a3,a2,1790 <memset+0x17a>
    175e:	00b784a3          	sb	a1,9(a5)
    1762:	00a7069b          	addiw	a3,a4,10
    1766:	02c6f563          	bgeu	a3,a2,1790 <memset+0x17a>
    176a:	00b78523          	sb	a1,10(a5)
    176e:	00b7069b          	addiw	a3,a4,11
    1772:	00c6ff63          	bgeu	a3,a2,1790 <memset+0x17a>
    1776:	00b785a3          	sb	a1,11(a5)
    177a:	00c7069b          	addiw	a3,a4,12
    177e:	00c6f963          	bgeu	a3,a2,1790 <memset+0x17a>
    1782:	00b78623          	sb	a1,12(a5)
    1786:	2735                	addiw	a4,a4,13
    1788:	00c77463          	bgeu	a4,a2,1790 <memset+0x17a>
    178c:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1790:	8082                	ret
    1792:	472d                	li	a4,11
    1794:	bd79                	j	1632 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1796:	4f0d                	li	t5,3
    1798:	b701                	j	1698 <memset+0x82>
    179a:	8082                	ret
    179c:	4f05                	li	t5,1
    179e:	bded                	j	1698 <memset+0x82>
    17a0:	8eaa                	mv	t4,a0
    17a2:	4f01                	li	t5,0
    17a4:	bdd5                	j	1698 <memset+0x82>
    17a6:	87aa                	mv	a5,a0
    17a8:	4701                	li	a4,0
    17aa:	b7a1                	j	16f2 <memset+0xdc>
    17ac:	4f09                	li	t5,2
    17ae:	b5ed                	j	1698 <memset+0x82>
    17b0:	4f11                	li	t5,4
    17b2:	b5dd                	j	1698 <memset+0x82>
    17b4:	4f15                	li	t5,5
    17b6:	b5cd                	j	1698 <memset+0x82>
    17b8:	4f19                	li	t5,6
    17ba:	bdf9                	j	1698 <memset+0x82>

00000000000017bc <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17bc:	00054783          	lbu	a5,0(a0)
    17c0:	0005c703          	lbu	a4,0(a1)
    17c4:	00e79863          	bne	a5,a4,17d4 <strcmp+0x18>
    17c8:	0505                	addi	a0,a0,1
    17ca:	0585                	addi	a1,a1,1
    17cc:	fbe5                	bnez	a5,17bc <strcmp>
    17ce:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17d0:	9d19                	subw	a0,a0,a4
    17d2:	8082                	ret
    17d4:	0007851b          	sext.w	a0,a5
    17d8:	bfe5                	j	17d0 <strcmp+0x14>

00000000000017da <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17da:	ce05                	beqz	a2,1812 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17dc:	00054703          	lbu	a4,0(a0)
    17e0:	0005c783          	lbu	a5,0(a1)
    17e4:	cb0d                	beqz	a4,1816 <strncmp+0x3c>
    if (!n--)
    17e6:	167d                	addi	a2,a2,-1
    17e8:	00c506b3          	add	a3,a0,a2
    17ec:	a819                	j	1802 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17ee:	00a68e63          	beq	a3,a0,180a <strncmp+0x30>
    17f2:	0505                	addi	a0,a0,1
    17f4:	00e79b63          	bne	a5,a4,180a <strncmp+0x30>
    17f8:	00054703          	lbu	a4,0(a0)
    17fc:	0005c783          	lbu	a5,0(a1)
    1800:	cb19                	beqz	a4,1816 <strncmp+0x3c>
    1802:	0005c783          	lbu	a5,0(a1)
    1806:	0585                	addi	a1,a1,1
    1808:	f3fd                	bnez	a5,17ee <strncmp+0x14>
        ;
    return *l - *r;
    180a:	0007051b          	sext.w	a0,a4
    180e:	9d1d                	subw	a0,a0,a5
    1810:	8082                	ret
        return 0;
    1812:	4501                	li	a0,0
}
    1814:	8082                	ret
    1816:	4501                	li	a0,0
    return *l - *r;
    1818:	9d1d                	subw	a0,a0,a5
    181a:	8082                	ret

000000000000181c <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    181c:	00757793          	andi	a5,a0,7
    1820:	cf89                	beqz	a5,183a <strlen+0x1e>
    1822:	87aa                	mv	a5,a0
    1824:	a029                	j	182e <strlen+0x12>
    1826:	0785                	addi	a5,a5,1
    1828:	0077f713          	andi	a4,a5,7
    182c:	cb01                	beqz	a4,183c <strlen+0x20>
        if (!*s)
    182e:	0007c703          	lbu	a4,0(a5)
    1832:	fb75                	bnez	a4,1826 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1834:	40a78533          	sub	a0,a5,a0
}
    1838:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    183a:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    183c:	6394                	ld	a3,0(a5)
    183e:	00000597          	auipc	a1,0x0
    1842:	6aa5b583          	ld	a1,1706(a1) # 1ee8 <__clone+0xb0>
    1846:	00000617          	auipc	a2,0x0
    184a:	6aa63603          	ld	a2,1706(a2) # 1ef0 <__clone+0xb8>
    184e:	a019                	j	1854 <strlen+0x38>
    1850:	6794                	ld	a3,8(a5)
    1852:	07a1                	addi	a5,a5,8
    1854:	00b68733          	add	a4,a3,a1
    1858:	fff6c693          	not	a3,a3
    185c:	8f75                	and	a4,a4,a3
    185e:	8f71                	and	a4,a4,a2
    1860:	db65                	beqz	a4,1850 <strlen+0x34>
    for (; *s; s++)
    1862:	0007c703          	lbu	a4,0(a5)
    1866:	d779                	beqz	a4,1834 <strlen+0x18>
    1868:	0017c703          	lbu	a4,1(a5)
    186c:	0785                	addi	a5,a5,1
    186e:	d379                	beqz	a4,1834 <strlen+0x18>
    1870:	0017c703          	lbu	a4,1(a5)
    1874:	0785                	addi	a5,a5,1
    1876:	fb6d                	bnez	a4,1868 <strlen+0x4c>
    1878:	bf75                	j	1834 <strlen+0x18>

000000000000187a <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    187a:	00757713          	andi	a4,a0,7
{
    187e:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1880:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1884:	cb19                	beqz	a4,189a <memchr+0x20>
    1886:	ce25                	beqz	a2,18fe <memchr+0x84>
    1888:	0007c703          	lbu	a4,0(a5)
    188c:	04b70e63          	beq	a4,a1,18e8 <memchr+0x6e>
    1890:	0785                	addi	a5,a5,1
    1892:	0077f713          	andi	a4,a5,7
    1896:	167d                	addi	a2,a2,-1
    1898:	f77d                	bnez	a4,1886 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    189a:	4501                	li	a0,0
    if (n && *s != c)
    189c:	c235                	beqz	a2,1900 <memchr+0x86>
    189e:	0007c703          	lbu	a4,0(a5)
    18a2:	04b70363          	beq	a4,a1,18e8 <memchr+0x6e>
        size_t k = ONES * c;
    18a6:	00000517          	auipc	a0,0x0
    18aa:	65253503          	ld	a0,1618(a0) # 1ef8 <__clone+0xc0>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18ae:	471d                	li	a4,7
        size_t k = ONES * c;
    18b0:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18b4:	02c77a63          	bgeu	a4,a2,18e8 <memchr+0x6e>
    18b8:	00000897          	auipc	a7,0x0
    18bc:	6308b883          	ld	a7,1584(a7) # 1ee8 <__clone+0xb0>
    18c0:	00000817          	auipc	a6,0x0
    18c4:	63083803          	ld	a6,1584(a6) # 1ef0 <__clone+0xb8>
    18c8:	431d                	li	t1,7
    18ca:	a029                	j	18d4 <memchr+0x5a>
    18cc:	1661                	addi	a2,a2,-8
    18ce:	07a1                	addi	a5,a5,8
    18d0:	02c37963          	bgeu	t1,a2,1902 <memchr+0x88>
    18d4:	6398                	ld	a4,0(a5)
    18d6:	8f29                	xor	a4,a4,a0
    18d8:	011706b3          	add	a3,a4,a7
    18dc:	fff74713          	not	a4,a4
    18e0:	8f75                	and	a4,a4,a3
    18e2:	01077733          	and	a4,a4,a6
    18e6:	d37d                	beqz	a4,18cc <memchr+0x52>
    18e8:	853e                	mv	a0,a5
    18ea:	97b2                	add	a5,a5,a2
    18ec:	a021                	j	18f4 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    18ee:	0505                	addi	a0,a0,1
    18f0:	00f50763          	beq	a0,a5,18fe <memchr+0x84>
    18f4:	00054703          	lbu	a4,0(a0)
    18f8:	feb71be3          	bne	a4,a1,18ee <memchr+0x74>
    18fc:	8082                	ret
    return n ? (void *)s : 0;
    18fe:	4501                	li	a0,0
}
    1900:	8082                	ret
    return n ? (void *)s : 0;
    1902:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1904:	f275                	bnez	a2,18e8 <memchr+0x6e>
}
    1906:	8082                	ret

0000000000001908 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1908:	1101                	addi	sp,sp,-32
    190a:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    190c:	862e                	mv	a2,a1
{
    190e:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1910:	4581                	li	a1,0
{
    1912:	e426                	sd	s1,8(sp)
    1914:	ec06                	sd	ra,24(sp)
    1916:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1918:	f63ff0ef          	jal	ra,187a <memchr>
    return p ? p - s : n;
    191c:	c519                	beqz	a0,192a <strnlen+0x22>
}
    191e:	60e2                	ld	ra,24(sp)
    1920:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1922:	8d05                	sub	a0,a0,s1
}
    1924:	64a2                	ld	s1,8(sp)
    1926:	6105                	addi	sp,sp,32
    1928:	8082                	ret
    192a:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    192c:	8522                	mv	a0,s0
}
    192e:	6442                	ld	s0,16(sp)
    1930:	64a2                	ld	s1,8(sp)
    1932:	6105                	addi	sp,sp,32
    1934:	8082                	ret

0000000000001936 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1936:	00b547b3          	xor	a5,a0,a1
    193a:	8b9d                	andi	a5,a5,7
    193c:	eb95                	bnez	a5,1970 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    193e:	0075f793          	andi	a5,a1,7
    1942:	e7b1                	bnez	a5,198e <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1944:	6198                	ld	a4,0(a1)
    1946:	00000617          	auipc	a2,0x0
    194a:	5a263603          	ld	a2,1442(a2) # 1ee8 <__clone+0xb0>
    194e:	00000817          	auipc	a6,0x0
    1952:	5a283803          	ld	a6,1442(a6) # 1ef0 <__clone+0xb8>
    1956:	a029                	j	1960 <strcpy+0x2a>
    1958:	e118                	sd	a4,0(a0)
    195a:	6598                	ld	a4,8(a1)
    195c:	05a1                	addi	a1,a1,8
    195e:	0521                	addi	a0,a0,8
    1960:	00c707b3          	add	a5,a4,a2
    1964:	fff74693          	not	a3,a4
    1968:	8ff5                	and	a5,a5,a3
    196a:	0107f7b3          	and	a5,a5,a6
    196e:	d7ed                	beqz	a5,1958 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1970:	0005c783          	lbu	a5,0(a1)
    1974:	00f50023          	sb	a5,0(a0)
    1978:	c785                	beqz	a5,19a0 <strcpy+0x6a>
    197a:	0015c783          	lbu	a5,1(a1)
    197e:	0505                	addi	a0,a0,1
    1980:	0585                	addi	a1,a1,1
    1982:	00f50023          	sb	a5,0(a0)
    1986:	fbf5                	bnez	a5,197a <strcpy+0x44>
        ;
    return d;
}
    1988:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    198a:	0505                	addi	a0,a0,1
    198c:	df45                	beqz	a4,1944 <strcpy+0xe>
            if (!(*d = *s))
    198e:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1992:	0585                	addi	a1,a1,1
    1994:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1998:	00f50023          	sb	a5,0(a0)
    199c:	f7fd                	bnez	a5,198a <strcpy+0x54>
}
    199e:	8082                	ret
    19a0:	8082                	ret

00000000000019a2 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19a2:	00b547b3          	xor	a5,a0,a1
    19a6:	8b9d                	andi	a5,a5,7
    19a8:	1a079863          	bnez	a5,1b58 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19ac:	0075f793          	andi	a5,a1,7
    19b0:	16078463          	beqz	a5,1b18 <strncpy+0x176>
    19b4:	ea01                	bnez	a2,19c4 <strncpy+0x22>
    19b6:	a421                	j	1bbe <strncpy+0x21c>
    19b8:	167d                	addi	a2,a2,-1
    19ba:	0505                	addi	a0,a0,1
    19bc:	14070e63          	beqz	a4,1b18 <strncpy+0x176>
    19c0:	1a060863          	beqz	a2,1b70 <strncpy+0x1ce>
    19c4:	0005c783          	lbu	a5,0(a1)
    19c8:	0585                	addi	a1,a1,1
    19ca:	0075f713          	andi	a4,a1,7
    19ce:	00f50023          	sb	a5,0(a0)
    19d2:	f3fd                	bnez	a5,19b8 <strncpy+0x16>
    19d4:	4805                	li	a6,1
    19d6:	1a061863          	bnez	a2,1b86 <strncpy+0x1e4>
    19da:	40a007b3          	neg	a5,a0
    19de:	8b9d                	andi	a5,a5,7
    19e0:	4681                	li	a3,0
    19e2:	18061a63          	bnez	a2,1b76 <strncpy+0x1d4>
    19e6:	00778713          	addi	a4,a5,7
    19ea:	45ad                	li	a1,11
    19ec:	18b76363          	bltu	a4,a1,1b72 <strncpy+0x1d0>
    19f0:	1ae6eb63          	bltu	a3,a4,1ba6 <strncpy+0x204>
    19f4:	1a078363          	beqz	a5,1b9a <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    19f8:	00050023          	sb	zero,0(a0)
    19fc:	4685                	li	a3,1
    19fe:	00150713          	addi	a4,a0,1
    1a02:	18d78f63          	beq	a5,a3,1ba0 <strncpy+0x1fe>
    1a06:	000500a3          	sb	zero,1(a0)
    1a0a:	4689                	li	a3,2
    1a0c:	00250713          	addi	a4,a0,2
    1a10:	18d78e63          	beq	a5,a3,1bac <strncpy+0x20a>
    1a14:	00050123          	sb	zero,2(a0)
    1a18:	468d                	li	a3,3
    1a1a:	00350713          	addi	a4,a0,3
    1a1e:	16d78c63          	beq	a5,a3,1b96 <strncpy+0x1f4>
    1a22:	000501a3          	sb	zero,3(a0)
    1a26:	4691                	li	a3,4
    1a28:	00450713          	addi	a4,a0,4
    1a2c:	18d78263          	beq	a5,a3,1bb0 <strncpy+0x20e>
    1a30:	00050223          	sb	zero,4(a0)
    1a34:	4695                	li	a3,5
    1a36:	00550713          	addi	a4,a0,5
    1a3a:	16d78d63          	beq	a5,a3,1bb4 <strncpy+0x212>
    1a3e:	000502a3          	sb	zero,5(a0)
    1a42:	469d                	li	a3,7
    1a44:	00650713          	addi	a4,a0,6
    1a48:	16d79863          	bne	a5,a3,1bb8 <strncpy+0x216>
    1a4c:	00750713          	addi	a4,a0,7
    1a50:	00050323          	sb	zero,6(a0)
    1a54:	40f80833          	sub	a6,a6,a5
    1a58:	ff887593          	andi	a1,a6,-8
    1a5c:	97aa                	add	a5,a5,a0
    1a5e:	95be                	add	a1,a1,a5
    1a60:	0007b023          	sd	zero,0(a5)
    1a64:	07a1                	addi	a5,a5,8
    1a66:	feb79de3          	bne	a5,a1,1a60 <strncpy+0xbe>
    1a6a:	ff887593          	andi	a1,a6,-8
    1a6e:	9ead                	addw	a3,a3,a1
    1a70:	00b707b3          	add	a5,a4,a1
    1a74:	12b80863          	beq	a6,a1,1ba4 <strncpy+0x202>
    1a78:	00078023          	sb	zero,0(a5)
    1a7c:	0016871b          	addiw	a4,a3,1
    1a80:	0ec77863          	bgeu	a4,a2,1b70 <strncpy+0x1ce>
    1a84:	000780a3          	sb	zero,1(a5)
    1a88:	0026871b          	addiw	a4,a3,2
    1a8c:	0ec77263          	bgeu	a4,a2,1b70 <strncpy+0x1ce>
    1a90:	00078123          	sb	zero,2(a5)
    1a94:	0036871b          	addiw	a4,a3,3
    1a98:	0cc77c63          	bgeu	a4,a2,1b70 <strncpy+0x1ce>
    1a9c:	000781a3          	sb	zero,3(a5)
    1aa0:	0046871b          	addiw	a4,a3,4
    1aa4:	0cc77663          	bgeu	a4,a2,1b70 <strncpy+0x1ce>
    1aa8:	00078223          	sb	zero,4(a5)
    1aac:	0056871b          	addiw	a4,a3,5
    1ab0:	0cc77063          	bgeu	a4,a2,1b70 <strncpy+0x1ce>
    1ab4:	000782a3          	sb	zero,5(a5)
    1ab8:	0066871b          	addiw	a4,a3,6
    1abc:	0ac77a63          	bgeu	a4,a2,1b70 <strncpy+0x1ce>
    1ac0:	00078323          	sb	zero,6(a5)
    1ac4:	0076871b          	addiw	a4,a3,7
    1ac8:	0ac77463          	bgeu	a4,a2,1b70 <strncpy+0x1ce>
    1acc:	000783a3          	sb	zero,7(a5)
    1ad0:	0086871b          	addiw	a4,a3,8
    1ad4:	08c77e63          	bgeu	a4,a2,1b70 <strncpy+0x1ce>
    1ad8:	00078423          	sb	zero,8(a5)
    1adc:	0096871b          	addiw	a4,a3,9
    1ae0:	08c77863          	bgeu	a4,a2,1b70 <strncpy+0x1ce>
    1ae4:	000784a3          	sb	zero,9(a5)
    1ae8:	00a6871b          	addiw	a4,a3,10
    1aec:	08c77263          	bgeu	a4,a2,1b70 <strncpy+0x1ce>
    1af0:	00078523          	sb	zero,10(a5)
    1af4:	00b6871b          	addiw	a4,a3,11
    1af8:	06c77c63          	bgeu	a4,a2,1b70 <strncpy+0x1ce>
    1afc:	000785a3          	sb	zero,11(a5)
    1b00:	00c6871b          	addiw	a4,a3,12
    1b04:	06c77663          	bgeu	a4,a2,1b70 <strncpy+0x1ce>
    1b08:	00078623          	sb	zero,12(a5)
    1b0c:	26b5                	addiw	a3,a3,13
    1b0e:	06c6f163          	bgeu	a3,a2,1b70 <strncpy+0x1ce>
    1b12:	000786a3          	sb	zero,13(a5)
    1b16:	8082                	ret
            ;
        if (!n || !*s)
    1b18:	c645                	beqz	a2,1bc0 <strncpy+0x21e>
    1b1a:	0005c783          	lbu	a5,0(a1)
    1b1e:	ea078be3          	beqz	a5,19d4 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b22:	479d                	li	a5,7
    1b24:	02c7ff63          	bgeu	a5,a2,1b62 <strncpy+0x1c0>
    1b28:	00000897          	auipc	a7,0x0
    1b2c:	3c08b883          	ld	a7,960(a7) # 1ee8 <__clone+0xb0>
    1b30:	00000817          	auipc	a6,0x0
    1b34:	3c083803          	ld	a6,960(a6) # 1ef0 <__clone+0xb8>
    1b38:	431d                	li	t1,7
    1b3a:	6198                	ld	a4,0(a1)
    1b3c:	011707b3          	add	a5,a4,a7
    1b40:	fff74693          	not	a3,a4
    1b44:	8ff5                	and	a5,a5,a3
    1b46:	0107f7b3          	and	a5,a5,a6
    1b4a:	ef81                	bnez	a5,1b62 <strncpy+0x1c0>
            *wd = *ws;
    1b4c:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b4e:	1661                	addi	a2,a2,-8
    1b50:	05a1                	addi	a1,a1,8
    1b52:	0521                	addi	a0,a0,8
    1b54:	fec363e3          	bltu	t1,a2,1b3a <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b58:	e609                	bnez	a2,1b62 <strncpy+0x1c0>
    1b5a:	a08d                	j	1bbc <strncpy+0x21a>
    1b5c:	167d                	addi	a2,a2,-1
    1b5e:	0505                	addi	a0,a0,1
    1b60:	ca01                	beqz	a2,1b70 <strncpy+0x1ce>
    1b62:	0005c783          	lbu	a5,0(a1)
    1b66:	0585                	addi	a1,a1,1
    1b68:	00f50023          	sb	a5,0(a0)
    1b6c:	fbe5                	bnez	a5,1b5c <strncpy+0x1ba>
        ;
tail:
    1b6e:	b59d                	j	19d4 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1b70:	8082                	ret
    1b72:	472d                	li	a4,11
    1b74:	bdb5                	j	19f0 <strncpy+0x4e>
    1b76:	00778713          	addi	a4,a5,7
    1b7a:	45ad                	li	a1,11
    1b7c:	fff60693          	addi	a3,a2,-1
    1b80:	e6b778e3          	bgeu	a4,a1,19f0 <strncpy+0x4e>
    1b84:	b7fd                	j	1b72 <strncpy+0x1d0>
    1b86:	40a007b3          	neg	a5,a0
    1b8a:	8832                	mv	a6,a2
    1b8c:	8b9d                	andi	a5,a5,7
    1b8e:	4681                	li	a3,0
    1b90:	e4060be3          	beqz	a2,19e6 <strncpy+0x44>
    1b94:	b7cd                	j	1b76 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b96:	468d                	li	a3,3
    1b98:	bd75                	j	1a54 <strncpy+0xb2>
    1b9a:	872a                	mv	a4,a0
    1b9c:	4681                	li	a3,0
    1b9e:	bd5d                	j	1a54 <strncpy+0xb2>
    1ba0:	4685                	li	a3,1
    1ba2:	bd4d                	j	1a54 <strncpy+0xb2>
    1ba4:	8082                	ret
    1ba6:	87aa                	mv	a5,a0
    1ba8:	4681                	li	a3,0
    1baa:	b5f9                	j	1a78 <strncpy+0xd6>
    1bac:	4689                	li	a3,2
    1bae:	b55d                	j	1a54 <strncpy+0xb2>
    1bb0:	4691                	li	a3,4
    1bb2:	b54d                	j	1a54 <strncpy+0xb2>
    1bb4:	4695                	li	a3,5
    1bb6:	bd79                	j	1a54 <strncpy+0xb2>
    1bb8:	4699                	li	a3,6
    1bba:	bd69                	j	1a54 <strncpy+0xb2>
    1bbc:	8082                	ret
    1bbe:	8082                	ret
    1bc0:	8082                	ret

0000000000001bc2 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1bc2:	87aa                	mv	a5,a0
    1bc4:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1bc6:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1bca:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1bce:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1bd0:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bd2:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1bd6:	2501                	sext.w	a0,a0
    1bd8:	8082                	ret

0000000000001bda <openat>:
    register long a7 __asm__("a7") = n;
    1bda:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1bde:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1be2:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1be6:	2501                	sext.w	a0,a0
    1be8:	8082                	ret

0000000000001bea <close>:
    register long a7 __asm__("a7") = n;
    1bea:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1bee:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1bf2:	2501                	sext.w	a0,a0
    1bf4:	8082                	ret

0000000000001bf6 <read>:
    register long a7 __asm__("a7") = n;
    1bf6:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1bfa:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1bfe:	8082                	ret

0000000000001c00 <write>:
    register long a7 __asm__("a7") = n;
    1c00:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c04:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c08:	8082                	ret

0000000000001c0a <getpid>:
    register long a7 __asm__("a7") = n;
    1c0a:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c0e:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c12:	2501                	sext.w	a0,a0
    1c14:	8082                	ret

0000000000001c16 <getppid>:
    register long a7 __asm__("a7") = n;
    1c16:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c1a:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c1e:	2501                	sext.w	a0,a0
    1c20:	8082                	ret

0000000000001c22 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c22:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c26:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c2a:	2501                	sext.w	a0,a0
    1c2c:	8082                	ret

0000000000001c2e <fork>:
    register long a7 __asm__("a7") = n;
    1c2e:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c32:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c34:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c36:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c3a:	2501                	sext.w	a0,a0
    1c3c:	8082                	ret

0000000000001c3e <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c3e:	85b2                	mv	a1,a2
    1c40:	863a                	mv	a2,a4
    if (stack)
    1c42:	c191                	beqz	a1,1c46 <clone+0x8>
	stack += stack_size;
    1c44:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c46:	4781                	li	a5,0
    1c48:	4701                	li	a4,0
    1c4a:	4681                	li	a3,0
    1c4c:	2601                	sext.w	a2,a2
    1c4e:	a2ed                	j	1e38 <__clone>

0000000000001c50 <exit>:
    register long a7 __asm__("a7") = n;
    1c50:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c54:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c58:	8082                	ret

0000000000001c5a <waitpid>:
    register long a7 __asm__("a7") = n;
    1c5a:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c5e:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c60:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c64:	2501                	sext.w	a0,a0
    1c66:	8082                	ret

0000000000001c68 <exec>:
    register long a7 __asm__("a7") = n;
    1c68:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1c6c:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1c70:	2501                	sext.w	a0,a0
    1c72:	8082                	ret

0000000000001c74 <execve>:
    register long a7 __asm__("a7") = n;
    1c74:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c78:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1c7c:	2501                	sext.w	a0,a0
    1c7e:	8082                	ret

0000000000001c80 <times>:
    register long a7 __asm__("a7") = n;
    1c80:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1c84:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1c88:	2501                	sext.w	a0,a0
    1c8a:	8082                	ret

0000000000001c8c <get_time>:

int64 get_time()
{
    1c8c:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1c8e:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1c92:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1c94:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c96:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1c9a:	2501                	sext.w	a0,a0
    1c9c:	ed09                	bnez	a0,1cb6 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1c9e:	67a2                	ld	a5,8(sp)
    1ca0:	3e800713          	li	a4,1000
    1ca4:	00015503          	lhu	a0,0(sp)
    1ca8:	02e7d7b3          	divu	a5,a5,a4
    1cac:	02e50533          	mul	a0,a0,a4
    1cb0:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1cb2:	0141                	addi	sp,sp,16
    1cb4:	8082                	ret
        return -1;
    1cb6:	557d                	li	a0,-1
    1cb8:	bfed                	j	1cb2 <get_time+0x26>

0000000000001cba <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1cba:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cbe:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1cc2:	2501                	sext.w	a0,a0
    1cc4:	8082                	ret

0000000000001cc6 <time>:
    register long a7 __asm__("a7") = n;
    1cc6:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1cca:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1cce:	2501                	sext.w	a0,a0
    1cd0:	8082                	ret

0000000000001cd2 <sleep>:

int sleep(unsigned long long time)
{
    1cd2:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1cd4:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1cd6:	850a                	mv	a0,sp
    1cd8:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1cda:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1cde:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ce0:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1ce4:	e501                	bnez	a0,1cec <sleep+0x1a>
    return 0;
    1ce6:	4501                	li	a0,0
}
    1ce8:	0141                	addi	sp,sp,16
    1cea:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1cec:	4502                	lw	a0,0(sp)
}
    1cee:	0141                	addi	sp,sp,16
    1cf0:	8082                	ret

0000000000001cf2 <set_priority>:
    register long a7 __asm__("a7") = n;
    1cf2:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1cf6:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1cfa:	2501                	sext.w	a0,a0
    1cfc:	8082                	ret

0000000000001cfe <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1cfe:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d02:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d06:	8082                	ret

0000000000001d08 <munmap>:
    register long a7 __asm__("a7") = n;
    1d08:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d0c:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d10:	2501                	sext.w	a0,a0
    1d12:	8082                	ret

0000000000001d14 <wait>:

int wait(int *code)
{
    1d14:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d16:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d1a:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d1c:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d1e:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d20:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d24:	2501                	sext.w	a0,a0
    1d26:	8082                	ret

0000000000001d28 <spawn>:
    register long a7 __asm__("a7") = n;
    1d28:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d2c:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d30:	2501                	sext.w	a0,a0
    1d32:	8082                	ret

0000000000001d34 <mailread>:
    register long a7 __asm__("a7") = n;
    1d34:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d38:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d3c:	2501                	sext.w	a0,a0
    1d3e:	8082                	ret

0000000000001d40 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d40:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d44:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d48:	2501                	sext.w	a0,a0
    1d4a:	8082                	ret

0000000000001d4c <fstat>:
    register long a7 __asm__("a7") = n;
    1d4c:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d50:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d54:	2501                	sext.w	a0,a0
    1d56:	8082                	ret

0000000000001d58 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d58:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d5a:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d5e:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d60:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d64:	2501                	sext.w	a0,a0
    1d66:	8082                	ret

0000000000001d68 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1d68:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d6a:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1d6e:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d70:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1d74:	2501                	sext.w	a0,a0
    1d76:	8082                	ret

0000000000001d78 <link>:

int link(char *old_path, char *new_path)
{
    1d78:	87aa                	mv	a5,a0
    1d7a:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1d7c:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1d80:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d84:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1d86:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1d8a:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d8c:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1d90:	2501                	sext.w	a0,a0
    1d92:	8082                	ret

0000000000001d94 <unlink>:

int unlink(char *path)
{
    1d94:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d96:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1d9a:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1d9e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da0:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1da4:	2501                	sext.w	a0,a0
    1da6:	8082                	ret

0000000000001da8 <uname>:
    register long a7 __asm__("a7") = n;
    1da8:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1dac:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1db0:	2501                	sext.w	a0,a0
    1db2:	8082                	ret

0000000000001db4 <brk>:
    register long a7 __asm__("a7") = n;
    1db4:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1db8:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1dbc:	2501                	sext.w	a0,a0
    1dbe:	8082                	ret

0000000000001dc0 <getcwd>:
    register long a7 __asm__("a7") = n;
    1dc0:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc2:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1dc6:	8082                	ret

0000000000001dc8 <chdir>:
    register long a7 __asm__("a7") = n;
    1dc8:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1dcc:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1dd4:	862e                	mv	a2,a1
    1dd6:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1dd8:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dda:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1dde:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1de2:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1de4:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de6:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1dea:	2501                	sext.w	a0,a0
    1dec:	8082                	ret

0000000000001dee <getdents>:
    register long a7 __asm__("a7") = n;
    1dee:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df2:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1df6:	2501                	sext.w	a0,a0
    1df8:	8082                	ret

0000000000001dfa <pipe>:
    register long a7 __asm__("a7") = n;
    1dfa:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1dfe:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e00:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <dup>:
    register long a7 __asm__("a7") = n;
    1e08:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e0a:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e0e:	2501                	sext.w	a0,a0
    1e10:	8082                	ret

0000000000001e12 <dup2>:
    register long a7 __asm__("a7") = n;
    1e12:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e14:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e16:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e1a:	2501                	sext.w	a0,a0
    1e1c:	8082                	ret

0000000000001e1e <mount>:
    register long a7 __asm__("a7") = n;
    1e1e:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e22:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e26:	2501                	sext.w	a0,a0
    1e28:	8082                	ret

0000000000001e2a <umount>:
    register long a7 __asm__("a7") = n;
    1e2a:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e2e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e30:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e38:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e3a:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e3c:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e3e:	8532                	mv	a0,a2
	mv a2, a4
    1e40:	863a                	mv	a2,a4
	mv a3, a5
    1e42:	86be                	mv	a3,a5
	mv a4, a6
    1e44:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e46:	0dc00893          	li	a7,220
	ecall
    1e4a:	00000073          	ecall

	beqz a0, 1f
    1e4e:	c111                	beqz	a0,1e52 <__clone+0x1a>
	# Parent
	ret
    1e50:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e52:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e54:	6522                	ld	a0,8(sp)
	jalr a1
    1e56:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e58:	05d00893          	li	a7,93
	ecall
    1e5c:	00000073          	ecall
