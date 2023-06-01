
kernel-qemu：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_entry>:
    80200000:	00150293          	addi	t0,a0,1
    80200004:	02ba                	slli	t0,t0,0xe
    80200006:	0000d117          	auipc	sp,0xd
    8020000a:	10213103          	ld	sp,258(sp) # 8020d108 <_GLOBAL_OFFSET_TABLE_+0x58>
    8020000e:	9116                	add	sp,sp,t0
    80200010:	1e3000ef          	jal	ra,802009f2 <main>

0000000080200014 <loop>:
    80200014:	a001                	j	80200014 <loop>

0000000080200016 <printint>:
    }
}

static void
printint(int xx, int base, int sign)
{
    80200016:	7179                	addi	sp,sp,-48
    80200018:	f406                	sd	ra,40(sp)
    8020001a:	f022                	sd	s0,32(sp)
    8020001c:	ec26                	sd	s1,24(sp)
    8020001e:	e84a                	sd	s2,16(sp)
    80200020:	1800                	addi	s0,sp,48
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    80200022:	c219                	beqz	a2,80200028 <printint+0x12>
    80200024:	08054563          	bltz	a0,802000ae <printint+0x98>
    x = -xx;
  else
    x = xx;
    80200028:	2501                	sext.w	a0,a0
    8020002a:	4881                	li	a7,0

  i = 0;
    8020002c:	fd040913          	addi	s2,s0,-48
    x = xx;
    80200030:	86ca                	mv	a3,s2
  i = 0;
    80200032:	4701                	li	a4,0
  do {
    buf[i++] = digits[x % base];
    80200034:	2581                	sext.w	a1,a1
    80200036:	0000a617          	auipc	a2,0xa
    8020003a:	34a60613          	addi	a2,a2,842 # 8020a380 <digits>
    8020003e:	883a                	mv	a6,a4
    80200040:	2705                	addiw	a4,a4,1
    80200042:	02b577bb          	remuw	a5,a0,a1
    80200046:	1782                	slli	a5,a5,0x20
    80200048:	9381                	srli	a5,a5,0x20
    8020004a:	97b2                	add	a5,a5,a2
    8020004c:	0007c783          	lbu	a5,0(a5)
    80200050:	00f68023          	sb	a5,0(a3)
  } while((x /= base) != 0);
    80200054:	0005079b          	sext.w	a5,a0
    80200058:	02b5553b          	divuw	a0,a0,a1
    8020005c:	0685                	addi	a3,a3,1
    8020005e:	feb7f0e3          	bgeu	a5,a1,8020003e <printint+0x28>

  if(sign)
    80200062:	00088b63          	beqz	a7,80200078 <printint+0x62>
    buf[i++] = '-';
    80200066:	fe040793          	addi	a5,s0,-32
    8020006a:	973e                	add	a4,a4,a5
    8020006c:	02d00793          	li	a5,45
    80200070:	fef70823          	sb	a5,-16(a4)
    80200074:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
    80200078:	02e05563          	blez	a4,802000a2 <printint+0x8c>
    8020007c:	fd040493          	addi	s1,s0,-48
    80200080:	94ba                	add	s1,s1,a4
    80200082:	197d                	addi	s2,s2,-1
    80200084:	993a                	add	s2,s2,a4
    80200086:	377d                	addiw	a4,a4,-1
    80200088:	1702                	slli	a4,a4,0x20
    8020008a:	9301                	srli	a4,a4,0x20
    8020008c:	40e90933          	sub	s2,s2,a4
    consputc(buf[i]);
    80200090:	fff4c503          	lbu	a0,-1(s1)
    80200094:	00008097          	auipc	ra,0x8
    80200098:	9e0080e7          	jalr	-1568(ra) # 80207a74 <consputc>
  while(--i >= 0)
    8020009c:	14fd                	addi	s1,s1,-1
    8020009e:	ff2499e3          	bne	s1,s2,80200090 <printint+0x7a>
}
    802000a2:	70a2                	ld	ra,40(sp)
    802000a4:	7402                	ld	s0,32(sp)
    802000a6:	64e2                	ld	s1,24(sp)
    802000a8:	6942                	ld	s2,16(sp)
    802000aa:	6145                	addi	sp,sp,48
    802000ac:	8082                	ret
    x = -xx;
    802000ae:	40a0053b          	negw	a0,a0
  if(sign && (sign = xx < 0))
    802000b2:	4885                	li	a7,1
    x = -xx;
    802000b4:	bfa5                	j	8020002c <printint+0x16>

00000000802000b6 <printstring>:
void printstring(const char* s) {
    802000b6:	1101                	addi	sp,sp,-32
    802000b8:	ec06                	sd	ra,24(sp)
    802000ba:	e822                	sd	s0,16(sp)
    802000bc:	e426                	sd	s1,8(sp)
    802000be:	1000                	addi	s0,sp,32
    802000c0:	84aa                	mv	s1,a0
    while (*s)
    802000c2:	00054503          	lbu	a0,0(a0)
    802000c6:	c909                	beqz	a0,802000d8 <printstring+0x22>
        consputc(*s++);
    802000c8:	0485                	addi	s1,s1,1
    802000ca:	00008097          	auipc	ra,0x8
    802000ce:	9aa080e7          	jalr	-1622(ra) # 80207a74 <consputc>
    while (*s)
    802000d2:	0004c503          	lbu	a0,0(s1)
    802000d6:	f96d                	bnez	a0,802000c8 <printstring+0x12>
}
    802000d8:	60e2                	ld	ra,24(sp)
    802000da:	6442                	ld	s0,16(sp)
    802000dc:	64a2                	ld	s1,8(sp)
    802000de:	6105                	addi	sp,sp,32
    802000e0:	8082                	ret

00000000802000e2 <backtrace>:
  for(;;)
    ;
}

void backtrace()
{
    802000e2:	7179                	addi	sp,sp,-48
    802000e4:	f406                	sd	ra,40(sp)
    802000e6:	f022                	sd	s0,32(sp)
    802000e8:	ec26                	sd	s1,24(sp)
    802000ea:	e84a                	sd	s2,16(sp)
    802000ec:	e44e                	sd	s3,8(sp)
    802000ee:	1800                	addi	s0,sp,48

static inline uint64
r_fp()
{
  uint64 x;
  asm volatile("mv %0, s0" : "=r" (x) );
    802000f0:	8922                	mv	s2,s0
  uint64 *fp = (uint64 *)r_fp();
    802000f2:	84ca                	mv	s1,s2
  uint64 *bottom = (uint64 *)PGROUNDUP((uint64)fp);
    802000f4:	6785                	lui	a5,0x1
    802000f6:	17fd                	addi	a5,a5,-1
    802000f8:	993e                	add	s2,s2,a5
    802000fa:	77fd                	lui	a5,0xfffff
    802000fc:	00f97933          	and	s2,s2,a5
  printf("backtrace:\n");
    80200100:	0000a517          	auipc	a0,0xa
    80200104:	f0050513          	addi	a0,a0,-256 # 8020a000 <etext>
    80200108:	00000097          	auipc	ra,0x0
    8020010c:	084080e7          	jalr	132(ra) # 8020018c <printf>
  while (fp < bottom) {
    80200110:	0324f263          	bgeu	s1,s2,80200134 <backtrace+0x52>
    uint64 ra = *(fp - 1);
    printf("%p\n", ra - 4);
    80200114:	0000a997          	auipc	s3,0xa
    80200118:	4d498993          	addi	s3,s3,1236 # 8020a5e8 <digits+0x268>
    8020011c:	ff84b583          	ld	a1,-8(s1)
    80200120:	15f1                	addi	a1,a1,-4
    80200122:	854e                	mv	a0,s3
    80200124:	00000097          	auipc	ra,0x0
    80200128:	068080e7          	jalr	104(ra) # 8020018c <printf>
    fp = (uint64 *)*(fp - 2);
    8020012c:	ff04b483          	ld	s1,-16(s1)
  while (fp < bottom) {
    80200130:	ff24e6e3          	bltu	s1,s2,8020011c <backtrace+0x3a>
  }
}
    80200134:	70a2                	ld	ra,40(sp)
    80200136:	7402                	ld	s0,32(sp)
    80200138:	64e2                	ld	s1,24(sp)
    8020013a:	6942                	ld	s2,16(sp)
    8020013c:	69a2                	ld	s3,8(sp)
    8020013e:	6145                	addi	sp,sp,48
    80200140:	8082                	ret

0000000080200142 <panic>:
{
    80200142:	1101                	addi	sp,sp,-32
    80200144:	ec06                	sd	ra,24(sp)
    80200146:	e822                	sd	s0,16(sp)
    80200148:	e426                	sd	s1,8(sp)
    8020014a:	1000                	addi	s0,sp,32
    8020014c:	84aa                	mv	s1,a0
  printf("panic: ");
    8020014e:	0000a517          	auipc	a0,0xa
    80200152:	ec250513          	addi	a0,a0,-318 # 8020a010 <etext+0x10>
    80200156:	00000097          	auipc	ra,0x0
    8020015a:	036080e7          	jalr	54(ra) # 8020018c <printf>
  printf(s);
    8020015e:	8526                	mv	a0,s1
    80200160:	00000097          	auipc	ra,0x0
    80200164:	02c080e7          	jalr	44(ra) # 8020018c <printf>
  printf("\n");
    80200168:	0000a517          	auipc	a0,0xa
    8020016c:	f7050513          	addi	a0,a0,-144 # 8020a0d8 <etext+0xd8>
    80200170:	00000097          	auipc	ra,0x0
    80200174:	01c080e7          	jalr	28(ra) # 8020018c <printf>
  backtrace();
    80200178:	00000097          	auipc	ra,0x0
    8020017c:	f6a080e7          	jalr	-150(ra) # 802000e2 <backtrace>
  panicked = 1; // freeze uart output from other CPUs
    80200180:	4785                	li	a5,1
    80200182:	00016717          	auipc	a4,0x16
    80200186:	e6f72f23          	sw	a5,-386(a4) # 80216000 <panicked>
  for(;;)
    8020018a:	a001                	j	8020018a <panic+0x48>

000000008020018c <printf>:
{
    8020018c:	7131                	addi	sp,sp,-192
    8020018e:	fc86                	sd	ra,120(sp)
    80200190:	f8a2                	sd	s0,112(sp)
    80200192:	f4a6                	sd	s1,104(sp)
    80200194:	f0ca                	sd	s2,96(sp)
    80200196:	ecce                	sd	s3,88(sp)
    80200198:	e8d2                	sd	s4,80(sp)
    8020019a:	e4d6                	sd	s5,72(sp)
    8020019c:	e0da                	sd	s6,64(sp)
    8020019e:	fc5e                	sd	s7,56(sp)
    802001a0:	f862                	sd	s8,48(sp)
    802001a2:	f466                	sd	s9,40(sp)
    802001a4:	f06a                	sd	s10,32(sp)
    802001a6:	ec6e                	sd	s11,24(sp)
    802001a8:	0100                	addi	s0,sp,128
    802001aa:	8a2a                	mv	s4,a0
    802001ac:	e40c                	sd	a1,8(s0)
    802001ae:	e810                	sd	a2,16(s0)
    802001b0:	ec14                	sd	a3,24(s0)
    802001b2:	f018                	sd	a4,32(s0)
    802001b4:	f41c                	sd	a5,40(s0)
    802001b6:	03043823          	sd	a6,48(s0)
    802001ba:	03143c23          	sd	a7,56(s0)
  locking = pr.locking;
    802001be:	00016d97          	auipc	s11,0x16
    802001c2:	e62dad83          	lw	s11,-414(s11) # 80216020 <pr+0x18>
  if(locking)
    802001c6:	020d9b63          	bnez	s11,802001fc <printf+0x70>
  if (fmt == 0)
    802001ca:	040a0263          	beqz	s4,8020020e <printf+0x82>
  va_start(ap, fmt);
    802001ce:	00840793          	addi	a5,s0,8
    802001d2:	f8f43423          	sd	a5,-120(s0)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    802001d6:	000a4503          	lbu	a0,0(s4)
    802001da:	16050263          	beqz	a0,8020033e <printf+0x1b2>
    802001de:	4481                	li	s1,0
    if(c != '%'){
    802001e0:	02500a93          	li	s5,37
    switch(c){
    802001e4:	07000b13          	li	s6,112
  consputc('x');
    802001e8:	4d41                	li	s10,16
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802001ea:	0000ab97          	auipc	s7,0xa
    802001ee:	196b8b93          	addi	s7,s7,406 # 8020a380 <digits>
    switch(c){
    802001f2:	07300c93          	li	s9,115
    802001f6:	06400c13          	li	s8,100
    802001fa:	a82d                	j	80200234 <printf+0xa8>
    acquire(&pr.lock);
    802001fc:	00016517          	auipc	a0,0x16
    80200200:	e0c50513          	addi	a0,a0,-500 # 80216008 <pr>
    80200204:	00000097          	auipc	ra,0x0
    80200208:	4c4080e7          	jalr	1220(ra) # 802006c8 <acquire>
    8020020c:	bf7d                	j	802001ca <printf+0x3e>
    panic("null fmt");
    8020020e:	0000a517          	auipc	a0,0xa
    80200212:	e1250513          	addi	a0,a0,-494 # 8020a020 <etext+0x20>
    80200216:	00000097          	auipc	ra,0x0
    8020021a:	f2c080e7          	jalr	-212(ra) # 80200142 <panic>
      consputc(c);
    8020021e:	00008097          	auipc	ra,0x8
    80200222:	856080e7          	jalr	-1962(ra) # 80207a74 <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80200226:	2485                	addiw	s1,s1,1
    80200228:	009a07b3          	add	a5,s4,s1
    8020022c:	0007c503          	lbu	a0,0(a5) # fffffffffffff000 <kernel_end+0xffffffff7fdca000>
    80200230:	10050763          	beqz	a0,8020033e <printf+0x1b2>
    if(c != '%'){
    80200234:	ff5515e3          	bne	a0,s5,8020021e <printf+0x92>
    c = fmt[++i] & 0xff;
    80200238:	2485                	addiw	s1,s1,1
    8020023a:	009a07b3          	add	a5,s4,s1
    8020023e:	0007c783          	lbu	a5,0(a5)
    80200242:	0007891b          	sext.w	s2,a5
    if(c == 0)
    80200246:	cfe5                	beqz	a5,8020033e <printf+0x1b2>
    switch(c){
    80200248:	05678a63          	beq	a5,s6,8020029c <printf+0x110>
    8020024c:	02fb7663          	bgeu	s6,a5,80200278 <printf+0xec>
    80200250:	09978963          	beq	a5,s9,802002e2 <printf+0x156>
    80200254:	07800713          	li	a4,120
    80200258:	0ce79863          	bne	a5,a4,80200328 <printf+0x19c>
      printint(va_arg(ap, int), 16, 1);
    8020025c:	f8843783          	ld	a5,-120(s0)
    80200260:	00878713          	addi	a4,a5,8
    80200264:	f8e43423          	sd	a4,-120(s0)
    80200268:	4605                	li	a2,1
    8020026a:	85ea                	mv	a1,s10
    8020026c:	4388                	lw	a0,0(a5)
    8020026e:	00000097          	auipc	ra,0x0
    80200272:	da8080e7          	jalr	-600(ra) # 80200016 <printint>
      break;
    80200276:	bf45                	j	80200226 <printf+0x9a>
    switch(c){
    80200278:	0b578263          	beq	a5,s5,8020031c <printf+0x190>
    8020027c:	0b879663          	bne	a5,s8,80200328 <printf+0x19c>
      printint(va_arg(ap, int), 10, 1);
    80200280:	f8843783          	ld	a5,-120(s0)
    80200284:	00878713          	addi	a4,a5,8
    80200288:	f8e43423          	sd	a4,-120(s0)
    8020028c:	4605                	li	a2,1
    8020028e:	45a9                	li	a1,10
    80200290:	4388                	lw	a0,0(a5)
    80200292:	00000097          	auipc	ra,0x0
    80200296:	d84080e7          	jalr	-636(ra) # 80200016 <printint>
      break;
    8020029a:	b771                	j	80200226 <printf+0x9a>
      printptr(va_arg(ap, uint64));
    8020029c:	f8843783          	ld	a5,-120(s0)
    802002a0:	00878713          	addi	a4,a5,8
    802002a4:	f8e43423          	sd	a4,-120(s0)
    802002a8:	0007b983          	ld	s3,0(a5)
  consputc('0');
    802002ac:	03000513          	li	a0,48
    802002b0:	00007097          	auipc	ra,0x7
    802002b4:	7c4080e7          	jalr	1988(ra) # 80207a74 <consputc>
  consputc('x');
    802002b8:	07800513          	li	a0,120
    802002bc:	00007097          	auipc	ra,0x7
    802002c0:	7b8080e7          	jalr	1976(ra) # 80207a74 <consputc>
    802002c4:	896a                	mv	s2,s10
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802002c6:	03c9d793          	srli	a5,s3,0x3c
    802002ca:	97de                	add	a5,a5,s7
    802002cc:	0007c503          	lbu	a0,0(a5)
    802002d0:	00007097          	auipc	ra,0x7
    802002d4:	7a4080e7          	jalr	1956(ra) # 80207a74 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    802002d8:	0992                	slli	s3,s3,0x4
    802002da:	397d                	addiw	s2,s2,-1
    802002dc:	fe0915e3          	bnez	s2,802002c6 <printf+0x13a>
    802002e0:	b799                	j	80200226 <printf+0x9a>
      if((s = va_arg(ap, char*)) == 0)
    802002e2:	f8843783          	ld	a5,-120(s0)
    802002e6:	00878713          	addi	a4,a5,8
    802002ea:	f8e43423          	sd	a4,-120(s0)
    802002ee:	0007b903          	ld	s2,0(a5)
    802002f2:	00090e63          	beqz	s2,8020030e <printf+0x182>
      for(; *s; s++)
    802002f6:	00094503          	lbu	a0,0(s2)
    802002fa:	d515                	beqz	a0,80200226 <printf+0x9a>
        consputc(*s);
    802002fc:	00007097          	auipc	ra,0x7
    80200300:	778080e7          	jalr	1912(ra) # 80207a74 <consputc>
      for(; *s; s++)
    80200304:	0905                	addi	s2,s2,1
    80200306:	00094503          	lbu	a0,0(s2)
    8020030a:	f96d                	bnez	a0,802002fc <printf+0x170>
    8020030c:	bf29                	j	80200226 <printf+0x9a>
        s = "(null)";
    8020030e:	0000a917          	auipc	s2,0xa
    80200312:	d0a90913          	addi	s2,s2,-758 # 8020a018 <etext+0x18>
      for(; *s; s++)
    80200316:	02800513          	li	a0,40
    8020031a:	b7cd                	j	802002fc <printf+0x170>
      consputc('%');
    8020031c:	8556                	mv	a0,s5
    8020031e:	00007097          	auipc	ra,0x7
    80200322:	756080e7          	jalr	1878(ra) # 80207a74 <consputc>
      break;
    80200326:	b701                	j	80200226 <printf+0x9a>
      consputc('%');
    80200328:	8556                	mv	a0,s5
    8020032a:	00007097          	auipc	ra,0x7
    8020032e:	74a080e7          	jalr	1866(ra) # 80207a74 <consputc>
      consputc(c);
    80200332:	854a                	mv	a0,s2
    80200334:	00007097          	auipc	ra,0x7
    80200338:	740080e7          	jalr	1856(ra) # 80207a74 <consputc>
      break;
    8020033c:	b5ed                	j	80200226 <printf+0x9a>
  if(locking)
    8020033e:	020d9163          	bnez	s11,80200360 <printf+0x1d4>
}
    80200342:	70e6                	ld	ra,120(sp)
    80200344:	7446                	ld	s0,112(sp)
    80200346:	74a6                	ld	s1,104(sp)
    80200348:	7906                	ld	s2,96(sp)
    8020034a:	69e6                	ld	s3,88(sp)
    8020034c:	6a46                	ld	s4,80(sp)
    8020034e:	6aa6                	ld	s5,72(sp)
    80200350:	6b06                	ld	s6,64(sp)
    80200352:	7be2                	ld	s7,56(sp)
    80200354:	7c42                	ld	s8,48(sp)
    80200356:	7ca2                	ld	s9,40(sp)
    80200358:	7d02                	ld	s10,32(sp)
    8020035a:	6de2                	ld	s11,24(sp)
    8020035c:	6129                	addi	sp,sp,192
    8020035e:	8082                	ret
    release(&pr.lock);
    80200360:	00016517          	auipc	a0,0x16
    80200364:	ca850513          	addi	a0,a0,-856 # 80216008 <pr>
    80200368:	00000097          	auipc	ra,0x0
    8020036c:	3b4080e7          	jalr	948(ra) # 8020071c <release>
}
    80200370:	bfc9                	j	80200342 <printf+0x1b6>

0000000080200372 <printfinit>:

void
printfinit(void)
{
    80200372:	1141                	addi	sp,sp,-16
    80200374:	e406                	sd	ra,8(sp)
    80200376:	e022                	sd	s0,0(sp)
    80200378:	0800                	addi	s0,sp,16
  initlock(&pr.lock, "pr");
    8020037a:	0000a597          	auipc	a1,0xa
    8020037e:	cb658593          	addi	a1,a1,-842 # 8020a030 <etext+0x30>
    80200382:	00016517          	auipc	a0,0x16
    80200386:	c8650513          	addi	a0,a0,-890 # 80216008 <pr>
    8020038a:	00000097          	auipc	ra,0x0
    8020038e:	2fa080e7          	jalr	762(ra) # 80200684 <initlock>
  pr.locking = 1;   // changed, used to be 1
    80200392:	4785                	li	a5,1
    80200394:	00016717          	auipc	a4,0x16
    80200398:	c8f72623          	sw	a5,-884(a4) # 80216020 <pr+0x18>
}
    8020039c:	60a2                	ld	ra,8(sp)
    8020039e:	6402                	ld	s0,0(sp)
    802003a0:	0141                	addi	sp,sp,16
    802003a2:	8082                	ret

00000000802003a4 <print_logo>:

#ifdef QEMU
void print_logo() {
    802003a4:	1141                	addi	sp,sp,-16
    802003a6:	e406                	sd	ra,8(sp)
    802003a8:	e022                	sd	s0,0(sp)
    802003aa:	0800                	addi	s0,sp,16
    printf("  (`-.            (`-.                            .-')       ('-.    _   .-')\n");
    802003ac:	0000a517          	auipc	a0,0xa
    802003b0:	c8c50513          	addi	a0,a0,-884 # 8020a038 <etext+0x38>
    802003b4:	00000097          	auipc	ra,0x0
    802003b8:	dd8080e7          	jalr	-552(ra) # 8020018c <printf>
    printf(" ( OO ).        _(OO  )_                        .(  OO)    _(  OO)  ( '.( OO )_ \n");
    802003bc:	0000a517          	auipc	a0,0xa
    802003c0:	ccc50513          	addi	a0,a0,-820 # 8020a088 <etext+0x88>
    802003c4:	00000097          	auipc	ra,0x0
    802003c8:	dc8080e7          	jalr	-568(ra) # 8020018c <printf>
    printf("(_/.  \\_)-. ,--(_/   ,. \\  ,--.                (_)---\\_)  (,------.  ,--.   ,--.) ,--. ,--.  \n");
    802003cc:	0000a517          	auipc	a0,0xa
    802003d0:	d1450513          	addi	a0,a0,-748 # 8020a0e0 <etext+0xe0>
    802003d4:	00000097          	auipc	ra,0x0
    802003d8:	db8080e7          	jalr	-584(ra) # 8020018c <printf>
    printf(" \\  `.'  /  \\   \\   /(__/ /  .'       .-')     '  .-.  '   |  .---'  |   `.'   |  |  | |  |   \n");
    802003dc:	0000a517          	auipc	a0,0xa
    802003e0:	d6450513          	addi	a0,a0,-668 # 8020a140 <etext+0x140>
    802003e4:	00000097          	auipc	ra,0x0
    802003e8:	da8080e7          	jalr	-600(ra) # 8020018c <printf>
    printf("  \\     /\\   \\   \\ /   / .  / -.    _(  OO)   ,|  | |  |   |  |      |         |  |  | | .-')\n");
    802003ec:	0000a517          	auipc	a0,0xa
    802003f0:	db450513          	addi	a0,a0,-588 # 8020a1a0 <etext+0x1a0>
    802003f4:	00000097          	auipc	ra,0x0
    802003f8:	d98080e7          	jalr	-616(ra) # 8020018c <printf>
    printf("   \\   \\ |    \\   '   /, | .-.  '  (,------. (_|  | |  |  (|  '--.   |  |'.'|  |  |  |_|( OO )\n");
    802003fc:	0000a517          	auipc	a0,0xa
    80200400:	e0450513          	addi	a0,a0,-508 # 8020a200 <etext+0x200>
    80200404:	00000097          	auipc	ra,0x0
    80200408:	d88080e7          	jalr	-632(ra) # 8020018c <printf>
    printf("  .'    \\_)    \\     /__)' \\  |  |  '------'   |  | |  |   |  .--'   |  |   |  |  |  | | `-' /\n");
    8020040c:	0000a517          	auipc	a0,0xa
    80200410:	e5450513          	addi	a0,a0,-428 # 8020a260 <etext+0x260>
    80200414:	00000097          	auipc	ra,0x0
    80200418:	d78080e7          	jalr	-648(ra) # 8020018c <printf>
    printf(" /  .'.  \\      \\   /    \\  `'  /              '  '-'  '-. |  `---.  |  |   |  | ('  '-'(_.-'\n");
    8020041c:	0000a517          	auipc	a0,0xa
    80200420:	ea450513          	addi	a0,a0,-348 # 8020a2c0 <etext+0x2c0>
    80200424:	00000097          	auipc	ra,0x0
    80200428:	d68080e7          	jalr	-664(ra) # 8020018c <printf>
    printf("'--'   '--'      `-'      `----'                `-----'--' `------'  `--'   `--'   `-----'\n");
    8020042c:	0000a517          	auipc	a0,0xa
    80200430:	ef450513          	addi	a0,a0,-268 # 8020a320 <etext+0x320>
    80200434:	00000097          	auipc	ra,0x0
    80200438:	d58080e7          	jalr	-680(ra) # 8020018c <printf>
}
    8020043c:	60a2                	ld	ra,8(sp)
    8020043e:	6402                	ld	s0,0(sp)
    80200440:	0141                	addi	sp,sp,16
    80200442:	8082                	ret

0000000080200444 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(void *pa)
{
    80200444:	1101                	addi	sp,sp,-32
    80200446:	ec06                	sd	ra,24(sp)
    80200448:	e822                	sd	s0,16(sp)
    8020044a:	e426                	sd	s1,8(sp)
    8020044c:	e04a                	sd	s2,0(sp)
    8020044e:	1000                	addi	s0,sp,32
  struct run *r;
  
  if(((uint64)pa % PGSIZE) != 0 || (char*)pa < kernel_end || (uint64)pa >= PHYSTOP)
    80200450:	03451793          	slli	a5,a0,0x34
    80200454:	e3ad                	bnez	a5,802004b6 <kfree+0x72>
    80200456:	84aa                	mv	s1,a0
    80200458:	0000d797          	auipc	a5,0xd
    8020045c:	c887b783          	ld	a5,-888(a5) # 8020d0e0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80200460:	04f56b63          	bltu	a0,a5,802004b6 <kfree+0x72>
    80200464:	40300793          	li	a5,1027
    80200468:	07d6                	slli	a5,a5,0x15
    8020046a:	04f57663          	bgeu	a0,a5,802004b6 <kfree+0x72>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);
    8020046e:	6605                	lui	a2,0x1
    80200470:	4585                	li	a1,1
    80200472:	00000097          	auipc	ra,0x0
    80200476:	2f2080e7          	jalr	754(ra) # 80200764 <memset>

  r = (struct run*)pa;

  acquire(&kmem.lock);
    8020047a:	00016917          	auipc	s2,0x16
    8020047e:	bae90913          	addi	s2,s2,-1106 # 80216028 <kmem>
    80200482:	854a                	mv	a0,s2
    80200484:	00000097          	auipc	ra,0x0
    80200488:	244080e7          	jalr	580(ra) # 802006c8 <acquire>
  r->next = kmem.freelist;
    8020048c:	01893783          	ld	a5,24(s2)
    80200490:	e09c                	sd	a5,0(s1)
  kmem.freelist = r;
    80200492:	00993c23          	sd	s1,24(s2)
  kmem.npage++;
    80200496:	02093783          	ld	a5,32(s2)
    8020049a:	0785                	addi	a5,a5,1
    8020049c:	02f93023          	sd	a5,32(s2)
  release(&kmem.lock);
    802004a0:	854a                	mv	a0,s2
    802004a2:	00000097          	auipc	ra,0x0
    802004a6:	27a080e7          	jalr	634(ra) # 8020071c <release>
}
    802004aa:	60e2                	ld	ra,24(sp)
    802004ac:	6442                	ld	s0,16(sp)
    802004ae:	64a2                	ld	s1,8(sp)
    802004b0:	6902                	ld	s2,0(sp)
    802004b2:	6105                	addi	sp,sp,32
    802004b4:	8082                	ret
    panic("kfree");
    802004b6:	0000a517          	auipc	a0,0xa
    802004ba:	ee250513          	addi	a0,a0,-286 # 8020a398 <digits+0x18>
    802004be:	00000097          	auipc	ra,0x0
    802004c2:	c84080e7          	jalr	-892(ra) # 80200142 <panic>

00000000802004c6 <freerange>:
{
    802004c6:	7179                	addi	sp,sp,-48
    802004c8:	f406                	sd	ra,40(sp)
    802004ca:	f022                	sd	s0,32(sp)
    802004cc:	ec26                	sd	s1,24(sp)
    802004ce:	e84a                	sd	s2,16(sp)
    802004d0:	e44e                	sd	s3,8(sp)
    802004d2:	e052                	sd	s4,0(sp)
    802004d4:	1800                	addi	s0,sp,48
  p = (char*)PGROUNDUP((uint64)pa_start);
    802004d6:	6785                	lui	a5,0x1
    802004d8:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x801ff001>
    802004dc:	94aa                	add	s1,s1,a0
    802004de:	757d                	lui	a0,0xfffff
    802004e0:	8ce9                	and	s1,s1,a0
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    802004e2:	94be                	add	s1,s1,a5
    802004e4:	0095ee63          	bltu	a1,s1,80200500 <freerange+0x3a>
    802004e8:	892e                	mv	s2,a1
    kfree(p);
    802004ea:	7a7d                	lui	s4,0xfffff
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    802004ec:	6985                	lui	s3,0x1
    kfree(p);
    802004ee:	01448533          	add	a0,s1,s4
    802004f2:	00000097          	auipc	ra,0x0
    802004f6:	f52080e7          	jalr	-174(ra) # 80200444 <kfree>
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    802004fa:	94ce                	add	s1,s1,s3
    802004fc:	fe9979e3          	bgeu	s2,s1,802004ee <freerange+0x28>
}
    80200500:	70a2                	ld	ra,40(sp)
    80200502:	7402                	ld	s0,32(sp)
    80200504:	64e2                	ld	s1,24(sp)
    80200506:	6942                	ld	s2,16(sp)
    80200508:	69a2                	ld	s3,8(sp)
    8020050a:	6a02                	ld	s4,0(sp)
    8020050c:	6145                	addi	sp,sp,48
    8020050e:	8082                	ret

0000000080200510 <kinit>:
{
    80200510:	1101                	addi	sp,sp,-32
    80200512:	ec06                	sd	ra,24(sp)
    80200514:	e822                	sd	s0,16(sp)
    80200516:	e426                	sd	s1,8(sp)
    80200518:	1000                	addi	s0,sp,32
  initlock(&kmem.lock, "kmem");
    8020051a:	00016497          	auipc	s1,0x16
    8020051e:	b0e48493          	addi	s1,s1,-1266 # 80216028 <kmem>
    80200522:	0000a597          	auipc	a1,0xa
    80200526:	e7e58593          	addi	a1,a1,-386 # 8020a3a0 <digits+0x20>
    8020052a:	8526                	mv	a0,s1
    8020052c:	00000097          	auipc	ra,0x0
    80200530:	158080e7          	jalr	344(ra) # 80200684 <initlock>
  kmem.freelist = 0;
    80200534:	0004bc23          	sd	zero,24(s1)
  kmem.npage = 0;
    80200538:	0204b023          	sd	zero,32(s1)
  freerange(kernel_end, (void*)PHYSTOP);
    8020053c:	40300593          	li	a1,1027
    80200540:	05d6                	slli	a1,a1,0x15
    80200542:	0000d517          	auipc	a0,0xd
    80200546:	b9e53503          	ld	a0,-1122(a0) # 8020d0e0 <_GLOBAL_OFFSET_TABLE_+0x30>
    8020054a:	00000097          	auipc	ra,0x0
    8020054e:	f7c080e7          	jalr	-132(ra) # 802004c6 <freerange>
}
    80200552:	60e2                	ld	ra,24(sp)
    80200554:	6442                	ld	s0,16(sp)
    80200556:	64a2                	ld	s1,8(sp)
    80200558:	6105                	addi	sp,sp,32
    8020055a:	8082                	ret

000000008020055c <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
    8020055c:	1101                	addi	sp,sp,-32
    8020055e:	ec06                	sd	ra,24(sp)
    80200560:	e822                	sd	s0,16(sp)
    80200562:	e426                	sd	s1,8(sp)
    80200564:	1000                	addi	s0,sp,32
  struct run *r;

  acquire(&kmem.lock);
    80200566:	00016497          	auipc	s1,0x16
    8020056a:	ac248493          	addi	s1,s1,-1342 # 80216028 <kmem>
    8020056e:	8526                	mv	a0,s1
    80200570:	00000097          	auipc	ra,0x0
    80200574:	158080e7          	jalr	344(ra) # 802006c8 <acquire>
  r = kmem.freelist;
    80200578:	6c84                	ld	s1,24(s1)
  if(r) {
    8020057a:	c89d                	beqz	s1,802005b0 <kalloc+0x54>
    kmem.freelist = r->next;
    8020057c:	609c                	ld	a5,0(s1)
    8020057e:	00016517          	auipc	a0,0x16
    80200582:	aaa50513          	addi	a0,a0,-1366 # 80216028 <kmem>
    80200586:	ed1c                	sd	a5,24(a0)
    kmem.npage--;
    80200588:	711c                	ld	a5,32(a0)
    8020058a:	17fd                	addi	a5,a5,-1
    8020058c:	f11c                	sd	a5,32(a0)
  }
  release(&kmem.lock);
    8020058e:	00000097          	auipc	ra,0x0
    80200592:	18e080e7          	jalr	398(ra) # 8020071c <release>

  if(r)
    memset((char*)r, 5, PGSIZE); // fill with junk
    80200596:	6605                	lui	a2,0x1
    80200598:	4595                	li	a1,5
    8020059a:	8526                	mv	a0,s1
    8020059c:	00000097          	auipc	ra,0x0
    802005a0:	1c8080e7          	jalr	456(ra) # 80200764 <memset>
  return (void*)r;
}
    802005a4:	8526                	mv	a0,s1
    802005a6:	60e2                	ld	ra,24(sp)
    802005a8:	6442                	ld	s0,16(sp)
    802005aa:	64a2                	ld	s1,8(sp)
    802005ac:	6105                	addi	sp,sp,32
    802005ae:	8082                	ret
  release(&kmem.lock);
    802005b0:	00016517          	auipc	a0,0x16
    802005b4:	a7850513          	addi	a0,a0,-1416 # 80216028 <kmem>
    802005b8:	00000097          	auipc	ra,0x0
    802005bc:	164080e7          	jalr	356(ra) # 8020071c <release>
  if(r)
    802005c0:	b7d5                	j	802005a4 <kalloc+0x48>

00000000802005c2 <freemem_amount>:

uint64
freemem_amount(void)
{
    802005c2:	1141                	addi	sp,sp,-16
    802005c4:	e422                	sd	s0,8(sp)
    802005c6:	0800                	addi	s0,sp,16
  return kmem.npage << PGSHIFT;
}
    802005c8:	00016517          	auipc	a0,0x16
    802005cc:	a8053503          	ld	a0,-1408(a0) # 80216048 <kmem+0x20>
    802005d0:	0532                	slli	a0,a0,0xc
    802005d2:	6422                	ld	s0,8(sp)
    802005d4:	0141                	addi	sp,sp,16
    802005d6:	8082                	ret

00000000802005d8 <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
    802005d8:	1101                	addi	sp,sp,-32
    802005da:	ec06                	sd	ra,24(sp)
    802005dc:	e822                	sd	s0,16(sp)
    802005de:	e426                	sd	s1,8(sp)
    802005e0:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802005e2:	100024f3          	csrr	s1,sstatus
    802005e6:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    802005ea:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802005ec:	10079073          	csrw	sstatus,a5
  int old = intr_get();

  intr_off();
  //printf("\e[32mpush_off()\e[0m: cpuid(): %d\n", cpuid());
  if(mycpu()->noff == 0)
    802005f0:	00001097          	auipc	ra,0x1
    802005f4:	44c080e7          	jalr	1100(ra) # 80201a3c <mycpu>
    802005f8:	5d3c                	lw	a5,120(a0)
    802005fa:	cf89                	beqz	a5,80200614 <push_off+0x3c>
    mycpu()->intena = old;
  mycpu()->noff += 1;
    802005fc:	00001097          	auipc	ra,0x1
    80200600:	440080e7          	jalr	1088(ra) # 80201a3c <mycpu>
    80200604:	5d3c                	lw	a5,120(a0)
    80200606:	2785                	addiw	a5,a5,1
    80200608:	dd3c                	sw	a5,120(a0)
}
    8020060a:	60e2                	ld	ra,24(sp)
    8020060c:	6442                	ld	s0,16(sp)
    8020060e:	64a2                	ld	s1,8(sp)
    80200610:	6105                	addi	sp,sp,32
    80200612:	8082                	ret
    mycpu()->intena = old;
    80200614:	00001097          	auipc	ra,0x1
    80200618:	428080e7          	jalr	1064(ra) # 80201a3c <mycpu>
  return (x & SSTATUS_SIE) != 0;
    8020061c:	8085                	srli	s1,s1,0x1
    8020061e:	8885                	andi	s1,s1,1
    80200620:	dd64                	sw	s1,124(a0)
    80200622:	bfe9                	j	802005fc <push_off+0x24>

0000000080200624 <pop_off>:

void
pop_off(void)
{
    80200624:	1141                	addi	sp,sp,-16
    80200626:	e406                	sd	ra,8(sp)
    80200628:	e022                	sd	s0,0(sp)
    8020062a:	0800                	addi	s0,sp,16
  struct cpu *c = mycpu();
    8020062c:	00001097          	auipc	ra,0x1
    80200630:	410080e7          	jalr	1040(ra) # 80201a3c <mycpu>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80200634:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80200638:	8b89                	andi	a5,a5,2

  //printf("\e[31mpop_off()\e[0m: cpuid(): %d\n", cpuid());
  if(intr_get())
    8020063a:	e78d                	bnez	a5,80200664 <pop_off+0x40>
    panic("pop_off - interruptible");
  if(c->noff < 1) {
    8020063c:	5d3c                	lw	a5,120(a0)
    8020063e:	02f05b63          	blez	a5,80200674 <pop_off+0x50>
    //printf("c->noff = %d\n", c->noff);
    panic("pop_off");
  }
  //printf("c->noff: %d\n", c->noff);
  //printf("c: %x\n", c);
  c->noff -= 1;
    80200642:	37fd                	addiw	a5,a5,-1
    80200644:	0007871b          	sext.w	a4,a5
    80200648:	dd3c                	sw	a5,120(a0)
  if(c->noff == 0 && c->intena)
    8020064a:	eb09                	bnez	a4,8020065c <pop_off+0x38>
    8020064c:	5d7c                	lw	a5,124(a0)
    8020064e:	c799                	beqz	a5,8020065c <pop_off+0x38>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80200650:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80200654:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80200658:	10079073          	csrw	sstatus,a5
    intr_on();
}
    8020065c:	60a2                	ld	ra,8(sp)
    8020065e:	6402                	ld	s0,0(sp)
    80200660:	0141                	addi	sp,sp,16
    80200662:	8082                	ret
    panic("pop_off - interruptible");
    80200664:	0000a517          	auipc	a0,0xa
    80200668:	d4450513          	addi	a0,a0,-700 # 8020a3a8 <digits+0x28>
    8020066c:	00000097          	auipc	ra,0x0
    80200670:	ad6080e7          	jalr	-1322(ra) # 80200142 <panic>
    panic("pop_off");
    80200674:	0000a517          	auipc	a0,0xa
    80200678:	d4c50513          	addi	a0,a0,-692 # 8020a3c0 <digits+0x40>
    8020067c:	00000097          	auipc	ra,0x0
    80200680:	ac6080e7          	jalr	-1338(ra) # 80200142 <panic>

0000000080200684 <initlock>:
#include "include/intr.h"
#include "include/printf.h"

void
initlock(struct spinlock *lk, char *name)
{
    80200684:	1141                	addi	sp,sp,-16
    80200686:	e422                	sd	s0,8(sp)
    80200688:	0800                	addi	s0,sp,16
  lk->name = name;
    8020068a:	e50c                	sd	a1,8(a0)
  lk->locked = 0;
    8020068c:	00052023          	sw	zero,0(a0)
  lk->cpu = 0;
    80200690:	00053823          	sd	zero,16(a0)
}
    80200694:	6422                	ld	s0,8(sp)
    80200696:	0141                	addi	sp,sp,16
    80200698:	8082                	ret

000000008020069a <holding>:
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
  int r;
  r = (lk->locked && lk->cpu == mycpu());
    8020069a:	411c                	lw	a5,0(a0)
    8020069c:	e399                	bnez	a5,802006a2 <holding+0x8>
    8020069e:	4501                	li	a0,0
  return r;
}
    802006a0:	8082                	ret
{
    802006a2:	1101                	addi	sp,sp,-32
    802006a4:	ec06                	sd	ra,24(sp)
    802006a6:	e822                	sd	s0,16(sp)
    802006a8:	e426                	sd	s1,8(sp)
    802006aa:	1000                	addi	s0,sp,32
  r = (lk->locked && lk->cpu == mycpu());
    802006ac:	6904                	ld	s1,16(a0)
    802006ae:	00001097          	auipc	ra,0x1
    802006b2:	38e080e7          	jalr	910(ra) # 80201a3c <mycpu>
    802006b6:	40a48533          	sub	a0,s1,a0
    802006ba:	00153513          	seqz	a0,a0
}
    802006be:	60e2                	ld	ra,24(sp)
    802006c0:	6442                	ld	s0,16(sp)
    802006c2:	64a2                	ld	s1,8(sp)
    802006c4:	6105                	addi	sp,sp,32
    802006c6:	8082                	ret

00000000802006c8 <acquire>:
{
    802006c8:	1101                	addi	sp,sp,-32
    802006ca:	ec06                	sd	ra,24(sp)
    802006cc:	e822                	sd	s0,16(sp)
    802006ce:	e426                	sd	s1,8(sp)
    802006d0:	1000                	addi	s0,sp,32
    802006d2:	84aa                	mv	s1,a0
  push_off(); // disable interrupts to avoid deadlock.
    802006d4:	00000097          	auipc	ra,0x0
    802006d8:	f04080e7          	jalr	-252(ra) # 802005d8 <push_off>
  if(holding(lk))
    802006dc:	8526                	mv	a0,s1
    802006de:	00000097          	auipc	ra,0x0
    802006e2:	fbc080e7          	jalr	-68(ra) # 8020069a <holding>
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    802006e6:	4705                	li	a4,1
  if(holding(lk))
    802006e8:	e115                	bnez	a0,8020070c <acquire+0x44>
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    802006ea:	87ba                	mv	a5,a4
    802006ec:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    802006f0:	2781                	sext.w	a5,a5
    802006f2:	ffe5                	bnez	a5,802006ea <acquire+0x22>
  __sync_synchronize();
    802006f4:	0ff0000f          	fence
  lk->cpu = mycpu();
    802006f8:	00001097          	auipc	ra,0x1
    802006fc:	344080e7          	jalr	836(ra) # 80201a3c <mycpu>
    80200700:	e888                	sd	a0,16(s1)
}
    80200702:	60e2                	ld	ra,24(sp)
    80200704:	6442                	ld	s0,16(sp)
    80200706:	64a2                	ld	s1,8(sp)
    80200708:	6105                	addi	sp,sp,32
    8020070a:	8082                	ret
    panic("acquire");
    8020070c:	0000a517          	auipc	a0,0xa
    80200710:	cbc50513          	addi	a0,a0,-836 # 8020a3c8 <digits+0x48>
    80200714:	00000097          	auipc	ra,0x0
    80200718:	a2e080e7          	jalr	-1490(ra) # 80200142 <panic>

000000008020071c <release>:
{
    8020071c:	1101                	addi	sp,sp,-32
    8020071e:	ec06                	sd	ra,24(sp)
    80200720:	e822                	sd	s0,16(sp)
    80200722:	e426                	sd	s1,8(sp)
    80200724:	1000                	addi	s0,sp,32
    80200726:	84aa                	mv	s1,a0
  if(!holding(lk))
    80200728:	00000097          	auipc	ra,0x0
    8020072c:	f72080e7          	jalr	-142(ra) # 8020069a <holding>
    80200730:	c115                	beqz	a0,80200754 <release+0x38>
  lk->cpu = 0;
    80200732:	0004b823          	sd	zero,16(s1)
  __sync_synchronize();
    80200736:	0ff0000f          	fence
  __sync_lock_release(&lk->locked);
    8020073a:	0f50000f          	fence	iorw,ow
    8020073e:	0804a02f          	amoswap.w	zero,zero,(s1)
  pop_off();
    80200742:	00000097          	auipc	ra,0x0
    80200746:	ee2080e7          	jalr	-286(ra) # 80200624 <pop_off>
}
    8020074a:	60e2                	ld	ra,24(sp)
    8020074c:	6442                	ld	s0,16(sp)
    8020074e:	64a2                	ld	s1,8(sp)
    80200750:	6105                	addi	sp,sp,32
    80200752:	8082                	ret
    panic("release");
    80200754:	0000a517          	auipc	a0,0xa
    80200758:	c7c50513          	addi	a0,a0,-900 # 8020a3d0 <digits+0x50>
    8020075c:	00000097          	auipc	ra,0x0
    80200760:	9e6080e7          	jalr	-1562(ra) # 80200142 <panic>

0000000080200764 <memset>:
#include "include/types.h"

void*
memset(void *dst, int c, uint n)
{
    80200764:	1141                	addi	sp,sp,-16
    80200766:	e422                	sd	s0,8(sp)
    80200768:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
    8020076a:	ce09                	beqz	a2,80200784 <memset+0x20>
    8020076c:	87aa                	mv	a5,a0
    8020076e:	fff6071b          	addiw	a4,a2,-1
    80200772:	1702                	slli	a4,a4,0x20
    80200774:	9301                	srli	a4,a4,0x20
    80200776:	0705                	addi	a4,a4,1
    80200778:	972a                	add	a4,a4,a0
    cdst[i] = c;
    8020077a:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
    8020077e:	0785                	addi	a5,a5,1
    80200780:	fee79de3          	bne	a5,a4,8020077a <memset+0x16>
  }
  return dst;
}
    80200784:	6422                	ld	s0,8(sp)
    80200786:	0141                	addi	sp,sp,16
    80200788:	8082                	ret

000000008020078a <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
    8020078a:	1141                	addi	sp,sp,-16
    8020078c:	e422                	sd	s0,8(sp)
    8020078e:	0800                	addi	s0,sp,16
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    80200790:	ca05                	beqz	a2,802007c0 <memcmp+0x36>
    80200792:	fff6069b          	addiw	a3,a2,-1
    80200796:	1682                	slli	a3,a3,0x20
    80200798:	9281                	srli	a3,a3,0x20
    8020079a:	0685                	addi	a3,a3,1
    8020079c:	96aa                	add	a3,a3,a0
    if(*s1 != *s2)
    8020079e:	00054783          	lbu	a5,0(a0)
    802007a2:	0005c703          	lbu	a4,0(a1)
    802007a6:	00e79863          	bne	a5,a4,802007b6 <memcmp+0x2c>
      return *s1 - *s2;
    s1++, s2++;
    802007aa:	0505                	addi	a0,a0,1
    802007ac:	0585                	addi	a1,a1,1
  while(n-- > 0){
    802007ae:	fed518e3          	bne	a0,a3,8020079e <memcmp+0x14>
  }

  return 0;
    802007b2:	4501                	li	a0,0
    802007b4:	a019                	j	802007ba <memcmp+0x30>
      return *s1 - *s2;
    802007b6:	40e7853b          	subw	a0,a5,a4
}
    802007ba:	6422                	ld	s0,8(sp)
    802007bc:	0141                	addi	sp,sp,16
    802007be:	8082                	ret
  return 0;
    802007c0:	4501                	li	a0,0
    802007c2:	bfe5                	j	802007ba <memcmp+0x30>

00000000802007c4 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
    802007c4:	1141                	addi	sp,sp,-16
    802007c6:	e422                	sd	s0,8(sp)
    802007c8:	0800                	addi	s0,sp,16
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
    802007ca:	00a5f963          	bgeu	a1,a0,802007dc <memmove+0x18>
    802007ce:	02061713          	slli	a4,a2,0x20
    802007d2:	9301                	srli	a4,a4,0x20
    802007d4:	00e587b3          	add	a5,a1,a4
    802007d8:	02f56563          	bltu	a0,a5,80200802 <memmove+0x3e>
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
    802007dc:	fff6069b          	addiw	a3,a2,-1
    802007e0:	ce11                	beqz	a2,802007fc <memmove+0x38>
    802007e2:	1682                	slli	a3,a3,0x20
    802007e4:	9281                	srli	a3,a3,0x20
    802007e6:	0685                	addi	a3,a3,1
    802007e8:	96ae                	add	a3,a3,a1
    802007ea:	87aa                	mv	a5,a0
      *d++ = *s++;
    802007ec:	0585                	addi	a1,a1,1
    802007ee:	0785                	addi	a5,a5,1
    802007f0:	fff5c703          	lbu	a4,-1(a1)
    802007f4:	fee78fa3          	sb	a4,-1(a5)
    while(n-- > 0)
    802007f8:	fed59ae3          	bne	a1,a3,802007ec <memmove+0x28>

  return dst;
}
    802007fc:	6422                	ld	s0,8(sp)
    802007fe:	0141                	addi	sp,sp,16
    80200800:	8082                	ret
    d += n;
    80200802:	972a                	add	a4,a4,a0
    while(n-- > 0)
    80200804:	fff6069b          	addiw	a3,a2,-1
    80200808:	da75                	beqz	a2,802007fc <memmove+0x38>
    8020080a:	02069613          	slli	a2,a3,0x20
    8020080e:	9201                	srli	a2,a2,0x20
    80200810:	fff64613          	not	a2,a2
    80200814:	963e                	add	a2,a2,a5
      *--d = *--s;
    80200816:	17fd                	addi	a5,a5,-1
    80200818:	177d                	addi	a4,a4,-1
    8020081a:	0007c683          	lbu	a3,0(a5)
    8020081e:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
    80200822:	fec79ae3          	bne	a5,a2,80200816 <memmove+0x52>
    80200826:	bfd9                	j	802007fc <memmove+0x38>

0000000080200828 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
    80200828:	1141                	addi	sp,sp,-16
    8020082a:	e406                	sd	ra,8(sp)
    8020082c:	e022                	sd	s0,0(sp)
    8020082e:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
    80200830:	00000097          	auipc	ra,0x0
    80200834:	f94080e7          	jalr	-108(ra) # 802007c4 <memmove>
}
    80200838:	60a2                	ld	ra,8(sp)
    8020083a:	6402                	ld	s0,0(sp)
    8020083c:	0141                	addi	sp,sp,16
    8020083e:	8082                	ret

0000000080200840 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
    80200840:	1141                	addi	sp,sp,-16
    80200842:	e422                	sd	s0,8(sp)
    80200844:	0800                	addi	s0,sp,16
  while(n > 0 && *p && *p == *q)
    80200846:	ce11                	beqz	a2,80200862 <strncmp+0x22>
    80200848:	00054783          	lbu	a5,0(a0)
    8020084c:	cf89                	beqz	a5,80200866 <strncmp+0x26>
    8020084e:	0005c703          	lbu	a4,0(a1)
    80200852:	00f71a63          	bne	a4,a5,80200866 <strncmp+0x26>
    n--, p++, q++;
    80200856:	367d                	addiw	a2,a2,-1
    80200858:	0505                	addi	a0,a0,1
    8020085a:	0585                	addi	a1,a1,1
  while(n > 0 && *p && *p == *q)
    8020085c:	f675                	bnez	a2,80200848 <strncmp+0x8>
  if(n == 0)
    return 0;
    8020085e:	4501                	li	a0,0
    80200860:	a809                	j	80200872 <strncmp+0x32>
    80200862:	4501                	li	a0,0
    80200864:	a039                	j	80200872 <strncmp+0x32>
  if(n == 0)
    80200866:	ca09                	beqz	a2,80200878 <strncmp+0x38>
  return (uchar)*p - (uchar)*q;
    80200868:	00054503          	lbu	a0,0(a0)
    8020086c:	0005c783          	lbu	a5,0(a1)
    80200870:	9d1d                	subw	a0,a0,a5
}
    80200872:	6422                	ld	s0,8(sp)
    80200874:	0141                	addi	sp,sp,16
    80200876:	8082                	ret
    return 0;
    80200878:	4501                	li	a0,0
    8020087a:	bfe5                	j	80200872 <strncmp+0x32>

000000008020087c <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    8020087c:	1141                	addi	sp,sp,-16
    8020087e:	e422                	sd	s0,8(sp)
    80200880:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    80200882:	872a                	mv	a4,a0
    80200884:	8832                	mv	a6,a2
    80200886:	367d                	addiw	a2,a2,-1
    80200888:	01005963          	blez	a6,8020089a <strncpy+0x1e>
    8020088c:	0705                	addi	a4,a4,1
    8020088e:	0005c783          	lbu	a5,0(a1)
    80200892:	fef70fa3          	sb	a5,-1(a4)
    80200896:	0585                	addi	a1,a1,1
    80200898:	f7f5                	bnez	a5,80200884 <strncpy+0x8>
    ;
  while(n-- > 0)
    8020089a:	00c05d63          	blez	a2,802008b4 <strncpy+0x38>
    8020089e:	86ba                	mv	a3,a4
    *s++ = 0;
    802008a0:	0685                	addi	a3,a3,1
    802008a2:	fe068fa3          	sb	zero,-1(a3)
  while(n-- > 0)
    802008a6:	fff6c793          	not	a5,a3
    802008aa:	9fb9                	addw	a5,a5,a4
    802008ac:	010787bb          	addw	a5,a5,a6
    802008b0:	fef048e3          	bgtz	a5,802008a0 <strncpy+0x24>
  return os;
}
    802008b4:	6422                	ld	s0,8(sp)
    802008b6:	0141                	addi	sp,sp,16
    802008b8:	8082                	ret

00000000802008ba <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
    802008ba:	1141                	addi	sp,sp,-16
    802008bc:	e422                	sd	s0,8(sp)
    802008be:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  if(n <= 0)
    802008c0:	02c05363          	blez	a2,802008e6 <safestrcpy+0x2c>
    802008c4:	fff6069b          	addiw	a3,a2,-1
    802008c8:	1682                	slli	a3,a3,0x20
    802008ca:	9281                	srli	a3,a3,0x20
    802008cc:	96ae                	add	a3,a3,a1
    802008ce:	87aa                	mv	a5,a0
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
    802008d0:	00d58963          	beq	a1,a3,802008e2 <safestrcpy+0x28>
    802008d4:	0585                	addi	a1,a1,1
    802008d6:	0785                	addi	a5,a5,1
    802008d8:	fff5c703          	lbu	a4,-1(a1)
    802008dc:	fee78fa3          	sb	a4,-1(a5)
    802008e0:	fb65                	bnez	a4,802008d0 <safestrcpy+0x16>
    ;
  *s = 0;
    802008e2:	00078023          	sb	zero,0(a5)
  return os;
}
    802008e6:	6422                	ld	s0,8(sp)
    802008e8:	0141                	addi	sp,sp,16
    802008ea:	8082                	ret

00000000802008ec <strlen>:

int
strlen(const char *s)
{
    802008ec:	1141                	addi	sp,sp,-16
    802008ee:	e422                	sd	s0,8(sp)
    802008f0:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
    802008f2:	00054783          	lbu	a5,0(a0)
    802008f6:	cf91                	beqz	a5,80200912 <strlen+0x26>
    802008f8:	0505                	addi	a0,a0,1
    802008fa:	87aa                	mv	a5,a0
    802008fc:	4685                	li	a3,1
    802008fe:	9e89                	subw	a3,a3,a0
    80200900:	00f6853b          	addw	a0,a3,a5
    80200904:	0785                	addi	a5,a5,1
    80200906:	fff7c703          	lbu	a4,-1(a5)
    8020090a:	fb7d                	bnez	a4,80200900 <strlen+0x14>
    ;
  return n;
}
    8020090c:	6422                	ld	s0,8(sp)
    8020090e:	0141                	addi	sp,sp,16
    80200910:	8082                	ret
  for(n = 0; s[n]; n++)
    80200912:	4501                	li	a0,0
    80200914:	bfe5                	j	8020090c <strlen+0x20>

0000000080200916 <wnstr>:

// convert uchar string into wide char string 
void wnstr(wchar *dst, char const *src, int len) {
    80200916:	1141                	addi	sp,sp,-16
    80200918:	e422                	sd	s0,8(sp)
    8020091a:	0800                	addi	s0,sp,16
  while (len -- && *src) {
    8020091c:	c215                	beqz	a2,80200940 <wnstr+0x2a>
    8020091e:	fff6071b          	addiw	a4,a2,-1
    80200922:	1702                	slli	a4,a4,0x20
    80200924:	9301                	srli	a4,a4,0x20
    80200926:	0705                	addi	a4,a4,1
    80200928:	0706                	slli	a4,a4,0x1
    8020092a:	972a                	add	a4,a4,a0
    8020092c:	0005c783          	lbu	a5,0(a1)
    80200930:	cb81                	beqz	a5,80200940 <wnstr+0x2a>
    *(uchar*)dst = *src++;
    80200932:	0585                	addi	a1,a1,1
    80200934:	00f50023          	sb	a5,0(a0)
    dst ++;
    80200938:	0509                	addi	a0,a0,2
  while (len -- && *src) {
    8020093a:	fee519e3          	bne	a0,a4,8020092c <wnstr+0x16>
    dst ++;
    8020093e:	853a                	mv	a0,a4
  }

  *dst = 0;
    80200940:	00051023          	sh	zero,0(a0)
}
    80200944:	6422                	ld	s0,8(sp)
    80200946:	0141                	addi	sp,sp,16
    80200948:	8082                	ret

000000008020094a <snstr>:

// convert wide char string into uchar string 
void snstr(char *dst, wchar const *src, int len) {
    8020094a:	1141                	addi	sp,sp,-16
    8020094c:	e422                	sd	s0,8(sp)
    8020094e:	0800                	addi	s0,sp,16
  while (len -- && *src) {
    80200950:	c221                	beqz	a2,80200990 <snstr+0x46>
    80200952:	fff6079b          	addiw	a5,a2,-1
    80200956:	fff6069b          	addiw	a3,a2,-1
    8020095a:	1682                	slli	a3,a3,0x20
    8020095c:	9281                	srli	a3,a3,0x20
    8020095e:	0685                	addi	a3,a3,1
    80200960:	96aa                	add	a3,a3,a0
    80200962:	0005d703          	lhu	a4,0(a1)
    80200966:	cb09                	beqz	a4,80200978 <snstr+0x2e>
    *dst++ = (uchar)(*src & 0xff);
    80200968:	0505                	addi	a0,a0,1
    8020096a:	fee50fa3          	sb	a4,-1(a0)
    src ++;
    8020096e:	0589                	addi	a1,a1,2
  while (len -- && *src) {
    80200970:	37fd                	addiw	a5,a5,-1
    80200972:	fed518e3          	bne	a0,a3,80200962 <snstr+0x18>
    *dst++ = (uchar)(*src & 0xff);
    80200976:	8536                	mv	a0,a3
  }
  while(len-- > 0)
    80200978:	00f05c63          	blez	a5,80200990 <snstr+0x46>
    8020097c:	37fd                	addiw	a5,a5,-1
    8020097e:	1782                	slli	a5,a5,0x20
    80200980:	9381                	srli	a5,a5,0x20
    80200982:	0785                	addi	a5,a5,1
    80200984:	97aa                	add	a5,a5,a0
    *dst++ = 0;
    80200986:	0505                	addi	a0,a0,1
    80200988:	fe050fa3          	sb	zero,-1(a0)
  while(len-- > 0)
    8020098c:	fea79de3          	bne	a5,a0,80200986 <snstr+0x3c>
}
    80200990:	6422                	ld	s0,8(sp)
    80200992:	0141                	addi	sp,sp,16
    80200994:	8082                	ret

0000000080200996 <wcsncmp>:

int wcsncmp(wchar const *s1, wchar const *s2, int len) {
    80200996:	1141                	addi	sp,sp,-16
    80200998:	e422                	sd	s0,8(sp)
    8020099a:	0800                	addi	s0,sp,16
    8020099c:	872a                	mv	a4,a0
  int ret = 0;

  while (len-- && *s1) {
    8020099e:	02061693          	slli	a3,a2,0x20
    802009a2:	9281                	srli	a3,a3,0x20
    802009a4:	0686                	slli	a3,a3,0x1
    802009a6:	96ae                	add	a3,a3,a1
    802009a8:	00d58f63          	beq	a1,a3,802009c6 <wcsncmp+0x30>
    802009ac:	00075783          	lhu	a5,0(a4)
    802009b0:	cb89                	beqz	a5,802009c2 <wcsncmp+0x2c>
    ret = (int)(*s1++ - *s2++);
    802009b2:	0709                	addi	a4,a4,2
    802009b4:	0589                	addi	a1,a1,2
    802009b6:	ffe5d503          	lhu	a0,-2(a1)
    802009ba:	40a7853b          	subw	a0,a5,a0
    if (ret) break;
    802009be:	d56d                	beqz	a0,802009a8 <wcsncmp+0x12>
    802009c0:	a021                	j	802009c8 <wcsncmp+0x32>
    802009c2:	4501                	li	a0,0
    802009c4:	a011                	j	802009c8 <wcsncmp+0x32>
    802009c6:	4501                	li	a0,0
  }

  return ret;
}
    802009c8:	6422                	ld	s0,8(sp)
    802009ca:	0141                	addi	sp,sp,16
    802009cc:	8082                	ret

00000000802009ce <strchr>:

char*
strchr(const char *s, char c)
{
    802009ce:	1141                	addi	sp,sp,-16
    802009d0:	e422                	sd	s0,8(sp)
    802009d2:	0800                	addi	s0,sp,16
  for(; *s; s++)
    802009d4:	00054783          	lbu	a5,0(a0)
    802009d8:	cb99                	beqz	a5,802009ee <strchr+0x20>
    if(*s == c)
    802009da:	00f58763          	beq	a1,a5,802009e8 <strchr+0x1a>
  for(; *s; s++)
    802009de:	0505                	addi	a0,a0,1
    802009e0:	00054783          	lbu	a5,0(a0)
    802009e4:	fbfd                	bnez	a5,802009da <strchr+0xc>
      return (char*)s;
  return 0;
    802009e6:	4501                	li	a0,0
    802009e8:	6422                	ld	s0,8(sp)
    802009ea:	0141                	addi	sp,sp,16
    802009ec:	8082                	ret
  return 0;
    802009ee:	4501                	li	a0,0
    802009f0:	bfe5                	j	802009e8 <strchr+0x1a>

00000000802009f2 <main>:
// added by lmq
// extern char _entry[];

void
main(unsigned long hartid, unsigned long dtb_pa)
{
    802009f2:	1101                	addi	sp,sp,-32
    802009f4:	ec06                	sd	ra,24(sp)
    802009f6:	e822                	sd	s0,16(sp)
    802009f8:	1000                	addi	s0,sp,32
  asm volatile("mv tp, %0" : : "r" (hartid & 0x1));
    802009fa:	00157793          	andi	a5,a0,1
    802009fe:	823e                	mv	tp,a5
    started = 1;
  }
  else
  {
    // hart 1
    while (started == 0)
    80200a00:	00015717          	auipc	a4,0x15
    80200a04:	65070713          	addi	a4,a4,1616 # 80216050 <started>
  if (hartid == 0) {
    80200a08:	cd15                	beqz	a0,80200a44 <main+0x52>
    while (started == 0)
    80200a0a:	431c                	lw	a5,0(a4)
    80200a0c:	2781                	sext.w	a5,a5
    80200a0e:	dff5                	beqz	a5,80200a0a <main+0x18>
      ;
    __sync_synchronize();
    80200a10:	0ff0000f          	fence
    #ifdef DEBUG
    printf("hart %d enter main()...\n", hartid);
    #endif
    kvminithart();
    80200a14:	00000097          	auipc	ra,0x0
    80200a18:	0de080e7          	jalr	222(ra) # 80200af2 <kvminithart>
    trapinithart();
    80200a1c:	00002097          	auipc	ra,0x2
    80200a20:	df6080e7          	jalr	-522(ra) # 80202812 <trapinithart>
    plicinithart();  // ask PLIC for device interrupts
    80200a24:	00007097          	auipc	ra,0x7
    80200a28:	e0a080e7          	jalr	-502(ra) # 8020782e <plicinithart>
    printf("hart 1 init done\n");
    80200a2c:	0000a517          	auipc	a0,0xa
    80200a30:	9c450513          	addi	a0,a0,-1596 # 8020a3f0 <digits+0x70>
    80200a34:	fffff097          	auipc	ra,0xfffff
    80200a38:	758080e7          	jalr	1880(ra) # 8020018c <printf>
  }
  scheduler();
    80200a3c:	00001097          	auipc	ra,0x1
    80200a40:	590080e7          	jalr	1424(ra) # 80201fcc <scheduler>
    consoleinit();
    80200a44:	00007097          	auipc	ra,0x7
    80200a48:	200080e7          	jalr	512(ra) # 80207c44 <consoleinit>
    printfinit();   // init a lock for printf 
    80200a4c:	00000097          	auipc	ra,0x0
    80200a50:	926080e7          	jalr	-1754(ra) # 80200372 <printfinit>
    print_logo();
    80200a54:	00000097          	auipc	ra,0x0
    80200a58:	950080e7          	jalr	-1712(ra) # 802003a4 <print_logo>
    kinit();         // physical page allocator
    80200a5c:	00000097          	auipc	ra,0x0
    80200a60:	ab4080e7          	jalr	-1356(ra) # 80200510 <kinit>
    kvminit();       // create kernel page table
    80200a64:	00000097          	auipc	ra,0x0
    80200a68:	2d8080e7          	jalr	728(ra) # 80200d3c <kvminit>
    kvminithart();   // turn on paging
    80200a6c:	00000097          	auipc	ra,0x0
    80200a70:	086080e7          	jalr	134(ra) # 80200af2 <kvminithart>
    timerinit();     // init a lock for timer
    80200a74:	00005097          	auipc	ra,0x5
    80200a78:	38a080e7          	jalr	906(ra) # 80205dfe <timerinit>
    trapinithart();  // install kernel trap vector, including interrupt handler
    80200a7c:	00002097          	auipc	ra,0x2
    80200a80:	d96080e7          	jalr	-618(ra) # 80202812 <trapinithart>
    procinit();
    80200a84:	00001097          	auipc	ra,0x1
    80200a88:	f32080e7          	jalr	-206(ra) # 802019b6 <procinit>
    plicinit();
    80200a8c:	00007097          	auipc	ra,0x7
    80200a90:	d8a080e7          	jalr	-630(ra) # 80207816 <plicinit>
    plicinithart();
    80200a94:	00007097          	auipc	ra,0x7
    80200a98:	d9a080e7          	jalr	-614(ra) # 8020782e <plicinithart>
    disk_init();
    80200a9c:	00005097          	auipc	ra,0x5
    80200aa0:	3fe080e7          	jalr	1022(ra) # 80205e9a <disk_init>
    binit();         // buffer cache
    80200aa4:	00003097          	auipc	ra,0x3
    80200aa8:	df8080e7          	jalr	-520(ra) # 8020389c <binit>
    fileinit();      // file table
    80200aac:	00003097          	auipc	ra,0x3
    80200ab0:	1fc080e7          	jalr	508(ra) # 80203ca8 <fileinit>
    userinit();      // first user process
    80200ab4:	00001097          	auipc	ra,0x1
    80200ab8:	2b2080e7          	jalr	690(ra) # 80201d66 <userinit>
    printf("hart 0 init done\n");
    80200abc:	0000a517          	auipc	a0,0xa
    80200ac0:	91c50513          	addi	a0,a0,-1764 # 8020a3d8 <digits+0x58>
    80200ac4:	fffff097          	auipc	ra,0xfffff
    80200ac8:	6c8080e7          	jalr	1736(ra) # 8020018c <printf>
      unsigned long mask = 1 << i;
    80200acc:	4789                	li	a5,2
    80200ace:	fef43423          	sd	a5,-24(s0)
	SBI_CALL_0(SBI_CLEAR_IPI);
}

static inline void sbi_send_ipi(const unsigned long *hart_mask)
{
	SBI_CALL_1(SBI_SEND_IPI, hart_mask);
    80200ad2:	fe840513          	addi	a0,s0,-24
    80200ad6:	4581                	li	a1,0
    80200ad8:	4601                	li	a2,0
    80200ada:	4681                	li	a3,0
    80200adc:	4891                	li	a7,4
    80200ade:	00000073          	ecall
    __sync_synchronize();
    80200ae2:	0ff0000f          	fence
    started = 1;
    80200ae6:	4785                	li	a5,1
    80200ae8:	00015717          	auipc	a4,0x15
    80200aec:	56f72423          	sw	a5,1384(a4) # 80216050 <started>
    80200af0:	b7b1                	j	80200a3c <main+0x4a>

0000000080200af2 <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80200af2:	1141                	addi	sp,sp,-16
    80200af4:	e422                	sd	s0,8(sp)
    80200af6:	0800                	addi	s0,sp,16
  w_satp(MAKE_SATP(kernel_pagetable));
    80200af8:	00015797          	auipc	a5,0x15
    80200afc:	5607b783          	ld	a5,1376(a5) # 80216058 <kernel_pagetable>
    80200b00:	83b1                	srli	a5,a5,0xc
    80200b02:	577d                	li	a4,-1
    80200b04:	177e                	slli	a4,a4,0x3f
    80200b06:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    80200b08:	18079073          	csrw	satp,a5
static inline void
sfence_vma()
{
  // the zero, zero means flush all TLB entries.
  // asm volatile("sfence.vma zero, zero");
  asm volatile("sfence.vma");
    80200b0c:	12000073          	sfence.vma
  // reg_info();
  sfence_vma();
  #ifdef DEBUG
  printf("kvminithart\n");
  #endif
}
    80200b10:	6422                	ld	s0,8(sp)
    80200b12:	0141                	addi	sp,sp,16
    80200b14:	8082                	ret

0000000080200b16 <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80200b16:	7139                	addi	sp,sp,-64
    80200b18:	fc06                	sd	ra,56(sp)
    80200b1a:	f822                	sd	s0,48(sp)
    80200b1c:	f426                	sd	s1,40(sp)
    80200b1e:	f04a                	sd	s2,32(sp)
    80200b20:	ec4e                	sd	s3,24(sp)
    80200b22:	e852                	sd	s4,16(sp)
    80200b24:	e456                	sd	s5,8(sp)
    80200b26:	e05a                	sd	s6,0(sp)
    80200b28:	0080                	addi	s0,sp,64
    80200b2a:	84aa                	mv	s1,a0
    80200b2c:	89ae                	mv	s3,a1
    80200b2e:	8ab2                	mv	s5,a2
  
  if(va >= MAXVA)
    80200b30:	57fd                	li	a5,-1
    80200b32:	83e9                	srli	a5,a5,0x1a
    80200b34:	4a79                	li	s4,30
    panic("walk");

  for(int level = 2; level > 0; level--) {
    80200b36:	4b31                	li	s6,12
  if(va >= MAXVA)
    80200b38:	04b7f263          	bgeu	a5,a1,80200b7c <walk+0x66>
    panic("walk");
    80200b3c:	0000a517          	auipc	a0,0xa
    80200b40:	8cc50513          	addi	a0,a0,-1844 # 8020a408 <digits+0x88>
    80200b44:	fffff097          	auipc	ra,0xfffff
    80200b48:	5fe080e7          	jalr	1534(ra) # 80200142 <panic>
    pte_t *pte = &pagetable[PX(level, va)];
    if(*pte & PTE_V) {
      pagetable = (pagetable_t)PTE2PA(*pte);
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == NULL)
    80200b4c:	060a8663          	beqz	s5,80200bb8 <walk+0xa2>
    80200b50:	00000097          	auipc	ra,0x0
    80200b54:	a0c080e7          	jalr	-1524(ra) # 8020055c <kalloc>
    80200b58:	84aa                	mv	s1,a0
    80200b5a:	c529                	beqz	a0,80200ba4 <walk+0x8e>
        return NULL;
      memset(pagetable, 0, PGSIZE);
    80200b5c:	6605                	lui	a2,0x1
    80200b5e:	4581                	li	a1,0
    80200b60:	00000097          	auipc	ra,0x0
    80200b64:	c04080e7          	jalr	-1020(ra) # 80200764 <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80200b68:	00c4d793          	srli	a5,s1,0xc
    80200b6c:	07aa                	slli	a5,a5,0xa
    80200b6e:	0017e793          	ori	a5,a5,1
    80200b72:	00f93023          	sd	a5,0(s2)
  for(int level = 2; level > 0; level--) {
    80200b76:	3a5d                	addiw	s4,s4,-9
    80200b78:	036a0063          	beq	s4,s6,80200b98 <walk+0x82>
    pte_t *pte = &pagetable[PX(level, va)];
    80200b7c:	0149d933          	srl	s2,s3,s4
    80200b80:	1ff97913          	andi	s2,s2,511
    80200b84:	090e                	slli	s2,s2,0x3
    80200b86:	9926                	add	s2,s2,s1
    if(*pte & PTE_V) {
    80200b88:	00093483          	ld	s1,0(s2)
    80200b8c:	0014f793          	andi	a5,s1,1
    80200b90:	dfd5                	beqz	a5,80200b4c <walk+0x36>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80200b92:	80a9                	srli	s1,s1,0xa
    80200b94:	04b2                	slli	s1,s1,0xc
    80200b96:	b7c5                	j	80200b76 <walk+0x60>
    }
  }
  return &pagetable[PX(0, va)];
    80200b98:	00c9d513          	srli	a0,s3,0xc
    80200b9c:	1ff57513          	andi	a0,a0,511
    80200ba0:	050e                	slli	a0,a0,0x3
    80200ba2:	9526                	add	a0,a0,s1
}
    80200ba4:	70e2                	ld	ra,56(sp)
    80200ba6:	7442                	ld	s0,48(sp)
    80200ba8:	74a2                	ld	s1,40(sp)
    80200baa:	7902                	ld	s2,32(sp)
    80200bac:	69e2                	ld	s3,24(sp)
    80200bae:	6a42                	ld	s4,16(sp)
    80200bb0:	6aa2                	ld	s5,8(sp)
    80200bb2:	6b02                	ld	s6,0(sp)
    80200bb4:	6121                	addi	sp,sp,64
    80200bb6:	8082                	ret
        return NULL;
    80200bb8:	4501                	li	a0,0
    80200bba:	b7ed                	j	80200ba4 <walk+0x8e>

0000000080200bbc <walkaddr>:
walkaddr(pagetable_t pagetable, uint64 va)
{
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80200bbc:	57fd                	li	a5,-1
    80200bbe:	83e9                	srli	a5,a5,0x1a
    80200bc0:	00b7f463          	bgeu	a5,a1,80200bc8 <walkaddr+0xc>
    return NULL;
    80200bc4:	4501                	li	a0,0
    return NULL;
  if((*pte & PTE_U) == 0)
    return NULL;
  pa = PTE2PA(*pte);
  return pa;
}
    80200bc6:	8082                	ret
{
    80200bc8:	1141                	addi	sp,sp,-16
    80200bca:	e406                	sd	ra,8(sp)
    80200bcc:	e022                	sd	s0,0(sp)
    80200bce:	0800                	addi	s0,sp,16
  pte = walk(pagetable, va, 0);
    80200bd0:	4601                	li	a2,0
    80200bd2:	00000097          	auipc	ra,0x0
    80200bd6:	f44080e7          	jalr	-188(ra) # 80200b16 <walk>
  if(pte == 0)
    80200bda:	c105                	beqz	a0,80200bfa <walkaddr+0x3e>
  if((*pte & PTE_V) == 0)
    80200bdc:	611c                	ld	a5,0(a0)
  if((*pte & PTE_U) == 0)
    80200bde:	0117f693          	andi	a3,a5,17
    80200be2:	4745                	li	a4,17
    return NULL;
    80200be4:	4501                	li	a0,0
  if((*pte & PTE_U) == 0)
    80200be6:	00e68663          	beq	a3,a4,80200bf2 <walkaddr+0x36>
}
    80200bea:	60a2                	ld	ra,8(sp)
    80200bec:	6402                	ld	s0,0(sp)
    80200bee:	0141                	addi	sp,sp,16
    80200bf0:	8082                	ret
  pa = PTE2PA(*pte);
    80200bf2:	00a7d513          	srli	a0,a5,0xa
    80200bf6:	0532                	slli	a0,a0,0xc
  return pa;
    80200bf8:	bfcd                	j	80200bea <walkaddr+0x2e>
    return NULL;
    80200bfa:	4501                	li	a0,0
    80200bfc:	b7fd                	j	80200bea <walkaddr+0x2e>

0000000080200bfe <kwalkaddr>:
  return kwalkaddr(kernel_pagetable, va);
}

uint64
kwalkaddr(pagetable_t kpt, uint64 va)
{
    80200bfe:	1101                	addi	sp,sp,-32
    80200c00:	ec06                	sd	ra,24(sp)
    80200c02:	e822                	sd	s0,16(sp)
    80200c04:	e426                	sd	s1,8(sp)
    80200c06:	1000                	addi	s0,sp,32
  uint64 off = va % PGSIZE;
    80200c08:	03459793          	slli	a5,a1,0x34
    80200c0c:	0347d493          	srli	s1,a5,0x34
  pte_t *pte;
  uint64 pa;
  
  pte = walk(kpt, va, 0);
    80200c10:	4601                	li	a2,0
    80200c12:	00000097          	auipc	ra,0x0
    80200c16:	f04080e7          	jalr	-252(ra) # 80200b16 <walk>
  if(pte == 0)
    80200c1a:	cd09                	beqz	a0,80200c34 <kwalkaddr+0x36>
    panic("kvmpa");
  if((*pte & PTE_V) == 0)
    80200c1c:	6108                	ld	a0,0(a0)
    80200c1e:	00157793          	andi	a5,a0,1
    80200c22:	c38d                	beqz	a5,80200c44 <kwalkaddr+0x46>
    panic("kvmpa");
  pa = PTE2PA(*pte);
    80200c24:	8129                	srli	a0,a0,0xa
    80200c26:	0532                	slli	a0,a0,0xc
  return pa+off;
}
    80200c28:	9526                	add	a0,a0,s1
    80200c2a:	60e2                	ld	ra,24(sp)
    80200c2c:	6442                	ld	s0,16(sp)
    80200c2e:	64a2                	ld	s1,8(sp)
    80200c30:	6105                	addi	sp,sp,32
    80200c32:	8082                	ret
    panic("kvmpa");
    80200c34:	00009517          	auipc	a0,0x9
    80200c38:	7dc50513          	addi	a0,a0,2012 # 8020a410 <digits+0x90>
    80200c3c:	fffff097          	auipc	ra,0xfffff
    80200c40:	506080e7          	jalr	1286(ra) # 80200142 <panic>
    panic("kvmpa");
    80200c44:	00009517          	auipc	a0,0x9
    80200c48:	7cc50513          	addi	a0,a0,1996 # 8020a410 <digits+0x90>
    80200c4c:	fffff097          	auipc	ra,0xfffff
    80200c50:	4f6080e7          	jalr	1270(ra) # 80200142 <panic>

0000000080200c54 <kvmpa>:
{
    80200c54:	1141                	addi	sp,sp,-16
    80200c56:	e406                	sd	ra,8(sp)
    80200c58:	e022                	sd	s0,0(sp)
    80200c5a:	0800                	addi	s0,sp,16
    80200c5c:	85aa                	mv	a1,a0
  return kwalkaddr(kernel_pagetable, va);
    80200c5e:	00015517          	auipc	a0,0x15
    80200c62:	3fa53503          	ld	a0,1018(a0) # 80216058 <kernel_pagetable>
    80200c66:	00000097          	auipc	ra,0x0
    80200c6a:	f98080e7          	jalr	-104(ra) # 80200bfe <kwalkaddr>
}
    80200c6e:	60a2                	ld	ra,8(sp)
    80200c70:	6402                	ld	s0,0(sp)
    80200c72:	0141                	addi	sp,sp,16
    80200c74:	8082                	ret

0000000080200c76 <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80200c76:	715d                	addi	sp,sp,-80
    80200c78:	e486                	sd	ra,72(sp)
    80200c7a:	e0a2                	sd	s0,64(sp)
    80200c7c:	fc26                	sd	s1,56(sp)
    80200c7e:	f84a                	sd	s2,48(sp)
    80200c80:	f44e                	sd	s3,40(sp)
    80200c82:	f052                	sd	s4,32(sp)
    80200c84:	ec56                	sd	s5,24(sp)
    80200c86:	e85a                	sd	s6,16(sp)
    80200c88:	e45e                	sd	s7,8(sp)
    80200c8a:	0880                	addi	s0,sp,80
    80200c8c:	8aaa                	mv	s5,a0
    80200c8e:	8b3a                	mv	s6,a4
  uint64 a, last;
  pte_t *pte;

  a = PGROUNDDOWN(va);
    80200c90:	777d                	lui	a4,0xfffff
    80200c92:	00e5f7b3          	and	a5,a1,a4
  last = PGROUNDDOWN(va + size - 1);
    80200c96:	167d                	addi	a2,a2,-1
    80200c98:	00b609b3          	add	s3,a2,a1
    80200c9c:	00e9f9b3          	and	s3,s3,a4
  a = PGROUNDDOWN(va);
    80200ca0:	893e                	mv	s2,a5
    80200ca2:	40f68a33          	sub	s4,a3,a5
    if(*pte & PTE_V)
      panic("remap");
    *pte = PA2PTE(pa) | perm | PTE_V;
    if(a == last)
      break;
    a += PGSIZE;
    80200ca6:	6b85                	lui	s7,0x1
    80200ca8:	012a04b3          	add	s1,s4,s2
    if((pte = walk(pagetable, a, 1)) == NULL)
    80200cac:	4605                	li	a2,1
    80200cae:	85ca                	mv	a1,s2
    80200cb0:	8556                	mv	a0,s5
    80200cb2:	00000097          	auipc	ra,0x0
    80200cb6:	e64080e7          	jalr	-412(ra) # 80200b16 <walk>
    80200cba:	c51d                	beqz	a0,80200ce8 <mappages+0x72>
    if(*pte & PTE_V)
    80200cbc:	611c                	ld	a5,0(a0)
    80200cbe:	8b85                	andi	a5,a5,1
    80200cc0:	ef81                	bnez	a5,80200cd8 <mappages+0x62>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80200cc2:	80b1                	srli	s1,s1,0xc
    80200cc4:	04aa                	slli	s1,s1,0xa
    80200cc6:	0164e4b3          	or	s1,s1,s6
    80200cca:	0014e493          	ori	s1,s1,1
    80200cce:	e104                	sd	s1,0(a0)
    if(a == last)
    80200cd0:	03390863          	beq	s2,s3,80200d00 <mappages+0x8a>
    a += PGSIZE;
    80200cd4:	995e                	add	s2,s2,s7
    if((pte = walk(pagetable, a, 1)) == NULL)
    80200cd6:	bfc9                	j	80200ca8 <mappages+0x32>
      panic("remap");
    80200cd8:	00009517          	auipc	a0,0x9
    80200cdc:	74050513          	addi	a0,a0,1856 # 8020a418 <digits+0x98>
    80200ce0:	fffff097          	auipc	ra,0xfffff
    80200ce4:	462080e7          	jalr	1122(ra) # 80200142 <panic>
      return -1;
    80200ce8:	557d                	li	a0,-1
    pa += PGSIZE;
  }
  return 0;
}
    80200cea:	60a6                	ld	ra,72(sp)
    80200cec:	6406                	ld	s0,64(sp)
    80200cee:	74e2                	ld	s1,56(sp)
    80200cf0:	7942                	ld	s2,48(sp)
    80200cf2:	79a2                	ld	s3,40(sp)
    80200cf4:	7a02                	ld	s4,32(sp)
    80200cf6:	6ae2                	ld	s5,24(sp)
    80200cf8:	6b42                	ld	s6,16(sp)
    80200cfa:	6ba2                	ld	s7,8(sp)
    80200cfc:	6161                	addi	sp,sp,80
    80200cfe:	8082                	ret
  return 0;
    80200d00:	4501                	li	a0,0
    80200d02:	b7e5                	j	80200cea <mappages+0x74>

0000000080200d04 <kvmmap>:
{
    80200d04:	1141                	addi	sp,sp,-16
    80200d06:	e406                	sd	ra,8(sp)
    80200d08:	e022                	sd	s0,0(sp)
    80200d0a:	0800                	addi	s0,sp,16
    80200d0c:	8736                	mv	a4,a3
  if(mappages(kernel_pagetable, va, sz, pa, perm) != 0)
    80200d0e:	86ae                	mv	a3,a1
    80200d10:	85aa                	mv	a1,a0
    80200d12:	00015517          	auipc	a0,0x15
    80200d16:	34653503          	ld	a0,838(a0) # 80216058 <kernel_pagetable>
    80200d1a:	00000097          	auipc	ra,0x0
    80200d1e:	f5c080e7          	jalr	-164(ra) # 80200c76 <mappages>
    80200d22:	e509                	bnez	a0,80200d2c <kvmmap+0x28>
}
    80200d24:	60a2                	ld	ra,8(sp)
    80200d26:	6402                	ld	s0,0(sp)
    80200d28:	0141                	addi	sp,sp,16
    80200d2a:	8082                	ret
    panic("kvmmap");
    80200d2c:	00009517          	auipc	a0,0x9
    80200d30:	6f450513          	addi	a0,a0,1780 # 8020a420 <digits+0xa0>
    80200d34:	fffff097          	auipc	ra,0xfffff
    80200d38:	40e080e7          	jalr	1038(ra) # 80200142 <panic>

0000000080200d3c <kvminit>:
{
    80200d3c:	1101                	addi	sp,sp,-32
    80200d3e:	ec06                	sd	ra,24(sp)
    80200d40:	e822                	sd	s0,16(sp)
    80200d42:	e426                	sd	s1,8(sp)
    80200d44:	1000                	addi	s0,sp,32
  kernel_pagetable = (pagetable_t) kalloc();
    80200d46:	00000097          	auipc	ra,0x0
    80200d4a:	816080e7          	jalr	-2026(ra) # 8020055c <kalloc>
    80200d4e:	00015797          	auipc	a5,0x15
    80200d52:	30a7b523          	sd	a0,778(a5) # 80216058 <kernel_pagetable>
  memset(kernel_pagetable, 0, PGSIZE);
    80200d56:	6605                	lui	a2,0x1
    80200d58:	4581                	li	a1,0
    80200d5a:	00000097          	auipc	ra,0x0
    80200d5e:	a0a080e7          	jalr	-1526(ra) # 80200764 <memset>
  kvmmap(UART_V, UART, PGSIZE, PTE_R | PTE_W);
    80200d62:	4699                	li	a3,6
    80200d64:	6605                	lui	a2,0x1
    80200d66:	100005b7          	lui	a1,0x10000
    80200d6a:	3f100513          	li	a0,1009
    80200d6e:	0572                	slli	a0,a0,0x1c
    80200d70:	00000097          	auipc	ra,0x0
    80200d74:	f94080e7          	jalr	-108(ra) # 80200d04 <kvmmap>
  kvmmap(VIRTIO0_V, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    80200d78:	4699                	li	a3,6
    80200d7a:	6605                	lui	a2,0x1
    80200d7c:	100015b7          	lui	a1,0x10001
    80200d80:	03f10537          	lui	a0,0x3f10
    80200d84:	0505                	addi	a0,a0,1
    80200d86:	0532                	slli	a0,a0,0xc
    80200d88:	00000097          	auipc	ra,0x0
    80200d8c:	f7c080e7          	jalr	-132(ra) # 80200d04 <kvmmap>
  kvmmap(CLINT_V, CLINT, 0x10000, PTE_R | PTE_W);
    80200d90:	4699                	li	a3,6
    80200d92:	6641                	lui	a2,0x10
    80200d94:	020005b7          	lui	a1,0x2000
    80200d98:	01f81537          	lui	a0,0x1f81
    80200d9c:	0536                	slli	a0,a0,0xd
    80200d9e:	00000097          	auipc	ra,0x0
    80200da2:	f66080e7          	jalr	-154(ra) # 80200d04 <kvmmap>
  kvmmap(PLIC_V, PLIC, 0x4000, PTE_R | PTE_W);
    80200da6:	4699                	li	a3,6
    80200da8:	6611                	lui	a2,0x4
    80200daa:	0c0005b7          	lui	a1,0xc000
    80200dae:	00fc3537          	lui	a0,0xfc3
    80200db2:	053a                	slli	a0,a0,0xe
    80200db4:	00000097          	auipc	ra,0x0
    80200db8:	f50080e7          	jalr	-176(ra) # 80200d04 <kvmmap>
  kvmmap(PLIC_V + 0x200000, PLIC + 0x200000, 0x4000, PTE_R | PTE_W);
    80200dbc:	4699                	li	a3,6
    80200dbe:	6611                	lui	a2,0x4
    80200dc0:	0c2005b7          	lui	a1,0xc200
    80200dc4:	1f861537          	lui	a0,0x1f861
    80200dc8:	0526                	slli	a0,a0,0x9
    80200dca:	00000097          	auipc	ra,0x0
    80200dce:	f3a080e7          	jalr	-198(ra) # 80200d04 <kvmmap>
  kvmmap(KERNBASE, KERNBASE, (uint64)etext - KERNBASE, PTE_R | PTE_X);
    80200dd2:	0000c497          	auipc	s1,0xc
    80200dd6:	3064b483          	ld	s1,774(s1) # 8020d0d8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80200dda:	46a9                	li	a3,10
    80200ddc:	bff00613          	li	a2,-1025
    80200de0:	0656                	slli	a2,a2,0x15
    80200de2:	9626                	add	a2,a2,s1
    80200de4:	40100593          	li	a1,1025
    80200de8:	05d6                	slli	a1,a1,0x15
    80200dea:	852e                	mv	a0,a1
    80200dec:	00000097          	auipc	ra,0x0
    80200df0:	f18080e7          	jalr	-232(ra) # 80200d04 <kvmmap>
  kvmmap((uint64)etext, (uint64)etext, PHYSTOP - (uint64)etext, PTE_R | PTE_W);
    80200df4:	4699                	li	a3,6
    80200df6:	40300613          	li	a2,1027
    80200dfa:	0656                	slli	a2,a2,0x15
    80200dfc:	8e05                	sub	a2,a2,s1
    80200dfe:	85a6                	mv	a1,s1
    80200e00:	8526                	mv	a0,s1
    80200e02:	00000097          	auipc	ra,0x0
    80200e06:	f02080e7          	jalr	-254(ra) # 80200d04 <kvmmap>
  kvmmap(TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80200e0a:	46a9                	li	a3,10
    80200e0c:	6605                	lui	a2,0x1
    80200e0e:	0000c597          	auipc	a1,0xc
    80200e12:	2aa5b583          	ld	a1,682(a1) # 8020d0b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80200e16:	04000537          	lui	a0,0x4000
    80200e1a:	157d                	addi	a0,a0,-1
    80200e1c:	0532                	slli	a0,a0,0xc
    80200e1e:	00000097          	auipc	ra,0x0
    80200e22:	ee6080e7          	jalr	-282(ra) # 80200d04 <kvmmap>
}
    80200e26:	60e2                	ld	ra,24(sp)
    80200e28:	6442                	ld	s0,16(sp)
    80200e2a:	64a2                	ld	s1,8(sp)
    80200e2c:	6105                	addi	sp,sp,32
    80200e2e:	8082                	ret

0000000080200e30 <vmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
vmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80200e30:	715d                	addi	sp,sp,-80
    80200e32:	e486                	sd	ra,72(sp)
    80200e34:	e0a2                	sd	s0,64(sp)
    80200e36:	fc26                	sd	s1,56(sp)
    80200e38:	f84a                	sd	s2,48(sp)
    80200e3a:	f44e                	sd	s3,40(sp)
    80200e3c:	f052                	sd	s4,32(sp)
    80200e3e:	ec56                	sd	s5,24(sp)
    80200e40:	e85a                	sd	s6,16(sp)
    80200e42:	e45e                	sd	s7,8(sp)
    80200e44:	0880                	addi	s0,sp,80
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80200e46:	03459793          	slli	a5,a1,0x34
    80200e4a:	e795                	bnez	a5,80200e76 <vmunmap+0x46>
    80200e4c:	8a2a                	mv	s4,a0
    80200e4e:	892e                	mv	s2,a1
    80200e50:	8ab6                	mv	s5,a3
    panic("vmunmap: not aligned");

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80200e52:	0632                	slli	a2,a2,0xc
    80200e54:	00b609b3          	add	s3,a2,a1
    if((pte = walk(pagetable, a, 0)) == 0)
      panic("vmunmap: walk");
    if((*pte & PTE_V) == 0)
      panic("vmunmap: not mapped");
    if(PTE_FLAGS(*pte) == PTE_V)
    80200e58:	4b85                	li	s7,1
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80200e5a:	6b05                	lui	s6,0x1
    80200e5c:	0735e863          	bltu	a1,s3,80200ecc <vmunmap+0x9c>
      uint64 pa = PTE2PA(*pte);
      kfree((void*)pa);
    }
    *pte = 0;
  }
}
    80200e60:	60a6                	ld	ra,72(sp)
    80200e62:	6406                	ld	s0,64(sp)
    80200e64:	74e2                	ld	s1,56(sp)
    80200e66:	7942                	ld	s2,48(sp)
    80200e68:	79a2                	ld	s3,40(sp)
    80200e6a:	7a02                	ld	s4,32(sp)
    80200e6c:	6ae2                	ld	s5,24(sp)
    80200e6e:	6b42                	ld	s6,16(sp)
    80200e70:	6ba2                	ld	s7,8(sp)
    80200e72:	6161                	addi	sp,sp,80
    80200e74:	8082                	ret
    panic("vmunmap: not aligned");
    80200e76:	00009517          	auipc	a0,0x9
    80200e7a:	5b250513          	addi	a0,a0,1458 # 8020a428 <digits+0xa8>
    80200e7e:	fffff097          	auipc	ra,0xfffff
    80200e82:	2c4080e7          	jalr	708(ra) # 80200142 <panic>
      panic("vmunmap: walk");
    80200e86:	00009517          	auipc	a0,0x9
    80200e8a:	5ba50513          	addi	a0,a0,1466 # 8020a440 <digits+0xc0>
    80200e8e:	fffff097          	auipc	ra,0xfffff
    80200e92:	2b4080e7          	jalr	692(ra) # 80200142 <panic>
      panic("vmunmap: not mapped");
    80200e96:	00009517          	auipc	a0,0x9
    80200e9a:	5ba50513          	addi	a0,a0,1466 # 8020a450 <digits+0xd0>
    80200e9e:	fffff097          	auipc	ra,0xfffff
    80200ea2:	2a4080e7          	jalr	676(ra) # 80200142 <panic>
      panic("vmunmap: not a leaf");
    80200ea6:	00009517          	auipc	a0,0x9
    80200eaa:	5c250513          	addi	a0,a0,1474 # 8020a468 <digits+0xe8>
    80200eae:	fffff097          	auipc	ra,0xfffff
    80200eb2:	294080e7          	jalr	660(ra) # 80200142 <panic>
      uint64 pa = PTE2PA(*pte);
    80200eb6:	8129                	srli	a0,a0,0xa
      kfree((void*)pa);
    80200eb8:	0532                	slli	a0,a0,0xc
    80200eba:	fffff097          	auipc	ra,0xfffff
    80200ebe:	58a080e7          	jalr	1418(ra) # 80200444 <kfree>
    *pte = 0;
    80200ec2:	0004b023          	sd	zero,0(s1)
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80200ec6:	995a                	add	s2,s2,s6
    80200ec8:	f9397ce3          	bgeu	s2,s3,80200e60 <vmunmap+0x30>
    if((pte = walk(pagetable, a, 0)) == 0)
    80200ecc:	4601                	li	a2,0
    80200ece:	85ca                	mv	a1,s2
    80200ed0:	8552                	mv	a0,s4
    80200ed2:	00000097          	auipc	ra,0x0
    80200ed6:	c44080e7          	jalr	-956(ra) # 80200b16 <walk>
    80200eda:	84aa                	mv	s1,a0
    80200edc:	d54d                	beqz	a0,80200e86 <vmunmap+0x56>
    if((*pte & PTE_V) == 0)
    80200ede:	6108                	ld	a0,0(a0)
    80200ee0:	00157793          	andi	a5,a0,1
    80200ee4:	dbcd                	beqz	a5,80200e96 <vmunmap+0x66>
    if(PTE_FLAGS(*pte) == PTE_V)
    80200ee6:	3ff57793          	andi	a5,a0,1023
    80200eea:	fb778ee3          	beq	a5,s7,80200ea6 <vmunmap+0x76>
    if(do_free){
    80200eee:	fc0a8ae3          	beqz	s5,80200ec2 <vmunmap+0x92>
    80200ef2:	b7d1                	j	80200eb6 <vmunmap+0x86>

0000000080200ef4 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80200ef4:	1101                	addi	sp,sp,-32
    80200ef6:	ec06                	sd	ra,24(sp)
    80200ef8:	e822                	sd	s0,16(sp)
    80200efa:	e426                	sd	s1,8(sp)
    80200efc:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80200efe:	fffff097          	auipc	ra,0xfffff
    80200f02:	65e080e7          	jalr	1630(ra) # 8020055c <kalloc>
    80200f06:	84aa                	mv	s1,a0
  if(pagetable == NULL)
    80200f08:	c519                	beqz	a0,80200f16 <uvmcreate+0x22>
    return NULL;
  memset(pagetable, 0, PGSIZE);
    80200f0a:	6605                	lui	a2,0x1
    80200f0c:	4581                	li	a1,0
    80200f0e:	00000097          	auipc	ra,0x0
    80200f12:	856080e7          	jalr	-1962(ra) # 80200764 <memset>
  return pagetable;
}
    80200f16:	8526                	mv	a0,s1
    80200f18:	60e2                	ld	ra,24(sp)
    80200f1a:	6442                	ld	s0,16(sp)
    80200f1c:	64a2                	ld	s1,8(sp)
    80200f1e:	6105                	addi	sp,sp,32
    80200f20:	8082                	ret

0000000080200f22 <uvminit>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvminit(pagetable_t pagetable, pagetable_t kpagetable, uchar *src, uint sz)
{
    80200f22:	7139                	addi	sp,sp,-64
    80200f24:	fc06                	sd	ra,56(sp)
    80200f26:	f822                	sd	s0,48(sp)
    80200f28:	f426                	sd	s1,40(sp)
    80200f2a:	f04a                	sd	s2,32(sp)
    80200f2c:	ec4e                	sd	s3,24(sp)
    80200f2e:	e852                	sd	s4,16(sp)
    80200f30:	e456                	sd	s5,8(sp)
    80200f32:	0080                	addi	s0,sp,64
  char *mem;

  if(sz >= PGSIZE)
    80200f34:	6785                	lui	a5,0x1
    80200f36:	06f6f363          	bgeu	a3,a5,80200f9c <uvminit+0x7a>
    80200f3a:	8aaa                	mv	s5,a0
    80200f3c:	8a2e                	mv	s4,a1
    80200f3e:	89b2                	mv	s3,a2
    80200f40:	8936                	mv	s2,a3
    panic("inituvm: more than a page");
  mem = kalloc();
    80200f42:	fffff097          	auipc	ra,0xfffff
    80200f46:	61a080e7          	jalr	1562(ra) # 8020055c <kalloc>
    80200f4a:	84aa                	mv	s1,a0
  // printf("[uvminit]kalloc: %p\n", mem);
  memset(mem, 0, PGSIZE);
    80200f4c:	6605                	lui	a2,0x1
    80200f4e:	4581                	li	a1,0
    80200f50:	00000097          	auipc	ra,0x0
    80200f54:	814080e7          	jalr	-2028(ra) # 80200764 <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    80200f58:	4779                	li	a4,30
    80200f5a:	86a6                	mv	a3,s1
    80200f5c:	6605                	lui	a2,0x1
    80200f5e:	4581                	li	a1,0
    80200f60:	8556                	mv	a0,s5
    80200f62:	00000097          	auipc	ra,0x0
    80200f66:	d14080e7          	jalr	-748(ra) # 80200c76 <mappages>
  mappages(kpagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X);
    80200f6a:	4739                	li	a4,14
    80200f6c:	86a6                	mv	a3,s1
    80200f6e:	6605                	lui	a2,0x1
    80200f70:	4581                	li	a1,0
    80200f72:	8552                	mv	a0,s4
    80200f74:	00000097          	auipc	ra,0x0
    80200f78:	d02080e7          	jalr	-766(ra) # 80200c76 <mappages>
  memmove(mem, src, sz);
    80200f7c:	864a                	mv	a2,s2
    80200f7e:	85ce                	mv	a1,s3
    80200f80:	8526                	mv	a0,s1
    80200f82:	00000097          	auipc	ra,0x0
    80200f86:	842080e7          	jalr	-1982(ra) # 802007c4 <memmove>
  // for (int i = 0; i < sz; i ++) {
  //   printf("[uvminit]mem: %p, %x\n", mem + i, mem[i]);
  // }
}
    80200f8a:	70e2                	ld	ra,56(sp)
    80200f8c:	7442                	ld	s0,48(sp)
    80200f8e:	74a2                	ld	s1,40(sp)
    80200f90:	7902                	ld	s2,32(sp)
    80200f92:	69e2                	ld	s3,24(sp)
    80200f94:	6a42                	ld	s4,16(sp)
    80200f96:	6aa2                	ld	s5,8(sp)
    80200f98:	6121                	addi	sp,sp,64
    80200f9a:	8082                	ret
    panic("inituvm: more than a page");
    80200f9c:	00009517          	auipc	a0,0x9
    80200fa0:	4e450513          	addi	a0,a0,1252 # 8020a480 <digits+0x100>
    80200fa4:	fffff097          	auipc	ra,0xfffff
    80200fa8:	19e080e7          	jalr	414(ra) # 80200142 <panic>

0000000080200fac <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, pagetable_t kpagetable, uint64 oldsz, uint64 newsz)
{
    80200fac:	7179                	addi	sp,sp,-48
    80200fae:	f406                	sd	ra,40(sp)
    80200fb0:	f022                	sd	s0,32(sp)
    80200fb2:	ec26                	sd	s1,24(sp)
    80200fb4:	e84a                	sd	s2,16(sp)
    80200fb6:	e44e                	sd	s3,8(sp)
    80200fb8:	e052                	sd	s4,0(sp)
    80200fba:	1800                	addi	s0,sp,48
  if(newsz >= oldsz)
    return oldsz;
    80200fbc:	8932                	mv	s2,a2
  if(newsz >= oldsz)
    80200fbe:	02c6f063          	bgeu	a3,a2,80200fde <uvmdealloc+0x32>
    80200fc2:	89aa                	mv	s3,a0
    80200fc4:	852e                	mv	a0,a1
    80200fc6:	8936                	mv	s2,a3

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    80200fc8:	6785                	lui	a5,0x1
    80200fca:	17fd                	addi	a5,a5,-1
    80200fcc:	00f68a33          	add	s4,a3,a5
    80200fd0:	777d                	lui	a4,0xfffff
    80200fd2:	00ea7a33          	and	s4,s4,a4
    80200fd6:	963e                	add	a2,a2,a5
    80200fd8:	8e79                	and	a2,a2,a4
    80200fda:	00ca6b63          	bltu	s4,a2,80200ff0 <uvmdealloc+0x44>
    vmunmap(kpagetable, PGROUNDUP(newsz), npages, 0);
    vmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
  }

  return newsz;
}
    80200fde:	854a                	mv	a0,s2
    80200fe0:	70a2                	ld	ra,40(sp)
    80200fe2:	7402                	ld	s0,32(sp)
    80200fe4:	64e2                	ld	s1,24(sp)
    80200fe6:	6942                	ld	s2,16(sp)
    80200fe8:	69a2                	ld	s3,8(sp)
    80200fea:	6a02                	ld	s4,0(sp)
    80200fec:	6145                	addi	sp,sp,48
    80200fee:	8082                	ret
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    80200ff0:	414604b3          	sub	s1,a2,s4
    80200ff4:	80b1                	srli	s1,s1,0xc
    vmunmap(kpagetable, PGROUNDUP(newsz), npages, 0);
    80200ff6:	2481                	sext.w	s1,s1
    80200ff8:	4681                	li	a3,0
    80200ffa:	8626                	mv	a2,s1
    80200ffc:	85d2                	mv	a1,s4
    80200ffe:	00000097          	auipc	ra,0x0
    80201002:	e32080e7          	jalr	-462(ra) # 80200e30 <vmunmap>
    vmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    80201006:	4685                	li	a3,1
    80201008:	8626                	mv	a2,s1
    8020100a:	85d2                	mv	a1,s4
    8020100c:	854e                	mv	a0,s3
    8020100e:	00000097          	auipc	ra,0x0
    80201012:	e22080e7          	jalr	-478(ra) # 80200e30 <vmunmap>
    80201016:	b7e1                	j	80200fde <uvmdealloc+0x32>

0000000080201018 <uvmalloc>:
  if(newsz < oldsz)
    80201018:	0ec6e763          	bltu	a3,a2,80201106 <uvmalloc+0xee>
{
    8020101c:	7139                	addi	sp,sp,-64
    8020101e:	fc06                	sd	ra,56(sp)
    80201020:	f822                	sd	s0,48(sp)
    80201022:	f426                	sd	s1,40(sp)
    80201024:	f04a                	sd	s2,32(sp)
    80201026:	ec4e                	sd	s3,24(sp)
    80201028:	e852                	sd	s4,16(sp)
    8020102a:	e456                	sd	s5,8(sp)
    8020102c:	e05a                	sd	s6,0(sp)
    8020102e:	0080                	addi	s0,sp,64
    80201030:	8a2a                	mv	s4,a0
    80201032:	8aae                	mv	s5,a1
    80201034:	8b36                	mv	s6,a3
  oldsz = PGROUNDUP(oldsz);
    80201036:	6985                	lui	s3,0x1
    80201038:	19fd                	addi	s3,s3,-1
    8020103a:	964e                	add	a2,a2,s3
    8020103c:	79fd                	lui	s3,0xfffff
    8020103e:	013679b3          	and	s3,a2,s3
  for(a = oldsz; a < newsz; a += PGSIZE){
    80201042:	0cd9f463          	bgeu	s3,a3,8020110a <uvmalloc+0xf2>
    80201046:	894e                	mv	s2,s3
    mem = kalloc();
    80201048:	fffff097          	auipc	ra,0xfffff
    8020104c:	514080e7          	jalr	1300(ra) # 8020055c <kalloc>
    80201050:	84aa                	mv	s1,a0
    if(mem == NULL){
    80201052:	c129                	beqz	a0,80201094 <uvmalloc+0x7c>
    memset(mem, 0, PGSIZE);
    80201054:	6605                	lui	a2,0x1
    80201056:	4581                	li	a1,0
    80201058:	fffff097          	auipc	ra,0xfffff
    8020105c:	70c080e7          	jalr	1804(ra) # 80200764 <memset>
    if (mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0) {
    80201060:	4779                	li	a4,30
    80201062:	86a6                	mv	a3,s1
    80201064:	6605                	lui	a2,0x1
    80201066:	85ca                	mv	a1,s2
    80201068:	8552                	mv	a0,s4
    8020106a:	00000097          	auipc	ra,0x0
    8020106e:	c0c080e7          	jalr	-1012(ra) # 80200c76 <mappages>
    80201072:	e521                	bnez	a0,802010ba <uvmalloc+0xa2>
    if (mappages(kpagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R) != 0){
    80201074:	4739                	li	a4,14
    80201076:	86a6                	mv	a3,s1
    80201078:	6605                	lui	a2,0x1
    8020107a:	85ca                	mv	a1,s2
    8020107c:	8556                	mv	a0,s5
    8020107e:	00000097          	auipc	ra,0x0
    80201082:	bf8080e7          	jalr	-1032(ra) # 80200c76 <mappages>
    80201086:	e929                	bnez	a0,802010d8 <uvmalloc+0xc0>
  for(a = oldsz; a < newsz; a += PGSIZE){
    80201088:	6785                	lui	a5,0x1
    8020108a:	993e                	add	s2,s2,a5
    8020108c:	fb696ee3          	bltu	s2,s6,80201048 <uvmalloc+0x30>
  return newsz;
    80201090:	855a                	mv	a0,s6
    80201092:	a811                	j	802010a6 <uvmalloc+0x8e>
      uvmdealloc(pagetable, kpagetable, a, oldsz);
    80201094:	86ce                	mv	a3,s3
    80201096:	864a                	mv	a2,s2
    80201098:	85d6                	mv	a1,s5
    8020109a:	8552                	mv	a0,s4
    8020109c:	00000097          	auipc	ra,0x0
    802010a0:	f10080e7          	jalr	-240(ra) # 80200fac <uvmdealloc>
      return 0;
    802010a4:	4501                	li	a0,0
}
    802010a6:	70e2                	ld	ra,56(sp)
    802010a8:	7442                	ld	s0,48(sp)
    802010aa:	74a2                	ld	s1,40(sp)
    802010ac:	7902                	ld	s2,32(sp)
    802010ae:	69e2                	ld	s3,24(sp)
    802010b0:	6a42                	ld	s4,16(sp)
    802010b2:	6aa2                	ld	s5,8(sp)
    802010b4:	6b02                	ld	s6,0(sp)
    802010b6:	6121                	addi	sp,sp,64
    802010b8:	8082                	ret
      kfree(mem);
    802010ba:	8526                	mv	a0,s1
    802010bc:	fffff097          	auipc	ra,0xfffff
    802010c0:	388080e7          	jalr	904(ra) # 80200444 <kfree>
      uvmdealloc(pagetable, kpagetable, a, oldsz);
    802010c4:	86ce                	mv	a3,s3
    802010c6:	864a                	mv	a2,s2
    802010c8:	85d6                	mv	a1,s5
    802010ca:	8552                	mv	a0,s4
    802010cc:	00000097          	auipc	ra,0x0
    802010d0:	ee0080e7          	jalr	-288(ra) # 80200fac <uvmdealloc>
      return 0;
    802010d4:	4501                	li	a0,0
    802010d6:	bfc1                	j	802010a6 <uvmalloc+0x8e>
      int npages = (a - oldsz) / PGSIZE;
    802010d8:	41390633          	sub	a2,s2,s3
    802010dc:	8231                	srli	a2,a2,0xc
    802010de:	0006049b          	sext.w	s1,a2
      vmunmap(pagetable, oldsz, npages + 1, 1);   // plus the page allocated above.
    802010e2:	4685                	li	a3,1
    802010e4:	2605                	addiw	a2,a2,1
    802010e6:	85ce                	mv	a1,s3
    802010e8:	8552                	mv	a0,s4
    802010ea:	00000097          	auipc	ra,0x0
    802010ee:	d46080e7          	jalr	-698(ra) # 80200e30 <vmunmap>
      vmunmap(kpagetable, oldsz, npages, 0);
    802010f2:	4681                	li	a3,0
    802010f4:	8626                	mv	a2,s1
    802010f6:	85ce                	mv	a1,s3
    802010f8:	8556                	mv	a0,s5
    802010fa:	00000097          	auipc	ra,0x0
    802010fe:	d36080e7          	jalr	-714(ra) # 80200e30 <vmunmap>
      return 0;
    80201102:	4501                	li	a0,0
    80201104:	b74d                	j	802010a6 <uvmalloc+0x8e>
    return oldsz;
    80201106:	8532                	mv	a0,a2
}
    80201108:	8082                	ret
  return newsz;
    8020110a:	8536                	mv	a0,a3
    8020110c:	bf69                	j	802010a6 <uvmalloc+0x8e>

000000008020110e <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    8020110e:	7179                	addi	sp,sp,-48
    80201110:	f406                	sd	ra,40(sp)
    80201112:	f022                	sd	s0,32(sp)
    80201114:	ec26                	sd	s1,24(sp)
    80201116:	e84a                	sd	s2,16(sp)
    80201118:	e44e                	sd	s3,8(sp)
    8020111a:	e052                	sd	s4,0(sp)
    8020111c:	1800                	addi	s0,sp,48
    8020111e:	8a2a                	mv	s4,a0
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    80201120:	84aa                	mv	s1,a0
    80201122:	6905                	lui	s2,0x1
    80201124:	992a                	add	s2,s2,a0
    pte_t pte = pagetable[i];
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    80201126:	4985                	li	s3,1
    80201128:	a821                	j	80201140 <freewalk+0x32>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    8020112a:	8129                	srli	a0,a0,0xa
      freewalk((pagetable_t)child);
    8020112c:	0532                	slli	a0,a0,0xc
    8020112e:	00000097          	auipc	ra,0x0
    80201132:	fe0080e7          	jalr	-32(ra) # 8020110e <freewalk>
      pagetable[i] = 0;
    80201136:	0004b023          	sd	zero,0(s1)
  for(int i = 0; i < 512; i++){
    8020113a:	04a1                	addi	s1,s1,8
    8020113c:	03248163          	beq	s1,s2,8020115e <freewalk+0x50>
    pte_t pte = pagetable[i];
    80201140:	6088                	ld	a0,0(s1)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    80201142:	00f57793          	andi	a5,a0,15
    80201146:	ff3782e3          	beq	a5,s3,8020112a <freewalk+0x1c>
    } else if(pte & PTE_V){
    8020114a:	8905                	andi	a0,a0,1
    8020114c:	d57d                	beqz	a0,8020113a <freewalk+0x2c>
      panic("freewalk: leaf");
    8020114e:	00009517          	auipc	a0,0x9
    80201152:	35250513          	addi	a0,a0,850 # 8020a4a0 <digits+0x120>
    80201156:	fffff097          	auipc	ra,0xfffff
    8020115a:	fec080e7          	jalr	-20(ra) # 80200142 <panic>
    }
  }
  kfree((void*)pagetable);
    8020115e:	8552                	mv	a0,s4
    80201160:	fffff097          	auipc	ra,0xfffff
    80201164:	2e4080e7          	jalr	740(ra) # 80200444 <kfree>
}
    80201168:	70a2                	ld	ra,40(sp)
    8020116a:	7402                	ld	s0,32(sp)
    8020116c:	64e2                	ld	s1,24(sp)
    8020116e:	6942                	ld	s2,16(sp)
    80201170:	69a2                	ld	s3,8(sp)
    80201172:	6a02                	ld	s4,0(sp)
    80201174:	6145                	addi	sp,sp,48
    80201176:	8082                	ret

0000000080201178 <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    80201178:	1101                	addi	sp,sp,-32
    8020117a:	ec06                	sd	ra,24(sp)
    8020117c:	e822                	sd	s0,16(sp)
    8020117e:	e426                	sd	s1,8(sp)
    80201180:	1000                	addi	s0,sp,32
    80201182:	84aa                	mv	s1,a0
  if(sz > 0)
    80201184:	e999                	bnez	a1,8020119a <uvmfree+0x22>
    vmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
  freewalk(pagetable);
    80201186:	8526                	mv	a0,s1
    80201188:	00000097          	auipc	ra,0x0
    8020118c:	f86080e7          	jalr	-122(ra) # 8020110e <freewalk>
}
    80201190:	60e2                	ld	ra,24(sp)
    80201192:	6442                	ld	s0,16(sp)
    80201194:	64a2                	ld	s1,8(sp)
    80201196:	6105                	addi	sp,sp,32
    80201198:	8082                	ret
    vmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    8020119a:	6605                	lui	a2,0x1
    8020119c:	167d                	addi	a2,a2,-1
    8020119e:	962e                	add	a2,a2,a1
    802011a0:	4685                	li	a3,1
    802011a2:	8231                	srli	a2,a2,0xc
    802011a4:	4581                	li	a1,0
    802011a6:	00000097          	auipc	ra,0x0
    802011aa:	c8a080e7          	jalr	-886(ra) # 80200e30 <vmunmap>
    802011ae:	bfe1                	j	80201186 <uvmfree+0xe>

00000000802011b0 <uvmcopy>:
  pte_t *pte;
  uint64 pa, i = 0, ki = 0;
  uint flags;
  char *mem;

  while (i < sz){
    802011b0:	10068563          	beqz	a3,802012ba <uvmcopy+0x10a>
{
    802011b4:	715d                	addi	sp,sp,-80
    802011b6:	e486                	sd	ra,72(sp)
    802011b8:	e0a2                	sd	s0,64(sp)
    802011ba:	fc26                	sd	s1,56(sp)
    802011bc:	f84a                	sd	s2,48(sp)
    802011be:	f44e                	sd	s3,40(sp)
    802011c0:	f052                	sd	s4,32(sp)
    802011c2:	ec56                	sd	s5,24(sp)
    802011c4:	e85a                	sd	s6,16(sp)
    802011c6:	e45e                	sd	s7,8(sp)
    802011c8:	e062                	sd	s8,0(sp)
    802011ca:	0880                	addi	s0,sp,80
    802011cc:	8baa                	mv	s7,a0
    802011ce:	8a2e                	mv	s4,a1
    802011d0:	8b32                	mv	s6,a2
    802011d2:	8ab6                	mv	s5,a3
  uint64 pa, i = 0, ki = 0;
    802011d4:	4981                	li	s3,0
    802011d6:	a011                	j	802011da <uvmcopy+0x2a>
    memmove(mem, (char*)pa, PGSIZE);
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0) {
      kfree(mem);
      goto err;
    }
    i += PGSIZE;
    802011d8:	89e2                	mv	s3,s8
    if((pte = walk(old, i, 0)) == NULL)
    802011da:	4601                	li	a2,0
    802011dc:	85ce                	mv	a1,s3
    802011de:	855e                	mv	a0,s7
    802011e0:	00000097          	auipc	ra,0x0
    802011e4:	936080e7          	jalr	-1738(ra) # 80200b16 <walk>
    802011e8:	c135                	beqz	a0,8020124c <uvmcopy+0x9c>
    if((*pte & PTE_V) == 0)
    802011ea:	6118                	ld	a4,0(a0)
    802011ec:	00177793          	andi	a5,a4,1
    802011f0:	c7b5                	beqz	a5,8020125c <uvmcopy+0xac>
    pa = PTE2PA(*pte);
    802011f2:	00a75593          	srli	a1,a4,0xa
    802011f6:	00c59c13          	slli	s8,a1,0xc
    flags = PTE_FLAGS(*pte);
    802011fa:	3ff77493          	andi	s1,a4,1023
    if((mem = kalloc()) == NULL)
    802011fe:	fffff097          	auipc	ra,0xfffff
    80201202:	35e080e7          	jalr	862(ra) # 8020055c <kalloc>
    80201206:	892a                	mv	s2,a0
    80201208:	c92d                	beqz	a0,8020127a <uvmcopy+0xca>
    memmove(mem, (char*)pa, PGSIZE);
    8020120a:	6605                	lui	a2,0x1
    8020120c:	85e2                	mv	a1,s8
    8020120e:	fffff097          	auipc	ra,0xfffff
    80201212:	5b6080e7          	jalr	1462(ra) # 802007c4 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0) {
    80201216:	2481                	sext.w	s1,s1
    80201218:	8726                	mv	a4,s1
    8020121a:	86ca                	mv	a3,s2
    8020121c:	6605                	lui	a2,0x1
    8020121e:	85ce                	mv	a1,s3
    80201220:	8552                	mv	a0,s4
    80201222:	00000097          	auipc	ra,0x0
    80201226:	a54080e7          	jalr	-1452(ra) # 80200c76 <mappages>
    8020122a:	e129                	bnez	a0,8020126c <uvmcopy+0xbc>
    i += PGSIZE;
    8020122c:	6c05                	lui	s8,0x1
    8020122e:	9c4e                	add	s8,s8,s3
    if(mappages(knew, ki, PGSIZE, (uint64)mem, flags & ~PTE_U) != 0){
    80201230:	3ef4f713          	andi	a4,s1,1007
    80201234:	86ca                	mv	a3,s2
    80201236:	6605                	lui	a2,0x1
    80201238:	85ce                	mv	a1,s3
    8020123a:	855a                	mv	a0,s6
    8020123c:	00000097          	auipc	ra,0x0
    80201240:	a3a080e7          	jalr	-1478(ra) # 80200c76 <mappages>
    80201244:	ed05                	bnez	a0,8020127c <uvmcopy+0xcc>
  while (i < sz){
    80201246:	f95c69e3          	bltu	s8,s5,802011d8 <uvmcopy+0x28>
    8020124a:	a8a1                	j	802012a2 <uvmcopy+0xf2>
      panic("uvmcopy: pte should exist");
    8020124c:	00009517          	auipc	a0,0x9
    80201250:	26450513          	addi	a0,a0,612 # 8020a4b0 <digits+0x130>
    80201254:	fffff097          	auipc	ra,0xfffff
    80201258:	eee080e7          	jalr	-274(ra) # 80200142 <panic>
      panic("uvmcopy: page not present");
    8020125c:	00009517          	auipc	a0,0x9
    80201260:	27450513          	addi	a0,a0,628 # 8020a4d0 <digits+0x150>
    80201264:	fffff097          	auipc	ra,0xfffff
    80201268:	ede080e7          	jalr	-290(ra) # 80200142 <panic>
      kfree(mem);
    8020126c:	854a                	mv	a0,s2
    8020126e:	fffff097          	auipc	ra,0xfffff
    80201272:	1d6080e7          	jalr	470(ra) # 80200444 <kfree>
      goto err;
    80201276:	8c4e                	mv	s8,s3
    80201278:	a011                	j	8020127c <uvmcopy+0xcc>
    8020127a:	8c4e                	mv	s8,s3
    ki += PGSIZE;
  }
  return 0;

 err:
  vmunmap(knew, 0, ki / PGSIZE, 0);
    8020127c:	4681                	li	a3,0
    8020127e:	00c9d613          	srli	a2,s3,0xc
    80201282:	4581                	li	a1,0
    80201284:	855a                	mv	a0,s6
    80201286:	00000097          	auipc	ra,0x0
    8020128a:	baa080e7          	jalr	-1110(ra) # 80200e30 <vmunmap>
  vmunmap(new, 0, i / PGSIZE, 1);
    8020128e:	4685                	li	a3,1
    80201290:	00cc5613          	srli	a2,s8,0xc
    80201294:	4581                	li	a1,0
    80201296:	8552                	mv	a0,s4
    80201298:	00000097          	auipc	ra,0x0
    8020129c:	b98080e7          	jalr	-1128(ra) # 80200e30 <vmunmap>
  return -1;
    802012a0:	557d                	li	a0,-1
}
    802012a2:	60a6                	ld	ra,72(sp)
    802012a4:	6406                	ld	s0,64(sp)
    802012a6:	74e2                	ld	s1,56(sp)
    802012a8:	7942                	ld	s2,48(sp)
    802012aa:	79a2                	ld	s3,40(sp)
    802012ac:	7a02                	ld	s4,32(sp)
    802012ae:	6ae2                	ld	s5,24(sp)
    802012b0:	6b42                	ld	s6,16(sp)
    802012b2:	6ba2                	ld	s7,8(sp)
    802012b4:	6c02                	ld	s8,0(sp)
    802012b6:	6161                	addi	sp,sp,80
    802012b8:	8082                	ret
  return 0;
    802012ba:	4501                	li	a0,0
}
    802012bc:	8082                	ret

00000000802012be <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    802012be:	1141                	addi	sp,sp,-16
    802012c0:	e406                	sd	ra,8(sp)
    802012c2:	e022                	sd	s0,0(sp)
    802012c4:	0800                	addi	s0,sp,16
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    802012c6:	4601                	li	a2,0
    802012c8:	00000097          	auipc	ra,0x0
    802012cc:	84e080e7          	jalr	-1970(ra) # 80200b16 <walk>
  if(pte == NULL)
    802012d0:	c901                	beqz	a0,802012e0 <uvmclear+0x22>
    panic("uvmclear");
  *pte &= ~PTE_U;
    802012d2:	611c                	ld	a5,0(a0)
    802012d4:	9bbd                	andi	a5,a5,-17
    802012d6:	e11c                	sd	a5,0(a0)
}
    802012d8:	60a2                	ld	ra,8(sp)
    802012da:	6402                	ld	s0,0(sp)
    802012dc:	0141                	addi	sp,sp,16
    802012de:	8082                	ret
    panic("uvmclear");
    802012e0:	00009517          	auipc	a0,0x9
    802012e4:	21050513          	addi	a0,a0,528 # 8020a4f0 <digits+0x170>
    802012e8:	fffff097          	auipc	ra,0xfffff
    802012ec:	e5a080e7          	jalr	-422(ra) # 80200142 <panic>

00000000802012f0 <copyout>:
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
  uint64 n, va0, pa0;

  while(len > 0){
    802012f0:	c6bd                	beqz	a3,8020135e <copyout+0x6e>
{
    802012f2:	715d                	addi	sp,sp,-80
    802012f4:	e486                	sd	ra,72(sp)
    802012f6:	e0a2                	sd	s0,64(sp)
    802012f8:	fc26                	sd	s1,56(sp)
    802012fa:	f84a                	sd	s2,48(sp)
    802012fc:	f44e                	sd	s3,40(sp)
    802012fe:	f052                	sd	s4,32(sp)
    80201300:	ec56                	sd	s5,24(sp)
    80201302:	e85a                	sd	s6,16(sp)
    80201304:	e45e                	sd	s7,8(sp)
    80201306:	e062                	sd	s8,0(sp)
    80201308:	0880                	addi	s0,sp,80
    8020130a:	8b2a                	mv	s6,a0
    8020130c:	8c2e                	mv	s8,a1
    8020130e:	8a32                	mv	s4,a2
    80201310:	89b6                	mv	s3,a3
    va0 = PGROUNDDOWN(dstva);
    80201312:	7bfd                	lui	s7,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (dstva - va0);
    80201314:	6a85                	lui	s5,0x1
    80201316:	a015                	j	8020133a <copyout+0x4a>
    if(n > len)
      n = len;
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    80201318:	9562                	add	a0,a0,s8
    8020131a:	0004861b          	sext.w	a2,s1
    8020131e:	85d2                	mv	a1,s4
    80201320:	41250533          	sub	a0,a0,s2
    80201324:	fffff097          	auipc	ra,0xfffff
    80201328:	4a0080e7          	jalr	1184(ra) # 802007c4 <memmove>

    len -= n;
    8020132c:	409989b3          	sub	s3,s3,s1
    src += n;
    80201330:	9a26                	add	s4,s4,s1
    dstva = va0 + PGSIZE;
    80201332:	01590c33          	add	s8,s2,s5
  while(len > 0){
    80201336:	02098263          	beqz	s3,8020135a <copyout+0x6a>
    va0 = PGROUNDDOWN(dstva);
    8020133a:	017c7933          	and	s2,s8,s7
    pa0 = walkaddr(pagetable, va0);
    8020133e:	85ca                	mv	a1,s2
    80201340:	855a                	mv	a0,s6
    80201342:	00000097          	auipc	ra,0x0
    80201346:	87a080e7          	jalr	-1926(ra) # 80200bbc <walkaddr>
    if(pa0 == NULL)
    8020134a:	cd01                	beqz	a0,80201362 <copyout+0x72>
    n = PGSIZE - (dstva - va0);
    8020134c:	418904b3          	sub	s1,s2,s8
    80201350:	94d6                	add	s1,s1,s5
    if(n > len)
    80201352:	fc99f3e3          	bgeu	s3,s1,80201318 <copyout+0x28>
    80201356:	84ce                	mv	s1,s3
    80201358:	b7c1                	j	80201318 <copyout+0x28>
  }
  return 0;
    8020135a:	4501                	li	a0,0
    8020135c:	a021                	j	80201364 <copyout+0x74>
    8020135e:	4501                	li	a0,0
}
    80201360:	8082                	ret
      return -1;
    80201362:	557d                	li	a0,-1
}
    80201364:	60a6                	ld	ra,72(sp)
    80201366:	6406                	ld	s0,64(sp)
    80201368:	74e2                	ld	s1,56(sp)
    8020136a:	7942                	ld	s2,48(sp)
    8020136c:	79a2                	ld	s3,40(sp)
    8020136e:	7a02                	ld	s4,32(sp)
    80201370:	6ae2                	ld	s5,24(sp)
    80201372:	6b42                	ld	s6,16(sp)
    80201374:	6ba2                	ld	s7,8(sp)
    80201376:	6c02                	ld	s8,0(sp)
    80201378:	6161                	addi	sp,sp,80
    8020137a:	8082                	ret

000000008020137c <copyout2>:

int
copyout2(uint64 dstva, char *src, uint64 len)
{
    8020137c:	7179                	addi	sp,sp,-48
    8020137e:	f406                	sd	ra,40(sp)
    80201380:	f022                	sd	s0,32(sp)
    80201382:	ec26                	sd	s1,24(sp)
    80201384:	e84a                	sd	s2,16(sp)
    80201386:	e44e                	sd	s3,8(sp)
    80201388:	1800                	addi	s0,sp,48
    8020138a:	84aa                	mv	s1,a0
    8020138c:	89ae                	mv	s3,a1
    8020138e:	8932                	mv	s2,a2
  uint64 sz = myproc()->sz;
    80201390:	00000097          	auipc	ra,0x0
    80201394:	6c8080e7          	jalr	1736(ra) # 80201a58 <myproc>
    80201398:	653c                	ld	a5,72(a0)
  if (dstva + len > sz || dstva >= sz) {
    8020139a:	01248733          	add	a4,s1,s2
    8020139e:	02e7e463          	bltu	a5,a4,802013c6 <copyout2+0x4a>
    802013a2:	02f4f463          	bgeu	s1,a5,802013ca <copyout2+0x4e>
    return -1;
  }
  memmove((void *)dstva, src, len);
    802013a6:	0009061b          	sext.w	a2,s2
    802013aa:	85ce                	mv	a1,s3
    802013ac:	8526                	mv	a0,s1
    802013ae:	fffff097          	auipc	ra,0xfffff
    802013b2:	416080e7          	jalr	1046(ra) # 802007c4 <memmove>
  return 0;
    802013b6:	4501                	li	a0,0
}
    802013b8:	70a2                	ld	ra,40(sp)
    802013ba:	7402                	ld	s0,32(sp)
    802013bc:	64e2                	ld	s1,24(sp)
    802013be:	6942                	ld	s2,16(sp)
    802013c0:	69a2                	ld	s3,8(sp)
    802013c2:	6145                	addi	sp,sp,48
    802013c4:	8082                	ret
    return -1;
    802013c6:	557d                	li	a0,-1
    802013c8:	bfc5                	j	802013b8 <copyout2+0x3c>
    802013ca:	557d                	li	a0,-1
    802013cc:	b7f5                	j	802013b8 <copyout2+0x3c>

00000000802013ce <copyin>:
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
  uint64 n, va0, pa0;

  while(len > 0){
    802013ce:	c6bd                	beqz	a3,8020143c <copyin+0x6e>
{
    802013d0:	715d                	addi	sp,sp,-80
    802013d2:	e486                	sd	ra,72(sp)
    802013d4:	e0a2                	sd	s0,64(sp)
    802013d6:	fc26                	sd	s1,56(sp)
    802013d8:	f84a                	sd	s2,48(sp)
    802013da:	f44e                	sd	s3,40(sp)
    802013dc:	f052                	sd	s4,32(sp)
    802013de:	ec56                	sd	s5,24(sp)
    802013e0:	e85a                	sd	s6,16(sp)
    802013e2:	e45e                	sd	s7,8(sp)
    802013e4:	e062                	sd	s8,0(sp)
    802013e6:	0880                	addi	s0,sp,80
    802013e8:	8b2a                	mv	s6,a0
    802013ea:	8a2e                	mv	s4,a1
    802013ec:	8c32                	mv	s8,a2
    802013ee:	89b6                	mv	s3,a3
    va0 = PGROUNDDOWN(srcva);
    802013f0:	7bfd                	lui	s7,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (srcva - va0);
    802013f2:	6a85                	lui	s5,0x1
    802013f4:	a015                	j	80201418 <copyin+0x4a>
    if(n > len)
      n = len;
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    802013f6:	9562                	add	a0,a0,s8
    802013f8:	0004861b          	sext.w	a2,s1
    802013fc:	412505b3          	sub	a1,a0,s2
    80201400:	8552                	mv	a0,s4
    80201402:	fffff097          	auipc	ra,0xfffff
    80201406:	3c2080e7          	jalr	962(ra) # 802007c4 <memmove>

    len -= n;
    8020140a:	409989b3          	sub	s3,s3,s1
    dst += n;
    8020140e:	9a26                	add	s4,s4,s1
    srcva = va0 + PGSIZE;
    80201410:	01590c33          	add	s8,s2,s5
  while(len > 0){
    80201414:	02098263          	beqz	s3,80201438 <copyin+0x6a>
    va0 = PGROUNDDOWN(srcva);
    80201418:	017c7933          	and	s2,s8,s7
    pa0 = walkaddr(pagetable, va0);
    8020141c:	85ca                	mv	a1,s2
    8020141e:	855a                	mv	a0,s6
    80201420:	fffff097          	auipc	ra,0xfffff
    80201424:	79c080e7          	jalr	1948(ra) # 80200bbc <walkaddr>
    if(pa0 == NULL)
    80201428:	cd01                	beqz	a0,80201440 <copyin+0x72>
    n = PGSIZE - (srcva - va0);
    8020142a:	418904b3          	sub	s1,s2,s8
    8020142e:	94d6                	add	s1,s1,s5
    if(n > len)
    80201430:	fc99f3e3          	bgeu	s3,s1,802013f6 <copyin+0x28>
    80201434:	84ce                	mv	s1,s3
    80201436:	b7c1                	j	802013f6 <copyin+0x28>
  }
  return 0;
    80201438:	4501                	li	a0,0
    8020143a:	a021                	j	80201442 <copyin+0x74>
    8020143c:	4501                	li	a0,0
}
    8020143e:	8082                	ret
      return -1;
    80201440:	557d                	li	a0,-1
}
    80201442:	60a6                	ld	ra,72(sp)
    80201444:	6406                	ld	s0,64(sp)
    80201446:	74e2                	ld	s1,56(sp)
    80201448:	7942                	ld	s2,48(sp)
    8020144a:	79a2                	ld	s3,40(sp)
    8020144c:	7a02                	ld	s4,32(sp)
    8020144e:	6ae2                	ld	s5,24(sp)
    80201450:	6b42                	ld	s6,16(sp)
    80201452:	6ba2                	ld	s7,8(sp)
    80201454:	6c02                	ld	s8,0(sp)
    80201456:	6161                	addi	sp,sp,80
    80201458:	8082                	ret

000000008020145a <copyin2>:

int
copyin2(char *dst, uint64 srcva, uint64 len)
{
    8020145a:	7179                	addi	sp,sp,-48
    8020145c:	f406                	sd	ra,40(sp)
    8020145e:	f022                	sd	s0,32(sp)
    80201460:	ec26                	sd	s1,24(sp)
    80201462:	e84a                	sd	s2,16(sp)
    80201464:	e44e                	sd	s3,8(sp)
    80201466:	1800                	addi	s0,sp,48
    80201468:	89aa                	mv	s3,a0
    8020146a:	84ae                	mv	s1,a1
    8020146c:	8932                	mv	s2,a2
  uint64 sz = myproc()->sz;
    8020146e:	00000097          	auipc	ra,0x0
    80201472:	5ea080e7          	jalr	1514(ra) # 80201a58 <myproc>
    80201476:	653c                	ld	a5,72(a0)
  if (srcva + len > sz || srcva >= sz) {
    80201478:	01248733          	add	a4,s1,s2
    8020147c:	02e7e463          	bltu	a5,a4,802014a4 <copyin2+0x4a>
    80201480:	02f4f463          	bgeu	s1,a5,802014a8 <copyin2+0x4e>
    return -1;
  }
  memmove(dst, (void *)srcva, len);
    80201484:	0009061b          	sext.w	a2,s2
    80201488:	85a6                	mv	a1,s1
    8020148a:	854e                	mv	a0,s3
    8020148c:	fffff097          	auipc	ra,0xfffff
    80201490:	338080e7          	jalr	824(ra) # 802007c4 <memmove>
  return 0;
    80201494:	4501                	li	a0,0
}
    80201496:	70a2                	ld	ra,40(sp)
    80201498:	7402                	ld	s0,32(sp)
    8020149a:	64e2                	ld	s1,24(sp)
    8020149c:	6942                	ld	s2,16(sp)
    8020149e:	69a2                	ld	s3,8(sp)
    802014a0:	6145                	addi	sp,sp,48
    802014a2:	8082                	ret
    return -1;
    802014a4:	557d                	li	a0,-1
    802014a6:	bfc5                	j	80201496 <copyin2+0x3c>
    802014a8:	557d                	li	a0,-1
    802014aa:	b7f5                	j	80201496 <copyin2+0x3c>

00000000802014ac <copyinstr>:
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
  uint64 n, va0, pa0;
  int got_null = 0;

  while(got_null == 0 && max > 0){
    802014ac:	c6c5                	beqz	a3,80201554 <copyinstr+0xa8>
{
    802014ae:	715d                	addi	sp,sp,-80
    802014b0:	e486                	sd	ra,72(sp)
    802014b2:	e0a2                	sd	s0,64(sp)
    802014b4:	fc26                	sd	s1,56(sp)
    802014b6:	f84a                	sd	s2,48(sp)
    802014b8:	f44e                	sd	s3,40(sp)
    802014ba:	f052                	sd	s4,32(sp)
    802014bc:	ec56                	sd	s5,24(sp)
    802014be:	e85a                	sd	s6,16(sp)
    802014c0:	e45e                	sd	s7,8(sp)
    802014c2:	0880                	addi	s0,sp,80
    802014c4:	8a2a                	mv	s4,a0
    802014c6:	8b2e                	mv	s6,a1
    802014c8:	8bb2                	mv	s7,a2
    802014ca:	84b6                	mv	s1,a3
    va0 = PGROUNDDOWN(srcva);
    802014cc:	7afd                	lui	s5,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (srcva - va0);
    802014ce:	6985                	lui	s3,0x1
    802014d0:	a035                	j	802014fc <copyinstr+0x50>
      n = max;

    char *p = (char *) (pa0 + (srcva - va0));
    while(n > 0){
      if(*p == '\0'){
        *dst = '\0';
    802014d2:	00078023          	sb	zero,0(a5) # 1000 <_entry-0x801ff000>
    802014d6:	4785                	li	a5,1
      dst++;
    }

    srcva = va0 + PGSIZE;
  }
  if(got_null){
    802014d8:	0017b793          	seqz	a5,a5
    802014dc:	40f00533          	neg	a0,a5
    return 0;
  } else {
    return -1;
  }
}
    802014e0:	60a6                	ld	ra,72(sp)
    802014e2:	6406                	ld	s0,64(sp)
    802014e4:	74e2                	ld	s1,56(sp)
    802014e6:	7942                	ld	s2,48(sp)
    802014e8:	79a2                	ld	s3,40(sp)
    802014ea:	7a02                	ld	s4,32(sp)
    802014ec:	6ae2                	ld	s5,24(sp)
    802014ee:	6b42                	ld	s6,16(sp)
    802014f0:	6ba2                	ld	s7,8(sp)
    802014f2:	6161                	addi	sp,sp,80
    802014f4:	8082                	ret
    srcva = va0 + PGSIZE;
    802014f6:	01390bb3          	add	s7,s2,s3
  while(got_null == 0 && max > 0){
    802014fa:	c8a9                	beqz	s1,8020154c <copyinstr+0xa0>
    va0 = PGROUNDDOWN(srcva);
    802014fc:	015bf933          	and	s2,s7,s5
    pa0 = walkaddr(pagetable, va0);
    80201500:	85ca                	mv	a1,s2
    80201502:	8552                	mv	a0,s4
    80201504:	fffff097          	auipc	ra,0xfffff
    80201508:	6b8080e7          	jalr	1720(ra) # 80200bbc <walkaddr>
    if(pa0 == NULL)
    8020150c:	c131                	beqz	a0,80201550 <copyinstr+0xa4>
    n = PGSIZE - (srcva - va0);
    8020150e:	41790833          	sub	a6,s2,s7
    80201512:	984e                	add	a6,a6,s3
    if(n > max)
    80201514:	0104f363          	bgeu	s1,a6,8020151a <copyinstr+0x6e>
    80201518:	8826                	mv	a6,s1
    char *p = (char *) (pa0 + (srcva - va0));
    8020151a:	955e                	add	a0,a0,s7
    8020151c:	41250533          	sub	a0,a0,s2
    while(n > 0){
    80201520:	fc080be3          	beqz	a6,802014f6 <copyinstr+0x4a>
    80201524:	985a                	add	a6,a6,s6
    80201526:	87da                	mv	a5,s6
      if(*p == '\0'){
    80201528:	41650633          	sub	a2,a0,s6
    8020152c:	14fd                	addi	s1,s1,-1
    8020152e:	9b26                	add	s6,s6,s1
    80201530:	00f60733          	add	a4,a2,a5
    80201534:	00074703          	lbu	a4,0(a4) # fffffffffffff000 <kernel_end+0xffffffff7fdca000>
    80201538:	df49                	beqz	a4,802014d2 <copyinstr+0x26>
        *dst = *p;
    8020153a:	00e78023          	sb	a4,0(a5)
      --max;
    8020153e:	40fb04b3          	sub	s1,s6,a5
      dst++;
    80201542:	0785                	addi	a5,a5,1
    while(n > 0){
    80201544:	ff0796e3          	bne	a5,a6,80201530 <copyinstr+0x84>
      dst++;
    80201548:	8b42                	mv	s6,a6
    8020154a:	b775                	j	802014f6 <copyinstr+0x4a>
    8020154c:	4781                	li	a5,0
    8020154e:	b769                	j	802014d8 <copyinstr+0x2c>
      return -1;
    80201550:	557d                	li	a0,-1
    80201552:	b779                	j	802014e0 <copyinstr+0x34>
  int got_null = 0;
    80201554:	4781                	li	a5,0
  if(got_null){
    80201556:	0017b793          	seqz	a5,a5
    8020155a:	40f00533          	neg	a0,a5
}
    8020155e:	8082                	ret

0000000080201560 <copyinstr2>:

int
copyinstr2(char *dst, uint64 srcva, uint64 max)
{
    80201560:	7179                	addi	sp,sp,-48
    80201562:	f406                	sd	ra,40(sp)
    80201564:	f022                	sd	s0,32(sp)
    80201566:	ec26                	sd	s1,24(sp)
    80201568:	e84a                	sd	s2,16(sp)
    8020156a:	e44e                	sd	s3,8(sp)
    8020156c:	1800                	addi	s0,sp,48
    8020156e:	89aa                	mv	s3,a0
    80201570:	84ae                	mv	s1,a1
    80201572:	8932                	mv	s2,a2
  int got_null = 0;
  uint64 sz = myproc()->sz;
    80201574:	00000097          	auipc	ra,0x0
    80201578:	4e4080e7          	jalr	1252(ra) # 80201a58 <myproc>
    8020157c:	6534                	ld	a3,72(a0)
  while(srcva < sz && max > 0){
    8020157e:	04d4f363          	bgeu	s1,a3,802015c4 <copyinstr2+0x64>
    80201582:	04090363          	beqz	s2,802015c8 <copyinstr2+0x68>
    80201586:	01298633          	add	a2,s3,s2
    8020158a:	8e85                	sub	a3,a3,s1
    8020158c:	96ce                	add	a3,a3,s3
    8020158e:	87ce                	mv	a5,s3
    char *p = (char *)srcva;
    if(*p == '\0'){
    80201590:	413485b3          	sub	a1,s1,s3
    80201594:	00b78733          	add	a4,a5,a1
    80201598:	00074703          	lbu	a4,0(a4)
    8020159c:	cb11                	beqz	a4,802015b0 <copyinstr2+0x50>
      *dst = '\0';
      got_null = 1;
      break;
    } else {
      *dst = *p;
    8020159e:	00e78023          	sb	a4,0(a5)
    }
    --max;
    srcva++;
    dst++;
    802015a2:	0785                	addi	a5,a5,1
  while(srcva < sz && max > 0){
    802015a4:	02d78463          	beq	a5,a3,802015cc <copyinstr2+0x6c>
    802015a8:	fec796e3          	bne	a5,a2,80201594 <copyinstr2+0x34>
  }
  if(got_null){
    return 0;
  } else {
    return -1;
    802015ac:	557d                	li	a0,-1
    802015ae:	a021                	j	802015b6 <copyinstr2+0x56>
      *dst = '\0';
    802015b0:	00078023          	sb	zero,0(a5)
    return 0;
    802015b4:	4501                	li	a0,0
  }
}
    802015b6:	70a2                	ld	ra,40(sp)
    802015b8:	7402                	ld	s0,32(sp)
    802015ba:	64e2                	ld	s1,24(sp)
    802015bc:	6942                	ld	s2,16(sp)
    802015be:	69a2                	ld	s3,8(sp)
    802015c0:	6145                	addi	sp,sp,48
    802015c2:	8082                	ret
    return -1;
    802015c4:	557d                	li	a0,-1
    802015c6:	bfc5                	j	802015b6 <copyinstr2+0x56>
    802015c8:	557d                	li	a0,-1
    802015ca:	b7f5                	j	802015b6 <copyinstr2+0x56>
    802015cc:	557d                	li	a0,-1
    802015ce:	b7e5                	j	802015b6 <copyinstr2+0x56>

00000000802015d0 <kfreewalk>:
}

// only free page table, not physical pages
void
kfreewalk(pagetable_t kpt)
{
    802015d0:	7179                	addi	sp,sp,-48
    802015d2:	f406                	sd	ra,40(sp)
    802015d4:	f022                	sd	s0,32(sp)
    802015d6:	ec26                	sd	s1,24(sp)
    802015d8:	e84a                	sd	s2,16(sp)
    802015da:	e44e                	sd	s3,8(sp)
    802015dc:	e052                	sd	s4,0(sp)
    802015de:	1800                	addi	s0,sp,48
    802015e0:	8a2a                	mv	s4,a0
  for (int i = 0; i < 512; i++) {
    802015e2:	84aa                	mv	s1,a0
    802015e4:	6905                	lui	s2,0x1
    802015e6:	992a                	add	s2,s2,a0
    pte_t pte = kpt[i];
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    802015e8:	4985                	li	s3,1
    802015ea:	a829                	j	80201604 <kfreewalk+0x34>
      kfreewalk((pagetable_t) PTE2PA(pte));
    802015ec:	83a9                	srli	a5,a5,0xa
    802015ee:	00c79513          	slli	a0,a5,0xc
    802015f2:	00000097          	auipc	ra,0x0
    802015f6:	fde080e7          	jalr	-34(ra) # 802015d0 <kfreewalk>
      kpt[i] = 0;
    802015fa:	0004b023          	sd	zero,0(s1)
  for (int i = 0; i < 512; i++) {
    802015fe:	04a1                	addi	s1,s1,8
    80201600:	01248963          	beq	s1,s2,80201612 <kfreewalk+0x42>
    pte_t pte = kpt[i];
    80201604:	609c                	ld	a5,0(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    80201606:	00f7f713          	andi	a4,a5,15
    8020160a:	ff3701e3          	beq	a4,s3,802015ec <kfreewalk+0x1c>
    } else if (pte & PTE_V) {
    8020160e:	8b85                	andi	a5,a5,1
    80201610:	d7fd                	beqz	a5,802015fe <kfreewalk+0x2e>
      break;
    }
  }
  kfree((void *) kpt);
    80201612:	8552                	mv	a0,s4
    80201614:	fffff097          	auipc	ra,0xfffff
    80201618:	e30080e7          	jalr	-464(ra) # 80200444 <kfree>
}
    8020161c:	70a2                	ld	ra,40(sp)
    8020161e:	7402                	ld	s0,32(sp)
    80201620:	64e2                	ld	s1,24(sp)
    80201622:	6942                	ld	s2,16(sp)
    80201624:	69a2                	ld	s3,8(sp)
    80201626:	6a02                	ld	s4,0(sp)
    80201628:	6145                	addi	sp,sp,48
    8020162a:	8082                	ret

000000008020162c <kvmfreeusr>:

void
kvmfreeusr(pagetable_t kpt)
{
    8020162c:	1101                	addi	sp,sp,-32
    8020162e:	ec06                	sd	ra,24(sp)
    80201630:	e822                	sd	s0,16(sp)
    80201632:	e426                	sd	s1,8(sp)
    80201634:	1000                	addi	s0,sp,32
    80201636:	84aa                	mv	s1,a0
  pte_t pte;
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    pte = kpt[i];
    80201638:	6108                	ld	a0,0(a0)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    8020163a:	00f57713          	andi	a4,a0,15
    8020163e:	4785                	li	a5,1
    80201640:	00f70d63          	beq	a4,a5,8020165a <kvmfreeusr+0x2e>
    pte = kpt[i];
    80201644:	6488                	ld	a0,8(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    80201646:	00f57713          	andi	a4,a0,15
    8020164a:	4785                	li	a5,1
    8020164c:	02f70063          	beq	a4,a5,8020166c <kvmfreeusr+0x40>
      kfreewalk((pagetable_t) PTE2PA(pte));
      kpt[i] = 0;
    }
  }
}
    80201650:	60e2                	ld	ra,24(sp)
    80201652:	6442                	ld	s0,16(sp)
    80201654:	64a2                	ld	s1,8(sp)
    80201656:	6105                	addi	sp,sp,32
    80201658:	8082                	ret
      kfreewalk((pagetable_t) PTE2PA(pte));
    8020165a:	8129                	srli	a0,a0,0xa
    8020165c:	0532                	slli	a0,a0,0xc
    8020165e:	00000097          	auipc	ra,0x0
    80201662:	f72080e7          	jalr	-142(ra) # 802015d0 <kfreewalk>
      kpt[i] = 0;
    80201666:	0004b023          	sd	zero,0(s1)
    8020166a:	bfe9                	j	80201644 <kvmfreeusr+0x18>
      kfreewalk((pagetable_t) PTE2PA(pte));
    8020166c:	8129                	srli	a0,a0,0xa
    8020166e:	0532                	slli	a0,a0,0xc
    80201670:	00000097          	auipc	ra,0x0
    80201674:	f60080e7          	jalr	-160(ra) # 802015d0 <kfreewalk>
      kpt[i] = 0;
    80201678:	0004b423          	sd	zero,8(s1)
}
    8020167c:	bfd1                	j	80201650 <kvmfreeusr+0x24>

000000008020167e <kvmfree>:

void
kvmfree(pagetable_t kpt, int stack_free)
{
    8020167e:	1101                	addi	sp,sp,-32
    80201680:	ec06                	sd	ra,24(sp)
    80201682:	e822                	sd	s0,16(sp)
    80201684:	e426                	sd	s1,8(sp)
    80201686:	1000                	addi	s0,sp,32
    80201688:	84aa                	mv	s1,a0
  if (stack_free) {
    8020168a:	e185                	bnez	a1,802016aa <kvmfree+0x2c>
    pte_t pte = kpt[PX(2, VKSTACK)];
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
      kfreewalk((pagetable_t) PTE2PA(pte));
    }
  }
  kvmfreeusr(kpt);
    8020168c:	8526                	mv	a0,s1
    8020168e:	00000097          	auipc	ra,0x0
    80201692:	f9e080e7          	jalr	-98(ra) # 8020162c <kvmfreeusr>
  kfree(kpt);
    80201696:	8526                	mv	a0,s1
    80201698:	fffff097          	auipc	ra,0xfffff
    8020169c:	dac080e7          	jalr	-596(ra) # 80200444 <kfree>
}
    802016a0:	60e2                	ld	ra,24(sp)
    802016a2:	6442                	ld	s0,16(sp)
    802016a4:	64a2                	ld	s1,8(sp)
    802016a6:	6105                	addi	sp,sp,32
    802016a8:	8082                	ret
    vmunmap(kpt, VKSTACK, 1, 1);
    802016aa:	4685                	li	a3,1
    802016ac:	4605                	li	a2,1
    802016ae:	0fb00593          	li	a1,251
    802016b2:	05fa                	slli	a1,a1,0x1e
    802016b4:	fffff097          	auipc	ra,0xfffff
    802016b8:	77c080e7          	jalr	1916(ra) # 80200e30 <vmunmap>
    pte_t pte = kpt[PX(2, VKSTACK)];
    802016bc:	7d84b503          	ld	a0,2008(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    802016c0:	00f57713          	andi	a4,a0,15
    802016c4:	4785                	li	a5,1
    802016c6:	fcf713e3          	bne	a4,a5,8020168c <kvmfree+0xe>
      kfreewalk((pagetable_t) PTE2PA(pte));
    802016ca:	8129                	srli	a0,a0,0xa
    802016cc:	0532                	slli	a0,a0,0xc
    802016ce:	00000097          	auipc	ra,0x0
    802016d2:	f02080e7          	jalr	-254(ra) # 802015d0 <kfreewalk>
    802016d6:	bf5d                	j	8020168c <kvmfree+0xe>

00000000802016d8 <proc_kpagetable>:
{
    802016d8:	1101                	addi	sp,sp,-32
    802016da:	ec06                	sd	ra,24(sp)
    802016dc:	e822                	sd	s0,16(sp)
    802016de:	e426                	sd	s1,8(sp)
    802016e0:	1000                	addi	s0,sp,32
  pagetable_t kpt = (pagetable_t) kalloc();
    802016e2:	fffff097          	auipc	ra,0xfffff
    802016e6:	e7a080e7          	jalr	-390(ra) # 8020055c <kalloc>
    802016ea:	84aa                	mv	s1,a0
  if (kpt == NULL)
    802016ec:	c91d                	beqz	a0,80201722 <proc_kpagetable+0x4a>
  memmove(kpt, kernel_pagetable, PGSIZE);
    802016ee:	6605                	lui	a2,0x1
    802016f0:	00015597          	auipc	a1,0x15
    802016f4:	9685b583          	ld	a1,-1688(a1) # 80216058 <kernel_pagetable>
    802016f8:	fffff097          	auipc	ra,0xfffff
    802016fc:	0cc080e7          	jalr	204(ra) # 802007c4 <memmove>
  char *pstack = kalloc();
    80201700:	fffff097          	auipc	ra,0xfffff
    80201704:	e5c080e7          	jalr	-420(ra) # 8020055c <kalloc>
    80201708:	86aa                	mv	a3,a0
  if(pstack == NULL)
    8020170a:	c115                	beqz	a0,8020172e <proc_kpagetable+0x56>
  if (mappages(kpt, VKSTACK, PGSIZE, (uint64)pstack, PTE_R | PTE_W) != 0)
    8020170c:	4719                	li	a4,6
    8020170e:	6605                	lui	a2,0x1
    80201710:	0fb00593          	li	a1,251
    80201714:	05fa                	slli	a1,a1,0x1e
    80201716:	8526                	mv	a0,s1
    80201718:	fffff097          	auipc	ra,0xfffff
    8020171c:	55e080e7          	jalr	1374(ra) # 80200c76 <mappages>
    80201720:	e519                	bnez	a0,8020172e <proc_kpagetable+0x56>
}
    80201722:	8526                	mv	a0,s1
    80201724:	60e2                	ld	ra,24(sp)
    80201726:	6442                	ld	s0,16(sp)
    80201728:	64a2                	ld	s1,8(sp)
    8020172a:	6105                	addi	sp,sp,32
    8020172c:	8082                	ret
  kvmfree(kpt, 1);
    8020172e:	4585                	li	a1,1
    80201730:	8526                	mv	a0,s1
    80201732:	00000097          	auipc	ra,0x0
    80201736:	f4c080e7          	jalr	-180(ra) # 8020167e <kvmfree>
  return NULL;
    8020173a:	4481                	li	s1,0
    8020173c:	b7dd                	j	80201722 <proc_kpagetable+0x4a>

000000008020173e <vmprint>:

void vmprint(pagetable_t pagetable)
{
    8020173e:	7119                	addi	sp,sp,-128
    80201740:	fc86                	sd	ra,120(sp)
    80201742:	f8a2                	sd	s0,112(sp)
    80201744:	f4a6                	sd	s1,104(sp)
    80201746:	f0ca                	sd	s2,96(sp)
    80201748:	ecce                	sd	s3,88(sp)
    8020174a:	e8d2                	sd	s4,80(sp)
    8020174c:	e4d6                	sd	s5,72(sp)
    8020174e:	e0da                	sd	s6,64(sp)
    80201750:	fc5e                	sd	s7,56(sp)
    80201752:	f862                	sd	s8,48(sp)
    80201754:	f466                	sd	s9,40(sp)
    80201756:	f06a                	sd	s10,32(sp)
    80201758:	ec6e                	sd	s11,24(sp)
    8020175a:	0100                	addi	s0,sp,128
    8020175c:	8baa                	mv	s7,a0
    8020175e:	f8a43023          	sd	a0,-128(s0)
  const int capacity = 512;
  printf("page table %p\n", pagetable);
    80201762:	85aa                	mv	a1,a0
    80201764:	00009517          	auipc	a0,0x9
    80201768:	d9c50513          	addi	a0,a0,-612 # 8020a500 <digits+0x180>
    8020176c:	fffff097          	auipc	ra,0xfffff
    80201770:	a20080e7          	jalr	-1504(ra) # 8020018c <printf>
  for (pte_t *pte = (pte_t *) pagetable; pte < pagetable + capacity; pte++) {
    80201774:	6d85                	lui	s11,0x1
    80201776:	9dde                	add	s11,s11,s7
    80201778:	6c05                	lui	s8,0x1

      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
        if (*pte2 & PTE_V)
        {
          pagetable_t pt3 = (pagetable_t) PTE2PA(*pte2);
          printf(".. ..%d: pte %p pa %p\n", pte2 - pt2, *pte2, pt3);
    8020177a:	00009c97          	auipc	s9,0x9
    8020177e:	daec8c93          	addi	s9,s9,-594 # 8020a528 <digits+0x1a8>
    80201782:	20000793          	li	a5,512
    80201786:	f8f43423          	sd	a5,-120(s0)

          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
            if (*pte3 & PTE_V)
              printf(".. .. ..%d: pte %p pa %p\n", pte3 - pt3, *pte3, PTE2PA(*pte3));
    8020178a:	00009a17          	auipc	s4,0x9
    8020178e:	db6a0a13          	addi	s4,s4,-586 # 8020a540 <digits+0x1c0>
    80201792:	a88d                	j	80201804 <vmprint+0xc6>
    80201794:	00a65693          	srli	a3,a2,0xa
    80201798:	413485b3          	sub	a1,s1,s3
    8020179c:	06b2                	slli	a3,a3,0xc
    8020179e:	858d                	srai	a1,a1,0x3
    802017a0:	8552                	mv	a0,s4
    802017a2:	fffff097          	auipc	ra,0xfffff
    802017a6:	9ea080e7          	jalr	-1558(ra) # 8020018c <printf>
          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
    802017aa:	04a1                	addi	s1,s1,8
    802017ac:	01248763          	beq	s1,s2,802017ba <vmprint+0x7c>
            if (*pte3 & PTE_V)
    802017b0:	6090                	ld	a2,0(s1)
    802017b2:	00167793          	andi	a5,a2,1
    802017b6:	dbf5                	beqz	a5,802017aa <vmprint+0x6c>
    802017b8:	bff1                	j	80201794 <vmprint+0x56>
      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
    802017ba:	0aa1                	addi	s5,s5,8
    802017bc:	056a8163          	beq	s5,s6,802017fe <vmprint+0xc0>
        if (*pte2 & PTE_V)
    802017c0:	000ab603          	ld	a2,0(s5) # fffffffffffff000 <kernel_end+0xffffffff7fdca000>
    802017c4:	00167793          	andi	a5,a2,1
    802017c8:	dbed                	beqz	a5,802017ba <vmprint+0x7c>
          pagetable_t pt3 = (pagetable_t) PTE2PA(*pte2);
    802017ca:	00a65493          	srli	s1,a2,0xa
    802017ce:	04b2                	slli	s1,s1,0xc
    802017d0:	89a6                	mv	s3,s1
          printf(".. ..%d: pte %p pa %p\n", pte2 - pt2, *pte2, pt3);
    802017d2:	41aa85b3          	sub	a1,s5,s10
    802017d6:	86a6                	mv	a3,s1
    802017d8:	858d                	srai	a1,a1,0x3
    802017da:	8566                	mv	a0,s9
    802017dc:	fffff097          	auipc	ra,0xfffff
    802017e0:	9b0080e7          	jalr	-1616(ra) # 8020018c <printf>
          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
    802017e4:	00848693          	addi	a3,s1,8
    802017e8:	01848733          	add	a4,s1,s8
    802017ec:	f8843783          	ld	a5,-120(s0)
    802017f0:	00d77363          	bgeu	a4,a3,802017f6 <vmprint+0xb8>
    802017f4:	4785                	li	a5,1
    802017f6:	078e                	slli	a5,a5,0x3
    802017f8:	00978933          	add	s2,a5,s1
    802017fc:	bf55                	j	802017b0 <vmprint+0x72>
  for (pte_t *pte = (pte_t *) pagetable; pte < pagetable + capacity; pte++) {
    802017fe:	0ba1                	addi	s7,s7,8
    80201800:	05bb8763          	beq	s7,s11,8020184e <vmprint+0x110>
    if (*pte & PTE_V)
    80201804:	000bb603          	ld	a2,0(s7) # fffffffffffff000 <kernel_end+0xffffffff7fdca000>
    80201808:	00167793          	andi	a5,a2,1
    8020180c:	dbed                	beqz	a5,802017fe <vmprint+0xc0>
      pagetable_t pt2 = (pagetable_t) PTE2PA(*pte); 
    8020180e:	00a65a93          	srli	s5,a2,0xa
    80201812:	0ab2                	slli	s5,s5,0xc
    80201814:	8d56                	mv	s10,s5
      printf("..%d: pte %p pa %p\n", pte - pagetable, *pte, pt2);
    80201816:	f8043783          	ld	a5,-128(s0)
    8020181a:	40fb87b3          	sub	a5,s7,a5
    8020181e:	86d6                	mv	a3,s5
    80201820:	4037d593          	srai	a1,a5,0x3
    80201824:	00009517          	auipc	a0,0x9
    80201828:	cec50513          	addi	a0,a0,-788 # 8020a510 <digits+0x190>
    8020182c:	fffff097          	auipc	ra,0xfffff
    80201830:	960080e7          	jalr	-1696(ra) # 8020018c <printf>
      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
    80201834:	018a86b3          	add	a3,s5,s8
    80201838:	008a8713          	addi	a4,s5,8
    8020183c:	20000793          	li	a5,512
    80201840:	00e6f363          	bgeu	a3,a4,80201846 <vmprint+0x108>
    80201844:	4785                	li	a5,1
    80201846:	078e                	slli	a5,a5,0x3
    80201848:	01578b33          	add	s6,a5,s5
    8020184c:	bf95                	j	802017c0 <vmprint+0x82>
        }
      }
    }
  }
  return;
}
    8020184e:	70e6                	ld	ra,120(sp)
    80201850:	7446                	ld	s0,112(sp)
    80201852:	74a6                	ld	s1,104(sp)
    80201854:	7906                	ld	s2,96(sp)
    80201856:	69e6                	ld	s3,88(sp)
    80201858:	6a46                	ld	s4,80(sp)
    8020185a:	6aa6                	ld	s5,72(sp)
    8020185c:	6b06                	ld	s6,64(sp)
    8020185e:	7be2                	ld	s7,56(sp)
    80201860:	7c42                	ld	s8,48(sp)
    80201862:	7ca2                	ld	s9,40(sp)
    80201864:	7d02                	ld	s10,32(sp)
    80201866:	6de2                	ld	s11,24(sp)
    80201868:	6109                	addi	sp,sp,128
    8020186a:	8082                	ret

000000008020186c <wakeup1>:

// Wake up p if it is sleeping in wait(); used by exit().
// Caller must hold p->lock.
static void
wakeup1(struct proc *p)
{
    8020186c:	1101                	addi	sp,sp,-32
    8020186e:	ec06                	sd	ra,24(sp)
    80201870:	e822                	sd	s0,16(sp)
    80201872:	e426                	sd	s1,8(sp)
    80201874:	1000                	addi	s0,sp,32
    80201876:	84aa                	mv	s1,a0
  if (!holding(&p->lock))
    80201878:	fffff097          	auipc	ra,0xfffff
    8020187c:	e22080e7          	jalr	-478(ra) # 8020069a <holding>
    80201880:	c909                	beqz	a0,80201892 <wakeup1+0x26>
    panic("wakeup1");
  if (p->chan == p && p->state == SLEEPING)
    80201882:	749c                	ld	a5,40(s1)
    80201884:	00978f63          	beq	a5,s1,802018a2 <wakeup1+0x36>
  {
    p->state = RUNNABLE;
  }
}
    80201888:	60e2                	ld	ra,24(sp)
    8020188a:	6442                	ld	s0,16(sp)
    8020188c:	64a2                	ld	s1,8(sp)
    8020188e:	6105                	addi	sp,sp,32
    80201890:	8082                	ret
    panic("wakeup1");
    80201892:	00009517          	auipc	a0,0x9
    80201896:	cce50513          	addi	a0,a0,-818 # 8020a560 <digits+0x1e0>
    8020189a:	fffff097          	auipc	ra,0xfffff
    8020189e:	8a8080e7          	jalr	-1880(ra) # 80200142 <panic>
  if (p->chan == p && p->state == SLEEPING)
    802018a2:	4c98                	lw	a4,24(s1)
    802018a4:	4785                	li	a5,1
    802018a6:	fef711e3          	bne	a4,a5,80201888 <wakeup1+0x1c>
    p->state = RUNNABLE;
    802018aa:	4789                	li	a5,2
    802018ac:	cc9c                	sw	a5,24(s1)
}
    802018ae:	bfe9                	j	80201888 <wakeup1+0x1c>

00000000802018b0 <reg_info>:
{
    802018b0:	1141                	addi	sp,sp,-16
    802018b2:	e406                	sd	ra,8(sp)
    802018b4:	e022                	sd	s0,0(sp)
    802018b6:	0800                	addi	s0,sp,16
  printf("register info: {\n");
    802018b8:	00009517          	auipc	a0,0x9
    802018bc:	cb050513          	addi	a0,a0,-848 # 8020a568 <digits+0x1e8>
    802018c0:	fffff097          	auipc	ra,0xfffff
    802018c4:	8cc080e7          	jalr	-1844(ra) # 8020018c <printf>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802018c8:	100025f3          	csrr	a1,sstatus
  printf("sstatus: %p\n", r_sstatus());
    802018cc:	00009517          	auipc	a0,0x9
    802018d0:	cb450513          	addi	a0,a0,-844 # 8020a580 <digits+0x200>
    802018d4:	fffff097          	auipc	ra,0xfffff
    802018d8:	8b8080e7          	jalr	-1864(ra) # 8020018c <printf>
  asm volatile("csrr %0, sip" : "=r" (x) );
    802018dc:	144025f3          	csrr	a1,sip
  printf("sip: %p\n", r_sip());
    802018e0:	00009517          	auipc	a0,0x9
    802018e4:	cb050513          	addi	a0,a0,-848 # 8020a590 <digits+0x210>
    802018e8:	fffff097          	auipc	ra,0xfffff
    802018ec:	8a4080e7          	jalr	-1884(ra) # 8020018c <printf>
  asm volatile("csrr %0, sie" : "=r" (x) );
    802018f0:	104025f3          	csrr	a1,sie
  printf("sie: %p\n", r_sie());
    802018f4:	00009517          	auipc	a0,0x9
    802018f8:	cac50513          	addi	a0,a0,-852 # 8020a5a0 <digits+0x220>
    802018fc:	fffff097          	auipc	ra,0xfffff
    80201900:	890080e7          	jalr	-1904(ra) # 8020018c <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80201904:	141025f3          	csrr	a1,sepc
  printf("sepc: %p\n", r_sepc());
    80201908:	00009517          	auipc	a0,0x9
    8020190c:	ca850513          	addi	a0,a0,-856 # 8020a5b0 <digits+0x230>
    80201910:	fffff097          	auipc	ra,0xfffff
    80201914:	87c080e7          	jalr	-1924(ra) # 8020018c <printf>
  asm volatile("csrr %0, stvec" : "=r" (x) );
    80201918:	105025f3          	csrr	a1,stvec
  printf("stvec: %p\n", r_stvec());
    8020191c:	00009517          	auipc	a0,0x9
    80201920:	ca450513          	addi	a0,a0,-860 # 8020a5c0 <digits+0x240>
    80201924:	fffff097          	auipc	ra,0xfffff
    80201928:	868080e7          	jalr	-1944(ra) # 8020018c <printf>
  asm volatile("csrr %0, satp" : "=r" (x) );
    8020192c:	180025f3          	csrr	a1,satp
  printf("satp: %p\n", r_satp());
    80201930:	00009517          	auipc	a0,0x9
    80201934:	ca050513          	addi	a0,a0,-864 # 8020a5d0 <digits+0x250>
    80201938:	fffff097          	auipc	ra,0xfffff
    8020193c:	854080e7          	jalr	-1964(ra) # 8020018c <printf>
  asm volatile("csrr %0, scause" : "=r" (x) );
    80201940:	142025f3          	csrr	a1,scause
  printf("scause: %p\n", r_scause());
    80201944:	00009517          	auipc	a0,0x9
    80201948:	c9c50513          	addi	a0,a0,-868 # 8020a5e0 <digits+0x260>
    8020194c:	fffff097          	auipc	ra,0xfffff
    80201950:	840080e7          	jalr	-1984(ra) # 8020018c <printf>
  asm volatile("csrr %0, stval" : "=r" (x) );
    80201954:	143025f3          	csrr	a1,stval
  printf("stval: %p\n", r_stval());
    80201958:	00009517          	auipc	a0,0x9
    8020195c:	c9850513          	addi	a0,a0,-872 # 8020a5f0 <digits+0x270>
    80201960:	fffff097          	auipc	ra,0xfffff
    80201964:	82c080e7          	jalr	-2004(ra) # 8020018c <printf>
  asm volatile("mv %0, sp" : "=r" (x) );
    80201968:	858a                	mv	a1,sp
  printf("sp: %p\n", r_sp());
    8020196a:	00009517          	auipc	a0,0x9
    8020196e:	c9650513          	addi	a0,a0,-874 # 8020a600 <digits+0x280>
    80201972:	fffff097          	auipc	ra,0xfffff
    80201976:	81a080e7          	jalr	-2022(ra) # 8020018c <printf>
  asm volatile("mv %0, tp" : "=r" (x) );
    8020197a:	8592                	mv	a1,tp
  printf("tp: %p\n", r_tp());
    8020197c:	00009517          	auipc	a0,0x9
    80201980:	c8c50513          	addi	a0,a0,-884 # 8020a608 <digits+0x288>
    80201984:	fffff097          	auipc	ra,0xfffff
    80201988:	808080e7          	jalr	-2040(ra) # 8020018c <printf>
  asm volatile("mv %0, ra" : "=r" (x) );
    8020198c:	8586                	mv	a1,ra
  printf("ra: %p\n", r_ra());
    8020198e:	00009517          	auipc	a0,0x9
    80201992:	c8250513          	addi	a0,a0,-894 # 8020a610 <digits+0x290>
    80201996:	ffffe097          	auipc	ra,0xffffe
    8020199a:	7f6080e7          	jalr	2038(ra) # 8020018c <printf>
  printf("}\n");
    8020199e:	00009517          	auipc	a0,0x9
    802019a2:	c7a50513          	addi	a0,a0,-902 # 8020a618 <digits+0x298>
    802019a6:	ffffe097          	auipc	ra,0xffffe
    802019aa:	7e6080e7          	jalr	2022(ra) # 8020018c <printf>
}
    802019ae:	60a2                	ld	ra,8(sp)
    802019b0:	6402                	ld	s0,0(sp)
    802019b2:	0141                	addi	sp,sp,16
    802019b4:	8082                	ret

00000000802019b6 <procinit>:
{
    802019b6:	7179                	addi	sp,sp,-48
    802019b8:	f406                	sd	ra,40(sp)
    802019ba:	f022                	sd	s0,32(sp)
    802019bc:	ec26                	sd	s1,24(sp)
    802019be:	e84a                	sd	s2,16(sp)
    802019c0:	e44e                	sd	s3,8(sp)
    802019c2:	1800                	addi	s0,sp,48
  initlock(&pid_lock, "nextpid");
    802019c4:	00009597          	auipc	a1,0x9
    802019c8:	c5c58593          	addi	a1,a1,-932 # 8020a620 <digits+0x2a0>
    802019cc:	00014517          	auipc	a0,0x14
    802019d0:	69450513          	addi	a0,a0,1684 # 80216060 <pid_lock>
    802019d4:	fffff097          	auipc	ra,0xfffff
    802019d8:	cb0080e7          	jalr	-848(ra) # 80200684 <initlock>
  for (p = proc; p < &proc[NPROC]; p++)
    802019dc:	00014497          	auipc	s1,0x14
    802019e0:	7a448493          	addi	s1,s1,1956 # 80216180 <proc>
    initlock(&p->lock, "proc");
    802019e4:	00009997          	auipc	s3,0x9
    802019e8:	c4498993          	addi	s3,s3,-956 # 8020a628 <digits+0x2a8>
  for (p = proc; p < &proc[NPROC]; p++)
    802019ec:	00024917          	auipc	s2,0x24
    802019f0:	00490913          	addi	s2,s2,4 # 802259f0 <bcache>
    initlock(&p->lock, "proc");
    802019f4:	85ce                	mv	a1,s3
    802019f6:	8526                	mv	a0,s1
    802019f8:	fffff097          	auipc	ra,0xfffff
    802019fc:	c8c080e7          	jalr	-884(ra) # 80200684 <initlock>
  for (p = proc; p < &proc[NPROC]; p++)
    80201a00:	4f848493          	addi	s1,s1,1272
    80201a04:	ff2498e3          	bne	s1,s2,802019f4 <procinit+0x3e>
  memset(cpus, 0, sizeof(cpus));
    80201a08:	10000613          	li	a2,256
    80201a0c:	4581                	li	a1,0
    80201a0e:	00014517          	auipc	a0,0x14
    80201a12:	66a50513          	addi	a0,a0,1642 # 80216078 <cpus>
    80201a16:	fffff097          	auipc	ra,0xfffff
    80201a1a:	d4e080e7          	jalr	-690(ra) # 80200764 <memset>
}
    80201a1e:	70a2                	ld	ra,40(sp)
    80201a20:	7402                	ld	s0,32(sp)
    80201a22:	64e2                	ld	s1,24(sp)
    80201a24:	6942                	ld	s2,16(sp)
    80201a26:	69a2                	ld	s3,8(sp)
    80201a28:	6145                	addi	sp,sp,48
    80201a2a:	8082                	ret

0000000080201a2c <cpuid>:
{
    80201a2c:	1141                	addi	sp,sp,-16
    80201a2e:	e422                	sd	s0,8(sp)
    80201a30:	0800                	addi	s0,sp,16
  asm volatile("mv %0, tp" : "=r" (x) );
    80201a32:	8512                	mv	a0,tp
}
    80201a34:	2501                	sext.w	a0,a0
    80201a36:	6422                	ld	s0,8(sp)
    80201a38:	0141                	addi	sp,sp,16
    80201a3a:	8082                	ret

0000000080201a3c <mycpu>:
{
    80201a3c:	1141                	addi	sp,sp,-16
    80201a3e:	e422                	sd	s0,8(sp)
    80201a40:	0800                	addi	s0,sp,16
    80201a42:	8792                	mv	a5,tp
  struct cpu *c = &cpus[id];
    80201a44:	2781                	sext.w	a5,a5
    80201a46:	079e                	slli	a5,a5,0x7
}
    80201a48:	00014517          	auipc	a0,0x14
    80201a4c:	63050513          	addi	a0,a0,1584 # 80216078 <cpus>
    80201a50:	953e                	add	a0,a0,a5
    80201a52:	6422                	ld	s0,8(sp)
    80201a54:	0141                	addi	sp,sp,16
    80201a56:	8082                	ret

0000000080201a58 <myproc>:
{
    80201a58:	1101                	addi	sp,sp,-32
    80201a5a:	ec06                	sd	ra,24(sp)
    80201a5c:	e822                	sd	s0,16(sp)
    80201a5e:	e426                	sd	s1,8(sp)
    80201a60:	1000                	addi	s0,sp,32
  push_off();
    80201a62:	fffff097          	auipc	ra,0xfffff
    80201a66:	b76080e7          	jalr	-1162(ra) # 802005d8 <push_off>
    80201a6a:	8792                	mv	a5,tp
  struct proc *p = c->proc;
    80201a6c:	2781                	sext.w	a5,a5
    80201a6e:	079e                	slli	a5,a5,0x7
    80201a70:	00014717          	auipc	a4,0x14
    80201a74:	5f070713          	addi	a4,a4,1520 # 80216060 <pid_lock>
    80201a78:	97ba                	add	a5,a5,a4
    80201a7a:	6f84                	ld	s1,24(a5)
  pop_off();
    80201a7c:	fffff097          	auipc	ra,0xfffff
    80201a80:	ba8080e7          	jalr	-1112(ra) # 80200624 <pop_off>
}
    80201a84:	8526                	mv	a0,s1
    80201a86:	60e2                	ld	ra,24(sp)
    80201a88:	6442                	ld	s0,16(sp)
    80201a8a:	64a2                	ld	s1,8(sp)
    80201a8c:	6105                	addi	sp,sp,32
    80201a8e:	8082                	ret

0000000080201a90 <forkret>:
{
    80201a90:	1101                	addi	sp,sp,-32
    80201a92:	ec06                	sd	ra,24(sp)
    80201a94:	e822                	sd	s0,16(sp)
    80201a96:	e426                	sd	s1,8(sp)
    80201a98:	1000                	addi	s0,sp,32
  release(&myproc()->lock);
    80201a9a:	00000097          	auipc	ra,0x0
    80201a9e:	fbe080e7          	jalr	-66(ra) # 80201a58 <myproc>
    80201aa2:	fffff097          	auipc	ra,0xfffff
    80201aa6:	c7a080e7          	jalr	-902(ra) # 8020071c <release>
  if (first)
    80201aaa:	00009797          	auipc	a5,0x9
    80201aae:	5567a783          	lw	a5,1366(a5) # 8020b000 <first.1691>
    80201ab2:	eb91                	bnez	a5,80201ac6 <forkret+0x36>
  usertrapret();
    80201ab4:	00001097          	auipc	ra,0x1
    80201ab8:	d9a080e7          	jalr	-614(ra) # 8020284e <usertrapret>
}
    80201abc:	60e2                	ld	ra,24(sp)
    80201abe:	6442                	ld	s0,16(sp)
    80201ac0:	64a2                	ld	s1,8(sp)
    80201ac2:	6105                	addi	sp,sp,32
    80201ac4:	8082                	ret
    first = 0;
    80201ac6:	00009797          	auipc	a5,0x9
    80201aca:	5207ad23          	sw	zero,1338(a5) # 8020b000 <first.1691>
    fat32_init();
    80201ace:	00005097          	auipc	ra,0x5
    80201ad2:	ab4080e7          	jalr	-1356(ra) # 80206582 <fat32_init>
    myproc()->cwd = ename("/");
    80201ad6:	00000097          	auipc	ra,0x0
    80201ada:	f82080e7          	jalr	-126(ra) # 80201a58 <myproc>
    80201ade:	84aa                	mv	s1,a0
    80201ae0:	00009517          	auipc	a0,0x9
    80201ae4:	b5050513          	addi	a0,a0,-1200 # 8020a630 <digits+0x2b0>
    80201ae8:	00006097          	auipc	ra,0x6
    80201aec:	cf4080e7          	jalr	-780(ra) # 802077dc <ename>
    80201af0:	4ca4bc23          	sd	a0,1240(s1)
    80201af4:	b7c1                	j	80201ab4 <forkret+0x24>

0000000080201af6 <allocpid>:
{
    80201af6:	1101                	addi	sp,sp,-32
    80201af8:	ec06                	sd	ra,24(sp)
    80201afa:	e822                	sd	s0,16(sp)
    80201afc:	e426                	sd	s1,8(sp)
    80201afe:	e04a                	sd	s2,0(sp)
    80201b00:	1000                	addi	s0,sp,32
  acquire(&pid_lock);
    80201b02:	00014917          	auipc	s2,0x14
    80201b06:	55e90913          	addi	s2,s2,1374 # 80216060 <pid_lock>
    80201b0a:	854a                	mv	a0,s2
    80201b0c:	fffff097          	auipc	ra,0xfffff
    80201b10:	bbc080e7          	jalr	-1092(ra) # 802006c8 <acquire>
  pid = nextpid;
    80201b14:	00009797          	auipc	a5,0x9
    80201b18:	4ec78793          	addi	a5,a5,1260 # 8020b000 <first.1691>
    80201b1c:	43c4                	lw	s1,4(a5)
  nextpid = nextpid + 1;
    80201b1e:	0014871b          	addiw	a4,s1,1
    80201b22:	c3d8                	sw	a4,4(a5)
  release(&pid_lock);
    80201b24:	854a                	mv	a0,s2
    80201b26:	fffff097          	auipc	ra,0xfffff
    80201b2a:	bf6080e7          	jalr	-1034(ra) # 8020071c <release>
}
    80201b2e:	8526                	mv	a0,s1
    80201b30:	60e2                	ld	ra,24(sp)
    80201b32:	6442                	ld	s0,16(sp)
    80201b34:	64a2                	ld	s1,8(sp)
    80201b36:	6902                	ld	s2,0(sp)
    80201b38:	6105                	addi	sp,sp,32
    80201b3a:	8082                	ret

0000000080201b3c <proc_pagetable>:
{
    80201b3c:	1101                	addi	sp,sp,-32
    80201b3e:	ec06                	sd	ra,24(sp)
    80201b40:	e822                	sd	s0,16(sp)
    80201b42:	e426                	sd	s1,8(sp)
    80201b44:	e04a                	sd	s2,0(sp)
    80201b46:	1000                	addi	s0,sp,32
    80201b48:	892a                	mv	s2,a0
  pagetable = uvmcreate();
    80201b4a:	fffff097          	auipc	ra,0xfffff
    80201b4e:	3aa080e7          	jalr	938(ra) # 80200ef4 <uvmcreate>
    80201b52:	84aa                	mv	s1,a0
  if (pagetable == 0)
    80201b54:	c121                	beqz	a0,80201b94 <proc_pagetable+0x58>
  if (mappages(pagetable, TRAMPOLINE, PGSIZE,
    80201b56:	4729                	li	a4,10
    80201b58:	0000b697          	auipc	a3,0xb
    80201b5c:	5606b683          	ld	a3,1376(a3) # 8020d0b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201b60:	6605                	lui	a2,0x1
    80201b62:	040005b7          	lui	a1,0x4000
    80201b66:	15fd                	addi	a1,a1,-1
    80201b68:	05b2                	slli	a1,a1,0xc
    80201b6a:	fffff097          	auipc	ra,0xfffff
    80201b6e:	10c080e7          	jalr	268(ra) # 80200c76 <mappages>
    80201b72:	02054863          	bltz	a0,80201ba2 <proc_pagetable+0x66>
  if (mappages(pagetable, TRAPFRAME, PGSIZE,
    80201b76:	4719                	li	a4,6
    80201b78:	06093683          	ld	a3,96(s2)
    80201b7c:	6605                	lui	a2,0x1
    80201b7e:	020005b7          	lui	a1,0x2000
    80201b82:	15fd                	addi	a1,a1,-1
    80201b84:	05b6                	slli	a1,a1,0xd
    80201b86:	8526                	mv	a0,s1
    80201b88:	fffff097          	auipc	ra,0xfffff
    80201b8c:	0ee080e7          	jalr	238(ra) # 80200c76 <mappages>
    80201b90:	02054163          	bltz	a0,80201bb2 <proc_pagetable+0x76>
}
    80201b94:	8526                	mv	a0,s1
    80201b96:	60e2                	ld	ra,24(sp)
    80201b98:	6442                	ld	s0,16(sp)
    80201b9a:	64a2                	ld	s1,8(sp)
    80201b9c:	6902                	ld	s2,0(sp)
    80201b9e:	6105                	addi	sp,sp,32
    80201ba0:	8082                	ret
    uvmfree(pagetable, 0);
    80201ba2:	4581                	li	a1,0
    80201ba4:	8526                	mv	a0,s1
    80201ba6:	fffff097          	auipc	ra,0xfffff
    80201baa:	5d2080e7          	jalr	1490(ra) # 80201178 <uvmfree>
    return NULL;
    80201bae:	4481                	li	s1,0
    80201bb0:	b7d5                	j	80201b94 <proc_pagetable+0x58>
    vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201bb2:	4681                	li	a3,0
    80201bb4:	4605                	li	a2,1
    80201bb6:	040005b7          	lui	a1,0x4000
    80201bba:	15fd                	addi	a1,a1,-1
    80201bbc:	05b2                	slli	a1,a1,0xc
    80201bbe:	8526                	mv	a0,s1
    80201bc0:	fffff097          	auipc	ra,0xfffff
    80201bc4:	270080e7          	jalr	624(ra) # 80200e30 <vmunmap>
    uvmfree(pagetable, 0);
    80201bc8:	4581                	li	a1,0
    80201bca:	8526                	mv	a0,s1
    80201bcc:	fffff097          	auipc	ra,0xfffff
    80201bd0:	5ac080e7          	jalr	1452(ra) # 80201178 <uvmfree>
    return NULL;
    80201bd4:	4481                	li	s1,0
    80201bd6:	bf7d                	j	80201b94 <proc_pagetable+0x58>

0000000080201bd8 <proc_freepagetable>:
{
    80201bd8:	1101                	addi	sp,sp,-32
    80201bda:	ec06                	sd	ra,24(sp)
    80201bdc:	e822                	sd	s0,16(sp)
    80201bde:	e426                	sd	s1,8(sp)
    80201be0:	e04a                	sd	s2,0(sp)
    80201be2:	1000                	addi	s0,sp,32
    80201be4:	84aa                	mv	s1,a0
    80201be6:	892e                	mv	s2,a1
  vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201be8:	4681                	li	a3,0
    80201bea:	4605                	li	a2,1
    80201bec:	040005b7          	lui	a1,0x4000
    80201bf0:	15fd                	addi	a1,a1,-1
    80201bf2:	05b2                	slli	a1,a1,0xc
    80201bf4:	fffff097          	auipc	ra,0xfffff
    80201bf8:	23c080e7          	jalr	572(ra) # 80200e30 <vmunmap>
  vmunmap(pagetable, TRAPFRAME, 1, 0);
    80201bfc:	4681                	li	a3,0
    80201bfe:	4605                	li	a2,1
    80201c00:	020005b7          	lui	a1,0x2000
    80201c04:	15fd                	addi	a1,a1,-1
    80201c06:	05b6                	slli	a1,a1,0xd
    80201c08:	8526                	mv	a0,s1
    80201c0a:	fffff097          	auipc	ra,0xfffff
    80201c0e:	226080e7          	jalr	550(ra) # 80200e30 <vmunmap>
  uvmfree(pagetable, sz);
    80201c12:	85ca                	mv	a1,s2
    80201c14:	8526                	mv	a0,s1
    80201c16:	fffff097          	auipc	ra,0xfffff
    80201c1a:	562080e7          	jalr	1378(ra) # 80201178 <uvmfree>
}
    80201c1e:	60e2                	ld	ra,24(sp)
    80201c20:	6442                	ld	s0,16(sp)
    80201c22:	64a2                	ld	s1,8(sp)
    80201c24:	6902                	ld	s2,0(sp)
    80201c26:	6105                	addi	sp,sp,32
    80201c28:	8082                	ret

0000000080201c2a <freeproc>:
{
    80201c2a:	1101                	addi	sp,sp,-32
    80201c2c:	ec06                	sd	ra,24(sp)
    80201c2e:	e822                	sd	s0,16(sp)
    80201c30:	e426                	sd	s1,8(sp)
    80201c32:	1000                	addi	s0,sp,32
    80201c34:	84aa                	mv	s1,a0
  if (p->trapframe)
    80201c36:	7128                	ld	a0,96(a0)
    80201c38:	c509                	beqz	a0,80201c42 <freeproc+0x18>
    kfree((void *)p->trapframe);
    80201c3a:	fffff097          	auipc	ra,0xfffff
    80201c3e:	80a080e7          	jalr	-2038(ra) # 80200444 <kfree>
  p->trapframe = 0;
    80201c42:	0604b023          	sd	zero,96(s1)
  if (p->kpagetable)
    80201c46:	6ca8                	ld	a0,88(s1)
    80201c48:	c511                	beqz	a0,80201c54 <freeproc+0x2a>
    kvmfree(p->kpagetable, 1);
    80201c4a:	4585                	li	a1,1
    80201c4c:	00000097          	auipc	ra,0x0
    80201c50:	a32080e7          	jalr	-1486(ra) # 8020167e <kvmfree>
  p->kpagetable = 0;
    80201c54:	0404bc23          	sd	zero,88(s1)
  if (p->pagetable)
    80201c58:	68a8                	ld	a0,80(s1)
    80201c5a:	c511                	beqz	a0,80201c66 <freeproc+0x3c>
    proc_freepagetable(p->pagetable, p->sz);
    80201c5c:	64ac                	ld	a1,72(s1)
    80201c5e:	00000097          	auipc	ra,0x0
    80201c62:	f7a080e7          	jalr	-134(ra) # 80201bd8 <proc_freepagetable>
  p->pagetable = 0;
    80201c66:	0404b823          	sd	zero,80(s1)
  p->sz = 0;
    80201c6a:	0404b423          	sd	zero,72(s1)
  p->pid = 0;
    80201c6e:	0204ac23          	sw	zero,56(s1)
  p->parent = 0;
    80201c72:	0204b023          	sd	zero,32(s1)
  p->name[0] = 0;
    80201c76:	4e048023          	sb	zero,1248(s1)
  p->chan = 0;
    80201c7a:	0204b423          	sd	zero,40(s1)
  p->killed = 0;
    80201c7e:	0204a823          	sw	zero,48(s1)
  p->xstate = 0;
    80201c82:	0204aa23          	sw	zero,52(s1)
  p->state = UNUSED;
    80201c86:	0004ac23          	sw	zero,24(s1)
}
    80201c8a:	60e2                	ld	ra,24(sp)
    80201c8c:	6442                	ld	s0,16(sp)
    80201c8e:	64a2                	ld	s1,8(sp)
    80201c90:	6105                	addi	sp,sp,32
    80201c92:	8082                	ret

0000000080201c94 <allocproc>:
{
    80201c94:	1101                	addi	sp,sp,-32
    80201c96:	ec06                	sd	ra,24(sp)
    80201c98:	e822                	sd	s0,16(sp)
    80201c9a:	e426                	sd	s1,8(sp)
    80201c9c:	e04a                	sd	s2,0(sp)
    80201c9e:	1000                	addi	s0,sp,32
  for (p = proc; p < &proc[NPROC]; p++)
    80201ca0:	00014497          	auipc	s1,0x14
    80201ca4:	4e048493          	addi	s1,s1,1248 # 80216180 <proc>
    80201ca8:	00024917          	auipc	s2,0x24
    80201cac:	d4890913          	addi	s2,s2,-696 # 802259f0 <bcache>
    acquire(&p->lock);
    80201cb0:	8526                	mv	a0,s1
    80201cb2:	fffff097          	auipc	ra,0xfffff
    80201cb6:	a16080e7          	jalr	-1514(ra) # 802006c8 <acquire>
    if (p->state == UNUSED)
    80201cba:	4c9c                	lw	a5,24(s1)
    80201cbc:	cf81                	beqz	a5,80201cd4 <allocproc+0x40>
      release(&p->lock);
    80201cbe:	8526                	mv	a0,s1
    80201cc0:	fffff097          	auipc	ra,0xfffff
    80201cc4:	a5c080e7          	jalr	-1444(ra) # 8020071c <release>
  for (p = proc; p < &proc[NPROC]; p++)
    80201cc8:	4f848493          	addi	s1,s1,1272
    80201ccc:	ff2492e3          	bne	s1,s2,80201cb0 <allocproc+0x1c>
  return NULL;
    80201cd0:	4481                	li	s1,0
    80201cd2:	a085                	j	80201d32 <allocproc+0x9e>
  p->pid = allocpid();
    80201cd4:	00000097          	auipc	ra,0x0
    80201cd8:	e22080e7          	jalr	-478(ra) # 80201af6 <allocpid>
    80201cdc:	dc88                	sw	a0,56(s1)
  if ((p->trapframe = (struct trapframe *)kalloc()) == NULL)
    80201cde:	fffff097          	auipc	ra,0xfffff
    80201ce2:	87e080e7          	jalr	-1922(ra) # 8020055c <kalloc>
    80201ce6:	892a                	mv	s2,a0
    80201ce8:	f0a8                	sd	a0,96(s1)
    80201cea:	c939                	beqz	a0,80201d40 <allocproc+0xac>
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201cec:	8526                	mv	a0,s1
    80201cee:	00000097          	auipc	ra,0x0
    80201cf2:	e4e080e7          	jalr	-434(ra) # 80201b3c <proc_pagetable>
    80201cf6:	e8a8                	sd	a0,80(s1)
    80201cf8:	c939                	beqz	a0,80201d4e <allocproc+0xba>
      (p->kpagetable = proc_kpagetable()) == NULL)
    80201cfa:	00000097          	auipc	ra,0x0
    80201cfe:	9de080e7          	jalr	-1570(ra) # 802016d8 <proc_kpagetable>
    80201d02:	eca8                	sd	a0,88(s1)
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201d04:	c529                	beqz	a0,80201d4e <allocproc+0xba>
  p->kstack = VKSTACK;
    80201d06:	0fb00793          	li	a5,251
    80201d0a:	07fa                	slli	a5,a5,0x1e
    80201d0c:	e0bc                	sd	a5,64(s1)
  memset(&p->context, 0, sizeof(p->context));
    80201d0e:	07000613          	li	a2,112
    80201d12:	4581                	li	a1,0
    80201d14:	06848513          	addi	a0,s1,104
    80201d18:	fffff097          	auipc	ra,0xfffff
    80201d1c:	a4c080e7          	jalr	-1460(ra) # 80200764 <memset>
  p->context.ra = (uint64)forkret;
    80201d20:	00000797          	auipc	a5,0x0
    80201d24:	d7078793          	addi	a5,a5,-656 # 80201a90 <forkret>
    80201d28:	f4bc                	sd	a5,104(s1)
  p->context.sp = p->kstack + PGSIZE;
    80201d2a:	60bc                	ld	a5,64(s1)
    80201d2c:	6705                	lui	a4,0x1
    80201d2e:	97ba                	add	a5,a5,a4
    80201d30:	f8bc                	sd	a5,112(s1)
}
    80201d32:	8526                	mv	a0,s1
    80201d34:	60e2                	ld	ra,24(sp)
    80201d36:	6442                	ld	s0,16(sp)
    80201d38:	64a2                	ld	s1,8(sp)
    80201d3a:	6902                	ld	s2,0(sp)
    80201d3c:	6105                	addi	sp,sp,32
    80201d3e:	8082                	ret
    release(&p->lock);
    80201d40:	8526                	mv	a0,s1
    80201d42:	fffff097          	auipc	ra,0xfffff
    80201d46:	9da080e7          	jalr	-1574(ra) # 8020071c <release>
    return NULL;
    80201d4a:	84ca                	mv	s1,s2
    80201d4c:	b7dd                	j	80201d32 <allocproc+0x9e>
    freeproc(p);
    80201d4e:	8526                	mv	a0,s1
    80201d50:	00000097          	auipc	ra,0x0
    80201d54:	eda080e7          	jalr	-294(ra) # 80201c2a <freeproc>
    release(&p->lock);
    80201d58:	8526                	mv	a0,s1
    80201d5a:	fffff097          	auipc	ra,0xfffff
    80201d5e:	9c2080e7          	jalr	-1598(ra) # 8020071c <release>
    return NULL;
    80201d62:	4481                	li	s1,0
    80201d64:	b7f9                	j	80201d32 <allocproc+0x9e>

0000000080201d66 <userinit>:
{
    80201d66:	1101                	addi	sp,sp,-32
    80201d68:	ec06                	sd	ra,24(sp)
    80201d6a:	e822                	sd	s0,16(sp)
    80201d6c:	e426                	sd	s1,8(sp)
    80201d6e:	1000                	addi	s0,sp,32
  p = allocproc();
    80201d70:	00000097          	auipc	ra,0x0
    80201d74:	f24080e7          	jalr	-220(ra) # 80201c94 <allocproc>
    80201d78:	84aa                	mv	s1,a0
  initproc = p;
    80201d7a:	00014797          	auipc	a5,0x14
    80201d7e:	3ea7bf23          	sd	a0,1022(a5) # 80216178 <initproc>
  uvminit(p->pagetable, p->kpagetable, initcode, sizeof(initcode));
    80201d82:	03400693          	li	a3,52
    80201d86:	00009617          	auipc	a2,0x9
    80201d8a:	28260613          	addi	a2,a2,642 # 8020b008 <initcode>
    80201d8e:	6d2c                	ld	a1,88(a0)
    80201d90:	6928                	ld	a0,80(a0)
    80201d92:	fffff097          	auipc	ra,0xfffff
    80201d96:	190080e7          	jalr	400(ra) # 80200f22 <uvminit>
  p->sz = PGSIZE;
    80201d9a:	6785                	lui	a5,0x1
    80201d9c:	e4bc                	sd	a5,72(s1)
  p->trapframe->epc = 0x0;   // user program counter
    80201d9e:	70b8                	ld	a4,96(s1)
    80201da0:	00073c23          	sd	zero,24(a4) # 1018 <_entry-0x801fefe8>
  p->trapframe->sp = PGSIZE; // user stack pointer
    80201da4:	70b8                	ld	a4,96(s1)
    80201da6:	fb1c                	sd	a5,48(a4)
  safestrcpy(p->name, "initcode", sizeof(p->name));
    80201da8:	4641                	li	a2,16
    80201daa:	00009597          	auipc	a1,0x9
    80201dae:	88e58593          	addi	a1,a1,-1906 # 8020a638 <digits+0x2b8>
    80201db2:	4e048513          	addi	a0,s1,1248
    80201db6:	fffff097          	auipc	ra,0xfffff
    80201dba:	b04080e7          	jalr	-1276(ra) # 802008ba <safestrcpy>
  p->state = RUNNABLE;
    80201dbe:	4789                	li	a5,2
    80201dc0:	cc9c                	sw	a5,24(s1)
  p->tmask = 0;
    80201dc2:	4e04a823          	sw	zero,1264(s1)
  release(&p->lock);
    80201dc6:	8526                	mv	a0,s1
    80201dc8:	fffff097          	auipc	ra,0xfffff
    80201dcc:	954080e7          	jalr	-1708(ra) # 8020071c <release>
}
    80201dd0:	60e2                	ld	ra,24(sp)
    80201dd2:	6442                	ld	s0,16(sp)
    80201dd4:	64a2                	ld	s1,8(sp)
    80201dd6:	6105                	addi	sp,sp,32
    80201dd8:	8082                	ret

0000000080201dda <growproc>:
{
    80201dda:	1101                	addi	sp,sp,-32
    80201ddc:	ec06                	sd	ra,24(sp)
    80201dde:	e822                	sd	s0,16(sp)
    80201de0:	e426                	sd	s1,8(sp)
    80201de2:	e04a                	sd	s2,0(sp)
    80201de4:	1000                	addi	s0,sp,32
    80201de6:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80201de8:	00000097          	auipc	ra,0x0
    80201dec:	c70080e7          	jalr	-912(ra) # 80201a58 <myproc>
    80201df0:	892a                	mv	s2,a0
  sz = p->sz;
    80201df2:	6530                	ld	a2,72(a0)
    80201df4:	0006069b          	sext.w	a3,a2
  if (n > 0)
    80201df8:	00904f63          	bgtz	s1,80201e16 <growproc+0x3c>
  else if (n < 0)
    80201dfc:	0204cd63          	bltz	s1,80201e36 <growproc+0x5c>
  p->sz = sz;
    80201e00:	1682                	slli	a3,a3,0x20
    80201e02:	9281                	srli	a3,a3,0x20
    80201e04:	04d93423          	sd	a3,72(s2)
  return 0;
    80201e08:	4501                	li	a0,0
}
    80201e0a:	60e2                	ld	ra,24(sp)
    80201e0c:	6442                	ld	s0,16(sp)
    80201e0e:	64a2                	ld	s1,8(sp)
    80201e10:	6902                	ld	s2,0(sp)
    80201e12:	6105                	addi	sp,sp,32
    80201e14:	8082                	ret
    if ((sz = uvmalloc(p->pagetable, p->kpagetable, sz, sz + n)) == 0)
    80201e16:	9ea5                	addw	a3,a3,s1
    80201e18:	1682                	slli	a3,a3,0x20
    80201e1a:	9281                	srli	a3,a3,0x20
    80201e1c:	1602                	slli	a2,a2,0x20
    80201e1e:	9201                	srli	a2,a2,0x20
    80201e20:	6d2c                	ld	a1,88(a0)
    80201e22:	6928                	ld	a0,80(a0)
    80201e24:	fffff097          	auipc	ra,0xfffff
    80201e28:	1f4080e7          	jalr	500(ra) # 80201018 <uvmalloc>
    80201e2c:	0005069b          	sext.w	a3,a0
    80201e30:	fae1                	bnez	a3,80201e00 <growproc+0x26>
      return -1;
    80201e32:	557d                	li	a0,-1
    80201e34:	bfd9                	j	80201e0a <growproc+0x30>
    sz = uvmdealloc(p->pagetable, p->kpagetable, sz, sz + n);
    80201e36:	9ea5                	addw	a3,a3,s1
    80201e38:	1682                	slli	a3,a3,0x20
    80201e3a:	9281                	srli	a3,a3,0x20
    80201e3c:	1602                	slli	a2,a2,0x20
    80201e3e:	9201                	srli	a2,a2,0x20
    80201e40:	6d2c                	ld	a1,88(a0)
    80201e42:	6928                	ld	a0,80(a0)
    80201e44:	fffff097          	auipc	ra,0xfffff
    80201e48:	168080e7          	jalr	360(ra) # 80200fac <uvmdealloc>
    80201e4c:	0005069b          	sext.w	a3,a0
    80201e50:	bf45                	j	80201e00 <growproc+0x26>

0000000080201e52 <fork>:
{
    80201e52:	7179                	addi	sp,sp,-48
    80201e54:	f406                	sd	ra,40(sp)
    80201e56:	f022                	sd	s0,32(sp)
    80201e58:	ec26                	sd	s1,24(sp)
    80201e5a:	e84a                	sd	s2,16(sp)
    80201e5c:	e44e                	sd	s3,8(sp)
    80201e5e:	e052                	sd	s4,0(sp)
    80201e60:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80201e62:	00000097          	auipc	ra,0x0
    80201e66:	bf6080e7          	jalr	-1034(ra) # 80201a58 <myproc>
    80201e6a:	892a                	mv	s2,a0
  if ((np = allocproc()) == NULL)
    80201e6c:	00000097          	auipc	ra,0x0
    80201e70:	e28080e7          	jalr	-472(ra) # 80201c94 <allocproc>
    80201e74:	c57d                	beqz	a0,80201f62 <fork+0x110>
    80201e76:	8a2a                	mv	s4,a0
  if (uvmcopy(p->pagetable, np->pagetable, np->kpagetable, p->sz) < 0)
    80201e78:	04893683          	ld	a3,72(s2)
    80201e7c:	6d30                	ld	a2,88(a0)
    80201e7e:	692c                	ld	a1,80(a0)
    80201e80:	05093503          	ld	a0,80(s2)
    80201e84:	fffff097          	auipc	ra,0xfffff
    80201e88:	32c080e7          	jalr	812(ra) # 802011b0 <uvmcopy>
    80201e8c:	04054c63          	bltz	a0,80201ee4 <fork+0x92>
  np->sz = p->sz;
    80201e90:	04893783          	ld	a5,72(s2)
    80201e94:	04fa3423          	sd	a5,72(s4)
  np->parent = p;
    80201e98:	032a3023          	sd	s2,32(s4)
  np->tmask = p->tmask;
    80201e9c:	4f092783          	lw	a5,1264(s2)
    80201ea0:	4efa2823          	sw	a5,1264(s4)
  *(np->trapframe) = *(p->trapframe);
    80201ea4:	06093683          	ld	a3,96(s2)
    80201ea8:	87b6                	mv	a5,a3
    80201eaa:	060a3703          	ld	a4,96(s4)
    80201eae:	12068693          	addi	a3,a3,288
    80201eb2:	0007b803          	ld	a6,0(a5) # 1000 <_entry-0x801ff000>
    80201eb6:	6788                	ld	a0,8(a5)
    80201eb8:	6b8c                	ld	a1,16(a5)
    80201eba:	6f90                	ld	a2,24(a5)
    80201ebc:	01073023          	sd	a6,0(a4)
    80201ec0:	e708                	sd	a0,8(a4)
    80201ec2:	eb0c                	sd	a1,16(a4)
    80201ec4:	ef10                	sd	a2,24(a4)
    80201ec6:	02078793          	addi	a5,a5,32
    80201eca:	02070713          	addi	a4,a4,32
    80201ece:	fed792e3          	bne	a5,a3,80201eb2 <fork+0x60>
  np->trapframe->a0 = 0;
    80201ed2:	060a3783          	ld	a5,96(s4)
    80201ed6:	0607b823          	sd	zero,112(a5)
    80201eda:	0d800493          	li	s1,216
  for (i = 0; i < NOFILE; i++)
    80201ede:	4d800993          	li	s3,1240
    80201ee2:	a03d                	j	80201f10 <fork+0xbe>
    freeproc(np);
    80201ee4:	8552                	mv	a0,s4
    80201ee6:	00000097          	auipc	ra,0x0
    80201eea:	d44080e7          	jalr	-700(ra) # 80201c2a <freeproc>
    release(&np->lock);
    80201eee:	8552                	mv	a0,s4
    80201ef0:	fffff097          	auipc	ra,0xfffff
    80201ef4:	82c080e7          	jalr	-2004(ra) # 8020071c <release>
    return -1;
    80201ef8:	54fd                	li	s1,-1
    80201efa:	a899                	j	80201f50 <fork+0xfe>
      np->ofile[i] = filedup(p->ofile[i]);
    80201efc:	00002097          	auipc	ra,0x2
    80201f00:	e6e080e7          	jalr	-402(ra) # 80203d6a <filedup>
    80201f04:	009a07b3          	add	a5,s4,s1
    80201f08:	e388                	sd	a0,0(a5)
  for (i = 0; i < NOFILE; i++)
    80201f0a:	04a1                	addi	s1,s1,8
    80201f0c:	01348763          	beq	s1,s3,80201f1a <fork+0xc8>
    if (p->ofile[i])
    80201f10:	009907b3          	add	a5,s2,s1
    80201f14:	6388                	ld	a0,0(a5)
    80201f16:	f17d                	bnez	a0,80201efc <fork+0xaa>
    80201f18:	bfcd                	j	80201f0a <fork+0xb8>
  np->cwd = edup(p->cwd);
    80201f1a:	4d893503          	ld	a0,1240(s2)
    80201f1e:	00005097          	auipc	ra,0x5
    80201f22:	eb6080e7          	jalr	-330(ra) # 80206dd4 <edup>
    80201f26:	4caa3c23          	sd	a0,1240(s4)
  safestrcpy(np->name, p->name, sizeof(p->name));
    80201f2a:	4641                	li	a2,16
    80201f2c:	4e090593          	addi	a1,s2,1248
    80201f30:	4e0a0513          	addi	a0,s4,1248
    80201f34:	fffff097          	auipc	ra,0xfffff
    80201f38:	986080e7          	jalr	-1658(ra) # 802008ba <safestrcpy>
  pid = np->pid;
    80201f3c:	038a2483          	lw	s1,56(s4)
  np->state = RUNNABLE;
    80201f40:	4789                	li	a5,2
    80201f42:	00fa2c23          	sw	a5,24(s4)
  release(&np->lock);
    80201f46:	8552                	mv	a0,s4
    80201f48:	ffffe097          	auipc	ra,0xffffe
    80201f4c:	7d4080e7          	jalr	2004(ra) # 8020071c <release>
}
    80201f50:	8526                	mv	a0,s1
    80201f52:	70a2                	ld	ra,40(sp)
    80201f54:	7402                	ld	s0,32(sp)
    80201f56:	64e2                	ld	s1,24(sp)
    80201f58:	6942                	ld	s2,16(sp)
    80201f5a:	69a2                	ld	s3,8(sp)
    80201f5c:	6a02                	ld	s4,0(sp)
    80201f5e:	6145                	addi	sp,sp,48
    80201f60:	8082                	ret
    return -1;
    80201f62:	54fd                	li	s1,-1
    80201f64:	b7f5                	j	80201f50 <fork+0xfe>

0000000080201f66 <reparent>:
{
    80201f66:	7179                	addi	sp,sp,-48
    80201f68:	f406                	sd	ra,40(sp)
    80201f6a:	f022                	sd	s0,32(sp)
    80201f6c:	ec26                	sd	s1,24(sp)
    80201f6e:	e84a                	sd	s2,16(sp)
    80201f70:	e44e                	sd	s3,8(sp)
    80201f72:	e052                	sd	s4,0(sp)
    80201f74:	1800                	addi	s0,sp,48
    80201f76:	892a                	mv	s2,a0
  for (pp = proc; pp < &proc[NPROC]; pp++)
    80201f78:	00014497          	auipc	s1,0x14
    80201f7c:	20848493          	addi	s1,s1,520 # 80216180 <proc>
      pp->parent = initproc;
    80201f80:	00014a17          	auipc	s4,0x14
    80201f84:	0e0a0a13          	addi	s4,s4,224 # 80216060 <pid_lock>
  for (pp = proc; pp < &proc[NPROC]; pp++)
    80201f88:	00024997          	auipc	s3,0x24
    80201f8c:	a6898993          	addi	s3,s3,-1432 # 802259f0 <bcache>
    80201f90:	a029                	j	80201f9a <reparent+0x34>
    80201f92:	4f848493          	addi	s1,s1,1272
    80201f96:	03348363          	beq	s1,s3,80201fbc <reparent+0x56>
    if (pp->parent == p)
    80201f9a:	709c                	ld	a5,32(s1)
    80201f9c:	ff279be3          	bne	a5,s2,80201f92 <reparent+0x2c>
      acquire(&pp->lock);
    80201fa0:	8526                	mv	a0,s1
    80201fa2:	ffffe097          	auipc	ra,0xffffe
    80201fa6:	726080e7          	jalr	1830(ra) # 802006c8 <acquire>
      pp->parent = initproc;
    80201faa:	118a3783          	ld	a5,280(s4)
    80201fae:	f09c                	sd	a5,32(s1)
      release(&pp->lock);
    80201fb0:	8526                	mv	a0,s1
    80201fb2:	ffffe097          	auipc	ra,0xffffe
    80201fb6:	76a080e7          	jalr	1898(ra) # 8020071c <release>
    80201fba:	bfe1                	j	80201f92 <reparent+0x2c>
}
    80201fbc:	70a2                	ld	ra,40(sp)
    80201fbe:	7402                	ld	s0,32(sp)
    80201fc0:	64e2                	ld	s1,24(sp)
    80201fc2:	6942                	ld	s2,16(sp)
    80201fc4:	69a2                	ld	s3,8(sp)
    80201fc6:	6a02                	ld	s4,0(sp)
    80201fc8:	6145                	addi	sp,sp,48
    80201fca:	8082                	ret

0000000080201fcc <scheduler>:
{
    80201fcc:	715d                	addi	sp,sp,-80
    80201fce:	e486                	sd	ra,72(sp)
    80201fd0:	e0a2                	sd	s0,64(sp)
    80201fd2:	fc26                	sd	s1,56(sp)
    80201fd4:	f84a                	sd	s2,48(sp)
    80201fd6:	f44e                	sd	s3,40(sp)
    80201fd8:	f052                	sd	s4,32(sp)
    80201fda:	ec56                	sd	s5,24(sp)
    80201fdc:	e85a                	sd	s6,16(sp)
    80201fde:	e45e                	sd	s7,8(sp)
    80201fe0:	e062                	sd	s8,0(sp)
    80201fe2:	0880                	addi	s0,sp,80
    80201fe4:	8792                	mv	a5,tp
  int id = r_tp();
    80201fe6:	2781                	sext.w	a5,a5
  c->proc = 0;
    80201fe8:	00779b13          	slli	s6,a5,0x7
    80201fec:	00014717          	auipc	a4,0x14
    80201ff0:	07470713          	addi	a4,a4,116 # 80216060 <pid_lock>
    80201ff4:	975a                	add	a4,a4,s6
    80201ff6:	00073c23          	sd	zero,24(a4)
        swtch(&c->context, &p->context);
    80201ffa:	00014717          	auipc	a4,0x14
    80201ffe:	08670713          	addi	a4,a4,134 # 80216080 <cpus+0x8>
    80202002:	9b3a                	add	s6,s6,a4
        c->proc = p;
    80202004:	079e                	slli	a5,a5,0x7
    80202006:	00014a97          	auipc	s5,0x14
    8020200a:	05aa8a93          	addi	s5,s5,90 # 80216060 <pid_lock>
    8020200e:	9abe                	add	s5,s5,a5
        w_satp(MAKE_SATP(p->kpagetable));
    80202010:	5a7d                	li	s4,-1
    80202012:	1a7e                	slli	s4,s4,0x3f
        w_satp(MAKE_SATP(kernel_pagetable));
    80202014:	0000bb97          	auipc	s7,0xb
    80202018:	0ecbbb83          	ld	s7,236(s7) # 8020d100 <_GLOBAL_OFFSET_TABLE_+0x50>
    8020201c:	a8a5                	j	80202094 <scheduler+0xc8>
        p->state = RUNNING;
    8020201e:	478d                	li	a5,3
    80202020:	cc9c                	sw	a5,24(s1)
        c->proc = p;
    80202022:	009abc23          	sd	s1,24(s5)
        w_satp(MAKE_SATP(p->kpagetable));
    80202026:	6cbc                	ld	a5,88(s1)
    80202028:	83b1                	srli	a5,a5,0xc
    8020202a:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    8020202e:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    80202032:	12000073          	sfence.vma
        swtch(&c->context, &p->context);
    80202036:	06848593          	addi	a1,s1,104
    8020203a:	855a                	mv	a0,s6
    8020203c:	00000097          	auipc	ra,0x0
    80202040:	76c080e7          	jalr	1900(ra) # 802027a8 <swtch>
        w_satp(MAKE_SATP(kernel_pagetable));
    80202044:	000bb783          	ld	a5,0(s7)
    80202048:	83b1                	srli	a5,a5,0xc
    8020204a:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    8020204e:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    80202052:	12000073          	sfence.vma
        c->proc = 0;
    80202056:	000abc23          	sd	zero,24(s5)
        found = 1;
    8020205a:	4c05                	li	s8,1
      release(&p->lock);
    8020205c:	8526                	mv	a0,s1
    8020205e:	ffffe097          	auipc	ra,0xffffe
    80202062:	6be080e7          	jalr	1726(ra) # 8020071c <release>
    for (p = proc; p < &proc[NPROC]; p++)
    80202066:	4f848493          	addi	s1,s1,1272
    8020206a:	01248b63          	beq	s1,s2,80202080 <scheduler+0xb4>
      acquire(&p->lock);
    8020206e:	8526                	mv	a0,s1
    80202070:	ffffe097          	auipc	ra,0xffffe
    80202074:	658080e7          	jalr	1624(ra) # 802006c8 <acquire>
      if (p->state == RUNNABLE)
    80202078:	4c9c                	lw	a5,24(s1)
    8020207a:	ff3791e3          	bne	a5,s3,8020205c <scheduler+0x90>
    8020207e:	b745                	j	8020201e <scheduler+0x52>
    if (found == 0)
    80202080:	000c1a63          	bnez	s8,80202094 <scheduler+0xc8>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202084:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202088:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8020208c:	10079073          	csrw	sstatus,a5
      asm volatile("wfi");
    80202090:	10500073          	wfi
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202094:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202098:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8020209c:	10079073          	csrw	sstatus,a5
    int found = 0;
    802020a0:	4c01                	li	s8,0
    for (p = proc; p < &proc[NPROC]; p++)
    802020a2:	00014497          	auipc	s1,0x14
    802020a6:	0de48493          	addi	s1,s1,222 # 80216180 <proc>
      if (p->state == RUNNABLE)
    802020aa:	4989                	li	s3,2
    for (p = proc; p < &proc[NPROC]; p++)
    802020ac:	00024917          	auipc	s2,0x24
    802020b0:	94490913          	addi	s2,s2,-1724 # 802259f0 <bcache>
    802020b4:	bf6d                	j	8020206e <scheduler+0xa2>

00000000802020b6 <sched>:
{
    802020b6:	7179                	addi	sp,sp,-48
    802020b8:	f406                	sd	ra,40(sp)
    802020ba:	f022                	sd	s0,32(sp)
    802020bc:	ec26                	sd	s1,24(sp)
    802020be:	e84a                	sd	s2,16(sp)
    802020c0:	e44e                	sd	s3,8(sp)
    802020c2:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    802020c4:	00000097          	auipc	ra,0x0
    802020c8:	994080e7          	jalr	-1644(ra) # 80201a58 <myproc>
    802020cc:	84aa                	mv	s1,a0
  if (!holding(&p->lock))
    802020ce:	ffffe097          	auipc	ra,0xffffe
    802020d2:	5cc080e7          	jalr	1484(ra) # 8020069a <holding>
    802020d6:	c93d                	beqz	a0,8020214c <sched+0x96>
  asm volatile("mv %0, tp" : "=r" (x) );
    802020d8:	8792                	mv	a5,tp
  if (mycpu()->noff != 1)
    802020da:	2781                	sext.w	a5,a5
    802020dc:	079e                	slli	a5,a5,0x7
    802020de:	00014717          	auipc	a4,0x14
    802020e2:	f8270713          	addi	a4,a4,-126 # 80216060 <pid_lock>
    802020e6:	97ba                	add	a5,a5,a4
    802020e8:	0907a703          	lw	a4,144(a5)
    802020ec:	4785                	li	a5,1
    802020ee:	06f71763          	bne	a4,a5,8020215c <sched+0xa6>
  if (p->state == RUNNING)
    802020f2:	4c98                	lw	a4,24(s1)
    802020f4:	478d                	li	a5,3
    802020f6:	06f70b63          	beq	a4,a5,8020216c <sched+0xb6>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802020fa:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    802020fe:	8b89                	andi	a5,a5,2
  if (intr_get())
    80202100:	efb5                	bnez	a5,8020217c <sched+0xc6>
  asm volatile("mv %0, tp" : "=r" (x) );
    80202102:	8792                	mv	a5,tp
  intena = mycpu()->intena;
    80202104:	00014917          	auipc	s2,0x14
    80202108:	f5c90913          	addi	s2,s2,-164 # 80216060 <pid_lock>
    8020210c:	2781                	sext.w	a5,a5
    8020210e:	079e                	slli	a5,a5,0x7
    80202110:	97ca                	add	a5,a5,s2
    80202112:	0947a983          	lw	s3,148(a5)
    80202116:	8792                	mv	a5,tp
  swtch(&p->context, &mycpu()->context);
    80202118:	2781                	sext.w	a5,a5
    8020211a:	079e                	slli	a5,a5,0x7
    8020211c:	00014597          	auipc	a1,0x14
    80202120:	f6458593          	addi	a1,a1,-156 # 80216080 <cpus+0x8>
    80202124:	95be                	add	a1,a1,a5
    80202126:	06848513          	addi	a0,s1,104
    8020212a:	00000097          	auipc	ra,0x0
    8020212e:	67e080e7          	jalr	1662(ra) # 802027a8 <swtch>
    80202132:	8792                	mv	a5,tp
  mycpu()->intena = intena;
    80202134:	2781                	sext.w	a5,a5
    80202136:	079e                	slli	a5,a5,0x7
    80202138:	97ca                	add	a5,a5,s2
    8020213a:	0937aa23          	sw	s3,148(a5)
}
    8020213e:	70a2                	ld	ra,40(sp)
    80202140:	7402                	ld	s0,32(sp)
    80202142:	64e2                	ld	s1,24(sp)
    80202144:	6942                	ld	s2,16(sp)
    80202146:	69a2                	ld	s3,8(sp)
    80202148:	6145                	addi	sp,sp,48
    8020214a:	8082                	ret
    panic("sched p->lock");
    8020214c:	00008517          	auipc	a0,0x8
    80202150:	4fc50513          	addi	a0,a0,1276 # 8020a648 <digits+0x2c8>
    80202154:	ffffe097          	auipc	ra,0xffffe
    80202158:	fee080e7          	jalr	-18(ra) # 80200142 <panic>
    panic("sched locks");
    8020215c:	00008517          	auipc	a0,0x8
    80202160:	4fc50513          	addi	a0,a0,1276 # 8020a658 <digits+0x2d8>
    80202164:	ffffe097          	auipc	ra,0xffffe
    80202168:	fde080e7          	jalr	-34(ra) # 80200142 <panic>
    panic("sched running");
    8020216c:	00008517          	auipc	a0,0x8
    80202170:	4fc50513          	addi	a0,a0,1276 # 8020a668 <digits+0x2e8>
    80202174:	ffffe097          	auipc	ra,0xffffe
    80202178:	fce080e7          	jalr	-50(ra) # 80200142 <panic>
    panic("sched interruptible");
    8020217c:	00008517          	auipc	a0,0x8
    80202180:	4fc50513          	addi	a0,a0,1276 # 8020a678 <digits+0x2f8>
    80202184:	ffffe097          	auipc	ra,0xffffe
    80202188:	fbe080e7          	jalr	-66(ra) # 80200142 <panic>

000000008020218c <exit>:
{
    8020218c:	7179                	addi	sp,sp,-48
    8020218e:	f406                	sd	ra,40(sp)
    80202190:	f022                	sd	s0,32(sp)
    80202192:	ec26                	sd	s1,24(sp)
    80202194:	e84a                	sd	s2,16(sp)
    80202196:	e44e                	sd	s3,8(sp)
    80202198:	e052                	sd	s4,0(sp)
    8020219a:	1800                	addi	s0,sp,48
    8020219c:	8a2a                	mv	s4,a0
  struct proc *p = myproc();
    8020219e:	00000097          	auipc	ra,0x0
    802021a2:	8ba080e7          	jalr	-1862(ra) # 80201a58 <myproc>
    802021a6:	89aa                	mv	s3,a0
  for (int fd = 0; fd < NOFILE; fd++)
    802021a8:	0d850493          	addi	s1,a0,216
    802021ac:	4d850913          	addi	s2,a0,1240
    802021b0:	a811                	j	802021c4 <exit+0x38>
      fileclose(f);
    802021b2:	00002097          	auipc	ra,0x2
    802021b6:	c0a080e7          	jalr	-1014(ra) # 80203dbc <fileclose>
      p->ofile[fd] = 0;
    802021ba:	0004b023          	sd	zero,0(s1)
  for (int fd = 0; fd < NOFILE; fd++)
    802021be:	04a1                	addi	s1,s1,8
    802021c0:	01248563          	beq	s1,s2,802021ca <exit+0x3e>
    if (p->ofile[fd])
    802021c4:	6088                	ld	a0,0(s1)
    802021c6:	f575                	bnez	a0,802021b2 <exit+0x26>
    802021c8:	bfdd                	j	802021be <exit+0x32>
  eput(p->cwd);
    802021ca:	4d89b503          	ld	a0,1240(s3)
    802021ce:	00005097          	auipc	ra,0x5
    802021d2:	ee8080e7          	jalr	-280(ra) # 802070b6 <eput>
  p->cwd = 0;
    802021d6:	4c09bc23          	sd	zero,1240(s3)
  acquire(&initproc->lock);
    802021da:	00014497          	auipc	s1,0x14
    802021de:	e8648493          	addi	s1,s1,-378 # 80216060 <pid_lock>
    802021e2:	1184b503          	ld	a0,280(s1)
    802021e6:	ffffe097          	auipc	ra,0xffffe
    802021ea:	4e2080e7          	jalr	1250(ra) # 802006c8 <acquire>
  wakeup1(initproc);
    802021ee:	1184b503          	ld	a0,280(s1)
    802021f2:	fffff097          	auipc	ra,0xfffff
    802021f6:	67a080e7          	jalr	1658(ra) # 8020186c <wakeup1>
  release(&initproc->lock);
    802021fa:	1184b503          	ld	a0,280(s1)
    802021fe:	ffffe097          	auipc	ra,0xffffe
    80202202:	51e080e7          	jalr	1310(ra) # 8020071c <release>
  acquire(&p->lock);
    80202206:	854e                	mv	a0,s3
    80202208:	ffffe097          	auipc	ra,0xffffe
    8020220c:	4c0080e7          	jalr	1216(ra) # 802006c8 <acquire>
  struct proc *original_parent = p->parent;
    80202210:	0209b483          	ld	s1,32(s3)
  release(&p->lock);
    80202214:	854e                	mv	a0,s3
    80202216:	ffffe097          	auipc	ra,0xffffe
    8020221a:	506080e7          	jalr	1286(ra) # 8020071c <release>
  acquire(&original_parent->lock);
    8020221e:	8526                	mv	a0,s1
    80202220:	ffffe097          	auipc	ra,0xffffe
    80202224:	4a8080e7          	jalr	1192(ra) # 802006c8 <acquire>
  acquire(&p->lock);
    80202228:	854e                	mv	a0,s3
    8020222a:	ffffe097          	auipc	ra,0xffffe
    8020222e:	49e080e7          	jalr	1182(ra) # 802006c8 <acquire>
  reparent(p);
    80202232:	854e                	mv	a0,s3
    80202234:	00000097          	auipc	ra,0x0
    80202238:	d32080e7          	jalr	-718(ra) # 80201f66 <reparent>
  wakeup1(original_parent);
    8020223c:	8526                	mv	a0,s1
    8020223e:	fffff097          	auipc	ra,0xfffff
    80202242:	62e080e7          	jalr	1582(ra) # 8020186c <wakeup1>
  p->xstate=status<<8;
    80202246:	008a1a1b          	slliw	s4,s4,0x8
    8020224a:	0349aa23          	sw	s4,52(s3)
  p->state = ZOMBIE;
    8020224e:	4791                	li	a5,4
    80202250:	00f9ac23          	sw	a5,24(s3)
  release(&original_parent->lock);
    80202254:	8526                	mv	a0,s1
    80202256:	ffffe097          	auipc	ra,0xffffe
    8020225a:	4c6080e7          	jalr	1222(ra) # 8020071c <release>
  sched();
    8020225e:	00000097          	auipc	ra,0x0
    80202262:	e58080e7          	jalr	-424(ra) # 802020b6 <sched>
  panic("zombie exit");
    80202266:	00008517          	auipc	a0,0x8
    8020226a:	42a50513          	addi	a0,a0,1066 # 8020a690 <digits+0x310>
    8020226e:	ffffe097          	auipc	ra,0xffffe
    80202272:	ed4080e7          	jalr	-300(ra) # 80200142 <panic>

0000000080202276 <yield>:
{
    80202276:	1101                	addi	sp,sp,-32
    80202278:	ec06                	sd	ra,24(sp)
    8020227a:	e822                	sd	s0,16(sp)
    8020227c:	e426                	sd	s1,8(sp)
    8020227e:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    80202280:	fffff097          	auipc	ra,0xfffff
    80202284:	7d8080e7          	jalr	2008(ra) # 80201a58 <myproc>
    80202288:	84aa                	mv	s1,a0
  acquire(&p->lock);
    8020228a:	ffffe097          	auipc	ra,0xffffe
    8020228e:	43e080e7          	jalr	1086(ra) # 802006c8 <acquire>
  p->state = RUNNABLE;
    80202292:	4789                	li	a5,2
    80202294:	cc9c                	sw	a5,24(s1)
  sched();
    80202296:	00000097          	auipc	ra,0x0
    8020229a:	e20080e7          	jalr	-480(ra) # 802020b6 <sched>
  release(&p->lock);
    8020229e:	8526                	mv	a0,s1
    802022a0:	ffffe097          	auipc	ra,0xffffe
    802022a4:	47c080e7          	jalr	1148(ra) # 8020071c <release>
}
    802022a8:	60e2                	ld	ra,24(sp)
    802022aa:	6442                	ld	s0,16(sp)
    802022ac:	64a2                	ld	s1,8(sp)
    802022ae:	6105                	addi	sp,sp,32
    802022b0:	8082                	ret

00000000802022b2 <sleep>:
{
    802022b2:	7179                	addi	sp,sp,-48
    802022b4:	f406                	sd	ra,40(sp)
    802022b6:	f022                	sd	s0,32(sp)
    802022b8:	ec26                	sd	s1,24(sp)
    802022ba:	e84a                	sd	s2,16(sp)
    802022bc:	e44e                	sd	s3,8(sp)
    802022be:	1800                	addi	s0,sp,48
    802022c0:	89aa                	mv	s3,a0
    802022c2:	892e                	mv	s2,a1
  struct proc *p = myproc();
    802022c4:	fffff097          	auipc	ra,0xfffff
    802022c8:	794080e7          	jalr	1940(ra) # 80201a58 <myproc>
    802022cc:	84aa                	mv	s1,a0
  if (lk != &p->lock)
    802022ce:	05250663          	beq	a0,s2,8020231a <sleep+0x68>
    acquire(&p->lock); // DOC: sleeplock1
    802022d2:	ffffe097          	auipc	ra,0xffffe
    802022d6:	3f6080e7          	jalr	1014(ra) # 802006c8 <acquire>
    release(lk);
    802022da:	854a                	mv	a0,s2
    802022dc:	ffffe097          	auipc	ra,0xffffe
    802022e0:	440080e7          	jalr	1088(ra) # 8020071c <release>
  p->chan = chan;
    802022e4:	0334b423          	sd	s3,40(s1)
  p->state = SLEEPING;
    802022e8:	4785                	li	a5,1
    802022ea:	cc9c                	sw	a5,24(s1)
  sched();
    802022ec:	00000097          	auipc	ra,0x0
    802022f0:	dca080e7          	jalr	-566(ra) # 802020b6 <sched>
  p->chan = 0;
    802022f4:	0204b423          	sd	zero,40(s1)
    release(&p->lock);
    802022f8:	8526                	mv	a0,s1
    802022fa:	ffffe097          	auipc	ra,0xffffe
    802022fe:	422080e7          	jalr	1058(ra) # 8020071c <release>
    acquire(lk);
    80202302:	854a                	mv	a0,s2
    80202304:	ffffe097          	auipc	ra,0xffffe
    80202308:	3c4080e7          	jalr	964(ra) # 802006c8 <acquire>
}
    8020230c:	70a2                	ld	ra,40(sp)
    8020230e:	7402                	ld	s0,32(sp)
    80202310:	64e2                	ld	s1,24(sp)
    80202312:	6942                	ld	s2,16(sp)
    80202314:	69a2                	ld	s3,8(sp)
    80202316:	6145                	addi	sp,sp,48
    80202318:	8082                	ret
  p->chan = chan;
    8020231a:	03353423          	sd	s3,40(a0)
  p->state = SLEEPING;
    8020231e:	4785                	li	a5,1
    80202320:	cd1c                	sw	a5,24(a0)
  sched();
    80202322:	00000097          	auipc	ra,0x0
    80202326:	d94080e7          	jalr	-620(ra) # 802020b6 <sched>
  p->chan = 0;
    8020232a:	0204b423          	sd	zero,40(s1)
  if (lk != &p->lock)
    8020232e:	bff9                	j	8020230c <sleep+0x5a>

0000000080202330 <wait>:
{
    80202330:	715d                	addi	sp,sp,-80
    80202332:	e486                	sd	ra,72(sp)
    80202334:	e0a2                	sd	s0,64(sp)
    80202336:	fc26                	sd	s1,56(sp)
    80202338:	f84a                	sd	s2,48(sp)
    8020233a:	f44e                	sd	s3,40(sp)
    8020233c:	f052                	sd	s4,32(sp)
    8020233e:	ec56                	sd	s5,24(sp)
    80202340:	e85a                	sd	s6,16(sp)
    80202342:	e45e                	sd	s7,8(sp)
    80202344:	e062                	sd	s8,0(sp)
    80202346:	0880                	addi	s0,sp,80
    80202348:	8b2a                	mv	s6,a0
  struct proc *p = myproc();
    8020234a:	fffff097          	auipc	ra,0xfffff
    8020234e:	70e080e7          	jalr	1806(ra) # 80201a58 <myproc>
    80202352:	892a                	mv	s2,a0
  acquire(&p->lock);
    80202354:	8c2a                	mv	s8,a0
    80202356:	ffffe097          	auipc	ra,0xffffe
    8020235a:	372080e7          	jalr	882(ra) # 802006c8 <acquire>
    havekids = 0;
    8020235e:	4b81                	li	s7,0
        if (np->state == ZOMBIE)
    80202360:	4a11                	li	s4,4
    for (np = proc; np < &proc[NPROC]; np++)
    80202362:	00023997          	auipc	s3,0x23
    80202366:	68e98993          	addi	s3,s3,1678 # 802259f0 <bcache>
        havekids = 1;
    8020236a:	4a85                	li	s5,1
    havekids = 0;
    8020236c:	875e                	mv	a4,s7
    for (np = proc; np < &proc[NPROC]; np++)
    8020236e:	00014497          	auipc	s1,0x14
    80202372:	e1248493          	addi	s1,s1,-494 # 80216180 <proc>
    80202376:	a8b9                	j	802023d4 <wait+0xa4>
          pid = np->pid;
    80202378:	0384a983          	lw	s3,56(s1)
          if (addr != 0 && copyout2(addr, (char *)&np->xstate, sizeof(np->xstate)) < 0)
    8020237c:	000b0c63          	beqz	s6,80202394 <wait+0x64>
    80202380:	4611                	li	a2,4
    80202382:	03448593          	addi	a1,s1,52
    80202386:	855a                	mv	a0,s6
    80202388:	fffff097          	auipc	ra,0xfffff
    8020238c:	ff4080e7          	jalr	-12(ra) # 8020137c <copyout2>
    80202390:	02054263          	bltz	a0,802023b4 <wait+0x84>
          freeproc(np);
    80202394:	8526                	mv	a0,s1
    80202396:	00000097          	auipc	ra,0x0
    8020239a:	894080e7          	jalr	-1900(ra) # 80201c2a <freeproc>
          release(&np->lock);
    8020239e:	8526                	mv	a0,s1
    802023a0:	ffffe097          	auipc	ra,0xffffe
    802023a4:	37c080e7          	jalr	892(ra) # 8020071c <release>
          release(&p->lock);
    802023a8:	854a                	mv	a0,s2
    802023aa:	ffffe097          	auipc	ra,0xffffe
    802023ae:	372080e7          	jalr	882(ra) # 8020071c <release>
          return pid;
    802023b2:	a8a9                	j	8020240c <wait+0xdc>
            release(&np->lock);
    802023b4:	8526                	mv	a0,s1
    802023b6:	ffffe097          	auipc	ra,0xffffe
    802023ba:	366080e7          	jalr	870(ra) # 8020071c <release>
            release(&p->lock);
    802023be:	854a                	mv	a0,s2
    802023c0:	ffffe097          	auipc	ra,0xffffe
    802023c4:	35c080e7          	jalr	860(ra) # 8020071c <release>
            return -1;
    802023c8:	59fd                	li	s3,-1
    802023ca:	a089                	j	8020240c <wait+0xdc>
    for (np = proc; np < &proc[NPROC]; np++)
    802023cc:	4f848493          	addi	s1,s1,1272
    802023d0:	03348463          	beq	s1,s3,802023f8 <wait+0xc8>
      if (np->parent == p)
    802023d4:	709c                	ld	a5,32(s1)
    802023d6:	ff279be3          	bne	a5,s2,802023cc <wait+0x9c>
        acquire(&np->lock);
    802023da:	8526                	mv	a0,s1
    802023dc:	ffffe097          	auipc	ra,0xffffe
    802023e0:	2ec080e7          	jalr	748(ra) # 802006c8 <acquire>
        if (np->state == ZOMBIE)
    802023e4:	4c9c                	lw	a5,24(s1)
    802023e6:	f94789e3          	beq	a5,s4,80202378 <wait+0x48>
        release(&np->lock);
    802023ea:	8526                	mv	a0,s1
    802023ec:	ffffe097          	auipc	ra,0xffffe
    802023f0:	330080e7          	jalr	816(ra) # 8020071c <release>
        havekids = 1;
    802023f4:	8756                	mv	a4,s5
    802023f6:	bfd9                	j	802023cc <wait+0x9c>
    if (!havekids || p->killed)
    802023f8:	c701                	beqz	a4,80202400 <wait+0xd0>
    802023fa:	03092783          	lw	a5,48(s2)
    802023fe:	c785                	beqz	a5,80202426 <wait+0xf6>
      release(&p->lock);
    80202400:	854a                	mv	a0,s2
    80202402:	ffffe097          	auipc	ra,0xffffe
    80202406:	31a080e7          	jalr	794(ra) # 8020071c <release>
      return -1;
    8020240a:	59fd                	li	s3,-1
}
    8020240c:	854e                	mv	a0,s3
    8020240e:	60a6                	ld	ra,72(sp)
    80202410:	6406                	ld	s0,64(sp)
    80202412:	74e2                	ld	s1,56(sp)
    80202414:	7942                	ld	s2,48(sp)
    80202416:	79a2                	ld	s3,40(sp)
    80202418:	7a02                	ld	s4,32(sp)
    8020241a:	6ae2                	ld	s5,24(sp)
    8020241c:	6b42                	ld	s6,16(sp)
    8020241e:	6ba2                	ld	s7,8(sp)
    80202420:	6c02                	ld	s8,0(sp)
    80202422:	6161                	addi	sp,sp,80
    80202424:	8082                	ret
    sleep(p, &p->lock); // DOC: wait-sleep
    80202426:	85e2                	mv	a1,s8
    80202428:	854a                	mv	a0,s2
    8020242a:	00000097          	auipc	ra,0x0
    8020242e:	e88080e7          	jalr	-376(ra) # 802022b2 <sleep>
    havekids = 0;
    80202432:	bf2d                	j	8020236c <wait+0x3c>

0000000080202434 <wakeup>:
{
    80202434:	7139                	addi	sp,sp,-64
    80202436:	fc06                	sd	ra,56(sp)
    80202438:	f822                	sd	s0,48(sp)
    8020243a:	f426                	sd	s1,40(sp)
    8020243c:	f04a                	sd	s2,32(sp)
    8020243e:	ec4e                	sd	s3,24(sp)
    80202440:	e852                	sd	s4,16(sp)
    80202442:	e456                	sd	s5,8(sp)
    80202444:	0080                	addi	s0,sp,64
    80202446:	8a2a                	mv	s4,a0
  for (p = proc; p < &proc[NPROC]; p++)
    80202448:	00014497          	auipc	s1,0x14
    8020244c:	d3848493          	addi	s1,s1,-712 # 80216180 <proc>
    if (p->state == SLEEPING && p->chan == chan)
    80202450:	4985                	li	s3,1
      p->state = RUNNABLE;
    80202452:	4a89                	li	s5,2
  for (p = proc; p < &proc[NPROC]; p++)
    80202454:	00023917          	auipc	s2,0x23
    80202458:	59c90913          	addi	s2,s2,1436 # 802259f0 <bcache>
    8020245c:	a821                	j	80202474 <wakeup+0x40>
      p->state = RUNNABLE;
    8020245e:	0154ac23          	sw	s5,24(s1)
    release(&p->lock);
    80202462:	8526                	mv	a0,s1
    80202464:	ffffe097          	auipc	ra,0xffffe
    80202468:	2b8080e7          	jalr	696(ra) # 8020071c <release>
  for (p = proc; p < &proc[NPROC]; p++)
    8020246c:	4f848493          	addi	s1,s1,1272
    80202470:	01248e63          	beq	s1,s2,8020248c <wakeup+0x58>
    acquire(&p->lock);
    80202474:	8526                	mv	a0,s1
    80202476:	ffffe097          	auipc	ra,0xffffe
    8020247a:	252080e7          	jalr	594(ra) # 802006c8 <acquire>
    if (p->state == SLEEPING && p->chan == chan)
    8020247e:	4c9c                	lw	a5,24(s1)
    80202480:	ff3791e3          	bne	a5,s3,80202462 <wakeup+0x2e>
    80202484:	749c                	ld	a5,40(s1)
    80202486:	fd479ee3          	bne	a5,s4,80202462 <wakeup+0x2e>
    8020248a:	bfd1                	j	8020245e <wakeup+0x2a>
}
    8020248c:	70e2                	ld	ra,56(sp)
    8020248e:	7442                	ld	s0,48(sp)
    80202490:	74a2                	ld	s1,40(sp)
    80202492:	7902                	ld	s2,32(sp)
    80202494:	69e2                	ld	s3,24(sp)
    80202496:	6a42                	ld	s4,16(sp)
    80202498:	6aa2                	ld	s5,8(sp)
    8020249a:	6121                	addi	sp,sp,64
    8020249c:	8082                	ret

000000008020249e <kill>:

// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int kill(int pid)
{
    8020249e:	7179                	addi	sp,sp,-48
    802024a0:	f406                	sd	ra,40(sp)
    802024a2:	f022                	sd	s0,32(sp)
    802024a4:	ec26                	sd	s1,24(sp)
    802024a6:	e84a                	sd	s2,16(sp)
    802024a8:	e44e                	sd	s3,8(sp)
    802024aa:	1800                	addi	s0,sp,48
    802024ac:	892a                	mv	s2,a0
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++)
    802024ae:	00014497          	auipc	s1,0x14
    802024b2:	cd248493          	addi	s1,s1,-814 # 80216180 <proc>
    802024b6:	00023997          	auipc	s3,0x23
    802024ba:	53a98993          	addi	s3,s3,1338 # 802259f0 <bcache>
  {
    acquire(&p->lock);
    802024be:	8526                	mv	a0,s1
    802024c0:	ffffe097          	auipc	ra,0xffffe
    802024c4:	208080e7          	jalr	520(ra) # 802006c8 <acquire>
    if (p->pid == pid)
    802024c8:	5c9c                	lw	a5,56(s1)
    802024ca:	01278d63          	beq	a5,s2,802024e4 <kill+0x46>
        p->state = RUNNABLE;
      }
      release(&p->lock);
      return 0;
    }
    release(&p->lock);
    802024ce:	8526                	mv	a0,s1
    802024d0:	ffffe097          	auipc	ra,0xffffe
    802024d4:	24c080e7          	jalr	588(ra) # 8020071c <release>
  for (p = proc; p < &proc[NPROC]; p++)
    802024d8:	4f848493          	addi	s1,s1,1272
    802024dc:	ff3491e3          	bne	s1,s3,802024be <kill+0x20>
  }
  return -1;
    802024e0:	557d                	li	a0,-1
    802024e2:	a829                	j	802024fc <kill+0x5e>
      p->killed = 1;
    802024e4:	4785                	li	a5,1
    802024e6:	d89c                	sw	a5,48(s1)
      if (p->state == SLEEPING)
    802024e8:	4c98                	lw	a4,24(s1)
    802024ea:	4785                	li	a5,1
    802024ec:	00f70f63          	beq	a4,a5,8020250a <kill+0x6c>
      release(&p->lock);
    802024f0:	8526                	mv	a0,s1
    802024f2:	ffffe097          	auipc	ra,0xffffe
    802024f6:	22a080e7          	jalr	554(ra) # 8020071c <release>
      return 0;
    802024fa:	4501                	li	a0,0
}
    802024fc:	70a2                	ld	ra,40(sp)
    802024fe:	7402                	ld	s0,32(sp)
    80202500:	64e2                	ld	s1,24(sp)
    80202502:	6942                	ld	s2,16(sp)
    80202504:	69a2                	ld	s3,8(sp)
    80202506:	6145                	addi	sp,sp,48
    80202508:	8082                	ret
        p->state = RUNNABLE;
    8020250a:	4789                	li	a5,2
    8020250c:	cc9c                	sw	a5,24(s1)
    8020250e:	b7cd                	j	802024f0 <kill+0x52>

0000000080202510 <either_copyout>:

// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    80202510:	1101                	addi	sp,sp,-32
    80202512:	ec06                	sd	ra,24(sp)
    80202514:	e822                	sd	s0,16(sp)
    80202516:	e426                	sd	s1,8(sp)
    80202518:	1000                	addi	s0,sp,32
    8020251a:	84aa                	mv	s1,a0
    8020251c:	852e                	mv	a0,a1
    8020251e:	85b2                	mv	a1,a2
    80202520:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if (user_dst)
    80202522:	c891                	beqz	s1,80202536 <either_copyout+0x26>
  {
    // return copyout(p->pagetable, dst, src, len);
    return copyout2(dst, src, len);
    80202524:	fffff097          	auipc	ra,0xfffff
    80202528:	e58080e7          	jalr	-424(ra) # 8020137c <copyout2>
  else
  {
    memmove((char *)dst, src, len);
    return 0;
  }
}
    8020252c:	60e2                	ld	ra,24(sp)
    8020252e:	6442                	ld	s0,16(sp)
    80202530:	64a2                	ld	s1,8(sp)
    80202532:	6105                	addi	sp,sp,32
    80202534:	8082                	ret
    memmove((char *)dst, src, len);
    80202536:	0006861b          	sext.w	a2,a3
    8020253a:	ffffe097          	auipc	ra,0xffffe
    8020253e:	28a080e7          	jalr	650(ra) # 802007c4 <memmove>
    return 0;
    80202542:	8526                	mv	a0,s1
    80202544:	b7e5                	j	8020252c <either_copyout+0x1c>

0000000080202546 <either_copyin>:

// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    80202546:	1101                	addi	sp,sp,-32
    80202548:	ec06                	sd	ra,24(sp)
    8020254a:	e822                	sd	s0,16(sp)
    8020254c:	e426                	sd	s1,8(sp)
    8020254e:	1000                	addi	s0,sp,32
    80202550:	84ae                	mv	s1,a1
    80202552:	85b2                	mv	a1,a2
    80202554:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if (user_src)
    80202556:	c891                	beqz	s1,8020256a <either_copyin+0x24>
  {
    // return copyin(p->pagetable, dst, src, len);
    return copyin2(dst, src, len);
    80202558:	fffff097          	auipc	ra,0xfffff
    8020255c:	f02080e7          	jalr	-254(ra) # 8020145a <copyin2>
  else
  {
    memmove(dst, (char *)src, len);
    return 0;
  }
}
    80202560:	60e2                	ld	ra,24(sp)
    80202562:	6442                	ld	s0,16(sp)
    80202564:	64a2                	ld	s1,8(sp)
    80202566:	6105                	addi	sp,sp,32
    80202568:	8082                	ret
    memmove(dst, (char *)src, len);
    8020256a:	0006861b          	sext.w	a2,a3
    8020256e:	ffffe097          	auipc	ra,0xffffe
    80202572:	256080e7          	jalr	598(ra) # 802007c4 <memmove>
    return 0;
    80202576:	8526                	mv	a0,s1
    80202578:	b7e5                	j	80202560 <either_copyin+0x1a>

000000008020257a <procdump>:

// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void procdump(void)
{
    8020257a:	715d                	addi	sp,sp,-80
    8020257c:	e486                	sd	ra,72(sp)
    8020257e:	e0a2                	sd	s0,64(sp)
    80202580:	fc26                	sd	s1,56(sp)
    80202582:	f84a                	sd	s2,48(sp)
    80202584:	f44e                	sd	s3,40(sp)
    80202586:	f052                	sd	s4,32(sp)
    80202588:	ec56                	sd	s5,24(sp)
    8020258a:	e85a                	sd	s6,16(sp)
    8020258c:	e45e                	sd	s7,8(sp)
    8020258e:	0880                	addi	s0,sp,80
      [RUNNING] "run   ",
      [ZOMBIE] "zombie"};
  struct proc *p;
  char *state;

  printf("\nPID\tSTATE\tNAME\tMEM\n");
    80202590:	00008517          	auipc	a0,0x8
    80202594:	11850513          	addi	a0,a0,280 # 8020a6a8 <digits+0x328>
    80202598:	ffffe097          	auipc	ra,0xffffe
    8020259c:	bf4080e7          	jalr	-1036(ra) # 8020018c <printf>
  for (p = proc; p < &proc[NPROC]; p++)
    802025a0:	00014497          	auipc	s1,0x14
    802025a4:	0c048493          	addi	s1,s1,192 # 80216660 <proc+0x4e0>
    802025a8:	00024917          	auipc	s2,0x24
    802025ac:	92890913          	addi	s2,s2,-1752 # 80225ed0 <bcache+0x4e0>
  {
    if (p->state == UNUSED)
      continue;
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
    802025b0:	4b11                	li	s6,4
      state = states[p->state];
    else
      state = "???";
    802025b2:	00008997          	auipc	s3,0x8
    802025b6:	0ee98993          	addi	s3,s3,238 # 8020a6a0 <digits+0x320>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    802025ba:	00008a97          	auipc	s5,0x8
    802025be:	106a8a93          	addi	s5,s5,262 # 8020a6c0 <digits+0x340>
    printf("\n");
    802025c2:	00008a17          	auipc	s4,0x8
    802025c6:	b16a0a13          	addi	s4,s4,-1258 # 8020a0d8 <etext+0xd8>
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
    802025ca:	00009b97          	auipc	s7,0x9
    802025ce:	a76b8b93          	addi	s7,s7,-1418 # 8020b040 <states.1729>
    802025d2:	a01d                	j	802025f8 <procdump+0x7e>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    802025d4:	b686b703          	ld	a4,-1176(a3)
    802025d8:	b586a583          	lw	a1,-1192(a3)
    802025dc:	8556                	mv	a0,s5
    802025de:	ffffe097          	auipc	ra,0xffffe
    802025e2:	bae080e7          	jalr	-1106(ra) # 8020018c <printf>
    printf("\n");
    802025e6:	8552                	mv	a0,s4
    802025e8:	ffffe097          	auipc	ra,0xffffe
    802025ec:	ba4080e7          	jalr	-1116(ra) # 8020018c <printf>
  for (p = proc; p < &proc[NPROC]; p++)
    802025f0:	4f848493          	addi	s1,s1,1272
    802025f4:	03248163          	beq	s1,s2,80202616 <procdump+0x9c>
    if (p->state == UNUSED)
    802025f8:	86a6                	mv	a3,s1
    802025fa:	b384a783          	lw	a5,-1224(s1)
    802025fe:	dbed                	beqz	a5,802025f0 <procdump+0x76>
      state = "???";
    80202600:	864e                	mv	a2,s3
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80202602:	fcfb69e3          	bltu	s6,a5,802025d4 <procdump+0x5a>
    80202606:	1782                	slli	a5,a5,0x20
    80202608:	9381                	srli	a5,a5,0x20
    8020260a:	078e                	slli	a5,a5,0x3
    8020260c:	97de                	add	a5,a5,s7
    8020260e:	6390                	ld	a2,0(a5)
    80202610:	f271                	bnez	a2,802025d4 <procdump+0x5a>
      state = "???";
    80202612:	864e                	mv	a2,s3
    80202614:	b7c1                	j	802025d4 <procdump+0x5a>
  }
}
    80202616:	60a6                	ld	ra,72(sp)
    80202618:	6406                	ld	s0,64(sp)
    8020261a:	74e2                	ld	s1,56(sp)
    8020261c:	7942                	ld	s2,48(sp)
    8020261e:	79a2                	ld	s3,40(sp)
    80202620:	7a02                	ld	s4,32(sp)
    80202622:	6ae2                	ld	s5,24(sp)
    80202624:	6b42                	ld	s6,16(sp)
    80202626:	6ba2                	ld	s7,8(sp)
    80202628:	6161                	addi	sp,sp,80
    8020262a:	8082                	ret

000000008020262c <procnum>:

uint64
procnum(void)
{
    8020262c:	1141                	addi	sp,sp,-16
    8020262e:	e422                	sd	s0,8(sp)
    80202630:	0800                	addi	s0,sp,16
  int num = 0;
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++)
    80202632:	00014797          	auipc	a5,0x14
    80202636:	b4e78793          	addi	a5,a5,-1202 # 80216180 <proc>
  int num = 0;
    8020263a:	4501                	li	a0,0
  for (p = proc; p < &proc[NPROC]; p++)
    8020263c:	00023697          	auipc	a3,0x23
    80202640:	3b468693          	addi	a3,a3,948 # 802259f0 <bcache>
    80202644:	a029                	j	8020264e <procnum+0x22>
    80202646:	4f878793          	addi	a5,a5,1272
    8020264a:	00d78663          	beq	a5,a3,80202656 <procnum+0x2a>
  {
    if (p->state != UNUSED)
    8020264e:	4f98                	lw	a4,24(a5)
    80202650:	db7d                	beqz	a4,80202646 <procnum+0x1a>
    {
      num++;
    80202652:	2505                	addiw	a0,a0,1
    80202654:	bfcd                	j	80202646 <procnum+0x1a>
    }
  }

  return num;
}
    80202656:	6422                	ld	s0,8(sp)
    80202658:	0141                	addi	sp,sp,16
    8020265a:	8082                	ret

000000008020265c <clone>:


// added by lmq for SYS_clone
int clone(int flags, int stack, int ptid, int tls, int ctid)
{
    8020265c:	1141                	addi	sp,sp,-16
    8020265e:	e406                	sd	ra,8(sp)
    80202660:	e022                	sd	s0,0(sp)
    80202662:	0800                	addi	s0,sp,16
  int new_pid = fork();
    80202664:	fffff097          	auipc	ra,0xfffff
    80202668:	7ee080e7          	jalr	2030(ra) # 80201e52 <fork>
  return new_pid;
}
    8020266c:	60a2                	ld	ra,8(sp)
    8020266e:	6402                	ld	s0,0(sp)
    80202670:	0141                	addi	sp,sp,16
    80202672:	8082                	ret

0000000080202674 <waitpid>:
 * @addr:address to store return status of child process
 * @options:default 0
 * @return:pid of child process;-1 means failure
 */
int waitpid(int cpid, uint64 addr, int options)
{
    80202674:	711d                	addi	sp,sp,-96
    80202676:	ec86                	sd	ra,88(sp)
    80202678:	e8a2                	sd	s0,80(sp)
    8020267a:	e4a6                	sd	s1,72(sp)
    8020267c:	e0ca                	sd	s2,64(sp)
    8020267e:	fc4e                	sd	s3,56(sp)
    80202680:	f852                	sd	s4,48(sp)
    80202682:	f456                	sd	s5,40(sp)
    80202684:	f05a                	sd	s6,32(sp)
    80202686:	ec5e                	sd	s7,24(sp)
    80202688:	e862                	sd	s8,16(sp)
    8020268a:	e466                	sd	s9,8(sp)
    8020268c:	1080                	addi	s0,sp,96
    8020268e:	8bae                	mv	s7,a1
  if (cpid == -1) // wait for any child
    80202690:	57fd                	li	a5,-1
    80202692:	02f51663          	bne	a0,a5,802026be <waitpid+0x4a>
  {
    return wait(addr);
    80202696:	852e                	mv	a0,a1
    80202698:	00000097          	auipc	ra,0x0
    8020269c:	c98080e7          	jalr	-872(ra) # 80202330 <wait>
    802026a0:	89aa                	mv	s3,a0

    // Wait for a child to exit.
    sleep(p, &p->lock); // DOC: wait-sleep

  }
}
    802026a2:	854e                	mv	a0,s3
    802026a4:	60e6                	ld	ra,88(sp)
    802026a6:	6446                	ld	s0,80(sp)
    802026a8:	64a6                	ld	s1,72(sp)
    802026aa:	6906                	ld	s2,64(sp)
    802026ac:	79e2                	ld	s3,56(sp)
    802026ae:	7a42                	ld	s4,48(sp)
    802026b0:	7aa2                	ld	s5,40(sp)
    802026b2:	7b02                	ld	s6,32(sp)
    802026b4:	6be2                	ld	s7,24(sp)
    802026b6:	6c42                	ld	s8,16(sp)
    802026b8:	6ca2                	ld	s9,8(sp)
    802026ba:	6125                	addi	sp,sp,96
    802026bc:	8082                	ret
    802026be:	8a2a                	mv	s4,a0
  struct proc *p = myproc();
    802026c0:	fffff097          	auipc	ra,0xfffff
    802026c4:	398080e7          	jalr	920(ra) # 80201a58 <myproc>
    802026c8:	892a                	mv	s2,a0
  acquire(&p->lock);
    802026ca:	8caa                	mv	s9,a0
    802026cc:	ffffe097          	auipc	ra,0xffffe
    802026d0:	ffc080e7          	jalr	-4(ra) # 802006c8 <acquire>
    havekids = 0;
    802026d4:	4c01                	li	s8,0
        if (pp->state == ZOMBIE)
    802026d6:	4a91                	li	s5,4
    for (pp = proc; pp < &proc[NPROC]; pp++)
    802026d8:	00023997          	auipc	s3,0x23
    802026dc:	31898993          	addi	s3,s3,792 # 802259f0 <bcache>
        havekids = 1;
    802026e0:	4b05                	li	s6,1
    802026e2:	a045                	j	80202782 <waitpid+0x10e>
          pid = pp->pid;
    802026e4:	0384a983          	lw	s3,56(s1)
          if (addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
    802026e8:	000b8e63          	beqz	s7,80202704 <waitpid+0x90>
    802026ec:	4691                	li	a3,4
    802026ee:	03448613          	addi	a2,s1,52
    802026f2:	85de                	mv	a1,s7
    802026f4:	05093503          	ld	a0,80(s2)
    802026f8:	fffff097          	auipc	ra,0xfffff
    802026fc:	bf8080e7          	jalr	-1032(ra) # 802012f0 <copyout>
    80202700:	02054263          	bltz	a0,80202724 <waitpid+0xb0>
          freeproc(pp);
    80202704:	8526                	mv	a0,s1
    80202706:	fffff097          	auipc	ra,0xfffff
    8020270a:	524080e7          	jalr	1316(ra) # 80201c2a <freeproc>
          release(&pp->lock);
    8020270e:	8526                	mv	a0,s1
    80202710:	ffffe097          	auipc	ra,0xffffe
    80202714:	00c080e7          	jalr	12(ra) # 8020071c <release>
          release(&p->lock);
    80202718:	854a                	mv	a0,s2
    8020271a:	ffffe097          	auipc	ra,0xffffe
    8020271e:	002080e7          	jalr	2(ra) # 8020071c <release>
          return pid;
    80202722:	b741                	j	802026a2 <waitpid+0x2e>
            release(&pp->lock);
    80202724:	8526                	mv	a0,s1
    80202726:	ffffe097          	auipc	ra,0xffffe
    8020272a:	ff6080e7          	jalr	-10(ra) # 8020071c <release>
            release(&p->lock);
    8020272e:	854a                	mv	a0,s2
    80202730:	ffffe097          	auipc	ra,0xffffe
    80202734:	fec080e7          	jalr	-20(ra) # 8020071c <release>
            return -1;
    80202738:	59fd                	li	s3,-1
    8020273a:	b7a5                	j	802026a2 <waitpid+0x2e>
    for (pp = proc; pp < &proc[NPROC]; pp++)
    8020273c:	4f848493          	addi	s1,s1,1272
    80202740:	03348763          	beq	s1,s3,8020276e <waitpid+0xfa>
      if (pp->parent == p && pp->pid == cpid)
    80202744:	709c                	ld	a5,32(s1)
    80202746:	ff279be3          	bne	a5,s2,8020273c <waitpid+0xc8>
    8020274a:	5c9c                	lw	a5,56(s1)
    8020274c:	ff4798e3          	bne	a5,s4,8020273c <waitpid+0xc8>
        acquire(&pp->lock);
    80202750:	8526                	mv	a0,s1
    80202752:	ffffe097          	auipc	ra,0xffffe
    80202756:	f76080e7          	jalr	-138(ra) # 802006c8 <acquire>
        if (pp->state == ZOMBIE)
    8020275a:	4c9c                	lw	a5,24(s1)
    8020275c:	f95784e3          	beq	a5,s5,802026e4 <waitpid+0x70>
        release(&pp->lock);
    80202760:	8526                	mv	a0,s1
    80202762:	ffffe097          	auipc	ra,0xffffe
    80202766:	fba080e7          	jalr	-70(ra) # 8020071c <release>
        havekids = 1;
    8020276a:	875a                	mv	a4,s6
    8020276c:	bfc1                	j	8020273c <waitpid+0xc8>
    if (!havekids || p->killed)
    8020276e:	c305                	beqz	a4,8020278e <waitpid+0x11a>
    80202770:	03092783          	lw	a5,48(s2)
    80202774:	ef89                	bnez	a5,8020278e <waitpid+0x11a>
    sleep(p, &p->lock); // DOC: wait-sleep
    80202776:	85e6                	mv	a1,s9
    80202778:	854a                	mv	a0,s2
    8020277a:	00000097          	auipc	ra,0x0
    8020277e:	b38080e7          	jalr	-1224(ra) # 802022b2 <sleep>
    havekids = 0;
    80202782:	8762                	mv	a4,s8
    for (pp = proc; pp < &proc[NPROC]; pp++)
    80202784:	00014497          	auipc	s1,0x14
    80202788:	9fc48493          	addi	s1,s1,-1540 # 80216180 <proc>
    8020278c:	bf65                	j	80202744 <waitpid+0xd0>
      release(&p->lock);
    8020278e:	854a                	mv	a0,s2
    80202790:	ffffe097          	auipc	ra,0xffffe
    80202794:	f8c080e7          	jalr	-116(ra) # 8020071c <release>
      panic("current process do not have child process [cpid]");
    80202798:	00008517          	auipc	a0,0x8
    8020279c:	f3850513          	addi	a0,a0,-200 # 8020a6d0 <digits+0x350>
    802027a0:	ffffe097          	auipc	ra,0xffffe
    802027a4:	9a2080e7          	jalr	-1630(ra) # 80200142 <panic>

00000000802027a8 <swtch>:
    802027a8:	00153023          	sd	ra,0(a0)
    802027ac:	00253423          	sd	sp,8(a0)
    802027b0:	e900                	sd	s0,16(a0)
    802027b2:	ed04                	sd	s1,24(a0)
    802027b4:	03253023          	sd	s2,32(a0)
    802027b8:	03353423          	sd	s3,40(a0)
    802027bc:	03453823          	sd	s4,48(a0)
    802027c0:	03553c23          	sd	s5,56(a0)
    802027c4:	05653023          	sd	s6,64(a0)
    802027c8:	05753423          	sd	s7,72(a0)
    802027cc:	05853823          	sd	s8,80(a0)
    802027d0:	05953c23          	sd	s9,88(a0)
    802027d4:	07a53023          	sd	s10,96(a0)
    802027d8:	07b53423          	sd	s11,104(a0)
    802027dc:	0005b083          	ld	ra,0(a1)
    802027e0:	0085b103          	ld	sp,8(a1)
    802027e4:	6980                	ld	s0,16(a1)
    802027e6:	6d84                	ld	s1,24(a1)
    802027e8:	0205b903          	ld	s2,32(a1)
    802027ec:	0285b983          	ld	s3,40(a1)
    802027f0:	0305ba03          	ld	s4,48(a1)
    802027f4:	0385ba83          	ld	s5,56(a1)
    802027f8:	0405bb03          	ld	s6,64(a1)
    802027fc:	0485bb83          	ld	s7,72(a1)
    80202800:	0505bc03          	ld	s8,80(a1)
    80202804:	0585bc83          	ld	s9,88(a1)
    80202808:	0605bd03          	ld	s10,96(a1)
    8020280c:	0685bd83          	ld	s11,104(a1)
    80202810:	8082                	ret

0000000080202812 <trapinithart>:
// }

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80202812:	1141                	addi	sp,sp,-16
    80202814:	e406                	sd	ra,8(sp)
    80202816:	e022                	sd	s0,0(sp)
    80202818:	0800                	addi	s0,sp,16
  asm volatile("csrw stvec, %0" : : "r" (x));
    8020281a:	0000b797          	auipc	a5,0xb
    8020281e:	8b67b783          	ld	a5,-1866(a5) # 8020d0d0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80202822:	10579073          	csrw	stvec,a5
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202826:	100027f3          	csrr	a5,sstatus
  w_stvec((uint64)kernelvec);
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    8020282a:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8020282e:	10079073          	csrw	sstatus,a5
  asm volatile("csrr %0, sie" : "=r" (x) );
    80202832:	104027f3          	csrr	a5,sie
  // enable supervisor-mode timer interrupts.
  w_sie(r_sie() | SIE_SEIE | SIE_SSIE | SIE_STIE);
    80202836:	2227e793          	ori	a5,a5,546
  asm volatile("csrw sie, %0" : : "r" (x));
    8020283a:	10479073          	csrw	sie,a5
  set_next_timeout();
    8020283e:	00003097          	auipc	ra,0x3
    80202842:	5e8080e7          	jalr	1512(ra) # 80205e26 <set_next_timeout>
  #ifdef DEBUG
  printf("trapinithart\n");
  #endif
}
    80202846:	60a2                	ld	ra,8(sp)
    80202848:	6402                	ld	s0,0(sp)
    8020284a:	0141                	addi	sp,sp,16
    8020284c:	8082                	ret

000000008020284e <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    8020284e:	1141                	addi	sp,sp,-16
    80202850:	e406                	sd	ra,8(sp)
    80202852:	e022                	sd	s0,0(sp)
    80202854:	0800                	addi	s0,sp,16
  struct proc *p = myproc();
    80202856:	fffff097          	auipc	ra,0xfffff
    8020285a:	202080e7          	jalr	514(ra) # 80201a58 <myproc>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8020285e:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80202862:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202864:	10079073          	csrw	sstatus,a5
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    80202868:	0000b617          	auipc	a2,0xb
    8020286c:	85063603          	ld	a2,-1968(a2) # 8020d0b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80202870:	0000b697          	auipc	a3,0xb
    80202874:	8806b683          	ld	a3,-1920(a3) # 8020d0f0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80202878:	8e91                	sub	a3,a3,a2
    8020287a:	040007b7          	lui	a5,0x4000
    8020287e:	17fd                	addi	a5,a5,-1
    80202880:	07b2                	slli	a5,a5,0xc
    80202882:	96be                	add	a3,a3,a5
  asm volatile("csrw stvec, %0" : : "r" (x));
    80202884:	10569073          	csrw	stvec,a3

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80202888:	7138                	ld	a4,96(a0)
  asm volatile("csrr %0, satp" : "=r" (x) );
    8020288a:	180026f3          	csrr	a3,satp
    8020288e:	e314                	sd	a3,0(a4)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80202890:	7138                	ld	a4,96(a0)
    80202892:	6134                	ld	a3,64(a0)
    80202894:	6585                	lui	a1,0x1
    80202896:	96ae                	add	a3,a3,a1
    80202898:	e714                	sd	a3,8(a4)
  p->trapframe->kernel_trap = (uint64)usertrap;
    8020289a:	7138                	ld	a4,96(a0)
    8020289c:	00000697          	auipc	a3,0x0
    802028a0:	0f468693          	addi	a3,a3,244 # 80202990 <usertrap>
    802028a4:	eb14                	sd	a3,16(a4)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    802028a6:	7138                	ld	a4,96(a0)
  asm volatile("mv %0, tp" : "=r" (x) );
    802028a8:	8692                	mv	a3,tp
    802028aa:	f314                	sd	a3,32(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802028ac:	100026f3          	csrr	a3,sstatus
  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    802028b0:	eff6f693          	andi	a3,a3,-257
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    802028b4:	0206e693          	ori	a3,a3,32
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802028b8:	10069073          	csrw	sstatus,a3
  w_sstatus(x);

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    802028bc:	7138                	ld	a4,96(a0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    802028be:	6f18                	ld	a4,24(a4)
    802028c0:	14171073          	csrw	sepc,a4

  // tell trampoline.S the user page table to switch to.
  // printf("[usertrapret]p->pagetable: %p\n", p->pagetable);
  uint64 satp = MAKE_SATP(p->pagetable);
    802028c4:	692c                	ld	a1,80(a0)
    802028c6:	81b1                	srli	a1,a1,0xc

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    802028c8:	0000b717          	auipc	a4,0xb
    802028cc:	80073703          	ld	a4,-2048(a4) # 8020d0c8 <_GLOBAL_OFFSET_TABLE_+0x18>
    802028d0:	8f11                	sub	a4,a4,a2
    802028d2:	97ba                	add	a5,a5,a4
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    802028d4:	577d                	li	a4,-1
    802028d6:	177e                	slli	a4,a4,0x3f
    802028d8:	8dd9                	or	a1,a1,a4
    802028da:	02000537          	lui	a0,0x2000
    802028de:	157d                	addi	a0,a0,-1
    802028e0:	0536                	slli	a0,a0,0xd
    802028e2:	9782                	jalr	a5
}
    802028e4:	60a2                	ld	ra,8(sp)
    802028e6:	6402                	ld	s0,0(sp)
    802028e8:	0141                	addi	sp,sp,16
    802028ea:	8082                	ret

00000000802028ec <devintr>:
// Check if it's an external/software interrupt, 
// and handle it. 
// returns  2 if timer interrupt, 
//          1 if other device, 
//          0 if not recognized. 
int devintr(void) {
    802028ec:	1101                	addi	sp,sp,-32
    802028ee:	ec06                	sd	ra,24(sp)
    802028f0:	e822                	sd	s0,16(sp)
    802028f2:	e426                	sd	s1,8(sp)
    802028f4:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    802028f6:	14202773          	csrr	a4,scause
	uint64 scause = r_scause();

	#ifdef QEMU 
	// handle external interrupt 
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    802028fa:	00074d63          	bltz	a4,80202914 <devintr+0x28>
		sbi_set_mie();
		#endif 

		return 1;
	}
	else if (0x8000000000000005L == scause) {
    802028fe:	57fd                	li	a5,-1
    80202900:	17fe                	slli	a5,a5,0x3f
    80202902:	0795                	addi	a5,a5,5
		timer_tick();
		return 2;
	}
	else { return 0;}
    80202904:	4501                	li	a0,0
	else if (0x8000000000000005L == scause) {
    80202906:	06f70f63          	beq	a4,a5,80202984 <devintr+0x98>
}
    8020290a:	60e2                	ld	ra,24(sp)
    8020290c:	6442                	ld	s0,16(sp)
    8020290e:	64a2                	ld	s1,8(sp)
    80202910:	6105                	addi	sp,sp,32
    80202912:	8082                	ret
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    80202914:	0ff77793          	andi	a5,a4,255
    80202918:	46a5                	li	a3,9
    8020291a:	fed792e3          	bne	a5,a3,802028fe <devintr+0x12>
		int irq = plic_claim();
    8020291e:	00005097          	auipc	ra,0x5
    80202922:	f52080e7          	jalr	-174(ra) # 80207870 <plic_claim>
    80202926:	84aa                	mv	s1,a0
		if (UART_IRQ == irq) {
    80202928:	47a9                	li	a5,10
    8020292a:	02f50163          	beq	a0,a5,8020294c <devintr+0x60>
		else if (DISK_IRQ == irq) {
    8020292e:	4785                	li	a5,1
    80202930:	04f50563          	beq	a0,a5,8020297a <devintr+0x8e>
		return 1;
    80202934:	4505                	li	a0,1
		else if (irq) {
    80202936:	d8f1                	beqz	s1,8020290a <devintr+0x1e>
			printf("unexpected interrupt irq = %d\n", irq);
    80202938:	85a6                	mv	a1,s1
    8020293a:	00008517          	auipc	a0,0x8
    8020293e:	df650513          	addi	a0,a0,-522 # 8020a730 <digits+0x3b0>
    80202942:	ffffe097          	auipc	ra,0xffffe
    80202946:	84a080e7          	jalr	-1974(ra) # 8020018c <printf>
    8020294a:	a821                	j	80202962 <devintr+0x76>
	return SBI_CALL_0(SBI_CONSOLE_GETCHAR);
    8020294c:	4501                	li	a0,0
    8020294e:	4581                	li	a1,0
    80202950:	4601                	li	a2,0
    80202952:	4681                	li	a3,0
    80202954:	4889                	li	a7,2
    80202956:	00000073          	ecall
    8020295a:	2501                	sext.w	a0,a0
			if (-1 != c) {
    8020295c:	57fd                	li	a5,-1
    8020295e:	00f51963          	bne	a0,a5,80202970 <devintr+0x84>
		if (irq) { plic_complete(irq);}
    80202962:	8526                	mv	a0,s1
    80202964:	00005097          	auipc	ra,0x5
    80202968:	f36080e7          	jalr	-202(ra) # 8020789a <plic_complete>
		return 1;
    8020296c:	4505                	li	a0,1
    8020296e:	bf71                	j	8020290a <devintr+0x1e>
				consoleintr(c);
    80202970:	00005097          	auipc	ra,0x5
    80202974:	142080e7          	jalr	322(ra) # 80207ab2 <consoleintr>
    80202978:	b7ed                	j	80202962 <devintr+0x76>
			disk_intr();
    8020297a:	00003097          	auipc	ra,0x3
    8020297e:	56c080e7          	jalr	1388(ra) # 80205ee6 <disk_intr>
    80202982:	b7c5                	j	80202962 <devintr+0x76>
		timer_tick();
    80202984:	00003097          	auipc	ra,0x3
    80202988:	4c8080e7          	jalr	1224(ra) # 80205e4c <timer_tick>
		return 2;
    8020298c:	4509                	li	a0,2
    8020298e:	bfb5                	j	8020290a <devintr+0x1e>

0000000080202990 <usertrap>:
{
    80202990:	1101                	addi	sp,sp,-32
    80202992:	ec06                	sd	ra,24(sp)
    80202994:	e822                	sd	s0,16(sp)
    80202996:	e426                	sd	s1,8(sp)
    80202998:	e04a                	sd	s2,0(sp)
    8020299a:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8020299c:	100027f3          	csrr	a5,sstatus
  if((r_sstatus() & SSTATUS_SPP) != 0)
    802029a0:	1007f793          	andi	a5,a5,256
    802029a4:	e3ad                	bnez	a5,80202a06 <usertrap+0x76>
  asm volatile("csrw stvec, %0" : : "r" (x));
    802029a6:	0000a797          	auipc	a5,0xa
    802029aa:	72a7b783          	ld	a5,1834(a5) # 8020d0d0 <_GLOBAL_OFFSET_TABLE_+0x20>
    802029ae:	10579073          	csrw	stvec,a5
  struct proc *p = myproc();
    802029b2:	fffff097          	auipc	ra,0xfffff
    802029b6:	0a6080e7          	jalr	166(ra) # 80201a58 <myproc>
    802029ba:	84aa                	mv	s1,a0
  p->trapframe->epc = r_sepc();
    802029bc:	713c                	ld	a5,96(a0)
  asm volatile("csrr %0, sepc" : "=r" (x) );
    802029be:	14102773          	csrr	a4,sepc
    802029c2:	ef98                	sd	a4,24(a5)
  asm volatile("csrr %0, scause" : "=r" (x) );
    802029c4:	14202773          	csrr	a4,scause
  if(r_scause() == 8){
    802029c8:	47a1                	li	a5,8
    802029ca:	04f71c63          	bne	a4,a5,80202a22 <usertrap+0x92>
    if(p->killed)
    802029ce:	591c                	lw	a5,48(a0)
    802029d0:	e3b9                	bnez	a5,80202a16 <usertrap+0x86>
    p->trapframe->epc += 4;
    802029d2:	70b8                	ld	a4,96(s1)
    802029d4:	6f1c                	ld	a5,24(a4)
    802029d6:	0791                	addi	a5,a5,4
    802029d8:	ef1c                	sd	a5,24(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802029da:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    802029de:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802029e2:	10079073          	csrw	sstatus,a5
    syscall();
    802029e6:	00000097          	auipc	ra,0x0
    802029ea:	5d4080e7          	jalr	1492(ra) # 80202fba <syscall>
  if(p->killed)
    802029ee:	589c                	lw	a5,48(s1)
    802029f0:	ebd1                	bnez	a5,80202a84 <usertrap+0xf4>
  usertrapret();
    802029f2:	00000097          	auipc	ra,0x0
    802029f6:	e5c080e7          	jalr	-420(ra) # 8020284e <usertrapret>
}
    802029fa:	60e2                	ld	ra,24(sp)
    802029fc:	6442                	ld	s0,16(sp)
    802029fe:	64a2                	ld	s1,8(sp)
    80202a00:	6902                	ld	s2,0(sp)
    80202a02:	6105                	addi	sp,sp,32
    80202a04:	8082                	ret
    panic("usertrap: not from user mode");
    80202a06:	00008517          	auipc	a0,0x8
    80202a0a:	d4a50513          	addi	a0,a0,-694 # 8020a750 <digits+0x3d0>
    80202a0e:	ffffd097          	auipc	ra,0xffffd
    80202a12:	734080e7          	jalr	1844(ra) # 80200142 <panic>
      exit(-1);
    80202a16:	557d                	li	a0,-1
    80202a18:	fffff097          	auipc	ra,0xfffff
    80202a1c:	774080e7          	jalr	1908(ra) # 8020218c <exit>
    80202a20:	bf4d                	j	802029d2 <usertrap+0x42>
  else if((which_dev = devintr()) != 0){
    80202a22:	00000097          	auipc	ra,0x0
    80202a26:	eca080e7          	jalr	-310(ra) # 802028ec <devintr>
    80202a2a:	892a                	mv	s2,a0
    80202a2c:	c501                	beqz	a0,80202a34 <usertrap+0xa4>
  if(p->killed)
    80202a2e:	589c                	lw	a5,48(s1)
    80202a30:	c3b1                	beqz	a5,80202a74 <usertrap+0xe4>
    80202a32:	a825                	j	80202a6a <usertrap+0xda>
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202a34:	142025f3          	csrr	a1,scause
    printf("\nusertrap(): unexpected scause %p pid=%d %s\n", r_scause(), p->pid, p->name);
    80202a38:	4e048693          	addi	a3,s1,1248
    80202a3c:	5c90                	lw	a2,56(s1)
    80202a3e:	00008517          	auipc	a0,0x8
    80202a42:	d3250513          	addi	a0,a0,-718 # 8020a770 <digits+0x3f0>
    80202a46:	ffffd097          	auipc	ra,0xffffd
    80202a4a:	746080e7          	jalr	1862(ra) # 8020018c <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202a4e:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202a52:	14302673          	csrr	a2,stval
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80202a56:	00008517          	auipc	a0,0x8
    80202a5a:	d4a50513          	addi	a0,a0,-694 # 8020a7a0 <digits+0x420>
    80202a5e:	ffffd097          	auipc	ra,0xffffd
    80202a62:	72e080e7          	jalr	1838(ra) # 8020018c <printf>
    p->killed = 1;
    80202a66:	4785                	li	a5,1
    80202a68:	d89c                	sw	a5,48(s1)
    exit(-1);
    80202a6a:	557d                	li	a0,-1
    80202a6c:	fffff097          	auipc	ra,0xfffff
    80202a70:	720080e7          	jalr	1824(ra) # 8020218c <exit>
  if(which_dev == 2)
    80202a74:	4789                	li	a5,2
    80202a76:	f6f91ee3          	bne	s2,a5,802029f2 <usertrap+0x62>
    yield();
    80202a7a:	fffff097          	auipc	ra,0xfffff
    80202a7e:	7fc080e7          	jalr	2044(ra) # 80202276 <yield>
    80202a82:	bf85                	j	802029f2 <usertrap+0x62>
  int which_dev = 0;
    80202a84:	4901                	li	s2,0
    80202a86:	b7d5                	j	80202a6a <usertrap+0xda>

0000000080202a88 <kerneltrap>:
kerneltrap() {
    80202a88:	7179                	addi	sp,sp,-48
    80202a8a:	f406                	sd	ra,40(sp)
    80202a8c:	f022                	sd	s0,32(sp)
    80202a8e:	ec26                	sd	s1,24(sp)
    80202a90:	e84a                	sd	s2,16(sp)
    80202a92:	e44e                	sd	s3,8(sp)
    80202a94:	1800                	addi	s0,sp,48
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202a96:	14102973          	csrr	s2,sepc
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202a9a:	100024f3          	csrr	s1,sstatus
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202a9e:	142029f3          	csrr	s3,scause
  if((sstatus & SSTATUS_SPP) == 0)
    80202aa2:	1004f793          	andi	a5,s1,256
    80202aa6:	cb85                	beqz	a5,80202ad6 <kerneltrap+0x4e>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202aa8:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80202aac:	8b89                	andi	a5,a5,2
  if(intr_get() != 0)
    80202aae:	ef85                	bnez	a5,80202ae6 <kerneltrap+0x5e>
  if((which_dev = devintr()) == 0){
    80202ab0:	00000097          	auipc	ra,0x0
    80202ab4:	e3c080e7          	jalr	-452(ra) # 802028ec <devintr>
    80202ab8:	cd1d                	beqz	a0,80202af6 <kerneltrap+0x6e>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202aba:	4789                	li	a5,2
    80202abc:	08f50b63          	beq	a0,a5,80202b52 <kerneltrap+0xca>
  asm volatile("csrw sepc, %0" : : "r" (x));
    80202ac0:	14191073          	csrw	sepc,s2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202ac4:	10049073          	csrw	sstatus,s1
}
    80202ac8:	70a2                	ld	ra,40(sp)
    80202aca:	7402                	ld	s0,32(sp)
    80202acc:	64e2                	ld	s1,24(sp)
    80202ace:	6942                	ld	s2,16(sp)
    80202ad0:	69a2                	ld	s3,8(sp)
    80202ad2:	6145                	addi	sp,sp,48
    80202ad4:	8082                	ret
    panic("kerneltrap: not from supervisor mode");
    80202ad6:	00008517          	auipc	a0,0x8
    80202ada:	cea50513          	addi	a0,a0,-790 # 8020a7c0 <digits+0x440>
    80202ade:	ffffd097          	auipc	ra,0xffffd
    80202ae2:	664080e7          	jalr	1636(ra) # 80200142 <panic>
    panic("kerneltrap: interrupts enabled");
    80202ae6:	00008517          	auipc	a0,0x8
    80202aea:	d0250513          	addi	a0,a0,-766 # 8020a7e8 <digits+0x468>
    80202aee:	ffffd097          	auipc	ra,0xffffd
    80202af2:	654080e7          	jalr	1620(ra) # 80200142 <panic>
    printf("\nscause %p\n", scause);
    80202af6:	85ce                	mv	a1,s3
    80202af8:	00008517          	auipc	a0,0x8
    80202afc:	d1050513          	addi	a0,a0,-752 # 8020a808 <digits+0x488>
    80202b00:	ffffd097          	auipc	ra,0xffffd
    80202b04:	68c080e7          	jalr	1676(ra) # 8020018c <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202b08:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202b0c:	14302673          	csrr	a2,stval
  asm volatile("mv %0, tp" : "=r" (x) );
    80202b10:	8692                	mv	a3,tp
    printf("sepc=%p stval=%p hart=%d\n", r_sepc(), r_stval(), r_tp());
    80202b12:	00008517          	auipc	a0,0x8
    80202b16:	d0650513          	addi	a0,a0,-762 # 8020a818 <digits+0x498>
    80202b1a:	ffffd097          	auipc	ra,0xffffd
    80202b1e:	672080e7          	jalr	1650(ra) # 8020018c <printf>
    struct proc *p = myproc();
    80202b22:	fffff097          	auipc	ra,0xfffff
    80202b26:	f36080e7          	jalr	-202(ra) # 80201a58 <myproc>
    if (p != 0) {
    80202b2a:	cd01                	beqz	a0,80202b42 <kerneltrap+0xba>
      printf("pid: %d, name: %s\n", p->pid, p->name);
    80202b2c:	4e050613          	addi	a2,a0,1248
    80202b30:	5d0c                	lw	a1,56(a0)
    80202b32:	00008517          	auipc	a0,0x8
    80202b36:	d0650513          	addi	a0,a0,-762 # 8020a838 <digits+0x4b8>
    80202b3a:	ffffd097          	auipc	ra,0xffffd
    80202b3e:	652080e7          	jalr	1618(ra) # 8020018c <printf>
    panic("kerneltrap");
    80202b42:	00008517          	auipc	a0,0x8
    80202b46:	d0e50513          	addi	a0,a0,-754 # 8020a850 <digits+0x4d0>
    80202b4a:	ffffd097          	auipc	ra,0xffffd
    80202b4e:	5f8080e7          	jalr	1528(ra) # 80200142 <panic>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202b52:	fffff097          	auipc	ra,0xfffff
    80202b56:	f06080e7          	jalr	-250(ra) # 80201a58 <myproc>
    80202b5a:	d13d                	beqz	a0,80202ac0 <kerneltrap+0x38>
    80202b5c:	fffff097          	auipc	ra,0xfffff
    80202b60:	efc080e7          	jalr	-260(ra) # 80201a58 <myproc>
    80202b64:	4d18                	lw	a4,24(a0)
    80202b66:	478d                	li	a5,3
    80202b68:	f4f71ce3          	bne	a4,a5,80202ac0 <kerneltrap+0x38>
    yield();
    80202b6c:	fffff097          	auipc	ra,0xfffff
    80202b70:	70a080e7          	jalr	1802(ra) # 80202276 <yield>
    80202b74:	b7b1                	j	80202ac0 <kerneltrap+0x38>

0000000080202b76 <trapframedump>:

void trapframedump(struct trapframe *tf)
{
    80202b76:	1101                	addi	sp,sp,-32
    80202b78:	ec06                	sd	ra,24(sp)
    80202b7a:	e822                	sd	s0,16(sp)
    80202b7c:	e426                	sd	s1,8(sp)
    80202b7e:	1000                	addi	s0,sp,32
    80202b80:	84aa                	mv	s1,a0
  printf("a0: %p\t", tf->a0);
    80202b82:	792c                	ld	a1,112(a0)
    80202b84:	00008517          	auipc	a0,0x8
    80202b88:	cdc50513          	addi	a0,a0,-804 # 8020a860 <digits+0x4e0>
    80202b8c:	ffffd097          	auipc	ra,0xffffd
    80202b90:	600080e7          	jalr	1536(ra) # 8020018c <printf>
  printf("a1: %p\t", tf->a1);
    80202b94:	7cac                	ld	a1,120(s1)
    80202b96:	00008517          	auipc	a0,0x8
    80202b9a:	cd250513          	addi	a0,a0,-814 # 8020a868 <digits+0x4e8>
    80202b9e:	ffffd097          	auipc	ra,0xffffd
    80202ba2:	5ee080e7          	jalr	1518(ra) # 8020018c <printf>
  printf("a2: %p\t", tf->a2);
    80202ba6:	60cc                	ld	a1,128(s1)
    80202ba8:	00008517          	auipc	a0,0x8
    80202bac:	cc850513          	addi	a0,a0,-824 # 8020a870 <digits+0x4f0>
    80202bb0:	ffffd097          	auipc	ra,0xffffd
    80202bb4:	5dc080e7          	jalr	1500(ra) # 8020018c <printf>
  printf("a3: %p\n", tf->a3);
    80202bb8:	64cc                	ld	a1,136(s1)
    80202bba:	00008517          	auipc	a0,0x8
    80202bbe:	cbe50513          	addi	a0,a0,-834 # 8020a878 <digits+0x4f8>
    80202bc2:	ffffd097          	auipc	ra,0xffffd
    80202bc6:	5ca080e7          	jalr	1482(ra) # 8020018c <printf>
  printf("a4: %p\t", tf->a4);
    80202bca:	68cc                	ld	a1,144(s1)
    80202bcc:	00008517          	auipc	a0,0x8
    80202bd0:	cb450513          	addi	a0,a0,-844 # 8020a880 <digits+0x500>
    80202bd4:	ffffd097          	auipc	ra,0xffffd
    80202bd8:	5b8080e7          	jalr	1464(ra) # 8020018c <printf>
  printf("a5: %p\t", tf->a5);
    80202bdc:	6ccc                	ld	a1,152(s1)
    80202bde:	00008517          	auipc	a0,0x8
    80202be2:	caa50513          	addi	a0,a0,-854 # 8020a888 <digits+0x508>
    80202be6:	ffffd097          	auipc	ra,0xffffd
    80202bea:	5a6080e7          	jalr	1446(ra) # 8020018c <printf>
  printf("a6: %p\t", tf->a6);
    80202bee:	70cc                	ld	a1,160(s1)
    80202bf0:	00008517          	auipc	a0,0x8
    80202bf4:	ca050513          	addi	a0,a0,-864 # 8020a890 <digits+0x510>
    80202bf8:	ffffd097          	auipc	ra,0xffffd
    80202bfc:	594080e7          	jalr	1428(ra) # 8020018c <printf>
  printf("a7: %p\n", tf->a7);
    80202c00:	74cc                	ld	a1,168(s1)
    80202c02:	00008517          	auipc	a0,0x8
    80202c06:	c9650513          	addi	a0,a0,-874 # 8020a898 <digits+0x518>
    80202c0a:	ffffd097          	auipc	ra,0xffffd
    80202c0e:	582080e7          	jalr	1410(ra) # 8020018c <printf>
  printf("t0: %p\t", tf->t0);
    80202c12:	64ac                	ld	a1,72(s1)
    80202c14:	00008517          	auipc	a0,0x8
    80202c18:	c8c50513          	addi	a0,a0,-884 # 8020a8a0 <digits+0x520>
    80202c1c:	ffffd097          	auipc	ra,0xffffd
    80202c20:	570080e7          	jalr	1392(ra) # 8020018c <printf>
  printf("t1: %p\t", tf->t1);
    80202c24:	68ac                	ld	a1,80(s1)
    80202c26:	00008517          	auipc	a0,0x8
    80202c2a:	c8250513          	addi	a0,a0,-894 # 8020a8a8 <digits+0x528>
    80202c2e:	ffffd097          	auipc	ra,0xffffd
    80202c32:	55e080e7          	jalr	1374(ra) # 8020018c <printf>
  printf("t2: %p\t", tf->t2);
    80202c36:	6cac                	ld	a1,88(s1)
    80202c38:	00008517          	auipc	a0,0x8
    80202c3c:	c7850513          	addi	a0,a0,-904 # 8020a8b0 <digits+0x530>
    80202c40:	ffffd097          	auipc	ra,0xffffd
    80202c44:	54c080e7          	jalr	1356(ra) # 8020018c <printf>
  printf("t3: %p\n", tf->t3);
    80202c48:	1004b583          	ld	a1,256(s1)
    80202c4c:	00008517          	auipc	a0,0x8
    80202c50:	c6c50513          	addi	a0,a0,-916 # 8020a8b8 <digits+0x538>
    80202c54:	ffffd097          	auipc	ra,0xffffd
    80202c58:	538080e7          	jalr	1336(ra) # 8020018c <printf>
  printf("t4: %p\t", tf->t4);
    80202c5c:	1084b583          	ld	a1,264(s1)
    80202c60:	00008517          	auipc	a0,0x8
    80202c64:	c6050513          	addi	a0,a0,-928 # 8020a8c0 <digits+0x540>
    80202c68:	ffffd097          	auipc	ra,0xffffd
    80202c6c:	524080e7          	jalr	1316(ra) # 8020018c <printf>
  printf("t5: %p\t", tf->t5);
    80202c70:	1104b583          	ld	a1,272(s1)
    80202c74:	00008517          	auipc	a0,0x8
    80202c78:	c5450513          	addi	a0,a0,-940 # 8020a8c8 <digits+0x548>
    80202c7c:	ffffd097          	auipc	ra,0xffffd
    80202c80:	510080e7          	jalr	1296(ra) # 8020018c <printf>
  printf("t6: %p\t", tf->t6);
    80202c84:	1184b583          	ld	a1,280(s1)
    80202c88:	00008517          	auipc	a0,0x8
    80202c8c:	c4850513          	addi	a0,a0,-952 # 8020a8d0 <digits+0x550>
    80202c90:	ffffd097          	auipc	ra,0xffffd
    80202c94:	4fc080e7          	jalr	1276(ra) # 8020018c <printf>
  printf("s0: %p\n", tf->s0);
    80202c98:	70ac                	ld	a1,96(s1)
    80202c9a:	00008517          	auipc	a0,0x8
    80202c9e:	c3e50513          	addi	a0,a0,-962 # 8020a8d8 <digits+0x558>
    80202ca2:	ffffd097          	auipc	ra,0xffffd
    80202ca6:	4ea080e7          	jalr	1258(ra) # 8020018c <printf>
  printf("s1: %p\t", tf->s1);
    80202caa:	74ac                	ld	a1,104(s1)
    80202cac:	00008517          	auipc	a0,0x8
    80202cb0:	c3450513          	addi	a0,a0,-972 # 8020a8e0 <digits+0x560>
    80202cb4:	ffffd097          	auipc	ra,0xffffd
    80202cb8:	4d8080e7          	jalr	1240(ra) # 8020018c <printf>
  printf("s2: %p\t", tf->s2);
    80202cbc:	78cc                	ld	a1,176(s1)
    80202cbe:	00008517          	auipc	a0,0x8
    80202cc2:	c2a50513          	addi	a0,a0,-982 # 8020a8e8 <digits+0x568>
    80202cc6:	ffffd097          	auipc	ra,0xffffd
    80202cca:	4c6080e7          	jalr	1222(ra) # 8020018c <printf>
  printf("s3: %p\t", tf->s3);
    80202cce:	7ccc                	ld	a1,184(s1)
    80202cd0:	00008517          	auipc	a0,0x8
    80202cd4:	c2050513          	addi	a0,a0,-992 # 8020a8f0 <digits+0x570>
    80202cd8:	ffffd097          	auipc	ra,0xffffd
    80202cdc:	4b4080e7          	jalr	1204(ra) # 8020018c <printf>
  printf("s4: %p\n", tf->s4);
    80202ce0:	60ec                	ld	a1,192(s1)
    80202ce2:	00008517          	auipc	a0,0x8
    80202ce6:	c1650513          	addi	a0,a0,-1002 # 8020a8f8 <digits+0x578>
    80202cea:	ffffd097          	auipc	ra,0xffffd
    80202cee:	4a2080e7          	jalr	1186(ra) # 8020018c <printf>
  printf("s5: %p\t", tf->s5);
    80202cf2:	64ec                	ld	a1,200(s1)
    80202cf4:	00008517          	auipc	a0,0x8
    80202cf8:	c0c50513          	addi	a0,a0,-1012 # 8020a900 <digits+0x580>
    80202cfc:	ffffd097          	auipc	ra,0xffffd
    80202d00:	490080e7          	jalr	1168(ra) # 8020018c <printf>
  printf("s6: %p\t", tf->s6);
    80202d04:	68ec                	ld	a1,208(s1)
    80202d06:	00008517          	auipc	a0,0x8
    80202d0a:	c0250513          	addi	a0,a0,-1022 # 8020a908 <digits+0x588>
    80202d0e:	ffffd097          	auipc	ra,0xffffd
    80202d12:	47e080e7          	jalr	1150(ra) # 8020018c <printf>
  printf("s7: %p\t", tf->s7);
    80202d16:	6cec                	ld	a1,216(s1)
    80202d18:	00008517          	auipc	a0,0x8
    80202d1c:	bf850513          	addi	a0,a0,-1032 # 8020a910 <digits+0x590>
    80202d20:	ffffd097          	auipc	ra,0xffffd
    80202d24:	46c080e7          	jalr	1132(ra) # 8020018c <printf>
  printf("s8: %p\n", tf->s8);
    80202d28:	70ec                	ld	a1,224(s1)
    80202d2a:	00008517          	auipc	a0,0x8
    80202d2e:	bee50513          	addi	a0,a0,-1042 # 8020a918 <digits+0x598>
    80202d32:	ffffd097          	auipc	ra,0xffffd
    80202d36:	45a080e7          	jalr	1114(ra) # 8020018c <printf>
  printf("s9: %p\t", tf->s9);
    80202d3a:	74ec                	ld	a1,232(s1)
    80202d3c:	00008517          	auipc	a0,0x8
    80202d40:	be450513          	addi	a0,a0,-1052 # 8020a920 <digits+0x5a0>
    80202d44:	ffffd097          	auipc	ra,0xffffd
    80202d48:	448080e7          	jalr	1096(ra) # 8020018c <printf>
  printf("s10: %p\t", tf->s10);
    80202d4c:	78ec                	ld	a1,240(s1)
    80202d4e:	00008517          	auipc	a0,0x8
    80202d52:	bda50513          	addi	a0,a0,-1062 # 8020a928 <digits+0x5a8>
    80202d56:	ffffd097          	auipc	ra,0xffffd
    80202d5a:	436080e7          	jalr	1078(ra) # 8020018c <printf>
  printf("s11: %p\t", tf->s11);
    80202d5e:	7cec                	ld	a1,248(s1)
    80202d60:	00008517          	auipc	a0,0x8
    80202d64:	bd850513          	addi	a0,a0,-1064 # 8020a938 <digits+0x5b8>
    80202d68:	ffffd097          	auipc	ra,0xffffd
    80202d6c:	424080e7          	jalr	1060(ra) # 8020018c <printf>
  printf("ra: %p\n", tf->ra);
    80202d70:	748c                	ld	a1,40(s1)
    80202d72:	00008517          	auipc	a0,0x8
    80202d76:	89e50513          	addi	a0,a0,-1890 # 8020a610 <digits+0x290>
    80202d7a:	ffffd097          	auipc	ra,0xffffd
    80202d7e:	412080e7          	jalr	1042(ra) # 8020018c <printf>
  printf("sp: %p\t", tf->sp);
    80202d82:	788c                	ld	a1,48(s1)
    80202d84:	00008517          	auipc	a0,0x8
    80202d88:	bc450513          	addi	a0,a0,-1084 # 8020a948 <digits+0x5c8>
    80202d8c:	ffffd097          	auipc	ra,0xffffd
    80202d90:	400080e7          	jalr	1024(ra) # 8020018c <printf>
  printf("gp: %p\t", tf->gp);
    80202d94:	7c8c                	ld	a1,56(s1)
    80202d96:	00008517          	auipc	a0,0x8
    80202d9a:	bba50513          	addi	a0,a0,-1094 # 8020a950 <digits+0x5d0>
    80202d9e:	ffffd097          	auipc	ra,0xffffd
    80202da2:	3ee080e7          	jalr	1006(ra) # 8020018c <printf>
  printf("tp: %p\t", tf->tp);
    80202da6:	60ac                	ld	a1,64(s1)
    80202da8:	00008517          	auipc	a0,0x8
    80202dac:	bb050513          	addi	a0,a0,-1104 # 8020a958 <digits+0x5d8>
    80202db0:	ffffd097          	auipc	ra,0xffffd
    80202db4:	3dc080e7          	jalr	988(ra) # 8020018c <printf>
  printf("epc: %p\n", tf->epc);
    80202db8:	6c8c                	ld	a1,24(s1)
    80202dba:	00008517          	auipc	a0,0x8
    80202dbe:	ba650513          	addi	a0,a0,-1114 # 8020a960 <digits+0x5e0>
    80202dc2:	ffffd097          	auipc	ra,0xffffd
    80202dc6:	3ca080e7          	jalr	970(ra) # 8020018c <printf>
}
    80202dca:	60e2                	ld	ra,24(sp)
    80202dcc:	6442                	ld	s0,16(sp)
    80202dce:	64a2                	ld	s1,8(sp)
    80202dd0:	6105                	addi	sp,sp,32
    80202dd2:	8082                	ret

0000000080202dd4 <argraw>:
  return strlen(buf);
}

static uint64
argraw(int n)
{
    80202dd4:	1101                	addi	sp,sp,-32
    80202dd6:	ec06                	sd	ra,24(sp)
    80202dd8:	e822                	sd	s0,16(sp)
    80202dda:	e426                	sd	s1,8(sp)
    80202ddc:	1000                	addi	s0,sp,32
    80202dde:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80202de0:	fffff097          	auipc	ra,0xfffff
    80202de4:	c78080e7          	jalr	-904(ra) # 80201a58 <myproc>
  switch (n) {
    80202de8:	4795                	li	a5,5
    80202dea:	0497e163          	bltu	a5,s1,80202e2c <argraw+0x58>
    80202dee:	048a                	slli	s1,s1,0x2
    80202df0:	00008717          	auipc	a4,0x8
    80202df4:	d9870713          	addi	a4,a4,-616 # 8020ab88 <digits+0x808>
    80202df8:	94ba                	add	s1,s1,a4
    80202dfa:	409c                	lw	a5,0(s1)
    80202dfc:	97ba                	add	a5,a5,a4
    80202dfe:	8782                	jr	a5
  case 0:
    return p->trapframe->a0;
    80202e00:	713c                	ld	a5,96(a0)
    80202e02:	7ba8                	ld	a0,112(a5)
  case 5:
    return p->trapframe->a5;
  }
  panic("argraw");
  return -1;
}
    80202e04:	60e2                	ld	ra,24(sp)
    80202e06:	6442                	ld	s0,16(sp)
    80202e08:	64a2                	ld	s1,8(sp)
    80202e0a:	6105                	addi	sp,sp,32
    80202e0c:	8082                	ret
    return p->trapframe->a1;
    80202e0e:	713c                	ld	a5,96(a0)
    80202e10:	7fa8                	ld	a0,120(a5)
    80202e12:	bfcd                	j	80202e04 <argraw+0x30>
    return p->trapframe->a2;
    80202e14:	713c                	ld	a5,96(a0)
    80202e16:	63c8                	ld	a0,128(a5)
    80202e18:	b7f5                	j	80202e04 <argraw+0x30>
    return p->trapframe->a3;
    80202e1a:	713c                	ld	a5,96(a0)
    80202e1c:	67c8                	ld	a0,136(a5)
    80202e1e:	b7dd                	j	80202e04 <argraw+0x30>
    return p->trapframe->a4;
    80202e20:	713c                	ld	a5,96(a0)
    80202e22:	6bc8                	ld	a0,144(a5)
    80202e24:	b7c5                	j	80202e04 <argraw+0x30>
    return p->trapframe->a5;
    80202e26:	713c                	ld	a5,96(a0)
    80202e28:	6fc8                	ld	a0,152(a5)
    80202e2a:	bfe9                	j	80202e04 <argraw+0x30>
  panic("argraw");
    80202e2c:	00008517          	auipc	a0,0x8
    80202e30:	b4450513          	addi	a0,a0,-1212 # 8020a970 <digits+0x5f0>
    80202e34:	ffffd097          	auipc	ra,0xffffd
    80202e38:	30e080e7          	jalr	782(ra) # 80200142 <panic>

0000000080202e3c <sys_sysinfo>:
    return 0;
}

uint64
sys_sysinfo(void)
{
    80202e3c:	7179                	addi	sp,sp,-48
    80202e3e:	f406                	sd	ra,40(sp)
    80202e40:	f022                	sd	s0,32(sp)
    80202e42:	ec26                	sd	s1,24(sp)
    80202e44:	1800                	addi	s0,sp,48
  *ip = argraw(n);
    80202e46:	4501                	li	a0,0
    80202e48:	00000097          	auipc	ra,0x0
    80202e4c:	f8c080e7          	jalr	-116(ra) # 80202dd4 <argraw>
    80202e50:	84aa                	mv	s1,a0
  if (argaddr(0, &addr) < 0) {
    return -1;
  }

  struct sysinfo info;
  info.freemem = freemem_amount();
    80202e52:	ffffd097          	auipc	ra,0xffffd
    80202e56:	770080e7          	jalr	1904(ra) # 802005c2 <freemem_amount>
    80202e5a:	fca43823          	sd	a0,-48(s0)
  info.nproc = procnum();
    80202e5e:	fffff097          	auipc	ra,0xfffff
    80202e62:	7ce080e7          	jalr	1998(ra) # 8020262c <procnum>
    80202e66:	fca43c23          	sd	a0,-40(s0)

  // if (copyout(p->pagetable, addr, (char *)&info, sizeof(info)) < 0) {
  if (copyout2(addr, (char *)&info, sizeof(info)) < 0) {
    80202e6a:	4641                	li	a2,16
    80202e6c:	fd040593          	addi	a1,s0,-48
    80202e70:	8526                	mv	a0,s1
    80202e72:	ffffe097          	auipc	ra,0xffffe
    80202e76:	50a080e7          	jalr	1290(ra) # 8020137c <copyout2>
    return -1;
  }

  return 0;
    80202e7a:	957d                	srai	a0,a0,0x3f
    80202e7c:	70a2                	ld	ra,40(sp)
    80202e7e:	7402                	ld	s0,32(sp)
    80202e80:	64e2                	ld	s1,24(sp)
    80202e82:	6145                	addi	sp,sp,48
    80202e84:	8082                	ret

0000000080202e86 <fetchaddr>:
{
    80202e86:	1101                	addi	sp,sp,-32
    80202e88:	ec06                	sd	ra,24(sp)
    80202e8a:	e822                	sd	s0,16(sp)
    80202e8c:	e426                	sd	s1,8(sp)
    80202e8e:	e04a                	sd	s2,0(sp)
    80202e90:	1000                	addi	s0,sp,32
    80202e92:	84aa                	mv	s1,a0
    80202e94:	892e                	mv	s2,a1
  struct proc *p = myproc();
    80202e96:	fffff097          	auipc	ra,0xfffff
    80202e9a:	bc2080e7          	jalr	-1086(ra) # 80201a58 <myproc>
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    80202e9e:	653c                	ld	a5,72(a0)
    80202ea0:	02f4f763          	bgeu	s1,a5,80202ece <fetchaddr+0x48>
    80202ea4:	00848713          	addi	a4,s1,8
    80202ea8:	02e7e563          	bltu	a5,a4,80202ed2 <fetchaddr+0x4c>
  if(copyin2((char *)ip, addr, sizeof(*ip)) != 0)
    80202eac:	4621                	li	a2,8
    80202eae:	85a6                	mv	a1,s1
    80202eb0:	854a                	mv	a0,s2
    80202eb2:	ffffe097          	auipc	ra,0xffffe
    80202eb6:	5a8080e7          	jalr	1448(ra) # 8020145a <copyin2>
    80202eba:	00a03533          	snez	a0,a0
    80202ebe:	40a00533          	neg	a0,a0
}
    80202ec2:	60e2                	ld	ra,24(sp)
    80202ec4:	6442                	ld	s0,16(sp)
    80202ec6:	64a2                	ld	s1,8(sp)
    80202ec8:	6902                	ld	s2,0(sp)
    80202eca:	6105                	addi	sp,sp,32
    80202ecc:	8082                	ret
    return -1;
    80202ece:	557d                	li	a0,-1
    80202ed0:	bfcd                	j	80202ec2 <fetchaddr+0x3c>
    80202ed2:	557d                	li	a0,-1
    80202ed4:	b7fd                	j	80202ec2 <fetchaddr+0x3c>

0000000080202ed6 <fetchstr>:
{
    80202ed6:	1101                	addi	sp,sp,-32
    80202ed8:	ec06                	sd	ra,24(sp)
    80202eda:	e822                	sd	s0,16(sp)
    80202edc:	e426                	sd	s1,8(sp)
    80202ede:	1000                	addi	s0,sp,32
    80202ee0:	84ae                	mv	s1,a1
  int err = copyinstr2(buf, addr, max);
    80202ee2:	85aa                	mv	a1,a0
    80202ee4:	8526                	mv	a0,s1
    80202ee6:	ffffe097          	auipc	ra,0xffffe
    80202eea:	67a080e7          	jalr	1658(ra) # 80201560 <copyinstr2>
  if(err < 0)
    80202eee:	00054763          	bltz	a0,80202efc <fetchstr+0x26>
  return strlen(buf);
    80202ef2:	8526                	mv	a0,s1
    80202ef4:	ffffe097          	auipc	ra,0xffffe
    80202ef8:	9f8080e7          	jalr	-1544(ra) # 802008ec <strlen>
}
    80202efc:	60e2                	ld	ra,24(sp)
    80202efe:	6442                	ld	s0,16(sp)
    80202f00:	64a2                	ld	s1,8(sp)
    80202f02:	6105                	addi	sp,sp,32
    80202f04:	8082                	ret

0000000080202f06 <argint>:
{
    80202f06:	1101                	addi	sp,sp,-32
    80202f08:	ec06                	sd	ra,24(sp)
    80202f0a:	e822                	sd	s0,16(sp)
    80202f0c:	e426                	sd	s1,8(sp)
    80202f0e:	1000                	addi	s0,sp,32
    80202f10:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80202f12:	00000097          	auipc	ra,0x0
    80202f16:	ec2080e7          	jalr	-318(ra) # 80202dd4 <argraw>
    80202f1a:	c088                	sw	a0,0(s1)
}
    80202f1c:	4501                	li	a0,0
    80202f1e:	60e2                	ld	ra,24(sp)
    80202f20:	6442                	ld	s0,16(sp)
    80202f22:	64a2                	ld	s1,8(sp)
    80202f24:	6105                	addi	sp,sp,32
    80202f26:	8082                	ret

0000000080202f28 <sys_test_proc>:
sys_test_proc(void) {
    80202f28:	1101                	addi	sp,sp,-32
    80202f2a:	ec06                	sd	ra,24(sp)
    80202f2c:	e822                	sd	s0,16(sp)
    80202f2e:	1000                	addi	s0,sp,32
    argint(0, &n);
    80202f30:	fec40593          	addi	a1,s0,-20
    80202f34:	4501                	li	a0,0
    80202f36:	00000097          	auipc	ra,0x0
    80202f3a:	fd0080e7          	jalr	-48(ra) # 80202f06 <argint>
    printf("hello world from proc %d, hart %d, arg %d\n", myproc()->pid, r_tp(), n);
    80202f3e:	fffff097          	auipc	ra,0xfffff
    80202f42:	b1a080e7          	jalr	-1254(ra) # 80201a58 <myproc>
    80202f46:	8612                	mv	a2,tp
    80202f48:	fec42683          	lw	a3,-20(s0)
    80202f4c:	5d0c                	lw	a1,56(a0)
    80202f4e:	00008517          	auipc	a0,0x8
    80202f52:	a2a50513          	addi	a0,a0,-1494 # 8020a978 <digits+0x5f8>
    80202f56:	ffffd097          	auipc	ra,0xffffd
    80202f5a:	236080e7          	jalr	566(ra) # 8020018c <printf>
}
    80202f5e:	4501                	li	a0,0
    80202f60:	60e2                	ld	ra,24(sp)
    80202f62:	6442                	ld	s0,16(sp)
    80202f64:	6105                	addi	sp,sp,32
    80202f66:	8082                	ret

0000000080202f68 <argaddr>:
{
    80202f68:	1101                	addi	sp,sp,-32
    80202f6a:	ec06                	sd	ra,24(sp)
    80202f6c:	e822                	sd	s0,16(sp)
    80202f6e:	e426                	sd	s1,8(sp)
    80202f70:	1000                	addi	s0,sp,32
    80202f72:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80202f74:	00000097          	auipc	ra,0x0
    80202f78:	e60080e7          	jalr	-416(ra) # 80202dd4 <argraw>
    80202f7c:	e088                	sd	a0,0(s1)
}
    80202f7e:	4501                	li	a0,0
    80202f80:	60e2                	ld	ra,24(sp)
    80202f82:	6442                	ld	s0,16(sp)
    80202f84:	64a2                	ld	s1,8(sp)
    80202f86:	6105                	addi	sp,sp,32
    80202f88:	8082                	ret

0000000080202f8a <argstr>:
{
    80202f8a:	1101                	addi	sp,sp,-32
    80202f8c:	ec06                	sd	ra,24(sp)
    80202f8e:	e822                	sd	s0,16(sp)
    80202f90:	e426                	sd	s1,8(sp)
    80202f92:	e04a                	sd	s2,0(sp)
    80202f94:	1000                	addi	s0,sp,32
    80202f96:	84ae                	mv	s1,a1
    80202f98:	8932                	mv	s2,a2
  *ip = argraw(n);
    80202f9a:	00000097          	auipc	ra,0x0
    80202f9e:	e3a080e7          	jalr	-454(ra) # 80202dd4 <argraw>
  return fetchstr(addr, buf, max);
    80202fa2:	864a                	mv	a2,s2
    80202fa4:	85a6                	mv	a1,s1
    80202fa6:	00000097          	auipc	ra,0x0
    80202faa:	f30080e7          	jalr	-208(ra) # 80202ed6 <fetchstr>
}
    80202fae:	60e2                	ld	ra,24(sp)
    80202fb0:	6442                	ld	s0,16(sp)
    80202fb2:	64a2                	ld	s1,8(sp)
    80202fb4:	6902                	ld	s2,0(sp)
    80202fb6:	6105                	addi	sp,sp,32
    80202fb8:	8082                	ret

0000000080202fba <syscall>:
{
    80202fba:	7179                	addi	sp,sp,-48
    80202fbc:	f406                	sd	ra,40(sp)
    80202fbe:	f022                	sd	s0,32(sp)
    80202fc0:	ec26                	sd	s1,24(sp)
    80202fc2:	e84a                	sd	s2,16(sp)
    80202fc4:	e44e                	sd	s3,8(sp)
    80202fc6:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80202fc8:	fffff097          	auipc	ra,0xfffff
    80202fcc:	a90080e7          	jalr	-1392(ra) # 80201a58 <myproc>
    80202fd0:	84aa                	mv	s1,a0
  num = p->trapframe->a7;
    80202fd2:	06053903          	ld	s2,96(a0)
    80202fd6:	0a893783          	ld	a5,168(s2)
    80202fda:	0007899b          	sext.w	s3,a5
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    80202fde:	37fd                	addiw	a5,a5,-1
    80202fe0:	20100713          	li	a4,513
    80202fe4:	04f76863          	bltu	a4,a5,80203034 <syscall+0x7a>
    80202fe8:	00399713          	slli	a4,s3,0x3
    80202fec:	00008797          	auipc	a5,0x8
    80202ff0:	07c78793          	addi	a5,a5,124 # 8020b068 <syscalls>
    80202ff4:	97ba                	add	a5,a5,a4
    80202ff6:	639c                	ld	a5,0(a5)
    80202ff8:	cf95                	beqz	a5,80203034 <syscall+0x7a>
    p->trapframe->a0 = syscalls[num]();
    80202ffa:	9782                	jalr	a5
    80202ffc:	06a93823          	sd	a0,112(s2)
    if ((p->tmask & (1 << num)) != 0) {
    80203000:	4f04a783          	lw	a5,1264(s1)
    80203004:	4137d7bb          	sraw	a5,a5,s3
    80203008:	8b85                	andi	a5,a5,1
    8020300a:	c7a1                	beqz	a5,80203052 <syscall+0x98>
      printf("pid %d: %s -> %d\n", p->pid, sysnames[num], p->trapframe->a0);
    8020300c:	70b8                	ld	a4,96(s1)
    8020300e:	098e                	slli	s3,s3,0x3
    80203010:	00009797          	auipc	a5,0x9
    80203014:	07078793          	addi	a5,a5,112 # 8020c080 <sysnames>
    80203018:	99be                	add	s3,s3,a5
    8020301a:	7b34                	ld	a3,112(a4)
    8020301c:	0009b603          	ld	a2,0(s3)
    80203020:	5c8c                	lw	a1,56(s1)
    80203022:	00008517          	auipc	a0,0x8
    80203026:	98650513          	addi	a0,a0,-1658 # 8020a9a8 <digits+0x628>
    8020302a:	ffffd097          	auipc	ra,0xffffd
    8020302e:	162080e7          	jalr	354(ra) # 8020018c <printf>
    80203032:	a005                	j	80203052 <syscall+0x98>
    printf("pid %d %s: unknown sys call %d\n",
    80203034:	86ce                	mv	a3,s3
    80203036:	4e048613          	addi	a2,s1,1248
    8020303a:	5c8c                	lw	a1,56(s1)
    8020303c:	00008517          	auipc	a0,0x8
    80203040:	98450513          	addi	a0,a0,-1660 # 8020a9c0 <digits+0x640>
    80203044:	ffffd097          	auipc	ra,0xffffd
    80203048:	148080e7          	jalr	328(ra) # 8020018c <printf>
    p->trapframe->a0 = -1;
    8020304c:	70bc                	ld	a5,96(s1)
    8020304e:	577d                	li	a4,-1
    80203050:	fbb8                	sd	a4,112(a5)
}
    80203052:	70a2                	ld	ra,40(sp)
    80203054:	7402                	ld	s0,32(sp)
    80203056:	64e2                	ld	s1,24(sp)
    80203058:	6942                	ld	s2,16(sp)
    8020305a:	69a2                	ld	s3,8(sp)
    8020305c:	6145                	addi	sp,sp,48
    8020305e:	8082                	ret

0000000080203060 <sys_exec>:
#include "include/sbi.h"
extern int exec(char *path, char **argv);

uint64
sys_exec(void)
{
    80203060:	da010113          	addi	sp,sp,-608
    80203064:	24113c23          	sd	ra,600(sp)
    80203068:	24813823          	sd	s0,592(sp)
    8020306c:	24913423          	sd	s1,584(sp)
    80203070:	25213023          	sd	s2,576(sp)
    80203074:	23313c23          	sd	s3,568(sp)
    80203078:	23413823          	sd	s4,560(sp)
    8020307c:	23513423          	sd	s5,552(sp)
    80203080:	23613023          	sd	s6,544(sp)
    80203084:	1480                	addi	s0,sp,608
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    80203086:	10400613          	li	a2,260
    8020308a:	eb840593          	addi	a1,s0,-328
    8020308e:	4501                	li	a0,0
    80203090:	00000097          	auipc	ra,0x0
    80203094:	efa080e7          	jalr	-262(ra) # 80202f8a <argstr>
    return -1;
    80203098:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    8020309a:	0c054a63          	bltz	a0,8020316e <sys_exec+0x10e>
    8020309e:	db040593          	addi	a1,s0,-592
    802030a2:	4505                	li	a0,1
    802030a4:	00000097          	auipc	ra,0x0
    802030a8:	ec4080e7          	jalr	-316(ra) # 80202f68 <argaddr>
    802030ac:	0c054163          	bltz	a0,8020316e <sys_exec+0x10e>
  }
  memset(argv, 0, sizeof(argv));
    802030b0:	10000613          	li	a2,256
    802030b4:	4581                	li	a1,0
    802030b6:	db840993          	addi	s3,s0,-584
    802030ba:	854e                	mv	a0,s3
    802030bc:	ffffd097          	auipc	ra,0xffffd
    802030c0:	6a8080e7          	jalr	1704(ra) # 80200764 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    802030c4:	84ce                	mv	s1,s3
  memset(argv, 0, sizeof(argv));
    802030c6:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802030c8:	da840a13          	addi	s4,s0,-600
    if(i >= NELEM(argv)){
    802030cc:	02000a93          	li	s5,32
    802030d0:	00090b1b          	sext.w	s6,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802030d4:	00391513          	slli	a0,s2,0x3
    802030d8:	85d2                	mv	a1,s4
    802030da:	db043783          	ld	a5,-592(s0)
    802030de:	953e                	add	a0,a0,a5
    802030e0:	00000097          	auipc	ra,0x0
    802030e4:	da6080e7          	jalr	-602(ra) # 80202e86 <fetchaddr>
    802030e8:	02054a63          	bltz	a0,8020311c <sys_exec+0xbc>
      goto bad;
    }
    if(uarg == 0){
    802030ec:	da843783          	ld	a5,-600(s0)
    802030f0:	c3b9                	beqz	a5,80203136 <sys_exec+0xd6>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    802030f2:	ffffd097          	auipc	ra,0xffffd
    802030f6:	46a080e7          	jalr	1130(ra) # 8020055c <kalloc>
    802030fa:	85aa                	mv	a1,a0
    802030fc:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    80203100:	cd11                	beqz	a0,8020311c <sys_exec+0xbc>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80203102:	6605                	lui	a2,0x1
    80203104:	da843503          	ld	a0,-600(s0)
    80203108:	00000097          	auipc	ra,0x0
    8020310c:	dce080e7          	jalr	-562(ra) # 80202ed6 <fetchstr>
    80203110:	00054663          	bltz	a0,8020311c <sys_exec+0xbc>
    if(i >= NELEM(argv)){
    80203114:	0905                	addi	s2,s2,1
    80203116:	09a1                	addi	s3,s3,8
    80203118:	fb591ce3          	bne	s2,s5,802030d0 <sys_exec+0x70>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020311c:	10048913          	addi	s2,s1,256
    80203120:	6088                	ld	a0,0(s1)
    80203122:	c529                	beqz	a0,8020316c <sys_exec+0x10c>
    kfree(argv[i]);
    80203124:	ffffd097          	auipc	ra,0xffffd
    80203128:	320080e7          	jalr	800(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020312c:	04a1                	addi	s1,s1,8
    8020312e:	ff2499e3          	bne	s1,s2,80203120 <sys_exec+0xc0>
  return -1;
    80203132:	597d                	li	s2,-1
    80203134:	a82d                	j	8020316e <sys_exec+0x10e>
      argv[i] = 0;
    80203136:	0b0e                	slli	s6,s6,0x3
    80203138:	fc040793          	addi	a5,s0,-64
    8020313c:	9b3e                	add	s6,s6,a5
    8020313e:	de0b3c23          	sd	zero,-520(s6) # df8 <_entry-0x801ff208>
  int ret = exec(path, argv);
    80203142:	db840593          	addi	a1,s0,-584
    80203146:	eb840513          	addi	a0,s0,-328
    8020314a:	00001097          	auipc	ra,0x1
    8020314e:	342080e7          	jalr	834(ra) # 8020448c <exec>
    80203152:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203154:	10048993          	addi	s3,s1,256
    80203158:	6088                	ld	a0,0(s1)
    8020315a:	c911                	beqz	a0,8020316e <sys_exec+0x10e>
    kfree(argv[i]);
    8020315c:	ffffd097          	auipc	ra,0xffffd
    80203160:	2e8080e7          	jalr	744(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203164:	04a1                	addi	s1,s1,8
    80203166:	ff3499e3          	bne	s1,s3,80203158 <sys_exec+0xf8>
    8020316a:	a011                	j	8020316e <sys_exec+0x10e>
  return -1;
    8020316c:	597d                	li	s2,-1
}
    8020316e:	854a                	mv	a0,s2
    80203170:	25813083          	ld	ra,600(sp)
    80203174:	25013403          	ld	s0,592(sp)
    80203178:	24813483          	ld	s1,584(sp)
    8020317c:	24013903          	ld	s2,576(sp)
    80203180:	23813983          	ld	s3,568(sp)
    80203184:	23013a03          	ld	s4,560(sp)
    80203188:	22813a83          	ld	s5,552(sp)
    8020318c:	22013b03          	ld	s6,544(sp)
    80203190:	26010113          	addi	sp,sp,608
    80203194:	8082                	ret

0000000080203196 <sys_exit>:

uint64
sys_exit(void)
{
    80203196:	1101                	addi	sp,sp,-32
    80203198:	ec06                	sd	ra,24(sp)
    8020319a:	e822                	sd	s0,16(sp)
    8020319c:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    8020319e:	fec40593          	addi	a1,s0,-20
    802031a2:	4501                	li	a0,0
    802031a4:	00000097          	auipc	ra,0x0
    802031a8:	d62080e7          	jalr	-670(ra) # 80202f06 <argint>
    return -1;
    802031ac:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    802031ae:	00054963          	bltz	a0,802031c0 <sys_exit+0x2a>
  exit(n);
    802031b2:	fec42503          	lw	a0,-20(s0)
    802031b6:	fffff097          	auipc	ra,0xfffff
    802031ba:	fd6080e7          	jalr	-42(ra) # 8020218c <exit>
  return 0;  // not reached
    802031be:	4781                	li	a5,0
}
    802031c0:	853e                	mv	a0,a5
    802031c2:	60e2                	ld	ra,24(sp)
    802031c4:	6442                	ld	s0,16(sp)
    802031c6:	6105                	addi	sp,sp,32
    802031c8:	8082                	ret

00000000802031ca <sys_getpid>:

uint64
sys_getpid(void)
{
    802031ca:	1141                	addi	sp,sp,-16
    802031cc:	e406                	sd	ra,8(sp)
    802031ce:	e022                	sd	s0,0(sp)
    802031d0:	0800                	addi	s0,sp,16
  return myproc()->pid;
    802031d2:	fffff097          	auipc	ra,0xfffff
    802031d6:	886080e7          	jalr	-1914(ra) # 80201a58 <myproc>
}
    802031da:	5d08                	lw	a0,56(a0)
    802031dc:	60a2                	ld	ra,8(sp)
    802031de:	6402                	ld	s0,0(sp)
    802031e0:	0141                	addi	sp,sp,16
    802031e2:	8082                	ret

00000000802031e4 <sys_fork>:

uint64
sys_fork(void)
{
    802031e4:	1141                	addi	sp,sp,-16
    802031e6:	e406                	sd	ra,8(sp)
    802031e8:	e022                	sd	s0,0(sp)
    802031ea:	0800                	addi	s0,sp,16
  return fork();
    802031ec:	fffff097          	auipc	ra,0xfffff
    802031f0:	c66080e7          	jalr	-922(ra) # 80201e52 <fork>
}
    802031f4:	60a2                	ld	ra,8(sp)
    802031f6:	6402                	ld	s0,0(sp)
    802031f8:	0141                	addi	sp,sp,16
    802031fa:	8082                	ret

00000000802031fc <sys_wait>:

uint64
sys_wait(void)
{
    802031fc:	1101                	addi	sp,sp,-32
    802031fe:	ec06                	sd	ra,24(sp)
    80203200:	e822                	sd	s0,16(sp)
    80203202:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    80203204:	fe840593          	addi	a1,s0,-24
    80203208:	4501                	li	a0,0
    8020320a:	00000097          	auipc	ra,0x0
    8020320e:	d5e080e7          	jalr	-674(ra) # 80202f68 <argaddr>
    80203212:	87aa                	mv	a5,a0
    return -1;
    80203214:	557d                	li	a0,-1
  if(argaddr(0, &p) < 0)
    80203216:	0007c863          	bltz	a5,80203226 <sys_wait+0x2a>
  return wait(p);
    8020321a:	fe843503          	ld	a0,-24(s0)
    8020321e:	fffff097          	auipc	ra,0xfffff
    80203222:	112080e7          	jalr	274(ra) # 80202330 <wait>
}
    80203226:	60e2                	ld	ra,24(sp)
    80203228:	6442                	ld	s0,16(sp)
    8020322a:	6105                	addi	sp,sp,32
    8020322c:	8082                	ret

000000008020322e <sys_sbrk>:

uint64
sys_sbrk(void)
{
    8020322e:	7179                	addi	sp,sp,-48
    80203230:	f406                	sd	ra,40(sp)
    80203232:	f022                	sd	s0,32(sp)
    80203234:	ec26                	sd	s1,24(sp)
    80203236:	1800                	addi	s0,sp,48
  int addr;
  int n;

  if(argint(0, &n) < 0)
    80203238:	fdc40593          	addi	a1,s0,-36
    8020323c:	4501                	li	a0,0
    8020323e:	00000097          	auipc	ra,0x0
    80203242:	cc8080e7          	jalr	-824(ra) # 80202f06 <argint>
    80203246:	87aa                	mv	a5,a0
    return -1;
    80203248:	557d                	li	a0,-1
  if(argint(0, &n) < 0)
    8020324a:	0207c063          	bltz	a5,8020326a <sys_sbrk+0x3c>
  addr = myproc()->sz;
    8020324e:	fffff097          	auipc	ra,0xfffff
    80203252:	80a080e7          	jalr	-2038(ra) # 80201a58 <myproc>
    80203256:	4524                	lw	s1,72(a0)
  if(growproc(n) < 0)
    80203258:	fdc42503          	lw	a0,-36(s0)
    8020325c:	fffff097          	auipc	ra,0xfffff
    80203260:	b7e080e7          	jalr	-1154(ra) # 80201dda <growproc>
    80203264:	00054863          	bltz	a0,80203274 <sys_sbrk+0x46>
    return -1;
  return addr;
    80203268:	8526                	mv	a0,s1
}
    8020326a:	70a2                	ld	ra,40(sp)
    8020326c:	7402                	ld	s0,32(sp)
    8020326e:	64e2                	ld	s1,24(sp)
    80203270:	6145                	addi	sp,sp,48
    80203272:	8082                	ret
    return -1;
    80203274:	557d                	li	a0,-1
    80203276:	bfd5                	j	8020326a <sys_sbrk+0x3c>

0000000080203278 <sys_sleep>:

uint64
sys_sleep(void)
{
    80203278:	7139                	addi	sp,sp,-64
    8020327a:	fc06                	sd	ra,56(sp)
    8020327c:	f822                	sd	s0,48(sp)
    8020327e:	f426                	sd	s1,40(sp)
    80203280:	f04a                	sd	s2,32(sp)
    80203282:	ec4e                	sd	s3,24(sp)
    80203284:	0080                	addi	s0,sp,64
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    80203286:	fcc40593          	addi	a1,s0,-52
    8020328a:	4501                	li	a0,0
    8020328c:	00000097          	auipc	ra,0x0
    80203290:	c7a080e7          	jalr	-902(ra) # 80202f06 <argint>
    return -1;
    80203294:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    80203296:	06054763          	bltz	a0,80203304 <sys_sleep+0x8c>
  acquire(&tickslock);
    8020329a:	0000a517          	auipc	a0,0xa
    8020329e:	e4e53503          	ld	a0,-434(a0) # 8020d0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    802032a2:	ffffd097          	auipc	ra,0xffffd
    802032a6:	426080e7          	jalr	1062(ra) # 802006c8 <acquire>
  ticks0 = ticks;
    802032aa:	0000a797          	auipc	a5,0xa
    802032ae:	e4e7b783          	ld	a5,-434(a5) # 8020d0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
    802032b2:	0007a903          	lw	s2,0(a5)
  while(ticks - ticks0 < n){
    802032b6:	fcc42783          	lw	a5,-52(s0)
    802032ba:	cf85                	beqz	a5,802032f2 <sys_sleep+0x7a>
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
    802032bc:	0000a997          	auipc	s3,0xa
    802032c0:	e2c9b983          	ld	s3,-468(s3) # 8020d0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    802032c4:	0000a497          	auipc	s1,0xa
    802032c8:	e344b483          	ld	s1,-460(s1) # 8020d0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
    if(myproc()->killed){
    802032cc:	ffffe097          	auipc	ra,0xffffe
    802032d0:	78c080e7          	jalr	1932(ra) # 80201a58 <myproc>
    802032d4:	591c                	lw	a5,48(a0)
    802032d6:	ef9d                	bnez	a5,80203314 <sys_sleep+0x9c>
    sleep(&ticks, &tickslock);
    802032d8:	85ce                	mv	a1,s3
    802032da:	8526                	mv	a0,s1
    802032dc:	fffff097          	auipc	ra,0xfffff
    802032e0:	fd6080e7          	jalr	-42(ra) # 802022b2 <sleep>
  while(ticks - ticks0 < n){
    802032e4:	409c                	lw	a5,0(s1)
    802032e6:	412787bb          	subw	a5,a5,s2
    802032ea:	fcc42703          	lw	a4,-52(s0)
    802032ee:	fce7efe3          	bltu	a5,a4,802032cc <sys_sleep+0x54>
  }
  release(&tickslock);
    802032f2:	0000a517          	auipc	a0,0xa
    802032f6:	df653503          	ld	a0,-522(a0) # 8020d0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    802032fa:	ffffd097          	auipc	ra,0xffffd
    802032fe:	422080e7          	jalr	1058(ra) # 8020071c <release>
  return 0;
    80203302:	4781                	li	a5,0
}
    80203304:	853e                	mv	a0,a5
    80203306:	70e2                	ld	ra,56(sp)
    80203308:	7442                	ld	s0,48(sp)
    8020330a:	74a2                	ld	s1,40(sp)
    8020330c:	7902                	ld	s2,32(sp)
    8020330e:	69e2                	ld	s3,24(sp)
    80203310:	6121                	addi	sp,sp,64
    80203312:	8082                	ret
      release(&tickslock);
    80203314:	0000a517          	auipc	a0,0xa
    80203318:	dd453503          	ld	a0,-556(a0) # 8020d0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    8020331c:	ffffd097          	auipc	ra,0xffffd
    80203320:	400080e7          	jalr	1024(ra) # 8020071c <release>
      return -1;
    80203324:	57fd                	li	a5,-1
    80203326:	bff9                	j	80203304 <sys_sleep+0x8c>

0000000080203328 <sys_kill>:

uint64
sys_kill(void)
{
    80203328:	1101                	addi	sp,sp,-32
    8020332a:	ec06                	sd	ra,24(sp)
    8020332c:	e822                	sd	s0,16(sp)
    8020332e:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    80203330:	fec40593          	addi	a1,s0,-20
    80203334:	4501                	li	a0,0
    80203336:	00000097          	auipc	ra,0x0
    8020333a:	bd0080e7          	jalr	-1072(ra) # 80202f06 <argint>
    8020333e:	87aa                	mv	a5,a0
    return -1;
    80203340:	557d                	li	a0,-1
  if(argint(0, &pid) < 0)
    80203342:	0007c863          	bltz	a5,80203352 <sys_kill+0x2a>
  return kill(pid);
    80203346:	fec42503          	lw	a0,-20(s0)
    8020334a:	fffff097          	auipc	ra,0xfffff
    8020334e:	154080e7          	jalr	340(ra) # 8020249e <kill>
}
    80203352:	60e2                	ld	ra,24(sp)
    80203354:	6442                	ld	s0,16(sp)
    80203356:	6105                	addi	sp,sp,32
    80203358:	8082                	ret

000000008020335a <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    8020335a:	1101                	addi	sp,sp,-32
    8020335c:	ec06                	sd	ra,24(sp)
    8020335e:	e822                	sd	s0,16(sp)
    80203360:	e426                	sd	s1,8(sp)
    80203362:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    80203364:	0000a517          	auipc	a0,0xa
    80203368:	d8453503          	ld	a0,-636(a0) # 8020d0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    8020336c:	ffffd097          	auipc	ra,0xffffd
    80203370:	35c080e7          	jalr	860(ra) # 802006c8 <acquire>
  xticks = ticks;
    80203374:	0000a797          	auipc	a5,0xa
    80203378:	d847b783          	ld	a5,-636(a5) # 8020d0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
    8020337c:	4384                	lw	s1,0(a5)
  release(&tickslock);
    8020337e:	0000a517          	auipc	a0,0xa
    80203382:	d6a53503          	ld	a0,-662(a0) # 8020d0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    80203386:	ffffd097          	auipc	ra,0xffffd
    8020338a:	396080e7          	jalr	918(ra) # 8020071c <release>
  return xticks;
}
    8020338e:	02049513          	slli	a0,s1,0x20
    80203392:	9101                	srli	a0,a0,0x20
    80203394:	60e2                	ld	ra,24(sp)
    80203396:	6442                	ld	s0,16(sp)
    80203398:	64a2                	ld	s1,8(sp)
    8020339a:	6105                	addi	sp,sp,32
    8020339c:	8082                	ret

000000008020339e <sys_trace>:
    
uint64
sys_trace(void)
{
    8020339e:	1101                	addi	sp,sp,-32
    802033a0:	ec06                	sd	ra,24(sp)
    802033a2:	e822                	sd	s0,16(sp)
    802033a4:	1000                	addi	s0,sp,32
  int mask;
  if(argint(0, &mask) < 0) {
    802033a6:	fec40593          	addi	a1,s0,-20
    802033aa:	4501                	li	a0,0
    802033ac:	00000097          	auipc	ra,0x0
    802033b0:	b5a080e7          	jalr	-1190(ra) # 80202f06 <argint>
    return -1;
    802033b4:	57fd                	li	a5,-1
  if(argint(0, &mask) < 0) {
    802033b6:	00054b63          	bltz	a0,802033cc <sys_trace+0x2e>
  }
  myproc()->tmask = mask;
    802033ba:	ffffe097          	auipc	ra,0xffffe
    802033be:	69e080e7          	jalr	1694(ra) # 80201a58 <myproc>
    802033c2:	fec42783          	lw	a5,-20(s0)
    802033c6:	4ef52823          	sw	a5,1264(a0)
  return 0;
    802033ca:	4781                	li	a5,0
}
    802033cc:	853e                	mv	a0,a5
    802033ce:	60e2                	ld	ra,24(sp)
    802033d0:	6442                	ld	s0,16(sp)
    802033d2:	6105                	addi	sp,sp,32
    802033d4:	8082                	ret

00000000802033d6 <sys_clone>:


// added by lmq for SYS_clone
uint64
sys_clone(void)
{
    802033d6:	7179                	addi	sp,sp,-48
    802033d8:	f406                	sd	ra,40(sp)
    802033da:	f022                	sd	s0,32(sp)
    802033dc:	1800                	addi	s0,sp,48
  int flags,stack,ptid,tls,ctid;
  if(argint(0, &flags) < 0) {
    802033de:	fec40593          	addi	a1,s0,-20
    802033e2:	4501                	li	a0,0
    802033e4:	00000097          	auipc	ra,0x0
    802033e8:	b22080e7          	jalr	-1246(ra) # 80202f06 <argint>
    return -1;
    802033ec:	57fd                	li	a5,-1
  if(argint(0, &flags) < 0) {
    802033ee:	06054963          	bltz	a0,80203460 <sys_clone+0x8a>
  }
  if(argint(1, &stack) < 0) {
    802033f2:	fe840593          	addi	a1,s0,-24
    802033f6:	4505                	li	a0,1
    802033f8:	00000097          	auipc	ra,0x0
    802033fc:	b0e080e7          	jalr	-1266(ra) # 80202f06 <argint>
    return -1;
    80203400:	57fd                	li	a5,-1
  if(argint(1, &stack) < 0) {
    80203402:	04054f63          	bltz	a0,80203460 <sys_clone+0x8a>
  }
  if(argint(2, &ptid) < 0) {
    80203406:	fe440593          	addi	a1,s0,-28
    8020340a:	4509                	li	a0,2
    8020340c:	00000097          	auipc	ra,0x0
    80203410:	afa080e7          	jalr	-1286(ra) # 80202f06 <argint>
    return -1;
    80203414:	57fd                	li	a5,-1
  if(argint(2, &ptid) < 0) {
    80203416:	04054563          	bltz	a0,80203460 <sys_clone+0x8a>
  }
  if(argint(3, &tls) < 0) {
    8020341a:	fe040593          	addi	a1,s0,-32
    8020341e:	450d                	li	a0,3
    80203420:	00000097          	auipc	ra,0x0
    80203424:	ae6080e7          	jalr	-1306(ra) # 80202f06 <argint>
    return -1;
    80203428:	57fd                	li	a5,-1
  if(argint(3, &tls) < 0) {
    8020342a:	02054b63          	bltz	a0,80203460 <sys_clone+0x8a>
  }
  if(argint(4, &ctid) < 0) {
    8020342e:	fdc40593          	addi	a1,s0,-36
    80203432:	4511                	li	a0,4
    80203434:	00000097          	auipc	ra,0x0
    80203438:	ad2080e7          	jalr	-1326(ra) # 80202f06 <argint>
    return -1;
    8020343c:	57fd                	li	a5,-1
  if(argint(4, &ctid) < 0) {
    8020343e:	02054163          	bltz	a0,80203460 <sys_clone+0x8a>
  }

  int new_pid=clone(flags,stack,ptid,tls,ctid);
    80203442:	fdc42703          	lw	a4,-36(s0)
    80203446:	fe042683          	lw	a3,-32(s0)
    8020344a:	fe442603          	lw	a2,-28(s0)
    8020344e:	fe842583          	lw	a1,-24(s0)
    80203452:	fec42503          	lw	a0,-20(s0)
    80203456:	fffff097          	auipc	ra,0xfffff
    8020345a:	206080e7          	jalr	518(ra) # 8020265c <clone>
  return new_pid;
    8020345e:	87aa                	mv	a5,a0
}
    80203460:	853e                	mv	a0,a5
    80203462:	70a2                	ld	ra,40(sp)
    80203464:	7402                	ld	s0,32(sp)
    80203466:	6145                	addi	sp,sp,48
    80203468:	8082                	ret

000000008020346a <sys_brk>:

// sys_brk lzq
// 将数据段addr 修改为 pos ， 成功则返回0
// Linux brk(0) return 0, but different in this work this will return the now addr
uint64
sys_brk(void){
    8020346a:	1101                	addi	sp,sp,-32
    8020346c:	ec06                	sd	ra,24(sp)
    8020346e:	e822                	sd	s0,16(sp)
    80203470:	1000                	addi	s0,sp,32
    int addr, pos;
    if(argint(0, &pos) <0 )
    80203472:	fec40593          	addi	a1,s0,-20
    80203476:	4501                	li	a0,0
    80203478:	00000097          	auipc	ra,0x0
    8020347c:	a8e080e7          	jalr	-1394(ra) # 80202f06 <argint>
    80203480:	04054063          	bltz	a0,802034c0 <sys_brk+0x56>
        return -1;
    addr = myproc()->sz;
    80203484:	ffffe097          	auipc	ra,0xffffe
    80203488:	5d4080e7          	jalr	1492(ra) # 80201a58 <myproc>
    8020348c:	4528                	lw	a0,72(a0)
    if(pos == 0) return addr;//the diff with Linux brk(0)
    8020348e:	fec42783          	lw	a5,-20(s0)
    80203492:	e789                	bnez	a5,8020349c <sys_brk+0x32>
    if(growproc(pos - addr) < 0)
        panic("growproc error");
    return 0;
}
    80203494:	60e2                	ld	ra,24(sp)
    80203496:	6442                	ld	s0,16(sp)
    80203498:	6105                	addi	sp,sp,32
    8020349a:	8082                	ret
    if(growproc(pos - addr) < 0)
    8020349c:	40a7853b          	subw	a0,a5,a0
    802034a0:	fffff097          	auipc	ra,0xfffff
    802034a4:	93a080e7          	jalr	-1734(ra) # 80201dda <growproc>
    802034a8:	87aa                	mv	a5,a0
    return 0;
    802034aa:	4501                	li	a0,0
    if(growproc(pos - addr) < 0)
    802034ac:	fe07d4e3          	bgez	a5,80203494 <sys_brk+0x2a>
        panic("growproc error");
    802034b0:	00007517          	auipc	a0,0x7
    802034b4:	6f050513          	addi	a0,a0,1776 # 8020aba0 <digits+0x820>
    802034b8:	ffffd097          	auipc	ra,0xffffd
    802034bc:	c8a080e7          	jalr	-886(ra) # 80200142 <panic>
        return -1;
    802034c0:	557d                	li	a0,-1
    802034c2:	bfc9                	j	80203494 <sys_brk+0x2a>

00000000802034c4 <sys_mmap>:

uint64
sys_mmap(void){
    802034c4:	1141                	addi	sp,sp,-16
    802034c6:	e422                	sd	s0,8(sp)
    802034c8:	0800                	addi	s0,sp,16
    if (mappages(myproc()->pagetable, len, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0) {
        kfree(mem);
        return 0;
    }
    return addr;
}
    802034ca:	4501                	li	a0,0
    802034cc:	6422                	ld	s0,8(sp)
    802034ce:	0141                	addi	sp,sp,16
    802034d0:	8082                	ret

00000000802034d2 <sys_wait4>:
//}

// added by lmq for SYS_wait4
uint64
sys_wait4(void)
{
    802034d2:	1101                	addi	sp,sp,-32
    802034d4:	ec06                	sd	ra,24(sp)
    802034d6:	e822                	sd	s0,16(sp)
    802034d8:	1000                	addi	s0,sp,32
  int cpid;             // child pid which current pid is waiting for
  uint64 addr;          // addr of wstatus
  argint(0,&cpid);
    802034da:	fec40593          	addi	a1,s0,-20
    802034de:	4501                	li	a0,0
    802034e0:	00000097          	auipc	ra,0x0
    802034e4:	a26080e7          	jalr	-1498(ra) # 80202f06 <argint>
  argaddr(1, &addr);
    802034e8:	fe040593          	addi	a1,s0,-32
    802034ec:	4505                	li	a0,1
    802034ee:	00000097          	auipc	ra,0x0
    802034f2:	a7a080e7          	jalr	-1414(ra) # 80202f68 <argaddr>
  return waitpid(cpid,addr,0);
    802034f6:	4601                	li	a2,0
    802034f8:	fe043583          	ld	a1,-32(s0)
    802034fc:	fec42503          	lw	a0,-20(s0)
    80203500:	fffff097          	auipc	ra,0xfffff
    80203504:	174080e7          	jalr	372(ra) # 80202674 <waitpid>
}
    80203508:	60e2                	ld	ra,24(sp)
    8020350a:	6442                	ld	s0,16(sp)
    8020350c:	6105                	addi	sp,sp,32
    8020350e:	8082                	ret

0000000080203510 <sys_sched_yield>:

// added by lmq for SYS_sched_yield
uint64
sys_sched_yield(void)
{
    80203510:	1141                	addi	sp,sp,-16
    80203512:	e406                	sd	ra,8(sp)
    80203514:	e022                	sd	s0,0(sp)
    80203516:	0800                	addi	s0,sp,16
  yield();
    80203518:	fffff097          	auipc	ra,0xfffff
    8020351c:	d5e080e7          	jalr	-674(ra) # 80202276 <yield>
  return 0;
}
    80203520:	4501                	li	a0,0
    80203522:	60a2                	ld	ra,8(sp)
    80203524:	6402                	ld	s0,0(sp)
    80203526:	0141                	addi	sp,sp,16
    80203528:	8082                	ret

000000008020352a <sys_getppid>:

// added by lmq for SYS_getppid
uint64 
sys_getppid(void)
{
    8020352a:	1141                	addi	sp,sp,-16
    8020352c:	e406                	sd	ra,8(sp)
    8020352e:	e022                	sd	s0,0(sp)
    80203530:	0800                	addi	s0,sp,16
  return myproc()->parent->pid;
    80203532:	ffffe097          	auipc	ra,0xffffe
    80203536:	526080e7          	jalr	1318(ra) # 80201a58 <myproc>
    8020353a:	711c                	ld	a5,32(a0)
}
    8020353c:	5f88                	lw	a0,56(a5)
    8020353e:	60a2                	ld	ra,8(sp)
    80203540:	6402                	ld	s0,0(sp)
    80203542:	0141                	addi	sp,sp,16
    80203544:	8082                	ret

0000000080203546 <sys_execve>:

// added by lmq for SYS_execve
uint64
sys_execve(void)
{
    80203546:	da010113          	addi	sp,sp,-608
    8020354a:	24113c23          	sd	ra,600(sp)
    8020354e:	24813823          	sd	s0,592(sp)
    80203552:	24913423          	sd	s1,584(sp)
    80203556:	25213023          	sd	s2,576(sp)
    8020355a:	23313c23          	sd	s3,568(sp)
    8020355e:	23413823          	sd	s4,560(sp)
    80203562:	23513423          	sd	s5,552(sp)
    80203566:	23613023          	sd	s6,544(sp)
    8020356a:	1480                	addi	s0,sp,608
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    8020356c:	10400613          	li	a2,260
    80203570:	eb840593          	addi	a1,s0,-328
    80203574:	4501                	li	a0,0
    80203576:	00000097          	auipc	ra,0x0
    8020357a:	a14080e7          	jalr	-1516(ra) # 80202f8a <argstr>
    return -1;
    8020357e:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    80203580:	0c054a63          	bltz	a0,80203654 <sys_execve+0x10e>
    80203584:	db040593          	addi	a1,s0,-592
    80203588:	4505                	li	a0,1
    8020358a:	00000097          	auipc	ra,0x0
    8020358e:	9de080e7          	jalr	-1570(ra) # 80202f68 <argaddr>
    80203592:	0c054163          	bltz	a0,80203654 <sys_execve+0x10e>
  }
  memset(argv, 0, sizeof(argv));
    80203596:	10000613          	li	a2,256
    8020359a:	4581                	li	a1,0
    8020359c:	db840993          	addi	s3,s0,-584
    802035a0:	854e                	mv	a0,s3
    802035a2:	ffffd097          	auipc	ra,0xffffd
    802035a6:	1c2080e7          	jalr	450(ra) # 80200764 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    802035aa:	84ce                	mv	s1,s3
  memset(argv, 0, sizeof(argv));
    802035ac:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802035ae:	da840a13          	addi	s4,s0,-600
    if(i >= NELEM(argv)){
    802035b2:	02000a93          	li	s5,32
    802035b6:	00090b1b          	sext.w	s6,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802035ba:	00391513          	slli	a0,s2,0x3
    802035be:	85d2                	mv	a1,s4
    802035c0:	db043783          	ld	a5,-592(s0)
    802035c4:	953e                	add	a0,a0,a5
    802035c6:	00000097          	auipc	ra,0x0
    802035ca:	8c0080e7          	jalr	-1856(ra) # 80202e86 <fetchaddr>
    802035ce:	02054a63          	bltz	a0,80203602 <sys_execve+0xbc>
      goto bad;
    }
    if(uarg == 0){
    802035d2:	da843783          	ld	a5,-600(s0)
    802035d6:	c3b9                	beqz	a5,8020361c <sys_execve+0xd6>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    802035d8:	ffffd097          	auipc	ra,0xffffd
    802035dc:	f84080e7          	jalr	-124(ra) # 8020055c <kalloc>
    802035e0:	85aa                	mv	a1,a0
    802035e2:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    802035e6:	cd11                	beqz	a0,80203602 <sys_execve+0xbc>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    802035e8:	6605                	lui	a2,0x1
    802035ea:	da843503          	ld	a0,-600(s0)
    802035ee:	00000097          	auipc	ra,0x0
    802035f2:	8e8080e7          	jalr	-1816(ra) # 80202ed6 <fetchstr>
    802035f6:	00054663          	bltz	a0,80203602 <sys_execve+0xbc>
    if(i >= NELEM(argv)){
    802035fa:	0905                	addi	s2,s2,1
    802035fc:	09a1                	addi	s3,s3,8
    802035fe:	fb591ce3          	bne	s2,s5,802035b6 <sys_execve+0x70>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203602:	10048913          	addi	s2,s1,256
    80203606:	6088                	ld	a0,0(s1)
    80203608:	c529                	beqz	a0,80203652 <sys_execve+0x10c>
    kfree(argv[i]);
    8020360a:	ffffd097          	auipc	ra,0xffffd
    8020360e:	e3a080e7          	jalr	-454(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203612:	04a1                	addi	s1,s1,8
    80203614:	ff2499e3          	bne	s1,s2,80203606 <sys_execve+0xc0>
  return -1;
    80203618:	597d                	li	s2,-1
    8020361a:	a82d                	j	80203654 <sys_execve+0x10e>
      argv[i] = 0;
    8020361c:	0b0e                	slli	s6,s6,0x3
    8020361e:	fc040793          	addi	a5,s0,-64
    80203622:	9b3e                	add	s6,s6,a5
    80203624:	de0b3c23          	sd	zero,-520(s6)
  int ret = exec(path, argv);
    80203628:	db840593          	addi	a1,s0,-584
    8020362c:	eb840513          	addi	a0,s0,-328
    80203630:	00001097          	auipc	ra,0x1
    80203634:	e5c080e7          	jalr	-420(ra) # 8020448c <exec>
    80203638:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020363a:	10048993          	addi	s3,s1,256
    8020363e:	6088                	ld	a0,0(s1)
    80203640:	c911                	beqz	a0,80203654 <sys_execve+0x10e>
    kfree(argv[i]);
    80203642:	ffffd097          	auipc	ra,0xffffd
    80203646:	e02080e7          	jalr	-510(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020364a:	04a1                	addi	s1,s1,8
    8020364c:	ff3499e3          	bne	s1,s3,8020363e <sys_execve+0xf8>
    80203650:	a011                	j	80203654 <sys_execve+0x10e>
  return -1;
    80203652:	597d                	li	s2,-1

}
    80203654:	854a                	mv	a0,s2
    80203656:	25813083          	ld	ra,600(sp)
    8020365a:	25013403          	ld	s0,592(sp)
    8020365e:	24813483          	ld	s1,584(sp)
    80203662:	24013903          	ld	s2,576(sp)
    80203666:	23813983          	ld	s3,568(sp)
    8020366a:	23013a03          	ld	s4,560(sp)
    8020366e:	22813a83          	ld	s5,552(sp)
    80203672:	22013b03          	ld	s6,544(sp)
    80203676:	26010113          	addi	sp,sp,608
    8020367a:	8082                	ret

000000008020367c <sys_shutdown>:

uint64 
sys_shutdown(){
    8020367c:	1141                	addi	sp,sp,-16
    8020367e:	e422                	sd	s0,8(sp)
    80203680:	0800                	addi	s0,sp,16
	SBI_CALL_0(SBI_SHUTDOWN);
    80203682:	4501                	li	a0,0
    80203684:	4581                	li	a1,0
    80203686:	4601                	li	a2,0
    80203688:	4681                	li	a3,0
    8020368a:	48a1                	li	a7,8
    8020368c:	00000073          	ecall
    sbi_shutdown();
    return 0;
}
    80203690:	4501                	li	a0,0
    80203692:	6422                	ld	s0,8(sp)
    80203694:	0141                	addi	sp,sp,16
    80203696:	8082                	ret

0000000080203698 <sys_times>:
	long tms_cstime; 
};


uint64 
sys_times(void) {
    80203698:	1101                	addi	sp,sp,-32
    8020369a:	ec06                	sd	ra,24(sp)
    8020369c:	e822                	sd	s0,16(sp)
    8020369e:	1000                	addi	s0,sp,32
  struct tms *tmsbuf; // 用于存储时间数据的结构体指针

  if (argaddr(0, (void*)&tmsbuf) < 0)
    802036a0:	fe840593          	addi	a1,s0,-24
    802036a4:	4501                	li	a0,0
    802036a6:	00000097          	auipc	ra,0x0
    802036aa:	8c2080e7          	jalr	-1854(ra) # 80202f68 <argaddr>
    802036ae:	02054963          	bltz	a0,802036e0 <sys_times+0x48>
      return -1; // 验证用户传递的结构体指针是否有效

  // 获取当前进程的运行时间数据，并填充到tmsbuf指向的结构体中
  tmsbuf->tms_utime = ticks; // 用户态CPU时间
    802036b2:	0000a717          	auipc	a4,0xa
    802036b6:	a4673703          	ld	a4,-1466(a4) # 8020d0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
    802036ba:	00076683          	lwu	a3,0(a4)
    802036be:	fe843783          	ld	a5,-24(s0)
    802036c2:	e394                	sd	a3,0(a5)
  tmsbuf->tms_stime = 0; // 在xv6中无法直接获取系统态CPU时间
    802036c4:	fe843783          	ld	a5,-24(s0)
    802036c8:	0007b423          	sd	zero,8(a5)
  tmsbuf->tms_cutime = 0; // 在xv6中无法直接获取子进程的用户态CPU时间
    802036cc:	0007b823          	sd	zero,16(a5)
  tmsbuf->tms_cstime = 0; // 在xv6中无法直接获取子进程的系统态CPU时间
    802036d0:	0007bc23          	sd	zero,24(a5)

  return ticks; // 成功返回已经过去的滴答数
    802036d4:	00076503          	lwu	a0,0(a4)
}
    802036d8:	60e2                	ld	ra,24(sp)
    802036da:	6442                	ld	s0,16(sp)
    802036dc:	6105                	addi	sp,sp,32
    802036de:	8082                	ret
      return -1; // 验证用户传递的结构体指针是否有效
    802036e0:	557d                	li	a0,-1
    802036e2:	bfdd                	j	802036d8 <sys_times+0x40>

00000000802036e4 <sys_uname>:
	char domainname[65];
};

uint64
sys_uname(void)
{
    802036e4:	1101                	addi	sp,sp,-32
    802036e6:	ec06                	sd	ra,24(sp)
    802036e8:	e822                	sd	s0,16(sp)
    802036ea:	1000                	addi	s0,sp,32
    struct utsname *buf; // 用于存储系统信息的结构体指针

    if (argaddr(0, (void*)&buf) < 0)
    802036ec:	fe840593          	addi	a1,s0,-24
    802036f0:	4501                	li	a0,0
    802036f2:	00000097          	auipc	ra,0x0
    802036f6:	876080e7          	jalr	-1930(ra) # 80202f68 <argaddr>
        return -1; // 验证用户传递的结构体指针是否有效
    802036fa:	57fd                	li	a5,-1
    if (argaddr(0, (void*)&buf) < 0)
    802036fc:	08054763          	bltz	a0,8020378a <sys_uname+0xa6>

    // 填充系统信息到buf指向的结构体中
    strncpy(buf->sysname, "HUSTLWL", sizeof(buf->sysname)); // 操作系统名称
    80203700:	04100613          	li	a2,65
    80203704:	00007597          	auipc	a1,0x7
    80203708:	4ac58593          	addi	a1,a1,1196 # 8020abb0 <digits+0x830>
    8020370c:	fe843503          	ld	a0,-24(s0)
    80203710:	ffffd097          	auipc	ra,0xffffd
    80203714:	16c080e7          	jalr	364(ra) # 8020087c <strncpy>
    strncpy(buf->nodename, "LWL-host", sizeof(buf->nodename));  // 主机名
    80203718:	04100613          	li	a2,65
    8020371c:	00007597          	auipc	a1,0x7
    80203720:	49c58593          	addi	a1,a1,1180 # 8020abb8 <digits+0x838>
    80203724:	fe843503          	ld	a0,-24(s0)
    80203728:	04150513          	addi	a0,a0,65
    8020372c:	ffffd097          	auipc	ra,0xffffd
    80203730:	150080e7          	jalr	336(ra) # 8020087c <strncpy>
    strncpy(buf->release, "LWL--FirstVersion", sizeof(buf->release)); // 操作系统版本
    80203734:	04100613          	li	a2,65
    80203738:	00007597          	auipc	a1,0x7
    8020373c:	49058593          	addi	a1,a1,1168 # 8020abc8 <digits+0x848>
    80203740:	fe843503          	ld	a0,-24(s0)
    80203744:	08250513          	addi	a0,a0,130
    80203748:	ffffd097          	auipc	ra,0xffffd
    8020374c:	134080e7          	jalr	308(ra) # 8020087c <strncpy>
    strncpy(buf->version, "0.1", sizeof(buf->version)); // 操作系统版本号
    80203750:	04100613          	li	a2,65
    80203754:	00007597          	auipc	a1,0x7
    80203758:	48c58593          	addi	a1,a1,1164 # 8020abe0 <digits+0x860>
    8020375c:	fe843503          	ld	a0,-24(s0)
    80203760:	0c350513          	addi	a0,a0,195
    80203764:	ffffd097          	auipc	ra,0xffffd
    80203768:	118080e7          	jalr	280(ra) # 8020087c <strncpy>
    strncpy(buf->machine, "x86-64", sizeof(buf->machine)); // 硬件架构
    8020376c:	04100613          	li	a2,65
    80203770:	00007597          	auipc	a1,0x7
    80203774:	47858593          	addi	a1,a1,1144 # 8020abe8 <digits+0x868>
    80203778:	fe843503          	ld	a0,-24(s0)
    8020377c:	10450513          	addi	a0,a0,260
    80203780:	ffffd097          	auipc	ra,0xffffd
    80203784:	0fc080e7          	jalr	252(ra) # 8020087c <strncpy>

    return 0; // 返回成功
    80203788:	4781                	li	a5,0
}
    8020378a:	853e                	mv	a0,a5
    8020378c:	60e2                	ld	ra,24(sp)
    8020378e:	6442                	ld	s0,16(sp)
    80203790:	6105                	addi	sp,sp,32
    80203792:	8082                	ret

0000000080203794 <sys_gettimeofday>:
    long tv_nsec;  // 纳秒部分
};

uint64
sys_gettimeofday(void)
{
    80203794:	7179                	addi	sp,sp,-48
    80203796:	f406                	sd	ra,40(sp)
    80203798:	f022                	sd	s0,32(sp)
    8020379a:	1800                	addi	s0,sp,48
    struct timespec now_ts; // 用于存储时间值的结构体指针
    uint64 ts_addr;
    if (argaddr(0, (void*)&ts_addr) < 0)
    8020379c:	fd840593          	addi	a1,s0,-40
    802037a0:	4501                	li	a0,0
    802037a2:	fffff097          	auipc	ra,0xfffff
    802037a6:	7c6080e7          	jalr	1990(ra) # 80202f68 <argaddr>
    802037aa:	87aa                	mv	a5,a0
        return -1; // 验证用户传递的结构体指针是否有效
    802037ac:	557d                	li	a0,-1
    if (argaddr(0, (void*)&ts_addr) < 0)
    802037ae:	0407c563          	bltz	a5,802037f8 <sys_gettimeofday+0x64>

    // 获取当前时间，使用ticks转换为秒和纳秒部分
    uint tick = ticks;
    802037b2:	0000a797          	auipc	a5,0xa
    802037b6:	9467b783          	ld	a5,-1722(a5) # 8020d0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
    802037ba:	439c                	lw	a5,0(a5)
    now_ts.tv_sec = tick / 100; // 每个滴答100个时钟周期，换算为秒
    802037bc:	06400693          	li	a3,100
    802037c0:	02d7d73b          	divuw	a4,a5,a3
    802037c4:	1702                	slli	a4,a4,0x20
    802037c6:	9301                	srli	a4,a4,0x20
    802037c8:	fee43023          	sd	a4,-32(s0)
    now_ts.tv_nsec = (tick % 100) * (1000000000 / 100); // 换算为纳秒
    802037cc:	02d7f7bb          	remuw	a5,a5,a3
    802037d0:	00989737          	lui	a4,0x989
    802037d4:	6807071b          	addiw	a4,a4,1664
    802037d8:	02e787bb          	mulw	a5,a5,a4
    802037dc:	1782                	slli	a5,a5,0x20
    802037de:	9381                	srli	a5,a5,0x20
    802037e0:	fef43423          	sd	a5,-24(s0)
    if(copyout2(ts_addr,(char*)&now_ts,sizeof(struct timespec)) < 0)
    802037e4:	4641                	li	a2,16
    802037e6:	fe040593          	addi	a1,s0,-32
    802037ea:	fd843503          	ld	a0,-40(s0)
    802037ee:	ffffe097          	auipc	ra,0xffffe
    802037f2:	b8e080e7          	jalr	-1138(ra) # 8020137c <copyout2>
    802037f6:	957d                	srai	a0,a0,0x3f
        return -1; // 将时间值拷贝到用户空间
    return 0; // 返回成功
}
    802037f8:	70a2                	ld	ra,40(sp)
    802037fa:	7402                	ld	s0,32(sp)
    802037fc:	6145                	addi	sp,sp,48
    802037fe:	8082                	ret

0000000080203800 <sys_nanosleep>:

// added by wyx for SYS_nanosleep
uint64
sys_nanosleep(void)
{
    80203800:	7179                	addi	sp,sp,-48
    80203802:	f406                	sd	ra,40(sp)
    80203804:	f022                	sd	s0,32(sp)
    80203806:	ec26                	sd	s1,24(sp)
    80203808:	e84a                	sd	s2,16(sp)
    8020380a:	1800                	addi	s0,sp,48
    struct timespec *req; // 用于指定休眠时间的结构体指针
    struct timespec *rem; // 用于返回剩余休眠时间的结构体指针

    if (argaddr(0, (void*)&req) < 0 ||
    8020380c:	fd840593          	addi	a1,s0,-40
    80203810:	4501                	li	a0,0
    80203812:	fffff097          	auipc	ra,0xfffff
    80203816:	756080e7          	jalr	1878(ra) # 80202f68 <argaddr>
        argaddr(1, (void*)&rem) < 0)
        return -1; // 验证用户传递的结构体指针是否有效
    8020381a:	57fd                	li	a5,-1
    if (argaddr(0, (void*)&req) < 0 ||
    8020381c:	06054763          	bltz	a0,8020388a <sys_nanosleep+0x8a>
        argaddr(1, (void*)&rem) < 0)
    80203820:	fd040593          	addi	a1,s0,-48
    80203824:	4505                	li	a0,1
    80203826:	fffff097          	auipc	ra,0xfffff
    8020382a:	742080e7          	jalr	1858(ra) # 80202f68 <argaddr>
    if (argaddr(0, (void*)&req) < 0 ||
    8020382e:	06054563          	bltz	a0,80203898 <sys_nanosleep+0x98>

    // 获取休眠时间
    uint sleep_sec = req->tv_sec;
    80203832:	fd843783          	ld	a5,-40(s0)

    // 计算总的休眠时间（以ticks为单位）
    uint sleep_ticks = sleep_sec * 100 + sleep_nsec / (1000000000 / 100);

    // 获取当前ticks
    uint start_ticks = ticks;
    80203836:	0000a717          	auipc	a4,0xa
    8020383a:	8c273703          	ld	a4,-1854(a4) # 8020d0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
    8020383e:	4314                	lw	a3,0(a4)
    uint sleep_sec = req->tv_sec;
    80203840:	6398                	ld	a4,0(a5)
    uint sleep_ticks = sleep_sec * 100 + sleep_nsec / (1000000000 / 100);
    80203842:	06400493          	li	s1,100
    80203846:	02e484bb          	mulw	s1,s1,a4
    uint sleep_nsec = req->tv_nsec;
    8020384a:	679c                	ld	a5,8(a5)
    uint sleep_ticks = sleep_sec * 100 + sleep_nsec / (1000000000 / 100);
    8020384c:	00989737          	lui	a4,0x989
    80203850:	6807071b          	addiw	a4,a4,1664
    80203854:	02e7d7bb          	divuw	a5,a5,a4
    80203858:	9cbd                	addw	s1,s1,a5
    uint end_ticks = start_ticks + sleep_ticks;
    8020385a:	9cb5                	addw	s1,s1,a3

    // 执行休眠
    while (ticks < end_ticks)
    8020385c:	0096fe63          	bgeu	a3,s1,80203878 <sys_nanosleep+0x78>
    80203860:	0000a917          	auipc	s2,0xa
    80203864:	89893903          	ld	s2,-1896(s2) # 8020d0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
        yield();
    80203868:	fffff097          	auipc	ra,0xfffff
    8020386c:	a0e080e7          	jalr	-1522(ra) # 80202276 <yield>
    while (ticks < end_ticks)
    80203870:	00092783          	lw	a5,0(s2)
    80203874:	fe97eae3          	bltu	a5,s1,80203868 <sys_nanosleep+0x68>

    // 返回剩余休眠时间（置为0，因为xv6没有提供返回剩余时间的功能）
    rem->tv_sec = 0;
    80203878:	fd043783          	ld	a5,-48(s0)
    8020387c:	0007b023          	sd	zero,0(a5)
    rem->tv_nsec = 0;
    80203880:	fd043783          	ld	a5,-48(s0)
    80203884:	0007b423          	sd	zero,8(a5)

    return 0; // 返回成功
    80203888:	4781                	li	a5,0
}
    8020388a:	853e                	mv	a0,a5
    8020388c:	70a2                	ld	ra,40(sp)
    8020388e:	7402                	ld	s0,32(sp)
    80203890:	64e2                	ld	s1,24(sp)
    80203892:	6942                	ld	s2,16(sp)
    80203894:	6145                	addi	sp,sp,48
    80203896:	8082                	ret
        return -1; // 验证用户传递的结构体指针是否有效
    80203898:	57fd                	li	a5,-1
    8020389a:	bfc5                	j	8020388a <sys_nanosleep+0x8a>

000000008020389c <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    8020389c:	7139                	addi	sp,sp,-64
    8020389e:	fc06                	sd	ra,56(sp)
    802038a0:	f822                	sd	s0,48(sp)
    802038a2:	f426                	sd	s1,40(sp)
    802038a4:	f04a                	sd	s2,32(sp)
    802038a6:	ec4e                	sd	s3,24(sp)
    802038a8:	e852                	sd	s4,16(sp)
    802038aa:	e456                	sd	s5,8(sp)
    802038ac:	0080                	addi	s0,sp,64
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    802038ae:	00007597          	auipc	a1,0x7
    802038b2:	34258593          	addi	a1,a1,834 # 8020abf0 <digits+0x870>
    802038b6:	00022517          	auipc	a0,0x22
    802038ba:	13a50513          	addi	a0,a0,314 # 802259f0 <bcache>
    802038be:	ffffd097          	auipc	ra,0xffffd
    802038c2:	dc6080e7          	jalr	-570(ra) # 80200684 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    802038c6:	00026797          	auipc	a5,0x26
    802038ca:	12a78793          	addi	a5,a5,298 # 802299f0 <bcache+0x4000>
    802038ce:	00026717          	auipc	a4,0x26
    802038d2:	78a70713          	addi	a4,a4,1930 # 8022a058 <bcache+0x4668>
    802038d6:	6ae7b823          	sd	a4,1712(a5)
  bcache.head.next = &bcache.head;
    802038da:	6ae7bc23          	sd	a4,1720(a5)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    802038de:	00022497          	auipc	s1,0x22
    802038e2:	12a48493          	addi	s1,s1,298 # 80225a08 <bcache+0x18>
    b->refcnt = 0;
    b->sectorno = ~0;
    802038e6:	5a7d                	li	s4,-1
    b->dev = ~0;
    b->next = bcache.head.next;
    802038e8:	893e                	mv	s2,a5
    b->prev = &bcache.head;
    802038ea:	89ba                	mv	s3,a4
    initsleeplock(&b->lock, "buffer");
    802038ec:	00007a97          	auipc	s5,0x7
    802038f0:	30ca8a93          	addi	s5,s5,780 # 8020abf8 <digits+0x878>
    b->refcnt = 0;
    802038f4:	0404a023          	sw	zero,64(s1)
    b->sectorno = ~0;
    802038f8:	0144a623          	sw	s4,12(s1)
    b->dev = ~0;
    802038fc:	0144a423          	sw	s4,8(s1)
    b->next = bcache.head.next;
    80203900:	6b893783          	ld	a5,1720(s2)
    80203904:	e8bc                	sd	a5,80(s1)
    b->prev = &bcache.head;
    80203906:	0534b423          	sd	s3,72(s1)
    initsleeplock(&b->lock, "buffer");
    8020390a:	85d6                	mv	a1,s5
    8020390c:	01048513          	addi	a0,s1,16
    80203910:	00000097          	auipc	ra,0x0
    80203914:	26e080e7          	jalr	622(ra) # 80203b7e <initsleeplock>
    bcache.head.next->prev = b;
    80203918:	6b893783          	ld	a5,1720(s2)
    8020391c:	e7a4                	sd	s1,72(a5)
    bcache.head.next = b;
    8020391e:	6a993c23          	sd	s1,1720(s2)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80203922:	25848493          	addi	s1,s1,600
    80203926:	fd3497e3          	bne	s1,s3,802038f4 <binit+0x58>
  }
  #ifdef DEBUG
  printf("binit\n");
  #endif
}
    8020392a:	70e2                	ld	ra,56(sp)
    8020392c:	7442                	ld	s0,48(sp)
    8020392e:	74a2                	ld	s1,40(sp)
    80203930:	7902                	ld	s2,32(sp)
    80203932:	69e2                	ld	s3,24(sp)
    80203934:	6a42                	ld	s4,16(sp)
    80203936:	6aa2                	ld	s5,8(sp)
    80203938:	6121                	addi	sp,sp,64
    8020393a:	8082                	ret

000000008020393c <bread>:
  panic("bget: no buffers");
}

// Return a locked buf with the contents of the indicated block.
struct buf* 
bread(uint dev, uint sectorno) {
    8020393c:	7179                	addi	sp,sp,-48
    8020393e:	f406                	sd	ra,40(sp)
    80203940:	f022                	sd	s0,32(sp)
    80203942:	ec26                	sd	s1,24(sp)
    80203944:	e84a                	sd	s2,16(sp)
    80203946:	e44e                	sd	s3,8(sp)
    80203948:	1800                	addi	s0,sp,48
    8020394a:	89aa                	mv	s3,a0
    8020394c:	892e                	mv	s2,a1
  acquire(&bcache.lock);
    8020394e:	00022517          	auipc	a0,0x22
    80203952:	0a250513          	addi	a0,a0,162 # 802259f0 <bcache>
    80203956:	ffffd097          	auipc	ra,0xffffd
    8020395a:	d72080e7          	jalr	-654(ra) # 802006c8 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    8020395e:	00026497          	auipc	s1,0x26
    80203962:	74a4b483          	ld	s1,1866(s1) # 8022a0a8 <bcache+0x46b8>
    80203966:	00026797          	auipc	a5,0x26
    8020396a:	6f278793          	addi	a5,a5,1778 # 8022a058 <bcache+0x4668>
    8020396e:	02f48f63          	beq	s1,a5,802039ac <bread+0x70>
    80203972:	873e                	mv	a4,a5
    80203974:	a021                	j	8020397c <bread+0x40>
    80203976:	68a4                	ld	s1,80(s1)
    80203978:	02e48a63          	beq	s1,a4,802039ac <bread+0x70>
    if(b->dev == dev && b->sectorno == sectorno){
    8020397c:	449c                	lw	a5,8(s1)
    8020397e:	ff379ce3          	bne	a5,s3,80203976 <bread+0x3a>
    80203982:	44dc                	lw	a5,12(s1)
    80203984:	ff2799e3          	bne	a5,s2,80203976 <bread+0x3a>
      b->refcnt++;
    80203988:	40bc                	lw	a5,64(s1)
    8020398a:	2785                	addiw	a5,a5,1
    8020398c:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    8020398e:	00022517          	auipc	a0,0x22
    80203992:	06250513          	addi	a0,a0,98 # 802259f0 <bcache>
    80203996:	ffffd097          	auipc	ra,0xffffd
    8020399a:	d86080e7          	jalr	-634(ra) # 8020071c <release>
      acquiresleep(&b->lock);
    8020399e:	01048513          	addi	a0,s1,16
    802039a2:	00000097          	auipc	ra,0x0
    802039a6:	216080e7          	jalr	534(ra) # 80203bb8 <acquiresleep>
      return b;
    802039aa:	a8b9                	j	80203a08 <bread+0xcc>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    802039ac:	00026497          	auipc	s1,0x26
    802039b0:	6f44b483          	ld	s1,1780(s1) # 8022a0a0 <bcache+0x46b0>
    802039b4:	00026797          	auipc	a5,0x26
    802039b8:	6a478793          	addi	a5,a5,1700 # 8022a058 <bcache+0x4668>
    802039bc:	00f48863          	beq	s1,a5,802039cc <bread+0x90>
    802039c0:	873e                	mv	a4,a5
    if(b->refcnt == 0) {
    802039c2:	40bc                	lw	a5,64(s1)
    802039c4:	cf81                	beqz	a5,802039dc <bread+0xa0>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    802039c6:	64a4                	ld	s1,72(s1)
    802039c8:	fee49de3          	bne	s1,a4,802039c2 <bread+0x86>
  panic("bget: no buffers");
    802039cc:	00007517          	auipc	a0,0x7
    802039d0:	23450513          	addi	a0,a0,564 # 8020ac00 <digits+0x880>
    802039d4:	ffffc097          	auipc	ra,0xffffc
    802039d8:	76e080e7          	jalr	1902(ra) # 80200142 <panic>
      b->dev = dev;
    802039dc:	0134a423          	sw	s3,8(s1)
      b->sectorno = sectorno;
    802039e0:	0124a623          	sw	s2,12(s1)
      b->valid = 0;
    802039e4:	0004a023          	sw	zero,0(s1)
      b->refcnt = 1;
    802039e8:	4785                	li	a5,1
    802039ea:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    802039ec:	00022517          	auipc	a0,0x22
    802039f0:	00450513          	addi	a0,a0,4 # 802259f0 <bcache>
    802039f4:	ffffd097          	auipc	ra,0xffffd
    802039f8:	d28080e7          	jalr	-728(ra) # 8020071c <release>
      acquiresleep(&b->lock);
    802039fc:	01048513          	addi	a0,s1,16
    80203a00:	00000097          	auipc	ra,0x0
    80203a04:	1b8080e7          	jalr	440(ra) # 80203bb8 <acquiresleep>
  struct buf *b;

  b = bget(dev, sectorno);
  if (!b->valid) {
    80203a08:	409c                	lw	a5,0(s1)
    80203a0a:	cb89                	beqz	a5,80203a1c <bread+0xe0>
    disk_read(b);
    b->valid = 1;
  }

  return b;
}
    80203a0c:	8526                	mv	a0,s1
    80203a0e:	70a2                	ld	ra,40(sp)
    80203a10:	7402                	ld	s0,32(sp)
    80203a12:	64e2                	ld	s1,24(sp)
    80203a14:	6942                	ld	s2,16(sp)
    80203a16:	69a2                	ld	s3,8(sp)
    80203a18:	6145                	addi	sp,sp,48
    80203a1a:	8082                	ret
    disk_read(b);
    80203a1c:	8526                	mv	a0,s1
    80203a1e:	00002097          	auipc	ra,0x2
    80203a22:	494080e7          	jalr	1172(ra) # 80205eb2 <disk_read>
    b->valid = 1;
    80203a26:	4785                	li	a5,1
    80203a28:	c09c                	sw	a5,0(s1)
  return b;
    80203a2a:	b7cd                	j	80203a0c <bread+0xd0>

0000000080203a2c <bwrite>:

// Write b's contents to disk.  Must be locked.
void 
bwrite(struct buf *b) {
    80203a2c:	1101                	addi	sp,sp,-32
    80203a2e:	ec06                	sd	ra,24(sp)
    80203a30:	e822                	sd	s0,16(sp)
    80203a32:	e426                	sd	s1,8(sp)
    80203a34:	1000                	addi	s0,sp,32
    80203a36:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203a38:	0541                	addi	a0,a0,16
    80203a3a:	00000097          	auipc	ra,0x0
    80203a3e:	218080e7          	jalr	536(ra) # 80203c52 <holdingsleep>
    80203a42:	c919                	beqz	a0,80203a58 <bwrite+0x2c>
    panic("bwrite");
  disk_write(b);
    80203a44:	8526                	mv	a0,s1
    80203a46:	00002097          	auipc	ra,0x2
    80203a4a:	486080e7          	jalr	1158(ra) # 80205ecc <disk_write>
}
    80203a4e:	60e2                	ld	ra,24(sp)
    80203a50:	6442                	ld	s0,16(sp)
    80203a52:	64a2                	ld	s1,8(sp)
    80203a54:	6105                	addi	sp,sp,32
    80203a56:	8082                	ret
    panic("bwrite");
    80203a58:	00007517          	auipc	a0,0x7
    80203a5c:	1c050513          	addi	a0,a0,448 # 8020ac18 <digits+0x898>
    80203a60:	ffffc097          	auipc	ra,0xffffc
    80203a64:	6e2080e7          	jalr	1762(ra) # 80200142 <panic>

0000000080203a68 <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80203a68:	1101                	addi	sp,sp,-32
    80203a6a:	ec06                	sd	ra,24(sp)
    80203a6c:	e822                	sd	s0,16(sp)
    80203a6e:	e426                	sd	s1,8(sp)
    80203a70:	e04a                	sd	s2,0(sp)
    80203a72:	1000                	addi	s0,sp,32
    80203a74:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203a76:	01050913          	addi	s2,a0,16
    80203a7a:	854a                	mv	a0,s2
    80203a7c:	00000097          	auipc	ra,0x0
    80203a80:	1d6080e7          	jalr	470(ra) # 80203c52 <holdingsleep>
    80203a84:	c92d                	beqz	a0,80203af6 <brelse+0x8e>
    panic("brelse");

  releasesleep(&b->lock);
    80203a86:	854a                	mv	a0,s2
    80203a88:	00000097          	auipc	ra,0x0
    80203a8c:	186080e7          	jalr	390(ra) # 80203c0e <releasesleep>

  acquire(&bcache.lock);
    80203a90:	00022517          	auipc	a0,0x22
    80203a94:	f6050513          	addi	a0,a0,-160 # 802259f0 <bcache>
    80203a98:	ffffd097          	auipc	ra,0xffffd
    80203a9c:	c30080e7          	jalr	-976(ra) # 802006c8 <acquire>
  b->refcnt--;
    80203aa0:	40bc                	lw	a5,64(s1)
    80203aa2:	37fd                	addiw	a5,a5,-1
    80203aa4:	0007871b          	sext.w	a4,a5
    80203aa8:	c0bc                	sw	a5,64(s1)
  if (b->refcnt == 0) {
    80203aaa:	eb05                	bnez	a4,80203ada <brelse+0x72>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80203aac:	68bc                	ld	a5,80(s1)
    80203aae:	64b8                	ld	a4,72(s1)
    80203ab0:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80203ab2:	64bc                	ld	a5,72(s1)
    80203ab4:	68b8                	ld	a4,80(s1)
    80203ab6:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80203ab8:	00026797          	auipc	a5,0x26
    80203abc:	f3878793          	addi	a5,a5,-200 # 802299f0 <bcache+0x4000>
    80203ac0:	6b87b703          	ld	a4,1720(a5)
    80203ac4:	e8b8                	sd	a4,80(s1)
    b->prev = &bcache.head;
    80203ac6:	00026717          	auipc	a4,0x26
    80203aca:	59270713          	addi	a4,a4,1426 # 8022a058 <bcache+0x4668>
    80203ace:	e4b8                	sd	a4,72(s1)
    bcache.head.next->prev = b;
    80203ad0:	6b87b703          	ld	a4,1720(a5)
    80203ad4:	e724                	sd	s1,72(a4)
    bcache.head.next = b;
    80203ad6:	6a97bc23          	sd	s1,1720(a5)
  }
  
  release(&bcache.lock);
    80203ada:	00022517          	auipc	a0,0x22
    80203ade:	f1650513          	addi	a0,a0,-234 # 802259f0 <bcache>
    80203ae2:	ffffd097          	auipc	ra,0xffffd
    80203ae6:	c3a080e7          	jalr	-966(ra) # 8020071c <release>
}
    80203aea:	60e2                	ld	ra,24(sp)
    80203aec:	6442                	ld	s0,16(sp)
    80203aee:	64a2                	ld	s1,8(sp)
    80203af0:	6902                	ld	s2,0(sp)
    80203af2:	6105                	addi	sp,sp,32
    80203af4:	8082                	ret
    panic("brelse");
    80203af6:	00007517          	auipc	a0,0x7
    80203afa:	12a50513          	addi	a0,a0,298 # 8020ac20 <digits+0x8a0>
    80203afe:	ffffc097          	auipc	ra,0xffffc
    80203b02:	644080e7          	jalr	1604(ra) # 80200142 <panic>

0000000080203b06 <bpin>:

void
bpin(struct buf *b) {
    80203b06:	1101                	addi	sp,sp,-32
    80203b08:	ec06                	sd	ra,24(sp)
    80203b0a:	e822                	sd	s0,16(sp)
    80203b0c:	e426                	sd	s1,8(sp)
    80203b0e:	1000                	addi	s0,sp,32
    80203b10:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80203b12:	00022517          	auipc	a0,0x22
    80203b16:	ede50513          	addi	a0,a0,-290 # 802259f0 <bcache>
    80203b1a:	ffffd097          	auipc	ra,0xffffd
    80203b1e:	bae080e7          	jalr	-1106(ra) # 802006c8 <acquire>
  b->refcnt++;
    80203b22:	40bc                	lw	a5,64(s1)
    80203b24:	2785                	addiw	a5,a5,1
    80203b26:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203b28:	00022517          	auipc	a0,0x22
    80203b2c:	ec850513          	addi	a0,a0,-312 # 802259f0 <bcache>
    80203b30:	ffffd097          	auipc	ra,0xffffd
    80203b34:	bec080e7          	jalr	-1044(ra) # 8020071c <release>
}
    80203b38:	60e2                	ld	ra,24(sp)
    80203b3a:	6442                	ld	s0,16(sp)
    80203b3c:	64a2                	ld	s1,8(sp)
    80203b3e:	6105                	addi	sp,sp,32
    80203b40:	8082                	ret

0000000080203b42 <bunpin>:

void
bunpin(struct buf *b) {
    80203b42:	1101                	addi	sp,sp,-32
    80203b44:	ec06                	sd	ra,24(sp)
    80203b46:	e822                	sd	s0,16(sp)
    80203b48:	e426                	sd	s1,8(sp)
    80203b4a:	1000                	addi	s0,sp,32
    80203b4c:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80203b4e:	00022517          	auipc	a0,0x22
    80203b52:	ea250513          	addi	a0,a0,-350 # 802259f0 <bcache>
    80203b56:	ffffd097          	auipc	ra,0xffffd
    80203b5a:	b72080e7          	jalr	-1166(ra) # 802006c8 <acquire>
  b->refcnt--;
    80203b5e:	40bc                	lw	a5,64(s1)
    80203b60:	37fd                	addiw	a5,a5,-1
    80203b62:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203b64:	00022517          	auipc	a0,0x22
    80203b68:	e8c50513          	addi	a0,a0,-372 # 802259f0 <bcache>
    80203b6c:	ffffd097          	auipc	ra,0xffffd
    80203b70:	bb0080e7          	jalr	-1104(ra) # 8020071c <release>
}
    80203b74:	60e2                	ld	ra,24(sp)
    80203b76:	6442                	ld	s0,16(sp)
    80203b78:	64a2                	ld	s1,8(sp)
    80203b7a:	6105                	addi	sp,sp,32
    80203b7c:	8082                	ret

0000000080203b7e <initsleeplock>:
#include "include/proc.h"
#include "include/sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80203b7e:	1101                	addi	sp,sp,-32
    80203b80:	ec06                	sd	ra,24(sp)
    80203b82:	e822                	sd	s0,16(sp)
    80203b84:	e426                	sd	s1,8(sp)
    80203b86:	e04a                	sd	s2,0(sp)
    80203b88:	1000                	addi	s0,sp,32
    80203b8a:	84aa                	mv	s1,a0
    80203b8c:	892e                	mv	s2,a1
  initlock(&lk->lk, "sleep lock");
    80203b8e:	00007597          	auipc	a1,0x7
    80203b92:	09a58593          	addi	a1,a1,154 # 8020ac28 <digits+0x8a8>
    80203b96:	0521                	addi	a0,a0,8
    80203b98:	ffffd097          	auipc	ra,0xffffd
    80203b9c:	aec080e7          	jalr	-1300(ra) # 80200684 <initlock>
  lk->name = name;
    80203ba0:	0324b023          	sd	s2,32(s1)
  lk->locked = 0;
    80203ba4:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203ba8:	0204a423          	sw	zero,40(s1)
}
    80203bac:	60e2                	ld	ra,24(sp)
    80203bae:	6442                	ld	s0,16(sp)
    80203bb0:	64a2                	ld	s1,8(sp)
    80203bb2:	6902                	ld	s2,0(sp)
    80203bb4:	6105                	addi	sp,sp,32
    80203bb6:	8082                	ret

0000000080203bb8 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80203bb8:	1101                	addi	sp,sp,-32
    80203bba:	ec06                	sd	ra,24(sp)
    80203bbc:	e822                	sd	s0,16(sp)
    80203bbe:	e426                	sd	s1,8(sp)
    80203bc0:	e04a                	sd	s2,0(sp)
    80203bc2:	1000                	addi	s0,sp,32
    80203bc4:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203bc6:	00850913          	addi	s2,a0,8
    80203bca:	854a                	mv	a0,s2
    80203bcc:	ffffd097          	auipc	ra,0xffffd
    80203bd0:	afc080e7          	jalr	-1284(ra) # 802006c8 <acquire>
  while (lk->locked) {
    80203bd4:	409c                	lw	a5,0(s1)
    80203bd6:	cb89                	beqz	a5,80203be8 <acquiresleep+0x30>
    sleep(lk, &lk->lk);
    80203bd8:	85ca                	mv	a1,s2
    80203bda:	8526                	mv	a0,s1
    80203bdc:	ffffe097          	auipc	ra,0xffffe
    80203be0:	6d6080e7          	jalr	1750(ra) # 802022b2 <sleep>
  while (lk->locked) {
    80203be4:	409c                	lw	a5,0(s1)
    80203be6:	fbed                	bnez	a5,80203bd8 <acquiresleep+0x20>
  }
  lk->locked = 1;
    80203be8:	4785                	li	a5,1
    80203bea:	c09c                	sw	a5,0(s1)
  lk->pid = myproc()->pid;
    80203bec:	ffffe097          	auipc	ra,0xffffe
    80203bf0:	e6c080e7          	jalr	-404(ra) # 80201a58 <myproc>
    80203bf4:	5d1c                	lw	a5,56(a0)
    80203bf6:	d49c                	sw	a5,40(s1)
  release(&lk->lk);
    80203bf8:	854a                	mv	a0,s2
    80203bfa:	ffffd097          	auipc	ra,0xffffd
    80203bfe:	b22080e7          	jalr	-1246(ra) # 8020071c <release>
}
    80203c02:	60e2                	ld	ra,24(sp)
    80203c04:	6442                	ld	s0,16(sp)
    80203c06:	64a2                	ld	s1,8(sp)
    80203c08:	6902                	ld	s2,0(sp)
    80203c0a:	6105                	addi	sp,sp,32
    80203c0c:	8082                	ret

0000000080203c0e <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80203c0e:	1101                	addi	sp,sp,-32
    80203c10:	ec06                	sd	ra,24(sp)
    80203c12:	e822                	sd	s0,16(sp)
    80203c14:	e426                	sd	s1,8(sp)
    80203c16:	e04a                	sd	s2,0(sp)
    80203c18:	1000                	addi	s0,sp,32
    80203c1a:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203c1c:	00850913          	addi	s2,a0,8
    80203c20:	854a                	mv	a0,s2
    80203c22:	ffffd097          	auipc	ra,0xffffd
    80203c26:	aa6080e7          	jalr	-1370(ra) # 802006c8 <acquire>
  lk->locked = 0;
    80203c2a:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203c2e:	0204a423          	sw	zero,40(s1)
  wakeup(lk);
    80203c32:	8526                	mv	a0,s1
    80203c34:	fffff097          	auipc	ra,0xfffff
    80203c38:	800080e7          	jalr	-2048(ra) # 80202434 <wakeup>
  release(&lk->lk);
    80203c3c:	854a                	mv	a0,s2
    80203c3e:	ffffd097          	auipc	ra,0xffffd
    80203c42:	ade080e7          	jalr	-1314(ra) # 8020071c <release>
}
    80203c46:	60e2                	ld	ra,24(sp)
    80203c48:	6442                	ld	s0,16(sp)
    80203c4a:	64a2                	ld	s1,8(sp)
    80203c4c:	6902                	ld	s2,0(sp)
    80203c4e:	6105                	addi	sp,sp,32
    80203c50:	8082                	ret

0000000080203c52 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80203c52:	7179                	addi	sp,sp,-48
    80203c54:	f406                	sd	ra,40(sp)
    80203c56:	f022                	sd	s0,32(sp)
    80203c58:	ec26                	sd	s1,24(sp)
    80203c5a:	e84a                	sd	s2,16(sp)
    80203c5c:	e44e                	sd	s3,8(sp)
    80203c5e:	1800                	addi	s0,sp,48
    80203c60:	84aa                	mv	s1,a0
  int r;
  
  acquire(&lk->lk);
    80203c62:	00850913          	addi	s2,a0,8
    80203c66:	854a                	mv	a0,s2
    80203c68:	ffffd097          	auipc	ra,0xffffd
    80203c6c:	a60080e7          	jalr	-1440(ra) # 802006c8 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80203c70:	409c                	lw	a5,0(s1)
    80203c72:	ef99                	bnez	a5,80203c90 <holdingsleep+0x3e>
    80203c74:	4481                	li	s1,0
  release(&lk->lk);
    80203c76:	854a                	mv	a0,s2
    80203c78:	ffffd097          	auipc	ra,0xffffd
    80203c7c:	aa4080e7          	jalr	-1372(ra) # 8020071c <release>
  return r;
}
    80203c80:	8526                	mv	a0,s1
    80203c82:	70a2                	ld	ra,40(sp)
    80203c84:	7402                	ld	s0,32(sp)
    80203c86:	64e2                	ld	s1,24(sp)
    80203c88:	6942                	ld	s2,16(sp)
    80203c8a:	69a2                	ld	s3,8(sp)
    80203c8c:	6145                	addi	sp,sp,48
    80203c8e:	8082                	ret
  r = lk->locked && (lk->pid == myproc()->pid);
    80203c90:	0284a983          	lw	s3,40(s1)
    80203c94:	ffffe097          	auipc	ra,0xffffe
    80203c98:	dc4080e7          	jalr	-572(ra) # 80201a58 <myproc>
    80203c9c:	5d04                	lw	s1,56(a0)
    80203c9e:	413484b3          	sub	s1,s1,s3
    80203ca2:	0014b493          	seqz	s1,s1
    80203ca6:	bfc1                	j	80203c76 <holdingsleep+0x24>

0000000080203ca8 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80203ca8:	1101                	addi	sp,sp,-32
    80203caa:	ec06                	sd	ra,24(sp)
    80203cac:	e822                	sd	s0,16(sp)
    80203cae:	e426                	sd	s1,8(sp)
    80203cb0:	e04a                	sd	s2,0(sp)
    80203cb2:	1000                	addi	s0,sp,32
  initlock(&ftable.lock, "ftable");
    80203cb4:	00007597          	auipc	a1,0x7
    80203cb8:	f8458593          	addi	a1,a1,-124 # 8020ac38 <digits+0x8b8>
    80203cbc:	00026517          	auipc	a0,0x26
    80203cc0:	69450513          	addi	a0,a0,1684 # 8022a350 <ftable>
    80203cc4:	ffffd097          	auipc	ra,0xffffd
    80203cc8:	9c0080e7          	jalr	-1600(ra) # 80200684 <initlock>
  struct file *f;
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203ccc:	00026497          	auipc	s1,0x26
    80203cd0:	69c48493          	addi	s1,s1,1692 # 8022a368 <ftable+0x18>
    80203cd4:	00028917          	auipc	s2,0x28
    80203cd8:	a9490913          	addi	s2,s2,-1388 # 8022b768 <tickslock>
    memset(f, 0, sizeof(struct file));
    80203cdc:	02800613          	li	a2,40
    80203ce0:	4581                	li	a1,0
    80203ce2:	8526                	mv	a0,s1
    80203ce4:	ffffd097          	auipc	ra,0xffffd
    80203ce8:	a80080e7          	jalr	-1408(ra) # 80200764 <memset>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203cec:	02848493          	addi	s1,s1,40
    80203cf0:	ff2496e3          	bne	s1,s2,80203cdc <fileinit+0x34>
  }

  #ifdef DEBUG
  printf("fileinit\n");
  #endif
}
    80203cf4:	60e2                	ld	ra,24(sp)
    80203cf6:	6442                	ld	s0,16(sp)
    80203cf8:	64a2                	ld	s1,8(sp)
    80203cfa:	6902                	ld	s2,0(sp)
    80203cfc:	6105                	addi	sp,sp,32
    80203cfe:	8082                	ret

0000000080203d00 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80203d00:	1101                	addi	sp,sp,-32
    80203d02:	ec06                	sd	ra,24(sp)
    80203d04:	e822                	sd	s0,16(sp)
    80203d06:	e426                	sd	s1,8(sp)
    80203d08:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80203d0a:	00026517          	auipc	a0,0x26
    80203d0e:	64650513          	addi	a0,a0,1606 # 8022a350 <ftable>
    80203d12:	ffffd097          	auipc	ra,0xffffd
    80203d16:	9b6080e7          	jalr	-1610(ra) # 802006c8 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203d1a:	00026497          	auipc	s1,0x26
    80203d1e:	64e48493          	addi	s1,s1,1614 # 8022a368 <ftable+0x18>
    80203d22:	00028717          	auipc	a4,0x28
    80203d26:	a4670713          	addi	a4,a4,-1466 # 8022b768 <tickslock>
    if(f->ref == 0){
    80203d2a:	40dc                	lw	a5,4(s1)
    80203d2c:	cf99                	beqz	a5,80203d4a <filealloc+0x4a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203d2e:	02848493          	addi	s1,s1,40
    80203d32:	fee49ce3          	bne	s1,a4,80203d2a <filealloc+0x2a>
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
    80203d36:	00026517          	auipc	a0,0x26
    80203d3a:	61a50513          	addi	a0,a0,1562 # 8022a350 <ftable>
    80203d3e:	ffffd097          	auipc	ra,0xffffd
    80203d42:	9de080e7          	jalr	-1570(ra) # 8020071c <release>
  return NULL;
    80203d46:	4481                	li	s1,0
    80203d48:	a819                	j	80203d5e <filealloc+0x5e>
      f->ref = 1;
    80203d4a:	4785                	li	a5,1
    80203d4c:	c0dc                	sw	a5,4(s1)
      release(&ftable.lock);
    80203d4e:	00026517          	auipc	a0,0x26
    80203d52:	60250513          	addi	a0,a0,1538 # 8022a350 <ftable>
    80203d56:	ffffd097          	auipc	ra,0xffffd
    80203d5a:	9c6080e7          	jalr	-1594(ra) # 8020071c <release>
}
    80203d5e:	8526                	mv	a0,s1
    80203d60:	60e2                	ld	ra,24(sp)
    80203d62:	6442                	ld	s0,16(sp)
    80203d64:	64a2                	ld	s1,8(sp)
    80203d66:	6105                	addi	sp,sp,32
    80203d68:	8082                	ret

0000000080203d6a <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80203d6a:	1101                	addi	sp,sp,-32
    80203d6c:	ec06                	sd	ra,24(sp)
    80203d6e:	e822                	sd	s0,16(sp)
    80203d70:	e426                	sd	s1,8(sp)
    80203d72:	1000                	addi	s0,sp,32
    80203d74:	84aa                	mv	s1,a0
  acquire(&ftable.lock);
    80203d76:	00026517          	auipc	a0,0x26
    80203d7a:	5da50513          	addi	a0,a0,1498 # 8022a350 <ftable>
    80203d7e:	ffffd097          	auipc	ra,0xffffd
    80203d82:	94a080e7          	jalr	-1718(ra) # 802006c8 <acquire>
  if(f->ref < 1)
    80203d86:	40dc                	lw	a5,4(s1)
    80203d88:	02f05263          	blez	a5,80203dac <filedup+0x42>
    panic("filedup");
  f->ref++;
    80203d8c:	2785                	addiw	a5,a5,1
    80203d8e:	c0dc                	sw	a5,4(s1)
  release(&ftable.lock);
    80203d90:	00026517          	auipc	a0,0x26
    80203d94:	5c050513          	addi	a0,a0,1472 # 8022a350 <ftable>
    80203d98:	ffffd097          	auipc	ra,0xffffd
    80203d9c:	984080e7          	jalr	-1660(ra) # 8020071c <release>
  return f;
}
    80203da0:	8526                	mv	a0,s1
    80203da2:	60e2                	ld	ra,24(sp)
    80203da4:	6442                	ld	s0,16(sp)
    80203da6:	64a2                	ld	s1,8(sp)
    80203da8:	6105                	addi	sp,sp,32
    80203daa:	8082                	ret
    panic("filedup");
    80203dac:	00007517          	auipc	a0,0x7
    80203db0:	e9450513          	addi	a0,a0,-364 # 8020ac40 <digits+0x8c0>
    80203db4:	ffffc097          	auipc	ra,0xffffc
    80203db8:	38e080e7          	jalr	910(ra) # 80200142 <panic>

0000000080203dbc <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80203dbc:	7139                	addi	sp,sp,-64
    80203dbe:	fc06                	sd	ra,56(sp)
    80203dc0:	f822                	sd	s0,48(sp)
    80203dc2:	f426                	sd	s1,40(sp)
    80203dc4:	f04a                	sd	s2,32(sp)
    80203dc6:	ec4e                	sd	s3,24(sp)
    80203dc8:	e852                	sd	s4,16(sp)
    80203dca:	e456                	sd	s5,8(sp)
    80203dcc:	0080                	addi	s0,sp,64
    80203dce:	84aa                	mv	s1,a0
  struct file ff;

  acquire(&ftable.lock);
    80203dd0:	00026517          	auipc	a0,0x26
    80203dd4:	58050513          	addi	a0,a0,1408 # 8022a350 <ftable>
    80203dd8:	ffffd097          	auipc	ra,0xffffd
    80203ddc:	8f0080e7          	jalr	-1808(ra) # 802006c8 <acquire>
  if(f->ref < 1)
    80203de0:	40dc                	lw	a5,4(s1)
    80203de2:	04f05863          	blez	a5,80203e32 <fileclose+0x76>
    panic("fileclose");
  if(--f->ref > 0){
    80203de6:	37fd                	addiw	a5,a5,-1
    80203de8:	0007871b          	sext.w	a4,a5
    80203dec:	c0dc                	sw	a5,4(s1)
    80203dee:	04e04a63          	bgtz	a4,80203e42 <fileclose+0x86>
    release(&ftable.lock);
    return;
  }
  ff = *f;
    80203df2:	0004a903          	lw	s2,0(s1)
    80203df6:	0094ca03          	lbu	s4,9(s1)
    80203dfa:	0104b983          	ld	s3,16(s1)
    80203dfe:	0184ba83          	ld	s5,24(s1)
  f->ref = 0;
    80203e02:	0004a223          	sw	zero,4(s1)
  f->type = FD_NONE;
    80203e06:	0004a023          	sw	zero,0(s1)
  release(&ftable.lock);
    80203e0a:	00026517          	auipc	a0,0x26
    80203e0e:	54650513          	addi	a0,a0,1350 # 8022a350 <ftable>
    80203e12:	ffffd097          	auipc	ra,0xffffd
    80203e16:	90a080e7          	jalr	-1782(ra) # 8020071c <release>

  if(ff.type == FD_PIPE){
    80203e1a:	4785                	li	a5,1
    80203e1c:	04f90463          	beq	s2,a5,80203e64 <fileclose+0xa8>
    pipeclose(ff.pipe, ff.writable);
  } else if(ff.type == FD_ENTRY){
    80203e20:	4789                	li	a5,2
    80203e22:	02f91863          	bne	s2,a5,80203e52 <fileclose+0x96>
    eput(ff.ep);
    80203e26:	8556                	mv	a0,s5
    80203e28:	00003097          	auipc	ra,0x3
    80203e2c:	28e080e7          	jalr	654(ra) # 802070b6 <eput>
    80203e30:	a00d                	j	80203e52 <fileclose+0x96>
    panic("fileclose");
    80203e32:	00007517          	auipc	a0,0x7
    80203e36:	e1650513          	addi	a0,a0,-490 # 8020ac48 <digits+0x8c8>
    80203e3a:	ffffc097          	auipc	ra,0xffffc
    80203e3e:	308080e7          	jalr	776(ra) # 80200142 <panic>
    release(&ftable.lock);
    80203e42:	00026517          	auipc	a0,0x26
    80203e46:	50e50513          	addi	a0,a0,1294 # 8022a350 <ftable>
    80203e4a:	ffffd097          	auipc	ra,0xffffd
    80203e4e:	8d2080e7          	jalr	-1838(ra) # 8020071c <release>
  } else if (ff.type == FD_DEVICE) {

  }
}
    80203e52:	70e2                	ld	ra,56(sp)
    80203e54:	7442                	ld	s0,48(sp)
    80203e56:	74a2                	ld	s1,40(sp)
    80203e58:	7902                	ld	s2,32(sp)
    80203e5a:	69e2                	ld	s3,24(sp)
    80203e5c:	6a42                	ld	s4,16(sp)
    80203e5e:	6aa2                	ld	s5,8(sp)
    80203e60:	6121                	addi	sp,sp,64
    80203e62:	8082                	ret
    pipeclose(ff.pipe, ff.writable);
    80203e64:	85d2                	mv	a1,s4
    80203e66:	854e                	mv	a0,s3
    80203e68:	00000097          	auipc	ra,0x0
    80203e6c:	3a2080e7          	jalr	930(ra) # 8020420a <pipeclose>
    80203e70:	b7cd                	j	80203e52 <fileclose+0x96>

0000000080203e72 <filestat>:
int
filestat(struct file *f, uint64 addr)
{
  struct stat st;
  
  if(f->type == FD_ENTRY){
    80203e72:	4118                	lw	a4,0(a0)
    80203e74:	4789                	li	a5,2
    80203e76:	04f71e63          	bne	a4,a5,80203ed2 <filestat+0x60>
{
    80203e7a:	7159                	addi	sp,sp,-112
    80203e7c:	f486                	sd	ra,104(sp)
    80203e7e:	f0a2                	sd	s0,96(sp)
    80203e80:	eca6                	sd	s1,88(sp)
    80203e82:	e8ca                	sd	s2,80(sp)
    80203e84:	e4ce                	sd	s3,72(sp)
    80203e86:	1880                	addi	s0,sp,112
    80203e88:	84aa                	mv	s1,a0
    80203e8a:	892e                	mv	s2,a1
    elock(f->ep);
    80203e8c:	6d08                	ld	a0,24(a0)
    80203e8e:	00003097          	auipc	ra,0x3
    80203e92:	1a4080e7          	jalr	420(ra) # 80207032 <elock>
    estat(f->ep, &st);
    80203e96:	f9840993          	addi	s3,s0,-104
    80203e9a:	85ce                	mv	a1,s3
    80203e9c:	6c88                	ld	a0,24(s1)
    80203e9e:	00003097          	auipc	ra,0x3
    80203ea2:	350080e7          	jalr	848(ra) # 802071ee <estat>
    eunlock(f->ep);
    80203ea6:	6c88                	ld	a0,24(s1)
    80203ea8:	00003097          	auipc	ra,0x3
    80203eac:	1c0080e7          	jalr	448(ra) # 80207068 <eunlock>
    // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203eb0:	03800613          	li	a2,56
    80203eb4:	85ce                	mv	a1,s3
    80203eb6:	854a                	mv	a0,s2
    80203eb8:	ffffd097          	auipc	ra,0xffffd
    80203ebc:	4c4080e7          	jalr	1220(ra) # 8020137c <copyout2>
    80203ec0:	41f5551b          	sraiw	a0,a0,0x1f
      return -1;
    return 0;
  }
  return -1;
}
    80203ec4:	70a6                	ld	ra,104(sp)
    80203ec6:	7406                	ld	s0,96(sp)
    80203ec8:	64e6                	ld	s1,88(sp)
    80203eca:	6946                	ld	s2,80(sp)
    80203ecc:	69a6                	ld	s3,72(sp)
    80203ece:	6165                	addi	sp,sp,112
    80203ed0:	8082                	ret
  return -1;
    80203ed2:	557d                	li	a0,-1
}
    80203ed4:	8082                	ret

0000000080203ed6 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80203ed6:	7179                	addi	sp,sp,-48
    80203ed8:	f406                	sd	ra,40(sp)
    80203eda:	f022                	sd	s0,32(sp)
    80203edc:	ec26                	sd	s1,24(sp)
    80203ede:	e84a                	sd	s2,16(sp)
    80203ee0:	e44e                	sd	s3,8(sp)
    80203ee2:	1800                	addi	s0,sp,48
  int r = 0;

  if(f->readable == 0)
    80203ee4:	00854783          	lbu	a5,8(a0)
    80203ee8:	c3d5                	beqz	a5,80203f8c <fileread+0xb6>
    80203eea:	84aa                	mv	s1,a0
    80203eec:	89ae                	mv	s3,a1
    80203eee:	8932                	mv	s2,a2
    return -1;

  switch (f->type) {
    80203ef0:	411c                	lw	a5,0(a0)
    80203ef2:	4709                	li	a4,2
    80203ef4:	06e78263          	beq	a5,a4,80203f58 <fileread+0x82>
    80203ef8:	470d                	li	a4,3
    80203efa:	02e78b63          	beq	a5,a4,80203f30 <fileread+0x5a>
    80203efe:	4705                	li	a4,1
    80203f00:	00e78a63          	beq	a5,a4,80203f14 <fileread+0x3e>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
            f->off += r;
        eunlock(f->ep);
        break;
    default:
      panic("fileread");
    80203f04:	00007517          	auipc	a0,0x7
    80203f08:	d5450513          	addi	a0,a0,-684 # 8020ac58 <digits+0x8d8>
    80203f0c:	ffffc097          	auipc	ra,0xffffc
    80203f10:	236080e7          	jalr	566(ra) # 80200142 <panic>
        r = piperead(f->pipe, addr, n);
    80203f14:	6908                	ld	a0,16(a0)
    80203f16:	00000097          	auipc	ra,0x0
    80203f1a:	48c080e7          	jalr	1164(ra) # 802043a2 <piperead>
    80203f1e:	892a                	mv	s2,a0
  }

  return r;
}
    80203f20:	854a                	mv	a0,s2
    80203f22:	70a2                	ld	ra,40(sp)
    80203f24:	7402                	ld	s0,32(sp)
    80203f26:	64e2                	ld	s1,24(sp)
    80203f28:	6942                	ld	s2,16(sp)
    80203f2a:	69a2                	ld	s3,8(sp)
    80203f2c:	6145                	addi	sp,sp,48
    80203f2e:	8082                	ret
        if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80203f30:	02451783          	lh	a5,36(a0)
    80203f34:	03079693          	slli	a3,a5,0x30
    80203f38:	92c1                	srli	a3,a3,0x30
    80203f3a:	4725                	li	a4,9
    80203f3c:	04d76a63          	bltu	a4,a3,80203f90 <fileread+0xba>
    80203f40:	0792                	slli	a5,a5,0x4
    80203f42:	00026717          	auipc	a4,0x26
    80203f46:	36e70713          	addi	a4,a4,878 # 8022a2b0 <devsw>
    80203f4a:	97ba                	add	a5,a5,a4
    80203f4c:	639c                	ld	a5,0(a5)
    80203f4e:	c3b9                	beqz	a5,80203f94 <fileread+0xbe>
        r = devsw[f->major].read(1, addr, n);
    80203f50:	4505                	li	a0,1
    80203f52:	9782                	jalr	a5
    80203f54:	892a                	mv	s2,a0
        break;
    80203f56:	b7e9                	j	80203f20 <fileread+0x4a>
        elock(f->ep);
    80203f58:	6d08                	ld	a0,24(a0)
    80203f5a:	00003097          	auipc	ra,0x3
    80203f5e:	0d8080e7          	jalr	216(ra) # 80207032 <elock>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
    80203f62:	874a                	mv	a4,s2
    80203f64:	5094                	lw	a3,32(s1)
    80203f66:	864e                	mv	a2,s3
    80203f68:	4585                	li	a1,1
    80203f6a:	6c88                	ld	a0,24(s1)
    80203f6c:	00002097          	auipc	ra,0x2
    80203f70:	7dc080e7          	jalr	2012(ra) # 80206748 <eread>
    80203f74:	892a                	mv	s2,a0
    80203f76:	00a05563          	blez	a0,80203f80 <fileread+0xaa>
            f->off += r;
    80203f7a:	509c                	lw	a5,32(s1)
    80203f7c:	9fa9                	addw	a5,a5,a0
    80203f7e:	d09c                	sw	a5,32(s1)
        eunlock(f->ep);
    80203f80:	6c88                	ld	a0,24(s1)
    80203f82:	00003097          	auipc	ra,0x3
    80203f86:	0e6080e7          	jalr	230(ra) # 80207068 <eunlock>
        break;
    80203f8a:	bf59                	j	80203f20 <fileread+0x4a>
    return -1;
    80203f8c:	597d                	li	s2,-1
    80203f8e:	bf49                	j	80203f20 <fileread+0x4a>
          return -1;
    80203f90:	597d                	li	s2,-1
    80203f92:	b779                	j	80203f20 <fileread+0x4a>
    80203f94:	597d                	li	s2,-1
    80203f96:	b769                	j	80203f20 <fileread+0x4a>

0000000080203f98 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80203f98:	7179                	addi	sp,sp,-48
    80203f9a:	f406                	sd	ra,40(sp)
    80203f9c:	f022                	sd	s0,32(sp)
    80203f9e:	ec26                	sd	s1,24(sp)
    80203fa0:	e84a                	sd	s2,16(sp)
    80203fa2:	e44e                	sd	s3,8(sp)
    80203fa4:	e052                	sd	s4,0(sp)
    80203fa6:	1800                	addi	s0,sp,48
  int ret = 0;

  if(f->writable == 0)
    80203fa8:	00954783          	lbu	a5,9(a0)
    80203fac:	cbcd                	beqz	a5,8020405e <filewrite+0xc6>
    80203fae:	84aa                	mv	s1,a0
    80203fb0:	892e                	mv	s2,a1
    80203fb2:	89b2                	mv	s3,a2
    return -1;

  if(f->type == FD_PIPE){
    80203fb4:	411c                	lw	a5,0(a0)
    80203fb6:	4705                	li	a4,1
    80203fb8:	04e78963          	beq	a5,a4,8020400a <filewrite+0x72>
    ret = pipewrite(f->pipe, addr, n);
  } else if(f->type == FD_DEVICE){
    80203fbc:	470d                	li	a4,3
    80203fbe:	04e78d63          	beq	a5,a4,80204018 <filewrite+0x80>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
      return -1;
    ret = devsw[f->major].write(1, addr, n);
  } else if(f->type == FD_ENTRY){
    80203fc2:	4709                	li	a4,2
    80203fc4:	08e79563          	bne	a5,a4,8020404e <filewrite+0xb6>
    elock(f->ep);
    80203fc8:	6d08                	ld	a0,24(a0)
    80203fca:	00003097          	auipc	ra,0x3
    80203fce:	068080e7          	jalr	104(ra) # 80207032 <elock>
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203fd2:	00098a1b          	sext.w	s4,s3
    80203fd6:	8752                	mv	a4,s4
    80203fd8:	5094                	lw	a3,32(s1)
    80203fda:	864a                	mv	a2,s2
    80203fdc:	4585                	li	a1,1
    80203fde:	6c88                	ld	a0,24(s1)
    80203fe0:	00003097          	auipc	ra,0x3
    80203fe4:	860080e7          	jalr	-1952(ra) # 80206840 <ewrite>
      ret = n;
      f->off += n;
    } else {
      ret = -1;
    80203fe8:	597d                	li	s2,-1
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203fea:	05350b63          	beq	a0,s3,80204040 <filewrite+0xa8>
    }
    eunlock(f->ep);
    80203fee:	6c88                	ld	a0,24(s1)
    80203ff0:	00003097          	auipc	ra,0x3
    80203ff4:	078080e7          	jalr	120(ra) # 80207068 <eunlock>
  } else {
    panic("filewrite");
  }

  return ret;
}
    80203ff8:	854a                	mv	a0,s2
    80203ffa:	70a2                	ld	ra,40(sp)
    80203ffc:	7402                	ld	s0,32(sp)
    80203ffe:	64e2                	ld	s1,24(sp)
    80204000:	6942                	ld	s2,16(sp)
    80204002:	69a2                	ld	s3,8(sp)
    80204004:	6a02                	ld	s4,0(sp)
    80204006:	6145                	addi	sp,sp,48
    80204008:	8082                	ret
    ret = pipewrite(f->pipe, addr, n);
    8020400a:	6908                	ld	a0,16(a0)
    8020400c:	00000097          	auipc	ra,0x0
    80204010:	26e080e7          	jalr	622(ra) # 8020427a <pipewrite>
    80204014:	892a                	mv	s2,a0
    80204016:	b7cd                	j	80203ff8 <filewrite+0x60>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80204018:	02451783          	lh	a5,36(a0)
    8020401c:	03079693          	slli	a3,a5,0x30
    80204020:	92c1                	srli	a3,a3,0x30
    80204022:	4725                	li	a4,9
    80204024:	02d76f63          	bltu	a4,a3,80204062 <filewrite+0xca>
    80204028:	0792                	slli	a5,a5,0x4
    8020402a:	00026717          	auipc	a4,0x26
    8020402e:	28670713          	addi	a4,a4,646 # 8022a2b0 <devsw>
    80204032:	97ba                	add	a5,a5,a4
    80204034:	679c                	ld	a5,8(a5)
    80204036:	cb85                	beqz	a5,80204066 <filewrite+0xce>
    ret = devsw[f->major].write(1, addr, n);
    80204038:	4505                	li	a0,1
    8020403a:	9782                	jalr	a5
    8020403c:	892a                	mv	s2,a0
    8020403e:	bf6d                	j	80203ff8 <filewrite+0x60>
      f->off += n;
    80204040:	509c                	lw	a5,32(s1)
    80204042:	01478a3b          	addw	s4,a5,s4
    80204046:	0344a023          	sw	s4,32(s1)
      ret = n;
    8020404a:	894e                	mv	s2,s3
    8020404c:	b74d                	j	80203fee <filewrite+0x56>
    panic("filewrite");
    8020404e:	00007517          	auipc	a0,0x7
    80204052:	c1a50513          	addi	a0,a0,-998 # 8020ac68 <digits+0x8e8>
    80204056:	ffffc097          	auipc	ra,0xffffc
    8020405a:	0ec080e7          	jalr	236(ra) # 80200142 <panic>
    return -1;
    8020405e:	597d                	li	s2,-1
    80204060:	bf61                	j	80203ff8 <filewrite+0x60>
      return -1;
    80204062:	597d                	li	s2,-1
    80204064:	bf51                	j	80203ff8 <filewrite+0x60>
    80204066:	597d                	li	s2,-1
    80204068:	bf41                	j	80203ff8 <filewrite+0x60>

000000008020406a <dirnext>:
int
dirnext(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();

  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    8020406a:	00854783          	lbu	a5,8(a0)
    8020406e:	cfdd                	beqz	a5,8020412c <dirnext+0xc2>
{
    80204070:	7141                	addi	sp,sp,-496
    80204072:	f786                	sd	ra,488(sp)
    80204074:	f3a2                	sd	s0,480(sp)
    80204076:	efa6                	sd	s1,472(sp)
    80204078:	ebca                	sd	s2,464(sp)
    8020407a:	e7ce                	sd	s3,456(sp)
    8020407c:	e3d2                	sd	s4,448(sp)
    8020407e:	ff56                	sd	s5,440(sp)
    80204080:	1b80                	addi	s0,sp,496
    80204082:	84aa                	mv	s1,a0
    80204084:	8aae                	mv	s5,a1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80204086:	6d18                	ld	a4,24(a0)
    80204088:	10074783          	lbu	a5,256(a4)
    8020408c:	8bc1                	andi	a5,a5,16
    return -1;
    8020408e:	557d                	li	a0,-1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80204090:	eb91                	bnez	a5,802040a4 <dirnext+0x3a>
  // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    return -1;

  return 1;
    80204092:	70be                	ld	ra,488(sp)
    80204094:	741e                	ld	s0,480(sp)
    80204096:	64fe                	ld	s1,472(sp)
    80204098:	695e                	ld	s2,464(sp)
    8020409a:	69be                	ld	s3,456(sp)
    8020409c:	6a1e                	ld	s4,448(sp)
    8020409e:	7afa                	ld	s5,440(sp)
    802040a0:	617d                	addi	sp,sp,496
    802040a2:	8082                	ret
  int count = 0;
    802040a4:	e0042e23          	sw	zero,-484(s0)
  elock(f->ep);
    802040a8:	853a                	mv	a0,a4
    802040aa:	00003097          	auipc	ra,0x3
    802040ae:	f88080e7          	jalr	-120(ra) # 80207032 <elock>
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    802040b2:	e1c40a13          	addi	s4,s0,-484
    802040b6:	e5840993          	addi	s3,s0,-424
    802040ba:	a801                	j	802040ca <dirnext+0x60>
    f->off += count * 32;
    802040bc:	e1c42783          	lw	a5,-484(s0)
    802040c0:	0057971b          	slliw	a4,a5,0x5
    802040c4:	509c                	lw	a5,32(s1)
    802040c6:	9fb9                	addw	a5,a5,a4
    802040c8:	d09c                	sw	a5,32(s1)
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    802040ca:	86d2                	mv	a3,s4
    802040cc:	5090                	lw	a2,32(s1)
    802040ce:	85ce                	mv	a1,s3
    802040d0:	6c88                	ld	a0,24(s1)
    802040d2:	00003097          	auipc	ra,0x3
    802040d6:	164080e7          	jalr	356(ra) # 80207236 <enext>
    802040da:	892a                	mv	s2,a0
    802040dc:	d165                	beqz	a0,802040bc <dirnext+0x52>
  eunlock(f->ep);
    802040de:	6c88                	ld	a0,24(s1)
    802040e0:	00003097          	auipc	ra,0x3
    802040e4:	f88080e7          	jalr	-120(ra) # 80207068 <eunlock>
  if (ret == -1)
    802040e8:	57fd                	li	a5,-1
    return 0;
    802040ea:	4501                	li	a0,0
  if (ret == -1)
    802040ec:	faf903e3          	beq	s2,a5,80204092 <dirnext+0x28>
  f->off += count * 32;
    802040f0:	e1c42783          	lw	a5,-484(s0)
    802040f4:	0057971b          	slliw	a4,a5,0x5
    802040f8:	509c                	lw	a5,32(s1)
    802040fa:	9fb9                	addw	a5,a5,a4
    802040fc:	d09c                	sw	a5,32(s1)
  estat(&de, &st);
    802040fe:	e2040493          	addi	s1,s0,-480
    80204102:	85a6                	mv	a1,s1
    80204104:	e5840513          	addi	a0,s0,-424
    80204108:	00003097          	auipc	ra,0x3
    8020410c:	0e6080e7          	jalr	230(ra) # 802071ee <estat>
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80204110:	03800613          	li	a2,56
    80204114:	85a6                	mv	a1,s1
    80204116:	8556                	mv	a0,s5
    80204118:	ffffd097          	auipc	ra,0xffffd
    8020411c:	264080e7          	jalr	612(ra) # 8020137c <copyout2>
    80204120:	87aa                	mv	a5,a0
  return 1;
    80204122:	4505                	li	a0,1
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80204124:	f607d7e3          	bgez	a5,80204092 <dirnext+0x28>
    return -1;
    80204128:	557d                	li	a0,-1
    8020412a:	b7a5                	j	80204092 <dirnext+0x28>
    return -1;
    8020412c:	557d                	li	a0,-1
    8020412e:	8082                	ret

0000000080204130 <pipealloc>:
#include "include/kalloc.h"
#include "include/vm.h"

int
pipealloc(struct file **f0, struct file **f1)
{
    80204130:	7179                	addi	sp,sp,-48
    80204132:	f406                	sd	ra,40(sp)
    80204134:	f022                	sd	s0,32(sp)
    80204136:	ec26                	sd	s1,24(sp)
    80204138:	e84a                	sd	s2,16(sp)
    8020413a:	e44e                	sd	s3,8(sp)
    8020413c:	e052                	sd	s4,0(sp)
    8020413e:	1800                	addi	s0,sp,48
    80204140:	84aa                	mv	s1,a0
    80204142:	8a2e                	mv	s4,a1
  struct pipe *pi;

  pi = 0;
  *f0 = *f1 = 0;
    80204144:	0005b023          	sd	zero,0(a1)
    80204148:	00053023          	sd	zero,0(a0)
  if((*f0 = filealloc()) == NULL || (*f1 = filealloc()) == NULL)
    8020414c:	00000097          	auipc	ra,0x0
    80204150:	bb4080e7          	jalr	-1100(ra) # 80203d00 <filealloc>
    80204154:	e088                	sd	a0,0(s1)
    80204156:	c551                	beqz	a0,802041e2 <pipealloc+0xb2>
    80204158:	00000097          	auipc	ra,0x0
    8020415c:	ba8080e7          	jalr	-1112(ra) # 80203d00 <filealloc>
    80204160:	00aa3023          	sd	a0,0(s4)
    80204164:	c92d                	beqz	a0,802041d6 <pipealloc+0xa6>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == NULL)
    80204166:	ffffc097          	auipc	ra,0xffffc
    8020416a:	3f6080e7          	jalr	1014(ra) # 8020055c <kalloc>
    8020416e:	892a                	mv	s2,a0
    80204170:	c125                	beqz	a0,802041d0 <pipealloc+0xa0>
    goto bad;
  pi->readopen = 1;
    80204172:	4985                	li	s3,1
    80204174:	23352023          	sw	s3,544(a0)
  pi->writeopen = 1;
    80204178:	23352223          	sw	s3,548(a0)
  pi->nwrite = 0;
    8020417c:	20052e23          	sw	zero,540(a0)
  pi->nread = 0;
    80204180:	20052c23          	sw	zero,536(a0)
  initlock(&pi->lock, "pipe");
    80204184:	00007597          	auipc	a1,0x7
    80204188:	93458593          	addi	a1,a1,-1740 # 8020aab8 <digits+0x738>
    8020418c:	ffffc097          	auipc	ra,0xffffc
    80204190:	4f8080e7          	jalr	1272(ra) # 80200684 <initlock>
  (*f0)->type = FD_PIPE;
    80204194:	609c                	ld	a5,0(s1)
    80204196:	0137a023          	sw	s3,0(a5)
  (*f0)->readable = 1;
    8020419a:	609c                	ld	a5,0(s1)
    8020419c:	01378423          	sb	s3,8(a5)
  (*f0)->writable = 0;
    802041a0:	609c                	ld	a5,0(s1)
    802041a2:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    802041a6:	609c                	ld	a5,0(s1)
    802041a8:	0127b823          	sd	s2,16(a5)
  (*f1)->type = FD_PIPE;
    802041ac:	000a3783          	ld	a5,0(s4)
    802041b0:	0137a023          	sw	s3,0(a5)
  (*f1)->readable = 0;
    802041b4:	000a3783          	ld	a5,0(s4)
    802041b8:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    802041bc:	000a3783          	ld	a5,0(s4)
    802041c0:	013784a3          	sb	s3,9(a5)
  (*f1)->pipe = pi;
    802041c4:	000a3783          	ld	a5,0(s4)
    802041c8:	0127b823          	sd	s2,16(a5)
  return 0;
    802041cc:	4501                	li	a0,0
    802041ce:	a025                	j	802041f6 <pipealloc+0xc6>

 bad:
  if(pi)
    kfree((char*)pi);
  if(*f0)
    802041d0:	6088                	ld	a0,0(s1)
    802041d2:	e501                	bnez	a0,802041da <pipealloc+0xaa>
    802041d4:	a039                	j	802041e2 <pipealloc+0xb2>
    802041d6:	6088                	ld	a0,0(s1)
    802041d8:	c51d                	beqz	a0,80204206 <pipealloc+0xd6>
    fileclose(*f0);
    802041da:	00000097          	auipc	ra,0x0
    802041de:	be2080e7          	jalr	-1054(ra) # 80203dbc <fileclose>
  if(*f1)
    802041e2:	000a3783          	ld	a5,0(s4)
    fileclose(*f1);
  return -1;
    802041e6:	557d                	li	a0,-1
  if(*f1)
    802041e8:	c799                	beqz	a5,802041f6 <pipealloc+0xc6>
    fileclose(*f1);
    802041ea:	853e                	mv	a0,a5
    802041ec:	00000097          	auipc	ra,0x0
    802041f0:	bd0080e7          	jalr	-1072(ra) # 80203dbc <fileclose>
  return -1;
    802041f4:	557d                	li	a0,-1
}
    802041f6:	70a2                	ld	ra,40(sp)
    802041f8:	7402                	ld	s0,32(sp)
    802041fa:	64e2                	ld	s1,24(sp)
    802041fc:	6942                	ld	s2,16(sp)
    802041fe:	69a2                	ld	s3,8(sp)
    80204200:	6a02                	ld	s4,0(sp)
    80204202:	6145                	addi	sp,sp,48
    80204204:	8082                	ret
  return -1;
    80204206:	557d                	li	a0,-1
    80204208:	b7fd                	j	802041f6 <pipealloc+0xc6>

000000008020420a <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    8020420a:	1101                	addi	sp,sp,-32
    8020420c:	ec06                	sd	ra,24(sp)
    8020420e:	e822                	sd	s0,16(sp)
    80204210:	e426                	sd	s1,8(sp)
    80204212:	e04a                	sd	s2,0(sp)
    80204214:	1000                	addi	s0,sp,32
    80204216:	84aa                	mv	s1,a0
    80204218:	892e                	mv	s2,a1
  acquire(&pi->lock);
    8020421a:	ffffc097          	auipc	ra,0xffffc
    8020421e:	4ae080e7          	jalr	1198(ra) # 802006c8 <acquire>
  if(writable){
    80204222:	02090d63          	beqz	s2,8020425c <pipeclose+0x52>
    pi->writeopen = 0;
    80204226:	2204a223          	sw	zero,548(s1)
    wakeup(&pi->nread);
    8020422a:	21848513          	addi	a0,s1,536
    8020422e:	ffffe097          	auipc	ra,0xffffe
    80204232:	206080e7          	jalr	518(ra) # 80202434 <wakeup>
  } else {
    pi->readopen = 0;
    wakeup(&pi->nwrite);
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80204236:	2204b783          	ld	a5,544(s1)
    8020423a:	eb95                	bnez	a5,8020426e <pipeclose+0x64>
    release(&pi->lock);
    8020423c:	8526                	mv	a0,s1
    8020423e:	ffffc097          	auipc	ra,0xffffc
    80204242:	4de080e7          	jalr	1246(ra) # 8020071c <release>
    kfree((char*)pi);
    80204246:	8526                	mv	a0,s1
    80204248:	ffffc097          	auipc	ra,0xffffc
    8020424c:	1fc080e7          	jalr	508(ra) # 80200444 <kfree>
  } else
    release(&pi->lock);
}
    80204250:	60e2                	ld	ra,24(sp)
    80204252:	6442                	ld	s0,16(sp)
    80204254:	64a2                	ld	s1,8(sp)
    80204256:	6902                	ld	s2,0(sp)
    80204258:	6105                	addi	sp,sp,32
    8020425a:	8082                	ret
    pi->readopen = 0;
    8020425c:	2204a023          	sw	zero,544(s1)
    wakeup(&pi->nwrite);
    80204260:	21c48513          	addi	a0,s1,540
    80204264:	ffffe097          	auipc	ra,0xffffe
    80204268:	1d0080e7          	jalr	464(ra) # 80202434 <wakeup>
    8020426c:	b7e9                	j	80204236 <pipeclose+0x2c>
    release(&pi->lock);
    8020426e:	8526                	mv	a0,s1
    80204270:	ffffc097          	auipc	ra,0xffffc
    80204274:	4ac080e7          	jalr	1196(ra) # 8020071c <release>
}
    80204278:	bfe1                	j	80204250 <pipeclose+0x46>

000000008020427a <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    8020427a:	7175                	addi	sp,sp,-144
    8020427c:	e506                	sd	ra,136(sp)
    8020427e:	e122                	sd	s0,128(sp)
    80204280:	fca6                	sd	s1,120(sp)
    80204282:	f8ca                	sd	s2,112(sp)
    80204284:	f4ce                	sd	s3,104(sp)
    80204286:	f0d2                	sd	s4,96(sp)
    80204288:	ecd6                	sd	s5,88(sp)
    8020428a:	e8da                	sd	s6,80(sp)
    8020428c:	e4de                	sd	s7,72(sp)
    8020428e:	e0e2                	sd	s8,64(sp)
    80204290:	fc66                	sd	s9,56(sp)
    80204292:	f86a                	sd	s10,48(sp)
    80204294:	f46e                	sd	s11,40(sp)
    80204296:	0900                	addi	s0,sp,144
    80204298:	84aa                	mv	s1,a0
    8020429a:	f6b43c23          	sd	a1,-136(s0)
    8020429e:	8b32                	mv	s6,a2
  int i;
  char ch;
  struct proc *pr = myproc();
    802042a0:	ffffd097          	auipc	ra,0xffffd
    802042a4:	7b8080e7          	jalr	1976(ra) # 80201a58 <myproc>
    802042a8:	892a                	mv	s2,a0

  acquire(&pi->lock);
    802042aa:	8526                	mv	a0,s1
    802042ac:	ffffc097          	auipc	ra,0xffffc
    802042b0:	41c080e7          	jalr	1052(ra) # 802006c8 <acquire>
  for(i = 0; i < n; i++){
    802042b4:	0d605a63          	blez	s6,80204388 <pipewrite+0x10e>
    802042b8:	89a6                	mv	s3,s1
    802042ba:	3b7d                	addiw	s6,s6,-1
    802042bc:	1b02                	slli	s6,s6,0x20
    802042be:	020b5b13          	srli	s6,s6,0x20
    802042c2:	4b81                	li	s7,0
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
      if(pi->readopen == 0 || pr->killed){
        release(&pi->lock);
        return -1;
      }
      wakeup(&pi->nread);
    802042c4:	21848a93          	addi	s5,s1,536
      sleep(&pi->nwrite, &pi->lock);
    802042c8:	21c48a13          	addi	s4,s1,540
    }
    // if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    if(copyin2(&ch, addr + i, 1) == -1)
    802042cc:	f8f40d93          	addi	s11,s0,-113
    802042d0:	5d7d                	li	s10,-1
    802042d2:	000b8c9b          	sext.w	s9,s7
    802042d6:	8c66                	mv	s8,s9
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    802042d8:	2184a783          	lw	a5,536(s1)
    802042dc:	21c4a703          	lw	a4,540(s1)
    802042e0:	2007879b          	addiw	a5,a5,512
    802042e4:	02f71b63          	bne	a4,a5,8020431a <pipewrite+0xa0>
      if(pi->readopen == 0 || pr->killed){
    802042e8:	2204a783          	lw	a5,544(s1)
    802042ec:	cba5                	beqz	a5,8020435c <pipewrite+0xe2>
    802042ee:	03092783          	lw	a5,48(s2)
    802042f2:	e7ad                	bnez	a5,8020435c <pipewrite+0xe2>
      wakeup(&pi->nread);
    802042f4:	8556                	mv	a0,s5
    802042f6:	ffffe097          	auipc	ra,0xffffe
    802042fa:	13e080e7          	jalr	318(ra) # 80202434 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    802042fe:	85ce                	mv	a1,s3
    80204300:	8552                	mv	a0,s4
    80204302:	ffffe097          	auipc	ra,0xffffe
    80204306:	fb0080e7          	jalr	-80(ra) # 802022b2 <sleep>
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    8020430a:	2184a783          	lw	a5,536(s1)
    8020430e:	21c4a703          	lw	a4,540(s1)
    80204312:	2007879b          	addiw	a5,a5,512
    80204316:	fcf709e3          	beq	a4,a5,802042e8 <pipewrite+0x6e>
    if(copyin2(&ch, addr + i, 1) == -1)
    8020431a:	4605                	li	a2,1
    8020431c:	f7843783          	ld	a5,-136(s0)
    80204320:	00fb85b3          	add	a1,s7,a5
    80204324:	856e                	mv	a0,s11
    80204326:	ffffd097          	auipc	ra,0xffffd
    8020432a:	134080e7          	jalr	308(ra) # 8020145a <copyin2>
    8020432e:	05a50e63          	beq	a0,s10,8020438a <pipewrite+0x110>
      break;
    pi->data[pi->nwrite++ % PIPESIZE] = ch;
    80204332:	21c4a783          	lw	a5,540(s1)
    80204336:	0017871b          	addiw	a4,a5,1
    8020433a:	20e4ae23          	sw	a4,540(s1)
    8020433e:	1ff7f793          	andi	a5,a5,511
    80204342:	97a6                	add	a5,a5,s1
    80204344:	f8f44703          	lbu	a4,-113(s0)
    80204348:	00e78c23          	sb	a4,24(a5)
  for(i = 0; i < n; i++){
    8020434c:	001c8c1b          	addiw	s8,s9,1
    80204350:	001b8793          	addi	a5,s7,1
    80204354:	036b8b63          	beq	s7,s6,8020438a <pipewrite+0x110>
    80204358:	8bbe                	mv	s7,a5
    8020435a:	bfa5                	j	802042d2 <pipewrite+0x58>
        release(&pi->lock);
    8020435c:	8526                	mv	a0,s1
    8020435e:	ffffc097          	auipc	ra,0xffffc
    80204362:	3be080e7          	jalr	958(ra) # 8020071c <release>
        return -1;
    80204366:	5c7d                	li	s8,-1
  }
  wakeup(&pi->nread);
  release(&pi->lock);
  return i;
}
    80204368:	8562                	mv	a0,s8
    8020436a:	60aa                	ld	ra,136(sp)
    8020436c:	640a                	ld	s0,128(sp)
    8020436e:	74e6                	ld	s1,120(sp)
    80204370:	7946                	ld	s2,112(sp)
    80204372:	79a6                	ld	s3,104(sp)
    80204374:	7a06                	ld	s4,96(sp)
    80204376:	6ae6                	ld	s5,88(sp)
    80204378:	6b46                	ld	s6,80(sp)
    8020437a:	6ba6                	ld	s7,72(sp)
    8020437c:	6c06                	ld	s8,64(sp)
    8020437e:	7ce2                	ld	s9,56(sp)
    80204380:	7d42                	ld	s10,48(sp)
    80204382:	7da2                	ld	s11,40(sp)
    80204384:	6149                	addi	sp,sp,144
    80204386:	8082                	ret
  for(i = 0; i < n; i++){
    80204388:	4c01                	li	s8,0
  wakeup(&pi->nread);
    8020438a:	21848513          	addi	a0,s1,536
    8020438e:	ffffe097          	auipc	ra,0xffffe
    80204392:	0a6080e7          	jalr	166(ra) # 80202434 <wakeup>
  release(&pi->lock);
    80204396:	8526                	mv	a0,s1
    80204398:	ffffc097          	auipc	ra,0xffffc
    8020439c:	384080e7          	jalr	900(ra) # 8020071c <release>
  return i;
    802043a0:	b7e1                	j	80204368 <pipewrite+0xee>

00000000802043a2 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    802043a2:	715d                	addi	sp,sp,-80
    802043a4:	e486                	sd	ra,72(sp)
    802043a6:	e0a2                	sd	s0,64(sp)
    802043a8:	fc26                	sd	s1,56(sp)
    802043aa:	f84a                	sd	s2,48(sp)
    802043ac:	f44e                	sd	s3,40(sp)
    802043ae:	f052                	sd	s4,32(sp)
    802043b0:	ec56                	sd	s5,24(sp)
    802043b2:	e85a                	sd	s6,16(sp)
    802043b4:	0880                	addi	s0,sp,80
    802043b6:	84aa                	mv	s1,a0
    802043b8:	892e                	mv	s2,a1
    802043ba:	8a32                	mv	s4,a2
  int i;
  struct proc *pr = myproc();
    802043bc:	ffffd097          	auipc	ra,0xffffd
    802043c0:	69c080e7          	jalr	1692(ra) # 80201a58 <myproc>
    802043c4:	89aa                	mv	s3,a0
  char ch;

  acquire(&pi->lock);
    802043c6:	8b26                	mv	s6,s1
    802043c8:	8526                	mv	a0,s1
    802043ca:	ffffc097          	auipc	ra,0xffffc
    802043ce:	2fe080e7          	jalr	766(ra) # 802006c8 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    802043d2:	2184a703          	lw	a4,536(s1)
    802043d6:	21c4a783          	lw	a5,540(s1)
    if(pr->killed){
      release(&pi->lock);
      return -1;
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    802043da:	21848a93          	addi	s5,s1,536
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    802043de:	02f71463          	bne	a4,a5,80204406 <piperead+0x64>
    802043e2:	2244a783          	lw	a5,548(s1)
    802043e6:	c385                	beqz	a5,80204406 <piperead+0x64>
    if(pr->killed){
    802043e8:	0309a783          	lw	a5,48(s3)
    802043ec:	e7d9                	bnez	a5,8020447a <piperead+0xd8>
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    802043ee:	85da                	mv	a1,s6
    802043f0:	8556                	mv	a0,s5
    802043f2:	ffffe097          	auipc	ra,0xffffe
    802043f6:	ec0080e7          	jalr	-320(ra) # 802022b2 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    802043fa:	2184a703          	lw	a4,536(s1)
    802043fe:	21c4a783          	lw	a5,540(s1)
    80204402:	fef700e3          	beq	a4,a5,802043e2 <piperead+0x40>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80204406:	09405163          	blez	s4,80204488 <piperead+0xe6>
    8020440a:	4981                	li	s3,0
    if(pi->nread == pi->nwrite)
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    // if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    if(copyout2(addr + i, &ch, 1) == -1)
    8020440c:	fbf40b13          	addi	s6,s0,-65
    80204410:	5afd                	li	s5,-1
    if(pi->nread == pi->nwrite)
    80204412:	2184a783          	lw	a5,536(s1)
    80204416:	21c4a703          	lw	a4,540(s1)
    8020441a:	02f70a63          	beq	a4,a5,8020444e <piperead+0xac>
    ch = pi->data[pi->nread++ % PIPESIZE];
    8020441e:	0017871b          	addiw	a4,a5,1
    80204422:	20e4ac23          	sw	a4,536(s1)
    80204426:	1ff7f793          	andi	a5,a5,511
    8020442a:	97a6                	add	a5,a5,s1
    8020442c:	0187c783          	lbu	a5,24(a5)
    80204430:	faf40fa3          	sb	a5,-65(s0)
    if(copyout2(addr + i, &ch, 1) == -1)
    80204434:	4605                	li	a2,1
    80204436:	85da                	mv	a1,s6
    80204438:	854a                	mv	a0,s2
    8020443a:	ffffd097          	auipc	ra,0xffffd
    8020443e:	f42080e7          	jalr	-190(ra) # 8020137c <copyout2>
    80204442:	01550663          	beq	a0,s5,8020444e <piperead+0xac>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80204446:	2985                	addiw	s3,s3,1
    80204448:	0905                	addi	s2,s2,1
    8020444a:	fd3a14e3          	bne	s4,s3,80204412 <piperead+0x70>
      break;
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    8020444e:	21c48513          	addi	a0,s1,540
    80204452:	ffffe097          	auipc	ra,0xffffe
    80204456:	fe2080e7          	jalr	-30(ra) # 80202434 <wakeup>
  release(&pi->lock);
    8020445a:	8526                	mv	a0,s1
    8020445c:	ffffc097          	auipc	ra,0xffffc
    80204460:	2c0080e7          	jalr	704(ra) # 8020071c <release>
  return i;
}
    80204464:	854e                	mv	a0,s3
    80204466:	60a6                	ld	ra,72(sp)
    80204468:	6406                	ld	s0,64(sp)
    8020446a:	74e2                	ld	s1,56(sp)
    8020446c:	7942                	ld	s2,48(sp)
    8020446e:	79a2                	ld	s3,40(sp)
    80204470:	7a02                	ld	s4,32(sp)
    80204472:	6ae2                	ld	s5,24(sp)
    80204474:	6b42                	ld	s6,16(sp)
    80204476:	6161                	addi	sp,sp,80
    80204478:	8082                	ret
      release(&pi->lock);
    8020447a:	8526                	mv	a0,s1
    8020447c:	ffffc097          	auipc	ra,0xffffc
    80204480:	2a0080e7          	jalr	672(ra) # 8020071c <release>
      return -1;
    80204484:	59fd                	li	s3,-1
    80204486:	bff9                	j	80204464 <piperead+0xc2>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80204488:	4981                	li	s3,0
    8020448a:	b7d1                	j	8020444e <piperead+0xac>

000000008020448c <exec>:
  return 0;
}


int exec(char *path, char **argv)
{
    8020448c:	dd010113          	addi	sp,sp,-560
    80204490:	22113423          	sd	ra,552(sp)
    80204494:	22813023          	sd	s0,544(sp)
    80204498:	20913c23          	sd	s1,536(sp)
    8020449c:	21213823          	sd	s2,528(sp)
    802044a0:	21313423          	sd	s3,520(sp)
    802044a4:	21413023          	sd	s4,512(sp)
    802044a8:	ffd6                	sd	s5,504(sp)
    802044aa:	fbda                	sd	s6,496(sp)
    802044ac:	f7de                	sd	s7,488(sp)
    802044ae:	f3e2                	sd	s8,480(sp)
    802044b0:	efe6                	sd	s9,472(sp)
    802044b2:	ebea                	sd	s10,464(sp)
    802044b4:	e7ee                	sd	s11,456(sp)
    802044b6:	1c00                	addi	s0,sp,560
    802044b8:	892a                	mv	s2,a0
    802044ba:	dca43c23          	sd	a0,-552(s0)
    802044be:	deb43423          	sd	a1,-536(s0)
  struct elfhdr elf;
  struct dirent *ep;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
  pagetable_t kpagetable = 0, oldkpagetable;
  struct proc *p = myproc();
    802044c2:	ffffd097          	auipc	ra,0xffffd
    802044c6:	596080e7          	jalr	1430(ra) # 80201a58 <myproc>
    802044ca:	84aa                	mv	s1,a0

  // Make a copy of p->kpt without old user space, 
  // but with the same kstack we are using now, which can't be changed
  if ((kpagetable = (pagetable_t)kalloc()) == NULL) {
    802044cc:	ffffc097          	auipc	ra,0xffffc
    802044d0:	090080e7          	jalr	144(ra) # 8020055c <kalloc>
    802044d4:	2a050763          	beqz	a0,80204782 <exec+0x2f6>
    802044d8:	8aaa                	mv	s5,a0
    return -1;
  }
  memmove(kpagetable, p->kpagetable, PGSIZE);
    802044da:	6605                	lui	a2,0x1
    802044dc:	6cac                	ld	a1,88(s1)
    802044de:	ffffc097          	auipc	ra,0xffffc
    802044e2:	2e6080e7          	jalr	742(ra) # 802007c4 <memmove>
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    kpagetable[i] = 0;
    802044e6:	000ab023          	sd	zero,0(s5)
    802044ea:	000ab423          	sd	zero,8(s5)
  }

  if((ep = ename(path)) == NULL) {
    802044ee:	854a                	mv	a0,s2
    802044f0:	00003097          	auipc	ra,0x3
    802044f4:	2ec080e7          	jalr	748(ra) # 802077dc <ename>
    802044f8:	8a2a                	mv	s4,a0
    802044fa:	3a050d63          	beqz	a0,802048b4 <exec+0x428>
    #ifdef DEBUG
    printf("[exec] %s not found\n", path);
    #endif
    goto bad;
  }
  elock(ep);
    802044fe:	00003097          	auipc	ra,0x3
    80204502:	b34080e7          	jalr	-1228(ra) # 80207032 <elock>

  // Check ELF header
  if(eread(ep, 0, (uint64) &elf, 0, sizeof(elf)) != sizeof(elf))
    80204506:	04000713          	li	a4,64
    8020450a:	4681                	li	a3,0
    8020450c:	e4840613          	addi	a2,s0,-440
    80204510:	4581                	li	a1,0
    80204512:	8552                	mv	a0,s4
    80204514:	00002097          	auipc	ra,0x2
    80204518:	234080e7          	jalr	564(ra) # 80206748 <eread>
    8020451c:	04000793          	li	a5,64
    80204520:	00f51a63          	bne	a0,a5,80204534 <exec+0xa8>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    80204524:	e4842703          	lw	a4,-440(s0)
    80204528:	464c47b7          	lui	a5,0x464c4
    8020452c:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39d3ba81>
    80204530:	00f70963          	beq	a4,a5,80204542 <exec+0xb6>
  printf("[exec] reach bad\n");
  #endif
  if(pagetable)
    proc_freepagetable(pagetable, sz);
  if(kpagetable)
    kvmfree(kpagetable, 0);
    80204534:	4581                	li	a1,0
    80204536:	8556                	mv	a0,s5
    80204538:	ffffd097          	auipc	ra,0xffffd
    8020453c:	146080e7          	jalr	326(ra) # 8020167e <kvmfree>
  if(ep){
    80204540:	a4b5                	j	802047ac <exec+0x320>
  if((pagetable = proc_pagetable(p)) == NULL)
    80204542:	8526                	mv	a0,s1
    80204544:	ffffd097          	auipc	ra,0xffffd
    80204548:	5f8080e7          	jalr	1528(ra) # 80201b3c <proc_pagetable>
    8020454c:	e0a43423          	sd	a0,-504(s0)
    80204550:	d175                	beqz	a0,80204534 <exec+0xa8>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80204552:	e6842783          	lw	a5,-408(s0)
    80204556:	e8045703          	lhu	a4,-384(s0)
    8020455a:	cb3d                	beqz	a4,802045d0 <exec+0x144>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    8020455c:	4481                	li	s1,0
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8020455e:	e0043023          	sd	zero,-512(s0)
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80204562:	e1040713          	addi	a4,s0,-496
    80204566:	dee43023          	sd	a4,-544(s0)
    if(ph.vaddr % PGSIZE != 0)
    8020456a:	6b05                	lui	s6,0x1
    8020456c:	fffb0713          	addi	a4,s6,-1 # fff <_entry-0x801ff001>
    80204570:	dce43823          	sd	a4,-560(s0)
  for(i = 0; i < sz; i += PGSIZE){
    80204574:	6d85                	lui	s11,0x1
    80204576:	7bfd                	lui	s7,0xfffff
    80204578:	a4c1                	j	80204838 <exec+0x3ac>
      panic("loadseg: address should exist");
    8020457a:	00006517          	auipc	a0,0x6
    8020457e:	6fe50513          	addi	a0,a0,1790 # 8020ac78 <digits+0x8f8>
    80204582:	ffffc097          	auipc	ra,0xffffc
    80204586:	bc0080e7          	jalr	-1088(ra) # 80200142 <panic>
    if(eread(ep, 0, (uint64)pa, offset+i, n) != n)
    8020458a:	874e                	mv	a4,s3
    8020458c:	009d06bb          	addw	a3,s10,s1
    80204590:	4581                	li	a1,0
    80204592:	8552                	mv	a0,s4
    80204594:	00002097          	auipc	ra,0x2
    80204598:	1b4080e7          	jalr	436(ra) # 80206748 <eread>
    8020459c:	2501                	sext.w	a0,a0
    8020459e:	1ea99663          	bne	s3,a0,8020478a <exec+0x2fe>
  for(i = 0; i < sz; i += PGSIZE){
    802045a2:	009d84bb          	addw	s1,s11,s1
    802045a6:	012b893b          	addw	s2,s7,s2
    802045aa:	2784f763          	bgeu	s1,s8,80204818 <exec+0x38c>
    pa = walkaddr(pagetable, va + i);
    802045ae:	02049593          	slli	a1,s1,0x20
    802045b2:	9181                	srli	a1,a1,0x20
    802045b4:	95e6                	add	a1,a1,s9
    802045b6:	e0843503          	ld	a0,-504(s0)
    802045ba:	ffffc097          	auipc	ra,0xffffc
    802045be:	602080e7          	jalr	1538(ra) # 80200bbc <walkaddr>
    802045c2:	862a                	mv	a2,a0
    if(pa == NULL)
    802045c4:	d95d                	beqz	a0,8020457a <exec+0xee>
      n = PGSIZE;
    802045c6:	89da                	mv	s3,s6
    if(sz - i < PGSIZE)
    802045c8:	fd6971e3          	bgeu	s2,s6,8020458a <exec+0xfe>
      n = sz - i;
    802045cc:	89ca                	mv	s3,s2
    802045ce:	bf75                	j	8020458a <exec+0xfe>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    802045d0:	4481                	li	s1,0
  eunlock(ep);
    802045d2:	8552                	mv	a0,s4
    802045d4:	00003097          	auipc	ra,0x3
    802045d8:	a94080e7          	jalr	-1388(ra) # 80207068 <eunlock>
  eput(ep);
    802045dc:	8552                	mv	a0,s4
    802045de:	00003097          	auipc	ra,0x3
    802045e2:	ad8080e7          	jalr	-1320(ra) # 802070b6 <eput>
  p = myproc();
    802045e6:	ffffd097          	auipc	ra,0xffffd
    802045ea:	472080e7          	jalr	1138(ra) # 80201a58 <myproc>
    802045ee:	8b2a                	mv	s6,a0
  uint64 oldsz = p->sz;
    802045f0:	04853d83          	ld	s11,72(a0)
  sz = PGROUNDUP(sz);
    802045f4:	6785                	lui	a5,0x1
    802045f6:	17fd                	addi	a5,a5,-1
    802045f8:	94be                	add	s1,s1,a5
    802045fa:	77fd                	lui	a5,0xfffff
    802045fc:	8fe5                	and	a5,a5,s1
    802045fe:	def43823          	sd	a5,-528(s0)
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    80204602:	6689                	lui	a3,0x2
    80204604:	96be                	add	a3,a3,a5
    80204606:	863e                	mv	a2,a5
    80204608:	85d6                	mv	a1,s5
    8020460a:	e0843483          	ld	s1,-504(s0)
    8020460e:	8526                	mv	a0,s1
    80204610:	ffffd097          	auipc	ra,0xffffd
    80204614:	a08080e7          	jalr	-1528(ra) # 80201018 <uvmalloc>
    80204618:	8d2a                	mv	s10,a0
  ep = 0;
    8020461a:	4a01                	li	s4,0
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    8020461c:	16050763          	beqz	a0,8020478a <exec+0x2fe>
  uvmclear(pagetable, sz-2*PGSIZE);
    80204620:	75f9                	lui	a1,0xffffe
    80204622:	95aa                	add	a1,a1,a0
    80204624:	8526                	mv	a0,s1
    80204626:	ffffd097          	auipc	ra,0xffffd
    8020462a:	c98080e7          	jalr	-872(ra) # 802012be <uvmclear>
  stackbase = sp - PGSIZE;
    8020462e:	7c7d                	lui	s8,0xfffff
    80204630:	9c6a                	add	s8,s8,s10
  for(argc = 0; argv[argc]; argc++) {
    80204632:	de843783          	ld	a5,-536(s0)
    80204636:	6388                	ld	a0,0(a5)
    80204638:	c925                	beqz	a0,802046a8 <exec+0x21c>
    8020463a:	e8840993          	addi	s3,s0,-376
    8020463e:	f8840c93          	addi	s9,s0,-120
  sp = sz;
    80204642:	896a                	mv	s2,s10
  for(argc = 0; argv[argc]; argc++) {
    80204644:	4481                	li	s1,0
    sp -= strlen(argv[argc]) + 1;
    80204646:	ffffc097          	auipc	ra,0xffffc
    8020464a:	2a6080e7          	jalr	678(ra) # 802008ec <strlen>
    8020464e:	2505                	addiw	a0,a0,1
    80204650:	40a90933          	sub	s2,s2,a0
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    80204654:	ff097913          	andi	s2,s2,-16
    if(sp < stackbase)
    80204658:	1b896463          	bltu	s2,s8,80204800 <exec+0x374>
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    8020465c:	de843b83          	ld	s7,-536(s0)
    80204660:	000bba03          	ld	s4,0(s7) # fffffffffffff000 <kernel_end+0xffffffff7fdca000>
    80204664:	8552                	mv	a0,s4
    80204666:	ffffc097          	auipc	ra,0xffffc
    8020466a:	286080e7          	jalr	646(ra) # 802008ec <strlen>
    8020466e:	0015069b          	addiw	a3,a0,1
    80204672:	8652                	mv	a2,s4
    80204674:	85ca                	mv	a1,s2
    80204676:	e0843503          	ld	a0,-504(s0)
    8020467a:	ffffd097          	auipc	ra,0xffffd
    8020467e:	c76080e7          	jalr	-906(ra) # 802012f0 <copyout>
    80204682:	18054363          	bltz	a0,80204808 <exec+0x37c>
    ustack[argc] = sp;
    80204686:	0129b023          	sd	s2,0(s3)
  for(argc = 0; argv[argc]; argc++) {
    8020468a:	0485                	addi	s1,s1,1
    8020468c:	008b8793          	addi	a5,s7,8
    80204690:	def43423          	sd	a5,-536(s0)
    80204694:	008bb503          	ld	a0,8(s7)
    80204698:	c911                	beqz	a0,802046ac <exec+0x220>
    if(argc >= MAXARG)
    8020469a:	09a1                	addi	s3,s3,8
    8020469c:	fb3c95e3          	bne	s9,s3,80204646 <exec+0x1ba>
  sz = sz1;
    802046a0:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    802046a4:	4a01                	li	s4,0
    802046a6:	a0d5                	j	8020478a <exec+0x2fe>
  sp = sz;
    802046a8:	896a                	mv	s2,s10
  for(argc = 0; argv[argc]; argc++) {
    802046aa:	4481                	li	s1,0
  ustack[argc] = 0;
    802046ac:	00349793          	slli	a5,s1,0x3
    802046b0:	f9040713          	addi	a4,s0,-112
    802046b4:	97ba                	add	a5,a5,a4
    802046b6:	ee07bc23          	sd	zero,-264(a5) # ffffffffffffeef8 <kernel_end+0xffffffff7fdc9ef8>
  sp -= (argc+1) * sizeof(uint64);
    802046ba:	00148693          	addi	a3,s1,1
    802046be:	068e                	slli	a3,a3,0x3
    802046c0:	40d90933          	sub	s2,s2,a3
  sp -= sp % 16;
    802046c4:	ff097913          	andi	s2,s2,-16
  if(sp < stackbase)
    802046c8:	01897663          	bgeu	s2,s8,802046d4 <exec+0x248>
  sz = sz1;
    802046cc:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    802046d0:	4a01                	li	s4,0
    802046d2:	a865                	j	8020478a <exec+0x2fe>
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    802046d4:	e8840613          	addi	a2,s0,-376
    802046d8:	85ca                	mv	a1,s2
    802046da:	e0843503          	ld	a0,-504(s0)
    802046de:	ffffd097          	auipc	ra,0xffffd
    802046e2:	c12080e7          	jalr	-1006(ra) # 802012f0 <copyout>
    802046e6:	12054563          	bltz	a0,80204810 <exec+0x384>
  p->trapframe->a1 = sp;
    802046ea:	060b3783          	ld	a5,96(s6)
    802046ee:	0727bc23          	sd	s2,120(a5)
  for(last=s=path; *s; s++)
    802046f2:	dd843783          	ld	a5,-552(s0)
    802046f6:	0007c703          	lbu	a4,0(a5)
    802046fa:	cf11                	beqz	a4,80204716 <exec+0x28a>
    802046fc:	0785                	addi	a5,a5,1
    if(*s == '/')
    802046fe:	02f00693          	li	a3,47
    80204702:	a029                	j	8020470c <exec+0x280>
  for(last=s=path; *s; s++)
    80204704:	0785                	addi	a5,a5,1
    80204706:	fff7c703          	lbu	a4,-1(a5)
    8020470a:	c711                	beqz	a4,80204716 <exec+0x28a>
    if(*s == '/')
    8020470c:	fed71ce3          	bne	a4,a3,80204704 <exec+0x278>
      last = s+1;
    80204710:	dcf43c23          	sd	a5,-552(s0)
    80204714:	bfc5                	j	80204704 <exec+0x278>
  safestrcpy(p->name, last, sizeof(p->name));
    80204716:	4641                	li	a2,16
    80204718:	dd843583          	ld	a1,-552(s0)
    8020471c:	4e0b0513          	addi	a0,s6,1248
    80204720:	ffffc097          	auipc	ra,0xffffc
    80204724:	19a080e7          	jalr	410(ra) # 802008ba <safestrcpy>
  oldpagetable = p->pagetable;
    80204728:	050b3503          	ld	a0,80(s6)
  oldkpagetable = p->kpagetable;
    8020472c:	058b3983          	ld	s3,88(s6)
  p->pagetable = pagetable;
    80204730:	e0843783          	ld	a5,-504(s0)
    80204734:	04fb3823          	sd	a5,80(s6)
  p->kpagetable = kpagetable;
    80204738:	055b3c23          	sd	s5,88(s6)
  p->sz = sz;
    8020473c:	05ab3423          	sd	s10,72(s6)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80204740:	060b3783          	ld	a5,96(s6)
    80204744:	e6043703          	ld	a4,-416(s0)
    80204748:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    8020474a:	060b3783          	ld	a5,96(s6)
    8020474e:	0327b823          	sd	s2,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80204752:	85ee                	mv	a1,s11
    80204754:	ffffd097          	auipc	ra,0xffffd
    80204758:	484080e7          	jalr	1156(ra) # 80201bd8 <proc_freepagetable>
  w_satp(MAKE_SATP(p->kpagetable));
    8020475c:	058b3783          	ld	a5,88(s6)
    80204760:	83b1                	srli	a5,a5,0xc
    80204762:	577d                	li	a4,-1
    80204764:	177e                	slli	a4,a4,0x3f
    80204766:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    80204768:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    8020476c:	12000073          	sfence.vma
  kvmfree(oldkpagetable, 0);
    80204770:	4581                	li	a1,0
    80204772:	854e                	mv	a0,s3
    80204774:	ffffd097          	auipc	ra,0xffffd
    80204778:	f0a080e7          	jalr	-246(ra) # 8020167e <kvmfree>
  return argc; // this ends up in a0, the first argument to main(argc, argv)
    8020477c:	0004851b          	sext.w	a0,s1
    80204780:	a089                	j	802047c2 <exec+0x336>
    return -1;
    80204782:	557d                	li	a0,-1
    80204784:	a83d                	j	802047c2 <exec+0x336>
    80204786:	de943823          	sd	s1,-528(s0)
    proc_freepagetable(pagetable, sz);
    8020478a:	df043583          	ld	a1,-528(s0)
    8020478e:	e0843503          	ld	a0,-504(s0)
    80204792:	ffffd097          	auipc	ra,0xffffd
    80204796:	446080e7          	jalr	1094(ra) # 80201bd8 <proc_freepagetable>
    kvmfree(kpagetable, 0);
    8020479a:	4581                	li	a1,0
    8020479c:	8556                	mv	a0,s5
    8020479e:	ffffd097          	auipc	ra,0xffffd
    802047a2:	ee0080e7          	jalr	-288(ra) # 8020167e <kvmfree>
    eunlock(ep);
    eput(ep);
  }
  return -1;
    802047a6:	557d                	li	a0,-1
  if(ep){
    802047a8:	000a0d63          	beqz	s4,802047c2 <exec+0x336>
    eunlock(ep);
    802047ac:	8552                	mv	a0,s4
    802047ae:	00003097          	auipc	ra,0x3
    802047b2:	8ba080e7          	jalr	-1862(ra) # 80207068 <eunlock>
    eput(ep);
    802047b6:	8552                	mv	a0,s4
    802047b8:	00003097          	auipc	ra,0x3
    802047bc:	8fe080e7          	jalr	-1794(ra) # 802070b6 <eput>
  return -1;
    802047c0:	557d                	li	a0,-1
}
    802047c2:	22813083          	ld	ra,552(sp)
    802047c6:	22013403          	ld	s0,544(sp)
    802047ca:	21813483          	ld	s1,536(sp)
    802047ce:	21013903          	ld	s2,528(sp)
    802047d2:	20813983          	ld	s3,520(sp)
    802047d6:	20013a03          	ld	s4,512(sp)
    802047da:	7afe                	ld	s5,504(sp)
    802047dc:	7b5e                	ld	s6,496(sp)
    802047de:	7bbe                	ld	s7,488(sp)
    802047e0:	7c1e                	ld	s8,480(sp)
    802047e2:	6cfe                	ld	s9,472(sp)
    802047e4:	6d5e                	ld	s10,464(sp)
    802047e6:	6dbe                	ld	s11,456(sp)
    802047e8:	23010113          	addi	sp,sp,560
    802047ec:	8082                	ret
    802047ee:	de943823          	sd	s1,-528(s0)
    802047f2:	bf61                	j	8020478a <exec+0x2fe>
    802047f4:	de943823          	sd	s1,-528(s0)
    802047f8:	bf49                	j	8020478a <exec+0x2fe>
    802047fa:	de943823          	sd	s1,-528(s0)
    802047fe:	b771                	j	8020478a <exec+0x2fe>
  sz = sz1;
    80204800:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    80204804:	4a01                	li	s4,0
    80204806:	b751                	j	8020478a <exec+0x2fe>
  sz = sz1;
    80204808:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    8020480c:	4a01                	li	s4,0
    8020480e:	bfb5                	j	8020478a <exec+0x2fe>
  sz = sz1;
    80204810:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    80204814:	4a01                	li	s4,0
    80204816:	bf95                	j	8020478a <exec+0x2fe>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80204818:	df043483          	ld	s1,-528(s0)
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8020481c:	e0043783          	ld	a5,-512(s0)
    80204820:	0017869b          	addiw	a3,a5,1
    80204824:	e0d43023          	sd	a3,-512(s0)
    80204828:	df843783          	ld	a5,-520(s0)
    8020482c:	0387879b          	addiw	a5,a5,56
    80204830:	e8045703          	lhu	a4,-384(s0)
    80204834:	d8e6dfe3          	bge	a3,a4,802045d2 <exec+0x146>
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80204838:	2781                	sext.w	a5,a5
    8020483a:	def43c23          	sd	a5,-520(s0)
    8020483e:	03800713          	li	a4,56
    80204842:	86be                	mv	a3,a5
    80204844:	de043603          	ld	a2,-544(s0)
    80204848:	4581                	li	a1,0
    8020484a:	8552                	mv	a0,s4
    8020484c:	00002097          	auipc	ra,0x2
    80204850:	efc080e7          	jalr	-260(ra) # 80206748 <eread>
    80204854:	03800793          	li	a5,56
    80204858:	f2f517e3          	bne	a0,a5,80204786 <exec+0x2fa>
    if(ph.type != ELF_PROG_LOAD)
    8020485c:	e1042783          	lw	a5,-496(s0)
    80204860:	4705                	li	a4,1
    80204862:	fae79de3          	bne	a5,a4,8020481c <exec+0x390>
    if(ph.memsz < ph.filesz)
    80204866:	e3843683          	ld	a3,-456(s0)
    8020486a:	e3043783          	ld	a5,-464(s0)
    8020486e:	f8f6e0e3          	bltu	a3,a5,802047ee <exec+0x362>
    if(ph.vaddr + ph.memsz < ph.vaddr)
    80204872:	e2043783          	ld	a5,-480(s0)
    80204876:	96be                	add	a3,a3,a5
    80204878:	f6f6eee3          	bltu	a3,a5,802047f4 <exec+0x368>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    8020487c:	8626                	mv	a2,s1
    8020487e:	85d6                	mv	a1,s5
    80204880:	e0843503          	ld	a0,-504(s0)
    80204884:	ffffc097          	auipc	ra,0xffffc
    80204888:	794080e7          	jalr	1940(ra) # 80201018 <uvmalloc>
    8020488c:	dea43823          	sd	a0,-528(s0)
    80204890:	d52d                	beqz	a0,802047fa <exec+0x36e>
    if(ph.vaddr % PGSIZE != 0)
    80204892:	e2043c83          	ld	s9,-480(s0)
    80204896:	dd043783          	ld	a5,-560(s0)
    8020489a:	00fcf7b3          	and	a5,s9,a5
    8020489e:	ee0796e3          	bnez	a5,8020478a <exec+0x2fe>
    if(loadseg(pagetable, ph.vaddr, ep, ph.off, ph.filesz) < 0)
    802048a2:	e1842d03          	lw	s10,-488(s0)
    802048a6:	e3042c03          	lw	s8,-464(s0)
  for(i = 0; i < sz; i += PGSIZE){
    802048aa:	f60c07e3          	beqz	s8,80204818 <exec+0x38c>
    802048ae:	8962                	mv	s2,s8
    802048b0:	4481                	li	s1,0
    802048b2:	b9f5                	j	802045ae <exec+0x122>
    kvmfree(kpagetable, 0);
    802048b4:	4581                	li	a1,0
    802048b6:	8556                	mv	a0,s5
    802048b8:	ffffd097          	auipc	ra,0xffffd
    802048bc:	dc6080e7          	jalr	-570(ra) # 8020167e <kvmfree>
  return -1;
    802048c0:	557d                	li	a0,-1
    802048c2:	b701                	j	802047c2 <exec+0x336>

00000000802048c4 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    802048c4:	7179                	addi	sp,sp,-48
    802048c6:	f406                	sd	ra,40(sp)
    802048c8:	f022                	sd	s0,32(sp)
    802048ca:	ec26                	sd	s1,24(sp)
    802048cc:	e84a                	sd	s2,16(sp)
    802048ce:	1800                	addi	s0,sp,48
    802048d0:	892e                	mv	s2,a1
    802048d2:	84b2                	mv	s1,a2
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    802048d4:	fdc40593          	addi	a1,s0,-36
    802048d8:	ffffe097          	auipc	ra,0xffffe
    802048dc:	62e080e7          	jalr	1582(ra) # 80202f06 <argint>
    802048e0:	04054163          	bltz	a0,80204922 <argfd+0x5e>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == NULL)
    802048e4:	fdc42703          	lw	a4,-36(s0)
    802048e8:	07f00793          	li	a5,127
    802048ec:	02e7ed63          	bltu	a5,a4,80204926 <argfd+0x62>
    802048f0:	ffffd097          	auipc	ra,0xffffd
    802048f4:	168080e7          	jalr	360(ra) # 80201a58 <myproc>
    802048f8:	fdc42703          	lw	a4,-36(s0)
    802048fc:	01a70793          	addi	a5,a4,26
    80204900:	078e                	slli	a5,a5,0x3
    80204902:	953e                	add	a0,a0,a5
    80204904:	651c                	ld	a5,8(a0)
    80204906:	c395                	beqz	a5,8020492a <argfd+0x66>
    return -1;
  if(pfd)
    80204908:	00090463          	beqz	s2,80204910 <argfd+0x4c>
    *pfd = fd;
    8020490c:	00e92023          	sw	a4,0(s2)
  if(pf)
    *pf = f;
  return 0;
    80204910:	4501                	li	a0,0
  if(pf)
    80204912:	c091                	beqz	s1,80204916 <argfd+0x52>
    *pf = f;
    80204914:	e09c                	sd	a5,0(s1)
}
    80204916:	70a2                	ld	ra,40(sp)
    80204918:	7402                	ld	s0,32(sp)
    8020491a:	64e2                	ld	s1,24(sp)
    8020491c:	6942                	ld	s2,16(sp)
    8020491e:	6145                	addi	sp,sp,48
    80204920:	8082                	ret
    return -1;
    80204922:	557d                	li	a0,-1
    80204924:	bfcd                	j	80204916 <argfd+0x52>
    return -1;
    80204926:	557d                	li	a0,-1
    80204928:	b7fd                	j	80204916 <argfd+0x52>
    8020492a:	557d                	li	a0,-1
    8020492c:	b7ed                	j	80204916 <argfd+0x52>

000000008020492e <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    8020492e:	1101                	addi	sp,sp,-32
    80204930:	ec06                	sd	ra,24(sp)
    80204932:	e822                	sd	s0,16(sp)
    80204934:	e426                	sd	s1,8(sp)
    80204936:	1000                	addi	s0,sp,32
    80204938:	84aa                	mv	s1,a0
  int fd;
  struct proc *p = myproc();
    8020493a:	ffffd097          	auipc	ra,0xffffd
    8020493e:	11e080e7          	jalr	286(ra) # 80201a58 <myproc>
    80204942:	862a                	mv	a2,a0

  for(fd = 0; fd < NOFILE; fd++){
    80204944:	0d850793          	addi	a5,a0,216
    80204948:	4501                	li	a0,0
    8020494a:	08000693          	li	a3,128
    if(p->ofile[fd] == 0){
    8020494e:	6398                	ld	a4,0(a5)
    80204950:	c719                	beqz	a4,8020495e <fdalloc+0x30>
  for(fd = 0; fd < NOFILE; fd++){
    80204952:	2505                	addiw	a0,a0,1
    80204954:	07a1                	addi	a5,a5,8
    80204956:	fed51ce3          	bne	a0,a3,8020494e <fdalloc+0x20>
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
    8020495a:	557d                	li	a0,-1
    8020495c:	a031                	j	80204968 <fdalloc+0x3a>
      p->ofile[fd] = f;
    8020495e:	01a50793          	addi	a5,a0,26
    80204962:	078e                	slli	a5,a5,0x3
    80204964:	963e                	add	a2,a2,a5
    80204966:	e604                	sd	s1,8(a2)
}
    80204968:	60e2                	ld	ra,24(sp)
    8020496a:	6442                	ld	s0,16(sp)
    8020496c:	64a2                	ld	s1,8(sp)
    8020496e:	6105                	addi	sp,sp,32
    80204970:	8082                	ret

0000000080204972 <create>:
  return filestat(f, st);
}

static struct dirent*
create(char *path, short type, int mode)
{
    80204972:	7169                	addi	sp,sp,-304
    80204974:	f606                	sd	ra,296(sp)
    80204976:	f222                	sd	s0,288(sp)
    80204978:	ee26                	sd	s1,280(sp)
    8020497a:	ea4a                	sd	s2,272(sp)
    8020497c:	e64e                	sd	s3,264(sp)
    8020497e:	1a00                	addi	s0,sp,304
    80204980:	89ae                	mv	s3,a1
  struct dirent *ep, *dp;
  char name[FAT32_MAX_FILENAME + 1];

  if((dp = enameparent(path, name)) == NULL)
    80204982:	ed040593          	addi	a1,s0,-304
    80204986:	00003097          	auipc	ra,0x3
    8020498a:	e74080e7          	jalr	-396(ra) # 802077fa <enameparent>
    8020498e:	84aa                	mv	s1,a0
    80204990:	cd3d                	beqz	a0,80204a0e <create+0x9c>
    return NULL;

  if (type == T_DIR) {
    80204992:	0009879b          	sext.w	a5,s3
    80204996:	4705                	li	a4,1
    80204998:	06e78d63          	beq	a5,a4,80204a12 <create+0xa0>
    mode = ATTR_READ_ONLY;
  } else {
    mode = 0;  
  }

  elock(dp);
    8020499c:	00002097          	auipc	ra,0x2
    802049a0:	696080e7          	jalr	1686(ra) # 80207032 <elock>
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    802049a4:	4601                	li	a2,0
    802049a6:	ed040593          	addi	a1,s0,-304
    802049aa:	8526                	mv	a0,s1
    802049ac:	00003097          	auipc	ra,0x3
    802049b0:	b78080e7          	jalr	-1160(ra) # 80207524 <ealloc>
    802049b4:	892a                	mv	s2,a0
    802049b6:	c121                	beqz	a0,802049f6 <create+0x84>
    eunlock(dp);
    eput(dp);
    return NULL;
  }
  
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    802049b8:	2981                	sext.w	s3,s3
    802049ba:	4789                	li	a5,2
    802049bc:	00f99663          	bne	s3,a5,802049c8 <create+0x56>
      (type == T_FILE && (ep->attribute & ATTR_DIRECTORY))) {
    802049c0:	10094783          	lbu	a5,256(s2)
    802049c4:	8bc1                	andi	a5,a5,16
    802049c6:	eba5                	bnez	a5,80204a36 <create+0xc4>
    eput(ep);
    eput(dp);
    return NULL;
  }

  eunlock(dp);
    802049c8:	8526                	mv	a0,s1
    802049ca:	00002097          	auipc	ra,0x2
    802049ce:	69e080e7          	jalr	1694(ra) # 80207068 <eunlock>
  eput(dp);
    802049d2:	8526                	mv	a0,s1
    802049d4:	00002097          	auipc	ra,0x2
    802049d8:	6e2080e7          	jalr	1762(ra) # 802070b6 <eput>

  elock(ep);
    802049dc:	854a                	mv	a0,s2
    802049de:	00002097          	auipc	ra,0x2
    802049e2:	654080e7          	jalr	1620(ra) # 80207032 <elock>
  return ep;
}
    802049e6:	854a                	mv	a0,s2
    802049e8:	70b2                	ld	ra,296(sp)
    802049ea:	7412                	ld	s0,288(sp)
    802049ec:	64f2                	ld	s1,280(sp)
    802049ee:	6952                	ld	s2,272(sp)
    802049f0:	69b2                	ld	s3,264(sp)
    802049f2:	6155                	addi	sp,sp,304
    802049f4:	8082                	ret
    eunlock(dp);
    802049f6:	8526                	mv	a0,s1
    802049f8:	00002097          	auipc	ra,0x2
    802049fc:	670080e7          	jalr	1648(ra) # 80207068 <eunlock>
    eput(dp);
    80204a00:	8526                	mv	a0,s1
    80204a02:	00002097          	auipc	ra,0x2
    80204a06:	6b4080e7          	jalr	1716(ra) # 802070b6 <eput>
    return NULL;
    80204a0a:	4901                	li	s2,0
    80204a0c:	bfe9                	j	802049e6 <create+0x74>
    return NULL;
    80204a0e:	892a                	mv	s2,a0
    80204a10:	bfd9                	j	802049e6 <create+0x74>
  elock(dp);
    80204a12:	00002097          	auipc	ra,0x2
    80204a16:	620080e7          	jalr	1568(ra) # 80207032 <elock>
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    80204a1a:	4641                	li	a2,16
    80204a1c:	ed040593          	addi	a1,s0,-304
    80204a20:	8526                	mv	a0,s1
    80204a22:	00003097          	auipc	ra,0x3
    80204a26:	b02080e7          	jalr	-1278(ra) # 80207524 <ealloc>
    80204a2a:	892a                	mv	s2,a0
    80204a2c:	d569                	beqz	a0,802049f6 <create+0x84>
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204a2e:	10094783          	lbu	a5,256(s2)
    80204a32:	8bc1                	andi	a5,a5,16
    80204a34:	fbd1                	bnez	a5,802049c8 <create+0x56>
    eunlock(dp);
    80204a36:	8526                	mv	a0,s1
    80204a38:	00002097          	auipc	ra,0x2
    80204a3c:	630080e7          	jalr	1584(ra) # 80207068 <eunlock>
    eput(ep);
    80204a40:	854a                	mv	a0,s2
    80204a42:	00002097          	auipc	ra,0x2
    80204a46:	674080e7          	jalr	1652(ra) # 802070b6 <eput>
    eput(dp);
    80204a4a:	8526                	mv	a0,s1
    80204a4c:	00002097          	auipc	ra,0x2
    80204a50:	66a080e7          	jalr	1642(ra) # 802070b6 <eput>
    return NULL;
    80204a54:	4901                	li	s2,0
    80204a56:	bf41                	j	802049e6 <create+0x74>

0000000080204a58 <sys_dup>:
{
    80204a58:	7179                	addi	sp,sp,-48
    80204a5a:	f406                	sd	ra,40(sp)
    80204a5c:	f022                	sd	s0,32(sp)
    80204a5e:	ec26                	sd	s1,24(sp)
    80204a60:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0)
    80204a62:	fd840613          	addi	a2,s0,-40
    80204a66:	4581                	li	a1,0
    80204a68:	4501                	li	a0,0
    80204a6a:	00000097          	auipc	ra,0x0
    80204a6e:	e5a080e7          	jalr	-422(ra) # 802048c4 <argfd>
    return -1;
    80204a72:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0)
    80204a74:	02054363          	bltz	a0,80204a9a <sys_dup+0x42>
  if((fd=fdalloc(f)) < 0)
    80204a78:	fd843503          	ld	a0,-40(s0)
    80204a7c:	00000097          	auipc	ra,0x0
    80204a80:	eb2080e7          	jalr	-334(ra) # 8020492e <fdalloc>
    80204a84:	84aa                	mv	s1,a0
    return -1;
    80204a86:	57fd                	li	a5,-1
  if((fd=fdalloc(f)) < 0)
    80204a88:	00054963          	bltz	a0,80204a9a <sys_dup+0x42>
  filedup(f);
    80204a8c:	fd843503          	ld	a0,-40(s0)
    80204a90:	fffff097          	auipc	ra,0xfffff
    80204a94:	2da080e7          	jalr	730(ra) # 80203d6a <filedup>
  return fd;
    80204a98:	87a6                	mv	a5,s1
}
    80204a9a:	853e                	mv	a0,a5
    80204a9c:	70a2                	ld	ra,40(sp)
    80204a9e:	7402                	ld	s0,32(sp)
    80204aa0:	64e2                	ld	s1,24(sp)
    80204aa2:	6145                	addi	sp,sp,48
    80204aa4:	8082                	ret

0000000080204aa6 <sys_read>:
{
    80204aa6:	7179                	addi	sp,sp,-48
    80204aa8:	f406                	sd	ra,40(sp)
    80204aaa:	f022                	sd	s0,32(sp)
    80204aac:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204aae:	fe840613          	addi	a2,s0,-24
    80204ab2:	4581                	li	a1,0
    80204ab4:	4501                	li	a0,0
    80204ab6:	00000097          	auipc	ra,0x0
    80204aba:	e0e080e7          	jalr	-498(ra) # 802048c4 <argfd>
    return -1;
    80204abe:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204ac0:	04054163          	bltz	a0,80204b02 <sys_read+0x5c>
    80204ac4:	fe440593          	addi	a1,s0,-28
    80204ac8:	4509                	li	a0,2
    80204aca:	ffffe097          	auipc	ra,0xffffe
    80204ace:	43c080e7          	jalr	1084(ra) # 80202f06 <argint>
    return -1;
    80204ad2:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204ad4:	02054763          	bltz	a0,80204b02 <sys_read+0x5c>
    80204ad8:	fd840593          	addi	a1,s0,-40
    80204adc:	4505                	li	a0,1
    80204ade:	ffffe097          	auipc	ra,0xffffe
    80204ae2:	48a080e7          	jalr	1162(ra) # 80202f68 <argaddr>
    return -1;
    80204ae6:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204ae8:	00054d63          	bltz	a0,80204b02 <sys_read+0x5c>
  return fileread(f, p, n);
    80204aec:	fe442603          	lw	a2,-28(s0)
    80204af0:	fd843583          	ld	a1,-40(s0)
    80204af4:	fe843503          	ld	a0,-24(s0)
    80204af8:	fffff097          	auipc	ra,0xfffff
    80204afc:	3de080e7          	jalr	990(ra) # 80203ed6 <fileread>
    80204b00:	87aa                	mv	a5,a0
}
    80204b02:	853e                	mv	a0,a5
    80204b04:	70a2                	ld	ra,40(sp)
    80204b06:	7402                	ld	s0,32(sp)
    80204b08:	6145                	addi	sp,sp,48
    80204b0a:	8082                	ret

0000000080204b0c <sys_write>:
{
    80204b0c:	7179                	addi	sp,sp,-48
    80204b0e:	f406                	sd	ra,40(sp)
    80204b10:	f022                	sd	s0,32(sp)
    80204b12:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204b14:	fe840613          	addi	a2,s0,-24
    80204b18:	4581                	li	a1,0
    80204b1a:	4501                	li	a0,0
    80204b1c:	00000097          	auipc	ra,0x0
    80204b20:	da8080e7          	jalr	-600(ra) # 802048c4 <argfd>
    return -1;
    80204b24:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204b26:	04054163          	bltz	a0,80204b68 <sys_write+0x5c>
    80204b2a:	fe440593          	addi	a1,s0,-28
    80204b2e:	4509                	li	a0,2
    80204b30:	ffffe097          	auipc	ra,0xffffe
    80204b34:	3d6080e7          	jalr	982(ra) # 80202f06 <argint>
    return -1;
    80204b38:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204b3a:	02054763          	bltz	a0,80204b68 <sys_write+0x5c>
    80204b3e:	fd840593          	addi	a1,s0,-40
    80204b42:	4505                	li	a0,1
    80204b44:	ffffe097          	auipc	ra,0xffffe
    80204b48:	424080e7          	jalr	1060(ra) # 80202f68 <argaddr>
    return -1;
    80204b4c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204b4e:	00054d63          	bltz	a0,80204b68 <sys_write+0x5c>
  return filewrite(f, p, n);
    80204b52:	fe442603          	lw	a2,-28(s0)
    80204b56:	fd843583          	ld	a1,-40(s0)
    80204b5a:	fe843503          	ld	a0,-24(s0)
    80204b5e:	fffff097          	auipc	ra,0xfffff
    80204b62:	43a080e7          	jalr	1082(ra) # 80203f98 <filewrite>
    80204b66:	87aa                	mv	a5,a0
}
    80204b68:	853e                	mv	a0,a5
    80204b6a:	70a2                	ld	ra,40(sp)
    80204b6c:	7402                	ld	s0,32(sp)
    80204b6e:	6145                	addi	sp,sp,48
    80204b70:	8082                	ret

0000000080204b72 <sys_close>:
{
    80204b72:	1101                	addi	sp,sp,-32
    80204b74:	ec06                	sd	ra,24(sp)
    80204b76:	e822                	sd	s0,16(sp)
    80204b78:	1000                	addi	s0,sp,32
  if(argfd(0, &fd, &f) < 0)
    80204b7a:	fe040613          	addi	a2,s0,-32
    80204b7e:	fec40593          	addi	a1,s0,-20
    80204b82:	4501                	li	a0,0
    80204b84:	00000097          	auipc	ra,0x0
    80204b88:	d40080e7          	jalr	-704(ra) # 802048c4 <argfd>
    return -1;
    80204b8c:	57fd                	li	a5,-1
  if(argfd(0, &fd, &f) < 0)
    80204b8e:	02054463          	bltz	a0,80204bb6 <sys_close+0x44>
  myproc()->ofile[fd] = 0;
    80204b92:	ffffd097          	auipc	ra,0xffffd
    80204b96:	ec6080e7          	jalr	-314(ra) # 80201a58 <myproc>
    80204b9a:	fec42783          	lw	a5,-20(s0)
    80204b9e:	07e9                	addi	a5,a5,26
    80204ba0:	078e                	slli	a5,a5,0x3
    80204ba2:	97aa                	add	a5,a5,a0
    80204ba4:	0007b423          	sd	zero,8(a5)
  fileclose(f);
    80204ba8:	fe043503          	ld	a0,-32(s0)
    80204bac:	fffff097          	auipc	ra,0xfffff
    80204bb0:	210080e7          	jalr	528(ra) # 80203dbc <fileclose>
  return 0;
    80204bb4:	4781                	li	a5,0
}
    80204bb6:	853e                	mv	a0,a5
    80204bb8:	60e2                	ld	ra,24(sp)
    80204bba:	6442                	ld	s0,16(sp)
    80204bbc:	6105                	addi	sp,sp,32
    80204bbe:	8082                	ret

0000000080204bc0 <sys_fstat>:
{
    80204bc0:	1101                	addi	sp,sp,-32
    80204bc2:	ec06                	sd	ra,24(sp)
    80204bc4:	e822                	sd	s0,16(sp)
    80204bc6:	1000                	addi	s0,sp,32
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204bc8:	fe840613          	addi	a2,s0,-24
    80204bcc:	4581                	li	a1,0
    80204bce:	4501                	li	a0,0
    80204bd0:	00000097          	auipc	ra,0x0
    80204bd4:	cf4080e7          	jalr	-780(ra) # 802048c4 <argfd>
    return -1;
    80204bd8:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204bda:	02054563          	bltz	a0,80204c04 <sys_fstat+0x44>
    80204bde:	fe040593          	addi	a1,s0,-32
    80204be2:	4505                	li	a0,1
    80204be4:	ffffe097          	auipc	ra,0xffffe
    80204be8:	384080e7          	jalr	900(ra) # 80202f68 <argaddr>
    return -1;
    80204bec:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204bee:	00054b63          	bltz	a0,80204c04 <sys_fstat+0x44>
  return filestat(f, st);
    80204bf2:	fe043583          	ld	a1,-32(s0)
    80204bf6:	fe843503          	ld	a0,-24(s0)
    80204bfa:	fffff097          	auipc	ra,0xfffff
    80204bfe:	278080e7          	jalr	632(ra) # 80203e72 <filestat>
    80204c02:	87aa                	mv	a5,a0
}
    80204c04:	853e                	mv	a0,a5
    80204c06:	60e2                	ld	ra,24(sp)
    80204c08:	6442                	ld	s0,16(sp)
    80204c0a:	6105                	addi	sp,sp,32
    80204c0c:	8082                	ret

0000000080204c0e <sys_open>:

uint64
sys_open(void)
{
    80204c0e:	7129                	addi	sp,sp,-320
    80204c10:	fe06                	sd	ra,312(sp)
    80204c12:	fa22                	sd	s0,304(sp)
    80204c14:	f626                	sd	s1,296(sp)
    80204c16:	f24a                	sd	s2,288(sp)
    80204c18:	ee4e                	sd	s3,280(sp)
    80204c1a:	0280                	addi	s0,sp,320
  char path[FAT32_MAX_PATH];
  int fd, omode;
  struct file *f;
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204c1c:	10400613          	li	a2,260
    80204c20:	ec840593          	addi	a1,s0,-312
    80204c24:	4501                	li	a0,0
    80204c26:	ffffe097          	auipc	ra,0xffffe
    80204c2a:	364080e7          	jalr	868(ra) # 80202f8a <argstr>
    80204c2e:	87aa                	mv	a5,a0
    return -1;
    80204c30:	557d                	li	a0,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204c32:	0807ce63          	bltz	a5,80204cce <sys_open+0xc0>
    80204c36:	ec440593          	addi	a1,s0,-316
    80204c3a:	4505                	li	a0,1
    80204c3c:	ffffe097          	auipc	ra,0xffffe
    80204c40:	2ca080e7          	jalr	714(ra) # 80202f06 <argint>
    80204c44:	0e054163          	bltz	a0,80204d26 <sys_open+0x118>
  if(omode & O_CREATE){
    80204c48:	ec442603          	lw	a2,-316(s0)
    80204c4c:	24067793          	andi	a5,a2,576
    80204c50:	c7d1                	beqz	a5,80204cdc <sys_open+0xce>
    ep = create(path, T_FILE, omode);
    80204c52:	4589                	li	a1,2
    80204c54:	ec840513          	addi	a0,s0,-312
    80204c58:	00000097          	auipc	ra,0x0
    80204c5c:	d1a080e7          	jalr	-742(ra) # 80204972 <create>
    80204c60:	892a                	mv	s2,a0
    if(ep == NULL){
    80204c62:	c561                	beqz	a0,80204d2a <sys_open+0x11c>
      eput(ep);
      return -1;
    }
  }

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204c64:	fffff097          	auipc	ra,0xfffff
    80204c68:	09c080e7          	jalr	156(ra) # 80203d00 <filealloc>
    80204c6c:	89aa                	mv	s3,a0
    80204c6e:	c579                	beqz	a0,80204d3c <sys_open+0x12e>
    80204c70:	00000097          	auipc	ra,0x0
    80204c74:	cbe080e7          	jalr	-834(ra) # 8020492e <fdalloc>
    80204c78:	84aa                	mv	s1,a0
    80204c7a:	0a054c63          	bltz	a0,80204d32 <sys_open+0x124>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    80204c7e:	10094783          	lbu	a5,256(s2)
    80204c82:	8bc1                	andi	a5,a5,16
    80204c84:	e791                	bnez	a5,80204c90 <sys_open+0x82>
    80204c86:	ec442783          	lw	a5,-316(s0)
    80204c8a:	4007f793          	andi	a5,a5,1024
    80204c8e:	e7d1                	bnez	a5,80204d1a <sys_open+0x10c>
    etrunc(ep);
  }

  f->type = FD_ENTRY;
    80204c90:	4789                	li	a5,2
    80204c92:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    80204c96:	ec442783          	lw	a5,-316(s0)
    80204c9a:	0047f693          	andi	a3,a5,4
    80204c9e:	4701                	li	a4,0
    80204ca0:	c299                	beqz	a3,80204ca6 <sys_open+0x98>
    80204ca2:	10892703          	lw	a4,264(s2)
    80204ca6:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    80204caa:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    80204cae:	0017c713          	xori	a4,a5,1
    80204cb2:	8b05                	andi	a4,a4,1
    80204cb4:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204cb8:	8b8d                	andi	a5,a5,3
    80204cba:	00f037b3          	snez	a5,a5
    80204cbe:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    80204cc2:	854a                	mv	a0,s2
    80204cc4:	00002097          	auipc	ra,0x2
    80204cc8:	3a4080e7          	jalr	932(ra) # 80207068 <eunlock>

  return fd;
    80204ccc:	8526                	mv	a0,s1
}
    80204cce:	70f2                	ld	ra,312(sp)
    80204cd0:	7452                	ld	s0,304(sp)
    80204cd2:	74b2                	ld	s1,296(sp)
    80204cd4:	7912                	ld	s2,288(sp)
    80204cd6:	69f2                	ld	s3,280(sp)
    80204cd8:	6131                	addi	sp,sp,320
    80204cda:	8082                	ret
    if((ep = ename(path)) == NULL){
    80204cdc:	ec840513          	addi	a0,s0,-312
    80204ce0:	00003097          	auipc	ra,0x3
    80204ce4:	afc080e7          	jalr	-1284(ra) # 802077dc <ename>
    80204ce8:	892a                	mv	s2,a0
    80204cea:	c131                	beqz	a0,80204d2e <sys_open+0x120>
    elock(ep);
    80204cec:	00002097          	auipc	ra,0x2
    80204cf0:	346080e7          	jalr	838(ra) # 80207032 <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    80204cf4:	10094783          	lbu	a5,256(s2)
    80204cf8:	8bc1                	andi	a5,a5,16
    80204cfa:	d7ad                	beqz	a5,80204c64 <sys_open+0x56>
    80204cfc:	ec442783          	lw	a5,-316(s0)
    80204d00:	d3b5                	beqz	a5,80204c64 <sys_open+0x56>
      eunlock(ep);
    80204d02:	854a                	mv	a0,s2
    80204d04:	00002097          	auipc	ra,0x2
    80204d08:	364080e7          	jalr	868(ra) # 80207068 <eunlock>
      eput(ep);
    80204d0c:	854a                	mv	a0,s2
    80204d0e:	00002097          	auipc	ra,0x2
    80204d12:	3a8080e7          	jalr	936(ra) # 802070b6 <eput>
      return -1;
    80204d16:	557d                	li	a0,-1
    80204d18:	bf5d                	j	80204cce <sys_open+0xc0>
    etrunc(ep);
    80204d1a:	854a                	mv	a0,s2
    80204d1c:	00002097          	auipc	ra,0x2
    80204d20:	2ac080e7          	jalr	684(ra) # 80206fc8 <etrunc>
    80204d24:	b7b5                	j	80204c90 <sys_open+0x82>
    return -1;
    80204d26:	557d                	li	a0,-1
    80204d28:	b75d                	j	80204cce <sys_open+0xc0>
      return -1;
    80204d2a:	557d                	li	a0,-1
    80204d2c:	b74d                	j	80204cce <sys_open+0xc0>
      return -1;
    80204d2e:	557d                	li	a0,-1
    80204d30:	bf79                	j	80204cce <sys_open+0xc0>
      fileclose(f);
    80204d32:	854e                	mv	a0,s3
    80204d34:	fffff097          	auipc	ra,0xfffff
    80204d38:	088080e7          	jalr	136(ra) # 80203dbc <fileclose>
    eunlock(ep);
    80204d3c:	854a                	mv	a0,s2
    80204d3e:	00002097          	auipc	ra,0x2
    80204d42:	32a080e7          	jalr	810(ra) # 80207068 <eunlock>
    eput(ep);
    80204d46:	854a                	mv	a0,s2
    80204d48:	00002097          	auipc	ra,0x2
    80204d4c:	36e080e7          	jalr	878(ra) # 802070b6 <eput>
    return -1;
    80204d50:	557d                	li	a0,-1
    80204d52:	bfb5                	j	80204cce <sys_open+0xc0>

0000000080204d54 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80204d54:	7169                	addi	sp,sp,-304
    80204d56:	f606                	sd	ra,296(sp)
    80204d58:	f222                	sd	s0,288(sp)
    80204d5a:	ee26                	sd	s1,280(sp)
    80204d5c:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;

  if(argstr(1, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204d5e:	10400613          	li	a2,260
    80204d62:	ed840593          	addi	a1,s0,-296
    80204d66:	4505                	li	a0,1
    80204d68:	ffffe097          	auipc	ra,0xffffe
    80204d6c:	222080e7          	jalr	546(ra) # 80202f8a <argstr>
    return -1;
    80204d70:	57fd                	li	a5,-1
  if(argstr(1, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204d72:	02054663          	bltz	a0,80204d9e <sys_mkdir+0x4a>
    80204d76:	4601                	li	a2,0
    80204d78:	4585                	li	a1,1
    80204d7a:	ed840513          	addi	a0,s0,-296
    80204d7e:	00000097          	auipc	ra,0x0
    80204d82:	bf4080e7          	jalr	-1036(ra) # 80204972 <create>
    80204d86:	84aa                	mv	s1,a0
    80204d88:	c10d                	beqz	a0,80204daa <sys_mkdir+0x56>
  }
  eunlock(ep);
    80204d8a:	00002097          	auipc	ra,0x2
    80204d8e:	2de080e7          	jalr	734(ra) # 80207068 <eunlock>
  eput(ep);
    80204d92:	8526                	mv	a0,s1
    80204d94:	00002097          	auipc	ra,0x2
    80204d98:	322080e7          	jalr	802(ra) # 802070b6 <eput>
  return 0;
    80204d9c:	4781                	li	a5,0
}
    80204d9e:	853e                	mv	a0,a5
    80204da0:	70b2                	ld	ra,296(sp)
    80204da2:	7412                	ld	s0,288(sp)
    80204da4:	64f2                	ld	s1,280(sp)
    80204da6:	6155                	addi	sp,sp,304
    80204da8:	8082                	ret
    return -1;
    80204daa:	57fd                	li	a5,-1
    80204dac:	bfcd                	j	80204d9e <sys_mkdir+0x4a>

0000000080204dae <sys_chdir>:

uint64
sys_chdir(void)
{
    80204dae:	7169                	addi	sp,sp,-304
    80204db0:	f606                	sd	ra,296(sp)
    80204db2:	f222                	sd	s0,288(sp)
    80204db4:	ee26                	sd	s1,280(sp)
    80204db6:	ea4a                	sd	s2,272(sp)
    80204db8:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  struct proc *p = myproc();
    80204dba:	ffffd097          	auipc	ra,0xffffd
    80204dbe:	c9e080e7          	jalr	-866(ra) # 80201a58 <myproc>
    80204dc2:	892a                	mv	s2,a0
  
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204dc4:	10400613          	li	a2,260
    80204dc8:	ed840593          	addi	a1,s0,-296
    80204dcc:	4501                	li	a0,0
    80204dce:	ffffe097          	auipc	ra,0xffffe
    80204dd2:	1bc080e7          	jalr	444(ra) # 80202f8a <argstr>
    return -1;
    80204dd6:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204dd8:	04054063          	bltz	a0,80204e18 <sys_chdir+0x6a>
    80204ddc:	ed840513          	addi	a0,s0,-296
    80204de0:	00003097          	auipc	ra,0x3
    80204de4:	9fc080e7          	jalr	-1540(ra) # 802077dc <ename>
    80204de8:	84aa                	mv	s1,a0
    80204dea:	c931                	beqz	a0,80204e3e <sys_chdir+0x90>
  }
  elock(ep);
    80204dec:	00002097          	auipc	ra,0x2
    80204df0:	246080e7          	jalr	582(ra) # 80207032 <elock>
  if(!(ep->attribute & ATTR_DIRECTORY)){
    80204df4:	1004c783          	lbu	a5,256(s1)
    80204df8:	8bc1                	andi	a5,a5,16
    80204dfa:	c795                	beqz	a5,80204e26 <sys_chdir+0x78>
    eunlock(ep);
    eput(ep);
    return -1;
  }
  eunlock(ep);
    80204dfc:	8526                	mv	a0,s1
    80204dfe:	00002097          	auipc	ra,0x2
    80204e02:	26a080e7          	jalr	618(ra) # 80207068 <eunlock>
  eput(p->cwd);
    80204e06:	4d893503          	ld	a0,1240(s2)
    80204e0a:	00002097          	auipc	ra,0x2
    80204e0e:	2ac080e7          	jalr	684(ra) # 802070b6 <eput>
  p->cwd = ep;
    80204e12:	4c993c23          	sd	s1,1240(s2)
  return 0;
    80204e16:	4781                	li	a5,0
}
    80204e18:	853e                	mv	a0,a5
    80204e1a:	70b2                	ld	ra,296(sp)
    80204e1c:	7412                	ld	s0,288(sp)
    80204e1e:	64f2                	ld	s1,280(sp)
    80204e20:	6952                	ld	s2,272(sp)
    80204e22:	6155                	addi	sp,sp,304
    80204e24:	8082                	ret
    eunlock(ep);
    80204e26:	8526                	mv	a0,s1
    80204e28:	00002097          	auipc	ra,0x2
    80204e2c:	240080e7          	jalr	576(ra) # 80207068 <eunlock>
    eput(ep);
    80204e30:	8526                	mv	a0,s1
    80204e32:	00002097          	auipc	ra,0x2
    80204e36:	284080e7          	jalr	644(ra) # 802070b6 <eput>
    return -1;
    80204e3a:	57fd                	li	a5,-1
    80204e3c:	bff1                	j	80204e18 <sys_chdir+0x6a>
    return -1;
    80204e3e:	57fd                	li	a5,-1
    80204e40:	bfe1                	j	80204e18 <sys_chdir+0x6a>

0000000080204e42 <sys_pipe>:

uint64
sys_pipe(void)
{
    80204e42:	7139                	addi	sp,sp,-64
    80204e44:	fc06                	sd	ra,56(sp)
    80204e46:	f822                	sd	s0,48(sp)
    80204e48:	f426                	sd	s1,40(sp)
    80204e4a:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80204e4c:	ffffd097          	auipc	ra,0xffffd
    80204e50:	c0c080e7          	jalr	-1012(ra) # 80201a58 <myproc>
    80204e54:	84aa                	mv	s1,a0

  if(argaddr(0, &fdarray) < 0)
    80204e56:	fd840593          	addi	a1,s0,-40
    80204e5a:	4501                	li	a0,0
    80204e5c:	ffffe097          	auipc	ra,0xffffe
    80204e60:	10c080e7          	jalr	268(ra) # 80202f68 <argaddr>
    return -1;
    80204e64:	57fd                	li	a5,-1
  if(argaddr(0, &fdarray) < 0)
    80204e66:	0c054e63          	bltz	a0,80204f42 <sys_pipe+0x100>
  if(pipealloc(&rf, &wf) < 0)
    80204e6a:	fc840593          	addi	a1,s0,-56
    80204e6e:	fd040513          	addi	a0,s0,-48
    80204e72:	fffff097          	auipc	ra,0xfffff
    80204e76:	2be080e7          	jalr	702(ra) # 80204130 <pipealloc>
    return -1;
    80204e7a:	57fd                	li	a5,-1
  if(pipealloc(&rf, &wf) < 0)
    80204e7c:	0c054363          	bltz	a0,80204f42 <sys_pipe+0x100>
  fd0 = -1;
    80204e80:	fcf42223          	sw	a5,-60(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80204e84:	fd043503          	ld	a0,-48(s0)
    80204e88:	00000097          	auipc	ra,0x0
    80204e8c:	aa6080e7          	jalr	-1370(ra) # 8020492e <fdalloc>
    80204e90:	fca42223          	sw	a0,-60(s0)
    80204e94:	08054a63          	bltz	a0,80204f28 <sys_pipe+0xe6>
    80204e98:	fc843503          	ld	a0,-56(s0)
    80204e9c:	00000097          	auipc	ra,0x0
    80204ea0:	a92080e7          	jalr	-1390(ra) # 8020492e <fdalloc>
    80204ea4:	fca42023          	sw	a0,-64(s0)
    80204ea8:	06054663          	bltz	a0,80204f14 <sys_pipe+0xd2>
    fileclose(wf);
    return -1;
  }
  // if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
  //    copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204eac:	4611                	li	a2,4
    80204eae:	fc440593          	addi	a1,s0,-60
    80204eb2:	fd843503          	ld	a0,-40(s0)
    80204eb6:	ffffc097          	auipc	ra,0xffffc
    80204eba:	4c6080e7          	jalr	1222(ra) # 8020137c <copyout2>
    80204ebe:	00054f63          	bltz	a0,80204edc <sys_pipe+0x9a>
     copyout2(fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80204ec2:	4611                	li	a2,4
    80204ec4:	fc040593          	addi	a1,s0,-64
    80204ec8:	fd843503          	ld	a0,-40(s0)
    80204ecc:	0511                	addi	a0,a0,4
    80204ece:	ffffc097          	auipc	ra,0xffffc
    80204ed2:	4ae080e7          	jalr	1198(ra) # 8020137c <copyout2>
    p->ofile[fd1] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  return 0;
    80204ed6:	4781                	li	a5,0
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204ed8:	06055563          	bgez	a0,80204f42 <sys_pipe+0x100>
    p->ofile[fd0] = 0;
    80204edc:	fc442783          	lw	a5,-60(s0)
    80204ee0:	07e9                	addi	a5,a5,26
    80204ee2:	078e                	slli	a5,a5,0x3
    80204ee4:	97a6                	add	a5,a5,s1
    80204ee6:	0007b423          	sd	zero,8(a5)
    p->ofile[fd1] = 0;
    80204eea:	fc042503          	lw	a0,-64(s0)
    80204eee:	0569                	addi	a0,a0,26
    80204ef0:	050e                	slli	a0,a0,0x3
    80204ef2:	9526                	add	a0,a0,s1
    80204ef4:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    80204ef8:	fd043503          	ld	a0,-48(s0)
    80204efc:	fffff097          	auipc	ra,0xfffff
    80204f00:	ec0080e7          	jalr	-320(ra) # 80203dbc <fileclose>
    fileclose(wf);
    80204f04:	fc843503          	ld	a0,-56(s0)
    80204f08:	fffff097          	auipc	ra,0xfffff
    80204f0c:	eb4080e7          	jalr	-332(ra) # 80203dbc <fileclose>
    return -1;
    80204f10:	57fd                	li	a5,-1
    80204f12:	a805                	j	80204f42 <sys_pipe+0x100>
    if(fd0 >= 0)
    80204f14:	fc442783          	lw	a5,-60(s0)
    80204f18:	0007c863          	bltz	a5,80204f28 <sys_pipe+0xe6>
      p->ofile[fd0] = 0;
    80204f1c:	01a78513          	addi	a0,a5,26
    80204f20:	050e                	slli	a0,a0,0x3
    80204f22:	9526                	add	a0,a0,s1
    80204f24:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    80204f28:	fd043503          	ld	a0,-48(s0)
    80204f2c:	fffff097          	auipc	ra,0xfffff
    80204f30:	e90080e7          	jalr	-368(ra) # 80203dbc <fileclose>
    fileclose(wf);
    80204f34:	fc843503          	ld	a0,-56(s0)
    80204f38:	fffff097          	auipc	ra,0xfffff
    80204f3c:	e84080e7          	jalr	-380(ra) # 80203dbc <fileclose>
    return -1;
    80204f40:	57fd                	li	a5,-1
}
    80204f42:	853e                	mv	a0,a5
    80204f44:	70e2                	ld	ra,56(sp)
    80204f46:	7442                	ld	s0,48(sp)
    80204f48:	74a2                	ld	s1,40(sp)
    80204f4a:	6121                	addi	sp,sp,64
    80204f4c:	8082                	ret

0000000080204f4e <sys_dev>:

// To open console device.
uint64
sys_dev(void)
{
    80204f4e:	7179                	addi	sp,sp,-48
    80204f50:	f406                	sd	ra,40(sp)
    80204f52:	f022                	sd	s0,32(sp)
    80204f54:	ec26                	sd	s1,24(sp)
    80204f56:	1800                	addi	s0,sp,48
  int fd, omode;
  int major, minor;
  struct file *f;

  if(argint(0, &omode) < 0 || argint(1, &major) < 0 || argint(2, &minor) < 0){
    80204f58:	fdc40593          	addi	a1,s0,-36
    80204f5c:	4501                	li	a0,0
    80204f5e:	ffffe097          	auipc	ra,0xffffe
    80204f62:	fa8080e7          	jalr	-88(ra) # 80202f06 <argint>
    80204f66:	08054a63          	bltz	a0,80204ffa <sys_dev+0xac>
    80204f6a:	fd840593          	addi	a1,s0,-40
    80204f6e:	4505                	li	a0,1
    80204f70:	ffffe097          	auipc	ra,0xffffe
    80204f74:	f96080e7          	jalr	-106(ra) # 80202f06 <argint>
    80204f78:	08054763          	bltz	a0,80205006 <sys_dev+0xb8>
    80204f7c:	fd440593          	addi	a1,s0,-44
    80204f80:	4509                	li	a0,2
    80204f82:	ffffe097          	auipc	ra,0xffffe
    80204f86:	f84080e7          	jalr	-124(ra) # 80202f06 <argint>
    80204f8a:	08054063          	bltz	a0,8020500a <sys_dev+0xbc>
    return -1;
  }

  if(omode & O_CREATE){
    80204f8e:	fdc42783          	lw	a5,-36(s0)
    80204f92:	2407f793          	andi	a5,a5,576
    80204f96:	ebb1                	bnez	a5,80204fea <sys_dev+0x9c>
    panic("dev file on FAT");
  }

  if(major < 0 || major >= NDEV)
    80204f98:	fd842703          	lw	a4,-40(s0)
    80204f9c:	47a5                	li	a5,9
    return -1;
    80204f9e:	557d                	li	a0,-1
  if(major < 0 || major >= NDEV)
    80204fa0:	04e7ee63          	bltu	a5,a4,80204ffc <sys_dev+0xae>

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204fa4:	fffff097          	auipc	ra,0xfffff
    80204fa8:	d5c080e7          	jalr	-676(ra) # 80203d00 <filealloc>
    80204fac:	84aa                	mv	s1,a0
    80204fae:	c125                	beqz	a0,8020500e <sys_dev+0xc0>
    80204fb0:	00000097          	auipc	ra,0x0
    80204fb4:	97e080e7          	jalr	-1666(ra) # 8020492e <fdalloc>
    80204fb8:	04054d63          	bltz	a0,80205012 <sys_dev+0xc4>
    if(f)
      fileclose(f);
    return -1;
  }

  f->type = FD_DEVICE;
    80204fbc:	478d                	li	a5,3
    80204fbe:	c09c                	sw	a5,0(s1)
  f->off = 0;
    80204fc0:	0204a023          	sw	zero,32(s1)
  f->ep = 0;
    80204fc4:	0004bc23          	sd	zero,24(s1)
  f->major = major;
    80204fc8:	fd842783          	lw	a5,-40(s0)
    80204fcc:	02f49223          	sh	a5,36(s1)
  f->readable = !(omode & O_WRONLY);
    80204fd0:	fdc42783          	lw	a5,-36(s0)
    80204fd4:	0017c713          	xori	a4,a5,1
    80204fd8:	8b05                	andi	a4,a4,1
    80204fda:	00e48423          	sb	a4,8(s1)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204fde:	8b8d                	andi	a5,a5,3
    80204fe0:	00f037b3          	snez	a5,a5
    80204fe4:	00f484a3          	sb	a5,9(s1)

  return fd;
    80204fe8:	a811                	j	80204ffc <sys_dev+0xae>
    panic("dev file on FAT");
    80204fea:	00006517          	auipc	a0,0x6
    80204fee:	cae50513          	addi	a0,a0,-850 # 8020ac98 <digits+0x918>
    80204ff2:	ffffb097          	auipc	ra,0xffffb
    80204ff6:	150080e7          	jalr	336(ra) # 80200142 <panic>
    return -1;
    80204ffa:	557d                	li	a0,-1
}
    80204ffc:	70a2                	ld	ra,40(sp)
    80204ffe:	7402                	ld	s0,32(sp)
    80205000:	64e2                	ld	s1,24(sp)
    80205002:	6145                	addi	sp,sp,48
    80205004:	8082                	ret
    return -1;
    80205006:	557d                	li	a0,-1
    80205008:	bfd5                	j	80204ffc <sys_dev+0xae>
    8020500a:	557d                	li	a0,-1
    8020500c:	bfc5                	j	80204ffc <sys_dev+0xae>
    return -1;
    8020500e:	557d                	li	a0,-1
    80205010:	b7f5                	j	80204ffc <sys_dev+0xae>
      fileclose(f);
    80205012:	8526                	mv	a0,s1
    80205014:	fffff097          	auipc	ra,0xfffff
    80205018:	da8080e7          	jalr	-600(ra) # 80203dbc <fileclose>
    return -1;
    8020501c:	557d                	li	a0,-1
    8020501e:	bff9                	j	80204ffc <sys_dev+0xae>

0000000080205020 <sys_readdir>:

// To support ls command
uint64
sys_readdir(void)
{
    80205020:	1101                	addi	sp,sp,-32
    80205022:	ec06                	sd	ra,24(sp)
    80205024:	e822                	sd	s0,16(sp)
    80205026:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80205028:	fe840613          	addi	a2,s0,-24
    8020502c:	4581                	li	a1,0
    8020502e:	4501                	li	a0,0
    80205030:	00000097          	auipc	ra,0x0
    80205034:	894080e7          	jalr	-1900(ra) # 802048c4 <argfd>
    return -1;
    80205038:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    8020503a:	02054563          	bltz	a0,80205064 <sys_readdir+0x44>
    8020503e:	fe040593          	addi	a1,s0,-32
    80205042:	4505                	li	a0,1
    80205044:	ffffe097          	auipc	ra,0xffffe
    80205048:	f24080e7          	jalr	-220(ra) # 80202f68 <argaddr>
    return -1;
    8020504c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    8020504e:	00054b63          	bltz	a0,80205064 <sys_readdir+0x44>
  return dirnext(f, p);
    80205052:	fe043583          	ld	a1,-32(s0)
    80205056:	fe843503          	ld	a0,-24(s0)
    8020505a:	fffff097          	auipc	ra,0xfffff
    8020505e:	010080e7          	jalr	16(ra) # 8020406a <dirnext>
    80205062:	87aa                	mv	a5,a0
}
    80205064:	853e                	mv	a0,a5
    80205066:	60e2                	ld	ra,24(sp)
    80205068:	6442                	ld	s0,16(sp)
    8020506a:	6105                	addi	sp,sp,32
    8020506c:	8082                	ret

000000008020506e <sys_getcwd>:

// get absolute cwd string
uint64
sys_getcwd(void)
{
    8020506e:	714d                	addi	sp,sp,-336
    80205070:	e686                	sd	ra,328(sp)
    80205072:	e2a2                	sd	s0,320(sp)
    80205074:	fe26                	sd	s1,312(sp)
    80205076:	fa4a                	sd	s2,304(sp)
    80205078:	f64e                	sd	s3,296(sp)
    8020507a:	f252                	sd	s4,288(sp)
    8020507c:	ee56                	sd	s5,280(sp)
    8020507e:	0a80                	addi	s0,sp,336
  uint64 addr;
  if (argaddr(0, &addr) < 0)
    80205080:	fb840593          	addi	a1,s0,-72
    80205084:	4501                	li	a0,0
    80205086:	ffffe097          	auipc	ra,0xffffe
    8020508a:	ee2080e7          	jalr	-286(ra) # 80202f68 <argaddr>
    return -1;
    8020508e:	57fd                	li	a5,-1
  if (argaddr(0, &addr) < 0)
    80205090:	06054f63          	bltz	a0,8020510e <sys_getcwd+0xa0>

  struct dirent *de = myproc()->cwd;
    80205094:	ffffd097          	auipc	ra,0xffffd
    80205098:	9c4080e7          	jalr	-1596(ra) # 80201a58 <myproc>
    8020509c:	4d853483          	ld	s1,1240(a0)
  char path[FAT32_MAX_PATH];
  char *s;
  int len;

  if (de->parent == NULL) {
    802050a0:	1204b783          	ld	a5,288(s1)
    802050a4:	cfbd                	beqz	a5,80205122 <sys_getcwd+0xb4>
    s = "/";
  } else {
    s = path + FAT32_MAX_PATH - 1;
    *s = '\0';
    802050a6:	fa0409a3          	sb	zero,-77(s0)
    s = path + FAT32_MAX_PATH - 1;
    802050aa:	fb340993          	addi	s3,s0,-77
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= path)          // can't reach root "/"
    802050ae:	eb040a13          	addi	s4,s0,-336
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    802050b2:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    802050b6:	8526                	mv	a0,s1
    802050b8:	ffffc097          	auipc	ra,0xffffc
    802050bc:	834080e7          	jalr	-1996(ra) # 802008ec <strlen>
    802050c0:	862a                	mv	a2,a0
      s -= len;
    802050c2:	40a98933          	sub	s2,s3,a0
      if (s <= path)          // can't reach root "/"
    802050c6:	072a7363          	bgeu	s4,s2,8020512c <sys_getcwd+0xbe>
      strncpy(s, de->filename, len);
    802050ca:	85a6                	mv	a1,s1
    802050cc:	854a                	mv	a0,s2
    802050ce:	ffffb097          	auipc	ra,0xffffb
    802050d2:	7ae080e7          	jalr	1966(ra) # 8020087c <strncpy>
      *--s = '/';
    802050d6:	fff90993          	addi	s3,s2,-1
    802050da:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    802050de:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    802050e2:	1204b783          	ld	a5,288(s1)
    802050e6:	fbe1                	bnez	a5,802050b6 <sys_getcwd+0x48>
    }
  }

  // if (copyout(myproc()->pagetable, addr, s, strlen(s) + 1) < 0)
  if (copyout2(addr, s, strlen(s) + 1) < 0)
    802050e8:	fb843483          	ld	s1,-72(s0)
    802050ec:	854e                	mv	a0,s3
    802050ee:	ffffb097          	auipc	ra,0xffffb
    802050f2:	7fe080e7          	jalr	2046(ra) # 802008ec <strlen>
    802050f6:	0015061b          	addiw	a2,a0,1
    802050fa:	85ce                	mv	a1,s3
    802050fc:	8526                	mv	a0,s1
    802050fe:	ffffc097          	auipc	ra,0xffffc
    80205102:	27e080e7          	jalr	638(ra) # 8020137c <copyout2>
    80205106:	02054563          	bltz	a0,80205130 <sys_getcwd+0xc2>
    return -1;
  
  return addr;
    8020510a:	fb843783          	ld	a5,-72(s0)

}
    8020510e:	853e                	mv	a0,a5
    80205110:	60b6                	ld	ra,328(sp)
    80205112:	6416                	ld	s0,320(sp)
    80205114:	74f2                	ld	s1,312(sp)
    80205116:	7952                	ld	s2,304(sp)
    80205118:	79b2                	ld	s3,296(sp)
    8020511a:	7a12                	ld	s4,288(sp)
    8020511c:	6af2                	ld	s5,280(sp)
    8020511e:	6171                	addi	sp,sp,336
    80205120:	8082                	ret
    s = "/";
    80205122:	00005997          	auipc	s3,0x5
    80205126:	50e98993          	addi	s3,s3,1294 # 8020a630 <digits+0x2b0>
    8020512a:	bf7d                	j	802050e8 <sys_getcwd+0x7a>
        return -1;
    8020512c:	57fd                	li	a5,-1
    8020512e:	b7c5                	j	8020510e <sys_getcwd+0xa0>
    return -1;
    80205130:	57fd                	li	a5,-1
    80205132:	bff1                	j	8020510e <sys_getcwd+0xa0>

0000000080205134 <sys_remove>:
  return ret == -1;
}

uint64
sys_remove(void)
{
    80205134:	d6010113          	addi	sp,sp,-672
    80205138:	28113c23          	sd	ra,664(sp)
    8020513c:	28813823          	sd	s0,656(sp)
    80205140:	28913423          	sd	s1,648(sp)
    80205144:	1500                	addi	s0,sp,672
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  int len;
  if((len = argstr(0, path, FAT32_MAX_PATH)) <= 0)
    80205146:	10400613          	li	a2,260
    8020514a:	ed840593          	addi	a1,s0,-296
    8020514e:	4501                	li	a0,0
    80205150:	ffffe097          	auipc	ra,0xffffe
    80205154:	e3a080e7          	jalr	-454(ra) # 80202f8a <argstr>
    80205158:	0ea05a63          	blez	a0,8020524c <sys_remove+0x118>
    return -1;

  char *s = path + len - 1;
    8020515c:	157d                	addi	a0,a0,-1
    8020515e:	ed840713          	addi	a4,s0,-296
    80205162:	00a707b3          	add	a5,a4,a0
  while (s >= path && *s == '/') {
    80205166:	02f00693          	li	a3,47
    8020516a:	863a                	mv	a2,a4
    8020516c:	00e7e963          	bltu	a5,a4,8020517e <sys_remove+0x4a>
    80205170:	0007c703          	lbu	a4,0(a5)
    80205174:	08d71a63          	bne	a4,a3,80205208 <sys_remove+0xd4>
    s--;
    80205178:	17fd                	addi	a5,a5,-1
  while (s >= path && *s == '/') {
    8020517a:	fec7fbe3          	bgeu	a5,a2,80205170 <sys_remove+0x3c>
  }
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    return -1;
  }
  
  if((ep = ename(path)) == NULL){
    8020517e:	ed840513          	addi	a0,s0,-296
    80205182:	00002097          	auipc	ra,0x2
    80205186:	65a080e7          	jalr	1626(ra) # 802077dc <ename>
    8020518a:	84aa                	mv	s1,a0
    8020518c:	c561                	beqz	a0,80205254 <sys_remove+0x120>
    return -1;
  }
  elock(ep);
    8020518e:	00002097          	auipc	ra,0x2
    80205192:	ea4080e7          	jalr	-348(ra) # 80207032 <elock>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80205196:	1004c783          	lbu	a5,256(s1)
    8020519a:	8bc1                	andi	a5,a5,16
    8020519c:	c38d                	beqz	a5,802051be <sys_remove+0x8a>
  ep.valid = 0;
    8020519e:	e8041323          	sh	zero,-378(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    802051a2:	d6c40693          	addi	a3,s0,-660
    802051a6:	04000613          	li	a2,64
    802051aa:	d7040593          	addi	a1,s0,-656
    802051ae:	8526                	mv	a0,s1
    802051b0:	00002097          	auipc	ra,0x2
    802051b4:	086080e7          	jalr	134(ra) # 80207236 <enext>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    802051b8:	57fd                	li	a5,-1
    802051ba:	06f51d63          	bne	a0,a5,80205234 <sys_remove+0x100>
      eunlock(ep);
      eput(ep);
      return -1;
  }
  elock(ep->parent);      // Will this lead to deadlock?
    802051be:	1204b503          	ld	a0,288(s1)
    802051c2:	00002097          	auipc	ra,0x2
    802051c6:	e70080e7          	jalr	-400(ra) # 80207032 <elock>
  eremove(ep);
    802051ca:	8526                	mv	a0,s1
    802051cc:	00002097          	auipc	ra,0x2
    802051d0:	d32080e7          	jalr	-718(ra) # 80206efe <eremove>
  eunlock(ep->parent);
    802051d4:	1204b503          	ld	a0,288(s1)
    802051d8:	00002097          	auipc	ra,0x2
    802051dc:	e90080e7          	jalr	-368(ra) # 80207068 <eunlock>
  eunlock(ep);
    802051e0:	8526                	mv	a0,s1
    802051e2:	00002097          	auipc	ra,0x2
    802051e6:	e86080e7          	jalr	-378(ra) # 80207068 <eunlock>
  eput(ep);
    802051ea:	8526                	mv	a0,s1
    802051ec:	00002097          	auipc	ra,0x2
    802051f0:	eca080e7          	jalr	-310(ra) # 802070b6 <eput>

  return 0;
    802051f4:	4501                	li	a0,0
}
    802051f6:	29813083          	ld	ra,664(sp)
    802051fa:	29013403          	ld	s0,656(sp)
    802051fe:	28813483          	ld	s1,648(sp)
    80205202:	2a010113          	addi	sp,sp,672
    80205206:	8082                	ret
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    80205208:	ed840713          	addi	a4,s0,-296
    8020520c:	f6e7e9e3          	bltu	a5,a4,8020517e <sys_remove+0x4a>
    80205210:	0007c683          	lbu	a3,0(a5)
    80205214:	02e00713          	li	a4,46
    80205218:	f6e693e3          	bne	a3,a4,8020517e <sys_remove+0x4a>
    8020521c:	ed840713          	addi	a4,s0,-296
    80205220:	02e78863          	beq	a5,a4,80205250 <sys_remove+0x11c>
    80205224:	fff7c703          	lbu	a4,-1(a5)
    80205228:	02f00793          	li	a5,47
    8020522c:	f4f719e3          	bne	a4,a5,8020517e <sys_remove+0x4a>
    return -1;
    80205230:	557d                	li	a0,-1
    80205232:	b7d1                	j	802051f6 <sys_remove+0xc2>
      eunlock(ep);
    80205234:	8526                	mv	a0,s1
    80205236:	00002097          	auipc	ra,0x2
    8020523a:	e32080e7          	jalr	-462(ra) # 80207068 <eunlock>
      eput(ep);
    8020523e:	8526                	mv	a0,s1
    80205240:	00002097          	auipc	ra,0x2
    80205244:	e76080e7          	jalr	-394(ra) # 802070b6 <eput>
      return -1;
    80205248:	557d                	li	a0,-1
    8020524a:	b775                	j	802051f6 <sys_remove+0xc2>
    return -1;
    8020524c:	557d                	li	a0,-1
    8020524e:	b765                	j	802051f6 <sys_remove+0xc2>
    return -1;
    80205250:	557d                	li	a0,-1
    80205252:	b755                	j	802051f6 <sys_remove+0xc2>
    return -1;
    80205254:	557d                	li	a0,-1
    80205256:	b745                	j	802051f6 <sys_remove+0xc2>

0000000080205258 <sys_rename>:

// Must hold too many locks at a time! It's possible to raise a deadlock.
// Because this op takes some steps, we can't promise
uint64
sys_rename(void)
{
    80205258:	c4010113          	addi	sp,sp,-960
    8020525c:	3a113c23          	sd	ra,952(sp)
    80205260:	3a813823          	sd	s0,944(sp)
    80205264:	3a913423          	sd	s1,936(sp)
    80205268:	3b213023          	sd	s2,928(sp)
    8020526c:	39313c23          	sd	s3,920(sp)
    80205270:	39413823          	sd	s4,912(sp)
    80205274:	0780                	addi	s0,sp,960
  char old[FAT32_MAX_PATH], new[FAT32_MAX_PATH];
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80205276:	10400613          	li	a2,260
    8020527a:	ec840593          	addi	a1,s0,-312
    8020527e:	4501                	li	a0,0
    80205280:	ffffe097          	auipc	ra,0xffffe
    80205284:	d0a080e7          	jalr	-758(ra) # 80202f8a <argstr>
      return -1;
    80205288:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    8020528a:	0c054d63          	bltz	a0,80205364 <sys_rename+0x10c>
    8020528e:	10400613          	li	a2,260
    80205292:	dc040593          	addi	a1,s0,-576
    80205296:	4505                	li	a0,1
    80205298:	ffffe097          	auipc	ra,0xffffe
    8020529c:	cf2080e7          	jalr	-782(ra) # 80202f8a <argstr>
      return -1;
    802052a0:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    802052a2:	0c054163          	bltz	a0,80205364 <sys_rename+0x10c>
  }

  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
  int srclock = 0;
  char *name;
  if ((src = ename(old)) == NULL || (pdst = enameparent(new, old)) == NULL
    802052a6:	ec840513          	addi	a0,s0,-312
    802052aa:	00002097          	auipc	ra,0x2
    802052ae:	532080e7          	jalr	1330(ra) # 802077dc <ename>
    802052b2:	84aa                	mv	s1,a0
    802052b4:	1c050963          	beqz	a0,80205486 <sys_rename+0x22e>
    802052b8:	ec840593          	addi	a1,s0,-312
    802052bc:	dc040513          	addi	a0,s0,-576
    802052c0:	00002097          	auipc	ra,0x2
    802052c4:	53a080e7          	jalr	1338(ra) # 802077fa <enameparent>
    802052c8:	892a                	mv	s2,a0
    802052ca:	cd35                	beqz	a0,80205346 <sys_rename+0xee>
      || (name = formatname(old)) == NULL) {
    802052cc:	ec840513          	addi	a0,s0,-312
    802052d0:	00001097          	auipc	ra,0x1
    802052d4:	69c080e7          	jalr	1692(ra) # 8020696c <formatname>
    802052d8:	89aa                	mv	s3,a0
    802052da:	c535                	beqz	a0,80205346 <sys_rename+0xee>
    goto fail;          // src doesn't exist || dst parent doesn't exist || illegal new name
  }
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    if (ep == src) {    // In what universe can we move a directory into its child?
    802052dc:	07248563          	beq	s1,s2,80205346 <sys_rename+0xee>
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    802052e0:	87ca                	mv	a5,s2
    802052e2:	1207b783          	ld	a5,288(a5)
    802052e6:	c781                	beqz	a5,802052ee <sys_rename+0x96>
    if (ep == src) {    // In what universe can we move a directory into its child?
    802052e8:	fef49de3          	bne	s1,a5,802052e2 <sys_rename+0x8a>
    802052ec:	a8a9                	j	80205346 <sys_rename+0xee>
      goto fail;
    }
  }

  uint off;
  elock(src);     // must hold child's lock before acquiring parent's, because we do so in other similar cases
    802052ee:	8526                	mv	a0,s1
    802052f0:	00002097          	auipc	ra,0x2
    802052f4:	d42080e7          	jalr	-702(ra) # 80207032 <elock>
  srclock = 1;
  elock(pdst);
    802052f8:	854a                	mv	a0,s2
    802052fa:	00002097          	auipc	ra,0x2
    802052fe:	d38080e7          	jalr	-712(ra) # 80207032 <elock>
  dst = dirlookup(pdst, name, &off);
    80205302:	dbc40613          	addi	a2,s0,-580
    80205306:	85ce                	mv	a1,s3
    80205308:	854a                	mv	a0,s2
    8020530a:	00002097          	auipc	ra,0x2
    8020530e:	0bc080e7          	jalr	188(ra) # 802073c6 <dirlookup>
    80205312:	8a2a                	mv	s4,a0
  if (dst != NULL) {
    80205314:	cd45                	beqz	a0,802053cc <sys_rename+0x174>
    eunlock(pdst);
    80205316:	854a                	mv	a0,s2
    80205318:	00002097          	auipc	ra,0x2
    8020531c:	d50080e7          	jalr	-688(ra) # 80207068 <eunlock>
    if (src == dst) {
    80205320:	01448963          	beq	s1,s4,80205332 <sys_rename+0xda>
      goto fail;
    } else if (src->attribute & dst->attribute & ATTR_DIRECTORY) {
    80205324:	1004c783          	lbu	a5,256(s1)
    80205328:	100a4703          	lbu	a4,256(s4)
    8020532c:	8ff9                	and	a5,a5,a4
    8020532e:	8bc1                	andi	a5,a5,16
    80205330:	ebb1                	bnez	a5,80205384 <sys_rename+0x12c>

  return 0;

fail:
  if (srclock)
    eunlock(src);
    80205332:	8526                	mv	a0,s1
    80205334:	00002097          	auipc	ra,0x2
    80205338:	d34080e7          	jalr	-716(ra) # 80207068 <eunlock>
  if (dst)
    eput(dst);
    8020533c:	8552                	mv	a0,s4
    8020533e:	00002097          	auipc	ra,0x2
    80205342:	d78080e7          	jalr	-648(ra) # 802070b6 <eput>
  if (pdst)
    80205346:	00090763          	beqz	s2,80205354 <sys_rename+0xfc>
    eput(pdst);
    8020534a:	854a                	mv	a0,s2
    8020534c:	00002097          	auipc	ra,0x2
    80205350:	d6a080e7          	jalr	-662(ra) # 802070b6 <eput>
  if (src)
    eput(src);
  return -1;
    80205354:	57fd                	li	a5,-1
  if (src)
    80205356:	c499                	beqz	s1,80205364 <sys_rename+0x10c>
    eput(src);
    80205358:	8526                	mv	a0,s1
    8020535a:	00002097          	auipc	ra,0x2
    8020535e:	d5c080e7          	jalr	-676(ra) # 802070b6 <eput>
  return -1;
    80205362:	57fd                	li	a5,-1
}
    80205364:	853e                	mv	a0,a5
    80205366:	3b813083          	ld	ra,952(sp)
    8020536a:	3b013403          	ld	s0,944(sp)
    8020536e:	3a813483          	ld	s1,936(sp)
    80205372:	3a013903          	ld	s2,928(sp)
    80205376:	39813983          	ld	s3,920(sp)
    8020537a:	39013a03          	ld	s4,912(sp)
    8020537e:	3c010113          	addi	sp,sp,960
    80205382:	8082                	ret
      elock(dst);
    80205384:	8552                	mv	a0,s4
    80205386:	00002097          	auipc	ra,0x2
    8020538a:	cac080e7          	jalr	-852(ra) # 80207032 <elock>
  ep.valid = 0;
    8020538e:	d6041323          	sh	zero,-666(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80205392:	c4c40693          	addi	a3,s0,-948
    80205396:	04000613          	li	a2,64
    8020539a:	c5040593          	addi	a1,s0,-944
    8020539e:	8552                	mv	a0,s4
    802053a0:	00002097          	auipc	ra,0x2
    802053a4:	e96080e7          	jalr	-362(ra) # 80207236 <enext>
      if (!isdirempty(dst)) {    // it's ok to overwrite an empty dir
    802053a8:	57fd                	li	a5,-1
    802053aa:	0cf51863          	bne	a0,a5,8020547a <sys_rename+0x222>
      elock(pdst);
    802053ae:	854a                	mv	a0,s2
    802053b0:	00002097          	auipc	ra,0x2
    802053b4:	c82080e7          	jalr	-894(ra) # 80207032 <elock>
    eremove(dst);
    802053b8:	8552                	mv	a0,s4
    802053ba:	00002097          	auipc	ra,0x2
    802053be:	b44080e7          	jalr	-1212(ra) # 80206efe <eremove>
    eunlock(dst);
    802053c2:	8552                	mv	a0,s4
    802053c4:	00002097          	auipc	ra,0x2
    802053c8:	ca4080e7          	jalr	-860(ra) # 80207068 <eunlock>
  memmove(src->filename, name, FAT32_MAX_FILENAME);
    802053cc:	0ff00613          	li	a2,255
    802053d0:	85ce                	mv	a1,s3
    802053d2:	8526                	mv	a0,s1
    802053d4:	ffffb097          	auipc	ra,0xffffb
    802053d8:	3f0080e7          	jalr	1008(ra) # 802007c4 <memmove>
  emake(pdst, src, off);
    802053dc:	dbc42603          	lw	a2,-580(s0)
    802053e0:	85a6                	mv	a1,s1
    802053e2:	854a                	mv	a0,s2
    802053e4:	00001097          	auipc	ra,0x1
    802053e8:	640080e7          	jalr	1600(ra) # 80206a24 <emake>
  if (src->parent != pdst) {
    802053ec:	1204b783          	ld	a5,288(s1)
    802053f0:	01278d63          	beq	a5,s2,8020540a <sys_rename+0x1b2>
    eunlock(pdst);
    802053f4:	854a                	mv	a0,s2
    802053f6:	00002097          	auipc	ra,0x2
    802053fa:	c72080e7          	jalr	-910(ra) # 80207068 <eunlock>
    elock(src->parent);
    802053fe:	1204b503          	ld	a0,288(s1)
    80205402:	00002097          	auipc	ra,0x2
    80205406:	c30080e7          	jalr	-976(ra) # 80207032 <elock>
  eremove(src);
    8020540a:	8526                	mv	a0,s1
    8020540c:	00002097          	auipc	ra,0x2
    80205410:	af2080e7          	jalr	-1294(ra) # 80206efe <eremove>
  eunlock(src->parent);
    80205414:	1204b503          	ld	a0,288(s1)
    80205418:	00002097          	auipc	ra,0x2
    8020541c:	c50080e7          	jalr	-944(ra) # 80207068 <eunlock>
  struct dirent *psrc = src->parent;  // src must not be root, or it won't pass the for-loop test
    80205420:	1204b983          	ld	s3,288(s1)
  src->parent = edup(pdst);
    80205424:	854a                	mv	a0,s2
    80205426:	00002097          	auipc	ra,0x2
    8020542a:	9ae080e7          	jalr	-1618(ra) # 80206dd4 <edup>
    8020542e:	12a4b023          	sd	a0,288(s1)
  src->off = off;
    80205432:	dbc42783          	lw	a5,-580(s0)
    80205436:	10f4ae23          	sw	a5,284(s1)
  src->valid = 1;
    8020543a:	4785                	li	a5,1
    8020543c:	10f49b23          	sh	a5,278(s1)
  eunlock(src);
    80205440:	8526                	mv	a0,s1
    80205442:	00002097          	auipc	ra,0x2
    80205446:	c26080e7          	jalr	-986(ra) # 80207068 <eunlock>
  eput(psrc);
    8020544a:	854e                	mv	a0,s3
    8020544c:	00002097          	auipc	ra,0x2
    80205450:	c6a080e7          	jalr	-918(ra) # 802070b6 <eput>
  if (dst) {
    80205454:	000a0763          	beqz	s4,80205462 <sys_rename+0x20a>
    eput(dst);
    80205458:	8552                	mv	a0,s4
    8020545a:	00002097          	auipc	ra,0x2
    8020545e:	c5c080e7          	jalr	-932(ra) # 802070b6 <eput>
  eput(pdst);
    80205462:	854a                	mv	a0,s2
    80205464:	00002097          	auipc	ra,0x2
    80205468:	c52080e7          	jalr	-942(ra) # 802070b6 <eput>
  eput(src);
    8020546c:	8526                	mv	a0,s1
    8020546e:	00002097          	auipc	ra,0x2
    80205472:	c48080e7          	jalr	-952(ra) # 802070b6 <eput>
  return 0;
    80205476:	4781                	li	a5,0
    80205478:	b5f5                	j	80205364 <sys_rename+0x10c>
        eunlock(dst);
    8020547a:	8552                	mv	a0,s4
    8020547c:	00002097          	auipc	ra,0x2
    80205480:	bec080e7          	jalr	-1044(ra) # 80207068 <eunlock>
        goto fail;
    80205484:	b57d                	j	80205332 <sys_rename+0xda>
  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
    80205486:	892a                	mv	s2,a0
  if (dst)
    80205488:	bd7d                	j	80205346 <sys_rename+0xee>

000000008020548a <sys_openat>:

// added by lmq for SYS_openat
uint64
sys_openat(void)
{
    8020548a:	ca010113          	addi	sp,sp,-864
    8020548e:	34113c23          	sd	ra,856(sp)
    80205492:	34813823          	sd	s0,848(sp)
    80205496:	34913423          	sd	s1,840(sp)
    8020549a:	35213023          	sd	s2,832(sp)
    8020549e:	33313c23          	sd	s3,824(sp)
    802054a2:	33413823          	sd	s4,816(sp)
    802054a6:	33513423          	sd	s5,808(sp)
    802054aa:	1680                	addi	s0,sp,864
  int dirfd;
  if(argint(0, &dirfd) < 0)
    802054ac:	fbc40593          	addi	a1,s0,-68
    802054b0:	4501                	li	a0,0
    802054b2:	ffffe097          	auipc	ra,0xffffe
    802054b6:	a54080e7          	jalr	-1452(ra) # 80202f06 <argint>
    802054ba:	2e054563          	bltz	a0,802057a4 <sys_openat+0x31a>
    return -1;
  struct dirent *de = myproc()->cwd;
    802054be:	ffffc097          	auipc	ra,0xffffc
    802054c2:	59a080e7          	jalr	1434(ra) # 80201a58 <myproc>
  if(dirfd!=AT_FDCWD)
    802054c6:	fbc42703          	lw	a4,-68(s0)
    802054ca:	f9c00793          	li	a5,-100
    802054ce:	16f71563          	bne	a4,a5,80205638 <sys_openat+0x1ae>
  struct dirent *de = myproc()->cwd;
    802054d2:	4d853483          	ld	s1,1240(a0)
  {
    de=myproc()->ofile[dirfd]->ep;
  }
  char cur_path[FAT32_MAX_PATH];  // openat工作目录 可以为当前目录 也可以被指定
  memset(cur_path,0,FAT32_MAX_PATH);
    802054d6:	10400613          	li	a2,260
    802054da:	4581                	li	a1,0
    802054dc:	eb840513          	addi	a0,s0,-328
    802054e0:	ffffb097          	auipc	ra,0xffffb
    802054e4:	284080e7          	jalr	644(ra) # 80200764 <memset>
  char* s=NULL;
  int len;

  // 获得openat工作目录路径
  if (de->parent == NULL) {
    802054e8:	1204b783          	ld	a5,288(s1)
    802054ec:	16078263          	beqz	a5,80205650 <sys_openat+0x1c6>
    s = "/";
  } 
  else {
    s = cur_path + FAT32_MAX_PATH - 1;
    *s = '\0';
    802054f0:	fa040da3          	sb	zero,-69(s0)
    s = cur_path + FAT32_MAX_PATH - 1;
    802054f4:	fbb40993          	addi	s3,s0,-69
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= cur_path)          // can't reach root "/"
    802054f8:	eb840a13          	addi	s4,s0,-328
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    802054fc:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    80205500:	8526                	mv	a0,s1
    80205502:	ffffb097          	auipc	ra,0xffffb
    80205506:	3ea080e7          	jalr	1002(ra) # 802008ec <strlen>
    8020550a:	862a                	mv	a2,a0
      s -= len;
    8020550c:	40a98933          	sub	s2,s3,a0
      if (s <= cur_path)          // can't reach root "/"
    80205510:	292a7c63          	bgeu	s4,s2,802057a8 <sys_openat+0x31e>
      strncpy(s, de->filename, len);
    80205514:	85a6                	mv	a1,s1
    80205516:	854a                	mv	a0,s2
    80205518:	ffffb097          	auipc	ra,0xffffb
    8020551c:	364080e7          	jalr	868(ra) # 8020087c <strncpy>
      *--s = '/';
    80205520:	fff90993          	addi	s3,s2,-1
    80205524:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    80205528:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    8020552c:	1204b783          	ld	a5,288(s1)
    80205530:	fbe1                	bnez	a5,80205500 <sys_openat+0x76>
    }
  }
  
  // 获得openat的文件路径 openat工作目录+相对路径
  char absolute_path[FAT32_MAX_PATH];
  memset(absolute_path,0,FAT32_MAX_PATH);
    80205532:	10400613          	li	a2,260
    80205536:	4581                	li	a1,0
    80205538:	db040493          	addi	s1,s0,-592
    8020553c:	8526                	mv	a0,s1
    8020553e:	ffffb097          	auipc	ra,0xffffb
    80205542:	226080e7          	jalr	550(ra) # 80200764 <memset>
  strncpy(absolute_path,s,strlen(s));
    80205546:	854e                	mv	a0,s3
    80205548:	ffffb097          	auipc	ra,0xffffb
    8020554c:	3a4080e7          	jalr	932(ra) # 802008ec <strlen>
    80205550:	862a                	mv	a2,a0
    80205552:	85ce                	mv	a1,s3
    80205554:	8526                	mv	a0,s1
    80205556:	ffffb097          	auipc	ra,0xffffb
    8020555a:	326080e7          	jalr	806(ra) # 8020087c <strncpy>

  int fd,omode;
  struct file *f;
  struct dirent *ep;
  char relative_path[FAT32_MAX_PATH];
  if(argstr(1, relative_path, FAT32_MAX_PATH) < 0 || argint(2,&omode) < 0)
    8020555e:	10400613          	li	a2,260
    80205562:	ca840593          	addi	a1,s0,-856
    80205566:	4505                	li	a0,1
    80205568:	ffffe097          	auipc	ra,0xffffe
    8020556c:	a22080e7          	jalr	-1502(ra) # 80202f8a <argstr>
    80205570:	24054e63          	bltz	a0,802057cc <sys_openat+0x342>
    80205574:	dac40593          	addi	a1,s0,-596
    80205578:	4509                	li	a0,2
    8020557a:	ffffe097          	auipc	ra,0xffffe
    8020557e:	98c080e7          	jalr	-1652(ra) # 80202f06 <argint>
    80205582:	24054763          	bltz	a0,802057d0 <sys_openat+0x346>
    return -1;
  
  if(relative_path[0]=='/')                               // 为绝对路径 忽略dirfd
    80205586:	ca844783          	lbu	a5,-856(s0)
    8020558a:	02f00713          	li	a4,47
    8020558e:	0ce78663          	beq	a5,a4,8020565a <sys_openat+0x1d0>
  {
    memset(absolute_path,0,FAT32_MAX_PATH);
    strncpy(absolute_path,relative_path,strlen(relative_path));
  }
  else if(relative_path[0]=='.' && relative_path[1]=='/') // 为显式相对路径
    80205592:	02e00713          	li	a4,46
    80205596:	0ee78963          	beq	a5,a4,80205688 <sys_openat+0x1fe>
  {
    panic("openat not support ..");
  }
  else                                                    // 为隐式相对路径
  {
    int absolute_path_old_len=strlen(absolute_path);
    8020559a:	db040913          	addi	s2,s0,-592
    8020559e:	854a                	mv	a0,s2
    802055a0:	ffffb097          	auipc	ra,0xffffb
    802055a4:	34c080e7          	jalr	844(ra) # 802008ec <strlen>
    absolute_path[absolute_path_old_len]='/';
    802055a8:	fc040793          	addi	a5,s0,-64
    802055ac:	97aa                	add	a5,a5,a0
    802055ae:	02f00713          	li	a4,47
    802055b2:	dee78823          	sb	a4,-528(a5)
    absolute_path[absolute_path_old_len+1]='\0';
    802055b6:	2505                	addiw	a0,a0,1
    802055b8:	fc040793          	addi	a5,s0,-64
    802055bc:	953e                	add	a0,a0,a5
    802055be:	de050823          	sb	zero,-528(a0)
    strncpy(absolute_path+strlen(absolute_path),
    802055c2:	854a                	mv	a0,s2
    802055c4:	ffffb097          	auipc	ra,0xffffb
    802055c8:	328080e7          	jalr	808(ra) # 802008ec <strlen>
    802055cc:	84aa                	mv	s1,a0
    802055ce:	ca840993          	addi	s3,s0,-856
    802055d2:	854e                	mv	a0,s3
    802055d4:	ffffb097          	auipc	ra,0xffffb
    802055d8:	318080e7          	jalr	792(ra) # 802008ec <strlen>
    802055dc:	862a                	mv	a2,a0
    802055de:	85ce                	mv	a1,s3
    802055e0:	00990533          	add	a0,s2,s1
    802055e4:	ffffb097          	auipc	ra,0xffffb
    802055e8:	298080e7          	jalr	664(ra) # 8020087c <strncpy>
            relative_path,
            strlen(relative_path));
  }

  // 根据路径名打开文件
  if(omode & O_CREATE){                         // 创建文件
    802055ec:	dac42603          	lw	a2,-596(s0)
    802055f0:	24067793          	andi	a5,a2,576
    802055f4:	e7e5                	bnez	a5,802056dc <sys_openat+0x252>
    ep = create(absolute_path, T_FILE, omode);
    if(ep == NULL){
      return -1;
    }
  } 
  else if(omode & O_DIRECTORY)                  // 打开一个目录
    802055f6:	02a61793          	slli	a5,a2,0x2a
    802055fa:	1607d063          	bgez	a5,8020575a <sys_openat+0x2d0>
  {
    
    if((ep=ename(absolute_path))==NULL)         // 获取目录项
    802055fe:	db040513          	addi	a0,s0,-592
    80205602:	00002097          	auipc	ra,0x2
    80205606:	1da080e7          	jalr	474(ra) # 802077dc <ename>
    8020560a:	892a                	mv	s2,a0
    8020560c:	1c050663          	beqz	a0,802057d8 <sys_openat+0x34e>
    {
      return -1;
    }
    elock(ep);
    80205610:	00002097          	auipc	ra,0x2
    80205614:	a22080e7          	jalr	-1502(ra) # 80207032 <elock>
    if(!(ep->attribute & ATTR_DIRECTORY))       // 该文件不是目录文件
    80205618:	10094783          	lbu	a5,256(s2)
    8020561c:	8bc1                	andi	a5,a5,16
    8020561e:	ebe1                	bnez	a5,802056ee <sys_openat+0x264>
    {
      eunlock(ep);
    80205620:	854a                	mv	a0,s2
    80205622:	00002097          	auipc	ra,0x2
    80205626:	a46080e7          	jalr	-1466(ra) # 80207068 <eunlock>
      eput(ep);
    8020562a:	854a                	mv	a0,s2
    8020562c:	00002097          	auipc	ra,0x2
    80205630:	a8a080e7          	jalr	-1398(ra) # 802070b6 <eput>
      return -1;
    80205634:	557d                	li	a0,-1
    80205636:	aa95                	j	802057aa <sys_openat+0x320>
    de=myproc()->ofile[dirfd]->ep;
    80205638:	ffffc097          	auipc	ra,0xffffc
    8020563c:	420080e7          	jalr	1056(ra) # 80201a58 <myproc>
    80205640:	fbc42783          	lw	a5,-68(s0)
    80205644:	07e9                	addi	a5,a5,26
    80205646:	078e                	slli	a5,a5,0x3
    80205648:	97aa                	add	a5,a5,a0
    8020564a:	679c                	ld	a5,8(a5)
    8020564c:	6f84                	ld	s1,24(a5)
    8020564e:	b561                	j	802054d6 <sys_openat+0x4c>
    s = "/";
    80205650:	00005997          	auipc	s3,0x5
    80205654:	fe098993          	addi	s3,s3,-32 # 8020a630 <digits+0x2b0>
    80205658:	bde9                	j	80205532 <sys_openat+0xa8>
    memset(absolute_path,0,FAT32_MAX_PATH);
    8020565a:	10400613          	li	a2,260
    8020565e:	4581                	li	a1,0
    80205660:	8526                	mv	a0,s1
    80205662:	ffffb097          	auipc	ra,0xffffb
    80205666:	102080e7          	jalr	258(ra) # 80200764 <memset>
    strncpy(absolute_path,relative_path,strlen(relative_path));
    8020566a:	ca840913          	addi	s2,s0,-856
    8020566e:	854a                	mv	a0,s2
    80205670:	ffffb097          	auipc	ra,0xffffb
    80205674:	27c080e7          	jalr	636(ra) # 802008ec <strlen>
    80205678:	862a                	mv	a2,a0
    8020567a:	85ca                	mv	a1,s2
    8020567c:	8526                	mv	a0,s1
    8020567e:	ffffb097          	auipc	ra,0xffffb
    80205682:	1fe080e7          	jalr	510(ra) # 8020087c <strncpy>
    80205686:	b79d                	j	802055ec <sys_openat+0x162>
  else if(relative_path[0]=='.' && relative_path[1]=='/') // 为显式相对路径
    80205688:	ca944783          	lbu	a5,-855(s0)
    8020568c:	02f00713          	li	a4,47
    80205690:	00e78e63          	beq	a5,a4,802056ac <sys_openat+0x222>
  else if (relative_path[0]=='.' && relative_path[1]=='.')// 显示相对路径 没有实现
    80205694:	02e00713          	li	a4,46
    80205698:	f0e791e3          	bne	a5,a4,8020559a <sys_openat+0x110>
    panic("openat not support ..");
    8020569c:	00005517          	auipc	a0,0x5
    802056a0:	60c50513          	addi	a0,a0,1548 # 8020aca8 <digits+0x928>
    802056a4:	ffffb097          	auipc	ra,0xffffb
    802056a8:	a9e080e7          	jalr	-1378(ra) # 80200142 <panic>
    strncpy(absolute_path+strlen(absolute_path),
    802056ac:	db040913          	addi	s2,s0,-592
    802056b0:	854a                	mv	a0,s2
    802056b2:	ffffb097          	auipc	ra,0xffffb
    802056b6:	23a080e7          	jalr	570(ra) # 802008ec <strlen>
    802056ba:	84aa                	mv	s1,a0
    802056bc:	ca940993          	addi	s3,s0,-855
    802056c0:	854e                	mv	a0,s3
    802056c2:	ffffb097          	auipc	ra,0xffffb
    802056c6:	22a080e7          	jalr	554(ra) # 802008ec <strlen>
    802056ca:	862a                	mv	a2,a0
    802056cc:	85ce                	mv	a1,s3
    802056ce:	00990533          	add	a0,s2,s1
    802056d2:	ffffb097          	auipc	ra,0xffffb
    802056d6:	1aa080e7          	jalr	426(ra) # 8020087c <strncpy>
    802056da:	bf09                	j	802055ec <sys_openat+0x162>
    ep = create(absolute_path, T_FILE, omode);
    802056dc:	4589                	li	a1,2
    802056de:	db040513          	addi	a0,s0,-592
    802056e2:	fffff097          	auipc	ra,0xfffff
    802056e6:	290080e7          	jalr	656(ra) # 80204972 <create>
    802056ea:	892a                	mv	s2,a0
    if(ep == NULL){
    802056ec:	c565                	beqz	a0,802057d4 <sys_openat+0x34a>
      return -1;
    }
  }

  
  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    802056ee:	ffffe097          	auipc	ra,0xffffe
    802056f2:	612080e7          	jalr	1554(ra) # 80203d00 <filealloc>
    802056f6:	89aa                	mv	s3,a0
    802056f8:	c96d                	beqz	a0,802057ea <sys_openat+0x360>
    802056fa:	fffff097          	auipc	ra,0xfffff
    802056fe:	234080e7          	jalr	564(ra) # 8020492e <fdalloc>
    80205702:	84aa                	mv	s1,a0
    80205704:	0c054e63          	bltz	a0,802057e0 <sys_openat+0x356>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    80205708:	10094783          	lbu	a5,256(s2)
    8020570c:	8bc1                	andi	a5,a5,16
    8020570e:	e791                	bnez	a5,8020571a <sys_openat+0x290>
    80205710:	dac42783          	lw	a5,-596(s0)
    80205714:	4007f793          	andi	a5,a5,1024
    80205718:	e3c1                	bnez	a5,80205798 <sys_openat+0x30e>
    etrunc(ep);
  }

  // 设置权限
  f->type = FD_ENTRY;
    8020571a:	4789                	li	a5,2
    8020571c:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    80205720:	dac42783          	lw	a5,-596(s0)
    80205724:	0047f693          	andi	a3,a5,4
    80205728:	4701                	li	a4,0
    8020572a:	c299                	beqz	a3,80205730 <sys_openat+0x2a6>
    8020572c:	10892703          	lw	a4,264(s2)
    80205730:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    80205734:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    80205738:	0017c713          	xori	a4,a5,1
    8020573c:	8b05                	andi	a4,a4,1
    8020573e:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80205742:	8b8d                	andi	a5,a5,3
    80205744:	00f037b3          	snez	a5,a5
    80205748:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    8020574c:	854a                	mv	a0,s2
    8020574e:	00002097          	auipc	ra,0x2
    80205752:	91a080e7          	jalr	-1766(ra) # 80207068 <eunlock>

  return fd;
    80205756:	8526                	mv	a0,s1
    80205758:	a889                	j	802057aa <sys_openat+0x320>
    if((ep = ename(absolute_path)) == NULL){
    8020575a:	db040513          	addi	a0,s0,-592
    8020575e:	00002097          	auipc	ra,0x2
    80205762:	07e080e7          	jalr	126(ra) # 802077dc <ename>
    80205766:	892a                	mv	s2,a0
    80205768:	c935                	beqz	a0,802057dc <sys_openat+0x352>
    elock(ep);
    8020576a:	00002097          	auipc	ra,0x2
    8020576e:	8c8080e7          	jalr	-1848(ra) # 80207032 <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    80205772:	10094783          	lbu	a5,256(s2)
    80205776:	8bc1                	andi	a5,a5,16
    80205778:	dbbd                	beqz	a5,802056ee <sys_openat+0x264>
    8020577a:	dac42783          	lw	a5,-596(s0)
    8020577e:	dba5                	beqz	a5,802056ee <sys_openat+0x264>
      eunlock(ep);
    80205780:	854a                	mv	a0,s2
    80205782:	00002097          	auipc	ra,0x2
    80205786:	8e6080e7          	jalr	-1818(ra) # 80207068 <eunlock>
      eput(ep);
    8020578a:	854a                	mv	a0,s2
    8020578c:	00002097          	auipc	ra,0x2
    80205790:	92a080e7          	jalr	-1750(ra) # 802070b6 <eput>
      return -1;
    80205794:	557d                	li	a0,-1
    80205796:	a811                	j	802057aa <sys_openat+0x320>
    etrunc(ep);
    80205798:	854a                	mv	a0,s2
    8020579a:	00002097          	auipc	ra,0x2
    8020579e:	82e080e7          	jalr	-2002(ra) # 80206fc8 <etrunc>
    802057a2:	bfa5                	j	8020571a <sys_openat+0x290>
    return -1;
    802057a4:	557d                	li	a0,-1
    802057a6:	a011                	j	802057aa <sys_openat+0x320>
        return -1;
    802057a8:	557d                	li	a0,-1
}
    802057aa:	35813083          	ld	ra,856(sp)
    802057ae:	35013403          	ld	s0,848(sp)
    802057b2:	34813483          	ld	s1,840(sp)
    802057b6:	34013903          	ld	s2,832(sp)
    802057ba:	33813983          	ld	s3,824(sp)
    802057be:	33013a03          	ld	s4,816(sp)
    802057c2:	32813a83          	ld	s5,808(sp)
    802057c6:	36010113          	addi	sp,sp,864
    802057ca:	8082                	ret
    return -1;
    802057cc:	557d                	li	a0,-1
    802057ce:	bff1                	j	802057aa <sys_openat+0x320>
    802057d0:	557d                	li	a0,-1
    802057d2:	bfe1                	j	802057aa <sys_openat+0x320>
      return -1;
    802057d4:	557d                	li	a0,-1
    802057d6:	bfd1                	j	802057aa <sys_openat+0x320>
      return -1;
    802057d8:	557d                	li	a0,-1
    802057da:	bfc1                	j	802057aa <sys_openat+0x320>
      return -1;
    802057dc:	557d                	li	a0,-1
    802057de:	b7f1                	j	802057aa <sys_openat+0x320>
      fileclose(f);
    802057e0:	854e                	mv	a0,s3
    802057e2:	ffffe097          	auipc	ra,0xffffe
    802057e6:	5da080e7          	jalr	1498(ra) # 80203dbc <fileclose>
    eunlock(ep);
    802057ea:	854a                	mv	a0,s2
    802057ec:	00002097          	auipc	ra,0x2
    802057f0:	87c080e7          	jalr	-1924(ra) # 80207068 <eunlock>
    eput(ep);
    802057f4:	854a                	mv	a0,s2
    802057f6:	00002097          	auipc	ra,0x2
    802057fa:	8c0080e7          	jalr	-1856(ra) # 802070b6 <eput>
    return -1;
    802057fe:	557d                	li	a0,-1
    80205800:	b76d                	j	802057aa <sys_openat+0x320>

0000000080205802 <sys_mkdirat>:


// added by lmq for SYS_mkdirat
uint64
sys_mkdirat(void)
{
    80205802:	da010113          	addi	sp,sp,-608
    80205806:	24113c23          	sd	ra,600(sp)
    8020580a:	24813823          	sd	s0,592(sp)
    8020580e:	24913423          	sd	s1,584(sp)
    80205812:	25213023          	sd	s2,576(sp)
    80205816:	23313c23          	sd	s3,568(sp)
    8020581a:	23413823          	sd	s4,560(sp)
    8020581e:	23513423          	sd	s5,552(sp)
    80205822:	1480                	addi	s0,sp,608
  int dirfd,omode;
  char des_path[FAT32_MAX_PATH];
  if(argint(0, &dirfd) < 0 || argstr(1,des_path,FAT32_MAX_PATH)<0 || argint(2,&omode)<0)
    80205824:	fbc40593          	addi	a1,s0,-68
    80205828:	4501                	li	a0,0
    8020582a:	ffffd097          	auipc	ra,0xffffd
    8020582e:	6dc080e7          	jalr	1756(ra) # 80202f06 <argint>
    80205832:	20054663          	bltz	a0,80205a3e <sys_mkdirat+0x23c>
    80205836:	10400613          	li	a2,260
    8020583a:	eb040593          	addi	a1,s0,-336
    8020583e:	4505                	li	a0,1
    80205840:	ffffd097          	auipc	ra,0xffffd
    80205844:	74a080e7          	jalr	1866(ra) # 80202f8a <argstr>
    80205848:	20054d63          	bltz	a0,80205a62 <sys_mkdirat+0x260>
    8020584c:	fb840593          	addi	a1,s0,-72
    80205850:	4509                	li	a0,2
    80205852:	ffffd097          	auipc	ra,0xffffd
    80205856:	6b4080e7          	jalr	1716(ra) # 80202f06 <argint>
    8020585a:	20054663          	bltz	a0,80205a66 <sys_mkdirat+0x264>
    return -1;


  // 如果dirfd不为AT_FDCWD 则获得dirfd的路径
  char cur_path[FAT32_MAX_PATH];
  memset(cur_path,0,FAT32_MAX_PATH);
    8020585e:	10400613          	li	a2,260
    80205862:	4581                	li	a1,0
    80205864:	da840513          	addi	a0,s0,-600
    80205868:	ffffb097          	auipc	ra,0xffffb
    8020586c:	efc080e7          	jalr	-260(ra) # 80200764 <memset>
  char* s=NULL;
  int len;
  if(dirfd!=AT_FDCWD)
    80205870:	fbc42703          	lw	a4,-68(s0)
    80205874:	f9c00793          	li	a5,-100
    80205878:	10f70963          	beq	a4,a5,8020598a <sys_mkdirat+0x188>
  {
    struct dirent* de=myproc()->ofile[dirfd]->ep;
    8020587c:	ffffc097          	auipc	ra,0xffffc
    80205880:	1dc080e7          	jalr	476(ra) # 80201a58 <myproc>
    80205884:	fbc42783          	lw	a5,-68(s0)
    80205888:	07e9                	addi	a5,a5,26
    8020588a:	078e                	slli	a5,a5,0x3
    8020588c:	97aa                	add	a5,a5,a0
    8020588e:	679c                	ld	a5,8(a5)
    80205890:	6f84                	ld	s1,24(a5)
    if (de->parent == NULL) {
    80205892:	1204b783          	ld	a5,288(s1)
    80205896:	12078063          	beqz	a5,802059b6 <sys_mkdirat+0x1b4>
      s = "/";
    } 
    else {
      s = cur_path + FAT32_MAX_PATH - 1;
      *s = '\0';
    8020589a:	ea0405a3          	sb	zero,-341(s0)
      s = cur_path + FAT32_MAX_PATH - 1;
    8020589e:	eab40993          	addi	s3,s0,-341
      while (de->parent) {
        len = strlen(de->filename);
        s -= len;
        if (s <= cur_path)          // can't reach root "/"
    802058a2:	da840a13          	addi	s4,s0,-600
          return -1;
        strncpy(s, de->filename, len);
        *--s = '/';
    802058a6:	02f00a93          	li	s5,47
        len = strlen(de->filename);
    802058aa:	8526                	mv	a0,s1
    802058ac:	ffffb097          	auipc	ra,0xffffb
    802058b0:	040080e7          	jalr	64(ra) # 802008ec <strlen>
    802058b4:	862a                	mv	a2,a0
        s -= len;
    802058b6:	40a98933          	sub	s2,s3,a0
        if (s <= cur_path)          // can't reach root "/"
    802058ba:	1b2a7863          	bgeu	s4,s2,80205a6a <sys_mkdirat+0x268>
        strncpy(s, de->filename, len);
    802058be:	85a6                	mv	a1,s1
    802058c0:	854a                	mv	a0,s2
    802058c2:	ffffb097          	auipc	ra,0xffffb
    802058c6:	fba080e7          	jalr	-70(ra) # 8020087c <strncpy>
        *--s = '/';
    802058ca:	fff90993          	addi	s3,s2,-1
    802058ce:	ff590fa3          	sb	s5,-1(s2)
        de = de->parent;
    802058d2:	1204b483          	ld	s1,288(s1)
      while (de->parent) {
    802058d6:	1204b783          	ld	a5,288(s1)
    802058da:	fbe1                	bnez	a5,802058aa <sys_mkdirat+0xa8>
      }
    }
    memset(cur_path,0,FAT32_MAX_PATH);
    802058dc:	10400613          	li	a2,260
    802058e0:	4581                	li	a1,0
    802058e2:	da840493          	addi	s1,s0,-600
    802058e6:	8526                	mv	a0,s1
    802058e8:	ffffb097          	auipc	ra,0xffffb
    802058ec:	e7c080e7          	jalr	-388(ra) # 80200764 <memset>
    strncpy(cur_path,s,strlen(s));
    802058f0:	854e                	mv	a0,s3
    802058f2:	ffffb097          	auipc	ra,0xffffb
    802058f6:	ffa080e7          	jalr	-6(ra) # 802008ec <strlen>
    802058fa:	862a                	mv	a2,a0
    802058fc:	85ce                	mv	a1,s3
    802058fe:	8526                	mv	a0,s1
    80205900:	ffffb097          	auipc	ra,0xffffb
    80205904:	f7c080e7          	jalr	-132(ra) # 8020087c <strncpy>
    if(des_path[0]!='/')
    80205908:	eb044783          	lbu	a5,-336(s0)
    8020590c:	02f00713          	li	a4,47
    80205910:	06e78d63          	beq	a5,a4,8020598a <sys_mkdirat+0x188>
    {
      if(des_path[0]=='.' && des_path[1]=='/')
    80205914:	02e00713          	li	a4,46
    80205918:	0ae78463          	beq	a5,a4,802059c0 <sys_mkdirat+0x1be>
      {
        panic("mkdirat not support ..\n");
      }
      else
      {
        cur_path[strlen(cur_path)]='/';
    8020591c:	da840493          	addi	s1,s0,-600
    80205920:	8526                	mv	a0,s1
    80205922:	ffffb097          	auipc	ra,0xffffb
    80205926:	fca080e7          	jalr	-54(ra) # 802008ec <strlen>
    8020592a:	fc040793          	addi	a5,s0,-64
    8020592e:	953e                	add	a0,a0,a5
    80205930:	02f00793          	li	a5,47
    80205934:	def50423          	sb	a5,-536(a0)
        strncpy(cur_path+strlen(cur_path),des_path,strlen(des_path));
    80205938:	8526                	mv	a0,s1
    8020593a:	ffffb097          	auipc	ra,0xffffb
    8020593e:	fb2080e7          	jalr	-78(ra) # 802008ec <strlen>
    80205942:	89aa                	mv	s3,a0
    80205944:	eb040913          	addi	s2,s0,-336
    80205948:	854a                	mv	a0,s2
    8020594a:	ffffb097          	auipc	ra,0xffffb
    8020594e:	fa2080e7          	jalr	-94(ra) # 802008ec <strlen>
    80205952:	862a                	mv	a2,a0
    80205954:	85ca                	mv	a1,s2
    80205956:	01348533          	add	a0,s1,s3
    8020595a:	ffffb097          	auipc	ra,0xffffb
    8020595e:	f22080e7          	jalr	-222(ra) # 8020087c <strncpy>
        memset(des_path,0,FAT32_MAX_PATH);
    80205962:	10400613          	li	a2,260
    80205966:	4581                	li	a1,0
    80205968:	854a                	mv	a0,s2
    8020596a:	ffffb097          	auipc	ra,0xffffb
    8020596e:	dfa080e7          	jalr	-518(ra) # 80200764 <memset>
        strncpy(des_path,cur_path,strlen(cur_path));
    80205972:	8526                	mv	a0,s1
    80205974:	ffffb097          	auipc	ra,0xffffb
    80205978:	f78080e7          	jalr	-136(ra) # 802008ec <strlen>
    8020597c:	862a                	mv	a2,a0
    8020597e:	85a6                	mv	a1,s1
    80205980:	854a                	mv	a0,s2
    80205982:	ffffb097          	auipc	ra,0xffffb
    80205986:	efa080e7          	jalr	-262(ra) # 8020087c <strncpy>
    }
    
  }

  struct dirent* ep;
  if((ep = create(des_path, T_DIR, omode)) == 0)
    8020598a:	fb842603          	lw	a2,-72(s0)
    8020598e:	4585                	li	a1,1
    80205990:	eb040513          	addi	a0,s0,-336
    80205994:	fffff097          	auipc	ra,0xfffff
    80205998:	fde080e7          	jalr	-34(ra) # 80204972 <create>
    8020599c:	84aa                	mv	s1,a0
    8020599e:	c961                	beqz	a0,80205a6e <sys_mkdirat+0x26c>
  {
    return -1;
  }

  eunlock(ep);
    802059a0:	00001097          	auipc	ra,0x1
    802059a4:	6c8080e7          	jalr	1736(ra) # 80207068 <eunlock>
  eput(ep);
    802059a8:	8526                	mv	a0,s1
    802059aa:	00001097          	auipc	ra,0x1
    802059ae:	70c080e7          	jalr	1804(ra) # 802070b6 <eput>
  return 0;
    802059b2:	4501                	li	a0,0
    802059b4:	a071                	j	80205a40 <sys_mkdirat+0x23e>
      s = "/";
    802059b6:	00005997          	auipc	s3,0x5
    802059ba:	c7a98993          	addi	s3,s3,-902 # 8020a630 <digits+0x2b0>
    802059be:	bf39                	j	802058dc <sys_mkdirat+0xda>
      if(des_path[0]=='.' && des_path[1]=='/')
    802059c0:	eb144783          	lbu	a5,-335(s0)
    802059c4:	02f00713          	li	a4,47
    802059c8:	00e78e63          	beq	a5,a4,802059e4 <sys_mkdirat+0x1e2>
      else if(des_path[0]=='.' && des_path[1]=='.')
    802059cc:	02e00713          	li	a4,46
    802059d0:	f4e796e3          	bne	a5,a4,8020591c <sys_mkdirat+0x11a>
        panic("mkdirat not support ..\n");
    802059d4:	00005517          	auipc	a0,0x5
    802059d8:	2ec50513          	addi	a0,a0,748 # 8020acc0 <digits+0x940>
    802059dc:	ffffa097          	auipc	ra,0xffffa
    802059e0:	766080e7          	jalr	1894(ra) # 80200142 <panic>
        strncpy(cur_path+strlen(cur_path),des_path+1,strlen(des_path+1));
    802059e4:	8926                	mv	s2,s1
    802059e6:	8526                	mv	a0,s1
    802059e8:	ffffb097          	auipc	ra,0xffffb
    802059ec:	f04080e7          	jalr	-252(ra) # 802008ec <strlen>
    802059f0:	84aa                	mv	s1,a0
    802059f2:	eb140993          	addi	s3,s0,-335
    802059f6:	854e                	mv	a0,s3
    802059f8:	ffffb097          	auipc	ra,0xffffb
    802059fc:	ef4080e7          	jalr	-268(ra) # 802008ec <strlen>
    80205a00:	862a                	mv	a2,a0
    80205a02:	85ce                	mv	a1,s3
    80205a04:	00990533          	add	a0,s2,s1
    80205a08:	ffffb097          	auipc	ra,0xffffb
    80205a0c:	e74080e7          	jalr	-396(ra) # 8020087c <strncpy>
        memset(des_path,0,FAT32_MAX_PATH);
    80205a10:	10400613          	li	a2,260
    80205a14:	4581                	li	a1,0
    80205a16:	eb040493          	addi	s1,s0,-336
    80205a1a:	8526                	mv	a0,s1
    80205a1c:	ffffb097          	auipc	ra,0xffffb
    80205a20:	d48080e7          	jalr	-696(ra) # 80200764 <memset>
        strncpy(des_path,cur_path,strlen(cur_path));
    80205a24:	854a                	mv	a0,s2
    80205a26:	ffffb097          	auipc	ra,0xffffb
    80205a2a:	ec6080e7          	jalr	-314(ra) # 802008ec <strlen>
    80205a2e:	862a                	mv	a2,a0
    80205a30:	85ca                	mv	a1,s2
    80205a32:	8526                	mv	a0,s1
    80205a34:	ffffb097          	auipc	ra,0xffffb
    80205a38:	e48080e7          	jalr	-440(ra) # 8020087c <strncpy>
    80205a3c:	b7b9                	j	8020598a <sys_mkdirat+0x188>
    return -1;
    80205a3e:	557d                	li	a0,-1
}
    80205a40:	25813083          	ld	ra,600(sp)
    80205a44:	25013403          	ld	s0,592(sp)
    80205a48:	24813483          	ld	s1,584(sp)
    80205a4c:	24013903          	ld	s2,576(sp)
    80205a50:	23813983          	ld	s3,568(sp)
    80205a54:	23013a03          	ld	s4,560(sp)
    80205a58:	22813a83          	ld	s5,552(sp)
    80205a5c:	26010113          	addi	sp,sp,608
    80205a60:	8082                	ret
    return -1;
    80205a62:	557d                	li	a0,-1
    80205a64:	bff1                	j	80205a40 <sys_mkdirat+0x23e>
    80205a66:	557d                	li	a0,-1
    80205a68:	bfe1                	j	80205a40 <sys_mkdirat+0x23e>
          return -1;
    80205a6a:	557d                	li	a0,-1
    80205a6c:	bfd1                	j	80205a40 <sys_mkdirat+0x23e>
    return -1;
    80205a6e:	557d                	li	a0,-1
    80205a70:	bfc1                	j	80205a40 <sys_mkdirat+0x23e>

0000000080205a72 <sys_dup3>:

// added by lmq for SYS_dup3
uint64
sys_dup3(void)
{
    80205a72:	7179                	addi	sp,sp,-48
    80205a74:	f406                	sd	ra,40(sp)
    80205a76:	f022                	sd	s0,32(sp)
    80205a78:	ec26                	sd	s1,24(sp)
    80205a7a:	1800                	addi	s0,sp,48
  struct file *f;
  int new_fd;
  struct proc* p=myproc();
    80205a7c:	ffffc097          	auipc	ra,0xffffc
    80205a80:	fdc080e7          	jalr	-36(ra) # 80201a58 <myproc>
    80205a84:	84aa                	mv	s1,a0

  if(argfd(0, 0, &f) < 0 || argint(1,&new_fd)<0)
    80205a86:	fd840613          	addi	a2,s0,-40
    80205a8a:	4581                	li	a1,0
    80205a8c:	4501                	li	a0,0
    80205a8e:	fffff097          	auipc	ra,0xfffff
    80205a92:	e36080e7          	jalr	-458(ra) # 802048c4 <argfd>
    return -1;
    80205a96:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(1,&new_fd)<0)
    80205a98:	02054263          	bltz	a0,80205abc <sys_dup3+0x4a>
    80205a9c:	fd440593          	addi	a1,s0,-44
    80205aa0:	4505                	li	a0,1
    80205aa2:	ffffd097          	auipc	ra,0xffffd
    80205aa6:	464080e7          	jalr	1124(ra) # 80202f06 <argint>
    80205aaa:	02054963          	bltz	a0,80205adc <sys_dup3+0x6a>
  if(p->ofile[new_fd]!=0)        // 文件描述符[new_fd]已被占用
    80205aae:	fd442503          	lw	a0,-44(s0)
    80205ab2:	050e                	slli	a0,a0,0x3
    80205ab4:	94aa                	add	s1,s1,a0
    80205ab6:	6cf8                	ld	a4,216(s1)
  {
    return -1;
    80205ab8:	57fd                	li	a5,-1
  if(p->ofile[new_fd]!=0)        // 文件描述符[new_fd]已被占用
    80205aba:	c719                	beqz	a4,80205ac8 <sys_dup3+0x56>
  }
  p->ofile[new_fd] = f;
  filedup(f);
  return new_fd;
}
    80205abc:	853e                	mv	a0,a5
    80205abe:	70a2                	ld	ra,40(sp)
    80205ac0:	7402                	ld	s0,32(sp)
    80205ac2:	64e2                	ld	s1,24(sp)
    80205ac4:	6145                	addi	sp,sp,48
    80205ac6:	8082                	ret
  p->ofile[new_fd] = f;
    80205ac8:	fd843503          	ld	a0,-40(s0)
    80205acc:	ece8                	sd	a0,216(s1)
  filedup(f);
    80205ace:	ffffe097          	auipc	ra,0xffffe
    80205ad2:	29c080e7          	jalr	668(ra) # 80203d6a <filedup>
  return new_fd;
    80205ad6:	fd442783          	lw	a5,-44(s0)
    80205ada:	b7cd                	j	80205abc <sys_dup3+0x4a>
    return -1;
    80205adc:	57fd                	li	a5,-1
    80205ade:	bff9                	j	80205abc <sys_dup3+0x4a>

0000000080205ae0 <sys_getdents64>:
  unsigned char   d_type;	    // 文件类型    
  char            d_name[];	  // 文件名
};
uint64 
sys_getdents64(void)
{
    80205ae0:	7139                	addi	sp,sp,-64
    80205ae2:	fc06                	sd	ra,56(sp)
    80205ae4:	f822                	sd	s0,48(sp)
    80205ae6:	f426                	sd	s1,40(sp)
    80205ae8:	0080                	addi	s0,sp,64
  int fd,len;                   // fd:要读取的目录的文件描述符
  struct file* f;
  struct linux_dirent64* dirp64;// dirp64:存储信息的地址

  if(argfd(0,&fd,&f)<0 || argaddr(1,(uint64*)&dirp64)<0 || argint(2,&len))
    80205aea:	fd040613          	addi	a2,s0,-48
    80205aee:	fdc40593          	addi	a1,s0,-36
    80205af2:	4501                	li	a0,0
    80205af4:	fffff097          	auipc	ra,0xfffff
    80205af8:	dd0080e7          	jalr	-560(ra) # 802048c4 <argfd>
  {
    return -1;
    80205afc:	57fd                	li	a5,-1
  if(argfd(0,&fd,&f)<0 || argaddr(1,(uint64*)&dirp64)<0 || argint(2,&len))
    80205afe:	08054163          	bltz	a0,80205b80 <sys_getdents64+0xa0>
    80205b02:	fc840593          	addi	a1,s0,-56
    80205b06:	4505                	li	a0,1
    80205b08:	ffffd097          	auipc	ra,0xffffd
    80205b0c:	460080e7          	jalr	1120(ra) # 80202f68 <argaddr>
    return -1;
    80205b10:	57fd                	li	a5,-1
  if(argfd(0,&fd,&f)<0 || argaddr(1,(uint64*)&dirp64)<0 || argint(2,&len))
    80205b12:	06054763          	bltz	a0,80205b80 <sys_getdents64+0xa0>
    80205b16:	fd840593          	addi	a1,s0,-40
    80205b1a:	4509                	li	a0,2
    80205b1c:	ffffd097          	auipc	ra,0xffffd
    80205b20:	3ea080e7          	jalr	1002(ra) # 80202f06 <argint>
    return -1;
    80205b24:	57fd                	li	a5,-1
  if(argfd(0,&fd,&f)<0 || argaddr(1,(uint64*)&dirp64)<0 || argint(2,&len))
    80205b26:	ed29                	bnez	a0,80205b80 <sys_getdents64+0xa0>
  }
  int filename_len=strlen(f->ep->filename);
    80205b28:	fd043783          	ld	a5,-48(s0)
    80205b2c:	6f88                	ld	a0,24(a5)
    80205b2e:	ffffb097          	auipc	ra,0xffffb
    80205b32:	dbe080e7          	jalr	-578(ra) # 802008ec <strlen>
    80205b36:	84aa                	mv	s1,a0
  if(filename_len>len)
    80205b38:	fd842703          	lw	a4,-40(s0)
  {
    return -1;
    80205b3c:	57fd                	li	a5,-1
  if(filename_len>len)
    80205b3e:	04a74163          	blt	a4,a0,80205b80 <sys_getdents64+0xa0>
  }
  if(f->ep->parent==NULL)   // this direntry is root
    80205b42:	fd043783          	ld	a5,-48(s0)
    80205b46:	6f8c                	ld	a1,24(a5)
    80205b48:	1205b783          	ld	a5,288(a1) # ffffffffffffe120 <kernel_end+0xffffffff7fdc9120>
    80205b4c:	c3a1                	beqz	a5,80205b8c <sys_getdents64+0xac>
  {
    if(copyout2((uint64)dirp64->d_name, "/", 1) < 0 ||
      copyout2((uint64)&(dirp64->d_type),(char*)&f->type,sizeof(f->type) < 0 ))
    return -1;
  }
  else if(copyout2((uint64)dirp64->d_name, f->ep->filename, filename_len) < 0 ||
    80205b4e:	862a                	mv	a2,a0
    80205b50:	fc843503          	ld	a0,-56(s0)
    80205b54:	054d                	addi	a0,a0,19
    80205b56:	ffffc097          	auipc	ra,0xffffc
    80205b5a:	826080e7          	jalr	-2010(ra) # 8020137c <copyout2>
        copyout2((uint64)&(dirp64->d_type),(char*)&f->type,sizeof(f->type) < 0 ))
    return -1;
    80205b5e:	57fd                	li	a5,-1
  else if(copyout2((uint64)dirp64->d_name, f->ep->filename, filename_len) < 0 ||
    80205b60:	02054063          	bltz	a0,80205b80 <sys_getdents64+0xa0>
        copyout2((uint64)&(dirp64->d_type),(char*)&f->type,sizeof(f->type) < 0 ))
    80205b64:	4601                	li	a2,0
    80205b66:	fd043583          	ld	a1,-48(s0)
    80205b6a:	fc843503          	ld	a0,-56(s0)
    80205b6e:	0549                	addi	a0,a0,18
    80205b70:	ffffc097          	auipc	ra,0xffffc
    80205b74:	80c080e7          	jalr	-2036(ra) # 8020137c <copyout2>
    return -1;
    80205b78:	57fd                	li	a5,-1
  else if(copyout2((uint64)dirp64->d_name, f->ep->filename, filename_len) < 0 ||
    80205b7a:	e119                	bnez	a0,80205b80 <sys_getdents64+0xa0>

  return filename_len+sizeof(f->type);
    80205b7c:	00448793          	addi	a5,s1,4
}
    80205b80:	853e                	mv	a0,a5
    80205b82:	70e2                	ld	ra,56(sp)
    80205b84:	7442                	ld	s0,48(sp)
    80205b86:	74a2                	ld	s1,40(sp)
    80205b88:	6121                	addi	sp,sp,64
    80205b8a:	8082                	ret
    if(copyout2((uint64)dirp64->d_name, "/", 1) < 0 ||
    80205b8c:	4605                	li	a2,1
    80205b8e:	00005597          	auipc	a1,0x5
    80205b92:	aa258593          	addi	a1,a1,-1374 # 8020a630 <digits+0x2b0>
    80205b96:	fc843503          	ld	a0,-56(s0)
    80205b9a:	054d                	addi	a0,a0,19
    80205b9c:	ffffb097          	auipc	ra,0xffffb
    80205ba0:	7e0080e7          	jalr	2016(ra) # 8020137c <copyout2>
    return -1;
    80205ba4:	57fd                	li	a5,-1
    if(copyout2((uint64)dirp64->d_name, "/", 1) < 0 ||
    80205ba6:	fc054de3          	bltz	a0,80205b80 <sys_getdents64+0xa0>
      copyout2((uint64)&(dirp64->d_type),(char*)&f->type,sizeof(f->type) < 0 ))
    80205baa:	4601                	li	a2,0
    80205bac:	fd043583          	ld	a1,-48(s0)
    80205bb0:	fc843503          	ld	a0,-56(s0)
    80205bb4:	0549                	addi	a0,a0,18
    80205bb6:	ffffb097          	auipc	ra,0xffffb
    80205bba:	7c6080e7          	jalr	1990(ra) # 8020137c <copyout2>
    return -1;
    80205bbe:	57fd                	li	a5,-1
    if(copyout2((uint64)dirp64->d_name, "/", 1) < 0 ||
    80205bc0:	dd55                	beqz	a0,80205b7c <sys_getdents64+0x9c>
    80205bc2:	bf7d                	j	80205b80 <sys_getdents64+0xa0>

0000000080205bc4 <sys_fstat_cscc>:
        long st_ctime_nsec;
        unsigned __unused[2];
};
uint64
sys_fstat_cscc(void)
{
    80205bc4:	7135                	addi	sp,sp,-160
    80205bc6:	ed06                	sd	ra,152(sp)
    80205bc8:	e922                	sd	s0,144(sp)
    80205bca:	1100                	addi	s0,sp,160
  struct file* f;
  uint64 addr;
  if(argfd(0,0,&f)<0 || argaddr(1,&addr)<0)
    80205bcc:	fe840613          	addi	a2,s0,-24
    80205bd0:	4581                	li	a1,0
    80205bd2:	4501                	li	a0,0
    80205bd4:	fffff097          	auipc	ra,0xfffff
    80205bd8:	cf0080e7          	jalr	-784(ra) # 802048c4 <argfd>
    80205bdc:	87aa                	mv	a5,a0
  {
    return -1;
    80205bde:	557d                	li	a0,-1
  if(argfd(0,0,&f)<0 || argaddr(1,&addr)<0)
    80205be0:	0207c263          	bltz	a5,80205c04 <sys_fstat_cscc+0x40>
    80205be4:	fe040593          	addi	a1,s0,-32
    80205be8:	4505                	li	a0,1
    80205bea:	ffffd097          	auipc	ra,0xffffd
    80205bee:	37e080e7          	jalr	894(ra) # 80202f68 <argaddr>
    80205bf2:	08054d63          	bltz	a0,80205c8c <sys_fstat_cscc+0xc8>
  }

  struct kstat st;
  if(f->type!=FD_ENTRY)
    80205bf6:	fe843783          	ld	a5,-24(s0)
    80205bfa:	4394                	lw	a3,0(a5)
    80205bfc:	4709                	li	a4,2
    return -1;
    80205bfe:	557d                	li	a0,-1
  if(f->type!=FD_ENTRY)
    80205c00:	00e68663          	beq	a3,a4,80205c0c <sys_fstat_cscc+0x48>
  st.st_ctime_sec=0;
  eunlock(f->ep);
  if((copyout2(addr,(char*)&st,sizeof(struct kstat)))<0)
    return -1;
  return 0;
}
    80205c04:	60ea                	ld	ra,152(sp)
    80205c06:	644a                	ld	s0,144(sp)
    80205c08:	610d                	addi	sp,sp,160
    80205c0a:	8082                	ret
  elock(f->ep);
    80205c0c:	6f88                	ld	a0,24(a5)
    80205c0e:	00001097          	auipc	ra,0x1
    80205c12:	424080e7          	jalr	1060(ra) # 80207032 <elock>
  st.st_dev=f->ep->dev;
    80205c16:	fe843783          	ld	a5,-24(s0)
    80205c1a:	6f98                	ld	a4,24(a5)
    80205c1c:	11474703          	lbu	a4,276(a4)
    80205c20:	f6e43023          	sd	a4,-160(s0)
  st.st_ino=0;
    80205c24:	f6043423          	sd	zero,-152(s0)
  st.st_mode=f->type;
    80205c28:	4398                	lw	a4,0(a5)
    80205c2a:	f6e42823          	sw	a4,-144(s0)
  st.st_nlink=f->ref;
    80205c2e:	43d8                	lw	a4,4(a5)
    80205c30:	f6e42a23          	sw	a4,-140(s0)
  st.st_gid=0;
    80205c34:	f6042e23          	sw	zero,-132(s0)
  st.st_uid=0;
    80205c38:	f6042c23          	sw	zero,-136(s0)
  st.st_rdev=0;
    80205c3c:	f8043023          	sd	zero,-128(s0)
  st.st_size=f->ep->file_size;
    80205c40:	6f98                	ld	a4,24(a5)
    80205c42:	10876703          	lwu	a4,264(a4)
    80205c46:	f8e43823          	sd	a4,-112(s0)
  st.st_blocks=0;
    80205c4a:	fa043023          	sd	zero,-96(s0)
  st.st_blksize=0;
    80205c4e:	f8042c23          	sw	zero,-104(s0)
  st.st_atime_sec=0;
    80205c52:	fa043423          	sd	zero,-88(s0)
  st.st_atime_nsec=0;
    80205c56:	fa043823          	sd	zero,-80(s0)
  st.st_mtime_nsec=0;
    80205c5a:	fc043023          	sd	zero,-64(s0)
  st.st_mtime_sec=0;
    80205c5e:	fa043c23          	sd	zero,-72(s0)
  st.st_ctime_nsec=0;
    80205c62:	fc043823          	sd	zero,-48(s0)
  st.st_ctime_sec=0;
    80205c66:	fc043423          	sd	zero,-56(s0)
  eunlock(f->ep);
    80205c6a:	6f88                	ld	a0,24(a5)
    80205c6c:	00001097          	auipc	ra,0x1
    80205c70:	3fc080e7          	jalr	1020(ra) # 80207068 <eunlock>
  if((copyout2(addr,(char*)&st,sizeof(struct kstat)))<0)
    80205c74:	08000613          	li	a2,128
    80205c78:	f6040593          	addi	a1,s0,-160
    80205c7c:	fe043503          	ld	a0,-32(s0)
    80205c80:	ffffb097          	auipc	ra,0xffffb
    80205c84:	6fc080e7          	jalr	1788(ra) # 8020137c <copyout2>
    80205c88:	957d                	srai	a0,a0,0x3f
    80205c8a:	bfad                	j	80205c04 <sys_fstat_cscc+0x40>
    return -1;
    80205c8c:	557d                	li	a0,-1
    80205c8e:	bf9d                	j	80205c04 <sys_fstat_cscc+0x40>

0000000080205c90 <sys_linkat>:

// lzq link
uint64
sys_linkat(void){
    80205c90:	1141                	addi	sp,sp,-16
    80205c92:	e422                	sd	s0,8(sp)
    80205c94:	0800                	addi	s0,sp,16
//    if(argstr(1, path, FAT32_MAX_PATH) < 0)
//        return -1;
//    if((ep = ename(path)) == NULL)
//        return -1;
    return 0;
}
    80205c96:	4501                	li	a0,0
    80205c98:	6422                	ld	s0,8(sp)
    80205c9a:	0141                	addi	sp,sp,16
    80205c9c:	8082                	ret

0000000080205c9e <sys_unlink>:
uint64
sys_unlink(void){
    80205c9e:	dd010113          	addi	sp,sp,-560
    80205ca2:	22113423          	sd	ra,552(sp)
    80205ca6:	22813023          	sd	s0,544(sp)
    80205caa:	20913c23          	sd	s1,536(sp)
    80205cae:	21213823          	sd	s2,528(sp)
    80205cb2:	1c00                	addi	s0,sp,560
    char path[FAT32_MAX_PATH];// file
    char name[FAT32_MAX_FILENAME + 1];//dir name
    struct dirent *ep,*dp;
    if(argstr(1, path, FAT32_MAX_PATH) < 0)
    80205cb4:	10400613          	li	a2,260
    80205cb8:	ed840593          	addi	a1,s0,-296
    80205cbc:	4505                	li	a0,1
    80205cbe:	ffffd097          	auipc	ra,0xffffd
    80205cc2:	2cc080e7          	jalr	716(ra) # 80202f8a <argstr>
        return -1;
    80205cc6:	57fd                	li	a5,-1
    if(argstr(1, path, FAT32_MAX_PATH) < 0)
    80205cc8:	06054263          	bltz	a0,80205d2c <sys_unlink+0x8e>
    if((ep = ename(path)) == NULL)
    80205ccc:	ed840513          	addi	a0,s0,-296
    80205cd0:	00002097          	auipc	ra,0x2
    80205cd4:	b0c080e7          	jalr	-1268(ra) # 802077dc <ename>
    80205cd8:	84aa                	mv	s1,a0
    80205cda:	c52d                	beqz	a0,80205d44 <sys_unlink+0xa6>
        return -1;
    if((dp = enameparent(path, name)) == NULL)
    80205cdc:	dd840593          	addi	a1,s0,-552
    80205ce0:	ed840513          	addi	a0,s0,-296
    80205ce4:	00002097          	auipc	ra,0x2
    80205ce8:	b16080e7          	jalr	-1258(ra) # 802077fa <enameparent>
    80205cec:	892a                	mv	s2,a0
    80205cee:	cd29                	beqz	a0,80205d48 <sys_unlink+0xaa>
        return -1;
    elock(dp);
    80205cf0:	00001097          	auipc	ra,0x1
    80205cf4:	342080e7          	jalr	834(ra) # 80207032 <elock>
    elock(ep);
    80205cf8:	8526                	mv	a0,s1
    80205cfa:	00001097          	auipc	ra,0x1
    80205cfe:	338080e7          	jalr	824(ra) # 80207032 <elock>
    eremove(ep);
    80205d02:	8526                	mv	a0,s1
    80205d04:	00001097          	auipc	ra,0x1
    80205d08:	1fa080e7          	jalr	506(ra) # 80206efe <eremove>
    eunlock(ep);
    80205d0c:	8526                	mv	a0,s1
    80205d0e:	00001097          	auipc	ra,0x1
    80205d12:	35a080e7          	jalr	858(ra) # 80207068 <eunlock>
    eunlock(dp);
    80205d16:	854a                	mv	a0,s2
    80205d18:	00001097          	auipc	ra,0x1
    80205d1c:	350080e7          	jalr	848(ra) # 80207068 <eunlock>
    eput(dp);
    80205d20:	854a                	mv	a0,s2
    80205d22:	00001097          	auipc	ra,0x1
    80205d26:	394080e7          	jalr	916(ra) # 802070b6 <eput>
    return 0;
    80205d2a:	4781                	li	a5,0
}
    80205d2c:	853e                	mv	a0,a5
    80205d2e:	22813083          	ld	ra,552(sp)
    80205d32:	22013403          	ld	s0,544(sp)
    80205d36:	21813483          	ld	s1,536(sp)
    80205d3a:	21013903          	ld	s2,528(sp)
    80205d3e:	23010113          	addi	sp,sp,560
    80205d42:	8082                	ret
        return -1;
    80205d44:	57fd                	li	a5,-1
    80205d46:	b7dd                	j	80205d2c <sys_unlink+0x8e>
        return -1;
    80205d48:	57fd                	li	a5,-1
    80205d4a:	b7cd                	j	80205d2c <sys_unlink+0x8e>

0000000080205d4c <sys_mount>:

uint64
sys_mount(void)
{
    80205d4c:	1141                	addi	sp,sp,-16
    80205d4e:	e422                	sd	s0,8(sp)
    80205d50:	0800                	addi	s0,sp,16
  return 0;
}
    80205d52:	4501                	li	a0,0
    80205d54:	6422                	ld	s0,8(sp)
    80205d56:	0141                	addi	sp,sp,16
    80205d58:	8082                	ret

0000000080205d5a <sys_umount2>:


uint64 
sys_umount2(void)
{
    80205d5a:	1141                	addi	sp,sp,-16
    80205d5c:	e422                	sd	s0,8(sp)
    80205d5e:	0800                	addi	s0,sp,16
  return 0;
    80205d60:	4501                	li	a0,0
    80205d62:	6422                	ld	s0,8(sp)
    80205d64:	0141                	addi	sp,sp,16
    80205d66:	8082                	ret
	...

0000000080205d70 <kernelvec>:
    80205d70:	7111                	addi	sp,sp,-256
    80205d72:	e006                	sd	ra,0(sp)
    80205d74:	e40a                	sd	sp,8(sp)
    80205d76:	e80e                	sd	gp,16(sp)
    80205d78:	ec12                	sd	tp,24(sp)
    80205d7a:	f016                	sd	t0,32(sp)
    80205d7c:	f41a                	sd	t1,40(sp)
    80205d7e:	f81e                	sd	t2,48(sp)
    80205d80:	fc22                	sd	s0,56(sp)
    80205d82:	e0a6                	sd	s1,64(sp)
    80205d84:	e4aa                	sd	a0,72(sp)
    80205d86:	e8ae                	sd	a1,80(sp)
    80205d88:	ecb2                	sd	a2,88(sp)
    80205d8a:	f0b6                	sd	a3,96(sp)
    80205d8c:	f4ba                	sd	a4,104(sp)
    80205d8e:	f8be                	sd	a5,112(sp)
    80205d90:	fcc2                	sd	a6,120(sp)
    80205d92:	e146                	sd	a7,128(sp)
    80205d94:	e54a                	sd	s2,136(sp)
    80205d96:	e94e                	sd	s3,144(sp)
    80205d98:	ed52                	sd	s4,152(sp)
    80205d9a:	f156                	sd	s5,160(sp)
    80205d9c:	f55a                	sd	s6,168(sp)
    80205d9e:	f95e                	sd	s7,176(sp)
    80205da0:	fd62                	sd	s8,184(sp)
    80205da2:	e1e6                	sd	s9,192(sp)
    80205da4:	e5ea                	sd	s10,200(sp)
    80205da6:	e9ee                	sd	s11,208(sp)
    80205da8:	edf2                	sd	t3,216(sp)
    80205daa:	f1f6                	sd	t4,224(sp)
    80205dac:	f5fa                	sd	t5,232(sp)
    80205dae:	f9fe                	sd	t6,240(sp)
    80205db0:	cd9fc0ef          	jal	ra,80202a88 <kerneltrap>
    80205db4:	6082                	ld	ra,0(sp)
    80205db6:	6122                	ld	sp,8(sp)
    80205db8:	61c2                	ld	gp,16(sp)
    80205dba:	7282                	ld	t0,32(sp)
    80205dbc:	7322                	ld	t1,40(sp)
    80205dbe:	73c2                	ld	t2,48(sp)
    80205dc0:	7462                	ld	s0,56(sp)
    80205dc2:	6486                	ld	s1,64(sp)
    80205dc4:	6526                	ld	a0,72(sp)
    80205dc6:	65c6                	ld	a1,80(sp)
    80205dc8:	6666                	ld	a2,88(sp)
    80205dca:	7686                	ld	a3,96(sp)
    80205dcc:	7726                	ld	a4,104(sp)
    80205dce:	77c6                	ld	a5,112(sp)
    80205dd0:	7866                	ld	a6,120(sp)
    80205dd2:	688a                	ld	a7,128(sp)
    80205dd4:	692a                	ld	s2,136(sp)
    80205dd6:	69ca                	ld	s3,144(sp)
    80205dd8:	6a6a                	ld	s4,152(sp)
    80205dda:	7a8a                	ld	s5,160(sp)
    80205ddc:	7b2a                	ld	s6,168(sp)
    80205dde:	7bca                	ld	s7,176(sp)
    80205de0:	7c6a                	ld	s8,184(sp)
    80205de2:	6c8e                	ld	s9,192(sp)
    80205de4:	6d2e                	ld	s10,200(sp)
    80205de6:	6dce                	ld	s11,208(sp)
    80205de8:	6e6e                	ld	t3,216(sp)
    80205dea:	7e8e                	ld	t4,224(sp)
    80205dec:	7f2e                	ld	t5,232(sp)
    80205dee:	7fce                	ld	t6,240(sp)
    80205df0:	6111                	addi	sp,sp,256
    80205df2:	10200073          	sret
	...

0000000080205dfe <timerinit>:
#include "include/proc.h"

struct spinlock tickslock;
uint ticks;

void timerinit() {
    80205dfe:	1141                	addi	sp,sp,-16
    80205e00:	e406                	sd	ra,8(sp)
    80205e02:	e022                	sd	s0,0(sp)
    80205e04:	0800                	addi	s0,sp,16
    initlock(&tickslock, "time");
    80205e06:	00005597          	auipc	a1,0x5
    80205e0a:	ed258593          	addi	a1,a1,-302 # 8020acd8 <digits+0x958>
    80205e0e:	00026517          	auipc	a0,0x26
    80205e12:	95a50513          	addi	a0,a0,-1702 # 8022b768 <tickslock>
    80205e16:	ffffb097          	auipc	ra,0xffffb
    80205e1a:	86e080e7          	jalr	-1938(ra) # 80200684 <initlock>
    #ifdef DEBUG
    printf("timerinit\n");
    #endif
}
    80205e1e:	60a2                	ld	ra,8(sp)
    80205e20:	6402                	ld	s0,0(sp)
    80205e22:	0141                	addi	sp,sp,16
    80205e24:	8082                	ret

0000000080205e26 <set_next_timeout>:

void
set_next_timeout() {
    80205e26:	1141                	addi	sp,sp,-16
    80205e28:	e422                	sd	s0,8(sp)
    80205e2a:	0800                	addi	s0,sp,16
  asm volatile("rdtime %0" : "=r" (x) );
    80205e2c:	c0102573          	rdtime	a0
    // if comment the `printf` line below
    // the timer will not work.

    // this bug seems to disappear automatically
    // printf("");
    sbi_set_timer(r_time() + INTERVAL);
    80205e30:	000307b7          	lui	a5,0x30
    80205e34:	9b878793          	addi	a5,a5,-1608 # 2f9b8 <_entry-0x801d0648>
    80205e38:	953e                	add	a0,a0,a5
	SBI_CALL_1(SBI_SET_TIMER, stime_value);
    80205e3a:	4581                	li	a1,0
    80205e3c:	4601                	li	a2,0
    80205e3e:	4681                	li	a3,0
    80205e40:	4881                	li	a7,0
    80205e42:	00000073          	ecall
}
    80205e46:	6422                	ld	s0,8(sp)
    80205e48:	0141                	addi	sp,sp,16
    80205e4a:	8082                	ret

0000000080205e4c <timer_tick>:

void timer_tick() {
    80205e4c:	1101                	addi	sp,sp,-32
    80205e4e:	ec06                	sd	ra,24(sp)
    80205e50:	e822                	sd	s0,16(sp)
    80205e52:	e426                	sd	s1,8(sp)
    80205e54:	1000                	addi	s0,sp,32
    acquire(&tickslock);
    80205e56:	00026497          	auipc	s1,0x26
    80205e5a:	91248493          	addi	s1,s1,-1774 # 8022b768 <tickslock>
    80205e5e:	8526                	mv	a0,s1
    80205e60:	ffffb097          	auipc	ra,0xffffb
    80205e64:	868080e7          	jalr	-1944(ra) # 802006c8 <acquire>
    ticks++;
    80205e68:	4c9c                	lw	a5,24(s1)
    80205e6a:	2785                	addiw	a5,a5,1
    80205e6c:	cc9c                	sw	a5,24(s1)
    wakeup(&ticks);
    80205e6e:	00026517          	auipc	a0,0x26
    80205e72:	91250513          	addi	a0,a0,-1774 # 8022b780 <ticks>
    80205e76:	ffffc097          	auipc	ra,0xffffc
    80205e7a:	5be080e7          	jalr	1470(ra) # 80202434 <wakeup>
    release(&tickslock);
    80205e7e:	8526                	mv	a0,s1
    80205e80:	ffffb097          	auipc	ra,0xffffb
    80205e84:	89c080e7          	jalr	-1892(ra) # 8020071c <release>
    set_next_timeout();
    80205e88:	00000097          	auipc	ra,0x0
    80205e8c:	f9e080e7          	jalr	-98(ra) # 80205e26 <set_next_timeout>
}
    80205e90:	60e2                	ld	ra,24(sp)
    80205e92:	6442                	ld	s0,16(sp)
    80205e94:	64a2                	ld	s1,8(sp)
    80205e96:	6105                	addi	sp,sp,32
    80205e98:	8082                	ret

0000000080205e9a <disk_init>:
#else
#include "include/virtio.h"
#endif 

void disk_init(void)
{
    80205e9a:	1141                	addi	sp,sp,-16
    80205e9c:	e406                	sd	ra,8(sp)
    80205e9e:	e022                	sd	s0,0(sp)
    80205ea0:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_init();
    80205ea2:	00002097          	auipc	ra,0x2
    80205ea6:	e82080e7          	jalr	-382(ra) # 80207d24 <virtio_disk_init>
	#else 
	sdcard_init();
    #endif
}
    80205eaa:	60a2                	ld	ra,8(sp)
    80205eac:	6402                	ld	s0,0(sp)
    80205eae:	0141                	addi	sp,sp,16
    80205eb0:	8082                	ret

0000000080205eb2 <disk_read>:

void disk_read(struct buf *b)
{
    80205eb2:	1141                	addi	sp,sp,-16
    80205eb4:	e406                	sd	ra,8(sp)
    80205eb6:	e022                	sd	s0,0(sp)
    80205eb8:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 0);
    80205eba:	4581                	li	a1,0
    80205ebc:	00002097          	auipc	ra,0x2
    80205ec0:	ff0080e7          	jalr	-16(ra) # 80207eac <virtio_disk_rw>
    #else 
	sdcard_read_sector(b->data, b->sectorno);
	#endif
}
    80205ec4:	60a2                	ld	ra,8(sp)
    80205ec6:	6402                	ld	s0,0(sp)
    80205ec8:	0141                	addi	sp,sp,16
    80205eca:	8082                	ret

0000000080205ecc <disk_write>:

void disk_write(struct buf *b)
{
    80205ecc:	1141                	addi	sp,sp,-16
    80205ece:	e406                	sd	ra,8(sp)
    80205ed0:	e022                	sd	s0,0(sp)
    80205ed2:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 1);
    80205ed4:	4585                	li	a1,1
    80205ed6:	00002097          	auipc	ra,0x2
    80205eda:	fd6080e7          	jalr	-42(ra) # 80207eac <virtio_disk_rw>
    #else 
	sdcard_write_sector(b->data, b->sectorno);
	#endif
}
    80205ede:	60a2                	ld	ra,8(sp)
    80205ee0:	6402                	ld	s0,0(sp)
    80205ee2:	0141                	addi	sp,sp,16
    80205ee4:	8082                	ret

0000000080205ee6 <disk_intr>:

void disk_intr(void)
{
    80205ee6:	1141                	addi	sp,sp,-16
    80205ee8:	e406                	sd	ra,8(sp)
    80205eea:	e022                	sd	s0,0(sp)
    80205eec:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_intr();
    80205eee:	00002097          	auipc	ra,0x2
    80205ef2:	26c080e7          	jalr	620(ra) # 8020815a <virtio_disk_intr>
    #else 
    dmac_intr(DMAC_CHANNEL0);
    #endif
}
    80205ef6:	60a2                	ld	ra,8(sp)
    80205ef8:	6402                	ld	s0,0(sp)
    80205efa:	0141                	addi	sp,sp,16
    80205efc:	8082                	ret

0000000080205efe <read_fat>:
/**
 * Read the FAT table content corresponded to the given cluster number.
 * @param   cluster     the number of cluster which you want to read its content in FAT table
 */
static uint32 read_fat(uint32 cluster)
{
    80205efe:	1101                	addi	sp,sp,-32
    80205f00:	ec06                	sd	ra,24(sp)
    80205f02:	e822                	sd	s0,16(sp)
    80205f04:	e426                	sd	s1,8(sp)
    80205f06:	e04a                	sd	s2,0(sp)
    80205f08:	1000                	addi	s0,sp,32
    if (cluster >= FAT32_EOC) {
    80205f0a:	100007b7          	lui	a5,0x10000
    80205f0e:	17dd                	addi	a5,a5,-9
        return cluster;
    80205f10:	84aa                	mv	s1,a0
    if (cluster >= FAT32_EOC) {
    80205f12:	00a7ea63          	bltu	a5,a0,80205f26 <read_fat+0x28>
    }
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205f16:	00026797          	auipc	a5,0x26
    80205f1a:	87a7a783          	lw	a5,-1926(a5) # 8022b790 <fat+0x8>
    80205f1e:	2785                	addiw	a5,a5,1
        return 0;
    80205f20:	4481                	li	s1,0
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205f22:	00a7f963          	bgeu	a5,a0,80205f34 <read_fat+0x36>
    // here should be a cache layer for FAT table, but not implemented yet.
    struct buf *b = bread(0, fat_sec);
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    brelse(b);
    return next_clus;
}
    80205f26:	8526                	mv	a0,s1
    80205f28:	60e2                	ld	ra,24(sp)
    80205f2a:	6442                	ld	s0,16(sp)
    80205f2c:	64a2                	ld	s1,8(sp)
    80205f2e:	6902                	ld	s2,0(sp)
    80205f30:	6105                	addi	sp,sp,32
    80205f32:	8082                	ret
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80205f34:	0025149b          	slliw	s1,a0,0x2
    80205f38:	00026917          	auipc	s2,0x26
    80205f3c:	85090913          	addi	s2,s2,-1968 # 8022b788 <fat>
    80205f40:	01095783          	lhu	a5,16(s2)
    80205f44:	02f4d7bb          	divuw	a5,s1,a5
    80205f48:	01495583          	lhu	a1,20(s2)
    struct buf *b = bread(0, fat_sec);
    80205f4c:	9dbd                	addw	a1,a1,a5
    80205f4e:	4501                	li	a0,0
    80205f50:	ffffe097          	auipc	ra,0xffffe
    80205f54:	9ec080e7          	jalr	-1556(ra) # 8020393c <bread>
    return (cluster << 2) % fat.bpb.byts_per_sec;
    80205f58:	01095783          	lhu	a5,16(s2)
    80205f5c:	02f4f4bb          	remuw	s1,s1,a5
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    80205f60:	1482                	slli	s1,s1,0x20
    80205f62:	9081                	srli	s1,s1,0x20
    80205f64:	94aa                	add	s1,s1,a0
    80205f66:	4ca4                	lw	s1,88(s1)
    brelse(b);
    80205f68:	ffffe097          	auipc	ra,0xffffe
    80205f6c:	b00080e7          	jalr	-1280(ra) # 80203a68 <brelse>
    return next_clus;
    80205f70:	bf5d                	j	80205f26 <read_fat+0x28>

0000000080205f72 <alloc_clus>:
        brelse(b);
    }
}

static uint32 alloc_clus(uint8 dev)
{
    80205f72:	711d                	addi	sp,sp,-96
    80205f74:	ec86                	sd	ra,88(sp)
    80205f76:	e8a2                	sd	s0,80(sp)
    80205f78:	e4a6                	sd	s1,72(sp)
    80205f7a:	e0ca                	sd	s2,64(sp)
    80205f7c:	fc4e                	sd	s3,56(sp)
    80205f7e:	f852                	sd	s4,48(sp)
    80205f80:	f456                	sd	s5,40(sp)
    80205f82:	f05a                	sd	s6,32(sp)
    80205f84:	ec5e                	sd	s7,24(sp)
    80205f86:	e862                	sd	s8,16(sp)
    80205f88:	e466                	sd	s9,8(sp)
    80205f8a:	1080                	addi	s0,sp,96
    // should we keep a free cluster list? instead of searching fat every time.
    struct buf *b;
    uint32 sec = fat.bpb.rsvd_sec_cnt;
    80205f8c:	00025797          	auipc	a5,0x25
    80205f90:	7fc78793          	addi	a5,a5,2044 # 8022b788 <fat>
    80205f94:	0147db83          	lhu	s7,20(a5)
    uint32 const ent_per_sec = fat.bpb.byts_per_sec / sizeof(uint32);
    80205f98:	0107d903          	lhu	s2,16(a5)
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205f9c:	539c                	lw	a5,32(a5)
    80205f9e:	10078263          	beqz	a5,802060a2 <alloc_clus+0x130>
    80205fa2:	0029591b          	srliw	s2,s2,0x2
    80205fa6:	0009099b          	sext.w	s3,s2
    80205faa:	4b01                	li	s6,0
        b = bread(dev, sec);
    80205fac:	00050a9b          	sext.w	s5,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205fb0:	4c01                	li	s8,0
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205fb2:	00025c97          	auipc	s9,0x25
    80205fb6:	7d6c8c93          	addi	s9,s9,2006 # 8022b788 <fat>
    80205fba:	a0c1                	j	8020607a <alloc_clus+0x108>
            if (((uint32 *)(b->data))[j] == 0) {
                ((uint32 *)(b->data))[j] = FAT32_EOC + 7;
    80205fbc:	100007b7          	lui	a5,0x10000
    80205fc0:	37fd                	addiw	a5,a5,-1
    80205fc2:	c29c                	sw	a5,0(a3)
                bwrite(b);
    80205fc4:	8552                	mv	a0,s4
    80205fc6:	ffffe097          	auipc	ra,0xffffe
    80205fca:	a66080e7          	jalr	-1434(ra) # 80203a2c <bwrite>
                brelse(b);
    80205fce:	8552                	mv	a0,s4
    80205fd0:	ffffe097          	auipc	ra,0xffffe
    80205fd4:	a98080e7          	jalr	-1384(ra) # 80203a68 <brelse>
                uint32 clus = i * ent_per_sec + j;
    80205fd8:	0369093b          	mulw	s2,s2,s6
    80205fdc:	009904bb          	addw	s1,s2,s1
    80205fe0:	00048a9b          	sext.w	s5,s1
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80205fe4:	00025717          	auipc	a4,0x25
    80205fe8:	7a470713          	addi	a4,a4,1956 # 8022b788 <fat>
    80205fec:	01274783          	lbu	a5,18(a4)
    80205ff0:	34f9                	addiw	s1,s1,-2
    80205ff2:	02f489bb          	mulw	s3,s1,a5
    80205ff6:	4318                	lw	a4,0(a4)
    80205ff8:	00e989bb          	addw	s3,s3,a4
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    80205ffc:	c7b1                	beqz	a5,80206048 <alloc_clus+0xd6>
    80205ffe:	4901                	li	s2,0
    80206000:	00025a17          	auipc	s4,0x25
    80206004:	788a0a13          	addi	s4,s4,1928 # 8022b788 <fat>
        b = bread(0, sec++);
    80206008:	013905bb          	addw	a1,s2,s3
    8020600c:	4501                	li	a0,0
    8020600e:	ffffe097          	auipc	ra,0xffffe
    80206012:	92e080e7          	jalr	-1746(ra) # 8020393c <bread>
    80206016:	84aa                	mv	s1,a0
        memset(b->data, 0, BSIZE);
    80206018:	20000613          	li	a2,512
    8020601c:	4581                	li	a1,0
    8020601e:	05850513          	addi	a0,a0,88
    80206022:	ffffa097          	auipc	ra,0xffffa
    80206026:	742080e7          	jalr	1858(ra) # 80200764 <memset>
        bwrite(b);
    8020602a:	8526                	mv	a0,s1
    8020602c:	ffffe097          	auipc	ra,0xffffe
    80206030:	a00080e7          	jalr	-1536(ra) # 80203a2c <bwrite>
        brelse(b);
    80206034:	8526                	mv	a0,s1
    80206036:	ffffe097          	auipc	ra,0xffffe
    8020603a:	a32080e7          	jalr	-1486(ra) # 80203a68 <brelse>
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    8020603e:	2905                	addiw	s2,s2,1
    80206040:	012a4783          	lbu	a5,18(s4)
    80206044:	fcf942e3          	blt	s2,a5,80206008 <alloc_clus+0x96>
            }
        }
        brelse(b);
    }
    panic("no clusters");
}
    80206048:	8556                	mv	a0,s5
    8020604a:	60e6                	ld	ra,88(sp)
    8020604c:	6446                	ld	s0,80(sp)
    8020604e:	64a6                	ld	s1,72(sp)
    80206050:	6906                	ld	s2,64(sp)
    80206052:	79e2                	ld	s3,56(sp)
    80206054:	7a42                	ld	s4,48(sp)
    80206056:	7aa2                	ld	s5,40(sp)
    80206058:	7b02                	ld	s6,32(sp)
    8020605a:	6be2                	ld	s7,24(sp)
    8020605c:	6c42                	ld	s8,16(sp)
    8020605e:	6ca2                	ld	s9,8(sp)
    80206060:	6125                	addi	sp,sp,96
    80206062:	8082                	ret
        brelse(b);
    80206064:	8552                	mv	a0,s4
    80206066:	ffffe097          	auipc	ra,0xffffe
    8020606a:	a02080e7          	jalr	-1534(ra) # 80203a68 <brelse>
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    8020606e:	2b05                	addiw	s6,s6,1
    80206070:	2b85                	addiw	s7,s7,1
    80206072:	020ca783          	lw	a5,32(s9)
    80206076:	02fb7663          	bgeu	s6,a5,802060a2 <alloc_clus+0x130>
        b = bread(dev, sec);
    8020607a:	85de                	mv	a1,s7
    8020607c:	8556                	mv	a0,s5
    8020607e:	ffffe097          	auipc	ra,0xffffe
    80206082:	8be080e7          	jalr	-1858(ra) # 8020393c <bread>
    80206086:	8a2a                	mv	s4,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80206088:	fc098ee3          	beqz	s3,80206064 <alloc_clus+0xf2>
    8020608c:	05850793          	addi	a5,a0,88
    80206090:	84e2                	mv	s1,s8
            if (((uint32 *)(b->data))[j] == 0) {
    80206092:	86be                	mv	a3,a5
    80206094:	4398                	lw	a4,0(a5)
    80206096:	d31d                	beqz	a4,80205fbc <alloc_clus+0x4a>
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80206098:	2485                	addiw	s1,s1,1
    8020609a:	0791                	addi	a5,a5,4
    8020609c:	fe999be3          	bne	s3,s1,80206092 <alloc_clus+0x120>
    802060a0:	b7d1                	j	80206064 <alloc_clus+0xf2>
    panic("no clusters");
    802060a2:	00005517          	auipc	a0,0x5
    802060a6:	c3e50513          	addi	a0,a0,-962 # 8020ace0 <digits+0x960>
    802060aa:	ffffa097          	auipc	ra,0xffffa
    802060ae:	098080e7          	jalr	152(ra) # 80200142 <panic>

00000000802060b2 <write_fat>:
    if (cluster > fat.data_clus_cnt + 1) {
    802060b2:	00025797          	auipc	a5,0x25
    802060b6:	6de7a783          	lw	a5,1758(a5) # 8022b790 <fat+0x8>
    802060ba:	2785                	addiw	a5,a5,1
    802060bc:	06a7e963          	bltu	a5,a0,8020612e <write_fat+0x7c>
{
    802060c0:	7179                	addi	sp,sp,-48
    802060c2:	f406                	sd	ra,40(sp)
    802060c4:	f022                	sd	s0,32(sp)
    802060c6:	ec26                	sd	s1,24(sp)
    802060c8:	e84a                	sd	s2,16(sp)
    802060ca:	e44e                	sd	s3,8(sp)
    802060cc:	e052                	sd	s4,0(sp)
    802060ce:	1800                	addi	s0,sp,48
    802060d0:	89ae                	mv	s3,a1
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    802060d2:	0025149b          	slliw	s1,a0,0x2
    802060d6:	00025a17          	auipc	s4,0x25
    802060da:	6b2a0a13          	addi	s4,s4,1714 # 8022b788 <fat>
    802060de:	010a5783          	lhu	a5,16(s4)
    802060e2:	02f4d7bb          	divuw	a5,s1,a5
    802060e6:	014a5583          	lhu	a1,20(s4)
    struct buf *b = bread(0, fat_sec);
    802060ea:	9dbd                	addw	a1,a1,a5
    802060ec:	4501                	li	a0,0
    802060ee:	ffffe097          	auipc	ra,0xffffe
    802060f2:	84e080e7          	jalr	-1970(ra) # 8020393c <bread>
    802060f6:	892a                	mv	s2,a0
    return (cluster << 2) % fat.bpb.byts_per_sec;
    802060f8:	010a5783          	lhu	a5,16(s4)
    802060fc:	02f4f4bb          	remuw	s1,s1,a5
    *(uint32 *)(b->data + off) = content;
    80206100:	1482                	slli	s1,s1,0x20
    80206102:	9081                	srli	s1,s1,0x20
    80206104:	94aa                	add	s1,s1,a0
    80206106:	0534ac23          	sw	s3,88(s1)
    bwrite(b);
    8020610a:	ffffe097          	auipc	ra,0xffffe
    8020610e:	922080e7          	jalr	-1758(ra) # 80203a2c <bwrite>
    brelse(b);
    80206112:	854a                	mv	a0,s2
    80206114:	ffffe097          	auipc	ra,0xffffe
    80206118:	954080e7          	jalr	-1708(ra) # 80203a68 <brelse>
    return 0;
    8020611c:	4501                	li	a0,0
}
    8020611e:	70a2                	ld	ra,40(sp)
    80206120:	7402                	ld	s0,32(sp)
    80206122:	64e2                	ld	s1,24(sp)
    80206124:	6942                	ld	s2,16(sp)
    80206126:	69a2                	ld	s3,8(sp)
    80206128:	6a02                	ld	s4,0(sp)
    8020612a:	6145                	addi	sp,sp,48
    8020612c:	8082                	ret
        return -1;
    8020612e:	557d                	li	a0,-1
}
    80206130:	8082                	ret

0000000080206132 <reloc_clus>:
 * @param   off         the offset from the beginning of the relative file
 * @param   alloc       whether alloc new cluster when meeting end of FAT chains
 * @return              the offset from the new cur_clus
 */
static int reloc_clus(struct dirent *entry, uint off, int alloc)
{
    80206132:	715d                	addi	sp,sp,-80
    80206134:	e486                	sd	ra,72(sp)
    80206136:	e0a2                	sd	s0,64(sp)
    80206138:	fc26                	sd	s1,56(sp)
    8020613a:	f84a                	sd	s2,48(sp)
    8020613c:	f44e                	sd	s3,40(sp)
    8020613e:	f052                	sd	s4,32(sp)
    80206140:	ec56                	sd	s5,24(sp)
    80206142:	e85a                	sd	s6,16(sp)
    80206144:	e45e                	sd	s7,8(sp)
    80206146:	0880                	addi	s0,sp,80
    80206148:	84aa                	mv	s1,a0
    8020614a:	8a2e                	mv	s4,a1
    int clus_num = off / fat.byts_per_clus;
    8020614c:	00025b97          	auipc	s7,0x25
    80206150:	648bab83          	lw	s7,1608(s7) # 8022b794 <fat+0xc>
    80206154:	0375d9bb          	divuw	s3,a1,s7
    while (clus_num > entry->clus_cnt) {
    80206158:	11052703          	lw	a4,272(a0)
    8020615c:	07377663          	bgeu	a4,s3,802061c8 <reloc_clus+0x96>
    80206160:	8b32                	mv	s6,a2
        int clus = read_fat(entry->cur_clus);
        if (clus >= FAT32_EOC) {
    80206162:	10000ab7          	lui	s5,0x10000
    80206166:	1add                	addi	s5,s5,-9
    80206168:	a025                	j	80206190 <reloc_clus+0x5e>
            if (alloc) {
                clus = alloc_clus(entry->dev);
                write_fat(entry->cur_clus, clus);
            } else {
                entry->cur_clus = entry->first_clus;
    8020616a:	1044a783          	lw	a5,260(s1)
    8020616e:	10f4a623          	sw	a5,268(s1)
                entry->clus_cnt = 0;
    80206172:	1004a823          	sw	zero,272(s1)
                return -1;
    80206176:	557d                	li	a0,-1
    80206178:	a879                	j	80206216 <reloc_clus+0xe4>
            }
        }
        entry->cur_clus = clus;
    8020617a:	1124a623          	sw	s2,268(s1)
        entry->clus_cnt++;
    8020617e:	1104a783          	lw	a5,272(s1)
    80206182:	2785                	addiw	a5,a5,1
    80206184:	0007871b          	sext.w	a4,a5
    80206188:	10f4a823          	sw	a5,272(s1)
    while (clus_num > entry->clus_cnt) {
    8020618c:	03377e63          	bgeu	a4,s3,802061c8 <reloc_clus+0x96>
        int clus = read_fat(entry->cur_clus);
    80206190:	10c4a503          	lw	a0,268(s1)
    80206194:	00000097          	auipc	ra,0x0
    80206198:	d6a080e7          	jalr	-662(ra) # 80205efe <read_fat>
    8020619c:	0005091b          	sext.w	s2,a0
        if (clus >= FAT32_EOC) {
    802061a0:	fd2adde3          	bge	s5,s2,8020617a <reloc_clus+0x48>
            if (alloc) {
    802061a4:	fc0b03e3          	beqz	s6,8020616a <reloc_clus+0x38>
                clus = alloc_clus(entry->dev);
    802061a8:	1144c503          	lbu	a0,276(s1)
    802061ac:	00000097          	auipc	ra,0x0
    802061b0:	dc6080e7          	jalr	-570(ra) # 80205f72 <alloc_clus>
    802061b4:	0005091b          	sext.w	s2,a0
                write_fat(entry->cur_clus, clus);
    802061b8:	85ca                	mv	a1,s2
    802061ba:	10c4a503          	lw	a0,268(s1)
    802061be:	00000097          	auipc	ra,0x0
    802061c2:	ef4080e7          	jalr	-268(ra) # 802060b2 <write_fat>
    802061c6:	bf55                	j	8020617a <reloc_clus+0x48>
    }
    if (clus_num < entry->clus_cnt) {
    802061c8:	04e9f163          	bgeu	s3,a4,8020620a <reloc_clus+0xd8>
        entry->cur_clus = entry->first_clus;
    802061cc:	1044a783          	lw	a5,260(s1)
    802061d0:	10f4a623          	sw	a5,268(s1)
        entry->clus_cnt = 0;
    802061d4:	1004a823          	sw	zero,272(s1)
        while (entry->clus_cnt < clus_num) {
    802061d8:	037a6963          	bltu	s4,s7,8020620a <reloc_clus+0xd8>
            entry->cur_clus = read_fat(entry->cur_clus);
            if (entry->cur_clus >= FAT32_EOC) {
    802061dc:	10000937          	lui	s2,0x10000
    802061e0:	195d                	addi	s2,s2,-9
            entry->cur_clus = read_fat(entry->cur_clus);
    802061e2:	10c4a503          	lw	a0,268(s1)
    802061e6:	00000097          	auipc	ra,0x0
    802061ea:	d18080e7          	jalr	-744(ra) # 80205efe <read_fat>
    802061ee:	2501                	sext.w	a0,a0
    802061f0:	10a4a623          	sw	a0,268(s1)
            if (entry->cur_clus >= FAT32_EOC) {
    802061f4:	02a96c63          	bltu	s2,a0,8020622c <reloc_clus+0xfa>
                panic("reloc_clus");
            }
            entry->clus_cnt++;
    802061f8:	1104a783          	lw	a5,272(s1)
    802061fc:	2785                	addiw	a5,a5,1
    802061fe:	0007871b          	sext.w	a4,a5
    80206202:	10f4a823          	sw	a5,272(s1)
        while (entry->clus_cnt < clus_num) {
    80206206:	fd376ee3          	bltu	a4,s3,802061e2 <reloc_clus+0xb0>
        }
    }
    return off % fat.byts_per_clus;
    8020620a:	00025517          	auipc	a0,0x25
    8020620e:	58a52503          	lw	a0,1418(a0) # 8022b794 <fat+0xc>
    80206212:	02aa753b          	remuw	a0,s4,a0
}
    80206216:	60a6                	ld	ra,72(sp)
    80206218:	6406                	ld	s0,64(sp)
    8020621a:	74e2                	ld	s1,56(sp)
    8020621c:	7942                	ld	s2,48(sp)
    8020621e:	79a2                	ld	s3,40(sp)
    80206220:	7a02                	ld	s4,32(sp)
    80206222:	6ae2                	ld	s5,24(sp)
    80206224:	6b42                	ld	s6,16(sp)
    80206226:	6ba2                	ld	s7,8(sp)
    80206228:	6161                	addi	sp,sp,80
    8020622a:	8082                	ret
                panic("reloc_clus");
    8020622c:	00005517          	auipc	a0,0x5
    80206230:	ac450513          	addi	a0,a0,-1340 # 8020acf0 <digits+0x970>
    80206234:	ffffa097          	auipc	ra,0xffffa
    80206238:	f0e080e7          	jalr	-242(ra) # 80200142 <panic>

000000008020623c <rw_clus>:
{
    8020623c:	7119                	addi	sp,sp,-128
    8020623e:	fc86                	sd	ra,120(sp)
    80206240:	f8a2                	sd	s0,112(sp)
    80206242:	f4a6                	sd	s1,104(sp)
    80206244:	f0ca                	sd	s2,96(sp)
    80206246:	ecce                	sd	s3,88(sp)
    80206248:	e8d2                	sd	s4,80(sp)
    8020624a:	e4d6                	sd	s5,72(sp)
    8020624c:	e0da                	sd	s6,64(sp)
    8020624e:	fc5e                	sd	s7,56(sp)
    80206250:	f862                	sd	s8,48(sp)
    80206252:	f466                	sd	s9,40(sp)
    80206254:	f06a                	sd	s10,32(sp)
    80206256:	ec6e                	sd	s11,24(sp)
    80206258:	0100                	addi	s0,sp,128
    8020625a:	f8c43423          	sd	a2,-120(s0)
    8020625e:	8b36                	mv	s6,a3
    80206260:	8c3e                	mv	s8,a5
    if (off + n > fat.byts_per_clus)
    80206262:	00f706bb          	addw	a3,a4,a5
    80206266:	00025797          	auipc	a5,0x25
    8020626a:	52e7a783          	lw	a5,1326(a5) # 8022b794 <fat+0xc>
    8020626e:	02d7ef63          	bltu	a5,a3,802062ac <rw_clus+0x70>
    80206272:	8cae                	mv	s9,a1
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80206274:	00025797          	auipc	a5,0x25
    80206278:	51478793          	addi	a5,a5,1300 # 8022b788 <fat>
    8020627c:	0107da83          	lhu	s5,16(a5)
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80206280:	ffe5099b          	addiw	s3,a0,-2
    80206284:	0127c503          	lbu	a0,18(a5)
    80206288:	02a989bb          	mulw	s3,s3,a0
    8020628c:	4388                	lw	a0,0(a5)
    8020628e:	00a989bb          	addw	s3,s3,a0
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80206292:	035757bb          	divuw	a5,a4,s5
    80206296:	00f989bb          	addw	s3,s3,a5
    off = off % fat.bpb.byts_per_sec;
    8020629a:	03577abb          	remuw	s5,a4,s5
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    8020629e:	0e0c0363          	beqz	s8,80206384 <rw_clus+0x148>
    802062a2:	4a01                	li	s4,0
        m = BSIZE - off % BSIZE;
    802062a4:	20000d93          	li	s11,512
        if (bad == -1) {
    802062a8:	5d7d                	li	s10,-1
    802062aa:	a095                	j	8020630e <rw_clus+0xd2>
        panic("offset out of range");
    802062ac:	00005517          	auipc	a0,0x5
    802062b0:	a5450513          	addi	a0,a0,-1452 # 8020ad00 <digits+0x980>
    802062b4:	ffffa097          	auipc	ra,0xffffa
    802062b8:	e8e080e7          	jalr	-370(ra) # 80200142 <panic>
                bwrite(bp);
    802062bc:	854a                	mv	a0,s2
    802062be:	ffffd097          	auipc	ra,0xffffd
    802062c2:	76e080e7          	jalr	1902(ra) # 80203a2c <bwrite>
        brelse(bp);
    802062c6:	854a                	mv	a0,s2
    802062c8:	ffffd097          	auipc	ra,0xffffd
    802062cc:	7a0080e7          	jalr	1952(ra) # 80203a68 <brelse>
        if (bad == -1) {
    802062d0:	a02d                	j	802062fa <rw_clus+0xbe>
            bad = either_copyout(user, data, bp->data + (off % BSIZE), m);
    802062d2:	05890613          	addi	a2,s2,88 # 10000058 <_entry-0x701fffa8>
    802062d6:	1682                	slli	a3,a3,0x20
    802062d8:	9281                	srli	a3,a3,0x20
    802062da:	963a                	add	a2,a2,a4
    802062dc:	85da                	mv	a1,s6
    802062de:	f8843503          	ld	a0,-120(s0)
    802062e2:	ffffc097          	auipc	ra,0xffffc
    802062e6:	22e080e7          	jalr	558(ra) # 80202510 <either_copyout>
    802062ea:	8baa                	mv	s7,a0
        brelse(bp);
    802062ec:	854a                	mv	a0,s2
    802062ee:	ffffd097          	auipc	ra,0xffffd
    802062f2:	77a080e7          	jalr	1914(ra) # 80203a68 <brelse>
        if (bad == -1) {
    802062f6:	07ab8763          	beq	s7,s10,80206364 <rw_clus+0x128>
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    802062fa:	01448a3b          	addw	s4,s1,s4
    802062fe:	01548abb          	addw	s5,s1,s5
    80206302:	1482                	slli	s1,s1,0x20
    80206304:	9081                	srli	s1,s1,0x20
    80206306:	9b26                	add	s6,s6,s1
    80206308:	2985                	addiw	s3,s3,1
    8020630a:	058a7d63          	bgeu	s4,s8,80206364 <rw_clus+0x128>
        bp = bread(0, sec);
    8020630e:	85ce                	mv	a1,s3
    80206310:	4501                	li	a0,0
    80206312:	ffffd097          	auipc	ra,0xffffd
    80206316:	62a080e7          	jalr	1578(ra) # 8020393c <bread>
    8020631a:	892a                	mv	s2,a0
        m = BSIZE - off % BSIZE;
    8020631c:	1ffaf713          	andi	a4,s5,511
    80206320:	40ed863b          	subw	a2,s11,a4
        if (n - tot < m) {
    80206324:	414c07bb          	subw	a5,s8,s4
    80206328:	86be                	mv	a3,a5
    8020632a:	2781                	sext.w	a5,a5
    8020632c:	0006059b          	sext.w	a1,a2
    80206330:	00f5f363          	bgeu	a1,a5,80206336 <rw_clus+0xfa>
    80206334:	86b2                	mv	a3,a2
    80206336:	0006849b          	sext.w	s1,a3
        if (write) {
    8020633a:	f80c8ce3          	beqz	s9,802062d2 <rw_clus+0x96>
            if ((bad = either_copyin(bp->data + (off % BSIZE), user, data, m)) != -1) {
    8020633e:	05890513          	addi	a0,s2,88
    80206342:	1682                	slli	a3,a3,0x20
    80206344:	9281                	srli	a3,a3,0x20
    80206346:	865a                	mv	a2,s6
    80206348:	f8843583          	ld	a1,-120(s0)
    8020634c:	953a                	add	a0,a0,a4
    8020634e:	ffffc097          	auipc	ra,0xffffc
    80206352:	1f8080e7          	jalr	504(ra) # 80202546 <either_copyin>
    80206356:	f7a513e3          	bne	a0,s10,802062bc <rw_clus+0x80>
        brelse(bp);
    8020635a:	854a                	mv	a0,s2
    8020635c:	ffffd097          	auipc	ra,0xffffd
    80206360:	70c080e7          	jalr	1804(ra) # 80203a68 <brelse>
}
    80206364:	8552                	mv	a0,s4
    80206366:	70e6                	ld	ra,120(sp)
    80206368:	7446                	ld	s0,112(sp)
    8020636a:	74a6                	ld	s1,104(sp)
    8020636c:	7906                	ld	s2,96(sp)
    8020636e:	69e6                	ld	s3,88(sp)
    80206370:	6a46                	ld	s4,80(sp)
    80206372:	6aa6                	ld	s5,72(sp)
    80206374:	6b06                	ld	s6,64(sp)
    80206376:	7be2                	ld	s7,56(sp)
    80206378:	7c42                	ld	s8,48(sp)
    8020637a:	7ca2                	ld	s9,40(sp)
    8020637c:	7d02                	ld	s10,32(sp)
    8020637e:	6de2                	ld	s11,24(sp)
    80206380:	6109                	addi	sp,sp,128
    80206382:	8082                	ret
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    80206384:	8a62                	mv	s4,s8
    80206386:	bff9                	j	80206364 <rw_clus+0x128>

0000000080206388 <eget>:
// by their whole path. But when parsing a path, we open all the directories through it, 
// which forms a linked list from the final file to the root. Thus, we use the "parent" pointer 
// to recognize whether an entry with the "name" as given is really the file we want in the right path.
// Should never get root by eget, it's easy to understand.
static struct dirent *eget(struct dirent *parent, char *name)
{
    80206388:	7139                	addi	sp,sp,-64
    8020638a:	fc06                	sd	ra,56(sp)
    8020638c:	f822                	sd	s0,48(sp)
    8020638e:	f426                	sd	s1,40(sp)
    80206390:	f04a                	sd	s2,32(sp)
    80206392:	ec4e                	sd	s3,24(sp)
    80206394:	e852                	sd	s4,16(sp)
    80206396:	e456                	sd	s5,8(sp)
    80206398:	0080                	addi	s0,sp,64
    8020639a:	8a2a                	mv	s4,a0
    8020639c:	8aae                	mv	s5,a1
    struct dirent *ep;
    acquire(&ecache.lock);
    8020639e:	00025517          	auipc	a0,0x25
    802063a2:	57a50513          	addi	a0,a0,1402 # 8022b918 <ecache>
    802063a6:	ffffa097          	auipc	ra,0xffffa
    802063aa:	322080e7          	jalr	802(ra) # 802006c8 <acquire>
    if (name) {
    802063ae:	060a8b63          	beqz	s5,80206424 <eget+0x9c>
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    802063b2:	00025497          	auipc	s1,0x25
    802063b6:	5264b483          	ld	s1,1318(s1) # 8022b8d8 <root+0x128>
    802063ba:	00025797          	auipc	a5,0x25
    802063be:	3f678793          	addi	a5,a5,1014 # 8022b7b0 <root>
    802063c2:	06f48163          	beq	s1,a5,80206424 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    802063c6:	4905                	li	s2,1
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    802063c8:	89be                	mv	s3,a5
    802063ca:	a029                	j	802063d4 <eget+0x4c>
    802063cc:	1284b483          	ld	s1,296(s1)
    802063d0:	05348a63          	beq	s1,s3,80206424 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    802063d4:	11649783          	lh	a5,278(s1)
    802063d8:	ff279ae3          	bne	a5,s2,802063cc <eget+0x44>
    802063dc:	1204b783          	ld	a5,288(s1)
    802063e0:	ff4796e3          	bne	a5,s4,802063cc <eget+0x44>
                && strncmp(ep->filename, name, FAT32_MAX_FILENAME) == 0) {
    802063e4:	0ff00613          	li	a2,255
    802063e8:	85d6                	mv	a1,s5
    802063ea:	8526                	mv	a0,s1
    802063ec:	ffffa097          	auipc	ra,0xffffa
    802063f0:	454080e7          	jalr	1108(ra) # 80200840 <strncmp>
    802063f4:	fd61                	bnez	a0,802063cc <eget+0x44>
                if (ep->ref++ == 0) {
    802063f6:	1184a783          	lw	a5,280(s1)
    802063fa:	0017871b          	addiw	a4,a5,1
    802063fe:	10e4ac23          	sw	a4,280(s1)
    80206402:	eb81                	bnez	a5,80206412 <eget+0x8a>
                    ep->parent->ref++;
    80206404:	1204b703          	ld	a4,288(s1)
    80206408:	11872783          	lw	a5,280(a4)
    8020640c:	2785                	addiw	a5,a5,1
    8020640e:	10f72c23          	sw	a5,280(a4)
                }
                release(&ecache.lock);
    80206412:	00025517          	auipc	a0,0x25
    80206416:	50650513          	addi	a0,a0,1286 # 8022b918 <ecache>
    8020641a:	ffffa097          	auipc	ra,0xffffa
    8020641e:	302080e7          	jalr	770(ra) # 8020071c <release>
                // edup(ep->parent);
                return ep;
    80206422:	a085                	j	80206482 <eget+0xfa>
            }
        }
    }
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80206424:	00025497          	auipc	s1,0x25
    80206428:	4bc4b483          	ld	s1,1212(s1) # 8022b8e0 <root+0x130>
    8020642c:	00025797          	auipc	a5,0x25
    80206430:	38478793          	addi	a5,a5,900 # 8022b7b0 <root>
    80206434:	00f48a63          	beq	s1,a5,80206448 <eget+0xc0>
    80206438:	873e                	mv	a4,a5
        if (ep->ref == 0) {
    8020643a:	1184a783          	lw	a5,280(s1)
    8020643e:	cf89                	beqz	a5,80206458 <eget+0xd0>
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80206440:	1304b483          	ld	s1,304(s1)
    80206444:	fee49be3          	bne	s1,a4,8020643a <eget+0xb2>
            ep->dirty = 0;
            release(&ecache.lock);
            return ep;
        }
    }
    panic("eget: insufficient ecache");
    80206448:	00005517          	auipc	a0,0x5
    8020644c:	8d050513          	addi	a0,a0,-1840 # 8020ad18 <digits+0x998>
    80206450:	ffffa097          	auipc	ra,0xffffa
    80206454:	cf2080e7          	jalr	-782(ra) # 80200142 <panic>
            ep->ref = 1;
    80206458:	4785                	li	a5,1
    8020645a:	10f4ac23          	sw	a5,280(s1)
            ep->dev = parent->dev;
    8020645e:	114a4783          	lbu	a5,276(s4)
    80206462:	10f48a23          	sb	a5,276(s1)
            ep->off = 0;
    80206466:	1004ae23          	sw	zero,284(s1)
            ep->valid = 0;
    8020646a:	10049b23          	sh	zero,278(s1)
            ep->dirty = 0;
    8020646e:	10048aa3          	sb	zero,277(s1)
            release(&ecache.lock);
    80206472:	00025517          	auipc	a0,0x25
    80206476:	4a650513          	addi	a0,a0,1190 # 8022b918 <ecache>
    8020647a:	ffffa097          	auipc	ra,0xffffa
    8020647e:	2a2080e7          	jalr	674(ra) # 8020071c <release>
    return 0;
}
    80206482:	8526                	mv	a0,s1
    80206484:	70e2                	ld	ra,56(sp)
    80206486:	7442                	ld	s0,48(sp)
    80206488:	74a2                	ld	s1,40(sp)
    8020648a:	7902                	ld	s2,32(sp)
    8020648c:	69e2                	ld	s3,24(sp)
    8020648e:	6a42                	ld	s4,16(sp)
    80206490:	6aa2                	ld	s5,8(sp)
    80206492:	6121                	addi	sp,sp,64
    80206494:	8082                	ret

0000000080206496 <read_entry_name>:
 * @param   buffer      pointer to the array that stores the name
 * @param   raw_entry   pointer to the entry in a sector buffer
 * @param   islong      if non-zero, read as l-n-e, otherwise s-n-e.
 */
static void read_entry_name(char *buffer, union dentry *d)
{
    80206496:	7139                	addi	sp,sp,-64
    80206498:	fc06                	sd	ra,56(sp)
    8020649a:	f822                	sd	s0,48(sp)
    8020649c:	f426                	sd	s1,40(sp)
    8020649e:	f04a                	sd	s2,32(sp)
    802064a0:	ec4e                	sd	s3,24(sp)
    802064a2:	0080                	addi	s0,sp,64
    802064a4:	84aa                	mv	s1,a0
    802064a6:	892e                	mv	s2,a1
    if (d->lne.attr == ATTR_LONG_NAME) {                       // long entry branch
    802064a8:	00b5c703          	lbu	a4,11(a1)
    802064ac:	47bd                	li	a5,15
    802064ae:	08f70563          	beq	a4,a5,80206538 <read_entry_name+0xa2>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
        buffer += NELEM(d->lne.name2);
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    } else {
        // assert: only "." and ".." will enter this branch
        memset(buffer, 0, CHAR_SHORT_NAME + 2); // plus '.' and '\0'
    802064b2:	4635                	li	a2,13
    802064b4:	4581                	li	a1,0
    802064b6:	ffffa097          	auipc	ra,0xffffa
    802064ba:	2ae080e7          	jalr	686(ra) # 80200764 <memset>
        int i;
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    802064be:	00094703          	lbu	a4,0(s2)
    802064c2:	02000793          	li	a5,32
    802064c6:	0af70c63          	beq	a4,a5,8020657e <read_entry_name+0xe8>
    802064ca:	4785                	li	a5,1
    802064cc:	02000613          	li	a2,32
    802064d0:	45a5                	li	a1,9
            buffer[i] = d->sne.name[i];
    802064d2:	00f486b3          	add	a3,s1,a5
    802064d6:	fee68fa3          	sb	a4,-1(a3) # 1fff <_entry-0x801fe001>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    802064da:	0007851b          	sext.w	a0,a5
    802064de:	00f90733          	add	a4,s2,a5
    802064e2:	00074703          	lbu	a4,0(a4)
    802064e6:	00c70563          	beq	a4,a2,802064f0 <read_entry_name+0x5a>
    802064ea:	0785                	addi	a5,a5,1
    802064ec:	feb793e3          	bne	a5,a1,802064d2 <read_entry_name+0x3c>
        }
        if (d->sne.name[8] != ' ') {
    802064f0:	00894703          	lbu	a4,8(s2)
    802064f4:	02000793          	li	a5,32
    802064f8:	00f70963          	beq	a4,a5,8020650a <read_entry_name+0x74>
            buffer[i++] = '.';
    802064fc:	00a487b3          	add	a5,s1,a0
    80206500:	02e00713          	li	a4,46
    80206504:	00e78023          	sb	a4,0(a5)
    80206508:	2505                	addiw	a0,a0,1
        }
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    8020650a:	00890793          	addi	a5,s2,8
    8020650e:	94aa                	add	s1,s1,a0
    80206510:	092d                	addi	s2,s2,11
            if (d->sne.name[j] == ' ') { break; }
    80206512:	02000693          	li	a3,32
    80206516:	0007c703          	lbu	a4,0(a5)
    8020651a:	00d70863          	beq	a4,a3,8020652a <read_entry_name+0x94>
            buffer[i] = d->sne.name[j];
    8020651e:	00e48023          	sb	a4,0(s1)
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    80206522:	0785                	addi	a5,a5,1
    80206524:	0485                	addi	s1,s1,1
    80206526:	ff2798e3          	bne	a5,s2,80206516 <read_entry_name+0x80>
        }
    }
}
    8020652a:	70e2                	ld	ra,56(sp)
    8020652c:	7442                	ld	s0,48(sp)
    8020652e:	74a2                	ld	s1,40(sp)
    80206530:	7902                	ld	s2,32(sp)
    80206532:	69e2                	ld	s3,24(sp)
    80206534:	6121                	addi	sp,sp,64
    80206536:	8082                	ret
        memmove(temp, d->lne.name1, sizeof(temp));
    80206538:	4629                	li	a2,10
    8020653a:	0585                	addi	a1,a1,1
    8020653c:	fc040993          	addi	s3,s0,-64
    80206540:	854e                	mv	a0,s3
    80206542:	ffffa097          	auipc	ra,0xffffa
    80206546:	282080e7          	jalr	642(ra) # 802007c4 <memmove>
        snstr(buffer, temp, NELEM(d->lne.name1));
    8020654a:	4615                	li	a2,5
    8020654c:	85ce                	mv	a1,s3
    8020654e:	8526                	mv	a0,s1
    80206550:	ffffa097          	auipc	ra,0xffffa
    80206554:	3fa080e7          	jalr	1018(ra) # 8020094a <snstr>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
    80206558:	4619                	li	a2,6
    8020655a:	00e90593          	addi	a1,s2,14
    8020655e:	00548513          	addi	a0,s1,5
    80206562:	ffffa097          	auipc	ra,0xffffa
    80206566:	3e8080e7          	jalr	1000(ra) # 8020094a <snstr>
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    8020656a:	4609                	li	a2,2
    8020656c:	01c90593          	addi	a1,s2,28
    80206570:	00b48513          	addi	a0,s1,11
    80206574:	ffffa097          	auipc	ra,0xffffa
    80206578:	3d6080e7          	jalr	982(ra) # 8020094a <snstr>
    8020657c:	b77d                	j	8020652a <read_entry_name+0x94>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    8020657e:	4501                	li	a0,0
    80206580:	bf85                	j	802064f0 <read_entry_name+0x5a>

0000000080206582 <fat32_init>:
{
    80206582:	7139                	addi	sp,sp,-64
    80206584:	fc06                	sd	ra,56(sp)
    80206586:	f822                	sd	s0,48(sp)
    80206588:	f426                	sd	s1,40(sp)
    8020658a:	f04a                	sd	s2,32(sp)
    8020658c:	ec4e                	sd	s3,24(sp)
    8020658e:	e852                	sd	s4,16(sp)
    80206590:	e456                	sd	s5,8(sp)
    80206592:	0080                	addi	s0,sp,64
    struct buf *b = bread(0, 0);
    80206594:	4581                	li	a1,0
    80206596:	4501                	li	a0,0
    80206598:	ffffd097          	auipc	ra,0xffffd
    8020659c:	3a4080e7          	jalr	932(ra) # 8020393c <bread>
    802065a0:	892a                	mv	s2,a0
    if (strncmp((char const*)(b->data + 82), "FAT32", 5))
    802065a2:	4615                	li	a2,5
    802065a4:	00004597          	auipc	a1,0x4
    802065a8:	79458593          	addi	a1,a1,1940 # 8020ad38 <digits+0x9b8>
    802065ac:	0aa50513          	addi	a0,a0,170
    802065b0:	ffffa097          	auipc	ra,0xffffa
    802065b4:	290080e7          	jalr	656(ra) # 80200840 <strncmp>
    802065b8:	16051863          	bnez	a0,80206728 <fat32_init+0x1a6>
    memmove(&fat.bpb.byts_per_sec, b->data + 11, 2);            // avoid misaligned load on k210
    802065bc:	00025497          	auipc	s1,0x25
    802065c0:	1cc48493          	addi	s1,s1,460 # 8022b788 <fat>
    802065c4:	4609                	li	a2,2
    802065c6:	06390593          	addi	a1,s2,99
    802065ca:	00025517          	auipc	a0,0x25
    802065ce:	1ce50513          	addi	a0,a0,462 # 8022b798 <fat+0x10>
    802065d2:	ffffa097          	auipc	ra,0xffffa
    802065d6:	1f2080e7          	jalr	498(ra) # 802007c4 <memmove>
    fat.bpb.sec_per_clus = *(b->data + 13);
    802065da:	06594683          	lbu	a3,101(s2)
    802065de:	00d48923          	sb	a3,18(s1)
    fat.bpb.rsvd_sec_cnt = *(uint16 *)(b->data + 14);
    802065e2:	06695603          	lhu	a2,102(s2)
    802065e6:	00c49a23          	sh	a2,20(s1)
    fat.bpb.fat_cnt = *(b->data + 16);
    802065ea:	06894703          	lbu	a4,104(s2)
    802065ee:	00e48b23          	sb	a4,22(s1)
    fat.bpb.hidd_sec = *(uint32 *)(b->data + 28);
    802065f2:	07492783          	lw	a5,116(s2)
    802065f6:	cc9c                	sw	a5,24(s1)
    fat.bpb.tot_sec = *(uint32 *)(b->data + 32);
    802065f8:	07892783          	lw	a5,120(s2)
    802065fc:	ccdc                	sw	a5,28(s1)
    fat.bpb.fat_sz = *(uint32 *)(b->data + 36);
    802065fe:	07c92583          	lw	a1,124(s2)
    80206602:	d08c                	sw	a1,32(s1)
    fat.bpb.root_clus = *(uint32 *)(b->data + 44);
    80206604:	08492503          	lw	a0,132(s2)
    80206608:	d0c8                	sw	a0,36(s1)
    fat.first_data_sec = fat.bpb.rsvd_sec_cnt + fat.bpb.fat_cnt * fat.bpb.fat_sz;
    8020660a:	02b7073b          	mulw	a4,a4,a1
    8020660e:	9f31                	addw	a4,a4,a2
    80206610:	c098                	sw	a4,0(s1)
    fat.data_sec_cnt = fat.bpb.tot_sec - fat.first_data_sec;
    80206612:	9f99                	subw	a5,a5,a4
    80206614:	c0dc                	sw	a5,4(s1)
    fat.data_clus_cnt = fat.data_sec_cnt / fat.bpb.sec_per_clus;
    80206616:	02d7d7bb          	divuw	a5,a5,a3
    8020661a:	c49c                	sw	a5,8(s1)
    fat.byts_per_clus = fat.bpb.sec_per_clus * fat.bpb.byts_per_sec;
    8020661c:	0104d783          	lhu	a5,16(s1)
    80206620:	02d787bb          	mulw	a5,a5,a3
    80206624:	c4dc                	sw	a5,12(s1)
    brelse(b);
    80206626:	854a                	mv	a0,s2
    80206628:	ffffd097          	auipc	ra,0xffffd
    8020662c:	440080e7          	jalr	1088(ra) # 80203a68 <brelse>
    if (BSIZE != fat.bpb.byts_per_sec) 
    80206630:	0104d703          	lhu	a4,16(s1)
    80206634:	20000793          	li	a5,512
    80206638:	10f71063          	bne	a4,a5,80206738 <fat32_init+0x1b6>
    initlock(&ecache.lock, "ecache");
    8020663c:	00004597          	auipc	a1,0x4
    80206640:	73458593          	addi	a1,a1,1844 # 8020ad70 <digits+0x9f0>
    80206644:	00025517          	auipc	a0,0x25
    80206648:	2d450513          	addi	a0,a0,724 # 8022b918 <ecache>
    8020664c:	ffffa097          	auipc	ra,0xffffa
    80206650:	038080e7          	jalr	56(ra) # 80200684 <initlock>
    memset(&root, 0, sizeof(root));
    80206654:	00025497          	auipc	s1,0x25
    80206658:	13448493          	addi	s1,s1,308 # 8022b788 <fat>
    8020665c:	00025917          	auipc	s2,0x25
    80206660:	15490913          	addi	s2,s2,340 # 8022b7b0 <root>
    80206664:	16800613          	li	a2,360
    80206668:	4581                	li	a1,0
    8020666a:	854a                	mv	a0,s2
    8020666c:	ffffa097          	auipc	ra,0xffffa
    80206670:	0f8080e7          	jalr	248(ra) # 80200764 <memset>
    initsleeplock(&root.lock, "entry");
    80206674:	00004597          	auipc	a1,0x4
    80206678:	70458593          	addi	a1,a1,1796 # 8020ad78 <digits+0x9f8>
    8020667c:	00025517          	auipc	a0,0x25
    80206680:	26c50513          	addi	a0,a0,620 # 8022b8e8 <root+0x138>
    80206684:	ffffd097          	auipc	ra,0xffffd
    80206688:	4fa080e7          	jalr	1274(ra) # 80203b7e <initsleeplock>
    root.attribute = (ATTR_DIRECTORY | ATTR_SYSTEM);
    8020668c:	47d1                	li	a5,20
    8020668e:	12f48423          	sb	a5,296(s1)
    root.first_clus = root.cur_clus = fat.bpb.root_clus;
    80206692:	50dc                	lw	a5,36(s1)
    80206694:	12f4aa23          	sw	a5,308(s1)
    80206698:	12f4a623          	sw	a5,300(s1)
    root.valid = 1;
    8020669c:	4785                	li	a5,1
    8020669e:	12f49f23          	sh	a5,318(s1)
    root.prev = &root;
    802066a2:	1524bc23          	sd	s2,344(s1)
    root.next = &root;
    802066a6:	1524b823          	sd	s2,336(s1)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    802066aa:	00025497          	auipc	s1,0x25
    802066ae:	28648493          	addi	s1,s1,646 # 8022b930 <ecache+0x18>
        de->next = root.next;
    802066b2:	00025917          	auipc	s2,0x25
    802066b6:	0d690913          	addi	s2,s2,214 # 8022b788 <fat>
        de->prev = &root;
    802066ba:	00025a97          	auipc	s5,0x25
    802066be:	0f6a8a93          	addi	s5,s5,246 # 8022b7b0 <root>
        initsleeplock(&de->lock, "entry");
    802066c2:	00004a17          	auipc	s4,0x4
    802066c6:	6b6a0a13          	addi	s4,s4,1718 # 8020ad78 <digits+0x9f8>
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    802066ca:	0002a997          	auipc	s3,0x2a
    802066ce:	8b698993          	addi	s3,s3,-1866 # 8022ff80 <cons>
        de->dev = 0;
    802066d2:	10048a23          	sb	zero,276(s1)
        de->valid = 0;
    802066d6:	10049b23          	sh	zero,278(s1)
        de->ref = 0;
    802066da:	1004ac23          	sw	zero,280(s1)
        de->dirty = 0;
    802066de:	10048aa3          	sb	zero,277(s1)
        de->parent = 0;
    802066e2:	1204b023          	sd	zero,288(s1)
        de->next = root.next;
    802066e6:	15093783          	ld	a5,336(s2)
    802066ea:	12f4b423          	sd	a5,296(s1)
        de->prev = &root;
    802066ee:	1354b823          	sd	s5,304(s1)
        initsleeplock(&de->lock, "entry");
    802066f2:	85d2                	mv	a1,s4
    802066f4:	13848513          	addi	a0,s1,312
    802066f8:	ffffd097          	auipc	ra,0xffffd
    802066fc:	486080e7          	jalr	1158(ra) # 80203b7e <initsleeplock>
        root.next->prev = de;
    80206700:	15093783          	ld	a5,336(s2)
    80206704:	1297b823          	sd	s1,304(a5)
        root.next = de;
    80206708:	14993823          	sd	s1,336(s2)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    8020670c:	16848493          	addi	s1,s1,360
    80206710:	fd3491e3          	bne	s1,s3,802066d2 <fat32_init+0x150>
}
    80206714:	4501                	li	a0,0
    80206716:	70e2                	ld	ra,56(sp)
    80206718:	7442                	ld	s0,48(sp)
    8020671a:	74a2                	ld	s1,40(sp)
    8020671c:	7902                	ld	s2,32(sp)
    8020671e:	69e2                	ld	s3,24(sp)
    80206720:	6a42                	ld	s4,16(sp)
    80206722:	6aa2                	ld	s5,8(sp)
    80206724:	6121                	addi	sp,sp,64
    80206726:	8082                	ret
        panic("not FAT32 volume");
    80206728:	00004517          	auipc	a0,0x4
    8020672c:	61850513          	addi	a0,a0,1560 # 8020ad40 <digits+0x9c0>
    80206730:	ffffa097          	auipc	ra,0xffffa
    80206734:	a12080e7          	jalr	-1518(ra) # 80200142 <panic>
        panic("byts_per_sec != BSIZE");
    80206738:	00004517          	auipc	a0,0x4
    8020673c:	62050513          	addi	a0,a0,1568 # 8020ad58 <digits+0x9d8>
    80206740:	ffffa097          	auipc	ra,0xffffa
    80206744:	a02080e7          	jalr	-1534(ra) # 80200142 <panic>

0000000080206748 <eread>:
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80206748:	10852783          	lw	a5,264(a0)
    8020674c:	0ed7e863          	bltu	a5,a3,8020683c <eread+0xf4>
{
    80206750:	711d                	addi	sp,sp,-96
    80206752:	ec86                	sd	ra,88(sp)
    80206754:	e8a2                	sd	s0,80(sp)
    80206756:	e4a6                	sd	s1,72(sp)
    80206758:	e0ca                	sd	s2,64(sp)
    8020675a:	fc4e                	sd	s3,56(sp)
    8020675c:	f852                	sd	s4,48(sp)
    8020675e:	f456                	sd	s5,40(sp)
    80206760:	f05a                	sd	s6,32(sp)
    80206762:	ec5e                	sd	s7,24(sp)
    80206764:	e862                	sd	s8,16(sp)
    80206766:	e466                	sd	s9,8(sp)
    80206768:	e06a                	sd	s10,0(sp)
    8020676a:	1080                	addi	s0,sp,96
    8020676c:	8a2a                	mv	s4,a0
    8020676e:	8bae                	mv	s7,a1
    80206770:	8ab2                	mv	s5,a2
    80206772:	8936                	mv	s2,a3
    80206774:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80206776:	9eb9                	addw	a3,a3,a4
        return 0;
    80206778:	4501                	li	a0,0
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    8020677a:	0b26e163          	bltu	a3,s2,8020681c <eread+0xd4>
    8020677e:	100a4703          	lbu	a4,256(s4)
    80206782:	8b41                	andi	a4,a4,16
    80206784:	ef41                	bnez	a4,8020681c <eread+0xd4>
    if (off + n > entry->file_size) {
    80206786:	00d7f463          	bgeu	a5,a3,8020678e <eread+0x46>
        n = entry->file_size - off;
    8020678a:	41278b3b          	subw	s6,a5,s2
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    8020678e:	10ca2703          	lw	a4,268(s4)
    80206792:	100007b7          	lui	a5,0x10000
    80206796:	17dd                	addi	a5,a5,-9
    80206798:	06e7ef63          	bltu	a5,a4,80206816 <eread+0xce>
    8020679c:	080b0e63          	beqz	s6,80206838 <eread+0xf0>
    802067a0:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    802067a2:	00025c97          	auipc	s9,0x25
    802067a6:	fe6c8c93          	addi	s9,s9,-26 # 8022b788 <fat>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802067aa:	8c3e                	mv	s8,a5
    802067ac:	a82d                	j	802067e6 <eread+0x9e>
    802067ae:	00048d1b          	sext.w	s10,s1
        if (rw_clus(entry->cur_clus, 0, user_dst, dst, off % fat.byts_per_clus, m) != m) {
    802067b2:	87ea                	mv	a5,s10
    802067b4:	86d6                	mv	a3,s5
    802067b6:	865e                	mv	a2,s7
    802067b8:	4581                	li	a1,0
    802067ba:	10ca2503          	lw	a0,268(s4)
    802067be:	00000097          	auipc	ra,0x0
    802067c2:	a7e080e7          	jalr	-1410(ra) # 8020623c <rw_clus>
    802067c6:	2501                	sext.w	a0,a0
    802067c8:	04ad1863          	bne	s10,a0,80206818 <eread+0xd0>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802067cc:	013489bb          	addw	s3,s1,s3
    802067d0:	0124893b          	addw	s2,s1,s2
    802067d4:	1482                	slli	s1,s1,0x20
    802067d6:	9081                	srli	s1,s1,0x20
    802067d8:	9aa6                	add	s5,s5,s1
    802067da:	10ca2783          	lw	a5,268(s4)
    802067de:	02fc6d63          	bltu	s8,a5,80206818 <eread+0xd0>
    802067e2:	0369fb63          	bgeu	s3,s6,80206818 <eread+0xd0>
        reloc_clus(entry, off, 0);
    802067e6:	4601                	li	a2,0
    802067e8:	85ca                	mv	a1,s2
    802067ea:	8552                	mv	a0,s4
    802067ec:	00000097          	auipc	ra,0x0
    802067f0:	946080e7          	jalr	-1722(ra) # 80206132 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    802067f4:	00cca783          	lw	a5,12(s9)
    802067f8:	02f976bb          	remuw	a3,s2,a5
    802067fc:	0006871b          	sext.w	a4,a3
    80206800:	9f95                	subw	a5,a5,a3
        if (n - tot < m) {
    80206802:	413b06bb          	subw	a3,s6,s3
    80206806:	84b6                	mv	s1,a3
    80206808:	2681                	sext.w	a3,a3
    8020680a:	0007861b          	sext.w	a2,a5
    8020680e:	fad670e3          	bgeu	a2,a3,802067ae <eread+0x66>
    80206812:	84be                	mv	s1,a5
    80206814:	bf69                	j	802067ae <eread+0x66>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206816:	4981                	li	s3,0
    return tot;
    80206818:	0009851b          	sext.w	a0,s3
}
    8020681c:	60e6                	ld	ra,88(sp)
    8020681e:	6446                	ld	s0,80(sp)
    80206820:	64a6                	ld	s1,72(sp)
    80206822:	6906                	ld	s2,64(sp)
    80206824:	79e2                	ld	s3,56(sp)
    80206826:	7a42                	ld	s4,48(sp)
    80206828:	7aa2                	ld	s5,40(sp)
    8020682a:	7b02                	ld	s6,32(sp)
    8020682c:	6be2                	ld	s7,24(sp)
    8020682e:	6c42                	ld	s8,16(sp)
    80206830:	6ca2                	ld	s9,8(sp)
    80206832:	6d02                	ld	s10,0(sp)
    80206834:	6125                	addi	sp,sp,96
    80206836:	8082                	ret
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206838:	89da                	mv	s3,s6
    8020683a:	bff9                	j	80206818 <eread+0xd0>
        return 0;
    8020683c:	4501                	li	a0,0
}
    8020683e:	8082                	ret

0000000080206840 <ewrite>:
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    80206840:	10852783          	lw	a5,264(a0)
    80206844:	0ed7e463          	bltu	a5,a3,8020692c <ewrite+0xec>
{
    80206848:	711d                	addi	sp,sp,-96
    8020684a:	ec86                	sd	ra,88(sp)
    8020684c:	e8a2                	sd	s0,80(sp)
    8020684e:	e4a6                	sd	s1,72(sp)
    80206850:	e0ca                	sd	s2,64(sp)
    80206852:	fc4e                	sd	s3,56(sp)
    80206854:	f852                	sd	s4,48(sp)
    80206856:	f456                	sd	s5,40(sp)
    80206858:	f05a                	sd	s6,32(sp)
    8020685a:	ec5e                	sd	s7,24(sp)
    8020685c:	e862                	sd	s8,16(sp)
    8020685e:	e466                	sd	s9,8(sp)
    80206860:	1080                	addi	s0,sp,96
    80206862:	8aaa                	mv	s5,a0
    80206864:	8bae                	mv	s7,a1
    80206866:	8a32                	mv	s4,a2
    80206868:	8936                	mv	s2,a3
    8020686a:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    8020686c:	00e687bb          	addw	a5,a3,a4
    80206870:	0cd7e063          	bltu	a5,a3,80206930 <ewrite+0xf0>
    80206874:	02069793          	slli	a5,a3,0x20
    80206878:	9381                	srli	a5,a5,0x20
    8020687a:	1702                	slli	a4,a4,0x20
    8020687c:	9301                	srli	a4,a4,0x20
    8020687e:	97ba                	add	a5,a5,a4
    80206880:	577d                	li	a4,-1
    80206882:	9301                	srli	a4,a4,0x20
    80206884:	0af76863          	bltu	a4,a5,80206934 <ewrite+0xf4>
        || (entry->attribute & ATTR_READ_ONLY)) {
    80206888:	10054783          	lbu	a5,256(a0)
    8020688c:	8b85                	andi	a5,a5,1
    8020688e:	e7cd                	bnez	a5,80206938 <ewrite+0xf8>
    if (entry->first_clus == 0) {   // so file_size if 0 too, which requests off == 0
    80206890:	10452783          	lw	a5,260(a0)
    80206894:	cb89                	beqz	a5,802068a6 <ewrite+0x66>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206896:	080b0963          	beqz	s6,80206928 <ewrite+0xe8>
    8020689a:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    8020689c:	00025c17          	auipc	s8,0x25
    802068a0:	eecc0c13          	addi	s8,s8,-276 # 8022b788 <fat>
    802068a4:	a891                	j	802068f8 <ewrite+0xb8>
        entry->cur_clus = entry->first_clus = alloc_clus(entry->dev);
    802068a6:	11454503          	lbu	a0,276(a0)
    802068aa:	fffff097          	auipc	ra,0xfffff
    802068ae:	6c8080e7          	jalr	1736(ra) # 80205f72 <alloc_clus>
    802068b2:	2501                	sext.w	a0,a0
    802068b4:	10aaa223          	sw	a0,260(s5)
    802068b8:	10aaa623          	sw	a0,268(s5)
        entry->clus_cnt = 0;
    802068bc:	100aa823          	sw	zero,272(s5)
        entry->dirty = 1;
    802068c0:	4785                	li	a5,1
    802068c2:	10fa8aa3          	sb	a5,277(s5)
    802068c6:	bfc1                	j	80206896 <ewrite+0x56>
    802068c8:	00048c9b          	sext.w	s9,s1
        if (rw_clus(entry->cur_clus, 1, user_src, src, off % fat.byts_per_clus, m) != m) {
    802068cc:	87e6                	mv	a5,s9
    802068ce:	86d2                	mv	a3,s4
    802068d0:	865e                	mv	a2,s7
    802068d2:	4585                	li	a1,1
    802068d4:	10caa503          	lw	a0,268(s5)
    802068d8:	00000097          	auipc	ra,0x0
    802068dc:	964080e7          	jalr	-1692(ra) # 8020623c <rw_clus>
    802068e0:	2501                	sext.w	a0,a0
    802068e2:	04ac9d63          	bne	s9,a0,8020693c <ewrite+0xfc>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    802068e6:	013489bb          	addw	s3,s1,s3
    802068ea:	0124893b          	addw	s2,s1,s2
    802068ee:	1482                	slli	s1,s1,0x20
    802068f0:	9081                	srli	s1,s1,0x20
    802068f2:	9a26                	add	s4,s4,s1
    802068f4:	0569f463          	bgeu	s3,s6,8020693c <ewrite+0xfc>
        reloc_clus(entry, off, 1);
    802068f8:	4605                	li	a2,1
    802068fa:	85ca                	mv	a1,s2
    802068fc:	8556                	mv	a0,s5
    802068fe:	00000097          	auipc	ra,0x0
    80206902:	834080e7          	jalr	-1996(ra) # 80206132 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206906:	00cc2783          	lw	a5,12(s8)
    8020690a:	02f976bb          	remuw	a3,s2,a5
    8020690e:	0006871b          	sext.w	a4,a3
    80206912:	9f95                	subw	a5,a5,a3
        if (n - tot < m) {
    80206914:	413b06bb          	subw	a3,s6,s3
    80206918:	84b6                	mv	s1,a3
    8020691a:	2681                	sext.w	a3,a3
    8020691c:	0007861b          	sext.w	a2,a5
    80206920:	fad674e3          	bgeu	a2,a3,802068c8 <ewrite+0x88>
    80206924:	84be                	mv	s1,a5
    80206926:	b74d                	j	802068c8 <ewrite+0x88>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206928:	89da                	mv	s3,s6
    8020692a:	a015                	j	8020694e <ewrite+0x10e>
        return -1;
    8020692c:	557d                	li	a0,-1
}
    8020692e:	8082                	ret
        return -1;
    80206930:	557d                	li	a0,-1
    80206932:	a005                	j	80206952 <ewrite+0x112>
    80206934:	557d                	li	a0,-1
    80206936:	a831                	j	80206952 <ewrite+0x112>
    80206938:	557d                	li	a0,-1
    8020693a:	a821                	j	80206952 <ewrite+0x112>
        if(off > entry->file_size) {
    8020693c:	108aa783          	lw	a5,264(s5)
    80206940:	0127f763          	bgeu	a5,s2,8020694e <ewrite+0x10e>
            entry->file_size = off;
    80206944:	112aa423          	sw	s2,264(s5)
            entry->dirty = 1;
    80206948:	4785                	li	a5,1
    8020694a:	10fa8aa3          	sb	a5,277(s5)
    return tot;
    8020694e:	0009851b          	sext.w	a0,s3
}
    80206952:	60e6                	ld	ra,88(sp)
    80206954:	6446                	ld	s0,80(sp)
    80206956:	64a6                	ld	s1,72(sp)
    80206958:	6906                	ld	s2,64(sp)
    8020695a:	79e2                	ld	s3,56(sp)
    8020695c:	7a42                	ld	s4,48(sp)
    8020695e:	7aa2                	ld	s5,40(sp)
    80206960:	7b02                	ld	s6,32(sp)
    80206962:	6be2                	ld	s7,24(sp)
    80206964:	6c42                	ld	s8,16(sp)
    80206966:	6ca2                	ld	s9,8(sp)
    80206968:	6125                	addi	sp,sp,96
    8020696a:	8082                	ret

000000008020696c <formatname>:
{
    8020696c:	7179                	addi	sp,sp,-48
    8020696e:	f406                	sd	ra,40(sp)
    80206970:	f022                	sd	s0,32(sp)
    80206972:	ec26                	sd	s1,24(sp)
    80206974:	e84a                	sd	s2,16(sp)
    80206976:	e44e                	sd	s3,8(sp)
    80206978:	e052                	sd	s4,0(sp)
    8020697a:	1800                	addi	s0,sp,48
    8020697c:	84aa                	mv	s1,a0
    while (*name == ' ' || *name == '.') { name++; }
    8020697e:	02000793          	li	a5,32
    80206982:	02e00713          	li	a4,46
    80206986:	a011                	j	8020698a <formatname+0x1e>
    80206988:	0485                	addi	s1,s1,1
    8020698a:	0004c583          	lbu	a1,0(s1)
    8020698e:	fef58de3          	beq	a1,a5,80206988 <formatname+0x1c>
    80206992:	fee58be3          	beq	a1,a4,80206988 <formatname+0x1c>
    for (p = name; *p; p++) {
    80206996:	c1b9                	beqz	a1,802069dc <formatname+0x70>
    80206998:	8926                	mv	s2,s1
        if (c < 0x20 || strchr(illegal, c)) {
    8020699a:	49fd                	li	s3,31
    8020699c:	00006a17          	auipc	s4,0x6
    802069a0:	6fca0a13          	addi	s4,s4,1788 # 8020d098 <illegal.1646>
    802069a4:	02b9fe63          	bgeu	s3,a1,802069e0 <formatname+0x74>
    802069a8:	8552                	mv	a0,s4
    802069aa:	ffffa097          	auipc	ra,0xffffa
    802069ae:	024080e7          	jalr	36(ra) # 802009ce <strchr>
    802069b2:	e121                	bnez	a0,802069f2 <formatname+0x86>
    for (p = name; *p; p++) {
    802069b4:	0905                	addi	s2,s2,1
    802069b6:	00094583          	lbu	a1,0(s2)
    802069ba:	f5ed                	bnez	a1,802069a4 <formatname+0x38>
        if (*p != ' ') {
    802069bc:	02000693          	li	a3,32
    802069c0:	874a                	mv	a4,s2
    while (p-- > name) {
    802069c2:	0124fb63          	bgeu	s1,s2,802069d8 <formatname+0x6c>
        if (*p != ' ') {
    802069c6:	197d                	addi	s2,s2,-1
    802069c8:	00094783          	lbu	a5,0(s2)
    802069cc:	fed78ae3          	beq	a5,a3,802069c0 <formatname+0x54>
            p[1] = '\0';
    802069d0:	00070023          	sb	zero,0(a4)
            break;
    802069d4:	8526                	mv	a0,s1
    802069d6:	a031                	j	802069e2 <formatname+0x76>
    802069d8:	8526                	mv	a0,s1
    802069da:	a021                	j	802069e2 <formatname+0x76>
    for (p = name; *p; p++) {
    802069dc:	8526                	mv	a0,s1
    802069de:	a011                	j	802069e2 <formatname+0x76>
            return 0;
    802069e0:	4501                	li	a0,0
}
    802069e2:	70a2                	ld	ra,40(sp)
    802069e4:	7402                	ld	s0,32(sp)
    802069e6:	64e2                	ld	s1,24(sp)
    802069e8:	6942                	ld	s2,16(sp)
    802069ea:	69a2                	ld	s3,8(sp)
    802069ec:	6a02                	ld	s4,0(sp)
    802069ee:	6145                	addi	sp,sp,48
    802069f0:	8082                	ret
            return 0;
    802069f2:	4501                	li	a0,0
    802069f4:	b7fd                	j	802069e2 <formatname+0x76>

00000000802069f6 <cal_checksum>:
{
    802069f6:	1141                	addi	sp,sp,-16
    802069f8:	e422                	sd	s0,8(sp)
    802069fa:	0800                	addi	s0,sp,16
    802069fc:	87aa                	mv	a5,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    802069fe:	00b50613          	addi	a2,a0,11
    uint8 sum = 0;
    80206a02:	4501                	li	a0,0
        sum = ((sum & 1) ? 0x80 : 0) + (sum >> 1) + *shortname++;
    80206a04:	0075171b          	slliw	a4,a0,0x7
    80206a08:	0785                	addi	a5,a5,1
    80206a0a:	0015551b          	srliw	a0,a0,0x1
    80206a0e:	fff7c683          	lbu	a3,-1(a5) # fffffff <_entry-0x70200001>
    80206a12:	9d35                	addw	a0,a0,a3
    80206a14:	953a                	add	a0,a0,a4
    80206a16:	0ff57513          	andi	a0,a0,255
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    80206a1a:	fef615e3          	bne	a2,a5,80206a04 <cal_checksum+0xe>
}
    80206a1e:	6422                	ld	s0,8(sp)
    80206a20:	0141                	addi	sp,sp,16
    80206a22:	8082                	ret

0000000080206a24 <emake>:
{
    80206a24:	7131                	addi	sp,sp,-192
    80206a26:	fd06                	sd	ra,184(sp)
    80206a28:	f922                	sd	s0,176(sp)
    80206a2a:	f526                	sd	s1,168(sp)
    80206a2c:	f14a                	sd	s2,160(sp)
    80206a2e:	ed4e                	sd	s3,152(sp)
    80206a30:	e952                	sd	s4,144(sp)
    80206a32:	e556                	sd	s5,136(sp)
    80206a34:	e15a                	sd	s6,128(sp)
    80206a36:	fcde                	sd	s7,120(sp)
    80206a38:	f8e2                	sd	s8,112(sp)
    80206a3a:	f4e6                	sd	s9,104(sp)
    80206a3c:	f0ea                	sd	s10,96(sp)
    80206a3e:	ecee                	sd	s11,88(sp)
    80206a40:	0180                	addi	s0,sp,192
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206a42:	10054783          	lbu	a5,256(a0)
    80206a46:	8bc1                	andi	a5,a5,16
    80206a48:	c3d5                	beqz	a5,80206aec <emake+0xc8>
    80206a4a:	8b2a                	mv	s6,a0
    80206a4c:	8d2e                	mv	s10,a1
    80206a4e:	8cb2                	mv	s9,a2
    if (off % sizeof(union dentry))
    80206a50:	01f67793          	andi	a5,a2,31
    80206a54:	e7c5                	bnez	a5,80206afc <emake+0xd8>
    memset(&de, 0, sizeof(de));
    80206a56:	02000613          	li	a2,32
    80206a5a:	4581                	li	a1,0
    80206a5c:	f7040513          	addi	a0,s0,-144
    80206a60:	ffffa097          	auipc	ra,0xffffa
    80206a64:	d04080e7          	jalr	-764(ra) # 80200764 <memset>
    if (off <= 32) {
    80206a68:	02000793          	li	a5,32
    80206a6c:	0b97ec63          	bltu	a5,s9,80206b24 <emake+0x100>
        if (off == 0) {
    80206a70:	080c9e63          	bnez	s9,80206b0c <emake+0xe8>
            strncpy(de.sne.name, ".          ", sizeof(de.sne.name));
    80206a74:	462d                	li	a2,11
    80206a76:	00004597          	auipc	a1,0x4
    80206a7a:	33258593          	addi	a1,a1,818 # 8020ada8 <digits+0xa28>
    80206a7e:	f7040513          	addi	a0,s0,-144
    80206a82:	ffffa097          	auipc	ra,0xffffa
    80206a86:	dfa080e7          	jalr	-518(ra) # 8020087c <strncpy>
        de.sne.attr = ATTR_DIRECTORY;
    80206a8a:	47c1                	li	a5,16
    80206a8c:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);        // first clus high 16 bits
    80206a90:	104d2783          	lw	a5,260(s10)
    80206a94:	0107d71b          	srliw	a4,a5,0x10
    80206a98:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);       // low 16 bits
    80206a9c:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = 0;                                       // filesize is updated in eupdate()
    80206aa0:	f8042623          	sw	zero,-116(s0)
        off = reloc_clus(dp, off, 1);
    80206aa4:	4605                	li	a2,1
    80206aa6:	85e6                	mv	a1,s9
    80206aa8:	855a                	mv	a0,s6
    80206aaa:	fffff097          	auipc	ra,0xfffff
    80206aae:	688080e7          	jalr	1672(ra) # 80206132 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206ab2:	02000793          	li	a5,32
    80206ab6:	0005071b          	sext.w	a4,a0
    80206aba:	f7040693          	addi	a3,s0,-144
    80206abe:	4601                	li	a2,0
    80206ac0:	4585                	li	a1,1
    80206ac2:	10cb2503          	lw	a0,268(s6)
    80206ac6:	fffff097          	auipc	ra,0xfffff
    80206aca:	776080e7          	jalr	1910(ra) # 8020623c <rw_clus>
}
    80206ace:	70ea                	ld	ra,184(sp)
    80206ad0:	744a                	ld	s0,176(sp)
    80206ad2:	74aa                	ld	s1,168(sp)
    80206ad4:	790a                	ld	s2,160(sp)
    80206ad6:	69ea                	ld	s3,152(sp)
    80206ad8:	6a4a                	ld	s4,144(sp)
    80206ada:	6aaa                	ld	s5,136(sp)
    80206adc:	6b0a                	ld	s6,128(sp)
    80206ade:	7be6                	ld	s7,120(sp)
    80206ae0:	7c46                	ld	s8,112(sp)
    80206ae2:	7ca6                	ld	s9,104(sp)
    80206ae4:	7d06                	ld	s10,96(sp)
    80206ae6:	6de6                	ld	s11,88(sp)
    80206ae8:	6129                	addi	sp,sp,192
    80206aea:	8082                	ret
        panic("emake: not dir");
    80206aec:	00004517          	auipc	a0,0x4
    80206af0:	29450513          	addi	a0,a0,660 # 8020ad80 <digits+0xa00>
    80206af4:	ffff9097          	auipc	ra,0xffff9
    80206af8:	64e080e7          	jalr	1614(ra) # 80200142 <panic>
        panic("emake: not aligned");
    80206afc:	00004517          	auipc	a0,0x4
    80206b00:	29450513          	addi	a0,a0,660 # 8020ad90 <digits+0xa10>
    80206b04:	ffff9097          	auipc	ra,0xffff9
    80206b08:	63e080e7          	jalr	1598(ra) # 80200142 <panic>
            strncpy(de.sne.name, "..         ", sizeof(de.sne.name));
    80206b0c:	462d                	li	a2,11
    80206b0e:	00004597          	auipc	a1,0x4
    80206b12:	2aa58593          	addi	a1,a1,682 # 8020adb8 <digits+0xa38>
    80206b16:	f7040513          	addi	a0,s0,-144
    80206b1a:	ffffa097          	auipc	ra,0xffffa
    80206b1e:	d62080e7          	jalr	-670(ra) # 8020087c <strncpy>
    80206b22:	b7a5                	j	80206a8a <emake+0x66>
        int entcnt = (strlen(ep->filename) + CHAR_LONG_NAME - 1) / CHAR_LONG_NAME;   // count of l-n-entries, rounds up
    80206b24:	896a                	mv	s2,s10
    80206b26:	856a                	mv	a0,s10
    80206b28:	ffffa097          	auipc	ra,0xffffa
    80206b2c:	dc4080e7          	jalr	-572(ra) # 802008ec <strlen>
    80206b30:	f4a43823          	sd	a0,-176(s0)
    80206b34:	00c5071b          	addiw	a4,a0,12
    80206b38:	47b5                	li	a5,13
    80206b3a:	02f747bb          	divw	a5,a4,a5
    80206b3e:	f4f42c23          	sw	a5,-168(s0)
    80206b42:	00078d9b          	sext.w	s11,a5
        memset(shortname, 0, sizeof(shortname));
    80206b46:	4631                	li	a2,12
    80206b48:	4581                	li	a1,0
    80206b4a:	f6040513          	addi	a0,s0,-160
    80206b4e:	ffffa097          	auipc	ra,0xffffa
    80206b52:	c16080e7          	jalr	-1002(ra) # 80200764 <memset>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80206b56:	856a                	mv	a0,s10
    80206b58:	ffffa097          	auipc	ra,0xffffa
    80206b5c:	d94080e7          	jalr	-620(ra) # 802008ec <strlen>
    80206b60:	fff5079b          	addiw	a5,a0,-1
    80206b64:	0407c063          	bltz	a5,80206ba4 <emake+0x180>
    80206b68:	97ea                	add	a5,a5,s10
    80206b6a:	ffed0693          	addi	a3,s10,-2
    80206b6e:	96aa                	add	a3,a3,a0
    80206b70:	fff5071b          	addiw	a4,a0,-1
    80206b74:	1702                	slli	a4,a4,0x20
    80206b76:	9301                	srli	a4,a4,0x20
    80206b78:	8e99                	sub	a3,a3,a4
        if (name[j] == '.') {
    80206b7a:	02e00613          	li	a2,46
    80206b7e:	89be                	mv	s3,a5
    80206b80:	0007c703          	lbu	a4,0(a5)
    80206b84:	00c70663          	beq	a4,a2,80206b90 <emake+0x16c>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80206b88:	17fd                	addi	a5,a5,-1
    80206b8a:	fed79ae3          	bne	a5,a3,80206b7e <emake+0x15a>
    char c, *p = name;
    80206b8e:	89ea                	mv	s3,s10
        shortname[i++] = c;
    80206b90:	4481                	li	s1,0
        if (i == 8 && p) {
    80206b92:	4aa1                	li	s5,8
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206b94:	4ba9                	li	s7,10
        if (c == '.') {
    80206b96:	02e00c13          	li	s8,46
                memset(shortname + i, ' ', 8 - i);
    80206b9a:	f6040793          	addi	a5,s0,-160
    80206b9e:	f4f43423          	sd	a5,-184(s0)
    80206ba2:	a0f1                	j	80206c6e <emake+0x24a>
    char c, *p = name;
    80206ba4:	89ea                	mv	s3,s10
    80206ba6:	b7ed                	j	80206b90 <emake+0x16c>
        if (i == 8 && p) {
    80206ba8:	22098163          	beqz	s3,80206dca <emake+0x3a6>
            if (p + 1 < name) { break; }            // no '.'
    80206bac:	0985                	addi	s3,s3,1
    80206bae:	0949f763          	bgeu	s3,s4,80206c3c <emake+0x218>
    80206bb2:	f6040793          	addi	a5,s0,-160
    80206bb6:	97a6                	add	a5,a5,s1
        shortname[i++] = ' ';
    80206bb8:	02000693          	li	a3,32
    while (i < CHAR_SHORT_NAME) {
    80206bbc:	4729                	li	a4,10
        shortname[i++] = ' ';
    80206bbe:	2485                	addiw	s1,s1,1
    80206bc0:	00d78023          	sb	a3,0(a5)
    while (i < CHAR_SHORT_NAME) {
    80206bc4:	0785                	addi	a5,a5,1
    80206bc6:	fe975ce3          	bge	a4,s1,80206bbe <emake+0x19a>
        de.lne.checksum = cal_checksum((uchar *)shortname);
    80206bca:	f6040513          	addi	a0,s0,-160
    80206bce:	00000097          	auipc	ra,0x0
    80206bd2:	e28080e7          	jalr	-472(ra) # 802069f6 <cal_checksum>
    80206bd6:	f6a40ea3          	sb	a0,-131(s0)
        de.lne.attr = ATTR_LONG_NAME;
    80206bda:	47bd                	li	a5,15
    80206bdc:	f6f40da3          	sb	a5,-133(s0)
        for (int i = entcnt; i > 0; i--) {
    80206be0:	f5043783          	ld	a5,-176(s0)
    80206be4:	0ef05f63          	blez	a5,80206ce2 <emake+0x2be>
    80206be8:	f5842783          	lw	a5,-168(s0)
    80206bec:	37fd                	addiw	a5,a5,-1
    80206bee:	f4f42423          	sw	a5,-184(s0)
    80206bf2:	00179b9b          	slliw	s7,a5,0x1
    80206bf6:	00fb8bbb          	addw	s7,s7,a5
    80206bfa:	002b9b9b          	slliw	s7,s7,0x2
    80206bfe:	00fb8bbb          	addw	s7,s7,a5
    80206c02:	9bea                	add	s7,s7,s10
    80206c04:	8a6e                	mv	s4,s11
    80206c06:	8c66                	mv	s8,s9
            uint8 *w = (uint8 *)de.lne.name1;
    80206c08:	f7140793          	addi	a5,s0,-143
    80206c0c:	f4f43c23          	sd	a5,-168(s0)
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    80206c10:	597d                	li	s2,-1
                switch (j) {
    80206c12:	44ad                	li	s1,11
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80206c14:	f7e40a93          	addi	s5,s0,-130
                switch (j) {
    80206c18:	f8c40993          	addi	s3,s0,-116
    80206c1c:	aa41                	j	80206dac <emake+0x388>
            if (name > p) {                    // last '.'
    80206c1e:	0549f563          	bgeu	s3,s4,80206c68 <emake+0x244>
                memset(shortname + i, ' ', 8 - i);
    80206c22:	4621                	li	a2,8
    80206c24:	9e05                	subw	a2,a2,s1
    80206c26:	02000593          	li	a1,32
    80206c2a:	f4843783          	ld	a5,-184(s0)
    80206c2e:	00978533          	add	a0,a5,s1
    80206c32:	ffffa097          	auipc	ra,0xffffa
    80206c36:	b32080e7          	jalr	-1230(ra) # 80200764 <memset>
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206c3a:	89d2                	mv	s3,s4
        shortname[i++] = c;
    80206c3c:	8a4e                	mv	s4,s3
    80206c3e:	84d6                	mv	s1,s5
    80206c40:	4981                	li	s3,0
    80206c42:	a02d                	j	80206c6c <emake+0x248>
            if (strchr(illegal, c) != NULL) {
    80206c44:	85ca                	mv	a1,s2
    80206c46:	00006517          	auipc	a0,0x6
    80206c4a:	46250513          	addi	a0,a0,1122 # 8020d0a8 <illegal.1662>
    80206c4e:	ffffa097          	auipc	ra,0xffffa
    80206c52:	d80080e7          	jalr	-640(ra) # 802009ce <strchr>
    80206c56:	c119                	beqz	a0,80206c5c <emake+0x238>
                c = '_';
    80206c58:	05f00913          	li	s2,95
        shortname[i++] = c;
    80206c5c:	f9040793          	addi	a5,s0,-112
    80206c60:	97a6                	add	a5,a5,s1
    80206c62:	fd278823          	sb	s2,-48(a5)
    80206c66:	2485                	addiw	s1,s1,1
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206c68:	f69bc1e3          	blt	s7,s1,80206bca <emake+0x1a6>
        shortname[i++] = c;
    80206c6c:	8952                	mv	s2,s4
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206c6e:	00190a13          	addi	s4,s2,1
    80206c72:	00094903          	lbu	s2,0(s2)
    80206c76:	02090563          	beqz	s2,80206ca0 <emake+0x27c>
        if (i == 8 && p) {
    80206c7a:	f35487e3          	beq	s1,s5,80206ba8 <emake+0x184>
        if (c == ' ') { continue; }
    80206c7e:	02000793          	li	a5,32
    80206c82:	fef903e3          	beq	s2,a5,80206c68 <emake+0x244>
        if (c == '.') {
    80206c86:	f9890ce3          	beq	s2,s8,80206c1e <emake+0x1fa>
        if (c >= 'a' && c <= 'z') {
    80206c8a:	f9f9079b          	addiw	a5,s2,-97
    80206c8e:	0ff7f793          	andi	a5,a5,255
    80206c92:	4765                	li	a4,25
    80206c94:	faf768e3          	bltu	a4,a5,80206c44 <emake+0x220>
            c += 'A' - 'a';
    80206c98:	3901                	addiw	s2,s2,-32
    80206c9a:	0ff97913          	andi	s2,s2,255
    80206c9e:	bf7d                	j	80206c5c <emake+0x238>
    while (i < CHAR_SHORT_NAME) {
    80206ca0:	47a9                	li	a5,10
    80206ca2:	f097d8e3          	bge	a5,s1,80206bb2 <emake+0x18e>
    80206ca6:	b715                	j	80206bca <emake+0x1a6>
                de.lne.order |= LAST_LONG_ENTRY;
    80206ca8:	0407e793          	ori	a5,a5,64
    80206cac:	f6f40823          	sb	a5,-144(s0)
    80206cb0:	a221                	j	80206db8 <emake+0x394>
                    if ((*w++ = *p++) == 0) {
    80206cb2:	0005c683          	lbu	a3,0(a1)
    80206cb6:	00d78023          	sb	a3,0(a5)
                        end = 1;
    80206cba:	0016b693          	seqz	a3,a3
                    *w++ = 0;
    80206cbe:	000780a3          	sb	zero,1(a5)
    80206cc2:	0789                	addi	a5,a5,2
                    if ((*w++ = *p++) == 0) {
    80206cc4:	0585                	addi	a1,a1,1
    80206cc6:	a04d                	j	80206d68 <emake+0x344>
    80206cc8:	020c8c9b          	addiw	s9,s9,32
    80206ccc:	4781                	li	a5,0
    80206cce:	f5043703          	ld	a4,-176(s0)
    80206cd2:	00e05663          	blez	a4,80206cde <emake+0x2ba>
    80206cd6:	f4842783          	lw	a5,-184(s0)
    80206cda:	0057979b          	slliw	a5,a5,0x5
    80206cde:	01978cbb          	addw	s9,a5,s9
        memset(&de, 0, sizeof(de));
    80206ce2:	02000613          	li	a2,32
    80206ce6:	4581                	li	a1,0
    80206ce8:	f7040493          	addi	s1,s0,-144
    80206cec:	8526                	mv	a0,s1
    80206cee:	ffffa097          	auipc	ra,0xffffa
    80206cf2:	a76080e7          	jalr	-1418(ra) # 80200764 <memset>
        strncpy(de.sne.name, shortname, sizeof(de.sne.name));
    80206cf6:	462d                	li	a2,11
    80206cf8:	f6040593          	addi	a1,s0,-160
    80206cfc:	8526                	mv	a0,s1
    80206cfe:	ffffa097          	auipc	ra,0xffffa
    80206d02:	b7e080e7          	jalr	-1154(ra) # 8020087c <strncpy>
        de.sne.attr = ep->attribute;
    80206d06:	100d4783          	lbu	a5,256(s10)
    80206d0a:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);      // first clus high 16 bits
    80206d0e:	104d2783          	lw	a5,260(s10)
    80206d12:	0107d71b          	srliw	a4,a5,0x10
    80206d16:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);     // low 16 bits
    80206d1a:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = ep->file_size;                         // filesize is updated in eupdate()
    80206d1e:	108d2783          	lw	a5,264(s10)
    80206d22:	f8f42623          	sw	a5,-116(s0)
        off = reloc_clus(dp, off, 1);
    80206d26:	4605                	li	a2,1
    80206d28:	85e6                	mv	a1,s9
    80206d2a:	855a                	mv	a0,s6
    80206d2c:	fffff097          	auipc	ra,0xfffff
    80206d30:	406080e7          	jalr	1030(ra) # 80206132 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206d34:	02000793          	li	a5,32
    80206d38:	0005071b          	sext.w	a4,a0
    80206d3c:	86a6                	mv	a3,s1
    80206d3e:	4601                	li	a2,0
    80206d40:	4585                	li	a1,1
    80206d42:	10cb2503          	lw	a0,268(s6)
    80206d46:	fffff097          	auipc	ra,0xfffff
    80206d4a:	4f6080e7          	jalr	1270(ra) # 8020623c <rw_clus>
}
    80206d4e:	b341                	j	80206ace <emake+0xaa>
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80206d50:	87d6                	mv	a5,s5
    80206d52:	a011                	j	80206d56 <emake+0x332>
                switch (j) {
    80206d54:	87ce                	mv	a5,s3
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206d56:	2705                	addiw	a4,a4,1
    80206d58:	fff7061b          	addiw	a2,a4,-1
                if (end) {
    80206d5c:	dab9                	beqz	a3,80206cb2 <emake+0x28e>
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    80206d5e:	01278023          	sb	s2,0(a5)
                    *w++ = 0xff;
    80206d62:	012780a3          	sb	s2,1(a5)
    80206d66:	0789                	addi	a5,a5,2
                switch (j) {
    80206d68:	fea604e3          	beq	a2,a0,80206d50 <emake+0x32c>
    80206d6c:	fe9604e3          	beq	a2,s1,80206d54 <emake+0x330>
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206d70:	0007061b          	sext.w	a2,a4
    80206d74:	fec851e3          	bge	a6,a2,80206d56 <emake+0x332>
            uint off2 = reloc_clus(dp, off, 1);
    80206d78:	4605                	li	a2,1
    80206d7a:	85e2                	mv	a1,s8
    80206d7c:	855a                	mv	a0,s6
    80206d7e:	fffff097          	auipc	ra,0xfffff
    80206d82:	3b4080e7          	jalr	948(ra) # 80206132 <reloc_clus>
            rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off2, sizeof(de));
    80206d86:	02000793          	li	a5,32
    80206d8a:	0005071b          	sext.w	a4,a0
    80206d8e:	f7040693          	addi	a3,s0,-144
    80206d92:	4601                	li	a2,0
    80206d94:	4585                	li	a1,1
    80206d96:	10cb2503          	lw	a0,268(s6)
    80206d9a:	fffff097          	auipc	ra,0xfffff
    80206d9e:	4a2080e7          	jalr	1186(ra) # 8020623c <rw_clus>
            off += sizeof(de);
    80206da2:	020c0c1b          	addiw	s8,s8,32
        for (int i = entcnt; i > 0; i--) {
    80206da6:	1bcd                	addi	s7,s7,-13
    80206da8:	f34050e3          	blez	s4,80206cc8 <emake+0x2a4>
            if ((de.lne.order = i) == entcnt) {
    80206dac:	0ffa7793          	andi	a5,s4,255
    80206db0:	eefd8ce3          	beq	s11,a5,80206ca8 <emake+0x284>
    80206db4:	f6f40823          	sb	a5,-144(s0)
            char *p = ep->filename + (i - 1) * CHAR_LONG_NAME;
    80206db8:	3a7d                	addiw	s4,s4,-1
    80206dba:	85de                	mv	a1,s7
    80206dbc:	4709                	li	a4,2
            int end = 0;
    80206dbe:	4681                	li	a3,0
            uint8 *w = (uint8 *)de.lne.name1;
    80206dc0:	f5843783          	ld	a5,-168(s0)
                switch (j) {
    80206dc4:	4515                	li	a0,5
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206dc6:	4835                	li	a6,13
    80206dc8:	bf41                	j	80206d58 <emake+0x334>
        if (c == ' ') { continue; }
    80206dca:	02000793          	li	a5,32
    80206dce:	eaf91ce3          	bne	s2,a5,80206c86 <emake+0x262>
    80206dd2:	bd69                	j	80206c6c <emake+0x248>

0000000080206dd4 <edup>:
{
    80206dd4:	1101                	addi	sp,sp,-32
    80206dd6:	ec06                	sd	ra,24(sp)
    80206dd8:	e822                	sd	s0,16(sp)
    80206dda:	e426                	sd	s1,8(sp)
    80206ddc:	1000                	addi	s0,sp,32
    80206dde:	84aa                	mv	s1,a0
    if (entry != 0) {
    80206de0:	c515                	beqz	a0,80206e0c <edup+0x38>
        acquire(&ecache.lock);
    80206de2:	00025517          	auipc	a0,0x25
    80206de6:	b3650513          	addi	a0,a0,-1226 # 8022b918 <ecache>
    80206dea:	ffffa097          	auipc	ra,0xffffa
    80206dee:	8de080e7          	jalr	-1826(ra) # 802006c8 <acquire>
        entry->ref++;
    80206df2:	1184a783          	lw	a5,280(s1)
    80206df6:	2785                	addiw	a5,a5,1
    80206df8:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    80206dfc:	00025517          	auipc	a0,0x25
    80206e00:	b1c50513          	addi	a0,a0,-1252 # 8022b918 <ecache>
    80206e04:	ffffa097          	auipc	ra,0xffffa
    80206e08:	918080e7          	jalr	-1768(ra) # 8020071c <release>
}
    80206e0c:	8526                	mv	a0,s1
    80206e0e:	60e2                	ld	ra,24(sp)
    80206e10:	6442                	ld	s0,16(sp)
    80206e12:	64a2                	ld	s1,8(sp)
    80206e14:	6105                	addi	sp,sp,32
    80206e16:	8082                	ret

0000000080206e18 <eupdate>:
    if (!entry->dirty || entry->valid != 1) { return; }
    80206e18:	11554783          	lbu	a5,277(a0)
    80206e1c:	c3e5                	beqz	a5,80206efc <eupdate+0xe4>
{
    80206e1e:	711d                	addi	sp,sp,-96
    80206e20:	ec86                	sd	ra,88(sp)
    80206e22:	e8a2                	sd	s0,80(sp)
    80206e24:	e4a6                	sd	s1,72(sp)
    80206e26:	e0ca                	sd	s2,64(sp)
    80206e28:	fc4e                	sd	s3,56(sp)
    80206e2a:	1080                	addi	s0,sp,96
    80206e2c:	84aa                	mv	s1,a0
    if (!entry->dirty || entry->valid != 1) { return; }
    80206e2e:	11651703          	lh	a4,278(a0)
    80206e32:	4785                	li	a5,1
    80206e34:	00f70963          	beq	a4,a5,80206e46 <eupdate+0x2e>
}
    80206e38:	60e6                	ld	ra,88(sp)
    80206e3a:	6446                	ld	s0,80(sp)
    80206e3c:	64a6                	ld	s1,72(sp)
    80206e3e:	6906                	ld	s2,64(sp)
    80206e40:	79e2                	ld	s3,56(sp)
    80206e42:	6125                	addi	sp,sp,96
    80206e44:	8082                	ret
    uint entcnt = 0;
    80206e46:	fc042623          	sw	zero,-52(s0)
    uint32 off = reloc_clus(entry->parent, entry->off, 0);
    80206e4a:	4601                	li	a2,0
    80206e4c:	11c52583          	lw	a1,284(a0)
    80206e50:	12053503          	ld	a0,288(a0)
    80206e54:	fffff097          	auipc	ra,0xfffff
    80206e58:	2de080e7          	jalr	734(ra) # 80206132 <reloc_clus>
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off, 1);
    80206e5c:	1204b803          	ld	a6,288(s1)
    80206e60:	4785                	li	a5,1
    80206e62:	0005071b          	sext.w	a4,a0
    80206e66:	fcc40693          	addi	a3,s0,-52
    80206e6a:	4601                	li	a2,0
    80206e6c:	4581                	li	a1,0
    80206e6e:	10c82503          	lw	a0,268(a6)
    80206e72:	fffff097          	auipc	ra,0xfffff
    80206e76:	3ca080e7          	jalr	970(ra) # 8020623c <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    80206e7a:	fcc42583          	lw	a1,-52(s0)
    80206e7e:	fbf5f593          	andi	a1,a1,-65
    80206e82:	fcb42623          	sw	a1,-52(s0)
    off = reloc_clus(entry->parent, entry->off + (entcnt << 5), 0);
    80206e86:	0055959b          	slliw	a1,a1,0x5
    80206e8a:	11c4a783          	lw	a5,284(s1)
    80206e8e:	4601                	li	a2,0
    80206e90:	9dbd                	addw	a1,a1,a5
    80206e92:	1204b503          	ld	a0,288(s1)
    80206e96:	fffff097          	auipc	ra,0xfffff
    80206e9a:	29c080e7          	jalr	668(ra) # 80206132 <reloc_clus>
    80206e9e:	0005099b          	sext.w	s3,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64)&de, off, sizeof(de));
    80206ea2:	1204b503          	ld	a0,288(s1)
    80206ea6:	02000793          	li	a5,32
    80206eaa:	874e                	mv	a4,s3
    80206eac:	fa840913          	addi	s2,s0,-88
    80206eb0:	86ca                	mv	a3,s2
    80206eb2:	4601                	li	a2,0
    80206eb4:	4581                	li	a1,0
    80206eb6:	10c52503          	lw	a0,268(a0)
    80206eba:	fffff097          	auipc	ra,0xfffff
    80206ebe:	382080e7          	jalr	898(ra) # 8020623c <rw_clus>
    de.sne.fst_clus_hi = (uint16)(entry->first_clus >> 16);
    80206ec2:	1044a783          	lw	a5,260(s1)
    80206ec6:	0107d71b          	srliw	a4,a5,0x10
    80206eca:	fae41e23          	sh	a4,-68(s0)
    de.sne.fst_clus_lo = (uint16)(entry->first_clus & 0xffff);
    80206ece:	fcf41123          	sh	a5,-62(s0)
    de.sne.file_size = entry->file_size;
    80206ed2:	1084a783          	lw	a5,264(s1)
    80206ed6:	fcf42223          	sw	a5,-60(s0)
    rw_clus(entry->parent->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206eda:	1204b503          	ld	a0,288(s1)
    80206ede:	02000793          	li	a5,32
    80206ee2:	874e                	mv	a4,s3
    80206ee4:	86ca                	mv	a3,s2
    80206ee6:	4601                	li	a2,0
    80206ee8:	4585                	li	a1,1
    80206eea:	10c52503          	lw	a0,268(a0)
    80206eee:	fffff097          	auipc	ra,0xfffff
    80206ef2:	34e080e7          	jalr	846(ra) # 8020623c <rw_clus>
    entry->dirty = 0;
    80206ef6:	10048aa3          	sb	zero,277(s1)
    80206efa:	bf3d                	j	80206e38 <eupdate+0x20>
    80206efc:	8082                	ret

0000000080206efe <eremove>:
    if (entry->valid != 1) { return; }
    80206efe:	11651703          	lh	a4,278(a0)
    80206f02:	4785                	li	a5,1
    80206f04:	00f70363          	beq	a4,a5,80206f0a <eremove+0xc>
    80206f08:	8082                	ret
{
    80206f0a:	715d                	addi	sp,sp,-80
    80206f0c:	e486                	sd	ra,72(sp)
    80206f0e:	e0a2                	sd	s0,64(sp)
    80206f10:	fc26                	sd	s1,56(sp)
    80206f12:	f84a                	sd	s2,48(sp)
    80206f14:	f44e                	sd	s3,40(sp)
    80206f16:	f052                	sd	s4,32(sp)
    80206f18:	ec56                	sd	s5,24(sp)
    80206f1a:	0880                	addi	s0,sp,80
    80206f1c:	89aa                	mv	s3,a0
    uint entcnt = 0;
    80206f1e:	fa042e23          	sw	zero,-68(s0)
    uint32 off = entry->off;
    80206f22:	11c52a03          	lw	s4,284(a0)
    uint32 off2 = reloc_clus(entry->parent, off, 0);
    80206f26:	4601                	li	a2,0
    80206f28:	85d2                	mv	a1,s4
    80206f2a:	12053503          	ld	a0,288(a0)
    80206f2e:	fffff097          	auipc	ra,0xfffff
    80206f32:	204080e7          	jalr	516(ra) # 80206132 <reloc_clus>
    80206f36:	0005049b          	sext.w	s1,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off2, 1);
    80206f3a:	1209b503          	ld	a0,288(s3)
    80206f3e:	4785                	li	a5,1
    80206f40:	8726                	mv	a4,s1
    80206f42:	fbc40693          	addi	a3,s0,-68
    80206f46:	4601                	li	a2,0
    80206f48:	4581                	li	a1,0
    80206f4a:	10c52503          	lw	a0,268(a0)
    80206f4e:	fffff097          	auipc	ra,0xfffff
    80206f52:	2ee080e7          	jalr	750(ra) # 8020623c <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    80206f56:	fbc42783          	lw	a5,-68(s0)
    80206f5a:	fbf7f793          	andi	a5,a5,-65
    80206f5e:	faf42e23          	sw	a5,-68(s0)
    uint8 flag = EMPTY_ENTRY;
    80206f62:	5795                	li	a5,-27
    80206f64:	faf40da3          	sb	a5,-69(s0)
    for (int i = 0; i <= entcnt; i++) {
    80206f68:	4901                	li	s2,0
        rw_clus(entry->parent->cur_clus, 1, 0, (uint64) &flag, off2, 1);
    80206f6a:	fbb40a93          	addi	s5,s0,-69
    80206f6e:	1209b503          	ld	a0,288(s3)
    80206f72:	4785                	li	a5,1
    80206f74:	8726                	mv	a4,s1
    80206f76:	86d6                	mv	a3,s5
    80206f78:	4601                	li	a2,0
    80206f7a:	4585                	li	a1,1
    80206f7c:	10c52503          	lw	a0,268(a0)
    80206f80:	fffff097          	auipc	ra,0xfffff
    80206f84:	2bc080e7          	jalr	700(ra) # 8020623c <rw_clus>
        off += 32;
    80206f88:	020a0a1b          	addiw	s4,s4,32
        off2 = reloc_clus(entry->parent, off, 0);
    80206f8c:	4601                	li	a2,0
    80206f8e:	85d2                	mv	a1,s4
    80206f90:	1209b503          	ld	a0,288(s3)
    80206f94:	fffff097          	auipc	ra,0xfffff
    80206f98:	19e080e7          	jalr	414(ra) # 80206132 <reloc_clus>
    80206f9c:	0005049b          	sext.w	s1,a0
    for (int i = 0; i <= entcnt; i++) {
    80206fa0:	0019079b          	addiw	a5,s2,1
    80206fa4:	0007891b          	sext.w	s2,a5
    80206fa8:	fbc42703          	lw	a4,-68(s0)
    80206fac:	fd2771e3          	bgeu	a4,s2,80206f6e <eremove+0x70>
    entry->valid = -1;
    80206fb0:	57fd                	li	a5,-1
    80206fb2:	10f99b23          	sh	a5,278(s3)
}
    80206fb6:	60a6                	ld	ra,72(sp)
    80206fb8:	6406                	ld	s0,64(sp)
    80206fba:	74e2                	ld	s1,56(sp)
    80206fbc:	7942                	ld	s2,48(sp)
    80206fbe:	79a2                	ld	s3,40(sp)
    80206fc0:	7a02                	ld	s4,32(sp)
    80206fc2:	6ae2                	ld	s5,24(sp)
    80206fc4:	6161                	addi	sp,sp,80
    80206fc6:	8082                	ret

0000000080206fc8 <etrunc>:
{
    80206fc8:	7179                	addi	sp,sp,-48
    80206fca:	f406                	sd	ra,40(sp)
    80206fcc:	f022                	sd	s0,32(sp)
    80206fce:	ec26                	sd	s1,24(sp)
    80206fd0:	e84a                	sd	s2,16(sp)
    80206fd2:	e44e                	sd	s3,8(sp)
    80206fd4:	e052                	sd	s4,0(sp)
    80206fd6:	1800                	addi	s0,sp,48
    80206fd8:	8a2a                	mv	s4,a0
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80206fda:	10452483          	lw	s1,260(a0)
    80206fde:	ffe4871b          	addiw	a4,s1,-2
    80206fe2:	100007b7          	lui	a5,0x10000
    80206fe6:	17d5                	addi	a5,a5,-11
    80206fe8:	02e7e663          	bltu	a5,a4,80207014 <etrunc+0x4c>
    80206fec:	89be                	mv	s3,a5
        uint32 next = read_fat(clus);
    80206fee:	0004891b          	sext.w	s2,s1
    80206ff2:	8526                	mv	a0,s1
    80206ff4:	fffff097          	auipc	ra,0xfffff
    80206ff8:	f0a080e7          	jalr	-246(ra) # 80205efe <read_fat>
    80206ffc:	0005049b          	sext.w	s1,a0
    write_fat(cluster, 0);
    80207000:	4581                	li	a1,0
    80207002:	854a                	mv	a0,s2
    80207004:	fffff097          	auipc	ra,0xfffff
    80207008:	0ae080e7          	jalr	174(ra) # 802060b2 <write_fat>
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    8020700c:	ffe4879b          	addiw	a5,s1,-2
    80207010:	fcf9ffe3          	bgeu	s3,a5,80206fee <etrunc+0x26>
    entry->file_size = 0;
    80207014:	100a2423          	sw	zero,264(s4)
    entry->first_clus = 0;
    80207018:	100a2223          	sw	zero,260(s4)
    entry->dirty = 1;
    8020701c:	4785                	li	a5,1
    8020701e:	10fa0aa3          	sb	a5,277(s4)
}
    80207022:	70a2                	ld	ra,40(sp)
    80207024:	7402                	ld	s0,32(sp)
    80207026:	64e2                	ld	s1,24(sp)
    80207028:	6942                	ld	s2,16(sp)
    8020702a:	69a2                	ld	s3,8(sp)
    8020702c:	6a02                	ld	s4,0(sp)
    8020702e:	6145                	addi	sp,sp,48
    80207030:	8082                	ret

0000000080207032 <elock>:
{
    80207032:	1141                	addi	sp,sp,-16
    80207034:	e406                	sd	ra,8(sp)
    80207036:	e022                	sd	s0,0(sp)
    80207038:	0800                	addi	s0,sp,16
    if (entry == 0 || entry->ref < 1)
    8020703a:	cd19                	beqz	a0,80207058 <elock+0x26>
    8020703c:	11852783          	lw	a5,280(a0)
    80207040:	00f05c63          	blez	a5,80207058 <elock+0x26>
    acquiresleep(&entry->lock);
    80207044:	13850513          	addi	a0,a0,312
    80207048:	ffffd097          	auipc	ra,0xffffd
    8020704c:	b70080e7          	jalr	-1168(ra) # 80203bb8 <acquiresleep>
}
    80207050:	60a2                	ld	ra,8(sp)
    80207052:	6402                	ld	s0,0(sp)
    80207054:	0141                	addi	sp,sp,16
    80207056:	8082                	ret
        panic("elock");
    80207058:	00004517          	auipc	a0,0x4
    8020705c:	d7050513          	addi	a0,a0,-656 # 8020adc8 <digits+0xa48>
    80207060:	ffff9097          	auipc	ra,0xffff9
    80207064:	0e2080e7          	jalr	226(ra) # 80200142 <panic>

0000000080207068 <eunlock>:
{
    80207068:	1101                	addi	sp,sp,-32
    8020706a:	ec06                	sd	ra,24(sp)
    8020706c:	e822                	sd	s0,16(sp)
    8020706e:	e426                	sd	s1,8(sp)
    80207070:	e04a                	sd	s2,0(sp)
    80207072:	1000                	addi	s0,sp,32
    if (entry == 0 || !holdingsleep(&entry->lock) || entry->ref < 1)
    80207074:	c90d                	beqz	a0,802070a6 <eunlock+0x3e>
    80207076:	84aa                	mv	s1,a0
    80207078:	13850913          	addi	s2,a0,312
    8020707c:	854a                	mv	a0,s2
    8020707e:	ffffd097          	auipc	ra,0xffffd
    80207082:	bd4080e7          	jalr	-1068(ra) # 80203c52 <holdingsleep>
    80207086:	c105                	beqz	a0,802070a6 <eunlock+0x3e>
    80207088:	1184a783          	lw	a5,280(s1)
    8020708c:	00f05d63          	blez	a5,802070a6 <eunlock+0x3e>
    releasesleep(&entry->lock);
    80207090:	854a                	mv	a0,s2
    80207092:	ffffd097          	auipc	ra,0xffffd
    80207096:	b7c080e7          	jalr	-1156(ra) # 80203c0e <releasesleep>
}
    8020709a:	60e2                	ld	ra,24(sp)
    8020709c:	6442                	ld	s0,16(sp)
    8020709e:	64a2                	ld	s1,8(sp)
    802070a0:	6902                	ld	s2,0(sp)
    802070a2:	6105                	addi	sp,sp,32
    802070a4:	8082                	ret
        panic("eunlock");
    802070a6:	00004517          	auipc	a0,0x4
    802070aa:	d2a50513          	addi	a0,a0,-726 # 8020add0 <digits+0xa50>
    802070ae:	ffff9097          	auipc	ra,0xffff9
    802070b2:	094080e7          	jalr	148(ra) # 80200142 <panic>

00000000802070b6 <eput>:
{
    802070b6:	1101                	addi	sp,sp,-32
    802070b8:	ec06                	sd	ra,24(sp)
    802070ba:	e822                	sd	s0,16(sp)
    802070bc:	e426                	sd	s1,8(sp)
    802070be:	e04a                	sd	s2,0(sp)
    802070c0:	1000                	addi	s0,sp,32
    802070c2:	84aa                	mv	s1,a0
    acquire(&ecache.lock);
    802070c4:	00025517          	auipc	a0,0x25
    802070c8:	85450513          	addi	a0,a0,-1964 # 8022b918 <ecache>
    802070cc:	ffff9097          	auipc	ra,0xffff9
    802070d0:	5fc080e7          	jalr	1532(ra) # 802006c8 <acquire>
    if (entry != &root && entry->valid != 0 && entry->ref == 1) {
    802070d4:	00024797          	auipc	a5,0x24
    802070d8:	6dc78793          	addi	a5,a5,1756 # 8022b7b0 <root>
    802070dc:	00f48a63          	beq	s1,a5,802070f0 <eput+0x3a>
    802070e0:	11649783          	lh	a5,278(s1)
    802070e4:	c791                	beqz	a5,802070f0 <eput+0x3a>
    802070e6:	1184a703          	lw	a4,280(s1)
    802070ea:	4785                	li	a5,1
    802070ec:	02f70563          	beq	a4,a5,80207116 <eput+0x60>
    entry->ref--;
    802070f0:	1184a783          	lw	a5,280(s1)
    802070f4:	37fd                	addiw	a5,a5,-1
    802070f6:	10f4ac23          	sw	a5,280(s1)
    release(&ecache.lock);
    802070fa:	00025517          	auipc	a0,0x25
    802070fe:	81e50513          	addi	a0,a0,-2018 # 8022b918 <ecache>
    80207102:	ffff9097          	auipc	ra,0xffff9
    80207106:	61a080e7          	jalr	1562(ra) # 8020071c <release>
}
    8020710a:	60e2                	ld	ra,24(sp)
    8020710c:	6442                	ld	s0,16(sp)
    8020710e:	64a2                	ld	s1,8(sp)
    80207110:	6902                	ld	s2,0(sp)
    80207112:	6105                	addi	sp,sp,32
    80207114:	8082                	ret
        acquiresleep(&entry->lock);
    80207116:	13848913          	addi	s2,s1,312
    8020711a:	854a                	mv	a0,s2
    8020711c:	ffffd097          	auipc	ra,0xffffd
    80207120:	a9c080e7          	jalr	-1380(ra) # 80203bb8 <acquiresleep>
        entry->next->prev = entry->prev;
    80207124:	1284b703          	ld	a4,296(s1)
    80207128:	1304b783          	ld	a5,304(s1)
    8020712c:	12f73823          	sd	a5,304(a4)
        entry->prev->next = entry->next;
    80207130:	1284b703          	ld	a4,296(s1)
    80207134:	12e7b423          	sd	a4,296(a5)
        entry->next = root.next;
    80207138:	00024797          	auipc	a5,0x24
    8020713c:	65078793          	addi	a5,a5,1616 # 8022b788 <fat>
    80207140:	1507b703          	ld	a4,336(a5)
    80207144:	12e4b423          	sd	a4,296(s1)
        entry->prev = &root;
    80207148:	00024697          	auipc	a3,0x24
    8020714c:	66868693          	addi	a3,a3,1640 # 8022b7b0 <root>
    80207150:	12d4b823          	sd	a3,304(s1)
        root.next->prev = entry;
    80207154:	12973823          	sd	s1,304(a4)
        root.next = entry;
    80207158:	1497b823          	sd	s1,336(a5)
        release(&ecache.lock);
    8020715c:	00024517          	auipc	a0,0x24
    80207160:	7bc50513          	addi	a0,a0,1980 # 8022b918 <ecache>
    80207164:	ffff9097          	auipc	ra,0xffff9
    80207168:	5b8080e7          	jalr	1464(ra) # 8020071c <release>
        if (entry->valid == -1) {       // this means some one has called eremove()
    8020716c:	11649703          	lh	a4,278(s1)
    80207170:	57fd                	li	a5,-1
    80207172:	06f70863          	beq	a4,a5,802071e2 <eput+0x12c>
            elock(entry->parent);
    80207176:	1204b503          	ld	a0,288(s1)
    8020717a:	00000097          	auipc	ra,0x0
    8020717e:	eb8080e7          	jalr	-328(ra) # 80207032 <elock>
            eupdate(entry);
    80207182:	8526                	mv	a0,s1
    80207184:	00000097          	auipc	ra,0x0
    80207188:	c94080e7          	jalr	-876(ra) # 80206e18 <eupdate>
            eunlock(entry->parent);
    8020718c:	1204b503          	ld	a0,288(s1)
    80207190:	00000097          	auipc	ra,0x0
    80207194:	ed8080e7          	jalr	-296(ra) # 80207068 <eunlock>
        releasesleep(&entry->lock);
    80207198:	854a                	mv	a0,s2
    8020719a:	ffffd097          	auipc	ra,0xffffd
    8020719e:	a74080e7          	jalr	-1420(ra) # 80203c0e <releasesleep>
        struct dirent *eparent = entry->parent;
    802071a2:	1204b903          	ld	s2,288(s1)
        acquire(&ecache.lock);
    802071a6:	00024517          	auipc	a0,0x24
    802071aa:	77250513          	addi	a0,a0,1906 # 8022b918 <ecache>
    802071ae:	ffff9097          	auipc	ra,0xffff9
    802071b2:	51a080e7          	jalr	1306(ra) # 802006c8 <acquire>
        entry->ref--;
    802071b6:	1184a783          	lw	a5,280(s1)
    802071ba:	37fd                	addiw	a5,a5,-1
    802071bc:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    802071c0:	00024517          	auipc	a0,0x24
    802071c4:	75850513          	addi	a0,a0,1880 # 8022b918 <ecache>
    802071c8:	ffff9097          	auipc	ra,0xffff9
    802071cc:	554080e7          	jalr	1364(ra) # 8020071c <release>
        if (entry->ref == 0) {
    802071d0:	1184a783          	lw	a5,280(s1)
    802071d4:	fb9d                	bnez	a5,8020710a <eput+0x54>
            eput(eparent);
    802071d6:	854a                	mv	a0,s2
    802071d8:	00000097          	auipc	ra,0x0
    802071dc:	ede080e7          	jalr	-290(ra) # 802070b6 <eput>
    802071e0:	b72d                	j	8020710a <eput+0x54>
            etrunc(entry);
    802071e2:	8526                	mv	a0,s1
    802071e4:	00000097          	auipc	ra,0x0
    802071e8:	de4080e7          	jalr	-540(ra) # 80206fc8 <etrunc>
    802071ec:	b775                	j	80207198 <eput+0xe2>

00000000802071ee <estat>:
{
    802071ee:	1101                	addi	sp,sp,-32
    802071f0:	ec06                	sd	ra,24(sp)
    802071f2:	e822                	sd	s0,16(sp)
    802071f4:	e426                	sd	s1,8(sp)
    802071f6:	e04a                	sd	s2,0(sp)
    802071f8:	1000                	addi	s0,sp,32
    802071fa:	892a                	mv	s2,a0
    802071fc:	84ae                	mv	s1,a1
    strncpy(st->name, de->filename, STAT_MAX_NAME);
    802071fe:	02000613          	li	a2,32
    80207202:	85aa                	mv	a1,a0
    80207204:	8526                	mv	a0,s1
    80207206:	ffff9097          	auipc	ra,0xffff9
    8020720a:	676080e7          	jalr	1654(ra) # 8020087c <strncpy>
    st->type = (de->attribute & ATTR_DIRECTORY) ? T_DIR : T_FILE;
    8020720e:	10094783          	lbu	a5,256(s2)
    80207212:	8bc1                	andi	a5,a5,16
    80207214:	0017b793          	seqz	a5,a5
    80207218:	0785                	addi	a5,a5,1
    8020721a:	02f49423          	sh	a5,40(s1)
    st->dev = de->dev;
    8020721e:	11494783          	lbu	a5,276(s2)
    80207222:	d0dc                	sw	a5,36(s1)
    st->size = de->file_size;
    80207224:	10896783          	lwu	a5,264(s2)
    80207228:	f89c                	sd	a5,48(s1)
}
    8020722a:	60e2                	ld	ra,24(sp)
    8020722c:	6442                	ld	s0,16(sp)
    8020722e:	64a2                	ld	s1,8(sp)
    80207230:	6902                	ld	s2,0(sp)
    80207232:	6105                	addi	sp,sp,32
    80207234:	8082                	ret

0000000080207236 <enext>:
 * @return  -1      meet the end of dir
 *          0       find empty slots
 *          1       find a file with all its entries
 */
int enext(struct dirent *dp, struct dirent *ep, uint off, int *count)
{
    80207236:	7119                	addi	sp,sp,-128
    80207238:	fc86                	sd	ra,120(sp)
    8020723a:	f8a2                	sd	s0,112(sp)
    8020723c:	f4a6                	sd	s1,104(sp)
    8020723e:	f0ca                	sd	s2,96(sp)
    80207240:	ecce                	sd	s3,88(sp)
    80207242:	e8d2                	sd	s4,80(sp)
    80207244:	e4d6                	sd	s5,72(sp)
    80207246:	e0da                	sd	s6,64(sp)
    80207248:	fc5e                	sd	s7,56(sp)
    8020724a:	f862                	sd	s8,48(sp)
    8020724c:	f466                	sd	s9,40(sp)
    8020724e:	f06a                	sd	s10,32(sp)
    80207250:	0100                	addi	s0,sp,128
    if (!(dp->attribute & ATTR_DIRECTORY))
    80207252:	10054783          	lbu	a5,256(a0)
    80207256:	8bc1                	andi	a5,a5,16
    80207258:	cf9d                	beqz	a5,80207296 <enext+0x60>
    8020725a:	892a                	mv	s2,a0
    8020725c:	8aae                	mv	s5,a1
    8020725e:	84b2                	mv	s1,a2
    80207260:	8a36                	mv	s4,a3
        panic("enext not dir");
    if (ep->valid)
    80207262:	11659783          	lh	a5,278(a1)
    80207266:	e3a1                	bnez	a5,802072a6 <enext+0x70>
        panic("enext ep valid");
    if (off % 32)
    80207268:	01f67793          	andi	a5,a2,31
    8020726c:	e7a9                	bnez	a5,802072b6 <enext+0x80>
        panic("enext not align");
    if (dp->valid != 1) { return -1; }
    8020726e:	11651703          	lh	a4,278(a0)
    80207272:	4785                	li	a5,1
    80207274:	557d                	li	a0,-1
    80207276:	04f70863          	beq	a4,a5,802072c6 <enext+0x90>
            read_entry_info(ep, &de);
            return 1;
        }
    }
    return -1;
}
    8020727a:	70e6                	ld	ra,120(sp)
    8020727c:	7446                	ld	s0,112(sp)
    8020727e:	74a6                	ld	s1,104(sp)
    80207280:	7906                	ld	s2,96(sp)
    80207282:	69e6                	ld	s3,88(sp)
    80207284:	6a46                	ld	s4,80(sp)
    80207286:	6aa6                	ld	s5,72(sp)
    80207288:	6b06                	ld	s6,64(sp)
    8020728a:	7be2                	ld	s7,56(sp)
    8020728c:	7c42                	ld	s8,48(sp)
    8020728e:	7ca2                	ld	s9,40(sp)
    80207290:	7d02                	ld	s10,32(sp)
    80207292:	6109                	addi	sp,sp,128
    80207294:	8082                	ret
        panic("enext not dir");
    80207296:	00004517          	auipc	a0,0x4
    8020729a:	b4250513          	addi	a0,a0,-1214 # 8020add8 <digits+0xa58>
    8020729e:	ffff9097          	auipc	ra,0xffff9
    802072a2:	ea4080e7          	jalr	-348(ra) # 80200142 <panic>
        panic("enext ep valid");
    802072a6:	00004517          	auipc	a0,0x4
    802072aa:	b4250513          	addi	a0,a0,-1214 # 8020ade8 <digits+0xa68>
    802072ae:	ffff9097          	auipc	ra,0xffff9
    802072b2:	e94080e7          	jalr	-364(ra) # 80200142 <panic>
        panic("enext not align");
    802072b6:	00004517          	auipc	a0,0x4
    802072ba:	b4250513          	addi	a0,a0,-1214 # 8020adf8 <digits+0xa78>
    802072be:	ffff9097          	auipc	ra,0xffff9
    802072c2:	e84080e7          	jalr	-380(ra) # 80200142 <panic>
    memset(ep->filename, 0, FAT32_MAX_FILENAME + 1);
    802072c6:	8d2e                	mv	s10,a1
    802072c8:	10000613          	li	a2,256
    802072cc:	4581                	li	a1,0
    802072ce:	8556                	mv	a0,s5
    802072d0:	ffff9097          	auipc	ra,0xffff9
    802072d4:	494080e7          	jalr	1172(ra) # 80200764 <memset>
    int cnt = 0;
    802072d8:	4b01                	li	s6,0
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    802072da:	5bfd                	li	s7,-1
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    802072dc:	f8040993          	addi	s3,s0,-128
        if (de.lne.order == EMPTY_ENTRY) {
    802072e0:	0e500c13          	li	s8,229
        if (de.lne.attr == ATTR_LONG_NAME) {
    802072e4:	4cbd                	li	s9,15
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    802072e6:	a03d                	j	80207314 <enext+0xde>
            cnt++;
    802072e8:	2b05                	addiw	s6,s6,1
            continue;
    802072ea:	a01d                	j	80207310 <enext+0xda>
            *count = cnt;
    802072ec:	016a2023          	sw	s6,0(s4)
            return 0;
    802072f0:	4501                	li	a0,0
    802072f2:	b761                	j	8020727a <enext+0x44>
            read_entry_name(ep->filename + (lcnt - 1) * CHAR_LONG_NAME, &de);
    802072f4:	fff5079b          	addiw	a5,a0,-1
    802072f8:	0017951b          	slliw	a0,a5,0x1
    802072fc:	9d3d                	addw	a0,a0,a5
    802072fe:	0025151b          	slliw	a0,a0,0x2
    80207302:	9d3d                	addw	a0,a0,a5
    80207304:	85ce                	mv	a1,s3
    80207306:	956a                	add	a0,a0,s10
    80207308:	fffff097          	auipc	ra,0xfffff
    8020730c:	18e080e7          	jalr	398(ra) # 80206496 <read_entry_name>
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80207310:	0204849b          	addiw	s1,s1,32
    80207314:	4601                	li	a2,0
    80207316:	85a6                	mv	a1,s1
    80207318:	854a                	mv	a0,s2
    8020731a:	fffff097          	auipc	ra,0xfffff
    8020731e:	e18080e7          	jalr	-488(ra) # 80206132 <reloc_clus>
    80207322:	f5750ce3          	beq	a0,s7,8020727a <enext+0x44>
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    80207326:	02000793          	li	a5,32
    8020732a:	0005071b          	sext.w	a4,a0
    8020732e:	86ce                	mv	a3,s3
    80207330:	4601                	li	a2,0
    80207332:	4581                	li	a1,0
    80207334:	10c92503          	lw	a0,268(s2)
    80207338:	fffff097          	auipc	ra,0xfffff
    8020733c:	f04080e7          	jalr	-252(ra) # 8020623c <rw_clus>
    80207340:	2501                	sext.w	a0,a0
    80207342:	02000793          	li	a5,32
    80207346:	06f51c63          	bne	a0,a5,802073be <enext+0x188>
    8020734a:	f8044783          	lbu	a5,-128(s0)
    8020734e:	cbb5                	beqz	a5,802073c2 <enext+0x18c>
        if (de.lne.order == EMPTY_ENTRY) {
    80207350:	f9878ce3          	beq	a5,s8,802072e8 <enext+0xb2>
        } else if (cnt) {
    80207354:	f80b1ce3          	bnez	s6,802072ec <enext+0xb6>
        if (de.lne.attr == ATTR_LONG_NAME) {
    80207358:	f8b44703          	lbu	a4,-117(s0)
    8020735c:	01971d63          	bne	a4,s9,80207376 <enext+0x140>
            int lcnt = de.lne.order & ~LAST_LONG_ENTRY;
    80207360:	0bf7f513          	andi	a0,a5,191
            if (de.lne.order & LAST_LONG_ENTRY) {
    80207364:	0407f793          	andi	a5,a5,64
    80207368:	d7d1                	beqz	a5,802072f4 <enext+0xbe>
                *count = lcnt + 1;                              // plus the s-n-e;
    8020736a:	0015079b          	addiw	a5,a0,1
    8020736e:	00fa2023          	sw	a5,0(s4)
                count = 0;
    80207372:	4a01                	li	s4,0
    80207374:	b741                	j	802072f4 <enext+0xbe>
            if (count) {
    80207376:	000a0c63          	beqz	s4,8020738e <enext+0x158>
                *count = 1;
    8020737a:	4785                	li	a5,1
    8020737c:	00fa2023          	sw	a5,0(s4)
                read_entry_name(ep->filename, &de);
    80207380:	f8040593          	addi	a1,s0,-128
    80207384:	8556                	mv	a0,s5
    80207386:	fffff097          	auipc	ra,0xfffff
    8020738a:	110080e7          	jalr	272(ra) # 80206496 <read_entry_name>
    entry->attribute = d->sne.attr;
    8020738e:	f8b44783          	lbu	a5,-117(s0)
    80207392:	10fa8023          	sb	a5,256(s5)
    entry->first_clus = ((uint32)d->sne.fst_clus_hi << 16) | d->sne.fst_clus_lo;
    80207396:	f9445783          	lhu	a5,-108(s0)
    8020739a:	0107979b          	slliw	a5,a5,0x10
    8020739e:	f9a45703          	lhu	a4,-102(s0)
    802073a2:	8fd9                	or	a5,a5,a4
    802073a4:	2781                	sext.w	a5,a5
    802073a6:	10faa223          	sw	a5,260(s5)
    entry->file_size = d->sne.file_size;
    802073aa:	f9c42703          	lw	a4,-100(s0)
    802073ae:	10eaa423          	sw	a4,264(s5)
    entry->cur_clus = entry->first_clus;
    802073b2:	10faa623          	sw	a5,268(s5)
    entry->clus_cnt = 0;
    802073b6:	100aa823          	sw	zero,272(s5)
            return 1;
    802073ba:	4505                	li	a0,1
}
    802073bc:	bd7d                	j	8020727a <enext+0x44>
            return -1;
    802073be:	557d                	li	a0,-1
    802073c0:	bd6d                	j	8020727a <enext+0x44>
    802073c2:	557d                	li	a0,-1
    802073c4:	bd5d                	j	8020727a <enext+0x44>

00000000802073c6 <dirlookup>:
 * @param   dp          entry of a directory file
 * @param   filename    target filename
 * @param   poff        offset of proper empty entry slots from the beginning of the dir
 */
struct dirent *dirlookup(struct dirent *dp, char *filename, uint *poff)
{
    802073c6:	711d                	addi	sp,sp,-96
    802073c8:	ec86                	sd	ra,88(sp)
    802073ca:	e8a2                	sd	s0,80(sp)
    802073cc:	e4a6                	sd	s1,72(sp)
    802073ce:	e0ca                	sd	s2,64(sp)
    802073d0:	fc4e                	sd	s3,56(sp)
    802073d2:	f852                	sd	s4,48(sp)
    802073d4:	f456                	sd	s5,40(sp)
    802073d6:	f05a                	sd	s6,32(sp)
    802073d8:	ec5e                	sd	s7,24(sp)
    802073da:	1080                	addi	s0,sp,96
    if (!(dp->attribute & ATTR_DIRECTORY))
    802073dc:	10054783          	lbu	a5,256(a0)
    802073e0:	8bc1                	andi	a5,a5,16
    802073e2:	cbb1                	beqz	a5,80207436 <dirlookup+0x70>
    802073e4:	84aa                	mv	s1,a0
    802073e6:	89ae                	mv	s3,a1
    802073e8:	8ab2                	mv	s5,a2
        panic("dirlookup not DIR");
    if (strncmp(filename, ".", FAT32_MAX_FILENAME) == 0) {
    802073ea:	0ff00613          	li	a2,255
    802073ee:	00004597          	auipc	a1,0x4
    802073f2:	a3258593          	addi	a1,a1,-1486 # 8020ae20 <digits+0xaa0>
    802073f6:	854e                	mv	a0,s3
    802073f8:	ffff9097          	auipc	ra,0xffff9
    802073fc:	448080e7          	jalr	1096(ra) # 80200840 <strncmp>
    80207400:	c139                	beqz	a0,80207446 <dirlookup+0x80>
        return edup(dp);
    } else if (strncmp(filename, "..", FAT32_MAX_FILENAME) == 0) {
    80207402:	0ff00613          	li	a2,255
    80207406:	00004597          	auipc	a1,0x4
    8020740a:	a2258593          	addi	a1,a1,-1502 # 8020ae28 <digits+0xaa8>
    8020740e:	854e                	mv	a0,s3
    80207410:	ffff9097          	auipc	ra,0xffff9
    80207414:	430080e7          	jalr	1072(ra) # 80200840 <strncmp>
    80207418:	e125                	bnez	a0,80207478 <dirlookup+0xb2>
        if (dp == &root) {
    8020741a:	00024797          	auipc	a5,0x24
    8020741e:	39678793          	addi	a5,a5,918 # 8022b7b0 <root>
    80207422:	04f48463          	beq	s1,a5,8020746a <dirlookup+0xa4>
            return edup(&root);
        }
        return edup(dp->parent);
    80207426:	1204b503          	ld	a0,288(s1)
    8020742a:	00000097          	auipc	ra,0x0
    8020742e:	9aa080e7          	jalr	-1622(ra) # 80206dd4 <edup>
    80207432:	892a                	mv	s2,a0
    80207434:	a839                	j	80207452 <dirlookup+0x8c>
        panic("dirlookup not DIR");
    80207436:	00004517          	auipc	a0,0x4
    8020743a:	9d250513          	addi	a0,a0,-1582 # 8020ae08 <digits+0xa88>
    8020743e:	ffff9097          	auipc	ra,0xffff9
    80207442:	d04080e7          	jalr	-764(ra) # 80200142 <panic>
        return edup(dp);
    80207446:	8526                	mv	a0,s1
    80207448:	00000097          	auipc	ra,0x0
    8020744c:	98c080e7          	jalr	-1652(ra) # 80206dd4 <edup>
    80207450:	892a                	mv	s2,a0
    if (poff) {
        *poff = off;
    }
    eput(ep);
    return NULL;
}
    80207452:	854a                	mv	a0,s2
    80207454:	60e6                	ld	ra,88(sp)
    80207456:	6446                	ld	s0,80(sp)
    80207458:	64a6                	ld	s1,72(sp)
    8020745a:	6906                	ld	s2,64(sp)
    8020745c:	79e2                	ld	s3,56(sp)
    8020745e:	7a42                	ld	s4,48(sp)
    80207460:	7aa2                	ld	s5,40(sp)
    80207462:	7b02                	ld	s6,32(sp)
    80207464:	6be2                	ld	s7,24(sp)
    80207466:	6125                	addi	sp,sp,96
    80207468:	8082                	ret
            return edup(&root);
    8020746a:	853e                	mv	a0,a5
    8020746c:	00000097          	auipc	ra,0x0
    80207470:	968080e7          	jalr	-1688(ra) # 80206dd4 <edup>
    80207474:	892a                	mv	s2,a0
    80207476:	bff1                	j	80207452 <dirlookup+0x8c>
    if (dp->valid != 1) {
    80207478:	11649703          	lh	a4,278(s1)
    8020747c:	4785                	li	a5,1
        return NULL;
    8020747e:	4901                	li	s2,0
    if (dp->valid != 1) {
    80207480:	fcf719e3          	bne	a4,a5,80207452 <dirlookup+0x8c>
    struct dirent *ep = eget(dp, filename);
    80207484:	85ce                	mv	a1,s3
    80207486:	8526                	mv	a0,s1
    80207488:	fffff097          	auipc	ra,0xfffff
    8020748c:	f00080e7          	jalr	-256(ra) # 80206388 <eget>
    80207490:	892a                	mv	s2,a0
    if (ep->valid == 1) { return ep; }                               // ecache hits
    80207492:	11651703          	lh	a4,278(a0)
    80207496:	4785                	li	a5,1
    80207498:	faf70de3          	beq	a4,a5,80207452 <dirlookup+0x8c>
    int len = strlen(filename);
    8020749c:	854e                	mv	a0,s3
    8020749e:	ffff9097          	auipc	ra,0xffff9
    802074a2:	44e080e7          	jalr	1102(ra) # 802008ec <strlen>
    int count = 0;
    802074a6:	fa042623          	sw	zero,-84(s0)
    reloc_clus(dp, 0, 0);
    802074aa:	4601                	li	a2,0
    802074ac:	4581                	li	a1,0
    802074ae:	8526                	mv	a0,s1
    802074b0:	fffff097          	auipc	ra,0xfffff
    802074b4:	c82080e7          	jalr	-894(ra) # 80206132 <reloc_clus>
    uint off = 0;
    802074b8:	4a01                	li	s4,0
    while ((type = enext(dp, ep, off, &count) != -1)) {
    802074ba:	fac40b93          	addi	s7,s0,-84
    802074be:	5b7d                	li	s6,-1
    802074c0:	86de                	mv	a3,s7
    802074c2:	8652                	mv	a2,s4
    802074c4:	85ca                	mv	a1,s2
    802074c6:	8526                	mv	a0,s1
    802074c8:	00000097          	auipc	ra,0x0
    802074cc:	d6e080e7          	jalr	-658(ra) # 80207236 <enext>
    802074d0:	03650f63          	beq	a0,s6,8020750e <dirlookup+0x148>
        } else if (strncmp(filename, ep->filename, FAT32_MAX_FILENAME) == 0) {
    802074d4:	0ff00613          	li	a2,255
    802074d8:	85ca                	mv	a1,s2
    802074da:	854e                	mv	a0,s3
    802074dc:	ffff9097          	auipc	ra,0xffff9
    802074e0:	364080e7          	jalr	868(ra) # 80200840 <strncmp>
    802074e4:	c901                	beqz	a0,802074f4 <dirlookup+0x12e>
        off += count << 5;
    802074e6:	fac42783          	lw	a5,-84(s0)
    802074ea:	0057979b          	slliw	a5,a5,0x5
    802074ee:	01478a3b          	addw	s4,a5,s4
    802074f2:	b7f9                	j	802074c0 <dirlookup+0xfa>
            ep->parent = edup(dp);
    802074f4:	8526                	mv	a0,s1
    802074f6:	00000097          	auipc	ra,0x0
    802074fa:	8de080e7          	jalr	-1826(ra) # 80206dd4 <edup>
    802074fe:	12a93023          	sd	a0,288(s2)
            ep->off = off;
    80207502:	11492e23          	sw	s4,284(s2)
            ep->valid = 1;
    80207506:	4785                	li	a5,1
    80207508:	10f91b23          	sh	a5,278(s2)
            return ep;
    8020750c:	b799                	j	80207452 <dirlookup+0x8c>
    if (poff) {
    8020750e:	000a8463          	beqz	s5,80207516 <dirlookup+0x150>
        *poff = off;
    80207512:	014aa023          	sw	s4,0(s5)
    eput(ep);
    80207516:	854a                	mv	a0,s2
    80207518:	00000097          	auipc	ra,0x0
    8020751c:	b9e080e7          	jalr	-1122(ra) # 802070b6 <eput>
    return NULL;
    80207520:	4901                	li	s2,0
    80207522:	bf05                	j	80207452 <dirlookup+0x8c>

0000000080207524 <ealloc>:
{
    80207524:	7139                	addi	sp,sp,-64
    80207526:	fc06                	sd	ra,56(sp)
    80207528:	f822                	sd	s0,48(sp)
    8020752a:	f426                	sd	s1,40(sp)
    8020752c:	f04a                	sd	s2,32(sp)
    8020752e:	ec4e                	sd	s3,24(sp)
    80207530:	e852                	sd	s4,16(sp)
    80207532:	0080                	addi	s0,sp,64
    80207534:	892a                	mv	s2,a0
    if (!(dp->attribute & ATTR_DIRECTORY)) {
    80207536:	10054783          	lbu	a5,256(a0)
    8020753a:	8bc1                	andi	a5,a5,16
    8020753c:	c7a9                	beqz	a5,80207586 <ealloc+0x62>
    8020753e:	852e                	mv	a0,a1
    80207540:	8a32                	mv	s4,a2
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    80207542:	11691703          	lh	a4,278(s2)
    80207546:	4785                	li	a5,1
        return NULL;
    80207548:	4481                	li	s1,0
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    8020754a:	02f71563          	bne	a4,a5,80207574 <ealloc+0x50>
    8020754e:	fffff097          	auipc	ra,0xfffff
    80207552:	41e080e7          	jalr	1054(ra) # 8020696c <formatname>
    80207556:	89aa                	mv	s3,a0
    80207558:	10050663          	beqz	a0,80207664 <ealloc+0x140>
    uint off = 0;
    8020755c:	fc042623          	sw	zero,-52(s0)
    if ((ep = dirlookup(dp, name, &off)) != 0) {      // entry exists
    80207560:	fcc40613          	addi	a2,s0,-52
    80207564:	85aa                	mv	a1,a0
    80207566:	854a                	mv	a0,s2
    80207568:	00000097          	auipc	ra,0x0
    8020756c:	e5e080e7          	jalr	-418(ra) # 802073c6 <dirlookup>
    80207570:	84aa                	mv	s1,a0
    80207572:	c115                	beqz	a0,80207596 <ealloc+0x72>
}
    80207574:	8526                	mv	a0,s1
    80207576:	70e2                	ld	ra,56(sp)
    80207578:	7442                	ld	s0,48(sp)
    8020757a:	74a2                	ld	s1,40(sp)
    8020757c:	7902                	ld	s2,32(sp)
    8020757e:	69e2                	ld	s3,24(sp)
    80207580:	6a42                	ld	s4,16(sp)
    80207582:	6121                	addi	sp,sp,64
    80207584:	8082                	ret
        panic("ealloc not dir");
    80207586:	00004517          	auipc	a0,0x4
    8020758a:	8aa50513          	addi	a0,a0,-1878 # 8020ae30 <digits+0xab0>
    8020758e:	ffff9097          	auipc	ra,0xffff9
    80207592:	bb4080e7          	jalr	-1100(ra) # 80200142 <panic>
    ep = eget(dp, name);
    80207596:	85ce                	mv	a1,s3
    80207598:	854a                	mv	a0,s2
    8020759a:	fffff097          	auipc	ra,0xfffff
    8020759e:	dee080e7          	jalr	-530(ra) # 80206388 <eget>
    802075a2:	84aa                	mv	s1,a0
    elock(ep);
    802075a4:	00000097          	auipc	ra,0x0
    802075a8:	a8e080e7          	jalr	-1394(ra) # 80207032 <elock>
    ep->attribute = attr;
    802075ac:	11448023          	sb	s4,256(s1)
    ep->file_size = 0;
    802075b0:	1004a423          	sw	zero,264(s1)
    ep->first_clus = 0;
    802075b4:	1004a223          	sw	zero,260(s1)
    ep->parent = edup(dp);
    802075b8:	854a                	mv	a0,s2
    802075ba:	00000097          	auipc	ra,0x0
    802075be:	81a080e7          	jalr	-2022(ra) # 80206dd4 <edup>
    802075c2:	12a4b023          	sd	a0,288(s1)
    ep->off = off;
    802075c6:	fcc42783          	lw	a5,-52(s0)
    802075ca:	10f4ae23          	sw	a5,284(s1)
    ep->clus_cnt = 0;
    802075ce:	1004a823          	sw	zero,272(s1)
    ep->cur_clus = 0;
    802075d2:	1004a623          	sw	zero,268(s1)
    ep->dirty = 0;
    802075d6:	10048aa3          	sb	zero,277(s1)
    strncpy(ep->filename, name, FAT32_MAX_FILENAME);
    802075da:	0ff00613          	li	a2,255
    802075de:	85ce                	mv	a1,s3
    802075e0:	8526                	mv	a0,s1
    802075e2:	ffff9097          	auipc	ra,0xffff9
    802075e6:	29a080e7          	jalr	666(ra) # 8020087c <strncpy>
    ep->filename[FAT32_MAX_FILENAME] = '\0';
    802075ea:	0e048fa3          	sb	zero,255(s1)
    if (attr == ATTR_DIRECTORY) {    // generate "." and ".." for ep
    802075ee:	47c1                	li	a5,16
    802075f0:	02fa0963          	beq	s4,a5,80207622 <ealloc+0xfe>
        ep->attribute |= ATTR_ARCHIVE;
    802075f4:	1004c783          	lbu	a5,256(s1)
    802075f8:	0207e793          	ori	a5,a5,32
    802075fc:	10f48023          	sb	a5,256(s1)
    emake(dp, ep, off);
    80207600:	fcc42603          	lw	a2,-52(s0)
    80207604:	85a6                	mv	a1,s1
    80207606:	854a                	mv	a0,s2
    80207608:	fffff097          	auipc	ra,0xfffff
    8020760c:	41c080e7          	jalr	1052(ra) # 80206a24 <emake>
    ep->valid = 1;
    80207610:	4785                	li	a5,1
    80207612:	10f49b23          	sh	a5,278(s1)
    eunlock(ep);
    80207616:	8526                	mv	a0,s1
    80207618:	00000097          	auipc	ra,0x0
    8020761c:	a50080e7          	jalr	-1456(ra) # 80207068 <eunlock>
    return ep;
    80207620:	bf91                	j	80207574 <ealloc+0x50>
        ep->attribute |= ATTR_DIRECTORY;
    80207622:	1004c783          	lbu	a5,256(s1)
    80207626:	0107e793          	ori	a5,a5,16
    8020762a:	10f48023          	sb	a5,256(s1)
        ep->cur_clus = ep->first_clus = alloc_clus(dp->dev);
    8020762e:	11494503          	lbu	a0,276(s2)
    80207632:	fffff097          	auipc	ra,0xfffff
    80207636:	940080e7          	jalr	-1728(ra) # 80205f72 <alloc_clus>
    8020763a:	2501                	sext.w	a0,a0
    8020763c:	10a4a223          	sw	a0,260(s1)
    80207640:	10a4a623          	sw	a0,268(s1)
        emake(ep, ep, 0);
    80207644:	4601                	li	a2,0
    80207646:	85a6                	mv	a1,s1
    80207648:	8526                	mv	a0,s1
    8020764a:	fffff097          	auipc	ra,0xfffff
    8020764e:	3da080e7          	jalr	986(ra) # 80206a24 <emake>
        emake(ep, dp, 32);
    80207652:	02000613          	li	a2,32
    80207656:	85ca                	mv	a1,s2
    80207658:	8526                	mv	a0,s1
    8020765a:	fffff097          	auipc	ra,0xfffff
    8020765e:	3ca080e7          	jalr	970(ra) # 80206a24 <emake>
    80207662:	bf79                	j	80207600 <ealloc+0xdc>
        return NULL;
    80207664:	84aa                	mv	s1,a0
    80207666:	b739                	j	80207574 <ealloc+0x50>

0000000080207668 <lookup_path>:
    return path;
}

// FAT32 version of namex in xv6's original file system.
static struct dirent *lookup_path(char *path, int parent, char *name)
{
    80207668:	715d                	addi	sp,sp,-80
    8020766a:	e486                	sd	ra,72(sp)
    8020766c:	e0a2                	sd	s0,64(sp)
    8020766e:	fc26                	sd	s1,56(sp)
    80207670:	f84a                	sd	s2,48(sp)
    80207672:	f44e                	sd	s3,40(sp)
    80207674:	f052                	sd	s4,32(sp)
    80207676:	ec56                	sd	s5,24(sp)
    80207678:	e85a                	sd	s6,16(sp)
    8020767a:	e45e                	sd	s7,8(sp)
    8020767c:	e062                	sd	s8,0(sp)
    8020767e:	0880                	addi	s0,sp,80
    80207680:	892a                	mv	s2,a0
    80207682:	8b2e                	mv	s6,a1
    80207684:	8ab2                	mv	s5,a2
    struct dirent *entry, *next;
    if (*path == '/') {
    80207686:	00054783          	lbu	a5,0(a0)
    8020768a:	02f00713          	li	a4,47
    8020768e:	02e78663          	beq	a5,a4,802076ba <lookup_path+0x52>
        entry = edup(&root);
    } else if (*path != '\0') {
        entry = edup(myproc()->cwd);
    } else {
        return NULL;
    80207692:	4981                	li	s3,0
    } else if (*path != '\0') {
    80207694:	cba1                	beqz	a5,802076e4 <lookup_path+0x7c>
        entry = edup(myproc()->cwd);
    80207696:	ffffa097          	auipc	ra,0xffffa
    8020769a:	3c2080e7          	jalr	962(ra) # 80201a58 <myproc>
    8020769e:	4d853503          	ld	a0,1240(a0)
    802076a2:	fffff097          	auipc	ra,0xfffff
    802076a6:	732080e7          	jalr	1842(ra) # 80206dd4 <edup>
    802076aa:	89aa                	mv	s3,a0
    while (*path == '/') {
    802076ac:	02f00a13          	li	s4,47
    802076b0:	0ff00b93          	li	s7,255
    802076b4:	0ff00c13          	li	s8,255
    802076b8:	a0dd                	j	8020779e <lookup_path+0x136>
        entry = edup(&root);
    802076ba:	00024517          	auipc	a0,0x24
    802076be:	0f650513          	addi	a0,a0,246 # 8022b7b0 <root>
    802076c2:	fffff097          	auipc	ra,0xfffff
    802076c6:	712080e7          	jalr	1810(ra) # 80206dd4 <edup>
    802076ca:	89aa                	mv	s3,a0
    802076cc:	b7c5                	j	802076ac <lookup_path+0x44>
    }
    while ((path = skipelem(path, name)) != 0) {
        elock(entry);
        if (!(entry->attribute & ATTR_DIRECTORY)) {
            eunlock(entry);
    802076ce:	854e                	mv	a0,s3
    802076d0:	00000097          	auipc	ra,0x0
    802076d4:	998080e7          	jalr	-1640(ra) # 80207068 <eunlock>
            eput(entry);
    802076d8:	854e                	mv	a0,s3
    802076da:	00000097          	auipc	ra,0x0
    802076de:	9dc080e7          	jalr	-1572(ra) # 802070b6 <eput>
            return NULL;
    802076e2:	4981                	li	s3,0
    if (parent) {
        eput(entry);
        return NULL;
    }
    return entry;
}
    802076e4:	854e                	mv	a0,s3
    802076e6:	60a6                	ld	ra,72(sp)
    802076e8:	6406                	ld	s0,64(sp)
    802076ea:	74e2                	ld	s1,56(sp)
    802076ec:	7942                	ld	s2,48(sp)
    802076ee:	79a2                	ld	s3,40(sp)
    802076f0:	7a02                	ld	s4,32(sp)
    802076f2:	6ae2                	ld	s5,24(sp)
    802076f4:	6b42                	ld	s6,16(sp)
    802076f6:	6ba2                	ld	s7,8(sp)
    802076f8:	6c02                	ld	s8,0(sp)
    802076fa:	6161                	addi	sp,sp,80
    802076fc:	8082                	ret
            eunlock(entry);
    802076fe:	854e                	mv	a0,s3
    80207700:	00000097          	auipc	ra,0x0
    80207704:	968080e7          	jalr	-1688(ra) # 80207068 <eunlock>
            return entry;
    80207708:	bff1                	j	802076e4 <lookup_path+0x7c>
            eunlock(entry);
    8020770a:	854e                	mv	a0,s3
    8020770c:	00000097          	auipc	ra,0x0
    80207710:	95c080e7          	jalr	-1700(ra) # 80207068 <eunlock>
            eput(entry);
    80207714:	854e                	mv	a0,s3
    80207716:	00000097          	auipc	ra,0x0
    8020771a:	9a0080e7          	jalr	-1632(ra) # 802070b6 <eput>
            return NULL;
    8020771e:	89ca                	mv	s3,s2
    80207720:	b7d1                	j	802076e4 <lookup_path+0x7c>
    int len = path - s;
    80207722:	412487bb          	subw	a5,s1,s2
    if (len > FAT32_MAX_FILENAME) {
    80207726:	863e                	mv	a2,a5
    80207728:	00fbd363          	bge	s7,a5,8020772e <lookup_path+0xc6>
    8020772c:	8662                	mv	a2,s8
    8020772e:	0006079b          	sext.w	a5,a2
    name[len] = 0;
    80207732:	97d6                	add	a5,a5,s5
    80207734:	00078023          	sb	zero,0(a5)
    memmove(name, s, len);
    80207738:	2601                	sext.w	a2,a2
    8020773a:	85ca                	mv	a1,s2
    8020773c:	8556                	mv	a0,s5
    8020773e:	ffff9097          	auipc	ra,0xffff9
    80207742:	086080e7          	jalr	134(ra) # 802007c4 <memmove>
    while (*path == '/') {
    80207746:	0004c783          	lbu	a5,0(s1)
    8020774a:	01479763          	bne	a5,s4,80207758 <lookup_path+0xf0>
        path++;
    8020774e:	0485                	addi	s1,s1,1
    while (*path == '/') {
    80207750:	0004c783          	lbu	a5,0(s1)
    80207754:	ff478de3          	beq	a5,s4,8020774e <lookup_path+0xe6>
        elock(entry);
    80207758:	854e                	mv	a0,s3
    8020775a:	00000097          	auipc	ra,0x0
    8020775e:	8d8080e7          	jalr	-1832(ra) # 80207032 <elock>
        if (!(entry->attribute & ATTR_DIRECTORY)) {
    80207762:	1009c783          	lbu	a5,256(s3)
    80207766:	8bc1                	andi	a5,a5,16
    80207768:	d3bd                	beqz	a5,802076ce <lookup_path+0x66>
        if (parent && *path == '\0') {
    8020776a:	000b0563          	beqz	s6,80207774 <lookup_path+0x10c>
    8020776e:	0004c783          	lbu	a5,0(s1)
    80207772:	d7d1                	beqz	a5,802076fe <lookup_path+0x96>
        if ((next = dirlookup(entry, name, 0)) == 0) {
    80207774:	4601                	li	a2,0
    80207776:	85d6                	mv	a1,s5
    80207778:	854e                	mv	a0,s3
    8020777a:	00000097          	auipc	ra,0x0
    8020777e:	c4c080e7          	jalr	-948(ra) # 802073c6 <dirlookup>
    80207782:	892a                	mv	s2,a0
    80207784:	d159                	beqz	a0,8020770a <lookup_path+0xa2>
        eunlock(entry);
    80207786:	854e                	mv	a0,s3
    80207788:	00000097          	auipc	ra,0x0
    8020778c:	8e0080e7          	jalr	-1824(ra) # 80207068 <eunlock>
        eput(entry);
    80207790:	854e                	mv	a0,s3
    80207792:	00000097          	auipc	ra,0x0
    80207796:	924080e7          	jalr	-1756(ra) # 802070b6 <eput>
        entry = next;
    8020779a:	89ca                	mv	s3,s2
        eput(entry);
    8020779c:	8926                	mv	s2,s1
    while (*path == '/') {
    8020779e:	00094783          	lbu	a5,0(s2)
    802077a2:	03479363          	bne	a5,s4,802077c8 <lookup_path+0x160>
        path++;
    802077a6:	0905                	addi	s2,s2,1
    while (*path == '/') {
    802077a8:	00094783          	lbu	a5,0(s2)
    802077ac:	ff478de3          	beq	a5,s4,802077a6 <lookup_path+0x13e>
    if (*path == 0) { return NULL; }
    802077b0:	cf89                	beqz	a5,802077ca <lookup_path+0x162>
        path++;
    802077b2:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    802077b4:	f74787e3          	beq	a5,s4,80207722 <lookup_path+0xba>
        eput(entry);
    802077b8:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    802077ba:	d7a5                	beqz	a5,80207722 <lookup_path+0xba>
        path++;
    802077bc:	0485                	addi	s1,s1,1
    while (*path != '/' && *path != 0) {
    802077be:	0004c783          	lbu	a5,0(s1)
    802077c2:	ff479ce3          	bne	a5,s4,802077ba <lookup_path+0x152>
    802077c6:	bfb1                	j	80207722 <lookup_path+0xba>
    if (*path == 0) { return NULL; }
    802077c8:	fbe5                	bnez	a5,802077b8 <lookup_path+0x150>
    if (parent) {
    802077ca:	f00b0de3          	beqz	s6,802076e4 <lookup_path+0x7c>
        eput(entry);
    802077ce:	854e                	mv	a0,s3
    802077d0:	00000097          	auipc	ra,0x0
    802077d4:	8e6080e7          	jalr	-1818(ra) # 802070b6 <eput>
        return NULL;
    802077d8:	4981                	li	s3,0
    802077da:	b729                	j	802076e4 <lookup_path+0x7c>

00000000802077dc <ename>:

struct dirent *ename(char *path)
{
    802077dc:	716d                	addi	sp,sp,-272
    802077de:	e606                	sd	ra,264(sp)
    802077e0:	e222                	sd	s0,256(sp)
    802077e2:	0a00                	addi	s0,sp,272
    char name[FAT32_MAX_FILENAME + 1];
    return lookup_path(path, 0, name);
    802077e4:	ef040613          	addi	a2,s0,-272
    802077e8:	4581                	li	a1,0
    802077ea:	00000097          	auipc	ra,0x0
    802077ee:	e7e080e7          	jalr	-386(ra) # 80207668 <lookup_path>
}
    802077f2:	60b2                	ld	ra,264(sp)
    802077f4:	6412                	ld	s0,256(sp)
    802077f6:	6151                	addi	sp,sp,272
    802077f8:	8082                	ret

00000000802077fa <enameparent>:

struct dirent *enameparent(char *path, char *name)
{
    802077fa:	1141                	addi	sp,sp,-16
    802077fc:	e406                	sd	ra,8(sp)
    802077fe:	e022                	sd	s0,0(sp)
    80207800:	0800                	addi	s0,sp,16
    80207802:	862e                	mv	a2,a1
    return lookup_path(path, 1, name);
    80207804:	4585                	li	a1,1
    80207806:	00000097          	auipc	ra,0x0
    8020780a:	e62080e7          	jalr	-414(ra) # 80207668 <lookup_path>
}
    8020780e:	60a2                	ld	ra,8(sp)
    80207810:	6402                	ld	s0,0(sp)
    80207812:	0141                	addi	sp,sp,16
    80207814:	8082                	ret

0000000080207816 <plicinit>:

//
// the riscv Platform Level Interrupt Controller (PLIC).
//

void plicinit(void) {
    80207816:	1141                	addi	sp,sp,-16
    80207818:	e422                	sd	s0,8(sp)
    8020781a:	0800                	addi	s0,sp,16
	writed(1, PLIC_V + DISK_IRQ * sizeof(uint32));
    8020781c:	00fc37b7          	lui	a5,0xfc3
    80207820:	07ba                	slli	a5,a5,0xe
    80207822:	4705                	li	a4,1
    80207824:	c3d8                	sw	a4,4(a5)
	writed(1, PLIC_V + UART_IRQ * sizeof(uint32));
    80207826:	d798                	sw	a4,40(a5)

	#ifdef DEBUG 
	printf("plicinit\n");
	#endif 
}
    80207828:	6422                	ld	s0,8(sp)
    8020782a:	0141                	addi	sp,sp,16
    8020782c:	8082                	ret

000000008020782e <plicinithart>:

void
plicinithart(void)
{
    8020782e:	1141                	addi	sp,sp,-16
    80207830:	e406                	sd	ra,8(sp)
    80207832:	e022                	sd	s0,0(sp)
    80207834:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80207836:	ffffa097          	auipc	ra,0xffffa
    8020783a:	1f6080e7          	jalr	502(ra) # 80201a2c <cpuid>
  #ifdef QEMU
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART_IRQ) | (1 << DISK_IRQ);
    8020783e:	0085171b          	slliw	a4,a0,0x8
    80207842:	01f867b7          	lui	a5,0x1f86
    80207846:	0785                	addi	a5,a5,1
    80207848:	07b6                	slli	a5,a5,0xd
    8020784a:	97ba                	add	a5,a5,a4
    8020784c:	40200713          	li	a4,1026
    80207850:	08e7a023          	sw	a4,128(a5) # 1f86080 <_entry-0x7e279f80>
  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80207854:	00d5179b          	slliw	a5,a0,0xd
    80207858:	03f0c537          	lui	a0,0x3f0c
    8020785c:	20150513          	addi	a0,a0,513 # 3f0c201 <_entry-0x7c2f3dff>
    80207860:	0532                	slli	a0,a0,0xc
    80207862:	953e                	add	a0,a0,a5
    80207864:	00052023          	sw	zero,0(a0)
  *(hart0_m_int_enable_hi) = readd(hart0_m_int_enable_hi) | (1 << (UART_IRQ % 32));
  #endif
  #ifdef DEBUG
  printf("plicinithart\n");
  #endif
}
    80207868:	60a2                	ld	ra,8(sp)
    8020786a:	6402                	ld	s0,0(sp)
    8020786c:	0141                	addi	sp,sp,16
    8020786e:	8082                	ret

0000000080207870 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80207870:	1141                	addi	sp,sp,-16
    80207872:	e406                	sd	ra,8(sp)
    80207874:	e022                	sd	s0,0(sp)
    80207876:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80207878:	ffffa097          	auipc	ra,0xffffa
    8020787c:	1b4080e7          	jalr	436(ra) # 80201a2c <cpuid>
  int irq;
  #ifndef QEMU
  irq = *(uint32*)PLIC_MCLAIM(hart);
  #else
  irq = *(uint32*)PLIC_SCLAIM(hart);
    80207880:	00d5179b          	slliw	a5,a0,0xd
    80207884:	03f0c537          	lui	a0,0x3f0c
    80207888:	20150513          	addi	a0,a0,513 # 3f0c201 <_entry-0x7c2f3dff>
    8020788c:	0532                	slli	a0,a0,0xc
    8020788e:	953e                	add	a0,a0,a5
  #endif
  return irq;
}
    80207890:	4148                	lw	a0,4(a0)
    80207892:	60a2                	ld	ra,8(sp)
    80207894:	6402                	ld	s0,0(sp)
    80207896:	0141                	addi	sp,sp,16
    80207898:	8082                	ret

000000008020789a <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    8020789a:	1101                	addi	sp,sp,-32
    8020789c:	ec06                	sd	ra,24(sp)
    8020789e:	e822                	sd	s0,16(sp)
    802078a0:	e426                	sd	s1,8(sp)
    802078a2:	1000                	addi	s0,sp,32
    802078a4:	84aa                	mv	s1,a0
  int hart = cpuid();
    802078a6:	ffffa097          	auipc	ra,0xffffa
    802078aa:	186080e7          	jalr	390(ra) # 80201a2c <cpuid>
  #ifndef QEMU
  *(uint32*)PLIC_MCLAIM(hart) = irq;
  #else
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    802078ae:	00d5151b          	slliw	a0,a0,0xd
    802078b2:	03f0c7b7          	lui	a5,0x3f0c
    802078b6:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    802078ba:	07b2                	slli	a5,a5,0xc
    802078bc:	97aa                	add	a5,a5,a0
    802078be:	c3c4                	sw	s1,4(a5)
  #endif
}
    802078c0:	60e2                	ld	ra,24(sp)
    802078c2:	6442                	ld	s0,16(sp)
    802078c4:	64a2                	ld	s1,8(sp)
    802078c6:	6105                	addi	sp,sp,32
    802078c8:	8082                	ret

00000000802078ca <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    802078ca:	715d                	addi	sp,sp,-80
    802078cc:	e486                	sd	ra,72(sp)
    802078ce:	e0a2                	sd	s0,64(sp)
    802078d0:	fc26                	sd	s1,56(sp)
    802078d2:	f84a                	sd	s2,48(sp)
    802078d4:	f44e                	sd	s3,40(sp)
    802078d6:	f052                	sd	s4,32(sp)
    802078d8:	ec56                	sd	s5,24(sp)
    802078da:	e85a                	sd	s6,16(sp)
    802078dc:	0880                	addi	s0,sp,80
    802078de:	8a2a                	mv	s4,a0
    802078e0:	84ae                	mv	s1,a1
    802078e2:	89b2                	mv	s3,a2
  int i;

  acquire(&cons.lock);
    802078e4:	00028517          	auipc	a0,0x28
    802078e8:	69c50513          	addi	a0,a0,1692 # 8022ff80 <cons>
    802078ec:	ffff9097          	auipc	ra,0xffff9
    802078f0:	ddc080e7          	jalr	-548(ra) # 802006c8 <acquire>
  for(i = 0; i < n; i++){
    802078f4:	05305f63          	blez	s3,80207952 <consolewrite+0x88>
    802078f8:	4901                	li	s2,0
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    802078fa:	fbf40b13          	addi	s6,s0,-65
    802078fe:	5afd                	li	s5,-1
    80207900:	4685                	li	a3,1
    80207902:	8626                	mv	a2,s1
    80207904:	85d2                	mv	a1,s4
    80207906:	855a                	mv	a0,s6
    80207908:	ffffb097          	auipc	ra,0xffffb
    8020790c:	c3e080e7          	jalr	-962(ra) # 80202546 <either_copyin>
    80207910:	01550e63          	beq	a0,s5,8020792c <consolewrite+0x62>
	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
    80207914:	fbf44503          	lbu	a0,-65(s0)
    80207918:	4581                	li	a1,0
    8020791a:	4601                	li	a2,0
    8020791c:	4681                	li	a3,0
    8020791e:	4885                	li	a7,1
    80207920:	00000073          	ecall
  for(i = 0; i < n; i++){
    80207924:	2905                	addiw	s2,s2,1
    80207926:	0485                	addi	s1,s1,1
    80207928:	fd299ce3          	bne	s3,s2,80207900 <consolewrite+0x36>
      break;
    sbi_console_putchar(c);
  }
  release(&cons.lock);
    8020792c:	00028517          	auipc	a0,0x28
    80207930:	65450513          	addi	a0,a0,1620 # 8022ff80 <cons>
    80207934:	ffff9097          	auipc	ra,0xffff9
    80207938:	de8080e7          	jalr	-536(ra) # 8020071c <release>

  return i;
}
    8020793c:	854a                	mv	a0,s2
    8020793e:	60a6                	ld	ra,72(sp)
    80207940:	6406                	ld	s0,64(sp)
    80207942:	74e2                	ld	s1,56(sp)
    80207944:	7942                	ld	s2,48(sp)
    80207946:	79a2                	ld	s3,40(sp)
    80207948:	7a02                	ld	s4,32(sp)
    8020794a:	6ae2                	ld	s5,24(sp)
    8020794c:	6b42                	ld	s6,16(sp)
    8020794e:	6161                	addi	sp,sp,80
    80207950:	8082                	ret
  for(i = 0; i < n; i++){
    80207952:	4901                	li	s2,0
    80207954:	bfe1                	j	8020792c <consolewrite+0x62>

0000000080207956 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80207956:	7175                	addi	sp,sp,-144
    80207958:	e506                	sd	ra,136(sp)
    8020795a:	e122                	sd	s0,128(sp)
    8020795c:	fca6                	sd	s1,120(sp)
    8020795e:	f8ca                	sd	s2,112(sp)
    80207960:	f4ce                	sd	s3,104(sp)
    80207962:	f0d2                	sd	s4,96(sp)
    80207964:	ecd6                	sd	s5,88(sp)
    80207966:	e8da                	sd	s6,80(sp)
    80207968:	e4de                	sd	s7,72(sp)
    8020796a:	e0e2                	sd	s8,64(sp)
    8020796c:	fc66                	sd	s9,56(sp)
    8020796e:	f86a                	sd	s10,48(sp)
    80207970:	f46e                	sd	s11,40(sp)
    80207972:	0900                	addi	s0,sp,144
    80207974:	f6a43c23          	sd	a0,-136(s0)
    80207978:	8aae                	mv	s5,a1
    8020797a:	8a32                	mv	s4,a2
  uint target;
  int c;
  char cbuf;

  target = n;
    8020797c:	00060b1b          	sext.w	s6,a2
  acquire(&cons.lock);
    80207980:	00028517          	auipc	a0,0x28
    80207984:	60050513          	addi	a0,a0,1536 # 8022ff80 <cons>
    80207988:	ffff9097          	auipc	ra,0xffff9
    8020798c:	d40080e7          	jalr	-704(ra) # 802006c8 <acquire>
  while(n > 0){
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
    80207990:	00028497          	auipc	s1,0x28
    80207994:	5f048493          	addi	s1,s1,1520 # 8022ff80 <cons>
      if(myproc()->killed){
        release(&cons.lock);
        return -1;
      }
      sleep(&cons.r, &cons.lock);
    80207998:	89a6                	mv	s3,s1
    8020799a:	00028917          	auipc	s2,0x28
    8020799e:	67e90913          	addi	s2,s2,1662 # 80230018 <cons+0x98>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];

    if(c == C('D')){  // end-of-file
    802079a2:	4c11                	li	s8,4
      break;
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    802079a4:	f8f40d13          	addi	s10,s0,-113
    802079a8:	5cfd                	li	s9,-1
      break;

    dst++;
    --n;

    if(c == '\n'){
    802079aa:	4da9                	li	s11,10
  while(n > 0){
    802079ac:	07405863          	blez	s4,80207a1c <consoleread+0xc6>
    while(cons.r == cons.w){
    802079b0:	0984a783          	lw	a5,152(s1)
    802079b4:	09c4a703          	lw	a4,156(s1)
    802079b8:	02f71463          	bne	a4,a5,802079e0 <consoleread+0x8a>
      if(myproc()->killed){
    802079bc:	ffffa097          	auipc	ra,0xffffa
    802079c0:	09c080e7          	jalr	156(ra) # 80201a58 <myproc>
    802079c4:	591c                	lw	a5,48(a0)
    802079c6:	e7b5                	bnez	a5,80207a32 <consoleread+0xdc>
      sleep(&cons.r, &cons.lock);
    802079c8:	85ce                	mv	a1,s3
    802079ca:	854a                	mv	a0,s2
    802079cc:	ffffb097          	auipc	ra,0xffffb
    802079d0:	8e6080e7          	jalr	-1818(ra) # 802022b2 <sleep>
    while(cons.r == cons.w){
    802079d4:	0984a783          	lw	a5,152(s1)
    802079d8:	09c4a703          	lw	a4,156(s1)
    802079dc:	fef700e3          	beq	a4,a5,802079bc <consoleread+0x66>
    c = cons.buf[cons.r++ % INPUT_BUF];
    802079e0:	0017871b          	addiw	a4,a5,1
    802079e4:	08e4ac23          	sw	a4,152(s1)
    802079e8:	07f7f713          	andi	a4,a5,127
    802079ec:	9726                	add	a4,a4,s1
    802079ee:	01874703          	lbu	a4,24(a4)
    802079f2:	00070b9b          	sext.w	s7,a4
    if(c == C('D')){  // end-of-file
    802079f6:	078b8663          	beq	s7,s8,80207a62 <consoleread+0x10c>
    cbuf = c;
    802079fa:	f8e407a3          	sb	a4,-113(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    802079fe:	4685                	li	a3,1
    80207a00:	866a                	mv	a2,s10
    80207a02:	85d6                	mv	a1,s5
    80207a04:	f7843503          	ld	a0,-136(s0)
    80207a08:	ffffb097          	auipc	ra,0xffffb
    80207a0c:	b08080e7          	jalr	-1272(ra) # 80202510 <either_copyout>
    80207a10:	01950663          	beq	a0,s9,80207a1c <consoleread+0xc6>
    dst++;
    80207a14:	0a85                	addi	s5,s5,1
    --n;
    80207a16:	3a7d                	addiw	s4,s4,-1
    if(c == '\n'){
    80207a18:	f9bb9ae3          	bne	s7,s11,802079ac <consoleread+0x56>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    }
  }
  release(&cons.lock);
    80207a1c:	00028517          	auipc	a0,0x28
    80207a20:	56450513          	addi	a0,a0,1380 # 8022ff80 <cons>
    80207a24:	ffff9097          	auipc	ra,0xffff9
    80207a28:	cf8080e7          	jalr	-776(ra) # 8020071c <release>

  return target - n;
    80207a2c:	414b053b          	subw	a0,s6,s4
    80207a30:	a811                	j	80207a44 <consoleread+0xee>
        release(&cons.lock);
    80207a32:	00028517          	auipc	a0,0x28
    80207a36:	54e50513          	addi	a0,a0,1358 # 8022ff80 <cons>
    80207a3a:	ffff9097          	auipc	ra,0xffff9
    80207a3e:	ce2080e7          	jalr	-798(ra) # 8020071c <release>
        return -1;
    80207a42:	557d                	li	a0,-1
}
    80207a44:	60aa                	ld	ra,136(sp)
    80207a46:	640a                	ld	s0,128(sp)
    80207a48:	74e6                	ld	s1,120(sp)
    80207a4a:	7946                	ld	s2,112(sp)
    80207a4c:	79a6                	ld	s3,104(sp)
    80207a4e:	7a06                	ld	s4,96(sp)
    80207a50:	6ae6                	ld	s5,88(sp)
    80207a52:	6b46                	ld	s6,80(sp)
    80207a54:	6ba6                	ld	s7,72(sp)
    80207a56:	6c06                	ld	s8,64(sp)
    80207a58:	7ce2                	ld	s9,56(sp)
    80207a5a:	7d42                	ld	s10,48(sp)
    80207a5c:	7da2                	ld	s11,40(sp)
    80207a5e:	6149                	addi	sp,sp,144
    80207a60:	8082                	ret
      if(n < target){
    80207a62:	000a071b          	sext.w	a4,s4
    80207a66:	fb677be3          	bgeu	a4,s6,80207a1c <consoleread+0xc6>
        cons.r--;
    80207a6a:	00028717          	auipc	a4,0x28
    80207a6e:	5af72723          	sw	a5,1454(a4) # 80230018 <cons+0x98>
    80207a72:	b76d                	j	80207a1c <consoleread+0xc6>

0000000080207a74 <consputc>:
void consputc(int c) {
    80207a74:	1141                	addi	sp,sp,-16
    80207a76:	e422                	sd	s0,8(sp)
    80207a78:	0800                	addi	s0,sp,16
  if(c == BACKSPACE){
    80207a7a:	10000793          	li	a5,256
    80207a7e:	00f50b63          	beq	a0,a5,80207a94 <consputc+0x20>
    80207a82:	4581                	li	a1,0
    80207a84:	4601                	li	a2,0
    80207a86:	4681                	li	a3,0
    80207a88:	4885                	li	a7,1
    80207a8a:	00000073          	ecall
}
    80207a8e:	6422                	ld	s0,8(sp)
    80207a90:	0141                	addi	sp,sp,16
    80207a92:	8082                	ret
    80207a94:	4521                	li	a0,8
    80207a96:	4581                	li	a1,0
    80207a98:	4601                	li	a2,0
    80207a9a:	4681                	li	a3,0
    80207a9c:	4885                	li	a7,1
    80207a9e:	00000073          	ecall
    80207aa2:	02000513          	li	a0,32
    80207aa6:	00000073          	ecall
    80207aaa:	4521                	li	a0,8
    80207aac:	00000073          	ecall
}
    80207ab0:	bff9                	j	80207a8e <consputc+0x1a>

0000000080207ab2 <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    80207ab2:	1101                	addi	sp,sp,-32
    80207ab4:	ec06                	sd	ra,24(sp)
    80207ab6:	e822                	sd	s0,16(sp)
    80207ab8:	e426                	sd	s1,8(sp)
    80207aba:	e04a                	sd	s2,0(sp)
    80207abc:	1000                	addi	s0,sp,32
    80207abe:	84aa                	mv	s1,a0
  acquire(&cons.lock);
    80207ac0:	00028517          	auipc	a0,0x28
    80207ac4:	4c050513          	addi	a0,a0,1216 # 8022ff80 <cons>
    80207ac8:	ffff9097          	auipc	ra,0xffff9
    80207acc:	c00080e7          	jalr	-1024(ra) # 802006c8 <acquire>

  switch(c){
    80207ad0:	47d5                	li	a5,21
    80207ad2:	0af48663          	beq	s1,a5,80207b7e <consoleintr+0xcc>
    80207ad6:	0297ca63          	blt	a5,s1,80207b0a <consoleintr+0x58>
    80207ada:	47a1                	li	a5,8
    80207adc:	0ef48763          	beq	s1,a5,80207bca <consoleintr+0x118>
    80207ae0:	47c1                	li	a5,16
    80207ae2:	10f49a63          	bne	s1,a5,80207bf6 <consoleintr+0x144>
  case C('P'):  // Print process list.
    procdump();
    80207ae6:	ffffb097          	auipc	ra,0xffffb
    80207aea:	a94080e7          	jalr	-1388(ra) # 8020257a <procdump>
      }
    }
    break;
  }
  
  release(&cons.lock);
    80207aee:	00028517          	auipc	a0,0x28
    80207af2:	49250513          	addi	a0,a0,1170 # 8022ff80 <cons>
    80207af6:	ffff9097          	auipc	ra,0xffff9
    80207afa:	c26080e7          	jalr	-986(ra) # 8020071c <release>
}
    80207afe:	60e2                	ld	ra,24(sp)
    80207b00:	6442                	ld	s0,16(sp)
    80207b02:	64a2                	ld	s1,8(sp)
    80207b04:	6902                	ld	s2,0(sp)
    80207b06:	6105                	addi	sp,sp,32
    80207b08:	8082                	ret
  switch(c){
    80207b0a:	07f00793          	li	a5,127
    80207b0e:	0af48e63          	beq	s1,a5,80207bca <consoleintr+0x118>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80207b12:	00028717          	auipc	a4,0x28
    80207b16:	46e70713          	addi	a4,a4,1134 # 8022ff80 <cons>
    80207b1a:	0a072783          	lw	a5,160(a4)
    80207b1e:	09872703          	lw	a4,152(a4)
    80207b22:	9f99                	subw	a5,a5,a4
    80207b24:	07f00713          	li	a4,127
    80207b28:	fcf763e3          	bltu	a4,a5,80207aee <consoleintr+0x3c>
      c = (c == '\r') ? '\n' : c;
    80207b2c:	47b5                	li	a5,13
    80207b2e:	0cf48763          	beq	s1,a5,80207bfc <consoleintr+0x14a>
      consputc(c);
    80207b32:	8526                	mv	a0,s1
    80207b34:	00000097          	auipc	ra,0x0
    80207b38:	f40080e7          	jalr	-192(ra) # 80207a74 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80207b3c:	00028797          	auipc	a5,0x28
    80207b40:	44478793          	addi	a5,a5,1092 # 8022ff80 <cons>
    80207b44:	0a07a703          	lw	a4,160(a5)
    80207b48:	0017069b          	addiw	a3,a4,1
    80207b4c:	0006861b          	sext.w	a2,a3
    80207b50:	0ad7a023          	sw	a3,160(a5)
    80207b54:	07f77713          	andi	a4,a4,127
    80207b58:	97ba                	add	a5,a5,a4
    80207b5a:	00978c23          	sb	s1,24(a5)
      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    80207b5e:	47a9                	li	a5,10
    80207b60:	0cf48563          	beq	s1,a5,80207c2a <consoleintr+0x178>
    80207b64:	4791                	li	a5,4
    80207b66:	0cf48263          	beq	s1,a5,80207c2a <consoleintr+0x178>
    80207b6a:	00028797          	auipc	a5,0x28
    80207b6e:	4ae7a783          	lw	a5,1198(a5) # 80230018 <cons+0x98>
    80207b72:	0807879b          	addiw	a5,a5,128
    80207b76:	f6f61ce3          	bne	a2,a5,80207aee <consoleintr+0x3c>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80207b7a:	863e                	mv	a2,a5
    80207b7c:	a07d                	j	80207c2a <consoleintr+0x178>
    while(cons.e != cons.w &&
    80207b7e:	00028717          	auipc	a4,0x28
    80207b82:	40270713          	addi	a4,a4,1026 # 8022ff80 <cons>
    80207b86:	0a072783          	lw	a5,160(a4)
    80207b8a:	09c72703          	lw	a4,156(a4)
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    80207b8e:	00028497          	auipc	s1,0x28
    80207b92:	3f248493          	addi	s1,s1,1010 # 8022ff80 <cons>
    while(cons.e != cons.w &&
    80207b96:	4929                	li	s2,10
    80207b98:	f4f70be3          	beq	a4,a5,80207aee <consoleintr+0x3c>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    80207b9c:	37fd                	addiw	a5,a5,-1
    80207b9e:	07f7f713          	andi	a4,a5,127
    80207ba2:	9726                	add	a4,a4,s1
    while(cons.e != cons.w &&
    80207ba4:	01874703          	lbu	a4,24(a4)
    80207ba8:	f52703e3          	beq	a4,s2,80207aee <consoleintr+0x3c>
      cons.e--;
    80207bac:	0af4a023          	sw	a5,160(s1)
      consputc(BACKSPACE);
    80207bb0:	10000513          	li	a0,256
    80207bb4:	00000097          	auipc	ra,0x0
    80207bb8:	ec0080e7          	jalr	-320(ra) # 80207a74 <consputc>
    while(cons.e != cons.w &&
    80207bbc:	0a04a783          	lw	a5,160(s1)
    80207bc0:	09c4a703          	lw	a4,156(s1)
    80207bc4:	fcf71ce3          	bne	a4,a5,80207b9c <consoleintr+0xea>
    80207bc8:	b71d                	j	80207aee <consoleintr+0x3c>
    if(cons.e != cons.w){
    80207bca:	00028717          	auipc	a4,0x28
    80207bce:	3b670713          	addi	a4,a4,950 # 8022ff80 <cons>
    80207bd2:	0a072783          	lw	a5,160(a4)
    80207bd6:	09c72703          	lw	a4,156(a4)
    80207bda:	f0f70ae3          	beq	a4,a5,80207aee <consoleintr+0x3c>
      cons.e--;
    80207bde:	37fd                	addiw	a5,a5,-1
    80207be0:	00028717          	auipc	a4,0x28
    80207be4:	44f72023          	sw	a5,1088(a4) # 80230020 <cons+0xa0>
      consputc(BACKSPACE);
    80207be8:	10000513          	li	a0,256
    80207bec:	00000097          	auipc	ra,0x0
    80207bf0:	e88080e7          	jalr	-376(ra) # 80207a74 <consputc>
    80207bf4:	bded                	j	80207aee <consoleintr+0x3c>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80207bf6:	ee048ce3          	beqz	s1,80207aee <consoleintr+0x3c>
    80207bfa:	bf21                	j	80207b12 <consoleintr+0x60>
      consputc(c);
    80207bfc:	4529                	li	a0,10
    80207bfe:	00000097          	auipc	ra,0x0
    80207c02:	e76080e7          	jalr	-394(ra) # 80207a74 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80207c06:	00028797          	auipc	a5,0x28
    80207c0a:	37a78793          	addi	a5,a5,890 # 8022ff80 <cons>
    80207c0e:	0a07a703          	lw	a4,160(a5)
    80207c12:	0017069b          	addiw	a3,a4,1
    80207c16:	0006861b          	sext.w	a2,a3
    80207c1a:	0ad7a023          	sw	a3,160(a5)
    80207c1e:	07f77713          	andi	a4,a4,127
    80207c22:	97ba                	add	a5,a5,a4
    80207c24:	4729                	li	a4,10
    80207c26:	00e78c23          	sb	a4,24(a5)
        cons.w = cons.e;
    80207c2a:	00028797          	auipc	a5,0x28
    80207c2e:	3ec7a923          	sw	a2,1010(a5) # 8023001c <cons+0x9c>
        wakeup(&cons.r);
    80207c32:	00028517          	auipc	a0,0x28
    80207c36:	3e650513          	addi	a0,a0,998 # 80230018 <cons+0x98>
    80207c3a:	ffffa097          	auipc	ra,0xffffa
    80207c3e:	7fa080e7          	jalr	2042(ra) # 80202434 <wakeup>
    80207c42:	b575                	j	80207aee <consoleintr+0x3c>

0000000080207c44 <consoleinit>:

void
consoleinit(void)
{
    80207c44:	1101                	addi	sp,sp,-32
    80207c46:	ec06                	sd	ra,24(sp)
    80207c48:	e822                	sd	s0,16(sp)
    80207c4a:	e426                	sd	s1,8(sp)
    80207c4c:	1000                	addi	s0,sp,32
  initlock(&cons.lock, "cons");
    80207c4e:	00028497          	auipc	s1,0x28
    80207c52:	33248493          	addi	s1,s1,818 # 8022ff80 <cons>
    80207c56:	00003597          	auipc	a1,0x3
    80207c5a:	1ea58593          	addi	a1,a1,490 # 8020ae40 <digits+0xac0>
    80207c5e:	8526                	mv	a0,s1
    80207c60:	ffff9097          	auipc	ra,0xffff9
    80207c64:	a24080e7          	jalr	-1500(ra) # 80200684 <initlock>
  uartinit();
    80207c68:	00000097          	auipc	ra,0x0
    80207c6c:	5bc080e7          	jalr	1468(ra) # 80208224 <uartinit>
  cons.e = cons.w = cons.r = 0;
    80207c70:	0804ac23          	sw	zero,152(s1)
    80207c74:	0804ae23          	sw	zero,156(s1)
    80207c78:	0a04a023          	sw	zero,160(s1)
  
  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    80207c7c:	00005797          	auipc	a5,0x5
    80207c80:	4947b783          	ld	a5,1172(a5) # 8020d110 <_GLOBAL_OFFSET_TABLE_+0x60>
    80207c84:	00000717          	auipc	a4,0x0
    80207c88:	cd270713          	addi	a4,a4,-814 # 80207956 <consoleread>
    80207c8c:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    80207c8e:	00000717          	auipc	a4,0x0
    80207c92:	c3c70713          	addi	a4,a4,-964 # 802078ca <consolewrite>
    80207c96:	ef98                	sd	a4,24(a5)
}
    80207c98:	60e2                	ld	ra,24(sp)
    80207c9a:	6442                	ld	s0,16(sp)
    80207c9c:	64a2                	ld	s1,8(sp)
    80207c9e:	6105                	addi	sp,sp,32
    80207ca0:	8082                	ret

0000000080207ca2 <free_desc>:
}

// mark a descriptor as free.
static void
free_desc(int i)
{
    80207ca2:	1141                	addi	sp,sp,-16
    80207ca4:	e406                	sd	ra,8(sp)
    80207ca6:	e022                	sd	s0,0(sp)
    80207ca8:	0800                	addi	s0,sp,16
  if(i >= NUM)
    80207caa:	479d                	li	a5,7
    80207cac:	04a7cc63          	blt	a5,a0,80207d04 <free_desc+0x62>
    panic("virtio_disk_intr 1");
  if(disk.free[i])
    80207cb0:	00029797          	auipc	a5,0x29
    80207cb4:	35078793          	addi	a5,a5,848 # 80231000 <disk>
    80207cb8:	00a78733          	add	a4,a5,a0
    80207cbc:	6789                	lui	a5,0x2
    80207cbe:	97ba                	add	a5,a5,a4
    80207cc0:	0187c783          	lbu	a5,24(a5) # 2018 <_entry-0x801fdfe8>
    80207cc4:	eba1                	bnez	a5,80207d14 <free_desc+0x72>
    panic("virtio_disk_intr 2");
  disk.desc[i].addr = 0;
    80207cc6:	00451713          	slli	a4,a0,0x4
    80207cca:	0002b797          	auipc	a5,0x2b
    80207cce:	3367b783          	ld	a5,822(a5) # 80233000 <disk+0x2000>
    80207cd2:	97ba                	add	a5,a5,a4
    80207cd4:	0007b023          	sd	zero,0(a5)
  disk.free[i] = 1;
    80207cd8:	00029797          	auipc	a5,0x29
    80207cdc:	32878793          	addi	a5,a5,808 # 80231000 <disk>
    80207ce0:	97aa                	add	a5,a5,a0
    80207ce2:	6509                	lui	a0,0x2
    80207ce4:	953e                	add	a0,a0,a5
    80207ce6:	4785                	li	a5,1
    80207ce8:	00f50c23          	sb	a5,24(a0) # 2018 <_entry-0x801fdfe8>
  wakeup(&disk.free[0]);
    80207cec:	0002b517          	auipc	a0,0x2b
    80207cf0:	32c50513          	addi	a0,a0,812 # 80233018 <disk+0x2018>
    80207cf4:	ffffa097          	auipc	ra,0xffffa
    80207cf8:	740080e7          	jalr	1856(ra) # 80202434 <wakeup>
}
    80207cfc:	60a2                	ld	ra,8(sp)
    80207cfe:	6402                	ld	s0,0(sp)
    80207d00:	0141                	addi	sp,sp,16
    80207d02:	8082                	ret
    panic("virtio_disk_intr 1");
    80207d04:	00003517          	auipc	a0,0x3
    80207d08:	14450513          	addi	a0,a0,324 # 8020ae48 <digits+0xac8>
    80207d0c:	ffff8097          	auipc	ra,0xffff8
    80207d10:	436080e7          	jalr	1078(ra) # 80200142 <panic>
    panic("virtio_disk_intr 2");
    80207d14:	00003517          	auipc	a0,0x3
    80207d18:	14c50513          	addi	a0,a0,332 # 8020ae60 <digits+0xae0>
    80207d1c:	ffff8097          	auipc	ra,0xffff8
    80207d20:	426080e7          	jalr	1062(ra) # 80200142 <panic>

0000000080207d24 <virtio_disk_init>:
{
    80207d24:	1141                	addi	sp,sp,-16
    80207d26:	e406                	sd	ra,8(sp)
    80207d28:	e022                	sd	s0,0(sp)
    80207d2a:	0800                	addi	s0,sp,16
  initlock(&disk.vdisk_lock, "virtio_disk");
    80207d2c:	00003597          	auipc	a1,0x3
    80207d30:	14c58593          	addi	a1,a1,332 # 8020ae78 <digits+0xaf8>
    80207d34:	0002b517          	auipc	a0,0x2b
    80207d38:	37450513          	addi	a0,a0,884 # 802330a8 <disk+0x20a8>
    80207d3c:	ffff9097          	auipc	ra,0xffff9
    80207d40:	948080e7          	jalr	-1720(ra) # 80200684 <initlock>
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80207d44:	03f107b7          	lui	a5,0x3f10
    80207d48:	0785                	addi	a5,a5,1
    80207d4a:	07b2                	slli	a5,a5,0xc
    80207d4c:	4398                	lw	a4,0(a5)
    80207d4e:	2701                	sext.w	a4,a4
    80207d50:	747277b7          	lui	a5,0x74727
    80207d54:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xbad968a>
    80207d58:	12f71263          	bne	a4,a5,80207e7c <virtio_disk_init+0x158>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80207d5c:	00003797          	auipc	a5,0x3
    80207d60:	1a47b783          	ld	a5,420(a5) # 8020af00 <digits+0xb80>
    80207d64:	439c                	lw	a5,0(a5)
    80207d66:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80207d68:	4705                	li	a4,1
    80207d6a:	10e79963          	bne	a5,a4,80207e7c <virtio_disk_init+0x158>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80207d6e:	00003797          	auipc	a5,0x3
    80207d72:	19a7b783          	ld	a5,410(a5) # 8020af08 <digits+0xb88>
    80207d76:	439c                	lw	a5,0(a5)
    80207d78:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80207d7a:	4709                	li	a4,2
    80207d7c:	10e79063          	bne	a5,a4,80207e7c <virtio_disk_init+0x158>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80207d80:	00003797          	auipc	a5,0x3
    80207d84:	1907b783          	ld	a5,400(a5) # 8020af10 <digits+0xb90>
    80207d88:	4398                	lw	a4,0(a5)
    80207d8a:	2701                	sext.w	a4,a4
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80207d8c:	554d47b7          	lui	a5,0x554d4
    80207d90:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ad2baaf>
    80207d94:	0ef71463          	bne	a4,a5,80207e7c <virtio_disk_init+0x158>
  *R(VIRTIO_MMIO_STATUS) = status;
    80207d98:	00003717          	auipc	a4,0x3
    80207d9c:	18073703          	ld	a4,384(a4) # 8020af18 <digits+0xb98>
    80207da0:	4785                	li	a5,1
    80207da2:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207da4:	478d                	li	a5,3
    80207da6:	c31c                	sw	a5,0(a4)
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80207da8:	00003797          	auipc	a5,0x3
    80207dac:	1787b783          	ld	a5,376(a5) # 8020af20 <digits+0xba0>
    80207db0:	4394                	lw	a3,0(a5)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80207db2:	c7ffe7b7          	lui	a5,0xc7ffe
    80207db6:	75f78793          	addi	a5,a5,1887 # ffffffffc7ffe75f <kernel_end+0xffffffff47dc975f>
    80207dba:	8ff5                	and	a5,a5,a3
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80207dbc:	2781                	sext.w	a5,a5
    80207dbe:	00003697          	auipc	a3,0x3
    80207dc2:	16a6b683          	ld	a3,362(a3) # 8020af28 <digits+0xba8>
    80207dc6:	c29c                	sw	a5,0(a3)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207dc8:	47ad                	li	a5,11
    80207dca:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207dcc:	47bd                	li	a5,15
    80207dce:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    80207dd0:	00003797          	auipc	a5,0x3
    80207dd4:	1607b783          	ld	a5,352(a5) # 8020af30 <digits+0xbb0>
    80207dd8:	6705                	lui	a4,0x1
    80207dda:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    80207ddc:	00003797          	auipc	a5,0x3
    80207de0:	15c7b783          	ld	a5,348(a5) # 8020af38 <digits+0xbb8>
    80207de4:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    80207de8:	00003797          	auipc	a5,0x3
    80207dec:	1587b783          	ld	a5,344(a5) # 8020af40 <digits+0xbc0>
    80207df0:	439c                	lw	a5,0(a5)
    80207df2:	2781                	sext.w	a5,a5
  if(max == 0)
    80207df4:	cfc1                	beqz	a5,80207e8c <virtio_disk_init+0x168>
  if(max < NUM)
    80207df6:	471d                	li	a4,7
    80207df8:	0af77263          	bgeu	a4,a5,80207e9c <virtio_disk_init+0x178>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    80207dfc:	00003797          	auipc	a5,0x3
    80207e00:	14c7b783          	ld	a5,332(a5) # 8020af48 <digits+0xbc8>
    80207e04:	4721                	li	a4,8
    80207e06:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    80207e08:	6609                	lui	a2,0x2
    80207e0a:	4581                	li	a1,0
    80207e0c:	00029517          	auipc	a0,0x29
    80207e10:	1f450513          	addi	a0,a0,500 # 80231000 <disk>
    80207e14:	ffff9097          	auipc	ra,0xffff9
    80207e18:	950080e7          	jalr	-1712(ra) # 80200764 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    80207e1c:	00029717          	auipc	a4,0x29
    80207e20:	1e470713          	addi	a4,a4,484 # 80231000 <disk>
    80207e24:	00c75793          	srli	a5,a4,0xc
    80207e28:	2781                	sext.w	a5,a5
    80207e2a:	00003697          	auipc	a3,0x3
    80207e2e:	1266b683          	ld	a3,294(a3) # 8020af50 <digits+0xbd0>
    80207e32:	c29c                	sw	a5,0(a3)
  disk.desc = (struct VRingDesc *) disk.pages;
    80207e34:	0002b797          	auipc	a5,0x2b
    80207e38:	1cc78793          	addi	a5,a5,460 # 80233000 <disk+0x2000>
    80207e3c:	e398                	sd	a4,0(a5)
  disk.avail = (uint16*)(((char*)disk.desc) + NUM*sizeof(struct VRingDesc));
    80207e3e:	00029717          	auipc	a4,0x29
    80207e42:	24270713          	addi	a4,a4,578 # 80231080 <disk+0x80>
    80207e46:	e798                	sd	a4,8(a5)
  disk.used = (struct UsedArea *) (disk.pages + PGSIZE);
    80207e48:	0002a717          	auipc	a4,0x2a
    80207e4c:	1b870713          	addi	a4,a4,440 # 80232000 <disk+0x1000>
    80207e50:	eb98                	sd	a4,16(a5)
    disk.free[i] = 1;
    80207e52:	4705                	li	a4,1
    80207e54:	00e78c23          	sb	a4,24(a5)
    80207e58:	00e78ca3          	sb	a4,25(a5)
    80207e5c:	00e78d23          	sb	a4,26(a5)
    80207e60:	00e78da3          	sb	a4,27(a5)
    80207e64:	00e78e23          	sb	a4,28(a5)
    80207e68:	00e78ea3          	sb	a4,29(a5)
    80207e6c:	00e78f23          	sb	a4,30(a5)
    80207e70:	00e78fa3          	sb	a4,31(a5)
}
    80207e74:	60a2                	ld	ra,8(sp)
    80207e76:	6402                	ld	s0,0(sp)
    80207e78:	0141                	addi	sp,sp,16
    80207e7a:	8082                	ret
    panic("could not find virtio disk");
    80207e7c:	00003517          	auipc	a0,0x3
    80207e80:	00c50513          	addi	a0,a0,12 # 8020ae88 <digits+0xb08>
    80207e84:	ffff8097          	auipc	ra,0xffff8
    80207e88:	2be080e7          	jalr	702(ra) # 80200142 <panic>
    panic("virtio disk has no queue 0");
    80207e8c:	00003517          	auipc	a0,0x3
    80207e90:	01c50513          	addi	a0,a0,28 # 8020aea8 <digits+0xb28>
    80207e94:	ffff8097          	auipc	ra,0xffff8
    80207e98:	2ae080e7          	jalr	686(ra) # 80200142 <panic>
    panic("virtio disk max queue too short");
    80207e9c:	00003517          	auipc	a0,0x3
    80207ea0:	02c50513          	addi	a0,a0,44 # 8020aec8 <digits+0xb48>
    80207ea4:	ffff8097          	auipc	ra,0xffff8
    80207ea8:	29e080e7          	jalr	670(ra) # 80200142 <panic>

0000000080207eac <virtio_disk_rw>:
  return 0;
}

void
virtio_disk_rw(struct buf *b, int write)
{
    80207eac:	7119                	addi	sp,sp,-128
    80207eae:	fc86                	sd	ra,120(sp)
    80207eb0:	f8a2                	sd	s0,112(sp)
    80207eb2:	f4a6                	sd	s1,104(sp)
    80207eb4:	f0ca                	sd	s2,96(sp)
    80207eb6:	ecce                	sd	s3,88(sp)
    80207eb8:	e8d2                	sd	s4,80(sp)
    80207eba:	e4d6                	sd	s5,72(sp)
    80207ebc:	e0da                	sd	s6,64(sp)
    80207ebe:	fc5e                	sd	s7,56(sp)
    80207ec0:	f862                	sd	s8,48(sp)
    80207ec2:	f466                	sd	s9,40(sp)
    80207ec4:	f06a                	sd	s10,32(sp)
    80207ec6:	0100                	addi	s0,sp,128
    80207ec8:	892a                	mv	s2,a0
    80207eca:	8cae                	mv	s9,a1
  uint64 sector = b->sectorno;
    80207ecc:	00c56d03          	lwu	s10,12(a0)

  acquire(&disk.vdisk_lock);
    80207ed0:	0002b517          	auipc	a0,0x2b
    80207ed4:	1d850513          	addi	a0,a0,472 # 802330a8 <disk+0x20a8>
    80207ed8:	ffff8097          	auipc	ra,0xffff8
    80207edc:	7f0080e7          	jalr	2032(ra) # 802006c8 <acquire>
  for(int i = 0; i < 3; i++){
    80207ee0:	4981                	li	s3,0
  for(int i = 0; i < NUM; i++){
    80207ee2:	4c21                	li	s8,8
      disk.free[i] = 0;
    80207ee4:	00029b97          	auipc	s7,0x29
    80207ee8:	11cb8b93          	addi	s7,s7,284 # 80231000 <disk>
    80207eec:	6b09                	lui	s6,0x2
  for(int i = 0; i < 3; i++){
    80207eee:	4a8d                	li	s5,3
  for(int i = 0; i < NUM; i++){
    80207ef0:	8a4e                	mv	s4,s3
    80207ef2:	a051                	j	80207f76 <virtio_disk_rw+0xca>
      disk.free[i] = 0;
    80207ef4:	00fb86b3          	add	a3,s7,a5
    80207ef8:	96da                	add	a3,a3,s6
    80207efa:	00068c23          	sb	zero,24(a3)
    idx[i] = alloc_desc();
    80207efe:	c21c                	sw	a5,0(a2)
    if(idx[i] < 0){
    80207f00:	0207c563          	bltz	a5,80207f2a <virtio_disk_rw+0x7e>
  for(int i = 0; i < 3; i++){
    80207f04:	2485                	addiw	s1,s1,1
    80207f06:	0711                	addi	a4,a4,4
    80207f08:	25548463          	beq	s1,s5,80208150 <virtio_disk_rw+0x2a4>
    idx[i] = alloc_desc();
    80207f0c:	863a                	mv	a2,a4
  for(int i = 0; i < NUM; i++){
    80207f0e:	0002b697          	auipc	a3,0x2b
    80207f12:	10a68693          	addi	a3,a3,266 # 80233018 <disk+0x2018>
    80207f16:	87d2                	mv	a5,s4
    if(disk.free[i]){
    80207f18:	0006c583          	lbu	a1,0(a3)
    80207f1c:	fde1                	bnez	a1,80207ef4 <virtio_disk_rw+0x48>
  for(int i = 0; i < NUM; i++){
    80207f1e:	2785                	addiw	a5,a5,1
    80207f20:	0685                	addi	a3,a3,1
    80207f22:	ff879be3          	bne	a5,s8,80207f18 <virtio_disk_rw+0x6c>
    idx[i] = alloc_desc();
    80207f26:	57fd                	li	a5,-1
    80207f28:	c21c                	sw	a5,0(a2)
      for(int j = 0; j < i; j++)
    80207f2a:	02905a63          	blez	s1,80207f5e <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    80207f2e:	f9042503          	lw	a0,-112(s0)
    80207f32:	00000097          	auipc	ra,0x0
    80207f36:	d70080e7          	jalr	-656(ra) # 80207ca2 <free_desc>
      for(int j = 0; j < i; j++)
    80207f3a:	4785                	li	a5,1
    80207f3c:	0297d163          	bge	a5,s1,80207f5e <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    80207f40:	f9442503          	lw	a0,-108(s0)
    80207f44:	00000097          	auipc	ra,0x0
    80207f48:	d5e080e7          	jalr	-674(ra) # 80207ca2 <free_desc>
      for(int j = 0; j < i; j++)
    80207f4c:	4789                	li	a5,2
    80207f4e:	0097d863          	bge	a5,s1,80207f5e <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    80207f52:	f9842503          	lw	a0,-104(s0)
    80207f56:	00000097          	auipc	ra,0x0
    80207f5a:	d4c080e7          	jalr	-692(ra) # 80207ca2 <free_desc>
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    80207f5e:	0002b597          	auipc	a1,0x2b
    80207f62:	14a58593          	addi	a1,a1,330 # 802330a8 <disk+0x20a8>
    80207f66:	0002b517          	auipc	a0,0x2b
    80207f6a:	0b250513          	addi	a0,a0,178 # 80233018 <disk+0x2018>
    80207f6e:	ffffa097          	auipc	ra,0xffffa
    80207f72:	344080e7          	jalr	836(ra) # 802022b2 <sleep>
  for(int i = 0; i < 3; i++){
    80207f76:	f9040713          	addi	a4,s0,-112
    80207f7a:	84ce                	mv	s1,s3
    80207f7c:	bf41                	j	80207f0c <virtio_disk_rw+0x60>
    uint32 reserved;
    uint64 sector;
  } buf0;

  if(write)
    buf0.type = VIRTIO_BLK_T_OUT; // write the disk
    80207f7e:	4785                	li	a5,1
    80207f80:	f8f42023          	sw	a5,-128(s0)
  else
    buf0.type = VIRTIO_BLK_T_IN; // read the disk
  buf0.reserved = 0;
    80207f84:	f8042223          	sw	zero,-124(s0)
  buf0.sector = sector;
    80207f88:	f9a43423          	sd	s10,-120(s0)

  // buf0 is on a kernel stack, which is not direct mapped,
  // thus the call to kvmpa().
  disk.desc[idx[0]].addr = (uint64) kwalkaddr(myproc()->kpagetable, (uint64) &buf0);
    80207f8c:	ffffa097          	auipc	ra,0xffffa
    80207f90:	acc080e7          	jalr	-1332(ra) # 80201a58 <myproc>
    80207f94:	f9042983          	lw	s3,-112(s0)
    80207f98:	00499493          	slli	s1,s3,0x4
    80207f9c:	0002ba17          	auipc	s4,0x2b
    80207fa0:	064a0a13          	addi	s4,s4,100 # 80233000 <disk+0x2000>
    80207fa4:	000a3a83          	ld	s5,0(s4)
    80207fa8:	9aa6                	add	s5,s5,s1
    80207faa:	f8040593          	addi	a1,s0,-128
    80207fae:	6d28                	ld	a0,88(a0)
    80207fb0:	ffff9097          	auipc	ra,0xffff9
    80207fb4:	c4e080e7          	jalr	-946(ra) # 80200bfe <kwalkaddr>
    80207fb8:	00aab023          	sd	a0,0(s5)
  disk.desc[idx[0]].len = sizeof(buf0);
    80207fbc:	000a3783          	ld	a5,0(s4)
    80207fc0:	97a6                	add	a5,a5,s1
    80207fc2:	4741                	li	a4,16
    80207fc4:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80207fc6:	000a3783          	ld	a5,0(s4)
    80207fca:	97a6                	add	a5,a5,s1
    80207fcc:	4705                	li	a4,1
    80207fce:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[0]].next = idx[1];
    80207fd2:	f9442703          	lw	a4,-108(s0)
    80207fd6:	000a3783          	ld	a5,0(s4)
    80207fda:	97a6                	add	a5,a5,s1
    80207fdc:	00e79723          	sh	a4,14(a5)

  disk.desc[idx[1]].addr = (uint64) b->data;
    80207fe0:	0712                	slli	a4,a4,0x4
    80207fe2:	000a3783          	ld	a5,0(s4)
    80207fe6:	97ba                	add	a5,a5,a4
    80207fe8:	05890693          	addi	a3,s2,88
    80207fec:	e394                	sd	a3,0(a5)
  disk.desc[idx[1]].len = BSIZE;
    80207fee:	000a3783          	ld	a5,0(s4)
    80207ff2:	97ba                	add	a5,a5,a4
    80207ff4:	20000693          	li	a3,512
    80207ff8:	c794                	sw	a3,8(a5)
  if(write)
    80207ffa:	100c8c63          	beqz	s9,80208112 <virtio_disk_rw+0x266>
    disk.desc[idx[1]].flags = 0; // device reads b->data
    80207ffe:	0002b797          	auipc	a5,0x2b
    80208002:	0027b783          	ld	a5,2(a5) # 80233000 <disk+0x2000>
    80208006:	97ba                	add	a5,a5,a4
    80208008:	00079623          	sh	zero,12(a5)
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    8020800c:	00029517          	auipc	a0,0x29
    80208010:	ff450513          	addi	a0,a0,-12 # 80231000 <disk>
    80208014:	0002b797          	auipc	a5,0x2b
    80208018:	fec78793          	addi	a5,a5,-20 # 80233000 <disk+0x2000>
    8020801c:	6394                	ld	a3,0(a5)
    8020801e:	96ba                	add	a3,a3,a4
    80208020:	00c6d603          	lhu	a2,12(a3)
    80208024:	00166613          	ori	a2,a2,1
    80208028:	00c69623          	sh	a2,12(a3)
  disk.desc[idx[1]].next = idx[2];
    8020802c:	f9842683          	lw	a3,-104(s0)
    80208030:	6390                	ld	a2,0(a5)
    80208032:	9732                	add	a4,a4,a2
    80208034:	00d71723          	sh	a3,14(a4)

  disk.info[idx[0]].status = 0;
    80208038:	20098613          	addi	a2,s3,512
    8020803c:	0612                	slli	a2,a2,0x4
    8020803e:	962a                	add	a2,a2,a0
    80208040:	02060823          	sb	zero,48(a2) # 2030 <_entry-0x801fdfd0>
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    80208044:	00469713          	slli	a4,a3,0x4
    80208048:	6394                	ld	a3,0(a5)
    8020804a:	96ba                	add	a3,a3,a4
    8020804c:	6589                	lui	a1,0x2
    8020804e:	03058593          	addi	a1,a1,48 # 2030 <_entry-0x801fdfd0>
    80208052:	94ae                	add	s1,s1,a1
    80208054:	94aa                	add	s1,s1,a0
    80208056:	e284                	sd	s1,0(a3)
  disk.desc[idx[2]].len = 1;
    80208058:	6394                	ld	a3,0(a5)
    8020805a:	96ba                	add	a3,a3,a4
    8020805c:	4585                	li	a1,1
    8020805e:	c68c                	sw	a1,8(a3)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80208060:	6394                	ld	a3,0(a5)
    80208062:	96ba                	add	a3,a3,a4
    80208064:	4509                	li	a0,2
    80208066:	00a69623          	sh	a0,12(a3)
  disk.desc[idx[2]].next = 0;
    8020806a:	6394                	ld	a3,0(a5)
    8020806c:	9736                	add	a4,a4,a3
    8020806e:	00071723          	sh	zero,14(a4)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    80208072:	00b92223          	sw	a1,4(s2)
  disk.info[idx[0]].b = b;
    80208076:	03263423          	sd	s2,40(a2)

  // avail[0] is flags
  // avail[1] tells the device how far to look in avail[2...].
  // avail[2...] are desc[] indices the device should process.
  // we only tell device the first index in our chain of descriptors.
  disk.avail[2 + (disk.avail[1] % NUM)] = idx[0];
    8020807a:	6794                	ld	a3,8(a5)
    8020807c:	0026d703          	lhu	a4,2(a3)
    80208080:	8b1d                	andi	a4,a4,7
    80208082:	2709                	addiw	a4,a4,2
    80208084:	0706                	slli	a4,a4,0x1
    80208086:	9736                	add	a4,a4,a3
    80208088:	01371023          	sh	s3,0(a4)
  __sync_synchronize();
    8020808c:	0ff0000f          	fence
  disk.avail[1] = disk.avail[1] + 1;
    80208090:	6798                	ld	a4,8(a5)
    80208092:	00275783          	lhu	a5,2(a4)
    80208096:	2785                	addiw	a5,a5,1
    80208098:	00f71123          	sh	a5,2(a4)

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    8020809c:	00003797          	auipc	a5,0x3
    802080a0:	ebc7b783          	ld	a5,-324(a5) # 8020af58 <digits+0xbd8>
    802080a4:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    802080a8:	00492703          	lw	a4,4(s2)
    802080ac:	4785                	li	a5,1
    802080ae:	02f71163          	bne	a4,a5,802080d0 <virtio_disk_rw+0x224>
    sleep(b, &disk.vdisk_lock);
    802080b2:	0002b997          	auipc	s3,0x2b
    802080b6:	ff698993          	addi	s3,s3,-10 # 802330a8 <disk+0x20a8>
  while(b->disk == 1) {
    802080ba:	4485                	li	s1,1
    sleep(b, &disk.vdisk_lock);
    802080bc:	85ce                	mv	a1,s3
    802080be:	854a                	mv	a0,s2
    802080c0:	ffffa097          	auipc	ra,0xffffa
    802080c4:	1f2080e7          	jalr	498(ra) # 802022b2 <sleep>
  while(b->disk == 1) {
    802080c8:	00492783          	lw	a5,4(s2)
    802080cc:	fe9788e3          	beq	a5,s1,802080bc <virtio_disk_rw+0x210>
  }

  disk.info[idx[0]].b = 0;
    802080d0:	f9042483          	lw	s1,-112(s0)
    802080d4:	20048793          	addi	a5,s1,512
    802080d8:	00479713          	slli	a4,a5,0x4
    802080dc:	00029797          	auipc	a5,0x29
    802080e0:	f2478793          	addi	a5,a5,-220 # 80231000 <disk>
    802080e4:	97ba                	add	a5,a5,a4
    802080e6:	0207b423          	sd	zero,40(a5)
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    802080ea:	0002b917          	auipc	s2,0x2b
    802080ee:	f1690913          	addi	s2,s2,-234 # 80233000 <disk+0x2000>
    free_desc(i);
    802080f2:	8526                	mv	a0,s1
    802080f4:	00000097          	auipc	ra,0x0
    802080f8:	bae080e7          	jalr	-1106(ra) # 80207ca2 <free_desc>
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    802080fc:	0492                	slli	s1,s1,0x4
    802080fe:	00093783          	ld	a5,0(s2)
    80208102:	94be                	add	s1,s1,a5
    80208104:	00c4d783          	lhu	a5,12(s1)
    80208108:	8b85                	andi	a5,a5,1
    8020810a:	cf89                	beqz	a5,80208124 <virtio_disk_rw+0x278>
      i = disk.desc[i].next;
    8020810c:	00e4d483          	lhu	s1,14(s1)
    free_desc(i);
    80208110:	b7cd                	j	802080f2 <virtio_disk_rw+0x246>
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80208112:	0002b797          	auipc	a5,0x2b
    80208116:	eee7b783          	ld	a5,-274(a5) # 80233000 <disk+0x2000>
    8020811a:	97ba                	add	a5,a5,a4
    8020811c:	4689                	li	a3,2
    8020811e:	00d79623          	sh	a3,12(a5)
    80208122:	b5ed                	j	8020800c <virtio_disk_rw+0x160>
  free_chain(idx[0]);

  release(&disk.vdisk_lock);
    80208124:	0002b517          	auipc	a0,0x2b
    80208128:	f8450513          	addi	a0,a0,-124 # 802330a8 <disk+0x20a8>
    8020812c:	ffff8097          	auipc	ra,0xffff8
    80208130:	5f0080e7          	jalr	1520(ra) # 8020071c <release>
}
    80208134:	70e6                	ld	ra,120(sp)
    80208136:	7446                	ld	s0,112(sp)
    80208138:	74a6                	ld	s1,104(sp)
    8020813a:	7906                	ld	s2,96(sp)
    8020813c:	69e6                	ld	s3,88(sp)
    8020813e:	6a46                	ld	s4,80(sp)
    80208140:	6aa6                	ld	s5,72(sp)
    80208142:	6b06                	ld	s6,64(sp)
    80208144:	7be2                	ld	s7,56(sp)
    80208146:	7c42                	ld	s8,48(sp)
    80208148:	7ca2                	ld	s9,40(sp)
    8020814a:	7d02                	ld	s10,32(sp)
    8020814c:	6109                	addi	sp,sp,128
    8020814e:	8082                	ret
  if(write)
    80208150:	e20c97e3          	bnez	s9,80207f7e <virtio_disk_rw+0xd2>
    buf0.type = VIRTIO_BLK_T_IN; // read the disk
    80208154:	f8042023          	sw	zero,-128(s0)
    80208158:	b535                	j	80207f84 <virtio_disk_rw+0xd8>

000000008020815a <virtio_disk_intr>:

void
virtio_disk_intr()
{
    8020815a:	1101                	addi	sp,sp,-32
    8020815c:	ec06                	sd	ra,24(sp)
    8020815e:	e822                	sd	s0,16(sp)
    80208160:	e426                	sd	s1,8(sp)
    80208162:	e04a                	sd	s2,0(sp)
    80208164:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    80208166:	0002b517          	auipc	a0,0x2b
    8020816a:	f4250513          	addi	a0,a0,-190 # 802330a8 <disk+0x20a8>
    8020816e:	ffff8097          	auipc	ra,0xffff8
    80208172:	55a080e7          	jalr	1370(ra) # 802006c8 <acquire>

  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    80208176:	0002b717          	auipc	a4,0x2b
    8020817a:	e8a70713          	addi	a4,a4,-374 # 80233000 <disk+0x2000>
    8020817e:	02075783          	lhu	a5,32(a4)
    80208182:	6b18                	ld	a4,16(a4)
    80208184:	00275683          	lhu	a3,2(a4)
    80208188:	8ebd                	xor	a3,a3,a5
    8020818a:	8a9d                	andi	a3,a3,7
    8020818c:	cab9                	beqz	a3,802081e2 <virtio_disk_intr+0x88>
    int id = disk.used->elems[disk.used_idx].id;

    if(disk.info[id].status != 0)
    8020818e:	00029917          	auipc	s2,0x29
    80208192:	e7290913          	addi	s2,s2,-398 # 80231000 <disk>
      panic("virtio_disk_intr status");
    
    disk.info[id].b->disk = 0;   // disk is done with buf
    wakeup(disk.info[id].b);

    disk.used_idx = (disk.used_idx + 1) % NUM;
    80208196:	0002b497          	auipc	s1,0x2b
    8020819a:	e6a48493          	addi	s1,s1,-406 # 80233000 <disk+0x2000>
    int id = disk.used->elems[disk.used_idx].id;
    8020819e:	078e                	slli	a5,a5,0x3
    802081a0:	97ba                	add	a5,a5,a4
    802081a2:	43dc                	lw	a5,4(a5)
    if(disk.info[id].status != 0)
    802081a4:	20078713          	addi	a4,a5,512
    802081a8:	0712                	slli	a4,a4,0x4
    802081aa:	974a                	add	a4,a4,s2
    802081ac:	03074703          	lbu	a4,48(a4)
    802081b0:	e335                	bnez	a4,80208214 <virtio_disk_intr+0xba>
    disk.info[id].b->disk = 0;   // disk is done with buf
    802081b2:	20078793          	addi	a5,a5,512
    802081b6:	0792                	slli	a5,a5,0x4
    802081b8:	97ca                	add	a5,a5,s2
    802081ba:	7798                	ld	a4,40(a5)
    802081bc:	00072223          	sw	zero,4(a4)
    wakeup(disk.info[id].b);
    802081c0:	7788                	ld	a0,40(a5)
    802081c2:	ffffa097          	auipc	ra,0xffffa
    802081c6:	272080e7          	jalr	626(ra) # 80202434 <wakeup>
    disk.used_idx = (disk.used_idx + 1) % NUM;
    802081ca:	0204d783          	lhu	a5,32(s1)
    802081ce:	2785                	addiw	a5,a5,1
    802081d0:	8b9d                	andi	a5,a5,7
    802081d2:	02f49023          	sh	a5,32(s1)
  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    802081d6:	6898                	ld	a4,16(s1)
    802081d8:	00275683          	lhu	a3,2(a4)
    802081dc:	8a9d                	andi	a3,a3,7
    802081de:	fcf690e3          	bne	a3,a5,8020819e <virtio_disk_intr+0x44>
  }
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    802081e2:	00003797          	auipc	a5,0x3
    802081e6:	d7e7b783          	ld	a5,-642(a5) # 8020af60 <digits+0xbe0>
    802081ea:	439c                	lw	a5,0(a5)
    802081ec:	8b8d                	andi	a5,a5,3
    802081ee:	00003717          	auipc	a4,0x3
    802081f2:	d7a73703          	ld	a4,-646(a4) # 8020af68 <digits+0xbe8>
    802081f6:	c31c                	sw	a5,0(a4)

  release(&disk.vdisk_lock);
    802081f8:	0002b517          	auipc	a0,0x2b
    802081fc:	eb050513          	addi	a0,a0,-336 # 802330a8 <disk+0x20a8>
    80208200:	ffff8097          	auipc	ra,0xffff8
    80208204:	51c080e7          	jalr	1308(ra) # 8020071c <release>
}
    80208208:	60e2                	ld	ra,24(sp)
    8020820a:	6442                	ld	s0,16(sp)
    8020820c:	64a2                	ld	s1,8(sp)
    8020820e:	6902                	ld	s2,0(sp)
    80208210:	6105                	addi	sp,sp,32
    80208212:	8082                	ret
      panic("virtio_disk_intr status");
    80208214:	00003517          	auipc	a0,0x3
    80208218:	cd450513          	addi	a0,a0,-812 # 8020aee8 <digits+0xb68>
    8020821c:	ffff8097          	auipc	ra,0xffff8
    80208220:	f26080e7          	jalr	-218(ra) # 80200142 <panic>

0000000080208224 <uartinit>:

void uartstart();

void
uartinit(void)
{
    80208224:	1141                	addi	sp,sp,-16
    80208226:	e406                	sd	ra,8(sp)
    80208228:	e022                	sd	s0,0(sp)
    8020822a:	0800                	addi	s0,sp,16
  // disable interrupts.
  WriteReg(IER, 0x00);
    8020822c:	100007b7          	lui	a5,0x10000
    80208230:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x701fffff>

  // special mode to set baud rate.
  WriteReg(LCR, LCR_BAUD_LATCH);
    80208234:	f8000713          	li	a4,-128
    80208238:	00e781a3          	sb	a4,3(a5)

  // LSB for baud rate of 38.4K.
  WriteReg(0, 0x03);
    8020823c:	470d                	li	a4,3
    8020823e:	00e78023          	sb	a4,0(a5)

  // MSB for baud rate of 38.4K.
  WriteReg(1, 0x00);
    80208242:	000780a3          	sb	zero,1(a5)

  // leave set-baud mode,
  // and set word length to 8 bits, no parity.
  WriteReg(LCR, LCR_EIGHT_BITS);
    80208246:	00e781a3          	sb	a4,3(a5)

  // reset and enable FIFOs.
  WriteReg(FCR, FCR_FIFO_ENABLE | FCR_FIFO_CLEAR);
    8020824a:	469d                	li	a3,7
    8020824c:	00d78123          	sb	a3,2(a5)

  // enable transmit and receive interrupts.
  WriteReg(IER, IER_TX_ENABLE | IER_RX_ENABLE);
    80208250:	00e780a3          	sb	a4,1(a5)

    uart_tx_w = uart_tx_r = 0;
    80208254:	0002c797          	auipc	a5,0x2c
    80208258:	dac78793          	addi	a5,a5,-596 # 80234000 <uart_tx_r>
    8020825c:	0007a023          	sw	zero,0(a5)
    80208260:	0007a223          	sw	zero,4(a5)

  initlock(&uart_tx_lock, "uart");
    80208264:	00003597          	auipc	a1,0x3
    80208268:	d0c58593          	addi	a1,a1,-756 # 8020af70 <digits+0xbf0>
    8020826c:	0002c517          	auipc	a0,0x2c
    80208270:	d9c50513          	addi	a0,a0,-612 # 80234008 <uart_tx_lock>
    80208274:	ffff8097          	auipc	ra,0xffff8
    80208278:	410080e7          	jalr	1040(ra) # 80200684 <initlock>
}
    8020827c:	60a2                	ld	ra,8(sp)
    8020827e:	6402                	ld	s0,0(sp)
    80208280:	0141                	addi	sp,sp,16
    80208282:	8082                	ret

0000000080208284 <uartputc_sync>:
// use interrupts, for use by kernel printf() and
// to echo characters. it spins waiting for the uart's
// output register to be empty.
void
uartputc_sync(int c)
{
    80208284:	1101                	addi	sp,sp,-32
    80208286:	ec06                	sd	ra,24(sp)
    80208288:	e822                	sd	s0,16(sp)
    8020828a:	e426                	sd	s1,8(sp)
    8020828c:	1000                	addi	s0,sp,32
    8020828e:	84aa                	mv	s1,a0
  push_off();
    80208290:	ffff8097          	auipc	ra,0xffff8
    80208294:	348080e7          	jalr	840(ra) # 802005d8 <push_off>

  if(panicked){
    80208298:	00005797          	auipc	a5,0x5
    8020829c:	e287b783          	ld	a5,-472(a5) # 8020d0c0 <_GLOBAL_OFFSET_TABLE_+0x10>
    802082a0:	439c                	lw	a5,0(a5)
    802082a2:	2781                	sext.w	a5,a5
    for(;;)
      ;
  }

  // wait for Transmit Holding Empty to be set in LSR.
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    802082a4:	10000737          	lui	a4,0x10000
  if(panicked){
    802082a8:	c391                	beqz	a5,802082ac <uartputc_sync+0x28>
    for(;;)
    802082aa:	a001                	j	802082aa <uartputc_sync+0x26>
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    802082ac:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x701ffffb>
    802082b0:	0ff7f793          	andi	a5,a5,255
    802082b4:	0207f793          	andi	a5,a5,32
    802082b8:	dbf5                	beqz	a5,802082ac <uartputc_sync+0x28>
    ;
  WriteReg(THR, c);
    802082ba:	0ff4f793          	andi	a5,s1,255
    802082be:	10000737          	lui	a4,0x10000
    802082c2:	00f70023          	sb	a5,0(a4) # 10000000 <_entry-0x70200000>

  pop_off();
    802082c6:	ffff8097          	auipc	ra,0xffff8
    802082ca:	35e080e7          	jalr	862(ra) # 80200624 <pop_off>
}
    802082ce:	60e2                	ld	ra,24(sp)
    802082d0:	6442                	ld	s0,16(sp)
    802082d2:	64a2                	ld	s1,8(sp)
    802082d4:	6105                	addi	sp,sp,32
    802082d6:	8082                	ret

00000000802082d8 <uartstart>:
// called from both the top- and bottom-half.
void
uartstart()
{
  while(1){
    if(uart_tx_w == uart_tx_r){
    802082d8:	0002c717          	auipc	a4,0x2c
    802082dc:	d2870713          	addi	a4,a4,-728 # 80234000 <uart_tx_r>
    802082e0:	431c                	lw	a5,0(a4)
    802082e2:	4358                	lw	a4,4(a4)
    802082e4:	06f70563          	beq	a4,a5,8020834e <uartstart+0x76>
{
    802082e8:	7179                	addi	sp,sp,-48
    802082ea:	f406                	sd	ra,40(sp)
    802082ec:	f022                	sd	s0,32(sp)
    802082ee:	ec26                	sd	s1,24(sp)
    802082f0:	e84a                	sd	s2,16(sp)
    802082f2:	e44e                	sd	s3,8(sp)
    802082f4:	1800                	addi	s0,sp,48
      // transmit buffer is empty.
      return;
    }
    
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    802082f6:	10000937          	lui	s2,0x10000
      // so we cannot give it another byte.
      // it will interrupt when it's ready for a new byte.
      return;
    }
    
    int c = uart_tx_buf[uart_tx_r];
    802082fa:	0002c497          	auipc	s1,0x2c
    802082fe:	d0648493          	addi	s1,s1,-762 # 80234000 <uart_tx_r>
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    80208302:	00594703          	lbu	a4,5(s2) # 10000005 <_entry-0x701ffffb>
    80208306:	0ff77713          	andi	a4,a4,255
    8020830a:	02077713          	andi	a4,a4,32
    8020830e:	cb0d                	beqz	a4,80208340 <uartstart+0x68>
    int c = uart_tx_buf[uart_tx_r];
    80208310:	00f48733          	add	a4,s1,a5
    80208314:	02074983          	lbu	s3,32(a4)
    uart_tx_r = (uart_tx_r + 1) % UART_TX_BUF_SIZE;
    80208318:	2785                	addiw	a5,a5,1
    8020831a:	41f7d71b          	sraiw	a4,a5,0x1f
    8020831e:	01b7571b          	srliw	a4,a4,0x1b
    80208322:	9fb9                	addw	a5,a5,a4
    80208324:	8bfd                	andi	a5,a5,31
    80208326:	9f99                	subw	a5,a5,a4
    80208328:	c09c                	sw	a5,0(s1)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    8020832a:	8526                	mv	a0,s1
    8020832c:	ffffa097          	auipc	ra,0xffffa
    80208330:	108080e7          	jalr	264(ra) # 80202434 <wakeup>
    
    WriteReg(THR, c);
    80208334:	01390023          	sb	s3,0(s2)
    if(uart_tx_w == uart_tx_r){
    80208338:	409c                	lw	a5,0(s1)
    8020833a:	40d8                	lw	a4,4(s1)
    8020833c:	fcf713e3          	bne	a4,a5,80208302 <uartstart+0x2a>
  }
}
    80208340:	70a2                	ld	ra,40(sp)
    80208342:	7402                	ld	s0,32(sp)
    80208344:	64e2                	ld	s1,24(sp)
    80208346:	6942                	ld	s2,16(sp)
    80208348:	69a2                	ld	s3,8(sp)
    8020834a:	6145                	addi	sp,sp,48
    8020834c:	8082                	ret
    8020834e:	8082                	ret

0000000080208350 <uartputc>:
{
    80208350:	7179                	addi	sp,sp,-48
    80208352:	f406                	sd	ra,40(sp)
    80208354:	f022                	sd	s0,32(sp)
    80208356:	ec26                	sd	s1,24(sp)
    80208358:	e84a                	sd	s2,16(sp)
    8020835a:	e44e                	sd	s3,8(sp)
    8020835c:	1800                	addi	s0,sp,48
    8020835e:	892a                	mv	s2,a0
  acquire(&uart_tx_lock);
    80208360:	0002c517          	auipc	a0,0x2c
    80208364:	ca850513          	addi	a0,a0,-856 # 80234008 <uart_tx_lock>
    80208368:	ffff8097          	auipc	ra,0xffff8
    8020836c:	360080e7          	jalr	864(ra) # 802006c8 <acquire>
  if(panicked){
    80208370:	00005797          	auipc	a5,0x5
    80208374:	d507b783          	ld	a5,-688(a5) # 8020d0c0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80208378:	439c                	lw	a5,0(a5)
    8020837a:	2781                	sext.w	a5,a5
    8020837c:	c391                	beqz	a5,80208380 <uartputc+0x30>
    for(;;)
    8020837e:	a001                	j	8020837e <uartputc+0x2e>
    if(((uart_tx_w + 1) % UART_TX_BUF_SIZE) == uart_tx_r){
    80208380:	0002c617          	auipc	a2,0x2c
    80208384:	c8060613          	addi	a2,a2,-896 # 80234000 <uart_tx_r>
    80208388:	4258                	lw	a4,4(a2)
    8020838a:	0017079b          	addiw	a5,a4,1
    8020838e:	41f7d69b          	sraiw	a3,a5,0x1f
    80208392:	01b6d69b          	srliw	a3,a3,0x1b
    80208396:	9fb5                	addw	a5,a5,a3
    80208398:	8bfd                	andi	a5,a5,31
    8020839a:	9f95                	subw	a5,a5,a3
    8020839c:	4214                	lw	a3,0(a2)
    8020839e:	02f69a63          	bne	a3,a5,802083d2 <uartputc+0x82>
      sleep(&uart_tx_r, &uart_tx_lock);
    802083a2:	84b2                	mv	s1,a2
    802083a4:	0002c997          	auipc	s3,0x2c
    802083a8:	c6498993          	addi	s3,s3,-924 # 80234008 <uart_tx_lock>
    802083ac:	85ce                	mv	a1,s3
    802083ae:	8526                	mv	a0,s1
    802083b0:	ffffa097          	auipc	ra,0xffffa
    802083b4:	f02080e7          	jalr	-254(ra) # 802022b2 <sleep>
    if(((uart_tx_w + 1) % UART_TX_BUF_SIZE) == uart_tx_r){
    802083b8:	40d8                	lw	a4,4(s1)
    802083ba:	0017079b          	addiw	a5,a4,1
    802083be:	41f7d69b          	sraiw	a3,a5,0x1f
    802083c2:	01b6d69b          	srliw	a3,a3,0x1b
    802083c6:	9fb5                	addw	a5,a5,a3
    802083c8:	8bfd                	andi	a5,a5,31
    802083ca:	9f95                	subw	a5,a5,a3
    802083cc:	4094                	lw	a3,0(s1)
    802083ce:	fcf68fe3          	beq	a3,a5,802083ac <uartputc+0x5c>
      uart_tx_buf[uart_tx_w] = c;
    802083d2:	0002c697          	auipc	a3,0x2c
    802083d6:	c2e68693          	addi	a3,a3,-978 # 80234000 <uart_tx_r>
    802083da:	9736                	add	a4,a4,a3
    802083dc:	03270023          	sb	s2,32(a4)
      uart_tx_w = (uart_tx_w + 1) % UART_TX_BUF_SIZE;
    802083e0:	c2dc                	sw	a5,4(a3)
      uartstart();
    802083e2:	00000097          	auipc	ra,0x0
    802083e6:	ef6080e7          	jalr	-266(ra) # 802082d8 <uartstart>
      release(&uart_tx_lock);
    802083ea:	0002c517          	auipc	a0,0x2c
    802083ee:	c1e50513          	addi	a0,a0,-994 # 80234008 <uart_tx_lock>
    802083f2:	ffff8097          	auipc	ra,0xffff8
    802083f6:	32a080e7          	jalr	810(ra) # 8020071c <release>
}
    802083fa:	70a2                	ld	ra,40(sp)
    802083fc:	7402                	ld	s0,32(sp)
    802083fe:	64e2                	ld	s1,24(sp)
    80208400:	6942                	ld	s2,16(sp)
    80208402:	69a2                	ld	s3,8(sp)
    80208404:	6145                	addi	sp,sp,48
    80208406:	8082                	ret

0000000080208408 <uartgetc>:

// read one input character from the UART.
// return -1 if none is waiting.
int
uartgetc(void)
{
    80208408:	1141                	addi	sp,sp,-16
    8020840a:	e422                	sd	s0,8(sp)
    8020840c:	0800                	addi	s0,sp,16
  if(ReadReg(LSR) & 0x01){
    8020840e:	100007b7          	lui	a5,0x10000
    80208412:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x701ffffb>
    80208416:	8b85                	andi	a5,a5,1
    80208418:	cb91                	beqz	a5,8020842c <uartgetc+0x24>
    // input data is ready.
    return ReadReg(RHR);
    8020841a:	100007b7          	lui	a5,0x10000
    8020841e:	0007c503          	lbu	a0,0(a5) # 10000000 <_entry-0x70200000>
    80208422:	0ff57513          	andi	a0,a0,255
  } else {
    return -1;
  }
}
    80208426:	6422                	ld	s0,8(sp)
    80208428:	0141                	addi	sp,sp,16
    8020842a:	8082                	ret
    return -1;
    8020842c:	557d                	li	a0,-1
    8020842e:	bfe5                	j	80208426 <uartgetc+0x1e>

0000000080208430 <uartintr>:
// handle a uart interrupt, raised because input has
// arrived, or the uart is ready for more output, or
// both. called from trap.c.
void
uartintr(void)
{
    80208430:	1101                	addi	sp,sp,-32
    80208432:	ec06                	sd	ra,24(sp)
    80208434:	e822                	sd	s0,16(sp)
    80208436:	e426                	sd	s1,8(sp)
    80208438:	1000                	addi	s0,sp,32
  // read and process incoming characters.
  while(1){
    int c = uartgetc();
    if(c == -1)
    8020843a:	54fd                	li	s1,-1
    int c = uartgetc();
    8020843c:	00000097          	auipc	ra,0x0
    80208440:	fcc080e7          	jalr	-52(ra) # 80208408 <uartgetc>
    if(c == -1)
    80208444:	00950763          	beq	a0,s1,80208452 <uartintr+0x22>
      break;
    consoleintr(c);
    80208448:	fffff097          	auipc	ra,0xfffff
    8020844c:	66a080e7          	jalr	1642(ra) # 80207ab2 <consoleintr>
  while(1){
    80208450:	b7f5                	j	8020843c <uartintr+0xc>
  }

  // send buffered characters.
  acquire(&uart_tx_lock);
    80208452:	0002c497          	auipc	s1,0x2c
    80208456:	bb648493          	addi	s1,s1,-1098 # 80234008 <uart_tx_lock>
    8020845a:	8526                	mv	a0,s1
    8020845c:	ffff8097          	auipc	ra,0xffff8
    80208460:	26c080e7          	jalr	620(ra) # 802006c8 <acquire>
  uartstart();
    80208464:	00000097          	auipc	ra,0x0
    80208468:	e74080e7          	jalr	-396(ra) # 802082d8 <uartstart>
  release(&uart_tx_lock);
    8020846c:	8526                	mv	a0,s1
    8020846e:	ffff8097          	auipc	ra,0xffff8
    80208472:	2ae080e7          	jalr	686(ra) # 8020071c <release>
}
    80208476:	60e2                	ld	ra,24(sp)
    80208478:	6442                	ld	s0,16(sp)
    8020847a:	64a2                	ld	s1,8(sp)
    8020847c:	6105                	addi	sp,sp,32
    8020847e:	8082                	ret
	...

0000000080209000 <_trampoline>:
    80209000:	14051573          	csrrw	a0,sscratch,a0
    80209004:	02153423          	sd	ra,40(a0)
    80209008:	02253823          	sd	sp,48(a0)
    8020900c:	02353c23          	sd	gp,56(a0)
    80209010:	04453023          	sd	tp,64(a0)
    80209014:	04553423          	sd	t0,72(a0)
    80209018:	04653823          	sd	t1,80(a0)
    8020901c:	04753c23          	sd	t2,88(a0)
    80209020:	f120                	sd	s0,96(a0)
    80209022:	f524                	sd	s1,104(a0)
    80209024:	fd2c                	sd	a1,120(a0)
    80209026:	e150                	sd	a2,128(a0)
    80209028:	e554                	sd	a3,136(a0)
    8020902a:	e958                	sd	a4,144(a0)
    8020902c:	ed5c                	sd	a5,152(a0)
    8020902e:	0b053023          	sd	a6,160(a0)
    80209032:	0b153423          	sd	a7,168(a0)
    80209036:	0b253823          	sd	s2,176(a0)
    8020903a:	0b353c23          	sd	s3,184(a0)
    8020903e:	0d453023          	sd	s4,192(a0)
    80209042:	0d553423          	sd	s5,200(a0)
    80209046:	0d653823          	sd	s6,208(a0)
    8020904a:	0d753c23          	sd	s7,216(a0)
    8020904e:	0f853023          	sd	s8,224(a0)
    80209052:	0f953423          	sd	s9,232(a0)
    80209056:	0fa53823          	sd	s10,240(a0)
    8020905a:	0fb53c23          	sd	s11,248(a0)
    8020905e:	11c53023          	sd	t3,256(a0)
    80209062:	11d53423          	sd	t4,264(a0)
    80209066:	11e53823          	sd	t5,272(a0)
    8020906a:	11f53c23          	sd	t6,280(a0)
    8020906e:	140022f3          	csrr	t0,sscratch
    80209072:	06553823          	sd	t0,112(a0)
    80209076:	00853103          	ld	sp,8(a0)
    8020907a:	02053203          	ld	tp,32(a0)
    8020907e:	01053283          	ld	t0,16(a0)
    80209082:	00053303          	ld	t1,0(a0)
    80209086:	18031073          	csrw	satp,t1
    8020908a:	12000073          	sfence.vma
    8020908e:	8282                	jr	t0

0000000080209090 <userret>:
    80209090:	18059073          	csrw	satp,a1
    80209094:	12000073          	sfence.vma
    80209098:	07053283          	ld	t0,112(a0)
    8020909c:	14029073          	csrw	sscratch,t0
    802090a0:	02853083          	ld	ra,40(a0)
    802090a4:	03053103          	ld	sp,48(a0)
    802090a8:	03853183          	ld	gp,56(a0)
    802090ac:	04053203          	ld	tp,64(a0)
    802090b0:	04853283          	ld	t0,72(a0)
    802090b4:	05053303          	ld	t1,80(a0)
    802090b8:	05853383          	ld	t2,88(a0)
    802090bc:	7120                	ld	s0,96(a0)
    802090be:	7524                	ld	s1,104(a0)
    802090c0:	7d2c                	ld	a1,120(a0)
    802090c2:	6150                	ld	a2,128(a0)
    802090c4:	6554                	ld	a3,136(a0)
    802090c6:	6958                	ld	a4,144(a0)
    802090c8:	6d5c                	ld	a5,152(a0)
    802090ca:	0a053803          	ld	a6,160(a0)
    802090ce:	0a853883          	ld	a7,168(a0)
    802090d2:	0b053903          	ld	s2,176(a0)
    802090d6:	0b853983          	ld	s3,184(a0)
    802090da:	0c053a03          	ld	s4,192(a0)
    802090de:	0c853a83          	ld	s5,200(a0)
    802090e2:	0d053b03          	ld	s6,208(a0)
    802090e6:	0d853b83          	ld	s7,216(a0)
    802090ea:	0e053c03          	ld	s8,224(a0)
    802090ee:	0e853c83          	ld	s9,232(a0)
    802090f2:	0f053d03          	ld	s10,240(a0)
    802090f6:	0f853d83          	ld	s11,248(a0)
    802090fa:	10053e03          	ld	t3,256(a0)
    802090fe:	10853e83          	ld	t4,264(a0)
    80209102:	11053f03          	ld	t5,272(a0)
    80209106:	11853f83          	ld	t6,280(a0)
    8020910a:	14051573          	csrrw	a0,sscratch,a0
    8020910e:	10200073          	sret
	...
