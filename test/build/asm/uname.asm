
/home/lmq/Desktop/xv6-k210/test/build/riscv64/uname:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a86d                	j	10bc <__start_main>

0000000000001004 <test_uname>:
	char domainname[65];
};

struct utsname un;

void test_uname() {
    1004:	1141                	addi	sp,sp,-16
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	e8250513          	addi	a0,a0,-382 # 1e88 <__clone+0x2a>
void test_uname() {
    100e:	e406                	sd	ra,8(sp)
	TEST_START(__func__);
    1010:	2aa000ef          	jal	ra,12ba <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	09450513          	addi	a0,a0,148 # 20a8 <__func__.1199>
    101c:	29e000ef          	jal	ra,12ba <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	e8050513          	addi	a0,a0,-384 # 1ea0 <__clone+0x42>
    1028:	292000ef          	jal	ra,12ba <puts>
	int test_ret = uname(&un);
    102c:	00001517          	auipc	a0,0x1
    1030:	ef450513          	addi	a0,a0,-268 # 1f20 <un>
    1034:	59b000ef          	jal	ra,1dce <uname>
	assert(test_ret >= 0);
    1038:	06054363          	bltz	a0,109e <test_uname+0x9a>

	printf("Uname: %s %s %s %s %s %s\n", 
    103c:	00001817          	auipc	a6,0x1
    1040:	02980813          	addi	a6,a6,41 # 2065 <un+0x145>
    1044:	00001797          	auipc	a5,0x1
    1048:	fe078793          	addi	a5,a5,-32 # 2024 <un+0x104>
    104c:	00001717          	auipc	a4,0x1
    1050:	f9770713          	addi	a4,a4,-105 # 1fe3 <un+0xc3>
    1054:	00001697          	auipc	a3,0x1
    1058:	f4e68693          	addi	a3,a3,-178 # 1fa2 <un+0x82>
    105c:	00001617          	auipc	a2,0x1
    1060:	f0560613          	addi	a2,a2,-251 # 1f61 <un+0x41>
    1064:	00001597          	auipc	a1,0x1
    1068:	ebc58593          	addi	a1,a1,-324 # 1f20 <un>
    106c:	00001517          	auipc	a0,0x1
    1070:	e6450513          	addi	a0,a0,-412 # 1ed0 <__clone+0x72>
    1074:	268000ef          	jal	ra,12dc <printf>
		un.sysname, un.nodename, un.release, un.version, un.machine, un.domainname);

	TEST_END(__func__);
    1078:	00001517          	auipc	a0,0x1
    107c:	e7850513          	addi	a0,a0,-392 # 1ef0 <__clone+0x92>
    1080:	23a000ef          	jal	ra,12ba <puts>
    1084:	00001517          	auipc	a0,0x1
    1088:	02450513          	addi	a0,a0,36 # 20a8 <__func__.1199>
    108c:	22e000ef          	jal	ra,12ba <puts>
}
    1090:	60a2                	ld	ra,8(sp)
	TEST_END(__func__);
    1092:	00001517          	auipc	a0,0x1
    1096:	e0e50513          	addi	a0,a0,-498 # 1ea0 <__clone+0x42>
}
    109a:	0141                	addi	sp,sp,16
	TEST_END(__func__);
    109c:	ac39                	j	12ba <puts>
	assert(test_ret >= 0);
    109e:	00001517          	auipc	a0,0x1
    10a2:	e1250513          	addi	a0,a0,-494 # 1eb0 <__clone+0x52>
    10a6:	4be000ef          	jal	ra,1564 <panic>
    10aa:	bf49                	j	103c <test_uname+0x38>

00000000000010ac <main>:

int main(void) {
    10ac:	1141                	addi	sp,sp,-16
    10ae:	e406                	sd	ra,8(sp)
	test_uname();
    10b0:	f55ff0ef          	jal	ra,1004 <test_uname>
	return 0;
}
    10b4:	60a2                	ld	ra,8(sp)
    10b6:	4501                	li	a0,0
    10b8:	0141                	addi	sp,sp,16
    10ba:	8082                	ret

00000000000010bc <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10bc:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10be:	4108                	lw	a0,0(a0)
{
    10c0:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10c2:	05a1                	addi	a1,a1,8
{
    10c4:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10c6:	fe7ff0ef          	jal	ra,10ac <main>
    10ca:	3ad000ef          	jal	ra,1c76 <exit>
	return 0;
}
    10ce:	60a2                	ld	ra,8(sp)
    10d0:	4501                	li	a0,0
    10d2:	0141                	addi	sp,sp,16
    10d4:	8082                	ret

00000000000010d6 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10d6:	7179                	addi	sp,sp,-48
    10d8:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10da:	12054b63          	bltz	a0,1210 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10de:	02b577bb          	remuw	a5,a0,a1
    10e2:	00001697          	auipc	a3,0x1
    10e6:	fd668693          	addi	a3,a3,-42 # 20b8 <digits>
    buf[16] = 0;
    10ea:	00010c23          	sb	zero,24(sp)
    i = 15;
    10ee:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    10f2:	1782                	slli	a5,a5,0x20
    10f4:	9381                	srli	a5,a5,0x20
    10f6:	97b6                	add	a5,a5,a3
    10f8:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10fc:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1100:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1104:	16b56263          	bltu	a0,a1,1268 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1108:	02e8763b          	remuw	a2,a6,a4
    110c:	1602                	slli	a2,a2,0x20
    110e:	9201                	srli	a2,a2,0x20
    1110:	9636                	add	a2,a2,a3
    1112:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1116:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    111a:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    111e:	12e86963          	bltu	a6,a4,1250 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    1122:	02e5f63b          	remuw	a2,a1,a4
    1126:	1602                	slli	a2,a2,0x20
    1128:	9201                	srli	a2,a2,0x20
    112a:	9636                	add	a2,a2,a3
    112c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1130:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1134:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1138:	10e5ef63          	bltu	a1,a4,1256 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    113c:	02e8763b          	remuw	a2,a6,a4
    1140:	1602                	slli	a2,a2,0x20
    1142:	9201                	srli	a2,a2,0x20
    1144:	9636                	add	a2,a2,a3
    1146:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    114a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    114e:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1152:	10e86563          	bltu	a6,a4,125c <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    1156:	02e5f63b          	remuw	a2,a1,a4
    115a:	1602                	slli	a2,a2,0x20
    115c:	9201                	srli	a2,a2,0x20
    115e:	9636                	add	a2,a2,a3
    1160:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1164:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1168:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    116c:	0ee5eb63          	bltu	a1,a4,1262 <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    1170:	02e8763b          	remuw	a2,a6,a4
    1174:	1602                	slli	a2,a2,0x20
    1176:	9201                	srli	a2,a2,0x20
    1178:	9636                	add	a2,a2,a3
    117a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    117e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1182:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1186:	0ce86263          	bltu	a6,a4,124a <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    118a:	02e5f63b          	remuw	a2,a1,a4
    118e:	1602                	slli	a2,a2,0x20
    1190:	9201                	srli	a2,a2,0x20
    1192:	9636                	add	a2,a2,a3
    1194:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1198:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    119c:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11a0:	0ce5e663          	bltu	a1,a4,126c <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    11a4:	02e8763b          	remuw	a2,a6,a4
    11a8:	1602                	slli	a2,a2,0x20
    11aa:	9201                	srli	a2,a2,0x20
    11ac:	9636                	add	a2,a2,a3
    11ae:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b2:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11b6:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11ba:	0ae86c63          	bltu	a6,a4,1272 <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    11be:	02e5f63b          	remuw	a2,a1,a4
    11c2:	1602                	slli	a2,a2,0x20
    11c4:	9201                	srli	a2,a2,0x20
    11c6:	9636                	add	a2,a2,a3
    11c8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11cc:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11d0:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11d4:	0ae5e263          	bltu	a1,a4,1278 <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    11d8:	1782                	slli	a5,a5,0x20
    11da:	9381                	srli	a5,a5,0x20
    11dc:	97b6                	add	a5,a5,a3
    11de:	0007c703          	lbu	a4,0(a5)
    11e2:	4599                	li	a1,6
    11e4:	4795                	li	a5,5
    11e6:	00e10723          	sb	a4,14(sp)

    if (sign)
    11ea:	00055963          	bgez	a0,11fc <printint.constprop.0+0x126>
        buf[i--] = '-';
    11ee:	1018                	addi	a4,sp,32
    11f0:	973e                	add	a4,a4,a5
    11f2:	02d00693          	li	a3,45
    11f6:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    11fa:	85be                	mv	a1,a5
    write(f, s, l);
    11fc:	003c                	addi	a5,sp,8
    11fe:	4641                	li	a2,16
    1200:	9e0d                	subw	a2,a2,a1
    1202:	4505                	li	a0,1
    1204:	95be                	add	a1,a1,a5
    1206:	221000ef          	jal	ra,1c26 <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    120a:	70a2                	ld	ra,40(sp)
    120c:	6145                	addi	sp,sp,48
    120e:	8082                	ret
        x = -xx;
    1210:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1214:	02b677bb          	remuw	a5,a2,a1
    1218:	00001697          	auipc	a3,0x1
    121c:	ea068693          	addi	a3,a3,-352 # 20b8 <digits>
    buf[16] = 0;
    1220:	00010c23          	sb	zero,24(sp)
    i = 15;
    1224:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    1228:	1782                	slli	a5,a5,0x20
    122a:	9381                	srli	a5,a5,0x20
    122c:	97b6                	add	a5,a5,a3
    122e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1232:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1236:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    123a:	ecb677e3          	bgeu	a2,a1,1108 <printint.constprop.0+0x32>
        buf[i--] = '-';
    123e:	02d00793          	li	a5,45
    1242:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1246:	45b9                	li	a1,14
    1248:	bf55                	j	11fc <printint.constprop.0+0x126>
    124a:	47a5                	li	a5,9
    124c:	45a9                	li	a1,10
    124e:	bf71                	j	11ea <printint.constprop.0+0x114>
    1250:	47b5                	li	a5,13
    1252:	45b9                	li	a1,14
    1254:	bf59                	j	11ea <printint.constprop.0+0x114>
    1256:	47b1                	li	a5,12
    1258:	45b5                	li	a1,13
    125a:	bf41                	j	11ea <printint.constprop.0+0x114>
    125c:	47ad                	li	a5,11
    125e:	45b1                	li	a1,12
    1260:	b769                	j	11ea <printint.constprop.0+0x114>
    1262:	47a9                	li	a5,10
    1264:	45ad                	li	a1,11
    1266:	b751                	j	11ea <printint.constprop.0+0x114>
    i = 15;
    1268:	45bd                	li	a1,15
    126a:	bf49                	j	11fc <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    126c:	47a1                	li	a5,8
    126e:	45a5                	li	a1,9
    1270:	bfad                	j	11ea <printint.constprop.0+0x114>
    1272:	479d                	li	a5,7
    1274:	45a1                	li	a1,8
    1276:	bf95                	j	11ea <printint.constprop.0+0x114>
    1278:	4799                	li	a5,6
    127a:	459d                	li	a1,7
    127c:	b7bd                	j	11ea <printint.constprop.0+0x114>

000000000000127e <getchar>:
{
    127e:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1280:	00f10593          	addi	a1,sp,15
    1284:	4605                	li	a2,1
    1286:	4501                	li	a0,0
{
    1288:	ec06                	sd	ra,24(sp)
    char byte = 0;
    128a:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    128e:	18f000ef          	jal	ra,1c1c <read>
}
    1292:	60e2                	ld	ra,24(sp)
    1294:	00f14503          	lbu	a0,15(sp)
    1298:	6105                	addi	sp,sp,32
    129a:	8082                	ret

000000000000129c <putchar>:
{
    129c:	1101                	addi	sp,sp,-32
    129e:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12a0:	00f10593          	addi	a1,sp,15
    12a4:	4605                	li	a2,1
    12a6:	4505                	li	a0,1
{
    12a8:	ec06                	sd	ra,24(sp)
    char byte = c;
    12aa:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12ae:	179000ef          	jal	ra,1c26 <write>
}
    12b2:	60e2                	ld	ra,24(sp)
    12b4:	2501                	sext.w	a0,a0
    12b6:	6105                	addi	sp,sp,32
    12b8:	8082                	ret

00000000000012ba <puts>:
{
    12ba:	1141                	addi	sp,sp,-16
    12bc:	e406                	sd	ra,8(sp)
    12be:	e022                	sd	s0,0(sp)
    12c0:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12c2:	580000ef          	jal	ra,1842 <strlen>
    12c6:	862a                	mv	a2,a0
    12c8:	85a2                	mv	a1,s0
    12ca:	4505                	li	a0,1
    12cc:	15b000ef          	jal	ra,1c26 <write>
}
    12d0:	60a2                	ld	ra,8(sp)
    12d2:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12d4:	957d                	srai	a0,a0,0x3f
    return r;
    12d6:	2501                	sext.w	a0,a0
}
    12d8:	0141                	addi	sp,sp,16
    12da:	8082                	ret

00000000000012dc <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12dc:	7171                	addi	sp,sp,-176
    12de:	fc56                	sd	s5,56(sp)
    12e0:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    12e2:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12e4:	18bc                	addi	a5,sp,120
{
    12e6:	e8ca                	sd	s2,80(sp)
    12e8:	e4ce                	sd	s3,72(sp)
    12ea:	e0d2                	sd	s4,64(sp)
    12ec:	f85a                	sd	s6,48(sp)
    12ee:	f486                	sd	ra,104(sp)
    12f0:	f0a2                	sd	s0,96(sp)
    12f2:	eca6                	sd	s1,88(sp)
    12f4:	fcae                	sd	a1,120(sp)
    12f6:	e132                	sd	a2,128(sp)
    12f8:	e536                	sd	a3,136(sp)
    12fa:	e93a                	sd	a4,144(sp)
    12fc:	f142                	sd	a6,160(sp)
    12fe:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1300:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1302:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1306:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    130a:	00001b17          	auipc	s6,0x1
    130e:	bf6b0b13          	addi	s6,s6,-1034 # 1f00 <__clone+0xa2>
    buf[i++] = '0';
    1312:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1316:	00001997          	auipc	s3,0x1
    131a:	da298993          	addi	s3,s3,-606 # 20b8 <digits>
        if (!*s)
    131e:	00054783          	lbu	a5,0(a0)
    1322:	16078a63          	beqz	a5,1496 <printf+0x1ba>
    1326:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1328:	19278163          	beq	a5,s2,14aa <printf+0x1ce>
    132c:	00164783          	lbu	a5,1(a2)
    1330:	0605                	addi	a2,a2,1
    1332:	fbfd                	bnez	a5,1328 <printf+0x4c>
    1334:	84b2                	mv	s1,a2
        l = z - a;
    1336:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    133a:	85aa                	mv	a1,a0
    133c:	8622                	mv	a2,s0
    133e:	4505                	li	a0,1
    1340:	0e7000ef          	jal	ra,1c26 <write>
        if (l)
    1344:	18041c63          	bnez	s0,14dc <printf+0x200>
        if (s[1] == 0)
    1348:	0014c783          	lbu	a5,1(s1)
    134c:	14078563          	beqz	a5,1496 <printf+0x1ba>
        switch (s[1])
    1350:	1d478063          	beq	a5,s4,1510 <printf+0x234>
    1354:	18fa6663          	bltu	s4,a5,14e0 <printf+0x204>
    1358:	06400713          	li	a4,100
    135c:	1ae78063          	beq	a5,a4,14fc <printf+0x220>
    1360:	07000713          	li	a4,112
    1364:	1ce79963          	bne	a5,a4,1536 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    1368:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    136a:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    136e:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1370:	631c                	ld	a5,0(a4)
    1372:	0721                	addi	a4,a4,8
    1374:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1376:	00479293          	slli	t0,a5,0x4
    137a:	00879f93          	slli	t6,a5,0x8
    137e:	00c79f13          	slli	t5,a5,0xc
    1382:	01079e93          	slli	t4,a5,0x10
    1386:	01479e13          	slli	t3,a5,0x14
    138a:	01879313          	slli	t1,a5,0x18
    138e:	01c79893          	slli	a7,a5,0x1c
    1392:	02479813          	slli	a6,a5,0x24
    1396:	02879513          	slli	a0,a5,0x28
    139a:	02c79593          	slli	a1,a5,0x2c
    139e:	03079693          	slli	a3,a5,0x30
    13a2:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13a6:	03c7d413          	srli	s0,a5,0x3c
    13aa:	01c7d39b          	srliw	t2,a5,0x1c
    13ae:	03c2d293          	srli	t0,t0,0x3c
    13b2:	03cfdf93          	srli	t6,t6,0x3c
    13b6:	03cf5f13          	srli	t5,t5,0x3c
    13ba:	03cede93          	srli	t4,t4,0x3c
    13be:	03ce5e13          	srli	t3,t3,0x3c
    13c2:	03c35313          	srli	t1,t1,0x3c
    13c6:	03c8d893          	srli	a7,a7,0x3c
    13ca:	03c85813          	srli	a6,a6,0x3c
    13ce:	9171                	srli	a0,a0,0x3c
    13d0:	91f1                	srli	a1,a1,0x3c
    13d2:	92f1                	srli	a3,a3,0x3c
    13d4:	9371                	srli	a4,a4,0x3c
    13d6:	96ce                	add	a3,a3,s3
    13d8:	974e                	add	a4,a4,s3
    13da:	944e                	add	s0,s0,s3
    13dc:	92ce                	add	t0,t0,s3
    13de:	9fce                	add	t6,t6,s3
    13e0:	9f4e                	add	t5,t5,s3
    13e2:	9ece                	add	t4,t4,s3
    13e4:	9e4e                	add	t3,t3,s3
    13e6:	934e                	add	t1,t1,s3
    13e8:	98ce                	add	a7,a7,s3
    13ea:	93ce                	add	t2,t2,s3
    13ec:	984e                	add	a6,a6,s3
    13ee:	954e                	add	a0,a0,s3
    13f0:	95ce                	add	a1,a1,s3
    13f2:	0006c083          	lbu	ra,0(a3)
    13f6:	0002c283          	lbu	t0,0(t0)
    13fa:	00074683          	lbu	a3,0(a4)
    13fe:	000fcf83          	lbu	t6,0(t6)
    1402:	000f4f03          	lbu	t5,0(t5)
    1406:	000ece83          	lbu	t4,0(t4)
    140a:	000e4e03          	lbu	t3,0(t3)
    140e:	00034303          	lbu	t1,0(t1)
    1412:	0008c883          	lbu	a7,0(a7)
    1416:	0003c383          	lbu	t2,0(t2)
    141a:	00084803          	lbu	a6,0(a6)
    141e:	00054503          	lbu	a0,0(a0)
    1422:	0005c583          	lbu	a1,0(a1)
    1426:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    142a:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    142e:	9371                	srli	a4,a4,0x3c
    1430:	8bbd                	andi	a5,a5,15
    1432:	974e                	add	a4,a4,s3
    1434:	97ce                	add	a5,a5,s3
    1436:	005105a3          	sb	t0,11(sp)
    143a:	01f10623          	sb	t6,12(sp)
    143e:	01e106a3          	sb	t5,13(sp)
    1442:	01d10723          	sb	t4,14(sp)
    1446:	01c107a3          	sb	t3,15(sp)
    144a:	00610823          	sb	t1,16(sp)
    144e:	011108a3          	sb	a7,17(sp)
    1452:	00710923          	sb	t2,18(sp)
    1456:	010109a3          	sb	a6,19(sp)
    145a:	00a10a23          	sb	a0,20(sp)
    145e:	00b10aa3          	sb	a1,21(sp)
    1462:	00110b23          	sb	ra,22(sp)
    1466:	00d10ba3          	sb	a3,23(sp)
    146a:	00810523          	sb	s0,10(sp)
    146e:	00074703          	lbu	a4,0(a4)
    1472:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1476:	002c                	addi	a1,sp,8
    1478:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    147a:	00e10c23          	sb	a4,24(sp)
    147e:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1482:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1486:	7a0000ef          	jal	ra,1c26 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    148a:	00248513          	addi	a0,s1,2
        if (!*s)
    148e:	00054783          	lbu	a5,0(a0)
    1492:	e8079ae3          	bnez	a5,1326 <printf+0x4a>
    }
    va_end(ap);
}
    1496:	70a6                	ld	ra,104(sp)
    1498:	7406                	ld	s0,96(sp)
    149a:	64e6                	ld	s1,88(sp)
    149c:	6946                	ld	s2,80(sp)
    149e:	69a6                	ld	s3,72(sp)
    14a0:	6a06                	ld	s4,64(sp)
    14a2:	7ae2                	ld	s5,56(sp)
    14a4:	7b42                	ld	s6,48(sp)
    14a6:	614d                	addi	sp,sp,176
    14a8:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14aa:	00064783          	lbu	a5,0(a2)
    14ae:	84b2                	mv	s1,a2
    14b0:	01278963          	beq	a5,s2,14c2 <printf+0x1e6>
    14b4:	b549                	j	1336 <printf+0x5a>
    14b6:	0024c783          	lbu	a5,2(s1)
    14ba:	0605                	addi	a2,a2,1
    14bc:	0489                	addi	s1,s1,2
    14be:	e7279ce3          	bne	a5,s2,1336 <printf+0x5a>
    14c2:	0014c783          	lbu	a5,1(s1)
    14c6:	ff2788e3          	beq	a5,s2,14b6 <printf+0x1da>
        l = z - a;
    14ca:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14ce:	85aa                	mv	a1,a0
    14d0:	8622                	mv	a2,s0
    14d2:	4505                	li	a0,1
    14d4:	752000ef          	jal	ra,1c26 <write>
        if (l)
    14d8:	e60408e3          	beqz	s0,1348 <printf+0x6c>
    14dc:	8526                	mv	a0,s1
    14de:	b581                	j	131e <printf+0x42>
        switch (s[1])
    14e0:	07800713          	li	a4,120
    14e4:	04e79963          	bne	a5,a4,1536 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    14e8:	6782                	ld	a5,0(sp)
    14ea:	45c1                	li	a1,16
    14ec:	4388                	lw	a0,0(a5)
    14ee:	07a1                	addi	a5,a5,8
    14f0:	e03e                	sd	a5,0(sp)
    14f2:	be5ff0ef          	jal	ra,10d6 <printint.constprop.0>
        s += 2;
    14f6:	00248513          	addi	a0,s1,2
    14fa:	bf51                	j	148e <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    14fc:	6782                	ld	a5,0(sp)
    14fe:	45a9                	li	a1,10
    1500:	4388                	lw	a0,0(a5)
    1502:	07a1                	addi	a5,a5,8
    1504:	e03e                	sd	a5,0(sp)
    1506:	bd1ff0ef          	jal	ra,10d6 <printint.constprop.0>
        s += 2;
    150a:	00248513          	addi	a0,s1,2
    150e:	b741                	j	148e <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1510:	6782                	ld	a5,0(sp)
    1512:	6380                	ld	s0,0(a5)
    1514:	07a1                	addi	a5,a5,8
    1516:	e03e                	sd	a5,0(sp)
    1518:	c421                	beqz	s0,1560 <printf+0x284>
            l = strnlen(a, 200);
    151a:	0c800593          	li	a1,200
    151e:	8522                	mv	a0,s0
    1520:	40e000ef          	jal	ra,192e <strnlen>
    write(f, s, l);
    1524:	0005061b          	sext.w	a2,a0
    1528:	85a2                	mv	a1,s0
    152a:	4505                	li	a0,1
    152c:	6fa000ef          	jal	ra,1c26 <write>
        s += 2;
    1530:	00248513          	addi	a0,s1,2
    1534:	bfa9                	j	148e <printf+0x1b2>
    char byte = c;
    1536:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    153a:	4605                	li	a2,1
    153c:	002c                	addi	a1,sp,8
    153e:	4505                	li	a0,1
    char byte = c;
    1540:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1544:	6e2000ef          	jal	ra,1c26 <write>
    char byte = c;
    1548:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    154c:	4605                	li	a2,1
    154e:	002c                	addi	a1,sp,8
    1550:	4505                	li	a0,1
    char byte = c;
    1552:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1556:	6d0000ef          	jal	ra,1c26 <write>
        s += 2;
    155a:	00248513          	addi	a0,s1,2
    155e:	bf05                	j	148e <printf+0x1b2>
                a = "(null)";
    1560:	845a                	mv	s0,s6
    1562:	bf65                	j	151a <printf+0x23e>

0000000000001564 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1564:	1141                	addi	sp,sp,-16
    1566:	e406                	sd	ra,8(sp)
    puts(m);
    1568:	d53ff0ef          	jal	ra,12ba <puts>
    exit(-100);
}
    156c:	60a2                	ld	ra,8(sp)
    exit(-100);
    156e:	f9c00513          	li	a0,-100
}
    1572:	0141                	addi	sp,sp,16
    exit(-100);
    1574:	a709                	j	1c76 <exit>

0000000000001576 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1576:	02000793          	li	a5,32
    157a:	00f50663          	beq	a0,a5,1586 <isspace+0x10>
    157e:	355d                	addiw	a0,a0,-9
    1580:	00553513          	sltiu	a0,a0,5
    1584:	8082                	ret
    1586:	4505                	li	a0,1
}
    1588:	8082                	ret

000000000000158a <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    158a:	fd05051b          	addiw	a0,a0,-48
}
    158e:	00a53513          	sltiu	a0,a0,10
    1592:	8082                	ret

0000000000001594 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1594:	02000613          	li	a2,32
    1598:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    159a:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    159e:	ff77069b          	addiw	a3,a4,-9
    15a2:	04c70d63          	beq	a4,a2,15fc <atoi+0x68>
    15a6:	0007079b          	sext.w	a5,a4
    15aa:	04d5f963          	bgeu	a1,a3,15fc <atoi+0x68>
        s++;
    switch (*s)
    15ae:	02b00693          	li	a3,43
    15b2:	04d70a63          	beq	a4,a3,1606 <atoi+0x72>
    15b6:	02d00693          	li	a3,45
    15ba:	06d70463          	beq	a4,a3,1622 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15be:	fd07859b          	addiw	a1,a5,-48
    15c2:	4625                	li	a2,9
    15c4:	873e                	mv	a4,a5
    15c6:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15c8:	4e01                	li	t3,0
    while (isdigit(*s))
    15ca:	04b66a63          	bltu	a2,a1,161e <atoi+0x8a>
    int n = 0, neg = 0;
    15ce:	4501                	li	a0,0
    while (isdigit(*s))
    15d0:	4825                	li	a6,9
    15d2:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    15d6:	0025179b          	slliw	a5,a0,0x2
    15da:	9d3d                	addw	a0,a0,a5
    15dc:	fd07031b          	addiw	t1,a4,-48
    15e0:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15e4:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15e8:	0685                	addi	a3,a3,1
    15ea:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15ee:	0006071b          	sext.w	a4,a2
    15f2:	feb870e3          	bgeu	a6,a1,15d2 <atoi+0x3e>
    return neg ? n : -n;
    15f6:	000e0563          	beqz	t3,1600 <atoi+0x6c>
}
    15fa:	8082                	ret
        s++;
    15fc:	0505                	addi	a0,a0,1
    15fe:	bf71                	j	159a <atoi+0x6>
    1600:	4113053b          	subw	a0,t1,a7
    1604:	8082                	ret
    while (isdigit(*s))
    1606:	00154783          	lbu	a5,1(a0)
    160a:	4625                	li	a2,9
        s++;
    160c:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1610:	fd07859b          	addiw	a1,a5,-48
    1614:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1618:	4e01                	li	t3,0
    while (isdigit(*s))
    161a:	fab67ae3          	bgeu	a2,a1,15ce <atoi+0x3a>
    161e:	4501                	li	a0,0
}
    1620:	8082                	ret
    while (isdigit(*s))
    1622:	00154783          	lbu	a5,1(a0)
    1626:	4625                	li	a2,9
        s++;
    1628:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    162c:	fd07859b          	addiw	a1,a5,-48
    1630:	0007871b          	sext.w	a4,a5
    1634:	feb665e3          	bltu	a2,a1,161e <atoi+0x8a>
        neg = 1;
    1638:	4e05                	li	t3,1
    163a:	bf51                	j	15ce <atoi+0x3a>

000000000000163c <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    163c:	16060d63          	beqz	a2,17b6 <memset+0x17a>
    1640:	40a007b3          	neg	a5,a0
    1644:	8b9d                	andi	a5,a5,7
    1646:	00778713          	addi	a4,a5,7
    164a:	482d                	li	a6,11
    164c:	0ff5f593          	andi	a1,a1,255
    1650:	fff60693          	addi	a3,a2,-1
    1654:	17076263          	bltu	a4,a6,17b8 <memset+0x17c>
    1658:	16e6ea63          	bltu	a3,a4,17cc <memset+0x190>
    165c:	16078563          	beqz	a5,17c6 <memset+0x18a>
    1660:	00b50023          	sb	a1,0(a0)
    1664:	4705                	li	a4,1
    1666:	00150e93          	addi	t4,a0,1
    166a:	14e78c63          	beq	a5,a4,17c2 <memset+0x186>
    166e:	00b500a3          	sb	a1,1(a0)
    1672:	4709                	li	a4,2
    1674:	00250e93          	addi	t4,a0,2
    1678:	14e78d63          	beq	a5,a4,17d2 <memset+0x196>
    167c:	00b50123          	sb	a1,2(a0)
    1680:	470d                	li	a4,3
    1682:	00350e93          	addi	t4,a0,3
    1686:	12e78b63          	beq	a5,a4,17bc <memset+0x180>
    168a:	00b501a3          	sb	a1,3(a0)
    168e:	4711                	li	a4,4
    1690:	00450e93          	addi	t4,a0,4
    1694:	14e78163          	beq	a5,a4,17d6 <memset+0x19a>
    1698:	00b50223          	sb	a1,4(a0)
    169c:	4715                	li	a4,5
    169e:	00550e93          	addi	t4,a0,5
    16a2:	12e78c63          	beq	a5,a4,17da <memset+0x19e>
    16a6:	00b502a3          	sb	a1,5(a0)
    16aa:	471d                	li	a4,7
    16ac:	00650e93          	addi	t4,a0,6
    16b0:	12e79763          	bne	a5,a4,17de <memset+0x1a2>
    16b4:	00750e93          	addi	t4,a0,7
    16b8:	00b50323          	sb	a1,6(a0)
    16bc:	4f1d                	li	t5,7
    16be:	00859713          	slli	a4,a1,0x8
    16c2:	8f4d                	or	a4,a4,a1
    16c4:	01059e13          	slli	t3,a1,0x10
    16c8:	01c76e33          	or	t3,a4,t3
    16cc:	01859313          	slli	t1,a1,0x18
    16d0:	006e6333          	or	t1,t3,t1
    16d4:	02059893          	slli	a7,a1,0x20
    16d8:	011368b3          	or	a7,t1,a7
    16dc:	02859813          	slli	a6,a1,0x28
    16e0:	40f60333          	sub	t1,a2,a5
    16e4:	0108e833          	or	a6,a7,a6
    16e8:	03059693          	slli	a3,a1,0x30
    16ec:	00d866b3          	or	a3,a6,a3
    16f0:	03859713          	slli	a4,a1,0x38
    16f4:	97aa                	add	a5,a5,a0
    16f6:	ff837813          	andi	a6,t1,-8
    16fa:	8f55                	or	a4,a4,a3
    16fc:	00f806b3          	add	a3,a6,a5
    1700:	e398                	sd	a4,0(a5)
    1702:	07a1                	addi	a5,a5,8
    1704:	fed79ee3          	bne	a5,a3,1700 <memset+0xc4>
    1708:	ff837693          	andi	a3,t1,-8
    170c:	00de87b3          	add	a5,t4,a3
    1710:	01e6873b          	addw	a4,a3,t5
    1714:	0ad30663          	beq	t1,a3,17c0 <memset+0x184>
    1718:	00b78023          	sb	a1,0(a5)
    171c:	0017069b          	addiw	a3,a4,1
    1720:	08c6fb63          	bgeu	a3,a2,17b6 <memset+0x17a>
    1724:	00b780a3          	sb	a1,1(a5)
    1728:	0027069b          	addiw	a3,a4,2
    172c:	08c6f563          	bgeu	a3,a2,17b6 <memset+0x17a>
    1730:	00b78123          	sb	a1,2(a5)
    1734:	0037069b          	addiw	a3,a4,3
    1738:	06c6ff63          	bgeu	a3,a2,17b6 <memset+0x17a>
    173c:	00b781a3          	sb	a1,3(a5)
    1740:	0047069b          	addiw	a3,a4,4
    1744:	06c6f963          	bgeu	a3,a2,17b6 <memset+0x17a>
    1748:	00b78223          	sb	a1,4(a5)
    174c:	0057069b          	addiw	a3,a4,5
    1750:	06c6f363          	bgeu	a3,a2,17b6 <memset+0x17a>
    1754:	00b782a3          	sb	a1,5(a5)
    1758:	0067069b          	addiw	a3,a4,6
    175c:	04c6fd63          	bgeu	a3,a2,17b6 <memset+0x17a>
    1760:	00b78323          	sb	a1,6(a5)
    1764:	0077069b          	addiw	a3,a4,7
    1768:	04c6f763          	bgeu	a3,a2,17b6 <memset+0x17a>
    176c:	00b783a3          	sb	a1,7(a5)
    1770:	0087069b          	addiw	a3,a4,8
    1774:	04c6f163          	bgeu	a3,a2,17b6 <memset+0x17a>
    1778:	00b78423          	sb	a1,8(a5)
    177c:	0097069b          	addiw	a3,a4,9
    1780:	02c6fb63          	bgeu	a3,a2,17b6 <memset+0x17a>
    1784:	00b784a3          	sb	a1,9(a5)
    1788:	00a7069b          	addiw	a3,a4,10
    178c:	02c6f563          	bgeu	a3,a2,17b6 <memset+0x17a>
    1790:	00b78523          	sb	a1,10(a5)
    1794:	00b7069b          	addiw	a3,a4,11
    1798:	00c6ff63          	bgeu	a3,a2,17b6 <memset+0x17a>
    179c:	00b785a3          	sb	a1,11(a5)
    17a0:	00c7069b          	addiw	a3,a4,12
    17a4:	00c6f963          	bgeu	a3,a2,17b6 <memset+0x17a>
    17a8:	00b78623          	sb	a1,12(a5)
    17ac:	2735                	addiw	a4,a4,13
    17ae:	00c77463          	bgeu	a4,a2,17b6 <memset+0x17a>
    17b2:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17b6:	8082                	ret
    17b8:	472d                	li	a4,11
    17ba:	bd79                	j	1658 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17bc:	4f0d                	li	t5,3
    17be:	b701                	j	16be <memset+0x82>
    17c0:	8082                	ret
    17c2:	4f05                	li	t5,1
    17c4:	bded                	j	16be <memset+0x82>
    17c6:	8eaa                	mv	t4,a0
    17c8:	4f01                	li	t5,0
    17ca:	bdd5                	j	16be <memset+0x82>
    17cc:	87aa                	mv	a5,a0
    17ce:	4701                	li	a4,0
    17d0:	b7a1                	j	1718 <memset+0xdc>
    17d2:	4f09                	li	t5,2
    17d4:	b5ed                	j	16be <memset+0x82>
    17d6:	4f11                	li	t5,4
    17d8:	b5dd                	j	16be <memset+0x82>
    17da:	4f15                	li	t5,5
    17dc:	b5cd                	j	16be <memset+0x82>
    17de:	4f19                	li	t5,6
    17e0:	bdf9                	j	16be <memset+0x82>

00000000000017e2 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17e2:	00054783          	lbu	a5,0(a0)
    17e6:	0005c703          	lbu	a4,0(a1)
    17ea:	00e79863          	bne	a5,a4,17fa <strcmp+0x18>
    17ee:	0505                	addi	a0,a0,1
    17f0:	0585                	addi	a1,a1,1
    17f2:	fbe5                	bnez	a5,17e2 <strcmp>
    17f4:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17f6:	9d19                	subw	a0,a0,a4
    17f8:	8082                	ret
    17fa:	0007851b          	sext.w	a0,a5
    17fe:	bfe5                	j	17f6 <strcmp+0x14>

0000000000001800 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1800:	ce05                	beqz	a2,1838 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1802:	00054703          	lbu	a4,0(a0)
    1806:	0005c783          	lbu	a5,0(a1)
    180a:	cb0d                	beqz	a4,183c <strncmp+0x3c>
    if (!n--)
    180c:	167d                	addi	a2,a2,-1
    180e:	00c506b3          	add	a3,a0,a2
    1812:	a819                	j	1828 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1814:	00a68e63          	beq	a3,a0,1830 <strncmp+0x30>
    1818:	0505                	addi	a0,a0,1
    181a:	00e79b63          	bne	a5,a4,1830 <strncmp+0x30>
    181e:	00054703          	lbu	a4,0(a0)
    1822:	0005c783          	lbu	a5,0(a1)
    1826:	cb19                	beqz	a4,183c <strncmp+0x3c>
    1828:	0005c783          	lbu	a5,0(a1)
    182c:	0585                	addi	a1,a1,1
    182e:	f3fd                	bnez	a5,1814 <strncmp+0x14>
        ;
    return *l - *r;
    1830:	0007051b          	sext.w	a0,a4
    1834:	9d1d                	subw	a0,a0,a5
    1836:	8082                	ret
        return 0;
    1838:	4501                	li	a0,0
}
    183a:	8082                	ret
    183c:	4501                	li	a0,0
    return *l - *r;
    183e:	9d1d                	subw	a0,a0,a5
    1840:	8082                	ret

0000000000001842 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1842:	00757793          	andi	a5,a0,7
    1846:	cf89                	beqz	a5,1860 <strlen+0x1e>
    1848:	87aa                	mv	a5,a0
    184a:	a029                	j	1854 <strlen+0x12>
    184c:	0785                	addi	a5,a5,1
    184e:	0077f713          	andi	a4,a5,7
    1852:	cb01                	beqz	a4,1862 <strlen+0x20>
        if (!*s)
    1854:	0007c703          	lbu	a4,0(a5)
    1858:	fb75                	bnez	a4,184c <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    185a:	40a78533          	sub	a0,a5,a0
}
    185e:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1860:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1862:	6394                	ld	a3,0(a5)
    1864:	00000597          	auipc	a1,0x0
    1868:	6a45b583          	ld	a1,1700(a1) # 1f08 <__clone+0xaa>
    186c:	00000617          	auipc	a2,0x0
    1870:	6a463603          	ld	a2,1700(a2) # 1f10 <__clone+0xb2>
    1874:	a019                	j	187a <strlen+0x38>
    1876:	6794                	ld	a3,8(a5)
    1878:	07a1                	addi	a5,a5,8
    187a:	00b68733          	add	a4,a3,a1
    187e:	fff6c693          	not	a3,a3
    1882:	8f75                	and	a4,a4,a3
    1884:	8f71                	and	a4,a4,a2
    1886:	db65                	beqz	a4,1876 <strlen+0x34>
    for (; *s; s++)
    1888:	0007c703          	lbu	a4,0(a5)
    188c:	d779                	beqz	a4,185a <strlen+0x18>
    188e:	0017c703          	lbu	a4,1(a5)
    1892:	0785                	addi	a5,a5,1
    1894:	d379                	beqz	a4,185a <strlen+0x18>
    1896:	0017c703          	lbu	a4,1(a5)
    189a:	0785                	addi	a5,a5,1
    189c:	fb6d                	bnez	a4,188e <strlen+0x4c>
    189e:	bf75                	j	185a <strlen+0x18>

00000000000018a0 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18a0:	00757713          	andi	a4,a0,7
{
    18a4:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18a6:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18aa:	cb19                	beqz	a4,18c0 <memchr+0x20>
    18ac:	ce25                	beqz	a2,1924 <memchr+0x84>
    18ae:	0007c703          	lbu	a4,0(a5)
    18b2:	04b70e63          	beq	a4,a1,190e <memchr+0x6e>
    18b6:	0785                	addi	a5,a5,1
    18b8:	0077f713          	andi	a4,a5,7
    18bc:	167d                	addi	a2,a2,-1
    18be:	f77d                	bnez	a4,18ac <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18c0:	4501                	li	a0,0
    if (n && *s != c)
    18c2:	c235                	beqz	a2,1926 <memchr+0x86>
    18c4:	0007c703          	lbu	a4,0(a5)
    18c8:	04b70363          	beq	a4,a1,190e <memchr+0x6e>
        size_t k = ONES * c;
    18cc:	00000517          	auipc	a0,0x0
    18d0:	64c53503          	ld	a0,1612(a0) # 1f18 <__clone+0xba>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18d4:	471d                	li	a4,7
        size_t k = ONES * c;
    18d6:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18da:	02c77a63          	bgeu	a4,a2,190e <memchr+0x6e>
    18de:	00000897          	auipc	a7,0x0
    18e2:	62a8b883          	ld	a7,1578(a7) # 1f08 <__clone+0xaa>
    18e6:	00000817          	auipc	a6,0x0
    18ea:	62a83803          	ld	a6,1578(a6) # 1f10 <__clone+0xb2>
    18ee:	431d                	li	t1,7
    18f0:	a029                	j	18fa <memchr+0x5a>
    18f2:	1661                	addi	a2,a2,-8
    18f4:	07a1                	addi	a5,a5,8
    18f6:	02c37963          	bgeu	t1,a2,1928 <memchr+0x88>
    18fa:	6398                	ld	a4,0(a5)
    18fc:	8f29                	xor	a4,a4,a0
    18fe:	011706b3          	add	a3,a4,a7
    1902:	fff74713          	not	a4,a4
    1906:	8f75                	and	a4,a4,a3
    1908:	01077733          	and	a4,a4,a6
    190c:	d37d                	beqz	a4,18f2 <memchr+0x52>
    190e:	853e                	mv	a0,a5
    1910:	97b2                	add	a5,a5,a2
    1912:	a021                	j	191a <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1914:	0505                	addi	a0,a0,1
    1916:	00f50763          	beq	a0,a5,1924 <memchr+0x84>
    191a:	00054703          	lbu	a4,0(a0)
    191e:	feb71be3          	bne	a4,a1,1914 <memchr+0x74>
    1922:	8082                	ret
    return n ? (void *)s : 0;
    1924:	4501                	li	a0,0
}
    1926:	8082                	ret
    return n ? (void *)s : 0;
    1928:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    192a:	f275                	bnez	a2,190e <memchr+0x6e>
}
    192c:	8082                	ret

000000000000192e <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    192e:	1101                	addi	sp,sp,-32
    1930:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1932:	862e                	mv	a2,a1
{
    1934:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1936:	4581                	li	a1,0
{
    1938:	e426                	sd	s1,8(sp)
    193a:	ec06                	sd	ra,24(sp)
    193c:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    193e:	f63ff0ef          	jal	ra,18a0 <memchr>
    return p ? p - s : n;
    1942:	c519                	beqz	a0,1950 <strnlen+0x22>
}
    1944:	60e2                	ld	ra,24(sp)
    1946:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1948:	8d05                	sub	a0,a0,s1
}
    194a:	64a2                	ld	s1,8(sp)
    194c:	6105                	addi	sp,sp,32
    194e:	8082                	ret
    1950:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1952:	8522                	mv	a0,s0
}
    1954:	6442                	ld	s0,16(sp)
    1956:	64a2                	ld	s1,8(sp)
    1958:	6105                	addi	sp,sp,32
    195a:	8082                	ret

000000000000195c <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    195c:	00b547b3          	xor	a5,a0,a1
    1960:	8b9d                	andi	a5,a5,7
    1962:	eb95                	bnez	a5,1996 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1964:	0075f793          	andi	a5,a1,7
    1968:	e7b1                	bnez	a5,19b4 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    196a:	6198                	ld	a4,0(a1)
    196c:	00000617          	auipc	a2,0x0
    1970:	59c63603          	ld	a2,1436(a2) # 1f08 <__clone+0xaa>
    1974:	00000817          	auipc	a6,0x0
    1978:	59c83803          	ld	a6,1436(a6) # 1f10 <__clone+0xb2>
    197c:	a029                	j	1986 <strcpy+0x2a>
    197e:	e118                	sd	a4,0(a0)
    1980:	6598                	ld	a4,8(a1)
    1982:	05a1                	addi	a1,a1,8
    1984:	0521                	addi	a0,a0,8
    1986:	00c707b3          	add	a5,a4,a2
    198a:	fff74693          	not	a3,a4
    198e:	8ff5                	and	a5,a5,a3
    1990:	0107f7b3          	and	a5,a5,a6
    1994:	d7ed                	beqz	a5,197e <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1996:	0005c783          	lbu	a5,0(a1)
    199a:	00f50023          	sb	a5,0(a0)
    199e:	c785                	beqz	a5,19c6 <strcpy+0x6a>
    19a0:	0015c783          	lbu	a5,1(a1)
    19a4:	0505                	addi	a0,a0,1
    19a6:	0585                	addi	a1,a1,1
    19a8:	00f50023          	sb	a5,0(a0)
    19ac:	fbf5                	bnez	a5,19a0 <strcpy+0x44>
        ;
    return d;
}
    19ae:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19b0:	0505                	addi	a0,a0,1
    19b2:	df45                	beqz	a4,196a <strcpy+0xe>
            if (!(*d = *s))
    19b4:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19b8:	0585                	addi	a1,a1,1
    19ba:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    19be:	00f50023          	sb	a5,0(a0)
    19c2:	f7fd                	bnez	a5,19b0 <strcpy+0x54>
}
    19c4:	8082                	ret
    19c6:	8082                	ret

00000000000019c8 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19c8:	00b547b3          	xor	a5,a0,a1
    19cc:	8b9d                	andi	a5,a5,7
    19ce:	1a079863          	bnez	a5,1b7e <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19d2:	0075f793          	andi	a5,a1,7
    19d6:	16078463          	beqz	a5,1b3e <strncpy+0x176>
    19da:	ea01                	bnez	a2,19ea <strncpy+0x22>
    19dc:	a421                	j	1be4 <strncpy+0x21c>
    19de:	167d                	addi	a2,a2,-1
    19e0:	0505                	addi	a0,a0,1
    19e2:	14070e63          	beqz	a4,1b3e <strncpy+0x176>
    19e6:	1a060863          	beqz	a2,1b96 <strncpy+0x1ce>
    19ea:	0005c783          	lbu	a5,0(a1)
    19ee:	0585                	addi	a1,a1,1
    19f0:	0075f713          	andi	a4,a1,7
    19f4:	00f50023          	sb	a5,0(a0)
    19f8:	f3fd                	bnez	a5,19de <strncpy+0x16>
    19fa:	4805                	li	a6,1
    19fc:	1a061863          	bnez	a2,1bac <strncpy+0x1e4>
    1a00:	40a007b3          	neg	a5,a0
    1a04:	8b9d                	andi	a5,a5,7
    1a06:	4681                	li	a3,0
    1a08:	18061a63          	bnez	a2,1b9c <strncpy+0x1d4>
    1a0c:	00778713          	addi	a4,a5,7
    1a10:	45ad                	li	a1,11
    1a12:	18b76363          	bltu	a4,a1,1b98 <strncpy+0x1d0>
    1a16:	1ae6eb63          	bltu	a3,a4,1bcc <strncpy+0x204>
    1a1a:	1a078363          	beqz	a5,1bc0 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a1e:	00050023          	sb	zero,0(a0)
    1a22:	4685                	li	a3,1
    1a24:	00150713          	addi	a4,a0,1
    1a28:	18d78f63          	beq	a5,a3,1bc6 <strncpy+0x1fe>
    1a2c:	000500a3          	sb	zero,1(a0)
    1a30:	4689                	li	a3,2
    1a32:	00250713          	addi	a4,a0,2
    1a36:	18d78e63          	beq	a5,a3,1bd2 <strncpy+0x20a>
    1a3a:	00050123          	sb	zero,2(a0)
    1a3e:	468d                	li	a3,3
    1a40:	00350713          	addi	a4,a0,3
    1a44:	16d78c63          	beq	a5,a3,1bbc <strncpy+0x1f4>
    1a48:	000501a3          	sb	zero,3(a0)
    1a4c:	4691                	li	a3,4
    1a4e:	00450713          	addi	a4,a0,4
    1a52:	18d78263          	beq	a5,a3,1bd6 <strncpy+0x20e>
    1a56:	00050223          	sb	zero,4(a0)
    1a5a:	4695                	li	a3,5
    1a5c:	00550713          	addi	a4,a0,5
    1a60:	16d78d63          	beq	a5,a3,1bda <strncpy+0x212>
    1a64:	000502a3          	sb	zero,5(a0)
    1a68:	469d                	li	a3,7
    1a6a:	00650713          	addi	a4,a0,6
    1a6e:	16d79863          	bne	a5,a3,1bde <strncpy+0x216>
    1a72:	00750713          	addi	a4,a0,7
    1a76:	00050323          	sb	zero,6(a0)
    1a7a:	40f80833          	sub	a6,a6,a5
    1a7e:	ff887593          	andi	a1,a6,-8
    1a82:	97aa                	add	a5,a5,a0
    1a84:	95be                	add	a1,a1,a5
    1a86:	0007b023          	sd	zero,0(a5)
    1a8a:	07a1                	addi	a5,a5,8
    1a8c:	feb79de3          	bne	a5,a1,1a86 <strncpy+0xbe>
    1a90:	ff887593          	andi	a1,a6,-8
    1a94:	9ead                	addw	a3,a3,a1
    1a96:	00b707b3          	add	a5,a4,a1
    1a9a:	12b80863          	beq	a6,a1,1bca <strncpy+0x202>
    1a9e:	00078023          	sb	zero,0(a5)
    1aa2:	0016871b          	addiw	a4,a3,1
    1aa6:	0ec77863          	bgeu	a4,a2,1b96 <strncpy+0x1ce>
    1aaa:	000780a3          	sb	zero,1(a5)
    1aae:	0026871b          	addiw	a4,a3,2
    1ab2:	0ec77263          	bgeu	a4,a2,1b96 <strncpy+0x1ce>
    1ab6:	00078123          	sb	zero,2(a5)
    1aba:	0036871b          	addiw	a4,a3,3
    1abe:	0cc77c63          	bgeu	a4,a2,1b96 <strncpy+0x1ce>
    1ac2:	000781a3          	sb	zero,3(a5)
    1ac6:	0046871b          	addiw	a4,a3,4
    1aca:	0cc77663          	bgeu	a4,a2,1b96 <strncpy+0x1ce>
    1ace:	00078223          	sb	zero,4(a5)
    1ad2:	0056871b          	addiw	a4,a3,5
    1ad6:	0cc77063          	bgeu	a4,a2,1b96 <strncpy+0x1ce>
    1ada:	000782a3          	sb	zero,5(a5)
    1ade:	0066871b          	addiw	a4,a3,6
    1ae2:	0ac77a63          	bgeu	a4,a2,1b96 <strncpy+0x1ce>
    1ae6:	00078323          	sb	zero,6(a5)
    1aea:	0076871b          	addiw	a4,a3,7
    1aee:	0ac77463          	bgeu	a4,a2,1b96 <strncpy+0x1ce>
    1af2:	000783a3          	sb	zero,7(a5)
    1af6:	0086871b          	addiw	a4,a3,8
    1afa:	08c77e63          	bgeu	a4,a2,1b96 <strncpy+0x1ce>
    1afe:	00078423          	sb	zero,8(a5)
    1b02:	0096871b          	addiw	a4,a3,9
    1b06:	08c77863          	bgeu	a4,a2,1b96 <strncpy+0x1ce>
    1b0a:	000784a3          	sb	zero,9(a5)
    1b0e:	00a6871b          	addiw	a4,a3,10
    1b12:	08c77263          	bgeu	a4,a2,1b96 <strncpy+0x1ce>
    1b16:	00078523          	sb	zero,10(a5)
    1b1a:	00b6871b          	addiw	a4,a3,11
    1b1e:	06c77c63          	bgeu	a4,a2,1b96 <strncpy+0x1ce>
    1b22:	000785a3          	sb	zero,11(a5)
    1b26:	00c6871b          	addiw	a4,a3,12
    1b2a:	06c77663          	bgeu	a4,a2,1b96 <strncpy+0x1ce>
    1b2e:	00078623          	sb	zero,12(a5)
    1b32:	26b5                	addiw	a3,a3,13
    1b34:	06c6f163          	bgeu	a3,a2,1b96 <strncpy+0x1ce>
    1b38:	000786a3          	sb	zero,13(a5)
    1b3c:	8082                	ret
            ;
        if (!n || !*s)
    1b3e:	c645                	beqz	a2,1be6 <strncpy+0x21e>
    1b40:	0005c783          	lbu	a5,0(a1)
    1b44:	ea078be3          	beqz	a5,19fa <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b48:	479d                	li	a5,7
    1b4a:	02c7ff63          	bgeu	a5,a2,1b88 <strncpy+0x1c0>
    1b4e:	00000897          	auipc	a7,0x0
    1b52:	3ba8b883          	ld	a7,954(a7) # 1f08 <__clone+0xaa>
    1b56:	00000817          	auipc	a6,0x0
    1b5a:	3ba83803          	ld	a6,954(a6) # 1f10 <__clone+0xb2>
    1b5e:	431d                	li	t1,7
    1b60:	6198                	ld	a4,0(a1)
    1b62:	011707b3          	add	a5,a4,a7
    1b66:	fff74693          	not	a3,a4
    1b6a:	8ff5                	and	a5,a5,a3
    1b6c:	0107f7b3          	and	a5,a5,a6
    1b70:	ef81                	bnez	a5,1b88 <strncpy+0x1c0>
            *wd = *ws;
    1b72:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b74:	1661                	addi	a2,a2,-8
    1b76:	05a1                	addi	a1,a1,8
    1b78:	0521                	addi	a0,a0,8
    1b7a:	fec363e3          	bltu	t1,a2,1b60 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b7e:	e609                	bnez	a2,1b88 <strncpy+0x1c0>
    1b80:	a08d                	j	1be2 <strncpy+0x21a>
    1b82:	167d                	addi	a2,a2,-1
    1b84:	0505                	addi	a0,a0,1
    1b86:	ca01                	beqz	a2,1b96 <strncpy+0x1ce>
    1b88:	0005c783          	lbu	a5,0(a1)
    1b8c:	0585                	addi	a1,a1,1
    1b8e:	00f50023          	sb	a5,0(a0)
    1b92:	fbe5                	bnez	a5,1b82 <strncpy+0x1ba>
        ;
tail:
    1b94:	b59d                	j	19fa <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1b96:	8082                	ret
    1b98:	472d                	li	a4,11
    1b9a:	bdb5                	j	1a16 <strncpy+0x4e>
    1b9c:	00778713          	addi	a4,a5,7
    1ba0:	45ad                	li	a1,11
    1ba2:	fff60693          	addi	a3,a2,-1
    1ba6:	e6b778e3          	bgeu	a4,a1,1a16 <strncpy+0x4e>
    1baa:	b7fd                	j	1b98 <strncpy+0x1d0>
    1bac:	40a007b3          	neg	a5,a0
    1bb0:	8832                	mv	a6,a2
    1bb2:	8b9d                	andi	a5,a5,7
    1bb4:	4681                	li	a3,0
    1bb6:	e4060be3          	beqz	a2,1a0c <strncpy+0x44>
    1bba:	b7cd                	j	1b9c <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bbc:	468d                	li	a3,3
    1bbe:	bd75                	j	1a7a <strncpy+0xb2>
    1bc0:	872a                	mv	a4,a0
    1bc2:	4681                	li	a3,0
    1bc4:	bd5d                	j	1a7a <strncpy+0xb2>
    1bc6:	4685                	li	a3,1
    1bc8:	bd4d                	j	1a7a <strncpy+0xb2>
    1bca:	8082                	ret
    1bcc:	87aa                	mv	a5,a0
    1bce:	4681                	li	a3,0
    1bd0:	b5f9                	j	1a9e <strncpy+0xd6>
    1bd2:	4689                	li	a3,2
    1bd4:	b55d                	j	1a7a <strncpy+0xb2>
    1bd6:	4691                	li	a3,4
    1bd8:	b54d                	j	1a7a <strncpy+0xb2>
    1bda:	4695                	li	a3,5
    1bdc:	bd79                	j	1a7a <strncpy+0xb2>
    1bde:	4699                	li	a3,6
    1be0:	bd69                	j	1a7a <strncpy+0xb2>
    1be2:	8082                	ret
    1be4:	8082                	ret
    1be6:	8082                	ret

0000000000001be8 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1be8:	87aa                	mv	a5,a0
    1bea:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1bec:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1bf0:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1bf4:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1bf6:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bf8:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1bfc:	2501                	sext.w	a0,a0
    1bfe:	8082                	ret

0000000000001c00 <openat>:
    register long a7 __asm__("a7") = n;
    1c00:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c04:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c08:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c0c:	2501                	sext.w	a0,a0
    1c0e:	8082                	ret

0000000000001c10 <close>:
    register long a7 __asm__("a7") = n;
    1c10:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c14:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c18:	2501                	sext.w	a0,a0
    1c1a:	8082                	ret

0000000000001c1c <read>:
    register long a7 __asm__("a7") = n;
    1c1c:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c20:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c24:	8082                	ret

0000000000001c26 <write>:
    register long a7 __asm__("a7") = n;
    1c26:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c2a:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c2e:	8082                	ret

0000000000001c30 <getpid>:
    register long a7 __asm__("a7") = n;
    1c30:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c34:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c38:	2501                	sext.w	a0,a0
    1c3a:	8082                	ret

0000000000001c3c <getppid>:
    register long a7 __asm__("a7") = n;
    1c3c:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c40:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c44:	2501                	sext.w	a0,a0
    1c46:	8082                	ret

0000000000001c48 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c48:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c4c:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c50:	2501                	sext.w	a0,a0
    1c52:	8082                	ret

0000000000001c54 <fork>:
    register long a7 __asm__("a7") = n;
    1c54:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c58:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c5a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c5c:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c60:	2501                	sext.w	a0,a0
    1c62:	8082                	ret

0000000000001c64 <clone>:
// 子进程执行的执行的函数指针 | 函数参数 | 栈地址 | 栈的大小 | 标志位
pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c64:	85b2                	mv	a1,a2
    1c66:	863a                	mv	a2,a4
    if (stack)
    1c68:	c191                	beqz	a1,1c6c <clone+0x8>
	stack += stack_size;
    1c6a:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c6c:	4781                	li	a5,0
    1c6e:	4701                	li	a4,0
    1c70:	4681                	li	a3,0
    1c72:	2601                	sext.w	a2,a2
    1c74:	a2ed                	j	1e5e <__clone>

0000000000001c76 <exit>:
    register long a7 __asm__("a7") = n;
    1c76:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c7a:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c7e:	8082                	ret

0000000000001c80 <waitpid>:
    register long a7 __asm__("a7") = n;
    1c80:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c84:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c86:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c8a:	2501                	sext.w	a0,a0
    1c8c:	8082                	ret

0000000000001c8e <exec>:
    register long a7 __asm__("a7") = n;
    1c8e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1c92:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1c96:	2501                	sext.w	a0,a0
    1c98:	8082                	ret

0000000000001c9a <execve>:
    register long a7 __asm__("a7") = n;
    1c9a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c9e:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1ca2:	2501                	sext.w	a0,a0
    1ca4:	8082                	ret

0000000000001ca6 <times>:
    register long a7 __asm__("a7") = n;
    1ca6:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1caa:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cae:	2501                	sext.w	a0,a0
    1cb0:	8082                	ret

0000000000001cb2 <get_time>:

int64 get_time()
{
    1cb2:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cb4:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cb8:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cba:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cbc:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cc0:	2501                	sext.w	a0,a0
    1cc2:	ed09                	bnez	a0,1cdc <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cc4:	67a2                	ld	a5,8(sp)
    1cc6:	3e800713          	li	a4,1000
    1cca:	00015503          	lhu	a0,0(sp)
    1cce:	02e7d7b3          	divu	a5,a5,a4
    1cd2:	02e50533          	mul	a0,a0,a4
    1cd6:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1cd8:	0141                	addi	sp,sp,16
    1cda:	8082                	ret
        return -1;
    1cdc:	557d                	li	a0,-1
    1cde:	bfed                	j	1cd8 <get_time+0x26>

0000000000001ce0 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1ce0:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ce4:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1ce8:	2501                	sext.w	a0,a0
    1cea:	8082                	ret

0000000000001cec <time>:
    register long a7 __asm__("a7") = n;
    1cec:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1cf0:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1cf4:	2501                	sext.w	a0,a0
    1cf6:	8082                	ret

0000000000001cf8 <sleep>:

int sleep(unsigned long long time)
{
    1cf8:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1cfa:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1cfc:	850a                	mv	a0,sp
    1cfe:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d00:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d04:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d06:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d0a:	e501                	bnez	a0,1d12 <sleep+0x1a>
    return 0;
    1d0c:	4501                	li	a0,0
}
    1d0e:	0141                	addi	sp,sp,16
    1d10:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d12:	4502                	lw	a0,0(sp)
}
    1d14:	0141                	addi	sp,sp,16
    1d16:	8082                	ret

0000000000001d18 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d18:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d1c:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d20:	2501                	sext.w	a0,a0
    1d22:	8082                	ret

0000000000001d24 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d24:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d28:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d2c:	8082                	ret

0000000000001d2e <munmap>:
    register long a7 __asm__("a7") = n;
    1d2e:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d32:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d36:	2501                	sext.w	a0,a0
    1d38:	8082                	ret

0000000000001d3a <wait>:

int wait(int *code)
{
    1d3a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d3c:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d40:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d42:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d44:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d46:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d4a:	2501                	sext.w	a0,a0
    1d4c:	8082                	ret

0000000000001d4e <spawn>:
    register long a7 __asm__("a7") = n;
    1d4e:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d52:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d56:	2501                	sext.w	a0,a0
    1d58:	8082                	ret

0000000000001d5a <mailread>:
    register long a7 __asm__("a7") = n;
    1d5a:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d5e:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d62:	2501                	sext.w	a0,a0
    1d64:	8082                	ret

0000000000001d66 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d66:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d6a:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d6e:	2501                	sext.w	a0,a0
    1d70:	8082                	ret

0000000000001d72 <fstat>:
    register long a7 __asm__("a7") = n;
    1d72:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d76:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d7a:	2501                	sext.w	a0,a0
    1d7c:	8082                	ret

0000000000001d7e <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d7e:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d80:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d84:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d86:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d8a:	2501                	sext.w	a0,a0
    1d8c:	8082                	ret

0000000000001d8e <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1d8e:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d90:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1d94:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d96:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1d9a:	2501                	sext.w	a0,a0
    1d9c:	8082                	ret

0000000000001d9e <link>:

int link(char *old_path, char *new_path)
{
    1d9e:	87aa                	mv	a5,a0
    1da0:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1da2:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1da6:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1daa:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dac:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1db0:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1db2:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1db6:	2501                	sext.w	a0,a0
    1db8:	8082                	ret

0000000000001dba <unlink>:

int unlink(char *path)
{
    1dba:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dbc:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1dc0:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1dc4:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc6:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <uname>:
    register long a7 __asm__("a7") = n;
    1dce:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1dd2:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <brk>:
    register long a7 __asm__("a7") = n;
    1dda:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1dde:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1de2:	2501                	sext.w	a0,a0
    1de4:	8082                	ret

0000000000001de6 <getcwd>:
    register long a7 __asm__("a7") = n;
    1de6:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de8:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1dec:	8082                	ret

0000000000001dee <chdir>:
    register long a7 __asm__("a7") = n;
    1dee:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1df2:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1df6:	2501                	sext.w	a0,a0
    1df8:	8082                	ret

0000000000001dfa <mkdir>:

int mkdir(const char *path, mode_t mode){
    1dfa:	862e                	mv	a2,a1
    1dfc:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1dfe:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e00:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e04:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e08:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e0a:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e0c:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <getdents>:
    register long a7 __asm__("a7") = n;
    1e14:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e18:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <pipe>:
    register long a7 __asm__("a7") = n;
    1e20:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e24:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e26:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	8082                	ret

0000000000001e2e <dup>:
    register long a7 __asm__("a7") = n;
    1e2e:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e30:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <dup2>:
    register long a7 __asm__("a7") = n;
    1e38:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e3a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e3c:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <mount>:
    register long a7 __asm__("a7") = n;
    1e44:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e48:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e4c:	2501                	sext.w	a0,a0
    1e4e:	8082                	ret

0000000000001e50 <umount>:
    register long a7 __asm__("a7") = n;
    1e50:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e54:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e56:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e5a:	2501                	sext.w	a0,a0
    1e5c:	8082                	ret

0000000000001e5e <__clone>:
.global __clone
.type  __clone, %function
# 函数指针 | 栈地址 | 标志位
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e5e:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e60:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e62:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e64:	8532                	mv	a0,a2
	mv a2, a4
    1e66:	863a                	mv	a2,a4
	mv a3, a5
    1e68:	86be                	mv	a3,a5
	mv a4, a6
    1e6a:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e6c:	0dc00893          	li	a7,220
	ecall
    1e70:	00000073          	ecall

	beqz a0, 1f
    1e74:	c111                	beqz	a0,1e78 <__clone+0x1a>
	# Parent
	ret
    1e76:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e78:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e7a:	6522                	ld	a0,8(sp)
	jalr a1
    1e7c:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e7e:	05d00893          	li	a7,93
	ecall
    1e82:	00000073          	ecall
