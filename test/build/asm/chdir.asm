
/home/lmq/lmq/cscc/xv6-k210/test/build/riscv64/chdir:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0c9                	j	10c4 <__start_main>

0000000000001004 <test_chdir>:
#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

static char buffer[30];
void test_chdir(void){
    1004:	1141                	addi	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	e8a50513          	addi	a0,a0,-374 # 1e90 <__clone+0x2a>
void test_chdir(void){
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1012:	2b0000ef          	jal	ra,12c2 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	f5250513          	addi	a0,a0,-174 # 1f68 <__func__.1167>
    101e:	2a4000ef          	jal	ra,12c2 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	e8650513          	addi	a0,a0,-378 # 1ea8 <__clone+0x42>
    102a:	298000ef          	jal	ra,12c2 <puts>
    mkdir("test_chdir", 0666);
    102e:	1b600593          	li	a1,438
    1032:	00001517          	auipc	a0,0x1
    1036:	e8650513          	addi	a0,a0,-378 # 1eb8 <__clone+0x52>
    103a:	5c9000ef          	jal	ra,1e02 <mkdir>
    int ret = chdir("test_chdir");
    103e:	00001517          	auipc	a0,0x1
    1042:	e7a50513          	addi	a0,a0,-390 # 1eb8 <__clone+0x52>
    1046:	5b1000ef          	jal	ra,1df6 <chdir>
    104a:	842a                	mv	s0,a0
    printf("chdir ret: %d\n", ret);
    104c:	85aa                	mv	a1,a0
    104e:	00001517          	auipc	a0,0x1
    1052:	e7a50513          	addi	a0,a0,-390 # 1ec8 <__clone+0x62>
    1056:	28e000ef          	jal	ra,12e4 <printf>
    assert(ret == 0);
    105a:	e431                	bnez	s0,10a6 <test_chdir+0xa2>
    getcwd(buffer, 30);
    105c:	45f9                	li	a1,30
    105e:	00001517          	auipc	a0,0x1
    1062:	eea50513          	addi	a0,a0,-278 # 1f48 <buffer>
    1066:	589000ef          	jal	ra,1dee <getcwd>
    printf("  current working dir : %s\n", buffer);
    106a:	00001597          	auipc	a1,0x1
    106e:	ede58593          	addi	a1,a1,-290 # 1f48 <buffer>
    1072:	00001517          	auipc	a0,0x1
    1076:	e8650513          	addi	a0,a0,-378 # 1ef8 <__clone+0x92>
    107a:	26a000ef          	jal	ra,12e4 <printf>
    TEST_END(__func__);
    107e:	00001517          	auipc	a0,0x1
    1082:	e9a50513          	addi	a0,a0,-358 # 1f18 <__clone+0xb2>
    1086:	23c000ef          	jal	ra,12c2 <puts>
    108a:	00001517          	auipc	a0,0x1
    108e:	ede50513          	addi	a0,a0,-290 # 1f68 <__func__.1167>
    1092:	230000ef          	jal	ra,12c2 <puts>
}
    1096:	6402                	ld	s0,0(sp)
    1098:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    109a:	00001517          	auipc	a0,0x1
    109e:	e0e50513          	addi	a0,a0,-498 # 1ea8 <__clone+0x42>
}
    10a2:	0141                	addi	sp,sp,16
    TEST_END(__func__);
    10a4:	ac39                	j	12c2 <puts>
    assert(ret == 0);
    10a6:	00001517          	auipc	a0,0x1
    10aa:	e3250513          	addi	a0,a0,-462 # 1ed8 <__clone+0x72>
    10ae:	4be000ef          	jal	ra,156c <panic>
    10b2:	b76d                	j	105c <test_chdir+0x58>

00000000000010b4 <main>:

int main(void){
    10b4:	1141                	addi	sp,sp,-16
    10b6:	e406                	sd	ra,8(sp)
    test_chdir();
    10b8:	f4dff0ef          	jal	ra,1004 <test_chdir>
    return 0;
}
    10bc:	60a2                	ld	ra,8(sp)
    10be:	4501                	li	a0,0
    10c0:	0141                	addi	sp,sp,16
    10c2:	8082                	ret

00000000000010c4 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10c4:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10c6:	4108                	lw	a0,0(a0)
{
    10c8:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10ca:	05a1                	addi	a1,a1,8
{
    10cc:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10ce:	fe7ff0ef          	jal	ra,10b4 <main>
    10d2:	3ad000ef          	jal	ra,1c7e <exit>
	return 0;
}
    10d6:	60a2                	ld	ra,8(sp)
    10d8:	4501                	li	a0,0
    10da:	0141                	addi	sp,sp,16
    10dc:	8082                	ret

00000000000010de <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10de:	7179                	addi	sp,sp,-48
    10e0:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10e2:	12054b63          	bltz	a0,1218 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10e6:	02b577bb          	remuw	a5,a0,a1
    10ea:	00001697          	auipc	a3,0x1
    10ee:	e8e68693          	addi	a3,a3,-370 # 1f78 <digits>
    buf[16] = 0;
    10f2:	00010c23          	sb	zero,24(sp)
    i = 15;
    10f6:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    10fa:	1782                	slli	a5,a5,0x20
    10fc:	9381                	srli	a5,a5,0x20
    10fe:	97b6                	add	a5,a5,a3
    1100:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1104:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1108:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    110c:	16b56263          	bltu	a0,a1,1270 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1110:	02e8763b          	remuw	a2,a6,a4
    1114:	1602                	slli	a2,a2,0x20
    1116:	9201                	srli	a2,a2,0x20
    1118:	9636                	add	a2,a2,a3
    111a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    111e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1122:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1126:	12e86963          	bltu	a6,a4,1258 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    112a:	02e5f63b          	remuw	a2,a1,a4
    112e:	1602                	slli	a2,a2,0x20
    1130:	9201                	srli	a2,a2,0x20
    1132:	9636                	add	a2,a2,a3
    1134:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1138:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    113c:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1140:	10e5ef63          	bltu	a1,a4,125e <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1144:	02e8763b          	remuw	a2,a6,a4
    1148:	1602                	slli	a2,a2,0x20
    114a:	9201                	srli	a2,a2,0x20
    114c:	9636                	add	a2,a2,a3
    114e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1152:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1156:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    115a:	10e86563          	bltu	a6,a4,1264 <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    115e:	02e5f63b          	remuw	a2,a1,a4
    1162:	1602                	slli	a2,a2,0x20
    1164:	9201                	srli	a2,a2,0x20
    1166:	9636                	add	a2,a2,a3
    1168:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    116c:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1170:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1174:	0ee5eb63          	bltu	a1,a4,126a <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    1178:	02e8763b          	remuw	a2,a6,a4
    117c:	1602                	slli	a2,a2,0x20
    117e:	9201                	srli	a2,a2,0x20
    1180:	9636                	add	a2,a2,a3
    1182:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1186:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    118a:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    118e:	0ce86263          	bltu	a6,a4,1252 <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    1192:	02e5f63b          	remuw	a2,a1,a4
    1196:	1602                	slli	a2,a2,0x20
    1198:	9201                	srli	a2,a2,0x20
    119a:	9636                	add	a2,a2,a3
    119c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a0:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11a4:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11a8:	0ce5e663          	bltu	a1,a4,1274 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    11ac:	02e8763b          	remuw	a2,a6,a4
    11b0:	1602                	slli	a2,a2,0x20
    11b2:	9201                	srli	a2,a2,0x20
    11b4:	9636                	add	a2,a2,a3
    11b6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ba:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11be:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11c2:	0ae86c63          	bltu	a6,a4,127a <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    11c6:	02e5f63b          	remuw	a2,a1,a4
    11ca:	1602                	slli	a2,a2,0x20
    11cc:	9201                	srli	a2,a2,0x20
    11ce:	9636                	add	a2,a2,a3
    11d0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d4:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11d8:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11dc:	0ae5e263          	bltu	a1,a4,1280 <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    11e0:	1782                	slli	a5,a5,0x20
    11e2:	9381                	srli	a5,a5,0x20
    11e4:	97b6                	add	a5,a5,a3
    11e6:	0007c703          	lbu	a4,0(a5)
    11ea:	4599                	li	a1,6
    11ec:	4795                	li	a5,5
    11ee:	00e10723          	sb	a4,14(sp)

    if (sign)
    11f2:	00055963          	bgez	a0,1204 <printint.constprop.0+0x126>
        buf[i--] = '-';
    11f6:	1018                	addi	a4,sp,32
    11f8:	973e                	add	a4,a4,a5
    11fa:	02d00693          	li	a3,45
    11fe:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    1202:	85be                	mv	a1,a5
    write(f, s, l);
    1204:	003c                	addi	a5,sp,8
    1206:	4641                	li	a2,16
    1208:	9e0d                	subw	a2,a2,a1
    120a:	4505                	li	a0,1
    120c:	95be                	add	a1,a1,a5
    120e:	221000ef          	jal	ra,1c2e <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1212:	70a2                	ld	ra,40(sp)
    1214:	6145                	addi	sp,sp,48
    1216:	8082                	ret
        x = -xx;
    1218:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    121c:	02b677bb          	remuw	a5,a2,a1
    1220:	00001697          	auipc	a3,0x1
    1224:	d5868693          	addi	a3,a3,-680 # 1f78 <digits>
    buf[16] = 0;
    1228:	00010c23          	sb	zero,24(sp)
    i = 15;
    122c:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    1230:	1782                	slli	a5,a5,0x20
    1232:	9381                	srli	a5,a5,0x20
    1234:	97b6                	add	a5,a5,a3
    1236:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    123a:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    123e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1242:	ecb677e3          	bgeu	a2,a1,1110 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1246:	02d00793          	li	a5,45
    124a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    124e:	45b9                	li	a1,14
    1250:	bf55                	j	1204 <printint.constprop.0+0x126>
    1252:	47a5                	li	a5,9
    1254:	45a9                	li	a1,10
    1256:	bf71                	j	11f2 <printint.constprop.0+0x114>
    1258:	47b5                	li	a5,13
    125a:	45b9                	li	a1,14
    125c:	bf59                	j	11f2 <printint.constprop.0+0x114>
    125e:	47b1                	li	a5,12
    1260:	45b5                	li	a1,13
    1262:	bf41                	j	11f2 <printint.constprop.0+0x114>
    1264:	47ad                	li	a5,11
    1266:	45b1                	li	a1,12
    1268:	b769                	j	11f2 <printint.constprop.0+0x114>
    126a:	47a9                	li	a5,10
    126c:	45ad                	li	a1,11
    126e:	b751                	j	11f2 <printint.constprop.0+0x114>
    i = 15;
    1270:	45bd                	li	a1,15
    1272:	bf49                	j	1204 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1274:	47a1                	li	a5,8
    1276:	45a5                	li	a1,9
    1278:	bfad                	j	11f2 <printint.constprop.0+0x114>
    127a:	479d                	li	a5,7
    127c:	45a1                	li	a1,8
    127e:	bf95                	j	11f2 <printint.constprop.0+0x114>
    1280:	4799                	li	a5,6
    1282:	459d                	li	a1,7
    1284:	b7bd                	j	11f2 <printint.constprop.0+0x114>

0000000000001286 <getchar>:
{
    1286:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1288:	00f10593          	addi	a1,sp,15
    128c:	4605                	li	a2,1
    128e:	4501                	li	a0,0
{
    1290:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1292:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1296:	18f000ef          	jal	ra,1c24 <read>
}
    129a:	60e2                	ld	ra,24(sp)
    129c:	00f14503          	lbu	a0,15(sp)
    12a0:	6105                	addi	sp,sp,32
    12a2:	8082                	ret

00000000000012a4 <putchar>:
{
    12a4:	1101                	addi	sp,sp,-32
    12a6:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12a8:	00f10593          	addi	a1,sp,15
    12ac:	4605                	li	a2,1
    12ae:	4505                	li	a0,1
{
    12b0:	ec06                	sd	ra,24(sp)
    char byte = c;
    12b2:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12b6:	179000ef          	jal	ra,1c2e <write>
}
    12ba:	60e2                	ld	ra,24(sp)
    12bc:	2501                	sext.w	a0,a0
    12be:	6105                	addi	sp,sp,32
    12c0:	8082                	ret

00000000000012c2 <puts>:
{
    12c2:	1141                	addi	sp,sp,-16
    12c4:	e406                	sd	ra,8(sp)
    12c6:	e022                	sd	s0,0(sp)
    12c8:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12ca:	580000ef          	jal	ra,184a <strlen>
    12ce:	862a                	mv	a2,a0
    12d0:	85a2                	mv	a1,s0
    12d2:	4505                	li	a0,1
    12d4:	15b000ef          	jal	ra,1c2e <write>
}
    12d8:	60a2                	ld	ra,8(sp)
    12da:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12dc:	957d                	srai	a0,a0,0x3f
    return r;
    12de:	2501                	sext.w	a0,a0
}
    12e0:	0141                	addi	sp,sp,16
    12e2:	8082                	ret

00000000000012e4 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12e4:	7171                	addi	sp,sp,-176
    12e6:	fc56                	sd	s5,56(sp)
    12e8:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    12ea:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12ec:	18bc                	addi	a5,sp,120
{
    12ee:	e8ca                	sd	s2,80(sp)
    12f0:	e4ce                	sd	s3,72(sp)
    12f2:	e0d2                	sd	s4,64(sp)
    12f4:	f85a                	sd	s6,48(sp)
    12f6:	f486                	sd	ra,104(sp)
    12f8:	f0a2                	sd	s0,96(sp)
    12fa:	eca6                	sd	s1,88(sp)
    12fc:	fcae                	sd	a1,120(sp)
    12fe:	e132                	sd	a2,128(sp)
    1300:	e536                	sd	a3,136(sp)
    1302:	e93a                	sd	a4,144(sp)
    1304:	f142                	sd	a6,160(sp)
    1306:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1308:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    130a:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    130e:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1312:	00001b17          	auipc	s6,0x1
    1316:	c16b0b13          	addi	s6,s6,-1002 # 1f28 <__clone+0xc2>
    buf[i++] = '0';
    131a:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    131e:	00001997          	auipc	s3,0x1
    1322:	c5a98993          	addi	s3,s3,-934 # 1f78 <digits>
        if (!*s)
    1326:	00054783          	lbu	a5,0(a0)
    132a:	16078a63          	beqz	a5,149e <printf+0x1ba>
    132e:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1330:	19278163          	beq	a5,s2,14b2 <printf+0x1ce>
    1334:	00164783          	lbu	a5,1(a2)
    1338:	0605                	addi	a2,a2,1
    133a:	fbfd                	bnez	a5,1330 <printf+0x4c>
    133c:	84b2                	mv	s1,a2
        l = z - a;
    133e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1342:	85aa                	mv	a1,a0
    1344:	8622                	mv	a2,s0
    1346:	4505                	li	a0,1
    1348:	0e7000ef          	jal	ra,1c2e <write>
        if (l)
    134c:	18041c63          	bnez	s0,14e4 <printf+0x200>
        if (s[1] == 0)
    1350:	0014c783          	lbu	a5,1(s1)
    1354:	14078563          	beqz	a5,149e <printf+0x1ba>
        switch (s[1])
    1358:	1d478063          	beq	a5,s4,1518 <printf+0x234>
    135c:	18fa6663          	bltu	s4,a5,14e8 <printf+0x204>
    1360:	06400713          	li	a4,100
    1364:	1ae78063          	beq	a5,a4,1504 <printf+0x220>
    1368:	07000713          	li	a4,112
    136c:	1ce79963          	bne	a5,a4,153e <printf+0x25a>
            printptr(va_arg(ap, uint64));
    1370:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1372:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1376:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1378:	631c                	ld	a5,0(a4)
    137a:	0721                	addi	a4,a4,8
    137c:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    137e:	00479293          	slli	t0,a5,0x4
    1382:	00879f93          	slli	t6,a5,0x8
    1386:	00c79f13          	slli	t5,a5,0xc
    138a:	01079e93          	slli	t4,a5,0x10
    138e:	01479e13          	slli	t3,a5,0x14
    1392:	01879313          	slli	t1,a5,0x18
    1396:	01c79893          	slli	a7,a5,0x1c
    139a:	02479813          	slli	a6,a5,0x24
    139e:	02879513          	slli	a0,a5,0x28
    13a2:	02c79593          	slli	a1,a5,0x2c
    13a6:	03079693          	slli	a3,a5,0x30
    13aa:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13ae:	03c7d413          	srli	s0,a5,0x3c
    13b2:	01c7d39b          	srliw	t2,a5,0x1c
    13b6:	03c2d293          	srli	t0,t0,0x3c
    13ba:	03cfdf93          	srli	t6,t6,0x3c
    13be:	03cf5f13          	srli	t5,t5,0x3c
    13c2:	03cede93          	srli	t4,t4,0x3c
    13c6:	03ce5e13          	srli	t3,t3,0x3c
    13ca:	03c35313          	srli	t1,t1,0x3c
    13ce:	03c8d893          	srli	a7,a7,0x3c
    13d2:	03c85813          	srli	a6,a6,0x3c
    13d6:	9171                	srli	a0,a0,0x3c
    13d8:	91f1                	srli	a1,a1,0x3c
    13da:	92f1                	srli	a3,a3,0x3c
    13dc:	9371                	srli	a4,a4,0x3c
    13de:	96ce                	add	a3,a3,s3
    13e0:	974e                	add	a4,a4,s3
    13e2:	944e                	add	s0,s0,s3
    13e4:	92ce                	add	t0,t0,s3
    13e6:	9fce                	add	t6,t6,s3
    13e8:	9f4e                	add	t5,t5,s3
    13ea:	9ece                	add	t4,t4,s3
    13ec:	9e4e                	add	t3,t3,s3
    13ee:	934e                	add	t1,t1,s3
    13f0:	98ce                	add	a7,a7,s3
    13f2:	93ce                	add	t2,t2,s3
    13f4:	984e                	add	a6,a6,s3
    13f6:	954e                	add	a0,a0,s3
    13f8:	95ce                	add	a1,a1,s3
    13fa:	0006c083          	lbu	ra,0(a3)
    13fe:	0002c283          	lbu	t0,0(t0)
    1402:	00074683          	lbu	a3,0(a4)
    1406:	000fcf83          	lbu	t6,0(t6)
    140a:	000f4f03          	lbu	t5,0(t5)
    140e:	000ece83          	lbu	t4,0(t4)
    1412:	000e4e03          	lbu	t3,0(t3)
    1416:	00034303          	lbu	t1,0(t1)
    141a:	0008c883          	lbu	a7,0(a7)
    141e:	0003c383          	lbu	t2,0(t2)
    1422:	00084803          	lbu	a6,0(a6)
    1426:	00054503          	lbu	a0,0(a0)
    142a:	0005c583          	lbu	a1,0(a1)
    142e:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1432:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1436:	9371                	srli	a4,a4,0x3c
    1438:	8bbd                	andi	a5,a5,15
    143a:	974e                	add	a4,a4,s3
    143c:	97ce                	add	a5,a5,s3
    143e:	005105a3          	sb	t0,11(sp)
    1442:	01f10623          	sb	t6,12(sp)
    1446:	01e106a3          	sb	t5,13(sp)
    144a:	01d10723          	sb	t4,14(sp)
    144e:	01c107a3          	sb	t3,15(sp)
    1452:	00610823          	sb	t1,16(sp)
    1456:	011108a3          	sb	a7,17(sp)
    145a:	00710923          	sb	t2,18(sp)
    145e:	010109a3          	sb	a6,19(sp)
    1462:	00a10a23          	sb	a0,20(sp)
    1466:	00b10aa3          	sb	a1,21(sp)
    146a:	00110b23          	sb	ra,22(sp)
    146e:	00d10ba3          	sb	a3,23(sp)
    1472:	00810523          	sb	s0,10(sp)
    1476:	00074703          	lbu	a4,0(a4)
    147a:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    147e:	002c                	addi	a1,sp,8
    1480:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1482:	00e10c23          	sb	a4,24(sp)
    1486:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    148a:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    148e:	7a0000ef          	jal	ra,1c2e <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1492:	00248513          	addi	a0,s1,2
        if (!*s)
    1496:	00054783          	lbu	a5,0(a0)
    149a:	e8079ae3          	bnez	a5,132e <printf+0x4a>
    }
    va_end(ap);
}
    149e:	70a6                	ld	ra,104(sp)
    14a0:	7406                	ld	s0,96(sp)
    14a2:	64e6                	ld	s1,88(sp)
    14a4:	6946                	ld	s2,80(sp)
    14a6:	69a6                	ld	s3,72(sp)
    14a8:	6a06                	ld	s4,64(sp)
    14aa:	7ae2                	ld	s5,56(sp)
    14ac:	7b42                	ld	s6,48(sp)
    14ae:	614d                	addi	sp,sp,176
    14b0:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14b2:	00064783          	lbu	a5,0(a2)
    14b6:	84b2                	mv	s1,a2
    14b8:	01278963          	beq	a5,s2,14ca <printf+0x1e6>
    14bc:	b549                	j	133e <printf+0x5a>
    14be:	0024c783          	lbu	a5,2(s1)
    14c2:	0605                	addi	a2,a2,1
    14c4:	0489                	addi	s1,s1,2
    14c6:	e7279ce3          	bne	a5,s2,133e <printf+0x5a>
    14ca:	0014c783          	lbu	a5,1(s1)
    14ce:	ff2788e3          	beq	a5,s2,14be <printf+0x1da>
        l = z - a;
    14d2:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14d6:	85aa                	mv	a1,a0
    14d8:	8622                	mv	a2,s0
    14da:	4505                	li	a0,1
    14dc:	752000ef          	jal	ra,1c2e <write>
        if (l)
    14e0:	e60408e3          	beqz	s0,1350 <printf+0x6c>
    14e4:	8526                	mv	a0,s1
    14e6:	b581                	j	1326 <printf+0x42>
        switch (s[1])
    14e8:	07800713          	li	a4,120
    14ec:	04e79963          	bne	a5,a4,153e <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    14f0:	6782                	ld	a5,0(sp)
    14f2:	45c1                	li	a1,16
    14f4:	4388                	lw	a0,0(a5)
    14f6:	07a1                	addi	a5,a5,8
    14f8:	e03e                	sd	a5,0(sp)
    14fa:	be5ff0ef          	jal	ra,10de <printint.constprop.0>
        s += 2;
    14fe:	00248513          	addi	a0,s1,2
    1502:	bf51                	j	1496 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    1504:	6782                	ld	a5,0(sp)
    1506:	45a9                	li	a1,10
    1508:	4388                	lw	a0,0(a5)
    150a:	07a1                	addi	a5,a5,8
    150c:	e03e                	sd	a5,0(sp)
    150e:	bd1ff0ef          	jal	ra,10de <printint.constprop.0>
        s += 2;
    1512:	00248513          	addi	a0,s1,2
    1516:	b741                	j	1496 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1518:	6782                	ld	a5,0(sp)
    151a:	6380                	ld	s0,0(a5)
    151c:	07a1                	addi	a5,a5,8
    151e:	e03e                	sd	a5,0(sp)
    1520:	c421                	beqz	s0,1568 <printf+0x284>
            l = strnlen(a, 200);
    1522:	0c800593          	li	a1,200
    1526:	8522                	mv	a0,s0
    1528:	40e000ef          	jal	ra,1936 <strnlen>
    write(f, s, l);
    152c:	0005061b          	sext.w	a2,a0
    1530:	85a2                	mv	a1,s0
    1532:	4505                	li	a0,1
    1534:	6fa000ef          	jal	ra,1c2e <write>
        s += 2;
    1538:	00248513          	addi	a0,s1,2
    153c:	bfa9                	j	1496 <printf+0x1b2>
    char byte = c;
    153e:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1542:	4605                	li	a2,1
    1544:	002c                	addi	a1,sp,8
    1546:	4505                	li	a0,1
    char byte = c;
    1548:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    154c:	6e2000ef          	jal	ra,1c2e <write>
    char byte = c;
    1550:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1554:	4605                	li	a2,1
    1556:	002c                	addi	a1,sp,8
    1558:	4505                	li	a0,1
    char byte = c;
    155a:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    155e:	6d0000ef          	jal	ra,1c2e <write>
        s += 2;
    1562:	00248513          	addi	a0,s1,2
    1566:	bf05                	j	1496 <printf+0x1b2>
                a = "(null)";
    1568:	845a                	mv	s0,s6
    156a:	bf65                	j	1522 <printf+0x23e>

000000000000156c <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    156c:	1141                	addi	sp,sp,-16
    156e:	e406                	sd	ra,8(sp)
    puts(m);
    1570:	d53ff0ef          	jal	ra,12c2 <puts>
    exit(-100);
}
    1574:	60a2                	ld	ra,8(sp)
    exit(-100);
    1576:	f9c00513          	li	a0,-100
}
    157a:	0141                	addi	sp,sp,16
    exit(-100);
    157c:	a709                	j	1c7e <exit>

000000000000157e <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    157e:	02000793          	li	a5,32
    1582:	00f50663          	beq	a0,a5,158e <isspace+0x10>
    1586:	355d                	addiw	a0,a0,-9
    1588:	00553513          	sltiu	a0,a0,5
    158c:	8082                	ret
    158e:	4505                	li	a0,1
}
    1590:	8082                	ret

0000000000001592 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1592:	fd05051b          	addiw	a0,a0,-48
}
    1596:	00a53513          	sltiu	a0,a0,10
    159a:	8082                	ret

000000000000159c <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    159c:	02000613          	li	a2,32
    15a0:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15a2:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a6:	ff77069b          	addiw	a3,a4,-9
    15aa:	04c70d63          	beq	a4,a2,1604 <atoi+0x68>
    15ae:	0007079b          	sext.w	a5,a4
    15b2:	04d5f963          	bgeu	a1,a3,1604 <atoi+0x68>
        s++;
    switch (*s)
    15b6:	02b00693          	li	a3,43
    15ba:	04d70a63          	beq	a4,a3,160e <atoi+0x72>
    15be:	02d00693          	li	a3,45
    15c2:	06d70463          	beq	a4,a3,162a <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15c6:	fd07859b          	addiw	a1,a5,-48
    15ca:	4625                	li	a2,9
    15cc:	873e                	mv	a4,a5
    15ce:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15d0:	4e01                	li	t3,0
    while (isdigit(*s))
    15d2:	04b66a63          	bltu	a2,a1,1626 <atoi+0x8a>
    int n = 0, neg = 0;
    15d6:	4501                	li	a0,0
    while (isdigit(*s))
    15d8:	4825                	li	a6,9
    15da:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    15de:	0025179b          	slliw	a5,a0,0x2
    15e2:	9d3d                	addw	a0,a0,a5
    15e4:	fd07031b          	addiw	t1,a4,-48
    15e8:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15ec:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15f0:	0685                	addi	a3,a3,1
    15f2:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15f6:	0006071b          	sext.w	a4,a2
    15fa:	feb870e3          	bgeu	a6,a1,15da <atoi+0x3e>
    return neg ? n : -n;
    15fe:	000e0563          	beqz	t3,1608 <atoi+0x6c>
}
    1602:	8082                	ret
        s++;
    1604:	0505                	addi	a0,a0,1
    1606:	bf71                	j	15a2 <atoi+0x6>
    1608:	4113053b          	subw	a0,t1,a7
    160c:	8082                	ret
    while (isdigit(*s))
    160e:	00154783          	lbu	a5,1(a0)
    1612:	4625                	li	a2,9
        s++;
    1614:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1618:	fd07859b          	addiw	a1,a5,-48
    161c:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1620:	4e01                	li	t3,0
    while (isdigit(*s))
    1622:	fab67ae3          	bgeu	a2,a1,15d6 <atoi+0x3a>
    1626:	4501                	li	a0,0
}
    1628:	8082                	ret
    while (isdigit(*s))
    162a:	00154783          	lbu	a5,1(a0)
    162e:	4625                	li	a2,9
        s++;
    1630:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1634:	fd07859b          	addiw	a1,a5,-48
    1638:	0007871b          	sext.w	a4,a5
    163c:	feb665e3          	bltu	a2,a1,1626 <atoi+0x8a>
        neg = 1;
    1640:	4e05                	li	t3,1
    1642:	bf51                	j	15d6 <atoi+0x3a>

0000000000001644 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1644:	16060d63          	beqz	a2,17be <memset+0x17a>
    1648:	40a007b3          	neg	a5,a0
    164c:	8b9d                	andi	a5,a5,7
    164e:	00778713          	addi	a4,a5,7
    1652:	482d                	li	a6,11
    1654:	0ff5f593          	andi	a1,a1,255
    1658:	fff60693          	addi	a3,a2,-1
    165c:	17076263          	bltu	a4,a6,17c0 <memset+0x17c>
    1660:	16e6ea63          	bltu	a3,a4,17d4 <memset+0x190>
    1664:	16078563          	beqz	a5,17ce <memset+0x18a>
    1668:	00b50023          	sb	a1,0(a0)
    166c:	4705                	li	a4,1
    166e:	00150e93          	addi	t4,a0,1
    1672:	14e78c63          	beq	a5,a4,17ca <memset+0x186>
    1676:	00b500a3          	sb	a1,1(a0)
    167a:	4709                	li	a4,2
    167c:	00250e93          	addi	t4,a0,2
    1680:	14e78d63          	beq	a5,a4,17da <memset+0x196>
    1684:	00b50123          	sb	a1,2(a0)
    1688:	470d                	li	a4,3
    168a:	00350e93          	addi	t4,a0,3
    168e:	12e78b63          	beq	a5,a4,17c4 <memset+0x180>
    1692:	00b501a3          	sb	a1,3(a0)
    1696:	4711                	li	a4,4
    1698:	00450e93          	addi	t4,a0,4
    169c:	14e78163          	beq	a5,a4,17de <memset+0x19a>
    16a0:	00b50223          	sb	a1,4(a0)
    16a4:	4715                	li	a4,5
    16a6:	00550e93          	addi	t4,a0,5
    16aa:	12e78c63          	beq	a5,a4,17e2 <memset+0x19e>
    16ae:	00b502a3          	sb	a1,5(a0)
    16b2:	471d                	li	a4,7
    16b4:	00650e93          	addi	t4,a0,6
    16b8:	12e79763          	bne	a5,a4,17e6 <memset+0x1a2>
    16bc:	00750e93          	addi	t4,a0,7
    16c0:	00b50323          	sb	a1,6(a0)
    16c4:	4f1d                	li	t5,7
    16c6:	00859713          	slli	a4,a1,0x8
    16ca:	8f4d                	or	a4,a4,a1
    16cc:	01059e13          	slli	t3,a1,0x10
    16d0:	01c76e33          	or	t3,a4,t3
    16d4:	01859313          	slli	t1,a1,0x18
    16d8:	006e6333          	or	t1,t3,t1
    16dc:	02059893          	slli	a7,a1,0x20
    16e0:	011368b3          	or	a7,t1,a7
    16e4:	02859813          	slli	a6,a1,0x28
    16e8:	40f60333          	sub	t1,a2,a5
    16ec:	0108e833          	or	a6,a7,a6
    16f0:	03059693          	slli	a3,a1,0x30
    16f4:	00d866b3          	or	a3,a6,a3
    16f8:	03859713          	slli	a4,a1,0x38
    16fc:	97aa                	add	a5,a5,a0
    16fe:	ff837813          	andi	a6,t1,-8
    1702:	8f55                	or	a4,a4,a3
    1704:	00f806b3          	add	a3,a6,a5
    1708:	e398                	sd	a4,0(a5)
    170a:	07a1                	addi	a5,a5,8
    170c:	fed79ee3          	bne	a5,a3,1708 <memset+0xc4>
    1710:	ff837693          	andi	a3,t1,-8
    1714:	00de87b3          	add	a5,t4,a3
    1718:	01e6873b          	addw	a4,a3,t5
    171c:	0ad30663          	beq	t1,a3,17c8 <memset+0x184>
    1720:	00b78023          	sb	a1,0(a5)
    1724:	0017069b          	addiw	a3,a4,1
    1728:	08c6fb63          	bgeu	a3,a2,17be <memset+0x17a>
    172c:	00b780a3          	sb	a1,1(a5)
    1730:	0027069b          	addiw	a3,a4,2
    1734:	08c6f563          	bgeu	a3,a2,17be <memset+0x17a>
    1738:	00b78123          	sb	a1,2(a5)
    173c:	0037069b          	addiw	a3,a4,3
    1740:	06c6ff63          	bgeu	a3,a2,17be <memset+0x17a>
    1744:	00b781a3          	sb	a1,3(a5)
    1748:	0047069b          	addiw	a3,a4,4
    174c:	06c6f963          	bgeu	a3,a2,17be <memset+0x17a>
    1750:	00b78223          	sb	a1,4(a5)
    1754:	0057069b          	addiw	a3,a4,5
    1758:	06c6f363          	bgeu	a3,a2,17be <memset+0x17a>
    175c:	00b782a3          	sb	a1,5(a5)
    1760:	0067069b          	addiw	a3,a4,6
    1764:	04c6fd63          	bgeu	a3,a2,17be <memset+0x17a>
    1768:	00b78323          	sb	a1,6(a5)
    176c:	0077069b          	addiw	a3,a4,7
    1770:	04c6f763          	bgeu	a3,a2,17be <memset+0x17a>
    1774:	00b783a3          	sb	a1,7(a5)
    1778:	0087069b          	addiw	a3,a4,8
    177c:	04c6f163          	bgeu	a3,a2,17be <memset+0x17a>
    1780:	00b78423          	sb	a1,8(a5)
    1784:	0097069b          	addiw	a3,a4,9
    1788:	02c6fb63          	bgeu	a3,a2,17be <memset+0x17a>
    178c:	00b784a3          	sb	a1,9(a5)
    1790:	00a7069b          	addiw	a3,a4,10
    1794:	02c6f563          	bgeu	a3,a2,17be <memset+0x17a>
    1798:	00b78523          	sb	a1,10(a5)
    179c:	00b7069b          	addiw	a3,a4,11
    17a0:	00c6ff63          	bgeu	a3,a2,17be <memset+0x17a>
    17a4:	00b785a3          	sb	a1,11(a5)
    17a8:	00c7069b          	addiw	a3,a4,12
    17ac:	00c6f963          	bgeu	a3,a2,17be <memset+0x17a>
    17b0:	00b78623          	sb	a1,12(a5)
    17b4:	2735                	addiw	a4,a4,13
    17b6:	00c77463          	bgeu	a4,a2,17be <memset+0x17a>
    17ba:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17be:	8082                	ret
    17c0:	472d                	li	a4,11
    17c2:	bd79                	j	1660 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17c4:	4f0d                	li	t5,3
    17c6:	b701                	j	16c6 <memset+0x82>
    17c8:	8082                	ret
    17ca:	4f05                	li	t5,1
    17cc:	bded                	j	16c6 <memset+0x82>
    17ce:	8eaa                	mv	t4,a0
    17d0:	4f01                	li	t5,0
    17d2:	bdd5                	j	16c6 <memset+0x82>
    17d4:	87aa                	mv	a5,a0
    17d6:	4701                	li	a4,0
    17d8:	b7a1                	j	1720 <memset+0xdc>
    17da:	4f09                	li	t5,2
    17dc:	b5ed                	j	16c6 <memset+0x82>
    17de:	4f11                	li	t5,4
    17e0:	b5dd                	j	16c6 <memset+0x82>
    17e2:	4f15                	li	t5,5
    17e4:	b5cd                	j	16c6 <memset+0x82>
    17e6:	4f19                	li	t5,6
    17e8:	bdf9                	j	16c6 <memset+0x82>

00000000000017ea <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17ea:	00054783          	lbu	a5,0(a0)
    17ee:	0005c703          	lbu	a4,0(a1)
    17f2:	00e79863          	bne	a5,a4,1802 <strcmp+0x18>
    17f6:	0505                	addi	a0,a0,1
    17f8:	0585                	addi	a1,a1,1
    17fa:	fbe5                	bnez	a5,17ea <strcmp>
    17fc:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17fe:	9d19                	subw	a0,a0,a4
    1800:	8082                	ret
    1802:	0007851b          	sext.w	a0,a5
    1806:	bfe5                	j	17fe <strcmp+0x14>

0000000000001808 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1808:	ce05                	beqz	a2,1840 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    180a:	00054703          	lbu	a4,0(a0)
    180e:	0005c783          	lbu	a5,0(a1)
    1812:	cb0d                	beqz	a4,1844 <strncmp+0x3c>
    if (!n--)
    1814:	167d                	addi	a2,a2,-1
    1816:	00c506b3          	add	a3,a0,a2
    181a:	a819                	j	1830 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    181c:	00a68e63          	beq	a3,a0,1838 <strncmp+0x30>
    1820:	0505                	addi	a0,a0,1
    1822:	00e79b63          	bne	a5,a4,1838 <strncmp+0x30>
    1826:	00054703          	lbu	a4,0(a0)
    182a:	0005c783          	lbu	a5,0(a1)
    182e:	cb19                	beqz	a4,1844 <strncmp+0x3c>
    1830:	0005c783          	lbu	a5,0(a1)
    1834:	0585                	addi	a1,a1,1
    1836:	f3fd                	bnez	a5,181c <strncmp+0x14>
        ;
    return *l - *r;
    1838:	0007051b          	sext.w	a0,a4
    183c:	9d1d                	subw	a0,a0,a5
    183e:	8082                	ret
        return 0;
    1840:	4501                	li	a0,0
}
    1842:	8082                	ret
    1844:	4501                	li	a0,0
    return *l - *r;
    1846:	9d1d                	subw	a0,a0,a5
    1848:	8082                	ret

000000000000184a <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    184a:	00757793          	andi	a5,a0,7
    184e:	cf89                	beqz	a5,1868 <strlen+0x1e>
    1850:	87aa                	mv	a5,a0
    1852:	a029                	j	185c <strlen+0x12>
    1854:	0785                	addi	a5,a5,1
    1856:	0077f713          	andi	a4,a5,7
    185a:	cb01                	beqz	a4,186a <strlen+0x20>
        if (!*s)
    185c:	0007c703          	lbu	a4,0(a5)
    1860:	fb75                	bnez	a4,1854 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1862:	40a78533          	sub	a0,a5,a0
}
    1866:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1868:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    186a:	6394                	ld	a3,0(a5)
    186c:	00000597          	auipc	a1,0x0
    1870:	6c45b583          	ld	a1,1732(a1) # 1f30 <__clone+0xca>
    1874:	00000617          	auipc	a2,0x0
    1878:	6c463603          	ld	a2,1732(a2) # 1f38 <__clone+0xd2>
    187c:	a019                	j	1882 <strlen+0x38>
    187e:	6794                	ld	a3,8(a5)
    1880:	07a1                	addi	a5,a5,8
    1882:	00b68733          	add	a4,a3,a1
    1886:	fff6c693          	not	a3,a3
    188a:	8f75                	and	a4,a4,a3
    188c:	8f71                	and	a4,a4,a2
    188e:	db65                	beqz	a4,187e <strlen+0x34>
    for (; *s; s++)
    1890:	0007c703          	lbu	a4,0(a5)
    1894:	d779                	beqz	a4,1862 <strlen+0x18>
    1896:	0017c703          	lbu	a4,1(a5)
    189a:	0785                	addi	a5,a5,1
    189c:	d379                	beqz	a4,1862 <strlen+0x18>
    189e:	0017c703          	lbu	a4,1(a5)
    18a2:	0785                	addi	a5,a5,1
    18a4:	fb6d                	bnez	a4,1896 <strlen+0x4c>
    18a6:	bf75                	j	1862 <strlen+0x18>

00000000000018a8 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18a8:	00757713          	andi	a4,a0,7
{
    18ac:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18ae:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18b2:	cb19                	beqz	a4,18c8 <memchr+0x20>
    18b4:	ce25                	beqz	a2,192c <memchr+0x84>
    18b6:	0007c703          	lbu	a4,0(a5)
    18ba:	04b70e63          	beq	a4,a1,1916 <memchr+0x6e>
    18be:	0785                	addi	a5,a5,1
    18c0:	0077f713          	andi	a4,a5,7
    18c4:	167d                	addi	a2,a2,-1
    18c6:	f77d                	bnez	a4,18b4 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18c8:	4501                	li	a0,0
    if (n && *s != c)
    18ca:	c235                	beqz	a2,192e <memchr+0x86>
    18cc:	0007c703          	lbu	a4,0(a5)
    18d0:	04b70363          	beq	a4,a1,1916 <memchr+0x6e>
        size_t k = ONES * c;
    18d4:	00000517          	auipc	a0,0x0
    18d8:	66c53503          	ld	a0,1644(a0) # 1f40 <__clone+0xda>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18dc:	471d                	li	a4,7
        size_t k = ONES * c;
    18de:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18e2:	02c77a63          	bgeu	a4,a2,1916 <memchr+0x6e>
    18e6:	00000897          	auipc	a7,0x0
    18ea:	64a8b883          	ld	a7,1610(a7) # 1f30 <__clone+0xca>
    18ee:	00000817          	auipc	a6,0x0
    18f2:	64a83803          	ld	a6,1610(a6) # 1f38 <__clone+0xd2>
    18f6:	431d                	li	t1,7
    18f8:	a029                	j	1902 <memchr+0x5a>
    18fa:	1661                	addi	a2,a2,-8
    18fc:	07a1                	addi	a5,a5,8
    18fe:	02c37963          	bgeu	t1,a2,1930 <memchr+0x88>
    1902:	6398                	ld	a4,0(a5)
    1904:	8f29                	xor	a4,a4,a0
    1906:	011706b3          	add	a3,a4,a7
    190a:	fff74713          	not	a4,a4
    190e:	8f75                	and	a4,a4,a3
    1910:	01077733          	and	a4,a4,a6
    1914:	d37d                	beqz	a4,18fa <memchr+0x52>
    1916:	853e                	mv	a0,a5
    1918:	97b2                	add	a5,a5,a2
    191a:	a021                	j	1922 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    191c:	0505                	addi	a0,a0,1
    191e:	00f50763          	beq	a0,a5,192c <memchr+0x84>
    1922:	00054703          	lbu	a4,0(a0)
    1926:	feb71be3          	bne	a4,a1,191c <memchr+0x74>
    192a:	8082                	ret
    return n ? (void *)s : 0;
    192c:	4501                	li	a0,0
}
    192e:	8082                	ret
    return n ? (void *)s : 0;
    1930:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1932:	f275                	bnez	a2,1916 <memchr+0x6e>
}
    1934:	8082                	ret

0000000000001936 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1936:	1101                	addi	sp,sp,-32
    1938:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    193a:	862e                	mv	a2,a1
{
    193c:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    193e:	4581                	li	a1,0
{
    1940:	e426                	sd	s1,8(sp)
    1942:	ec06                	sd	ra,24(sp)
    1944:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1946:	f63ff0ef          	jal	ra,18a8 <memchr>
    return p ? p - s : n;
    194a:	c519                	beqz	a0,1958 <strnlen+0x22>
}
    194c:	60e2                	ld	ra,24(sp)
    194e:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1950:	8d05                	sub	a0,a0,s1
}
    1952:	64a2                	ld	s1,8(sp)
    1954:	6105                	addi	sp,sp,32
    1956:	8082                	ret
    1958:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    195a:	8522                	mv	a0,s0
}
    195c:	6442                	ld	s0,16(sp)
    195e:	64a2                	ld	s1,8(sp)
    1960:	6105                	addi	sp,sp,32
    1962:	8082                	ret

0000000000001964 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1964:	00b547b3          	xor	a5,a0,a1
    1968:	8b9d                	andi	a5,a5,7
    196a:	eb95                	bnez	a5,199e <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    196c:	0075f793          	andi	a5,a1,7
    1970:	e7b1                	bnez	a5,19bc <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1972:	6198                	ld	a4,0(a1)
    1974:	00000617          	auipc	a2,0x0
    1978:	5bc63603          	ld	a2,1468(a2) # 1f30 <__clone+0xca>
    197c:	00000817          	auipc	a6,0x0
    1980:	5bc83803          	ld	a6,1468(a6) # 1f38 <__clone+0xd2>
    1984:	a029                	j	198e <strcpy+0x2a>
    1986:	e118                	sd	a4,0(a0)
    1988:	6598                	ld	a4,8(a1)
    198a:	05a1                	addi	a1,a1,8
    198c:	0521                	addi	a0,a0,8
    198e:	00c707b3          	add	a5,a4,a2
    1992:	fff74693          	not	a3,a4
    1996:	8ff5                	and	a5,a5,a3
    1998:	0107f7b3          	and	a5,a5,a6
    199c:	d7ed                	beqz	a5,1986 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    199e:	0005c783          	lbu	a5,0(a1)
    19a2:	00f50023          	sb	a5,0(a0)
    19a6:	c785                	beqz	a5,19ce <strcpy+0x6a>
    19a8:	0015c783          	lbu	a5,1(a1)
    19ac:	0505                	addi	a0,a0,1
    19ae:	0585                	addi	a1,a1,1
    19b0:	00f50023          	sb	a5,0(a0)
    19b4:	fbf5                	bnez	a5,19a8 <strcpy+0x44>
        ;
    return d;
}
    19b6:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19b8:	0505                	addi	a0,a0,1
    19ba:	df45                	beqz	a4,1972 <strcpy+0xe>
            if (!(*d = *s))
    19bc:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19c0:	0585                	addi	a1,a1,1
    19c2:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    19c6:	00f50023          	sb	a5,0(a0)
    19ca:	f7fd                	bnez	a5,19b8 <strcpy+0x54>
}
    19cc:	8082                	ret
    19ce:	8082                	ret

00000000000019d0 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19d0:	00b547b3          	xor	a5,a0,a1
    19d4:	8b9d                	andi	a5,a5,7
    19d6:	1a079863          	bnez	a5,1b86 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19da:	0075f793          	andi	a5,a1,7
    19de:	16078463          	beqz	a5,1b46 <strncpy+0x176>
    19e2:	ea01                	bnez	a2,19f2 <strncpy+0x22>
    19e4:	a421                	j	1bec <strncpy+0x21c>
    19e6:	167d                	addi	a2,a2,-1
    19e8:	0505                	addi	a0,a0,1
    19ea:	14070e63          	beqz	a4,1b46 <strncpy+0x176>
    19ee:	1a060863          	beqz	a2,1b9e <strncpy+0x1ce>
    19f2:	0005c783          	lbu	a5,0(a1)
    19f6:	0585                	addi	a1,a1,1
    19f8:	0075f713          	andi	a4,a1,7
    19fc:	00f50023          	sb	a5,0(a0)
    1a00:	f3fd                	bnez	a5,19e6 <strncpy+0x16>
    1a02:	4805                	li	a6,1
    1a04:	1a061863          	bnez	a2,1bb4 <strncpy+0x1e4>
    1a08:	40a007b3          	neg	a5,a0
    1a0c:	8b9d                	andi	a5,a5,7
    1a0e:	4681                	li	a3,0
    1a10:	18061a63          	bnez	a2,1ba4 <strncpy+0x1d4>
    1a14:	00778713          	addi	a4,a5,7
    1a18:	45ad                	li	a1,11
    1a1a:	18b76363          	bltu	a4,a1,1ba0 <strncpy+0x1d0>
    1a1e:	1ae6eb63          	bltu	a3,a4,1bd4 <strncpy+0x204>
    1a22:	1a078363          	beqz	a5,1bc8 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a26:	00050023          	sb	zero,0(a0)
    1a2a:	4685                	li	a3,1
    1a2c:	00150713          	addi	a4,a0,1
    1a30:	18d78f63          	beq	a5,a3,1bce <strncpy+0x1fe>
    1a34:	000500a3          	sb	zero,1(a0)
    1a38:	4689                	li	a3,2
    1a3a:	00250713          	addi	a4,a0,2
    1a3e:	18d78e63          	beq	a5,a3,1bda <strncpy+0x20a>
    1a42:	00050123          	sb	zero,2(a0)
    1a46:	468d                	li	a3,3
    1a48:	00350713          	addi	a4,a0,3
    1a4c:	16d78c63          	beq	a5,a3,1bc4 <strncpy+0x1f4>
    1a50:	000501a3          	sb	zero,3(a0)
    1a54:	4691                	li	a3,4
    1a56:	00450713          	addi	a4,a0,4
    1a5a:	18d78263          	beq	a5,a3,1bde <strncpy+0x20e>
    1a5e:	00050223          	sb	zero,4(a0)
    1a62:	4695                	li	a3,5
    1a64:	00550713          	addi	a4,a0,5
    1a68:	16d78d63          	beq	a5,a3,1be2 <strncpy+0x212>
    1a6c:	000502a3          	sb	zero,5(a0)
    1a70:	469d                	li	a3,7
    1a72:	00650713          	addi	a4,a0,6
    1a76:	16d79863          	bne	a5,a3,1be6 <strncpy+0x216>
    1a7a:	00750713          	addi	a4,a0,7
    1a7e:	00050323          	sb	zero,6(a0)
    1a82:	40f80833          	sub	a6,a6,a5
    1a86:	ff887593          	andi	a1,a6,-8
    1a8a:	97aa                	add	a5,a5,a0
    1a8c:	95be                	add	a1,a1,a5
    1a8e:	0007b023          	sd	zero,0(a5)
    1a92:	07a1                	addi	a5,a5,8
    1a94:	feb79de3          	bne	a5,a1,1a8e <strncpy+0xbe>
    1a98:	ff887593          	andi	a1,a6,-8
    1a9c:	9ead                	addw	a3,a3,a1
    1a9e:	00b707b3          	add	a5,a4,a1
    1aa2:	12b80863          	beq	a6,a1,1bd2 <strncpy+0x202>
    1aa6:	00078023          	sb	zero,0(a5)
    1aaa:	0016871b          	addiw	a4,a3,1
    1aae:	0ec77863          	bgeu	a4,a2,1b9e <strncpy+0x1ce>
    1ab2:	000780a3          	sb	zero,1(a5)
    1ab6:	0026871b          	addiw	a4,a3,2
    1aba:	0ec77263          	bgeu	a4,a2,1b9e <strncpy+0x1ce>
    1abe:	00078123          	sb	zero,2(a5)
    1ac2:	0036871b          	addiw	a4,a3,3
    1ac6:	0cc77c63          	bgeu	a4,a2,1b9e <strncpy+0x1ce>
    1aca:	000781a3          	sb	zero,3(a5)
    1ace:	0046871b          	addiw	a4,a3,4
    1ad2:	0cc77663          	bgeu	a4,a2,1b9e <strncpy+0x1ce>
    1ad6:	00078223          	sb	zero,4(a5)
    1ada:	0056871b          	addiw	a4,a3,5
    1ade:	0cc77063          	bgeu	a4,a2,1b9e <strncpy+0x1ce>
    1ae2:	000782a3          	sb	zero,5(a5)
    1ae6:	0066871b          	addiw	a4,a3,6
    1aea:	0ac77a63          	bgeu	a4,a2,1b9e <strncpy+0x1ce>
    1aee:	00078323          	sb	zero,6(a5)
    1af2:	0076871b          	addiw	a4,a3,7
    1af6:	0ac77463          	bgeu	a4,a2,1b9e <strncpy+0x1ce>
    1afa:	000783a3          	sb	zero,7(a5)
    1afe:	0086871b          	addiw	a4,a3,8
    1b02:	08c77e63          	bgeu	a4,a2,1b9e <strncpy+0x1ce>
    1b06:	00078423          	sb	zero,8(a5)
    1b0a:	0096871b          	addiw	a4,a3,9
    1b0e:	08c77863          	bgeu	a4,a2,1b9e <strncpy+0x1ce>
    1b12:	000784a3          	sb	zero,9(a5)
    1b16:	00a6871b          	addiw	a4,a3,10
    1b1a:	08c77263          	bgeu	a4,a2,1b9e <strncpy+0x1ce>
    1b1e:	00078523          	sb	zero,10(a5)
    1b22:	00b6871b          	addiw	a4,a3,11
    1b26:	06c77c63          	bgeu	a4,a2,1b9e <strncpy+0x1ce>
    1b2a:	000785a3          	sb	zero,11(a5)
    1b2e:	00c6871b          	addiw	a4,a3,12
    1b32:	06c77663          	bgeu	a4,a2,1b9e <strncpy+0x1ce>
    1b36:	00078623          	sb	zero,12(a5)
    1b3a:	26b5                	addiw	a3,a3,13
    1b3c:	06c6f163          	bgeu	a3,a2,1b9e <strncpy+0x1ce>
    1b40:	000786a3          	sb	zero,13(a5)
    1b44:	8082                	ret
            ;
        if (!n || !*s)
    1b46:	c645                	beqz	a2,1bee <strncpy+0x21e>
    1b48:	0005c783          	lbu	a5,0(a1)
    1b4c:	ea078be3          	beqz	a5,1a02 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b50:	479d                	li	a5,7
    1b52:	02c7ff63          	bgeu	a5,a2,1b90 <strncpy+0x1c0>
    1b56:	00000897          	auipc	a7,0x0
    1b5a:	3da8b883          	ld	a7,986(a7) # 1f30 <__clone+0xca>
    1b5e:	00000817          	auipc	a6,0x0
    1b62:	3da83803          	ld	a6,986(a6) # 1f38 <__clone+0xd2>
    1b66:	431d                	li	t1,7
    1b68:	6198                	ld	a4,0(a1)
    1b6a:	011707b3          	add	a5,a4,a7
    1b6e:	fff74693          	not	a3,a4
    1b72:	8ff5                	and	a5,a5,a3
    1b74:	0107f7b3          	and	a5,a5,a6
    1b78:	ef81                	bnez	a5,1b90 <strncpy+0x1c0>
            *wd = *ws;
    1b7a:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b7c:	1661                	addi	a2,a2,-8
    1b7e:	05a1                	addi	a1,a1,8
    1b80:	0521                	addi	a0,a0,8
    1b82:	fec363e3          	bltu	t1,a2,1b68 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b86:	e609                	bnez	a2,1b90 <strncpy+0x1c0>
    1b88:	a08d                	j	1bea <strncpy+0x21a>
    1b8a:	167d                	addi	a2,a2,-1
    1b8c:	0505                	addi	a0,a0,1
    1b8e:	ca01                	beqz	a2,1b9e <strncpy+0x1ce>
    1b90:	0005c783          	lbu	a5,0(a1)
    1b94:	0585                	addi	a1,a1,1
    1b96:	00f50023          	sb	a5,0(a0)
    1b9a:	fbe5                	bnez	a5,1b8a <strncpy+0x1ba>
        ;
tail:
    1b9c:	b59d                	j	1a02 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1b9e:	8082                	ret
    1ba0:	472d                	li	a4,11
    1ba2:	bdb5                	j	1a1e <strncpy+0x4e>
    1ba4:	00778713          	addi	a4,a5,7
    1ba8:	45ad                	li	a1,11
    1baa:	fff60693          	addi	a3,a2,-1
    1bae:	e6b778e3          	bgeu	a4,a1,1a1e <strncpy+0x4e>
    1bb2:	b7fd                	j	1ba0 <strncpy+0x1d0>
    1bb4:	40a007b3          	neg	a5,a0
    1bb8:	8832                	mv	a6,a2
    1bba:	8b9d                	andi	a5,a5,7
    1bbc:	4681                	li	a3,0
    1bbe:	e4060be3          	beqz	a2,1a14 <strncpy+0x44>
    1bc2:	b7cd                	j	1ba4 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bc4:	468d                	li	a3,3
    1bc6:	bd75                	j	1a82 <strncpy+0xb2>
    1bc8:	872a                	mv	a4,a0
    1bca:	4681                	li	a3,0
    1bcc:	bd5d                	j	1a82 <strncpy+0xb2>
    1bce:	4685                	li	a3,1
    1bd0:	bd4d                	j	1a82 <strncpy+0xb2>
    1bd2:	8082                	ret
    1bd4:	87aa                	mv	a5,a0
    1bd6:	4681                	li	a3,0
    1bd8:	b5f9                	j	1aa6 <strncpy+0xd6>
    1bda:	4689                	li	a3,2
    1bdc:	b55d                	j	1a82 <strncpy+0xb2>
    1bde:	4691                	li	a3,4
    1be0:	b54d                	j	1a82 <strncpy+0xb2>
    1be2:	4695                	li	a3,5
    1be4:	bd79                	j	1a82 <strncpy+0xb2>
    1be6:	4699                	li	a3,6
    1be8:	bd69                	j	1a82 <strncpy+0xb2>
    1bea:	8082                	ret
    1bec:	8082                	ret
    1bee:	8082                	ret

0000000000001bf0 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1bf0:	87aa                	mv	a5,a0
    1bf2:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1bf4:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1bf8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1bfc:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1bfe:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c00:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c04:	2501                	sext.w	a0,a0
    1c06:	8082                	ret

0000000000001c08 <openat>:
    register long a7 __asm__("a7") = n;
    1c08:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c0c:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c10:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c14:	2501                	sext.w	a0,a0
    1c16:	8082                	ret

0000000000001c18 <close>:
    register long a7 __asm__("a7") = n;
    1c18:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c1c:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c20:	2501                	sext.w	a0,a0
    1c22:	8082                	ret

0000000000001c24 <read>:
    register long a7 __asm__("a7") = n;
    1c24:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c28:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c2c:	8082                	ret

0000000000001c2e <write>:
    register long a7 __asm__("a7") = n;
    1c2e:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c32:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c36:	8082                	ret

0000000000001c38 <getpid>:
    register long a7 __asm__("a7") = n;
    1c38:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c3c:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c40:	2501                	sext.w	a0,a0
    1c42:	8082                	ret

0000000000001c44 <getppid>:
    register long a7 __asm__("a7") = n;
    1c44:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c48:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c4c:	2501                	sext.w	a0,a0
    1c4e:	8082                	ret

0000000000001c50 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c50:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c54:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c58:	2501                	sext.w	a0,a0
    1c5a:	8082                	ret

0000000000001c5c <fork>:
    register long a7 __asm__("a7") = n;
    1c5c:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c60:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c62:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c64:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c68:	2501                	sext.w	a0,a0
    1c6a:	8082                	ret

0000000000001c6c <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c6c:	85b2                	mv	a1,a2
    1c6e:	863a                	mv	a2,a4
    if (stack)
    1c70:	c191                	beqz	a1,1c74 <clone+0x8>
	stack += stack_size;
    1c72:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c74:	4781                	li	a5,0
    1c76:	4701                	li	a4,0
    1c78:	4681                	li	a3,0
    1c7a:	2601                	sext.w	a2,a2
    1c7c:	a2ed                	j	1e66 <__clone>

0000000000001c7e <exit>:
    register long a7 __asm__("a7") = n;
    1c7e:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c82:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c86:	8082                	ret

0000000000001c88 <waitpid>:
    register long a7 __asm__("a7") = n;
    1c88:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c8c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c8e:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c92:	2501                	sext.w	a0,a0
    1c94:	8082                	ret

0000000000001c96 <exec>:
    register long a7 __asm__("a7") = n;
    1c96:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1c9a:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1c9e:	2501                	sext.w	a0,a0
    1ca0:	8082                	ret

0000000000001ca2 <execve>:
    register long a7 __asm__("a7") = n;
    1ca2:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ca6:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1caa:	2501                	sext.w	a0,a0
    1cac:	8082                	ret

0000000000001cae <times>:
    register long a7 __asm__("a7") = n;
    1cae:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cb2:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cb6:	2501                	sext.w	a0,a0
    1cb8:	8082                	ret

0000000000001cba <get_time>:

int64 get_time()
{
    1cba:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cbc:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cc0:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cc2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cc4:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cc8:	2501                	sext.w	a0,a0
    1cca:	ed09                	bnez	a0,1ce4 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ccc:	67a2                	ld	a5,8(sp)
    1cce:	3e800713          	li	a4,1000
    1cd2:	00015503          	lhu	a0,0(sp)
    1cd6:	02e7d7b3          	divu	a5,a5,a4
    1cda:	02e50533          	mul	a0,a0,a4
    1cde:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1ce0:	0141                	addi	sp,sp,16
    1ce2:	8082                	ret
        return -1;
    1ce4:	557d                	li	a0,-1
    1ce6:	bfed                	j	1ce0 <get_time+0x26>

0000000000001ce8 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1ce8:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cec:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1cf0:	2501                	sext.w	a0,a0
    1cf2:	8082                	ret

0000000000001cf4 <time>:
    register long a7 __asm__("a7") = n;
    1cf4:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1cf8:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1cfc:	2501                	sext.w	a0,a0
    1cfe:	8082                	ret

0000000000001d00 <sleep>:

int sleep(unsigned long long time)
{
    1d00:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d02:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d04:	850a                	mv	a0,sp
    1d06:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d08:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d0c:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d0e:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d12:	e501                	bnez	a0,1d1a <sleep+0x1a>
    return 0;
    1d14:	4501                	li	a0,0
}
    1d16:	0141                	addi	sp,sp,16
    1d18:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d1a:	4502                	lw	a0,0(sp)
}
    1d1c:	0141                	addi	sp,sp,16
    1d1e:	8082                	ret

0000000000001d20 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d20:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d24:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d28:	2501                	sext.w	a0,a0
    1d2a:	8082                	ret

0000000000001d2c <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d2c:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d30:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d34:	8082                	ret

0000000000001d36 <munmap>:
    register long a7 __asm__("a7") = n;
    1d36:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d3a:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d3e:	2501                	sext.w	a0,a0
    1d40:	8082                	ret

0000000000001d42 <wait>:

int wait(int *code)
{
    1d42:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d44:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d48:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d4a:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d4c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d4e:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d52:	2501                	sext.w	a0,a0
    1d54:	8082                	ret

0000000000001d56 <spawn>:
    register long a7 __asm__("a7") = n;
    1d56:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d5a:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d5e:	2501                	sext.w	a0,a0
    1d60:	8082                	ret

0000000000001d62 <mailread>:
    register long a7 __asm__("a7") = n;
    1d62:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d66:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d6a:	2501                	sext.w	a0,a0
    1d6c:	8082                	ret

0000000000001d6e <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d6e:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d72:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d76:	2501                	sext.w	a0,a0
    1d78:	8082                	ret

0000000000001d7a <fstat>:
    register long a7 __asm__("a7") = n;
    1d7a:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d7e:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d82:	2501                	sext.w	a0,a0
    1d84:	8082                	ret

0000000000001d86 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d86:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d88:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d8c:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d8e:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d92:	2501                	sext.w	a0,a0
    1d94:	8082                	ret

0000000000001d96 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1d96:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d98:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1d9c:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d9e:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1da2:	2501                	sext.w	a0,a0
    1da4:	8082                	ret

0000000000001da6 <link>:

int link(char *old_path, char *new_path)
{
    1da6:	87aa                	mv	a5,a0
    1da8:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1daa:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1dae:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1db2:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1db4:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1db8:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dba:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <unlink>:

int unlink(char *path)
{
    1dc2:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dc4:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1dc8:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1dcc:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dce:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1dd2:	2501                	sext.w	a0,a0
    1dd4:	8082                	ret

0000000000001dd6 <uname>:
    register long a7 __asm__("a7") = n;
    1dd6:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1dda:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1dde:	2501                	sext.w	a0,a0
    1de0:	8082                	ret

0000000000001de2 <brk>:
    register long a7 __asm__("a7") = n;
    1de2:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1de6:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1dea:	2501                	sext.w	a0,a0
    1dec:	8082                	ret

0000000000001dee <getcwd>:
    register long a7 __asm__("a7") = n;
    1dee:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df0:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1df4:	8082                	ret

0000000000001df6 <chdir>:
    register long a7 __asm__("a7") = n;
    1df6:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1dfa:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1dfe:	2501                	sext.w	a0,a0
    1e00:	8082                	ret

0000000000001e02 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e02:	862e                	mv	a2,a1
    1e04:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e06:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e08:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e0c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e10:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e12:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e14:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e18:	2501                	sext.w	a0,a0
    1e1a:	8082                	ret

0000000000001e1c <getdents>:
    register long a7 __asm__("a7") = n;
    1e1c:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e20:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e24:	2501                	sext.w	a0,a0
    1e26:	8082                	ret

0000000000001e28 <pipe>:
    register long a7 __asm__("a7") = n;
    1e28:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e2c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e2e:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <dup>:
    register long a7 __asm__("a7") = n;
    1e36:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e38:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e3c:	2501                	sext.w	a0,a0
    1e3e:	8082                	ret

0000000000001e40 <dup2>:
    register long a7 __asm__("a7") = n;
    1e40:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e42:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e44:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e48:	2501                	sext.w	a0,a0
    1e4a:	8082                	ret

0000000000001e4c <mount>:
    register long a7 __asm__("a7") = n;
    1e4c:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e50:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e54:	2501                	sext.w	a0,a0
    1e56:	8082                	ret

0000000000001e58 <umount>:
    register long a7 __asm__("a7") = n;
    1e58:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e5c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5e:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e62:	2501                	sext.w	a0,a0
    1e64:	8082                	ret

0000000000001e66 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e66:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e68:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e6a:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e6c:	8532                	mv	a0,a2
	mv a2, a4
    1e6e:	863a                	mv	a2,a4
	mv a3, a5
    1e70:	86be                	mv	a3,a5
	mv a4, a6
    1e72:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e74:	0dc00893          	li	a7,220
	ecall
    1e78:	00000073          	ecall

	beqz a0, 1f
    1e7c:	c111                	beqz	a0,1e80 <__clone+0x1a>
	# Parent
	ret
    1e7e:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e80:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e82:	6522                	ld	a0,8(sp)
	jalr a1
    1e84:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e86:	05d00893          	li	a7,93
	ecall
    1e8a:	00000073          	ecall
