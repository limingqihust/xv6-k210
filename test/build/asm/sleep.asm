
/home/lmq/Desktop/xv6-k210/test/build/riscv64/sleep:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0e5                	j	10ea <__start_main>

0000000000001004 <test_sleep>:
 * 测试通过时的输出：
 * "sleep success."
 * 测试失败时的输出：
 * "sleep error."
 */
void test_sleep() {
    1004:	1101                	addi	sp,sp,-32
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	eb250513          	addi	a0,a0,-334 # 1eb8 <__clone+0x2c>
void test_sleep() {
    100e:	ec06                	sd	ra,24(sp)
    1010:	e426                	sd	s1,8(sp)
    1012:	e822                	sd	s0,16(sp)
	TEST_START(__func__);
    1014:	2d4000ef          	jal	ra,12e8 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	f3850513          	addi	a0,a0,-200 # 1f50 <__func__.1165>
    1020:	2c8000ef          	jal	ra,12e8 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	eac50513          	addi	a0,a0,-340 # 1ed0 <__clone+0x44>
    102c:	2bc000ef          	jal	ra,12e8 <puts>

	int time1 = get_time();
    1030:	4b1000ef          	jal	ra,1ce0 <get_time>
	assert(time1 >= 0);
    1034:	02051793          	slli	a5,a0,0x20
	int time1 = get_time();
    1038:	0005049b          	sext.w	s1,a0
	assert(time1 >= 0);
    103c:	0807c863          	bltz	a5,10cc <test_sleep+0xc8>
	int ret = sleep(1);
    1040:	4505                	li	a0,1
    1042:	4e5000ef          	jal	ra,1d26 <sleep>
	assert(ret == 0);
    1046:	ed31                	bnez	a0,10a2 <test_sleep+0x9e>
	int time2 = get_time();
    1048:	499000ef          	jal	ra,1ce0 <get_time>
	assert(time2 >= 0);
    104c:	02051793          	slli	a5,a0,0x20
	int time2 = get_time();
    1050:	0005041b          	sext.w	s0,a0
	assert(time2 >= 0);
    1054:	0607c563          	bltz	a5,10be <test_sleep+0xba>

	if(time2 - time1 >= 1){	
    1058:	9c05                	subw	s0,s0,s1
    105a:	02805d63          	blez	s0,1094 <test_sleep+0x90>
		printf("sleep success.\n");
    105e:	00001517          	auipc	a0,0x1
    1062:	ea250513          	addi	a0,a0,-350 # 1f00 <__clone+0x74>
    1066:	2a4000ef          	jal	ra,130a <printf>
	}else{
		printf("sleep error.\n");
	}
	TEST_END(__func__);
    106a:	00001517          	auipc	a0,0x1
    106e:	eb650513          	addi	a0,a0,-330 # 1f20 <__clone+0x94>
    1072:	276000ef          	jal	ra,12e8 <puts>
    1076:	00001517          	auipc	a0,0x1
    107a:	eda50513          	addi	a0,a0,-294 # 1f50 <__func__.1165>
    107e:	26a000ef          	jal	ra,12e8 <puts>
}
    1082:	6442                	ld	s0,16(sp)
    1084:	60e2                	ld	ra,24(sp)
    1086:	64a2                	ld	s1,8(sp)
	TEST_END(__func__);
    1088:	00001517          	auipc	a0,0x1
    108c:	e4850513          	addi	a0,a0,-440 # 1ed0 <__clone+0x44>
}
    1090:	6105                	addi	sp,sp,32
	TEST_END(__func__);
    1092:	ac99                	j	12e8 <puts>
		printf("sleep error.\n");
    1094:	00001517          	auipc	a0,0x1
    1098:	e7c50513          	addi	a0,a0,-388 # 1f10 <__clone+0x84>
    109c:	26e000ef          	jal	ra,130a <printf>
    10a0:	b7e9                	j	106a <test_sleep+0x66>
	assert(ret == 0);
    10a2:	00001517          	auipc	a0,0x1
    10a6:	e3e50513          	addi	a0,a0,-450 # 1ee0 <__clone+0x54>
    10aa:	4e8000ef          	jal	ra,1592 <panic>
	int time2 = get_time();
    10ae:	433000ef          	jal	ra,1ce0 <get_time>
	assert(time2 >= 0);
    10b2:	02051793          	slli	a5,a0,0x20
	int time2 = get_time();
    10b6:	0005041b          	sext.w	s0,a0
	assert(time2 >= 0);
    10ba:	f807dfe3          	bgez	a5,1058 <test_sleep+0x54>
    10be:	00001517          	auipc	a0,0x1
    10c2:	e2250513          	addi	a0,a0,-478 # 1ee0 <__clone+0x54>
    10c6:	4cc000ef          	jal	ra,1592 <panic>
    10ca:	b779                	j	1058 <test_sleep+0x54>
	assert(time1 >= 0);
    10cc:	00001517          	auipc	a0,0x1
    10d0:	e1450513          	addi	a0,a0,-492 # 1ee0 <__clone+0x54>
    10d4:	4be000ef          	jal	ra,1592 <panic>
    10d8:	b7a5                	j	1040 <test_sleep+0x3c>

00000000000010da <main>:

int main(void) {
    10da:	1141                	addi	sp,sp,-16
    10dc:	e406                	sd	ra,8(sp)
	test_sleep();
    10de:	f27ff0ef          	jal	ra,1004 <test_sleep>
	return 0;
}
    10e2:	60a2                	ld	ra,8(sp)
    10e4:	4501                	li	a0,0
    10e6:	0141                	addi	sp,sp,16
    10e8:	8082                	ret

00000000000010ea <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ea:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10ec:	4108                	lw	a0,0(a0)
{
    10ee:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10f0:	05a1                	addi	a1,a1,8
{
    10f2:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10f4:	fe7ff0ef          	jal	ra,10da <main>
    10f8:	3ad000ef          	jal	ra,1ca4 <exit>
	return 0;
}
    10fc:	60a2                	ld	ra,8(sp)
    10fe:	4501                	li	a0,0
    1100:	0141                	addi	sp,sp,16
    1102:	8082                	ret

0000000000001104 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1104:	7179                	addi	sp,sp,-48
    1106:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1108:	12054b63          	bltz	a0,123e <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    110c:	02b577bb          	remuw	a5,a0,a1
    1110:	00001697          	auipc	a3,0x1
    1114:	e5068693          	addi	a3,a3,-432 # 1f60 <digits>
    buf[16] = 0;
    1118:	00010c23          	sb	zero,24(sp)
    i = 15;
    111c:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    1120:	1782                	slli	a5,a5,0x20
    1122:	9381                	srli	a5,a5,0x20
    1124:	97b6                	add	a5,a5,a3
    1126:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    112a:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    112e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1132:	16b56263          	bltu	a0,a1,1296 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1136:	02e8763b          	remuw	a2,a6,a4
    113a:	1602                	slli	a2,a2,0x20
    113c:	9201                	srli	a2,a2,0x20
    113e:	9636                	add	a2,a2,a3
    1140:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1144:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1148:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    114c:	12e86963          	bltu	a6,a4,127e <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    1150:	02e5f63b          	remuw	a2,a1,a4
    1154:	1602                	slli	a2,a2,0x20
    1156:	9201                	srli	a2,a2,0x20
    1158:	9636                	add	a2,a2,a3
    115a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115e:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1162:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1166:	10e5ef63          	bltu	a1,a4,1284 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    116a:	02e8763b          	remuw	a2,a6,a4
    116e:	1602                	slli	a2,a2,0x20
    1170:	9201                	srli	a2,a2,0x20
    1172:	9636                	add	a2,a2,a3
    1174:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1178:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    117c:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1180:	10e86563          	bltu	a6,a4,128a <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    1184:	02e5f63b          	remuw	a2,a1,a4
    1188:	1602                	slli	a2,a2,0x20
    118a:	9201                	srli	a2,a2,0x20
    118c:	9636                	add	a2,a2,a3
    118e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1192:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1196:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    119a:	0ee5eb63          	bltu	a1,a4,1290 <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    119e:	02e8763b          	remuw	a2,a6,a4
    11a2:	1602                	slli	a2,a2,0x20
    11a4:	9201                	srli	a2,a2,0x20
    11a6:	9636                	add	a2,a2,a3
    11a8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ac:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11b0:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11b4:	0ce86263          	bltu	a6,a4,1278 <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    11b8:	02e5f63b          	remuw	a2,a1,a4
    11bc:	1602                	slli	a2,a2,0x20
    11be:	9201                	srli	a2,a2,0x20
    11c0:	9636                	add	a2,a2,a3
    11c2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c6:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11ca:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11ce:	0ce5e663          	bltu	a1,a4,129a <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    11d2:	02e8763b          	remuw	a2,a6,a4
    11d6:	1602                	slli	a2,a2,0x20
    11d8:	9201                	srli	a2,a2,0x20
    11da:	9636                	add	a2,a2,a3
    11dc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11e0:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11e4:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11e8:	0ae86c63          	bltu	a6,a4,12a0 <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    11ec:	02e5f63b          	remuw	a2,a1,a4
    11f0:	1602                	slli	a2,a2,0x20
    11f2:	9201                	srli	a2,a2,0x20
    11f4:	9636                	add	a2,a2,a3
    11f6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11fa:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11fe:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1202:	0ae5e263          	bltu	a1,a4,12a6 <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    1206:	1782                	slli	a5,a5,0x20
    1208:	9381                	srli	a5,a5,0x20
    120a:	97b6                	add	a5,a5,a3
    120c:	0007c703          	lbu	a4,0(a5)
    1210:	4599                	li	a1,6
    1212:	4795                	li	a5,5
    1214:	00e10723          	sb	a4,14(sp)

    if (sign)
    1218:	00055963          	bgez	a0,122a <printint.constprop.0+0x126>
        buf[i--] = '-';
    121c:	1018                	addi	a4,sp,32
    121e:	973e                	add	a4,a4,a5
    1220:	02d00693          	li	a3,45
    1224:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    1228:	85be                	mv	a1,a5
    write(f, s, l);
    122a:	003c                	addi	a5,sp,8
    122c:	4641                	li	a2,16
    122e:	9e0d                	subw	a2,a2,a1
    1230:	4505                	li	a0,1
    1232:	95be                	add	a1,a1,a5
    1234:	221000ef          	jal	ra,1c54 <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1238:	70a2                	ld	ra,40(sp)
    123a:	6145                	addi	sp,sp,48
    123c:	8082                	ret
        x = -xx;
    123e:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1242:	02b677bb          	remuw	a5,a2,a1
    1246:	00001697          	auipc	a3,0x1
    124a:	d1a68693          	addi	a3,a3,-742 # 1f60 <digits>
    buf[16] = 0;
    124e:	00010c23          	sb	zero,24(sp)
    i = 15;
    1252:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    1256:	1782                	slli	a5,a5,0x20
    1258:	9381                	srli	a5,a5,0x20
    125a:	97b6                	add	a5,a5,a3
    125c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1260:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1264:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1268:	ecb677e3          	bgeu	a2,a1,1136 <printint.constprop.0+0x32>
        buf[i--] = '-';
    126c:	02d00793          	li	a5,45
    1270:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1274:	45b9                	li	a1,14
    1276:	bf55                	j	122a <printint.constprop.0+0x126>
    1278:	47a5                	li	a5,9
    127a:	45a9                	li	a1,10
    127c:	bf71                	j	1218 <printint.constprop.0+0x114>
    127e:	47b5                	li	a5,13
    1280:	45b9                	li	a1,14
    1282:	bf59                	j	1218 <printint.constprop.0+0x114>
    1284:	47b1                	li	a5,12
    1286:	45b5                	li	a1,13
    1288:	bf41                	j	1218 <printint.constprop.0+0x114>
    128a:	47ad                	li	a5,11
    128c:	45b1                	li	a1,12
    128e:	b769                	j	1218 <printint.constprop.0+0x114>
    1290:	47a9                	li	a5,10
    1292:	45ad                	li	a1,11
    1294:	b751                	j	1218 <printint.constprop.0+0x114>
    i = 15;
    1296:	45bd                	li	a1,15
    1298:	bf49                	j	122a <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    129a:	47a1                	li	a5,8
    129c:	45a5                	li	a1,9
    129e:	bfad                	j	1218 <printint.constprop.0+0x114>
    12a0:	479d                	li	a5,7
    12a2:	45a1                	li	a1,8
    12a4:	bf95                	j	1218 <printint.constprop.0+0x114>
    12a6:	4799                	li	a5,6
    12a8:	459d                	li	a1,7
    12aa:	b7bd                	j	1218 <printint.constprop.0+0x114>

00000000000012ac <getchar>:
{
    12ac:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12ae:	00f10593          	addi	a1,sp,15
    12b2:	4605                	li	a2,1
    12b4:	4501                	li	a0,0
{
    12b6:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12b8:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12bc:	18f000ef          	jal	ra,1c4a <read>
}
    12c0:	60e2                	ld	ra,24(sp)
    12c2:	00f14503          	lbu	a0,15(sp)
    12c6:	6105                	addi	sp,sp,32
    12c8:	8082                	ret

00000000000012ca <putchar>:
{
    12ca:	1101                	addi	sp,sp,-32
    12cc:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12ce:	00f10593          	addi	a1,sp,15
    12d2:	4605                	li	a2,1
    12d4:	4505                	li	a0,1
{
    12d6:	ec06                	sd	ra,24(sp)
    char byte = c;
    12d8:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12dc:	179000ef          	jal	ra,1c54 <write>
}
    12e0:	60e2                	ld	ra,24(sp)
    12e2:	2501                	sext.w	a0,a0
    12e4:	6105                	addi	sp,sp,32
    12e6:	8082                	ret

00000000000012e8 <puts>:
{
    12e8:	1141                	addi	sp,sp,-16
    12ea:	e406                	sd	ra,8(sp)
    12ec:	e022                	sd	s0,0(sp)
    12ee:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12f0:	580000ef          	jal	ra,1870 <strlen>
    12f4:	862a                	mv	a2,a0
    12f6:	85a2                	mv	a1,s0
    12f8:	4505                	li	a0,1
    12fa:	15b000ef          	jal	ra,1c54 <write>
}
    12fe:	60a2                	ld	ra,8(sp)
    1300:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1302:	957d                	srai	a0,a0,0x3f
    return r;
    1304:	2501                	sext.w	a0,a0
}
    1306:	0141                	addi	sp,sp,16
    1308:	8082                	ret

000000000000130a <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    130a:	7171                	addi	sp,sp,-176
    130c:	fc56                	sd	s5,56(sp)
    130e:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1310:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1312:	18bc                	addi	a5,sp,120
{
    1314:	e8ca                	sd	s2,80(sp)
    1316:	e4ce                	sd	s3,72(sp)
    1318:	e0d2                	sd	s4,64(sp)
    131a:	f85a                	sd	s6,48(sp)
    131c:	f486                	sd	ra,104(sp)
    131e:	f0a2                	sd	s0,96(sp)
    1320:	eca6                	sd	s1,88(sp)
    1322:	fcae                	sd	a1,120(sp)
    1324:	e132                	sd	a2,128(sp)
    1326:	e536                	sd	a3,136(sp)
    1328:	e93a                	sd	a4,144(sp)
    132a:	f142                	sd	a6,160(sp)
    132c:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    132e:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1330:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1334:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1338:	00001b17          	auipc	s6,0x1
    133c:	bf8b0b13          	addi	s6,s6,-1032 # 1f30 <__clone+0xa4>
    buf[i++] = '0';
    1340:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1344:	00001997          	auipc	s3,0x1
    1348:	c1c98993          	addi	s3,s3,-996 # 1f60 <digits>
        if (!*s)
    134c:	00054783          	lbu	a5,0(a0)
    1350:	16078a63          	beqz	a5,14c4 <printf+0x1ba>
    1354:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1356:	19278163          	beq	a5,s2,14d8 <printf+0x1ce>
    135a:	00164783          	lbu	a5,1(a2)
    135e:	0605                	addi	a2,a2,1
    1360:	fbfd                	bnez	a5,1356 <printf+0x4c>
    1362:	84b2                	mv	s1,a2
        l = z - a;
    1364:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1368:	85aa                	mv	a1,a0
    136a:	8622                	mv	a2,s0
    136c:	4505                	li	a0,1
    136e:	0e7000ef          	jal	ra,1c54 <write>
        if (l)
    1372:	18041c63          	bnez	s0,150a <printf+0x200>
        if (s[1] == 0)
    1376:	0014c783          	lbu	a5,1(s1)
    137a:	14078563          	beqz	a5,14c4 <printf+0x1ba>
        switch (s[1])
    137e:	1d478063          	beq	a5,s4,153e <printf+0x234>
    1382:	18fa6663          	bltu	s4,a5,150e <printf+0x204>
    1386:	06400713          	li	a4,100
    138a:	1ae78063          	beq	a5,a4,152a <printf+0x220>
    138e:	07000713          	li	a4,112
    1392:	1ce79963          	bne	a5,a4,1564 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    1396:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1398:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    139c:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    139e:	631c                	ld	a5,0(a4)
    13a0:	0721                	addi	a4,a4,8
    13a2:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13a4:	00479293          	slli	t0,a5,0x4
    13a8:	00879f93          	slli	t6,a5,0x8
    13ac:	00c79f13          	slli	t5,a5,0xc
    13b0:	01079e93          	slli	t4,a5,0x10
    13b4:	01479e13          	slli	t3,a5,0x14
    13b8:	01879313          	slli	t1,a5,0x18
    13bc:	01c79893          	slli	a7,a5,0x1c
    13c0:	02479813          	slli	a6,a5,0x24
    13c4:	02879513          	slli	a0,a5,0x28
    13c8:	02c79593          	slli	a1,a5,0x2c
    13cc:	03079693          	slli	a3,a5,0x30
    13d0:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13d4:	03c7d413          	srli	s0,a5,0x3c
    13d8:	01c7d39b          	srliw	t2,a5,0x1c
    13dc:	03c2d293          	srli	t0,t0,0x3c
    13e0:	03cfdf93          	srli	t6,t6,0x3c
    13e4:	03cf5f13          	srli	t5,t5,0x3c
    13e8:	03cede93          	srli	t4,t4,0x3c
    13ec:	03ce5e13          	srli	t3,t3,0x3c
    13f0:	03c35313          	srli	t1,t1,0x3c
    13f4:	03c8d893          	srli	a7,a7,0x3c
    13f8:	03c85813          	srli	a6,a6,0x3c
    13fc:	9171                	srli	a0,a0,0x3c
    13fe:	91f1                	srli	a1,a1,0x3c
    1400:	92f1                	srli	a3,a3,0x3c
    1402:	9371                	srli	a4,a4,0x3c
    1404:	96ce                	add	a3,a3,s3
    1406:	974e                	add	a4,a4,s3
    1408:	944e                	add	s0,s0,s3
    140a:	92ce                	add	t0,t0,s3
    140c:	9fce                	add	t6,t6,s3
    140e:	9f4e                	add	t5,t5,s3
    1410:	9ece                	add	t4,t4,s3
    1412:	9e4e                	add	t3,t3,s3
    1414:	934e                	add	t1,t1,s3
    1416:	98ce                	add	a7,a7,s3
    1418:	93ce                	add	t2,t2,s3
    141a:	984e                	add	a6,a6,s3
    141c:	954e                	add	a0,a0,s3
    141e:	95ce                	add	a1,a1,s3
    1420:	0006c083          	lbu	ra,0(a3)
    1424:	0002c283          	lbu	t0,0(t0)
    1428:	00074683          	lbu	a3,0(a4)
    142c:	000fcf83          	lbu	t6,0(t6)
    1430:	000f4f03          	lbu	t5,0(t5)
    1434:	000ece83          	lbu	t4,0(t4)
    1438:	000e4e03          	lbu	t3,0(t3)
    143c:	00034303          	lbu	t1,0(t1)
    1440:	0008c883          	lbu	a7,0(a7)
    1444:	0003c383          	lbu	t2,0(t2)
    1448:	00084803          	lbu	a6,0(a6)
    144c:	00054503          	lbu	a0,0(a0)
    1450:	0005c583          	lbu	a1,0(a1)
    1454:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1458:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    145c:	9371                	srli	a4,a4,0x3c
    145e:	8bbd                	andi	a5,a5,15
    1460:	974e                	add	a4,a4,s3
    1462:	97ce                	add	a5,a5,s3
    1464:	005105a3          	sb	t0,11(sp)
    1468:	01f10623          	sb	t6,12(sp)
    146c:	01e106a3          	sb	t5,13(sp)
    1470:	01d10723          	sb	t4,14(sp)
    1474:	01c107a3          	sb	t3,15(sp)
    1478:	00610823          	sb	t1,16(sp)
    147c:	011108a3          	sb	a7,17(sp)
    1480:	00710923          	sb	t2,18(sp)
    1484:	010109a3          	sb	a6,19(sp)
    1488:	00a10a23          	sb	a0,20(sp)
    148c:	00b10aa3          	sb	a1,21(sp)
    1490:	00110b23          	sb	ra,22(sp)
    1494:	00d10ba3          	sb	a3,23(sp)
    1498:	00810523          	sb	s0,10(sp)
    149c:	00074703          	lbu	a4,0(a4)
    14a0:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14a4:	002c                	addi	a1,sp,8
    14a6:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14a8:	00e10c23          	sb	a4,24(sp)
    14ac:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14b0:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14b4:	7a0000ef          	jal	ra,1c54 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14b8:	00248513          	addi	a0,s1,2
        if (!*s)
    14bc:	00054783          	lbu	a5,0(a0)
    14c0:	e8079ae3          	bnez	a5,1354 <printf+0x4a>
    }
    va_end(ap);
}
    14c4:	70a6                	ld	ra,104(sp)
    14c6:	7406                	ld	s0,96(sp)
    14c8:	64e6                	ld	s1,88(sp)
    14ca:	6946                	ld	s2,80(sp)
    14cc:	69a6                	ld	s3,72(sp)
    14ce:	6a06                	ld	s4,64(sp)
    14d0:	7ae2                	ld	s5,56(sp)
    14d2:	7b42                	ld	s6,48(sp)
    14d4:	614d                	addi	sp,sp,176
    14d6:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14d8:	00064783          	lbu	a5,0(a2)
    14dc:	84b2                	mv	s1,a2
    14de:	01278963          	beq	a5,s2,14f0 <printf+0x1e6>
    14e2:	b549                	j	1364 <printf+0x5a>
    14e4:	0024c783          	lbu	a5,2(s1)
    14e8:	0605                	addi	a2,a2,1
    14ea:	0489                	addi	s1,s1,2
    14ec:	e7279ce3          	bne	a5,s2,1364 <printf+0x5a>
    14f0:	0014c783          	lbu	a5,1(s1)
    14f4:	ff2788e3          	beq	a5,s2,14e4 <printf+0x1da>
        l = z - a;
    14f8:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14fc:	85aa                	mv	a1,a0
    14fe:	8622                	mv	a2,s0
    1500:	4505                	li	a0,1
    1502:	752000ef          	jal	ra,1c54 <write>
        if (l)
    1506:	e60408e3          	beqz	s0,1376 <printf+0x6c>
    150a:	8526                	mv	a0,s1
    150c:	b581                	j	134c <printf+0x42>
        switch (s[1])
    150e:	07800713          	li	a4,120
    1512:	04e79963          	bne	a5,a4,1564 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    1516:	6782                	ld	a5,0(sp)
    1518:	45c1                	li	a1,16
    151a:	4388                	lw	a0,0(a5)
    151c:	07a1                	addi	a5,a5,8
    151e:	e03e                	sd	a5,0(sp)
    1520:	be5ff0ef          	jal	ra,1104 <printint.constprop.0>
        s += 2;
    1524:	00248513          	addi	a0,s1,2
    1528:	bf51                	j	14bc <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    152a:	6782                	ld	a5,0(sp)
    152c:	45a9                	li	a1,10
    152e:	4388                	lw	a0,0(a5)
    1530:	07a1                	addi	a5,a5,8
    1532:	e03e                	sd	a5,0(sp)
    1534:	bd1ff0ef          	jal	ra,1104 <printint.constprop.0>
        s += 2;
    1538:	00248513          	addi	a0,s1,2
    153c:	b741                	j	14bc <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    153e:	6782                	ld	a5,0(sp)
    1540:	6380                	ld	s0,0(a5)
    1542:	07a1                	addi	a5,a5,8
    1544:	e03e                	sd	a5,0(sp)
    1546:	c421                	beqz	s0,158e <printf+0x284>
            l = strnlen(a, 200);
    1548:	0c800593          	li	a1,200
    154c:	8522                	mv	a0,s0
    154e:	40e000ef          	jal	ra,195c <strnlen>
    write(f, s, l);
    1552:	0005061b          	sext.w	a2,a0
    1556:	85a2                	mv	a1,s0
    1558:	4505                	li	a0,1
    155a:	6fa000ef          	jal	ra,1c54 <write>
        s += 2;
    155e:	00248513          	addi	a0,s1,2
    1562:	bfa9                	j	14bc <printf+0x1b2>
    char byte = c;
    1564:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1568:	4605                	li	a2,1
    156a:	002c                	addi	a1,sp,8
    156c:	4505                	li	a0,1
    char byte = c;
    156e:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1572:	6e2000ef          	jal	ra,1c54 <write>
    char byte = c;
    1576:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    157a:	4605                	li	a2,1
    157c:	002c                	addi	a1,sp,8
    157e:	4505                	li	a0,1
    char byte = c;
    1580:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1584:	6d0000ef          	jal	ra,1c54 <write>
        s += 2;
    1588:	00248513          	addi	a0,s1,2
    158c:	bf05                	j	14bc <printf+0x1b2>
                a = "(null)";
    158e:	845a                	mv	s0,s6
    1590:	bf65                	j	1548 <printf+0x23e>

0000000000001592 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1592:	1141                	addi	sp,sp,-16
    1594:	e406                	sd	ra,8(sp)
    puts(m);
    1596:	d53ff0ef          	jal	ra,12e8 <puts>
    exit(-100);
}
    159a:	60a2                	ld	ra,8(sp)
    exit(-100);
    159c:	f9c00513          	li	a0,-100
}
    15a0:	0141                	addi	sp,sp,16
    exit(-100);
    15a2:	a709                	j	1ca4 <exit>

00000000000015a4 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a4:	02000793          	li	a5,32
    15a8:	00f50663          	beq	a0,a5,15b4 <isspace+0x10>
    15ac:	355d                	addiw	a0,a0,-9
    15ae:	00553513          	sltiu	a0,a0,5
    15b2:	8082                	ret
    15b4:	4505                	li	a0,1
}
    15b6:	8082                	ret

00000000000015b8 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15b8:	fd05051b          	addiw	a0,a0,-48
}
    15bc:	00a53513          	sltiu	a0,a0,10
    15c0:	8082                	ret

00000000000015c2 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c2:	02000613          	li	a2,32
    15c6:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15c8:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15cc:	ff77069b          	addiw	a3,a4,-9
    15d0:	04c70d63          	beq	a4,a2,162a <atoi+0x68>
    15d4:	0007079b          	sext.w	a5,a4
    15d8:	04d5f963          	bgeu	a1,a3,162a <atoi+0x68>
        s++;
    switch (*s)
    15dc:	02b00693          	li	a3,43
    15e0:	04d70a63          	beq	a4,a3,1634 <atoi+0x72>
    15e4:	02d00693          	li	a3,45
    15e8:	06d70463          	beq	a4,a3,1650 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15ec:	fd07859b          	addiw	a1,a5,-48
    15f0:	4625                	li	a2,9
    15f2:	873e                	mv	a4,a5
    15f4:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15f6:	4e01                	li	t3,0
    while (isdigit(*s))
    15f8:	04b66a63          	bltu	a2,a1,164c <atoi+0x8a>
    int n = 0, neg = 0;
    15fc:	4501                	li	a0,0
    while (isdigit(*s))
    15fe:	4825                	li	a6,9
    1600:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1604:	0025179b          	slliw	a5,a0,0x2
    1608:	9d3d                	addw	a0,a0,a5
    160a:	fd07031b          	addiw	t1,a4,-48
    160e:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1612:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1616:	0685                	addi	a3,a3,1
    1618:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    161c:	0006071b          	sext.w	a4,a2
    1620:	feb870e3          	bgeu	a6,a1,1600 <atoi+0x3e>
    return neg ? n : -n;
    1624:	000e0563          	beqz	t3,162e <atoi+0x6c>
}
    1628:	8082                	ret
        s++;
    162a:	0505                	addi	a0,a0,1
    162c:	bf71                	j	15c8 <atoi+0x6>
    162e:	4113053b          	subw	a0,t1,a7
    1632:	8082                	ret
    while (isdigit(*s))
    1634:	00154783          	lbu	a5,1(a0)
    1638:	4625                	li	a2,9
        s++;
    163a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    163e:	fd07859b          	addiw	a1,a5,-48
    1642:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1646:	4e01                	li	t3,0
    while (isdigit(*s))
    1648:	fab67ae3          	bgeu	a2,a1,15fc <atoi+0x3a>
    164c:	4501                	li	a0,0
}
    164e:	8082                	ret
    while (isdigit(*s))
    1650:	00154783          	lbu	a5,1(a0)
    1654:	4625                	li	a2,9
        s++;
    1656:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    165a:	fd07859b          	addiw	a1,a5,-48
    165e:	0007871b          	sext.w	a4,a5
    1662:	feb665e3          	bltu	a2,a1,164c <atoi+0x8a>
        neg = 1;
    1666:	4e05                	li	t3,1
    1668:	bf51                	j	15fc <atoi+0x3a>

000000000000166a <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    166a:	16060d63          	beqz	a2,17e4 <memset+0x17a>
    166e:	40a007b3          	neg	a5,a0
    1672:	8b9d                	andi	a5,a5,7
    1674:	00778713          	addi	a4,a5,7
    1678:	482d                	li	a6,11
    167a:	0ff5f593          	andi	a1,a1,255
    167e:	fff60693          	addi	a3,a2,-1
    1682:	17076263          	bltu	a4,a6,17e6 <memset+0x17c>
    1686:	16e6ea63          	bltu	a3,a4,17fa <memset+0x190>
    168a:	16078563          	beqz	a5,17f4 <memset+0x18a>
    168e:	00b50023          	sb	a1,0(a0)
    1692:	4705                	li	a4,1
    1694:	00150e93          	addi	t4,a0,1
    1698:	14e78c63          	beq	a5,a4,17f0 <memset+0x186>
    169c:	00b500a3          	sb	a1,1(a0)
    16a0:	4709                	li	a4,2
    16a2:	00250e93          	addi	t4,a0,2
    16a6:	14e78d63          	beq	a5,a4,1800 <memset+0x196>
    16aa:	00b50123          	sb	a1,2(a0)
    16ae:	470d                	li	a4,3
    16b0:	00350e93          	addi	t4,a0,3
    16b4:	12e78b63          	beq	a5,a4,17ea <memset+0x180>
    16b8:	00b501a3          	sb	a1,3(a0)
    16bc:	4711                	li	a4,4
    16be:	00450e93          	addi	t4,a0,4
    16c2:	14e78163          	beq	a5,a4,1804 <memset+0x19a>
    16c6:	00b50223          	sb	a1,4(a0)
    16ca:	4715                	li	a4,5
    16cc:	00550e93          	addi	t4,a0,5
    16d0:	12e78c63          	beq	a5,a4,1808 <memset+0x19e>
    16d4:	00b502a3          	sb	a1,5(a0)
    16d8:	471d                	li	a4,7
    16da:	00650e93          	addi	t4,a0,6
    16de:	12e79763          	bne	a5,a4,180c <memset+0x1a2>
    16e2:	00750e93          	addi	t4,a0,7
    16e6:	00b50323          	sb	a1,6(a0)
    16ea:	4f1d                	li	t5,7
    16ec:	00859713          	slli	a4,a1,0x8
    16f0:	8f4d                	or	a4,a4,a1
    16f2:	01059e13          	slli	t3,a1,0x10
    16f6:	01c76e33          	or	t3,a4,t3
    16fa:	01859313          	slli	t1,a1,0x18
    16fe:	006e6333          	or	t1,t3,t1
    1702:	02059893          	slli	a7,a1,0x20
    1706:	011368b3          	or	a7,t1,a7
    170a:	02859813          	slli	a6,a1,0x28
    170e:	40f60333          	sub	t1,a2,a5
    1712:	0108e833          	or	a6,a7,a6
    1716:	03059693          	slli	a3,a1,0x30
    171a:	00d866b3          	or	a3,a6,a3
    171e:	03859713          	slli	a4,a1,0x38
    1722:	97aa                	add	a5,a5,a0
    1724:	ff837813          	andi	a6,t1,-8
    1728:	8f55                	or	a4,a4,a3
    172a:	00f806b3          	add	a3,a6,a5
    172e:	e398                	sd	a4,0(a5)
    1730:	07a1                	addi	a5,a5,8
    1732:	fed79ee3          	bne	a5,a3,172e <memset+0xc4>
    1736:	ff837693          	andi	a3,t1,-8
    173a:	00de87b3          	add	a5,t4,a3
    173e:	01e6873b          	addw	a4,a3,t5
    1742:	0ad30663          	beq	t1,a3,17ee <memset+0x184>
    1746:	00b78023          	sb	a1,0(a5)
    174a:	0017069b          	addiw	a3,a4,1
    174e:	08c6fb63          	bgeu	a3,a2,17e4 <memset+0x17a>
    1752:	00b780a3          	sb	a1,1(a5)
    1756:	0027069b          	addiw	a3,a4,2
    175a:	08c6f563          	bgeu	a3,a2,17e4 <memset+0x17a>
    175e:	00b78123          	sb	a1,2(a5)
    1762:	0037069b          	addiw	a3,a4,3
    1766:	06c6ff63          	bgeu	a3,a2,17e4 <memset+0x17a>
    176a:	00b781a3          	sb	a1,3(a5)
    176e:	0047069b          	addiw	a3,a4,4
    1772:	06c6f963          	bgeu	a3,a2,17e4 <memset+0x17a>
    1776:	00b78223          	sb	a1,4(a5)
    177a:	0057069b          	addiw	a3,a4,5
    177e:	06c6f363          	bgeu	a3,a2,17e4 <memset+0x17a>
    1782:	00b782a3          	sb	a1,5(a5)
    1786:	0067069b          	addiw	a3,a4,6
    178a:	04c6fd63          	bgeu	a3,a2,17e4 <memset+0x17a>
    178e:	00b78323          	sb	a1,6(a5)
    1792:	0077069b          	addiw	a3,a4,7
    1796:	04c6f763          	bgeu	a3,a2,17e4 <memset+0x17a>
    179a:	00b783a3          	sb	a1,7(a5)
    179e:	0087069b          	addiw	a3,a4,8
    17a2:	04c6f163          	bgeu	a3,a2,17e4 <memset+0x17a>
    17a6:	00b78423          	sb	a1,8(a5)
    17aa:	0097069b          	addiw	a3,a4,9
    17ae:	02c6fb63          	bgeu	a3,a2,17e4 <memset+0x17a>
    17b2:	00b784a3          	sb	a1,9(a5)
    17b6:	00a7069b          	addiw	a3,a4,10
    17ba:	02c6f563          	bgeu	a3,a2,17e4 <memset+0x17a>
    17be:	00b78523          	sb	a1,10(a5)
    17c2:	00b7069b          	addiw	a3,a4,11
    17c6:	00c6ff63          	bgeu	a3,a2,17e4 <memset+0x17a>
    17ca:	00b785a3          	sb	a1,11(a5)
    17ce:	00c7069b          	addiw	a3,a4,12
    17d2:	00c6f963          	bgeu	a3,a2,17e4 <memset+0x17a>
    17d6:	00b78623          	sb	a1,12(a5)
    17da:	2735                	addiw	a4,a4,13
    17dc:	00c77463          	bgeu	a4,a2,17e4 <memset+0x17a>
    17e0:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17e4:	8082                	ret
    17e6:	472d                	li	a4,11
    17e8:	bd79                	j	1686 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ea:	4f0d                	li	t5,3
    17ec:	b701                	j	16ec <memset+0x82>
    17ee:	8082                	ret
    17f0:	4f05                	li	t5,1
    17f2:	bded                	j	16ec <memset+0x82>
    17f4:	8eaa                	mv	t4,a0
    17f6:	4f01                	li	t5,0
    17f8:	bdd5                	j	16ec <memset+0x82>
    17fa:	87aa                	mv	a5,a0
    17fc:	4701                	li	a4,0
    17fe:	b7a1                	j	1746 <memset+0xdc>
    1800:	4f09                	li	t5,2
    1802:	b5ed                	j	16ec <memset+0x82>
    1804:	4f11                	li	t5,4
    1806:	b5dd                	j	16ec <memset+0x82>
    1808:	4f15                	li	t5,5
    180a:	b5cd                	j	16ec <memset+0x82>
    180c:	4f19                	li	t5,6
    180e:	bdf9                	j	16ec <memset+0x82>

0000000000001810 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1810:	00054783          	lbu	a5,0(a0)
    1814:	0005c703          	lbu	a4,0(a1)
    1818:	00e79863          	bne	a5,a4,1828 <strcmp+0x18>
    181c:	0505                	addi	a0,a0,1
    181e:	0585                	addi	a1,a1,1
    1820:	fbe5                	bnez	a5,1810 <strcmp>
    1822:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1824:	9d19                	subw	a0,a0,a4
    1826:	8082                	ret
    1828:	0007851b          	sext.w	a0,a5
    182c:	bfe5                	j	1824 <strcmp+0x14>

000000000000182e <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    182e:	ce05                	beqz	a2,1866 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1830:	00054703          	lbu	a4,0(a0)
    1834:	0005c783          	lbu	a5,0(a1)
    1838:	cb0d                	beqz	a4,186a <strncmp+0x3c>
    if (!n--)
    183a:	167d                	addi	a2,a2,-1
    183c:	00c506b3          	add	a3,a0,a2
    1840:	a819                	j	1856 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1842:	00a68e63          	beq	a3,a0,185e <strncmp+0x30>
    1846:	0505                	addi	a0,a0,1
    1848:	00e79b63          	bne	a5,a4,185e <strncmp+0x30>
    184c:	00054703          	lbu	a4,0(a0)
    1850:	0005c783          	lbu	a5,0(a1)
    1854:	cb19                	beqz	a4,186a <strncmp+0x3c>
    1856:	0005c783          	lbu	a5,0(a1)
    185a:	0585                	addi	a1,a1,1
    185c:	f3fd                	bnez	a5,1842 <strncmp+0x14>
        ;
    return *l - *r;
    185e:	0007051b          	sext.w	a0,a4
    1862:	9d1d                	subw	a0,a0,a5
    1864:	8082                	ret
        return 0;
    1866:	4501                	li	a0,0
}
    1868:	8082                	ret
    186a:	4501                	li	a0,0
    return *l - *r;
    186c:	9d1d                	subw	a0,a0,a5
    186e:	8082                	ret

0000000000001870 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1870:	00757793          	andi	a5,a0,7
    1874:	cf89                	beqz	a5,188e <strlen+0x1e>
    1876:	87aa                	mv	a5,a0
    1878:	a029                	j	1882 <strlen+0x12>
    187a:	0785                	addi	a5,a5,1
    187c:	0077f713          	andi	a4,a5,7
    1880:	cb01                	beqz	a4,1890 <strlen+0x20>
        if (!*s)
    1882:	0007c703          	lbu	a4,0(a5)
    1886:	fb75                	bnez	a4,187a <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1888:	40a78533          	sub	a0,a5,a0
}
    188c:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    188e:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1890:	6394                	ld	a3,0(a5)
    1892:	00000597          	auipc	a1,0x0
    1896:	6a65b583          	ld	a1,1702(a1) # 1f38 <__clone+0xac>
    189a:	00000617          	auipc	a2,0x0
    189e:	6a663603          	ld	a2,1702(a2) # 1f40 <__clone+0xb4>
    18a2:	a019                	j	18a8 <strlen+0x38>
    18a4:	6794                	ld	a3,8(a5)
    18a6:	07a1                	addi	a5,a5,8
    18a8:	00b68733          	add	a4,a3,a1
    18ac:	fff6c693          	not	a3,a3
    18b0:	8f75                	and	a4,a4,a3
    18b2:	8f71                	and	a4,a4,a2
    18b4:	db65                	beqz	a4,18a4 <strlen+0x34>
    for (; *s; s++)
    18b6:	0007c703          	lbu	a4,0(a5)
    18ba:	d779                	beqz	a4,1888 <strlen+0x18>
    18bc:	0017c703          	lbu	a4,1(a5)
    18c0:	0785                	addi	a5,a5,1
    18c2:	d379                	beqz	a4,1888 <strlen+0x18>
    18c4:	0017c703          	lbu	a4,1(a5)
    18c8:	0785                	addi	a5,a5,1
    18ca:	fb6d                	bnez	a4,18bc <strlen+0x4c>
    18cc:	bf75                	j	1888 <strlen+0x18>

00000000000018ce <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ce:	00757713          	andi	a4,a0,7
{
    18d2:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18d4:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18d8:	cb19                	beqz	a4,18ee <memchr+0x20>
    18da:	ce25                	beqz	a2,1952 <memchr+0x84>
    18dc:	0007c703          	lbu	a4,0(a5)
    18e0:	04b70e63          	beq	a4,a1,193c <memchr+0x6e>
    18e4:	0785                	addi	a5,a5,1
    18e6:	0077f713          	andi	a4,a5,7
    18ea:	167d                	addi	a2,a2,-1
    18ec:	f77d                	bnez	a4,18da <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18ee:	4501                	li	a0,0
    if (n && *s != c)
    18f0:	c235                	beqz	a2,1954 <memchr+0x86>
    18f2:	0007c703          	lbu	a4,0(a5)
    18f6:	04b70363          	beq	a4,a1,193c <memchr+0x6e>
        size_t k = ONES * c;
    18fa:	00000517          	auipc	a0,0x0
    18fe:	64e53503          	ld	a0,1614(a0) # 1f48 <__clone+0xbc>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1902:	471d                	li	a4,7
        size_t k = ONES * c;
    1904:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1908:	02c77a63          	bgeu	a4,a2,193c <memchr+0x6e>
    190c:	00000897          	auipc	a7,0x0
    1910:	62c8b883          	ld	a7,1580(a7) # 1f38 <__clone+0xac>
    1914:	00000817          	auipc	a6,0x0
    1918:	62c83803          	ld	a6,1580(a6) # 1f40 <__clone+0xb4>
    191c:	431d                	li	t1,7
    191e:	a029                	j	1928 <memchr+0x5a>
    1920:	1661                	addi	a2,a2,-8
    1922:	07a1                	addi	a5,a5,8
    1924:	02c37963          	bgeu	t1,a2,1956 <memchr+0x88>
    1928:	6398                	ld	a4,0(a5)
    192a:	8f29                	xor	a4,a4,a0
    192c:	011706b3          	add	a3,a4,a7
    1930:	fff74713          	not	a4,a4
    1934:	8f75                	and	a4,a4,a3
    1936:	01077733          	and	a4,a4,a6
    193a:	d37d                	beqz	a4,1920 <memchr+0x52>
    193c:	853e                	mv	a0,a5
    193e:	97b2                	add	a5,a5,a2
    1940:	a021                	j	1948 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1942:	0505                	addi	a0,a0,1
    1944:	00f50763          	beq	a0,a5,1952 <memchr+0x84>
    1948:	00054703          	lbu	a4,0(a0)
    194c:	feb71be3          	bne	a4,a1,1942 <memchr+0x74>
    1950:	8082                	ret
    return n ? (void *)s : 0;
    1952:	4501                	li	a0,0
}
    1954:	8082                	ret
    return n ? (void *)s : 0;
    1956:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1958:	f275                	bnez	a2,193c <memchr+0x6e>
}
    195a:	8082                	ret

000000000000195c <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    195c:	1101                	addi	sp,sp,-32
    195e:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1960:	862e                	mv	a2,a1
{
    1962:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1964:	4581                	li	a1,0
{
    1966:	e426                	sd	s1,8(sp)
    1968:	ec06                	sd	ra,24(sp)
    196a:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    196c:	f63ff0ef          	jal	ra,18ce <memchr>
    return p ? p - s : n;
    1970:	c519                	beqz	a0,197e <strnlen+0x22>
}
    1972:	60e2                	ld	ra,24(sp)
    1974:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1976:	8d05                	sub	a0,a0,s1
}
    1978:	64a2                	ld	s1,8(sp)
    197a:	6105                	addi	sp,sp,32
    197c:	8082                	ret
    197e:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1980:	8522                	mv	a0,s0
}
    1982:	6442                	ld	s0,16(sp)
    1984:	64a2                	ld	s1,8(sp)
    1986:	6105                	addi	sp,sp,32
    1988:	8082                	ret

000000000000198a <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    198a:	00b547b3          	xor	a5,a0,a1
    198e:	8b9d                	andi	a5,a5,7
    1990:	eb95                	bnez	a5,19c4 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1992:	0075f793          	andi	a5,a1,7
    1996:	e7b1                	bnez	a5,19e2 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1998:	6198                	ld	a4,0(a1)
    199a:	00000617          	auipc	a2,0x0
    199e:	59e63603          	ld	a2,1438(a2) # 1f38 <__clone+0xac>
    19a2:	00000817          	auipc	a6,0x0
    19a6:	59e83803          	ld	a6,1438(a6) # 1f40 <__clone+0xb4>
    19aa:	a029                	j	19b4 <strcpy+0x2a>
    19ac:	e118                	sd	a4,0(a0)
    19ae:	6598                	ld	a4,8(a1)
    19b0:	05a1                	addi	a1,a1,8
    19b2:	0521                	addi	a0,a0,8
    19b4:	00c707b3          	add	a5,a4,a2
    19b8:	fff74693          	not	a3,a4
    19bc:	8ff5                	and	a5,a5,a3
    19be:	0107f7b3          	and	a5,a5,a6
    19c2:	d7ed                	beqz	a5,19ac <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19c4:	0005c783          	lbu	a5,0(a1)
    19c8:	00f50023          	sb	a5,0(a0)
    19cc:	c785                	beqz	a5,19f4 <strcpy+0x6a>
    19ce:	0015c783          	lbu	a5,1(a1)
    19d2:	0505                	addi	a0,a0,1
    19d4:	0585                	addi	a1,a1,1
    19d6:	00f50023          	sb	a5,0(a0)
    19da:	fbf5                	bnez	a5,19ce <strcpy+0x44>
        ;
    return d;
}
    19dc:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19de:	0505                	addi	a0,a0,1
    19e0:	df45                	beqz	a4,1998 <strcpy+0xe>
            if (!(*d = *s))
    19e2:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19e6:	0585                	addi	a1,a1,1
    19e8:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    19ec:	00f50023          	sb	a5,0(a0)
    19f0:	f7fd                	bnez	a5,19de <strcpy+0x54>
}
    19f2:	8082                	ret
    19f4:	8082                	ret

00000000000019f6 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19f6:	00b547b3          	xor	a5,a0,a1
    19fa:	8b9d                	andi	a5,a5,7
    19fc:	1a079863          	bnez	a5,1bac <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a00:	0075f793          	andi	a5,a1,7
    1a04:	16078463          	beqz	a5,1b6c <strncpy+0x176>
    1a08:	ea01                	bnez	a2,1a18 <strncpy+0x22>
    1a0a:	a421                	j	1c12 <strncpy+0x21c>
    1a0c:	167d                	addi	a2,a2,-1
    1a0e:	0505                	addi	a0,a0,1
    1a10:	14070e63          	beqz	a4,1b6c <strncpy+0x176>
    1a14:	1a060863          	beqz	a2,1bc4 <strncpy+0x1ce>
    1a18:	0005c783          	lbu	a5,0(a1)
    1a1c:	0585                	addi	a1,a1,1
    1a1e:	0075f713          	andi	a4,a1,7
    1a22:	00f50023          	sb	a5,0(a0)
    1a26:	f3fd                	bnez	a5,1a0c <strncpy+0x16>
    1a28:	4805                	li	a6,1
    1a2a:	1a061863          	bnez	a2,1bda <strncpy+0x1e4>
    1a2e:	40a007b3          	neg	a5,a0
    1a32:	8b9d                	andi	a5,a5,7
    1a34:	4681                	li	a3,0
    1a36:	18061a63          	bnez	a2,1bca <strncpy+0x1d4>
    1a3a:	00778713          	addi	a4,a5,7
    1a3e:	45ad                	li	a1,11
    1a40:	18b76363          	bltu	a4,a1,1bc6 <strncpy+0x1d0>
    1a44:	1ae6eb63          	bltu	a3,a4,1bfa <strncpy+0x204>
    1a48:	1a078363          	beqz	a5,1bee <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a4c:	00050023          	sb	zero,0(a0)
    1a50:	4685                	li	a3,1
    1a52:	00150713          	addi	a4,a0,1
    1a56:	18d78f63          	beq	a5,a3,1bf4 <strncpy+0x1fe>
    1a5a:	000500a3          	sb	zero,1(a0)
    1a5e:	4689                	li	a3,2
    1a60:	00250713          	addi	a4,a0,2
    1a64:	18d78e63          	beq	a5,a3,1c00 <strncpy+0x20a>
    1a68:	00050123          	sb	zero,2(a0)
    1a6c:	468d                	li	a3,3
    1a6e:	00350713          	addi	a4,a0,3
    1a72:	16d78c63          	beq	a5,a3,1bea <strncpy+0x1f4>
    1a76:	000501a3          	sb	zero,3(a0)
    1a7a:	4691                	li	a3,4
    1a7c:	00450713          	addi	a4,a0,4
    1a80:	18d78263          	beq	a5,a3,1c04 <strncpy+0x20e>
    1a84:	00050223          	sb	zero,4(a0)
    1a88:	4695                	li	a3,5
    1a8a:	00550713          	addi	a4,a0,5
    1a8e:	16d78d63          	beq	a5,a3,1c08 <strncpy+0x212>
    1a92:	000502a3          	sb	zero,5(a0)
    1a96:	469d                	li	a3,7
    1a98:	00650713          	addi	a4,a0,6
    1a9c:	16d79863          	bne	a5,a3,1c0c <strncpy+0x216>
    1aa0:	00750713          	addi	a4,a0,7
    1aa4:	00050323          	sb	zero,6(a0)
    1aa8:	40f80833          	sub	a6,a6,a5
    1aac:	ff887593          	andi	a1,a6,-8
    1ab0:	97aa                	add	a5,a5,a0
    1ab2:	95be                	add	a1,a1,a5
    1ab4:	0007b023          	sd	zero,0(a5)
    1ab8:	07a1                	addi	a5,a5,8
    1aba:	feb79de3          	bne	a5,a1,1ab4 <strncpy+0xbe>
    1abe:	ff887593          	andi	a1,a6,-8
    1ac2:	9ead                	addw	a3,a3,a1
    1ac4:	00b707b3          	add	a5,a4,a1
    1ac8:	12b80863          	beq	a6,a1,1bf8 <strncpy+0x202>
    1acc:	00078023          	sb	zero,0(a5)
    1ad0:	0016871b          	addiw	a4,a3,1
    1ad4:	0ec77863          	bgeu	a4,a2,1bc4 <strncpy+0x1ce>
    1ad8:	000780a3          	sb	zero,1(a5)
    1adc:	0026871b          	addiw	a4,a3,2
    1ae0:	0ec77263          	bgeu	a4,a2,1bc4 <strncpy+0x1ce>
    1ae4:	00078123          	sb	zero,2(a5)
    1ae8:	0036871b          	addiw	a4,a3,3
    1aec:	0cc77c63          	bgeu	a4,a2,1bc4 <strncpy+0x1ce>
    1af0:	000781a3          	sb	zero,3(a5)
    1af4:	0046871b          	addiw	a4,a3,4
    1af8:	0cc77663          	bgeu	a4,a2,1bc4 <strncpy+0x1ce>
    1afc:	00078223          	sb	zero,4(a5)
    1b00:	0056871b          	addiw	a4,a3,5
    1b04:	0cc77063          	bgeu	a4,a2,1bc4 <strncpy+0x1ce>
    1b08:	000782a3          	sb	zero,5(a5)
    1b0c:	0066871b          	addiw	a4,a3,6
    1b10:	0ac77a63          	bgeu	a4,a2,1bc4 <strncpy+0x1ce>
    1b14:	00078323          	sb	zero,6(a5)
    1b18:	0076871b          	addiw	a4,a3,7
    1b1c:	0ac77463          	bgeu	a4,a2,1bc4 <strncpy+0x1ce>
    1b20:	000783a3          	sb	zero,7(a5)
    1b24:	0086871b          	addiw	a4,a3,8
    1b28:	08c77e63          	bgeu	a4,a2,1bc4 <strncpy+0x1ce>
    1b2c:	00078423          	sb	zero,8(a5)
    1b30:	0096871b          	addiw	a4,a3,9
    1b34:	08c77863          	bgeu	a4,a2,1bc4 <strncpy+0x1ce>
    1b38:	000784a3          	sb	zero,9(a5)
    1b3c:	00a6871b          	addiw	a4,a3,10
    1b40:	08c77263          	bgeu	a4,a2,1bc4 <strncpy+0x1ce>
    1b44:	00078523          	sb	zero,10(a5)
    1b48:	00b6871b          	addiw	a4,a3,11
    1b4c:	06c77c63          	bgeu	a4,a2,1bc4 <strncpy+0x1ce>
    1b50:	000785a3          	sb	zero,11(a5)
    1b54:	00c6871b          	addiw	a4,a3,12
    1b58:	06c77663          	bgeu	a4,a2,1bc4 <strncpy+0x1ce>
    1b5c:	00078623          	sb	zero,12(a5)
    1b60:	26b5                	addiw	a3,a3,13
    1b62:	06c6f163          	bgeu	a3,a2,1bc4 <strncpy+0x1ce>
    1b66:	000786a3          	sb	zero,13(a5)
    1b6a:	8082                	ret
            ;
        if (!n || !*s)
    1b6c:	c645                	beqz	a2,1c14 <strncpy+0x21e>
    1b6e:	0005c783          	lbu	a5,0(a1)
    1b72:	ea078be3          	beqz	a5,1a28 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b76:	479d                	li	a5,7
    1b78:	02c7ff63          	bgeu	a5,a2,1bb6 <strncpy+0x1c0>
    1b7c:	00000897          	auipc	a7,0x0
    1b80:	3bc8b883          	ld	a7,956(a7) # 1f38 <__clone+0xac>
    1b84:	00000817          	auipc	a6,0x0
    1b88:	3bc83803          	ld	a6,956(a6) # 1f40 <__clone+0xb4>
    1b8c:	431d                	li	t1,7
    1b8e:	6198                	ld	a4,0(a1)
    1b90:	011707b3          	add	a5,a4,a7
    1b94:	fff74693          	not	a3,a4
    1b98:	8ff5                	and	a5,a5,a3
    1b9a:	0107f7b3          	and	a5,a5,a6
    1b9e:	ef81                	bnez	a5,1bb6 <strncpy+0x1c0>
            *wd = *ws;
    1ba0:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ba2:	1661                	addi	a2,a2,-8
    1ba4:	05a1                	addi	a1,a1,8
    1ba6:	0521                	addi	a0,a0,8
    1ba8:	fec363e3          	bltu	t1,a2,1b8e <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bac:	e609                	bnez	a2,1bb6 <strncpy+0x1c0>
    1bae:	a08d                	j	1c10 <strncpy+0x21a>
    1bb0:	167d                	addi	a2,a2,-1
    1bb2:	0505                	addi	a0,a0,1
    1bb4:	ca01                	beqz	a2,1bc4 <strncpy+0x1ce>
    1bb6:	0005c783          	lbu	a5,0(a1)
    1bba:	0585                	addi	a1,a1,1
    1bbc:	00f50023          	sb	a5,0(a0)
    1bc0:	fbe5                	bnez	a5,1bb0 <strncpy+0x1ba>
        ;
tail:
    1bc2:	b59d                	j	1a28 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1bc4:	8082                	ret
    1bc6:	472d                	li	a4,11
    1bc8:	bdb5                	j	1a44 <strncpy+0x4e>
    1bca:	00778713          	addi	a4,a5,7
    1bce:	45ad                	li	a1,11
    1bd0:	fff60693          	addi	a3,a2,-1
    1bd4:	e6b778e3          	bgeu	a4,a1,1a44 <strncpy+0x4e>
    1bd8:	b7fd                	j	1bc6 <strncpy+0x1d0>
    1bda:	40a007b3          	neg	a5,a0
    1bde:	8832                	mv	a6,a2
    1be0:	8b9d                	andi	a5,a5,7
    1be2:	4681                	li	a3,0
    1be4:	e4060be3          	beqz	a2,1a3a <strncpy+0x44>
    1be8:	b7cd                	j	1bca <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bea:	468d                	li	a3,3
    1bec:	bd75                	j	1aa8 <strncpy+0xb2>
    1bee:	872a                	mv	a4,a0
    1bf0:	4681                	li	a3,0
    1bf2:	bd5d                	j	1aa8 <strncpy+0xb2>
    1bf4:	4685                	li	a3,1
    1bf6:	bd4d                	j	1aa8 <strncpy+0xb2>
    1bf8:	8082                	ret
    1bfa:	87aa                	mv	a5,a0
    1bfc:	4681                	li	a3,0
    1bfe:	b5f9                	j	1acc <strncpy+0xd6>
    1c00:	4689                	li	a3,2
    1c02:	b55d                	j	1aa8 <strncpy+0xb2>
    1c04:	4691                	li	a3,4
    1c06:	b54d                	j	1aa8 <strncpy+0xb2>
    1c08:	4695                	li	a3,5
    1c0a:	bd79                	j	1aa8 <strncpy+0xb2>
    1c0c:	4699                	li	a3,6
    1c0e:	bd69                	j	1aa8 <strncpy+0xb2>
    1c10:	8082                	ret
    1c12:	8082                	ret
    1c14:	8082                	ret

0000000000001c16 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c16:	87aa                	mv	a5,a0
    1c18:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c1a:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c1e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c22:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c24:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c26:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c2a:	2501                	sext.w	a0,a0
    1c2c:	8082                	ret

0000000000001c2e <openat>:
    register long a7 __asm__("a7") = n;
    1c2e:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c32:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c36:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c3a:	2501                	sext.w	a0,a0
    1c3c:	8082                	ret

0000000000001c3e <close>:
    register long a7 __asm__("a7") = n;
    1c3e:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c42:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c46:	2501                	sext.w	a0,a0
    1c48:	8082                	ret

0000000000001c4a <read>:
    register long a7 __asm__("a7") = n;
    1c4a:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c4e:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c52:	8082                	ret

0000000000001c54 <write>:
    register long a7 __asm__("a7") = n;
    1c54:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c58:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c5c:	8082                	ret

0000000000001c5e <getpid>:
    register long a7 __asm__("a7") = n;
    1c5e:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c62:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c66:	2501                	sext.w	a0,a0
    1c68:	8082                	ret

0000000000001c6a <getppid>:
    register long a7 __asm__("a7") = n;
    1c6a:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c6e:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c72:	2501                	sext.w	a0,a0
    1c74:	8082                	ret

0000000000001c76 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c76:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c7a:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c7e:	2501                	sext.w	a0,a0
    1c80:	8082                	ret

0000000000001c82 <fork>:
    register long a7 __asm__("a7") = n;
    1c82:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c86:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c88:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c8a:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c8e:	2501                	sext.w	a0,a0
    1c90:	8082                	ret

0000000000001c92 <clone>:
// 子进程执行的执行的函数指针 | 函数参数 | 栈地址 | 栈的大小 | 标志位
pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c92:	85b2                	mv	a1,a2
    1c94:	863a                	mv	a2,a4
    if (stack)
    1c96:	c191                	beqz	a1,1c9a <clone+0x8>
	stack += stack_size;
    1c98:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c9a:	4781                	li	a5,0
    1c9c:	4701                	li	a4,0
    1c9e:	4681                	li	a3,0
    1ca0:	2601                	sext.w	a2,a2
    1ca2:	a2ed                	j	1e8c <__clone>

0000000000001ca4 <exit>:
    register long a7 __asm__("a7") = n;
    1ca4:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1ca8:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cac:	8082                	ret

0000000000001cae <waitpid>:
    register long a7 __asm__("a7") = n;
    1cae:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cb2:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cb4:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cb8:	2501                	sext.w	a0,a0
    1cba:	8082                	ret

0000000000001cbc <exec>:
    register long a7 __asm__("a7") = n;
    1cbc:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cc0:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cc4:	2501                	sext.w	a0,a0
    1cc6:	8082                	ret

0000000000001cc8 <execve>:
    register long a7 __asm__("a7") = n;
    1cc8:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ccc:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cd0:	2501                	sext.w	a0,a0
    1cd2:	8082                	ret

0000000000001cd4 <times>:
    register long a7 __asm__("a7") = n;
    1cd4:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cd8:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cdc:	2501                	sext.w	a0,a0
    1cde:	8082                	ret

0000000000001ce0 <get_time>:

int64 get_time()
{
    1ce0:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1ce2:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ce6:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ce8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cea:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cee:	2501                	sext.w	a0,a0
    1cf0:	ed09                	bnez	a0,1d0a <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cf2:	67a2                	ld	a5,8(sp)
    1cf4:	3e800713          	li	a4,1000
    1cf8:	00015503          	lhu	a0,0(sp)
    1cfc:	02e7d7b3          	divu	a5,a5,a4
    1d00:	02e50533          	mul	a0,a0,a4
    1d04:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d06:	0141                	addi	sp,sp,16
    1d08:	8082                	ret
        return -1;
    1d0a:	557d                	li	a0,-1
    1d0c:	bfed                	j	1d06 <get_time+0x26>

0000000000001d0e <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d0e:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d12:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d16:	2501                	sext.w	a0,a0
    1d18:	8082                	ret

0000000000001d1a <time>:
    register long a7 __asm__("a7") = n;
    1d1a:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d1e:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d22:	2501                	sext.w	a0,a0
    1d24:	8082                	ret

0000000000001d26 <sleep>:

int sleep(unsigned long long time)
{
    1d26:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d28:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d2a:	850a                	mv	a0,sp
    1d2c:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d2e:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d32:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d34:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d38:	e501                	bnez	a0,1d40 <sleep+0x1a>
    return 0;
    1d3a:	4501                	li	a0,0
}
    1d3c:	0141                	addi	sp,sp,16
    1d3e:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d40:	4502                	lw	a0,0(sp)
}
    1d42:	0141                	addi	sp,sp,16
    1d44:	8082                	ret

0000000000001d46 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d46:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d4a:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d4e:	2501                	sext.w	a0,a0
    1d50:	8082                	ret

0000000000001d52 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d52:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d56:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d5a:	8082                	ret

0000000000001d5c <munmap>:
    register long a7 __asm__("a7") = n;
    1d5c:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d60:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d64:	2501                	sext.w	a0,a0
    1d66:	8082                	ret

0000000000001d68 <wait>:

int wait(int *code)
{
    1d68:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d6a:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d6e:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d70:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d72:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d74:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d78:	2501                	sext.w	a0,a0
    1d7a:	8082                	ret

0000000000001d7c <spawn>:
    register long a7 __asm__("a7") = n;
    1d7c:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d80:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d84:	2501                	sext.w	a0,a0
    1d86:	8082                	ret

0000000000001d88 <mailread>:
    register long a7 __asm__("a7") = n;
    1d88:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d8c:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d90:	2501                	sext.w	a0,a0
    1d92:	8082                	ret

0000000000001d94 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d94:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d98:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d9c:	2501                	sext.w	a0,a0
    1d9e:	8082                	ret

0000000000001da0 <fstat>:
    register long a7 __asm__("a7") = n;
    1da0:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1da4:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1da8:	2501                	sext.w	a0,a0
    1daa:	8082                	ret

0000000000001dac <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dac:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dae:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1db2:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1db4:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1db8:	2501                	sext.w	a0,a0
    1dba:	8082                	ret

0000000000001dbc <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dbc:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dbe:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1dc2:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc4:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1dc8:	2501                	sext.w	a0,a0
    1dca:	8082                	ret

0000000000001dcc <link>:

int link(char *old_path, char *new_path)
{
    1dcc:	87aa                	mv	a5,a0
    1dce:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1dd0:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1dd4:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dd8:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dda:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1dde:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1de0:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1de4:	2501                	sext.w	a0,a0
    1de6:	8082                	ret

0000000000001de8 <unlink>:

int unlink(char *path)
{
    1de8:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dea:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1dee:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1df2:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df4:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1df8:	2501                	sext.w	a0,a0
    1dfa:	8082                	ret

0000000000001dfc <uname>:
    register long a7 __asm__("a7") = n;
    1dfc:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e00:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <brk>:
    register long a7 __asm__("a7") = n;
    1e08:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e0c:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e14:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e16:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e1a:	8082                	ret

0000000000001e1c <chdir>:
    register long a7 __asm__("a7") = n;
    1e1c:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e20:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e24:	2501                	sext.w	a0,a0
    1e26:	8082                	ret

0000000000001e28 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e28:	862e                	mv	a2,a1
    1e2a:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e2c:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e2e:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e32:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e36:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e38:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e3a:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e3e:	2501                	sext.w	a0,a0
    1e40:	8082                	ret

0000000000001e42 <getdents>:
    register long a7 __asm__("a7") = n;
    1e42:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e46:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e4a:	2501                	sext.w	a0,a0
    1e4c:	8082                	ret

0000000000001e4e <pipe>:
    register long a7 __asm__("a7") = n;
    1e4e:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e52:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e54:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e58:	2501                	sext.w	a0,a0
    1e5a:	8082                	ret

0000000000001e5c <dup>:
    register long a7 __asm__("a7") = n;
    1e5c:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e5e:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e62:	2501                	sext.w	a0,a0
    1e64:	8082                	ret

0000000000001e66 <dup2>:
    register long a7 __asm__("a7") = n;
    1e66:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e68:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e6a:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e6e:	2501                	sext.w	a0,a0
    1e70:	8082                	ret

0000000000001e72 <mount>:
    register long a7 __asm__("a7") = n;
    1e72:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e76:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e7a:	2501                	sext.w	a0,a0
    1e7c:	8082                	ret

0000000000001e7e <umount>:
    register long a7 __asm__("a7") = n;
    1e7e:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e82:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e84:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e88:	2501                	sext.w	a0,a0
    1e8a:	8082                	ret

0000000000001e8c <__clone>:
.global __clone
.type  __clone, %function
# 函数指针 | 栈地址 | 标志位
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e8c:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e8e:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e90:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e92:	8532                	mv	a0,a2
	mv a2, a4
    1e94:	863a                	mv	a2,a4
	mv a3, a5
    1e96:	86be                	mv	a3,a5
	mv a4, a6
    1e98:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e9a:	0dc00893          	li	a7,220
	ecall
    1e9e:	00000073          	ecall

	beqz a0, 1f
    1ea2:	c111                	beqz	a0,1ea6 <__clone+0x1a>
	# Parent
	ret
    1ea4:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ea6:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ea8:	6522                	ld	a0,8(sp)
	jalr a1
    1eaa:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1eac:	05d00893          	li	a7,93
	ecall
    1eb0:	00000073          	ecall
