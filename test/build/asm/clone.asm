
/home/lmq/Desktop/xv6-k210/test/build/riscv64/clone:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0f5                	j	10ee <__start_main>

0000000000001004 <child_func>:
#include "unistd.h"

size_t stack[1024] = {0};
static int child_pid;

static int child_func(void){
    1004:	1141                	addi	sp,sp,-16
    printf("  Child says successfully!\n");
    1006:	00001517          	auipc	a0,0x1
    100a:	eb250513          	addi	a0,a0,-334 # 1eb8 <__clone+0x28>
static int child_func(void){
    100e:	e406                	sd	ra,8(sp)
    printf("  Child says successfully!\n");
    1010:	2fe000ef          	jal	ra,130e <printf>
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
    1022:	eba50513          	addi	a0,a0,-326 # 1ed8 <__clone+0x48>
void test_clone(void){
    1026:	ec06                	sd	ra,24(sp)
    1028:	e822                	sd	s0,16(sp)
    TEST_START(__func__);
    102a:	2c2000ef          	jal	ra,12ec <puts>
    102e:	00003517          	auipc	a0,0x3
    1032:	f6a50513          	addi	a0,a0,-150 # 3f98 <__func__.1171>
    1036:	2b6000ef          	jal	ra,12ec <puts>
    103a:	00001517          	auipc	a0,0x1
    103e:	eb650513          	addi	a0,a0,-330 # 1ef0 <__clone+0x60>
    1042:	2aa000ef          	jal	ra,12ec <puts>
    int wstatus;
    child_pid = clone(child_func, NULL, stack, 1024, SIGCHLD);
    1046:	4745                	li	a4,17
    1048:	40000693          	li	a3,1024
    104c:	00001617          	auipc	a2,0x1
    1050:	f4460613          	addi	a2,a2,-188 # 1f90 <stack>
    1054:	4581                	li	a1,0
    1056:	00000517          	auipc	a0,0x0
    105a:	fae50513          	addi	a0,a0,-82 # 1004 <child_func>
    105e:	439000ef          	jal	ra,1c96 <clone>
    1062:	00003417          	auipc	s0,0x3
    1066:	f2e40413          	addi	s0,s0,-210 # 3f90 <child_pid>
    106a:	c008                	sw	a0,0(s0)
    assert(child_pid != -1);
    106c:	57fd                	li	a5,-1
    106e:	04f50863          	beq	a0,a5,10be <test_clone+0xa2>
    if (child_pid == 0){
    1072:	e90d                	bnez	a0,10a4 <test_clone+0x88>
	exit(0);
    1074:	435000ef          	jal	ra,1ca8 <exit>
	    printf("clone process successfully.\npid:%d\n", child_pid);
	else
	    printf("clone process error.\n");
    }

    TEST_END(__func__);
    1078:	00001517          	auipc	a0,0x1
    107c:	ee850513          	addi	a0,a0,-280 # 1f60 <__clone+0xd0>
    1080:	26c000ef          	jal	ra,12ec <puts>
    1084:	00003517          	auipc	a0,0x3
    1088:	f1450513          	addi	a0,a0,-236 # 3f98 <__func__.1171>
    108c:	260000ef          	jal	ra,12ec <puts>
    1090:	00001517          	auipc	a0,0x1
    1094:	e6050513          	addi	a0,a0,-416 # 1ef0 <__clone+0x60>
    1098:	254000ef          	jal	ra,12ec <puts>
}
    109c:	60e2                	ld	ra,24(sp)
    109e:	6442                	ld	s0,16(sp)
    10a0:	6105                	addi	sp,sp,32
    10a2:	8082                	ret
	if(wait(&wstatus) == child_pid)
    10a4:	0068                	addi	a0,sp,12
    10a6:	4c7000ef          	jal	ra,1d6c <wait>
    10aa:	401c                	lw	a5,0(s0)
    10ac:	02f50163          	beq	a0,a5,10ce <test_clone+0xb2>
	    printf("clone process error.\n");
    10b0:	00001517          	auipc	a0,0x1
    10b4:	e9850513          	addi	a0,a0,-360 # 1f48 <__clone+0xb8>
    10b8:	256000ef          	jal	ra,130e <printf>
    10bc:	bf75                	j	1078 <test_clone+0x5c>
    assert(child_pid != -1);
    10be:	00001517          	auipc	a0,0x1
    10c2:	e4250513          	addi	a0,a0,-446 # 1f00 <__clone+0x70>
    10c6:	4d0000ef          	jal	ra,1596 <panic>
    10ca:	4008                	lw	a0,0(s0)
    10cc:	b75d                	j	1072 <test_clone+0x56>
	    printf("clone process successfully.\npid:%d\n", child_pid);
    10ce:	85aa                	mv	a1,a0
    10d0:	00001517          	auipc	a0,0x1
    10d4:	e5050513          	addi	a0,a0,-432 # 1f20 <__clone+0x90>
    10d8:	236000ef          	jal	ra,130e <printf>
    10dc:	bf71                	j	1078 <test_clone+0x5c>

00000000000010de <main>:

int main(void){
    10de:	1141                	addi	sp,sp,-16
    10e0:	e406                	sd	ra,8(sp)
    test_clone();
    10e2:	f3bff0ef          	jal	ra,101c <test_clone>
    return 0;
}
    10e6:	60a2                	ld	ra,8(sp)
    10e8:	4501                	li	a0,0
    10ea:	0141                	addi	sp,sp,16
    10ec:	8082                	ret

00000000000010ee <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ee:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10f0:	4108                	lw	a0,0(a0)
{
    10f2:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10f4:	05a1                	addi	a1,a1,8
{
    10f6:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10f8:	fe7ff0ef          	jal	ra,10de <main>
    10fc:	3ad000ef          	jal	ra,1ca8 <exit>
	return 0;
}
    1100:	60a2                	ld	ra,8(sp)
    1102:	4501                	li	a0,0
    1104:	0141                	addi	sp,sp,16
    1106:	8082                	ret

0000000000001108 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1108:	7179                	addi	sp,sp,-48
    110a:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    110c:	12054b63          	bltz	a0,1242 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1110:	02b577bb          	remuw	a5,a0,a1
    1114:	00003697          	auipc	a3,0x3
    1118:	e9468693          	addi	a3,a3,-364 # 3fa8 <digits>
    buf[16] = 0;
    111c:	00010c23          	sb	zero,24(sp)
    i = 15;
    1120:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    1124:	1782                	slli	a5,a5,0x20
    1126:	9381                	srli	a5,a5,0x20
    1128:	97b6                	add	a5,a5,a3
    112a:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    112e:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1132:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1136:	16b56263          	bltu	a0,a1,129a <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    113a:	02e8763b          	remuw	a2,a6,a4
    113e:	1602                	slli	a2,a2,0x20
    1140:	9201                	srli	a2,a2,0x20
    1142:	9636                	add	a2,a2,a3
    1144:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1148:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    114c:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1150:	12e86963          	bltu	a6,a4,1282 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    1154:	02e5f63b          	remuw	a2,a1,a4
    1158:	1602                	slli	a2,a2,0x20
    115a:	9201                	srli	a2,a2,0x20
    115c:	9636                	add	a2,a2,a3
    115e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1162:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1166:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    116a:	10e5ef63          	bltu	a1,a4,1288 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    116e:	02e8763b          	remuw	a2,a6,a4
    1172:	1602                	slli	a2,a2,0x20
    1174:	9201                	srli	a2,a2,0x20
    1176:	9636                	add	a2,a2,a3
    1178:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    117c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1180:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1184:	10e86563          	bltu	a6,a4,128e <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    1188:	02e5f63b          	remuw	a2,a1,a4
    118c:	1602                	slli	a2,a2,0x20
    118e:	9201                	srli	a2,a2,0x20
    1190:	9636                	add	a2,a2,a3
    1192:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1196:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    119a:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    119e:	0ee5eb63          	bltu	a1,a4,1294 <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    11a2:	02e8763b          	remuw	a2,a6,a4
    11a6:	1602                	slli	a2,a2,0x20
    11a8:	9201                	srli	a2,a2,0x20
    11aa:	9636                	add	a2,a2,a3
    11ac:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11b0:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11b4:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    11b8:	0ce86263          	bltu	a6,a4,127c <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    11bc:	02e5f63b          	remuw	a2,a1,a4
    11c0:	1602                	slli	a2,a2,0x20
    11c2:	9201                	srli	a2,a2,0x20
    11c4:	9636                	add	a2,a2,a3
    11c6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ca:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11ce:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11d2:	0ce5e663          	bltu	a1,a4,129e <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    11d6:	02e8763b          	remuw	a2,a6,a4
    11da:	1602                	slli	a2,a2,0x20
    11dc:	9201                	srli	a2,a2,0x20
    11de:	9636                	add	a2,a2,a3
    11e0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11e4:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11e8:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11ec:	0ae86c63          	bltu	a6,a4,12a4 <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    11f0:	02e5f63b          	remuw	a2,a1,a4
    11f4:	1602                	slli	a2,a2,0x20
    11f6:	9201                	srli	a2,a2,0x20
    11f8:	9636                	add	a2,a2,a3
    11fa:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11fe:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1202:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    1206:	0ae5e263          	bltu	a1,a4,12aa <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    120a:	1782                	slli	a5,a5,0x20
    120c:	9381                	srli	a5,a5,0x20
    120e:	97b6                	add	a5,a5,a3
    1210:	0007c703          	lbu	a4,0(a5)
    1214:	4599                	li	a1,6
    1216:	4795                	li	a5,5
    1218:	00e10723          	sb	a4,14(sp)

    if (sign)
    121c:	00055963          	bgez	a0,122e <printint.constprop.0+0x126>
        buf[i--] = '-';
    1220:	1018                	addi	a4,sp,32
    1222:	973e                	add	a4,a4,a5
    1224:	02d00693          	li	a3,45
    1228:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    122c:	85be                	mv	a1,a5
    write(f, s, l);
    122e:	003c                	addi	a5,sp,8
    1230:	4641                	li	a2,16
    1232:	9e0d                	subw	a2,a2,a1
    1234:	4505                	li	a0,1
    1236:	95be                	add	a1,a1,a5
    1238:	221000ef          	jal	ra,1c58 <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    123c:	70a2                	ld	ra,40(sp)
    123e:	6145                	addi	sp,sp,48
    1240:	8082                	ret
        x = -xx;
    1242:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1246:	02b677bb          	remuw	a5,a2,a1
    124a:	00003697          	auipc	a3,0x3
    124e:	d5e68693          	addi	a3,a3,-674 # 3fa8 <digits>
    buf[16] = 0;
    1252:	00010c23          	sb	zero,24(sp)
    i = 15;
    1256:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    125a:	1782                	slli	a5,a5,0x20
    125c:	9381                	srli	a5,a5,0x20
    125e:	97b6                	add	a5,a5,a3
    1260:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1264:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1268:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    126c:	ecb677e3          	bgeu	a2,a1,113a <printint.constprop.0+0x32>
        buf[i--] = '-';
    1270:	02d00793          	li	a5,45
    1274:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1278:	45b9                	li	a1,14
    127a:	bf55                	j	122e <printint.constprop.0+0x126>
    127c:	47a5                	li	a5,9
    127e:	45a9                	li	a1,10
    1280:	bf71                	j	121c <printint.constprop.0+0x114>
    1282:	47b5                	li	a5,13
    1284:	45b9                	li	a1,14
    1286:	bf59                	j	121c <printint.constprop.0+0x114>
    1288:	47b1                	li	a5,12
    128a:	45b5                	li	a1,13
    128c:	bf41                	j	121c <printint.constprop.0+0x114>
    128e:	47ad                	li	a5,11
    1290:	45b1                	li	a1,12
    1292:	b769                	j	121c <printint.constprop.0+0x114>
    1294:	47a9                	li	a5,10
    1296:	45ad                	li	a1,11
    1298:	b751                	j	121c <printint.constprop.0+0x114>
    i = 15;
    129a:	45bd                	li	a1,15
    129c:	bf49                	j	122e <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    129e:	47a1                	li	a5,8
    12a0:	45a5                	li	a1,9
    12a2:	bfad                	j	121c <printint.constprop.0+0x114>
    12a4:	479d                	li	a5,7
    12a6:	45a1                	li	a1,8
    12a8:	bf95                	j	121c <printint.constprop.0+0x114>
    12aa:	4799                	li	a5,6
    12ac:	459d                	li	a1,7
    12ae:	b7bd                	j	121c <printint.constprop.0+0x114>

00000000000012b0 <getchar>:
{
    12b0:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12b2:	00f10593          	addi	a1,sp,15
    12b6:	4605                	li	a2,1
    12b8:	4501                	li	a0,0
{
    12ba:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12bc:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12c0:	18f000ef          	jal	ra,1c4e <read>
}
    12c4:	60e2                	ld	ra,24(sp)
    12c6:	00f14503          	lbu	a0,15(sp)
    12ca:	6105                	addi	sp,sp,32
    12cc:	8082                	ret

00000000000012ce <putchar>:
{
    12ce:	1101                	addi	sp,sp,-32
    12d0:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12d2:	00f10593          	addi	a1,sp,15
    12d6:	4605                	li	a2,1
    12d8:	4505                	li	a0,1
{
    12da:	ec06                	sd	ra,24(sp)
    char byte = c;
    12dc:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12e0:	179000ef          	jal	ra,1c58 <write>
}
    12e4:	60e2                	ld	ra,24(sp)
    12e6:	2501                	sext.w	a0,a0
    12e8:	6105                	addi	sp,sp,32
    12ea:	8082                	ret

00000000000012ec <puts>:
{
    12ec:	1141                	addi	sp,sp,-16
    12ee:	e406                	sd	ra,8(sp)
    12f0:	e022                	sd	s0,0(sp)
    12f2:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12f4:	580000ef          	jal	ra,1874 <strlen>
    12f8:	862a                	mv	a2,a0
    12fa:	85a2                	mv	a1,s0
    12fc:	4505                	li	a0,1
    12fe:	15b000ef          	jal	ra,1c58 <write>
}
    1302:	60a2                	ld	ra,8(sp)
    1304:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1306:	957d                	srai	a0,a0,0x3f
    return r;
    1308:	2501                	sext.w	a0,a0
}
    130a:	0141                	addi	sp,sp,16
    130c:	8082                	ret

000000000000130e <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    130e:	7171                	addi	sp,sp,-176
    1310:	fc56                	sd	s5,56(sp)
    1312:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    1314:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1316:	18bc                	addi	a5,sp,120
{
    1318:	e8ca                	sd	s2,80(sp)
    131a:	e4ce                	sd	s3,72(sp)
    131c:	e0d2                	sd	s4,64(sp)
    131e:	f85a                	sd	s6,48(sp)
    1320:	f486                	sd	ra,104(sp)
    1322:	f0a2                	sd	s0,96(sp)
    1324:	eca6                	sd	s1,88(sp)
    1326:	fcae                	sd	a1,120(sp)
    1328:	e132                	sd	a2,128(sp)
    132a:	e536                	sd	a3,136(sp)
    132c:	e93a                	sd	a4,144(sp)
    132e:	f142                	sd	a6,160(sp)
    1330:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1332:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1334:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1338:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    133c:	00001b17          	auipc	s6,0x1
    1340:	c34b0b13          	addi	s6,s6,-972 # 1f70 <__clone+0xe0>
    buf[i++] = '0';
    1344:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1348:	00003997          	auipc	s3,0x3
    134c:	c6098993          	addi	s3,s3,-928 # 3fa8 <digits>
        if (!*s)
    1350:	00054783          	lbu	a5,0(a0)
    1354:	16078a63          	beqz	a5,14c8 <printf+0x1ba>
    1358:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    135a:	19278163          	beq	a5,s2,14dc <printf+0x1ce>
    135e:	00164783          	lbu	a5,1(a2)
    1362:	0605                	addi	a2,a2,1
    1364:	fbfd                	bnez	a5,135a <printf+0x4c>
    1366:	84b2                	mv	s1,a2
        l = z - a;
    1368:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    136c:	85aa                	mv	a1,a0
    136e:	8622                	mv	a2,s0
    1370:	4505                	li	a0,1
    1372:	0e7000ef          	jal	ra,1c58 <write>
        if (l)
    1376:	18041c63          	bnez	s0,150e <printf+0x200>
        if (s[1] == 0)
    137a:	0014c783          	lbu	a5,1(s1)
    137e:	14078563          	beqz	a5,14c8 <printf+0x1ba>
        switch (s[1])
    1382:	1d478063          	beq	a5,s4,1542 <printf+0x234>
    1386:	18fa6663          	bltu	s4,a5,1512 <printf+0x204>
    138a:	06400713          	li	a4,100
    138e:	1ae78063          	beq	a5,a4,152e <printf+0x220>
    1392:	07000713          	li	a4,112
    1396:	1ce79963          	bne	a5,a4,1568 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    139a:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    139c:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    13a0:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13a2:	631c                	ld	a5,0(a4)
    13a4:	0721                	addi	a4,a4,8
    13a6:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13a8:	00479293          	slli	t0,a5,0x4
    13ac:	00879f93          	slli	t6,a5,0x8
    13b0:	00c79f13          	slli	t5,a5,0xc
    13b4:	01079e93          	slli	t4,a5,0x10
    13b8:	01479e13          	slli	t3,a5,0x14
    13bc:	01879313          	slli	t1,a5,0x18
    13c0:	01c79893          	slli	a7,a5,0x1c
    13c4:	02479813          	slli	a6,a5,0x24
    13c8:	02879513          	slli	a0,a5,0x28
    13cc:	02c79593          	slli	a1,a5,0x2c
    13d0:	03079693          	slli	a3,a5,0x30
    13d4:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13d8:	03c7d413          	srli	s0,a5,0x3c
    13dc:	01c7d39b          	srliw	t2,a5,0x1c
    13e0:	03c2d293          	srli	t0,t0,0x3c
    13e4:	03cfdf93          	srli	t6,t6,0x3c
    13e8:	03cf5f13          	srli	t5,t5,0x3c
    13ec:	03cede93          	srli	t4,t4,0x3c
    13f0:	03ce5e13          	srli	t3,t3,0x3c
    13f4:	03c35313          	srli	t1,t1,0x3c
    13f8:	03c8d893          	srli	a7,a7,0x3c
    13fc:	03c85813          	srli	a6,a6,0x3c
    1400:	9171                	srli	a0,a0,0x3c
    1402:	91f1                	srli	a1,a1,0x3c
    1404:	92f1                	srli	a3,a3,0x3c
    1406:	9371                	srli	a4,a4,0x3c
    1408:	96ce                	add	a3,a3,s3
    140a:	974e                	add	a4,a4,s3
    140c:	944e                	add	s0,s0,s3
    140e:	92ce                	add	t0,t0,s3
    1410:	9fce                	add	t6,t6,s3
    1412:	9f4e                	add	t5,t5,s3
    1414:	9ece                	add	t4,t4,s3
    1416:	9e4e                	add	t3,t3,s3
    1418:	934e                	add	t1,t1,s3
    141a:	98ce                	add	a7,a7,s3
    141c:	93ce                	add	t2,t2,s3
    141e:	984e                	add	a6,a6,s3
    1420:	954e                	add	a0,a0,s3
    1422:	95ce                	add	a1,a1,s3
    1424:	0006c083          	lbu	ra,0(a3)
    1428:	0002c283          	lbu	t0,0(t0)
    142c:	00074683          	lbu	a3,0(a4)
    1430:	000fcf83          	lbu	t6,0(t6)
    1434:	000f4f03          	lbu	t5,0(t5)
    1438:	000ece83          	lbu	t4,0(t4)
    143c:	000e4e03          	lbu	t3,0(t3)
    1440:	00034303          	lbu	t1,0(t1)
    1444:	0008c883          	lbu	a7,0(a7)
    1448:	0003c383          	lbu	t2,0(t2)
    144c:	00084803          	lbu	a6,0(a6)
    1450:	00054503          	lbu	a0,0(a0)
    1454:	0005c583          	lbu	a1,0(a1)
    1458:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    145c:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1460:	9371                	srli	a4,a4,0x3c
    1462:	8bbd                	andi	a5,a5,15
    1464:	974e                	add	a4,a4,s3
    1466:	97ce                	add	a5,a5,s3
    1468:	005105a3          	sb	t0,11(sp)
    146c:	01f10623          	sb	t6,12(sp)
    1470:	01e106a3          	sb	t5,13(sp)
    1474:	01d10723          	sb	t4,14(sp)
    1478:	01c107a3          	sb	t3,15(sp)
    147c:	00610823          	sb	t1,16(sp)
    1480:	011108a3          	sb	a7,17(sp)
    1484:	00710923          	sb	t2,18(sp)
    1488:	010109a3          	sb	a6,19(sp)
    148c:	00a10a23          	sb	a0,20(sp)
    1490:	00b10aa3          	sb	a1,21(sp)
    1494:	00110b23          	sb	ra,22(sp)
    1498:	00d10ba3          	sb	a3,23(sp)
    149c:	00810523          	sb	s0,10(sp)
    14a0:	00074703          	lbu	a4,0(a4)
    14a4:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14a8:	002c                	addi	a1,sp,8
    14aa:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ac:	00e10c23          	sb	a4,24(sp)
    14b0:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14b4:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    14b8:	7a0000ef          	jal	ra,1c58 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    14bc:	00248513          	addi	a0,s1,2
        if (!*s)
    14c0:	00054783          	lbu	a5,0(a0)
    14c4:	e8079ae3          	bnez	a5,1358 <printf+0x4a>
    }
    va_end(ap);
}
    14c8:	70a6                	ld	ra,104(sp)
    14ca:	7406                	ld	s0,96(sp)
    14cc:	64e6                	ld	s1,88(sp)
    14ce:	6946                	ld	s2,80(sp)
    14d0:	69a6                	ld	s3,72(sp)
    14d2:	6a06                	ld	s4,64(sp)
    14d4:	7ae2                	ld	s5,56(sp)
    14d6:	7b42                	ld	s6,48(sp)
    14d8:	614d                	addi	sp,sp,176
    14da:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14dc:	00064783          	lbu	a5,0(a2)
    14e0:	84b2                	mv	s1,a2
    14e2:	01278963          	beq	a5,s2,14f4 <printf+0x1e6>
    14e6:	b549                	j	1368 <printf+0x5a>
    14e8:	0024c783          	lbu	a5,2(s1)
    14ec:	0605                	addi	a2,a2,1
    14ee:	0489                	addi	s1,s1,2
    14f0:	e7279ce3          	bne	a5,s2,1368 <printf+0x5a>
    14f4:	0014c783          	lbu	a5,1(s1)
    14f8:	ff2788e3          	beq	a5,s2,14e8 <printf+0x1da>
        l = z - a;
    14fc:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1500:	85aa                	mv	a1,a0
    1502:	8622                	mv	a2,s0
    1504:	4505                	li	a0,1
    1506:	752000ef          	jal	ra,1c58 <write>
        if (l)
    150a:	e60408e3          	beqz	s0,137a <printf+0x6c>
    150e:	8526                	mv	a0,s1
    1510:	b581                	j	1350 <printf+0x42>
        switch (s[1])
    1512:	07800713          	li	a4,120
    1516:	04e79963          	bne	a5,a4,1568 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    151a:	6782                	ld	a5,0(sp)
    151c:	45c1                	li	a1,16
    151e:	4388                	lw	a0,0(a5)
    1520:	07a1                	addi	a5,a5,8
    1522:	e03e                	sd	a5,0(sp)
    1524:	be5ff0ef          	jal	ra,1108 <printint.constprop.0>
        s += 2;
    1528:	00248513          	addi	a0,s1,2
    152c:	bf51                	j	14c0 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    152e:	6782                	ld	a5,0(sp)
    1530:	45a9                	li	a1,10
    1532:	4388                	lw	a0,0(a5)
    1534:	07a1                	addi	a5,a5,8
    1536:	e03e                	sd	a5,0(sp)
    1538:	bd1ff0ef          	jal	ra,1108 <printint.constprop.0>
        s += 2;
    153c:	00248513          	addi	a0,s1,2
    1540:	b741                	j	14c0 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1542:	6782                	ld	a5,0(sp)
    1544:	6380                	ld	s0,0(a5)
    1546:	07a1                	addi	a5,a5,8
    1548:	e03e                	sd	a5,0(sp)
    154a:	c421                	beqz	s0,1592 <printf+0x284>
            l = strnlen(a, 200);
    154c:	0c800593          	li	a1,200
    1550:	8522                	mv	a0,s0
    1552:	40e000ef          	jal	ra,1960 <strnlen>
    write(f, s, l);
    1556:	0005061b          	sext.w	a2,a0
    155a:	85a2                	mv	a1,s0
    155c:	4505                	li	a0,1
    155e:	6fa000ef          	jal	ra,1c58 <write>
        s += 2;
    1562:	00248513          	addi	a0,s1,2
    1566:	bfa9                	j	14c0 <printf+0x1b2>
    char byte = c;
    1568:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    156c:	4605                	li	a2,1
    156e:	002c                	addi	a1,sp,8
    1570:	4505                	li	a0,1
    char byte = c;
    1572:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1576:	6e2000ef          	jal	ra,1c58 <write>
    char byte = c;
    157a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    157e:	4605                	li	a2,1
    1580:	002c                	addi	a1,sp,8
    1582:	4505                	li	a0,1
    char byte = c;
    1584:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1588:	6d0000ef          	jal	ra,1c58 <write>
        s += 2;
    158c:	00248513          	addi	a0,s1,2
    1590:	bf05                	j	14c0 <printf+0x1b2>
                a = "(null)";
    1592:	845a                	mv	s0,s6
    1594:	bf65                	j	154c <printf+0x23e>

0000000000001596 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1596:	1141                	addi	sp,sp,-16
    1598:	e406                	sd	ra,8(sp)
    puts(m);
    159a:	d53ff0ef          	jal	ra,12ec <puts>
    exit(-100);
}
    159e:	60a2                	ld	ra,8(sp)
    exit(-100);
    15a0:	f9c00513          	li	a0,-100
}
    15a4:	0141                	addi	sp,sp,16
    exit(-100);
    15a6:	a709                	j	1ca8 <exit>

00000000000015a8 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a8:	02000793          	li	a5,32
    15ac:	00f50663          	beq	a0,a5,15b8 <isspace+0x10>
    15b0:	355d                	addiw	a0,a0,-9
    15b2:	00553513          	sltiu	a0,a0,5
    15b6:	8082                	ret
    15b8:	4505                	li	a0,1
}
    15ba:	8082                	ret

00000000000015bc <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15bc:	fd05051b          	addiw	a0,a0,-48
}
    15c0:	00a53513          	sltiu	a0,a0,10
    15c4:	8082                	ret

00000000000015c6 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c6:	02000613          	li	a2,32
    15ca:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15cc:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d0:	ff77069b          	addiw	a3,a4,-9
    15d4:	04c70d63          	beq	a4,a2,162e <atoi+0x68>
    15d8:	0007079b          	sext.w	a5,a4
    15dc:	04d5f963          	bgeu	a1,a3,162e <atoi+0x68>
        s++;
    switch (*s)
    15e0:	02b00693          	li	a3,43
    15e4:	04d70a63          	beq	a4,a3,1638 <atoi+0x72>
    15e8:	02d00693          	li	a3,45
    15ec:	06d70463          	beq	a4,a3,1654 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15f0:	fd07859b          	addiw	a1,a5,-48
    15f4:	4625                	li	a2,9
    15f6:	873e                	mv	a4,a5
    15f8:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15fa:	4e01                	li	t3,0
    while (isdigit(*s))
    15fc:	04b66a63          	bltu	a2,a1,1650 <atoi+0x8a>
    int n = 0, neg = 0;
    1600:	4501                	li	a0,0
    while (isdigit(*s))
    1602:	4825                	li	a6,9
    1604:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    1608:	0025179b          	slliw	a5,a0,0x2
    160c:	9d3d                	addw	a0,a0,a5
    160e:	fd07031b          	addiw	t1,a4,-48
    1612:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1616:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    161a:	0685                	addi	a3,a3,1
    161c:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1620:	0006071b          	sext.w	a4,a2
    1624:	feb870e3          	bgeu	a6,a1,1604 <atoi+0x3e>
    return neg ? n : -n;
    1628:	000e0563          	beqz	t3,1632 <atoi+0x6c>
}
    162c:	8082                	ret
        s++;
    162e:	0505                	addi	a0,a0,1
    1630:	bf71                	j	15cc <atoi+0x6>
    1632:	4113053b          	subw	a0,t1,a7
    1636:	8082                	ret
    while (isdigit(*s))
    1638:	00154783          	lbu	a5,1(a0)
    163c:	4625                	li	a2,9
        s++;
    163e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1642:	fd07859b          	addiw	a1,a5,-48
    1646:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    164a:	4e01                	li	t3,0
    while (isdigit(*s))
    164c:	fab67ae3          	bgeu	a2,a1,1600 <atoi+0x3a>
    1650:	4501                	li	a0,0
}
    1652:	8082                	ret
    while (isdigit(*s))
    1654:	00154783          	lbu	a5,1(a0)
    1658:	4625                	li	a2,9
        s++;
    165a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    165e:	fd07859b          	addiw	a1,a5,-48
    1662:	0007871b          	sext.w	a4,a5
    1666:	feb665e3          	bltu	a2,a1,1650 <atoi+0x8a>
        neg = 1;
    166a:	4e05                	li	t3,1
    166c:	bf51                	j	1600 <atoi+0x3a>

000000000000166e <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    166e:	16060d63          	beqz	a2,17e8 <memset+0x17a>
    1672:	40a007b3          	neg	a5,a0
    1676:	8b9d                	andi	a5,a5,7
    1678:	00778713          	addi	a4,a5,7
    167c:	482d                	li	a6,11
    167e:	0ff5f593          	andi	a1,a1,255
    1682:	fff60693          	addi	a3,a2,-1
    1686:	17076263          	bltu	a4,a6,17ea <memset+0x17c>
    168a:	16e6ea63          	bltu	a3,a4,17fe <memset+0x190>
    168e:	16078563          	beqz	a5,17f8 <memset+0x18a>
    1692:	00b50023          	sb	a1,0(a0)
    1696:	4705                	li	a4,1
    1698:	00150e93          	addi	t4,a0,1
    169c:	14e78c63          	beq	a5,a4,17f4 <memset+0x186>
    16a0:	00b500a3          	sb	a1,1(a0)
    16a4:	4709                	li	a4,2
    16a6:	00250e93          	addi	t4,a0,2
    16aa:	14e78d63          	beq	a5,a4,1804 <memset+0x196>
    16ae:	00b50123          	sb	a1,2(a0)
    16b2:	470d                	li	a4,3
    16b4:	00350e93          	addi	t4,a0,3
    16b8:	12e78b63          	beq	a5,a4,17ee <memset+0x180>
    16bc:	00b501a3          	sb	a1,3(a0)
    16c0:	4711                	li	a4,4
    16c2:	00450e93          	addi	t4,a0,4
    16c6:	14e78163          	beq	a5,a4,1808 <memset+0x19a>
    16ca:	00b50223          	sb	a1,4(a0)
    16ce:	4715                	li	a4,5
    16d0:	00550e93          	addi	t4,a0,5
    16d4:	12e78c63          	beq	a5,a4,180c <memset+0x19e>
    16d8:	00b502a3          	sb	a1,5(a0)
    16dc:	471d                	li	a4,7
    16de:	00650e93          	addi	t4,a0,6
    16e2:	12e79763          	bne	a5,a4,1810 <memset+0x1a2>
    16e6:	00750e93          	addi	t4,a0,7
    16ea:	00b50323          	sb	a1,6(a0)
    16ee:	4f1d                	li	t5,7
    16f0:	00859713          	slli	a4,a1,0x8
    16f4:	8f4d                	or	a4,a4,a1
    16f6:	01059e13          	slli	t3,a1,0x10
    16fa:	01c76e33          	or	t3,a4,t3
    16fe:	01859313          	slli	t1,a1,0x18
    1702:	006e6333          	or	t1,t3,t1
    1706:	02059893          	slli	a7,a1,0x20
    170a:	011368b3          	or	a7,t1,a7
    170e:	02859813          	slli	a6,a1,0x28
    1712:	40f60333          	sub	t1,a2,a5
    1716:	0108e833          	or	a6,a7,a6
    171a:	03059693          	slli	a3,a1,0x30
    171e:	00d866b3          	or	a3,a6,a3
    1722:	03859713          	slli	a4,a1,0x38
    1726:	97aa                	add	a5,a5,a0
    1728:	ff837813          	andi	a6,t1,-8
    172c:	8f55                	or	a4,a4,a3
    172e:	00f806b3          	add	a3,a6,a5
    1732:	e398                	sd	a4,0(a5)
    1734:	07a1                	addi	a5,a5,8
    1736:	fed79ee3          	bne	a5,a3,1732 <memset+0xc4>
    173a:	ff837693          	andi	a3,t1,-8
    173e:	00de87b3          	add	a5,t4,a3
    1742:	01e6873b          	addw	a4,a3,t5
    1746:	0ad30663          	beq	t1,a3,17f2 <memset+0x184>
    174a:	00b78023          	sb	a1,0(a5)
    174e:	0017069b          	addiw	a3,a4,1
    1752:	08c6fb63          	bgeu	a3,a2,17e8 <memset+0x17a>
    1756:	00b780a3          	sb	a1,1(a5)
    175a:	0027069b          	addiw	a3,a4,2
    175e:	08c6f563          	bgeu	a3,a2,17e8 <memset+0x17a>
    1762:	00b78123          	sb	a1,2(a5)
    1766:	0037069b          	addiw	a3,a4,3
    176a:	06c6ff63          	bgeu	a3,a2,17e8 <memset+0x17a>
    176e:	00b781a3          	sb	a1,3(a5)
    1772:	0047069b          	addiw	a3,a4,4
    1776:	06c6f963          	bgeu	a3,a2,17e8 <memset+0x17a>
    177a:	00b78223          	sb	a1,4(a5)
    177e:	0057069b          	addiw	a3,a4,5
    1782:	06c6f363          	bgeu	a3,a2,17e8 <memset+0x17a>
    1786:	00b782a3          	sb	a1,5(a5)
    178a:	0067069b          	addiw	a3,a4,6
    178e:	04c6fd63          	bgeu	a3,a2,17e8 <memset+0x17a>
    1792:	00b78323          	sb	a1,6(a5)
    1796:	0077069b          	addiw	a3,a4,7
    179a:	04c6f763          	bgeu	a3,a2,17e8 <memset+0x17a>
    179e:	00b783a3          	sb	a1,7(a5)
    17a2:	0087069b          	addiw	a3,a4,8
    17a6:	04c6f163          	bgeu	a3,a2,17e8 <memset+0x17a>
    17aa:	00b78423          	sb	a1,8(a5)
    17ae:	0097069b          	addiw	a3,a4,9
    17b2:	02c6fb63          	bgeu	a3,a2,17e8 <memset+0x17a>
    17b6:	00b784a3          	sb	a1,9(a5)
    17ba:	00a7069b          	addiw	a3,a4,10
    17be:	02c6f563          	bgeu	a3,a2,17e8 <memset+0x17a>
    17c2:	00b78523          	sb	a1,10(a5)
    17c6:	00b7069b          	addiw	a3,a4,11
    17ca:	00c6ff63          	bgeu	a3,a2,17e8 <memset+0x17a>
    17ce:	00b785a3          	sb	a1,11(a5)
    17d2:	00c7069b          	addiw	a3,a4,12
    17d6:	00c6f963          	bgeu	a3,a2,17e8 <memset+0x17a>
    17da:	00b78623          	sb	a1,12(a5)
    17de:	2735                	addiw	a4,a4,13
    17e0:	00c77463          	bgeu	a4,a2,17e8 <memset+0x17a>
    17e4:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17e8:	8082                	ret
    17ea:	472d                	li	a4,11
    17ec:	bd79                	j	168a <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ee:	4f0d                	li	t5,3
    17f0:	b701                	j	16f0 <memset+0x82>
    17f2:	8082                	ret
    17f4:	4f05                	li	t5,1
    17f6:	bded                	j	16f0 <memset+0x82>
    17f8:	8eaa                	mv	t4,a0
    17fa:	4f01                	li	t5,0
    17fc:	bdd5                	j	16f0 <memset+0x82>
    17fe:	87aa                	mv	a5,a0
    1800:	4701                	li	a4,0
    1802:	b7a1                	j	174a <memset+0xdc>
    1804:	4f09                	li	t5,2
    1806:	b5ed                	j	16f0 <memset+0x82>
    1808:	4f11                	li	t5,4
    180a:	b5dd                	j	16f0 <memset+0x82>
    180c:	4f15                	li	t5,5
    180e:	b5cd                	j	16f0 <memset+0x82>
    1810:	4f19                	li	t5,6
    1812:	bdf9                	j	16f0 <memset+0x82>

0000000000001814 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1814:	00054783          	lbu	a5,0(a0)
    1818:	0005c703          	lbu	a4,0(a1)
    181c:	00e79863          	bne	a5,a4,182c <strcmp+0x18>
    1820:	0505                	addi	a0,a0,1
    1822:	0585                	addi	a1,a1,1
    1824:	fbe5                	bnez	a5,1814 <strcmp>
    1826:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1828:	9d19                	subw	a0,a0,a4
    182a:	8082                	ret
    182c:	0007851b          	sext.w	a0,a5
    1830:	bfe5                	j	1828 <strcmp+0x14>

0000000000001832 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1832:	ce05                	beqz	a2,186a <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1834:	00054703          	lbu	a4,0(a0)
    1838:	0005c783          	lbu	a5,0(a1)
    183c:	cb0d                	beqz	a4,186e <strncmp+0x3c>
    if (!n--)
    183e:	167d                	addi	a2,a2,-1
    1840:	00c506b3          	add	a3,a0,a2
    1844:	a819                	j	185a <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1846:	00a68e63          	beq	a3,a0,1862 <strncmp+0x30>
    184a:	0505                	addi	a0,a0,1
    184c:	00e79b63          	bne	a5,a4,1862 <strncmp+0x30>
    1850:	00054703          	lbu	a4,0(a0)
    1854:	0005c783          	lbu	a5,0(a1)
    1858:	cb19                	beqz	a4,186e <strncmp+0x3c>
    185a:	0005c783          	lbu	a5,0(a1)
    185e:	0585                	addi	a1,a1,1
    1860:	f3fd                	bnez	a5,1846 <strncmp+0x14>
        ;
    return *l - *r;
    1862:	0007051b          	sext.w	a0,a4
    1866:	9d1d                	subw	a0,a0,a5
    1868:	8082                	ret
        return 0;
    186a:	4501                	li	a0,0
}
    186c:	8082                	ret
    186e:	4501                	li	a0,0
    return *l - *r;
    1870:	9d1d                	subw	a0,a0,a5
    1872:	8082                	ret

0000000000001874 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1874:	00757793          	andi	a5,a0,7
    1878:	cf89                	beqz	a5,1892 <strlen+0x1e>
    187a:	87aa                	mv	a5,a0
    187c:	a029                	j	1886 <strlen+0x12>
    187e:	0785                	addi	a5,a5,1
    1880:	0077f713          	andi	a4,a5,7
    1884:	cb01                	beqz	a4,1894 <strlen+0x20>
        if (!*s)
    1886:	0007c703          	lbu	a4,0(a5)
    188a:	fb75                	bnez	a4,187e <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    188c:	40a78533          	sub	a0,a5,a0
}
    1890:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1892:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1894:	6394                	ld	a3,0(a5)
    1896:	00000597          	auipc	a1,0x0
    189a:	6e25b583          	ld	a1,1762(a1) # 1f78 <__clone+0xe8>
    189e:	00000617          	auipc	a2,0x0
    18a2:	6e263603          	ld	a2,1762(a2) # 1f80 <__clone+0xf0>
    18a6:	a019                	j	18ac <strlen+0x38>
    18a8:	6794                	ld	a3,8(a5)
    18aa:	07a1                	addi	a5,a5,8
    18ac:	00b68733          	add	a4,a3,a1
    18b0:	fff6c693          	not	a3,a3
    18b4:	8f75                	and	a4,a4,a3
    18b6:	8f71                	and	a4,a4,a2
    18b8:	db65                	beqz	a4,18a8 <strlen+0x34>
    for (; *s; s++)
    18ba:	0007c703          	lbu	a4,0(a5)
    18be:	d779                	beqz	a4,188c <strlen+0x18>
    18c0:	0017c703          	lbu	a4,1(a5)
    18c4:	0785                	addi	a5,a5,1
    18c6:	d379                	beqz	a4,188c <strlen+0x18>
    18c8:	0017c703          	lbu	a4,1(a5)
    18cc:	0785                	addi	a5,a5,1
    18ce:	fb6d                	bnez	a4,18c0 <strlen+0x4c>
    18d0:	bf75                	j	188c <strlen+0x18>

00000000000018d2 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18d2:	00757713          	andi	a4,a0,7
{
    18d6:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18d8:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18dc:	cb19                	beqz	a4,18f2 <memchr+0x20>
    18de:	ce25                	beqz	a2,1956 <memchr+0x84>
    18e0:	0007c703          	lbu	a4,0(a5)
    18e4:	04b70e63          	beq	a4,a1,1940 <memchr+0x6e>
    18e8:	0785                	addi	a5,a5,1
    18ea:	0077f713          	andi	a4,a5,7
    18ee:	167d                	addi	a2,a2,-1
    18f0:	f77d                	bnez	a4,18de <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18f2:	4501                	li	a0,0
    if (n && *s != c)
    18f4:	c235                	beqz	a2,1958 <memchr+0x86>
    18f6:	0007c703          	lbu	a4,0(a5)
    18fa:	04b70363          	beq	a4,a1,1940 <memchr+0x6e>
        size_t k = ONES * c;
    18fe:	00000517          	auipc	a0,0x0
    1902:	68a53503          	ld	a0,1674(a0) # 1f88 <__clone+0xf8>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1906:	471d                	li	a4,7
        size_t k = ONES * c;
    1908:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    190c:	02c77a63          	bgeu	a4,a2,1940 <memchr+0x6e>
    1910:	00000897          	auipc	a7,0x0
    1914:	6688b883          	ld	a7,1640(a7) # 1f78 <__clone+0xe8>
    1918:	00000817          	auipc	a6,0x0
    191c:	66883803          	ld	a6,1640(a6) # 1f80 <__clone+0xf0>
    1920:	431d                	li	t1,7
    1922:	a029                	j	192c <memchr+0x5a>
    1924:	1661                	addi	a2,a2,-8
    1926:	07a1                	addi	a5,a5,8
    1928:	02c37963          	bgeu	t1,a2,195a <memchr+0x88>
    192c:	6398                	ld	a4,0(a5)
    192e:	8f29                	xor	a4,a4,a0
    1930:	011706b3          	add	a3,a4,a7
    1934:	fff74713          	not	a4,a4
    1938:	8f75                	and	a4,a4,a3
    193a:	01077733          	and	a4,a4,a6
    193e:	d37d                	beqz	a4,1924 <memchr+0x52>
    1940:	853e                	mv	a0,a5
    1942:	97b2                	add	a5,a5,a2
    1944:	a021                	j	194c <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1946:	0505                	addi	a0,a0,1
    1948:	00f50763          	beq	a0,a5,1956 <memchr+0x84>
    194c:	00054703          	lbu	a4,0(a0)
    1950:	feb71be3          	bne	a4,a1,1946 <memchr+0x74>
    1954:	8082                	ret
    return n ? (void *)s : 0;
    1956:	4501                	li	a0,0
}
    1958:	8082                	ret
    return n ? (void *)s : 0;
    195a:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    195c:	f275                	bnez	a2,1940 <memchr+0x6e>
}
    195e:	8082                	ret

0000000000001960 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1960:	1101                	addi	sp,sp,-32
    1962:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1964:	862e                	mv	a2,a1
{
    1966:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1968:	4581                	li	a1,0
{
    196a:	e426                	sd	s1,8(sp)
    196c:	ec06                	sd	ra,24(sp)
    196e:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1970:	f63ff0ef          	jal	ra,18d2 <memchr>
    return p ? p - s : n;
    1974:	c519                	beqz	a0,1982 <strnlen+0x22>
}
    1976:	60e2                	ld	ra,24(sp)
    1978:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    197a:	8d05                	sub	a0,a0,s1
}
    197c:	64a2                	ld	s1,8(sp)
    197e:	6105                	addi	sp,sp,32
    1980:	8082                	ret
    1982:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1984:	8522                	mv	a0,s0
}
    1986:	6442                	ld	s0,16(sp)
    1988:	64a2                	ld	s1,8(sp)
    198a:	6105                	addi	sp,sp,32
    198c:	8082                	ret

000000000000198e <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    198e:	00b547b3          	xor	a5,a0,a1
    1992:	8b9d                	andi	a5,a5,7
    1994:	eb95                	bnez	a5,19c8 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1996:	0075f793          	andi	a5,a1,7
    199a:	e7b1                	bnez	a5,19e6 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    199c:	6198                	ld	a4,0(a1)
    199e:	00000617          	auipc	a2,0x0
    19a2:	5da63603          	ld	a2,1498(a2) # 1f78 <__clone+0xe8>
    19a6:	00000817          	auipc	a6,0x0
    19aa:	5da83803          	ld	a6,1498(a6) # 1f80 <__clone+0xf0>
    19ae:	a029                	j	19b8 <strcpy+0x2a>
    19b0:	e118                	sd	a4,0(a0)
    19b2:	6598                	ld	a4,8(a1)
    19b4:	05a1                	addi	a1,a1,8
    19b6:	0521                	addi	a0,a0,8
    19b8:	00c707b3          	add	a5,a4,a2
    19bc:	fff74693          	not	a3,a4
    19c0:	8ff5                	and	a5,a5,a3
    19c2:	0107f7b3          	and	a5,a5,a6
    19c6:	d7ed                	beqz	a5,19b0 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19c8:	0005c783          	lbu	a5,0(a1)
    19cc:	00f50023          	sb	a5,0(a0)
    19d0:	c785                	beqz	a5,19f8 <strcpy+0x6a>
    19d2:	0015c783          	lbu	a5,1(a1)
    19d6:	0505                	addi	a0,a0,1
    19d8:	0585                	addi	a1,a1,1
    19da:	00f50023          	sb	a5,0(a0)
    19de:	fbf5                	bnez	a5,19d2 <strcpy+0x44>
        ;
    return d;
}
    19e0:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19e2:	0505                	addi	a0,a0,1
    19e4:	df45                	beqz	a4,199c <strcpy+0xe>
            if (!(*d = *s))
    19e6:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19ea:	0585                	addi	a1,a1,1
    19ec:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    19f0:	00f50023          	sb	a5,0(a0)
    19f4:	f7fd                	bnez	a5,19e2 <strcpy+0x54>
}
    19f6:	8082                	ret
    19f8:	8082                	ret

00000000000019fa <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19fa:	00b547b3          	xor	a5,a0,a1
    19fe:	8b9d                	andi	a5,a5,7
    1a00:	1a079863          	bnez	a5,1bb0 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a04:	0075f793          	andi	a5,a1,7
    1a08:	16078463          	beqz	a5,1b70 <strncpy+0x176>
    1a0c:	ea01                	bnez	a2,1a1c <strncpy+0x22>
    1a0e:	a421                	j	1c16 <strncpy+0x21c>
    1a10:	167d                	addi	a2,a2,-1
    1a12:	0505                	addi	a0,a0,1
    1a14:	14070e63          	beqz	a4,1b70 <strncpy+0x176>
    1a18:	1a060863          	beqz	a2,1bc8 <strncpy+0x1ce>
    1a1c:	0005c783          	lbu	a5,0(a1)
    1a20:	0585                	addi	a1,a1,1
    1a22:	0075f713          	andi	a4,a1,7
    1a26:	00f50023          	sb	a5,0(a0)
    1a2a:	f3fd                	bnez	a5,1a10 <strncpy+0x16>
    1a2c:	4805                	li	a6,1
    1a2e:	1a061863          	bnez	a2,1bde <strncpy+0x1e4>
    1a32:	40a007b3          	neg	a5,a0
    1a36:	8b9d                	andi	a5,a5,7
    1a38:	4681                	li	a3,0
    1a3a:	18061a63          	bnez	a2,1bce <strncpy+0x1d4>
    1a3e:	00778713          	addi	a4,a5,7
    1a42:	45ad                	li	a1,11
    1a44:	18b76363          	bltu	a4,a1,1bca <strncpy+0x1d0>
    1a48:	1ae6eb63          	bltu	a3,a4,1bfe <strncpy+0x204>
    1a4c:	1a078363          	beqz	a5,1bf2 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a50:	00050023          	sb	zero,0(a0)
    1a54:	4685                	li	a3,1
    1a56:	00150713          	addi	a4,a0,1
    1a5a:	18d78f63          	beq	a5,a3,1bf8 <strncpy+0x1fe>
    1a5e:	000500a3          	sb	zero,1(a0)
    1a62:	4689                	li	a3,2
    1a64:	00250713          	addi	a4,a0,2
    1a68:	18d78e63          	beq	a5,a3,1c04 <strncpy+0x20a>
    1a6c:	00050123          	sb	zero,2(a0)
    1a70:	468d                	li	a3,3
    1a72:	00350713          	addi	a4,a0,3
    1a76:	16d78c63          	beq	a5,a3,1bee <strncpy+0x1f4>
    1a7a:	000501a3          	sb	zero,3(a0)
    1a7e:	4691                	li	a3,4
    1a80:	00450713          	addi	a4,a0,4
    1a84:	18d78263          	beq	a5,a3,1c08 <strncpy+0x20e>
    1a88:	00050223          	sb	zero,4(a0)
    1a8c:	4695                	li	a3,5
    1a8e:	00550713          	addi	a4,a0,5
    1a92:	16d78d63          	beq	a5,a3,1c0c <strncpy+0x212>
    1a96:	000502a3          	sb	zero,5(a0)
    1a9a:	469d                	li	a3,7
    1a9c:	00650713          	addi	a4,a0,6
    1aa0:	16d79863          	bne	a5,a3,1c10 <strncpy+0x216>
    1aa4:	00750713          	addi	a4,a0,7
    1aa8:	00050323          	sb	zero,6(a0)
    1aac:	40f80833          	sub	a6,a6,a5
    1ab0:	ff887593          	andi	a1,a6,-8
    1ab4:	97aa                	add	a5,a5,a0
    1ab6:	95be                	add	a1,a1,a5
    1ab8:	0007b023          	sd	zero,0(a5)
    1abc:	07a1                	addi	a5,a5,8
    1abe:	feb79de3          	bne	a5,a1,1ab8 <strncpy+0xbe>
    1ac2:	ff887593          	andi	a1,a6,-8
    1ac6:	9ead                	addw	a3,a3,a1
    1ac8:	00b707b3          	add	a5,a4,a1
    1acc:	12b80863          	beq	a6,a1,1bfc <strncpy+0x202>
    1ad0:	00078023          	sb	zero,0(a5)
    1ad4:	0016871b          	addiw	a4,a3,1
    1ad8:	0ec77863          	bgeu	a4,a2,1bc8 <strncpy+0x1ce>
    1adc:	000780a3          	sb	zero,1(a5)
    1ae0:	0026871b          	addiw	a4,a3,2
    1ae4:	0ec77263          	bgeu	a4,a2,1bc8 <strncpy+0x1ce>
    1ae8:	00078123          	sb	zero,2(a5)
    1aec:	0036871b          	addiw	a4,a3,3
    1af0:	0cc77c63          	bgeu	a4,a2,1bc8 <strncpy+0x1ce>
    1af4:	000781a3          	sb	zero,3(a5)
    1af8:	0046871b          	addiw	a4,a3,4
    1afc:	0cc77663          	bgeu	a4,a2,1bc8 <strncpy+0x1ce>
    1b00:	00078223          	sb	zero,4(a5)
    1b04:	0056871b          	addiw	a4,a3,5
    1b08:	0cc77063          	bgeu	a4,a2,1bc8 <strncpy+0x1ce>
    1b0c:	000782a3          	sb	zero,5(a5)
    1b10:	0066871b          	addiw	a4,a3,6
    1b14:	0ac77a63          	bgeu	a4,a2,1bc8 <strncpy+0x1ce>
    1b18:	00078323          	sb	zero,6(a5)
    1b1c:	0076871b          	addiw	a4,a3,7
    1b20:	0ac77463          	bgeu	a4,a2,1bc8 <strncpy+0x1ce>
    1b24:	000783a3          	sb	zero,7(a5)
    1b28:	0086871b          	addiw	a4,a3,8
    1b2c:	08c77e63          	bgeu	a4,a2,1bc8 <strncpy+0x1ce>
    1b30:	00078423          	sb	zero,8(a5)
    1b34:	0096871b          	addiw	a4,a3,9
    1b38:	08c77863          	bgeu	a4,a2,1bc8 <strncpy+0x1ce>
    1b3c:	000784a3          	sb	zero,9(a5)
    1b40:	00a6871b          	addiw	a4,a3,10
    1b44:	08c77263          	bgeu	a4,a2,1bc8 <strncpy+0x1ce>
    1b48:	00078523          	sb	zero,10(a5)
    1b4c:	00b6871b          	addiw	a4,a3,11
    1b50:	06c77c63          	bgeu	a4,a2,1bc8 <strncpy+0x1ce>
    1b54:	000785a3          	sb	zero,11(a5)
    1b58:	00c6871b          	addiw	a4,a3,12
    1b5c:	06c77663          	bgeu	a4,a2,1bc8 <strncpy+0x1ce>
    1b60:	00078623          	sb	zero,12(a5)
    1b64:	26b5                	addiw	a3,a3,13
    1b66:	06c6f163          	bgeu	a3,a2,1bc8 <strncpy+0x1ce>
    1b6a:	000786a3          	sb	zero,13(a5)
    1b6e:	8082                	ret
            ;
        if (!n || !*s)
    1b70:	c645                	beqz	a2,1c18 <strncpy+0x21e>
    1b72:	0005c783          	lbu	a5,0(a1)
    1b76:	ea078be3          	beqz	a5,1a2c <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b7a:	479d                	li	a5,7
    1b7c:	02c7ff63          	bgeu	a5,a2,1bba <strncpy+0x1c0>
    1b80:	00000897          	auipc	a7,0x0
    1b84:	3f88b883          	ld	a7,1016(a7) # 1f78 <__clone+0xe8>
    1b88:	00000817          	auipc	a6,0x0
    1b8c:	3f883803          	ld	a6,1016(a6) # 1f80 <__clone+0xf0>
    1b90:	431d                	li	t1,7
    1b92:	6198                	ld	a4,0(a1)
    1b94:	011707b3          	add	a5,a4,a7
    1b98:	fff74693          	not	a3,a4
    1b9c:	8ff5                	and	a5,a5,a3
    1b9e:	0107f7b3          	and	a5,a5,a6
    1ba2:	ef81                	bnez	a5,1bba <strncpy+0x1c0>
            *wd = *ws;
    1ba4:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ba6:	1661                	addi	a2,a2,-8
    1ba8:	05a1                	addi	a1,a1,8
    1baa:	0521                	addi	a0,a0,8
    1bac:	fec363e3          	bltu	t1,a2,1b92 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bb0:	e609                	bnez	a2,1bba <strncpy+0x1c0>
    1bb2:	a08d                	j	1c14 <strncpy+0x21a>
    1bb4:	167d                	addi	a2,a2,-1
    1bb6:	0505                	addi	a0,a0,1
    1bb8:	ca01                	beqz	a2,1bc8 <strncpy+0x1ce>
    1bba:	0005c783          	lbu	a5,0(a1)
    1bbe:	0585                	addi	a1,a1,1
    1bc0:	00f50023          	sb	a5,0(a0)
    1bc4:	fbe5                	bnez	a5,1bb4 <strncpy+0x1ba>
        ;
tail:
    1bc6:	b59d                	j	1a2c <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1bc8:	8082                	ret
    1bca:	472d                	li	a4,11
    1bcc:	bdb5                	j	1a48 <strncpy+0x4e>
    1bce:	00778713          	addi	a4,a5,7
    1bd2:	45ad                	li	a1,11
    1bd4:	fff60693          	addi	a3,a2,-1
    1bd8:	e6b778e3          	bgeu	a4,a1,1a48 <strncpy+0x4e>
    1bdc:	b7fd                	j	1bca <strncpy+0x1d0>
    1bde:	40a007b3          	neg	a5,a0
    1be2:	8832                	mv	a6,a2
    1be4:	8b9d                	andi	a5,a5,7
    1be6:	4681                	li	a3,0
    1be8:	e4060be3          	beqz	a2,1a3e <strncpy+0x44>
    1bec:	b7cd                	j	1bce <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bee:	468d                	li	a3,3
    1bf0:	bd75                	j	1aac <strncpy+0xb2>
    1bf2:	872a                	mv	a4,a0
    1bf4:	4681                	li	a3,0
    1bf6:	bd5d                	j	1aac <strncpy+0xb2>
    1bf8:	4685                	li	a3,1
    1bfa:	bd4d                	j	1aac <strncpy+0xb2>
    1bfc:	8082                	ret
    1bfe:	87aa                	mv	a5,a0
    1c00:	4681                	li	a3,0
    1c02:	b5f9                	j	1ad0 <strncpy+0xd6>
    1c04:	4689                	li	a3,2
    1c06:	b55d                	j	1aac <strncpy+0xb2>
    1c08:	4691                	li	a3,4
    1c0a:	b54d                	j	1aac <strncpy+0xb2>
    1c0c:	4695                	li	a3,5
    1c0e:	bd79                	j	1aac <strncpy+0xb2>
    1c10:	4699                	li	a3,6
    1c12:	bd69                	j	1aac <strncpy+0xb2>
    1c14:	8082                	ret
    1c16:	8082                	ret
    1c18:	8082                	ret

0000000000001c1a <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1c1a:	87aa                	mv	a5,a0
    1c1c:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c1e:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c22:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c26:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c28:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c2a:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c2e:	2501                	sext.w	a0,a0
    1c30:	8082                	ret

0000000000001c32 <openat>:
    register long a7 __asm__("a7") = n;
    1c32:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c36:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c3a:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c3e:	2501                	sext.w	a0,a0
    1c40:	8082                	ret

0000000000001c42 <close>:
    register long a7 __asm__("a7") = n;
    1c42:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c46:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c4a:	2501                	sext.w	a0,a0
    1c4c:	8082                	ret

0000000000001c4e <read>:
    register long a7 __asm__("a7") = n;
    1c4e:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c52:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c56:	8082                	ret

0000000000001c58 <write>:
    register long a7 __asm__("a7") = n;
    1c58:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c5c:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c60:	8082                	ret

0000000000001c62 <getpid>:
    register long a7 __asm__("a7") = n;
    1c62:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c66:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c6a:	2501                	sext.w	a0,a0
    1c6c:	8082                	ret

0000000000001c6e <getppid>:
    register long a7 __asm__("a7") = n;
    1c6e:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c72:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c76:	2501                	sext.w	a0,a0
    1c78:	8082                	ret

0000000000001c7a <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c7a:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c7e:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c82:	2501                	sext.w	a0,a0
    1c84:	8082                	ret

0000000000001c86 <fork>:
    register long a7 __asm__("a7") = n;
    1c86:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c8a:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c8c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c8e:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c92:	2501                	sext.w	a0,a0
    1c94:	8082                	ret

0000000000001c96 <clone>:
// 子进程执行的执行的函数指针 | 函数参数 | 栈地址 | 栈的大小 | 标志位
pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c96:	85b2                	mv	a1,a2
    1c98:	863a                	mv	a2,a4
    if (stack)
    1c9a:	c191                	beqz	a1,1c9e <clone+0x8>
	stack += stack_size;
    1c9c:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c9e:	4781                	li	a5,0
    1ca0:	4701                	li	a4,0
    1ca2:	4681                	li	a3,0
    1ca4:	2601                	sext.w	a2,a2
    1ca6:	a2ed                	j	1e90 <__clone>

0000000000001ca8 <exit>:
    register long a7 __asm__("a7") = n;
    1ca8:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1cac:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1cb0:	8082                	ret

0000000000001cb2 <waitpid>:
    register long a7 __asm__("a7") = n;
    1cb2:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1cb6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cb8:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1cbc:	2501                	sext.w	a0,a0
    1cbe:	8082                	ret

0000000000001cc0 <exec>:
    register long a7 __asm__("a7") = n;
    1cc0:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1cc4:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1cc8:	2501                	sext.w	a0,a0
    1cca:	8082                	ret

0000000000001ccc <execve>:
    register long a7 __asm__("a7") = n;
    1ccc:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cd0:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cd4:	2501                	sext.w	a0,a0
    1cd6:	8082                	ret

0000000000001cd8 <times>:
    register long a7 __asm__("a7") = n;
    1cd8:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cdc:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1ce0:	2501                	sext.w	a0,a0
    1ce2:	8082                	ret

0000000000001ce4 <get_time>:

int64 get_time()
{
    1ce4:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1ce6:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cea:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cec:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cee:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cf2:	2501                	sext.w	a0,a0
    1cf4:	ed09                	bnez	a0,1d0e <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cf6:	67a2                	ld	a5,8(sp)
    1cf8:	3e800713          	li	a4,1000
    1cfc:	00015503          	lhu	a0,0(sp)
    1d00:	02e7d7b3          	divu	a5,a5,a4
    1d04:	02e50533          	mul	a0,a0,a4
    1d08:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1d0a:	0141                	addi	sp,sp,16
    1d0c:	8082                	ret
        return -1;
    1d0e:	557d                	li	a0,-1
    1d10:	bfed                	j	1d0a <get_time+0x26>

0000000000001d12 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1d12:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d16:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1d1a:	2501                	sext.w	a0,a0
    1d1c:	8082                	ret

0000000000001d1e <time>:
    register long a7 __asm__("a7") = n;
    1d1e:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d22:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d26:	2501                	sext.w	a0,a0
    1d28:	8082                	ret

0000000000001d2a <sleep>:

int sleep(unsigned long long time)
{
    1d2a:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d2c:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d2e:	850a                	mv	a0,sp
    1d30:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d32:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d36:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d38:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d3c:	e501                	bnez	a0,1d44 <sleep+0x1a>
    return 0;
    1d3e:	4501                	li	a0,0
}
    1d40:	0141                	addi	sp,sp,16
    1d42:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d44:	4502                	lw	a0,0(sp)
}
    1d46:	0141                	addi	sp,sp,16
    1d48:	8082                	ret

0000000000001d4a <set_priority>:
    register long a7 __asm__("a7") = n;
    1d4a:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d4e:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d52:	2501                	sext.w	a0,a0
    1d54:	8082                	ret

0000000000001d56 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d56:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d5a:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d5e:	8082                	ret

0000000000001d60 <munmap>:
    register long a7 __asm__("a7") = n;
    1d60:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d64:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d68:	2501                	sext.w	a0,a0
    1d6a:	8082                	ret

0000000000001d6c <wait>:

int wait(int *code)
{
    1d6c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d6e:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d72:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d74:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d76:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d78:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d7c:	2501                	sext.w	a0,a0
    1d7e:	8082                	ret

0000000000001d80 <spawn>:
    register long a7 __asm__("a7") = n;
    1d80:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d84:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d88:	2501                	sext.w	a0,a0
    1d8a:	8082                	ret

0000000000001d8c <mailread>:
    register long a7 __asm__("a7") = n;
    1d8c:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d90:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d94:	2501                	sext.w	a0,a0
    1d96:	8082                	ret

0000000000001d98 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d98:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d9c:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1da0:	2501                	sext.w	a0,a0
    1da2:	8082                	ret

0000000000001da4 <fstat>:
    register long a7 __asm__("a7") = n;
    1da4:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1da8:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1dac:	2501                	sext.w	a0,a0
    1dae:	8082                	ret

0000000000001db0 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1db0:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1db2:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1db6:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1db8:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1dbc:	2501                	sext.w	a0,a0
    1dbe:	8082                	ret

0000000000001dc0 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1dc0:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1dc2:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1dc6:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc8:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1dcc:	2501                	sext.w	a0,a0
    1dce:	8082                	ret

0000000000001dd0 <link>:

int link(char *old_path, char *new_path)
{
    1dd0:	87aa                	mv	a5,a0
    1dd2:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1dd4:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1dd8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ddc:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dde:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1de2:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1de4:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1de8:	2501                	sext.w	a0,a0
    1dea:	8082                	ret

0000000000001dec <unlink>:

int unlink(char *path)
{
    1dec:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dee:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1df2:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1df6:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df8:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1dfc:	2501                	sext.w	a0,a0
    1dfe:	8082                	ret

0000000000001e00 <uname>:
    register long a7 __asm__("a7") = n;
    1e00:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1e04:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1e08:	2501                	sext.w	a0,a0
    1e0a:	8082                	ret

0000000000001e0c <brk>:
    register long a7 __asm__("a7") = n;
    1e0c:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1e10:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1e14:	2501                	sext.w	a0,a0
    1e16:	8082                	ret

0000000000001e18 <getcwd>:
    register long a7 __asm__("a7") = n;
    1e18:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e1a:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e1e:	8082                	ret

0000000000001e20 <chdir>:
    register long a7 __asm__("a7") = n;
    1e20:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e24:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e2c:	862e                	mv	a2,a1
    1e2e:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e30:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e32:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e36:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e3a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e3c:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e3e:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e42:	2501                	sext.w	a0,a0
    1e44:	8082                	ret

0000000000001e46 <getdents>:
    register long a7 __asm__("a7") = n;
    1e46:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e4a:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e4e:	2501                	sext.w	a0,a0
    1e50:	8082                	ret

0000000000001e52 <pipe>:
    register long a7 __asm__("a7") = n;
    1e52:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e56:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e58:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e5c:	2501                	sext.w	a0,a0
    1e5e:	8082                	ret

0000000000001e60 <dup>:
    register long a7 __asm__("a7") = n;
    1e60:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e62:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e66:	2501                	sext.w	a0,a0
    1e68:	8082                	ret

0000000000001e6a <dup2>:
    register long a7 __asm__("a7") = n;
    1e6a:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e6c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e6e:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e72:	2501                	sext.w	a0,a0
    1e74:	8082                	ret

0000000000001e76 <mount>:
    register long a7 __asm__("a7") = n;
    1e76:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e7a:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e7e:	2501                	sext.w	a0,a0
    1e80:	8082                	ret

0000000000001e82 <umount>:
    register long a7 __asm__("a7") = n;
    1e82:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e86:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e88:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e8c:	2501                	sext.w	a0,a0
    1e8e:	8082                	ret

0000000000001e90 <__clone>:
.global __clone
.type  __clone, %function
# 函数指针 | 栈地址 | 标志位
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e90:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e92:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e94:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e96:	8532                	mv	a0,a2
	mv a2, a4
    1e98:	863a                	mv	a2,a4
	mv a3, a5
    1e9a:	86be                	mv	a3,a5
	mv a4, a6
    1e9c:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e9e:	0dc00893          	li	a7,220
	ecall
    1ea2:	00000073          	ecall

	beqz a0, 1f
    1ea6:	c111                	beqz	a0,1eaa <__clone+0x1a>
	# Parent
	ret
    1ea8:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1eaa:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1eac:	6522                	ld	a0,8(sp)
	jalr a1
    1eae:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1eb0:	05d00893          	li	a7,93
	ecall
    1eb4:	00000073          	ecall
