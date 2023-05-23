
/home/lzq/Desktop/oscomp/test/build/riscv64/close：     文件格式 elf64-littleriscv


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
    1004:	1101                	add	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	f0250513          	add	a0,a0,-254 # 1f08 <__clone+0x2e>
void test_close(void) {
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    1012:	e426                	sd	s1,8(sp)
    TEST_START(__func__);
    1014:	336000ef          	jal	134a <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	fa050513          	add	a0,a0,-96 # 1fb8 <__func__.0>
    1020:	32a000ef          	jal	134a <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	efc50513          	add	a0,a0,-260 # 1f20 <__clone+0x46>
    102c:	31e000ef          	jal	134a <puts>
    int fd = open("test_close.txt", O_CREATE | O_RDWR);
    1030:	04200593          	li	a1,66
    1034:	00001517          	auipc	a0,0x1
    1038:	efc50513          	add	a0,a0,-260 # 1f30 <__clone+0x56>
    103c:	429000ef          	jal	1c64 <open>
    1040:	842a                	mv	s0,a0
    assert(fd > 0);
    1042:	08a05963          	blez	a0,10d4 <test_close+0xd0>
    const char *str = "  close error.\n";
    int str_len = strlen(str);
    1046:	00001517          	auipc	a0,0x1
    104a:	f1a50513          	add	a0,a0,-230 # 1f60 <__clone+0x86>
    104e:	079000ef          	jal	18c6 <strlen>
    1052:	0005049b          	sext.w	s1,a0
    assert(write(fd, str, str_len) == str_len);
    1056:	8626                	mv	a2,s1
    1058:	00001597          	auipc	a1,0x1
    105c:	f0858593          	add	a1,a1,-248 # 1f60 <__clone+0x86>
    1060:	8522                	mv	a0,s0
    1062:	441000ef          	jal	1ca2 <write>
    1066:	00950863          	beq	a0,s1,1076 <test_close+0x72>
    106a:	00001517          	auipc	a0,0x1
    106e:	ed650513          	add	a0,a0,-298 # 1f40 <__clone+0x66>
    1072:	574000ef          	jal	15e6 <panic>
    write(fd, str, str_len);
    1076:	8626                	mv	a2,s1
    1078:	00001597          	auipc	a1,0x1
    107c:	ee858593          	add	a1,a1,-280 # 1f60 <__clone+0x86>
    1080:	8522                	mv	a0,s0
    1082:	421000ef          	jal	1ca2 <write>
    int rt = close(fd);	
    1086:	8522                	mv	a0,s0
    1088:	405000ef          	jal	1c8c <close>
    assert(rt == 0);
    108c:	ed0d                	bnez	a0,10c6 <test_close+0xc2>
    printf("  close %d success.\n", fd);
    108e:	85a2                	mv	a1,s0
    1090:	00001517          	auipc	a0,0x1
    1094:	ee050513          	add	a0,a0,-288 # 1f70 <__clone+0x96>
    1098:	2d4000ef          	jal	136c <printf>
	
    TEST_END(__func__);
    109c:	00001517          	auipc	a0,0x1
    10a0:	eec50513          	add	a0,a0,-276 # 1f88 <__clone+0xae>
    10a4:	2a6000ef          	jal	134a <puts>
    10a8:	00001517          	auipc	a0,0x1
    10ac:	f1050513          	add	a0,a0,-240 # 1fb8 <__func__.0>
    10b0:	29a000ef          	jal	134a <puts>
}
    10b4:	6442                	ld	s0,16(sp)
    10b6:	60e2                	ld	ra,24(sp)
    10b8:	64a2                	ld	s1,8(sp)
    TEST_END(__func__);
    10ba:	00001517          	auipc	a0,0x1
    10be:	e6650513          	add	a0,a0,-410 # 1f20 <__clone+0x46>
}
    10c2:	6105                	add	sp,sp,32
    TEST_END(__func__);
    10c4:	a459                	j	134a <puts>
    assert(rt == 0);
    10c6:	00001517          	auipc	a0,0x1
    10ca:	e7a50513          	add	a0,a0,-390 # 1f40 <__clone+0x66>
    10ce:	518000ef          	jal	15e6 <panic>
    10d2:	bf75                	j	108e <test_close+0x8a>
    assert(fd > 0);
    10d4:	00001517          	auipc	a0,0x1
    10d8:	e6c50513          	add	a0,a0,-404 # 1f40 <__clone+0x66>
    10dc:	50a000ef          	jal	15e6 <panic>
    10e0:	b79d                	j	1046 <test_close+0x42>

00000000000010e2 <main>:

int main(void) {
    10e2:	1141                	add	sp,sp,-16
    10e4:	e406                	sd	ra,8(sp)
    test_close();
    10e6:	f1fff0ef          	jal	1004 <test_close>
    return 0;
}
    10ea:	60a2                	ld	ra,8(sp)
    10ec:	4501                	li	a0,0
    10ee:	0141                	add	sp,sp,16
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
    10f6:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10f8:	05a1                	add	a1,a1,8
{
    10fa:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10fc:	fe7ff0ef          	jal	10e2 <main>
    1100:	3f3000ef          	jal	1cf2 <exit>
	return 0;
}
    1104:	60a2                	ld	ra,8(sp)
    1106:	4501                	li	a0,0
    1108:	0141                	add	sp,sp,16
    110a:	8082                	ret

000000000000110c <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    110c:	7179                	add	sp,sp,-48
    110e:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1110:	12054863          	bltz	a0,1240 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1114:	02b577bb          	remuw	a5,a0,a1
    1118:	00001697          	auipc	a3,0x1
    111c:	eb068693          	add	a3,a3,-336 # 1fc8 <digits>
    buf[16] = 0;
    1120:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1124:	0005871b          	sext.w	a4,a1
    1128:	1782                	sll	a5,a5,0x20
    112a:	9381                	srl	a5,a5,0x20
    112c:	97b6                	add	a5,a5,a3
    112e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1132:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1136:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    113a:	1ab56663          	bltu	a0,a1,12e6 <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    113e:	02e8763b          	remuw	a2,a6,a4
    1142:	1602                	sll	a2,a2,0x20
    1144:	9201                	srl	a2,a2,0x20
    1146:	9636                	add	a2,a2,a3
    1148:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    114c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1150:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1154:	12e86c63          	bltu	a6,a4,128c <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1158:	02e5f63b          	remuw	a2,a1,a4
    115c:	1602                	sll	a2,a2,0x20
    115e:	9201                	srl	a2,a2,0x20
    1160:	9636                	add	a2,a2,a3
    1162:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1166:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    116a:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    116e:	12e5e863          	bltu	a1,a4,129e <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1172:	02e8763b          	remuw	a2,a6,a4
    1176:	1602                	sll	a2,a2,0x20
    1178:	9201                	srl	a2,a2,0x20
    117a:	9636                	add	a2,a2,a3
    117c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1180:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1184:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1188:	12e86463          	bltu	a6,a4,12b0 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    118c:	02e5f63b          	remuw	a2,a1,a4
    1190:	1602                	sll	a2,a2,0x20
    1192:	9201                	srl	a2,a2,0x20
    1194:	9636                	add	a2,a2,a3
    1196:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    119a:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    119e:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11a2:	12e5e063          	bltu	a1,a4,12c2 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    11a6:	02e8763b          	remuw	a2,a6,a4
    11aa:	1602                	sll	a2,a2,0x20
    11ac:	9201                	srl	a2,a2,0x20
    11ae:	9636                	add	a2,a2,a3
    11b0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b4:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11b8:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11bc:	0ae86f63          	bltu	a6,a4,127a <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    11c0:	02e5f63b          	remuw	a2,a1,a4
    11c4:	1602                	sll	a2,a2,0x20
    11c6:	9201                	srl	a2,a2,0x20
    11c8:	9636                	add	a2,a2,a3
    11ca:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ce:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11d2:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11d6:	0ee5ef63          	bltu	a1,a4,12d4 <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    11da:	02e8763b          	remuw	a2,a6,a4
    11de:	1602                	sll	a2,a2,0x20
    11e0:	9201                	srl	a2,a2,0x20
    11e2:	9636                	add	a2,a2,a3
    11e4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11e8:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11ec:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11f0:	0ee86d63          	bltu	a6,a4,12ea <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    11f4:	02e5f63b          	remuw	a2,a1,a4
    11f8:	1602                	sll	a2,a2,0x20
    11fa:	9201                	srl	a2,a2,0x20
    11fc:	9636                	add	a2,a2,a3
    11fe:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1202:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1206:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    120a:	0ee5e963          	bltu	a1,a4,12fc <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    120e:	1782                	sll	a5,a5,0x20
    1210:	9381                	srl	a5,a5,0x20
    1212:	96be                	add	a3,a3,a5
    1214:	0006c783          	lbu	a5,0(a3)
    1218:	4599                	li	a1,6
    121a:	00f10723          	sb	a5,14(sp)

    if (sign)
    121e:	00055763          	bgez	a0,122c <printint.constprop.0+0x120>
        buf[i--] = '-';
    1222:	02d00793          	li	a5,45
    1226:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    122a:	4595                	li	a1,5
    write(f, s, l);
    122c:	003c                	add	a5,sp,8
    122e:	4641                	li	a2,16
    1230:	9e0d                	subw	a2,a2,a1
    1232:	4505                	li	a0,1
    1234:	95be                	add	a1,a1,a5
    1236:	26d000ef          	jal	1ca2 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    123a:	70a2                	ld	ra,40(sp)
    123c:	6145                	add	sp,sp,48
    123e:	8082                	ret
        x = -xx;
    1240:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1244:	02b677bb          	remuw	a5,a2,a1
    1248:	00001697          	auipc	a3,0x1
    124c:	d8068693          	add	a3,a3,-640 # 1fc8 <digits>
    buf[16] = 0;
    1250:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1254:	0005871b          	sext.w	a4,a1
    1258:	1782                	sll	a5,a5,0x20
    125a:	9381                	srl	a5,a5,0x20
    125c:	97b6                	add	a5,a5,a3
    125e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1262:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1266:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    126a:	ecb67ae3          	bgeu	a2,a1,113e <printint.constprop.0+0x32>
        buf[i--] = '-';
    126e:	02d00793          	li	a5,45
    1272:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1276:	45b9                	li	a1,14
    1278:	bf55                	j	122c <printint.constprop.0+0x120>
    127a:	45a9                	li	a1,10
    if (sign)
    127c:	fa0558e3          	bgez	a0,122c <printint.constprop.0+0x120>
        buf[i--] = '-';
    1280:	02d00793          	li	a5,45
    1284:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    1288:	45a5                	li	a1,9
    128a:	b74d                	j	122c <printint.constprop.0+0x120>
    128c:	45b9                	li	a1,14
    if (sign)
    128e:	f8055fe3          	bgez	a0,122c <printint.constprop.0+0x120>
        buf[i--] = '-';
    1292:	02d00793          	li	a5,45
    1296:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    129a:	45b5                	li	a1,13
    129c:	bf41                	j	122c <printint.constprop.0+0x120>
    129e:	45b5                	li	a1,13
    if (sign)
    12a0:	f80556e3          	bgez	a0,122c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12a4:	02d00793          	li	a5,45
    12a8:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    12ac:	45b1                	li	a1,12
    12ae:	bfbd                	j	122c <printint.constprop.0+0x120>
    12b0:	45b1                	li	a1,12
    if (sign)
    12b2:	f6055de3          	bgez	a0,122c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12b6:	02d00793          	li	a5,45
    12ba:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    12be:	45ad                	li	a1,11
    12c0:	b7b5                	j	122c <printint.constprop.0+0x120>
    12c2:	45ad                	li	a1,11
    if (sign)
    12c4:	f60554e3          	bgez	a0,122c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12c8:	02d00793          	li	a5,45
    12cc:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12d0:	45a9                	li	a1,10
    12d2:	bfa9                	j	122c <printint.constprop.0+0x120>
    12d4:	45a5                	li	a1,9
    if (sign)
    12d6:	f4055be3          	bgez	a0,122c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12da:	02d00793          	li	a5,45
    12de:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12e2:	45a1                	li	a1,8
    12e4:	b7a1                	j	122c <printint.constprop.0+0x120>
    i = 15;
    12e6:	45bd                	li	a1,15
    12e8:	b791                	j	122c <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    12ea:	45a1                	li	a1,8
    if (sign)
    12ec:	f40550e3          	bgez	a0,122c <printint.constprop.0+0x120>
        buf[i--] = '-';
    12f0:	02d00793          	li	a5,45
    12f4:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12f8:	459d                	li	a1,7
    12fa:	bf0d                	j	122c <printint.constprop.0+0x120>
    12fc:	459d                	li	a1,7
    if (sign)
    12fe:	f20557e3          	bgez	a0,122c <printint.constprop.0+0x120>
        buf[i--] = '-';
    1302:	02d00793          	li	a5,45
    1306:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    130a:	4599                	li	a1,6
    130c:	b705                	j	122c <printint.constprop.0+0x120>

000000000000130e <getchar>:
{
    130e:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    1310:	00f10593          	add	a1,sp,15
    1314:	4605                	li	a2,1
    1316:	4501                	li	a0,0
{
    1318:	ec06                	sd	ra,24(sp)
    char byte = 0;
    131a:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    131e:	17b000ef          	jal	1c98 <read>
}
    1322:	60e2                	ld	ra,24(sp)
    1324:	00f14503          	lbu	a0,15(sp)
    1328:	6105                	add	sp,sp,32
    132a:	8082                	ret

000000000000132c <putchar>:
{
    132c:	1101                	add	sp,sp,-32
    132e:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1330:	00f10593          	add	a1,sp,15
    1334:	4605                	li	a2,1
    1336:	4505                	li	a0,1
{
    1338:	ec06                	sd	ra,24(sp)
    char byte = c;
    133a:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    133e:	165000ef          	jal	1ca2 <write>
}
    1342:	60e2                	ld	ra,24(sp)
    1344:	2501                	sext.w	a0,a0
    1346:	6105                	add	sp,sp,32
    1348:	8082                	ret

000000000000134a <puts>:
{
    134a:	1141                	add	sp,sp,-16
    134c:	e406                	sd	ra,8(sp)
    134e:	e022                	sd	s0,0(sp)
    1350:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1352:	574000ef          	jal	18c6 <strlen>
    1356:	862a                	mv	a2,a0
    1358:	85a2                	mv	a1,s0
    135a:	4505                	li	a0,1
    135c:	147000ef          	jal	1ca2 <write>
}
    1360:	60a2                	ld	ra,8(sp)
    1362:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1364:	957d                	sra	a0,a0,0x3f
    return r;
    1366:	2501                	sext.w	a0,a0
}
    1368:	0141                	add	sp,sp,16
    136a:	8082                	ret

000000000000136c <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    136c:	7171                	add	sp,sp,-176
    136e:	f85a                	sd	s6,48(sp)
    1370:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1372:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1374:	18bc                	add	a5,sp,120
{
    1376:	e8ca                	sd	s2,80(sp)
    1378:	e4ce                	sd	s3,72(sp)
    137a:	e0d2                	sd	s4,64(sp)
    137c:	fc56                	sd	s5,56(sp)
    137e:	f486                	sd	ra,104(sp)
    1380:	f0a2                	sd	s0,96(sp)
    1382:	eca6                	sd	s1,88(sp)
    1384:	fcae                	sd	a1,120(sp)
    1386:	e132                	sd	a2,128(sp)
    1388:	e536                	sd	a3,136(sp)
    138a:	e93a                	sd	a4,144(sp)
    138c:	f142                	sd	a6,160(sp)
    138e:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1390:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1392:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1396:	07300a13          	li	s4,115
    139a:	07800a93          	li	s5,120
    buf[i++] = '0';
    139e:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13a2:	00001997          	auipc	s3,0x1
    13a6:	c2698993          	add	s3,s3,-986 # 1fc8 <digits>
        if (!*s)
    13aa:	00054783          	lbu	a5,0(a0)
    13ae:	16078a63          	beqz	a5,1522 <printf+0x1b6>
    13b2:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    13b4:	19278d63          	beq	a5,s2,154e <printf+0x1e2>
    13b8:	00164783          	lbu	a5,1(a2)
    13bc:	0605                	add	a2,a2,1
    13be:	fbfd                	bnez	a5,13b4 <printf+0x48>
    13c0:	84b2                	mv	s1,a2
        l = z - a;
    13c2:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    13c6:	85aa                	mv	a1,a0
    13c8:	8622                	mv	a2,s0
    13ca:	4505                	li	a0,1
    13cc:	0d7000ef          	jal	1ca2 <write>
        if (l)
    13d0:	1a041463          	bnez	s0,1578 <printf+0x20c>
        if (s[1] == 0)
    13d4:	0014c783          	lbu	a5,1(s1)
    13d8:	14078563          	beqz	a5,1522 <printf+0x1b6>
        switch (s[1])
    13dc:	1b478063          	beq	a5,s4,157c <printf+0x210>
    13e0:	14fa6b63          	bltu	s4,a5,1536 <printf+0x1ca>
    13e4:	06400713          	li	a4,100
    13e8:	1ee78063          	beq	a5,a4,15c8 <printf+0x25c>
    13ec:	07000713          	li	a4,112
    13f0:	1ae79963          	bne	a5,a4,15a2 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13f4:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13f6:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13fa:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13fc:	631c                	ld	a5,0(a4)
    13fe:	0721                	add	a4,a4,8
    1400:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1402:	00479293          	sll	t0,a5,0x4
    1406:	00879f93          	sll	t6,a5,0x8
    140a:	00c79f13          	sll	t5,a5,0xc
    140e:	01079e93          	sll	t4,a5,0x10
    1412:	01479e13          	sll	t3,a5,0x14
    1416:	01879313          	sll	t1,a5,0x18
    141a:	01c79893          	sll	a7,a5,0x1c
    141e:	02479813          	sll	a6,a5,0x24
    1422:	02879513          	sll	a0,a5,0x28
    1426:	02c79593          	sll	a1,a5,0x2c
    142a:	03079693          	sll	a3,a5,0x30
    142e:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1432:	03c7d413          	srl	s0,a5,0x3c
    1436:	01c7d39b          	srlw	t2,a5,0x1c
    143a:	03c2d293          	srl	t0,t0,0x3c
    143e:	03cfdf93          	srl	t6,t6,0x3c
    1442:	03cf5f13          	srl	t5,t5,0x3c
    1446:	03cede93          	srl	t4,t4,0x3c
    144a:	03ce5e13          	srl	t3,t3,0x3c
    144e:	03c35313          	srl	t1,t1,0x3c
    1452:	03c8d893          	srl	a7,a7,0x3c
    1456:	03c85813          	srl	a6,a6,0x3c
    145a:	9171                	srl	a0,a0,0x3c
    145c:	91f1                	srl	a1,a1,0x3c
    145e:	92f1                	srl	a3,a3,0x3c
    1460:	9371                	srl	a4,a4,0x3c
    1462:	96ce                	add	a3,a3,s3
    1464:	974e                	add	a4,a4,s3
    1466:	944e                	add	s0,s0,s3
    1468:	92ce                	add	t0,t0,s3
    146a:	9fce                	add	t6,t6,s3
    146c:	9f4e                	add	t5,t5,s3
    146e:	9ece                	add	t4,t4,s3
    1470:	9e4e                	add	t3,t3,s3
    1472:	934e                	add	t1,t1,s3
    1474:	98ce                	add	a7,a7,s3
    1476:	93ce                	add	t2,t2,s3
    1478:	984e                	add	a6,a6,s3
    147a:	954e                	add	a0,a0,s3
    147c:	95ce                	add	a1,a1,s3
    147e:	0006c083          	lbu	ra,0(a3)
    1482:	0002c283          	lbu	t0,0(t0)
    1486:	00074683          	lbu	a3,0(a4)
    148a:	000fcf83          	lbu	t6,0(t6)
    148e:	000f4f03          	lbu	t5,0(t5)
    1492:	000ece83          	lbu	t4,0(t4)
    1496:	000e4e03          	lbu	t3,0(t3)
    149a:	00034303          	lbu	t1,0(t1)
    149e:	0008c883          	lbu	a7,0(a7)
    14a2:	0003c383          	lbu	t2,0(t2)
    14a6:	00084803          	lbu	a6,0(a6)
    14aa:	00054503          	lbu	a0,0(a0)
    14ae:	0005c583          	lbu	a1,0(a1)
    14b2:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14b6:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ba:	9371                	srl	a4,a4,0x3c
    14bc:	8bbd                	and	a5,a5,15
    14be:	974e                	add	a4,a4,s3
    14c0:	97ce                	add	a5,a5,s3
    14c2:	005105a3          	sb	t0,11(sp)
    14c6:	01f10623          	sb	t6,12(sp)
    14ca:	01e106a3          	sb	t5,13(sp)
    14ce:	01d10723          	sb	t4,14(sp)
    14d2:	01c107a3          	sb	t3,15(sp)
    14d6:	00610823          	sb	t1,16(sp)
    14da:	011108a3          	sb	a7,17(sp)
    14de:	00710923          	sb	t2,18(sp)
    14e2:	010109a3          	sb	a6,19(sp)
    14e6:	00a10a23          	sb	a0,20(sp)
    14ea:	00b10aa3          	sb	a1,21(sp)
    14ee:	00110b23          	sb	ra,22(sp)
    14f2:	00d10ba3          	sb	a3,23(sp)
    14f6:	00810523          	sb	s0,10(sp)
    14fa:	00074703          	lbu	a4,0(a4)
    14fe:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1502:	002c                	add	a1,sp,8
    1504:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1506:	00e10c23          	sb	a4,24(sp)
    150a:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    150e:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1512:	790000ef          	jal	1ca2 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1516:	00248513          	add	a0,s1,2
        if (!*s)
    151a:	00054783          	lbu	a5,0(a0)
    151e:	e8079ae3          	bnez	a5,13b2 <printf+0x46>
    }
    va_end(ap);
}
    1522:	70a6                	ld	ra,104(sp)
    1524:	7406                	ld	s0,96(sp)
    1526:	64e6                	ld	s1,88(sp)
    1528:	6946                	ld	s2,80(sp)
    152a:	69a6                	ld	s3,72(sp)
    152c:	6a06                	ld	s4,64(sp)
    152e:	7ae2                	ld	s5,56(sp)
    1530:	7b42                	ld	s6,48(sp)
    1532:	614d                	add	sp,sp,176
    1534:	8082                	ret
        switch (s[1])
    1536:	07579663          	bne	a5,s5,15a2 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    153a:	6782                	ld	a5,0(sp)
    153c:	45c1                	li	a1,16
    153e:	4388                	lw	a0,0(a5)
    1540:	07a1                	add	a5,a5,8
    1542:	e03e                	sd	a5,0(sp)
    1544:	bc9ff0ef          	jal	110c <printint.constprop.0>
        s += 2;
    1548:	00248513          	add	a0,s1,2
    154c:	b7f9                	j	151a <printf+0x1ae>
    154e:	84b2                	mv	s1,a2
    1550:	a039                	j	155e <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1552:	0024c783          	lbu	a5,2(s1)
    1556:	0605                	add	a2,a2,1
    1558:	0489                	add	s1,s1,2
    155a:	e72794e3          	bne	a5,s2,13c2 <printf+0x56>
    155e:	0014c783          	lbu	a5,1(s1)
    1562:	ff2788e3          	beq	a5,s2,1552 <printf+0x1e6>
        l = z - a;
    1566:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    156a:	85aa                	mv	a1,a0
    156c:	8622                	mv	a2,s0
    156e:	4505                	li	a0,1
    1570:	732000ef          	jal	1ca2 <write>
        if (l)
    1574:	e60400e3          	beqz	s0,13d4 <printf+0x68>
    1578:	8526                	mv	a0,s1
    157a:	bd05                	j	13aa <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    157c:	6782                	ld	a5,0(sp)
    157e:	6380                	ld	s0,0(a5)
    1580:	07a1                	add	a5,a5,8
    1582:	e03e                	sd	a5,0(sp)
    1584:	cc21                	beqz	s0,15dc <printf+0x270>
            l = strnlen(a, 200);
    1586:	0c800593          	li	a1,200
    158a:	8522                	mv	a0,s0
    158c:	424000ef          	jal	19b0 <strnlen>
    write(f, s, l);
    1590:	0005061b          	sext.w	a2,a0
    1594:	85a2                	mv	a1,s0
    1596:	4505                	li	a0,1
    1598:	70a000ef          	jal	1ca2 <write>
        s += 2;
    159c:	00248513          	add	a0,s1,2
    15a0:	bfad                	j	151a <printf+0x1ae>
    return write(stdout, &byte, 1);
    15a2:	4605                	li	a2,1
    15a4:	002c                	add	a1,sp,8
    15a6:	4505                	li	a0,1
    char byte = c;
    15a8:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    15ac:	6f6000ef          	jal	1ca2 <write>
    char byte = c;
    15b0:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    15b4:	4605                	li	a2,1
    15b6:	002c                	add	a1,sp,8
    15b8:	4505                	li	a0,1
    char byte = c;
    15ba:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    15be:	6e4000ef          	jal	1ca2 <write>
        s += 2;
    15c2:	00248513          	add	a0,s1,2
    15c6:	bf91                	j	151a <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    15c8:	6782                	ld	a5,0(sp)
    15ca:	45a9                	li	a1,10
    15cc:	4388                	lw	a0,0(a5)
    15ce:	07a1                	add	a5,a5,8
    15d0:	e03e                	sd	a5,0(sp)
    15d2:	b3bff0ef          	jal	110c <printint.constprop.0>
        s += 2;
    15d6:	00248513          	add	a0,s1,2
    15da:	b781                	j	151a <printf+0x1ae>
                a = "(null)";
    15dc:	00001417          	auipc	s0,0x1
    15e0:	9bc40413          	add	s0,s0,-1604 # 1f98 <__clone+0xbe>
    15e4:	b74d                	j	1586 <printf+0x21a>

00000000000015e6 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15e6:	1141                	add	sp,sp,-16
    15e8:	e406                	sd	ra,8(sp)
    puts(m);
    15ea:	d61ff0ef          	jal	134a <puts>
    exit(-100);
}
    15ee:	60a2                	ld	ra,8(sp)
    exit(-100);
    15f0:	f9c00513          	li	a0,-100
}
    15f4:	0141                	add	sp,sp,16
    exit(-100);
    15f6:	adf5                	j	1cf2 <exit>

00000000000015f8 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f8:	02000793          	li	a5,32
    15fc:	00f50663          	beq	a0,a5,1608 <isspace+0x10>
    1600:	355d                	addw	a0,a0,-9
    1602:	00553513          	sltiu	a0,a0,5
    1606:	8082                	ret
    1608:	4505                	li	a0,1
}
    160a:	8082                	ret

000000000000160c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    160c:	fd05051b          	addw	a0,a0,-48
}
    1610:	00a53513          	sltiu	a0,a0,10
    1614:	8082                	ret

0000000000001616 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1616:	02000693          	li	a3,32
    161a:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    161c:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1620:	ff77871b          	addw	a4,a5,-9
    1624:	04d78c63          	beq	a5,a3,167c <atoi+0x66>
    1628:	0007861b          	sext.w	a2,a5
    162c:	04e5f863          	bgeu	a1,a4,167c <atoi+0x66>
        s++;
    switch (*s)
    1630:	02b00713          	li	a4,43
    1634:	04e78963          	beq	a5,a4,1686 <atoi+0x70>
    1638:	02d00713          	li	a4,45
    163c:	06e78263          	beq	a5,a4,16a0 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1640:	fd06069b          	addw	a3,a2,-48
    1644:	47a5                	li	a5,9
    1646:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    1648:	4301                	li	t1,0
    while (isdigit(*s))
    164a:	04d7e963          	bltu	a5,a3,169c <atoi+0x86>
    int n = 0, neg = 0;
    164e:	4501                	li	a0,0
    while (isdigit(*s))
    1650:	48a5                	li	a7,9
    1652:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    1656:	0025179b          	sllw	a5,a0,0x2
    165a:	9fa9                	addw	a5,a5,a0
    165c:	fd06059b          	addw	a1,a2,-48
    1660:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    1664:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    1668:	0705                	add	a4,a4,1
    166a:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    166e:	0006861b          	sext.w	a2,a3
    1672:	ff08f0e3          	bgeu	a7,a6,1652 <atoi+0x3c>
    return neg ? n : -n;
    1676:	00030563          	beqz	t1,1680 <atoi+0x6a>
}
    167a:	8082                	ret
        s++;
    167c:	0505                	add	a0,a0,1
    167e:	bf79                	j	161c <atoi+0x6>
    return neg ? n : -n;
    1680:	40f5853b          	subw	a0,a1,a5
    1684:	8082                	ret
    while (isdigit(*s))
    1686:	00154603          	lbu	a2,1(a0)
    168a:	47a5                	li	a5,9
        s++;
    168c:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1690:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    1694:	4301                	li	t1,0
    while (isdigit(*s))
    1696:	2601                	sext.w	a2,a2
    1698:	fad7fbe3          	bgeu	a5,a3,164e <atoi+0x38>
    169c:	4501                	li	a0,0
}
    169e:	8082                	ret
    while (isdigit(*s))
    16a0:	00154603          	lbu	a2,1(a0)
    16a4:	47a5                	li	a5,9
        s++;
    16a6:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    16aa:	fd06069b          	addw	a3,a2,-48
    16ae:	2601                	sext.w	a2,a2
    16b0:	fed7e6e3          	bltu	a5,a3,169c <atoi+0x86>
        neg = 1;
    16b4:	4305                	li	t1,1
    16b6:	bf61                	j	164e <atoi+0x38>

00000000000016b8 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    16b8:	18060163          	beqz	a2,183a <memset+0x182>
    16bc:	40a006b3          	neg	a3,a0
    16c0:	0076f793          	and	a5,a3,7
    16c4:	00778813          	add	a6,a5,7
    16c8:	48ad                	li	a7,11
    16ca:	0ff5f713          	zext.b	a4,a1
    16ce:	fff60593          	add	a1,a2,-1
    16d2:	17186563          	bltu	a6,a7,183c <memset+0x184>
    16d6:	1705ed63          	bltu	a1,a6,1850 <memset+0x198>
    16da:	16078363          	beqz	a5,1840 <memset+0x188>
    16de:	00e50023          	sb	a4,0(a0)
    16e2:	0066f593          	and	a1,a3,6
    16e6:	16058063          	beqz	a1,1846 <memset+0x18e>
    16ea:	00e500a3          	sb	a4,1(a0)
    16ee:	4589                	li	a1,2
    16f0:	16f5f363          	bgeu	a1,a5,1856 <memset+0x19e>
    16f4:	00e50123          	sb	a4,2(a0)
    16f8:	8a91                	and	a3,a3,4
    16fa:	00350593          	add	a1,a0,3
    16fe:	4e0d                	li	t3,3
    1700:	ce9d                	beqz	a3,173e <memset+0x86>
    1702:	00e501a3          	sb	a4,3(a0)
    1706:	4691                	li	a3,4
    1708:	00450593          	add	a1,a0,4
    170c:	4e11                	li	t3,4
    170e:	02f6f863          	bgeu	a3,a5,173e <memset+0x86>
    1712:	00e50223          	sb	a4,4(a0)
    1716:	4695                	li	a3,5
    1718:	00550593          	add	a1,a0,5
    171c:	4e15                	li	t3,5
    171e:	02d78063          	beq	a5,a3,173e <memset+0x86>
    1722:	fff50693          	add	a3,a0,-1
    1726:	00e502a3          	sb	a4,5(a0)
    172a:	8a9d                	and	a3,a3,7
    172c:	00650593          	add	a1,a0,6
    1730:	4e19                	li	t3,6
    1732:	e691                	bnez	a3,173e <memset+0x86>
    1734:	00750593          	add	a1,a0,7
    1738:	00e50323          	sb	a4,6(a0)
    173c:	4e1d                	li	t3,7
    173e:	00871693          	sll	a3,a4,0x8
    1742:	01071813          	sll	a6,a4,0x10
    1746:	8ed9                	or	a3,a3,a4
    1748:	01871893          	sll	a7,a4,0x18
    174c:	0106e6b3          	or	a3,a3,a6
    1750:	0116e6b3          	or	a3,a3,a7
    1754:	02071813          	sll	a6,a4,0x20
    1758:	02871313          	sll	t1,a4,0x28
    175c:	0106e6b3          	or	a3,a3,a6
    1760:	40f608b3          	sub	a7,a2,a5
    1764:	03071813          	sll	a6,a4,0x30
    1768:	0066e6b3          	or	a3,a3,t1
    176c:	0106e6b3          	or	a3,a3,a6
    1770:	03871313          	sll	t1,a4,0x38
    1774:	97aa                	add	a5,a5,a0
    1776:	ff88f813          	and	a6,a7,-8
    177a:	0066e6b3          	or	a3,a3,t1
    177e:	983e                	add	a6,a6,a5
    1780:	e394                	sd	a3,0(a5)
    1782:	07a1                	add	a5,a5,8
    1784:	ff079ee3          	bne	a5,a6,1780 <memset+0xc8>
    1788:	ff88f793          	and	a5,a7,-8
    178c:	0078f893          	and	a7,a7,7
    1790:	00f586b3          	add	a3,a1,a5
    1794:	01c787bb          	addw	a5,a5,t3
    1798:	0a088b63          	beqz	a7,184e <memset+0x196>
    179c:	00e68023          	sb	a4,0(a3)
    17a0:	0017859b          	addw	a1,a5,1
    17a4:	08c5fb63          	bgeu	a1,a2,183a <memset+0x182>
    17a8:	00e680a3          	sb	a4,1(a3)
    17ac:	0027859b          	addw	a1,a5,2
    17b0:	08c5f563          	bgeu	a1,a2,183a <memset+0x182>
    17b4:	00e68123          	sb	a4,2(a3)
    17b8:	0037859b          	addw	a1,a5,3
    17bc:	06c5ff63          	bgeu	a1,a2,183a <memset+0x182>
    17c0:	00e681a3          	sb	a4,3(a3)
    17c4:	0047859b          	addw	a1,a5,4
    17c8:	06c5f963          	bgeu	a1,a2,183a <memset+0x182>
    17cc:	00e68223          	sb	a4,4(a3)
    17d0:	0057859b          	addw	a1,a5,5
    17d4:	06c5f363          	bgeu	a1,a2,183a <memset+0x182>
    17d8:	00e682a3          	sb	a4,5(a3)
    17dc:	0067859b          	addw	a1,a5,6
    17e0:	04c5fd63          	bgeu	a1,a2,183a <memset+0x182>
    17e4:	00e68323          	sb	a4,6(a3)
    17e8:	0077859b          	addw	a1,a5,7
    17ec:	04c5f763          	bgeu	a1,a2,183a <memset+0x182>
    17f0:	00e683a3          	sb	a4,7(a3)
    17f4:	0087859b          	addw	a1,a5,8
    17f8:	04c5f163          	bgeu	a1,a2,183a <memset+0x182>
    17fc:	00e68423          	sb	a4,8(a3)
    1800:	0097859b          	addw	a1,a5,9
    1804:	02c5fb63          	bgeu	a1,a2,183a <memset+0x182>
    1808:	00e684a3          	sb	a4,9(a3)
    180c:	00a7859b          	addw	a1,a5,10
    1810:	02c5f563          	bgeu	a1,a2,183a <memset+0x182>
    1814:	00e68523          	sb	a4,10(a3)
    1818:	00b7859b          	addw	a1,a5,11
    181c:	00c5ff63          	bgeu	a1,a2,183a <memset+0x182>
    1820:	00e685a3          	sb	a4,11(a3)
    1824:	00c7859b          	addw	a1,a5,12
    1828:	00c5f963          	bgeu	a1,a2,183a <memset+0x182>
    182c:	00e68623          	sb	a4,12(a3)
    1830:	27b5                	addw	a5,a5,13
    1832:	00c7f463          	bgeu	a5,a2,183a <memset+0x182>
    1836:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    183a:	8082                	ret
    183c:	482d                	li	a6,11
    183e:	bd61                	j	16d6 <memset+0x1e>
    char *p = dest;
    1840:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1842:	4e01                	li	t3,0
    1844:	bded                	j	173e <memset+0x86>
    1846:	00150593          	add	a1,a0,1
    184a:	4e05                	li	t3,1
    184c:	bdcd                	j	173e <memset+0x86>
    184e:	8082                	ret
    char *p = dest;
    1850:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1852:	4781                	li	a5,0
    1854:	b7a1                	j	179c <memset+0xe4>
    1856:	00250593          	add	a1,a0,2
    185a:	4e09                	li	t3,2
    185c:	b5cd                	j	173e <memset+0x86>

000000000000185e <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    185e:	00054783          	lbu	a5,0(a0)
    1862:	0005c703          	lbu	a4,0(a1)
    1866:	00e79863          	bne	a5,a4,1876 <strcmp+0x18>
    186a:	0505                	add	a0,a0,1
    186c:	0585                	add	a1,a1,1
    186e:	fbe5                	bnez	a5,185e <strcmp>
    1870:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1872:	9d19                	subw	a0,a0,a4
    1874:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    1876:	0007851b          	sext.w	a0,a5
    187a:	bfe5                	j	1872 <strcmp+0x14>

000000000000187c <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    187c:	ca15                	beqz	a2,18b0 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    187e:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1882:	167d                	add	a2,a2,-1
    1884:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1888:	eb99                	bnez	a5,189e <strncmp+0x22>
    188a:	a815                	j	18be <strncmp+0x42>
    188c:	00a68e63          	beq	a3,a0,18a8 <strncmp+0x2c>
    1890:	0505                	add	a0,a0,1
    1892:	00f71b63          	bne	a4,a5,18a8 <strncmp+0x2c>
    1896:	00054783          	lbu	a5,0(a0)
    189a:	cf89                	beqz	a5,18b4 <strncmp+0x38>
    189c:	85b2                	mv	a1,a2
    189e:	0005c703          	lbu	a4,0(a1)
    18a2:	00158613          	add	a2,a1,1
    18a6:	f37d                	bnez	a4,188c <strncmp+0x10>
        ;
    return *l - *r;
    18a8:	0007851b          	sext.w	a0,a5
    18ac:	9d19                	subw	a0,a0,a4
    18ae:	8082                	ret
        return 0;
    18b0:	4501                	li	a0,0
}
    18b2:	8082                	ret
    return *l - *r;
    18b4:	0015c703          	lbu	a4,1(a1)
    18b8:	4501                	li	a0,0
    18ba:	9d19                	subw	a0,a0,a4
    18bc:	8082                	ret
    18be:	0005c703          	lbu	a4,0(a1)
    18c2:	4501                	li	a0,0
    18c4:	b7e5                	j	18ac <strncmp+0x30>

00000000000018c6 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18c6:	00757793          	and	a5,a0,7
    18ca:	cf89                	beqz	a5,18e4 <strlen+0x1e>
    18cc:	87aa                	mv	a5,a0
    18ce:	a029                	j	18d8 <strlen+0x12>
    18d0:	0785                	add	a5,a5,1
    18d2:	0077f713          	and	a4,a5,7
    18d6:	cb01                	beqz	a4,18e6 <strlen+0x20>
        if (!*s)
    18d8:	0007c703          	lbu	a4,0(a5)
    18dc:	fb75                	bnez	a4,18d0 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18de:	40a78533          	sub	a0,a5,a0
}
    18e2:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18e4:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18e6:	6394                	ld	a3,0(a5)
    18e8:	00000597          	auipc	a1,0x0
    18ec:	6b85b583          	ld	a1,1720(a1) # 1fa0 <__clone+0xc6>
    18f0:	00000617          	auipc	a2,0x0
    18f4:	6b863603          	ld	a2,1720(a2) # 1fa8 <__clone+0xce>
    18f8:	a019                	j	18fe <strlen+0x38>
    18fa:	6794                	ld	a3,8(a5)
    18fc:	07a1                	add	a5,a5,8
    18fe:	00b68733          	add	a4,a3,a1
    1902:	fff6c693          	not	a3,a3
    1906:	8f75                	and	a4,a4,a3
    1908:	8f71                	and	a4,a4,a2
    190a:	db65                	beqz	a4,18fa <strlen+0x34>
    for (; *s; s++)
    190c:	0007c703          	lbu	a4,0(a5)
    1910:	d779                	beqz	a4,18de <strlen+0x18>
    1912:	0017c703          	lbu	a4,1(a5)
    1916:	0785                	add	a5,a5,1
    1918:	d379                	beqz	a4,18de <strlen+0x18>
    191a:	0017c703          	lbu	a4,1(a5)
    191e:	0785                	add	a5,a5,1
    1920:	fb6d                	bnez	a4,1912 <strlen+0x4c>
    1922:	bf75                	j	18de <strlen+0x18>

0000000000001924 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1924:	00757713          	and	a4,a0,7
{
    1928:	87aa                	mv	a5,a0
    192a:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    192e:	cb19                	beqz	a4,1944 <memchr+0x20>
    1930:	ce25                	beqz	a2,19a8 <memchr+0x84>
    1932:	0007c703          	lbu	a4,0(a5)
    1936:	00b70763          	beq	a4,a1,1944 <memchr+0x20>
    193a:	0785                	add	a5,a5,1
    193c:	0077f713          	and	a4,a5,7
    1940:	167d                	add	a2,a2,-1
    1942:	f77d                	bnez	a4,1930 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1944:	4501                	li	a0,0
    if (n && *s != c)
    1946:	c235                	beqz	a2,19aa <memchr+0x86>
    1948:	0007c703          	lbu	a4,0(a5)
    194c:	06b70063          	beq	a4,a1,19ac <memchr+0x88>
        size_t k = ONES * c;
    1950:	00000517          	auipc	a0,0x0
    1954:	66053503          	ld	a0,1632(a0) # 1fb0 <__clone+0xd6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1958:	471d                	li	a4,7
        size_t k = ONES * c;
    195a:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    195e:	04c77763          	bgeu	a4,a2,19ac <memchr+0x88>
    1962:	00000897          	auipc	a7,0x0
    1966:	63e8b883          	ld	a7,1598(a7) # 1fa0 <__clone+0xc6>
    196a:	00000817          	auipc	a6,0x0
    196e:	63e83803          	ld	a6,1598(a6) # 1fa8 <__clone+0xce>
    1972:	431d                	li	t1,7
    1974:	a029                	j	197e <memchr+0x5a>
    1976:	1661                	add	a2,a2,-8
    1978:	07a1                	add	a5,a5,8
    197a:	00c37c63          	bgeu	t1,a2,1992 <memchr+0x6e>
    197e:	6398                	ld	a4,0(a5)
    1980:	8f29                	xor	a4,a4,a0
    1982:	011706b3          	add	a3,a4,a7
    1986:	fff74713          	not	a4,a4
    198a:	8f75                	and	a4,a4,a3
    198c:	01077733          	and	a4,a4,a6
    1990:	d37d                	beqz	a4,1976 <memchr+0x52>
    1992:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    1994:	e601                	bnez	a2,199c <memchr+0x78>
    1996:	a809                	j	19a8 <memchr+0x84>
    1998:	0505                	add	a0,a0,1
    199a:	c619                	beqz	a2,19a8 <memchr+0x84>
    199c:	00054783          	lbu	a5,0(a0)
    19a0:	167d                	add	a2,a2,-1
    19a2:	feb79be3          	bne	a5,a1,1998 <memchr+0x74>
    19a6:	8082                	ret
    return n ? (void *)s : 0;
    19a8:	4501                	li	a0,0
}
    19aa:	8082                	ret
    if (n && *s != c)
    19ac:	853e                	mv	a0,a5
    19ae:	b7fd                	j	199c <memchr+0x78>

00000000000019b0 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    19b0:	1101                	add	sp,sp,-32
    19b2:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    19b4:	862e                	mv	a2,a1
{
    19b6:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    19b8:	4581                	li	a1,0
{
    19ba:	e426                	sd	s1,8(sp)
    19bc:	ec06                	sd	ra,24(sp)
    19be:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    19c0:	f65ff0ef          	jal	1924 <memchr>
    return p ? p - s : n;
    19c4:	c519                	beqz	a0,19d2 <strnlen+0x22>
}
    19c6:	60e2                	ld	ra,24(sp)
    19c8:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19ca:	8d05                	sub	a0,a0,s1
}
    19cc:	64a2                	ld	s1,8(sp)
    19ce:	6105                	add	sp,sp,32
    19d0:	8082                	ret
    19d2:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19d4:	8522                	mv	a0,s0
}
    19d6:	6442                	ld	s0,16(sp)
    19d8:	64a2                	ld	s1,8(sp)
    19da:	6105                	add	sp,sp,32
    19dc:	8082                	ret

00000000000019de <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19de:	00a5c7b3          	xor	a5,a1,a0
    19e2:	8b9d                	and	a5,a5,7
    19e4:	eb95                	bnez	a5,1a18 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19e6:	0075f793          	and	a5,a1,7
    19ea:	e7b1                	bnez	a5,1a36 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19ec:	6198                	ld	a4,0(a1)
    19ee:	00000617          	auipc	a2,0x0
    19f2:	5b263603          	ld	a2,1458(a2) # 1fa0 <__clone+0xc6>
    19f6:	00000817          	auipc	a6,0x0
    19fa:	5b283803          	ld	a6,1458(a6) # 1fa8 <__clone+0xce>
    19fe:	a029                	j	1a08 <strcpy+0x2a>
    1a00:	05a1                	add	a1,a1,8
    1a02:	e118                	sd	a4,0(a0)
    1a04:	6198                	ld	a4,0(a1)
    1a06:	0521                	add	a0,a0,8
    1a08:	00c707b3          	add	a5,a4,a2
    1a0c:	fff74693          	not	a3,a4
    1a10:	8ff5                	and	a5,a5,a3
    1a12:	0107f7b3          	and	a5,a5,a6
    1a16:	d7ed                	beqz	a5,1a00 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a18:	0005c783          	lbu	a5,0(a1)
    1a1c:	00f50023          	sb	a5,0(a0)
    1a20:	c785                	beqz	a5,1a48 <strcpy+0x6a>
    1a22:	0015c783          	lbu	a5,1(a1)
    1a26:	0505                	add	a0,a0,1
    1a28:	0585                	add	a1,a1,1
    1a2a:	00f50023          	sb	a5,0(a0)
    1a2e:	fbf5                	bnez	a5,1a22 <strcpy+0x44>
        ;
    return d;
}
    1a30:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a32:	0505                	add	a0,a0,1
    1a34:	df45                	beqz	a4,19ec <strcpy+0xe>
            if (!(*d = *s))
    1a36:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a3a:	0585                	add	a1,a1,1
    1a3c:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a40:	00f50023          	sb	a5,0(a0)
    1a44:	f7fd                	bnez	a5,1a32 <strcpy+0x54>
}
    1a46:	8082                	ret
    1a48:	8082                	ret

0000000000001a4a <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a4a:	00a5c7b3          	xor	a5,a1,a0
    1a4e:	8b9d                	and	a5,a5,7
    1a50:	e3b5                	bnez	a5,1ab4 <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a52:	0075f793          	and	a5,a1,7
    1a56:	cf99                	beqz	a5,1a74 <strncpy+0x2a>
    1a58:	ea09                	bnez	a2,1a6a <strncpy+0x20>
    1a5a:	a421                	j	1c62 <strncpy+0x218>
    1a5c:	0585                	add	a1,a1,1
    1a5e:	0075f793          	and	a5,a1,7
    1a62:	167d                	add	a2,a2,-1
    1a64:	0505                	add	a0,a0,1
    1a66:	c799                	beqz	a5,1a74 <strncpy+0x2a>
    1a68:	c225                	beqz	a2,1ac8 <strncpy+0x7e>
    1a6a:	0005c783          	lbu	a5,0(a1)
    1a6e:	00f50023          	sb	a5,0(a0)
    1a72:	f7ed                	bnez	a5,1a5c <strncpy+0x12>
            ;
        if (!n || !*s)
    1a74:	ca31                	beqz	a2,1ac8 <strncpy+0x7e>
    1a76:	0005c783          	lbu	a5,0(a1)
    1a7a:	cba1                	beqz	a5,1aca <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a7c:	479d                	li	a5,7
    1a7e:	02c7fc63          	bgeu	a5,a2,1ab6 <strncpy+0x6c>
    1a82:	00000897          	auipc	a7,0x0
    1a86:	51e8b883          	ld	a7,1310(a7) # 1fa0 <__clone+0xc6>
    1a8a:	00000817          	auipc	a6,0x0
    1a8e:	51e83803          	ld	a6,1310(a6) # 1fa8 <__clone+0xce>
    1a92:	431d                	li	t1,7
    1a94:	a039                	j	1aa2 <strncpy+0x58>
            *wd = *ws;
    1a96:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a98:	1661                	add	a2,a2,-8
    1a9a:	05a1                	add	a1,a1,8
    1a9c:	0521                	add	a0,a0,8
    1a9e:	00c37b63          	bgeu	t1,a2,1ab4 <strncpy+0x6a>
    1aa2:	6198                	ld	a4,0(a1)
    1aa4:	011707b3          	add	a5,a4,a7
    1aa8:	fff74693          	not	a3,a4
    1aac:	8ff5                	and	a5,a5,a3
    1aae:	0107f7b3          	and	a5,a5,a6
    1ab2:	d3f5                	beqz	a5,1a96 <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1ab4:	ca11                	beqz	a2,1ac8 <strncpy+0x7e>
    1ab6:	0005c783          	lbu	a5,0(a1)
    1aba:	0585                	add	a1,a1,1
    1abc:	00f50023          	sb	a5,0(a0)
    1ac0:	c789                	beqz	a5,1aca <strncpy+0x80>
    1ac2:	167d                	add	a2,a2,-1
    1ac4:	0505                	add	a0,a0,1
    1ac6:	fa65                	bnez	a2,1ab6 <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1ac8:	8082                	ret
    1aca:	4805                	li	a6,1
    1acc:	14061b63          	bnez	a2,1c22 <strncpy+0x1d8>
    1ad0:	40a00733          	neg	a4,a0
    1ad4:	00777793          	and	a5,a4,7
    1ad8:	4581                	li	a1,0
    1ada:	12061c63          	bnez	a2,1c12 <strncpy+0x1c8>
    1ade:	00778693          	add	a3,a5,7
    1ae2:	48ad                	li	a7,11
    1ae4:	1316e563          	bltu	a3,a7,1c0e <strncpy+0x1c4>
    1ae8:	16d5e263          	bltu	a1,a3,1c4c <strncpy+0x202>
    1aec:	14078c63          	beqz	a5,1c44 <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1af0:	00050023          	sb	zero,0(a0)
    1af4:	00677693          	and	a3,a4,6
    1af8:	14068263          	beqz	a3,1c3c <strncpy+0x1f2>
    1afc:	000500a3          	sb	zero,1(a0)
    1b00:	4689                	li	a3,2
    1b02:	14f6f863          	bgeu	a3,a5,1c52 <strncpy+0x208>
    1b06:	00050123          	sb	zero,2(a0)
    1b0a:	8b11                	and	a4,a4,4
    1b0c:	12070463          	beqz	a4,1c34 <strncpy+0x1ea>
    1b10:	000501a3          	sb	zero,3(a0)
    1b14:	4711                	li	a4,4
    1b16:	00450693          	add	a3,a0,4
    1b1a:	02f77563          	bgeu	a4,a5,1b44 <strncpy+0xfa>
    1b1e:	00050223          	sb	zero,4(a0)
    1b22:	4715                	li	a4,5
    1b24:	00550693          	add	a3,a0,5
    1b28:	00e78e63          	beq	a5,a4,1b44 <strncpy+0xfa>
    1b2c:	fff50713          	add	a4,a0,-1
    1b30:	000502a3          	sb	zero,5(a0)
    1b34:	8b1d                	and	a4,a4,7
    1b36:	12071263          	bnez	a4,1c5a <strncpy+0x210>
    1b3a:	00750693          	add	a3,a0,7
    1b3e:	00050323          	sb	zero,6(a0)
    1b42:	471d                	li	a4,7
    1b44:	40f80833          	sub	a6,a6,a5
    1b48:	ff887593          	and	a1,a6,-8
    1b4c:	97aa                	add	a5,a5,a0
    1b4e:	95be                	add	a1,a1,a5
    1b50:	0007b023          	sd	zero,0(a5)
    1b54:	07a1                	add	a5,a5,8
    1b56:	feb79de3          	bne	a5,a1,1b50 <strncpy+0x106>
    1b5a:	ff887593          	and	a1,a6,-8
    1b5e:	00787813          	and	a6,a6,7
    1b62:	00e587bb          	addw	a5,a1,a4
    1b66:	00b68733          	add	a4,a3,a1
    1b6a:	0e080063          	beqz	a6,1c4a <strncpy+0x200>
    1b6e:	00070023          	sb	zero,0(a4)
    1b72:	0017869b          	addw	a3,a5,1
    1b76:	f4c6f9e3          	bgeu	a3,a2,1ac8 <strncpy+0x7e>
    1b7a:	000700a3          	sb	zero,1(a4)
    1b7e:	0027869b          	addw	a3,a5,2
    1b82:	f4c6f3e3          	bgeu	a3,a2,1ac8 <strncpy+0x7e>
    1b86:	00070123          	sb	zero,2(a4)
    1b8a:	0037869b          	addw	a3,a5,3
    1b8e:	f2c6fde3          	bgeu	a3,a2,1ac8 <strncpy+0x7e>
    1b92:	000701a3          	sb	zero,3(a4)
    1b96:	0047869b          	addw	a3,a5,4
    1b9a:	f2c6f7e3          	bgeu	a3,a2,1ac8 <strncpy+0x7e>
    1b9e:	00070223          	sb	zero,4(a4)
    1ba2:	0057869b          	addw	a3,a5,5
    1ba6:	f2c6f1e3          	bgeu	a3,a2,1ac8 <strncpy+0x7e>
    1baa:	000702a3          	sb	zero,5(a4)
    1bae:	0067869b          	addw	a3,a5,6
    1bb2:	f0c6fbe3          	bgeu	a3,a2,1ac8 <strncpy+0x7e>
    1bb6:	00070323          	sb	zero,6(a4)
    1bba:	0077869b          	addw	a3,a5,7
    1bbe:	f0c6f5e3          	bgeu	a3,a2,1ac8 <strncpy+0x7e>
    1bc2:	000703a3          	sb	zero,7(a4)
    1bc6:	0087869b          	addw	a3,a5,8
    1bca:	eec6ffe3          	bgeu	a3,a2,1ac8 <strncpy+0x7e>
    1bce:	00070423          	sb	zero,8(a4)
    1bd2:	0097869b          	addw	a3,a5,9
    1bd6:	eec6f9e3          	bgeu	a3,a2,1ac8 <strncpy+0x7e>
    1bda:	000704a3          	sb	zero,9(a4)
    1bde:	00a7869b          	addw	a3,a5,10
    1be2:	eec6f3e3          	bgeu	a3,a2,1ac8 <strncpy+0x7e>
    1be6:	00070523          	sb	zero,10(a4)
    1bea:	00b7869b          	addw	a3,a5,11
    1bee:	ecc6fde3          	bgeu	a3,a2,1ac8 <strncpy+0x7e>
    1bf2:	000705a3          	sb	zero,11(a4)
    1bf6:	00c7869b          	addw	a3,a5,12
    1bfa:	ecc6f7e3          	bgeu	a3,a2,1ac8 <strncpy+0x7e>
    1bfe:	00070623          	sb	zero,12(a4)
    1c02:	27b5                	addw	a5,a5,13
    1c04:	ecc7f2e3          	bgeu	a5,a2,1ac8 <strncpy+0x7e>
    1c08:	000706a3          	sb	zero,13(a4)
}
    1c0c:	8082                	ret
    1c0e:	46ad                	li	a3,11
    1c10:	bde1                	j	1ae8 <strncpy+0x9e>
    1c12:	00778693          	add	a3,a5,7
    1c16:	48ad                	li	a7,11
    1c18:	fff60593          	add	a1,a2,-1
    1c1c:	ed16f6e3          	bgeu	a3,a7,1ae8 <strncpy+0x9e>
    1c20:	b7fd                	j	1c0e <strncpy+0x1c4>
    1c22:	40a00733          	neg	a4,a0
    1c26:	8832                	mv	a6,a2
    1c28:	00777793          	and	a5,a4,7
    1c2c:	4581                	li	a1,0
    1c2e:	ea0608e3          	beqz	a2,1ade <strncpy+0x94>
    1c32:	b7c5                	j	1c12 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c34:	00350693          	add	a3,a0,3
    1c38:	470d                	li	a4,3
    1c3a:	b729                	j	1b44 <strncpy+0xfa>
    1c3c:	00150693          	add	a3,a0,1
    1c40:	4705                	li	a4,1
    1c42:	b709                	j	1b44 <strncpy+0xfa>
tail:
    1c44:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c46:	4701                	li	a4,0
    1c48:	bdf5                	j	1b44 <strncpy+0xfa>
    1c4a:	8082                	ret
tail:
    1c4c:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c4e:	4781                	li	a5,0
    1c50:	bf39                	j	1b6e <strncpy+0x124>
    1c52:	00250693          	add	a3,a0,2
    1c56:	4709                	li	a4,2
    1c58:	b5f5                	j	1b44 <strncpy+0xfa>
    1c5a:	00650693          	add	a3,a0,6
    1c5e:	4719                	li	a4,6
    1c60:	b5d5                	j	1b44 <strncpy+0xfa>
    1c62:	8082                	ret

0000000000001c64 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c64:	87aa                	mv	a5,a0
    1c66:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c68:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c6c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c70:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c72:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c74:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c78:	2501                	sext.w	a0,a0
    1c7a:	8082                	ret

0000000000001c7c <openat>:
    register long a7 __asm__("a7") = n;
    1c7c:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c80:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c84:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c88:	2501                	sext.w	a0,a0
    1c8a:	8082                	ret

0000000000001c8c <close>:
    register long a7 __asm__("a7") = n;
    1c8c:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c90:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c94:	2501                	sext.w	a0,a0
    1c96:	8082                	ret

0000000000001c98 <read>:
    register long a7 __asm__("a7") = n;
    1c98:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c9c:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1ca0:	8082                	ret

0000000000001ca2 <write>:
    register long a7 __asm__("a7") = n;
    1ca2:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ca6:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1caa:	8082                	ret

0000000000001cac <getpid>:
    register long a7 __asm__("a7") = n;
    1cac:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1cb0:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1cb4:	2501                	sext.w	a0,a0
    1cb6:	8082                	ret

0000000000001cb8 <getppid>:
    register long a7 __asm__("a7") = n;
    1cb8:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1cbc:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1cc0:	2501                	sext.w	a0,a0
    1cc2:	8082                	ret

0000000000001cc4 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1cc4:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1cc8:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1ccc:	2501                	sext.w	a0,a0
    1cce:	8082                	ret

0000000000001cd0 <fork>:
    register long a7 __asm__("a7") = n;
    1cd0:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1cd4:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cd6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cd8:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cdc:	2501                	sext.w	a0,a0
    1cde:	8082                	ret

0000000000001ce0 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1ce0:	85b2                	mv	a1,a2
    1ce2:	863a                	mv	a2,a4
    if (stack)
    1ce4:	c191                	beqz	a1,1ce8 <clone+0x8>
	stack += stack_size;
    1ce6:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1ce8:	4781                	li	a5,0
    1cea:	4701                	li	a4,0
    1cec:	4681                	li	a3,0
    1cee:	2601                	sext.w	a2,a2
    1cf0:	a2ed                	j	1eda <__clone>

0000000000001cf2 <exit>:
    register long a7 __asm__("a7") = n;
    1cf2:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cf6:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cfa:	8082                	ret

0000000000001cfc <waitpid>:
    register long a7 __asm__("a7") = n;
    1cfc:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d00:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d02:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d06:	2501                	sext.w	a0,a0
    1d08:	8082                	ret

0000000000001d0a <exec>:
    register long a7 __asm__("a7") = n;
    1d0a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d0e:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d12:	2501                	sext.w	a0,a0
    1d14:	8082                	ret

0000000000001d16 <execve>:
    register long a7 __asm__("a7") = n;
    1d16:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d1a:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d1e:	2501                	sext.w	a0,a0
    1d20:	8082                	ret

0000000000001d22 <times>:
    register long a7 __asm__("a7") = n;
    1d22:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d26:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d2a:	2501                	sext.w	a0,a0
    1d2c:	8082                	ret

0000000000001d2e <get_time>:

int64 get_time()
{
    1d2e:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d30:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d34:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d36:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d38:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d3c:	2501                	sext.w	a0,a0
    1d3e:	ed09                	bnez	a0,1d58 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d40:	67a2                	ld	a5,8(sp)
    1d42:	3e800713          	li	a4,1000
    1d46:	00015503          	lhu	a0,0(sp)
    1d4a:	02e7d7b3          	divu	a5,a5,a4
    1d4e:	02e50533          	mul	a0,a0,a4
    1d52:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d54:	0141                	add	sp,sp,16
    1d56:	8082                	ret
        return -1;
    1d58:	557d                	li	a0,-1
    1d5a:	bfed                	j	1d54 <get_time+0x26>

0000000000001d5c <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d5c:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d60:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d64:	2501                	sext.w	a0,a0
    1d66:	8082                	ret

0000000000001d68 <time>:
    register long a7 __asm__("a7") = n;
    1d68:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d6c:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d70:	2501                	sext.w	a0,a0
    1d72:	8082                	ret

0000000000001d74 <sleep>:

int sleep(unsigned long long time)
{
    1d74:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d76:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d78:	850a                	mv	a0,sp
    1d7a:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d7c:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d80:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d82:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d86:	e501                	bnez	a0,1d8e <sleep+0x1a>
    return 0;
    1d88:	4501                	li	a0,0
}
    1d8a:	0141                	add	sp,sp,16
    1d8c:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d8e:	4502                	lw	a0,0(sp)
}
    1d90:	0141                	add	sp,sp,16
    1d92:	8082                	ret

0000000000001d94 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d94:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d98:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d9c:	2501                	sext.w	a0,a0
    1d9e:	8082                	ret

0000000000001da0 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1da0:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1da4:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1da8:	8082                	ret

0000000000001daa <munmap>:
    register long a7 __asm__("a7") = n;
    1daa:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dae:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1db2:	2501                	sext.w	a0,a0
    1db4:	8082                	ret

0000000000001db6 <wait>:

int wait(int *code)
{
    1db6:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1db8:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1dbc:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1dbe:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1dc0:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dc2:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <spawn>:
    register long a7 __asm__("a7") = n;
    1dca:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1dce:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1dd2:	2501                	sext.w	a0,a0
    1dd4:	8082                	ret

0000000000001dd6 <mailread>:
    register long a7 __asm__("a7") = n;
    1dd6:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dda:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1dde:	2501                	sext.w	a0,a0
    1de0:	8082                	ret

0000000000001de2 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1de2:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de6:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dea:	2501                	sext.w	a0,a0
    1dec:	8082                	ret

0000000000001dee <fstat>:
    register long a7 __asm__("a7") = n;
    1dee:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df2:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1df6:	2501                	sext.w	a0,a0
    1df8:	8082                	ret

0000000000001dfa <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dfa:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dfc:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e00:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e02:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e0a:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e0c:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e10:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e12:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e16:	2501                	sext.w	a0,a0
    1e18:	8082                	ret

0000000000001e1a <link>:

int link(char *old_path, char *new_path)
{
    1e1a:	87aa                	mv	a5,a0
    1e1c:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e1e:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e22:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e26:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e28:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e2c:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e2e:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <unlink>:

int unlink(char *path)
{
    1e36:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e38:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e3c:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e40:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e42:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e46:	2501                	sext.w	a0,a0
    1e48:	8082                	ret

0000000000001e4a <uname>:
    register long a7 __asm__("a7") = n;
    1e4a:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e4e:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e52:	2501                	sext.w	a0,a0
    1e54:	8082                	ret

0000000000001e56 <brk>:
    register long a7 __asm__("a7") = n;
    1e56:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e5a:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e62:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e64:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e68:	8082                	ret

0000000000001e6a <chdir>:
    register long a7 __asm__("a7") = n;
    1e6a:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e6e:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e72:	2501                	sext.w	a0,a0
    1e74:	8082                	ret

0000000000001e76 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e76:	862e                	mv	a2,a1
    1e78:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e7a:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e7c:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e80:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e84:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e86:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e88:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e8c:	2501                	sext.w	a0,a0
    1e8e:	8082                	ret

0000000000001e90 <getdents>:
    register long a7 __asm__("a7") = n;
    1e90:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e94:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e98:	2501                	sext.w	a0,a0
    1e9a:	8082                	ret

0000000000001e9c <pipe>:
    register long a7 __asm__("a7") = n;
    1e9c:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1ea0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea2:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1ea6:	2501                	sext.w	a0,a0
    1ea8:	8082                	ret

0000000000001eaa <dup>:
    register long a7 __asm__("a7") = n;
    1eaa:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1eac:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1eb0:	2501                	sext.w	a0,a0
    1eb2:	8082                	ret

0000000000001eb4 <dup2>:
    register long a7 __asm__("a7") = n;
    1eb4:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1eb6:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eb8:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1ebc:	2501                	sext.w	a0,a0
    1ebe:	8082                	ret

0000000000001ec0 <mount>:
    register long a7 __asm__("a7") = n;
    1ec0:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ec4:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1ec8:	2501                	sext.w	a0,a0
    1eca:	8082                	ret

0000000000001ecc <umount>:
    register long a7 __asm__("a7") = n;
    1ecc:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ed0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed2:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ed6:	2501                	sext.w	a0,a0
    1ed8:	8082                	ret

0000000000001eda <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1eda:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1edc:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ede:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ee0:	8532                	mv	a0,a2
	mv a2, a4
    1ee2:	863a                	mv	a2,a4
	mv a3, a5
    1ee4:	86be                	mv	a3,a5
	mv a4, a6
    1ee6:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ee8:	0dc00893          	li	a7,220
	ecall
    1eec:	00000073          	ecall

	beqz a0, 1f
    1ef0:	c111                	beqz	a0,1ef4 <__clone+0x1a>
	# Parent
	ret
    1ef2:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ef4:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ef6:	6522                	ld	a0,8(sp)
	jalr a1
    1ef8:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1efa:	05d00893          	li	a7,93
	ecall
    1efe:	00000073          	ecall
