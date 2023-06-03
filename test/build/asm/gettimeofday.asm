
/home/lmq/Desktop/xv6-k210/test/build/riscv64/gettimeofday:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a8e9                	j	10dc <__start_main>

0000000000001004 <test_gettimeofday>:
 * "start:[num], end:[num]"
 * "interval: [num]"	注：数字[num]的值应大于0
 * 测试失败时的输出：
 * "gettimeofday error."
 */
void test_gettimeofday() {
    1004:	7179                	addi	sp,sp,-48
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	e9250513          	addi	a0,a0,-366 # 1e98 <__clone+0x2c>
void test_gettimeofday() {
    100e:	f406                	sd	ra,40(sp)
    1010:	ec26                	sd	s1,24(sp)
    1012:	f022                	sd	s0,32(sp)
	TEST_START(__func__);
    1014:	2c6000ef          	jal	ra,12da <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	f3050513          	addi	a0,a0,-208 # 1f48 <__func__.1165>
    1020:	2ba000ef          	jal	ra,12da <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	e8c50513          	addi	a0,a0,-372 # 1eb0 <__clone+0x44>
    102c:	2ae000ef          	jal	ra,12da <puts>
	int test_ret1 = get_time();
    1030:	491000ef          	jal	ra,1cc0 <get_time>
	volatile int i = 	12500000;	// qemu时钟频率12500000
    1034:	00bec7b7          	lui	a5,0xbec
    1038:	c207879b          	addiw	a5,a5,-992
    103c:	c63e                	sw	a5,12(sp)
	while(i > 0) 
    103e:	47b2                	lw	a5,12(sp)
	int test_ret1 = get_time();
    1040:	0005049b          	sext.w	s1,a0
	while(i > 0) 
    1044:	2781                	sext.w	a5,a5
    1046:	00f05963          	blez	a5,1058 <test_gettimeofday+0x54>
	{
		i--;
    104a:	47b2                	lw	a5,12(sp)
    104c:	37fd                	addiw	a5,a5,-1
    104e:	c63e                	sw	a5,12(sp)
	while(i > 0) 
    1050:	47b2                	lw	a5,12(sp)
    1052:	2781                	sext.w	a5,a5
    1054:	fef04be3          	bgtz	a5,104a <test_gettimeofday+0x46>
	}
	int test_ret2 = get_time();
    1058:	469000ef          	jal	ra,1cc0 <get_time>
	if(test_ret1 > 0 && test_ret2 > 0){
    105c:	00905663          	blez	s1,1068 <test_gettimeofday+0x64>
	int test_ret2 = get_time();
    1060:	0005041b          	sext.w	s0,a0
	if(test_ret1 > 0 && test_ret2 > 0){
    1064:	02804d63          	bgtz	s0,109e <test_gettimeofday+0x9a>
		printf("gettimeofday success.\n");
		printf("start:%d, end:%d\n", test_ret1, test_ret2);
                printf("interval: %d\n", test_ret2 - test_ret1);
	}else{
		printf("gettimeofday error.\n");
    1068:	00001517          	auipc	a0,0x1
    106c:	e9850513          	addi	a0,a0,-360 # 1f00 <__clone+0x94>
    1070:	28c000ef          	jal	ra,12fc <printf>
	}
	TEST_END(__func__);
    1074:	00001517          	auipc	a0,0x1
    1078:	ea450513          	addi	a0,a0,-348 # 1f18 <__clone+0xac>
    107c:	25e000ef          	jal	ra,12da <puts>
    1080:	00001517          	auipc	a0,0x1
    1084:	ec850513          	addi	a0,a0,-312 # 1f48 <__func__.1165>
    1088:	252000ef          	jal	ra,12da <puts>
}
    108c:	7402                	ld	s0,32(sp)
    108e:	70a2                	ld	ra,40(sp)
    1090:	64e2                	ld	s1,24(sp)
	TEST_END(__func__);
    1092:	00001517          	auipc	a0,0x1
    1096:	e1e50513          	addi	a0,a0,-482 # 1eb0 <__clone+0x44>
}
    109a:	6145                	addi	sp,sp,48
	TEST_END(__func__);
    109c:	ac3d                	j	12da <puts>
		printf("gettimeofday success.\n");
    109e:	00001517          	auipc	a0,0x1
    10a2:	e2250513          	addi	a0,a0,-478 # 1ec0 <__clone+0x54>
    10a6:	256000ef          	jal	ra,12fc <printf>
		printf("start:%d, end:%d\n", test_ret1, test_ret2);
    10aa:	85a6                	mv	a1,s1
    10ac:	8622                	mv	a2,s0
    10ae:	00001517          	auipc	a0,0x1
    10b2:	e2a50513          	addi	a0,a0,-470 # 1ed8 <__clone+0x6c>
    10b6:	246000ef          	jal	ra,12fc <printf>
                printf("interval: %d\n", test_ret2 - test_ret1);
    10ba:	409405bb          	subw	a1,s0,s1
    10be:	00001517          	auipc	a0,0x1
    10c2:	e3250513          	addi	a0,a0,-462 # 1ef0 <__clone+0x84>
    10c6:	236000ef          	jal	ra,12fc <printf>
    10ca:	b76d                	j	1074 <test_gettimeofday+0x70>

00000000000010cc <main>:

int main(void) {
    10cc:	1141                	addi	sp,sp,-16
    10ce:	e406                	sd	ra,8(sp)
	test_gettimeofday();
    10d0:	f35ff0ef          	jal	ra,1004 <test_gettimeofday>
	return 0;
}
    10d4:	60a2                	ld	ra,8(sp)
    10d6:	4501                	li	a0,0
    10d8:	0141                	addi	sp,sp,16
    10da:	8082                	ret

00000000000010dc <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10dc:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10de:	4108                	lw	a0,0(a0)
{
    10e0:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10e2:	05a1                	addi	a1,a1,8
{
    10e4:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10e6:	fe7ff0ef          	jal	ra,10cc <main>
    10ea:	39b000ef          	jal	ra,1c84 <exit>
	return 0;
}
    10ee:	60a2                	ld	ra,8(sp)
    10f0:	4501                	li	a0,0
    10f2:	0141                	addi	sp,sp,16
    10f4:	8082                	ret

00000000000010f6 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10f6:	7179                	addi	sp,sp,-48
    10f8:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10fa:	12054b63          	bltz	a0,1230 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10fe:	02b577bb          	remuw	a5,a0,a1
    1102:	00001697          	auipc	a3,0x1
    1106:	e5e68693          	addi	a3,a3,-418 # 1f60 <digits>
    buf[16] = 0;
    110a:	00010c23          	sb	zero,24(sp)
    i = 15;
    110e:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    1112:	1782                	slli	a5,a5,0x20
    1114:	9381                	srli	a5,a5,0x20
    1116:	97b6                	add	a5,a5,a3
    1118:	0007c783          	lbu	a5,0(a5) # bec000 <digits+0xbea0a0>
    } while ((x /= base) != 0);
    111c:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1120:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1124:	16b56263          	bltu	a0,a1,1288 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1128:	02e8763b          	remuw	a2,a6,a4
    112c:	1602                	slli	a2,a2,0x20
    112e:	9201                	srli	a2,a2,0x20
    1130:	9636                	add	a2,a2,a3
    1132:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1136:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    113a:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    113e:	12e86963          	bltu	a6,a4,1270 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    1142:	02e5f63b          	remuw	a2,a1,a4
    1146:	1602                	slli	a2,a2,0x20
    1148:	9201                	srli	a2,a2,0x20
    114a:	9636                	add	a2,a2,a3
    114c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1150:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1154:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1158:	10e5ef63          	bltu	a1,a4,1276 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    115c:	02e8763b          	remuw	a2,a6,a4
    1160:	1602                	slli	a2,a2,0x20
    1162:	9201                	srli	a2,a2,0x20
    1164:	9636                	add	a2,a2,a3
    1166:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    116a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    116e:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1172:	10e86563          	bltu	a6,a4,127c <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    1176:	02e5f63b          	remuw	a2,a1,a4
    117a:	1602                	slli	a2,a2,0x20
    117c:	9201                	srli	a2,a2,0x20
    117e:	9636                	add	a2,a2,a3
    1180:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1184:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1188:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    118c:	0ee5eb63          	bltu	a1,a4,1282 <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    1190:	02e8763b          	remuw	a2,a6,a4
    1194:	1602                	slli	a2,a2,0x20
    1196:	9201                	srli	a2,a2,0x20
    1198:	9636                	add	a2,a2,a3
    119a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    119e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11a2:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11a6:	0ce86263          	bltu	a6,a4,126a <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    11aa:	02e5f63b          	remuw	a2,a1,a4
    11ae:	1602                	slli	a2,a2,0x20
    11b0:	9201                	srli	a2,a2,0x20
    11b2:	9636                	add	a2,a2,a3
    11b4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b8:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11bc:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11c0:	0ce5e663          	bltu	a1,a4,128c <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    11c4:	02e8763b          	remuw	a2,a6,a4
    11c8:	1602                	slli	a2,a2,0x20
    11ca:	9201                	srli	a2,a2,0x20
    11cc:	9636                	add	a2,a2,a3
    11ce:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d2:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11d6:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11da:	0ae86c63          	bltu	a6,a4,1292 <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    11de:	02e5f63b          	remuw	a2,a1,a4
    11e2:	1602                	slli	a2,a2,0x20
    11e4:	9201                	srli	a2,a2,0x20
    11e6:	9636                	add	a2,a2,a3
    11e8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ec:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11f0:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11f4:	0ae5e263          	bltu	a1,a4,1298 <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    11f8:	1782                	slli	a5,a5,0x20
    11fa:	9381                	srli	a5,a5,0x20
    11fc:	97b6                	add	a5,a5,a3
    11fe:	0007c703          	lbu	a4,0(a5)
    1202:	4599                	li	a1,6
    1204:	4795                	li	a5,5
    1206:	00e10723          	sb	a4,14(sp)

    if (sign)
    120a:	00055963          	bgez	a0,121c <printint.constprop.0+0x126>
        buf[i--] = '-';
    120e:	1018                	addi	a4,sp,32
    1210:	973e                	add	a4,a4,a5
    1212:	02d00693          	li	a3,45
    1216:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    121a:	85be                	mv	a1,a5
    write(f, s, l);
    121c:	003c                	addi	a5,sp,8
    121e:	4641                	li	a2,16
    1220:	9e0d                	subw	a2,a2,a1
    1222:	4505                	li	a0,1
    1224:	95be                	add	a1,a1,a5
    1226:	20f000ef          	jal	ra,1c34 <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    122a:	70a2                	ld	ra,40(sp)
    122c:	6145                	addi	sp,sp,48
    122e:	8082                	ret
        x = -xx;
    1230:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1234:	02b677bb          	remuw	a5,a2,a1
    1238:	00001697          	auipc	a3,0x1
    123c:	d2868693          	addi	a3,a3,-728 # 1f60 <digits>
    buf[16] = 0;
    1240:	00010c23          	sb	zero,24(sp)
    i = 15;
    1244:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    1248:	1782                	slli	a5,a5,0x20
    124a:	9381                	srli	a5,a5,0x20
    124c:	97b6                	add	a5,a5,a3
    124e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1252:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1256:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    125a:	ecb677e3          	bgeu	a2,a1,1128 <printint.constprop.0+0x32>
        buf[i--] = '-';
    125e:	02d00793          	li	a5,45
    1262:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1266:	45b9                	li	a1,14
    1268:	bf55                	j	121c <printint.constprop.0+0x126>
    126a:	47a5                	li	a5,9
    126c:	45a9                	li	a1,10
    126e:	bf71                	j	120a <printint.constprop.0+0x114>
    1270:	47b5                	li	a5,13
    1272:	45b9                	li	a1,14
    1274:	bf59                	j	120a <printint.constprop.0+0x114>
    1276:	47b1                	li	a5,12
    1278:	45b5                	li	a1,13
    127a:	bf41                	j	120a <printint.constprop.0+0x114>
    127c:	47ad                	li	a5,11
    127e:	45b1                	li	a1,12
    1280:	b769                	j	120a <printint.constprop.0+0x114>
    1282:	47a9                	li	a5,10
    1284:	45ad                	li	a1,11
    1286:	b751                	j	120a <printint.constprop.0+0x114>
    i = 15;
    1288:	45bd                	li	a1,15
    128a:	bf49                	j	121c <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    128c:	47a1                	li	a5,8
    128e:	45a5                	li	a1,9
    1290:	bfad                	j	120a <printint.constprop.0+0x114>
    1292:	479d                	li	a5,7
    1294:	45a1                	li	a1,8
    1296:	bf95                	j	120a <printint.constprop.0+0x114>
    1298:	4799                	li	a5,6
    129a:	459d                	li	a1,7
    129c:	b7bd                	j	120a <printint.constprop.0+0x114>

000000000000129e <getchar>:
{
    129e:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12a0:	00f10593          	addi	a1,sp,15
    12a4:	4605                	li	a2,1
    12a6:	4501                	li	a0,0
{
    12a8:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12aa:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12ae:	17d000ef          	jal	ra,1c2a <read>
}
    12b2:	60e2                	ld	ra,24(sp)
    12b4:	00f14503          	lbu	a0,15(sp)
    12b8:	6105                	addi	sp,sp,32
    12ba:	8082                	ret

00000000000012bc <putchar>:
{
    12bc:	1101                	addi	sp,sp,-32
    12be:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12c0:	00f10593          	addi	a1,sp,15
    12c4:	4605                	li	a2,1
    12c6:	4505                	li	a0,1
{
    12c8:	ec06                	sd	ra,24(sp)
    char byte = c;
    12ca:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12ce:	167000ef          	jal	ra,1c34 <write>
}
    12d2:	60e2                	ld	ra,24(sp)
    12d4:	2501                	sext.w	a0,a0
    12d6:	6105                	addi	sp,sp,32
    12d8:	8082                	ret

00000000000012da <puts>:
{
    12da:	1141                	addi	sp,sp,-16
    12dc:	e406                	sd	ra,8(sp)
    12de:	e022                	sd	s0,0(sp)
    12e0:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12e2:	56e000ef          	jal	ra,1850 <strlen>
    12e6:	862a                	mv	a2,a0
    12e8:	85a2                	mv	a1,s0
    12ea:	4505                	li	a0,1
    12ec:	149000ef          	jal	ra,1c34 <write>
}
    12f0:	60a2                	ld	ra,8(sp)
    12f2:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12f4:	957d                	srai	a0,a0,0x3f
    return r;
    12f6:	2501                	sext.w	a0,a0
}
    12f8:	0141                	addi	sp,sp,16
    12fa:	8082                	ret

00000000000012fc <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12fc:	7171                	addi	sp,sp,-176
    12fe:	fc56                	sd	s5,56(sp)
    1300:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1302:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1304:	18bc                	addi	a5,sp,120
{
    1306:	e8ca                	sd	s2,80(sp)
    1308:	e4ce                	sd	s3,72(sp)
    130a:	e0d2                	sd	s4,64(sp)
    130c:	f85a                	sd	s6,48(sp)
    130e:	f486                	sd	ra,104(sp)
    1310:	f0a2                	sd	s0,96(sp)
    1312:	eca6                	sd	s1,88(sp)
    1314:	fcae                	sd	a1,120(sp)
    1316:	e132                	sd	a2,128(sp)
    1318:	e536                	sd	a3,136(sp)
    131a:	e93a                	sd	a4,144(sp)
    131c:	f142                	sd	a6,160(sp)
    131e:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1320:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1322:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1326:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    132a:	00001b17          	auipc	s6,0x1
    132e:	bfeb0b13          	addi	s6,s6,-1026 # 1f28 <__clone+0xbc>
    buf[i++] = '0';
    1332:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1336:	00001997          	auipc	s3,0x1
    133a:	c2a98993          	addi	s3,s3,-982 # 1f60 <digits>
        if (!*s)
    133e:	00054783          	lbu	a5,0(a0)
    1342:	16078a63          	beqz	a5,14b6 <printf+0x1ba>
    1346:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1348:	19278163          	beq	a5,s2,14ca <printf+0x1ce>
    134c:	00164783          	lbu	a5,1(a2)
    1350:	0605                	addi	a2,a2,1
    1352:	fbfd                	bnez	a5,1348 <printf+0x4c>
    1354:	84b2                	mv	s1,a2
        l = z - a;
    1356:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    135a:	85aa                	mv	a1,a0
    135c:	8622                	mv	a2,s0
    135e:	4505                	li	a0,1
    1360:	0d5000ef          	jal	ra,1c34 <write>
        if (l)
    1364:	18041c63          	bnez	s0,14fc <printf+0x200>
        if (s[1] == 0)
    1368:	0014c783          	lbu	a5,1(s1)
    136c:	14078563          	beqz	a5,14b6 <printf+0x1ba>
        switch (s[1])
    1370:	1d478063          	beq	a5,s4,1530 <printf+0x234>
    1374:	18fa6663          	bltu	s4,a5,1500 <printf+0x204>
    1378:	06400713          	li	a4,100
    137c:	1ae78063          	beq	a5,a4,151c <printf+0x220>
    1380:	07000713          	li	a4,112
    1384:	1ce79963          	bne	a5,a4,1556 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    1388:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    138a:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    138e:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1390:	631c                	ld	a5,0(a4)
    1392:	0721                	addi	a4,a4,8
    1394:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1396:	00479293          	slli	t0,a5,0x4
    139a:	00879f93          	slli	t6,a5,0x8
    139e:	00c79f13          	slli	t5,a5,0xc
    13a2:	01079e93          	slli	t4,a5,0x10
    13a6:	01479e13          	slli	t3,a5,0x14
    13aa:	01879313          	slli	t1,a5,0x18
    13ae:	01c79893          	slli	a7,a5,0x1c
    13b2:	02479813          	slli	a6,a5,0x24
    13b6:	02879513          	slli	a0,a5,0x28
    13ba:	02c79593          	slli	a1,a5,0x2c
    13be:	03079693          	slli	a3,a5,0x30
    13c2:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13c6:	03c7d413          	srli	s0,a5,0x3c
    13ca:	01c7d39b          	srliw	t2,a5,0x1c
    13ce:	03c2d293          	srli	t0,t0,0x3c
    13d2:	03cfdf93          	srli	t6,t6,0x3c
    13d6:	03cf5f13          	srli	t5,t5,0x3c
    13da:	03cede93          	srli	t4,t4,0x3c
    13de:	03ce5e13          	srli	t3,t3,0x3c
    13e2:	03c35313          	srli	t1,t1,0x3c
    13e6:	03c8d893          	srli	a7,a7,0x3c
    13ea:	03c85813          	srli	a6,a6,0x3c
    13ee:	9171                	srli	a0,a0,0x3c
    13f0:	91f1                	srli	a1,a1,0x3c
    13f2:	92f1                	srli	a3,a3,0x3c
    13f4:	9371                	srli	a4,a4,0x3c
    13f6:	96ce                	add	a3,a3,s3
    13f8:	974e                	add	a4,a4,s3
    13fa:	944e                	add	s0,s0,s3
    13fc:	92ce                	add	t0,t0,s3
    13fe:	9fce                	add	t6,t6,s3
    1400:	9f4e                	add	t5,t5,s3
    1402:	9ece                	add	t4,t4,s3
    1404:	9e4e                	add	t3,t3,s3
    1406:	934e                	add	t1,t1,s3
    1408:	98ce                	add	a7,a7,s3
    140a:	93ce                	add	t2,t2,s3
    140c:	984e                	add	a6,a6,s3
    140e:	954e                	add	a0,a0,s3
    1410:	95ce                	add	a1,a1,s3
    1412:	0006c083          	lbu	ra,0(a3)
    1416:	0002c283          	lbu	t0,0(t0)
    141a:	00074683          	lbu	a3,0(a4)
    141e:	000fcf83          	lbu	t6,0(t6)
    1422:	000f4f03          	lbu	t5,0(t5)
    1426:	000ece83          	lbu	t4,0(t4)
    142a:	000e4e03          	lbu	t3,0(t3)
    142e:	00034303          	lbu	t1,0(t1)
    1432:	0008c883          	lbu	a7,0(a7)
    1436:	0003c383          	lbu	t2,0(t2)
    143a:	00084803          	lbu	a6,0(a6)
    143e:	00054503          	lbu	a0,0(a0)
    1442:	0005c583          	lbu	a1,0(a1)
    1446:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    144a:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    144e:	9371                	srli	a4,a4,0x3c
    1450:	8bbd                	andi	a5,a5,15
    1452:	974e                	add	a4,a4,s3
    1454:	97ce                	add	a5,a5,s3
    1456:	005105a3          	sb	t0,11(sp)
    145a:	01f10623          	sb	t6,12(sp)
    145e:	01e106a3          	sb	t5,13(sp)
    1462:	01d10723          	sb	t4,14(sp)
    1466:	01c107a3          	sb	t3,15(sp)
    146a:	00610823          	sb	t1,16(sp)
    146e:	011108a3          	sb	a7,17(sp)
    1472:	00710923          	sb	t2,18(sp)
    1476:	010109a3          	sb	a6,19(sp)
    147a:	00a10a23          	sb	a0,20(sp)
    147e:	00b10aa3          	sb	a1,21(sp)
    1482:	00110b23          	sb	ra,22(sp)
    1486:	00d10ba3          	sb	a3,23(sp)
    148a:	00810523          	sb	s0,10(sp)
    148e:	00074703          	lbu	a4,0(a4)
    1492:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1496:	002c                	addi	a1,sp,8
    1498:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    149a:	00e10c23          	sb	a4,24(sp)
    149e:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14a2:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14a6:	78e000ef          	jal	ra,1c34 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14aa:	00248513          	addi	a0,s1,2
        if (!*s)
    14ae:	00054783          	lbu	a5,0(a0)
    14b2:	e8079ae3          	bnez	a5,1346 <printf+0x4a>
    }
    va_end(ap);
}
    14b6:	70a6                	ld	ra,104(sp)
    14b8:	7406                	ld	s0,96(sp)
    14ba:	64e6                	ld	s1,88(sp)
    14bc:	6946                	ld	s2,80(sp)
    14be:	69a6                	ld	s3,72(sp)
    14c0:	6a06                	ld	s4,64(sp)
    14c2:	7ae2                	ld	s5,56(sp)
    14c4:	7b42                	ld	s6,48(sp)
    14c6:	614d                	addi	sp,sp,176
    14c8:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14ca:	00064783          	lbu	a5,0(a2)
    14ce:	84b2                	mv	s1,a2
    14d0:	01278963          	beq	a5,s2,14e2 <printf+0x1e6>
    14d4:	b549                	j	1356 <printf+0x5a>
    14d6:	0024c783          	lbu	a5,2(s1)
    14da:	0605                	addi	a2,a2,1
    14dc:	0489                	addi	s1,s1,2
    14de:	e7279ce3          	bne	a5,s2,1356 <printf+0x5a>
    14e2:	0014c783          	lbu	a5,1(s1)
    14e6:	ff2788e3          	beq	a5,s2,14d6 <printf+0x1da>
        l = z - a;
    14ea:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14ee:	85aa                	mv	a1,a0
    14f0:	8622                	mv	a2,s0
    14f2:	4505                	li	a0,1
    14f4:	740000ef          	jal	ra,1c34 <write>
        if (l)
    14f8:	e60408e3          	beqz	s0,1368 <printf+0x6c>
    14fc:	8526                	mv	a0,s1
    14fe:	b581                	j	133e <printf+0x42>
        switch (s[1])
    1500:	07800713          	li	a4,120
    1504:	04e79963          	bne	a5,a4,1556 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    1508:	6782                	ld	a5,0(sp)
    150a:	45c1                	li	a1,16
    150c:	4388                	lw	a0,0(a5)
    150e:	07a1                	addi	a5,a5,8
    1510:	e03e                	sd	a5,0(sp)
    1512:	be5ff0ef          	jal	ra,10f6 <printint.constprop.0>
        s += 2;
    1516:	00248513          	addi	a0,s1,2
    151a:	bf51                	j	14ae <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    151c:	6782                	ld	a5,0(sp)
    151e:	45a9                	li	a1,10
    1520:	4388                	lw	a0,0(a5)
    1522:	07a1                	addi	a5,a5,8
    1524:	e03e                	sd	a5,0(sp)
    1526:	bd1ff0ef          	jal	ra,10f6 <printint.constprop.0>
        s += 2;
    152a:	00248513          	addi	a0,s1,2
    152e:	b741                	j	14ae <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1530:	6782                	ld	a5,0(sp)
    1532:	6380                	ld	s0,0(a5)
    1534:	07a1                	addi	a5,a5,8
    1536:	e03e                	sd	a5,0(sp)
    1538:	c421                	beqz	s0,1580 <printf+0x284>
            l = strnlen(a, 200);
    153a:	0c800593          	li	a1,200
    153e:	8522                	mv	a0,s0
    1540:	3fc000ef          	jal	ra,193c <strnlen>
    write(f, s, l);
    1544:	0005061b          	sext.w	a2,a0
    1548:	85a2                	mv	a1,s0
    154a:	4505                	li	a0,1
    154c:	6e8000ef          	jal	ra,1c34 <write>
        s += 2;
    1550:	00248513          	addi	a0,s1,2
    1554:	bfa9                	j	14ae <printf+0x1b2>
    char byte = c;
    1556:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    155a:	4605                	li	a2,1
    155c:	002c                	addi	a1,sp,8
    155e:	4505                	li	a0,1
    char byte = c;
    1560:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1564:	6d0000ef          	jal	ra,1c34 <write>
    char byte = c;
    1568:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    156c:	4605                	li	a2,1
    156e:	002c                	addi	a1,sp,8
    1570:	4505                	li	a0,1
    char byte = c;
    1572:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1576:	6be000ef          	jal	ra,1c34 <write>
        s += 2;
    157a:	00248513          	addi	a0,s1,2
    157e:	bf05                	j	14ae <printf+0x1b2>
                a = "(null)";
    1580:	845a                	mv	s0,s6
    1582:	bf65                	j	153a <printf+0x23e>

0000000000001584 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1584:	02000793          	li	a5,32
    1588:	00f50663          	beq	a0,a5,1594 <isspace+0x10>
    158c:	355d                	addiw	a0,a0,-9
    158e:	00553513          	sltiu	a0,a0,5
    1592:	8082                	ret
    1594:	4505                	li	a0,1
}
    1596:	8082                	ret

0000000000001598 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1598:	fd05051b          	addiw	a0,a0,-48
}
    159c:	00a53513          	sltiu	a0,a0,10
    15a0:	8082                	ret

00000000000015a2 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a2:	02000613          	li	a2,32
    15a6:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15a8:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ac:	ff77069b          	addiw	a3,a4,-9
    15b0:	04c70d63          	beq	a4,a2,160a <atoi+0x68>
    15b4:	0007079b          	sext.w	a5,a4
    15b8:	04d5f963          	bgeu	a1,a3,160a <atoi+0x68>
        s++;
    switch (*s)
    15bc:	02b00693          	li	a3,43
    15c0:	04d70a63          	beq	a4,a3,1614 <atoi+0x72>
    15c4:	02d00693          	li	a3,45
    15c8:	06d70463          	beq	a4,a3,1630 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15cc:	fd07859b          	addiw	a1,a5,-48
    15d0:	4625                	li	a2,9
    15d2:	873e                	mv	a4,a5
    15d4:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15d6:	4e01                	li	t3,0
    while (isdigit(*s))
    15d8:	04b66a63          	bltu	a2,a1,162c <atoi+0x8a>
    int n = 0, neg = 0;
    15dc:	4501                	li	a0,0
    while (isdigit(*s))
    15de:	4825                	li	a6,9
    15e0:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    15e4:	0025179b          	slliw	a5,a0,0x2
    15e8:	9d3d                	addw	a0,a0,a5
    15ea:	fd07031b          	addiw	t1,a4,-48
    15ee:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15f2:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15f6:	0685                	addi	a3,a3,1
    15f8:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15fc:	0006071b          	sext.w	a4,a2
    1600:	feb870e3          	bgeu	a6,a1,15e0 <atoi+0x3e>
    return neg ? n : -n;
    1604:	000e0563          	beqz	t3,160e <atoi+0x6c>
}
    1608:	8082                	ret
        s++;
    160a:	0505                	addi	a0,a0,1
    160c:	bf71                	j	15a8 <atoi+0x6>
    160e:	4113053b          	subw	a0,t1,a7
    1612:	8082                	ret
    while (isdigit(*s))
    1614:	00154783          	lbu	a5,1(a0)
    1618:	4625                	li	a2,9
        s++;
    161a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    161e:	fd07859b          	addiw	a1,a5,-48
    1622:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1626:	4e01                	li	t3,0
    while (isdigit(*s))
    1628:	fab67ae3          	bgeu	a2,a1,15dc <atoi+0x3a>
    162c:	4501                	li	a0,0
}
    162e:	8082                	ret
    while (isdigit(*s))
    1630:	00154783          	lbu	a5,1(a0)
    1634:	4625                	li	a2,9
        s++;
    1636:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    163a:	fd07859b          	addiw	a1,a5,-48
    163e:	0007871b          	sext.w	a4,a5
    1642:	feb665e3          	bltu	a2,a1,162c <atoi+0x8a>
        neg = 1;
    1646:	4e05                	li	t3,1
    1648:	bf51                	j	15dc <atoi+0x3a>

000000000000164a <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    164a:	16060d63          	beqz	a2,17c4 <memset+0x17a>
    164e:	40a007b3          	neg	a5,a0
    1652:	8b9d                	andi	a5,a5,7
    1654:	00778713          	addi	a4,a5,7
    1658:	482d                	li	a6,11
    165a:	0ff5f593          	andi	a1,a1,255
    165e:	fff60693          	addi	a3,a2,-1
    1662:	17076263          	bltu	a4,a6,17c6 <memset+0x17c>
    1666:	16e6ea63          	bltu	a3,a4,17da <memset+0x190>
    166a:	16078563          	beqz	a5,17d4 <memset+0x18a>
    166e:	00b50023          	sb	a1,0(a0)
    1672:	4705                	li	a4,1
    1674:	00150e93          	addi	t4,a0,1
    1678:	14e78c63          	beq	a5,a4,17d0 <memset+0x186>
    167c:	00b500a3          	sb	a1,1(a0)
    1680:	4709                	li	a4,2
    1682:	00250e93          	addi	t4,a0,2
    1686:	14e78d63          	beq	a5,a4,17e0 <memset+0x196>
    168a:	00b50123          	sb	a1,2(a0)
    168e:	470d                	li	a4,3
    1690:	00350e93          	addi	t4,a0,3
    1694:	12e78b63          	beq	a5,a4,17ca <memset+0x180>
    1698:	00b501a3          	sb	a1,3(a0)
    169c:	4711                	li	a4,4
    169e:	00450e93          	addi	t4,a0,4
    16a2:	14e78163          	beq	a5,a4,17e4 <memset+0x19a>
    16a6:	00b50223          	sb	a1,4(a0)
    16aa:	4715                	li	a4,5
    16ac:	00550e93          	addi	t4,a0,5
    16b0:	12e78c63          	beq	a5,a4,17e8 <memset+0x19e>
    16b4:	00b502a3          	sb	a1,5(a0)
    16b8:	471d                	li	a4,7
    16ba:	00650e93          	addi	t4,a0,6
    16be:	12e79763          	bne	a5,a4,17ec <memset+0x1a2>
    16c2:	00750e93          	addi	t4,a0,7
    16c6:	00b50323          	sb	a1,6(a0)
    16ca:	4f1d                	li	t5,7
    16cc:	00859713          	slli	a4,a1,0x8
    16d0:	8f4d                	or	a4,a4,a1
    16d2:	01059e13          	slli	t3,a1,0x10
    16d6:	01c76e33          	or	t3,a4,t3
    16da:	01859313          	slli	t1,a1,0x18
    16de:	006e6333          	or	t1,t3,t1
    16e2:	02059893          	slli	a7,a1,0x20
    16e6:	011368b3          	or	a7,t1,a7
    16ea:	02859813          	slli	a6,a1,0x28
    16ee:	40f60333          	sub	t1,a2,a5
    16f2:	0108e833          	or	a6,a7,a6
    16f6:	03059693          	slli	a3,a1,0x30
    16fa:	00d866b3          	or	a3,a6,a3
    16fe:	03859713          	slli	a4,a1,0x38
    1702:	97aa                	add	a5,a5,a0
    1704:	ff837813          	andi	a6,t1,-8
    1708:	8f55                	or	a4,a4,a3
    170a:	00f806b3          	add	a3,a6,a5
    170e:	e398                	sd	a4,0(a5)
    1710:	07a1                	addi	a5,a5,8
    1712:	fed79ee3          	bne	a5,a3,170e <memset+0xc4>
    1716:	ff837693          	andi	a3,t1,-8
    171a:	00de87b3          	add	a5,t4,a3
    171e:	01e6873b          	addw	a4,a3,t5
    1722:	0ad30663          	beq	t1,a3,17ce <memset+0x184>
    1726:	00b78023          	sb	a1,0(a5)
    172a:	0017069b          	addiw	a3,a4,1
    172e:	08c6fb63          	bgeu	a3,a2,17c4 <memset+0x17a>
    1732:	00b780a3          	sb	a1,1(a5)
    1736:	0027069b          	addiw	a3,a4,2
    173a:	08c6f563          	bgeu	a3,a2,17c4 <memset+0x17a>
    173e:	00b78123          	sb	a1,2(a5)
    1742:	0037069b          	addiw	a3,a4,3
    1746:	06c6ff63          	bgeu	a3,a2,17c4 <memset+0x17a>
    174a:	00b781a3          	sb	a1,3(a5)
    174e:	0047069b          	addiw	a3,a4,4
    1752:	06c6f963          	bgeu	a3,a2,17c4 <memset+0x17a>
    1756:	00b78223          	sb	a1,4(a5)
    175a:	0057069b          	addiw	a3,a4,5
    175e:	06c6f363          	bgeu	a3,a2,17c4 <memset+0x17a>
    1762:	00b782a3          	sb	a1,5(a5)
    1766:	0067069b          	addiw	a3,a4,6
    176a:	04c6fd63          	bgeu	a3,a2,17c4 <memset+0x17a>
    176e:	00b78323          	sb	a1,6(a5)
    1772:	0077069b          	addiw	a3,a4,7
    1776:	04c6f763          	bgeu	a3,a2,17c4 <memset+0x17a>
    177a:	00b783a3          	sb	a1,7(a5)
    177e:	0087069b          	addiw	a3,a4,8
    1782:	04c6f163          	bgeu	a3,a2,17c4 <memset+0x17a>
    1786:	00b78423          	sb	a1,8(a5)
    178a:	0097069b          	addiw	a3,a4,9
    178e:	02c6fb63          	bgeu	a3,a2,17c4 <memset+0x17a>
    1792:	00b784a3          	sb	a1,9(a5)
    1796:	00a7069b          	addiw	a3,a4,10
    179a:	02c6f563          	bgeu	a3,a2,17c4 <memset+0x17a>
    179e:	00b78523          	sb	a1,10(a5)
    17a2:	00b7069b          	addiw	a3,a4,11
    17a6:	00c6ff63          	bgeu	a3,a2,17c4 <memset+0x17a>
    17aa:	00b785a3          	sb	a1,11(a5)
    17ae:	00c7069b          	addiw	a3,a4,12
    17b2:	00c6f963          	bgeu	a3,a2,17c4 <memset+0x17a>
    17b6:	00b78623          	sb	a1,12(a5)
    17ba:	2735                	addiw	a4,a4,13
    17bc:	00c77463          	bgeu	a4,a2,17c4 <memset+0x17a>
    17c0:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17c4:	8082                	ret
    17c6:	472d                	li	a4,11
    17c8:	bd79                	j	1666 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ca:	4f0d                	li	t5,3
    17cc:	b701                	j	16cc <memset+0x82>
    17ce:	8082                	ret
    17d0:	4f05                	li	t5,1
    17d2:	bded                	j	16cc <memset+0x82>
    17d4:	8eaa                	mv	t4,a0
    17d6:	4f01                	li	t5,0
    17d8:	bdd5                	j	16cc <memset+0x82>
    17da:	87aa                	mv	a5,a0
    17dc:	4701                	li	a4,0
    17de:	b7a1                	j	1726 <memset+0xdc>
    17e0:	4f09                	li	t5,2
    17e2:	b5ed                	j	16cc <memset+0x82>
    17e4:	4f11                	li	t5,4
    17e6:	b5dd                	j	16cc <memset+0x82>
    17e8:	4f15                	li	t5,5
    17ea:	b5cd                	j	16cc <memset+0x82>
    17ec:	4f19                	li	t5,6
    17ee:	bdf9                	j	16cc <memset+0x82>

00000000000017f0 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17f0:	00054783          	lbu	a5,0(a0)
    17f4:	0005c703          	lbu	a4,0(a1)
    17f8:	00e79863          	bne	a5,a4,1808 <strcmp+0x18>
    17fc:	0505                	addi	a0,a0,1
    17fe:	0585                	addi	a1,a1,1
    1800:	fbe5                	bnez	a5,17f0 <strcmp>
    1802:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1804:	9d19                	subw	a0,a0,a4
    1806:	8082                	ret
    1808:	0007851b          	sext.w	a0,a5
    180c:	bfe5                	j	1804 <strcmp+0x14>

000000000000180e <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    180e:	ce05                	beqz	a2,1846 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1810:	00054703          	lbu	a4,0(a0)
    1814:	0005c783          	lbu	a5,0(a1)
    1818:	cb0d                	beqz	a4,184a <strncmp+0x3c>
    if (!n--)
    181a:	167d                	addi	a2,a2,-1
    181c:	00c506b3          	add	a3,a0,a2
    1820:	a819                	j	1836 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1822:	00a68e63          	beq	a3,a0,183e <strncmp+0x30>
    1826:	0505                	addi	a0,a0,1
    1828:	00e79b63          	bne	a5,a4,183e <strncmp+0x30>
    182c:	00054703          	lbu	a4,0(a0)
    1830:	0005c783          	lbu	a5,0(a1)
    1834:	cb19                	beqz	a4,184a <strncmp+0x3c>
    1836:	0005c783          	lbu	a5,0(a1)
    183a:	0585                	addi	a1,a1,1
    183c:	f3fd                	bnez	a5,1822 <strncmp+0x14>
        ;
    return *l - *r;
    183e:	0007051b          	sext.w	a0,a4
    1842:	9d1d                	subw	a0,a0,a5
    1844:	8082                	ret
        return 0;
    1846:	4501                	li	a0,0
}
    1848:	8082                	ret
    184a:	4501                	li	a0,0
    return *l - *r;
    184c:	9d1d                	subw	a0,a0,a5
    184e:	8082                	ret

0000000000001850 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1850:	00757793          	andi	a5,a0,7
    1854:	cf89                	beqz	a5,186e <strlen+0x1e>
    1856:	87aa                	mv	a5,a0
    1858:	a029                	j	1862 <strlen+0x12>
    185a:	0785                	addi	a5,a5,1
    185c:	0077f713          	andi	a4,a5,7
    1860:	cb01                	beqz	a4,1870 <strlen+0x20>
        if (!*s)
    1862:	0007c703          	lbu	a4,0(a5)
    1866:	fb75                	bnez	a4,185a <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1868:	40a78533          	sub	a0,a5,a0
}
    186c:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    186e:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1870:	6394                	ld	a3,0(a5)
    1872:	00000597          	auipc	a1,0x0
    1876:	6be5b583          	ld	a1,1726(a1) # 1f30 <__clone+0xc4>
    187a:	00000617          	auipc	a2,0x0
    187e:	6be63603          	ld	a2,1726(a2) # 1f38 <__clone+0xcc>
    1882:	a019                	j	1888 <strlen+0x38>
    1884:	6794                	ld	a3,8(a5)
    1886:	07a1                	addi	a5,a5,8
    1888:	00b68733          	add	a4,a3,a1
    188c:	fff6c693          	not	a3,a3
    1890:	8f75                	and	a4,a4,a3
    1892:	8f71                	and	a4,a4,a2
    1894:	db65                	beqz	a4,1884 <strlen+0x34>
    for (; *s; s++)
    1896:	0007c703          	lbu	a4,0(a5)
    189a:	d779                	beqz	a4,1868 <strlen+0x18>
    189c:	0017c703          	lbu	a4,1(a5)
    18a0:	0785                	addi	a5,a5,1
    18a2:	d379                	beqz	a4,1868 <strlen+0x18>
    18a4:	0017c703          	lbu	a4,1(a5)
    18a8:	0785                	addi	a5,a5,1
    18aa:	fb6d                	bnez	a4,189c <strlen+0x4c>
    18ac:	bf75                	j	1868 <strlen+0x18>

00000000000018ae <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ae:	00757713          	andi	a4,a0,7
{
    18b2:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18b4:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18b8:	cb19                	beqz	a4,18ce <memchr+0x20>
    18ba:	ce25                	beqz	a2,1932 <memchr+0x84>
    18bc:	0007c703          	lbu	a4,0(a5)
    18c0:	04b70e63          	beq	a4,a1,191c <memchr+0x6e>
    18c4:	0785                	addi	a5,a5,1
    18c6:	0077f713          	andi	a4,a5,7
    18ca:	167d                	addi	a2,a2,-1
    18cc:	f77d                	bnez	a4,18ba <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18ce:	4501                	li	a0,0
    if (n && *s != c)
    18d0:	c235                	beqz	a2,1934 <memchr+0x86>
    18d2:	0007c703          	lbu	a4,0(a5)
    18d6:	04b70363          	beq	a4,a1,191c <memchr+0x6e>
        size_t k = ONES * c;
    18da:	00000517          	auipc	a0,0x0
    18de:	66653503          	ld	a0,1638(a0) # 1f40 <__clone+0xd4>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18e2:	471d                	li	a4,7
        size_t k = ONES * c;
    18e4:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18e8:	02c77a63          	bgeu	a4,a2,191c <memchr+0x6e>
    18ec:	00000897          	auipc	a7,0x0
    18f0:	6448b883          	ld	a7,1604(a7) # 1f30 <__clone+0xc4>
    18f4:	00000817          	auipc	a6,0x0
    18f8:	64483803          	ld	a6,1604(a6) # 1f38 <__clone+0xcc>
    18fc:	431d                	li	t1,7
    18fe:	a029                	j	1908 <memchr+0x5a>
    1900:	1661                	addi	a2,a2,-8
    1902:	07a1                	addi	a5,a5,8
    1904:	02c37963          	bgeu	t1,a2,1936 <memchr+0x88>
    1908:	6398                	ld	a4,0(a5)
    190a:	8f29                	xor	a4,a4,a0
    190c:	011706b3          	add	a3,a4,a7
    1910:	fff74713          	not	a4,a4
    1914:	8f75                	and	a4,a4,a3
    1916:	01077733          	and	a4,a4,a6
    191a:	d37d                	beqz	a4,1900 <memchr+0x52>
    191c:	853e                	mv	a0,a5
    191e:	97b2                	add	a5,a5,a2
    1920:	a021                	j	1928 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1922:	0505                	addi	a0,a0,1
    1924:	00f50763          	beq	a0,a5,1932 <memchr+0x84>
    1928:	00054703          	lbu	a4,0(a0)
    192c:	feb71be3          	bne	a4,a1,1922 <memchr+0x74>
    1930:	8082                	ret
    return n ? (void *)s : 0;
    1932:	4501                	li	a0,0
}
    1934:	8082                	ret
    return n ? (void *)s : 0;
    1936:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1938:	f275                	bnez	a2,191c <memchr+0x6e>
}
    193a:	8082                	ret

000000000000193c <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    193c:	1101                	addi	sp,sp,-32
    193e:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1940:	862e                	mv	a2,a1
{
    1942:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1944:	4581                	li	a1,0
{
    1946:	e426                	sd	s1,8(sp)
    1948:	ec06                	sd	ra,24(sp)
    194a:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    194c:	f63ff0ef          	jal	ra,18ae <memchr>
    return p ? p - s : n;
    1950:	c519                	beqz	a0,195e <strnlen+0x22>
}
    1952:	60e2                	ld	ra,24(sp)
    1954:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1956:	8d05                	sub	a0,a0,s1
}
    1958:	64a2                	ld	s1,8(sp)
    195a:	6105                	addi	sp,sp,32
    195c:	8082                	ret
    195e:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1960:	8522                	mv	a0,s0
}
    1962:	6442                	ld	s0,16(sp)
    1964:	64a2                	ld	s1,8(sp)
    1966:	6105                	addi	sp,sp,32
    1968:	8082                	ret

000000000000196a <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    196a:	00b547b3          	xor	a5,a0,a1
    196e:	8b9d                	andi	a5,a5,7
    1970:	eb95                	bnez	a5,19a4 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1972:	0075f793          	andi	a5,a1,7
    1976:	e7b1                	bnez	a5,19c2 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1978:	6198                	ld	a4,0(a1)
    197a:	00000617          	auipc	a2,0x0
    197e:	5b663603          	ld	a2,1462(a2) # 1f30 <__clone+0xc4>
    1982:	00000817          	auipc	a6,0x0
    1986:	5b683803          	ld	a6,1462(a6) # 1f38 <__clone+0xcc>
    198a:	a029                	j	1994 <strcpy+0x2a>
    198c:	e118                	sd	a4,0(a0)
    198e:	6598                	ld	a4,8(a1)
    1990:	05a1                	addi	a1,a1,8
    1992:	0521                	addi	a0,a0,8
    1994:	00c707b3          	add	a5,a4,a2
    1998:	fff74693          	not	a3,a4
    199c:	8ff5                	and	a5,a5,a3
    199e:	0107f7b3          	and	a5,a5,a6
    19a2:	d7ed                	beqz	a5,198c <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19a4:	0005c783          	lbu	a5,0(a1)
    19a8:	00f50023          	sb	a5,0(a0)
    19ac:	c785                	beqz	a5,19d4 <strcpy+0x6a>
    19ae:	0015c783          	lbu	a5,1(a1)
    19b2:	0505                	addi	a0,a0,1
    19b4:	0585                	addi	a1,a1,1
    19b6:	00f50023          	sb	a5,0(a0)
    19ba:	fbf5                	bnez	a5,19ae <strcpy+0x44>
        ;
    return d;
}
    19bc:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19be:	0505                	addi	a0,a0,1
    19c0:	df45                	beqz	a4,1978 <strcpy+0xe>
            if (!(*d = *s))
    19c2:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19c6:	0585                	addi	a1,a1,1
    19c8:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    19cc:	00f50023          	sb	a5,0(a0)
    19d0:	f7fd                	bnez	a5,19be <strcpy+0x54>
}
    19d2:	8082                	ret
    19d4:	8082                	ret

00000000000019d6 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19d6:	00b547b3          	xor	a5,a0,a1
    19da:	8b9d                	andi	a5,a5,7
    19dc:	1a079863          	bnez	a5,1b8c <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19e0:	0075f793          	andi	a5,a1,7
    19e4:	16078463          	beqz	a5,1b4c <strncpy+0x176>
    19e8:	ea01                	bnez	a2,19f8 <strncpy+0x22>
    19ea:	a421                	j	1bf2 <strncpy+0x21c>
    19ec:	167d                	addi	a2,a2,-1
    19ee:	0505                	addi	a0,a0,1
    19f0:	14070e63          	beqz	a4,1b4c <strncpy+0x176>
    19f4:	1a060863          	beqz	a2,1ba4 <strncpy+0x1ce>
    19f8:	0005c783          	lbu	a5,0(a1)
    19fc:	0585                	addi	a1,a1,1
    19fe:	0075f713          	andi	a4,a1,7
    1a02:	00f50023          	sb	a5,0(a0)
    1a06:	f3fd                	bnez	a5,19ec <strncpy+0x16>
    1a08:	4805                	li	a6,1
    1a0a:	1a061863          	bnez	a2,1bba <strncpy+0x1e4>
    1a0e:	40a007b3          	neg	a5,a0
    1a12:	8b9d                	andi	a5,a5,7
    1a14:	4681                	li	a3,0
    1a16:	18061a63          	bnez	a2,1baa <strncpy+0x1d4>
    1a1a:	00778713          	addi	a4,a5,7
    1a1e:	45ad                	li	a1,11
    1a20:	18b76363          	bltu	a4,a1,1ba6 <strncpy+0x1d0>
    1a24:	1ae6eb63          	bltu	a3,a4,1bda <strncpy+0x204>
    1a28:	1a078363          	beqz	a5,1bce <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a2c:	00050023          	sb	zero,0(a0)
    1a30:	4685                	li	a3,1
    1a32:	00150713          	addi	a4,a0,1
    1a36:	18d78f63          	beq	a5,a3,1bd4 <strncpy+0x1fe>
    1a3a:	000500a3          	sb	zero,1(a0)
    1a3e:	4689                	li	a3,2
    1a40:	00250713          	addi	a4,a0,2
    1a44:	18d78e63          	beq	a5,a3,1be0 <strncpy+0x20a>
    1a48:	00050123          	sb	zero,2(a0)
    1a4c:	468d                	li	a3,3
    1a4e:	00350713          	addi	a4,a0,3
    1a52:	16d78c63          	beq	a5,a3,1bca <strncpy+0x1f4>
    1a56:	000501a3          	sb	zero,3(a0)
    1a5a:	4691                	li	a3,4
    1a5c:	00450713          	addi	a4,a0,4
    1a60:	18d78263          	beq	a5,a3,1be4 <strncpy+0x20e>
    1a64:	00050223          	sb	zero,4(a0)
    1a68:	4695                	li	a3,5
    1a6a:	00550713          	addi	a4,a0,5
    1a6e:	16d78d63          	beq	a5,a3,1be8 <strncpy+0x212>
    1a72:	000502a3          	sb	zero,5(a0)
    1a76:	469d                	li	a3,7
    1a78:	00650713          	addi	a4,a0,6
    1a7c:	16d79863          	bne	a5,a3,1bec <strncpy+0x216>
    1a80:	00750713          	addi	a4,a0,7
    1a84:	00050323          	sb	zero,6(a0)
    1a88:	40f80833          	sub	a6,a6,a5
    1a8c:	ff887593          	andi	a1,a6,-8
    1a90:	97aa                	add	a5,a5,a0
    1a92:	95be                	add	a1,a1,a5
    1a94:	0007b023          	sd	zero,0(a5)
    1a98:	07a1                	addi	a5,a5,8
    1a9a:	feb79de3          	bne	a5,a1,1a94 <strncpy+0xbe>
    1a9e:	ff887593          	andi	a1,a6,-8
    1aa2:	9ead                	addw	a3,a3,a1
    1aa4:	00b707b3          	add	a5,a4,a1
    1aa8:	12b80863          	beq	a6,a1,1bd8 <strncpy+0x202>
    1aac:	00078023          	sb	zero,0(a5)
    1ab0:	0016871b          	addiw	a4,a3,1
    1ab4:	0ec77863          	bgeu	a4,a2,1ba4 <strncpy+0x1ce>
    1ab8:	000780a3          	sb	zero,1(a5)
    1abc:	0026871b          	addiw	a4,a3,2
    1ac0:	0ec77263          	bgeu	a4,a2,1ba4 <strncpy+0x1ce>
    1ac4:	00078123          	sb	zero,2(a5)
    1ac8:	0036871b          	addiw	a4,a3,3
    1acc:	0cc77c63          	bgeu	a4,a2,1ba4 <strncpy+0x1ce>
    1ad0:	000781a3          	sb	zero,3(a5)
    1ad4:	0046871b          	addiw	a4,a3,4
    1ad8:	0cc77663          	bgeu	a4,a2,1ba4 <strncpy+0x1ce>
    1adc:	00078223          	sb	zero,4(a5)
    1ae0:	0056871b          	addiw	a4,a3,5
    1ae4:	0cc77063          	bgeu	a4,a2,1ba4 <strncpy+0x1ce>
    1ae8:	000782a3          	sb	zero,5(a5)
    1aec:	0066871b          	addiw	a4,a3,6
    1af0:	0ac77a63          	bgeu	a4,a2,1ba4 <strncpy+0x1ce>
    1af4:	00078323          	sb	zero,6(a5)
    1af8:	0076871b          	addiw	a4,a3,7
    1afc:	0ac77463          	bgeu	a4,a2,1ba4 <strncpy+0x1ce>
    1b00:	000783a3          	sb	zero,7(a5)
    1b04:	0086871b          	addiw	a4,a3,8
    1b08:	08c77e63          	bgeu	a4,a2,1ba4 <strncpy+0x1ce>
    1b0c:	00078423          	sb	zero,8(a5)
    1b10:	0096871b          	addiw	a4,a3,9
    1b14:	08c77863          	bgeu	a4,a2,1ba4 <strncpy+0x1ce>
    1b18:	000784a3          	sb	zero,9(a5)
    1b1c:	00a6871b          	addiw	a4,a3,10
    1b20:	08c77263          	bgeu	a4,a2,1ba4 <strncpy+0x1ce>
    1b24:	00078523          	sb	zero,10(a5)
    1b28:	00b6871b          	addiw	a4,a3,11
    1b2c:	06c77c63          	bgeu	a4,a2,1ba4 <strncpy+0x1ce>
    1b30:	000785a3          	sb	zero,11(a5)
    1b34:	00c6871b          	addiw	a4,a3,12
    1b38:	06c77663          	bgeu	a4,a2,1ba4 <strncpy+0x1ce>
    1b3c:	00078623          	sb	zero,12(a5)
    1b40:	26b5                	addiw	a3,a3,13
    1b42:	06c6f163          	bgeu	a3,a2,1ba4 <strncpy+0x1ce>
    1b46:	000786a3          	sb	zero,13(a5)
    1b4a:	8082                	ret
            ;
        if (!n || !*s)
    1b4c:	c645                	beqz	a2,1bf4 <strncpy+0x21e>
    1b4e:	0005c783          	lbu	a5,0(a1)
    1b52:	ea078be3          	beqz	a5,1a08 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b56:	479d                	li	a5,7
    1b58:	02c7ff63          	bgeu	a5,a2,1b96 <strncpy+0x1c0>
    1b5c:	00000897          	auipc	a7,0x0
    1b60:	3d48b883          	ld	a7,980(a7) # 1f30 <__clone+0xc4>
    1b64:	00000817          	auipc	a6,0x0
    1b68:	3d483803          	ld	a6,980(a6) # 1f38 <__clone+0xcc>
    1b6c:	431d                	li	t1,7
    1b6e:	6198                	ld	a4,0(a1)
    1b70:	011707b3          	add	a5,a4,a7
    1b74:	fff74693          	not	a3,a4
    1b78:	8ff5                	and	a5,a5,a3
    1b7a:	0107f7b3          	and	a5,a5,a6
    1b7e:	ef81                	bnez	a5,1b96 <strncpy+0x1c0>
            *wd = *ws;
    1b80:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b82:	1661                	addi	a2,a2,-8
    1b84:	05a1                	addi	a1,a1,8
    1b86:	0521                	addi	a0,a0,8
    1b88:	fec363e3          	bltu	t1,a2,1b6e <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b8c:	e609                	bnez	a2,1b96 <strncpy+0x1c0>
    1b8e:	a08d                	j	1bf0 <strncpy+0x21a>
    1b90:	167d                	addi	a2,a2,-1
    1b92:	0505                	addi	a0,a0,1
    1b94:	ca01                	beqz	a2,1ba4 <strncpy+0x1ce>
    1b96:	0005c783          	lbu	a5,0(a1)
    1b9a:	0585                	addi	a1,a1,1
    1b9c:	00f50023          	sb	a5,0(a0)
    1ba0:	fbe5                	bnez	a5,1b90 <strncpy+0x1ba>
        ;
tail:
    1ba2:	b59d                	j	1a08 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1ba4:	8082                	ret
    1ba6:	472d                	li	a4,11
    1ba8:	bdb5                	j	1a24 <strncpy+0x4e>
    1baa:	00778713          	addi	a4,a5,7
    1bae:	45ad                	li	a1,11
    1bb0:	fff60693          	addi	a3,a2,-1
    1bb4:	e6b778e3          	bgeu	a4,a1,1a24 <strncpy+0x4e>
    1bb8:	b7fd                	j	1ba6 <strncpy+0x1d0>
    1bba:	40a007b3          	neg	a5,a0
    1bbe:	8832                	mv	a6,a2
    1bc0:	8b9d                	andi	a5,a5,7
    1bc2:	4681                	li	a3,0
    1bc4:	e4060be3          	beqz	a2,1a1a <strncpy+0x44>
    1bc8:	b7cd                	j	1baa <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bca:	468d                	li	a3,3
    1bcc:	bd75                	j	1a88 <strncpy+0xb2>
    1bce:	872a                	mv	a4,a0
    1bd0:	4681                	li	a3,0
    1bd2:	bd5d                	j	1a88 <strncpy+0xb2>
    1bd4:	4685                	li	a3,1
    1bd6:	bd4d                	j	1a88 <strncpy+0xb2>
    1bd8:	8082                	ret
    1bda:	87aa                	mv	a5,a0
    1bdc:	4681                	li	a3,0
    1bde:	b5f9                	j	1aac <strncpy+0xd6>
    1be0:	4689                	li	a3,2
    1be2:	b55d                	j	1a88 <strncpy+0xb2>
    1be4:	4691                	li	a3,4
    1be6:	b54d                	j	1a88 <strncpy+0xb2>
    1be8:	4695                	li	a3,5
    1bea:	bd79                	j	1a88 <strncpy+0xb2>
    1bec:	4699                	li	a3,6
    1bee:	bd69                	j	1a88 <strncpy+0xb2>
    1bf0:	8082                	ret
    1bf2:	8082                	ret
    1bf4:	8082                	ret

0000000000001bf6 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1bf6:	87aa                	mv	a5,a0
    1bf8:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1bfa:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1bfe:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c02:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c04:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c06:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c0a:	2501                	sext.w	a0,a0
    1c0c:	8082                	ret

0000000000001c0e <openat>:
    register long a7 __asm__("a7") = n;
    1c0e:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c12:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c16:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c1a:	2501                	sext.w	a0,a0
    1c1c:	8082                	ret

0000000000001c1e <close>:
    register long a7 __asm__("a7") = n;
    1c1e:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c22:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c26:	2501                	sext.w	a0,a0
    1c28:	8082                	ret

0000000000001c2a <read>:
    register long a7 __asm__("a7") = n;
    1c2a:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c2e:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c32:	8082                	ret

0000000000001c34 <write>:
    register long a7 __asm__("a7") = n;
    1c34:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c38:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c3c:	8082                	ret

0000000000001c3e <getpid>:
    register long a7 __asm__("a7") = n;
    1c3e:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c42:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c46:	2501                	sext.w	a0,a0
    1c48:	8082                	ret

0000000000001c4a <getppid>:
    register long a7 __asm__("a7") = n;
    1c4a:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c4e:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c52:	2501                	sext.w	a0,a0
    1c54:	8082                	ret

0000000000001c56 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c56:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c5a:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c5e:	2501                	sext.w	a0,a0
    1c60:	8082                	ret

0000000000001c62 <fork>:
    register long a7 __asm__("a7") = n;
    1c62:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c66:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c68:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c6a:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c6e:	2501                	sext.w	a0,a0
    1c70:	8082                	ret

0000000000001c72 <clone>:
// 子进程执行的执行的函数指针 | 函数参数 | 栈地址 | 栈的大小 | 标志位
pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c72:	85b2                	mv	a1,a2
    1c74:	863a                	mv	a2,a4
    if (stack)
    1c76:	c191                	beqz	a1,1c7a <clone+0x8>
	stack += stack_size;
    1c78:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c7a:	4781                	li	a5,0
    1c7c:	4701                	li	a4,0
    1c7e:	4681                	li	a3,0
    1c80:	2601                	sext.w	a2,a2
    1c82:	a2ed                	j	1e6c <__clone>

0000000000001c84 <exit>:
    register long a7 __asm__("a7") = n;
    1c84:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c88:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c8c:	8082                	ret

0000000000001c8e <waitpid>:
    register long a7 __asm__("a7") = n;
    1c8e:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c92:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c94:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c98:	2501                	sext.w	a0,a0
    1c9a:	8082                	ret

0000000000001c9c <exec>:
    register long a7 __asm__("a7") = n;
    1c9c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1ca0:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1ca4:	2501                	sext.w	a0,a0
    1ca6:	8082                	ret

0000000000001ca8 <execve>:
    register long a7 __asm__("a7") = n;
    1ca8:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cac:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cb0:	2501                	sext.w	a0,a0
    1cb2:	8082                	ret

0000000000001cb4 <times>:
    register long a7 __asm__("a7") = n;
    1cb4:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cb8:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cbc:	2501                	sext.w	a0,a0
    1cbe:	8082                	ret

0000000000001cc0 <get_time>:

int64 get_time()
{
    1cc0:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cc2:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cc6:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cc8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cca:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cce:	2501                	sext.w	a0,a0
    1cd0:	ed09                	bnez	a0,1cea <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cd2:	67a2                	ld	a5,8(sp)
    1cd4:	3e800713          	li	a4,1000
    1cd8:	00015503          	lhu	a0,0(sp)
    1cdc:	02e7d7b3          	divu	a5,a5,a4
    1ce0:	02e50533          	mul	a0,a0,a4
    1ce4:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1ce6:	0141                	addi	sp,sp,16
    1ce8:	8082                	ret
        return -1;
    1cea:	557d                	li	a0,-1
    1cec:	bfed                	j	1ce6 <get_time+0x26>

0000000000001cee <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1cee:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cf2:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1cf6:	2501                	sext.w	a0,a0
    1cf8:	8082                	ret

0000000000001cfa <time>:
    register long a7 __asm__("a7") = n;
    1cfa:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1cfe:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d02:	2501                	sext.w	a0,a0
    1d04:	8082                	ret

0000000000001d06 <sleep>:

int sleep(unsigned long long time)
{
    1d06:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d08:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d0a:	850a                	mv	a0,sp
    1d0c:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d0e:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d12:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d14:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d18:	e501                	bnez	a0,1d20 <sleep+0x1a>
    return 0;
    1d1a:	4501                	li	a0,0
}
    1d1c:	0141                	addi	sp,sp,16
    1d1e:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d20:	4502                	lw	a0,0(sp)
}
    1d22:	0141                	addi	sp,sp,16
    1d24:	8082                	ret

0000000000001d26 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d26:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d2a:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d2e:	2501                	sext.w	a0,a0
    1d30:	8082                	ret

0000000000001d32 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d32:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d36:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d3a:	8082                	ret

0000000000001d3c <munmap>:
    register long a7 __asm__("a7") = n;
    1d3c:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d40:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d44:	2501                	sext.w	a0,a0
    1d46:	8082                	ret

0000000000001d48 <wait>:

int wait(int *code)
{
    1d48:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d4a:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d4e:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d50:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d52:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d54:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d58:	2501                	sext.w	a0,a0
    1d5a:	8082                	ret

0000000000001d5c <spawn>:
    register long a7 __asm__("a7") = n;
    1d5c:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d60:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d64:	2501                	sext.w	a0,a0
    1d66:	8082                	ret

0000000000001d68 <mailread>:
    register long a7 __asm__("a7") = n;
    1d68:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d6c:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d70:	2501                	sext.w	a0,a0
    1d72:	8082                	ret

0000000000001d74 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d74:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d78:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d7c:	2501                	sext.w	a0,a0
    1d7e:	8082                	ret

0000000000001d80 <fstat>:
    register long a7 __asm__("a7") = n;
    1d80:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d84:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d88:	2501                	sext.w	a0,a0
    1d8a:	8082                	ret

0000000000001d8c <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d8c:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d8e:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d92:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d94:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d98:	2501                	sext.w	a0,a0
    1d9a:	8082                	ret

0000000000001d9c <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1d9c:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d9e:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1da2:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da4:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1da8:	2501                	sext.w	a0,a0
    1daa:	8082                	ret

0000000000001dac <link>:

int link(char *old_path, char *new_path)
{
    1dac:	87aa                	mv	a5,a0
    1dae:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1db0:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1db4:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1db8:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dba:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1dbe:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dc0:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <unlink>:

int unlink(char *path)
{
    1dc8:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dca:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1dce:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1dd2:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd4:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1dd8:	2501                	sext.w	a0,a0
    1dda:	8082                	ret

0000000000001ddc <uname>:
    register long a7 __asm__("a7") = n;
    1ddc:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1de0:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1de4:	2501                	sext.w	a0,a0
    1de6:	8082                	ret

0000000000001de8 <brk>:
    register long a7 __asm__("a7") = n;
    1de8:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1dec:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <getcwd>:
    register long a7 __asm__("a7") = n;
    1df4:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df6:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1dfa:	8082                	ret

0000000000001dfc <chdir>:
    register long a7 __asm__("a7") = n;
    1dfc:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e00:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e04:	2501                	sext.w	a0,a0
    1e06:	8082                	ret

0000000000001e08 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e08:	862e                	mv	a2,a1
    1e0a:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e0c:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e0e:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e12:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e16:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e18:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e1a:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e1e:	2501                	sext.w	a0,a0
    1e20:	8082                	ret

0000000000001e22 <getdents>:
    register long a7 __asm__("a7") = n;
    1e22:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e26:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	8082                	ret

0000000000001e2e <pipe>:
    register long a7 __asm__("a7") = n;
    1e2e:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e32:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e34:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e38:	2501                	sext.w	a0,a0
    1e3a:	8082                	ret

0000000000001e3c <dup>:
    register long a7 __asm__("a7") = n;
    1e3c:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e3e:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e42:	2501                	sext.w	a0,a0
    1e44:	8082                	ret

0000000000001e46 <dup2>:
    register long a7 __asm__("a7") = n;
    1e46:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e48:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e4a:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e4e:	2501                	sext.w	a0,a0
    1e50:	8082                	ret

0000000000001e52 <mount>:
    register long a7 __asm__("a7") = n;
    1e52:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e56:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e5a:	2501                	sext.w	a0,a0
    1e5c:	8082                	ret

0000000000001e5e <umount>:
    register long a7 __asm__("a7") = n;
    1e5e:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e62:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e64:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e68:	2501                	sext.w	a0,a0
    1e6a:	8082                	ret

0000000000001e6c <__clone>:
.global __clone
.type  __clone, %function
# 函数指针 | 栈地址 | 标志位
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e6c:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e6e:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e70:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e72:	8532                	mv	a0,a2
	mv a2, a4
    1e74:	863a                	mv	a2,a4
	mv a3, a5
    1e76:	86be                	mv	a3,a5
	mv a4, a6
    1e78:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e7a:	0dc00893          	li	a7,220
	ecall
    1e7e:	00000073          	ecall

	beqz a0, 1f
    1e82:	c111                	beqz	a0,1e86 <__clone+0x1a>
	# Parent
	ret
    1e84:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e86:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e88:	6522                	ld	a0,8(sp)
	jalr a1
    1e8a:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e8c:	05d00893          	li	a7,93
	ecall
    1e90:	00000073          	ecall
