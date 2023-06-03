
/home/lmq/Desktop/xv6-k210/test/build/riscv64/mount:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a88d                	j	1074 <__start_main>

0000000000001004 <test_mount>:

static char mntpoint[64] = "./mnt";
static char device[64] = "/dev/vda2";
static const char *fs_type = "vfat";

void test_mount() {
    1004:	1141                	addi	sp,sp,-16
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	e2a50513          	addi	a0,a0,-470 # 1e30 <__clone+0x2c>
void test_mount() {
    100e:	e406                	sd	ra,8(sp)
	TEST_START(__func__);
    1010:	262000ef          	jal	ra,1272 <puts>
    1014:	00001517          	auipc	a0,0x1
    1018:	ee450513          	addi	a0,a0,-284 # 1ef8 <__func__.1194>
    101c:	256000ef          	jal	ra,1272 <puts>
		ret = umount(mntpoint);
		printf("umount return: %d\n", ret);
	}

	TEST_END(__func__);
}
    1020:	60a2                	ld	ra,8(sp)
	TEST_START(__func__);
    1022:	00001517          	auipc	a0,0x1
    1026:	e2650513          	addi	a0,a0,-474 # 1e48 <__clone+0x44>
}
    102a:	0141                	addi	sp,sp,16
	TEST_START(__func__);
    102c:	a499                	j	1272 <puts>

000000000000102e <main>:

int main(int argc,char *argv[]) {
    102e:	1101                	addi	sp,sp,-32
    1030:	ec06                	sd	ra,24(sp)
    1032:	e822                	sd	s0,16(sp)
    1034:	e426                	sd	s1,8(sp)
	if(argc >= 2){
    1036:	4785                	li	a5,1
    1038:	00a7ca63          	blt	a5,a0,104c <main+0x1e>

	if(argc >= 3){
		strcpy(mntpoint, argv[2]);
	}

	test_mount();
    103c:	fc9ff0ef          	jal	ra,1004 <test_mount>
	return 0;
}
    1040:	60e2                	ld	ra,24(sp)
    1042:	6442                	ld	s0,16(sp)
    1044:	64a2                	ld	s1,8(sp)
    1046:	4501                	li	a0,0
    1048:	6105                	addi	sp,sp,32
    104a:	8082                	ret
		strcpy(device, argv[1]);
    104c:	84ae                	mv	s1,a1
    104e:	658c                	ld	a1,8(a1)
    1050:	842a                	mv	s0,a0
    1052:	00001517          	auipc	a0,0x1
    1056:	e2650513          	addi	a0,a0,-474 # 1e78 <device>
    105a:	0a9000ef          	jal	ra,1902 <strcpy>
	if(argc >= 3){
    105e:	4789                	li	a5,2
    1060:	fcf40ee3          	beq	s0,a5,103c <main+0xe>
		strcpy(mntpoint, argv[2]);
    1064:	688c                	ld	a1,16(s1)
    1066:	00001517          	auipc	a0,0x1
    106a:	e5250513          	addi	a0,a0,-430 # 1eb8 <mntpoint>
    106e:	095000ef          	jal	ra,1902 <strcpy>
    1072:	b7e9                	j	103c <main+0xe>

0000000000001074 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1074:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1076:	4108                	lw	a0,0(a0)
{
    1078:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    107a:	05a1                	addi	a1,a1,8
{
    107c:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    107e:	fb1ff0ef          	jal	ra,102e <main>
    1082:	39b000ef          	jal	ra,1c1c <exit>
	return 0;
}
    1086:	60a2                	ld	ra,8(sp)
    1088:	4501                	li	a0,0
    108a:	0141                	addi	sp,sp,16
    108c:	8082                	ret

000000000000108e <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    108e:	7179                	addi	sp,sp,-48
    1090:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1092:	12054b63          	bltz	a0,11c8 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1096:	02b577bb          	remuw	a5,a0,a1
    109a:	00001697          	auipc	a3,0x1
    109e:	e6e68693          	addi	a3,a3,-402 # 1f08 <digits>
    buf[16] = 0;
    10a2:	00010c23          	sb	zero,24(sp)
    i = 15;
    10a6:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    10aa:	1782                	slli	a5,a5,0x20
    10ac:	9381                	srli	a5,a5,0x20
    10ae:	97b6                	add	a5,a5,a3
    10b0:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    10b4:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    10b8:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    10bc:	16b56263          	bltu	a0,a1,1220 <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    10c0:	02e8763b          	remuw	a2,a6,a4
    10c4:	1602                	slli	a2,a2,0x20
    10c6:	9201                	srli	a2,a2,0x20
    10c8:	9636                	add	a2,a2,a3
    10ca:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10ce:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    10d2:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10d6:	12e86963          	bltu	a6,a4,1208 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    10da:	02e5f63b          	remuw	a2,a1,a4
    10de:	1602                	slli	a2,a2,0x20
    10e0:	9201                	srli	a2,a2,0x20
    10e2:	9636                	add	a2,a2,a3
    10e4:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    10e8:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    10ec:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    10f0:	10e5ef63          	bltu	a1,a4,120e <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    10f4:	02e8763b          	remuw	a2,a6,a4
    10f8:	1602                	slli	a2,a2,0x20
    10fa:	9201                	srli	a2,a2,0x20
    10fc:	9636                	add	a2,a2,a3
    10fe:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1102:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1106:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    110a:	10e86563          	bltu	a6,a4,1214 <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    110e:	02e5f63b          	remuw	a2,a1,a4
    1112:	1602                	slli	a2,a2,0x20
    1114:	9201                	srli	a2,a2,0x20
    1116:	9636                	add	a2,a2,a3
    1118:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    111c:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1120:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    1124:	0ee5eb63          	bltu	a1,a4,121a <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    1128:	02e8763b          	remuw	a2,a6,a4
    112c:	1602                	slli	a2,a2,0x20
    112e:	9201                	srli	a2,a2,0x20
    1130:	9636                	add	a2,a2,a3
    1132:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1136:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    113a:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    113e:	0ce86263          	bltu	a6,a4,1202 <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    1142:	02e5f63b          	remuw	a2,a1,a4
    1146:	1602                	slli	a2,a2,0x20
    1148:	9201                	srli	a2,a2,0x20
    114a:	9636                	add	a2,a2,a3
    114c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1150:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1154:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    1158:	0ce5e663          	bltu	a1,a4,1224 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    115c:	02e8763b          	remuw	a2,a6,a4
    1160:	1602                	slli	a2,a2,0x20
    1162:	9201                	srli	a2,a2,0x20
    1164:	9636                	add	a2,a2,a3
    1166:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    116a:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    116e:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    1172:	0ae86c63          	bltu	a6,a4,122a <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    1176:	02e5f63b          	remuw	a2,a1,a4
    117a:	1602                	slli	a2,a2,0x20
    117c:	9201                	srli	a2,a2,0x20
    117e:	9636                	add	a2,a2,a3
    1180:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1184:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    1188:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    118c:	0ae5e263          	bltu	a1,a4,1230 <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    1190:	1782                	slli	a5,a5,0x20
    1192:	9381                	srli	a5,a5,0x20
    1194:	97b6                	add	a5,a5,a3
    1196:	0007c703          	lbu	a4,0(a5)
    119a:	4599                	li	a1,6
    119c:	4795                	li	a5,5
    119e:	00e10723          	sb	a4,14(sp)

    if (sign)
    11a2:	00055963          	bgez	a0,11b4 <printint.constprop.0+0x126>
        buf[i--] = '-';
    11a6:	1018                	addi	a4,sp,32
    11a8:	973e                	add	a4,a4,a5
    11aa:	02d00693          	li	a3,45
    11ae:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    11b2:	85be                	mv	a1,a5
    write(f, s, l);
    11b4:	003c                	addi	a5,sp,8
    11b6:	4641                	li	a2,16
    11b8:	9e0d                	subw	a2,a2,a1
    11ba:	4505                	li	a0,1
    11bc:	95be                	add	a1,a1,a5
    11be:	20f000ef          	jal	ra,1bcc <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11c2:	70a2                	ld	ra,40(sp)
    11c4:	6145                	addi	sp,sp,48
    11c6:	8082                	ret
        x = -xx;
    11c8:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    11cc:	02b677bb          	remuw	a5,a2,a1
    11d0:	00001697          	auipc	a3,0x1
    11d4:	d3868693          	addi	a3,a3,-712 # 1f08 <digits>
    buf[16] = 0;
    11d8:	00010c23          	sb	zero,24(sp)
    i = 15;
    11dc:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    11e0:	1782                	slli	a5,a5,0x20
    11e2:	9381                	srli	a5,a5,0x20
    11e4:	97b6                	add	a5,a5,a3
    11e6:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    11ea:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11ee:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    11f2:	ecb677e3          	bgeu	a2,a1,10c0 <printint.constprop.0+0x32>
        buf[i--] = '-';
    11f6:	02d00793          	li	a5,45
    11fa:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    11fe:	45b9                	li	a1,14
    1200:	bf55                	j	11b4 <printint.constprop.0+0x126>
    1202:	47a5                	li	a5,9
    1204:	45a9                	li	a1,10
    1206:	bf71                	j	11a2 <printint.constprop.0+0x114>
    1208:	47b5                	li	a5,13
    120a:	45b9                	li	a1,14
    120c:	bf59                	j	11a2 <printint.constprop.0+0x114>
    120e:	47b1                	li	a5,12
    1210:	45b5                	li	a1,13
    1212:	bf41                	j	11a2 <printint.constprop.0+0x114>
    1214:	47ad                	li	a5,11
    1216:	45b1                	li	a1,12
    1218:	b769                	j	11a2 <printint.constprop.0+0x114>
    121a:	47a9                	li	a5,10
    121c:	45ad                	li	a1,11
    121e:	b751                	j	11a2 <printint.constprop.0+0x114>
    i = 15;
    1220:	45bd                	li	a1,15
    1222:	bf49                	j	11b4 <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    1224:	47a1                	li	a5,8
    1226:	45a5                	li	a1,9
    1228:	bfad                	j	11a2 <printint.constprop.0+0x114>
    122a:	479d                	li	a5,7
    122c:	45a1                	li	a1,8
    122e:	bf95                	j	11a2 <printint.constprop.0+0x114>
    1230:	4799                	li	a5,6
    1232:	459d                	li	a1,7
    1234:	b7bd                	j	11a2 <printint.constprop.0+0x114>

0000000000001236 <getchar>:
{
    1236:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1238:	00f10593          	addi	a1,sp,15
    123c:	4605                	li	a2,1
    123e:	4501                	li	a0,0
{
    1240:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1242:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1246:	17d000ef          	jal	ra,1bc2 <read>
}
    124a:	60e2                	ld	ra,24(sp)
    124c:	00f14503          	lbu	a0,15(sp)
    1250:	6105                	addi	sp,sp,32
    1252:	8082                	ret

0000000000001254 <putchar>:
{
    1254:	1101                	addi	sp,sp,-32
    1256:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    1258:	00f10593          	addi	a1,sp,15
    125c:	4605                	li	a2,1
    125e:	4505                	li	a0,1
{
    1260:	ec06                	sd	ra,24(sp)
    char byte = c;
    1262:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    1266:	167000ef          	jal	ra,1bcc <write>
}
    126a:	60e2                	ld	ra,24(sp)
    126c:	2501                	sext.w	a0,a0
    126e:	6105                	addi	sp,sp,32
    1270:	8082                	ret

0000000000001272 <puts>:
{
    1272:	1141                	addi	sp,sp,-16
    1274:	e406                	sd	ra,8(sp)
    1276:	e022                	sd	s0,0(sp)
    1278:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    127a:	56e000ef          	jal	ra,17e8 <strlen>
    127e:	862a                	mv	a2,a0
    1280:	85a2                	mv	a1,s0
    1282:	4505                	li	a0,1
    1284:	149000ef          	jal	ra,1bcc <write>
}
    1288:	60a2                	ld	ra,8(sp)
    128a:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    128c:	957d                	srai	a0,a0,0x3f
    return r;
    128e:	2501                	sext.w	a0,a0
}
    1290:	0141                	addi	sp,sp,16
    1292:	8082                	ret

0000000000001294 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1294:	7171                	addi	sp,sp,-176
    1296:	fc56                	sd	s5,56(sp)
    1298:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    129a:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    129c:	18bc                	addi	a5,sp,120
{
    129e:	e8ca                	sd	s2,80(sp)
    12a0:	e4ce                	sd	s3,72(sp)
    12a2:	e0d2                	sd	s4,64(sp)
    12a4:	f85a                	sd	s6,48(sp)
    12a6:	f486                	sd	ra,104(sp)
    12a8:	f0a2                	sd	s0,96(sp)
    12aa:	eca6                	sd	s1,88(sp)
    12ac:	fcae                	sd	a1,120(sp)
    12ae:	e132                	sd	a2,128(sp)
    12b0:	e536                	sd	a3,136(sp)
    12b2:	e93a                	sd	a4,144(sp)
    12b4:	f142                	sd	a6,160(sp)
    12b6:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    12b8:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12ba:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    12be:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    12c2:	00001b17          	auipc	s6,0x1
    12c6:	b96b0b13          	addi	s6,s6,-1130 # 1e58 <__clone+0x54>
    buf[i++] = '0';
    12ca:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12ce:	00001997          	auipc	s3,0x1
    12d2:	c3a98993          	addi	s3,s3,-966 # 1f08 <digits>
        if (!*s)
    12d6:	00054783          	lbu	a5,0(a0)
    12da:	16078a63          	beqz	a5,144e <printf+0x1ba>
    12de:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    12e0:	19278163          	beq	a5,s2,1462 <printf+0x1ce>
    12e4:	00164783          	lbu	a5,1(a2)
    12e8:	0605                	addi	a2,a2,1
    12ea:	fbfd                	bnez	a5,12e0 <printf+0x4c>
    12ec:	84b2                	mv	s1,a2
        l = z - a;
    12ee:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    12f2:	85aa                	mv	a1,a0
    12f4:	8622                	mv	a2,s0
    12f6:	4505                	li	a0,1
    12f8:	0d5000ef          	jal	ra,1bcc <write>
        if (l)
    12fc:	18041c63          	bnez	s0,1494 <printf+0x200>
        if (s[1] == 0)
    1300:	0014c783          	lbu	a5,1(s1)
    1304:	14078563          	beqz	a5,144e <printf+0x1ba>
        switch (s[1])
    1308:	1d478063          	beq	a5,s4,14c8 <printf+0x234>
    130c:	18fa6663          	bltu	s4,a5,1498 <printf+0x204>
    1310:	06400713          	li	a4,100
    1314:	1ae78063          	beq	a5,a4,14b4 <printf+0x220>
    1318:	07000713          	li	a4,112
    131c:	1ce79963          	bne	a5,a4,14ee <printf+0x25a>
            printptr(va_arg(ap, uint64));
    1320:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1322:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1326:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1328:	631c                	ld	a5,0(a4)
    132a:	0721                	addi	a4,a4,8
    132c:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    132e:	00479293          	slli	t0,a5,0x4
    1332:	00879f93          	slli	t6,a5,0x8
    1336:	00c79f13          	slli	t5,a5,0xc
    133a:	01079e93          	slli	t4,a5,0x10
    133e:	01479e13          	slli	t3,a5,0x14
    1342:	01879313          	slli	t1,a5,0x18
    1346:	01c79893          	slli	a7,a5,0x1c
    134a:	02479813          	slli	a6,a5,0x24
    134e:	02879513          	slli	a0,a5,0x28
    1352:	02c79593          	slli	a1,a5,0x2c
    1356:	03079693          	slli	a3,a5,0x30
    135a:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    135e:	03c7d413          	srli	s0,a5,0x3c
    1362:	01c7d39b          	srliw	t2,a5,0x1c
    1366:	03c2d293          	srli	t0,t0,0x3c
    136a:	03cfdf93          	srli	t6,t6,0x3c
    136e:	03cf5f13          	srli	t5,t5,0x3c
    1372:	03cede93          	srli	t4,t4,0x3c
    1376:	03ce5e13          	srli	t3,t3,0x3c
    137a:	03c35313          	srli	t1,t1,0x3c
    137e:	03c8d893          	srli	a7,a7,0x3c
    1382:	03c85813          	srli	a6,a6,0x3c
    1386:	9171                	srli	a0,a0,0x3c
    1388:	91f1                	srli	a1,a1,0x3c
    138a:	92f1                	srli	a3,a3,0x3c
    138c:	9371                	srli	a4,a4,0x3c
    138e:	96ce                	add	a3,a3,s3
    1390:	974e                	add	a4,a4,s3
    1392:	944e                	add	s0,s0,s3
    1394:	92ce                	add	t0,t0,s3
    1396:	9fce                	add	t6,t6,s3
    1398:	9f4e                	add	t5,t5,s3
    139a:	9ece                	add	t4,t4,s3
    139c:	9e4e                	add	t3,t3,s3
    139e:	934e                	add	t1,t1,s3
    13a0:	98ce                	add	a7,a7,s3
    13a2:	93ce                	add	t2,t2,s3
    13a4:	984e                	add	a6,a6,s3
    13a6:	954e                	add	a0,a0,s3
    13a8:	95ce                	add	a1,a1,s3
    13aa:	0006c083          	lbu	ra,0(a3)
    13ae:	0002c283          	lbu	t0,0(t0)
    13b2:	00074683          	lbu	a3,0(a4)
    13b6:	000fcf83          	lbu	t6,0(t6)
    13ba:	000f4f03          	lbu	t5,0(t5)
    13be:	000ece83          	lbu	t4,0(t4)
    13c2:	000e4e03          	lbu	t3,0(t3)
    13c6:	00034303          	lbu	t1,0(t1)
    13ca:	0008c883          	lbu	a7,0(a7)
    13ce:	0003c383          	lbu	t2,0(t2)
    13d2:	00084803          	lbu	a6,0(a6)
    13d6:	00054503          	lbu	a0,0(a0)
    13da:	0005c583          	lbu	a1,0(a1)
    13de:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13e2:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13e6:	9371                	srli	a4,a4,0x3c
    13e8:	8bbd                	andi	a5,a5,15
    13ea:	974e                	add	a4,a4,s3
    13ec:	97ce                	add	a5,a5,s3
    13ee:	005105a3          	sb	t0,11(sp)
    13f2:	01f10623          	sb	t6,12(sp)
    13f6:	01e106a3          	sb	t5,13(sp)
    13fa:	01d10723          	sb	t4,14(sp)
    13fe:	01c107a3          	sb	t3,15(sp)
    1402:	00610823          	sb	t1,16(sp)
    1406:	011108a3          	sb	a7,17(sp)
    140a:	00710923          	sb	t2,18(sp)
    140e:	010109a3          	sb	a6,19(sp)
    1412:	00a10a23          	sb	a0,20(sp)
    1416:	00b10aa3          	sb	a1,21(sp)
    141a:	00110b23          	sb	ra,22(sp)
    141e:	00d10ba3          	sb	a3,23(sp)
    1422:	00810523          	sb	s0,10(sp)
    1426:	00074703          	lbu	a4,0(a4)
    142a:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    142e:	002c                	addi	a1,sp,8
    1430:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1432:	00e10c23          	sb	a4,24(sp)
    1436:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    143a:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    143e:	78e000ef          	jal	ra,1bcc <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1442:	00248513          	addi	a0,s1,2
        if (!*s)
    1446:	00054783          	lbu	a5,0(a0)
    144a:	e8079ae3          	bnez	a5,12de <printf+0x4a>
    }
    va_end(ap);
}
    144e:	70a6                	ld	ra,104(sp)
    1450:	7406                	ld	s0,96(sp)
    1452:	64e6                	ld	s1,88(sp)
    1454:	6946                	ld	s2,80(sp)
    1456:	69a6                	ld	s3,72(sp)
    1458:	6a06                	ld	s4,64(sp)
    145a:	7ae2                	ld	s5,56(sp)
    145c:	7b42                	ld	s6,48(sp)
    145e:	614d                	addi	sp,sp,176
    1460:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1462:	00064783          	lbu	a5,0(a2)
    1466:	84b2                	mv	s1,a2
    1468:	01278963          	beq	a5,s2,147a <printf+0x1e6>
    146c:	b549                	j	12ee <printf+0x5a>
    146e:	0024c783          	lbu	a5,2(s1)
    1472:	0605                	addi	a2,a2,1
    1474:	0489                	addi	s1,s1,2
    1476:	e7279ce3          	bne	a5,s2,12ee <printf+0x5a>
    147a:	0014c783          	lbu	a5,1(s1)
    147e:	ff2788e3          	beq	a5,s2,146e <printf+0x1da>
        l = z - a;
    1482:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    1486:	85aa                	mv	a1,a0
    1488:	8622                	mv	a2,s0
    148a:	4505                	li	a0,1
    148c:	740000ef          	jal	ra,1bcc <write>
        if (l)
    1490:	e60408e3          	beqz	s0,1300 <printf+0x6c>
    1494:	8526                	mv	a0,s1
    1496:	b581                	j	12d6 <printf+0x42>
        switch (s[1])
    1498:	07800713          	li	a4,120
    149c:	04e79963          	bne	a5,a4,14ee <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    14a0:	6782                	ld	a5,0(sp)
    14a2:	45c1                	li	a1,16
    14a4:	4388                	lw	a0,0(a5)
    14a6:	07a1                	addi	a5,a5,8
    14a8:	e03e                	sd	a5,0(sp)
    14aa:	be5ff0ef          	jal	ra,108e <printint.constprop.0>
        s += 2;
    14ae:	00248513          	addi	a0,s1,2
    14b2:	bf51                	j	1446 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    14b4:	6782                	ld	a5,0(sp)
    14b6:	45a9                	li	a1,10
    14b8:	4388                	lw	a0,0(a5)
    14ba:	07a1                	addi	a5,a5,8
    14bc:	e03e                	sd	a5,0(sp)
    14be:	bd1ff0ef          	jal	ra,108e <printint.constprop.0>
        s += 2;
    14c2:	00248513          	addi	a0,s1,2
    14c6:	b741                	j	1446 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    14c8:	6782                	ld	a5,0(sp)
    14ca:	6380                	ld	s0,0(a5)
    14cc:	07a1                	addi	a5,a5,8
    14ce:	e03e                	sd	a5,0(sp)
    14d0:	c421                	beqz	s0,1518 <printf+0x284>
            l = strnlen(a, 200);
    14d2:	0c800593          	li	a1,200
    14d6:	8522                	mv	a0,s0
    14d8:	3fc000ef          	jal	ra,18d4 <strnlen>
    write(f, s, l);
    14dc:	0005061b          	sext.w	a2,a0
    14e0:	85a2                	mv	a1,s0
    14e2:	4505                	li	a0,1
    14e4:	6e8000ef          	jal	ra,1bcc <write>
        s += 2;
    14e8:	00248513          	addi	a0,s1,2
    14ec:	bfa9                	j	1446 <printf+0x1b2>
    char byte = c;
    14ee:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    14f2:	4605                	li	a2,1
    14f4:	002c                	addi	a1,sp,8
    14f6:	4505                	li	a0,1
    char byte = c;
    14f8:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    14fc:	6d0000ef          	jal	ra,1bcc <write>
    char byte = c;
    1500:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1504:	4605                	li	a2,1
    1506:	002c                	addi	a1,sp,8
    1508:	4505                	li	a0,1
    char byte = c;
    150a:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    150e:	6be000ef          	jal	ra,1bcc <write>
        s += 2;
    1512:	00248513          	addi	a0,s1,2
    1516:	bf05                	j	1446 <printf+0x1b2>
                a = "(null)";
    1518:	845a                	mv	s0,s6
    151a:	bf65                	j	14d2 <printf+0x23e>

000000000000151c <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    151c:	02000793          	li	a5,32
    1520:	00f50663          	beq	a0,a5,152c <isspace+0x10>
    1524:	355d                	addiw	a0,a0,-9
    1526:	00553513          	sltiu	a0,a0,5
    152a:	8082                	ret
    152c:	4505                	li	a0,1
}
    152e:	8082                	ret

0000000000001530 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1530:	fd05051b          	addiw	a0,a0,-48
}
    1534:	00a53513          	sltiu	a0,a0,10
    1538:	8082                	ret

000000000000153a <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    153a:	02000613          	li	a2,32
    153e:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1540:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1544:	ff77069b          	addiw	a3,a4,-9
    1548:	04c70d63          	beq	a4,a2,15a2 <atoi+0x68>
    154c:	0007079b          	sext.w	a5,a4
    1550:	04d5f963          	bgeu	a1,a3,15a2 <atoi+0x68>
        s++;
    switch (*s)
    1554:	02b00693          	li	a3,43
    1558:	04d70a63          	beq	a4,a3,15ac <atoi+0x72>
    155c:	02d00693          	li	a3,45
    1560:	06d70463          	beq	a4,a3,15c8 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1564:	fd07859b          	addiw	a1,a5,-48
    1568:	4625                	li	a2,9
    156a:	873e                	mv	a4,a5
    156c:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    156e:	4e01                	li	t3,0
    while (isdigit(*s))
    1570:	04b66a63          	bltu	a2,a1,15c4 <atoi+0x8a>
    int n = 0, neg = 0;
    1574:	4501                	li	a0,0
    while (isdigit(*s))
    1576:	4825                	li	a6,9
    1578:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    157c:	0025179b          	slliw	a5,a0,0x2
    1580:	9d3d                	addw	a0,a0,a5
    1582:	fd07031b          	addiw	t1,a4,-48
    1586:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    158a:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    158e:	0685                	addi	a3,a3,1
    1590:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1594:	0006071b          	sext.w	a4,a2
    1598:	feb870e3          	bgeu	a6,a1,1578 <atoi+0x3e>
    return neg ? n : -n;
    159c:	000e0563          	beqz	t3,15a6 <atoi+0x6c>
}
    15a0:	8082                	ret
        s++;
    15a2:	0505                	addi	a0,a0,1
    15a4:	bf71                	j	1540 <atoi+0x6>
    15a6:	4113053b          	subw	a0,t1,a7
    15aa:	8082                	ret
    while (isdigit(*s))
    15ac:	00154783          	lbu	a5,1(a0)
    15b0:	4625                	li	a2,9
        s++;
    15b2:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    15b6:	fd07859b          	addiw	a1,a5,-48
    15ba:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    15be:	4e01                	li	t3,0
    while (isdigit(*s))
    15c0:	fab67ae3          	bgeu	a2,a1,1574 <atoi+0x3a>
    15c4:	4501                	li	a0,0
}
    15c6:	8082                	ret
    while (isdigit(*s))
    15c8:	00154783          	lbu	a5,1(a0)
    15cc:	4625                	li	a2,9
        s++;
    15ce:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    15d2:	fd07859b          	addiw	a1,a5,-48
    15d6:	0007871b          	sext.w	a4,a5
    15da:	feb665e3          	bltu	a2,a1,15c4 <atoi+0x8a>
        neg = 1;
    15de:	4e05                	li	t3,1
    15e0:	bf51                	j	1574 <atoi+0x3a>

00000000000015e2 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    15e2:	16060d63          	beqz	a2,175c <memset+0x17a>
    15e6:	40a007b3          	neg	a5,a0
    15ea:	8b9d                	andi	a5,a5,7
    15ec:	00778713          	addi	a4,a5,7
    15f0:	482d                	li	a6,11
    15f2:	0ff5f593          	andi	a1,a1,255
    15f6:	fff60693          	addi	a3,a2,-1
    15fa:	17076263          	bltu	a4,a6,175e <memset+0x17c>
    15fe:	16e6ea63          	bltu	a3,a4,1772 <memset+0x190>
    1602:	16078563          	beqz	a5,176c <memset+0x18a>
    1606:	00b50023          	sb	a1,0(a0)
    160a:	4705                	li	a4,1
    160c:	00150e93          	addi	t4,a0,1
    1610:	14e78c63          	beq	a5,a4,1768 <memset+0x186>
    1614:	00b500a3          	sb	a1,1(a0)
    1618:	4709                	li	a4,2
    161a:	00250e93          	addi	t4,a0,2
    161e:	14e78d63          	beq	a5,a4,1778 <memset+0x196>
    1622:	00b50123          	sb	a1,2(a0)
    1626:	470d                	li	a4,3
    1628:	00350e93          	addi	t4,a0,3
    162c:	12e78b63          	beq	a5,a4,1762 <memset+0x180>
    1630:	00b501a3          	sb	a1,3(a0)
    1634:	4711                	li	a4,4
    1636:	00450e93          	addi	t4,a0,4
    163a:	14e78163          	beq	a5,a4,177c <memset+0x19a>
    163e:	00b50223          	sb	a1,4(a0)
    1642:	4715                	li	a4,5
    1644:	00550e93          	addi	t4,a0,5
    1648:	12e78c63          	beq	a5,a4,1780 <memset+0x19e>
    164c:	00b502a3          	sb	a1,5(a0)
    1650:	471d                	li	a4,7
    1652:	00650e93          	addi	t4,a0,6
    1656:	12e79763          	bne	a5,a4,1784 <memset+0x1a2>
    165a:	00750e93          	addi	t4,a0,7
    165e:	00b50323          	sb	a1,6(a0)
    1662:	4f1d                	li	t5,7
    1664:	00859713          	slli	a4,a1,0x8
    1668:	8f4d                	or	a4,a4,a1
    166a:	01059e13          	slli	t3,a1,0x10
    166e:	01c76e33          	or	t3,a4,t3
    1672:	01859313          	slli	t1,a1,0x18
    1676:	006e6333          	or	t1,t3,t1
    167a:	02059893          	slli	a7,a1,0x20
    167e:	011368b3          	or	a7,t1,a7
    1682:	02859813          	slli	a6,a1,0x28
    1686:	40f60333          	sub	t1,a2,a5
    168a:	0108e833          	or	a6,a7,a6
    168e:	03059693          	slli	a3,a1,0x30
    1692:	00d866b3          	or	a3,a6,a3
    1696:	03859713          	slli	a4,a1,0x38
    169a:	97aa                	add	a5,a5,a0
    169c:	ff837813          	andi	a6,t1,-8
    16a0:	8f55                	or	a4,a4,a3
    16a2:	00f806b3          	add	a3,a6,a5
    16a6:	e398                	sd	a4,0(a5)
    16a8:	07a1                	addi	a5,a5,8
    16aa:	fed79ee3          	bne	a5,a3,16a6 <memset+0xc4>
    16ae:	ff837693          	andi	a3,t1,-8
    16b2:	00de87b3          	add	a5,t4,a3
    16b6:	01e6873b          	addw	a4,a3,t5
    16ba:	0ad30663          	beq	t1,a3,1766 <memset+0x184>
    16be:	00b78023          	sb	a1,0(a5)
    16c2:	0017069b          	addiw	a3,a4,1
    16c6:	08c6fb63          	bgeu	a3,a2,175c <memset+0x17a>
    16ca:	00b780a3          	sb	a1,1(a5)
    16ce:	0027069b          	addiw	a3,a4,2
    16d2:	08c6f563          	bgeu	a3,a2,175c <memset+0x17a>
    16d6:	00b78123          	sb	a1,2(a5)
    16da:	0037069b          	addiw	a3,a4,3
    16de:	06c6ff63          	bgeu	a3,a2,175c <memset+0x17a>
    16e2:	00b781a3          	sb	a1,3(a5)
    16e6:	0047069b          	addiw	a3,a4,4
    16ea:	06c6f963          	bgeu	a3,a2,175c <memset+0x17a>
    16ee:	00b78223          	sb	a1,4(a5)
    16f2:	0057069b          	addiw	a3,a4,5
    16f6:	06c6f363          	bgeu	a3,a2,175c <memset+0x17a>
    16fa:	00b782a3          	sb	a1,5(a5)
    16fe:	0067069b          	addiw	a3,a4,6
    1702:	04c6fd63          	bgeu	a3,a2,175c <memset+0x17a>
    1706:	00b78323          	sb	a1,6(a5)
    170a:	0077069b          	addiw	a3,a4,7
    170e:	04c6f763          	bgeu	a3,a2,175c <memset+0x17a>
    1712:	00b783a3          	sb	a1,7(a5)
    1716:	0087069b          	addiw	a3,a4,8
    171a:	04c6f163          	bgeu	a3,a2,175c <memset+0x17a>
    171e:	00b78423          	sb	a1,8(a5)
    1722:	0097069b          	addiw	a3,a4,9
    1726:	02c6fb63          	bgeu	a3,a2,175c <memset+0x17a>
    172a:	00b784a3          	sb	a1,9(a5)
    172e:	00a7069b          	addiw	a3,a4,10
    1732:	02c6f563          	bgeu	a3,a2,175c <memset+0x17a>
    1736:	00b78523          	sb	a1,10(a5)
    173a:	00b7069b          	addiw	a3,a4,11
    173e:	00c6ff63          	bgeu	a3,a2,175c <memset+0x17a>
    1742:	00b785a3          	sb	a1,11(a5)
    1746:	00c7069b          	addiw	a3,a4,12
    174a:	00c6f963          	bgeu	a3,a2,175c <memset+0x17a>
    174e:	00b78623          	sb	a1,12(a5)
    1752:	2735                	addiw	a4,a4,13
    1754:	00c77463          	bgeu	a4,a2,175c <memset+0x17a>
    1758:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    175c:	8082                	ret
    175e:	472d                	li	a4,11
    1760:	bd79                	j	15fe <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1762:	4f0d                	li	t5,3
    1764:	b701                	j	1664 <memset+0x82>
    1766:	8082                	ret
    1768:	4f05                	li	t5,1
    176a:	bded                	j	1664 <memset+0x82>
    176c:	8eaa                	mv	t4,a0
    176e:	4f01                	li	t5,0
    1770:	bdd5                	j	1664 <memset+0x82>
    1772:	87aa                	mv	a5,a0
    1774:	4701                	li	a4,0
    1776:	b7a1                	j	16be <memset+0xdc>
    1778:	4f09                	li	t5,2
    177a:	b5ed                	j	1664 <memset+0x82>
    177c:	4f11                	li	t5,4
    177e:	b5dd                	j	1664 <memset+0x82>
    1780:	4f15                	li	t5,5
    1782:	b5cd                	j	1664 <memset+0x82>
    1784:	4f19                	li	t5,6
    1786:	bdf9                	j	1664 <memset+0x82>

0000000000001788 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1788:	00054783          	lbu	a5,0(a0)
    178c:	0005c703          	lbu	a4,0(a1)
    1790:	00e79863          	bne	a5,a4,17a0 <strcmp+0x18>
    1794:	0505                	addi	a0,a0,1
    1796:	0585                	addi	a1,a1,1
    1798:	fbe5                	bnez	a5,1788 <strcmp>
    179a:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    179c:	9d19                	subw	a0,a0,a4
    179e:	8082                	ret
    17a0:	0007851b          	sext.w	a0,a5
    17a4:	bfe5                	j	179c <strcmp+0x14>

00000000000017a6 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17a6:	ce05                	beqz	a2,17de <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17a8:	00054703          	lbu	a4,0(a0)
    17ac:	0005c783          	lbu	a5,0(a1)
    17b0:	cb0d                	beqz	a4,17e2 <strncmp+0x3c>
    if (!n--)
    17b2:	167d                	addi	a2,a2,-1
    17b4:	00c506b3          	add	a3,a0,a2
    17b8:	a819                	j	17ce <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17ba:	00a68e63          	beq	a3,a0,17d6 <strncmp+0x30>
    17be:	0505                	addi	a0,a0,1
    17c0:	00e79b63          	bne	a5,a4,17d6 <strncmp+0x30>
    17c4:	00054703          	lbu	a4,0(a0)
    17c8:	0005c783          	lbu	a5,0(a1)
    17cc:	cb19                	beqz	a4,17e2 <strncmp+0x3c>
    17ce:	0005c783          	lbu	a5,0(a1)
    17d2:	0585                	addi	a1,a1,1
    17d4:	f3fd                	bnez	a5,17ba <strncmp+0x14>
        ;
    return *l - *r;
    17d6:	0007051b          	sext.w	a0,a4
    17da:	9d1d                	subw	a0,a0,a5
    17dc:	8082                	ret
        return 0;
    17de:	4501                	li	a0,0
}
    17e0:	8082                	ret
    17e2:	4501                	li	a0,0
    return *l - *r;
    17e4:	9d1d                	subw	a0,a0,a5
    17e6:	8082                	ret

00000000000017e8 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    17e8:	00757793          	andi	a5,a0,7
    17ec:	cf89                	beqz	a5,1806 <strlen+0x1e>
    17ee:	87aa                	mv	a5,a0
    17f0:	a029                	j	17fa <strlen+0x12>
    17f2:	0785                	addi	a5,a5,1
    17f4:	0077f713          	andi	a4,a5,7
    17f8:	cb01                	beqz	a4,1808 <strlen+0x20>
        if (!*s)
    17fa:	0007c703          	lbu	a4,0(a5)
    17fe:	fb75                	bnez	a4,17f2 <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    1800:	40a78533          	sub	a0,a5,a0
}
    1804:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1806:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1808:	6394                	ld	a3,0(a5)
    180a:	00000597          	auipc	a1,0x0
    180e:	6565b583          	ld	a1,1622(a1) # 1e60 <__clone+0x5c>
    1812:	00000617          	auipc	a2,0x0
    1816:	65663603          	ld	a2,1622(a2) # 1e68 <__clone+0x64>
    181a:	a019                	j	1820 <strlen+0x38>
    181c:	6794                	ld	a3,8(a5)
    181e:	07a1                	addi	a5,a5,8
    1820:	00b68733          	add	a4,a3,a1
    1824:	fff6c693          	not	a3,a3
    1828:	8f75                	and	a4,a4,a3
    182a:	8f71                	and	a4,a4,a2
    182c:	db65                	beqz	a4,181c <strlen+0x34>
    for (; *s; s++)
    182e:	0007c703          	lbu	a4,0(a5)
    1832:	d779                	beqz	a4,1800 <strlen+0x18>
    1834:	0017c703          	lbu	a4,1(a5)
    1838:	0785                	addi	a5,a5,1
    183a:	d379                	beqz	a4,1800 <strlen+0x18>
    183c:	0017c703          	lbu	a4,1(a5)
    1840:	0785                	addi	a5,a5,1
    1842:	fb6d                	bnez	a4,1834 <strlen+0x4c>
    1844:	bf75                	j	1800 <strlen+0x18>

0000000000001846 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1846:	00757713          	andi	a4,a0,7
{
    184a:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    184c:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1850:	cb19                	beqz	a4,1866 <memchr+0x20>
    1852:	ce25                	beqz	a2,18ca <memchr+0x84>
    1854:	0007c703          	lbu	a4,0(a5)
    1858:	04b70e63          	beq	a4,a1,18b4 <memchr+0x6e>
    185c:	0785                	addi	a5,a5,1
    185e:	0077f713          	andi	a4,a5,7
    1862:	167d                	addi	a2,a2,-1
    1864:	f77d                	bnez	a4,1852 <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1866:	4501                	li	a0,0
    if (n && *s != c)
    1868:	c235                	beqz	a2,18cc <memchr+0x86>
    186a:	0007c703          	lbu	a4,0(a5)
    186e:	04b70363          	beq	a4,a1,18b4 <memchr+0x6e>
        size_t k = ONES * c;
    1872:	00000517          	auipc	a0,0x0
    1876:	5fe53503          	ld	a0,1534(a0) # 1e70 <__clone+0x6c>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    187a:	471d                	li	a4,7
        size_t k = ONES * c;
    187c:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1880:	02c77a63          	bgeu	a4,a2,18b4 <memchr+0x6e>
    1884:	00000897          	auipc	a7,0x0
    1888:	5dc8b883          	ld	a7,1500(a7) # 1e60 <__clone+0x5c>
    188c:	00000817          	auipc	a6,0x0
    1890:	5dc83803          	ld	a6,1500(a6) # 1e68 <__clone+0x64>
    1894:	431d                	li	t1,7
    1896:	a029                	j	18a0 <memchr+0x5a>
    1898:	1661                	addi	a2,a2,-8
    189a:	07a1                	addi	a5,a5,8
    189c:	02c37963          	bgeu	t1,a2,18ce <memchr+0x88>
    18a0:	6398                	ld	a4,0(a5)
    18a2:	8f29                	xor	a4,a4,a0
    18a4:	011706b3          	add	a3,a4,a7
    18a8:	fff74713          	not	a4,a4
    18ac:	8f75                	and	a4,a4,a3
    18ae:	01077733          	and	a4,a4,a6
    18b2:	d37d                	beqz	a4,1898 <memchr+0x52>
    18b4:	853e                	mv	a0,a5
    18b6:	97b2                	add	a5,a5,a2
    18b8:	a021                	j	18c0 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    18ba:	0505                	addi	a0,a0,1
    18bc:	00f50763          	beq	a0,a5,18ca <memchr+0x84>
    18c0:	00054703          	lbu	a4,0(a0)
    18c4:	feb71be3          	bne	a4,a1,18ba <memchr+0x74>
    18c8:	8082                	ret
    return n ? (void *)s : 0;
    18ca:	4501                	li	a0,0
}
    18cc:	8082                	ret
    return n ? (void *)s : 0;
    18ce:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    18d0:	f275                	bnez	a2,18b4 <memchr+0x6e>
}
    18d2:	8082                	ret

00000000000018d4 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    18d4:	1101                	addi	sp,sp,-32
    18d6:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    18d8:	862e                	mv	a2,a1
{
    18da:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    18dc:	4581                	li	a1,0
{
    18de:	e426                	sd	s1,8(sp)
    18e0:	ec06                	sd	ra,24(sp)
    18e2:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    18e4:	f63ff0ef          	jal	ra,1846 <memchr>
    return p ? p - s : n;
    18e8:	c519                	beqz	a0,18f6 <strnlen+0x22>
}
    18ea:	60e2                	ld	ra,24(sp)
    18ec:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    18ee:	8d05                	sub	a0,a0,s1
}
    18f0:	64a2                	ld	s1,8(sp)
    18f2:	6105                	addi	sp,sp,32
    18f4:	8082                	ret
    18f6:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    18f8:	8522                	mv	a0,s0
}
    18fa:	6442                	ld	s0,16(sp)
    18fc:	64a2                	ld	s1,8(sp)
    18fe:	6105                	addi	sp,sp,32
    1900:	8082                	ret

0000000000001902 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1902:	00b547b3          	xor	a5,a0,a1
    1906:	8b9d                	andi	a5,a5,7
    1908:	eb95                	bnez	a5,193c <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    190a:	0075f793          	andi	a5,a1,7
    190e:	e7b1                	bnez	a5,195a <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1910:	6198                	ld	a4,0(a1)
    1912:	00000617          	auipc	a2,0x0
    1916:	54e63603          	ld	a2,1358(a2) # 1e60 <__clone+0x5c>
    191a:	00000817          	auipc	a6,0x0
    191e:	54e83803          	ld	a6,1358(a6) # 1e68 <__clone+0x64>
    1922:	a029                	j	192c <strcpy+0x2a>
    1924:	e118                	sd	a4,0(a0)
    1926:	6598                	ld	a4,8(a1)
    1928:	05a1                	addi	a1,a1,8
    192a:	0521                	addi	a0,a0,8
    192c:	00c707b3          	add	a5,a4,a2
    1930:	fff74693          	not	a3,a4
    1934:	8ff5                	and	a5,a5,a3
    1936:	0107f7b3          	and	a5,a5,a6
    193a:	d7ed                	beqz	a5,1924 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    193c:	0005c783          	lbu	a5,0(a1)
    1940:	00f50023          	sb	a5,0(a0)
    1944:	c785                	beqz	a5,196c <strcpy+0x6a>
    1946:	0015c783          	lbu	a5,1(a1)
    194a:	0505                	addi	a0,a0,1
    194c:	0585                	addi	a1,a1,1
    194e:	00f50023          	sb	a5,0(a0)
    1952:	fbf5                	bnez	a5,1946 <strcpy+0x44>
        ;
    return d;
}
    1954:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    1956:	0505                	addi	a0,a0,1
    1958:	df45                	beqz	a4,1910 <strcpy+0xe>
            if (!(*d = *s))
    195a:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    195e:	0585                	addi	a1,a1,1
    1960:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    1964:	00f50023          	sb	a5,0(a0)
    1968:	f7fd                	bnez	a5,1956 <strcpy+0x54>
}
    196a:	8082                	ret
    196c:	8082                	ret

000000000000196e <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    196e:	00b547b3          	xor	a5,a0,a1
    1972:	8b9d                	andi	a5,a5,7
    1974:	1a079863          	bnez	a5,1b24 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1978:	0075f793          	andi	a5,a1,7
    197c:	16078463          	beqz	a5,1ae4 <strncpy+0x176>
    1980:	ea01                	bnez	a2,1990 <strncpy+0x22>
    1982:	a421                	j	1b8a <strncpy+0x21c>
    1984:	167d                	addi	a2,a2,-1
    1986:	0505                	addi	a0,a0,1
    1988:	14070e63          	beqz	a4,1ae4 <strncpy+0x176>
    198c:	1a060863          	beqz	a2,1b3c <strncpy+0x1ce>
    1990:	0005c783          	lbu	a5,0(a1)
    1994:	0585                	addi	a1,a1,1
    1996:	0075f713          	andi	a4,a1,7
    199a:	00f50023          	sb	a5,0(a0)
    199e:	f3fd                	bnez	a5,1984 <strncpy+0x16>
    19a0:	4805                	li	a6,1
    19a2:	1a061863          	bnez	a2,1b52 <strncpy+0x1e4>
    19a6:	40a007b3          	neg	a5,a0
    19aa:	8b9d                	andi	a5,a5,7
    19ac:	4681                	li	a3,0
    19ae:	18061a63          	bnez	a2,1b42 <strncpy+0x1d4>
    19b2:	00778713          	addi	a4,a5,7
    19b6:	45ad                	li	a1,11
    19b8:	18b76363          	bltu	a4,a1,1b3e <strncpy+0x1d0>
    19bc:	1ae6eb63          	bltu	a3,a4,1b72 <strncpy+0x204>
    19c0:	1a078363          	beqz	a5,1b66 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    19c4:	00050023          	sb	zero,0(a0)
    19c8:	4685                	li	a3,1
    19ca:	00150713          	addi	a4,a0,1
    19ce:	18d78f63          	beq	a5,a3,1b6c <strncpy+0x1fe>
    19d2:	000500a3          	sb	zero,1(a0)
    19d6:	4689                	li	a3,2
    19d8:	00250713          	addi	a4,a0,2
    19dc:	18d78e63          	beq	a5,a3,1b78 <strncpy+0x20a>
    19e0:	00050123          	sb	zero,2(a0)
    19e4:	468d                	li	a3,3
    19e6:	00350713          	addi	a4,a0,3
    19ea:	16d78c63          	beq	a5,a3,1b62 <strncpy+0x1f4>
    19ee:	000501a3          	sb	zero,3(a0)
    19f2:	4691                	li	a3,4
    19f4:	00450713          	addi	a4,a0,4
    19f8:	18d78263          	beq	a5,a3,1b7c <strncpy+0x20e>
    19fc:	00050223          	sb	zero,4(a0)
    1a00:	4695                	li	a3,5
    1a02:	00550713          	addi	a4,a0,5
    1a06:	16d78d63          	beq	a5,a3,1b80 <strncpy+0x212>
    1a0a:	000502a3          	sb	zero,5(a0)
    1a0e:	469d                	li	a3,7
    1a10:	00650713          	addi	a4,a0,6
    1a14:	16d79863          	bne	a5,a3,1b84 <strncpy+0x216>
    1a18:	00750713          	addi	a4,a0,7
    1a1c:	00050323          	sb	zero,6(a0)
    1a20:	40f80833          	sub	a6,a6,a5
    1a24:	ff887593          	andi	a1,a6,-8
    1a28:	97aa                	add	a5,a5,a0
    1a2a:	95be                	add	a1,a1,a5
    1a2c:	0007b023          	sd	zero,0(a5)
    1a30:	07a1                	addi	a5,a5,8
    1a32:	feb79de3          	bne	a5,a1,1a2c <strncpy+0xbe>
    1a36:	ff887593          	andi	a1,a6,-8
    1a3a:	9ead                	addw	a3,a3,a1
    1a3c:	00b707b3          	add	a5,a4,a1
    1a40:	12b80863          	beq	a6,a1,1b70 <strncpy+0x202>
    1a44:	00078023          	sb	zero,0(a5)
    1a48:	0016871b          	addiw	a4,a3,1
    1a4c:	0ec77863          	bgeu	a4,a2,1b3c <strncpy+0x1ce>
    1a50:	000780a3          	sb	zero,1(a5)
    1a54:	0026871b          	addiw	a4,a3,2
    1a58:	0ec77263          	bgeu	a4,a2,1b3c <strncpy+0x1ce>
    1a5c:	00078123          	sb	zero,2(a5)
    1a60:	0036871b          	addiw	a4,a3,3
    1a64:	0cc77c63          	bgeu	a4,a2,1b3c <strncpy+0x1ce>
    1a68:	000781a3          	sb	zero,3(a5)
    1a6c:	0046871b          	addiw	a4,a3,4
    1a70:	0cc77663          	bgeu	a4,a2,1b3c <strncpy+0x1ce>
    1a74:	00078223          	sb	zero,4(a5)
    1a78:	0056871b          	addiw	a4,a3,5
    1a7c:	0cc77063          	bgeu	a4,a2,1b3c <strncpy+0x1ce>
    1a80:	000782a3          	sb	zero,5(a5)
    1a84:	0066871b          	addiw	a4,a3,6
    1a88:	0ac77a63          	bgeu	a4,a2,1b3c <strncpy+0x1ce>
    1a8c:	00078323          	sb	zero,6(a5)
    1a90:	0076871b          	addiw	a4,a3,7
    1a94:	0ac77463          	bgeu	a4,a2,1b3c <strncpy+0x1ce>
    1a98:	000783a3          	sb	zero,7(a5)
    1a9c:	0086871b          	addiw	a4,a3,8
    1aa0:	08c77e63          	bgeu	a4,a2,1b3c <strncpy+0x1ce>
    1aa4:	00078423          	sb	zero,8(a5)
    1aa8:	0096871b          	addiw	a4,a3,9
    1aac:	08c77863          	bgeu	a4,a2,1b3c <strncpy+0x1ce>
    1ab0:	000784a3          	sb	zero,9(a5)
    1ab4:	00a6871b          	addiw	a4,a3,10
    1ab8:	08c77263          	bgeu	a4,a2,1b3c <strncpy+0x1ce>
    1abc:	00078523          	sb	zero,10(a5)
    1ac0:	00b6871b          	addiw	a4,a3,11
    1ac4:	06c77c63          	bgeu	a4,a2,1b3c <strncpy+0x1ce>
    1ac8:	000785a3          	sb	zero,11(a5)
    1acc:	00c6871b          	addiw	a4,a3,12
    1ad0:	06c77663          	bgeu	a4,a2,1b3c <strncpy+0x1ce>
    1ad4:	00078623          	sb	zero,12(a5)
    1ad8:	26b5                	addiw	a3,a3,13
    1ada:	06c6f163          	bgeu	a3,a2,1b3c <strncpy+0x1ce>
    1ade:	000786a3          	sb	zero,13(a5)
    1ae2:	8082                	ret
            ;
        if (!n || !*s)
    1ae4:	c645                	beqz	a2,1b8c <strncpy+0x21e>
    1ae6:	0005c783          	lbu	a5,0(a1)
    1aea:	ea078be3          	beqz	a5,19a0 <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1aee:	479d                	li	a5,7
    1af0:	02c7ff63          	bgeu	a5,a2,1b2e <strncpy+0x1c0>
    1af4:	00000897          	auipc	a7,0x0
    1af8:	36c8b883          	ld	a7,876(a7) # 1e60 <__clone+0x5c>
    1afc:	00000817          	auipc	a6,0x0
    1b00:	36c83803          	ld	a6,876(a6) # 1e68 <__clone+0x64>
    1b04:	431d                	li	t1,7
    1b06:	6198                	ld	a4,0(a1)
    1b08:	011707b3          	add	a5,a4,a7
    1b0c:	fff74693          	not	a3,a4
    1b10:	8ff5                	and	a5,a5,a3
    1b12:	0107f7b3          	and	a5,a5,a6
    1b16:	ef81                	bnez	a5,1b2e <strncpy+0x1c0>
            *wd = *ws;
    1b18:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b1a:	1661                	addi	a2,a2,-8
    1b1c:	05a1                	addi	a1,a1,8
    1b1e:	0521                	addi	a0,a0,8
    1b20:	fec363e3          	bltu	t1,a2,1b06 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b24:	e609                	bnez	a2,1b2e <strncpy+0x1c0>
    1b26:	a08d                	j	1b88 <strncpy+0x21a>
    1b28:	167d                	addi	a2,a2,-1
    1b2a:	0505                	addi	a0,a0,1
    1b2c:	ca01                	beqz	a2,1b3c <strncpy+0x1ce>
    1b2e:	0005c783          	lbu	a5,0(a1)
    1b32:	0585                	addi	a1,a1,1
    1b34:	00f50023          	sb	a5,0(a0)
    1b38:	fbe5                	bnez	a5,1b28 <strncpy+0x1ba>
        ;
tail:
    1b3a:	b59d                	j	19a0 <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1b3c:	8082                	ret
    1b3e:	472d                	li	a4,11
    1b40:	bdb5                	j	19bc <strncpy+0x4e>
    1b42:	00778713          	addi	a4,a5,7
    1b46:	45ad                	li	a1,11
    1b48:	fff60693          	addi	a3,a2,-1
    1b4c:	e6b778e3          	bgeu	a4,a1,19bc <strncpy+0x4e>
    1b50:	b7fd                	j	1b3e <strncpy+0x1d0>
    1b52:	40a007b3          	neg	a5,a0
    1b56:	8832                	mv	a6,a2
    1b58:	8b9d                	andi	a5,a5,7
    1b5a:	4681                	li	a3,0
    1b5c:	e4060be3          	beqz	a2,19b2 <strncpy+0x44>
    1b60:	b7cd                	j	1b42 <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b62:	468d                	li	a3,3
    1b64:	bd75                	j	1a20 <strncpy+0xb2>
    1b66:	872a                	mv	a4,a0
    1b68:	4681                	li	a3,0
    1b6a:	bd5d                	j	1a20 <strncpy+0xb2>
    1b6c:	4685                	li	a3,1
    1b6e:	bd4d                	j	1a20 <strncpy+0xb2>
    1b70:	8082                	ret
    1b72:	87aa                	mv	a5,a0
    1b74:	4681                	li	a3,0
    1b76:	b5f9                	j	1a44 <strncpy+0xd6>
    1b78:	4689                	li	a3,2
    1b7a:	b55d                	j	1a20 <strncpy+0xb2>
    1b7c:	4691                	li	a3,4
    1b7e:	b54d                	j	1a20 <strncpy+0xb2>
    1b80:	4695                	li	a3,5
    1b82:	bd79                	j	1a20 <strncpy+0xb2>
    1b84:	4699                	li	a3,6
    1b86:	bd69                	j	1a20 <strncpy+0xb2>
    1b88:	8082                	ret
    1b8a:	8082                	ret
    1b8c:	8082                	ret

0000000000001b8e <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1b8e:	87aa                	mv	a5,a0
    1b90:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1b92:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1b96:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1b9a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1b9c:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1b9e:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1ba2:	2501                	sext.w	a0,a0
    1ba4:	8082                	ret

0000000000001ba6 <openat>:
    register long a7 __asm__("a7") = n;
    1ba6:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1baa:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1bae:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1bb2:	2501                	sext.w	a0,a0
    1bb4:	8082                	ret

0000000000001bb6 <close>:
    register long a7 __asm__("a7") = n;
    1bb6:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1bba:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1bbe:	2501                	sext.w	a0,a0
    1bc0:	8082                	ret

0000000000001bc2 <read>:
    register long a7 __asm__("a7") = n;
    1bc2:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1bc6:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1bca:	8082                	ret

0000000000001bcc <write>:
    register long a7 __asm__("a7") = n;
    1bcc:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1bd0:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1bd4:	8082                	ret

0000000000001bd6 <getpid>:
    register long a7 __asm__("a7") = n;
    1bd6:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1bda:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1bde:	2501                	sext.w	a0,a0
    1be0:	8082                	ret

0000000000001be2 <getppid>:
    register long a7 __asm__("a7") = n;
    1be2:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1be6:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1bea:	2501                	sext.w	a0,a0
    1bec:	8082                	ret

0000000000001bee <sched_yield>:
    register long a7 __asm__("a7") = n;
    1bee:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1bf2:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1bf6:	2501                	sext.w	a0,a0
    1bf8:	8082                	ret

0000000000001bfa <fork>:
    register long a7 __asm__("a7") = n;
    1bfa:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1bfe:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c00:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c02:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c06:	2501                	sext.w	a0,a0
    1c08:	8082                	ret

0000000000001c0a <clone>:
// 子进程执行的执行的函数指针 | 函数参数 | 栈地址 | 栈的大小 | 标志位
pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c0a:	85b2                	mv	a1,a2
    1c0c:	863a                	mv	a2,a4
    if (stack)
    1c0e:	c191                	beqz	a1,1c12 <clone+0x8>
	stack += stack_size;
    1c10:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c12:	4781                	li	a5,0
    1c14:	4701                	li	a4,0
    1c16:	4681                	li	a3,0
    1c18:	2601                	sext.w	a2,a2
    1c1a:	a2ed                	j	1e04 <__clone>

0000000000001c1c <exit>:
    register long a7 __asm__("a7") = n;
    1c1c:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c20:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c24:	8082                	ret

0000000000001c26 <waitpid>:
    register long a7 __asm__("a7") = n;
    1c26:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c2a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c2c:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c30:	2501                	sext.w	a0,a0
    1c32:	8082                	ret

0000000000001c34 <exec>:
    register long a7 __asm__("a7") = n;
    1c34:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1c38:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1c3c:	2501                	sext.w	a0,a0
    1c3e:	8082                	ret

0000000000001c40 <execve>:
    register long a7 __asm__("a7") = n;
    1c40:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c44:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1c48:	2501                	sext.w	a0,a0
    1c4a:	8082                	ret

0000000000001c4c <times>:
    register long a7 __asm__("a7") = n;
    1c4c:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1c50:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1c54:	2501                	sext.w	a0,a0
    1c56:	8082                	ret

0000000000001c58 <get_time>:

int64 get_time()
{
    1c58:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1c5a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1c5e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1c60:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c62:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1c66:	2501                	sext.w	a0,a0
    1c68:	ed09                	bnez	a0,1c82 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1c6a:	67a2                	ld	a5,8(sp)
    1c6c:	3e800713          	li	a4,1000
    1c70:	00015503          	lhu	a0,0(sp)
    1c74:	02e7d7b3          	divu	a5,a5,a4
    1c78:	02e50533          	mul	a0,a0,a4
    1c7c:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1c7e:	0141                	addi	sp,sp,16
    1c80:	8082                	ret
        return -1;
    1c82:	557d                	li	a0,-1
    1c84:	bfed                	j	1c7e <get_time+0x26>

0000000000001c86 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1c86:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c8a:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1c8e:	2501                	sext.w	a0,a0
    1c90:	8082                	ret

0000000000001c92 <time>:
    register long a7 __asm__("a7") = n;
    1c92:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1c96:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1c9a:	2501                	sext.w	a0,a0
    1c9c:	8082                	ret

0000000000001c9e <sleep>:

int sleep(unsigned long long time)
{
    1c9e:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1ca0:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1ca2:	850a                	mv	a0,sp
    1ca4:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1ca6:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1caa:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cac:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1cb0:	e501                	bnez	a0,1cb8 <sleep+0x1a>
    return 0;
    1cb2:	4501                	li	a0,0
}
    1cb4:	0141                	addi	sp,sp,16
    1cb6:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1cb8:	4502                	lw	a0,0(sp)
}
    1cba:	0141                	addi	sp,sp,16
    1cbc:	8082                	ret

0000000000001cbe <set_priority>:
    register long a7 __asm__("a7") = n;
    1cbe:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1cc2:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1cc6:	2501                	sext.w	a0,a0
    1cc8:	8082                	ret

0000000000001cca <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1cca:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1cce:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1cd2:	8082                	ret

0000000000001cd4 <munmap>:
    register long a7 __asm__("a7") = n;
    1cd4:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cd8:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1cdc:	2501                	sext.w	a0,a0
    1cde:	8082                	ret

0000000000001ce0 <wait>:

int wait(int *code)
{
    1ce0:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ce2:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1ce6:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1ce8:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1cea:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cec:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1cf0:	2501                	sext.w	a0,a0
    1cf2:	8082                	ret

0000000000001cf4 <spawn>:
    register long a7 __asm__("a7") = n;
    1cf4:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1cf8:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1cfc:	2501                	sext.w	a0,a0
    1cfe:	8082                	ret

0000000000001d00 <mailread>:
    register long a7 __asm__("a7") = n;
    1d00:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d04:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d08:	2501                	sext.w	a0,a0
    1d0a:	8082                	ret

0000000000001d0c <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d0c:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d10:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d14:	2501                	sext.w	a0,a0
    1d16:	8082                	ret

0000000000001d18 <fstat>:
    register long a7 __asm__("a7") = n;
    1d18:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d1c:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d20:	2501                	sext.w	a0,a0
    1d22:	8082                	ret

0000000000001d24 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d24:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d26:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d2a:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d2c:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d30:	2501                	sext.w	a0,a0
    1d32:	8082                	ret

0000000000001d34 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1d34:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1d36:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1d3a:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d3c:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1d40:	2501                	sext.w	a0,a0
    1d42:	8082                	ret

0000000000001d44 <link>:

int link(char *old_path, char *new_path)
{
    1d44:	87aa                	mv	a5,a0
    1d46:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1d48:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1d4c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d50:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1d52:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1d56:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d58:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1d5c:	2501                	sext.w	a0,a0
    1d5e:	8082                	ret

0000000000001d60 <unlink>:

int unlink(char *path)
{
    1d60:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d62:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1d66:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1d6a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d6c:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1d70:	2501                	sext.w	a0,a0
    1d72:	8082                	ret

0000000000001d74 <uname>:
    register long a7 __asm__("a7") = n;
    1d74:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1d78:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1d7c:	2501                	sext.w	a0,a0
    1d7e:	8082                	ret

0000000000001d80 <brk>:
    register long a7 __asm__("a7") = n;
    1d80:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1d84:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1d88:	2501                	sext.w	a0,a0
    1d8a:	8082                	ret

0000000000001d8c <getcwd>:
    register long a7 __asm__("a7") = n;
    1d8c:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d8e:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1d92:	8082                	ret

0000000000001d94 <chdir>:
    register long a7 __asm__("a7") = n;
    1d94:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1d98:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1d9c:	2501                	sext.w	a0,a0
    1d9e:	8082                	ret

0000000000001da0 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1da0:	862e                	mv	a2,a1
    1da2:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1da4:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1da6:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1daa:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dae:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1db0:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db2:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1db6:	2501                	sext.w	a0,a0
    1db8:	8082                	ret

0000000000001dba <getdents>:
    register long a7 __asm__("a7") = n;
    1dba:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dbe:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1dc2:	2501                	sext.w	a0,a0
    1dc4:	8082                	ret

0000000000001dc6 <pipe>:
    register long a7 __asm__("a7") = n;
    1dc6:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1dca:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dcc:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <dup>:
    register long a7 __asm__("a7") = n;
    1dd4:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1dd6:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1dda:	2501                	sext.w	a0,a0
    1ddc:	8082                	ret

0000000000001dde <dup2>:
    register long a7 __asm__("a7") = n;
    1dde:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1de0:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de2:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1de6:	2501                	sext.w	a0,a0
    1de8:	8082                	ret

0000000000001dea <mount>:
    register long a7 __asm__("a7") = n;
    1dea:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dee:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1df2:	2501                	sext.w	a0,a0
    1df4:	8082                	ret

0000000000001df6 <umount>:
    register long a7 __asm__("a7") = n;
    1df6:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1dfa:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dfc:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e00:	2501                	sext.w	a0,a0
    1e02:	8082                	ret

0000000000001e04 <__clone>:
.global __clone
.type  __clone, %function
# 函数指针 | 栈地址 | 标志位
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e04:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e06:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e08:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e0a:	8532                	mv	a0,a2
	mv a2, a4
    1e0c:	863a                	mv	a2,a4
	mv a3, a5
    1e0e:	86be                	mv	a3,a5
	mv a4, a6
    1e10:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e12:	0dc00893          	li	a7,220
	ecall
    1e16:	00000073          	ecall

	beqz a0, 1f
    1e1a:	c111                	beqz	a0,1e1e <__clone+0x1a>
	# Parent
	ret
    1e1c:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e1e:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e20:	6522                	ld	a0,8(sp)
	jalr a1
    1e22:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e24:	05d00893          	li	a7,93
	ecall
    1e28:	00000073          	ecall
