
/home/lmq/lmq/cscc/xv6-k210/test/build/riscv64/dup:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a069                	j	108c <__start_main>

0000000000001004 <test_dup>:
/*
 * 测试通过时应输出：
 * "  new fd is 3."
 */

void test_dup(){
    1004:	1101                	addi	sp,sp,-32
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	e5250513          	addi	a0,a0,-430 # 1e58 <__clone+0x2a>
void test_dup(){
    100e:	ec06                	sd	ra,24(sp)
	TEST_START(__func__);
    1010:	27a000ef          	jal	ra,128a <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	ed450513          	addi	a0,a0,-300 # 1ee8 <__func__.1165>
    101c:	26e000ef          	jal	ra,128a <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	e5050513          	addi	a0,a0,-432 # 1e70 <__clone+0x42>
    1028:	262000ef          	jal	ra,128a <puts>
	int fd = dup(STDOUT);
    102c:	4505                	li	a0,1
    102e:	5d1000ef          	jal	ra,1dfe <dup>
    1032:	85aa                	mv	a1,a0
	assert(fd >=0);
    1034:	02054b63          	bltz	a0,106a <test_dup+0x66>
	printf("  new fd is %d.\n", fd);
    1038:	00001517          	auipc	a0,0x1
    103c:	e6850513          	addi	a0,a0,-408 # 1ea0 <__clone+0x72>
    1040:	26c000ef          	jal	ra,12ac <printf>
	TEST_END(__func__);
    1044:	00001517          	auipc	a0,0x1
    1048:	e7450513          	addi	a0,a0,-396 # 1eb8 <__clone+0x8a>
    104c:	23e000ef          	jal	ra,128a <puts>
    1050:	00001517          	auipc	a0,0x1
    1054:	e9850513          	addi	a0,a0,-360 # 1ee8 <__func__.1165>
    1058:	232000ef          	jal	ra,128a <puts>
}
    105c:	60e2                	ld	ra,24(sp)
	TEST_END(__func__);
    105e:	00001517          	auipc	a0,0x1
    1062:	e1250513          	addi	a0,a0,-494 # 1e70 <__clone+0x42>
}
    1066:	6105                	addi	sp,sp,32
	TEST_END(__func__);
    1068:	a40d                	j	128a <puts>
    106a:	e42a                	sd	a0,8(sp)
	assert(fd >=0);
    106c:	00001517          	auipc	a0,0x1
    1070:	e1450513          	addi	a0,a0,-492 # 1e80 <__clone+0x52>
    1074:	4c0000ef          	jal	ra,1534 <panic>
    1078:	65a2                	ld	a1,8(sp)
    107a:	bf7d                	j	1038 <test_dup+0x34>

000000000000107c <main>:

int main(void) {
    107c:	1141                	addi	sp,sp,-16
    107e:	e406                	sd	ra,8(sp)
	test_dup();
    1080:	f85ff0ef          	jal	ra,1004 <test_dup>
	return 0;
}
    1084:	60a2                	ld	ra,8(sp)
    1086:	4501                	li	a0,0
    1088:	0141                	addi	sp,sp,16
    108a:	8082                	ret

000000000000108c <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    108c:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    108e:	4108                	lw	a0,0(a0)
{
    1090:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1092:	05a1                	addi	a1,a1,8
{
    1094:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1096:	fe7ff0ef          	jal	ra,107c <main>
    109a:	3ad000ef          	jal	ra,1c46 <exit>
	return 0;
}
    109e:	60a2                	ld	ra,8(sp)
    10a0:	4501                	li	a0,0
    10a2:	0141                	addi	sp,sp,16
    10a4:	8082                	ret

00000000000010a6 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10a6:	7179                	addi	sp,sp,-48
    10a8:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10aa:	12054b63          	bltz	a0,11e0 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10ae:	02b577bb          	remuw	a5,a0,a1
    10b2:	00001697          	auipc	a3,0x1
    10b6:	e4668693          	addi	a3,a3,-442 # 1ef8 <digits>
    buf[16] = 0;
    10ba:	00010c23          	sb	zero,24(sp)
    i = 15;
    10be:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    10c2:	1782                	slli	a5,a5,0x20
    10c4:	9381                	srli	a5,a5,0x20
    10c6:	97b6                	add	a5,a5,a3
    10c8:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10cc:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10d0:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10d4:	16b56263          	bltu	a0,a1,1238 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    10d8:	02e8763b          	remuw	a2,a6,a4
    10dc:	1602                	slli	a2,a2,0x20
    10de:	9201                	srli	a2,a2,0x20
    10e0:	9636                	add	a2,a2,a3
    10e2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10e6:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    10ea:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10ee:	12e86963          	bltu	a6,a4,1220 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    10f2:	02e5f63b          	remuw	a2,a1,a4
    10f6:	1602                	slli	a2,a2,0x20
    10f8:	9201                	srli	a2,a2,0x20
    10fa:	9636                	add	a2,a2,a3
    10fc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1100:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1104:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1108:	10e5ef63          	bltu	a1,a4,1226 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    110c:	02e8763b          	remuw	a2,a6,a4
    1110:	1602                	slli	a2,a2,0x20
    1112:	9201                	srli	a2,a2,0x20
    1114:	9636                	add	a2,a2,a3
    1116:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    111a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    111e:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1122:	10e86563          	bltu	a6,a4,122c <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    1126:	02e5f63b          	remuw	a2,a1,a4
    112a:	1602                	slli	a2,a2,0x20
    112c:	9201                	srli	a2,a2,0x20
    112e:	9636                	add	a2,a2,a3
    1130:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1134:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1138:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    113c:	0ee5eb63          	bltu	a1,a4,1232 <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    1140:	02e8763b          	remuw	a2,a6,a4
    1144:	1602                	slli	a2,a2,0x20
    1146:	9201                	srli	a2,a2,0x20
    1148:	9636                	add	a2,a2,a3
    114a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    114e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1152:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1156:	0ce86263          	bltu	a6,a4,121a <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    115a:	02e5f63b          	remuw	a2,a1,a4
    115e:	1602                	slli	a2,a2,0x20
    1160:	9201                	srli	a2,a2,0x20
    1162:	9636                	add	a2,a2,a3
    1164:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1168:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    116c:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1170:	0ce5e663          	bltu	a1,a4,123c <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    1174:	02e8763b          	remuw	a2,a6,a4
    1178:	1602                	slli	a2,a2,0x20
    117a:	9201                	srli	a2,a2,0x20
    117c:	9636                	add	a2,a2,a3
    117e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1182:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1186:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    118a:	0ae86c63          	bltu	a6,a4,1242 <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    118e:	02e5f63b          	remuw	a2,a1,a4
    1192:	1602                	slli	a2,a2,0x20
    1194:	9201                	srli	a2,a2,0x20
    1196:	9636                	add	a2,a2,a3
    1198:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    119c:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11a0:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11a4:	0ae5e263          	bltu	a1,a4,1248 <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    11a8:	1782                	slli	a5,a5,0x20
    11aa:	9381                	srli	a5,a5,0x20
    11ac:	97b6                	add	a5,a5,a3
    11ae:	0007c703          	lbu	a4,0(a5)
    11b2:	4599                	li	a1,6
    11b4:	4795                	li	a5,5
    11b6:	00e10723          	sb	a4,14(sp)

    if (sign)
    11ba:	00055963          	bgez	a0,11cc <printint.constprop.0+0x126>
        buf[i--] = '-';
    11be:	1018                	addi	a4,sp,32
    11c0:	973e                	add	a4,a4,a5
    11c2:	02d00693          	li	a3,45
    11c6:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    11ca:	85be                	mv	a1,a5
    write(f, s, l);
    11cc:	003c                	addi	a5,sp,8
    11ce:	4641                	li	a2,16
    11d0:	9e0d                	subw	a2,a2,a1
    11d2:	4505                	li	a0,1
    11d4:	95be                	add	a1,a1,a5
    11d6:	221000ef          	jal	ra,1bf6 <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11da:	70a2                	ld	ra,40(sp)
    11dc:	6145                	addi	sp,sp,48
    11de:	8082                	ret
        x = -xx;
    11e0:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    11e4:	02b677bb          	remuw	a5,a2,a1
    11e8:	00001697          	auipc	a3,0x1
    11ec:	d1068693          	addi	a3,a3,-752 # 1ef8 <digits>
    buf[16] = 0;
    11f0:	00010c23          	sb	zero,24(sp)
    i = 15;
    11f4:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    11f8:	1782                	slli	a5,a5,0x20
    11fa:	9381                	srli	a5,a5,0x20
    11fc:	97b6                	add	a5,a5,a3
    11fe:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1202:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1206:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    120a:	ecb677e3          	bgeu	a2,a1,10d8 <printint.constprop.0+0x32>
        buf[i--] = '-';
    120e:	02d00793          	li	a5,45
    1212:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1216:	45b9                	li	a1,14
    1218:	bf55                	j	11cc <printint.constprop.0+0x126>
    121a:	47a5                	li	a5,9
    121c:	45a9                	li	a1,10
    121e:	bf71                	j	11ba <printint.constprop.0+0x114>
    1220:	47b5                	li	a5,13
    1222:	45b9                	li	a1,14
    1224:	bf59                	j	11ba <printint.constprop.0+0x114>
    1226:	47b1                	li	a5,12
    1228:	45b5                	li	a1,13
    122a:	bf41                	j	11ba <printint.constprop.0+0x114>
    122c:	47ad                	li	a5,11
    122e:	45b1                	li	a1,12
    1230:	b769                	j	11ba <printint.constprop.0+0x114>
    1232:	47a9                	li	a5,10
    1234:	45ad                	li	a1,11
    1236:	b751                	j	11ba <printint.constprop.0+0x114>
    i = 15;
    1238:	45bd                	li	a1,15
    123a:	bf49                	j	11cc <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    123c:	47a1                	li	a5,8
    123e:	45a5                	li	a1,9
    1240:	bfad                	j	11ba <printint.constprop.0+0x114>
    1242:	479d                	li	a5,7
    1244:	45a1                	li	a1,8
    1246:	bf95                	j	11ba <printint.constprop.0+0x114>
    1248:	4799                	li	a5,6
    124a:	459d                	li	a1,7
    124c:	b7bd                	j	11ba <printint.constprop.0+0x114>

000000000000124e <getchar>:
{
    124e:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1250:	00f10593          	addi	a1,sp,15
    1254:	4605                	li	a2,1
    1256:	4501                	li	a0,0
{
    1258:	ec06                	sd	ra,24(sp)
    char byte = 0;
    125a:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    125e:	18f000ef          	jal	ra,1bec <read>
}
    1262:	60e2                	ld	ra,24(sp)
    1264:	00f14503          	lbu	a0,15(sp)
    1268:	6105                	addi	sp,sp,32
    126a:	8082                	ret

000000000000126c <putchar>:
{
    126c:	1101                	addi	sp,sp,-32
    126e:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1270:	00f10593          	addi	a1,sp,15
    1274:	4605                	li	a2,1
    1276:	4505                	li	a0,1
{
    1278:	ec06                	sd	ra,24(sp)
    char byte = c;
    127a:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    127e:	179000ef          	jal	ra,1bf6 <write>
}
    1282:	60e2                	ld	ra,24(sp)
    1284:	2501                	sext.w	a0,a0
    1286:	6105                	addi	sp,sp,32
    1288:	8082                	ret

000000000000128a <puts>:
{
    128a:	1141                	addi	sp,sp,-16
    128c:	e406                	sd	ra,8(sp)
    128e:	e022                	sd	s0,0(sp)
    1290:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1292:	580000ef          	jal	ra,1812 <strlen>
    1296:	862a                	mv	a2,a0
    1298:	85a2                	mv	a1,s0
    129a:	4505                	li	a0,1
    129c:	15b000ef          	jal	ra,1bf6 <write>
}
    12a0:	60a2                	ld	ra,8(sp)
    12a2:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12a4:	957d                	srai	a0,a0,0x3f
    return r;
    12a6:	2501                	sext.w	a0,a0
}
    12a8:	0141                	addi	sp,sp,16
    12aa:	8082                	ret

00000000000012ac <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12ac:	7171                	addi	sp,sp,-176
    12ae:	fc56                	sd	s5,56(sp)
    12b0:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    12b2:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12b4:	18bc                	addi	a5,sp,120
{
    12b6:	e8ca                	sd	s2,80(sp)
    12b8:	e4ce                	sd	s3,72(sp)
    12ba:	e0d2                	sd	s4,64(sp)
    12bc:	f85a                	sd	s6,48(sp)
    12be:	f486                	sd	ra,104(sp)
    12c0:	f0a2                	sd	s0,96(sp)
    12c2:	eca6                	sd	s1,88(sp)
    12c4:	fcae                	sd	a1,120(sp)
    12c6:	e132                	sd	a2,128(sp)
    12c8:	e536                	sd	a3,136(sp)
    12ca:	e93a                	sd	a4,144(sp)
    12cc:	f142                	sd	a6,160(sp)
    12ce:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    12d0:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12d2:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    12d6:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    12da:	00001b17          	auipc	s6,0x1
    12de:	beeb0b13          	addi	s6,s6,-1042 # 1ec8 <__clone+0x9a>
    buf[i++] = '0';
    12e2:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12e6:	00001997          	auipc	s3,0x1
    12ea:	c1298993          	addi	s3,s3,-1006 # 1ef8 <digits>
        if (!*s)
    12ee:	00054783          	lbu	a5,0(a0)
    12f2:	16078a63          	beqz	a5,1466 <printf+0x1ba>
    12f6:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    12f8:	19278163          	beq	a5,s2,147a <printf+0x1ce>
    12fc:	00164783          	lbu	a5,1(a2)
    1300:	0605                	addi	a2,a2,1
    1302:	fbfd                	bnez	a5,12f8 <printf+0x4c>
    1304:	84b2                	mv	s1,a2
        l = z - a;
    1306:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    130a:	85aa                	mv	a1,a0
    130c:	8622                	mv	a2,s0
    130e:	4505                	li	a0,1
    1310:	0e7000ef          	jal	ra,1bf6 <write>
        if (l)
    1314:	18041c63          	bnez	s0,14ac <printf+0x200>
        if (s[1] == 0)
    1318:	0014c783          	lbu	a5,1(s1)
    131c:	14078563          	beqz	a5,1466 <printf+0x1ba>
        switch (s[1])
    1320:	1d478063          	beq	a5,s4,14e0 <printf+0x234>
    1324:	18fa6663          	bltu	s4,a5,14b0 <printf+0x204>
    1328:	06400713          	li	a4,100
    132c:	1ae78063          	beq	a5,a4,14cc <printf+0x220>
    1330:	07000713          	li	a4,112
    1334:	1ce79963          	bne	a5,a4,1506 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    1338:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    133a:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    133e:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1340:	631c                	ld	a5,0(a4)
    1342:	0721                	addi	a4,a4,8
    1344:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1346:	00479293          	slli	t0,a5,0x4
    134a:	00879f93          	slli	t6,a5,0x8
    134e:	00c79f13          	slli	t5,a5,0xc
    1352:	01079e93          	slli	t4,a5,0x10
    1356:	01479e13          	slli	t3,a5,0x14
    135a:	01879313          	slli	t1,a5,0x18
    135e:	01c79893          	slli	a7,a5,0x1c
    1362:	02479813          	slli	a6,a5,0x24
    1366:	02879513          	slli	a0,a5,0x28
    136a:	02c79593          	slli	a1,a5,0x2c
    136e:	03079693          	slli	a3,a5,0x30
    1372:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1376:	03c7d413          	srli	s0,a5,0x3c
    137a:	01c7d39b          	srliw	t2,a5,0x1c
    137e:	03c2d293          	srli	t0,t0,0x3c
    1382:	03cfdf93          	srli	t6,t6,0x3c
    1386:	03cf5f13          	srli	t5,t5,0x3c
    138a:	03cede93          	srli	t4,t4,0x3c
    138e:	03ce5e13          	srli	t3,t3,0x3c
    1392:	03c35313          	srli	t1,t1,0x3c
    1396:	03c8d893          	srli	a7,a7,0x3c
    139a:	03c85813          	srli	a6,a6,0x3c
    139e:	9171                	srli	a0,a0,0x3c
    13a0:	91f1                	srli	a1,a1,0x3c
    13a2:	92f1                	srli	a3,a3,0x3c
    13a4:	9371                	srli	a4,a4,0x3c
    13a6:	96ce                	add	a3,a3,s3
    13a8:	974e                	add	a4,a4,s3
    13aa:	944e                	add	s0,s0,s3
    13ac:	92ce                	add	t0,t0,s3
    13ae:	9fce                	add	t6,t6,s3
    13b0:	9f4e                	add	t5,t5,s3
    13b2:	9ece                	add	t4,t4,s3
    13b4:	9e4e                	add	t3,t3,s3
    13b6:	934e                	add	t1,t1,s3
    13b8:	98ce                	add	a7,a7,s3
    13ba:	93ce                	add	t2,t2,s3
    13bc:	984e                	add	a6,a6,s3
    13be:	954e                	add	a0,a0,s3
    13c0:	95ce                	add	a1,a1,s3
    13c2:	0006c083          	lbu	ra,0(a3)
    13c6:	0002c283          	lbu	t0,0(t0)
    13ca:	00074683          	lbu	a3,0(a4)
    13ce:	000fcf83          	lbu	t6,0(t6)
    13d2:	000f4f03          	lbu	t5,0(t5)
    13d6:	000ece83          	lbu	t4,0(t4)
    13da:	000e4e03          	lbu	t3,0(t3)
    13de:	00034303          	lbu	t1,0(t1)
    13e2:	0008c883          	lbu	a7,0(a7)
    13e6:	0003c383          	lbu	t2,0(t2)
    13ea:	00084803          	lbu	a6,0(a6)
    13ee:	00054503          	lbu	a0,0(a0)
    13f2:	0005c583          	lbu	a1,0(a1)
    13f6:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13fa:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13fe:	9371                	srli	a4,a4,0x3c
    1400:	8bbd                	andi	a5,a5,15
    1402:	974e                	add	a4,a4,s3
    1404:	97ce                	add	a5,a5,s3
    1406:	005105a3          	sb	t0,11(sp)
    140a:	01f10623          	sb	t6,12(sp)
    140e:	01e106a3          	sb	t5,13(sp)
    1412:	01d10723          	sb	t4,14(sp)
    1416:	01c107a3          	sb	t3,15(sp)
    141a:	00610823          	sb	t1,16(sp)
    141e:	011108a3          	sb	a7,17(sp)
    1422:	00710923          	sb	t2,18(sp)
    1426:	010109a3          	sb	a6,19(sp)
    142a:	00a10a23          	sb	a0,20(sp)
    142e:	00b10aa3          	sb	a1,21(sp)
    1432:	00110b23          	sb	ra,22(sp)
    1436:	00d10ba3          	sb	a3,23(sp)
    143a:	00810523          	sb	s0,10(sp)
    143e:	00074703          	lbu	a4,0(a4)
    1442:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1446:	002c                	addi	a1,sp,8
    1448:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    144a:	00e10c23          	sb	a4,24(sp)
    144e:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1452:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1456:	7a0000ef          	jal	ra,1bf6 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    145a:	00248513          	addi	a0,s1,2
        if (!*s)
    145e:	00054783          	lbu	a5,0(a0)
    1462:	e8079ae3          	bnez	a5,12f6 <printf+0x4a>
    }
    va_end(ap);
}
    1466:	70a6                	ld	ra,104(sp)
    1468:	7406                	ld	s0,96(sp)
    146a:	64e6                	ld	s1,88(sp)
    146c:	6946                	ld	s2,80(sp)
    146e:	69a6                	ld	s3,72(sp)
    1470:	6a06                	ld	s4,64(sp)
    1472:	7ae2                	ld	s5,56(sp)
    1474:	7b42                	ld	s6,48(sp)
    1476:	614d                	addi	sp,sp,176
    1478:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    147a:	00064783          	lbu	a5,0(a2)
    147e:	84b2                	mv	s1,a2
    1480:	01278963          	beq	a5,s2,1492 <printf+0x1e6>
    1484:	b549                	j	1306 <printf+0x5a>
    1486:	0024c783          	lbu	a5,2(s1)
    148a:	0605                	addi	a2,a2,1
    148c:	0489                	addi	s1,s1,2
    148e:	e7279ce3          	bne	a5,s2,1306 <printf+0x5a>
    1492:	0014c783          	lbu	a5,1(s1)
    1496:	ff2788e3          	beq	a5,s2,1486 <printf+0x1da>
        l = z - a;
    149a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    149e:	85aa                	mv	a1,a0
    14a0:	8622                	mv	a2,s0
    14a2:	4505                	li	a0,1
    14a4:	752000ef          	jal	ra,1bf6 <write>
        if (l)
    14a8:	e60408e3          	beqz	s0,1318 <printf+0x6c>
    14ac:	8526                	mv	a0,s1
    14ae:	b581                	j	12ee <printf+0x42>
        switch (s[1])
    14b0:	07800713          	li	a4,120
    14b4:	04e79963          	bne	a5,a4,1506 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    14b8:	6782                	ld	a5,0(sp)
    14ba:	45c1                	li	a1,16
    14bc:	4388                	lw	a0,0(a5)
    14be:	07a1                	addi	a5,a5,8
    14c0:	e03e                	sd	a5,0(sp)
    14c2:	be5ff0ef          	jal	ra,10a6 <printint.constprop.0>
        s += 2;
    14c6:	00248513          	addi	a0,s1,2
    14ca:	bf51                	j	145e <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    14cc:	6782                	ld	a5,0(sp)
    14ce:	45a9                	li	a1,10
    14d0:	4388                	lw	a0,0(a5)
    14d2:	07a1                	addi	a5,a5,8
    14d4:	e03e                	sd	a5,0(sp)
    14d6:	bd1ff0ef          	jal	ra,10a6 <printint.constprop.0>
        s += 2;
    14da:	00248513          	addi	a0,s1,2
    14de:	b741                	j	145e <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    14e0:	6782                	ld	a5,0(sp)
    14e2:	6380                	ld	s0,0(a5)
    14e4:	07a1                	addi	a5,a5,8
    14e6:	e03e                	sd	a5,0(sp)
    14e8:	c421                	beqz	s0,1530 <printf+0x284>
            l = strnlen(a, 200);
    14ea:	0c800593          	li	a1,200
    14ee:	8522                	mv	a0,s0
    14f0:	40e000ef          	jal	ra,18fe <strnlen>
    write(f, s, l);
    14f4:	0005061b          	sext.w	a2,a0
    14f8:	85a2                	mv	a1,s0
    14fa:	4505                	li	a0,1
    14fc:	6fa000ef          	jal	ra,1bf6 <write>
        s += 2;
    1500:	00248513          	addi	a0,s1,2
    1504:	bfa9                	j	145e <printf+0x1b2>
    char byte = c;
    1506:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    150a:	4605                	li	a2,1
    150c:	002c                	addi	a1,sp,8
    150e:	4505                	li	a0,1
    char byte = c;
    1510:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1514:	6e2000ef          	jal	ra,1bf6 <write>
    char byte = c;
    1518:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    151c:	4605                	li	a2,1
    151e:	002c                	addi	a1,sp,8
    1520:	4505                	li	a0,1
    char byte = c;
    1522:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1526:	6d0000ef          	jal	ra,1bf6 <write>
        s += 2;
    152a:	00248513          	addi	a0,s1,2
    152e:	bf05                	j	145e <printf+0x1b2>
                a = "(null)";
    1530:	845a                	mv	s0,s6
    1532:	bf65                	j	14ea <printf+0x23e>

0000000000001534 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1534:	1141                	addi	sp,sp,-16
    1536:	e406                	sd	ra,8(sp)
    puts(m);
    1538:	d53ff0ef          	jal	ra,128a <puts>
    exit(-100);
}
    153c:	60a2                	ld	ra,8(sp)
    exit(-100);
    153e:	f9c00513          	li	a0,-100
}
    1542:	0141                	addi	sp,sp,16
    exit(-100);
    1544:	a709                	j	1c46 <exit>

0000000000001546 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1546:	02000793          	li	a5,32
    154a:	00f50663          	beq	a0,a5,1556 <isspace+0x10>
    154e:	355d                	addiw	a0,a0,-9
    1550:	00553513          	sltiu	a0,a0,5
    1554:	8082                	ret
    1556:	4505                	li	a0,1
}
    1558:	8082                	ret

000000000000155a <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    155a:	fd05051b          	addiw	a0,a0,-48
}
    155e:	00a53513          	sltiu	a0,a0,10
    1562:	8082                	ret

0000000000001564 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1564:	02000613          	li	a2,32
    1568:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    156a:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    156e:	ff77069b          	addiw	a3,a4,-9
    1572:	04c70d63          	beq	a4,a2,15cc <atoi+0x68>
    1576:	0007079b          	sext.w	a5,a4
    157a:	04d5f963          	bgeu	a1,a3,15cc <atoi+0x68>
        s++;
    switch (*s)
    157e:	02b00693          	li	a3,43
    1582:	04d70a63          	beq	a4,a3,15d6 <atoi+0x72>
    1586:	02d00693          	li	a3,45
    158a:	06d70463          	beq	a4,a3,15f2 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    158e:	fd07859b          	addiw	a1,a5,-48
    1592:	4625                	li	a2,9
    1594:	873e                	mv	a4,a5
    1596:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1598:	4e01                	li	t3,0
    while (isdigit(*s))
    159a:	04b66a63          	bltu	a2,a1,15ee <atoi+0x8a>
    int n = 0, neg = 0;
    159e:	4501                	li	a0,0
    while (isdigit(*s))
    15a0:	4825                	li	a6,9
    15a2:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    15a6:	0025179b          	slliw	a5,a0,0x2
    15aa:	9d3d                	addw	a0,a0,a5
    15ac:	fd07031b          	addiw	t1,a4,-48
    15b0:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15b4:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15b8:	0685                	addi	a3,a3,1
    15ba:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15be:	0006071b          	sext.w	a4,a2
    15c2:	feb870e3          	bgeu	a6,a1,15a2 <atoi+0x3e>
    return neg ? n : -n;
    15c6:	000e0563          	beqz	t3,15d0 <atoi+0x6c>
}
    15ca:	8082                	ret
        s++;
    15cc:	0505                	addi	a0,a0,1
    15ce:	bf71                	j	156a <atoi+0x6>
    15d0:	4113053b          	subw	a0,t1,a7
    15d4:	8082                	ret
    while (isdigit(*s))
    15d6:	00154783          	lbu	a5,1(a0)
    15da:	4625                	li	a2,9
        s++;
    15dc:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    15e0:	fd07859b          	addiw	a1,a5,-48
    15e4:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    15e8:	4e01                	li	t3,0
    while (isdigit(*s))
    15ea:	fab67ae3          	bgeu	a2,a1,159e <atoi+0x3a>
    15ee:	4501                	li	a0,0
}
    15f0:	8082                	ret
    while (isdigit(*s))
    15f2:	00154783          	lbu	a5,1(a0)
    15f6:	4625                	li	a2,9
        s++;
    15f8:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    15fc:	fd07859b          	addiw	a1,a5,-48
    1600:	0007871b          	sext.w	a4,a5
    1604:	feb665e3          	bltu	a2,a1,15ee <atoi+0x8a>
        neg = 1;
    1608:	4e05                	li	t3,1
    160a:	bf51                	j	159e <atoi+0x3a>

000000000000160c <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    160c:	16060d63          	beqz	a2,1786 <memset+0x17a>
    1610:	40a007b3          	neg	a5,a0
    1614:	8b9d                	andi	a5,a5,7
    1616:	00778713          	addi	a4,a5,7
    161a:	482d                	li	a6,11
    161c:	0ff5f593          	andi	a1,a1,255
    1620:	fff60693          	addi	a3,a2,-1
    1624:	17076263          	bltu	a4,a6,1788 <memset+0x17c>
    1628:	16e6ea63          	bltu	a3,a4,179c <memset+0x190>
    162c:	16078563          	beqz	a5,1796 <memset+0x18a>
    1630:	00b50023          	sb	a1,0(a0)
    1634:	4705                	li	a4,1
    1636:	00150e93          	addi	t4,a0,1
    163a:	14e78c63          	beq	a5,a4,1792 <memset+0x186>
    163e:	00b500a3          	sb	a1,1(a0)
    1642:	4709                	li	a4,2
    1644:	00250e93          	addi	t4,a0,2
    1648:	14e78d63          	beq	a5,a4,17a2 <memset+0x196>
    164c:	00b50123          	sb	a1,2(a0)
    1650:	470d                	li	a4,3
    1652:	00350e93          	addi	t4,a0,3
    1656:	12e78b63          	beq	a5,a4,178c <memset+0x180>
    165a:	00b501a3          	sb	a1,3(a0)
    165e:	4711                	li	a4,4
    1660:	00450e93          	addi	t4,a0,4
    1664:	14e78163          	beq	a5,a4,17a6 <memset+0x19a>
    1668:	00b50223          	sb	a1,4(a0)
    166c:	4715                	li	a4,5
    166e:	00550e93          	addi	t4,a0,5
    1672:	12e78c63          	beq	a5,a4,17aa <memset+0x19e>
    1676:	00b502a3          	sb	a1,5(a0)
    167a:	471d                	li	a4,7
    167c:	00650e93          	addi	t4,a0,6
    1680:	12e79763          	bne	a5,a4,17ae <memset+0x1a2>
    1684:	00750e93          	addi	t4,a0,7
    1688:	00b50323          	sb	a1,6(a0)
    168c:	4f1d                	li	t5,7
    168e:	00859713          	slli	a4,a1,0x8
    1692:	8f4d                	or	a4,a4,a1
    1694:	01059e13          	slli	t3,a1,0x10
    1698:	01c76e33          	or	t3,a4,t3
    169c:	01859313          	slli	t1,a1,0x18
    16a0:	006e6333          	or	t1,t3,t1
    16a4:	02059893          	slli	a7,a1,0x20
    16a8:	011368b3          	or	a7,t1,a7
    16ac:	02859813          	slli	a6,a1,0x28
    16b0:	40f60333          	sub	t1,a2,a5
    16b4:	0108e833          	or	a6,a7,a6
    16b8:	03059693          	slli	a3,a1,0x30
    16bc:	00d866b3          	or	a3,a6,a3
    16c0:	03859713          	slli	a4,a1,0x38
    16c4:	97aa                	add	a5,a5,a0
    16c6:	ff837813          	andi	a6,t1,-8
    16ca:	8f55                	or	a4,a4,a3
    16cc:	00f806b3          	add	a3,a6,a5
    16d0:	e398                	sd	a4,0(a5)
    16d2:	07a1                	addi	a5,a5,8
    16d4:	fed79ee3          	bne	a5,a3,16d0 <memset+0xc4>
    16d8:	ff837693          	andi	a3,t1,-8
    16dc:	00de87b3          	add	a5,t4,a3
    16e0:	01e6873b          	addw	a4,a3,t5
    16e4:	0ad30663          	beq	t1,a3,1790 <memset+0x184>
    16e8:	00b78023          	sb	a1,0(a5)
    16ec:	0017069b          	addiw	a3,a4,1
    16f0:	08c6fb63          	bgeu	a3,a2,1786 <memset+0x17a>
    16f4:	00b780a3          	sb	a1,1(a5)
    16f8:	0027069b          	addiw	a3,a4,2
    16fc:	08c6f563          	bgeu	a3,a2,1786 <memset+0x17a>
    1700:	00b78123          	sb	a1,2(a5)
    1704:	0037069b          	addiw	a3,a4,3
    1708:	06c6ff63          	bgeu	a3,a2,1786 <memset+0x17a>
    170c:	00b781a3          	sb	a1,3(a5)
    1710:	0047069b          	addiw	a3,a4,4
    1714:	06c6f963          	bgeu	a3,a2,1786 <memset+0x17a>
    1718:	00b78223          	sb	a1,4(a5)
    171c:	0057069b          	addiw	a3,a4,5
    1720:	06c6f363          	bgeu	a3,a2,1786 <memset+0x17a>
    1724:	00b782a3          	sb	a1,5(a5)
    1728:	0067069b          	addiw	a3,a4,6
    172c:	04c6fd63          	bgeu	a3,a2,1786 <memset+0x17a>
    1730:	00b78323          	sb	a1,6(a5)
    1734:	0077069b          	addiw	a3,a4,7
    1738:	04c6f763          	bgeu	a3,a2,1786 <memset+0x17a>
    173c:	00b783a3          	sb	a1,7(a5)
    1740:	0087069b          	addiw	a3,a4,8
    1744:	04c6f163          	bgeu	a3,a2,1786 <memset+0x17a>
    1748:	00b78423          	sb	a1,8(a5)
    174c:	0097069b          	addiw	a3,a4,9
    1750:	02c6fb63          	bgeu	a3,a2,1786 <memset+0x17a>
    1754:	00b784a3          	sb	a1,9(a5)
    1758:	00a7069b          	addiw	a3,a4,10
    175c:	02c6f563          	bgeu	a3,a2,1786 <memset+0x17a>
    1760:	00b78523          	sb	a1,10(a5)
    1764:	00b7069b          	addiw	a3,a4,11
    1768:	00c6ff63          	bgeu	a3,a2,1786 <memset+0x17a>
    176c:	00b785a3          	sb	a1,11(a5)
    1770:	00c7069b          	addiw	a3,a4,12
    1774:	00c6f963          	bgeu	a3,a2,1786 <memset+0x17a>
    1778:	00b78623          	sb	a1,12(a5)
    177c:	2735                	addiw	a4,a4,13
    177e:	00c77463          	bgeu	a4,a2,1786 <memset+0x17a>
    1782:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1786:	8082                	ret
    1788:	472d                	li	a4,11
    178a:	bd79                	j	1628 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    178c:	4f0d                	li	t5,3
    178e:	b701                	j	168e <memset+0x82>
    1790:	8082                	ret
    1792:	4f05                	li	t5,1
    1794:	bded                	j	168e <memset+0x82>
    1796:	8eaa                	mv	t4,a0
    1798:	4f01                	li	t5,0
    179a:	bdd5                	j	168e <memset+0x82>
    179c:	87aa                	mv	a5,a0
    179e:	4701                	li	a4,0
    17a0:	b7a1                	j	16e8 <memset+0xdc>
    17a2:	4f09                	li	t5,2
    17a4:	b5ed                	j	168e <memset+0x82>
    17a6:	4f11                	li	t5,4
    17a8:	b5dd                	j	168e <memset+0x82>
    17aa:	4f15                	li	t5,5
    17ac:	b5cd                	j	168e <memset+0x82>
    17ae:	4f19                	li	t5,6
    17b0:	bdf9                	j	168e <memset+0x82>

00000000000017b2 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17b2:	00054783          	lbu	a5,0(a0)
    17b6:	0005c703          	lbu	a4,0(a1)
    17ba:	00e79863          	bne	a5,a4,17ca <strcmp+0x18>
    17be:	0505                	addi	a0,a0,1
    17c0:	0585                	addi	a1,a1,1
    17c2:	fbe5                	bnez	a5,17b2 <strcmp>
    17c4:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17c6:	9d19                	subw	a0,a0,a4
    17c8:	8082                	ret
    17ca:	0007851b          	sext.w	a0,a5
    17ce:	bfe5                	j	17c6 <strcmp+0x14>

00000000000017d0 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17d0:	ce05                	beqz	a2,1808 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17d2:	00054703          	lbu	a4,0(a0)
    17d6:	0005c783          	lbu	a5,0(a1)
    17da:	cb0d                	beqz	a4,180c <strncmp+0x3c>
    if (!n--)
    17dc:	167d                	addi	a2,a2,-1
    17de:	00c506b3          	add	a3,a0,a2
    17e2:	a819                	j	17f8 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17e4:	00a68e63          	beq	a3,a0,1800 <strncmp+0x30>
    17e8:	0505                	addi	a0,a0,1
    17ea:	00e79b63          	bne	a5,a4,1800 <strncmp+0x30>
    17ee:	00054703          	lbu	a4,0(a0)
    17f2:	0005c783          	lbu	a5,0(a1)
    17f6:	cb19                	beqz	a4,180c <strncmp+0x3c>
    17f8:	0005c783          	lbu	a5,0(a1)
    17fc:	0585                	addi	a1,a1,1
    17fe:	f3fd                	bnez	a5,17e4 <strncmp+0x14>
        ;
    return *l - *r;
    1800:	0007051b          	sext.w	a0,a4
    1804:	9d1d                	subw	a0,a0,a5
    1806:	8082                	ret
        return 0;
    1808:	4501                	li	a0,0
}
    180a:	8082                	ret
    180c:	4501                	li	a0,0
    return *l - *r;
    180e:	9d1d                	subw	a0,a0,a5
    1810:	8082                	ret

0000000000001812 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1812:	00757793          	andi	a5,a0,7
    1816:	cf89                	beqz	a5,1830 <strlen+0x1e>
    1818:	87aa                	mv	a5,a0
    181a:	a029                	j	1824 <strlen+0x12>
    181c:	0785                	addi	a5,a5,1
    181e:	0077f713          	andi	a4,a5,7
    1822:	cb01                	beqz	a4,1832 <strlen+0x20>
        if (!*s)
    1824:	0007c703          	lbu	a4,0(a5)
    1828:	fb75                	bnez	a4,181c <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    182a:	40a78533          	sub	a0,a5,a0
}
    182e:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1830:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1832:	6394                	ld	a3,0(a5)
    1834:	00000597          	auipc	a1,0x0
    1838:	69c5b583          	ld	a1,1692(a1) # 1ed0 <__clone+0xa2>
    183c:	00000617          	auipc	a2,0x0
    1840:	69c63603          	ld	a2,1692(a2) # 1ed8 <__clone+0xaa>
    1844:	a019                	j	184a <strlen+0x38>
    1846:	6794                	ld	a3,8(a5)
    1848:	07a1                	addi	a5,a5,8
    184a:	00b68733          	add	a4,a3,a1
    184e:	fff6c693          	not	a3,a3
    1852:	8f75                	and	a4,a4,a3
    1854:	8f71                	and	a4,a4,a2
    1856:	db65                	beqz	a4,1846 <strlen+0x34>
    for (; *s; s++)
    1858:	0007c703          	lbu	a4,0(a5)
    185c:	d779                	beqz	a4,182a <strlen+0x18>
    185e:	0017c703          	lbu	a4,1(a5)
    1862:	0785                	addi	a5,a5,1
    1864:	d379                	beqz	a4,182a <strlen+0x18>
    1866:	0017c703          	lbu	a4,1(a5)
    186a:	0785                	addi	a5,a5,1
    186c:	fb6d                	bnez	a4,185e <strlen+0x4c>
    186e:	bf75                	j	182a <strlen+0x18>

0000000000001870 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1870:	00757713          	andi	a4,a0,7
{
    1874:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1876:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    187a:	cb19                	beqz	a4,1890 <memchr+0x20>
    187c:	ce25                	beqz	a2,18f4 <memchr+0x84>
    187e:	0007c703          	lbu	a4,0(a5)
    1882:	04b70e63          	beq	a4,a1,18de <memchr+0x6e>
    1886:	0785                	addi	a5,a5,1
    1888:	0077f713          	andi	a4,a5,7
    188c:	167d                	addi	a2,a2,-1
    188e:	f77d                	bnez	a4,187c <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1890:	4501                	li	a0,0
    if (n && *s != c)
    1892:	c235                	beqz	a2,18f6 <memchr+0x86>
    1894:	0007c703          	lbu	a4,0(a5)
    1898:	04b70363          	beq	a4,a1,18de <memchr+0x6e>
        size_t k = ONES * c;
    189c:	00000517          	auipc	a0,0x0
    18a0:	64453503          	ld	a0,1604(a0) # 1ee0 <__clone+0xb2>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18a4:	471d                	li	a4,7
        size_t k = ONES * c;
    18a6:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18aa:	02c77a63          	bgeu	a4,a2,18de <memchr+0x6e>
    18ae:	00000897          	auipc	a7,0x0
    18b2:	6228b883          	ld	a7,1570(a7) # 1ed0 <__clone+0xa2>
    18b6:	00000817          	auipc	a6,0x0
    18ba:	62283803          	ld	a6,1570(a6) # 1ed8 <__clone+0xaa>
    18be:	431d                	li	t1,7
    18c0:	a029                	j	18ca <memchr+0x5a>
    18c2:	1661                	addi	a2,a2,-8
    18c4:	07a1                	addi	a5,a5,8
    18c6:	02c37963          	bgeu	t1,a2,18f8 <memchr+0x88>
    18ca:	6398                	ld	a4,0(a5)
    18cc:	8f29                	xor	a4,a4,a0
    18ce:	011706b3          	add	a3,a4,a7
    18d2:	fff74713          	not	a4,a4
    18d6:	8f75                	and	a4,a4,a3
    18d8:	01077733          	and	a4,a4,a6
    18dc:	d37d                	beqz	a4,18c2 <memchr+0x52>
    18de:	853e                	mv	a0,a5
    18e0:	97b2                	add	a5,a5,a2
    18e2:	a021                	j	18ea <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    18e4:	0505                	addi	a0,a0,1
    18e6:	00f50763          	beq	a0,a5,18f4 <memchr+0x84>
    18ea:	00054703          	lbu	a4,0(a0)
    18ee:	feb71be3          	bne	a4,a1,18e4 <memchr+0x74>
    18f2:	8082                	ret
    return n ? (void *)s : 0;
    18f4:	4501                	li	a0,0
}
    18f6:	8082                	ret
    return n ? (void *)s : 0;
    18f8:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    18fa:	f275                	bnez	a2,18de <memchr+0x6e>
}
    18fc:	8082                	ret

00000000000018fe <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    18fe:	1101                	addi	sp,sp,-32
    1900:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1902:	862e                	mv	a2,a1
{
    1904:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1906:	4581                	li	a1,0
{
    1908:	e426                	sd	s1,8(sp)
    190a:	ec06                	sd	ra,24(sp)
    190c:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    190e:	f63ff0ef          	jal	ra,1870 <memchr>
    return p ? p - s : n;
    1912:	c519                	beqz	a0,1920 <strnlen+0x22>
}
    1914:	60e2                	ld	ra,24(sp)
    1916:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1918:	8d05                	sub	a0,a0,s1
}
    191a:	64a2                	ld	s1,8(sp)
    191c:	6105                	addi	sp,sp,32
    191e:	8082                	ret
    1920:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1922:	8522                	mv	a0,s0
}
    1924:	6442                	ld	s0,16(sp)
    1926:	64a2                	ld	s1,8(sp)
    1928:	6105                	addi	sp,sp,32
    192a:	8082                	ret

000000000000192c <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    192c:	00b547b3          	xor	a5,a0,a1
    1930:	8b9d                	andi	a5,a5,7
    1932:	eb95                	bnez	a5,1966 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1934:	0075f793          	andi	a5,a1,7
    1938:	e7b1                	bnez	a5,1984 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    193a:	6198                	ld	a4,0(a1)
    193c:	00000617          	auipc	a2,0x0
    1940:	59463603          	ld	a2,1428(a2) # 1ed0 <__clone+0xa2>
    1944:	00000817          	auipc	a6,0x0
    1948:	59483803          	ld	a6,1428(a6) # 1ed8 <__clone+0xaa>
    194c:	a029                	j	1956 <strcpy+0x2a>
    194e:	e118                	sd	a4,0(a0)
    1950:	6598                	ld	a4,8(a1)
    1952:	05a1                	addi	a1,a1,8
    1954:	0521                	addi	a0,a0,8
    1956:	00c707b3          	add	a5,a4,a2
    195a:	fff74693          	not	a3,a4
    195e:	8ff5                	and	a5,a5,a3
    1960:	0107f7b3          	and	a5,a5,a6
    1964:	d7ed                	beqz	a5,194e <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1966:	0005c783          	lbu	a5,0(a1)
    196a:	00f50023          	sb	a5,0(a0)
    196e:	c785                	beqz	a5,1996 <strcpy+0x6a>
    1970:	0015c783          	lbu	a5,1(a1)
    1974:	0505                	addi	a0,a0,1
    1976:	0585                	addi	a1,a1,1
    1978:	00f50023          	sb	a5,0(a0)
    197c:	fbf5                	bnez	a5,1970 <strcpy+0x44>
        ;
    return d;
}
    197e:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1980:	0505                	addi	a0,a0,1
    1982:	df45                	beqz	a4,193a <strcpy+0xe>
            if (!(*d = *s))
    1984:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1988:	0585                	addi	a1,a1,1
    198a:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    198e:	00f50023          	sb	a5,0(a0)
    1992:	f7fd                	bnez	a5,1980 <strcpy+0x54>
}
    1994:	8082                	ret
    1996:	8082                	ret

0000000000001998 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1998:	00b547b3          	xor	a5,a0,a1
    199c:	8b9d                	andi	a5,a5,7
    199e:	1a079863          	bnez	a5,1b4e <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19a2:	0075f793          	andi	a5,a1,7
    19a6:	16078463          	beqz	a5,1b0e <strncpy+0x176>
    19aa:	ea01                	bnez	a2,19ba <strncpy+0x22>
    19ac:	a421                	j	1bb4 <strncpy+0x21c>
    19ae:	167d                	addi	a2,a2,-1
    19b0:	0505                	addi	a0,a0,1
    19b2:	14070e63          	beqz	a4,1b0e <strncpy+0x176>
    19b6:	1a060863          	beqz	a2,1b66 <strncpy+0x1ce>
    19ba:	0005c783          	lbu	a5,0(a1)
    19be:	0585                	addi	a1,a1,1
    19c0:	0075f713          	andi	a4,a1,7
    19c4:	00f50023          	sb	a5,0(a0)
    19c8:	f3fd                	bnez	a5,19ae <strncpy+0x16>
    19ca:	4805                	li	a6,1
    19cc:	1a061863          	bnez	a2,1b7c <strncpy+0x1e4>
    19d0:	40a007b3          	neg	a5,a0
    19d4:	8b9d                	andi	a5,a5,7
    19d6:	4681                	li	a3,0
    19d8:	18061a63          	bnez	a2,1b6c <strncpy+0x1d4>
    19dc:	00778713          	addi	a4,a5,7
    19e0:	45ad                	li	a1,11
    19e2:	18b76363          	bltu	a4,a1,1b68 <strncpy+0x1d0>
    19e6:	1ae6eb63          	bltu	a3,a4,1b9c <strncpy+0x204>
    19ea:	1a078363          	beqz	a5,1b90 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    19ee:	00050023          	sb	zero,0(a0)
    19f2:	4685                	li	a3,1
    19f4:	00150713          	addi	a4,a0,1
    19f8:	18d78f63          	beq	a5,a3,1b96 <strncpy+0x1fe>
    19fc:	000500a3          	sb	zero,1(a0)
    1a00:	4689                	li	a3,2
    1a02:	00250713          	addi	a4,a0,2
    1a06:	18d78e63          	beq	a5,a3,1ba2 <strncpy+0x20a>
    1a0a:	00050123          	sb	zero,2(a0)
    1a0e:	468d                	li	a3,3
    1a10:	00350713          	addi	a4,a0,3
    1a14:	16d78c63          	beq	a5,a3,1b8c <strncpy+0x1f4>
    1a18:	000501a3          	sb	zero,3(a0)
    1a1c:	4691                	li	a3,4
    1a1e:	00450713          	addi	a4,a0,4
    1a22:	18d78263          	beq	a5,a3,1ba6 <strncpy+0x20e>
    1a26:	00050223          	sb	zero,4(a0)
    1a2a:	4695                	li	a3,5
    1a2c:	00550713          	addi	a4,a0,5
    1a30:	16d78d63          	beq	a5,a3,1baa <strncpy+0x212>
    1a34:	000502a3          	sb	zero,5(a0)
    1a38:	469d                	li	a3,7
    1a3a:	00650713          	addi	a4,a0,6
    1a3e:	16d79863          	bne	a5,a3,1bae <strncpy+0x216>
    1a42:	00750713          	addi	a4,a0,7
    1a46:	00050323          	sb	zero,6(a0)
    1a4a:	40f80833          	sub	a6,a6,a5
    1a4e:	ff887593          	andi	a1,a6,-8
    1a52:	97aa                	add	a5,a5,a0
    1a54:	95be                	add	a1,a1,a5
    1a56:	0007b023          	sd	zero,0(a5)
    1a5a:	07a1                	addi	a5,a5,8
    1a5c:	feb79de3          	bne	a5,a1,1a56 <strncpy+0xbe>
    1a60:	ff887593          	andi	a1,a6,-8
    1a64:	9ead                	addw	a3,a3,a1
    1a66:	00b707b3          	add	a5,a4,a1
    1a6a:	12b80863          	beq	a6,a1,1b9a <strncpy+0x202>
    1a6e:	00078023          	sb	zero,0(a5)
    1a72:	0016871b          	addiw	a4,a3,1
    1a76:	0ec77863          	bgeu	a4,a2,1b66 <strncpy+0x1ce>
    1a7a:	000780a3          	sb	zero,1(a5)
    1a7e:	0026871b          	addiw	a4,a3,2
    1a82:	0ec77263          	bgeu	a4,a2,1b66 <strncpy+0x1ce>
    1a86:	00078123          	sb	zero,2(a5)
    1a8a:	0036871b          	addiw	a4,a3,3
    1a8e:	0cc77c63          	bgeu	a4,a2,1b66 <strncpy+0x1ce>
    1a92:	000781a3          	sb	zero,3(a5)
    1a96:	0046871b          	addiw	a4,a3,4
    1a9a:	0cc77663          	bgeu	a4,a2,1b66 <strncpy+0x1ce>
    1a9e:	00078223          	sb	zero,4(a5)
    1aa2:	0056871b          	addiw	a4,a3,5
    1aa6:	0cc77063          	bgeu	a4,a2,1b66 <strncpy+0x1ce>
    1aaa:	000782a3          	sb	zero,5(a5)
    1aae:	0066871b          	addiw	a4,a3,6
    1ab2:	0ac77a63          	bgeu	a4,a2,1b66 <strncpy+0x1ce>
    1ab6:	00078323          	sb	zero,6(a5)
    1aba:	0076871b          	addiw	a4,a3,7
    1abe:	0ac77463          	bgeu	a4,a2,1b66 <strncpy+0x1ce>
    1ac2:	000783a3          	sb	zero,7(a5)
    1ac6:	0086871b          	addiw	a4,a3,8
    1aca:	08c77e63          	bgeu	a4,a2,1b66 <strncpy+0x1ce>
    1ace:	00078423          	sb	zero,8(a5)
    1ad2:	0096871b          	addiw	a4,a3,9
    1ad6:	08c77863          	bgeu	a4,a2,1b66 <strncpy+0x1ce>
    1ada:	000784a3          	sb	zero,9(a5)
    1ade:	00a6871b          	addiw	a4,a3,10
    1ae2:	08c77263          	bgeu	a4,a2,1b66 <strncpy+0x1ce>
    1ae6:	00078523          	sb	zero,10(a5)
    1aea:	00b6871b          	addiw	a4,a3,11
    1aee:	06c77c63          	bgeu	a4,a2,1b66 <strncpy+0x1ce>
    1af2:	000785a3          	sb	zero,11(a5)
    1af6:	00c6871b          	addiw	a4,a3,12
    1afa:	06c77663          	bgeu	a4,a2,1b66 <strncpy+0x1ce>
    1afe:	00078623          	sb	zero,12(a5)
    1b02:	26b5                	addiw	a3,a3,13
    1b04:	06c6f163          	bgeu	a3,a2,1b66 <strncpy+0x1ce>
    1b08:	000786a3          	sb	zero,13(a5)
    1b0c:	8082                	ret
            ;
        if (!n || !*s)
    1b0e:	c645                	beqz	a2,1bb6 <strncpy+0x21e>
    1b10:	0005c783          	lbu	a5,0(a1)
    1b14:	ea078be3          	beqz	a5,19ca <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b18:	479d                	li	a5,7
    1b1a:	02c7ff63          	bgeu	a5,a2,1b58 <strncpy+0x1c0>
    1b1e:	00000897          	auipc	a7,0x0
    1b22:	3b28b883          	ld	a7,946(a7) # 1ed0 <__clone+0xa2>
    1b26:	00000817          	auipc	a6,0x0
    1b2a:	3b283803          	ld	a6,946(a6) # 1ed8 <__clone+0xaa>
    1b2e:	431d                	li	t1,7
    1b30:	6198                	ld	a4,0(a1)
    1b32:	011707b3          	add	a5,a4,a7
    1b36:	fff74693          	not	a3,a4
    1b3a:	8ff5                	and	a5,a5,a3
    1b3c:	0107f7b3          	and	a5,a5,a6
    1b40:	ef81                	bnez	a5,1b58 <strncpy+0x1c0>
            *wd = *ws;
    1b42:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b44:	1661                	addi	a2,a2,-8
    1b46:	05a1                	addi	a1,a1,8
    1b48:	0521                	addi	a0,a0,8
    1b4a:	fec363e3          	bltu	t1,a2,1b30 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b4e:	e609                	bnez	a2,1b58 <strncpy+0x1c0>
    1b50:	a08d                	j	1bb2 <strncpy+0x21a>
    1b52:	167d                	addi	a2,a2,-1
    1b54:	0505                	addi	a0,a0,1
    1b56:	ca01                	beqz	a2,1b66 <strncpy+0x1ce>
    1b58:	0005c783          	lbu	a5,0(a1)
    1b5c:	0585                	addi	a1,a1,1
    1b5e:	00f50023          	sb	a5,0(a0)
    1b62:	fbe5                	bnez	a5,1b52 <strncpy+0x1ba>
        ;
tail:
    1b64:	b59d                	j	19ca <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1b66:	8082                	ret
    1b68:	472d                	li	a4,11
    1b6a:	bdb5                	j	19e6 <strncpy+0x4e>
    1b6c:	00778713          	addi	a4,a5,7
    1b70:	45ad                	li	a1,11
    1b72:	fff60693          	addi	a3,a2,-1
    1b76:	e6b778e3          	bgeu	a4,a1,19e6 <strncpy+0x4e>
    1b7a:	b7fd                	j	1b68 <strncpy+0x1d0>
    1b7c:	40a007b3          	neg	a5,a0
    1b80:	8832                	mv	a6,a2
    1b82:	8b9d                	andi	a5,a5,7
    1b84:	4681                	li	a3,0
    1b86:	e4060be3          	beqz	a2,19dc <strncpy+0x44>
    1b8a:	b7cd                	j	1b6c <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b8c:	468d                	li	a3,3
    1b8e:	bd75                	j	1a4a <strncpy+0xb2>
    1b90:	872a                	mv	a4,a0
    1b92:	4681                	li	a3,0
    1b94:	bd5d                	j	1a4a <strncpy+0xb2>
    1b96:	4685                	li	a3,1
    1b98:	bd4d                	j	1a4a <strncpy+0xb2>
    1b9a:	8082                	ret
    1b9c:	87aa                	mv	a5,a0
    1b9e:	4681                	li	a3,0
    1ba0:	b5f9                	j	1a6e <strncpy+0xd6>
    1ba2:	4689                	li	a3,2
    1ba4:	b55d                	j	1a4a <strncpy+0xb2>
    1ba6:	4691                	li	a3,4
    1ba8:	b54d                	j	1a4a <strncpy+0xb2>
    1baa:	4695                	li	a3,5
    1bac:	bd79                	j	1a4a <strncpy+0xb2>
    1bae:	4699                	li	a3,6
    1bb0:	bd69                	j	1a4a <strncpy+0xb2>
    1bb2:	8082                	ret
    1bb4:	8082                	ret
    1bb6:	8082                	ret

0000000000001bb8 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1bb8:	87aa                	mv	a5,a0
    1bba:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1bbc:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1bc0:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1bc4:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1bc6:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bc8:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1bcc:	2501                	sext.w	a0,a0
    1bce:	8082                	ret

0000000000001bd0 <openat>:
    register long a7 __asm__("a7") = n;
    1bd0:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1bd4:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bd8:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1bdc:	2501                	sext.w	a0,a0
    1bde:	8082                	ret

0000000000001be0 <close>:
    register long a7 __asm__("a7") = n;
    1be0:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1be4:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1be8:	2501                	sext.w	a0,a0
    1bea:	8082                	ret

0000000000001bec <read>:
    register long a7 __asm__("a7") = n;
    1bec:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1bf0:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1bf4:	8082                	ret

0000000000001bf6 <write>:
    register long a7 __asm__("a7") = n;
    1bf6:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1bfa:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1bfe:	8082                	ret

0000000000001c00 <getpid>:
    register long a7 __asm__("a7") = n;
    1c00:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c04:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c08:	2501                	sext.w	a0,a0
    1c0a:	8082                	ret

0000000000001c0c <getppid>:
    register long a7 __asm__("a7") = n;
    1c0c:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c10:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c14:	2501                	sext.w	a0,a0
    1c16:	8082                	ret

0000000000001c18 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c18:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c1c:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c20:	2501                	sext.w	a0,a0
    1c22:	8082                	ret

0000000000001c24 <fork>:
    register long a7 __asm__("a7") = n;
    1c24:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c28:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c2a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c2c:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c30:	2501                	sext.w	a0,a0
    1c32:	8082                	ret

0000000000001c34 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c34:	85b2                	mv	a1,a2
    1c36:	863a                	mv	a2,a4
    if (stack)
    1c38:	c191                	beqz	a1,1c3c <clone+0x8>
	stack += stack_size;
    1c3a:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c3c:	4781                	li	a5,0
    1c3e:	4701                	li	a4,0
    1c40:	4681                	li	a3,0
    1c42:	2601                	sext.w	a2,a2
    1c44:	a2ed                	j	1e2e <__clone>

0000000000001c46 <exit>:
    register long a7 __asm__("a7") = n;
    1c46:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c4a:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c4e:	8082                	ret

0000000000001c50 <waitpid>:
    register long a7 __asm__("a7") = n;
    1c50:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c54:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c56:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c5a:	2501                	sext.w	a0,a0
    1c5c:	8082                	ret

0000000000001c5e <exec>:
    register long a7 __asm__("a7") = n;
    1c5e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1c62:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1c66:	2501                	sext.w	a0,a0
    1c68:	8082                	ret

0000000000001c6a <execve>:
    register long a7 __asm__("a7") = n;
    1c6a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c6e:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1c72:	2501                	sext.w	a0,a0
    1c74:	8082                	ret

0000000000001c76 <times>:
    register long a7 __asm__("a7") = n;
    1c76:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1c7a:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1c7e:	2501                	sext.w	a0,a0
    1c80:	8082                	ret

0000000000001c82 <get_time>:

int64 get_time()
{
    1c82:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1c84:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1c88:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1c8a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c8c:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1c90:	2501                	sext.w	a0,a0
    1c92:	ed09                	bnez	a0,1cac <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1c94:	67a2                	ld	a5,8(sp)
    1c96:	3e800713          	li	a4,1000
    1c9a:	00015503          	lhu	a0,0(sp)
    1c9e:	02e7d7b3          	divu	a5,a5,a4
    1ca2:	02e50533          	mul	a0,a0,a4
    1ca6:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1ca8:	0141                	addi	sp,sp,16
    1caa:	8082                	ret
        return -1;
    1cac:	557d                	li	a0,-1
    1cae:	bfed                	j	1ca8 <get_time+0x26>

0000000000001cb0 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1cb0:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cb4:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1cb8:	2501                	sext.w	a0,a0
    1cba:	8082                	ret

0000000000001cbc <time>:
    register long a7 __asm__("a7") = n;
    1cbc:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1cc0:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1cc4:	2501                	sext.w	a0,a0
    1cc6:	8082                	ret

0000000000001cc8 <sleep>:

int sleep(unsigned long long time)
{
    1cc8:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1cca:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1ccc:	850a                	mv	a0,sp
    1cce:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1cd0:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1cd4:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cd6:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1cda:	e501                	bnez	a0,1ce2 <sleep+0x1a>
    return 0;
    1cdc:	4501                	li	a0,0
}
    1cde:	0141                	addi	sp,sp,16
    1ce0:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1ce2:	4502                	lw	a0,0(sp)
}
    1ce4:	0141                	addi	sp,sp,16
    1ce6:	8082                	ret

0000000000001ce8 <set_priority>:
    register long a7 __asm__("a7") = n;
    1ce8:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1cec:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1cf0:	2501                	sext.w	a0,a0
    1cf2:	8082                	ret

0000000000001cf4 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1cf4:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1cf8:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1cfc:	8082                	ret

0000000000001cfe <munmap>:
    register long a7 __asm__("a7") = n;
    1cfe:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d02:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d06:	2501                	sext.w	a0,a0
    1d08:	8082                	ret

0000000000001d0a <wait>:

int wait(int *code)
{
    1d0a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d0c:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d10:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d12:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d14:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d16:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d1a:	2501                	sext.w	a0,a0
    1d1c:	8082                	ret

0000000000001d1e <spawn>:
    register long a7 __asm__("a7") = n;
    1d1e:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d22:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d26:	2501                	sext.w	a0,a0
    1d28:	8082                	ret

0000000000001d2a <mailread>:
    register long a7 __asm__("a7") = n;
    1d2a:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d2e:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d32:	2501                	sext.w	a0,a0
    1d34:	8082                	ret

0000000000001d36 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d36:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d3a:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d3e:	2501                	sext.w	a0,a0
    1d40:	8082                	ret

0000000000001d42 <fstat>:
    register long a7 __asm__("a7") = n;
    1d42:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d46:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d4a:	2501                	sext.w	a0,a0
    1d4c:	8082                	ret

0000000000001d4e <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d4e:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d50:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d54:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d56:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d5a:	2501                	sext.w	a0,a0
    1d5c:	8082                	ret

0000000000001d5e <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1d5e:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d60:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1d64:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d66:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1d6a:	2501                	sext.w	a0,a0
    1d6c:	8082                	ret

0000000000001d6e <link>:

int link(char *old_path, char *new_path)
{
    1d6e:	87aa                	mv	a5,a0
    1d70:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1d72:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1d76:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d7a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1d7c:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1d80:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d82:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1d86:	2501                	sext.w	a0,a0
    1d88:	8082                	ret

0000000000001d8a <unlink>:

int unlink(char *path)
{
    1d8a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d8c:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1d90:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1d94:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d96:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1d9a:	2501                	sext.w	a0,a0
    1d9c:	8082                	ret

0000000000001d9e <uname>:
    register long a7 __asm__("a7") = n;
    1d9e:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1da2:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1da6:	2501                	sext.w	a0,a0
    1da8:	8082                	ret

0000000000001daa <brk>:
    register long a7 __asm__("a7") = n;
    1daa:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1dae:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1db2:	2501                	sext.w	a0,a0
    1db4:	8082                	ret

0000000000001db6 <getcwd>:
    register long a7 __asm__("a7") = n;
    1db6:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db8:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1dbc:	8082                	ret

0000000000001dbe <chdir>:
    register long a7 __asm__("a7") = n;
    1dbe:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1dc2:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <mkdir>:

int mkdir(const char *path, mode_t mode){
    1dca:	862e                	mv	a2,a1
    1dcc:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1dce:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dd0:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1dd4:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dd8:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dda:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ddc:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1de0:	2501                	sext.w	a0,a0
    1de2:	8082                	ret

0000000000001de4 <getdents>:
    register long a7 __asm__("a7") = n;
    1de4:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de8:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1dec:	2501                	sext.w	a0,a0
    1dee:	8082                	ret

0000000000001df0 <pipe>:
    register long a7 __asm__("a7") = n;
    1df0:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1df4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df6:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1dfa:	2501                	sext.w	a0,a0
    1dfc:	8082                	ret

0000000000001dfe <dup>:
    register long a7 __asm__("a7") = n;
    1dfe:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e00:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <dup2>:
    register long a7 __asm__("a7") = n;
    1e08:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e0a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e0c:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <mount>:
    register long a7 __asm__("a7") = n;
    1e14:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e18:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <umount>:
    register long a7 __asm__("a7") = n;
    1e20:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e24:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e26:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	8082                	ret

0000000000001e2e <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e2e:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e30:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e32:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e34:	8532                	mv	a0,a2
	mv a2, a4
    1e36:	863a                	mv	a2,a4
	mv a3, a5
    1e38:	86be                	mv	a3,a5
	mv a4, a6
    1e3a:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e3c:	0dc00893          	li	a7,220
	ecall
    1e40:	00000073          	ecall

	beqz a0, 1f
    1e44:	c111                	beqz	a0,1e48 <__clone+0x1a>
	# Parent
	ret
    1e46:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e48:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e4a:	6522                	ld	a0,8(sp)
	jalr a1
    1e4c:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e4e:	05d00893          	li	a7,93
	ecall
    1e52:	00000073          	ecall
