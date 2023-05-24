
/home/lmq/lmq/cscc/xv6-k210/test/build/riscv64/close:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a8c5                	j	10f2 <__start_main>

0000000000001004 <test_close>:
 * "  close success."
 * 测试失败则输出：
 * "  close error."
 */

void test_close(void) {
    1004:	1101                	addi	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	eba50513          	addi	a0,a0,-326 # 1ec0 <__clone+0x2c>
void test_close(void) {
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e426                	sd	s1,8(sp)
    TEST_START(__func__);
    1014:	2dc000ef          	jal	ra,12f0 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	f5850513          	addi	a0,a0,-168 # 1f70 <__func__.1192>
    1020:	2d0000ef          	jal	ra,12f0 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	eb450513          	addi	a0,a0,-332 # 1ed8 <__clone+0x44>
    102c:	2c4000ef          	jal	ra,12f0 <puts>
    int fd = open("test_close.txt", O_CREATE | O_RDWR);
    1030:	04200593          	li	a1,66
    1034:	00001517          	auipc	a0,0x1
    1038:	eb450513          	addi	a0,a0,-332 # 1ee8 <__clone+0x54>
    103c:	3e3000ef          	jal	ra,1c1e <open>
    1040:	842a                	mv	s0,a0
    assert(fd > 0);
    1042:	08a05963          	blez	a0,10d4 <test_close+0xd0>
    const char *str = "  close error.\n";
    int str_len = strlen(str);
    1046:	00001517          	auipc	a0,0x1
    104a:	ed250513          	addi	a0,a0,-302 # 1f18 <__clone+0x84>
    104e:	02b000ef          	jal	ra,1878 <strlen>
    1052:	0005049b          	sext.w	s1,a0
    assert(write(fd, str, str_len) == str_len);
    1056:	8626                	mv	a2,s1
    1058:	00001597          	auipc	a1,0x1
    105c:	ec058593          	addi	a1,a1,-320 # 1f18 <__clone+0x84>
    1060:	8522                	mv	a0,s0
    1062:	3fb000ef          	jal	ra,1c5c <write>
    1066:	00950863          	beq	a0,s1,1076 <test_close+0x72>
    106a:	00001517          	auipc	a0,0x1
    106e:	e8e50513          	addi	a0,a0,-370 # 1ef8 <__clone+0x64>
    1072:	528000ef          	jal	ra,159a <panic>
    write(fd, str, str_len);
    1076:	8626                	mv	a2,s1
    1078:	00001597          	auipc	a1,0x1
    107c:	ea058593          	addi	a1,a1,-352 # 1f18 <__clone+0x84>
    1080:	8522                	mv	a0,s0
    1082:	3db000ef          	jal	ra,1c5c <write>
    int rt = close(fd);	
    1086:	8522                	mv	a0,s0
    1088:	3bf000ef          	jal	ra,1c46 <close>
    assert(rt == 0);
    108c:	ed0d                	bnez	a0,10c6 <test_close+0xc2>
    printf("  close %d success.\n", fd);
    108e:	85a2                	mv	a1,s0
    1090:	00001517          	auipc	a0,0x1
    1094:	e9850513          	addi	a0,a0,-360 # 1f28 <__clone+0x94>
    1098:	27a000ef          	jal	ra,1312 <printf>
	
    TEST_END(__func__);
    109c:	00001517          	auipc	a0,0x1
    10a0:	ea450513          	addi	a0,a0,-348 # 1f40 <__clone+0xac>
    10a4:	24c000ef          	jal	ra,12f0 <puts>
    10a8:	00001517          	auipc	a0,0x1
    10ac:	ec850513          	addi	a0,a0,-312 # 1f70 <__func__.1192>
    10b0:	240000ef          	jal	ra,12f0 <puts>
}
    10b4:	6442                	ld	s0,16(sp)
    10b6:	60e2                	ld	ra,24(sp)
    10b8:	64a2                	ld	s1,8(sp)
    TEST_END(__func__);
    10ba:	00001517          	auipc	a0,0x1
    10be:	e1e50513          	addi	a0,a0,-482 # 1ed8 <__clone+0x44>
}
    10c2:	6105                	addi	sp,sp,32
    TEST_END(__func__);
    10c4:	a435                	j	12f0 <puts>
    assert(rt == 0);
    10c6:	00001517          	auipc	a0,0x1
    10ca:	e3250513          	addi	a0,a0,-462 # 1ef8 <__clone+0x64>
    10ce:	4cc000ef          	jal	ra,159a <panic>
    10d2:	bf75                	j	108e <test_close+0x8a>
    assert(fd > 0);
    10d4:	00001517          	auipc	a0,0x1
    10d8:	e2450513          	addi	a0,a0,-476 # 1ef8 <__clone+0x64>
    10dc:	4be000ef          	jal	ra,159a <panic>
    10e0:	b79d                	j	1046 <test_close+0x42>

00000000000010e2 <main>:

int main(void) {
    10e2:	1141                	addi	sp,sp,-16
    10e4:	e406                	sd	ra,8(sp)
    test_close();
    10e6:	f1fff0ef          	jal	ra,1004 <test_close>
    return 0;
}
    10ea:	60a2                	ld	ra,8(sp)
    10ec:	4501                	li	a0,0
    10ee:	0141                	addi	sp,sp,16
    10f0:	8082                	ret

00000000000010f2 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10f2:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10f4:	4108                	lw	a0,0(a0)
{
    10f6:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10f8:	05a1                	addi	a1,a1,8
{
    10fa:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10fc:	fe7ff0ef          	jal	ra,10e2 <main>
    1100:	3ad000ef          	jal	ra,1cac <exit>
	return 0;
}
    1104:	60a2                	ld	ra,8(sp)
    1106:	4501                	li	a0,0
    1108:	0141                	addi	sp,sp,16
    110a:	8082                	ret

000000000000110c <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    110c:	7179                	addi	sp,sp,-48
    110e:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1110:	12054b63          	bltz	a0,1246 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1114:	02b577bb          	remuw	a5,a0,a1
    1118:	00001697          	auipc	a3,0x1
    111c:	e6868693          	addi	a3,a3,-408 # 1f80 <digits>
    buf[16] = 0;
    1120:	00010c23          	sb	zero,24(sp)
    i = 15;
    1124:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    1128:	1782                	slli	a5,a5,0x20
    112a:	9381                	srli	a5,a5,0x20
    112c:	97b6                	add	a5,a5,a3
    112e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1132:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1136:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    113a:	16b56263          	bltu	a0,a1,129e <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    113e:	02e8763b          	remuw	a2,a6,a4
    1142:	1602                	slli	a2,a2,0x20
    1144:	9201                	srli	a2,a2,0x20
    1146:	9636                	add	a2,a2,a3
    1148:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    114c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1150:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1154:	12e86963          	bltu	a6,a4,1286 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    1158:	02e5f63b          	remuw	a2,a1,a4
    115c:	1602                	slli	a2,a2,0x20
    115e:	9201                	srli	a2,a2,0x20
    1160:	9636                	add	a2,a2,a3
    1162:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1166:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    116a:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    116e:	10e5ef63          	bltu	a1,a4,128c <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1172:	02e8763b          	remuw	a2,a6,a4
    1176:	1602                	slli	a2,a2,0x20
    1178:	9201                	srli	a2,a2,0x20
    117a:	9636                	add	a2,a2,a3
    117c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1180:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1184:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1188:	10e86563          	bltu	a6,a4,1292 <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    118c:	02e5f63b          	remuw	a2,a1,a4
    1190:	1602                	slli	a2,a2,0x20
    1192:	9201                	srli	a2,a2,0x20
    1194:	9636                	add	a2,a2,a3
    1196:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    119a:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    119e:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11a2:	0ee5eb63          	bltu	a1,a4,1298 <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    11a6:	02e8763b          	remuw	a2,a6,a4
    11aa:	1602                	slli	a2,a2,0x20
    11ac:	9201                	srli	a2,a2,0x20
    11ae:	9636                	add	a2,a2,a3
    11b0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b4:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11b8:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11bc:	0ce86263          	bltu	a6,a4,1280 <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    11c0:	02e5f63b          	remuw	a2,a1,a4
    11c4:	1602                	slli	a2,a2,0x20
    11c6:	9201                	srli	a2,a2,0x20
    11c8:	9636                	add	a2,a2,a3
    11ca:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ce:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11d2:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11d6:	0ce5e663          	bltu	a1,a4,12a2 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    11da:	02e8763b          	remuw	a2,a6,a4
    11de:	1602                	slli	a2,a2,0x20
    11e0:	9201                	srli	a2,a2,0x20
    11e2:	9636                	add	a2,a2,a3
    11e4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11e8:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11ec:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11f0:	0ae86c63          	bltu	a6,a4,12a8 <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    11f4:	02e5f63b          	remuw	a2,a1,a4
    11f8:	1602                	slli	a2,a2,0x20
    11fa:	9201                	srli	a2,a2,0x20
    11fc:	9636                	add	a2,a2,a3
    11fe:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1202:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1206:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    120a:	0ae5e263          	bltu	a1,a4,12ae <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    120e:	1782                	slli	a5,a5,0x20
    1210:	9381                	srli	a5,a5,0x20
    1212:	97b6                	add	a5,a5,a3
    1214:	0007c703          	lbu	a4,0(a5)
    1218:	4599                	li	a1,6
    121a:	4795                	li	a5,5
    121c:	00e10723          	sb	a4,14(sp)

    if (sign)
    1220:	00055963          	bgez	a0,1232 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1224:	1018                	addi	a4,sp,32
    1226:	973e                	add	a4,a4,a5
    1228:	02d00693          	li	a3,45
    122c:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    1230:	85be                	mv	a1,a5
    write(f, s, l);
    1232:	003c                	addi	a5,sp,8
    1234:	4641                	li	a2,16
    1236:	9e0d                	subw	a2,a2,a1
    1238:	4505                	li	a0,1
    123a:	95be                	add	a1,a1,a5
    123c:	221000ef          	jal	ra,1c5c <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1240:	70a2                	ld	ra,40(sp)
    1242:	6145                	addi	sp,sp,48
    1244:	8082                	ret
        x = -xx;
    1246:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    124a:	02b677bb          	remuw	a5,a2,a1
    124e:	00001697          	auipc	a3,0x1
    1252:	d3268693          	addi	a3,a3,-718 # 1f80 <digits>
    buf[16] = 0;
    1256:	00010c23          	sb	zero,24(sp)
    i = 15;
    125a:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    125e:	1782                	slli	a5,a5,0x20
    1260:	9381                	srli	a5,a5,0x20
    1262:	97b6                	add	a5,a5,a3
    1264:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1268:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    126c:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1270:	ecb677e3          	bgeu	a2,a1,113e <printint.constprop.0+0x32>
        buf[i--] = '-';
    1274:	02d00793          	li	a5,45
    1278:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    127c:	45b9                	li	a1,14
    127e:	bf55                	j	1232 <printint.constprop.0+0x126>
    1280:	47a5                	li	a5,9
    1282:	45a9                	li	a1,10
    1284:	bf71                	j	1220 <printint.constprop.0+0x114>
    1286:	47b5                	li	a5,13
    1288:	45b9                	li	a1,14
    128a:	bf59                	j	1220 <printint.constprop.0+0x114>
    128c:	47b1                	li	a5,12
    128e:	45b5                	li	a1,13
    1290:	bf41                	j	1220 <printint.constprop.0+0x114>
    1292:	47ad                	li	a5,11
    1294:	45b1                	li	a1,12
    1296:	b769                	j	1220 <printint.constprop.0+0x114>
    1298:	47a9                	li	a5,10
    129a:	45ad                	li	a1,11
    129c:	b751                	j	1220 <printint.constprop.0+0x114>
    i = 15;
    129e:	45bd                	li	a1,15
    12a0:	bf49                	j	1232 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    12a2:	47a1                	li	a5,8
    12a4:	45a5                	li	a1,9
    12a6:	bfad                	j	1220 <printint.constprop.0+0x114>
    12a8:	479d                	li	a5,7
    12aa:	45a1                	li	a1,8
    12ac:	bf95                	j	1220 <printint.constprop.0+0x114>
    12ae:	4799                	li	a5,6
    12b0:	459d                	li	a1,7
    12b2:	b7bd                	j	1220 <printint.constprop.0+0x114>

00000000000012b4 <getchar>:
{
    12b4:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12b6:	00f10593          	addi	a1,sp,15
    12ba:	4605                	li	a2,1
    12bc:	4501                	li	a0,0
{
    12be:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12c0:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12c4:	18f000ef          	jal	ra,1c52 <read>
}
    12c8:	60e2                	ld	ra,24(sp)
    12ca:	00f14503          	lbu	a0,15(sp)
    12ce:	6105                	addi	sp,sp,32
    12d0:	8082                	ret

00000000000012d2 <putchar>:
{
    12d2:	1101                	addi	sp,sp,-32
    12d4:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12d6:	00f10593          	addi	a1,sp,15
    12da:	4605                	li	a2,1
    12dc:	4505                	li	a0,1
{
    12de:	ec06                	sd	ra,24(sp)
    char byte = c;
    12e0:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12e4:	179000ef          	jal	ra,1c5c <write>
}
    12e8:	60e2                	ld	ra,24(sp)
    12ea:	2501                	sext.w	a0,a0
    12ec:	6105                	addi	sp,sp,32
    12ee:	8082                	ret

00000000000012f0 <puts>:
{
    12f0:	1141                	addi	sp,sp,-16
    12f2:	e406                	sd	ra,8(sp)
    12f4:	e022                	sd	s0,0(sp)
    12f6:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12f8:	580000ef          	jal	ra,1878 <strlen>
    12fc:	862a                	mv	a2,a0
    12fe:	85a2                	mv	a1,s0
    1300:	4505                	li	a0,1
    1302:	15b000ef          	jal	ra,1c5c <write>
}
    1306:	60a2                	ld	ra,8(sp)
    1308:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    130a:	957d                	srai	a0,a0,0x3f
    return r;
    130c:	2501                	sext.w	a0,a0
}
    130e:	0141                	addi	sp,sp,16
    1310:	8082                	ret

0000000000001312 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1312:	7171                	addi	sp,sp,-176
    1314:	fc56                	sd	s5,56(sp)
    1316:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1318:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    131a:	18bc                	addi	a5,sp,120
{
    131c:	e8ca                	sd	s2,80(sp)
    131e:	e4ce                	sd	s3,72(sp)
    1320:	e0d2                	sd	s4,64(sp)
    1322:	f85a                	sd	s6,48(sp)
    1324:	f486                	sd	ra,104(sp)
    1326:	f0a2                	sd	s0,96(sp)
    1328:	eca6                	sd	s1,88(sp)
    132a:	fcae                	sd	a1,120(sp)
    132c:	e132                	sd	a2,128(sp)
    132e:	e536                	sd	a3,136(sp)
    1330:	e93a                	sd	a4,144(sp)
    1332:	f142                	sd	a6,160(sp)
    1334:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1336:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1338:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    133c:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1340:	00001b17          	auipc	s6,0x1
    1344:	c10b0b13          	addi	s6,s6,-1008 # 1f50 <__clone+0xbc>
    buf[i++] = '0';
    1348:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    134c:	00001997          	auipc	s3,0x1
    1350:	c3498993          	addi	s3,s3,-972 # 1f80 <digits>
        if (!*s)
    1354:	00054783          	lbu	a5,0(a0)
    1358:	16078a63          	beqz	a5,14cc <printf+0x1ba>
    135c:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    135e:	19278163          	beq	a5,s2,14e0 <printf+0x1ce>
    1362:	00164783          	lbu	a5,1(a2)
    1366:	0605                	addi	a2,a2,1
    1368:	fbfd                	bnez	a5,135e <printf+0x4c>
    136a:	84b2                	mv	s1,a2
        l = z - a;
    136c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1370:	85aa                	mv	a1,a0
    1372:	8622                	mv	a2,s0
    1374:	4505                	li	a0,1
    1376:	0e7000ef          	jal	ra,1c5c <write>
        if (l)
    137a:	18041c63          	bnez	s0,1512 <printf+0x200>
        if (s[1] == 0)
    137e:	0014c783          	lbu	a5,1(s1)
    1382:	14078563          	beqz	a5,14cc <printf+0x1ba>
        switch (s[1])
    1386:	1d478063          	beq	a5,s4,1546 <printf+0x234>
    138a:	18fa6663          	bltu	s4,a5,1516 <printf+0x204>
    138e:	06400713          	li	a4,100
    1392:	1ae78063          	beq	a5,a4,1532 <printf+0x220>
    1396:	07000713          	li	a4,112
    139a:	1ce79963          	bne	a5,a4,156c <printf+0x25a>
            printptr(va_arg(ap, uint64));
    139e:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13a0:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13a4:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13a6:	631c                	ld	a5,0(a4)
    13a8:	0721                	addi	a4,a4,8
    13aa:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13ac:	00479293          	slli	t0,a5,0x4
    13b0:	00879f93          	slli	t6,a5,0x8
    13b4:	00c79f13          	slli	t5,a5,0xc
    13b8:	01079e93          	slli	t4,a5,0x10
    13bc:	01479e13          	slli	t3,a5,0x14
    13c0:	01879313          	slli	t1,a5,0x18
    13c4:	01c79893          	slli	a7,a5,0x1c
    13c8:	02479813          	slli	a6,a5,0x24
    13cc:	02879513          	slli	a0,a5,0x28
    13d0:	02c79593          	slli	a1,a5,0x2c
    13d4:	03079693          	slli	a3,a5,0x30
    13d8:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13dc:	03c7d413          	srli	s0,a5,0x3c
    13e0:	01c7d39b          	srliw	t2,a5,0x1c
    13e4:	03c2d293          	srli	t0,t0,0x3c
    13e8:	03cfdf93          	srli	t6,t6,0x3c
    13ec:	03cf5f13          	srli	t5,t5,0x3c
    13f0:	03cede93          	srli	t4,t4,0x3c
    13f4:	03ce5e13          	srli	t3,t3,0x3c
    13f8:	03c35313          	srli	t1,t1,0x3c
    13fc:	03c8d893          	srli	a7,a7,0x3c
    1400:	03c85813          	srli	a6,a6,0x3c
    1404:	9171                	srli	a0,a0,0x3c
    1406:	91f1                	srli	a1,a1,0x3c
    1408:	92f1                	srli	a3,a3,0x3c
    140a:	9371                	srli	a4,a4,0x3c
    140c:	96ce                	add	a3,a3,s3
    140e:	974e                	add	a4,a4,s3
    1410:	944e                	add	s0,s0,s3
    1412:	92ce                	add	t0,t0,s3
    1414:	9fce                	add	t6,t6,s3
    1416:	9f4e                	add	t5,t5,s3
    1418:	9ece                	add	t4,t4,s3
    141a:	9e4e                	add	t3,t3,s3
    141c:	934e                	add	t1,t1,s3
    141e:	98ce                	add	a7,a7,s3
    1420:	93ce                	add	t2,t2,s3
    1422:	984e                	add	a6,a6,s3
    1424:	954e                	add	a0,a0,s3
    1426:	95ce                	add	a1,a1,s3
    1428:	0006c083          	lbu	ra,0(a3)
    142c:	0002c283          	lbu	t0,0(t0)
    1430:	00074683          	lbu	a3,0(a4)
    1434:	000fcf83          	lbu	t6,0(t6)
    1438:	000f4f03          	lbu	t5,0(t5)
    143c:	000ece83          	lbu	t4,0(t4)
    1440:	000e4e03          	lbu	t3,0(t3)
    1444:	00034303          	lbu	t1,0(t1)
    1448:	0008c883          	lbu	a7,0(a7)
    144c:	0003c383          	lbu	t2,0(t2)
    1450:	00084803          	lbu	a6,0(a6)
    1454:	00054503          	lbu	a0,0(a0)
    1458:	0005c583          	lbu	a1,0(a1)
    145c:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1460:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1464:	9371                	srli	a4,a4,0x3c
    1466:	8bbd                	andi	a5,a5,15
    1468:	974e                	add	a4,a4,s3
    146a:	97ce                	add	a5,a5,s3
    146c:	005105a3          	sb	t0,11(sp)
    1470:	01f10623          	sb	t6,12(sp)
    1474:	01e106a3          	sb	t5,13(sp)
    1478:	01d10723          	sb	t4,14(sp)
    147c:	01c107a3          	sb	t3,15(sp)
    1480:	00610823          	sb	t1,16(sp)
    1484:	011108a3          	sb	a7,17(sp)
    1488:	00710923          	sb	t2,18(sp)
    148c:	010109a3          	sb	a6,19(sp)
    1490:	00a10a23          	sb	a0,20(sp)
    1494:	00b10aa3          	sb	a1,21(sp)
    1498:	00110b23          	sb	ra,22(sp)
    149c:	00d10ba3          	sb	a3,23(sp)
    14a0:	00810523          	sb	s0,10(sp)
    14a4:	00074703          	lbu	a4,0(a4)
    14a8:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14ac:	002c                	addi	a1,sp,8
    14ae:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14b0:	00e10c23          	sb	a4,24(sp)
    14b4:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14b8:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14bc:	7a0000ef          	jal	ra,1c5c <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14c0:	00248513          	addi	a0,s1,2
        if (!*s)
    14c4:	00054783          	lbu	a5,0(a0)
    14c8:	e8079ae3          	bnez	a5,135c <printf+0x4a>
    }
    va_end(ap);
}
    14cc:	70a6                	ld	ra,104(sp)
    14ce:	7406                	ld	s0,96(sp)
    14d0:	64e6                	ld	s1,88(sp)
    14d2:	6946                	ld	s2,80(sp)
    14d4:	69a6                	ld	s3,72(sp)
    14d6:	6a06                	ld	s4,64(sp)
    14d8:	7ae2                	ld	s5,56(sp)
    14da:	7b42                	ld	s6,48(sp)
    14dc:	614d                	addi	sp,sp,176
    14de:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14e0:	00064783          	lbu	a5,0(a2)
    14e4:	84b2                	mv	s1,a2
    14e6:	01278963          	beq	a5,s2,14f8 <printf+0x1e6>
    14ea:	b549                	j	136c <printf+0x5a>
    14ec:	0024c783          	lbu	a5,2(s1)
    14f0:	0605                	addi	a2,a2,1
    14f2:	0489                	addi	s1,s1,2
    14f4:	e7279ce3          	bne	a5,s2,136c <printf+0x5a>
    14f8:	0014c783          	lbu	a5,1(s1)
    14fc:	ff2788e3          	beq	a5,s2,14ec <printf+0x1da>
        l = z - a;
    1500:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1504:	85aa                	mv	a1,a0
    1506:	8622                	mv	a2,s0
    1508:	4505                	li	a0,1
    150a:	752000ef          	jal	ra,1c5c <write>
        if (l)
    150e:	e60408e3          	beqz	s0,137e <printf+0x6c>
    1512:	8526                	mv	a0,s1
    1514:	b581                	j	1354 <printf+0x42>
        switch (s[1])
    1516:	07800713          	li	a4,120
    151a:	04e79963          	bne	a5,a4,156c <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    151e:	6782                	ld	a5,0(sp)
    1520:	45c1                	li	a1,16
    1522:	4388                	lw	a0,0(a5)
    1524:	07a1                	addi	a5,a5,8
    1526:	e03e                	sd	a5,0(sp)
    1528:	be5ff0ef          	jal	ra,110c <printint.constprop.0>
        s += 2;
    152c:	00248513          	addi	a0,s1,2
    1530:	bf51                	j	14c4 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    1532:	6782                	ld	a5,0(sp)
    1534:	45a9                	li	a1,10
    1536:	4388                	lw	a0,0(a5)
    1538:	07a1                	addi	a5,a5,8
    153a:	e03e                	sd	a5,0(sp)
    153c:	bd1ff0ef          	jal	ra,110c <printint.constprop.0>
        s += 2;
    1540:	00248513          	addi	a0,s1,2
    1544:	b741                	j	14c4 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1546:	6782                	ld	a5,0(sp)
    1548:	6380                	ld	s0,0(a5)
    154a:	07a1                	addi	a5,a5,8
    154c:	e03e                	sd	a5,0(sp)
    154e:	c421                	beqz	s0,1596 <printf+0x284>
            l = strnlen(a, 200);
    1550:	0c800593          	li	a1,200
    1554:	8522                	mv	a0,s0
    1556:	40e000ef          	jal	ra,1964 <strnlen>
    write(f, s, l);
    155a:	0005061b          	sext.w	a2,a0
    155e:	85a2                	mv	a1,s0
    1560:	4505                	li	a0,1
    1562:	6fa000ef          	jal	ra,1c5c <write>
        s += 2;
    1566:	00248513          	addi	a0,s1,2
    156a:	bfa9                	j	14c4 <printf+0x1b2>
    char byte = c;
    156c:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1570:	4605                	li	a2,1
    1572:	002c                	addi	a1,sp,8
    1574:	4505                	li	a0,1
    char byte = c;
    1576:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    157a:	6e2000ef          	jal	ra,1c5c <write>
    char byte = c;
    157e:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1582:	4605                	li	a2,1
    1584:	002c                	addi	a1,sp,8
    1586:	4505                	li	a0,1
    char byte = c;
    1588:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    158c:	6d0000ef          	jal	ra,1c5c <write>
        s += 2;
    1590:	00248513          	addi	a0,s1,2
    1594:	bf05                	j	14c4 <printf+0x1b2>
                a = "(null)";
    1596:	845a                	mv	s0,s6
    1598:	bf65                	j	1550 <printf+0x23e>

000000000000159a <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    159a:	1141                	addi	sp,sp,-16
    159c:	e406                	sd	ra,8(sp)
    puts(m);
    159e:	d53ff0ef          	jal	ra,12f0 <puts>
    exit(-100);
}
    15a2:	60a2                	ld	ra,8(sp)
    exit(-100);
    15a4:	f9c00513          	li	a0,-100
}
    15a8:	0141                	addi	sp,sp,16
    exit(-100);
    15aa:	a709                	j	1cac <exit>

00000000000015ac <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ac:	02000793          	li	a5,32
    15b0:	00f50663          	beq	a0,a5,15bc <isspace+0x10>
    15b4:	355d                	addiw	a0,a0,-9
    15b6:	00553513          	sltiu	a0,a0,5
    15ba:	8082                	ret
    15bc:	4505                	li	a0,1
}
    15be:	8082                	ret

00000000000015c0 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15c0:	fd05051b          	addiw	a0,a0,-48
}
    15c4:	00a53513          	sltiu	a0,a0,10
    15c8:	8082                	ret

00000000000015ca <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ca:	02000613          	li	a2,32
    15ce:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15d0:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d4:	ff77069b          	addiw	a3,a4,-9
    15d8:	04c70d63          	beq	a4,a2,1632 <atoi+0x68>
    15dc:	0007079b          	sext.w	a5,a4
    15e0:	04d5f963          	bgeu	a1,a3,1632 <atoi+0x68>
        s++;
    switch (*s)
    15e4:	02b00693          	li	a3,43
    15e8:	04d70a63          	beq	a4,a3,163c <atoi+0x72>
    15ec:	02d00693          	li	a3,45
    15f0:	06d70463          	beq	a4,a3,1658 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15f4:	fd07859b          	addiw	a1,a5,-48
    15f8:	4625                	li	a2,9
    15fa:	873e                	mv	a4,a5
    15fc:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15fe:	4e01                	li	t3,0
    while (isdigit(*s))
    1600:	04b66a63          	bltu	a2,a1,1654 <atoi+0x8a>
    int n = 0, neg = 0;
    1604:	4501                	li	a0,0
    while (isdigit(*s))
    1606:	4825                	li	a6,9
    1608:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    160c:	0025179b          	slliw	a5,a0,0x2
    1610:	9d3d                	addw	a0,a0,a5
    1612:	fd07031b          	addiw	t1,a4,-48
    1616:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    161a:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    161e:	0685                	addi	a3,a3,1
    1620:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1624:	0006071b          	sext.w	a4,a2
    1628:	feb870e3          	bgeu	a6,a1,1608 <atoi+0x3e>
    return neg ? n : -n;
    162c:	000e0563          	beqz	t3,1636 <atoi+0x6c>
}
    1630:	8082                	ret
        s++;
    1632:	0505                	addi	a0,a0,1
    1634:	bf71                	j	15d0 <atoi+0x6>
    1636:	4113053b          	subw	a0,t1,a7
    163a:	8082                	ret
    while (isdigit(*s))
    163c:	00154783          	lbu	a5,1(a0)
    1640:	4625                	li	a2,9
        s++;
    1642:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1646:	fd07859b          	addiw	a1,a5,-48
    164a:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    164e:	4e01                	li	t3,0
    while (isdigit(*s))
    1650:	fab67ae3          	bgeu	a2,a1,1604 <atoi+0x3a>
    1654:	4501                	li	a0,0
}
    1656:	8082                	ret
    while (isdigit(*s))
    1658:	00154783          	lbu	a5,1(a0)
    165c:	4625                	li	a2,9
        s++;
    165e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1662:	fd07859b          	addiw	a1,a5,-48
    1666:	0007871b          	sext.w	a4,a5
    166a:	feb665e3          	bltu	a2,a1,1654 <atoi+0x8a>
        neg = 1;
    166e:	4e05                	li	t3,1
    1670:	bf51                	j	1604 <atoi+0x3a>

0000000000001672 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1672:	16060d63          	beqz	a2,17ec <memset+0x17a>
    1676:	40a007b3          	neg	a5,a0
    167a:	8b9d                	andi	a5,a5,7
    167c:	00778713          	addi	a4,a5,7
    1680:	482d                	li	a6,11
    1682:	0ff5f593          	andi	a1,a1,255
    1686:	fff60693          	addi	a3,a2,-1
    168a:	17076263          	bltu	a4,a6,17ee <memset+0x17c>
    168e:	16e6ea63          	bltu	a3,a4,1802 <memset+0x190>
    1692:	16078563          	beqz	a5,17fc <memset+0x18a>
    1696:	00b50023          	sb	a1,0(a0)
    169a:	4705                	li	a4,1
    169c:	00150e93          	addi	t4,a0,1
    16a0:	14e78c63          	beq	a5,a4,17f8 <memset+0x186>
    16a4:	00b500a3          	sb	a1,1(a0)
    16a8:	4709                	li	a4,2
    16aa:	00250e93          	addi	t4,a0,2
    16ae:	14e78d63          	beq	a5,a4,1808 <memset+0x196>
    16b2:	00b50123          	sb	a1,2(a0)
    16b6:	470d                	li	a4,3
    16b8:	00350e93          	addi	t4,a0,3
    16bc:	12e78b63          	beq	a5,a4,17f2 <memset+0x180>
    16c0:	00b501a3          	sb	a1,3(a0)
    16c4:	4711                	li	a4,4
    16c6:	00450e93          	addi	t4,a0,4
    16ca:	14e78163          	beq	a5,a4,180c <memset+0x19a>
    16ce:	00b50223          	sb	a1,4(a0)
    16d2:	4715                	li	a4,5
    16d4:	00550e93          	addi	t4,a0,5
    16d8:	12e78c63          	beq	a5,a4,1810 <memset+0x19e>
    16dc:	00b502a3          	sb	a1,5(a0)
    16e0:	471d                	li	a4,7
    16e2:	00650e93          	addi	t4,a0,6
    16e6:	12e79763          	bne	a5,a4,1814 <memset+0x1a2>
    16ea:	00750e93          	addi	t4,a0,7
    16ee:	00b50323          	sb	a1,6(a0)
    16f2:	4f1d                	li	t5,7
    16f4:	00859713          	slli	a4,a1,0x8
    16f8:	8f4d                	or	a4,a4,a1
    16fa:	01059e13          	slli	t3,a1,0x10
    16fe:	01c76e33          	or	t3,a4,t3
    1702:	01859313          	slli	t1,a1,0x18
    1706:	006e6333          	or	t1,t3,t1
    170a:	02059893          	slli	a7,a1,0x20
    170e:	011368b3          	or	a7,t1,a7
    1712:	02859813          	slli	a6,a1,0x28
    1716:	40f60333          	sub	t1,a2,a5
    171a:	0108e833          	or	a6,a7,a6
    171e:	03059693          	slli	a3,a1,0x30
    1722:	00d866b3          	or	a3,a6,a3
    1726:	03859713          	slli	a4,a1,0x38
    172a:	97aa                	add	a5,a5,a0
    172c:	ff837813          	andi	a6,t1,-8
    1730:	8f55                	or	a4,a4,a3
    1732:	00f806b3          	add	a3,a6,a5
    1736:	e398                	sd	a4,0(a5)
    1738:	07a1                	addi	a5,a5,8
    173a:	fed79ee3          	bne	a5,a3,1736 <memset+0xc4>
    173e:	ff837693          	andi	a3,t1,-8
    1742:	00de87b3          	add	a5,t4,a3
    1746:	01e6873b          	addw	a4,a3,t5
    174a:	0ad30663          	beq	t1,a3,17f6 <memset+0x184>
    174e:	00b78023          	sb	a1,0(a5)
    1752:	0017069b          	addiw	a3,a4,1
    1756:	08c6fb63          	bgeu	a3,a2,17ec <memset+0x17a>
    175a:	00b780a3          	sb	a1,1(a5)
    175e:	0027069b          	addiw	a3,a4,2
    1762:	08c6f563          	bgeu	a3,a2,17ec <memset+0x17a>
    1766:	00b78123          	sb	a1,2(a5)
    176a:	0037069b          	addiw	a3,a4,3
    176e:	06c6ff63          	bgeu	a3,a2,17ec <memset+0x17a>
    1772:	00b781a3          	sb	a1,3(a5)
    1776:	0047069b          	addiw	a3,a4,4
    177a:	06c6f963          	bgeu	a3,a2,17ec <memset+0x17a>
    177e:	00b78223          	sb	a1,4(a5)
    1782:	0057069b          	addiw	a3,a4,5
    1786:	06c6f363          	bgeu	a3,a2,17ec <memset+0x17a>
    178a:	00b782a3          	sb	a1,5(a5)
    178e:	0067069b          	addiw	a3,a4,6
    1792:	04c6fd63          	bgeu	a3,a2,17ec <memset+0x17a>
    1796:	00b78323          	sb	a1,6(a5)
    179a:	0077069b          	addiw	a3,a4,7
    179e:	04c6f763          	bgeu	a3,a2,17ec <memset+0x17a>
    17a2:	00b783a3          	sb	a1,7(a5)
    17a6:	0087069b          	addiw	a3,a4,8
    17aa:	04c6f163          	bgeu	a3,a2,17ec <memset+0x17a>
    17ae:	00b78423          	sb	a1,8(a5)
    17b2:	0097069b          	addiw	a3,a4,9
    17b6:	02c6fb63          	bgeu	a3,a2,17ec <memset+0x17a>
    17ba:	00b784a3          	sb	a1,9(a5)
    17be:	00a7069b          	addiw	a3,a4,10
    17c2:	02c6f563          	bgeu	a3,a2,17ec <memset+0x17a>
    17c6:	00b78523          	sb	a1,10(a5)
    17ca:	00b7069b          	addiw	a3,a4,11
    17ce:	00c6ff63          	bgeu	a3,a2,17ec <memset+0x17a>
    17d2:	00b785a3          	sb	a1,11(a5)
    17d6:	00c7069b          	addiw	a3,a4,12
    17da:	00c6f963          	bgeu	a3,a2,17ec <memset+0x17a>
    17de:	00b78623          	sb	a1,12(a5)
    17e2:	2735                	addiw	a4,a4,13
    17e4:	00c77463          	bgeu	a4,a2,17ec <memset+0x17a>
    17e8:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17ec:	8082                	ret
    17ee:	472d                	li	a4,11
    17f0:	bd79                	j	168e <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17f2:	4f0d                	li	t5,3
    17f4:	b701                	j	16f4 <memset+0x82>
    17f6:	8082                	ret
    17f8:	4f05                	li	t5,1
    17fa:	bded                	j	16f4 <memset+0x82>
    17fc:	8eaa                	mv	t4,a0
    17fe:	4f01                	li	t5,0
    1800:	bdd5                	j	16f4 <memset+0x82>
    1802:	87aa                	mv	a5,a0
    1804:	4701                	li	a4,0
    1806:	b7a1                	j	174e <memset+0xdc>
    1808:	4f09                	li	t5,2
    180a:	b5ed                	j	16f4 <memset+0x82>
    180c:	4f11                	li	t5,4
    180e:	b5dd                	j	16f4 <memset+0x82>
    1810:	4f15                	li	t5,5
    1812:	b5cd                	j	16f4 <memset+0x82>
    1814:	4f19                	li	t5,6
    1816:	bdf9                	j	16f4 <memset+0x82>

0000000000001818 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1818:	00054783          	lbu	a5,0(a0)
    181c:	0005c703          	lbu	a4,0(a1)
    1820:	00e79863          	bne	a5,a4,1830 <strcmp+0x18>
    1824:	0505                	addi	a0,a0,1
    1826:	0585                	addi	a1,a1,1
    1828:	fbe5                	bnez	a5,1818 <strcmp>
    182a:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    182c:	9d19                	subw	a0,a0,a4
    182e:	8082                	ret
    1830:	0007851b          	sext.w	a0,a5
    1834:	bfe5                	j	182c <strcmp+0x14>

0000000000001836 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1836:	ce05                	beqz	a2,186e <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1838:	00054703          	lbu	a4,0(a0)
    183c:	0005c783          	lbu	a5,0(a1)
    1840:	cb0d                	beqz	a4,1872 <strncmp+0x3c>
    if (!n--)
    1842:	167d                	addi	a2,a2,-1
    1844:	00c506b3          	add	a3,a0,a2
    1848:	a819                	j	185e <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    184a:	00a68e63          	beq	a3,a0,1866 <strncmp+0x30>
    184e:	0505                	addi	a0,a0,1
    1850:	00e79b63          	bne	a5,a4,1866 <strncmp+0x30>
    1854:	00054703          	lbu	a4,0(a0)
    1858:	0005c783          	lbu	a5,0(a1)
    185c:	cb19                	beqz	a4,1872 <strncmp+0x3c>
    185e:	0005c783          	lbu	a5,0(a1)
    1862:	0585                	addi	a1,a1,1
    1864:	f3fd                	bnez	a5,184a <strncmp+0x14>
        ;
    return *l - *r;
    1866:	0007051b          	sext.w	a0,a4
    186a:	9d1d                	subw	a0,a0,a5
    186c:	8082                	ret
        return 0;
    186e:	4501                	li	a0,0
}
    1870:	8082                	ret
    1872:	4501                	li	a0,0
    return *l - *r;
    1874:	9d1d                	subw	a0,a0,a5
    1876:	8082                	ret

0000000000001878 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1878:	00757793          	andi	a5,a0,7
    187c:	cf89                	beqz	a5,1896 <strlen+0x1e>
    187e:	87aa                	mv	a5,a0
    1880:	a029                	j	188a <strlen+0x12>
    1882:	0785                	addi	a5,a5,1
    1884:	0077f713          	andi	a4,a5,7
    1888:	cb01                	beqz	a4,1898 <strlen+0x20>
        if (!*s)
    188a:	0007c703          	lbu	a4,0(a5)
    188e:	fb75                	bnez	a4,1882 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1890:	40a78533          	sub	a0,a5,a0
}
    1894:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1896:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1898:	6394                	ld	a3,0(a5)
    189a:	00000597          	auipc	a1,0x0
    189e:	6be5b583          	ld	a1,1726(a1) # 1f58 <__clone+0xc4>
    18a2:	00000617          	auipc	a2,0x0
    18a6:	6be63603          	ld	a2,1726(a2) # 1f60 <__clone+0xcc>
    18aa:	a019                	j	18b0 <strlen+0x38>
    18ac:	6794                	ld	a3,8(a5)
    18ae:	07a1                	addi	a5,a5,8
    18b0:	00b68733          	add	a4,a3,a1
    18b4:	fff6c693          	not	a3,a3
    18b8:	8f75                	and	a4,a4,a3
    18ba:	8f71                	and	a4,a4,a2
    18bc:	db65                	beqz	a4,18ac <strlen+0x34>
    for (; *s; s++)
    18be:	0007c703          	lbu	a4,0(a5)
    18c2:	d779                	beqz	a4,1890 <strlen+0x18>
    18c4:	0017c703          	lbu	a4,1(a5)
    18c8:	0785                	addi	a5,a5,1
    18ca:	d379                	beqz	a4,1890 <strlen+0x18>
    18cc:	0017c703          	lbu	a4,1(a5)
    18d0:	0785                	addi	a5,a5,1
    18d2:	fb6d                	bnez	a4,18c4 <strlen+0x4c>
    18d4:	bf75                	j	1890 <strlen+0x18>

00000000000018d6 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18d6:	00757713          	andi	a4,a0,7
{
    18da:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18dc:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18e0:	cb19                	beqz	a4,18f6 <memchr+0x20>
    18e2:	ce25                	beqz	a2,195a <memchr+0x84>
    18e4:	0007c703          	lbu	a4,0(a5)
    18e8:	04b70e63          	beq	a4,a1,1944 <memchr+0x6e>
    18ec:	0785                	addi	a5,a5,1
    18ee:	0077f713          	andi	a4,a5,7
    18f2:	167d                	addi	a2,a2,-1
    18f4:	f77d                	bnez	a4,18e2 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18f6:	4501                	li	a0,0
    if (n && *s != c)
    18f8:	c235                	beqz	a2,195c <memchr+0x86>
    18fa:	0007c703          	lbu	a4,0(a5)
    18fe:	04b70363          	beq	a4,a1,1944 <memchr+0x6e>
        size_t k = ONES * c;
    1902:	00000517          	auipc	a0,0x0
    1906:	66653503          	ld	a0,1638(a0) # 1f68 <__clone+0xd4>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    190a:	471d                	li	a4,7
        size_t k = ONES * c;
    190c:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1910:	02c77a63          	bgeu	a4,a2,1944 <memchr+0x6e>
    1914:	00000897          	auipc	a7,0x0
    1918:	6448b883          	ld	a7,1604(a7) # 1f58 <__clone+0xc4>
    191c:	00000817          	auipc	a6,0x0
    1920:	64483803          	ld	a6,1604(a6) # 1f60 <__clone+0xcc>
    1924:	431d                	li	t1,7
    1926:	a029                	j	1930 <memchr+0x5a>
    1928:	1661                	addi	a2,a2,-8
    192a:	07a1                	addi	a5,a5,8
    192c:	02c37963          	bgeu	t1,a2,195e <memchr+0x88>
    1930:	6398                	ld	a4,0(a5)
    1932:	8f29                	xor	a4,a4,a0
    1934:	011706b3          	add	a3,a4,a7
    1938:	fff74713          	not	a4,a4
    193c:	8f75                	and	a4,a4,a3
    193e:	01077733          	and	a4,a4,a6
    1942:	d37d                	beqz	a4,1928 <memchr+0x52>
    1944:	853e                	mv	a0,a5
    1946:	97b2                	add	a5,a5,a2
    1948:	a021                	j	1950 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    194a:	0505                	addi	a0,a0,1
    194c:	00f50763          	beq	a0,a5,195a <memchr+0x84>
    1950:	00054703          	lbu	a4,0(a0)
    1954:	feb71be3          	bne	a4,a1,194a <memchr+0x74>
    1958:	8082                	ret
    return n ? (void *)s : 0;
    195a:	4501                	li	a0,0
}
    195c:	8082                	ret
    return n ? (void *)s : 0;
    195e:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1960:	f275                	bnez	a2,1944 <memchr+0x6e>
}
    1962:	8082                	ret

0000000000001964 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1964:	1101                	addi	sp,sp,-32
    1966:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1968:	862e                	mv	a2,a1
{
    196a:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    196c:	4581                	li	a1,0
{
    196e:	e426                	sd	s1,8(sp)
    1970:	ec06                	sd	ra,24(sp)
    1972:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1974:	f63ff0ef          	jal	ra,18d6 <memchr>
    return p ? p - s : n;
    1978:	c519                	beqz	a0,1986 <strnlen+0x22>
}
    197a:	60e2                	ld	ra,24(sp)
    197c:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    197e:	8d05                	sub	a0,a0,s1
}
    1980:	64a2                	ld	s1,8(sp)
    1982:	6105                	addi	sp,sp,32
    1984:	8082                	ret
    1986:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1988:	8522                	mv	a0,s0
}
    198a:	6442                	ld	s0,16(sp)
    198c:	64a2                	ld	s1,8(sp)
    198e:	6105                	addi	sp,sp,32
    1990:	8082                	ret

0000000000001992 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1992:	00b547b3          	xor	a5,a0,a1
    1996:	8b9d                	andi	a5,a5,7
    1998:	eb95                	bnez	a5,19cc <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    199a:	0075f793          	andi	a5,a1,7
    199e:	e7b1                	bnez	a5,19ea <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19a0:	6198                	ld	a4,0(a1)
    19a2:	00000617          	auipc	a2,0x0
    19a6:	5b663603          	ld	a2,1462(a2) # 1f58 <__clone+0xc4>
    19aa:	00000817          	auipc	a6,0x0
    19ae:	5b683803          	ld	a6,1462(a6) # 1f60 <__clone+0xcc>
    19b2:	a029                	j	19bc <strcpy+0x2a>
    19b4:	e118                	sd	a4,0(a0)
    19b6:	6598                	ld	a4,8(a1)
    19b8:	05a1                	addi	a1,a1,8
    19ba:	0521                	addi	a0,a0,8
    19bc:	00c707b3          	add	a5,a4,a2
    19c0:	fff74693          	not	a3,a4
    19c4:	8ff5                	and	a5,a5,a3
    19c6:	0107f7b3          	and	a5,a5,a6
    19ca:	d7ed                	beqz	a5,19b4 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19cc:	0005c783          	lbu	a5,0(a1)
    19d0:	00f50023          	sb	a5,0(a0)
    19d4:	c785                	beqz	a5,19fc <strcpy+0x6a>
    19d6:	0015c783          	lbu	a5,1(a1)
    19da:	0505                	addi	a0,a0,1
    19dc:	0585                	addi	a1,a1,1
    19de:	00f50023          	sb	a5,0(a0)
    19e2:	fbf5                	bnez	a5,19d6 <strcpy+0x44>
        ;
    return d;
}
    19e4:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19e6:	0505                	addi	a0,a0,1
    19e8:	df45                	beqz	a4,19a0 <strcpy+0xe>
            if (!(*d = *s))
    19ea:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19ee:	0585                	addi	a1,a1,1
    19f0:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    19f4:	00f50023          	sb	a5,0(a0)
    19f8:	f7fd                	bnez	a5,19e6 <strcpy+0x54>
}
    19fa:	8082                	ret
    19fc:	8082                	ret

00000000000019fe <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19fe:	00b547b3          	xor	a5,a0,a1
    1a02:	8b9d                	andi	a5,a5,7
    1a04:	1a079863          	bnez	a5,1bb4 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a08:	0075f793          	andi	a5,a1,7
    1a0c:	16078463          	beqz	a5,1b74 <strncpy+0x176>
    1a10:	ea01                	bnez	a2,1a20 <strncpy+0x22>
    1a12:	a421                	j	1c1a <strncpy+0x21c>
    1a14:	167d                	addi	a2,a2,-1
    1a16:	0505                	addi	a0,a0,1
    1a18:	14070e63          	beqz	a4,1b74 <strncpy+0x176>
    1a1c:	1a060863          	beqz	a2,1bcc <strncpy+0x1ce>
    1a20:	0005c783          	lbu	a5,0(a1)
    1a24:	0585                	addi	a1,a1,1
    1a26:	0075f713          	andi	a4,a1,7
    1a2a:	00f50023          	sb	a5,0(a0)
    1a2e:	f3fd                	bnez	a5,1a14 <strncpy+0x16>
    1a30:	4805                	li	a6,1
    1a32:	1a061863          	bnez	a2,1be2 <strncpy+0x1e4>
    1a36:	40a007b3          	neg	a5,a0
    1a3a:	8b9d                	andi	a5,a5,7
    1a3c:	4681                	li	a3,0
    1a3e:	18061a63          	bnez	a2,1bd2 <strncpy+0x1d4>
    1a42:	00778713          	addi	a4,a5,7
    1a46:	45ad                	li	a1,11
    1a48:	18b76363          	bltu	a4,a1,1bce <strncpy+0x1d0>
    1a4c:	1ae6eb63          	bltu	a3,a4,1c02 <strncpy+0x204>
    1a50:	1a078363          	beqz	a5,1bf6 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a54:	00050023          	sb	zero,0(a0)
    1a58:	4685                	li	a3,1
    1a5a:	00150713          	addi	a4,a0,1
    1a5e:	18d78f63          	beq	a5,a3,1bfc <strncpy+0x1fe>
    1a62:	000500a3          	sb	zero,1(a0)
    1a66:	4689                	li	a3,2
    1a68:	00250713          	addi	a4,a0,2
    1a6c:	18d78e63          	beq	a5,a3,1c08 <strncpy+0x20a>
    1a70:	00050123          	sb	zero,2(a0)
    1a74:	468d                	li	a3,3
    1a76:	00350713          	addi	a4,a0,3
    1a7a:	16d78c63          	beq	a5,a3,1bf2 <strncpy+0x1f4>
    1a7e:	000501a3          	sb	zero,3(a0)
    1a82:	4691                	li	a3,4
    1a84:	00450713          	addi	a4,a0,4
    1a88:	18d78263          	beq	a5,a3,1c0c <strncpy+0x20e>
    1a8c:	00050223          	sb	zero,4(a0)
    1a90:	4695                	li	a3,5
    1a92:	00550713          	addi	a4,a0,5
    1a96:	16d78d63          	beq	a5,a3,1c10 <strncpy+0x212>
    1a9a:	000502a3          	sb	zero,5(a0)
    1a9e:	469d                	li	a3,7
    1aa0:	00650713          	addi	a4,a0,6
    1aa4:	16d79863          	bne	a5,a3,1c14 <strncpy+0x216>
    1aa8:	00750713          	addi	a4,a0,7
    1aac:	00050323          	sb	zero,6(a0)
    1ab0:	40f80833          	sub	a6,a6,a5
    1ab4:	ff887593          	andi	a1,a6,-8
    1ab8:	97aa                	add	a5,a5,a0
    1aba:	95be                	add	a1,a1,a5
    1abc:	0007b023          	sd	zero,0(a5)
    1ac0:	07a1                	addi	a5,a5,8
    1ac2:	feb79de3          	bne	a5,a1,1abc <strncpy+0xbe>
    1ac6:	ff887593          	andi	a1,a6,-8
    1aca:	9ead                	addw	a3,a3,a1
    1acc:	00b707b3          	add	a5,a4,a1
    1ad0:	12b80863          	beq	a6,a1,1c00 <strncpy+0x202>
    1ad4:	00078023          	sb	zero,0(a5)
    1ad8:	0016871b          	addiw	a4,a3,1
    1adc:	0ec77863          	bgeu	a4,a2,1bcc <strncpy+0x1ce>
    1ae0:	000780a3          	sb	zero,1(a5)
    1ae4:	0026871b          	addiw	a4,a3,2
    1ae8:	0ec77263          	bgeu	a4,a2,1bcc <strncpy+0x1ce>
    1aec:	00078123          	sb	zero,2(a5)
    1af0:	0036871b          	addiw	a4,a3,3
    1af4:	0cc77c63          	bgeu	a4,a2,1bcc <strncpy+0x1ce>
    1af8:	000781a3          	sb	zero,3(a5)
    1afc:	0046871b          	addiw	a4,a3,4
    1b00:	0cc77663          	bgeu	a4,a2,1bcc <strncpy+0x1ce>
    1b04:	00078223          	sb	zero,4(a5)
    1b08:	0056871b          	addiw	a4,a3,5
    1b0c:	0cc77063          	bgeu	a4,a2,1bcc <strncpy+0x1ce>
    1b10:	000782a3          	sb	zero,5(a5)
    1b14:	0066871b          	addiw	a4,a3,6
    1b18:	0ac77a63          	bgeu	a4,a2,1bcc <strncpy+0x1ce>
    1b1c:	00078323          	sb	zero,6(a5)
    1b20:	0076871b          	addiw	a4,a3,7
    1b24:	0ac77463          	bgeu	a4,a2,1bcc <strncpy+0x1ce>
    1b28:	000783a3          	sb	zero,7(a5)
    1b2c:	0086871b          	addiw	a4,a3,8
    1b30:	08c77e63          	bgeu	a4,a2,1bcc <strncpy+0x1ce>
    1b34:	00078423          	sb	zero,8(a5)
    1b38:	0096871b          	addiw	a4,a3,9
    1b3c:	08c77863          	bgeu	a4,a2,1bcc <strncpy+0x1ce>
    1b40:	000784a3          	sb	zero,9(a5)
    1b44:	00a6871b          	addiw	a4,a3,10
    1b48:	08c77263          	bgeu	a4,a2,1bcc <strncpy+0x1ce>
    1b4c:	00078523          	sb	zero,10(a5)
    1b50:	00b6871b          	addiw	a4,a3,11
    1b54:	06c77c63          	bgeu	a4,a2,1bcc <strncpy+0x1ce>
    1b58:	000785a3          	sb	zero,11(a5)
    1b5c:	00c6871b          	addiw	a4,a3,12
    1b60:	06c77663          	bgeu	a4,a2,1bcc <strncpy+0x1ce>
    1b64:	00078623          	sb	zero,12(a5)
    1b68:	26b5                	addiw	a3,a3,13
    1b6a:	06c6f163          	bgeu	a3,a2,1bcc <strncpy+0x1ce>
    1b6e:	000786a3          	sb	zero,13(a5)
    1b72:	8082                	ret
            ;
        if (!n || !*s)
    1b74:	c645                	beqz	a2,1c1c <strncpy+0x21e>
    1b76:	0005c783          	lbu	a5,0(a1)
    1b7a:	ea078be3          	beqz	a5,1a30 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b7e:	479d                	li	a5,7
    1b80:	02c7ff63          	bgeu	a5,a2,1bbe <strncpy+0x1c0>
    1b84:	00000897          	auipc	a7,0x0
    1b88:	3d48b883          	ld	a7,980(a7) # 1f58 <__clone+0xc4>
    1b8c:	00000817          	auipc	a6,0x0
    1b90:	3d483803          	ld	a6,980(a6) # 1f60 <__clone+0xcc>
    1b94:	431d                	li	t1,7
    1b96:	6198                	ld	a4,0(a1)
    1b98:	011707b3          	add	a5,a4,a7
    1b9c:	fff74693          	not	a3,a4
    1ba0:	8ff5                	and	a5,a5,a3
    1ba2:	0107f7b3          	and	a5,a5,a6
    1ba6:	ef81                	bnez	a5,1bbe <strncpy+0x1c0>
            *wd = *ws;
    1ba8:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1baa:	1661                	addi	a2,a2,-8
    1bac:	05a1                	addi	a1,a1,8
    1bae:	0521                	addi	a0,a0,8
    1bb0:	fec363e3          	bltu	t1,a2,1b96 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bb4:	e609                	bnez	a2,1bbe <strncpy+0x1c0>
    1bb6:	a08d                	j	1c18 <strncpy+0x21a>
    1bb8:	167d                	addi	a2,a2,-1
    1bba:	0505                	addi	a0,a0,1
    1bbc:	ca01                	beqz	a2,1bcc <strncpy+0x1ce>
    1bbe:	0005c783          	lbu	a5,0(a1)
    1bc2:	0585                	addi	a1,a1,1
    1bc4:	00f50023          	sb	a5,0(a0)
    1bc8:	fbe5                	bnez	a5,1bb8 <strncpy+0x1ba>
        ;
tail:
    1bca:	b59d                	j	1a30 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1bcc:	8082                	ret
    1bce:	472d                	li	a4,11
    1bd0:	bdb5                	j	1a4c <strncpy+0x4e>
    1bd2:	00778713          	addi	a4,a5,7
    1bd6:	45ad                	li	a1,11
    1bd8:	fff60693          	addi	a3,a2,-1
    1bdc:	e6b778e3          	bgeu	a4,a1,1a4c <strncpy+0x4e>
    1be0:	b7fd                	j	1bce <strncpy+0x1d0>
    1be2:	40a007b3          	neg	a5,a0
    1be6:	8832                	mv	a6,a2
    1be8:	8b9d                	andi	a5,a5,7
    1bea:	4681                	li	a3,0
    1bec:	e4060be3          	beqz	a2,1a42 <strncpy+0x44>
    1bf0:	b7cd                	j	1bd2 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bf2:	468d                	li	a3,3
    1bf4:	bd75                	j	1ab0 <strncpy+0xb2>
    1bf6:	872a                	mv	a4,a0
    1bf8:	4681                	li	a3,0
    1bfa:	bd5d                	j	1ab0 <strncpy+0xb2>
    1bfc:	4685                	li	a3,1
    1bfe:	bd4d                	j	1ab0 <strncpy+0xb2>
    1c00:	8082                	ret
    1c02:	87aa                	mv	a5,a0
    1c04:	4681                	li	a3,0
    1c06:	b5f9                	j	1ad4 <strncpy+0xd6>
    1c08:	4689                	li	a3,2
    1c0a:	b55d                	j	1ab0 <strncpy+0xb2>
    1c0c:	4691                	li	a3,4
    1c0e:	b54d                	j	1ab0 <strncpy+0xb2>
    1c10:	4695                	li	a3,5
    1c12:	bd79                	j	1ab0 <strncpy+0xb2>
    1c14:	4699                	li	a3,6
    1c16:	bd69                	j	1ab0 <strncpy+0xb2>
    1c18:	8082                	ret
    1c1a:	8082                	ret
    1c1c:	8082                	ret

0000000000001c1e <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c1e:	87aa                	mv	a5,a0
    1c20:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c22:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c26:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c2a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c2c:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c2e:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c32:	2501                	sext.w	a0,a0
    1c34:	8082                	ret

0000000000001c36 <openat>:
    register long a7 __asm__("a7") = n;
    1c36:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c3a:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c3e:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c42:	2501                	sext.w	a0,a0
    1c44:	8082                	ret

0000000000001c46 <close>:
    register long a7 __asm__("a7") = n;
    1c46:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c4a:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c4e:	2501                	sext.w	a0,a0
    1c50:	8082                	ret

0000000000001c52 <read>:
    register long a7 __asm__("a7") = n;
    1c52:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c56:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c5a:	8082                	ret

0000000000001c5c <write>:
    register long a7 __asm__("a7") = n;
    1c5c:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c60:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c64:	8082                	ret

0000000000001c66 <getpid>:
    register long a7 __asm__("a7") = n;
    1c66:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c6a:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c6e:	2501                	sext.w	a0,a0
    1c70:	8082                	ret

0000000000001c72 <getppid>:
    register long a7 __asm__("a7") = n;
    1c72:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c76:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c7a:	2501                	sext.w	a0,a0
    1c7c:	8082                	ret

0000000000001c7e <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c7e:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c82:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c86:	2501                	sext.w	a0,a0
    1c88:	8082                	ret

0000000000001c8a <fork>:
    register long a7 __asm__("a7") = n;
    1c8a:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c8e:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c90:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c92:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c96:	2501                	sext.w	a0,a0
    1c98:	8082                	ret

0000000000001c9a <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c9a:	85b2                	mv	a1,a2
    1c9c:	863a                	mv	a2,a4
    if (stack)
    1c9e:	c191                	beqz	a1,1ca2 <clone+0x8>
	stack += stack_size;
    1ca0:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1ca2:	4781                	li	a5,0
    1ca4:	4701                	li	a4,0
    1ca6:	4681                	li	a3,0
    1ca8:	2601                	sext.w	a2,a2
    1caa:	a2ed                	j	1e94 <__clone>

0000000000001cac <exit>:
    register long a7 __asm__("a7") = n;
    1cac:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cb0:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cb4:	8082                	ret

0000000000001cb6 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cb6:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cba:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cbc:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cc0:	2501                	sext.w	a0,a0
    1cc2:	8082                	ret

0000000000001cc4 <exec>:
    register long a7 __asm__("a7") = n;
    1cc4:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cc8:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1ccc:	2501                	sext.w	a0,a0
    1cce:	8082                	ret

0000000000001cd0 <execve>:
    register long a7 __asm__("a7") = n;
    1cd0:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cd4:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cd8:	2501                	sext.w	a0,a0
    1cda:	8082                	ret

0000000000001cdc <times>:
    register long a7 __asm__("a7") = n;
    1cdc:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1ce0:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1ce4:	2501                	sext.w	a0,a0
    1ce6:	8082                	ret

0000000000001ce8 <get_time>:

int64 get_time()
{
    1ce8:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cea:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cee:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cf0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cf2:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cf6:	2501                	sext.w	a0,a0
    1cf8:	ed09                	bnez	a0,1d12 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cfa:	67a2                	ld	a5,8(sp)
    1cfc:	3e800713          	li	a4,1000
    1d00:	00015503          	lhu	a0,0(sp)
    1d04:	02e7d7b3          	divu	a5,a5,a4
    1d08:	02e50533          	mul	a0,a0,a4
    1d0c:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d0e:	0141                	addi	sp,sp,16
    1d10:	8082                	ret
        return -1;
    1d12:	557d                	li	a0,-1
    1d14:	bfed                	j	1d0e <get_time+0x26>

0000000000001d16 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d16:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d1a:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d1e:	2501                	sext.w	a0,a0
    1d20:	8082                	ret

0000000000001d22 <time>:
    register long a7 __asm__("a7") = n;
    1d22:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d26:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d2a:	2501                	sext.w	a0,a0
    1d2c:	8082                	ret

0000000000001d2e <sleep>:

int sleep(unsigned long long time)
{
    1d2e:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d30:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d32:	850a                	mv	a0,sp
    1d34:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d36:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d3a:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d3c:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d40:	e501                	bnez	a0,1d48 <sleep+0x1a>
    return 0;
    1d42:	4501                	li	a0,0
}
    1d44:	0141                	addi	sp,sp,16
    1d46:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d48:	4502                	lw	a0,0(sp)
}
    1d4a:	0141                	addi	sp,sp,16
    1d4c:	8082                	ret

0000000000001d4e <set_priority>:
    register long a7 __asm__("a7") = n;
    1d4e:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d52:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d56:	2501                	sext.w	a0,a0
    1d58:	8082                	ret

0000000000001d5a <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d5a:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d5e:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d62:	8082                	ret

0000000000001d64 <munmap>:
    register long a7 __asm__("a7") = n;
    1d64:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d68:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d6c:	2501                	sext.w	a0,a0
    1d6e:	8082                	ret

0000000000001d70 <wait>:

int wait(int *code)
{
    1d70:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d72:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d76:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d78:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d7a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d7c:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d80:	2501                	sext.w	a0,a0
    1d82:	8082                	ret

0000000000001d84 <spawn>:
    register long a7 __asm__("a7") = n;
    1d84:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d88:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d8c:	2501                	sext.w	a0,a0
    1d8e:	8082                	ret

0000000000001d90 <mailread>:
    register long a7 __asm__("a7") = n;
    1d90:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d94:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d98:	2501                	sext.w	a0,a0
    1d9a:	8082                	ret

0000000000001d9c <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d9c:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da0:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1da4:	2501                	sext.w	a0,a0
    1da6:	8082                	ret

0000000000001da8 <fstat>:
    register long a7 __asm__("a7") = n;
    1da8:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dac:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1db0:	2501                	sext.w	a0,a0
    1db2:	8082                	ret

0000000000001db4 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1db4:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1db6:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dba:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dbc:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dc0:	2501                	sext.w	a0,a0
    1dc2:	8082                	ret

0000000000001dc4 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dc4:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dc6:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1dca:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dcc:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <link>:

int link(char *old_path, char *new_path)
{
    1dd4:	87aa                	mv	a5,a0
    1dd6:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1dd8:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1ddc:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1de0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1de2:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1de6:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1de8:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1dec:	2501                	sext.w	a0,a0
    1dee:	8082                	ret

0000000000001df0 <unlink>:

int unlink(char *path)
{
    1df0:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1df2:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1df6:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1dfa:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfc:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e00:	2501                	sext.w	a0,a0
    1e02:	8082                	ret

0000000000001e04 <uname>:
    register long a7 __asm__("a7") = n;
    1e04:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e08:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e0c:	2501                	sext.w	a0,a0
    1e0e:	8082                	ret

0000000000001e10 <brk>:
    register long a7 __asm__("a7") = n;
    1e10:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e14:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e18:	2501                	sext.w	a0,a0
    1e1a:	8082                	ret

0000000000001e1c <getcwd>:
    register long a7 __asm__("a7") = n;
    1e1c:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e1e:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e22:	8082                	ret

0000000000001e24 <chdir>:
    register long a7 __asm__("a7") = n;
    1e24:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e28:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e2c:	2501                	sext.w	a0,a0
    1e2e:	8082                	ret

0000000000001e30 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e30:	862e                	mv	a2,a1
    1e32:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e34:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e36:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e3a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e3e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e40:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e42:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e46:	2501                	sext.w	a0,a0
    1e48:	8082                	ret

0000000000001e4a <getdents>:
    register long a7 __asm__("a7") = n;
    1e4a:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e4e:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e52:	2501                	sext.w	a0,a0
    1e54:	8082                	ret

0000000000001e56 <pipe>:
    register long a7 __asm__("a7") = n;
    1e56:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e5a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5c:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e60:	2501                	sext.w	a0,a0
    1e62:	8082                	ret

0000000000001e64 <dup>:
    register long a7 __asm__("a7") = n;
    1e64:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e66:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <dup2>:
    register long a7 __asm__("a7") = n;
    1e6e:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e70:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e72:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e76:	2501                	sext.w	a0,a0
    1e78:	8082                	ret

0000000000001e7a <mount>:
    register long a7 __asm__("a7") = n;
    1e7a:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e7e:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e82:	2501                	sext.w	a0,a0
    1e84:	8082                	ret

0000000000001e86 <umount>:
    register long a7 __asm__("a7") = n;
    1e86:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e8a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e8c:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e90:	2501                	sext.w	a0,a0
    1e92:	8082                	ret

0000000000001e94 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e94:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e96:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e98:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e9a:	8532                	mv	a0,a2
	mv a2, a4
    1e9c:	863a                	mv	a2,a4
	mv a3, a5
    1e9e:	86be                	mv	a3,a5
	mv a4, a6
    1ea0:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ea2:	0dc00893          	li	a7,220
	ecall
    1ea6:	00000073          	ecall

	beqz a0, 1f
    1eaa:	c111                	beqz	a0,1eae <__clone+0x1a>
	# Parent
	ret
    1eac:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1eae:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1eb0:	6522                	ld	a0,8(sp)
	jalr a1
    1eb2:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1eb4:	05d00893          	li	a7,93
	ecall
    1eb8:	00000073          	ecall
