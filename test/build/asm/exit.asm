
/home/lzq/Desktop/oscomp/test/build/riscv64/exit：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0d9                	j	10c8 <__start_main>

0000000000001004 <test_exit>:
 * 测试成功则输出：
 * "exit OK."
 * 测试失败则输出：
 * "exit ERR."
 */
void test_exit(void){
    1004:	1101                	add	sp,sp,-32
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	ed250513          	add	a0,a0,-302 # 1ed8 <__clone+0x28>
void test_exit(void){
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
    TEST_START(__func__);
    1012:	30e000ef          	jal	1320 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	f8a50513          	add	a0,a0,-118 # 1fa0 <__func__.0>
    101e:	302000ef          	jal	1320 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	ece50513          	add	a0,a0,-306 # 1ef0 <__clone+0x40>
    102a:	2f6000ef          	jal	1320 <puts>
    int cpid, waitret, wstatus;
    cpid = fork();
    102e:	479000ef          	jal	1ca6 <fork>
    assert(cpid != -1);
    1032:	57fd                	li	a5,-1
    cpid = fork();
    1034:	842a                	mv	s0,a0
    assert(cpid != -1);
    1036:	04f50263          	beq	a0,a5,107a <test_exit+0x76>
    if(cpid == 0){
    103a:	e531                	bnez	a0,1086 <test_exit+0x82>
        printf("child process here\n");
    103c:	00001517          	auipc	a0,0x1
    1040:	ee450513          	add	a0,a0,-284 # 1f20 <__clone+0x70>
    1044:	2fe000ef          	jal	1342 <printf>
        exit(0);
    1048:	4501                	li	a0,0
    104a:	47f000ef          	jal	1cc8 <exit>
        printf("parent process here\n");
        waitret = wait(&wstatus);
        if(waitret == cpid) printf("exit OK.\n");
        else printf("exit ERR.\n");
    }
    TEST_END(__func__);
    104e:	00001517          	auipc	a0,0x1
    1052:	f2250513          	add	a0,a0,-222 # 1f70 <__clone+0xc0>
    1056:	2ca000ef          	jal	1320 <puts>
    105a:	00001517          	auipc	a0,0x1
    105e:	f4650513          	add	a0,a0,-186 # 1fa0 <__func__.0>
    1062:	2be000ef          	jal	1320 <puts>
    1066:	00001517          	auipc	a0,0x1
    106a:	e8a50513          	add	a0,a0,-374 # 1ef0 <__clone+0x40>
    106e:	2b2000ef          	jal	1320 <puts>
}
    1072:	60e2                	ld	ra,24(sp)
    1074:	6442                	ld	s0,16(sp)
    1076:	6105                	add	sp,sp,32
    1078:	8082                	ret
    assert(cpid != -1);
    107a:	00001517          	auipc	a0,0x1
    107e:	e8650513          	add	a0,a0,-378 # 1f00 <__clone+0x50>
    1082:	53a000ef          	jal	15bc <panic>
        printf("parent process here\n");
    1086:	00001517          	auipc	a0,0x1
    108a:	eb250513          	add	a0,a0,-334 # 1f38 <__clone+0x88>
    108e:	2b4000ef          	jal	1342 <printf>
        waitret = wait(&wstatus);
    1092:	0068                	add	a0,sp,12
    1094:	4f9000ef          	jal	1d8c <wait>
        if(waitret == cpid) printf("exit OK.\n");
    1098:	00a40963          	beq	s0,a0,10aa <test_exit+0xa6>
        else printf("exit ERR.\n");
    109c:	00001517          	auipc	a0,0x1
    10a0:	ec450513          	add	a0,a0,-316 # 1f60 <__clone+0xb0>
    10a4:	29e000ef          	jal	1342 <printf>
    10a8:	b75d                	j	104e <test_exit+0x4a>
        if(waitret == cpid) printf("exit OK.\n");
    10aa:	00001517          	auipc	a0,0x1
    10ae:	ea650513          	add	a0,a0,-346 # 1f50 <__clone+0xa0>
    10b2:	290000ef          	jal	1342 <printf>
    10b6:	bf61                	j	104e <test_exit+0x4a>

00000000000010b8 <main>:

int main(void){
    10b8:	1141                	add	sp,sp,-16
    10ba:	e406                	sd	ra,8(sp)
    test_exit();
    10bc:	f49ff0ef          	jal	1004 <test_exit>
    return 0;
}
    10c0:	60a2                	ld	ra,8(sp)
    10c2:	4501                	li	a0,0
    10c4:	0141                	add	sp,sp,16
    10c6:	8082                	ret

00000000000010c8 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10c8:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10ca:	4108                	lw	a0,0(a0)
{
    10cc:	1141                	add	sp,sp,-16
	exit(main(argc, argv));
    10ce:	05a1                	add	a1,a1,8
{
    10d0:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10d2:	fe7ff0ef          	jal	10b8 <main>
    10d6:	3f3000ef          	jal	1cc8 <exit>
	return 0;
}
    10da:	60a2                	ld	ra,8(sp)
    10dc:	4501                	li	a0,0
    10de:	0141                	add	sp,sp,16
    10e0:	8082                	ret

00000000000010e2 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10e2:	7179                	add	sp,sp,-48
    10e4:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10e6:	12054863          	bltz	a0,1216 <printint.constprop.0+0x134>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10ea:	02b577bb          	remuw	a5,a0,a1
    10ee:	00001697          	auipc	a3,0x1
    10f2:	ec268693          	add	a3,a3,-318 # 1fb0 <digits>
    buf[16] = 0;
    10f6:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10fa:	0005871b          	sext.w	a4,a1
    10fe:	1782                	sll	a5,a5,0x20
    1100:	9381                	srl	a5,a5,0x20
    1102:	97b6                	add	a5,a5,a3
    1104:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1108:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    110c:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1110:	1ab56663          	bltu	a0,a1,12bc <printint.constprop.0+0x1da>
        buf[i--] = digits[x % base];
    1114:	02e8763b          	remuw	a2,a6,a4
    1118:	1602                	sll	a2,a2,0x20
    111a:	9201                	srl	a2,a2,0x20
    111c:	9636                	add	a2,a2,a3
    111e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1122:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1126:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    112a:	12e86c63          	bltu	a6,a4,1262 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    112e:	02e5f63b          	remuw	a2,a1,a4
    1132:	1602                	sll	a2,a2,0x20
    1134:	9201                	srl	a2,a2,0x20
    1136:	9636                	add	a2,a2,a3
    1138:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    113c:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1140:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1144:	12e5e863          	bltu	a1,a4,1274 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1148:	02e8763b          	remuw	a2,a6,a4
    114c:	1602                	sll	a2,a2,0x20
    114e:	9201                	srl	a2,a2,0x20
    1150:	9636                	add	a2,a2,a3
    1152:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1156:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    115a:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    115e:	12e86463          	bltu	a6,a4,1286 <printint.constprop.0+0x1a4>
        buf[i--] = digits[x % base];
    1162:	02e5f63b          	remuw	a2,a1,a4
    1166:	1602                	sll	a2,a2,0x20
    1168:	9201                	srl	a2,a2,0x20
    116a:	9636                	add	a2,a2,a3
    116c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1170:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1174:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1178:	12e5e063          	bltu	a1,a4,1298 <printint.constprop.0+0x1b6>
        buf[i--] = digits[x % base];
    117c:	02e8763b          	remuw	a2,a6,a4
    1180:	1602                	sll	a2,a2,0x20
    1182:	9201                	srl	a2,a2,0x20
    1184:	9636                	add	a2,a2,a3
    1186:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    118a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    118e:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1192:	0ae86f63          	bltu	a6,a4,1250 <printint.constprop.0+0x16e>
        buf[i--] = digits[x % base];
    1196:	02e5f63b          	remuw	a2,a1,a4
    119a:	1602                	sll	a2,a2,0x20
    119c:	9201                	srl	a2,a2,0x20
    119e:	9636                	add	a2,a2,a3
    11a0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a4:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11a8:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11ac:	0ee5ef63          	bltu	a1,a4,12aa <printint.constprop.0+0x1c8>
        buf[i--] = digits[x % base];
    11b0:	02e8763b          	remuw	a2,a6,a4
    11b4:	1602                	sll	a2,a2,0x20
    11b6:	9201                	srl	a2,a2,0x20
    11b8:	9636                	add	a2,a2,a3
    11ba:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11be:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11c2:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11c6:	0ee86d63          	bltu	a6,a4,12c0 <printint.constprop.0+0x1de>
        buf[i--] = digits[x % base];
    11ca:	02e5f63b          	remuw	a2,a1,a4
    11ce:	1602                	sll	a2,a2,0x20
    11d0:	9201                	srl	a2,a2,0x20
    11d2:	9636                	add	a2,a2,a3
    11d4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11d8:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11dc:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11e0:	0ee5e963          	bltu	a1,a4,12d2 <printint.constprop.0+0x1f0>
        buf[i--] = digits[x % base];
    11e4:	1782                	sll	a5,a5,0x20
    11e6:	9381                	srl	a5,a5,0x20
    11e8:	96be                	add	a3,a3,a5
    11ea:	0006c783          	lbu	a5,0(a3)
    11ee:	4599                	li	a1,6
    11f0:	00f10723          	sb	a5,14(sp)

    if (sign)
    11f4:	00055763          	bgez	a0,1202 <printint.constprop.0+0x120>
        buf[i--] = '-';
    11f8:	02d00793          	li	a5,45
    11fc:	00f106a3          	sb	a5,13(sp)
        buf[i--] = digits[x % base];
    1200:	4595                	li	a1,5
    write(f, s, l);
    1202:	003c                	add	a5,sp,8
    1204:	4641                	li	a2,16
    1206:	9e0d                	subw	a2,a2,a1
    1208:	4505                	li	a0,1
    120a:	95be                	add	a1,a1,a5
    120c:	26d000ef          	jal	1c78 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1210:	70a2                	ld	ra,40(sp)
    1212:	6145                	add	sp,sp,48
    1214:	8082                	ret
        x = -xx;
    1216:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    121a:	02b677bb          	remuw	a5,a2,a1
    121e:	00001697          	auipc	a3,0x1
    1222:	d9268693          	add	a3,a3,-622 # 1fb0 <digits>
    buf[16] = 0;
    1226:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    122a:	0005871b          	sext.w	a4,a1
    122e:	1782                	sll	a5,a5,0x20
    1230:	9381                	srl	a5,a5,0x20
    1232:	97b6                	add	a5,a5,a3
    1234:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1238:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    123c:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1240:	ecb67ae3          	bgeu	a2,a1,1114 <printint.constprop.0+0x32>
        buf[i--] = '-';
    1244:	02d00793          	li	a5,45
    1248:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    124c:	45b9                	li	a1,14
    124e:	bf55                	j	1202 <printint.constprop.0+0x120>
    1250:	45a9                	li	a1,10
    if (sign)
    1252:	fa0558e3          	bgez	a0,1202 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1256:	02d00793          	li	a5,45
    125a:	00f108a3          	sb	a5,17(sp)
        buf[i--] = digits[x % base];
    125e:	45a5                	li	a1,9
    1260:	b74d                	j	1202 <printint.constprop.0+0x120>
    1262:	45b9                	li	a1,14
    if (sign)
    1264:	f8055fe3          	bgez	a0,1202 <printint.constprop.0+0x120>
        buf[i--] = '-';
    1268:	02d00793          	li	a5,45
    126c:	00f10aa3          	sb	a5,21(sp)
        buf[i--] = digits[x % base];
    1270:	45b5                	li	a1,13
    1272:	bf41                	j	1202 <printint.constprop.0+0x120>
    1274:	45b5                	li	a1,13
    if (sign)
    1276:	f80556e3          	bgez	a0,1202 <printint.constprop.0+0x120>
        buf[i--] = '-';
    127a:	02d00793          	li	a5,45
    127e:	00f10a23          	sb	a5,20(sp)
        buf[i--] = digits[x % base];
    1282:	45b1                	li	a1,12
    1284:	bfbd                	j	1202 <printint.constprop.0+0x120>
    1286:	45b1                	li	a1,12
    if (sign)
    1288:	f6055de3          	bgez	a0,1202 <printint.constprop.0+0x120>
        buf[i--] = '-';
    128c:	02d00793          	li	a5,45
    1290:	00f109a3          	sb	a5,19(sp)
        buf[i--] = digits[x % base];
    1294:	45ad                	li	a1,11
    1296:	b7b5                	j	1202 <printint.constprop.0+0x120>
    1298:	45ad                	li	a1,11
    if (sign)
    129a:	f60554e3          	bgez	a0,1202 <printint.constprop.0+0x120>
        buf[i--] = '-';
    129e:	02d00793          	li	a5,45
    12a2:	00f10923          	sb	a5,18(sp)
        buf[i--] = digits[x % base];
    12a6:	45a9                	li	a1,10
    12a8:	bfa9                	j	1202 <printint.constprop.0+0x120>
    12aa:	45a5                	li	a1,9
    if (sign)
    12ac:	f4055be3          	bgez	a0,1202 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12b0:	02d00793          	li	a5,45
    12b4:	00f10823          	sb	a5,16(sp)
        buf[i--] = digits[x % base];
    12b8:	45a1                	li	a1,8
    12ba:	b7a1                	j	1202 <printint.constprop.0+0x120>
    i = 15;
    12bc:	45bd                	li	a1,15
    12be:	b791                	j	1202 <printint.constprop.0+0x120>
        buf[i--] = digits[x % base];
    12c0:	45a1                	li	a1,8
    if (sign)
    12c2:	f40550e3          	bgez	a0,1202 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12c6:	02d00793          	li	a5,45
    12ca:	00f107a3          	sb	a5,15(sp)
        buf[i--] = digits[x % base];
    12ce:	459d                	li	a1,7
    12d0:	bf0d                	j	1202 <printint.constprop.0+0x120>
    12d2:	459d                	li	a1,7
    if (sign)
    12d4:	f20557e3          	bgez	a0,1202 <printint.constprop.0+0x120>
        buf[i--] = '-';
    12d8:	02d00793          	li	a5,45
    12dc:	00f10723          	sb	a5,14(sp)
        buf[i--] = digits[x % base];
    12e0:	4599                	li	a1,6
    12e2:	b705                	j	1202 <printint.constprop.0+0x120>

00000000000012e4 <getchar>:
{
    12e4:	1101                	add	sp,sp,-32
    read(stdin, &byte, 1);
    12e6:	00f10593          	add	a1,sp,15
    12ea:	4605                	li	a2,1
    12ec:	4501                	li	a0,0
{
    12ee:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12f0:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12f4:	17b000ef          	jal	1c6e <read>
}
    12f8:	60e2                	ld	ra,24(sp)
    12fa:	00f14503          	lbu	a0,15(sp)
    12fe:	6105                	add	sp,sp,32
    1300:	8082                	ret

0000000000001302 <putchar>:
{
    1302:	1101                	add	sp,sp,-32
    1304:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1306:	00f10593          	add	a1,sp,15
    130a:	4605                	li	a2,1
    130c:	4505                	li	a0,1
{
    130e:	ec06                	sd	ra,24(sp)
    char byte = c;
    1310:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1314:	165000ef          	jal	1c78 <write>
}
    1318:	60e2                	ld	ra,24(sp)
    131a:	2501                	sext.w	a0,a0
    131c:	6105                	add	sp,sp,32
    131e:	8082                	ret

0000000000001320 <puts>:
{
    1320:	1141                	add	sp,sp,-16
    1322:	e406                	sd	ra,8(sp)
    1324:	e022                	sd	s0,0(sp)
    1326:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1328:	574000ef          	jal	189c <strlen>
    132c:	862a                	mv	a2,a0
    132e:	85a2                	mv	a1,s0
    1330:	4505                	li	a0,1
    1332:	147000ef          	jal	1c78 <write>
}
    1336:	60a2                	ld	ra,8(sp)
    1338:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    133a:	957d                	sra	a0,a0,0x3f
    return r;
    133c:	2501                	sext.w	a0,a0
}
    133e:	0141                	add	sp,sp,16
    1340:	8082                	ret

0000000000001342 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1342:	7171                	add	sp,sp,-176
    1344:	f85a                	sd	s6,48(sp)
    1346:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1348:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    134a:	18bc                	add	a5,sp,120
{
    134c:	e8ca                	sd	s2,80(sp)
    134e:	e4ce                	sd	s3,72(sp)
    1350:	e0d2                	sd	s4,64(sp)
    1352:	fc56                	sd	s5,56(sp)
    1354:	f486                	sd	ra,104(sp)
    1356:	f0a2                	sd	s0,96(sp)
    1358:	eca6                	sd	s1,88(sp)
    135a:	fcae                	sd	a1,120(sp)
    135c:	e132                	sd	a2,128(sp)
    135e:	e536                	sd	a3,136(sp)
    1360:	e93a                	sd	a4,144(sp)
    1362:	f142                	sd	a6,160(sp)
    1364:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1366:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1368:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    136c:	07300a13          	li	s4,115
    1370:	07800a93          	li	s5,120
    buf[i++] = '0';
    1374:	830b4b13          	xor	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1378:	00001997          	auipc	s3,0x1
    137c:	c3898993          	add	s3,s3,-968 # 1fb0 <digits>
        if (!*s)
    1380:	00054783          	lbu	a5,0(a0)
    1384:	16078a63          	beqz	a5,14f8 <printf+0x1b6>
    1388:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    138a:	19278d63          	beq	a5,s2,1524 <printf+0x1e2>
    138e:	00164783          	lbu	a5,1(a2)
    1392:	0605                	add	a2,a2,1
    1394:	fbfd                	bnez	a5,138a <printf+0x48>
    1396:	84b2                	mv	s1,a2
        l = z - a;
    1398:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    139c:	85aa                	mv	a1,a0
    139e:	8622                	mv	a2,s0
    13a0:	4505                	li	a0,1
    13a2:	0d7000ef          	jal	1c78 <write>
        if (l)
    13a6:	1a041463          	bnez	s0,154e <printf+0x20c>
        if (s[1] == 0)
    13aa:	0014c783          	lbu	a5,1(s1)
    13ae:	14078563          	beqz	a5,14f8 <printf+0x1b6>
        switch (s[1])
    13b2:	1b478063          	beq	a5,s4,1552 <printf+0x210>
    13b6:	14fa6b63          	bltu	s4,a5,150c <printf+0x1ca>
    13ba:	06400713          	li	a4,100
    13be:	1ee78063          	beq	a5,a4,159e <printf+0x25c>
    13c2:	07000713          	li	a4,112
    13c6:	1ae79963          	bne	a5,a4,1578 <printf+0x236>
            break;
        case 'x':
            printint(va_arg(ap, int), 16, 1);
            break;
        case 'p':
            printptr(va_arg(ap, uint64));
    13ca:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13cc:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13d0:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13d2:	631c                	ld	a5,0(a4)
    13d4:	0721                	add	a4,a4,8
    13d6:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13d8:	00479293          	sll	t0,a5,0x4
    13dc:	00879f93          	sll	t6,a5,0x8
    13e0:	00c79f13          	sll	t5,a5,0xc
    13e4:	01079e93          	sll	t4,a5,0x10
    13e8:	01479e13          	sll	t3,a5,0x14
    13ec:	01879313          	sll	t1,a5,0x18
    13f0:	01c79893          	sll	a7,a5,0x1c
    13f4:	02479813          	sll	a6,a5,0x24
    13f8:	02879513          	sll	a0,a5,0x28
    13fc:	02c79593          	sll	a1,a5,0x2c
    1400:	03079693          	sll	a3,a5,0x30
    1404:	03479713          	sll	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1408:	03c7d413          	srl	s0,a5,0x3c
    140c:	01c7d39b          	srlw	t2,a5,0x1c
    1410:	03c2d293          	srl	t0,t0,0x3c
    1414:	03cfdf93          	srl	t6,t6,0x3c
    1418:	03cf5f13          	srl	t5,t5,0x3c
    141c:	03cede93          	srl	t4,t4,0x3c
    1420:	03ce5e13          	srl	t3,t3,0x3c
    1424:	03c35313          	srl	t1,t1,0x3c
    1428:	03c8d893          	srl	a7,a7,0x3c
    142c:	03c85813          	srl	a6,a6,0x3c
    1430:	9171                	srl	a0,a0,0x3c
    1432:	91f1                	srl	a1,a1,0x3c
    1434:	92f1                	srl	a3,a3,0x3c
    1436:	9371                	srl	a4,a4,0x3c
    1438:	96ce                	add	a3,a3,s3
    143a:	974e                	add	a4,a4,s3
    143c:	944e                	add	s0,s0,s3
    143e:	92ce                	add	t0,t0,s3
    1440:	9fce                	add	t6,t6,s3
    1442:	9f4e                	add	t5,t5,s3
    1444:	9ece                	add	t4,t4,s3
    1446:	9e4e                	add	t3,t3,s3
    1448:	934e                	add	t1,t1,s3
    144a:	98ce                	add	a7,a7,s3
    144c:	93ce                	add	t2,t2,s3
    144e:	984e                	add	a6,a6,s3
    1450:	954e                	add	a0,a0,s3
    1452:	95ce                	add	a1,a1,s3
    1454:	0006c083          	lbu	ra,0(a3)
    1458:	0002c283          	lbu	t0,0(t0)
    145c:	00074683          	lbu	a3,0(a4)
    1460:	000fcf83          	lbu	t6,0(t6)
    1464:	000f4f03          	lbu	t5,0(t5)
    1468:	000ece83          	lbu	t4,0(t4)
    146c:	000e4e03          	lbu	t3,0(t3)
    1470:	00034303          	lbu	t1,0(t1)
    1474:	0008c883          	lbu	a7,0(a7)
    1478:	0003c383          	lbu	t2,0(t2)
    147c:	00084803          	lbu	a6,0(a6)
    1480:	00054503          	lbu	a0,0(a0)
    1484:	0005c583          	lbu	a1,0(a1)
    1488:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    148c:	03879713          	sll	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1490:	9371                	srl	a4,a4,0x3c
    1492:	8bbd                	and	a5,a5,15
    1494:	974e                	add	a4,a4,s3
    1496:	97ce                	add	a5,a5,s3
    1498:	005105a3          	sb	t0,11(sp)
    149c:	01f10623          	sb	t6,12(sp)
    14a0:	01e106a3          	sb	t5,13(sp)
    14a4:	01d10723          	sb	t4,14(sp)
    14a8:	01c107a3          	sb	t3,15(sp)
    14ac:	00610823          	sb	t1,16(sp)
    14b0:	011108a3          	sb	a7,17(sp)
    14b4:	00710923          	sb	t2,18(sp)
    14b8:	010109a3          	sb	a6,19(sp)
    14bc:	00a10a23          	sb	a0,20(sp)
    14c0:	00b10aa3          	sb	a1,21(sp)
    14c4:	00110b23          	sb	ra,22(sp)
    14c8:	00d10ba3          	sb	a3,23(sp)
    14cc:	00810523          	sb	s0,10(sp)
    14d0:	00074703          	lbu	a4,0(a4)
    14d4:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14d8:	002c                	add	a1,sp,8
    14da:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14dc:	00e10c23          	sb	a4,24(sp)
    14e0:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14e4:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14e8:	790000ef          	jal	1c78 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14ec:	00248513          	add	a0,s1,2
        if (!*s)
    14f0:	00054783          	lbu	a5,0(a0)
    14f4:	e8079ae3          	bnez	a5,1388 <printf+0x46>
    }
    va_end(ap);
}
    14f8:	70a6                	ld	ra,104(sp)
    14fa:	7406                	ld	s0,96(sp)
    14fc:	64e6                	ld	s1,88(sp)
    14fe:	6946                	ld	s2,80(sp)
    1500:	69a6                	ld	s3,72(sp)
    1502:	6a06                	ld	s4,64(sp)
    1504:	7ae2                	ld	s5,56(sp)
    1506:	7b42                	ld	s6,48(sp)
    1508:	614d                	add	sp,sp,176
    150a:	8082                	ret
        switch (s[1])
    150c:	07579663          	bne	a5,s5,1578 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1510:	6782                	ld	a5,0(sp)
    1512:	45c1                	li	a1,16
    1514:	4388                	lw	a0,0(a5)
    1516:	07a1                	add	a5,a5,8
    1518:	e03e                	sd	a5,0(sp)
    151a:	bc9ff0ef          	jal	10e2 <printint.constprop.0>
        s += 2;
    151e:	00248513          	add	a0,s1,2
    1522:	b7f9                	j	14f0 <printf+0x1ae>
    1524:	84b2                	mv	s1,a2
    1526:	a039                	j	1534 <printf+0x1f2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1528:	0024c783          	lbu	a5,2(s1)
    152c:	0605                	add	a2,a2,1
    152e:	0489                	add	s1,s1,2
    1530:	e72794e3          	bne	a5,s2,1398 <printf+0x56>
    1534:	0014c783          	lbu	a5,1(s1)
    1538:	ff2788e3          	beq	a5,s2,1528 <printf+0x1e6>
        l = z - a;
    153c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1540:	85aa                	mv	a1,a0
    1542:	8622                	mv	a2,s0
    1544:	4505                	li	a0,1
    1546:	732000ef          	jal	1c78 <write>
        if (l)
    154a:	e60400e3          	beqz	s0,13aa <printf+0x68>
    154e:	8526                	mv	a0,s1
    1550:	bd05                	j	1380 <printf+0x3e>
            if ((a = va_arg(ap, char *)) == 0)
    1552:	6782                	ld	a5,0(sp)
    1554:	6380                	ld	s0,0(a5)
    1556:	07a1                	add	a5,a5,8
    1558:	e03e                	sd	a5,0(sp)
    155a:	cc21                	beqz	s0,15b2 <printf+0x270>
            l = strnlen(a, 200);
    155c:	0c800593          	li	a1,200
    1560:	8522                	mv	a0,s0
    1562:	424000ef          	jal	1986 <strnlen>
    write(f, s, l);
    1566:	0005061b          	sext.w	a2,a0
    156a:	85a2                	mv	a1,s0
    156c:	4505                	li	a0,1
    156e:	70a000ef          	jal	1c78 <write>
        s += 2;
    1572:	00248513          	add	a0,s1,2
    1576:	bfad                	j	14f0 <printf+0x1ae>
    return write(stdout, &byte, 1);
    1578:	4605                	li	a2,1
    157a:	002c                	add	a1,sp,8
    157c:	4505                	li	a0,1
    char byte = c;
    157e:	01210423          	sb	s2,8(sp)
    return write(stdout, &byte, 1);
    1582:	6f6000ef          	jal	1c78 <write>
    char byte = c;
    1586:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    158a:	4605                	li	a2,1
    158c:	002c                	add	a1,sp,8
    158e:	4505                	li	a0,1
    char byte = c;
    1590:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1594:	6e4000ef          	jal	1c78 <write>
        s += 2;
    1598:	00248513          	add	a0,s1,2
    159c:	bf91                	j	14f0 <printf+0x1ae>
            printint(va_arg(ap, int), 10, 1);
    159e:	6782                	ld	a5,0(sp)
    15a0:	45a9                	li	a1,10
    15a2:	4388                	lw	a0,0(a5)
    15a4:	07a1                	add	a5,a5,8
    15a6:	e03e                	sd	a5,0(sp)
    15a8:	b3bff0ef          	jal	10e2 <printint.constprop.0>
        s += 2;
    15ac:	00248513          	add	a0,s1,2
    15b0:	b781                	j	14f0 <printf+0x1ae>
                a = "(null)";
    15b2:	00001417          	auipc	s0,0x1
    15b6:	9ce40413          	add	s0,s0,-1586 # 1f80 <__clone+0xd0>
    15ba:	b74d                	j	155c <printf+0x21a>

00000000000015bc <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15bc:	1141                	add	sp,sp,-16
    15be:	e406                	sd	ra,8(sp)
    puts(m);
    15c0:	d61ff0ef          	jal	1320 <puts>
    exit(-100);
}
    15c4:	60a2                	ld	ra,8(sp)
    exit(-100);
    15c6:	f9c00513          	li	a0,-100
}
    15ca:	0141                	add	sp,sp,16
    exit(-100);
    15cc:	adf5                	j	1cc8 <exit>

00000000000015ce <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ce:	02000793          	li	a5,32
    15d2:	00f50663          	beq	a0,a5,15de <isspace+0x10>
    15d6:	355d                	addw	a0,a0,-9
    15d8:	00553513          	sltiu	a0,a0,5
    15dc:	8082                	ret
    15de:	4505                	li	a0,1
}
    15e0:	8082                	ret

00000000000015e2 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15e2:	fd05051b          	addw	a0,a0,-48
}
    15e6:	00a53513          	sltiu	a0,a0,10
    15ea:	8082                	ret

00000000000015ec <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ec:	02000693          	li	a3,32
    15f0:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15f2:	00054783          	lbu	a5,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15f6:	ff77871b          	addw	a4,a5,-9
    15fa:	04d78c63          	beq	a5,a3,1652 <atoi+0x66>
    15fe:	0007861b          	sext.w	a2,a5
    1602:	04e5f863          	bgeu	a1,a4,1652 <atoi+0x66>
        s++;
    switch (*s)
    1606:	02b00713          	li	a4,43
    160a:	04e78963          	beq	a5,a4,165c <atoi+0x70>
    160e:	02d00713          	li	a4,45
    1612:	06e78263          	beq	a5,a4,1676 <atoi+0x8a>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1616:	fd06069b          	addw	a3,a2,-48
    161a:	47a5                	li	a5,9
    161c:	872a                	mv	a4,a0
    int n = 0, neg = 0;
    161e:	4301                	li	t1,0
    while (isdigit(*s))
    1620:	04d7e963          	bltu	a5,a3,1672 <atoi+0x86>
    int n = 0, neg = 0;
    1624:	4501                	li	a0,0
    while (isdigit(*s))
    1626:	48a5                	li	a7,9
    1628:	00174683          	lbu	a3,1(a4)
        n = 10 * n - (*s++ - '0');
    162c:	0025179b          	sllw	a5,a0,0x2
    1630:	9fa9                	addw	a5,a5,a0
    1632:	fd06059b          	addw	a1,a2,-48
    1636:	0017979b          	sllw	a5,a5,0x1
    while (isdigit(*s))
    163a:	fd06881b          	addw	a6,a3,-48
        n = 10 * n - (*s++ - '0');
    163e:	0705                	add	a4,a4,1
    1640:	40b7853b          	subw	a0,a5,a1
    while (isdigit(*s))
    1644:	0006861b          	sext.w	a2,a3
    1648:	ff08f0e3          	bgeu	a7,a6,1628 <atoi+0x3c>
    return neg ? n : -n;
    164c:	00030563          	beqz	t1,1656 <atoi+0x6a>
}
    1650:	8082                	ret
        s++;
    1652:	0505                	add	a0,a0,1
    1654:	bf79                	j	15f2 <atoi+0x6>
    return neg ? n : -n;
    1656:	40f5853b          	subw	a0,a1,a5
    165a:	8082                	ret
    while (isdigit(*s))
    165c:	00154603          	lbu	a2,1(a0)
    1660:	47a5                	li	a5,9
        s++;
    1662:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1666:	fd06069b          	addw	a3,a2,-48
    int n = 0, neg = 0;
    166a:	4301                	li	t1,0
    while (isdigit(*s))
    166c:	2601                	sext.w	a2,a2
    166e:	fad7fbe3          	bgeu	a5,a3,1624 <atoi+0x38>
    1672:	4501                	li	a0,0
}
    1674:	8082                	ret
    while (isdigit(*s))
    1676:	00154603          	lbu	a2,1(a0)
    167a:	47a5                	li	a5,9
        s++;
    167c:	00150713          	add	a4,a0,1
    while (isdigit(*s))
    1680:	fd06069b          	addw	a3,a2,-48
    1684:	2601                	sext.w	a2,a2
    1686:	fed7e6e3          	bltu	a5,a3,1672 <atoi+0x86>
        neg = 1;
    168a:	4305                	li	t1,1
    168c:	bf61                	j	1624 <atoi+0x38>

000000000000168e <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    168e:	18060163          	beqz	a2,1810 <memset+0x182>
    1692:	40a006b3          	neg	a3,a0
    1696:	0076f793          	and	a5,a3,7
    169a:	00778813          	add	a6,a5,7
    169e:	48ad                	li	a7,11
    16a0:	0ff5f713          	zext.b	a4,a1
    16a4:	fff60593          	add	a1,a2,-1
    16a8:	17186563          	bltu	a6,a7,1812 <memset+0x184>
    16ac:	1705ed63          	bltu	a1,a6,1826 <memset+0x198>
    16b0:	16078363          	beqz	a5,1816 <memset+0x188>
    16b4:	00e50023          	sb	a4,0(a0)
    16b8:	0066f593          	and	a1,a3,6
    16bc:	16058063          	beqz	a1,181c <memset+0x18e>
    16c0:	00e500a3          	sb	a4,1(a0)
    16c4:	4589                	li	a1,2
    16c6:	16f5f363          	bgeu	a1,a5,182c <memset+0x19e>
    16ca:	00e50123          	sb	a4,2(a0)
    16ce:	8a91                	and	a3,a3,4
    16d0:	00350593          	add	a1,a0,3
    16d4:	4e0d                	li	t3,3
    16d6:	ce9d                	beqz	a3,1714 <memset+0x86>
    16d8:	00e501a3          	sb	a4,3(a0)
    16dc:	4691                	li	a3,4
    16de:	00450593          	add	a1,a0,4
    16e2:	4e11                	li	t3,4
    16e4:	02f6f863          	bgeu	a3,a5,1714 <memset+0x86>
    16e8:	00e50223          	sb	a4,4(a0)
    16ec:	4695                	li	a3,5
    16ee:	00550593          	add	a1,a0,5
    16f2:	4e15                	li	t3,5
    16f4:	02d78063          	beq	a5,a3,1714 <memset+0x86>
    16f8:	fff50693          	add	a3,a0,-1
    16fc:	00e502a3          	sb	a4,5(a0)
    1700:	8a9d                	and	a3,a3,7
    1702:	00650593          	add	a1,a0,6
    1706:	4e19                	li	t3,6
    1708:	e691                	bnez	a3,1714 <memset+0x86>
    170a:	00750593          	add	a1,a0,7
    170e:	00e50323          	sb	a4,6(a0)
    1712:	4e1d                	li	t3,7
    1714:	00871693          	sll	a3,a4,0x8
    1718:	01071813          	sll	a6,a4,0x10
    171c:	8ed9                	or	a3,a3,a4
    171e:	01871893          	sll	a7,a4,0x18
    1722:	0106e6b3          	or	a3,a3,a6
    1726:	0116e6b3          	or	a3,a3,a7
    172a:	02071813          	sll	a6,a4,0x20
    172e:	02871313          	sll	t1,a4,0x28
    1732:	0106e6b3          	or	a3,a3,a6
    1736:	40f608b3          	sub	a7,a2,a5
    173a:	03071813          	sll	a6,a4,0x30
    173e:	0066e6b3          	or	a3,a3,t1
    1742:	0106e6b3          	or	a3,a3,a6
    1746:	03871313          	sll	t1,a4,0x38
    174a:	97aa                	add	a5,a5,a0
    174c:	ff88f813          	and	a6,a7,-8
    1750:	0066e6b3          	or	a3,a3,t1
    1754:	983e                	add	a6,a6,a5
    1756:	e394                	sd	a3,0(a5)
    1758:	07a1                	add	a5,a5,8
    175a:	ff079ee3          	bne	a5,a6,1756 <memset+0xc8>
    175e:	ff88f793          	and	a5,a7,-8
    1762:	0078f893          	and	a7,a7,7
    1766:	00f586b3          	add	a3,a1,a5
    176a:	01c787bb          	addw	a5,a5,t3
    176e:	0a088b63          	beqz	a7,1824 <memset+0x196>
    1772:	00e68023          	sb	a4,0(a3)
    1776:	0017859b          	addw	a1,a5,1
    177a:	08c5fb63          	bgeu	a1,a2,1810 <memset+0x182>
    177e:	00e680a3          	sb	a4,1(a3)
    1782:	0027859b          	addw	a1,a5,2
    1786:	08c5f563          	bgeu	a1,a2,1810 <memset+0x182>
    178a:	00e68123          	sb	a4,2(a3)
    178e:	0037859b          	addw	a1,a5,3
    1792:	06c5ff63          	bgeu	a1,a2,1810 <memset+0x182>
    1796:	00e681a3          	sb	a4,3(a3)
    179a:	0047859b          	addw	a1,a5,4
    179e:	06c5f963          	bgeu	a1,a2,1810 <memset+0x182>
    17a2:	00e68223          	sb	a4,4(a3)
    17a6:	0057859b          	addw	a1,a5,5
    17aa:	06c5f363          	bgeu	a1,a2,1810 <memset+0x182>
    17ae:	00e682a3          	sb	a4,5(a3)
    17b2:	0067859b          	addw	a1,a5,6
    17b6:	04c5fd63          	bgeu	a1,a2,1810 <memset+0x182>
    17ba:	00e68323          	sb	a4,6(a3)
    17be:	0077859b          	addw	a1,a5,7
    17c2:	04c5f763          	bgeu	a1,a2,1810 <memset+0x182>
    17c6:	00e683a3          	sb	a4,7(a3)
    17ca:	0087859b          	addw	a1,a5,8
    17ce:	04c5f163          	bgeu	a1,a2,1810 <memset+0x182>
    17d2:	00e68423          	sb	a4,8(a3)
    17d6:	0097859b          	addw	a1,a5,9
    17da:	02c5fb63          	bgeu	a1,a2,1810 <memset+0x182>
    17de:	00e684a3          	sb	a4,9(a3)
    17e2:	00a7859b          	addw	a1,a5,10
    17e6:	02c5f563          	bgeu	a1,a2,1810 <memset+0x182>
    17ea:	00e68523          	sb	a4,10(a3)
    17ee:	00b7859b          	addw	a1,a5,11
    17f2:	00c5ff63          	bgeu	a1,a2,1810 <memset+0x182>
    17f6:	00e685a3          	sb	a4,11(a3)
    17fa:	00c7859b          	addw	a1,a5,12
    17fe:	00c5f963          	bgeu	a1,a2,1810 <memset+0x182>
    1802:	00e68623          	sb	a4,12(a3)
    1806:	27b5                	addw	a5,a5,13
    1808:	00c7f463          	bgeu	a5,a2,1810 <memset+0x182>
    180c:	00e686a3          	sb	a4,13(a3)
        ;
    return dest;
}
    1810:	8082                	ret
    1812:	482d                	li	a6,11
    1814:	bd61                	j	16ac <memset+0x1e>
    char *p = dest;
    1816:	85aa                	mv	a1,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1818:	4e01                	li	t3,0
    181a:	bded                	j	1714 <memset+0x86>
    181c:	00150593          	add	a1,a0,1
    1820:	4e05                	li	t3,1
    1822:	bdcd                	j	1714 <memset+0x86>
    1824:	8082                	ret
    char *p = dest;
    1826:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1828:	4781                	li	a5,0
    182a:	b7a1                	j	1772 <memset+0xe4>
    182c:	00250593          	add	a1,a0,2
    1830:	4e09                	li	t3,2
    1832:	b5cd                	j	1714 <memset+0x86>

0000000000001834 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1834:	00054783          	lbu	a5,0(a0)
    1838:	0005c703          	lbu	a4,0(a1)
    183c:	00e79863          	bne	a5,a4,184c <strcmp+0x18>
    1840:	0505                	add	a0,a0,1
    1842:	0585                	add	a1,a1,1
    1844:	fbe5                	bnez	a5,1834 <strcmp>
    1846:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1848:	9d19                	subw	a0,a0,a4
    184a:	8082                	ret
    return *(unsigned char *)l - *(unsigned char *)r;
    184c:	0007851b          	sext.w	a0,a5
    1850:	bfe5                	j	1848 <strcmp+0x14>

0000000000001852 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1852:	ca15                	beqz	a2,1886 <strncmp+0x34>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1854:	00054783          	lbu	a5,0(a0)
    if (!n--)
    1858:	167d                	add	a2,a2,-1
    185a:	00c506b3          	add	a3,a0,a2
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    185e:	eb99                	bnez	a5,1874 <strncmp+0x22>
    1860:	a815                	j	1894 <strncmp+0x42>
    1862:	00a68e63          	beq	a3,a0,187e <strncmp+0x2c>
    1866:	0505                	add	a0,a0,1
    1868:	00f71b63          	bne	a4,a5,187e <strncmp+0x2c>
    186c:	00054783          	lbu	a5,0(a0)
    1870:	cf89                	beqz	a5,188a <strncmp+0x38>
    1872:	85b2                	mv	a1,a2
    1874:	0005c703          	lbu	a4,0(a1)
    1878:	00158613          	add	a2,a1,1
    187c:	f37d                	bnez	a4,1862 <strncmp+0x10>
        ;
    return *l - *r;
    187e:	0007851b          	sext.w	a0,a5
    1882:	9d19                	subw	a0,a0,a4
    1884:	8082                	ret
        return 0;
    1886:	4501                	li	a0,0
}
    1888:	8082                	ret
    return *l - *r;
    188a:	0015c703          	lbu	a4,1(a1)
    188e:	4501                	li	a0,0
    1890:	9d19                	subw	a0,a0,a4
    1892:	8082                	ret
    1894:	0005c703          	lbu	a4,0(a1)
    1898:	4501                	li	a0,0
    189a:	b7e5                	j	1882 <strncmp+0x30>

000000000000189c <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    189c:	00757793          	and	a5,a0,7
    18a0:	cf89                	beqz	a5,18ba <strlen+0x1e>
    18a2:	87aa                	mv	a5,a0
    18a4:	a029                	j	18ae <strlen+0x12>
    18a6:	0785                	add	a5,a5,1
    18a8:	0077f713          	and	a4,a5,7
    18ac:	cb01                	beqz	a4,18bc <strlen+0x20>
        if (!*s)
    18ae:	0007c703          	lbu	a4,0(a5)
    18b2:	fb75                	bnez	a4,18a6 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18b4:	40a78533          	sub	a0,a5,a0
}
    18b8:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18ba:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18bc:	6394                	ld	a3,0(a5)
    18be:	00000597          	auipc	a1,0x0
    18c2:	6ca5b583          	ld	a1,1738(a1) # 1f88 <__clone+0xd8>
    18c6:	00000617          	auipc	a2,0x0
    18ca:	6ca63603          	ld	a2,1738(a2) # 1f90 <__clone+0xe0>
    18ce:	a019                	j	18d4 <strlen+0x38>
    18d0:	6794                	ld	a3,8(a5)
    18d2:	07a1                	add	a5,a5,8
    18d4:	00b68733          	add	a4,a3,a1
    18d8:	fff6c693          	not	a3,a3
    18dc:	8f75                	and	a4,a4,a3
    18de:	8f71                	and	a4,a4,a2
    18e0:	db65                	beqz	a4,18d0 <strlen+0x34>
    for (; *s; s++)
    18e2:	0007c703          	lbu	a4,0(a5)
    18e6:	d779                	beqz	a4,18b4 <strlen+0x18>
    18e8:	0017c703          	lbu	a4,1(a5)
    18ec:	0785                	add	a5,a5,1
    18ee:	d379                	beqz	a4,18b4 <strlen+0x18>
    18f0:	0017c703          	lbu	a4,1(a5)
    18f4:	0785                	add	a5,a5,1
    18f6:	fb6d                	bnez	a4,18e8 <strlen+0x4c>
    18f8:	bf75                	j	18b4 <strlen+0x18>

00000000000018fa <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18fa:	00757713          	and	a4,a0,7
{
    18fe:	87aa                	mv	a5,a0
    1900:	0ff5f593          	zext.b	a1,a1
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1904:	cb19                	beqz	a4,191a <memchr+0x20>
    1906:	ce25                	beqz	a2,197e <memchr+0x84>
    1908:	0007c703          	lbu	a4,0(a5)
    190c:	00b70763          	beq	a4,a1,191a <memchr+0x20>
    1910:	0785                	add	a5,a5,1
    1912:	0077f713          	and	a4,a5,7
    1916:	167d                	add	a2,a2,-1
    1918:	f77d                	bnez	a4,1906 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    191a:	4501                	li	a0,0
    if (n && *s != c)
    191c:	c235                	beqz	a2,1980 <memchr+0x86>
    191e:	0007c703          	lbu	a4,0(a5)
    1922:	06b70063          	beq	a4,a1,1982 <memchr+0x88>
        size_t k = ONES * c;
    1926:	00000517          	auipc	a0,0x0
    192a:	67253503          	ld	a0,1650(a0) # 1f98 <__clone+0xe8>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    192e:	471d                	li	a4,7
        size_t k = ONES * c;
    1930:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1934:	04c77763          	bgeu	a4,a2,1982 <memchr+0x88>
    1938:	00000897          	auipc	a7,0x0
    193c:	6508b883          	ld	a7,1616(a7) # 1f88 <__clone+0xd8>
    1940:	00000817          	auipc	a6,0x0
    1944:	65083803          	ld	a6,1616(a6) # 1f90 <__clone+0xe0>
    1948:	431d                	li	t1,7
    194a:	a029                	j	1954 <memchr+0x5a>
    194c:	1661                	add	a2,a2,-8
    194e:	07a1                	add	a5,a5,8
    1950:	00c37c63          	bgeu	t1,a2,1968 <memchr+0x6e>
    1954:	6398                	ld	a4,0(a5)
    1956:	8f29                	xor	a4,a4,a0
    1958:	011706b3          	add	a3,a4,a7
    195c:	fff74713          	not	a4,a4
    1960:	8f75                	and	a4,a4,a3
    1962:	01077733          	and	a4,a4,a6
    1966:	d37d                	beqz	a4,194c <memchr+0x52>
    1968:	853e                	mv	a0,a5
    for (; n && *s != c; s++, n--)
    196a:	e601                	bnez	a2,1972 <memchr+0x78>
    196c:	a809                	j	197e <memchr+0x84>
    196e:	0505                	add	a0,a0,1
    1970:	c619                	beqz	a2,197e <memchr+0x84>
    1972:	00054783          	lbu	a5,0(a0)
    1976:	167d                	add	a2,a2,-1
    1978:	feb79be3          	bne	a5,a1,196e <memchr+0x74>
    197c:	8082                	ret
    return n ? (void *)s : 0;
    197e:	4501                	li	a0,0
}
    1980:	8082                	ret
    if (n && *s != c)
    1982:	853e                	mv	a0,a5
    1984:	b7fd                	j	1972 <memchr+0x78>

0000000000001986 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1986:	1101                	add	sp,sp,-32
    1988:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    198a:	862e                	mv	a2,a1
{
    198c:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    198e:	4581                	li	a1,0
{
    1990:	e426                	sd	s1,8(sp)
    1992:	ec06                	sd	ra,24(sp)
    1994:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1996:	f65ff0ef          	jal	18fa <memchr>
    return p ? p - s : n;
    199a:	c519                	beqz	a0,19a8 <strnlen+0x22>
}
    199c:	60e2                	ld	ra,24(sp)
    199e:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    19a0:	8d05                	sub	a0,a0,s1
}
    19a2:	64a2                	ld	s1,8(sp)
    19a4:	6105                	add	sp,sp,32
    19a6:	8082                	ret
    19a8:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    19aa:	8522                	mv	a0,s0
}
    19ac:	6442                	ld	s0,16(sp)
    19ae:	64a2                	ld	s1,8(sp)
    19b0:	6105                	add	sp,sp,32
    19b2:	8082                	ret

00000000000019b4 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19b4:	00a5c7b3          	xor	a5,a1,a0
    19b8:	8b9d                	and	a5,a5,7
    19ba:	eb95                	bnez	a5,19ee <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19bc:	0075f793          	and	a5,a1,7
    19c0:	e7b1                	bnez	a5,1a0c <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19c2:	6198                	ld	a4,0(a1)
    19c4:	00000617          	auipc	a2,0x0
    19c8:	5c463603          	ld	a2,1476(a2) # 1f88 <__clone+0xd8>
    19cc:	00000817          	auipc	a6,0x0
    19d0:	5c483803          	ld	a6,1476(a6) # 1f90 <__clone+0xe0>
    19d4:	a029                	j	19de <strcpy+0x2a>
    19d6:	05a1                	add	a1,a1,8
    19d8:	e118                	sd	a4,0(a0)
    19da:	6198                	ld	a4,0(a1)
    19dc:	0521                	add	a0,a0,8
    19de:	00c707b3          	add	a5,a4,a2
    19e2:	fff74693          	not	a3,a4
    19e6:	8ff5                	and	a5,a5,a3
    19e8:	0107f7b3          	and	a5,a5,a6
    19ec:	d7ed                	beqz	a5,19d6 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19ee:	0005c783          	lbu	a5,0(a1)
    19f2:	00f50023          	sb	a5,0(a0)
    19f6:	c785                	beqz	a5,1a1e <strcpy+0x6a>
    19f8:	0015c783          	lbu	a5,1(a1)
    19fc:	0505                	add	a0,a0,1
    19fe:	0585                	add	a1,a1,1
    1a00:	00f50023          	sb	a5,0(a0)
    1a04:	fbf5                	bnez	a5,19f8 <strcpy+0x44>
        ;
    return d;
}
    1a06:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1a08:	0505                	add	a0,a0,1
    1a0a:	df45                	beqz	a4,19c2 <strcpy+0xe>
            if (!(*d = *s))
    1a0c:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1a10:	0585                	add	a1,a1,1
    1a12:	0075f713          	and	a4,a1,7
            if (!(*d = *s))
    1a16:	00f50023          	sb	a5,0(a0)
    1a1a:	f7fd                	bnez	a5,1a08 <strcpy+0x54>
}
    1a1c:	8082                	ret
    1a1e:	8082                	ret

0000000000001a20 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a20:	00a5c7b3          	xor	a5,a1,a0
    1a24:	8b9d                	and	a5,a5,7
    1a26:	e3b5                	bnez	a5,1a8a <strncpy+0x6a>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a28:	0075f793          	and	a5,a1,7
    1a2c:	cf99                	beqz	a5,1a4a <strncpy+0x2a>
    1a2e:	ea09                	bnez	a2,1a40 <strncpy+0x20>
    1a30:	a421                	j	1c38 <strncpy+0x218>
    1a32:	0585                	add	a1,a1,1
    1a34:	0075f793          	and	a5,a1,7
    1a38:	167d                	add	a2,a2,-1
    1a3a:	0505                	add	a0,a0,1
    1a3c:	c799                	beqz	a5,1a4a <strncpy+0x2a>
    1a3e:	c225                	beqz	a2,1a9e <strncpy+0x7e>
    1a40:	0005c783          	lbu	a5,0(a1)
    1a44:	00f50023          	sb	a5,0(a0)
    1a48:	f7ed                	bnez	a5,1a32 <strncpy+0x12>
            ;
        if (!n || !*s)
    1a4a:	ca31                	beqz	a2,1a9e <strncpy+0x7e>
    1a4c:	0005c783          	lbu	a5,0(a1)
    1a50:	cba1                	beqz	a5,1aa0 <strncpy+0x80>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a52:	479d                	li	a5,7
    1a54:	02c7fc63          	bgeu	a5,a2,1a8c <strncpy+0x6c>
    1a58:	00000897          	auipc	a7,0x0
    1a5c:	5308b883          	ld	a7,1328(a7) # 1f88 <__clone+0xd8>
    1a60:	00000817          	auipc	a6,0x0
    1a64:	53083803          	ld	a6,1328(a6) # 1f90 <__clone+0xe0>
    1a68:	431d                	li	t1,7
    1a6a:	a039                	j	1a78 <strncpy+0x58>
            *wd = *ws;
    1a6c:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a6e:	1661                	add	a2,a2,-8
    1a70:	05a1                	add	a1,a1,8
    1a72:	0521                	add	a0,a0,8
    1a74:	00c37b63          	bgeu	t1,a2,1a8a <strncpy+0x6a>
    1a78:	6198                	ld	a4,0(a1)
    1a7a:	011707b3          	add	a5,a4,a7
    1a7e:	fff74693          	not	a3,a4
    1a82:	8ff5                	and	a5,a5,a3
    1a84:	0107f7b3          	and	a5,a5,a6
    1a88:	d3f5                	beqz	a5,1a6c <strncpy+0x4c>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1a8a:	ca11                	beqz	a2,1a9e <strncpy+0x7e>
    1a8c:	0005c783          	lbu	a5,0(a1)
    1a90:	0585                	add	a1,a1,1
    1a92:	00f50023          	sb	a5,0(a0)
    1a96:	c789                	beqz	a5,1aa0 <strncpy+0x80>
    1a98:	167d                	add	a2,a2,-1
    1a9a:	0505                	add	a0,a0,1
    1a9c:	fa65                	bnez	a2,1a8c <strncpy+0x6c>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1a9e:	8082                	ret
    1aa0:	4805                	li	a6,1
    1aa2:	14061b63          	bnez	a2,1bf8 <strncpy+0x1d8>
    1aa6:	40a00733          	neg	a4,a0
    1aaa:	00777793          	and	a5,a4,7
    1aae:	4581                	li	a1,0
    1ab0:	12061c63          	bnez	a2,1be8 <strncpy+0x1c8>
    1ab4:	00778693          	add	a3,a5,7
    1ab8:	48ad                	li	a7,11
    1aba:	1316e563          	bltu	a3,a7,1be4 <strncpy+0x1c4>
    1abe:	16d5e263          	bltu	a1,a3,1c22 <strncpy+0x202>
    1ac2:	14078c63          	beqz	a5,1c1a <strncpy+0x1fa>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ac6:	00050023          	sb	zero,0(a0)
    1aca:	00677693          	and	a3,a4,6
    1ace:	14068263          	beqz	a3,1c12 <strncpy+0x1f2>
    1ad2:	000500a3          	sb	zero,1(a0)
    1ad6:	4689                	li	a3,2
    1ad8:	14f6f863          	bgeu	a3,a5,1c28 <strncpy+0x208>
    1adc:	00050123          	sb	zero,2(a0)
    1ae0:	8b11                	and	a4,a4,4
    1ae2:	12070463          	beqz	a4,1c0a <strncpy+0x1ea>
    1ae6:	000501a3          	sb	zero,3(a0)
    1aea:	4711                	li	a4,4
    1aec:	00450693          	add	a3,a0,4
    1af0:	02f77563          	bgeu	a4,a5,1b1a <strncpy+0xfa>
    1af4:	00050223          	sb	zero,4(a0)
    1af8:	4715                	li	a4,5
    1afa:	00550693          	add	a3,a0,5
    1afe:	00e78e63          	beq	a5,a4,1b1a <strncpy+0xfa>
    1b02:	fff50713          	add	a4,a0,-1
    1b06:	000502a3          	sb	zero,5(a0)
    1b0a:	8b1d                	and	a4,a4,7
    1b0c:	12071263          	bnez	a4,1c30 <strncpy+0x210>
    1b10:	00750693          	add	a3,a0,7
    1b14:	00050323          	sb	zero,6(a0)
    1b18:	471d                	li	a4,7
    1b1a:	40f80833          	sub	a6,a6,a5
    1b1e:	ff887593          	and	a1,a6,-8
    1b22:	97aa                	add	a5,a5,a0
    1b24:	95be                	add	a1,a1,a5
    1b26:	0007b023          	sd	zero,0(a5)
    1b2a:	07a1                	add	a5,a5,8
    1b2c:	feb79de3          	bne	a5,a1,1b26 <strncpy+0x106>
    1b30:	ff887593          	and	a1,a6,-8
    1b34:	00787813          	and	a6,a6,7
    1b38:	00e587bb          	addw	a5,a1,a4
    1b3c:	00b68733          	add	a4,a3,a1
    1b40:	0e080063          	beqz	a6,1c20 <strncpy+0x200>
    1b44:	00070023          	sb	zero,0(a4)
    1b48:	0017869b          	addw	a3,a5,1
    1b4c:	f4c6f9e3          	bgeu	a3,a2,1a9e <strncpy+0x7e>
    1b50:	000700a3          	sb	zero,1(a4)
    1b54:	0027869b          	addw	a3,a5,2
    1b58:	f4c6f3e3          	bgeu	a3,a2,1a9e <strncpy+0x7e>
    1b5c:	00070123          	sb	zero,2(a4)
    1b60:	0037869b          	addw	a3,a5,3
    1b64:	f2c6fde3          	bgeu	a3,a2,1a9e <strncpy+0x7e>
    1b68:	000701a3          	sb	zero,3(a4)
    1b6c:	0047869b          	addw	a3,a5,4
    1b70:	f2c6f7e3          	bgeu	a3,a2,1a9e <strncpy+0x7e>
    1b74:	00070223          	sb	zero,4(a4)
    1b78:	0057869b          	addw	a3,a5,5
    1b7c:	f2c6f1e3          	bgeu	a3,a2,1a9e <strncpy+0x7e>
    1b80:	000702a3          	sb	zero,5(a4)
    1b84:	0067869b          	addw	a3,a5,6
    1b88:	f0c6fbe3          	bgeu	a3,a2,1a9e <strncpy+0x7e>
    1b8c:	00070323          	sb	zero,6(a4)
    1b90:	0077869b          	addw	a3,a5,7
    1b94:	f0c6f5e3          	bgeu	a3,a2,1a9e <strncpy+0x7e>
    1b98:	000703a3          	sb	zero,7(a4)
    1b9c:	0087869b          	addw	a3,a5,8
    1ba0:	eec6ffe3          	bgeu	a3,a2,1a9e <strncpy+0x7e>
    1ba4:	00070423          	sb	zero,8(a4)
    1ba8:	0097869b          	addw	a3,a5,9
    1bac:	eec6f9e3          	bgeu	a3,a2,1a9e <strncpy+0x7e>
    1bb0:	000704a3          	sb	zero,9(a4)
    1bb4:	00a7869b          	addw	a3,a5,10
    1bb8:	eec6f3e3          	bgeu	a3,a2,1a9e <strncpy+0x7e>
    1bbc:	00070523          	sb	zero,10(a4)
    1bc0:	00b7869b          	addw	a3,a5,11
    1bc4:	ecc6fde3          	bgeu	a3,a2,1a9e <strncpy+0x7e>
    1bc8:	000705a3          	sb	zero,11(a4)
    1bcc:	00c7869b          	addw	a3,a5,12
    1bd0:	ecc6f7e3          	bgeu	a3,a2,1a9e <strncpy+0x7e>
    1bd4:	00070623          	sb	zero,12(a4)
    1bd8:	27b5                	addw	a5,a5,13
    1bda:	ecc7f2e3          	bgeu	a5,a2,1a9e <strncpy+0x7e>
    1bde:	000706a3          	sb	zero,13(a4)
}
    1be2:	8082                	ret
    1be4:	46ad                	li	a3,11
    1be6:	bde1                	j	1abe <strncpy+0x9e>
    1be8:	00778693          	add	a3,a5,7
    1bec:	48ad                	li	a7,11
    1bee:	fff60593          	add	a1,a2,-1
    1bf2:	ed16f6e3          	bgeu	a3,a7,1abe <strncpy+0x9e>
    1bf6:	b7fd                	j	1be4 <strncpy+0x1c4>
    1bf8:	40a00733          	neg	a4,a0
    1bfc:	8832                	mv	a6,a2
    1bfe:	00777793          	and	a5,a4,7
    1c02:	4581                	li	a1,0
    1c04:	ea0608e3          	beqz	a2,1ab4 <strncpy+0x94>
    1c08:	b7c5                	j	1be8 <strncpy+0x1c8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c0a:	00350693          	add	a3,a0,3
    1c0e:	470d                	li	a4,3
    1c10:	b729                	j	1b1a <strncpy+0xfa>
    1c12:	00150693          	add	a3,a0,1
    1c16:	4705                	li	a4,1
    1c18:	b709                	j	1b1a <strncpy+0xfa>
tail:
    1c1a:	86aa                	mv	a3,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c1c:	4701                	li	a4,0
    1c1e:	bdf5                	j	1b1a <strncpy+0xfa>
    1c20:	8082                	ret
tail:
    1c22:	872a                	mv	a4,a0
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c24:	4781                	li	a5,0
    1c26:	bf39                	j	1b44 <strncpy+0x124>
    1c28:	00250693          	add	a3,a0,2
    1c2c:	4709                	li	a4,2
    1c2e:	b5f5                	j	1b1a <strncpy+0xfa>
    1c30:	00650693          	add	a3,a0,6
    1c34:	4719                	li	a4,6
    1c36:	b5d5                	j	1b1a <strncpy+0xfa>
    1c38:	8082                	ret

0000000000001c3a <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c3a:	87aa                	mv	a5,a0
    1c3c:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c3e:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c42:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c46:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c48:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c4a:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c4e:	2501                	sext.w	a0,a0
    1c50:	8082                	ret

0000000000001c52 <openat>:
    register long a7 __asm__("a7") = n;
    1c52:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c56:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c5a:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c5e:	2501                	sext.w	a0,a0
    1c60:	8082                	ret

0000000000001c62 <close>:
    register long a7 __asm__("a7") = n;
    1c62:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c66:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c6a:	2501                	sext.w	a0,a0
    1c6c:	8082                	ret

0000000000001c6e <read>:
    register long a7 __asm__("a7") = n;
    1c6e:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c72:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c76:	8082                	ret

0000000000001c78 <write>:
    register long a7 __asm__("a7") = n;
    1c78:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c7c:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c80:	8082                	ret

0000000000001c82 <getpid>:
    register long a7 __asm__("a7") = n;
    1c82:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c86:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c8a:	2501                	sext.w	a0,a0
    1c8c:	8082                	ret

0000000000001c8e <getppid>:
    register long a7 __asm__("a7") = n;
    1c8e:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c92:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c96:	2501                	sext.w	a0,a0
    1c98:	8082                	ret

0000000000001c9a <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c9a:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c9e:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1ca2:	2501                	sext.w	a0,a0
    1ca4:	8082                	ret

0000000000001ca6 <fork>:
    register long a7 __asm__("a7") = n;
    1ca6:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1caa:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1cac:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cae:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1cb2:	2501                	sext.w	a0,a0
    1cb4:	8082                	ret

0000000000001cb6 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1cb6:	85b2                	mv	a1,a2
    1cb8:	863a                	mv	a2,a4
    if (stack)
    1cba:	c191                	beqz	a1,1cbe <clone+0x8>
	stack += stack_size;
    1cbc:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cbe:	4781                	li	a5,0
    1cc0:	4701                	li	a4,0
    1cc2:	4681                	li	a3,0
    1cc4:	2601                	sext.w	a2,a2
    1cc6:	a2ed                	j	1eb0 <__clone>

0000000000001cc8 <exit>:
    register long a7 __asm__("a7") = n;
    1cc8:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1ccc:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cd0:	8082                	ret

0000000000001cd2 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cd2:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cd6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cd8:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cdc:	2501                	sext.w	a0,a0
    1cde:	8082                	ret

0000000000001ce0 <exec>:
    register long a7 __asm__("a7") = n;
    1ce0:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1ce4:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1ce8:	2501                	sext.w	a0,a0
    1cea:	8082                	ret

0000000000001cec <execve>:
    register long a7 __asm__("a7") = n;
    1cec:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cf0:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cf4:	2501                	sext.w	a0,a0
    1cf6:	8082                	ret

0000000000001cf8 <times>:
    register long a7 __asm__("a7") = n;
    1cf8:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cfc:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d00:	2501                	sext.w	a0,a0
    1d02:	8082                	ret

0000000000001d04 <get_time>:

int64 get_time()
{
    1d04:	1141                	add	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d06:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d0a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d0c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d0e:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d12:	2501                	sext.w	a0,a0
    1d14:	ed09                	bnez	a0,1d2e <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d16:	67a2                	ld	a5,8(sp)
    1d18:	3e800713          	li	a4,1000
    1d1c:	00015503          	lhu	a0,0(sp)
    1d20:	02e7d7b3          	divu	a5,a5,a4
    1d24:	02e50533          	mul	a0,a0,a4
    1d28:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d2a:	0141                	add	sp,sp,16
    1d2c:	8082                	ret
        return -1;
    1d2e:	557d                	li	a0,-1
    1d30:	bfed                	j	1d2a <get_time+0x26>

0000000000001d32 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d32:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d36:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d3a:	2501                	sext.w	a0,a0
    1d3c:	8082                	ret

0000000000001d3e <time>:
    register long a7 __asm__("a7") = n;
    1d3e:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d42:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d46:	2501                	sext.w	a0,a0
    1d48:	8082                	ret

0000000000001d4a <sleep>:

int sleep(unsigned long long time)
{
    1d4a:	1141                	add	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d4c:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d4e:	850a                	mv	a0,sp
    1d50:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d52:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d56:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d58:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d5c:	e501                	bnez	a0,1d64 <sleep+0x1a>
    return 0;
    1d5e:	4501                	li	a0,0
}
    1d60:	0141                	add	sp,sp,16
    1d62:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d64:	4502                	lw	a0,0(sp)
}
    1d66:	0141                	add	sp,sp,16
    1d68:	8082                	ret

0000000000001d6a <set_priority>:
    register long a7 __asm__("a7") = n;
    1d6a:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d6e:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d72:	2501                	sext.w	a0,a0
    1d74:	8082                	ret

0000000000001d76 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d76:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d7a:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d7e:	8082                	ret

0000000000001d80 <munmap>:
    register long a7 __asm__("a7") = n;
    1d80:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d84:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d88:	2501                	sext.w	a0,a0
    1d8a:	8082                	ret

0000000000001d8c <wait>:

int wait(int *code)
{
    1d8c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d8e:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d92:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d94:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d96:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d98:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d9c:	2501                	sext.w	a0,a0
    1d9e:	8082                	ret

0000000000001da0 <spawn>:
    register long a7 __asm__("a7") = n;
    1da0:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1da4:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1da8:	2501                	sext.w	a0,a0
    1daa:	8082                	ret

0000000000001dac <mailread>:
    register long a7 __asm__("a7") = n;
    1dac:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db0:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1db4:	2501                	sext.w	a0,a0
    1db6:	8082                	ret

0000000000001db8 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1db8:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dbc:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1dc0:	2501                	sext.w	a0,a0
    1dc2:	8082                	ret

0000000000001dc4 <fstat>:
    register long a7 __asm__("a7") = n;
    1dc4:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc8:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dcc:	2501                	sext.w	a0,a0
    1dce:	8082                	ret

0000000000001dd0 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dd0:	1702                	sll	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dd2:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dd6:	9301                	srl	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dd8:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1ddc:	2501                	sext.w	a0,a0
    1dde:	8082                	ret

0000000000001de0 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1de0:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1de2:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1de6:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de8:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1dec:	2501                	sext.w	a0,a0
    1dee:	8082                	ret

0000000000001df0 <link>:

int link(char *old_path, char *new_path)
{
    1df0:	87aa                	mv	a5,a0
    1df2:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1df4:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1df8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dfc:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dfe:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e02:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e04:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e08:	2501                	sext.w	a0,a0
    1e0a:	8082                	ret

0000000000001e0c <unlink>:

int unlink(char *path)
{
    1e0c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e0e:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e12:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e16:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e18:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <uname>:
    register long a7 __asm__("a7") = n;
    1e20:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e24:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <brk>:
    register long a7 __asm__("a7") = n;
    1e2c:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e30:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e38:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e3a:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e3e:	8082                	ret

0000000000001e40 <chdir>:
    register long a7 __asm__("a7") = n;
    1e40:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e44:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e48:	2501                	sext.w	a0,a0
    1e4a:	8082                	ret

0000000000001e4c <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e4c:	862e                	mv	a2,a1
    1e4e:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e50:	1602                	sll	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e52:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e56:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e5a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e5c:	9201                	srl	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e5e:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e62:	2501                	sext.w	a0,a0
    1e64:	8082                	ret

0000000000001e66 <getdents>:
    register long a7 __asm__("a7") = n;
    1e66:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e6a:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e6e:	2501                	sext.w	a0,a0
    1e70:	8082                	ret

0000000000001e72 <pipe>:
    register long a7 __asm__("a7") = n;
    1e72:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e76:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e78:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e7c:	2501                	sext.w	a0,a0
    1e7e:	8082                	ret

0000000000001e80 <dup>:
    register long a7 __asm__("a7") = n;
    1e80:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e82:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e86:	2501                	sext.w	a0,a0
    1e88:	8082                	ret

0000000000001e8a <dup2>:
    register long a7 __asm__("a7") = n;
    1e8a:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e8c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e8e:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e92:	2501                	sext.w	a0,a0
    1e94:	8082                	ret

0000000000001e96 <mount>:
    register long a7 __asm__("a7") = n;
    1e96:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e9a:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e9e:	2501                	sext.w	a0,a0
    1ea0:	8082                	ret

0000000000001ea2 <umount>:
    register long a7 __asm__("a7") = n;
    1ea2:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ea6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea8:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1eac:	2501                	sext.w	a0,a0
    1eae:	8082                	ret

0000000000001eb0 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1eb0:	15c1                	add	a1,a1,-16
	sd a0, 0(a1)
    1eb2:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1eb4:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1eb6:	8532                	mv	a0,a2
	mv a2, a4
    1eb8:	863a                	mv	a2,a4
	mv a3, a5
    1eba:	86be                	mv	a3,a5
	mv a4, a6
    1ebc:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ebe:	0dc00893          	li	a7,220
	ecall
    1ec2:	00000073          	ecall

	beqz a0, 1f
    1ec6:	c111                	beqz	a0,1eca <__clone+0x1a>
	# Parent
	ret
    1ec8:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1eca:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ecc:	6522                	ld	a0,8(sp)
	jalr a1
    1ece:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ed0:	05d00893          	li	a7,93
	ecall
    1ed4:	00000073          	ecall
