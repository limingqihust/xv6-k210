
/home/lmq/lmq/cscc/xv6-k210/test/build/riscv64/execve:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a08d                	j	1064 <__start_main>

0000000000001004 <test_execve>:
 * 测试成功则输出：
 * "  I am test_echo."
 * 测试失败则输出：
 * "  execve error."
 */
void test_execve(void){
    1004:	7179                	addi	sp,sp,-48
    TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	e1a50513          	addi	a0,a0,-486 # 1e20 <__clone+0x2c>
void test_execve(void){
    100e:	f406                	sd	ra,40(sp)
    TEST_START(__func__);
    1010:	252000ef          	jal	ra,1262 <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	e7c50513          	addi	a0,a0,-388 # 1e90 <__func__.1166>
    101c:	246000ef          	jal	ra,1262 <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	e1850513          	addi	a0,a0,-488 # 1e38 <__clone+0x44>
    1028:	23a000ef          	jal	ra,1262 <puts>
    char *newargv[] = {"test_echo", NULL};
    char *newenviron[] = {NULL};
    execve("test_echo", newargv, newenviron);
    102c:	0030                	addi	a2,sp,8
    102e:	080c                	addi	a1,sp,16
    char *newargv[] = {"test_echo", NULL};
    1030:	00001517          	auipc	a0,0x1
    1034:	e1850513          	addi	a0,a0,-488 # 1e48 <__clone+0x54>
    1038:	e82a                	sd	a0,16(sp)
    103a:	ec02                	sd	zero,24(sp)
    char *newenviron[] = {NULL};
    103c:	e402                	sd	zero,8(sp)
    execve("test_echo", newargv, newenviron);
    103e:	3f3000ef          	jal	ra,1c30 <execve>
    printf("  execve error.\n");
    1042:	00001517          	auipc	a0,0x1
    1046:	e1650513          	addi	a0,a0,-490 # 1e58 <__clone+0x64>
    104a:	23a000ef          	jal	ra,1284 <printf>
    //TEST_END(__func__);
}
    104e:	70a2                	ld	ra,40(sp)
    1050:	6145                	addi	sp,sp,48
    1052:	8082                	ret

0000000000001054 <main>:

int main(void){
    1054:	1141                	addi	sp,sp,-16
    1056:	e406                	sd	ra,8(sp)
    test_execve();
    1058:	fadff0ef          	jal	ra,1004 <test_execve>
    return 0;
}
    105c:	60a2                	ld	ra,8(sp)
    105e:	4501                	li	a0,0
    1060:	0141                	addi	sp,sp,16
    1062:	8082                	ret

0000000000001064 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1064:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1066:	4108                	lw	a0,0(a0)
{
    1068:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    106a:	05a1                	addi	a1,a1,8
{
    106c:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    106e:	fe7ff0ef          	jal	ra,1054 <main>
    1072:	39b000ef          	jal	ra,1c0c <exit>
	return 0;
}
    1076:	60a2                	ld	ra,8(sp)
    1078:	4501                	li	a0,0
    107a:	0141                	addi	sp,sp,16
    107c:	8082                	ret

000000000000107e <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    107e:	7179                	addi	sp,sp,-48
    1080:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1082:	12054b63          	bltz	a0,11b8 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1086:	02b577bb          	remuw	a5,a0,a1
    108a:	00001697          	auipc	a3,0x1
    108e:	e1668693          	addi	a3,a3,-490 # 1ea0 <digits>
    buf[16] = 0;
    1092:	00010c23          	sb	zero,24(sp)
    i = 15;
    1096:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    109a:	1782                	slli	a5,a5,0x20
    109c:	9381                	srli	a5,a5,0x20
    109e:	97b6                	add	a5,a5,a3
    10a0:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10a4:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10a8:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10ac:	16b56263          	bltu	a0,a1,1210 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    10b0:	02e8763b          	remuw	a2,a6,a4
    10b4:	1602                	slli	a2,a2,0x20
    10b6:	9201                	srli	a2,a2,0x20
    10b8:	9636                	add	a2,a2,a3
    10ba:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10be:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    10c2:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10c6:	12e86963          	bltu	a6,a4,11f8 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    10ca:	02e5f63b          	remuw	a2,a1,a4
    10ce:	1602                	slli	a2,a2,0x20
    10d0:	9201                	srli	a2,a2,0x20
    10d2:	9636                	add	a2,a2,a3
    10d4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10d8:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    10dc:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    10e0:	10e5ef63          	bltu	a1,a4,11fe <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    10e4:	02e8763b          	remuw	a2,a6,a4
    10e8:	1602                	slli	a2,a2,0x20
    10ea:	9201                	srli	a2,a2,0x20
    10ec:	9636                	add	a2,a2,a3
    10ee:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10f2:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    10f6:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    10fa:	10e86563          	bltu	a6,a4,1204 <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    10fe:	02e5f63b          	remuw	a2,a1,a4
    1102:	1602                	slli	a2,a2,0x20
    1104:	9201                	srli	a2,a2,0x20
    1106:	9636                	add	a2,a2,a3
    1108:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    110c:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1110:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1114:	0ee5eb63          	bltu	a1,a4,120a <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    1118:	02e8763b          	remuw	a2,a6,a4
    111c:	1602                	slli	a2,a2,0x20
    111e:	9201                	srli	a2,a2,0x20
    1120:	9636                	add	a2,a2,a3
    1122:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1126:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    112a:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    112e:	0ce86263          	bltu	a6,a4,11f2 <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    1132:	02e5f63b          	remuw	a2,a1,a4
    1136:	1602                	slli	a2,a2,0x20
    1138:	9201                	srli	a2,a2,0x20
    113a:	9636                	add	a2,a2,a3
    113c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1140:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1144:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1148:	0ce5e663          	bltu	a1,a4,1214 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    114c:	02e8763b          	remuw	a2,a6,a4
    1150:	1602                	slli	a2,a2,0x20
    1152:	9201                	srli	a2,a2,0x20
    1154:	9636                	add	a2,a2,a3
    1156:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    115e:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1162:	0ae86c63          	bltu	a6,a4,121a <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    1166:	02e5f63b          	remuw	a2,a1,a4
    116a:	1602                	slli	a2,a2,0x20
    116c:	9201                	srli	a2,a2,0x20
    116e:	9636                	add	a2,a2,a3
    1170:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1174:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1178:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    117c:	0ae5e263          	bltu	a1,a4,1220 <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    1180:	1782                	slli	a5,a5,0x20
    1182:	9381                	srli	a5,a5,0x20
    1184:	97b6                	add	a5,a5,a3
    1186:	0007c703          	lbu	a4,0(a5)
    118a:	4599                	li	a1,6
    118c:	4795                	li	a5,5
    118e:	00e10723          	sb	a4,14(sp)

    if (sign)
    1192:	00055963          	bgez	a0,11a4 <printint.constprop.0+0x126>
        buf[i--] = '-';
    1196:	1018                	addi	a4,sp,32
    1198:	973e                	add	a4,a4,a5
    119a:	02d00693          	li	a3,45
    119e:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    11a2:	85be                	mv	a1,a5
    write(f, s, l);
    11a4:	003c                	addi	a5,sp,8
    11a6:	4641                	li	a2,16
    11a8:	9e0d                	subw	a2,a2,a1
    11aa:	4505                	li	a0,1
    11ac:	95be                	add	a1,a1,a5
    11ae:	20f000ef          	jal	ra,1bbc <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11b2:	70a2                	ld	ra,40(sp)
    11b4:	6145                	addi	sp,sp,48
    11b6:	8082                	ret
        x = -xx;
    11b8:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    11bc:	02b677bb          	remuw	a5,a2,a1
    11c0:	00001697          	auipc	a3,0x1
    11c4:	ce068693          	addi	a3,a3,-800 # 1ea0 <digits>
    buf[16] = 0;
    11c8:	00010c23          	sb	zero,24(sp)
    i = 15;
    11cc:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    11d0:	1782                	slli	a5,a5,0x20
    11d2:	9381                	srli	a5,a5,0x20
    11d4:	97b6                	add	a5,a5,a3
    11d6:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    11da:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11de:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    11e2:	ecb677e3          	bgeu	a2,a1,10b0 <printint.constprop.0+0x32>
        buf[i--] = '-';
    11e6:	02d00793          	li	a5,45
    11ea:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    11ee:	45b9                	li	a1,14
    11f0:	bf55                	j	11a4 <printint.constprop.0+0x126>
    11f2:	47a5                	li	a5,9
    11f4:	45a9                	li	a1,10
    11f6:	bf71                	j	1192 <printint.constprop.0+0x114>
    11f8:	47b5                	li	a5,13
    11fa:	45b9                	li	a1,14
    11fc:	bf59                	j	1192 <printint.constprop.0+0x114>
    11fe:	47b1                	li	a5,12
    1200:	45b5                	li	a1,13
    1202:	bf41                	j	1192 <printint.constprop.0+0x114>
    1204:	47ad                	li	a5,11
    1206:	45b1                	li	a1,12
    1208:	b769                	j	1192 <printint.constprop.0+0x114>
    120a:	47a9                	li	a5,10
    120c:	45ad                	li	a1,11
    120e:	b751                	j	1192 <printint.constprop.0+0x114>
    i = 15;
    1210:	45bd                	li	a1,15
    1212:	bf49                	j	11a4 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1214:	47a1                	li	a5,8
    1216:	45a5                	li	a1,9
    1218:	bfad                	j	1192 <printint.constprop.0+0x114>
    121a:	479d                	li	a5,7
    121c:	45a1                	li	a1,8
    121e:	bf95                	j	1192 <printint.constprop.0+0x114>
    1220:	4799                	li	a5,6
    1222:	459d                	li	a1,7
    1224:	b7bd                	j	1192 <printint.constprop.0+0x114>

0000000000001226 <getchar>:
{
    1226:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1228:	00f10593          	addi	a1,sp,15
    122c:	4605                	li	a2,1
    122e:	4501                	li	a0,0
{
    1230:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1232:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1236:	17d000ef          	jal	ra,1bb2 <read>
}
    123a:	60e2                	ld	ra,24(sp)
    123c:	00f14503          	lbu	a0,15(sp)
    1240:	6105                	addi	sp,sp,32
    1242:	8082                	ret

0000000000001244 <putchar>:
{
    1244:	1101                	addi	sp,sp,-32
    1246:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1248:	00f10593          	addi	a1,sp,15
    124c:	4605                	li	a2,1
    124e:	4505                	li	a0,1
{
    1250:	ec06                	sd	ra,24(sp)
    char byte = c;
    1252:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1256:	167000ef          	jal	ra,1bbc <write>
}
    125a:	60e2                	ld	ra,24(sp)
    125c:	2501                	sext.w	a0,a0
    125e:	6105                	addi	sp,sp,32
    1260:	8082                	ret

0000000000001262 <puts>:
{
    1262:	1141                	addi	sp,sp,-16
    1264:	e406                	sd	ra,8(sp)
    1266:	e022                	sd	s0,0(sp)
    1268:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    126a:	56e000ef          	jal	ra,17d8 <strlen>
    126e:	862a                	mv	a2,a0
    1270:	85a2                	mv	a1,s0
    1272:	4505                	li	a0,1
    1274:	149000ef          	jal	ra,1bbc <write>
}
    1278:	60a2                	ld	ra,8(sp)
    127a:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    127c:	957d                	srai	a0,a0,0x3f
    return r;
    127e:	2501                	sext.w	a0,a0
}
    1280:	0141                	addi	sp,sp,16
    1282:	8082                	ret

0000000000001284 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1284:	7171                	addi	sp,sp,-176
    1286:	fc56                	sd	s5,56(sp)
    1288:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    128a:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    128c:	18bc                	addi	a5,sp,120
{
    128e:	e8ca                	sd	s2,80(sp)
    1290:	e4ce                	sd	s3,72(sp)
    1292:	e0d2                	sd	s4,64(sp)
    1294:	f85a                	sd	s6,48(sp)
    1296:	f486                	sd	ra,104(sp)
    1298:	f0a2                	sd	s0,96(sp)
    129a:	eca6                	sd	s1,88(sp)
    129c:	fcae                	sd	a1,120(sp)
    129e:	e132                	sd	a2,128(sp)
    12a0:	e536                	sd	a3,136(sp)
    12a2:	e93a                	sd	a4,144(sp)
    12a4:	f142                	sd	a6,160(sp)
    12a6:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    12a8:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12aa:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    12ae:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    12b2:	00001b17          	auipc	s6,0x1
    12b6:	bbeb0b13          	addi	s6,s6,-1090 # 1e70 <__clone+0x7c>
    buf[i++] = '0';
    12ba:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12be:	00001997          	auipc	s3,0x1
    12c2:	be298993          	addi	s3,s3,-1054 # 1ea0 <digits>
        if (!*s)
    12c6:	00054783          	lbu	a5,0(a0)
    12ca:	16078a63          	beqz	a5,143e <printf+0x1ba>
    12ce:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    12d0:	19278163          	beq	a5,s2,1452 <printf+0x1ce>
    12d4:	00164783          	lbu	a5,1(a2)
    12d8:	0605                	addi	a2,a2,1
    12da:	fbfd                	bnez	a5,12d0 <printf+0x4c>
    12dc:	84b2                	mv	s1,a2
        l = z - a;
    12de:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    12e2:	85aa                	mv	a1,a0
    12e4:	8622                	mv	a2,s0
    12e6:	4505                	li	a0,1
    12e8:	0d5000ef          	jal	ra,1bbc <write>
        if (l)
    12ec:	18041c63          	bnez	s0,1484 <printf+0x200>
        if (s[1] == 0)
    12f0:	0014c783          	lbu	a5,1(s1)
    12f4:	14078563          	beqz	a5,143e <printf+0x1ba>
        switch (s[1])
    12f8:	1d478063          	beq	a5,s4,14b8 <printf+0x234>
    12fc:	18fa6663          	bltu	s4,a5,1488 <printf+0x204>
    1300:	06400713          	li	a4,100
    1304:	1ae78063          	beq	a5,a4,14a4 <printf+0x220>
    1308:	07000713          	li	a4,112
    130c:	1ce79963          	bne	a5,a4,14de <printf+0x25a>
            printptr(va_arg(ap, uint64));
    1310:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1312:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1316:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1318:	631c                	ld	a5,0(a4)
    131a:	0721                	addi	a4,a4,8
    131c:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    131e:	00479293          	slli	t0,a5,0x4
    1322:	00879f93          	slli	t6,a5,0x8
    1326:	00c79f13          	slli	t5,a5,0xc
    132a:	01079e93          	slli	t4,a5,0x10
    132e:	01479e13          	slli	t3,a5,0x14
    1332:	01879313          	slli	t1,a5,0x18
    1336:	01c79893          	slli	a7,a5,0x1c
    133a:	02479813          	slli	a6,a5,0x24
    133e:	02879513          	slli	a0,a5,0x28
    1342:	02c79593          	slli	a1,a5,0x2c
    1346:	03079693          	slli	a3,a5,0x30
    134a:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    134e:	03c7d413          	srli	s0,a5,0x3c
    1352:	01c7d39b          	srliw	t2,a5,0x1c
    1356:	03c2d293          	srli	t0,t0,0x3c
    135a:	03cfdf93          	srli	t6,t6,0x3c
    135e:	03cf5f13          	srli	t5,t5,0x3c
    1362:	03cede93          	srli	t4,t4,0x3c
    1366:	03ce5e13          	srli	t3,t3,0x3c
    136a:	03c35313          	srli	t1,t1,0x3c
    136e:	03c8d893          	srli	a7,a7,0x3c
    1372:	03c85813          	srli	a6,a6,0x3c
    1376:	9171                	srli	a0,a0,0x3c
    1378:	91f1                	srli	a1,a1,0x3c
    137a:	92f1                	srli	a3,a3,0x3c
    137c:	9371                	srli	a4,a4,0x3c
    137e:	96ce                	add	a3,a3,s3
    1380:	974e                	add	a4,a4,s3
    1382:	944e                	add	s0,s0,s3
    1384:	92ce                	add	t0,t0,s3
    1386:	9fce                	add	t6,t6,s3
    1388:	9f4e                	add	t5,t5,s3
    138a:	9ece                	add	t4,t4,s3
    138c:	9e4e                	add	t3,t3,s3
    138e:	934e                	add	t1,t1,s3
    1390:	98ce                	add	a7,a7,s3
    1392:	93ce                	add	t2,t2,s3
    1394:	984e                	add	a6,a6,s3
    1396:	954e                	add	a0,a0,s3
    1398:	95ce                	add	a1,a1,s3
    139a:	0006c083          	lbu	ra,0(a3)
    139e:	0002c283          	lbu	t0,0(t0)
    13a2:	00074683          	lbu	a3,0(a4)
    13a6:	000fcf83          	lbu	t6,0(t6)
    13aa:	000f4f03          	lbu	t5,0(t5)
    13ae:	000ece83          	lbu	t4,0(t4)
    13b2:	000e4e03          	lbu	t3,0(t3)
    13b6:	00034303          	lbu	t1,0(t1)
    13ba:	0008c883          	lbu	a7,0(a7)
    13be:	0003c383          	lbu	t2,0(t2)
    13c2:	00084803          	lbu	a6,0(a6)
    13c6:	00054503          	lbu	a0,0(a0)
    13ca:	0005c583          	lbu	a1,0(a1)
    13ce:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13d2:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13d6:	9371                	srli	a4,a4,0x3c
    13d8:	8bbd                	andi	a5,a5,15
    13da:	974e                	add	a4,a4,s3
    13dc:	97ce                	add	a5,a5,s3
    13de:	005105a3          	sb	t0,11(sp)
    13e2:	01f10623          	sb	t6,12(sp)
    13e6:	01e106a3          	sb	t5,13(sp)
    13ea:	01d10723          	sb	t4,14(sp)
    13ee:	01c107a3          	sb	t3,15(sp)
    13f2:	00610823          	sb	t1,16(sp)
    13f6:	011108a3          	sb	a7,17(sp)
    13fa:	00710923          	sb	t2,18(sp)
    13fe:	010109a3          	sb	a6,19(sp)
    1402:	00a10a23          	sb	a0,20(sp)
    1406:	00b10aa3          	sb	a1,21(sp)
    140a:	00110b23          	sb	ra,22(sp)
    140e:	00d10ba3          	sb	a3,23(sp)
    1412:	00810523          	sb	s0,10(sp)
    1416:	00074703          	lbu	a4,0(a4)
    141a:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    141e:	002c                	addi	a1,sp,8
    1420:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1422:	00e10c23          	sb	a4,24(sp)
    1426:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    142a:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    142e:	78e000ef          	jal	ra,1bbc <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1432:	00248513          	addi	a0,s1,2
        if (!*s)
    1436:	00054783          	lbu	a5,0(a0)
    143a:	e8079ae3          	bnez	a5,12ce <printf+0x4a>
    }
    va_end(ap);
}
    143e:	70a6                	ld	ra,104(sp)
    1440:	7406                	ld	s0,96(sp)
    1442:	64e6                	ld	s1,88(sp)
    1444:	6946                	ld	s2,80(sp)
    1446:	69a6                	ld	s3,72(sp)
    1448:	6a06                	ld	s4,64(sp)
    144a:	7ae2                	ld	s5,56(sp)
    144c:	7b42                	ld	s6,48(sp)
    144e:	614d                	addi	sp,sp,176
    1450:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1452:	00064783          	lbu	a5,0(a2)
    1456:	84b2                	mv	s1,a2
    1458:	01278963          	beq	a5,s2,146a <printf+0x1e6>
    145c:	b549                	j	12de <printf+0x5a>
    145e:	0024c783          	lbu	a5,2(s1)
    1462:	0605                	addi	a2,a2,1
    1464:	0489                	addi	s1,s1,2
    1466:	e7279ce3          	bne	a5,s2,12de <printf+0x5a>
    146a:	0014c783          	lbu	a5,1(s1)
    146e:	ff2788e3          	beq	a5,s2,145e <printf+0x1da>
        l = z - a;
    1472:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1476:	85aa                	mv	a1,a0
    1478:	8622                	mv	a2,s0
    147a:	4505                	li	a0,1
    147c:	740000ef          	jal	ra,1bbc <write>
        if (l)
    1480:	e60408e3          	beqz	s0,12f0 <printf+0x6c>
    1484:	8526                	mv	a0,s1
    1486:	b581                	j	12c6 <printf+0x42>
        switch (s[1])
    1488:	07800713          	li	a4,120
    148c:	04e79963          	bne	a5,a4,14de <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    1490:	6782                	ld	a5,0(sp)
    1492:	45c1                	li	a1,16
    1494:	4388                	lw	a0,0(a5)
    1496:	07a1                	addi	a5,a5,8
    1498:	e03e                	sd	a5,0(sp)
    149a:	be5ff0ef          	jal	ra,107e <printint.constprop.0>
        s += 2;
    149e:	00248513          	addi	a0,s1,2
    14a2:	bf51                	j	1436 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    14a4:	6782                	ld	a5,0(sp)
    14a6:	45a9                	li	a1,10
    14a8:	4388                	lw	a0,0(a5)
    14aa:	07a1                	addi	a5,a5,8
    14ac:	e03e                	sd	a5,0(sp)
    14ae:	bd1ff0ef          	jal	ra,107e <printint.constprop.0>
        s += 2;
    14b2:	00248513          	addi	a0,s1,2
    14b6:	b741                	j	1436 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    14b8:	6782                	ld	a5,0(sp)
    14ba:	6380                	ld	s0,0(a5)
    14bc:	07a1                	addi	a5,a5,8
    14be:	e03e                	sd	a5,0(sp)
    14c0:	c421                	beqz	s0,1508 <printf+0x284>
            l = strnlen(a, 200);
    14c2:	0c800593          	li	a1,200
    14c6:	8522                	mv	a0,s0
    14c8:	3fc000ef          	jal	ra,18c4 <strnlen>
    write(f, s, l);
    14cc:	0005061b          	sext.w	a2,a0
    14d0:	85a2                	mv	a1,s0
    14d2:	4505                	li	a0,1
    14d4:	6e8000ef          	jal	ra,1bbc <write>
        s += 2;
    14d8:	00248513          	addi	a0,s1,2
    14dc:	bfa9                	j	1436 <printf+0x1b2>
    char byte = c;
    14de:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    14e2:	4605                	li	a2,1
    14e4:	002c                	addi	a1,sp,8
    14e6:	4505                	li	a0,1
    char byte = c;
    14e8:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    14ec:	6d0000ef          	jal	ra,1bbc <write>
    char byte = c;
    14f0:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    14f4:	4605                	li	a2,1
    14f6:	002c                	addi	a1,sp,8
    14f8:	4505                	li	a0,1
    char byte = c;
    14fa:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    14fe:	6be000ef          	jal	ra,1bbc <write>
        s += 2;
    1502:	00248513          	addi	a0,s1,2
    1506:	bf05                	j	1436 <printf+0x1b2>
                a = "(null)";
    1508:	845a                	mv	s0,s6
    150a:	bf65                	j	14c2 <printf+0x23e>

000000000000150c <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    150c:	02000793          	li	a5,32
    1510:	00f50663          	beq	a0,a5,151c <isspace+0x10>
    1514:	355d                	addiw	a0,a0,-9
    1516:	00553513          	sltiu	a0,a0,5
    151a:	8082                	ret
    151c:	4505                	li	a0,1
}
    151e:	8082                	ret

0000000000001520 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1520:	fd05051b          	addiw	a0,a0,-48
}
    1524:	00a53513          	sltiu	a0,a0,10
    1528:	8082                	ret

000000000000152a <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    152a:	02000613          	li	a2,32
    152e:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1530:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1534:	ff77069b          	addiw	a3,a4,-9
    1538:	04c70d63          	beq	a4,a2,1592 <atoi+0x68>
    153c:	0007079b          	sext.w	a5,a4
    1540:	04d5f963          	bgeu	a1,a3,1592 <atoi+0x68>
        s++;
    switch (*s)
    1544:	02b00693          	li	a3,43
    1548:	04d70a63          	beq	a4,a3,159c <atoi+0x72>
    154c:	02d00693          	li	a3,45
    1550:	06d70463          	beq	a4,a3,15b8 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1554:	fd07859b          	addiw	a1,a5,-48
    1558:	4625                	li	a2,9
    155a:	873e                	mv	a4,a5
    155c:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    155e:	4e01                	li	t3,0
    while (isdigit(*s))
    1560:	04b66a63          	bltu	a2,a1,15b4 <atoi+0x8a>
    int n = 0, neg = 0;
    1564:	4501                	li	a0,0
    while (isdigit(*s))
    1566:	4825                	li	a6,9
    1568:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    156c:	0025179b          	slliw	a5,a0,0x2
    1570:	9d3d                	addw	a0,a0,a5
    1572:	fd07031b          	addiw	t1,a4,-48
    1576:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    157a:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    157e:	0685                	addi	a3,a3,1
    1580:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1584:	0006071b          	sext.w	a4,a2
    1588:	feb870e3          	bgeu	a6,a1,1568 <atoi+0x3e>
    return neg ? n : -n;
    158c:	000e0563          	beqz	t3,1596 <atoi+0x6c>
}
    1590:	8082                	ret
        s++;
    1592:	0505                	addi	a0,a0,1
    1594:	bf71                	j	1530 <atoi+0x6>
    1596:	4113053b          	subw	a0,t1,a7
    159a:	8082                	ret
    while (isdigit(*s))
    159c:	00154783          	lbu	a5,1(a0)
    15a0:	4625                	li	a2,9
        s++;
    15a2:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    15a6:	fd07859b          	addiw	a1,a5,-48
    15aa:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    15ae:	4e01                	li	t3,0
    while (isdigit(*s))
    15b0:	fab67ae3          	bgeu	a2,a1,1564 <atoi+0x3a>
    15b4:	4501                	li	a0,0
}
    15b6:	8082                	ret
    while (isdigit(*s))
    15b8:	00154783          	lbu	a5,1(a0)
    15bc:	4625                	li	a2,9
        s++;
    15be:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    15c2:	fd07859b          	addiw	a1,a5,-48
    15c6:	0007871b          	sext.w	a4,a5
    15ca:	feb665e3          	bltu	a2,a1,15b4 <atoi+0x8a>
        neg = 1;
    15ce:	4e05                	li	t3,1
    15d0:	bf51                	j	1564 <atoi+0x3a>

00000000000015d2 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    15d2:	16060d63          	beqz	a2,174c <memset+0x17a>
    15d6:	40a007b3          	neg	a5,a0
    15da:	8b9d                	andi	a5,a5,7
    15dc:	00778713          	addi	a4,a5,7
    15e0:	482d                	li	a6,11
    15e2:	0ff5f593          	andi	a1,a1,255
    15e6:	fff60693          	addi	a3,a2,-1
    15ea:	17076263          	bltu	a4,a6,174e <memset+0x17c>
    15ee:	16e6ea63          	bltu	a3,a4,1762 <memset+0x190>
    15f2:	16078563          	beqz	a5,175c <memset+0x18a>
    15f6:	00b50023          	sb	a1,0(a0)
    15fa:	4705                	li	a4,1
    15fc:	00150e93          	addi	t4,a0,1
    1600:	14e78c63          	beq	a5,a4,1758 <memset+0x186>
    1604:	00b500a3          	sb	a1,1(a0)
    1608:	4709                	li	a4,2
    160a:	00250e93          	addi	t4,a0,2
    160e:	14e78d63          	beq	a5,a4,1768 <memset+0x196>
    1612:	00b50123          	sb	a1,2(a0)
    1616:	470d                	li	a4,3
    1618:	00350e93          	addi	t4,a0,3
    161c:	12e78b63          	beq	a5,a4,1752 <memset+0x180>
    1620:	00b501a3          	sb	a1,3(a0)
    1624:	4711                	li	a4,4
    1626:	00450e93          	addi	t4,a0,4
    162a:	14e78163          	beq	a5,a4,176c <memset+0x19a>
    162e:	00b50223          	sb	a1,4(a0)
    1632:	4715                	li	a4,5
    1634:	00550e93          	addi	t4,a0,5
    1638:	12e78c63          	beq	a5,a4,1770 <memset+0x19e>
    163c:	00b502a3          	sb	a1,5(a0)
    1640:	471d                	li	a4,7
    1642:	00650e93          	addi	t4,a0,6
    1646:	12e79763          	bne	a5,a4,1774 <memset+0x1a2>
    164a:	00750e93          	addi	t4,a0,7
    164e:	00b50323          	sb	a1,6(a0)
    1652:	4f1d                	li	t5,7
    1654:	00859713          	slli	a4,a1,0x8
    1658:	8f4d                	or	a4,a4,a1
    165a:	01059e13          	slli	t3,a1,0x10
    165e:	01c76e33          	or	t3,a4,t3
    1662:	01859313          	slli	t1,a1,0x18
    1666:	006e6333          	or	t1,t3,t1
    166a:	02059893          	slli	a7,a1,0x20
    166e:	011368b3          	or	a7,t1,a7
    1672:	02859813          	slli	a6,a1,0x28
    1676:	40f60333          	sub	t1,a2,a5
    167a:	0108e833          	or	a6,a7,a6
    167e:	03059693          	slli	a3,a1,0x30
    1682:	00d866b3          	or	a3,a6,a3
    1686:	03859713          	slli	a4,a1,0x38
    168a:	97aa                	add	a5,a5,a0
    168c:	ff837813          	andi	a6,t1,-8
    1690:	8f55                	or	a4,a4,a3
    1692:	00f806b3          	add	a3,a6,a5
    1696:	e398                	sd	a4,0(a5)
    1698:	07a1                	addi	a5,a5,8
    169a:	fed79ee3          	bne	a5,a3,1696 <memset+0xc4>
    169e:	ff837693          	andi	a3,t1,-8
    16a2:	00de87b3          	add	a5,t4,a3
    16a6:	01e6873b          	addw	a4,a3,t5
    16aa:	0ad30663          	beq	t1,a3,1756 <memset+0x184>
    16ae:	00b78023          	sb	a1,0(a5)
    16b2:	0017069b          	addiw	a3,a4,1
    16b6:	08c6fb63          	bgeu	a3,a2,174c <memset+0x17a>
    16ba:	00b780a3          	sb	a1,1(a5)
    16be:	0027069b          	addiw	a3,a4,2
    16c2:	08c6f563          	bgeu	a3,a2,174c <memset+0x17a>
    16c6:	00b78123          	sb	a1,2(a5)
    16ca:	0037069b          	addiw	a3,a4,3
    16ce:	06c6ff63          	bgeu	a3,a2,174c <memset+0x17a>
    16d2:	00b781a3          	sb	a1,3(a5)
    16d6:	0047069b          	addiw	a3,a4,4
    16da:	06c6f963          	bgeu	a3,a2,174c <memset+0x17a>
    16de:	00b78223          	sb	a1,4(a5)
    16e2:	0057069b          	addiw	a3,a4,5
    16e6:	06c6f363          	bgeu	a3,a2,174c <memset+0x17a>
    16ea:	00b782a3          	sb	a1,5(a5)
    16ee:	0067069b          	addiw	a3,a4,6
    16f2:	04c6fd63          	bgeu	a3,a2,174c <memset+0x17a>
    16f6:	00b78323          	sb	a1,6(a5)
    16fa:	0077069b          	addiw	a3,a4,7
    16fe:	04c6f763          	bgeu	a3,a2,174c <memset+0x17a>
    1702:	00b783a3          	sb	a1,7(a5)
    1706:	0087069b          	addiw	a3,a4,8
    170a:	04c6f163          	bgeu	a3,a2,174c <memset+0x17a>
    170e:	00b78423          	sb	a1,8(a5)
    1712:	0097069b          	addiw	a3,a4,9
    1716:	02c6fb63          	bgeu	a3,a2,174c <memset+0x17a>
    171a:	00b784a3          	sb	a1,9(a5)
    171e:	00a7069b          	addiw	a3,a4,10
    1722:	02c6f563          	bgeu	a3,a2,174c <memset+0x17a>
    1726:	00b78523          	sb	a1,10(a5)
    172a:	00b7069b          	addiw	a3,a4,11
    172e:	00c6ff63          	bgeu	a3,a2,174c <memset+0x17a>
    1732:	00b785a3          	sb	a1,11(a5)
    1736:	00c7069b          	addiw	a3,a4,12
    173a:	00c6f963          	bgeu	a3,a2,174c <memset+0x17a>
    173e:	00b78623          	sb	a1,12(a5)
    1742:	2735                	addiw	a4,a4,13
    1744:	00c77463          	bgeu	a4,a2,174c <memset+0x17a>
    1748:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    174c:	8082                	ret
    174e:	472d                	li	a4,11
    1750:	bd79                	j	15ee <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1752:	4f0d                	li	t5,3
    1754:	b701                	j	1654 <memset+0x82>
    1756:	8082                	ret
    1758:	4f05                	li	t5,1
    175a:	bded                	j	1654 <memset+0x82>
    175c:	8eaa                	mv	t4,a0
    175e:	4f01                	li	t5,0
    1760:	bdd5                	j	1654 <memset+0x82>
    1762:	87aa                	mv	a5,a0
    1764:	4701                	li	a4,0
    1766:	b7a1                	j	16ae <memset+0xdc>
    1768:	4f09                	li	t5,2
    176a:	b5ed                	j	1654 <memset+0x82>
    176c:	4f11                	li	t5,4
    176e:	b5dd                	j	1654 <memset+0x82>
    1770:	4f15                	li	t5,5
    1772:	b5cd                	j	1654 <memset+0x82>
    1774:	4f19                	li	t5,6
    1776:	bdf9                	j	1654 <memset+0x82>

0000000000001778 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1778:	00054783          	lbu	a5,0(a0)
    177c:	0005c703          	lbu	a4,0(a1)
    1780:	00e79863          	bne	a5,a4,1790 <strcmp+0x18>
    1784:	0505                	addi	a0,a0,1
    1786:	0585                	addi	a1,a1,1
    1788:	fbe5                	bnez	a5,1778 <strcmp>
    178a:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    178c:	9d19                	subw	a0,a0,a4
    178e:	8082                	ret
    1790:	0007851b          	sext.w	a0,a5
    1794:	bfe5                	j	178c <strcmp+0x14>

0000000000001796 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1796:	ce05                	beqz	a2,17ce <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1798:	00054703          	lbu	a4,0(a0)
    179c:	0005c783          	lbu	a5,0(a1)
    17a0:	cb0d                	beqz	a4,17d2 <strncmp+0x3c>
    if (!n--)
    17a2:	167d                	addi	a2,a2,-1
    17a4:	00c506b3          	add	a3,a0,a2
    17a8:	a819                	j	17be <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17aa:	00a68e63          	beq	a3,a0,17c6 <strncmp+0x30>
    17ae:	0505                	addi	a0,a0,1
    17b0:	00e79b63          	bne	a5,a4,17c6 <strncmp+0x30>
    17b4:	00054703          	lbu	a4,0(a0)
    17b8:	0005c783          	lbu	a5,0(a1)
    17bc:	cb19                	beqz	a4,17d2 <strncmp+0x3c>
    17be:	0005c783          	lbu	a5,0(a1)
    17c2:	0585                	addi	a1,a1,1
    17c4:	f3fd                	bnez	a5,17aa <strncmp+0x14>
        ;
    return *l - *r;
    17c6:	0007051b          	sext.w	a0,a4
    17ca:	9d1d                	subw	a0,a0,a5
    17cc:	8082                	ret
        return 0;
    17ce:	4501                	li	a0,0
}
    17d0:	8082                	ret
    17d2:	4501                	li	a0,0
    return *l - *r;
    17d4:	9d1d                	subw	a0,a0,a5
    17d6:	8082                	ret

00000000000017d8 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    17d8:	00757793          	andi	a5,a0,7
    17dc:	cf89                	beqz	a5,17f6 <strlen+0x1e>
    17de:	87aa                	mv	a5,a0
    17e0:	a029                	j	17ea <strlen+0x12>
    17e2:	0785                	addi	a5,a5,1
    17e4:	0077f713          	andi	a4,a5,7
    17e8:	cb01                	beqz	a4,17f8 <strlen+0x20>
        if (!*s)
    17ea:	0007c703          	lbu	a4,0(a5)
    17ee:	fb75                	bnez	a4,17e2 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    17f0:	40a78533          	sub	a0,a5,a0
}
    17f4:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    17f6:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    17f8:	6394                	ld	a3,0(a5)
    17fa:	00000597          	auipc	a1,0x0
    17fe:	67e5b583          	ld	a1,1662(a1) # 1e78 <__clone+0x84>
    1802:	00000617          	auipc	a2,0x0
    1806:	67e63603          	ld	a2,1662(a2) # 1e80 <__clone+0x8c>
    180a:	a019                	j	1810 <strlen+0x38>
    180c:	6794                	ld	a3,8(a5)
    180e:	07a1                	addi	a5,a5,8
    1810:	00b68733          	add	a4,a3,a1
    1814:	fff6c693          	not	a3,a3
    1818:	8f75                	and	a4,a4,a3
    181a:	8f71                	and	a4,a4,a2
    181c:	db65                	beqz	a4,180c <strlen+0x34>
    for (; *s; s++)
    181e:	0007c703          	lbu	a4,0(a5)
    1822:	d779                	beqz	a4,17f0 <strlen+0x18>
    1824:	0017c703          	lbu	a4,1(a5)
    1828:	0785                	addi	a5,a5,1
    182a:	d379                	beqz	a4,17f0 <strlen+0x18>
    182c:	0017c703          	lbu	a4,1(a5)
    1830:	0785                	addi	a5,a5,1
    1832:	fb6d                	bnez	a4,1824 <strlen+0x4c>
    1834:	bf75                	j	17f0 <strlen+0x18>

0000000000001836 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1836:	00757713          	andi	a4,a0,7
{
    183a:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    183c:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1840:	cb19                	beqz	a4,1856 <memchr+0x20>
    1842:	ce25                	beqz	a2,18ba <memchr+0x84>
    1844:	0007c703          	lbu	a4,0(a5)
    1848:	04b70e63          	beq	a4,a1,18a4 <memchr+0x6e>
    184c:	0785                	addi	a5,a5,1
    184e:	0077f713          	andi	a4,a5,7
    1852:	167d                	addi	a2,a2,-1
    1854:	f77d                	bnez	a4,1842 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1856:	4501                	li	a0,0
    if (n && *s != c)
    1858:	c235                	beqz	a2,18bc <memchr+0x86>
    185a:	0007c703          	lbu	a4,0(a5)
    185e:	04b70363          	beq	a4,a1,18a4 <memchr+0x6e>
        size_t k = ONES * c;
    1862:	00000517          	auipc	a0,0x0
    1866:	62653503          	ld	a0,1574(a0) # 1e88 <__clone+0x94>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    186a:	471d                	li	a4,7
        size_t k = ONES * c;
    186c:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1870:	02c77a63          	bgeu	a4,a2,18a4 <memchr+0x6e>
    1874:	00000897          	auipc	a7,0x0
    1878:	6048b883          	ld	a7,1540(a7) # 1e78 <__clone+0x84>
    187c:	00000817          	auipc	a6,0x0
    1880:	60483803          	ld	a6,1540(a6) # 1e80 <__clone+0x8c>
    1884:	431d                	li	t1,7
    1886:	a029                	j	1890 <memchr+0x5a>
    1888:	1661                	addi	a2,a2,-8
    188a:	07a1                	addi	a5,a5,8
    188c:	02c37963          	bgeu	t1,a2,18be <memchr+0x88>
    1890:	6398                	ld	a4,0(a5)
    1892:	8f29                	xor	a4,a4,a0
    1894:	011706b3          	add	a3,a4,a7
    1898:	fff74713          	not	a4,a4
    189c:	8f75                	and	a4,a4,a3
    189e:	01077733          	and	a4,a4,a6
    18a2:	d37d                	beqz	a4,1888 <memchr+0x52>
    18a4:	853e                	mv	a0,a5
    18a6:	97b2                	add	a5,a5,a2
    18a8:	a021                	j	18b0 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    18aa:	0505                	addi	a0,a0,1
    18ac:	00f50763          	beq	a0,a5,18ba <memchr+0x84>
    18b0:	00054703          	lbu	a4,0(a0)
    18b4:	feb71be3          	bne	a4,a1,18aa <memchr+0x74>
    18b8:	8082                	ret
    return n ? (void *)s : 0;
    18ba:	4501                	li	a0,0
}
    18bc:	8082                	ret
    return n ? (void *)s : 0;
    18be:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    18c0:	f275                	bnez	a2,18a4 <memchr+0x6e>
}
    18c2:	8082                	ret

00000000000018c4 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    18c4:	1101                	addi	sp,sp,-32
    18c6:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    18c8:	862e                	mv	a2,a1
{
    18ca:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    18cc:	4581                	li	a1,0
{
    18ce:	e426                	sd	s1,8(sp)
    18d0:	ec06                	sd	ra,24(sp)
    18d2:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    18d4:	f63ff0ef          	jal	ra,1836 <memchr>
    return p ? p - s : n;
    18d8:	c519                	beqz	a0,18e6 <strnlen+0x22>
}
    18da:	60e2                	ld	ra,24(sp)
    18dc:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    18de:	8d05                	sub	a0,a0,s1
}
    18e0:	64a2                	ld	s1,8(sp)
    18e2:	6105                	addi	sp,sp,32
    18e4:	8082                	ret
    18e6:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    18e8:	8522                	mv	a0,s0
}
    18ea:	6442                	ld	s0,16(sp)
    18ec:	64a2                	ld	s1,8(sp)
    18ee:	6105                	addi	sp,sp,32
    18f0:	8082                	ret

00000000000018f2 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    18f2:	00b547b3          	xor	a5,a0,a1
    18f6:	8b9d                	andi	a5,a5,7
    18f8:	eb95                	bnez	a5,192c <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    18fa:	0075f793          	andi	a5,a1,7
    18fe:	e7b1                	bnez	a5,194a <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1900:	6198                	ld	a4,0(a1)
    1902:	00000617          	auipc	a2,0x0
    1906:	57663603          	ld	a2,1398(a2) # 1e78 <__clone+0x84>
    190a:	00000817          	auipc	a6,0x0
    190e:	57683803          	ld	a6,1398(a6) # 1e80 <__clone+0x8c>
    1912:	a029                	j	191c <strcpy+0x2a>
    1914:	e118                	sd	a4,0(a0)
    1916:	6598                	ld	a4,8(a1)
    1918:	05a1                	addi	a1,a1,8
    191a:	0521                	addi	a0,a0,8
    191c:	00c707b3          	add	a5,a4,a2
    1920:	fff74693          	not	a3,a4
    1924:	8ff5                	and	a5,a5,a3
    1926:	0107f7b3          	and	a5,a5,a6
    192a:	d7ed                	beqz	a5,1914 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    192c:	0005c783          	lbu	a5,0(a1)
    1930:	00f50023          	sb	a5,0(a0)
    1934:	c785                	beqz	a5,195c <strcpy+0x6a>
    1936:	0015c783          	lbu	a5,1(a1)
    193a:	0505                	addi	a0,a0,1
    193c:	0585                	addi	a1,a1,1
    193e:	00f50023          	sb	a5,0(a0)
    1942:	fbf5                	bnez	a5,1936 <strcpy+0x44>
        ;
    return d;
}
    1944:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1946:	0505                	addi	a0,a0,1
    1948:	df45                	beqz	a4,1900 <strcpy+0xe>
            if (!(*d = *s))
    194a:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    194e:	0585                	addi	a1,a1,1
    1950:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1954:	00f50023          	sb	a5,0(a0)
    1958:	f7fd                	bnez	a5,1946 <strcpy+0x54>
}
    195a:	8082                	ret
    195c:	8082                	ret

000000000000195e <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    195e:	00b547b3          	xor	a5,a0,a1
    1962:	8b9d                	andi	a5,a5,7
    1964:	1a079863          	bnez	a5,1b14 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1968:	0075f793          	andi	a5,a1,7
    196c:	16078463          	beqz	a5,1ad4 <strncpy+0x176>
    1970:	ea01                	bnez	a2,1980 <strncpy+0x22>
    1972:	a421                	j	1b7a <strncpy+0x21c>
    1974:	167d                	addi	a2,a2,-1
    1976:	0505                	addi	a0,a0,1
    1978:	14070e63          	beqz	a4,1ad4 <strncpy+0x176>
    197c:	1a060863          	beqz	a2,1b2c <strncpy+0x1ce>
    1980:	0005c783          	lbu	a5,0(a1)
    1984:	0585                	addi	a1,a1,1
    1986:	0075f713          	andi	a4,a1,7
    198a:	00f50023          	sb	a5,0(a0)
    198e:	f3fd                	bnez	a5,1974 <strncpy+0x16>
    1990:	4805                	li	a6,1
    1992:	1a061863          	bnez	a2,1b42 <strncpy+0x1e4>
    1996:	40a007b3          	neg	a5,a0
    199a:	8b9d                	andi	a5,a5,7
    199c:	4681                	li	a3,0
    199e:	18061a63          	bnez	a2,1b32 <strncpy+0x1d4>
    19a2:	00778713          	addi	a4,a5,7
    19a6:	45ad                	li	a1,11
    19a8:	18b76363          	bltu	a4,a1,1b2e <strncpy+0x1d0>
    19ac:	1ae6eb63          	bltu	a3,a4,1b62 <strncpy+0x204>
    19b0:	1a078363          	beqz	a5,1b56 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    19b4:	00050023          	sb	zero,0(a0)
    19b8:	4685                	li	a3,1
    19ba:	00150713          	addi	a4,a0,1
    19be:	18d78f63          	beq	a5,a3,1b5c <strncpy+0x1fe>
    19c2:	000500a3          	sb	zero,1(a0)
    19c6:	4689                	li	a3,2
    19c8:	00250713          	addi	a4,a0,2
    19cc:	18d78e63          	beq	a5,a3,1b68 <strncpy+0x20a>
    19d0:	00050123          	sb	zero,2(a0)
    19d4:	468d                	li	a3,3
    19d6:	00350713          	addi	a4,a0,3
    19da:	16d78c63          	beq	a5,a3,1b52 <strncpy+0x1f4>
    19de:	000501a3          	sb	zero,3(a0)
    19e2:	4691                	li	a3,4
    19e4:	00450713          	addi	a4,a0,4
    19e8:	18d78263          	beq	a5,a3,1b6c <strncpy+0x20e>
    19ec:	00050223          	sb	zero,4(a0)
    19f0:	4695                	li	a3,5
    19f2:	00550713          	addi	a4,a0,5
    19f6:	16d78d63          	beq	a5,a3,1b70 <strncpy+0x212>
    19fa:	000502a3          	sb	zero,5(a0)
    19fe:	469d                	li	a3,7
    1a00:	00650713          	addi	a4,a0,6
    1a04:	16d79863          	bne	a5,a3,1b74 <strncpy+0x216>
    1a08:	00750713          	addi	a4,a0,7
    1a0c:	00050323          	sb	zero,6(a0)
    1a10:	40f80833          	sub	a6,a6,a5
    1a14:	ff887593          	andi	a1,a6,-8
    1a18:	97aa                	add	a5,a5,a0
    1a1a:	95be                	add	a1,a1,a5
    1a1c:	0007b023          	sd	zero,0(a5)
    1a20:	07a1                	addi	a5,a5,8
    1a22:	feb79de3          	bne	a5,a1,1a1c <strncpy+0xbe>
    1a26:	ff887593          	andi	a1,a6,-8
    1a2a:	9ead                	addw	a3,a3,a1
    1a2c:	00b707b3          	add	a5,a4,a1
    1a30:	12b80863          	beq	a6,a1,1b60 <strncpy+0x202>
    1a34:	00078023          	sb	zero,0(a5)
    1a38:	0016871b          	addiw	a4,a3,1
    1a3c:	0ec77863          	bgeu	a4,a2,1b2c <strncpy+0x1ce>
    1a40:	000780a3          	sb	zero,1(a5)
    1a44:	0026871b          	addiw	a4,a3,2
    1a48:	0ec77263          	bgeu	a4,a2,1b2c <strncpy+0x1ce>
    1a4c:	00078123          	sb	zero,2(a5)
    1a50:	0036871b          	addiw	a4,a3,3
    1a54:	0cc77c63          	bgeu	a4,a2,1b2c <strncpy+0x1ce>
    1a58:	000781a3          	sb	zero,3(a5)
    1a5c:	0046871b          	addiw	a4,a3,4
    1a60:	0cc77663          	bgeu	a4,a2,1b2c <strncpy+0x1ce>
    1a64:	00078223          	sb	zero,4(a5)
    1a68:	0056871b          	addiw	a4,a3,5
    1a6c:	0cc77063          	bgeu	a4,a2,1b2c <strncpy+0x1ce>
    1a70:	000782a3          	sb	zero,5(a5)
    1a74:	0066871b          	addiw	a4,a3,6
    1a78:	0ac77a63          	bgeu	a4,a2,1b2c <strncpy+0x1ce>
    1a7c:	00078323          	sb	zero,6(a5)
    1a80:	0076871b          	addiw	a4,a3,7
    1a84:	0ac77463          	bgeu	a4,a2,1b2c <strncpy+0x1ce>
    1a88:	000783a3          	sb	zero,7(a5)
    1a8c:	0086871b          	addiw	a4,a3,8
    1a90:	08c77e63          	bgeu	a4,a2,1b2c <strncpy+0x1ce>
    1a94:	00078423          	sb	zero,8(a5)
    1a98:	0096871b          	addiw	a4,a3,9
    1a9c:	08c77863          	bgeu	a4,a2,1b2c <strncpy+0x1ce>
    1aa0:	000784a3          	sb	zero,9(a5)
    1aa4:	00a6871b          	addiw	a4,a3,10
    1aa8:	08c77263          	bgeu	a4,a2,1b2c <strncpy+0x1ce>
    1aac:	00078523          	sb	zero,10(a5)
    1ab0:	00b6871b          	addiw	a4,a3,11
    1ab4:	06c77c63          	bgeu	a4,a2,1b2c <strncpy+0x1ce>
    1ab8:	000785a3          	sb	zero,11(a5)
    1abc:	00c6871b          	addiw	a4,a3,12
    1ac0:	06c77663          	bgeu	a4,a2,1b2c <strncpy+0x1ce>
    1ac4:	00078623          	sb	zero,12(a5)
    1ac8:	26b5                	addiw	a3,a3,13
    1aca:	06c6f163          	bgeu	a3,a2,1b2c <strncpy+0x1ce>
    1ace:	000786a3          	sb	zero,13(a5)
    1ad2:	8082                	ret
            ;
        if (!n || !*s)
    1ad4:	c645                	beqz	a2,1b7c <strncpy+0x21e>
    1ad6:	0005c783          	lbu	a5,0(a1)
    1ada:	ea078be3          	beqz	a5,1990 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ade:	479d                	li	a5,7
    1ae0:	02c7ff63          	bgeu	a5,a2,1b1e <strncpy+0x1c0>
    1ae4:	00000897          	auipc	a7,0x0
    1ae8:	3948b883          	ld	a7,916(a7) # 1e78 <__clone+0x84>
    1aec:	00000817          	auipc	a6,0x0
    1af0:	39483803          	ld	a6,916(a6) # 1e80 <__clone+0x8c>
    1af4:	431d                	li	t1,7
    1af6:	6198                	ld	a4,0(a1)
    1af8:	011707b3          	add	a5,a4,a7
    1afc:	fff74693          	not	a3,a4
    1b00:	8ff5                	and	a5,a5,a3
    1b02:	0107f7b3          	and	a5,a5,a6
    1b06:	ef81                	bnez	a5,1b1e <strncpy+0x1c0>
            *wd = *ws;
    1b08:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b0a:	1661                	addi	a2,a2,-8
    1b0c:	05a1                	addi	a1,a1,8
    1b0e:	0521                	addi	a0,a0,8
    1b10:	fec363e3          	bltu	t1,a2,1af6 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b14:	e609                	bnez	a2,1b1e <strncpy+0x1c0>
    1b16:	a08d                	j	1b78 <strncpy+0x21a>
    1b18:	167d                	addi	a2,a2,-1
    1b1a:	0505                	addi	a0,a0,1
    1b1c:	ca01                	beqz	a2,1b2c <strncpy+0x1ce>
    1b1e:	0005c783          	lbu	a5,0(a1)
    1b22:	0585                	addi	a1,a1,1
    1b24:	00f50023          	sb	a5,0(a0)
    1b28:	fbe5                	bnez	a5,1b18 <strncpy+0x1ba>
        ;
tail:
    1b2a:	b59d                	j	1990 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1b2c:	8082                	ret
    1b2e:	472d                	li	a4,11
    1b30:	bdb5                	j	19ac <strncpy+0x4e>
    1b32:	00778713          	addi	a4,a5,7
    1b36:	45ad                	li	a1,11
    1b38:	fff60693          	addi	a3,a2,-1
    1b3c:	e6b778e3          	bgeu	a4,a1,19ac <strncpy+0x4e>
    1b40:	b7fd                	j	1b2e <strncpy+0x1d0>
    1b42:	40a007b3          	neg	a5,a0
    1b46:	8832                	mv	a6,a2
    1b48:	8b9d                	andi	a5,a5,7
    1b4a:	4681                	li	a3,0
    1b4c:	e4060be3          	beqz	a2,19a2 <strncpy+0x44>
    1b50:	b7cd                	j	1b32 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b52:	468d                	li	a3,3
    1b54:	bd75                	j	1a10 <strncpy+0xb2>
    1b56:	872a                	mv	a4,a0
    1b58:	4681                	li	a3,0
    1b5a:	bd5d                	j	1a10 <strncpy+0xb2>
    1b5c:	4685                	li	a3,1
    1b5e:	bd4d                	j	1a10 <strncpy+0xb2>
    1b60:	8082                	ret
    1b62:	87aa                	mv	a5,a0
    1b64:	4681                	li	a3,0
    1b66:	b5f9                	j	1a34 <strncpy+0xd6>
    1b68:	4689                	li	a3,2
    1b6a:	b55d                	j	1a10 <strncpy+0xb2>
    1b6c:	4691                	li	a3,4
    1b6e:	b54d                	j	1a10 <strncpy+0xb2>
    1b70:	4695                	li	a3,5
    1b72:	bd79                	j	1a10 <strncpy+0xb2>
    1b74:	4699                	li	a3,6
    1b76:	bd69                	j	1a10 <strncpy+0xb2>
    1b78:	8082                	ret
    1b7a:	8082                	ret
    1b7c:	8082                	ret

0000000000001b7e <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1b7e:	87aa                	mv	a5,a0
    1b80:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1b82:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1b86:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1b8a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1b8c:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1b8e:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1b92:	2501                	sext.w	a0,a0
    1b94:	8082                	ret

0000000000001b96 <openat>:
    register long a7 __asm__("a7") = n;
    1b96:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1b9a:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1b9e:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1ba2:	2501                	sext.w	a0,a0
    1ba4:	8082                	ret

0000000000001ba6 <close>:
    register long a7 __asm__("a7") = n;
    1ba6:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1baa:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1bae:	2501                	sext.w	a0,a0
    1bb0:	8082                	ret

0000000000001bb2 <read>:
    register long a7 __asm__("a7") = n;
    1bb2:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1bb6:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1bba:	8082                	ret

0000000000001bbc <write>:
    register long a7 __asm__("a7") = n;
    1bbc:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1bc0:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1bc4:	8082                	ret

0000000000001bc6 <getpid>:
    register long a7 __asm__("a7") = n;
    1bc6:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1bca:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1bce:	2501                	sext.w	a0,a0
    1bd0:	8082                	ret

0000000000001bd2 <getppid>:
    register long a7 __asm__("a7") = n;
    1bd2:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1bd6:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1bda:	2501                	sext.w	a0,a0
    1bdc:	8082                	ret

0000000000001bde <sched_yield>:
    register long a7 __asm__("a7") = n;
    1bde:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1be2:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1be6:	2501                	sext.w	a0,a0
    1be8:	8082                	ret

0000000000001bea <fork>:
    register long a7 __asm__("a7") = n;
    1bea:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1bee:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1bf0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1bf2:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1bf6:	2501                	sext.w	a0,a0
    1bf8:	8082                	ret

0000000000001bfa <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1bfa:	85b2                	mv	a1,a2
    1bfc:	863a                	mv	a2,a4
    if (stack)
    1bfe:	c191                	beqz	a1,1c02 <clone+0x8>
	stack += stack_size;
    1c00:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c02:	4781                	li	a5,0
    1c04:	4701                	li	a4,0
    1c06:	4681                	li	a3,0
    1c08:	2601                	sext.w	a2,a2
    1c0a:	a2ed                	j	1df4 <__clone>

0000000000001c0c <exit>:
    register long a7 __asm__("a7") = n;
    1c0c:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c10:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c14:	8082                	ret

0000000000001c16 <waitpid>:
    register long a7 __asm__("a7") = n;
    1c16:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c1a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c1c:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c20:	2501                	sext.w	a0,a0
    1c22:	8082                	ret

0000000000001c24 <exec>:
    register long a7 __asm__("a7") = n;
    1c24:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1c28:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1c2c:	2501                	sext.w	a0,a0
    1c2e:	8082                	ret

0000000000001c30 <execve>:
    register long a7 __asm__("a7") = n;
    1c30:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c34:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1c38:	2501                	sext.w	a0,a0
    1c3a:	8082                	ret

0000000000001c3c <times>:
    register long a7 __asm__("a7") = n;
    1c3c:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1c40:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1c44:	2501                	sext.w	a0,a0
    1c46:	8082                	ret

0000000000001c48 <get_time>:

int64 get_time()
{
    1c48:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1c4a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1c4e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1c50:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c52:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1c56:	2501                	sext.w	a0,a0
    1c58:	ed09                	bnez	a0,1c72 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1c5a:	67a2                	ld	a5,8(sp)
    1c5c:	3e800713          	li	a4,1000
    1c60:	00015503          	lhu	a0,0(sp)
    1c64:	02e7d7b3          	divu	a5,a5,a4
    1c68:	02e50533          	mul	a0,a0,a4
    1c6c:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1c6e:	0141                	addi	sp,sp,16
    1c70:	8082                	ret
        return -1;
    1c72:	557d                	li	a0,-1
    1c74:	bfed                	j	1c6e <get_time+0x26>

0000000000001c76 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1c76:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c7a:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1c7e:	2501                	sext.w	a0,a0
    1c80:	8082                	ret

0000000000001c82 <time>:
    register long a7 __asm__("a7") = n;
    1c82:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1c86:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1c8a:	2501                	sext.w	a0,a0
    1c8c:	8082                	ret

0000000000001c8e <sleep>:

int sleep(unsigned long long time)
{
    1c8e:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1c90:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1c92:	850a                	mv	a0,sp
    1c94:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1c96:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1c9a:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c9c:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1ca0:	e501                	bnez	a0,1ca8 <sleep+0x1a>
    return 0;
    1ca2:	4501                	li	a0,0
}
    1ca4:	0141                	addi	sp,sp,16
    1ca6:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1ca8:	4502                	lw	a0,0(sp)
}
    1caa:	0141                	addi	sp,sp,16
    1cac:	8082                	ret

0000000000001cae <set_priority>:
    register long a7 __asm__("a7") = n;
    1cae:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1cb2:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1cb6:	2501                	sext.w	a0,a0
    1cb8:	8082                	ret

0000000000001cba <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1cba:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1cbe:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1cc2:	8082                	ret

0000000000001cc4 <munmap>:
    register long a7 __asm__("a7") = n;
    1cc4:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cc8:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1ccc:	2501                	sext.w	a0,a0
    1cce:	8082                	ret

0000000000001cd0 <wait>:

int wait(int *code)
{
    1cd0:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1cd2:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1cd6:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1cd8:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1cda:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cdc:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1ce0:	2501                	sext.w	a0,a0
    1ce2:	8082                	ret

0000000000001ce4 <spawn>:
    register long a7 __asm__("a7") = n;
    1ce4:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ce8:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1cec:	2501                	sext.w	a0,a0
    1cee:	8082                	ret

0000000000001cf0 <mailread>:
    register long a7 __asm__("a7") = n;
    1cf0:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cf4:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1cf8:	2501                	sext.w	a0,a0
    1cfa:	8082                	ret

0000000000001cfc <mailwrite>:
    register long a7 __asm__("a7") = n;
    1cfc:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d00:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d04:	2501                	sext.w	a0,a0
    1d06:	8082                	ret

0000000000001d08 <fstat>:
    register long a7 __asm__("a7") = n;
    1d08:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d0c:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d10:	2501                	sext.w	a0,a0
    1d12:	8082                	ret

0000000000001d14 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d14:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d16:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d1a:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d1c:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d20:	2501                	sext.w	a0,a0
    1d22:	8082                	ret

0000000000001d24 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1d24:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d26:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1d2a:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d2c:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1d30:	2501                	sext.w	a0,a0
    1d32:	8082                	ret

0000000000001d34 <link>:

int link(char *old_path, char *new_path)
{
    1d34:	87aa                	mv	a5,a0
    1d36:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1d38:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1d3c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d40:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1d42:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1d46:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d48:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1d4c:	2501                	sext.w	a0,a0
    1d4e:	8082                	ret

0000000000001d50 <unlink>:

int unlink(char *path)
{
    1d50:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d52:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1d56:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1d5a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d5c:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1d60:	2501                	sext.w	a0,a0
    1d62:	8082                	ret

0000000000001d64 <uname>:
    register long a7 __asm__("a7") = n;
    1d64:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1d68:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1d6c:	2501                	sext.w	a0,a0
    1d6e:	8082                	ret

0000000000001d70 <brk>:
    register long a7 __asm__("a7") = n;
    1d70:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1d74:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1d78:	2501                	sext.w	a0,a0
    1d7a:	8082                	ret

0000000000001d7c <getcwd>:
    register long a7 __asm__("a7") = n;
    1d7c:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d7e:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1d82:	8082                	ret

0000000000001d84 <chdir>:
    register long a7 __asm__("a7") = n;
    1d84:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1d88:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1d8c:	2501                	sext.w	a0,a0
    1d8e:	8082                	ret

0000000000001d90 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1d90:	862e                	mv	a2,a1
    1d92:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1d94:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d96:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1d9a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d9e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1da0:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da2:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1da6:	2501                	sext.w	a0,a0
    1da8:	8082                	ret

0000000000001daa <getdents>:
    register long a7 __asm__("a7") = n;
    1daa:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dae:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1db2:	2501                	sext.w	a0,a0
    1db4:	8082                	ret

0000000000001db6 <pipe>:
    register long a7 __asm__("a7") = n;
    1db6:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1dba:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dbc:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1dc0:	2501                	sext.w	a0,a0
    1dc2:	8082                	ret

0000000000001dc4 <dup>:
    register long a7 __asm__("a7") = n;
    1dc4:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1dc6:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <dup2>:
    register long a7 __asm__("a7") = n;
    1dce:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1dd0:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd2:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <mount>:
    register long a7 __asm__("a7") = n;
    1dda:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dde:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1de2:	2501                	sext.w	a0,a0
    1de4:	8082                	ret

0000000000001de6 <umount>:
    register long a7 __asm__("a7") = n;
    1de6:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1dea:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dec:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1df4:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1df6:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1df8:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1dfa:	8532                	mv	a0,a2
	mv a2, a4
    1dfc:	863a                	mv	a2,a4
	mv a3, a5
    1dfe:	86be                	mv	a3,a5
	mv a4, a6
    1e00:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e02:	0dc00893          	li	a7,220
	ecall
    1e06:	00000073          	ecall

	beqz a0, 1f
    1e0a:	c111                	beqz	a0,1e0e <__clone+0x1a>
	# Parent
	ret
    1e0c:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e0e:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e10:	6522                	ld	a0,8(sp)
	jalr a1
    1e12:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e14:	05d00893          	li	a7,93
	ecall
    1e18:	00000073          	ecall
