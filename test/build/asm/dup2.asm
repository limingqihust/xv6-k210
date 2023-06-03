
/home/lmq/Desktop/xv6-k210/test/build/riscv64/dup2:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a871                	j	109e <__start_main>

0000000000001004 <test_dup2>:

/*
 * 测试通过时应输出：
 * "  from fd 100"
 */
void test_dup2(){
    1004:	1141                	addi	sp,sp,-16
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	e6250513          	addi	a0,a0,-414 # 1e68 <__clone+0x28>
void test_dup2(){
    100e:	e406                	sd	ra,8(sp)
	TEST_START(__func__);
    1010:	28c000ef          	jal	ra,129c <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	edc50513          	addi	a0,a0,-292 # 1ef0 <__func__.1191>
    101c:	280000ef          	jal	ra,129c <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	e6050513          	addi	a0,a0,-416 # 1e80 <__clone+0x40>
    1028:	274000ef          	jal	ra,129c <puts>
	int fd = dup2(STDOUT, 100);
    102c:	06400593          	li	a1,100
    1030:	4505                	li	a0,1
    1032:	5e9000ef          	jal	ra,1e1a <dup2>
	assert(fd != -1);
    1036:	57fd                	li	a5,-1
    1038:	04f50463          	beq	a0,a5,1080 <test_dup2+0x7c>
	const char *str = "  from fd 100\n";
	write(100, str, strlen(str));
    103c:	00001517          	auipc	a0,0x1
    1040:	e7450513          	addi	a0,a0,-396 # 1eb0 <__clone+0x70>
    1044:	7e0000ef          	jal	ra,1824 <strlen>
    1048:	862a                	mv	a2,a0
    104a:	00001597          	auipc	a1,0x1
    104e:	e6658593          	addi	a1,a1,-410 # 1eb0 <__clone+0x70>
    1052:	06400513          	li	a0,100
    1056:	3b3000ef          	jal	ra,1c08 <write>
	TEST_END(__func__);
    105a:	00001517          	auipc	a0,0x1
    105e:	e6650513          	addi	a0,a0,-410 # 1ec0 <__clone+0x80>
    1062:	23a000ef          	jal	ra,129c <puts>
    1066:	00001517          	auipc	a0,0x1
    106a:	e8a50513          	addi	a0,a0,-374 # 1ef0 <__func__.1191>
    106e:	22e000ef          	jal	ra,129c <puts>
}
    1072:	60a2                	ld	ra,8(sp)
	TEST_END(__func__);
    1074:	00001517          	auipc	a0,0x1
    1078:	e0c50513          	addi	a0,a0,-500 # 1e80 <__clone+0x40>
}
    107c:	0141                	addi	sp,sp,16
	TEST_END(__func__);
    107e:	ac39                	j	129c <puts>
	assert(fd != -1);
    1080:	00001517          	auipc	a0,0x1
    1084:	e1050513          	addi	a0,a0,-496 # 1e90 <__clone+0x50>
    1088:	4be000ef          	jal	ra,1546 <panic>
    108c:	bf45                	j	103c <test_dup2+0x38>

000000000000108e <main>:

int main(void) {
    108e:	1141                	addi	sp,sp,-16
    1090:	e406                	sd	ra,8(sp)
	test_dup2();
    1092:	f73ff0ef          	jal	ra,1004 <test_dup2>
	return 0;
}
    1096:	60a2                	ld	ra,8(sp)
    1098:	4501                	li	a0,0
    109a:	0141                	addi	sp,sp,16
    109c:	8082                	ret

000000000000109e <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    109e:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10a0:	4108                	lw	a0,0(a0)
{
    10a2:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10a4:	05a1                	addi	a1,a1,8
{
    10a6:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10a8:	fe7ff0ef          	jal	ra,108e <main>
    10ac:	3ad000ef          	jal	ra,1c58 <exit>
	return 0;
}
    10b0:	60a2                	ld	ra,8(sp)
    10b2:	4501                	li	a0,0
    10b4:	0141                	addi	sp,sp,16
    10b6:	8082                	ret

00000000000010b8 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10b8:	7179                	addi	sp,sp,-48
    10ba:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10bc:	12054b63          	bltz	a0,11f2 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10c0:	02b577bb          	remuw	a5,a0,a1
    10c4:	00001697          	auipc	a3,0x1
    10c8:	e3c68693          	addi	a3,a3,-452 # 1f00 <digits>
    buf[16] = 0;
    10cc:	00010c23          	sb	zero,24(sp)
    i = 15;
    10d0:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    10d4:	1782                	slli	a5,a5,0x20
    10d6:	9381                	srli	a5,a5,0x20
    10d8:	97b6                	add	a5,a5,a3
    10da:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10de:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10e2:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10e6:	16b56263          	bltu	a0,a1,124a <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    10ea:	02e8763b          	remuw	a2,a6,a4
    10ee:	1602                	slli	a2,a2,0x20
    10f0:	9201                	srli	a2,a2,0x20
    10f2:	9636                	add	a2,a2,a3
    10f4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10f8:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    10fc:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1100:	12e86963          	bltu	a6,a4,1232 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    1104:	02e5f63b          	remuw	a2,a1,a4
    1108:	1602                	slli	a2,a2,0x20
    110a:	9201                	srli	a2,a2,0x20
    110c:	9636                	add	a2,a2,a3
    110e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1112:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1116:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    111a:	10e5ef63          	bltu	a1,a4,1238 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    111e:	02e8763b          	remuw	a2,a6,a4
    1122:	1602                	slli	a2,a2,0x20
    1124:	9201                	srli	a2,a2,0x20
    1126:	9636                	add	a2,a2,a3
    1128:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    112c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1130:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1134:	10e86563          	bltu	a6,a4,123e <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    1138:	02e5f63b          	remuw	a2,a1,a4
    113c:	1602                	slli	a2,a2,0x20
    113e:	9201                	srli	a2,a2,0x20
    1140:	9636                	add	a2,a2,a3
    1142:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1146:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    114a:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    114e:	0ee5eb63          	bltu	a1,a4,1244 <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    1152:	02e8763b          	remuw	a2,a6,a4
    1156:	1602                	slli	a2,a2,0x20
    1158:	9201                	srli	a2,a2,0x20
    115a:	9636                	add	a2,a2,a3
    115c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1160:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1164:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1168:	0ce86263          	bltu	a6,a4,122c <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    116c:	02e5f63b          	remuw	a2,a1,a4
    1170:	1602                	slli	a2,a2,0x20
    1172:	9201                	srli	a2,a2,0x20
    1174:	9636                	add	a2,a2,a3
    1176:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    117a:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    117e:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1182:	0ce5e663          	bltu	a1,a4,124e <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    1186:	02e8763b          	remuw	a2,a6,a4
    118a:	1602                	slli	a2,a2,0x20
    118c:	9201                	srli	a2,a2,0x20
    118e:	9636                	add	a2,a2,a3
    1190:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1194:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1198:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    119c:	0ae86c63          	bltu	a6,a4,1254 <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    11a0:	02e5f63b          	remuw	a2,a1,a4
    11a4:	1602                	slli	a2,a2,0x20
    11a6:	9201                	srli	a2,a2,0x20
    11a8:	9636                	add	a2,a2,a3
    11aa:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ae:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11b2:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11b6:	0ae5e263          	bltu	a1,a4,125a <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    11ba:	1782                	slli	a5,a5,0x20
    11bc:	9381                	srli	a5,a5,0x20
    11be:	97b6                	add	a5,a5,a3
    11c0:	0007c703          	lbu	a4,0(a5)
    11c4:	4599                	li	a1,6
    11c6:	4795                	li	a5,5
    11c8:	00e10723          	sb	a4,14(sp)

    if (sign)
    11cc:	00055963          	bgez	a0,11de <printint.constprop.0+0x126>
        buf[i--] = '-';
    11d0:	1018                	addi	a4,sp,32
    11d2:	973e                	add	a4,a4,a5
    11d4:	02d00693          	li	a3,45
    11d8:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    11dc:	85be                	mv	a1,a5
    write(f, s, l);
    11de:	003c                	addi	a5,sp,8
    11e0:	4641                	li	a2,16
    11e2:	9e0d                	subw	a2,a2,a1
    11e4:	4505                	li	a0,1
    11e6:	95be                	add	a1,a1,a5
    11e8:	221000ef          	jal	ra,1c08 <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11ec:	70a2                	ld	ra,40(sp)
    11ee:	6145                	addi	sp,sp,48
    11f0:	8082                	ret
        x = -xx;
    11f2:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    11f6:	02b677bb          	remuw	a5,a2,a1
    11fa:	00001697          	auipc	a3,0x1
    11fe:	d0668693          	addi	a3,a3,-762 # 1f00 <digits>
    buf[16] = 0;
    1202:	00010c23          	sb	zero,24(sp)
    i = 15;
    1206:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    120a:	1782                	slli	a5,a5,0x20
    120c:	9381                	srli	a5,a5,0x20
    120e:	97b6                	add	a5,a5,a3
    1210:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1214:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1218:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    121c:	ecb677e3          	bgeu	a2,a1,10ea <printint.constprop.0+0x32>
        buf[i--] = '-';
    1220:	02d00793          	li	a5,45
    1224:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1228:	45b9                	li	a1,14
    122a:	bf55                	j	11de <printint.constprop.0+0x126>
    122c:	47a5                	li	a5,9
    122e:	45a9                	li	a1,10
    1230:	bf71                	j	11cc <printint.constprop.0+0x114>
    1232:	47b5                	li	a5,13
    1234:	45b9                	li	a1,14
    1236:	bf59                	j	11cc <printint.constprop.0+0x114>
    1238:	47b1                	li	a5,12
    123a:	45b5                	li	a1,13
    123c:	bf41                	j	11cc <printint.constprop.0+0x114>
    123e:	47ad                	li	a5,11
    1240:	45b1                	li	a1,12
    1242:	b769                	j	11cc <printint.constprop.0+0x114>
    1244:	47a9                	li	a5,10
    1246:	45ad                	li	a1,11
    1248:	b751                	j	11cc <printint.constprop.0+0x114>
    i = 15;
    124a:	45bd                	li	a1,15
    124c:	bf49                	j	11de <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    124e:	47a1                	li	a5,8
    1250:	45a5                	li	a1,9
    1252:	bfad                	j	11cc <printint.constprop.0+0x114>
    1254:	479d                	li	a5,7
    1256:	45a1                	li	a1,8
    1258:	bf95                	j	11cc <printint.constprop.0+0x114>
    125a:	4799                	li	a5,6
    125c:	459d                	li	a1,7
    125e:	b7bd                	j	11cc <printint.constprop.0+0x114>

0000000000001260 <getchar>:
{
    1260:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1262:	00f10593          	addi	a1,sp,15
    1266:	4605                	li	a2,1
    1268:	4501                	li	a0,0
{
    126a:	ec06                	sd	ra,24(sp)
    char byte = 0;
    126c:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1270:	18f000ef          	jal	ra,1bfe <read>
}
    1274:	60e2                	ld	ra,24(sp)
    1276:	00f14503          	lbu	a0,15(sp)
    127a:	6105                	addi	sp,sp,32
    127c:	8082                	ret

000000000000127e <putchar>:
{
    127e:	1101                	addi	sp,sp,-32
    1280:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1282:	00f10593          	addi	a1,sp,15
    1286:	4605                	li	a2,1
    1288:	4505                	li	a0,1
{
    128a:	ec06                	sd	ra,24(sp)
    char byte = c;
    128c:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1290:	179000ef          	jal	ra,1c08 <write>
}
    1294:	60e2                	ld	ra,24(sp)
    1296:	2501                	sext.w	a0,a0
    1298:	6105                	addi	sp,sp,32
    129a:	8082                	ret

000000000000129c <puts>:
{
    129c:	1141                	addi	sp,sp,-16
    129e:	e406                	sd	ra,8(sp)
    12a0:	e022                	sd	s0,0(sp)
    12a2:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12a4:	580000ef          	jal	ra,1824 <strlen>
    12a8:	862a                	mv	a2,a0
    12aa:	85a2                	mv	a1,s0
    12ac:	4505                	li	a0,1
    12ae:	15b000ef          	jal	ra,1c08 <write>
}
    12b2:	60a2                	ld	ra,8(sp)
    12b4:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12b6:	957d                	srai	a0,a0,0x3f
    return r;
    12b8:	2501                	sext.w	a0,a0
}
    12ba:	0141                	addi	sp,sp,16
    12bc:	8082                	ret

00000000000012be <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12be:	7171                	addi	sp,sp,-176
    12c0:	fc56                	sd	s5,56(sp)
    12c2:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    12c4:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12c6:	18bc                	addi	a5,sp,120
{
    12c8:	e8ca                	sd	s2,80(sp)
    12ca:	e4ce                	sd	s3,72(sp)
    12cc:	e0d2                	sd	s4,64(sp)
    12ce:	f85a                	sd	s6,48(sp)
    12d0:	f486                	sd	ra,104(sp)
    12d2:	f0a2                	sd	s0,96(sp)
    12d4:	eca6                	sd	s1,88(sp)
    12d6:	fcae                	sd	a1,120(sp)
    12d8:	e132                	sd	a2,128(sp)
    12da:	e536                	sd	a3,136(sp)
    12dc:	e93a                	sd	a4,144(sp)
    12de:	f142                	sd	a6,160(sp)
    12e0:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    12e2:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12e4:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    12e8:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    12ec:	00001b17          	auipc	s6,0x1
    12f0:	be4b0b13          	addi	s6,s6,-1052 # 1ed0 <__clone+0x90>
    buf[i++] = '0';
    12f4:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12f8:	00001997          	auipc	s3,0x1
    12fc:	c0898993          	addi	s3,s3,-1016 # 1f00 <digits>
        if (!*s)
    1300:	00054783          	lbu	a5,0(a0)
    1304:	16078a63          	beqz	a5,1478 <printf+0x1ba>
    1308:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    130a:	19278163          	beq	a5,s2,148c <printf+0x1ce>
    130e:	00164783          	lbu	a5,1(a2)
    1312:	0605                	addi	a2,a2,1
    1314:	fbfd                	bnez	a5,130a <printf+0x4c>
    1316:	84b2                	mv	s1,a2
        l = z - a;
    1318:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    131c:	85aa                	mv	a1,a0
    131e:	8622                	mv	a2,s0
    1320:	4505                	li	a0,1
    1322:	0e7000ef          	jal	ra,1c08 <write>
        if (l)
    1326:	18041c63          	bnez	s0,14be <printf+0x200>
        if (s[1] == 0)
    132a:	0014c783          	lbu	a5,1(s1)
    132e:	14078563          	beqz	a5,1478 <printf+0x1ba>
        switch (s[1])
    1332:	1d478063          	beq	a5,s4,14f2 <printf+0x234>
    1336:	18fa6663          	bltu	s4,a5,14c2 <printf+0x204>
    133a:	06400713          	li	a4,100
    133e:	1ae78063          	beq	a5,a4,14de <printf+0x220>
    1342:	07000713          	li	a4,112
    1346:	1ce79963          	bne	a5,a4,1518 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    134a:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    134c:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1350:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1352:	631c                	ld	a5,0(a4)
    1354:	0721                	addi	a4,a4,8
    1356:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1358:	00479293          	slli	t0,a5,0x4
    135c:	00879f93          	slli	t6,a5,0x8
    1360:	00c79f13          	slli	t5,a5,0xc
    1364:	01079e93          	slli	t4,a5,0x10
    1368:	01479e13          	slli	t3,a5,0x14
    136c:	01879313          	slli	t1,a5,0x18
    1370:	01c79893          	slli	a7,a5,0x1c
    1374:	02479813          	slli	a6,a5,0x24
    1378:	02879513          	slli	a0,a5,0x28
    137c:	02c79593          	slli	a1,a5,0x2c
    1380:	03079693          	slli	a3,a5,0x30
    1384:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1388:	03c7d413          	srli	s0,a5,0x3c
    138c:	01c7d39b          	srliw	t2,a5,0x1c
    1390:	03c2d293          	srli	t0,t0,0x3c
    1394:	03cfdf93          	srli	t6,t6,0x3c
    1398:	03cf5f13          	srli	t5,t5,0x3c
    139c:	03cede93          	srli	t4,t4,0x3c
    13a0:	03ce5e13          	srli	t3,t3,0x3c
    13a4:	03c35313          	srli	t1,t1,0x3c
    13a8:	03c8d893          	srli	a7,a7,0x3c
    13ac:	03c85813          	srli	a6,a6,0x3c
    13b0:	9171                	srli	a0,a0,0x3c
    13b2:	91f1                	srli	a1,a1,0x3c
    13b4:	92f1                	srli	a3,a3,0x3c
    13b6:	9371                	srli	a4,a4,0x3c
    13b8:	96ce                	add	a3,a3,s3
    13ba:	974e                	add	a4,a4,s3
    13bc:	944e                	add	s0,s0,s3
    13be:	92ce                	add	t0,t0,s3
    13c0:	9fce                	add	t6,t6,s3
    13c2:	9f4e                	add	t5,t5,s3
    13c4:	9ece                	add	t4,t4,s3
    13c6:	9e4e                	add	t3,t3,s3
    13c8:	934e                	add	t1,t1,s3
    13ca:	98ce                	add	a7,a7,s3
    13cc:	93ce                	add	t2,t2,s3
    13ce:	984e                	add	a6,a6,s3
    13d0:	954e                	add	a0,a0,s3
    13d2:	95ce                	add	a1,a1,s3
    13d4:	0006c083          	lbu	ra,0(a3)
    13d8:	0002c283          	lbu	t0,0(t0)
    13dc:	00074683          	lbu	a3,0(a4)
    13e0:	000fcf83          	lbu	t6,0(t6)
    13e4:	000f4f03          	lbu	t5,0(t5)
    13e8:	000ece83          	lbu	t4,0(t4)
    13ec:	000e4e03          	lbu	t3,0(t3)
    13f0:	00034303          	lbu	t1,0(t1)
    13f4:	0008c883          	lbu	a7,0(a7)
    13f8:	0003c383          	lbu	t2,0(t2)
    13fc:	00084803          	lbu	a6,0(a6)
    1400:	00054503          	lbu	a0,0(a0)
    1404:	0005c583          	lbu	a1,0(a1)
    1408:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    140c:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1410:	9371                	srli	a4,a4,0x3c
    1412:	8bbd                	andi	a5,a5,15
    1414:	974e                	add	a4,a4,s3
    1416:	97ce                	add	a5,a5,s3
    1418:	005105a3          	sb	t0,11(sp)
    141c:	01f10623          	sb	t6,12(sp)
    1420:	01e106a3          	sb	t5,13(sp)
    1424:	01d10723          	sb	t4,14(sp)
    1428:	01c107a3          	sb	t3,15(sp)
    142c:	00610823          	sb	t1,16(sp)
    1430:	011108a3          	sb	a7,17(sp)
    1434:	00710923          	sb	t2,18(sp)
    1438:	010109a3          	sb	a6,19(sp)
    143c:	00a10a23          	sb	a0,20(sp)
    1440:	00b10aa3          	sb	a1,21(sp)
    1444:	00110b23          	sb	ra,22(sp)
    1448:	00d10ba3          	sb	a3,23(sp)
    144c:	00810523          	sb	s0,10(sp)
    1450:	00074703          	lbu	a4,0(a4)
    1454:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1458:	002c                	addi	a1,sp,8
    145a:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    145c:	00e10c23          	sb	a4,24(sp)
    1460:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1464:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1468:	7a0000ef          	jal	ra,1c08 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    146c:	00248513          	addi	a0,s1,2
        if (!*s)
    1470:	00054783          	lbu	a5,0(a0)
    1474:	e8079ae3          	bnez	a5,1308 <printf+0x4a>
    }
    va_end(ap);
}
    1478:	70a6                	ld	ra,104(sp)
    147a:	7406                	ld	s0,96(sp)
    147c:	64e6                	ld	s1,88(sp)
    147e:	6946                	ld	s2,80(sp)
    1480:	69a6                	ld	s3,72(sp)
    1482:	6a06                	ld	s4,64(sp)
    1484:	7ae2                	ld	s5,56(sp)
    1486:	7b42                	ld	s6,48(sp)
    1488:	614d                	addi	sp,sp,176
    148a:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    148c:	00064783          	lbu	a5,0(a2)
    1490:	84b2                	mv	s1,a2
    1492:	01278963          	beq	a5,s2,14a4 <printf+0x1e6>
    1496:	b549                	j	1318 <printf+0x5a>
    1498:	0024c783          	lbu	a5,2(s1)
    149c:	0605                	addi	a2,a2,1
    149e:	0489                	addi	s1,s1,2
    14a0:	e7279ce3          	bne	a5,s2,1318 <printf+0x5a>
    14a4:	0014c783          	lbu	a5,1(s1)
    14a8:	ff2788e3          	beq	a5,s2,1498 <printf+0x1da>
        l = z - a;
    14ac:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14b0:	85aa                	mv	a1,a0
    14b2:	8622                	mv	a2,s0
    14b4:	4505                	li	a0,1
    14b6:	752000ef          	jal	ra,1c08 <write>
        if (l)
    14ba:	e60408e3          	beqz	s0,132a <printf+0x6c>
    14be:	8526                	mv	a0,s1
    14c0:	b581                	j	1300 <printf+0x42>
        switch (s[1])
    14c2:	07800713          	li	a4,120
    14c6:	04e79963          	bne	a5,a4,1518 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    14ca:	6782                	ld	a5,0(sp)
    14cc:	45c1                	li	a1,16
    14ce:	4388                	lw	a0,0(a5)
    14d0:	07a1                	addi	a5,a5,8
    14d2:	e03e                	sd	a5,0(sp)
    14d4:	be5ff0ef          	jal	ra,10b8 <printint.constprop.0>
        s += 2;
    14d8:	00248513          	addi	a0,s1,2
    14dc:	bf51                	j	1470 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    14de:	6782                	ld	a5,0(sp)
    14e0:	45a9                	li	a1,10
    14e2:	4388                	lw	a0,0(a5)
    14e4:	07a1                	addi	a5,a5,8
    14e6:	e03e                	sd	a5,0(sp)
    14e8:	bd1ff0ef          	jal	ra,10b8 <printint.constprop.0>
        s += 2;
    14ec:	00248513          	addi	a0,s1,2
    14f0:	b741                	j	1470 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    14f2:	6782                	ld	a5,0(sp)
    14f4:	6380                	ld	s0,0(a5)
    14f6:	07a1                	addi	a5,a5,8
    14f8:	e03e                	sd	a5,0(sp)
    14fa:	c421                	beqz	s0,1542 <printf+0x284>
            l = strnlen(a, 200);
    14fc:	0c800593          	li	a1,200
    1500:	8522                	mv	a0,s0
    1502:	40e000ef          	jal	ra,1910 <strnlen>
    write(f, s, l);
    1506:	0005061b          	sext.w	a2,a0
    150a:	85a2                	mv	a1,s0
    150c:	4505                	li	a0,1
    150e:	6fa000ef          	jal	ra,1c08 <write>
        s += 2;
    1512:	00248513          	addi	a0,s1,2
    1516:	bfa9                	j	1470 <printf+0x1b2>
    char byte = c;
    1518:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    151c:	4605                	li	a2,1
    151e:	002c                	addi	a1,sp,8
    1520:	4505                	li	a0,1
    char byte = c;
    1522:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1526:	6e2000ef          	jal	ra,1c08 <write>
    char byte = c;
    152a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    152e:	4605                	li	a2,1
    1530:	002c                	addi	a1,sp,8
    1532:	4505                	li	a0,1
    char byte = c;
    1534:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1538:	6d0000ef          	jal	ra,1c08 <write>
        s += 2;
    153c:	00248513          	addi	a0,s1,2
    1540:	bf05                	j	1470 <printf+0x1b2>
                a = "(null)";
    1542:	845a                	mv	s0,s6
    1544:	bf65                	j	14fc <printf+0x23e>

0000000000001546 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1546:	1141                	addi	sp,sp,-16
    1548:	e406                	sd	ra,8(sp)
    puts(m);
    154a:	d53ff0ef          	jal	ra,129c <puts>
    exit(-100);
}
    154e:	60a2                	ld	ra,8(sp)
    exit(-100);
    1550:	f9c00513          	li	a0,-100
}
    1554:	0141                	addi	sp,sp,16
    exit(-100);
    1556:	a709                	j	1c58 <exit>

0000000000001558 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1558:	02000793          	li	a5,32
    155c:	00f50663          	beq	a0,a5,1568 <isspace+0x10>
    1560:	355d                	addiw	a0,a0,-9
    1562:	00553513          	sltiu	a0,a0,5
    1566:	8082                	ret
    1568:	4505                	li	a0,1
}
    156a:	8082                	ret

000000000000156c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    156c:	fd05051b          	addiw	a0,a0,-48
}
    1570:	00a53513          	sltiu	a0,a0,10
    1574:	8082                	ret

0000000000001576 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1576:	02000613          	li	a2,32
    157a:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    157c:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1580:	ff77069b          	addiw	a3,a4,-9
    1584:	04c70d63          	beq	a4,a2,15de <atoi+0x68>
    1588:	0007079b          	sext.w	a5,a4
    158c:	04d5f963          	bgeu	a1,a3,15de <atoi+0x68>
        s++;
    switch (*s)
    1590:	02b00693          	li	a3,43
    1594:	04d70a63          	beq	a4,a3,15e8 <atoi+0x72>
    1598:	02d00693          	li	a3,45
    159c:	06d70463          	beq	a4,a3,1604 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15a0:	fd07859b          	addiw	a1,a5,-48
    15a4:	4625                	li	a2,9
    15a6:	873e                	mv	a4,a5
    15a8:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15aa:	4e01                	li	t3,0
    while (isdigit(*s))
    15ac:	04b66a63          	bltu	a2,a1,1600 <atoi+0x8a>
    int n = 0, neg = 0;
    15b0:	4501                	li	a0,0
    while (isdigit(*s))
    15b2:	4825                	li	a6,9
    15b4:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    15b8:	0025179b          	slliw	a5,a0,0x2
    15bc:	9d3d                	addw	a0,a0,a5
    15be:	fd07031b          	addiw	t1,a4,-48
    15c2:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15c6:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15ca:	0685                	addi	a3,a3,1
    15cc:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15d0:	0006071b          	sext.w	a4,a2
    15d4:	feb870e3          	bgeu	a6,a1,15b4 <atoi+0x3e>
    return neg ? n : -n;
    15d8:	000e0563          	beqz	t3,15e2 <atoi+0x6c>
}
    15dc:	8082                	ret
        s++;
    15de:	0505                	addi	a0,a0,1
    15e0:	bf71                	j	157c <atoi+0x6>
    15e2:	4113053b          	subw	a0,t1,a7
    15e6:	8082                	ret
    while (isdigit(*s))
    15e8:	00154783          	lbu	a5,1(a0)
    15ec:	4625                	li	a2,9
        s++;
    15ee:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    15f2:	fd07859b          	addiw	a1,a5,-48
    15f6:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    15fa:	4e01                	li	t3,0
    while (isdigit(*s))
    15fc:	fab67ae3          	bgeu	a2,a1,15b0 <atoi+0x3a>
    1600:	4501                	li	a0,0
}
    1602:	8082                	ret
    while (isdigit(*s))
    1604:	00154783          	lbu	a5,1(a0)
    1608:	4625                	li	a2,9
        s++;
    160a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    160e:	fd07859b          	addiw	a1,a5,-48
    1612:	0007871b          	sext.w	a4,a5
    1616:	feb665e3          	bltu	a2,a1,1600 <atoi+0x8a>
        neg = 1;
    161a:	4e05                	li	t3,1
    161c:	bf51                	j	15b0 <atoi+0x3a>

000000000000161e <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    161e:	16060d63          	beqz	a2,1798 <memset+0x17a>
    1622:	40a007b3          	neg	a5,a0
    1626:	8b9d                	andi	a5,a5,7
    1628:	00778713          	addi	a4,a5,7
    162c:	482d                	li	a6,11
    162e:	0ff5f593          	andi	a1,a1,255
    1632:	fff60693          	addi	a3,a2,-1
    1636:	17076263          	bltu	a4,a6,179a <memset+0x17c>
    163a:	16e6ea63          	bltu	a3,a4,17ae <memset+0x190>
    163e:	16078563          	beqz	a5,17a8 <memset+0x18a>
    1642:	00b50023          	sb	a1,0(a0)
    1646:	4705                	li	a4,1
    1648:	00150e93          	addi	t4,a0,1
    164c:	14e78c63          	beq	a5,a4,17a4 <memset+0x186>
    1650:	00b500a3          	sb	a1,1(a0)
    1654:	4709                	li	a4,2
    1656:	00250e93          	addi	t4,a0,2
    165a:	14e78d63          	beq	a5,a4,17b4 <memset+0x196>
    165e:	00b50123          	sb	a1,2(a0)
    1662:	470d                	li	a4,3
    1664:	00350e93          	addi	t4,a0,3
    1668:	12e78b63          	beq	a5,a4,179e <memset+0x180>
    166c:	00b501a3          	sb	a1,3(a0)
    1670:	4711                	li	a4,4
    1672:	00450e93          	addi	t4,a0,4
    1676:	14e78163          	beq	a5,a4,17b8 <memset+0x19a>
    167a:	00b50223          	sb	a1,4(a0)
    167e:	4715                	li	a4,5
    1680:	00550e93          	addi	t4,a0,5
    1684:	12e78c63          	beq	a5,a4,17bc <memset+0x19e>
    1688:	00b502a3          	sb	a1,5(a0)
    168c:	471d                	li	a4,7
    168e:	00650e93          	addi	t4,a0,6
    1692:	12e79763          	bne	a5,a4,17c0 <memset+0x1a2>
    1696:	00750e93          	addi	t4,a0,7
    169a:	00b50323          	sb	a1,6(a0)
    169e:	4f1d                	li	t5,7
    16a0:	00859713          	slli	a4,a1,0x8
    16a4:	8f4d                	or	a4,a4,a1
    16a6:	01059e13          	slli	t3,a1,0x10
    16aa:	01c76e33          	or	t3,a4,t3
    16ae:	01859313          	slli	t1,a1,0x18
    16b2:	006e6333          	or	t1,t3,t1
    16b6:	02059893          	slli	a7,a1,0x20
    16ba:	011368b3          	or	a7,t1,a7
    16be:	02859813          	slli	a6,a1,0x28
    16c2:	40f60333          	sub	t1,a2,a5
    16c6:	0108e833          	or	a6,a7,a6
    16ca:	03059693          	slli	a3,a1,0x30
    16ce:	00d866b3          	or	a3,a6,a3
    16d2:	03859713          	slli	a4,a1,0x38
    16d6:	97aa                	add	a5,a5,a0
    16d8:	ff837813          	andi	a6,t1,-8
    16dc:	8f55                	or	a4,a4,a3
    16de:	00f806b3          	add	a3,a6,a5
    16e2:	e398                	sd	a4,0(a5)
    16e4:	07a1                	addi	a5,a5,8
    16e6:	fed79ee3          	bne	a5,a3,16e2 <memset+0xc4>
    16ea:	ff837693          	andi	a3,t1,-8
    16ee:	00de87b3          	add	a5,t4,a3
    16f2:	01e6873b          	addw	a4,a3,t5
    16f6:	0ad30663          	beq	t1,a3,17a2 <memset+0x184>
    16fa:	00b78023          	sb	a1,0(a5)
    16fe:	0017069b          	addiw	a3,a4,1
    1702:	08c6fb63          	bgeu	a3,a2,1798 <memset+0x17a>
    1706:	00b780a3          	sb	a1,1(a5)
    170a:	0027069b          	addiw	a3,a4,2
    170e:	08c6f563          	bgeu	a3,a2,1798 <memset+0x17a>
    1712:	00b78123          	sb	a1,2(a5)
    1716:	0037069b          	addiw	a3,a4,3
    171a:	06c6ff63          	bgeu	a3,a2,1798 <memset+0x17a>
    171e:	00b781a3          	sb	a1,3(a5)
    1722:	0047069b          	addiw	a3,a4,4
    1726:	06c6f963          	bgeu	a3,a2,1798 <memset+0x17a>
    172a:	00b78223          	sb	a1,4(a5)
    172e:	0057069b          	addiw	a3,a4,5
    1732:	06c6f363          	bgeu	a3,a2,1798 <memset+0x17a>
    1736:	00b782a3          	sb	a1,5(a5)
    173a:	0067069b          	addiw	a3,a4,6
    173e:	04c6fd63          	bgeu	a3,a2,1798 <memset+0x17a>
    1742:	00b78323          	sb	a1,6(a5)
    1746:	0077069b          	addiw	a3,a4,7
    174a:	04c6f763          	bgeu	a3,a2,1798 <memset+0x17a>
    174e:	00b783a3          	sb	a1,7(a5)
    1752:	0087069b          	addiw	a3,a4,8
    1756:	04c6f163          	bgeu	a3,a2,1798 <memset+0x17a>
    175a:	00b78423          	sb	a1,8(a5)
    175e:	0097069b          	addiw	a3,a4,9
    1762:	02c6fb63          	bgeu	a3,a2,1798 <memset+0x17a>
    1766:	00b784a3          	sb	a1,9(a5)
    176a:	00a7069b          	addiw	a3,a4,10
    176e:	02c6f563          	bgeu	a3,a2,1798 <memset+0x17a>
    1772:	00b78523          	sb	a1,10(a5)
    1776:	00b7069b          	addiw	a3,a4,11
    177a:	00c6ff63          	bgeu	a3,a2,1798 <memset+0x17a>
    177e:	00b785a3          	sb	a1,11(a5)
    1782:	00c7069b          	addiw	a3,a4,12
    1786:	00c6f963          	bgeu	a3,a2,1798 <memset+0x17a>
    178a:	00b78623          	sb	a1,12(a5)
    178e:	2735                	addiw	a4,a4,13
    1790:	00c77463          	bgeu	a4,a2,1798 <memset+0x17a>
    1794:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1798:	8082                	ret
    179a:	472d                	li	a4,11
    179c:	bd79                	j	163a <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    179e:	4f0d                	li	t5,3
    17a0:	b701                	j	16a0 <memset+0x82>
    17a2:	8082                	ret
    17a4:	4f05                	li	t5,1
    17a6:	bded                	j	16a0 <memset+0x82>
    17a8:	8eaa                	mv	t4,a0
    17aa:	4f01                	li	t5,0
    17ac:	bdd5                	j	16a0 <memset+0x82>
    17ae:	87aa                	mv	a5,a0
    17b0:	4701                	li	a4,0
    17b2:	b7a1                	j	16fa <memset+0xdc>
    17b4:	4f09                	li	t5,2
    17b6:	b5ed                	j	16a0 <memset+0x82>
    17b8:	4f11                	li	t5,4
    17ba:	b5dd                	j	16a0 <memset+0x82>
    17bc:	4f15                	li	t5,5
    17be:	b5cd                	j	16a0 <memset+0x82>
    17c0:	4f19                	li	t5,6
    17c2:	bdf9                	j	16a0 <memset+0x82>

00000000000017c4 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17c4:	00054783          	lbu	a5,0(a0)
    17c8:	0005c703          	lbu	a4,0(a1)
    17cc:	00e79863          	bne	a5,a4,17dc <strcmp+0x18>
    17d0:	0505                	addi	a0,a0,1
    17d2:	0585                	addi	a1,a1,1
    17d4:	fbe5                	bnez	a5,17c4 <strcmp>
    17d6:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17d8:	9d19                	subw	a0,a0,a4
    17da:	8082                	ret
    17dc:	0007851b          	sext.w	a0,a5
    17e0:	bfe5                	j	17d8 <strcmp+0x14>

00000000000017e2 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17e2:	ce05                	beqz	a2,181a <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17e4:	00054703          	lbu	a4,0(a0)
    17e8:	0005c783          	lbu	a5,0(a1)
    17ec:	cb0d                	beqz	a4,181e <strncmp+0x3c>
    if (!n--)
    17ee:	167d                	addi	a2,a2,-1
    17f0:	00c506b3          	add	a3,a0,a2
    17f4:	a819                	j	180a <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17f6:	00a68e63          	beq	a3,a0,1812 <strncmp+0x30>
    17fa:	0505                	addi	a0,a0,1
    17fc:	00e79b63          	bne	a5,a4,1812 <strncmp+0x30>
    1800:	00054703          	lbu	a4,0(a0)
    1804:	0005c783          	lbu	a5,0(a1)
    1808:	cb19                	beqz	a4,181e <strncmp+0x3c>
    180a:	0005c783          	lbu	a5,0(a1)
    180e:	0585                	addi	a1,a1,1
    1810:	f3fd                	bnez	a5,17f6 <strncmp+0x14>
        ;
    return *l - *r;
    1812:	0007051b          	sext.w	a0,a4
    1816:	9d1d                	subw	a0,a0,a5
    1818:	8082                	ret
        return 0;
    181a:	4501                	li	a0,0
}
    181c:	8082                	ret
    181e:	4501                	li	a0,0
    return *l - *r;
    1820:	9d1d                	subw	a0,a0,a5
    1822:	8082                	ret

0000000000001824 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1824:	00757793          	andi	a5,a0,7
    1828:	cf89                	beqz	a5,1842 <strlen+0x1e>
    182a:	87aa                	mv	a5,a0
    182c:	a029                	j	1836 <strlen+0x12>
    182e:	0785                	addi	a5,a5,1
    1830:	0077f713          	andi	a4,a5,7
    1834:	cb01                	beqz	a4,1844 <strlen+0x20>
        if (!*s)
    1836:	0007c703          	lbu	a4,0(a5)
    183a:	fb75                	bnez	a4,182e <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    183c:	40a78533          	sub	a0,a5,a0
}
    1840:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1842:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1844:	6394                	ld	a3,0(a5)
    1846:	00000597          	auipc	a1,0x0
    184a:	6925b583          	ld	a1,1682(a1) # 1ed8 <__clone+0x98>
    184e:	00000617          	auipc	a2,0x0
    1852:	69263603          	ld	a2,1682(a2) # 1ee0 <__clone+0xa0>
    1856:	a019                	j	185c <strlen+0x38>
    1858:	6794                	ld	a3,8(a5)
    185a:	07a1                	addi	a5,a5,8
    185c:	00b68733          	add	a4,a3,a1
    1860:	fff6c693          	not	a3,a3
    1864:	8f75                	and	a4,a4,a3
    1866:	8f71                	and	a4,a4,a2
    1868:	db65                	beqz	a4,1858 <strlen+0x34>
    for (; *s; s++)
    186a:	0007c703          	lbu	a4,0(a5)
    186e:	d779                	beqz	a4,183c <strlen+0x18>
    1870:	0017c703          	lbu	a4,1(a5)
    1874:	0785                	addi	a5,a5,1
    1876:	d379                	beqz	a4,183c <strlen+0x18>
    1878:	0017c703          	lbu	a4,1(a5)
    187c:	0785                	addi	a5,a5,1
    187e:	fb6d                	bnez	a4,1870 <strlen+0x4c>
    1880:	bf75                	j	183c <strlen+0x18>

0000000000001882 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1882:	00757713          	andi	a4,a0,7
{
    1886:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1888:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    188c:	cb19                	beqz	a4,18a2 <memchr+0x20>
    188e:	ce25                	beqz	a2,1906 <memchr+0x84>
    1890:	0007c703          	lbu	a4,0(a5)
    1894:	04b70e63          	beq	a4,a1,18f0 <memchr+0x6e>
    1898:	0785                	addi	a5,a5,1
    189a:	0077f713          	andi	a4,a5,7
    189e:	167d                	addi	a2,a2,-1
    18a0:	f77d                	bnez	a4,188e <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18a2:	4501                	li	a0,0
    if (n && *s != c)
    18a4:	c235                	beqz	a2,1908 <memchr+0x86>
    18a6:	0007c703          	lbu	a4,0(a5)
    18aa:	04b70363          	beq	a4,a1,18f0 <memchr+0x6e>
        size_t k = ONES * c;
    18ae:	00000517          	auipc	a0,0x0
    18b2:	63a53503          	ld	a0,1594(a0) # 1ee8 <__clone+0xa8>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18b6:	471d                	li	a4,7
        size_t k = ONES * c;
    18b8:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18bc:	02c77a63          	bgeu	a4,a2,18f0 <memchr+0x6e>
    18c0:	00000897          	auipc	a7,0x0
    18c4:	6188b883          	ld	a7,1560(a7) # 1ed8 <__clone+0x98>
    18c8:	00000817          	auipc	a6,0x0
    18cc:	61883803          	ld	a6,1560(a6) # 1ee0 <__clone+0xa0>
    18d0:	431d                	li	t1,7
    18d2:	a029                	j	18dc <memchr+0x5a>
    18d4:	1661                	addi	a2,a2,-8
    18d6:	07a1                	addi	a5,a5,8
    18d8:	02c37963          	bgeu	t1,a2,190a <memchr+0x88>
    18dc:	6398                	ld	a4,0(a5)
    18de:	8f29                	xor	a4,a4,a0
    18e0:	011706b3          	add	a3,a4,a7
    18e4:	fff74713          	not	a4,a4
    18e8:	8f75                	and	a4,a4,a3
    18ea:	01077733          	and	a4,a4,a6
    18ee:	d37d                	beqz	a4,18d4 <memchr+0x52>
    18f0:	853e                	mv	a0,a5
    18f2:	97b2                	add	a5,a5,a2
    18f4:	a021                	j	18fc <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    18f6:	0505                	addi	a0,a0,1
    18f8:	00f50763          	beq	a0,a5,1906 <memchr+0x84>
    18fc:	00054703          	lbu	a4,0(a0)
    1900:	feb71be3          	bne	a4,a1,18f6 <memchr+0x74>
    1904:	8082                	ret
    return n ? (void *)s : 0;
    1906:	4501                	li	a0,0
}
    1908:	8082                	ret
    return n ? (void *)s : 0;
    190a:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    190c:	f275                	bnez	a2,18f0 <memchr+0x6e>
}
    190e:	8082                	ret

0000000000001910 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1910:	1101                	addi	sp,sp,-32
    1912:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1914:	862e                	mv	a2,a1
{
    1916:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1918:	4581                	li	a1,0
{
    191a:	e426                	sd	s1,8(sp)
    191c:	ec06                	sd	ra,24(sp)
    191e:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1920:	f63ff0ef          	jal	ra,1882 <memchr>
    return p ? p - s : n;
    1924:	c519                	beqz	a0,1932 <strnlen+0x22>
}
    1926:	60e2                	ld	ra,24(sp)
    1928:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    192a:	8d05                	sub	a0,a0,s1
}
    192c:	64a2                	ld	s1,8(sp)
    192e:	6105                	addi	sp,sp,32
    1930:	8082                	ret
    1932:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1934:	8522                	mv	a0,s0
}
    1936:	6442                	ld	s0,16(sp)
    1938:	64a2                	ld	s1,8(sp)
    193a:	6105                	addi	sp,sp,32
    193c:	8082                	ret

000000000000193e <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    193e:	00b547b3          	xor	a5,a0,a1
    1942:	8b9d                	andi	a5,a5,7
    1944:	eb95                	bnez	a5,1978 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1946:	0075f793          	andi	a5,a1,7
    194a:	e7b1                	bnez	a5,1996 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    194c:	6198                	ld	a4,0(a1)
    194e:	00000617          	auipc	a2,0x0
    1952:	58a63603          	ld	a2,1418(a2) # 1ed8 <__clone+0x98>
    1956:	00000817          	auipc	a6,0x0
    195a:	58a83803          	ld	a6,1418(a6) # 1ee0 <__clone+0xa0>
    195e:	a029                	j	1968 <strcpy+0x2a>
    1960:	e118                	sd	a4,0(a0)
    1962:	6598                	ld	a4,8(a1)
    1964:	05a1                	addi	a1,a1,8
    1966:	0521                	addi	a0,a0,8
    1968:	00c707b3          	add	a5,a4,a2
    196c:	fff74693          	not	a3,a4
    1970:	8ff5                	and	a5,a5,a3
    1972:	0107f7b3          	and	a5,a5,a6
    1976:	d7ed                	beqz	a5,1960 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1978:	0005c783          	lbu	a5,0(a1)
    197c:	00f50023          	sb	a5,0(a0)
    1980:	c785                	beqz	a5,19a8 <strcpy+0x6a>
    1982:	0015c783          	lbu	a5,1(a1)
    1986:	0505                	addi	a0,a0,1
    1988:	0585                	addi	a1,a1,1
    198a:	00f50023          	sb	a5,0(a0)
    198e:	fbf5                	bnez	a5,1982 <strcpy+0x44>
        ;
    return d;
}
    1990:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1992:	0505                	addi	a0,a0,1
    1994:	df45                	beqz	a4,194c <strcpy+0xe>
            if (!(*d = *s))
    1996:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    199a:	0585                	addi	a1,a1,1
    199c:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    19a0:	00f50023          	sb	a5,0(a0)
    19a4:	f7fd                	bnez	a5,1992 <strcpy+0x54>
}
    19a6:	8082                	ret
    19a8:	8082                	ret

00000000000019aa <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19aa:	00b547b3          	xor	a5,a0,a1
    19ae:	8b9d                	andi	a5,a5,7
    19b0:	1a079863          	bnez	a5,1b60 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19b4:	0075f793          	andi	a5,a1,7
    19b8:	16078463          	beqz	a5,1b20 <strncpy+0x176>
    19bc:	ea01                	bnez	a2,19cc <strncpy+0x22>
    19be:	a421                	j	1bc6 <strncpy+0x21c>
    19c0:	167d                	addi	a2,a2,-1
    19c2:	0505                	addi	a0,a0,1
    19c4:	14070e63          	beqz	a4,1b20 <strncpy+0x176>
    19c8:	1a060863          	beqz	a2,1b78 <strncpy+0x1ce>
    19cc:	0005c783          	lbu	a5,0(a1)
    19d0:	0585                	addi	a1,a1,1
    19d2:	0075f713          	andi	a4,a1,7
    19d6:	00f50023          	sb	a5,0(a0)
    19da:	f3fd                	bnez	a5,19c0 <strncpy+0x16>
    19dc:	4805                	li	a6,1
    19de:	1a061863          	bnez	a2,1b8e <strncpy+0x1e4>
    19e2:	40a007b3          	neg	a5,a0
    19e6:	8b9d                	andi	a5,a5,7
    19e8:	4681                	li	a3,0
    19ea:	18061a63          	bnez	a2,1b7e <strncpy+0x1d4>
    19ee:	00778713          	addi	a4,a5,7
    19f2:	45ad                	li	a1,11
    19f4:	18b76363          	bltu	a4,a1,1b7a <strncpy+0x1d0>
    19f8:	1ae6eb63          	bltu	a3,a4,1bae <strncpy+0x204>
    19fc:	1a078363          	beqz	a5,1ba2 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a00:	00050023          	sb	zero,0(a0)
    1a04:	4685                	li	a3,1
    1a06:	00150713          	addi	a4,a0,1
    1a0a:	18d78f63          	beq	a5,a3,1ba8 <strncpy+0x1fe>
    1a0e:	000500a3          	sb	zero,1(a0)
    1a12:	4689                	li	a3,2
    1a14:	00250713          	addi	a4,a0,2
    1a18:	18d78e63          	beq	a5,a3,1bb4 <strncpy+0x20a>
    1a1c:	00050123          	sb	zero,2(a0)
    1a20:	468d                	li	a3,3
    1a22:	00350713          	addi	a4,a0,3
    1a26:	16d78c63          	beq	a5,a3,1b9e <strncpy+0x1f4>
    1a2a:	000501a3          	sb	zero,3(a0)
    1a2e:	4691                	li	a3,4
    1a30:	00450713          	addi	a4,a0,4
    1a34:	18d78263          	beq	a5,a3,1bb8 <strncpy+0x20e>
    1a38:	00050223          	sb	zero,4(a0)
    1a3c:	4695                	li	a3,5
    1a3e:	00550713          	addi	a4,a0,5
    1a42:	16d78d63          	beq	a5,a3,1bbc <strncpy+0x212>
    1a46:	000502a3          	sb	zero,5(a0)
    1a4a:	469d                	li	a3,7
    1a4c:	00650713          	addi	a4,a0,6
    1a50:	16d79863          	bne	a5,a3,1bc0 <strncpy+0x216>
    1a54:	00750713          	addi	a4,a0,7
    1a58:	00050323          	sb	zero,6(a0)
    1a5c:	40f80833          	sub	a6,a6,a5
    1a60:	ff887593          	andi	a1,a6,-8
    1a64:	97aa                	add	a5,a5,a0
    1a66:	95be                	add	a1,a1,a5
    1a68:	0007b023          	sd	zero,0(a5)
    1a6c:	07a1                	addi	a5,a5,8
    1a6e:	feb79de3          	bne	a5,a1,1a68 <strncpy+0xbe>
    1a72:	ff887593          	andi	a1,a6,-8
    1a76:	9ead                	addw	a3,a3,a1
    1a78:	00b707b3          	add	a5,a4,a1
    1a7c:	12b80863          	beq	a6,a1,1bac <strncpy+0x202>
    1a80:	00078023          	sb	zero,0(a5)
    1a84:	0016871b          	addiw	a4,a3,1
    1a88:	0ec77863          	bgeu	a4,a2,1b78 <strncpy+0x1ce>
    1a8c:	000780a3          	sb	zero,1(a5)
    1a90:	0026871b          	addiw	a4,a3,2
    1a94:	0ec77263          	bgeu	a4,a2,1b78 <strncpy+0x1ce>
    1a98:	00078123          	sb	zero,2(a5)
    1a9c:	0036871b          	addiw	a4,a3,3
    1aa0:	0cc77c63          	bgeu	a4,a2,1b78 <strncpy+0x1ce>
    1aa4:	000781a3          	sb	zero,3(a5)
    1aa8:	0046871b          	addiw	a4,a3,4
    1aac:	0cc77663          	bgeu	a4,a2,1b78 <strncpy+0x1ce>
    1ab0:	00078223          	sb	zero,4(a5)
    1ab4:	0056871b          	addiw	a4,a3,5
    1ab8:	0cc77063          	bgeu	a4,a2,1b78 <strncpy+0x1ce>
    1abc:	000782a3          	sb	zero,5(a5)
    1ac0:	0066871b          	addiw	a4,a3,6
    1ac4:	0ac77a63          	bgeu	a4,a2,1b78 <strncpy+0x1ce>
    1ac8:	00078323          	sb	zero,6(a5)
    1acc:	0076871b          	addiw	a4,a3,7
    1ad0:	0ac77463          	bgeu	a4,a2,1b78 <strncpy+0x1ce>
    1ad4:	000783a3          	sb	zero,7(a5)
    1ad8:	0086871b          	addiw	a4,a3,8
    1adc:	08c77e63          	bgeu	a4,a2,1b78 <strncpy+0x1ce>
    1ae0:	00078423          	sb	zero,8(a5)
    1ae4:	0096871b          	addiw	a4,a3,9
    1ae8:	08c77863          	bgeu	a4,a2,1b78 <strncpy+0x1ce>
    1aec:	000784a3          	sb	zero,9(a5)
    1af0:	00a6871b          	addiw	a4,a3,10
    1af4:	08c77263          	bgeu	a4,a2,1b78 <strncpy+0x1ce>
    1af8:	00078523          	sb	zero,10(a5)
    1afc:	00b6871b          	addiw	a4,a3,11
    1b00:	06c77c63          	bgeu	a4,a2,1b78 <strncpy+0x1ce>
    1b04:	000785a3          	sb	zero,11(a5)
    1b08:	00c6871b          	addiw	a4,a3,12
    1b0c:	06c77663          	bgeu	a4,a2,1b78 <strncpy+0x1ce>
    1b10:	00078623          	sb	zero,12(a5)
    1b14:	26b5                	addiw	a3,a3,13
    1b16:	06c6f163          	bgeu	a3,a2,1b78 <strncpy+0x1ce>
    1b1a:	000786a3          	sb	zero,13(a5)
    1b1e:	8082                	ret
            ;
        if (!n || !*s)
    1b20:	c645                	beqz	a2,1bc8 <strncpy+0x21e>
    1b22:	0005c783          	lbu	a5,0(a1)
    1b26:	ea078be3          	beqz	a5,19dc <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b2a:	479d                	li	a5,7
    1b2c:	02c7ff63          	bgeu	a5,a2,1b6a <strncpy+0x1c0>
    1b30:	00000897          	auipc	a7,0x0
    1b34:	3a88b883          	ld	a7,936(a7) # 1ed8 <__clone+0x98>
    1b38:	00000817          	auipc	a6,0x0
    1b3c:	3a883803          	ld	a6,936(a6) # 1ee0 <__clone+0xa0>
    1b40:	431d                	li	t1,7
    1b42:	6198                	ld	a4,0(a1)
    1b44:	011707b3          	add	a5,a4,a7
    1b48:	fff74693          	not	a3,a4
    1b4c:	8ff5                	and	a5,a5,a3
    1b4e:	0107f7b3          	and	a5,a5,a6
    1b52:	ef81                	bnez	a5,1b6a <strncpy+0x1c0>
            *wd = *ws;
    1b54:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b56:	1661                	addi	a2,a2,-8
    1b58:	05a1                	addi	a1,a1,8
    1b5a:	0521                	addi	a0,a0,8
    1b5c:	fec363e3          	bltu	t1,a2,1b42 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b60:	e609                	bnez	a2,1b6a <strncpy+0x1c0>
    1b62:	a08d                	j	1bc4 <strncpy+0x21a>
    1b64:	167d                	addi	a2,a2,-1
    1b66:	0505                	addi	a0,a0,1
    1b68:	ca01                	beqz	a2,1b78 <strncpy+0x1ce>
    1b6a:	0005c783          	lbu	a5,0(a1)
    1b6e:	0585                	addi	a1,a1,1
    1b70:	00f50023          	sb	a5,0(a0)
    1b74:	fbe5                	bnez	a5,1b64 <strncpy+0x1ba>
        ;
tail:
    1b76:	b59d                	j	19dc <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1b78:	8082                	ret
    1b7a:	472d                	li	a4,11
    1b7c:	bdb5                	j	19f8 <strncpy+0x4e>
    1b7e:	00778713          	addi	a4,a5,7
    1b82:	45ad                	li	a1,11
    1b84:	fff60693          	addi	a3,a2,-1
    1b88:	e6b778e3          	bgeu	a4,a1,19f8 <strncpy+0x4e>
    1b8c:	b7fd                	j	1b7a <strncpy+0x1d0>
    1b8e:	40a007b3          	neg	a5,a0
    1b92:	8832                	mv	a6,a2
    1b94:	8b9d                	andi	a5,a5,7
    1b96:	4681                	li	a3,0
    1b98:	e4060be3          	beqz	a2,19ee <strncpy+0x44>
    1b9c:	b7cd                	j	1b7e <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b9e:	468d                	li	a3,3
    1ba0:	bd75                	j	1a5c <strncpy+0xb2>
    1ba2:	872a                	mv	a4,a0
    1ba4:	4681                	li	a3,0
    1ba6:	bd5d                	j	1a5c <strncpy+0xb2>
    1ba8:	4685                	li	a3,1
    1baa:	bd4d                	j	1a5c <strncpy+0xb2>
    1bac:	8082                	ret
    1bae:	87aa                	mv	a5,a0
    1bb0:	4681                	li	a3,0
    1bb2:	b5f9                	j	1a80 <strncpy+0xd6>
    1bb4:	4689                	li	a3,2
    1bb6:	b55d                	j	1a5c <strncpy+0xb2>
    1bb8:	4691                	li	a3,4
    1bba:	b54d                	j	1a5c <strncpy+0xb2>
    1bbc:	4695                	li	a3,5
    1bbe:	bd79                	j	1a5c <strncpy+0xb2>
    1bc0:	4699                	li	a3,6
    1bc2:	bd69                	j	1a5c <strncpy+0xb2>
    1bc4:	8082                	ret
    1bc6:	8082                	ret
    1bc8:	8082                	ret

0000000000001bca <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1bca:	87aa                	mv	a5,a0
    1bcc:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1bce:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1bd2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1bd6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1bd8:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bda:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1bde:	2501                	sext.w	a0,a0
    1be0:	8082                	ret

0000000000001be2 <openat>:
    register long a7 __asm__("a7") = n;
    1be2:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1be6:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bea:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1bee:	2501                	sext.w	a0,a0
    1bf0:	8082                	ret

0000000000001bf2 <close>:
    register long a7 __asm__("a7") = n;
    1bf2:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1bf6:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1bfa:	2501                	sext.w	a0,a0
    1bfc:	8082                	ret

0000000000001bfe <read>:
    register long a7 __asm__("a7") = n;
    1bfe:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c02:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c06:	8082                	ret

0000000000001c08 <write>:
    register long a7 __asm__("a7") = n;
    1c08:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c0c:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c10:	8082                	ret

0000000000001c12 <getpid>:
    register long a7 __asm__("a7") = n;
    1c12:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c16:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c1a:	2501                	sext.w	a0,a0
    1c1c:	8082                	ret

0000000000001c1e <getppid>:
    register long a7 __asm__("a7") = n;
    1c1e:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c22:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c26:	2501                	sext.w	a0,a0
    1c28:	8082                	ret

0000000000001c2a <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c2a:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c2e:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c32:	2501                	sext.w	a0,a0
    1c34:	8082                	ret

0000000000001c36 <fork>:
    register long a7 __asm__("a7") = n;
    1c36:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c3a:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c3c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c3e:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c42:	2501                	sext.w	a0,a0
    1c44:	8082                	ret

0000000000001c46 <clone>:
// 子进程执行的执行的函数指针 | 函数参数 | 栈地址 | 栈的大小 | 标志位
pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c46:	85b2                	mv	a1,a2
    1c48:	863a                	mv	a2,a4
    if (stack)
    1c4a:	c191                	beqz	a1,1c4e <clone+0x8>
	stack += stack_size;
    1c4c:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c4e:	4781                	li	a5,0
    1c50:	4701                	li	a4,0
    1c52:	4681                	li	a3,0
    1c54:	2601                	sext.w	a2,a2
    1c56:	a2ed                	j	1e40 <__clone>

0000000000001c58 <exit>:
    register long a7 __asm__("a7") = n;
    1c58:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c5c:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c60:	8082                	ret

0000000000001c62 <waitpid>:
    register long a7 __asm__("a7") = n;
    1c62:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c66:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c68:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c6c:	2501                	sext.w	a0,a0
    1c6e:	8082                	ret

0000000000001c70 <exec>:
    register long a7 __asm__("a7") = n;
    1c70:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1c74:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1c78:	2501                	sext.w	a0,a0
    1c7a:	8082                	ret

0000000000001c7c <execve>:
    register long a7 __asm__("a7") = n;
    1c7c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c80:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1c84:	2501                	sext.w	a0,a0
    1c86:	8082                	ret

0000000000001c88 <times>:
    register long a7 __asm__("a7") = n;
    1c88:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1c8c:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1c90:	2501                	sext.w	a0,a0
    1c92:	8082                	ret

0000000000001c94 <get_time>:

int64 get_time()
{
    1c94:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1c96:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1c9a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1c9c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c9e:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1ca2:	2501                	sext.w	a0,a0
    1ca4:	ed09                	bnez	a0,1cbe <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ca6:	67a2                	ld	a5,8(sp)
    1ca8:	3e800713          	li	a4,1000
    1cac:	00015503          	lhu	a0,0(sp)
    1cb0:	02e7d7b3          	divu	a5,a5,a4
    1cb4:	02e50533          	mul	a0,a0,a4
    1cb8:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1cba:	0141                	addi	sp,sp,16
    1cbc:	8082                	ret
        return -1;
    1cbe:	557d                	li	a0,-1
    1cc0:	bfed                	j	1cba <get_time+0x26>

0000000000001cc2 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1cc2:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cc6:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1cca:	2501                	sext.w	a0,a0
    1ccc:	8082                	ret

0000000000001cce <time>:
    register long a7 __asm__("a7") = n;
    1cce:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1cd2:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1cd6:	2501                	sext.w	a0,a0
    1cd8:	8082                	ret

0000000000001cda <sleep>:

int sleep(unsigned long long time)
{
    1cda:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1cdc:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1cde:	850a                	mv	a0,sp
    1ce0:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1ce2:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1ce6:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ce8:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1cec:	e501                	bnez	a0,1cf4 <sleep+0x1a>
    return 0;
    1cee:	4501                	li	a0,0
}
    1cf0:	0141                	addi	sp,sp,16
    1cf2:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1cf4:	4502                	lw	a0,0(sp)
}
    1cf6:	0141                	addi	sp,sp,16
    1cf8:	8082                	ret

0000000000001cfa <set_priority>:
    register long a7 __asm__("a7") = n;
    1cfa:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1cfe:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d02:	2501                	sext.w	a0,a0
    1d04:	8082                	ret

0000000000001d06 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d06:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d0a:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d0e:	8082                	ret

0000000000001d10 <munmap>:
    register long a7 __asm__("a7") = n;
    1d10:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d14:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d18:	2501                	sext.w	a0,a0
    1d1a:	8082                	ret

0000000000001d1c <wait>:

int wait(int *code)
{
    1d1c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d1e:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d22:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d24:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d26:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d28:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d2c:	2501                	sext.w	a0,a0
    1d2e:	8082                	ret

0000000000001d30 <spawn>:
    register long a7 __asm__("a7") = n;
    1d30:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d34:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d38:	2501                	sext.w	a0,a0
    1d3a:	8082                	ret

0000000000001d3c <mailread>:
    register long a7 __asm__("a7") = n;
    1d3c:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d40:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d44:	2501                	sext.w	a0,a0
    1d46:	8082                	ret

0000000000001d48 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d48:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d4c:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d50:	2501                	sext.w	a0,a0
    1d52:	8082                	ret

0000000000001d54 <fstat>:
    register long a7 __asm__("a7") = n;
    1d54:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d58:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d5c:	2501                	sext.w	a0,a0
    1d5e:	8082                	ret

0000000000001d60 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d60:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d62:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d66:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d68:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d6c:	2501                	sext.w	a0,a0
    1d6e:	8082                	ret

0000000000001d70 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1d70:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d72:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1d76:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d78:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1d7c:	2501                	sext.w	a0,a0
    1d7e:	8082                	ret

0000000000001d80 <link>:

int link(char *old_path, char *new_path)
{
    1d80:	87aa                	mv	a5,a0
    1d82:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1d84:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1d88:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d8c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1d8e:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1d92:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d94:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1d98:	2501                	sext.w	a0,a0
    1d9a:	8082                	ret

0000000000001d9c <unlink>:

int unlink(char *path)
{
    1d9c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d9e:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1da2:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1da6:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da8:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1dac:	2501                	sext.w	a0,a0
    1dae:	8082                	ret

0000000000001db0 <uname>:
    register long a7 __asm__("a7") = n;
    1db0:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1db4:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1db8:	2501                	sext.w	a0,a0
    1dba:	8082                	ret

0000000000001dbc <brk>:
    register long a7 __asm__("a7") = n;
    1dbc:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1dc0:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <getcwd>:
    register long a7 __asm__("a7") = n;
    1dc8:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dca:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1dce:	8082                	ret

0000000000001dd0 <chdir>:
    register long a7 __asm__("a7") = n;
    1dd0:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1dd4:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1dd8:	2501                	sext.w	a0,a0
    1dda:	8082                	ret

0000000000001ddc <mkdir>:

int mkdir(const char *path, mode_t mode){
    1ddc:	862e                	mv	a2,a1
    1dde:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1de0:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1de2:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1de6:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dea:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dec:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dee:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1df2:	2501                	sext.w	a0,a0
    1df4:	8082                	ret

0000000000001df6 <getdents>:
    register long a7 __asm__("a7") = n;
    1df6:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfa:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1dfe:	2501                	sext.w	a0,a0
    1e00:	8082                	ret

0000000000001e02 <pipe>:
    register long a7 __asm__("a7") = n;
    1e02:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e06:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e08:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e0c:	2501                	sext.w	a0,a0
    1e0e:	8082                	ret

0000000000001e10 <dup>:
    register long a7 __asm__("a7") = n;
    1e10:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e12:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e16:	2501                	sext.w	a0,a0
    1e18:	8082                	ret

0000000000001e1a <dup2>:
    register long a7 __asm__("a7") = n;
    1e1a:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e1c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e1e:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e22:	2501                	sext.w	a0,a0
    1e24:	8082                	ret

0000000000001e26 <mount>:
    register long a7 __asm__("a7") = n;
    1e26:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e2a:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e2e:	2501                	sext.w	a0,a0
    1e30:	8082                	ret

0000000000001e32 <umount>:
    register long a7 __asm__("a7") = n;
    1e32:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e36:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e38:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e3c:	2501                	sext.w	a0,a0
    1e3e:	8082                	ret

0000000000001e40 <__clone>:
.global __clone
.type  __clone, %function
# 函数指针 | 栈地址 | 标志位
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e40:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e42:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e44:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e46:	8532                	mv	a0,a2
	mv a2, a4
    1e48:	863a                	mv	a2,a4
	mv a3, a5
    1e4a:	86be                	mv	a3,a5
	mv a4, a6
    1e4c:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e4e:	0dc00893          	li	a7,220
	ecall
    1e52:	00000073          	ecall

	beqz a0, 1f
    1e56:	c111                	beqz	a0,1e5a <__clone+0x1a>
	# Parent
	ret
    1e58:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e5a:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e5c:	6522                	ld	a0,8(sp)
	jalr a1
    1e5e:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e60:	05d00893          	li	a7,93
	ecall
    1e64:	00000073          	ecall
