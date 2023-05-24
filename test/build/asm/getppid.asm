
/home/lmq/lmq/cscc/xv6-k210/test/build/riscv64/getppid:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a051                	j	1086 <__start_main>

0000000000001004 <test_getppid>:
 * 不能通过测试则输出：
 * "  getppid error."
 */

int test_getppid()
{
    1004:	1141                	addi	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	e3a50513          	addi	a0,a0,-454 # 1e40 <__clone+0x2a>
{
    100e:	e406                	sd	ra,8(sp)
    TEST_START(__func__);
    1010:	274000ef          	jal	ra,1284 <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	ebc50513          	addi	a0,a0,-324 # 1ed0 <__func__.1165>
    101c:	268000ef          	jal	ra,1284 <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	e3850513          	addi	a0,a0,-456 # 1e58 <__clone+0x42>
    1028:	25c000ef          	jal	ra,1284 <puts>
    pid_t ppid = getppid();
    102c:	3c9000ef          	jal	ra,1bf4 <getppid>
    if(ppid > 0) printf("  getppid success. ppid : %d\n", ppid);
    1030:	02a05c63          	blez	a0,1068 <test_getppid+0x64>
    1034:	85aa                	mv	a1,a0
    1036:	00001517          	auipc	a0,0x1
    103a:	e3250513          	addi	a0,a0,-462 # 1e68 <__clone+0x52>
    103e:	268000ef          	jal	ra,12a6 <printf>
    else printf("  getppid error.\n");
    TEST_END(__func__);
    1042:	00001517          	auipc	a0,0x1
    1046:	e5e50513          	addi	a0,a0,-418 # 1ea0 <__clone+0x8a>
    104a:	23a000ef          	jal	ra,1284 <puts>
    104e:	00001517          	auipc	a0,0x1
    1052:	e8250513          	addi	a0,a0,-382 # 1ed0 <__func__.1165>
    1056:	22e000ef          	jal	ra,1284 <puts>
}
    105a:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    105c:	00001517          	auipc	a0,0x1
    1060:	dfc50513          	addi	a0,a0,-516 # 1e58 <__clone+0x42>
}
    1064:	0141                	addi	sp,sp,16
    TEST_END(__func__);
    1066:	ac39                	j	1284 <puts>
    else printf("  getppid error.\n");
    1068:	00001517          	auipc	a0,0x1
    106c:	e2050513          	addi	a0,a0,-480 # 1e88 <__clone+0x72>
    1070:	236000ef          	jal	ra,12a6 <printf>
    1074:	b7f9                	j	1042 <test_getppid+0x3e>

0000000000001076 <main>:

int main(void) {
    1076:	1141                	addi	sp,sp,-16
    1078:	e406                	sd	ra,8(sp)
	test_getppid();
    107a:	f8bff0ef          	jal	ra,1004 <test_getppid>
	return 0;
}
    107e:	60a2                	ld	ra,8(sp)
    1080:	4501                	li	a0,0
    1082:	0141                	addi	sp,sp,16
    1084:	8082                	ret

0000000000001086 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1086:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1088:	4108                	lw	a0,0(a0)
{
    108a:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    108c:	05a1                	addi	a1,a1,8
{
    108e:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1090:	fe7ff0ef          	jal	ra,1076 <main>
    1094:	39b000ef          	jal	ra,1c2e <exit>
	return 0;
}
    1098:	60a2                	ld	ra,8(sp)
    109a:	4501                	li	a0,0
    109c:	0141                	addi	sp,sp,16
    109e:	8082                	ret

00000000000010a0 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10a0:	7179                	addi	sp,sp,-48
    10a2:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10a4:	12054b63          	bltz	a0,11da <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10a8:	02b577bb          	remuw	a5,a0,a1
    10ac:	00001697          	auipc	a3,0x1
    10b0:	e3468693          	addi	a3,a3,-460 # 1ee0 <digits>
    buf[16] = 0;
    10b4:	00010c23          	sb	zero,24(sp)
    i = 15;
    10b8:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    10bc:	1782                	slli	a5,a5,0x20
    10be:	9381                	srli	a5,a5,0x20
    10c0:	97b6                	add	a5,a5,a3
    10c2:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10c6:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10ca:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10ce:	16b56263          	bltu	a0,a1,1232 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    10d2:	02e8763b          	remuw	a2,a6,a4
    10d6:	1602                	slli	a2,a2,0x20
    10d8:	9201                	srli	a2,a2,0x20
    10da:	9636                	add	a2,a2,a3
    10dc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10e0:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    10e4:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10e8:	12e86963          	bltu	a6,a4,121a <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    10ec:	02e5f63b          	remuw	a2,a1,a4
    10f0:	1602                	slli	a2,a2,0x20
    10f2:	9201                	srli	a2,a2,0x20
    10f4:	9636                	add	a2,a2,a3
    10f6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10fa:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    10fe:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1102:	10e5ef63          	bltu	a1,a4,1220 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1106:	02e8763b          	remuw	a2,a6,a4
    110a:	1602                	slli	a2,a2,0x20
    110c:	9201                	srli	a2,a2,0x20
    110e:	9636                	add	a2,a2,a3
    1110:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1114:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1118:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    111c:	10e86563          	bltu	a6,a4,1226 <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    1120:	02e5f63b          	remuw	a2,a1,a4
    1124:	1602                	slli	a2,a2,0x20
    1126:	9201                	srli	a2,a2,0x20
    1128:	9636                	add	a2,a2,a3
    112a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    112e:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1132:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1136:	0ee5eb63          	bltu	a1,a4,122c <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    113a:	02e8763b          	remuw	a2,a6,a4
    113e:	1602                	slli	a2,a2,0x20
    1140:	9201                	srli	a2,a2,0x20
    1142:	9636                	add	a2,a2,a3
    1144:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1148:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    114c:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1150:	0ce86263          	bltu	a6,a4,1214 <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    1154:	02e5f63b          	remuw	a2,a1,a4
    1158:	1602                	slli	a2,a2,0x20
    115a:	9201                	srli	a2,a2,0x20
    115c:	9636                	add	a2,a2,a3
    115e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1162:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1166:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    116a:	0ce5e663          	bltu	a1,a4,1236 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    116e:	02e8763b          	remuw	a2,a6,a4
    1172:	1602                	slli	a2,a2,0x20
    1174:	9201                	srli	a2,a2,0x20
    1176:	9636                	add	a2,a2,a3
    1178:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    117c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1180:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1184:	0ae86c63          	bltu	a6,a4,123c <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    1188:	02e5f63b          	remuw	a2,a1,a4
    118c:	1602                	slli	a2,a2,0x20
    118e:	9201                	srli	a2,a2,0x20
    1190:	9636                	add	a2,a2,a3
    1192:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1196:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    119a:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    119e:	0ae5e263          	bltu	a1,a4,1242 <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    11a2:	1782                	slli	a5,a5,0x20
    11a4:	9381                	srli	a5,a5,0x20
    11a6:	97b6                	add	a5,a5,a3
    11a8:	0007c703          	lbu	a4,0(a5)
    11ac:	4599                	li	a1,6
    11ae:	4795                	li	a5,5
    11b0:	00e10723          	sb	a4,14(sp)

    if (sign)
    11b4:	00055963          	bgez	a0,11c6 <printint.constprop.0+0x126>
        buf[i--] = '-';
    11b8:	1018                	addi	a4,sp,32
    11ba:	973e                	add	a4,a4,a5
    11bc:	02d00693          	li	a3,45
    11c0:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    11c4:	85be                	mv	a1,a5
    write(f, s, l);
    11c6:	003c                	addi	a5,sp,8
    11c8:	4641                	li	a2,16
    11ca:	9e0d                	subw	a2,a2,a1
    11cc:	4505                	li	a0,1
    11ce:	95be                	add	a1,a1,a5
    11d0:	20f000ef          	jal	ra,1bde <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11d4:	70a2                	ld	ra,40(sp)
    11d6:	6145                	addi	sp,sp,48
    11d8:	8082                	ret
        x = -xx;
    11da:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    11de:	02b677bb          	remuw	a5,a2,a1
    11e2:	00001697          	auipc	a3,0x1
    11e6:	cfe68693          	addi	a3,a3,-770 # 1ee0 <digits>
    buf[16] = 0;
    11ea:	00010c23          	sb	zero,24(sp)
    i = 15;
    11ee:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    11f2:	1782                	slli	a5,a5,0x20
    11f4:	9381                	srli	a5,a5,0x20
    11f6:	97b6                	add	a5,a5,a3
    11f8:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    11fc:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1200:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1204:	ecb677e3          	bgeu	a2,a1,10d2 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1208:	02d00793          	li	a5,45
    120c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1210:	45b9                	li	a1,14
    1212:	bf55                	j	11c6 <printint.constprop.0+0x126>
    1214:	47a5                	li	a5,9
    1216:	45a9                	li	a1,10
    1218:	bf71                	j	11b4 <printint.constprop.0+0x114>
    121a:	47b5                	li	a5,13
    121c:	45b9                	li	a1,14
    121e:	bf59                	j	11b4 <printint.constprop.0+0x114>
    1220:	47b1                	li	a5,12
    1222:	45b5                	li	a1,13
    1224:	bf41                	j	11b4 <printint.constprop.0+0x114>
    1226:	47ad                	li	a5,11
    1228:	45b1                	li	a1,12
    122a:	b769                	j	11b4 <printint.constprop.0+0x114>
    122c:	47a9                	li	a5,10
    122e:	45ad                	li	a1,11
    1230:	b751                	j	11b4 <printint.constprop.0+0x114>
    i = 15;
    1232:	45bd                	li	a1,15
    1234:	bf49                	j	11c6 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1236:	47a1                	li	a5,8
    1238:	45a5                	li	a1,9
    123a:	bfad                	j	11b4 <printint.constprop.0+0x114>
    123c:	479d                	li	a5,7
    123e:	45a1                	li	a1,8
    1240:	bf95                	j	11b4 <printint.constprop.0+0x114>
    1242:	4799                	li	a5,6
    1244:	459d                	li	a1,7
    1246:	b7bd                	j	11b4 <printint.constprop.0+0x114>

0000000000001248 <getchar>:
{
    1248:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    124a:	00f10593          	addi	a1,sp,15
    124e:	4605                	li	a2,1
    1250:	4501                	li	a0,0
{
    1252:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1254:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1258:	17d000ef          	jal	ra,1bd4 <read>
}
    125c:	60e2                	ld	ra,24(sp)
    125e:	00f14503          	lbu	a0,15(sp)
    1262:	6105                	addi	sp,sp,32
    1264:	8082                	ret

0000000000001266 <putchar>:
{
    1266:	1101                	addi	sp,sp,-32
    1268:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    126a:	00f10593          	addi	a1,sp,15
    126e:	4605                	li	a2,1
    1270:	4505                	li	a0,1
{
    1272:	ec06                	sd	ra,24(sp)
    char byte = c;
    1274:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1278:	167000ef          	jal	ra,1bde <write>
}
    127c:	60e2                	ld	ra,24(sp)
    127e:	2501                	sext.w	a0,a0
    1280:	6105                	addi	sp,sp,32
    1282:	8082                	ret

0000000000001284 <puts>:
{
    1284:	1141                	addi	sp,sp,-16
    1286:	e406                	sd	ra,8(sp)
    1288:	e022                	sd	s0,0(sp)
    128a:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    128c:	56e000ef          	jal	ra,17fa <strlen>
    1290:	862a                	mv	a2,a0
    1292:	85a2                	mv	a1,s0
    1294:	4505                	li	a0,1
    1296:	149000ef          	jal	ra,1bde <write>
}
    129a:	60a2                	ld	ra,8(sp)
    129c:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    129e:	957d                	srai	a0,a0,0x3f
    return r;
    12a0:	2501                	sext.w	a0,a0
}
    12a2:	0141                	addi	sp,sp,16
    12a4:	8082                	ret

00000000000012a6 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12a6:	7171                	addi	sp,sp,-176
    12a8:	fc56                	sd	s5,56(sp)
    12aa:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    12ac:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12ae:	18bc                	addi	a5,sp,120
{
    12b0:	e8ca                	sd	s2,80(sp)
    12b2:	e4ce                	sd	s3,72(sp)
    12b4:	e0d2                	sd	s4,64(sp)
    12b6:	f85a                	sd	s6,48(sp)
    12b8:	f486                	sd	ra,104(sp)
    12ba:	f0a2                	sd	s0,96(sp)
    12bc:	eca6                	sd	s1,88(sp)
    12be:	fcae                	sd	a1,120(sp)
    12c0:	e132                	sd	a2,128(sp)
    12c2:	e536                	sd	a3,136(sp)
    12c4:	e93a                	sd	a4,144(sp)
    12c6:	f142                	sd	a6,160(sp)
    12c8:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    12ca:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12cc:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    12d0:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    12d4:	00001b17          	auipc	s6,0x1
    12d8:	bdcb0b13          	addi	s6,s6,-1060 # 1eb0 <__clone+0x9a>
    buf[i++] = '0';
    12dc:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12e0:	00001997          	auipc	s3,0x1
    12e4:	c0098993          	addi	s3,s3,-1024 # 1ee0 <digits>
        if (!*s)
    12e8:	00054783          	lbu	a5,0(a0)
    12ec:	16078a63          	beqz	a5,1460 <printf+0x1ba>
    12f0:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    12f2:	19278163          	beq	a5,s2,1474 <printf+0x1ce>
    12f6:	00164783          	lbu	a5,1(a2)
    12fa:	0605                	addi	a2,a2,1
    12fc:	fbfd                	bnez	a5,12f2 <printf+0x4c>
    12fe:	84b2                	mv	s1,a2
        l = z - a;
    1300:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1304:	85aa                	mv	a1,a0
    1306:	8622                	mv	a2,s0
    1308:	4505                	li	a0,1
    130a:	0d5000ef          	jal	ra,1bde <write>
        if (l)
    130e:	18041c63          	bnez	s0,14a6 <printf+0x200>
        if (s[1] == 0)
    1312:	0014c783          	lbu	a5,1(s1)
    1316:	14078563          	beqz	a5,1460 <printf+0x1ba>
        switch (s[1])
    131a:	1d478063          	beq	a5,s4,14da <printf+0x234>
    131e:	18fa6663          	bltu	s4,a5,14aa <printf+0x204>
    1322:	06400713          	li	a4,100
    1326:	1ae78063          	beq	a5,a4,14c6 <printf+0x220>
    132a:	07000713          	li	a4,112
    132e:	1ce79963          	bne	a5,a4,1500 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    1332:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1334:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1338:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    133a:	631c                	ld	a5,0(a4)
    133c:	0721                	addi	a4,a4,8
    133e:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1340:	00479293          	slli	t0,a5,0x4
    1344:	00879f93          	slli	t6,a5,0x8
    1348:	00c79f13          	slli	t5,a5,0xc
    134c:	01079e93          	slli	t4,a5,0x10
    1350:	01479e13          	slli	t3,a5,0x14
    1354:	01879313          	slli	t1,a5,0x18
    1358:	01c79893          	slli	a7,a5,0x1c
    135c:	02479813          	slli	a6,a5,0x24
    1360:	02879513          	slli	a0,a5,0x28
    1364:	02c79593          	slli	a1,a5,0x2c
    1368:	03079693          	slli	a3,a5,0x30
    136c:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1370:	03c7d413          	srli	s0,a5,0x3c
    1374:	01c7d39b          	srliw	t2,a5,0x1c
    1378:	03c2d293          	srli	t0,t0,0x3c
    137c:	03cfdf93          	srli	t6,t6,0x3c
    1380:	03cf5f13          	srli	t5,t5,0x3c
    1384:	03cede93          	srli	t4,t4,0x3c
    1388:	03ce5e13          	srli	t3,t3,0x3c
    138c:	03c35313          	srli	t1,t1,0x3c
    1390:	03c8d893          	srli	a7,a7,0x3c
    1394:	03c85813          	srli	a6,a6,0x3c
    1398:	9171                	srli	a0,a0,0x3c
    139a:	91f1                	srli	a1,a1,0x3c
    139c:	92f1                	srli	a3,a3,0x3c
    139e:	9371                	srli	a4,a4,0x3c
    13a0:	96ce                	add	a3,a3,s3
    13a2:	974e                	add	a4,a4,s3
    13a4:	944e                	add	s0,s0,s3
    13a6:	92ce                	add	t0,t0,s3
    13a8:	9fce                	add	t6,t6,s3
    13aa:	9f4e                	add	t5,t5,s3
    13ac:	9ece                	add	t4,t4,s3
    13ae:	9e4e                	add	t3,t3,s3
    13b0:	934e                	add	t1,t1,s3
    13b2:	98ce                	add	a7,a7,s3
    13b4:	93ce                	add	t2,t2,s3
    13b6:	984e                	add	a6,a6,s3
    13b8:	954e                	add	a0,a0,s3
    13ba:	95ce                	add	a1,a1,s3
    13bc:	0006c083          	lbu	ra,0(a3)
    13c0:	0002c283          	lbu	t0,0(t0)
    13c4:	00074683          	lbu	a3,0(a4)
    13c8:	000fcf83          	lbu	t6,0(t6)
    13cc:	000f4f03          	lbu	t5,0(t5)
    13d0:	000ece83          	lbu	t4,0(t4)
    13d4:	000e4e03          	lbu	t3,0(t3)
    13d8:	00034303          	lbu	t1,0(t1)
    13dc:	0008c883          	lbu	a7,0(a7)
    13e0:	0003c383          	lbu	t2,0(t2)
    13e4:	00084803          	lbu	a6,0(a6)
    13e8:	00054503          	lbu	a0,0(a0)
    13ec:	0005c583          	lbu	a1,0(a1)
    13f0:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13f4:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13f8:	9371                	srli	a4,a4,0x3c
    13fa:	8bbd                	andi	a5,a5,15
    13fc:	974e                	add	a4,a4,s3
    13fe:	97ce                	add	a5,a5,s3
    1400:	005105a3          	sb	t0,11(sp)
    1404:	01f10623          	sb	t6,12(sp)
    1408:	01e106a3          	sb	t5,13(sp)
    140c:	01d10723          	sb	t4,14(sp)
    1410:	01c107a3          	sb	t3,15(sp)
    1414:	00610823          	sb	t1,16(sp)
    1418:	011108a3          	sb	a7,17(sp)
    141c:	00710923          	sb	t2,18(sp)
    1420:	010109a3          	sb	a6,19(sp)
    1424:	00a10a23          	sb	a0,20(sp)
    1428:	00b10aa3          	sb	a1,21(sp)
    142c:	00110b23          	sb	ra,22(sp)
    1430:	00d10ba3          	sb	a3,23(sp)
    1434:	00810523          	sb	s0,10(sp)
    1438:	00074703          	lbu	a4,0(a4)
    143c:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1440:	002c                	addi	a1,sp,8
    1442:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1444:	00e10c23          	sb	a4,24(sp)
    1448:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    144c:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1450:	78e000ef          	jal	ra,1bde <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1454:	00248513          	addi	a0,s1,2
        if (!*s)
    1458:	00054783          	lbu	a5,0(a0)
    145c:	e8079ae3          	bnez	a5,12f0 <printf+0x4a>
    }
    va_end(ap);
}
    1460:	70a6                	ld	ra,104(sp)
    1462:	7406                	ld	s0,96(sp)
    1464:	64e6                	ld	s1,88(sp)
    1466:	6946                	ld	s2,80(sp)
    1468:	69a6                	ld	s3,72(sp)
    146a:	6a06                	ld	s4,64(sp)
    146c:	7ae2                	ld	s5,56(sp)
    146e:	7b42                	ld	s6,48(sp)
    1470:	614d                	addi	sp,sp,176
    1472:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1474:	00064783          	lbu	a5,0(a2)
    1478:	84b2                	mv	s1,a2
    147a:	01278963          	beq	a5,s2,148c <printf+0x1e6>
    147e:	b549                	j	1300 <printf+0x5a>
    1480:	0024c783          	lbu	a5,2(s1)
    1484:	0605                	addi	a2,a2,1
    1486:	0489                	addi	s1,s1,2
    1488:	e7279ce3          	bne	a5,s2,1300 <printf+0x5a>
    148c:	0014c783          	lbu	a5,1(s1)
    1490:	ff2788e3          	beq	a5,s2,1480 <printf+0x1da>
        l = z - a;
    1494:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1498:	85aa                	mv	a1,a0
    149a:	8622                	mv	a2,s0
    149c:	4505                	li	a0,1
    149e:	740000ef          	jal	ra,1bde <write>
        if (l)
    14a2:	e60408e3          	beqz	s0,1312 <printf+0x6c>
    14a6:	8526                	mv	a0,s1
    14a8:	b581                	j	12e8 <printf+0x42>
        switch (s[1])
    14aa:	07800713          	li	a4,120
    14ae:	04e79963          	bne	a5,a4,1500 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    14b2:	6782                	ld	a5,0(sp)
    14b4:	45c1                	li	a1,16
    14b6:	4388                	lw	a0,0(a5)
    14b8:	07a1                	addi	a5,a5,8
    14ba:	e03e                	sd	a5,0(sp)
    14bc:	be5ff0ef          	jal	ra,10a0 <printint.constprop.0>
        s += 2;
    14c0:	00248513          	addi	a0,s1,2
    14c4:	bf51                	j	1458 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    14c6:	6782                	ld	a5,0(sp)
    14c8:	45a9                	li	a1,10
    14ca:	4388                	lw	a0,0(a5)
    14cc:	07a1                	addi	a5,a5,8
    14ce:	e03e                	sd	a5,0(sp)
    14d0:	bd1ff0ef          	jal	ra,10a0 <printint.constprop.0>
        s += 2;
    14d4:	00248513          	addi	a0,s1,2
    14d8:	b741                	j	1458 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    14da:	6782                	ld	a5,0(sp)
    14dc:	6380                	ld	s0,0(a5)
    14de:	07a1                	addi	a5,a5,8
    14e0:	e03e                	sd	a5,0(sp)
    14e2:	c421                	beqz	s0,152a <printf+0x284>
            l = strnlen(a, 200);
    14e4:	0c800593          	li	a1,200
    14e8:	8522                	mv	a0,s0
    14ea:	3fc000ef          	jal	ra,18e6 <strnlen>
    write(f, s, l);
    14ee:	0005061b          	sext.w	a2,a0
    14f2:	85a2                	mv	a1,s0
    14f4:	4505                	li	a0,1
    14f6:	6e8000ef          	jal	ra,1bde <write>
        s += 2;
    14fa:	00248513          	addi	a0,s1,2
    14fe:	bfa9                	j	1458 <printf+0x1b2>
    char byte = c;
    1500:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1504:	4605                	li	a2,1
    1506:	002c                	addi	a1,sp,8
    1508:	4505                	li	a0,1
    char byte = c;
    150a:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    150e:	6d0000ef          	jal	ra,1bde <write>
    char byte = c;
    1512:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1516:	4605                	li	a2,1
    1518:	002c                	addi	a1,sp,8
    151a:	4505                	li	a0,1
    char byte = c;
    151c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1520:	6be000ef          	jal	ra,1bde <write>
        s += 2;
    1524:	00248513          	addi	a0,s1,2
    1528:	bf05                	j	1458 <printf+0x1b2>
                a = "(null)";
    152a:	845a                	mv	s0,s6
    152c:	bf65                	j	14e4 <printf+0x23e>

000000000000152e <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    152e:	02000793          	li	a5,32
    1532:	00f50663          	beq	a0,a5,153e <isspace+0x10>
    1536:	355d                	addiw	a0,a0,-9
    1538:	00553513          	sltiu	a0,a0,5
    153c:	8082                	ret
    153e:	4505                	li	a0,1
}
    1540:	8082                	ret

0000000000001542 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1542:	fd05051b          	addiw	a0,a0,-48
}
    1546:	00a53513          	sltiu	a0,a0,10
    154a:	8082                	ret

000000000000154c <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    154c:	02000613          	li	a2,32
    1550:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1552:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1556:	ff77069b          	addiw	a3,a4,-9
    155a:	04c70d63          	beq	a4,a2,15b4 <atoi+0x68>
    155e:	0007079b          	sext.w	a5,a4
    1562:	04d5f963          	bgeu	a1,a3,15b4 <atoi+0x68>
        s++;
    switch (*s)
    1566:	02b00693          	li	a3,43
    156a:	04d70a63          	beq	a4,a3,15be <atoi+0x72>
    156e:	02d00693          	li	a3,45
    1572:	06d70463          	beq	a4,a3,15da <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1576:	fd07859b          	addiw	a1,a5,-48
    157a:	4625                	li	a2,9
    157c:	873e                	mv	a4,a5
    157e:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1580:	4e01                	li	t3,0
    while (isdigit(*s))
    1582:	04b66a63          	bltu	a2,a1,15d6 <atoi+0x8a>
    int n = 0, neg = 0;
    1586:	4501                	li	a0,0
    while (isdigit(*s))
    1588:	4825                	li	a6,9
    158a:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    158e:	0025179b          	slliw	a5,a0,0x2
    1592:	9d3d                	addw	a0,a0,a5
    1594:	fd07031b          	addiw	t1,a4,-48
    1598:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    159c:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15a0:	0685                	addi	a3,a3,1
    15a2:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15a6:	0006071b          	sext.w	a4,a2
    15aa:	feb870e3          	bgeu	a6,a1,158a <atoi+0x3e>
    return neg ? n : -n;
    15ae:	000e0563          	beqz	t3,15b8 <atoi+0x6c>
}
    15b2:	8082                	ret
        s++;
    15b4:	0505                	addi	a0,a0,1
    15b6:	bf71                	j	1552 <atoi+0x6>
    15b8:	4113053b          	subw	a0,t1,a7
    15bc:	8082                	ret
    while (isdigit(*s))
    15be:	00154783          	lbu	a5,1(a0)
    15c2:	4625                	li	a2,9
        s++;
    15c4:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    15c8:	fd07859b          	addiw	a1,a5,-48
    15cc:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    15d0:	4e01                	li	t3,0
    while (isdigit(*s))
    15d2:	fab67ae3          	bgeu	a2,a1,1586 <atoi+0x3a>
    15d6:	4501                	li	a0,0
}
    15d8:	8082                	ret
    while (isdigit(*s))
    15da:	00154783          	lbu	a5,1(a0)
    15de:	4625                	li	a2,9
        s++;
    15e0:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    15e4:	fd07859b          	addiw	a1,a5,-48
    15e8:	0007871b          	sext.w	a4,a5
    15ec:	feb665e3          	bltu	a2,a1,15d6 <atoi+0x8a>
        neg = 1;
    15f0:	4e05                	li	t3,1
    15f2:	bf51                	j	1586 <atoi+0x3a>

00000000000015f4 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    15f4:	16060d63          	beqz	a2,176e <memset+0x17a>
    15f8:	40a007b3          	neg	a5,a0
    15fc:	8b9d                	andi	a5,a5,7
    15fe:	00778713          	addi	a4,a5,7
    1602:	482d                	li	a6,11
    1604:	0ff5f593          	andi	a1,a1,255
    1608:	fff60693          	addi	a3,a2,-1
    160c:	17076263          	bltu	a4,a6,1770 <memset+0x17c>
    1610:	16e6ea63          	bltu	a3,a4,1784 <memset+0x190>
    1614:	16078563          	beqz	a5,177e <memset+0x18a>
    1618:	00b50023          	sb	a1,0(a0)
    161c:	4705                	li	a4,1
    161e:	00150e93          	addi	t4,a0,1
    1622:	14e78c63          	beq	a5,a4,177a <memset+0x186>
    1626:	00b500a3          	sb	a1,1(a0)
    162a:	4709                	li	a4,2
    162c:	00250e93          	addi	t4,a0,2
    1630:	14e78d63          	beq	a5,a4,178a <memset+0x196>
    1634:	00b50123          	sb	a1,2(a0)
    1638:	470d                	li	a4,3
    163a:	00350e93          	addi	t4,a0,3
    163e:	12e78b63          	beq	a5,a4,1774 <memset+0x180>
    1642:	00b501a3          	sb	a1,3(a0)
    1646:	4711                	li	a4,4
    1648:	00450e93          	addi	t4,a0,4
    164c:	14e78163          	beq	a5,a4,178e <memset+0x19a>
    1650:	00b50223          	sb	a1,4(a0)
    1654:	4715                	li	a4,5
    1656:	00550e93          	addi	t4,a0,5
    165a:	12e78c63          	beq	a5,a4,1792 <memset+0x19e>
    165e:	00b502a3          	sb	a1,5(a0)
    1662:	471d                	li	a4,7
    1664:	00650e93          	addi	t4,a0,6
    1668:	12e79763          	bne	a5,a4,1796 <memset+0x1a2>
    166c:	00750e93          	addi	t4,a0,7
    1670:	00b50323          	sb	a1,6(a0)
    1674:	4f1d                	li	t5,7
    1676:	00859713          	slli	a4,a1,0x8
    167a:	8f4d                	or	a4,a4,a1
    167c:	01059e13          	slli	t3,a1,0x10
    1680:	01c76e33          	or	t3,a4,t3
    1684:	01859313          	slli	t1,a1,0x18
    1688:	006e6333          	or	t1,t3,t1
    168c:	02059893          	slli	a7,a1,0x20
    1690:	011368b3          	or	a7,t1,a7
    1694:	02859813          	slli	a6,a1,0x28
    1698:	40f60333          	sub	t1,a2,a5
    169c:	0108e833          	or	a6,a7,a6
    16a0:	03059693          	slli	a3,a1,0x30
    16a4:	00d866b3          	or	a3,a6,a3
    16a8:	03859713          	slli	a4,a1,0x38
    16ac:	97aa                	add	a5,a5,a0
    16ae:	ff837813          	andi	a6,t1,-8
    16b2:	8f55                	or	a4,a4,a3
    16b4:	00f806b3          	add	a3,a6,a5
    16b8:	e398                	sd	a4,0(a5)
    16ba:	07a1                	addi	a5,a5,8
    16bc:	fed79ee3          	bne	a5,a3,16b8 <memset+0xc4>
    16c0:	ff837693          	andi	a3,t1,-8
    16c4:	00de87b3          	add	a5,t4,a3
    16c8:	01e6873b          	addw	a4,a3,t5
    16cc:	0ad30663          	beq	t1,a3,1778 <memset+0x184>
    16d0:	00b78023          	sb	a1,0(a5)
    16d4:	0017069b          	addiw	a3,a4,1
    16d8:	08c6fb63          	bgeu	a3,a2,176e <memset+0x17a>
    16dc:	00b780a3          	sb	a1,1(a5)
    16e0:	0027069b          	addiw	a3,a4,2
    16e4:	08c6f563          	bgeu	a3,a2,176e <memset+0x17a>
    16e8:	00b78123          	sb	a1,2(a5)
    16ec:	0037069b          	addiw	a3,a4,3
    16f0:	06c6ff63          	bgeu	a3,a2,176e <memset+0x17a>
    16f4:	00b781a3          	sb	a1,3(a5)
    16f8:	0047069b          	addiw	a3,a4,4
    16fc:	06c6f963          	bgeu	a3,a2,176e <memset+0x17a>
    1700:	00b78223          	sb	a1,4(a5)
    1704:	0057069b          	addiw	a3,a4,5
    1708:	06c6f363          	bgeu	a3,a2,176e <memset+0x17a>
    170c:	00b782a3          	sb	a1,5(a5)
    1710:	0067069b          	addiw	a3,a4,6
    1714:	04c6fd63          	bgeu	a3,a2,176e <memset+0x17a>
    1718:	00b78323          	sb	a1,6(a5)
    171c:	0077069b          	addiw	a3,a4,7
    1720:	04c6f763          	bgeu	a3,a2,176e <memset+0x17a>
    1724:	00b783a3          	sb	a1,7(a5)
    1728:	0087069b          	addiw	a3,a4,8
    172c:	04c6f163          	bgeu	a3,a2,176e <memset+0x17a>
    1730:	00b78423          	sb	a1,8(a5)
    1734:	0097069b          	addiw	a3,a4,9
    1738:	02c6fb63          	bgeu	a3,a2,176e <memset+0x17a>
    173c:	00b784a3          	sb	a1,9(a5)
    1740:	00a7069b          	addiw	a3,a4,10
    1744:	02c6f563          	bgeu	a3,a2,176e <memset+0x17a>
    1748:	00b78523          	sb	a1,10(a5)
    174c:	00b7069b          	addiw	a3,a4,11
    1750:	00c6ff63          	bgeu	a3,a2,176e <memset+0x17a>
    1754:	00b785a3          	sb	a1,11(a5)
    1758:	00c7069b          	addiw	a3,a4,12
    175c:	00c6f963          	bgeu	a3,a2,176e <memset+0x17a>
    1760:	00b78623          	sb	a1,12(a5)
    1764:	2735                	addiw	a4,a4,13
    1766:	00c77463          	bgeu	a4,a2,176e <memset+0x17a>
    176a:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    176e:	8082                	ret
    1770:	472d                	li	a4,11
    1772:	bd79                	j	1610 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1774:	4f0d                	li	t5,3
    1776:	b701                	j	1676 <memset+0x82>
    1778:	8082                	ret
    177a:	4f05                	li	t5,1
    177c:	bded                	j	1676 <memset+0x82>
    177e:	8eaa                	mv	t4,a0
    1780:	4f01                	li	t5,0
    1782:	bdd5                	j	1676 <memset+0x82>
    1784:	87aa                	mv	a5,a0
    1786:	4701                	li	a4,0
    1788:	b7a1                	j	16d0 <memset+0xdc>
    178a:	4f09                	li	t5,2
    178c:	b5ed                	j	1676 <memset+0x82>
    178e:	4f11                	li	t5,4
    1790:	b5dd                	j	1676 <memset+0x82>
    1792:	4f15                	li	t5,5
    1794:	b5cd                	j	1676 <memset+0x82>
    1796:	4f19                	li	t5,6
    1798:	bdf9                	j	1676 <memset+0x82>

000000000000179a <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    179a:	00054783          	lbu	a5,0(a0)
    179e:	0005c703          	lbu	a4,0(a1)
    17a2:	00e79863          	bne	a5,a4,17b2 <strcmp+0x18>
    17a6:	0505                	addi	a0,a0,1
    17a8:	0585                	addi	a1,a1,1
    17aa:	fbe5                	bnez	a5,179a <strcmp>
    17ac:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17ae:	9d19                	subw	a0,a0,a4
    17b0:	8082                	ret
    17b2:	0007851b          	sext.w	a0,a5
    17b6:	bfe5                	j	17ae <strcmp+0x14>

00000000000017b8 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17b8:	ce05                	beqz	a2,17f0 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17ba:	00054703          	lbu	a4,0(a0)
    17be:	0005c783          	lbu	a5,0(a1)
    17c2:	cb0d                	beqz	a4,17f4 <strncmp+0x3c>
    if (!n--)
    17c4:	167d                	addi	a2,a2,-1
    17c6:	00c506b3          	add	a3,a0,a2
    17ca:	a819                	j	17e0 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17cc:	00a68e63          	beq	a3,a0,17e8 <strncmp+0x30>
    17d0:	0505                	addi	a0,a0,1
    17d2:	00e79b63          	bne	a5,a4,17e8 <strncmp+0x30>
    17d6:	00054703          	lbu	a4,0(a0)
    17da:	0005c783          	lbu	a5,0(a1)
    17de:	cb19                	beqz	a4,17f4 <strncmp+0x3c>
    17e0:	0005c783          	lbu	a5,0(a1)
    17e4:	0585                	addi	a1,a1,1
    17e6:	f3fd                	bnez	a5,17cc <strncmp+0x14>
        ;
    return *l - *r;
    17e8:	0007051b          	sext.w	a0,a4
    17ec:	9d1d                	subw	a0,a0,a5
    17ee:	8082                	ret
        return 0;
    17f0:	4501                	li	a0,0
}
    17f2:	8082                	ret
    17f4:	4501                	li	a0,0
    return *l - *r;
    17f6:	9d1d                	subw	a0,a0,a5
    17f8:	8082                	ret

00000000000017fa <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    17fa:	00757793          	andi	a5,a0,7
    17fe:	cf89                	beqz	a5,1818 <strlen+0x1e>
    1800:	87aa                	mv	a5,a0
    1802:	a029                	j	180c <strlen+0x12>
    1804:	0785                	addi	a5,a5,1
    1806:	0077f713          	andi	a4,a5,7
    180a:	cb01                	beqz	a4,181a <strlen+0x20>
        if (!*s)
    180c:	0007c703          	lbu	a4,0(a5)
    1810:	fb75                	bnez	a4,1804 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1812:	40a78533          	sub	a0,a5,a0
}
    1816:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1818:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    181a:	6394                	ld	a3,0(a5)
    181c:	00000597          	auipc	a1,0x0
    1820:	69c5b583          	ld	a1,1692(a1) # 1eb8 <__clone+0xa2>
    1824:	00000617          	auipc	a2,0x0
    1828:	69c63603          	ld	a2,1692(a2) # 1ec0 <__clone+0xaa>
    182c:	a019                	j	1832 <strlen+0x38>
    182e:	6794                	ld	a3,8(a5)
    1830:	07a1                	addi	a5,a5,8
    1832:	00b68733          	add	a4,a3,a1
    1836:	fff6c693          	not	a3,a3
    183a:	8f75                	and	a4,a4,a3
    183c:	8f71                	and	a4,a4,a2
    183e:	db65                	beqz	a4,182e <strlen+0x34>
    for (; *s; s++)
    1840:	0007c703          	lbu	a4,0(a5)
    1844:	d779                	beqz	a4,1812 <strlen+0x18>
    1846:	0017c703          	lbu	a4,1(a5)
    184a:	0785                	addi	a5,a5,1
    184c:	d379                	beqz	a4,1812 <strlen+0x18>
    184e:	0017c703          	lbu	a4,1(a5)
    1852:	0785                	addi	a5,a5,1
    1854:	fb6d                	bnez	a4,1846 <strlen+0x4c>
    1856:	bf75                	j	1812 <strlen+0x18>

0000000000001858 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1858:	00757713          	andi	a4,a0,7
{
    185c:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    185e:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1862:	cb19                	beqz	a4,1878 <memchr+0x20>
    1864:	ce25                	beqz	a2,18dc <memchr+0x84>
    1866:	0007c703          	lbu	a4,0(a5)
    186a:	04b70e63          	beq	a4,a1,18c6 <memchr+0x6e>
    186e:	0785                	addi	a5,a5,1
    1870:	0077f713          	andi	a4,a5,7
    1874:	167d                	addi	a2,a2,-1
    1876:	f77d                	bnez	a4,1864 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1878:	4501                	li	a0,0
    if (n && *s != c)
    187a:	c235                	beqz	a2,18de <memchr+0x86>
    187c:	0007c703          	lbu	a4,0(a5)
    1880:	04b70363          	beq	a4,a1,18c6 <memchr+0x6e>
        size_t k = ONES * c;
    1884:	00000517          	auipc	a0,0x0
    1888:	64453503          	ld	a0,1604(a0) # 1ec8 <__clone+0xb2>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    188c:	471d                	li	a4,7
        size_t k = ONES * c;
    188e:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1892:	02c77a63          	bgeu	a4,a2,18c6 <memchr+0x6e>
    1896:	00000897          	auipc	a7,0x0
    189a:	6228b883          	ld	a7,1570(a7) # 1eb8 <__clone+0xa2>
    189e:	00000817          	auipc	a6,0x0
    18a2:	62283803          	ld	a6,1570(a6) # 1ec0 <__clone+0xaa>
    18a6:	431d                	li	t1,7
    18a8:	a029                	j	18b2 <memchr+0x5a>
    18aa:	1661                	addi	a2,a2,-8
    18ac:	07a1                	addi	a5,a5,8
    18ae:	02c37963          	bgeu	t1,a2,18e0 <memchr+0x88>
    18b2:	6398                	ld	a4,0(a5)
    18b4:	8f29                	xor	a4,a4,a0
    18b6:	011706b3          	add	a3,a4,a7
    18ba:	fff74713          	not	a4,a4
    18be:	8f75                	and	a4,a4,a3
    18c0:	01077733          	and	a4,a4,a6
    18c4:	d37d                	beqz	a4,18aa <memchr+0x52>
    18c6:	853e                	mv	a0,a5
    18c8:	97b2                	add	a5,a5,a2
    18ca:	a021                	j	18d2 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    18cc:	0505                	addi	a0,a0,1
    18ce:	00f50763          	beq	a0,a5,18dc <memchr+0x84>
    18d2:	00054703          	lbu	a4,0(a0)
    18d6:	feb71be3          	bne	a4,a1,18cc <memchr+0x74>
    18da:	8082                	ret
    return n ? (void *)s : 0;
    18dc:	4501                	li	a0,0
}
    18de:	8082                	ret
    return n ? (void *)s : 0;
    18e0:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    18e2:	f275                	bnez	a2,18c6 <memchr+0x6e>
}
    18e4:	8082                	ret

00000000000018e6 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    18e6:	1101                	addi	sp,sp,-32
    18e8:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    18ea:	862e                	mv	a2,a1
{
    18ec:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    18ee:	4581                	li	a1,0
{
    18f0:	e426                	sd	s1,8(sp)
    18f2:	ec06                	sd	ra,24(sp)
    18f4:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    18f6:	f63ff0ef          	jal	ra,1858 <memchr>
    return p ? p - s : n;
    18fa:	c519                	beqz	a0,1908 <strnlen+0x22>
}
    18fc:	60e2                	ld	ra,24(sp)
    18fe:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1900:	8d05                	sub	a0,a0,s1
}
    1902:	64a2                	ld	s1,8(sp)
    1904:	6105                	addi	sp,sp,32
    1906:	8082                	ret
    1908:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    190a:	8522                	mv	a0,s0
}
    190c:	6442                	ld	s0,16(sp)
    190e:	64a2                	ld	s1,8(sp)
    1910:	6105                	addi	sp,sp,32
    1912:	8082                	ret

0000000000001914 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1914:	00b547b3          	xor	a5,a0,a1
    1918:	8b9d                	andi	a5,a5,7
    191a:	eb95                	bnez	a5,194e <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    191c:	0075f793          	andi	a5,a1,7
    1920:	e7b1                	bnez	a5,196c <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1922:	6198                	ld	a4,0(a1)
    1924:	00000617          	auipc	a2,0x0
    1928:	59463603          	ld	a2,1428(a2) # 1eb8 <__clone+0xa2>
    192c:	00000817          	auipc	a6,0x0
    1930:	59483803          	ld	a6,1428(a6) # 1ec0 <__clone+0xaa>
    1934:	a029                	j	193e <strcpy+0x2a>
    1936:	e118                	sd	a4,0(a0)
    1938:	6598                	ld	a4,8(a1)
    193a:	05a1                	addi	a1,a1,8
    193c:	0521                	addi	a0,a0,8
    193e:	00c707b3          	add	a5,a4,a2
    1942:	fff74693          	not	a3,a4
    1946:	8ff5                	and	a5,a5,a3
    1948:	0107f7b3          	and	a5,a5,a6
    194c:	d7ed                	beqz	a5,1936 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    194e:	0005c783          	lbu	a5,0(a1)
    1952:	00f50023          	sb	a5,0(a0)
    1956:	c785                	beqz	a5,197e <strcpy+0x6a>
    1958:	0015c783          	lbu	a5,1(a1)
    195c:	0505                	addi	a0,a0,1
    195e:	0585                	addi	a1,a1,1
    1960:	00f50023          	sb	a5,0(a0)
    1964:	fbf5                	bnez	a5,1958 <strcpy+0x44>
        ;
    return d;
}
    1966:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1968:	0505                	addi	a0,a0,1
    196a:	df45                	beqz	a4,1922 <strcpy+0xe>
            if (!(*d = *s))
    196c:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1970:	0585                	addi	a1,a1,1
    1972:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1976:	00f50023          	sb	a5,0(a0)
    197a:	f7fd                	bnez	a5,1968 <strcpy+0x54>
}
    197c:	8082                	ret
    197e:	8082                	ret

0000000000001980 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1980:	00b547b3          	xor	a5,a0,a1
    1984:	8b9d                	andi	a5,a5,7
    1986:	1a079863          	bnez	a5,1b36 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    198a:	0075f793          	andi	a5,a1,7
    198e:	16078463          	beqz	a5,1af6 <strncpy+0x176>
    1992:	ea01                	bnez	a2,19a2 <strncpy+0x22>
    1994:	a421                	j	1b9c <strncpy+0x21c>
    1996:	167d                	addi	a2,a2,-1
    1998:	0505                	addi	a0,a0,1
    199a:	14070e63          	beqz	a4,1af6 <strncpy+0x176>
    199e:	1a060863          	beqz	a2,1b4e <strncpy+0x1ce>
    19a2:	0005c783          	lbu	a5,0(a1)
    19a6:	0585                	addi	a1,a1,1
    19a8:	0075f713          	andi	a4,a1,7
    19ac:	00f50023          	sb	a5,0(a0)
    19b0:	f3fd                	bnez	a5,1996 <strncpy+0x16>
    19b2:	4805                	li	a6,1
    19b4:	1a061863          	bnez	a2,1b64 <strncpy+0x1e4>
    19b8:	40a007b3          	neg	a5,a0
    19bc:	8b9d                	andi	a5,a5,7
    19be:	4681                	li	a3,0
    19c0:	18061a63          	bnez	a2,1b54 <strncpy+0x1d4>
    19c4:	00778713          	addi	a4,a5,7
    19c8:	45ad                	li	a1,11
    19ca:	18b76363          	bltu	a4,a1,1b50 <strncpy+0x1d0>
    19ce:	1ae6eb63          	bltu	a3,a4,1b84 <strncpy+0x204>
    19d2:	1a078363          	beqz	a5,1b78 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    19d6:	00050023          	sb	zero,0(a0)
    19da:	4685                	li	a3,1
    19dc:	00150713          	addi	a4,a0,1
    19e0:	18d78f63          	beq	a5,a3,1b7e <strncpy+0x1fe>
    19e4:	000500a3          	sb	zero,1(a0)
    19e8:	4689                	li	a3,2
    19ea:	00250713          	addi	a4,a0,2
    19ee:	18d78e63          	beq	a5,a3,1b8a <strncpy+0x20a>
    19f2:	00050123          	sb	zero,2(a0)
    19f6:	468d                	li	a3,3
    19f8:	00350713          	addi	a4,a0,3
    19fc:	16d78c63          	beq	a5,a3,1b74 <strncpy+0x1f4>
    1a00:	000501a3          	sb	zero,3(a0)
    1a04:	4691                	li	a3,4
    1a06:	00450713          	addi	a4,a0,4
    1a0a:	18d78263          	beq	a5,a3,1b8e <strncpy+0x20e>
    1a0e:	00050223          	sb	zero,4(a0)
    1a12:	4695                	li	a3,5
    1a14:	00550713          	addi	a4,a0,5
    1a18:	16d78d63          	beq	a5,a3,1b92 <strncpy+0x212>
    1a1c:	000502a3          	sb	zero,5(a0)
    1a20:	469d                	li	a3,7
    1a22:	00650713          	addi	a4,a0,6
    1a26:	16d79863          	bne	a5,a3,1b96 <strncpy+0x216>
    1a2a:	00750713          	addi	a4,a0,7
    1a2e:	00050323          	sb	zero,6(a0)
    1a32:	40f80833          	sub	a6,a6,a5
    1a36:	ff887593          	andi	a1,a6,-8
    1a3a:	97aa                	add	a5,a5,a0
    1a3c:	95be                	add	a1,a1,a5
    1a3e:	0007b023          	sd	zero,0(a5)
    1a42:	07a1                	addi	a5,a5,8
    1a44:	feb79de3          	bne	a5,a1,1a3e <strncpy+0xbe>
    1a48:	ff887593          	andi	a1,a6,-8
    1a4c:	9ead                	addw	a3,a3,a1
    1a4e:	00b707b3          	add	a5,a4,a1
    1a52:	12b80863          	beq	a6,a1,1b82 <strncpy+0x202>
    1a56:	00078023          	sb	zero,0(a5)
    1a5a:	0016871b          	addiw	a4,a3,1
    1a5e:	0ec77863          	bgeu	a4,a2,1b4e <strncpy+0x1ce>
    1a62:	000780a3          	sb	zero,1(a5)
    1a66:	0026871b          	addiw	a4,a3,2
    1a6a:	0ec77263          	bgeu	a4,a2,1b4e <strncpy+0x1ce>
    1a6e:	00078123          	sb	zero,2(a5)
    1a72:	0036871b          	addiw	a4,a3,3
    1a76:	0cc77c63          	bgeu	a4,a2,1b4e <strncpy+0x1ce>
    1a7a:	000781a3          	sb	zero,3(a5)
    1a7e:	0046871b          	addiw	a4,a3,4
    1a82:	0cc77663          	bgeu	a4,a2,1b4e <strncpy+0x1ce>
    1a86:	00078223          	sb	zero,4(a5)
    1a8a:	0056871b          	addiw	a4,a3,5
    1a8e:	0cc77063          	bgeu	a4,a2,1b4e <strncpy+0x1ce>
    1a92:	000782a3          	sb	zero,5(a5)
    1a96:	0066871b          	addiw	a4,a3,6
    1a9a:	0ac77a63          	bgeu	a4,a2,1b4e <strncpy+0x1ce>
    1a9e:	00078323          	sb	zero,6(a5)
    1aa2:	0076871b          	addiw	a4,a3,7
    1aa6:	0ac77463          	bgeu	a4,a2,1b4e <strncpy+0x1ce>
    1aaa:	000783a3          	sb	zero,7(a5)
    1aae:	0086871b          	addiw	a4,a3,8
    1ab2:	08c77e63          	bgeu	a4,a2,1b4e <strncpy+0x1ce>
    1ab6:	00078423          	sb	zero,8(a5)
    1aba:	0096871b          	addiw	a4,a3,9
    1abe:	08c77863          	bgeu	a4,a2,1b4e <strncpy+0x1ce>
    1ac2:	000784a3          	sb	zero,9(a5)
    1ac6:	00a6871b          	addiw	a4,a3,10
    1aca:	08c77263          	bgeu	a4,a2,1b4e <strncpy+0x1ce>
    1ace:	00078523          	sb	zero,10(a5)
    1ad2:	00b6871b          	addiw	a4,a3,11
    1ad6:	06c77c63          	bgeu	a4,a2,1b4e <strncpy+0x1ce>
    1ada:	000785a3          	sb	zero,11(a5)
    1ade:	00c6871b          	addiw	a4,a3,12
    1ae2:	06c77663          	bgeu	a4,a2,1b4e <strncpy+0x1ce>
    1ae6:	00078623          	sb	zero,12(a5)
    1aea:	26b5                	addiw	a3,a3,13
    1aec:	06c6f163          	bgeu	a3,a2,1b4e <strncpy+0x1ce>
    1af0:	000786a3          	sb	zero,13(a5)
    1af4:	8082                	ret
            ;
        if (!n || !*s)
    1af6:	c645                	beqz	a2,1b9e <strncpy+0x21e>
    1af8:	0005c783          	lbu	a5,0(a1)
    1afc:	ea078be3          	beqz	a5,19b2 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b00:	479d                	li	a5,7
    1b02:	02c7ff63          	bgeu	a5,a2,1b40 <strncpy+0x1c0>
    1b06:	00000897          	auipc	a7,0x0
    1b0a:	3b28b883          	ld	a7,946(a7) # 1eb8 <__clone+0xa2>
    1b0e:	00000817          	auipc	a6,0x0
    1b12:	3b283803          	ld	a6,946(a6) # 1ec0 <__clone+0xaa>
    1b16:	431d                	li	t1,7
    1b18:	6198                	ld	a4,0(a1)
    1b1a:	011707b3          	add	a5,a4,a7
    1b1e:	fff74693          	not	a3,a4
    1b22:	8ff5                	and	a5,a5,a3
    1b24:	0107f7b3          	and	a5,a5,a6
    1b28:	ef81                	bnez	a5,1b40 <strncpy+0x1c0>
            *wd = *ws;
    1b2a:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b2c:	1661                	addi	a2,a2,-8
    1b2e:	05a1                	addi	a1,a1,8
    1b30:	0521                	addi	a0,a0,8
    1b32:	fec363e3          	bltu	t1,a2,1b18 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b36:	e609                	bnez	a2,1b40 <strncpy+0x1c0>
    1b38:	a08d                	j	1b9a <strncpy+0x21a>
    1b3a:	167d                	addi	a2,a2,-1
    1b3c:	0505                	addi	a0,a0,1
    1b3e:	ca01                	beqz	a2,1b4e <strncpy+0x1ce>
    1b40:	0005c783          	lbu	a5,0(a1)
    1b44:	0585                	addi	a1,a1,1
    1b46:	00f50023          	sb	a5,0(a0)
    1b4a:	fbe5                	bnez	a5,1b3a <strncpy+0x1ba>
        ;
tail:
    1b4c:	b59d                	j	19b2 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1b4e:	8082                	ret
    1b50:	472d                	li	a4,11
    1b52:	bdb5                	j	19ce <strncpy+0x4e>
    1b54:	00778713          	addi	a4,a5,7
    1b58:	45ad                	li	a1,11
    1b5a:	fff60693          	addi	a3,a2,-1
    1b5e:	e6b778e3          	bgeu	a4,a1,19ce <strncpy+0x4e>
    1b62:	b7fd                	j	1b50 <strncpy+0x1d0>
    1b64:	40a007b3          	neg	a5,a0
    1b68:	8832                	mv	a6,a2
    1b6a:	8b9d                	andi	a5,a5,7
    1b6c:	4681                	li	a3,0
    1b6e:	e4060be3          	beqz	a2,19c4 <strncpy+0x44>
    1b72:	b7cd                	j	1b54 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b74:	468d                	li	a3,3
    1b76:	bd75                	j	1a32 <strncpy+0xb2>
    1b78:	872a                	mv	a4,a0
    1b7a:	4681                	li	a3,0
    1b7c:	bd5d                	j	1a32 <strncpy+0xb2>
    1b7e:	4685                	li	a3,1
    1b80:	bd4d                	j	1a32 <strncpy+0xb2>
    1b82:	8082                	ret
    1b84:	87aa                	mv	a5,a0
    1b86:	4681                	li	a3,0
    1b88:	b5f9                	j	1a56 <strncpy+0xd6>
    1b8a:	4689                	li	a3,2
    1b8c:	b55d                	j	1a32 <strncpy+0xb2>
    1b8e:	4691                	li	a3,4
    1b90:	b54d                	j	1a32 <strncpy+0xb2>
    1b92:	4695                	li	a3,5
    1b94:	bd79                	j	1a32 <strncpy+0xb2>
    1b96:	4699                	li	a3,6
    1b98:	bd69                	j	1a32 <strncpy+0xb2>
    1b9a:	8082                	ret
    1b9c:	8082                	ret
    1b9e:	8082                	ret

0000000000001ba0 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1ba0:	87aa                	mv	a5,a0
    1ba2:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1ba4:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1ba8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1bac:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1bae:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bb0:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1bb4:	2501                	sext.w	a0,a0
    1bb6:	8082                	ret

0000000000001bb8 <openat>:
    register long a7 __asm__("a7") = n;
    1bb8:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1bbc:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bc0:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1bc4:	2501                	sext.w	a0,a0
    1bc6:	8082                	ret

0000000000001bc8 <close>:
    register long a7 __asm__("a7") = n;
    1bc8:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1bcc:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1bd0:	2501                	sext.w	a0,a0
    1bd2:	8082                	ret

0000000000001bd4 <read>:
    register long a7 __asm__("a7") = n;
    1bd4:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1bd8:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1bdc:	8082                	ret

0000000000001bde <write>:
    register long a7 __asm__("a7") = n;
    1bde:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1be2:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1be6:	8082                	ret

0000000000001be8 <getpid>:
    register long a7 __asm__("a7") = n;
    1be8:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1bec:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1bf0:	2501                	sext.w	a0,a0
    1bf2:	8082                	ret

0000000000001bf4 <getppid>:
    register long a7 __asm__("a7") = n;
    1bf4:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1bf8:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1bfc:	2501                	sext.w	a0,a0
    1bfe:	8082                	ret

0000000000001c00 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c00:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c04:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c08:	2501                	sext.w	a0,a0
    1c0a:	8082                	ret

0000000000001c0c <fork>:
    register long a7 __asm__("a7") = n;
    1c0c:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c10:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c12:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c14:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c18:	2501                	sext.w	a0,a0
    1c1a:	8082                	ret

0000000000001c1c <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c1c:	85b2                	mv	a1,a2
    1c1e:	863a                	mv	a2,a4
    if (stack)
    1c20:	c191                	beqz	a1,1c24 <clone+0x8>
	stack += stack_size;
    1c22:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c24:	4781                	li	a5,0
    1c26:	4701                	li	a4,0
    1c28:	4681                	li	a3,0
    1c2a:	2601                	sext.w	a2,a2
    1c2c:	a2ed                	j	1e16 <__clone>

0000000000001c2e <exit>:
    register long a7 __asm__("a7") = n;
    1c2e:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c32:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c36:	8082                	ret

0000000000001c38 <waitpid>:
    register long a7 __asm__("a7") = n;
    1c38:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c3c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c3e:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c42:	2501                	sext.w	a0,a0
    1c44:	8082                	ret

0000000000001c46 <exec>:
    register long a7 __asm__("a7") = n;
    1c46:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1c4a:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1c4e:	2501                	sext.w	a0,a0
    1c50:	8082                	ret

0000000000001c52 <execve>:
    register long a7 __asm__("a7") = n;
    1c52:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c56:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1c5a:	2501                	sext.w	a0,a0
    1c5c:	8082                	ret

0000000000001c5e <times>:
    register long a7 __asm__("a7") = n;
    1c5e:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1c62:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1c66:	2501                	sext.w	a0,a0
    1c68:	8082                	ret

0000000000001c6a <get_time>:

int64 get_time()
{
    1c6a:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1c6c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1c70:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1c72:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c74:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1c78:	2501                	sext.w	a0,a0
    1c7a:	ed09                	bnez	a0,1c94 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1c7c:	67a2                	ld	a5,8(sp)
    1c7e:	3e800713          	li	a4,1000
    1c82:	00015503          	lhu	a0,0(sp)
    1c86:	02e7d7b3          	divu	a5,a5,a4
    1c8a:	02e50533          	mul	a0,a0,a4
    1c8e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1c90:	0141                	addi	sp,sp,16
    1c92:	8082                	ret
        return -1;
    1c94:	557d                	li	a0,-1
    1c96:	bfed                	j	1c90 <get_time+0x26>

0000000000001c98 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1c98:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c9c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1ca0:	2501                	sext.w	a0,a0
    1ca2:	8082                	ret

0000000000001ca4 <time>:
    register long a7 __asm__("a7") = n;
    1ca4:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1ca8:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1cac:	2501                	sext.w	a0,a0
    1cae:	8082                	ret

0000000000001cb0 <sleep>:

int sleep(unsigned long long time)
{
    1cb0:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1cb2:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1cb4:	850a                	mv	a0,sp
    1cb6:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1cb8:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1cbc:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cbe:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1cc2:	e501                	bnez	a0,1cca <sleep+0x1a>
    return 0;
    1cc4:	4501                	li	a0,0
}
    1cc6:	0141                	addi	sp,sp,16
    1cc8:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1cca:	4502                	lw	a0,0(sp)
}
    1ccc:	0141                	addi	sp,sp,16
    1cce:	8082                	ret

0000000000001cd0 <set_priority>:
    register long a7 __asm__("a7") = n;
    1cd0:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1cd4:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1cd8:	2501                	sext.w	a0,a0
    1cda:	8082                	ret

0000000000001cdc <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1cdc:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1ce0:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1ce4:	8082                	ret

0000000000001ce6 <munmap>:
    register long a7 __asm__("a7") = n;
    1ce6:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cea:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1cee:	2501                	sext.w	a0,a0
    1cf0:	8082                	ret

0000000000001cf2 <wait>:

int wait(int *code)
{
    1cf2:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1cf4:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1cf8:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1cfa:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1cfc:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cfe:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d02:	2501                	sext.w	a0,a0
    1d04:	8082                	ret

0000000000001d06 <spawn>:
    register long a7 __asm__("a7") = n;
    1d06:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d0a:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d0e:	2501                	sext.w	a0,a0
    1d10:	8082                	ret

0000000000001d12 <mailread>:
    register long a7 __asm__("a7") = n;
    1d12:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d16:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d1a:	2501                	sext.w	a0,a0
    1d1c:	8082                	ret

0000000000001d1e <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d1e:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d22:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d26:	2501                	sext.w	a0,a0
    1d28:	8082                	ret

0000000000001d2a <fstat>:
    register long a7 __asm__("a7") = n;
    1d2a:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d2e:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d32:	2501                	sext.w	a0,a0
    1d34:	8082                	ret

0000000000001d36 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d36:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d38:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d3c:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d3e:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d42:	2501                	sext.w	a0,a0
    1d44:	8082                	ret

0000000000001d46 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1d46:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d48:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1d4c:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d4e:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1d52:	2501                	sext.w	a0,a0
    1d54:	8082                	ret

0000000000001d56 <link>:

int link(char *old_path, char *new_path)
{
    1d56:	87aa                	mv	a5,a0
    1d58:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1d5a:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1d5e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d62:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1d64:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1d68:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d6a:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1d6e:	2501                	sext.w	a0,a0
    1d70:	8082                	ret

0000000000001d72 <unlink>:

int unlink(char *path)
{
    1d72:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d74:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1d78:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1d7c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d7e:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1d82:	2501                	sext.w	a0,a0
    1d84:	8082                	ret

0000000000001d86 <uname>:
    register long a7 __asm__("a7") = n;
    1d86:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1d8a:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1d8e:	2501                	sext.w	a0,a0
    1d90:	8082                	ret

0000000000001d92 <brk>:
    register long a7 __asm__("a7") = n;
    1d92:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1d96:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1d9a:	2501                	sext.w	a0,a0
    1d9c:	8082                	ret

0000000000001d9e <getcwd>:
    register long a7 __asm__("a7") = n;
    1d9e:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1da0:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1da4:	8082                	ret

0000000000001da6 <chdir>:
    register long a7 __asm__("a7") = n;
    1da6:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1daa:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1dae:	2501                	sext.w	a0,a0
    1db0:	8082                	ret

0000000000001db2 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1db2:	862e                	mv	a2,a1
    1db4:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1db6:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1db8:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1dbc:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dc0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dc2:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc4:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1dc8:	2501                	sext.w	a0,a0
    1dca:	8082                	ret

0000000000001dcc <getdents>:
    register long a7 __asm__("a7") = n;
    1dcc:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd0:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1dd4:	2501                	sext.w	a0,a0
    1dd6:	8082                	ret

0000000000001dd8 <pipe>:
    register long a7 __asm__("a7") = n;
    1dd8:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ddc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dde:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1de2:	2501                	sext.w	a0,a0
    1de4:	8082                	ret

0000000000001de6 <dup>:
    register long a7 __asm__("a7") = n;
    1de6:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1de8:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1dec:	2501                	sext.w	a0,a0
    1dee:	8082                	ret

0000000000001df0 <dup2>:
    register long a7 __asm__("a7") = n;
    1df0:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1df2:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df4:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1df8:	2501                	sext.w	a0,a0
    1dfa:	8082                	ret

0000000000001dfc <mount>:
    register long a7 __asm__("a7") = n;
    1dfc:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e00:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <umount>:
    register long a7 __asm__("a7") = n;
    1e08:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e0c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e0e:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e12:	2501                	sext.w	a0,a0
    1e14:	8082                	ret

0000000000001e16 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e16:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e18:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e1a:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e1c:	8532                	mv	a0,a2
	mv a2, a4
    1e1e:	863a                	mv	a2,a4
	mv a3, a5
    1e20:	86be                	mv	a3,a5
	mv a4, a6
    1e22:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e24:	0dc00893          	li	a7,220
	ecall
    1e28:	00000073          	ecall

	beqz a0, 1f
    1e2c:	c111                	beqz	a0,1e30 <__clone+0x1a>
	# Parent
	ret
    1e2e:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e30:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e32:	6522                	ld	a0,8(sp)
	jalr a1
    1e34:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e36:	05d00893          	li	a7,93
	ecall
    1e3a:	00000073          	ecall
