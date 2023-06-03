
/home/lmq/Desktop/xv6-k210/test/build/riscv64/clone:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a201                	j	1102 <__start_main>

0000000000001004 <child_func>:
#include "unistd.h"

size_t stack[1024] = {0};
static int child_pid;

static int child_func(void){
    1004:	1141                	addi	sp,sp,-16
    printf("  Child says successfully!\n");
    1006:	00001517          	auipc	a0,0x1
    100a:	eca50513          	addi	a0,a0,-310 # 1ed0 <__clone+0x2c>
static int child_func(void){
    100e:	e406                	sd	ra,8(sp)
    printf("  Child says successfully!\n");
    1010:	312000ef          	jal	ra,1322 <printf>
    return 0;
}
    1014:	60a2                	ld	ra,8(sp)
    1016:	4501                	li	a0,0
    1018:	0141                	addi	sp,sp,16
    101a:	8082                	ret

000000000000101c <test_clone>:

void test_clone(void){
    101c:	1101                	addi	sp,sp,-32
    TEST_START(__func__);
    101e:	00001517          	auipc	a0,0x1
    1022:	ed250513          	addi	a0,a0,-302 # 1ef0 <__clone+0x4c>
void test_clone(void){
    1026:	ec06                	sd	ra,24(sp)
    1028:	e822                	sd	s0,16(sp)
    TEST_START(__func__);
    102a:	2d6000ef          	jal	ra,1300 <puts>
    102e:	00003517          	auipc	a0,0x3
    1032:	f9250513          	addi	a0,a0,-110 # 3fc0 <__func__.1171>
    1036:	2ca000ef          	jal	ra,1300 <puts>
    103a:	00001517          	auipc	a0,0x1
    103e:	ece50513          	addi	a0,a0,-306 # 1f08 <__clone+0x64>
    1042:	2be000ef          	jal	ra,1300 <puts>
    int wstatus;
    printf("stack addr:%p\n", stack);
    1046:	00001597          	auipc	a1,0x1
    104a:	f7258593          	addi	a1,a1,-142 # 1fb8 <stack>
    104e:	00001517          	auipc	a0,0x1
    1052:	eca50513          	addi	a0,a0,-310 # 1f18 <__clone+0x74>
    1056:	2cc000ef          	jal	ra,1322 <printf>
    child_pid = clone(child_func, NULL, stack, 1024, SIGCHLD);
    105a:	4745                	li	a4,17
    105c:	40000693          	li	a3,1024
    1060:	00001617          	auipc	a2,0x1
    1064:	f5860613          	addi	a2,a2,-168 # 1fb8 <stack>
    1068:	4581                	li	a1,0
    106a:	00000517          	auipc	a0,0x0
    106e:	f9a50513          	addi	a0,a0,-102 # 1004 <child_func>
    1072:	439000ef          	jal	ra,1caa <clone>
    1076:	00003417          	auipc	s0,0x3
    107a:	f4240413          	addi	s0,s0,-190 # 3fb8 <child_pid>
    107e:	c008                	sw	a0,0(s0)
    assert(child_pid != -1);
    1080:	57fd                	li	a5,-1
    1082:	04f50863          	beq	a0,a5,10d2 <test_clone+0xb6>
    if (child_pid == 0){
    1086:	e90d                	bnez	a0,10b8 <test_clone+0x9c>
	exit(0);
    1088:	435000ef          	jal	ra,1cbc <exit>
	    printf("clone process successfully.\npid:%d\n", child_pid);
	else
	    printf("clone process error.\n");
    }

    TEST_END(__func__);
    108c:	00001517          	auipc	a0,0x1
    1090:	efc50513          	addi	a0,a0,-260 # 1f88 <__clone+0xe4>
    1094:	26c000ef          	jal	ra,1300 <puts>
    1098:	00003517          	auipc	a0,0x3
    109c:	f2850513          	addi	a0,a0,-216 # 3fc0 <__func__.1171>
    10a0:	260000ef          	jal	ra,1300 <puts>
    10a4:	00001517          	auipc	a0,0x1
    10a8:	e6450513          	addi	a0,a0,-412 # 1f08 <__clone+0x64>
    10ac:	254000ef          	jal	ra,1300 <puts>
}
    10b0:	60e2                	ld	ra,24(sp)
    10b2:	6442                	ld	s0,16(sp)
    10b4:	6105                	addi	sp,sp,32
    10b6:	8082                	ret
	if(wait(&wstatus) == child_pid)
    10b8:	0068                	addi	a0,sp,12
    10ba:	4c7000ef          	jal	ra,1d80 <wait>
    10be:	401c                	lw	a5,0(s0)
    10c0:	02f50163          	beq	a0,a5,10e2 <test_clone+0xc6>
	    printf("clone process error.\n");
    10c4:	00001517          	auipc	a0,0x1
    10c8:	eac50513          	addi	a0,a0,-340 # 1f70 <__clone+0xcc>
    10cc:	256000ef          	jal	ra,1322 <printf>
    10d0:	bf75                	j	108c <test_clone+0x70>
    assert(child_pid != -1);
    10d2:	00001517          	auipc	a0,0x1
    10d6:	e5650513          	addi	a0,a0,-426 # 1f28 <__clone+0x84>
    10da:	4d0000ef          	jal	ra,15aa <panic>
    10de:	4008                	lw	a0,0(s0)
    10e0:	b75d                	j	1086 <test_clone+0x6a>
	    printf("clone process successfully.\npid:%d\n", child_pid);
    10e2:	85aa                	mv	a1,a0
    10e4:	00001517          	auipc	a0,0x1
    10e8:	e6450513          	addi	a0,a0,-412 # 1f48 <__clone+0xa4>
    10ec:	236000ef          	jal	ra,1322 <printf>
    10f0:	bf71                	j	108c <test_clone+0x70>

00000000000010f2 <main>:

int main(void){
    10f2:	1141                	addi	sp,sp,-16
    10f4:	e406                	sd	ra,8(sp)
    test_clone();
    10f6:	f27ff0ef          	jal	ra,101c <test_clone>
    return 0;
}
    10fa:	60a2                	ld	ra,8(sp)
    10fc:	4501                	li	a0,0
    10fe:	0141                	addi	sp,sp,16
    1100:	8082                	ret

0000000000001102 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1102:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1104:	4108                	lw	a0,0(a0)
{
    1106:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1108:	05a1                	addi	a1,a1,8
{
    110a:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    110c:	fe7ff0ef          	jal	ra,10f2 <main>
    1110:	3ad000ef          	jal	ra,1cbc <exit>
	return 0;
}
    1114:	60a2                	ld	ra,8(sp)
    1116:	4501                	li	a0,0
    1118:	0141                	addi	sp,sp,16
    111a:	8082                	ret

000000000000111c <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    111c:	7179                	addi	sp,sp,-48
    111e:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1120:	12054b63          	bltz	a0,1256 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1124:	02b577bb          	remuw	a5,a0,a1
    1128:	00003697          	auipc	a3,0x3
    112c:	ea868693          	addi	a3,a3,-344 # 3fd0 <digits>
    buf[16] = 0;
    1130:	00010c23          	sb	zero,24(sp)
    i = 15;
    1134:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    1138:	1782                	slli	a5,a5,0x20
    113a:	9381                	srli	a5,a5,0x20
    113c:	97b6                	add	a5,a5,a3
    113e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1142:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1146:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    114a:	16b56263          	bltu	a0,a1,12ae <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    114e:	02e8763b          	remuw	a2,a6,a4
    1152:	1602                	slli	a2,a2,0x20
    1154:	9201                	srli	a2,a2,0x20
    1156:	9636                	add	a2,a2,a3
    1158:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1160:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1164:	12e86963          	bltu	a6,a4,1296 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    1168:	02e5f63b          	remuw	a2,a1,a4
    116c:	1602                	slli	a2,a2,0x20
    116e:	9201                	srli	a2,a2,0x20
    1170:	9636                	add	a2,a2,a3
    1172:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1176:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    117a:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    117e:	10e5ef63          	bltu	a1,a4,129c <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1182:	02e8763b          	remuw	a2,a6,a4
    1186:	1602                	slli	a2,a2,0x20
    1188:	9201                	srli	a2,a2,0x20
    118a:	9636                	add	a2,a2,a3
    118c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1190:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1194:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1198:	10e86563          	bltu	a6,a4,12a2 <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    119c:	02e5f63b          	remuw	a2,a1,a4
    11a0:	1602                	slli	a2,a2,0x20
    11a2:	9201                	srli	a2,a2,0x20
    11a4:	9636                	add	a2,a2,a3
    11a6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11aa:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11ae:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    11b2:	0ee5eb63          	bltu	a1,a4,12a8 <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    11b6:	02e8763b          	remuw	a2,a6,a4
    11ba:	1602                	slli	a2,a2,0x20
    11bc:	9201                	srli	a2,a2,0x20
    11be:	9636                	add	a2,a2,a3
    11c0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c4:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11c8:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11cc:	0ce86263          	bltu	a6,a4,1290 <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    11d0:	02e5f63b          	remuw	a2,a1,a4
    11d4:	1602                	slli	a2,a2,0x20
    11d6:	9201                	srli	a2,a2,0x20
    11d8:	9636                	add	a2,a2,a3
    11da:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11de:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11e2:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11e6:	0ce5e663          	bltu	a1,a4,12b2 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    11ea:	02e8763b          	remuw	a2,a6,a4
    11ee:	1602                	slli	a2,a2,0x20
    11f0:	9201                	srli	a2,a2,0x20
    11f2:	9636                	add	a2,a2,a3
    11f4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11f8:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11fc:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1200:	0ae86c63          	bltu	a6,a4,12b8 <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    1204:	02e5f63b          	remuw	a2,a1,a4
    1208:	1602                	slli	a2,a2,0x20
    120a:	9201                	srli	a2,a2,0x20
    120c:	9636                	add	a2,a2,a3
    120e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1212:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1216:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    121a:	0ae5e263          	bltu	a1,a4,12be <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    121e:	1782                	slli	a5,a5,0x20
    1220:	9381                	srli	a5,a5,0x20
    1222:	97b6                	add	a5,a5,a3
    1224:	0007c703          	lbu	a4,0(a5)
    1228:	4599                	li	a1,6
    122a:	4795                	li	a5,5
    122c:	00e10723          	sb	a4,14(sp)

    if (sign)
    1230:	00055963          	bgez	a0,1242 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1234:	1018                	addi	a4,sp,32
    1236:	973e                	add	a4,a4,a5
    1238:	02d00693          	li	a3,45
    123c:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    1240:	85be                	mv	a1,a5
    write(f, s, l);
    1242:	003c                	addi	a5,sp,8
    1244:	4641                	li	a2,16
    1246:	9e0d                	subw	a2,a2,a1
    1248:	4505                	li	a0,1
    124a:	95be                	add	a1,a1,a5
    124c:	221000ef          	jal	ra,1c6c <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1250:	70a2                	ld	ra,40(sp)
    1252:	6145                	addi	sp,sp,48
    1254:	8082                	ret
        x = -xx;
    1256:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    125a:	02b677bb          	remuw	a5,a2,a1
    125e:	00003697          	auipc	a3,0x3
    1262:	d7268693          	addi	a3,a3,-654 # 3fd0 <digits>
    buf[16] = 0;
    1266:	00010c23          	sb	zero,24(sp)
    i = 15;
    126a:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    126e:	1782                	slli	a5,a5,0x20
    1270:	9381                	srli	a5,a5,0x20
    1272:	97b6                	add	a5,a5,a3
    1274:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1278:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    127c:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1280:	ecb677e3          	bgeu	a2,a1,114e <printint.constprop.0+0x32>
        buf[i--] = '-';
    1284:	02d00793          	li	a5,45
    1288:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    128c:	45b9                	li	a1,14
    128e:	bf55                	j	1242 <printint.constprop.0+0x126>
    1290:	47a5                	li	a5,9
    1292:	45a9                	li	a1,10
    1294:	bf71                	j	1230 <printint.constprop.0+0x114>
    1296:	47b5                	li	a5,13
    1298:	45b9                	li	a1,14
    129a:	bf59                	j	1230 <printint.constprop.0+0x114>
    129c:	47b1                	li	a5,12
    129e:	45b5                	li	a1,13
    12a0:	bf41                	j	1230 <printint.constprop.0+0x114>
    12a2:	47ad                	li	a5,11
    12a4:	45b1                	li	a1,12
    12a6:	b769                	j	1230 <printint.constprop.0+0x114>
    12a8:	47a9                	li	a5,10
    12aa:	45ad                	li	a1,11
    12ac:	b751                	j	1230 <printint.constprop.0+0x114>
    i = 15;
    12ae:	45bd                	li	a1,15
    12b0:	bf49                	j	1242 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    12b2:	47a1                	li	a5,8
    12b4:	45a5                	li	a1,9
    12b6:	bfad                	j	1230 <printint.constprop.0+0x114>
    12b8:	479d                	li	a5,7
    12ba:	45a1                	li	a1,8
    12bc:	bf95                	j	1230 <printint.constprop.0+0x114>
    12be:	4799                	li	a5,6
    12c0:	459d                	li	a1,7
    12c2:	b7bd                	j	1230 <printint.constprop.0+0x114>

00000000000012c4 <getchar>:
{
    12c4:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12c6:	00f10593          	addi	a1,sp,15
    12ca:	4605                	li	a2,1
    12cc:	4501                	li	a0,0
{
    12ce:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12d0:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12d4:	18f000ef          	jal	ra,1c62 <read>
}
    12d8:	60e2                	ld	ra,24(sp)
    12da:	00f14503          	lbu	a0,15(sp)
    12de:	6105                	addi	sp,sp,32
    12e0:	8082                	ret

00000000000012e2 <putchar>:
{
    12e2:	1101                	addi	sp,sp,-32
    12e4:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12e6:	00f10593          	addi	a1,sp,15
    12ea:	4605                	li	a2,1
    12ec:	4505                	li	a0,1
{
    12ee:	ec06                	sd	ra,24(sp)
    char byte = c;
    12f0:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12f4:	179000ef          	jal	ra,1c6c <write>
}
    12f8:	60e2                	ld	ra,24(sp)
    12fa:	2501                	sext.w	a0,a0
    12fc:	6105                	addi	sp,sp,32
    12fe:	8082                	ret

0000000000001300 <puts>:
{
    1300:	1141                	addi	sp,sp,-16
    1302:	e406                	sd	ra,8(sp)
    1304:	e022                	sd	s0,0(sp)
    1306:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1308:	580000ef          	jal	ra,1888 <strlen>
    130c:	862a                	mv	a2,a0
    130e:	85a2                	mv	a1,s0
    1310:	4505                	li	a0,1
    1312:	15b000ef          	jal	ra,1c6c <write>
}
    1316:	60a2                	ld	ra,8(sp)
    1318:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    131a:	957d                	srai	a0,a0,0x3f
    return r;
    131c:	2501                	sext.w	a0,a0
}
    131e:	0141                	addi	sp,sp,16
    1320:	8082                	ret

0000000000001322 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1322:	7171                	addi	sp,sp,-176
    1324:	fc56                	sd	s5,56(sp)
    1326:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1328:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    132a:	18bc                	addi	a5,sp,120
{
    132c:	e8ca                	sd	s2,80(sp)
    132e:	e4ce                	sd	s3,72(sp)
    1330:	e0d2                	sd	s4,64(sp)
    1332:	f85a                	sd	s6,48(sp)
    1334:	f486                	sd	ra,104(sp)
    1336:	f0a2                	sd	s0,96(sp)
    1338:	eca6                	sd	s1,88(sp)
    133a:	fcae                	sd	a1,120(sp)
    133c:	e132                	sd	a2,128(sp)
    133e:	e536                	sd	a3,136(sp)
    1340:	e93a                	sd	a4,144(sp)
    1342:	f142                	sd	a6,160(sp)
    1344:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1346:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1348:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    134c:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1350:	00001b17          	auipc	s6,0x1
    1354:	c48b0b13          	addi	s6,s6,-952 # 1f98 <__clone+0xf4>
    buf[i++] = '0';
    1358:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    135c:	00003997          	auipc	s3,0x3
    1360:	c7498993          	addi	s3,s3,-908 # 3fd0 <digits>
        if (!*s)
    1364:	00054783          	lbu	a5,0(a0)
    1368:	16078a63          	beqz	a5,14dc <printf+0x1ba>
    136c:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    136e:	19278163          	beq	a5,s2,14f0 <printf+0x1ce>
    1372:	00164783          	lbu	a5,1(a2)
    1376:	0605                	addi	a2,a2,1
    1378:	fbfd                	bnez	a5,136e <printf+0x4c>
    137a:	84b2                	mv	s1,a2
        l = z - a;
    137c:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1380:	85aa                	mv	a1,a0
    1382:	8622                	mv	a2,s0
    1384:	4505                	li	a0,1
    1386:	0e7000ef          	jal	ra,1c6c <write>
        if (l)
    138a:	18041c63          	bnez	s0,1522 <printf+0x200>
        if (s[1] == 0)
    138e:	0014c783          	lbu	a5,1(s1)
    1392:	14078563          	beqz	a5,14dc <printf+0x1ba>
        switch (s[1])
    1396:	1d478063          	beq	a5,s4,1556 <printf+0x234>
    139a:	18fa6663          	bltu	s4,a5,1526 <printf+0x204>
    139e:	06400713          	li	a4,100
    13a2:	1ae78063          	beq	a5,a4,1542 <printf+0x220>
    13a6:	07000713          	li	a4,112
    13aa:	1ce79963          	bne	a5,a4,157c <printf+0x25a>
            printptr(va_arg(ap, uint64));
    13ae:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13b0:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13b4:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13b6:	631c                	ld	a5,0(a4)
    13b8:	0721                	addi	a4,a4,8
    13ba:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13bc:	00479293          	slli	t0,a5,0x4
    13c0:	00879f93          	slli	t6,a5,0x8
    13c4:	00c79f13          	slli	t5,a5,0xc
    13c8:	01079e93          	slli	t4,a5,0x10
    13cc:	01479e13          	slli	t3,a5,0x14
    13d0:	01879313          	slli	t1,a5,0x18
    13d4:	01c79893          	slli	a7,a5,0x1c
    13d8:	02479813          	slli	a6,a5,0x24
    13dc:	02879513          	slli	a0,a5,0x28
    13e0:	02c79593          	slli	a1,a5,0x2c
    13e4:	03079693          	slli	a3,a5,0x30
    13e8:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13ec:	03c7d413          	srli	s0,a5,0x3c
    13f0:	01c7d39b          	srliw	t2,a5,0x1c
    13f4:	03c2d293          	srli	t0,t0,0x3c
    13f8:	03cfdf93          	srli	t6,t6,0x3c
    13fc:	03cf5f13          	srli	t5,t5,0x3c
    1400:	03cede93          	srli	t4,t4,0x3c
    1404:	03ce5e13          	srli	t3,t3,0x3c
    1408:	03c35313          	srli	t1,t1,0x3c
    140c:	03c8d893          	srli	a7,a7,0x3c
    1410:	03c85813          	srli	a6,a6,0x3c
    1414:	9171                	srli	a0,a0,0x3c
    1416:	91f1                	srli	a1,a1,0x3c
    1418:	92f1                	srli	a3,a3,0x3c
    141a:	9371                	srli	a4,a4,0x3c
    141c:	96ce                	add	a3,a3,s3
    141e:	974e                	add	a4,a4,s3
    1420:	944e                	add	s0,s0,s3
    1422:	92ce                	add	t0,t0,s3
    1424:	9fce                	add	t6,t6,s3
    1426:	9f4e                	add	t5,t5,s3
    1428:	9ece                	add	t4,t4,s3
    142a:	9e4e                	add	t3,t3,s3
    142c:	934e                	add	t1,t1,s3
    142e:	98ce                	add	a7,a7,s3
    1430:	93ce                	add	t2,t2,s3
    1432:	984e                	add	a6,a6,s3
    1434:	954e                	add	a0,a0,s3
    1436:	95ce                	add	a1,a1,s3
    1438:	0006c083          	lbu	ra,0(a3)
    143c:	0002c283          	lbu	t0,0(t0)
    1440:	00074683          	lbu	a3,0(a4)
    1444:	000fcf83          	lbu	t6,0(t6)
    1448:	000f4f03          	lbu	t5,0(t5)
    144c:	000ece83          	lbu	t4,0(t4)
    1450:	000e4e03          	lbu	t3,0(t3)
    1454:	00034303          	lbu	t1,0(t1)
    1458:	0008c883          	lbu	a7,0(a7)
    145c:	0003c383          	lbu	t2,0(t2)
    1460:	00084803          	lbu	a6,0(a6)
    1464:	00054503          	lbu	a0,0(a0)
    1468:	0005c583          	lbu	a1,0(a1)
    146c:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1470:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1474:	9371                	srli	a4,a4,0x3c
    1476:	8bbd                	andi	a5,a5,15
    1478:	974e                	add	a4,a4,s3
    147a:	97ce                	add	a5,a5,s3
    147c:	005105a3          	sb	t0,11(sp)
    1480:	01f10623          	sb	t6,12(sp)
    1484:	01e106a3          	sb	t5,13(sp)
    1488:	01d10723          	sb	t4,14(sp)
    148c:	01c107a3          	sb	t3,15(sp)
    1490:	00610823          	sb	t1,16(sp)
    1494:	011108a3          	sb	a7,17(sp)
    1498:	00710923          	sb	t2,18(sp)
    149c:	010109a3          	sb	a6,19(sp)
    14a0:	00a10a23          	sb	a0,20(sp)
    14a4:	00b10aa3          	sb	a1,21(sp)
    14a8:	00110b23          	sb	ra,22(sp)
    14ac:	00d10ba3          	sb	a3,23(sp)
    14b0:	00810523          	sb	s0,10(sp)
    14b4:	00074703          	lbu	a4,0(a4)
    14b8:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14bc:	002c                	addi	a1,sp,8
    14be:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14c0:	00e10c23          	sb	a4,24(sp)
    14c4:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14c8:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14cc:	7a0000ef          	jal	ra,1c6c <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14d0:	00248513          	addi	a0,s1,2
        if (!*s)
    14d4:	00054783          	lbu	a5,0(a0)
    14d8:	e8079ae3          	bnez	a5,136c <printf+0x4a>
    }
    va_end(ap);
}
    14dc:	70a6                	ld	ra,104(sp)
    14de:	7406                	ld	s0,96(sp)
    14e0:	64e6                	ld	s1,88(sp)
    14e2:	6946                	ld	s2,80(sp)
    14e4:	69a6                	ld	s3,72(sp)
    14e6:	6a06                	ld	s4,64(sp)
    14e8:	7ae2                	ld	s5,56(sp)
    14ea:	7b42                	ld	s6,48(sp)
    14ec:	614d                	addi	sp,sp,176
    14ee:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14f0:	00064783          	lbu	a5,0(a2)
    14f4:	84b2                	mv	s1,a2
    14f6:	01278963          	beq	a5,s2,1508 <printf+0x1e6>
    14fa:	b549                	j	137c <printf+0x5a>
    14fc:	0024c783          	lbu	a5,2(s1)
    1500:	0605                	addi	a2,a2,1
    1502:	0489                	addi	s1,s1,2
    1504:	e7279ce3          	bne	a5,s2,137c <printf+0x5a>
    1508:	0014c783          	lbu	a5,1(s1)
    150c:	ff2788e3          	beq	a5,s2,14fc <printf+0x1da>
        l = z - a;
    1510:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1514:	85aa                	mv	a1,a0
    1516:	8622                	mv	a2,s0
    1518:	4505                	li	a0,1
    151a:	752000ef          	jal	ra,1c6c <write>
        if (l)
    151e:	e60408e3          	beqz	s0,138e <printf+0x6c>
    1522:	8526                	mv	a0,s1
    1524:	b581                	j	1364 <printf+0x42>
        switch (s[1])
    1526:	07800713          	li	a4,120
    152a:	04e79963          	bne	a5,a4,157c <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    152e:	6782                	ld	a5,0(sp)
    1530:	45c1                	li	a1,16
    1532:	4388                	lw	a0,0(a5)
    1534:	07a1                	addi	a5,a5,8
    1536:	e03e                	sd	a5,0(sp)
    1538:	be5ff0ef          	jal	ra,111c <printint.constprop.0>
        s += 2;
    153c:	00248513          	addi	a0,s1,2
    1540:	bf51                	j	14d4 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    1542:	6782                	ld	a5,0(sp)
    1544:	45a9                	li	a1,10
    1546:	4388                	lw	a0,0(a5)
    1548:	07a1                	addi	a5,a5,8
    154a:	e03e                	sd	a5,0(sp)
    154c:	bd1ff0ef          	jal	ra,111c <printint.constprop.0>
        s += 2;
    1550:	00248513          	addi	a0,s1,2
    1554:	b741                	j	14d4 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1556:	6782                	ld	a5,0(sp)
    1558:	6380                	ld	s0,0(a5)
    155a:	07a1                	addi	a5,a5,8
    155c:	e03e                	sd	a5,0(sp)
    155e:	c421                	beqz	s0,15a6 <printf+0x284>
            l = strnlen(a, 200);
    1560:	0c800593          	li	a1,200
    1564:	8522                	mv	a0,s0
    1566:	40e000ef          	jal	ra,1974 <strnlen>
    write(f, s, l);
    156a:	0005061b          	sext.w	a2,a0
    156e:	85a2                	mv	a1,s0
    1570:	4505                	li	a0,1
    1572:	6fa000ef          	jal	ra,1c6c <write>
        s += 2;
    1576:	00248513          	addi	a0,s1,2
    157a:	bfa9                	j	14d4 <printf+0x1b2>
    char byte = c;
    157c:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1580:	4605                	li	a2,1
    1582:	002c                	addi	a1,sp,8
    1584:	4505                	li	a0,1
    char byte = c;
    1586:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    158a:	6e2000ef          	jal	ra,1c6c <write>
    char byte = c;
    158e:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1592:	4605                	li	a2,1
    1594:	002c                	addi	a1,sp,8
    1596:	4505                	li	a0,1
    char byte = c;
    1598:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    159c:	6d0000ef          	jal	ra,1c6c <write>
        s += 2;
    15a0:	00248513          	addi	a0,s1,2
    15a4:	bf05                	j	14d4 <printf+0x1b2>
                a = "(null)";
    15a6:	845a                	mv	s0,s6
    15a8:	bf65                	j	1560 <printf+0x23e>

00000000000015aa <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15aa:	1141                	addi	sp,sp,-16
    15ac:	e406                	sd	ra,8(sp)
    puts(m);
    15ae:	d53ff0ef          	jal	ra,1300 <puts>
    exit(-100);
}
    15b2:	60a2                	ld	ra,8(sp)
    exit(-100);
    15b4:	f9c00513          	li	a0,-100
}
    15b8:	0141                	addi	sp,sp,16
    exit(-100);
    15ba:	a709                	j	1cbc <exit>

00000000000015bc <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15bc:	02000793          	li	a5,32
    15c0:	00f50663          	beq	a0,a5,15cc <isspace+0x10>
    15c4:	355d                	addiw	a0,a0,-9
    15c6:	00553513          	sltiu	a0,a0,5
    15ca:	8082                	ret
    15cc:	4505                	li	a0,1
}
    15ce:	8082                	ret

00000000000015d0 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15d0:	fd05051b          	addiw	a0,a0,-48
}
    15d4:	00a53513          	sltiu	a0,a0,10
    15d8:	8082                	ret

00000000000015da <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15da:	02000613          	li	a2,32
    15de:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15e0:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15e4:	ff77069b          	addiw	a3,a4,-9
    15e8:	04c70d63          	beq	a4,a2,1642 <atoi+0x68>
    15ec:	0007079b          	sext.w	a5,a4
    15f0:	04d5f963          	bgeu	a1,a3,1642 <atoi+0x68>
        s++;
    switch (*s)
    15f4:	02b00693          	li	a3,43
    15f8:	04d70a63          	beq	a4,a3,164c <atoi+0x72>
    15fc:	02d00693          	li	a3,45
    1600:	06d70463          	beq	a4,a3,1668 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1604:	fd07859b          	addiw	a1,a5,-48
    1608:	4625                	li	a2,9
    160a:	873e                	mv	a4,a5
    160c:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    160e:	4e01                	li	t3,0
    while (isdigit(*s))
    1610:	04b66a63          	bltu	a2,a1,1664 <atoi+0x8a>
    int n = 0, neg = 0;
    1614:	4501                	li	a0,0
    while (isdigit(*s))
    1616:	4825                	li	a6,9
    1618:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    161c:	0025179b          	slliw	a5,a0,0x2
    1620:	9d3d                	addw	a0,a0,a5
    1622:	fd07031b          	addiw	t1,a4,-48
    1626:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    162a:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    162e:	0685                	addi	a3,a3,1
    1630:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1634:	0006071b          	sext.w	a4,a2
    1638:	feb870e3          	bgeu	a6,a1,1618 <atoi+0x3e>
    return neg ? n : -n;
    163c:	000e0563          	beqz	t3,1646 <atoi+0x6c>
}
    1640:	8082                	ret
        s++;
    1642:	0505                	addi	a0,a0,1
    1644:	bf71                	j	15e0 <atoi+0x6>
    1646:	4113053b          	subw	a0,t1,a7
    164a:	8082                	ret
    while (isdigit(*s))
    164c:	00154783          	lbu	a5,1(a0)
    1650:	4625                	li	a2,9
        s++;
    1652:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1656:	fd07859b          	addiw	a1,a5,-48
    165a:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    165e:	4e01                	li	t3,0
    while (isdigit(*s))
    1660:	fab67ae3          	bgeu	a2,a1,1614 <atoi+0x3a>
    1664:	4501                	li	a0,0
}
    1666:	8082                	ret
    while (isdigit(*s))
    1668:	00154783          	lbu	a5,1(a0)
    166c:	4625                	li	a2,9
        s++;
    166e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1672:	fd07859b          	addiw	a1,a5,-48
    1676:	0007871b          	sext.w	a4,a5
    167a:	feb665e3          	bltu	a2,a1,1664 <atoi+0x8a>
        neg = 1;
    167e:	4e05                	li	t3,1
    1680:	bf51                	j	1614 <atoi+0x3a>

0000000000001682 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1682:	16060d63          	beqz	a2,17fc <memset+0x17a>
    1686:	40a007b3          	neg	a5,a0
    168a:	8b9d                	andi	a5,a5,7
    168c:	00778713          	addi	a4,a5,7
    1690:	482d                	li	a6,11
    1692:	0ff5f593          	andi	a1,a1,255
    1696:	fff60693          	addi	a3,a2,-1
    169a:	17076263          	bltu	a4,a6,17fe <memset+0x17c>
    169e:	16e6ea63          	bltu	a3,a4,1812 <memset+0x190>
    16a2:	16078563          	beqz	a5,180c <memset+0x18a>
    16a6:	00b50023          	sb	a1,0(a0)
    16aa:	4705                	li	a4,1
    16ac:	00150e93          	addi	t4,a0,1
    16b0:	14e78c63          	beq	a5,a4,1808 <memset+0x186>
    16b4:	00b500a3          	sb	a1,1(a0)
    16b8:	4709                	li	a4,2
    16ba:	00250e93          	addi	t4,a0,2
    16be:	14e78d63          	beq	a5,a4,1818 <memset+0x196>
    16c2:	00b50123          	sb	a1,2(a0)
    16c6:	470d                	li	a4,3
    16c8:	00350e93          	addi	t4,a0,3
    16cc:	12e78b63          	beq	a5,a4,1802 <memset+0x180>
    16d0:	00b501a3          	sb	a1,3(a0)
    16d4:	4711                	li	a4,4
    16d6:	00450e93          	addi	t4,a0,4
    16da:	14e78163          	beq	a5,a4,181c <memset+0x19a>
    16de:	00b50223          	sb	a1,4(a0)
    16e2:	4715                	li	a4,5
    16e4:	00550e93          	addi	t4,a0,5
    16e8:	12e78c63          	beq	a5,a4,1820 <memset+0x19e>
    16ec:	00b502a3          	sb	a1,5(a0)
    16f0:	471d                	li	a4,7
    16f2:	00650e93          	addi	t4,a0,6
    16f6:	12e79763          	bne	a5,a4,1824 <memset+0x1a2>
    16fa:	00750e93          	addi	t4,a0,7
    16fe:	00b50323          	sb	a1,6(a0)
    1702:	4f1d                	li	t5,7
    1704:	00859713          	slli	a4,a1,0x8
    1708:	8f4d                	or	a4,a4,a1
    170a:	01059e13          	slli	t3,a1,0x10
    170e:	01c76e33          	or	t3,a4,t3
    1712:	01859313          	slli	t1,a1,0x18
    1716:	006e6333          	or	t1,t3,t1
    171a:	02059893          	slli	a7,a1,0x20
    171e:	011368b3          	or	a7,t1,a7
    1722:	02859813          	slli	a6,a1,0x28
    1726:	40f60333          	sub	t1,a2,a5
    172a:	0108e833          	or	a6,a7,a6
    172e:	03059693          	slli	a3,a1,0x30
    1732:	00d866b3          	or	a3,a6,a3
    1736:	03859713          	slli	a4,a1,0x38
    173a:	97aa                	add	a5,a5,a0
    173c:	ff837813          	andi	a6,t1,-8
    1740:	8f55                	or	a4,a4,a3
    1742:	00f806b3          	add	a3,a6,a5
    1746:	e398                	sd	a4,0(a5)
    1748:	07a1                	addi	a5,a5,8
    174a:	fed79ee3          	bne	a5,a3,1746 <memset+0xc4>
    174e:	ff837693          	andi	a3,t1,-8
    1752:	00de87b3          	add	a5,t4,a3
    1756:	01e6873b          	addw	a4,a3,t5
    175a:	0ad30663          	beq	t1,a3,1806 <memset+0x184>
    175e:	00b78023          	sb	a1,0(a5)
    1762:	0017069b          	addiw	a3,a4,1
    1766:	08c6fb63          	bgeu	a3,a2,17fc <memset+0x17a>
    176a:	00b780a3          	sb	a1,1(a5)
    176e:	0027069b          	addiw	a3,a4,2
    1772:	08c6f563          	bgeu	a3,a2,17fc <memset+0x17a>
    1776:	00b78123          	sb	a1,2(a5)
    177a:	0037069b          	addiw	a3,a4,3
    177e:	06c6ff63          	bgeu	a3,a2,17fc <memset+0x17a>
    1782:	00b781a3          	sb	a1,3(a5)
    1786:	0047069b          	addiw	a3,a4,4
    178a:	06c6f963          	bgeu	a3,a2,17fc <memset+0x17a>
    178e:	00b78223          	sb	a1,4(a5)
    1792:	0057069b          	addiw	a3,a4,5
    1796:	06c6f363          	bgeu	a3,a2,17fc <memset+0x17a>
    179a:	00b782a3          	sb	a1,5(a5)
    179e:	0067069b          	addiw	a3,a4,6
    17a2:	04c6fd63          	bgeu	a3,a2,17fc <memset+0x17a>
    17a6:	00b78323          	sb	a1,6(a5)
    17aa:	0077069b          	addiw	a3,a4,7
    17ae:	04c6f763          	bgeu	a3,a2,17fc <memset+0x17a>
    17b2:	00b783a3          	sb	a1,7(a5)
    17b6:	0087069b          	addiw	a3,a4,8
    17ba:	04c6f163          	bgeu	a3,a2,17fc <memset+0x17a>
    17be:	00b78423          	sb	a1,8(a5)
    17c2:	0097069b          	addiw	a3,a4,9
    17c6:	02c6fb63          	bgeu	a3,a2,17fc <memset+0x17a>
    17ca:	00b784a3          	sb	a1,9(a5)
    17ce:	00a7069b          	addiw	a3,a4,10
    17d2:	02c6f563          	bgeu	a3,a2,17fc <memset+0x17a>
    17d6:	00b78523          	sb	a1,10(a5)
    17da:	00b7069b          	addiw	a3,a4,11
    17de:	00c6ff63          	bgeu	a3,a2,17fc <memset+0x17a>
    17e2:	00b785a3          	sb	a1,11(a5)
    17e6:	00c7069b          	addiw	a3,a4,12
    17ea:	00c6f963          	bgeu	a3,a2,17fc <memset+0x17a>
    17ee:	00b78623          	sb	a1,12(a5)
    17f2:	2735                	addiw	a4,a4,13
    17f4:	00c77463          	bgeu	a4,a2,17fc <memset+0x17a>
    17f8:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17fc:	8082                	ret
    17fe:	472d                	li	a4,11
    1800:	bd79                	j	169e <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1802:	4f0d                	li	t5,3
    1804:	b701                	j	1704 <memset+0x82>
    1806:	8082                	ret
    1808:	4f05                	li	t5,1
    180a:	bded                	j	1704 <memset+0x82>
    180c:	8eaa                	mv	t4,a0
    180e:	4f01                	li	t5,0
    1810:	bdd5                	j	1704 <memset+0x82>
    1812:	87aa                	mv	a5,a0
    1814:	4701                	li	a4,0
    1816:	b7a1                	j	175e <memset+0xdc>
    1818:	4f09                	li	t5,2
    181a:	b5ed                	j	1704 <memset+0x82>
    181c:	4f11                	li	t5,4
    181e:	b5dd                	j	1704 <memset+0x82>
    1820:	4f15                	li	t5,5
    1822:	b5cd                	j	1704 <memset+0x82>
    1824:	4f19                	li	t5,6
    1826:	bdf9                	j	1704 <memset+0x82>

0000000000001828 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1828:	00054783          	lbu	a5,0(a0)
    182c:	0005c703          	lbu	a4,0(a1)
    1830:	00e79863          	bne	a5,a4,1840 <strcmp+0x18>
    1834:	0505                	addi	a0,a0,1
    1836:	0585                	addi	a1,a1,1
    1838:	fbe5                	bnez	a5,1828 <strcmp>
    183a:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    183c:	9d19                	subw	a0,a0,a4
    183e:	8082                	ret
    1840:	0007851b          	sext.w	a0,a5
    1844:	bfe5                	j	183c <strcmp+0x14>

0000000000001846 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1846:	ce05                	beqz	a2,187e <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1848:	00054703          	lbu	a4,0(a0)
    184c:	0005c783          	lbu	a5,0(a1)
    1850:	cb0d                	beqz	a4,1882 <strncmp+0x3c>
    if (!n--)
    1852:	167d                	addi	a2,a2,-1
    1854:	00c506b3          	add	a3,a0,a2
    1858:	a819                	j	186e <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    185a:	00a68e63          	beq	a3,a0,1876 <strncmp+0x30>
    185e:	0505                	addi	a0,a0,1
    1860:	00e79b63          	bne	a5,a4,1876 <strncmp+0x30>
    1864:	00054703          	lbu	a4,0(a0)
    1868:	0005c783          	lbu	a5,0(a1)
    186c:	cb19                	beqz	a4,1882 <strncmp+0x3c>
    186e:	0005c783          	lbu	a5,0(a1)
    1872:	0585                	addi	a1,a1,1
    1874:	f3fd                	bnez	a5,185a <strncmp+0x14>
        ;
    return *l - *r;
    1876:	0007051b          	sext.w	a0,a4
    187a:	9d1d                	subw	a0,a0,a5
    187c:	8082                	ret
        return 0;
    187e:	4501                	li	a0,0
}
    1880:	8082                	ret
    1882:	4501                	li	a0,0
    return *l - *r;
    1884:	9d1d                	subw	a0,a0,a5
    1886:	8082                	ret

0000000000001888 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1888:	00757793          	andi	a5,a0,7
    188c:	cf89                	beqz	a5,18a6 <strlen+0x1e>
    188e:	87aa                	mv	a5,a0
    1890:	a029                	j	189a <strlen+0x12>
    1892:	0785                	addi	a5,a5,1
    1894:	0077f713          	andi	a4,a5,7
    1898:	cb01                	beqz	a4,18a8 <strlen+0x20>
        if (!*s)
    189a:	0007c703          	lbu	a4,0(a5)
    189e:	fb75                	bnez	a4,1892 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    18a0:	40a78533          	sub	a0,a5,a0
}
    18a4:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18a6:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    18a8:	6394                	ld	a3,0(a5)
    18aa:	00000597          	auipc	a1,0x0
    18ae:	6f65b583          	ld	a1,1782(a1) # 1fa0 <__clone+0xfc>
    18b2:	00000617          	auipc	a2,0x0
    18b6:	6f663603          	ld	a2,1782(a2) # 1fa8 <__clone+0x104>
    18ba:	a019                	j	18c0 <strlen+0x38>
    18bc:	6794                	ld	a3,8(a5)
    18be:	07a1                	addi	a5,a5,8
    18c0:	00b68733          	add	a4,a3,a1
    18c4:	fff6c693          	not	a3,a3
    18c8:	8f75                	and	a4,a4,a3
    18ca:	8f71                	and	a4,a4,a2
    18cc:	db65                	beqz	a4,18bc <strlen+0x34>
    for (; *s; s++)
    18ce:	0007c703          	lbu	a4,0(a5)
    18d2:	d779                	beqz	a4,18a0 <strlen+0x18>
    18d4:	0017c703          	lbu	a4,1(a5)
    18d8:	0785                	addi	a5,a5,1
    18da:	d379                	beqz	a4,18a0 <strlen+0x18>
    18dc:	0017c703          	lbu	a4,1(a5)
    18e0:	0785                	addi	a5,a5,1
    18e2:	fb6d                	bnez	a4,18d4 <strlen+0x4c>
    18e4:	bf75                	j	18a0 <strlen+0x18>

00000000000018e6 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18e6:	00757713          	andi	a4,a0,7
{
    18ea:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18ec:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18f0:	cb19                	beqz	a4,1906 <memchr+0x20>
    18f2:	ce25                	beqz	a2,196a <memchr+0x84>
    18f4:	0007c703          	lbu	a4,0(a5)
    18f8:	04b70e63          	beq	a4,a1,1954 <memchr+0x6e>
    18fc:	0785                	addi	a5,a5,1
    18fe:	0077f713          	andi	a4,a5,7
    1902:	167d                	addi	a2,a2,-1
    1904:	f77d                	bnez	a4,18f2 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1906:	4501                	li	a0,0
    if (n && *s != c)
    1908:	c235                	beqz	a2,196c <memchr+0x86>
    190a:	0007c703          	lbu	a4,0(a5)
    190e:	04b70363          	beq	a4,a1,1954 <memchr+0x6e>
        size_t k = ONES * c;
    1912:	00000517          	auipc	a0,0x0
    1916:	69e53503          	ld	a0,1694(a0) # 1fb0 <__clone+0x10c>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    191a:	471d                	li	a4,7
        size_t k = ONES * c;
    191c:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1920:	02c77a63          	bgeu	a4,a2,1954 <memchr+0x6e>
    1924:	00000897          	auipc	a7,0x0
    1928:	67c8b883          	ld	a7,1660(a7) # 1fa0 <__clone+0xfc>
    192c:	00000817          	auipc	a6,0x0
    1930:	67c83803          	ld	a6,1660(a6) # 1fa8 <__clone+0x104>
    1934:	431d                	li	t1,7
    1936:	a029                	j	1940 <memchr+0x5a>
    1938:	1661                	addi	a2,a2,-8
    193a:	07a1                	addi	a5,a5,8
    193c:	02c37963          	bgeu	t1,a2,196e <memchr+0x88>
    1940:	6398                	ld	a4,0(a5)
    1942:	8f29                	xor	a4,a4,a0
    1944:	011706b3          	add	a3,a4,a7
    1948:	fff74713          	not	a4,a4
    194c:	8f75                	and	a4,a4,a3
    194e:	01077733          	and	a4,a4,a6
    1952:	d37d                	beqz	a4,1938 <memchr+0x52>
    1954:	853e                	mv	a0,a5
    1956:	97b2                	add	a5,a5,a2
    1958:	a021                	j	1960 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    195a:	0505                	addi	a0,a0,1
    195c:	00f50763          	beq	a0,a5,196a <memchr+0x84>
    1960:	00054703          	lbu	a4,0(a0)
    1964:	feb71be3          	bne	a4,a1,195a <memchr+0x74>
    1968:	8082                	ret
    return n ? (void *)s : 0;
    196a:	4501                	li	a0,0
}
    196c:	8082                	ret
    return n ? (void *)s : 0;
    196e:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    1970:	f275                	bnez	a2,1954 <memchr+0x6e>
}
    1972:	8082                	ret

0000000000001974 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1974:	1101                	addi	sp,sp,-32
    1976:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1978:	862e                	mv	a2,a1
{
    197a:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    197c:	4581                	li	a1,0
{
    197e:	e426                	sd	s1,8(sp)
    1980:	ec06                	sd	ra,24(sp)
    1982:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1984:	f63ff0ef          	jal	ra,18e6 <memchr>
    return p ? p - s : n;
    1988:	c519                	beqz	a0,1996 <strnlen+0x22>
}
    198a:	60e2                	ld	ra,24(sp)
    198c:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    198e:	8d05                	sub	a0,a0,s1
}
    1990:	64a2                	ld	s1,8(sp)
    1992:	6105                	addi	sp,sp,32
    1994:	8082                	ret
    1996:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1998:	8522                	mv	a0,s0
}
    199a:	6442                	ld	s0,16(sp)
    199c:	64a2                	ld	s1,8(sp)
    199e:	6105                	addi	sp,sp,32
    19a0:	8082                	ret

00000000000019a2 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19a2:	00b547b3          	xor	a5,a0,a1
    19a6:	8b9d                	andi	a5,a5,7
    19a8:	eb95                	bnez	a5,19dc <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19aa:	0075f793          	andi	a5,a1,7
    19ae:	e7b1                	bnez	a5,19fa <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    19b0:	6198                	ld	a4,0(a1)
    19b2:	00000617          	auipc	a2,0x0
    19b6:	5ee63603          	ld	a2,1518(a2) # 1fa0 <__clone+0xfc>
    19ba:	00000817          	auipc	a6,0x0
    19be:	5ee83803          	ld	a6,1518(a6) # 1fa8 <__clone+0x104>
    19c2:	a029                	j	19cc <strcpy+0x2a>
    19c4:	e118                	sd	a4,0(a0)
    19c6:	6598                	ld	a4,8(a1)
    19c8:	05a1                	addi	a1,a1,8
    19ca:	0521                	addi	a0,a0,8
    19cc:	00c707b3          	add	a5,a4,a2
    19d0:	fff74693          	not	a3,a4
    19d4:	8ff5                	and	a5,a5,a3
    19d6:	0107f7b3          	and	a5,a5,a6
    19da:	d7ed                	beqz	a5,19c4 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19dc:	0005c783          	lbu	a5,0(a1)
    19e0:	00f50023          	sb	a5,0(a0)
    19e4:	c785                	beqz	a5,1a0c <strcpy+0x6a>
    19e6:	0015c783          	lbu	a5,1(a1)
    19ea:	0505                	addi	a0,a0,1
    19ec:	0585                	addi	a1,a1,1
    19ee:	00f50023          	sb	a5,0(a0)
    19f2:	fbf5                	bnez	a5,19e6 <strcpy+0x44>
        ;
    return d;
}
    19f4:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19f6:	0505                	addi	a0,a0,1
    19f8:	df45                	beqz	a4,19b0 <strcpy+0xe>
            if (!(*d = *s))
    19fa:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19fe:	0585                	addi	a1,a1,1
    1a00:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1a04:	00f50023          	sb	a5,0(a0)
    1a08:	f7fd                	bnez	a5,19f6 <strcpy+0x54>
}
    1a0a:	8082                	ret
    1a0c:	8082                	ret

0000000000001a0e <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a0e:	00b547b3          	xor	a5,a0,a1
    1a12:	8b9d                	andi	a5,a5,7
    1a14:	1a079863          	bnez	a5,1bc4 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a18:	0075f793          	andi	a5,a1,7
    1a1c:	16078463          	beqz	a5,1b84 <strncpy+0x176>
    1a20:	ea01                	bnez	a2,1a30 <strncpy+0x22>
    1a22:	a421                	j	1c2a <strncpy+0x21c>
    1a24:	167d                	addi	a2,a2,-1
    1a26:	0505                	addi	a0,a0,1
    1a28:	14070e63          	beqz	a4,1b84 <strncpy+0x176>
    1a2c:	1a060863          	beqz	a2,1bdc <strncpy+0x1ce>
    1a30:	0005c783          	lbu	a5,0(a1)
    1a34:	0585                	addi	a1,a1,1
    1a36:	0075f713          	andi	a4,a1,7
    1a3a:	00f50023          	sb	a5,0(a0)
    1a3e:	f3fd                	bnez	a5,1a24 <strncpy+0x16>
    1a40:	4805                	li	a6,1
    1a42:	1a061863          	bnez	a2,1bf2 <strncpy+0x1e4>
    1a46:	40a007b3          	neg	a5,a0
    1a4a:	8b9d                	andi	a5,a5,7
    1a4c:	4681                	li	a3,0
    1a4e:	18061a63          	bnez	a2,1be2 <strncpy+0x1d4>
    1a52:	00778713          	addi	a4,a5,7
    1a56:	45ad                	li	a1,11
    1a58:	18b76363          	bltu	a4,a1,1bde <strncpy+0x1d0>
    1a5c:	1ae6eb63          	bltu	a3,a4,1c12 <strncpy+0x204>
    1a60:	1a078363          	beqz	a5,1c06 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a64:	00050023          	sb	zero,0(a0)
    1a68:	4685                	li	a3,1
    1a6a:	00150713          	addi	a4,a0,1
    1a6e:	18d78f63          	beq	a5,a3,1c0c <strncpy+0x1fe>
    1a72:	000500a3          	sb	zero,1(a0)
    1a76:	4689                	li	a3,2
    1a78:	00250713          	addi	a4,a0,2
    1a7c:	18d78e63          	beq	a5,a3,1c18 <strncpy+0x20a>
    1a80:	00050123          	sb	zero,2(a0)
    1a84:	468d                	li	a3,3
    1a86:	00350713          	addi	a4,a0,3
    1a8a:	16d78c63          	beq	a5,a3,1c02 <strncpy+0x1f4>
    1a8e:	000501a3          	sb	zero,3(a0)
    1a92:	4691                	li	a3,4
    1a94:	00450713          	addi	a4,a0,4
    1a98:	18d78263          	beq	a5,a3,1c1c <strncpy+0x20e>
    1a9c:	00050223          	sb	zero,4(a0)
    1aa0:	4695                	li	a3,5
    1aa2:	00550713          	addi	a4,a0,5
    1aa6:	16d78d63          	beq	a5,a3,1c20 <strncpy+0x212>
    1aaa:	000502a3          	sb	zero,5(a0)
    1aae:	469d                	li	a3,7
    1ab0:	00650713          	addi	a4,a0,6
    1ab4:	16d79863          	bne	a5,a3,1c24 <strncpy+0x216>
    1ab8:	00750713          	addi	a4,a0,7
    1abc:	00050323          	sb	zero,6(a0)
    1ac0:	40f80833          	sub	a6,a6,a5
    1ac4:	ff887593          	andi	a1,a6,-8
    1ac8:	97aa                	add	a5,a5,a0
    1aca:	95be                	add	a1,a1,a5
    1acc:	0007b023          	sd	zero,0(a5)
    1ad0:	07a1                	addi	a5,a5,8
    1ad2:	feb79de3          	bne	a5,a1,1acc <strncpy+0xbe>
    1ad6:	ff887593          	andi	a1,a6,-8
    1ada:	9ead                	addw	a3,a3,a1
    1adc:	00b707b3          	add	a5,a4,a1
    1ae0:	12b80863          	beq	a6,a1,1c10 <strncpy+0x202>
    1ae4:	00078023          	sb	zero,0(a5)
    1ae8:	0016871b          	addiw	a4,a3,1
    1aec:	0ec77863          	bgeu	a4,a2,1bdc <strncpy+0x1ce>
    1af0:	000780a3          	sb	zero,1(a5)
    1af4:	0026871b          	addiw	a4,a3,2
    1af8:	0ec77263          	bgeu	a4,a2,1bdc <strncpy+0x1ce>
    1afc:	00078123          	sb	zero,2(a5)
    1b00:	0036871b          	addiw	a4,a3,3
    1b04:	0cc77c63          	bgeu	a4,a2,1bdc <strncpy+0x1ce>
    1b08:	000781a3          	sb	zero,3(a5)
    1b0c:	0046871b          	addiw	a4,a3,4
    1b10:	0cc77663          	bgeu	a4,a2,1bdc <strncpy+0x1ce>
    1b14:	00078223          	sb	zero,4(a5)
    1b18:	0056871b          	addiw	a4,a3,5
    1b1c:	0cc77063          	bgeu	a4,a2,1bdc <strncpy+0x1ce>
    1b20:	000782a3          	sb	zero,5(a5)
    1b24:	0066871b          	addiw	a4,a3,6
    1b28:	0ac77a63          	bgeu	a4,a2,1bdc <strncpy+0x1ce>
    1b2c:	00078323          	sb	zero,6(a5)
    1b30:	0076871b          	addiw	a4,a3,7
    1b34:	0ac77463          	bgeu	a4,a2,1bdc <strncpy+0x1ce>
    1b38:	000783a3          	sb	zero,7(a5)
    1b3c:	0086871b          	addiw	a4,a3,8
    1b40:	08c77e63          	bgeu	a4,a2,1bdc <strncpy+0x1ce>
    1b44:	00078423          	sb	zero,8(a5)
    1b48:	0096871b          	addiw	a4,a3,9
    1b4c:	08c77863          	bgeu	a4,a2,1bdc <strncpy+0x1ce>
    1b50:	000784a3          	sb	zero,9(a5)
    1b54:	00a6871b          	addiw	a4,a3,10
    1b58:	08c77263          	bgeu	a4,a2,1bdc <strncpy+0x1ce>
    1b5c:	00078523          	sb	zero,10(a5)
    1b60:	00b6871b          	addiw	a4,a3,11
    1b64:	06c77c63          	bgeu	a4,a2,1bdc <strncpy+0x1ce>
    1b68:	000785a3          	sb	zero,11(a5)
    1b6c:	00c6871b          	addiw	a4,a3,12
    1b70:	06c77663          	bgeu	a4,a2,1bdc <strncpy+0x1ce>
    1b74:	00078623          	sb	zero,12(a5)
    1b78:	26b5                	addiw	a3,a3,13
    1b7a:	06c6f163          	bgeu	a3,a2,1bdc <strncpy+0x1ce>
    1b7e:	000786a3          	sb	zero,13(a5)
    1b82:	8082                	ret
            ;
        if (!n || !*s)
    1b84:	c645                	beqz	a2,1c2c <strncpy+0x21e>
    1b86:	0005c783          	lbu	a5,0(a1)
    1b8a:	ea078be3          	beqz	a5,1a40 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b8e:	479d                	li	a5,7
    1b90:	02c7ff63          	bgeu	a5,a2,1bce <strncpy+0x1c0>
    1b94:	00000897          	auipc	a7,0x0
    1b98:	40c8b883          	ld	a7,1036(a7) # 1fa0 <__clone+0xfc>
    1b9c:	00000817          	auipc	a6,0x0
    1ba0:	40c83803          	ld	a6,1036(a6) # 1fa8 <__clone+0x104>
    1ba4:	431d                	li	t1,7
    1ba6:	6198                	ld	a4,0(a1)
    1ba8:	011707b3          	add	a5,a4,a7
    1bac:	fff74693          	not	a3,a4
    1bb0:	8ff5                	and	a5,a5,a3
    1bb2:	0107f7b3          	and	a5,a5,a6
    1bb6:	ef81                	bnez	a5,1bce <strncpy+0x1c0>
            *wd = *ws;
    1bb8:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1bba:	1661                	addi	a2,a2,-8
    1bbc:	05a1                	addi	a1,a1,8
    1bbe:	0521                	addi	a0,a0,8
    1bc0:	fec363e3          	bltu	t1,a2,1ba6 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bc4:	e609                	bnez	a2,1bce <strncpy+0x1c0>
    1bc6:	a08d                	j	1c28 <strncpy+0x21a>
    1bc8:	167d                	addi	a2,a2,-1
    1bca:	0505                	addi	a0,a0,1
    1bcc:	ca01                	beqz	a2,1bdc <strncpy+0x1ce>
    1bce:	0005c783          	lbu	a5,0(a1)
    1bd2:	0585                	addi	a1,a1,1
    1bd4:	00f50023          	sb	a5,0(a0)
    1bd8:	fbe5                	bnez	a5,1bc8 <strncpy+0x1ba>
        ;
tail:
    1bda:	b59d                	j	1a40 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1bdc:	8082                	ret
    1bde:	472d                	li	a4,11
    1be0:	bdb5                	j	1a5c <strncpy+0x4e>
    1be2:	00778713          	addi	a4,a5,7
    1be6:	45ad                	li	a1,11
    1be8:	fff60693          	addi	a3,a2,-1
    1bec:	e6b778e3          	bgeu	a4,a1,1a5c <strncpy+0x4e>
    1bf0:	b7fd                	j	1bde <strncpy+0x1d0>
    1bf2:	40a007b3          	neg	a5,a0
    1bf6:	8832                	mv	a6,a2
    1bf8:	8b9d                	andi	a5,a5,7
    1bfa:	4681                	li	a3,0
    1bfc:	e4060be3          	beqz	a2,1a52 <strncpy+0x44>
    1c00:	b7cd                	j	1be2 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c02:	468d                	li	a3,3
    1c04:	bd75                	j	1ac0 <strncpy+0xb2>
    1c06:	872a                	mv	a4,a0
    1c08:	4681                	li	a3,0
    1c0a:	bd5d                	j	1ac0 <strncpy+0xb2>
    1c0c:	4685                	li	a3,1
    1c0e:	bd4d                	j	1ac0 <strncpy+0xb2>
    1c10:	8082                	ret
    1c12:	87aa                	mv	a5,a0
    1c14:	4681                	li	a3,0
    1c16:	b5f9                	j	1ae4 <strncpy+0xd6>
    1c18:	4689                	li	a3,2
    1c1a:	b55d                	j	1ac0 <strncpy+0xb2>
    1c1c:	4691                	li	a3,4
    1c1e:	b54d                	j	1ac0 <strncpy+0xb2>
    1c20:	4695                	li	a3,5
    1c22:	bd79                	j	1ac0 <strncpy+0xb2>
    1c24:	4699                	li	a3,6
    1c26:	bd69                	j	1ac0 <strncpy+0xb2>
    1c28:	8082                	ret
    1c2a:	8082                	ret
    1c2c:	8082                	ret

0000000000001c2e <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c2e:	87aa                	mv	a5,a0
    1c30:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c32:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c36:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c3a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c3c:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c3e:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c42:	2501                	sext.w	a0,a0
    1c44:	8082                	ret

0000000000001c46 <openat>:
    register long a7 __asm__("a7") = n;
    1c46:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c4a:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c4e:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c52:	2501                	sext.w	a0,a0
    1c54:	8082                	ret

0000000000001c56 <close>:
    register long a7 __asm__("a7") = n;
    1c56:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c5a:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c5e:	2501                	sext.w	a0,a0
    1c60:	8082                	ret

0000000000001c62 <read>:
    register long a7 __asm__("a7") = n;
    1c62:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c66:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c6a:	8082                	ret

0000000000001c6c <write>:
    register long a7 __asm__("a7") = n;
    1c6c:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c70:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c74:	8082                	ret

0000000000001c76 <getpid>:
    register long a7 __asm__("a7") = n;
    1c76:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c7a:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c7e:	2501                	sext.w	a0,a0
    1c80:	8082                	ret

0000000000001c82 <getppid>:
    register long a7 __asm__("a7") = n;
    1c82:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c86:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c8a:	2501                	sext.w	a0,a0
    1c8c:	8082                	ret

0000000000001c8e <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c8e:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c92:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c96:	2501                	sext.w	a0,a0
    1c98:	8082                	ret

0000000000001c9a <fork>:
    register long a7 __asm__("a7") = n;
    1c9a:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c9e:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1ca0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ca2:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1ca6:	2501                	sext.w	a0,a0
    1ca8:	8082                	ret

0000000000001caa <clone>:
// 子进程执行的执行的函数指针 | 函数参数 | 栈地址 | 栈的大小 | 标志位
pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1caa:	85b2                	mv	a1,a2
    1cac:	863a                	mv	a2,a4
    if (stack)
    1cae:	c191                	beqz	a1,1cb2 <clone+0x8>
	stack += stack_size;
    1cb0:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1cb2:	4781                	li	a5,0
    1cb4:	4701                	li	a4,0
    1cb6:	4681                	li	a3,0
    1cb8:	2601                	sext.w	a2,a2
    1cba:	a2ed                	j	1ea4 <__clone>

0000000000001cbc <exit>:
    register long a7 __asm__("a7") = n;
    1cbc:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cc0:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cc4:	8082                	ret

0000000000001cc6 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cc6:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cca:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ccc:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cd0:	2501                	sext.w	a0,a0
    1cd2:	8082                	ret

0000000000001cd4 <exec>:
    register long a7 __asm__("a7") = n;
    1cd4:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cd8:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cdc:	2501                	sext.w	a0,a0
    1cde:	8082                	ret

0000000000001ce0 <execve>:
    register long a7 __asm__("a7") = n;
    1ce0:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ce4:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1ce8:	2501                	sext.w	a0,a0
    1cea:	8082                	ret

0000000000001cec <times>:
    register long a7 __asm__("a7") = n;
    1cec:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cf0:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cf4:	2501                	sext.w	a0,a0
    1cf6:	8082                	ret

0000000000001cf8 <get_time>:

int64 get_time()
{
    1cf8:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cfa:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cfe:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d00:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d02:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1d06:	2501                	sext.w	a0,a0
    1d08:	ed09                	bnez	a0,1d22 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1d0a:	67a2                	ld	a5,8(sp)
    1d0c:	3e800713          	li	a4,1000
    1d10:	00015503          	lhu	a0,0(sp)
    1d14:	02e7d7b3          	divu	a5,a5,a4
    1d18:	02e50533          	mul	a0,a0,a4
    1d1c:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d1e:	0141                	addi	sp,sp,16
    1d20:	8082                	ret
        return -1;
    1d22:	557d                	li	a0,-1
    1d24:	bfed                	j	1d1e <get_time+0x26>

0000000000001d26 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d26:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d2a:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d2e:	2501                	sext.w	a0,a0
    1d30:	8082                	ret

0000000000001d32 <time>:
    register long a7 __asm__("a7") = n;
    1d32:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d36:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d3a:	2501                	sext.w	a0,a0
    1d3c:	8082                	ret

0000000000001d3e <sleep>:

int sleep(unsigned long long time)
{
    1d3e:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d40:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d42:	850a                	mv	a0,sp
    1d44:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d46:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d4a:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d4c:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d50:	e501                	bnez	a0,1d58 <sleep+0x1a>
    return 0;
    1d52:	4501                	li	a0,0
}
    1d54:	0141                	addi	sp,sp,16
    1d56:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d58:	4502                	lw	a0,0(sp)
}
    1d5a:	0141                	addi	sp,sp,16
    1d5c:	8082                	ret

0000000000001d5e <set_priority>:
    register long a7 __asm__("a7") = n;
    1d5e:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d62:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d66:	2501                	sext.w	a0,a0
    1d68:	8082                	ret

0000000000001d6a <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d6a:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d6e:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d72:	8082                	ret

0000000000001d74 <munmap>:
    register long a7 __asm__("a7") = n;
    1d74:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d78:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d7c:	2501                	sext.w	a0,a0
    1d7e:	8082                	ret

0000000000001d80 <wait>:

int wait(int *code)
{
    1d80:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d82:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d86:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d88:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d8a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d8c:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d90:	2501                	sext.w	a0,a0
    1d92:	8082                	ret

0000000000001d94 <spawn>:
    register long a7 __asm__("a7") = n;
    1d94:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d98:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d9c:	2501                	sext.w	a0,a0
    1d9e:	8082                	ret

0000000000001da0 <mailread>:
    register long a7 __asm__("a7") = n;
    1da0:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1da4:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1da8:	2501                	sext.w	a0,a0
    1daa:	8082                	ret

0000000000001dac <mailwrite>:
    register long a7 __asm__("a7") = n;
    1dac:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db0:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1db4:	2501                	sext.w	a0,a0
    1db6:	8082                	ret

0000000000001db8 <fstat>:
    register long a7 __asm__("a7") = n;
    1db8:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dbc:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dc0:	2501                	sext.w	a0,a0
    1dc2:	8082                	ret

0000000000001dc4 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1dc4:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1dc6:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1dca:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dcc:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dd4:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dd6:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1dda:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ddc:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1de0:	2501                	sext.w	a0,a0
    1de2:	8082                	ret

0000000000001de4 <link>:

int link(char *old_path, char *new_path)
{
    1de4:	87aa                	mv	a5,a0
    1de6:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1de8:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1dec:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1df0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1df2:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1df6:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1df8:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1dfc:	2501                	sext.w	a0,a0
    1dfe:	8082                	ret

0000000000001e00 <unlink>:

int unlink(char *path)
{
    1e00:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e02:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1e06:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1e0a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e0c:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <uname>:
    register long a7 __asm__("a7") = n;
    1e14:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e18:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <brk>:
    register long a7 __asm__("a7") = n;
    1e20:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e24:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <getcwd>:
    register long a7 __asm__("a7") = n;
    1e2c:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e2e:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e32:	8082                	ret

0000000000001e34 <chdir>:
    register long a7 __asm__("a7") = n;
    1e34:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e38:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e3c:	2501                	sext.w	a0,a0
    1e3e:	8082                	ret

0000000000001e40 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e40:	862e                	mv	a2,a1
    1e42:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e44:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e46:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e4a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e4e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e50:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e52:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e56:	2501                	sext.w	a0,a0
    1e58:	8082                	ret

0000000000001e5a <getdents>:
    register long a7 __asm__("a7") = n;
    1e5a:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e5e:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e62:	2501                	sext.w	a0,a0
    1e64:	8082                	ret

0000000000001e66 <pipe>:
    register long a7 __asm__("a7") = n;
    1e66:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e6a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e6c:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e70:	2501                	sext.w	a0,a0
    1e72:	8082                	ret

0000000000001e74 <dup>:
    register long a7 __asm__("a7") = n;
    1e74:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e76:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e7a:	2501                	sext.w	a0,a0
    1e7c:	8082                	ret

0000000000001e7e <dup2>:
    register long a7 __asm__("a7") = n;
    1e7e:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e80:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e82:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e86:	2501                	sext.w	a0,a0
    1e88:	8082                	ret

0000000000001e8a <mount>:
    register long a7 __asm__("a7") = n;
    1e8a:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e8e:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e92:	2501                	sext.w	a0,a0
    1e94:	8082                	ret

0000000000001e96 <umount>:
    register long a7 __asm__("a7") = n;
    1e96:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e9a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e9c:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ea0:	2501                	sext.w	a0,a0
    1ea2:	8082                	ret

0000000000001ea4 <__clone>:
.global __clone
.type  __clone, %function
# 函数指针 | 栈地址 | 标志位
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ea4:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1ea6:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ea8:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1eaa:	8532                	mv	a0,a2
	mv a2, a4
    1eac:	863a                	mv	a2,a4
	mv a3, a5
    1eae:	86be                	mv	a3,a5
	mv a4, a6
    1eb0:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1eb2:	0dc00893          	li	a7,220
	ecall
    1eb6:	00000073          	ecall

	beqz a0, 1f
    1eba:	c111                	beqz	a0,1ebe <__clone+0x1a>
	# Parent
	ret
    1ebc:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ebe:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ec0:	6522                	ld	a0,8(sp)
	jalr a1
    1ec2:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ec4:	05d00893          	li	a7,93
	ecall
    1ec8:	00000073          	ecall
