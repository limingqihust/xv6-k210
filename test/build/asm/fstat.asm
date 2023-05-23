
/home/lmq/lmq/cscc/xv6-k210/test/build/riscv64/fstat:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	a0f1                	j	10ce <__start_main>

0000000000001004 <test_fstat>:

#define AT_FDCWD (-100) //相对路径

//Stat *kst;
static struct kstat kst;
void test_fstat() {
    1004:	1101                	addi	sp,sp,-32
	TEST_START(__func__);
    1006:	00001517          	auipc	a0,0x1
    100a:	e9250513          	addi	a0,a0,-366 # 1e98 <__clone+0x28>
void test_fstat() {
    100e:	ec06                	sd	ra,24(sp)
    1010:	e822                	sd	s0,16(sp)
	TEST_START(__func__);
    1012:	2ba000ef          	jal	ra,12cc <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	ffa50513          	addi	a0,a0,-6 # 2010 <__func__.1166>
    101e:	2ae000ef          	jal	ra,12cc <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	e8e50513          	addi	a0,a0,-370 # 1eb0 <__clone+0x40>
    102a:	2a2000ef          	jal	ra,12cc <puts>
	int fd = open("./text.txt", 0);
    102e:	4581                	li	a1,0
    1030:	00001517          	auipc	a0,0x1
    1034:	e9050513          	addi	a0,a0,-368 # 1ec0 <__clone+0x50>
    1038:	3c3000ef          	jal	ra,1bfa <open>
	int ret = fstat(fd, &kst);
    103c:	00001597          	auipc	a1,0x1
    1040:	f5458593          	addi	a1,a1,-172 # 1f90 <kst>
    1044:	541000ef          	jal	ra,1d84 <fstat>
    1048:	842a                	mv	s0,a0
	printf("fstat ret: %d\n", ret);
    104a:	85aa                	mv	a1,a0
    104c:	00001517          	auipc	a0,0x1
    1050:	e8450513          	addi	a0,a0,-380 # 1ed0 <__clone+0x60>
    1054:	29a000ef          	jal	ra,12ee <printf>
	assert(ret >= 0);
    1058:	04044c63          	bltz	s0,10b0 <test_fstat+0xac>

	printf("fstat: dev: %d, inode: %d, mode: %d, nlink: %d, size: %d, atime: %d, mtime: %d, ctime: %d\n",
    105c:	00001597          	auipc	a1,0x1
    1060:	f3458593          	addi	a1,a1,-204 # 1f90 <kst>
    1064:	0685b303          	ld	t1,104(a1)
    1068:	0585b883          	ld	a7,88(a1)
    106c:	0485b803          	ld	a6,72(a1)
    1070:	799c                	ld	a5,48(a1)
    1072:	49d8                	lw	a4,20(a1)
    1074:	4994                	lw	a3,16(a1)
    1076:	6590                	ld	a2,8(a1)
    1078:	618c                	ld	a1,0(a1)
    107a:	00001517          	auipc	a0,0x1
    107e:	e8650513          	addi	a0,a0,-378 # 1f00 <__clone+0x90>
    1082:	e01a                	sd	t1,0(sp)
    1084:	26a000ef          	jal	ra,12ee <printf>
	      kst.st_dev, kst.st_ino, kst.st_mode, kst.st_nlink, kst.st_size, kst.st_atime_sec, kst.st_mtime_sec, kst.st_ctime_sec);

	TEST_END(__func__);
    1088:	00001517          	auipc	a0,0x1
    108c:	ed850513          	addi	a0,a0,-296 # 1f60 <__clone+0xf0>
    1090:	23c000ef          	jal	ra,12cc <puts>
    1094:	00001517          	auipc	a0,0x1
    1098:	f7c50513          	addi	a0,a0,-132 # 2010 <__func__.1166>
    109c:	230000ef          	jal	ra,12cc <puts>
}
    10a0:	6442                	ld	s0,16(sp)
    10a2:	60e2                	ld	ra,24(sp)
	TEST_END(__func__);
    10a4:	00001517          	auipc	a0,0x1
    10a8:	e0c50513          	addi	a0,a0,-500 # 1eb0 <__clone+0x40>
}
    10ac:	6105                	addi	sp,sp,32
	TEST_END(__func__);
    10ae:	ac39                	j	12cc <puts>
	assert(ret >= 0);
    10b0:	00001517          	auipc	a0,0x1
    10b4:	e3050513          	addi	a0,a0,-464 # 1ee0 <__clone+0x70>
    10b8:	4be000ef          	jal	ra,1576 <panic>
    10bc:	b745                	j	105c <test_fstat+0x58>

00000000000010be <main>:

int main(void) {
    10be:	1141                	addi	sp,sp,-16
    10c0:	e406                	sd	ra,8(sp)
	test_fstat();
    10c2:	f43ff0ef          	jal	ra,1004 <test_fstat>
	return 0;
}
    10c6:	60a2                	ld	ra,8(sp)
    10c8:	4501                	li	a0,0
    10ca:	0141                	addi	sp,sp,16
    10cc:	8082                	ret

00000000000010ce <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ce:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10d0:	4108                	lw	a0,0(a0)
{
    10d2:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10d4:	05a1                	addi	a1,a1,8
{
    10d6:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10d8:	fe7ff0ef          	jal	ra,10be <main>
    10dc:	3ad000ef          	jal	ra,1c88 <exit>
	return 0;
}
    10e0:	60a2                	ld	ra,8(sp)
    10e2:	4501                	li	a0,0
    10e4:	0141                	addi	sp,sp,16
    10e6:	8082                	ret

00000000000010e8 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10e8:	7179                	addi	sp,sp,-48
    10ea:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10ec:	12054b63          	bltz	a0,1222 <printint.constprop.0+0x13a>

    buf[16] = 0;
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10f0:	02b577bb          	remuw	a5,a0,a1
    10f4:	00001697          	auipc	a3,0x1
    10f8:	f2c68693          	addi	a3,a3,-212 # 2020 <digits>
    buf[16] = 0;
    10fc:	00010c23          	sb	zero,24(sp)
    i = 15;
    1100:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    1104:	1782                	slli	a5,a5,0x20
    1106:	9381                	srli	a5,a5,0x20
    1108:	97b6                	add	a5,a5,a3
    110a:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    110e:	02b5583b          	divuw	a6,a0,a1
        buf[i--] = digits[x % base];
    1112:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1116:	16b56263          	bltu	a0,a1,127a <printint.constprop.0+0x192>
        buf[i--] = digits[x % base];
    111a:	02e8763b          	remuw	a2,a6,a4
    111e:	1602                	slli	a2,a2,0x20
    1120:	9201                	srli	a2,a2,0x20
    1122:	9636                	add	a2,a2,a3
    1124:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1128:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    112c:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1130:	12e86963          	bltu	a6,a4,1262 <printint.constprop.0+0x17a>
        buf[i--] = digits[x % base];
    1134:	02e5f63b          	remuw	a2,a1,a4
    1138:	1602                	slli	a2,a2,0x20
    113a:	9201                	srli	a2,a2,0x20
    113c:	9636                	add	a2,a2,a3
    113e:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1142:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    1146:	00c10aa3          	sb	a2,21(sp)
    } while ((x /= base) != 0);
    114a:	10e5ef63          	bltu	a1,a4,1268 <printint.constprop.0+0x180>
        buf[i--] = digits[x % base];
    114e:	02e8763b          	remuw	a2,a6,a4
    1152:	1602                	slli	a2,a2,0x20
    1154:	9201                	srli	a2,a2,0x20
    1156:	9636                	add	a2,a2,a3
    1158:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    115c:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1160:	00c10a23          	sb	a2,20(sp)
    } while ((x /= base) != 0);
    1164:	10e86563          	bltu	a6,a4,126e <printint.constprop.0+0x186>
        buf[i--] = digits[x % base];
    1168:	02e5f63b          	remuw	a2,a1,a4
    116c:	1602                	slli	a2,a2,0x20
    116e:	9201                	srli	a2,a2,0x20
    1170:	9636                	add	a2,a2,a3
    1172:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1176:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    117a:	00c109a3          	sb	a2,19(sp)
    } while ((x /= base) != 0);
    117e:	0ee5eb63          	bltu	a1,a4,1274 <printint.constprop.0+0x18c>
        buf[i--] = digits[x % base];
    1182:	02e8763b          	remuw	a2,a6,a4
    1186:	1602                	slli	a2,a2,0x20
    1188:	9201                	srli	a2,a2,0x20
    118a:	9636                	add	a2,a2,a3
    118c:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    1190:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    1194:	00c10923          	sb	a2,18(sp)
    } while ((x /= base) != 0);
    1198:	0ce86263          	bltu	a6,a4,125c <printint.constprop.0+0x174>
        buf[i--] = digits[x % base];
    119c:	02e5f63b          	remuw	a2,a1,a4
    11a0:	1602                	slli	a2,a2,0x20
    11a2:	9201                	srli	a2,a2,0x20
    11a4:	9636                	add	a2,a2,a3
    11a6:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11aa:	02e5d83b          	divuw	a6,a1,a4
        buf[i--] = digits[x % base];
    11ae:	00c108a3          	sb	a2,17(sp)
    } while ((x /= base) != 0);
    11b2:	0ce5e663          	bltu	a1,a4,127e <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    11b6:	02e8763b          	remuw	a2,a6,a4
    11ba:	1602                	slli	a2,a2,0x20
    11bc:	9201                	srli	a2,a2,0x20
    11be:	9636                	add	a2,a2,a3
    11c0:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11c4:	02e855bb          	divuw	a1,a6,a4
        buf[i--] = digits[x % base];
    11c8:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    11cc:	0ae86c63          	bltu	a6,a4,1284 <printint.constprop.0+0x19c>
        buf[i--] = digits[x % base];
    11d0:	02e5f63b          	remuw	a2,a1,a4
    11d4:	1602                	slli	a2,a2,0x20
    11d6:	9201                	srli	a2,a2,0x20
    11d8:	9636                	add	a2,a2,a3
    11da:	00064603          	lbu	a2,0(a2)
    } while ((x /= base) != 0);
    11de:	02e5d7bb          	divuw	a5,a1,a4
        buf[i--] = digits[x % base];
    11e2:	00c107a3          	sb	a2,15(sp)
    } while ((x /= base) != 0);
    11e6:	0ae5e263          	bltu	a1,a4,128a <printint.constprop.0+0x1a2>
        buf[i--] = digits[x % base];
    11ea:	1782                	slli	a5,a5,0x20
    11ec:	9381                	srli	a5,a5,0x20
    11ee:	97b6                	add	a5,a5,a3
    11f0:	0007c703          	lbu	a4,0(a5)
    11f4:	4599                	li	a1,6
    11f6:	4795                	li	a5,5
    11f8:	00e10723          	sb	a4,14(sp)

    if (sign)
    11fc:	00055963          	bgez	a0,120e <printint.constprop.0+0x126>
        buf[i--] = '-';
    1200:	1018                	addi	a4,sp,32
    1202:	973e                	add	a4,a4,a5
    1204:	02d00693          	li	a3,45
    1208:	fed70423          	sb	a3,-24(a4)
    i++;
    if (i < 0)
    120c:	85be                	mv	a1,a5
    write(f, s, l);
    120e:	003c                	addi	a5,sp,8
    1210:	4641                	li	a2,16
    1212:	9e0d                	subw	a2,a2,a1
    1214:	4505                	li	a0,1
    1216:	95be                	add	a1,a1,a5
    1218:	221000ef          	jal	ra,1c38 <write>
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    121c:	70a2                	ld	ra,40(sp)
    121e:	6145                	addi	sp,sp,48
    1220:	8082                	ret
        x = -xx;
    1222:	40a0063b          	negw	a2,a0
        buf[i--] = digits[x % base];
    1226:	02b677bb          	remuw	a5,a2,a1
    122a:	00001697          	auipc	a3,0x1
    122e:	df668693          	addi	a3,a3,-522 # 2020 <digits>
    buf[16] = 0;
    1232:	00010c23          	sb	zero,24(sp)
    i = 15;
    1236:	0005871b          	sext.w	a4,a1
        buf[i--] = digits[x % base];
    123a:	1782                	slli	a5,a5,0x20
    123c:	9381                	srli	a5,a5,0x20
    123e:	97b6                	add	a5,a5,a3
    1240:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1244:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1248:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    124c:	ecb677e3          	bgeu	a2,a1,111a <printint.constprop.0+0x32>
        buf[i--] = '-';
    1250:	02d00793          	li	a5,45
    1254:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1258:	45b9                	li	a1,14
    125a:	bf55                	j	120e <printint.constprop.0+0x126>
    125c:	47a5                	li	a5,9
    125e:	45a9                	li	a1,10
    1260:	bf71                	j	11fc <printint.constprop.0+0x114>
    1262:	47b5                	li	a5,13
    1264:	45b9                	li	a1,14
    1266:	bf59                	j	11fc <printint.constprop.0+0x114>
    1268:	47b1                	li	a5,12
    126a:	45b5                	li	a1,13
    126c:	bf41                	j	11fc <printint.constprop.0+0x114>
    126e:	47ad                	li	a5,11
    1270:	45b1                	li	a1,12
    1272:	b769                	j	11fc <printint.constprop.0+0x114>
    1274:	47a9                	li	a5,10
    1276:	45ad                	li	a1,11
    1278:	b751                	j	11fc <printint.constprop.0+0x114>
    i = 15;
    127a:	45bd                	li	a1,15
    127c:	bf49                	j	120e <printint.constprop.0+0x126>
        buf[i--] = digits[x % base];
    127e:	47a1                	li	a5,8
    1280:	45a5                	li	a1,9
    1282:	bfad                	j	11fc <printint.constprop.0+0x114>
    1284:	479d                	li	a5,7
    1286:	45a1                	li	a1,8
    1288:	bf95                	j	11fc <printint.constprop.0+0x114>
    128a:	4799                	li	a5,6
    128c:	459d                	li	a1,7
    128e:	b7bd                	j	11fc <printint.constprop.0+0x114>

0000000000001290 <getchar>:
{
    1290:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1292:	00f10593          	addi	a1,sp,15
    1296:	4605                	li	a2,1
    1298:	4501                	li	a0,0
{
    129a:	ec06                	sd	ra,24(sp)
    char byte = 0;
    129c:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12a0:	18f000ef          	jal	ra,1c2e <read>
}
    12a4:	60e2                	ld	ra,24(sp)
    12a6:	00f14503          	lbu	a0,15(sp)
    12aa:	6105                	addi	sp,sp,32
    12ac:	8082                	ret

00000000000012ae <putchar>:
{
    12ae:	1101                	addi	sp,sp,-32
    12b0:	87aa                	mv	a5,a0
    return write(stdout, &byte, 1);
    12b2:	00f10593          	addi	a1,sp,15
    12b6:	4605                	li	a2,1
    12b8:	4505                	li	a0,1
{
    12ba:	ec06                	sd	ra,24(sp)
    char byte = c;
    12bc:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    12c0:	179000ef          	jal	ra,1c38 <write>
}
    12c4:	60e2                	ld	ra,24(sp)
    12c6:	2501                	sext.w	a0,a0
    12c8:	6105                	addi	sp,sp,32
    12ca:	8082                	ret

00000000000012cc <puts>:
{
    12cc:	1141                	addi	sp,sp,-16
    12ce:	e406                	sd	ra,8(sp)
    12d0:	e022                	sd	s0,0(sp)
    12d2:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12d4:	580000ef          	jal	ra,1854 <strlen>
    12d8:	862a                	mv	a2,a0
    12da:	85a2                	mv	a1,s0
    12dc:	4505                	li	a0,1
    12de:	15b000ef          	jal	ra,1c38 <write>
}
    12e2:	60a2                	ld	ra,8(sp)
    12e4:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12e6:	957d                	srai	a0,a0,0x3f
    return r;
    12e8:	2501                	sext.w	a0,a0
}
    12ea:	0141                	addi	sp,sp,16
    12ec:	8082                	ret

00000000000012ee <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12ee:	7171                	addi	sp,sp,-176
    12f0:	fc56                	sd	s5,56(sp)
    12f2:	ed3e                	sd	a5,152(sp)
    buf[i++] = '0';
    12f4:	7ae1                	lui	s5,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12f6:	18bc                	addi	a5,sp,120
{
    12f8:	e8ca                	sd	s2,80(sp)
    12fa:	e4ce                	sd	s3,72(sp)
    12fc:	e0d2                	sd	s4,64(sp)
    12fe:	f85a                	sd	s6,48(sp)
    1300:	f486                	sd	ra,104(sp)
    1302:	f0a2                	sd	s0,96(sp)
    1304:	eca6                	sd	s1,88(sp)
    1306:	fcae                	sd	a1,120(sp)
    1308:	e132                	sd	a2,128(sp)
    130a:	e536                	sd	a3,136(sp)
    130c:	e93a                	sd	a4,144(sp)
    130e:	f142                	sd	a6,160(sp)
    1310:	f546                	sd	a7,168(sp)
    va_start(ap, fmt);
    1312:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1314:	02500913          	li	s2,37
        out(f, a, l);
        if (l)
            continue;
        if (s[1] == 0)
            break;
        switch (s[1])
    1318:	07300a13          	li	s4,115
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    131c:	00001b17          	auipc	s6,0x1
    1320:	c54b0b13          	addi	s6,s6,-940 # 1f70 <__clone+0x100>
    buf[i++] = '0';
    1324:	830aca93          	xori	s5,s5,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1328:	00001997          	auipc	s3,0x1
    132c:	cf898993          	addi	s3,s3,-776 # 2020 <digits>
        if (!*s)
    1330:	00054783          	lbu	a5,0(a0)
    1334:	16078a63          	beqz	a5,14a8 <printf+0x1ba>
    1338:	862a                	mv	a2,a0
        for (a = s; *s && *s != '%'; s++)
    133a:	19278163          	beq	a5,s2,14bc <printf+0x1ce>
    133e:	00164783          	lbu	a5,1(a2)
    1342:	0605                	addi	a2,a2,1
    1344:	fbfd                	bnez	a5,133a <printf+0x4c>
    1346:	84b2                	mv	s1,a2
        l = z - a;
    1348:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    134c:	85aa                	mv	a1,a0
    134e:	8622                	mv	a2,s0
    1350:	4505                	li	a0,1
    1352:	0e7000ef          	jal	ra,1c38 <write>
        if (l)
    1356:	18041c63          	bnez	s0,14ee <printf+0x200>
        if (s[1] == 0)
    135a:	0014c783          	lbu	a5,1(s1)
    135e:	14078563          	beqz	a5,14a8 <printf+0x1ba>
        switch (s[1])
    1362:	1d478063          	beq	a5,s4,1522 <printf+0x234>
    1366:	18fa6663          	bltu	s4,a5,14f2 <printf+0x204>
    136a:	06400713          	li	a4,100
    136e:	1ae78063          	beq	a5,a4,150e <printf+0x220>
    1372:	07000713          	li	a4,112
    1376:	1ce79963          	bne	a5,a4,1548 <printf+0x25a>
            printptr(va_arg(ap, uint64));
    137a:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    137c:	01511423          	sh	s5,8(sp)
    write(f, s, l);
    1380:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1382:	631c                	ld	a5,0(a4)
    1384:	0721                	addi	a4,a4,8
    1386:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1388:	00479293          	slli	t0,a5,0x4
    138c:	00879f93          	slli	t6,a5,0x8
    1390:	00c79f13          	slli	t5,a5,0xc
    1394:	01079e93          	slli	t4,a5,0x10
    1398:	01479e13          	slli	t3,a5,0x14
    139c:	01879313          	slli	t1,a5,0x18
    13a0:	01c79893          	slli	a7,a5,0x1c
    13a4:	02479813          	slli	a6,a5,0x24
    13a8:	02879513          	slli	a0,a5,0x28
    13ac:	02c79593          	slli	a1,a5,0x2c
    13b0:	03079693          	slli	a3,a5,0x30
    13b4:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13b8:	03c7d413          	srli	s0,a5,0x3c
    13bc:	01c7d39b          	srliw	t2,a5,0x1c
    13c0:	03c2d293          	srli	t0,t0,0x3c
    13c4:	03cfdf93          	srli	t6,t6,0x3c
    13c8:	03cf5f13          	srli	t5,t5,0x3c
    13cc:	03cede93          	srli	t4,t4,0x3c
    13d0:	03ce5e13          	srli	t3,t3,0x3c
    13d4:	03c35313          	srli	t1,t1,0x3c
    13d8:	03c8d893          	srli	a7,a7,0x3c
    13dc:	03c85813          	srli	a6,a6,0x3c
    13e0:	9171                	srli	a0,a0,0x3c
    13e2:	91f1                	srli	a1,a1,0x3c
    13e4:	92f1                	srli	a3,a3,0x3c
    13e6:	9371                	srli	a4,a4,0x3c
    13e8:	96ce                	add	a3,a3,s3
    13ea:	974e                	add	a4,a4,s3
    13ec:	944e                	add	s0,s0,s3
    13ee:	92ce                	add	t0,t0,s3
    13f0:	9fce                	add	t6,t6,s3
    13f2:	9f4e                	add	t5,t5,s3
    13f4:	9ece                	add	t4,t4,s3
    13f6:	9e4e                	add	t3,t3,s3
    13f8:	934e                	add	t1,t1,s3
    13fa:	98ce                	add	a7,a7,s3
    13fc:	93ce                	add	t2,t2,s3
    13fe:	984e                	add	a6,a6,s3
    1400:	954e                	add	a0,a0,s3
    1402:	95ce                	add	a1,a1,s3
    1404:	0006c083          	lbu	ra,0(a3)
    1408:	0002c283          	lbu	t0,0(t0)
    140c:	00074683          	lbu	a3,0(a4)
    1410:	000fcf83          	lbu	t6,0(t6)
    1414:	000f4f03          	lbu	t5,0(t5)
    1418:	000ece83          	lbu	t4,0(t4)
    141c:	000e4e03          	lbu	t3,0(t3)
    1420:	00034303          	lbu	t1,0(t1)
    1424:	0008c883          	lbu	a7,0(a7)
    1428:	0003c383          	lbu	t2,0(t2)
    142c:	00084803          	lbu	a6,0(a6)
    1430:	00054503          	lbu	a0,0(a0)
    1434:	0005c583          	lbu	a1,0(a1)
    1438:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    143c:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1440:	9371                	srli	a4,a4,0x3c
    1442:	8bbd                	andi	a5,a5,15
    1444:	974e                	add	a4,a4,s3
    1446:	97ce                	add	a5,a5,s3
    1448:	005105a3          	sb	t0,11(sp)
    144c:	01f10623          	sb	t6,12(sp)
    1450:	01e106a3          	sb	t5,13(sp)
    1454:	01d10723          	sb	t4,14(sp)
    1458:	01c107a3          	sb	t3,15(sp)
    145c:	00610823          	sb	t1,16(sp)
    1460:	011108a3          	sb	a7,17(sp)
    1464:	00710923          	sb	t2,18(sp)
    1468:	010109a3          	sb	a6,19(sp)
    146c:	00a10a23          	sb	a0,20(sp)
    1470:	00b10aa3          	sb	a1,21(sp)
    1474:	00110b23          	sb	ra,22(sp)
    1478:	00d10ba3          	sb	a3,23(sp)
    147c:	00810523          	sb	s0,10(sp)
    1480:	00074703          	lbu	a4,0(a4)
    1484:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1488:	002c                	addi	a1,sp,8
    148a:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    148c:	00e10c23          	sb	a4,24(sp)
    1490:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1494:	00010d23          	sb	zero,26(sp)
    write(f, s, l);
    1498:	7a0000ef          	jal	ra,1c38 <write>
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    149c:	00248513          	addi	a0,s1,2
        if (!*s)
    14a0:	00054783          	lbu	a5,0(a0)
    14a4:	e8079ae3          	bnez	a5,1338 <printf+0x4a>
    }
    va_end(ap);
}
    14a8:	70a6                	ld	ra,104(sp)
    14aa:	7406                	ld	s0,96(sp)
    14ac:	64e6                	ld	s1,88(sp)
    14ae:	6946                	ld	s2,80(sp)
    14b0:	69a6                	ld	s3,72(sp)
    14b2:	6a06                	ld	s4,64(sp)
    14b4:	7ae2                	ld	s5,56(sp)
    14b6:	7b42                	ld	s6,48(sp)
    14b8:	614d                	addi	sp,sp,176
    14ba:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14bc:	00064783          	lbu	a5,0(a2)
    14c0:	84b2                	mv	s1,a2
    14c2:	01278963          	beq	a5,s2,14d4 <printf+0x1e6>
    14c6:	b549                	j	1348 <printf+0x5a>
    14c8:	0024c783          	lbu	a5,2(s1)
    14cc:	0605                	addi	a2,a2,1
    14ce:	0489                	addi	s1,s1,2
    14d0:	e7279ce3          	bne	a5,s2,1348 <printf+0x5a>
    14d4:	0014c783          	lbu	a5,1(s1)
    14d8:	ff2788e3          	beq	a5,s2,14c8 <printf+0x1da>
        l = z - a;
    14dc:	40a6043b          	subw	s0,a2,a0
    write(f, s, l);
    14e0:	85aa                	mv	a1,a0
    14e2:	8622                	mv	a2,s0
    14e4:	4505                	li	a0,1
    14e6:	752000ef          	jal	ra,1c38 <write>
        if (l)
    14ea:	e60408e3          	beqz	s0,135a <printf+0x6c>
    14ee:	8526                	mv	a0,s1
    14f0:	b581                	j	1330 <printf+0x42>
        switch (s[1])
    14f2:	07800713          	li	a4,120
    14f6:	04e79963          	bne	a5,a4,1548 <printf+0x25a>
            printint(va_arg(ap, int), 16, 1);
    14fa:	6782                	ld	a5,0(sp)
    14fc:	45c1                	li	a1,16
    14fe:	4388                	lw	a0,0(a5)
    1500:	07a1                	addi	a5,a5,8
    1502:	e03e                	sd	a5,0(sp)
    1504:	be5ff0ef          	jal	ra,10e8 <printint.constprop.0>
        s += 2;
    1508:	00248513          	addi	a0,s1,2
    150c:	bf51                	j	14a0 <printf+0x1b2>
            printint(va_arg(ap, int), 10, 1);
    150e:	6782                	ld	a5,0(sp)
    1510:	45a9                	li	a1,10
    1512:	4388                	lw	a0,0(a5)
    1514:	07a1                	addi	a5,a5,8
    1516:	e03e                	sd	a5,0(sp)
    1518:	bd1ff0ef          	jal	ra,10e8 <printint.constprop.0>
        s += 2;
    151c:	00248513          	addi	a0,s1,2
    1520:	b741                	j	14a0 <printf+0x1b2>
            if ((a = va_arg(ap, char *)) == 0)
    1522:	6782                	ld	a5,0(sp)
    1524:	6380                	ld	s0,0(a5)
    1526:	07a1                	addi	a5,a5,8
    1528:	e03e                	sd	a5,0(sp)
    152a:	c421                	beqz	s0,1572 <printf+0x284>
            l = strnlen(a, 200);
    152c:	0c800593          	li	a1,200
    1530:	8522                	mv	a0,s0
    1532:	40e000ef          	jal	ra,1940 <strnlen>
    write(f, s, l);
    1536:	0005061b          	sext.w	a2,a0
    153a:	85a2                	mv	a1,s0
    153c:	4505                	li	a0,1
    153e:	6fa000ef          	jal	ra,1c38 <write>
        s += 2;
    1542:	00248513          	addi	a0,s1,2
    1546:	bfa9                	j	14a0 <printf+0x1b2>
    char byte = c;
    1548:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    154c:	4605                	li	a2,1
    154e:	002c                	addi	a1,sp,8
    1550:	4505                	li	a0,1
    char byte = c;
    1552:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1556:	6e2000ef          	jal	ra,1c38 <write>
    char byte = c;
    155a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    155e:	4605                	li	a2,1
    1560:	002c                	addi	a1,sp,8
    1562:	4505                	li	a0,1
    char byte = c;
    1564:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1568:	6d0000ef          	jal	ra,1c38 <write>
        s += 2;
    156c:	00248513          	addi	a0,s1,2
    1570:	bf05                	j	14a0 <printf+0x1b2>
                a = "(null)";
    1572:	845a                	mv	s0,s6
    1574:	bf65                	j	152c <printf+0x23e>

0000000000001576 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1576:	1141                	addi	sp,sp,-16
    1578:	e406                	sd	ra,8(sp)
    puts(m);
    157a:	d53ff0ef          	jal	ra,12cc <puts>
    exit(-100);
}
    157e:	60a2                	ld	ra,8(sp)
    exit(-100);
    1580:	f9c00513          	li	a0,-100
}
    1584:	0141                	addi	sp,sp,16
    exit(-100);
    1586:	a709                	j	1c88 <exit>

0000000000001588 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1588:	02000793          	li	a5,32
    158c:	00f50663          	beq	a0,a5,1598 <isspace+0x10>
    1590:	355d                	addiw	a0,a0,-9
    1592:	00553513          	sltiu	a0,a0,5
    1596:	8082                	ret
    1598:	4505                	li	a0,1
}
    159a:	8082                	ret

000000000000159c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    159c:	fd05051b          	addiw	a0,a0,-48
}
    15a0:	00a53513          	sltiu	a0,a0,10
    15a4:	8082                	ret

00000000000015a6 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a6:	02000613          	li	a2,32
    15aa:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15ac:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b0:	ff77069b          	addiw	a3,a4,-9
    15b4:	04c70d63          	beq	a4,a2,160e <atoi+0x68>
    15b8:	0007079b          	sext.w	a5,a4
    15bc:	04d5f963          	bgeu	a1,a3,160e <atoi+0x68>
        s++;
    switch (*s)
    15c0:	02b00693          	li	a3,43
    15c4:	04d70a63          	beq	a4,a3,1618 <atoi+0x72>
    15c8:	02d00693          	li	a3,45
    15cc:	06d70463          	beq	a4,a3,1634 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15d0:	fd07859b          	addiw	a1,a5,-48
    15d4:	4625                	li	a2,9
    15d6:	873e                	mv	a4,a5
    15d8:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15da:	4e01                	li	t3,0
    while (isdigit(*s))
    15dc:	04b66a63          	bltu	a2,a1,1630 <atoi+0x8a>
    int n = 0, neg = 0;
    15e0:	4501                	li	a0,0
    while (isdigit(*s))
    15e2:	4825                	li	a6,9
    15e4:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    15e8:	0025179b          	slliw	a5,a0,0x2
    15ec:	9d3d                	addw	a0,a0,a5
    15ee:	fd07031b          	addiw	t1,a4,-48
    15f2:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15f6:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15fa:	0685                	addi	a3,a3,1
    15fc:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1600:	0006071b          	sext.w	a4,a2
    1604:	feb870e3          	bgeu	a6,a1,15e4 <atoi+0x3e>
    return neg ? n : -n;
    1608:	000e0563          	beqz	t3,1612 <atoi+0x6c>
}
    160c:	8082                	ret
        s++;
    160e:	0505                	addi	a0,a0,1
    1610:	bf71                	j	15ac <atoi+0x6>
    1612:	4113053b          	subw	a0,t1,a7
    1616:	8082                	ret
    while (isdigit(*s))
    1618:	00154783          	lbu	a5,1(a0)
    161c:	4625                	li	a2,9
        s++;
    161e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1622:	fd07859b          	addiw	a1,a5,-48
    1626:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    162a:	4e01                	li	t3,0
    while (isdigit(*s))
    162c:	fab67ae3          	bgeu	a2,a1,15e0 <atoi+0x3a>
    1630:	4501                	li	a0,0
}
    1632:	8082                	ret
    while (isdigit(*s))
    1634:	00154783          	lbu	a5,1(a0)
    1638:	4625                	li	a2,9
        s++;
    163a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    163e:	fd07859b          	addiw	a1,a5,-48
    1642:	0007871b          	sext.w	a4,a5
    1646:	feb665e3          	bltu	a2,a1,1630 <atoi+0x8a>
        neg = 1;
    164a:	4e05                	li	t3,1
    164c:	bf51                	j	15e0 <atoi+0x3a>

000000000000164e <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    164e:	16060d63          	beqz	a2,17c8 <memset+0x17a>
    1652:	40a007b3          	neg	a5,a0
    1656:	8b9d                	andi	a5,a5,7
    1658:	00778713          	addi	a4,a5,7
    165c:	482d                	li	a6,11
    165e:	0ff5f593          	andi	a1,a1,255
    1662:	fff60693          	addi	a3,a2,-1
    1666:	17076263          	bltu	a4,a6,17ca <memset+0x17c>
    166a:	16e6ea63          	bltu	a3,a4,17de <memset+0x190>
    166e:	16078563          	beqz	a5,17d8 <memset+0x18a>
    1672:	00b50023          	sb	a1,0(a0)
    1676:	4705                	li	a4,1
    1678:	00150e93          	addi	t4,a0,1
    167c:	14e78c63          	beq	a5,a4,17d4 <memset+0x186>
    1680:	00b500a3          	sb	a1,1(a0)
    1684:	4709                	li	a4,2
    1686:	00250e93          	addi	t4,a0,2
    168a:	14e78d63          	beq	a5,a4,17e4 <memset+0x196>
    168e:	00b50123          	sb	a1,2(a0)
    1692:	470d                	li	a4,3
    1694:	00350e93          	addi	t4,a0,3
    1698:	12e78b63          	beq	a5,a4,17ce <memset+0x180>
    169c:	00b501a3          	sb	a1,3(a0)
    16a0:	4711                	li	a4,4
    16a2:	00450e93          	addi	t4,a0,4
    16a6:	14e78163          	beq	a5,a4,17e8 <memset+0x19a>
    16aa:	00b50223          	sb	a1,4(a0)
    16ae:	4715                	li	a4,5
    16b0:	00550e93          	addi	t4,a0,5
    16b4:	12e78c63          	beq	a5,a4,17ec <memset+0x19e>
    16b8:	00b502a3          	sb	a1,5(a0)
    16bc:	471d                	li	a4,7
    16be:	00650e93          	addi	t4,a0,6
    16c2:	12e79763          	bne	a5,a4,17f0 <memset+0x1a2>
    16c6:	00750e93          	addi	t4,a0,7
    16ca:	00b50323          	sb	a1,6(a0)
    16ce:	4f1d                	li	t5,7
    16d0:	00859713          	slli	a4,a1,0x8
    16d4:	8f4d                	or	a4,a4,a1
    16d6:	01059e13          	slli	t3,a1,0x10
    16da:	01c76e33          	or	t3,a4,t3
    16de:	01859313          	slli	t1,a1,0x18
    16e2:	006e6333          	or	t1,t3,t1
    16e6:	02059893          	slli	a7,a1,0x20
    16ea:	011368b3          	or	a7,t1,a7
    16ee:	02859813          	slli	a6,a1,0x28
    16f2:	40f60333          	sub	t1,a2,a5
    16f6:	0108e833          	or	a6,a7,a6
    16fa:	03059693          	slli	a3,a1,0x30
    16fe:	00d866b3          	or	a3,a6,a3
    1702:	03859713          	slli	a4,a1,0x38
    1706:	97aa                	add	a5,a5,a0
    1708:	ff837813          	andi	a6,t1,-8
    170c:	8f55                	or	a4,a4,a3
    170e:	00f806b3          	add	a3,a6,a5
    1712:	e398                	sd	a4,0(a5)
    1714:	07a1                	addi	a5,a5,8
    1716:	fed79ee3          	bne	a5,a3,1712 <memset+0xc4>
    171a:	ff837693          	andi	a3,t1,-8
    171e:	00de87b3          	add	a5,t4,a3
    1722:	01e6873b          	addw	a4,a3,t5
    1726:	0ad30663          	beq	t1,a3,17d2 <memset+0x184>
    172a:	00b78023          	sb	a1,0(a5)
    172e:	0017069b          	addiw	a3,a4,1
    1732:	08c6fb63          	bgeu	a3,a2,17c8 <memset+0x17a>
    1736:	00b780a3          	sb	a1,1(a5)
    173a:	0027069b          	addiw	a3,a4,2
    173e:	08c6f563          	bgeu	a3,a2,17c8 <memset+0x17a>
    1742:	00b78123          	sb	a1,2(a5)
    1746:	0037069b          	addiw	a3,a4,3
    174a:	06c6ff63          	bgeu	a3,a2,17c8 <memset+0x17a>
    174e:	00b781a3          	sb	a1,3(a5)
    1752:	0047069b          	addiw	a3,a4,4
    1756:	06c6f963          	bgeu	a3,a2,17c8 <memset+0x17a>
    175a:	00b78223          	sb	a1,4(a5)
    175e:	0057069b          	addiw	a3,a4,5
    1762:	06c6f363          	bgeu	a3,a2,17c8 <memset+0x17a>
    1766:	00b782a3          	sb	a1,5(a5)
    176a:	0067069b          	addiw	a3,a4,6
    176e:	04c6fd63          	bgeu	a3,a2,17c8 <memset+0x17a>
    1772:	00b78323          	sb	a1,6(a5)
    1776:	0077069b          	addiw	a3,a4,7
    177a:	04c6f763          	bgeu	a3,a2,17c8 <memset+0x17a>
    177e:	00b783a3          	sb	a1,7(a5)
    1782:	0087069b          	addiw	a3,a4,8
    1786:	04c6f163          	bgeu	a3,a2,17c8 <memset+0x17a>
    178a:	00b78423          	sb	a1,8(a5)
    178e:	0097069b          	addiw	a3,a4,9
    1792:	02c6fb63          	bgeu	a3,a2,17c8 <memset+0x17a>
    1796:	00b784a3          	sb	a1,9(a5)
    179a:	00a7069b          	addiw	a3,a4,10
    179e:	02c6f563          	bgeu	a3,a2,17c8 <memset+0x17a>
    17a2:	00b78523          	sb	a1,10(a5)
    17a6:	00b7069b          	addiw	a3,a4,11
    17aa:	00c6ff63          	bgeu	a3,a2,17c8 <memset+0x17a>
    17ae:	00b785a3          	sb	a1,11(a5)
    17b2:	00c7069b          	addiw	a3,a4,12
    17b6:	00c6f963          	bgeu	a3,a2,17c8 <memset+0x17a>
    17ba:	00b78623          	sb	a1,12(a5)
    17be:	2735                	addiw	a4,a4,13
    17c0:	00c77463          	bgeu	a4,a2,17c8 <memset+0x17a>
    17c4:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17c8:	8082                	ret
    17ca:	472d                	li	a4,11
    17cc:	bd79                	j	166a <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ce:	4f0d                	li	t5,3
    17d0:	b701                	j	16d0 <memset+0x82>
    17d2:	8082                	ret
    17d4:	4f05                	li	t5,1
    17d6:	bded                	j	16d0 <memset+0x82>
    17d8:	8eaa                	mv	t4,a0
    17da:	4f01                	li	t5,0
    17dc:	bdd5                	j	16d0 <memset+0x82>
    17de:	87aa                	mv	a5,a0
    17e0:	4701                	li	a4,0
    17e2:	b7a1                	j	172a <memset+0xdc>
    17e4:	4f09                	li	t5,2
    17e6:	b5ed                	j	16d0 <memset+0x82>
    17e8:	4f11                	li	t5,4
    17ea:	b5dd                	j	16d0 <memset+0x82>
    17ec:	4f15                	li	t5,5
    17ee:	b5cd                	j	16d0 <memset+0x82>
    17f0:	4f19                	li	t5,6
    17f2:	bdf9                	j	16d0 <memset+0x82>

00000000000017f4 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17f4:	00054783          	lbu	a5,0(a0)
    17f8:	0005c703          	lbu	a4,0(a1)
    17fc:	00e79863          	bne	a5,a4,180c <strcmp+0x18>
    1800:	0505                	addi	a0,a0,1
    1802:	0585                	addi	a1,a1,1
    1804:	fbe5                	bnez	a5,17f4 <strcmp>
    1806:	4501                	li	a0,0
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
}
    1808:	9d19                	subw	a0,a0,a4
    180a:	8082                	ret
    180c:	0007851b          	sext.w	a0,a5
    1810:	bfe5                	j	1808 <strcmp+0x14>

0000000000001812 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1812:	ce05                	beqz	a2,184a <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1814:	00054703          	lbu	a4,0(a0)
    1818:	0005c783          	lbu	a5,0(a1)
    181c:	cb0d                	beqz	a4,184e <strncmp+0x3c>
    if (!n--)
    181e:	167d                	addi	a2,a2,-1
    1820:	00c506b3          	add	a3,a0,a2
    1824:	a819                	j	183a <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1826:	00a68e63          	beq	a3,a0,1842 <strncmp+0x30>
    182a:	0505                	addi	a0,a0,1
    182c:	00e79b63          	bne	a5,a4,1842 <strncmp+0x30>
    1830:	00054703          	lbu	a4,0(a0)
    1834:	0005c783          	lbu	a5,0(a1)
    1838:	cb19                	beqz	a4,184e <strncmp+0x3c>
    183a:	0005c783          	lbu	a5,0(a1)
    183e:	0585                	addi	a1,a1,1
    1840:	f3fd                	bnez	a5,1826 <strncmp+0x14>
        ;
    return *l - *r;
    1842:	0007051b          	sext.w	a0,a4
    1846:	9d1d                	subw	a0,a0,a5
    1848:	8082                	ret
        return 0;
    184a:	4501                	li	a0,0
}
    184c:	8082                	ret
    184e:	4501                	li	a0,0
    return *l - *r;
    1850:	9d1d                	subw	a0,a0,a5
    1852:	8082                	ret

0000000000001854 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1854:	00757793          	andi	a5,a0,7
    1858:	cf89                	beqz	a5,1872 <strlen+0x1e>
    185a:	87aa                	mv	a5,a0
    185c:	a029                	j	1866 <strlen+0x12>
    185e:	0785                	addi	a5,a5,1
    1860:	0077f713          	andi	a4,a5,7
    1864:	cb01                	beqz	a4,1874 <strlen+0x20>
        if (!*s)
    1866:	0007c703          	lbu	a4,0(a5)
    186a:	fb75                	bnez	a4,185e <strlen+0xa>
    for (w = (const void *)s; !HASZERO(*w); w++)
        ;
    s = (const void *)w;
    for (; *s; s++)
        ;
    return s - a;
    186c:	40a78533          	sub	a0,a5,a0
}
    1870:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1872:	87aa                	mv	a5,a0
    for (w = (const void *)s; !HASZERO(*w); w++)
    1874:	6394                	ld	a3,0(a5)
    1876:	00000597          	auipc	a1,0x0
    187a:	7025b583          	ld	a1,1794(a1) # 1f78 <__clone+0x108>
    187e:	00000617          	auipc	a2,0x0
    1882:	70263603          	ld	a2,1794(a2) # 1f80 <__clone+0x110>
    1886:	a019                	j	188c <strlen+0x38>
    1888:	6794                	ld	a3,8(a5)
    188a:	07a1                	addi	a5,a5,8
    188c:	00b68733          	add	a4,a3,a1
    1890:	fff6c693          	not	a3,a3
    1894:	8f75                	and	a4,a4,a3
    1896:	8f71                	and	a4,a4,a2
    1898:	db65                	beqz	a4,1888 <strlen+0x34>
    for (; *s; s++)
    189a:	0007c703          	lbu	a4,0(a5)
    189e:	d779                	beqz	a4,186c <strlen+0x18>
    18a0:	0017c703          	lbu	a4,1(a5)
    18a4:	0785                	addi	a5,a5,1
    18a6:	d379                	beqz	a4,186c <strlen+0x18>
    18a8:	0017c703          	lbu	a4,1(a5)
    18ac:	0785                	addi	a5,a5,1
    18ae:	fb6d                	bnez	a4,18a0 <strlen+0x4c>
    18b0:	bf75                	j	186c <strlen+0x18>

00000000000018b2 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18b2:	00757713          	andi	a4,a0,7
{
    18b6:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    18b8:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18bc:	cb19                	beqz	a4,18d2 <memchr+0x20>
    18be:	ce25                	beqz	a2,1936 <memchr+0x84>
    18c0:	0007c703          	lbu	a4,0(a5)
    18c4:	04b70e63          	beq	a4,a1,1920 <memchr+0x6e>
    18c8:	0785                	addi	a5,a5,1
    18ca:	0077f713          	andi	a4,a5,7
    18ce:	167d                	addi	a2,a2,-1
    18d0:	f77d                	bnez	a4,18be <memchr+0xc>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18d2:	4501                	li	a0,0
    if (n && *s != c)
    18d4:	c235                	beqz	a2,1938 <memchr+0x86>
    18d6:	0007c703          	lbu	a4,0(a5)
    18da:	04b70363          	beq	a4,a1,1920 <memchr+0x6e>
        size_t k = ONES * c;
    18de:	00000517          	auipc	a0,0x0
    18e2:	6aa53503          	ld	a0,1706(a0) # 1f88 <__clone+0x118>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18e6:	471d                	li	a4,7
        size_t k = ONES * c;
    18e8:	02a58533          	mul	a0,a1,a0
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18ec:	02c77a63          	bgeu	a4,a2,1920 <memchr+0x6e>
    18f0:	00000897          	auipc	a7,0x0
    18f4:	6888b883          	ld	a7,1672(a7) # 1f78 <__clone+0x108>
    18f8:	00000817          	auipc	a6,0x0
    18fc:	68883803          	ld	a6,1672(a6) # 1f80 <__clone+0x110>
    1900:	431d                	li	t1,7
    1902:	a029                	j	190c <memchr+0x5a>
    1904:	1661                	addi	a2,a2,-8
    1906:	07a1                	addi	a5,a5,8
    1908:	02c37963          	bgeu	t1,a2,193a <memchr+0x88>
    190c:	6398                	ld	a4,0(a5)
    190e:	8f29                	xor	a4,a4,a0
    1910:	011706b3          	add	a3,a4,a7
    1914:	fff74713          	not	a4,a4
    1918:	8f75                	and	a4,a4,a3
    191a:	01077733          	and	a4,a4,a6
    191e:	d37d                	beqz	a4,1904 <memchr+0x52>
    1920:	853e                	mv	a0,a5
    1922:	97b2                	add	a5,a5,a2
    1924:	a021                	j	192c <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    1926:	0505                	addi	a0,a0,1
    1928:	00f50763          	beq	a0,a5,1936 <memchr+0x84>
    192c:	00054703          	lbu	a4,0(a0)
    1930:	feb71be3          	bne	a4,a1,1926 <memchr+0x74>
    1934:	8082                	ret
    return n ? (void *)s : 0;
    1936:	4501                	li	a0,0
}
    1938:	8082                	ret
    return n ? (void *)s : 0;
    193a:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    193c:	f275                	bnez	a2,1920 <memchr+0x6e>
}
    193e:	8082                	ret

0000000000001940 <strnlen>:

size_t strnlen(const char *s, size_t n)
{
    1940:	1101                	addi	sp,sp,-32
    1942:	e822                	sd	s0,16(sp)
    const char *p = memchr(s, 0, n);
    1944:	862e                	mv	a2,a1
{
    1946:	842e                	mv	s0,a1
    const char *p = memchr(s, 0, n);
    1948:	4581                	li	a1,0
{
    194a:	e426                	sd	s1,8(sp)
    194c:	ec06                	sd	ra,24(sp)
    194e:	84aa                	mv	s1,a0
    const char *p = memchr(s, 0, n);
    1950:	f63ff0ef          	jal	ra,18b2 <memchr>
    return p ? p - s : n;
    1954:	c519                	beqz	a0,1962 <strnlen+0x22>
}
    1956:	60e2                	ld	ra,24(sp)
    1958:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    195a:	8d05                	sub	a0,a0,s1
}
    195c:	64a2                	ld	s1,8(sp)
    195e:	6105                	addi	sp,sp,32
    1960:	8082                	ret
    1962:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    1964:	8522                	mv	a0,s0
}
    1966:	6442                	ld	s0,16(sp)
    1968:	64a2                	ld	s1,8(sp)
    196a:	6105                	addi	sp,sp,32
    196c:	8082                	ret

000000000000196e <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    196e:	00b547b3          	xor	a5,a0,a1
    1972:	8b9d                	andi	a5,a5,7
    1974:	eb95                	bnez	a5,19a8 <strcpy+0x3a>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1976:	0075f793          	andi	a5,a1,7
    197a:	e7b1                	bnez	a5,19c6 <strcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    197c:	6198                	ld	a4,0(a1)
    197e:	00000617          	auipc	a2,0x0
    1982:	5fa63603          	ld	a2,1530(a2) # 1f78 <__clone+0x108>
    1986:	00000817          	auipc	a6,0x0
    198a:	5fa83803          	ld	a6,1530(a6) # 1f80 <__clone+0x110>
    198e:	a029                	j	1998 <strcpy+0x2a>
    1990:	e118                	sd	a4,0(a0)
    1992:	6598                	ld	a4,8(a1)
    1994:	05a1                	addi	a1,a1,8
    1996:	0521                	addi	a0,a0,8
    1998:	00c707b3          	add	a5,a4,a2
    199c:	fff74693          	not	a3,a4
    19a0:	8ff5                	and	a5,a5,a3
    19a2:	0107f7b3          	and	a5,a5,a6
    19a6:	d7ed                	beqz	a5,1990 <strcpy+0x22>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    19a8:	0005c783          	lbu	a5,0(a1)
    19ac:	00f50023          	sb	a5,0(a0)
    19b0:	c785                	beqz	a5,19d8 <strcpy+0x6a>
    19b2:	0015c783          	lbu	a5,1(a1)
    19b6:	0505                	addi	a0,a0,1
    19b8:	0585                	addi	a1,a1,1
    19ba:	00f50023          	sb	a5,0(a0)
    19be:	fbf5                	bnez	a5,19b2 <strcpy+0x44>
        ;
    return d;
}
    19c0:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    19c2:	0505                	addi	a0,a0,1
    19c4:	df45                	beqz	a4,197c <strcpy+0xe>
            if (!(*d = *s))
    19c6:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    19ca:	0585                	addi	a1,a1,1
    19cc:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    19d0:	00f50023          	sb	a5,0(a0)
    19d4:	f7fd                	bnez	a5,19c2 <strcpy+0x54>
}
    19d6:	8082                	ret
    19d8:	8082                	ret

00000000000019da <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    19da:	00b547b3          	xor	a5,a0,a1
    19de:	8b9d                	andi	a5,a5,7
    19e0:	1a079863          	bnez	a5,1b90 <strncpy+0x1b6>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    19e4:	0075f793          	andi	a5,a1,7
    19e8:	16078463          	beqz	a5,1b50 <strncpy+0x176>
    19ec:	ea01                	bnez	a2,19fc <strncpy+0x22>
    19ee:	a421                	j	1bf6 <strncpy+0x21c>
    19f0:	167d                	addi	a2,a2,-1
    19f2:	0505                	addi	a0,a0,1
    19f4:	14070e63          	beqz	a4,1b50 <strncpy+0x176>
    19f8:	1a060863          	beqz	a2,1ba8 <strncpy+0x1ce>
    19fc:	0005c783          	lbu	a5,0(a1)
    1a00:	0585                	addi	a1,a1,1
    1a02:	0075f713          	andi	a4,a1,7
    1a06:	00f50023          	sb	a5,0(a0)
    1a0a:	f3fd                	bnez	a5,19f0 <strncpy+0x16>
    1a0c:	4805                	li	a6,1
    1a0e:	1a061863          	bnez	a2,1bbe <strncpy+0x1e4>
    1a12:	40a007b3          	neg	a5,a0
    1a16:	8b9d                	andi	a5,a5,7
    1a18:	4681                	li	a3,0
    1a1a:	18061a63          	bnez	a2,1bae <strncpy+0x1d4>
    1a1e:	00778713          	addi	a4,a5,7
    1a22:	45ad                	li	a1,11
    1a24:	18b76363          	bltu	a4,a1,1baa <strncpy+0x1d0>
    1a28:	1ae6eb63          	bltu	a3,a4,1bde <strncpy+0x204>
    1a2c:	1a078363          	beqz	a5,1bd2 <strncpy+0x1f8>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1a30:	00050023          	sb	zero,0(a0)
    1a34:	4685                	li	a3,1
    1a36:	00150713          	addi	a4,a0,1
    1a3a:	18d78f63          	beq	a5,a3,1bd8 <strncpy+0x1fe>
    1a3e:	000500a3          	sb	zero,1(a0)
    1a42:	4689                	li	a3,2
    1a44:	00250713          	addi	a4,a0,2
    1a48:	18d78e63          	beq	a5,a3,1be4 <strncpy+0x20a>
    1a4c:	00050123          	sb	zero,2(a0)
    1a50:	468d                	li	a3,3
    1a52:	00350713          	addi	a4,a0,3
    1a56:	16d78c63          	beq	a5,a3,1bce <strncpy+0x1f4>
    1a5a:	000501a3          	sb	zero,3(a0)
    1a5e:	4691                	li	a3,4
    1a60:	00450713          	addi	a4,a0,4
    1a64:	18d78263          	beq	a5,a3,1be8 <strncpy+0x20e>
    1a68:	00050223          	sb	zero,4(a0)
    1a6c:	4695                	li	a3,5
    1a6e:	00550713          	addi	a4,a0,5
    1a72:	16d78d63          	beq	a5,a3,1bec <strncpy+0x212>
    1a76:	000502a3          	sb	zero,5(a0)
    1a7a:	469d                	li	a3,7
    1a7c:	00650713          	addi	a4,a0,6
    1a80:	16d79863          	bne	a5,a3,1bf0 <strncpy+0x216>
    1a84:	00750713          	addi	a4,a0,7
    1a88:	00050323          	sb	zero,6(a0)
    1a8c:	40f80833          	sub	a6,a6,a5
    1a90:	ff887593          	andi	a1,a6,-8
    1a94:	97aa                	add	a5,a5,a0
    1a96:	95be                	add	a1,a1,a5
    1a98:	0007b023          	sd	zero,0(a5)
    1a9c:	07a1                	addi	a5,a5,8
    1a9e:	feb79de3          	bne	a5,a1,1a98 <strncpy+0xbe>
    1aa2:	ff887593          	andi	a1,a6,-8
    1aa6:	9ead                	addw	a3,a3,a1
    1aa8:	00b707b3          	add	a5,a4,a1
    1aac:	12b80863          	beq	a6,a1,1bdc <strncpy+0x202>
    1ab0:	00078023          	sb	zero,0(a5)
    1ab4:	0016871b          	addiw	a4,a3,1
    1ab8:	0ec77863          	bgeu	a4,a2,1ba8 <strncpy+0x1ce>
    1abc:	000780a3          	sb	zero,1(a5)
    1ac0:	0026871b          	addiw	a4,a3,2
    1ac4:	0ec77263          	bgeu	a4,a2,1ba8 <strncpy+0x1ce>
    1ac8:	00078123          	sb	zero,2(a5)
    1acc:	0036871b          	addiw	a4,a3,3
    1ad0:	0cc77c63          	bgeu	a4,a2,1ba8 <strncpy+0x1ce>
    1ad4:	000781a3          	sb	zero,3(a5)
    1ad8:	0046871b          	addiw	a4,a3,4
    1adc:	0cc77663          	bgeu	a4,a2,1ba8 <strncpy+0x1ce>
    1ae0:	00078223          	sb	zero,4(a5)
    1ae4:	0056871b          	addiw	a4,a3,5
    1ae8:	0cc77063          	bgeu	a4,a2,1ba8 <strncpy+0x1ce>
    1aec:	000782a3          	sb	zero,5(a5)
    1af0:	0066871b          	addiw	a4,a3,6
    1af4:	0ac77a63          	bgeu	a4,a2,1ba8 <strncpy+0x1ce>
    1af8:	00078323          	sb	zero,6(a5)
    1afc:	0076871b          	addiw	a4,a3,7
    1b00:	0ac77463          	bgeu	a4,a2,1ba8 <strncpy+0x1ce>
    1b04:	000783a3          	sb	zero,7(a5)
    1b08:	0086871b          	addiw	a4,a3,8
    1b0c:	08c77e63          	bgeu	a4,a2,1ba8 <strncpy+0x1ce>
    1b10:	00078423          	sb	zero,8(a5)
    1b14:	0096871b          	addiw	a4,a3,9
    1b18:	08c77863          	bgeu	a4,a2,1ba8 <strncpy+0x1ce>
    1b1c:	000784a3          	sb	zero,9(a5)
    1b20:	00a6871b          	addiw	a4,a3,10
    1b24:	08c77263          	bgeu	a4,a2,1ba8 <strncpy+0x1ce>
    1b28:	00078523          	sb	zero,10(a5)
    1b2c:	00b6871b          	addiw	a4,a3,11
    1b30:	06c77c63          	bgeu	a4,a2,1ba8 <strncpy+0x1ce>
    1b34:	000785a3          	sb	zero,11(a5)
    1b38:	00c6871b          	addiw	a4,a3,12
    1b3c:	06c77663          	bgeu	a4,a2,1ba8 <strncpy+0x1ce>
    1b40:	00078623          	sb	zero,12(a5)
    1b44:	26b5                	addiw	a3,a3,13
    1b46:	06c6f163          	bgeu	a3,a2,1ba8 <strncpy+0x1ce>
    1b4a:	000786a3          	sb	zero,13(a5)
    1b4e:	8082                	ret
            ;
        if (!n || !*s)
    1b50:	c645                	beqz	a2,1bf8 <strncpy+0x21e>
    1b52:	0005c783          	lbu	a5,0(a1)
    1b56:	ea078be3          	beqz	a5,1a0c <strncpy+0x32>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b5a:	479d                	li	a5,7
    1b5c:	02c7ff63          	bgeu	a5,a2,1b9a <strncpy+0x1c0>
    1b60:	00000897          	auipc	a7,0x0
    1b64:	4188b883          	ld	a7,1048(a7) # 1f78 <__clone+0x108>
    1b68:	00000817          	auipc	a6,0x0
    1b6c:	41883803          	ld	a6,1048(a6) # 1f80 <__clone+0x110>
    1b70:	431d                	li	t1,7
    1b72:	6198                	ld	a4,0(a1)
    1b74:	011707b3          	add	a5,a4,a7
    1b78:	fff74693          	not	a3,a4
    1b7c:	8ff5                	and	a5,a5,a3
    1b7e:	0107f7b3          	and	a5,a5,a6
    1b82:	ef81                	bnez	a5,1b9a <strncpy+0x1c0>
            *wd = *ws;
    1b84:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b86:	1661                	addi	a2,a2,-8
    1b88:	05a1                	addi	a1,a1,8
    1b8a:	0521                	addi	a0,a0,8
    1b8c:	fec363e3          	bltu	t1,a2,1b72 <strncpy+0x198>
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b90:	e609                	bnez	a2,1b9a <strncpy+0x1c0>
    1b92:	a08d                	j	1bf4 <strncpy+0x21a>
    1b94:	167d                	addi	a2,a2,-1
    1b96:	0505                	addi	a0,a0,1
    1b98:	ca01                	beqz	a2,1ba8 <strncpy+0x1ce>
    1b9a:	0005c783          	lbu	a5,0(a1)
    1b9e:	0585                	addi	a1,a1,1
    1ba0:	00f50023          	sb	a5,0(a0)
    1ba4:	fbe5                	bnez	a5,1b94 <strncpy+0x1ba>
        ;
tail:
    1ba6:	b59d                	j	1a0c <strncpy+0x32>
    memset(d, 0, n);
    return d;
}
    1ba8:	8082                	ret
    1baa:	472d                	li	a4,11
    1bac:	bdb5                	j	1a28 <strncpy+0x4e>
    1bae:	00778713          	addi	a4,a5,7
    1bb2:	45ad                	li	a1,11
    1bb4:	fff60693          	addi	a3,a2,-1
    1bb8:	e6b778e3          	bgeu	a4,a1,1a28 <strncpy+0x4e>
    1bbc:	b7fd                	j	1baa <strncpy+0x1d0>
    1bbe:	40a007b3          	neg	a5,a0
    1bc2:	8832                	mv	a6,a2
    1bc4:	8b9d                	andi	a5,a5,7
    1bc6:	4681                	li	a3,0
    1bc8:	e4060be3          	beqz	a2,1a1e <strncpy+0x44>
    1bcc:	b7cd                	j	1bae <strncpy+0x1d4>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bce:	468d                	li	a3,3
    1bd0:	bd75                	j	1a8c <strncpy+0xb2>
    1bd2:	872a                	mv	a4,a0
    1bd4:	4681                	li	a3,0
    1bd6:	bd5d                	j	1a8c <strncpy+0xb2>
    1bd8:	4685                	li	a3,1
    1bda:	bd4d                	j	1a8c <strncpy+0xb2>
    1bdc:	8082                	ret
    1bde:	87aa                	mv	a5,a0
    1be0:	4681                	li	a3,0
    1be2:	b5f9                	j	1ab0 <strncpy+0xd6>
    1be4:	4689                	li	a3,2
    1be6:	b55d                	j	1a8c <strncpy+0xb2>
    1be8:	4691                	li	a3,4
    1bea:	b54d                	j	1a8c <strncpy+0xb2>
    1bec:	4695                	li	a3,5
    1bee:	bd79                	j	1a8c <strncpy+0xb2>
    1bf0:	4699                	li	a3,6
    1bf2:	bd69                	j	1a8c <strncpy+0xb2>
    1bf4:	8082                	ret
    1bf6:	8082                	ret
    1bf8:	8082                	ret

0000000000001bfa <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1bfa:	87aa                	mv	a5,a0
    1bfc:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1bfe:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1c02:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1c06:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1c08:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c0a:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1c0e:	2501                	sext.w	a0,a0
    1c10:	8082                	ret

0000000000001c12 <openat>:
    register long a7 __asm__("a7") = n;
    1c12:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1c16:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c1a:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1c1e:	2501                	sext.w	a0,a0
    1c20:	8082                	ret

0000000000001c22 <close>:
    register long a7 __asm__("a7") = n;
    1c22:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1c26:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1c2a:	2501                	sext.w	a0,a0
    1c2c:	8082                	ret

0000000000001c2e <read>:
    register long a7 __asm__("a7") = n;
    1c2e:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c32:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1c36:	8082                	ret

0000000000001c38 <write>:
    register long a7 __asm__("a7") = n;
    1c38:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1c3c:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1c40:	8082                	ret

0000000000001c42 <getpid>:
    register long a7 __asm__("a7") = n;
    1c42:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1c46:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1c4a:	2501                	sext.w	a0,a0
    1c4c:	8082                	ret

0000000000001c4e <getppid>:
    register long a7 __asm__("a7") = n;
    1c4e:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1c52:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1c56:	2501                	sext.w	a0,a0
    1c58:	8082                	ret

0000000000001c5a <sched_yield>:
    register long a7 __asm__("a7") = n;
    1c5a:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1c5e:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1c62:	2501                	sext.w	a0,a0
    1c64:	8082                	ret

0000000000001c66 <fork>:
    register long a7 __asm__("a7") = n;
    1c66:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1c6a:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1c6c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1c6e:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1c72:	2501                	sext.w	a0,a0
    1c74:	8082                	ret

0000000000001c76 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1c76:	85b2                	mv	a1,a2
    1c78:	863a                	mv	a2,a4
    if (stack)
    1c7a:	c191                	beqz	a1,1c7e <clone+0x8>
	stack += stack_size;
    1c7c:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1c7e:	4781                	li	a5,0
    1c80:	4701                	li	a4,0
    1c82:	4681                	li	a3,0
    1c84:	2601                	sext.w	a2,a2
    1c86:	a2ed                	j	1e70 <__clone>

0000000000001c88 <exit>:
    register long a7 __asm__("a7") = n;
    1c88:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1c8c:	00000073          	ecall
}

void exit(int code)
{
    syscall(SYS_exit, code);
}
    1c90:	8082                	ret

0000000000001c92 <waitpid>:
    register long a7 __asm__("a7") = n;
    1c92:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1c96:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1c98:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1c9c:	2501                	sext.w	a0,a0
    1c9e:	8082                	ret

0000000000001ca0 <exec>:
    register long a7 __asm__("a7") = n;
    1ca0:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1ca4:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1ca8:	2501                	sext.w	a0,a0
    1caa:	8082                	ret

0000000000001cac <execve>:
    register long a7 __asm__("a7") = n;
    1cac:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cb0:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1cb4:	2501                	sext.w	a0,a0
    1cb6:	8082                	ret

0000000000001cb8 <times>:
    register long a7 __asm__("a7") = n;
    1cb8:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1cbc:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1cc0:	2501                	sext.w	a0,a0
    1cc2:	8082                	ret

0000000000001cc4 <get_time>:

int64 get_time()
{
    1cc4:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1cc6:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1cca:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1ccc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cce:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1cd2:	2501                	sext.w	a0,a0
    1cd4:	ed09                	bnez	a0,1cee <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1cd6:	67a2                	ld	a5,8(sp)
    1cd8:	3e800713          	li	a4,1000
    1cdc:	00015503          	lhu	a0,0(sp)
    1ce0:	02e7d7b3          	divu	a5,a5,a4
    1ce4:	02e50533          	mul	a0,a0,a4
    1ce8:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1cea:	0141                	addi	sp,sp,16
    1cec:	8082                	ret
        return -1;
    1cee:	557d                	li	a0,-1
    1cf0:	bfed                	j	1cea <get_time+0x26>

0000000000001cf2 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1cf2:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1cf6:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1cfa:	2501                	sext.w	a0,a0
    1cfc:	8082                	ret

0000000000001cfe <time>:
    register long a7 __asm__("a7") = n;
    1cfe:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1d02:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1d06:	2501                	sext.w	a0,a0
    1d08:	8082                	ret

0000000000001d0a <sleep>:

int sleep(unsigned long long time)
{
    1d0a:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1d0c:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1d0e:	850a                	mv	a0,sp
    1d10:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1d12:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1d16:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d18:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d1c:	e501                	bnez	a0,1d24 <sleep+0x1a>
    return 0;
    1d1e:	4501                	li	a0,0
}
    1d20:	0141                	addi	sp,sp,16
    1d22:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1d24:	4502                	lw	a0,0(sp)
}
    1d26:	0141                	addi	sp,sp,16
    1d28:	8082                	ret

0000000000001d2a <set_priority>:
    register long a7 __asm__("a7") = n;
    1d2a:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1d2e:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1d32:	2501                	sext.w	a0,a0
    1d34:	8082                	ret

0000000000001d36 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1d36:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1d3a:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1d3e:	8082                	ret

0000000000001d40 <munmap>:
    register long a7 __asm__("a7") = n;
    1d40:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d44:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1d48:	2501                	sext.w	a0,a0
    1d4a:	8082                	ret

0000000000001d4c <wait>:

int wait(int *code)
{
    1d4c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1d4e:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1d52:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1d54:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1d56:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d58:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1d5c:	2501                	sext.w	a0,a0
    1d5e:	8082                	ret

0000000000001d60 <spawn>:
    register long a7 __asm__("a7") = n;
    1d60:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1d64:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1d68:	2501                	sext.w	a0,a0
    1d6a:	8082                	ret

0000000000001d6c <mailread>:
    register long a7 __asm__("a7") = n;
    1d6c:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d70:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1d74:	2501                	sext.w	a0,a0
    1d76:	8082                	ret

0000000000001d78 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1d78:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d7c:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1d80:	2501                	sext.w	a0,a0
    1d82:	8082                	ret

0000000000001d84 <fstat>:
    register long a7 __asm__("a7") = n;
    1d84:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d88:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1d8c:	2501                	sext.w	a0,a0
    1d8e:	8082                	ret

0000000000001d90 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1d90:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1d92:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1d96:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1d98:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1d9c:	2501                	sext.w	a0,a0
    1d9e:	8082                	ret

0000000000001da0 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1da0:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1da2:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1da6:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da8:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1dac:	2501                	sext.w	a0,a0
    1dae:	8082                	ret

0000000000001db0 <link>:

int link(char *old_path, char *new_path)
{
    1db0:	87aa                	mv	a5,a0
    1db2:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1db4:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1db8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1dbc:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1dbe:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1dc2:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1dc4:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1dc8:	2501                	sext.w	a0,a0
    1dca:	8082                	ret

0000000000001dcc <unlink>:

int unlink(char *path)
{
    1dcc:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1dce:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1dd2:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1dd6:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd8:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1ddc:	2501                	sext.w	a0,a0
    1dde:	8082                	ret

0000000000001de0 <uname>:
    register long a7 __asm__("a7") = n;
    1de0:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1de4:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1de8:	2501                	sext.w	a0,a0
    1dea:	8082                	ret

0000000000001dec <brk>:
    register long a7 __asm__("a7") = n;
    1dec:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1df0:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1df4:	2501                	sext.w	a0,a0
    1df6:	8082                	ret

0000000000001df8 <getcwd>:
    register long a7 __asm__("a7") = n;
    1df8:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dfa:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1dfe:	8082                	ret

0000000000001e00 <chdir>:
    register long a7 __asm__("a7") = n;
    1e00:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1e04:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1e08:	2501                	sext.w	a0,a0
    1e0a:	8082                	ret

0000000000001e0c <mkdir>:

int mkdir(const char *path, mode_t mode){
    1e0c:	862e                	mv	a2,a1
    1e0e:	87aa                	mv	a5,a0
    register long a2 __asm__("a2") = c;
    1e10:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e12:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1e16:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e1a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e1c:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e1e:	00000073          	ecall
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
}
    1e22:	2501                	sext.w	a0,a0
    1e24:	8082                	ret

0000000000001e26 <getdents>:
    register long a7 __asm__("a7") = n;
    1e26:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e2a:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1e2e:	2501                	sext.w	a0,a0
    1e30:	8082                	ret

0000000000001e32 <pipe>:
    register long a7 __asm__("a7") = n;
    1e32:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1e36:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e38:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1e3c:	2501                	sext.w	a0,a0
    1e3e:	8082                	ret

0000000000001e40 <dup>:
    register long a7 __asm__("a7") = n;
    1e40:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1e42:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1e46:	2501                	sext.w	a0,a0
    1e48:	8082                	ret

0000000000001e4a <dup2>:
    register long a7 __asm__("a7") = n;
    1e4a:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1e4c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e4e:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1e52:	2501                	sext.w	a0,a0
    1e54:	8082                	ret

0000000000001e56 <mount>:
    register long a7 __asm__("a7") = n;
    1e56:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e5a:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <umount>:
    register long a7 __asm__("a7") = n;
    1e62:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1e66:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e68:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1e6c:	2501                	sext.w	a0,a0
    1e6e:	8082                	ret

0000000000001e70 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1e70:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1e72:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1e74:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1e76:	8532                	mv	a0,a2
	mv a2, a4
    1e78:	863a                	mv	a2,a4
	mv a3, a5
    1e7a:	86be                	mv	a3,a5
	mv a4, a6
    1e7c:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1e7e:	0dc00893          	li	a7,220
	ecall
    1e82:	00000073          	ecall

	beqz a0, 1f
    1e86:	c111                	beqz	a0,1e8a <__clone+0x1a>
	# Parent
	ret
    1e88:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1e8a:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1e8c:	6522                	ld	a0,8(sp)
	jalr a1
    1e8e:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1e90:	05d00893          	li	a7,93
	ecall
    1e94:	00000073          	ecall
