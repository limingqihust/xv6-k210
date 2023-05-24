
/home/lmq/lmq/cscc/xv6-k210/test/build/riscv64/yield:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a86d                	j	10bc <__start_main>

0000000000001004 <test_yield>:

/*
理想结果：三个子进程交替输出
*/

int test_yield(){
    1004:	7179                	addi	sp,sp,-48
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	e7250513          	addi	a0,a0,-398 # 1e78 <__clone+0x2c>
int test_yield(){
    100e:	f406                	sd	ra,40(sp)
    1010:	f022                	sd	s0,32(sp)
    1012:	e84a                	sd	s2,16(sp)
    1014:	e44e                	sd	s3,8(sp)
    1016:	ec26                	sd	s1,24(sp)
    TEST_START(__func__);
    1018:	2a2000ef          	jal	ra,12ba <puts>
    101c:	00001517          	auipc	a0,0x1
    1020:	ee450513          	addi	a0,a0,-284 # 1f00 <__func__.1163>
    1024:	296000ef          	jal	ra,12ba <puts>
    1028:	00001517          	auipc	a0,0x1
    102c:	e6850513          	addi	a0,a0,-408 # 1e90 <__clone+0x44>
    1030:	28a000ef          	jal	ra,12ba <puts>

    for (int i = 0; i < 3; ++i)
    1034:	4401                	li	s0,0
        if(fork() == 0)
        {
            for (int j = 0; j< 5; ++j)
            {
                sched_yield();
                printf("  I am child process: %d. iteration %d.\n", getpid(), i);
    1036:	00001917          	auipc	s2,0x1
    103a:	e6a90913          	addi	s2,s2,-406 # 1ea0 <__clone+0x54>
    for (int i = 0; i < 3; ++i)
    103e:	498d                	li	s3,3
        if(fork() == 0)
    1040:	403000ef          	jal	ra,1c42 <fork>
    1044:	c521                	beqz	a0,108c <test_yield+0x88>
    for (int i = 0; i < 3; ++i)
    1046:	2405                	addiw	s0,s0,1
    1048:	ff341ce3          	bne	s0,s3,1040 <test_yield+0x3c>
            }
            exit(0);
        }
    }
    wait(NULL);
    104c:	4501                	li	a0,0
    104e:	4db000ef          	jal	ra,1d28 <wait>
    wait(NULL);
    1052:	4501                	li	a0,0
    1054:	4d5000ef          	jal	ra,1d28 <wait>
    wait(NULL);
    1058:	4501                	li	a0,0
    105a:	4cf000ef          	jal	ra,1d28 <wait>
    TEST_END(__func__);
    105e:	00001517          	auipc	a0,0x1
    1062:	e7250513          	addi	a0,a0,-398 # 1ed0 <__clone+0x84>
    1066:	254000ef          	jal	ra,12ba <puts>
    106a:	00001517          	auipc	a0,0x1
    106e:	e9650513          	addi	a0,a0,-362 # 1f00 <__func__.1163>
    1072:	248000ef          	jal	ra,12ba <puts>
}
    1076:	7402                	ld	s0,32(sp)
    1078:	70a2                	ld	ra,40(sp)
    107a:	64e2                	ld	s1,24(sp)
    107c:	6942                	ld	s2,16(sp)
    107e:	69a2                	ld	s3,8(sp)
    TEST_END(__func__);
    1080:	00001517          	auipc	a0,0x1
    1084:	e1050513          	addi	a0,a0,-496 # 1e90 <__clone+0x44>
}
    1088:	6145                	addi	sp,sp,48
    TEST_END(__func__);
    108a:	ac05                	j	12ba <puts>
    108c:	4495                	li	s1,5
                sched_yield();
    108e:	3a9000ef          	jal	ra,1c36 <sched_yield>
                printf("  I am child process: %d. iteration %d.\n", getpid(), i);
    1092:	38d000ef          	jal	ra,1c1e <getpid>
    1096:	85aa                	mv	a1,a0
    1098:	34fd                	addiw	s1,s1,-1
    109a:	8622                	mv	a2,s0
    109c:	854a                	mv	a0,s2
    109e:	23e000ef          	jal	ra,12dc <printf>
            for (int j = 0; j< 5; ++j)
    10a2:	f4f5                	bnez	s1,108e <test_yield+0x8a>
            exit(0);
    10a4:	4501                	li	a0,0
    10a6:	3bf000ef          	jal	ra,1c64 <exit>
    10aa:	bf71                	j	1046 <test_yield+0x42>

00000000000010ac <main>:

int main(void) {
    10ac:	1141                	addi	sp,sp,-16
    10ae:	e406                	sd	ra,8(sp)
    test_yield();
    10b0:	f55ff0ef          	jal	ra,1004 <test_yield>
    return 0;
}
    10b4:	60a2                	ld	ra,8(sp)
    10b6:	4501                	li	a0,0
    10b8:	0141                	addi	sp,sp,16
    10ba:	8082                	ret

00000000000010bc <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10bc:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10be:	4108                	lw	a0,0(a0)
{
    10c0:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10c2:	05a1                	addi	a1,a1,8
{
    10c4:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10c6:	fe7ff0ef          	jal	ra,10ac <main>
    10ca:	39b000ef          	jal	ra,1c64 <exit>
	return 0;
}
    10ce:	60a2                	ld	ra,8(sp)
    10d0:	4501                	li	a0,0
    10d2:	0141                	addi	sp,sp,16
    10d4:	8082                	ret

00000000000010d6 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10d6:	7179                	addi	sp,sp,-48
    10d8:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10da:	12054b63          	bltz	a0,1210 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10de:	02b577bb          	remuw	a5,a0,a1
    10e2:	00001697          	auipc	a3,0x1
    10e6:	e2e68693          	addi	a3,a3,-466 # 1f10 <digits>
    buf[16] = 0;
    10ea:	00010c23          	sb	zero,24(sp)
    i = 15;
    10ee:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    10f2:	1782                	slli	a5,a5,0x20
    10f4:	9381                	srli	a5,a5,0x20
    10f6:	97b6                	add	a5,a5,a3
    10f8:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10fc:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1100:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1104:	16b56263          	bltu	a0,a1,1268 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    1108:	02e8763b          	remuw	a2,a6,a4
    110c:	1602                	slli	a2,a2,0x20
    110e:	9201                	srli	a2,a2,0x20
    1110:	9636                	add	a2,a2,a3
    1112:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1116:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    111a:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    111e:	12e86963          	bltu	a6,a4,1250 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    1122:	02e5f63b          	remuw	a2,a1,a4
    1126:	1602                	slli	a2,a2,0x20
    1128:	9201                	srli	a2,a2,0x20
    112a:	9636                	add	a2,a2,a3
    112c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1130:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1134:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    1138:	10e5ef63          	bltu	a1,a4,1256 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    113c:	02e8763b          	remuw	a2,a6,a4
    1140:	1602                	slli	a2,a2,0x20
    1142:	9201                	srli	a2,a2,0x20
    1144:	9636                	add	a2,a2,a3
    1146:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    114a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    114e:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1152:	10e86563          	bltu	a6,a4,125c <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    1156:	02e5f63b          	remuw	a2,a1,a4
    115a:	1602                	slli	a2,a2,0x20
    115c:	9201                	srli	a2,a2,0x20
    115e:	9636                	add	a2,a2,a3
    1160:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1164:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1168:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    116c:	0ee5eb63          	bltu	a1,a4,1262 <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    1170:	02e8763b          	remuw	a2,a6,a4
    1174:	1602                	slli	a2,a2,0x20
    1176:	9201                	srli	a2,a2,0x20
    1178:	9636                	add	a2,a2,a3
    117a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    117e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1182:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1186:	0ce86263          	bltu	a6,a4,124a <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    118a:	02e5f63b          	remuw	a2,a1,a4
    118e:	1602                	slli	a2,a2,0x20
    1190:	9201                	srli	a2,a2,0x20
    1192:	9636                	add	a2,a2,a3
    1194:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1198:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    119c:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11a0:	0ce5e663          	bltu	a1,a4,126c <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    11a4:	02e8763b          	remuw	a2,a6,a4
    11a8:	1602                	slli	a2,a2,0x20
    11aa:	9201                	srli	a2,a2,0x20
    11ac:	9636                	add	a2,a2,a3
    11ae:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b2:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11b6:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11ba:	0ae86c63          	bltu	a6,a4,1272 <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    11be:	02e5f63b          	remuw	a2,a1,a4
    11c2:	1602                	slli	a2,a2,0x20
    11c4:	9201                	srli	a2,a2,0x20
    11c6:	9636                	add	a2,a2,a3
    11c8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11cc:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11d0:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11d4:	0ae5e263          	bltu	a1,a4,1278 <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    11d8:	1782                	slli	a5,a5,0x20
    11da:	9381                	srli	a5,a5,0x20
    11dc:	97b6                	add	a5,a5,a3
    11de:	0007c703          	lbu	a4,0(a5)
    11e2:	4599                	li	a1,6
    11e4:	4795                	li	a5,5
    11e6:	00e10723          	sb	a4,14(sp)

    if (sign)
    11ea:	00055963          	bgez	a0,11fc <printint.constprop.0+0x126>
        buf[i--] = '-';
    11ee:	1018                	addi	a4,sp,32
    11f0:	973e                	add	a4,a4,a5
    11f2:	02d00693          	li	a3,45
    11f6:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    11fa:	85be                	mv	a1,a5
    write(f, s, l);
    11fc:	003c                	addi	a5,sp,8
    11fe:	4641                	li	a2,16
    1200:	9e0d                	subw	a2,a2,a1
    1202:	4505                	li	a0,1
    1204:	95be                	add	a1,a1,a5
    1206:	20f000ef          	jal	ra,1c14 <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    120a:	70a2                	ld	ra,40(sp)
    120c:	6145                	addi	sp,sp,48
    120e:	8082                	ret
        x = -xx;
    1210:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1214:	02b677bb          	remuw	a5,a2,a1
    1218:	00001697          	auipc	a3,0x1
    121c:	cf868693          	addi	a3,a3,-776 # 1f10 <digits>
    buf[16] = 0;
    1220:	00010c23          	sb	zero,24(sp)
    i = 15;
    1224:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    1228:	1782                	slli	a5,a5,0x20
    122a:	9381                	srli	a5,a5,0x20
    122c:	97b6                	add	a5,a5,a3
    122e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1232:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1236:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    123a:	ecb677e3          	bgeu	a2,a1,1108 <printint.constprop.0+0x32>
        buf[i--] = '-';
    123e:	02d00793          	li	a5,45
    1242:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1246:	45b9                	li	a1,14
    1248:	bf55                	j	11fc <printint.constprop.0+0x126>
    124a:	47a5                	li	a5,9
    124c:	45a9                	li	a1,10
    124e:	bf71                	j	11ea <printint.constprop.0+0x114>
    1250:	47b5                	li	a5,13
    1252:	45b9                	li	a1,14
    1254:	bf59                	j	11ea <printint.constprop.0+0x114>
    1256:	47b1                	li	a5,12
    1258:	45b5                	li	a1,13
    125a:	bf41                	j	11ea <printint.constprop.0+0x114>
    125c:	47ad                	li	a5,11
    125e:	45b1                	li	a1,12
    1260:	b769                	j	11ea <printint.constprop.0+0x114>
    1262:	47a9                	li	a5,10
    1264:	45ad                	li	a1,11
    1266:	b751                	j	11ea <printint.constprop.0+0x114>
    i = 15;
    1268:	45bd                	li	a1,15
    126a:	bf49                	j	11fc <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    126c:	47a1                	li	a5,8
    126e:	45a5                	li	a1,9
    1270:	bfad                	j	11ea <printint.constprop.0+0x114>
    1272:	479d                	li	a5,7
    1274:	45a1                	li	a1,8
    1276:	bf95                	j	11ea <printint.constprop.0+0x114>
    1278:	4799                	li	a5,6
    127a:	459d                	li	a1,7
    127c:	b7bd                	j	11ea <printint.constprop.0+0x114>

000000000000127e <getchar>:
{
    127e:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1280:	00f10593          	addi	a1,sp,15
    1284:	4605                	li	a2,1
    1286:	4501                	li	a0,0
{
    1288:	ec06                	sd	ra,24(sp)
    char byte = 0;
    128a:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    128e:	17d000ef          	jal	ra,1c0a <read>
}
    1292:	60e2                	ld	ra,24(sp)
    1294:	00f14503          	lbu	a0,15(sp)
    1298:	6105                	addi	sp,sp,32
    129a:	8082                	ret

000000000000129c <putchar>:
{
    129c:	1101                	addi	sp,sp,-32
    129e:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12a0:	00f10593          	addi	a1,sp,15
    12a4:	4605                	li	a2,1
    12a6:	4505                	li	a0,1
{
    12a8:	ec06                	sd	ra,24(sp)
    char byte = c;
    12aa:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12ae:	167000ef          	jal	ra,1c14 <write>
}
    12b2:	60e2                	ld	ra,24(sp)
    12b4:	2501                	sext.w	a0,a0
    12b6:	6105                	addi	sp,sp,32
    12b8:	8082                	ret

00000000000012ba <puts>:
{
    12ba:	1141                	addi	sp,sp,-16
    12bc:	e406                	sd	ra,8(sp)
    12be:	e022                	sd	s0,0(sp)
    12c0:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12c2:	56e000ef          	jal	ra,1830 <strlen>
    12c6:	862a                	mv	a2,a0
    12c8:	85a2                	mv	a1,s0
    12ca:	4505                	li	a0,1
    12cc:	149000ef          	jal	ra,1c14 <write>
}
    12d0:	60a2                	ld	ra,8(sp)
    12d2:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12d4:	957d                	srai	a0,a0,0x3f
    return r;
    12d6:	2501                	sext.w	a0,a0
}
    12d8:	0141                	addi	sp,sp,16
    12da:	8082                	ret

00000000000012dc <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12dc:	7171                	addi	sp,sp,-176
    12de:	fc56                	sd	s5,56(sp)
    12e0:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    12e2:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12e4:	18bc                	addi	a5,sp,120
{
    12e6:	e8ca                	sd	s2,80(sp)
    12e8:	e4ce                	sd	s3,72(sp)
    12ea:	e0d2                	sd	s4,64(sp)
    12ec:	f85a                	sd	s6,48(sp)
    12ee:	f486                	sd	ra,104(sp)
    12f0:	f0a2                	sd	s0,96(sp)
    12f2:	eca6                	sd	s1,88(sp)
    12f4:	fcae                	sd	a1,120(sp)
    12f6:	e132                	sd	a2,128(sp)
    12f8:	e536                	sd	a3,136(sp)
    12fa:	e93a                	sd	a4,144(sp)
    12fc:	f142                	sd	a6,160(sp)
    12fe:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1300:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1302:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1306:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    130a:	00001b17          	auipc	s6,0x1
    130e:	bd6b0b13          	addi	s6,s6,-1066 # 1ee0 <__clone+0x94>
    buf[i++] = '0';
    1312:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1316:	00001997          	auipc	s3,0x1
    131a:	bfa98993          	addi	s3,s3,-1030 # 1f10 <digits>
        if (!*s)
    131e:	00054783          	lbu	a5,0(a0)
    1322:	16078a63          	beqz	a5,1496 <printf+0x1ba>
    1326:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    1328:	19278163          	beq	a5,s2,14aa <printf+0x1ce>
    132c:	00164783          	lbu	a5,1(a2)
    1330:	0605                	addi	a2,a2,1
    1332:	fbfd                	bnez	a5,1328 <printf+0x4c>
    1334:	84b2                	mv	s1,a2
        l = z - a;
    1336:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    133a:	85aa                	mv	a1,a0
    133c:	8622                	mv	a2,s0
    133e:	4505                	li	a0,1
    1340:	0d5000ef          	jal	ra,1c14 <write>
        if (l)
    1344:	18041c63          	bnez	s0,14dc <printf+0x200>
        if (s[1] == 0)
    1348:	0014c783          	lbu	a5,1(s1)
    134c:	14078563          	beqz	a5,1496 <printf+0x1ba>
        switch (s[1])
    1350:	1d478063          	beq	a5,s4,1510 <printf+0x234>
    1354:	18fa6663          	bltu	s4,a5,14e0 <printf+0x204>
    1358:	06400713          	li	a4,100
    135c:	1ae78063          	beq	a5,a4,14fc <printf+0x220>
    1360:	07000713          	li	a4,112
    1364:	1ce79963          	bne	a5,a4,1536 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    1368:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    136a:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    136e:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1370:	631c                	ld	a5,0(a4)
    1372:	0721                	addi	a4,a4,8
    1374:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1376:	00479293          	slli	t0,a5,0x4
    137a:	00879f93          	slli	t6,a5,0x8
    137e:	00c79f13          	slli	t5,a5,0xc
    1382:	01079e93          	slli	t4,a5,0x10
    1386:	01479e13          	slli	t3,a5,0x14
    138a:	01879313          	slli	t1,a5,0x18
    138e:	01c79893          	slli	a7,a5,0x1c
    1392:	02479813          	slli	a6,a5,0x24
    1396:	02879513          	slli	a0,a5,0x28
    139a:	02c79593          	slli	a1,a5,0x2c
    139e:	03079693          	slli	a3,a5,0x30
    13a2:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13a6:	03c7d413          	srli	s0,a5,0x3c
    13aa:	01c7d39b          	srliw	t2,a5,0x1c
    13ae:	03c2d293          	srli	t0,t0,0x3c
    13b2:	03cfdf93          	srli	t6,t6,0x3c
    13b6:	03cf5f13          	srli	t5,t5,0x3c
    13ba:	03cede93          	srli	t4,t4,0x3c
    13be:	03ce5e13          	srli	t3,t3,0x3c
    13c2:	03c35313          	srli	t1,t1,0x3c
    13c6:	03c8d893          	srli	a7,a7,0x3c
    13ca:	03c85813          	srli	a6,a6,0x3c
    13ce:	9171                	srli	a0,a0,0x3c
    13d0:	91f1                	srli	a1,a1,0x3c
    13d2:	92f1                	srli	a3,a3,0x3c
    13d4:	9371                	srli	a4,a4,0x3c
    13d6:	96ce                	add	a3,a3,s3
    13d8:	974e                	add	a4,a4,s3
    13da:	944e                	add	s0,s0,s3
    13dc:	92ce                	add	t0,t0,s3
    13de:	9fce                	add	t6,t6,s3
    13e0:	9f4e                	add	t5,t5,s3
    13e2:	9ece                	add	t4,t4,s3
    13e4:	9e4e                	add	t3,t3,s3
    13e6:	934e                	add	t1,t1,s3
    13e8:	98ce                	add	a7,a7,s3
    13ea:	93ce                	add	t2,t2,s3
    13ec:	984e                	add	a6,a6,s3
    13ee:	954e                	add	a0,a0,s3
    13f0:	95ce                	add	a1,a1,s3
    13f2:	0006c083          	lbu	ra,0(a3)
    13f6:	0002c283          	lbu	t0,0(t0)
    13fa:	00074683          	lbu	a3,0(a4)
    13fe:	000fcf83          	lbu	t6,0(t6)
    1402:	000f4f03          	lbu	t5,0(t5)
    1406:	000ece83          	lbu	t4,0(t4)
    140a:	000e4e03          	lbu	t3,0(t3)
    140e:	00034303          	lbu	t1,0(t1)
    1412:	0008c883          	lbu	a7,0(a7)
    1416:	0003c383          	lbu	t2,0(t2)
    141a:	00084803          	lbu	a6,0(a6)
    141e:	00054503          	lbu	a0,0(a0)
    1422:	0005c583          	lbu	a1,0(a1)
    1426:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    142a:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    142e:	9371                	srli	a4,a4,0x3c
    1430:	8bbd                	andi	a5,a5,15
    1432:	974e                	add	a4,a4,s3
    1434:	97ce                	add	a5,a5,s3
    1436:	005105a3          	sb	t0,11(sp)
    143a:	01f10623          	sb	t6,12(sp)
    143e:	01e106a3          	sb	t5,13(sp)
    1442:	01d10723          	sb	t4,14(sp)
    1446:	01c107a3          	sb	t3,15(sp)
    144a:	00610823          	sb	t1,16(sp)
    144e:	011108a3          	sb	a7,17(sp)
    1452:	00710923          	sb	t2,18(sp)
    1456:	010109a3          	sb	a6,19(sp)
    145a:	00a10a23          	sb	a0,20(sp)
    145e:	00b10aa3          	sb	a1,21(sp)
    1462:	00110b23          	sb	ra,22(sp)
    1466:	00d10ba3          	sb	a3,23(sp)
    146a:	00810523          	sb	s0,10(sp)
    146e:	00074703          	lbu	a4,0(a4)
    1472:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1476:	002c                	addi	a1,sp,8
    1478:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    147a:	00e10c23          	sb	a4,24(sp)
    147e:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1482:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1486:	78e000ef          	jal	ra,1c14 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    148a:	00248513          	addi	a0,s1,2
        if (!*s)
    148e:	00054783          	lbu	a5,0(a0)
    1492:	e8079ae3          	bnez	a5,1326 <printf+0x4a>
    }
    va_end(ap);
}
    1496:	70a6                	ld	ra,104(sp)
    1498:	7406                	ld	s0,96(sp)
    149a:	64e6                	ld	s1,88(sp)
    149c:	6946                	ld	s2,80(sp)
    149e:	69a6                	ld	s3,72(sp)
    14a0:	6a06                	ld	s4,64(sp)
    14a2:	7ae2                	ld	s5,56(sp)
    14a4:	7b42                	ld	s6,48(sp)
    14a6:	614d                	addi	sp,sp,176
    14a8:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14aa:	00064783          	lbu	a5,0(a2)
    14ae:	84b2                	mv	s1,a2
    14b0:	01278963          	beq	a5,s2,14c2 <printf+0x1e6>
    14b4:	b549                	j	1336 <printf+0x5a>
    14b6:	0024c783          	lbu	a5,2(s1)
    14ba:	0605                	addi	a2,a2,1
    14bc:	0489                	addi	s1,s1,2
    14be:	e7279ce3          	bne	a5,s2,1336 <printf+0x5a>
    14c2:	0014c783          	lbu	a5,1(s1)
    14c6:	ff2788e3          	beq	a5,s2,14b6 <printf+0x1da>
        l = z - a;
    14ca:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14ce:	85aa                	mv	a1,a0
    14d0:	8622                	mv	a2,s0
    14d2:	4505                	li	a0,1
    14d4:	740000ef          	jal	ra,1c14 <write>
        if (l)
    14d8:	e60408e3          	beqz	s0,1348 <printf+0x6c>
    14dc:	8526                	mv	a0,s1
    14de:	b581                	j	131e <printf+0x42>
        switch (s[1])
    14e0:	07800713          	li	a4,120
    14e4:	04e79963          	bne	a5,a4,1536 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    14e8:	6782                	ld	a5,0(sp)
    14ea:	45c1                	li	a1,16
    14ec:	4388                	lw	a0,0(a5)
    14ee:	07a1                	addi	a5,a5,8
    14f0:	e03e                	sd	a5,0(sp)
    14f2:	be5ff0ef          	jal	ra,10d6 <printint.constprop.0>
        s += 2;
    14f6:	00248513          	addi	a0,s1,2
    14fa:	bf51                	j	148e <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    14fc:	6782                	ld	a5,0(sp)
    14fe:	45a9                	li	a1,10
    1500:	4388                	lw	a0,0(a5)
    1502:	07a1                	addi	a5,a5,8
    1504:	e03e                	sd	a5,0(sp)
    1506:	bd1ff0ef          	jal	ra,10d6 <printint.constprop.0>
        s += 2;
    150a:	00248513          	addi	a0,s1,2
    150e:	b741                	j	148e <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1510:	6782                	ld	a5,0(sp)
    1512:	6380                	ld	s0,0(a5)
    1514:	07a1                	addi	a5,a5,8
    1516:	e03e                	sd	a5,0(sp)
    1518:	c421                	beqz	s0,1560 <printf+0x284>
            l = strnlen(a, 200);
    151a:	0c800593          	li	a1,200
    151e:	8522                	mv	a0,s0
    1520:	3fc000ef          	jal	ra,191c <strnlen>
    write(f, s, l);
    1524:	0005061b          	sext.w	a2,a0
    1528:	85a2                	mv	a1,s0
    152a:	4505                	li	a0,1
    152c:	6e8000ef          	jal	ra,1c14 <write>
        s += 2;
    1530:	00248513          	addi	a0,s1,2
    1534:	bfa9                	j	148e <printf+0x1b2>
    char byte = c;
    1536:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    153a:	4605                	li	a2,1
    153c:	002c                	addi	a1,sp,8
    153e:	4505                	li	a0,1
    char byte = c;
    1540:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1544:	6d0000ef          	jal	ra,1c14 <write>
    char byte = c;
    1548:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    154c:	4605                	li	a2,1
    154e:	002c                	addi	a1,sp,8
    1550:	4505                	li	a0,1
    char byte = c;
    1552:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1556:	6be000ef          	jal	ra,1c14 <write>
        s += 2;
    155a:	00248513          	addi	a0,s1,2
    155e:	bf05                	j	148e <printf+0x1b2>
                a = "(null)";
    1560:	845a                	mv	s0,s6
    1562:	bf65                	j	151a <printf+0x23e>

0000000000001564 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1564:	02000793          	li	a5,32
    1568:	00f50663          	beq	a0,a5,1574 <isspace+0x10>
    156c:	355d                	addiw	a0,a0,-9
    156e:	00553513          	sltiu	a0,a0,5
    1572:	8082                	ret
    1574:	4505                	li	a0,1
}
    1576:	8082                	ret

0000000000001578 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1578:	fd05051b          	addiw	a0,a0,-48
}
    157c:	00a53513          	sltiu	a0,a0,10
    1580:	8082                	ret

0000000000001582 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1582:	02000613          	li	a2,32
    1586:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1588:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    158c:	ff77069b          	addiw	a3,a4,-9
    1590:	04c70d63          	beq	a4,a2,15ea <atoi+0x68>
    1594:	0007079b          	sext.w	a5,a4
    1598:	04d5f963          	bgeu	a1,a3,15ea <atoi+0x68>
        s++;
    switch (*s)
    159c:	02b00693          	li	a3,43
    15a0:	04d70a63          	beq	a4,a3,15f4 <atoi+0x72>
    15a4:	02d00693          	li	a3,45
    15a8:	06d70463          	beq	a4,a3,1610 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15ac:	fd07859b          	addiw	a1,a5,-48
    15b0:	4625                	li	a2,9
    15b2:	873e                	mv	a4,a5
    15b4:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15b6:	4e01                	li	t3,0
    while (isdigit(*s))
    15b8:	04b66a63          	bltu	a2,a1,160c <atoi+0x8a>
    int n = 0, neg = 0;
    15bc:	4501                	li	a0,0
    while (isdigit(*s))
    15be:	4825                	li	a6,9
    15c0:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    15c4:	0025179b          	slliw	a5,a0,0x2
    15c8:	9d3d                	addw	a0,a0,a5
    15ca:	fd07031b          	addiw	t1,a4,-48
    15ce:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15d2:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15d6:	0685                	addi	a3,a3,1
    15d8:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15dc:	0006071b          	sext.w	a4,a2
    15e0:	feb870e3          	bgeu	a6,a1,15c0 <atoi+0x3e>
    return neg ? n : -n;
    15e4:	000e0563          	beqz	t3,15ee <atoi+0x6c>
}
    15e8:	8082                	ret
        s++;
    15ea:	0505                	addi	a0,a0,1
    15ec:	bf71                	j	1588 <atoi+0x6>
    15ee:	4113053b          	subw	a0,t1,a7
    15f2:	8082                	ret
    while (isdigit(*s))
    15f4:	00154783          	lbu	a5,1(a0)
    15f8:	4625                	li	a2,9
        s++;
    15fa:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    15fe:	fd07859b          	addiw	a1,a5,-48
    1602:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1606:	4e01                	li	t3,0
    while (isdigit(*s))
    1608:	fab67ae3          	bgeu	a2,a1,15bc <atoi+0x3a>
    160c:	4501                	li	a0,0
}
    160e:	8082                	ret
    while (isdigit(*s))
    1610:	00154783          	lbu	a5,1(a0)
    1614:	4625                	li	a2,9
        s++;
    1616:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    161a:	fd07859b          	addiw	a1,a5,-48
    161e:	0007871b          	sext.w	a4,a5
    1622:	feb665e3          	bltu	a2,a1,160c <atoi+0x8a>
        neg = 1;
    1626:	4e05                	li	t3,1
    1628:	bf51                	j	15bc <atoi+0x3a>

000000000000162a <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    162a:	16060d63          	beqz	a2,17a4 <memset+0x17a>
    162e:	40a007b3          	neg	a5,a0
    1632:	8b9d                	andi	a5,a5,7
    1634:	00778713          	addi	a4,a5,7
    1638:	482d                	li	a6,11
    163a:	0ff5f593          	andi	a1,a1,255
    163e:	fff60693          	addi	a3,a2,-1
    1642:	17076263          	bltu	a4,a6,17a6 <memset+0x17c>
    1646:	16e6ea63          	bltu	a3,a4,17ba <memset+0x190>
    164a:	16078563          	beqz	a5,17b4 <memset+0x18a>
    164e:	00b50023          	sb	a1,0(a0)
    1652:	4705                	li	a4,1
    1654:	00150e93          	addi	t4,a0,1
    1658:	14e78c63          	beq	a5,a4,17b0 <memset+0x186>
    165c:	00b500a3          	sb	a1,1(a0)
    1660:	4709                	li	a4,2
    1662:	00250e93          	addi	t4,a0,2
    1666:	14e78d63          	beq	a5,a4,17c0 <memset+0x196>
    166a:	00b50123          	sb	a1,2(a0)
    166e:	470d                	li	a4,3
    1670:	00350e93          	addi	t4,a0,3
    1674:	12e78b63          	beq	a5,a4,17aa <memset+0x180>
    1678:	00b501a3          	sb	a1,3(a0)
    167c:	4711                	li	a4,4
    167e:	00450e93          	addi	t4,a0,4
    1682:	14e78163          	beq	a5,a4,17c4 <memset+0x19a>
    1686:	00b50223          	sb	a1,4(a0)
    168a:	4715                	li	a4,5
    168c:	00550e93          	addi	t4,a0,5
    1690:	12e78c63          	beq	a5,a4,17c8 <memset+0x19e>
    1694:	00b502a3          	sb	a1,5(a0)
    1698:	471d                	li	a4,7
    169a:	00650e93          	addi	t4,a0,6
    169e:	12e79763          	bne	a5,a4,17cc <memset+0x1a2>
    16a2:	00750e93          	addi	t4,a0,7
    16a6:	00b50323          	sb	a1,6(a0)
    16aa:	4f1d                	li	t5,7
    16ac:	00859713          	slli	a4,a1,0x8
    16b0:	8f4d                	or	a4,a4,a1
    16b2:	01059e13          	slli	t3,a1,0x10
    16b6:	01c76e33          	or	t3,a4,t3
    16ba:	01859313          	slli	t1,a1,0x18
    16be:	006e6333          	or	t1,t3,t1
    16c2:	02059893          	slli	a7,a1,0x20
    16c6:	011368b3          	or	a7,t1,a7
    16ca:	02859813          	slli	a6,a1,0x28
    16ce:	40f60333          	sub	t1,a2,a5
    16d2:	0108e833          	or	a6,a7,a6
    16d6:	03059693          	slli	a3,a1,0x30
    16da:	00d866b3          	or	a3,a6,a3
    16de:	03859713          	slli	a4,a1,0x38
    16e2:	97aa                	add	a5,a5,a0
    16e4:	ff837813          	andi	a6,t1,-8
    16e8:	8f55                	or	a4,a4,a3
    16ea:	00f806b3          	add	a3,a6,a5
    16ee:	e398                	sd	a4,0(a5)
    16f0:	07a1                	addi	a5,a5,8
    16f2:	fed79ee3          	bne	a5,a3,16ee <memset+0xc4>
    16f6:	ff837693          	andi	a3,t1,-8
    16fa:	00de87b3          	add	a5,t4,a3
    16fe:	01e6873b          	addw	a4,a3,t5
    1702:	0ad30663          	beq	t1,a3,17ae <memset+0x184>
    1706:	00b78023          	sb	a1,0(a5)
    170a:	0017069b          	addiw	a3,a4,1
    170e:	08c6fb63          	bgeu	a3,a2,17a4 <memset+0x17a>
    1712:	00b780a3          	sb	a1,1(a5)
    1716:	0027069b          	addiw	a3,a4,2
    171a:	08c6f563          	bgeu	a3,a2,17a4 <memset+0x17a>
    171e:	00b78123          	sb	a1,2(a5)
    1722:	0037069b          	addiw	a3,a4,3
    1726:	06c6ff63          	bgeu	a3,a2,17a4 <memset+0x17a>
    172a:	00b781a3          	sb	a1,3(a5)
    172e:	0047069b          	addiw	a3,a4,4
    1732:	06c6f963          	bgeu	a3,a2,17a4 <memset+0x17a>
    1736:	00b78223          	sb	a1,4(a5)
    173a:	0057069b          	addiw	a3,a4,5
    173e:	06c6f363          	bgeu	a3,a2,17a4 <memset+0x17a>
    1742:	00b782a3          	sb	a1,5(a5)
    1746:	0067069b          	addiw	a3,a4,6
    174a:	04c6fd63          	bgeu	a3,a2,17a4 <memset+0x17a>
    174e:	00b78323          	sb	a1,6(a5)
    1752:	0077069b          	addiw	a3,a4,7
    1756:	04c6f763          	bgeu	a3,a2,17a4 <memset+0x17a>
    175a:	00b783a3          	sb	a1,7(a5)
    175e:	0087069b          	addiw	a3,a4,8
    1762:	04c6f163          	bgeu	a3,a2,17a4 <memset+0x17a>
    1766:	00b78423          	sb	a1,8(a5)
    176a:	0097069b          	addiw	a3,a4,9
    176e:	02c6fb63          	bgeu	a3,a2,17a4 <memset+0x17a>
    1772:	00b784a3          	sb	a1,9(a5)
    1776:	00a7069b          	addiw	a3,a4,10
    177a:	02c6f563          	bgeu	a3,a2,17a4 <memset+0x17a>
    177e:	00b78523          	sb	a1,10(a5)
    1782:	00b7069b          	addiw	a3,a4,11
    1786:	00c6ff63          	bgeu	a3,a2,17a4 <memset+0x17a>
    178a:	00b785a3          	sb	a1,11(a5)
    178e:	00c7069b          	addiw	a3,a4,12
    1792:	00c6f963          	bgeu	a3,a2,17a4 <memset+0x17a>
    1796:	00b78623          	sb	a1,12(a5)
    179a:	2735                	addiw	a4,a4,13
    179c:	00c77463          	bgeu	a4,a2,17a4 <memset+0x17a>
    17a0:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17a4:	8082                	ret
    17a6:	472d                	li	a4,11
    17a8:	bd79                	j	1646 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17aa:	4f0d                	li	t5,3
    17ac:	b701                	j	16ac <memset+0x82>
    17ae:	8082                	ret
    17b0:	4f05                	li	t5,1
    17b2:	bded                	j	16ac <memset+0x82>
    17b4:	8eaa                	mv	t4,a0
    17b6:	4f01                	li	t5,0
    17b8:	bdd5                	j	16ac <memset+0x82>
    17ba:	87aa                	mv	a5,a0
    17bc:	4701                	li	a4,0
    17be:	b7a1                	j	1706 <memset+0xdc>
    17c0:	4f09                	li	t5,2
    17c2:	b5ed                	j	16ac <memset+0x82>
    17c4:	4f11                	li	t5,4
    17c6:	b5dd                	j	16ac <memset+0x82>
    17c8:	4f15                	li	t5,5
    17ca:	b5cd                	j	16ac <memset+0x82>
    17cc:	4f19                	li	t5,6
    17ce:	bdf9                	j	16ac <memset+0x82>

00000000000017d0 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17d0:	00054783          	lbu	a5,0(a0)
    17d4:	0005c703          	lbu	a4,0(a1)
    17d8:	00e79863          	bne	a5,a4,17e8 <strcmp+0x18>
    17dc:	0505                	addi	a0,a0,1
    17de:	0585                	addi	a1,a1,1
    17e0:	fbe5                	bnez	a5,17d0 <strcmp>
    17e2:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17e4:	9d19                	subw	a0,a0,a4
    17e6:	8082                	ret
    17e8:	0007851b          	sext.w	a0,a5
    17ec:	bfe5                	j	17e4 <strcmp+0x14>

00000000000017ee <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17ee:	ce05                	beqz	a2,1826 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17f0:	00054703          	lbu	a4,0(a0)
    17f4:	0005c783          	lbu	a5,0(a1)
    17f8:	cb0d                	beqz	a4,182a <strncmp+0x3c>
    if (!n--)
    17fa:	167d                	addi	a2,a2,-1
    17fc:	00c506b3          	add	a3,a0,a2
    1800:	a819                	j	1816 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1802:	00a68e63          	beq	a3,a0,181e <strncmp+0x30>
    1806:	0505                	addi	a0,a0,1
    1808:	00e79b63          	bne	a5,a4,181e <strncmp+0x30>
    180c:	00054703          	lbu	a4,0(a0)
    1810:	0005c783          	lbu	a5,0(a1)
    1814:	cb19                	beqz	a4,182a <strncmp+0x3c>
    1816:	0005c783          	lbu	a5,0(a1)
    181a:	0585                	addi	a1,a1,1
    181c:	f3fd                	bnez	a5,1802 <strncmp+0x14>
        ;
    return *l - *r;
    181e:	0007051b          	sext.w	a0,a4
    1822:	9d1d                	subw	a0,a0,a5
    1824:	8082                	ret
        return 0;
    1826:	4501                	li	a0,0
}
    1828:	8082                	ret
    182a:	4501                	li	a0,0
    return *l - *r;
    182c:	9d1d                	subw	a0,a0,a5
    182e:	8082                	ret

0000000000001830 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1830:	00757793          	andi	a5,a0,7
    1834:	cf89                	beqz	a5,184e <strlen+0x1e>
    1836:	87aa                	mv	a5,a0
    1838:	a029                	j	1842 <strlen+0x12>
    183a:	0785                	addi	a5,a5,1
    183c:	0077f713          	andi	a4,a5,7
    1840:	cb01                	beqz	a4,1850 <strlen+0x20>
        if (!*s)
    1842:	0007c703          	lbu	a4,0(a5)
    1846:	fb75                	bnez	a4,183a <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1848:	40a78533          	sub	a0,a5,a0
}
    184c:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    184e:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1850:	6394                	ld	a3,0(a5)
    1852:	00000597          	auipc	a1,0x0
    1856:	6965b583          	ld	a1,1686(a1) # 1ee8 <__clone+0x9c>
    185a:	00000617          	auipc	a2,0x0
    185e:	69663603          	ld	a2,1686(a2) # 1ef0 <__clone+0xa4>
    1862:	a019                	j	1868 <strlen+0x38>
    1864:	6794                	ld	a3,8(a5)
    1866:	07a1                	addi	a5,a5,8
    1868:	00b68733          	add	a4,a3,a1
    186c:	fff6c693          	not	a3,a3
    1870:	8f75                	and	a4,a4,a3
    1872:	8f71                	and	a4,a4,a2
    1874:	db65                	beqz	a4,1864 <strlen+0x34>
    for (; *s; s++)
    1876:	0007c703          	lbu	a4,0(a5)
    187a:	d779                	beqz	a4,1848 <strlen+0x18>
    187c:	0017c703          	lbu	a4,1(a5)
    1880:	0785                	addi	a5,a5,1
    1882:	d379                	beqz	a4,1848 <strlen+0x18>
    1884:	0017c703          	lbu	a4,1(a5)
    1888:	0785                	addi	a5,a5,1
    188a:	fb6d                	bnez	a4,187c <strlen+0x4c>
    188c:	bf75                	j	1848 <strlen+0x18>

000000000000188e <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    188e:	00757713          	andi	a4,a0,7
{
    1892:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1894:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1898:	cb19                	beqz	a4,18ae <memchr+0x20>
    189a:	ce25                	beqz	a2,1912 <memchr+0x84>
    189c:	0007c703          	lbu	a4,0(a5)
    18a0:	04b70e63          	beq	a4,a1,18fc <memchr+0x6e>
    18a4:	0785                	addi	a5,a5,1
    18a6:	0077f713          	andi	a4,a5,7
    18aa:	167d                	addi	a2,a2,-1
    18ac:	f77d                	bnez	a4,189a <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18ae:	4501                	li	a0,0
    if (n && *s != c)
    18b0:	c235                	beqz	a2,1914 <memchr+0x86>
    18b2:	0007c703          	lbu	a4,0(a5)
    18b6:	04b70363          	beq	a4,a1,18fc <memchr+0x6e>
        size_t k = ONES * c;
    18ba:	00000517          	auipc	a0,0x0
    18be:	63e53503          	ld	a0,1598(a0) # 1ef8 <__clone+0xac>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18c2:	471d                	li	a4,7
        size_t k = ONES * c;
    18c4:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18c8:	02c77a63          	bgeu	a4,a2,18fc <memchr+0x6e>
    18cc:	00000897          	auipc	a7,0x0
    18d0:	61c8b883          	ld	a7,1564(a7) # 1ee8 <__clone+0x9c>
    18d4:	00000817          	auipc	a6,0x0
    18d8:	61c83803          	ld	a6,1564(a6) # 1ef0 <__clone+0xa4>
    18dc:	431d                	li	t1,7
    18de:	a029                	j	18e8 <memchr+0x5a>
    18e0:	1661                	addi	a2,a2,-8
    18e2:	07a1                	addi	a5,a5,8
    18e4:	02c37963          	bgeu	t1,a2,1916 <memchr+0x88>
    18e8:	6398                	ld	a4,0(a5)
    18ea:	8f29                	xor	a4,a4,a0
    18ec:	011706b3          	add	a3,a4,a7
    18f0:	fff74713          	not	a4,a4
    18f4:	8f75                	and	a4,a4,a3
    18f6:	01077733          	and	a4,a4,a6
    18fa:	d37d                	beqz	a4,18e0 <memchr+0x52>
    18fc:	853e                	mv	a0,a5
    18fe:	97b2                	add	a5,a5,a2
    1900:	a021                	j	1908 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1902:	0505                	addi	a0,a0,1
    1904:	00f50763          	beq	a0,a5,1912 <memchr+0x84>
    1908:	00054703          	lbu	a4,0(a0)
    190c:	feb71be3          	bne	a4,a1,1902 <memchr+0x74>
    1910:	8082                	ret
    return n ? (void *)s : 0;
    1912:	4501                	li	a0,0
}
    1914:	8082                	ret
    return n ? (void *)s : 0;
    1916:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1918:	f275                	bnez	a2,18fc <memchr+0x6e>
}
    191a:	8082                	ret

000000000000191c <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    191c:	1101                	addi	sp,sp,-32
    191e:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1920:	862e                	mv	a2,a1
{
    1922:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1924:	4581                	li	a1,0
{
    1926:	e426                	sd	s1,8(sp)
    1928:	ec06                	sd	ra,24(sp)
    192a:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    192c:	f63ff0ef          	jal	ra,188e <memchr>
    return p ? p - s : n;
    1930:	c519                	beqz	a0,193e <strnlen+0x22>
}
    1932:	60e2                	ld	ra,24(sp)
    1934:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1936:	8d05                	sub	a0,a0,s1
}
    1938:	64a2                	ld	s1,8(sp)
    193a:	6105                	addi	sp,sp,32
    193c:	8082                	ret
    193e:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1940:	8522                	mv	a0,s0
}
    1942:	6442                	ld	s0,16(sp)
    1944:	64a2                	ld	s1,8(sp)
    1946:	6105                	addi	sp,sp,32
    1948:	8082                	ret

000000000000194a <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    194a:	00b547b3          	xor	a5,a0,a1
    194e:	8b9d                	andi	a5,a5,7
    1950:	eb95                	bnez	a5,1984 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1952:	0075f793          	andi	a5,a1,7
    1956:	e7b1                	bnez	a5,19a2 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1958:	6198                	ld	a4,0(a1)
    195a:	00000617          	auipc	a2,0x0
    195e:	58e63603          	ld	a2,1422(a2) # 1ee8 <__clone+0x9c>
    1962:	00000817          	auipc	a6,0x0
    1966:	58e83803          	ld	a6,1422(a6) # 1ef0 <__clone+0xa4>
    196a:	a029                	j	1974 <strcpy+0x2a>
    196c:	e118                	sd	a4,0(a0)
    196e:	6598                	ld	a4,8(a1)
    1970:	05a1                	addi	a1,a1,8
    1972:	0521                	addi	a0,a0,8
    1974:	00c707b3          	add	a5,a4,a2
    1978:	fff74693          	not	a3,a4
    197c:	8ff5                	and	a5,a5,a3
    197e:	0107f7b3          	and	a5,a5,a6
    1982:	d7ed                	beqz	a5,196c <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1984:	0005c783          	lbu	a5,0(a1)
    1988:	00f50023          	sb	a5,0(a0)
    198c:	c785                	beqz	a5,19b4 <strcpy+0x6a>
    198e:	0015c783          	lbu	a5,1(a1)
    1992:	0505                	addi	a0,a0,1
    1994:	0585                	addi	a1,a1,1
    1996:	00f50023          	sb	a5,0(a0)
    199a:	fbf5                	bnez	a5,198e <strcpy+0x44>
        ;
    return d;
}
    199c:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    199e:	0505                	addi	a0,a0,1
    19a0:	df45                	beqz	a4,1958 <strcpy+0xe>
            if (!(*d = *s))
    19a2:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19a6:	0585                	addi	a1,a1,1
    19a8:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    19ac:	00f50023          	sb	a5,0(a0)
    19b0:	f7fd                	bnez	a5,199e <strcpy+0x54>
}
    19b2:	8082                	ret
    19b4:	8082                	ret

00000000000019b6 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19b6:	00b547b3          	xor	a5,a0,a1
    19ba:	8b9d                	andi	a5,a5,7
    19bc:	1a079863          	bnez	a5,1b6c <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19c0:	0075f793          	andi	a5,a1,7
    19c4:	16078463          	beqz	a5,1b2c <strncpy+0x176>
    19c8:	ea01                	bnez	a2,19d8 <strncpy+0x22>
    19ca:	a421                	j	1bd2 <strncpy+0x21c>
    19cc:	167d                	addi	a2,a2,-1
    19ce:	0505                	addi	a0,a0,1
    19d0:	14070e63          	beqz	a4,1b2c <strncpy+0x176>
    19d4:	1a060863          	beqz	a2,1b84 <strncpy+0x1ce>
    19d8:	0005c783          	lbu	a5,0(a1)
    19dc:	0585                	addi	a1,a1,1
    19de:	0075f713          	andi	a4,a1,7
    19e2:	00f50023          	sb	a5,0(a0)
    19e6:	f3fd                	bnez	a5,19cc <strncpy+0x16>
    19e8:	4805                	li	a6,1
    19ea:	1a061863          	bnez	a2,1b9a <strncpy+0x1e4>
    19ee:	40a007b3          	neg	a5,a0
    19f2:	8b9d                	andi	a5,a5,7
    19f4:	4681                	li	a3,0
    19f6:	18061a63          	bnez	a2,1b8a <strncpy+0x1d4>
    19fa:	00778713          	addi	a4,a5,7
    19fe:	45ad                	li	a1,11
    1a00:	18b76363          	bltu	a4,a1,1b86 <strncpy+0x1d0>
    1a04:	1ae6eb63          	bltu	a3,a4,1bba <strncpy+0x204>
    1a08:	1a078363          	beqz	a5,1bae <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a0c:	00050023          	sb	zero,0(a0)
    1a10:	4685                	li	a3,1
    1a12:	00150713          	addi	a4,a0,1
    1a16:	18d78f63          	beq	a5,a3,1bb4 <strncpy+0x1fe>
    1a1a:	000500a3          	sb	zero,1(a0)
    1a1e:	4689                	li	a3,2
    1a20:	00250713          	addi	a4,a0,2
    1a24:	18d78e63          	beq	a5,a3,1bc0 <strncpy+0x20a>
    1a28:	00050123          	sb	zero,2(a0)
    1a2c:	468d                	li	a3,3
    1a2e:	00350713          	addi	a4,a0,3
    1a32:	16d78c63          	beq	a5,a3,1baa <strncpy+0x1f4>
    1a36:	000501a3          	sb	zero,3(a0)
    1a3a:	4691                	li	a3,4
    1a3c:	00450713          	addi	a4,a0,4
    1a40:	18d78263          	beq	a5,a3,1bc4 <strncpy+0x20e>
    1a44:	00050223          	sb	zero,4(a0)
    1a48:	4695                	li	a3,5
    1a4a:	00550713          	addi	a4,a0,5
    1a4e:	16d78d63          	beq	a5,a3,1bc8 <strncpy+0x212>
    1a52:	000502a3          	sb	zero,5(a0)
    1a56:	469d                	li	a3,7
    1a58:	00650713          	addi	a4,a0,6
    1a5c:	16d79863          	bne	a5,a3,1bcc <strncpy+0x216>
    1a60:	00750713          	addi	a4,a0,7
    1a64:	00050323          	sb	zero,6(a0)
    1a68:	40f80833          	sub	a6,a6,a5
    1a6c:	ff887593          	andi	a1,a6,-8
    1a70:	97aa                	add	a5,a5,a0
    1a72:	95be                	add	a1,a1,a5
    1a74:	0007b023          	sd	zero,0(a5)
    1a78:	07a1                	addi	a5,a5,8
    1a7a:	feb79de3          	bne	a5,a1,1a74 <strncpy+0xbe>
    1a7e:	ff887593          	andi	a1,a6,-8
    1a82:	9ead                	addw	a3,a3,a1
    1a84:	00b707b3          	add	a5,a4,a1
    1a88:	12b80863          	beq	a6,a1,1bb8 <strncpy+0x202>
    1a8c:	00078023          	sb	zero,0(a5)
    1a90:	0016871b          	addiw	a4,a3,1
    1a94:	0ec77863          	bgeu	a4,a2,1b84 <strncpy+0x1ce>
    1a98:	000780a3          	sb	zero,1(a5)
    1a9c:	0026871b          	addiw	a4,a3,2
    1aa0:	0ec77263          	bgeu	a4,a2,1b84 <strncpy+0x1ce>
    1aa4:	00078123          	sb	zero,2(a5)
    1aa8:	0036871b          	addiw	a4,a3,3
    1aac:	0cc77c63          	bgeu	a4,a2,1b84 <strncpy+0x1ce>
    1ab0:	000781a3          	sb	zero,3(a5)
    1ab4:	0046871b          	addiw	a4,a3,4
    1ab8:	0cc77663          	bgeu	a4,a2,1b84 <strncpy+0x1ce>
    1abc:	00078223          	sb	zero,4(a5)
    1ac0:	0056871b          	addiw	a4,a3,5
    1ac4:	0cc77063          	bgeu	a4,a2,1b84 <strncpy+0x1ce>
    1ac8:	000782a3          	sb	zero,5(a5)
    1acc:	0066871b          	addiw	a4,a3,6
    1ad0:	0ac77a63          	bgeu	a4,a2,1b84 <strncpy+0x1ce>
    1ad4:	00078323          	sb	zero,6(a5)
    1ad8:	0076871b          	addiw	a4,a3,7
    1adc:	0ac77463          	bgeu	a4,a2,1b84 <strncpy+0x1ce>
    1ae0:	000783a3          	sb	zero,7(a5)
    1ae4:	0086871b          	addiw	a4,a3,8
    1ae8:	08c77e63          	bgeu	a4,a2,1b84 <strncpy+0x1ce>
    1aec:	00078423          	sb	zero,8(a5)
    1af0:	0096871b          	addiw	a4,a3,9
    1af4:	08c77863          	bgeu	a4,a2,1b84 <strncpy+0x1ce>
    1af8:	000784a3          	sb	zero,9(a5)
    1afc:	00a6871b          	addiw	a4,a3,10
    1b00:	08c77263          	bgeu	a4,a2,1b84 <strncpy+0x1ce>
    1b04:	00078523          	sb	zero,10(a5)
    1b08:	00b6871b          	addiw	a4,a3,11
    1b0c:	06c77c63          	bgeu	a4,a2,1b84 <strncpy+0x1ce>
    1b10:	000785a3          	sb	zero,11(a5)
    1b14:	00c6871b          	addiw	a4,a3,12
    1b18:	06c77663          	bgeu	a4,a2,1b84 <strncpy+0x1ce>
    1b1c:	00078623          	sb	zero,12(a5)
    1b20:	26b5                	addiw	a3,a3,13
    1b22:	06c6f163          	bgeu	a3,a2,1b84 <strncpy+0x1ce>
    1b26:	000786a3          	sb	zero,13(a5)
    1b2a:	8082                	ret
            ;
        if (!n || !*s)
    1b2c:	c645                	beqz	a2,1bd4 <strncpy+0x21e>
    1b2e:	0005c783          	lbu	a5,0(a1)
    1b32:	ea078be3          	beqz	a5,19e8 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b36:	479d                	li	a5,7
    1b38:	02c7ff63          	bgeu	a5,a2,1b76 <strncpy+0x1c0>
    1b3c:	00000897          	auipc	a7,0x0
    1b40:	3ac8b883          	ld	a7,940(a7) # 1ee8 <__clone+0x9c>
    1b44:	00000817          	auipc	a6,0x0
    1b48:	3ac83803          	ld	a6,940(a6) # 1ef0 <__clone+0xa4>
    1b4c:	431d                	li	t1,7
    1b4e:	6198                	ld	a4,0(a1)
    1b50:	011707b3          	add	a5,a4,a7
    1b54:	fff74693          	not	a3,a4
    1b58:	8ff5                	and	a5,a5,a3
    1b5a:	0107f7b3          	and	a5,a5,a6
    1b5e:	ef81                	bnez	a5,1b76 <strncpy+0x1c0>
            *wd = *ws;
    1b60:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b62:	1661                	addi	a2,a2,-8
    1b64:	05a1                	addi	a1,a1,8
    1b66:	0521                	addi	a0,a0,8
    1b68:	fec363e3          	bltu	t1,a2,1b4e <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b6c:	e609                	bnez	a2,1b76 <strncpy+0x1c0>
    1b6e:	a08d                	j	1bd0 <strncpy+0x21a>
    1b70:	167d                	addi	a2,a2,-1
    1b72:	0505                	addi	a0,a0,1
    1b74:	ca01                	beqz	a2,1b84 <strncpy+0x1ce>
    1b76:	0005c783          	lbu	a5,0(a1)
    1b7a:	0585                	addi	a1,a1,1
    1b7c:	00f50023          	sb	a5,0(a0)
    1b80:	fbe5                	bnez	a5,1b70 <strncpy+0x1ba>
        ;
tail:
    1b82:	b59d                	j	19e8 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1b84:	8082                	ret
    1b86:	472d                	li	a4,11
    1b88:	bdb5                	j	1a04 <strncpy+0x4e>
    1b8a:	00778713          	addi	a4,a5,7
    1b8e:	45ad                	li	a1,11
    1b90:	fff60693          	addi	a3,a2,-1
    1b94:	e6b778e3          	bgeu	a4,a1,1a04 <strncpy+0x4e>
    1b98:	b7fd                	j	1b86 <strncpy+0x1d0>
    1b9a:	40a007b3          	neg	a5,a0
    1b9e:	8832                	mv	a6,a2
    1ba0:	8b9d                	andi	a5,a5,7
    1ba2:	4681                	li	a3,0
    1ba4:	e4060be3          	beqz	a2,19fa <strncpy+0x44>
    1ba8:	b7cd                	j	1b8a <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1baa:	468d                	li	a3,3
    1bac:	bd75                	j	1a68 <strncpy+0xb2>
    1bae:	872a                	mv	a4,a0
    1bb0:	4681                	li	a3,0
    1bb2:	bd5d                	j	1a68 <strncpy+0xb2>
    1bb4:	4685                	li	a3,1
    1bb6:	bd4d                	j	1a68 <strncpy+0xb2>
    1bb8:	8082                	ret
    1bba:	87aa                	mv	a5,a0
    1bbc:	4681                	li	a3,0
    1bbe:	b5f9                	j	1a8c <strncpy+0xd6>
    1bc0:	4689                	li	a3,2
    1bc2:	b55d                	j	1a68 <strncpy+0xb2>
    1bc4:	4691                	li	a3,4
    1bc6:	b54d                	j	1a68 <strncpy+0xb2>
    1bc8:	4695                	li	a3,5
    1bca:	bd79                	j	1a68 <strncpy+0xb2>
    1bcc:	4699                	li	a3,6
    1bce:	bd69                	j	1a68 <strncpy+0xb2>
    1bd0:	8082                	ret
    1bd2:	8082                	ret
    1bd4:	8082                	ret

0000000000001bd6 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1bd6:	87aa                	mv	a5,a0
    1bd8:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1bda:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1bde:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1be2:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1be4:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1be6:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1bea:	2501                	sext.w	a0,a0
    1bec:	8082                	ret

0000000000001bee <openat>:
    register long a7 __asm__("a7") = n;
    1bee:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1bf2:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bf6:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1bfa:	2501                	sext.w	a0,a0
    1bfc:	8082                	ret

0000000000001bfe <close>:
    register long a7 __asm__("a7") = n;
    1bfe:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c02:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c06:	2501                	sext.w	a0,a0
    1c08:	8082                	ret

0000000000001c0a <read>:
    register long a7 __asm__("a7") = n;
    1c0a:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c0e:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c12:	8082                	ret

0000000000001c14 <write>:
    register long a7 __asm__("a7") = n;
    1c14:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c18:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c1c:	8082                	ret

0000000000001c1e <getpid>:
    register long a7 __asm__("a7") = n;
    1c1e:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c22:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c26:	2501                	sext.w	a0,a0
    1c28:	8082                	ret

0000000000001c2a <getppid>:
    register long a7 __asm__("a7") = n;
    1c2a:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c2e:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c32:	2501                	sext.w	a0,a0
    1c34:	8082                	ret

0000000000001c36 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c36:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c3a:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c3e:	2501                	sext.w	a0,a0
    1c40:	8082                	ret

0000000000001c42 <fork>:
    register long a7 __asm__("a7") = n;
    1c42:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c46:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c48:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c4a:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c4e:	2501                	sext.w	a0,a0
    1c50:	8082                	ret

0000000000001c52 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c52:	85b2                	mv	a1,a2
    1c54:	863a                	mv	a2,a4
    if (stack)
    1c56:	c191                	beqz	a1,1c5a <clone+0x8>
	stack += stack_size;
    1c58:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c5a:	4781                	li	a5,0
    1c5c:	4701                	li	a4,0
    1c5e:	4681                	li	a3,0
    1c60:	2601                	sext.w	a2,a2
    1c62:	a2ed                	j	1e4c <__clone>

0000000000001c64 <exit>:
    register long a7 __asm__("a7") = n;
    1c64:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c68:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c6c:	8082                	ret

0000000000001c6e <waitpid>:
    register long a7 __asm__("a7") = n;
    1c6e:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c72:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c74:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c78:	2501                	sext.w	a0,a0
    1c7a:	8082                	ret

0000000000001c7c <exec>:
    register long a7 __asm__("a7") = n;
    1c7c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1c80:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1c84:	2501                	sext.w	a0,a0
    1c86:	8082                	ret

0000000000001c88 <execve>:
    register long a7 __asm__("a7") = n;
    1c88:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c8c:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1c90:	2501                	sext.w	a0,a0
    1c92:	8082                	ret

0000000000001c94 <times>:
    register long a7 __asm__("a7") = n;
    1c94:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1c98:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1c9c:	2501                	sext.w	a0,a0
    1c9e:	8082                	ret

0000000000001ca0 <get_time>:

int64 get_time()
{
    1ca0:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1ca2:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ca6:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ca8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1caa:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cae:	2501                	sext.w	a0,a0
    1cb0:	ed09                	bnez	a0,1cca <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cb2:	67a2                	ld	a5,8(sp)
    1cb4:	3e800713          	li	a4,1000
    1cb8:	00015503          	lhu	a0,0(sp)
    1cbc:	02e7d7b3          	divu	a5,a5,a4
    1cc0:	02e50533          	mul	a0,a0,a4
    1cc4:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1cc6:	0141                	addi	sp,sp,16
    1cc8:	8082                	ret
        return -1;
    1cca:	557d                	li	a0,-1
    1ccc:	bfed                	j	1cc6 <get_time+0x26>

0000000000001cce <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1cce:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cd2:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1cd6:	2501                	sext.w	a0,a0
    1cd8:	8082                	ret

0000000000001cda <time>:
    register long a7 __asm__("a7") = n;
    1cda:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1cde:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1ce2:	2501                	sext.w	a0,a0
    1ce4:	8082                	ret

0000000000001ce6 <sleep>:

int sleep(unsigned long long time)
{
    1ce6:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1ce8:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1cea:	850a                	mv	a0,sp
    1cec:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1cee:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1cf2:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cf4:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1cf8:	e501                	bnez	a0,1d00 <sleep+0x1a>
    return 0;
    1cfa:	4501                	li	a0,0
}
    1cfc:	0141                	addi	sp,sp,16
    1cfe:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d00:	4502                	lw	a0,0(sp)
}
    1d02:	0141                	addi	sp,sp,16
    1d04:	8082                	ret

0000000000001d06 <set_priority>:
    register long a7 __asm__("a7") = n;
    1d06:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d0a:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d0e:	2501                	sext.w	a0,a0
    1d10:	8082                	ret

0000000000001d12 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d12:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d16:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d1a:	8082                	ret

0000000000001d1c <munmap>:
    register long a7 __asm__("a7") = n;
    1d1c:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d20:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d24:	2501                	sext.w	a0,a0
    1d26:	8082                	ret

0000000000001d28 <wait>:

int wait(int *code)
{
    1d28:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d2a:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d2e:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d30:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d32:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d34:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d38:	2501                	sext.w	a0,a0
    1d3a:	8082                	ret

0000000000001d3c <spawn>:
    register long a7 __asm__("a7") = n;
    1d3c:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d40:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d44:	2501                	sext.w	a0,a0
    1d46:	8082                	ret

0000000000001d48 <mailread>:
    register long a7 __asm__("a7") = n;
    1d48:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d4c:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d50:	2501                	sext.w	a0,a0
    1d52:	8082                	ret

0000000000001d54 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d54:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d58:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d5c:	2501                	sext.w	a0,a0
    1d5e:	8082                	ret

0000000000001d60 <fstat>:
    register long a7 __asm__("a7") = n;
    1d60:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d64:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d68:	2501                	sext.w	a0,a0
    1d6a:	8082                	ret

0000000000001d6c <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d6c:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d6e:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d72:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d74:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d78:	2501                	sext.w	a0,a0
    1d7a:	8082                	ret

0000000000001d7c <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1d7c:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d7e:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1d82:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d84:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1d88:	2501                	sext.w	a0,a0
    1d8a:	8082                	ret

0000000000001d8c <link>:

int link(char *old_path, char *new_path)
{
    1d8c:	87aa                	mv	a5,a0
    1d8e:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1d90:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1d94:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d98:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1d9a:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1d9e:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1da0:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1da4:	2501                	sext.w	a0,a0
    1da6:	8082                	ret

0000000000001da8 <unlink>:

int unlink(char *path)
{
    1da8:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1daa:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1dae:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1db2:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db4:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1db8:	2501                	sext.w	a0,a0
    1dba:	8082                	ret

0000000000001dbc <uname>:
    register long a7 __asm__("a7") = n;
    1dbc:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1dc0:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <brk>:
    register long a7 __asm__("a7") = n;
    1dc8:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1dcc:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <getcwd>:
    register long a7 __asm__("a7") = n;
    1dd4:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dd6:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1dda:	8082                	ret

0000000000001ddc <chdir>:
    register long a7 __asm__("a7") = n;
    1ddc:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1de0:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1de4:	2501                	sext.w	a0,a0
    1de6:	8082                	ret

0000000000001de8 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1de8:	862e                	mv	a2,a1
    1dea:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1dec:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dee:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1df2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1df6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1df8:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfa:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1dfe:	2501                	sext.w	a0,a0
    1e00:	8082                	ret

0000000000001e02 <getdents>:
    register long a7 __asm__("a7") = n;
    1e02:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e06:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e0a:	2501                	sext.w	a0,a0
    1e0c:	8082                	ret

0000000000001e0e <pipe>:
    register long a7 __asm__("a7") = n;
    1e0e:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e12:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e14:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e18:	2501                	sext.w	a0,a0
    1e1a:	8082                	ret

0000000000001e1c <dup>:
    register long a7 __asm__("a7") = n;
    1e1c:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e1e:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e22:	2501                	sext.w	a0,a0
    1e24:	8082                	ret

0000000000001e26 <dup2>:
    register long a7 __asm__("a7") = n;
    1e26:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e28:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e2a:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e2e:	2501                	sext.w	a0,a0
    1e30:	8082                	ret

0000000000001e32 <mount>:
    register long a7 __asm__("a7") = n;
    1e32:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e36:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e3a:	2501                	sext.w	a0,a0
    1e3c:	8082                	ret

0000000000001e3e <umount>:
    register long a7 __asm__("a7") = n;
    1e3e:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e42:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e44:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e48:	2501                	sext.w	a0,a0
    1e4a:	8082                	ret

0000000000001e4c <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e4c:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e4e:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e50:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e52:	8532                	mv	a0,a2
	mv a2, a4
    1e54:	863a                	mv	a2,a4
	mv a3, a5
    1e56:	86be                	mv	a3,a5
	mv a4, a6
    1e58:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e5a:	0dc00893          	li	a7,220
	ecall
    1e5e:	00000073          	ecall

	beqz a0, 1f
    1e62:	c111                	beqz	a0,1e66 <__clone+0x1a>
	# Parent
	ret
    1e64:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e66:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e68:	6522                	ld	a0,8(sp)
	jalr a1
    1e6a:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e6c:	05d00893          	li	a7,93
	ecall
    1e70:	00000073          	ecall
