
/home/lmq/lmq/cscc/xv6-k210/test/build/riscv64/getcwd:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a075                	j	10ae <__start_main>

0000000000001004 <test_getcwd>:
 * 测试通过时输出：
 * "getcwd OK."
 * 测试失败时输出：
 * "getcwd ERROR."
 */
void test_getcwd(void){
    1004:	7175                	addi	sp,sp,-144
   TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	e6250513          	addi	a0,a0,-414 # 1e68 <__clone+0x2a>
void test_getcwd(void){
    100e:	e506                	sd	ra,136(sp)
   TEST_START(__func__);
    1010:	29c000ef          	jal	ra,12ac <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	edc50513          	addi	a0,a0,-292 # 1ef0 <__func__.1192>
    101c:	290000ef          	jal	ra,12ac <puts>
    1020:	00001517          	auipc	a0,0x1
    1024:	e6050513          	addi	a0,a0,-416 # 1e80 <__clone+0x42>
    1028:	284000ef          	jal	ra,12ac <puts>
    char *cwd = NULL;
    char buf[128] = {0};
    cwd = getcwd(buf, 128);
    102c:	08000593          	li	a1,128
    1030:	850a                	mv	a0,sp
    char buf[128] = {0};
    1032:	e002                	sd	zero,0(sp)
    1034:	e402                	sd	zero,8(sp)
    1036:	e802                	sd	zero,16(sp)
    1038:	ec02                	sd	zero,24(sp)
    103a:	f002                	sd	zero,32(sp)
    103c:	f402                	sd	zero,40(sp)
    103e:	f802                	sd	zero,48(sp)
    1040:	fc02                	sd	zero,56(sp)
    1042:	e082                	sd	zero,64(sp)
    1044:	e482                	sd	zero,72(sp)
    1046:	e882                	sd	zero,80(sp)
    1048:	ec82                	sd	zero,88(sp)
    104a:	f082                	sd	zero,96(sp)
    104c:	f482                	sd	zero,104(sp)
    104e:	f882                	sd	zero,112(sp)
    1050:	fc82                	sd	zero,120(sp)
    cwd = getcwd(buf, 128);
    1052:	575000ef          	jal	ra,1dc6 <getcwd>
    if(cwd != NULL) printf("getcwd: %s successfully!\n", buf);
    1056:	cd0d                	beqz	a0,1090 <test_getcwd+0x8c>
    1058:	858a                	mv	a1,sp
    105a:	00001517          	auipc	a0,0x1
    105e:	e3650513          	addi	a0,a0,-458 # 1e90 <__clone+0x52>
    1062:	26c000ef          	jal	ra,12ce <printf>
    else printf("getcwd ERROR.\n");
   TEST_END(__func__);
    1066:	00001517          	auipc	a0,0x1
    106a:	e5a50513          	addi	a0,a0,-422 # 1ec0 <__clone+0x82>
    106e:	23e000ef          	jal	ra,12ac <puts>
    1072:	00001517          	auipc	a0,0x1
    1076:	e7e50513          	addi	a0,a0,-386 # 1ef0 <__func__.1192>
    107a:	232000ef          	jal	ra,12ac <puts>
    107e:	00001517          	auipc	a0,0x1
    1082:	e0250513          	addi	a0,a0,-510 # 1e80 <__clone+0x42>
    1086:	226000ef          	jal	ra,12ac <puts>
}
    108a:	60aa                	ld	ra,136(sp)
    108c:	6149                	addi	sp,sp,144
    108e:	8082                	ret
    else printf("getcwd ERROR.\n");
    1090:	00001517          	auipc	a0,0x1
    1094:	e2050513          	addi	a0,a0,-480 # 1eb0 <__clone+0x72>
    1098:	236000ef          	jal	ra,12ce <printf>
    109c:	b7e9                	j	1066 <test_getcwd+0x62>

000000000000109e <main>:

int main(void){
    109e:	1141                	addi	sp,sp,-16
    10a0:	e406                	sd	ra,8(sp)
    test_getcwd();
    10a2:	f63ff0ef          	jal	ra,1004 <test_getcwd>
    return 0;
}
    10a6:	60a2                	ld	ra,8(sp)
    10a8:	4501                	li	a0,0
    10aa:	0141                	addi	sp,sp,16
    10ac:	8082                	ret

00000000000010ae <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ae:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10b0:	4108                	lw	a0,0(a0)
{
    10b2:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10b4:	05a1                	addi	a1,a1,8
{
    10b6:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10b8:	fe7ff0ef          	jal	ra,109e <main>
    10bc:	39b000ef          	jal	ra,1c56 <exit>
	return 0;
}
    10c0:	60a2                	ld	ra,8(sp)
    10c2:	4501                	li	a0,0
    10c4:	0141                	addi	sp,sp,16
    10c6:	8082                	ret

00000000000010c8 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10c8:	7179                	addi	sp,sp,-48
    10ca:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10cc:	12054b63          	bltz	a0,1202 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10d0:	02b577bb          	remuw	a5,a0,a1
    10d4:	00001697          	auipc	a3,0x1
    10d8:	e2c68693          	addi	a3,a3,-468 # 1f00 <digits>
    buf[16] = 0;
    10dc:	00010c23          	sb	zero,24(sp)
    i = 15;
    10e0:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    10e4:	1782                	slli	a5,a5,0x20
    10e6:	9381                	srli	a5,a5,0x20
    10e8:	97b6                	add	a5,a5,a3
    10ea:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10ee:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10f2:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10f6:	16b56263          	bltu	a0,a1,125a <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    10fa:	02e8763b          	remuw	a2,a6,a4
    10fe:	1602                	slli	a2,a2,0x20
    1100:	9201                	srli	a2,a2,0x20
    1102:	9636                	add	a2,a2,a3
    1104:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1108:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    110c:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1110:	12e86963          	bltu	a6,a4,1242 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    1114:	02e5f63b          	remuw	a2,a1,a4
    1118:	1602                	slli	a2,a2,0x20
    111a:	9201                	srli	a2,a2,0x20
    111c:	9636                	add	a2,a2,a3
    111e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1122:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1126:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    112a:	10e5ef63          	bltu	a1,a4,1248 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    112e:	02e8763b          	remuw	a2,a6,a4
    1132:	1602                	slli	a2,a2,0x20
    1134:	9201                	srli	a2,a2,0x20
    1136:	9636                	add	a2,a2,a3
    1138:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    113c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1140:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1144:	10e86563          	bltu	a6,a4,124e <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    1148:	02e5f63b          	remuw	a2,a1,a4
    114c:	1602                	slli	a2,a2,0x20
    114e:	9201                	srli	a2,a2,0x20
    1150:	9636                	add	a2,a2,a3
    1152:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1156:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    115a:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    115e:	0ee5eb63          	bltu	a1,a4,1254 <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    1162:	02e8763b          	remuw	a2,a6,a4
    1166:	1602                	slli	a2,a2,0x20
    1168:	9201                	srli	a2,a2,0x20
    116a:	9636                	add	a2,a2,a3
    116c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1170:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1174:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1178:	0ce86263          	bltu	a6,a4,123c <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    117c:	02e5f63b          	remuw	a2,a1,a4
    1180:	1602                	slli	a2,a2,0x20
    1182:	9201                	srli	a2,a2,0x20
    1184:	9636                	add	a2,a2,a3
    1186:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    118a:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    118e:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1192:	0ce5e663          	bltu	a1,a4,125e <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    1196:	02e8763b          	remuw	a2,a6,a4
    119a:	1602                	slli	a2,a2,0x20
    119c:	9201                	srli	a2,a2,0x20
    119e:	9636                	add	a2,a2,a3
    11a0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11a4:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11a8:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11ac:	0ae86c63          	bltu	a6,a4,1264 <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    11b0:	02e5f63b          	remuw	a2,a1,a4
    11b4:	1602                	slli	a2,a2,0x20
    11b6:	9201                	srli	a2,a2,0x20
    11b8:	9636                	add	a2,a2,a3
    11ba:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11be:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11c2:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11c6:	0ae5e263          	bltu	a1,a4,126a <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    11ca:	1782                	slli	a5,a5,0x20
    11cc:	9381                	srli	a5,a5,0x20
    11ce:	97b6                	add	a5,a5,a3
    11d0:	0007c703          	lbu	a4,0(a5)
    11d4:	4599                	li	a1,6
    11d6:	4795                	li	a5,5
    11d8:	00e10723          	sb	a4,14(sp)

    if (sign)
    11dc:	00055963          	bgez	a0,11ee <printint.constprop.0+0x126>
        buf[i--] = '-';
    11e0:	1018                	addi	a4,sp,32
    11e2:	973e                	add	a4,a4,a5
    11e4:	02d00693          	li	a3,45
    11e8:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    11ec:	85be                	mv	a1,a5
    write(f, s, l);
    11ee:	003c                	addi	a5,sp,8
    11f0:	4641                	li	a2,16
    11f2:	9e0d                	subw	a2,a2,a1
    11f4:	4505                	li	a0,1
    11f6:	95be                	add	a1,a1,a5
    11f8:	20f000ef          	jal	ra,1c06 <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11fc:	70a2                	ld	ra,40(sp)
    11fe:	6145                	addi	sp,sp,48
    1200:	8082                	ret
        x = -xx;
    1202:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1206:	02b677bb          	remuw	a5,a2,a1
    120a:	00001697          	auipc	a3,0x1
    120e:	cf668693          	addi	a3,a3,-778 # 1f00 <digits>
    buf[16] = 0;
    1212:	00010c23          	sb	zero,24(sp)
    i = 15;
    1216:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    121a:	1782                	slli	a5,a5,0x20
    121c:	9381                	srli	a5,a5,0x20
    121e:	97b6                	add	a5,a5,a3
    1220:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1224:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1228:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    122c:	ecb677e3          	bgeu	a2,a1,10fa <printint.constprop.0+0x32>
        buf[i--] = '-';
    1230:	02d00793          	li	a5,45
    1234:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1238:	45b9                	li	a1,14
    123a:	bf55                	j	11ee <printint.constprop.0+0x126>
    123c:	47a5                	li	a5,9
    123e:	45a9                	li	a1,10
    1240:	bf71                	j	11dc <printint.constprop.0+0x114>
    1242:	47b5                	li	a5,13
    1244:	45b9                	li	a1,14
    1246:	bf59                	j	11dc <printint.constprop.0+0x114>
    1248:	47b1                	li	a5,12
    124a:	45b5                	li	a1,13
    124c:	bf41                	j	11dc <printint.constprop.0+0x114>
    124e:	47ad                	li	a5,11
    1250:	45b1                	li	a1,12
    1252:	b769                	j	11dc <printint.constprop.0+0x114>
    1254:	47a9                	li	a5,10
    1256:	45ad                	li	a1,11
    1258:	b751                	j	11dc <printint.constprop.0+0x114>
    i = 15;
    125a:	45bd                	li	a1,15
    125c:	bf49                	j	11ee <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    125e:	47a1                	li	a5,8
    1260:	45a5                	li	a1,9
    1262:	bfad                	j	11dc <printint.constprop.0+0x114>
    1264:	479d                	li	a5,7
    1266:	45a1                	li	a1,8
    1268:	bf95                	j	11dc <printint.constprop.0+0x114>
    126a:	4799                	li	a5,6
    126c:	459d                	li	a1,7
    126e:	b7bd                	j	11dc <printint.constprop.0+0x114>

0000000000001270 <getchar>:
{
    1270:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1272:	00f10593          	addi	a1,sp,15
    1276:	4605                	li	a2,1
    1278:	4501                	li	a0,0
{
    127a:	ec06                	sd	ra,24(sp)
    char byte = 0;
    127c:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1280:	17d000ef          	jal	ra,1bfc <read>
}
    1284:	60e2                	ld	ra,24(sp)
    1286:	00f14503          	lbu	a0,15(sp)
    128a:	6105                	addi	sp,sp,32
    128c:	8082                	ret

000000000000128e <putchar>:
{
    128e:	1101                	addi	sp,sp,-32
    1290:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1292:	00f10593          	addi	a1,sp,15
    1296:	4605                	li	a2,1
    1298:	4505                	li	a0,1
{
    129a:	ec06                	sd	ra,24(sp)
    char byte = c;
    129c:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12a0:	167000ef          	jal	ra,1c06 <write>
}
    12a4:	60e2                	ld	ra,24(sp)
    12a6:	2501                	sext.w	a0,a0
    12a8:	6105                	addi	sp,sp,32
    12aa:	8082                	ret

00000000000012ac <puts>:
{
    12ac:	1141                	addi	sp,sp,-16
    12ae:	e406                	sd	ra,8(sp)
    12b0:	e022                	sd	s0,0(sp)
    12b2:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12b4:	56e000ef          	jal	ra,1822 <strlen>
    12b8:	862a                	mv	a2,a0
    12ba:	85a2                	mv	a1,s0
    12bc:	4505                	li	a0,1
    12be:	149000ef          	jal	ra,1c06 <write>
}
    12c2:	60a2                	ld	ra,8(sp)
    12c4:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12c6:	957d                	srai	a0,a0,0x3f
    return r;
    12c8:	2501                	sext.w	a0,a0
}
    12ca:	0141                	addi	sp,sp,16
    12cc:	8082                	ret

00000000000012ce <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12ce:	7171                	addi	sp,sp,-176
    12d0:	fc56                	sd	s5,56(sp)
    12d2:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    12d4:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12d6:	18bc                	addi	a5,sp,120
{
    12d8:	e8ca                	sd	s2,80(sp)
    12da:	e4ce                	sd	s3,72(sp)
    12dc:	e0d2                	sd	s4,64(sp)
    12de:	f85a                	sd	s6,48(sp)
    12e0:	f486                	sd	ra,104(sp)
    12e2:	f0a2                	sd	s0,96(sp)
    12e4:	eca6                	sd	s1,88(sp)
    12e6:	fcae                	sd	a1,120(sp)
    12e8:	e132                	sd	a2,128(sp)
    12ea:	e536                	sd	a3,136(sp)
    12ec:	e93a                	sd	a4,144(sp)
    12ee:	f142                	sd	a6,160(sp)
    12f0:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    12f2:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12f4:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    12f8:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    12fc:	00001b17          	auipc	s6,0x1
    1300:	bd4b0b13          	addi	s6,s6,-1068 # 1ed0 <__clone+0x92>
    buf[i++] = '0';
    1304:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1308:	00001997          	auipc	s3,0x1
    130c:	bf898993          	addi	s3,s3,-1032 # 1f00 <digits>
        if (!*s)
    1310:	00054783          	lbu	a5,0(a0)
    1314:	16078a63          	beqz	a5,1488 <printf+0x1ba>
    1318:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    131a:	19278163          	beq	a5,s2,149c <printf+0x1ce>
    131e:	00164783          	lbu	a5,1(a2)
    1322:	0605                	addi	a2,a2,1
    1324:	fbfd                	bnez	a5,131a <printf+0x4c>
    1326:	84b2                	mv	s1,a2
        l = z - a;
    1328:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    132c:	85aa                	mv	a1,a0
    132e:	8622                	mv	a2,s0
    1330:	4505                	li	a0,1
    1332:	0d5000ef          	jal	ra,1c06 <write>
        if (l)
    1336:	18041c63          	bnez	s0,14ce <printf+0x200>
        if (s[1] == 0)
    133a:	0014c783          	lbu	a5,1(s1)
    133e:	14078563          	beqz	a5,1488 <printf+0x1ba>
        switch (s[1])
    1342:	1d478063          	beq	a5,s4,1502 <printf+0x234>
    1346:	18fa6663          	bltu	s4,a5,14d2 <printf+0x204>
    134a:	06400713          	li	a4,100
    134e:	1ae78063          	beq	a5,a4,14ee <printf+0x220>
    1352:	07000713          	li	a4,112
    1356:	1ce79963          	bne	a5,a4,1528 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    135a:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    135c:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1360:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1362:	631c                	ld	a5,0(a4)
    1364:	0721                	addi	a4,a4,8
    1366:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1368:	00479293          	slli	t0,a5,0x4
    136c:	00879f93          	slli	t6,a5,0x8
    1370:	00c79f13          	slli	t5,a5,0xc
    1374:	01079e93          	slli	t4,a5,0x10
    1378:	01479e13          	slli	t3,a5,0x14
    137c:	01879313          	slli	t1,a5,0x18
    1380:	01c79893          	slli	a7,a5,0x1c
    1384:	02479813          	slli	a6,a5,0x24
    1388:	02879513          	slli	a0,a5,0x28
    138c:	02c79593          	slli	a1,a5,0x2c
    1390:	03079693          	slli	a3,a5,0x30
    1394:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1398:	03c7d413          	srli	s0,a5,0x3c
    139c:	01c7d39b          	srliw	t2,a5,0x1c
    13a0:	03c2d293          	srli	t0,t0,0x3c
    13a4:	03cfdf93          	srli	t6,t6,0x3c
    13a8:	03cf5f13          	srli	t5,t5,0x3c
    13ac:	03cede93          	srli	t4,t4,0x3c
    13b0:	03ce5e13          	srli	t3,t3,0x3c
    13b4:	03c35313          	srli	t1,t1,0x3c
    13b8:	03c8d893          	srli	a7,a7,0x3c
    13bc:	03c85813          	srli	a6,a6,0x3c
    13c0:	9171                	srli	a0,a0,0x3c
    13c2:	91f1                	srli	a1,a1,0x3c
    13c4:	92f1                	srli	a3,a3,0x3c
    13c6:	9371                	srli	a4,a4,0x3c
    13c8:	96ce                	add	a3,a3,s3
    13ca:	974e                	add	a4,a4,s3
    13cc:	944e                	add	s0,s0,s3
    13ce:	92ce                	add	t0,t0,s3
    13d0:	9fce                	add	t6,t6,s3
    13d2:	9f4e                	add	t5,t5,s3
    13d4:	9ece                	add	t4,t4,s3
    13d6:	9e4e                	add	t3,t3,s3
    13d8:	934e                	add	t1,t1,s3
    13da:	98ce                	add	a7,a7,s3
    13dc:	93ce                	add	t2,t2,s3
    13de:	984e                	add	a6,a6,s3
    13e0:	954e                	add	a0,a0,s3
    13e2:	95ce                	add	a1,a1,s3
    13e4:	0006c083          	lbu	ra,0(a3)
    13e8:	0002c283          	lbu	t0,0(t0)
    13ec:	00074683          	lbu	a3,0(a4)
    13f0:	000fcf83          	lbu	t6,0(t6)
    13f4:	000f4f03          	lbu	t5,0(t5)
    13f8:	000ece83          	lbu	t4,0(t4)
    13fc:	000e4e03          	lbu	t3,0(t3)
    1400:	00034303          	lbu	t1,0(t1)
    1404:	0008c883          	lbu	a7,0(a7)
    1408:	0003c383          	lbu	t2,0(t2)
    140c:	00084803          	lbu	a6,0(a6)
    1410:	00054503          	lbu	a0,0(a0)
    1414:	0005c583          	lbu	a1,0(a1)
    1418:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    141c:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1420:	9371                	srli	a4,a4,0x3c
    1422:	8bbd                	andi	a5,a5,15
    1424:	974e                	add	a4,a4,s3
    1426:	97ce                	add	a5,a5,s3
    1428:	005105a3          	sb	t0,11(sp)
    142c:	01f10623          	sb	t6,12(sp)
    1430:	01e106a3          	sb	t5,13(sp)
    1434:	01d10723          	sb	t4,14(sp)
    1438:	01c107a3          	sb	t3,15(sp)
    143c:	00610823          	sb	t1,16(sp)
    1440:	011108a3          	sb	a7,17(sp)
    1444:	00710923          	sb	t2,18(sp)
    1448:	010109a3          	sb	a6,19(sp)
    144c:	00a10a23          	sb	a0,20(sp)
    1450:	00b10aa3          	sb	a1,21(sp)
    1454:	00110b23          	sb	ra,22(sp)
    1458:	00d10ba3          	sb	a3,23(sp)
    145c:	00810523          	sb	s0,10(sp)
    1460:	00074703          	lbu	a4,0(a4)
    1464:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1468:	002c                	addi	a1,sp,8
    146a:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    146c:	00e10c23          	sb	a4,24(sp)
    1470:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1474:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1478:	78e000ef          	jal	ra,1c06 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    147c:	00248513          	addi	a0,s1,2
        if (!*s)
    1480:	00054783          	lbu	a5,0(a0)
    1484:	e8079ae3          	bnez	a5,1318 <printf+0x4a>
    }
    va_end(ap);
}
    1488:	70a6                	ld	ra,104(sp)
    148a:	7406                	ld	s0,96(sp)
    148c:	64e6                	ld	s1,88(sp)
    148e:	6946                	ld	s2,80(sp)
    1490:	69a6                	ld	s3,72(sp)
    1492:	6a06                	ld	s4,64(sp)
    1494:	7ae2                	ld	s5,56(sp)
    1496:	7b42                	ld	s6,48(sp)
    1498:	614d                	addi	sp,sp,176
    149a:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    149c:	00064783          	lbu	a5,0(a2)
    14a0:	84b2                	mv	s1,a2
    14a2:	01278963          	beq	a5,s2,14b4 <printf+0x1e6>
    14a6:	b549                	j	1328 <printf+0x5a>
    14a8:	0024c783          	lbu	a5,2(s1)
    14ac:	0605                	addi	a2,a2,1
    14ae:	0489                	addi	s1,s1,2
    14b0:	e7279ce3          	bne	a5,s2,1328 <printf+0x5a>
    14b4:	0014c783          	lbu	a5,1(s1)
    14b8:	ff2788e3          	beq	a5,s2,14a8 <printf+0x1da>
        l = z - a;
    14bc:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14c0:	85aa                	mv	a1,a0
    14c2:	8622                	mv	a2,s0
    14c4:	4505                	li	a0,1
    14c6:	740000ef          	jal	ra,1c06 <write>
        if (l)
    14ca:	e60408e3          	beqz	s0,133a <printf+0x6c>
    14ce:	8526                	mv	a0,s1
    14d0:	b581                	j	1310 <printf+0x42>
        switch (s[1])
    14d2:	07800713          	li	a4,120
    14d6:	04e79963          	bne	a5,a4,1528 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    14da:	6782                	ld	a5,0(sp)
    14dc:	45c1                	li	a1,16
    14de:	4388                	lw	a0,0(a5)
    14e0:	07a1                	addi	a5,a5,8
    14e2:	e03e                	sd	a5,0(sp)
    14e4:	be5ff0ef          	jal	ra,10c8 <printint.constprop.0>
        s += 2;
    14e8:	00248513          	addi	a0,s1,2
    14ec:	bf51                	j	1480 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    14ee:	6782                	ld	a5,0(sp)
    14f0:	45a9                	li	a1,10
    14f2:	4388                	lw	a0,0(a5)
    14f4:	07a1                	addi	a5,a5,8
    14f6:	e03e                	sd	a5,0(sp)
    14f8:	bd1ff0ef          	jal	ra,10c8 <printint.constprop.0>
        s += 2;
    14fc:	00248513          	addi	a0,s1,2
    1500:	b741                	j	1480 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1502:	6782                	ld	a5,0(sp)
    1504:	6380                	ld	s0,0(a5)
    1506:	07a1                	addi	a5,a5,8
    1508:	e03e                	sd	a5,0(sp)
    150a:	c421                	beqz	s0,1552 <printf+0x284>
            l = strnlen(a, 200);
    150c:	0c800593          	li	a1,200
    1510:	8522                	mv	a0,s0
    1512:	3fc000ef          	jal	ra,190e <strnlen>
    write(f, s, l);
    1516:	0005061b          	sext.w	a2,a0
    151a:	85a2                	mv	a1,s0
    151c:	4505                	li	a0,1
    151e:	6e8000ef          	jal	ra,1c06 <write>
        s += 2;
    1522:	00248513          	addi	a0,s1,2
    1526:	bfa9                	j	1480 <printf+0x1b2>
    char byte = c;
    1528:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    152c:	4605                	li	a2,1
    152e:	002c                	addi	a1,sp,8
    1530:	4505                	li	a0,1
    char byte = c;
    1532:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1536:	6d0000ef          	jal	ra,1c06 <write>
    char byte = c;
    153a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    153e:	4605                	li	a2,1
    1540:	002c                	addi	a1,sp,8
    1542:	4505                	li	a0,1
    char byte = c;
    1544:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1548:	6be000ef          	jal	ra,1c06 <write>
        s += 2;
    154c:	00248513          	addi	a0,s1,2
    1550:	bf05                	j	1480 <printf+0x1b2>
                a = "(null)";
    1552:	845a                	mv	s0,s6
    1554:	bf65                	j	150c <printf+0x23e>

0000000000001556 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1556:	02000793          	li	a5,32
    155a:	00f50663          	beq	a0,a5,1566 <isspace+0x10>
    155e:	355d                	addiw	a0,a0,-9
    1560:	00553513          	sltiu	a0,a0,5
    1564:	8082                	ret
    1566:	4505                	li	a0,1
}
    1568:	8082                	ret

000000000000156a <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    156a:	fd05051b          	addiw	a0,a0,-48
}
    156e:	00a53513          	sltiu	a0,a0,10
    1572:	8082                	ret

0000000000001574 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1574:	02000613          	li	a2,32
    1578:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    157a:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    157e:	ff77069b          	addiw	a3,a4,-9
    1582:	04c70d63          	beq	a4,a2,15dc <atoi+0x68>
    1586:	0007079b          	sext.w	a5,a4
    158a:	04d5f963          	bgeu	a1,a3,15dc <atoi+0x68>
        s++;
    switch (*s)
    158e:	02b00693          	li	a3,43
    1592:	04d70a63          	beq	a4,a3,15e6 <atoi+0x72>
    1596:	02d00693          	li	a3,45
    159a:	06d70463          	beq	a4,a3,1602 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    159e:	fd07859b          	addiw	a1,a5,-48
    15a2:	4625                	li	a2,9
    15a4:	873e                	mv	a4,a5
    15a6:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15a8:	4e01                	li	t3,0
    while (isdigit(*s))
    15aa:	04b66a63          	bltu	a2,a1,15fe <atoi+0x8a>
    int n = 0, neg = 0;
    15ae:	4501                	li	a0,0
    while (isdigit(*s))
    15b0:	4825                	li	a6,9
    15b2:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    15b6:	0025179b          	slliw	a5,a0,0x2
    15ba:	9d3d                	addw	a0,a0,a5
    15bc:	fd07031b          	addiw	t1,a4,-48
    15c0:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15c4:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15c8:	0685                	addi	a3,a3,1
    15ca:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15ce:	0006071b          	sext.w	a4,a2
    15d2:	feb870e3          	bgeu	a6,a1,15b2 <atoi+0x3e>
    return neg ? n : -n;
    15d6:	000e0563          	beqz	t3,15e0 <atoi+0x6c>
}
    15da:	8082                	ret
        s++;
    15dc:	0505                	addi	a0,a0,1
    15de:	bf71                	j	157a <atoi+0x6>
    15e0:	4113053b          	subw	a0,t1,a7
    15e4:	8082                	ret
    while (isdigit(*s))
    15e6:	00154783          	lbu	a5,1(a0)
    15ea:	4625                	li	a2,9
        s++;
    15ec:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    15f0:	fd07859b          	addiw	a1,a5,-48
    15f4:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    15f8:	4e01                	li	t3,0
    while (isdigit(*s))
    15fa:	fab67ae3          	bgeu	a2,a1,15ae <atoi+0x3a>
    15fe:	4501                	li	a0,0
}
    1600:	8082                	ret
    while (isdigit(*s))
    1602:	00154783          	lbu	a5,1(a0)
    1606:	4625                	li	a2,9
        s++;
    1608:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    160c:	fd07859b          	addiw	a1,a5,-48
    1610:	0007871b          	sext.w	a4,a5
    1614:	feb665e3          	bltu	a2,a1,15fe <atoi+0x8a>
        neg = 1;
    1618:	4e05                	li	t3,1
    161a:	bf51                	j	15ae <atoi+0x3a>

000000000000161c <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    161c:	16060d63          	beqz	a2,1796 <memset+0x17a>
    1620:	40a007b3          	neg	a5,a0
    1624:	8b9d                	andi	a5,a5,7
    1626:	00778713          	addi	a4,a5,7
    162a:	482d                	li	a6,11
    162c:	0ff5f593          	andi	a1,a1,255
    1630:	fff60693          	addi	a3,a2,-1
    1634:	17076263          	bltu	a4,a6,1798 <memset+0x17c>
    1638:	16e6ea63          	bltu	a3,a4,17ac <memset+0x190>
    163c:	16078563          	beqz	a5,17a6 <memset+0x18a>
    1640:	00b50023          	sb	a1,0(a0)
    1644:	4705                	li	a4,1
    1646:	00150e93          	addi	t4,a0,1
    164a:	14e78c63          	beq	a5,a4,17a2 <memset+0x186>
    164e:	00b500a3          	sb	a1,1(a0)
    1652:	4709                	li	a4,2
    1654:	00250e93          	addi	t4,a0,2
    1658:	14e78d63          	beq	a5,a4,17b2 <memset+0x196>
    165c:	00b50123          	sb	a1,2(a0)
    1660:	470d                	li	a4,3
    1662:	00350e93          	addi	t4,a0,3
    1666:	12e78b63          	beq	a5,a4,179c <memset+0x180>
    166a:	00b501a3          	sb	a1,3(a0)
    166e:	4711                	li	a4,4
    1670:	00450e93          	addi	t4,a0,4
    1674:	14e78163          	beq	a5,a4,17b6 <memset+0x19a>
    1678:	00b50223          	sb	a1,4(a0)
    167c:	4715                	li	a4,5
    167e:	00550e93          	addi	t4,a0,5
    1682:	12e78c63          	beq	a5,a4,17ba <memset+0x19e>
    1686:	00b502a3          	sb	a1,5(a0)
    168a:	471d                	li	a4,7
    168c:	00650e93          	addi	t4,a0,6
    1690:	12e79763          	bne	a5,a4,17be <memset+0x1a2>
    1694:	00750e93          	addi	t4,a0,7
    1698:	00b50323          	sb	a1,6(a0)
    169c:	4f1d                	li	t5,7
    169e:	00859713          	slli	a4,a1,0x8
    16a2:	8f4d                	or	a4,a4,a1
    16a4:	01059e13          	slli	t3,a1,0x10
    16a8:	01c76e33          	or	t3,a4,t3
    16ac:	01859313          	slli	t1,a1,0x18
    16b0:	006e6333          	or	t1,t3,t1
    16b4:	02059893          	slli	a7,a1,0x20
    16b8:	011368b3          	or	a7,t1,a7
    16bc:	02859813          	slli	a6,a1,0x28
    16c0:	40f60333          	sub	t1,a2,a5
    16c4:	0108e833          	or	a6,a7,a6
    16c8:	03059693          	slli	a3,a1,0x30
    16cc:	00d866b3          	or	a3,a6,a3
    16d0:	03859713          	slli	a4,a1,0x38
    16d4:	97aa                	add	a5,a5,a0
    16d6:	ff837813          	andi	a6,t1,-8
    16da:	8f55                	or	a4,a4,a3
    16dc:	00f806b3          	add	a3,a6,a5
    16e0:	e398                	sd	a4,0(a5)
    16e2:	07a1                	addi	a5,a5,8
    16e4:	fed79ee3          	bne	a5,a3,16e0 <memset+0xc4>
    16e8:	ff837693          	andi	a3,t1,-8
    16ec:	00de87b3          	add	a5,t4,a3
    16f0:	01e6873b          	addw	a4,a3,t5
    16f4:	0ad30663          	beq	t1,a3,17a0 <memset+0x184>
    16f8:	00b78023          	sb	a1,0(a5)
    16fc:	0017069b          	addiw	a3,a4,1
    1700:	08c6fb63          	bgeu	a3,a2,1796 <memset+0x17a>
    1704:	00b780a3          	sb	a1,1(a5)
    1708:	0027069b          	addiw	a3,a4,2
    170c:	08c6f563          	bgeu	a3,a2,1796 <memset+0x17a>
    1710:	00b78123          	sb	a1,2(a5)
    1714:	0037069b          	addiw	a3,a4,3
    1718:	06c6ff63          	bgeu	a3,a2,1796 <memset+0x17a>
    171c:	00b781a3          	sb	a1,3(a5)
    1720:	0047069b          	addiw	a3,a4,4
    1724:	06c6f963          	bgeu	a3,a2,1796 <memset+0x17a>
    1728:	00b78223          	sb	a1,4(a5)
    172c:	0057069b          	addiw	a3,a4,5
    1730:	06c6f363          	bgeu	a3,a2,1796 <memset+0x17a>
    1734:	00b782a3          	sb	a1,5(a5)
    1738:	0067069b          	addiw	a3,a4,6
    173c:	04c6fd63          	bgeu	a3,a2,1796 <memset+0x17a>
    1740:	00b78323          	sb	a1,6(a5)
    1744:	0077069b          	addiw	a3,a4,7
    1748:	04c6f763          	bgeu	a3,a2,1796 <memset+0x17a>
    174c:	00b783a3          	sb	a1,7(a5)
    1750:	0087069b          	addiw	a3,a4,8
    1754:	04c6f163          	bgeu	a3,a2,1796 <memset+0x17a>
    1758:	00b78423          	sb	a1,8(a5)
    175c:	0097069b          	addiw	a3,a4,9
    1760:	02c6fb63          	bgeu	a3,a2,1796 <memset+0x17a>
    1764:	00b784a3          	sb	a1,9(a5)
    1768:	00a7069b          	addiw	a3,a4,10
    176c:	02c6f563          	bgeu	a3,a2,1796 <memset+0x17a>
    1770:	00b78523          	sb	a1,10(a5)
    1774:	00b7069b          	addiw	a3,a4,11
    1778:	00c6ff63          	bgeu	a3,a2,1796 <memset+0x17a>
    177c:	00b785a3          	sb	a1,11(a5)
    1780:	00c7069b          	addiw	a3,a4,12
    1784:	00c6f963          	bgeu	a3,a2,1796 <memset+0x17a>
    1788:	00b78623          	sb	a1,12(a5)
    178c:	2735                	addiw	a4,a4,13
    178e:	00c77463          	bgeu	a4,a2,1796 <memset+0x17a>
    1792:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1796:	8082                	ret
    1798:	472d                	li	a4,11
    179a:	bd79                	j	1638 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    179c:	4f0d                	li	t5,3
    179e:	b701                	j	169e <memset+0x82>
    17a0:	8082                	ret
    17a2:	4f05                	li	t5,1
    17a4:	bded                	j	169e <memset+0x82>
    17a6:	8eaa                	mv	t4,a0
    17a8:	4f01                	li	t5,0
    17aa:	bdd5                	j	169e <memset+0x82>
    17ac:	87aa                	mv	a5,a0
    17ae:	4701                	li	a4,0
    17b0:	b7a1                	j	16f8 <memset+0xdc>
    17b2:	4f09                	li	t5,2
    17b4:	b5ed                	j	169e <memset+0x82>
    17b6:	4f11                	li	t5,4
    17b8:	b5dd                	j	169e <memset+0x82>
    17ba:	4f15                	li	t5,5
    17bc:	b5cd                	j	169e <memset+0x82>
    17be:	4f19                	li	t5,6
    17c0:	bdf9                	j	169e <memset+0x82>

00000000000017c2 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17c2:	00054783          	lbu	a5,0(a0)
    17c6:	0005c703          	lbu	a4,0(a1)
    17ca:	00e79863          	bne	a5,a4,17da <strcmp+0x18>
    17ce:	0505                	addi	a0,a0,1
    17d0:	0585                	addi	a1,a1,1
    17d2:	fbe5                	bnez	a5,17c2 <strcmp>
    17d4:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    17d6:	9d19                	subw	a0,a0,a4
    17d8:	8082                	ret
    17da:	0007851b          	sext.w	a0,a5
    17de:	bfe5                	j	17d6 <strcmp+0x14>

00000000000017e0 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17e0:	ce05                	beqz	a2,1818 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17e2:	00054703          	lbu	a4,0(a0)
    17e6:	0005c783          	lbu	a5,0(a1)
    17ea:	cb0d                	beqz	a4,181c <strncmp+0x3c>
    if (!n--)
    17ec:	167d                	addi	a2,a2,-1
    17ee:	00c506b3          	add	a3,a0,a2
    17f2:	a819                	j	1808 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17f4:	00a68e63          	beq	a3,a0,1810 <strncmp+0x30>
    17f8:	0505                	addi	a0,a0,1
    17fa:	00e79b63          	bne	a5,a4,1810 <strncmp+0x30>
    17fe:	00054703          	lbu	a4,0(a0)
    1802:	0005c783          	lbu	a5,0(a1)
    1806:	cb19                	beqz	a4,181c <strncmp+0x3c>
    1808:	0005c783          	lbu	a5,0(a1)
    180c:	0585                	addi	a1,a1,1
    180e:	f3fd                	bnez	a5,17f4 <strncmp+0x14>
        ;
    return *l - *r;
    1810:	0007051b          	sext.w	a0,a4
    1814:	9d1d                	subw	a0,a0,a5
    1816:	8082                	ret
        return 0;
    1818:	4501                	li	a0,0
}
    181a:	8082                	ret
    181c:	4501                	li	a0,0
    return *l - *r;
    181e:	9d1d                	subw	a0,a0,a5
    1820:	8082                	ret

0000000000001822 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1822:	00757793          	andi	a5,a0,7
    1826:	cf89                	beqz	a5,1840 <strlen+0x1e>
    1828:	87aa                	mv	a5,a0
    182a:	a029                	j	1834 <strlen+0x12>
    182c:	0785                	addi	a5,a5,1
    182e:	0077f713          	andi	a4,a5,7
    1832:	cb01                	beqz	a4,1842 <strlen+0x20>
        if (!*s)
    1834:	0007c703          	lbu	a4,0(a5)
    1838:	fb75                	bnez	a4,182c <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    183a:	40a78533          	sub	a0,a5,a0
}
    183e:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1840:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1842:	6394                	ld	a3,0(a5)
    1844:	00000597          	auipc	a1,0x0
    1848:	6945b583          	ld	a1,1684(a1) # 1ed8 <__clone+0x9a>
    184c:	00000617          	auipc	a2,0x0
    1850:	69463603          	ld	a2,1684(a2) # 1ee0 <__clone+0xa2>
    1854:	a019                	j	185a <strlen+0x38>
    1856:	6794                	ld	a3,8(a5)
    1858:	07a1                	addi	a5,a5,8
    185a:	00b68733          	add	a4,a3,a1
    185e:	fff6c693          	not	a3,a3
    1862:	8f75                	and	a4,a4,a3
    1864:	8f71                	and	a4,a4,a2
    1866:	db65                	beqz	a4,1856 <strlen+0x34>
    for (; *s; s++)
    1868:	0007c703          	lbu	a4,0(a5)
    186c:	d779                	beqz	a4,183a <strlen+0x18>
    186e:	0017c703          	lbu	a4,1(a5)
    1872:	0785                	addi	a5,a5,1
    1874:	d379                	beqz	a4,183a <strlen+0x18>
    1876:	0017c703          	lbu	a4,1(a5)
    187a:	0785                	addi	a5,a5,1
    187c:	fb6d                	bnez	a4,186e <strlen+0x4c>
    187e:	bf75                	j	183a <strlen+0x18>

0000000000001880 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1880:	00757713          	andi	a4,a0,7
{
    1884:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    1886:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    188a:	cb19                	beqz	a4,18a0 <memchr+0x20>
    188c:	ce25                	beqz	a2,1904 <memchr+0x84>
    188e:	0007c703          	lbu	a4,0(a5)
    1892:	04b70e63          	beq	a4,a1,18ee <memchr+0x6e>
    1896:	0785                	addi	a5,a5,1
    1898:	0077f713          	andi	a4,a5,7
    189c:	167d                	addi	a2,a2,-1
    189e:	f77d                	bnez	a4,188c <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18a0:	4501                	li	a0,0
    if (n && *s != c)
    18a2:	c235                	beqz	a2,1906 <memchr+0x86>
    18a4:	0007c703          	lbu	a4,0(a5)
    18a8:	04b70363          	beq	a4,a1,18ee <memchr+0x6e>
        size_t k = ONES * c;
    18ac:	00000517          	auipc	a0,0x0
    18b0:	63c53503          	ld	a0,1596(a0) # 1ee8 <__clone+0xaa>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18b4:	471d                	li	a4,7
        size_t k = ONES * c;
    18b6:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18ba:	02c77a63          	bgeu	a4,a2,18ee <memchr+0x6e>
    18be:	00000897          	auipc	a7,0x0
    18c2:	61a8b883          	ld	a7,1562(a7) # 1ed8 <__clone+0x9a>
    18c6:	00000817          	auipc	a6,0x0
    18ca:	61a83803          	ld	a6,1562(a6) # 1ee0 <__clone+0xa2>
    18ce:	431d                	li	t1,7
    18d0:	a029                	j	18da <memchr+0x5a>
    18d2:	1661                	addi	a2,a2,-8
    18d4:	07a1                	addi	a5,a5,8
    18d6:	02c37963          	bgeu	t1,a2,1908 <memchr+0x88>
    18da:	6398                	ld	a4,0(a5)
    18dc:	8f29                	xor	a4,a4,a0
    18de:	011706b3          	add	a3,a4,a7
    18e2:	fff74713          	not	a4,a4
    18e6:	8f75                	and	a4,a4,a3
    18e8:	01077733          	and	a4,a4,a6
    18ec:	d37d                	beqz	a4,18d2 <memchr+0x52>
    18ee:	853e                	mv	a0,a5
    18f0:	97b2                	add	a5,a5,a2
    18f2:	a021                	j	18fa <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    18f4:	0505                	addi	a0,a0,1
    18f6:	00f50763          	beq	a0,a5,1904 <memchr+0x84>
    18fa:	00054703          	lbu	a4,0(a0)
    18fe:	feb71be3          	bne	a4,a1,18f4 <memchr+0x74>
    1902:	8082                	ret
    return n ? (void *)s : 0;
    1904:	4501                	li	a0,0
}
    1906:	8082                	ret
    return n ? (void *)s : 0;
    1908:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    190a:	f275                	bnez	a2,18ee <memchr+0x6e>
}
    190c:	8082                	ret

000000000000190e <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    190e:	1101                	addi	sp,sp,-32
    1910:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1912:	862e                	mv	a2,a1
{
    1914:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1916:	4581                	li	a1,0
{
    1918:	e426                	sd	s1,8(sp)
    191a:	ec06                	sd	ra,24(sp)
    191c:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    191e:	f63ff0ef          	jal	ra,1880 <memchr>
    return p ? p - s : n;
    1922:	c519                	beqz	a0,1930 <strnlen+0x22>
}
    1924:	60e2                	ld	ra,24(sp)
    1926:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    1928:	8d05                	sub	a0,a0,s1
}
    192a:	64a2                	ld	s1,8(sp)
    192c:	6105                	addi	sp,sp,32
    192e:	8082                	ret
    1930:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1932:	8522                	mv	a0,s0
}
    1934:	6442                	ld	s0,16(sp)
    1936:	64a2                	ld	s1,8(sp)
    1938:	6105                	addi	sp,sp,32
    193a:	8082                	ret

000000000000193c <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    193c:	00b547b3          	xor	a5,a0,a1
    1940:	8b9d                	andi	a5,a5,7
    1942:	eb95                	bnez	a5,1976 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1944:	0075f793          	andi	a5,a1,7
    1948:	e7b1                	bnez	a5,1994 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    194a:	6198                	ld	a4,0(a1)
    194c:	00000617          	auipc	a2,0x0
    1950:	58c63603          	ld	a2,1420(a2) # 1ed8 <__clone+0x9a>
    1954:	00000817          	auipc	a6,0x0
    1958:	58c83803          	ld	a6,1420(a6) # 1ee0 <__clone+0xa2>
    195c:	a029                	j	1966 <strcpy+0x2a>
    195e:	e118                	sd	a4,0(a0)
    1960:	6598                	ld	a4,8(a1)
    1962:	05a1                	addi	a1,a1,8
    1964:	0521                	addi	a0,a0,8
    1966:	00c707b3          	add	a5,a4,a2
    196a:	fff74693          	not	a3,a4
    196e:	8ff5                	and	a5,a5,a3
    1970:	0107f7b3          	and	a5,a5,a6
    1974:	d7ed                	beqz	a5,195e <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1976:	0005c783          	lbu	a5,0(a1)
    197a:	00f50023          	sb	a5,0(a0)
    197e:	c785                	beqz	a5,19a6 <strcpy+0x6a>
    1980:	0015c783          	lbu	a5,1(a1)
    1984:	0505                	addi	a0,a0,1
    1986:	0585                	addi	a1,a1,1
    1988:	00f50023          	sb	a5,0(a0)
    198c:	fbf5                	bnez	a5,1980 <strcpy+0x44>
        ;
    return d;
}
    198e:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1990:	0505                	addi	a0,a0,1
    1992:	df45                	beqz	a4,194a <strcpy+0xe>
            if (!(*d = *s))
    1994:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    1998:	0585                	addi	a1,a1,1
    199a:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    199e:	00f50023          	sb	a5,0(a0)
    19a2:	f7fd                	bnez	a5,1990 <strcpy+0x54>
}
    19a4:	8082                	ret
    19a6:	8082                	ret

00000000000019a8 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19a8:	00b547b3          	xor	a5,a0,a1
    19ac:	8b9d                	andi	a5,a5,7
    19ae:	1a079863          	bnez	a5,1b5e <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19b2:	0075f793          	andi	a5,a1,7
    19b6:	16078463          	beqz	a5,1b1e <strncpy+0x176>
    19ba:	ea01                	bnez	a2,19ca <strncpy+0x22>
    19bc:	a421                	j	1bc4 <strncpy+0x21c>
    19be:	167d                	addi	a2,a2,-1
    19c0:	0505                	addi	a0,a0,1
    19c2:	14070e63          	beqz	a4,1b1e <strncpy+0x176>
    19c6:	1a060863          	beqz	a2,1b76 <strncpy+0x1ce>
    19ca:	0005c783          	lbu	a5,0(a1)
    19ce:	0585                	addi	a1,a1,1
    19d0:	0075f713          	andi	a4,a1,7
    19d4:	00f50023          	sb	a5,0(a0)
    19d8:	f3fd                	bnez	a5,19be <strncpy+0x16>
    19da:	4805                	li	a6,1
    19dc:	1a061863          	bnez	a2,1b8c <strncpy+0x1e4>
    19e0:	40a007b3          	neg	a5,a0
    19e4:	8b9d                	andi	a5,a5,7
    19e6:	4681                	li	a3,0
    19e8:	18061a63          	bnez	a2,1b7c <strncpy+0x1d4>
    19ec:	00778713          	addi	a4,a5,7
    19f0:	45ad                	li	a1,11
    19f2:	18b76363          	bltu	a4,a1,1b78 <strncpy+0x1d0>
    19f6:	1ae6eb63          	bltu	a3,a4,1bac <strncpy+0x204>
    19fa:	1a078363          	beqz	a5,1ba0 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    19fe:	00050023          	sb	zero,0(a0)
    1a02:	4685                	li	a3,1
    1a04:	00150713          	addi	a4,a0,1
    1a08:	18d78f63          	beq	a5,a3,1ba6 <strncpy+0x1fe>
    1a0c:	000500a3          	sb	zero,1(a0)
    1a10:	4689                	li	a3,2
    1a12:	00250713          	addi	a4,a0,2
    1a16:	18d78e63          	beq	a5,a3,1bb2 <strncpy+0x20a>
    1a1a:	00050123          	sb	zero,2(a0)
    1a1e:	468d                	li	a3,3
    1a20:	00350713          	addi	a4,a0,3
    1a24:	16d78c63          	beq	a5,a3,1b9c <strncpy+0x1f4>
    1a28:	000501a3          	sb	zero,3(a0)
    1a2c:	4691                	li	a3,4
    1a2e:	00450713          	addi	a4,a0,4
    1a32:	18d78263          	beq	a5,a3,1bb6 <strncpy+0x20e>
    1a36:	00050223          	sb	zero,4(a0)
    1a3a:	4695                	li	a3,5
    1a3c:	00550713          	addi	a4,a0,5
    1a40:	16d78d63          	beq	a5,a3,1bba <strncpy+0x212>
    1a44:	000502a3          	sb	zero,5(a0)
    1a48:	469d                	li	a3,7
    1a4a:	00650713          	addi	a4,a0,6
    1a4e:	16d79863          	bne	a5,a3,1bbe <strncpy+0x216>
    1a52:	00750713          	addi	a4,a0,7
    1a56:	00050323          	sb	zero,6(a0)
    1a5a:	40f80833          	sub	a6,a6,a5
    1a5e:	ff887593          	andi	a1,a6,-8
    1a62:	97aa                	add	a5,a5,a0
    1a64:	95be                	add	a1,a1,a5
    1a66:	0007b023          	sd	zero,0(a5)
    1a6a:	07a1                	addi	a5,a5,8
    1a6c:	feb79de3          	bne	a5,a1,1a66 <strncpy+0xbe>
    1a70:	ff887593          	andi	a1,a6,-8
    1a74:	9ead                	addw	a3,a3,a1
    1a76:	00b707b3          	add	a5,a4,a1
    1a7a:	12b80863          	beq	a6,a1,1baa <strncpy+0x202>
    1a7e:	00078023          	sb	zero,0(a5)
    1a82:	0016871b          	addiw	a4,a3,1
    1a86:	0ec77863          	bgeu	a4,a2,1b76 <strncpy+0x1ce>
    1a8a:	000780a3          	sb	zero,1(a5)
    1a8e:	0026871b          	addiw	a4,a3,2
    1a92:	0ec77263          	bgeu	a4,a2,1b76 <strncpy+0x1ce>
    1a96:	00078123          	sb	zero,2(a5)
    1a9a:	0036871b          	addiw	a4,a3,3
    1a9e:	0cc77c63          	bgeu	a4,a2,1b76 <strncpy+0x1ce>
    1aa2:	000781a3          	sb	zero,3(a5)
    1aa6:	0046871b          	addiw	a4,a3,4
    1aaa:	0cc77663          	bgeu	a4,a2,1b76 <strncpy+0x1ce>
    1aae:	00078223          	sb	zero,4(a5)
    1ab2:	0056871b          	addiw	a4,a3,5
    1ab6:	0cc77063          	bgeu	a4,a2,1b76 <strncpy+0x1ce>
    1aba:	000782a3          	sb	zero,5(a5)
    1abe:	0066871b          	addiw	a4,a3,6
    1ac2:	0ac77a63          	bgeu	a4,a2,1b76 <strncpy+0x1ce>
    1ac6:	00078323          	sb	zero,6(a5)
    1aca:	0076871b          	addiw	a4,a3,7
    1ace:	0ac77463          	bgeu	a4,a2,1b76 <strncpy+0x1ce>
    1ad2:	000783a3          	sb	zero,7(a5)
    1ad6:	0086871b          	addiw	a4,a3,8
    1ada:	08c77e63          	bgeu	a4,a2,1b76 <strncpy+0x1ce>
    1ade:	00078423          	sb	zero,8(a5)
    1ae2:	0096871b          	addiw	a4,a3,9
    1ae6:	08c77863          	bgeu	a4,a2,1b76 <strncpy+0x1ce>
    1aea:	000784a3          	sb	zero,9(a5)
    1aee:	00a6871b          	addiw	a4,a3,10
    1af2:	08c77263          	bgeu	a4,a2,1b76 <strncpy+0x1ce>
    1af6:	00078523          	sb	zero,10(a5)
    1afa:	00b6871b          	addiw	a4,a3,11
    1afe:	06c77c63          	bgeu	a4,a2,1b76 <strncpy+0x1ce>
    1b02:	000785a3          	sb	zero,11(a5)
    1b06:	00c6871b          	addiw	a4,a3,12
    1b0a:	06c77663          	bgeu	a4,a2,1b76 <strncpy+0x1ce>
    1b0e:	00078623          	sb	zero,12(a5)
    1b12:	26b5                	addiw	a3,a3,13
    1b14:	06c6f163          	bgeu	a3,a2,1b76 <strncpy+0x1ce>
    1b18:	000786a3          	sb	zero,13(a5)
    1b1c:	8082                	ret
            ;
        if (!n || !*s)
    1b1e:	c645                	beqz	a2,1bc6 <strncpy+0x21e>
    1b20:	0005c783          	lbu	a5,0(a1)
    1b24:	ea078be3          	beqz	a5,19da <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b28:	479d                	li	a5,7
    1b2a:	02c7ff63          	bgeu	a5,a2,1b68 <strncpy+0x1c0>
    1b2e:	00000897          	auipc	a7,0x0
    1b32:	3aa8b883          	ld	a7,938(a7) # 1ed8 <__clone+0x9a>
    1b36:	00000817          	auipc	a6,0x0
    1b3a:	3aa83803          	ld	a6,938(a6) # 1ee0 <__clone+0xa2>
    1b3e:	431d                	li	t1,7
    1b40:	6198                	ld	a4,0(a1)
    1b42:	011707b3          	add	a5,a4,a7
    1b46:	fff74693          	not	a3,a4
    1b4a:	8ff5                	and	a5,a5,a3
    1b4c:	0107f7b3          	and	a5,a5,a6
    1b50:	ef81                	bnez	a5,1b68 <strncpy+0x1c0>
            *wd = *ws;
    1b52:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b54:	1661                	addi	a2,a2,-8
    1b56:	05a1                	addi	a1,a1,8
    1b58:	0521                	addi	a0,a0,8
    1b5a:	fec363e3          	bltu	t1,a2,1b40 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b5e:	e609                	bnez	a2,1b68 <strncpy+0x1c0>
    1b60:	a08d                	j	1bc2 <strncpy+0x21a>
    1b62:	167d                	addi	a2,a2,-1
    1b64:	0505                	addi	a0,a0,1
    1b66:	ca01                	beqz	a2,1b76 <strncpy+0x1ce>
    1b68:	0005c783          	lbu	a5,0(a1)
    1b6c:	0585                	addi	a1,a1,1
    1b6e:	00f50023          	sb	a5,0(a0)
    1b72:	fbe5                	bnez	a5,1b62 <strncpy+0x1ba>
        ;
tail:
    1b74:	b59d                	j	19da <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1b76:	8082                	ret
    1b78:	472d                	li	a4,11
    1b7a:	bdb5                	j	19f6 <strncpy+0x4e>
    1b7c:	00778713          	addi	a4,a5,7
    1b80:	45ad                	li	a1,11
    1b82:	fff60693          	addi	a3,a2,-1
    1b86:	e6b778e3          	bgeu	a4,a1,19f6 <strncpy+0x4e>
    1b8a:	b7fd                	j	1b78 <strncpy+0x1d0>
    1b8c:	40a007b3          	neg	a5,a0
    1b90:	8832                	mv	a6,a2
    1b92:	8b9d                	andi	a5,a5,7
    1b94:	4681                	li	a3,0
    1b96:	e4060be3          	beqz	a2,19ec <strncpy+0x44>
    1b9a:	b7cd                	j	1b7c <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b9c:	468d                	li	a3,3
    1b9e:	bd75                	j	1a5a <strncpy+0xb2>
    1ba0:	872a                	mv	a4,a0
    1ba2:	4681                	li	a3,0
    1ba4:	bd5d                	j	1a5a <strncpy+0xb2>
    1ba6:	4685                	li	a3,1
    1ba8:	bd4d                	j	1a5a <strncpy+0xb2>
    1baa:	8082                	ret
    1bac:	87aa                	mv	a5,a0
    1bae:	4681                	li	a3,0
    1bb0:	b5f9                	j	1a7e <strncpy+0xd6>
    1bb2:	4689                	li	a3,2
    1bb4:	b55d                	j	1a5a <strncpy+0xb2>
    1bb6:	4691                	li	a3,4
    1bb8:	b54d                	j	1a5a <strncpy+0xb2>
    1bba:	4695                	li	a3,5
    1bbc:	bd79                	j	1a5a <strncpy+0xb2>
    1bbe:	4699                	li	a3,6
    1bc0:	bd69                	j	1a5a <strncpy+0xb2>
    1bc2:	8082                	ret
    1bc4:	8082                	ret
    1bc6:	8082                	ret

0000000000001bc8 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1bc8:	87aa                	mv	a5,a0
    1bca:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1bcc:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1bd0:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1bd4:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1bd6:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bd8:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1bdc:	2501                	sext.w	a0,a0
    1bde:	8082                	ret

0000000000001be0 <openat>:
    register long a7 __asm__("a7") = n;
    1be0:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1be4:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1be8:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1bec:	2501                	sext.w	a0,a0
    1bee:	8082                	ret

0000000000001bf0 <close>:
    register long a7 __asm__("a7") = n;
    1bf0:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1bf4:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1bf8:	2501                	sext.w	a0,a0
    1bfa:	8082                	ret

0000000000001bfc <read>:
    register long a7 __asm__("a7") = n;
    1bfc:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c00:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c04:	8082                	ret

0000000000001c06 <write>:
    register long a7 __asm__("a7") = n;
    1c06:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c0a:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c0e:	8082                	ret

0000000000001c10 <getpid>:
    register long a7 __asm__("a7") = n;
    1c10:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c14:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c18:	2501                	sext.w	a0,a0
    1c1a:	8082                	ret

0000000000001c1c <getppid>:
    register long a7 __asm__("a7") = n;
    1c1c:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c20:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c24:	2501                	sext.w	a0,a0
    1c26:	8082                	ret

0000000000001c28 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c28:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c2c:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c30:	2501                	sext.w	a0,a0
    1c32:	8082                	ret

0000000000001c34 <fork>:
    register long a7 __asm__("a7") = n;
    1c34:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c38:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c3a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c3c:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c40:	2501                	sext.w	a0,a0
    1c42:	8082                	ret

0000000000001c44 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c44:	85b2                	mv	a1,a2
    1c46:	863a                	mv	a2,a4
    if (stack)
    1c48:	c191                	beqz	a1,1c4c <clone+0x8>
	stack += stack_size;
    1c4a:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c4c:	4781                	li	a5,0
    1c4e:	4701                	li	a4,0
    1c50:	4681                	li	a3,0
    1c52:	2601                	sext.w	a2,a2
    1c54:	a2ed                	j	1e3e <__clone>

0000000000001c56 <exit>:
    register long a7 __asm__("a7") = n;
    1c56:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c5a:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c5e:	8082                	ret

0000000000001c60 <waitpid>:
    register long a7 __asm__("a7") = n;
    1c60:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c64:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c66:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c6a:	2501                	sext.w	a0,a0
    1c6c:	8082                	ret

0000000000001c6e <exec>:
    register long a7 __asm__("a7") = n;
    1c6e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1c72:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1c76:	2501                	sext.w	a0,a0
    1c78:	8082                	ret

0000000000001c7a <execve>:
    register long a7 __asm__("a7") = n;
    1c7a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c7e:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1c82:	2501                	sext.w	a0,a0
    1c84:	8082                	ret

0000000000001c86 <times>:
    register long a7 __asm__("a7") = n;
    1c86:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1c8a:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1c8e:	2501                	sext.w	a0,a0
    1c90:	8082                	ret

0000000000001c92 <get_time>:

int64 get_time()
{
    1c92:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1c94:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1c98:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1c9a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c9c:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1ca0:	2501                	sext.w	a0,a0
    1ca2:	ed09                	bnez	a0,1cbc <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1ca4:	67a2                	ld	a5,8(sp)
    1ca6:	3e800713          	li	a4,1000
    1caa:	00015503          	lhu	a0,0(sp)
    1cae:	02e7d7b3          	divu	a5,a5,a4
    1cb2:	02e50533          	mul	a0,a0,a4
    1cb6:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1cb8:	0141                	addi	sp,sp,16
    1cba:	8082                	ret
        return -1;
    1cbc:	557d                	li	a0,-1
    1cbe:	bfed                	j	1cb8 <get_time+0x26>

0000000000001cc0 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1cc0:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cc4:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1cc8:	2501                	sext.w	a0,a0
    1cca:	8082                	ret

0000000000001ccc <time>:
    register long a7 __asm__("a7") = n;
    1ccc:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1cd0:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1cd4:	2501                	sext.w	a0,a0
    1cd6:	8082                	ret

0000000000001cd8 <sleep>:

int sleep(unsigned long long time)
{
    1cd8:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1cda:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1cdc:	850a                	mv	a0,sp
    1cde:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1ce0:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1ce4:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ce6:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1cea:	e501                	bnez	a0,1cf2 <sleep+0x1a>
    return 0;
    1cec:	4501                	li	a0,0
}
    1cee:	0141                	addi	sp,sp,16
    1cf0:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1cf2:	4502                	lw	a0,0(sp)
}
    1cf4:	0141                	addi	sp,sp,16
    1cf6:	8082                	ret

0000000000001cf8 <set_priority>:
    register long a7 __asm__("a7") = n;
    1cf8:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1cfc:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d00:	2501                	sext.w	a0,a0
    1d02:	8082                	ret

0000000000001d04 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d04:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d08:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d0c:	8082                	ret

0000000000001d0e <munmap>:
    register long a7 __asm__("a7") = n;
    1d0e:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d12:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d16:	2501                	sext.w	a0,a0
    1d18:	8082                	ret

0000000000001d1a <wait>:

int wait(int *code)
{
    1d1a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d1c:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d20:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d22:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d24:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d26:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d2a:	2501                	sext.w	a0,a0
    1d2c:	8082                	ret

0000000000001d2e <spawn>:
    register long a7 __asm__("a7") = n;
    1d2e:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d32:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d36:	2501                	sext.w	a0,a0
    1d38:	8082                	ret

0000000000001d3a <mailread>:
    register long a7 __asm__("a7") = n;
    1d3a:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d3e:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d42:	2501                	sext.w	a0,a0
    1d44:	8082                	ret

0000000000001d46 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d46:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d4a:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d4e:	2501                	sext.w	a0,a0
    1d50:	8082                	ret

0000000000001d52 <fstat>:
    register long a7 __asm__("a7") = n;
    1d52:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d56:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d5a:	2501                	sext.w	a0,a0
    1d5c:	8082                	ret

0000000000001d5e <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d5e:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d60:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d64:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d66:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d6a:	2501                	sext.w	a0,a0
    1d6c:	8082                	ret

0000000000001d6e <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1d6e:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d70:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1d74:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d76:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1d7a:	2501                	sext.w	a0,a0
    1d7c:	8082                	ret

0000000000001d7e <link>:

int link(char *old_path, char *new_path)
{
    1d7e:	87aa                	mv	a5,a0
    1d80:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1d82:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1d86:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d8a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1d8c:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1d90:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d92:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1d96:	2501                	sext.w	a0,a0
    1d98:	8082                	ret

0000000000001d9a <unlink>:

int unlink(char *path)
{
    1d9a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d9c:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1da0:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1da4:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da6:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1daa:	2501                	sext.w	a0,a0
    1dac:	8082                	ret

0000000000001dae <uname>:
    register long a7 __asm__("a7") = n;
    1dae:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1db2:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1db6:	2501                	sext.w	a0,a0
    1db8:	8082                	ret

0000000000001dba <brk>:
    register long a7 __asm__("a7") = n;
    1dba:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1dbe:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1dc2:	2501                	sext.w	a0,a0
    1dc4:	8082                	ret

0000000000001dc6 <getcwd>:
    register long a7 __asm__("a7") = n;
    1dc6:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc8:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1dcc:	8082                	ret

0000000000001dce <chdir>:
    register long a7 __asm__("a7") = n;
    1dce:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1dd2:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <mkdir>:

int mkdir(const char *path, mode_t mode){
    1dda:	862e                	mv	a2,a1
    1ddc:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1dde:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1de0:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1de4:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1de8:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dea:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dec:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <getdents>:
    register long a7 __asm__("a7") = n;
    1df4:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df8:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1dfc:	2501                	sext.w	a0,a0
    1dfe:	8082                	ret

0000000000001e00 <pipe>:
    register long a7 __asm__("a7") = n;
    1e00:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e04:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e06:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e0a:	2501                	sext.w	a0,a0
    1e0c:	8082                	ret

0000000000001e0e <dup>:
    register long a7 __asm__("a7") = n;
    1e0e:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e10:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e14:	2501                	sext.w	a0,a0
    1e16:	8082                	ret

0000000000001e18 <dup2>:
    register long a7 __asm__("a7") = n;
    1e18:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e1a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e1c:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e20:	2501                	sext.w	a0,a0
    1e22:	8082                	ret

0000000000001e24 <mount>:
    register long a7 __asm__("a7") = n;
    1e24:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e28:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e2c:	2501                	sext.w	a0,a0
    1e2e:	8082                	ret

0000000000001e30 <umount>:
    register long a7 __asm__("a7") = n;
    1e30:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e34:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e36:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e3a:	2501                	sext.w	a0,a0
    1e3c:	8082                	ret

0000000000001e3e <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e3e:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e40:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e42:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e44:	8532                	mv	a0,a2
	mv a2, a4
    1e46:	863a                	mv	a2,a4
	mv a3, a5
    1e48:	86be                	mv	a3,a5
	mv a4, a6
    1e4a:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e4c:	0dc00893          	li	a7,220
	ecall
    1e50:	00000073          	ecall

	beqz a0, 1f
    1e54:	c111                	beqz	a0,1e58 <__clone+0x1a>
	# Parent
	ret
    1e56:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e58:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e5a:	6522                	ld	a0,8(sp)
	jalr a1
    1e5c:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e5e:	05d00893          	li	a7,93
	ecall
    1e62:	00000073          	ecall
