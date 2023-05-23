
/home/lmq/lmq/cscc/xv6-k210/test/build/riscv64/test_echo:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a83d                	j	1040 <__start_main>

0000000000001004 <main>:

/*
 * for execve
 */

int main(int argc, char *argv[]){
    1004:	1141                	addi	sp,sp,-16
    printf("  I am test_echo.\nexecve success.\n");
    1006:	00001517          	auipc	a0,0x1
    100a:	df250513          	addi	a0,a0,-526 # 1df8 <__clone+0x28>
int main(int argc, char *argv[]){
    100e:	e406                	sd	ra,8(sp)
    printf("  I am test_echo.\nexecve success.\n");
    1010:	250000ef          	jal	ra,1260 <printf>
    TEST_END(__func__);
    1014:	00001517          	auipc	a0,0x1
    1018:	e0c50513          	addi	a0,a0,-500 # 1e20 <__clone+0x50>
    101c:	222000ef          	jal	ra,123e <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	e2850513          	addi	a0,a0,-472 # 1e48 <__func__.986>
    1028:	216000ef          	jal	ra,123e <puts>
    102c:	00001517          	auipc	a0,0x1
    1030:	e0450513          	addi	a0,a0,-508 # 1e30 <__clone+0x60>
    1034:	20a000ef          	jal	ra,123e <puts>
    return 0;
}
    1038:	60a2                	ld	ra,8(sp)
    103a:	4501                	li	a0,0
    103c:	0141                	addi	sp,sp,16
    103e:	8082                	ret

0000000000001040 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1040:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1042:	4108                	lw	a0,0(a0)
{
    1044:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1046:	05a1                	addi	a1,a1,8
{
    1048:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    104a:	fbbff0ef          	jal	ra,1004 <main>
    104e:	39b000ef          	jal	ra,1be8 <exit>
	return 0;
}
    1052:	60a2                	ld	ra,8(sp)
    1054:	4501                	li	a0,0
    1056:	0141                	addi	sp,sp,16
    1058:	8082                	ret

000000000000105a <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    105a:	7179                	addi	sp,sp,-48
    105c:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    105e:	12054b63          	bltz	a0,1194 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1062:	02b577bb          	remuw	a5,a0,a1
    1066:	00001697          	auipc	a3,0x1
    106a:	e0268693          	addi	a3,a3,-510 # 1e68 <digits>
    buf[16] = 0;
    106e:	00010c23          	sb	zero,24(sp)
    i = 15;
    1072:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    1076:	1782                	slli	a5,a5,0x20
    1078:	9381                	srli	a5,a5,0x20
    107a:	97b6                	add	a5,a5,a3
    107c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1080:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1084:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1088:	16b56263          	bltu	a0,a1,11ec <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    108c:	02e8763b          	remuw	a2,a6,a4
    1090:	1602                	slli	a2,a2,0x20
    1092:	9201                	srli	a2,a2,0x20
    1094:	9636                	add	a2,a2,a3
    1096:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    109a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    109e:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10a2:	12e86963          	bltu	a6,a4,11d4 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    10a6:	02e5f63b          	remuw	a2,a1,a4
    10aa:	1602                	slli	a2,a2,0x20
    10ac:	9201                	srli	a2,a2,0x20
    10ae:	9636                	add	a2,a2,a3
    10b0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10b4:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    10b8:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    10bc:	10e5ef63          	bltu	a1,a4,11da <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    10c0:	02e8763b          	remuw	a2,a6,a4
    10c4:	1602                	slli	a2,a2,0x20
    10c6:	9201                	srli	a2,a2,0x20
    10c8:	9636                	add	a2,a2,a3
    10ca:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10ce:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    10d2:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    10d6:	10e86563          	bltu	a6,a4,11e0 <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    10da:	02e5f63b          	remuw	a2,a1,a4
    10de:	1602                	slli	a2,a2,0x20
    10e0:	9201                	srli	a2,a2,0x20
    10e2:	9636                	add	a2,a2,a3
    10e4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10e8:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    10ec:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    10f0:	0ee5eb63          	bltu	a1,a4,11e6 <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    10f4:	02e8763b          	remuw	a2,a6,a4
    10f8:	1602                	slli	a2,a2,0x20
    10fa:	9201                	srli	a2,a2,0x20
    10fc:	9636                	add	a2,a2,a3
    10fe:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1102:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1106:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    110a:	0ce86263          	bltu	a6,a4,11ce <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    110e:	02e5f63b          	remuw	a2,a1,a4
    1112:	1602                	slli	a2,a2,0x20
    1114:	9201                	srli	a2,a2,0x20
    1116:	9636                	add	a2,a2,a3
    1118:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    111c:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1120:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1124:	0ce5e663          	bltu	a1,a4,11f0 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    1128:	02e8763b          	remuw	a2,a6,a4
    112c:	1602                	slli	a2,a2,0x20
    112e:	9201                	srli	a2,a2,0x20
    1130:	9636                	add	a2,a2,a3
    1132:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1136:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    113a:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    113e:	0ae86c63          	bltu	a6,a4,11f6 <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    1142:	02e5f63b          	remuw	a2,a1,a4
    1146:	1602                	slli	a2,a2,0x20
    1148:	9201                	srli	a2,a2,0x20
    114a:	9636                	add	a2,a2,a3
    114c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1150:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1154:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1158:	0ae5e263          	bltu	a1,a4,11fc <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    115c:	1782                	slli	a5,a5,0x20
    115e:	9381                	srli	a5,a5,0x20
    1160:	97b6                	add	a5,a5,a3
    1162:	0007c703          	lbu	a4,0(a5)
    1166:	4599                	li	a1,6
    1168:	4795                	li	a5,5
    116a:	00e10723          	sb	a4,14(sp)

    if (sign)
    116e:	00055963          	bgez	a0,1180 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1172:	1018                	addi	a4,sp,32
    1174:	973e                	add	a4,a4,a5
    1176:	02d00693          	li	a3,45
    117a:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    117e:	85be                	mv	a1,a5
    write(f, s, l);
    1180:	003c                	addi	a5,sp,8
    1182:	4641                	li	a2,16
    1184:	9e0d                	subw	a2,a2,a1
    1186:	4505                	li	a0,1
    1188:	95be                	add	a1,a1,a5
    118a:	20f000ef          	jal	ra,1b98 <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    118e:	70a2                	ld	ra,40(sp)
    1190:	6145                	addi	sp,sp,48
    1192:	8082                	ret
        x = -xx;
    1194:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1198:	02b677bb          	remuw	a5,a2,a1
    119c:	00001697          	auipc	a3,0x1
    11a0:	ccc68693          	addi	a3,a3,-820 # 1e68 <digits>
    buf[16] = 0;
    11a4:	00010c23          	sb	zero,24(sp)
    i = 15;
    11a8:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    11ac:	1782                	slli	a5,a5,0x20
    11ae:	9381                	srli	a5,a5,0x20
    11b0:	97b6                	add	a5,a5,a3
    11b2:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    11b6:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11ba:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    11be:	ecb677e3          	bgeu	a2,a1,108c <printint.constprop.0+0x32>
        buf[i--] = '-';
    11c2:	02d00793          	li	a5,45
    11c6:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    11ca:	45b9                	li	a1,14
    11cc:	bf55                	j	1180 <printint.constprop.0+0x126>
    11ce:	47a5                	li	a5,9
    11d0:	45a9                	li	a1,10
    11d2:	bf71                	j	116e <printint.constprop.0+0x114>
    11d4:	47b5                	li	a5,13
    11d6:	45b9                	li	a1,14
    11d8:	bf59                	j	116e <printint.constprop.0+0x114>
    11da:	47b1                	li	a5,12
    11dc:	45b5                	li	a1,13
    11de:	bf41                	j	116e <printint.constprop.0+0x114>
    11e0:	47ad                	li	a5,11
    11e2:	45b1                	li	a1,12
    11e4:	b769                	j	116e <printint.constprop.0+0x114>
    11e6:	47a9                	li	a5,10
    11e8:	45ad                	li	a1,11
    11ea:	b751                	j	116e <printint.constprop.0+0x114>
    i = 15;
    11ec:	45bd                	li	a1,15
    11ee:	bf49                	j	1180 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    11f0:	47a1                	li	a5,8
    11f2:	45a5                	li	a1,9
    11f4:	bfad                	j	116e <printint.constprop.0+0x114>
    11f6:	479d                	li	a5,7
    11f8:	45a1                	li	a1,8
    11fa:	bf95                	j	116e <printint.constprop.0+0x114>
    11fc:	4799                	li	a5,6
    11fe:	459d                	li	a1,7
    1200:	b7bd                	j	116e <printint.constprop.0+0x114>

0000000000001202 <getchar>:
{
    1202:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1204:	00f10593          	addi	a1,sp,15
    1208:	4605                	li	a2,1
    120a:	4501                	li	a0,0
{
    120c:	ec06                	sd	ra,24(sp)
    char byte = 0;
    120e:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1212:	17d000ef          	jal	ra,1b8e <read>
}
    1216:	60e2                	ld	ra,24(sp)
    1218:	00f14503          	lbu	a0,15(sp)
    121c:	6105                	addi	sp,sp,32
    121e:	8082                	ret

0000000000001220 <putchar>:
{
    1220:	1101                	addi	sp,sp,-32
    1222:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1224:	00f10593          	addi	a1,sp,15
    1228:	4605                	li	a2,1
    122a:	4505                	li	a0,1
{
    122c:	ec06                	sd	ra,24(sp)
    char byte = c;
    122e:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1232:	167000ef          	jal	ra,1b98 <write>
}
    1236:	60e2                	ld	ra,24(sp)
    1238:	2501                	sext.w	a0,a0
    123a:	6105                	addi	sp,sp,32
    123c:	8082                	ret

000000000000123e <puts>:
{
    123e:	1141                	addi	sp,sp,-16
    1240:	e406                	sd	ra,8(sp)
    1242:	e022                	sd	s0,0(sp)
    1244:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1246:	56e000ef          	jal	ra,17b4 <strlen>
    124a:	862a                	mv	a2,a0
    124c:	85a2                	mv	a1,s0
    124e:	4505                	li	a0,1
    1250:	149000ef          	jal	ra,1b98 <write>
}
    1254:	60a2                	ld	ra,8(sp)
    1256:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1258:	957d                	srai	a0,a0,0x3f
    return r;
    125a:	2501                	sext.w	a0,a0
}
    125c:	0141                	addi	sp,sp,16
    125e:	8082                	ret

0000000000001260 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1260:	7171                	addi	sp,sp,-176
    1262:	fc56                	sd	s5,56(sp)
    1264:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1266:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1268:	18bc                	addi	a5,sp,120
{
    126a:	e8ca                	sd	s2,80(sp)
    126c:	e4ce                	sd	s3,72(sp)
    126e:	e0d2                	sd	s4,64(sp)
    1270:	f85a                	sd	s6,48(sp)
    1272:	f486                	sd	ra,104(sp)
    1274:	f0a2                	sd	s0,96(sp)
    1276:	eca6                	sd	s1,88(sp)
    1278:	fcae                	sd	a1,120(sp)
    127a:	e132                	sd	a2,128(sp)
    127c:	e536                	sd	a3,136(sp)
    127e:	e93a                	sd	a4,144(sp)
    1280:	f142                	sd	a6,160(sp)
    1282:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1284:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1286:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    128a:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    128e:	00001b17          	auipc	s6,0x1
    1292:	bb2b0b13          	addi	s6,s6,-1102 # 1e40 <__clone+0x70>
    buf[i++] = '0';
    1296:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    129a:	00001997          	auipc	s3,0x1
    129e:	bce98993          	addi	s3,s3,-1074 # 1e68 <digits>
        if (!*s)
    12a2:	00054783          	lbu	a5,0(a0)
    12a6:	16078a63          	beqz	a5,141a <printf+0x1ba>
    12aa:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    12ac:	19278163          	beq	a5,s2,142e <printf+0x1ce>
    12b0:	00164783          	lbu	a5,1(a2)
    12b4:	0605                	addi	a2,a2,1
    12b6:	fbfd                	bnez	a5,12ac <printf+0x4c>
    12b8:	84b2                	mv	s1,a2
        l = z - a;
    12ba:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    12be:	85aa                	mv	a1,a0
    12c0:	8622                	mv	a2,s0
    12c2:	4505                	li	a0,1
    12c4:	0d5000ef          	jal	ra,1b98 <write>
        if (l)
    12c8:	18041c63          	bnez	s0,1460 <printf+0x200>
        if (s[1] == 0)
    12cc:	0014c783          	lbu	a5,1(s1)
    12d0:	14078563          	beqz	a5,141a <printf+0x1ba>
        switch (s[1])
    12d4:	1d478063          	beq	a5,s4,1494 <printf+0x234>
    12d8:	18fa6663          	bltu	s4,a5,1464 <printf+0x204>
    12dc:	06400713          	li	a4,100
    12e0:	1ae78063          	beq	a5,a4,1480 <printf+0x220>
    12e4:	07000713          	li	a4,112
    12e8:	1ce79963          	bne	a5,a4,14ba <printf+0x25a>
            printptr(va_arg(ap, uint64));
    12ec:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    12ee:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    12f2:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    12f4:	631c                	ld	a5,0(a4)
    12f6:	0721                	addi	a4,a4,8
    12f8:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    12fa:	00479293          	slli	t0,a5,0x4
    12fe:	00879f93          	slli	t6,a5,0x8
    1302:	00c79f13          	slli	t5,a5,0xc
    1306:	01079e93          	slli	t4,a5,0x10
    130a:	01479e13          	slli	t3,a5,0x14
    130e:	01879313          	slli	t1,a5,0x18
    1312:	01c79893          	slli	a7,a5,0x1c
    1316:	02479813          	slli	a6,a5,0x24
    131a:	02879513          	slli	a0,a5,0x28
    131e:	02c79593          	slli	a1,a5,0x2c
    1322:	03079693          	slli	a3,a5,0x30
    1326:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    132a:	03c7d413          	srli	s0,a5,0x3c
    132e:	01c7d39b          	srliw	t2,a5,0x1c
    1332:	03c2d293          	srli	t0,t0,0x3c
    1336:	03cfdf93          	srli	t6,t6,0x3c
    133a:	03cf5f13          	srli	t5,t5,0x3c
    133e:	03cede93          	srli	t4,t4,0x3c
    1342:	03ce5e13          	srli	t3,t3,0x3c
    1346:	03c35313          	srli	t1,t1,0x3c
    134a:	03c8d893          	srli	a7,a7,0x3c
    134e:	03c85813          	srli	a6,a6,0x3c
    1352:	9171                	srli	a0,a0,0x3c
    1354:	91f1                	srli	a1,a1,0x3c
    1356:	92f1                	srli	a3,a3,0x3c
    1358:	9371                	srli	a4,a4,0x3c
    135a:	96ce                	add	a3,a3,s3
    135c:	974e                	add	a4,a4,s3
    135e:	944e                	add	s0,s0,s3
    1360:	92ce                	add	t0,t0,s3
    1362:	9fce                	add	t6,t6,s3
    1364:	9f4e                	add	t5,t5,s3
    1366:	9ece                	add	t4,t4,s3
    1368:	9e4e                	add	t3,t3,s3
    136a:	934e                	add	t1,t1,s3
    136c:	98ce                	add	a7,a7,s3
    136e:	93ce                	add	t2,t2,s3
    1370:	984e                	add	a6,a6,s3
    1372:	954e                	add	a0,a0,s3
    1374:	95ce                	add	a1,a1,s3
    1376:	0006c083          	lbu	ra,0(a3)
    137a:	0002c283          	lbu	t0,0(t0)
    137e:	00074683          	lbu	a3,0(a4)
    1382:	000fcf83          	lbu	t6,0(t6)
    1386:	000f4f03          	lbu	t5,0(t5)
    138a:	000ece83          	lbu	t4,0(t4)
    138e:	000e4e03          	lbu	t3,0(t3)
    1392:	00034303          	lbu	t1,0(t1)
    1396:	0008c883          	lbu	a7,0(a7)
    139a:	0003c383          	lbu	t2,0(t2)
    139e:	00084803          	lbu	a6,0(a6)
    13a2:	00054503          	lbu	a0,0(a0)
    13a6:	0005c583          	lbu	a1,0(a1)
    13aa:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13ae:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13b2:	9371                	srli	a4,a4,0x3c
    13b4:	8bbd                	andi	a5,a5,15
    13b6:	974e                	add	a4,a4,s3
    13b8:	97ce                	add	a5,a5,s3
    13ba:	005105a3          	sb	t0,11(sp)
    13be:	01f10623          	sb	t6,12(sp)
    13c2:	01e106a3          	sb	t5,13(sp)
    13c6:	01d10723          	sb	t4,14(sp)
    13ca:	01c107a3          	sb	t3,15(sp)
    13ce:	00610823          	sb	t1,16(sp)
    13d2:	011108a3          	sb	a7,17(sp)
    13d6:	00710923          	sb	t2,18(sp)
    13da:	010109a3          	sb	a6,19(sp)
    13de:	00a10a23          	sb	a0,20(sp)
    13e2:	00b10aa3          	sb	a1,21(sp)
    13e6:	00110b23          	sb	ra,22(sp)
    13ea:	00d10ba3          	sb	a3,23(sp)
    13ee:	00810523          	sb	s0,10(sp)
    13f2:	00074703          	lbu	a4,0(a4)
    13f6:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    13fa:	002c                	addi	a1,sp,8
    13fc:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13fe:	00e10c23          	sb	a4,24(sp)
    1402:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1406:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    140a:	78e000ef          	jal	ra,1b98 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    140e:	00248513          	addi	a0,s1,2
        if (!*s)
    1412:	00054783          	lbu	a5,0(a0)
    1416:	e8079ae3          	bnez	a5,12aa <printf+0x4a>
    }
    va_end(ap);
}
    141a:	70a6                	ld	ra,104(sp)
    141c:	7406                	ld	s0,96(sp)
    141e:	64e6                	ld	s1,88(sp)
    1420:	6946                	ld	s2,80(sp)
    1422:	69a6                	ld	s3,72(sp)
    1424:	6a06                	ld	s4,64(sp)
    1426:	7ae2                	ld	s5,56(sp)
    1428:	7b42                	ld	s6,48(sp)
    142a:	614d                	addi	sp,sp,176
    142c:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    142e:	00064783          	lbu	a5,0(a2)
    1432:	84b2                	mv	s1,a2
    1434:	01278963          	beq	a5,s2,1446 <printf+0x1e6>
    1438:	b549                	j	12ba <printf+0x5a>
    143a:	0024c783          	lbu	a5,2(s1)
    143e:	0605                	addi	a2,a2,1
    1440:	0489                	addi	s1,s1,2
    1442:	e7279ce3          	bne	a5,s2,12ba <printf+0x5a>
    1446:	0014c783          	lbu	a5,1(s1)
    144a:	ff2788e3          	beq	a5,s2,143a <printf+0x1da>
        l = z - a;
    144e:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1452:	85aa                	mv	a1,a0
    1454:	8622                	mv	a2,s0
    1456:	4505                	li	a0,1
    1458:	740000ef          	jal	ra,1b98 <write>
        if (l)
    145c:	e60408e3          	beqz	s0,12cc <printf+0x6c>
    1460:	8526                	mv	a0,s1
    1462:	b581                	j	12a2 <printf+0x42>
        switch (s[1])
    1464:	07800713          	li	a4,120
    1468:	04e79963          	bne	a5,a4,14ba <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    146c:	6782                	ld	a5,0(sp)
    146e:	45c1                	li	a1,16
    1470:	4388                	lw	a0,0(a5)
    1472:	07a1                	addi	a5,a5,8
    1474:	e03e                	sd	a5,0(sp)
    1476:	be5ff0ef          	jal	ra,105a <printint.constprop.0>
        s += 2;
    147a:	00248513          	addi	a0,s1,2
    147e:	bf51                	j	1412 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    1480:	6782                	ld	a5,0(sp)
    1482:	45a9                	li	a1,10
    1484:	4388                	lw	a0,0(a5)
    1486:	07a1                	addi	a5,a5,8
    1488:	e03e                	sd	a5,0(sp)
    148a:	bd1ff0ef          	jal	ra,105a <printint.constprop.0>
        s += 2;
    148e:	00248513          	addi	a0,s1,2
    1492:	b741                	j	1412 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1494:	6782                	ld	a5,0(sp)
    1496:	6380                	ld	s0,0(a5)
    1498:	07a1                	addi	a5,a5,8
    149a:	e03e                	sd	a5,0(sp)
    149c:	c421                	beqz	s0,14e4 <printf+0x284>
            l = strnlen(a, 200);
    149e:	0c800593          	li	a1,200
    14a2:	8522                	mv	a0,s0
    14a4:	3fc000ef          	jal	ra,18a0 <strnlen>
    write(f, s, l);
    14a8:	0005061b          	sext.w	a2,a0
    14ac:	85a2                	mv	a1,s0
    14ae:	4505                	li	a0,1
    14b0:	6e8000ef          	jal	ra,1b98 <write>
        s += 2;
    14b4:	00248513          	addi	a0,s1,2
    14b8:	bfa9                	j	1412 <printf+0x1b2>
    char byte = c;
    14ba:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    14be:	4605                	li	a2,1
    14c0:	002c                	addi	a1,sp,8
    14c2:	4505                	li	a0,1
    char byte = c;
    14c4:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    14c8:	6d0000ef          	jal	ra,1b98 <write>
    char byte = c;
    14cc:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    14d0:	4605                	li	a2,1
    14d2:	002c                	addi	a1,sp,8
    14d4:	4505                	li	a0,1
    char byte = c;
    14d6:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    14da:	6be000ef          	jal	ra,1b98 <write>
        s += 2;
    14de:	00248513          	addi	a0,s1,2
    14e2:	bf05                	j	1412 <printf+0x1b2>
                a = "(null)";
    14e4:	845a                	mv	s0,s6
    14e6:	bf65                	j	149e <printf+0x23e>

00000000000014e8 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    14e8:	02000793          	li	a5,32
    14ec:	00f50663          	beq	a0,a5,14f8 <isspace+0x10>
    14f0:	355d                	addiw	a0,a0,-9
    14f2:	00553513          	sltiu	a0,a0,5
    14f6:	8082                	ret
    14f8:	4505                	li	a0,1
}
    14fa:	8082                	ret

00000000000014fc <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    14fc:	fd05051b          	addiw	a0,a0,-48
}
    1500:	00a53513          	sltiu	a0,a0,10
    1504:	8082                	ret

0000000000001506 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1506:	02000613          	li	a2,32
    150a:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    150c:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1510:	ff77069b          	addiw	a3,a4,-9
    1514:	04c70d63          	beq	a4,a2,156e <atoi+0x68>
    1518:	0007079b          	sext.w	a5,a4
    151c:	04d5f963          	bgeu	a1,a3,156e <atoi+0x68>
        s++;
    switch (*s)
    1520:	02b00693          	li	a3,43
    1524:	04d70a63          	beq	a4,a3,1578 <atoi+0x72>
    1528:	02d00693          	li	a3,45
    152c:	06d70463          	beq	a4,a3,1594 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1530:	fd07859b          	addiw	a1,a5,-48
    1534:	4625                	li	a2,9
    1536:	873e                	mv	a4,a5
    1538:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    153a:	4e01                	li	t3,0
    while (isdigit(*s))
    153c:	04b66a63          	bltu	a2,a1,1590 <atoi+0x8a>
    int n = 0, neg = 0;
    1540:	4501                	li	a0,0
    while (isdigit(*s))
    1542:	4825                	li	a6,9
    1544:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1548:	0025179b          	slliw	a5,a0,0x2
    154c:	9d3d                	addw	a0,a0,a5
    154e:	fd07031b          	addiw	t1,a4,-48
    1552:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1556:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    155a:	0685                	addi	a3,a3,1
    155c:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1560:	0006071b          	sext.w	a4,a2
    1564:	feb870e3          	bgeu	a6,a1,1544 <atoi+0x3e>
    return neg ? n : -n;
    1568:	000e0563          	beqz	t3,1572 <atoi+0x6c>
}
    156c:	8082                	ret
        s++;
    156e:	0505                	addi	a0,a0,1
    1570:	bf71                	j	150c <atoi+0x6>
    1572:	4113053b          	subw	a0,t1,a7
    1576:	8082                	ret
    while (isdigit(*s))
    1578:	00154783          	lbu	a5,1(a0)
    157c:	4625                	li	a2,9
        s++;
    157e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1582:	fd07859b          	addiw	a1,a5,-48
    1586:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    158a:	4e01                	li	t3,0
    while (isdigit(*s))
    158c:	fab67ae3          	bgeu	a2,a1,1540 <atoi+0x3a>
    1590:	4501                	li	a0,0
}
    1592:	8082                	ret
    while (isdigit(*s))
    1594:	00154783          	lbu	a5,1(a0)
    1598:	4625                	li	a2,9
        s++;
    159a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    159e:	fd07859b          	addiw	a1,a5,-48
    15a2:	0007871b          	sext.w	a4,a5
    15a6:	feb665e3          	bltu	a2,a1,1590 <atoi+0x8a>
        neg = 1;
    15aa:	4e05                	li	t3,1
    15ac:	bf51                	j	1540 <atoi+0x3a>

00000000000015ae <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    15ae:	16060d63          	beqz	a2,1728 <memset+0x17a>
    15b2:	40a007b3          	neg	a5,a0
    15b6:	8b9d                	andi	a5,a5,7
    15b8:	00778713          	addi	a4,a5,7
    15bc:	482d                	li	a6,11
    15be:	0ff5f593          	andi	a1,a1,255
    15c2:	fff60693          	addi	a3,a2,-1
    15c6:	17076263          	bltu	a4,a6,172a <memset+0x17c>
    15ca:	16e6ea63          	bltu	a3,a4,173e <memset+0x190>
    15ce:	16078563          	beqz	a5,1738 <memset+0x18a>
    15d2:	00b50023          	sb	a1,0(a0)
    15d6:	4705                	li	a4,1
    15d8:	00150e93          	addi	t4,a0,1
    15dc:	14e78c63          	beq	a5,a4,1734 <memset+0x186>
    15e0:	00b500a3          	sb	a1,1(a0)
    15e4:	4709                	li	a4,2
    15e6:	00250e93          	addi	t4,a0,2
    15ea:	14e78d63          	beq	a5,a4,1744 <memset+0x196>
    15ee:	00b50123          	sb	a1,2(a0)
    15f2:	470d                	li	a4,3
    15f4:	00350e93          	addi	t4,a0,3
    15f8:	12e78b63          	beq	a5,a4,172e <memset+0x180>
    15fc:	00b501a3          	sb	a1,3(a0)
    1600:	4711                	li	a4,4
    1602:	00450e93          	addi	t4,a0,4
    1606:	14e78163          	beq	a5,a4,1748 <memset+0x19a>
    160a:	00b50223          	sb	a1,4(a0)
    160e:	4715                	li	a4,5
    1610:	00550e93          	addi	t4,a0,5
    1614:	12e78c63          	beq	a5,a4,174c <memset+0x19e>
    1618:	00b502a3          	sb	a1,5(a0)
    161c:	471d                	li	a4,7
    161e:	00650e93          	addi	t4,a0,6
    1622:	12e79763          	bne	a5,a4,1750 <memset+0x1a2>
    1626:	00750e93          	addi	t4,a0,7
    162a:	00b50323          	sb	a1,6(a0)
    162e:	4f1d                	li	t5,7
    1630:	00859713          	slli	a4,a1,0x8
    1634:	8f4d                	or	a4,a4,a1
    1636:	01059e13          	slli	t3,a1,0x10
    163a:	01c76e33          	or	t3,a4,t3
    163e:	01859313          	slli	t1,a1,0x18
    1642:	006e6333          	or	t1,t3,t1
    1646:	02059893          	slli	a7,a1,0x20
    164a:	011368b3          	or	a7,t1,a7
    164e:	02859813          	slli	a6,a1,0x28
    1652:	40f60333          	sub	t1,a2,a5
    1656:	0108e833          	or	a6,a7,a6
    165a:	03059693          	slli	a3,a1,0x30
    165e:	00d866b3          	or	a3,a6,a3
    1662:	03859713          	slli	a4,a1,0x38
    1666:	97aa                	add	a5,a5,a0
    1668:	ff837813          	andi	a6,t1,-8
    166c:	8f55                	or	a4,a4,a3
    166e:	00f806b3          	add	a3,a6,a5
    1672:	e398                	sd	a4,0(a5)
    1674:	07a1                	addi	a5,a5,8
    1676:	fed79ee3          	bne	a5,a3,1672 <memset+0xc4>
    167a:	ff837693          	andi	a3,t1,-8
    167e:	00de87b3          	add	a5,t4,a3
    1682:	01e6873b          	addw	a4,a3,t5
    1686:	0ad30663          	beq	t1,a3,1732 <memset+0x184>
    168a:	00b78023          	sb	a1,0(a5)
    168e:	0017069b          	addiw	a3,a4,1
    1692:	08c6fb63          	bgeu	a3,a2,1728 <memset+0x17a>
    1696:	00b780a3          	sb	a1,1(a5)
    169a:	0027069b          	addiw	a3,a4,2
    169e:	08c6f563          	bgeu	a3,a2,1728 <memset+0x17a>
    16a2:	00b78123          	sb	a1,2(a5)
    16a6:	0037069b          	addiw	a3,a4,3
    16aa:	06c6ff63          	bgeu	a3,a2,1728 <memset+0x17a>
    16ae:	00b781a3          	sb	a1,3(a5)
    16b2:	0047069b          	addiw	a3,a4,4
    16b6:	06c6f963          	bgeu	a3,a2,1728 <memset+0x17a>
    16ba:	00b78223          	sb	a1,4(a5)
    16be:	0057069b          	addiw	a3,a4,5
    16c2:	06c6f363          	bgeu	a3,a2,1728 <memset+0x17a>
    16c6:	00b782a3          	sb	a1,5(a5)
    16ca:	0067069b          	addiw	a3,a4,6
    16ce:	04c6fd63          	bgeu	a3,a2,1728 <memset+0x17a>
    16d2:	00b78323          	sb	a1,6(a5)
    16d6:	0077069b          	addiw	a3,a4,7
    16da:	04c6f763          	bgeu	a3,a2,1728 <memset+0x17a>
    16de:	00b783a3          	sb	a1,7(a5)
    16e2:	0087069b          	addiw	a3,a4,8
    16e6:	04c6f163          	bgeu	a3,a2,1728 <memset+0x17a>
    16ea:	00b78423          	sb	a1,8(a5)
    16ee:	0097069b          	addiw	a3,a4,9
    16f2:	02c6fb63          	bgeu	a3,a2,1728 <memset+0x17a>
    16f6:	00b784a3          	sb	a1,9(a5)
    16fa:	00a7069b          	addiw	a3,a4,10
    16fe:	02c6f563          	bgeu	a3,a2,1728 <memset+0x17a>
    1702:	00b78523          	sb	a1,10(a5)
    1706:	00b7069b          	addiw	a3,a4,11
    170a:	00c6ff63          	bgeu	a3,a2,1728 <memset+0x17a>
    170e:	00b785a3          	sb	a1,11(a5)
    1712:	00c7069b          	addiw	a3,a4,12
    1716:	00c6f963          	bgeu	a3,a2,1728 <memset+0x17a>
    171a:	00b78623          	sb	a1,12(a5)
    171e:	2735                	addiw	a4,a4,13
    1720:	00c77463          	bgeu	a4,a2,1728 <memset+0x17a>
    1724:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1728:	8082                	ret
    172a:	472d                	li	a4,11
    172c:	bd79                	j	15ca <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    172e:	4f0d                	li	t5,3
    1730:	b701                	j	1630 <memset+0x82>
    1732:	8082                	ret
    1734:	4f05                	li	t5,1
    1736:	bded                	j	1630 <memset+0x82>
    1738:	8eaa                	mv	t4,a0
    173a:	4f01                	li	t5,0
    173c:	bdd5                	j	1630 <memset+0x82>
    173e:	87aa                	mv	a5,a0
    1740:	4701                	li	a4,0
    1742:	b7a1                	j	168a <memset+0xdc>
    1744:	4f09                	li	t5,2
    1746:	b5ed                	j	1630 <memset+0x82>
    1748:	4f11                	li	t5,4
    174a:	b5dd                	j	1630 <memset+0x82>
    174c:	4f15                	li	t5,5
    174e:	b5cd                	j	1630 <memset+0x82>
    1750:	4f19                	li	t5,6
    1752:	bdf9                	j	1630 <memset+0x82>

0000000000001754 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1754:	00054783          	lbu	a5,0(a0)
    1758:	0005c703          	lbu	a4,0(a1)
    175c:	00e79863          	bne	a5,a4,176c <strcmp+0x18>
    1760:	0505                	addi	a0,a0,1
    1762:	0585                	addi	a1,a1,1
    1764:	fbe5                	bnez	a5,1754 <strcmp>
    1766:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1768:	9d19                	subw	a0,a0,a4
    176a:	8082                	ret
    176c:	0007851b          	sext.w	a0,a5
    1770:	bfe5                	j	1768 <strcmp+0x14>

0000000000001772 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1772:	ce05                	beqz	a2,17aa <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1774:	00054703          	lbu	a4,0(a0)
    1778:	0005c783          	lbu	a5,0(a1)
    177c:	cb0d                	beqz	a4,17ae <strncmp+0x3c>
    if (!n--)
    177e:	167d                	addi	a2,a2,-1
    1780:	00c506b3          	add	a3,a0,a2
    1784:	a819                	j	179a <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1786:	00a68e63          	beq	a3,a0,17a2 <strncmp+0x30>
    178a:	0505                	addi	a0,a0,1
    178c:	00e79b63          	bne	a5,a4,17a2 <strncmp+0x30>
    1790:	00054703          	lbu	a4,0(a0)
    1794:	0005c783          	lbu	a5,0(a1)
    1798:	cb19                	beqz	a4,17ae <strncmp+0x3c>
    179a:	0005c783          	lbu	a5,0(a1)
    179e:	0585                	addi	a1,a1,1
    17a0:	f3fd                	bnez	a5,1786 <strncmp+0x14>
        ;
    return *l - *r;
    17a2:	0007051b          	sext.w	a0,a4
    17a6:	9d1d                	subw	a0,a0,a5
    17a8:	8082                	ret
        return 0;
    17aa:	4501                	li	a0,0
}
    17ac:	8082                	ret
    17ae:	4501                	li	a0,0
    return *l - *r;
    17b0:	9d1d                	subw	a0,a0,a5
    17b2:	8082                	ret

00000000000017b4 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    17b4:	00757793          	andi	a5,a0,7
    17b8:	cf89                	beqz	a5,17d2 <strlen+0x1e>
    17ba:	87aa                	mv	a5,a0
    17bc:	a029                	j	17c6 <strlen+0x12>
    17be:	0785                	addi	a5,a5,1
    17c0:	0077f713          	andi	a4,a5,7
    17c4:	cb01                	beqz	a4,17d4 <strlen+0x20>
        if (!*s)
    17c6:	0007c703          	lbu	a4,0(a5)
    17ca:	fb75                	bnez	a4,17be <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    17cc:	40a78533          	sub	a0,a5,a0
}
    17d0:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    17d2:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    17d4:	6394                	ld	a3,0(a5)
    17d6:	00000597          	auipc	a1,0x0
    17da:	67a5b583          	ld	a1,1658(a1) # 1e50 <__func__.986+0x8>
    17de:	00000617          	auipc	a2,0x0
    17e2:	67a63603          	ld	a2,1658(a2) # 1e58 <__func__.986+0x10>
    17e6:	a019                	j	17ec <strlen+0x38>
    17e8:	6794                	ld	a3,8(a5)
    17ea:	07a1                	addi	a5,a5,8
    17ec:	00b68733          	add	a4,a3,a1
    17f0:	fff6c693          	not	a3,a3
    17f4:	8f75                	and	a4,a4,a3
    17f6:	8f71                	and	a4,a4,a2
    17f8:	db65                	beqz	a4,17e8 <strlen+0x34>
    for (; *s; s++)
    17fa:	0007c703          	lbu	a4,0(a5)
    17fe:	d779                	beqz	a4,17cc <strlen+0x18>
    1800:	0017c703          	lbu	a4,1(a5)
    1804:	0785                	addi	a5,a5,1
    1806:	d379                	beqz	a4,17cc <strlen+0x18>
    1808:	0017c703          	lbu	a4,1(a5)
    180c:	0785                	addi	a5,a5,1
    180e:	fb6d                	bnez	a4,1800 <strlen+0x4c>
    1810:	bf75                	j	17cc <strlen+0x18>

0000000000001812 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1812:	00757713          	andi	a4,a0,7
{
    1816:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1818:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    181c:	cb19                	beqz	a4,1832 <memchr+0x20>
    181e:	ce25                	beqz	a2,1896 <memchr+0x84>
    1820:	0007c703          	lbu	a4,0(a5)
    1824:	04b70e63          	beq	a4,a1,1880 <memchr+0x6e>
    1828:	0785                	addi	a5,a5,1
    182a:	0077f713          	andi	a4,a5,7
    182e:	167d                	addi	a2,a2,-1
    1830:	f77d                	bnez	a4,181e <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1832:	4501                	li	a0,0
    if (n && *s != c)
    1834:	c235                	beqz	a2,1898 <memchr+0x86>
    1836:	0007c703          	lbu	a4,0(a5)
    183a:	04b70363          	beq	a4,a1,1880 <memchr+0x6e>
        size_t k = ONES * c;
    183e:	00000517          	auipc	a0,0x0
    1842:	62253503          	ld	a0,1570(a0) # 1e60 <__func__.986+0x18>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1846:	471d                	li	a4,7
        size_t k = ONES * c;
    1848:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    184c:	02c77a63          	bgeu	a4,a2,1880 <memchr+0x6e>
    1850:	00000897          	auipc	a7,0x0
    1854:	6008b883          	ld	a7,1536(a7) # 1e50 <__func__.986+0x8>
    1858:	00000817          	auipc	a6,0x0
    185c:	60083803          	ld	a6,1536(a6) # 1e58 <__func__.986+0x10>
    1860:	431d                	li	t1,7
    1862:	a029                	j	186c <memchr+0x5a>
    1864:	1661                	addi	a2,a2,-8
    1866:	07a1                	addi	a5,a5,8
    1868:	02c37963          	bgeu	t1,a2,189a <memchr+0x88>
    186c:	6398                	ld	a4,0(a5)
    186e:	8f29                	xor	a4,a4,a0
    1870:	011706b3          	add	a3,a4,a7
    1874:	fff74713          	not	a4,a4
    1878:	8f75                	and	a4,a4,a3
    187a:	01077733          	and	a4,a4,a6
    187e:	d37d                	beqz	a4,1864 <memchr+0x52>
    1880:	853e                	mv	a0,a5
    1882:	97b2                	add	a5,a5,a2
    1884:	a021                	j	188c <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1886:	0505                	addi	a0,a0,1
    1888:	00f50763          	beq	a0,a5,1896 <memchr+0x84>
    188c:	00054703          	lbu	a4,0(a0)
    1890:	feb71be3          	bne	a4,a1,1886 <memchr+0x74>
    1894:	8082                	ret
    return n ? (void *)s : 0;
    1896:	4501                	li	a0,0
}
    1898:	8082                	ret
    return n ? (void *)s : 0;
    189a:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    189c:	f275                	bnez	a2,1880 <memchr+0x6e>
}
    189e:	8082                	ret

00000000000018a0 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    18a0:	1101                	addi	sp,sp,-32
    18a2:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    18a4:	862e                	mv	a2,a1
{
    18a6:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    18a8:	4581                	li	a1,0
{
    18aa:	e426                	sd	s1,8(sp)
    18ac:	ec06                	sd	ra,24(sp)
    18ae:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    18b0:	f63ff0ef          	jal	ra,1812 <memchr>
    return p ? p - s : n;
    18b4:	c519                	beqz	a0,18c2 <strnlen+0x22>
}
    18b6:	60e2                	ld	ra,24(sp)
    18b8:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    18ba:	8d05                	sub	a0,a0,s1
}
    18bc:	64a2                	ld	s1,8(sp)
    18be:	6105                	addi	sp,sp,32
    18c0:	8082                	ret
    18c2:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    18c4:	8522                	mv	a0,s0
}
    18c6:	6442                	ld	s0,16(sp)
    18c8:	64a2                	ld	s1,8(sp)
    18ca:	6105                	addi	sp,sp,32
    18cc:	8082                	ret

00000000000018ce <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    18ce:	00b547b3          	xor	a5,a0,a1
    18d2:	8b9d                	andi	a5,a5,7
    18d4:	eb95                	bnez	a5,1908 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    18d6:	0075f793          	andi	a5,a1,7
    18da:	e7b1                	bnez	a5,1926 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    18dc:	6198                	ld	a4,0(a1)
    18de:	00000617          	auipc	a2,0x0
    18e2:	57263603          	ld	a2,1394(a2) # 1e50 <__func__.986+0x8>
    18e6:	00000817          	auipc	a6,0x0
    18ea:	57283803          	ld	a6,1394(a6) # 1e58 <__func__.986+0x10>
    18ee:	a029                	j	18f8 <strcpy+0x2a>
    18f0:	e118                	sd	a4,0(a0)
    18f2:	6598                	ld	a4,8(a1)
    18f4:	05a1                	addi	a1,a1,8
    18f6:	0521                	addi	a0,a0,8
    18f8:	00c707b3          	add	a5,a4,a2
    18fc:	fff74693          	not	a3,a4
    1900:	8ff5                	and	a5,a5,a3
    1902:	0107f7b3          	and	a5,a5,a6
    1906:	d7ed                	beqz	a5,18f0 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1908:	0005c783          	lbu	a5,0(a1)
    190c:	00f50023          	sb	a5,0(a0)
    1910:	c785                	beqz	a5,1938 <strcpy+0x6a>
    1912:	0015c783          	lbu	a5,1(a1)
    1916:	0505                	addi	a0,a0,1
    1918:	0585                	addi	a1,a1,1
    191a:	00f50023          	sb	a5,0(a0)
    191e:	fbf5                	bnez	a5,1912 <strcpy+0x44>
        ;
    return d;
}
    1920:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1922:	0505                	addi	a0,a0,1
    1924:	df45                	beqz	a4,18dc <strcpy+0xe>
            if (!(*d = *s))
    1926:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    192a:	0585                	addi	a1,a1,1
    192c:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1930:	00f50023          	sb	a5,0(a0)
    1934:	f7fd                	bnez	a5,1922 <strcpy+0x54>
}
    1936:	8082                	ret
    1938:	8082                	ret

000000000000193a <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    193a:	00b547b3          	xor	a5,a0,a1
    193e:	8b9d                	andi	a5,a5,7
    1940:	1a079863          	bnez	a5,1af0 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1944:	0075f793          	andi	a5,a1,7
    1948:	16078463          	beqz	a5,1ab0 <strncpy+0x176>
    194c:	ea01                	bnez	a2,195c <strncpy+0x22>
    194e:	a421                	j	1b56 <strncpy+0x21c>
    1950:	167d                	addi	a2,a2,-1
    1952:	0505                	addi	a0,a0,1
    1954:	14070e63          	beqz	a4,1ab0 <strncpy+0x176>
    1958:	1a060863          	beqz	a2,1b08 <strncpy+0x1ce>
    195c:	0005c783          	lbu	a5,0(a1)
    1960:	0585                	addi	a1,a1,1
    1962:	0075f713          	andi	a4,a1,7
    1966:	00f50023          	sb	a5,0(a0)
    196a:	f3fd                	bnez	a5,1950 <strncpy+0x16>
    196c:	4805                	li	a6,1
    196e:	1a061863          	bnez	a2,1b1e <strncpy+0x1e4>
    1972:	40a007b3          	neg	a5,a0
    1976:	8b9d                	andi	a5,a5,7
    1978:	4681                	li	a3,0
    197a:	18061a63          	bnez	a2,1b0e <strncpy+0x1d4>
    197e:	00778713          	addi	a4,a5,7
    1982:	45ad                	li	a1,11
    1984:	18b76363          	bltu	a4,a1,1b0a <strncpy+0x1d0>
    1988:	1ae6eb63          	bltu	a3,a4,1b3e <strncpy+0x204>
    198c:	1a078363          	beqz	a5,1b32 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1990:	00050023          	sb	zero,0(a0)
    1994:	4685                	li	a3,1
    1996:	00150713          	addi	a4,a0,1
    199a:	18d78f63          	beq	a5,a3,1b38 <strncpy+0x1fe>
    199e:	000500a3          	sb	zero,1(a0)
    19a2:	4689                	li	a3,2
    19a4:	00250713          	addi	a4,a0,2
    19a8:	18d78e63          	beq	a5,a3,1b44 <strncpy+0x20a>
    19ac:	00050123          	sb	zero,2(a0)
    19b0:	468d                	li	a3,3
    19b2:	00350713          	addi	a4,a0,3
    19b6:	16d78c63          	beq	a5,a3,1b2e <strncpy+0x1f4>
    19ba:	000501a3          	sb	zero,3(a0)
    19be:	4691                	li	a3,4
    19c0:	00450713          	addi	a4,a0,4
    19c4:	18d78263          	beq	a5,a3,1b48 <strncpy+0x20e>
    19c8:	00050223          	sb	zero,4(a0)
    19cc:	4695                	li	a3,5
    19ce:	00550713          	addi	a4,a0,5
    19d2:	16d78d63          	beq	a5,a3,1b4c <strncpy+0x212>
    19d6:	000502a3          	sb	zero,5(a0)
    19da:	469d                	li	a3,7
    19dc:	00650713          	addi	a4,a0,6
    19e0:	16d79863          	bne	a5,a3,1b50 <strncpy+0x216>
    19e4:	00750713          	addi	a4,a0,7
    19e8:	00050323          	sb	zero,6(a0)
    19ec:	40f80833          	sub	a6,a6,a5
    19f0:	ff887593          	andi	a1,a6,-8
    19f4:	97aa                	add	a5,a5,a0
    19f6:	95be                	add	a1,a1,a5
    19f8:	0007b023          	sd	zero,0(a5)
    19fc:	07a1                	addi	a5,a5,8
    19fe:	feb79de3          	bne	a5,a1,19f8 <strncpy+0xbe>
    1a02:	ff887593          	andi	a1,a6,-8
    1a06:	9ead                	addw	a3,a3,a1
    1a08:	00b707b3          	add	a5,a4,a1
    1a0c:	12b80863          	beq	a6,a1,1b3c <strncpy+0x202>
    1a10:	00078023          	sb	zero,0(a5)
    1a14:	0016871b          	addiw	a4,a3,1
    1a18:	0ec77863          	bgeu	a4,a2,1b08 <strncpy+0x1ce>
    1a1c:	000780a3          	sb	zero,1(a5)
    1a20:	0026871b          	addiw	a4,a3,2
    1a24:	0ec77263          	bgeu	a4,a2,1b08 <strncpy+0x1ce>
    1a28:	00078123          	sb	zero,2(a5)
    1a2c:	0036871b          	addiw	a4,a3,3
    1a30:	0cc77c63          	bgeu	a4,a2,1b08 <strncpy+0x1ce>
    1a34:	000781a3          	sb	zero,3(a5)
    1a38:	0046871b          	addiw	a4,a3,4
    1a3c:	0cc77663          	bgeu	a4,a2,1b08 <strncpy+0x1ce>
    1a40:	00078223          	sb	zero,4(a5)
    1a44:	0056871b          	addiw	a4,a3,5
    1a48:	0cc77063          	bgeu	a4,a2,1b08 <strncpy+0x1ce>
    1a4c:	000782a3          	sb	zero,5(a5)
    1a50:	0066871b          	addiw	a4,a3,6
    1a54:	0ac77a63          	bgeu	a4,a2,1b08 <strncpy+0x1ce>
    1a58:	00078323          	sb	zero,6(a5)
    1a5c:	0076871b          	addiw	a4,a3,7
    1a60:	0ac77463          	bgeu	a4,a2,1b08 <strncpy+0x1ce>
    1a64:	000783a3          	sb	zero,7(a5)
    1a68:	0086871b          	addiw	a4,a3,8
    1a6c:	08c77e63          	bgeu	a4,a2,1b08 <strncpy+0x1ce>
    1a70:	00078423          	sb	zero,8(a5)
    1a74:	0096871b          	addiw	a4,a3,9
    1a78:	08c77863          	bgeu	a4,a2,1b08 <strncpy+0x1ce>
    1a7c:	000784a3          	sb	zero,9(a5)
    1a80:	00a6871b          	addiw	a4,a3,10
    1a84:	08c77263          	bgeu	a4,a2,1b08 <strncpy+0x1ce>
    1a88:	00078523          	sb	zero,10(a5)
    1a8c:	00b6871b          	addiw	a4,a3,11
    1a90:	06c77c63          	bgeu	a4,a2,1b08 <strncpy+0x1ce>
    1a94:	000785a3          	sb	zero,11(a5)
    1a98:	00c6871b          	addiw	a4,a3,12
    1a9c:	06c77663          	bgeu	a4,a2,1b08 <strncpy+0x1ce>
    1aa0:	00078623          	sb	zero,12(a5)
    1aa4:	26b5                	addiw	a3,a3,13
    1aa6:	06c6f163          	bgeu	a3,a2,1b08 <strncpy+0x1ce>
    1aaa:	000786a3          	sb	zero,13(a5)
    1aae:	8082                	ret
            ;
        if (!n || !*s)
    1ab0:	c645                	beqz	a2,1b58 <strncpy+0x21e>
    1ab2:	0005c783          	lbu	a5,0(a1)
    1ab6:	ea078be3          	beqz	a5,196c <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1aba:	479d                	li	a5,7
    1abc:	02c7ff63          	bgeu	a5,a2,1afa <strncpy+0x1c0>
    1ac0:	00000897          	auipc	a7,0x0
    1ac4:	3908b883          	ld	a7,912(a7) # 1e50 <__func__.986+0x8>
    1ac8:	00000817          	auipc	a6,0x0
    1acc:	39083803          	ld	a6,912(a6) # 1e58 <__func__.986+0x10>
    1ad0:	431d                	li	t1,7
    1ad2:	6198                	ld	a4,0(a1)
    1ad4:	011707b3          	add	a5,a4,a7
    1ad8:	fff74693          	not	a3,a4
    1adc:	8ff5                	and	a5,a5,a3
    1ade:	0107f7b3          	and	a5,a5,a6
    1ae2:	ef81                	bnez	a5,1afa <strncpy+0x1c0>
            *wd = *ws;
    1ae4:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ae6:	1661                	addi	a2,a2,-8
    1ae8:	05a1                	addi	a1,a1,8
    1aea:	0521                	addi	a0,a0,8
    1aec:	fec363e3          	bltu	t1,a2,1ad2 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1af0:	e609                	bnez	a2,1afa <strncpy+0x1c0>
    1af2:	a08d                	j	1b54 <strncpy+0x21a>
    1af4:	167d                	addi	a2,a2,-1
    1af6:	0505                	addi	a0,a0,1
    1af8:	ca01                	beqz	a2,1b08 <strncpy+0x1ce>
    1afa:	0005c783          	lbu	a5,0(a1)
    1afe:	0585                	addi	a1,a1,1
    1b00:	00f50023          	sb	a5,0(a0)
    1b04:	fbe5                	bnez	a5,1af4 <strncpy+0x1ba>
        ;
tail:
    1b06:	b59d                	j	196c <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1b08:	8082                	ret
    1b0a:	472d                	li	a4,11
    1b0c:	bdb5                	j	1988 <strncpy+0x4e>
    1b0e:	00778713          	addi	a4,a5,7
    1b12:	45ad                	li	a1,11
    1b14:	fff60693          	addi	a3,a2,-1
    1b18:	e6b778e3          	bgeu	a4,a1,1988 <strncpy+0x4e>
    1b1c:	b7fd                	j	1b0a <strncpy+0x1d0>
    1b1e:	40a007b3          	neg	a5,a0
    1b22:	8832                	mv	a6,a2
    1b24:	8b9d                	andi	a5,a5,7
    1b26:	4681                	li	a3,0
    1b28:	e4060be3          	beqz	a2,197e <strncpy+0x44>
    1b2c:	b7cd                	j	1b0e <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b2e:	468d                	li	a3,3
    1b30:	bd75                	j	19ec <strncpy+0xb2>
    1b32:	872a                	mv	a4,a0
    1b34:	4681                	li	a3,0
    1b36:	bd5d                	j	19ec <strncpy+0xb2>
    1b38:	4685                	li	a3,1
    1b3a:	bd4d                	j	19ec <strncpy+0xb2>
    1b3c:	8082                	ret
    1b3e:	87aa                	mv	a5,a0
    1b40:	4681                	li	a3,0
    1b42:	b5f9                	j	1a10 <strncpy+0xd6>
    1b44:	4689                	li	a3,2
    1b46:	b55d                	j	19ec <strncpy+0xb2>
    1b48:	4691                	li	a3,4
    1b4a:	b54d                	j	19ec <strncpy+0xb2>
    1b4c:	4695                	li	a3,5
    1b4e:	bd79                	j	19ec <strncpy+0xb2>
    1b50:	4699                	li	a3,6
    1b52:	bd69                	j	19ec <strncpy+0xb2>
    1b54:	8082                	ret
    1b56:	8082                	ret
    1b58:	8082                	ret

0000000000001b5a <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1b5a:	87aa                	mv	a5,a0
    1b5c:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1b5e:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1b62:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1b66:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1b68:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1b6a:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1b6e:	2501                	sext.w	a0,a0
    1b70:	8082                	ret

0000000000001b72 <openat>:
    register long a7 __asm__("a7") = n;
    1b72:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1b76:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1b7a:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1b7e:	2501                	sext.w	a0,a0
    1b80:	8082                	ret

0000000000001b82 <close>:
    register long a7 __asm__("a7") = n;
    1b82:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1b86:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1b8a:	2501                	sext.w	a0,a0
    1b8c:	8082                	ret

0000000000001b8e <read>:
    register long a7 __asm__("a7") = n;
    1b8e:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1b92:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1b96:	8082                	ret

0000000000001b98 <write>:
    register long a7 __asm__("a7") = n;
    1b98:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1b9c:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1ba0:	8082                	ret

0000000000001ba2 <getpid>:
    register long a7 __asm__("a7") = n;
    1ba2:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1ba6:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1baa:	2501                	sext.w	a0,a0
    1bac:	8082                	ret

0000000000001bae <getppid>:
    register long a7 __asm__("a7") = n;
    1bae:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1bb2:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1bb6:	2501                	sext.w	a0,a0
    1bb8:	8082                	ret

0000000000001bba <sched_yield>:
    register long a7 __asm__("a7") = n;
    1bba:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1bbe:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1bc2:	2501                	sext.w	a0,a0
    1bc4:	8082                	ret

0000000000001bc6 <fork>:
    register long a7 __asm__("a7") = n;
    1bc6:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1bca:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1bcc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1bce:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1bd2:	2501                	sext.w	a0,a0
    1bd4:	8082                	ret

0000000000001bd6 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1bd6:	85b2                	mv	a1,a2
    1bd8:	863a                	mv	a2,a4
    if (stack)
    1bda:	c191                	beqz	a1,1bde <clone+0x8>
	stack += stack_size;
    1bdc:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1bde:	4781                	li	a5,0
    1be0:	4701                	li	a4,0
    1be2:	4681                	li	a3,0
    1be4:	2601                	sext.w	a2,a2
    1be6:	a2ed                	j	1dd0 <__clone>

0000000000001be8 <exit>:
    register long a7 __asm__("a7") = n;
    1be8:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1bec:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1bf0:	8082                	ret

0000000000001bf2 <waitpid>:
    register long a7 __asm__("a7") = n;
    1bf2:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1bf6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bf8:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1bfc:	2501                	sext.w	a0,a0
    1bfe:	8082                	ret

0000000000001c00 <exec>:
    register long a7 __asm__("a7") = n;
    1c00:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1c04:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1c08:	2501                	sext.w	a0,a0
    1c0a:	8082                	ret

0000000000001c0c <execve>:
    register long a7 __asm__("a7") = n;
    1c0c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c10:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1c14:	2501                	sext.w	a0,a0
    1c16:	8082                	ret

0000000000001c18 <times>:
    register long a7 __asm__("a7") = n;
    1c18:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1c1c:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1c20:	2501                	sext.w	a0,a0
    1c22:	8082                	ret

0000000000001c24 <get_time>:

int64 get_time()
{
    1c24:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1c26:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1c2a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1c2c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c2e:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1c32:	2501                	sext.w	a0,a0
    1c34:	ed09                	bnez	a0,1c4e <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1c36:	67a2                	ld	a5,8(sp)
    1c38:	3e800713          	li	a4,1000
    1c3c:	00015503          	lhu	a0,0(sp)
    1c40:	02e7d7b3          	divu	a5,a5,a4
    1c44:	02e50533          	mul	a0,a0,a4
    1c48:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1c4a:	0141                	addi	sp,sp,16
    1c4c:	8082                	ret
        return -1;
    1c4e:	557d                	li	a0,-1
    1c50:	bfed                	j	1c4a <get_time+0x26>

0000000000001c52 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1c52:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c56:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1c5a:	2501                	sext.w	a0,a0
    1c5c:	8082                	ret

0000000000001c5e <time>:
    register long a7 __asm__("a7") = n;
    1c5e:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1c62:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1c66:	2501                	sext.w	a0,a0
    1c68:	8082                	ret

0000000000001c6a <sleep>:

int sleep(unsigned long long time)
{
    1c6a:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1c6c:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1c6e:	850a                	mv	a0,sp
    1c70:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1c72:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1c76:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c78:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1c7c:	e501                	bnez	a0,1c84 <sleep+0x1a>
    return 0;
    1c7e:	4501                	li	a0,0
}
    1c80:	0141                	addi	sp,sp,16
    1c82:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1c84:	4502                	lw	a0,0(sp)
}
    1c86:	0141                	addi	sp,sp,16
    1c88:	8082                	ret

0000000000001c8a <set_priority>:
    register long a7 __asm__("a7") = n;
    1c8a:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1c8e:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1c92:	2501                	sext.w	a0,a0
    1c94:	8082                	ret

0000000000001c96 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1c96:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1c9a:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1c9e:	8082                	ret

0000000000001ca0 <munmap>:
    register long a7 __asm__("a7") = n;
    1ca0:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ca4:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1ca8:	2501                	sext.w	a0,a0
    1caa:	8082                	ret

0000000000001cac <wait>:

int wait(int *code)
{
    1cac:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1cae:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1cb2:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1cb4:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1cb6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cb8:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1cbc:	2501                	sext.w	a0,a0
    1cbe:	8082                	ret

0000000000001cc0 <spawn>:
    register long a7 __asm__("a7") = n;
    1cc0:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1cc4:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1cc8:	2501                	sext.w	a0,a0
    1cca:	8082                	ret

0000000000001ccc <mailread>:
    register long a7 __asm__("a7") = n;
    1ccc:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cd0:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1cd4:	2501                	sext.w	a0,a0
    1cd6:	8082                	ret

0000000000001cd8 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1cd8:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cdc:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ce0:	2501                	sext.w	a0,a0
    1ce2:	8082                	ret

0000000000001ce4 <fstat>:
    register long a7 __asm__("a7") = n;
    1ce4:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ce8:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1cec:	2501                	sext.w	a0,a0
    1cee:	8082                	ret

0000000000001cf0 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1cf0:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1cf2:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1cf6:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1cf8:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1cfc:	2501                	sext.w	a0,a0
    1cfe:	8082                	ret

0000000000001d00 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1d00:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d02:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1d06:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d08:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1d0c:	2501                	sext.w	a0,a0
    1d0e:	8082                	ret

0000000000001d10 <link>:

int link(char *old_path, char *new_path)
{
    1d10:	87aa                	mv	a5,a0
    1d12:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1d14:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1d18:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d1c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1d1e:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1d22:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d24:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1d28:	2501                	sext.w	a0,a0
    1d2a:	8082                	ret

0000000000001d2c <unlink>:

int unlink(char *path)
{
    1d2c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d2e:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1d32:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1d36:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d38:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1d3c:	2501                	sext.w	a0,a0
    1d3e:	8082                	ret

0000000000001d40 <uname>:
    register long a7 __asm__("a7") = n;
    1d40:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1d44:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1d48:	2501                	sext.w	a0,a0
    1d4a:	8082                	ret

0000000000001d4c <brk>:
    register long a7 __asm__("a7") = n;
    1d4c:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1d50:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1d54:	2501                	sext.w	a0,a0
    1d56:	8082                	ret

0000000000001d58 <getcwd>:
    register long a7 __asm__("a7") = n;
    1d58:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d5a:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1d5e:	8082                	ret

0000000000001d60 <chdir>:
    register long a7 __asm__("a7") = n;
    1d60:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1d64:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1d68:	2501                	sext.w	a0,a0
    1d6a:	8082                	ret

0000000000001d6c <mkdir>:

int mkdir(const char *path, mode_t mode){
    1d6c:	862e                	mv	a2,a1
    1d6e:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1d70:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d72:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1d76:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d7a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1d7c:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d7e:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1d82:	2501                	sext.w	a0,a0
    1d84:	8082                	ret

0000000000001d86 <getdents>:
    register long a7 __asm__("a7") = n;
    1d86:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d8a:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1d8e:	2501                	sext.w	a0,a0
    1d90:	8082                	ret

0000000000001d92 <pipe>:
    register long a7 __asm__("a7") = n;
    1d92:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1d96:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d98:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1d9c:	2501                	sext.w	a0,a0
    1d9e:	8082                	ret

0000000000001da0 <dup>:
    register long a7 __asm__("a7") = n;
    1da0:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1da2:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1da6:	2501                	sext.w	a0,a0
    1da8:	8082                	ret

0000000000001daa <dup2>:
    register long a7 __asm__("a7") = n;
    1daa:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1dac:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dae:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1db2:	2501                	sext.w	a0,a0
    1db4:	8082                	ret

0000000000001db6 <mount>:
    register long a7 __asm__("a7") = n;
    1db6:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dba:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <umount>:
    register long a7 __asm__("a7") = n;
    1dc2:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1dc6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc8:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1dcc:	2501                	sext.w	a0,a0
    1dce:	8082                	ret

0000000000001dd0 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1dd0:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1dd2:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1dd4:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1dd6:	8532                	mv	a0,a2
	mv a2, a4
    1dd8:	863a                	mv	a2,a4
	mv a3, a5
    1dda:	86be                	mv	a3,a5
	mv a4, a6
    1ddc:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1dde:	0dc00893          	li	a7,220
	ecall
    1de2:	00000073          	ecall

	beqz a0, 1f
    1de6:	c111                	beqz	a0,1dea <__clone+0x1a>
	# Parent
	ret
    1de8:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1dea:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1dec:	6522                	ld	a0,8(sp)
	jalr a1
    1dee:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1df0:	05d00893          	li	a7,93
	ecall
    1df4:	00000073          	ecall
