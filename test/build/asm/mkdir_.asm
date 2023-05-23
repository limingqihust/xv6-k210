
/home/lmq/lmq/cscc/xv6-k210/test/build/riscv64/mkdir_:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0f9                	j	10d0 <__start_main>

0000000000001004 <test_mkdir>:
#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

void test_mkdir(void){
    1004:	1141                	addi	sp,sp,-16
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	e9a50513          	addi	a0,a0,-358 # 1ea0 <__clone+0x2e>
void test_mkdir(void){
    100e:	e406                	sd	ra,8(sp)
    1010:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1012:	2bc000ef          	jal	ra,12ce <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	f4a50513          	addi	a0,a0,-182 # 1f60 <__func__.1166>
    101e:	2b0000ef          	jal	ra,12ce <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	e9650513          	addi	a0,a0,-362 # 1eb8 <__clone+0x46>
    102a:	2a4000ef          	jal	ra,12ce <puts>
    int rt, fd;

    rt = mkdir("test_mkdir", 0666);
    102e:	1b600593          	li	a1,438
    1032:	00001517          	auipc	a0,0x1
    1036:	e9650513          	addi	a0,a0,-362 # 1ec8 <__clone+0x56>
    103a:	5d5000ef          	jal	ra,1e0e <mkdir>
    printf("mkdir ret: %d\n", rt);
    103e:	85aa                	mv	a1,a0
    rt = mkdir("test_mkdir", 0666);
    1040:	842a                	mv	s0,a0
    printf("mkdir ret: %d\n", rt);
    1042:	00001517          	auipc	a0,0x1
    1046:	e9650513          	addi	a0,a0,-362 # 1ed8 <__clone+0x66>
    104a:	2a6000ef          	jal	ra,12f0 <printf>
    assert(rt != -1);
    104e:	57fd                	li	a5,-1
    1050:	06f40163          	beq	s0,a5,10b2 <test_mkdir+0xae>
    fd = open("test_mkdir", O_RDONLY | O_DIRECTORY);
    1054:	002005b7          	lui	a1,0x200
    1058:	00001517          	auipc	a0,0x1
    105c:	e7050513          	addi	a0,a0,-400 # 1ec8 <__clone+0x56>
    1060:	39d000ef          	jal	ra,1bfc <open>
    1064:	842a                	mv	s0,a0
    if(fd > 0){
    1066:	02a05f63          	blez	a0,10a4 <test_mkdir+0xa0>
        printf("  mkdir success.\n");
    106a:	00001517          	auipc	a0,0x1
    106e:	e9e50513          	addi	a0,a0,-354 # 1f08 <__clone+0x96>
    1072:	27e000ef          	jal	ra,12f0 <printf>
        close(fd);
    1076:	8522                	mv	a0,s0
    1078:	3ad000ef          	jal	ra,1c24 <close>
    }
    else printf("  mkdir error.\n");
    TEST_END(__func__);
    107c:	00001517          	auipc	a0,0x1
    1080:	eb450513          	addi	a0,a0,-332 # 1f30 <__clone+0xbe>
    1084:	24a000ef          	jal	ra,12ce <puts>
    1088:	00001517          	auipc	a0,0x1
    108c:	ed850513          	addi	a0,a0,-296 # 1f60 <__func__.1166>
    1090:	23e000ef          	jal	ra,12ce <puts>
}
    1094:	6402                	ld	s0,0(sp)
    1096:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    1098:	00001517          	auipc	a0,0x1
    109c:	e2050513          	addi	a0,a0,-480 # 1eb8 <__clone+0x46>
}
    10a0:	0141                	addi	sp,sp,16
    TEST_END(__func__);
    10a2:	a435                	j	12ce <puts>
    else printf("  mkdir error.\n");
    10a4:	00001517          	auipc	a0,0x1
    10a8:	e7c50513          	addi	a0,a0,-388 # 1f20 <__clone+0xae>
    10ac:	244000ef          	jal	ra,12f0 <printf>
    10b0:	b7f1                	j	107c <test_mkdir+0x78>
    assert(rt != -1);
    10b2:	00001517          	auipc	a0,0x1
    10b6:	e3650513          	addi	a0,a0,-458 # 1ee8 <__clone+0x76>
    10ba:	4be000ef          	jal	ra,1578 <panic>
    10be:	bf59                	j	1054 <test_mkdir+0x50>

00000000000010c0 <main>:

int main(void){
    10c0:	1141                	addi	sp,sp,-16
    10c2:	e406                	sd	ra,8(sp)
    test_mkdir();
    10c4:	f41ff0ef          	jal	ra,1004 <test_mkdir>
    return 0;
}
    10c8:	60a2                	ld	ra,8(sp)
    10ca:	4501                	li	a0,0
    10cc:	0141                	addi	sp,sp,16
    10ce:	8082                	ret

00000000000010d0 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10d0:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10d2:	4108                	lw	a0,0(a0)
{
    10d4:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10d6:	05a1                	addi	a1,a1,8
{
    10d8:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10da:	fe7ff0ef          	jal	ra,10c0 <main>
    10de:	3ad000ef          	jal	ra,1c8a <exit>
	return 0;
}
    10e2:	60a2                	ld	ra,8(sp)
    10e4:	4501                	li	a0,0
    10e6:	0141                	addi	sp,sp,16
    10e8:	8082                	ret

00000000000010ea <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10ea:	7179                	addi	sp,sp,-48
    10ec:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10ee:	12054b63          	bltz	a0,1224 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10f2:	02b577bb          	remuw	a5,a0,a1
    10f6:	00001697          	auipc	a3,0x1
    10fa:	e7a68693          	addi	a3,a3,-390 # 1f70 <digits>
    buf[16] = 0;
    10fe:	00010c23          	sb	zero,24(sp)
    i = 15;
    1102:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    1106:	1782                	slli	a5,a5,0x20
    1108:	9381                	srli	a5,a5,0x20
    110a:	97b6                	add	a5,a5,a3
    110c:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1110:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1114:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1118:	16b56263          	bltu	a0,a1,127c <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    111c:	02e8763b          	remuw	a2,a6,a4
    1120:	1602                	slli	a2,a2,0x20
    1122:	9201                	srli	a2,a2,0x20
    1124:	9636                	add	a2,a2,a3
    1126:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    112a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    112e:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1132:	12e86963          	bltu	a6,a4,1264 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    1136:	02e5f63b          	remuw	a2,a1,a4
    113a:	1602                	slli	a2,a2,0x20
    113c:	9201                	srli	a2,a2,0x20
    113e:	9636                	add	a2,a2,a3
    1140:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1144:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1148:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    114c:	10e5ef63          	bltu	a1,a4,126a <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    1150:	02e8763b          	remuw	a2,a6,a4
    1154:	1602                	slli	a2,a2,0x20
    1156:	9201                	srli	a2,a2,0x20
    1158:	9636                	add	a2,a2,a3
    115a:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115e:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1162:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1166:	10e86563          	bltu	a6,a4,1270 <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    116a:	02e5f63b          	remuw	a2,a1,a4
    116e:	1602                	slli	a2,a2,0x20
    1170:	9201                	srli	a2,a2,0x20
    1172:	9636                	add	a2,a2,a3
    1174:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1178:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    117c:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1180:	0ee5eb63          	bltu	a1,a4,1276 <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    1184:	02e8763b          	remuw	a2,a6,a4
    1188:	1602                	slli	a2,a2,0x20
    118a:	9201                	srli	a2,a2,0x20
    118c:	9636                	add	a2,a2,a3
    118e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1192:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1196:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    119a:	0ce86263          	bltu	a6,a4,125e <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    119e:	02e5f63b          	remuw	a2,a1,a4
    11a2:	1602                	slli	a2,a2,0x20
    11a4:	9201                	srli	a2,a2,0x20
    11a6:	9636                	add	a2,a2,a3
    11a8:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11ac:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11b0:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11b4:	0ce5e663          	bltu	a1,a4,1280 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    11b8:	02e8763b          	remuw	a2,a6,a4
    11bc:	1602                	slli	a2,a2,0x20
    11be:	9201                	srli	a2,a2,0x20
    11c0:	9636                	add	a2,a2,a3
    11c2:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c6:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11ca:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11ce:	0ae86c63          	bltu	a6,a4,1286 <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    11d2:	02e5f63b          	remuw	a2,a1,a4
    11d6:	1602                	slli	a2,a2,0x20
    11d8:	9201                	srli	a2,a2,0x20
    11da:	9636                	add	a2,a2,a3
    11dc:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11e0:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11e4:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11e8:	0ae5e263          	bltu	a1,a4,128c <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    11ec:	1782                	slli	a5,a5,0x20
    11ee:	9381                	srli	a5,a5,0x20
    11f0:	97b6                	add	a5,a5,a3
    11f2:	0007c703          	lbu	a4,0(a5)
    11f6:	4599                	li	a1,6
    11f8:	4795                	li	a5,5
    11fa:	00e10723          	sb	a4,14(sp)

    if (sign)
    11fe:	00055963          	bgez	a0,1210 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1202:	1018                	addi	a4,sp,32
    1204:	973e                	add	a4,a4,a5
    1206:	02d00693          	li	a3,45
    120a:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    120e:	85be                	mv	a1,a5
    write(f, s, l);
    1210:	003c                	addi	a5,sp,8
    1212:	4641                	li	a2,16
    1214:	9e0d                	subw	a2,a2,a1
    1216:	4505                	li	a0,1
    1218:	95be                	add	a1,a1,a5
    121a:	221000ef          	jal	ra,1c3a <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    121e:	70a2                	ld	ra,40(sp)
    1220:	6145                	addi	sp,sp,48
    1222:	8082                	ret
        x = -xx;
    1224:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1228:	02b677bb          	remuw	a5,a2,a1
    122c:	00001697          	auipc	a3,0x1
    1230:	d4468693          	addi	a3,a3,-700 # 1f70 <digits>
    buf[16] = 0;
    1234:	00010c23          	sb	zero,24(sp)
    i = 15;
    1238:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    123c:	1782                	slli	a5,a5,0x20
    123e:	9381                	srli	a5,a5,0x20
    1240:	97b6                	add	a5,a5,a3
    1242:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1246:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    124a:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    124e:	ecb677e3          	bgeu	a2,a1,111c <printint.constprop.0+0x32>
        buf[i--] = '-';
    1252:	02d00793          	li	a5,45
    1256:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    125a:	45b9                	li	a1,14
    125c:	bf55                	j	1210 <printint.constprop.0+0x126>
    125e:	47a5                	li	a5,9
    1260:	45a9                	li	a1,10
    1262:	bf71                	j	11fe <printint.constprop.0+0x114>
    1264:	47b5                	li	a5,13
    1266:	45b9                	li	a1,14
    1268:	bf59                	j	11fe <printint.constprop.0+0x114>
    126a:	47b1                	li	a5,12
    126c:	45b5                	li	a1,13
    126e:	bf41                	j	11fe <printint.constprop.0+0x114>
    1270:	47ad                	li	a5,11
    1272:	45b1                	li	a1,12
    1274:	b769                	j	11fe <printint.constprop.0+0x114>
    1276:	47a9                	li	a5,10
    1278:	45ad                	li	a1,11
    127a:	b751                	j	11fe <printint.constprop.0+0x114>
    i = 15;
    127c:	45bd                	li	a1,15
    127e:	bf49                	j	1210 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1280:	47a1                	li	a5,8
    1282:	45a5                	li	a1,9
    1284:	bfad                	j	11fe <printint.constprop.0+0x114>
    1286:	479d                	li	a5,7
    1288:	45a1                	li	a1,8
    128a:	bf95                	j	11fe <printint.constprop.0+0x114>
    128c:	4799                	li	a5,6
    128e:	459d                	li	a1,7
    1290:	b7bd                	j	11fe <printint.constprop.0+0x114>

0000000000001292 <getchar>:
{
    1292:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1294:	00f10593          	addi	a1,sp,15
    1298:	4605                	li	a2,1
    129a:	4501                	li	a0,0
{
    129c:	ec06                	sd	ra,24(sp)
    char byte = 0;
    129e:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12a2:	18f000ef          	jal	ra,1c30 <read>
}
    12a6:	60e2                	ld	ra,24(sp)
    12a8:	00f14503          	lbu	a0,15(sp)
    12ac:	6105                	addi	sp,sp,32
    12ae:	8082                	ret

00000000000012b0 <putchar>:
{
    12b0:	1101                	addi	sp,sp,-32
    12b2:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12b4:	00f10593          	addi	a1,sp,15
    12b8:	4605                	li	a2,1
    12ba:	4505                	li	a0,1
{
    12bc:	ec06                	sd	ra,24(sp)
    char byte = c;
    12be:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12c2:	179000ef          	jal	ra,1c3a <write>
}
    12c6:	60e2                	ld	ra,24(sp)
    12c8:	2501                	sext.w	a0,a0
    12ca:	6105                	addi	sp,sp,32
    12cc:	8082                	ret

00000000000012ce <puts>:
{
    12ce:	1141                	addi	sp,sp,-16
    12d0:	e406                	sd	ra,8(sp)
    12d2:	e022                	sd	s0,0(sp)
    12d4:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12d6:	580000ef          	jal	ra,1856 <strlen>
    12da:	862a                	mv	a2,a0
    12dc:	85a2                	mv	a1,s0
    12de:	4505                	li	a0,1
    12e0:	15b000ef          	jal	ra,1c3a <write>
}
    12e4:	60a2                	ld	ra,8(sp)
    12e6:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12e8:	957d                	srai	a0,a0,0x3f
    return r;
    12ea:	2501                	sext.w	a0,a0
}
    12ec:	0141                	addi	sp,sp,16
    12ee:	8082                	ret

00000000000012f0 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12f0:	7171                	addi	sp,sp,-176
    12f2:	fc56                	sd	s5,56(sp)
    12f4:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    12f6:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12f8:	18bc                	addi	a5,sp,120
{
    12fa:	e8ca                	sd	s2,80(sp)
    12fc:	e4ce                	sd	s3,72(sp)
    12fe:	e0d2                	sd	s4,64(sp)
    1300:	f85a                	sd	s6,48(sp)
    1302:	f486                	sd	ra,104(sp)
    1304:	f0a2                	sd	s0,96(sp)
    1306:	eca6                	sd	s1,88(sp)
    1308:	fcae                	sd	a1,120(sp)
    130a:	e132                	sd	a2,128(sp)
    130c:	e536                	sd	a3,136(sp)
    130e:	e93a                	sd	a4,144(sp)
    1310:	f142                	sd	a6,160(sp)
    1312:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1314:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1316:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    131a:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    131e:	00001b17          	auipc	s6,0x1
    1322:	c22b0b13          	addi	s6,s6,-990 # 1f40 <__clone+0xce>
    buf[i++] = '0';
    1326:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    132a:	00001997          	auipc	s3,0x1
    132e:	c4698993          	addi	s3,s3,-954 # 1f70 <digits>
        if (!*s)
    1332:	00054783          	lbu	a5,0(a0)
    1336:	16078a63          	beqz	a5,14aa <printf+0x1ba>
    133a:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    133c:	19278163          	beq	a5,s2,14be <printf+0x1ce>
    1340:	00164783          	lbu	a5,1(a2)
    1344:	0605                	addi	a2,a2,1
    1346:	fbfd                	bnez	a5,133c <printf+0x4c>
    1348:	84b2                	mv	s1,a2
        l = z - a;
    134a:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    134e:	85aa                	mv	a1,a0
    1350:	8622                	mv	a2,s0
    1352:	4505                	li	a0,1
    1354:	0e7000ef          	jal	ra,1c3a <write>
        if (l)
    1358:	18041c63          	bnez	s0,14f0 <printf+0x200>
        if (s[1] == 0)
    135c:	0014c783          	lbu	a5,1(s1)
    1360:	14078563          	beqz	a5,14aa <printf+0x1ba>
        switch (s[1])
    1364:	1d478063          	beq	a5,s4,1524 <printf+0x234>
    1368:	18fa6663          	bltu	s4,a5,14f4 <printf+0x204>
    136c:	06400713          	li	a4,100
    1370:	1ae78063          	beq	a5,a4,1510 <printf+0x220>
    1374:	07000713          	li	a4,112
    1378:	1ce79963          	bne	a5,a4,154a <printf+0x25a>
            printptr(va_arg(ap, uint64));
    137c:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    137e:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1382:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1384:	631c                	ld	a5,0(a4)
    1386:	0721                	addi	a4,a4,8
    1388:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    138a:	00479293          	slli	t0,a5,0x4
    138e:	00879f93          	slli	t6,a5,0x8
    1392:	00c79f13          	slli	t5,a5,0xc
    1396:	01079e93          	slli	t4,a5,0x10
    139a:	01479e13          	slli	t3,a5,0x14
    139e:	01879313          	slli	t1,a5,0x18
    13a2:	01c79893          	slli	a7,a5,0x1c
    13a6:	02479813          	slli	a6,a5,0x24
    13aa:	02879513          	slli	a0,a5,0x28
    13ae:	02c79593          	slli	a1,a5,0x2c
    13b2:	03079693          	slli	a3,a5,0x30
    13b6:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13ba:	03c7d413          	srli	s0,a5,0x3c
    13be:	01c7d39b          	srliw	t2,a5,0x1c
    13c2:	03c2d293          	srli	t0,t0,0x3c
    13c6:	03cfdf93          	srli	t6,t6,0x3c
    13ca:	03cf5f13          	srli	t5,t5,0x3c
    13ce:	03cede93          	srli	t4,t4,0x3c
    13d2:	03ce5e13          	srli	t3,t3,0x3c
    13d6:	03c35313          	srli	t1,t1,0x3c
    13da:	03c8d893          	srli	a7,a7,0x3c
    13de:	03c85813          	srli	a6,a6,0x3c
    13e2:	9171                	srli	a0,a0,0x3c
    13e4:	91f1                	srli	a1,a1,0x3c
    13e6:	92f1                	srli	a3,a3,0x3c
    13e8:	9371                	srli	a4,a4,0x3c
    13ea:	96ce                	add	a3,a3,s3
    13ec:	974e                	add	a4,a4,s3
    13ee:	944e                	add	s0,s0,s3
    13f0:	92ce                	add	t0,t0,s3
    13f2:	9fce                	add	t6,t6,s3
    13f4:	9f4e                	add	t5,t5,s3
    13f6:	9ece                	add	t4,t4,s3
    13f8:	9e4e                	add	t3,t3,s3
    13fa:	934e                	add	t1,t1,s3
    13fc:	98ce                	add	a7,a7,s3
    13fe:	93ce                	add	t2,t2,s3
    1400:	984e                	add	a6,a6,s3
    1402:	954e                	add	a0,a0,s3
    1404:	95ce                	add	a1,a1,s3
    1406:	0006c083          	lbu	ra,0(a3)
    140a:	0002c283          	lbu	t0,0(t0)
    140e:	00074683          	lbu	a3,0(a4)
    1412:	000fcf83          	lbu	t6,0(t6)
    1416:	000f4f03          	lbu	t5,0(t5)
    141a:	000ece83          	lbu	t4,0(t4)
    141e:	000e4e03          	lbu	t3,0(t3)
    1422:	00034303          	lbu	t1,0(t1)
    1426:	0008c883          	lbu	a7,0(a7)
    142a:	0003c383          	lbu	t2,0(t2)
    142e:	00084803          	lbu	a6,0(a6)
    1432:	00054503          	lbu	a0,0(a0)
    1436:	0005c583          	lbu	a1,0(a1) # 200000 <digits+0x1fe090>
    143a:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    143e:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1442:	9371                	srli	a4,a4,0x3c
    1444:	8bbd                	andi	a5,a5,15
    1446:	974e                	add	a4,a4,s3
    1448:	97ce                	add	a5,a5,s3
    144a:	005105a3          	sb	t0,11(sp)
    144e:	01f10623          	sb	t6,12(sp)
    1452:	01e106a3          	sb	t5,13(sp)
    1456:	01d10723          	sb	t4,14(sp)
    145a:	01c107a3          	sb	t3,15(sp)
    145e:	00610823          	sb	t1,16(sp)
    1462:	011108a3          	sb	a7,17(sp)
    1466:	00710923          	sb	t2,18(sp)
    146a:	010109a3          	sb	a6,19(sp)
    146e:	00a10a23          	sb	a0,20(sp)
    1472:	00b10aa3          	sb	a1,21(sp)
    1476:	00110b23          	sb	ra,22(sp)
    147a:	00d10ba3          	sb	a3,23(sp)
    147e:	00810523          	sb	s0,10(sp)
    1482:	00074703          	lbu	a4,0(a4)
    1486:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    148a:	002c                	addi	a1,sp,8
    148c:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    148e:	00e10c23          	sb	a4,24(sp)
    1492:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1496:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    149a:	7a0000ef          	jal	ra,1c3a <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    149e:	00248513          	addi	a0,s1,2
        if (!*s)
    14a2:	00054783          	lbu	a5,0(a0)
    14a6:	e8079ae3          	bnez	a5,133a <printf+0x4a>
    }
    va_end(ap);
}
    14aa:	70a6                	ld	ra,104(sp)
    14ac:	7406                	ld	s0,96(sp)
    14ae:	64e6                	ld	s1,88(sp)
    14b0:	6946                	ld	s2,80(sp)
    14b2:	69a6                	ld	s3,72(sp)
    14b4:	6a06                	ld	s4,64(sp)
    14b6:	7ae2                	ld	s5,56(sp)
    14b8:	7b42                	ld	s6,48(sp)
    14ba:	614d                	addi	sp,sp,176
    14bc:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14be:	00064783          	lbu	a5,0(a2)
    14c2:	84b2                	mv	s1,a2
    14c4:	01278963          	beq	a5,s2,14d6 <printf+0x1e6>
    14c8:	b549                	j	134a <printf+0x5a>
    14ca:	0024c783          	lbu	a5,2(s1)
    14ce:	0605                	addi	a2,a2,1
    14d0:	0489                	addi	s1,s1,2
    14d2:	e7279ce3          	bne	a5,s2,134a <printf+0x5a>
    14d6:	0014c783          	lbu	a5,1(s1)
    14da:	ff2788e3          	beq	a5,s2,14ca <printf+0x1da>
        l = z - a;
    14de:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14e2:	85aa                	mv	a1,a0
    14e4:	8622                	mv	a2,s0
    14e6:	4505                	li	a0,1
    14e8:	752000ef          	jal	ra,1c3a <write>
        if (l)
    14ec:	e60408e3          	beqz	s0,135c <printf+0x6c>
    14f0:	8526                	mv	a0,s1
    14f2:	b581                	j	1332 <printf+0x42>
        switch (s[1])
    14f4:	07800713          	li	a4,120
    14f8:	04e79963          	bne	a5,a4,154a <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    14fc:	6782                	ld	a5,0(sp)
    14fe:	45c1                	li	a1,16
    1500:	4388                	lw	a0,0(a5)
    1502:	07a1                	addi	a5,a5,8
    1504:	e03e                	sd	a5,0(sp)
    1506:	be5ff0ef          	jal	ra,10ea <printint.constprop.0>
        s += 2;
    150a:	00248513          	addi	a0,s1,2
    150e:	bf51                	j	14a2 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    1510:	6782                	ld	a5,0(sp)
    1512:	45a9                	li	a1,10
    1514:	4388                	lw	a0,0(a5)
    1516:	07a1                	addi	a5,a5,8
    1518:	e03e                	sd	a5,0(sp)
    151a:	bd1ff0ef          	jal	ra,10ea <printint.constprop.0>
        s += 2;
    151e:	00248513          	addi	a0,s1,2
    1522:	b741                	j	14a2 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1524:	6782                	ld	a5,0(sp)
    1526:	6380                	ld	s0,0(a5)
    1528:	07a1                	addi	a5,a5,8
    152a:	e03e                	sd	a5,0(sp)
    152c:	c421                	beqz	s0,1574 <printf+0x284>
            l = strnlen(a, 200);
    152e:	0c800593          	li	a1,200
    1532:	8522                	mv	a0,s0
    1534:	40e000ef          	jal	ra,1942 <strnlen>
    write(f, s, l);
    1538:	0005061b          	sext.w	a2,a0
    153c:	85a2                	mv	a1,s0
    153e:	4505                	li	a0,1
    1540:	6fa000ef          	jal	ra,1c3a <write>
        s += 2;
    1544:	00248513          	addi	a0,s1,2
    1548:	bfa9                	j	14a2 <printf+0x1b2>
    char byte = c;
    154a:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    154e:	4605                	li	a2,1
    1550:	002c                	addi	a1,sp,8
    1552:	4505                	li	a0,1
    char byte = c;
    1554:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1558:	6e2000ef          	jal	ra,1c3a <write>
    char byte = c;
    155c:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1560:	4605                	li	a2,1
    1562:	002c                	addi	a1,sp,8
    1564:	4505                	li	a0,1
    char byte = c;
    1566:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    156a:	6d0000ef          	jal	ra,1c3a <write>
        s += 2;
    156e:	00248513          	addi	a0,s1,2
    1572:	bf05                	j	14a2 <printf+0x1b2>
                a = "(null)";
    1574:	845a                	mv	s0,s6
    1576:	bf65                	j	152e <printf+0x23e>

0000000000001578 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1578:	1141                	addi	sp,sp,-16
    157a:	e406                	sd	ra,8(sp)
    puts(m);
    157c:	d53ff0ef          	jal	ra,12ce <puts>
    exit(-100);
}
    1580:	60a2                	ld	ra,8(sp)
    exit(-100);
    1582:	f9c00513          	li	a0,-100
}
    1586:	0141                	addi	sp,sp,16
    exit(-100);
    1588:	a709                	j	1c8a <exit>

000000000000158a <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    158a:	02000793          	li	a5,32
    158e:	00f50663          	beq	a0,a5,159a <isspace+0x10>
    1592:	355d                	addiw	a0,a0,-9
    1594:	00553513          	sltiu	a0,a0,5
    1598:	8082                	ret
    159a:	4505                	li	a0,1
}
    159c:	8082                	ret

000000000000159e <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    159e:	fd05051b          	addiw	a0,a0,-48
}
    15a2:	00a53513          	sltiu	a0,a0,10
    15a6:	8082                	ret

00000000000015a8 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a8:	02000613          	li	a2,32
    15ac:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15ae:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b2:	ff77069b          	addiw	a3,a4,-9
    15b6:	04c70d63          	beq	a4,a2,1610 <atoi+0x68>
    15ba:	0007079b          	sext.w	a5,a4
    15be:	04d5f963          	bgeu	a1,a3,1610 <atoi+0x68>
        s++;
    switch (*s)
    15c2:	02b00693          	li	a3,43
    15c6:	04d70a63          	beq	a4,a3,161a <atoi+0x72>
    15ca:	02d00693          	li	a3,45
    15ce:	06d70463          	beq	a4,a3,1636 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15d2:	fd07859b          	addiw	a1,a5,-48
    15d6:	4625                	li	a2,9
    15d8:	873e                	mv	a4,a5
    15da:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15dc:	4e01                	li	t3,0
    while (isdigit(*s))
    15de:	04b66a63          	bltu	a2,a1,1632 <atoi+0x8a>
    int n = 0, neg = 0;
    15e2:	4501                	li	a0,0
    while (isdigit(*s))
    15e4:	4825                	li	a6,9
    15e6:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    15ea:	0025179b          	slliw	a5,a0,0x2
    15ee:	9d3d                	addw	a0,a0,a5
    15f0:	fd07031b          	addiw	t1,a4,-48
    15f4:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15f8:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15fc:	0685                	addi	a3,a3,1
    15fe:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1602:	0006071b          	sext.w	a4,a2
    1606:	feb870e3          	bgeu	a6,a1,15e6 <atoi+0x3e>
    return neg ? n : -n;
    160a:	000e0563          	beqz	t3,1614 <atoi+0x6c>
}
    160e:	8082                	ret
        s++;
    1610:	0505                	addi	a0,a0,1
    1612:	bf71                	j	15ae <atoi+0x6>
    1614:	4113053b          	subw	a0,t1,a7
    1618:	8082                	ret
    while (isdigit(*s))
    161a:	00154783          	lbu	a5,1(a0)
    161e:	4625                	li	a2,9
        s++;
    1620:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1624:	fd07859b          	addiw	a1,a5,-48
    1628:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    162c:	4e01                	li	t3,0
    while (isdigit(*s))
    162e:	fab67ae3          	bgeu	a2,a1,15e2 <atoi+0x3a>
    1632:	4501                	li	a0,0
}
    1634:	8082                	ret
    while (isdigit(*s))
    1636:	00154783          	lbu	a5,1(a0)
    163a:	4625                	li	a2,9
        s++;
    163c:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1640:	fd07859b          	addiw	a1,a5,-48
    1644:	0007871b          	sext.w	a4,a5
    1648:	feb665e3          	bltu	a2,a1,1632 <atoi+0x8a>
        neg = 1;
    164c:	4e05                	li	t3,1
    164e:	bf51                	j	15e2 <atoi+0x3a>

0000000000001650 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1650:	16060d63          	beqz	a2,17ca <memset+0x17a>
    1654:	40a007b3          	neg	a5,a0
    1658:	8b9d                	andi	a5,a5,7
    165a:	00778713          	addi	a4,a5,7
    165e:	482d                	li	a6,11
    1660:	0ff5f593          	andi	a1,a1,255
    1664:	fff60693          	addi	a3,a2,-1
    1668:	17076263          	bltu	a4,a6,17cc <memset+0x17c>
    166c:	16e6ea63          	bltu	a3,a4,17e0 <memset+0x190>
    1670:	16078563          	beqz	a5,17da <memset+0x18a>
    1674:	00b50023          	sb	a1,0(a0)
    1678:	4705                	li	a4,1
    167a:	00150e93          	addi	t4,a0,1
    167e:	14e78c63          	beq	a5,a4,17d6 <memset+0x186>
    1682:	00b500a3          	sb	a1,1(a0)
    1686:	4709                	li	a4,2
    1688:	00250e93          	addi	t4,a0,2
    168c:	14e78d63          	beq	a5,a4,17e6 <memset+0x196>
    1690:	00b50123          	sb	a1,2(a0)
    1694:	470d                	li	a4,3
    1696:	00350e93          	addi	t4,a0,3
    169a:	12e78b63          	beq	a5,a4,17d0 <memset+0x180>
    169e:	00b501a3          	sb	a1,3(a0)
    16a2:	4711                	li	a4,4
    16a4:	00450e93          	addi	t4,a0,4
    16a8:	14e78163          	beq	a5,a4,17ea <memset+0x19a>
    16ac:	00b50223          	sb	a1,4(a0)
    16b0:	4715                	li	a4,5
    16b2:	00550e93          	addi	t4,a0,5
    16b6:	12e78c63          	beq	a5,a4,17ee <memset+0x19e>
    16ba:	00b502a3          	sb	a1,5(a0)
    16be:	471d                	li	a4,7
    16c0:	00650e93          	addi	t4,a0,6
    16c4:	12e79763          	bne	a5,a4,17f2 <memset+0x1a2>
    16c8:	00750e93          	addi	t4,a0,7
    16cc:	00b50323          	sb	a1,6(a0)
    16d0:	4f1d                	li	t5,7
    16d2:	00859713          	slli	a4,a1,0x8
    16d6:	8f4d                	or	a4,a4,a1
    16d8:	01059e13          	slli	t3,a1,0x10
    16dc:	01c76e33          	or	t3,a4,t3
    16e0:	01859313          	slli	t1,a1,0x18
    16e4:	006e6333          	or	t1,t3,t1
    16e8:	02059893          	slli	a7,a1,0x20
    16ec:	011368b3          	or	a7,t1,a7
    16f0:	02859813          	slli	a6,a1,0x28
    16f4:	40f60333          	sub	t1,a2,a5
    16f8:	0108e833          	or	a6,a7,a6
    16fc:	03059693          	slli	a3,a1,0x30
    1700:	00d866b3          	or	a3,a6,a3
    1704:	03859713          	slli	a4,a1,0x38
    1708:	97aa                	add	a5,a5,a0
    170a:	ff837813          	andi	a6,t1,-8
    170e:	8f55                	or	a4,a4,a3
    1710:	00f806b3          	add	a3,a6,a5
    1714:	e398                	sd	a4,0(a5)
    1716:	07a1                	addi	a5,a5,8
    1718:	fed79ee3          	bne	a5,a3,1714 <memset+0xc4>
    171c:	ff837693          	andi	a3,t1,-8
    1720:	00de87b3          	add	a5,t4,a3
    1724:	01e6873b          	addw	a4,a3,t5
    1728:	0ad30663          	beq	t1,a3,17d4 <memset+0x184>
    172c:	00b78023          	sb	a1,0(a5)
    1730:	0017069b          	addiw	a3,a4,1
    1734:	08c6fb63          	bgeu	a3,a2,17ca <memset+0x17a>
    1738:	00b780a3          	sb	a1,1(a5)
    173c:	0027069b          	addiw	a3,a4,2
    1740:	08c6f563          	bgeu	a3,a2,17ca <memset+0x17a>
    1744:	00b78123          	sb	a1,2(a5)
    1748:	0037069b          	addiw	a3,a4,3
    174c:	06c6ff63          	bgeu	a3,a2,17ca <memset+0x17a>
    1750:	00b781a3          	sb	a1,3(a5)
    1754:	0047069b          	addiw	a3,a4,4
    1758:	06c6f963          	bgeu	a3,a2,17ca <memset+0x17a>
    175c:	00b78223          	sb	a1,4(a5)
    1760:	0057069b          	addiw	a3,a4,5
    1764:	06c6f363          	bgeu	a3,a2,17ca <memset+0x17a>
    1768:	00b782a3          	sb	a1,5(a5)
    176c:	0067069b          	addiw	a3,a4,6
    1770:	04c6fd63          	bgeu	a3,a2,17ca <memset+0x17a>
    1774:	00b78323          	sb	a1,6(a5)
    1778:	0077069b          	addiw	a3,a4,7
    177c:	04c6f763          	bgeu	a3,a2,17ca <memset+0x17a>
    1780:	00b783a3          	sb	a1,7(a5)
    1784:	0087069b          	addiw	a3,a4,8
    1788:	04c6f163          	bgeu	a3,a2,17ca <memset+0x17a>
    178c:	00b78423          	sb	a1,8(a5)
    1790:	0097069b          	addiw	a3,a4,9
    1794:	02c6fb63          	bgeu	a3,a2,17ca <memset+0x17a>
    1798:	00b784a3          	sb	a1,9(a5)
    179c:	00a7069b          	addiw	a3,a4,10
    17a0:	02c6f563          	bgeu	a3,a2,17ca <memset+0x17a>
    17a4:	00b78523          	sb	a1,10(a5)
    17a8:	00b7069b          	addiw	a3,a4,11
    17ac:	00c6ff63          	bgeu	a3,a2,17ca <memset+0x17a>
    17b0:	00b785a3          	sb	a1,11(a5)
    17b4:	00c7069b          	addiw	a3,a4,12
    17b8:	00c6f963          	bgeu	a3,a2,17ca <memset+0x17a>
    17bc:	00b78623          	sb	a1,12(a5)
    17c0:	2735                	addiw	a4,a4,13
    17c2:	00c77463          	bgeu	a4,a2,17ca <memset+0x17a>
    17c6:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17ca:	8082                	ret
    17cc:	472d                	li	a4,11
    17ce:	bd79                	j	166c <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17d0:	4f0d                	li	t5,3
    17d2:	b701                	j	16d2 <memset+0x82>
    17d4:	8082                	ret
    17d6:	4f05                	li	t5,1
    17d8:	bded                	j	16d2 <memset+0x82>
    17da:	8eaa                	mv	t4,a0
    17dc:	4f01                	li	t5,0
    17de:	bdd5                	j	16d2 <memset+0x82>
    17e0:	87aa                	mv	a5,a0
    17e2:	4701                	li	a4,0
    17e4:	b7a1                	j	172c <memset+0xdc>
    17e6:	4f09                	li	t5,2
    17e8:	b5ed                	j	16d2 <memset+0x82>
    17ea:	4f11                	li	t5,4
    17ec:	b5dd                	j	16d2 <memset+0x82>
    17ee:	4f15                	li	t5,5
    17f0:	b5cd                	j	16d2 <memset+0x82>
    17f2:	4f19                	li	t5,6
    17f4:	bdf9                	j	16d2 <memset+0x82>

00000000000017f6 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17f6:	00054783          	lbu	a5,0(a0)
    17fa:	0005c703          	lbu	a4,0(a1)
    17fe:	00e79863          	bne	a5,a4,180e <strcmp+0x18>
    1802:	0505                	addi	a0,a0,1
    1804:	0585                	addi	a1,a1,1
    1806:	fbe5                	bnez	a5,17f6 <strcmp>
    1808:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    180a:	9d19                	subw	a0,a0,a4
    180c:	8082                	ret
    180e:	0007851b          	sext.w	a0,a5
    1812:	bfe5                	j	180a <strcmp+0x14>

0000000000001814 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1814:	ce05                	beqz	a2,184c <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1816:	00054703          	lbu	a4,0(a0)
    181a:	0005c783          	lbu	a5,0(a1)
    181e:	cb0d                	beqz	a4,1850 <strncmp+0x3c>
    if (!n--)
    1820:	167d                	addi	a2,a2,-1
    1822:	00c506b3          	add	a3,a0,a2
    1826:	a819                	j	183c <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1828:	00a68e63          	beq	a3,a0,1844 <strncmp+0x30>
    182c:	0505                	addi	a0,a0,1
    182e:	00e79b63          	bne	a5,a4,1844 <strncmp+0x30>
    1832:	00054703          	lbu	a4,0(a0)
    1836:	0005c783          	lbu	a5,0(a1)
    183a:	cb19                	beqz	a4,1850 <strncmp+0x3c>
    183c:	0005c783          	lbu	a5,0(a1)
    1840:	0585                	addi	a1,a1,1
    1842:	f3fd                	bnez	a5,1828 <strncmp+0x14>
        ;
    return *l - *r;
    1844:	0007051b          	sext.w	a0,a4
    1848:	9d1d                	subw	a0,a0,a5
    184a:	8082                	ret
        return 0;
    184c:	4501                	li	a0,0
}
    184e:	8082                	ret
    1850:	4501                	li	a0,0
    return *l - *r;
    1852:	9d1d                	subw	a0,a0,a5
    1854:	8082                	ret

0000000000001856 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1856:	00757793          	andi	a5,a0,7
    185a:	cf89                	beqz	a5,1874 <strlen+0x1e>
    185c:	87aa                	mv	a5,a0
    185e:	a029                	j	1868 <strlen+0x12>
    1860:	0785                	addi	a5,a5,1
    1862:	0077f713          	andi	a4,a5,7
    1866:	cb01                	beqz	a4,1876 <strlen+0x20>
        if (!*s)
    1868:	0007c703          	lbu	a4,0(a5)
    186c:	fb75                	bnez	a4,1860 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    186e:	40a78533          	sub	a0,a5,a0
}
    1872:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1874:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1876:	6394                	ld	a3,0(a5)
    1878:	00000597          	auipc	a1,0x0
    187c:	6d05b583          	ld	a1,1744(a1) # 1f48 <__clone+0xd6>
    1880:	00000617          	auipc	a2,0x0
    1884:	6d063603          	ld	a2,1744(a2) # 1f50 <__clone+0xde>
    1888:	a019                	j	188e <strlen+0x38>
    188a:	6794                	ld	a3,8(a5)
    188c:	07a1                	addi	a5,a5,8
    188e:	00b68733          	add	a4,a3,a1
    1892:	fff6c693          	not	a3,a3
    1896:	8f75                	and	a4,a4,a3
    1898:	8f71                	and	a4,a4,a2
    189a:	db65                	beqz	a4,188a <strlen+0x34>
    for (; *s; s++)
    189c:	0007c703          	lbu	a4,0(a5)
    18a0:	d779                	beqz	a4,186e <strlen+0x18>
    18a2:	0017c703          	lbu	a4,1(a5)
    18a6:	0785                	addi	a5,a5,1
    18a8:	d379                	beqz	a4,186e <strlen+0x18>
    18aa:	0017c703          	lbu	a4,1(a5)
    18ae:	0785                	addi	a5,a5,1
    18b0:	fb6d                	bnez	a4,18a2 <strlen+0x4c>
    18b2:	bf75                	j	186e <strlen+0x18>

00000000000018b4 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18b4:	00757713          	andi	a4,a0,7
{
    18b8:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18ba:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18be:	cb19                	beqz	a4,18d4 <memchr+0x20>
    18c0:	ce25                	beqz	a2,1938 <memchr+0x84>
    18c2:	0007c703          	lbu	a4,0(a5)
    18c6:	04b70e63          	beq	a4,a1,1922 <memchr+0x6e>
    18ca:	0785                	addi	a5,a5,1
    18cc:	0077f713          	andi	a4,a5,7
    18d0:	167d                	addi	a2,a2,-1
    18d2:	f77d                	bnez	a4,18c0 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18d4:	4501                	li	a0,0
    if (n && *s != c)
    18d6:	c235                	beqz	a2,193a <memchr+0x86>
    18d8:	0007c703          	lbu	a4,0(a5)
    18dc:	04b70363          	beq	a4,a1,1922 <memchr+0x6e>
        size_t k = ONES * c;
    18e0:	00000517          	auipc	a0,0x0
    18e4:	67853503          	ld	a0,1656(a0) # 1f58 <__clone+0xe6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18e8:	471d                	li	a4,7
        size_t k = ONES * c;
    18ea:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18ee:	02c77a63          	bgeu	a4,a2,1922 <memchr+0x6e>
    18f2:	00000897          	auipc	a7,0x0
    18f6:	6568b883          	ld	a7,1622(a7) # 1f48 <__clone+0xd6>
    18fa:	00000817          	auipc	a6,0x0
    18fe:	65683803          	ld	a6,1622(a6) # 1f50 <__clone+0xde>
    1902:	431d                	li	t1,7
    1904:	a029                	j	190e <memchr+0x5a>
    1906:	1661                	addi	a2,a2,-8
    1908:	07a1                	addi	a5,a5,8
    190a:	02c37963          	bgeu	t1,a2,193c <memchr+0x88>
    190e:	6398                	ld	a4,0(a5)
    1910:	8f29                	xor	a4,a4,a0
    1912:	011706b3          	add	a3,a4,a7
    1916:	fff74713          	not	a4,a4
    191a:	8f75                	and	a4,a4,a3
    191c:	01077733          	and	a4,a4,a6
    1920:	d37d                	beqz	a4,1906 <memchr+0x52>
    1922:	853e                	mv	a0,a5
    1924:	97b2                	add	a5,a5,a2
    1926:	a021                	j	192e <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1928:	0505                	addi	a0,a0,1
    192a:	00f50763          	beq	a0,a5,1938 <memchr+0x84>
    192e:	00054703          	lbu	a4,0(a0)
    1932:	feb71be3          	bne	a4,a1,1928 <memchr+0x74>
    1936:	8082                	ret
    return n ? (void *)s : 0;
    1938:	4501                	li	a0,0
}
    193a:	8082                	ret
    return n ? (void *)s : 0;
    193c:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    193e:	f275                	bnez	a2,1922 <memchr+0x6e>
}
    1940:	8082                	ret

0000000000001942 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1942:	1101                	addi	sp,sp,-32
    1944:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1946:	862e                	mv	a2,a1
{
    1948:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    194a:	4581                	li	a1,0
{
    194c:	e426                	sd	s1,8(sp)
    194e:	ec06                	sd	ra,24(sp)
    1950:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1952:	f63ff0ef          	jal	ra,18b4 <memchr>
    return p ? p - s : n;
    1956:	c519                	beqz	a0,1964 <strnlen+0x22>
}
    1958:	60e2                	ld	ra,24(sp)
    195a:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    195c:	8d05                	sub	a0,a0,s1
}
    195e:	64a2                	ld	s1,8(sp)
    1960:	6105                	addi	sp,sp,32
    1962:	8082                	ret
    1964:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1966:	8522                	mv	a0,s0
}
    1968:	6442                	ld	s0,16(sp)
    196a:	64a2                	ld	s1,8(sp)
    196c:	6105                	addi	sp,sp,32
    196e:	8082                	ret

0000000000001970 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1970:	00b547b3          	xor	a5,a0,a1
    1974:	8b9d                	andi	a5,a5,7
    1976:	eb95                	bnez	a5,19aa <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1978:	0075f793          	andi	a5,a1,7
    197c:	e7b1                	bnez	a5,19c8 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    197e:	6198                	ld	a4,0(a1)
    1980:	00000617          	auipc	a2,0x0
    1984:	5c863603          	ld	a2,1480(a2) # 1f48 <__clone+0xd6>
    1988:	00000817          	auipc	a6,0x0
    198c:	5c883803          	ld	a6,1480(a6) # 1f50 <__clone+0xde>
    1990:	a029                	j	199a <strcpy+0x2a>
    1992:	e118                	sd	a4,0(a0)
    1994:	6598                	ld	a4,8(a1)
    1996:	05a1                	addi	a1,a1,8
    1998:	0521                	addi	a0,a0,8
    199a:	00c707b3          	add	a5,a4,a2
    199e:	fff74693          	not	a3,a4
    19a2:	8ff5                	and	a5,a5,a3
    19a4:	0107f7b3          	and	a5,a5,a6
    19a8:	d7ed                	beqz	a5,1992 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19aa:	0005c783          	lbu	a5,0(a1)
    19ae:	00f50023          	sb	a5,0(a0)
    19b2:	c785                	beqz	a5,19da <strcpy+0x6a>
    19b4:	0015c783          	lbu	a5,1(a1)
    19b8:	0505                	addi	a0,a0,1
    19ba:	0585                	addi	a1,a1,1
    19bc:	00f50023          	sb	a5,0(a0)
    19c0:	fbf5                	bnez	a5,19b4 <strcpy+0x44>
        ;
    return d;
}
    19c2:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19c4:	0505                	addi	a0,a0,1
    19c6:	df45                	beqz	a4,197e <strcpy+0xe>
            if (!(*d = *s))
    19c8:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19cc:	0585                	addi	a1,a1,1
    19ce:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    19d2:	00f50023          	sb	a5,0(a0)
    19d6:	f7fd                	bnez	a5,19c4 <strcpy+0x54>
}
    19d8:	8082                	ret
    19da:	8082                	ret

00000000000019dc <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19dc:	00b547b3          	xor	a5,a0,a1
    19e0:	8b9d                	andi	a5,a5,7
    19e2:	1a079863          	bnez	a5,1b92 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19e6:	0075f793          	andi	a5,a1,7
    19ea:	16078463          	beqz	a5,1b52 <strncpy+0x176>
    19ee:	ea01                	bnez	a2,19fe <strncpy+0x22>
    19f0:	a421                	j	1bf8 <strncpy+0x21c>
    19f2:	167d                	addi	a2,a2,-1
    19f4:	0505                	addi	a0,a0,1
    19f6:	14070e63          	beqz	a4,1b52 <strncpy+0x176>
    19fa:	1a060863          	beqz	a2,1baa <strncpy+0x1ce>
    19fe:	0005c783          	lbu	a5,0(a1)
    1a02:	0585                	addi	a1,a1,1
    1a04:	0075f713          	andi	a4,a1,7
    1a08:	00f50023          	sb	a5,0(a0)
    1a0c:	f3fd                	bnez	a5,19f2 <strncpy+0x16>
    1a0e:	4805                	li	a6,1
    1a10:	1a061863          	bnez	a2,1bc0 <strncpy+0x1e4>
    1a14:	40a007b3          	neg	a5,a0
    1a18:	8b9d                	andi	a5,a5,7
    1a1a:	4681                	li	a3,0
    1a1c:	18061a63          	bnez	a2,1bb0 <strncpy+0x1d4>
    1a20:	00778713          	addi	a4,a5,7
    1a24:	45ad                	li	a1,11
    1a26:	18b76363          	bltu	a4,a1,1bac <strncpy+0x1d0>
    1a2a:	1ae6eb63          	bltu	a3,a4,1be0 <strncpy+0x204>
    1a2e:	1a078363          	beqz	a5,1bd4 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a32:	00050023          	sb	zero,0(a0)
    1a36:	4685                	li	a3,1
    1a38:	00150713          	addi	a4,a0,1
    1a3c:	18d78f63          	beq	a5,a3,1bda <strncpy+0x1fe>
    1a40:	000500a3          	sb	zero,1(a0)
    1a44:	4689                	li	a3,2
    1a46:	00250713          	addi	a4,a0,2
    1a4a:	18d78e63          	beq	a5,a3,1be6 <strncpy+0x20a>
    1a4e:	00050123          	sb	zero,2(a0)
    1a52:	468d                	li	a3,3
    1a54:	00350713          	addi	a4,a0,3
    1a58:	16d78c63          	beq	a5,a3,1bd0 <strncpy+0x1f4>
    1a5c:	000501a3          	sb	zero,3(a0)
    1a60:	4691                	li	a3,4
    1a62:	00450713          	addi	a4,a0,4
    1a66:	18d78263          	beq	a5,a3,1bea <strncpy+0x20e>
    1a6a:	00050223          	sb	zero,4(a0)
    1a6e:	4695                	li	a3,5
    1a70:	00550713          	addi	a4,a0,5
    1a74:	16d78d63          	beq	a5,a3,1bee <strncpy+0x212>
    1a78:	000502a3          	sb	zero,5(a0)
    1a7c:	469d                	li	a3,7
    1a7e:	00650713          	addi	a4,a0,6
    1a82:	16d79863          	bne	a5,a3,1bf2 <strncpy+0x216>
    1a86:	00750713          	addi	a4,a0,7
    1a8a:	00050323          	sb	zero,6(a0)
    1a8e:	40f80833          	sub	a6,a6,a5
    1a92:	ff887593          	andi	a1,a6,-8
    1a96:	97aa                	add	a5,a5,a0
    1a98:	95be                	add	a1,a1,a5
    1a9a:	0007b023          	sd	zero,0(a5)
    1a9e:	07a1                	addi	a5,a5,8
    1aa0:	feb79de3          	bne	a5,a1,1a9a <strncpy+0xbe>
    1aa4:	ff887593          	andi	a1,a6,-8
    1aa8:	9ead                	addw	a3,a3,a1
    1aaa:	00b707b3          	add	a5,a4,a1
    1aae:	12b80863          	beq	a6,a1,1bde <strncpy+0x202>
    1ab2:	00078023          	sb	zero,0(a5)
    1ab6:	0016871b          	addiw	a4,a3,1
    1aba:	0ec77863          	bgeu	a4,a2,1baa <strncpy+0x1ce>
    1abe:	000780a3          	sb	zero,1(a5)
    1ac2:	0026871b          	addiw	a4,a3,2
    1ac6:	0ec77263          	bgeu	a4,a2,1baa <strncpy+0x1ce>
    1aca:	00078123          	sb	zero,2(a5)
    1ace:	0036871b          	addiw	a4,a3,3
    1ad2:	0cc77c63          	bgeu	a4,a2,1baa <strncpy+0x1ce>
    1ad6:	000781a3          	sb	zero,3(a5)
    1ada:	0046871b          	addiw	a4,a3,4
    1ade:	0cc77663          	bgeu	a4,a2,1baa <strncpy+0x1ce>
    1ae2:	00078223          	sb	zero,4(a5)
    1ae6:	0056871b          	addiw	a4,a3,5
    1aea:	0cc77063          	bgeu	a4,a2,1baa <strncpy+0x1ce>
    1aee:	000782a3          	sb	zero,5(a5)
    1af2:	0066871b          	addiw	a4,a3,6
    1af6:	0ac77a63          	bgeu	a4,a2,1baa <strncpy+0x1ce>
    1afa:	00078323          	sb	zero,6(a5)
    1afe:	0076871b          	addiw	a4,a3,7
    1b02:	0ac77463          	bgeu	a4,a2,1baa <strncpy+0x1ce>
    1b06:	000783a3          	sb	zero,7(a5)
    1b0a:	0086871b          	addiw	a4,a3,8
    1b0e:	08c77e63          	bgeu	a4,a2,1baa <strncpy+0x1ce>
    1b12:	00078423          	sb	zero,8(a5)
    1b16:	0096871b          	addiw	a4,a3,9
    1b1a:	08c77863          	bgeu	a4,a2,1baa <strncpy+0x1ce>
    1b1e:	000784a3          	sb	zero,9(a5)
    1b22:	00a6871b          	addiw	a4,a3,10
    1b26:	08c77263          	bgeu	a4,a2,1baa <strncpy+0x1ce>
    1b2a:	00078523          	sb	zero,10(a5)
    1b2e:	00b6871b          	addiw	a4,a3,11
    1b32:	06c77c63          	bgeu	a4,a2,1baa <strncpy+0x1ce>
    1b36:	000785a3          	sb	zero,11(a5)
    1b3a:	00c6871b          	addiw	a4,a3,12
    1b3e:	06c77663          	bgeu	a4,a2,1baa <strncpy+0x1ce>
    1b42:	00078623          	sb	zero,12(a5)
    1b46:	26b5                	addiw	a3,a3,13
    1b48:	06c6f163          	bgeu	a3,a2,1baa <strncpy+0x1ce>
    1b4c:	000786a3          	sb	zero,13(a5)
    1b50:	8082                	ret
            ;
        if (!n || !*s)
    1b52:	c645                	beqz	a2,1bfa <strncpy+0x21e>
    1b54:	0005c783          	lbu	a5,0(a1)
    1b58:	ea078be3          	beqz	a5,1a0e <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b5c:	479d                	li	a5,7
    1b5e:	02c7ff63          	bgeu	a5,a2,1b9c <strncpy+0x1c0>
    1b62:	00000897          	auipc	a7,0x0
    1b66:	3e68b883          	ld	a7,998(a7) # 1f48 <__clone+0xd6>
    1b6a:	00000817          	auipc	a6,0x0
    1b6e:	3e683803          	ld	a6,998(a6) # 1f50 <__clone+0xde>
    1b72:	431d                	li	t1,7
    1b74:	6198                	ld	a4,0(a1)
    1b76:	011707b3          	add	a5,a4,a7
    1b7a:	fff74693          	not	a3,a4
    1b7e:	8ff5                	and	a5,a5,a3
    1b80:	0107f7b3          	and	a5,a5,a6
    1b84:	ef81                	bnez	a5,1b9c <strncpy+0x1c0>
            *wd = *ws;
    1b86:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b88:	1661                	addi	a2,a2,-8
    1b8a:	05a1                	addi	a1,a1,8
    1b8c:	0521                	addi	a0,a0,8
    1b8e:	fec363e3          	bltu	t1,a2,1b74 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b92:	e609                	bnez	a2,1b9c <strncpy+0x1c0>
    1b94:	a08d                	j	1bf6 <strncpy+0x21a>
    1b96:	167d                	addi	a2,a2,-1
    1b98:	0505                	addi	a0,a0,1
    1b9a:	ca01                	beqz	a2,1baa <strncpy+0x1ce>
    1b9c:	0005c783          	lbu	a5,0(a1)
    1ba0:	0585                	addi	a1,a1,1
    1ba2:	00f50023          	sb	a5,0(a0)
    1ba6:	fbe5                	bnez	a5,1b96 <strncpy+0x1ba>
        ;
tail:
    1ba8:	b59d                	j	1a0e <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1baa:	8082                	ret
    1bac:	472d                	li	a4,11
    1bae:	bdb5                	j	1a2a <strncpy+0x4e>
    1bb0:	00778713          	addi	a4,a5,7
    1bb4:	45ad                	li	a1,11
    1bb6:	fff60693          	addi	a3,a2,-1
    1bba:	e6b778e3          	bgeu	a4,a1,1a2a <strncpy+0x4e>
    1bbe:	b7fd                	j	1bac <strncpy+0x1d0>
    1bc0:	40a007b3          	neg	a5,a0
    1bc4:	8832                	mv	a6,a2
    1bc6:	8b9d                	andi	a5,a5,7
    1bc8:	4681                	li	a3,0
    1bca:	e4060be3          	beqz	a2,1a20 <strncpy+0x44>
    1bce:	b7cd                	j	1bb0 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bd0:	468d                	li	a3,3
    1bd2:	bd75                	j	1a8e <strncpy+0xb2>
    1bd4:	872a                	mv	a4,a0
    1bd6:	4681                	li	a3,0
    1bd8:	bd5d                	j	1a8e <strncpy+0xb2>
    1bda:	4685                	li	a3,1
    1bdc:	bd4d                	j	1a8e <strncpy+0xb2>
    1bde:	8082                	ret
    1be0:	87aa                	mv	a5,a0
    1be2:	4681                	li	a3,0
    1be4:	b5f9                	j	1ab2 <strncpy+0xd6>
    1be6:	4689                	li	a3,2
    1be8:	b55d                	j	1a8e <strncpy+0xb2>
    1bea:	4691                	li	a3,4
    1bec:	b54d                	j	1a8e <strncpy+0xb2>
    1bee:	4695                	li	a3,5
    1bf0:	bd79                	j	1a8e <strncpy+0xb2>
    1bf2:	4699                	li	a3,6
    1bf4:	bd69                	j	1a8e <strncpy+0xb2>
    1bf6:	8082                	ret
    1bf8:	8082                	ret
    1bfa:	8082                	ret

0000000000001bfc <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1bfc:	87aa                	mv	a5,a0
    1bfe:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1c00:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c04:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c08:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c0a:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c0c:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c10:	2501                	sext.w	a0,a0
    1c12:	8082                	ret

0000000000001c14 <openat>:
    register long a7 __asm__("a7") = n;
    1c14:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c18:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c1c:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c20:	2501                	sext.w	a0,a0
    1c22:	8082                	ret

0000000000001c24 <close>:
    register long a7 __asm__("a7") = n;
    1c24:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c28:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c2c:	2501                	sext.w	a0,a0
    1c2e:	8082                	ret

0000000000001c30 <read>:
    register long a7 __asm__("a7") = n;
    1c30:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c34:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c38:	8082                	ret

0000000000001c3a <write>:
    register long a7 __asm__("a7") = n;
    1c3a:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c3e:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c42:	8082                	ret

0000000000001c44 <getpid>:
    register long a7 __asm__("a7") = n;
    1c44:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c48:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c4c:	2501                	sext.w	a0,a0
    1c4e:	8082                	ret

0000000000001c50 <getppid>:
    register long a7 __asm__("a7") = n;
    1c50:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c54:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c58:	2501                	sext.w	a0,a0
    1c5a:	8082                	ret

0000000000001c5c <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c5c:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c60:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c64:	2501                	sext.w	a0,a0
    1c66:	8082                	ret

0000000000001c68 <fork>:
    register long a7 __asm__("a7") = n;
    1c68:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c6c:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c6e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c70:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c74:	2501                	sext.w	a0,a0
    1c76:	8082                	ret

0000000000001c78 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c78:	85b2                	mv	a1,a2
    1c7a:	863a                	mv	a2,a4
    if (stack)
    1c7c:	c191                	beqz	a1,1c80 <clone+0x8>
	stack += stack_size;
    1c7e:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c80:	4781                	li	a5,0
    1c82:	4701                	li	a4,0
    1c84:	4681                	li	a3,0
    1c86:	2601                	sext.w	a2,a2
    1c88:	a2ed                	j	1e72 <__clone>

0000000000001c8a <exit>:
    register long a7 __asm__("a7") = n;
    1c8a:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c8e:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c92:	8082                	ret

0000000000001c94 <waitpid>:
    register long a7 __asm__("a7") = n;
    1c94:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c98:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c9a:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c9e:	2501                	sext.w	a0,a0
    1ca0:	8082                	ret

0000000000001ca2 <exec>:
    register long a7 __asm__("a7") = n;
    1ca2:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1ca6:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1caa:	2501                	sext.w	a0,a0
    1cac:	8082                	ret

0000000000001cae <execve>:
    register long a7 __asm__("a7") = n;
    1cae:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cb2:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cb6:	2501                	sext.w	a0,a0
    1cb8:	8082                	ret

0000000000001cba <times>:
    register long a7 __asm__("a7") = n;
    1cba:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cbe:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cc2:	2501                	sext.w	a0,a0
    1cc4:	8082                	ret

0000000000001cc6 <get_time>:

int64 get_time()
{
    1cc6:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cc8:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1ccc:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1cce:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cd0:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cd4:	2501                	sext.w	a0,a0
    1cd6:	ed09                	bnez	a0,1cf0 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cd8:	67a2                	ld	a5,8(sp)
    1cda:	3e800713          	li	a4,1000
    1cde:	00015503          	lhu	a0,0(sp)
    1ce2:	02e7d7b3          	divu	a5,a5,a4
    1ce6:	02e50533          	mul	a0,a0,a4
    1cea:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1cec:	0141                	addi	sp,sp,16
    1cee:	8082                	ret
        return -1;
    1cf0:	557d                	li	a0,-1
    1cf2:	bfed                	j	1cec <get_time+0x26>

0000000000001cf4 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1cf4:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cf8:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1cfc:	2501                	sext.w	a0,a0
    1cfe:	8082                	ret

0000000000001d00 <time>:
    register long a7 __asm__("a7") = n;
    1d00:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d04:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d08:	2501                	sext.w	a0,a0
    1d0a:	8082                	ret

0000000000001d0c <sleep>:

int sleep(unsigned long long time)
{
    1d0c:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d0e:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d10:	850a                	mv	a0,sp
    1d12:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d14:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d18:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d1a:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d1e:	e501                	bnez	a0,1d26 <sleep+0x1a>
    return 0;
    1d20:	4501                	li	a0,0
}
    1d22:	0141                	addi	sp,sp,16
    1d24:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d26:	4502                	lw	a0,0(sp)
}
    1d28:	0141                	addi	sp,sp,16
    1d2a:	8082                	ret

0000000000001d2c <set_priority>:
    register long a7 __asm__("a7") = n;
    1d2c:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d30:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d34:	2501                	sext.w	a0,a0
    1d36:	8082                	ret

0000000000001d38 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d38:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d3c:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d40:	8082                	ret

0000000000001d42 <munmap>:
    register long a7 __asm__("a7") = n;
    1d42:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d46:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d4a:	2501                	sext.w	a0,a0
    1d4c:	8082                	ret

0000000000001d4e <wait>:

int wait(int *code)
{
    1d4e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d50:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d54:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d56:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d58:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d5a:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d5e:	2501                	sext.w	a0,a0
    1d60:	8082                	ret

0000000000001d62 <spawn>:
    register long a7 __asm__("a7") = n;
    1d62:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d66:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d6a:	2501                	sext.w	a0,a0
    1d6c:	8082                	ret

0000000000001d6e <mailread>:
    register long a7 __asm__("a7") = n;
    1d6e:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d72:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d76:	2501                	sext.w	a0,a0
    1d78:	8082                	ret

0000000000001d7a <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d7a:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d7e:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d82:	2501                	sext.w	a0,a0
    1d84:	8082                	ret

0000000000001d86 <fstat>:
    register long a7 __asm__("a7") = n;
    1d86:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d8a:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d8e:	2501                	sext.w	a0,a0
    1d90:	8082                	ret

0000000000001d92 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d92:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d94:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d98:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d9a:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d9e:	2501                	sext.w	a0,a0
    1da0:	8082                	ret

0000000000001da2 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1da2:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1da4:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1da8:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1daa:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1dae:	2501                	sext.w	a0,a0
    1db0:	8082                	ret

0000000000001db2 <link>:

int link(char *old_path, char *new_path)
{
    1db2:	87aa                	mv	a5,a0
    1db4:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1db6:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1dba:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dbe:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dc0:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1dc4:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dc6:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <unlink>:

int unlink(char *path)
{
    1dce:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dd0:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1dd4:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1dd8:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dda:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1dde:	2501                	sext.w	a0,a0
    1de0:	8082                	ret

0000000000001de2 <uname>:
    register long a7 __asm__("a7") = n;
    1de2:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1de6:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1dea:	2501                	sext.w	a0,a0
    1dec:	8082                	ret

0000000000001dee <brk>:
    register long a7 __asm__("a7") = n;
    1dee:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1df2:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1df6:	2501                	sext.w	a0,a0
    1df8:	8082                	ret

0000000000001dfa <getcwd>:
    register long a7 __asm__("a7") = n;
    1dfa:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dfc:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1e00:	8082                	ret

0000000000001e02 <chdir>:
    register long a7 __asm__("a7") = n;
    1e02:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e06:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e0a:	2501                	sext.w	a0,a0
    1e0c:	8082                	ret

0000000000001e0e <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e0e:	862e                	mv	a2,a1
    1e10:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e12:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e14:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e18:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e1c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e1e:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e20:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e24:	2501                	sext.w	a0,a0
    1e26:	8082                	ret

0000000000001e28 <getdents>:
    register long a7 __asm__("a7") = n;
    1e28:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e2c:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e30:	2501                	sext.w	a0,a0
    1e32:	8082                	ret

0000000000001e34 <pipe>:
    register long a7 __asm__("a7") = n;
    1e34:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e38:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e3a:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e3e:	2501                	sext.w	a0,a0
    1e40:	8082                	ret

0000000000001e42 <dup>:
    register long a7 __asm__("a7") = n;
    1e42:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e44:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e48:	2501                	sext.w	a0,a0
    1e4a:	8082                	ret

0000000000001e4c <dup2>:
    register long a7 __asm__("a7") = n;
    1e4c:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e4e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e50:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e54:	2501                	sext.w	a0,a0
    1e56:	8082                	ret

0000000000001e58 <mount>:
    register long a7 __asm__("a7") = n;
    1e58:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e5c:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e60:	2501                	sext.w	a0,a0
    1e62:	8082                	ret

0000000000001e64 <umount>:
    register long a7 __asm__("a7") = n;
    1e64:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e68:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e6a:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e6e:	2501                	sext.w	a0,a0
    1e70:	8082                	ret

0000000000001e72 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e72:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e74:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e76:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e78:	8532                	mv	a0,a2
	mv a2, a4
    1e7a:	863a                	mv	a2,a4
	mv a3, a5
    1e7c:	86be                	mv	a3,a5
	mv a4, a6
    1e7e:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e80:	0dc00893          	li	a7,220
	ecall
    1e84:	00000073          	ecall

	beqz a0, 1f
    1e88:	c111                	beqz	a0,1e8c <__clone+0x1a>
	# Parent
	ret
    1e8a:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e8c:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e8e:	6522                	ld	a0,8(sp)
	jalr a1
    1e90:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e92:	05d00893          	li	a7,93
	ecall
    1e96:	00000073          	ecall
