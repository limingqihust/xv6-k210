
/home/lmq/Desktop/xv6-k210/test/build/riscv64/getpid:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a061                	j	108a <__start_main>

0000000000001004 <test_getpid>:
/*
理想结果：得到进程 pid，注意要关注 pid 是否符合内核逻辑，不要单纯以 Test OK! 作为判断。
*/

int test_getpid()
{
    1004:	1101                	addi	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	e5250513          	addi	a0,a0,-430 # 1e58 <__clone+0x2c>
{
    100e:	ec06                	sd	ra,24(sp)
    TEST_START(__func__);
    1010:	278000ef          	jal	ra,1288 <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	edc50513          	addi	a0,a0,-292 # 1ef0 <__func__.1165>
    101c:	26c000ef          	jal	ra,1288 <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	e5050513          	addi	a0,a0,-432 # 1e70 <__clone+0x44>
    1028:	260000ef          	jal	ra,1288 <puts>
    int pid = getpid();
    102c:	3d3000ef          	jal	ra,1bfe <getpid>
    1030:	85aa                	mv	a1,a0
    assert(pid >= 0);
    1032:	02054b63          	bltz	a0,1068 <test_getpid+0x64>
    printf("getpid success.\npid = %d\n", pid);
    1036:	00001517          	auipc	a0,0x1
    103a:	e6a50513          	addi	a0,a0,-406 # 1ea0 <__clone+0x74>
    103e:	26c000ef          	jal	ra,12aa <printf>
    TEST_END(__func__);
    1042:	00001517          	auipc	a0,0x1
    1046:	e7e50513          	addi	a0,a0,-386 # 1ec0 <__clone+0x94>
    104a:	23e000ef          	jal	ra,1288 <puts>
    104e:	00001517          	auipc	a0,0x1
    1052:	ea250513          	addi	a0,a0,-350 # 1ef0 <__func__.1165>
    1056:	232000ef          	jal	ra,1288 <puts>
}
    105a:	60e2                	ld	ra,24(sp)
    TEST_END(__func__);
    105c:	00001517          	auipc	a0,0x1
    1060:	e1450513          	addi	a0,a0,-492 # 1e70 <__clone+0x44>
}
    1064:	6105                	addi	sp,sp,32
    TEST_END(__func__);
    1066:	a40d                	j	1288 <puts>
    1068:	e42a                	sd	a0,8(sp)
    assert(pid >= 0);
    106a:	00001517          	auipc	a0,0x1
    106e:	e1650513          	addi	a0,a0,-490 # 1e80 <__clone+0x54>
    1072:	4c0000ef          	jal	ra,1532 <panic>
    1076:	65a2                	ld	a1,8(sp)
    1078:	bf7d                	j	1036 <test_getpid+0x32>

000000000000107a <main>:

int main(void) {
    107a:	1141                	addi	sp,sp,-16
    107c:	e406                	sd	ra,8(sp)
	test_getpid();
    107e:	f87ff0ef          	jal	ra,1004 <test_getpid>
	return 0;
}
    1082:	60a2                	ld	ra,8(sp)
    1084:	4501                	li	a0,0
    1086:	0141                	addi	sp,sp,16
    1088:	8082                	ret

000000000000108a <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    108a:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    108c:	4108                	lw	a0,0(a0)
{
    108e:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1090:	05a1                	addi	a1,a1,8
{
    1092:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1094:	fe7ff0ef          	jal	ra,107a <main>
    1098:	3ad000ef          	jal	ra,1c44 <exit>
	return 0;
}
    109c:	60a2                	ld	ra,8(sp)
    109e:	4501                	li	a0,0
    10a0:	0141                	addi	sp,sp,16
    10a2:	8082                	ret

00000000000010a4 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10a4:	7179                	addi	sp,sp,-48
    10a6:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10a8:	12054b63          	bltz	a0,11de <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10ac:	02b577bb          	remuw	a5,a0,a1
    10b0:	00001697          	auipc	a3,0x1
    10b4:	e5068693          	addi	a3,a3,-432 # 1f00 <digits>
    buf[16] = 0;
    10b8:	00010c23          	sb	zero,24(sp)
    i = 15;
    10bc:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    10c0:	1782                	slli	a5,a5,0x20
    10c2:	9381                	srli	a5,a5,0x20
    10c4:	97b6                	add	a5,a5,a3
    10c6:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10ca:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10ce:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10d2:	16b56263          	bltu	a0,a1,1236 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    10d6:	02e8763b          	remuw	a2,a6,a4
    10da:	1602                	slli	a2,a2,0x20
    10dc:	9201                	srli	a2,a2,0x20
    10de:	9636                	add	a2,a2,a3
    10e0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10e4:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    10e8:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10ec:	12e86963          	bltu	a6,a4,121e <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    10f0:	02e5f63b          	remuw	a2,a1,a4
    10f4:	1602                	slli	a2,a2,0x20
    10f6:	9201                	srli	a2,a2,0x20
    10f8:	9636                	add	a2,a2,a3
    10fa:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10fe:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1102:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1106:	10e5ef63          	bltu	a1,a4,1224 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    110a:	02e8763b          	remuw	a2,a6,a4
    110e:	1602                	slli	a2,a2,0x20
    1110:	9201                	srli	a2,a2,0x20
    1112:	9636                	add	a2,a2,a3
    1114:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1118:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    111c:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1120:	10e86563          	bltu	a6,a4,122a <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    1124:	02e5f63b          	remuw	a2,a1,a4
    1128:	1602                	slli	a2,a2,0x20
    112a:	9201                	srli	a2,a2,0x20
    112c:	9636                	add	a2,a2,a3
    112e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1132:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1136:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    113a:	0ee5eb63          	bltu	a1,a4,1230 <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    113e:	02e8763b          	remuw	a2,a6,a4
    1142:	1602                	slli	a2,a2,0x20
    1144:	9201                	srli	a2,a2,0x20
    1146:	9636                	add	a2,a2,a3
    1148:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    114c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1150:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1154:	0ce86263          	bltu	a6,a4,1218 <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    1158:	02e5f63b          	remuw	a2,a1,a4
    115c:	1602                	slli	a2,a2,0x20
    115e:	9201                	srli	a2,a2,0x20
    1160:	9636                	add	a2,a2,a3
    1162:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1166:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    116a:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    116e:	0ce5e663          	bltu	a1,a4,123a <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    1172:	02e8763b          	remuw	a2,a6,a4
    1176:	1602                	slli	a2,a2,0x20
    1178:	9201                	srli	a2,a2,0x20
    117a:	9636                	add	a2,a2,a3
    117c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1180:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1184:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1188:	0ae86c63          	bltu	a6,a4,1240 <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    118c:	02e5f63b          	remuw	a2,a1,a4
    1190:	1602                	slli	a2,a2,0x20
    1192:	9201                	srli	a2,a2,0x20
    1194:	9636                	add	a2,a2,a3
    1196:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    119a:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    119e:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11a2:	0ae5e263          	bltu	a1,a4,1246 <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    11a6:	1782                	slli	a5,a5,0x20
    11a8:	9381                	srli	a5,a5,0x20
    11aa:	97b6                	add	a5,a5,a3
    11ac:	0007c703          	lbu	a4,0(a5)
    11b0:	4599                	li	a1,6
    11b2:	4795                	li	a5,5
    11b4:	00e10723          	sb	a4,14(sp)

    if (sign)
    11b8:	00055963          	bgez	a0,11ca <printint.constprop.0+0x126>
        buf[i--] = '-';
    11bc:	1018                	addi	a4,sp,32
    11be:	973e                	add	a4,a4,a5
    11c0:	02d00693          	li	a3,45
    11c4:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    11c8:	85be                	mv	a1,a5
    write(f, s, l);
    11ca:	003c                	addi	a5,sp,8
    11cc:	4641                	li	a2,16
    11ce:	9e0d                	subw	a2,a2,a1
    11d0:	4505                	li	a0,1
    11d2:	95be                	add	a1,a1,a5
    11d4:	221000ef          	jal	ra,1bf4 <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11d8:	70a2                	ld	ra,40(sp)
    11da:	6145                	addi	sp,sp,48
    11dc:	8082                	ret
        x = -xx;
    11de:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    11e2:	02b677bb          	remuw	a5,a2,a1
    11e6:	00001697          	auipc	a3,0x1
    11ea:	d1a68693          	addi	a3,a3,-742 # 1f00 <digits>
    buf[16] = 0;
    11ee:	00010c23          	sb	zero,24(sp)
    i = 15;
    11f2:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    11f6:	1782                	slli	a5,a5,0x20
    11f8:	9381                	srli	a5,a5,0x20
    11fa:	97b6                	add	a5,a5,a3
    11fc:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1200:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1204:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1208:	ecb677e3          	bgeu	a2,a1,10d6 <printint.constprop.0+0x32>
        buf[i--] = '-';
    120c:	02d00793          	li	a5,45
    1210:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1214:	45b9                	li	a1,14
    1216:	bf55                	j	11ca <printint.constprop.0+0x126>
    1218:	47a5                	li	a5,9
    121a:	45a9                	li	a1,10
    121c:	bf71                	j	11b8 <printint.constprop.0+0x114>
    121e:	47b5                	li	a5,13
    1220:	45b9                	li	a1,14
    1222:	bf59                	j	11b8 <printint.constprop.0+0x114>
    1224:	47b1                	li	a5,12
    1226:	45b5                	li	a1,13
    1228:	bf41                	j	11b8 <printint.constprop.0+0x114>
    122a:	47ad                	li	a5,11
    122c:	45b1                	li	a1,12
    122e:	b769                	j	11b8 <printint.constprop.0+0x114>
    1230:	47a9                	li	a5,10
    1232:	45ad                	li	a1,11
    1234:	b751                	j	11b8 <printint.constprop.0+0x114>
    i = 15;
    1236:	45bd                	li	a1,15
    1238:	bf49                	j	11ca <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    123a:	47a1                	li	a5,8
    123c:	45a5                	li	a1,9
    123e:	bfad                	j	11b8 <printint.constprop.0+0x114>
    1240:	479d                	li	a5,7
    1242:	45a1                	li	a1,8
    1244:	bf95                	j	11b8 <printint.constprop.0+0x114>
    1246:	4799                	li	a5,6
    1248:	459d                	li	a1,7
    124a:	b7bd                	j	11b8 <printint.constprop.0+0x114>

000000000000124c <getchar>:
{
    124c:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    124e:	00f10593          	addi	a1,sp,15
    1252:	4605                	li	a2,1
    1254:	4501                	li	a0,0
{
    1256:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1258:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    125c:	18f000ef          	jal	ra,1bea <read>
}
    1260:	60e2                	ld	ra,24(sp)
    1262:	00f14503          	lbu	a0,15(sp)
    1266:	6105                	addi	sp,sp,32
    1268:	8082                	ret

000000000000126a <putchar>:
{
    126a:	1101                	addi	sp,sp,-32
    126c:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    126e:	00f10593          	addi	a1,sp,15
    1272:	4605                	li	a2,1
    1274:	4505                	li	a0,1
{
    1276:	ec06                	sd	ra,24(sp)
    char byte = c;
    1278:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    127c:	179000ef          	jal	ra,1bf4 <write>
}
    1280:	60e2                	ld	ra,24(sp)
    1282:	2501                	sext.w	a0,a0
    1284:	6105                	addi	sp,sp,32
    1286:	8082                	ret

0000000000001288 <puts>:
{
    1288:	1141                	addi	sp,sp,-16
    128a:	e406                	sd	ra,8(sp)
    128c:	e022                	sd	s0,0(sp)
    128e:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1290:	580000ef          	jal	ra,1810 <strlen>
    1294:	862a                	mv	a2,a0
    1296:	85a2                	mv	a1,s0
    1298:	4505                	li	a0,1
    129a:	15b000ef          	jal	ra,1bf4 <write>
}
    129e:	60a2                	ld	ra,8(sp)
    12a0:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12a2:	957d                	srai	a0,a0,0x3f
    return r;
    12a4:	2501                	sext.w	a0,a0
}
    12a6:	0141                	addi	sp,sp,16
    12a8:	8082                	ret

00000000000012aa <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12aa:	7171                	addi	sp,sp,-176
    12ac:	fc56                	sd	s5,56(sp)
    12ae:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    12b0:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12b2:	18bc                	addi	a5,sp,120
{
    12b4:	e8ca                	sd	s2,80(sp)
    12b6:	e4ce                	sd	s3,72(sp)
    12b8:	e0d2                	sd	s4,64(sp)
    12ba:	f85a                	sd	s6,48(sp)
    12bc:	f486                	sd	ra,104(sp)
    12be:	f0a2                	sd	s0,96(sp)
    12c0:	eca6                	sd	s1,88(sp)
    12c2:	fcae                	sd	a1,120(sp)
    12c4:	e132                	sd	a2,128(sp)
    12c6:	e536                	sd	a3,136(sp)
    12c8:	e93a                	sd	a4,144(sp)
    12ca:	f142                	sd	a6,160(sp)
    12cc:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    12ce:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12d0:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    12d4:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    12d8:	00001b17          	auipc	s6,0x1
    12dc:	bf8b0b13          	addi	s6,s6,-1032 # 1ed0 <__clone+0xa4>
    buf[i++] = '0';
    12e0:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12e4:	00001997          	auipc	s3,0x1
    12e8:	c1c98993          	addi	s3,s3,-996 # 1f00 <digits>
        if (!*s)
    12ec:	00054783          	lbu	a5,0(a0)
    12f0:	16078a63          	beqz	a5,1464 <printf+0x1ba>
    12f4:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    12f6:	19278163          	beq	a5,s2,1478 <printf+0x1ce>
    12fa:	00164783          	lbu	a5,1(a2)
    12fe:	0605                	addi	a2,a2,1
    1300:	fbfd                	bnez	a5,12f6 <printf+0x4c>
    1302:	84b2                	mv	s1,a2
        l = z - a;
    1304:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1308:	85aa                	mv	a1,a0
    130a:	8622                	mv	a2,s0
    130c:	4505                	li	a0,1
    130e:	0e7000ef          	jal	ra,1bf4 <write>
        if (l)
    1312:	18041c63          	bnez	s0,14aa <printf+0x200>
        if (s[1] == 0)
    1316:	0014c783          	lbu	a5,1(s1)
    131a:	14078563          	beqz	a5,1464 <printf+0x1ba>
        switch (s[1])
    131e:	1d478063          	beq	a5,s4,14de <printf+0x234>
    1322:	18fa6663          	bltu	s4,a5,14ae <printf+0x204>
    1326:	06400713          	li	a4,100
    132a:	1ae78063          	beq	a5,a4,14ca <printf+0x220>
    132e:	07000713          	li	a4,112
    1332:	1ce79963          	bne	a5,a4,1504 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    1336:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1338:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    133c:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    133e:	631c                	ld	a5,0(a4)
    1340:	0721                	addi	a4,a4,8
    1342:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1344:	00479293          	slli	t0,a5,0x4
    1348:	00879f93          	slli	t6,a5,0x8
    134c:	00c79f13          	slli	t5,a5,0xc
    1350:	01079e93          	slli	t4,a5,0x10
    1354:	01479e13          	slli	t3,a5,0x14
    1358:	01879313          	slli	t1,a5,0x18
    135c:	01c79893          	slli	a7,a5,0x1c
    1360:	02479813          	slli	a6,a5,0x24
    1364:	02879513          	slli	a0,a5,0x28
    1368:	02c79593          	slli	a1,a5,0x2c
    136c:	03079693          	slli	a3,a5,0x30
    1370:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1374:	03c7d413          	srli	s0,a5,0x3c
    1378:	01c7d39b          	srliw	t2,a5,0x1c
    137c:	03c2d293          	srli	t0,t0,0x3c
    1380:	03cfdf93          	srli	t6,t6,0x3c
    1384:	03cf5f13          	srli	t5,t5,0x3c
    1388:	03cede93          	srli	t4,t4,0x3c
    138c:	03ce5e13          	srli	t3,t3,0x3c
    1390:	03c35313          	srli	t1,t1,0x3c
    1394:	03c8d893          	srli	a7,a7,0x3c
    1398:	03c85813          	srli	a6,a6,0x3c
    139c:	9171                	srli	a0,a0,0x3c
    139e:	91f1                	srli	a1,a1,0x3c
    13a0:	92f1                	srli	a3,a3,0x3c
    13a2:	9371                	srli	a4,a4,0x3c
    13a4:	96ce                	add	a3,a3,s3
    13a6:	974e                	add	a4,a4,s3
    13a8:	944e                	add	s0,s0,s3
    13aa:	92ce                	add	t0,t0,s3
    13ac:	9fce                	add	t6,t6,s3
    13ae:	9f4e                	add	t5,t5,s3
    13b0:	9ece                	add	t4,t4,s3
    13b2:	9e4e                	add	t3,t3,s3
    13b4:	934e                	add	t1,t1,s3
    13b6:	98ce                	add	a7,a7,s3
    13b8:	93ce                	add	t2,t2,s3
    13ba:	984e                	add	a6,a6,s3
    13bc:	954e                	add	a0,a0,s3
    13be:	95ce                	add	a1,a1,s3
    13c0:	0006c083          	lbu	ra,0(a3)
    13c4:	0002c283          	lbu	t0,0(t0)
    13c8:	00074683          	lbu	a3,0(a4)
    13cc:	000fcf83          	lbu	t6,0(t6)
    13d0:	000f4f03          	lbu	t5,0(t5)
    13d4:	000ece83          	lbu	t4,0(t4)
    13d8:	000e4e03          	lbu	t3,0(t3)
    13dc:	00034303          	lbu	t1,0(t1)
    13e0:	0008c883          	lbu	a7,0(a7)
    13e4:	0003c383          	lbu	t2,0(t2)
    13e8:	00084803          	lbu	a6,0(a6)
    13ec:	00054503          	lbu	a0,0(a0)
    13f0:	0005c583          	lbu	a1,0(a1)
    13f4:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13f8:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13fc:	9371                	srli	a4,a4,0x3c
    13fe:	8bbd                	andi	a5,a5,15
    1400:	974e                	add	a4,a4,s3
    1402:	97ce                	add	a5,a5,s3
    1404:	005105a3          	sb	t0,11(sp)
    1408:	01f10623          	sb	t6,12(sp)
    140c:	01e106a3          	sb	t5,13(sp)
    1410:	01d10723          	sb	t4,14(sp)
    1414:	01c107a3          	sb	t3,15(sp)
    1418:	00610823          	sb	t1,16(sp)
    141c:	011108a3          	sb	a7,17(sp)
    1420:	00710923          	sb	t2,18(sp)
    1424:	010109a3          	sb	a6,19(sp)
    1428:	00a10a23          	sb	a0,20(sp)
    142c:	00b10aa3          	sb	a1,21(sp)
    1430:	00110b23          	sb	ra,22(sp)
    1434:	00d10ba3          	sb	a3,23(sp)
    1438:	00810523          	sb	s0,10(sp)
    143c:	00074703          	lbu	a4,0(a4)
    1440:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1444:	002c                	addi	a1,sp,8
    1446:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1448:	00e10c23          	sb	a4,24(sp)
    144c:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1450:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1454:	7a0000ef          	jal	ra,1bf4 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1458:	00248513          	addi	a0,s1,2
        if (!*s)
    145c:	00054783          	lbu	a5,0(a0)
    1460:	e8079ae3          	bnez	a5,12f4 <printf+0x4a>
    }
    va_end(ap);
}
    1464:	70a6                	ld	ra,104(sp)
    1466:	7406                	ld	s0,96(sp)
    1468:	64e6                	ld	s1,88(sp)
    146a:	6946                	ld	s2,80(sp)
    146c:	69a6                	ld	s3,72(sp)
    146e:	6a06                	ld	s4,64(sp)
    1470:	7ae2                	ld	s5,56(sp)
    1472:	7b42                	ld	s6,48(sp)
    1474:	614d                	addi	sp,sp,176
    1476:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1478:	00064783          	lbu	a5,0(a2)
    147c:	84b2                	mv	s1,a2
    147e:	01278963          	beq	a5,s2,1490 <printf+0x1e6>
    1482:	b549                	j	1304 <printf+0x5a>
    1484:	0024c783          	lbu	a5,2(s1)
    1488:	0605                	addi	a2,a2,1
    148a:	0489                	addi	s1,s1,2
    148c:	e7279ce3          	bne	a5,s2,1304 <printf+0x5a>
    1490:	0014c783          	lbu	a5,1(s1)
    1494:	ff2788e3          	beq	a5,s2,1484 <printf+0x1da>
        l = z - a;
    1498:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    149c:	85aa                	mv	a1,a0
    149e:	8622                	mv	a2,s0
    14a0:	4505                	li	a0,1
    14a2:	752000ef          	jal	ra,1bf4 <write>
        if (l)
    14a6:	e60408e3          	beqz	s0,1316 <printf+0x6c>
    14aa:	8526                	mv	a0,s1
    14ac:	b581                	j	12ec <printf+0x42>
        switch (s[1])
    14ae:	07800713          	li	a4,120
    14b2:	04e79963          	bne	a5,a4,1504 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    14b6:	6782                	ld	a5,0(sp)
    14b8:	45c1                	li	a1,16
    14ba:	4388                	lw	a0,0(a5)
    14bc:	07a1                	addi	a5,a5,8
    14be:	e03e                	sd	a5,0(sp)
    14c0:	be5ff0ef          	jal	ra,10a4 <printint.constprop.0>
        s += 2;
    14c4:	00248513          	addi	a0,s1,2
    14c8:	bf51                	j	145c <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    14ca:	6782                	ld	a5,0(sp)
    14cc:	45a9                	li	a1,10
    14ce:	4388                	lw	a0,0(a5)
    14d0:	07a1                	addi	a5,a5,8
    14d2:	e03e                	sd	a5,0(sp)
    14d4:	bd1ff0ef          	jal	ra,10a4 <printint.constprop.0>
        s += 2;
    14d8:	00248513          	addi	a0,s1,2
    14dc:	b741                	j	145c <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    14de:	6782                	ld	a5,0(sp)
    14e0:	6380                	ld	s0,0(a5)
    14e2:	07a1                	addi	a5,a5,8
    14e4:	e03e                	sd	a5,0(sp)
    14e6:	c421                	beqz	s0,152e <printf+0x284>
            l = strnlen(a, 200);
    14e8:	0c800593          	li	a1,200
    14ec:	8522                	mv	a0,s0
    14ee:	40e000ef          	jal	ra,18fc <strnlen>
    write(f, s, l);
    14f2:	0005061b          	sext.w	a2,a0
    14f6:	85a2                	mv	a1,s0
    14f8:	4505                	li	a0,1
    14fa:	6fa000ef          	jal	ra,1bf4 <write>
        s += 2;
    14fe:	00248513          	addi	a0,s1,2
    1502:	bfa9                	j	145c <printf+0x1b2>
    char byte = c;
    1504:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1508:	4605                	li	a2,1
    150a:	002c                	addi	a1,sp,8
    150c:	4505                	li	a0,1
    char byte = c;
    150e:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1512:	6e2000ef          	jal	ra,1bf4 <write>
    char byte = c;
    1516:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    151a:	4605                	li	a2,1
    151c:	002c                	addi	a1,sp,8
    151e:	4505                	li	a0,1
    char byte = c;
    1520:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1524:	6d0000ef          	jal	ra,1bf4 <write>
        s += 2;
    1528:	00248513          	addi	a0,s1,2
    152c:	bf05                	j	145c <printf+0x1b2>
                a = "(null)";
    152e:	845a                	mv	s0,s6
    1530:	bf65                	j	14e8 <printf+0x23e>

0000000000001532 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1532:	1141                	addi	sp,sp,-16
    1534:	e406                	sd	ra,8(sp)
    puts(m);
    1536:	d53ff0ef          	jal	ra,1288 <puts>
    exit(-100);
}
    153a:	60a2                	ld	ra,8(sp)
    exit(-100);
    153c:	f9c00513          	li	a0,-100
}
    1540:	0141                	addi	sp,sp,16
    exit(-100);
    1542:	a709                	j	1c44 <exit>

0000000000001544 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1544:	02000793          	li	a5,32
    1548:	00f50663          	beq	a0,a5,1554 <isspace+0x10>
    154c:	355d                	addiw	a0,a0,-9
    154e:	00553513          	sltiu	a0,a0,5
    1552:	8082                	ret
    1554:	4505                	li	a0,1
}
    1556:	8082                	ret

0000000000001558 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1558:	fd05051b          	addiw	a0,a0,-48
}
    155c:	00a53513          	sltiu	a0,a0,10
    1560:	8082                	ret

0000000000001562 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1562:	02000613          	li	a2,32
    1566:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1568:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    156c:	ff77069b          	addiw	a3,a4,-9
    1570:	04c70d63          	beq	a4,a2,15ca <atoi+0x68>
    1574:	0007079b          	sext.w	a5,a4
    1578:	04d5f963          	bgeu	a1,a3,15ca <atoi+0x68>
        s++;
    switch (*s)
    157c:	02b00693          	li	a3,43
    1580:	04d70a63          	beq	a4,a3,15d4 <atoi+0x72>
    1584:	02d00693          	li	a3,45
    1588:	06d70463          	beq	a4,a3,15f0 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    158c:	fd07859b          	addiw	a1,a5,-48
    1590:	4625                	li	a2,9
    1592:	873e                	mv	a4,a5
    1594:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1596:	4e01                	li	t3,0
    while (isdigit(*s))
    1598:	04b66a63          	bltu	a2,a1,15ec <atoi+0x8a>
    int n = 0, neg = 0;
    159c:	4501                	li	a0,0
    while (isdigit(*s))
    159e:	4825                	li	a6,9
    15a0:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    15a4:	0025179b          	slliw	a5,a0,0x2
    15a8:	9d3d                	addw	a0,a0,a5
    15aa:	fd07031b          	addiw	t1,a4,-48
    15ae:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15b2:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15b6:	0685                	addi	a3,a3,1
    15b8:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15bc:	0006071b          	sext.w	a4,a2
    15c0:	feb870e3          	bgeu	a6,a1,15a0 <atoi+0x3e>
    return neg ? n : -n;
    15c4:	000e0563          	beqz	t3,15ce <atoi+0x6c>
}
    15c8:	8082                	ret
        s++;
    15ca:	0505                	addi	a0,a0,1
    15cc:	bf71                	j	1568 <atoi+0x6>
    15ce:	4113053b          	subw	a0,t1,a7
    15d2:	8082                	ret
    while (isdigit(*s))
    15d4:	00154783          	lbu	a5,1(a0)
    15d8:	4625                	li	a2,9
        s++;
    15da:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    15de:	fd07859b          	addiw	a1,a5,-48
    15e2:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    15e6:	4e01                	li	t3,0
    while (isdigit(*s))
    15e8:	fab67ae3          	bgeu	a2,a1,159c <atoi+0x3a>
    15ec:	4501                	li	a0,0
}
    15ee:	8082                	ret
    while (isdigit(*s))
    15f0:	00154783          	lbu	a5,1(a0)
    15f4:	4625                	li	a2,9
        s++;
    15f6:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    15fa:	fd07859b          	addiw	a1,a5,-48
    15fe:	0007871b          	sext.w	a4,a5
    1602:	feb665e3          	bltu	a2,a1,15ec <atoi+0x8a>
        neg = 1;
    1606:	4e05                	li	t3,1
    1608:	bf51                	j	159c <atoi+0x3a>

000000000000160a <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    160a:	16060d63          	beqz	a2,1784 <memset+0x17a>
    160e:	40a007b3          	neg	a5,a0
    1612:	8b9d                	andi	a5,a5,7
    1614:	00778713          	addi	a4,a5,7
    1618:	482d                	li	a6,11
    161a:	0ff5f593          	andi	a1,a1,255
    161e:	fff60693          	addi	a3,a2,-1
    1622:	17076263          	bltu	a4,a6,1786 <memset+0x17c>
    1626:	16e6ea63          	bltu	a3,a4,179a <memset+0x190>
    162a:	16078563          	beqz	a5,1794 <memset+0x18a>
    162e:	00b50023          	sb	a1,0(a0)
    1632:	4705                	li	a4,1
    1634:	00150e93          	addi	t4,a0,1
    1638:	14e78c63          	beq	a5,a4,1790 <memset+0x186>
    163c:	00b500a3          	sb	a1,1(a0)
    1640:	4709                	li	a4,2
    1642:	00250e93          	addi	t4,a0,2
    1646:	14e78d63          	beq	a5,a4,17a0 <memset+0x196>
    164a:	00b50123          	sb	a1,2(a0)
    164e:	470d                	li	a4,3
    1650:	00350e93          	addi	t4,a0,3
    1654:	12e78b63          	beq	a5,a4,178a <memset+0x180>
    1658:	00b501a3          	sb	a1,3(a0)
    165c:	4711                	li	a4,4
    165e:	00450e93          	addi	t4,a0,4
    1662:	14e78163          	beq	a5,a4,17a4 <memset+0x19a>
    1666:	00b50223          	sb	a1,4(a0)
    166a:	4715                	li	a4,5
    166c:	00550e93          	addi	t4,a0,5
    1670:	12e78c63          	beq	a5,a4,17a8 <memset+0x19e>
    1674:	00b502a3          	sb	a1,5(a0)
    1678:	471d                	li	a4,7
    167a:	00650e93          	addi	t4,a0,6
    167e:	12e79763          	bne	a5,a4,17ac <memset+0x1a2>
    1682:	00750e93          	addi	t4,a0,7
    1686:	00b50323          	sb	a1,6(a0)
    168a:	4f1d                	li	t5,7
    168c:	00859713          	slli	a4,a1,0x8
    1690:	8f4d                	or	a4,a4,a1
    1692:	01059e13          	slli	t3,a1,0x10
    1696:	01c76e33          	or	t3,a4,t3
    169a:	01859313          	slli	t1,a1,0x18
    169e:	006e6333          	or	t1,t3,t1
    16a2:	02059893          	slli	a7,a1,0x20
    16a6:	011368b3          	or	a7,t1,a7
    16aa:	02859813          	slli	a6,a1,0x28
    16ae:	40f60333          	sub	t1,a2,a5
    16b2:	0108e833          	or	a6,a7,a6
    16b6:	03059693          	slli	a3,a1,0x30
    16ba:	00d866b3          	or	a3,a6,a3
    16be:	03859713          	slli	a4,a1,0x38
    16c2:	97aa                	add	a5,a5,a0
    16c4:	ff837813          	andi	a6,t1,-8
    16c8:	8f55                	or	a4,a4,a3
    16ca:	00f806b3          	add	a3,a6,a5
    16ce:	e398                	sd	a4,0(a5)
    16d0:	07a1                	addi	a5,a5,8
    16d2:	fed79ee3          	bne	a5,a3,16ce <memset+0xc4>
    16d6:	ff837693          	andi	a3,t1,-8
    16da:	00de87b3          	add	a5,t4,a3
    16de:	01e6873b          	addw	a4,a3,t5
    16e2:	0ad30663          	beq	t1,a3,178e <memset+0x184>
    16e6:	00b78023          	sb	a1,0(a5)
    16ea:	0017069b          	addiw	a3,a4,1
    16ee:	08c6fb63          	bgeu	a3,a2,1784 <memset+0x17a>
    16f2:	00b780a3          	sb	a1,1(a5)
    16f6:	0027069b          	addiw	a3,a4,2
    16fa:	08c6f563          	bgeu	a3,a2,1784 <memset+0x17a>
    16fe:	00b78123          	sb	a1,2(a5)
    1702:	0037069b          	addiw	a3,a4,3
    1706:	06c6ff63          	bgeu	a3,a2,1784 <memset+0x17a>
    170a:	00b781a3          	sb	a1,3(a5)
    170e:	0047069b          	addiw	a3,a4,4
    1712:	06c6f963          	bgeu	a3,a2,1784 <memset+0x17a>
    1716:	00b78223          	sb	a1,4(a5)
    171a:	0057069b          	addiw	a3,a4,5
    171e:	06c6f363          	bgeu	a3,a2,1784 <memset+0x17a>
    1722:	00b782a3          	sb	a1,5(a5)
    1726:	0067069b          	addiw	a3,a4,6
    172a:	04c6fd63          	bgeu	a3,a2,1784 <memset+0x17a>
    172e:	00b78323          	sb	a1,6(a5)
    1732:	0077069b          	addiw	a3,a4,7
    1736:	04c6f763          	bgeu	a3,a2,1784 <memset+0x17a>
    173a:	00b783a3          	sb	a1,7(a5)
    173e:	0087069b          	addiw	a3,a4,8
    1742:	04c6f163          	bgeu	a3,a2,1784 <memset+0x17a>
    1746:	00b78423          	sb	a1,8(a5)
    174a:	0097069b          	addiw	a3,a4,9
    174e:	02c6fb63          	bgeu	a3,a2,1784 <memset+0x17a>
    1752:	00b784a3          	sb	a1,9(a5)
    1756:	00a7069b          	addiw	a3,a4,10
    175a:	02c6f563          	bgeu	a3,a2,1784 <memset+0x17a>
    175e:	00b78523          	sb	a1,10(a5)
    1762:	00b7069b          	addiw	a3,a4,11
    1766:	00c6ff63          	bgeu	a3,a2,1784 <memset+0x17a>
    176a:	00b785a3          	sb	a1,11(a5)
    176e:	00c7069b          	addiw	a3,a4,12
    1772:	00c6f963          	bgeu	a3,a2,1784 <memset+0x17a>
    1776:	00b78623          	sb	a1,12(a5)
    177a:	2735                	addiw	a4,a4,13
    177c:	00c77463          	bgeu	a4,a2,1784 <memset+0x17a>
    1780:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1784:	8082                	ret
    1786:	472d                	li	a4,11
    1788:	bd79                	j	1626 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    178a:	4f0d                	li	t5,3
    178c:	b701                	j	168c <memset+0x82>
    178e:	8082                	ret
    1790:	4f05                	li	t5,1
    1792:	bded                	j	168c <memset+0x82>
    1794:	8eaa                	mv	t4,a0
    1796:	4f01                	li	t5,0
    1798:	bdd5                	j	168c <memset+0x82>
    179a:	87aa                	mv	a5,a0
    179c:	4701                	li	a4,0
    179e:	b7a1                	j	16e6 <memset+0xdc>
    17a0:	4f09                	li	t5,2
    17a2:	b5ed                	j	168c <memset+0x82>
    17a4:	4f11                	li	t5,4
    17a6:	b5dd                	j	168c <memset+0x82>
    17a8:	4f15                	li	t5,5
    17aa:	b5cd                	j	168c <memset+0x82>
    17ac:	4f19                	li	t5,6
    17ae:	bdf9                	j	168c <memset+0x82>

00000000000017b0 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17b0:	00054783          	lbu	a5,0(a0)
    17b4:	0005c703          	lbu	a4,0(a1)
    17b8:	00e79863          	bne	a5,a4,17c8 <strcmp+0x18>
    17bc:	0505                	addi	a0,a0,1
    17be:	0585                	addi	a1,a1,1
    17c0:	fbe5                	bnez	a5,17b0 <strcmp>
    17c2:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17c4:	9d19                	subw	a0,a0,a4
    17c6:	8082                	ret
    17c8:	0007851b          	sext.w	a0,a5
    17cc:	bfe5                	j	17c4 <strcmp+0x14>

00000000000017ce <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17ce:	ce05                	beqz	a2,1806 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17d0:	00054703          	lbu	a4,0(a0)
    17d4:	0005c783          	lbu	a5,0(a1)
    17d8:	cb0d                	beqz	a4,180a <strncmp+0x3c>
    if (!n--)
    17da:	167d                	addi	a2,a2,-1
    17dc:	00c506b3          	add	a3,a0,a2
    17e0:	a819                	j	17f6 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17e2:	00a68e63          	beq	a3,a0,17fe <strncmp+0x30>
    17e6:	0505                	addi	a0,a0,1
    17e8:	00e79b63          	bne	a5,a4,17fe <strncmp+0x30>
    17ec:	00054703          	lbu	a4,0(a0)
    17f0:	0005c783          	lbu	a5,0(a1)
    17f4:	cb19                	beqz	a4,180a <strncmp+0x3c>
    17f6:	0005c783          	lbu	a5,0(a1)
    17fa:	0585                	addi	a1,a1,1
    17fc:	f3fd                	bnez	a5,17e2 <strncmp+0x14>
        ;
    return *l - *r;
    17fe:	0007051b          	sext.w	a0,a4
    1802:	9d1d                	subw	a0,a0,a5
    1804:	8082                	ret
        return 0;
    1806:	4501                	li	a0,0
}
    1808:	8082                	ret
    180a:	4501                	li	a0,0
    return *l - *r;
    180c:	9d1d                	subw	a0,a0,a5
    180e:	8082                	ret

0000000000001810 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1810:	00757793          	andi	a5,a0,7
    1814:	cf89                	beqz	a5,182e <strlen+0x1e>
    1816:	87aa                	mv	a5,a0
    1818:	a029                	j	1822 <strlen+0x12>
    181a:	0785                	addi	a5,a5,1
    181c:	0077f713          	andi	a4,a5,7
    1820:	cb01                	beqz	a4,1830 <strlen+0x20>
        if (!*s)
    1822:	0007c703          	lbu	a4,0(a5)
    1826:	fb75                	bnez	a4,181a <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1828:	40a78533          	sub	a0,a5,a0
}
    182c:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    182e:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1830:	6394                	ld	a3,0(a5)
    1832:	00000597          	auipc	a1,0x0
    1836:	6a65b583          	ld	a1,1702(a1) # 1ed8 <__clone+0xac>
    183a:	00000617          	auipc	a2,0x0
    183e:	6a663603          	ld	a2,1702(a2) # 1ee0 <__clone+0xb4>
    1842:	a019                	j	1848 <strlen+0x38>
    1844:	6794                	ld	a3,8(a5)
    1846:	07a1                	addi	a5,a5,8
    1848:	00b68733          	add	a4,a3,a1
    184c:	fff6c693          	not	a3,a3
    1850:	8f75                	and	a4,a4,a3
    1852:	8f71                	and	a4,a4,a2
    1854:	db65                	beqz	a4,1844 <strlen+0x34>
    for (; *s; s++)
    1856:	0007c703          	lbu	a4,0(a5)
    185a:	d779                	beqz	a4,1828 <strlen+0x18>
    185c:	0017c703          	lbu	a4,1(a5)
    1860:	0785                	addi	a5,a5,1
    1862:	d379                	beqz	a4,1828 <strlen+0x18>
    1864:	0017c703          	lbu	a4,1(a5)
    1868:	0785                	addi	a5,a5,1
    186a:	fb6d                	bnez	a4,185c <strlen+0x4c>
    186c:	bf75                	j	1828 <strlen+0x18>

000000000000186e <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    186e:	00757713          	andi	a4,a0,7
{
    1872:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1874:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1878:	cb19                	beqz	a4,188e <memchr+0x20>
    187a:	ce25                	beqz	a2,18f2 <memchr+0x84>
    187c:	0007c703          	lbu	a4,0(a5)
    1880:	04b70e63          	beq	a4,a1,18dc <memchr+0x6e>
    1884:	0785                	addi	a5,a5,1
    1886:	0077f713          	andi	a4,a5,7
    188a:	167d                	addi	a2,a2,-1
    188c:	f77d                	bnez	a4,187a <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    188e:	4501                	li	a0,0
    if (n && *s != c)
    1890:	c235                	beqz	a2,18f4 <memchr+0x86>
    1892:	0007c703          	lbu	a4,0(a5)
    1896:	04b70363          	beq	a4,a1,18dc <memchr+0x6e>
        size_t k = ONES * c;
    189a:	00000517          	auipc	a0,0x0
    189e:	64e53503          	ld	a0,1614(a0) # 1ee8 <__clone+0xbc>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18a2:	471d                	li	a4,7
        size_t k = ONES * c;
    18a4:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18a8:	02c77a63          	bgeu	a4,a2,18dc <memchr+0x6e>
    18ac:	00000897          	auipc	a7,0x0
    18b0:	62c8b883          	ld	a7,1580(a7) # 1ed8 <__clone+0xac>
    18b4:	00000817          	auipc	a6,0x0
    18b8:	62c83803          	ld	a6,1580(a6) # 1ee0 <__clone+0xb4>
    18bc:	431d                	li	t1,7
    18be:	a029                	j	18c8 <memchr+0x5a>
    18c0:	1661                	addi	a2,a2,-8
    18c2:	07a1                	addi	a5,a5,8
    18c4:	02c37963          	bgeu	t1,a2,18f6 <memchr+0x88>
    18c8:	6398                	ld	a4,0(a5)
    18ca:	8f29                	xor	a4,a4,a0
    18cc:	011706b3          	add	a3,a4,a7
    18d0:	fff74713          	not	a4,a4
    18d4:	8f75                	and	a4,a4,a3
    18d6:	01077733          	and	a4,a4,a6
    18da:	d37d                	beqz	a4,18c0 <memchr+0x52>
    18dc:	853e                	mv	a0,a5
    18de:	97b2                	add	a5,a5,a2
    18e0:	a021                	j	18e8 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    18e2:	0505                	addi	a0,a0,1
    18e4:	00f50763          	beq	a0,a5,18f2 <memchr+0x84>
    18e8:	00054703          	lbu	a4,0(a0)
    18ec:	feb71be3          	bne	a4,a1,18e2 <memchr+0x74>
    18f0:	8082                	ret
    return n ? (void *)s : 0;
    18f2:	4501                	li	a0,0
}
    18f4:	8082                	ret
    return n ? (void *)s : 0;
    18f6:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    18f8:	f275                	bnez	a2,18dc <memchr+0x6e>
}
    18fa:	8082                	ret

00000000000018fc <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    18fc:	1101                	addi	sp,sp,-32
    18fe:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1900:	862e                	mv	a2,a1
{
    1902:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1904:	4581                	li	a1,0
{
    1906:	e426                	sd	s1,8(sp)
    1908:	ec06                	sd	ra,24(sp)
    190a:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    190c:	f63ff0ef          	jal	ra,186e <memchr>
    return p ? p - s : n;
    1910:	c519                	beqz	a0,191e <strnlen+0x22>
}
    1912:	60e2                	ld	ra,24(sp)
    1914:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1916:	8d05                	sub	a0,a0,s1
}
    1918:	64a2                	ld	s1,8(sp)
    191a:	6105                	addi	sp,sp,32
    191c:	8082                	ret
    191e:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1920:	8522                	mv	a0,s0
}
    1922:	6442                	ld	s0,16(sp)
    1924:	64a2                	ld	s1,8(sp)
    1926:	6105                	addi	sp,sp,32
    1928:	8082                	ret

000000000000192a <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    192a:	00b547b3          	xor	a5,a0,a1
    192e:	8b9d                	andi	a5,a5,7
    1930:	eb95                	bnez	a5,1964 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1932:	0075f793          	andi	a5,a1,7
    1936:	e7b1                	bnez	a5,1982 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1938:	6198                	ld	a4,0(a1)
    193a:	00000617          	auipc	a2,0x0
    193e:	59e63603          	ld	a2,1438(a2) # 1ed8 <__clone+0xac>
    1942:	00000817          	auipc	a6,0x0
    1946:	59e83803          	ld	a6,1438(a6) # 1ee0 <__clone+0xb4>
    194a:	a029                	j	1954 <strcpy+0x2a>
    194c:	e118                	sd	a4,0(a0)
    194e:	6598                	ld	a4,8(a1)
    1950:	05a1                	addi	a1,a1,8
    1952:	0521                	addi	a0,a0,8
    1954:	00c707b3          	add	a5,a4,a2
    1958:	fff74693          	not	a3,a4
    195c:	8ff5                	and	a5,a5,a3
    195e:	0107f7b3          	and	a5,a5,a6
    1962:	d7ed                	beqz	a5,194c <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1964:	0005c783          	lbu	a5,0(a1)
    1968:	00f50023          	sb	a5,0(a0)
    196c:	c785                	beqz	a5,1994 <strcpy+0x6a>
    196e:	0015c783          	lbu	a5,1(a1)
    1972:	0505                	addi	a0,a0,1
    1974:	0585                	addi	a1,a1,1
    1976:	00f50023          	sb	a5,0(a0)
    197a:	fbf5                	bnez	a5,196e <strcpy+0x44>
        ;
    return d;
}
    197c:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    197e:	0505                	addi	a0,a0,1
    1980:	df45                	beqz	a4,1938 <strcpy+0xe>
            if (!(*d = *s))
    1982:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1986:	0585                	addi	a1,a1,1
    1988:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    198c:	00f50023          	sb	a5,0(a0)
    1990:	f7fd                	bnez	a5,197e <strcpy+0x54>
}
    1992:	8082                	ret
    1994:	8082                	ret

0000000000001996 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1996:	00b547b3          	xor	a5,a0,a1
    199a:	8b9d                	andi	a5,a5,7
    199c:	1a079863          	bnez	a5,1b4c <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19a0:	0075f793          	andi	a5,a1,7
    19a4:	16078463          	beqz	a5,1b0c <strncpy+0x176>
    19a8:	ea01                	bnez	a2,19b8 <strncpy+0x22>
    19aa:	a421                	j	1bb2 <strncpy+0x21c>
    19ac:	167d                	addi	a2,a2,-1
    19ae:	0505                	addi	a0,a0,1
    19b0:	14070e63          	beqz	a4,1b0c <strncpy+0x176>
    19b4:	1a060863          	beqz	a2,1b64 <strncpy+0x1ce>
    19b8:	0005c783          	lbu	a5,0(a1)
    19bc:	0585                	addi	a1,a1,1
    19be:	0075f713          	andi	a4,a1,7
    19c2:	00f50023          	sb	a5,0(a0)
    19c6:	f3fd                	bnez	a5,19ac <strncpy+0x16>
    19c8:	4805                	li	a6,1
    19ca:	1a061863          	bnez	a2,1b7a <strncpy+0x1e4>
    19ce:	40a007b3          	neg	a5,a0
    19d2:	8b9d                	andi	a5,a5,7
    19d4:	4681                	li	a3,0
    19d6:	18061a63          	bnez	a2,1b6a <strncpy+0x1d4>
    19da:	00778713          	addi	a4,a5,7
    19de:	45ad                	li	a1,11
    19e0:	18b76363          	bltu	a4,a1,1b66 <strncpy+0x1d0>
    19e4:	1ae6eb63          	bltu	a3,a4,1b9a <strncpy+0x204>
    19e8:	1a078363          	beqz	a5,1b8e <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    19ec:	00050023          	sb	zero,0(a0)
    19f0:	4685                	li	a3,1
    19f2:	00150713          	addi	a4,a0,1
    19f6:	18d78f63          	beq	a5,a3,1b94 <strncpy+0x1fe>
    19fa:	000500a3          	sb	zero,1(a0)
    19fe:	4689                	li	a3,2
    1a00:	00250713          	addi	a4,a0,2
    1a04:	18d78e63          	beq	a5,a3,1ba0 <strncpy+0x20a>
    1a08:	00050123          	sb	zero,2(a0)
    1a0c:	468d                	li	a3,3
    1a0e:	00350713          	addi	a4,a0,3
    1a12:	16d78c63          	beq	a5,a3,1b8a <strncpy+0x1f4>
    1a16:	000501a3          	sb	zero,3(a0)
    1a1a:	4691                	li	a3,4
    1a1c:	00450713          	addi	a4,a0,4
    1a20:	18d78263          	beq	a5,a3,1ba4 <strncpy+0x20e>
    1a24:	00050223          	sb	zero,4(a0)
    1a28:	4695                	li	a3,5
    1a2a:	00550713          	addi	a4,a0,5
    1a2e:	16d78d63          	beq	a5,a3,1ba8 <strncpy+0x212>
    1a32:	000502a3          	sb	zero,5(a0)
    1a36:	469d                	li	a3,7
    1a38:	00650713          	addi	a4,a0,6
    1a3c:	16d79863          	bne	a5,a3,1bac <strncpy+0x216>
    1a40:	00750713          	addi	a4,a0,7
    1a44:	00050323          	sb	zero,6(a0)
    1a48:	40f80833          	sub	a6,a6,a5
    1a4c:	ff887593          	andi	a1,a6,-8
    1a50:	97aa                	add	a5,a5,a0
    1a52:	95be                	add	a1,a1,a5
    1a54:	0007b023          	sd	zero,0(a5)
    1a58:	07a1                	addi	a5,a5,8
    1a5a:	feb79de3          	bne	a5,a1,1a54 <strncpy+0xbe>
    1a5e:	ff887593          	andi	a1,a6,-8
    1a62:	9ead                	addw	a3,a3,a1
    1a64:	00b707b3          	add	a5,a4,a1
    1a68:	12b80863          	beq	a6,a1,1b98 <strncpy+0x202>
    1a6c:	00078023          	sb	zero,0(a5)
    1a70:	0016871b          	addiw	a4,a3,1
    1a74:	0ec77863          	bgeu	a4,a2,1b64 <strncpy+0x1ce>
    1a78:	000780a3          	sb	zero,1(a5)
    1a7c:	0026871b          	addiw	a4,a3,2
    1a80:	0ec77263          	bgeu	a4,a2,1b64 <strncpy+0x1ce>
    1a84:	00078123          	sb	zero,2(a5)
    1a88:	0036871b          	addiw	a4,a3,3
    1a8c:	0cc77c63          	bgeu	a4,a2,1b64 <strncpy+0x1ce>
    1a90:	000781a3          	sb	zero,3(a5)
    1a94:	0046871b          	addiw	a4,a3,4
    1a98:	0cc77663          	bgeu	a4,a2,1b64 <strncpy+0x1ce>
    1a9c:	00078223          	sb	zero,4(a5)
    1aa0:	0056871b          	addiw	a4,a3,5
    1aa4:	0cc77063          	bgeu	a4,a2,1b64 <strncpy+0x1ce>
    1aa8:	000782a3          	sb	zero,5(a5)
    1aac:	0066871b          	addiw	a4,a3,6
    1ab0:	0ac77a63          	bgeu	a4,a2,1b64 <strncpy+0x1ce>
    1ab4:	00078323          	sb	zero,6(a5)
    1ab8:	0076871b          	addiw	a4,a3,7
    1abc:	0ac77463          	bgeu	a4,a2,1b64 <strncpy+0x1ce>
    1ac0:	000783a3          	sb	zero,7(a5)
    1ac4:	0086871b          	addiw	a4,a3,8
    1ac8:	08c77e63          	bgeu	a4,a2,1b64 <strncpy+0x1ce>
    1acc:	00078423          	sb	zero,8(a5)
    1ad0:	0096871b          	addiw	a4,a3,9
    1ad4:	08c77863          	bgeu	a4,a2,1b64 <strncpy+0x1ce>
    1ad8:	000784a3          	sb	zero,9(a5)
    1adc:	00a6871b          	addiw	a4,a3,10
    1ae0:	08c77263          	bgeu	a4,a2,1b64 <strncpy+0x1ce>
    1ae4:	00078523          	sb	zero,10(a5)
    1ae8:	00b6871b          	addiw	a4,a3,11
    1aec:	06c77c63          	bgeu	a4,a2,1b64 <strncpy+0x1ce>
    1af0:	000785a3          	sb	zero,11(a5)
    1af4:	00c6871b          	addiw	a4,a3,12
    1af8:	06c77663          	bgeu	a4,a2,1b64 <strncpy+0x1ce>
    1afc:	00078623          	sb	zero,12(a5)
    1b00:	26b5                	addiw	a3,a3,13
    1b02:	06c6f163          	bgeu	a3,a2,1b64 <strncpy+0x1ce>
    1b06:	000786a3          	sb	zero,13(a5)
    1b0a:	8082                	ret
            ;
        if (!n || !*s)
    1b0c:	c645                	beqz	a2,1bb4 <strncpy+0x21e>
    1b0e:	0005c783          	lbu	a5,0(a1)
    1b12:	ea078be3          	beqz	a5,19c8 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b16:	479d                	li	a5,7
    1b18:	02c7ff63          	bgeu	a5,a2,1b56 <strncpy+0x1c0>
    1b1c:	00000897          	auipc	a7,0x0
    1b20:	3bc8b883          	ld	a7,956(a7) # 1ed8 <__clone+0xac>
    1b24:	00000817          	auipc	a6,0x0
    1b28:	3bc83803          	ld	a6,956(a6) # 1ee0 <__clone+0xb4>
    1b2c:	431d                	li	t1,7
    1b2e:	6198                	ld	a4,0(a1)
    1b30:	011707b3          	add	a5,a4,a7
    1b34:	fff74693          	not	a3,a4
    1b38:	8ff5                	and	a5,a5,a3
    1b3a:	0107f7b3          	and	a5,a5,a6
    1b3e:	ef81                	bnez	a5,1b56 <strncpy+0x1c0>
            *wd = *ws;
    1b40:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b42:	1661                	addi	a2,a2,-8
    1b44:	05a1                	addi	a1,a1,8
    1b46:	0521                	addi	a0,a0,8
    1b48:	fec363e3          	bltu	t1,a2,1b2e <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b4c:	e609                	bnez	a2,1b56 <strncpy+0x1c0>
    1b4e:	a08d                	j	1bb0 <strncpy+0x21a>
    1b50:	167d                	addi	a2,a2,-1
    1b52:	0505                	addi	a0,a0,1
    1b54:	ca01                	beqz	a2,1b64 <strncpy+0x1ce>
    1b56:	0005c783          	lbu	a5,0(a1)
    1b5a:	0585                	addi	a1,a1,1
    1b5c:	00f50023          	sb	a5,0(a0)
    1b60:	fbe5                	bnez	a5,1b50 <strncpy+0x1ba>
        ;
tail:
    1b62:	b59d                	j	19c8 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1b64:	8082                	ret
    1b66:	472d                	li	a4,11
    1b68:	bdb5                	j	19e4 <strncpy+0x4e>
    1b6a:	00778713          	addi	a4,a5,7
    1b6e:	45ad                	li	a1,11
    1b70:	fff60693          	addi	a3,a2,-1
    1b74:	e6b778e3          	bgeu	a4,a1,19e4 <strncpy+0x4e>
    1b78:	b7fd                	j	1b66 <strncpy+0x1d0>
    1b7a:	40a007b3          	neg	a5,a0
    1b7e:	8832                	mv	a6,a2
    1b80:	8b9d                	andi	a5,a5,7
    1b82:	4681                	li	a3,0
    1b84:	e4060be3          	beqz	a2,19da <strncpy+0x44>
    1b88:	b7cd                	j	1b6a <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b8a:	468d                	li	a3,3
    1b8c:	bd75                	j	1a48 <strncpy+0xb2>
    1b8e:	872a                	mv	a4,a0
    1b90:	4681                	li	a3,0
    1b92:	bd5d                	j	1a48 <strncpy+0xb2>
    1b94:	4685                	li	a3,1
    1b96:	bd4d                	j	1a48 <strncpy+0xb2>
    1b98:	8082                	ret
    1b9a:	87aa                	mv	a5,a0
    1b9c:	4681                	li	a3,0
    1b9e:	b5f9                	j	1a6c <strncpy+0xd6>
    1ba0:	4689                	li	a3,2
    1ba2:	b55d                	j	1a48 <strncpy+0xb2>
    1ba4:	4691                	li	a3,4
    1ba6:	b54d                	j	1a48 <strncpy+0xb2>
    1ba8:	4695                	li	a3,5
    1baa:	bd79                	j	1a48 <strncpy+0xb2>
    1bac:	4699                	li	a3,6
    1bae:	bd69                	j	1a48 <strncpy+0xb2>
    1bb0:	8082                	ret
    1bb2:	8082                	ret
    1bb4:	8082                	ret

0000000000001bb6 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1bb6:	87aa                	mv	a5,a0
    1bb8:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1bba:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1bbe:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1bc2:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1bc4:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bc6:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1bca:	2501                	sext.w	a0,a0
    1bcc:	8082                	ret

0000000000001bce <openat>:
    register long a7 __asm__("a7") = n;
    1bce:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1bd2:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bd6:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1bda:	2501                	sext.w	a0,a0
    1bdc:	8082                	ret

0000000000001bde <close>:
    register long a7 __asm__("a7") = n;
    1bde:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1be2:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1be6:	2501                	sext.w	a0,a0
    1be8:	8082                	ret

0000000000001bea <read>:
    register long a7 __asm__("a7") = n;
    1bea:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1bee:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1bf2:	8082                	ret

0000000000001bf4 <write>:
    register long a7 __asm__("a7") = n;
    1bf4:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1bf8:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1bfc:	8082                	ret

0000000000001bfe <getpid>:
    register long a7 __asm__("a7") = n;
    1bfe:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c02:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c06:	2501                	sext.w	a0,a0
    1c08:	8082                	ret

0000000000001c0a <getppid>:
    register long a7 __asm__("a7") = n;
    1c0a:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c0e:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c12:	2501                	sext.w	a0,a0
    1c14:	8082                	ret

0000000000001c16 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c16:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c1a:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c1e:	2501                	sext.w	a0,a0
    1c20:	8082                	ret

0000000000001c22 <fork>:
    register long a7 __asm__("a7") = n;
    1c22:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c26:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c28:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c2a:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c2e:	2501                	sext.w	a0,a0
    1c30:	8082                	ret

0000000000001c32 <clone>:
// 子进程执行的执行的函数指针 | 函数参数 | 栈地址 | 栈的大小 | 标志位
pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c32:	85b2                	mv	a1,a2
    1c34:	863a                	mv	a2,a4
    if (stack)
    1c36:	c191                	beqz	a1,1c3a <clone+0x8>
	stack += stack_size;
    1c38:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c3a:	4781                	li	a5,0
    1c3c:	4701                	li	a4,0
    1c3e:	4681                	li	a3,0
    1c40:	2601                	sext.w	a2,a2
    1c42:	a2ed                	j	1e2c <__clone>

0000000000001c44 <exit>:
    register long a7 __asm__("a7") = n;
    1c44:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c48:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c4c:	8082                	ret

0000000000001c4e <waitpid>:
    register long a7 __asm__("a7") = n;
    1c4e:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c52:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c54:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c58:	2501                	sext.w	a0,a0
    1c5a:	8082                	ret

0000000000001c5c <exec>:
    register long a7 __asm__("a7") = n;
    1c5c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1c60:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1c64:	2501                	sext.w	a0,a0
    1c66:	8082                	ret

0000000000001c68 <execve>:
    register long a7 __asm__("a7") = n;
    1c68:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c6c:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1c70:	2501                	sext.w	a0,a0
    1c72:	8082                	ret

0000000000001c74 <times>:
    register long a7 __asm__("a7") = n;
    1c74:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1c78:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1c7c:	2501                	sext.w	a0,a0
    1c7e:	8082                	ret

0000000000001c80 <get_time>:

int64 get_time()
{
    1c80:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1c82:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1c86:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1c88:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c8a:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1c8e:	2501                	sext.w	a0,a0
    1c90:	ed09                	bnez	a0,1caa <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1c92:	67a2                	ld	a5,8(sp)
    1c94:	3e800713          	li	a4,1000
    1c98:	00015503          	lhu	a0,0(sp)
    1c9c:	02e7d7b3          	divu	a5,a5,a4
    1ca0:	02e50533          	mul	a0,a0,a4
    1ca4:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1ca6:	0141                	addi	sp,sp,16
    1ca8:	8082                	ret
        return -1;
    1caa:	557d                	li	a0,-1
    1cac:	bfed                	j	1ca6 <get_time+0x26>

0000000000001cae <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1cae:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cb2:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1cb6:	2501                	sext.w	a0,a0
    1cb8:	8082                	ret

0000000000001cba <time>:
    register long a7 __asm__("a7") = n;
    1cba:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1cbe:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1cc2:	2501                	sext.w	a0,a0
    1cc4:	8082                	ret

0000000000001cc6 <sleep>:

int sleep(unsigned long long time)
{
    1cc6:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1cc8:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1cca:	850a                	mv	a0,sp
    1ccc:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1cce:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1cd2:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cd4:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1cd8:	e501                	bnez	a0,1ce0 <sleep+0x1a>
    return 0;
    1cda:	4501                	li	a0,0
}
    1cdc:	0141                	addi	sp,sp,16
    1cde:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1ce0:	4502                	lw	a0,0(sp)
}
    1ce2:	0141                	addi	sp,sp,16
    1ce4:	8082                	ret

0000000000001ce6 <set_priority>:
    register long a7 __asm__("a7") = n;
    1ce6:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1cea:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1cee:	2501                	sext.w	a0,a0
    1cf0:	8082                	ret

0000000000001cf2 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1cf2:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1cf6:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1cfa:	8082                	ret

0000000000001cfc <munmap>:
    register long a7 __asm__("a7") = n;
    1cfc:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d00:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d04:	2501                	sext.w	a0,a0
    1d06:	8082                	ret

0000000000001d08 <wait>:

int wait(int *code)
{
    1d08:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d0a:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d0e:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d10:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d12:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d14:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d18:	2501                	sext.w	a0,a0
    1d1a:	8082                	ret

0000000000001d1c <spawn>:
    register long a7 __asm__("a7") = n;
    1d1c:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d20:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d24:	2501                	sext.w	a0,a0
    1d26:	8082                	ret

0000000000001d28 <mailread>:
    register long a7 __asm__("a7") = n;
    1d28:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d2c:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d30:	2501                	sext.w	a0,a0
    1d32:	8082                	ret

0000000000001d34 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d34:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d38:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d3c:	2501                	sext.w	a0,a0
    1d3e:	8082                	ret

0000000000001d40 <fstat>:
    register long a7 __asm__("a7") = n;
    1d40:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d44:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d48:	2501                	sext.w	a0,a0
    1d4a:	8082                	ret

0000000000001d4c <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d4c:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d4e:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d52:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d54:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d58:	2501                	sext.w	a0,a0
    1d5a:	8082                	ret

0000000000001d5c <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1d5c:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d5e:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1d62:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d64:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1d68:	2501                	sext.w	a0,a0
    1d6a:	8082                	ret

0000000000001d6c <link>:

int link(char *old_path, char *new_path)
{
    1d6c:	87aa                	mv	a5,a0
    1d6e:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1d70:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1d74:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d78:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1d7a:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1d7e:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d80:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1d84:	2501                	sext.w	a0,a0
    1d86:	8082                	ret

0000000000001d88 <unlink>:

int unlink(char *path)
{
    1d88:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d8a:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1d8e:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1d92:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d94:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1d98:	2501                	sext.w	a0,a0
    1d9a:	8082                	ret

0000000000001d9c <uname>:
    register long a7 __asm__("a7") = n;
    1d9c:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1da0:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1da4:	2501                	sext.w	a0,a0
    1da6:	8082                	ret

0000000000001da8 <brk>:
    register long a7 __asm__("a7") = n;
    1da8:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1dac:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1db0:	2501                	sext.w	a0,a0
    1db2:	8082                	ret

0000000000001db4 <getcwd>:
    register long a7 __asm__("a7") = n;
    1db4:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db6:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1dba:	8082                	ret

0000000000001dbc <chdir>:
    register long a7 __asm__("a7") = n;
    1dbc:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1dc0:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1dc8:	862e                	mv	a2,a1
    1dca:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1dcc:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dce:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1dd2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dd6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dd8:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dda:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1dde:	2501                	sext.w	a0,a0
    1de0:	8082                	ret

0000000000001de2 <getdents>:
    register long a7 __asm__("a7") = n;
    1de2:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de6:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1dea:	2501                	sext.w	a0,a0
    1dec:	8082                	ret

0000000000001dee <pipe>:
    register long a7 __asm__("a7") = n;
    1dee:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1df2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df4:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1df8:	2501                	sext.w	a0,a0
    1dfa:	8082                	ret

0000000000001dfc <dup>:
    register long a7 __asm__("a7") = n;
    1dfc:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1dfe:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e02:	2501                	sext.w	a0,a0
    1e04:	8082                	ret

0000000000001e06 <dup2>:
    register long a7 __asm__("a7") = n;
    1e06:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e08:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e0a:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e0e:	2501                	sext.w	a0,a0
    1e10:	8082                	ret

0000000000001e12 <mount>:
    register long a7 __asm__("a7") = n;
    1e12:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e16:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e1a:	2501                	sext.w	a0,a0
    1e1c:	8082                	ret

0000000000001e1e <umount>:
    register long a7 __asm__("a7") = n;
    1e1e:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e22:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e24:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <__clone>:
.global __clone
.type  __clone, %function
# 函数指针 | 栈地址 | 标志位
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e2c:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e2e:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e30:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e32:	8532                	mv	a0,a2
	mv a2, a4
    1e34:	863a                	mv	a2,a4
	mv a3, a5
    1e36:	86be                	mv	a3,a5
	mv a4, a6
    1e38:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e3a:	0dc00893          	li	a7,220
	ecall
    1e3e:	00000073          	ecall

	beqz a0, 1f
    1e42:	c111                	beqz	a0,1e46 <__clone+0x1a>
	# Parent
	ret
    1e44:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e46:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e48:	6522                	ld	a0,8(sp)
	jalr a1
    1e4a:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e4c:	05d00893          	li	a7,93
	ecall
    1e50:	00000073          	ecall
