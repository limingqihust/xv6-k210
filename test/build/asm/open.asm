
/home/lmq/lmq/cscc/xv6-k210/test/build/riscv64/open:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a84d                	j	10b4 <__start_main>

0000000000001004 <test_open>:
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

void test_open() {
    1004:	716d                	addi	sp,sp,-272
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	e7a50513          	addi	a0,a0,-390 # 1e80 <__clone+0x2a>
void test_open() {
    100e:	e606                	sd	ra,264(sp)
    1010:	e222                	sd	s0,256(sp)
	TEST_START(__func__);
    1012:	2a0000ef          	jal	ra,12b2 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	ef250513          	addi	a0,a0,-270 # 1f08 <__func__.1165>
    101e:	294000ef          	jal	ra,12b2 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	e7650513          	addi	a0,a0,-394 # 1e98 <__clone+0x42>
    102a:	288000ef          	jal	ra,12b2 <puts>
	// O_RDONLY = 0, O_WRONLY = 1
	int fd = open("./text.txt", 0);
    102e:	4581                	li	a1,0
    1030:	00001517          	auipc	a0,0x1
    1034:	e7850513          	addi	a0,a0,-392 # 1ea8 <__clone+0x52>
    1038:	3a9000ef          	jal	ra,1be0 <open>
    103c:	842a                	mv	s0,a0
	assert(fd >= 0);
    103e:	04054c63          	bltz	a0,1096 <test_open+0x92>
	char buf[256];
	int size = read(fd, buf, 256);
    1042:	858a                	mv	a1,sp
    1044:	10000613          	li	a2,256
    1048:	8522                	mv	a0,s0
    104a:	3cb000ef          	jal	ra,1c14 <read>
    104e:	0005061b          	sext.w	a2,a0
	if (size < 0) {
		size = 0;
	}
	write(STDOUT, buf, size);
    1052:	fff64513          	not	a0,a2
    1056:	957d                	srai	a0,a0,0x3f
    1058:	8e69                	and	a2,a2,a0
    105a:	858a                	mv	a1,sp
    105c:	2601                	sext.w	a2,a2
    105e:	4505                	li	a0,1
    1060:	3bf000ef          	jal	ra,1c1e <write>
	close(fd);
    1064:	8522                	mv	a0,s0
    1066:	3a3000ef          	jal	ra,1c08 <close>
	TEST_END(__func__);
    106a:	00001517          	auipc	a0,0x1
    106e:	e6e50513          	addi	a0,a0,-402 # 1ed8 <__clone+0x82>
    1072:	240000ef          	jal	ra,12b2 <puts>
    1076:	00001517          	auipc	a0,0x1
    107a:	e9250513          	addi	a0,a0,-366 # 1f08 <__func__.1165>
    107e:	234000ef          	jal	ra,12b2 <puts>
    1082:	00001517          	auipc	a0,0x1
    1086:	e1650513          	addi	a0,a0,-490 # 1e98 <__clone+0x42>
    108a:	228000ef          	jal	ra,12b2 <puts>
}
    108e:	60b2                	ld	ra,264(sp)
    1090:	6412                	ld	s0,256(sp)
    1092:	6151                	addi	sp,sp,272
    1094:	8082                	ret
	assert(fd >= 0);
    1096:	00001517          	auipc	a0,0x1
    109a:	e2250513          	addi	a0,a0,-478 # 1eb8 <__clone+0x62>
    109e:	4be000ef          	jal	ra,155c <panic>
    10a2:	b745                	j	1042 <test_open+0x3e>

00000000000010a4 <main>:

int main(void) {
    10a4:	1141                	addi	sp,sp,-16
    10a6:	e406                	sd	ra,8(sp)
	test_open();
    10a8:	f5dff0ef          	jal	ra,1004 <test_open>
	return 0;
}
    10ac:	60a2                	ld	ra,8(sp)
    10ae:	4501                	li	a0,0
    10b0:	0141                	addi	sp,sp,16
    10b2:	8082                	ret

00000000000010b4 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10b4:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10b6:	4108                	lw	a0,0(a0)
{
    10b8:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10ba:	05a1                	addi	a1,a1,8
{
    10bc:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10be:	fe7ff0ef          	jal	ra,10a4 <main>
    10c2:	3ad000ef          	jal	ra,1c6e <exit>
	return 0;
}
    10c6:	60a2                	ld	ra,8(sp)
    10c8:	4501                	li	a0,0
    10ca:	0141                	addi	sp,sp,16
    10cc:	8082                	ret

00000000000010ce <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10ce:	7179                	addi	sp,sp,-48
    10d0:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10d2:	12054b63          	bltz	a0,1208 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10d6:	02b577bb          	remuw	a5,a0,a1
    10da:	00001697          	auipc	a3,0x1
    10de:	e3e68693          	addi	a3,a3,-450 # 1f18 <digits>
    buf[16] = 0;
    10e2:	00010c23          	sb	zero,24(sp)
    i = 15;
    10e6:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    10ea:	1782                	slli	a5,a5,0x20
    10ec:	9381                	srli	a5,a5,0x20
    10ee:	97b6                	add	a5,a5,a3
    10f0:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10f4:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10f8:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10fc:	16b56263          	bltu	a0,a1,1260 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1100:	02e8763b          	remuw	a2,a6,a4
    1104:	1602                	slli	a2,a2,0x20
    1106:	9201                	srli	a2,a2,0x20
    1108:	9636                	add	a2,a2,a3
    110a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    110e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1112:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1116:	12e86963          	bltu	a6,a4,1248 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    111a:	02e5f63b          	remuw	a2,a1,a4
    111e:	1602                	slli	a2,a2,0x20
    1120:	9201                	srli	a2,a2,0x20
    1122:	9636                	add	a2,a2,a3
    1124:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1128:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    112c:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1130:	10e5ef63          	bltu	a1,a4,124e <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1134:	02e8763b          	remuw	a2,a6,a4
    1138:	1602                	slli	a2,a2,0x20
    113a:	9201                	srli	a2,a2,0x20
    113c:	9636                	add	a2,a2,a3
    113e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1142:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1146:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    114a:	10e86563          	bltu	a6,a4,1254 <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    114e:	02e5f63b          	remuw	a2,a1,a4
    1152:	1602                	slli	a2,a2,0x20
    1154:	9201                	srli	a2,a2,0x20
    1156:	9636                	add	a2,a2,a3
    1158:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115c:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1160:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1164:	0ee5eb63          	bltu	a1,a4,125a <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    1168:	02e8763b          	remuw	a2,a6,a4
    116c:	1602                	slli	a2,a2,0x20
    116e:	9201                	srli	a2,a2,0x20
    1170:	9636                	add	a2,a2,a3
    1172:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1176:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    117a:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    117e:	0ce86263          	bltu	a6,a4,1242 <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    1182:	02e5f63b          	remuw	a2,a1,a4
    1186:	1602                	slli	a2,a2,0x20
    1188:	9201                	srli	a2,a2,0x20
    118a:	9636                	add	a2,a2,a3
    118c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1190:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1194:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1198:	0ce5e663          	bltu	a1,a4,1264 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    119c:	02e8763b          	remuw	a2,a6,a4
    11a0:	1602                	slli	a2,a2,0x20
    11a2:	9201                	srli	a2,a2,0x20
    11a4:	9636                	add	a2,a2,a3
    11a6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11aa:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11ae:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11b2:	0ae86c63          	bltu	a6,a4,126a <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    11b6:	02e5f63b          	remuw	a2,a1,a4
    11ba:	1602                	slli	a2,a2,0x20
    11bc:	9201                	srli	a2,a2,0x20
    11be:	9636                	add	a2,a2,a3
    11c0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c4:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11c8:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11cc:	0ae5e263          	bltu	a1,a4,1270 <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    11d0:	1782                	slli	a5,a5,0x20
    11d2:	9381                	srli	a5,a5,0x20
    11d4:	97b6                	add	a5,a5,a3
    11d6:	0007c703          	lbu	a4,0(a5)
    11da:	4599                	li	a1,6
    11dc:	4795                	li	a5,5
    11de:	00e10723          	sb	a4,14(sp)

    if (sign)
    11e2:	00055963          	bgez	a0,11f4 <printint.constprop.0+0x126>
        buf[i--] = '-';
    11e6:	1018                	addi	a4,sp,32
    11e8:	973e                	add	a4,a4,a5
    11ea:	02d00693          	li	a3,45
    11ee:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    11f2:	85be                	mv	a1,a5
    write(f, s, l);
    11f4:	003c                	addi	a5,sp,8
    11f6:	4641                	li	a2,16
    11f8:	9e0d                	subw	a2,a2,a1
    11fa:	4505                	li	a0,1
    11fc:	95be                	add	a1,a1,a5
    11fe:	221000ef          	jal	ra,1c1e <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1202:	70a2                	ld	ra,40(sp)
    1204:	6145                	addi	sp,sp,48
    1206:	8082                	ret
        x = -xx;
    1208:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    120c:	02b677bb          	remuw	a5,a2,a1
    1210:	00001697          	auipc	a3,0x1
    1214:	d0868693          	addi	a3,a3,-760 # 1f18 <digits>
    buf[16] = 0;
    1218:	00010c23          	sb	zero,24(sp)
    i = 15;
    121c:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    1220:	1782                	slli	a5,a5,0x20
    1222:	9381                	srli	a5,a5,0x20
    1224:	97b6                	add	a5,a5,a3
    1226:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    122a:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    122e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1232:	ecb677e3          	bgeu	a2,a1,1100 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1236:	02d00793          	li	a5,45
    123a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    123e:	45b9                	li	a1,14
    1240:	bf55                	j	11f4 <printint.constprop.0+0x126>
    1242:	47a5                	li	a5,9
    1244:	45a9                	li	a1,10
    1246:	bf71                	j	11e2 <printint.constprop.0+0x114>
    1248:	47b5                	li	a5,13
    124a:	45b9                	li	a1,14
    124c:	bf59                	j	11e2 <printint.constprop.0+0x114>
    124e:	47b1                	li	a5,12
    1250:	45b5                	li	a1,13
    1252:	bf41                	j	11e2 <printint.constprop.0+0x114>
    1254:	47ad                	li	a5,11
    1256:	45b1                	li	a1,12
    1258:	b769                	j	11e2 <printint.constprop.0+0x114>
    125a:	47a9                	li	a5,10
    125c:	45ad                	li	a1,11
    125e:	b751                	j	11e2 <printint.constprop.0+0x114>
    i = 15;
    1260:	45bd                	li	a1,15
    1262:	bf49                	j	11f4 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1264:	47a1                	li	a5,8
    1266:	45a5                	li	a1,9
    1268:	bfad                	j	11e2 <printint.constprop.0+0x114>
    126a:	479d                	li	a5,7
    126c:	45a1                	li	a1,8
    126e:	bf95                	j	11e2 <printint.constprop.0+0x114>
    1270:	4799                	li	a5,6
    1272:	459d                	li	a1,7
    1274:	b7bd                	j	11e2 <printint.constprop.0+0x114>

0000000000001276 <getchar>:
{
    1276:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1278:	00f10593          	addi	a1,sp,15
    127c:	4605                	li	a2,1
    127e:	4501                	li	a0,0
{
    1280:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1282:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1286:	18f000ef          	jal	ra,1c14 <read>
}
    128a:	60e2                	ld	ra,24(sp)
    128c:	00f14503          	lbu	a0,15(sp)
    1290:	6105                	addi	sp,sp,32
    1292:	8082                	ret

0000000000001294 <putchar>:
{
    1294:	1101                	addi	sp,sp,-32
    1296:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1298:	00f10593          	addi	a1,sp,15
    129c:	4605                	li	a2,1
    129e:	4505                	li	a0,1
{
    12a0:	ec06                	sd	ra,24(sp)
    char byte = c;
    12a2:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12a6:	179000ef          	jal	ra,1c1e <write>
}
    12aa:	60e2                	ld	ra,24(sp)
    12ac:	2501                	sext.w	a0,a0
    12ae:	6105                	addi	sp,sp,32
    12b0:	8082                	ret

00000000000012b2 <puts>:
{
    12b2:	1141                	addi	sp,sp,-16
    12b4:	e406                	sd	ra,8(sp)
    12b6:	e022                	sd	s0,0(sp)
    12b8:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12ba:	580000ef          	jal	ra,183a <strlen>
    12be:	862a                	mv	a2,a0
    12c0:	85a2                	mv	a1,s0
    12c2:	4505                	li	a0,1
    12c4:	15b000ef          	jal	ra,1c1e <write>
}
    12c8:	60a2                	ld	ra,8(sp)
    12ca:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12cc:	957d                	srai	a0,a0,0x3f
    return r;
    12ce:	2501                	sext.w	a0,a0
}
    12d0:	0141                	addi	sp,sp,16
    12d2:	8082                	ret

00000000000012d4 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12d4:	7171                	addi	sp,sp,-176
    12d6:	fc56                	sd	s5,56(sp)
    12d8:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    12da:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12dc:	18bc                	addi	a5,sp,120
{
    12de:	e8ca                	sd	s2,80(sp)
    12e0:	e4ce                	sd	s3,72(sp)
    12e2:	e0d2                	sd	s4,64(sp)
    12e4:	f85a                	sd	s6,48(sp)
    12e6:	f486                	sd	ra,104(sp)
    12e8:	f0a2                	sd	s0,96(sp)
    12ea:	eca6                	sd	s1,88(sp)
    12ec:	fcae                	sd	a1,120(sp)
    12ee:	e132                	sd	a2,128(sp)
    12f0:	e536                	sd	a3,136(sp)
    12f2:	e93a                	sd	a4,144(sp)
    12f4:	f142                	sd	a6,160(sp)
    12f6:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    12f8:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12fa:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    12fe:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1302:	00001b17          	auipc	s6,0x1
    1306:	be6b0b13          	addi	s6,s6,-1050 # 1ee8 <__clone+0x92>
    buf[i++] = '0';
    130a:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    130e:	00001997          	auipc	s3,0x1
    1312:	c0a98993          	addi	s3,s3,-1014 # 1f18 <digits>
        if (!*s)
    1316:	00054783          	lbu	a5,0(a0)
    131a:	16078a63          	beqz	a5,148e <printf+0x1ba>
    131e:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1320:	19278163          	beq	a5,s2,14a2 <printf+0x1ce>
    1324:	00164783          	lbu	a5,1(a2)
    1328:	0605                	addi	a2,a2,1
    132a:	fbfd                	bnez	a5,1320 <printf+0x4c>
    132c:	84b2                	mv	s1,a2
        l = z - a;
    132e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1332:	85aa                	mv	a1,a0
    1334:	8622                	mv	a2,s0
    1336:	4505                	li	a0,1
    1338:	0e7000ef          	jal	ra,1c1e <write>
        if (l)
    133c:	18041c63          	bnez	s0,14d4 <printf+0x200>
        if (s[1] == 0)
    1340:	0014c783          	lbu	a5,1(s1)
    1344:	14078563          	beqz	a5,148e <printf+0x1ba>
        switch (s[1])
    1348:	1d478063          	beq	a5,s4,1508 <printf+0x234>
    134c:	18fa6663          	bltu	s4,a5,14d8 <printf+0x204>
    1350:	06400713          	li	a4,100
    1354:	1ae78063          	beq	a5,a4,14f4 <printf+0x220>
    1358:	07000713          	li	a4,112
    135c:	1ce79963          	bne	a5,a4,152e <printf+0x25a>
            printptr(va_arg(ap, uint64));
    1360:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1362:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1366:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1368:	631c                	ld	a5,0(a4)
    136a:	0721                	addi	a4,a4,8
    136c:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    136e:	00479293          	slli	t0,a5,0x4
    1372:	00879f93          	slli	t6,a5,0x8
    1376:	00c79f13          	slli	t5,a5,0xc
    137a:	01079e93          	slli	t4,a5,0x10
    137e:	01479e13          	slli	t3,a5,0x14
    1382:	01879313          	slli	t1,a5,0x18
    1386:	01c79893          	slli	a7,a5,0x1c
    138a:	02479813          	slli	a6,a5,0x24
    138e:	02879513          	slli	a0,a5,0x28
    1392:	02c79593          	slli	a1,a5,0x2c
    1396:	03079693          	slli	a3,a5,0x30
    139a:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    139e:	03c7d413          	srli	s0,a5,0x3c
    13a2:	01c7d39b          	srliw	t2,a5,0x1c
    13a6:	03c2d293          	srli	t0,t0,0x3c
    13aa:	03cfdf93          	srli	t6,t6,0x3c
    13ae:	03cf5f13          	srli	t5,t5,0x3c
    13b2:	03cede93          	srli	t4,t4,0x3c
    13b6:	03ce5e13          	srli	t3,t3,0x3c
    13ba:	03c35313          	srli	t1,t1,0x3c
    13be:	03c8d893          	srli	a7,a7,0x3c
    13c2:	03c85813          	srli	a6,a6,0x3c
    13c6:	9171                	srli	a0,a0,0x3c
    13c8:	91f1                	srli	a1,a1,0x3c
    13ca:	92f1                	srli	a3,a3,0x3c
    13cc:	9371                	srli	a4,a4,0x3c
    13ce:	96ce                	add	a3,a3,s3
    13d0:	974e                	add	a4,a4,s3
    13d2:	944e                	add	s0,s0,s3
    13d4:	92ce                	add	t0,t0,s3
    13d6:	9fce                	add	t6,t6,s3
    13d8:	9f4e                	add	t5,t5,s3
    13da:	9ece                	add	t4,t4,s3
    13dc:	9e4e                	add	t3,t3,s3
    13de:	934e                	add	t1,t1,s3
    13e0:	98ce                	add	a7,a7,s3
    13e2:	93ce                	add	t2,t2,s3
    13e4:	984e                	add	a6,a6,s3
    13e6:	954e                	add	a0,a0,s3
    13e8:	95ce                	add	a1,a1,s3
    13ea:	0006c083          	lbu	ra,0(a3)
    13ee:	0002c283          	lbu	t0,0(t0)
    13f2:	00074683          	lbu	a3,0(a4)
    13f6:	000fcf83          	lbu	t6,0(t6)
    13fa:	000f4f03          	lbu	t5,0(t5)
    13fe:	000ece83          	lbu	t4,0(t4)
    1402:	000e4e03          	lbu	t3,0(t3)
    1406:	00034303          	lbu	t1,0(t1)
    140a:	0008c883          	lbu	a7,0(a7)
    140e:	0003c383          	lbu	t2,0(t2)
    1412:	00084803          	lbu	a6,0(a6)
    1416:	00054503          	lbu	a0,0(a0)
    141a:	0005c583          	lbu	a1,0(a1)
    141e:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1422:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1426:	9371                	srli	a4,a4,0x3c
    1428:	8bbd                	andi	a5,a5,15
    142a:	974e                	add	a4,a4,s3
    142c:	97ce                	add	a5,a5,s3
    142e:	005105a3          	sb	t0,11(sp)
    1432:	01f10623          	sb	t6,12(sp)
    1436:	01e106a3          	sb	t5,13(sp)
    143a:	01d10723          	sb	t4,14(sp)
    143e:	01c107a3          	sb	t3,15(sp)
    1442:	00610823          	sb	t1,16(sp)
    1446:	011108a3          	sb	a7,17(sp)
    144a:	00710923          	sb	t2,18(sp)
    144e:	010109a3          	sb	a6,19(sp)
    1452:	00a10a23          	sb	a0,20(sp)
    1456:	00b10aa3          	sb	a1,21(sp)
    145a:	00110b23          	sb	ra,22(sp)
    145e:	00d10ba3          	sb	a3,23(sp)
    1462:	00810523          	sb	s0,10(sp)
    1466:	00074703          	lbu	a4,0(a4)
    146a:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    146e:	002c                	addi	a1,sp,8
    1470:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1472:	00e10c23          	sb	a4,24(sp)
    1476:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    147a:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    147e:	7a0000ef          	jal	ra,1c1e <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1482:	00248513          	addi	a0,s1,2
        if (!*s)
    1486:	00054783          	lbu	a5,0(a0)
    148a:	e8079ae3          	bnez	a5,131e <printf+0x4a>
    }
    va_end(ap);
}
    148e:	70a6                	ld	ra,104(sp)
    1490:	7406                	ld	s0,96(sp)
    1492:	64e6                	ld	s1,88(sp)
    1494:	6946                	ld	s2,80(sp)
    1496:	69a6                	ld	s3,72(sp)
    1498:	6a06                	ld	s4,64(sp)
    149a:	7ae2                	ld	s5,56(sp)
    149c:	7b42                	ld	s6,48(sp)
    149e:	614d                	addi	sp,sp,176
    14a0:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14a2:	00064783          	lbu	a5,0(a2)
    14a6:	84b2                	mv	s1,a2
    14a8:	01278963          	beq	a5,s2,14ba <printf+0x1e6>
    14ac:	b549                	j	132e <printf+0x5a>
    14ae:	0024c783          	lbu	a5,2(s1)
    14b2:	0605                	addi	a2,a2,1
    14b4:	0489                	addi	s1,s1,2
    14b6:	e7279ce3          	bne	a5,s2,132e <printf+0x5a>
    14ba:	0014c783          	lbu	a5,1(s1)
    14be:	ff2788e3          	beq	a5,s2,14ae <printf+0x1da>
        l = z - a;
    14c2:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14c6:	85aa                	mv	a1,a0
    14c8:	8622                	mv	a2,s0
    14ca:	4505                	li	a0,1
    14cc:	752000ef          	jal	ra,1c1e <write>
        if (l)
    14d0:	e60408e3          	beqz	s0,1340 <printf+0x6c>
    14d4:	8526                	mv	a0,s1
    14d6:	b581                	j	1316 <printf+0x42>
        switch (s[1])
    14d8:	07800713          	li	a4,120
    14dc:	04e79963          	bne	a5,a4,152e <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    14e0:	6782                	ld	a5,0(sp)
    14e2:	45c1                	li	a1,16
    14e4:	4388                	lw	a0,0(a5)
    14e6:	07a1                	addi	a5,a5,8
    14e8:	e03e                	sd	a5,0(sp)
    14ea:	be5ff0ef          	jal	ra,10ce <printint.constprop.0>
        s += 2;
    14ee:	00248513          	addi	a0,s1,2
    14f2:	bf51                	j	1486 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    14f4:	6782                	ld	a5,0(sp)
    14f6:	45a9                	li	a1,10
    14f8:	4388                	lw	a0,0(a5)
    14fa:	07a1                	addi	a5,a5,8
    14fc:	e03e                	sd	a5,0(sp)
    14fe:	bd1ff0ef          	jal	ra,10ce <printint.constprop.0>
        s += 2;
    1502:	00248513          	addi	a0,s1,2
    1506:	b741                	j	1486 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1508:	6782                	ld	a5,0(sp)
    150a:	6380                	ld	s0,0(a5)
    150c:	07a1                	addi	a5,a5,8
    150e:	e03e                	sd	a5,0(sp)
    1510:	c421                	beqz	s0,1558 <printf+0x284>
            l = strnlen(a, 200);
    1512:	0c800593          	li	a1,200
    1516:	8522                	mv	a0,s0
    1518:	40e000ef          	jal	ra,1926 <strnlen>
    write(f, s, l);
    151c:	0005061b          	sext.w	a2,a0
    1520:	85a2                	mv	a1,s0
    1522:	4505                	li	a0,1
    1524:	6fa000ef          	jal	ra,1c1e <write>
        s += 2;
    1528:	00248513          	addi	a0,s1,2
    152c:	bfa9                	j	1486 <printf+0x1b2>
    char byte = c;
    152e:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1532:	4605                	li	a2,1
    1534:	002c                	addi	a1,sp,8
    1536:	4505                	li	a0,1
    char byte = c;
    1538:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    153c:	6e2000ef          	jal	ra,1c1e <write>
    char byte = c;
    1540:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1544:	4605                	li	a2,1
    1546:	002c                	addi	a1,sp,8
    1548:	4505                	li	a0,1
    char byte = c;
    154a:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    154e:	6d0000ef          	jal	ra,1c1e <write>
        s += 2;
    1552:	00248513          	addi	a0,s1,2
    1556:	bf05                	j	1486 <printf+0x1b2>
                a = "(null)";
    1558:	845a                	mv	s0,s6
    155a:	bf65                	j	1512 <printf+0x23e>

000000000000155c <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    155c:	1141                	addi	sp,sp,-16
    155e:	e406                	sd	ra,8(sp)
    puts(m);
    1560:	d53ff0ef          	jal	ra,12b2 <puts>
    exit(-100);
}
    1564:	60a2                	ld	ra,8(sp)
    exit(-100);
    1566:	f9c00513          	li	a0,-100
}
    156a:	0141                	addi	sp,sp,16
    exit(-100);
    156c:	a709                	j	1c6e <exit>

000000000000156e <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    156e:	02000793          	li	a5,32
    1572:	00f50663          	beq	a0,a5,157e <isspace+0x10>
    1576:	355d                	addiw	a0,a0,-9
    1578:	00553513          	sltiu	a0,a0,5
    157c:	8082                	ret
    157e:	4505                	li	a0,1
}
    1580:	8082                	ret

0000000000001582 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1582:	fd05051b          	addiw	a0,a0,-48
}
    1586:	00a53513          	sltiu	a0,a0,10
    158a:	8082                	ret

000000000000158c <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    158c:	02000613          	li	a2,32
    1590:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1592:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1596:	ff77069b          	addiw	a3,a4,-9
    159a:	04c70d63          	beq	a4,a2,15f4 <atoi+0x68>
    159e:	0007079b          	sext.w	a5,a4
    15a2:	04d5f963          	bgeu	a1,a3,15f4 <atoi+0x68>
        s++;
    switch (*s)
    15a6:	02b00693          	li	a3,43
    15aa:	04d70a63          	beq	a4,a3,15fe <atoi+0x72>
    15ae:	02d00693          	li	a3,45
    15b2:	06d70463          	beq	a4,a3,161a <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15b6:	fd07859b          	addiw	a1,a5,-48
    15ba:	4625                	li	a2,9
    15bc:	873e                	mv	a4,a5
    15be:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15c0:	4e01                	li	t3,0
    while (isdigit(*s))
    15c2:	04b66a63          	bltu	a2,a1,1616 <atoi+0x8a>
    int n = 0, neg = 0;
    15c6:	4501                	li	a0,0
    while (isdigit(*s))
    15c8:	4825                	li	a6,9
    15ca:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    15ce:	0025179b          	slliw	a5,a0,0x2
    15d2:	9d3d                	addw	a0,a0,a5
    15d4:	fd07031b          	addiw	t1,a4,-48
    15d8:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15dc:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15e0:	0685                	addi	a3,a3,1
    15e2:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15e6:	0006071b          	sext.w	a4,a2
    15ea:	feb870e3          	bgeu	a6,a1,15ca <atoi+0x3e>
    return neg ? n : -n;
    15ee:	000e0563          	beqz	t3,15f8 <atoi+0x6c>
}
    15f2:	8082                	ret
        s++;
    15f4:	0505                	addi	a0,a0,1
    15f6:	bf71                	j	1592 <atoi+0x6>
    15f8:	4113053b          	subw	a0,t1,a7
    15fc:	8082                	ret
    while (isdigit(*s))
    15fe:	00154783          	lbu	a5,1(a0)
    1602:	4625                	li	a2,9
        s++;
    1604:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1608:	fd07859b          	addiw	a1,a5,-48
    160c:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1610:	4e01                	li	t3,0
    while (isdigit(*s))
    1612:	fab67ae3          	bgeu	a2,a1,15c6 <atoi+0x3a>
    1616:	4501                	li	a0,0
}
    1618:	8082                	ret
    while (isdigit(*s))
    161a:	00154783          	lbu	a5,1(a0)
    161e:	4625                	li	a2,9
        s++;
    1620:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1624:	fd07859b          	addiw	a1,a5,-48
    1628:	0007871b          	sext.w	a4,a5
    162c:	feb665e3          	bltu	a2,a1,1616 <atoi+0x8a>
        neg = 1;
    1630:	4e05                	li	t3,1
    1632:	bf51                	j	15c6 <atoi+0x3a>

0000000000001634 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1634:	16060d63          	beqz	a2,17ae <memset+0x17a>
    1638:	40a007b3          	neg	a5,a0
    163c:	8b9d                	andi	a5,a5,7
    163e:	00778713          	addi	a4,a5,7
    1642:	482d                	li	a6,11
    1644:	0ff5f593          	andi	a1,a1,255
    1648:	fff60693          	addi	a3,a2,-1
    164c:	17076263          	bltu	a4,a6,17b0 <memset+0x17c>
    1650:	16e6ea63          	bltu	a3,a4,17c4 <memset+0x190>
    1654:	16078563          	beqz	a5,17be <memset+0x18a>
    1658:	00b50023          	sb	a1,0(a0)
    165c:	4705                	li	a4,1
    165e:	00150e93          	addi	t4,a0,1
    1662:	14e78c63          	beq	a5,a4,17ba <memset+0x186>
    1666:	00b500a3          	sb	a1,1(a0)
    166a:	4709                	li	a4,2
    166c:	00250e93          	addi	t4,a0,2
    1670:	14e78d63          	beq	a5,a4,17ca <memset+0x196>
    1674:	00b50123          	sb	a1,2(a0)
    1678:	470d                	li	a4,3
    167a:	00350e93          	addi	t4,a0,3
    167e:	12e78b63          	beq	a5,a4,17b4 <memset+0x180>
    1682:	00b501a3          	sb	a1,3(a0)
    1686:	4711                	li	a4,4
    1688:	00450e93          	addi	t4,a0,4
    168c:	14e78163          	beq	a5,a4,17ce <memset+0x19a>
    1690:	00b50223          	sb	a1,4(a0)
    1694:	4715                	li	a4,5
    1696:	00550e93          	addi	t4,a0,5
    169a:	12e78c63          	beq	a5,a4,17d2 <memset+0x19e>
    169e:	00b502a3          	sb	a1,5(a0)
    16a2:	471d                	li	a4,7
    16a4:	00650e93          	addi	t4,a0,6
    16a8:	12e79763          	bne	a5,a4,17d6 <memset+0x1a2>
    16ac:	00750e93          	addi	t4,a0,7
    16b0:	00b50323          	sb	a1,6(a0)
    16b4:	4f1d                	li	t5,7
    16b6:	00859713          	slli	a4,a1,0x8
    16ba:	8f4d                	or	a4,a4,a1
    16bc:	01059e13          	slli	t3,a1,0x10
    16c0:	01c76e33          	or	t3,a4,t3
    16c4:	01859313          	slli	t1,a1,0x18
    16c8:	006e6333          	or	t1,t3,t1
    16cc:	02059893          	slli	a7,a1,0x20
    16d0:	011368b3          	or	a7,t1,a7
    16d4:	02859813          	slli	a6,a1,0x28
    16d8:	40f60333          	sub	t1,a2,a5
    16dc:	0108e833          	or	a6,a7,a6
    16e0:	03059693          	slli	a3,a1,0x30
    16e4:	00d866b3          	or	a3,a6,a3
    16e8:	03859713          	slli	a4,a1,0x38
    16ec:	97aa                	add	a5,a5,a0
    16ee:	ff837813          	andi	a6,t1,-8
    16f2:	8f55                	or	a4,a4,a3
    16f4:	00f806b3          	add	a3,a6,a5
    16f8:	e398                	sd	a4,0(a5)
    16fa:	07a1                	addi	a5,a5,8
    16fc:	fed79ee3          	bne	a5,a3,16f8 <memset+0xc4>
    1700:	ff837693          	andi	a3,t1,-8
    1704:	00de87b3          	add	a5,t4,a3
    1708:	01e6873b          	addw	a4,a3,t5
    170c:	0ad30663          	beq	t1,a3,17b8 <memset+0x184>
    1710:	00b78023          	sb	a1,0(a5)
    1714:	0017069b          	addiw	a3,a4,1
    1718:	08c6fb63          	bgeu	a3,a2,17ae <memset+0x17a>
    171c:	00b780a3          	sb	a1,1(a5)
    1720:	0027069b          	addiw	a3,a4,2
    1724:	08c6f563          	bgeu	a3,a2,17ae <memset+0x17a>
    1728:	00b78123          	sb	a1,2(a5)
    172c:	0037069b          	addiw	a3,a4,3
    1730:	06c6ff63          	bgeu	a3,a2,17ae <memset+0x17a>
    1734:	00b781a3          	sb	a1,3(a5)
    1738:	0047069b          	addiw	a3,a4,4
    173c:	06c6f963          	bgeu	a3,a2,17ae <memset+0x17a>
    1740:	00b78223          	sb	a1,4(a5)
    1744:	0057069b          	addiw	a3,a4,5
    1748:	06c6f363          	bgeu	a3,a2,17ae <memset+0x17a>
    174c:	00b782a3          	sb	a1,5(a5)
    1750:	0067069b          	addiw	a3,a4,6
    1754:	04c6fd63          	bgeu	a3,a2,17ae <memset+0x17a>
    1758:	00b78323          	sb	a1,6(a5)
    175c:	0077069b          	addiw	a3,a4,7
    1760:	04c6f763          	bgeu	a3,a2,17ae <memset+0x17a>
    1764:	00b783a3          	sb	a1,7(a5)
    1768:	0087069b          	addiw	a3,a4,8
    176c:	04c6f163          	bgeu	a3,a2,17ae <memset+0x17a>
    1770:	00b78423          	sb	a1,8(a5)
    1774:	0097069b          	addiw	a3,a4,9
    1778:	02c6fb63          	bgeu	a3,a2,17ae <memset+0x17a>
    177c:	00b784a3          	sb	a1,9(a5)
    1780:	00a7069b          	addiw	a3,a4,10
    1784:	02c6f563          	bgeu	a3,a2,17ae <memset+0x17a>
    1788:	00b78523          	sb	a1,10(a5)
    178c:	00b7069b          	addiw	a3,a4,11
    1790:	00c6ff63          	bgeu	a3,a2,17ae <memset+0x17a>
    1794:	00b785a3          	sb	a1,11(a5)
    1798:	00c7069b          	addiw	a3,a4,12
    179c:	00c6f963          	bgeu	a3,a2,17ae <memset+0x17a>
    17a0:	00b78623          	sb	a1,12(a5)
    17a4:	2735                	addiw	a4,a4,13
    17a6:	00c77463          	bgeu	a4,a2,17ae <memset+0x17a>
    17aa:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17ae:	8082                	ret
    17b0:	472d                	li	a4,11
    17b2:	bd79                	j	1650 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17b4:	4f0d                	li	t5,3
    17b6:	b701                	j	16b6 <memset+0x82>
    17b8:	8082                	ret
    17ba:	4f05                	li	t5,1
    17bc:	bded                	j	16b6 <memset+0x82>
    17be:	8eaa                	mv	t4,a0
    17c0:	4f01                	li	t5,0
    17c2:	bdd5                	j	16b6 <memset+0x82>
    17c4:	87aa                	mv	a5,a0
    17c6:	4701                	li	a4,0
    17c8:	b7a1                	j	1710 <memset+0xdc>
    17ca:	4f09                	li	t5,2
    17cc:	b5ed                	j	16b6 <memset+0x82>
    17ce:	4f11                	li	t5,4
    17d0:	b5dd                	j	16b6 <memset+0x82>
    17d2:	4f15                	li	t5,5
    17d4:	b5cd                	j	16b6 <memset+0x82>
    17d6:	4f19                	li	t5,6
    17d8:	bdf9                	j	16b6 <memset+0x82>

00000000000017da <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17da:	00054783          	lbu	a5,0(a0)
    17de:	0005c703          	lbu	a4,0(a1)
    17e2:	00e79863          	bne	a5,a4,17f2 <strcmp+0x18>
    17e6:	0505                	addi	a0,a0,1
    17e8:	0585                	addi	a1,a1,1
    17ea:	fbe5                	bnez	a5,17da <strcmp>
    17ec:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17ee:	9d19                	subw	a0,a0,a4
    17f0:	8082                	ret
    17f2:	0007851b          	sext.w	a0,a5
    17f6:	bfe5                	j	17ee <strcmp+0x14>

00000000000017f8 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17f8:	ce05                	beqz	a2,1830 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17fa:	00054703          	lbu	a4,0(a0)
    17fe:	0005c783          	lbu	a5,0(a1)
    1802:	cb0d                	beqz	a4,1834 <strncmp+0x3c>
    if (!n--)
    1804:	167d                	addi	a2,a2,-1
    1806:	00c506b3          	add	a3,a0,a2
    180a:	a819                	j	1820 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    180c:	00a68e63          	beq	a3,a0,1828 <strncmp+0x30>
    1810:	0505                	addi	a0,a0,1
    1812:	00e79b63          	bne	a5,a4,1828 <strncmp+0x30>
    1816:	00054703          	lbu	a4,0(a0)
    181a:	0005c783          	lbu	a5,0(a1)
    181e:	cb19                	beqz	a4,1834 <strncmp+0x3c>
    1820:	0005c783          	lbu	a5,0(a1)
    1824:	0585                	addi	a1,a1,1
    1826:	f3fd                	bnez	a5,180c <strncmp+0x14>
        ;
    return *l - *r;
    1828:	0007051b          	sext.w	a0,a4
    182c:	9d1d                	subw	a0,a0,a5
    182e:	8082                	ret
        return 0;
    1830:	4501                	li	a0,0
}
    1832:	8082                	ret
    1834:	4501                	li	a0,0
    return *l - *r;
    1836:	9d1d                	subw	a0,a0,a5
    1838:	8082                	ret

000000000000183a <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    183a:	00757793          	andi	a5,a0,7
    183e:	cf89                	beqz	a5,1858 <strlen+0x1e>
    1840:	87aa                	mv	a5,a0
    1842:	a029                	j	184c <strlen+0x12>
    1844:	0785                	addi	a5,a5,1
    1846:	0077f713          	andi	a4,a5,7
    184a:	cb01                	beqz	a4,185a <strlen+0x20>
        if (!*s)
    184c:	0007c703          	lbu	a4,0(a5)
    1850:	fb75                	bnez	a4,1844 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1852:	40a78533          	sub	a0,a5,a0
}
    1856:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1858:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    185a:	6394                	ld	a3,0(a5)
    185c:	00000597          	auipc	a1,0x0
    1860:	6945b583          	ld	a1,1684(a1) # 1ef0 <__clone+0x9a>
    1864:	00000617          	auipc	a2,0x0
    1868:	69463603          	ld	a2,1684(a2) # 1ef8 <__clone+0xa2>
    186c:	a019                	j	1872 <strlen+0x38>
    186e:	6794                	ld	a3,8(a5)
    1870:	07a1                	addi	a5,a5,8
    1872:	00b68733          	add	a4,a3,a1
    1876:	fff6c693          	not	a3,a3
    187a:	8f75                	and	a4,a4,a3
    187c:	8f71                	and	a4,a4,a2
    187e:	db65                	beqz	a4,186e <strlen+0x34>
    for (; *s; s++)
    1880:	0007c703          	lbu	a4,0(a5)
    1884:	d779                	beqz	a4,1852 <strlen+0x18>
    1886:	0017c703          	lbu	a4,1(a5)
    188a:	0785                	addi	a5,a5,1
    188c:	d379                	beqz	a4,1852 <strlen+0x18>
    188e:	0017c703          	lbu	a4,1(a5)
    1892:	0785                	addi	a5,a5,1
    1894:	fb6d                	bnez	a4,1886 <strlen+0x4c>
    1896:	bf75                	j	1852 <strlen+0x18>

0000000000001898 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1898:	00757713          	andi	a4,a0,7
{
    189c:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    189e:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18a2:	cb19                	beqz	a4,18b8 <memchr+0x20>
    18a4:	ce25                	beqz	a2,191c <memchr+0x84>
    18a6:	0007c703          	lbu	a4,0(a5)
    18aa:	04b70e63          	beq	a4,a1,1906 <memchr+0x6e>
    18ae:	0785                	addi	a5,a5,1
    18b0:	0077f713          	andi	a4,a5,7
    18b4:	167d                	addi	a2,a2,-1
    18b6:	f77d                	bnez	a4,18a4 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18b8:	4501                	li	a0,0
    if (n && *s != c)
    18ba:	c235                	beqz	a2,191e <memchr+0x86>
    18bc:	0007c703          	lbu	a4,0(a5)
    18c0:	04b70363          	beq	a4,a1,1906 <memchr+0x6e>
        size_t k = ONES * c;
    18c4:	00000517          	auipc	a0,0x0
    18c8:	63c53503          	ld	a0,1596(a0) # 1f00 <__clone+0xaa>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18cc:	471d                	li	a4,7
        size_t k = ONES * c;
    18ce:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18d2:	02c77a63          	bgeu	a4,a2,1906 <memchr+0x6e>
    18d6:	00000897          	auipc	a7,0x0
    18da:	61a8b883          	ld	a7,1562(a7) # 1ef0 <__clone+0x9a>
    18de:	00000817          	auipc	a6,0x0
    18e2:	61a83803          	ld	a6,1562(a6) # 1ef8 <__clone+0xa2>
    18e6:	431d                	li	t1,7
    18e8:	a029                	j	18f2 <memchr+0x5a>
    18ea:	1661                	addi	a2,a2,-8
    18ec:	07a1                	addi	a5,a5,8
    18ee:	02c37963          	bgeu	t1,a2,1920 <memchr+0x88>
    18f2:	6398                	ld	a4,0(a5)
    18f4:	8f29                	xor	a4,a4,a0
    18f6:	011706b3          	add	a3,a4,a7
    18fa:	fff74713          	not	a4,a4
    18fe:	8f75                	and	a4,a4,a3
    1900:	01077733          	and	a4,a4,a6
    1904:	d37d                	beqz	a4,18ea <memchr+0x52>
    1906:	853e                	mv	a0,a5
    1908:	97b2                	add	a5,a5,a2
    190a:	a021                	j	1912 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    190c:	0505                	addi	a0,a0,1
    190e:	00f50763          	beq	a0,a5,191c <memchr+0x84>
    1912:	00054703          	lbu	a4,0(a0)
    1916:	feb71be3          	bne	a4,a1,190c <memchr+0x74>
    191a:	8082                	ret
    return n ? (void *)s : 0;
    191c:	4501                	li	a0,0
}
    191e:	8082                	ret
    return n ? (void *)s : 0;
    1920:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1922:	f275                	bnez	a2,1906 <memchr+0x6e>
}
    1924:	8082                	ret

0000000000001926 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1926:	1101                	addi	sp,sp,-32
    1928:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    192a:	862e                	mv	a2,a1
{
    192c:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    192e:	4581                	li	a1,0
{
    1930:	e426                	sd	s1,8(sp)
    1932:	ec06                	sd	ra,24(sp)
    1934:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1936:	f63ff0ef          	jal	ra,1898 <memchr>
    return p ? p - s : n;
    193a:	c519                	beqz	a0,1948 <strnlen+0x22>
}
    193c:	60e2                	ld	ra,24(sp)
    193e:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1940:	8d05                	sub	a0,a0,s1
}
    1942:	64a2                	ld	s1,8(sp)
    1944:	6105                	addi	sp,sp,32
    1946:	8082                	ret
    1948:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    194a:	8522                	mv	a0,s0
}
    194c:	6442                	ld	s0,16(sp)
    194e:	64a2                	ld	s1,8(sp)
    1950:	6105                	addi	sp,sp,32
    1952:	8082                	ret

0000000000001954 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1954:	00b547b3          	xor	a5,a0,a1
    1958:	8b9d                	andi	a5,a5,7
    195a:	eb95                	bnez	a5,198e <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    195c:	0075f793          	andi	a5,a1,7
    1960:	e7b1                	bnez	a5,19ac <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1962:	6198                	ld	a4,0(a1)
    1964:	00000617          	auipc	a2,0x0
    1968:	58c63603          	ld	a2,1420(a2) # 1ef0 <__clone+0x9a>
    196c:	00000817          	auipc	a6,0x0
    1970:	58c83803          	ld	a6,1420(a6) # 1ef8 <__clone+0xa2>
    1974:	a029                	j	197e <strcpy+0x2a>
    1976:	e118                	sd	a4,0(a0)
    1978:	6598                	ld	a4,8(a1)
    197a:	05a1                	addi	a1,a1,8
    197c:	0521                	addi	a0,a0,8
    197e:	00c707b3          	add	a5,a4,a2
    1982:	fff74693          	not	a3,a4
    1986:	8ff5                	and	a5,a5,a3
    1988:	0107f7b3          	and	a5,a5,a6
    198c:	d7ed                	beqz	a5,1976 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    198e:	0005c783          	lbu	a5,0(a1)
    1992:	00f50023          	sb	a5,0(a0)
    1996:	c785                	beqz	a5,19be <strcpy+0x6a>
    1998:	0015c783          	lbu	a5,1(a1)
    199c:	0505                	addi	a0,a0,1
    199e:	0585                	addi	a1,a1,1
    19a0:	00f50023          	sb	a5,0(a0)
    19a4:	fbf5                	bnez	a5,1998 <strcpy+0x44>
        ;
    return d;
}
    19a6:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19a8:	0505                	addi	a0,a0,1
    19aa:	df45                	beqz	a4,1962 <strcpy+0xe>
            if (!(*d = *s))
    19ac:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19b0:	0585                	addi	a1,a1,1
    19b2:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    19b6:	00f50023          	sb	a5,0(a0)
    19ba:	f7fd                	bnez	a5,19a8 <strcpy+0x54>
}
    19bc:	8082                	ret
    19be:	8082                	ret

00000000000019c0 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19c0:	00b547b3          	xor	a5,a0,a1
    19c4:	8b9d                	andi	a5,a5,7
    19c6:	1a079863          	bnez	a5,1b76 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19ca:	0075f793          	andi	a5,a1,7
    19ce:	16078463          	beqz	a5,1b36 <strncpy+0x176>
    19d2:	ea01                	bnez	a2,19e2 <strncpy+0x22>
    19d4:	a421                	j	1bdc <strncpy+0x21c>
    19d6:	167d                	addi	a2,a2,-1
    19d8:	0505                	addi	a0,a0,1
    19da:	14070e63          	beqz	a4,1b36 <strncpy+0x176>
    19de:	1a060863          	beqz	a2,1b8e <strncpy+0x1ce>
    19e2:	0005c783          	lbu	a5,0(a1)
    19e6:	0585                	addi	a1,a1,1
    19e8:	0075f713          	andi	a4,a1,7
    19ec:	00f50023          	sb	a5,0(a0)
    19f0:	f3fd                	bnez	a5,19d6 <strncpy+0x16>
    19f2:	4805                	li	a6,1
    19f4:	1a061863          	bnez	a2,1ba4 <strncpy+0x1e4>
    19f8:	40a007b3          	neg	a5,a0
    19fc:	8b9d                	andi	a5,a5,7
    19fe:	4681                	li	a3,0
    1a00:	18061a63          	bnez	a2,1b94 <strncpy+0x1d4>
    1a04:	00778713          	addi	a4,a5,7
    1a08:	45ad                	li	a1,11
    1a0a:	18b76363          	bltu	a4,a1,1b90 <strncpy+0x1d0>
    1a0e:	1ae6eb63          	bltu	a3,a4,1bc4 <strncpy+0x204>
    1a12:	1a078363          	beqz	a5,1bb8 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a16:	00050023          	sb	zero,0(a0)
    1a1a:	4685                	li	a3,1
    1a1c:	00150713          	addi	a4,a0,1
    1a20:	18d78f63          	beq	a5,a3,1bbe <strncpy+0x1fe>
    1a24:	000500a3          	sb	zero,1(a0)
    1a28:	4689                	li	a3,2
    1a2a:	00250713          	addi	a4,a0,2
    1a2e:	18d78e63          	beq	a5,a3,1bca <strncpy+0x20a>
    1a32:	00050123          	sb	zero,2(a0)
    1a36:	468d                	li	a3,3
    1a38:	00350713          	addi	a4,a0,3
    1a3c:	16d78c63          	beq	a5,a3,1bb4 <strncpy+0x1f4>
    1a40:	000501a3          	sb	zero,3(a0)
    1a44:	4691                	li	a3,4
    1a46:	00450713          	addi	a4,a0,4
    1a4a:	18d78263          	beq	a5,a3,1bce <strncpy+0x20e>
    1a4e:	00050223          	sb	zero,4(a0)
    1a52:	4695                	li	a3,5
    1a54:	00550713          	addi	a4,a0,5
    1a58:	16d78d63          	beq	a5,a3,1bd2 <strncpy+0x212>
    1a5c:	000502a3          	sb	zero,5(a0)
    1a60:	469d                	li	a3,7
    1a62:	00650713          	addi	a4,a0,6
    1a66:	16d79863          	bne	a5,a3,1bd6 <strncpy+0x216>
    1a6a:	00750713          	addi	a4,a0,7
    1a6e:	00050323          	sb	zero,6(a0)
    1a72:	40f80833          	sub	a6,a6,a5
    1a76:	ff887593          	andi	a1,a6,-8
    1a7a:	97aa                	add	a5,a5,a0
    1a7c:	95be                	add	a1,a1,a5
    1a7e:	0007b023          	sd	zero,0(a5)
    1a82:	07a1                	addi	a5,a5,8
    1a84:	feb79de3          	bne	a5,a1,1a7e <strncpy+0xbe>
    1a88:	ff887593          	andi	a1,a6,-8
    1a8c:	9ead                	addw	a3,a3,a1
    1a8e:	00b707b3          	add	a5,a4,a1
    1a92:	12b80863          	beq	a6,a1,1bc2 <strncpy+0x202>
    1a96:	00078023          	sb	zero,0(a5)
    1a9a:	0016871b          	addiw	a4,a3,1
    1a9e:	0ec77863          	bgeu	a4,a2,1b8e <strncpy+0x1ce>
    1aa2:	000780a3          	sb	zero,1(a5)
    1aa6:	0026871b          	addiw	a4,a3,2
    1aaa:	0ec77263          	bgeu	a4,a2,1b8e <strncpy+0x1ce>
    1aae:	00078123          	sb	zero,2(a5)
    1ab2:	0036871b          	addiw	a4,a3,3
    1ab6:	0cc77c63          	bgeu	a4,a2,1b8e <strncpy+0x1ce>
    1aba:	000781a3          	sb	zero,3(a5)
    1abe:	0046871b          	addiw	a4,a3,4
    1ac2:	0cc77663          	bgeu	a4,a2,1b8e <strncpy+0x1ce>
    1ac6:	00078223          	sb	zero,4(a5)
    1aca:	0056871b          	addiw	a4,a3,5
    1ace:	0cc77063          	bgeu	a4,a2,1b8e <strncpy+0x1ce>
    1ad2:	000782a3          	sb	zero,5(a5)
    1ad6:	0066871b          	addiw	a4,a3,6
    1ada:	0ac77a63          	bgeu	a4,a2,1b8e <strncpy+0x1ce>
    1ade:	00078323          	sb	zero,6(a5)
    1ae2:	0076871b          	addiw	a4,a3,7
    1ae6:	0ac77463          	bgeu	a4,a2,1b8e <strncpy+0x1ce>
    1aea:	000783a3          	sb	zero,7(a5)
    1aee:	0086871b          	addiw	a4,a3,8
    1af2:	08c77e63          	bgeu	a4,a2,1b8e <strncpy+0x1ce>
    1af6:	00078423          	sb	zero,8(a5)
    1afa:	0096871b          	addiw	a4,a3,9
    1afe:	08c77863          	bgeu	a4,a2,1b8e <strncpy+0x1ce>
    1b02:	000784a3          	sb	zero,9(a5)
    1b06:	00a6871b          	addiw	a4,a3,10
    1b0a:	08c77263          	bgeu	a4,a2,1b8e <strncpy+0x1ce>
    1b0e:	00078523          	sb	zero,10(a5)
    1b12:	00b6871b          	addiw	a4,a3,11
    1b16:	06c77c63          	bgeu	a4,a2,1b8e <strncpy+0x1ce>
    1b1a:	000785a3          	sb	zero,11(a5)
    1b1e:	00c6871b          	addiw	a4,a3,12
    1b22:	06c77663          	bgeu	a4,a2,1b8e <strncpy+0x1ce>
    1b26:	00078623          	sb	zero,12(a5)
    1b2a:	26b5                	addiw	a3,a3,13
    1b2c:	06c6f163          	bgeu	a3,a2,1b8e <strncpy+0x1ce>
    1b30:	000786a3          	sb	zero,13(a5)
    1b34:	8082                	ret
            ;
        if (!n || !*s)
    1b36:	c645                	beqz	a2,1bde <strncpy+0x21e>
    1b38:	0005c783          	lbu	a5,0(a1)
    1b3c:	ea078be3          	beqz	a5,19f2 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b40:	479d                	li	a5,7
    1b42:	02c7ff63          	bgeu	a5,a2,1b80 <strncpy+0x1c0>
    1b46:	00000897          	auipc	a7,0x0
    1b4a:	3aa8b883          	ld	a7,938(a7) # 1ef0 <__clone+0x9a>
    1b4e:	00000817          	auipc	a6,0x0
    1b52:	3aa83803          	ld	a6,938(a6) # 1ef8 <__clone+0xa2>
    1b56:	431d                	li	t1,7
    1b58:	6198                	ld	a4,0(a1)
    1b5a:	011707b3          	add	a5,a4,a7
    1b5e:	fff74693          	not	a3,a4
    1b62:	8ff5                	and	a5,a5,a3
    1b64:	0107f7b3          	and	a5,a5,a6
    1b68:	ef81                	bnez	a5,1b80 <strncpy+0x1c0>
            *wd = *ws;
    1b6a:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b6c:	1661                	addi	a2,a2,-8
    1b6e:	05a1                	addi	a1,a1,8
    1b70:	0521                	addi	a0,a0,8
    1b72:	fec363e3          	bltu	t1,a2,1b58 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b76:	e609                	bnez	a2,1b80 <strncpy+0x1c0>
    1b78:	a08d                	j	1bda <strncpy+0x21a>
    1b7a:	167d                	addi	a2,a2,-1
    1b7c:	0505                	addi	a0,a0,1
    1b7e:	ca01                	beqz	a2,1b8e <strncpy+0x1ce>
    1b80:	0005c783          	lbu	a5,0(a1)
    1b84:	0585                	addi	a1,a1,1
    1b86:	00f50023          	sb	a5,0(a0)
    1b8a:	fbe5                	bnez	a5,1b7a <strncpy+0x1ba>
        ;
tail:
    1b8c:	b59d                	j	19f2 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1b8e:	8082                	ret
    1b90:	472d                	li	a4,11
    1b92:	bdb5                	j	1a0e <strncpy+0x4e>
    1b94:	00778713          	addi	a4,a5,7
    1b98:	45ad                	li	a1,11
    1b9a:	fff60693          	addi	a3,a2,-1
    1b9e:	e6b778e3          	bgeu	a4,a1,1a0e <strncpy+0x4e>
    1ba2:	b7fd                	j	1b90 <strncpy+0x1d0>
    1ba4:	40a007b3          	neg	a5,a0
    1ba8:	8832                	mv	a6,a2
    1baa:	8b9d                	andi	a5,a5,7
    1bac:	4681                	li	a3,0
    1bae:	e4060be3          	beqz	a2,1a04 <strncpy+0x44>
    1bb2:	b7cd                	j	1b94 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bb4:	468d                	li	a3,3
    1bb6:	bd75                	j	1a72 <strncpy+0xb2>
    1bb8:	872a                	mv	a4,a0
    1bba:	4681                	li	a3,0
    1bbc:	bd5d                	j	1a72 <strncpy+0xb2>
    1bbe:	4685                	li	a3,1
    1bc0:	bd4d                	j	1a72 <strncpy+0xb2>
    1bc2:	8082                	ret
    1bc4:	87aa                	mv	a5,a0
    1bc6:	4681                	li	a3,0
    1bc8:	b5f9                	j	1a96 <strncpy+0xd6>
    1bca:	4689                	li	a3,2
    1bcc:	b55d                	j	1a72 <strncpy+0xb2>
    1bce:	4691                	li	a3,4
    1bd0:	b54d                	j	1a72 <strncpy+0xb2>
    1bd2:	4695                	li	a3,5
    1bd4:	bd79                	j	1a72 <strncpy+0xb2>
    1bd6:	4699                	li	a3,6
    1bd8:	bd69                	j	1a72 <strncpy+0xb2>
    1bda:	8082                	ret
    1bdc:	8082                	ret
    1bde:	8082                	ret

0000000000001be0 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1be0:	87aa                	mv	a5,a0
    1be2:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1be4:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1be8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1bec:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1bee:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bf0:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1bf4:	2501                	sext.w	a0,a0
    1bf6:	8082                	ret

0000000000001bf8 <openat>:
    register long a7 __asm__("a7") = n;
    1bf8:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1bfc:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c00:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c04:	2501                	sext.w	a0,a0
    1c06:	8082                	ret

0000000000001c08 <close>:
    register long a7 __asm__("a7") = n;
    1c08:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c0c:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c10:	2501                	sext.w	a0,a0
    1c12:	8082                	ret

0000000000001c14 <read>:
    register long a7 __asm__("a7") = n;
    1c14:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c18:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c1c:	8082                	ret

0000000000001c1e <write>:
    register long a7 __asm__("a7") = n;
    1c1e:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c22:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c26:	8082                	ret

0000000000001c28 <getpid>:
    register long a7 __asm__("a7") = n;
    1c28:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c2c:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c30:	2501                	sext.w	a0,a0
    1c32:	8082                	ret

0000000000001c34 <getppid>:
    register long a7 __asm__("a7") = n;
    1c34:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c38:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c3c:	2501                	sext.w	a0,a0
    1c3e:	8082                	ret

0000000000001c40 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c40:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c44:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c48:	2501                	sext.w	a0,a0
    1c4a:	8082                	ret

0000000000001c4c <fork>:
    register long a7 __asm__("a7") = n;
    1c4c:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c50:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c52:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c54:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c58:	2501                	sext.w	a0,a0
    1c5a:	8082                	ret

0000000000001c5c <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c5c:	85b2                	mv	a1,a2
    1c5e:	863a                	mv	a2,a4
    if (stack)
    1c60:	c191                	beqz	a1,1c64 <clone+0x8>
	stack += stack_size;
    1c62:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c64:	4781                	li	a5,0
    1c66:	4701                	li	a4,0
    1c68:	4681                	li	a3,0
    1c6a:	2601                	sext.w	a2,a2
    1c6c:	a2ed                	j	1e56 <__clone>

0000000000001c6e <exit>:
    register long a7 __asm__("a7") = n;
    1c6e:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c72:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c76:	8082                	ret

0000000000001c78 <waitpid>:
    register long a7 __asm__("a7") = n;
    1c78:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c7c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c7e:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c82:	2501                	sext.w	a0,a0
    1c84:	8082                	ret

0000000000001c86 <exec>:
    register long a7 __asm__("a7") = n;
    1c86:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1c8a:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1c8e:	2501                	sext.w	a0,a0
    1c90:	8082                	ret

0000000000001c92 <execve>:
    register long a7 __asm__("a7") = n;
    1c92:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c96:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1c9a:	2501                	sext.w	a0,a0
    1c9c:	8082                	ret

0000000000001c9e <times>:
    register long a7 __asm__("a7") = n;
    1c9e:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1ca2:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1ca6:	2501                	sext.w	a0,a0
    1ca8:	8082                	ret

0000000000001caa <get_time>:

int64 get_time()
{
    1caa:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cac:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cb0:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cb2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cb4:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cb8:	2501                	sext.w	a0,a0
    1cba:	ed09                	bnez	a0,1cd4 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cbc:	67a2                	ld	a5,8(sp)
    1cbe:	3e800713          	li	a4,1000
    1cc2:	00015503          	lhu	a0,0(sp)
    1cc6:	02e7d7b3          	divu	a5,a5,a4
    1cca:	02e50533          	mul	a0,a0,a4
    1cce:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1cd0:	0141                	addi	sp,sp,16
    1cd2:	8082                	ret
        return -1;
    1cd4:	557d                	li	a0,-1
    1cd6:	bfed                	j	1cd0 <get_time+0x26>

0000000000001cd8 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1cd8:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cdc:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1ce0:	2501                	sext.w	a0,a0
    1ce2:	8082                	ret

0000000000001ce4 <time>:
    register long a7 __asm__("a7") = n;
    1ce4:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1ce8:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1cec:	2501                	sext.w	a0,a0
    1cee:	8082                	ret

0000000000001cf0 <sleep>:

int sleep(unsigned long long time)
{
    1cf0:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1cf2:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1cf4:	850a                	mv	a0,sp
    1cf6:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1cf8:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1cfc:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cfe:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d02:	e501                	bnez	a0,1d0a <sleep+0x1a>
    return 0;
    1d04:	4501                	li	a0,0
}
    1d06:	0141                	addi	sp,sp,16
    1d08:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d0a:	4502                	lw	a0,0(sp)
}
    1d0c:	0141                	addi	sp,sp,16
    1d0e:	8082                	ret

0000000000001d10 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d10:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d14:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d18:	2501                	sext.w	a0,a0
    1d1a:	8082                	ret

0000000000001d1c <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d1c:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d20:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d24:	8082                	ret

0000000000001d26 <munmap>:
    register long a7 __asm__("a7") = n;
    1d26:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d2a:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d2e:	2501                	sext.w	a0,a0
    1d30:	8082                	ret

0000000000001d32 <wait>:

int wait(int *code)
{
    1d32:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d34:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d38:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d3a:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d3c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d3e:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d42:	2501                	sext.w	a0,a0
    1d44:	8082                	ret

0000000000001d46 <spawn>:
    register long a7 __asm__("a7") = n;
    1d46:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d4a:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d4e:	2501                	sext.w	a0,a0
    1d50:	8082                	ret

0000000000001d52 <mailread>:
    register long a7 __asm__("a7") = n;
    1d52:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d56:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d5a:	2501                	sext.w	a0,a0
    1d5c:	8082                	ret

0000000000001d5e <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d5e:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d62:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d66:	2501                	sext.w	a0,a0
    1d68:	8082                	ret

0000000000001d6a <fstat>:
    register long a7 __asm__("a7") = n;
    1d6a:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d6e:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d72:	2501                	sext.w	a0,a0
    1d74:	8082                	ret

0000000000001d76 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d76:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d78:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d7c:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d7e:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d82:	2501                	sext.w	a0,a0
    1d84:	8082                	ret

0000000000001d86 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1d86:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d88:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1d8c:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d8e:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1d92:	2501                	sext.w	a0,a0
    1d94:	8082                	ret

0000000000001d96 <link>:

int link(char *old_path, char *new_path)
{
    1d96:	87aa                	mv	a5,a0
    1d98:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1d9a:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1d9e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1da2:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1da4:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1da8:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1daa:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1dae:	2501                	sext.w	a0,a0
    1db0:	8082                	ret

0000000000001db2 <unlink>:

int unlink(char *path)
{
    1db2:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1db4:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1db8:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1dbc:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dbe:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1dc2:	2501                	sext.w	a0,a0
    1dc4:	8082                	ret

0000000000001dc6 <uname>:
    register long a7 __asm__("a7") = n;
    1dc6:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1dca:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1dce:	2501                	sext.w	a0,a0
    1dd0:	8082                	ret

0000000000001dd2 <brk>:
    register long a7 __asm__("a7") = n;
    1dd2:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1dd6:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1dda:	2501                	sext.w	a0,a0
    1ddc:	8082                	ret

0000000000001dde <getcwd>:
    register long a7 __asm__("a7") = n;
    1dde:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de0:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1de4:	8082                	ret

0000000000001de6 <chdir>:
    register long a7 __asm__("a7") = n;
    1de6:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1dea:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1dee:	2501                	sext.w	a0,a0
    1df0:	8082                	ret

0000000000001df2 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1df2:	862e                	mv	a2,a1
    1df4:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1df6:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1df8:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1dfc:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e00:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e02:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e04:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e08:	2501                	sext.w	a0,a0
    1e0a:	8082                	ret

0000000000001e0c <getdents>:
    register long a7 __asm__("a7") = n;
    1e0c:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e10:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e14:	2501                	sext.w	a0,a0
    1e16:	8082                	ret

0000000000001e18 <pipe>:
    register long a7 __asm__("a7") = n;
    1e18:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e1c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e1e:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e22:	2501                	sext.w	a0,a0
    1e24:	8082                	ret

0000000000001e26 <dup>:
    register long a7 __asm__("a7") = n;
    1e26:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e28:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e2c:	2501                	sext.w	a0,a0
    1e2e:	8082                	ret

0000000000001e30 <dup2>:
    register long a7 __asm__("a7") = n;
    1e30:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e32:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e34:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e38:	2501                	sext.w	a0,a0
    1e3a:	8082                	ret

0000000000001e3c <mount>:
    register long a7 __asm__("a7") = n;
    1e3c:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e40:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e44:	2501                	sext.w	a0,a0
    1e46:	8082                	ret

0000000000001e48 <umount>:
    register long a7 __asm__("a7") = n;
    1e48:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e4c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e4e:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e52:	2501                	sext.w	a0,a0
    1e54:	8082                	ret

0000000000001e56 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e56:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e58:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e5a:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e5c:	8532                	mv	a0,a2
	mv a2, a4
    1e5e:	863a                	mv	a2,a4
	mv a3, a5
    1e60:	86be                	mv	a3,a5
	mv a4, a6
    1e62:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e64:	0dc00893          	li	a7,220
	ecall
    1e68:	00000073          	ecall

	beqz a0, 1f
    1e6c:	c111                	beqz	a0,1e70 <__clone+0x1a>
	# Parent
	ret
    1e6e:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e70:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e72:	6522                	ld	a0,8(sp)
	jalr a1
    1e74:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e76:	05d00893          	li	a7,93
	ecall
    1e7a:	00000073          	ecall
