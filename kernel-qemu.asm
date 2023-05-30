
kernel-qemu：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_entry>:
    80200000:	00150293          	addi	t0,a0,1
    80200004:	02ba                	slli	t0,t0,0xe
    80200006:	0000d117          	auipc	sp,0xd
    8020000a:	10a13103          	ld	sp,266(sp) # 8020d110 <_GLOBAL_OFFSET_TABLE_+0x60>
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
    80200094:	00007097          	auipc	ra,0x7
    80200098:	7a0080e7          	jalr	1952(ra) # 80207834 <consputc>
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
    802000ca:	00007097          	auipc	ra,0x7
    802000ce:	76a080e7          	jalr	1898(ra) # 80207834 <consputc>
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
    8020021e:	00007097          	auipc	ra,0x7
    80200222:	616080e7          	jalr	1558(ra) # 80207834 <consputc>
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
    802002b4:	584080e7          	jalr	1412(ra) # 80207834 <consputc>
  consputc('x');
    802002b8:	07800513          	li	a0,120
    802002bc:	00007097          	auipc	ra,0x7
    802002c0:	578080e7          	jalr	1400(ra) # 80207834 <consputc>
    802002c4:	896a                	mv	s2,s10
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802002c6:	03c9d793          	srli	a5,s3,0x3c
    802002ca:	97de                	add	a5,a5,s7
    802002cc:	0007c503          	lbu	a0,0(a5)
    802002d0:	00007097          	auipc	ra,0x7
    802002d4:	564080e7          	jalr	1380(ra) # 80207834 <consputc>
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
    80200300:	538080e7          	jalr	1336(ra) # 80207834 <consputc>
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
    80200322:	516080e7          	jalr	1302(ra) # 80207834 <consputc>
      break;
    80200326:	b701                	j	80200226 <printf+0x9a>
      consputc('%');
    80200328:	8556                	mv	a0,s5
    8020032a:	00007097          	auipc	ra,0x7
    8020032e:	50a080e7          	jalr	1290(ra) # 80207834 <consputc>
      consputc(c);
    80200332:	854a                	mv	a0,s2
    80200334:	00007097          	auipc	ra,0x7
    80200338:	500080e7          	jalr	1280(ra) # 80207834 <consputc>
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
    802005f4:	468080e7          	jalr	1128(ra) # 80201a58 <mycpu>
    802005f8:	5d3c                	lw	a5,120(a0)
    802005fa:	cf89                	beqz	a5,80200614 <push_off+0x3c>
    mycpu()->intena = old;
  mycpu()->noff += 1;
    802005fc:	00001097          	auipc	ra,0x1
    80200600:	45c080e7          	jalr	1116(ra) # 80201a58 <mycpu>
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
    80200618:	444080e7          	jalr	1092(ra) # 80201a58 <mycpu>
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
    80200630:	42c080e7          	jalr	1068(ra) # 80201a58 <mycpu>
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
    802006b2:	3aa080e7          	jalr	938(ra) # 80201a58 <mycpu>
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
    802006fc:	360080e7          	jalr	864(ra) # 80201a58 <mycpu>
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

volatile static int started = 0;

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
    80200a18:	0fa080e7          	jalr	250(ra) # 80200b0e <kvminithart>
    trapinithart();
    80200a1c:	00002097          	auipc	ra,0x2
    80200a20:	e12080e7          	jalr	-494(ra) # 8020282e <trapinithart>
    plicinithart();  // ask PLIC for device interrupts
    80200a24:	00007097          	auipc	ra,0x7
    80200a28:	bca080e7          	jalr	-1078(ra) # 802075ee <plicinithart>
    printf("hart 1 init done\n");
    80200a2c:	0000a517          	auipc	a0,0xa
    80200a30:	9c450513          	addi	a0,a0,-1596 # 8020a3f0 <digits+0x70>
    80200a34:	fffff097          	auipc	ra,0xfffff
    80200a38:	758080e7          	jalr	1880(ra) # 8020018c <printf>
  }
  scheduler();
    80200a3c:	00001097          	auipc	ra,0x1
    80200a40:	5ac080e7          	jalr	1452(ra) # 80201fe8 <scheduler>
    consoleinit();
    80200a44:	00007097          	auipc	ra,0x7
    80200a48:	fc0080e7          	jalr	-64(ra) # 80207a04 <consoleinit>
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
    80200a68:	2f4080e7          	jalr	756(ra) # 80200d58 <kvminit>
    kvminithart();   // turn on paging
    80200a6c:	00000097          	auipc	ra,0x0
    80200a70:	0a2080e7          	jalr	162(ra) # 80200b0e <kvminithart>
    timerinit();     // init a lock for timer
    80200a74:	00005097          	auipc	ra,0x5
    80200a78:	14a080e7          	jalr	330(ra) # 80205bbe <timerinit>
    trapinithart();  // install kernel trap vector, including interrupt handler
    80200a7c:	00002097          	auipc	ra,0x2
    80200a80:	db2080e7          	jalr	-590(ra) # 8020282e <trapinithart>
    procinit();
    80200a84:	00001097          	auipc	ra,0x1
    80200a88:	f4e080e7          	jalr	-178(ra) # 802019d2 <procinit>
    plicinit();
    80200a8c:	00007097          	auipc	ra,0x7
    80200a90:	b4a080e7          	jalr	-1206(ra) # 802075d6 <plicinit>
    plicinithart();
    80200a94:	00007097          	auipc	ra,0x7
    80200a98:	b5a080e7          	jalr	-1190(ra) # 802075ee <plicinithart>
    disk_init();
    80200a9c:	00005097          	auipc	ra,0x5
    80200aa0:	1be080e7          	jalr	446(ra) # 80205c5a <disk_init>
    binit();         // buffer cache
    80200aa4:	00003097          	auipc	ra,0x3
    80200aa8:	cd6080e7          	jalr	-810(ra) # 8020377a <binit>
    fileinit();      // file table
    80200aac:	00003097          	auipc	ra,0x3
    80200ab0:	0da080e7          	jalr	218(ra) # 80203b86 <fileinit>
    userinit();      // first user process
    80200ab4:	00001097          	auipc	ra,0x1
    80200ab8:	2ce080e7          	jalr	718(ra) # 80201d82 <userinit>
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
	register uint64 a0 asm ("a0") = (uint64)(arg0);
    80200ae2:	4505                	li	a0,1
	register uint64 a1 asm ("a1") = (uint64)(arg1);
    80200ae4:	0000c597          	auipc	a1,0xc
    80200ae8:	60c5b583          	ld	a1,1548(a1) # 8020d0f0 <_GLOBAL_OFFSET_TABLE_+0x40>
	register uint64 a4 asm ("a4") = (uint64)(arg4);
    80200aec:	4701                	li	a4,0
	register uint64 a5 asm ("a5") = (uint64)(arg5);
    80200aee:	4781                	li	a5,0
	register uint64 a6 asm ("a6") = (uint64)(fid);
    80200af0:	4801                	li	a6,0
	register uint64 a7 asm ("a7") = (uint64)(ext);
    80200af2:	004858b7          	lui	a7,0x485
    80200af6:	34d88893          	addi	a7,a7,845 # 48534d <_entry-0x7fd7acb3>
	asm volatile ("ecall"
    80200afa:	00000073          	ecall
    __sync_synchronize();
    80200afe:	0ff0000f          	fence
    started = 1;
    80200b02:	4785                	li	a5,1
    80200b04:	00015717          	auipc	a4,0x15
    80200b08:	54f72623          	sw	a5,1356(a4) # 80216050 <started>
    80200b0c:	bf05                	j	80200a3c <main+0x4a>

0000000080200b0e <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80200b0e:	1141                	addi	sp,sp,-16
    80200b10:	e422                	sd	s0,8(sp)
    80200b12:	0800                	addi	s0,sp,16
  w_satp(MAKE_SATP(kernel_pagetable));
    80200b14:	00015797          	auipc	a5,0x15
    80200b18:	5447b783          	ld	a5,1348(a5) # 80216058 <kernel_pagetable>
    80200b1c:	83b1                	srli	a5,a5,0xc
    80200b1e:	577d                	li	a4,-1
    80200b20:	177e                	slli	a4,a4,0x3f
    80200b22:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    80200b24:	18079073          	csrw	satp,a5
static inline void
sfence_vma()
{
  // the zero, zero means flush all TLB entries.
  // asm volatile("sfence.vma zero, zero");
  asm volatile("sfence.vma");
    80200b28:	12000073          	sfence.vma
  // reg_info();
  sfence_vma();
  #ifdef DEBUG
  printf("kvminithart\n");
  #endif
}
    80200b2c:	6422                	ld	s0,8(sp)
    80200b2e:	0141                	addi	sp,sp,16
    80200b30:	8082                	ret

0000000080200b32 <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80200b32:	7139                	addi	sp,sp,-64
    80200b34:	fc06                	sd	ra,56(sp)
    80200b36:	f822                	sd	s0,48(sp)
    80200b38:	f426                	sd	s1,40(sp)
    80200b3a:	f04a                	sd	s2,32(sp)
    80200b3c:	ec4e                	sd	s3,24(sp)
    80200b3e:	e852                	sd	s4,16(sp)
    80200b40:	e456                	sd	s5,8(sp)
    80200b42:	e05a                	sd	s6,0(sp)
    80200b44:	0080                	addi	s0,sp,64
    80200b46:	84aa                	mv	s1,a0
    80200b48:	89ae                	mv	s3,a1
    80200b4a:	8ab2                	mv	s5,a2
  
  if(va >= MAXVA)
    80200b4c:	57fd                	li	a5,-1
    80200b4e:	83e9                	srli	a5,a5,0x1a
    80200b50:	4a79                	li	s4,30
    panic("walk");

  for(int level = 2; level > 0; level--) {
    80200b52:	4b31                	li	s6,12
  if(va >= MAXVA)
    80200b54:	04b7f263          	bgeu	a5,a1,80200b98 <walk+0x66>
    panic("walk");
    80200b58:	0000a517          	auipc	a0,0xa
    80200b5c:	8b050513          	addi	a0,a0,-1872 # 8020a408 <digits+0x88>
    80200b60:	fffff097          	auipc	ra,0xfffff
    80200b64:	5e2080e7          	jalr	1506(ra) # 80200142 <panic>
    pte_t *pte = &pagetable[PX(level, va)];
    if(*pte & PTE_V) {
      pagetable = (pagetable_t)PTE2PA(*pte);
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == NULL)
    80200b68:	060a8663          	beqz	s5,80200bd4 <walk+0xa2>
    80200b6c:	00000097          	auipc	ra,0x0
    80200b70:	9f0080e7          	jalr	-1552(ra) # 8020055c <kalloc>
    80200b74:	84aa                	mv	s1,a0
    80200b76:	c529                	beqz	a0,80200bc0 <walk+0x8e>
        return NULL;
      memset(pagetable, 0, PGSIZE);
    80200b78:	6605                	lui	a2,0x1
    80200b7a:	4581                	li	a1,0
    80200b7c:	00000097          	auipc	ra,0x0
    80200b80:	be8080e7          	jalr	-1048(ra) # 80200764 <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80200b84:	00c4d793          	srli	a5,s1,0xc
    80200b88:	07aa                	slli	a5,a5,0xa
    80200b8a:	0017e793          	ori	a5,a5,1
    80200b8e:	00f93023          	sd	a5,0(s2)
  for(int level = 2; level > 0; level--) {
    80200b92:	3a5d                	addiw	s4,s4,-9
    80200b94:	036a0063          	beq	s4,s6,80200bb4 <walk+0x82>
    pte_t *pte = &pagetable[PX(level, va)];
    80200b98:	0149d933          	srl	s2,s3,s4
    80200b9c:	1ff97913          	andi	s2,s2,511
    80200ba0:	090e                	slli	s2,s2,0x3
    80200ba2:	9926                	add	s2,s2,s1
    if(*pte & PTE_V) {
    80200ba4:	00093483          	ld	s1,0(s2)
    80200ba8:	0014f793          	andi	a5,s1,1
    80200bac:	dfd5                	beqz	a5,80200b68 <walk+0x36>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80200bae:	80a9                	srli	s1,s1,0xa
    80200bb0:	04b2                	slli	s1,s1,0xc
    80200bb2:	b7c5                	j	80200b92 <walk+0x60>
    }
  }
  return &pagetable[PX(0, va)];
    80200bb4:	00c9d513          	srli	a0,s3,0xc
    80200bb8:	1ff57513          	andi	a0,a0,511
    80200bbc:	050e                	slli	a0,a0,0x3
    80200bbe:	9526                	add	a0,a0,s1
}
    80200bc0:	70e2                	ld	ra,56(sp)
    80200bc2:	7442                	ld	s0,48(sp)
    80200bc4:	74a2                	ld	s1,40(sp)
    80200bc6:	7902                	ld	s2,32(sp)
    80200bc8:	69e2                	ld	s3,24(sp)
    80200bca:	6a42                	ld	s4,16(sp)
    80200bcc:	6aa2                	ld	s5,8(sp)
    80200bce:	6b02                	ld	s6,0(sp)
    80200bd0:	6121                	addi	sp,sp,64
    80200bd2:	8082                	ret
        return NULL;
    80200bd4:	4501                	li	a0,0
    80200bd6:	b7ed                	j	80200bc0 <walk+0x8e>

0000000080200bd8 <walkaddr>:
walkaddr(pagetable_t pagetable, uint64 va)
{
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80200bd8:	57fd                	li	a5,-1
    80200bda:	83e9                	srli	a5,a5,0x1a
    80200bdc:	00b7f463          	bgeu	a5,a1,80200be4 <walkaddr+0xc>
    return NULL;
    80200be0:	4501                	li	a0,0
    return NULL;
  if((*pte & PTE_U) == 0)
    return NULL;
  pa = PTE2PA(*pte);
  return pa;
}
    80200be2:	8082                	ret
{
    80200be4:	1141                	addi	sp,sp,-16
    80200be6:	e406                	sd	ra,8(sp)
    80200be8:	e022                	sd	s0,0(sp)
    80200bea:	0800                	addi	s0,sp,16
  pte = walk(pagetable, va, 0);
    80200bec:	4601                	li	a2,0
    80200bee:	00000097          	auipc	ra,0x0
    80200bf2:	f44080e7          	jalr	-188(ra) # 80200b32 <walk>
  if(pte == 0)
    80200bf6:	c105                	beqz	a0,80200c16 <walkaddr+0x3e>
  if((*pte & PTE_V) == 0)
    80200bf8:	611c                	ld	a5,0(a0)
  if((*pte & PTE_U) == 0)
    80200bfa:	0117f693          	andi	a3,a5,17
    80200bfe:	4745                	li	a4,17
    return NULL;
    80200c00:	4501                	li	a0,0
  if((*pte & PTE_U) == 0)
    80200c02:	00e68663          	beq	a3,a4,80200c0e <walkaddr+0x36>
}
    80200c06:	60a2                	ld	ra,8(sp)
    80200c08:	6402                	ld	s0,0(sp)
    80200c0a:	0141                	addi	sp,sp,16
    80200c0c:	8082                	ret
  pa = PTE2PA(*pte);
    80200c0e:	00a7d513          	srli	a0,a5,0xa
    80200c12:	0532                	slli	a0,a0,0xc
  return pa;
    80200c14:	bfcd                	j	80200c06 <walkaddr+0x2e>
    return NULL;
    80200c16:	4501                	li	a0,0
    80200c18:	b7fd                	j	80200c06 <walkaddr+0x2e>

0000000080200c1a <kwalkaddr>:
  return kwalkaddr(kernel_pagetable, va);
}

uint64
kwalkaddr(pagetable_t kpt, uint64 va)
{
    80200c1a:	1101                	addi	sp,sp,-32
    80200c1c:	ec06                	sd	ra,24(sp)
    80200c1e:	e822                	sd	s0,16(sp)
    80200c20:	e426                	sd	s1,8(sp)
    80200c22:	1000                	addi	s0,sp,32
  uint64 off = va % PGSIZE;
    80200c24:	03459793          	slli	a5,a1,0x34
    80200c28:	0347d493          	srli	s1,a5,0x34
  pte_t *pte;
  uint64 pa;
  
  pte = walk(kpt, va, 0);
    80200c2c:	4601                	li	a2,0
    80200c2e:	00000097          	auipc	ra,0x0
    80200c32:	f04080e7          	jalr	-252(ra) # 80200b32 <walk>
  if(pte == 0)
    80200c36:	cd09                	beqz	a0,80200c50 <kwalkaddr+0x36>
    panic("kvmpa");
  if((*pte & PTE_V) == 0)
    80200c38:	6108                	ld	a0,0(a0)
    80200c3a:	00157793          	andi	a5,a0,1
    80200c3e:	c38d                	beqz	a5,80200c60 <kwalkaddr+0x46>
    panic("kvmpa");
  pa = PTE2PA(*pte);
    80200c40:	8129                	srli	a0,a0,0xa
    80200c42:	0532                	slli	a0,a0,0xc
  return pa+off;
}
    80200c44:	9526                	add	a0,a0,s1
    80200c46:	60e2                	ld	ra,24(sp)
    80200c48:	6442                	ld	s0,16(sp)
    80200c4a:	64a2                	ld	s1,8(sp)
    80200c4c:	6105                	addi	sp,sp,32
    80200c4e:	8082                	ret
    panic("kvmpa");
    80200c50:	00009517          	auipc	a0,0x9
    80200c54:	7c050513          	addi	a0,a0,1984 # 8020a410 <digits+0x90>
    80200c58:	fffff097          	auipc	ra,0xfffff
    80200c5c:	4ea080e7          	jalr	1258(ra) # 80200142 <panic>
    panic("kvmpa");
    80200c60:	00009517          	auipc	a0,0x9
    80200c64:	7b050513          	addi	a0,a0,1968 # 8020a410 <digits+0x90>
    80200c68:	fffff097          	auipc	ra,0xfffff
    80200c6c:	4da080e7          	jalr	1242(ra) # 80200142 <panic>

0000000080200c70 <kvmpa>:
{
    80200c70:	1141                	addi	sp,sp,-16
    80200c72:	e406                	sd	ra,8(sp)
    80200c74:	e022                	sd	s0,0(sp)
    80200c76:	0800                	addi	s0,sp,16
    80200c78:	85aa                	mv	a1,a0
  return kwalkaddr(kernel_pagetable, va);
    80200c7a:	00015517          	auipc	a0,0x15
    80200c7e:	3de53503          	ld	a0,990(a0) # 80216058 <kernel_pagetable>
    80200c82:	00000097          	auipc	ra,0x0
    80200c86:	f98080e7          	jalr	-104(ra) # 80200c1a <kwalkaddr>
}
    80200c8a:	60a2                	ld	ra,8(sp)
    80200c8c:	6402                	ld	s0,0(sp)
    80200c8e:	0141                	addi	sp,sp,16
    80200c90:	8082                	ret

0000000080200c92 <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80200c92:	715d                	addi	sp,sp,-80
    80200c94:	e486                	sd	ra,72(sp)
    80200c96:	e0a2                	sd	s0,64(sp)
    80200c98:	fc26                	sd	s1,56(sp)
    80200c9a:	f84a                	sd	s2,48(sp)
    80200c9c:	f44e                	sd	s3,40(sp)
    80200c9e:	f052                	sd	s4,32(sp)
    80200ca0:	ec56                	sd	s5,24(sp)
    80200ca2:	e85a                	sd	s6,16(sp)
    80200ca4:	e45e                	sd	s7,8(sp)
    80200ca6:	0880                	addi	s0,sp,80
    80200ca8:	8aaa                	mv	s5,a0
    80200caa:	8b3a                	mv	s6,a4
  uint64 a, last;
  pte_t *pte;

  a = PGROUNDDOWN(va);
    80200cac:	777d                	lui	a4,0xfffff
    80200cae:	00e5f7b3          	and	a5,a1,a4
  last = PGROUNDDOWN(va + size - 1);
    80200cb2:	167d                	addi	a2,a2,-1
    80200cb4:	00b609b3          	add	s3,a2,a1
    80200cb8:	00e9f9b3          	and	s3,s3,a4
  a = PGROUNDDOWN(va);
    80200cbc:	893e                	mv	s2,a5
    80200cbe:	40f68a33          	sub	s4,a3,a5
    if(*pte & PTE_V)
      panic("remap");
    *pte = PA2PTE(pa) | perm | PTE_V;
    if(a == last)
      break;
    a += PGSIZE;
    80200cc2:	6b85                	lui	s7,0x1
    80200cc4:	012a04b3          	add	s1,s4,s2
    if((pte = walk(pagetable, a, 1)) == NULL)
    80200cc8:	4605                	li	a2,1
    80200cca:	85ca                	mv	a1,s2
    80200ccc:	8556                	mv	a0,s5
    80200cce:	00000097          	auipc	ra,0x0
    80200cd2:	e64080e7          	jalr	-412(ra) # 80200b32 <walk>
    80200cd6:	c51d                	beqz	a0,80200d04 <mappages+0x72>
    if(*pte & PTE_V)
    80200cd8:	611c                	ld	a5,0(a0)
    80200cda:	8b85                	andi	a5,a5,1
    80200cdc:	ef81                	bnez	a5,80200cf4 <mappages+0x62>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80200cde:	80b1                	srli	s1,s1,0xc
    80200ce0:	04aa                	slli	s1,s1,0xa
    80200ce2:	0164e4b3          	or	s1,s1,s6
    80200ce6:	0014e493          	ori	s1,s1,1
    80200cea:	e104                	sd	s1,0(a0)
    if(a == last)
    80200cec:	03390863          	beq	s2,s3,80200d1c <mappages+0x8a>
    a += PGSIZE;
    80200cf0:	995e                	add	s2,s2,s7
    if((pte = walk(pagetable, a, 1)) == NULL)
    80200cf2:	bfc9                	j	80200cc4 <mappages+0x32>
      panic("remap");
    80200cf4:	00009517          	auipc	a0,0x9
    80200cf8:	72450513          	addi	a0,a0,1828 # 8020a418 <digits+0x98>
    80200cfc:	fffff097          	auipc	ra,0xfffff
    80200d00:	446080e7          	jalr	1094(ra) # 80200142 <panic>
      return -1;
    80200d04:	557d                	li	a0,-1
    pa += PGSIZE;
  }
  return 0;
}
    80200d06:	60a6                	ld	ra,72(sp)
    80200d08:	6406                	ld	s0,64(sp)
    80200d0a:	74e2                	ld	s1,56(sp)
    80200d0c:	7942                	ld	s2,48(sp)
    80200d0e:	79a2                	ld	s3,40(sp)
    80200d10:	7a02                	ld	s4,32(sp)
    80200d12:	6ae2                	ld	s5,24(sp)
    80200d14:	6b42                	ld	s6,16(sp)
    80200d16:	6ba2                	ld	s7,8(sp)
    80200d18:	6161                	addi	sp,sp,80
    80200d1a:	8082                	ret
  return 0;
    80200d1c:	4501                	li	a0,0
    80200d1e:	b7e5                	j	80200d06 <mappages+0x74>

0000000080200d20 <kvmmap>:
{
    80200d20:	1141                	addi	sp,sp,-16
    80200d22:	e406                	sd	ra,8(sp)
    80200d24:	e022                	sd	s0,0(sp)
    80200d26:	0800                	addi	s0,sp,16
    80200d28:	8736                	mv	a4,a3
  if(mappages(kernel_pagetable, va, sz, pa, perm) != 0)
    80200d2a:	86ae                	mv	a3,a1
    80200d2c:	85aa                	mv	a1,a0
    80200d2e:	00015517          	auipc	a0,0x15
    80200d32:	32a53503          	ld	a0,810(a0) # 80216058 <kernel_pagetable>
    80200d36:	00000097          	auipc	ra,0x0
    80200d3a:	f5c080e7          	jalr	-164(ra) # 80200c92 <mappages>
    80200d3e:	e509                	bnez	a0,80200d48 <kvmmap+0x28>
}
    80200d40:	60a2                	ld	ra,8(sp)
    80200d42:	6402                	ld	s0,0(sp)
    80200d44:	0141                	addi	sp,sp,16
    80200d46:	8082                	ret
    panic("kvmmap");
    80200d48:	00009517          	auipc	a0,0x9
    80200d4c:	6d850513          	addi	a0,a0,1752 # 8020a420 <digits+0xa0>
    80200d50:	fffff097          	auipc	ra,0xfffff
    80200d54:	3f2080e7          	jalr	1010(ra) # 80200142 <panic>

0000000080200d58 <kvminit>:
{
    80200d58:	1101                	addi	sp,sp,-32
    80200d5a:	ec06                	sd	ra,24(sp)
    80200d5c:	e822                	sd	s0,16(sp)
    80200d5e:	e426                	sd	s1,8(sp)
    80200d60:	1000                	addi	s0,sp,32
  kernel_pagetable = (pagetable_t) kalloc();
    80200d62:	fffff097          	auipc	ra,0xfffff
    80200d66:	7fa080e7          	jalr	2042(ra) # 8020055c <kalloc>
    80200d6a:	00015797          	auipc	a5,0x15
    80200d6e:	2ea7b723          	sd	a0,750(a5) # 80216058 <kernel_pagetable>
  memset(kernel_pagetable, 0, PGSIZE);
    80200d72:	6605                	lui	a2,0x1
    80200d74:	4581                	li	a1,0
    80200d76:	00000097          	auipc	ra,0x0
    80200d7a:	9ee080e7          	jalr	-1554(ra) # 80200764 <memset>
  kvmmap(UART_V, UART, PGSIZE, PTE_R | PTE_W);
    80200d7e:	4699                	li	a3,6
    80200d80:	6605                	lui	a2,0x1
    80200d82:	100005b7          	lui	a1,0x10000
    80200d86:	3f100513          	li	a0,1009
    80200d8a:	0572                	slli	a0,a0,0x1c
    80200d8c:	00000097          	auipc	ra,0x0
    80200d90:	f94080e7          	jalr	-108(ra) # 80200d20 <kvmmap>
  kvmmap(VIRTIO0_V, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    80200d94:	4699                	li	a3,6
    80200d96:	6605                	lui	a2,0x1
    80200d98:	100015b7          	lui	a1,0x10001
    80200d9c:	03f10537          	lui	a0,0x3f10
    80200da0:	0505                	addi	a0,a0,1
    80200da2:	0532                	slli	a0,a0,0xc
    80200da4:	00000097          	auipc	ra,0x0
    80200da8:	f7c080e7          	jalr	-132(ra) # 80200d20 <kvmmap>
  kvmmap(CLINT_V, CLINT, 0x10000, PTE_R | PTE_W);
    80200dac:	4699                	li	a3,6
    80200dae:	6641                	lui	a2,0x10
    80200db0:	020005b7          	lui	a1,0x2000
    80200db4:	01f81537          	lui	a0,0x1f81
    80200db8:	0536                	slli	a0,a0,0xd
    80200dba:	00000097          	auipc	ra,0x0
    80200dbe:	f66080e7          	jalr	-154(ra) # 80200d20 <kvmmap>
  kvmmap(PLIC_V, PLIC, 0x4000, PTE_R | PTE_W);
    80200dc2:	4699                	li	a3,6
    80200dc4:	6611                	lui	a2,0x4
    80200dc6:	0c0005b7          	lui	a1,0xc000
    80200dca:	00fc3537          	lui	a0,0xfc3
    80200dce:	053a                	slli	a0,a0,0xe
    80200dd0:	00000097          	auipc	ra,0x0
    80200dd4:	f50080e7          	jalr	-176(ra) # 80200d20 <kvmmap>
  kvmmap(PLIC_V + 0x200000, PLIC + 0x200000, 0x4000, PTE_R | PTE_W);
    80200dd8:	4699                	li	a3,6
    80200dda:	6611                	lui	a2,0x4
    80200ddc:	0c2005b7          	lui	a1,0xc200
    80200de0:	1f861537          	lui	a0,0x1f861
    80200de4:	0526                	slli	a0,a0,0x9
    80200de6:	00000097          	auipc	ra,0x0
    80200dea:	f3a080e7          	jalr	-198(ra) # 80200d20 <kvmmap>
  kvmmap(KERNBASE, KERNBASE, (uint64)etext - KERNBASE, PTE_R | PTE_X);
    80200dee:	0000c497          	auipc	s1,0xc
    80200df2:	2ea4b483          	ld	s1,746(s1) # 8020d0d8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80200df6:	46a9                	li	a3,10
    80200df8:	bff00613          	li	a2,-1025
    80200dfc:	0656                	slli	a2,a2,0x15
    80200dfe:	9626                	add	a2,a2,s1
    80200e00:	40100593          	li	a1,1025
    80200e04:	05d6                	slli	a1,a1,0x15
    80200e06:	852e                	mv	a0,a1
    80200e08:	00000097          	auipc	ra,0x0
    80200e0c:	f18080e7          	jalr	-232(ra) # 80200d20 <kvmmap>
  kvmmap((uint64)etext, (uint64)etext, PHYSTOP - (uint64)etext, PTE_R | PTE_W);
    80200e10:	4699                	li	a3,6
    80200e12:	40300613          	li	a2,1027
    80200e16:	0656                	slli	a2,a2,0x15
    80200e18:	8e05                	sub	a2,a2,s1
    80200e1a:	85a6                	mv	a1,s1
    80200e1c:	8526                	mv	a0,s1
    80200e1e:	00000097          	auipc	ra,0x0
    80200e22:	f02080e7          	jalr	-254(ra) # 80200d20 <kvmmap>
  kvmmap(TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80200e26:	46a9                	li	a3,10
    80200e28:	6605                	lui	a2,0x1
    80200e2a:	0000c597          	auipc	a1,0xc
    80200e2e:	28e5b583          	ld	a1,654(a1) # 8020d0b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80200e32:	04000537          	lui	a0,0x4000
    80200e36:	157d                	addi	a0,a0,-1
    80200e38:	0532                	slli	a0,a0,0xc
    80200e3a:	00000097          	auipc	ra,0x0
    80200e3e:	ee6080e7          	jalr	-282(ra) # 80200d20 <kvmmap>
}
    80200e42:	60e2                	ld	ra,24(sp)
    80200e44:	6442                	ld	s0,16(sp)
    80200e46:	64a2                	ld	s1,8(sp)
    80200e48:	6105                	addi	sp,sp,32
    80200e4a:	8082                	ret

0000000080200e4c <vmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
vmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80200e4c:	715d                	addi	sp,sp,-80
    80200e4e:	e486                	sd	ra,72(sp)
    80200e50:	e0a2                	sd	s0,64(sp)
    80200e52:	fc26                	sd	s1,56(sp)
    80200e54:	f84a                	sd	s2,48(sp)
    80200e56:	f44e                	sd	s3,40(sp)
    80200e58:	f052                	sd	s4,32(sp)
    80200e5a:	ec56                	sd	s5,24(sp)
    80200e5c:	e85a                	sd	s6,16(sp)
    80200e5e:	e45e                	sd	s7,8(sp)
    80200e60:	0880                	addi	s0,sp,80
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80200e62:	03459793          	slli	a5,a1,0x34
    80200e66:	e795                	bnez	a5,80200e92 <vmunmap+0x46>
    80200e68:	8a2a                	mv	s4,a0
    80200e6a:	892e                	mv	s2,a1
    80200e6c:	8ab6                	mv	s5,a3
    panic("vmunmap: not aligned");

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80200e6e:	0632                	slli	a2,a2,0xc
    80200e70:	00b609b3          	add	s3,a2,a1
    if((pte = walk(pagetable, a, 0)) == 0)
      panic("vmunmap: walk");
    if((*pte & PTE_V) == 0)
      panic("vmunmap: not mapped");
    if(PTE_FLAGS(*pte) == PTE_V)
    80200e74:	4b85                	li	s7,1
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80200e76:	6b05                	lui	s6,0x1
    80200e78:	0735e863          	bltu	a1,s3,80200ee8 <vmunmap+0x9c>
      uint64 pa = PTE2PA(*pte);
      kfree((void*)pa);
    }
    *pte = 0;
  }
}
    80200e7c:	60a6                	ld	ra,72(sp)
    80200e7e:	6406                	ld	s0,64(sp)
    80200e80:	74e2                	ld	s1,56(sp)
    80200e82:	7942                	ld	s2,48(sp)
    80200e84:	79a2                	ld	s3,40(sp)
    80200e86:	7a02                	ld	s4,32(sp)
    80200e88:	6ae2                	ld	s5,24(sp)
    80200e8a:	6b42                	ld	s6,16(sp)
    80200e8c:	6ba2                	ld	s7,8(sp)
    80200e8e:	6161                	addi	sp,sp,80
    80200e90:	8082                	ret
    panic("vmunmap: not aligned");
    80200e92:	00009517          	auipc	a0,0x9
    80200e96:	59650513          	addi	a0,a0,1430 # 8020a428 <digits+0xa8>
    80200e9a:	fffff097          	auipc	ra,0xfffff
    80200e9e:	2a8080e7          	jalr	680(ra) # 80200142 <panic>
      panic("vmunmap: walk");
    80200ea2:	00009517          	auipc	a0,0x9
    80200ea6:	59e50513          	addi	a0,a0,1438 # 8020a440 <digits+0xc0>
    80200eaa:	fffff097          	auipc	ra,0xfffff
    80200eae:	298080e7          	jalr	664(ra) # 80200142 <panic>
      panic("vmunmap: not mapped");
    80200eb2:	00009517          	auipc	a0,0x9
    80200eb6:	59e50513          	addi	a0,a0,1438 # 8020a450 <digits+0xd0>
    80200eba:	fffff097          	auipc	ra,0xfffff
    80200ebe:	288080e7          	jalr	648(ra) # 80200142 <panic>
      panic("vmunmap: not a leaf");
    80200ec2:	00009517          	auipc	a0,0x9
    80200ec6:	5a650513          	addi	a0,a0,1446 # 8020a468 <digits+0xe8>
    80200eca:	fffff097          	auipc	ra,0xfffff
    80200ece:	278080e7          	jalr	632(ra) # 80200142 <panic>
      uint64 pa = PTE2PA(*pte);
    80200ed2:	8129                	srli	a0,a0,0xa
      kfree((void*)pa);
    80200ed4:	0532                	slli	a0,a0,0xc
    80200ed6:	fffff097          	auipc	ra,0xfffff
    80200eda:	56e080e7          	jalr	1390(ra) # 80200444 <kfree>
    *pte = 0;
    80200ede:	0004b023          	sd	zero,0(s1)
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80200ee2:	995a                	add	s2,s2,s6
    80200ee4:	f9397ce3          	bgeu	s2,s3,80200e7c <vmunmap+0x30>
    if((pte = walk(pagetable, a, 0)) == 0)
    80200ee8:	4601                	li	a2,0
    80200eea:	85ca                	mv	a1,s2
    80200eec:	8552                	mv	a0,s4
    80200eee:	00000097          	auipc	ra,0x0
    80200ef2:	c44080e7          	jalr	-956(ra) # 80200b32 <walk>
    80200ef6:	84aa                	mv	s1,a0
    80200ef8:	d54d                	beqz	a0,80200ea2 <vmunmap+0x56>
    if((*pte & PTE_V) == 0)
    80200efa:	6108                	ld	a0,0(a0)
    80200efc:	00157793          	andi	a5,a0,1
    80200f00:	dbcd                	beqz	a5,80200eb2 <vmunmap+0x66>
    if(PTE_FLAGS(*pte) == PTE_V)
    80200f02:	3ff57793          	andi	a5,a0,1023
    80200f06:	fb778ee3          	beq	a5,s7,80200ec2 <vmunmap+0x76>
    if(do_free){
    80200f0a:	fc0a8ae3          	beqz	s5,80200ede <vmunmap+0x92>
    80200f0e:	b7d1                	j	80200ed2 <vmunmap+0x86>

0000000080200f10 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80200f10:	1101                	addi	sp,sp,-32
    80200f12:	ec06                	sd	ra,24(sp)
    80200f14:	e822                	sd	s0,16(sp)
    80200f16:	e426                	sd	s1,8(sp)
    80200f18:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80200f1a:	fffff097          	auipc	ra,0xfffff
    80200f1e:	642080e7          	jalr	1602(ra) # 8020055c <kalloc>
    80200f22:	84aa                	mv	s1,a0
  if(pagetable == NULL)
    80200f24:	c519                	beqz	a0,80200f32 <uvmcreate+0x22>
    return NULL;
  memset(pagetable, 0, PGSIZE);
    80200f26:	6605                	lui	a2,0x1
    80200f28:	4581                	li	a1,0
    80200f2a:	00000097          	auipc	ra,0x0
    80200f2e:	83a080e7          	jalr	-1990(ra) # 80200764 <memset>
  return pagetable;
}
    80200f32:	8526                	mv	a0,s1
    80200f34:	60e2                	ld	ra,24(sp)
    80200f36:	6442                	ld	s0,16(sp)
    80200f38:	64a2                	ld	s1,8(sp)
    80200f3a:	6105                	addi	sp,sp,32
    80200f3c:	8082                	ret

0000000080200f3e <uvminit>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvminit(pagetable_t pagetable, pagetable_t kpagetable, uchar *src, uint sz)
{
    80200f3e:	7139                	addi	sp,sp,-64
    80200f40:	fc06                	sd	ra,56(sp)
    80200f42:	f822                	sd	s0,48(sp)
    80200f44:	f426                	sd	s1,40(sp)
    80200f46:	f04a                	sd	s2,32(sp)
    80200f48:	ec4e                	sd	s3,24(sp)
    80200f4a:	e852                	sd	s4,16(sp)
    80200f4c:	e456                	sd	s5,8(sp)
    80200f4e:	0080                	addi	s0,sp,64
  char *mem;

  if(sz >= PGSIZE)
    80200f50:	6785                	lui	a5,0x1
    80200f52:	06f6f363          	bgeu	a3,a5,80200fb8 <uvminit+0x7a>
    80200f56:	8aaa                	mv	s5,a0
    80200f58:	8a2e                	mv	s4,a1
    80200f5a:	89b2                	mv	s3,a2
    80200f5c:	8936                	mv	s2,a3
    panic("inituvm: more than a page");
  mem = kalloc();
    80200f5e:	fffff097          	auipc	ra,0xfffff
    80200f62:	5fe080e7          	jalr	1534(ra) # 8020055c <kalloc>
    80200f66:	84aa                	mv	s1,a0
  // printf("[uvminit]kalloc: %p\n", mem);
  memset(mem, 0, PGSIZE);
    80200f68:	6605                	lui	a2,0x1
    80200f6a:	4581                	li	a1,0
    80200f6c:	fffff097          	auipc	ra,0xfffff
    80200f70:	7f8080e7          	jalr	2040(ra) # 80200764 <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    80200f74:	4779                	li	a4,30
    80200f76:	86a6                	mv	a3,s1
    80200f78:	6605                	lui	a2,0x1
    80200f7a:	4581                	li	a1,0
    80200f7c:	8556                	mv	a0,s5
    80200f7e:	00000097          	auipc	ra,0x0
    80200f82:	d14080e7          	jalr	-748(ra) # 80200c92 <mappages>
  mappages(kpagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X);
    80200f86:	4739                	li	a4,14
    80200f88:	86a6                	mv	a3,s1
    80200f8a:	6605                	lui	a2,0x1
    80200f8c:	4581                	li	a1,0
    80200f8e:	8552                	mv	a0,s4
    80200f90:	00000097          	auipc	ra,0x0
    80200f94:	d02080e7          	jalr	-766(ra) # 80200c92 <mappages>
  memmove(mem, src, sz);
    80200f98:	864a                	mv	a2,s2
    80200f9a:	85ce                	mv	a1,s3
    80200f9c:	8526                	mv	a0,s1
    80200f9e:	00000097          	auipc	ra,0x0
    80200fa2:	826080e7          	jalr	-2010(ra) # 802007c4 <memmove>
  // for (int i = 0; i < sz; i ++) {
  //   printf("[uvminit]mem: %p, %x\n", mem + i, mem[i]);
  // }
}
    80200fa6:	70e2                	ld	ra,56(sp)
    80200fa8:	7442                	ld	s0,48(sp)
    80200faa:	74a2                	ld	s1,40(sp)
    80200fac:	7902                	ld	s2,32(sp)
    80200fae:	69e2                	ld	s3,24(sp)
    80200fb0:	6a42                	ld	s4,16(sp)
    80200fb2:	6aa2                	ld	s5,8(sp)
    80200fb4:	6121                	addi	sp,sp,64
    80200fb6:	8082                	ret
    panic("inituvm: more than a page");
    80200fb8:	00009517          	auipc	a0,0x9
    80200fbc:	4c850513          	addi	a0,a0,1224 # 8020a480 <digits+0x100>
    80200fc0:	fffff097          	auipc	ra,0xfffff
    80200fc4:	182080e7          	jalr	386(ra) # 80200142 <panic>

0000000080200fc8 <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, pagetable_t kpagetable, uint64 oldsz, uint64 newsz)
{
    80200fc8:	7179                	addi	sp,sp,-48
    80200fca:	f406                	sd	ra,40(sp)
    80200fcc:	f022                	sd	s0,32(sp)
    80200fce:	ec26                	sd	s1,24(sp)
    80200fd0:	e84a                	sd	s2,16(sp)
    80200fd2:	e44e                	sd	s3,8(sp)
    80200fd4:	e052                	sd	s4,0(sp)
    80200fd6:	1800                	addi	s0,sp,48
  if(newsz >= oldsz)
    return oldsz;
    80200fd8:	8932                	mv	s2,a2
  if(newsz >= oldsz)
    80200fda:	02c6f063          	bgeu	a3,a2,80200ffa <uvmdealloc+0x32>
    80200fde:	89aa                	mv	s3,a0
    80200fe0:	852e                	mv	a0,a1
    80200fe2:	8936                	mv	s2,a3

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    80200fe4:	6785                	lui	a5,0x1
    80200fe6:	17fd                	addi	a5,a5,-1
    80200fe8:	00f68a33          	add	s4,a3,a5
    80200fec:	777d                	lui	a4,0xfffff
    80200fee:	00ea7a33          	and	s4,s4,a4
    80200ff2:	963e                	add	a2,a2,a5
    80200ff4:	8e79                	and	a2,a2,a4
    80200ff6:	00ca6b63          	bltu	s4,a2,8020100c <uvmdealloc+0x44>
    vmunmap(kpagetable, PGROUNDUP(newsz), npages, 0);
    vmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
  }

  return newsz;
}
    80200ffa:	854a                	mv	a0,s2
    80200ffc:	70a2                	ld	ra,40(sp)
    80200ffe:	7402                	ld	s0,32(sp)
    80201000:	64e2                	ld	s1,24(sp)
    80201002:	6942                	ld	s2,16(sp)
    80201004:	69a2                	ld	s3,8(sp)
    80201006:	6a02                	ld	s4,0(sp)
    80201008:	6145                	addi	sp,sp,48
    8020100a:	8082                	ret
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    8020100c:	414604b3          	sub	s1,a2,s4
    80201010:	80b1                	srli	s1,s1,0xc
    vmunmap(kpagetable, PGROUNDUP(newsz), npages, 0);
    80201012:	2481                	sext.w	s1,s1
    80201014:	4681                	li	a3,0
    80201016:	8626                	mv	a2,s1
    80201018:	85d2                	mv	a1,s4
    8020101a:	00000097          	auipc	ra,0x0
    8020101e:	e32080e7          	jalr	-462(ra) # 80200e4c <vmunmap>
    vmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    80201022:	4685                	li	a3,1
    80201024:	8626                	mv	a2,s1
    80201026:	85d2                	mv	a1,s4
    80201028:	854e                	mv	a0,s3
    8020102a:	00000097          	auipc	ra,0x0
    8020102e:	e22080e7          	jalr	-478(ra) # 80200e4c <vmunmap>
    80201032:	b7e1                	j	80200ffa <uvmdealloc+0x32>

0000000080201034 <uvmalloc>:
  if(newsz < oldsz)
    80201034:	0ec6e763          	bltu	a3,a2,80201122 <uvmalloc+0xee>
{
    80201038:	7139                	addi	sp,sp,-64
    8020103a:	fc06                	sd	ra,56(sp)
    8020103c:	f822                	sd	s0,48(sp)
    8020103e:	f426                	sd	s1,40(sp)
    80201040:	f04a                	sd	s2,32(sp)
    80201042:	ec4e                	sd	s3,24(sp)
    80201044:	e852                	sd	s4,16(sp)
    80201046:	e456                	sd	s5,8(sp)
    80201048:	e05a                	sd	s6,0(sp)
    8020104a:	0080                	addi	s0,sp,64
    8020104c:	8a2a                	mv	s4,a0
    8020104e:	8aae                	mv	s5,a1
    80201050:	8b36                	mv	s6,a3
  oldsz = PGROUNDUP(oldsz);
    80201052:	6985                	lui	s3,0x1
    80201054:	19fd                	addi	s3,s3,-1
    80201056:	964e                	add	a2,a2,s3
    80201058:	79fd                	lui	s3,0xfffff
    8020105a:	013679b3          	and	s3,a2,s3
  for(a = oldsz; a < newsz; a += PGSIZE){
    8020105e:	0cd9f463          	bgeu	s3,a3,80201126 <uvmalloc+0xf2>
    80201062:	894e                	mv	s2,s3
    mem = kalloc();
    80201064:	fffff097          	auipc	ra,0xfffff
    80201068:	4f8080e7          	jalr	1272(ra) # 8020055c <kalloc>
    8020106c:	84aa                	mv	s1,a0
    if(mem == NULL){
    8020106e:	c129                	beqz	a0,802010b0 <uvmalloc+0x7c>
    memset(mem, 0, PGSIZE);
    80201070:	6605                	lui	a2,0x1
    80201072:	4581                	li	a1,0
    80201074:	fffff097          	auipc	ra,0xfffff
    80201078:	6f0080e7          	jalr	1776(ra) # 80200764 <memset>
    if (mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0) {
    8020107c:	4779                	li	a4,30
    8020107e:	86a6                	mv	a3,s1
    80201080:	6605                	lui	a2,0x1
    80201082:	85ca                	mv	a1,s2
    80201084:	8552                	mv	a0,s4
    80201086:	00000097          	auipc	ra,0x0
    8020108a:	c0c080e7          	jalr	-1012(ra) # 80200c92 <mappages>
    8020108e:	e521                	bnez	a0,802010d6 <uvmalloc+0xa2>
    if (mappages(kpagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R) != 0){
    80201090:	4739                	li	a4,14
    80201092:	86a6                	mv	a3,s1
    80201094:	6605                	lui	a2,0x1
    80201096:	85ca                	mv	a1,s2
    80201098:	8556                	mv	a0,s5
    8020109a:	00000097          	auipc	ra,0x0
    8020109e:	bf8080e7          	jalr	-1032(ra) # 80200c92 <mappages>
    802010a2:	e929                	bnez	a0,802010f4 <uvmalloc+0xc0>
  for(a = oldsz; a < newsz; a += PGSIZE){
    802010a4:	6785                	lui	a5,0x1
    802010a6:	993e                	add	s2,s2,a5
    802010a8:	fb696ee3          	bltu	s2,s6,80201064 <uvmalloc+0x30>
  return newsz;
    802010ac:	855a                	mv	a0,s6
    802010ae:	a811                	j	802010c2 <uvmalloc+0x8e>
      uvmdealloc(pagetable, kpagetable, a, oldsz);
    802010b0:	86ce                	mv	a3,s3
    802010b2:	864a                	mv	a2,s2
    802010b4:	85d6                	mv	a1,s5
    802010b6:	8552                	mv	a0,s4
    802010b8:	00000097          	auipc	ra,0x0
    802010bc:	f10080e7          	jalr	-240(ra) # 80200fc8 <uvmdealloc>
      return 0;
    802010c0:	4501                	li	a0,0
}
    802010c2:	70e2                	ld	ra,56(sp)
    802010c4:	7442                	ld	s0,48(sp)
    802010c6:	74a2                	ld	s1,40(sp)
    802010c8:	7902                	ld	s2,32(sp)
    802010ca:	69e2                	ld	s3,24(sp)
    802010cc:	6a42                	ld	s4,16(sp)
    802010ce:	6aa2                	ld	s5,8(sp)
    802010d0:	6b02                	ld	s6,0(sp)
    802010d2:	6121                	addi	sp,sp,64
    802010d4:	8082                	ret
      kfree(mem);
    802010d6:	8526                	mv	a0,s1
    802010d8:	fffff097          	auipc	ra,0xfffff
    802010dc:	36c080e7          	jalr	876(ra) # 80200444 <kfree>
      uvmdealloc(pagetable, kpagetable, a, oldsz);
    802010e0:	86ce                	mv	a3,s3
    802010e2:	864a                	mv	a2,s2
    802010e4:	85d6                	mv	a1,s5
    802010e6:	8552                	mv	a0,s4
    802010e8:	00000097          	auipc	ra,0x0
    802010ec:	ee0080e7          	jalr	-288(ra) # 80200fc8 <uvmdealloc>
      return 0;
    802010f0:	4501                	li	a0,0
    802010f2:	bfc1                	j	802010c2 <uvmalloc+0x8e>
      int npages = (a - oldsz) / PGSIZE;
    802010f4:	41390633          	sub	a2,s2,s3
    802010f8:	8231                	srli	a2,a2,0xc
    802010fa:	0006049b          	sext.w	s1,a2
      vmunmap(pagetable, oldsz, npages + 1, 1);   // plus the page allocated above.
    802010fe:	4685                	li	a3,1
    80201100:	2605                	addiw	a2,a2,1
    80201102:	85ce                	mv	a1,s3
    80201104:	8552                	mv	a0,s4
    80201106:	00000097          	auipc	ra,0x0
    8020110a:	d46080e7          	jalr	-698(ra) # 80200e4c <vmunmap>
      vmunmap(kpagetable, oldsz, npages, 0);
    8020110e:	4681                	li	a3,0
    80201110:	8626                	mv	a2,s1
    80201112:	85ce                	mv	a1,s3
    80201114:	8556                	mv	a0,s5
    80201116:	00000097          	auipc	ra,0x0
    8020111a:	d36080e7          	jalr	-714(ra) # 80200e4c <vmunmap>
      return 0;
    8020111e:	4501                	li	a0,0
    80201120:	b74d                	j	802010c2 <uvmalloc+0x8e>
    return oldsz;
    80201122:	8532                	mv	a0,a2
}
    80201124:	8082                	ret
  return newsz;
    80201126:	8536                	mv	a0,a3
    80201128:	bf69                	j	802010c2 <uvmalloc+0x8e>

000000008020112a <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    8020112a:	7179                	addi	sp,sp,-48
    8020112c:	f406                	sd	ra,40(sp)
    8020112e:	f022                	sd	s0,32(sp)
    80201130:	ec26                	sd	s1,24(sp)
    80201132:	e84a                	sd	s2,16(sp)
    80201134:	e44e                	sd	s3,8(sp)
    80201136:	e052                	sd	s4,0(sp)
    80201138:	1800                	addi	s0,sp,48
    8020113a:	8a2a                	mv	s4,a0
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    8020113c:	84aa                	mv	s1,a0
    8020113e:	6905                	lui	s2,0x1
    80201140:	992a                	add	s2,s2,a0
    pte_t pte = pagetable[i];
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    80201142:	4985                	li	s3,1
    80201144:	a821                	j	8020115c <freewalk+0x32>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    80201146:	8129                	srli	a0,a0,0xa
      freewalk((pagetable_t)child);
    80201148:	0532                	slli	a0,a0,0xc
    8020114a:	00000097          	auipc	ra,0x0
    8020114e:	fe0080e7          	jalr	-32(ra) # 8020112a <freewalk>
      pagetable[i] = 0;
    80201152:	0004b023          	sd	zero,0(s1)
  for(int i = 0; i < 512; i++){
    80201156:	04a1                	addi	s1,s1,8
    80201158:	03248163          	beq	s1,s2,8020117a <freewalk+0x50>
    pte_t pte = pagetable[i];
    8020115c:	6088                	ld	a0,0(s1)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    8020115e:	00f57793          	andi	a5,a0,15
    80201162:	ff3782e3          	beq	a5,s3,80201146 <freewalk+0x1c>
    } else if(pte & PTE_V){
    80201166:	8905                	andi	a0,a0,1
    80201168:	d57d                	beqz	a0,80201156 <freewalk+0x2c>
      panic("freewalk: leaf");
    8020116a:	00009517          	auipc	a0,0x9
    8020116e:	33650513          	addi	a0,a0,822 # 8020a4a0 <digits+0x120>
    80201172:	fffff097          	auipc	ra,0xfffff
    80201176:	fd0080e7          	jalr	-48(ra) # 80200142 <panic>
    }
  }
  kfree((void*)pagetable);
    8020117a:	8552                	mv	a0,s4
    8020117c:	fffff097          	auipc	ra,0xfffff
    80201180:	2c8080e7          	jalr	712(ra) # 80200444 <kfree>
}
    80201184:	70a2                	ld	ra,40(sp)
    80201186:	7402                	ld	s0,32(sp)
    80201188:	64e2                	ld	s1,24(sp)
    8020118a:	6942                	ld	s2,16(sp)
    8020118c:	69a2                	ld	s3,8(sp)
    8020118e:	6a02                	ld	s4,0(sp)
    80201190:	6145                	addi	sp,sp,48
    80201192:	8082                	ret

0000000080201194 <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    80201194:	1101                	addi	sp,sp,-32
    80201196:	ec06                	sd	ra,24(sp)
    80201198:	e822                	sd	s0,16(sp)
    8020119a:	e426                	sd	s1,8(sp)
    8020119c:	1000                	addi	s0,sp,32
    8020119e:	84aa                	mv	s1,a0
  if(sz > 0)
    802011a0:	e999                	bnez	a1,802011b6 <uvmfree+0x22>
    vmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
  freewalk(pagetable);
    802011a2:	8526                	mv	a0,s1
    802011a4:	00000097          	auipc	ra,0x0
    802011a8:	f86080e7          	jalr	-122(ra) # 8020112a <freewalk>
}
    802011ac:	60e2                	ld	ra,24(sp)
    802011ae:	6442                	ld	s0,16(sp)
    802011b0:	64a2                	ld	s1,8(sp)
    802011b2:	6105                	addi	sp,sp,32
    802011b4:	8082                	ret
    vmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    802011b6:	6605                	lui	a2,0x1
    802011b8:	167d                	addi	a2,a2,-1
    802011ba:	962e                	add	a2,a2,a1
    802011bc:	4685                	li	a3,1
    802011be:	8231                	srli	a2,a2,0xc
    802011c0:	4581                	li	a1,0
    802011c2:	00000097          	auipc	ra,0x0
    802011c6:	c8a080e7          	jalr	-886(ra) # 80200e4c <vmunmap>
    802011ca:	bfe1                	j	802011a2 <uvmfree+0xe>

00000000802011cc <uvmcopy>:
  pte_t *pte;
  uint64 pa, i = 0, ki = 0;
  uint flags;
  char *mem;

  while (i < sz){
    802011cc:	10068563          	beqz	a3,802012d6 <uvmcopy+0x10a>
{
    802011d0:	715d                	addi	sp,sp,-80
    802011d2:	e486                	sd	ra,72(sp)
    802011d4:	e0a2                	sd	s0,64(sp)
    802011d6:	fc26                	sd	s1,56(sp)
    802011d8:	f84a                	sd	s2,48(sp)
    802011da:	f44e                	sd	s3,40(sp)
    802011dc:	f052                	sd	s4,32(sp)
    802011de:	ec56                	sd	s5,24(sp)
    802011e0:	e85a                	sd	s6,16(sp)
    802011e2:	e45e                	sd	s7,8(sp)
    802011e4:	e062                	sd	s8,0(sp)
    802011e6:	0880                	addi	s0,sp,80
    802011e8:	8baa                	mv	s7,a0
    802011ea:	8a2e                	mv	s4,a1
    802011ec:	8b32                	mv	s6,a2
    802011ee:	8ab6                	mv	s5,a3
  uint64 pa, i = 0, ki = 0;
    802011f0:	4981                	li	s3,0
    802011f2:	a011                	j	802011f6 <uvmcopy+0x2a>
    memmove(mem, (char*)pa, PGSIZE);
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0) {
      kfree(mem);
      goto err;
    }
    i += PGSIZE;
    802011f4:	89e2                	mv	s3,s8
    if((pte = walk(old, i, 0)) == NULL)
    802011f6:	4601                	li	a2,0
    802011f8:	85ce                	mv	a1,s3
    802011fa:	855e                	mv	a0,s7
    802011fc:	00000097          	auipc	ra,0x0
    80201200:	936080e7          	jalr	-1738(ra) # 80200b32 <walk>
    80201204:	c135                	beqz	a0,80201268 <uvmcopy+0x9c>
    if((*pte & PTE_V) == 0)
    80201206:	6118                	ld	a4,0(a0)
    80201208:	00177793          	andi	a5,a4,1
    8020120c:	c7b5                	beqz	a5,80201278 <uvmcopy+0xac>
    pa = PTE2PA(*pte);
    8020120e:	00a75593          	srli	a1,a4,0xa
    80201212:	00c59c13          	slli	s8,a1,0xc
    flags = PTE_FLAGS(*pte);
    80201216:	3ff77493          	andi	s1,a4,1023
    if((mem = kalloc()) == NULL)
    8020121a:	fffff097          	auipc	ra,0xfffff
    8020121e:	342080e7          	jalr	834(ra) # 8020055c <kalloc>
    80201222:	892a                	mv	s2,a0
    80201224:	c92d                	beqz	a0,80201296 <uvmcopy+0xca>
    memmove(mem, (char*)pa, PGSIZE);
    80201226:	6605                	lui	a2,0x1
    80201228:	85e2                	mv	a1,s8
    8020122a:	fffff097          	auipc	ra,0xfffff
    8020122e:	59a080e7          	jalr	1434(ra) # 802007c4 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0) {
    80201232:	2481                	sext.w	s1,s1
    80201234:	8726                	mv	a4,s1
    80201236:	86ca                	mv	a3,s2
    80201238:	6605                	lui	a2,0x1
    8020123a:	85ce                	mv	a1,s3
    8020123c:	8552                	mv	a0,s4
    8020123e:	00000097          	auipc	ra,0x0
    80201242:	a54080e7          	jalr	-1452(ra) # 80200c92 <mappages>
    80201246:	e129                	bnez	a0,80201288 <uvmcopy+0xbc>
    i += PGSIZE;
    80201248:	6c05                	lui	s8,0x1
    8020124a:	9c4e                	add	s8,s8,s3
    if(mappages(knew, ki, PGSIZE, (uint64)mem, flags & ~PTE_U) != 0){
    8020124c:	3ef4f713          	andi	a4,s1,1007
    80201250:	86ca                	mv	a3,s2
    80201252:	6605                	lui	a2,0x1
    80201254:	85ce                	mv	a1,s3
    80201256:	855a                	mv	a0,s6
    80201258:	00000097          	auipc	ra,0x0
    8020125c:	a3a080e7          	jalr	-1478(ra) # 80200c92 <mappages>
    80201260:	ed05                	bnez	a0,80201298 <uvmcopy+0xcc>
  while (i < sz){
    80201262:	f95c69e3          	bltu	s8,s5,802011f4 <uvmcopy+0x28>
    80201266:	a8a1                	j	802012be <uvmcopy+0xf2>
      panic("uvmcopy: pte should exist");
    80201268:	00009517          	auipc	a0,0x9
    8020126c:	24850513          	addi	a0,a0,584 # 8020a4b0 <digits+0x130>
    80201270:	fffff097          	auipc	ra,0xfffff
    80201274:	ed2080e7          	jalr	-302(ra) # 80200142 <panic>
      panic("uvmcopy: page not present");
    80201278:	00009517          	auipc	a0,0x9
    8020127c:	25850513          	addi	a0,a0,600 # 8020a4d0 <digits+0x150>
    80201280:	fffff097          	auipc	ra,0xfffff
    80201284:	ec2080e7          	jalr	-318(ra) # 80200142 <panic>
      kfree(mem);
    80201288:	854a                	mv	a0,s2
    8020128a:	fffff097          	auipc	ra,0xfffff
    8020128e:	1ba080e7          	jalr	442(ra) # 80200444 <kfree>
      goto err;
    80201292:	8c4e                	mv	s8,s3
    80201294:	a011                	j	80201298 <uvmcopy+0xcc>
    80201296:	8c4e                	mv	s8,s3
    ki += PGSIZE;
  }
  return 0;

 err:
  vmunmap(knew, 0, ki / PGSIZE, 0);
    80201298:	4681                	li	a3,0
    8020129a:	00c9d613          	srli	a2,s3,0xc
    8020129e:	4581                	li	a1,0
    802012a0:	855a                	mv	a0,s6
    802012a2:	00000097          	auipc	ra,0x0
    802012a6:	baa080e7          	jalr	-1110(ra) # 80200e4c <vmunmap>
  vmunmap(new, 0, i / PGSIZE, 1);
    802012aa:	4685                	li	a3,1
    802012ac:	00cc5613          	srli	a2,s8,0xc
    802012b0:	4581                	li	a1,0
    802012b2:	8552                	mv	a0,s4
    802012b4:	00000097          	auipc	ra,0x0
    802012b8:	b98080e7          	jalr	-1128(ra) # 80200e4c <vmunmap>
  return -1;
    802012bc:	557d                	li	a0,-1
}
    802012be:	60a6                	ld	ra,72(sp)
    802012c0:	6406                	ld	s0,64(sp)
    802012c2:	74e2                	ld	s1,56(sp)
    802012c4:	7942                	ld	s2,48(sp)
    802012c6:	79a2                	ld	s3,40(sp)
    802012c8:	7a02                	ld	s4,32(sp)
    802012ca:	6ae2                	ld	s5,24(sp)
    802012cc:	6b42                	ld	s6,16(sp)
    802012ce:	6ba2                	ld	s7,8(sp)
    802012d0:	6c02                	ld	s8,0(sp)
    802012d2:	6161                	addi	sp,sp,80
    802012d4:	8082                	ret
  return 0;
    802012d6:	4501                	li	a0,0
}
    802012d8:	8082                	ret

00000000802012da <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    802012da:	1141                	addi	sp,sp,-16
    802012dc:	e406                	sd	ra,8(sp)
    802012de:	e022                	sd	s0,0(sp)
    802012e0:	0800                	addi	s0,sp,16
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    802012e2:	4601                	li	a2,0
    802012e4:	00000097          	auipc	ra,0x0
    802012e8:	84e080e7          	jalr	-1970(ra) # 80200b32 <walk>
  if(pte == NULL)
    802012ec:	c901                	beqz	a0,802012fc <uvmclear+0x22>
    panic("uvmclear");
  *pte &= ~PTE_U;
    802012ee:	611c                	ld	a5,0(a0)
    802012f0:	9bbd                	andi	a5,a5,-17
    802012f2:	e11c                	sd	a5,0(a0)
}
    802012f4:	60a2                	ld	ra,8(sp)
    802012f6:	6402                	ld	s0,0(sp)
    802012f8:	0141                	addi	sp,sp,16
    802012fa:	8082                	ret
    panic("uvmclear");
    802012fc:	00009517          	auipc	a0,0x9
    80201300:	1f450513          	addi	a0,a0,500 # 8020a4f0 <digits+0x170>
    80201304:	fffff097          	auipc	ra,0xfffff
    80201308:	e3e080e7          	jalr	-450(ra) # 80200142 <panic>

000000008020130c <copyout>:
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
  uint64 n, va0, pa0;

  while(len > 0){
    8020130c:	c6bd                	beqz	a3,8020137a <copyout+0x6e>
{
    8020130e:	715d                	addi	sp,sp,-80
    80201310:	e486                	sd	ra,72(sp)
    80201312:	e0a2                	sd	s0,64(sp)
    80201314:	fc26                	sd	s1,56(sp)
    80201316:	f84a                	sd	s2,48(sp)
    80201318:	f44e                	sd	s3,40(sp)
    8020131a:	f052                	sd	s4,32(sp)
    8020131c:	ec56                	sd	s5,24(sp)
    8020131e:	e85a                	sd	s6,16(sp)
    80201320:	e45e                	sd	s7,8(sp)
    80201322:	e062                	sd	s8,0(sp)
    80201324:	0880                	addi	s0,sp,80
    80201326:	8b2a                	mv	s6,a0
    80201328:	8c2e                	mv	s8,a1
    8020132a:	8a32                	mv	s4,a2
    8020132c:	89b6                	mv	s3,a3
    va0 = PGROUNDDOWN(dstva);
    8020132e:	7bfd                	lui	s7,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (dstva - va0);
    80201330:	6a85                	lui	s5,0x1
    80201332:	a015                	j	80201356 <copyout+0x4a>
    if(n > len)
      n = len;
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    80201334:	9562                	add	a0,a0,s8
    80201336:	0004861b          	sext.w	a2,s1
    8020133a:	85d2                	mv	a1,s4
    8020133c:	41250533          	sub	a0,a0,s2
    80201340:	fffff097          	auipc	ra,0xfffff
    80201344:	484080e7          	jalr	1156(ra) # 802007c4 <memmove>

    len -= n;
    80201348:	409989b3          	sub	s3,s3,s1
    src += n;
    8020134c:	9a26                	add	s4,s4,s1
    dstva = va0 + PGSIZE;
    8020134e:	01590c33          	add	s8,s2,s5
  while(len > 0){
    80201352:	02098263          	beqz	s3,80201376 <copyout+0x6a>
    va0 = PGROUNDDOWN(dstva);
    80201356:	017c7933          	and	s2,s8,s7
    pa0 = walkaddr(pagetable, va0);
    8020135a:	85ca                	mv	a1,s2
    8020135c:	855a                	mv	a0,s6
    8020135e:	00000097          	auipc	ra,0x0
    80201362:	87a080e7          	jalr	-1926(ra) # 80200bd8 <walkaddr>
    if(pa0 == NULL)
    80201366:	cd01                	beqz	a0,8020137e <copyout+0x72>
    n = PGSIZE - (dstva - va0);
    80201368:	418904b3          	sub	s1,s2,s8
    8020136c:	94d6                	add	s1,s1,s5
    if(n > len)
    8020136e:	fc99f3e3          	bgeu	s3,s1,80201334 <copyout+0x28>
    80201372:	84ce                	mv	s1,s3
    80201374:	b7c1                	j	80201334 <copyout+0x28>
  }
  return 0;
    80201376:	4501                	li	a0,0
    80201378:	a021                	j	80201380 <copyout+0x74>
    8020137a:	4501                	li	a0,0
}
    8020137c:	8082                	ret
      return -1;
    8020137e:	557d                	li	a0,-1
}
    80201380:	60a6                	ld	ra,72(sp)
    80201382:	6406                	ld	s0,64(sp)
    80201384:	74e2                	ld	s1,56(sp)
    80201386:	7942                	ld	s2,48(sp)
    80201388:	79a2                	ld	s3,40(sp)
    8020138a:	7a02                	ld	s4,32(sp)
    8020138c:	6ae2                	ld	s5,24(sp)
    8020138e:	6b42                	ld	s6,16(sp)
    80201390:	6ba2                	ld	s7,8(sp)
    80201392:	6c02                	ld	s8,0(sp)
    80201394:	6161                	addi	sp,sp,80
    80201396:	8082                	ret

0000000080201398 <copyout2>:

int
copyout2(uint64 dstva, char *src, uint64 len)
{
    80201398:	7179                	addi	sp,sp,-48
    8020139a:	f406                	sd	ra,40(sp)
    8020139c:	f022                	sd	s0,32(sp)
    8020139e:	ec26                	sd	s1,24(sp)
    802013a0:	e84a                	sd	s2,16(sp)
    802013a2:	e44e                	sd	s3,8(sp)
    802013a4:	1800                	addi	s0,sp,48
    802013a6:	84aa                	mv	s1,a0
    802013a8:	89ae                	mv	s3,a1
    802013aa:	8932                	mv	s2,a2
  uint64 sz = myproc()->sz;
    802013ac:	00000097          	auipc	ra,0x0
    802013b0:	6c8080e7          	jalr	1736(ra) # 80201a74 <myproc>
    802013b4:	653c                	ld	a5,72(a0)
  if (dstva + len > sz || dstva >= sz) {
    802013b6:	01248733          	add	a4,s1,s2
    802013ba:	02e7e463          	bltu	a5,a4,802013e2 <copyout2+0x4a>
    802013be:	02f4f463          	bgeu	s1,a5,802013e6 <copyout2+0x4e>
    return -1;
  }
  memmove((void *)dstva, src, len);
    802013c2:	0009061b          	sext.w	a2,s2
    802013c6:	85ce                	mv	a1,s3
    802013c8:	8526                	mv	a0,s1
    802013ca:	fffff097          	auipc	ra,0xfffff
    802013ce:	3fa080e7          	jalr	1018(ra) # 802007c4 <memmove>
  return 0;
    802013d2:	4501                	li	a0,0
}
    802013d4:	70a2                	ld	ra,40(sp)
    802013d6:	7402                	ld	s0,32(sp)
    802013d8:	64e2                	ld	s1,24(sp)
    802013da:	6942                	ld	s2,16(sp)
    802013dc:	69a2                	ld	s3,8(sp)
    802013de:	6145                	addi	sp,sp,48
    802013e0:	8082                	ret
    return -1;
    802013e2:	557d                	li	a0,-1
    802013e4:	bfc5                	j	802013d4 <copyout2+0x3c>
    802013e6:	557d                	li	a0,-1
    802013e8:	b7f5                	j	802013d4 <copyout2+0x3c>

00000000802013ea <copyin>:
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
  uint64 n, va0, pa0;

  while(len > 0){
    802013ea:	c6bd                	beqz	a3,80201458 <copyin+0x6e>
{
    802013ec:	715d                	addi	sp,sp,-80
    802013ee:	e486                	sd	ra,72(sp)
    802013f0:	e0a2                	sd	s0,64(sp)
    802013f2:	fc26                	sd	s1,56(sp)
    802013f4:	f84a                	sd	s2,48(sp)
    802013f6:	f44e                	sd	s3,40(sp)
    802013f8:	f052                	sd	s4,32(sp)
    802013fa:	ec56                	sd	s5,24(sp)
    802013fc:	e85a                	sd	s6,16(sp)
    802013fe:	e45e                	sd	s7,8(sp)
    80201400:	e062                	sd	s8,0(sp)
    80201402:	0880                	addi	s0,sp,80
    80201404:	8b2a                	mv	s6,a0
    80201406:	8a2e                	mv	s4,a1
    80201408:	8c32                	mv	s8,a2
    8020140a:	89b6                	mv	s3,a3
    va0 = PGROUNDDOWN(srcva);
    8020140c:	7bfd                	lui	s7,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (srcva - va0);
    8020140e:	6a85                	lui	s5,0x1
    80201410:	a015                	j	80201434 <copyin+0x4a>
    if(n > len)
      n = len;
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    80201412:	9562                	add	a0,a0,s8
    80201414:	0004861b          	sext.w	a2,s1
    80201418:	412505b3          	sub	a1,a0,s2
    8020141c:	8552                	mv	a0,s4
    8020141e:	fffff097          	auipc	ra,0xfffff
    80201422:	3a6080e7          	jalr	934(ra) # 802007c4 <memmove>

    len -= n;
    80201426:	409989b3          	sub	s3,s3,s1
    dst += n;
    8020142a:	9a26                	add	s4,s4,s1
    srcva = va0 + PGSIZE;
    8020142c:	01590c33          	add	s8,s2,s5
  while(len > 0){
    80201430:	02098263          	beqz	s3,80201454 <copyin+0x6a>
    va0 = PGROUNDDOWN(srcva);
    80201434:	017c7933          	and	s2,s8,s7
    pa0 = walkaddr(pagetable, va0);
    80201438:	85ca                	mv	a1,s2
    8020143a:	855a                	mv	a0,s6
    8020143c:	fffff097          	auipc	ra,0xfffff
    80201440:	79c080e7          	jalr	1948(ra) # 80200bd8 <walkaddr>
    if(pa0 == NULL)
    80201444:	cd01                	beqz	a0,8020145c <copyin+0x72>
    n = PGSIZE - (srcva - va0);
    80201446:	418904b3          	sub	s1,s2,s8
    8020144a:	94d6                	add	s1,s1,s5
    if(n > len)
    8020144c:	fc99f3e3          	bgeu	s3,s1,80201412 <copyin+0x28>
    80201450:	84ce                	mv	s1,s3
    80201452:	b7c1                	j	80201412 <copyin+0x28>
  }
  return 0;
    80201454:	4501                	li	a0,0
    80201456:	a021                	j	8020145e <copyin+0x74>
    80201458:	4501                	li	a0,0
}
    8020145a:	8082                	ret
      return -1;
    8020145c:	557d                	li	a0,-1
}
    8020145e:	60a6                	ld	ra,72(sp)
    80201460:	6406                	ld	s0,64(sp)
    80201462:	74e2                	ld	s1,56(sp)
    80201464:	7942                	ld	s2,48(sp)
    80201466:	79a2                	ld	s3,40(sp)
    80201468:	7a02                	ld	s4,32(sp)
    8020146a:	6ae2                	ld	s5,24(sp)
    8020146c:	6b42                	ld	s6,16(sp)
    8020146e:	6ba2                	ld	s7,8(sp)
    80201470:	6c02                	ld	s8,0(sp)
    80201472:	6161                	addi	sp,sp,80
    80201474:	8082                	ret

0000000080201476 <copyin2>:

int
copyin2(char *dst, uint64 srcva, uint64 len)
{
    80201476:	7179                	addi	sp,sp,-48
    80201478:	f406                	sd	ra,40(sp)
    8020147a:	f022                	sd	s0,32(sp)
    8020147c:	ec26                	sd	s1,24(sp)
    8020147e:	e84a                	sd	s2,16(sp)
    80201480:	e44e                	sd	s3,8(sp)
    80201482:	1800                	addi	s0,sp,48
    80201484:	89aa                	mv	s3,a0
    80201486:	84ae                	mv	s1,a1
    80201488:	8932                	mv	s2,a2
  uint64 sz = myproc()->sz;
    8020148a:	00000097          	auipc	ra,0x0
    8020148e:	5ea080e7          	jalr	1514(ra) # 80201a74 <myproc>
    80201492:	653c                	ld	a5,72(a0)
  if (srcva + len > sz || srcva >= sz) {
    80201494:	01248733          	add	a4,s1,s2
    80201498:	02e7e463          	bltu	a5,a4,802014c0 <copyin2+0x4a>
    8020149c:	02f4f463          	bgeu	s1,a5,802014c4 <copyin2+0x4e>
    return -1;
  }
  memmove(dst, (void *)srcva, len);
    802014a0:	0009061b          	sext.w	a2,s2
    802014a4:	85a6                	mv	a1,s1
    802014a6:	854e                	mv	a0,s3
    802014a8:	fffff097          	auipc	ra,0xfffff
    802014ac:	31c080e7          	jalr	796(ra) # 802007c4 <memmove>
  return 0;
    802014b0:	4501                	li	a0,0
}
    802014b2:	70a2                	ld	ra,40(sp)
    802014b4:	7402                	ld	s0,32(sp)
    802014b6:	64e2                	ld	s1,24(sp)
    802014b8:	6942                	ld	s2,16(sp)
    802014ba:	69a2                	ld	s3,8(sp)
    802014bc:	6145                	addi	sp,sp,48
    802014be:	8082                	ret
    return -1;
    802014c0:	557d                	li	a0,-1
    802014c2:	bfc5                	j	802014b2 <copyin2+0x3c>
    802014c4:	557d                	li	a0,-1
    802014c6:	b7f5                	j	802014b2 <copyin2+0x3c>

00000000802014c8 <copyinstr>:
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
  uint64 n, va0, pa0;
  int got_null = 0;

  while(got_null == 0 && max > 0){
    802014c8:	c6c5                	beqz	a3,80201570 <copyinstr+0xa8>
{
    802014ca:	715d                	addi	sp,sp,-80
    802014cc:	e486                	sd	ra,72(sp)
    802014ce:	e0a2                	sd	s0,64(sp)
    802014d0:	fc26                	sd	s1,56(sp)
    802014d2:	f84a                	sd	s2,48(sp)
    802014d4:	f44e                	sd	s3,40(sp)
    802014d6:	f052                	sd	s4,32(sp)
    802014d8:	ec56                	sd	s5,24(sp)
    802014da:	e85a                	sd	s6,16(sp)
    802014dc:	e45e                	sd	s7,8(sp)
    802014de:	0880                	addi	s0,sp,80
    802014e0:	8a2a                	mv	s4,a0
    802014e2:	8b2e                	mv	s6,a1
    802014e4:	8bb2                	mv	s7,a2
    802014e6:	84b6                	mv	s1,a3
    va0 = PGROUNDDOWN(srcva);
    802014e8:	7afd                	lui	s5,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (srcva - va0);
    802014ea:	6985                	lui	s3,0x1
    802014ec:	a035                	j	80201518 <copyinstr+0x50>
      n = max;

    char *p = (char *) (pa0 + (srcva - va0));
    while(n > 0){
      if(*p == '\0'){
        *dst = '\0';
    802014ee:	00078023          	sb	zero,0(a5) # 1000 <_entry-0x801ff000>
    802014f2:	4785                	li	a5,1
      dst++;
    }

    srcva = va0 + PGSIZE;
  }
  if(got_null){
    802014f4:	0017b793          	seqz	a5,a5
    802014f8:	40f00533          	neg	a0,a5
    return 0;
  } else {
    return -1;
  }
}
    802014fc:	60a6                	ld	ra,72(sp)
    802014fe:	6406                	ld	s0,64(sp)
    80201500:	74e2                	ld	s1,56(sp)
    80201502:	7942                	ld	s2,48(sp)
    80201504:	79a2                	ld	s3,40(sp)
    80201506:	7a02                	ld	s4,32(sp)
    80201508:	6ae2                	ld	s5,24(sp)
    8020150a:	6b42                	ld	s6,16(sp)
    8020150c:	6ba2                	ld	s7,8(sp)
    8020150e:	6161                	addi	sp,sp,80
    80201510:	8082                	ret
    srcva = va0 + PGSIZE;
    80201512:	01390bb3          	add	s7,s2,s3
  while(got_null == 0 && max > 0){
    80201516:	c8a9                	beqz	s1,80201568 <copyinstr+0xa0>
    va0 = PGROUNDDOWN(srcva);
    80201518:	015bf933          	and	s2,s7,s5
    pa0 = walkaddr(pagetable, va0);
    8020151c:	85ca                	mv	a1,s2
    8020151e:	8552                	mv	a0,s4
    80201520:	fffff097          	auipc	ra,0xfffff
    80201524:	6b8080e7          	jalr	1720(ra) # 80200bd8 <walkaddr>
    if(pa0 == NULL)
    80201528:	c131                	beqz	a0,8020156c <copyinstr+0xa4>
    n = PGSIZE - (srcva - va0);
    8020152a:	41790833          	sub	a6,s2,s7
    8020152e:	984e                	add	a6,a6,s3
    if(n > max)
    80201530:	0104f363          	bgeu	s1,a6,80201536 <copyinstr+0x6e>
    80201534:	8826                	mv	a6,s1
    char *p = (char *) (pa0 + (srcva - va0));
    80201536:	955e                	add	a0,a0,s7
    80201538:	41250533          	sub	a0,a0,s2
    while(n > 0){
    8020153c:	fc080be3          	beqz	a6,80201512 <copyinstr+0x4a>
    80201540:	985a                	add	a6,a6,s6
    80201542:	87da                	mv	a5,s6
      if(*p == '\0'){
    80201544:	41650633          	sub	a2,a0,s6
    80201548:	14fd                	addi	s1,s1,-1
    8020154a:	9b26                	add	s6,s6,s1
    8020154c:	00f60733          	add	a4,a2,a5
    80201550:	00074703          	lbu	a4,0(a4) # fffffffffffff000 <kernel_end+0xffffffff7fdca000>
    80201554:	df49                	beqz	a4,802014ee <copyinstr+0x26>
        *dst = *p;
    80201556:	00e78023          	sb	a4,0(a5)
      --max;
    8020155a:	40fb04b3          	sub	s1,s6,a5
      dst++;
    8020155e:	0785                	addi	a5,a5,1
    while(n > 0){
    80201560:	ff0796e3          	bne	a5,a6,8020154c <copyinstr+0x84>
      dst++;
    80201564:	8b42                	mv	s6,a6
    80201566:	b775                	j	80201512 <copyinstr+0x4a>
    80201568:	4781                	li	a5,0
    8020156a:	b769                	j	802014f4 <copyinstr+0x2c>
      return -1;
    8020156c:	557d                	li	a0,-1
    8020156e:	b779                	j	802014fc <copyinstr+0x34>
  int got_null = 0;
    80201570:	4781                	li	a5,0
  if(got_null){
    80201572:	0017b793          	seqz	a5,a5
    80201576:	40f00533          	neg	a0,a5
}
    8020157a:	8082                	ret

000000008020157c <copyinstr2>:

int
copyinstr2(char *dst, uint64 srcva, uint64 max)
{
    8020157c:	7179                	addi	sp,sp,-48
    8020157e:	f406                	sd	ra,40(sp)
    80201580:	f022                	sd	s0,32(sp)
    80201582:	ec26                	sd	s1,24(sp)
    80201584:	e84a                	sd	s2,16(sp)
    80201586:	e44e                	sd	s3,8(sp)
    80201588:	1800                	addi	s0,sp,48
    8020158a:	89aa                	mv	s3,a0
    8020158c:	84ae                	mv	s1,a1
    8020158e:	8932                	mv	s2,a2
  int got_null = 0;
  uint64 sz = myproc()->sz;
    80201590:	00000097          	auipc	ra,0x0
    80201594:	4e4080e7          	jalr	1252(ra) # 80201a74 <myproc>
    80201598:	6534                	ld	a3,72(a0)
  while(srcva < sz && max > 0){
    8020159a:	04d4f363          	bgeu	s1,a3,802015e0 <copyinstr2+0x64>
    8020159e:	04090363          	beqz	s2,802015e4 <copyinstr2+0x68>
    802015a2:	01298633          	add	a2,s3,s2
    802015a6:	8e85                	sub	a3,a3,s1
    802015a8:	96ce                	add	a3,a3,s3
    802015aa:	87ce                	mv	a5,s3
    char *p = (char *)srcva;
    if(*p == '\0'){
    802015ac:	413485b3          	sub	a1,s1,s3
    802015b0:	00b78733          	add	a4,a5,a1
    802015b4:	00074703          	lbu	a4,0(a4)
    802015b8:	cb11                	beqz	a4,802015cc <copyinstr2+0x50>
      *dst = '\0';
      got_null = 1;
      break;
    } else {
      *dst = *p;
    802015ba:	00e78023          	sb	a4,0(a5)
    }
    --max;
    srcva++;
    dst++;
    802015be:	0785                	addi	a5,a5,1
  while(srcva < sz && max > 0){
    802015c0:	02d78463          	beq	a5,a3,802015e8 <copyinstr2+0x6c>
    802015c4:	fec796e3          	bne	a5,a2,802015b0 <copyinstr2+0x34>
  }
  if(got_null){
    return 0;
  } else {
    return -1;
    802015c8:	557d                	li	a0,-1
    802015ca:	a021                	j	802015d2 <copyinstr2+0x56>
      *dst = '\0';
    802015cc:	00078023          	sb	zero,0(a5)
    return 0;
    802015d0:	4501                	li	a0,0
  }
}
    802015d2:	70a2                	ld	ra,40(sp)
    802015d4:	7402                	ld	s0,32(sp)
    802015d6:	64e2                	ld	s1,24(sp)
    802015d8:	6942                	ld	s2,16(sp)
    802015da:	69a2                	ld	s3,8(sp)
    802015dc:	6145                	addi	sp,sp,48
    802015de:	8082                	ret
    return -1;
    802015e0:	557d                	li	a0,-1
    802015e2:	bfc5                	j	802015d2 <copyinstr2+0x56>
    802015e4:	557d                	li	a0,-1
    802015e6:	b7f5                	j	802015d2 <copyinstr2+0x56>
    802015e8:	557d                	li	a0,-1
    802015ea:	b7e5                	j	802015d2 <copyinstr2+0x56>

00000000802015ec <kfreewalk>:
}

// only free page table, not physical pages
void
kfreewalk(pagetable_t kpt)
{
    802015ec:	7179                	addi	sp,sp,-48
    802015ee:	f406                	sd	ra,40(sp)
    802015f0:	f022                	sd	s0,32(sp)
    802015f2:	ec26                	sd	s1,24(sp)
    802015f4:	e84a                	sd	s2,16(sp)
    802015f6:	e44e                	sd	s3,8(sp)
    802015f8:	e052                	sd	s4,0(sp)
    802015fa:	1800                	addi	s0,sp,48
    802015fc:	8a2a                	mv	s4,a0
  for (int i = 0; i < 512; i++) {
    802015fe:	84aa                	mv	s1,a0
    80201600:	6905                	lui	s2,0x1
    80201602:	992a                	add	s2,s2,a0
    pte_t pte = kpt[i];
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    80201604:	4985                	li	s3,1
    80201606:	a829                	j	80201620 <kfreewalk+0x34>
      kfreewalk((pagetable_t) PTE2PA(pte));
    80201608:	83a9                	srli	a5,a5,0xa
    8020160a:	00c79513          	slli	a0,a5,0xc
    8020160e:	00000097          	auipc	ra,0x0
    80201612:	fde080e7          	jalr	-34(ra) # 802015ec <kfreewalk>
      kpt[i] = 0;
    80201616:	0004b023          	sd	zero,0(s1)
  for (int i = 0; i < 512; i++) {
    8020161a:	04a1                	addi	s1,s1,8
    8020161c:	01248963          	beq	s1,s2,8020162e <kfreewalk+0x42>
    pte_t pte = kpt[i];
    80201620:	609c                	ld	a5,0(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    80201622:	00f7f713          	andi	a4,a5,15
    80201626:	ff3701e3          	beq	a4,s3,80201608 <kfreewalk+0x1c>
    } else if (pte & PTE_V) {
    8020162a:	8b85                	andi	a5,a5,1
    8020162c:	d7fd                	beqz	a5,8020161a <kfreewalk+0x2e>
      break;
    }
  }
  kfree((void *) kpt);
    8020162e:	8552                	mv	a0,s4
    80201630:	fffff097          	auipc	ra,0xfffff
    80201634:	e14080e7          	jalr	-492(ra) # 80200444 <kfree>
}
    80201638:	70a2                	ld	ra,40(sp)
    8020163a:	7402                	ld	s0,32(sp)
    8020163c:	64e2                	ld	s1,24(sp)
    8020163e:	6942                	ld	s2,16(sp)
    80201640:	69a2                	ld	s3,8(sp)
    80201642:	6a02                	ld	s4,0(sp)
    80201644:	6145                	addi	sp,sp,48
    80201646:	8082                	ret

0000000080201648 <kvmfreeusr>:

void
kvmfreeusr(pagetable_t kpt)
{
    80201648:	1101                	addi	sp,sp,-32
    8020164a:	ec06                	sd	ra,24(sp)
    8020164c:	e822                	sd	s0,16(sp)
    8020164e:	e426                	sd	s1,8(sp)
    80201650:	1000                	addi	s0,sp,32
    80201652:	84aa                	mv	s1,a0
  pte_t pte;
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    pte = kpt[i];
    80201654:	6108                	ld	a0,0(a0)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    80201656:	00f57713          	andi	a4,a0,15
    8020165a:	4785                	li	a5,1
    8020165c:	00f70d63          	beq	a4,a5,80201676 <kvmfreeusr+0x2e>
    pte = kpt[i];
    80201660:	6488                	ld	a0,8(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    80201662:	00f57713          	andi	a4,a0,15
    80201666:	4785                	li	a5,1
    80201668:	02f70063          	beq	a4,a5,80201688 <kvmfreeusr+0x40>
      kfreewalk((pagetable_t) PTE2PA(pte));
      kpt[i] = 0;
    }
  }
}
    8020166c:	60e2                	ld	ra,24(sp)
    8020166e:	6442                	ld	s0,16(sp)
    80201670:	64a2                	ld	s1,8(sp)
    80201672:	6105                	addi	sp,sp,32
    80201674:	8082                	ret
      kfreewalk((pagetable_t) PTE2PA(pte));
    80201676:	8129                	srli	a0,a0,0xa
    80201678:	0532                	slli	a0,a0,0xc
    8020167a:	00000097          	auipc	ra,0x0
    8020167e:	f72080e7          	jalr	-142(ra) # 802015ec <kfreewalk>
      kpt[i] = 0;
    80201682:	0004b023          	sd	zero,0(s1)
    80201686:	bfe9                	j	80201660 <kvmfreeusr+0x18>
      kfreewalk((pagetable_t) PTE2PA(pte));
    80201688:	8129                	srli	a0,a0,0xa
    8020168a:	0532                	slli	a0,a0,0xc
    8020168c:	00000097          	auipc	ra,0x0
    80201690:	f60080e7          	jalr	-160(ra) # 802015ec <kfreewalk>
      kpt[i] = 0;
    80201694:	0004b423          	sd	zero,8(s1)
}
    80201698:	bfd1                	j	8020166c <kvmfreeusr+0x24>

000000008020169a <kvmfree>:

void
kvmfree(pagetable_t kpt, int stack_free)
{
    8020169a:	1101                	addi	sp,sp,-32
    8020169c:	ec06                	sd	ra,24(sp)
    8020169e:	e822                	sd	s0,16(sp)
    802016a0:	e426                	sd	s1,8(sp)
    802016a2:	1000                	addi	s0,sp,32
    802016a4:	84aa                	mv	s1,a0
  if (stack_free) {
    802016a6:	e185                	bnez	a1,802016c6 <kvmfree+0x2c>
    pte_t pte = kpt[PX(2, VKSTACK)];
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
      kfreewalk((pagetable_t) PTE2PA(pte));
    }
  }
  kvmfreeusr(kpt);
    802016a8:	8526                	mv	a0,s1
    802016aa:	00000097          	auipc	ra,0x0
    802016ae:	f9e080e7          	jalr	-98(ra) # 80201648 <kvmfreeusr>
  kfree(kpt);
    802016b2:	8526                	mv	a0,s1
    802016b4:	fffff097          	auipc	ra,0xfffff
    802016b8:	d90080e7          	jalr	-624(ra) # 80200444 <kfree>
}
    802016bc:	60e2                	ld	ra,24(sp)
    802016be:	6442                	ld	s0,16(sp)
    802016c0:	64a2                	ld	s1,8(sp)
    802016c2:	6105                	addi	sp,sp,32
    802016c4:	8082                	ret
    vmunmap(kpt, VKSTACK, 1, 1);
    802016c6:	4685                	li	a3,1
    802016c8:	4605                	li	a2,1
    802016ca:	0fb00593          	li	a1,251
    802016ce:	05fa                	slli	a1,a1,0x1e
    802016d0:	fffff097          	auipc	ra,0xfffff
    802016d4:	77c080e7          	jalr	1916(ra) # 80200e4c <vmunmap>
    pte_t pte = kpt[PX(2, VKSTACK)];
    802016d8:	7d84b503          	ld	a0,2008(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    802016dc:	00f57713          	andi	a4,a0,15
    802016e0:	4785                	li	a5,1
    802016e2:	fcf713e3          	bne	a4,a5,802016a8 <kvmfree+0xe>
      kfreewalk((pagetable_t) PTE2PA(pte));
    802016e6:	8129                	srli	a0,a0,0xa
    802016e8:	0532                	slli	a0,a0,0xc
    802016ea:	00000097          	auipc	ra,0x0
    802016ee:	f02080e7          	jalr	-254(ra) # 802015ec <kfreewalk>
    802016f2:	bf5d                	j	802016a8 <kvmfree+0xe>

00000000802016f4 <proc_kpagetable>:
{
    802016f4:	1101                	addi	sp,sp,-32
    802016f6:	ec06                	sd	ra,24(sp)
    802016f8:	e822                	sd	s0,16(sp)
    802016fa:	e426                	sd	s1,8(sp)
    802016fc:	1000                	addi	s0,sp,32
  pagetable_t kpt = (pagetable_t) kalloc();
    802016fe:	fffff097          	auipc	ra,0xfffff
    80201702:	e5e080e7          	jalr	-418(ra) # 8020055c <kalloc>
    80201706:	84aa                	mv	s1,a0
  if (kpt == NULL)
    80201708:	c91d                	beqz	a0,8020173e <proc_kpagetable+0x4a>
  memmove(kpt, kernel_pagetable, PGSIZE);
    8020170a:	6605                	lui	a2,0x1
    8020170c:	00015597          	auipc	a1,0x15
    80201710:	94c5b583          	ld	a1,-1716(a1) # 80216058 <kernel_pagetable>
    80201714:	fffff097          	auipc	ra,0xfffff
    80201718:	0b0080e7          	jalr	176(ra) # 802007c4 <memmove>
  char *pstack = kalloc();
    8020171c:	fffff097          	auipc	ra,0xfffff
    80201720:	e40080e7          	jalr	-448(ra) # 8020055c <kalloc>
    80201724:	86aa                	mv	a3,a0
  if(pstack == NULL)
    80201726:	c115                	beqz	a0,8020174a <proc_kpagetable+0x56>
  if (mappages(kpt, VKSTACK, PGSIZE, (uint64)pstack, PTE_R | PTE_W) != 0)
    80201728:	4719                	li	a4,6
    8020172a:	6605                	lui	a2,0x1
    8020172c:	0fb00593          	li	a1,251
    80201730:	05fa                	slli	a1,a1,0x1e
    80201732:	8526                	mv	a0,s1
    80201734:	fffff097          	auipc	ra,0xfffff
    80201738:	55e080e7          	jalr	1374(ra) # 80200c92 <mappages>
    8020173c:	e519                	bnez	a0,8020174a <proc_kpagetable+0x56>
}
    8020173e:	8526                	mv	a0,s1
    80201740:	60e2                	ld	ra,24(sp)
    80201742:	6442                	ld	s0,16(sp)
    80201744:	64a2                	ld	s1,8(sp)
    80201746:	6105                	addi	sp,sp,32
    80201748:	8082                	ret
  kvmfree(kpt, 1);
    8020174a:	4585                	li	a1,1
    8020174c:	8526                	mv	a0,s1
    8020174e:	00000097          	auipc	ra,0x0
    80201752:	f4c080e7          	jalr	-180(ra) # 8020169a <kvmfree>
  return NULL;
    80201756:	4481                	li	s1,0
    80201758:	b7dd                	j	8020173e <proc_kpagetable+0x4a>

000000008020175a <vmprint>:

void vmprint(pagetable_t pagetable)
{
    8020175a:	7119                	addi	sp,sp,-128
    8020175c:	fc86                	sd	ra,120(sp)
    8020175e:	f8a2                	sd	s0,112(sp)
    80201760:	f4a6                	sd	s1,104(sp)
    80201762:	f0ca                	sd	s2,96(sp)
    80201764:	ecce                	sd	s3,88(sp)
    80201766:	e8d2                	sd	s4,80(sp)
    80201768:	e4d6                	sd	s5,72(sp)
    8020176a:	e0da                	sd	s6,64(sp)
    8020176c:	fc5e                	sd	s7,56(sp)
    8020176e:	f862                	sd	s8,48(sp)
    80201770:	f466                	sd	s9,40(sp)
    80201772:	f06a                	sd	s10,32(sp)
    80201774:	ec6e                	sd	s11,24(sp)
    80201776:	0100                	addi	s0,sp,128
    80201778:	8baa                	mv	s7,a0
    8020177a:	f8a43023          	sd	a0,-128(s0)
  const int capacity = 512;
  printf("page table %p\n", pagetable);
    8020177e:	85aa                	mv	a1,a0
    80201780:	00009517          	auipc	a0,0x9
    80201784:	d8050513          	addi	a0,a0,-640 # 8020a500 <digits+0x180>
    80201788:	fffff097          	auipc	ra,0xfffff
    8020178c:	a04080e7          	jalr	-1532(ra) # 8020018c <printf>
  for (pte_t *pte = (pte_t *) pagetable; pte < pagetable + capacity; pte++) {
    80201790:	6d85                	lui	s11,0x1
    80201792:	9dde                	add	s11,s11,s7
    80201794:	6c05                	lui	s8,0x1

      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
        if (*pte2 & PTE_V)
        {
          pagetable_t pt3 = (pagetable_t) PTE2PA(*pte2);
          printf(".. ..%d: pte %p pa %p\n", pte2 - pt2, *pte2, pt3);
    80201796:	00009c97          	auipc	s9,0x9
    8020179a:	d92c8c93          	addi	s9,s9,-622 # 8020a528 <digits+0x1a8>
    8020179e:	20000793          	li	a5,512
    802017a2:	f8f43423          	sd	a5,-120(s0)

          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
            if (*pte3 & PTE_V)
              printf(".. .. ..%d: pte %p pa %p\n", pte3 - pt3, *pte3, PTE2PA(*pte3));
    802017a6:	00009a17          	auipc	s4,0x9
    802017aa:	d9aa0a13          	addi	s4,s4,-614 # 8020a540 <digits+0x1c0>
    802017ae:	a88d                	j	80201820 <vmprint+0xc6>
    802017b0:	00a65693          	srli	a3,a2,0xa
    802017b4:	413485b3          	sub	a1,s1,s3
    802017b8:	06b2                	slli	a3,a3,0xc
    802017ba:	858d                	srai	a1,a1,0x3
    802017bc:	8552                	mv	a0,s4
    802017be:	fffff097          	auipc	ra,0xfffff
    802017c2:	9ce080e7          	jalr	-1586(ra) # 8020018c <printf>
          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
    802017c6:	04a1                	addi	s1,s1,8
    802017c8:	01248763          	beq	s1,s2,802017d6 <vmprint+0x7c>
            if (*pte3 & PTE_V)
    802017cc:	6090                	ld	a2,0(s1)
    802017ce:	00167793          	andi	a5,a2,1
    802017d2:	dbf5                	beqz	a5,802017c6 <vmprint+0x6c>
    802017d4:	bff1                	j	802017b0 <vmprint+0x56>
      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
    802017d6:	0aa1                	addi	s5,s5,8
    802017d8:	056a8163          	beq	s5,s6,8020181a <vmprint+0xc0>
        if (*pte2 & PTE_V)
    802017dc:	000ab603          	ld	a2,0(s5) # fffffffffffff000 <kernel_end+0xffffffff7fdca000>
    802017e0:	00167793          	andi	a5,a2,1
    802017e4:	dbed                	beqz	a5,802017d6 <vmprint+0x7c>
          pagetable_t pt3 = (pagetable_t) PTE2PA(*pte2);
    802017e6:	00a65493          	srli	s1,a2,0xa
    802017ea:	04b2                	slli	s1,s1,0xc
    802017ec:	89a6                	mv	s3,s1
          printf(".. ..%d: pte %p pa %p\n", pte2 - pt2, *pte2, pt3);
    802017ee:	41aa85b3          	sub	a1,s5,s10
    802017f2:	86a6                	mv	a3,s1
    802017f4:	858d                	srai	a1,a1,0x3
    802017f6:	8566                	mv	a0,s9
    802017f8:	fffff097          	auipc	ra,0xfffff
    802017fc:	994080e7          	jalr	-1644(ra) # 8020018c <printf>
          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
    80201800:	00848693          	addi	a3,s1,8
    80201804:	01848733          	add	a4,s1,s8
    80201808:	f8843783          	ld	a5,-120(s0)
    8020180c:	00d77363          	bgeu	a4,a3,80201812 <vmprint+0xb8>
    80201810:	4785                	li	a5,1
    80201812:	078e                	slli	a5,a5,0x3
    80201814:	00978933          	add	s2,a5,s1
    80201818:	bf55                	j	802017cc <vmprint+0x72>
  for (pte_t *pte = (pte_t *) pagetable; pte < pagetable + capacity; pte++) {
    8020181a:	0ba1                	addi	s7,s7,8
    8020181c:	05bb8763          	beq	s7,s11,8020186a <vmprint+0x110>
    if (*pte & PTE_V)
    80201820:	000bb603          	ld	a2,0(s7) # fffffffffffff000 <kernel_end+0xffffffff7fdca000>
    80201824:	00167793          	andi	a5,a2,1
    80201828:	dbed                	beqz	a5,8020181a <vmprint+0xc0>
      pagetable_t pt2 = (pagetable_t) PTE2PA(*pte); 
    8020182a:	00a65a93          	srli	s5,a2,0xa
    8020182e:	0ab2                	slli	s5,s5,0xc
    80201830:	8d56                	mv	s10,s5
      printf("..%d: pte %p pa %p\n", pte - pagetable, *pte, pt2);
    80201832:	f8043783          	ld	a5,-128(s0)
    80201836:	40fb87b3          	sub	a5,s7,a5
    8020183a:	86d6                	mv	a3,s5
    8020183c:	4037d593          	srai	a1,a5,0x3
    80201840:	00009517          	auipc	a0,0x9
    80201844:	cd050513          	addi	a0,a0,-816 # 8020a510 <digits+0x190>
    80201848:	fffff097          	auipc	ra,0xfffff
    8020184c:	944080e7          	jalr	-1724(ra) # 8020018c <printf>
      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
    80201850:	018a86b3          	add	a3,s5,s8
    80201854:	008a8713          	addi	a4,s5,8
    80201858:	20000793          	li	a5,512
    8020185c:	00e6f363          	bgeu	a3,a4,80201862 <vmprint+0x108>
    80201860:	4785                	li	a5,1
    80201862:	078e                	slli	a5,a5,0x3
    80201864:	01578b33          	add	s6,a5,s5
    80201868:	bf95                	j	802017dc <vmprint+0x82>
        }
      }
    }
  }
  return;
}
    8020186a:	70e6                	ld	ra,120(sp)
    8020186c:	7446                	ld	s0,112(sp)
    8020186e:	74a6                	ld	s1,104(sp)
    80201870:	7906                	ld	s2,96(sp)
    80201872:	69e6                	ld	s3,88(sp)
    80201874:	6a46                	ld	s4,80(sp)
    80201876:	6aa6                	ld	s5,72(sp)
    80201878:	6b06                	ld	s6,64(sp)
    8020187a:	7be2                	ld	s7,56(sp)
    8020187c:	7c42                	ld	s8,48(sp)
    8020187e:	7ca2                	ld	s9,40(sp)
    80201880:	7d02                	ld	s10,32(sp)
    80201882:	6de2                	ld	s11,24(sp)
    80201884:	6109                	addi	sp,sp,128
    80201886:	8082                	ret

0000000080201888 <wakeup1>:

// Wake up p if it is sleeping in wait(); used by exit().
// Caller must hold p->lock.
static void
wakeup1(struct proc *p)
{
    80201888:	1101                	addi	sp,sp,-32
    8020188a:	ec06                	sd	ra,24(sp)
    8020188c:	e822                	sd	s0,16(sp)
    8020188e:	e426                	sd	s1,8(sp)
    80201890:	1000                	addi	s0,sp,32
    80201892:	84aa                	mv	s1,a0
  if (!holding(&p->lock))
    80201894:	fffff097          	auipc	ra,0xfffff
    80201898:	e06080e7          	jalr	-506(ra) # 8020069a <holding>
    8020189c:	c909                	beqz	a0,802018ae <wakeup1+0x26>
    panic("wakeup1");
  if (p->chan == p && p->state == SLEEPING)
    8020189e:	749c                	ld	a5,40(s1)
    802018a0:	00978f63          	beq	a5,s1,802018be <wakeup1+0x36>
  {
    p->state = RUNNABLE;
  }
}
    802018a4:	60e2                	ld	ra,24(sp)
    802018a6:	6442                	ld	s0,16(sp)
    802018a8:	64a2                	ld	s1,8(sp)
    802018aa:	6105                	addi	sp,sp,32
    802018ac:	8082                	ret
    panic("wakeup1");
    802018ae:	00009517          	auipc	a0,0x9
    802018b2:	cb250513          	addi	a0,a0,-846 # 8020a560 <digits+0x1e0>
    802018b6:	fffff097          	auipc	ra,0xfffff
    802018ba:	88c080e7          	jalr	-1908(ra) # 80200142 <panic>
  if (p->chan == p && p->state == SLEEPING)
    802018be:	4c98                	lw	a4,24(s1)
    802018c0:	4785                	li	a5,1
    802018c2:	fef711e3          	bne	a4,a5,802018a4 <wakeup1+0x1c>
    p->state = RUNNABLE;
    802018c6:	4789                	li	a5,2
    802018c8:	cc9c                	sw	a5,24(s1)
}
    802018ca:	bfe9                	j	802018a4 <wakeup1+0x1c>

00000000802018cc <reg_info>:
{
    802018cc:	1141                	addi	sp,sp,-16
    802018ce:	e406                	sd	ra,8(sp)
    802018d0:	e022                	sd	s0,0(sp)
    802018d2:	0800                	addi	s0,sp,16
  printf("register info: {\n");
    802018d4:	00009517          	auipc	a0,0x9
    802018d8:	c9450513          	addi	a0,a0,-876 # 8020a568 <digits+0x1e8>
    802018dc:	fffff097          	auipc	ra,0xfffff
    802018e0:	8b0080e7          	jalr	-1872(ra) # 8020018c <printf>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802018e4:	100025f3          	csrr	a1,sstatus
  printf("sstatus: %p\n", r_sstatus());
    802018e8:	00009517          	auipc	a0,0x9
    802018ec:	c9850513          	addi	a0,a0,-872 # 8020a580 <digits+0x200>
    802018f0:	fffff097          	auipc	ra,0xfffff
    802018f4:	89c080e7          	jalr	-1892(ra) # 8020018c <printf>
  asm volatile("csrr %0, sip" : "=r" (x) );
    802018f8:	144025f3          	csrr	a1,sip
  printf("sip: %p\n", r_sip());
    802018fc:	00009517          	auipc	a0,0x9
    80201900:	c9450513          	addi	a0,a0,-876 # 8020a590 <digits+0x210>
    80201904:	fffff097          	auipc	ra,0xfffff
    80201908:	888080e7          	jalr	-1912(ra) # 8020018c <printf>
  asm volatile("csrr %0, sie" : "=r" (x) );
    8020190c:	104025f3          	csrr	a1,sie
  printf("sie: %p\n", r_sie());
    80201910:	00009517          	auipc	a0,0x9
    80201914:	c9050513          	addi	a0,a0,-880 # 8020a5a0 <digits+0x220>
    80201918:	fffff097          	auipc	ra,0xfffff
    8020191c:	874080e7          	jalr	-1932(ra) # 8020018c <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80201920:	141025f3          	csrr	a1,sepc
  printf("sepc: %p\n", r_sepc());
    80201924:	00009517          	auipc	a0,0x9
    80201928:	c8c50513          	addi	a0,a0,-884 # 8020a5b0 <digits+0x230>
    8020192c:	fffff097          	auipc	ra,0xfffff
    80201930:	860080e7          	jalr	-1952(ra) # 8020018c <printf>
  asm volatile("csrr %0, stvec" : "=r" (x) );
    80201934:	105025f3          	csrr	a1,stvec
  printf("stvec: %p\n", r_stvec());
    80201938:	00009517          	auipc	a0,0x9
    8020193c:	c8850513          	addi	a0,a0,-888 # 8020a5c0 <digits+0x240>
    80201940:	fffff097          	auipc	ra,0xfffff
    80201944:	84c080e7          	jalr	-1972(ra) # 8020018c <printf>
  asm volatile("csrr %0, satp" : "=r" (x) );
    80201948:	180025f3          	csrr	a1,satp
  printf("satp: %p\n", r_satp());
    8020194c:	00009517          	auipc	a0,0x9
    80201950:	c8450513          	addi	a0,a0,-892 # 8020a5d0 <digits+0x250>
    80201954:	fffff097          	auipc	ra,0xfffff
    80201958:	838080e7          	jalr	-1992(ra) # 8020018c <printf>
  asm volatile("csrr %0, scause" : "=r" (x) );
    8020195c:	142025f3          	csrr	a1,scause
  printf("scause: %p\n", r_scause());
    80201960:	00009517          	auipc	a0,0x9
    80201964:	c8050513          	addi	a0,a0,-896 # 8020a5e0 <digits+0x260>
    80201968:	fffff097          	auipc	ra,0xfffff
    8020196c:	824080e7          	jalr	-2012(ra) # 8020018c <printf>
  asm volatile("csrr %0, stval" : "=r" (x) );
    80201970:	143025f3          	csrr	a1,stval
  printf("stval: %p\n", r_stval());
    80201974:	00009517          	auipc	a0,0x9
    80201978:	c7c50513          	addi	a0,a0,-900 # 8020a5f0 <digits+0x270>
    8020197c:	fffff097          	auipc	ra,0xfffff
    80201980:	810080e7          	jalr	-2032(ra) # 8020018c <printf>
  asm volatile("mv %0, sp" : "=r" (x) );
    80201984:	858a                	mv	a1,sp
  printf("sp: %p\n", r_sp());
    80201986:	00009517          	auipc	a0,0x9
    8020198a:	c7a50513          	addi	a0,a0,-902 # 8020a600 <digits+0x280>
    8020198e:	ffffe097          	auipc	ra,0xffffe
    80201992:	7fe080e7          	jalr	2046(ra) # 8020018c <printf>
  asm volatile("mv %0, tp" : "=r" (x) );
    80201996:	8592                	mv	a1,tp
  printf("tp: %p\n", r_tp());
    80201998:	00009517          	auipc	a0,0x9
    8020199c:	c7050513          	addi	a0,a0,-912 # 8020a608 <digits+0x288>
    802019a0:	ffffe097          	auipc	ra,0xffffe
    802019a4:	7ec080e7          	jalr	2028(ra) # 8020018c <printf>
  asm volatile("mv %0, ra" : "=r" (x) );
    802019a8:	8586                	mv	a1,ra
  printf("ra: %p\n", r_ra());
    802019aa:	00009517          	auipc	a0,0x9
    802019ae:	c6650513          	addi	a0,a0,-922 # 8020a610 <digits+0x290>
    802019b2:	ffffe097          	auipc	ra,0xffffe
    802019b6:	7da080e7          	jalr	2010(ra) # 8020018c <printf>
  printf("}\n");
    802019ba:	00009517          	auipc	a0,0x9
    802019be:	c5e50513          	addi	a0,a0,-930 # 8020a618 <digits+0x298>
    802019c2:	ffffe097          	auipc	ra,0xffffe
    802019c6:	7ca080e7          	jalr	1994(ra) # 8020018c <printf>
}
    802019ca:	60a2                	ld	ra,8(sp)
    802019cc:	6402                	ld	s0,0(sp)
    802019ce:	0141                	addi	sp,sp,16
    802019d0:	8082                	ret

00000000802019d2 <procinit>:
{
    802019d2:	7179                	addi	sp,sp,-48
    802019d4:	f406                	sd	ra,40(sp)
    802019d6:	f022                	sd	s0,32(sp)
    802019d8:	ec26                	sd	s1,24(sp)
    802019da:	e84a                	sd	s2,16(sp)
    802019dc:	e44e                	sd	s3,8(sp)
    802019de:	1800                	addi	s0,sp,48
  initlock(&pid_lock, "nextpid");
    802019e0:	00009597          	auipc	a1,0x9
    802019e4:	c4058593          	addi	a1,a1,-960 # 8020a620 <digits+0x2a0>
    802019e8:	00014517          	auipc	a0,0x14
    802019ec:	67850513          	addi	a0,a0,1656 # 80216060 <pid_lock>
    802019f0:	fffff097          	auipc	ra,0xfffff
    802019f4:	c94080e7          	jalr	-876(ra) # 80200684 <initlock>
  for (p = proc; p < &proc[NPROC]; p++)
    802019f8:	00014497          	auipc	s1,0x14
    802019fc:	78848493          	addi	s1,s1,1928 # 80216180 <proc>
    initlock(&p->lock, "proc");
    80201a00:	00009997          	auipc	s3,0x9
    80201a04:	c2898993          	addi	s3,s3,-984 # 8020a628 <digits+0x2a8>
  for (p = proc; p < &proc[NPROC]; p++)
    80201a08:	00024917          	auipc	s2,0x24
    80201a0c:	fe890913          	addi	s2,s2,-24 # 802259f0 <bcache>
    initlock(&p->lock, "proc");
    80201a10:	85ce                	mv	a1,s3
    80201a12:	8526                	mv	a0,s1
    80201a14:	fffff097          	auipc	ra,0xfffff
    80201a18:	c70080e7          	jalr	-912(ra) # 80200684 <initlock>
  for (p = proc; p < &proc[NPROC]; p++)
    80201a1c:	4f848493          	addi	s1,s1,1272
    80201a20:	ff2498e3          	bne	s1,s2,80201a10 <procinit+0x3e>
  memset(cpus, 0, sizeof(cpus));
    80201a24:	10000613          	li	a2,256
    80201a28:	4581                	li	a1,0
    80201a2a:	00014517          	auipc	a0,0x14
    80201a2e:	64e50513          	addi	a0,a0,1614 # 80216078 <cpus>
    80201a32:	fffff097          	auipc	ra,0xfffff
    80201a36:	d32080e7          	jalr	-718(ra) # 80200764 <memset>
}
    80201a3a:	70a2                	ld	ra,40(sp)
    80201a3c:	7402                	ld	s0,32(sp)
    80201a3e:	64e2                	ld	s1,24(sp)
    80201a40:	6942                	ld	s2,16(sp)
    80201a42:	69a2                	ld	s3,8(sp)
    80201a44:	6145                	addi	sp,sp,48
    80201a46:	8082                	ret

0000000080201a48 <cpuid>:
{
    80201a48:	1141                	addi	sp,sp,-16
    80201a4a:	e422                	sd	s0,8(sp)
    80201a4c:	0800                	addi	s0,sp,16
  asm volatile("mv %0, tp" : "=r" (x) );
    80201a4e:	8512                	mv	a0,tp
}
    80201a50:	2501                	sext.w	a0,a0
    80201a52:	6422                	ld	s0,8(sp)
    80201a54:	0141                	addi	sp,sp,16
    80201a56:	8082                	ret

0000000080201a58 <mycpu>:
{
    80201a58:	1141                	addi	sp,sp,-16
    80201a5a:	e422                	sd	s0,8(sp)
    80201a5c:	0800                	addi	s0,sp,16
    80201a5e:	8792                	mv	a5,tp
  struct cpu *c = &cpus[id];
    80201a60:	2781                	sext.w	a5,a5
    80201a62:	079e                	slli	a5,a5,0x7
}
    80201a64:	00014517          	auipc	a0,0x14
    80201a68:	61450513          	addi	a0,a0,1556 # 80216078 <cpus>
    80201a6c:	953e                	add	a0,a0,a5
    80201a6e:	6422                	ld	s0,8(sp)
    80201a70:	0141                	addi	sp,sp,16
    80201a72:	8082                	ret

0000000080201a74 <myproc>:
{
    80201a74:	1101                	addi	sp,sp,-32
    80201a76:	ec06                	sd	ra,24(sp)
    80201a78:	e822                	sd	s0,16(sp)
    80201a7a:	e426                	sd	s1,8(sp)
    80201a7c:	1000                	addi	s0,sp,32
  push_off();
    80201a7e:	fffff097          	auipc	ra,0xfffff
    80201a82:	b5a080e7          	jalr	-1190(ra) # 802005d8 <push_off>
    80201a86:	8792                	mv	a5,tp
  struct proc *p = c->proc;
    80201a88:	2781                	sext.w	a5,a5
    80201a8a:	079e                	slli	a5,a5,0x7
    80201a8c:	00014717          	auipc	a4,0x14
    80201a90:	5d470713          	addi	a4,a4,1492 # 80216060 <pid_lock>
    80201a94:	97ba                	add	a5,a5,a4
    80201a96:	6f84                	ld	s1,24(a5)
  pop_off();
    80201a98:	fffff097          	auipc	ra,0xfffff
    80201a9c:	b8c080e7          	jalr	-1140(ra) # 80200624 <pop_off>
}
    80201aa0:	8526                	mv	a0,s1
    80201aa2:	60e2                	ld	ra,24(sp)
    80201aa4:	6442                	ld	s0,16(sp)
    80201aa6:	64a2                	ld	s1,8(sp)
    80201aa8:	6105                	addi	sp,sp,32
    80201aaa:	8082                	ret

0000000080201aac <forkret>:
{
    80201aac:	1101                	addi	sp,sp,-32
    80201aae:	ec06                	sd	ra,24(sp)
    80201ab0:	e822                	sd	s0,16(sp)
    80201ab2:	e426                	sd	s1,8(sp)
    80201ab4:	1000                	addi	s0,sp,32
  release(&myproc()->lock);
    80201ab6:	00000097          	auipc	ra,0x0
    80201aba:	fbe080e7          	jalr	-66(ra) # 80201a74 <myproc>
    80201abe:	fffff097          	auipc	ra,0xfffff
    80201ac2:	c5e080e7          	jalr	-930(ra) # 8020071c <release>
  if (first)
    80201ac6:	00009797          	auipc	a5,0x9
    80201aca:	53a7a783          	lw	a5,1338(a5) # 8020b000 <first.1691>
    80201ace:	eb91                	bnez	a5,80201ae2 <forkret+0x36>
  usertrapret();
    80201ad0:	00001097          	auipc	ra,0x1
    80201ad4:	d9a080e7          	jalr	-614(ra) # 8020286a <usertrapret>
}
    80201ad8:	60e2                	ld	ra,24(sp)
    80201ada:	6442                	ld	s0,16(sp)
    80201adc:	64a2                	ld	s1,8(sp)
    80201ade:	6105                	addi	sp,sp,32
    80201ae0:	8082                	ret
    first = 0;
    80201ae2:	00009797          	auipc	a5,0x9
    80201ae6:	5007af23          	sw	zero,1310(a5) # 8020b000 <first.1691>
    fat32_init();
    80201aea:	00005097          	auipc	ra,0x5
    80201aee:	858080e7          	jalr	-1960(ra) # 80206342 <fat32_init>
    myproc()->cwd = ename("/");
    80201af2:	00000097          	auipc	ra,0x0
    80201af6:	f82080e7          	jalr	-126(ra) # 80201a74 <myproc>
    80201afa:	84aa                	mv	s1,a0
    80201afc:	00009517          	auipc	a0,0x9
    80201b00:	b3450513          	addi	a0,a0,-1228 # 8020a630 <digits+0x2b0>
    80201b04:	00006097          	auipc	ra,0x6
    80201b08:	a98080e7          	jalr	-1384(ra) # 8020759c <ename>
    80201b0c:	4ca4bc23          	sd	a0,1240(s1)
    80201b10:	b7c1                	j	80201ad0 <forkret+0x24>

0000000080201b12 <allocpid>:
{
    80201b12:	1101                	addi	sp,sp,-32
    80201b14:	ec06                	sd	ra,24(sp)
    80201b16:	e822                	sd	s0,16(sp)
    80201b18:	e426                	sd	s1,8(sp)
    80201b1a:	e04a                	sd	s2,0(sp)
    80201b1c:	1000                	addi	s0,sp,32
  acquire(&pid_lock);
    80201b1e:	00014917          	auipc	s2,0x14
    80201b22:	54290913          	addi	s2,s2,1346 # 80216060 <pid_lock>
    80201b26:	854a                	mv	a0,s2
    80201b28:	fffff097          	auipc	ra,0xfffff
    80201b2c:	ba0080e7          	jalr	-1120(ra) # 802006c8 <acquire>
  pid = nextpid;
    80201b30:	00009797          	auipc	a5,0x9
    80201b34:	4d078793          	addi	a5,a5,1232 # 8020b000 <first.1691>
    80201b38:	43c4                	lw	s1,4(a5)
  nextpid = nextpid + 1;
    80201b3a:	0014871b          	addiw	a4,s1,1
    80201b3e:	c3d8                	sw	a4,4(a5)
  release(&pid_lock);
    80201b40:	854a                	mv	a0,s2
    80201b42:	fffff097          	auipc	ra,0xfffff
    80201b46:	bda080e7          	jalr	-1062(ra) # 8020071c <release>
}
    80201b4a:	8526                	mv	a0,s1
    80201b4c:	60e2                	ld	ra,24(sp)
    80201b4e:	6442                	ld	s0,16(sp)
    80201b50:	64a2                	ld	s1,8(sp)
    80201b52:	6902                	ld	s2,0(sp)
    80201b54:	6105                	addi	sp,sp,32
    80201b56:	8082                	ret

0000000080201b58 <proc_pagetable>:
{
    80201b58:	1101                	addi	sp,sp,-32
    80201b5a:	ec06                	sd	ra,24(sp)
    80201b5c:	e822                	sd	s0,16(sp)
    80201b5e:	e426                	sd	s1,8(sp)
    80201b60:	e04a                	sd	s2,0(sp)
    80201b62:	1000                	addi	s0,sp,32
    80201b64:	892a                	mv	s2,a0
  pagetable = uvmcreate();
    80201b66:	fffff097          	auipc	ra,0xfffff
    80201b6a:	3aa080e7          	jalr	938(ra) # 80200f10 <uvmcreate>
    80201b6e:	84aa                	mv	s1,a0
  if (pagetable == 0)
    80201b70:	c121                	beqz	a0,80201bb0 <proc_pagetable+0x58>
  if (mappages(pagetable, TRAMPOLINE, PGSIZE,
    80201b72:	4729                	li	a4,10
    80201b74:	0000b697          	auipc	a3,0xb
    80201b78:	5446b683          	ld	a3,1348(a3) # 8020d0b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201b7c:	6605                	lui	a2,0x1
    80201b7e:	040005b7          	lui	a1,0x4000
    80201b82:	15fd                	addi	a1,a1,-1
    80201b84:	05b2                	slli	a1,a1,0xc
    80201b86:	fffff097          	auipc	ra,0xfffff
    80201b8a:	10c080e7          	jalr	268(ra) # 80200c92 <mappages>
    80201b8e:	02054863          	bltz	a0,80201bbe <proc_pagetable+0x66>
  if (mappages(pagetable, TRAPFRAME, PGSIZE,
    80201b92:	4719                	li	a4,6
    80201b94:	06093683          	ld	a3,96(s2)
    80201b98:	6605                	lui	a2,0x1
    80201b9a:	020005b7          	lui	a1,0x2000
    80201b9e:	15fd                	addi	a1,a1,-1
    80201ba0:	05b6                	slli	a1,a1,0xd
    80201ba2:	8526                	mv	a0,s1
    80201ba4:	fffff097          	auipc	ra,0xfffff
    80201ba8:	0ee080e7          	jalr	238(ra) # 80200c92 <mappages>
    80201bac:	02054163          	bltz	a0,80201bce <proc_pagetable+0x76>
}
    80201bb0:	8526                	mv	a0,s1
    80201bb2:	60e2                	ld	ra,24(sp)
    80201bb4:	6442                	ld	s0,16(sp)
    80201bb6:	64a2                	ld	s1,8(sp)
    80201bb8:	6902                	ld	s2,0(sp)
    80201bba:	6105                	addi	sp,sp,32
    80201bbc:	8082                	ret
    uvmfree(pagetable, 0);
    80201bbe:	4581                	li	a1,0
    80201bc0:	8526                	mv	a0,s1
    80201bc2:	fffff097          	auipc	ra,0xfffff
    80201bc6:	5d2080e7          	jalr	1490(ra) # 80201194 <uvmfree>
    return NULL;
    80201bca:	4481                	li	s1,0
    80201bcc:	b7d5                	j	80201bb0 <proc_pagetable+0x58>
    vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201bce:	4681                	li	a3,0
    80201bd0:	4605                	li	a2,1
    80201bd2:	040005b7          	lui	a1,0x4000
    80201bd6:	15fd                	addi	a1,a1,-1
    80201bd8:	05b2                	slli	a1,a1,0xc
    80201bda:	8526                	mv	a0,s1
    80201bdc:	fffff097          	auipc	ra,0xfffff
    80201be0:	270080e7          	jalr	624(ra) # 80200e4c <vmunmap>
    uvmfree(pagetable, 0);
    80201be4:	4581                	li	a1,0
    80201be6:	8526                	mv	a0,s1
    80201be8:	fffff097          	auipc	ra,0xfffff
    80201bec:	5ac080e7          	jalr	1452(ra) # 80201194 <uvmfree>
    return NULL;
    80201bf0:	4481                	li	s1,0
    80201bf2:	bf7d                	j	80201bb0 <proc_pagetable+0x58>

0000000080201bf4 <proc_freepagetable>:
{
    80201bf4:	1101                	addi	sp,sp,-32
    80201bf6:	ec06                	sd	ra,24(sp)
    80201bf8:	e822                	sd	s0,16(sp)
    80201bfa:	e426                	sd	s1,8(sp)
    80201bfc:	e04a                	sd	s2,0(sp)
    80201bfe:	1000                	addi	s0,sp,32
    80201c00:	84aa                	mv	s1,a0
    80201c02:	892e                	mv	s2,a1
  vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201c04:	4681                	li	a3,0
    80201c06:	4605                	li	a2,1
    80201c08:	040005b7          	lui	a1,0x4000
    80201c0c:	15fd                	addi	a1,a1,-1
    80201c0e:	05b2                	slli	a1,a1,0xc
    80201c10:	fffff097          	auipc	ra,0xfffff
    80201c14:	23c080e7          	jalr	572(ra) # 80200e4c <vmunmap>
  vmunmap(pagetable, TRAPFRAME, 1, 0);
    80201c18:	4681                	li	a3,0
    80201c1a:	4605                	li	a2,1
    80201c1c:	020005b7          	lui	a1,0x2000
    80201c20:	15fd                	addi	a1,a1,-1
    80201c22:	05b6                	slli	a1,a1,0xd
    80201c24:	8526                	mv	a0,s1
    80201c26:	fffff097          	auipc	ra,0xfffff
    80201c2a:	226080e7          	jalr	550(ra) # 80200e4c <vmunmap>
  uvmfree(pagetable, sz);
    80201c2e:	85ca                	mv	a1,s2
    80201c30:	8526                	mv	a0,s1
    80201c32:	fffff097          	auipc	ra,0xfffff
    80201c36:	562080e7          	jalr	1378(ra) # 80201194 <uvmfree>
}
    80201c3a:	60e2                	ld	ra,24(sp)
    80201c3c:	6442                	ld	s0,16(sp)
    80201c3e:	64a2                	ld	s1,8(sp)
    80201c40:	6902                	ld	s2,0(sp)
    80201c42:	6105                	addi	sp,sp,32
    80201c44:	8082                	ret

0000000080201c46 <freeproc>:
{
    80201c46:	1101                	addi	sp,sp,-32
    80201c48:	ec06                	sd	ra,24(sp)
    80201c4a:	e822                	sd	s0,16(sp)
    80201c4c:	e426                	sd	s1,8(sp)
    80201c4e:	1000                	addi	s0,sp,32
    80201c50:	84aa                	mv	s1,a0
  if (p->trapframe)
    80201c52:	7128                	ld	a0,96(a0)
    80201c54:	c509                	beqz	a0,80201c5e <freeproc+0x18>
    kfree((void *)p->trapframe);
    80201c56:	ffffe097          	auipc	ra,0xffffe
    80201c5a:	7ee080e7          	jalr	2030(ra) # 80200444 <kfree>
  p->trapframe = 0;
    80201c5e:	0604b023          	sd	zero,96(s1)
  if (p->kpagetable)
    80201c62:	6ca8                	ld	a0,88(s1)
    80201c64:	c511                	beqz	a0,80201c70 <freeproc+0x2a>
    kvmfree(p->kpagetable, 1);
    80201c66:	4585                	li	a1,1
    80201c68:	00000097          	auipc	ra,0x0
    80201c6c:	a32080e7          	jalr	-1486(ra) # 8020169a <kvmfree>
  p->kpagetable = 0;
    80201c70:	0404bc23          	sd	zero,88(s1)
  if (p->pagetable)
    80201c74:	68a8                	ld	a0,80(s1)
    80201c76:	c511                	beqz	a0,80201c82 <freeproc+0x3c>
    proc_freepagetable(p->pagetable, p->sz);
    80201c78:	64ac                	ld	a1,72(s1)
    80201c7a:	00000097          	auipc	ra,0x0
    80201c7e:	f7a080e7          	jalr	-134(ra) # 80201bf4 <proc_freepagetable>
  p->pagetable = 0;
    80201c82:	0404b823          	sd	zero,80(s1)
  p->sz = 0;
    80201c86:	0404b423          	sd	zero,72(s1)
  p->pid = 0;
    80201c8a:	0204ac23          	sw	zero,56(s1)
  p->parent = 0;
    80201c8e:	0204b023          	sd	zero,32(s1)
  p->name[0] = 0;
    80201c92:	4e048023          	sb	zero,1248(s1)
  p->chan = 0;
    80201c96:	0204b423          	sd	zero,40(s1)
  p->killed = 0;
    80201c9a:	0204a823          	sw	zero,48(s1)
  p->xstate = 0;
    80201c9e:	0204aa23          	sw	zero,52(s1)
  p->state = UNUSED;
    80201ca2:	0004ac23          	sw	zero,24(s1)
}
    80201ca6:	60e2                	ld	ra,24(sp)
    80201ca8:	6442                	ld	s0,16(sp)
    80201caa:	64a2                	ld	s1,8(sp)
    80201cac:	6105                	addi	sp,sp,32
    80201cae:	8082                	ret

0000000080201cb0 <allocproc>:
{
    80201cb0:	1101                	addi	sp,sp,-32
    80201cb2:	ec06                	sd	ra,24(sp)
    80201cb4:	e822                	sd	s0,16(sp)
    80201cb6:	e426                	sd	s1,8(sp)
    80201cb8:	e04a                	sd	s2,0(sp)
    80201cba:	1000                	addi	s0,sp,32
  for (p = proc; p < &proc[NPROC]; p++)
    80201cbc:	00014497          	auipc	s1,0x14
    80201cc0:	4c448493          	addi	s1,s1,1220 # 80216180 <proc>
    80201cc4:	00024917          	auipc	s2,0x24
    80201cc8:	d2c90913          	addi	s2,s2,-724 # 802259f0 <bcache>
    acquire(&p->lock);
    80201ccc:	8526                	mv	a0,s1
    80201cce:	fffff097          	auipc	ra,0xfffff
    80201cd2:	9fa080e7          	jalr	-1542(ra) # 802006c8 <acquire>
    if (p->state == UNUSED)
    80201cd6:	4c9c                	lw	a5,24(s1)
    80201cd8:	cf81                	beqz	a5,80201cf0 <allocproc+0x40>
      release(&p->lock);
    80201cda:	8526                	mv	a0,s1
    80201cdc:	fffff097          	auipc	ra,0xfffff
    80201ce0:	a40080e7          	jalr	-1472(ra) # 8020071c <release>
  for (p = proc; p < &proc[NPROC]; p++)
    80201ce4:	4f848493          	addi	s1,s1,1272
    80201ce8:	ff2492e3          	bne	s1,s2,80201ccc <allocproc+0x1c>
  return NULL;
    80201cec:	4481                	li	s1,0
    80201cee:	a085                	j	80201d4e <allocproc+0x9e>
  p->pid = allocpid();
    80201cf0:	00000097          	auipc	ra,0x0
    80201cf4:	e22080e7          	jalr	-478(ra) # 80201b12 <allocpid>
    80201cf8:	dc88                	sw	a0,56(s1)
  if ((p->trapframe = (struct trapframe *)kalloc()) == NULL)
    80201cfa:	fffff097          	auipc	ra,0xfffff
    80201cfe:	862080e7          	jalr	-1950(ra) # 8020055c <kalloc>
    80201d02:	892a                	mv	s2,a0
    80201d04:	f0a8                	sd	a0,96(s1)
    80201d06:	c939                	beqz	a0,80201d5c <allocproc+0xac>
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201d08:	8526                	mv	a0,s1
    80201d0a:	00000097          	auipc	ra,0x0
    80201d0e:	e4e080e7          	jalr	-434(ra) # 80201b58 <proc_pagetable>
    80201d12:	e8a8                	sd	a0,80(s1)
    80201d14:	c939                	beqz	a0,80201d6a <allocproc+0xba>
      (p->kpagetable = proc_kpagetable()) == NULL)
    80201d16:	00000097          	auipc	ra,0x0
    80201d1a:	9de080e7          	jalr	-1570(ra) # 802016f4 <proc_kpagetable>
    80201d1e:	eca8                	sd	a0,88(s1)
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201d20:	c529                	beqz	a0,80201d6a <allocproc+0xba>
  p->kstack = VKSTACK;
    80201d22:	0fb00793          	li	a5,251
    80201d26:	07fa                	slli	a5,a5,0x1e
    80201d28:	e0bc                	sd	a5,64(s1)
  memset(&p->context, 0, sizeof(p->context));
    80201d2a:	07000613          	li	a2,112
    80201d2e:	4581                	li	a1,0
    80201d30:	06848513          	addi	a0,s1,104
    80201d34:	fffff097          	auipc	ra,0xfffff
    80201d38:	a30080e7          	jalr	-1488(ra) # 80200764 <memset>
  p->context.ra = (uint64)forkret;
    80201d3c:	00000797          	auipc	a5,0x0
    80201d40:	d7078793          	addi	a5,a5,-656 # 80201aac <forkret>
    80201d44:	f4bc                	sd	a5,104(s1)
  p->context.sp = p->kstack + PGSIZE;
    80201d46:	60bc                	ld	a5,64(s1)
    80201d48:	6705                	lui	a4,0x1
    80201d4a:	97ba                	add	a5,a5,a4
    80201d4c:	f8bc                	sd	a5,112(s1)
}
    80201d4e:	8526                	mv	a0,s1
    80201d50:	60e2                	ld	ra,24(sp)
    80201d52:	6442                	ld	s0,16(sp)
    80201d54:	64a2                	ld	s1,8(sp)
    80201d56:	6902                	ld	s2,0(sp)
    80201d58:	6105                	addi	sp,sp,32
    80201d5a:	8082                	ret
    release(&p->lock);
    80201d5c:	8526                	mv	a0,s1
    80201d5e:	fffff097          	auipc	ra,0xfffff
    80201d62:	9be080e7          	jalr	-1602(ra) # 8020071c <release>
    return NULL;
    80201d66:	84ca                	mv	s1,s2
    80201d68:	b7dd                	j	80201d4e <allocproc+0x9e>
    freeproc(p);
    80201d6a:	8526                	mv	a0,s1
    80201d6c:	00000097          	auipc	ra,0x0
    80201d70:	eda080e7          	jalr	-294(ra) # 80201c46 <freeproc>
    release(&p->lock);
    80201d74:	8526                	mv	a0,s1
    80201d76:	fffff097          	auipc	ra,0xfffff
    80201d7a:	9a6080e7          	jalr	-1626(ra) # 8020071c <release>
    return NULL;
    80201d7e:	4481                	li	s1,0
    80201d80:	b7f9                	j	80201d4e <allocproc+0x9e>

0000000080201d82 <userinit>:
{
    80201d82:	1101                	addi	sp,sp,-32
    80201d84:	ec06                	sd	ra,24(sp)
    80201d86:	e822                	sd	s0,16(sp)
    80201d88:	e426                	sd	s1,8(sp)
    80201d8a:	1000                	addi	s0,sp,32
  p = allocproc();
    80201d8c:	00000097          	auipc	ra,0x0
    80201d90:	f24080e7          	jalr	-220(ra) # 80201cb0 <allocproc>
    80201d94:	84aa                	mv	s1,a0
  initproc = p;
    80201d96:	00014797          	auipc	a5,0x14
    80201d9a:	3ea7b123          	sd	a0,994(a5) # 80216178 <initproc>
  uvminit(p->pagetable, p->kpagetable, initcode, sizeof(initcode));
    80201d9e:	03400693          	li	a3,52
    80201da2:	00009617          	auipc	a2,0x9
    80201da6:	26660613          	addi	a2,a2,614 # 8020b008 <initcode>
    80201daa:	6d2c                	ld	a1,88(a0)
    80201dac:	6928                	ld	a0,80(a0)
    80201dae:	fffff097          	auipc	ra,0xfffff
    80201db2:	190080e7          	jalr	400(ra) # 80200f3e <uvminit>
  p->sz = PGSIZE;
    80201db6:	6785                	lui	a5,0x1
    80201db8:	e4bc                	sd	a5,72(s1)
  p->trapframe->epc = 0x0;   // user program counter
    80201dba:	70b8                	ld	a4,96(s1)
    80201dbc:	00073c23          	sd	zero,24(a4) # 1018 <_entry-0x801fefe8>
  p->trapframe->sp = PGSIZE; // user stack pointer
    80201dc0:	70b8                	ld	a4,96(s1)
    80201dc2:	fb1c                	sd	a5,48(a4)
  safestrcpy(p->name, "initcode", sizeof(p->name));
    80201dc4:	4641                	li	a2,16
    80201dc6:	00009597          	auipc	a1,0x9
    80201dca:	87258593          	addi	a1,a1,-1934 # 8020a638 <digits+0x2b8>
    80201dce:	4e048513          	addi	a0,s1,1248
    80201dd2:	fffff097          	auipc	ra,0xfffff
    80201dd6:	ae8080e7          	jalr	-1304(ra) # 802008ba <safestrcpy>
  p->state = RUNNABLE;
    80201dda:	4789                	li	a5,2
    80201ddc:	cc9c                	sw	a5,24(s1)
  p->tmask = 0;
    80201dde:	4e04a823          	sw	zero,1264(s1)
  release(&p->lock);
    80201de2:	8526                	mv	a0,s1
    80201de4:	fffff097          	auipc	ra,0xfffff
    80201de8:	938080e7          	jalr	-1736(ra) # 8020071c <release>
}
    80201dec:	60e2                	ld	ra,24(sp)
    80201dee:	6442                	ld	s0,16(sp)
    80201df0:	64a2                	ld	s1,8(sp)
    80201df2:	6105                	addi	sp,sp,32
    80201df4:	8082                	ret

0000000080201df6 <growproc>:
{
    80201df6:	1101                	addi	sp,sp,-32
    80201df8:	ec06                	sd	ra,24(sp)
    80201dfa:	e822                	sd	s0,16(sp)
    80201dfc:	e426                	sd	s1,8(sp)
    80201dfe:	e04a                	sd	s2,0(sp)
    80201e00:	1000                	addi	s0,sp,32
    80201e02:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80201e04:	00000097          	auipc	ra,0x0
    80201e08:	c70080e7          	jalr	-912(ra) # 80201a74 <myproc>
    80201e0c:	892a                	mv	s2,a0
  sz = p->sz;
    80201e0e:	6530                	ld	a2,72(a0)
    80201e10:	0006069b          	sext.w	a3,a2
  if (n > 0)
    80201e14:	00904f63          	bgtz	s1,80201e32 <growproc+0x3c>
  else if (n < 0)
    80201e18:	0204cd63          	bltz	s1,80201e52 <growproc+0x5c>
  p->sz = sz;
    80201e1c:	1682                	slli	a3,a3,0x20
    80201e1e:	9281                	srli	a3,a3,0x20
    80201e20:	04d93423          	sd	a3,72(s2)
  return 0;
    80201e24:	4501                	li	a0,0
}
    80201e26:	60e2                	ld	ra,24(sp)
    80201e28:	6442                	ld	s0,16(sp)
    80201e2a:	64a2                	ld	s1,8(sp)
    80201e2c:	6902                	ld	s2,0(sp)
    80201e2e:	6105                	addi	sp,sp,32
    80201e30:	8082                	ret
    if ((sz = uvmalloc(p->pagetable, p->kpagetable, sz, sz + n)) == 0)
    80201e32:	9ea5                	addw	a3,a3,s1
    80201e34:	1682                	slli	a3,a3,0x20
    80201e36:	9281                	srli	a3,a3,0x20
    80201e38:	1602                	slli	a2,a2,0x20
    80201e3a:	9201                	srli	a2,a2,0x20
    80201e3c:	6d2c                	ld	a1,88(a0)
    80201e3e:	6928                	ld	a0,80(a0)
    80201e40:	fffff097          	auipc	ra,0xfffff
    80201e44:	1f4080e7          	jalr	500(ra) # 80201034 <uvmalloc>
    80201e48:	0005069b          	sext.w	a3,a0
    80201e4c:	fae1                	bnez	a3,80201e1c <growproc+0x26>
      return -1;
    80201e4e:	557d                	li	a0,-1
    80201e50:	bfd9                	j	80201e26 <growproc+0x30>
    sz = uvmdealloc(p->pagetable, p->kpagetable, sz, sz + n);
    80201e52:	9ea5                	addw	a3,a3,s1
    80201e54:	1682                	slli	a3,a3,0x20
    80201e56:	9281                	srli	a3,a3,0x20
    80201e58:	1602                	slli	a2,a2,0x20
    80201e5a:	9201                	srli	a2,a2,0x20
    80201e5c:	6d2c                	ld	a1,88(a0)
    80201e5e:	6928                	ld	a0,80(a0)
    80201e60:	fffff097          	auipc	ra,0xfffff
    80201e64:	168080e7          	jalr	360(ra) # 80200fc8 <uvmdealloc>
    80201e68:	0005069b          	sext.w	a3,a0
    80201e6c:	bf45                	j	80201e1c <growproc+0x26>

0000000080201e6e <fork>:
{
    80201e6e:	7179                	addi	sp,sp,-48
    80201e70:	f406                	sd	ra,40(sp)
    80201e72:	f022                	sd	s0,32(sp)
    80201e74:	ec26                	sd	s1,24(sp)
    80201e76:	e84a                	sd	s2,16(sp)
    80201e78:	e44e                	sd	s3,8(sp)
    80201e7a:	e052                	sd	s4,0(sp)
    80201e7c:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80201e7e:	00000097          	auipc	ra,0x0
    80201e82:	bf6080e7          	jalr	-1034(ra) # 80201a74 <myproc>
    80201e86:	892a                	mv	s2,a0
  if ((np = allocproc()) == NULL)
    80201e88:	00000097          	auipc	ra,0x0
    80201e8c:	e28080e7          	jalr	-472(ra) # 80201cb0 <allocproc>
    80201e90:	c57d                	beqz	a0,80201f7e <fork+0x110>
    80201e92:	8a2a                	mv	s4,a0
  if (uvmcopy(p->pagetable, np->pagetable, np->kpagetable, p->sz) < 0)
    80201e94:	04893683          	ld	a3,72(s2)
    80201e98:	6d30                	ld	a2,88(a0)
    80201e9a:	692c                	ld	a1,80(a0)
    80201e9c:	05093503          	ld	a0,80(s2)
    80201ea0:	fffff097          	auipc	ra,0xfffff
    80201ea4:	32c080e7          	jalr	812(ra) # 802011cc <uvmcopy>
    80201ea8:	04054c63          	bltz	a0,80201f00 <fork+0x92>
  np->sz = p->sz;
    80201eac:	04893783          	ld	a5,72(s2)
    80201eb0:	04fa3423          	sd	a5,72(s4)
  np->parent = p;
    80201eb4:	032a3023          	sd	s2,32(s4)
  np->tmask = p->tmask;
    80201eb8:	4f092783          	lw	a5,1264(s2)
    80201ebc:	4efa2823          	sw	a5,1264(s4)
  *(np->trapframe) = *(p->trapframe);
    80201ec0:	06093683          	ld	a3,96(s2)
    80201ec4:	87b6                	mv	a5,a3
    80201ec6:	060a3703          	ld	a4,96(s4)
    80201eca:	12068693          	addi	a3,a3,288
    80201ece:	0007b803          	ld	a6,0(a5) # 1000 <_entry-0x801ff000>
    80201ed2:	6788                	ld	a0,8(a5)
    80201ed4:	6b8c                	ld	a1,16(a5)
    80201ed6:	6f90                	ld	a2,24(a5)
    80201ed8:	01073023          	sd	a6,0(a4)
    80201edc:	e708                	sd	a0,8(a4)
    80201ede:	eb0c                	sd	a1,16(a4)
    80201ee0:	ef10                	sd	a2,24(a4)
    80201ee2:	02078793          	addi	a5,a5,32
    80201ee6:	02070713          	addi	a4,a4,32
    80201eea:	fed792e3          	bne	a5,a3,80201ece <fork+0x60>
  np->trapframe->a0 = 0;
    80201eee:	060a3783          	ld	a5,96(s4)
    80201ef2:	0607b823          	sd	zero,112(a5)
    80201ef6:	0d800493          	li	s1,216
  for (i = 0; i < NOFILE; i++)
    80201efa:	4d800993          	li	s3,1240
    80201efe:	a03d                	j	80201f2c <fork+0xbe>
    freeproc(np);
    80201f00:	8552                	mv	a0,s4
    80201f02:	00000097          	auipc	ra,0x0
    80201f06:	d44080e7          	jalr	-700(ra) # 80201c46 <freeproc>
    release(&np->lock);
    80201f0a:	8552                	mv	a0,s4
    80201f0c:	fffff097          	auipc	ra,0xfffff
    80201f10:	810080e7          	jalr	-2032(ra) # 8020071c <release>
    return -1;
    80201f14:	54fd                	li	s1,-1
    80201f16:	a899                	j	80201f6c <fork+0xfe>
      np->ofile[i] = filedup(p->ofile[i]);
    80201f18:	00002097          	auipc	ra,0x2
    80201f1c:	d30080e7          	jalr	-720(ra) # 80203c48 <filedup>
    80201f20:	009a07b3          	add	a5,s4,s1
    80201f24:	e388                	sd	a0,0(a5)
  for (i = 0; i < NOFILE; i++)
    80201f26:	04a1                	addi	s1,s1,8
    80201f28:	01348763          	beq	s1,s3,80201f36 <fork+0xc8>
    if (p->ofile[i])
    80201f2c:	009907b3          	add	a5,s2,s1
    80201f30:	6388                	ld	a0,0(a5)
    80201f32:	f17d                	bnez	a0,80201f18 <fork+0xaa>
    80201f34:	bfcd                	j	80201f26 <fork+0xb8>
  np->cwd = edup(p->cwd);
    80201f36:	4d893503          	ld	a0,1240(s2)
    80201f3a:	00005097          	auipc	ra,0x5
    80201f3e:	c5a080e7          	jalr	-934(ra) # 80206b94 <edup>
    80201f42:	4caa3c23          	sd	a0,1240(s4)
  safestrcpy(np->name, p->name, sizeof(p->name));
    80201f46:	4641                	li	a2,16
    80201f48:	4e090593          	addi	a1,s2,1248
    80201f4c:	4e0a0513          	addi	a0,s4,1248
    80201f50:	fffff097          	auipc	ra,0xfffff
    80201f54:	96a080e7          	jalr	-1686(ra) # 802008ba <safestrcpy>
  pid = np->pid;
    80201f58:	038a2483          	lw	s1,56(s4)
  np->state = RUNNABLE;
    80201f5c:	4789                	li	a5,2
    80201f5e:	00fa2c23          	sw	a5,24(s4)
  release(&np->lock);
    80201f62:	8552                	mv	a0,s4
    80201f64:	ffffe097          	auipc	ra,0xffffe
    80201f68:	7b8080e7          	jalr	1976(ra) # 8020071c <release>
}
    80201f6c:	8526                	mv	a0,s1
    80201f6e:	70a2                	ld	ra,40(sp)
    80201f70:	7402                	ld	s0,32(sp)
    80201f72:	64e2                	ld	s1,24(sp)
    80201f74:	6942                	ld	s2,16(sp)
    80201f76:	69a2                	ld	s3,8(sp)
    80201f78:	6a02                	ld	s4,0(sp)
    80201f7a:	6145                	addi	sp,sp,48
    80201f7c:	8082                	ret
    return -1;
    80201f7e:	54fd                	li	s1,-1
    80201f80:	b7f5                	j	80201f6c <fork+0xfe>

0000000080201f82 <reparent>:
{
    80201f82:	7179                	addi	sp,sp,-48
    80201f84:	f406                	sd	ra,40(sp)
    80201f86:	f022                	sd	s0,32(sp)
    80201f88:	ec26                	sd	s1,24(sp)
    80201f8a:	e84a                	sd	s2,16(sp)
    80201f8c:	e44e                	sd	s3,8(sp)
    80201f8e:	e052                	sd	s4,0(sp)
    80201f90:	1800                	addi	s0,sp,48
    80201f92:	892a                	mv	s2,a0
  for (pp = proc; pp < &proc[NPROC]; pp++)
    80201f94:	00014497          	auipc	s1,0x14
    80201f98:	1ec48493          	addi	s1,s1,492 # 80216180 <proc>
      pp->parent = initproc;
    80201f9c:	00014a17          	auipc	s4,0x14
    80201fa0:	0c4a0a13          	addi	s4,s4,196 # 80216060 <pid_lock>
  for (pp = proc; pp < &proc[NPROC]; pp++)
    80201fa4:	00024997          	auipc	s3,0x24
    80201fa8:	a4c98993          	addi	s3,s3,-1460 # 802259f0 <bcache>
    80201fac:	a029                	j	80201fb6 <reparent+0x34>
    80201fae:	4f848493          	addi	s1,s1,1272
    80201fb2:	03348363          	beq	s1,s3,80201fd8 <reparent+0x56>
    if (pp->parent == p)
    80201fb6:	709c                	ld	a5,32(s1)
    80201fb8:	ff279be3          	bne	a5,s2,80201fae <reparent+0x2c>
      acquire(&pp->lock);
    80201fbc:	8526                	mv	a0,s1
    80201fbe:	ffffe097          	auipc	ra,0xffffe
    80201fc2:	70a080e7          	jalr	1802(ra) # 802006c8 <acquire>
      pp->parent = initproc;
    80201fc6:	118a3783          	ld	a5,280(s4)
    80201fca:	f09c                	sd	a5,32(s1)
      release(&pp->lock);
    80201fcc:	8526                	mv	a0,s1
    80201fce:	ffffe097          	auipc	ra,0xffffe
    80201fd2:	74e080e7          	jalr	1870(ra) # 8020071c <release>
    80201fd6:	bfe1                	j	80201fae <reparent+0x2c>
}
    80201fd8:	70a2                	ld	ra,40(sp)
    80201fda:	7402                	ld	s0,32(sp)
    80201fdc:	64e2                	ld	s1,24(sp)
    80201fde:	6942                	ld	s2,16(sp)
    80201fe0:	69a2                	ld	s3,8(sp)
    80201fe2:	6a02                	ld	s4,0(sp)
    80201fe4:	6145                	addi	sp,sp,48
    80201fe6:	8082                	ret

0000000080201fe8 <scheduler>:
{
    80201fe8:	715d                	addi	sp,sp,-80
    80201fea:	e486                	sd	ra,72(sp)
    80201fec:	e0a2                	sd	s0,64(sp)
    80201fee:	fc26                	sd	s1,56(sp)
    80201ff0:	f84a                	sd	s2,48(sp)
    80201ff2:	f44e                	sd	s3,40(sp)
    80201ff4:	f052                	sd	s4,32(sp)
    80201ff6:	ec56                	sd	s5,24(sp)
    80201ff8:	e85a                	sd	s6,16(sp)
    80201ffa:	e45e                	sd	s7,8(sp)
    80201ffc:	e062                	sd	s8,0(sp)
    80201ffe:	0880                	addi	s0,sp,80
    80202000:	8792                	mv	a5,tp
  int id = r_tp();
    80202002:	2781                	sext.w	a5,a5
  c->proc = 0;
    80202004:	00779b13          	slli	s6,a5,0x7
    80202008:	00014717          	auipc	a4,0x14
    8020200c:	05870713          	addi	a4,a4,88 # 80216060 <pid_lock>
    80202010:	975a                	add	a4,a4,s6
    80202012:	00073c23          	sd	zero,24(a4)
        swtch(&c->context, &p->context);
    80202016:	00014717          	auipc	a4,0x14
    8020201a:	06a70713          	addi	a4,a4,106 # 80216080 <cpus+0x8>
    8020201e:	9b3a                	add	s6,s6,a4
        c->proc = p;
    80202020:	079e                	slli	a5,a5,0x7
    80202022:	00014a97          	auipc	s5,0x14
    80202026:	03ea8a93          	addi	s5,s5,62 # 80216060 <pid_lock>
    8020202a:	9abe                	add	s5,s5,a5
        w_satp(MAKE_SATP(p->kpagetable));
    8020202c:	5a7d                	li	s4,-1
    8020202e:	1a7e                	slli	s4,s4,0x3f
        w_satp(MAKE_SATP(kernel_pagetable));
    80202030:	0000bb97          	auipc	s7,0xb
    80202034:	0d8bbb83          	ld	s7,216(s7) # 8020d108 <_GLOBAL_OFFSET_TABLE_+0x58>
    80202038:	a8a5                	j	802020b0 <scheduler+0xc8>
        p->state = RUNNING;
    8020203a:	478d                	li	a5,3
    8020203c:	cc9c                	sw	a5,24(s1)
        c->proc = p;
    8020203e:	009abc23          	sd	s1,24(s5)
        w_satp(MAKE_SATP(p->kpagetable));
    80202042:	6cbc                	ld	a5,88(s1)
    80202044:	83b1                	srli	a5,a5,0xc
    80202046:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    8020204a:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    8020204e:	12000073          	sfence.vma
        swtch(&c->context, &p->context);
    80202052:	06848593          	addi	a1,s1,104
    80202056:	855a                	mv	a0,s6
    80202058:	00000097          	auipc	ra,0x0
    8020205c:	76c080e7          	jalr	1900(ra) # 802027c4 <swtch>
        w_satp(MAKE_SATP(kernel_pagetable));
    80202060:	000bb783          	ld	a5,0(s7)
    80202064:	83b1                	srli	a5,a5,0xc
    80202066:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    8020206a:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    8020206e:	12000073          	sfence.vma
        c->proc = 0;
    80202072:	000abc23          	sd	zero,24(s5)
        found = 1;
    80202076:	4c05                	li	s8,1
      release(&p->lock);
    80202078:	8526                	mv	a0,s1
    8020207a:	ffffe097          	auipc	ra,0xffffe
    8020207e:	6a2080e7          	jalr	1698(ra) # 8020071c <release>
    for (p = proc; p < &proc[NPROC]; p++)
    80202082:	4f848493          	addi	s1,s1,1272
    80202086:	01248b63          	beq	s1,s2,8020209c <scheduler+0xb4>
      acquire(&p->lock);
    8020208a:	8526                	mv	a0,s1
    8020208c:	ffffe097          	auipc	ra,0xffffe
    80202090:	63c080e7          	jalr	1596(ra) # 802006c8 <acquire>
      if (p->state == RUNNABLE)
    80202094:	4c9c                	lw	a5,24(s1)
    80202096:	ff3791e3          	bne	a5,s3,80202078 <scheduler+0x90>
    8020209a:	b745                	j	8020203a <scheduler+0x52>
    if (found == 0)
    8020209c:	000c1a63          	bnez	s8,802020b0 <scheduler+0xc8>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802020a0:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    802020a4:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802020a8:	10079073          	csrw	sstatus,a5
      asm volatile("wfi");
    802020ac:	10500073          	wfi
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802020b0:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    802020b4:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802020b8:	10079073          	csrw	sstatus,a5
    int found = 0;
    802020bc:	4c01                	li	s8,0
    for (p = proc; p < &proc[NPROC]; p++)
    802020be:	00014497          	auipc	s1,0x14
    802020c2:	0c248493          	addi	s1,s1,194 # 80216180 <proc>
      if (p->state == RUNNABLE)
    802020c6:	4989                	li	s3,2
    for (p = proc; p < &proc[NPROC]; p++)
    802020c8:	00024917          	auipc	s2,0x24
    802020cc:	92890913          	addi	s2,s2,-1752 # 802259f0 <bcache>
    802020d0:	bf6d                	j	8020208a <scheduler+0xa2>

00000000802020d2 <sched>:
{
    802020d2:	7179                	addi	sp,sp,-48
    802020d4:	f406                	sd	ra,40(sp)
    802020d6:	f022                	sd	s0,32(sp)
    802020d8:	ec26                	sd	s1,24(sp)
    802020da:	e84a                	sd	s2,16(sp)
    802020dc:	e44e                	sd	s3,8(sp)
    802020de:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    802020e0:	00000097          	auipc	ra,0x0
    802020e4:	994080e7          	jalr	-1644(ra) # 80201a74 <myproc>
    802020e8:	84aa                	mv	s1,a0
  if (!holding(&p->lock))
    802020ea:	ffffe097          	auipc	ra,0xffffe
    802020ee:	5b0080e7          	jalr	1456(ra) # 8020069a <holding>
    802020f2:	c93d                	beqz	a0,80202168 <sched+0x96>
  asm volatile("mv %0, tp" : "=r" (x) );
    802020f4:	8792                	mv	a5,tp
  if (mycpu()->noff != 1)
    802020f6:	2781                	sext.w	a5,a5
    802020f8:	079e                	slli	a5,a5,0x7
    802020fa:	00014717          	auipc	a4,0x14
    802020fe:	f6670713          	addi	a4,a4,-154 # 80216060 <pid_lock>
    80202102:	97ba                	add	a5,a5,a4
    80202104:	0907a703          	lw	a4,144(a5)
    80202108:	4785                	li	a5,1
    8020210a:	06f71763          	bne	a4,a5,80202178 <sched+0xa6>
  if (p->state == RUNNING)
    8020210e:	4c98                	lw	a4,24(s1)
    80202110:	478d                	li	a5,3
    80202112:	06f70b63          	beq	a4,a5,80202188 <sched+0xb6>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202116:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    8020211a:	8b89                	andi	a5,a5,2
  if (intr_get())
    8020211c:	efb5                	bnez	a5,80202198 <sched+0xc6>
  asm volatile("mv %0, tp" : "=r" (x) );
    8020211e:	8792                	mv	a5,tp
  intena = mycpu()->intena;
    80202120:	00014917          	auipc	s2,0x14
    80202124:	f4090913          	addi	s2,s2,-192 # 80216060 <pid_lock>
    80202128:	2781                	sext.w	a5,a5
    8020212a:	079e                	slli	a5,a5,0x7
    8020212c:	97ca                	add	a5,a5,s2
    8020212e:	0947a983          	lw	s3,148(a5)
    80202132:	8792                	mv	a5,tp
  swtch(&p->context, &mycpu()->context);
    80202134:	2781                	sext.w	a5,a5
    80202136:	079e                	slli	a5,a5,0x7
    80202138:	00014597          	auipc	a1,0x14
    8020213c:	f4858593          	addi	a1,a1,-184 # 80216080 <cpus+0x8>
    80202140:	95be                	add	a1,a1,a5
    80202142:	06848513          	addi	a0,s1,104
    80202146:	00000097          	auipc	ra,0x0
    8020214a:	67e080e7          	jalr	1662(ra) # 802027c4 <swtch>
    8020214e:	8792                	mv	a5,tp
  mycpu()->intena = intena;
    80202150:	2781                	sext.w	a5,a5
    80202152:	079e                	slli	a5,a5,0x7
    80202154:	97ca                	add	a5,a5,s2
    80202156:	0937aa23          	sw	s3,148(a5)
}
    8020215a:	70a2                	ld	ra,40(sp)
    8020215c:	7402                	ld	s0,32(sp)
    8020215e:	64e2                	ld	s1,24(sp)
    80202160:	6942                	ld	s2,16(sp)
    80202162:	69a2                	ld	s3,8(sp)
    80202164:	6145                	addi	sp,sp,48
    80202166:	8082                	ret
    panic("sched p->lock");
    80202168:	00008517          	auipc	a0,0x8
    8020216c:	4e050513          	addi	a0,a0,1248 # 8020a648 <digits+0x2c8>
    80202170:	ffffe097          	auipc	ra,0xffffe
    80202174:	fd2080e7          	jalr	-46(ra) # 80200142 <panic>
    panic("sched locks");
    80202178:	00008517          	auipc	a0,0x8
    8020217c:	4e050513          	addi	a0,a0,1248 # 8020a658 <digits+0x2d8>
    80202180:	ffffe097          	auipc	ra,0xffffe
    80202184:	fc2080e7          	jalr	-62(ra) # 80200142 <panic>
    panic("sched running");
    80202188:	00008517          	auipc	a0,0x8
    8020218c:	4e050513          	addi	a0,a0,1248 # 8020a668 <digits+0x2e8>
    80202190:	ffffe097          	auipc	ra,0xffffe
    80202194:	fb2080e7          	jalr	-78(ra) # 80200142 <panic>
    panic("sched interruptible");
    80202198:	00008517          	auipc	a0,0x8
    8020219c:	4e050513          	addi	a0,a0,1248 # 8020a678 <digits+0x2f8>
    802021a0:	ffffe097          	auipc	ra,0xffffe
    802021a4:	fa2080e7          	jalr	-94(ra) # 80200142 <panic>

00000000802021a8 <exit>:
{
    802021a8:	7179                	addi	sp,sp,-48
    802021aa:	f406                	sd	ra,40(sp)
    802021ac:	f022                	sd	s0,32(sp)
    802021ae:	ec26                	sd	s1,24(sp)
    802021b0:	e84a                	sd	s2,16(sp)
    802021b2:	e44e                	sd	s3,8(sp)
    802021b4:	e052                	sd	s4,0(sp)
    802021b6:	1800                	addi	s0,sp,48
    802021b8:	8a2a                	mv	s4,a0
  struct proc *p = myproc();
    802021ba:	00000097          	auipc	ra,0x0
    802021be:	8ba080e7          	jalr	-1862(ra) # 80201a74 <myproc>
    802021c2:	89aa                	mv	s3,a0
  for (int fd = 0; fd < NOFILE; fd++)
    802021c4:	0d850493          	addi	s1,a0,216
    802021c8:	4d850913          	addi	s2,a0,1240
    802021cc:	a811                	j	802021e0 <exit+0x38>
      fileclose(f);
    802021ce:	00002097          	auipc	ra,0x2
    802021d2:	acc080e7          	jalr	-1332(ra) # 80203c9a <fileclose>
      p->ofile[fd] = 0;
    802021d6:	0004b023          	sd	zero,0(s1)
  for (int fd = 0; fd < NOFILE; fd++)
    802021da:	04a1                	addi	s1,s1,8
    802021dc:	01248563          	beq	s1,s2,802021e6 <exit+0x3e>
    if (p->ofile[fd])
    802021e0:	6088                	ld	a0,0(s1)
    802021e2:	f575                	bnez	a0,802021ce <exit+0x26>
    802021e4:	bfdd                	j	802021da <exit+0x32>
  eput(p->cwd);
    802021e6:	4d89b503          	ld	a0,1240(s3)
    802021ea:	00005097          	auipc	ra,0x5
    802021ee:	c8c080e7          	jalr	-884(ra) # 80206e76 <eput>
  p->cwd = 0;
    802021f2:	4c09bc23          	sd	zero,1240(s3)
  acquire(&initproc->lock);
    802021f6:	00014497          	auipc	s1,0x14
    802021fa:	e6a48493          	addi	s1,s1,-406 # 80216060 <pid_lock>
    802021fe:	1184b503          	ld	a0,280(s1)
    80202202:	ffffe097          	auipc	ra,0xffffe
    80202206:	4c6080e7          	jalr	1222(ra) # 802006c8 <acquire>
  wakeup1(initproc);
    8020220a:	1184b503          	ld	a0,280(s1)
    8020220e:	fffff097          	auipc	ra,0xfffff
    80202212:	67a080e7          	jalr	1658(ra) # 80201888 <wakeup1>
  release(&initproc->lock);
    80202216:	1184b503          	ld	a0,280(s1)
    8020221a:	ffffe097          	auipc	ra,0xffffe
    8020221e:	502080e7          	jalr	1282(ra) # 8020071c <release>
  acquire(&p->lock);
    80202222:	854e                	mv	a0,s3
    80202224:	ffffe097          	auipc	ra,0xffffe
    80202228:	4a4080e7          	jalr	1188(ra) # 802006c8 <acquire>
  struct proc *original_parent = p->parent;
    8020222c:	0209b483          	ld	s1,32(s3)
  release(&p->lock);
    80202230:	854e                	mv	a0,s3
    80202232:	ffffe097          	auipc	ra,0xffffe
    80202236:	4ea080e7          	jalr	1258(ra) # 8020071c <release>
  acquire(&original_parent->lock);
    8020223a:	8526                	mv	a0,s1
    8020223c:	ffffe097          	auipc	ra,0xffffe
    80202240:	48c080e7          	jalr	1164(ra) # 802006c8 <acquire>
  acquire(&p->lock);
    80202244:	854e                	mv	a0,s3
    80202246:	ffffe097          	auipc	ra,0xffffe
    8020224a:	482080e7          	jalr	1154(ra) # 802006c8 <acquire>
  reparent(p);
    8020224e:	854e                	mv	a0,s3
    80202250:	00000097          	auipc	ra,0x0
    80202254:	d32080e7          	jalr	-718(ra) # 80201f82 <reparent>
  wakeup1(original_parent);
    80202258:	8526                	mv	a0,s1
    8020225a:	fffff097          	auipc	ra,0xfffff
    8020225e:	62e080e7          	jalr	1582(ra) # 80201888 <wakeup1>
  p->xstate=status<<8;
    80202262:	008a1a1b          	slliw	s4,s4,0x8
    80202266:	0349aa23          	sw	s4,52(s3)
  p->state = ZOMBIE;
    8020226a:	4791                	li	a5,4
    8020226c:	00f9ac23          	sw	a5,24(s3)
  release(&original_parent->lock);
    80202270:	8526                	mv	a0,s1
    80202272:	ffffe097          	auipc	ra,0xffffe
    80202276:	4aa080e7          	jalr	1194(ra) # 8020071c <release>
  sched();
    8020227a:	00000097          	auipc	ra,0x0
    8020227e:	e58080e7          	jalr	-424(ra) # 802020d2 <sched>
  panic("zombie exit");
    80202282:	00008517          	auipc	a0,0x8
    80202286:	40e50513          	addi	a0,a0,1038 # 8020a690 <digits+0x310>
    8020228a:	ffffe097          	auipc	ra,0xffffe
    8020228e:	eb8080e7          	jalr	-328(ra) # 80200142 <panic>

0000000080202292 <yield>:
{
    80202292:	1101                	addi	sp,sp,-32
    80202294:	ec06                	sd	ra,24(sp)
    80202296:	e822                	sd	s0,16(sp)
    80202298:	e426                	sd	s1,8(sp)
    8020229a:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    8020229c:	fffff097          	auipc	ra,0xfffff
    802022a0:	7d8080e7          	jalr	2008(ra) # 80201a74 <myproc>
    802022a4:	84aa                	mv	s1,a0
  acquire(&p->lock);
    802022a6:	ffffe097          	auipc	ra,0xffffe
    802022aa:	422080e7          	jalr	1058(ra) # 802006c8 <acquire>
  p->state = RUNNABLE;
    802022ae:	4789                	li	a5,2
    802022b0:	cc9c                	sw	a5,24(s1)
  sched();
    802022b2:	00000097          	auipc	ra,0x0
    802022b6:	e20080e7          	jalr	-480(ra) # 802020d2 <sched>
  release(&p->lock);
    802022ba:	8526                	mv	a0,s1
    802022bc:	ffffe097          	auipc	ra,0xffffe
    802022c0:	460080e7          	jalr	1120(ra) # 8020071c <release>
}
    802022c4:	60e2                	ld	ra,24(sp)
    802022c6:	6442                	ld	s0,16(sp)
    802022c8:	64a2                	ld	s1,8(sp)
    802022ca:	6105                	addi	sp,sp,32
    802022cc:	8082                	ret

00000000802022ce <sleep>:
{
    802022ce:	7179                	addi	sp,sp,-48
    802022d0:	f406                	sd	ra,40(sp)
    802022d2:	f022                	sd	s0,32(sp)
    802022d4:	ec26                	sd	s1,24(sp)
    802022d6:	e84a                	sd	s2,16(sp)
    802022d8:	e44e                	sd	s3,8(sp)
    802022da:	1800                	addi	s0,sp,48
    802022dc:	89aa                	mv	s3,a0
    802022de:	892e                	mv	s2,a1
  struct proc *p = myproc();
    802022e0:	fffff097          	auipc	ra,0xfffff
    802022e4:	794080e7          	jalr	1940(ra) # 80201a74 <myproc>
    802022e8:	84aa                	mv	s1,a0
  if (lk != &p->lock)
    802022ea:	05250663          	beq	a0,s2,80202336 <sleep+0x68>
    acquire(&p->lock); // DOC: sleeplock1
    802022ee:	ffffe097          	auipc	ra,0xffffe
    802022f2:	3da080e7          	jalr	986(ra) # 802006c8 <acquire>
    release(lk);
    802022f6:	854a                	mv	a0,s2
    802022f8:	ffffe097          	auipc	ra,0xffffe
    802022fc:	424080e7          	jalr	1060(ra) # 8020071c <release>
  p->chan = chan;
    80202300:	0334b423          	sd	s3,40(s1)
  p->state = SLEEPING;
    80202304:	4785                	li	a5,1
    80202306:	cc9c                	sw	a5,24(s1)
  sched();
    80202308:	00000097          	auipc	ra,0x0
    8020230c:	dca080e7          	jalr	-566(ra) # 802020d2 <sched>
  p->chan = 0;
    80202310:	0204b423          	sd	zero,40(s1)
    release(&p->lock);
    80202314:	8526                	mv	a0,s1
    80202316:	ffffe097          	auipc	ra,0xffffe
    8020231a:	406080e7          	jalr	1030(ra) # 8020071c <release>
    acquire(lk);
    8020231e:	854a                	mv	a0,s2
    80202320:	ffffe097          	auipc	ra,0xffffe
    80202324:	3a8080e7          	jalr	936(ra) # 802006c8 <acquire>
}
    80202328:	70a2                	ld	ra,40(sp)
    8020232a:	7402                	ld	s0,32(sp)
    8020232c:	64e2                	ld	s1,24(sp)
    8020232e:	6942                	ld	s2,16(sp)
    80202330:	69a2                	ld	s3,8(sp)
    80202332:	6145                	addi	sp,sp,48
    80202334:	8082                	ret
  p->chan = chan;
    80202336:	03353423          	sd	s3,40(a0)
  p->state = SLEEPING;
    8020233a:	4785                	li	a5,1
    8020233c:	cd1c                	sw	a5,24(a0)
  sched();
    8020233e:	00000097          	auipc	ra,0x0
    80202342:	d94080e7          	jalr	-620(ra) # 802020d2 <sched>
  p->chan = 0;
    80202346:	0204b423          	sd	zero,40(s1)
  if (lk != &p->lock)
    8020234a:	bff9                	j	80202328 <sleep+0x5a>

000000008020234c <wait>:
{
    8020234c:	715d                	addi	sp,sp,-80
    8020234e:	e486                	sd	ra,72(sp)
    80202350:	e0a2                	sd	s0,64(sp)
    80202352:	fc26                	sd	s1,56(sp)
    80202354:	f84a                	sd	s2,48(sp)
    80202356:	f44e                	sd	s3,40(sp)
    80202358:	f052                	sd	s4,32(sp)
    8020235a:	ec56                	sd	s5,24(sp)
    8020235c:	e85a                	sd	s6,16(sp)
    8020235e:	e45e                	sd	s7,8(sp)
    80202360:	e062                	sd	s8,0(sp)
    80202362:	0880                	addi	s0,sp,80
    80202364:	8b2a                	mv	s6,a0
  struct proc *p = myproc();
    80202366:	fffff097          	auipc	ra,0xfffff
    8020236a:	70e080e7          	jalr	1806(ra) # 80201a74 <myproc>
    8020236e:	892a                	mv	s2,a0
  acquire(&p->lock);
    80202370:	8c2a                	mv	s8,a0
    80202372:	ffffe097          	auipc	ra,0xffffe
    80202376:	356080e7          	jalr	854(ra) # 802006c8 <acquire>
    havekids = 0;
    8020237a:	4b81                	li	s7,0
        if (np->state == ZOMBIE)
    8020237c:	4a11                	li	s4,4
    for (np = proc; np < &proc[NPROC]; np++)
    8020237e:	00023997          	auipc	s3,0x23
    80202382:	67298993          	addi	s3,s3,1650 # 802259f0 <bcache>
        havekids = 1;
    80202386:	4a85                	li	s5,1
    havekids = 0;
    80202388:	875e                	mv	a4,s7
    for (np = proc; np < &proc[NPROC]; np++)
    8020238a:	00014497          	auipc	s1,0x14
    8020238e:	df648493          	addi	s1,s1,-522 # 80216180 <proc>
    80202392:	a8b9                	j	802023f0 <wait+0xa4>
          pid = np->pid;
    80202394:	0384a983          	lw	s3,56(s1)
          if (addr != 0 && copyout2(addr, (char *)&np->xstate, sizeof(np->xstate)) < 0)
    80202398:	000b0c63          	beqz	s6,802023b0 <wait+0x64>
    8020239c:	4611                	li	a2,4
    8020239e:	03448593          	addi	a1,s1,52
    802023a2:	855a                	mv	a0,s6
    802023a4:	fffff097          	auipc	ra,0xfffff
    802023a8:	ff4080e7          	jalr	-12(ra) # 80201398 <copyout2>
    802023ac:	02054263          	bltz	a0,802023d0 <wait+0x84>
          freeproc(np);
    802023b0:	8526                	mv	a0,s1
    802023b2:	00000097          	auipc	ra,0x0
    802023b6:	894080e7          	jalr	-1900(ra) # 80201c46 <freeproc>
          release(&np->lock);
    802023ba:	8526                	mv	a0,s1
    802023bc:	ffffe097          	auipc	ra,0xffffe
    802023c0:	360080e7          	jalr	864(ra) # 8020071c <release>
          release(&p->lock);
    802023c4:	854a                	mv	a0,s2
    802023c6:	ffffe097          	auipc	ra,0xffffe
    802023ca:	356080e7          	jalr	854(ra) # 8020071c <release>
          return pid;
    802023ce:	a8a9                	j	80202428 <wait+0xdc>
            release(&np->lock);
    802023d0:	8526                	mv	a0,s1
    802023d2:	ffffe097          	auipc	ra,0xffffe
    802023d6:	34a080e7          	jalr	842(ra) # 8020071c <release>
            release(&p->lock);
    802023da:	854a                	mv	a0,s2
    802023dc:	ffffe097          	auipc	ra,0xffffe
    802023e0:	340080e7          	jalr	832(ra) # 8020071c <release>
            return -1;
    802023e4:	59fd                	li	s3,-1
    802023e6:	a089                	j	80202428 <wait+0xdc>
    for (np = proc; np < &proc[NPROC]; np++)
    802023e8:	4f848493          	addi	s1,s1,1272
    802023ec:	03348463          	beq	s1,s3,80202414 <wait+0xc8>
      if (np->parent == p)
    802023f0:	709c                	ld	a5,32(s1)
    802023f2:	ff279be3          	bne	a5,s2,802023e8 <wait+0x9c>
        acquire(&np->lock);
    802023f6:	8526                	mv	a0,s1
    802023f8:	ffffe097          	auipc	ra,0xffffe
    802023fc:	2d0080e7          	jalr	720(ra) # 802006c8 <acquire>
        if (np->state == ZOMBIE)
    80202400:	4c9c                	lw	a5,24(s1)
    80202402:	f94789e3          	beq	a5,s4,80202394 <wait+0x48>
        release(&np->lock);
    80202406:	8526                	mv	a0,s1
    80202408:	ffffe097          	auipc	ra,0xffffe
    8020240c:	314080e7          	jalr	788(ra) # 8020071c <release>
        havekids = 1;
    80202410:	8756                	mv	a4,s5
    80202412:	bfd9                	j	802023e8 <wait+0x9c>
    if (!havekids || p->killed)
    80202414:	c701                	beqz	a4,8020241c <wait+0xd0>
    80202416:	03092783          	lw	a5,48(s2)
    8020241a:	c785                	beqz	a5,80202442 <wait+0xf6>
      release(&p->lock);
    8020241c:	854a                	mv	a0,s2
    8020241e:	ffffe097          	auipc	ra,0xffffe
    80202422:	2fe080e7          	jalr	766(ra) # 8020071c <release>
      return -1;
    80202426:	59fd                	li	s3,-1
}
    80202428:	854e                	mv	a0,s3
    8020242a:	60a6                	ld	ra,72(sp)
    8020242c:	6406                	ld	s0,64(sp)
    8020242e:	74e2                	ld	s1,56(sp)
    80202430:	7942                	ld	s2,48(sp)
    80202432:	79a2                	ld	s3,40(sp)
    80202434:	7a02                	ld	s4,32(sp)
    80202436:	6ae2                	ld	s5,24(sp)
    80202438:	6b42                	ld	s6,16(sp)
    8020243a:	6ba2                	ld	s7,8(sp)
    8020243c:	6c02                	ld	s8,0(sp)
    8020243e:	6161                	addi	sp,sp,80
    80202440:	8082                	ret
    sleep(p, &p->lock); // DOC: wait-sleep
    80202442:	85e2                	mv	a1,s8
    80202444:	854a                	mv	a0,s2
    80202446:	00000097          	auipc	ra,0x0
    8020244a:	e88080e7          	jalr	-376(ra) # 802022ce <sleep>
    havekids = 0;
    8020244e:	bf2d                	j	80202388 <wait+0x3c>

0000000080202450 <wakeup>:
{
    80202450:	7139                	addi	sp,sp,-64
    80202452:	fc06                	sd	ra,56(sp)
    80202454:	f822                	sd	s0,48(sp)
    80202456:	f426                	sd	s1,40(sp)
    80202458:	f04a                	sd	s2,32(sp)
    8020245a:	ec4e                	sd	s3,24(sp)
    8020245c:	e852                	sd	s4,16(sp)
    8020245e:	e456                	sd	s5,8(sp)
    80202460:	0080                	addi	s0,sp,64
    80202462:	8a2a                	mv	s4,a0
  for (p = proc; p < &proc[NPROC]; p++)
    80202464:	00014497          	auipc	s1,0x14
    80202468:	d1c48493          	addi	s1,s1,-740 # 80216180 <proc>
    if (p->state == SLEEPING && p->chan == chan)
    8020246c:	4985                	li	s3,1
      p->state = RUNNABLE;
    8020246e:	4a89                	li	s5,2
  for (p = proc; p < &proc[NPROC]; p++)
    80202470:	00023917          	auipc	s2,0x23
    80202474:	58090913          	addi	s2,s2,1408 # 802259f0 <bcache>
    80202478:	a821                	j	80202490 <wakeup+0x40>
      p->state = RUNNABLE;
    8020247a:	0154ac23          	sw	s5,24(s1)
    release(&p->lock);
    8020247e:	8526                	mv	a0,s1
    80202480:	ffffe097          	auipc	ra,0xffffe
    80202484:	29c080e7          	jalr	668(ra) # 8020071c <release>
  for (p = proc; p < &proc[NPROC]; p++)
    80202488:	4f848493          	addi	s1,s1,1272
    8020248c:	01248e63          	beq	s1,s2,802024a8 <wakeup+0x58>
    acquire(&p->lock);
    80202490:	8526                	mv	a0,s1
    80202492:	ffffe097          	auipc	ra,0xffffe
    80202496:	236080e7          	jalr	566(ra) # 802006c8 <acquire>
    if (p->state == SLEEPING && p->chan == chan)
    8020249a:	4c9c                	lw	a5,24(s1)
    8020249c:	ff3791e3          	bne	a5,s3,8020247e <wakeup+0x2e>
    802024a0:	749c                	ld	a5,40(s1)
    802024a2:	fd479ee3          	bne	a5,s4,8020247e <wakeup+0x2e>
    802024a6:	bfd1                	j	8020247a <wakeup+0x2a>
}
    802024a8:	70e2                	ld	ra,56(sp)
    802024aa:	7442                	ld	s0,48(sp)
    802024ac:	74a2                	ld	s1,40(sp)
    802024ae:	7902                	ld	s2,32(sp)
    802024b0:	69e2                	ld	s3,24(sp)
    802024b2:	6a42                	ld	s4,16(sp)
    802024b4:	6aa2                	ld	s5,8(sp)
    802024b6:	6121                	addi	sp,sp,64
    802024b8:	8082                	ret

00000000802024ba <kill>:

// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int kill(int pid)
{
    802024ba:	7179                	addi	sp,sp,-48
    802024bc:	f406                	sd	ra,40(sp)
    802024be:	f022                	sd	s0,32(sp)
    802024c0:	ec26                	sd	s1,24(sp)
    802024c2:	e84a                	sd	s2,16(sp)
    802024c4:	e44e                	sd	s3,8(sp)
    802024c6:	1800                	addi	s0,sp,48
    802024c8:	892a                	mv	s2,a0
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++)
    802024ca:	00014497          	auipc	s1,0x14
    802024ce:	cb648493          	addi	s1,s1,-842 # 80216180 <proc>
    802024d2:	00023997          	auipc	s3,0x23
    802024d6:	51e98993          	addi	s3,s3,1310 # 802259f0 <bcache>
  {
    acquire(&p->lock);
    802024da:	8526                	mv	a0,s1
    802024dc:	ffffe097          	auipc	ra,0xffffe
    802024e0:	1ec080e7          	jalr	492(ra) # 802006c8 <acquire>
    if (p->pid == pid)
    802024e4:	5c9c                	lw	a5,56(s1)
    802024e6:	01278d63          	beq	a5,s2,80202500 <kill+0x46>
        p->state = RUNNABLE;
      }
      release(&p->lock);
      return 0;
    }
    release(&p->lock);
    802024ea:	8526                	mv	a0,s1
    802024ec:	ffffe097          	auipc	ra,0xffffe
    802024f0:	230080e7          	jalr	560(ra) # 8020071c <release>
  for (p = proc; p < &proc[NPROC]; p++)
    802024f4:	4f848493          	addi	s1,s1,1272
    802024f8:	ff3491e3          	bne	s1,s3,802024da <kill+0x20>
  }
  return -1;
    802024fc:	557d                	li	a0,-1
    802024fe:	a829                	j	80202518 <kill+0x5e>
      p->killed = 1;
    80202500:	4785                	li	a5,1
    80202502:	d89c                	sw	a5,48(s1)
      if (p->state == SLEEPING)
    80202504:	4c98                	lw	a4,24(s1)
    80202506:	4785                	li	a5,1
    80202508:	00f70f63          	beq	a4,a5,80202526 <kill+0x6c>
      release(&p->lock);
    8020250c:	8526                	mv	a0,s1
    8020250e:	ffffe097          	auipc	ra,0xffffe
    80202512:	20e080e7          	jalr	526(ra) # 8020071c <release>
      return 0;
    80202516:	4501                	li	a0,0
}
    80202518:	70a2                	ld	ra,40(sp)
    8020251a:	7402                	ld	s0,32(sp)
    8020251c:	64e2                	ld	s1,24(sp)
    8020251e:	6942                	ld	s2,16(sp)
    80202520:	69a2                	ld	s3,8(sp)
    80202522:	6145                	addi	sp,sp,48
    80202524:	8082                	ret
        p->state = RUNNABLE;
    80202526:	4789                	li	a5,2
    80202528:	cc9c                	sw	a5,24(s1)
    8020252a:	b7cd                	j	8020250c <kill+0x52>

000000008020252c <either_copyout>:

// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    8020252c:	1101                	addi	sp,sp,-32
    8020252e:	ec06                	sd	ra,24(sp)
    80202530:	e822                	sd	s0,16(sp)
    80202532:	e426                	sd	s1,8(sp)
    80202534:	1000                	addi	s0,sp,32
    80202536:	84aa                	mv	s1,a0
    80202538:	852e                	mv	a0,a1
    8020253a:	85b2                	mv	a1,a2
    8020253c:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if (user_dst)
    8020253e:	c891                	beqz	s1,80202552 <either_copyout+0x26>
  {
    // return copyout(p->pagetable, dst, src, len);
    return copyout2(dst, src, len);
    80202540:	fffff097          	auipc	ra,0xfffff
    80202544:	e58080e7          	jalr	-424(ra) # 80201398 <copyout2>
  else
  {
    memmove((char *)dst, src, len);
    return 0;
  }
}
    80202548:	60e2                	ld	ra,24(sp)
    8020254a:	6442                	ld	s0,16(sp)
    8020254c:	64a2                	ld	s1,8(sp)
    8020254e:	6105                	addi	sp,sp,32
    80202550:	8082                	ret
    memmove((char *)dst, src, len);
    80202552:	0006861b          	sext.w	a2,a3
    80202556:	ffffe097          	auipc	ra,0xffffe
    8020255a:	26e080e7          	jalr	622(ra) # 802007c4 <memmove>
    return 0;
    8020255e:	8526                	mv	a0,s1
    80202560:	b7e5                	j	80202548 <either_copyout+0x1c>

0000000080202562 <either_copyin>:

// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    80202562:	1101                	addi	sp,sp,-32
    80202564:	ec06                	sd	ra,24(sp)
    80202566:	e822                	sd	s0,16(sp)
    80202568:	e426                	sd	s1,8(sp)
    8020256a:	1000                	addi	s0,sp,32
    8020256c:	84ae                	mv	s1,a1
    8020256e:	85b2                	mv	a1,a2
    80202570:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if (user_src)
    80202572:	c891                	beqz	s1,80202586 <either_copyin+0x24>
  {
    // return copyin(p->pagetable, dst, src, len);
    return copyin2(dst, src, len);
    80202574:	fffff097          	auipc	ra,0xfffff
    80202578:	f02080e7          	jalr	-254(ra) # 80201476 <copyin2>
  else
  {
    memmove(dst, (char *)src, len);
    return 0;
  }
}
    8020257c:	60e2                	ld	ra,24(sp)
    8020257e:	6442                	ld	s0,16(sp)
    80202580:	64a2                	ld	s1,8(sp)
    80202582:	6105                	addi	sp,sp,32
    80202584:	8082                	ret
    memmove(dst, (char *)src, len);
    80202586:	0006861b          	sext.w	a2,a3
    8020258a:	ffffe097          	auipc	ra,0xffffe
    8020258e:	23a080e7          	jalr	570(ra) # 802007c4 <memmove>
    return 0;
    80202592:	8526                	mv	a0,s1
    80202594:	b7e5                	j	8020257c <either_copyin+0x1a>

0000000080202596 <procdump>:

// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void procdump(void)
{
    80202596:	715d                	addi	sp,sp,-80
    80202598:	e486                	sd	ra,72(sp)
    8020259a:	e0a2                	sd	s0,64(sp)
    8020259c:	fc26                	sd	s1,56(sp)
    8020259e:	f84a                	sd	s2,48(sp)
    802025a0:	f44e                	sd	s3,40(sp)
    802025a2:	f052                	sd	s4,32(sp)
    802025a4:	ec56                	sd	s5,24(sp)
    802025a6:	e85a                	sd	s6,16(sp)
    802025a8:	e45e                	sd	s7,8(sp)
    802025aa:	0880                	addi	s0,sp,80
      [RUNNING] "run   ",
      [ZOMBIE] "zombie"};
  struct proc *p;
  char *state;

  printf("\nPID\tSTATE\tNAME\tMEM\n");
    802025ac:	00008517          	auipc	a0,0x8
    802025b0:	0fc50513          	addi	a0,a0,252 # 8020a6a8 <digits+0x328>
    802025b4:	ffffe097          	auipc	ra,0xffffe
    802025b8:	bd8080e7          	jalr	-1064(ra) # 8020018c <printf>
  for (p = proc; p < &proc[NPROC]; p++)
    802025bc:	00014497          	auipc	s1,0x14
    802025c0:	0a448493          	addi	s1,s1,164 # 80216660 <proc+0x4e0>
    802025c4:	00024917          	auipc	s2,0x24
    802025c8:	90c90913          	addi	s2,s2,-1780 # 80225ed0 <bcache+0x4e0>
  {
    if (p->state == UNUSED)
      continue;
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
    802025cc:	4b11                	li	s6,4
      state = states[p->state];
    else
      state = "???";
    802025ce:	00008997          	auipc	s3,0x8
    802025d2:	0d298993          	addi	s3,s3,210 # 8020a6a0 <digits+0x320>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    802025d6:	00008a97          	auipc	s5,0x8
    802025da:	0eaa8a93          	addi	s5,s5,234 # 8020a6c0 <digits+0x340>
    printf("\n");
    802025de:	00008a17          	auipc	s4,0x8
    802025e2:	afaa0a13          	addi	s4,s4,-1286 # 8020a0d8 <etext+0xd8>
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
    802025e6:	00009b97          	auipc	s7,0x9
    802025ea:	a5ab8b93          	addi	s7,s7,-1446 # 8020b040 <states.1729>
    802025ee:	a01d                	j	80202614 <procdump+0x7e>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    802025f0:	b686b703          	ld	a4,-1176(a3)
    802025f4:	b586a583          	lw	a1,-1192(a3)
    802025f8:	8556                	mv	a0,s5
    802025fa:	ffffe097          	auipc	ra,0xffffe
    802025fe:	b92080e7          	jalr	-1134(ra) # 8020018c <printf>
    printf("\n");
    80202602:	8552                	mv	a0,s4
    80202604:	ffffe097          	auipc	ra,0xffffe
    80202608:	b88080e7          	jalr	-1144(ra) # 8020018c <printf>
  for (p = proc; p < &proc[NPROC]; p++)
    8020260c:	4f848493          	addi	s1,s1,1272
    80202610:	03248163          	beq	s1,s2,80202632 <procdump+0x9c>
    if (p->state == UNUSED)
    80202614:	86a6                	mv	a3,s1
    80202616:	b384a783          	lw	a5,-1224(s1)
    8020261a:	dbed                	beqz	a5,8020260c <procdump+0x76>
      state = "???";
    8020261c:	864e                	mv	a2,s3
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
    8020261e:	fcfb69e3          	bltu	s6,a5,802025f0 <procdump+0x5a>
    80202622:	1782                	slli	a5,a5,0x20
    80202624:	9381                	srli	a5,a5,0x20
    80202626:	078e                	slli	a5,a5,0x3
    80202628:	97de                	add	a5,a5,s7
    8020262a:	6390                	ld	a2,0(a5)
    8020262c:	f271                	bnez	a2,802025f0 <procdump+0x5a>
      state = "???";
    8020262e:	864e                	mv	a2,s3
    80202630:	b7c1                	j	802025f0 <procdump+0x5a>
  }
}
    80202632:	60a6                	ld	ra,72(sp)
    80202634:	6406                	ld	s0,64(sp)
    80202636:	74e2                	ld	s1,56(sp)
    80202638:	7942                	ld	s2,48(sp)
    8020263a:	79a2                	ld	s3,40(sp)
    8020263c:	7a02                	ld	s4,32(sp)
    8020263e:	6ae2                	ld	s5,24(sp)
    80202640:	6b42                	ld	s6,16(sp)
    80202642:	6ba2                	ld	s7,8(sp)
    80202644:	6161                	addi	sp,sp,80
    80202646:	8082                	ret

0000000080202648 <procnum>:

uint64
procnum(void)
{
    80202648:	1141                	addi	sp,sp,-16
    8020264a:	e422                	sd	s0,8(sp)
    8020264c:	0800                	addi	s0,sp,16
  int num = 0;
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++)
    8020264e:	00014797          	auipc	a5,0x14
    80202652:	b3278793          	addi	a5,a5,-1230 # 80216180 <proc>
  int num = 0;
    80202656:	4501                	li	a0,0
  for (p = proc; p < &proc[NPROC]; p++)
    80202658:	00023697          	auipc	a3,0x23
    8020265c:	39868693          	addi	a3,a3,920 # 802259f0 <bcache>
    80202660:	a029                	j	8020266a <procnum+0x22>
    80202662:	4f878793          	addi	a5,a5,1272
    80202666:	00d78663          	beq	a5,a3,80202672 <procnum+0x2a>
  {
    if (p->state != UNUSED)
    8020266a:	4f98                	lw	a4,24(a5)
    8020266c:	db7d                	beqz	a4,80202662 <procnum+0x1a>
    {
      num++;
    8020266e:	2505                	addiw	a0,a0,1
    80202670:	bfcd                	j	80202662 <procnum+0x1a>
    }
  }

  return num;
}
    80202672:	6422                	ld	s0,8(sp)
    80202674:	0141                	addi	sp,sp,16
    80202676:	8082                	ret

0000000080202678 <clone>:


// added by lmq for SYS_clone
int clone(int flags, int stack, int ptid, int tls, int ctid)
{
    80202678:	1141                	addi	sp,sp,-16
    8020267a:	e406                	sd	ra,8(sp)
    8020267c:	e022                	sd	s0,0(sp)
    8020267e:	0800                	addi	s0,sp,16
  int new_pid = fork();
    80202680:	fffff097          	auipc	ra,0xfffff
    80202684:	7ee080e7          	jalr	2030(ra) # 80201e6e <fork>
  return new_pid;
}
    80202688:	60a2                	ld	ra,8(sp)
    8020268a:	6402                	ld	s0,0(sp)
    8020268c:	0141                	addi	sp,sp,16
    8020268e:	8082                	ret

0000000080202690 <waitpid>:
 * @addr:address to store return status of child process
 * @options:default 0
 * @return:pid of child process;-1 means failure
 */
int waitpid(int cpid, uint64 addr, int options)
{
    80202690:	711d                	addi	sp,sp,-96
    80202692:	ec86                	sd	ra,88(sp)
    80202694:	e8a2                	sd	s0,80(sp)
    80202696:	e4a6                	sd	s1,72(sp)
    80202698:	e0ca                	sd	s2,64(sp)
    8020269a:	fc4e                	sd	s3,56(sp)
    8020269c:	f852                	sd	s4,48(sp)
    8020269e:	f456                	sd	s5,40(sp)
    802026a0:	f05a                	sd	s6,32(sp)
    802026a2:	ec5e                	sd	s7,24(sp)
    802026a4:	e862                	sd	s8,16(sp)
    802026a6:	e466                	sd	s9,8(sp)
    802026a8:	1080                	addi	s0,sp,96
    802026aa:	8bae                	mv	s7,a1
  if (cpid == -1) // wait for any child
    802026ac:	57fd                	li	a5,-1
    802026ae:	02f51663          	bne	a0,a5,802026da <waitpid+0x4a>
  {
    return wait(addr);
    802026b2:	852e                	mv	a0,a1
    802026b4:	00000097          	auipc	ra,0x0
    802026b8:	c98080e7          	jalr	-872(ra) # 8020234c <wait>
    802026bc:	89aa                	mv	s3,a0

    // Wait for a child to exit.
    sleep(p, &p->lock); // DOC: wait-sleep

  }
}
    802026be:	854e                	mv	a0,s3
    802026c0:	60e6                	ld	ra,88(sp)
    802026c2:	6446                	ld	s0,80(sp)
    802026c4:	64a6                	ld	s1,72(sp)
    802026c6:	6906                	ld	s2,64(sp)
    802026c8:	79e2                	ld	s3,56(sp)
    802026ca:	7a42                	ld	s4,48(sp)
    802026cc:	7aa2                	ld	s5,40(sp)
    802026ce:	7b02                	ld	s6,32(sp)
    802026d0:	6be2                	ld	s7,24(sp)
    802026d2:	6c42                	ld	s8,16(sp)
    802026d4:	6ca2                	ld	s9,8(sp)
    802026d6:	6125                	addi	sp,sp,96
    802026d8:	8082                	ret
    802026da:	8a2a                	mv	s4,a0
  struct proc *p = myproc();
    802026dc:	fffff097          	auipc	ra,0xfffff
    802026e0:	398080e7          	jalr	920(ra) # 80201a74 <myproc>
    802026e4:	892a                	mv	s2,a0
  acquire(&p->lock);
    802026e6:	8caa                	mv	s9,a0
    802026e8:	ffffe097          	auipc	ra,0xffffe
    802026ec:	fe0080e7          	jalr	-32(ra) # 802006c8 <acquire>
    havekids = 0;
    802026f0:	4c01                	li	s8,0
        if (pp->state == ZOMBIE)
    802026f2:	4a91                	li	s5,4
    for (pp = proc; pp < &proc[NPROC]; pp++)
    802026f4:	00023997          	auipc	s3,0x23
    802026f8:	2fc98993          	addi	s3,s3,764 # 802259f0 <bcache>
        havekids = 1;
    802026fc:	4b05                	li	s6,1
    802026fe:	a045                	j	8020279e <waitpid+0x10e>
          pid = pp->pid;
    80202700:	0384a983          	lw	s3,56(s1)
          if (addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
    80202704:	000b8e63          	beqz	s7,80202720 <waitpid+0x90>
    80202708:	4691                	li	a3,4
    8020270a:	03448613          	addi	a2,s1,52
    8020270e:	85de                	mv	a1,s7
    80202710:	05093503          	ld	a0,80(s2)
    80202714:	fffff097          	auipc	ra,0xfffff
    80202718:	bf8080e7          	jalr	-1032(ra) # 8020130c <copyout>
    8020271c:	02054263          	bltz	a0,80202740 <waitpid+0xb0>
          freeproc(pp);
    80202720:	8526                	mv	a0,s1
    80202722:	fffff097          	auipc	ra,0xfffff
    80202726:	524080e7          	jalr	1316(ra) # 80201c46 <freeproc>
          release(&pp->lock);
    8020272a:	8526                	mv	a0,s1
    8020272c:	ffffe097          	auipc	ra,0xffffe
    80202730:	ff0080e7          	jalr	-16(ra) # 8020071c <release>
          release(&p->lock);
    80202734:	854a                	mv	a0,s2
    80202736:	ffffe097          	auipc	ra,0xffffe
    8020273a:	fe6080e7          	jalr	-26(ra) # 8020071c <release>
          return pid;
    8020273e:	b741                	j	802026be <waitpid+0x2e>
            release(&pp->lock);
    80202740:	8526                	mv	a0,s1
    80202742:	ffffe097          	auipc	ra,0xffffe
    80202746:	fda080e7          	jalr	-38(ra) # 8020071c <release>
            release(&p->lock);
    8020274a:	854a                	mv	a0,s2
    8020274c:	ffffe097          	auipc	ra,0xffffe
    80202750:	fd0080e7          	jalr	-48(ra) # 8020071c <release>
            return -1;
    80202754:	59fd                	li	s3,-1
    80202756:	b7a5                	j	802026be <waitpid+0x2e>
    for (pp = proc; pp < &proc[NPROC]; pp++)
    80202758:	4f848493          	addi	s1,s1,1272
    8020275c:	03348763          	beq	s1,s3,8020278a <waitpid+0xfa>
      if (pp->parent == p && pp->pid == cpid)
    80202760:	709c                	ld	a5,32(s1)
    80202762:	ff279be3          	bne	a5,s2,80202758 <waitpid+0xc8>
    80202766:	5c9c                	lw	a5,56(s1)
    80202768:	ff4798e3          	bne	a5,s4,80202758 <waitpid+0xc8>
        acquire(&pp->lock);
    8020276c:	8526                	mv	a0,s1
    8020276e:	ffffe097          	auipc	ra,0xffffe
    80202772:	f5a080e7          	jalr	-166(ra) # 802006c8 <acquire>
        if (pp->state == ZOMBIE)
    80202776:	4c9c                	lw	a5,24(s1)
    80202778:	f95784e3          	beq	a5,s5,80202700 <waitpid+0x70>
        release(&pp->lock);
    8020277c:	8526                	mv	a0,s1
    8020277e:	ffffe097          	auipc	ra,0xffffe
    80202782:	f9e080e7          	jalr	-98(ra) # 8020071c <release>
        havekids = 1;
    80202786:	875a                	mv	a4,s6
    80202788:	bfc1                	j	80202758 <waitpid+0xc8>
    if (!havekids || p->killed)
    8020278a:	c305                	beqz	a4,802027aa <waitpid+0x11a>
    8020278c:	03092783          	lw	a5,48(s2)
    80202790:	ef89                	bnez	a5,802027aa <waitpid+0x11a>
    sleep(p, &p->lock); // DOC: wait-sleep
    80202792:	85e6                	mv	a1,s9
    80202794:	854a                	mv	a0,s2
    80202796:	00000097          	auipc	ra,0x0
    8020279a:	b38080e7          	jalr	-1224(ra) # 802022ce <sleep>
    havekids = 0;
    8020279e:	8762                	mv	a4,s8
    for (pp = proc; pp < &proc[NPROC]; pp++)
    802027a0:	00014497          	auipc	s1,0x14
    802027a4:	9e048493          	addi	s1,s1,-1568 # 80216180 <proc>
    802027a8:	bf65                	j	80202760 <waitpid+0xd0>
      release(&p->lock);
    802027aa:	854a                	mv	a0,s2
    802027ac:	ffffe097          	auipc	ra,0xffffe
    802027b0:	f70080e7          	jalr	-144(ra) # 8020071c <release>
      panic("current process do not have child process [cpid]");
    802027b4:	00008517          	auipc	a0,0x8
    802027b8:	f1c50513          	addi	a0,a0,-228 # 8020a6d0 <digits+0x350>
    802027bc:	ffffe097          	auipc	ra,0xffffe
    802027c0:	986080e7          	jalr	-1658(ra) # 80200142 <panic>

00000000802027c4 <swtch>:
    802027c4:	00153023          	sd	ra,0(a0)
    802027c8:	00253423          	sd	sp,8(a0)
    802027cc:	e900                	sd	s0,16(a0)
    802027ce:	ed04                	sd	s1,24(a0)
    802027d0:	03253023          	sd	s2,32(a0)
    802027d4:	03353423          	sd	s3,40(a0)
    802027d8:	03453823          	sd	s4,48(a0)
    802027dc:	03553c23          	sd	s5,56(a0)
    802027e0:	05653023          	sd	s6,64(a0)
    802027e4:	05753423          	sd	s7,72(a0)
    802027e8:	05853823          	sd	s8,80(a0)
    802027ec:	05953c23          	sd	s9,88(a0)
    802027f0:	07a53023          	sd	s10,96(a0)
    802027f4:	07b53423          	sd	s11,104(a0)
    802027f8:	0005b083          	ld	ra,0(a1)
    802027fc:	0085b103          	ld	sp,8(a1)
    80202800:	6980                	ld	s0,16(a1)
    80202802:	6d84                	ld	s1,24(a1)
    80202804:	0205b903          	ld	s2,32(a1)
    80202808:	0285b983          	ld	s3,40(a1)
    8020280c:	0305ba03          	ld	s4,48(a1)
    80202810:	0385ba83          	ld	s5,56(a1)
    80202814:	0405bb03          	ld	s6,64(a1)
    80202818:	0485bb83          	ld	s7,72(a1)
    8020281c:	0505bc03          	ld	s8,80(a1)
    80202820:	0585bc83          	ld	s9,88(a1)
    80202824:	0605bd03          	ld	s10,96(a1)
    80202828:	0685bd83          	ld	s11,104(a1)
    8020282c:	8082                	ret

000000008020282e <trapinithart>:
// }

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    8020282e:	1141                	addi	sp,sp,-16
    80202830:	e406                	sd	ra,8(sp)
    80202832:	e022                	sd	s0,0(sp)
    80202834:	0800                	addi	s0,sp,16
  asm volatile("csrw stvec, %0" : : "r" (x));
    80202836:	0000b797          	auipc	a5,0xb
    8020283a:	89a7b783          	ld	a5,-1894(a5) # 8020d0d0 <_GLOBAL_OFFSET_TABLE_+0x20>
    8020283e:	10579073          	csrw	stvec,a5
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202842:	100027f3          	csrr	a5,sstatus
  w_stvec((uint64)kernelvec);
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202846:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8020284a:	10079073          	csrw	sstatus,a5
  asm volatile("csrr %0, sie" : "=r" (x) );
    8020284e:	104027f3          	csrr	a5,sie
  // enable supervisor-mode timer interrupts.
  w_sie(r_sie() | SIE_SEIE | SIE_SSIE | SIE_STIE);
    80202852:	2227e793          	ori	a5,a5,546
  asm volatile("csrw sie, %0" : : "r" (x));
    80202856:	10479073          	csrw	sie,a5
  set_next_timeout();
    8020285a:	00003097          	auipc	ra,0x3
    8020285e:	38c080e7          	jalr	908(ra) # 80205be6 <set_next_timeout>
  #ifdef DEBUG
  printf("trapinithart\n");
  #endif
}
    80202862:	60a2                	ld	ra,8(sp)
    80202864:	6402                	ld	s0,0(sp)
    80202866:	0141                	addi	sp,sp,16
    80202868:	8082                	ret

000000008020286a <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    8020286a:	1141                	addi	sp,sp,-16
    8020286c:	e406                	sd	ra,8(sp)
    8020286e:	e022                	sd	s0,0(sp)
    80202870:	0800                	addi	s0,sp,16
  struct proc *p = myproc();
    80202872:	fffff097          	auipc	ra,0xfffff
    80202876:	202080e7          	jalr	514(ra) # 80201a74 <myproc>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8020287a:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    8020287e:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202880:	10079073          	csrw	sstatus,a5
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    80202884:	0000b617          	auipc	a2,0xb
    80202888:	83463603          	ld	a2,-1996(a2) # 8020d0b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    8020288c:	0000b697          	auipc	a3,0xb
    80202890:	86c6b683          	ld	a3,-1940(a3) # 8020d0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
    80202894:	8e91                	sub	a3,a3,a2
    80202896:	040007b7          	lui	a5,0x4000
    8020289a:	17fd                	addi	a5,a5,-1
    8020289c:	07b2                	slli	a5,a5,0xc
    8020289e:	96be                	add	a3,a3,a5
  asm volatile("csrw stvec, %0" : : "r" (x));
    802028a0:	10569073          	csrw	stvec,a3

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    802028a4:	7138                	ld	a4,96(a0)
  asm volatile("csrr %0, satp" : "=r" (x) );
    802028a6:	180026f3          	csrr	a3,satp
    802028aa:	e314                	sd	a3,0(a4)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    802028ac:	7138                	ld	a4,96(a0)
    802028ae:	6134                	ld	a3,64(a0)
    802028b0:	6585                	lui	a1,0x1
    802028b2:	96ae                	add	a3,a3,a1
    802028b4:	e714                	sd	a3,8(a4)
  p->trapframe->kernel_trap = (uint64)usertrap;
    802028b6:	7138                	ld	a4,96(a0)
    802028b8:	00000697          	auipc	a3,0x0
    802028bc:	0f468693          	addi	a3,a3,244 # 802029ac <usertrap>
    802028c0:	eb14                	sd	a3,16(a4)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    802028c2:	7138                	ld	a4,96(a0)
  asm volatile("mv %0, tp" : "=r" (x) );
    802028c4:	8692                	mv	a3,tp
    802028c6:	f314                	sd	a3,32(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802028c8:	100026f3          	csrr	a3,sstatus
  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    802028cc:	eff6f693          	andi	a3,a3,-257
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    802028d0:	0206e693          	ori	a3,a3,32
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802028d4:	10069073          	csrw	sstatus,a3
  w_sstatus(x);

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    802028d8:	7138                	ld	a4,96(a0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    802028da:	6f18                	ld	a4,24(a4)
    802028dc:	14171073          	csrw	sepc,a4

  // tell trampoline.S the user page table to switch to.
  // printf("[usertrapret]p->pagetable: %p\n", p->pagetable);
  uint64 satp = MAKE_SATP(p->pagetable);
    802028e0:	692c                	ld	a1,80(a0)
    802028e2:	81b1                	srli	a1,a1,0xc

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    802028e4:	0000a717          	auipc	a4,0xa
    802028e8:	7e473703          	ld	a4,2020(a4) # 8020d0c8 <_GLOBAL_OFFSET_TABLE_+0x18>
    802028ec:	8f11                	sub	a4,a4,a2
    802028ee:	97ba                	add	a5,a5,a4
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    802028f0:	577d                	li	a4,-1
    802028f2:	177e                	slli	a4,a4,0x3f
    802028f4:	8dd9                	or	a1,a1,a4
    802028f6:	02000537          	lui	a0,0x2000
    802028fa:	157d                	addi	a0,a0,-1
    802028fc:	0536                	slli	a0,a0,0xd
    802028fe:	9782                	jalr	a5
}
    80202900:	60a2                	ld	ra,8(sp)
    80202902:	6402                	ld	s0,0(sp)
    80202904:	0141                	addi	sp,sp,16
    80202906:	8082                	ret

0000000080202908 <devintr>:
// Check if it's an external/software interrupt, 
// and handle it. 
// returns  2 if timer interrupt, 
//          1 if other device, 
//          0 if not recognized. 
int devintr(void) {
    80202908:	1101                	addi	sp,sp,-32
    8020290a:	ec06                	sd	ra,24(sp)
    8020290c:	e822                	sd	s0,16(sp)
    8020290e:	e426                	sd	s1,8(sp)
    80202910:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202912:	14202773          	csrr	a4,scause
	uint64 scause = r_scause();

	#ifdef QEMU 
	// handle external interrupt 
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    80202916:	00074d63          	bltz	a4,80202930 <devintr+0x28>
		sbi_set_mie();
		#endif 

		return 1;
	}
	else if (0x8000000000000005L == scause) {
    8020291a:	57fd                	li	a5,-1
    8020291c:	17fe                	slli	a5,a5,0x3f
    8020291e:	0795                	addi	a5,a5,5
		timer_tick();
		return 2;
	}
	else { return 0;}
    80202920:	4501                	li	a0,0
	else if (0x8000000000000005L == scause) {
    80202922:	06f70f63          	beq	a4,a5,802029a0 <devintr+0x98>
}
    80202926:	60e2                	ld	ra,24(sp)
    80202928:	6442                	ld	s0,16(sp)
    8020292a:	64a2                	ld	s1,8(sp)
    8020292c:	6105                	addi	sp,sp,32
    8020292e:	8082                	ret
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    80202930:	0ff77793          	andi	a5,a4,255
    80202934:	46a5                	li	a3,9
    80202936:	fed792e3          	bne	a5,a3,8020291a <devintr+0x12>
		int irq = plic_claim();
    8020293a:	00005097          	auipc	ra,0x5
    8020293e:	cf6080e7          	jalr	-778(ra) # 80207630 <plic_claim>
    80202942:	84aa                	mv	s1,a0
		if (UART_IRQ == irq) {
    80202944:	47a9                	li	a5,10
    80202946:	02f50163          	beq	a0,a5,80202968 <devintr+0x60>
		else if (DISK_IRQ == irq) {
    8020294a:	4785                	li	a5,1
    8020294c:	04f50563          	beq	a0,a5,80202996 <devintr+0x8e>
		return 1;
    80202950:	4505                	li	a0,1
		else if (irq) {
    80202952:	d8f1                	beqz	s1,80202926 <devintr+0x1e>
			printf("unexpected interrupt irq = %d\n", irq);
    80202954:	85a6                	mv	a1,s1
    80202956:	00008517          	auipc	a0,0x8
    8020295a:	dda50513          	addi	a0,a0,-550 # 8020a730 <digits+0x3b0>
    8020295e:	ffffe097          	auipc	ra,0xffffe
    80202962:	82e080e7          	jalr	-2002(ra) # 8020018c <printf>
    80202966:	a821                	j	8020297e <devintr+0x76>
	return SBI_CALL_0(SBI_CONSOLE_GETCHAR);
    80202968:	4501                	li	a0,0
    8020296a:	4581                	li	a1,0
    8020296c:	4601                	li	a2,0
    8020296e:	4681                	li	a3,0
    80202970:	4889                	li	a7,2
    80202972:	00000073          	ecall
    80202976:	2501                	sext.w	a0,a0
			if (-1 != c) {
    80202978:	57fd                	li	a5,-1
    8020297a:	00f51963          	bne	a0,a5,8020298c <devintr+0x84>
		if (irq) { plic_complete(irq);}
    8020297e:	8526                	mv	a0,s1
    80202980:	00005097          	auipc	ra,0x5
    80202984:	cda080e7          	jalr	-806(ra) # 8020765a <plic_complete>
		return 1;
    80202988:	4505                	li	a0,1
    8020298a:	bf71                	j	80202926 <devintr+0x1e>
				consoleintr(c);
    8020298c:	00005097          	auipc	ra,0x5
    80202990:	ee6080e7          	jalr	-282(ra) # 80207872 <consoleintr>
    80202994:	b7ed                	j	8020297e <devintr+0x76>
			disk_intr();
    80202996:	00003097          	auipc	ra,0x3
    8020299a:	310080e7          	jalr	784(ra) # 80205ca6 <disk_intr>
    8020299e:	b7c5                	j	8020297e <devintr+0x76>
		timer_tick();
    802029a0:	00003097          	auipc	ra,0x3
    802029a4:	26c080e7          	jalr	620(ra) # 80205c0c <timer_tick>
		return 2;
    802029a8:	4509                	li	a0,2
    802029aa:	bfb5                	j	80202926 <devintr+0x1e>

00000000802029ac <usertrap>:
{
    802029ac:	1101                	addi	sp,sp,-32
    802029ae:	ec06                	sd	ra,24(sp)
    802029b0:	e822                	sd	s0,16(sp)
    802029b2:	e426                	sd	s1,8(sp)
    802029b4:	e04a                	sd	s2,0(sp)
    802029b6:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802029b8:	100027f3          	csrr	a5,sstatus
  if((r_sstatus() & SSTATUS_SPP) != 0)
    802029bc:	1007f793          	andi	a5,a5,256
    802029c0:	e3ad                	bnez	a5,80202a22 <usertrap+0x76>
  asm volatile("csrw stvec, %0" : : "r" (x));
    802029c2:	0000a797          	auipc	a5,0xa
    802029c6:	70e7b783          	ld	a5,1806(a5) # 8020d0d0 <_GLOBAL_OFFSET_TABLE_+0x20>
    802029ca:	10579073          	csrw	stvec,a5
  struct proc *p = myproc();
    802029ce:	fffff097          	auipc	ra,0xfffff
    802029d2:	0a6080e7          	jalr	166(ra) # 80201a74 <myproc>
    802029d6:	84aa                	mv	s1,a0
  p->trapframe->epc = r_sepc();
    802029d8:	713c                	ld	a5,96(a0)
  asm volatile("csrr %0, sepc" : "=r" (x) );
    802029da:	14102773          	csrr	a4,sepc
    802029de:	ef98                	sd	a4,24(a5)
  asm volatile("csrr %0, scause" : "=r" (x) );
    802029e0:	14202773          	csrr	a4,scause
  if(r_scause() == 8){
    802029e4:	47a1                	li	a5,8
    802029e6:	04f71c63          	bne	a4,a5,80202a3e <usertrap+0x92>
    if(p->killed)
    802029ea:	591c                	lw	a5,48(a0)
    802029ec:	e3b9                	bnez	a5,80202a32 <usertrap+0x86>
    p->trapframe->epc += 4;
    802029ee:	70b8                	ld	a4,96(s1)
    802029f0:	6f1c                	ld	a5,24(a4)
    802029f2:	0791                	addi	a5,a5,4
    802029f4:	ef1c                	sd	a5,24(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802029f6:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    802029fa:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802029fe:	10079073          	csrw	sstatus,a5
    syscall();
    80202a02:	00000097          	auipc	ra,0x0
    80202a06:	5d4080e7          	jalr	1492(ra) # 80202fd6 <syscall>
  if(p->killed)
    80202a0a:	589c                	lw	a5,48(s1)
    80202a0c:	ebd1                	bnez	a5,80202aa0 <usertrap+0xf4>
  usertrapret();
    80202a0e:	00000097          	auipc	ra,0x0
    80202a12:	e5c080e7          	jalr	-420(ra) # 8020286a <usertrapret>
}
    80202a16:	60e2                	ld	ra,24(sp)
    80202a18:	6442                	ld	s0,16(sp)
    80202a1a:	64a2                	ld	s1,8(sp)
    80202a1c:	6902                	ld	s2,0(sp)
    80202a1e:	6105                	addi	sp,sp,32
    80202a20:	8082                	ret
    panic("usertrap: not from user mode");
    80202a22:	00008517          	auipc	a0,0x8
    80202a26:	d2e50513          	addi	a0,a0,-722 # 8020a750 <digits+0x3d0>
    80202a2a:	ffffd097          	auipc	ra,0xffffd
    80202a2e:	718080e7          	jalr	1816(ra) # 80200142 <panic>
      exit(-1);
    80202a32:	557d                	li	a0,-1
    80202a34:	fffff097          	auipc	ra,0xfffff
    80202a38:	774080e7          	jalr	1908(ra) # 802021a8 <exit>
    80202a3c:	bf4d                	j	802029ee <usertrap+0x42>
  else if((which_dev = devintr()) != 0){
    80202a3e:	00000097          	auipc	ra,0x0
    80202a42:	eca080e7          	jalr	-310(ra) # 80202908 <devintr>
    80202a46:	892a                	mv	s2,a0
    80202a48:	c501                	beqz	a0,80202a50 <usertrap+0xa4>
  if(p->killed)
    80202a4a:	589c                	lw	a5,48(s1)
    80202a4c:	c3b1                	beqz	a5,80202a90 <usertrap+0xe4>
    80202a4e:	a825                	j	80202a86 <usertrap+0xda>
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202a50:	142025f3          	csrr	a1,scause
    printf("\nusertrap(): unexpected scause %p pid=%d %s\n", r_scause(), p->pid, p->name);
    80202a54:	4e048693          	addi	a3,s1,1248
    80202a58:	5c90                	lw	a2,56(s1)
    80202a5a:	00008517          	auipc	a0,0x8
    80202a5e:	d1650513          	addi	a0,a0,-746 # 8020a770 <digits+0x3f0>
    80202a62:	ffffd097          	auipc	ra,0xffffd
    80202a66:	72a080e7          	jalr	1834(ra) # 8020018c <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202a6a:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202a6e:	14302673          	csrr	a2,stval
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80202a72:	00008517          	auipc	a0,0x8
    80202a76:	d2e50513          	addi	a0,a0,-722 # 8020a7a0 <digits+0x420>
    80202a7a:	ffffd097          	auipc	ra,0xffffd
    80202a7e:	712080e7          	jalr	1810(ra) # 8020018c <printf>
    p->killed = 1;
    80202a82:	4785                	li	a5,1
    80202a84:	d89c                	sw	a5,48(s1)
    exit(-1);
    80202a86:	557d                	li	a0,-1
    80202a88:	fffff097          	auipc	ra,0xfffff
    80202a8c:	720080e7          	jalr	1824(ra) # 802021a8 <exit>
  if(which_dev == 2)
    80202a90:	4789                	li	a5,2
    80202a92:	f6f91ee3          	bne	s2,a5,80202a0e <usertrap+0x62>
    yield();
    80202a96:	fffff097          	auipc	ra,0xfffff
    80202a9a:	7fc080e7          	jalr	2044(ra) # 80202292 <yield>
    80202a9e:	bf85                	j	80202a0e <usertrap+0x62>
  int which_dev = 0;
    80202aa0:	4901                	li	s2,0
    80202aa2:	b7d5                	j	80202a86 <usertrap+0xda>

0000000080202aa4 <kerneltrap>:
kerneltrap() {
    80202aa4:	7179                	addi	sp,sp,-48
    80202aa6:	f406                	sd	ra,40(sp)
    80202aa8:	f022                	sd	s0,32(sp)
    80202aaa:	ec26                	sd	s1,24(sp)
    80202aac:	e84a                	sd	s2,16(sp)
    80202aae:	e44e                	sd	s3,8(sp)
    80202ab0:	1800                	addi	s0,sp,48
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202ab2:	14102973          	csrr	s2,sepc
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202ab6:	100024f3          	csrr	s1,sstatus
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202aba:	142029f3          	csrr	s3,scause
  if((sstatus & SSTATUS_SPP) == 0)
    80202abe:	1004f793          	andi	a5,s1,256
    80202ac2:	cb85                	beqz	a5,80202af2 <kerneltrap+0x4e>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202ac4:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80202ac8:	8b89                	andi	a5,a5,2
  if(intr_get() != 0)
    80202aca:	ef85                	bnez	a5,80202b02 <kerneltrap+0x5e>
  if((which_dev = devintr()) == 0){
    80202acc:	00000097          	auipc	ra,0x0
    80202ad0:	e3c080e7          	jalr	-452(ra) # 80202908 <devintr>
    80202ad4:	cd1d                	beqz	a0,80202b12 <kerneltrap+0x6e>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202ad6:	4789                	li	a5,2
    80202ad8:	08f50b63          	beq	a0,a5,80202b6e <kerneltrap+0xca>
  asm volatile("csrw sepc, %0" : : "r" (x));
    80202adc:	14191073          	csrw	sepc,s2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202ae0:	10049073          	csrw	sstatus,s1
}
    80202ae4:	70a2                	ld	ra,40(sp)
    80202ae6:	7402                	ld	s0,32(sp)
    80202ae8:	64e2                	ld	s1,24(sp)
    80202aea:	6942                	ld	s2,16(sp)
    80202aec:	69a2                	ld	s3,8(sp)
    80202aee:	6145                	addi	sp,sp,48
    80202af0:	8082                	ret
    panic("kerneltrap: not from supervisor mode");
    80202af2:	00008517          	auipc	a0,0x8
    80202af6:	cce50513          	addi	a0,a0,-818 # 8020a7c0 <digits+0x440>
    80202afa:	ffffd097          	auipc	ra,0xffffd
    80202afe:	648080e7          	jalr	1608(ra) # 80200142 <panic>
    panic("kerneltrap: interrupts enabled");
    80202b02:	00008517          	auipc	a0,0x8
    80202b06:	ce650513          	addi	a0,a0,-794 # 8020a7e8 <digits+0x468>
    80202b0a:	ffffd097          	auipc	ra,0xffffd
    80202b0e:	638080e7          	jalr	1592(ra) # 80200142 <panic>
    printf("\nscause %p\n", scause);
    80202b12:	85ce                	mv	a1,s3
    80202b14:	00008517          	auipc	a0,0x8
    80202b18:	cf450513          	addi	a0,a0,-780 # 8020a808 <digits+0x488>
    80202b1c:	ffffd097          	auipc	ra,0xffffd
    80202b20:	670080e7          	jalr	1648(ra) # 8020018c <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202b24:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202b28:	14302673          	csrr	a2,stval
  asm volatile("mv %0, tp" : "=r" (x) );
    80202b2c:	8692                	mv	a3,tp
    printf("sepc=%p stval=%p hart=%d\n", r_sepc(), r_stval(), r_tp());
    80202b2e:	00008517          	auipc	a0,0x8
    80202b32:	cea50513          	addi	a0,a0,-790 # 8020a818 <digits+0x498>
    80202b36:	ffffd097          	auipc	ra,0xffffd
    80202b3a:	656080e7          	jalr	1622(ra) # 8020018c <printf>
    struct proc *p = myproc();
    80202b3e:	fffff097          	auipc	ra,0xfffff
    80202b42:	f36080e7          	jalr	-202(ra) # 80201a74 <myproc>
    if (p != 0) {
    80202b46:	cd01                	beqz	a0,80202b5e <kerneltrap+0xba>
      printf("pid: %d, name: %s\n", p->pid, p->name);
    80202b48:	4e050613          	addi	a2,a0,1248
    80202b4c:	5d0c                	lw	a1,56(a0)
    80202b4e:	00008517          	auipc	a0,0x8
    80202b52:	cea50513          	addi	a0,a0,-790 # 8020a838 <digits+0x4b8>
    80202b56:	ffffd097          	auipc	ra,0xffffd
    80202b5a:	636080e7          	jalr	1590(ra) # 8020018c <printf>
    panic("kerneltrap");
    80202b5e:	00008517          	auipc	a0,0x8
    80202b62:	cf250513          	addi	a0,a0,-782 # 8020a850 <digits+0x4d0>
    80202b66:	ffffd097          	auipc	ra,0xffffd
    80202b6a:	5dc080e7          	jalr	1500(ra) # 80200142 <panic>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202b6e:	fffff097          	auipc	ra,0xfffff
    80202b72:	f06080e7          	jalr	-250(ra) # 80201a74 <myproc>
    80202b76:	d13d                	beqz	a0,80202adc <kerneltrap+0x38>
    80202b78:	fffff097          	auipc	ra,0xfffff
    80202b7c:	efc080e7          	jalr	-260(ra) # 80201a74 <myproc>
    80202b80:	4d18                	lw	a4,24(a0)
    80202b82:	478d                	li	a5,3
    80202b84:	f4f71ce3          	bne	a4,a5,80202adc <kerneltrap+0x38>
    yield();
    80202b88:	fffff097          	auipc	ra,0xfffff
    80202b8c:	70a080e7          	jalr	1802(ra) # 80202292 <yield>
    80202b90:	b7b1                	j	80202adc <kerneltrap+0x38>

0000000080202b92 <trapframedump>:

void trapframedump(struct trapframe *tf)
{
    80202b92:	1101                	addi	sp,sp,-32
    80202b94:	ec06                	sd	ra,24(sp)
    80202b96:	e822                	sd	s0,16(sp)
    80202b98:	e426                	sd	s1,8(sp)
    80202b9a:	1000                	addi	s0,sp,32
    80202b9c:	84aa                	mv	s1,a0
  printf("a0: %p\t", tf->a0);
    80202b9e:	792c                	ld	a1,112(a0)
    80202ba0:	00008517          	auipc	a0,0x8
    80202ba4:	cc050513          	addi	a0,a0,-832 # 8020a860 <digits+0x4e0>
    80202ba8:	ffffd097          	auipc	ra,0xffffd
    80202bac:	5e4080e7          	jalr	1508(ra) # 8020018c <printf>
  printf("a1: %p\t", tf->a1);
    80202bb0:	7cac                	ld	a1,120(s1)
    80202bb2:	00008517          	auipc	a0,0x8
    80202bb6:	cb650513          	addi	a0,a0,-842 # 8020a868 <digits+0x4e8>
    80202bba:	ffffd097          	auipc	ra,0xffffd
    80202bbe:	5d2080e7          	jalr	1490(ra) # 8020018c <printf>
  printf("a2: %p\t", tf->a2);
    80202bc2:	60cc                	ld	a1,128(s1)
    80202bc4:	00008517          	auipc	a0,0x8
    80202bc8:	cac50513          	addi	a0,a0,-852 # 8020a870 <digits+0x4f0>
    80202bcc:	ffffd097          	auipc	ra,0xffffd
    80202bd0:	5c0080e7          	jalr	1472(ra) # 8020018c <printf>
  printf("a3: %p\n", tf->a3);
    80202bd4:	64cc                	ld	a1,136(s1)
    80202bd6:	00008517          	auipc	a0,0x8
    80202bda:	ca250513          	addi	a0,a0,-862 # 8020a878 <digits+0x4f8>
    80202bde:	ffffd097          	auipc	ra,0xffffd
    80202be2:	5ae080e7          	jalr	1454(ra) # 8020018c <printf>
  printf("a4: %p\t", tf->a4);
    80202be6:	68cc                	ld	a1,144(s1)
    80202be8:	00008517          	auipc	a0,0x8
    80202bec:	c9850513          	addi	a0,a0,-872 # 8020a880 <digits+0x500>
    80202bf0:	ffffd097          	auipc	ra,0xffffd
    80202bf4:	59c080e7          	jalr	1436(ra) # 8020018c <printf>
  printf("a5: %p\t", tf->a5);
    80202bf8:	6ccc                	ld	a1,152(s1)
    80202bfa:	00008517          	auipc	a0,0x8
    80202bfe:	c8e50513          	addi	a0,a0,-882 # 8020a888 <digits+0x508>
    80202c02:	ffffd097          	auipc	ra,0xffffd
    80202c06:	58a080e7          	jalr	1418(ra) # 8020018c <printf>
  printf("a6: %p\t", tf->a6);
    80202c0a:	70cc                	ld	a1,160(s1)
    80202c0c:	00008517          	auipc	a0,0x8
    80202c10:	c8450513          	addi	a0,a0,-892 # 8020a890 <digits+0x510>
    80202c14:	ffffd097          	auipc	ra,0xffffd
    80202c18:	578080e7          	jalr	1400(ra) # 8020018c <printf>
  printf("a7: %p\n", tf->a7);
    80202c1c:	74cc                	ld	a1,168(s1)
    80202c1e:	00008517          	auipc	a0,0x8
    80202c22:	c7a50513          	addi	a0,a0,-902 # 8020a898 <digits+0x518>
    80202c26:	ffffd097          	auipc	ra,0xffffd
    80202c2a:	566080e7          	jalr	1382(ra) # 8020018c <printf>
  printf("t0: %p\t", tf->t0);
    80202c2e:	64ac                	ld	a1,72(s1)
    80202c30:	00008517          	auipc	a0,0x8
    80202c34:	c7050513          	addi	a0,a0,-912 # 8020a8a0 <digits+0x520>
    80202c38:	ffffd097          	auipc	ra,0xffffd
    80202c3c:	554080e7          	jalr	1364(ra) # 8020018c <printf>
  printf("t1: %p\t", tf->t1);
    80202c40:	68ac                	ld	a1,80(s1)
    80202c42:	00008517          	auipc	a0,0x8
    80202c46:	c6650513          	addi	a0,a0,-922 # 8020a8a8 <digits+0x528>
    80202c4a:	ffffd097          	auipc	ra,0xffffd
    80202c4e:	542080e7          	jalr	1346(ra) # 8020018c <printf>
  printf("t2: %p\t", tf->t2);
    80202c52:	6cac                	ld	a1,88(s1)
    80202c54:	00008517          	auipc	a0,0x8
    80202c58:	c5c50513          	addi	a0,a0,-932 # 8020a8b0 <digits+0x530>
    80202c5c:	ffffd097          	auipc	ra,0xffffd
    80202c60:	530080e7          	jalr	1328(ra) # 8020018c <printf>
  printf("t3: %p\n", tf->t3);
    80202c64:	1004b583          	ld	a1,256(s1)
    80202c68:	00008517          	auipc	a0,0x8
    80202c6c:	c5050513          	addi	a0,a0,-944 # 8020a8b8 <digits+0x538>
    80202c70:	ffffd097          	auipc	ra,0xffffd
    80202c74:	51c080e7          	jalr	1308(ra) # 8020018c <printf>
  printf("t4: %p\t", tf->t4);
    80202c78:	1084b583          	ld	a1,264(s1)
    80202c7c:	00008517          	auipc	a0,0x8
    80202c80:	c4450513          	addi	a0,a0,-956 # 8020a8c0 <digits+0x540>
    80202c84:	ffffd097          	auipc	ra,0xffffd
    80202c88:	508080e7          	jalr	1288(ra) # 8020018c <printf>
  printf("t5: %p\t", tf->t5);
    80202c8c:	1104b583          	ld	a1,272(s1)
    80202c90:	00008517          	auipc	a0,0x8
    80202c94:	c3850513          	addi	a0,a0,-968 # 8020a8c8 <digits+0x548>
    80202c98:	ffffd097          	auipc	ra,0xffffd
    80202c9c:	4f4080e7          	jalr	1268(ra) # 8020018c <printf>
  printf("t6: %p\t", tf->t6);
    80202ca0:	1184b583          	ld	a1,280(s1)
    80202ca4:	00008517          	auipc	a0,0x8
    80202ca8:	c2c50513          	addi	a0,a0,-980 # 8020a8d0 <digits+0x550>
    80202cac:	ffffd097          	auipc	ra,0xffffd
    80202cb0:	4e0080e7          	jalr	1248(ra) # 8020018c <printf>
  printf("s0: %p\n", tf->s0);
    80202cb4:	70ac                	ld	a1,96(s1)
    80202cb6:	00008517          	auipc	a0,0x8
    80202cba:	c2250513          	addi	a0,a0,-990 # 8020a8d8 <digits+0x558>
    80202cbe:	ffffd097          	auipc	ra,0xffffd
    80202cc2:	4ce080e7          	jalr	1230(ra) # 8020018c <printf>
  printf("s1: %p\t", tf->s1);
    80202cc6:	74ac                	ld	a1,104(s1)
    80202cc8:	00008517          	auipc	a0,0x8
    80202ccc:	c1850513          	addi	a0,a0,-1000 # 8020a8e0 <digits+0x560>
    80202cd0:	ffffd097          	auipc	ra,0xffffd
    80202cd4:	4bc080e7          	jalr	1212(ra) # 8020018c <printf>
  printf("s2: %p\t", tf->s2);
    80202cd8:	78cc                	ld	a1,176(s1)
    80202cda:	00008517          	auipc	a0,0x8
    80202cde:	c0e50513          	addi	a0,a0,-1010 # 8020a8e8 <digits+0x568>
    80202ce2:	ffffd097          	auipc	ra,0xffffd
    80202ce6:	4aa080e7          	jalr	1194(ra) # 8020018c <printf>
  printf("s3: %p\t", tf->s3);
    80202cea:	7ccc                	ld	a1,184(s1)
    80202cec:	00008517          	auipc	a0,0x8
    80202cf0:	c0450513          	addi	a0,a0,-1020 # 8020a8f0 <digits+0x570>
    80202cf4:	ffffd097          	auipc	ra,0xffffd
    80202cf8:	498080e7          	jalr	1176(ra) # 8020018c <printf>
  printf("s4: %p\n", tf->s4);
    80202cfc:	60ec                	ld	a1,192(s1)
    80202cfe:	00008517          	auipc	a0,0x8
    80202d02:	bfa50513          	addi	a0,a0,-1030 # 8020a8f8 <digits+0x578>
    80202d06:	ffffd097          	auipc	ra,0xffffd
    80202d0a:	486080e7          	jalr	1158(ra) # 8020018c <printf>
  printf("s5: %p\t", tf->s5);
    80202d0e:	64ec                	ld	a1,200(s1)
    80202d10:	00008517          	auipc	a0,0x8
    80202d14:	bf050513          	addi	a0,a0,-1040 # 8020a900 <digits+0x580>
    80202d18:	ffffd097          	auipc	ra,0xffffd
    80202d1c:	474080e7          	jalr	1140(ra) # 8020018c <printf>
  printf("s6: %p\t", tf->s6);
    80202d20:	68ec                	ld	a1,208(s1)
    80202d22:	00008517          	auipc	a0,0x8
    80202d26:	be650513          	addi	a0,a0,-1050 # 8020a908 <digits+0x588>
    80202d2a:	ffffd097          	auipc	ra,0xffffd
    80202d2e:	462080e7          	jalr	1122(ra) # 8020018c <printf>
  printf("s7: %p\t", tf->s7);
    80202d32:	6cec                	ld	a1,216(s1)
    80202d34:	00008517          	auipc	a0,0x8
    80202d38:	bdc50513          	addi	a0,a0,-1060 # 8020a910 <digits+0x590>
    80202d3c:	ffffd097          	auipc	ra,0xffffd
    80202d40:	450080e7          	jalr	1104(ra) # 8020018c <printf>
  printf("s8: %p\n", tf->s8);
    80202d44:	70ec                	ld	a1,224(s1)
    80202d46:	00008517          	auipc	a0,0x8
    80202d4a:	bd250513          	addi	a0,a0,-1070 # 8020a918 <digits+0x598>
    80202d4e:	ffffd097          	auipc	ra,0xffffd
    80202d52:	43e080e7          	jalr	1086(ra) # 8020018c <printf>
  printf("s9: %p\t", tf->s9);
    80202d56:	74ec                	ld	a1,232(s1)
    80202d58:	00008517          	auipc	a0,0x8
    80202d5c:	bc850513          	addi	a0,a0,-1080 # 8020a920 <digits+0x5a0>
    80202d60:	ffffd097          	auipc	ra,0xffffd
    80202d64:	42c080e7          	jalr	1068(ra) # 8020018c <printf>
  printf("s10: %p\t", tf->s10);
    80202d68:	78ec                	ld	a1,240(s1)
    80202d6a:	00008517          	auipc	a0,0x8
    80202d6e:	bbe50513          	addi	a0,a0,-1090 # 8020a928 <digits+0x5a8>
    80202d72:	ffffd097          	auipc	ra,0xffffd
    80202d76:	41a080e7          	jalr	1050(ra) # 8020018c <printf>
  printf("s11: %p\t", tf->s11);
    80202d7a:	7cec                	ld	a1,248(s1)
    80202d7c:	00008517          	auipc	a0,0x8
    80202d80:	bbc50513          	addi	a0,a0,-1092 # 8020a938 <digits+0x5b8>
    80202d84:	ffffd097          	auipc	ra,0xffffd
    80202d88:	408080e7          	jalr	1032(ra) # 8020018c <printf>
  printf("ra: %p\n", tf->ra);
    80202d8c:	748c                	ld	a1,40(s1)
    80202d8e:	00008517          	auipc	a0,0x8
    80202d92:	88250513          	addi	a0,a0,-1918 # 8020a610 <digits+0x290>
    80202d96:	ffffd097          	auipc	ra,0xffffd
    80202d9a:	3f6080e7          	jalr	1014(ra) # 8020018c <printf>
  printf("sp: %p\t", tf->sp);
    80202d9e:	788c                	ld	a1,48(s1)
    80202da0:	00008517          	auipc	a0,0x8
    80202da4:	ba850513          	addi	a0,a0,-1112 # 8020a948 <digits+0x5c8>
    80202da8:	ffffd097          	auipc	ra,0xffffd
    80202dac:	3e4080e7          	jalr	996(ra) # 8020018c <printf>
  printf("gp: %p\t", tf->gp);
    80202db0:	7c8c                	ld	a1,56(s1)
    80202db2:	00008517          	auipc	a0,0x8
    80202db6:	b9e50513          	addi	a0,a0,-1122 # 8020a950 <digits+0x5d0>
    80202dba:	ffffd097          	auipc	ra,0xffffd
    80202dbe:	3d2080e7          	jalr	978(ra) # 8020018c <printf>
  printf("tp: %p\t", tf->tp);
    80202dc2:	60ac                	ld	a1,64(s1)
    80202dc4:	00008517          	auipc	a0,0x8
    80202dc8:	b9450513          	addi	a0,a0,-1132 # 8020a958 <digits+0x5d8>
    80202dcc:	ffffd097          	auipc	ra,0xffffd
    80202dd0:	3c0080e7          	jalr	960(ra) # 8020018c <printf>
  printf("epc: %p\n", tf->epc);
    80202dd4:	6c8c                	ld	a1,24(s1)
    80202dd6:	00008517          	auipc	a0,0x8
    80202dda:	b8a50513          	addi	a0,a0,-1142 # 8020a960 <digits+0x5e0>
    80202dde:	ffffd097          	auipc	ra,0xffffd
    80202de2:	3ae080e7          	jalr	942(ra) # 8020018c <printf>
}
    80202de6:	60e2                	ld	ra,24(sp)
    80202de8:	6442                	ld	s0,16(sp)
    80202dea:	64a2                	ld	s1,8(sp)
    80202dec:	6105                	addi	sp,sp,32
    80202dee:	8082                	ret

0000000080202df0 <argraw>:
  return strlen(buf);
}

static uint64
argraw(int n)
{
    80202df0:	1101                	addi	sp,sp,-32
    80202df2:	ec06                	sd	ra,24(sp)
    80202df4:	e822                	sd	s0,16(sp)
    80202df6:	e426                	sd	s1,8(sp)
    80202df8:	1000                	addi	s0,sp,32
    80202dfa:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80202dfc:	fffff097          	auipc	ra,0xfffff
    80202e00:	c78080e7          	jalr	-904(ra) # 80201a74 <myproc>
  switch (n) {
    80202e04:	4795                	li	a5,5
    80202e06:	0497e163          	bltu	a5,s1,80202e48 <argraw+0x58>
    80202e0a:	048a                	slli	s1,s1,0x2
    80202e0c:	00008717          	auipc	a4,0x8
    80202e10:	d2c70713          	addi	a4,a4,-724 # 8020ab38 <digits+0x7b8>
    80202e14:	94ba                	add	s1,s1,a4
    80202e16:	409c                	lw	a5,0(s1)
    80202e18:	97ba                	add	a5,a5,a4
    80202e1a:	8782                	jr	a5
  case 0:
    return p->trapframe->a0;
    80202e1c:	713c                	ld	a5,96(a0)
    80202e1e:	7ba8                	ld	a0,112(a5)
  case 5:
    return p->trapframe->a5;
  }
  panic("argraw");
  return -1;
}
    80202e20:	60e2                	ld	ra,24(sp)
    80202e22:	6442                	ld	s0,16(sp)
    80202e24:	64a2                	ld	s1,8(sp)
    80202e26:	6105                	addi	sp,sp,32
    80202e28:	8082                	ret
    return p->trapframe->a1;
    80202e2a:	713c                	ld	a5,96(a0)
    80202e2c:	7fa8                	ld	a0,120(a5)
    80202e2e:	bfcd                	j	80202e20 <argraw+0x30>
    return p->trapframe->a2;
    80202e30:	713c                	ld	a5,96(a0)
    80202e32:	63c8                	ld	a0,128(a5)
    80202e34:	b7f5                	j	80202e20 <argraw+0x30>
    return p->trapframe->a3;
    80202e36:	713c                	ld	a5,96(a0)
    80202e38:	67c8                	ld	a0,136(a5)
    80202e3a:	b7dd                	j	80202e20 <argraw+0x30>
    return p->trapframe->a4;
    80202e3c:	713c                	ld	a5,96(a0)
    80202e3e:	6bc8                	ld	a0,144(a5)
    80202e40:	b7c5                	j	80202e20 <argraw+0x30>
    return p->trapframe->a5;
    80202e42:	713c                	ld	a5,96(a0)
    80202e44:	6fc8                	ld	a0,152(a5)
    80202e46:	bfe9                	j	80202e20 <argraw+0x30>
  panic("argraw");
    80202e48:	00008517          	auipc	a0,0x8
    80202e4c:	b2850513          	addi	a0,a0,-1240 # 8020a970 <digits+0x5f0>
    80202e50:	ffffd097          	auipc	ra,0xffffd
    80202e54:	2f2080e7          	jalr	754(ra) # 80200142 <panic>

0000000080202e58 <sys_sysinfo>:
    return 0;
}

uint64
sys_sysinfo(void)
{
    80202e58:	7179                	addi	sp,sp,-48
    80202e5a:	f406                	sd	ra,40(sp)
    80202e5c:	f022                	sd	s0,32(sp)
    80202e5e:	ec26                	sd	s1,24(sp)
    80202e60:	1800                	addi	s0,sp,48
  *ip = argraw(n);
    80202e62:	4501                	li	a0,0
    80202e64:	00000097          	auipc	ra,0x0
    80202e68:	f8c080e7          	jalr	-116(ra) # 80202df0 <argraw>
    80202e6c:	84aa                	mv	s1,a0
  if (argaddr(0, &addr) < 0) {
    return -1;
  }

  struct sysinfo info;
  info.freemem = freemem_amount();
    80202e6e:	ffffd097          	auipc	ra,0xffffd
    80202e72:	754080e7          	jalr	1876(ra) # 802005c2 <freemem_amount>
    80202e76:	fca43823          	sd	a0,-48(s0)
  info.nproc = procnum();
    80202e7a:	fffff097          	auipc	ra,0xfffff
    80202e7e:	7ce080e7          	jalr	1998(ra) # 80202648 <procnum>
    80202e82:	fca43c23          	sd	a0,-40(s0)

  // if (copyout(p->pagetable, addr, (char *)&info, sizeof(info)) < 0) {
  if (copyout2(addr, (char *)&info, sizeof(info)) < 0) {
    80202e86:	4641                	li	a2,16
    80202e88:	fd040593          	addi	a1,s0,-48
    80202e8c:	8526                	mv	a0,s1
    80202e8e:	ffffe097          	auipc	ra,0xffffe
    80202e92:	50a080e7          	jalr	1290(ra) # 80201398 <copyout2>
    return -1;
  }

  return 0;
    80202e96:	957d                	srai	a0,a0,0x3f
    80202e98:	70a2                	ld	ra,40(sp)
    80202e9a:	7402                	ld	s0,32(sp)
    80202e9c:	64e2                	ld	s1,24(sp)
    80202e9e:	6145                	addi	sp,sp,48
    80202ea0:	8082                	ret

0000000080202ea2 <fetchaddr>:
{
    80202ea2:	1101                	addi	sp,sp,-32
    80202ea4:	ec06                	sd	ra,24(sp)
    80202ea6:	e822                	sd	s0,16(sp)
    80202ea8:	e426                	sd	s1,8(sp)
    80202eaa:	e04a                	sd	s2,0(sp)
    80202eac:	1000                	addi	s0,sp,32
    80202eae:	84aa                	mv	s1,a0
    80202eb0:	892e                	mv	s2,a1
  struct proc *p = myproc();
    80202eb2:	fffff097          	auipc	ra,0xfffff
    80202eb6:	bc2080e7          	jalr	-1086(ra) # 80201a74 <myproc>
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    80202eba:	653c                	ld	a5,72(a0)
    80202ebc:	02f4f763          	bgeu	s1,a5,80202eea <fetchaddr+0x48>
    80202ec0:	00848713          	addi	a4,s1,8
    80202ec4:	02e7e563          	bltu	a5,a4,80202eee <fetchaddr+0x4c>
  if(copyin2((char *)ip, addr, sizeof(*ip)) != 0)
    80202ec8:	4621                	li	a2,8
    80202eca:	85a6                	mv	a1,s1
    80202ecc:	854a                	mv	a0,s2
    80202ece:	ffffe097          	auipc	ra,0xffffe
    80202ed2:	5a8080e7          	jalr	1448(ra) # 80201476 <copyin2>
    80202ed6:	00a03533          	snez	a0,a0
    80202eda:	40a00533          	neg	a0,a0
}
    80202ede:	60e2                	ld	ra,24(sp)
    80202ee0:	6442                	ld	s0,16(sp)
    80202ee2:	64a2                	ld	s1,8(sp)
    80202ee4:	6902                	ld	s2,0(sp)
    80202ee6:	6105                	addi	sp,sp,32
    80202ee8:	8082                	ret
    return -1;
    80202eea:	557d                	li	a0,-1
    80202eec:	bfcd                	j	80202ede <fetchaddr+0x3c>
    80202eee:	557d                	li	a0,-1
    80202ef0:	b7fd                	j	80202ede <fetchaddr+0x3c>

0000000080202ef2 <fetchstr>:
{
    80202ef2:	1101                	addi	sp,sp,-32
    80202ef4:	ec06                	sd	ra,24(sp)
    80202ef6:	e822                	sd	s0,16(sp)
    80202ef8:	e426                	sd	s1,8(sp)
    80202efa:	1000                	addi	s0,sp,32
    80202efc:	84ae                	mv	s1,a1
  int err = copyinstr2(buf, addr, max);
    80202efe:	85aa                	mv	a1,a0
    80202f00:	8526                	mv	a0,s1
    80202f02:	ffffe097          	auipc	ra,0xffffe
    80202f06:	67a080e7          	jalr	1658(ra) # 8020157c <copyinstr2>
  if(err < 0)
    80202f0a:	00054763          	bltz	a0,80202f18 <fetchstr+0x26>
  return strlen(buf);
    80202f0e:	8526                	mv	a0,s1
    80202f10:	ffffe097          	auipc	ra,0xffffe
    80202f14:	9dc080e7          	jalr	-1572(ra) # 802008ec <strlen>
}
    80202f18:	60e2                	ld	ra,24(sp)
    80202f1a:	6442                	ld	s0,16(sp)
    80202f1c:	64a2                	ld	s1,8(sp)
    80202f1e:	6105                	addi	sp,sp,32
    80202f20:	8082                	ret

0000000080202f22 <argint>:
{
    80202f22:	1101                	addi	sp,sp,-32
    80202f24:	ec06                	sd	ra,24(sp)
    80202f26:	e822                	sd	s0,16(sp)
    80202f28:	e426                	sd	s1,8(sp)
    80202f2a:	1000                	addi	s0,sp,32
    80202f2c:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80202f2e:	00000097          	auipc	ra,0x0
    80202f32:	ec2080e7          	jalr	-318(ra) # 80202df0 <argraw>
    80202f36:	c088                	sw	a0,0(s1)
}
    80202f38:	4501                	li	a0,0
    80202f3a:	60e2                	ld	ra,24(sp)
    80202f3c:	6442                	ld	s0,16(sp)
    80202f3e:	64a2                	ld	s1,8(sp)
    80202f40:	6105                	addi	sp,sp,32
    80202f42:	8082                	ret

0000000080202f44 <sys_test_proc>:
sys_test_proc(void) {
    80202f44:	1101                	addi	sp,sp,-32
    80202f46:	ec06                	sd	ra,24(sp)
    80202f48:	e822                	sd	s0,16(sp)
    80202f4a:	1000                	addi	s0,sp,32
    argint(0, &n);
    80202f4c:	fec40593          	addi	a1,s0,-20
    80202f50:	4501                	li	a0,0
    80202f52:	00000097          	auipc	ra,0x0
    80202f56:	fd0080e7          	jalr	-48(ra) # 80202f22 <argint>
    printf("hello world from proc %d, hart %d, arg %d\n", myproc()->pid, r_tp(), n);
    80202f5a:	fffff097          	auipc	ra,0xfffff
    80202f5e:	b1a080e7          	jalr	-1254(ra) # 80201a74 <myproc>
    80202f62:	8612                	mv	a2,tp
    80202f64:	fec42683          	lw	a3,-20(s0)
    80202f68:	5d0c                	lw	a1,56(a0)
    80202f6a:	00008517          	auipc	a0,0x8
    80202f6e:	a0e50513          	addi	a0,a0,-1522 # 8020a978 <digits+0x5f8>
    80202f72:	ffffd097          	auipc	ra,0xffffd
    80202f76:	21a080e7          	jalr	538(ra) # 8020018c <printf>
}
    80202f7a:	4501                	li	a0,0
    80202f7c:	60e2                	ld	ra,24(sp)
    80202f7e:	6442                	ld	s0,16(sp)
    80202f80:	6105                	addi	sp,sp,32
    80202f82:	8082                	ret

0000000080202f84 <argaddr>:
{
    80202f84:	1101                	addi	sp,sp,-32
    80202f86:	ec06                	sd	ra,24(sp)
    80202f88:	e822                	sd	s0,16(sp)
    80202f8a:	e426                	sd	s1,8(sp)
    80202f8c:	1000                	addi	s0,sp,32
    80202f8e:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80202f90:	00000097          	auipc	ra,0x0
    80202f94:	e60080e7          	jalr	-416(ra) # 80202df0 <argraw>
    80202f98:	e088                	sd	a0,0(s1)
}
    80202f9a:	4501                	li	a0,0
    80202f9c:	60e2                	ld	ra,24(sp)
    80202f9e:	6442                	ld	s0,16(sp)
    80202fa0:	64a2                	ld	s1,8(sp)
    80202fa2:	6105                	addi	sp,sp,32
    80202fa4:	8082                	ret

0000000080202fa6 <argstr>:
{
    80202fa6:	1101                	addi	sp,sp,-32
    80202fa8:	ec06                	sd	ra,24(sp)
    80202faa:	e822                	sd	s0,16(sp)
    80202fac:	e426                	sd	s1,8(sp)
    80202fae:	e04a                	sd	s2,0(sp)
    80202fb0:	1000                	addi	s0,sp,32
    80202fb2:	84ae                	mv	s1,a1
    80202fb4:	8932                	mv	s2,a2
  *ip = argraw(n);
    80202fb6:	00000097          	auipc	ra,0x0
    80202fba:	e3a080e7          	jalr	-454(ra) # 80202df0 <argraw>
  return fetchstr(addr, buf, max);
    80202fbe:	864a                	mv	a2,s2
    80202fc0:	85a6                	mv	a1,s1
    80202fc2:	00000097          	auipc	ra,0x0
    80202fc6:	f30080e7          	jalr	-208(ra) # 80202ef2 <fetchstr>
}
    80202fca:	60e2                	ld	ra,24(sp)
    80202fcc:	6442                	ld	s0,16(sp)
    80202fce:	64a2                	ld	s1,8(sp)
    80202fd0:	6902                	ld	s2,0(sp)
    80202fd2:	6105                	addi	sp,sp,32
    80202fd4:	8082                	ret

0000000080202fd6 <syscall>:
{
    80202fd6:	7179                	addi	sp,sp,-48
    80202fd8:	f406                	sd	ra,40(sp)
    80202fda:	f022                	sd	s0,32(sp)
    80202fdc:	ec26                	sd	s1,24(sp)
    80202fde:	e84a                	sd	s2,16(sp)
    80202fe0:	e44e                	sd	s3,8(sp)
    80202fe2:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80202fe4:	fffff097          	auipc	ra,0xfffff
    80202fe8:	a90080e7          	jalr	-1392(ra) # 80201a74 <myproc>
    80202fec:	84aa                	mv	s1,a0
  num = p->trapframe->a7;
    80202fee:	06053903          	ld	s2,96(a0)
    80202ff2:	0a893783          	ld	a5,168(s2)
    80202ff6:	0007899b          	sext.w	s3,a5
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    80202ffa:	37fd                	addiw	a5,a5,-1
    80202ffc:	20100713          	li	a4,513
    80203000:	04f76863          	bltu	a4,a5,80203050 <syscall+0x7a>
    80203004:	00399713          	slli	a4,s3,0x3
    80203008:	00008797          	auipc	a5,0x8
    8020300c:	06078793          	addi	a5,a5,96 # 8020b068 <syscalls>
    80203010:	97ba                	add	a5,a5,a4
    80203012:	639c                	ld	a5,0(a5)
    80203014:	cf95                	beqz	a5,80203050 <syscall+0x7a>
    p->trapframe->a0 = syscalls[num]();
    80203016:	9782                	jalr	a5
    80203018:	06a93823          	sd	a0,112(s2)
    if ((p->tmask & (1 << num)) != 0) {
    8020301c:	4f04a783          	lw	a5,1264(s1)
    80203020:	4137d7bb          	sraw	a5,a5,s3
    80203024:	8b85                	andi	a5,a5,1
    80203026:	c7a1                	beqz	a5,8020306e <syscall+0x98>
      printf("pid %d: %s -> %d\n", p->pid, sysnames[num], p->trapframe->a0);
    80203028:	70b8                	ld	a4,96(s1)
    8020302a:	098e                	slli	s3,s3,0x3
    8020302c:	00009797          	auipc	a5,0x9
    80203030:	05478793          	addi	a5,a5,84 # 8020c080 <sysnames>
    80203034:	99be                	add	s3,s3,a5
    80203036:	7b34                	ld	a3,112(a4)
    80203038:	0009b603          	ld	a2,0(s3)
    8020303c:	5c8c                	lw	a1,56(s1)
    8020303e:	00008517          	auipc	a0,0x8
    80203042:	96a50513          	addi	a0,a0,-1686 # 8020a9a8 <digits+0x628>
    80203046:	ffffd097          	auipc	ra,0xffffd
    8020304a:	146080e7          	jalr	326(ra) # 8020018c <printf>
    8020304e:	a005                	j	8020306e <syscall+0x98>
    printf("pid %d %s: unknown sys call %d\n",
    80203050:	86ce                	mv	a3,s3
    80203052:	4e048613          	addi	a2,s1,1248
    80203056:	5c8c                	lw	a1,56(s1)
    80203058:	00008517          	auipc	a0,0x8
    8020305c:	96850513          	addi	a0,a0,-1688 # 8020a9c0 <digits+0x640>
    80203060:	ffffd097          	auipc	ra,0xffffd
    80203064:	12c080e7          	jalr	300(ra) # 8020018c <printf>
    p->trapframe->a0 = -1;
    80203068:	70bc                	ld	a5,96(s1)
    8020306a:	577d                	li	a4,-1
    8020306c:	fbb8                	sd	a4,112(a5)
}
    8020306e:	70a2                	ld	ra,40(sp)
    80203070:	7402                	ld	s0,32(sp)
    80203072:	64e2                	ld	s1,24(sp)
    80203074:	6942                	ld	s2,16(sp)
    80203076:	69a2                	ld	s3,8(sp)
    80203078:	6145                	addi	sp,sp,48
    8020307a:	8082                	ret

000000008020307c <sys_exec>:
#include "include/sbi.h"
extern int exec(char *path, char **argv);

uint64
sys_exec(void)
{
    8020307c:	da010113          	addi	sp,sp,-608
    80203080:	24113c23          	sd	ra,600(sp)
    80203084:	24813823          	sd	s0,592(sp)
    80203088:	24913423          	sd	s1,584(sp)
    8020308c:	25213023          	sd	s2,576(sp)
    80203090:	23313c23          	sd	s3,568(sp)
    80203094:	23413823          	sd	s4,560(sp)
    80203098:	23513423          	sd	s5,552(sp)
    8020309c:	23613023          	sd	s6,544(sp)
    802030a0:	1480                	addi	s0,sp,608
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    802030a2:	10400613          	li	a2,260
    802030a6:	eb840593          	addi	a1,s0,-328
    802030aa:	4501                	li	a0,0
    802030ac:	00000097          	auipc	ra,0x0
    802030b0:	efa080e7          	jalr	-262(ra) # 80202fa6 <argstr>
    return -1;
    802030b4:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    802030b6:	0c054a63          	bltz	a0,8020318a <sys_exec+0x10e>
    802030ba:	db040593          	addi	a1,s0,-592
    802030be:	4505                	li	a0,1
    802030c0:	00000097          	auipc	ra,0x0
    802030c4:	ec4080e7          	jalr	-316(ra) # 80202f84 <argaddr>
    802030c8:	0c054163          	bltz	a0,8020318a <sys_exec+0x10e>
  }
  memset(argv, 0, sizeof(argv));
    802030cc:	10000613          	li	a2,256
    802030d0:	4581                	li	a1,0
    802030d2:	db840993          	addi	s3,s0,-584
    802030d6:	854e                	mv	a0,s3
    802030d8:	ffffd097          	auipc	ra,0xffffd
    802030dc:	68c080e7          	jalr	1676(ra) # 80200764 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    802030e0:	84ce                	mv	s1,s3
  memset(argv, 0, sizeof(argv));
    802030e2:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802030e4:	da840a13          	addi	s4,s0,-600
    if(i >= NELEM(argv)){
    802030e8:	02000a93          	li	s5,32
    802030ec:	00090b1b          	sext.w	s6,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802030f0:	00391513          	slli	a0,s2,0x3
    802030f4:	85d2                	mv	a1,s4
    802030f6:	db043783          	ld	a5,-592(s0)
    802030fa:	953e                	add	a0,a0,a5
    802030fc:	00000097          	auipc	ra,0x0
    80203100:	da6080e7          	jalr	-602(ra) # 80202ea2 <fetchaddr>
    80203104:	02054a63          	bltz	a0,80203138 <sys_exec+0xbc>
      goto bad;
    }
    if(uarg == 0){
    80203108:	da843783          	ld	a5,-600(s0)
    8020310c:	c3b9                	beqz	a5,80203152 <sys_exec+0xd6>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    8020310e:	ffffd097          	auipc	ra,0xffffd
    80203112:	44e080e7          	jalr	1102(ra) # 8020055c <kalloc>
    80203116:	85aa                	mv	a1,a0
    80203118:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    8020311c:	cd11                	beqz	a0,80203138 <sys_exec+0xbc>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    8020311e:	6605                	lui	a2,0x1
    80203120:	da843503          	ld	a0,-600(s0)
    80203124:	00000097          	auipc	ra,0x0
    80203128:	dce080e7          	jalr	-562(ra) # 80202ef2 <fetchstr>
    8020312c:	00054663          	bltz	a0,80203138 <sys_exec+0xbc>
    if(i >= NELEM(argv)){
    80203130:	0905                	addi	s2,s2,1
    80203132:	09a1                	addi	s3,s3,8
    80203134:	fb591ce3          	bne	s2,s5,802030ec <sys_exec+0x70>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203138:	10048913          	addi	s2,s1,256
    8020313c:	6088                	ld	a0,0(s1)
    8020313e:	c529                	beqz	a0,80203188 <sys_exec+0x10c>
    kfree(argv[i]);
    80203140:	ffffd097          	auipc	ra,0xffffd
    80203144:	304080e7          	jalr	772(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203148:	04a1                	addi	s1,s1,8
    8020314a:	ff2499e3          	bne	s1,s2,8020313c <sys_exec+0xc0>
  return -1;
    8020314e:	597d                	li	s2,-1
    80203150:	a82d                	j	8020318a <sys_exec+0x10e>
      argv[i] = 0;
    80203152:	0b0e                	slli	s6,s6,0x3
    80203154:	fc040793          	addi	a5,s0,-64
    80203158:	9b3e                	add	s6,s6,a5
    8020315a:	de0b3c23          	sd	zero,-520(s6) # df8 <_entry-0x801ff208>
  int ret = exec(path, argv);
    8020315e:	db840593          	addi	a1,s0,-584
    80203162:	eb840513          	addi	a0,s0,-328
    80203166:	00001097          	auipc	ra,0x1
    8020316a:	204080e7          	jalr	516(ra) # 8020436a <exec>
    8020316e:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203170:	10048993          	addi	s3,s1,256
    80203174:	6088                	ld	a0,0(s1)
    80203176:	c911                	beqz	a0,8020318a <sys_exec+0x10e>
    kfree(argv[i]);
    80203178:	ffffd097          	auipc	ra,0xffffd
    8020317c:	2cc080e7          	jalr	716(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203180:	04a1                	addi	s1,s1,8
    80203182:	ff3499e3          	bne	s1,s3,80203174 <sys_exec+0xf8>
    80203186:	a011                	j	8020318a <sys_exec+0x10e>
  return -1;
    80203188:	597d                	li	s2,-1
}
    8020318a:	854a                	mv	a0,s2
    8020318c:	25813083          	ld	ra,600(sp)
    80203190:	25013403          	ld	s0,592(sp)
    80203194:	24813483          	ld	s1,584(sp)
    80203198:	24013903          	ld	s2,576(sp)
    8020319c:	23813983          	ld	s3,568(sp)
    802031a0:	23013a03          	ld	s4,560(sp)
    802031a4:	22813a83          	ld	s5,552(sp)
    802031a8:	22013b03          	ld	s6,544(sp)
    802031ac:	26010113          	addi	sp,sp,608
    802031b0:	8082                	ret

00000000802031b2 <sys_exit>:

uint64
sys_exit(void)
{
    802031b2:	1101                	addi	sp,sp,-32
    802031b4:	ec06                	sd	ra,24(sp)
    802031b6:	e822                	sd	s0,16(sp)
    802031b8:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    802031ba:	fec40593          	addi	a1,s0,-20
    802031be:	4501                	li	a0,0
    802031c0:	00000097          	auipc	ra,0x0
    802031c4:	d62080e7          	jalr	-670(ra) # 80202f22 <argint>
    return -1;
    802031c8:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    802031ca:	00054963          	bltz	a0,802031dc <sys_exit+0x2a>
  exit(n);
    802031ce:	fec42503          	lw	a0,-20(s0)
    802031d2:	fffff097          	auipc	ra,0xfffff
    802031d6:	fd6080e7          	jalr	-42(ra) # 802021a8 <exit>
  return 0;  // not reached
    802031da:	4781                	li	a5,0
}
    802031dc:	853e                	mv	a0,a5
    802031de:	60e2                	ld	ra,24(sp)
    802031e0:	6442                	ld	s0,16(sp)
    802031e2:	6105                	addi	sp,sp,32
    802031e4:	8082                	ret

00000000802031e6 <sys_getpid>:

uint64
sys_getpid(void)
{
    802031e6:	1141                	addi	sp,sp,-16
    802031e8:	e406                	sd	ra,8(sp)
    802031ea:	e022                	sd	s0,0(sp)
    802031ec:	0800                	addi	s0,sp,16
  return myproc()->pid;
    802031ee:	fffff097          	auipc	ra,0xfffff
    802031f2:	886080e7          	jalr	-1914(ra) # 80201a74 <myproc>
}
    802031f6:	5d08                	lw	a0,56(a0)
    802031f8:	60a2                	ld	ra,8(sp)
    802031fa:	6402                	ld	s0,0(sp)
    802031fc:	0141                	addi	sp,sp,16
    802031fe:	8082                	ret

0000000080203200 <sys_fork>:

uint64
sys_fork(void)
{
    80203200:	1141                	addi	sp,sp,-16
    80203202:	e406                	sd	ra,8(sp)
    80203204:	e022                	sd	s0,0(sp)
    80203206:	0800                	addi	s0,sp,16
  return fork();
    80203208:	fffff097          	auipc	ra,0xfffff
    8020320c:	c66080e7          	jalr	-922(ra) # 80201e6e <fork>
}
    80203210:	60a2                	ld	ra,8(sp)
    80203212:	6402                	ld	s0,0(sp)
    80203214:	0141                	addi	sp,sp,16
    80203216:	8082                	ret

0000000080203218 <sys_wait>:

uint64
sys_wait(void)
{
    80203218:	1101                	addi	sp,sp,-32
    8020321a:	ec06                	sd	ra,24(sp)
    8020321c:	e822                	sd	s0,16(sp)
    8020321e:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    80203220:	fe840593          	addi	a1,s0,-24
    80203224:	4501                	li	a0,0
    80203226:	00000097          	auipc	ra,0x0
    8020322a:	d5e080e7          	jalr	-674(ra) # 80202f84 <argaddr>
    8020322e:	87aa                	mv	a5,a0
    return -1;
    80203230:	557d                	li	a0,-1
  if(argaddr(0, &p) < 0)
    80203232:	0007c863          	bltz	a5,80203242 <sys_wait+0x2a>
  return wait(p);
    80203236:	fe843503          	ld	a0,-24(s0)
    8020323a:	fffff097          	auipc	ra,0xfffff
    8020323e:	112080e7          	jalr	274(ra) # 8020234c <wait>
}
    80203242:	60e2                	ld	ra,24(sp)
    80203244:	6442                	ld	s0,16(sp)
    80203246:	6105                	addi	sp,sp,32
    80203248:	8082                	ret

000000008020324a <sys_sbrk>:

uint64
sys_sbrk(void)
{
    8020324a:	7179                	addi	sp,sp,-48
    8020324c:	f406                	sd	ra,40(sp)
    8020324e:	f022                	sd	s0,32(sp)
    80203250:	ec26                	sd	s1,24(sp)
    80203252:	1800                	addi	s0,sp,48
  int addr;
  int n;

  if(argint(0, &n) < 0)
    80203254:	fdc40593          	addi	a1,s0,-36
    80203258:	4501                	li	a0,0
    8020325a:	00000097          	auipc	ra,0x0
    8020325e:	cc8080e7          	jalr	-824(ra) # 80202f22 <argint>
    80203262:	87aa                	mv	a5,a0
    return -1;
    80203264:	557d                	li	a0,-1
  if(argint(0, &n) < 0)
    80203266:	0207c063          	bltz	a5,80203286 <sys_sbrk+0x3c>
  addr = myproc()->sz;
    8020326a:	fffff097          	auipc	ra,0xfffff
    8020326e:	80a080e7          	jalr	-2038(ra) # 80201a74 <myproc>
    80203272:	4524                	lw	s1,72(a0)
  if(growproc(n) < 0)
    80203274:	fdc42503          	lw	a0,-36(s0)
    80203278:	fffff097          	auipc	ra,0xfffff
    8020327c:	b7e080e7          	jalr	-1154(ra) # 80201df6 <growproc>
    80203280:	00054863          	bltz	a0,80203290 <sys_sbrk+0x46>
    return -1;
  return addr;
    80203284:	8526                	mv	a0,s1
}
    80203286:	70a2                	ld	ra,40(sp)
    80203288:	7402                	ld	s0,32(sp)
    8020328a:	64e2                	ld	s1,24(sp)
    8020328c:	6145                	addi	sp,sp,48
    8020328e:	8082                	ret
    return -1;
    80203290:	557d                	li	a0,-1
    80203292:	bfd5                	j	80203286 <sys_sbrk+0x3c>

0000000080203294 <sys_sleep>:

uint64
sys_sleep(void)
{
    80203294:	7139                	addi	sp,sp,-64
    80203296:	fc06                	sd	ra,56(sp)
    80203298:	f822                	sd	s0,48(sp)
    8020329a:	f426                	sd	s1,40(sp)
    8020329c:	f04a                	sd	s2,32(sp)
    8020329e:	ec4e                	sd	s3,24(sp)
    802032a0:	0080                	addi	s0,sp,64
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    802032a2:	fcc40593          	addi	a1,s0,-52
    802032a6:	4501                	li	a0,0
    802032a8:	00000097          	auipc	ra,0x0
    802032ac:	c7a080e7          	jalr	-902(ra) # 80202f22 <argint>
    return -1;
    802032b0:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    802032b2:	06054763          	bltz	a0,80203320 <sys_sleep+0x8c>
  acquire(&tickslock);
    802032b6:	0000a517          	auipc	a0,0xa
    802032ba:	e3253503          	ld	a0,-462(a0) # 8020d0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    802032be:	ffffd097          	auipc	ra,0xffffd
    802032c2:	40a080e7          	jalr	1034(ra) # 802006c8 <acquire>
  ticks0 = ticks;
    802032c6:	0000a797          	auipc	a5,0xa
    802032ca:	e3a7b783          	ld	a5,-454(a5) # 8020d100 <_GLOBAL_OFFSET_TABLE_+0x50>
    802032ce:	0007a903          	lw	s2,0(a5)
  while(ticks - ticks0 < n){
    802032d2:	fcc42783          	lw	a5,-52(s0)
    802032d6:	cf85                	beqz	a5,8020330e <sys_sleep+0x7a>
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
    802032d8:	0000a997          	auipc	s3,0xa
    802032dc:	e109b983          	ld	s3,-496(s3) # 8020d0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    802032e0:	0000a497          	auipc	s1,0xa
    802032e4:	e204b483          	ld	s1,-480(s1) # 8020d100 <_GLOBAL_OFFSET_TABLE_+0x50>
    if(myproc()->killed){
    802032e8:	ffffe097          	auipc	ra,0xffffe
    802032ec:	78c080e7          	jalr	1932(ra) # 80201a74 <myproc>
    802032f0:	591c                	lw	a5,48(a0)
    802032f2:	ef9d                	bnez	a5,80203330 <sys_sleep+0x9c>
    sleep(&ticks, &tickslock);
    802032f4:	85ce                	mv	a1,s3
    802032f6:	8526                	mv	a0,s1
    802032f8:	fffff097          	auipc	ra,0xfffff
    802032fc:	fd6080e7          	jalr	-42(ra) # 802022ce <sleep>
  while(ticks - ticks0 < n){
    80203300:	409c                	lw	a5,0(s1)
    80203302:	412787bb          	subw	a5,a5,s2
    80203306:	fcc42703          	lw	a4,-52(s0)
    8020330a:	fce7efe3          	bltu	a5,a4,802032e8 <sys_sleep+0x54>
  }
  release(&tickslock);
    8020330e:	0000a517          	auipc	a0,0xa
    80203312:	dda53503          	ld	a0,-550(a0) # 8020d0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    80203316:	ffffd097          	auipc	ra,0xffffd
    8020331a:	406080e7          	jalr	1030(ra) # 8020071c <release>
  return 0;
    8020331e:	4781                	li	a5,0
}
    80203320:	853e                	mv	a0,a5
    80203322:	70e2                	ld	ra,56(sp)
    80203324:	7442                	ld	s0,48(sp)
    80203326:	74a2                	ld	s1,40(sp)
    80203328:	7902                	ld	s2,32(sp)
    8020332a:	69e2                	ld	s3,24(sp)
    8020332c:	6121                	addi	sp,sp,64
    8020332e:	8082                	ret
      release(&tickslock);
    80203330:	0000a517          	auipc	a0,0xa
    80203334:	db853503          	ld	a0,-584(a0) # 8020d0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    80203338:	ffffd097          	auipc	ra,0xffffd
    8020333c:	3e4080e7          	jalr	996(ra) # 8020071c <release>
      return -1;
    80203340:	57fd                	li	a5,-1
    80203342:	bff9                	j	80203320 <sys_sleep+0x8c>

0000000080203344 <sys_kill>:

uint64
sys_kill(void)
{
    80203344:	1101                	addi	sp,sp,-32
    80203346:	ec06                	sd	ra,24(sp)
    80203348:	e822                	sd	s0,16(sp)
    8020334a:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    8020334c:	fec40593          	addi	a1,s0,-20
    80203350:	4501                	li	a0,0
    80203352:	00000097          	auipc	ra,0x0
    80203356:	bd0080e7          	jalr	-1072(ra) # 80202f22 <argint>
    8020335a:	87aa                	mv	a5,a0
    return -1;
    8020335c:	557d                	li	a0,-1
  if(argint(0, &pid) < 0)
    8020335e:	0007c863          	bltz	a5,8020336e <sys_kill+0x2a>
  return kill(pid);
    80203362:	fec42503          	lw	a0,-20(s0)
    80203366:	fffff097          	auipc	ra,0xfffff
    8020336a:	154080e7          	jalr	340(ra) # 802024ba <kill>
}
    8020336e:	60e2                	ld	ra,24(sp)
    80203370:	6442                	ld	s0,16(sp)
    80203372:	6105                	addi	sp,sp,32
    80203374:	8082                	ret

0000000080203376 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    80203376:	1101                	addi	sp,sp,-32
    80203378:	ec06                	sd	ra,24(sp)
    8020337a:	e822                	sd	s0,16(sp)
    8020337c:	e426                	sd	s1,8(sp)
    8020337e:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    80203380:	0000a517          	auipc	a0,0xa
    80203384:	d6853503          	ld	a0,-664(a0) # 8020d0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    80203388:	ffffd097          	auipc	ra,0xffffd
    8020338c:	340080e7          	jalr	832(ra) # 802006c8 <acquire>
  xticks = ticks;
    80203390:	0000a797          	auipc	a5,0xa
    80203394:	d707b783          	ld	a5,-656(a5) # 8020d100 <_GLOBAL_OFFSET_TABLE_+0x50>
    80203398:	4384                	lw	s1,0(a5)
  release(&tickslock);
    8020339a:	0000a517          	auipc	a0,0xa
    8020339e:	d4e53503          	ld	a0,-690(a0) # 8020d0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    802033a2:	ffffd097          	auipc	ra,0xffffd
    802033a6:	37a080e7          	jalr	890(ra) # 8020071c <release>
  return xticks;
}
    802033aa:	02049513          	slli	a0,s1,0x20
    802033ae:	9101                	srli	a0,a0,0x20
    802033b0:	60e2                	ld	ra,24(sp)
    802033b2:	6442                	ld	s0,16(sp)
    802033b4:	64a2                	ld	s1,8(sp)
    802033b6:	6105                	addi	sp,sp,32
    802033b8:	8082                	ret

00000000802033ba <sys_trace>:
    
uint64
sys_trace(void)
{
    802033ba:	1101                	addi	sp,sp,-32
    802033bc:	ec06                	sd	ra,24(sp)
    802033be:	e822                	sd	s0,16(sp)
    802033c0:	1000                	addi	s0,sp,32
  int mask;
  if(argint(0, &mask) < 0) {
    802033c2:	fec40593          	addi	a1,s0,-20
    802033c6:	4501                	li	a0,0
    802033c8:	00000097          	auipc	ra,0x0
    802033cc:	b5a080e7          	jalr	-1190(ra) # 80202f22 <argint>
    return -1;
    802033d0:	57fd                	li	a5,-1
  if(argint(0, &mask) < 0) {
    802033d2:	00054b63          	bltz	a0,802033e8 <sys_trace+0x2e>
  }
  myproc()->tmask = mask;
    802033d6:	ffffe097          	auipc	ra,0xffffe
    802033da:	69e080e7          	jalr	1694(ra) # 80201a74 <myproc>
    802033de:	fec42783          	lw	a5,-20(s0)
    802033e2:	4ef52823          	sw	a5,1264(a0)
  return 0;
    802033e6:	4781                	li	a5,0
}
    802033e8:	853e                	mv	a0,a5
    802033ea:	60e2                	ld	ra,24(sp)
    802033ec:	6442                	ld	s0,16(sp)
    802033ee:	6105                	addi	sp,sp,32
    802033f0:	8082                	ret

00000000802033f2 <sys_clone>:


// added by lmq for SYS_clone
uint64
sys_clone(void)
{
    802033f2:	7179                	addi	sp,sp,-48
    802033f4:	f406                	sd	ra,40(sp)
    802033f6:	f022                	sd	s0,32(sp)
    802033f8:	1800                	addi	s0,sp,48
  int flags,stack,ptid,tls,ctid;
  if(argint(0, &flags) < 0) {
    802033fa:	fec40593          	addi	a1,s0,-20
    802033fe:	4501                	li	a0,0
    80203400:	00000097          	auipc	ra,0x0
    80203404:	b22080e7          	jalr	-1246(ra) # 80202f22 <argint>
    return -1;
    80203408:	57fd                	li	a5,-1
  if(argint(0, &flags) < 0) {
    8020340a:	06054963          	bltz	a0,8020347c <sys_clone+0x8a>
  }
  if(argint(1, &stack) < 0) {
    8020340e:	fe840593          	addi	a1,s0,-24
    80203412:	4505                	li	a0,1
    80203414:	00000097          	auipc	ra,0x0
    80203418:	b0e080e7          	jalr	-1266(ra) # 80202f22 <argint>
    return -1;
    8020341c:	57fd                	li	a5,-1
  if(argint(1, &stack) < 0) {
    8020341e:	04054f63          	bltz	a0,8020347c <sys_clone+0x8a>
  }
  if(argint(2, &ptid) < 0) {
    80203422:	fe440593          	addi	a1,s0,-28
    80203426:	4509                	li	a0,2
    80203428:	00000097          	auipc	ra,0x0
    8020342c:	afa080e7          	jalr	-1286(ra) # 80202f22 <argint>
    return -1;
    80203430:	57fd                	li	a5,-1
  if(argint(2, &ptid) < 0) {
    80203432:	04054563          	bltz	a0,8020347c <sys_clone+0x8a>
  }
  if(argint(3, &tls) < 0) {
    80203436:	fe040593          	addi	a1,s0,-32
    8020343a:	450d                	li	a0,3
    8020343c:	00000097          	auipc	ra,0x0
    80203440:	ae6080e7          	jalr	-1306(ra) # 80202f22 <argint>
    return -1;
    80203444:	57fd                	li	a5,-1
  if(argint(3, &tls) < 0) {
    80203446:	02054b63          	bltz	a0,8020347c <sys_clone+0x8a>
  }
  if(argint(4, &ctid) < 0) {
    8020344a:	fdc40593          	addi	a1,s0,-36
    8020344e:	4511                	li	a0,4
    80203450:	00000097          	auipc	ra,0x0
    80203454:	ad2080e7          	jalr	-1326(ra) # 80202f22 <argint>
    return -1;
    80203458:	57fd                	li	a5,-1
  if(argint(4, &ctid) < 0) {
    8020345a:	02054163          	bltz	a0,8020347c <sys_clone+0x8a>
  }

  int new_pid=clone(flags,stack,ptid,tls,ctid);
    8020345e:	fdc42703          	lw	a4,-36(s0)
    80203462:	fe042683          	lw	a3,-32(s0)
    80203466:	fe442603          	lw	a2,-28(s0)
    8020346a:	fe842583          	lw	a1,-24(s0)
    8020346e:	fec42503          	lw	a0,-20(s0)
    80203472:	fffff097          	auipc	ra,0xfffff
    80203476:	206080e7          	jalr	518(ra) # 80202678 <clone>
  return new_pid;
    8020347a:	87aa                	mv	a5,a0
}
    8020347c:	853e                	mv	a0,a5
    8020347e:	70a2                	ld	ra,40(sp)
    80203480:	7402                	ld	s0,32(sp)
    80203482:	6145                	addi	sp,sp,48
    80203484:	8082                	ret

0000000080203486 <sys_brk>:

// sys_brk lzq
// 将数据段addr 修改为 pos ， 成功则返回0
// Linux brk(0) return 0, but different in this work this will return the now addr
uint64
sys_brk(void){
    80203486:	1101                	addi	sp,sp,-32
    80203488:	ec06                	sd	ra,24(sp)
    8020348a:	e822                	sd	s0,16(sp)
    8020348c:	1000                	addi	s0,sp,32
    int addr, pos;
    if(argint(0, &pos) <0 )
    8020348e:	fec40593          	addi	a1,s0,-20
    80203492:	4501                	li	a0,0
    80203494:	00000097          	auipc	ra,0x0
    80203498:	a8e080e7          	jalr	-1394(ra) # 80202f22 <argint>
    8020349c:	04054063          	bltz	a0,802034dc <sys_brk+0x56>
        return -1;
    addr = myproc()->sz;
    802034a0:	ffffe097          	auipc	ra,0xffffe
    802034a4:	5d4080e7          	jalr	1492(ra) # 80201a74 <myproc>
    802034a8:	4528                	lw	a0,72(a0)
    if(pos == 0) return addr;//the diff with Linux brk(0)
    802034aa:	fec42783          	lw	a5,-20(s0)
    802034ae:	e789                	bnez	a5,802034b8 <sys_brk+0x32>
    if(growproc(pos - addr) < 0)
        panic("growproc error");
    return 0;
}
    802034b0:	60e2                	ld	ra,24(sp)
    802034b2:	6442                	ld	s0,16(sp)
    802034b4:	6105                	addi	sp,sp,32
    802034b6:	8082                	ret
    if(growproc(pos - addr) < 0)
    802034b8:	40a7853b          	subw	a0,a5,a0
    802034bc:	fffff097          	auipc	ra,0xfffff
    802034c0:	93a080e7          	jalr	-1734(ra) # 80201df6 <growproc>
    802034c4:	87aa                	mv	a5,a0
    return 0;
    802034c6:	4501                	li	a0,0
    if(growproc(pos - addr) < 0)
    802034c8:	fe07d4e3          	bgez	a5,802034b0 <sys_brk+0x2a>
        panic("growproc error");
    802034cc:	00007517          	auipc	a0,0x7
    802034d0:	68450513          	addi	a0,a0,1668 # 8020ab50 <digits+0x7d0>
    802034d4:	ffffd097          	auipc	ra,0xffffd
    802034d8:	c6e080e7          	jalr	-914(ra) # 80200142 <panic>
        return -1;
    802034dc:	557d                	li	a0,-1
    802034de:	bfc9                	j	802034b0 <sys_brk+0x2a>

00000000802034e0 <sys_mmap>:

uint64
sys_mmap(void){
    802034e0:	7139                	addi	sp,sp,-64
    802034e2:	fc06                	sd	ra,56(sp)
    802034e4:	f822                	sd	s0,48(sp)
    802034e6:	f426                	sd	s1,40(sp)
    802034e8:	0080                	addi	s0,sp,64
    int prot;// 映射的内存保护方式，可取：PROT_EXEC, PROT_READ, PROT_WRITE, PROT_NONE
    int flags;// 映射是否与其他进程共享的标志，
    int fd;// 文件句柄，
    int off;// 文件偏移量；

    if(argint(0, &addr) < 0 || argint(1, &len) < 0 || argint(2, &prot) < 0 ||
    802034ea:	fdc40593          	addi	a1,s0,-36
    802034ee:	4501                	li	a0,0
    802034f0:	00000097          	auipc	ra,0x0
    802034f4:	a32080e7          	jalr	-1486(ra) # 80202f22 <argint>
       argint(3, &flags) < 0 || argint(4, &fd) < 0 || argint(5, &off) < 0)
        return -1;
    802034f8:	57fd                	li	a5,-1
    if(argint(0, &addr) < 0 || argint(1, &len) < 0 || argint(2, &prot) < 0 ||
    802034fa:	0a054063          	bltz	a0,8020359a <sys_mmap+0xba>
    802034fe:	fd840593          	addi	a1,s0,-40
    80203502:	4505                	li	a0,1
    80203504:	00000097          	auipc	ra,0x0
    80203508:	a1e080e7          	jalr	-1506(ra) # 80202f22 <argint>
        return -1;
    8020350c:	57fd                	li	a5,-1
    if(argint(0, &addr) < 0 || argint(1, &len) < 0 || argint(2, &prot) < 0 ||
    8020350e:	08054663          	bltz	a0,8020359a <sys_mmap+0xba>
    80203512:	fd440593          	addi	a1,s0,-44
    80203516:	4509                	li	a0,2
    80203518:	00000097          	auipc	ra,0x0
    8020351c:	a0a080e7          	jalr	-1526(ra) # 80202f22 <argint>
        return -1;
    80203520:	57fd                	li	a5,-1
    if(argint(0, &addr) < 0 || argint(1, &len) < 0 || argint(2, &prot) < 0 ||
    80203522:	06054c63          	bltz	a0,8020359a <sys_mmap+0xba>
       argint(3, &flags) < 0 || argint(4, &fd) < 0 || argint(5, &off) < 0)
    80203526:	fd040593          	addi	a1,s0,-48
    8020352a:	450d                	li	a0,3
    8020352c:	00000097          	auipc	ra,0x0
    80203530:	9f6080e7          	jalr	-1546(ra) # 80202f22 <argint>
        return -1;
    80203534:	57fd                	li	a5,-1
    if(argint(0, &addr) < 0 || argint(1, &len) < 0 || argint(2, &prot) < 0 ||
    80203536:	06054263          	bltz	a0,8020359a <sys_mmap+0xba>
       argint(3, &flags) < 0 || argint(4, &fd) < 0 || argint(5, &off) < 0)
    8020353a:	fcc40593          	addi	a1,s0,-52
    8020353e:	4511                	li	a0,4
    80203540:	00000097          	auipc	ra,0x0
    80203544:	9e2080e7          	jalr	-1566(ra) # 80202f22 <argint>
        return -1;
    80203548:	57fd                	li	a5,-1
       argint(3, &flags) < 0 || argint(4, &fd) < 0 || argint(5, &off) < 0)
    8020354a:	04054863          	bltz	a0,8020359a <sys_mmap+0xba>
    8020354e:	fc840593          	addi	a1,s0,-56
    80203552:	4515                	li	a0,5
    80203554:	00000097          	auipc	ra,0x0
    80203558:	9ce080e7          	jalr	-1586(ra) # 80202f22 <argint>
        return -1;
    8020355c:	57fd                	li	a5,-1
       argint(3, &flags) < 0 || argint(4, &fd) < 0 || argint(5, &off) < 0)
    8020355e:	02054e63          	bltz	a0,8020359a <sys_mmap+0xba>

    char *mem = kalloc();
    80203562:	ffffd097          	auipc	ra,0xffffd
    80203566:	ffa080e7          	jalr	-6(ra) # 8020055c <kalloc>
    8020356a:	84aa                	mv	s1,a0
    memset(mem, 0, PGSIZE);
    8020356c:	6605                	lui	a2,0x1
    8020356e:	4581                	li	a1,0
    80203570:	ffffd097          	auipc	ra,0xffffd
    80203574:	1f4080e7          	jalr	500(ra) # 80200764 <memset>
    if (mappages(myproc()->pagetable, len, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0) {
    80203578:	ffffe097          	auipc	ra,0xffffe
    8020357c:	4fc080e7          	jalr	1276(ra) # 80201a74 <myproc>
    80203580:	4779                	li	a4,30
    80203582:	86a6                	mv	a3,s1
    80203584:	6605                	lui	a2,0x1
    80203586:	fd842583          	lw	a1,-40(s0)
    8020358a:	6928                	ld	a0,80(a0)
    8020358c:	ffffd097          	auipc	ra,0xffffd
    80203590:	706080e7          	jalr	1798(ra) # 80200c92 <mappages>
    80203594:	e909                	bnez	a0,802035a6 <sys_mmap+0xc6>
        kfree(mem);
        return 0;
    }
    return addr;
    80203596:	fdc42783          	lw	a5,-36(s0)
}
    8020359a:	853e                	mv	a0,a5
    8020359c:	70e2                	ld	ra,56(sp)
    8020359e:	7442                	ld	s0,48(sp)
    802035a0:	74a2                	ld	s1,40(sp)
    802035a2:	6121                	addi	sp,sp,64
    802035a4:	8082                	ret
        kfree(mem);
    802035a6:	8526                	mv	a0,s1
    802035a8:	ffffd097          	auipc	ra,0xffffd
    802035ac:	e9c080e7          	jalr	-356(ra) # 80200444 <kfree>
        return 0;
    802035b0:	4781                	li	a5,0
    802035b2:	b7e5                	j	8020359a <sys_mmap+0xba>

00000000802035b4 <sys_wait4>:
//}

// added by lmq for SYS_wait4
uint64
sys_wait4(void)
{
    802035b4:	1101                	addi	sp,sp,-32
    802035b6:	ec06                	sd	ra,24(sp)
    802035b8:	e822                	sd	s0,16(sp)
    802035ba:	1000                	addi	s0,sp,32
  int cpid;             // child pid which current pid is waiting for
  uint64 addr;          // addr of wstatus
  argint(0,&cpid);
    802035bc:	fec40593          	addi	a1,s0,-20
    802035c0:	4501                	li	a0,0
    802035c2:	00000097          	auipc	ra,0x0
    802035c6:	960080e7          	jalr	-1696(ra) # 80202f22 <argint>
  argaddr(1, &addr);
    802035ca:	fe040593          	addi	a1,s0,-32
    802035ce:	4505                	li	a0,1
    802035d0:	00000097          	auipc	ra,0x0
    802035d4:	9b4080e7          	jalr	-1612(ra) # 80202f84 <argaddr>
  return waitpid(cpid,addr,0);
    802035d8:	4601                	li	a2,0
    802035da:	fe043583          	ld	a1,-32(s0)
    802035de:	fec42503          	lw	a0,-20(s0)
    802035e2:	fffff097          	auipc	ra,0xfffff
    802035e6:	0ae080e7          	jalr	174(ra) # 80202690 <waitpid>
}
    802035ea:	60e2                	ld	ra,24(sp)
    802035ec:	6442                	ld	s0,16(sp)
    802035ee:	6105                	addi	sp,sp,32
    802035f0:	8082                	ret

00000000802035f2 <sys_sched_yield>:

// added by lmq for SYS_sched_yield
uint64
sys_sched_yield(void)
{
    802035f2:	1141                	addi	sp,sp,-16
    802035f4:	e406                	sd	ra,8(sp)
    802035f6:	e022                	sd	s0,0(sp)
    802035f8:	0800                	addi	s0,sp,16
  yield();
    802035fa:	fffff097          	auipc	ra,0xfffff
    802035fe:	c98080e7          	jalr	-872(ra) # 80202292 <yield>
  return 0;
}
    80203602:	4501                	li	a0,0
    80203604:	60a2                	ld	ra,8(sp)
    80203606:	6402                	ld	s0,0(sp)
    80203608:	0141                	addi	sp,sp,16
    8020360a:	8082                	ret

000000008020360c <sys_getppid>:

// added by lmq for SYS_getppid
uint64 
sys_getppid(void)
{
    8020360c:	1141                	addi	sp,sp,-16
    8020360e:	e406                	sd	ra,8(sp)
    80203610:	e022                	sd	s0,0(sp)
    80203612:	0800                	addi	s0,sp,16
  return myproc()->parent->pid;
    80203614:	ffffe097          	auipc	ra,0xffffe
    80203618:	460080e7          	jalr	1120(ra) # 80201a74 <myproc>
    8020361c:	711c                	ld	a5,32(a0)
}
    8020361e:	5f88                	lw	a0,56(a5)
    80203620:	60a2                	ld	ra,8(sp)
    80203622:	6402                	ld	s0,0(sp)
    80203624:	0141                	addi	sp,sp,16
    80203626:	8082                	ret

0000000080203628 <sys_execve>:

// added by lmq for SYS_execve
uint64
sys_execve(void)
{
    80203628:	da010113          	addi	sp,sp,-608
    8020362c:	24113c23          	sd	ra,600(sp)
    80203630:	24813823          	sd	s0,592(sp)
    80203634:	24913423          	sd	s1,584(sp)
    80203638:	25213023          	sd	s2,576(sp)
    8020363c:	23313c23          	sd	s3,568(sp)
    80203640:	23413823          	sd	s4,560(sp)
    80203644:	23513423          	sd	s5,552(sp)
    80203648:	23613023          	sd	s6,544(sp)
    8020364c:	1480                	addi	s0,sp,608
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    8020364e:	10400613          	li	a2,260
    80203652:	eb840593          	addi	a1,s0,-328
    80203656:	4501                	li	a0,0
    80203658:	00000097          	auipc	ra,0x0
    8020365c:	94e080e7          	jalr	-1714(ra) # 80202fa6 <argstr>
    return -1;
    80203660:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    80203662:	0c054a63          	bltz	a0,80203736 <sys_execve+0x10e>
    80203666:	db040593          	addi	a1,s0,-592
    8020366a:	4505                	li	a0,1
    8020366c:	00000097          	auipc	ra,0x0
    80203670:	918080e7          	jalr	-1768(ra) # 80202f84 <argaddr>
    80203674:	0c054163          	bltz	a0,80203736 <sys_execve+0x10e>
  }
  memset(argv, 0, sizeof(argv));
    80203678:	10000613          	li	a2,256
    8020367c:	4581                	li	a1,0
    8020367e:	db840993          	addi	s3,s0,-584
    80203682:	854e                	mv	a0,s3
    80203684:	ffffd097          	auipc	ra,0xffffd
    80203688:	0e0080e7          	jalr	224(ra) # 80200764 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    8020368c:	84ce                	mv	s1,s3
  memset(argv, 0, sizeof(argv));
    8020368e:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80203690:	da840a13          	addi	s4,s0,-600
    if(i >= NELEM(argv)){
    80203694:	02000a93          	li	s5,32
    80203698:	00090b1b          	sext.w	s6,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    8020369c:	00391513          	slli	a0,s2,0x3
    802036a0:	85d2                	mv	a1,s4
    802036a2:	db043783          	ld	a5,-592(s0)
    802036a6:	953e                	add	a0,a0,a5
    802036a8:	fffff097          	auipc	ra,0xfffff
    802036ac:	7fa080e7          	jalr	2042(ra) # 80202ea2 <fetchaddr>
    802036b0:	02054a63          	bltz	a0,802036e4 <sys_execve+0xbc>
      goto bad;
    }
    if(uarg == 0){
    802036b4:	da843783          	ld	a5,-600(s0)
    802036b8:	c3b9                	beqz	a5,802036fe <sys_execve+0xd6>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    802036ba:	ffffd097          	auipc	ra,0xffffd
    802036be:	ea2080e7          	jalr	-350(ra) # 8020055c <kalloc>
    802036c2:	85aa                	mv	a1,a0
    802036c4:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    802036c8:	cd11                	beqz	a0,802036e4 <sys_execve+0xbc>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    802036ca:	6605                	lui	a2,0x1
    802036cc:	da843503          	ld	a0,-600(s0)
    802036d0:	00000097          	auipc	ra,0x0
    802036d4:	822080e7          	jalr	-2014(ra) # 80202ef2 <fetchstr>
    802036d8:	00054663          	bltz	a0,802036e4 <sys_execve+0xbc>
    if(i >= NELEM(argv)){
    802036dc:	0905                	addi	s2,s2,1
    802036de:	09a1                	addi	s3,s3,8
    802036e0:	fb591ce3          	bne	s2,s5,80203698 <sys_execve+0x70>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802036e4:	10048913          	addi	s2,s1,256
    802036e8:	6088                	ld	a0,0(s1)
    802036ea:	c529                	beqz	a0,80203734 <sys_execve+0x10c>
    kfree(argv[i]);
    802036ec:	ffffd097          	auipc	ra,0xffffd
    802036f0:	d58080e7          	jalr	-680(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802036f4:	04a1                	addi	s1,s1,8
    802036f6:	ff2499e3          	bne	s1,s2,802036e8 <sys_execve+0xc0>
  return -1;
    802036fa:	597d                	li	s2,-1
    802036fc:	a82d                	j	80203736 <sys_execve+0x10e>
      argv[i] = 0;
    802036fe:	0b0e                	slli	s6,s6,0x3
    80203700:	fc040793          	addi	a5,s0,-64
    80203704:	9b3e                	add	s6,s6,a5
    80203706:	de0b3c23          	sd	zero,-520(s6)
  int ret = exec(path, argv);
    8020370a:	db840593          	addi	a1,s0,-584
    8020370e:	eb840513          	addi	a0,s0,-328
    80203712:	00001097          	auipc	ra,0x1
    80203716:	c58080e7          	jalr	-936(ra) # 8020436a <exec>
    8020371a:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020371c:	10048993          	addi	s3,s1,256
    80203720:	6088                	ld	a0,0(s1)
    80203722:	c911                	beqz	a0,80203736 <sys_execve+0x10e>
    kfree(argv[i]);
    80203724:	ffffd097          	auipc	ra,0xffffd
    80203728:	d20080e7          	jalr	-736(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020372c:	04a1                	addi	s1,s1,8
    8020372e:	ff3499e3          	bne	s1,s3,80203720 <sys_execve+0xf8>
    80203732:	a011                	j	80203736 <sys_execve+0x10e>
  return -1;
    80203734:	597d                	li	s2,-1

}
    80203736:	854a                	mv	a0,s2
    80203738:	25813083          	ld	ra,600(sp)
    8020373c:	25013403          	ld	s0,592(sp)
    80203740:	24813483          	ld	s1,584(sp)
    80203744:	24013903          	ld	s2,576(sp)
    80203748:	23813983          	ld	s3,568(sp)
    8020374c:	23013a03          	ld	s4,560(sp)
    80203750:	22813a83          	ld	s5,552(sp)
    80203754:	22013b03          	ld	s6,544(sp)
    80203758:	26010113          	addi	sp,sp,608
    8020375c:	8082                	ret

000000008020375e <sys_shutdown>:

uint64 sys_shutdown(){
    8020375e:	1141                	addi	sp,sp,-16
    80203760:	e422                	sd	s0,8(sp)
    80203762:	0800                	addi	s0,sp,16
	SBI_CALL_0(SBI_SHUTDOWN);
    80203764:	4501                	li	a0,0
    80203766:	4581                	li	a1,0
    80203768:	4601                	li	a2,0
    8020376a:	4681                	li	a3,0
    8020376c:	48a1                	li	a7,8
    8020376e:	00000073          	ecall
    sbi_shutdown();
    return 0;
}
    80203772:	4501                	li	a0,0
    80203774:	6422                	ld	s0,8(sp)
    80203776:	0141                	addi	sp,sp,16
    80203778:	8082                	ret

000000008020377a <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    8020377a:	7139                	addi	sp,sp,-64
    8020377c:	fc06                	sd	ra,56(sp)
    8020377e:	f822                	sd	s0,48(sp)
    80203780:	f426                	sd	s1,40(sp)
    80203782:	f04a                	sd	s2,32(sp)
    80203784:	ec4e                	sd	s3,24(sp)
    80203786:	e852                	sd	s4,16(sp)
    80203788:	e456                	sd	s5,8(sp)
    8020378a:	0080                	addi	s0,sp,64
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    8020378c:	00007597          	auipc	a1,0x7
    80203790:	3d458593          	addi	a1,a1,980 # 8020ab60 <digits+0x7e0>
    80203794:	00022517          	auipc	a0,0x22
    80203798:	25c50513          	addi	a0,a0,604 # 802259f0 <bcache>
    8020379c:	ffffd097          	auipc	ra,0xffffd
    802037a0:	ee8080e7          	jalr	-280(ra) # 80200684 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    802037a4:	00026797          	auipc	a5,0x26
    802037a8:	24c78793          	addi	a5,a5,588 # 802299f0 <bcache+0x4000>
    802037ac:	00027717          	auipc	a4,0x27
    802037b0:	8ac70713          	addi	a4,a4,-1876 # 8022a058 <bcache+0x4668>
    802037b4:	6ae7b823          	sd	a4,1712(a5)
  bcache.head.next = &bcache.head;
    802037b8:	6ae7bc23          	sd	a4,1720(a5)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    802037bc:	00022497          	auipc	s1,0x22
    802037c0:	24c48493          	addi	s1,s1,588 # 80225a08 <bcache+0x18>
    b->refcnt = 0;
    b->sectorno = ~0;
    802037c4:	5a7d                	li	s4,-1
    b->dev = ~0;
    b->next = bcache.head.next;
    802037c6:	893e                	mv	s2,a5
    b->prev = &bcache.head;
    802037c8:	89ba                	mv	s3,a4
    initsleeplock(&b->lock, "buffer");
    802037ca:	00007a97          	auipc	s5,0x7
    802037ce:	39ea8a93          	addi	s5,s5,926 # 8020ab68 <digits+0x7e8>
    b->refcnt = 0;
    802037d2:	0404a023          	sw	zero,64(s1)
    b->sectorno = ~0;
    802037d6:	0144a623          	sw	s4,12(s1)
    b->dev = ~0;
    802037da:	0144a423          	sw	s4,8(s1)
    b->next = bcache.head.next;
    802037de:	6b893783          	ld	a5,1720(s2)
    802037e2:	e8bc                	sd	a5,80(s1)
    b->prev = &bcache.head;
    802037e4:	0534b423          	sd	s3,72(s1)
    initsleeplock(&b->lock, "buffer");
    802037e8:	85d6                	mv	a1,s5
    802037ea:	01048513          	addi	a0,s1,16
    802037ee:	00000097          	auipc	ra,0x0
    802037f2:	26e080e7          	jalr	622(ra) # 80203a5c <initsleeplock>
    bcache.head.next->prev = b;
    802037f6:	6b893783          	ld	a5,1720(s2)
    802037fa:	e7a4                	sd	s1,72(a5)
    bcache.head.next = b;
    802037fc:	6a993c23          	sd	s1,1720(s2)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80203800:	25848493          	addi	s1,s1,600
    80203804:	fd3497e3          	bne	s1,s3,802037d2 <binit+0x58>
  }
  #ifdef DEBUG
  printf("binit\n");
  #endif
}
    80203808:	70e2                	ld	ra,56(sp)
    8020380a:	7442                	ld	s0,48(sp)
    8020380c:	74a2                	ld	s1,40(sp)
    8020380e:	7902                	ld	s2,32(sp)
    80203810:	69e2                	ld	s3,24(sp)
    80203812:	6a42                	ld	s4,16(sp)
    80203814:	6aa2                	ld	s5,8(sp)
    80203816:	6121                	addi	sp,sp,64
    80203818:	8082                	ret

000000008020381a <bread>:
  panic("bget: no buffers");
}

// Return a locked buf with the contents of the indicated block.
struct buf* 
bread(uint dev, uint sectorno) {
    8020381a:	7179                	addi	sp,sp,-48
    8020381c:	f406                	sd	ra,40(sp)
    8020381e:	f022                	sd	s0,32(sp)
    80203820:	ec26                	sd	s1,24(sp)
    80203822:	e84a                	sd	s2,16(sp)
    80203824:	e44e                	sd	s3,8(sp)
    80203826:	1800                	addi	s0,sp,48
    80203828:	89aa                	mv	s3,a0
    8020382a:	892e                	mv	s2,a1
  acquire(&bcache.lock);
    8020382c:	00022517          	auipc	a0,0x22
    80203830:	1c450513          	addi	a0,a0,452 # 802259f0 <bcache>
    80203834:	ffffd097          	auipc	ra,0xffffd
    80203838:	e94080e7          	jalr	-364(ra) # 802006c8 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    8020383c:	00027497          	auipc	s1,0x27
    80203840:	86c4b483          	ld	s1,-1940(s1) # 8022a0a8 <bcache+0x46b8>
    80203844:	00027797          	auipc	a5,0x27
    80203848:	81478793          	addi	a5,a5,-2028 # 8022a058 <bcache+0x4668>
    8020384c:	02f48f63          	beq	s1,a5,8020388a <bread+0x70>
    80203850:	873e                	mv	a4,a5
    80203852:	a021                	j	8020385a <bread+0x40>
    80203854:	68a4                	ld	s1,80(s1)
    80203856:	02e48a63          	beq	s1,a4,8020388a <bread+0x70>
    if(b->dev == dev && b->sectorno == sectorno){
    8020385a:	449c                	lw	a5,8(s1)
    8020385c:	ff379ce3          	bne	a5,s3,80203854 <bread+0x3a>
    80203860:	44dc                	lw	a5,12(s1)
    80203862:	ff2799e3          	bne	a5,s2,80203854 <bread+0x3a>
      b->refcnt++;
    80203866:	40bc                	lw	a5,64(s1)
    80203868:	2785                	addiw	a5,a5,1
    8020386a:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    8020386c:	00022517          	auipc	a0,0x22
    80203870:	18450513          	addi	a0,a0,388 # 802259f0 <bcache>
    80203874:	ffffd097          	auipc	ra,0xffffd
    80203878:	ea8080e7          	jalr	-344(ra) # 8020071c <release>
      acquiresleep(&b->lock);
    8020387c:	01048513          	addi	a0,s1,16
    80203880:	00000097          	auipc	ra,0x0
    80203884:	216080e7          	jalr	534(ra) # 80203a96 <acquiresleep>
      return b;
    80203888:	a8b9                	j	802038e6 <bread+0xcc>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    8020388a:	00027497          	auipc	s1,0x27
    8020388e:	8164b483          	ld	s1,-2026(s1) # 8022a0a0 <bcache+0x46b0>
    80203892:	00026797          	auipc	a5,0x26
    80203896:	7c678793          	addi	a5,a5,1990 # 8022a058 <bcache+0x4668>
    8020389a:	00f48863          	beq	s1,a5,802038aa <bread+0x90>
    8020389e:	873e                	mv	a4,a5
    if(b->refcnt == 0) {
    802038a0:	40bc                	lw	a5,64(s1)
    802038a2:	cf81                	beqz	a5,802038ba <bread+0xa0>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    802038a4:	64a4                	ld	s1,72(s1)
    802038a6:	fee49de3          	bne	s1,a4,802038a0 <bread+0x86>
  panic("bget: no buffers");
    802038aa:	00007517          	auipc	a0,0x7
    802038ae:	2c650513          	addi	a0,a0,710 # 8020ab70 <digits+0x7f0>
    802038b2:	ffffd097          	auipc	ra,0xffffd
    802038b6:	890080e7          	jalr	-1904(ra) # 80200142 <panic>
      b->dev = dev;
    802038ba:	0134a423          	sw	s3,8(s1)
      b->sectorno = sectorno;
    802038be:	0124a623          	sw	s2,12(s1)
      b->valid = 0;
    802038c2:	0004a023          	sw	zero,0(s1)
      b->refcnt = 1;
    802038c6:	4785                	li	a5,1
    802038c8:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    802038ca:	00022517          	auipc	a0,0x22
    802038ce:	12650513          	addi	a0,a0,294 # 802259f0 <bcache>
    802038d2:	ffffd097          	auipc	ra,0xffffd
    802038d6:	e4a080e7          	jalr	-438(ra) # 8020071c <release>
      acquiresleep(&b->lock);
    802038da:	01048513          	addi	a0,s1,16
    802038de:	00000097          	auipc	ra,0x0
    802038e2:	1b8080e7          	jalr	440(ra) # 80203a96 <acquiresleep>
  struct buf *b;

  b = bget(dev, sectorno);
  if (!b->valid) {
    802038e6:	409c                	lw	a5,0(s1)
    802038e8:	cb89                	beqz	a5,802038fa <bread+0xe0>
    disk_read(b);
    b->valid = 1;
  }

  return b;
}
    802038ea:	8526                	mv	a0,s1
    802038ec:	70a2                	ld	ra,40(sp)
    802038ee:	7402                	ld	s0,32(sp)
    802038f0:	64e2                	ld	s1,24(sp)
    802038f2:	6942                	ld	s2,16(sp)
    802038f4:	69a2                	ld	s3,8(sp)
    802038f6:	6145                	addi	sp,sp,48
    802038f8:	8082                	ret
    disk_read(b);
    802038fa:	8526                	mv	a0,s1
    802038fc:	00002097          	auipc	ra,0x2
    80203900:	376080e7          	jalr	886(ra) # 80205c72 <disk_read>
    b->valid = 1;
    80203904:	4785                	li	a5,1
    80203906:	c09c                	sw	a5,0(s1)
  return b;
    80203908:	b7cd                	j	802038ea <bread+0xd0>

000000008020390a <bwrite>:

// Write b's contents to disk.  Must be locked.
void 
bwrite(struct buf *b) {
    8020390a:	1101                	addi	sp,sp,-32
    8020390c:	ec06                	sd	ra,24(sp)
    8020390e:	e822                	sd	s0,16(sp)
    80203910:	e426                	sd	s1,8(sp)
    80203912:	1000                	addi	s0,sp,32
    80203914:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203916:	0541                	addi	a0,a0,16
    80203918:	00000097          	auipc	ra,0x0
    8020391c:	218080e7          	jalr	536(ra) # 80203b30 <holdingsleep>
    80203920:	c919                	beqz	a0,80203936 <bwrite+0x2c>
    panic("bwrite");
  disk_write(b);
    80203922:	8526                	mv	a0,s1
    80203924:	00002097          	auipc	ra,0x2
    80203928:	368080e7          	jalr	872(ra) # 80205c8c <disk_write>
}
    8020392c:	60e2                	ld	ra,24(sp)
    8020392e:	6442                	ld	s0,16(sp)
    80203930:	64a2                	ld	s1,8(sp)
    80203932:	6105                	addi	sp,sp,32
    80203934:	8082                	ret
    panic("bwrite");
    80203936:	00007517          	auipc	a0,0x7
    8020393a:	25250513          	addi	a0,a0,594 # 8020ab88 <digits+0x808>
    8020393e:	ffffd097          	auipc	ra,0xffffd
    80203942:	804080e7          	jalr	-2044(ra) # 80200142 <panic>

0000000080203946 <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80203946:	1101                	addi	sp,sp,-32
    80203948:	ec06                	sd	ra,24(sp)
    8020394a:	e822                	sd	s0,16(sp)
    8020394c:	e426                	sd	s1,8(sp)
    8020394e:	e04a                	sd	s2,0(sp)
    80203950:	1000                	addi	s0,sp,32
    80203952:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203954:	01050913          	addi	s2,a0,16
    80203958:	854a                	mv	a0,s2
    8020395a:	00000097          	auipc	ra,0x0
    8020395e:	1d6080e7          	jalr	470(ra) # 80203b30 <holdingsleep>
    80203962:	c92d                	beqz	a0,802039d4 <brelse+0x8e>
    panic("brelse");

  releasesleep(&b->lock);
    80203964:	854a                	mv	a0,s2
    80203966:	00000097          	auipc	ra,0x0
    8020396a:	186080e7          	jalr	390(ra) # 80203aec <releasesleep>

  acquire(&bcache.lock);
    8020396e:	00022517          	auipc	a0,0x22
    80203972:	08250513          	addi	a0,a0,130 # 802259f0 <bcache>
    80203976:	ffffd097          	auipc	ra,0xffffd
    8020397a:	d52080e7          	jalr	-686(ra) # 802006c8 <acquire>
  b->refcnt--;
    8020397e:	40bc                	lw	a5,64(s1)
    80203980:	37fd                	addiw	a5,a5,-1
    80203982:	0007871b          	sext.w	a4,a5
    80203986:	c0bc                	sw	a5,64(s1)
  if (b->refcnt == 0) {
    80203988:	eb05                	bnez	a4,802039b8 <brelse+0x72>
    // no one is waiting for it.
    b->next->prev = b->prev;
    8020398a:	68bc                	ld	a5,80(s1)
    8020398c:	64b8                	ld	a4,72(s1)
    8020398e:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80203990:	64bc                	ld	a5,72(s1)
    80203992:	68b8                	ld	a4,80(s1)
    80203994:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80203996:	00026797          	auipc	a5,0x26
    8020399a:	05a78793          	addi	a5,a5,90 # 802299f0 <bcache+0x4000>
    8020399e:	6b87b703          	ld	a4,1720(a5)
    802039a2:	e8b8                	sd	a4,80(s1)
    b->prev = &bcache.head;
    802039a4:	00026717          	auipc	a4,0x26
    802039a8:	6b470713          	addi	a4,a4,1716 # 8022a058 <bcache+0x4668>
    802039ac:	e4b8                	sd	a4,72(s1)
    bcache.head.next->prev = b;
    802039ae:	6b87b703          	ld	a4,1720(a5)
    802039b2:	e724                	sd	s1,72(a4)
    bcache.head.next = b;
    802039b4:	6a97bc23          	sd	s1,1720(a5)
  }
  
  release(&bcache.lock);
    802039b8:	00022517          	auipc	a0,0x22
    802039bc:	03850513          	addi	a0,a0,56 # 802259f0 <bcache>
    802039c0:	ffffd097          	auipc	ra,0xffffd
    802039c4:	d5c080e7          	jalr	-676(ra) # 8020071c <release>
}
    802039c8:	60e2                	ld	ra,24(sp)
    802039ca:	6442                	ld	s0,16(sp)
    802039cc:	64a2                	ld	s1,8(sp)
    802039ce:	6902                	ld	s2,0(sp)
    802039d0:	6105                	addi	sp,sp,32
    802039d2:	8082                	ret
    panic("brelse");
    802039d4:	00007517          	auipc	a0,0x7
    802039d8:	1bc50513          	addi	a0,a0,444 # 8020ab90 <digits+0x810>
    802039dc:	ffffc097          	auipc	ra,0xffffc
    802039e0:	766080e7          	jalr	1894(ra) # 80200142 <panic>

00000000802039e4 <bpin>:

void
bpin(struct buf *b) {
    802039e4:	1101                	addi	sp,sp,-32
    802039e6:	ec06                	sd	ra,24(sp)
    802039e8:	e822                	sd	s0,16(sp)
    802039ea:	e426                	sd	s1,8(sp)
    802039ec:	1000                	addi	s0,sp,32
    802039ee:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    802039f0:	00022517          	auipc	a0,0x22
    802039f4:	00050513          	mv	a0,a0
    802039f8:	ffffd097          	auipc	ra,0xffffd
    802039fc:	cd0080e7          	jalr	-816(ra) # 802006c8 <acquire>
  b->refcnt++;
    80203a00:	40bc                	lw	a5,64(s1)
    80203a02:	2785                	addiw	a5,a5,1
    80203a04:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203a06:	00022517          	auipc	a0,0x22
    80203a0a:	fea50513          	addi	a0,a0,-22 # 802259f0 <bcache>
    80203a0e:	ffffd097          	auipc	ra,0xffffd
    80203a12:	d0e080e7          	jalr	-754(ra) # 8020071c <release>
}
    80203a16:	60e2                	ld	ra,24(sp)
    80203a18:	6442                	ld	s0,16(sp)
    80203a1a:	64a2                	ld	s1,8(sp)
    80203a1c:	6105                	addi	sp,sp,32
    80203a1e:	8082                	ret

0000000080203a20 <bunpin>:

void
bunpin(struct buf *b) {
    80203a20:	1101                	addi	sp,sp,-32
    80203a22:	ec06                	sd	ra,24(sp)
    80203a24:	e822                	sd	s0,16(sp)
    80203a26:	e426                	sd	s1,8(sp)
    80203a28:	1000                	addi	s0,sp,32
    80203a2a:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80203a2c:	00022517          	auipc	a0,0x22
    80203a30:	fc450513          	addi	a0,a0,-60 # 802259f0 <bcache>
    80203a34:	ffffd097          	auipc	ra,0xffffd
    80203a38:	c94080e7          	jalr	-876(ra) # 802006c8 <acquire>
  b->refcnt--;
    80203a3c:	40bc                	lw	a5,64(s1)
    80203a3e:	37fd                	addiw	a5,a5,-1
    80203a40:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203a42:	00022517          	auipc	a0,0x22
    80203a46:	fae50513          	addi	a0,a0,-82 # 802259f0 <bcache>
    80203a4a:	ffffd097          	auipc	ra,0xffffd
    80203a4e:	cd2080e7          	jalr	-814(ra) # 8020071c <release>
}
    80203a52:	60e2                	ld	ra,24(sp)
    80203a54:	6442                	ld	s0,16(sp)
    80203a56:	64a2                	ld	s1,8(sp)
    80203a58:	6105                	addi	sp,sp,32
    80203a5a:	8082                	ret

0000000080203a5c <initsleeplock>:
#include "include/proc.h"
#include "include/sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80203a5c:	1101                	addi	sp,sp,-32
    80203a5e:	ec06                	sd	ra,24(sp)
    80203a60:	e822                	sd	s0,16(sp)
    80203a62:	e426                	sd	s1,8(sp)
    80203a64:	e04a                	sd	s2,0(sp)
    80203a66:	1000                	addi	s0,sp,32
    80203a68:	84aa                	mv	s1,a0
    80203a6a:	892e                	mv	s2,a1
  initlock(&lk->lk, "sleep lock");
    80203a6c:	00007597          	auipc	a1,0x7
    80203a70:	12c58593          	addi	a1,a1,300 # 8020ab98 <digits+0x818>
    80203a74:	0521                	addi	a0,a0,8
    80203a76:	ffffd097          	auipc	ra,0xffffd
    80203a7a:	c0e080e7          	jalr	-1010(ra) # 80200684 <initlock>
  lk->name = name;
    80203a7e:	0324b023          	sd	s2,32(s1)
  lk->locked = 0;
    80203a82:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203a86:	0204a423          	sw	zero,40(s1)
}
    80203a8a:	60e2                	ld	ra,24(sp)
    80203a8c:	6442                	ld	s0,16(sp)
    80203a8e:	64a2                	ld	s1,8(sp)
    80203a90:	6902                	ld	s2,0(sp)
    80203a92:	6105                	addi	sp,sp,32
    80203a94:	8082                	ret

0000000080203a96 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80203a96:	1101                	addi	sp,sp,-32
    80203a98:	ec06                	sd	ra,24(sp)
    80203a9a:	e822                	sd	s0,16(sp)
    80203a9c:	e426                	sd	s1,8(sp)
    80203a9e:	e04a                	sd	s2,0(sp)
    80203aa0:	1000                	addi	s0,sp,32
    80203aa2:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203aa4:	00850913          	addi	s2,a0,8
    80203aa8:	854a                	mv	a0,s2
    80203aaa:	ffffd097          	auipc	ra,0xffffd
    80203aae:	c1e080e7          	jalr	-994(ra) # 802006c8 <acquire>
  while (lk->locked) {
    80203ab2:	409c                	lw	a5,0(s1)
    80203ab4:	cb89                	beqz	a5,80203ac6 <acquiresleep+0x30>
    sleep(lk, &lk->lk);
    80203ab6:	85ca                	mv	a1,s2
    80203ab8:	8526                	mv	a0,s1
    80203aba:	fffff097          	auipc	ra,0xfffff
    80203abe:	814080e7          	jalr	-2028(ra) # 802022ce <sleep>
  while (lk->locked) {
    80203ac2:	409c                	lw	a5,0(s1)
    80203ac4:	fbed                	bnez	a5,80203ab6 <acquiresleep+0x20>
  }
  lk->locked = 1;
    80203ac6:	4785                	li	a5,1
    80203ac8:	c09c                	sw	a5,0(s1)
  lk->pid = myproc()->pid;
    80203aca:	ffffe097          	auipc	ra,0xffffe
    80203ace:	faa080e7          	jalr	-86(ra) # 80201a74 <myproc>
    80203ad2:	5d1c                	lw	a5,56(a0)
    80203ad4:	d49c                	sw	a5,40(s1)
  release(&lk->lk);
    80203ad6:	854a                	mv	a0,s2
    80203ad8:	ffffd097          	auipc	ra,0xffffd
    80203adc:	c44080e7          	jalr	-956(ra) # 8020071c <release>
}
    80203ae0:	60e2                	ld	ra,24(sp)
    80203ae2:	6442                	ld	s0,16(sp)
    80203ae4:	64a2                	ld	s1,8(sp)
    80203ae6:	6902                	ld	s2,0(sp)
    80203ae8:	6105                	addi	sp,sp,32
    80203aea:	8082                	ret

0000000080203aec <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80203aec:	1101                	addi	sp,sp,-32
    80203aee:	ec06                	sd	ra,24(sp)
    80203af0:	e822                	sd	s0,16(sp)
    80203af2:	e426                	sd	s1,8(sp)
    80203af4:	e04a                	sd	s2,0(sp)
    80203af6:	1000                	addi	s0,sp,32
    80203af8:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203afa:	00850913          	addi	s2,a0,8
    80203afe:	854a                	mv	a0,s2
    80203b00:	ffffd097          	auipc	ra,0xffffd
    80203b04:	bc8080e7          	jalr	-1080(ra) # 802006c8 <acquire>
  lk->locked = 0;
    80203b08:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203b0c:	0204a423          	sw	zero,40(s1)
  wakeup(lk);
    80203b10:	8526                	mv	a0,s1
    80203b12:	fffff097          	auipc	ra,0xfffff
    80203b16:	93e080e7          	jalr	-1730(ra) # 80202450 <wakeup>
  release(&lk->lk);
    80203b1a:	854a                	mv	a0,s2
    80203b1c:	ffffd097          	auipc	ra,0xffffd
    80203b20:	c00080e7          	jalr	-1024(ra) # 8020071c <release>
}
    80203b24:	60e2                	ld	ra,24(sp)
    80203b26:	6442                	ld	s0,16(sp)
    80203b28:	64a2                	ld	s1,8(sp)
    80203b2a:	6902                	ld	s2,0(sp)
    80203b2c:	6105                	addi	sp,sp,32
    80203b2e:	8082                	ret

0000000080203b30 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80203b30:	7179                	addi	sp,sp,-48
    80203b32:	f406                	sd	ra,40(sp)
    80203b34:	f022                	sd	s0,32(sp)
    80203b36:	ec26                	sd	s1,24(sp)
    80203b38:	e84a                	sd	s2,16(sp)
    80203b3a:	e44e                	sd	s3,8(sp)
    80203b3c:	1800                	addi	s0,sp,48
    80203b3e:	84aa                	mv	s1,a0
  int r;
  
  acquire(&lk->lk);
    80203b40:	00850913          	addi	s2,a0,8
    80203b44:	854a                	mv	a0,s2
    80203b46:	ffffd097          	auipc	ra,0xffffd
    80203b4a:	b82080e7          	jalr	-1150(ra) # 802006c8 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80203b4e:	409c                	lw	a5,0(s1)
    80203b50:	ef99                	bnez	a5,80203b6e <holdingsleep+0x3e>
    80203b52:	4481                	li	s1,0
  release(&lk->lk);
    80203b54:	854a                	mv	a0,s2
    80203b56:	ffffd097          	auipc	ra,0xffffd
    80203b5a:	bc6080e7          	jalr	-1082(ra) # 8020071c <release>
  return r;
}
    80203b5e:	8526                	mv	a0,s1
    80203b60:	70a2                	ld	ra,40(sp)
    80203b62:	7402                	ld	s0,32(sp)
    80203b64:	64e2                	ld	s1,24(sp)
    80203b66:	6942                	ld	s2,16(sp)
    80203b68:	69a2                	ld	s3,8(sp)
    80203b6a:	6145                	addi	sp,sp,48
    80203b6c:	8082                	ret
  r = lk->locked && (lk->pid == myproc()->pid);
    80203b6e:	0284a983          	lw	s3,40(s1)
    80203b72:	ffffe097          	auipc	ra,0xffffe
    80203b76:	f02080e7          	jalr	-254(ra) # 80201a74 <myproc>
    80203b7a:	5d04                	lw	s1,56(a0)
    80203b7c:	413484b3          	sub	s1,s1,s3
    80203b80:	0014b493          	seqz	s1,s1
    80203b84:	bfc1                	j	80203b54 <holdingsleep+0x24>

0000000080203b86 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80203b86:	1101                	addi	sp,sp,-32
    80203b88:	ec06                	sd	ra,24(sp)
    80203b8a:	e822                	sd	s0,16(sp)
    80203b8c:	e426                	sd	s1,8(sp)
    80203b8e:	e04a                	sd	s2,0(sp)
    80203b90:	1000                	addi	s0,sp,32
  initlock(&ftable.lock, "ftable");
    80203b92:	00007597          	auipc	a1,0x7
    80203b96:	01658593          	addi	a1,a1,22 # 8020aba8 <digits+0x828>
    80203b9a:	00026517          	auipc	a0,0x26
    80203b9e:	7b650513          	addi	a0,a0,1974 # 8022a350 <ftable>
    80203ba2:	ffffd097          	auipc	ra,0xffffd
    80203ba6:	ae2080e7          	jalr	-1310(ra) # 80200684 <initlock>
  struct file *f;
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203baa:	00026497          	auipc	s1,0x26
    80203bae:	7be48493          	addi	s1,s1,1982 # 8022a368 <ftable+0x18>
    80203bb2:	00028917          	auipc	s2,0x28
    80203bb6:	bb690913          	addi	s2,s2,-1098 # 8022b768 <tickslock>
    memset(f, 0, sizeof(struct file));
    80203bba:	02800613          	li	a2,40
    80203bbe:	4581                	li	a1,0
    80203bc0:	8526                	mv	a0,s1
    80203bc2:	ffffd097          	auipc	ra,0xffffd
    80203bc6:	ba2080e7          	jalr	-1118(ra) # 80200764 <memset>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203bca:	02848493          	addi	s1,s1,40
    80203bce:	ff2496e3          	bne	s1,s2,80203bba <fileinit+0x34>
  }
  #ifdef DEBUG
  printf("fileinit\n");
  #endif
}
    80203bd2:	60e2                	ld	ra,24(sp)
    80203bd4:	6442                	ld	s0,16(sp)
    80203bd6:	64a2                	ld	s1,8(sp)
    80203bd8:	6902                	ld	s2,0(sp)
    80203bda:	6105                	addi	sp,sp,32
    80203bdc:	8082                	ret

0000000080203bde <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80203bde:	1101                	addi	sp,sp,-32
    80203be0:	ec06                	sd	ra,24(sp)
    80203be2:	e822                	sd	s0,16(sp)
    80203be4:	e426                	sd	s1,8(sp)
    80203be6:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80203be8:	00026517          	auipc	a0,0x26
    80203bec:	76850513          	addi	a0,a0,1896 # 8022a350 <ftable>
    80203bf0:	ffffd097          	auipc	ra,0xffffd
    80203bf4:	ad8080e7          	jalr	-1320(ra) # 802006c8 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203bf8:	00026497          	auipc	s1,0x26
    80203bfc:	77048493          	addi	s1,s1,1904 # 8022a368 <ftable+0x18>
    80203c00:	00028717          	auipc	a4,0x28
    80203c04:	b6870713          	addi	a4,a4,-1176 # 8022b768 <tickslock>
    if(f->ref == 0){
    80203c08:	40dc                	lw	a5,4(s1)
    80203c0a:	cf99                	beqz	a5,80203c28 <filealloc+0x4a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203c0c:	02848493          	addi	s1,s1,40
    80203c10:	fee49ce3          	bne	s1,a4,80203c08 <filealloc+0x2a>
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
    80203c14:	00026517          	auipc	a0,0x26
    80203c18:	73c50513          	addi	a0,a0,1852 # 8022a350 <ftable>
    80203c1c:	ffffd097          	auipc	ra,0xffffd
    80203c20:	b00080e7          	jalr	-1280(ra) # 8020071c <release>
  return NULL;
    80203c24:	4481                	li	s1,0
    80203c26:	a819                	j	80203c3c <filealloc+0x5e>
      f->ref = 1;
    80203c28:	4785                	li	a5,1
    80203c2a:	c0dc                	sw	a5,4(s1)
      release(&ftable.lock);
    80203c2c:	00026517          	auipc	a0,0x26
    80203c30:	72450513          	addi	a0,a0,1828 # 8022a350 <ftable>
    80203c34:	ffffd097          	auipc	ra,0xffffd
    80203c38:	ae8080e7          	jalr	-1304(ra) # 8020071c <release>
}
    80203c3c:	8526                	mv	a0,s1
    80203c3e:	60e2                	ld	ra,24(sp)
    80203c40:	6442                	ld	s0,16(sp)
    80203c42:	64a2                	ld	s1,8(sp)
    80203c44:	6105                	addi	sp,sp,32
    80203c46:	8082                	ret

0000000080203c48 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80203c48:	1101                	addi	sp,sp,-32
    80203c4a:	ec06                	sd	ra,24(sp)
    80203c4c:	e822                	sd	s0,16(sp)
    80203c4e:	e426                	sd	s1,8(sp)
    80203c50:	1000                	addi	s0,sp,32
    80203c52:	84aa                	mv	s1,a0
  acquire(&ftable.lock);
    80203c54:	00026517          	auipc	a0,0x26
    80203c58:	6fc50513          	addi	a0,a0,1788 # 8022a350 <ftable>
    80203c5c:	ffffd097          	auipc	ra,0xffffd
    80203c60:	a6c080e7          	jalr	-1428(ra) # 802006c8 <acquire>
  if(f->ref < 1)
    80203c64:	40dc                	lw	a5,4(s1)
    80203c66:	02f05263          	blez	a5,80203c8a <filedup+0x42>
    panic("filedup");
  f->ref++;
    80203c6a:	2785                	addiw	a5,a5,1
    80203c6c:	c0dc                	sw	a5,4(s1)
  release(&ftable.lock);
    80203c6e:	00026517          	auipc	a0,0x26
    80203c72:	6e250513          	addi	a0,a0,1762 # 8022a350 <ftable>
    80203c76:	ffffd097          	auipc	ra,0xffffd
    80203c7a:	aa6080e7          	jalr	-1370(ra) # 8020071c <release>
  return f;
}
    80203c7e:	8526                	mv	a0,s1
    80203c80:	60e2                	ld	ra,24(sp)
    80203c82:	6442                	ld	s0,16(sp)
    80203c84:	64a2                	ld	s1,8(sp)
    80203c86:	6105                	addi	sp,sp,32
    80203c88:	8082                	ret
    panic("filedup");
    80203c8a:	00007517          	auipc	a0,0x7
    80203c8e:	f2650513          	addi	a0,a0,-218 # 8020abb0 <digits+0x830>
    80203c92:	ffffc097          	auipc	ra,0xffffc
    80203c96:	4b0080e7          	jalr	1200(ra) # 80200142 <panic>

0000000080203c9a <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80203c9a:	7139                	addi	sp,sp,-64
    80203c9c:	fc06                	sd	ra,56(sp)
    80203c9e:	f822                	sd	s0,48(sp)
    80203ca0:	f426                	sd	s1,40(sp)
    80203ca2:	f04a                	sd	s2,32(sp)
    80203ca4:	ec4e                	sd	s3,24(sp)
    80203ca6:	e852                	sd	s4,16(sp)
    80203ca8:	e456                	sd	s5,8(sp)
    80203caa:	0080                	addi	s0,sp,64
    80203cac:	84aa                	mv	s1,a0
  struct file ff;

  acquire(&ftable.lock);
    80203cae:	00026517          	auipc	a0,0x26
    80203cb2:	6a250513          	addi	a0,a0,1698 # 8022a350 <ftable>
    80203cb6:	ffffd097          	auipc	ra,0xffffd
    80203cba:	a12080e7          	jalr	-1518(ra) # 802006c8 <acquire>
  if(f->ref < 1)
    80203cbe:	40dc                	lw	a5,4(s1)
    80203cc0:	04f05863          	blez	a5,80203d10 <fileclose+0x76>
    panic("fileclose");
  if(--f->ref > 0){
    80203cc4:	37fd                	addiw	a5,a5,-1
    80203cc6:	0007871b          	sext.w	a4,a5
    80203cca:	c0dc                	sw	a5,4(s1)
    80203ccc:	04e04a63          	bgtz	a4,80203d20 <fileclose+0x86>
    release(&ftable.lock);
    return;
  }
  ff = *f;
    80203cd0:	0004a903          	lw	s2,0(s1)
    80203cd4:	0094ca03          	lbu	s4,9(s1)
    80203cd8:	0104b983          	ld	s3,16(s1)
    80203cdc:	0184ba83          	ld	s5,24(s1)
  f->ref = 0;
    80203ce0:	0004a223          	sw	zero,4(s1)
  f->type = FD_NONE;
    80203ce4:	0004a023          	sw	zero,0(s1)
  release(&ftable.lock);
    80203ce8:	00026517          	auipc	a0,0x26
    80203cec:	66850513          	addi	a0,a0,1640 # 8022a350 <ftable>
    80203cf0:	ffffd097          	auipc	ra,0xffffd
    80203cf4:	a2c080e7          	jalr	-1492(ra) # 8020071c <release>

  if(ff.type == FD_PIPE){
    80203cf8:	4785                	li	a5,1
    80203cfa:	04f90463          	beq	s2,a5,80203d42 <fileclose+0xa8>
    pipeclose(ff.pipe, ff.writable);
  } else if(ff.type == FD_ENTRY){
    80203cfe:	4789                	li	a5,2
    80203d00:	02f91863          	bne	s2,a5,80203d30 <fileclose+0x96>
    eput(ff.ep);
    80203d04:	8556                	mv	a0,s5
    80203d06:	00003097          	auipc	ra,0x3
    80203d0a:	170080e7          	jalr	368(ra) # 80206e76 <eput>
    80203d0e:	a00d                	j	80203d30 <fileclose+0x96>
    panic("fileclose");
    80203d10:	00007517          	auipc	a0,0x7
    80203d14:	ea850513          	addi	a0,a0,-344 # 8020abb8 <digits+0x838>
    80203d18:	ffffc097          	auipc	ra,0xffffc
    80203d1c:	42a080e7          	jalr	1066(ra) # 80200142 <panic>
    release(&ftable.lock);
    80203d20:	00026517          	auipc	a0,0x26
    80203d24:	63050513          	addi	a0,a0,1584 # 8022a350 <ftable>
    80203d28:	ffffd097          	auipc	ra,0xffffd
    80203d2c:	9f4080e7          	jalr	-1548(ra) # 8020071c <release>
  } else if (ff.type == FD_DEVICE) {

  }
}
    80203d30:	70e2                	ld	ra,56(sp)
    80203d32:	7442                	ld	s0,48(sp)
    80203d34:	74a2                	ld	s1,40(sp)
    80203d36:	7902                	ld	s2,32(sp)
    80203d38:	69e2                	ld	s3,24(sp)
    80203d3a:	6a42                	ld	s4,16(sp)
    80203d3c:	6aa2                	ld	s5,8(sp)
    80203d3e:	6121                	addi	sp,sp,64
    80203d40:	8082                	ret
    pipeclose(ff.pipe, ff.writable);
    80203d42:	85d2                	mv	a1,s4
    80203d44:	854e                	mv	a0,s3
    80203d46:	00000097          	auipc	ra,0x0
    80203d4a:	3a2080e7          	jalr	930(ra) # 802040e8 <pipeclose>
    80203d4e:	b7cd                	j	80203d30 <fileclose+0x96>

0000000080203d50 <filestat>:
int
filestat(struct file *f, uint64 addr)
{
  struct stat st;
  
  if(f->type == FD_ENTRY){
    80203d50:	4118                	lw	a4,0(a0)
    80203d52:	4789                	li	a5,2
    80203d54:	04f71e63          	bne	a4,a5,80203db0 <filestat+0x60>
{
    80203d58:	7159                	addi	sp,sp,-112
    80203d5a:	f486                	sd	ra,104(sp)
    80203d5c:	f0a2                	sd	s0,96(sp)
    80203d5e:	eca6                	sd	s1,88(sp)
    80203d60:	e8ca                	sd	s2,80(sp)
    80203d62:	e4ce                	sd	s3,72(sp)
    80203d64:	1880                	addi	s0,sp,112
    80203d66:	84aa                	mv	s1,a0
    80203d68:	892e                	mv	s2,a1
    elock(f->ep);
    80203d6a:	6d08                	ld	a0,24(a0)
    80203d6c:	00003097          	auipc	ra,0x3
    80203d70:	086080e7          	jalr	134(ra) # 80206df2 <elock>
    estat(f->ep, &st);
    80203d74:	f9840993          	addi	s3,s0,-104
    80203d78:	85ce                	mv	a1,s3
    80203d7a:	6c88                	ld	a0,24(s1)
    80203d7c:	00003097          	auipc	ra,0x3
    80203d80:	232080e7          	jalr	562(ra) # 80206fae <estat>
    eunlock(f->ep);
    80203d84:	6c88                	ld	a0,24(s1)
    80203d86:	00003097          	auipc	ra,0x3
    80203d8a:	0a2080e7          	jalr	162(ra) # 80206e28 <eunlock>
    // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203d8e:	03800613          	li	a2,56
    80203d92:	85ce                	mv	a1,s3
    80203d94:	854a                	mv	a0,s2
    80203d96:	ffffd097          	auipc	ra,0xffffd
    80203d9a:	602080e7          	jalr	1538(ra) # 80201398 <copyout2>
    80203d9e:	41f5551b          	sraiw	a0,a0,0x1f
      return -1;
    return 0;
  }
  return -1;
}
    80203da2:	70a6                	ld	ra,104(sp)
    80203da4:	7406                	ld	s0,96(sp)
    80203da6:	64e6                	ld	s1,88(sp)
    80203da8:	6946                	ld	s2,80(sp)
    80203daa:	69a6                	ld	s3,72(sp)
    80203dac:	6165                	addi	sp,sp,112
    80203dae:	8082                	ret
  return -1;
    80203db0:	557d                	li	a0,-1
}
    80203db2:	8082                	ret

0000000080203db4 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80203db4:	7179                	addi	sp,sp,-48
    80203db6:	f406                	sd	ra,40(sp)
    80203db8:	f022                	sd	s0,32(sp)
    80203dba:	ec26                	sd	s1,24(sp)
    80203dbc:	e84a                	sd	s2,16(sp)
    80203dbe:	e44e                	sd	s3,8(sp)
    80203dc0:	1800                	addi	s0,sp,48
  int r = 0;

  if(f->readable == 0)
    80203dc2:	00854783          	lbu	a5,8(a0)
    80203dc6:	c3d5                	beqz	a5,80203e6a <fileread+0xb6>
    80203dc8:	84aa                	mv	s1,a0
    80203dca:	89ae                	mv	s3,a1
    80203dcc:	8932                	mv	s2,a2
    return -1;

  switch (f->type) {
    80203dce:	411c                	lw	a5,0(a0)
    80203dd0:	4709                	li	a4,2
    80203dd2:	06e78263          	beq	a5,a4,80203e36 <fileread+0x82>
    80203dd6:	470d                	li	a4,3
    80203dd8:	02e78b63          	beq	a5,a4,80203e0e <fileread+0x5a>
    80203ddc:	4705                	li	a4,1
    80203dde:	00e78a63          	beq	a5,a4,80203df2 <fileread+0x3e>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
            f->off += r;
        eunlock(f->ep);
        break;
    default:
      panic("fileread");
    80203de2:	00007517          	auipc	a0,0x7
    80203de6:	de650513          	addi	a0,a0,-538 # 8020abc8 <digits+0x848>
    80203dea:	ffffc097          	auipc	ra,0xffffc
    80203dee:	358080e7          	jalr	856(ra) # 80200142 <panic>
        r = piperead(f->pipe, addr, n);
    80203df2:	6908                	ld	a0,16(a0)
    80203df4:	00000097          	auipc	ra,0x0
    80203df8:	48c080e7          	jalr	1164(ra) # 80204280 <piperead>
    80203dfc:	892a                	mv	s2,a0
  }

  return r;
}
    80203dfe:	854a                	mv	a0,s2
    80203e00:	70a2                	ld	ra,40(sp)
    80203e02:	7402                	ld	s0,32(sp)
    80203e04:	64e2                	ld	s1,24(sp)
    80203e06:	6942                	ld	s2,16(sp)
    80203e08:	69a2                	ld	s3,8(sp)
    80203e0a:	6145                	addi	sp,sp,48
    80203e0c:	8082                	ret
        if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80203e0e:	02451783          	lh	a5,36(a0)
    80203e12:	03079693          	slli	a3,a5,0x30
    80203e16:	92c1                	srli	a3,a3,0x30
    80203e18:	4725                	li	a4,9
    80203e1a:	04d76a63          	bltu	a4,a3,80203e6e <fileread+0xba>
    80203e1e:	0792                	slli	a5,a5,0x4
    80203e20:	00026717          	auipc	a4,0x26
    80203e24:	49070713          	addi	a4,a4,1168 # 8022a2b0 <devsw>
    80203e28:	97ba                	add	a5,a5,a4
    80203e2a:	639c                	ld	a5,0(a5)
    80203e2c:	c3b9                	beqz	a5,80203e72 <fileread+0xbe>
        r = devsw[f->major].read(1, addr, n);
    80203e2e:	4505                	li	a0,1
    80203e30:	9782                	jalr	a5
    80203e32:	892a                	mv	s2,a0
        break;
    80203e34:	b7e9                	j	80203dfe <fileread+0x4a>
        elock(f->ep);
    80203e36:	6d08                	ld	a0,24(a0)
    80203e38:	00003097          	auipc	ra,0x3
    80203e3c:	fba080e7          	jalr	-70(ra) # 80206df2 <elock>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
    80203e40:	874a                	mv	a4,s2
    80203e42:	5094                	lw	a3,32(s1)
    80203e44:	864e                	mv	a2,s3
    80203e46:	4585                	li	a1,1
    80203e48:	6c88                	ld	a0,24(s1)
    80203e4a:	00002097          	auipc	ra,0x2
    80203e4e:	6be080e7          	jalr	1726(ra) # 80206508 <eread>
    80203e52:	892a                	mv	s2,a0
    80203e54:	00a05563          	blez	a0,80203e5e <fileread+0xaa>
            f->off += r;
    80203e58:	509c                	lw	a5,32(s1)
    80203e5a:	9fa9                	addw	a5,a5,a0
    80203e5c:	d09c                	sw	a5,32(s1)
        eunlock(f->ep);
    80203e5e:	6c88                	ld	a0,24(s1)
    80203e60:	00003097          	auipc	ra,0x3
    80203e64:	fc8080e7          	jalr	-56(ra) # 80206e28 <eunlock>
        break;
    80203e68:	bf59                	j	80203dfe <fileread+0x4a>
    return -1;
    80203e6a:	597d                	li	s2,-1
    80203e6c:	bf49                	j	80203dfe <fileread+0x4a>
          return -1;
    80203e6e:	597d                	li	s2,-1
    80203e70:	b779                	j	80203dfe <fileread+0x4a>
    80203e72:	597d                	li	s2,-1
    80203e74:	b769                	j	80203dfe <fileread+0x4a>

0000000080203e76 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80203e76:	7179                	addi	sp,sp,-48
    80203e78:	f406                	sd	ra,40(sp)
    80203e7a:	f022                	sd	s0,32(sp)
    80203e7c:	ec26                	sd	s1,24(sp)
    80203e7e:	e84a                	sd	s2,16(sp)
    80203e80:	e44e                	sd	s3,8(sp)
    80203e82:	e052                	sd	s4,0(sp)
    80203e84:	1800                	addi	s0,sp,48
  int ret = 0;

  if(f->writable == 0)
    80203e86:	00954783          	lbu	a5,9(a0)
    80203e8a:	cbcd                	beqz	a5,80203f3c <filewrite+0xc6>
    80203e8c:	84aa                	mv	s1,a0
    80203e8e:	892e                	mv	s2,a1
    80203e90:	89b2                	mv	s3,a2
    return -1;

  if(f->type == FD_PIPE){
    80203e92:	411c                	lw	a5,0(a0)
    80203e94:	4705                	li	a4,1
    80203e96:	04e78963          	beq	a5,a4,80203ee8 <filewrite+0x72>
    ret = pipewrite(f->pipe, addr, n);
  } else if(f->type == FD_DEVICE){
    80203e9a:	470d                	li	a4,3
    80203e9c:	04e78d63          	beq	a5,a4,80203ef6 <filewrite+0x80>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
      return -1;
    ret = devsw[f->major].write(1, addr, n);
  } else if(f->type == FD_ENTRY){
    80203ea0:	4709                	li	a4,2
    80203ea2:	08e79563          	bne	a5,a4,80203f2c <filewrite+0xb6>
    elock(f->ep);
    80203ea6:	6d08                	ld	a0,24(a0)
    80203ea8:	00003097          	auipc	ra,0x3
    80203eac:	f4a080e7          	jalr	-182(ra) # 80206df2 <elock>
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203eb0:	00098a1b          	sext.w	s4,s3
    80203eb4:	8752                	mv	a4,s4
    80203eb6:	5094                	lw	a3,32(s1)
    80203eb8:	864a                	mv	a2,s2
    80203eba:	4585                	li	a1,1
    80203ebc:	6c88                	ld	a0,24(s1)
    80203ebe:	00002097          	auipc	ra,0x2
    80203ec2:	742080e7          	jalr	1858(ra) # 80206600 <ewrite>
      ret = n;
      f->off += n;
    } else {
      ret = -1;
    80203ec6:	597d                	li	s2,-1
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203ec8:	05350b63          	beq	a0,s3,80203f1e <filewrite+0xa8>
    }
    eunlock(f->ep);
    80203ecc:	6c88                	ld	a0,24(s1)
    80203ece:	00003097          	auipc	ra,0x3
    80203ed2:	f5a080e7          	jalr	-166(ra) # 80206e28 <eunlock>
  } else {
    panic("filewrite");
  }

  return ret;
}
    80203ed6:	854a                	mv	a0,s2
    80203ed8:	70a2                	ld	ra,40(sp)
    80203eda:	7402                	ld	s0,32(sp)
    80203edc:	64e2                	ld	s1,24(sp)
    80203ede:	6942                	ld	s2,16(sp)
    80203ee0:	69a2                	ld	s3,8(sp)
    80203ee2:	6a02                	ld	s4,0(sp)
    80203ee4:	6145                	addi	sp,sp,48
    80203ee6:	8082                	ret
    ret = pipewrite(f->pipe, addr, n);
    80203ee8:	6908                	ld	a0,16(a0)
    80203eea:	00000097          	auipc	ra,0x0
    80203eee:	26e080e7          	jalr	622(ra) # 80204158 <pipewrite>
    80203ef2:	892a                	mv	s2,a0
    80203ef4:	b7cd                	j	80203ed6 <filewrite+0x60>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80203ef6:	02451783          	lh	a5,36(a0)
    80203efa:	03079693          	slli	a3,a5,0x30
    80203efe:	92c1                	srli	a3,a3,0x30
    80203f00:	4725                	li	a4,9
    80203f02:	02d76f63          	bltu	a4,a3,80203f40 <filewrite+0xca>
    80203f06:	0792                	slli	a5,a5,0x4
    80203f08:	00026717          	auipc	a4,0x26
    80203f0c:	3a870713          	addi	a4,a4,936 # 8022a2b0 <devsw>
    80203f10:	97ba                	add	a5,a5,a4
    80203f12:	679c                	ld	a5,8(a5)
    80203f14:	cb85                	beqz	a5,80203f44 <filewrite+0xce>
    ret = devsw[f->major].write(1, addr, n);
    80203f16:	4505                	li	a0,1
    80203f18:	9782                	jalr	a5
    80203f1a:	892a                	mv	s2,a0
    80203f1c:	bf6d                	j	80203ed6 <filewrite+0x60>
      f->off += n;
    80203f1e:	509c                	lw	a5,32(s1)
    80203f20:	01478a3b          	addw	s4,a5,s4
    80203f24:	0344a023          	sw	s4,32(s1)
      ret = n;
    80203f28:	894e                	mv	s2,s3
    80203f2a:	b74d                	j	80203ecc <filewrite+0x56>
    panic("filewrite");
    80203f2c:	00007517          	auipc	a0,0x7
    80203f30:	cac50513          	addi	a0,a0,-852 # 8020abd8 <digits+0x858>
    80203f34:	ffffc097          	auipc	ra,0xffffc
    80203f38:	20e080e7          	jalr	526(ra) # 80200142 <panic>
    return -1;
    80203f3c:	597d                	li	s2,-1
    80203f3e:	bf61                	j	80203ed6 <filewrite+0x60>
      return -1;
    80203f40:	597d                	li	s2,-1
    80203f42:	bf51                	j	80203ed6 <filewrite+0x60>
    80203f44:	597d                	li	s2,-1
    80203f46:	bf41                	j	80203ed6 <filewrite+0x60>

0000000080203f48 <dirnext>:
int
dirnext(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();

  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203f48:	00854783          	lbu	a5,8(a0)
    80203f4c:	cfdd                	beqz	a5,8020400a <dirnext+0xc2>
{
    80203f4e:	7141                	addi	sp,sp,-496
    80203f50:	f786                	sd	ra,488(sp)
    80203f52:	f3a2                	sd	s0,480(sp)
    80203f54:	efa6                	sd	s1,472(sp)
    80203f56:	ebca                	sd	s2,464(sp)
    80203f58:	e7ce                	sd	s3,456(sp)
    80203f5a:	e3d2                	sd	s4,448(sp)
    80203f5c:	ff56                	sd	s5,440(sp)
    80203f5e:	1b80                	addi	s0,sp,496
    80203f60:	84aa                	mv	s1,a0
    80203f62:	8aae                	mv	s5,a1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203f64:	6d18                	ld	a4,24(a0)
    80203f66:	10074783          	lbu	a5,256(a4)
    80203f6a:	8bc1                	andi	a5,a5,16
    return -1;
    80203f6c:	557d                	li	a0,-1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203f6e:	eb91                	bnez	a5,80203f82 <dirnext+0x3a>
  // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    return -1;

  return 1;
    80203f70:	70be                	ld	ra,488(sp)
    80203f72:	741e                	ld	s0,480(sp)
    80203f74:	64fe                	ld	s1,472(sp)
    80203f76:	695e                	ld	s2,464(sp)
    80203f78:	69be                	ld	s3,456(sp)
    80203f7a:	6a1e                	ld	s4,448(sp)
    80203f7c:	7afa                	ld	s5,440(sp)
    80203f7e:	617d                	addi	sp,sp,496
    80203f80:	8082                	ret
  int count = 0;
    80203f82:	e0042e23          	sw	zero,-484(s0)
  elock(f->ep);
    80203f86:	853a                	mv	a0,a4
    80203f88:	00003097          	auipc	ra,0x3
    80203f8c:	e6a080e7          	jalr	-406(ra) # 80206df2 <elock>
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80203f90:	e1c40a13          	addi	s4,s0,-484
    80203f94:	e5840993          	addi	s3,s0,-424
    80203f98:	a801                	j	80203fa8 <dirnext+0x60>
    f->off += count * 32;
    80203f9a:	e1c42783          	lw	a5,-484(s0)
    80203f9e:	0057971b          	slliw	a4,a5,0x5
    80203fa2:	509c                	lw	a5,32(s1)
    80203fa4:	9fb9                	addw	a5,a5,a4
    80203fa6:	d09c                	sw	a5,32(s1)
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80203fa8:	86d2                	mv	a3,s4
    80203faa:	5090                	lw	a2,32(s1)
    80203fac:	85ce                	mv	a1,s3
    80203fae:	6c88                	ld	a0,24(s1)
    80203fb0:	00003097          	auipc	ra,0x3
    80203fb4:	046080e7          	jalr	70(ra) # 80206ff6 <enext>
    80203fb8:	892a                	mv	s2,a0
    80203fba:	d165                	beqz	a0,80203f9a <dirnext+0x52>
  eunlock(f->ep);
    80203fbc:	6c88                	ld	a0,24(s1)
    80203fbe:	00003097          	auipc	ra,0x3
    80203fc2:	e6a080e7          	jalr	-406(ra) # 80206e28 <eunlock>
  if (ret == -1)
    80203fc6:	57fd                	li	a5,-1
    return 0;
    80203fc8:	4501                	li	a0,0
  if (ret == -1)
    80203fca:	faf903e3          	beq	s2,a5,80203f70 <dirnext+0x28>
  f->off += count * 32;
    80203fce:	e1c42783          	lw	a5,-484(s0)
    80203fd2:	0057971b          	slliw	a4,a5,0x5
    80203fd6:	509c                	lw	a5,32(s1)
    80203fd8:	9fb9                	addw	a5,a5,a4
    80203fda:	d09c                	sw	a5,32(s1)
  estat(&de, &st);
    80203fdc:	e2040493          	addi	s1,s0,-480
    80203fe0:	85a6                	mv	a1,s1
    80203fe2:	e5840513          	addi	a0,s0,-424
    80203fe6:	00003097          	auipc	ra,0x3
    80203fea:	fc8080e7          	jalr	-56(ra) # 80206fae <estat>
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203fee:	03800613          	li	a2,56
    80203ff2:	85a6                	mv	a1,s1
    80203ff4:	8556                	mv	a0,s5
    80203ff6:	ffffd097          	auipc	ra,0xffffd
    80203ffa:	3a2080e7          	jalr	930(ra) # 80201398 <copyout2>
    80203ffe:	87aa                	mv	a5,a0
  return 1;
    80204000:	4505                	li	a0,1
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80204002:	f607d7e3          	bgez	a5,80203f70 <dirnext+0x28>
    return -1;
    80204006:	557d                	li	a0,-1
    80204008:	b7a5                	j	80203f70 <dirnext+0x28>
    return -1;
    8020400a:	557d                	li	a0,-1
    8020400c:	8082                	ret

000000008020400e <pipealloc>:
#include "include/kalloc.h"
#include "include/vm.h"

int
pipealloc(struct file **f0, struct file **f1)
{
    8020400e:	7179                	addi	sp,sp,-48
    80204010:	f406                	sd	ra,40(sp)
    80204012:	f022                	sd	s0,32(sp)
    80204014:	ec26                	sd	s1,24(sp)
    80204016:	e84a                	sd	s2,16(sp)
    80204018:	e44e                	sd	s3,8(sp)
    8020401a:	e052                	sd	s4,0(sp)
    8020401c:	1800                	addi	s0,sp,48
    8020401e:	84aa                	mv	s1,a0
    80204020:	8a2e                	mv	s4,a1
  struct pipe *pi;

  pi = 0;
  *f0 = *f1 = 0;
    80204022:	0005b023          	sd	zero,0(a1)
    80204026:	00053023          	sd	zero,0(a0)
  if((*f0 = filealloc()) == NULL || (*f1 = filealloc()) == NULL)
    8020402a:	00000097          	auipc	ra,0x0
    8020402e:	bb4080e7          	jalr	-1100(ra) # 80203bde <filealloc>
    80204032:	e088                	sd	a0,0(s1)
    80204034:	c551                	beqz	a0,802040c0 <pipealloc+0xb2>
    80204036:	00000097          	auipc	ra,0x0
    8020403a:	ba8080e7          	jalr	-1112(ra) # 80203bde <filealloc>
    8020403e:	00aa3023          	sd	a0,0(s4)
    80204042:	c92d                	beqz	a0,802040b4 <pipealloc+0xa6>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == NULL)
    80204044:	ffffc097          	auipc	ra,0xffffc
    80204048:	518080e7          	jalr	1304(ra) # 8020055c <kalloc>
    8020404c:	892a                	mv	s2,a0
    8020404e:	c125                	beqz	a0,802040ae <pipealloc+0xa0>
    goto bad;
  pi->readopen = 1;
    80204050:	4985                	li	s3,1
    80204052:	23352023          	sw	s3,544(a0)
  pi->writeopen = 1;
    80204056:	23352223          	sw	s3,548(a0)
  pi->nwrite = 0;
    8020405a:	20052e23          	sw	zero,540(a0)
  pi->nread = 0;
    8020405e:	20052c23          	sw	zero,536(a0)
  initlock(&pi->lock, "pipe");
    80204062:	00007597          	auipc	a1,0x7
    80204066:	99658593          	addi	a1,a1,-1642 # 8020a9f8 <digits+0x678>
    8020406a:	ffffc097          	auipc	ra,0xffffc
    8020406e:	61a080e7          	jalr	1562(ra) # 80200684 <initlock>
  (*f0)->type = FD_PIPE;
    80204072:	609c                	ld	a5,0(s1)
    80204074:	0137a023          	sw	s3,0(a5)
  (*f0)->readable = 1;
    80204078:	609c                	ld	a5,0(s1)
    8020407a:	01378423          	sb	s3,8(a5)
  (*f0)->writable = 0;
    8020407e:	609c                	ld	a5,0(s1)
    80204080:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80204084:	609c                	ld	a5,0(s1)
    80204086:	0127b823          	sd	s2,16(a5)
  (*f1)->type = FD_PIPE;
    8020408a:	000a3783          	ld	a5,0(s4)
    8020408e:	0137a023          	sw	s3,0(a5)
  (*f1)->readable = 0;
    80204092:	000a3783          	ld	a5,0(s4)
    80204096:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    8020409a:	000a3783          	ld	a5,0(s4)
    8020409e:	013784a3          	sb	s3,9(a5)
  (*f1)->pipe = pi;
    802040a2:	000a3783          	ld	a5,0(s4)
    802040a6:	0127b823          	sd	s2,16(a5)
  return 0;
    802040aa:	4501                	li	a0,0
    802040ac:	a025                	j	802040d4 <pipealloc+0xc6>

 bad:
  if(pi)
    kfree((char*)pi);
  if(*f0)
    802040ae:	6088                	ld	a0,0(s1)
    802040b0:	e501                	bnez	a0,802040b8 <pipealloc+0xaa>
    802040b2:	a039                	j	802040c0 <pipealloc+0xb2>
    802040b4:	6088                	ld	a0,0(s1)
    802040b6:	c51d                	beqz	a0,802040e4 <pipealloc+0xd6>
    fileclose(*f0);
    802040b8:	00000097          	auipc	ra,0x0
    802040bc:	be2080e7          	jalr	-1054(ra) # 80203c9a <fileclose>
  if(*f1)
    802040c0:	000a3783          	ld	a5,0(s4)
    fileclose(*f1);
  return -1;
    802040c4:	557d                	li	a0,-1
  if(*f1)
    802040c6:	c799                	beqz	a5,802040d4 <pipealloc+0xc6>
    fileclose(*f1);
    802040c8:	853e                	mv	a0,a5
    802040ca:	00000097          	auipc	ra,0x0
    802040ce:	bd0080e7          	jalr	-1072(ra) # 80203c9a <fileclose>
  return -1;
    802040d2:	557d                	li	a0,-1
}
    802040d4:	70a2                	ld	ra,40(sp)
    802040d6:	7402                	ld	s0,32(sp)
    802040d8:	64e2                	ld	s1,24(sp)
    802040da:	6942                	ld	s2,16(sp)
    802040dc:	69a2                	ld	s3,8(sp)
    802040de:	6a02                	ld	s4,0(sp)
    802040e0:	6145                	addi	sp,sp,48
    802040e2:	8082                	ret
  return -1;
    802040e4:	557d                	li	a0,-1
    802040e6:	b7fd                	j	802040d4 <pipealloc+0xc6>

00000000802040e8 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    802040e8:	1101                	addi	sp,sp,-32
    802040ea:	ec06                	sd	ra,24(sp)
    802040ec:	e822                	sd	s0,16(sp)
    802040ee:	e426                	sd	s1,8(sp)
    802040f0:	e04a                	sd	s2,0(sp)
    802040f2:	1000                	addi	s0,sp,32
    802040f4:	84aa                	mv	s1,a0
    802040f6:	892e                	mv	s2,a1
  acquire(&pi->lock);
    802040f8:	ffffc097          	auipc	ra,0xffffc
    802040fc:	5d0080e7          	jalr	1488(ra) # 802006c8 <acquire>
  if(writable){
    80204100:	02090d63          	beqz	s2,8020413a <pipeclose+0x52>
    pi->writeopen = 0;
    80204104:	2204a223          	sw	zero,548(s1)
    wakeup(&pi->nread);
    80204108:	21848513          	addi	a0,s1,536
    8020410c:	ffffe097          	auipc	ra,0xffffe
    80204110:	344080e7          	jalr	836(ra) # 80202450 <wakeup>
  } else {
    pi->readopen = 0;
    wakeup(&pi->nwrite);
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80204114:	2204b783          	ld	a5,544(s1)
    80204118:	eb95                	bnez	a5,8020414c <pipeclose+0x64>
    release(&pi->lock);
    8020411a:	8526                	mv	a0,s1
    8020411c:	ffffc097          	auipc	ra,0xffffc
    80204120:	600080e7          	jalr	1536(ra) # 8020071c <release>
    kfree((char*)pi);
    80204124:	8526                	mv	a0,s1
    80204126:	ffffc097          	auipc	ra,0xffffc
    8020412a:	31e080e7          	jalr	798(ra) # 80200444 <kfree>
  } else
    release(&pi->lock);
}
    8020412e:	60e2                	ld	ra,24(sp)
    80204130:	6442                	ld	s0,16(sp)
    80204132:	64a2                	ld	s1,8(sp)
    80204134:	6902                	ld	s2,0(sp)
    80204136:	6105                	addi	sp,sp,32
    80204138:	8082                	ret
    pi->readopen = 0;
    8020413a:	2204a023          	sw	zero,544(s1)
    wakeup(&pi->nwrite);
    8020413e:	21c48513          	addi	a0,s1,540
    80204142:	ffffe097          	auipc	ra,0xffffe
    80204146:	30e080e7          	jalr	782(ra) # 80202450 <wakeup>
    8020414a:	b7e9                	j	80204114 <pipeclose+0x2c>
    release(&pi->lock);
    8020414c:	8526                	mv	a0,s1
    8020414e:	ffffc097          	auipc	ra,0xffffc
    80204152:	5ce080e7          	jalr	1486(ra) # 8020071c <release>
}
    80204156:	bfe1                	j	8020412e <pipeclose+0x46>

0000000080204158 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80204158:	7175                	addi	sp,sp,-144
    8020415a:	e506                	sd	ra,136(sp)
    8020415c:	e122                	sd	s0,128(sp)
    8020415e:	fca6                	sd	s1,120(sp)
    80204160:	f8ca                	sd	s2,112(sp)
    80204162:	f4ce                	sd	s3,104(sp)
    80204164:	f0d2                	sd	s4,96(sp)
    80204166:	ecd6                	sd	s5,88(sp)
    80204168:	e8da                	sd	s6,80(sp)
    8020416a:	e4de                	sd	s7,72(sp)
    8020416c:	e0e2                	sd	s8,64(sp)
    8020416e:	fc66                	sd	s9,56(sp)
    80204170:	f86a                	sd	s10,48(sp)
    80204172:	f46e                	sd	s11,40(sp)
    80204174:	0900                	addi	s0,sp,144
    80204176:	84aa                	mv	s1,a0
    80204178:	f6b43c23          	sd	a1,-136(s0)
    8020417c:	8b32                	mv	s6,a2
  int i;
  char ch;
  struct proc *pr = myproc();
    8020417e:	ffffe097          	auipc	ra,0xffffe
    80204182:	8f6080e7          	jalr	-1802(ra) # 80201a74 <myproc>
    80204186:	892a                	mv	s2,a0

  acquire(&pi->lock);
    80204188:	8526                	mv	a0,s1
    8020418a:	ffffc097          	auipc	ra,0xffffc
    8020418e:	53e080e7          	jalr	1342(ra) # 802006c8 <acquire>
  for(i = 0; i < n; i++){
    80204192:	0d605a63          	blez	s6,80204266 <pipewrite+0x10e>
    80204196:	89a6                	mv	s3,s1
    80204198:	3b7d                	addiw	s6,s6,-1
    8020419a:	1b02                	slli	s6,s6,0x20
    8020419c:	020b5b13          	srli	s6,s6,0x20
    802041a0:	4b81                	li	s7,0
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
      if(pi->readopen == 0 || pr->killed){
        release(&pi->lock);
        return -1;
      }
      wakeup(&pi->nread);
    802041a2:	21848a93          	addi	s5,s1,536
      sleep(&pi->nwrite, &pi->lock);
    802041a6:	21c48a13          	addi	s4,s1,540
    }
    // if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    if(copyin2(&ch, addr + i, 1) == -1)
    802041aa:	f8f40d93          	addi	s11,s0,-113
    802041ae:	5d7d                	li	s10,-1
    802041b0:	000b8c9b          	sext.w	s9,s7
    802041b4:	8c66                	mv	s8,s9
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    802041b6:	2184a783          	lw	a5,536(s1)
    802041ba:	21c4a703          	lw	a4,540(s1)
    802041be:	2007879b          	addiw	a5,a5,512
    802041c2:	02f71b63          	bne	a4,a5,802041f8 <pipewrite+0xa0>
      if(pi->readopen == 0 || pr->killed){
    802041c6:	2204a783          	lw	a5,544(s1)
    802041ca:	cba5                	beqz	a5,8020423a <pipewrite+0xe2>
    802041cc:	03092783          	lw	a5,48(s2)
    802041d0:	e7ad                	bnez	a5,8020423a <pipewrite+0xe2>
      wakeup(&pi->nread);
    802041d2:	8556                	mv	a0,s5
    802041d4:	ffffe097          	auipc	ra,0xffffe
    802041d8:	27c080e7          	jalr	636(ra) # 80202450 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    802041dc:	85ce                	mv	a1,s3
    802041de:	8552                	mv	a0,s4
    802041e0:	ffffe097          	auipc	ra,0xffffe
    802041e4:	0ee080e7          	jalr	238(ra) # 802022ce <sleep>
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    802041e8:	2184a783          	lw	a5,536(s1)
    802041ec:	21c4a703          	lw	a4,540(s1)
    802041f0:	2007879b          	addiw	a5,a5,512
    802041f4:	fcf709e3          	beq	a4,a5,802041c6 <pipewrite+0x6e>
    if(copyin2(&ch, addr + i, 1) == -1)
    802041f8:	4605                	li	a2,1
    802041fa:	f7843783          	ld	a5,-136(s0)
    802041fe:	00fb85b3          	add	a1,s7,a5
    80204202:	856e                	mv	a0,s11
    80204204:	ffffd097          	auipc	ra,0xffffd
    80204208:	272080e7          	jalr	626(ra) # 80201476 <copyin2>
    8020420c:	05a50e63          	beq	a0,s10,80204268 <pipewrite+0x110>
      break;
    pi->data[pi->nwrite++ % PIPESIZE] = ch;
    80204210:	21c4a783          	lw	a5,540(s1)
    80204214:	0017871b          	addiw	a4,a5,1
    80204218:	20e4ae23          	sw	a4,540(s1)
    8020421c:	1ff7f793          	andi	a5,a5,511
    80204220:	97a6                	add	a5,a5,s1
    80204222:	f8f44703          	lbu	a4,-113(s0)
    80204226:	00e78c23          	sb	a4,24(a5)
  for(i = 0; i < n; i++){
    8020422a:	001c8c1b          	addiw	s8,s9,1
    8020422e:	001b8793          	addi	a5,s7,1
    80204232:	036b8b63          	beq	s7,s6,80204268 <pipewrite+0x110>
    80204236:	8bbe                	mv	s7,a5
    80204238:	bfa5                	j	802041b0 <pipewrite+0x58>
        release(&pi->lock);
    8020423a:	8526                	mv	a0,s1
    8020423c:	ffffc097          	auipc	ra,0xffffc
    80204240:	4e0080e7          	jalr	1248(ra) # 8020071c <release>
        return -1;
    80204244:	5c7d                	li	s8,-1
  }
  wakeup(&pi->nread);
  release(&pi->lock);
  return i;
}
    80204246:	8562                	mv	a0,s8
    80204248:	60aa                	ld	ra,136(sp)
    8020424a:	640a                	ld	s0,128(sp)
    8020424c:	74e6                	ld	s1,120(sp)
    8020424e:	7946                	ld	s2,112(sp)
    80204250:	79a6                	ld	s3,104(sp)
    80204252:	7a06                	ld	s4,96(sp)
    80204254:	6ae6                	ld	s5,88(sp)
    80204256:	6b46                	ld	s6,80(sp)
    80204258:	6ba6                	ld	s7,72(sp)
    8020425a:	6c06                	ld	s8,64(sp)
    8020425c:	7ce2                	ld	s9,56(sp)
    8020425e:	7d42                	ld	s10,48(sp)
    80204260:	7da2                	ld	s11,40(sp)
    80204262:	6149                	addi	sp,sp,144
    80204264:	8082                	ret
  for(i = 0; i < n; i++){
    80204266:	4c01                	li	s8,0
  wakeup(&pi->nread);
    80204268:	21848513          	addi	a0,s1,536
    8020426c:	ffffe097          	auipc	ra,0xffffe
    80204270:	1e4080e7          	jalr	484(ra) # 80202450 <wakeup>
  release(&pi->lock);
    80204274:	8526                	mv	a0,s1
    80204276:	ffffc097          	auipc	ra,0xffffc
    8020427a:	4a6080e7          	jalr	1190(ra) # 8020071c <release>
  return i;
    8020427e:	b7e1                	j	80204246 <pipewrite+0xee>

0000000080204280 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    80204280:	715d                	addi	sp,sp,-80
    80204282:	e486                	sd	ra,72(sp)
    80204284:	e0a2                	sd	s0,64(sp)
    80204286:	fc26                	sd	s1,56(sp)
    80204288:	f84a                	sd	s2,48(sp)
    8020428a:	f44e                	sd	s3,40(sp)
    8020428c:	f052                	sd	s4,32(sp)
    8020428e:	ec56                	sd	s5,24(sp)
    80204290:	e85a                	sd	s6,16(sp)
    80204292:	0880                	addi	s0,sp,80
    80204294:	84aa                	mv	s1,a0
    80204296:	892e                	mv	s2,a1
    80204298:	8a32                	mv	s4,a2
  int i;
  struct proc *pr = myproc();
    8020429a:	ffffd097          	auipc	ra,0xffffd
    8020429e:	7da080e7          	jalr	2010(ra) # 80201a74 <myproc>
    802042a2:	89aa                	mv	s3,a0
  char ch;

  acquire(&pi->lock);
    802042a4:	8b26                	mv	s6,s1
    802042a6:	8526                	mv	a0,s1
    802042a8:	ffffc097          	auipc	ra,0xffffc
    802042ac:	420080e7          	jalr	1056(ra) # 802006c8 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    802042b0:	2184a703          	lw	a4,536(s1)
    802042b4:	21c4a783          	lw	a5,540(s1)
    if(pr->killed){
      release(&pi->lock);
      return -1;
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    802042b8:	21848a93          	addi	s5,s1,536
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    802042bc:	02f71463          	bne	a4,a5,802042e4 <piperead+0x64>
    802042c0:	2244a783          	lw	a5,548(s1)
    802042c4:	c385                	beqz	a5,802042e4 <piperead+0x64>
    if(pr->killed){
    802042c6:	0309a783          	lw	a5,48(s3)
    802042ca:	e7d9                	bnez	a5,80204358 <piperead+0xd8>
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    802042cc:	85da                	mv	a1,s6
    802042ce:	8556                	mv	a0,s5
    802042d0:	ffffe097          	auipc	ra,0xffffe
    802042d4:	ffe080e7          	jalr	-2(ra) # 802022ce <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    802042d8:	2184a703          	lw	a4,536(s1)
    802042dc:	21c4a783          	lw	a5,540(s1)
    802042e0:	fef700e3          	beq	a4,a5,802042c0 <piperead+0x40>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    802042e4:	09405163          	blez	s4,80204366 <piperead+0xe6>
    802042e8:	4981                	li	s3,0
    if(pi->nread == pi->nwrite)
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    // if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    if(copyout2(addr + i, &ch, 1) == -1)
    802042ea:	fbf40b13          	addi	s6,s0,-65
    802042ee:	5afd                	li	s5,-1
    if(pi->nread == pi->nwrite)
    802042f0:	2184a783          	lw	a5,536(s1)
    802042f4:	21c4a703          	lw	a4,540(s1)
    802042f8:	02f70a63          	beq	a4,a5,8020432c <piperead+0xac>
    ch = pi->data[pi->nread++ % PIPESIZE];
    802042fc:	0017871b          	addiw	a4,a5,1
    80204300:	20e4ac23          	sw	a4,536(s1)
    80204304:	1ff7f793          	andi	a5,a5,511
    80204308:	97a6                	add	a5,a5,s1
    8020430a:	0187c783          	lbu	a5,24(a5)
    8020430e:	faf40fa3          	sb	a5,-65(s0)
    if(copyout2(addr + i, &ch, 1) == -1)
    80204312:	4605                	li	a2,1
    80204314:	85da                	mv	a1,s6
    80204316:	854a                	mv	a0,s2
    80204318:	ffffd097          	auipc	ra,0xffffd
    8020431c:	080080e7          	jalr	128(ra) # 80201398 <copyout2>
    80204320:	01550663          	beq	a0,s5,8020432c <piperead+0xac>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80204324:	2985                	addiw	s3,s3,1
    80204326:	0905                	addi	s2,s2,1
    80204328:	fd3a14e3          	bne	s4,s3,802042f0 <piperead+0x70>
      break;
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    8020432c:	21c48513          	addi	a0,s1,540
    80204330:	ffffe097          	auipc	ra,0xffffe
    80204334:	120080e7          	jalr	288(ra) # 80202450 <wakeup>
  release(&pi->lock);
    80204338:	8526                	mv	a0,s1
    8020433a:	ffffc097          	auipc	ra,0xffffc
    8020433e:	3e2080e7          	jalr	994(ra) # 8020071c <release>
  return i;
}
    80204342:	854e                	mv	a0,s3
    80204344:	60a6                	ld	ra,72(sp)
    80204346:	6406                	ld	s0,64(sp)
    80204348:	74e2                	ld	s1,56(sp)
    8020434a:	7942                	ld	s2,48(sp)
    8020434c:	79a2                	ld	s3,40(sp)
    8020434e:	7a02                	ld	s4,32(sp)
    80204350:	6ae2                	ld	s5,24(sp)
    80204352:	6b42                	ld	s6,16(sp)
    80204354:	6161                	addi	sp,sp,80
    80204356:	8082                	ret
      release(&pi->lock);
    80204358:	8526                	mv	a0,s1
    8020435a:	ffffc097          	auipc	ra,0xffffc
    8020435e:	3c2080e7          	jalr	962(ra) # 8020071c <release>
      return -1;
    80204362:	59fd                	li	s3,-1
    80204364:	bff9                	j	80204342 <piperead+0xc2>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80204366:	4981                	li	s3,0
    80204368:	b7d1                	j	8020432c <piperead+0xac>

000000008020436a <exec>:
  return 0;
}


int exec(char *path, char **argv)
{
    8020436a:	dd010113          	addi	sp,sp,-560
    8020436e:	22113423          	sd	ra,552(sp)
    80204372:	22813023          	sd	s0,544(sp)
    80204376:	20913c23          	sd	s1,536(sp)
    8020437a:	21213823          	sd	s2,528(sp)
    8020437e:	21313423          	sd	s3,520(sp)
    80204382:	21413023          	sd	s4,512(sp)
    80204386:	ffd6                	sd	s5,504(sp)
    80204388:	fbda                	sd	s6,496(sp)
    8020438a:	f7de                	sd	s7,488(sp)
    8020438c:	f3e2                	sd	s8,480(sp)
    8020438e:	efe6                	sd	s9,472(sp)
    80204390:	ebea                	sd	s10,464(sp)
    80204392:	e7ee                	sd	s11,456(sp)
    80204394:	1c00                	addi	s0,sp,560
    80204396:	892a                	mv	s2,a0
    80204398:	dca43c23          	sd	a0,-552(s0)
    8020439c:	deb43423          	sd	a1,-536(s0)
  struct elfhdr elf;
  struct dirent *ep;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
  pagetable_t kpagetable = 0, oldkpagetable;
  struct proc *p = myproc();
    802043a0:	ffffd097          	auipc	ra,0xffffd
    802043a4:	6d4080e7          	jalr	1748(ra) # 80201a74 <myproc>
    802043a8:	84aa                	mv	s1,a0

  // Make a copy of p->kpt without old user space, 
  // but with the same kstack we are using now, which can't be changed
  if ((kpagetable = (pagetable_t)kalloc()) == NULL) {
    802043aa:	ffffc097          	auipc	ra,0xffffc
    802043ae:	1b2080e7          	jalr	434(ra) # 8020055c <kalloc>
    802043b2:	2a050763          	beqz	a0,80204660 <exec+0x2f6>
    802043b6:	8aaa                	mv	s5,a0
    return -1;
  }
  memmove(kpagetable, p->kpagetable, PGSIZE);
    802043b8:	6605                	lui	a2,0x1
    802043ba:	6cac                	ld	a1,88(s1)
    802043bc:	ffffc097          	auipc	ra,0xffffc
    802043c0:	408080e7          	jalr	1032(ra) # 802007c4 <memmove>
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    kpagetable[i] = 0;
    802043c4:	000ab023          	sd	zero,0(s5)
    802043c8:	000ab423          	sd	zero,8(s5)
  }

  if((ep = ename(path)) == NULL) {
    802043cc:	854a                	mv	a0,s2
    802043ce:	00003097          	auipc	ra,0x3
    802043d2:	1ce080e7          	jalr	462(ra) # 8020759c <ename>
    802043d6:	8a2a                	mv	s4,a0
    802043d8:	3a050d63          	beqz	a0,80204792 <exec+0x428>
    #ifdef DEBUG
    printf("[exec] %s not found\n", path);
    #endif
    goto bad;
  }
  elock(ep);
    802043dc:	00003097          	auipc	ra,0x3
    802043e0:	a16080e7          	jalr	-1514(ra) # 80206df2 <elock>

  // Check ELF header
  if(eread(ep, 0, (uint64) &elf, 0, sizeof(elf)) != sizeof(elf))
    802043e4:	04000713          	li	a4,64
    802043e8:	4681                	li	a3,0
    802043ea:	e4840613          	addi	a2,s0,-440
    802043ee:	4581                	li	a1,0
    802043f0:	8552                	mv	a0,s4
    802043f2:	00002097          	auipc	ra,0x2
    802043f6:	116080e7          	jalr	278(ra) # 80206508 <eread>
    802043fa:	04000793          	li	a5,64
    802043fe:	00f51a63          	bne	a0,a5,80204412 <exec+0xa8>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    80204402:	e4842703          	lw	a4,-440(s0)
    80204406:	464c47b7          	lui	a5,0x464c4
    8020440a:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39d3ba81>
    8020440e:	00f70963          	beq	a4,a5,80204420 <exec+0xb6>
  printf("[exec] reach bad\n");
  #endif
  if(pagetable)
    proc_freepagetable(pagetable, sz);
  if(kpagetable)
    kvmfree(kpagetable, 0);
    80204412:	4581                	li	a1,0
    80204414:	8556                	mv	a0,s5
    80204416:	ffffd097          	auipc	ra,0xffffd
    8020441a:	284080e7          	jalr	644(ra) # 8020169a <kvmfree>
  if(ep){
    8020441e:	a4b5                	j	8020468a <exec+0x320>
  if((pagetable = proc_pagetable(p)) == NULL)
    80204420:	8526                	mv	a0,s1
    80204422:	ffffd097          	auipc	ra,0xffffd
    80204426:	736080e7          	jalr	1846(ra) # 80201b58 <proc_pagetable>
    8020442a:	e0a43423          	sd	a0,-504(s0)
    8020442e:	d175                	beqz	a0,80204412 <exec+0xa8>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80204430:	e6842783          	lw	a5,-408(s0)
    80204434:	e8045703          	lhu	a4,-384(s0)
    80204438:	cb3d                	beqz	a4,802044ae <exec+0x144>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    8020443a:	4481                	li	s1,0
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8020443c:	e0043023          	sd	zero,-512(s0)
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80204440:	e1040713          	addi	a4,s0,-496
    80204444:	dee43023          	sd	a4,-544(s0)
    if(ph.vaddr % PGSIZE != 0)
    80204448:	6b05                	lui	s6,0x1
    8020444a:	fffb0713          	addi	a4,s6,-1 # fff <_entry-0x801ff001>
    8020444e:	dce43823          	sd	a4,-560(s0)
  for(i = 0; i < sz; i += PGSIZE){
    80204452:	6d85                	lui	s11,0x1
    80204454:	7bfd                	lui	s7,0xfffff
    80204456:	a4c1                	j	80204716 <exec+0x3ac>
      panic("loadseg: address should exist");
    80204458:	00006517          	auipc	a0,0x6
    8020445c:	79050513          	addi	a0,a0,1936 # 8020abe8 <digits+0x868>
    80204460:	ffffc097          	auipc	ra,0xffffc
    80204464:	ce2080e7          	jalr	-798(ra) # 80200142 <panic>
    if(eread(ep, 0, (uint64)pa, offset+i, n) != n)
    80204468:	874e                	mv	a4,s3
    8020446a:	009d06bb          	addw	a3,s10,s1
    8020446e:	4581                	li	a1,0
    80204470:	8552                	mv	a0,s4
    80204472:	00002097          	auipc	ra,0x2
    80204476:	096080e7          	jalr	150(ra) # 80206508 <eread>
    8020447a:	2501                	sext.w	a0,a0
    8020447c:	1ea99663          	bne	s3,a0,80204668 <exec+0x2fe>
  for(i = 0; i < sz; i += PGSIZE){
    80204480:	009d84bb          	addw	s1,s11,s1
    80204484:	012b893b          	addw	s2,s7,s2
    80204488:	2784f763          	bgeu	s1,s8,802046f6 <exec+0x38c>
    pa = walkaddr(pagetable, va + i);
    8020448c:	02049593          	slli	a1,s1,0x20
    80204490:	9181                	srli	a1,a1,0x20
    80204492:	95e6                	add	a1,a1,s9
    80204494:	e0843503          	ld	a0,-504(s0)
    80204498:	ffffc097          	auipc	ra,0xffffc
    8020449c:	740080e7          	jalr	1856(ra) # 80200bd8 <walkaddr>
    802044a0:	862a                	mv	a2,a0
    if(pa == NULL)
    802044a2:	d95d                	beqz	a0,80204458 <exec+0xee>
      n = PGSIZE;
    802044a4:	89da                	mv	s3,s6
    if(sz - i < PGSIZE)
    802044a6:	fd6971e3          	bgeu	s2,s6,80204468 <exec+0xfe>
      n = sz - i;
    802044aa:	89ca                	mv	s3,s2
    802044ac:	bf75                	j	80204468 <exec+0xfe>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    802044ae:	4481                	li	s1,0
  eunlock(ep);
    802044b0:	8552                	mv	a0,s4
    802044b2:	00003097          	auipc	ra,0x3
    802044b6:	976080e7          	jalr	-1674(ra) # 80206e28 <eunlock>
  eput(ep);
    802044ba:	8552                	mv	a0,s4
    802044bc:	00003097          	auipc	ra,0x3
    802044c0:	9ba080e7          	jalr	-1606(ra) # 80206e76 <eput>
  p = myproc();
    802044c4:	ffffd097          	auipc	ra,0xffffd
    802044c8:	5b0080e7          	jalr	1456(ra) # 80201a74 <myproc>
    802044cc:	8b2a                	mv	s6,a0
  uint64 oldsz = p->sz;
    802044ce:	04853d83          	ld	s11,72(a0)
  sz = PGROUNDUP(sz);
    802044d2:	6785                	lui	a5,0x1
    802044d4:	17fd                	addi	a5,a5,-1
    802044d6:	94be                	add	s1,s1,a5
    802044d8:	77fd                	lui	a5,0xfffff
    802044da:	8fe5                	and	a5,a5,s1
    802044dc:	def43823          	sd	a5,-528(s0)
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    802044e0:	6689                	lui	a3,0x2
    802044e2:	96be                	add	a3,a3,a5
    802044e4:	863e                	mv	a2,a5
    802044e6:	85d6                	mv	a1,s5
    802044e8:	e0843483          	ld	s1,-504(s0)
    802044ec:	8526                	mv	a0,s1
    802044ee:	ffffd097          	auipc	ra,0xffffd
    802044f2:	b46080e7          	jalr	-1210(ra) # 80201034 <uvmalloc>
    802044f6:	8d2a                	mv	s10,a0
  ep = 0;
    802044f8:	4a01                	li	s4,0
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    802044fa:	16050763          	beqz	a0,80204668 <exec+0x2fe>
  uvmclear(pagetable, sz-2*PGSIZE);
    802044fe:	75f9                	lui	a1,0xffffe
    80204500:	95aa                	add	a1,a1,a0
    80204502:	8526                	mv	a0,s1
    80204504:	ffffd097          	auipc	ra,0xffffd
    80204508:	dd6080e7          	jalr	-554(ra) # 802012da <uvmclear>
  stackbase = sp - PGSIZE;
    8020450c:	7c7d                	lui	s8,0xfffff
    8020450e:	9c6a                	add	s8,s8,s10
  for(argc = 0; argv[argc]; argc++) {
    80204510:	de843783          	ld	a5,-536(s0)
    80204514:	6388                	ld	a0,0(a5)
    80204516:	c925                	beqz	a0,80204586 <exec+0x21c>
    80204518:	e8840993          	addi	s3,s0,-376
    8020451c:	f8840c93          	addi	s9,s0,-120
  sp = sz;
    80204520:	896a                	mv	s2,s10
  for(argc = 0; argv[argc]; argc++) {
    80204522:	4481                	li	s1,0
    sp -= strlen(argv[argc]) + 1;
    80204524:	ffffc097          	auipc	ra,0xffffc
    80204528:	3c8080e7          	jalr	968(ra) # 802008ec <strlen>
    8020452c:	2505                	addiw	a0,a0,1
    8020452e:	40a90933          	sub	s2,s2,a0
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    80204532:	ff097913          	andi	s2,s2,-16
    if(sp < stackbase)
    80204536:	1b896463          	bltu	s2,s8,802046de <exec+0x374>
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    8020453a:	de843b83          	ld	s7,-536(s0)
    8020453e:	000bba03          	ld	s4,0(s7) # fffffffffffff000 <kernel_end+0xffffffff7fdca000>
    80204542:	8552                	mv	a0,s4
    80204544:	ffffc097          	auipc	ra,0xffffc
    80204548:	3a8080e7          	jalr	936(ra) # 802008ec <strlen>
    8020454c:	0015069b          	addiw	a3,a0,1
    80204550:	8652                	mv	a2,s4
    80204552:	85ca                	mv	a1,s2
    80204554:	e0843503          	ld	a0,-504(s0)
    80204558:	ffffd097          	auipc	ra,0xffffd
    8020455c:	db4080e7          	jalr	-588(ra) # 8020130c <copyout>
    80204560:	18054363          	bltz	a0,802046e6 <exec+0x37c>
    ustack[argc] = sp;
    80204564:	0129b023          	sd	s2,0(s3)
  for(argc = 0; argv[argc]; argc++) {
    80204568:	0485                	addi	s1,s1,1
    8020456a:	008b8793          	addi	a5,s7,8
    8020456e:	def43423          	sd	a5,-536(s0)
    80204572:	008bb503          	ld	a0,8(s7)
    80204576:	c911                	beqz	a0,8020458a <exec+0x220>
    if(argc >= MAXARG)
    80204578:	09a1                	addi	s3,s3,8
    8020457a:	fb3c95e3          	bne	s9,s3,80204524 <exec+0x1ba>
  sz = sz1;
    8020457e:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    80204582:	4a01                	li	s4,0
    80204584:	a0d5                	j	80204668 <exec+0x2fe>
  sp = sz;
    80204586:	896a                	mv	s2,s10
  for(argc = 0; argv[argc]; argc++) {
    80204588:	4481                	li	s1,0
  ustack[argc] = 0;
    8020458a:	00349793          	slli	a5,s1,0x3
    8020458e:	f9040713          	addi	a4,s0,-112
    80204592:	97ba                	add	a5,a5,a4
    80204594:	ee07bc23          	sd	zero,-264(a5) # ffffffffffffeef8 <kernel_end+0xffffffff7fdc9ef8>
  sp -= (argc+1) * sizeof(uint64);
    80204598:	00148693          	addi	a3,s1,1
    8020459c:	068e                	slli	a3,a3,0x3
    8020459e:	40d90933          	sub	s2,s2,a3
  sp -= sp % 16;
    802045a2:	ff097913          	andi	s2,s2,-16
  if(sp < stackbase)
    802045a6:	01897663          	bgeu	s2,s8,802045b2 <exec+0x248>
  sz = sz1;
    802045aa:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    802045ae:	4a01                	li	s4,0
    802045b0:	a865                	j	80204668 <exec+0x2fe>
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    802045b2:	e8840613          	addi	a2,s0,-376
    802045b6:	85ca                	mv	a1,s2
    802045b8:	e0843503          	ld	a0,-504(s0)
    802045bc:	ffffd097          	auipc	ra,0xffffd
    802045c0:	d50080e7          	jalr	-688(ra) # 8020130c <copyout>
    802045c4:	12054563          	bltz	a0,802046ee <exec+0x384>
  p->trapframe->a1 = sp;
    802045c8:	060b3783          	ld	a5,96(s6)
    802045cc:	0727bc23          	sd	s2,120(a5)
  for(last=s=path; *s; s++)
    802045d0:	dd843783          	ld	a5,-552(s0)
    802045d4:	0007c703          	lbu	a4,0(a5)
    802045d8:	cf11                	beqz	a4,802045f4 <exec+0x28a>
    802045da:	0785                	addi	a5,a5,1
    if(*s == '/')
    802045dc:	02f00693          	li	a3,47
    802045e0:	a029                	j	802045ea <exec+0x280>
  for(last=s=path; *s; s++)
    802045e2:	0785                	addi	a5,a5,1
    802045e4:	fff7c703          	lbu	a4,-1(a5)
    802045e8:	c711                	beqz	a4,802045f4 <exec+0x28a>
    if(*s == '/')
    802045ea:	fed71ce3          	bne	a4,a3,802045e2 <exec+0x278>
      last = s+1;
    802045ee:	dcf43c23          	sd	a5,-552(s0)
    802045f2:	bfc5                	j	802045e2 <exec+0x278>
  safestrcpy(p->name, last, sizeof(p->name));
    802045f4:	4641                	li	a2,16
    802045f6:	dd843583          	ld	a1,-552(s0)
    802045fa:	4e0b0513          	addi	a0,s6,1248
    802045fe:	ffffc097          	auipc	ra,0xffffc
    80204602:	2bc080e7          	jalr	700(ra) # 802008ba <safestrcpy>
  oldpagetable = p->pagetable;
    80204606:	050b3503          	ld	a0,80(s6)
  oldkpagetable = p->kpagetable;
    8020460a:	058b3983          	ld	s3,88(s6)
  p->pagetable = pagetable;
    8020460e:	e0843783          	ld	a5,-504(s0)
    80204612:	04fb3823          	sd	a5,80(s6)
  p->kpagetable = kpagetable;
    80204616:	055b3c23          	sd	s5,88(s6)
  p->sz = sz;
    8020461a:	05ab3423          	sd	s10,72(s6)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    8020461e:	060b3783          	ld	a5,96(s6)
    80204622:	e6043703          	ld	a4,-416(s0)
    80204626:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    80204628:	060b3783          	ld	a5,96(s6)
    8020462c:	0327b823          	sd	s2,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80204630:	85ee                	mv	a1,s11
    80204632:	ffffd097          	auipc	ra,0xffffd
    80204636:	5c2080e7          	jalr	1474(ra) # 80201bf4 <proc_freepagetable>
  w_satp(MAKE_SATP(p->kpagetable));
    8020463a:	058b3783          	ld	a5,88(s6)
    8020463e:	83b1                	srli	a5,a5,0xc
    80204640:	577d                	li	a4,-1
    80204642:	177e                	slli	a4,a4,0x3f
    80204644:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    80204646:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    8020464a:	12000073          	sfence.vma
  kvmfree(oldkpagetable, 0);
    8020464e:	4581                	li	a1,0
    80204650:	854e                	mv	a0,s3
    80204652:	ffffd097          	auipc	ra,0xffffd
    80204656:	048080e7          	jalr	72(ra) # 8020169a <kvmfree>
  return argc; // this ends up in a0, the first argument to main(argc, argv)
    8020465a:	0004851b          	sext.w	a0,s1
    8020465e:	a089                	j	802046a0 <exec+0x336>
    return -1;
    80204660:	557d                	li	a0,-1
    80204662:	a83d                	j	802046a0 <exec+0x336>
    80204664:	de943823          	sd	s1,-528(s0)
    proc_freepagetable(pagetable, sz);
    80204668:	df043583          	ld	a1,-528(s0)
    8020466c:	e0843503          	ld	a0,-504(s0)
    80204670:	ffffd097          	auipc	ra,0xffffd
    80204674:	584080e7          	jalr	1412(ra) # 80201bf4 <proc_freepagetable>
    kvmfree(kpagetable, 0);
    80204678:	4581                	li	a1,0
    8020467a:	8556                	mv	a0,s5
    8020467c:	ffffd097          	auipc	ra,0xffffd
    80204680:	01e080e7          	jalr	30(ra) # 8020169a <kvmfree>
    eunlock(ep);
    eput(ep);
  }
  return -1;
    80204684:	557d                	li	a0,-1
  if(ep){
    80204686:	000a0d63          	beqz	s4,802046a0 <exec+0x336>
    eunlock(ep);
    8020468a:	8552                	mv	a0,s4
    8020468c:	00002097          	auipc	ra,0x2
    80204690:	79c080e7          	jalr	1948(ra) # 80206e28 <eunlock>
    eput(ep);
    80204694:	8552                	mv	a0,s4
    80204696:	00002097          	auipc	ra,0x2
    8020469a:	7e0080e7          	jalr	2016(ra) # 80206e76 <eput>
  return -1;
    8020469e:	557d                	li	a0,-1
}
    802046a0:	22813083          	ld	ra,552(sp)
    802046a4:	22013403          	ld	s0,544(sp)
    802046a8:	21813483          	ld	s1,536(sp)
    802046ac:	21013903          	ld	s2,528(sp)
    802046b0:	20813983          	ld	s3,520(sp)
    802046b4:	20013a03          	ld	s4,512(sp)
    802046b8:	7afe                	ld	s5,504(sp)
    802046ba:	7b5e                	ld	s6,496(sp)
    802046bc:	7bbe                	ld	s7,488(sp)
    802046be:	7c1e                	ld	s8,480(sp)
    802046c0:	6cfe                	ld	s9,472(sp)
    802046c2:	6d5e                	ld	s10,464(sp)
    802046c4:	6dbe                	ld	s11,456(sp)
    802046c6:	23010113          	addi	sp,sp,560
    802046ca:	8082                	ret
    802046cc:	de943823          	sd	s1,-528(s0)
    802046d0:	bf61                	j	80204668 <exec+0x2fe>
    802046d2:	de943823          	sd	s1,-528(s0)
    802046d6:	bf49                	j	80204668 <exec+0x2fe>
    802046d8:	de943823          	sd	s1,-528(s0)
    802046dc:	b771                	j	80204668 <exec+0x2fe>
  sz = sz1;
    802046de:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    802046e2:	4a01                	li	s4,0
    802046e4:	b751                	j	80204668 <exec+0x2fe>
  sz = sz1;
    802046e6:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    802046ea:	4a01                	li	s4,0
    802046ec:	bfb5                	j	80204668 <exec+0x2fe>
  sz = sz1;
    802046ee:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    802046f2:	4a01                	li	s4,0
    802046f4:	bf95                	j	80204668 <exec+0x2fe>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    802046f6:	df043483          	ld	s1,-528(s0)
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    802046fa:	e0043783          	ld	a5,-512(s0)
    802046fe:	0017869b          	addiw	a3,a5,1
    80204702:	e0d43023          	sd	a3,-512(s0)
    80204706:	df843783          	ld	a5,-520(s0)
    8020470a:	0387879b          	addiw	a5,a5,56
    8020470e:	e8045703          	lhu	a4,-384(s0)
    80204712:	d8e6dfe3          	bge	a3,a4,802044b0 <exec+0x146>
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80204716:	2781                	sext.w	a5,a5
    80204718:	def43c23          	sd	a5,-520(s0)
    8020471c:	03800713          	li	a4,56
    80204720:	86be                	mv	a3,a5
    80204722:	de043603          	ld	a2,-544(s0)
    80204726:	4581                	li	a1,0
    80204728:	8552                	mv	a0,s4
    8020472a:	00002097          	auipc	ra,0x2
    8020472e:	dde080e7          	jalr	-546(ra) # 80206508 <eread>
    80204732:	03800793          	li	a5,56
    80204736:	f2f517e3          	bne	a0,a5,80204664 <exec+0x2fa>
    if(ph.type != ELF_PROG_LOAD)
    8020473a:	e1042783          	lw	a5,-496(s0)
    8020473e:	4705                	li	a4,1
    80204740:	fae79de3          	bne	a5,a4,802046fa <exec+0x390>
    if(ph.memsz < ph.filesz)
    80204744:	e3843683          	ld	a3,-456(s0)
    80204748:	e3043783          	ld	a5,-464(s0)
    8020474c:	f8f6e0e3          	bltu	a3,a5,802046cc <exec+0x362>
    if(ph.vaddr + ph.memsz < ph.vaddr)
    80204750:	e2043783          	ld	a5,-480(s0)
    80204754:	96be                	add	a3,a3,a5
    80204756:	f6f6eee3          	bltu	a3,a5,802046d2 <exec+0x368>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    8020475a:	8626                	mv	a2,s1
    8020475c:	85d6                	mv	a1,s5
    8020475e:	e0843503          	ld	a0,-504(s0)
    80204762:	ffffd097          	auipc	ra,0xffffd
    80204766:	8d2080e7          	jalr	-1838(ra) # 80201034 <uvmalloc>
    8020476a:	dea43823          	sd	a0,-528(s0)
    8020476e:	d52d                	beqz	a0,802046d8 <exec+0x36e>
    if(ph.vaddr % PGSIZE != 0)
    80204770:	e2043c83          	ld	s9,-480(s0)
    80204774:	dd043783          	ld	a5,-560(s0)
    80204778:	00fcf7b3          	and	a5,s9,a5
    8020477c:	ee0796e3          	bnez	a5,80204668 <exec+0x2fe>
    if(loadseg(pagetable, ph.vaddr, ep, ph.off, ph.filesz) < 0)
    80204780:	e1842d03          	lw	s10,-488(s0)
    80204784:	e3042c03          	lw	s8,-464(s0)
  for(i = 0; i < sz; i += PGSIZE){
    80204788:	f60c07e3          	beqz	s8,802046f6 <exec+0x38c>
    8020478c:	8962                	mv	s2,s8
    8020478e:	4481                	li	s1,0
    80204790:	b9f5                	j	8020448c <exec+0x122>
    kvmfree(kpagetable, 0);
    80204792:	4581                	li	a1,0
    80204794:	8556                	mv	a0,s5
    80204796:	ffffd097          	auipc	ra,0xffffd
    8020479a:	f04080e7          	jalr	-252(ra) # 8020169a <kvmfree>
  return -1;
    8020479e:	557d                	li	a0,-1
    802047a0:	b701                	j	802046a0 <exec+0x336>

00000000802047a2 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    802047a2:	7179                	addi	sp,sp,-48
    802047a4:	f406                	sd	ra,40(sp)
    802047a6:	f022                	sd	s0,32(sp)
    802047a8:	ec26                	sd	s1,24(sp)
    802047aa:	e84a                	sd	s2,16(sp)
    802047ac:	1800                	addi	s0,sp,48
    802047ae:	892e                	mv	s2,a1
    802047b0:	84b2                	mv	s1,a2
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    802047b2:	fdc40593          	addi	a1,s0,-36
    802047b6:	ffffe097          	auipc	ra,0xffffe
    802047ba:	76c080e7          	jalr	1900(ra) # 80202f22 <argint>
    802047be:	04054163          	bltz	a0,80204800 <argfd+0x5e>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == NULL)
    802047c2:	fdc42703          	lw	a4,-36(s0)
    802047c6:	07f00793          	li	a5,127
    802047ca:	02e7ed63          	bltu	a5,a4,80204804 <argfd+0x62>
    802047ce:	ffffd097          	auipc	ra,0xffffd
    802047d2:	2a6080e7          	jalr	678(ra) # 80201a74 <myproc>
    802047d6:	fdc42703          	lw	a4,-36(s0)
    802047da:	01a70793          	addi	a5,a4,26
    802047de:	078e                	slli	a5,a5,0x3
    802047e0:	953e                	add	a0,a0,a5
    802047e2:	651c                	ld	a5,8(a0)
    802047e4:	c395                	beqz	a5,80204808 <argfd+0x66>
    return -1;
  if(pfd)
    802047e6:	00090463          	beqz	s2,802047ee <argfd+0x4c>
    *pfd = fd;
    802047ea:	00e92023          	sw	a4,0(s2)
  if(pf)
    *pf = f;
  return 0;
    802047ee:	4501                	li	a0,0
  if(pf)
    802047f0:	c091                	beqz	s1,802047f4 <argfd+0x52>
    *pf = f;
    802047f2:	e09c                	sd	a5,0(s1)
}
    802047f4:	70a2                	ld	ra,40(sp)
    802047f6:	7402                	ld	s0,32(sp)
    802047f8:	64e2                	ld	s1,24(sp)
    802047fa:	6942                	ld	s2,16(sp)
    802047fc:	6145                	addi	sp,sp,48
    802047fe:	8082                	ret
    return -1;
    80204800:	557d                	li	a0,-1
    80204802:	bfcd                	j	802047f4 <argfd+0x52>
    return -1;
    80204804:	557d                	li	a0,-1
    80204806:	b7fd                	j	802047f4 <argfd+0x52>
    80204808:	557d                	li	a0,-1
    8020480a:	b7ed                	j	802047f4 <argfd+0x52>

000000008020480c <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    8020480c:	1101                	addi	sp,sp,-32
    8020480e:	ec06                	sd	ra,24(sp)
    80204810:	e822                	sd	s0,16(sp)
    80204812:	e426                	sd	s1,8(sp)
    80204814:	1000                	addi	s0,sp,32
    80204816:	84aa                	mv	s1,a0
  int fd;
  struct proc *p = myproc();
    80204818:	ffffd097          	auipc	ra,0xffffd
    8020481c:	25c080e7          	jalr	604(ra) # 80201a74 <myproc>
    80204820:	862a                	mv	a2,a0

  for(fd = 0; fd < NOFILE; fd++){
    80204822:	0d850793          	addi	a5,a0,216
    80204826:	4501                	li	a0,0
    80204828:	08000693          	li	a3,128
    if(p->ofile[fd] == 0){
    8020482c:	6398                	ld	a4,0(a5)
    8020482e:	c719                	beqz	a4,8020483c <fdalloc+0x30>
  for(fd = 0; fd < NOFILE; fd++){
    80204830:	2505                	addiw	a0,a0,1
    80204832:	07a1                	addi	a5,a5,8
    80204834:	fed51ce3          	bne	a0,a3,8020482c <fdalloc+0x20>
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
    80204838:	557d                	li	a0,-1
    8020483a:	a031                	j	80204846 <fdalloc+0x3a>
      p->ofile[fd] = f;
    8020483c:	01a50793          	addi	a5,a0,26
    80204840:	078e                	slli	a5,a5,0x3
    80204842:	963e                	add	a2,a2,a5
    80204844:	e604                	sd	s1,8(a2)
}
    80204846:	60e2                	ld	ra,24(sp)
    80204848:	6442                	ld	s0,16(sp)
    8020484a:	64a2                	ld	s1,8(sp)
    8020484c:	6105                	addi	sp,sp,32
    8020484e:	8082                	ret

0000000080204850 <create>:
  return filestat(f, st);
}

static struct dirent*
create(char *path, short type, int mode)
{
    80204850:	7169                	addi	sp,sp,-304
    80204852:	f606                	sd	ra,296(sp)
    80204854:	f222                	sd	s0,288(sp)
    80204856:	ee26                	sd	s1,280(sp)
    80204858:	ea4a                	sd	s2,272(sp)
    8020485a:	e64e                	sd	s3,264(sp)
    8020485c:	1a00                	addi	s0,sp,304
    8020485e:	89ae                	mv	s3,a1
  struct dirent *ep, *dp;
  char name[FAT32_MAX_FILENAME + 1];

  if((dp = enameparent(path, name)) == NULL)
    80204860:	ed040593          	addi	a1,s0,-304
    80204864:	00003097          	auipc	ra,0x3
    80204868:	d56080e7          	jalr	-682(ra) # 802075ba <enameparent>
    8020486c:	84aa                	mv	s1,a0
    8020486e:	cd3d                	beqz	a0,802048ec <create+0x9c>
    return NULL;

  if (type == T_DIR) {
    80204870:	0009879b          	sext.w	a5,s3
    80204874:	4705                	li	a4,1
    80204876:	06e78d63          	beq	a5,a4,802048f0 <create+0xa0>
    mode = ATTR_READ_ONLY;
  } else {
    mode = 0;  
  }

  elock(dp);
    8020487a:	00002097          	auipc	ra,0x2
    8020487e:	578080e7          	jalr	1400(ra) # 80206df2 <elock>
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    80204882:	4601                	li	a2,0
    80204884:	ed040593          	addi	a1,s0,-304
    80204888:	8526                	mv	a0,s1
    8020488a:	00003097          	auipc	ra,0x3
    8020488e:	a5a080e7          	jalr	-1446(ra) # 802072e4 <ealloc>
    80204892:	892a                	mv	s2,a0
    80204894:	c121                	beqz	a0,802048d4 <create+0x84>
    eunlock(dp);
    eput(dp);
    return NULL;
  }
  
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204896:	2981                	sext.w	s3,s3
    80204898:	4789                	li	a5,2
    8020489a:	00f99663          	bne	s3,a5,802048a6 <create+0x56>
      (type == T_FILE && (ep->attribute & ATTR_DIRECTORY))) {
    8020489e:	10094783          	lbu	a5,256(s2)
    802048a2:	8bc1                	andi	a5,a5,16
    802048a4:	eba5                	bnez	a5,80204914 <create+0xc4>
    eput(ep);
    eput(dp);
    return NULL;
  }

  eunlock(dp);
    802048a6:	8526                	mv	a0,s1
    802048a8:	00002097          	auipc	ra,0x2
    802048ac:	580080e7          	jalr	1408(ra) # 80206e28 <eunlock>
  eput(dp);
    802048b0:	8526                	mv	a0,s1
    802048b2:	00002097          	auipc	ra,0x2
    802048b6:	5c4080e7          	jalr	1476(ra) # 80206e76 <eput>

  elock(ep);
    802048ba:	854a                	mv	a0,s2
    802048bc:	00002097          	auipc	ra,0x2
    802048c0:	536080e7          	jalr	1334(ra) # 80206df2 <elock>
  return ep;
}
    802048c4:	854a                	mv	a0,s2
    802048c6:	70b2                	ld	ra,296(sp)
    802048c8:	7412                	ld	s0,288(sp)
    802048ca:	64f2                	ld	s1,280(sp)
    802048cc:	6952                	ld	s2,272(sp)
    802048ce:	69b2                	ld	s3,264(sp)
    802048d0:	6155                	addi	sp,sp,304
    802048d2:	8082                	ret
    eunlock(dp);
    802048d4:	8526                	mv	a0,s1
    802048d6:	00002097          	auipc	ra,0x2
    802048da:	552080e7          	jalr	1362(ra) # 80206e28 <eunlock>
    eput(dp);
    802048de:	8526                	mv	a0,s1
    802048e0:	00002097          	auipc	ra,0x2
    802048e4:	596080e7          	jalr	1430(ra) # 80206e76 <eput>
    return NULL;
    802048e8:	4901                	li	s2,0
    802048ea:	bfe9                	j	802048c4 <create+0x74>
    return NULL;
    802048ec:	892a                	mv	s2,a0
    802048ee:	bfd9                	j	802048c4 <create+0x74>
  elock(dp);
    802048f0:	00002097          	auipc	ra,0x2
    802048f4:	502080e7          	jalr	1282(ra) # 80206df2 <elock>
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    802048f8:	4641                	li	a2,16
    802048fa:	ed040593          	addi	a1,s0,-304
    802048fe:	8526                	mv	a0,s1
    80204900:	00003097          	auipc	ra,0x3
    80204904:	9e4080e7          	jalr	-1564(ra) # 802072e4 <ealloc>
    80204908:	892a                	mv	s2,a0
    8020490a:	d569                	beqz	a0,802048d4 <create+0x84>
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    8020490c:	10094783          	lbu	a5,256(s2)
    80204910:	8bc1                	andi	a5,a5,16
    80204912:	fbd1                	bnez	a5,802048a6 <create+0x56>
    eunlock(dp);
    80204914:	8526                	mv	a0,s1
    80204916:	00002097          	auipc	ra,0x2
    8020491a:	512080e7          	jalr	1298(ra) # 80206e28 <eunlock>
    eput(ep);
    8020491e:	854a                	mv	a0,s2
    80204920:	00002097          	auipc	ra,0x2
    80204924:	556080e7          	jalr	1366(ra) # 80206e76 <eput>
    eput(dp);
    80204928:	8526                	mv	a0,s1
    8020492a:	00002097          	auipc	ra,0x2
    8020492e:	54c080e7          	jalr	1356(ra) # 80206e76 <eput>
    return NULL;
    80204932:	4901                	li	s2,0
    80204934:	bf41                	j	802048c4 <create+0x74>

0000000080204936 <sys_dup>:
{
    80204936:	7179                	addi	sp,sp,-48
    80204938:	f406                	sd	ra,40(sp)
    8020493a:	f022                	sd	s0,32(sp)
    8020493c:	ec26                	sd	s1,24(sp)
    8020493e:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0)
    80204940:	fd840613          	addi	a2,s0,-40
    80204944:	4581                	li	a1,0
    80204946:	4501                	li	a0,0
    80204948:	00000097          	auipc	ra,0x0
    8020494c:	e5a080e7          	jalr	-422(ra) # 802047a2 <argfd>
    return -1;
    80204950:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0)
    80204952:	02054363          	bltz	a0,80204978 <sys_dup+0x42>
  if((fd=fdalloc(f)) < 0)
    80204956:	fd843503          	ld	a0,-40(s0)
    8020495a:	00000097          	auipc	ra,0x0
    8020495e:	eb2080e7          	jalr	-334(ra) # 8020480c <fdalloc>
    80204962:	84aa                	mv	s1,a0
    return -1;
    80204964:	57fd                	li	a5,-1
  if((fd=fdalloc(f)) < 0)
    80204966:	00054963          	bltz	a0,80204978 <sys_dup+0x42>
  filedup(f);
    8020496a:	fd843503          	ld	a0,-40(s0)
    8020496e:	fffff097          	auipc	ra,0xfffff
    80204972:	2da080e7          	jalr	730(ra) # 80203c48 <filedup>
  return fd;
    80204976:	87a6                	mv	a5,s1
}
    80204978:	853e                	mv	a0,a5
    8020497a:	70a2                	ld	ra,40(sp)
    8020497c:	7402                	ld	s0,32(sp)
    8020497e:	64e2                	ld	s1,24(sp)
    80204980:	6145                	addi	sp,sp,48
    80204982:	8082                	ret

0000000080204984 <sys_read>:
{
    80204984:	7179                	addi	sp,sp,-48
    80204986:	f406                	sd	ra,40(sp)
    80204988:	f022                	sd	s0,32(sp)
    8020498a:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020498c:	fe840613          	addi	a2,s0,-24
    80204990:	4581                	li	a1,0
    80204992:	4501                	li	a0,0
    80204994:	00000097          	auipc	ra,0x0
    80204998:	e0e080e7          	jalr	-498(ra) # 802047a2 <argfd>
    return -1;
    8020499c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020499e:	04054163          	bltz	a0,802049e0 <sys_read+0x5c>
    802049a2:	fe440593          	addi	a1,s0,-28
    802049a6:	4509                	li	a0,2
    802049a8:	ffffe097          	auipc	ra,0xffffe
    802049ac:	57a080e7          	jalr	1402(ra) # 80202f22 <argint>
    return -1;
    802049b0:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802049b2:	02054763          	bltz	a0,802049e0 <sys_read+0x5c>
    802049b6:	fd840593          	addi	a1,s0,-40
    802049ba:	4505                	li	a0,1
    802049bc:	ffffe097          	auipc	ra,0xffffe
    802049c0:	5c8080e7          	jalr	1480(ra) # 80202f84 <argaddr>
    return -1;
    802049c4:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802049c6:	00054d63          	bltz	a0,802049e0 <sys_read+0x5c>
  return fileread(f, p, n);
    802049ca:	fe442603          	lw	a2,-28(s0)
    802049ce:	fd843583          	ld	a1,-40(s0)
    802049d2:	fe843503          	ld	a0,-24(s0)
    802049d6:	fffff097          	auipc	ra,0xfffff
    802049da:	3de080e7          	jalr	990(ra) # 80203db4 <fileread>
    802049de:	87aa                	mv	a5,a0
}
    802049e0:	853e                	mv	a0,a5
    802049e2:	70a2                	ld	ra,40(sp)
    802049e4:	7402                	ld	s0,32(sp)
    802049e6:	6145                	addi	sp,sp,48
    802049e8:	8082                	ret

00000000802049ea <sys_write>:
{
    802049ea:	7179                	addi	sp,sp,-48
    802049ec:	f406                	sd	ra,40(sp)
    802049ee:	f022                	sd	s0,32(sp)
    802049f0:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802049f2:	fe840613          	addi	a2,s0,-24
    802049f6:	4581                	li	a1,0
    802049f8:	4501                	li	a0,0
    802049fa:	00000097          	auipc	ra,0x0
    802049fe:	da8080e7          	jalr	-600(ra) # 802047a2 <argfd>
    return -1;
    80204a02:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204a04:	04054163          	bltz	a0,80204a46 <sys_write+0x5c>
    80204a08:	fe440593          	addi	a1,s0,-28
    80204a0c:	4509                	li	a0,2
    80204a0e:	ffffe097          	auipc	ra,0xffffe
    80204a12:	514080e7          	jalr	1300(ra) # 80202f22 <argint>
    return -1;
    80204a16:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204a18:	02054763          	bltz	a0,80204a46 <sys_write+0x5c>
    80204a1c:	fd840593          	addi	a1,s0,-40
    80204a20:	4505                	li	a0,1
    80204a22:	ffffe097          	auipc	ra,0xffffe
    80204a26:	562080e7          	jalr	1378(ra) # 80202f84 <argaddr>
    return -1;
    80204a2a:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204a2c:	00054d63          	bltz	a0,80204a46 <sys_write+0x5c>
  return filewrite(f, p, n);
    80204a30:	fe442603          	lw	a2,-28(s0)
    80204a34:	fd843583          	ld	a1,-40(s0)
    80204a38:	fe843503          	ld	a0,-24(s0)
    80204a3c:	fffff097          	auipc	ra,0xfffff
    80204a40:	43a080e7          	jalr	1082(ra) # 80203e76 <filewrite>
    80204a44:	87aa                	mv	a5,a0
}
    80204a46:	853e                	mv	a0,a5
    80204a48:	70a2                	ld	ra,40(sp)
    80204a4a:	7402                	ld	s0,32(sp)
    80204a4c:	6145                	addi	sp,sp,48
    80204a4e:	8082                	ret

0000000080204a50 <sys_close>:
{
    80204a50:	1101                	addi	sp,sp,-32
    80204a52:	ec06                	sd	ra,24(sp)
    80204a54:	e822                	sd	s0,16(sp)
    80204a56:	1000                	addi	s0,sp,32
  if(argfd(0, &fd, &f) < 0)
    80204a58:	fe040613          	addi	a2,s0,-32
    80204a5c:	fec40593          	addi	a1,s0,-20
    80204a60:	4501                	li	a0,0
    80204a62:	00000097          	auipc	ra,0x0
    80204a66:	d40080e7          	jalr	-704(ra) # 802047a2 <argfd>
    return -1;
    80204a6a:	57fd                	li	a5,-1
  if(argfd(0, &fd, &f) < 0)
    80204a6c:	02054463          	bltz	a0,80204a94 <sys_close+0x44>
  myproc()->ofile[fd] = 0;
    80204a70:	ffffd097          	auipc	ra,0xffffd
    80204a74:	004080e7          	jalr	4(ra) # 80201a74 <myproc>
    80204a78:	fec42783          	lw	a5,-20(s0)
    80204a7c:	07e9                	addi	a5,a5,26
    80204a7e:	078e                	slli	a5,a5,0x3
    80204a80:	97aa                	add	a5,a5,a0
    80204a82:	0007b423          	sd	zero,8(a5)
  fileclose(f);
    80204a86:	fe043503          	ld	a0,-32(s0)
    80204a8a:	fffff097          	auipc	ra,0xfffff
    80204a8e:	210080e7          	jalr	528(ra) # 80203c9a <fileclose>
  return 0;
    80204a92:	4781                	li	a5,0
}
    80204a94:	853e                	mv	a0,a5
    80204a96:	60e2                	ld	ra,24(sp)
    80204a98:	6442                	ld	s0,16(sp)
    80204a9a:	6105                	addi	sp,sp,32
    80204a9c:	8082                	ret

0000000080204a9e <sys_fstat>:
{
    80204a9e:	1101                	addi	sp,sp,-32
    80204aa0:	ec06                	sd	ra,24(sp)
    80204aa2:	e822                	sd	s0,16(sp)
    80204aa4:	1000                	addi	s0,sp,32
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204aa6:	fe840613          	addi	a2,s0,-24
    80204aaa:	4581                	li	a1,0
    80204aac:	4501                	li	a0,0
    80204aae:	00000097          	auipc	ra,0x0
    80204ab2:	cf4080e7          	jalr	-780(ra) # 802047a2 <argfd>
    return -1;
    80204ab6:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204ab8:	02054563          	bltz	a0,80204ae2 <sys_fstat+0x44>
    80204abc:	fe040593          	addi	a1,s0,-32
    80204ac0:	4505                	li	a0,1
    80204ac2:	ffffe097          	auipc	ra,0xffffe
    80204ac6:	4c2080e7          	jalr	1218(ra) # 80202f84 <argaddr>
    return -1;
    80204aca:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204acc:	00054b63          	bltz	a0,80204ae2 <sys_fstat+0x44>
  return filestat(f, st);
    80204ad0:	fe043583          	ld	a1,-32(s0)
    80204ad4:	fe843503          	ld	a0,-24(s0)
    80204ad8:	fffff097          	auipc	ra,0xfffff
    80204adc:	278080e7          	jalr	632(ra) # 80203d50 <filestat>
    80204ae0:	87aa                	mv	a5,a0
}
    80204ae2:	853e                	mv	a0,a5
    80204ae4:	60e2                	ld	ra,24(sp)
    80204ae6:	6442                	ld	s0,16(sp)
    80204ae8:	6105                	addi	sp,sp,32
    80204aea:	8082                	ret

0000000080204aec <sys_open>:

uint64
sys_open(void)
{
    80204aec:	7129                	addi	sp,sp,-320
    80204aee:	fe06                	sd	ra,312(sp)
    80204af0:	fa22                	sd	s0,304(sp)
    80204af2:	f626                	sd	s1,296(sp)
    80204af4:	f24a                	sd	s2,288(sp)
    80204af6:	ee4e                	sd	s3,280(sp)
    80204af8:	0280                	addi	s0,sp,320
  char path[FAT32_MAX_PATH];
  int fd, omode;
  struct file *f;
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204afa:	10400613          	li	a2,260
    80204afe:	ec840593          	addi	a1,s0,-312
    80204b02:	4501                	li	a0,0
    80204b04:	ffffe097          	auipc	ra,0xffffe
    80204b08:	4a2080e7          	jalr	1186(ra) # 80202fa6 <argstr>
    80204b0c:	87aa                	mv	a5,a0
    return -1;
    80204b0e:	557d                	li	a0,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204b10:	0807ce63          	bltz	a5,80204bac <sys_open+0xc0>
    80204b14:	ec440593          	addi	a1,s0,-316
    80204b18:	4505                	li	a0,1
    80204b1a:	ffffe097          	auipc	ra,0xffffe
    80204b1e:	408080e7          	jalr	1032(ra) # 80202f22 <argint>
    80204b22:	0e054163          	bltz	a0,80204c04 <sys_open+0x118>

  if(omode & O_CREATE){
    80204b26:	ec442603          	lw	a2,-316(s0)
    80204b2a:	24067793          	andi	a5,a2,576
    80204b2e:	c7d1                	beqz	a5,80204bba <sys_open+0xce>
    ep = create(path, T_FILE, omode);
    80204b30:	4589                	li	a1,2
    80204b32:	ec840513          	addi	a0,s0,-312
    80204b36:	00000097          	auipc	ra,0x0
    80204b3a:	d1a080e7          	jalr	-742(ra) # 80204850 <create>
    80204b3e:	892a                	mv	s2,a0
    if(ep == NULL){
    80204b40:	c561                	beqz	a0,80204c08 <sys_open+0x11c>
      eput(ep);
      return -1;
    }
  }

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204b42:	fffff097          	auipc	ra,0xfffff
    80204b46:	09c080e7          	jalr	156(ra) # 80203bde <filealloc>
    80204b4a:	89aa                	mv	s3,a0
    80204b4c:	c579                	beqz	a0,80204c1a <sys_open+0x12e>
    80204b4e:	00000097          	auipc	ra,0x0
    80204b52:	cbe080e7          	jalr	-834(ra) # 8020480c <fdalloc>
    80204b56:	84aa                	mv	s1,a0
    80204b58:	0a054c63          	bltz	a0,80204c10 <sys_open+0x124>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    80204b5c:	10094783          	lbu	a5,256(s2)
    80204b60:	8bc1                	andi	a5,a5,16
    80204b62:	e791                	bnez	a5,80204b6e <sys_open+0x82>
    80204b64:	ec442783          	lw	a5,-316(s0)
    80204b68:	4007f793          	andi	a5,a5,1024
    80204b6c:	e7d1                	bnez	a5,80204bf8 <sys_open+0x10c>
    etrunc(ep);
  }

  f->type = FD_ENTRY;
    80204b6e:	4789                	li	a5,2
    80204b70:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    80204b74:	ec442783          	lw	a5,-316(s0)
    80204b78:	0047f693          	andi	a3,a5,4
    80204b7c:	4701                	li	a4,0
    80204b7e:	c299                	beqz	a3,80204b84 <sys_open+0x98>
    80204b80:	10892703          	lw	a4,264(s2)
    80204b84:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    80204b88:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    80204b8c:	0017c713          	xori	a4,a5,1
    80204b90:	8b05                	andi	a4,a4,1
    80204b92:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204b96:	8b8d                	andi	a5,a5,3
    80204b98:	00f037b3          	snez	a5,a5
    80204b9c:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    80204ba0:	854a                	mv	a0,s2
    80204ba2:	00002097          	auipc	ra,0x2
    80204ba6:	286080e7          	jalr	646(ra) # 80206e28 <eunlock>

  return fd;
    80204baa:	8526                	mv	a0,s1
}
    80204bac:	70f2                	ld	ra,312(sp)
    80204bae:	7452                	ld	s0,304(sp)
    80204bb0:	74b2                	ld	s1,296(sp)
    80204bb2:	7912                	ld	s2,288(sp)
    80204bb4:	69f2                	ld	s3,280(sp)
    80204bb6:	6131                	addi	sp,sp,320
    80204bb8:	8082                	ret
    if((ep = ename(path)) == NULL){
    80204bba:	ec840513          	addi	a0,s0,-312
    80204bbe:	00003097          	auipc	ra,0x3
    80204bc2:	9de080e7          	jalr	-1570(ra) # 8020759c <ename>
    80204bc6:	892a                	mv	s2,a0
    80204bc8:	c131                	beqz	a0,80204c0c <sys_open+0x120>
    elock(ep);
    80204bca:	00002097          	auipc	ra,0x2
    80204bce:	228080e7          	jalr	552(ra) # 80206df2 <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    80204bd2:	10094783          	lbu	a5,256(s2)
    80204bd6:	8bc1                	andi	a5,a5,16
    80204bd8:	d7ad                	beqz	a5,80204b42 <sys_open+0x56>
    80204bda:	ec442783          	lw	a5,-316(s0)
    80204bde:	d3b5                	beqz	a5,80204b42 <sys_open+0x56>
      eunlock(ep);
    80204be0:	854a                	mv	a0,s2
    80204be2:	00002097          	auipc	ra,0x2
    80204be6:	246080e7          	jalr	582(ra) # 80206e28 <eunlock>
      eput(ep);
    80204bea:	854a                	mv	a0,s2
    80204bec:	00002097          	auipc	ra,0x2
    80204bf0:	28a080e7          	jalr	650(ra) # 80206e76 <eput>
      return -1;
    80204bf4:	557d                	li	a0,-1
    80204bf6:	bf5d                	j	80204bac <sys_open+0xc0>
    etrunc(ep);
    80204bf8:	854a                	mv	a0,s2
    80204bfa:	00002097          	auipc	ra,0x2
    80204bfe:	18e080e7          	jalr	398(ra) # 80206d88 <etrunc>
    80204c02:	b7b5                	j	80204b6e <sys_open+0x82>
    return -1;
    80204c04:	557d                	li	a0,-1
    80204c06:	b75d                	j	80204bac <sys_open+0xc0>
      return -1;
    80204c08:	557d                	li	a0,-1
    80204c0a:	b74d                	j	80204bac <sys_open+0xc0>
      return -1;
    80204c0c:	557d                	li	a0,-1
    80204c0e:	bf79                	j	80204bac <sys_open+0xc0>
      fileclose(f);
    80204c10:	854e                	mv	a0,s3
    80204c12:	fffff097          	auipc	ra,0xfffff
    80204c16:	088080e7          	jalr	136(ra) # 80203c9a <fileclose>
    eunlock(ep);
    80204c1a:	854a                	mv	a0,s2
    80204c1c:	00002097          	auipc	ra,0x2
    80204c20:	20c080e7          	jalr	524(ra) # 80206e28 <eunlock>
    eput(ep);
    80204c24:	854a                	mv	a0,s2
    80204c26:	00002097          	auipc	ra,0x2
    80204c2a:	250080e7          	jalr	592(ra) # 80206e76 <eput>
    return -1;
    80204c2e:	557d                	li	a0,-1
    80204c30:	bfb5                	j	80204bac <sys_open+0xc0>

0000000080204c32 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80204c32:	7169                	addi	sp,sp,-304
    80204c34:	f606                	sd	ra,296(sp)
    80204c36:	f222                	sd	s0,288(sp)
    80204c38:	ee26                	sd	s1,280(sp)
    80204c3a:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;

  if(argstr(1, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204c3c:	10400613          	li	a2,260
    80204c40:	ed840593          	addi	a1,s0,-296
    80204c44:	4505                	li	a0,1
    80204c46:	ffffe097          	auipc	ra,0xffffe
    80204c4a:	360080e7          	jalr	864(ra) # 80202fa6 <argstr>
    return -1;
    80204c4e:	57fd                	li	a5,-1
  if(argstr(1, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204c50:	02054663          	bltz	a0,80204c7c <sys_mkdir+0x4a>
    80204c54:	4601                	li	a2,0
    80204c56:	4585                	li	a1,1
    80204c58:	ed840513          	addi	a0,s0,-296
    80204c5c:	00000097          	auipc	ra,0x0
    80204c60:	bf4080e7          	jalr	-1036(ra) # 80204850 <create>
    80204c64:	84aa                	mv	s1,a0
    80204c66:	c10d                	beqz	a0,80204c88 <sys_mkdir+0x56>
  }
  eunlock(ep);
    80204c68:	00002097          	auipc	ra,0x2
    80204c6c:	1c0080e7          	jalr	448(ra) # 80206e28 <eunlock>
  eput(ep);
    80204c70:	8526                	mv	a0,s1
    80204c72:	00002097          	auipc	ra,0x2
    80204c76:	204080e7          	jalr	516(ra) # 80206e76 <eput>
  return 0;
    80204c7a:	4781                	li	a5,0
}
    80204c7c:	853e                	mv	a0,a5
    80204c7e:	70b2                	ld	ra,296(sp)
    80204c80:	7412                	ld	s0,288(sp)
    80204c82:	64f2                	ld	s1,280(sp)
    80204c84:	6155                	addi	sp,sp,304
    80204c86:	8082                	ret
    return -1;
    80204c88:	57fd                	li	a5,-1
    80204c8a:	bfcd                	j	80204c7c <sys_mkdir+0x4a>

0000000080204c8c <sys_chdir>:

uint64
sys_chdir(void)
{
    80204c8c:	7169                	addi	sp,sp,-304
    80204c8e:	f606                	sd	ra,296(sp)
    80204c90:	f222                	sd	s0,288(sp)
    80204c92:	ee26                	sd	s1,280(sp)
    80204c94:	ea4a                	sd	s2,272(sp)
    80204c96:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  struct proc *p = myproc();
    80204c98:	ffffd097          	auipc	ra,0xffffd
    80204c9c:	ddc080e7          	jalr	-548(ra) # 80201a74 <myproc>
    80204ca0:	892a                	mv	s2,a0
  
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204ca2:	10400613          	li	a2,260
    80204ca6:	ed840593          	addi	a1,s0,-296
    80204caa:	4501                	li	a0,0
    80204cac:	ffffe097          	auipc	ra,0xffffe
    80204cb0:	2fa080e7          	jalr	762(ra) # 80202fa6 <argstr>
    return -1;
    80204cb4:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204cb6:	04054063          	bltz	a0,80204cf6 <sys_chdir+0x6a>
    80204cba:	ed840513          	addi	a0,s0,-296
    80204cbe:	00003097          	auipc	ra,0x3
    80204cc2:	8de080e7          	jalr	-1826(ra) # 8020759c <ename>
    80204cc6:	84aa                	mv	s1,a0
    80204cc8:	c931                	beqz	a0,80204d1c <sys_chdir+0x90>
  }
  elock(ep);
    80204cca:	00002097          	auipc	ra,0x2
    80204cce:	128080e7          	jalr	296(ra) # 80206df2 <elock>
  if(!(ep->attribute & ATTR_DIRECTORY)){
    80204cd2:	1004c783          	lbu	a5,256(s1)
    80204cd6:	8bc1                	andi	a5,a5,16
    80204cd8:	c795                	beqz	a5,80204d04 <sys_chdir+0x78>
    eunlock(ep);
    eput(ep);
    return -1;
  }
  eunlock(ep);
    80204cda:	8526                	mv	a0,s1
    80204cdc:	00002097          	auipc	ra,0x2
    80204ce0:	14c080e7          	jalr	332(ra) # 80206e28 <eunlock>
  eput(p->cwd);
    80204ce4:	4d893503          	ld	a0,1240(s2)
    80204ce8:	00002097          	auipc	ra,0x2
    80204cec:	18e080e7          	jalr	398(ra) # 80206e76 <eput>
  p->cwd = ep;
    80204cf0:	4c993c23          	sd	s1,1240(s2)
  return 0;
    80204cf4:	4781                	li	a5,0
}
    80204cf6:	853e                	mv	a0,a5
    80204cf8:	70b2                	ld	ra,296(sp)
    80204cfa:	7412                	ld	s0,288(sp)
    80204cfc:	64f2                	ld	s1,280(sp)
    80204cfe:	6952                	ld	s2,272(sp)
    80204d00:	6155                	addi	sp,sp,304
    80204d02:	8082                	ret
    eunlock(ep);
    80204d04:	8526                	mv	a0,s1
    80204d06:	00002097          	auipc	ra,0x2
    80204d0a:	122080e7          	jalr	290(ra) # 80206e28 <eunlock>
    eput(ep);
    80204d0e:	8526                	mv	a0,s1
    80204d10:	00002097          	auipc	ra,0x2
    80204d14:	166080e7          	jalr	358(ra) # 80206e76 <eput>
    return -1;
    80204d18:	57fd                	li	a5,-1
    80204d1a:	bff1                	j	80204cf6 <sys_chdir+0x6a>
    return -1;
    80204d1c:	57fd                	li	a5,-1
    80204d1e:	bfe1                	j	80204cf6 <sys_chdir+0x6a>

0000000080204d20 <sys_pipe>:

uint64
sys_pipe(void)
{
    80204d20:	7139                	addi	sp,sp,-64
    80204d22:	fc06                	sd	ra,56(sp)
    80204d24:	f822                	sd	s0,48(sp)
    80204d26:	f426                	sd	s1,40(sp)
    80204d28:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80204d2a:	ffffd097          	auipc	ra,0xffffd
    80204d2e:	d4a080e7          	jalr	-694(ra) # 80201a74 <myproc>
    80204d32:	84aa                	mv	s1,a0

  if(argaddr(0, &fdarray) < 0)
    80204d34:	fd840593          	addi	a1,s0,-40
    80204d38:	4501                	li	a0,0
    80204d3a:	ffffe097          	auipc	ra,0xffffe
    80204d3e:	24a080e7          	jalr	586(ra) # 80202f84 <argaddr>
    return -1;
    80204d42:	57fd                	li	a5,-1
  if(argaddr(0, &fdarray) < 0)
    80204d44:	0c054e63          	bltz	a0,80204e20 <sys_pipe+0x100>
  if(pipealloc(&rf, &wf) < 0)
    80204d48:	fc840593          	addi	a1,s0,-56
    80204d4c:	fd040513          	addi	a0,s0,-48
    80204d50:	fffff097          	auipc	ra,0xfffff
    80204d54:	2be080e7          	jalr	702(ra) # 8020400e <pipealloc>
    return -1;
    80204d58:	57fd                	li	a5,-1
  if(pipealloc(&rf, &wf) < 0)
    80204d5a:	0c054363          	bltz	a0,80204e20 <sys_pipe+0x100>
  fd0 = -1;
    80204d5e:	fcf42223          	sw	a5,-60(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80204d62:	fd043503          	ld	a0,-48(s0)
    80204d66:	00000097          	auipc	ra,0x0
    80204d6a:	aa6080e7          	jalr	-1370(ra) # 8020480c <fdalloc>
    80204d6e:	fca42223          	sw	a0,-60(s0)
    80204d72:	08054a63          	bltz	a0,80204e06 <sys_pipe+0xe6>
    80204d76:	fc843503          	ld	a0,-56(s0)
    80204d7a:	00000097          	auipc	ra,0x0
    80204d7e:	a92080e7          	jalr	-1390(ra) # 8020480c <fdalloc>
    80204d82:	fca42023          	sw	a0,-64(s0)
    80204d86:	06054663          	bltz	a0,80204df2 <sys_pipe+0xd2>
    fileclose(wf);
    return -1;
  }
  // if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
  //    copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204d8a:	4611                	li	a2,4
    80204d8c:	fc440593          	addi	a1,s0,-60
    80204d90:	fd843503          	ld	a0,-40(s0)
    80204d94:	ffffc097          	auipc	ra,0xffffc
    80204d98:	604080e7          	jalr	1540(ra) # 80201398 <copyout2>
    80204d9c:	00054f63          	bltz	a0,80204dba <sys_pipe+0x9a>
     copyout2(fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80204da0:	4611                	li	a2,4
    80204da2:	fc040593          	addi	a1,s0,-64
    80204da6:	fd843503          	ld	a0,-40(s0)
    80204daa:	0511                	addi	a0,a0,4
    80204dac:	ffffc097          	auipc	ra,0xffffc
    80204db0:	5ec080e7          	jalr	1516(ra) # 80201398 <copyout2>
    p->ofile[fd1] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  return 0;
    80204db4:	4781                	li	a5,0
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204db6:	06055563          	bgez	a0,80204e20 <sys_pipe+0x100>
    p->ofile[fd0] = 0;
    80204dba:	fc442783          	lw	a5,-60(s0)
    80204dbe:	07e9                	addi	a5,a5,26
    80204dc0:	078e                	slli	a5,a5,0x3
    80204dc2:	97a6                	add	a5,a5,s1
    80204dc4:	0007b423          	sd	zero,8(a5)
    p->ofile[fd1] = 0;
    80204dc8:	fc042503          	lw	a0,-64(s0)
    80204dcc:	0569                	addi	a0,a0,26
    80204dce:	050e                	slli	a0,a0,0x3
    80204dd0:	9526                	add	a0,a0,s1
    80204dd2:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    80204dd6:	fd043503          	ld	a0,-48(s0)
    80204dda:	fffff097          	auipc	ra,0xfffff
    80204dde:	ec0080e7          	jalr	-320(ra) # 80203c9a <fileclose>
    fileclose(wf);
    80204de2:	fc843503          	ld	a0,-56(s0)
    80204de6:	fffff097          	auipc	ra,0xfffff
    80204dea:	eb4080e7          	jalr	-332(ra) # 80203c9a <fileclose>
    return -1;
    80204dee:	57fd                	li	a5,-1
    80204df0:	a805                	j	80204e20 <sys_pipe+0x100>
    if(fd0 >= 0)
    80204df2:	fc442783          	lw	a5,-60(s0)
    80204df6:	0007c863          	bltz	a5,80204e06 <sys_pipe+0xe6>
      p->ofile[fd0] = 0;
    80204dfa:	01a78513          	addi	a0,a5,26
    80204dfe:	050e                	slli	a0,a0,0x3
    80204e00:	9526                	add	a0,a0,s1
    80204e02:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    80204e06:	fd043503          	ld	a0,-48(s0)
    80204e0a:	fffff097          	auipc	ra,0xfffff
    80204e0e:	e90080e7          	jalr	-368(ra) # 80203c9a <fileclose>
    fileclose(wf);
    80204e12:	fc843503          	ld	a0,-56(s0)
    80204e16:	fffff097          	auipc	ra,0xfffff
    80204e1a:	e84080e7          	jalr	-380(ra) # 80203c9a <fileclose>
    return -1;
    80204e1e:	57fd                	li	a5,-1
}
    80204e20:	853e                	mv	a0,a5
    80204e22:	70e2                	ld	ra,56(sp)
    80204e24:	7442                	ld	s0,48(sp)
    80204e26:	74a2                	ld	s1,40(sp)
    80204e28:	6121                	addi	sp,sp,64
    80204e2a:	8082                	ret

0000000080204e2c <sys_dev>:

// To open console device.
uint64
sys_dev(void)
{
    80204e2c:	7179                	addi	sp,sp,-48
    80204e2e:	f406                	sd	ra,40(sp)
    80204e30:	f022                	sd	s0,32(sp)
    80204e32:	ec26                	sd	s1,24(sp)
    80204e34:	1800                	addi	s0,sp,48
  int fd, omode;
  int major, minor;
  struct file *f;

  if(argint(0, &omode) < 0 || argint(1, &major) < 0 || argint(2, &minor) < 0){
    80204e36:	fdc40593          	addi	a1,s0,-36
    80204e3a:	4501                	li	a0,0
    80204e3c:	ffffe097          	auipc	ra,0xffffe
    80204e40:	0e6080e7          	jalr	230(ra) # 80202f22 <argint>
    80204e44:	08054a63          	bltz	a0,80204ed8 <sys_dev+0xac>
    80204e48:	fd840593          	addi	a1,s0,-40
    80204e4c:	4505                	li	a0,1
    80204e4e:	ffffe097          	auipc	ra,0xffffe
    80204e52:	0d4080e7          	jalr	212(ra) # 80202f22 <argint>
    80204e56:	08054763          	bltz	a0,80204ee4 <sys_dev+0xb8>
    80204e5a:	fd440593          	addi	a1,s0,-44
    80204e5e:	4509                	li	a0,2
    80204e60:	ffffe097          	auipc	ra,0xffffe
    80204e64:	0c2080e7          	jalr	194(ra) # 80202f22 <argint>
    80204e68:	08054063          	bltz	a0,80204ee8 <sys_dev+0xbc>
    return -1;
  }

  if(omode & O_CREATE){
    80204e6c:	fdc42783          	lw	a5,-36(s0)
    80204e70:	2407f793          	andi	a5,a5,576
    80204e74:	ebb1                	bnez	a5,80204ec8 <sys_dev+0x9c>
    panic("dev file on FAT");
  }

  if(major < 0 || major >= NDEV)
    80204e76:	fd842703          	lw	a4,-40(s0)
    80204e7a:	47a5                	li	a5,9
    return -1;
    80204e7c:	557d                	li	a0,-1
  if(major < 0 || major >= NDEV)
    80204e7e:	04e7ee63          	bltu	a5,a4,80204eda <sys_dev+0xae>

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204e82:	fffff097          	auipc	ra,0xfffff
    80204e86:	d5c080e7          	jalr	-676(ra) # 80203bde <filealloc>
    80204e8a:	84aa                	mv	s1,a0
    80204e8c:	c125                	beqz	a0,80204eec <sys_dev+0xc0>
    80204e8e:	00000097          	auipc	ra,0x0
    80204e92:	97e080e7          	jalr	-1666(ra) # 8020480c <fdalloc>
    80204e96:	04054d63          	bltz	a0,80204ef0 <sys_dev+0xc4>
    if(f)
      fileclose(f);
    return -1;
  }

  f->type = FD_DEVICE;
    80204e9a:	478d                	li	a5,3
    80204e9c:	c09c                	sw	a5,0(s1)
  f->off = 0;
    80204e9e:	0204a023          	sw	zero,32(s1)
  f->ep = 0;
    80204ea2:	0004bc23          	sd	zero,24(s1)
  f->major = major;
    80204ea6:	fd842783          	lw	a5,-40(s0)
    80204eaa:	02f49223          	sh	a5,36(s1)
  f->readable = !(omode & O_WRONLY);
    80204eae:	fdc42783          	lw	a5,-36(s0)
    80204eb2:	0017c713          	xori	a4,a5,1
    80204eb6:	8b05                	andi	a4,a4,1
    80204eb8:	00e48423          	sb	a4,8(s1)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204ebc:	8b8d                	andi	a5,a5,3
    80204ebe:	00f037b3          	snez	a5,a5
    80204ec2:	00f484a3          	sb	a5,9(s1)

  return fd;
    80204ec6:	a811                	j	80204eda <sys_dev+0xae>
    panic("dev file on FAT");
    80204ec8:	00006517          	auipc	a0,0x6
    80204ecc:	d4050513          	addi	a0,a0,-704 # 8020ac08 <digits+0x888>
    80204ed0:	ffffb097          	auipc	ra,0xffffb
    80204ed4:	272080e7          	jalr	626(ra) # 80200142 <panic>
    return -1;
    80204ed8:	557d                	li	a0,-1
}
    80204eda:	70a2                	ld	ra,40(sp)
    80204edc:	7402                	ld	s0,32(sp)
    80204ede:	64e2                	ld	s1,24(sp)
    80204ee0:	6145                	addi	sp,sp,48
    80204ee2:	8082                	ret
    return -1;
    80204ee4:	557d                	li	a0,-1
    80204ee6:	bfd5                	j	80204eda <sys_dev+0xae>
    80204ee8:	557d                	li	a0,-1
    80204eea:	bfc5                	j	80204eda <sys_dev+0xae>
    return -1;
    80204eec:	557d                	li	a0,-1
    80204eee:	b7f5                	j	80204eda <sys_dev+0xae>
      fileclose(f);
    80204ef0:	8526                	mv	a0,s1
    80204ef2:	fffff097          	auipc	ra,0xfffff
    80204ef6:	da8080e7          	jalr	-600(ra) # 80203c9a <fileclose>
    return -1;
    80204efa:	557d                	li	a0,-1
    80204efc:	bff9                	j	80204eda <sys_dev+0xae>

0000000080204efe <sys_readdir>:

// To support ls command
uint64
sys_readdir(void)
{
    80204efe:	1101                	addi	sp,sp,-32
    80204f00:	ec06                	sd	ra,24(sp)
    80204f02:	e822                	sd	s0,16(sp)
    80204f04:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204f06:	fe840613          	addi	a2,s0,-24
    80204f0a:	4581                	li	a1,0
    80204f0c:	4501                	li	a0,0
    80204f0e:	00000097          	auipc	ra,0x0
    80204f12:	894080e7          	jalr	-1900(ra) # 802047a2 <argfd>
    return -1;
    80204f16:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204f18:	02054563          	bltz	a0,80204f42 <sys_readdir+0x44>
    80204f1c:	fe040593          	addi	a1,s0,-32
    80204f20:	4505                	li	a0,1
    80204f22:	ffffe097          	auipc	ra,0xffffe
    80204f26:	062080e7          	jalr	98(ra) # 80202f84 <argaddr>
    return -1;
    80204f2a:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204f2c:	00054b63          	bltz	a0,80204f42 <sys_readdir+0x44>
  return dirnext(f, p);
    80204f30:	fe043583          	ld	a1,-32(s0)
    80204f34:	fe843503          	ld	a0,-24(s0)
    80204f38:	fffff097          	auipc	ra,0xfffff
    80204f3c:	010080e7          	jalr	16(ra) # 80203f48 <dirnext>
    80204f40:	87aa                	mv	a5,a0
}
    80204f42:	853e                	mv	a0,a5
    80204f44:	60e2                	ld	ra,24(sp)
    80204f46:	6442                	ld	s0,16(sp)
    80204f48:	6105                	addi	sp,sp,32
    80204f4a:	8082                	ret

0000000080204f4c <sys_getcwd>:

// get absolute cwd string
uint64
sys_getcwd(void)
{
    80204f4c:	714d                	addi	sp,sp,-336
    80204f4e:	e686                	sd	ra,328(sp)
    80204f50:	e2a2                	sd	s0,320(sp)
    80204f52:	fe26                	sd	s1,312(sp)
    80204f54:	fa4a                	sd	s2,304(sp)
    80204f56:	f64e                	sd	s3,296(sp)
    80204f58:	f252                	sd	s4,288(sp)
    80204f5a:	ee56                	sd	s5,280(sp)
    80204f5c:	0a80                	addi	s0,sp,336
  uint64 addr;
  if (argaddr(0, &addr) < 0)
    80204f5e:	fb840593          	addi	a1,s0,-72
    80204f62:	4501                	li	a0,0
    80204f64:	ffffe097          	auipc	ra,0xffffe
    80204f68:	020080e7          	jalr	32(ra) # 80202f84 <argaddr>
    return -1;
    80204f6c:	57fd                	li	a5,-1
  if (argaddr(0, &addr) < 0)
    80204f6e:	06054f63          	bltz	a0,80204fec <sys_getcwd+0xa0>

  struct dirent *de = myproc()->cwd;
    80204f72:	ffffd097          	auipc	ra,0xffffd
    80204f76:	b02080e7          	jalr	-1278(ra) # 80201a74 <myproc>
    80204f7a:	4d853483          	ld	s1,1240(a0)
  char path[FAT32_MAX_PATH];
  char *s;
  int len;

  if (de->parent == NULL) {
    80204f7e:	1204b783          	ld	a5,288(s1)
    80204f82:	cfbd                	beqz	a5,80205000 <sys_getcwd+0xb4>
    s = "/";
  } else {
    s = path + FAT32_MAX_PATH - 1;
    *s = '\0';
    80204f84:	fa0409a3          	sb	zero,-77(s0)
    s = path + FAT32_MAX_PATH - 1;
    80204f88:	fb340993          	addi	s3,s0,-77
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= path)          // can't reach root "/"
    80204f8c:	eb040a13          	addi	s4,s0,-336
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    80204f90:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    80204f94:	8526                	mv	a0,s1
    80204f96:	ffffc097          	auipc	ra,0xffffc
    80204f9a:	956080e7          	jalr	-1706(ra) # 802008ec <strlen>
    80204f9e:	862a                	mv	a2,a0
      s -= len;
    80204fa0:	40a98933          	sub	s2,s3,a0
      if (s <= path)          // can't reach root "/"
    80204fa4:	072a7363          	bgeu	s4,s2,8020500a <sys_getcwd+0xbe>
      strncpy(s, de->filename, len);
    80204fa8:	85a6                	mv	a1,s1
    80204faa:	854a                	mv	a0,s2
    80204fac:	ffffc097          	auipc	ra,0xffffc
    80204fb0:	8d0080e7          	jalr	-1840(ra) # 8020087c <strncpy>
      *--s = '/';
    80204fb4:	fff90993          	addi	s3,s2,-1
    80204fb8:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    80204fbc:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    80204fc0:	1204b783          	ld	a5,288(s1)
    80204fc4:	fbe1                	bnez	a5,80204f94 <sys_getcwd+0x48>
    }
  }

  // if (copyout(myproc()->pagetable, addr, s, strlen(s) + 1) < 0)
  if (copyout2(addr, s, strlen(s) + 1) < 0)
    80204fc6:	fb843483          	ld	s1,-72(s0)
    80204fca:	854e                	mv	a0,s3
    80204fcc:	ffffc097          	auipc	ra,0xffffc
    80204fd0:	920080e7          	jalr	-1760(ra) # 802008ec <strlen>
    80204fd4:	0015061b          	addiw	a2,a0,1
    80204fd8:	85ce                	mv	a1,s3
    80204fda:	8526                	mv	a0,s1
    80204fdc:	ffffc097          	auipc	ra,0xffffc
    80204fe0:	3bc080e7          	jalr	956(ra) # 80201398 <copyout2>
    80204fe4:	02054563          	bltz	a0,8020500e <sys_getcwd+0xc2>
    return -1;
  
  return addr;
    80204fe8:	fb843783          	ld	a5,-72(s0)

}
    80204fec:	853e                	mv	a0,a5
    80204fee:	60b6                	ld	ra,328(sp)
    80204ff0:	6416                	ld	s0,320(sp)
    80204ff2:	74f2                	ld	s1,312(sp)
    80204ff4:	7952                	ld	s2,304(sp)
    80204ff6:	79b2                	ld	s3,296(sp)
    80204ff8:	7a12                	ld	s4,288(sp)
    80204ffa:	6af2                	ld	s5,280(sp)
    80204ffc:	6171                	addi	sp,sp,336
    80204ffe:	8082                	ret
    s = "/";
    80205000:	00005997          	auipc	s3,0x5
    80205004:	63098993          	addi	s3,s3,1584 # 8020a630 <digits+0x2b0>
    80205008:	bf7d                	j	80204fc6 <sys_getcwd+0x7a>
        return -1;
    8020500a:	57fd                	li	a5,-1
    8020500c:	b7c5                	j	80204fec <sys_getcwd+0xa0>
    return -1;
    8020500e:	57fd                	li	a5,-1
    80205010:	bff1                	j	80204fec <sys_getcwd+0xa0>

0000000080205012 <sys_remove>:
  return ret == -1;
}

uint64
sys_remove(void)
{
    80205012:	d6010113          	addi	sp,sp,-672
    80205016:	28113c23          	sd	ra,664(sp)
    8020501a:	28813823          	sd	s0,656(sp)
    8020501e:	28913423          	sd	s1,648(sp)
    80205022:	1500                	addi	s0,sp,672
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  int len;
  if((len = argstr(0, path, FAT32_MAX_PATH)) <= 0)
    80205024:	10400613          	li	a2,260
    80205028:	ed840593          	addi	a1,s0,-296
    8020502c:	4501                	li	a0,0
    8020502e:	ffffe097          	auipc	ra,0xffffe
    80205032:	f78080e7          	jalr	-136(ra) # 80202fa6 <argstr>
    80205036:	0ea05a63          	blez	a0,8020512a <sys_remove+0x118>
    return -1;

  char *s = path + len - 1;
    8020503a:	157d                	addi	a0,a0,-1
    8020503c:	ed840713          	addi	a4,s0,-296
    80205040:	00a707b3          	add	a5,a4,a0
  while (s >= path && *s == '/') {
    80205044:	02f00693          	li	a3,47
    80205048:	863a                	mv	a2,a4
    8020504a:	00e7e963          	bltu	a5,a4,8020505c <sys_remove+0x4a>
    8020504e:	0007c703          	lbu	a4,0(a5)
    80205052:	08d71a63          	bne	a4,a3,802050e6 <sys_remove+0xd4>
    s--;
    80205056:	17fd                	addi	a5,a5,-1
  while (s >= path && *s == '/') {
    80205058:	fec7fbe3          	bgeu	a5,a2,8020504e <sys_remove+0x3c>
  }
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    return -1;
  }
  
  if((ep = ename(path)) == NULL){
    8020505c:	ed840513          	addi	a0,s0,-296
    80205060:	00002097          	auipc	ra,0x2
    80205064:	53c080e7          	jalr	1340(ra) # 8020759c <ename>
    80205068:	84aa                	mv	s1,a0
    8020506a:	c561                	beqz	a0,80205132 <sys_remove+0x120>
    return -1;
  }
  elock(ep);
    8020506c:	00002097          	auipc	ra,0x2
    80205070:	d86080e7          	jalr	-634(ra) # 80206df2 <elock>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80205074:	1004c783          	lbu	a5,256(s1)
    80205078:	8bc1                	andi	a5,a5,16
    8020507a:	c38d                	beqz	a5,8020509c <sys_remove+0x8a>
  ep.valid = 0;
    8020507c:	e8041323          	sh	zero,-378(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80205080:	d6c40693          	addi	a3,s0,-660
    80205084:	04000613          	li	a2,64
    80205088:	d7040593          	addi	a1,s0,-656
    8020508c:	8526                	mv	a0,s1
    8020508e:	00002097          	auipc	ra,0x2
    80205092:	f68080e7          	jalr	-152(ra) # 80206ff6 <enext>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80205096:	57fd                	li	a5,-1
    80205098:	06f51d63          	bne	a0,a5,80205112 <sys_remove+0x100>
      eunlock(ep);
      eput(ep);
      return -1;
  }
  elock(ep->parent);      // Will this lead to deadlock?
    8020509c:	1204b503          	ld	a0,288(s1)
    802050a0:	00002097          	auipc	ra,0x2
    802050a4:	d52080e7          	jalr	-686(ra) # 80206df2 <elock>
  eremove(ep);
    802050a8:	8526                	mv	a0,s1
    802050aa:	00002097          	auipc	ra,0x2
    802050ae:	c14080e7          	jalr	-1004(ra) # 80206cbe <eremove>
  eunlock(ep->parent);
    802050b2:	1204b503          	ld	a0,288(s1)
    802050b6:	00002097          	auipc	ra,0x2
    802050ba:	d72080e7          	jalr	-654(ra) # 80206e28 <eunlock>
  eunlock(ep);
    802050be:	8526                	mv	a0,s1
    802050c0:	00002097          	auipc	ra,0x2
    802050c4:	d68080e7          	jalr	-664(ra) # 80206e28 <eunlock>
  eput(ep);
    802050c8:	8526                	mv	a0,s1
    802050ca:	00002097          	auipc	ra,0x2
    802050ce:	dac080e7          	jalr	-596(ra) # 80206e76 <eput>

  return 0;
    802050d2:	4501                	li	a0,0
}
    802050d4:	29813083          	ld	ra,664(sp)
    802050d8:	29013403          	ld	s0,656(sp)
    802050dc:	28813483          	ld	s1,648(sp)
    802050e0:	2a010113          	addi	sp,sp,672
    802050e4:	8082                	ret
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    802050e6:	ed840713          	addi	a4,s0,-296
    802050ea:	f6e7e9e3          	bltu	a5,a4,8020505c <sys_remove+0x4a>
    802050ee:	0007c683          	lbu	a3,0(a5)
    802050f2:	02e00713          	li	a4,46
    802050f6:	f6e693e3          	bne	a3,a4,8020505c <sys_remove+0x4a>
    802050fa:	ed840713          	addi	a4,s0,-296
    802050fe:	02e78863          	beq	a5,a4,8020512e <sys_remove+0x11c>
    80205102:	fff7c703          	lbu	a4,-1(a5)
    80205106:	02f00793          	li	a5,47
    8020510a:	f4f719e3          	bne	a4,a5,8020505c <sys_remove+0x4a>
    return -1;
    8020510e:	557d                	li	a0,-1
    80205110:	b7d1                	j	802050d4 <sys_remove+0xc2>
      eunlock(ep);
    80205112:	8526                	mv	a0,s1
    80205114:	00002097          	auipc	ra,0x2
    80205118:	d14080e7          	jalr	-748(ra) # 80206e28 <eunlock>
      eput(ep);
    8020511c:	8526                	mv	a0,s1
    8020511e:	00002097          	auipc	ra,0x2
    80205122:	d58080e7          	jalr	-680(ra) # 80206e76 <eput>
      return -1;
    80205126:	557d                	li	a0,-1
    80205128:	b775                	j	802050d4 <sys_remove+0xc2>
    return -1;
    8020512a:	557d                	li	a0,-1
    8020512c:	b765                	j	802050d4 <sys_remove+0xc2>
    return -1;
    8020512e:	557d                	li	a0,-1
    80205130:	b755                	j	802050d4 <sys_remove+0xc2>
    return -1;
    80205132:	557d                	li	a0,-1
    80205134:	b745                	j	802050d4 <sys_remove+0xc2>

0000000080205136 <sys_rename>:

// Must hold too many locks at a time! It's possible to raise a deadlock.
// Because this op takes some steps, we can't promise
uint64
sys_rename(void)
{
    80205136:	c4010113          	addi	sp,sp,-960
    8020513a:	3a113c23          	sd	ra,952(sp)
    8020513e:	3a813823          	sd	s0,944(sp)
    80205142:	3a913423          	sd	s1,936(sp)
    80205146:	3b213023          	sd	s2,928(sp)
    8020514a:	39313c23          	sd	s3,920(sp)
    8020514e:	39413823          	sd	s4,912(sp)
    80205152:	0780                	addi	s0,sp,960
  char old[FAT32_MAX_PATH], new[FAT32_MAX_PATH];
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80205154:	10400613          	li	a2,260
    80205158:	ec840593          	addi	a1,s0,-312
    8020515c:	4501                	li	a0,0
    8020515e:	ffffe097          	auipc	ra,0xffffe
    80205162:	e48080e7          	jalr	-440(ra) # 80202fa6 <argstr>
      return -1;
    80205166:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80205168:	0c054d63          	bltz	a0,80205242 <sys_rename+0x10c>
    8020516c:	10400613          	li	a2,260
    80205170:	dc040593          	addi	a1,s0,-576
    80205174:	4505                	li	a0,1
    80205176:	ffffe097          	auipc	ra,0xffffe
    8020517a:	e30080e7          	jalr	-464(ra) # 80202fa6 <argstr>
      return -1;
    8020517e:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80205180:	0c054163          	bltz	a0,80205242 <sys_rename+0x10c>
  }

  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
  int srclock = 0;
  char *name;
  if ((src = ename(old)) == NULL || (pdst = enameparent(new, old)) == NULL
    80205184:	ec840513          	addi	a0,s0,-312
    80205188:	00002097          	auipc	ra,0x2
    8020518c:	414080e7          	jalr	1044(ra) # 8020759c <ename>
    80205190:	84aa                	mv	s1,a0
    80205192:	1c050963          	beqz	a0,80205364 <sys_rename+0x22e>
    80205196:	ec840593          	addi	a1,s0,-312
    8020519a:	dc040513          	addi	a0,s0,-576
    8020519e:	00002097          	auipc	ra,0x2
    802051a2:	41c080e7          	jalr	1052(ra) # 802075ba <enameparent>
    802051a6:	892a                	mv	s2,a0
    802051a8:	cd35                	beqz	a0,80205224 <sys_rename+0xee>
      || (name = formatname(old)) == NULL) {
    802051aa:	ec840513          	addi	a0,s0,-312
    802051ae:	00001097          	auipc	ra,0x1
    802051b2:	57e080e7          	jalr	1406(ra) # 8020672c <formatname>
    802051b6:	89aa                	mv	s3,a0
    802051b8:	c535                	beqz	a0,80205224 <sys_rename+0xee>
    goto fail;          // src doesn't exist || dst parent doesn't exist || illegal new name
  }
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    if (ep == src) {    // In what universe can we move a directory into its child?
    802051ba:	07248563          	beq	s1,s2,80205224 <sys_rename+0xee>
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    802051be:	87ca                	mv	a5,s2
    802051c0:	1207b783          	ld	a5,288(a5)
    802051c4:	c781                	beqz	a5,802051cc <sys_rename+0x96>
    if (ep == src) {    // In what universe can we move a directory into its child?
    802051c6:	fef49de3          	bne	s1,a5,802051c0 <sys_rename+0x8a>
    802051ca:	a8a9                	j	80205224 <sys_rename+0xee>
      goto fail;
    }
  }

  uint off;
  elock(src);     // must hold child's lock before acquiring parent's, because we do so in other similar cases
    802051cc:	8526                	mv	a0,s1
    802051ce:	00002097          	auipc	ra,0x2
    802051d2:	c24080e7          	jalr	-988(ra) # 80206df2 <elock>
  srclock = 1;
  elock(pdst);
    802051d6:	854a                	mv	a0,s2
    802051d8:	00002097          	auipc	ra,0x2
    802051dc:	c1a080e7          	jalr	-998(ra) # 80206df2 <elock>
  dst = dirlookup(pdst, name, &off);
    802051e0:	dbc40613          	addi	a2,s0,-580
    802051e4:	85ce                	mv	a1,s3
    802051e6:	854a                	mv	a0,s2
    802051e8:	00002097          	auipc	ra,0x2
    802051ec:	f9e080e7          	jalr	-98(ra) # 80207186 <dirlookup>
    802051f0:	8a2a                	mv	s4,a0
  if (dst != NULL) {
    802051f2:	cd45                	beqz	a0,802052aa <sys_rename+0x174>
    eunlock(pdst);
    802051f4:	854a                	mv	a0,s2
    802051f6:	00002097          	auipc	ra,0x2
    802051fa:	c32080e7          	jalr	-974(ra) # 80206e28 <eunlock>
    if (src == dst) {
    802051fe:	01448963          	beq	s1,s4,80205210 <sys_rename+0xda>
      goto fail;
    } else if (src->attribute & dst->attribute & ATTR_DIRECTORY) {
    80205202:	1004c783          	lbu	a5,256(s1)
    80205206:	100a4703          	lbu	a4,256(s4)
    8020520a:	8ff9                	and	a5,a5,a4
    8020520c:	8bc1                	andi	a5,a5,16
    8020520e:	ebb1                	bnez	a5,80205262 <sys_rename+0x12c>

  return 0;

fail:
  if (srclock)
    eunlock(src);
    80205210:	8526                	mv	a0,s1
    80205212:	00002097          	auipc	ra,0x2
    80205216:	c16080e7          	jalr	-1002(ra) # 80206e28 <eunlock>
  if (dst)
    eput(dst);
    8020521a:	8552                	mv	a0,s4
    8020521c:	00002097          	auipc	ra,0x2
    80205220:	c5a080e7          	jalr	-934(ra) # 80206e76 <eput>
  if (pdst)
    80205224:	00090763          	beqz	s2,80205232 <sys_rename+0xfc>
    eput(pdst);
    80205228:	854a                	mv	a0,s2
    8020522a:	00002097          	auipc	ra,0x2
    8020522e:	c4c080e7          	jalr	-948(ra) # 80206e76 <eput>
  if (src)
    eput(src);
  return -1;
    80205232:	57fd                	li	a5,-1
  if (src)
    80205234:	c499                	beqz	s1,80205242 <sys_rename+0x10c>
    eput(src);
    80205236:	8526                	mv	a0,s1
    80205238:	00002097          	auipc	ra,0x2
    8020523c:	c3e080e7          	jalr	-962(ra) # 80206e76 <eput>
  return -1;
    80205240:	57fd                	li	a5,-1
}
    80205242:	853e                	mv	a0,a5
    80205244:	3b813083          	ld	ra,952(sp)
    80205248:	3b013403          	ld	s0,944(sp)
    8020524c:	3a813483          	ld	s1,936(sp)
    80205250:	3a013903          	ld	s2,928(sp)
    80205254:	39813983          	ld	s3,920(sp)
    80205258:	39013a03          	ld	s4,912(sp)
    8020525c:	3c010113          	addi	sp,sp,960
    80205260:	8082                	ret
      elock(dst);
    80205262:	8552                	mv	a0,s4
    80205264:	00002097          	auipc	ra,0x2
    80205268:	b8e080e7          	jalr	-1138(ra) # 80206df2 <elock>
  ep.valid = 0;
    8020526c:	d6041323          	sh	zero,-666(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80205270:	c4c40693          	addi	a3,s0,-948
    80205274:	04000613          	li	a2,64
    80205278:	c5040593          	addi	a1,s0,-944
    8020527c:	8552                	mv	a0,s4
    8020527e:	00002097          	auipc	ra,0x2
    80205282:	d78080e7          	jalr	-648(ra) # 80206ff6 <enext>
      if (!isdirempty(dst)) {    // it's ok to overwrite an empty dir
    80205286:	57fd                	li	a5,-1
    80205288:	0cf51863          	bne	a0,a5,80205358 <sys_rename+0x222>
      elock(pdst);
    8020528c:	854a                	mv	a0,s2
    8020528e:	00002097          	auipc	ra,0x2
    80205292:	b64080e7          	jalr	-1180(ra) # 80206df2 <elock>
    eremove(dst);
    80205296:	8552                	mv	a0,s4
    80205298:	00002097          	auipc	ra,0x2
    8020529c:	a26080e7          	jalr	-1498(ra) # 80206cbe <eremove>
    eunlock(dst);
    802052a0:	8552                	mv	a0,s4
    802052a2:	00002097          	auipc	ra,0x2
    802052a6:	b86080e7          	jalr	-1146(ra) # 80206e28 <eunlock>
  memmove(src->filename, name, FAT32_MAX_FILENAME);
    802052aa:	0ff00613          	li	a2,255
    802052ae:	85ce                	mv	a1,s3
    802052b0:	8526                	mv	a0,s1
    802052b2:	ffffb097          	auipc	ra,0xffffb
    802052b6:	512080e7          	jalr	1298(ra) # 802007c4 <memmove>
  emake(pdst, src, off);
    802052ba:	dbc42603          	lw	a2,-580(s0)
    802052be:	85a6                	mv	a1,s1
    802052c0:	854a                	mv	a0,s2
    802052c2:	00001097          	auipc	ra,0x1
    802052c6:	522080e7          	jalr	1314(ra) # 802067e4 <emake>
  if (src->parent != pdst) {
    802052ca:	1204b783          	ld	a5,288(s1)
    802052ce:	01278d63          	beq	a5,s2,802052e8 <sys_rename+0x1b2>
    eunlock(pdst);
    802052d2:	854a                	mv	a0,s2
    802052d4:	00002097          	auipc	ra,0x2
    802052d8:	b54080e7          	jalr	-1196(ra) # 80206e28 <eunlock>
    elock(src->parent);
    802052dc:	1204b503          	ld	a0,288(s1)
    802052e0:	00002097          	auipc	ra,0x2
    802052e4:	b12080e7          	jalr	-1262(ra) # 80206df2 <elock>
  eremove(src);
    802052e8:	8526                	mv	a0,s1
    802052ea:	00002097          	auipc	ra,0x2
    802052ee:	9d4080e7          	jalr	-1580(ra) # 80206cbe <eremove>
  eunlock(src->parent);
    802052f2:	1204b503          	ld	a0,288(s1)
    802052f6:	00002097          	auipc	ra,0x2
    802052fa:	b32080e7          	jalr	-1230(ra) # 80206e28 <eunlock>
  struct dirent *psrc = src->parent;  // src must not be root, or it won't pass the for-loop test
    802052fe:	1204b983          	ld	s3,288(s1)
  src->parent = edup(pdst);
    80205302:	854a                	mv	a0,s2
    80205304:	00002097          	auipc	ra,0x2
    80205308:	890080e7          	jalr	-1904(ra) # 80206b94 <edup>
    8020530c:	12a4b023          	sd	a0,288(s1)
  src->off = off;
    80205310:	dbc42783          	lw	a5,-580(s0)
    80205314:	10f4ae23          	sw	a5,284(s1)
  src->valid = 1;
    80205318:	4785                	li	a5,1
    8020531a:	10f49b23          	sh	a5,278(s1)
  eunlock(src);
    8020531e:	8526                	mv	a0,s1
    80205320:	00002097          	auipc	ra,0x2
    80205324:	b08080e7          	jalr	-1272(ra) # 80206e28 <eunlock>
  eput(psrc);
    80205328:	854e                	mv	a0,s3
    8020532a:	00002097          	auipc	ra,0x2
    8020532e:	b4c080e7          	jalr	-1204(ra) # 80206e76 <eput>
  if (dst) {
    80205332:	000a0763          	beqz	s4,80205340 <sys_rename+0x20a>
    eput(dst);
    80205336:	8552                	mv	a0,s4
    80205338:	00002097          	auipc	ra,0x2
    8020533c:	b3e080e7          	jalr	-1218(ra) # 80206e76 <eput>
  eput(pdst);
    80205340:	854a                	mv	a0,s2
    80205342:	00002097          	auipc	ra,0x2
    80205346:	b34080e7          	jalr	-1228(ra) # 80206e76 <eput>
  eput(src);
    8020534a:	8526                	mv	a0,s1
    8020534c:	00002097          	auipc	ra,0x2
    80205350:	b2a080e7          	jalr	-1238(ra) # 80206e76 <eput>
  return 0;
    80205354:	4781                	li	a5,0
    80205356:	b5f5                	j	80205242 <sys_rename+0x10c>
        eunlock(dst);
    80205358:	8552                	mv	a0,s4
    8020535a:	00002097          	auipc	ra,0x2
    8020535e:	ace080e7          	jalr	-1330(ra) # 80206e28 <eunlock>
        goto fail;
    80205362:	b57d                	j	80205210 <sys_rename+0xda>
  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
    80205364:	892a                	mv	s2,a0
  if (dst)
    80205366:	bd7d                	j	80205224 <sys_rename+0xee>

0000000080205368 <sys_openat>:

// added by lmq for SYS_openat
uint64
sys_openat(void)
{
    80205368:	ca010113          	addi	sp,sp,-864
    8020536c:	34113c23          	sd	ra,856(sp)
    80205370:	34813823          	sd	s0,848(sp)
    80205374:	34913423          	sd	s1,840(sp)
    80205378:	35213023          	sd	s2,832(sp)
    8020537c:	33313c23          	sd	s3,824(sp)
    80205380:	33413823          	sd	s4,816(sp)
    80205384:	33513423          	sd	s5,808(sp)
    80205388:	1680                	addi	s0,sp,864
  int dirfd;
  if(argint(0, &dirfd) < 0)
    8020538a:	fbc40593          	addi	a1,s0,-68
    8020538e:	4501                	li	a0,0
    80205390:	ffffe097          	auipc	ra,0xffffe
    80205394:	b92080e7          	jalr	-1134(ra) # 80202f22 <argint>
    80205398:	2e054563          	bltz	a0,80205682 <sys_openat+0x31a>
    return -1;
  struct dirent *de = myproc()->cwd;
    8020539c:	ffffc097          	auipc	ra,0xffffc
    802053a0:	6d8080e7          	jalr	1752(ra) # 80201a74 <myproc>
  if(dirfd!=AT_FDCWD)
    802053a4:	fbc42703          	lw	a4,-68(s0)
    802053a8:	f9c00793          	li	a5,-100
    802053ac:	16f71563          	bne	a4,a5,80205516 <sys_openat+0x1ae>
  struct dirent *de = myproc()->cwd;
    802053b0:	4d853483          	ld	s1,1240(a0)
  {
    de=myproc()->ofile[dirfd]->ep;
  }
  char cur_path[FAT32_MAX_PATH];  // openat工作目录 可以为当前目录 也可以被指定
  memset(cur_path,0,FAT32_MAX_PATH);
    802053b4:	10400613          	li	a2,260
    802053b8:	4581                	li	a1,0
    802053ba:	eb840513          	addi	a0,s0,-328
    802053be:	ffffb097          	auipc	ra,0xffffb
    802053c2:	3a6080e7          	jalr	934(ra) # 80200764 <memset>
  char* s=NULL;
  int len;

  // 获得openat工作目录路径
  if (de->parent == NULL) {
    802053c6:	1204b783          	ld	a5,288(s1)
    802053ca:	16078263          	beqz	a5,8020552e <sys_openat+0x1c6>
    s = "/";
  } 
  else {
    s = cur_path + FAT32_MAX_PATH - 1;
    *s = '\0';
    802053ce:	fa040da3          	sb	zero,-69(s0)
    s = cur_path + FAT32_MAX_PATH - 1;
    802053d2:	fbb40993          	addi	s3,s0,-69
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= cur_path)          // can't reach root "/"
    802053d6:	eb840a13          	addi	s4,s0,-328
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    802053da:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    802053de:	8526                	mv	a0,s1
    802053e0:	ffffb097          	auipc	ra,0xffffb
    802053e4:	50c080e7          	jalr	1292(ra) # 802008ec <strlen>
    802053e8:	862a                	mv	a2,a0
      s -= len;
    802053ea:	40a98933          	sub	s2,s3,a0
      if (s <= cur_path)          // can't reach root "/"
    802053ee:	292a7c63          	bgeu	s4,s2,80205686 <sys_openat+0x31e>
      strncpy(s, de->filename, len);
    802053f2:	85a6                	mv	a1,s1
    802053f4:	854a                	mv	a0,s2
    802053f6:	ffffb097          	auipc	ra,0xffffb
    802053fa:	486080e7          	jalr	1158(ra) # 8020087c <strncpy>
      *--s = '/';
    802053fe:	fff90993          	addi	s3,s2,-1
    80205402:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    80205406:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    8020540a:	1204b783          	ld	a5,288(s1)
    8020540e:	fbe1                	bnez	a5,802053de <sys_openat+0x76>
    }
  }
  
  // 获得openat的文件路径 openat工作目录+相对路径
  char absolute_path[FAT32_MAX_PATH];
  memset(absolute_path,0,FAT32_MAX_PATH);
    80205410:	10400613          	li	a2,260
    80205414:	4581                	li	a1,0
    80205416:	db040493          	addi	s1,s0,-592
    8020541a:	8526                	mv	a0,s1
    8020541c:	ffffb097          	auipc	ra,0xffffb
    80205420:	348080e7          	jalr	840(ra) # 80200764 <memset>
  strncpy(absolute_path,s,strlen(s));
    80205424:	854e                	mv	a0,s3
    80205426:	ffffb097          	auipc	ra,0xffffb
    8020542a:	4c6080e7          	jalr	1222(ra) # 802008ec <strlen>
    8020542e:	862a                	mv	a2,a0
    80205430:	85ce                	mv	a1,s3
    80205432:	8526                	mv	a0,s1
    80205434:	ffffb097          	auipc	ra,0xffffb
    80205438:	448080e7          	jalr	1096(ra) # 8020087c <strncpy>

  int fd,omode;
  struct file *f;
  struct dirent *ep;
  char relative_path[FAT32_MAX_PATH];
  if(argstr(1, relative_path, FAT32_MAX_PATH) < 0 || argint(2,&omode) < 0)
    8020543c:	10400613          	li	a2,260
    80205440:	ca840593          	addi	a1,s0,-856
    80205444:	4505                	li	a0,1
    80205446:	ffffe097          	auipc	ra,0xffffe
    8020544a:	b60080e7          	jalr	-1184(ra) # 80202fa6 <argstr>
    8020544e:	24054e63          	bltz	a0,802056aa <sys_openat+0x342>
    80205452:	dac40593          	addi	a1,s0,-596
    80205456:	4509                	li	a0,2
    80205458:	ffffe097          	auipc	ra,0xffffe
    8020545c:	aca080e7          	jalr	-1334(ra) # 80202f22 <argint>
    80205460:	24054763          	bltz	a0,802056ae <sys_openat+0x346>
    return -1;
  
  if(relative_path[0]=='/')                               // 为绝对路径 忽略dirfd
    80205464:	ca844783          	lbu	a5,-856(s0)
    80205468:	02f00713          	li	a4,47
    8020546c:	0ce78663          	beq	a5,a4,80205538 <sys_openat+0x1d0>
  {
    memset(absolute_path,0,FAT32_MAX_PATH);
    strncpy(absolute_path,relative_path,strlen(relative_path));
  }
  else if(relative_path[0]=='.' && relative_path[1]=='/') // 为显式相对路径
    80205470:	02e00713          	li	a4,46
    80205474:	0ee78963          	beq	a5,a4,80205566 <sys_openat+0x1fe>
  {
    panic("openat not support ..");
  }
  else                                                    // 为隐式相对路径
  {
    int absolute_path_old_len=strlen(absolute_path);
    80205478:	db040913          	addi	s2,s0,-592
    8020547c:	854a                	mv	a0,s2
    8020547e:	ffffb097          	auipc	ra,0xffffb
    80205482:	46e080e7          	jalr	1134(ra) # 802008ec <strlen>
    absolute_path[absolute_path_old_len]='/';
    80205486:	fc040793          	addi	a5,s0,-64
    8020548a:	97aa                	add	a5,a5,a0
    8020548c:	02f00713          	li	a4,47
    80205490:	dee78823          	sb	a4,-528(a5)
    absolute_path[absolute_path_old_len+1]='\0';
    80205494:	2505                	addiw	a0,a0,1
    80205496:	fc040793          	addi	a5,s0,-64
    8020549a:	953e                	add	a0,a0,a5
    8020549c:	de050823          	sb	zero,-528(a0)
    strncpy(absolute_path+strlen(absolute_path),
    802054a0:	854a                	mv	a0,s2
    802054a2:	ffffb097          	auipc	ra,0xffffb
    802054a6:	44a080e7          	jalr	1098(ra) # 802008ec <strlen>
    802054aa:	84aa                	mv	s1,a0
    802054ac:	ca840993          	addi	s3,s0,-856
    802054b0:	854e                	mv	a0,s3
    802054b2:	ffffb097          	auipc	ra,0xffffb
    802054b6:	43a080e7          	jalr	1082(ra) # 802008ec <strlen>
    802054ba:	862a                	mv	a2,a0
    802054bc:	85ce                	mv	a1,s3
    802054be:	00990533          	add	a0,s2,s1
    802054c2:	ffffb097          	auipc	ra,0xffffb
    802054c6:	3ba080e7          	jalr	954(ra) # 8020087c <strncpy>
            relative_path,
            strlen(relative_path));
  }

  // 根据路径名打开文件
  if(omode & O_CREATE){                         // 创建文件
    802054ca:	dac42603          	lw	a2,-596(s0)
    802054ce:	24067793          	andi	a5,a2,576
    802054d2:	e7e5                	bnez	a5,802055ba <sys_openat+0x252>
    ep = create(absolute_path, T_FILE, omode);
    if(ep == NULL){
      return -1;
    }
  } 
  else if(omode & O_DIRECTORY)                  // 打开一个目录
    802054d4:	02a61793          	slli	a5,a2,0x2a
    802054d8:	1607d063          	bgez	a5,80205638 <sys_openat+0x2d0>
  {
    
    if((ep=ename(absolute_path))==NULL)         // 获取目录项
    802054dc:	db040513          	addi	a0,s0,-592
    802054e0:	00002097          	auipc	ra,0x2
    802054e4:	0bc080e7          	jalr	188(ra) # 8020759c <ename>
    802054e8:	892a                	mv	s2,a0
    802054ea:	1c050663          	beqz	a0,802056b6 <sys_openat+0x34e>
    {
      return -1;
    }
    elock(ep);
    802054ee:	00002097          	auipc	ra,0x2
    802054f2:	904080e7          	jalr	-1788(ra) # 80206df2 <elock>
    if(!(ep->attribute & ATTR_DIRECTORY))       // 该文件不是目录文件
    802054f6:	10094783          	lbu	a5,256(s2)
    802054fa:	8bc1                	andi	a5,a5,16
    802054fc:	ebe1                	bnez	a5,802055cc <sys_openat+0x264>
    {
      eunlock(ep);
    802054fe:	854a                	mv	a0,s2
    80205500:	00002097          	auipc	ra,0x2
    80205504:	928080e7          	jalr	-1752(ra) # 80206e28 <eunlock>
      eput(ep);
    80205508:	854a                	mv	a0,s2
    8020550a:	00002097          	auipc	ra,0x2
    8020550e:	96c080e7          	jalr	-1684(ra) # 80206e76 <eput>
      return -1;
    80205512:	557d                	li	a0,-1
    80205514:	aa95                	j	80205688 <sys_openat+0x320>
    de=myproc()->ofile[dirfd]->ep;
    80205516:	ffffc097          	auipc	ra,0xffffc
    8020551a:	55e080e7          	jalr	1374(ra) # 80201a74 <myproc>
    8020551e:	fbc42783          	lw	a5,-68(s0)
    80205522:	07e9                	addi	a5,a5,26
    80205524:	078e                	slli	a5,a5,0x3
    80205526:	97aa                	add	a5,a5,a0
    80205528:	679c                	ld	a5,8(a5)
    8020552a:	6f84                	ld	s1,24(a5)
    8020552c:	b561                	j	802053b4 <sys_openat+0x4c>
    s = "/";
    8020552e:	00005997          	auipc	s3,0x5
    80205532:	10298993          	addi	s3,s3,258 # 8020a630 <digits+0x2b0>
    80205536:	bde9                	j	80205410 <sys_openat+0xa8>
    memset(absolute_path,0,FAT32_MAX_PATH);
    80205538:	10400613          	li	a2,260
    8020553c:	4581                	li	a1,0
    8020553e:	8526                	mv	a0,s1
    80205540:	ffffb097          	auipc	ra,0xffffb
    80205544:	224080e7          	jalr	548(ra) # 80200764 <memset>
    strncpy(absolute_path,relative_path,strlen(relative_path));
    80205548:	ca840913          	addi	s2,s0,-856
    8020554c:	854a                	mv	a0,s2
    8020554e:	ffffb097          	auipc	ra,0xffffb
    80205552:	39e080e7          	jalr	926(ra) # 802008ec <strlen>
    80205556:	862a                	mv	a2,a0
    80205558:	85ca                	mv	a1,s2
    8020555a:	8526                	mv	a0,s1
    8020555c:	ffffb097          	auipc	ra,0xffffb
    80205560:	320080e7          	jalr	800(ra) # 8020087c <strncpy>
    80205564:	b79d                	j	802054ca <sys_openat+0x162>
  else if(relative_path[0]=='.' && relative_path[1]=='/') // 为显式相对路径
    80205566:	ca944783          	lbu	a5,-855(s0)
    8020556a:	02f00713          	li	a4,47
    8020556e:	00e78e63          	beq	a5,a4,8020558a <sys_openat+0x222>
  else if (relative_path[0]=='.' && relative_path[1]=='.')// 显示相对路径 没有实现
    80205572:	02e00713          	li	a4,46
    80205576:	f0e791e3          	bne	a5,a4,80205478 <sys_openat+0x110>
    panic("openat not support ..");
    8020557a:	00005517          	auipc	a0,0x5
    8020557e:	69e50513          	addi	a0,a0,1694 # 8020ac18 <digits+0x898>
    80205582:	ffffb097          	auipc	ra,0xffffb
    80205586:	bc0080e7          	jalr	-1088(ra) # 80200142 <panic>
    strncpy(absolute_path+strlen(absolute_path),
    8020558a:	db040913          	addi	s2,s0,-592
    8020558e:	854a                	mv	a0,s2
    80205590:	ffffb097          	auipc	ra,0xffffb
    80205594:	35c080e7          	jalr	860(ra) # 802008ec <strlen>
    80205598:	84aa                	mv	s1,a0
    8020559a:	ca940993          	addi	s3,s0,-855
    8020559e:	854e                	mv	a0,s3
    802055a0:	ffffb097          	auipc	ra,0xffffb
    802055a4:	34c080e7          	jalr	844(ra) # 802008ec <strlen>
    802055a8:	862a                	mv	a2,a0
    802055aa:	85ce                	mv	a1,s3
    802055ac:	00990533          	add	a0,s2,s1
    802055b0:	ffffb097          	auipc	ra,0xffffb
    802055b4:	2cc080e7          	jalr	716(ra) # 8020087c <strncpy>
    802055b8:	bf09                	j	802054ca <sys_openat+0x162>
    ep = create(absolute_path, T_FILE, omode);
    802055ba:	4589                	li	a1,2
    802055bc:	db040513          	addi	a0,s0,-592
    802055c0:	fffff097          	auipc	ra,0xfffff
    802055c4:	290080e7          	jalr	656(ra) # 80204850 <create>
    802055c8:	892a                	mv	s2,a0
    if(ep == NULL){
    802055ca:	c565                	beqz	a0,802056b2 <sys_openat+0x34a>
      return -1;
    }
  }

  
  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    802055cc:	ffffe097          	auipc	ra,0xffffe
    802055d0:	612080e7          	jalr	1554(ra) # 80203bde <filealloc>
    802055d4:	89aa                	mv	s3,a0
    802055d6:	c96d                	beqz	a0,802056c8 <sys_openat+0x360>
    802055d8:	fffff097          	auipc	ra,0xfffff
    802055dc:	234080e7          	jalr	564(ra) # 8020480c <fdalloc>
    802055e0:	84aa                	mv	s1,a0
    802055e2:	0c054e63          	bltz	a0,802056be <sys_openat+0x356>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    802055e6:	10094783          	lbu	a5,256(s2)
    802055ea:	8bc1                	andi	a5,a5,16
    802055ec:	e791                	bnez	a5,802055f8 <sys_openat+0x290>
    802055ee:	dac42783          	lw	a5,-596(s0)
    802055f2:	4007f793          	andi	a5,a5,1024
    802055f6:	e3c1                	bnez	a5,80205676 <sys_openat+0x30e>
    etrunc(ep);
  }

  // 设置权限
  f->type = FD_ENTRY;
    802055f8:	4789                	li	a5,2
    802055fa:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    802055fe:	dac42783          	lw	a5,-596(s0)
    80205602:	0047f693          	andi	a3,a5,4
    80205606:	4701                	li	a4,0
    80205608:	c299                	beqz	a3,8020560e <sys_openat+0x2a6>
    8020560a:	10892703          	lw	a4,264(s2)
    8020560e:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    80205612:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    80205616:	0017c713          	xori	a4,a5,1
    8020561a:	8b05                	andi	a4,a4,1
    8020561c:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80205620:	8b8d                	andi	a5,a5,3
    80205622:	00f037b3          	snez	a5,a5
    80205626:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    8020562a:	854a                	mv	a0,s2
    8020562c:	00001097          	auipc	ra,0x1
    80205630:	7fc080e7          	jalr	2044(ra) # 80206e28 <eunlock>

  return fd;
    80205634:	8526                	mv	a0,s1
    80205636:	a889                	j	80205688 <sys_openat+0x320>
    if((ep = ename(absolute_path)) == NULL){
    80205638:	db040513          	addi	a0,s0,-592
    8020563c:	00002097          	auipc	ra,0x2
    80205640:	f60080e7          	jalr	-160(ra) # 8020759c <ename>
    80205644:	892a                	mv	s2,a0
    80205646:	c935                	beqz	a0,802056ba <sys_openat+0x352>
    elock(ep);
    80205648:	00001097          	auipc	ra,0x1
    8020564c:	7aa080e7          	jalr	1962(ra) # 80206df2 <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    80205650:	10094783          	lbu	a5,256(s2)
    80205654:	8bc1                	andi	a5,a5,16
    80205656:	dbbd                	beqz	a5,802055cc <sys_openat+0x264>
    80205658:	dac42783          	lw	a5,-596(s0)
    8020565c:	dba5                	beqz	a5,802055cc <sys_openat+0x264>
      eunlock(ep);
    8020565e:	854a                	mv	a0,s2
    80205660:	00001097          	auipc	ra,0x1
    80205664:	7c8080e7          	jalr	1992(ra) # 80206e28 <eunlock>
      eput(ep);
    80205668:	854a                	mv	a0,s2
    8020566a:	00002097          	auipc	ra,0x2
    8020566e:	80c080e7          	jalr	-2036(ra) # 80206e76 <eput>
      return -1;
    80205672:	557d                	li	a0,-1
    80205674:	a811                	j	80205688 <sys_openat+0x320>
    etrunc(ep);
    80205676:	854a                	mv	a0,s2
    80205678:	00001097          	auipc	ra,0x1
    8020567c:	710080e7          	jalr	1808(ra) # 80206d88 <etrunc>
    80205680:	bfa5                	j	802055f8 <sys_openat+0x290>
    return -1;
    80205682:	557d                	li	a0,-1
    80205684:	a011                	j	80205688 <sys_openat+0x320>
        return -1;
    80205686:	557d                	li	a0,-1
}
    80205688:	35813083          	ld	ra,856(sp)
    8020568c:	35013403          	ld	s0,848(sp)
    80205690:	34813483          	ld	s1,840(sp)
    80205694:	34013903          	ld	s2,832(sp)
    80205698:	33813983          	ld	s3,824(sp)
    8020569c:	33013a03          	ld	s4,816(sp)
    802056a0:	32813a83          	ld	s5,808(sp)
    802056a4:	36010113          	addi	sp,sp,864
    802056a8:	8082                	ret
    return -1;
    802056aa:	557d                	li	a0,-1
    802056ac:	bff1                	j	80205688 <sys_openat+0x320>
    802056ae:	557d                	li	a0,-1
    802056b0:	bfe1                	j	80205688 <sys_openat+0x320>
      return -1;
    802056b2:	557d                	li	a0,-1
    802056b4:	bfd1                	j	80205688 <sys_openat+0x320>
      return -1;
    802056b6:	557d                	li	a0,-1
    802056b8:	bfc1                	j	80205688 <sys_openat+0x320>
      return -1;
    802056ba:	557d                	li	a0,-1
    802056bc:	b7f1                	j	80205688 <sys_openat+0x320>
      fileclose(f);
    802056be:	854e                	mv	a0,s3
    802056c0:	ffffe097          	auipc	ra,0xffffe
    802056c4:	5da080e7          	jalr	1498(ra) # 80203c9a <fileclose>
    eunlock(ep);
    802056c8:	854a                	mv	a0,s2
    802056ca:	00001097          	auipc	ra,0x1
    802056ce:	75e080e7          	jalr	1886(ra) # 80206e28 <eunlock>
    eput(ep);
    802056d2:	854a                	mv	a0,s2
    802056d4:	00001097          	auipc	ra,0x1
    802056d8:	7a2080e7          	jalr	1954(ra) # 80206e76 <eput>
    return -1;
    802056dc:	557d                	li	a0,-1
    802056de:	b76d                	j	80205688 <sys_openat+0x320>

00000000802056e0 <sys_mkdirat>:


// added by lmq for SYS_mkdirat
uint64
sys_mkdirat(void)
{
    802056e0:	da010113          	addi	sp,sp,-608
    802056e4:	24113c23          	sd	ra,600(sp)
    802056e8:	24813823          	sd	s0,592(sp)
    802056ec:	24913423          	sd	s1,584(sp)
    802056f0:	25213023          	sd	s2,576(sp)
    802056f4:	23313c23          	sd	s3,568(sp)
    802056f8:	23413823          	sd	s4,560(sp)
    802056fc:	23513423          	sd	s5,552(sp)
    80205700:	1480                	addi	s0,sp,608
  int dirfd,omode;
  char des_path[FAT32_MAX_PATH];
  if(argint(0, &dirfd) < 0 || argstr(1,des_path,FAT32_MAX_PATH)<0 || argint(2,&omode)<0)
    80205702:	fbc40593          	addi	a1,s0,-68
    80205706:	4501                	li	a0,0
    80205708:	ffffe097          	auipc	ra,0xffffe
    8020570c:	81a080e7          	jalr	-2022(ra) # 80202f22 <argint>
    80205710:	20054663          	bltz	a0,8020591c <sys_mkdirat+0x23c>
    80205714:	10400613          	li	a2,260
    80205718:	eb040593          	addi	a1,s0,-336
    8020571c:	4505                	li	a0,1
    8020571e:	ffffe097          	auipc	ra,0xffffe
    80205722:	888080e7          	jalr	-1912(ra) # 80202fa6 <argstr>
    80205726:	20054d63          	bltz	a0,80205940 <sys_mkdirat+0x260>
    8020572a:	fb840593          	addi	a1,s0,-72
    8020572e:	4509                	li	a0,2
    80205730:	ffffd097          	auipc	ra,0xffffd
    80205734:	7f2080e7          	jalr	2034(ra) # 80202f22 <argint>
    80205738:	20054663          	bltz	a0,80205944 <sys_mkdirat+0x264>
    return -1;


  // 如果dirfd不为AT_FDCWD 则获得dirfd的路径
  char cur_path[FAT32_MAX_PATH];
  memset(cur_path,0,FAT32_MAX_PATH);
    8020573c:	10400613          	li	a2,260
    80205740:	4581                	li	a1,0
    80205742:	da840513          	addi	a0,s0,-600
    80205746:	ffffb097          	auipc	ra,0xffffb
    8020574a:	01e080e7          	jalr	30(ra) # 80200764 <memset>
  char* s=NULL;
  int len;
  if(dirfd!=AT_FDCWD)
    8020574e:	fbc42703          	lw	a4,-68(s0)
    80205752:	f9c00793          	li	a5,-100
    80205756:	10f70963          	beq	a4,a5,80205868 <sys_mkdirat+0x188>
  {
    struct dirent* de=myproc()->ofile[dirfd]->ep;
    8020575a:	ffffc097          	auipc	ra,0xffffc
    8020575e:	31a080e7          	jalr	794(ra) # 80201a74 <myproc>
    80205762:	fbc42783          	lw	a5,-68(s0)
    80205766:	07e9                	addi	a5,a5,26
    80205768:	078e                	slli	a5,a5,0x3
    8020576a:	97aa                	add	a5,a5,a0
    8020576c:	679c                	ld	a5,8(a5)
    8020576e:	6f84                	ld	s1,24(a5)
    if (de->parent == NULL) {
    80205770:	1204b783          	ld	a5,288(s1)
    80205774:	12078063          	beqz	a5,80205894 <sys_mkdirat+0x1b4>
      s = "/";
    } 
    else {
      s = cur_path + FAT32_MAX_PATH - 1;
      *s = '\0';
    80205778:	ea0405a3          	sb	zero,-341(s0)
      s = cur_path + FAT32_MAX_PATH - 1;
    8020577c:	eab40993          	addi	s3,s0,-341
      while (de->parent) {
        len = strlen(de->filename);
        s -= len;
        if (s <= cur_path)          // can't reach root "/"
    80205780:	da840a13          	addi	s4,s0,-600
          return -1;
        strncpy(s, de->filename, len);
        *--s = '/';
    80205784:	02f00a93          	li	s5,47
        len = strlen(de->filename);
    80205788:	8526                	mv	a0,s1
    8020578a:	ffffb097          	auipc	ra,0xffffb
    8020578e:	162080e7          	jalr	354(ra) # 802008ec <strlen>
    80205792:	862a                	mv	a2,a0
        s -= len;
    80205794:	40a98933          	sub	s2,s3,a0
        if (s <= cur_path)          // can't reach root "/"
    80205798:	1b2a7863          	bgeu	s4,s2,80205948 <sys_mkdirat+0x268>
        strncpy(s, de->filename, len);
    8020579c:	85a6                	mv	a1,s1
    8020579e:	854a                	mv	a0,s2
    802057a0:	ffffb097          	auipc	ra,0xffffb
    802057a4:	0dc080e7          	jalr	220(ra) # 8020087c <strncpy>
        *--s = '/';
    802057a8:	fff90993          	addi	s3,s2,-1
    802057ac:	ff590fa3          	sb	s5,-1(s2)
        de = de->parent;
    802057b0:	1204b483          	ld	s1,288(s1)
      while (de->parent) {
    802057b4:	1204b783          	ld	a5,288(s1)
    802057b8:	fbe1                	bnez	a5,80205788 <sys_mkdirat+0xa8>
      }
    }
    memset(cur_path,0,FAT32_MAX_PATH);
    802057ba:	10400613          	li	a2,260
    802057be:	4581                	li	a1,0
    802057c0:	da840493          	addi	s1,s0,-600
    802057c4:	8526                	mv	a0,s1
    802057c6:	ffffb097          	auipc	ra,0xffffb
    802057ca:	f9e080e7          	jalr	-98(ra) # 80200764 <memset>
    strncpy(cur_path,s,strlen(s));
    802057ce:	854e                	mv	a0,s3
    802057d0:	ffffb097          	auipc	ra,0xffffb
    802057d4:	11c080e7          	jalr	284(ra) # 802008ec <strlen>
    802057d8:	862a                	mv	a2,a0
    802057da:	85ce                	mv	a1,s3
    802057dc:	8526                	mv	a0,s1
    802057de:	ffffb097          	auipc	ra,0xffffb
    802057e2:	09e080e7          	jalr	158(ra) # 8020087c <strncpy>
    if(des_path[0]!='/')
    802057e6:	eb044783          	lbu	a5,-336(s0)
    802057ea:	02f00713          	li	a4,47
    802057ee:	06e78d63          	beq	a5,a4,80205868 <sys_mkdirat+0x188>
    {
      if(des_path[0]=='.' && des_path[1]=='/')
    802057f2:	02e00713          	li	a4,46
    802057f6:	0ae78463          	beq	a5,a4,8020589e <sys_mkdirat+0x1be>
      {
        panic("mkdirat not support ..\n");
      }
      else
      {
        cur_path[strlen(cur_path)]='/';
    802057fa:	da840493          	addi	s1,s0,-600
    802057fe:	8526                	mv	a0,s1
    80205800:	ffffb097          	auipc	ra,0xffffb
    80205804:	0ec080e7          	jalr	236(ra) # 802008ec <strlen>
    80205808:	fc040793          	addi	a5,s0,-64
    8020580c:	953e                	add	a0,a0,a5
    8020580e:	02f00793          	li	a5,47
    80205812:	def50423          	sb	a5,-536(a0)
        strncpy(cur_path+strlen(cur_path),des_path,strlen(des_path));
    80205816:	8526                	mv	a0,s1
    80205818:	ffffb097          	auipc	ra,0xffffb
    8020581c:	0d4080e7          	jalr	212(ra) # 802008ec <strlen>
    80205820:	89aa                	mv	s3,a0
    80205822:	eb040913          	addi	s2,s0,-336
    80205826:	854a                	mv	a0,s2
    80205828:	ffffb097          	auipc	ra,0xffffb
    8020582c:	0c4080e7          	jalr	196(ra) # 802008ec <strlen>
    80205830:	862a                	mv	a2,a0
    80205832:	85ca                	mv	a1,s2
    80205834:	01348533          	add	a0,s1,s3
    80205838:	ffffb097          	auipc	ra,0xffffb
    8020583c:	044080e7          	jalr	68(ra) # 8020087c <strncpy>
        memset(des_path,0,FAT32_MAX_PATH);
    80205840:	10400613          	li	a2,260
    80205844:	4581                	li	a1,0
    80205846:	854a                	mv	a0,s2
    80205848:	ffffb097          	auipc	ra,0xffffb
    8020584c:	f1c080e7          	jalr	-228(ra) # 80200764 <memset>
        strncpy(des_path,cur_path,strlen(cur_path));
    80205850:	8526                	mv	a0,s1
    80205852:	ffffb097          	auipc	ra,0xffffb
    80205856:	09a080e7          	jalr	154(ra) # 802008ec <strlen>
    8020585a:	862a                	mv	a2,a0
    8020585c:	85a6                	mv	a1,s1
    8020585e:	854a                	mv	a0,s2
    80205860:	ffffb097          	auipc	ra,0xffffb
    80205864:	01c080e7          	jalr	28(ra) # 8020087c <strncpy>
    }
    
  }

  struct dirent* ep;
  if((ep = create(des_path, T_DIR, omode)) == 0)
    80205868:	fb842603          	lw	a2,-72(s0)
    8020586c:	4585                	li	a1,1
    8020586e:	eb040513          	addi	a0,s0,-336
    80205872:	fffff097          	auipc	ra,0xfffff
    80205876:	fde080e7          	jalr	-34(ra) # 80204850 <create>
    8020587a:	84aa                	mv	s1,a0
    8020587c:	c961                	beqz	a0,8020594c <sys_mkdirat+0x26c>
  {
    return -1;
  }

  eunlock(ep);
    8020587e:	00001097          	auipc	ra,0x1
    80205882:	5aa080e7          	jalr	1450(ra) # 80206e28 <eunlock>
  eput(ep);
    80205886:	8526                	mv	a0,s1
    80205888:	00001097          	auipc	ra,0x1
    8020588c:	5ee080e7          	jalr	1518(ra) # 80206e76 <eput>
  return 0;
    80205890:	4501                	li	a0,0
    80205892:	a071                	j	8020591e <sys_mkdirat+0x23e>
      s = "/";
    80205894:	00005997          	auipc	s3,0x5
    80205898:	d9c98993          	addi	s3,s3,-612 # 8020a630 <digits+0x2b0>
    8020589c:	bf39                	j	802057ba <sys_mkdirat+0xda>
      if(des_path[0]=='.' && des_path[1]=='/')
    8020589e:	eb144783          	lbu	a5,-335(s0)
    802058a2:	02f00713          	li	a4,47
    802058a6:	00e78e63          	beq	a5,a4,802058c2 <sys_mkdirat+0x1e2>
      else if(des_path[0]=='.' && des_path[1]=='.')
    802058aa:	02e00713          	li	a4,46
    802058ae:	f4e796e3          	bne	a5,a4,802057fa <sys_mkdirat+0x11a>
        panic("mkdirat not support ..\n");
    802058b2:	00005517          	auipc	a0,0x5
    802058b6:	37e50513          	addi	a0,a0,894 # 8020ac30 <digits+0x8b0>
    802058ba:	ffffb097          	auipc	ra,0xffffb
    802058be:	888080e7          	jalr	-1912(ra) # 80200142 <panic>
        strncpy(cur_path+strlen(cur_path),des_path+1,strlen(des_path+1));
    802058c2:	8926                	mv	s2,s1
    802058c4:	8526                	mv	a0,s1
    802058c6:	ffffb097          	auipc	ra,0xffffb
    802058ca:	026080e7          	jalr	38(ra) # 802008ec <strlen>
    802058ce:	84aa                	mv	s1,a0
    802058d0:	eb140993          	addi	s3,s0,-335
    802058d4:	854e                	mv	a0,s3
    802058d6:	ffffb097          	auipc	ra,0xffffb
    802058da:	016080e7          	jalr	22(ra) # 802008ec <strlen>
    802058de:	862a                	mv	a2,a0
    802058e0:	85ce                	mv	a1,s3
    802058e2:	00990533          	add	a0,s2,s1
    802058e6:	ffffb097          	auipc	ra,0xffffb
    802058ea:	f96080e7          	jalr	-106(ra) # 8020087c <strncpy>
        memset(des_path,0,FAT32_MAX_PATH);
    802058ee:	10400613          	li	a2,260
    802058f2:	4581                	li	a1,0
    802058f4:	eb040493          	addi	s1,s0,-336
    802058f8:	8526                	mv	a0,s1
    802058fa:	ffffb097          	auipc	ra,0xffffb
    802058fe:	e6a080e7          	jalr	-406(ra) # 80200764 <memset>
        strncpy(des_path,cur_path,strlen(cur_path));
    80205902:	854a                	mv	a0,s2
    80205904:	ffffb097          	auipc	ra,0xffffb
    80205908:	fe8080e7          	jalr	-24(ra) # 802008ec <strlen>
    8020590c:	862a                	mv	a2,a0
    8020590e:	85ca                	mv	a1,s2
    80205910:	8526                	mv	a0,s1
    80205912:	ffffb097          	auipc	ra,0xffffb
    80205916:	f6a080e7          	jalr	-150(ra) # 8020087c <strncpy>
    8020591a:	b7b9                	j	80205868 <sys_mkdirat+0x188>
    return -1;
    8020591c:	557d                	li	a0,-1
}
    8020591e:	25813083          	ld	ra,600(sp)
    80205922:	25013403          	ld	s0,592(sp)
    80205926:	24813483          	ld	s1,584(sp)
    8020592a:	24013903          	ld	s2,576(sp)
    8020592e:	23813983          	ld	s3,568(sp)
    80205932:	23013a03          	ld	s4,560(sp)
    80205936:	22813a83          	ld	s5,552(sp)
    8020593a:	26010113          	addi	sp,sp,608
    8020593e:	8082                	ret
    return -1;
    80205940:	557d                	li	a0,-1
    80205942:	bff1                	j	8020591e <sys_mkdirat+0x23e>
    80205944:	557d                	li	a0,-1
    80205946:	bfe1                	j	8020591e <sys_mkdirat+0x23e>
          return -1;
    80205948:	557d                	li	a0,-1
    8020594a:	bfd1                	j	8020591e <sys_mkdirat+0x23e>
    return -1;
    8020594c:	557d                	li	a0,-1
    8020594e:	bfc1                	j	8020591e <sys_mkdirat+0x23e>

0000000080205950 <sys_dup3>:

// added by lmq for SYS_dup3
uint64
sys_dup3(void)
{
    80205950:	7179                	addi	sp,sp,-48
    80205952:	f406                	sd	ra,40(sp)
    80205954:	f022                	sd	s0,32(sp)
    80205956:	ec26                	sd	s1,24(sp)
    80205958:	1800                	addi	s0,sp,48
  struct file *f;
  int new_fd;
  struct proc* p=myproc();
    8020595a:	ffffc097          	auipc	ra,0xffffc
    8020595e:	11a080e7          	jalr	282(ra) # 80201a74 <myproc>
    80205962:	84aa                	mv	s1,a0

  if(argfd(0, 0, &f) < 0 || argint(1,&new_fd)<0)
    80205964:	fd840613          	addi	a2,s0,-40
    80205968:	4581                	li	a1,0
    8020596a:	4501                	li	a0,0
    8020596c:	fffff097          	auipc	ra,0xfffff
    80205970:	e36080e7          	jalr	-458(ra) # 802047a2 <argfd>
    return -1;
    80205974:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(1,&new_fd)<0)
    80205976:	02054263          	bltz	a0,8020599a <sys_dup3+0x4a>
    8020597a:	fd440593          	addi	a1,s0,-44
    8020597e:	4505                	li	a0,1
    80205980:	ffffd097          	auipc	ra,0xffffd
    80205984:	5a2080e7          	jalr	1442(ra) # 80202f22 <argint>
    80205988:	02054963          	bltz	a0,802059ba <sys_dup3+0x6a>
  if(p->ofile[new_fd]!=0)        // 文件描述符[new_fd]已被占用
    8020598c:	fd442503          	lw	a0,-44(s0)
    80205990:	050e                	slli	a0,a0,0x3
    80205992:	94aa                	add	s1,s1,a0
    80205994:	6cf8                	ld	a4,216(s1)
  {
    return -1;
    80205996:	57fd                	li	a5,-1
  if(p->ofile[new_fd]!=0)        // 文件描述符[new_fd]已被占用
    80205998:	c719                	beqz	a4,802059a6 <sys_dup3+0x56>
  }
  p->ofile[new_fd] = f;
  filedup(f);
  return new_fd;
}
    8020599a:	853e                	mv	a0,a5
    8020599c:	70a2                	ld	ra,40(sp)
    8020599e:	7402                	ld	s0,32(sp)
    802059a0:	64e2                	ld	s1,24(sp)
    802059a2:	6145                	addi	sp,sp,48
    802059a4:	8082                	ret
  p->ofile[new_fd] = f;
    802059a6:	fd843503          	ld	a0,-40(s0)
    802059aa:	ece8                	sd	a0,216(s1)
  filedup(f);
    802059ac:	ffffe097          	auipc	ra,0xffffe
    802059b0:	29c080e7          	jalr	668(ra) # 80203c48 <filedup>
  return new_fd;
    802059b4:	fd442783          	lw	a5,-44(s0)
    802059b8:	b7cd                	j	8020599a <sys_dup3+0x4a>
    return -1;
    802059ba:	57fd                	li	a5,-1
    802059bc:	bff9                	j	8020599a <sys_dup3+0x4a>

00000000802059be <sys_getdents64>:
  unsigned char   d_type;	    // 文件类型    
  char            d_name[];	  // 文件名
};
uint64 
sys_getdents64(void)
{
    802059be:	7139                	addi	sp,sp,-64
    802059c0:	fc06                	sd	ra,56(sp)
    802059c2:	f822                	sd	s0,48(sp)
    802059c4:	f426                	sd	s1,40(sp)
    802059c6:	0080                	addi	s0,sp,64
  int fd,len;
  struct file* f;
  struct linux_dirent64* dirp64;

  if(argfd(0,&fd,&f)<0 || argaddr(1,(uint64*)&dirp64)<0 || argint(2,&len))
    802059c8:	fd040613          	addi	a2,s0,-48
    802059cc:	fdc40593          	addi	a1,s0,-36
    802059d0:	4501                	li	a0,0
    802059d2:	fffff097          	auipc	ra,0xfffff
    802059d6:	dd0080e7          	jalr	-560(ra) # 802047a2 <argfd>
  {
    return -1;
    802059da:	54fd                	li	s1,-1
  if(argfd(0,&fd,&f)<0 || argaddr(1,(uint64*)&dirp64)<0 || argint(2,&len))
    802059dc:	06054763          	bltz	a0,80205a4a <sys_getdents64+0x8c>
    802059e0:	fc840593          	addi	a1,s0,-56
    802059e4:	4505                	li	a0,1
    802059e6:	ffffd097          	auipc	ra,0xffffd
    802059ea:	59e080e7          	jalr	1438(ra) # 80202f84 <argaddr>
    802059ee:	04054e63          	bltz	a0,80205a4a <sys_getdents64+0x8c>
    802059f2:	fd840593          	addi	a1,s0,-40
    802059f6:	4509                	li	a0,2
    802059f8:	ffffd097          	auipc	ra,0xffffd
    802059fc:	52a080e7          	jalr	1322(ra) # 80202f22 <argint>
    80205a00:	e529                	bnez	a0,80205a4a <sys_getdents64+0x8c>
  }
  int filename_len=strlen(f->ep->filename);
    80205a02:	fd043783          	ld	a5,-48(s0)
    80205a06:	6f88                	ld	a0,24(a5)
    80205a08:	ffffb097          	auipc	ra,0xffffb
    80205a0c:	ee4080e7          	jalr	-284(ra) # 802008ec <strlen>
    80205a10:	862a                	mv	a2,a0
  if(filename_len>len)
    80205a12:	fd842783          	lw	a5,-40(s0)
    80205a16:	02a7ca63          	blt	a5,a0,80205a4a <sys_getdents64+0x8c>
  {
    return -1;
  }
  if(copyout2((uint64)dirp64->d_name, f->ep->filename, filename_len) < 0 ||
    80205a1a:	84aa                	mv	s1,a0
    80205a1c:	fd043783          	ld	a5,-48(s0)
    80205a20:	6f8c                	ld	a1,24(a5)
    80205a22:	fc843503          	ld	a0,-56(s0)
    80205a26:	054d                	addi	a0,a0,19
    80205a28:	ffffc097          	auipc	ra,0xffffc
    80205a2c:	970080e7          	jalr	-1680(ra) # 80201398 <copyout2>
    80205a30:	02054563          	bltz	a0,80205a5a <sys_getdents64+0x9c>
    copyout2((uint64)&(dirp64->d_type),(char*)&f->type,sizeof(f->type) < 0 ))
    80205a34:	4601                	li	a2,0
    80205a36:	fd043583          	ld	a1,-48(s0)
    80205a3a:	fc843503          	ld	a0,-56(s0)
    80205a3e:	0549                	addi	a0,a0,18
    80205a40:	ffffc097          	auipc	ra,0xffffc
    80205a44:	958080e7          	jalr	-1704(ra) # 80201398 <copyout2>
  if(copyout2((uint64)dirp64->d_name, f->ep->filename, filename_len) < 0 ||
    80205a48:	e519                	bnez	a0,80205a56 <sys_getdents64+0x98>
    return -1;

  return filename_len;
}
    80205a4a:	8526                	mv	a0,s1
    80205a4c:	70e2                	ld	ra,56(sp)
    80205a4e:	7442                	ld	s0,48(sp)
    80205a50:	74a2                	ld	s1,40(sp)
    80205a52:	6121                	addi	sp,sp,64
    80205a54:	8082                	ret
    return -1;
    80205a56:	54fd                	li	s1,-1
    80205a58:	bfcd                	j	80205a4a <sys_getdents64+0x8c>
    80205a5a:	54fd                	li	s1,-1
    80205a5c:	b7fd                	j	80205a4a <sys_getdents64+0x8c>

0000000080205a5e <sys_fstat_cscc>:
        long st_ctime_nsec;
        unsigned __unused[2];
};
uint64
sys_fstat_cscc(void)
{
    80205a5e:	7135                	addi	sp,sp,-160
    80205a60:	ed06                	sd	ra,152(sp)
    80205a62:	e922                	sd	s0,144(sp)
    80205a64:	1100                	addi	s0,sp,160
  struct file* f;
  uint64 addr;
  if(argfd(0,0,&f)<0 || argaddr(1,&addr)<0)
    80205a66:	fe840613          	addi	a2,s0,-24
    80205a6a:	4581                	li	a1,0
    80205a6c:	4501                	li	a0,0
    80205a6e:	fffff097          	auipc	ra,0xfffff
    80205a72:	d34080e7          	jalr	-716(ra) # 802047a2 <argfd>
    80205a76:	87aa                	mv	a5,a0
  {
    return -1;
    80205a78:	557d                	li	a0,-1
  if(argfd(0,0,&f)<0 || argaddr(1,&addr)<0)
    80205a7a:	0207c263          	bltz	a5,80205a9e <sys_fstat_cscc+0x40>
    80205a7e:	fe040593          	addi	a1,s0,-32
    80205a82:	4505                	li	a0,1
    80205a84:	ffffd097          	auipc	ra,0xffffd
    80205a88:	500080e7          	jalr	1280(ra) # 80202f84 <argaddr>
    80205a8c:	08054d63          	bltz	a0,80205b26 <sys_fstat_cscc+0xc8>
  }

  struct kstat st;
  if(f->type!=FD_ENTRY)
    80205a90:	fe843783          	ld	a5,-24(s0)
    80205a94:	4394                	lw	a3,0(a5)
    80205a96:	4709                	li	a4,2
    return -1;
    80205a98:	557d                	li	a0,-1
  if(f->type!=FD_ENTRY)
    80205a9a:	00e68663          	beq	a3,a4,80205aa6 <sys_fstat_cscc+0x48>
  st.st_ctime_sec=0;
  eunlock(f->ep);
  if((copyout2(addr,(char*)&st,sizeof(struct kstat)))<0)
    return -1;
  return 0;
    80205a9e:	60ea                	ld	ra,152(sp)
    80205aa0:	644a                	ld	s0,144(sp)
    80205aa2:	610d                	addi	sp,sp,160
    80205aa4:	8082                	ret
  elock(f->ep);
    80205aa6:	6f88                	ld	a0,24(a5)
    80205aa8:	00001097          	auipc	ra,0x1
    80205aac:	34a080e7          	jalr	842(ra) # 80206df2 <elock>
  st.st_dev=f->ep->dev;
    80205ab0:	fe843783          	ld	a5,-24(s0)
    80205ab4:	6f98                	ld	a4,24(a5)
    80205ab6:	11474703          	lbu	a4,276(a4)
    80205aba:	f6e43023          	sd	a4,-160(s0)
  st.st_ino=0;
    80205abe:	f6043423          	sd	zero,-152(s0)
  st.st_mode=f->type;
    80205ac2:	4398                	lw	a4,0(a5)
    80205ac4:	f6e42823          	sw	a4,-144(s0)
  st.st_nlink=f->ref;
    80205ac8:	43d8                	lw	a4,4(a5)
    80205aca:	f6e42a23          	sw	a4,-140(s0)
  st.st_gid=0;
    80205ace:	f6042e23          	sw	zero,-132(s0)
  st.st_uid=0;
    80205ad2:	f6042c23          	sw	zero,-136(s0)
  st.st_rdev=0;
    80205ad6:	f8043023          	sd	zero,-128(s0)
  st.st_size=f->ep->file_size;
    80205ada:	6f98                	ld	a4,24(a5)
    80205adc:	10876703          	lwu	a4,264(a4)
    80205ae0:	f8e43823          	sd	a4,-112(s0)
  st.st_blocks=0;
    80205ae4:	fa043023          	sd	zero,-96(s0)
  st.st_blksize=0;
    80205ae8:	f8042c23          	sw	zero,-104(s0)
  st.st_atime_sec=0;
    80205aec:	fa043423          	sd	zero,-88(s0)
  st.st_atime_nsec=0;
    80205af0:	fa043823          	sd	zero,-80(s0)
  st.st_mtime_nsec=0;
    80205af4:	fc043023          	sd	zero,-64(s0)
  st.st_mtime_sec=0;
    80205af8:	fa043c23          	sd	zero,-72(s0)
  st.st_ctime_nsec=0;
    80205afc:	fc043823          	sd	zero,-48(s0)
  st.st_ctime_sec=0;
    80205b00:	fc043423          	sd	zero,-56(s0)
  eunlock(f->ep);
    80205b04:	6f88                	ld	a0,24(a5)
    80205b06:	00001097          	auipc	ra,0x1
    80205b0a:	322080e7          	jalr	802(ra) # 80206e28 <eunlock>
  if((copyout2(addr,(char*)&st,sizeof(struct kstat)))<0)
    80205b0e:	08000613          	li	a2,128
    80205b12:	f6040593          	addi	a1,s0,-160
    80205b16:	fe043503          	ld	a0,-32(s0)
    80205b1a:	ffffc097          	auipc	ra,0xffffc
    80205b1e:	87e080e7          	jalr	-1922(ra) # 80201398 <copyout2>
    80205b22:	957d                	srai	a0,a0,0x3f
    80205b24:	bfad                	j	80205a9e <sys_fstat_cscc+0x40>
    return -1;
    80205b26:	557d                	li	a0,-1
    80205b28:	bf9d                	j	80205a9e <sys_fstat_cscc+0x40>
    80205b2a:	0000                	unimp
    80205b2c:	0000                	unimp
	...

0000000080205b30 <kernelvec>:
    80205b30:	7111                	addi	sp,sp,-256
    80205b32:	e006                	sd	ra,0(sp)
    80205b34:	e40a                	sd	sp,8(sp)
    80205b36:	e80e                	sd	gp,16(sp)
    80205b38:	ec12                	sd	tp,24(sp)
    80205b3a:	f016                	sd	t0,32(sp)
    80205b3c:	f41a                	sd	t1,40(sp)
    80205b3e:	f81e                	sd	t2,48(sp)
    80205b40:	fc22                	sd	s0,56(sp)
    80205b42:	e0a6                	sd	s1,64(sp)
    80205b44:	e4aa                	sd	a0,72(sp)
    80205b46:	e8ae                	sd	a1,80(sp)
    80205b48:	ecb2                	sd	a2,88(sp)
    80205b4a:	f0b6                	sd	a3,96(sp)
    80205b4c:	f4ba                	sd	a4,104(sp)
    80205b4e:	f8be                	sd	a5,112(sp)
    80205b50:	fcc2                	sd	a6,120(sp)
    80205b52:	e146                	sd	a7,128(sp)
    80205b54:	e54a                	sd	s2,136(sp)
    80205b56:	e94e                	sd	s3,144(sp)
    80205b58:	ed52                	sd	s4,152(sp)
    80205b5a:	f156                	sd	s5,160(sp)
    80205b5c:	f55a                	sd	s6,168(sp)
    80205b5e:	f95e                	sd	s7,176(sp)
    80205b60:	fd62                	sd	s8,184(sp)
    80205b62:	e1e6                	sd	s9,192(sp)
    80205b64:	e5ea                	sd	s10,200(sp)
    80205b66:	e9ee                	sd	s11,208(sp)
    80205b68:	edf2                	sd	t3,216(sp)
    80205b6a:	f1f6                	sd	t4,224(sp)
    80205b6c:	f5fa                	sd	t5,232(sp)
    80205b6e:	f9fe                	sd	t6,240(sp)
    80205b70:	f35fc0ef          	jal	ra,80202aa4 <kerneltrap>
    80205b74:	6082                	ld	ra,0(sp)
    80205b76:	6122                	ld	sp,8(sp)
    80205b78:	61c2                	ld	gp,16(sp)
    80205b7a:	7282                	ld	t0,32(sp)
    80205b7c:	7322                	ld	t1,40(sp)
    80205b7e:	73c2                	ld	t2,48(sp)
    80205b80:	7462                	ld	s0,56(sp)
    80205b82:	6486                	ld	s1,64(sp)
    80205b84:	6526                	ld	a0,72(sp)
    80205b86:	65c6                	ld	a1,80(sp)
    80205b88:	6666                	ld	a2,88(sp)
    80205b8a:	7686                	ld	a3,96(sp)
    80205b8c:	7726                	ld	a4,104(sp)
    80205b8e:	77c6                	ld	a5,112(sp)
    80205b90:	7866                	ld	a6,120(sp)
    80205b92:	688a                	ld	a7,128(sp)
    80205b94:	692a                	ld	s2,136(sp)
    80205b96:	69ca                	ld	s3,144(sp)
    80205b98:	6a6a                	ld	s4,152(sp)
    80205b9a:	7a8a                	ld	s5,160(sp)
    80205b9c:	7b2a                	ld	s6,168(sp)
    80205b9e:	7bca                	ld	s7,176(sp)
    80205ba0:	7c6a                	ld	s8,184(sp)
    80205ba2:	6c8e                	ld	s9,192(sp)
    80205ba4:	6d2e                	ld	s10,200(sp)
    80205ba6:	6dce                	ld	s11,208(sp)
    80205ba8:	6e6e                	ld	t3,216(sp)
    80205baa:	7e8e                	ld	t4,224(sp)
    80205bac:	7f2e                	ld	t5,232(sp)
    80205bae:	7fce                	ld	t6,240(sp)
    80205bb0:	6111                	addi	sp,sp,256
    80205bb2:	10200073          	sret
	...

0000000080205bbe <timerinit>:
#include "include/proc.h"

struct spinlock tickslock;
uint ticks;

void timerinit() {
    80205bbe:	1141                	addi	sp,sp,-16
    80205bc0:	e406                	sd	ra,8(sp)
    80205bc2:	e022                	sd	s0,0(sp)
    80205bc4:	0800                	addi	s0,sp,16
    initlock(&tickslock, "time");
    80205bc6:	00005597          	auipc	a1,0x5
    80205bca:	08258593          	addi	a1,a1,130 # 8020ac48 <digits+0x8c8>
    80205bce:	00026517          	auipc	a0,0x26
    80205bd2:	b9a50513          	addi	a0,a0,-1126 # 8022b768 <tickslock>
    80205bd6:	ffffb097          	auipc	ra,0xffffb
    80205bda:	aae080e7          	jalr	-1362(ra) # 80200684 <initlock>
    #ifdef DEBUG
    printf("timerinit\n");
    #endif
}
    80205bde:	60a2                	ld	ra,8(sp)
    80205be0:	6402                	ld	s0,0(sp)
    80205be2:	0141                	addi	sp,sp,16
    80205be4:	8082                	ret

0000000080205be6 <set_next_timeout>:

void
set_next_timeout() {
    80205be6:	1141                	addi	sp,sp,-16
    80205be8:	e422                	sd	s0,8(sp)
    80205bea:	0800                	addi	s0,sp,16
  asm volatile("rdtime %0" : "=r" (x) );
    80205bec:	c0102573          	rdtime	a0
    // if comment the `printf` line below
    // the timer will not work.

    // this bug seems to disappear automatically
    // printf("");
    sbi_set_timer(r_time() + INTERVAL);
    80205bf0:	001dc7b7          	lui	a5,0x1dc
    80205bf4:	13078793          	addi	a5,a5,304 # 1dc130 <_entry-0x80023ed0>
    80205bf8:	953e                	add	a0,a0,a5
	SBI_CALL_1(SBI_SET_TIMER, stime_value);
    80205bfa:	4581                	li	a1,0
    80205bfc:	4601                	li	a2,0
    80205bfe:	4681                	li	a3,0
    80205c00:	4881                	li	a7,0
    80205c02:	00000073          	ecall
}
    80205c06:	6422                	ld	s0,8(sp)
    80205c08:	0141                	addi	sp,sp,16
    80205c0a:	8082                	ret

0000000080205c0c <timer_tick>:

void timer_tick() {
    80205c0c:	1101                	addi	sp,sp,-32
    80205c0e:	ec06                	sd	ra,24(sp)
    80205c10:	e822                	sd	s0,16(sp)
    80205c12:	e426                	sd	s1,8(sp)
    80205c14:	1000                	addi	s0,sp,32
    acquire(&tickslock);
    80205c16:	00026497          	auipc	s1,0x26
    80205c1a:	b5248493          	addi	s1,s1,-1198 # 8022b768 <tickslock>
    80205c1e:	8526                	mv	a0,s1
    80205c20:	ffffb097          	auipc	ra,0xffffb
    80205c24:	aa8080e7          	jalr	-1368(ra) # 802006c8 <acquire>
    ticks++;
    80205c28:	4c9c                	lw	a5,24(s1)
    80205c2a:	2785                	addiw	a5,a5,1
    80205c2c:	cc9c                	sw	a5,24(s1)
    wakeup(&ticks);
    80205c2e:	00026517          	auipc	a0,0x26
    80205c32:	b5250513          	addi	a0,a0,-1198 # 8022b780 <ticks>
    80205c36:	ffffd097          	auipc	ra,0xffffd
    80205c3a:	81a080e7          	jalr	-2022(ra) # 80202450 <wakeup>
    release(&tickslock);
    80205c3e:	8526                	mv	a0,s1
    80205c40:	ffffb097          	auipc	ra,0xffffb
    80205c44:	adc080e7          	jalr	-1316(ra) # 8020071c <release>
    set_next_timeout();
    80205c48:	00000097          	auipc	ra,0x0
    80205c4c:	f9e080e7          	jalr	-98(ra) # 80205be6 <set_next_timeout>
}
    80205c50:	60e2                	ld	ra,24(sp)
    80205c52:	6442                	ld	s0,16(sp)
    80205c54:	64a2                	ld	s1,8(sp)
    80205c56:	6105                	addi	sp,sp,32
    80205c58:	8082                	ret

0000000080205c5a <disk_init>:
#else
#include "include/virtio.h"
#endif 

void disk_init(void)
{
    80205c5a:	1141                	addi	sp,sp,-16
    80205c5c:	e406                	sd	ra,8(sp)
    80205c5e:	e022                	sd	s0,0(sp)
    80205c60:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_init();
    80205c62:	00002097          	auipc	ra,0x2
    80205c66:	e82080e7          	jalr	-382(ra) # 80207ae4 <virtio_disk_init>
	#else 
	sdcard_init();
    #endif
}
    80205c6a:	60a2                	ld	ra,8(sp)
    80205c6c:	6402                	ld	s0,0(sp)
    80205c6e:	0141                	addi	sp,sp,16
    80205c70:	8082                	ret

0000000080205c72 <disk_read>:

void disk_read(struct buf *b)
{
    80205c72:	1141                	addi	sp,sp,-16
    80205c74:	e406                	sd	ra,8(sp)
    80205c76:	e022                	sd	s0,0(sp)
    80205c78:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 0);
    80205c7a:	4581                	li	a1,0
    80205c7c:	00002097          	auipc	ra,0x2
    80205c80:	ff0080e7          	jalr	-16(ra) # 80207c6c <virtio_disk_rw>
    #else 
	sdcard_read_sector(b->data, b->sectorno);
	#endif
}
    80205c84:	60a2                	ld	ra,8(sp)
    80205c86:	6402                	ld	s0,0(sp)
    80205c88:	0141                	addi	sp,sp,16
    80205c8a:	8082                	ret

0000000080205c8c <disk_write>:

void disk_write(struct buf *b)
{
    80205c8c:	1141                	addi	sp,sp,-16
    80205c8e:	e406                	sd	ra,8(sp)
    80205c90:	e022                	sd	s0,0(sp)
    80205c92:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 1);
    80205c94:	4585                	li	a1,1
    80205c96:	00002097          	auipc	ra,0x2
    80205c9a:	fd6080e7          	jalr	-42(ra) # 80207c6c <virtio_disk_rw>
    #else 
	sdcard_write_sector(b->data, b->sectorno);
	#endif
}
    80205c9e:	60a2                	ld	ra,8(sp)
    80205ca0:	6402                	ld	s0,0(sp)
    80205ca2:	0141                	addi	sp,sp,16
    80205ca4:	8082                	ret

0000000080205ca6 <disk_intr>:

void disk_intr(void)
{
    80205ca6:	1141                	addi	sp,sp,-16
    80205ca8:	e406                	sd	ra,8(sp)
    80205caa:	e022                	sd	s0,0(sp)
    80205cac:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_intr();
    80205cae:	00002097          	auipc	ra,0x2
    80205cb2:	26c080e7          	jalr	620(ra) # 80207f1a <virtio_disk_intr>
    #else 
    dmac_intr(DMAC_CHANNEL0);
    #endif
}
    80205cb6:	60a2                	ld	ra,8(sp)
    80205cb8:	6402                	ld	s0,0(sp)
    80205cba:	0141                	addi	sp,sp,16
    80205cbc:	8082                	ret

0000000080205cbe <read_fat>:
/**
 * Read the FAT table content corresponded to the given cluster number.
 * @param   cluster     the number of cluster which you want to read its content in FAT table
 */
static uint32 read_fat(uint32 cluster)
{
    80205cbe:	1101                	addi	sp,sp,-32
    80205cc0:	ec06                	sd	ra,24(sp)
    80205cc2:	e822                	sd	s0,16(sp)
    80205cc4:	e426                	sd	s1,8(sp)
    80205cc6:	e04a                	sd	s2,0(sp)
    80205cc8:	1000                	addi	s0,sp,32
    if (cluster >= FAT32_EOC) {
    80205cca:	100007b7          	lui	a5,0x10000
    80205cce:	17dd                	addi	a5,a5,-9
        return cluster;
    80205cd0:	84aa                	mv	s1,a0
    if (cluster >= FAT32_EOC) {
    80205cd2:	00a7ea63          	bltu	a5,a0,80205ce6 <read_fat+0x28>
    }
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205cd6:	00026797          	auipc	a5,0x26
    80205cda:	aba7a783          	lw	a5,-1350(a5) # 8022b790 <fat+0x8>
    80205cde:	2785                	addiw	a5,a5,1
        return 0;
    80205ce0:	4481                	li	s1,0
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205ce2:	00a7f963          	bgeu	a5,a0,80205cf4 <read_fat+0x36>
    // here should be a cache layer for FAT table, but not implemented yet.
    struct buf *b = bread(0, fat_sec);
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    brelse(b);
    return next_clus;
}
    80205ce6:	8526                	mv	a0,s1
    80205ce8:	60e2                	ld	ra,24(sp)
    80205cea:	6442                	ld	s0,16(sp)
    80205cec:	64a2                	ld	s1,8(sp)
    80205cee:	6902                	ld	s2,0(sp)
    80205cf0:	6105                	addi	sp,sp,32
    80205cf2:	8082                	ret
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80205cf4:	0025149b          	slliw	s1,a0,0x2
    80205cf8:	00026917          	auipc	s2,0x26
    80205cfc:	a9090913          	addi	s2,s2,-1392 # 8022b788 <fat>
    80205d00:	01095783          	lhu	a5,16(s2)
    80205d04:	02f4d7bb          	divuw	a5,s1,a5
    80205d08:	01495583          	lhu	a1,20(s2)
    struct buf *b = bread(0, fat_sec);
    80205d0c:	9dbd                	addw	a1,a1,a5
    80205d0e:	4501                	li	a0,0
    80205d10:	ffffe097          	auipc	ra,0xffffe
    80205d14:	b0a080e7          	jalr	-1270(ra) # 8020381a <bread>
    return (cluster << 2) % fat.bpb.byts_per_sec;
    80205d18:	01095783          	lhu	a5,16(s2)
    80205d1c:	02f4f4bb          	remuw	s1,s1,a5
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    80205d20:	1482                	slli	s1,s1,0x20
    80205d22:	9081                	srli	s1,s1,0x20
    80205d24:	94aa                	add	s1,s1,a0
    80205d26:	4ca4                	lw	s1,88(s1)
    brelse(b);
    80205d28:	ffffe097          	auipc	ra,0xffffe
    80205d2c:	c1e080e7          	jalr	-994(ra) # 80203946 <brelse>
    return next_clus;
    80205d30:	bf5d                	j	80205ce6 <read_fat+0x28>

0000000080205d32 <alloc_clus>:
        brelse(b);
    }
}

static uint32 alloc_clus(uint8 dev)
{
    80205d32:	711d                	addi	sp,sp,-96
    80205d34:	ec86                	sd	ra,88(sp)
    80205d36:	e8a2                	sd	s0,80(sp)
    80205d38:	e4a6                	sd	s1,72(sp)
    80205d3a:	e0ca                	sd	s2,64(sp)
    80205d3c:	fc4e                	sd	s3,56(sp)
    80205d3e:	f852                	sd	s4,48(sp)
    80205d40:	f456                	sd	s5,40(sp)
    80205d42:	f05a                	sd	s6,32(sp)
    80205d44:	ec5e                	sd	s7,24(sp)
    80205d46:	e862                	sd	s8,16(sp)
    80205d48:	e466                	sd	s9,8(sp)
    80205d4a:	1080                	addi	s0,sp,96
    // should we keep a free cluster list? instead of searching fat every time.
    struct buf *b;
    uint32 sec = fat.bpb.rsvd_sec_cnt;
    80205d4c:	00026797          	auipc	a5,0x26
    80205d50:	a3c78793          	addi	a5,a5,-1476 # 8022b788 <fat>
    80205d54:	0147db83          	lhu	s7,20(a5)
    uint32 const ent_per_sec = fat.bpb.byts_per_sec / sizeof(uint32);
    80205d58:	0107d903          	lhu	s2,16(a5)
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205d5c:	539c                	lw	a5,32(a5)
    80205d5e:	10078263          	beqz	a5,80205e62 <alloc_clus+0x130>
    80205d62:	0029591b          	srliw	s2,s2,0x2
    80205d66:	0009099b          	sext.w	s3,s2
    80205d6a:	4b01                	li	s6,0
        b = bread(dev, sec);
    80205d6c:	00050a9b          	sext.w	s5,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205d70:	4c01                	li	s8,0
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205d72:	00026c97          	auipc	s9,0x26
    80205d76:	a16c8c93          	addi	s9,s9,-1514 # 8022b788 <fat>
    80205d7a:	a0c1                	j	80205e3a <alloc_clus+0x108>
            if (((uint32 *)(b->data))[j] == 0) {
                ((uint32 *)(b->data))[j] = FAT32_EOC + 7;
    80205d7c:	100007b7          	lui	a5,0x10000
    80205d80:	37fd                	addiw	a5,a5,-1
    80205d82:	c29c                	sw	a5,0(a3)
                bwrite(b);
    80205d84:	8552                	mv	a0,s4
    80205d86:	ffffe097          	auipc	ra,0xffffe
    80205d8a:	b84080e7          	jalr	-1148(ra) # 8020390a <bwrite>
                brelse(b);
    80205d8e:	8552                	mv	a0,s4
    80205d90:	ffffe097          	auipc	ra,0xffffe
    80205d94:	bb6080e7          	jalr	-1098(ra) # 80203946 <brelse>
                uint32 clus = i * ent_per_sec + j;
    80205d98:	0369093b          	mulw	s2,s2,s6
    80205d9c:	009904bb          	addw	s1,s2,s1
    80205da0:	00048a9b          	sext.w	s5,s1
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80205da4:	00026717          	auipc	a4,0x26
    80205da8:	9e470713          	addi	a4,a4,-1564 # 8022b788 <fat>
    80205dac:	01274783          	lbu	a5,18(a4)
    80205db0:	34f9                	addiw	s1,s1,-2
    80205db2:	02f489bb          	mulw	s3,s1,a5
    80205db6:	4318                	lw	a4,0(a4)
    80205db8:	00e989bb          	addw	s3,s3,a4
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    80205dbc:	c7b1                	beqz	a5,80205e08 <alloc_clus+0xd6>
    80205dbe:	4901                	li	s2,0
    80205dc0:	00026a17          	auipc	s4,0x26
    80205dc4:	9c8a0a13          	addi	s4,s4,-1592 # 8022b788 <fat>
        b = bread(0, sec++);
    80205dc8:	013905bb          	addw	a1,s2,s3
    80205dcc:	4501                	li	a0,0
    80205dce:	ffffe097          	auipc	ra,0xffffe
    80205dd2:	a4c080e7          	jalr	-1460(ra) # 8020381a <bread>
    80205dd6:	84aa                	mv	s1,a0
        memset(b->data, 0, BSIZE);
    80205dd8:	20000613          	li	a2,512
    80205ddc:	4581                	li	a1,0
    80205dde:	05850513          	addi	a0,a0,88
    80205de2:	ffffb097          	auipc	ra,0xffffb
    80205de6:	982080e7          	jalr	-1662(ra) # 80200764 <memset>
        bwrite(b);
    80205dea:	8526                	mv	a0,s1
    80205dec:	ffffe097          	auipc	ra,0xffffe
    80205df0:	b1e080e7          	jalr	-1250(ra) # 8020390a <bwrite>
        brelse(b);
    80205df4:	8526                	mv	a0,s1
    80205df6:	ffffe097          	auipc	ra,0xffffe
    80205dfa:	b50080e7          	jalr	-1200(ra) # 80203946 <brelse>
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    80205dfe:	2905                	addiw	s2,s2,1
    80205e00:	012a4783          	lbu	a5,18(s4)
    80205e04:	fcf942e3          	blt	s2,a5,80205dc8 <alloc_clus+0x96>
            }
        }
        brelse(b);
    }
    panic("no clusters");
}
    80205e08:	8556                	mv	a0,s5
    80205e0a:	60e6                	ld	ra,88(sp)
    80205e0c:	6446                	ld	s0,80(sp)
    80205e0e:	64a6                	ld	s1,72(sp)
    80205e10:	6906                	ld	s2,64(sp)
    80205e12:	79e2                	ld	s3,56(sp)
    80205e14:	7a42                	ld	s4,48(sp)
    80205e16:	7aa2                	ld	s5,40(sp)
    80205e18:	7b02                	ld	s6,32(sp)
    80205e1a:	6be2                	ld	s7,24(sp)
    80205e1c:	6c42                	ld	s8,16(sp)
    80205e1e:	6ca2                	ld	s9,8(sp)
    80205e20:	6125                	addi	sp,sp,96
    80205e22:	8082                	ret
        brelse(b);
    80205e24:	8552                	mv	a0,s4
    80205e26:	ffffe097          	auipc	ra,0xffffe
    80205e2a:	b20080e7          	jalr	-1248(ra) # 80203946 <brelse>
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205e2e:	2b05                	addiw	s6,s6,1
    80205e30:	2b85                	addiw	s7,s7,1
    80205e32:	020ca783          	lw	a5,32(s9)
    80205e36:	02fb7663          	bgeu	s6,a5,80205e62 <alloc_clus+0x130>
        b = bread(dev, sec);
    80205e3a:	85de                	mv	a1,s7
    80205e3c:	8556                	mv	a0,s5
    80205e3e:	ffffe097          	auipc	ra,0xffffe
    80205e42:	9dc080e7          	jalr	-1572(ra) # 8020381a <bread>
    80205e46:	8a2a                	mv	s4,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205e48:	fc098ee3          	beqz	s3,80205e24 <alloc_clus+0xf2>
    80205e4c:	05850793          	addi	a5,a0,88
    80205e50:	84e2                	mv	s1,s8
            if (((uint32 *)(b->data))[j] == 0) {
    80205e52:	86be                	mv	a3,a5
    80205e54:	4398                	lw	a4,0(a5)
    80205e56:	d31d                	beqz	a4,80205d7c <alloc_clus+0x4a>
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205e58:	2485                	addiw	s1,s1,1
    80205e5a:	0791                	addi	a5,a5,4
    80205e5c:	fe999be3          	bne	s3,s1,80205e52 <alloc_clus+0x120>
    80205e60:	b7d1                	j	80205e24 <alloc_clus+0xf2>
    panic("no clusters");
    80205e62:	00005517          	auipc	a0,0x5
    80205e66:	dee50513          	addi	a0,a0,-530 # 8020ac50 <digits+0x8d0>
    80205e6a:	ffffa097          	auipc	ra,0xffffa
    80205e6e:	2d8080e7          	jalr	728(ra) # 80200142 <panic>

0000000080205e72 <write_fat>:
    if (cluster > fat.data_clus_cnt + 1) {
    80205e72:	00026797          	auipc	a5,0x26
    80205e76:	91e7a783          	lw	a5,-1762(a5) # 8022b790 <fat+0x8>
    80205e7a:	2785                	addiw	a5,a5,1
    80205e7c:	06a7e963          	bltu	a5,a0,80205eee <write_fat+0x7c>
{
    80205e80:	7179                	addi	sp,sp,-48
    80205e82:	f406                	sd	ra,40(sp)
    80205e84:	f022                	sd	s0,32(sp)
    80205e86:	ec26                	sd	s1,24(sp)
    80205e88:	e84a                	sd	s2,16(sp)
    80205e8a:	e44e                	sd	s3,8(sp)
    80205e8c:	e052                	sd	s4,0(sp)
    80205e8e:	1800                	addi	s0,sp,48
    80205e90:	89ae                	mv	s3,a1
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80205e92:	0025149b          	slliw	s1,a0,0x2
    80205e96:	00026a17          	auipc	s4,0x26
    80205e9a:	8f2a0a13          	addi	s4,s4,-1806 # 8022b788 <fat>
    80205e9e:	010a5783          	lhu	a5,16(s4)
    80205ea2:	02f4d7bb          	divuw	a5,s1,a5
    80205ea6:	014a5583          	lhu	a1,20(s4)
    struct buf *b = bread(0, fat_sec);
    80205eaa:	9dbd                	addw	a1,a1,a5
    80205eac:	4501                	li	a0,0
    80205eae:	ffffe097          	auipc	ra,0xffffe
    80205eb2:	96c080e7          	jalr	-1684(ra) # 8020381a <bread>
    80205eb6:	892a                	mv	s2,a0
    return (cluster << 2) % fat.bpb.byts_per_sec;
    80205eb8:	010a5783          	lhu	a5,16(s4)
    80205ebc:	02f4f4bb          	remuw	s1,s1,a5
    *(uint32 *)(b->data + off) = content;
    80205ec0:	1482                	slli	s1,s1,0x20
    80205ec2:	9081                	srli	s1,s1,0x20
    80205ec4:	94aa                	add	s1,s1,a0
    80205ec6:	0534ac23          	sw	s3,88(s1)
    bwrite(b);
    80205eca:	ffffe097          	auipc	ra,0xffffe
    80205ece:	a40080e7          	jalr	-1472(ra) # 8020390a <bwrite>
    brelse(b);
    80205ed2:	854a                	mv	a0,s2
    80205ed4:	ffffe097          	auipc	ra,0xffffe
    80205ed8:	a72080e7          	jalr	-1422(ra) # 80203946 <brelse>
    return 0;
    80205edc:	4501                	li	a0,0
}
    80205ede:	70a2                	ld	ra,40(sp)
    80205ee0:	7402                	ld	s0,32(sp)
    80205ee2:	64e2                	ld	s1,24(sp)
    80205ee4:	6942                	ld	s2,16(sp)
    80205ee6:	69a2                	ld	s3,8(sp)
    80205ee8:	6a02                	ld	s4,0(sp)
    80205eea:	6145                	addi	sp,sp,48
    80205eec:	8082                	ret
        return -1;
    80205eee:	557d                	li	a0,-1
}
    80205ef0:	8082                	ret

0000000080205ef2 <reloc_clus>:
 * @param   off         the offset from the beginning of the relative file
 * @param   alloc       whether alloc new cluster when meeting end of FAT chains
 * @return              the offset from the new cur_clus
 */
static int reloc_clus(struct dirent *entry, uint off, int alloc)
{
    80205ef2:	715d                	addi	sp,sp,-80
    80205ef4:	e486                	sd	ra,72(sp)
    80205ef6:	e0a2                	sd	s0,64(sp)
    80205ef8:	fc26                	sd	s1,56(sp)
    80205efa:	f84a                	sd	s2,48(sp)
    80205efc:	f44e                	sd	s3,40(sp)
    80205efe:	f052                	sd	s4,32(sp)
    80205f00:	ec56                	sd	s5,24(sp)
    80205f02:	e85a                	sd	s6,16(sp)
    80205f04:	e45e                	sd	s7,8(sp)
    80205f06:	0880                	addi	s0,sp,80
    80205f08:	84aa                	mv	s1,a0
    80205f0a:	8a2e                	mv	s4,a1
    int clus_num = off / fat.byts_per_clus;
    80205f0c:	00026b97          	auipc	s7,0x26
    80205f10:	888bab83          	lw	s7,-1912(s7) # 8022b794 <fat+0xc>
    80205f14:	0375d9bb          	divuw	s3,a1,s7
    while (clus_num > entry->clus_cnt) {
    80205f18:	11052703          	lw	a4,272(a0)
    80205f1c:	07377663          	bgeu	a4,s3,80205f88 <reloc_clus+0x96>
    80205f20:	8b32                	mv	s6,a2
        int clus = read_fat(entry->cur_clus);
        if (clus >= FAT32_EOC) {
    80205f22:	10000ab7          	lui	s5,0x10000
    80205f26:	1add                	addi	s5,s5,-9
    80205f28:	a025                	j	80205f50 <reloc_clus+0x5e>
            if (alloc) {
                clus = alloc_clus(entry->dev);
                write_fat(entry->cur_clus, clus);
            } else {
                entry->cur_clus = entry->first_clus;
    80205f2a:	1044a783          	lw	a5,260(s1)
    80205f2e:	10f4a623          	sw	a5,268(s1)
                entry->clus_cnt = 0;
    80205f32:	1004a823          	sw	zero,272(s1)
                return -1;
    80205f36:	557d                	li	a0,-1
    80205f38:	a879                	j	80205fd6 <reloc_clus+0xe4>
            }
        }
        entry->cur_clus = clus;
    80205f3a:	1124a623          	sw	s2,268(s1)
        entry->clus_cnt++;
    80205f3e:	1104a783          	lw	a5,272(s1)
    80205f42:	2785                	addiw	a5,a5,1
    80205f44:	0007871b          	sext.w	a4,a5
    80205f48:	10f4a823          	sw	a5,272(s1)
    while (clus_num > entry->clus_cnt) {
    80205f4c:	03377e63          	bgeu	a4,s3,80205f88 <reloc_clus+0x96>
        int clus = read_fat(entry->cur_clus);
    80205f50:	10c4a503          	lw	a0,268(s1)
    80205f54:	00000097          	auipc	ra,0x0
    80205f58:	d6a080e7          	jalr	-662(ra) # 80205cbe <read_fat>
    80205f5c:	0005091b          	sext.w	s2,a0
        if (clus >= FAT32_EOC) {
    80205f60:	fd2adde3          	bge	s5,s2,80205f3a <reloc_clus+0x48>
            if (alloc) {
    80205f64:	fc0b03e3          	beqz	s6,80205f2a <reloc_clus+0x38>
                clus = alloc_clus(entry->dev);
    80205f68:	1144c503          	lbu	a0,276(s1)
    80205f6c:	00000097          	auipc	ra,0x0
    80205f70:	dc6080e7          	jalr	-570(ra) # 80205d32 <alloc_clus>
    80205f74:	0005091b          	sext.w	s2,a0
                write_fat(entry->cur_clus, clus);
    80205f78:	85ca                	mv	a1,s2
    80205f7a:	10c4a503          	lw	a0,268(s1)
    80205f7e:	00000097          	auipc	ra,0x0
    80205f82:	ef4080e7          	jalr	-268(ra) # 80205e72 <write_fat>
    80205f86:	bf55                	j	80205f3a <reloc_clus+0x48>
    }
    if (clus_num < entry->clus_cnt) {
    80205f88:	04e9f163          	bgeu	s3,a4,80205fca <reloc_clus+0xd8>
        entry->cur_clus = entry->first_clus;
    80205f8c:	1044a783          	lw	a5,260(s1)
    80205f90:	10f4a623          	sw	a5,268(s1)
        entry->clus_cnt = 0;
    80205f94:	1004a823          	sw	zero,272(s1)
        while (entry->clus_cnt < clus_num) {
    80205f98:	037a6963          	bltu	s4,s7,80205fca <reloc_clus+0xd8>
            entry->cur_clus = read_fat(entry->cur_clus);
            if (entry->cur_clus >= FAT32_EOC) {
    80205f9c:	10000937          	lui	s2,0x10000
    80205fa0:	195d                	addi	s2,s2,-9
            entry->cur_clus = read_fat(entry->cur_clus);
    80205fa2:	10c4a503          	lw	a0,268(s1)
    80205fa6:	00000097          	auipc	ra,0x0
    80205faa:	d18080e7          	jalr	-744(ra) # 80205cbe <read_fat>
    80205fae:	2501                	sext.w	a0,a0
    80205fb0:	10a4a623          	sw	a0,268(s1)
            if (entry->cur_clus >= FAT32_EOC) {
    80205fb4:	02a96c63          	bltu	s2,a0,80205fec <reloc_clus+0xfa>
                panic("reloc_clus");
            }
            entry->clus_cnt++;
    80205fb8:	1104a783          	lw	a5,272(s1)
    80205fbc:	2785                	addiw	a5,a5,1
    80205fbe:	0007871b          	sext.w	a4,a5
    80205fc2:	10f4a823          	sw	a5,272(s1)
        while (entry->clus_cnt < clus_num) {
    80205fc6:	fd376ee3          	bltu	a4,s3,80205fa2 <reloc_clus+0xb0>
        }
    }
    return off % fat.byts_per_clus;
    80205fca:	00025517          	auipc	a0,0x25
    80205fce:	7ca52503          	lw	a0,1994(a0) # 8022b794 <fat+0xc>
    80205fd2:	02aa753b          	remuw	a0,s4,a0
}
    80205fd6:	60a6                	ld	ra,72(sp)
    80205fd8:	6406                	ld	s0,64(sp)
    80205fda:	74e2                	ld	s1,56(sp)
    80205fdc:	7942                	ld	s2,48(sp)
    80205fde:	79a2                	ld	s3,40(sp)
    80205fe0:	7a02                	ld	s4,32(sp)
    80205fe2:	6ae2                	ld	s5,24(sp)
    80205fe4:	6b42                	ld	s6,16(sp)
    80205fe6:	6ba2                	ld	s7,8(sp)
    80205fe8:	6161                	addi	sp,sp,80
    80205fea:	8082                	ret
                panic("reloc_clus");
    80205fec:	00005517          	auipc	a0,0x5
    80205ff0:	c7450513          	addi	a0,a0,-908 # 8020ac60 <digits+0x8e0>
    80205ff4:	ffffa097          	auipc	ra,0xffffa
    80205ff8:	14e080e7          	jalr	334(ra) # 80200142 <panic>

0000000080205ffc <rw_clus>:
{
    80205ffc:	7119                	addi	sp,sp,-128
    80205ffe:	fc86                	sd	ra,120(sp)
    80206000:	f8a2                	sd	s0,112(sp)
    80206002:	f4a6                	sd	s1,104(sp)
    80206004:	f0ca                	sd	s2,96(sp)
    80206006:	ecce                	sd	s3,88(sp)
    80206008:	e8d2                	sd	s4,80(sp)
    8020600a:	e4d6                	sd	s5,72(sp)
    8020600c:	e0da                	sd	s6,64(sp)
    8020600e:	fc5e                	sd	s7,56(sp)
    80206010:	f862                	sd	s8,48(sp)
    80206012:	f466                	sd	s9,40(sp)
    80206014:	f06a                	sd	s10,32(sp)
    80206016:	ec6e                	sd	s11,24(sp)
    80206018:	0100                	addi	s0,sp,128
    8020601a:	f8c43423          	sd	a2,-120(s0)
    8020601e:	8b36                	mv	s6,a3
    80206020:	8c3e                	mv	s8,a5
    if (off + n > fat.byts_per_clus)
    80206022:	00f706bb          	addw	a3,a4,a5
    80206026:	00025797          	auipc	a5,0x25
    8020602a:	76e7a783          	lw	a5,1902(a5) # 8022b794 <fat+0xc>
    8020602e:	02d7ef63          	bltu	a5,a3,8020606c <rw_clus+0x70>
    80206032:	8cae                	mv	s9,a1
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80206034:	00025797          	auipc	a5,0x25
    80206038:	75478793          	addi	a5,a5,1876 # 8022b788 <fat>
    8020603c:	0107da83          	lhu	s5,16(a5)
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80206040:	ffe5099b          	addiw	s3,a0,-2
    80206044:	0127c503          	lbu	a0,18(a5)
    80206048:	02a989bb          	mulw	s3,s3,a0
    8020604c:	4388                	lw	a0,0(a5)
    8020604e:	00a989bb          	addw	s3,s3,a0
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80206052:	035757bb          	divuw	a5,a4,s5
    80206056:	00f989bb          	addw	s3,s3,a5
    off = off % fat.bpb.byts_per_sec;
    8020605a:	03577abb          	remuw	s5,a4,s5
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    8020605e:	0e0c0363          	beqz	s8,80206144 <rw_clus+0x148>
    80206062:	4a01                	li	s4,0
        m = BSIZE - off % BSIZE;
    80206064:	20000d93          	li	s11,512
        if (bad == -1) {
    80206068:	5d7d                	li	s10,-1
    8020606a:	a095                	j	802060ce <rw_clus+0xd2>
        panic("offset out of range");
    8020606c:	00005517          	auipc	a0,0x5
    80206070:	c0450513          	addi	a0,a0,-1020 # 8020ac70 <digits+0x8f0>
    80206074:	ffffa097          	auipc	ra,0xffffa
    80206078:	0ce080e7          	jalr	206(ra) # 80200142 <panic>
                bwrite(bp);
    8020607c:	854a                	mv	a0,s2
    8020607e:	ffffe097          	auipc	ra,0xffffe
    80206082:	88c080e7          	jalr	-1908(ra) # 8020390a <bwrite>
        brelse(bp);
    80206086:	854a                	mv	a0,s2
    80206088:	ffffe097          	auipc	ra,0xffffe
    8020608c:	8be080e7          	jalr	-1858(ra) # 80203946 <brelse>
        if (bad == -1) {
    80206090:	a02d                	j	802060ba <rw_clus+0xbe>
            bad = either_copyout(user, data, bp->data + (off % BSIZE), m);
    80206092:	05890613          	addi	a2,s2,88 # 10000058 <_entry-0x701fffa8>
    80206096:	1682                	slli	a3,a3,0x20
    80206098:	9281                	srli	a3,a3,0x20
    8020609a:	963a                	add	a2,a2,a4
    8020609c:	85da                	mv	a1,s6
    8020609e:	f8843503          	ld	a0,-120(s0)
    802060a2:	ffffc097          	auipc	ra,0xffffc
    802060a6:	48a080e7          	jalr	1162(ra) # 8020252c <either_copyout>
    802060aa:	8baa                	mv	s7,a0
        brelse(bp);
    802060ac:	854a                	mv	a0,s2
    802060ae:	ffffe097          	auipc	ra,0xffffe
    802060b2:	898080e7          	jalr	-1896(ra) # 80203946 <brelse>
        if (bad == -1) {
    802060b6:	07ab8763          	beq	s7,s10,80206124 <rw_clus+0x128>
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    802060ba:	01448a3b          	addw	s4,s1,s4
    802060be:	01548abb          	addw	s5,s1,s5
    802060c2:	1482                	slli	s1,s1,0x20
    802060c4:	9081                	srli	s1,s1,0x20
    802060c6:	9b26                	add	s6,s6,s1
    802060c8:	2985                	addiw	s3,s3,1
    802060ca:	058a7d63          	bgeu	s4,s8,80206124 <rw_clus+0x128>
        bp = bread(0, sec);
    802060ce:	85ce                	mv	a1,s3
    802060d0:	4501                	li	a0,0
    802060d2:	ffffd097          	auipc	ra,0xffffd
    802060d6:	748080e7          	jalr	1864(ra) # 8020381a <bread>
    802060da:	892a                	mv	s2,a0
        m = BSIZE - off % BSIZE;
    802060dc:	1ffaf713          	andi	a4,s5,511
    802060e0:	40ed863b          	subw	a2,s11,a4
        if (n - tot < m) {
    802060e4:	414c07bb          	subw	a5,s8,s4
    802060e8:	86be                	mv	a3,a5
    802060ea:	2781                	sext.w	a5,a5
    802060ec:	0006059b          	sext.w	a1,a2
    802060f0:	00f5f363          	bgeu	a1,a5,802060f6 <rw_clus+0xfa>
    802060f4:	86b2                	mv	a3,a2
    802060f6:	0006849b          	sext.w	s1,a3
        if (write) {
    802060fa:	f80c8ce3          	beqz	s9,80206092 <rw_clus+0x96>
            if ((bad = either_copyin(bp->data + (off % BSIZE), user, data, m)) != -1) {
    802060fe:	05890513          	addi	a0,s2,88
    80206102:	1682                	slli	a3,a3,0x20
    80206104:	9281                	srli	a3,a3,0x20
    80206106:	865a                	mv	a2,s6
    80206108:	f8843583          	ld	a1,-120(s0)
    8020610c:	953a                	add	a0,a0,a4
    8020610e:	ffffc097          	auipc	ra,0xffffc
    80206112:	454080e7          	jalr	1108(ra) # 80202562 <either_copyin>
    80206116:	f7a513e3          	bne	a0,s10,8020607c <rw_clus+0x80>
        brelse(bp);
    8020611a:	854a                	mv	a0,s2
    8020611c:	ffffe097          	auipc	ra,0xffffe
    80206120:	82a080e7          	jalr	-2006(ra) # 80203946 <brelse>
}
    80206124:	8552                	mv	a0,s4
    80206126:	70e6                	ld	ra,120(sp)
    80206128:	7446                	ld	s0,112(sp)
    8020612a:	74a6                	ld	s1,104(sp)
    8020612c:	7906                	ld	s2,96(sp)
    8020612e:	69e6                	ld	s3,88(sp)
    80206130:	6a46                	ld	s4,80(sp)
    80206132:	6aa6                	ld	s5,72(sp)
    80206134:	6b06                	ld	s6,64(sp)
    80206136:	7be2                	ld	s7,56(sp)
    80206138:	7c42                	ld	s8,48(sp)
    8020613a:	7ca2                	ld	s9,40(sp)
    8020613c:	7d02                	ld	s10,32(sp)
    8020613e:	6de2                	ld	s11,24(sp)
    80206140:	6109                	addi	sp,sp,128
    80206142:	8082                	ret
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    80206144:	8a62                	mv	s4,s8
    80206146:	bff9                	j	80206124 <rw_clus+0x128>

0000000080206148 <eget>:
// by their whole path. But when parsing a path, we open all the directories through it, 
// which forms a linked list from the final file to the root. Thus, we use the "parent" pointer 
// to recognize whether an entry with the "name" as given is really the file we want in the right path.
// Should never get root by eget, it's easy to understand.
static struct dirent *eget(struct dirent *parent, char *name)
{
    80206148:	7139                	addi	sp,sp,-64
    8020614a:	fc06                	sd	ra,56(sp)
    8020614c:	f822                	sd	s0,48(sp)
    8020614e:	f426                	sd	s1,40(sp)
    80206150:	f04a                	sd	s2,32(sp)
    80206152:	ec4e                	sd	s3,24(sp)
    80206154:	e852                	sd	s4,16(sp)
    80206156:	e456                	sd	s5,8(sp)
    80206158:	0080                	addi	s0,sp,64
    8020615a:	8a2a                	mv	s4,a0
    8020615c:	8aae                	mv	s5,a1
    struct dirent *ep;
    acquire(&ecache.lock);
    8020615e:	00025517          	auipc	a0,0x25
    80206162:	7ba50513          	addi	a0,a0,1978 # 8022b918 <ecache>
    80206166:	ffffa097          	auipc	ra,0xffffa
    8020616a:	562080e7          	jalr	1378(ra) # 802006c8 <acquire>
    if (name) {
    8020616e:	060a8b63          	beqz	s5,802061e4 <eget+0x9c>
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    80206172:	00025497          	auipc	s1,0x25
    80206176:	7664b483          	ld	s1,1894(s1) # 8022b8d8 <root+0x128>
    8020617a:	00025797          	auipc	a5,0x25
    8020617e:	63678793          	addi	a5,a5,1590 # 8022b7b0 <root>
    80206182:	06f48163          	beq	s1,a5,802061e4 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80206186:	4905                	li	s2,1
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    80206188:	89be                	mv	s3,a5
    8020618a:	a029                	j	80206194 <eget+0x4c>
    8020618c:	1284b483          	ld	s1,296(s1)
    80206190:	05348a63          	beq	s1,s3,802061e4 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80206194:	11649783          	lh	a5,278(s1)
    80206198:	ff279ae3          	bne	a5,s2,8020618c <eget+0x44>
    8020619c:	1204b783          	ld	a5,288(s1)
    802061a0:	ff4796e3          	bne	a5,s4,8020618c <eget+0x44>
                && strncmp(ep->filename, name, FAT32_MAX_FILENAME) == 0) {
    802061a4:	0ff00613          	li	a2,255
    802061a8:	85d6                	mv	a1,s5
    802061aa:	8526                	mv	a0,s1
    802061ac:	ffffa097          	auipc	ra,0xffffa
    802061b0:	694080e7          	jalr	1684(ra) # 80200840 <strncmp>
    802061b4:	fd61                	bnez	a0,8020618c <eget+0x44>
                if (ep->ref++ == 0) {
    802061b6:	1184a783          	lw	a5,280(s1)
    802061ba:	0017871b          	addiw	a4,a5,1
    802061be:	10e4ac23          	sw	a4,280(s1)
    802061c2:	eb81                	bnez	a5,802061d2 <eget+0x8a>
                    ep->parent->ref++;
    802061c4:	1204b703          	ld	a4,288(s1)
    802061c8:	11872783          	lw	a5,280(a4)
    802061cc:	2785                	addiw	a5,a5,1
    802061ce:	10f72c23          	sw	a5,280(a4)
                }
                release(&ecache.lock);
    802061d2:	00025517          	auipc	a0,0x25
    802061d6:	74650513          	addi	a0,a0,1862 # 8022b918 <ecache>
    802061da:	ffffa097          	auipc	ra,0xffffa
    802061de:	542080e7          	jalr	1346(ra) # 8020071c <release>
                // edup(ep->parent);
                return ep;
    802061e2:	a085                	j	80206242 <eget+0xfa>
            }
        }
    }
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    802061e4:	00025497          	auipc	s1,0x25
    802061e8:	6fc4b483          	ld	s1,1788(s1) # 8022b8e0 <root+0x130>
    802061ec:	00025797          	auipc	a5,0x25
    802061f0:	5c478793          	addi	a5,a5,1476 # 8022b7b0 <root>
    802061f4:	00f48a63          	beq	s1,a5,80206208 <eget+0xc0>
    802061f8:	873e                	mv	a4,a5
        if (ep->ref == 0) {
    802061fa:	1184a783          	lw	a5,280(s1)
    802061fe:	cf89                	beqz	a5,80206218 <eget+0xd0>
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80206200:	1304b483          	ld	s1,304(s1)
    80206204:	fee49be3          	bne	s1,a4,802061fa <eget+0xb2>
            ep->dirty = 0;
            release(&ecache.lock);
            return ep;
        }
    }
    panic("eget: insufficient ecache");
    80206208:	00005517          	auipc	a0,0x5
    8020620c:	a8050513          	addi	a0,a0,-1408 # 8020ac88 <digits+0x908>
    80206210:	ffffa097          	auipc	ra,0xffffa
    80206214:	f32080e7          	jalr	-206(ra) # 80200142 <panic>
            ep->ref = 1;
    80206218:	4785                	li	a5,1
    8020621a:	10f4ac23          	sw	a5,280(s1)
            ep->dev = parent->dev;
    8020621e:	114a4783          	lbu	a5,276(s4)
    80206222:	10f48a23          	sb	a5,276(s1)
            ep->off = 0;
    80206226:	1004ae23          	sw	zero,284(s1)
            ep->valid = 0;
    8020622a:	10049b23          	sh	zero,278(s1)
            ep->dirty = 0;
    8020622e:	10048aa3          	sb	zero,277(s1)
            release(&ecache.lock);
    80206232:	00025517          	auipc	a0,0x25
    80206236:	6e650513          	addi	a0,a0,1766 # 8022b918 <ecache>
    8020623a:	ffffa097          	auipc	ra,0xffffa
    8020623e:	4e2080e7          	jalr	1250(ra) # 8020071c <release>
    return 0;
}
    80206242:	8526                	mv	a0,s1
    80206244:	70e2                	ld	ra,56(sp)
    80206246:	7442                	ld	s0,48(sp)
    80206248:	74a2                	ld	s1,40(sp)
    8020624a:	7902                	ld	s2,32(sp)
    8020624c:	69e2                	ld	s3,24(sp)
    8020624e:	6a42                	ld	s4,16(sp)
    80206250:	6aa2                	ld	s5,8(sp)
    80206252:	6121                	addi	sp,sp,64
    80206254:	8082                	ret

0000000080206256 <read_entry_name>:
 * @param   buffer      pointer to the array that stores the name
 * @param   raw_entry   pointer to the entry in a sector buffer
 * @param   islong      if non-zero, read as l-n-e, otherwise s-n-e.
 */
static void read_entry_name(char *buffer, union dentry *d)
{
    80206256:	7139                	addi	sp,sp,-64
    80206258:	fc06                	sd	ra,56(sp)
    8020625a:	f822                	sd	s0,48(sp)
    8020625c:	f426                	sd	s1,40(sp)
    8020625e:	f04a                	sd	s2,32(sp)
    80206260:	ec4e                	sd	s3,24(sp)
    80206262:	0080                	addi	s0,sp,64
    80206264:	84aa                	mv	s1,a0
    80206266:	892e                	mv	s2,a1
    if (d->lne.attr == ATTR_LONG_NAME) {                       // long entry branch
    80206268:	00b5c703          	lbu	a4,11(a1)
    8020626c:	47bd                	li	a5,15
    8020626e:	08f70563          	beq	a4,a5,802062f8 <read_entry_name+0xa2>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
        buffer += NELEM(d->lne.name2);
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    } else {
        // assert: only "." and ".." will enter this branch
        memset(buffer, 0, CHAR_SHORT_NAME + 2); // plus '.' and '\0'
    80206272:	4635                	li	a2,13
    80206274:	4581                	li	a1,0
    80206276:	ffffa097          	auipc	ra,0xffffa
    8020627a:	4ee080e7          	jalr	1262(ra) # 80200764 <memset>
        int i;
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    8020627e:	00094703          	lbu	a4,0(s2)
    80206282:	02000793          	li	a5,32
    80206286:	0af70c63          	beq	a4,a5,8020633e <read_entry_name+0xe8>
    8020628a:	4785                	li	a5,1
    8020628c:	02000613          	li	a2,32
    80206290:	45a5                	li	a1,9
            buffer[i] = d->sne.name[i];
    80206292:	00f486b3          	add	a3,s1,a5
    80206296:	fee68fa3          	sb	a4,-1(a3) # 1fff <_entry-0x801fe001>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    8020629a:	0007851b          	sext.w	a0,a5
    8020629e:	00f90733          	add	a4,s2,a5
    802062a2:	00074703          	lbu	a4,0(a4)
    802062a6:	00c70563          	beq	a4,a2,802062b0 <read_entry_name+0x5a>
    802062aa:	0785                	addi	a5,a5,1
    802062ac:	feb793e3          	bne	a5,a1,80206292 <read_entry_name+0x3c>
        }
        if (d->sne.name[8] != ' ') {
    802062b0:	00894703          	lbu	a4,8(s2)
    802062b4:	02000793          	li	a5,32
    802062b8:	00f70963          	beq	a4,a5,802062ca <read_entry_name+0x74>
            buffer[i++] = '.';
    802062bc:	00a487b3          	add	a5,s1,a0
    802062c0:	02e00713          	li	a4,46
    802062c4:	00e78023          	sb	a4,0(a5)
    802062c8:	2505                	addiw	a0,a0,1
        }
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    802062ca:	00890793          	addi	a5,s2,8
    802062ce:	94aa                	add	s1,s1,a0
    802062d0:	092d                	addi	s2,s2,11
            if (d->sne.name[j] == ' ') { break; }
    802062d2:	02000693          	li	a3,32
    802062d6:	0007c703          	lbu	a4,0(a5)
    802062da:	00d70863          	beq	a4,a3,802062ea <read_entry_name+0x94>
            buffer[i] = d->sne.name[j];
    802062de:	00e48023          	sb	a4,0(s1)
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    802062e2:	0785                	addi	a5,a5,1
    802062e4:	0485                	addi	s1,s1,1
    802062e6:	ff2798e3          	bne	a5,s2,802062d6 <read_entry_name+0x80>
        }
    }
}
    802062ea:	70e2                	ld	ra,56(sp)
    802062ec:	7442                	ld	s0,48(sp)
    802062ee:	74a2                	ld	s1,40(sp)
    802062f0:	7902                	ld	s2,32(sp)
    802062f2:	69e2                	ld	s3,24(sp)
    802062f4:	6121                	addi	sp,sp,64
    802062f6:	8082                	ret
        memmove(temp, d->lne.name1, sizeof(temp));
    802062f8:	4629                	li	a2,10
    802062fa:	0585                	addi	a1,a1,1
    802062fc:	fc040993          	addi	s3,s0,-64
    80206300:	854e                	mv	a0,s3
    80206302:	ffffa097          	auipc	ra,0xffffa
    80206306:	4c2080e7          	jalr	1218(ra) # 802007c4 <memmove>
        snstr(buffer, temp, NELEM(d->lne.name1));
    8020630a:	4615                	li	a2,5
    8020630c:	85ce                	mv	a1,s3
    8020630e:	8526                	mv	a0,s1
    80206310:	ffffa097          	auipc	ra,0xffffa
    80206314:	63a080e7          	jalr	1594(ra) # 8020094a <snstr>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
    80206318:	4619                	li	a2,6
    8020631a:	00e90593          	addi	a1,s2,14
    8020631e:	00548513          	addi	a0,s1,5
    80206322:	ffffa097          	auipc	ra,0xffffa
    80206326:	628080e7          	jalr	1576(ra) # 8020094a <snstr>
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    8020632a:	4609                	li	a2,2
    8020632c:	01c90593          	addi	a1,s2,28
    80206330:	00b48513          	addi	a0,s1,11
    80206334:	ffffa097          	auipc	ra,0xffffa
    80206338:	616080e7          	jalr	1558(ra) # 8020094a <snstr>
    8020633c:	b77d                	j	802062ea <read_entry_name+0x94>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    8020633e:	4501                	li	a0,0
    80206340:	bf85                	j	802062b0 <read_entry_name+0x5a>

0000000080206342 <fat32_init>:
{
    80206342:	7139                	addi	sp,sp,-64
    80206344:	fc06                	sd	ra,56(sp)
    80206346:	f822                	sd	s0,48(sp)
    80206348:	f426                	sd	s1,40(sp)
    8020634a:	f04a                	sd	s2,32(sp)
    8020634c:	ec4e                	sd	s3,24(sp)
    8020634e:	e852                	sd	s4,16(sp)
    80206350:	e456                	sd	s5,8(sp)
    80206352:	0080                	addi	s0,sp,64
    struct buf *b = bread(0, 0);
    80206354:	4581                	li	a1,0
    80206356:	4501                	li	a0,0
    80206358:	ffffd097          	auipc	ra,0xffffd
    8020635c:	4c2080e7          	jalr	1218(ra) # 8020381a <bread>
    80206360:	892a                	mv	s2,a0
    if (strncmp((char const*)(b->data + 82), "FAT32", 5))
    80206362:	4615                	li	a2,5
    80206364:	00005597          	auipc	a1,0x5
    80206368:	94458593          	addi	a1,a1,-1724 # 8020aca8 <digits+0x928>
    8020636c:	0aa50513          	addi	a0,a0,170
    80206370:	ffffa097          	auipc	ra,0xffffa
    80206374:	4d0080e7          	jalr	1232(ra) # 80200840 <strncmp>
    80206378:	16051863          	bnez	a0,802064e8 <fat32_init+0x1a6>
    memmove(&fat.bpb.byts_per_sec, b->data + 11, 2);            // avoid misaligned load on k210
    8020637c:	00025497          	auipc	s1,0x25
    80206380:	40c48493          	addi	s1,s1,1036 # 8022b788 <fat>
    80206384:	4609                	li	a2,2
    80206386:	06390593          	addi	a1,s2,99
    8020638a:	00025517          	auipc	a0,0x25
    8020638e:	40e50513          	addi	a0,a0,1038 # 8022b798 <fat+0x10>
    80206392:	ffffa097          	auipc	ra,0xffffa
    80206396:	432080e7          	jalr	1074(ra) # 802007c4 <memmove>
    fat.bpb.sec_per_clus = *(b->data + 13);
    8020639a:	06594683          	lbu	a3,101(s2)
    8020639e:	00d48923          	sb	a3,18(s1)
    fat.bpb.rsvd_sec_cnt = *(uint16 *)(b->data + 14);
    802063a2:	06695603          	lhu	a2,102(s2)
    802063a6:	00c49a23          	sh	a2,20(s1)
    fat.bpb.fat_cnt = *(b->data + 16);
    802063aa:	06894703          	lbu	a4,104(s2)
    802063ae:	00e48b23          	sb	a4,22(s1)
    fat.bpb.hidd_sec = *(uint32 *)(b->data + 28);
    802063b2:	07492783          	lw	a5,116(s2)
    802063b6:	cc9c                	sw	a5,24(s1)
    fat.bpb.tot_sec = *(uint32 *)(b->data + 32);
    802063b8:	07892783          	lw	a5,120(s2)
    802063bc:	ccdc                	sw	a5,28(s1)
    fat.bpb.fat_sz = *(uint32 *)(b->data + 36);
    802063be:	07c92583          	lw	a1,124(s2)
    802063c2:	d08c                	sw	a1,32(s1)
    fat.bpb.root_clus = *(uint32 *)(b->data + 44);
    802063c4:	08492503          	lw	a0,132(s2)
    802063c8:	d0c8                	sw	a0,36(s1)
    fat.first_data_sec = fat.bpb.rsvd_sec_cnt + fat.bpb.fat_cnt * fat.bpb.fat_sz;
    802063ca:	02b7073b          	mulw	a4,a4,a1
    802063ce:	9f31                	addw	a4,a4,a2
    802063d0:	c098                	sw	a4,0(s1)
    fat.data_sec_cnt = fat.bpb.tot_sec - fat.first_data_sec;
    802063d2:	9f99                	subw	a5,a5,a4
    802063d4:	c0dc                	sw	a5,4(s1)
    fat.data_clus_cnt = fat.data_sec_cnt / fat.bpb.sec_per_clus;
    802063d6:	02d7d7bb          	divuw	a5,a5,a3
    802063da:	c49c                	sw	a5,8(s1)
    fat.byts_per_clus = fat.bpb.sec_per_clus * fat.bpb.byts_per_sec;
    802063dc:	0104d783          	lhu	a5,16(s1)
    802063e0:	02d787bb          	mulw	a5,a5,a3
    802063e4:	c4dc                	sw	a5,12(s1)
    brelse(b);
    802063e6:	854a                	mv	a0,s2
    802063e8:	ffffd097          	auipc	ra,0xffffd
    802063ec:	55e080e7          	jalr	1374(ra) # 80203946 <brelse>
    if (BSIZE != fat.bpb.byts_per_sec) 
    802063f0:	0104d703          	lhu	a4,16(s1)
    802063f4:	20000793          	li	a5,512
    802063f8:	10f71063          	bne	a4,a5,802064f8 <fat32_init+0x1b6>
    initlock(&ecache.lock, "ecache");
    802063fc:	00005597          	auipc	a1,0x5
    80206400:	8e458593          	addi	a1,a1,-1820 # 8020ace0 <digits+0x960>
    80206404:	00025517          	auipc	a0,0x25
    80206408:	51450513          	addi	a0,a0,1300 # 8022b918 <ecache>
    8020640c:	ffffa097          	auipc	ra,0xffffa
    80206410:	278080e7          	jalr	632(ra) # 80200684 <initlock>
    memset(&root, 0, sizeof(root));
    80206414:	00025497          	auipc	s1,0x25
    80206418:	37448493          	addi	s1,s1,884 # 8022b788 <fat>
    8020641c:	00025917          	auipc	s2,0x25
    80206420:	39490913          	addi	s2,s2,916 # 8022b7b0 <root>
    80206424:	16800613          	li	a2,360
    80206428:	4581                	li	a1,0
    8020642a:	854a                	mv	a0,s2
    8020642c:	ffffa097          	auipc	ra,0xffffa
    80206430:	338080e7          	jalr	824(ra) # 80200764 <memset>
    initsleeplock(&root.lock, "entry");
    80206434:	00005597          	auipc	a1,0x5
    80206438:	8b458593          	addi	a1,a1,-1868 # 8020ace8 <digits+0x968>
    8020643c:	00025517          	auipc	a0,0x25
    80206440:	4ac50513          	addi	a0,a0,1196 # 8022b8e8 <root+0x138>
    80206444:	ffffd097          	auipc	ra,0xffffd
    80206448:	618080e7          	jalr	1560(ra) # 80203a5c <initsleeplock>
    root.attribute = (ATTR_DIRECTORY | ATTR_SYSTEM);
    8020644c:	47d1                	li	a5,20
    8020644e:	12f48423          	sb	a5,296(s1)
    root.first_clus = root.cur_clus = fat.bpb.root_clus;
    80206452:	50dc                	lw	a5,36(s1)
    80206454:	12f4aa23          	sw	a5,308(s1)
    80206458:	12f4a623          	sw	a5,300(s1)
    root.valid = 1;
    8020645c:	4785                	li	a5,1
    8020645e:	12f49f23          	sh	a5,318(s1)
    root.prev = &root;
    80206462:	1524bc23          	sd	s2,344(s1)
    root.next = &root;
    80206466:	1524b823          	sd	s2,336(s1)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    8020646a:	00025497          	auipc	s1,0x25
    8020646e:	4c648493          	addi	s1,s1,1222 # 8022b930 <ecache+0x18>
        de->next = root.next;
    80206472:	00025917          	auipc	s2,0x25
    80206476:	31690913          	addi	s2,s2,790 # 8022b788 <fat>
        de->prev = &root;
    8020647a:	00025a97          	auipc	s5,0x25
    8020647e:	336a8a93          	addi	s5,s5,822 # 8022b7b0 <root>
        initsleeplock(&de->lock, "entry");
    80206482:	00005a17          	auipc	s4,0x5
    80206486:	866a0a13          	addi	s4,s4,-1946 # 8020ace8 <digits+0x968>
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    8020648a:	0002a997          	auipc	s3,0x2a
    8020648e:	af698993          	addi	s3,s3,-1290 # 8022ff80 <cons>
        de->dev = 0;
    80206492:	10048a23          	sb	zero,276(s1)
        de->valid = 0;
    80206496:	10049b23          	sh	zero,278(s1)
        de->ref = 0;
    8020649a:	1004ac23          	sw	zero,280(s1)
        de->dirty = 0;
    8020649e:	10048aa3          	sb	zero,277(s1)
        de->parent = 0;
    802064a2:	1204b023          	sd	zero,288(s1)
        de->next = root.next;
    802064a6:	15093783          	ld	a5,336(s2)
    802064aa:	12f4b423          	sd	a5,296(s1)
        de->prev = &root;
    802064ae:	1354b823          	sd	s5,304(s1)
        initsleeplock(&de->lock, "entry");
    802064b2:	85d2                	mv	a1,s4
    802064b4:	13848513          	addi	a0,s1,312
    802064b8:	ffffd097          	auipc	ra,0xffffd
    802064bc:	5a4080e7          	jalr	1444(ra) # 80203a5c <initsleeplock>
        root.next->prev = de;
    802064c0:	15093783          	ld	a5,336(s2)
    802064c4:	1297b823          	sd	s1,304(a5)
        root.next = de;
    802064c8:	14993823          	sd	s1,336(s2)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    802064cc:	16848493          	addi	s1,s1,360
    802064d0:	fd3491e3          	bne	s1,s3,80206492 <fat32_init+0x150>
}
    802064d4:	4501                	li	a0,0
    802064d6:	70e2                	ld	ra,56(sp)
    802064d8:	7442                	ld	s0,48(sp)
    802064da:	74a2                	ld	s1,40(sp)
    802064dc:	7902                	ld	s2,32(sp)
    802064de:	69e2                	ld	s3,24(sp)
    802064e0:	6a42                	ld	s4,16(sp)
    802064e2:	6aa2                	ld	s5,8(sp)
    802064e4:	6121                	addi	sp,sp,64
    802064e6:	8082                	ret
        panic("not FAT32 volume");
    802064e8:	00004517          	auipc	a0,0x4
    802064ec:	7c850513          	addi	a0,a0,1992 # 8020acb0 <digits+0x930>
    802064f0:	ffffa097          	auipc	ra,0xffffa
    802064f4:	c52080e7          	jalr	-942(ra) # 80200142 <panic>
        panic("byts_per_sec != BSIZE");
    802064f8:	00004517          	auipc	a0,0x4
    802064fc:	7d050513          	addi	a0,a0,2000 # 8020acc8 <digits+0x948>
    80206500:	ffffa097          	auipc	ra,0xffffa
    80206504:	c42080e7          	jalr	-958(ra) # 80200142 <panic>

0000000080206508 <eread>:
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80206508:	10852783          	lw	a5,264(a0)
    8020650c:	0ed7e863          	bltu	a5,a3,802065fc <eread+0xf4>
{
    80206510:	711d                	addi	sp,sp,-96
    80206512:	ec86                	sd	ra,88(sp)
    80206514:	e8a2                	sd	s0,80(sp)
    80206516:	e4a6                	sd	s1,72(sp)
    80206518:	e0ca                	sd	s2,64(sp)
    8020651a:	fc4e                	sd	s3,56(sp)
    8020651c:	f852                	sd	s4,48(sp)
    8020651e:	f456                	sd	s5,40(sp)
    80206520:	f05a                	sd	s6,32(sp)
    80206522:	ec5e                	sd	s7,24(sp)
    80206524:	e862                	sd	s8,16(sp)
    80206526:	e466                	sd	s9,8(sp)
    80206528:	e06a                	sd	s10,0(sp)
    8020652a:	1080                	addi	s0,sp,96
    8020652c:	8a2a                	mv	s4,a0
    8020652e:	8bae                	mv	s7,a1
    80206530:	8ab2                	mv	s5,a2
    80206532:	8936                	mv	s2,a3
    80206534:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80206536:	9eb9                	addw	a3,a3,a4
        return 0;
    80206538:	4501                	li	a0,0
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    8020653a:	0b26e163          	bltu	a3,s2,802065dc <eread+0xd4>
    8020653e:	100a4703          	lbu	a4,256(s4)
    80206542:	8b41                	andi	a4,a4,16
    80206544:	ef41                	bnez	a4,802065dc <eread+0xd4>
    if (off + n > entry->file_size) {
    80206546:	00d7f463          	bgeu	a5,a3,8020654e <eread+0x46>
        n = entry->file_size - off;
    8020654a:	41278b3b          	subw	s6,a5,s2
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    8020654e:	10ca2703          	lw	a4,268(s4)
    80206552:	100007b7          	lui	a5,0x10000
    80206556:	17dd                	addi	a5,a5,-9
    80206558:	06e7ef63          	bltu	a5,a4,802065d6 <eread+0xce>
    8020655c:	080b0e63          	beqz	s6,802065f8 <eread+0xf0>
    80206560:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206562:	00025c97          	auipc	s9,0x25
    80206566:	226c8c93          	addi	s9,s9,550 # 8022b788 <fat>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    8020656a:	8c3e                	mv	s8,a5
    8020656c:	a82d                	j	802065a6 <eread+0x9e>
    8020656e:	00048d1b          	sext.w	s10,s1
        if (rw_clus(entry->cur_clus, 0, user_dst, dst, off % fat.byts_per_clus, m) != m) {
    80206572:	87ea                	mv	a5,s10
    80206574:	86d6                	mv	a3,s5
    80206576:	865e                	mv	a2,s7
    80206578:	4581                	li	a1,0
    8020657a:	10ca2503          	lw	a0,268(s4)
    8020657e:	00000097          	auipc	ra,0x0
    80206582:	a7e080e7          	jalr	-1410(ra) # 80205ffc <rw_clus>
    80206586:	2501                	sext.w	a0,a0
    80206588:	04ad1863          	bne	s10,a0,802065d8 <eread+0xd0>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    8020658c:	013489bb          	addw	s3,s1,s3
    80206590:	0124893b          	addw	s2,s1,s2
    80206594:	1482                	slli	s1,s1,0x20
    80206596:	9081                	srli	s1,s1,0x20
    80206598:	9aa6                	add	s5,s5,s1
    8020659a:	10ca2783          	lw	a5,268(s4)
    8020659e:	02fc6d63          	bltu	s8,a5,802065d8 <eread+0xd0>
    802065a2:	0369fb63          	bgeu	s3,s6,802065d8 <eread+0xd0>
        reloc_clus(entry, off, 0);
    802065a6:	4601                	li	a2,0
    802065a8:	85ca                	mv	a1,s2
    802065aa:	8552                	mv	a0,s4
    802065ac:	00000097          	auipc	ra,0x0
    802065b0:	946080e7          	jalr	-1722(ra) # 80205ef2 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    802065b4:	00cca783          	lw	a5,12(s9)
    802065b8:	02f976bb          	remuw	a3,s2,a5
    802065bc:	0006871b          	sext.w	a4,a3
    802065c0:	9f95                	subw	a5,a5,a3
        if (n - tot < m) {
    802065c2:	413b06bb          	subw	a3,s6,s3
    802065c6:	84b6                	mv	s1,a3
    802065c8:	2681                	sext.w	a3,a3
    802065ca:	0007861b          	sext.w	a2,a5
    802065ce:	fad670e3          	bgeu	a2,a3,8020656e <eread+0x66>
    802065d2:	84be                	mv	s1,a5
    802065d4:	bf69                	j	8020656e <eread+0x66>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802065d6:	4981                	li	s3,0
    return tot;
    802065d8:	0009851b          	sext.w	a0,s3
}
    802065dc:	60e6                	ld	ra,88(sp)
    802065de:	6446                	ld	s0,80(sp)
    802065e0:	64a6                	ld	s1,72(sp)
    802065e2:	6906                	ld	s2,64(sp)
    802065e4:	79e2                	ld	s3,56(sp)
    802065e6:	7a42                	ld	s4,48(sp)
    802065e8:	7aa2                	ld	s5,40(sp)
    802065ea:	7b02                	ld	s6,32(sp)
    802065ec:	6be2                	ld	s7,24(sp)
    802065ee:	6c42                	ld	s8,16(sp)
    802065f0:	6ca2                	ld	s9,8(sp)
    802065f2:	6d02                	ld	s10,0(sp)
    802065f4:	6125                	addi	sp,sp,96
    802065f6:	8082                	ret
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802065f8:	89da                	mv	s3,s6
    802065fa:	bff9                	j	802065d8 <eread+0xd0>
        return 0;
    802065fc:	4501                	li	a0,0
}
    802065fe:	8082                	ret

0000000080206600 <ewrite>:
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    80206600:	10852783          	lw	a5,264(a0)
    80206604:	0ed7e463          	bltu	a5,a3,802066ec <ewrite+0xec>
{
    80206608:	711d                	addi	sp,sp,-96
    8020660a:	ec86                	sd	ra,88(sp)
    8020660c:	e8a2                	sd	s0,80(sp)
    8020660e:	e4a6                	sd	s1,72(sp)
    80206610:	e0ca                	sd	s2,64(sp)
    80206612:	fc4e                	sd	s3,56(sp)
    80206614:	f852                	sd	s4,48(sp)
    80206616:	f456                	sd	s5,40(sp)
    80206618:	f05a                	sd	s6,32(sp)
    8020661a:	ec5e                	sd	s7,24(sp)
    8020661c:	e862                	sd	s8,16(sp)
    8020661e:	e466                	sd	s9,8(sp)
    80206620:	1080                	addi	s0,sp,96
    80206622:	8aaa                	mv	s5,a0
    80206624:	8bae                	mv	s7,a1
    80206626:	8a32                	mv	s4,a2
    80206628:	8936                	mv	s2,a3
    8020662a:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    8020662c:	00e687bb          	addw	a5,a3,a4
    80206630:	0cd7e063          	bltu	a5,a3,802066f0 <ewrite+0xf0>
    80206634:	02069793          	slli	a5,a3,0x20
    80206638:	9381                	srli	a5,a5,0x20
    8020663a:	1702                	slli	a4,a4,0x20
    8020663c:	9301                	srli	a4,a4,0x20
    8020663e:	97ba                	add	a5,a5,a4
    80206640:	577d                	li	a4,-1
    80206642:	9301                	srli	a4,a4,0x20
    80206644:	0af76863          	bltu	a4,a5,802066f4 <ewrite+0xf4>
        || (entry->attribute & ATTR_READ_ONLY)) {
    80206648:	10054783          	lbu	a5,256(a0)
    8020664c:	8b85                	andi	a5,a5,1
    8020664e:	e7cd                	bnez	a5,802066f8 <ewrite+0xf8>
    if (entry->first_clus == 0) {   // so file_size if 0 too, which requests off == 0
    80206650:	10452783          	lw	a5,260(a0)
    80206654:	cb89                	beqz	a5,80206666 <ewrite+0x66>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206656:	080b0963          	beqz	s6,802066e8 <ewrite+0xe8>
    8020665a:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    8020665c:	00025c17          	auipc	s8,0x25
    80206660:	12cc0c13          	addi	s8,s8,300 # 8022b788 <fat>
    80206664:	a891                	j	802066b8 <ewrite+0xb8>
        entry->cur_clus = entry->first_clus = alloc_clus(entry->dev);
    80206666:	11454503          	lbu	a0,276(a0)
    8020666a:	fffff097          	auipc	ra,0xfffff
    8020666e:	6c8080e7          	jalr	1736(ra) # 80205d32 <alloc_clus>
    80206672:	2501                	sext.w	a0,a0
    80206674:	10aaa223          	sw	a0,260(s5)
    80206678:	10aaa623          	sw	a0,268(s5)
        entry->clus_cnt = 0;
    8020667c:	100aa823          	sw	zero,272(s5)
        entry->dirty = 1;
    80206680:	4785                	li	a5,1
    80206682:	10fa8aa3          	sb	a5,277(s5)
    80206686:	bfc1                	j	80206656 <ewrite+0x56>
    80206688:	00048c9b          	sext.w	s9,s1
        if (rw_clus(entry->cur_clus, 1, user_src, src, off % fat.byts_per_clus, m) != m) {
    8020668c:	87e6                	mv	a5,s9
    8020668e:	86d2                	mv	a3,s4
    80206690:	865e                	mv	a2,s7
    80206692:	4585                	li	a1,1
    80206694:	10caa503          	lw	a0,268(s5)
    80206698:	00000097          	auipc	ra,0x0
    8020669c:	964080e7          	jalr	-1692(ra) # 80205ffc <rw_clus>
    802066a0:	2501                	sext.w	a0,a0
    802066a2:	04ac9d63          	bne	s9,a0,802066fc <ewrite+0xfc>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    802066a6:	013489bb          	addw	s3,s1,s3
    802066aa:	0124893b          	addw	s2,s1,s2
    802066ae:	1482                	slli	s1,s1,0x20
    802066b0:	9081                	srli	s1,s1,0x20
    802066b2:	9a26                	add	s4,s4,s1
    802066b4:	0569f463          	bgeu	s3,s6,802066fc <ewrite+0xfc>
        reloc_clus(entry, off, 1);
    802066b8:	4605                	li	a2,1
    802066ba:	85ca                	mv	a1,s2
    802066bc:	8556                	mv	a0,s5
    802066be:	00000097          	auipc	ra,0x0
    802066c2:	834080e7          	jalr	-1996(ra) # 80205ef2 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    802066c6:	00cc2783          	lw	a5,12(s8)
    802066ca:	02f976bb          	remuw	a3,s2,a5
    802066ce:	0006871b          	sext.w	a4,a3
    802066d2:	9f95                	subw	a5,a5,a3
        if (n - tot < m) {
    802066d4:	413b06bb          	subw	a3,s6,s3
    802066d8:	84b6                	mv	s1,a3
    802066da:	2681                	sext.w	a3,a3
    802066dc:	0007861b          	sext.w	a2,a5
    802066e0:	fad674e3          	bgeu	a2,a3,80206688 <ewrite+0x88>
    802066e4:	84be                	mv	s1,a5
    802066e6:	b74d                	j	80206688 <ewrite+0x88>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    802066e8:	89da                	mv	s3,s6
    802066ea:	a015                	j	8020670e <ewrite+0x10e>
        return -1;
    802066ec:	557d                	li	a0,-1
}
    802066ee:	8082                	ret
        return -1;
    802066f0:	557d                	li	a0,-1
    802066f2:	a005                	j	80206712 <ewrite+0x112>
    802066f4:	557d                	li	a0,-1
    802066f6:	a831                	j	80206712 <ewrite+0x112>
    802066f8:	557d                	li	a0,-1
    802066fa:	a821                	j	80206712 <ewrite+0x112>
        if(off > entry->file_size) {
    802066fc:	108aa783          	lw	a5,264(s5)
    80206700:	0127f763          	bgeu	a5,s2,8020670e <ewrite+0x10e>
            entry->file_size = off;
    80206704:	112aa423          	sw	s2,264(s5)
            entry->dirty = 1;
    80206708:	4785                	li	a5,1
    8020670a:	10fa8aa3          	sb	a5,277(s5)
    return tot;
    8020670e:	0009851b          	sext.w	a0,s3
}
    80206712:	60e6                	ld	ra,88(sp)
    80206714:	6446                	ld	s0,80(sp)
    80206716:	64a6                	ld	s1,72(sp)
    80206718:	6906                	ld	s2,64(sp)
    8020671a:	79e2                	ld	s3,56(sp)
    8020671c:	7a42                	ld	s4,48(sp)
    8020671e:	7aa2                	ld	s5,40(sp)
    80206720:	7b02                	ld	s6,32(sp)
    80206722:	6be2                	ld	s7,24(sp)
    80206724:	6c42                	ld	s8,16(sp)
    80206726:	6ca2                	ld	s9,8(sp)
    80206728:	6125                	addi	sp,sp,96
    8020672a:	8082                	ret

000000008020672c <formatname>:
{
    8020672c:	7179                	addi	sp,sp,-48
    8020672e:	f406                	sd	ra,40(sp)
    80206730:	f022                	sd	s0,32(sp)
    80206732:	ec26                	sd	s1,24(sp)
    80206734:	e84a                	sd	s2,16(sp)
    80206736:	e44e                	sd	s3,8(sp)
    80206738:	e052                	sd	s4,0(sp)
    8020673a:	1800                	addi	s0,sp,48
    8020673c:	84aa                	mv	s1,a0
    while (*name == ' ' || *name == '.') { name++; }
    8020673e:	02000793          	li	a5,32
    80206742:	02e00713          	li	a4,46
    80206746:	a011                	j	8020674a <formatname+0x1e>
    80206748:	0485                	addi	s1,s1,1
    8020674a:	0004c583          	lbu	a1,0(s1)
    8020674e:	fef58de3          	beq	a1,a5,80206748 <formatname+0x1c>
    80206752:	fee58be3          	beq	a1,a4,80206748 <formatname+0x1c>
    for (p = name; *p; p++) {
    80206756:	c1b9                	beqz	a1,8020679c <formatname+0x70>
    80206758:	8926                	mv	s2,s1
        if (c < 0x20 || strchr(illegal, c)) {
    8020675a:	49fd                	li	s3,31
    8020675c:	00007a17          	auipc	s4,0x7
    80206760:	93ca0a13          	addi	s4,s4,-1732 # 8020d098 <illegal.1646>
    80206764:	02b9fe63          	bgeu	s3,a1,802067a0 <formatname+0x74>
    80206768:	8552                	mv	a0,s4
    8020676a:	ffffa097          	auipc	ra,0xffffa
    8020676e:	264080e7          	jalr	612(ra) # 802009ce <strchr>
    80206772:	e121                	bnez	a0,802067b2 <formatname+0x86>
    for (p = name; *p; p++) {
    80206774:	0905                	addi	s2,s2,1
    80206776:	00094583          	lbu	a1,0(s2)
    8020677a:	f5ed                	bnez	a1,80206764 <formatname+0x38>
        if (*p != ' ') {
    8020677c:	02000693          	li	a3,32
    80206780:	874a                	mv	a4,s2
    while (p-- > name) {
    80206782:	0124fb63          	bgeu	s1,s2,80206798 <formatname+0x6c>
        if (*p != ' ') {
    80206786:	197d                	addi	s2,s2,-1
    80206788:	00094783          	lbu	a5,0(s2)
    8020678c:	fed78ae3          	beq	a5,a3,80206780 <formatname+0x54>
            p[1] = '\0';
    80206790:	00070023          	sb	zero,0(a4)
            break;
    80206794:	8526                	mv	a0,s1
    80206796:	a031                	j	802067a2 <formatname+0x76>
    80206798:	8526                	mv	a0,s1
    8020679a:	a021                	j	802067a2 <formatname+0x76>
    for (p = name; *p; p++) {
    8020679c:	8526                	mv	a0,s1
    8020679e:	a011                	j	802067a2 <formatname+0x76>
            return 0;
    802067a0:	4501                	li	a0,0
}
    802067a2:	70a2                	ld	ra,40(sp)
    802067a4:	7402                	ld	s0,32(sp)
    802067a6:	64e2                	ld	s1,24(sp)
    802067a8:	6942                	ld	s2,16(sp)
    802067aa:	69a2                	ld	s3,8(sp)
    802067ac:	6a02                	ld	s4,0(sp)
    802067ae:	6145                	addi	sp,sp,48
    802067b0:	8082                	ret
            return 0;
    802067b2:	4501                	li	a0,0
    802067b4:	b7fd                	j	802067a2 <formatname+0x76>

00000000802067b6 <cal_checksum>:
{
    802067b6:	1141                	addi	sp,sp,-16
    802067b8:	e422                	sd	s0,8(sp)
    802067ba:	0800                	addi	s0,sp,16
    802067bc:	87aa                	mv	a5,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    802067be:	00b50613          	addi	a2,a0,11
    uint8 sum = 0;
    802067c2:	4501                	li	a0,0
        sum = ((sum & 1) ? 0x80 : 0) + (sum >> 1) + *shortname++;
    802067c4:	0075171b          	slliw	a4,a0,0x7
    802067c8:	0785                	addi	a5,a5,1
    802067ca:	0015551b          	srliw	a0,a0,0x1
    802067ce:	fff7c683          	lbu	a3,-1(a5) # fffffff <_entry-0x70200001>
    802067d2:	9d35                	addw	a0,a0,a3
    802067d4:	953a                	add	a0,a0,a4
    802067d6:	0ff57513          	andi	a0,a0,255
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    802067da:	fef615e3          	bne	a2,a5,802067c4 <cal_checksum+0xe>
}
    802067de:	6422                	ld	s0,8(sp)
    802067e0:	0141                	addi	sp,sp,16
    802067e2:	8082                	ret

00000000802067e4 <emake>:
{
    802067e4:	7131                	addi	sp,sp,-192
    802067e6:	fd06                	sd	ra,184(sp)
    802067e8:	f922                	sd	s0,176(sp)
    802067ea:	f526                	sd	s1,168(sp)
    802067ec:	f14a                	sd	s2,160(sp)
    802067ee:	ed4e                	sd	s3,152(sp)
    802067f0:	e952                	sd	s4,144(sp)
    802067f2:	e556                	sd	s5,136(sp)
    802067f4:	e15a                	sd	s6,128(sp)
    802067f6:	fcde                	sd	s7,120(sp)
    802067f8:	f8e2                	sd	s8,112(sp)
    802067fa:	f4e6                	sd	s9,104(sp)
    802067fc:	f0ea                	sd	s10,96(sp)
    802067fe:	ecee                	sd	s11,88(sp)
    80206800:	0180                	addi	s0,sp,192
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206802:	10054783          	lbu	a5,256(a0)
    80206806:	8bc1                	andi	a5,a5,16
    80206808:	c3d5                	beqz	a5,802068ac <emake+0xc8>
    8020680a:	8b2a                	mv	s6,a0
    8020680c:	8d2e                	mv	s10,a1
    8020680e:	8cb2                	mv	s9,a2
    if (off % sizeof(union dentry))
    80206810:	01f67793          	andi	a5,a2,31
    80206814:	e7c5                	bnez	a5,802068bc <emake+0xd8>
    memset(&de, 0, sizeof(de));
    80206816:	02000613          	li	a2,32
    8020681a:	4581                	li	a1,0
    8020681c:	f7040513          	addi	a0,s0,-144
    80206820:	ffffa097          	auipc	ra,0xffffa
    80206824:	f44080e7          	jalr	-188(ra) # 80200764 <memset>
    if (off <= 32) {
    80206828:	02000793          	li	a5,32
    8020682c:	0b97ec63          	bltu	a5,s9,802068e4 <emake+0x100>
        if (off == 0) {
    80206830:	080c9e63          	bnez	s9,802068cc <emake+0xe8>
            strncpy(de.sne.name, ".          ", sizeof(de.sne.name));
    80206834:	462d                	li	a2,11
    80206836:	00004597          	auipc	a1,0x4
    8020683a:	4e258593          	addi	a1,a1,1250 # 8020ad18 <digits+0x998>
    8020683e:	f7040513          	addi	a0,s0,-144
    80206842:	ffffa097          	auipc	ra,0xffffa
    80206846:	03a080e7          	jalr	58(ra) # 8020087c <strncpy>
        de.sne.attr = ATTR_DIRECTORY;
    8020684a:	47c1                	li	a5,16
    8020684c:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);        // first clus high 16 bits
    80206850:	104d2783          	lw	a5,260(s10)
    80206854:	0107d71b          	srliw	a4,a5,0x10
    80206858:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);       // low 16 bits
    8020685c:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = 0;                                       // filesize is updated in eupdate()
    80206860:	f8042623          	sw	zero,-116(s0)
        off = reloc_clus(dp, off, 1);
    80206864:	4605                	li	a2,1
    80206866:	85e6                	mv	a1,s9
    80206868:	855a                	mv	a0,s6
    8020686a:	fffff097          	auipc	ra,0xfffff
    8020686e:	688080e7          	jalr	1672(ra) # 80205ef2 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206872:	02000793          	li	a5,32
    80206876:	0005071b          	sext.w	a4,a0
    8020687a:	f7040693          	addi	a3,s0,-144
    8020687e:	4601                	li	a2,0
    80206880:	4585                	li	a1,1
    80206882:	10cb2503          	lw	a0,268(s6)
    80206886:	fffff097          	auipc	ra,0xfffff
    8020688a:	776080e7          	jalr	1910(ra) # 80205ffc <rw_clus>
}
    8020688e:	70ea                	ld	ra,184(sp)
    80206890:	744a                	ld	s0,176(sp)
    80206892:	74aa                	ld	s1,168(sp)
    80206894:	790a                	ld	s2,160(sp)
    80206896:	69ea                	ld	s3,152(sp)
    80206898:	6a4a                	ld	s4,144(sp)
    8020689a:	6aaa                	ld	s5,136(sp)
    8020689c:	6b0a                	ld	s6,128(sp)
    8020689e:	7be6                	ld	s7,120(sp)
    802068a0:	7c46                	ld	s8,112(sp)
    802068a2:	7ca6                	ld	s9,104(sp)
    802068a4:	7d06                	ld	s10,96(sp)
    802068a6:	6de6                	ld	s11,88(sp)
    802068a8:	6129                	addi	sp,sp,192
    802068aa:	8082                	ret
        panic("emake: not dir");
    802068ac:	00004517          	auipc	a0,0x4
    802068b0:	44450513          	addi	a0,a0,1092 # 8020acf0 <digits+0x970>
    802068b4:	ffffa097          	auipc	ra,0xffffa
    802068b8:	88e080e7          	jalr	-1906(ra) # 80200142 <panic>
        panic("emake: not aligned");
    802068bc:	00004517          	auipc	a0,0x4
    802068c0:	44450513          	addi	a0,a0,1092 # 8020ad00 <digits+0x980>
    802068c4:	ffffa097          	auipc	ra,0xffffa
    802068c8:	87e080e7          	jalr	-1922(ra) # 80200142 <panic>
            strncpy(de.sne.name, "..         ", sizeof(de.sne.name));
    802068cc:	462d                	li	a2,11
    802068ce:	00004597          	auipc	a1,0x4
    802068d2:	45a58593          	addi	a1,a1,1114 # 8020ad28 <digits+0x9a8>
    802068d6:	f7040513          	addi	a0,s0,-144
    802068da:	ffffa097          	auipc	ra,0xffffa
    802068de:	fa2080e7          	jalr	-94(ra) # 8020087c <strncpy>
    802068e2:	b7a5                	j	8020684a <emake+0x66>
        int entcnt = (strlen(ep->filename) + CHAR_LONG_NAME - 1) / CHAR_LONG_NAME;   // count of l-n-entries, rounds up
    802068e4:	896a                	mv	s2,s10
    802068e6:	856a                	mv	a0,s10
    802068e8:	ffffa097          	auipc	ra,0xffffa
    802068ec:	004080e7          	jalr	4(ra) # 802008ec <strlen>
    802068f0:	f4a43823          	sd	a0,-176(s0)
    802068f4:	00c5071b          	addiw	a4,a0,12
    802068f8:	47b5                	li	a5,13
    802068fa:	02f747bb          	divw	a5,a4,a5
    802068fe:	f4f42c23          	sw	a5,-168(s0)
    80206902:	00078d9b          	sext.w	s11,a5
        memset(shortname, 0, sizeof(shortname));
    80206906:	4631                	li	a2,12
    80206908:	4581                	li	a1,0
    8020690a:	f6040513          	addi	a0,s0,-160
    8020690e:	ffffa097          	auipc	ra,0xffffa
    80206912:	e56080e7          	jalr	-426(ra) # 80200764 <memset>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80206916:	856a                	mv	a0,s10
    80206918:	ffffa097          	auipc	ra,0xffffa
    8020691c:	fd4080e7          	jalr	-44(ra) # 802008ec <strlen>
    80206920:	fff5079b          	addiw	a5,a0,-1
    80206924:	0407c063          	bltz	a5,80206964 <emake+0x180>
    80206928:	97ea                	add	a5,a5,s10
    8020692a:	ffed0693          	addi	a3,s10,-2
    8020692e:	96aa                	add	a3,a3,a0
    80206930:	fff5071b          	addiw	a4,a0,-1
    80206934:	1702                	slli	a4,a4,0x20
    80206936:	9301                	srli	a4,a4,0x20
    80206938:	8e99                	sub	a3,a3,a4
        if (name[j] == '.') {
    8020693a:	02e00613          	li	a2,46
    8020693e:	89be                	mv	s3,a5
    80206940:	0007c703          	lbu	a4,0(a5)
    80206944:	00c70663          	beq	a4,a2,80206950 <emake+0x16c>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80206948:	17fd                	addi	a5,a5,-1
    8020694a:	fed79ae3          	bne	a5,a3,8020693e <emake+0x15a>
    char c, *p = name;
    8020694e:	89ea                	mv	s3,s10
        shortname[i++] = c;
    80206950:	4481                	li	s1,0
        if (i == 8 && p) {
    80206952:	4aa1                	li	s5,8
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206954:	4ba9                	li	s7,10
        if (c == '.') {
    80206956:	02e00c13          	li	s8,46
                memset(shortname + i, ' ', 8 - i);
    8020695a:	f6040793          	addi	a5,s0,-160
    8020695e:	f4f43423          	sd	a5,-184(s0)
    80206962:	a0f1                	j	80206a2e <emake+0x24a>
    char c, *p = name;
    80206964:	89ea                	mv	s3,s10
    80206966:	b7ed                	j	80206950 <emake+0x16c>
        if (i == 8 && p) {
    80206968:	22098163          	beqz	s3,80206b8a <emake+0x3a6>
            if (p + 1 < name) { break; }            // no '.'
    8020696c:	0985                	addi	s3,s3,1
    8020696e:	0949f763          	bgeu	s3,s4,802069fc <emake+0x218>
    80206972:	f6040793          	addi	a5,s0,-160
    80206976:	97a6                	add	a5,a5,s1
        shortname[i++] = ' ';
    80206978:	02000693          	li	a3,32
    while (i < CHAR_SHORT_NAME) {
    8020697c:	4729                	li	a4,10
        shortname[i++] = ' ';
    8020697e:	2485                	addiw	s1,s1,1
    80206980:	00d78023          	sb	a3,0(a5)
    while (i < CHAR_SHORT_NAME) {
    80206984:	0785                	addi	a5,a5,1
    80206986:	fe975ce3          	bge	a4,s1,8020697e <emake+0x19a>
        de.lne.checksum = cal_checksum((uchar *)shortname);
    8020698a:	f6040513          	addi	a0,s0,-160
    8020698e:	00000097          	auipc	ra,0x0
    80206992:	e28080e7          	jalr	-472(ra) # 802067b6 <cal_checksum>
    80206996:	f6a40ea3          	sb	a0,-131(s0)
        de.lne.attr = ATTR_LONG_NAME;
    8020699a:	47bd                	li	a5,15
    8020699c:	f6f40da3          	sb	a5,-133(s0)
        for (int i = entcnt; i > 0; i--) {
    802069a0:	f5043783          	ld	a5,-176(s0)
    802069a4:	0ef05f63          	blez	a5,80206aa2 <emake+0x2be>
    802069a8:	f5842783          	lw	a5,-168(s0)
    802069ac:	37fd                	addiw	a5,a5,-1
    802069ae:	f4f42423          	sw	a5,-184(s0)
    802069b2:	00179b9b          	slliw	s7,a5,0x1
    802069b6:	00fb8bbb          	addw	s7,s7,a5
    802069ba:	002b9b9b          	slliw	s7,s7,0x2
    802069be:	00fb8bbb          	addw	s7,s7,a5
    802069c2:	9bea                	add	s7,s7,s10
    802069c4:	8a6e                	mv	s4,s11
    802069c6:	8c66                	mv	s8,s9
            uint8 *w = (uint8 *)de.lne.name1;
    802069c8:	f7140793          	addi	a5,s0,-143
    802069cc:	f4f43c23          	sd	a5,-168(s0)
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    802069d0:	597d                	li	s2,-1
                switch (j) {
    802069d2:	44ad                	li	s1,11
                    case 5:     w = (uint8 *)de.lne.name2; break;
    802069d4:	f7e40a93          	addi	s5,s0,-130
                switch (j) {
    802069d8:	f8c40993          	addi	s3,s0,-116
    802069dc:	aa41                	j	80206b6c <emake+0x388>
            if (name > p) {                    // last '.'
    802069de:	0549f563          	bgeu	s3,s4,80206a28 <emake+0x244>
                memset(shortname + i, ' ', 8 - i);
    802069e2:	4621                	li	a2,8
    802069e4:	9e05                	subw	a2,a2,s1
    802069e6:	02000593          	li	a1,32
    802069ea:	f4843783          	ld	a5,-184(s0)
    802069ee:	00978533          	add	a0,a5,s1
    802069f2:	ffffa097          	auipc	ra,0xffffa
    802069f6:	d72080e7          	jalr	-654(ra) # 80200764 <memset>
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    802069fa:	89d2                	mv	s3,s4
        shortname[i++] = c;
    802069fc:	8a4e                	mv	s4,s3
    802069fe:	84d6                	mv	s1,s5
    80206a00:	4981                	li	s3,0
    80206a02:	a02d                	j	80206a2c <emake+0x248>
            if (strchr(illegal, c) != NULL) {
    80206a04:	85ca                	mv	a1,s2
    80206a06:	00006517          	auipc	a0,0x6
    80206a0a:	6a250513          	addi	a0,a0,1698 # 8020d0a8 <illegal.1662>
    80206a0e:	ffffa097          	auipc	ra,0xffffa
    80206a12:	fc0080e7          	jalr	-64(ra) # 802009ce <strchr>
    80206a16:	c119                	beqz	a0,80206a1c <emake+0x238>
                c = '_';
    80206a18:	05f00913          	li	s2,95
        shortname[i++] = c;
    80206a1c:	f9040793          	addi	a5,s0,-112
    80206a20:	97a6                	add	a5,a5,s1
    80206a22:	fd278823          	sb	s2,-48(a5)
    80206a26:	2485                	addiw	s1,s1,1
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206a28:	f69bc1e3          	blt	s7,s1,8020698a <emake+0x1a6>
        shortname[i++] = c;
    80206a2c:	8952                	mv	s2,s4
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206a2e:	00190a13          	addi	s4,s2,1
    80206a32:	00094903          	lbu	s2,0(s2)
    80206a36:	02090563          	beqz	s2,80206a60 <emake+0x27c>
        if (i == 8 && p) {
    80206a3a:	f35487e3          	beq	s1,s5,80206968 <emake+0x184>
        if (c == ' ') { continue; }
    80206a3e:	02000793          	li	a5,32
    80206a42:	fef903e3          	beq	s2,a5,80206a28 <emake+0x244>
        if (c == '.') {
    80206a46:	f9890ce3          	beq	s2,s8,802069de <emake+0x1fa>
        if (c >= 'a' && c <= 'z') {
    80206a4a:	f9f9079b          	addiw	a5,s2,-97
    80206a4e:	0ff7f793          	andi	a5,a5,255
    80206a52:	4765                	li	a4,25
    80206a54:	faf768e3          	bltu	a4,a5,80206a04 <emake+0x220>
            c += 'A' - 'a';
    80206a58:	3901                	addiw	s2,s2,-32
    80206a5a:	0ff97913          	andi	s2,s2,255
    80206a5e:	bf7d                	j	80206a1c <emake+0x238>
    while (i < CHAR_SHORT_NAME) {
    80206a60:	47a9                	li	a5,10
    80206a62:	f097d8e3          	bge	a5,s1,80206972 <emake+0x18e>
    80206a66:	b715                	j	8020698a <emake+0x1a6>
                de.lne.order |= LAST_LONG_ENTRY;
    80206a68:	0407e793          	ori	a5,a5,64
    80206a6c:	f6f40823          	sb	a5,-144(s0)
    80206a70:	a221                	j	80206b78 <emake+0x394>
                    if ((*w++ = *p++) == 0) {
    80206a72:	0005c683          	lbu	a3,0(a1)
    80206a76:	00d78023          	sb	a3,0(a5)
                        end = 1;
    80206a7a:	0016b693          	seqz	a3,a3
                    *w++ = 0;
    80206a7e:	000780a3          	sb	zero,1(a5)
    80206a82:	0789                	addi	a5,a5,2
                    if ((*w++ = *p++) == 0) {
    80206a84:	0585                	addi	a1,a1,1
    80206a86:	a04d                	j	80206b28 <emake+0x344>
    80206a88:	020c8c9b          	addiw	s9,s9,32
    80206a8c:	4781                	li	a5,0
    80206a8e:	f5043703          	ld	a4,-176(s0)
    80206a92:	00e05663          	blez	a4,80206a9e <emake+0x2ba>
    80206a96:	f4842783          	lw	a5,-184(s0)
    80206a9a:	0057979b          	slliw	a5,a5,0x5
    80206a9e:	01978cbb          	addw	s9,a5,s9
        memset(&de, 0, sizeof(de));
    80206aa2:	02000613          	li	a2,32
    80206aa6:	4581                	li	a1,0
    80206aa8:	f7040493          	addi	s1,s0,-144
    80206aac:	8526                	mv	a0,s1
    80206aae:	ffffa097          	auipc	ra,0xffffa
    80206ab2:	cb6080e7          	jalr	-842(ra) # 80200764 <memset>
        strncpy(de.sne.name, shortname, sizeof(de.sne.name));
    80206ab6:	462d                	li	a2,11
    80206ab8:	f6040593          	addi	a1,s0,-160
    80206abc:	8526                	mv	a0,s1
    80206abe:	ffffa097          	auipc	ra,0xffffa
    80206ac2:	dbe080e7          	jalr	-578(ra) # 8020087c <strncpy>
        de.sne.attr = ep->attribute;
    80206ac6:	100d4783          	lbu	a5,256(s10)
    80206aca:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);      // first clus high 16 bits
    80206ace:	104d2783          	lw	a5,260(s10)
    80206ad2:	0107d71b          	srliw	a4,a5,0x10
    80206ad6:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);     // low 16 bits
    80206ada:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = ep->file_size;                         // filesize is updated in eupdate()
    80206ade:	108d2783          	lw	a5,264(s10)
    80206ae2:	f8f42623          	sw	a5,-116(s0)
        off = reloc_clus(dp, off, 1);
    80206ae6:	4605                	li	a2,1
    80206ae8:	85e6                	mv	a1,s9
    80206aea:	855a                	mv	a0,s6
    80206aec:	fffff097          	auipc	ra,0xfffff
    80206af0:	406080e7          	jalr	1030(ra) # 80205ef2 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206af4:	02000793          	li	a5,32
    80206af8:	0005071b          	sext.w	a4,a0
    80206afc:	86a6                	mv	a3,s1
    80206afe:	4601                	li	a2,0
    80206b00:	4585                	li	a1,1
    80206b02:	10cb2503          	lw	a0,268(s6)
    80206b06:	fffff097          	auipc	ra,0xfffff
    80206b0a:	4f6080e7          	jalr	1270(ra) # 80205ffc <rw_clus>
}
    80206b0e:	b341                	j	8020688e <emake+0xaa>
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80206b10:	87d6                	mv	a5,s5
    80206b12:	a011                	j	80206b16 <emake+0x332>
                switch (j) {
    80206b14:	87ce                	mv	a5,s3
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206b16:	2705                	addiw	a4,a4,1
    80206b18:	fff7061b          	addiw	a2,a4,-1
                if (end) {
    80206b1c:	dab9                	beqz	a3,80206a72 <emake+0x28e>
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    80206b1e:	01278023          	sb	s2,0(a5)
                    *w++ = 0xff;
    80206b22:	012780a3          	sb	s2,1(a5)
    80206b26:	0789                	addi	a5,a5,2
                switch (j) {
    80206b28:	fea604e3          	beq	a2,a0,80206b10 <emake+0x32c>
    80206b2c:	fe9604e3          	beq	a2,s1,80206b14 <emake+0x330>
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206b30:	0007061b          	sext.w	a2,a4
    80206b34:	fec851e3          	bge	a6,a2,80206b16 <emake+0x332>
            uint off2 = reloc_clus(dp, off, 1);
    80206b38:	4605                	li	a2,1
    80206b3a:	85e2                	mv	a1,s8
    80206b3c:	855a                	mv	a0,s6
    80206b3e:	fffff097          	auipc	ra,0xfffff
    80206b42:	3b4080e7          	jalr	948(ra) # 80205ef2 <reloc_clus>
            rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off2, sizeof(de));
    80206b46:	02000793          	li	a5,32
    80206b4a:	0005071b          	sext.w	a4,a0
    80206b4e:	f7040693          	addi	a3,s0,-144
    80206b52:	4601                	li	a2,0
    80206b54:	4585                	li	a1,1
    80206b56:	10cb2503          	lw	a0,268(s6)
    80206b5a:	fffff097          	auipc	ra,0xfffff
    80206b5e:	4a2080e7          	jalr	1186(ra) # 80205ffc <rw_clus>
            off += sizeof(de);
    80206b62:	020c0c1b          	addiw	s8,s8,32
        for (int i = entcnt; i > 0; i--) {
    80206b66:	1bcd                	addi	s7,s7,-13
    80206b68:	f34050e3          	blez	s4,80206a88 <emake+0x2a4>
            if ((de.lne.order = i) == entcnt) {
    80206b6c:	0ffa7793          	andi	a5,s4,255
    80206b70:	eefd8ce3          	beq	s11,a5,80206a68 <emake+0x284>
    80206b74:	f6f40823          	sb	a5,-144(s0)
            char *p = ep->filename + (i - 1) * CHAR_LONG_NAME;
    80206b78:	3a7d                	addiw	s4,s4,-1
    80206b7a:	85de                	mv	a1,s7
    80206b7c:	4709                	li	a4,2
            int end = 0;
    80206b7e:	4681                	li	a3,0
            uint8 *w = (uint8 *)de.lne.name1;
    80206b80:	f5843783          	ld	a5,-168(s0)
                switch (j) {
    80206b84:	4515                	li	a0,5
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206b86:	4835                	li	a6,13
    80206b88:	bf41                	j	80206b18 <emake+0x334>
        if (c == ' ') { continue; }
    80206b8a:	02000793          	li	a5,32
    80206b8e:	eaf91ce3          	bne	s2,a5,80206a46 <emake+0x262>
    80206b92:	bd69                	j	80206a2c <emake+0x248>

0000000080206b94 <edup>:
{
    80206b94:	1101                	addi	sp,sp,-32
    80206b96:	ec06                	sd	ra,24(sp)
    80206b98:	e822                	sd	s0,16(sp)
    80206b9a:	e426                	sd	s1,8(sp)
    80206b9c:	1000                	addi	s0,sp,32
    80206b9e:	84aa                	mv	s1,a0
    if (entry != 0) {
    80206ba0:	c515                	beqz	a0,80206bcc <edup+0x38>
        acquire(&ecache.lock);
    80206ba2:	00025517          	auipc	a0,0x25
    80206ba6:	d7650513          	addi	a0,a0,-650 # 8022b918 <ecache>
    80206baa:	ffffa097          	auipc	ra,0xffffa
    80206bae:	b1e080e7          	jalr	-1250(ra) # 802006c8 <acquire>
        entry->ref++;
    80206bb2:	1184a783          	lw	a5,280(s1)
    80206bb6:	2785                	addiw	a5,a5,1
    80206bb8:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    80206bbc:	00025517          	auipc	a0,0x25
    80206bc0:	d5c50513          	addi	a0,a0,-676 # 8022b918 <ecache>
    80206bc4:	ffffa097          	auipc	ra,0xffffa
    80206bc8:	b58080e7          	jalr	-1192(ra) # 8020071c <release>
}
    80206bcc:	8526                	mv	a0,s1
    80206bce:	60e2                	ld	ra,24(sp)
    80206bd0:	6442                	ld	s0,16(sp)
    80206bd2:	64a2                	ld	s1,8(sp)
    80206bd4:	6105                	addi	sp,sp,32
    80206bd6:	8082                	ret

0000000080206bd8 <eupdate>:
    if (!entry->dirty || entry->valid != 1) { return; }
    80206bd8:	11554783          	lbu	a5,277(a0)
    80206bdc:	c3e5                	beqz	a5,80206cbc <eupdate+0xe4>
{
    80206bde:	711d                	addi	sp,sp,-96
    80206be0:	ec86                	sd	ra,88(sp)
    80206be2:	e8a2                	sd	s0,80(sp)
    80206be4:	e4a6                	sd	s1,72(sp)
    80206be6:	e0ca                	sd	s2,64(sp)
    80206be8:	fc4e                	sd	s3,56(sp)
    80206bea:	1080                	addi	s0,sp,96
    80206bec:	84aa                	mv	s1,a0
    if (!entry->dirty || entry->valid != 1) { return; }
    80206bee:	11651703          	lh	a4,278(a0)
    80206bf2:	4785                	li	a5,1
    80206bf4:	00f70963          	beq	a4,a5,80206c06 <eupdate+0x2e>
}
    80206bf8:	60e6                	ld	ra,88(sp)
    80206bfa:	6446                	ld	s0,80(sp)
    80206bfc:	64a6                	ld	s1,72(sp)
    80206bfe:	6906                	ld	s2,64(sp)
    80206c00:	79e2                	ld	s3,56(sp)
    80206c02:	6125                	addi	sp,sp,96
    80206c04:	8082                	ret
    uint entcnt = 0;
    80206c06:	fc042623          	sw	zero,-52(s0)
    uint32 off = reloc_clus(entry->parent, entry->off, 0);
    80206c0a:	4601                	li	a2,0
    80206c0c:	11c52583          	lw	a1,284(a0)
    80206c10:	12053503          	ld	a0,288(a0)
    80206c14:	fffff097          	auipc	ra,0xfffff
    80206c18:	2de080e7          	jalr	734(ra) # 80205ef2 <reloc_clus>
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off, 1);
    80206c1c:	1204b803          	ld	a6,288(s1)
    80206c20:	4785                	li	a5,1
    80206c22:	0005071b          	sext.w	a4,a0
    80206c26:	fcc40693          	addi	a3,s0,-52
    80206c2a:	4601                	li	a2,0
    80206c2c:	4581                	li	a1,0
    80206c2e:	10c82503          	lw	a0,268(a6)
    80206c32:	fffff097          	auipc	ra,0xfffff
    80206c36:	3ca080e7          	jalr	970(ra) # 80205ffc <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    80206c3a:	fcc42583          	lw	a1,-52(s0)
    80206c3e:	fbf5f593          	andi	a1,a1,-65
    80206c42:	fcb42623          	sw	a1,-52(s0)
    off = reloc_clus(entry->parent, entry->off + (entcnt << 5), 0);
    80206c46:	0055959b          	slliw	a1,a1,0x5
    80206c4a:	11c4a783          	lw	a5,284(s1)
    80206c4e:	4601                	li	a2,0
    80206c50:	9dbd                	addw	a1,a1,a5
    80206c52:	1204b503          	ld	a0,288(s1)
    80206c56:	fffff097          	auipc	ra,0xfffff
    80206c5a:	29c080e7          	jalr	668(ra) # 80205ef2 <reloc_clus>
    80206c5e:	0005099b          	sext.w	s3,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64)&de, off, sizeof(de));
    80206c62:	1204b503          	ld	a0,288(s1)
    80206c66:	02000793          	li	a5,32
    80206c6a:	874e                	mv	a4,s3
    80206c6c:	fa840913          	addi	s2,s0,-88
    80206c70:	86ca                	mv	a3,s2
    80206c72:	4601                	li	a2,0
    80206c74:	4581                	li	a1,0
    80206c76:	10c52503          	lw	a0,268(a0)
    80206c7a:	fffff097          	auipc	ra,0xfffff
    80206c7e:	382080e7          	jalr	898(ra) # 80205ffc <rw_clus>
    de.sne.fst_clus_hi = (uint16)(entry->first_clus >> 16);
    80206c82:	1044a783          	lw	a5,260(s1)
    80206c86:	0107d71b          	srliw	a4,a5,0x10
    80206c8a:	fae41e23          	sh	a4,-68(s0)
    de.sne.fst_clus_lo = (uint16)(entry->first_clus & 0xffff);
    80206c8e:	fcf41123          	sh	a5,-62(s0)
    de.sne.file_size = entry->file_size;
    80206c92:	1084a783          	lw	a5,264(s1)
    80206c96:	fcf42223          	sw	a5,-60(s0)
    rw_clus(entry->parent->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206c9a:	1204b503          	ld	a0,288(s1)
    80206c9e:	02000793          	li	a5,32
    80206ca2:	874e                	mv	a4,s3
    80206ca4:	86ca                	mv	a3,s2
    80206ca6:	4601                	li	a2,0
    80206ca8:	4585                	li	a1,1
    80206caa:	10c52503          	lw	a0,268(a0)
    80206cae:	fffff097          	auipc	ra,0xfffff
    80206cb2:	34e080e7          	jalr	846(ra) # 80205ffc <rw_clus>
    entry->dirty = 0;
    80206cb6:	10048aa3          	sb	zero,277(s1)
    80206cba:	bf3d                	j	80206bf8 <eupdate+0x20>
    80206cbc:	8082                	ret

0000000080206cbe <eremove>:
    if (entry->valid != 1) { return; }
    80206cbe:	11651703          	lh	a4,278(a0)
    80206cc2:	4785                	li	a5,1
    80206cc4:	00f70363          	beq	a4,a5,80206cca <eremove+0xc>
    80206cc8:	8082                	ret
{
    80206cca:	715d                	addi	sp,sp,-80
    80206ccc:	e486                	sd	ra,72(sp)
    80206cce:	e0a2                	sd	s0,64(sp)
    80206cd0:	fc26                	sd	s1,56(sp)
    80206cd2:	f84a                	sd	s2,48(sp)
    80206cd4:	f44e                	sd	s3,40(sp)
    80206cd6:	f052                	sd	s4,32(sp)
    80206cd8:	ec56                	sd	s5,24(sp)
    80206cda:	0880                	addi	s0,sp,80
    80206cdc:	89aa                	mv	s3,a0
    uint entcnt = 0;
    80206cde:	fa042e23          	sw	zero,-68(s0)
    uint32 off = entry->off;
    80206ce2:	11c52a03          	lw	s4,284(a0)
    uint32 off2 = reloc_clus(entry->parent, off, 0);
    80206ce6:	4601                	li	a2,0
    80206ce8:	85d2                	mv	a1,s4
    80206cea:	12053503          	ld	a0,288(a0)
    80206cee:	fffff097          	auipc	ra,0xfffff
    80206cf2:	204080e7          	jalr	516(ra) # 80205ef2 <reloc_clus>
    80206cf6:	0005049b          	sext.w	s1,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off2, 1);
    80206cfa:	1209b503          	ld	a0,288(s3)
    80206cfe:	4785                	li	a5,1
    80206d00:	8726                	mv	a4,s1
    80206d02:	fbc40693          	addi	a3,s0,-68
    80206d06:	4601                	li	a2,0
    80206d08:	4581                	li	a1,0
    80206d0a:	10c52503          	lw	a0,268(a0)
    80206d0e:	fffff097          	auipc	ra,0xfffff
    80206d12:	2ee080e7          	jalr	750(ra) # 80205ffc <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    80206d16:	fbc42783          	lw	a5,-68(s0)
    80206d1a:	fbf7f793          	andi	a5,a5,-65
    80206d1e:	faf42e23          	sw	a5,-68(s0)
    uint8 flag = EMPTY_ENTRY;
    80206d22:	5795                	li	a5,-27
    80206d24:	faf40da3          	sb	a5,-69(s0)
    for (int i = 0; i <= entcnt; i++) {
    80206d28:	4901                	li	s2,0
        rw_clus(entry->parent->cur_clus, 1, 0, (uint64) &flag, off2, 1);
    80206d2a:	fbb40a93          	addi	s5,s0,-69
    80206d2e:	1209b503          	ld	a0,288(s3)
    80206d32:	4785                	li	a5,1
    80206d34:	8726                	mv	a4,s1
    80206d36:	86d6                	mv	a3,s5
    80206d38:	4601                	li	a2,0
    80206d3a:	4585                	li	a1,1
    80206d3c:	10c52503          	lw	a0,268(a0)
    80206d40:	fffff097          	auipc	ra,0xfffff
    80206d44:	2bc080e7          	jalr	700(ra) # 80205ffc <rw_clus>
        off += 32;
    80206d48:	020a0a1b          	addiw	s4,s4,32
        off2 = reloc_clus(entry->parent, off, 0);
    80206d4c:	4601                	li	a2,0
    80206d4e:	85d2                	mv	a1,s4
    80206d50:	1209b503          	ld	a0,288(s3)
    80206d54:	fffff097          	auipc	ra,0xfffff
    80206d58:	19e080e7          	jalr	414(ra) # 80205ef2 <reloc_clus>
    80206d5c:	0005049b          	sext.w	s1,a0
    for (int i = 0; i <= entcnt; i++) {
    80206d60:	0019079b          	addiw	a5,s2,1
    80206d64:	0007891b          	sext.w	s2,a5
    80206d68:	fbc42703          	lw	a4,-68(s0)
    80206d6c:	fd2771e3          	bgeu	a4,s2,80206d2e <eremove+0x70>
    entry->valid = -1;
    80206d70:	57fd                	li	a5,-1
    80206d72:	10f99b23          	sh	a5,278(s3)
}
    80206d76:	60a6                	ld	ra,72(sp)
    80206d78:	6406                	ld	s0,64(sp)
    80206d7a:	74e2                	ld	s1,56(sp)
    80206d7c:	7942                	ld	s2,48(sp)
    80206d7e:	79a2                	ld	s3,40(sp)
    80206d80:	7a02                	ld	s4,32(sp)
    80206d82:	6ae2                	ld	s5,24(sp)
    80206d84:	6161                	addi	sp,sp,80
    80206d86:	8082                	ret

0000000080206d88 <etrunc>:
{
    80206d88:	7179                	addi	sp,sp,-48
    80206d8a:	f406                	sd	ra,40(sp)
    80206d8c:	f022                	sd	s0,32(sp)
    80206d8e:	ec26                	sd	s1,24(sp)
    80206d90:	e84a                	sd	s2,16(sp)
    80206d92:	e44e                	sd	s3,8(sp)
    80206d94:	e052                	sd	s4,0(sp)
    80206d96:	1800                	addi	s0,sp,48
    80206d98:	8a2a                	mv	s4,a0
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80206d9a:	10452483          	lw	s1,260(a0)
    80206d9e:	ffe4871b          	addiw	a4,s1,-2
    80206da2:	100007b7          	lui	a5,0x10000
    80206da6:	17d5                	addi	a5,a5,-11
    80206da8:	02e7e663          	bltu	a5,a4,80206dd4 <etrunc+0x4c>
    80206dac:	89be                	mv	s3,a5
        uint32 next = read_fat(clus);
    80206dae:	0004891b          	sext.w	s2,s1
    80206db2:	8526                	mv	a0,s1
    80206db4:	fffff097          	auipc	ra,0xfffff
    80206db8:	f0a080e7          	jalr	-246(ra) # 80205cbe <read_fat>
    80206dbc:	0005049b          	sext.w	s1,a0
    write_fat(cluster, 0);
    80206dc0:	4581                	li	a1,0
    80206dc2:	854a                	mv	a0,s2
    80206dc4:	fffff097          	auipc	ra,0xfffff
    80206dc8:	0ae080e7          	jalr	174(ra) # 80205e72 <write_fat>
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80206dcc:	ffe4879b          	addiw	a5,s1,-2
    80206dd0:	fcf9ffe3          	bgeu	s3,a5,80206dae <etrunc+0x26>
    entry->file_size = 0;
    80206dd4:	100a2423          	sw	zero,264(s4)
    entry->first_clus = 0;
    80206dd8:	100a2223          	sw	zero,260(s4)
    entry->dirty = 1;
    80206ddc:	4785                	li	a5,1
    80206dde:	10fa0aa3          	sb	a5,277(s4)
}
    80206de2:	70a2                	ld	ra,40(sp)
    80206de4:	7402                	ld	s0,32(sp)
    80206de6:	64e2                	ld	s1,24(sp)
    80206de8:	6942                	ld	s2,16(sp)
    80206dea:	69a2                	ld	s3,8(sp)
    80206dec:	6a02                	ld	s4,0(sp)
    80206dee:	6145                	addi	sp,sp,48
    80206df0:	8082                	ret

0000000080206df2 <elock>:
{
    80206df2:	1141                	addi	sp,sp,-16
    80206df4:	e406                	sd	ra,8(sp)
    80206df6:	e022                	sd	s0,0(sp)
    80206df8:	0800                	addi	s0,sp,16
    if (entry == 0 || entry->ref < 1)
    80206dfa:	cd19                	beqz	a0,80206e18 <elock+0x26>
    80206dfc:	11852783          	lw	a5,280(a0)
    80206e00:	00f05c63          	blez	a5,80206e18 <elock+0x26>
    acquiresleep(&entry->lock);
    80206e04:	13850513          	addi	a0,a0,312
    80206e08:	ffffd097          	auipc	ra,0xffffd
    80206e0c:	c8e080e7          	jalr	-882(ra) # 80203a96 <acquiresleep>
}
    80206e10:	60a2                	ld	ra,8(sp)
    80206e12:	6402                	ld	s0,0(sp)
    80206e14:	0141                	addi	sp,sp,16
    80206e16:	8082                	ret
        panic("elock");
    80206e18:	00004517          	auipc	a0,0x4
    80206e1c:	f2050513          	addi	a0,a0,-224 # 8020ad38 <digits+0x9b8>
    80206e20:	ffff9097          	auipc	ra,0xffff9
    80206e24:	322080e7          	jalr	802(ra) # 80200142 <panic>

0000000080206e28 <eunlock>:
{
    80206e28:	1101                	addi	sp,sp,-32
    80206e2a:	ec06                	sd	ra,24(sp)
    80206e2c:	e822                	sd	s0,16(sp)
    80206e2e:	e426                	sd	s1,8(sp)
    80206e30:	e04a                	sd	s2,0(sp)
    80206e32:	1000                	addi	s0,sp,32
    if (entry == 0 || !holdingsleep(&entry->lock) || entry->ref < 1)
    80206e34:	c90d                	beqz	a0,80206e66 <eunlock+0x3e>
    80206e36:	84aa                	mv	s1,a0
    80206e38:	13850913          	addi	s2,a0,312
    80206e3c:	854a                	mv	a0,s2
    80206e3e:	ffffd097          	auipc	ra,0xffffd
    80206e42:	cf2080e7          	jalr	-782(ra) # 80203b30 <holdingsleep>
    80206e46:	c105                	beqz	a0,80206e66 <eunlock+0x3e>
    80206e48:	1184a783          	lw	a5,280(s1)
    80206e4c:	00f05d63          	blez	a5,80206e66 <eunlock+0x3e>
    releasesleep(&entry->lock);
    80206e50:	854a                	mv	a0,s2
    80206e52:	ffffd097          	auipc	ra,0xffffd
    80206e56:	c9a080e7          	jalr	-870(ra) # 80203aec <releasesleep>
}
    80206e5a:	60e2                	ld	ra,24(sp)
    80206e5c:	6442                	ld	s0,16(sp)
    80206e5e:	64a2                	ld	s1,8(sp)
    80206e60:	6902                	ld	s2,0(sp)
    80206e62:	6105                	addi	sp,sp,32
    80206e64:	8082                	ret
        panic("eunlock");
    80206e66:	00004517          	auipc	a0,0x4
    80206e6a:	eda50513          	addi	a0,a0,-294 # 8020ad40 <digits+0x9c0>
    80206e6e:	ffff9097          	auipc	ra,0xffff9
    80206e72:	2d4080e7          	jalr	724(ra) # 80200142 <panic>

0000000080206e76 <eput>:
{
    80206e76:	1101                	addi	sp,sp,-32
    80206e78:	ec06                	sd	ra,24(sp)
    80206e7a:	e822                	sd	s0,16(sp)
    80206e7c:	e426                	sd	s1,8(sp)
    80206e7e:	e04a                	sd	s2,0(sp)
    80206e80:	1000                	addi	s0,sp,32
    80206e82:	84aa                	mv	s1,a0
    acquire(&ecache.lock);
    80206e84:	00025517          	auipc	a0,0x25
    80206e88:	a9450513          	addi	a0,a0,-1388 # 8022b918 <ecache>
    80206e8c:	ffffa097          	auipc	ra,0xffffa
    80206e90:	83c080e7          	jalr	-1988(ra) # 802006c8 <acquire>
    if (entry != &root && entry->valid != 0 && entry->ref == 1) {
    80206e94:	00025797          	auipc	a5,0x25
    80206e98:	91c78793          	addi	a5,a5,-1764 # 8022b7b0 <root>
    80206e9c:	00f48a63          	beq	s1,a5,80206eb0 <eput+0x3a>
    80206ea0:	11649783          	lh	a5,278(s1)
    80206ea4:	c791                	beqz	a5,80206eb0 <eput+0x3a>
    80206ea6:	1184a703          	lw	a4,280(s1)
    80206eaa:	4785                	li	a5,1
    80206eac:	02f70563          	beq	a4,a5,80206ed6 <eput+0x60>
    entry->ref--;
    80206eb0:	1184a783          	lw	a5,280(s1)
    80206eb4:	37fd                	addiw	a5,a5,-1
    80206eb6:	10f4ac23          	sw	a5,280(s1)
    release(&ecache.lock);
    80206eba:	00025517          	auipc	a0,0x25
    80206ebe:	a5e50513          	addi	a0,a0,-1442 # 8022b918 <ecache>
    80206ec2:	ffffa097          	auipc	ra,0xffffa
    80206ec6:	85a080e7          	jalr	-1958(ra) # 8020071c <release>
}
    80206eca:	60e2                	ld	ra,24(sp)
    80206ecc:	6442                	ld	s0,16(sp)
    80206ece:	64a2                	ld	s1,8(sp)
    80206ed0:	6902                	ld	s2,0(sp)
    80206ed2:	6105                	addi	sp,sp,32
    80206ed4:	8082                	ret
        acquiresleep(&entry->lock);
    80206ed6:	13848913          	addi	s2,s1,312
    80206eda:	854a                	mv	a0,s2
    80206edc:	ffffd097          	auipc	ra,0xffffd
    80206ee0:	bba080e7          	jalr	-1094(ra) # 80203a96 <acquiresleep>
        entry->next->prev = entry->prev;
    80206ee4:	1284b703          	ld	a4,296(s1)
    80206ee8:	1304b783          	ld	a5,304(s1)
    80206eec:	12f73823          	sd	a5,304(a4)
        entry->prev->next = entry->next;
    80206ef0:	1284b703          	ld	a4,296(s1)
    80206ef4:	12e7b423          	sd	a4,296(a5)
        entry->next = root.next;
    80206ef8:	00025797          	auipc	a5,0x25
    80206efc:	89078793          	addi	a5,a5,-1904 # 8022b788 <fat>
    80206f00:	1507b703          	ld	a4,336(a5)
    80206f04:	12e4b423          	sd	a4,296(s1)
        entry->prev = &root;
    80206f08:	00025697          	auipc	a3,0x25
    80206f0c:	8a868693          	addi	a3,a3,-1880 # 8022b7b0 <root>
    80206f10:	12d4b823          	sd	a3,304(s1)
        root.next->prev = entry;
    80206f14:	12973823          	sd	s1,304(a4)
        root.next = entry;
    80206f18:	1497b823          	sd	s1,336(a5)
        release(&ecache.lock);
    80206f1c:	00025517          	auipc	a0,0x25
    80206f20:	9fc50513          	addi	a0,a0,-1540 # 8022b918 <ecache>
    80206f24:	ffff9097          	auipc	ra,0xffff9
    80206f28:	7f8080e7          	jalr	2040(ra) # 8020071c <release>
        if (entry->valid == -1) {       // this means some one has called eremove()
    80206f2c:	11649703          	lh	a4,278(s1)
    80206f30:	57fd                	li	a5,-1
    80206f32:	06f70863          	beq	a4,a5,80206fa2 <eput+0x12c>
            elock(entry->parent);
    80206f36:	1204b503          	ld	a0,288(s1)
    80206f3a:	00000097          	auipc	ra,0x0
    80206f3e:	eb8080e7          	jalr	-328(ra) # 80206df2 <elock>
            eupdate(entry);
    80206f42:	8526                	mv	a0,s1
    80206f44:	00000097          	auipc	ra,0x0
    80206f48:	c94080e7          	jalr	-876(ra) # 80206bd8 <eupdate>
            eunlock(entry->parent);
    80206f4c:	1204b503          	ld	a0,288(s1)
    80206f50:	00000097          	auipc	ra,0x0
    80206f54:	ed8080e7          	jalr	-296(ra) # 80206e28 <eunlock>
        releasesleep(&entry->lock);
    80206f58:	854a                	mv	a0,s2
    80206f5a:	ffffd097          	auipc	ra,0xffffd
    80206f5e:	b92080e7          	jalr	-1134(ra) # 80203aec <releasesleep>
        struct dirent *eparent = entry->parent;
    80206f62:	1204b903          	ld	s2,288(s1)
        acquire(&ecache.lock);
    80206f66:	00025517          	auipc	a0,0x25
    80206f6a:	9b250513          	addi	a0,a0,-1614 # 8022b918 <ecache>
    80206f6e:	ffff9097          	auipc	ra,0xffff9
    80206f72:	75a080e7          	jalr	1882(ra) # 802006c8 <acquire>
        entry->ref--;
    80206f76:	1184a783          	lw	a5,280(s1)
    80206f7a:	37fd                	addiw	a5,a5,-1
    80206f7c:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    80206f80:	00025517          	auipc	a0,0x25
    80206f84:	99850513          	addi	a0,a0,-1640 # 8022b918 <ecache>
    80206f88:	ffff9097          	auipc	ra,0xffff9
    80206f8c:	794080e7          	jalr	1940(ra) # 8020071c <release>
        if (entry->ref == 0) {
    80206f90:	1184a783          	lw	a5,280(s1)
    80206f94:	fb9d                	bnez	a5,80206eca <eput+0x54>
            eput(eparent);
    80206f96:	854a                	mv	a0,s2
    80206f98:	00000097          	auipc	ra,0x0
    80206f9c:	ede080e7          	jalr	-290(ra) # 80206e76 <eput>
    80206fa0:	b72d                	j	80206eca <eput+0x54>
            etrunc(entry);
    80206fa2:	8526                	mv	a0,s1
    80206fa4:	00000097          	auipc	ra,0x0
    80206fa8:	de4080e7          	jalr	-540(ra) # 80206d88 <etrunc>
    80206fac:	b775                	j	80206f58 <eput+0xe2>

0000000080206fae <estat>:
{
    80206fae:	1101                	addi	sp,sp,-32
    80206fb0:	ec06                	sd	ra,24(sp)
    80206fb2:	e822                	sd	s0,16(sp)
    80206fb4:	e426                	sd	s1,8(sp)
    80206fb6:	e04a                	sd	s2,0(sp)
    80206fb8:	1000                	addi	s0,sp,32
    80206fba:	892a                	mv	s2,a0
    80206fbc:	84ae                	mv	s1,a1
    strncpy(st->name, de->filename, STAT_MAX_NAME);
    80206fbe:	02000613          	li	a2,32
    80206fc2:	85aa                	mv	a1,a0
    80206fc4:	8526                	mv	a0,s1
    80206fc6:	ffffa097          	auipc	ra,0xffffa
    80206fca:	8b6080e7          	jalr	-1866(ra) # 8020087c <strncpy>
    st->type = (de->attribute & ATTR_DIRECTORY) ? T_DIR : T_FILE;
    80206fce:	10094783          	lbu	a5,256(s2)
    80206fd2:	8bc1                	andi	a5,a5,16
    80206fd4:	0017b793          	seqz	a5,a5
    80206fd8:	0785                	addi	a5,a5,1
    80206fda:	02f49423          	sh	a5,40(s1)
    st->dev = de->dev;
    80206fde:	11494783          	lbu	a5,276(s2)
    80206fe2:	d0dc                	sw	a5,36(s1)
    st->size = de->file_size;
    80206fe4:	10896783          	lwu	a5,264(s2)
    80206fe8:	f89c                	sd	a5,48(s1)
}
    80206fea:	60e2                	ld	ra,24(sp)
    80206fec:	6442                	ld	s0,16(sp)
    80206fee:	64a2                	ld	s1,8(sp)
    80206ff0:	6902                	ld	s2,0(sp)
    80206ff2:	6105                	addi	sp,sp,32
    80206ff4:	8082                	ret

0000000080206ff6 <enext>:
 * @return  -1      meet the end of dir
 *          0       find empty slots
 *          1       find a file with all its entries
 */
int enext(struct dirent *dp, struct dirent *ep, uint off, int *count)
{
    80206ff6:	7119                	addi	sp,sp,-128
    80206ff8:	fc86                	sd	ra,120(sp)
    80206ffa:	f8a2                	sd	s0,112(sp)
    80206ffc:	f4a6                	sd	s1,104(sp)
    80206ffe:	f0ca                	sd	s2,96(sp)
    80207000:	ecce                	sd	s3,88(sp)
    80207002:	e8d2                	sd	s4,80(sp)
    80207004:	e4d6                	sd	s5,72(sp)
    80207006:	e0da                	sd	s6,64(sp)
    80207008:	fc5e                	sd	s7,56(sp)
    8020700a:	f862                	sd	s8,48(sp)
    8020700c:	f466                	sd	s9,40(sp)
    8020700e:	f06a                	sd	s10,32(sp)
    80207010:	0100                	addi	s0,sp,128
    if (!(dp->attribute & ATTR_DIRECTORY))
    80207012:	10054783          	lbu	a5,256(a0)
    80207016:	8bc1                	andi	a5,a5,16
    80207018:	cf9d                	beqz	a5,80207056 <enext+0x60>
    8020701a:	892a                	mv	s2,a0
    8020701c:	8aae                	mv	s5,a1
    8020701e:	84b2                	mv	s1,a2
    80207020:	8a36                	mv	s4,a3
        panic("enext not dir");
    if (ep->valid)
    80207022:	11659783          	lh	a5,278(a1)
    80207026:	e3a1                	bnez	a5,80207066 <enext+0x70>
        panic("enext ep valid");
    if (off % 32)
    80207028:	01f67793          	andi	a5,a2,31
    8020702c:	e7a9                	bnez	a5,80207076 <enext+0x80>
        panic("enext not align");
    if (dp->valid != 1) { return -1; }
    8020702e:	11651703          	lh	a4,278(a0)
    80207032:	4785                	li	a5,1
    80207034:	557d                	li	a0,-1
    80207036:	04f70863          	beq	a4,a5,80207086 <enext+0x90>
            read_entry_info(ep, &de);
            return 1;
        }
    }
    return -1;
}
    8020703a:	70e6                	ld	ra,120(sp)
    8020703c:	7446                	ld	s0,112(sp)
    8020703e:	74a6                	ld	s1,104(sp)
    80207040:	7906                	ld	s2,96(sp)
    80207042:	69e6                	ld	s3,88(sp)
    80207044:	6a46                	ld	s4,80(sp)
    80207046:	6aa6                	ld	s5,72(sp)
    80207048:	6b06                	ld	s6,64(sp)
    8020704a:	7be2                	ld	s7,56(sp)
    8020704c:	7c42                	ld	s8,48(sp)
    8020704e:	7ca2                	ld	s9,40(sp)
    80207050:	7d02                	ld	s10,32(sp)
    80207052:	6109                	addi	sp,sp,128
    80207054:	8082                	ret
        panic("enext not dir");
    80207056:	00004517          	auipc	a0,0x4
    8020705a:	cf250513          	addi	a0,a0,-782 # 8020ad48 <digits+0x9c8>
    8020705e:	ffff9097          	auipc	ra,0xffff9
    80207062:	0e4080e7          	jalr	228(ra) # 80200142 <panic>
        panic("enext ep valid");
    80207066:	00004517          	auipc	a0,0x4
    8020706a:	cf250513          	addi	a0,a0,-782 # 8020ad58 <digits+0x9d8>
    8020706e:	ffff9097          	auipc	ra,0xffff9
    80207072:	0d4080e7          	jalr	212(ra) # 80200142 <panic>
        panic("enext not align");
    80207076:	00004517          	auipc	a0,0x4
    8020707a:	cf250513          	addi	a0,a0,-782 # 8020ad68 <digits+0x9e8>
    8020707e:	ffff9097          	auipc	ra,0xffff9
    80207082:	0c4080e7          	jalr	196(ra) # 80200142 <panic>
    memset(ep->filename, 0, FAT32_MAX_FILENAME + 1);
    80207086:	8d2e                	mv	s10,a1
    80207088:	10000613          	li	a2,256
    8020708c:	4581                	li	a1,0
    8020708e:	8556                	mv	a0,s5
    80207090:	ffff9097          	auipc	ra,0xffff9
    80207094:	6d4080e7          	jalr	1748(ra) # 80200764 <memset>
    int cnt = 0;
    80207098:	4b01                	li	s6,0
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    8020709a:	5bfd                	li	s7,-1
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    8020709c:	f8040993          	addi	s3,s0,-128
        if (de.lne.order == EMPTY_ENTRY) {
    802070a0:	0e500c13          	li	s8,229
        if (de.lne.attr == ATTR_LONG_NAME) {
    802070a4:	4cbd                	li	s9,15
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    802070a6:	a03d                	j	802070d4 <enext+0xde>
            cnt++;
    802070a8:	2b05                	addiw	s6,s6,1
            continue;
    802070aa:	a01d                	j	802070d0 <enext+0xda>
            *count = cnt;
    802070ac:	016a2023          	sw	s6,0(s4)
            return 0;
    802070b0:	4501                	li	a0,0
    802070b2:	b761                	j	8020703a <enext+0x44>
            read_entry_name(ep->filename + (lcnt - 1) * CHAR_LONG_NAME, &de);
    802070b4:	fff5079b          	addiw	a5,a0,-1
    802070b8:	0017951b          	slliw	a0,a5,0x1
    802070bc:	9d3d                	addw	a0,a0,a5
    802070be:	0025151b          	slliw	a0,a0,0x2
    802070c2:	9d3d                	addw	a0,a0,a5
    802070c4:	85ce                	mv	a1,s3
    802070c6:	956a                	add	a0,a0,s10
    802070c8:	fffff097          	auipc	ra,0xfffff
    802070cc:	18e080e7          	jalr	398(ra) # 80206256 <read_entry_name>
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    802070d0:	0204849b          	addiw	s1,s1,32
    802070d4:	4601                	li	a2,0
    802070d6:	85a6                	mv	a1,s1
    802070d8:	854a                	mv	a0,s2
    802070da:	fffff097          	auipc	ra,0xfffff
    802070de:	e18080e7          	jalr	-488(ra) # 80205ef2 <reloc_clus>
    802070e2:	f5750ce3          	beq	a0,s7,8020703a <enext+0x44>
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    802070e6:	02000793          	li	a5,32
    802070ea:	0005071b          	sext.w	a4,a0
    802070ee:	86ce                	mv	a3,s3
    802070f0:	4601                	li	a2,0
    802070f2:	4581                	li	a1,0
    802070f4:	10c92503          	lw	a0,268(s2)
    802070f8:	fffff097          	auipc	ra,0xfffff
    802070fc:	f04080e7          	jalr	-252(ra) # 80205ffc <rw_clus>
    80207100:	2501                	sext.w	a0,a0
    80207102:	02000793          	li	a5,32
    80207106:	06f51c63          	bne	a0,a5,8020717e <enext+0x188>
    8020710a:	f8044783          	lbu	a5,-128(s0)
    8020710e:	cbb5                	beqz	a5,80207182 <enext+0x18c>
        if (de.lne.order == EMPTY_ENTRY) {
    80207110:	f9878ce3          	beq	a5,s8,802070a8 <enext+0xb2>
        } else if (cnt) {
    80207114:	f80b1ce3          	bnez	s6,802070ac <enext+0xb6>
        if (de.lne.attr == ATTR_LONG_NAME) {
    80207118:	f8b44703          	lbu	a4,-117(s0)
    8020711c:	01971d63          	bne	a4,s9,80207136 <enext+0x140>
            int lcnt = de.lne.order & ~LAST_LONG_ENTRY;
    80207120:	0bf7f513          	andi	a0,a5,191
            if (de.lne.order & LAST_LONG_ENTRY) {
    80207124:	0407f793          	andi	a5,a5,64
    80207128:	d7d1                	beqz	a5,802070b4 <enext+0xbe>
                *count = lcnt + 1;                              // plus the s-n-e;
    8020712a:	0015079b          	addiw	a5,a0,1
    8020712e:	00fa2023          	sw	a5,0(s4)
                count = 0;
    80207132:	4a01                	li	s4,0
    80207134:	b741                	j	802070b4 <enext+0xbe>
            if (count) {
    80207136:	000a0c63          	beqz	s4,8020714e <enext+0x158>
                *count = 1;
    8020713a:	4785                	li	a5,1
    8020713c:	00fa2023          	sw	a5,0(s4)
                read_entry_name(ep->filename, &de);
    80207140:	f8040593          	addi	a1,s0,-128
    80207144:	8556                	mv	a0,s5
    80207146:	fffff097          	auipc	ra,0xfffff
    8020714a:	110080e7          	jalr	272(ra) # 80206256 <read_entry_name>
    entry->attribute = d->sne.attr;
    8020714e:	f8b44783          	lbu	a5,-117(s0)
    80207152:	10fa8023          	sb	a5,256(s5)
    entry->first_clus = ((uint32)d->sne.fst_clus_hi << 16) | d->sne.fst_clus_lo;
    80207156:	f9445783          	lhu	a5,-108(s0)
    8020715a:	0107979b          	slliw	a5,a5,0x10
    8020715e:	f9a45703          	lhu	a4,-102(s0)
    80207162:	8fd9                	or	a5,a5,a4
    80207164:	2781                	sext.w	a5,a5
    80207166:	10faa223          	sw	a5,260(s5)
    entry->file_size = d->sne.file_size;
    8020716a:	f9c42703          	lw	a4,-100(s0)
    8020716e:	10eaa423          	sw	a4,264(s5)
    entry->cur_clus = entry->first_clus;
    80207172:	10faa623          	sw	a5,268(s5)
    entry->clus_cnt = 0;
    80207176:	100aa823          	sw	zero,272(s5)
            return 1;
    8020717a:	4505                	li	a0,1
}
    8020717c:	bd7d                	j	8020703a <enext+0x44>
            return -1;
    8020717e:	557d                	li	a0,-1
    80207180:	bd6d                	j	8020703a <enext+0x44>
    80207182:	557d                	li	a0,-1
    80207184:	bd5d                	j	8020703a <enext+0x44>

0000000080207186 <dirlookup>:
 * @param   dp          entry of a directory file
 * @param   filename    target filename
 * @param   poff        offset of proper empty entry slots from the beginning of the dir
 */
struct dirent *dirlookup(struct dirent *dp, char *filename, uint *poff)
{
    80207186:	711d                	addi	sp,sp,-96
    80207188:	ec86                	sd	ra,88(sp)
    8020718a:	e8a2                	sd	s0,80(sp)
    8020718c:	e4a6                	sd	s1,72(sp)
    8020718e:	e0ca                	sd	s2,64(sp)
    80207190:	fc4e                	sd	s3,56(sp)
    80207192:	f852                	sd	s4,48(sp)
    80207194:	f456                	sd	s5,40(sp)
    80207196:	f05a                	sd	s6,32(sp)
    80207198:	ec5e                	sd	s7,24(sp)
    8020719a:	1080                	addi	s0,sp,96
    if (!(dp->attribute & ATTR_DIRECTORY))
    8020719c:	10054783          	lbu	a5,256(a0)
    802071a0:	8bc1                	andi	a5,a5,16
    802071a2:	cbb1                	beqz	a5,802071f6 <dirlookup+0x70>
    802071a4:	84aa                	mv	s1,a0
    802071a6:	89ae                	mv	s3,a1
    802071a8:	8ab2                	mv	s5,a2
        panic("dirlookup not DIR");
    if (strncmp(filename, ".", FAT32_MAX_FILENAME) == 0) {
    802071aa:	0ff00613          	li	a2,255
    802071ae:	00004597          	auipc	a1,0x4
    802071b2:	be258593          	addi	a1,a1,-1054 # 8020ad90 <digits+0xa10>
    802071b6:	854e                	mv	a0,s3
    802071b8:	ffff9097          	auipc	ra,0xffff9
    802071bc:	688080e7          	jalr	1672(ra) # 80200840 <strncmp>
    802071c0:	c139                	beqz	a0,80207206 <dirlookup+0x80>
        return edup(dp);
    } else if (strncmp(filename, "..", FAT32_MAX_FILENAME) == 0) {
    802071c2:	0ff00613          	li	a2,255
    802071c6:	00004597          	auipc	a1,0x4
    802071ca:	bd258593          	addi	a1,a1,-1070 # 8020ad98 <digits+0xa18>
    802071ce:	854e                	mv	a0,s3
    802071d0:	ffff9097          	auipc	ra,0xffff9
    802071d4:	670080e7          	jalr	1648(ra) # 80200840 <strncmp>
    802071d8:	e125                	bnez	a0,80207238 <dirlookup+0xb2>
        if (dp == &root) {
    802071da:	00024797          	auipc	a5,0x24
    802071de:	5d678793          	addi	a5,a5,1494 # 8022b7b0 <root>
    802071e2:	04f48463          	beq	s1,a5,8020722a <dirlookup+0xa4>
            return edup(&root);
        }
        return edup(dp->parent);
    802071e6:	1204b503          	ld	a0,288(s1)
    802071ea:	00000097          	auipc	ra,0x0
    802071ee:	9aa080e7          	jalr	-1622(ra) # 80206b94 <edup>
    802071f2:	892a                	mv	s2,a0
    802071f4:	a839                	j	80207212 <dirlookup+0x8c>
        panic("dirlookup not DIR");
    802071f6:	00004517          	auipc	a0,0x4
    802071fa:	b8250513          	addi	a0,a0,-1150 # 8020ad78 <digits+0x9f8>
    802071fe:	ffff9097          	auipc	ra,0xffff9
    80207202:	f44080e7          	jalr	-188(ra) # 80200142 <panic>
        return edup(dp);
    80207206:	8526                	mv	a0,s1
    80207208:	00000097          	auipc	ra,0x0
    8020720c:	98c080e7          	jalr	-1652(ra) # 80206b94 <edup>
    80207210:	892a                	mv	s2,a0
    if (poff) {
        *poff = off;
    }
    eput(ep);
    return NULL;
}
    80207212:	854a                	mv	a0,s2
    80207214:	60e6                	ld	ra,88(sp)
    80207216:	6446                	ld	s0,80(sp)
    80207218:	64a6                	ld	s1,72(sp)
    8020721a:	6906                	ld	s2,64(sp)
    8020721c:	79e2                	ld	s3,56(sp)
    8020721e:	7a42                	ld	s4,48(sp)
    80207220:	7aa2                	ld	s5,40(sp)
    80207222:	7b02                	ld	s6,32(sp)
    80207224:	6be2                	ld	s7,24(sp)
    80207226:	6125                	addi	sp,sp,96
    80207228:	8082                	ret
            return edup(&root);
    8020722a:	853e                	mv	a0,a5
    8020722c:	00000097          	auipc	ra,0x0
    80207230:	968080e7          	jalr	-1688(ra) # 80206b94 <edup>
    80207234:	892a                	mv	s2,a0
    80207236:	bff1                	j	80207212 <dirlookup+0x8c>
    if (dp->valid != 1) {
    80207238:	11649703          	lh	a4,278(s1)
    8020723c:	4785                	li	a5,1
        return NULL;
    8020723e:	4901                	li	s2,0
    if (dp->valid != 1) {
    80207240:	fcf719e3          	bne	a4,a5,80207212 <dirlookup+0x8c>
    struct dirent *ep = eget(dp, filename);
    80207244:	85ce                	mv	a1,s3
    80207246:	8526                	mv	a0,s1
    80207248:	fffff097          	auipc	ra,0xfffff
    8020724c:	f00080e7          	jalr	-256(ra) # 80206148 <eget>
    80207250:	892a                	mv	s2,a0
    if (ep->valid == 1) { return ep; }                               // ecache hits
    80207252:	11651703          	lh	a4,278(a0)
    80207256:	4785                	li	a5,1
    80207258:	faf70de3          	beq	a4,a5,80207212 <dirlookup+0x8c>
    int len = strlen(filename);
    8020725c:	854e                	mv	a0,s3
    8020725e:	ffff9097          	auipc	ra,0xffff9
    80207262:	68e080e7          	jalr	1678(ra) # 802008ec <strlen>
    int count = 0;
    80207266:	fa042623          	sw	zero,-84(s0)
    reloc_clus(dp, 0, 0);
    8020726a:	4601                	li	a2,0
    8020726c:	4581                	li	a1,0
    8020726e:	8526                	mv	a0,s1
    80207270:	fffff097          	auipc	ra,0xfffff
    80207274:	c82080e7          	jalr	-894(ra) # 80205ef2 <reloc_clus>
    uint off = 0;
    80207278:	4a01                	li	s4,0
    while ((type = enext(dp, ep, off, &count) != -1)) {
    8020727a:	fac40b93          	addi	s7,s0,-84
    8020727e:	5b7d                	li	s6,-1
    80207280:	86de                	mv	a3,s7
    80207282:	8652                	mv	a2,s4
    80207284:	85ca                	mv	a1,s2
    80207286:	8526                	mv	a0,s1
    80207288:	00000097          	auipc	ra,0x0
    8020728c:	d6e080e7          	jalr	-658(ra) # 80206ff6 <enext>
    80207290:	03650f63          	beq	a0,s6,802072ce <dirlookup+0x148>
        } else if (strncmp(filename, ep->filename, FAT32_MAX_FILENAME) == 0) {
    80207294:	0ff00613          	li	a2,255
    80207298:	85ca                	mv	a1,s2
    8020729a:	854e                	mv	a0,s3
    8020729c:	ffff9097          	auipc	ra,0xffff9
    802072a0:	5a4080e7          	jalr	1444(ra) # 80200840 <strncmp>
    802072a4:	c901                	beqz	a0,802072b4 <dirlookup+0x12e>
        off += count << 5;
    802072a6:	fac42783          	lw	a5,-84(s0)
    802072aa:	0057979b          	slliw	a5,a5,0x5
    802072ae:	01478a3b          	addw	s4,a5,s4
    802072b2:	b7f9                	j	80207280 <dirlookup+0xfa>
            ep->parent = edup(dp);
    802072b4:	8526                	mv	a0,s1
    802072b6:	00000097          	auipc	ra,0x0
    802072ba:	8de080e7          	jalr	-1826(ra) # 80206b94 <edup>
    802072be:	12a93023          	sd	a0,288(s2)
            ep->off = off;
    802072c2:	11492e23          	sw	s4,284(s2)
            ep->valid = 1;
    802072c6:	4785                	li	a5,1
    802072c8:	10f91b23          	sh	a5,278(s2)
            return ep;
    802072cc:	b799                	j	80207212 <dirlookup+0x8c>
    if (poff) {
    802072ce:	000a8463          	beqz	s5,802072d6 <dirlookup+0x150>
        *poff = off;
    802072d2:	014aa023          	sw	s4,0(s5)
    eput(ep);
    802072d6:	854a                	mv	a0,s2
    802072d8:	00000097          	auipc	ra,0x0
    802072dc:	b9e080e7          	jalr	-1122(ra) # 80206e76 <eput>
    return NULL;
    802072e0:	4901                	li	s2,0
    802072e2:	bf05                	j	80207212 <dirlookup+0x8c>

00000000802072e4 <ealloc>:
{
    802072e4:	7139                	addi	sp,sp,-64
    802072e6:	fc06                	sd	ra,56(sp)
    802072e8:	f822                	sd	s0,48(sp)
    802072ea:	f426                	sd	s1,40(sp)
    802072ec:	f04a                	sd	s2,32(sp)
    802072ee:	ec4e                	sd	s3,24(sp)
    802072f0:	e852                	sd	s4,16(sp)
    802072f2:	0080                	addi	s0,sp,64
    802072f4:	892a                	mv	s2,a0
    if (!(dp->attribute & ATTR_DIRECTORY)) {
    802072f6:	10054783          	lbu	a5,256(a0)
    802072fa:	8bc1                	andi	a5,a5,16
    802072fc:	c7a9                	beqz	a5,80207346 <ealloc+0x62>
    802072fe:	852e                	mv	a0,a1
    80207300:	8a32                	mv	s4,a2
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    80207302:	11691703          	lh	a4,278(s2)
    80207306:	4785                	li	a5,1
        return NULL;
    80207308:	4481                	li	s1,0
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    8020730a:	02f71563          	bne	a4,a5,80207334 <ealloc+0x50>
    8020730e:	fffff097          	auipc	ra,0xfffff
    80207312:	41e080e7          	jalr	1054(ra) # 8020672c <formatname>
    80207316:	89aa                	mv	s3,a0
    80207318:	10050663          	beqz	a0,80207424 <ealloc+0x140>
    uint off = 0;
    8020731c:	fc042623          	sw	zero,-52(s0)
    if ((ep = dirlookup(dp, name, &off)) != 0) {      // entry exists
    80207320:	fcc40613          	addi	a2,s0,-52
    80207324:	85aa                	mv	a1,a0
    80207326:	854a                	mv	a0,s2
    80207328:	00000097          	auipc	ra,0x0
    8020732c:	e5e080e7          	jalr	-418(ra) # 80207186 <dirlookup>
    80207330:	84aa                	mv	s1,a0
    80207332:	c115                	beqz	a0,80207356 <ealloc+0x72>
}
    80207334:	8526                	mv	a0,s1
    80207336:	70e2                	ld	ra,56(sp)
    80207338:	7442                	ld	s0,48(sp)
    8020733a:	74a2                	ld	s1,40(sp)
    8020733c:	7902                	ld	s2,32(sp)
    8020733e:	69e2                	ld	s3,24(sp)
    80207340:	6a42                	ld	s4,16(sp)
    80207342:	6121                	addi	sp,sp,64
    80207344:	8082                	ret
        panic("ealloc not dir");
    80207346:	00004517          	auipc	a0,0x4
    8020734a:	a5a50513          	addi	a0,a0,-1446 # 8020ada0 <digits+0xa20>
    8020734e:	ffff9097          	auipc	ra,0xffff9
    80207352:	df4080e7          	jalr	-524(ra) # 80200142 <panic>
    ep = eget(dp, name);
    80207356:	85ce                	mv	a1,s3
    80207358:	854a                	mv	a0,s2
    8020735a:	fffff097          	auipc	ra,0xfffff
    8020735e:	dee080e7          	jalr	-530(ra) # 80206148 <eget>
    80207362:	84aa                	mv	s1,a0
    elock(ep);
    80207364:	00000097          	auipc	ra,0x0
    80207368:	a8e080e7          	jalr	-1394(ra) # 80206df2 <elock>
    ep->attribute = attr;
    8020736c:	11448023          	sb	s4,256(s1)
    ep->file_size = 0;
    80207370:	1004a423          	sw	zero,264(s1)
    ep->first_clus = 0;
    80207374:	1004a223          	sw	zero,260(s1)
    ep->parent = edup(dp);
    80207378:	854a                	mv	a0,s2
    8020737a:	00000097          	auipc	ra,0x0
    8020737e:	81a080e7          	jalr	-2022(ra) # 80206b94 <edup>
    80207382:	12a4b023          	sd	a0,288(s1)
    ep->off = off;
    80207386:	fcc42783          	lw	a5,-52(s0)
    8020738a:	10f4ae23          	sw	a5,284(s1)
    ep->clus_cnt = 0;
    8020738e:	1004a823          	sw	zero,272(s1)
    ep->cur_clus = 0;
    80207392:	1004a623          	sw	zero,268(s1)
    ep->dirty = 0;
    80207396:	10048aa3          	sb	zero,277(s1)
    strncpy(ep->filename, name, FAT32_MAX_FILENAME);
    8020739a:	0ff00613          	li	a2,255
    8020739e:	85ce                	mv	a1,s3
    802073a0:	8526                	mv	a0,s1
    802073a2:	ffff9097          	auipc	ra,0xffff9
    802073a6:	4da080e7          	jalr	1242(ra) # 8020087c <strncpy>
    ep->filename[FAT32_MAX_FILENAME] = '\0';
    802073aa:	0e048fa3          	sb	zero,255(s1)
    if (attr == ATTR_DIRECTORY) {    // generate "." and ".." for ep
    802073ae:	47c1                	li	a5,16
    802073b0:	02fa0963          	beq	s4,a5,802073e2 <ealloc+0xfe>
        ep->attribute |= ATTR_ARCHIVE;
    802073b4:	1004c783          	lbu	a5,256(s1)
    802073b8:	0207e793          	ori	a5,a5,32
    802073bc:	10f48023          	sb	a5,256(s1)
    emake(dp, ep, off);
    802073c0:	fcc42603          	lw	a2,-52(s0)
    802073c4:	85a6                	mv	a1,s1
    802073c6:	854a                	mv	a0,s2
    802073c8:	fffff097          	auipc	ra,0xfffff
    802073cc:	41c080e7          	jalr	1052(ra) # 802067e4 <emake>
    ep->valid = 1;
    802073d0:	4785                	li	a5,1
    802073d2:	10f49b23          	sh	a5,278(s1)
    eunlock(ep);
    802073d6:	8526                	mv	a0,s1
    802073d8:	00000097          	auipc	ra,0x0
    802073dc:	a50080e7          	jalr	-1456(ra) # 80206e28 <eunlock>
    return ep;
    802073e0:	bf91                	j	80207334 <ealloc+0x50>
        ep->attribute |= ATTR_DIRECTORY;
    802073e2:	1004c783          	lbu	a5,256(s1)
    802073e6:	0107e793          	ori	a5,a5,16
    802073ea:	10f48023          	sb	a5,256(s1)
        ep->cur_clus = ep->first_clus = alloc_clus(dp->dev);
    802073ee:	11494503          	lbu	a0,276(s2)
    802073f2:	fffff097          	auipc	ra,0xfffff
    802073f6:	940080e7          	jalr	-1728(ra) # 80205d32 <alloc_clus>
    802073fa:	2501                	sext.w	a0,a0
    802073fc:	10a4a223          	sw	a0,260(s1)
    80207400:	10a4a623          	sw	a0,268(s1)
        emake(ep, ep, 0);
    80207404:	4601                	li	a2,0
    80207406:	85a6                	mv	a1,s1
    80207408:	8526                	mv	a0,s1
    8020740a:	fffff097          	auipc	ra,0xfffff
    8020740e:	3da080e7          	jalr	986(ra) # 802067e4 <emake>
        emake(ep, dp, 32);
    80207412:	02000613          	li	a2,32
    80207416:	85ca                	mv	a1,s2
    80207418:	8526                	mv	a0,s1
    8020741a:	fffff097          	auipc	ra,0xfffff
    8020741e:	3ca080e7          	jalr	970(ra) # 802067e4 <emake>
    80207422:	bf79                	j	802073c0 <ealloc+0xdc>
        return NULL;
    80207424:	84aa                	mv	s1,a0
    80207426:	b739                	j	80207334 <ealloc+0x50>

0000000080207428 <lookup_path>:
    return path;
}

// FAT32 version of namex in xv6's original file system.
static struct dirent *lookup_path(char *path, int parent, char *name)
{
    80207428:	715d                	addi	sp,sp,-80
    8020742a:	e486                	sd	ra,72(sp)
    8020742c:	e0a2                	sd	s0,64(sp)
    8020742e:	fc26                	sd	s1,56(sp)
    80207430:	f84a                	sd	s2,48(sp)
    80207432:	f44e                	sd	s3,40(sp)
    80207434:	f052                	sd	s4,32(sp)
    80207436:	ec56                	sd	s5,24(sp)
    80207438:	e85a                	sd	s6,16(sp)
    8020743a:	e45e                	sd	s7,8(sp)
    8020743c:	e062                	sd	s8,0(sp)
    8020743e:	0880                	addi	s0,sp,80
    80207440:	892a                	mv	s2,a0
    80207442:	8b2e                	mv	s6,a1
    80207444:	8ab2                	mv	s5,a2
    struct dirent *entry, *next;
    if (*path == '/') {
    80207446:	00054783          	lbu	a5,0(a0)
    8020744a:	02f00713          	li	a4,47
    8020744e:	02e78663          	beq	a5,a4,8020747a <lookup_path+0x52>
        entry = edup(&root);
    } else if (*path != '\0') {
        entry = edup(myproc()->cwd);
    } else {
        return NULL;
    80207452:	4981                	li	s3,0
    } else if (*path != '\0') {
    80207454:	cba1                	beqz	a5,802074a4 <lookup_path+0x7c>
        entry = edup(myproc()->cwd);
    80207456:	ffffa097          	auipc	ra,0xffffa
    8020745a:	61e080e7          	jalr	1566(ra) # 80201a74 <myproc>
    8020745e:	4d853503          	ld	a0,1240(a0)
    80207462:	fffff097          	auipc	ra,0xfffff
    80207466:	732080e7          	jalr	1842(ra) # 80206b94 <edup>
    8020746a:	89aa                	mv	s3,a0
    while (*path == '/') {
    8020746c:	02f00a13          	li	s4,47
    80207470:	0ff00b93          	li	s7,255
    80207474:	0ff00c13          	li	s8,255
    80207478:	a0dd                	j	8020755e <lookup_path+0x136>
        entry = edup(&root);
    8020747a:	00024517          	auipc	a0,0x24
    8020747e:	33650513          	addi	a0,a0,822 # 8022b7b0 <root>
    80207482:	fffff097          	auipc	ra,0xfffff
    80207486:	712080e7          	jalr	1810(ra) # 80206b94 <edup>
    8020748a:	89aa                	mv	s3,a0
    8020748c:	b7c5                	j	8020746c <lookup_path+0x44>
    }
    while ((path = skipelem(path, name)) != 0) {
        elock(entry);
        if (!(entry->attribute & ATTR_DIRECTORY)) {
            eunlock(entry);
    8020748e:	854e                	mv	a0,s3
    80207490:	00000097          	auipc	ra,0x0
    80207494:	998080e7          	jalr	-1640(ra) # 80206e28 <eunlock>
            eput(entry);
    80207498:	854e                	mv	a0,s3
    8020749a:	00000097          	auipc	ra,0x0
    8020749e:	9dc080e7          	jalr	-1572(ra) # 80206e76 <eput>
            return NULL;
    802074a2:	4981                	li	s3,0
    if (parent) {
        eput(entry);
        return NULL;
    }
    return entry;
}
    802074a4:	854e                	mv	a0,s3
    802074a6:	60a6                	ld	ra,72(sp)
    802074a8:	6406                	ld	s0,64(sp)
    802074aa:	74e2                	ld	s1,56(sp)
    802074ac:	7942                	ld	s2,48(sp)
    802074ae:	79a2                	ld	s3,40(sp)
    802074b0:	7a02                	ld	s4,32(sp)
    802074b2:	6ae2                	ld	s5,24(sp)
    802074b4:	6b42                	ld	s6,16(sp)
    802074b6:	6ba2                	ld	s7,8(sp)
    802074b8:	6c02                	ld	s8,0(sp)
    802074ba:	6161                	addi	sp,sp,80
    802074bc:	8082                	ret
            eunlock(entry);
    802074be:	854e                	mv	a0,s3
    802074c0:	00000097          	auipc	ra,0x0
    802074c4:	968080e7          	jalr	-1688(ra) # 80206e28 <eunlock>
            return entry;
    802074c8:	bff1                	j	802074a4 <lookup_path+0x7c>
            eunlock(entry);
    802074ca:	854e                	mv	a0,s3
    802074cc:	00000097          	auipc	ra,0x0
    802074d0:	95c080e7          	jalr	-1700(ra) # 80206e28 <eunlock>
            eput(entry);
    802074d4:	854e                	mv	a0,s3
    802074d6:	00000097          	auipc	ra,0x0
    802074da:	9a0080e7          	jalr	-1632(ra) # 80206e76 <eput>
            return NULL;
    802074de:	89ca                	mv	s3,s2
    802074e0:	b7d1                	j	802074a4 <lookup_path+0x7c>
    int len = path - s;
    802074e2:	412487bb          	subw	a5,s1,s2
    if (len > FAT32_MAX_FILENAME) {
    802074e6:	863e                	mv	a2,a5
    802074e8:	00fbd363          	bge	s7,a5,802074ee <lookup_path+0xc6>
    802074ec:	8662                	mv	a2,s8
    802074ee:	0006079b          	sext.w	a5,a2
    name[len] = 0;
    802074f2:	97d6                	add	a5,a5,s5
    802074f4:	00078023          	sb	zero,0(a5)
    memmove(name, s, len);
    802074f8:	2601                	sext.w	a2,a2
    802074fa:	85ca                	mv	a1,s2
    802074fc:	8556                	mv	a0,s5
    802074fe:	ffff9097          	auipc	ra,0xffff9
    80207502:	2c6080e7          	jalr	710(ra) # 802007c4 <memmove>
    while (*path == '/') {
    80207506:	0004c783          	lbu	a5,0(s1)
    8020750a:	01479763          	bne	a5,s4,80207518 <lookup_path+0xf0>
        path++;
    8020750e:	0485                	addi	s1,s1,1
    while (*path == '/') {
    80207510:	0004c783          	lbu	a5,0(s1)
    80207514:	ff478de3          	beq	a5,s4,8020750e <lookup_path+0xe6>
        elock(entry);
    80207518:	854e                	mv	a0,s3
    8020751a:	00000097          	auipc	ra,0x0
    8020751e:	8d8080e7          	jalr	-1832(ra) # 80206df2 <elock>
        if (!(entry->attribute & ATTR_DIRECTORY)) {
    80207522:	1009c783          	lbu	a5,256(s3)
    80207526:	8bc1                	andi	a5,a5,16
    80207528:	d3bd                	beqz	a5,8020748e <lookup_path+0x66>
        if (parent && *path == '\0') {
    8020752a:	000b0563          	beqz	s6,80207534 <lookup_path+0x10c>
    8020752e:	0004c783          	lbu	a5,0(s1)
    80207532:	d7d1                	beqz	a5,802074be <lookup_path+0x96>
        if ((next = dirlookup(entry, name, 0)) == 0) {
    80207534:	4601                	li	a2,0
    80207536:	85d6                	mv	a1,s5
    80207538:	854e                	mv	a0,s3
    8020753a:	00000097          	auipc	ra,0x0
    8020753e:	c4c080e7          	jalr	-948(ra) # 80207186 <dirlookup>
    80207542:	892a                	mv	s2,a0
    80207544:	d159                	beqz	a0,802074ca <lookup_path+0xa2>
        eunlock(entry);
    80207546:	854e                	mv	a0,s3
    80207548:	00000097          	auipc	ra,0x0
    8020754c:	8e0080e7          	jalr	-1824(ra) # 80206e28 <eunlock>
        eput(entry);
    80207550:	854e                	mv	a0,s3
    80207552:	00000097          	auipc	ra,0x0
    80207556:	924080e7          	jalr	-1756(ra) # 80206e76 <eput>
        entry = next;
    8020755a:	89ca                	mv	s3,s2
        eput(entry);
    8020755c:	8926                	mv	s2,s1
    while (*path == '/') {
    8020755e:	00094783          	lbu	a5,0(s2)
    80207562:	03479363          	bne	a5,s4,80207588 <lookup_path+0x160>
        path++;
    80207566:	0905                	addi	s2,s2,1
    while (*path == '/') {
    80207568:	00094783          	lbu	a5,0(s2)
    8020756c:	ff478de3          	beq	a5,s4,80207566 <lookup_path+0x13e>
    if (*path == 0) { return NULL; }
    80207570:	cf89                	beqz	a5,8020758a <lookup_path+0x162>
        path++;
    80207572:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    80207574:	f74787e3          	beq	a5,s4,802074e2 <lookup_path+0xba>
        eput(entry);
    80207578:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    8020757a:	d7a5                	beqz	a5,802074e2 <lookup_path+0xba>
        path++;
    8020757c:	0485                	addi	s1,s1,1
    while (*path != '/' && *path != 0) {
    8020757e:	0004c783          	lbu	a5,0(s1)
    80207582:	ff479ce3          	bne	a5,s4,8020757a <lookup_path+0x152>
    80207586:	bfb1                	j	802074e2 <lookup_path+0xba>
    if (*path == 0) { return NULL; }
    80207588:	fbe5                	bnez	a5,80207578 <lookup_path+0x150>
    if (parent) {
    8020758a:	f00b0de3          	beqz	s6,802074a4 <lookup_path+0x7c>
        eput(entry);
    8020758e:	854e                	mv	a0,s3
    80207590:	00000097          	auipc	ra,0x0
    80207594:	8e6080e7          	jalr	-1818(ra) # 80206e76 <eput>
        return NULL;
    80207598:	4981                	li	s3,0
    8020759a:	b729                	j	802074a4 <lookup_path+0x7c>

000000008020759c <ename>:

struct dirent *ename(char *path)
{
    8020759c:	716d                	addi	sp,sp,-272
    8020759e:	e606                	sd	ra,264(sp)
    802075a0:	e222                	sd	s0,256(sp)
    802075a2:	0a00                	addi	s0,sp,272
    char name[FAT32_MAX_FILENAME + 1];
    return lookup_path(path, 0, name);
    802075a4:	ef040613          	addi	a2,s0,-272
    802075a8:	4581                	li	a1,0
    802075aa:	00000097          	auipc	ra,0x0
    802075ae:	e7e080e7          	jalr	-386(ra) # 80207428 <lookup_path>
}
    802075b2:	60b2                	ld	ra,264(sp)
    802075b4:	6412                	ld	s0,256(sp)
    802075b6:	6151                	addi	sp,sp,272
    802075b8:	8082                	ret

00000000802075ba <enameparent>:

struct dirent *enameparent(char *path, char *name)
{
    802075ba:	1141                	addi	sp,sp,-16
    802075bc:	e406                	sd	ra,8(sp)
    802075be:	e022                	sd	s0,0(sp)
    802075c0:	0800                	addi	s0,sp,16
    802075c2:	862e                	mv	a2,a1
    return lookup_path(path, 1, name);
    802075c4:	4585                	li	a1,1
    802075c6:	00000097          	auipc	ra,0x0
    802075ca:	e62080e7          	jalr	-414(ra) # 80207428 <lookup_path>
}
    802075ce:	60a2                	ld	ra,8(sp)
    802075d0:	6402                	ld	s0,0(sp)
    802075d2:	0141                	addi	sp,sp,16
    802075d4:	8082                	ret

00000000802075d6 <plicinit>:

//
// the riscv Platform Level Interrupt Controller (PLIC).
//

void plicinit(void) {
    802075d6:	1141                	addi	sp,sp,-16
    802075d8:	e422                	sd	s0,8(sp)
    802075da:	0800                	addi	s0,sp,16
	writed(1, PLIC_V + DISK_IRQ * sizeof(uint32));
    802075dc:	00fc37b7          	lui	a5,0xfc3
    802075e0:	07ba                	slli	a5,a5,0xe
    802075e2:	4705                	li	a4,1
    802075e4:	c3d8                	sw	a4,4(a5)
	writed(1, PLIC_V + UART_IRQ * sizeof(uint32));
    802075e6:	d798                	sw	a4,40(a5)

	#ifdef DEBUG 
	printf("plicinit\n");
	#endif 
}
    802075e8:	6422                	ld	s0,8(sp)
    802075ea:	0141                	addi	sp,sp,16
    802075ec:	8082                	ret

00000000802075ee <plicinithart>:

void
plicinithart(void)
{
    802075ee:	1141                	addi	sp,sp,-16
    802075f0:	e406                	sd	ra,8(sp)
    802075f2:	e022                	sd	s0,0(sp)
    802075f4:	0800                	addi	s0,sp,16
  int hart = cpuid();
    802075f6:	ffffa097          	auipc	ra,0xffffa
    802075fa:	452080e7          	jalr	1106(ra) # 80201a48 <cpuid>
  #ifdef QEMU
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART_IRQ) | (1 << DISK_IRQ);
    802075fe:	0085171b          	slliw	a4,a0,0x8
    80207602:	01f867b7          	lui	a5,0x1f86
    80207606:	0785                	addi	a5,a5,1
    80207608:	07b6                	slli	a5,a5,0xd
    8020760a:	97ba                	add	a5,a5,a4
    8020760c:	40200713          	li	a4,1026
    80207610:	08e7a023          	sw	a4,128(a5) # 1f86080 <_entry-0x7e279f80>
  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80207614:	00d5179b          	slliw	a5,a0,0xd
    80207618:	03f0c537          	lui	a0,0x3f0c
    8020761c:	20150513          	addi	a0,a0,513 # 3f0c201 <_entry-0x7c2f3dff>
    80207620:	0532                	slli	a0,a0,0xc
    80207622:	953e                	add	a0,a0,a5
    80207624:	00052023          	sw	zero,0(a0)
  *(hart0_m_int_enable_hi) = readd(hart0_m_int_enable_hi) | (1 << (UART_IRQ % 32));
  #endif
  #ifdef DEBUG
  printf("plicinithart\n");
  #endif
}
    80207628:	60a2                	ld	ra,8(sp)
    8020762a:	6402                	ld	s0,0(sp)
    8020762c:	0141                	addi	sp,sp,16
    8020762e:	8082                	ret

0000000080207630 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80207630:	1141                	addi	sp,sp,-16
    80207632:	e406                	sd	ra,8(sp)
    80207634:	e022                	sd	s0,0(sp)
    80207636:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80207638:	ffffa097          	auipc	ra,0xffffa
    8020763c:	410080e7          	jalr	1040(ra) # 80201a48 <cpuid>
  int irq;
  #ifndef QEMU
  irq = *(uint32*)PLIC_MCLAIM(hart);
  #else
  irq = *(uint32*)PLIC_SCLAIM(hart);
    80207640:	00d5179b          	slliw	a5,a0,0xd
    80207644:	03f0c537          	lui	a0,0x3f0c
    80207648:	20150513          	addi	a0,a0,513 # 3f0c201 <_entry-0x7c2f3dff>
    8020764c:	0532                	slli	a0,a0,0xc
    8020764e:	953e                	add	a0,a0,a5
  #endif
  return irq;
}
    80207650:	4148                	lw	a0,4(a0)
    80207652:	60a2                	ld	ra,8(sp)
    80207654:	6402                	ld	s0,0(sp)
    80207656:	0141                	addi	sp,sp,16
    80207658:	8082                	ret

000000008020765a <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    8020765a:	1101                	addi	sp,sp,-32
    8020765c:	ec06                	sd	ra,24(sp)
    8020765e:	e822                	sd	s0,16(sp)
    80207660:	e426                	sd	s1,8(sp)
    80207662:	1000                	addi	s0,sp,32
    80207664:	84aa                	mv	s1,a0
  int hart = cpuid();
    80207666:	ffffa097          	auipc	ra,0xffffa
    8020766a:	3e2080e7          	jalr	994(ra) # 80201a48 <cpuid>
  #ifndef QEMU
  *(uint32*)PLIC_MCLAIM(hart) = irq;
  #else
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    8020766e:	00d5151b          	slliw	a0,a0,0xd
    80207672:	03f0c7b7          	lui	a5,0x3f0c
    80207676:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    8020767a:	07b2                	slli	a5,a5,0xc
    8020767c:	97aa                	add	a5,a5,a0
    8020767e:	c3c4                	sw	s1,4(a5)
  #endif
}
    80207680:	60e2                	ld	ra,24(sp)
    80207682:	6442                	ld	s0,16(sp)
    80207684:	64a2                	ld	s1,8(sp)
    80207686:	6105                	addi	sp,sp,32
    80207688:	8082                	ret

000000008020768a <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    8020768a:	715d                	addi	sp,sp,-80
    8020768c:	e486                	sd	ra,72(sp)
    8020768e:	e0a2                	sd	s0,64(sp)
    80207690:	fc26                	sd	s1,56(sp)
    80207692:	f84a                	sd	s2,48(sp)
    80207694:	f44e                	sd	s3,40(sp)
    80207696:	f052                	sd	s4,32(sp)
    80207698:	ec56                	sd	s5,24(sp)
    8020769a:	e85a                	sd	s6,16(sp)
    8020769c:	0880                	addi	s0,sp,80
    8020769e:	8a2a                	mv	s4,a0
    802076a0:	84ae                	mv	s1,a1
    802076a2:	89b2                	mv	s3,a2
  int i;

  acquire(&cons.lock);
    802076a4:	00029517          	auipc	a0,0x29
    802076a8:	8dc50513          	addi	a0,a0,-1828 # 8022ff80 <cons>
    802076ac:	ffff9097          	auipc	ra,0xffff9
    802076b0:	01c080e7          	jalr	28(ra) # 802006c8 <acquire>
  for(i = 0; i < n; i++){
    802076b4:	05305f63          	blez	s3,80207712 <consolewrite+0x88>
    802076b8:	4901                	li	s2,0
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    802076ba:	fbf40b13          	addi	s6,s0,-65
    802076be:	5afd                	li	s5,-1
    802076c0:	4685                	li	a3,1
    802076c2:	8626                	mv	a2,s1
    802076c4:	85d2                	mv	a1,s4
    802076c6:	855a                	mv	a0,s6
    802076c8:	ffffb097          	auipc	ra,0xffffb
    802076cc:	e9a080e7          	jalr	-358(ra) # 80202562 <either_copyin>
    802076d0:	01550e63          	beq	a0,s5,802076ec <consolewrite+0x62>
	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
    802076d4:	fbf44503          	lbu	a0,-65(s0)
    802076d8:	4581                	li	a1,0
    802076da:	4601                	li	a2,0
    802076dc:	4681                	li	a3,0
    802076de:	4885                	li	a7,1
    802076e0:	00000073          	ecall
  for(i = 0; i < n; i++){
    802076e4:	2905                	addiw	s2,s2,1
    802076e6:	0485                	addi	s1,s1,1
    802076e8:	fd299ce3          	bne	s3,s2,802076c0 <consolewrite+0x36>
      break;
    sbi_console_putchar(c);
  }
  release(&cons.lock);
    802076ec:	00029517          	auipc	a0,0x29
    802076f0:	89450513          	addi	a0,a0,-1900 # 8022ff80 <cons>
    802076f4:	ffff9097          	auipc	ra,0xffff9
    802076f8:	028080e7          	jalr	40(ra) # 8020071c <release>

  return i;
}
    802076fc:	854a                	mv	a0,s2
    802076fe:	60a6                	ld	ra,72(sp)
    80207700:	6406                	ld	s0,64(sp)
    80207702:	74e2                	ld	s1,56(sp)
    80207704:	7942                	ld	s2,48(sp)
    80207706:	79a2                	ld	s3,40(sp)
    80207708:	7a02                	ld	s4,32(sp)
    8020770a:	6ae2                	ld	s5,24(sp)
    8020770c:	6b42                	ld	s6,16(sp)
    8020770e:	6161                	addi	sp,sp,80
    80207710:	8082                	ret
  for(i = 0; i < n; i++){
    80207712:	4901                	li	s2,0
    80207714:	bfe1                	j	802076ec <consolewrite+0x62>

0000000080207716 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80207716:	7175                	addi	sp,sp,-144
    80207718:	e506                	sd	ra,136(sp)
    8020771a:	e122                	sd	s0,128(sp)
    8020771c:	fca6                	sd	s1,120(sp)
    8020771e:	f8ca                	sd	s2,112(sp)
    80207720:	f4ce                	sd	s3,104(sp)
    80207722:	f0d2                	sd	s4,96(sp)
    80207724:	ecd6                	sd	s5,88(sp)
    80207726:	e8da                	sd	s6,80(sp)
    80207728:	e4de                	sd	s7,72(sp)
    8020772a:	e0e2                	sd	s8,64(sp)
    8020772c:	fc66                	sd	s9,56(sp)
    8020772e:	f86a                	sd	s10,48(sp)
    80207730:	f46e                	sd	s11,40(sp)
    80207732:	0900                	addi	s0,sp,144
    80207734:	f6a43c23          	sd	a0,-136(s0)
    80207738:	8aae                	mv	s5,a1
    8020773a:	8a32                	mv	s4,a2
  uint target;
  int c;
  char cbuf;

  target = n;
    8020773c:	00060b1b          	sext.w	s6,a2
  acquire(&cons.lock);
    80207740:	00029517          	auipc	a0,0x29
    80207744:	84050513          	addi	a0,a0,-1984 # 8022ff80 <cons>
    80207748:	ffff9097          	auipc	ra,0xffff9
    8020774c:	f80080e7          	jalr	-128(ra) # 802006c8 <acquire>
  while(n > 0){
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
    80207750:	00029497          	auipc	s1,0x29
    80207754:	83048493          	addi	s1,s1,-2000 # 8022ff80 <cons>
      if(myproc()->killed){
        release(&cons.lock);
        return -1;
      }
      sleep(&cons.r, &cons.lock);
    80207758:	89a6                	mv	s3,s1
    8020775a:	00029917          	auipc	s2,0x29
    8020775e:	8be90913          	addi	s2,s2,-1858 # 80230018 <cons+0x98>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];

    if(c == C('D')){  // end-of-file
    80207762:	4c11                	li	s8,4
      break;
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80207764:	f8f40d13          	addi	s10,s0,-113
    80207768:	5cfd                	li	s9,-1
      break;

    dst++;
    --n;

    if(c == '\n'){
    8020776a:	4da9                	li	s11,10
  while(n > 0){
    8020776c:	07405863          	blez	s4,802077dc <consoleread+0xc6>
    while(cons.r == cons.w){
    80207770:	0984a783          	lw	a5,152(s1)
    80207774:	09c4a703          	lw	a4,156(s1)
    80207778:	02f71463          	bne	a4,a5,802077a0 <consoleread+0x8a>
      if(myproc()->killed){
    8020777c:	ffffa097          	auipc	ra,0xffffa
    80207780:	2f8080e7          	jalr	760(ra) # 80201a74 <myproc>
    80207784:	591c                	lw	a5,48(a0)
    80207786:	e7b5                	bnez	a5,802077f2 <consoleread+0xdc>
      sleep(&cons.r, &cons.lock);
    80207788:	85ce                	mv	a1,s3
    8020778a:	854a                	mv	a0,s2
    8020778c:	ffffb097          	auipc	ra,0xffffb
    80207790:	b42080e7          	jalr	-1214(ra) # 802022ce <sleep>
    while(cons.r == cons.w){
    80207794:	0984a783          	lw	a5,152(s1)
    80207798:	09c4a703          	lw	a4,156(s1)
    8020779c:	fef700e3          	beq	a4,a5,8020777c <consoleread+0x66>
    c = cons.buf[cons.r++ % INPUT_BUF];
    802077a0:	0017871b          	addiw	a4,a5,1
    802077a4:	08e4ac23          	sw	a4,152(s1)
    802077a8:	07f7f713          	andi	a4,a5,127
    802077ac:	9726                	add	a4,a4,s1
    802077ae:	01874703          	lbu	a4,24(a4)
    802077b2:	00070b9b          	sext.w	s7,a4
    if(c == C('D')){  // end-of-file
    802077b6:	078b8663          	beq	s7,s8,80207822 <consoleread+0x10c>
    cbuf = c;
    802077ba:	f8e407a3          	sb	a4,-113(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    802077be:	4685                	li	a3,1
    802077c0:	866a                	mv	a2,s10
    802077c2:	85d6                	mv	a1,s5
    802077c4:	f7843503          	ld	a0,-136(s0)
    802077c8:	ffffb097          	auipc	ra,0xffffb
    802077cc:	d64080e7          	jalr	-668(ra) # 8020252c <either_copyout>
    802077d0:	01950663          	beq	a0,s9,802077dc <consoleread+0xc6>
    dst++;
    802077d4:	0a85                	addi	s5,s5,1
    --n;
    802077d6:	3a7d                	addiw	s4,s4,-1
    if(c == '\n'){
    802077d8:	f9bb9ae3          	bne	s7,s11,8020776c <consoleread+0x56>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    }
  }
  release(&cons.lock);
    802077dc:	00028517          	auipc	a0,0x28
    802077e0:	7a450513          	addi	a0,a0,1956 # 8022ff80 <cons>
    802077e4:	ffff9097          	auipc	ra,0xffff9
    802077e8:	f38080e7          	jalr	-200(ra) # 8020071c <release>

  return target - n;
    802077ec:	414b053b          	subw	a0,s6,s4
    802077f0:	a811                	j	80207804 <consoleread+0xee>
        release(&cons.lock);
    802077f2:	00028517          	auipc	a0,0x28
    802077f6:	78e50513          	addi	a0,a0,1934 # 8022ff80 <cons>
    802077fa:	ffff9097          	auipc	ra,0xffff9
    802077fe:	f22080e7          	jalr	-222(ra) # 8020071c <release>
        return -1;
    80207802:	557d                	li	a0,-1
}
    80207804:	60aa                	ld	ra,136(sp)
    80207806:	640a                	ld	s0,128(sp)
    80207808:	74e6                	ld	s1,120(sp)
    8020780a:	7946                	ld	s2,112(sp)
    8020780c:	79a6                	ld	s3,104(sp)
    8020780e:	7a06                	ld	s4,96(sp)
    80207810:	6ae6                	ld	s5,88(sp)
    80207812:	6b46                	ld	s6,80(sp)
    80207814:	6ba6                	ld	s7,72(sp)
    80207816:	6c06                	ld	s8,64(sp)
    80207818:	7ce2                	ld	s9,56(sp)
    8020781a:	7d42                	ld	s10,48(sp)
    8020781c:	7da2                	ld	s11,40(sp)
    8020781e:	6149                	addi	sp,sp,144
    80207820:	8082                	ret
      if(n < target){
    80207822:	000a071b          	sext.w	a4,s4
    80207826:	fb677be3          	bgeu	a4,s6,802077dc <consoleread+0xc6>
        cons.r--;
    8020782a:	00028717          	auipc	a4,0x28
    8020782e:	7ef72723          	sw	a5,2030(a4) # 80230018 <cons+0x98>
    80207832:	b76d                	j	802077dc <consoleread+0xc6>

0000000080207834 <consputc>:
void consputc(int c) {
    80207834:	1141                	addi	sp,sp,-16
    80207836:	e422                	sd	s0,8(sp)
    80207838:	0800                	addi	s0,sp,16
  if(c == BACKSPACE){
    8020783a:	10000793          	li	a5,256
    8020783e:	00f50b63          	beq	a0,a5,80207854 <consputc+0x20>
    80207842:	4581                	li	a1,0
    80207844:	4601                	li	a2,0
    80207846:	4681                	li	a3,0
    80207848:	4885                	li	a7,1
    8020784a:	00000073          	ecall
}
    8020784e:	6422                	ld	s0,8(sp)
    80207850:	0141                	addi	sp,sp,16
    80207852:	8082                	ret
    80207854:	4521                	li	a0,8
    80207856:	4581                	li	a1,0
    80207858:	4601                	li	a2,0
    8020785a:	4681                	li	a3,0
    8020785c:	4885                	li	a7,1
    8020785e:	00000073          	ecall
    80207862:	02000513          	li	a0,32
    80207866:	00000073          	ecall
    8020786a:	4521                	li	a0,8
    8020786c:	00000073          	ecall
}
    80207870:	bff9                	j	8020784e <consputc+0x1a>

0000000080207872 <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    80207872:	1101                	addi	sp,sp,-32
    80207874:	ec06                	sd	ra,24(sp)
    80207876:	e822                	sd	s0,16(sp)
    80207878:	e426                	sd	s1,8(sp)
    8020787a:	e04a                	sd	s2,0(sp)
    8020787c:	1000                	addi	s0,sp,32
    8020787e:	84aa                	mv	s1,a0
  acquire(&cons.lock);
    80207880:	00028517          	auipc	a0,0x28
    80207884:	70050513          	addi	a0,a0,1792 # 8022ff80 <cons>
    80207888:	ffff9097          	auipc	ra,0xffff9
    8020788c:	e40080e7          	jalr	-448(ra) # 802006c8 <acquire>

  switch(c){
    80207890:	47d5                	li	a5,21
    80207892:	0af48663          	beq	s1,a5,8020793e <consoleintr+0xcc>
    80207896:	0297ca63          	blt	a5,s1,802078ca <consoleintr+0x58>
    8020789a:	47a1                	li	a5,8
    8020789c:	0ef48763          	beq	s1,a5,8020798a <consoleintr+0x118>
    802078a0:	47c1                	li	a5,16
    802078a2:	10f49a63          	bne	s1,a5,802079b6 <consoleintr+0x144>
  case C('P'):  // Print process list.
    procdump();
    802078a6:	ffffb097          	auipc	ra,0xffffb
    802078aa:	cf0080e7          	jalr	-784(ra) # 80202596 <procdump>
      }
    }
    break;
  }
  
  release(&cons.lock);
    802078ae:	00028517          	auipc	a0,0x28
    802078b2:	6d250513          	addi	a0,a0,1746 # 8022ff80 <cons>
    802078b6:	ffff9097          	auipc	ra,0xffff9
    802078ba:	e66080e7          	jalr	-410(ra) # 8020071c <release>
}
    802078be:	60e2                	ld	ra,24(sp)
    802078c0:	6442                	ld	s0,16(sp)
    802078c2:	64a2                	ld	s1,8(sp)
    802078c4:	6902                	ld	s2,0(sp)
    802078c6:	6105                	addi	sp,sp,32
    802078c8:	8082                	ret
  switch(c){
    802078ca:	07f00793          	li	a5,127
    802078ce:	0af48e63          	beq	s1,a5,8020798a <consoleintr+0x118>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    802078d2:	00028717          	auipc	a4,0x28
    802078d6:	6ae70713          	addi	a4,a4,1710 # 8022ff80 <cons>
    802078da:	0a072783          	lw	a5,160(a4)
    802078de:	09872703          	lw	a4,152(a4)
    802078e2:	9f99                	subw	a5,a5,a4
    802078e4:	07f00713          	li	a4,127
    802078e8:	fcf763e3          	bltu	a4,a5,802078ae <consoleintr+0x3c>
      c = (c == '\r') ? '\n' : c;
    802078ec:	47b5                	li	a5,13
    802078ee:	0cf48763          	beq	s1,a5,802079bc <consoleintr+0x14a>
      consputc(c);
    802078f2:	8526                	mv	a0,s1
    802078f4:	00000097          	auipc	ra,0x0
    802078f8:	f40080e7          	jalr	-192(ra) # 80207834 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    802078fc:	00028797          	auipc	a5,0x28
    80207900:	68478793          	addi	a5,a5,1668 # 8022ff80 <cons>
    80207904:	0a07a703          	lw	a4,160(a5)
    80207908:	0017069b          	addiw	a3,a4,1
    8020790c:	0006861b          	sext.w	a2,a3
    80207910:	0ad7a023          	sw	a3,160(a5)
    80207914:	07f77713          	andi	a4,a4,127
    80207918:	97ba                	add	a5,a5,a4
    8020791a:	00978c23          	sb	s1,24(a5)
      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    8020791e:	47a9                	li	a5,10
    80207920:	0cf48563          	beq	s1,a5,802079ea <consoleintr+0x178>
    80207924:	4791                	li	a5,4
    80207926:	0cf48263          	beq	s1,a5,802079ea <consoleintr+0x178>
    8020792a:	00028797          	auipc	a5,0x28
    8020792e:	6ee7a783          	lw	a5,1774(a5) # 80230018 <cons+0x98>
    80207932:	0807879b          	addiw	a5,a5,128
    80207936:	f6f61ce3          	bne	a2,a5,802078ae <consoleintr+0x3c>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    8020793a:	863e                	mv	a2,a5
    8020793c:	a07d                	j	802079ea <consoleintr+0x178>
    while(cons.e != cons.w &&
    8020793e:	00028717          	auipc	a4,0x28
    80207942:	64270713          	addi	a4,a4,1602 # 8022ff80 <cons>
    80207946:	0a072783          	lw	a5,160(a4)
    8020794a:	09c72703          	lw	a4,156(a4)
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    8020794e:	00028497          	auipc	s1,0x28
    80207952:	63248493          	addi	s1,s1,1586 # 8022ff80 <cons>
    while(cons.e != cons.w &&
    80207956:	4929                	li	s2,10
    80207958:	f4f70be3          	beq	a4,a5,802078ae <consoleintr+0x3c>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    8020795c:	37fd                	addiw	a5,a5,-1
    8020795e:	07f7f713          	andi	a4,a5,127
    80207962:	9726                	add	a4,a4,s1
    while(cons.e != cons.w &&
    80207964:	01874703          	lbu	a4,24(a4)
    80207968:	f52703e3          	beq	a4,s2,802078ae <consoleintr+0x3c>
      cons.e--;
    8020796c:	0af4a023          	sw	a5,160(s1)
      consputc(BACKSPACE);
    80207970:	10000513          	li	a0,256
    80207974:	00000097          	auipc	ra,0x0
    80207978:	ec0080e7          	jalr	-320(ra) # 80207834 <consputc>
    while(cons.e != cons.w &&
    8020797c:	0a04a783          	lw	a5,160(s1)
    80207980:	09c4a703          	lw	a4,156(s1)
    80207984:	fcf71ce3          	bne	a4,a5,8020795c <consoleintr+0xea>
    80207988:	b71d                	j	802078ae <consoleintr+0x3c>
    if(cons.e != cons.w){
    8020798a:	00028717          	auipc	a4,0x28
    8020798e:	5f670713          	addi	a4,a4,1526 # 8022ff80 <cons>
    80207992:	0a072783          	lw	a5,160(a4)
    80207996:	09c72703          	lw	a4,156(a4)
    8020799a:	f0f70ae3          	beq	a4,a5,802078ae <consoleintr+0x3c>
      cons.e--;
    8020799e:	37fd                	addiw	a5,a5,-1
    802079a0:	00028717          	auipc	a4,0x28
    802079a4:	68f72023          	sw	a5,1664(a4) # 80230020 <cons+0xa0>
      consputc(BACKSPACE);
    802079a8:	10000513          	li	a0,256
    802079ac:	00000097          	auipc	ra,0x0
    802079b0:	e88080e7          	jalr	-376(ra) # 80207834 <consputc>
    802079b4:	bded                	j	802078ae <consoleintr+0x3c>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    802079b6:	ee048ce3          	beqz	s1,802078ae <consoleintr+0x3c>
    802079ba:	bf21                	j	802078d2 <consoleintr+0x60>
      consputc(c);
    802079bc:	4529                	li	a0,10
    802079be:	00000097          	auipc	ra,0x0
    802079c2:	e76080e7          	jalr	-394(ra) # 80207834 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    802079c6:	00028797          	auipc	a5,0x28
    802079ca:	5ba78793          	addi	a5,a5,1466 # 8022ff80 <cons>
    802079ce:	0a07a703          	lw	a4,160(a5)
    802079d2:	0017069b          	addiw	a3,a4,1
    802079d6:	0006861b          	sext.w	a2,a3
    802079da:	0ad7a023          	sw	a3,160(a5)
    802079de:	07f77713          	andi	a4,a4,127
    802079e2:	97ba                	add	a5,a5,a4
    802079e4:	4729                	li	a4,10
    802079e6:	00e78c23          	sb	a4,24(a5)
        cons.w = cons.e;
    802079ea:	00028797          	auipc	a5,0x28
    802079ee:	62c7a923          	sw	a2,1586(a5) # 8023001c <cons+0x9c>
        wakeup(&cons.r);
    802079f2:	00028517          	auipc	a0,0x28
    802079f6:	62650513          	addi	a0,a0,1574 # 80230018 <cons+0x98>
    802079fa:	ffffb097          	auipc	ra,0xffffb
    802079fe:	a56080e7          	jalr	-1450(ra) # 80202450 <wakeup>
    80207a02:	b575                	j	802078ae <consoleintr+0x3c>

0000000080207a04 <consoleinit>:

void
consoleinit(void)
{
    80207a04:	1101                	addi	sp,sp,-32
    80207a06:	ec06                	sd	ra,24(sp)
    80207a08:	e822                	sd	s0,16(sp)
    80207a0a:	e426                	sd	s1,8(sp)
    80207a0c:	1000                	addi	s0,sp,32
  initlock(&cons.lock, "cons");
    80207a0e:	00028497          	auipc	s1,0x28
    80207a12:	57248493          	addi	s1,s1,1394 # 8022ff80 <cons>
    80207a16:	00003597          	auipc	a1,0x3
    80207a1a:	39a58593          	addi	a1,a1,922 # 8020adb0 <digits+0xa30>
    80207a1e:	8526                	mv	a0,s1
    80207a20:	ffff9097          	auipc	ra,0xffff9
    80207a24:	c64080e7          	jalr	-924(ra) # 80200684 <initlock>
  uartinit();
    80207a28:	00000097          	auipc	ra,0x0
    80207a2c:	5bc080e7          	jalr	1468(ra) # 80207fe4 <uartinit>
  cons.e = cons.w = cons.r = 0;
    80207a30:	0804ac23          	sw	zero,152(s1)
    80207a34:	0804ae23          	sw	zero,156(s1)
    80207a38:	0a04a023          	sw	zero,160(s1)
  
  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    80207a3c:	00005797          	auipc	a5,0x5
    80207a40:	6dc7b783          	ld	a5,1756(a5) # 8020d118 <_GLOBAL_OFFSET_TABLE_+0x68>
    80207a44:	00000717          	auipc	a4,0x0
    80207a48:	cd270713          	addi	a4,a4,-814 # 80207716 <consoleread>
    80207a4c:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    80207a4e:	00000717          	auipc	a4,0x0
    80207a52:	c3c70713          	addi	a4,a4,-964 # 8020768a <consolewrite>
    80207a56:	ef98                	sd	a4,24(a5)
}
    80207a58:	60e2                	ld	ra,24(sp)
    80207a5a:	6442                	ld	s0,16(sp)
    80207a5c:	64a2                	ld	s1,8(sp)
    80207a5e:	6105                	addi	sp,sp,32
    80207a60:	8082                	ret

0000000080207a62 <free_desc>:
}

// mark a descriptor as free.
static void
free_desc(int i)
{
    80207a62:	1141                	addi	sp,sp,-16
    80207a64:	e406                	sd	ra,8(sp)
    80207a66:	e022                	sd	s0,0(sp)
    80207a68:	0800                	addi	s0,sp,16
  if(i >= NUM)
    80207a6a:	479d                	li	a5,7
    80207a6c:	04a7cc63          	blt	a5,a0,80207ac4 <free_desc+0x62>
    panic("virtio_disk_intr 1");
  if(disk.free[i])
    80207a70:	00029797          	auipc	a5,0x29
    80207a74:	59078793          	addi	a5,a5,1424 # 80231000 <disk>
    80207a78:	00a78733          	add	a4,a5,a0
    80207a7c:	6789                	lui	a5,0x2
    80207a7e:	97ba                	add	a5,a5,a4
    80207a80:	0187c783          	lbu	a5,24(a5) # 2018 <_entry-0x801fdfe8>
    80207a84:	eba1                	bnez	a5,80207ad4 <free_desc+0x72>
    panic("virtio_disk_intr 2");
  disk.desc[i].addr = 0;
    80207a86:	00451713          	slli	a4,a0,0x4
    80207a8a:	0002b797          	auipc	a5,0x2b
    80207a8e:	5767b783          	ld	a5,1398(a5) # 80233000 <disk+0x2000>
    80207a92:	97ba                	add	a5,a5,a4
    80207a94:	0007b023          	sd	zero,0(a5)
  disk.free[i] = 1;
    80207a98:	00029797          	auipc	a5,0x29
    80207a9c:	56878793          	addi	a5,a5,1384 # 80231000 <disk>
    80207aa0:	97aa                	add	a5,a5,a0
    80207aa2:	6509                	lui	a0,0x2
    80207aa4:	953e                	add	a0,a0,a5
    80207aa6:	4785                	li	a5,1
    80207aa8:	00f50c23          	sb	a5,24(a0) # 2018 <_entry-0x801fdfe8>
  wakeup(&disk.free[0]);
    80207aac:	0002b517          	auipc	a0,0x2b
    80207ab0:	56c50513          	addi	a0,a0,1388 # 80233018 <disk+0x2018>
    80207ab4:	ffffb097          	auipc	ra,0xffffb
    80207ab8:	99c080e7          	jalr	-1636(ra) # 80202450 <wakeup>
}
    80207abc:	60a2                	ld	ra,8(sp)
    80207abe:	6402                	ld	s0,0(sp)
    80207ac0:	0141                	addi	sp,sp,16
    80207ac2:	8082                	ret
    panic("virtio_disk_intr 1");
    80207ac4:	00003517          	auipc	a0,0x3
    80207ac8:	2f450513          	addi	a0,a0,756 # 8020adb8 <digits+0xa38>
    80207acc:	ffff8097          	auipc	ra,0xffff8
    80207ad0:	676080e7          	jalr	1654(ra) # 80200142 <panic>
    panic("virtio_disk_intr 2");
    80207ad4:	00003517          	auipc	a0,0x3
    80207ad8:	2fc50513          	addi	a0,a0,764 # 8020add0 <digits+0xa50>
    80207adc:	ffff8097          	auipc	ra,0xffff8
    80207ae0:	666080e7          	jalr	1638(ra) # 80200142 <panic>

0000000080207ae4 <virtio_disk_init>:
{
    80207ae4:	1141                	addi	sp,sp,-16
    80207ae6:	e406                	sd	ra,8(sp)
    80207ae8:	e022                	sd	s0,0(sp)
    80207aea:	0800                	addi	s0,sp,16
  initlock(&disk.vdisk_lock, "virtio_disk");
    80207aec:	00003597          	auipc	a1,0x3
    80207af0:	2fc58593          	addi	a1,a1,764 # 8020ade8 <digits+0xa68>
    80207af4:	0002b517          	auipc	a0,0x2b
    80207af8:	5b450513          	addi	a0,a0,1460 # 802330a8 <disk+0x20a8>
    80207afc:	ffff9097          	auipc	ra,0xffff9
    80207b00:	b88080e7          	jalr	-1144(ra) # 80200684 <initlock>
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80207b04:	03f107b7          	lui	a5,0x3f10
    80207b08:	0785                	addi	a5,a5,1
    80207b0a:	07b2                	slli	a5,a5,0xc
    80207b0c:	4398                	lw	a4,0(a5)
    80207b0e:	2701                	sext.w	a4,a4
    80207b10:	747277b7          	lui	a5,0x74727
    80207b14:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xbad968a>
    80207b18:	12f71263          	bne	a4,a5,80207c3c <virtio_disk_init+0x158>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80207b1c:	00003797          	auipc	a5,0x3
    80207b20:	3547b783          	ld	a5,852(a5) # 8020ae70 <digits+0xaf0>
    80207b24:	439c                	lw	a5,0(a5)
    80207b26:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80207b28:	4705                	li	a4,1
    80207b2a:	10e79963          	bne	a5,a4,80207c3c <virtio_disk_init+0x158>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80207b2e:	00003797          	auipc	a5,0x3
    80207b32:	34a7b783          	ld	a5,842(a5) # 8020ae78 <digits+0xaf8>
    80207b36:	439c                	lw	a5,0(a5)
    80207b38:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80207b3a:	4709                	li	a4,2
    80207b3c:	10e79063          	bne	a5,a4,80207c3c <virtio_disk_init+0x158>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80207b40:	00003797          	auipc	a5,0x3
    80207b44:	3407b783          	ld	a5,832(a5) # 8020ae80 <digits+0xb00>
    80207b48:	4398                	lw	a4,0(a5)
    80207b4a:	2701                	sext.w	a4,a4
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80207b4c:	554d47b7          	lui	a5,0x554d4
    80207b50:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ad2baaf>
    80207b54:	0ef71463          	bne	a4,a5,80207c3c <virtio_disk_init+0x158>
  *R(VIRTIO_MMIO_STATUS) = status;
    80207b58:	00003717          	auipc	a4,0x3
    80207b5c:	33073703          	ld	a4,816(a4) # 8020ae88 <digits+0xb08>
    80207b60:	4785                	li	a5,1
    80207b62:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207b64:	478d                	li	a5,3
    80207b66:	c31c                	sw	a5,0(a4)
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80207b68:	00003797          	auipc	a5,0x3
    80207b6c:	3287b783          	ld	a5,808(a5) # 8020ae90 <digits+0xb10>
    80207b70:	4394                	lw	a3,0(a5)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80207b72:	c7ffe7b7          	lui	a5,0xc7ffe
    80207b76:	75f78793          	addi	a5,a5,1887 # ffffffffc7ffe75f <kernel_end+0xffffffff47dc975f>
    80207b7a:	8ff5                	and	a5,a5,a3
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80207b7c:	2781                	sext.w	a5,a5
    80207b7e:	00003697          	auipc	a3,0x3
    80207b82:	31a6b683          	ld	a3,794(a3) # 8020ae98 <digits+0xb18>
    80207b86:	c29c                	sw	a5,0(a3)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207b88:	47ad                	li	a5,11
    80207b8a:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207b8c:	47bd                	li	a5,15
    80207b8e:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    80207b90:	00003797          	auipc	a5,0x3
    80207b94:	3107b783          	ld	a5,784(a5) # 8020aea0 <digits+0xb20>
    80207b98:	6705                	lui	a4,0x1
    80207b9a:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    80207b9c:	00003797          	auipc	a5,0x3
    80207ba0:	30c7b783          	ld	a5,780(a5) # 8020aea8 <digits+0xb28>
    80207ba4:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    80207ba8:	00003797          	auipc	a5,0x3
    80207bac:	3087b783          	ld	a5,776(a5) # 8020aeb0 <digits+0xb30>
    80207bb0:	439c                	lw	a5,0(a5)
    80207bb2:	2781                	sext.w	a5,a5
  if(max == 0)
    80207bb4:	cfc1                	beqz	a5,80207c4c <virtio_disk_init+0x168>
  if(max < NUM)
    80207bb6:	471d                	li	a4,7
    80207bb8:	0af77263          	bgeu	a4,a5,80207c5c <virtio_disk_init+0x178>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    80207bbc:	00003797          	auipc	a5,0x3
    80207bc0:	2fc7b783          	ld	a5,764(a5) # 8020aeb8 <digits+0xb38>
    80207bc4:	4721                	li	a4,8
    80207bc6:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    80207bc8:	6609                	lui	a2,0x2
    80207bca:	4581                	li	a1,0
    80207bcc:	00029517          	auipc	a0,0x29
    80207bd0:	43450513          	addi	a0,a0,1076 # 80231000 <disk>
    80207bd4:	ffff9097          	auipc	ra,0xffff9
    80207bd8:	b90080e7          	jalr	-1136(ra) # 80200764 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    80207bdc:	00029717          	auipc	a4,0x29
    80207be0:	42470713          	addi	a4,a4,1060 # 80231000 <disk>
    80207be4:	00c75793          	srli	a5,a4,0xc
    80207be8:	2781                	sext.w	a5,a5
    80207bea:	00003697          	auipc	a3,0x3
    80207bee:	2d66b683          	ld	a3,726(a3) # 8020aec0 <digits+0xb40>
    80207bf2:	c29c                	sw	a5,0(a3)
  disk.desc = (struct VRingDesc *) disk.pages;
    80207bf4:	0002b797          	auipc	a5,0x2b
    80207bf8:	40c78793          	addi	a5,a5,1036 # 80233000 <disk+0x2000>
    80207bfc:	e398                	sd	a4,0(a5)
  disk.avail = (uint16*)(((char*)disk.desc) + NUM*sizeof(struct VRingDesc));
    80207bfe:	00029717          	auipc	a4,0x29
    80207c02:	48270713          	addi	a4,a4,1154 # 80231080 <disk+0x80>
    80207c06:	e798                	sd	a4,8(a5)
  disk.used = (struct UsedArea *) (disk.pages + PGSIZE);
    80207c08:	0002a717          	auipc	a4,0x2a
    80207c0c:	3f870713          	addi	a4,a4,1016 # 80232000 <disk+0x1000>
    80207c10:	eb98                	sd	a4,16(a5)
    disk.free[i] = 1;
    80207c12:	4705                	li	a4,1
    80207c14:	00e78c23          	sb	a4,24(a5)
    80207c18:	00e78ca3          	sb	a4,25(a5)
    80207c1c:	00e78d23          	sb	a4,26(a5)
    80207c20:	00e78da3          	sb	a4,27(a5)
    80207c24:	00e78e23          	sb	a4,28(a5)
    80207c28:	00e78ea3          	sb	a4,29(a5)
    80207c2c:	00e78f23          	sb	a4,30(a5)
    80207c30:	00e78fa3          	sb	a4,31(a5)
}
    80207c34:	60a2                	ld	ra,8(sp)
    80207c36:	6402                	ld	s0,0(sp)
    80207c38:	0141                	addi	sp,sp,16
    80207c3a:	8082                	ret
    panic("could not find virtio disk");
    80207c3c:	00003517          	auipc	a0,0x3
    80207c40:	1bc50513          	addi	a0,a0,444 # 8020adf8 <digits+0xa78>
    80207c44:	ffff8097          	auipc	ra,0xffff8
    80207c48:	4fe080e7          	jalr	1278(ra) # 80200142 <panic>
    panic("virtio disk has no queue 0");
    80207c4c:	00003517          	auipc	a0,0x3
    80207c50:	1cc50513          	addi	a0,a0,460 # 8020ae18 <digits+0xa98>
    80207c54:	ffff8097          	auipc	ra,0xffff8
    80207c58:	4ee080e7          	jalr	1262(ra) # 80200142 <panic>
    panic("virtio disk max queue too short");
    80207c5c:	00003517          	auipc	a0,0x3
    80207c60:	1dc50513          	addi	a0,a0,476 # 8020ae38 <digits+0xab8>
    80207c64:	ffff8097          	auipc	ra,0xffff8
    80207c68:	4de080e7          	jalr	1246(ra) # 80200142 <panic>

0000000080207c6c <virtio_disk_rw>:
  return 0;
}

void
virtio_disk_rw(struct buf *b, int write)
{
    80207c6c:	7119                	addi	sp,sp,-128
    80207c6e:	fc86                	sd	ra,120(sp)
    80207c70:	f8a2                	sd	s0,112(sp)
    80207c72:	f4a6                	sd	s1,104(sp)
    80207c74:	f0ca                	sd	s2,96(sp)
    80207c76:	ecce                	sd	s3,88(sp)
    80207c78:	e8d2                	sd	s4,80(sp)
    80207c7a:	e4d6                	sd	s5,72(sp)
    80207c7c:	e0da                	sd	s6,64(sp)
    80207c7e:	fc5e                	sd	s7,56(sp)
    80207c80:	f862                	sd	s8,48(sp)
    80207c82:	f466                	sd	s9,40(sp)
    80207c84:	f06a                	sd	s10,32(sp)
    80207c86:	0100                	addi	s0,sp,128
    80207c88:	892a                	mv	s2,a0
    80207c8a:	8cae                	mv	s9,a1
  uint64 sector = b->sectorno;
    80207c8c:	00c56d03          	lwu	s10,12(a0)

  acquire(&disk.vdisk_lock);
    80207c90:	0002b517          	auipc	a0,0x2b
    80207c94:	41850513          	addi	a0,a0,1048 # 802330a8 <disk+0x20a8>
    80207c98:	ffff9097          	auipc	ra,0xffff9
    80207c9c:	a30080e7          	jalr	-1488(ra) # 802006c8 <acquire>
  for(int i = 0; i < 3; i++){
    80207ca0:	4981                	li	s3,0
  for(int i = 0; i < NUM; i++){
    80207ca2:	4c21                	li	s8,8
      disk.free[i] = 0;
    80207ca4:	00029b97          	auipc	s7,0x29
    80207ca8:	35cb8b93          	addi	s7,s7,860 # 80231000 <disk>
    80207cac:	6b09                	lui	s6,0x2
  for(int i = 0; i < 3; i++){
    80207cae:	4a8d                	li	s5,3
  for(int i = 0; i < NUM; i++){
    80207cb0:	8a4e                	mv	s4,s3
    80207cb2:	a051                	j	80207d36 <virtio_disk_rw+0xca>
      disk.free[i] = 0;
    80207cb4:	00fb86b3          	add	a3,s7,a5
    80207cb8:	96da                	add	a3,a3,s6
    80207cba:	00068c23          	sb	zero,24(a3)
    idx[i] = alloc_desc();
    80207cbe:	c21c                	sw	a5,0(a2)
    if(idx[i] < 0){
    80207cc0:	0207c563          	bltz	a5,80207cea <virtio_disk_rw+0x7e>
  for(int i = 0; i < 3; i++){
    80207cc4:	2485                	addiw	s1,s1,1
    80207cc6:	0711                	addi	a4,a4,4
    80207cc8:	25548463          	beq	s1,s5,80207f10 <virtio_disk_rw+0x2a4>
    idx[i] = alloc_desc();
    80207ccc:	863a                	mv	a2,a4
  for(int i = 0; i < NUM; i++){
    80207cce:	0002b697          	auipc	a3,0x2b
    80207cd2:	34a68693          	addi	a3,a3,842 # 80233018 <disk+0x2018>
    80207cd6:	87d2                	mv	a5,s4
    if(disk.free[i]){
    80207cd8:	0006c583          	lbu	a1,0(a3)
    80207cdc:	fde1                	bnez	a1,80207cb4 <virtio_disk_rw+0x48>
  for(int i = 0; i < NUM; i++){
    80207cde:	2785                	addiw	a5,a5,1
    80207ce0:	0685                	addi	a3,a3,1
    80207ce2:	ff879be3          	bne	a5,s8,80207cd8 <virtio_disk_rw+0x6c>
    idx[i] = alloc_desc();
    80207ce6:	57fd                	li	a5,-1
    80207ce8:	c21c                	sw	a5,0(a2)
      for(int j = 0; j < i; j++)
    80207cea:	02905a63          	blez	s1,80207d1e <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    80207cee:	f9042503          	lw	a0,-112(s0)
    80207cf2:	00000097          	auipc	ra,0x0
    80207cf6:	d70080e7          	jalr	-656(ra) # 80207a62 <free_desc>
      for(int j = 0; j < i; j++)
    80207cfa:	4785                	li	a5,1
    80207cfc:	0297d163          	bge	a5,s1,80207d1e <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    80207d00:	f9442503          	lw	a0,-108(s0)
    80207d04:	00000097          	auipc	ra,0x0
    80207d08:	d5e080e7          	jalr	-674(ra) # 80207a62 <free_desc>
      for(int j = 0; j < i; j++)
    80207d0c:	4789                	li	a5,2
    80207d0e:	0097d863          	bge	a5,s1,80207d1e <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    80207d12:	f9842503          	lw	a0,-104(s0)
    80207d16:	00000097          	auipc	ra,0x0
    80207d1a:	d4c080e7          	jalr	-692(ra) # 80207a62 <free_desc>
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    80207d1e:	0002b597          	auipc	a1,0x2b
    80207d22:	38a58593          	addi	a1,a1,906 # 802330a8 <disk+0x20a8>
    80207d26:	0002b517          	auipc	a0,0x2b
    80207d2a:	2f250513          	addi	a0,a0,754 # 80233018 <disk+0x2018>
    80207d2e:	ffffa097          	auipc	ra,0xffffa
    80207d32:	5a0080e7          	jalr	1440(ra) # 802022ce <sleep>
  for(int i = 0; i < 3; i++){
    80207d36:	f9040713          	addi	a4,s0,-112
    80207d3a:	84ce                	mv	s1,s3
    80207d3c:	bf41                	j	80207ccc <virtio_disk_rw+0x60>
    uint32 reserved;
    uint64 sector;
  } buf0;

  if(write)
    buf0.type = VIRTIO_BLK_T_OUT; // write the disk
    80207d3e:	4785                	li	a5,1
    80207d40:	f8f42023          	sw	a5,-128(s0)
  else
    buf0.type = VIRTIO_BLK_T_IN; // read the disk
  buf0.reserved = 0;
    80207d44:	f8042223          	sw	zero,-124(s0)
  buf0.sector = sector;
    80207d48:	f9a43423          	sd	s10,-120(s0)

  // buf0 is on a kernel stack, which is not direct mapped,
  // thus the call to kvmpa().
  disk.desc[idx[0]].addr = (uint64) kwalkaddr(myproc()->kpagetable, (uint64) &buf0);
    80207d4c:	ffffa097          	auipc	ra,0xffffa
    80207d50:	d28080e7          	jalr	-728(ra) # 80201a74 <myproc>
    80207d54:	f9042983          	lw	s3,-112(s0)
    80207d58:	00499493          	slli	s1,s3,0x4
    80207d5c:	0002ba17          	auipc	s4,0x2b
    80207d60:	2a4a0a13          	addi	s4,s4,676 # 80233000 <disk+0x2000>
    80207d64:	000a3a83          	ld	s5,0(s4)
    80207d68:	9aa6                	add	s5,s5,s1
    80207d6a:	f8040593          	addi	a1,s0,-128
    80207d6e:	6d28                	ld	a0,88(a0)
    80207d70:	ffff9097          	auipc	ra,0xffff9
    80207d74:	eaa080e7          	jalr	-342(ra) # 80200c1a <kwalkaddr>
    80207d78:	00aab023          	sd	a0,0(s5)
  disk.desc[idx[0]].len = sizeof(buf0);
    80207d7c:	000a3783          	ld	a5,0(s4)
    80207d80:	97a6                	add	a5,a5,s1
    80207d82:	4741                	li	a4,16
    80207d84:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80207d86:	000a3783          	ld	a5,0(s4)
    80207d8a:	97a6                	add	a5,a5,s1
    80207d8c:	4705                	li	a4,1
    80207d8e:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[0]].next = idx[1];
    80207d92:	f9442703          	lw	a4,-108(s0)
    80207d96:	000a3783          	ld	a5,0(s4)
    80207d9a:	97a6                	add	a5,a5,s1
    80207d9c:	00e79723          	sh	a4,14(a5)

  disk.desc[idx[1]].addr = (uint64) b->data;
    80207da0:	0712                	slli	a4,a4,0x4
    80207da2:	000a3783          	ld	a5,0(s4)
    80207da6:	97ba                	add	a5,a5,a4
    80207da8:	05890693          	addi	a3,s2,88
    80207dac:	e394                	sd	a3,0(a5)
  disk.desc[idx[1]].len = BSIZE;
    80207dae:	000a3783          	ld	a5,0(s4)
    80207db2:	97ba                	add	a5,a5,a4
    80207db4:	20000693          	li	a3,512
    80207db8:	c794                	sw	a3,8(a5)
  if(write)
    80207dba:	100c8c63          	beqz	s9,80207ed2 <virtio_disk_rw+0x266>
    disk.desc[idx[1]].flags = 0; // device reads b->data
    80207dbe:	0002b797          	auipc	a5,0x2b
    80207dc2:	2427b783          	ld	a5,578(a5) # 80233000 <disk+0x2000>
    80207dc6:	97ba                	add	a5,a5,a4
    80207dc8:	00079623          	sh	zero,12(a5)
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    80207dcc:	00029517          	auipc	a0,0x29
    80207dd0:	23450513          	addi	a0,a0,564 # 80231000 <disk>
    80207dd4:	0002b797          	auipc	a5,0x2b
    80207dd8:	22c78793          	addi	a5,a5,556 # 80233000 <disk+0x2000>
    80207ddc:	6394                	ld	a3,0(a5)
    80207dde:	96ba                	add	a3,a3,a4
    80207de0:	00c6d603          	lhu	a2,12(a3)
    80207de4:	00166613          	ori	a2,a2,1
    80207de8:	00c69623          	sh	a2,12(a3)
  disk.desc[idx[1]].next = idx[2];
    80207dec:	f9842683          	lw	a3,-104(s0)
    80207df0:	6390                	ld	a2,0(a5)
    80207df2:	9732                	add	a4,a4,a2
    80207df4:	00d71723          	sh	a3,14(a4)

  disk.info[idx[0]].status = 0;
    80207df8:	20098613          	addi	a2,s3,512
    80207dfc:	0612                	slli	a2,a2,0x4
    80207dfe:	962a                	add	a2,a2,a0
    80207e00:	02060823          	sb	zero,48(a2) # 2030 <_entry-0x801fdfd0>
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    80207e04:	00469713          	slli	a4,a3,0x4
    80207e08:	6394                	ld	a3,0(a5)
    80207e0a:	96ba                	add	a3,a3,a4
    80207e0c:	6589                	lui	a1,0x2
    80207e0e:	03058593          	addi	a1,a1,48 # 2030 <_entry-0x801fdfd0>
    80207e12:	94ae                	add	s1,s1,a1
    80207e14:	94aa                	add	s1,s1,a0
    80207e16:	e284                	sd	s1,0(a3)
  disk.desc[idx[2]].len = 1;
    80207e18:	6394                	ld	a3,0(a5)
    80207e1a:	96ba                	add	a3,a3,a4
    80207e1c:	4585                	li	a1,1
    80207e1e:	c68c                	sw	a1,8(a3)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80207e20:	6394                	ld	a3,0(a5)
    80207e22:	96ba                	add	a3,a3,a4
    80207e24:	4509                	li	a0,2
    80207e26:	00a69623          	sh	a0,12(a3)
  disk.desc[idx[2]].next = 0;
    80207e2a:	6394                	ld	a3,0(a5)
    80207e2c:	9736                	add	a4,a4,a3
    80207e2e:	00071723          	sh	zero,14(a4)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    80207e32:	00b92223          	sw	a1,4(s2)
  disk.info[idx[0]].b = b;
    80207e36:	03263423          	sd	s2,40(a2)

  // avail[0] is flags
  // avail[1] tells the device how far to look in avail[2...].
  // avail[2...] are desc[] indices the device should process.
  // we only tell device the first index in our chain of descriptors.
  disk.avail[2 + (disk.avail[1] % NUM)] = idx[0];
    80207e3a:	6794                	ld	a3,8(a5)
    80207e3c:	0026d703          	lhu	a4,2(a3)
    80207e40:	8b1d                	andi	a4,a4,7
    80207e42:	2709                	addiw	a4,a4,2
    80207e44:	0706                	slli	a4,a4,0x1
    80207e46:	9736                	add	a4,a4,a3
    80207e48:	01371023          	sh	s3,0(a4)
  __sync_synchronize();
    80207e4c:	0ff0000f          	fence
  disk.avail[1] = disk.avail[1] + 1;
    80207e50:	6798                	ld	a4,8(a5)
    80207e52:	00275783          	lhu	a5,2(a4)
    80207e56:	2785                	addiw	a5,a5,1
    80207e58:	00f71123          	sh	a5,2(a4)

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    80207e5c:	00003797          	auipc	a5,0x3
    80207e60:	06c7b783          	ld	a5,108(a5) # 8020aec8 <digits+0xb48>
    80207e64:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    80207e68:	00492703          	lw	a4,4(s2)
    80207e6c:	4785                	li	a5,1
    80207e6e:	02f71163          	bne	a4,a5,80207e90 <virtio_disk_rw+0x224>
    sleep(b, &disk.vdisk_lock);
    80207e72:	0002b997          	auipc	s3,0x2b
    80207e76:	23698993          	addi	s3,s3,566 # 802330a8 <disk+0x20a8>
  while(b->disk == 1) {
    80207e7a:	4485                	li	s1,1
    sleep(b, &disk.vdisk_lock);
    80207e7c:	85ce                	mv	a1,s3
    80207e7e:	854a                	mv	a0,s2
    80207e80:	ffffa097          	auipc	ra,0xffffa
    80207e84:	44e080e7          	jalr	1102(ra) # 802022ce <sleep>
  while(b->disk == 1) {
    80207e88:	00492783          	lw	a5,4(s2)
    80207e8c:	fe9788e3          	beq	a5,s1,80207e7c <virtio_disk_rw+0x210>
  }

  disk.info[idx[0]].b = 0;
    80207e90:	f9042483          	lw	s1,-112(s0)
    80207e94:	20048793          	addi	a5,s1,512
    80207e98:	00479713          	slli	a4,a5,0x4
    80207e9c:	00029797          	auipc	a5,0x29
    80207ea0:	16478793          	addi	a5,a5,356 # 80231000 <disk>
    80207ea4:	97ba                	add	a5,a5,a4
    80207ea6:	0207b423          	sd	zero,40(a5)
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    80207eaa:	0002b917          	auipc	s2,0x2b
    80207eae:	15690913          	addi	s2,s2,342 # 80233000 <disk+0x2000>
    free_desc(i);
    80207eb2:	8526                	mv	a0,s1
    80207eb4:	00000097          	auipc	ra,0x0
    80207eb8:	bae080e7          	jalr	-1106(ra) # 80207a62 <free_desc>
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    80207ebc:	0492                	slli	s1,s1,0x4
    80207ebe:	00093783          	ld	a5,0(s2)
    80207ec2:	94be                	add	s1,s1,a5
    80207ec4:	00c4d783          	lhu	a5,12(s1)
    80207ec8:	8b85                	andi	a5,a5,1
    80207eca:	cf89                	beqz	a5,80207ee4 <virtio_disk_rw+0x278>
      i = disk.desc[i].next;
    80207ecc:	00e4d483          	lhu	s1,14(s1)
    free_desc(i);
    80207ed0:	b7cd                	j	80207eb2 <virtio_disk_rw+0x246>
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80207ed2:	0002b797          	auipc	a5,0x2b
    80207ed6:	12e7b783          	ld	a5,302(a5) # 80233000 <disk+0x2000>
    80207eda:	97ba                	add	a5,a5,a4
    80207edc:	4689                	li	a3,2
    80207ede:	00d79623          	sh	a3,12(a5)
    80207ee2:	b5ed                	j	80207dcc <virtio_disk_rw+0x160>
  free_chain(idx[0]);

  release(&disk.vdisk_lock);
    80207ee4:	0002b517          	auipc	a0,0x2b
    80207ee8:	1c450513          	addi	a0,a0,452 # 802330a8 <disk+0x20a8>
    80207eec:	ffff9097          	auipc	ra,0xffff9
    80207ef0:	830080e7          	jalr	-2000(ra) # 8020071c <release>
}
    80207ef4:	70e6                	ld	ra,120(sp)
    80207ef6:	7446                	ld	s0,112(sp)
    80207ef8:	74a6                	ld	s1,104(sp)
    80207efa:	7906                	ld	s2,96(sp)
    80207efc:	69e6                	ld	s3,88(sp)
    80207efe:	6a46                	ld	s4,80(sp)
    80207f00:	6aa6                	ld	s5,72(sp)
    80207f02:	6b06                	ld	s6,64(sp)
    80207f04:	7be2                	ld	s7,56(sp)
    80207f06:	7c42                	ld	s8,48(sp)
    80207f08:	7ca2                	ld	s9,40(sp)
    80207f0a:	7d02                	ld	s10,32(sp)
    80207f0c:	6109                	addi	sp,sp,128
    80207f0e:	8082                	ret
  if(write)
    80207f10:	e20c97e3          	bnez	s9,80207d3e <virtio_disk_rw+0xd2>
    buf0.type = VIRTIO_BLK_T_IN; // read the disk
    80207f14:	f8042023          	sw	zero,-128(s0)
    80207f18:	b535                	j	80207d44 <virtio_disk_rw+0xd8>

0000000080207f1a <virtio_disk_intr>:

void
virtio_disk_intr()
{
    80207f1a:	1101                	addi	sp,sp,-32
    80207f1c:	ec06                	sd	ra,24(sp)
    80207f1e:	e822                	sd	s0,16(sp)
    80207f20:	e426                	sd	s1,8(sp)
    80207f22:	e04a                	sd	s2,0(sp)
    80207f24:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    80207f26:	0002b517          	auipc	a0,0x2b
    80207f2a:	18250513          	addi	a0,a0,386 # 802330a8 <disk+0x20a8>
    80207f2e:	ffff8097          	auipc	ra,0xffff8
    80207f32:	79a080e7          	jalr	1946(ra) # 802006c8 <acquire>

  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    80207f36:	0002b717          	auipc	a4,0x2b
    80207f3a:	0ca70713          	addi	a4,a4,202 # 80233000 <disk+0x2000>
    80207f3e:	02075783          	lhu	a5,32(a4)
    80207f42:	6b18                	ld	a4,16(a4)
    80207f44:	00275683          	lhu	a3,2(a4)
    80207f48:	8ebd                	xor	a3,a3,a5
    80207f4a:	8a9d                	andi	a3,a3,7
    80207f4c:	cab9                	beqz	a3,80207fa2 <virtio_disk_intr+0x88>
    int id = disk.used->elems[disk.used_idx].id;

    if(disk.info[id].status != 0)
    80207f4e:	00029917          	auipc	s2,0x29
    80207f52:	0b290913          	addi	s2,s2,178 # 80231000 <disk>
      panic("virtio_disk_intr status");
    
    disk.info[id].b->disk = 0;   // disk is done with buf
    wakeup(disk.info[id].b);

    disk.used_idx = (disk.used_idx + 1) % NUM;
    80207f56:	0002b497          	auipc	s1,0x2b
    80207f5a:	0aa48493          	addi	s1,s1,170 # 80233000 <disk+0x2000>
    int id = disk.used->elems[disk.used_idx].id;
    80207f5e:	078e                	slli	a5,a5,0x3
    80207f60:	97ba                	add	a5,a5,a4
    80207f62:	43dc                	lw	a5,4(a5)
    if(disk.info[id].status != 0)
    80207f64:	20078713          	addi	a4,a5,512
    80207f68:	0712                	slli	a4,a4,0x4
    80207f6a:	974a                	add	a4,a4,s2
    80207f6c:	03074703          	lbu	a4,48(a4)
    80207f70:	e335                	bnez	a4,80207fd4 <virtio_disk_intr+0xba>
    disk.info[id].b->disk = 0;   // disk is done with buf
    80207f72:	20078793          	addi	a5,a5,512
    80207f76:	0792                	slli	a5,a5,0x4
    80207f78:	97ca                	add	a5,a5,s2
    80207f7a:	7798                	ld	a4,40(a5)
    80207f7c:	00072223          	sw	zero,4(a4)
    wakeup(disk.info[id].b);
    80207f80:	7788                	ld	a0,40(a5)
    80207f82:	ffffa097          	auipc	ra,0xffffa
    80207f86:	4ce080e7          	jalr	1230(ra) # 80202450 <wakeup>
    disk.used_idx = (disk.used_idx + 1) % NUM;
    80207f8a:	0204d783          	lhu	a5,32(s1)
    80207f8e:	2785                	addiw	a5,a5,1
    80207f90:	8b9d                	andi	a5,a5,7
    80207f92:	02f49023          	sh	a5,32(s1)
  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    80207f96:	6898                	ld	a4,16(s1)
    80207f98:	00275683          	lhu	a3,2(a4)
    80207f9c:	8a9d                	andi	a3,a3,7
    80207f9e:	fcf690e3          	bne	a3,a5,80207f5e <virtio_disk_intr+0x44>
  }
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    80207fa2:	00003797          	auipc	a5,0x3
    80207fa6:	f2e7b783          	ld	a5,-210(a5) # 8020aed0 <digits+0xb50>
    80207faa:	439c                	lw	a5,0(a5)
    80207fac:	8b8d                	andi	a5,a5,3
    80207fae:	00003717          	auipc	a4,0x3
    80207fb2:	f2a73703          	ld	a4,-214(a4) # 8020aed8 <digits+0xb58>
    80207fb6:	c31c                	sw	a5,0(a4)

  release(&disk.vdisk_lock);
    80207fb8:	0002b517          	auipc	a0,0x2b
    80207fbc:	0f050513          	addi	a0,a0,240 # 802330a8 <disk+0x20a8>
    80207fc0:	ffff8097          	auipc	ra,0xffff8
    80207fc4:	75c080e7          	jalr	1884(ra) # 8020071c <release>
}
    80207fc8:	60e2                	ld	ra,24(sp)
    80207fca:	6442                	ld	s0,16(sp)
    80207fcc:	64a2                	ld	s1,8(sp)
    80207fce:	6902                	ld	s2,0(sp)
    80207fd0:	6105                	addi	sp,sp,32
    80207fd2:	8082                	ret
      panic("virtio_disk_intr status");
    80207fd4:	00003517          	auipc	a0,0x3
    80207fd8:	e8450513          	addi	a0,a0,-380 # 8020ae58 <digits+0xad8>
    80207fdc:	ffff8097          	auipc	ra,0xffff8
    80207fe0:	166080e7          	jalr	358(ra) # 80200142 <panic>

0000000080207fe4 <uartinit>:

void uartstart();

void
uartinit(void)
{
    80207fe4:	1141                	addi	sp,sp,-16
    80207fe6:	e406                	sd	ra,8(sp)
    80207fe8:	e022                	sd	s0,0(sp)
    80207fea:	0800                	addi	s0,sp,16
  // disable interrupts.
  WriteReg(IER, 0x00);
    80207fec:	100007b7          	lui	a5,0x10000
    80207ff0:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x701fffff>

  // special mode to set baud rate.
  WriteReg(LCR, LCR_BAUD_LATCH);
    80207ff4:	f8000713          	li	a4,-128
    80207ff8:	00e781a3          	sb	a4,3(a5)

  // LSB for baud rate of 38.4K.
  WriteReg(0, 0x03);
    80207ffc:	470d                	li	a4,3
    80207ffe:	00e78023          	sb	a4,0(a5)

  // MSB for baud rate of 38.4K.
  WriteReg(1, 0x00);
    80208002:	000780a3          	sb	zero,1(a5)

  // leave set-baud mode,
  // and set word length to 8 bits, no parity.
  WriteReg(LCR, LCR_EIGHT_BITS);
    80208006:	00e781a3          	sb	a4,3(a5)

  // reset and enable FIFOs.
  WriteReg(FCR, FCR_FIFO_ENABLE | FCR_FIFO_CLEAR);
    8020800a:	469d                	li	a3,7
    8020800c:	00d78123          	sb	a3,2(a5)

  // enable transmit and receive interrupts.
  WriteReg(IER, IER_TX_ENABLE | IER_RX_ENABLE);
    80208010:	00e780a3          	sb	a4,1(a5)

    uart_tx_w = uart_tx_r = 0;
    80208014:	0002c797          	auipc	a5,0x2c
    80208018:	fec78793          	addi	a5,a5,-20 # 80234000 <uart_tx_r>
    8020801c:	0007a023          	sw	zero,0(a5)
    80208020:	0007a223          	sw	zero,4(a5)

  initlock(&uart_tx_lock, "uart");
    80208024:	00003597          	auipc	a1,0x3
    80208028:	ebc58593          	addi	a1,a1,-324 # 8020aee0 <digits+0xb60>
    8020802c:	0002c517          	auipc	a0,0x2c
    80208030:	fdc50513          	addi	a0,a0,-36 # 80234008 <uart_tx_lock>
    80208034:	ffff8097          	auipc	ra,0xffff8
    80208038:	650080e7          	jalr	1616(ra) # 80200684 <initlock>
}
    8020803c:	60a2                	ld	ra,8(sp)
    8020803e:	6402                	ld	s0,0(sp)
    80208040:	0141                	addi	sp,sp,16
    80208042:	8082                	ret

0000000080208044 <uartputc_sync>:
// use interrupts, for use by kernel printf() and
// to echo characters. it spins waiting for the uart's
// output register to be empty.
void
uartputc_sync(int c)
{
    80208044:	1101                	addi	sp,sp,-32
    80208046:	ec06                	sd	ra,24(sp)
    80208048:	e822                	sd	s0,16(sp)
    8020804a:	e426                	sd	s1,8(sp)
    8020804c:	1000                	addi	s0,sp,32
    8020804e:	84aa                	mv	s1,a0
  push_off();
    80208050:	ffff8097          	auipc	ra,0xffff8
    80208054:	588080e7          	jalr	1416(ra) # 802005d8 <push_off>

  if(panicked){
    80208058:	00005797          	auipc	a5,0x5
    8020805c:	0687b783          	ld	a5,104(a5) # 8020d0c0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80208060:	439c                	lw	a5,0(a5)
    80208062:	2781                	sext.w	a5,a5
    for(;;)
      ;
  }

  // wait for Transmit Holding Empty to be set in LSR.
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    80208064:	10000737          	lui	a4,0x10000
  if(panicked){
    80208068:	c391                	beqz	a5,8020806c <uartputc_sync+0x28>
    for(;;)
    8020806a:	a001                	j	8020806a <uartputc_sync+0x26>
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    8020806c:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x701ffffb>
    80208070:	0ff7f793          	andi	a5,a5,255
    80208074:	0207f793          	andi	a5,a5,32
    80208078:	dbf5                	beqz	a5,8020806c <uartputc_sync+0x28>
    ;
  WriteReg(THR, c);
    8020807a:	0ff4f793          	andi	a5,s1,255
    8020807e:	10000737          	lui	a4,0x10000
    80208082:	00f70023          	sb	a5,0(a4) # 10000000 <_entry-0x70200000>

  pop_off();
    80208086:	ffff8097          	auipc	ra,0xffff8
    8020808a:	59e080e7          	jalr	1438(ra) # 80200624 <pop_off>
}
    8020808e:	60e2                	ld	ra,24(sp)
    80208090:	6442                	ld	s0,16(sp)
    80208092:	64a2                	ld	s1,8(sp)
    80208094:	6105                	addi	sp,sp,32
    80208096:	8082                	ret

0000000080208098 <uartstart>:
// called from both the top- and bottom-half.
void
uartstart()
{
  while(1){
    if(uart_tx_w == uart_tx_r){
    80208098:	0002c717          	auipc	a4,0x2c
    8020809c:	f6870713          	addi	a4,a4,-152 # 80234000 <uart_tx_r>
    802080a0:	431c                	lw	a5,0(a4)
    802080a2:	4358                	lw	a4,4(a4)
    802080a4:	06f70563          	beq	a4,a5,8020810e <uartstart+0x76>
{
    802080a8:	7179                	addi	sp,sp,-48
    802080aa:	f406                	sd	ra,40(sp)
    802080ac:	f022                	sd	s0,32(sp)
    802080ae:	ec26                	sd	s1,24(sp)
    802080b0:	e84a                	sd	s2,16(sp)
    802080b2:	e44e                	sd	s3,8(sp)
    802080b4:	1800                	addi	s0,sp,48
      // transmit buffer is empty.
      return;
    }
    
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    802080b6:	10000937          	lui	s2,0x10000
      // so we cannot give it another byte.
      // it will interrupt when it's ready for a new byte.
      return;
    }
    
    int c = uart_tx_buf[uart_tx_r];
    802080ba:	0002c497          	auipc	s1,0x2c
    802080be:	f4648493          	addi	s1,s1,-186 # 80234000 <uart_tx_r>
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    802080c2:	00594703          	lbu	a4,5(s2) # 10000005 <_entry-0x701ffffb>
    802080c6:	0ff77713          	andi	a4,a4,255
    802080ca:	02077713          	andi	a4,a4,32
    802080ce:	cb0d                	beqz	a4,80208100 <uartstart+0x68>
    int c = uart_tx_buf[uart_tx_r];
    802080d0:	00f48733          	add	a4,s1,a5
    802080d4:	02074983          	lbu	s3,32(a4)
    uart_tx_r = (uart_tx_r + 1) % UART_TX_BUF_SIZE;
    802080d8:	2785                	addiw	a5,a5,1
    802080da:	41f7d71b          	sraiw	a4,a5,0x1f
    802080de:	01b7571b          	srliw	a4,a4,0x1b
    802080e2:	9fb9                	addw	a5,a5,a4
    802080e4:	8bfd                	andi	a5,a5,31
    802080e6:	9f99                	subw	a5,a5,a4
    802080e8:	c09c                	sw	a5,0(s1)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    802080ea:	8526                	mv	a0,s1
    802080ec:	ffffa097          	auipc	ra,0xffffa
    802080f0:	364080e7          	jalr	868(ra) # 80202450 <wakeup>
    
    WriteReg(THR, c);
    802080f4:	01390023          	sb	s3,0(s2)
    if(uart_tx_w == uart_tx_r){
    802080f8:	409c                	lw	a5,0(s1)
    802080fa:	40d8                	lw	a4,4(s1)
    802080fc:	fcf713e3          	bne	a4,a5,802080c2 <uartstart+0x2a>
  }
}
    80208100:	70a2                	ld	ra,40(sp)
    80208102:	7402                	ld	s0,32(sp)
    80208104:	64e2                	ld	s1,24(sp)
    80208106:	6942                	ld	s2,16(sp)
    80208108:	69a2                	ld	s3,8(sp)
    8020810a:	6145                	addi	sp,sp,48
    8020810c:	8082                	ret
    8020810e:	8082                	ret

0000000080208110 <uartputc>:
{
    80208110:	7179                	addi	sp,sp,-48
    80208112:	f406                	sd	ra,40(sp)
    80208114:	f022                	sd	s0,32(sp)
    80208116:	ec26                	sd	s1,24(sp)
    80208118:	e84a                	sd	s2,16(sp)
    8020811a:	e44e                	sd	s3,8(sp)
    8020811c:	1800                	addi	s0,sp,48
    8020811e:	892a                	mv	s2,a0
  acquire(&uart_tx_lock);
    80208120:	0002c517          	auipc	a0,0x2c
    80208124:	ee850513          	addi	a0,a0,-280 # 80234008 <uart_tx_lock>
    80208128:	ffff8097          	auipc	ra,0xffff8
    8020812c:	5a0080e7          	jalr	1440(ra) # 802006c8 <acquire>
  if(panicked){
    80208130:	00005797          	auipc	a5,0x5
    80208134:	f907b783          	ld	a5,-112(a5) # 8020d0c0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80208138:	439c                	lw	a5,0(a5)
    8020813a:	2781                	sext.w	a5,a5
    8020813c:	c391                	beqz	a5,80208140 <uartputc+0x30>
    for(;;)
    8020813e:	a001                	j	8020813e <uartputc+0x2e>
    if(((uart_tx_w + 1) % UART_TX_BUF_SIZE) == uart_tx_r){
    80208140:	0002c617          	auipc	a2,0x2c
    80208144:	ec060613          	addi	a2,a2,-320 # 80234000 <uart_tx_r>
    80208148:	4258                	lw	a4,4(a2)
    8020814a:	0017079b          	addiw	a5,a4,1
    8020814e:	41f7d69b          	sraiw	a3,a5,0x1f
    80208152:	01b6d69b          	srliw	a3,a3,0x1b
    80208156:	9fb5                	addw	a5,a5,a3
    80208158:	8bfd                	andi	a5,a5,31
    8020815a:	9f95                	subw	a5,a5,a3
    8020815c:	4214                	lw	a3,0(a2)
    8020815e:	02f69a63          	bne	a3,a5,80208192 <uartputc+0x82>
      sleep(&uart_tx_r, &uart_tx_lock);
    80208162:	84b2                	mv	s1,a2
    80208164:	0002c997          	auipc	s3,0x2c
    80208168:	ea498993          	addi	s3,s3,-348 # 80234008 <uart_tx_lock>
    8020816c:	85ce                	mv	a1,s3
    8020816e:	8526                	mv	a0,s1
    80208170:	ffffa097          	auipc	ra,0xffffa
    80208174:	15e080e7          	jalr	350(ra) # 802022ce <sleep>
    if(((uart_tx_w + 1) % UART_TX_BUF_SIZE) == uart_tx_r){
    80208178:	40d8                	lw	a4,4(s1)
    8020817a:	0017079b          	addiw	a5,a4,1
    8020817e:	41f7d69b          	sraiw	a3,a5,0x1f
    80208182:	01b6d69b          	srliw	a3,a3,0x1b
    80208186:	9fb5                	addw	a5,a5,a3
    80208188:	8bfd                	andi	a5,a5,31
    8020818a:	9f95                	subw	a5,a5,a3
    8020818c:	4094                	lw	a3,0(s1)
    8020818e:	fcf68fe3          	beq	a3,a5,8020816c <uartputc+0x5c>
      uart_tx_buf[uart_tx_w] = c;
    80208192:	0002c697          	auipc	a3,0x2c
    80208196:	e6e68693          	addi	a3,a3,-402 # 80234000 <uart_tx_r>
    8020819a:	9736                	add	a4,a4,a3
    8020819c:	03270023          	sb	s2,32(a4)
      uart_tx_w = (uart_tx_w + 1) % UART_TX_BUF_SIZE;
    802081a0:	c2dc                	sw	a5,4(a3)
      uartstart();
    802081a2:	00000097          	auipc	ra,0x0
    802081a6:	ef6080e7          	jalr	-266(ra) # 80208098 <uartstart>
      release(&uart_tx_lock);
    802081aa:	0002c517          	auipc	a0,0x2c
    802081ae:	e5e50513          	addi	a0,a0,-418 # 80234008 <uart_tx_lock>
    802081b2:	ffff8097          	auipc	ra,0xffff8
    802081b6:	56a080e7          	jalr	1386(ra) # 8020071c <release>
}
    802081ba:	70a2                	ld	ra,40(sp)
    802081bc:	7402                	ld	s0,32(sp)
    802081be:	64e2                	ld	s1,24(sp)
    802081c0:	6942                	ld	s2,16(sp)
    802081c2:	69a2                	ld	s3,8(sp)
    802081c4:	6145                	addi	sp,sp,48
    802081c6:	8082                	ret

00000000802081c8 <uartgetc>:

// read one input character from the UART.
// return -1 if none is waiting.
int
uartgetc(void)
{
    802081c8:	1141                	addi	sp,sp,-16
    802081ca:	e422                	sd	s0,8(sp)
    802081cc:	0800                	addi	s0,sp,16
  if(ReadReg(LSR) & 0x01){
    802081ce:	100007b7          	lui	a5,0x10000
    802081d2:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x701ffffb>
    802081d6:	8b85                	andi	a5,a5,1
    802081d8:	cb91                	beqz	a5,802081ec <uartgetc+0x24>
    // input data is ready.
    return ReadReg(RHR);
    802081da:	100007b7          	lui	a5,0x10000
    802081de:	0007c503          	lbu	a0,0(a5) # 10000000 <_entry-0x70200000>
    802081e2:	0ff57513          	andi	a0,a0,255
  } else {
    return -1;
  }
}
    802081e6:	6422                	ld	s0,8(sp)
    802081e8:	0141                	addi	sp,sp,16
    802081ea:	8082                	ret
    return -1;
    802081ec:	557d                	li	a0,-1
    802081ee:	bfe5                	j	802081e6 <uartgetc+0x1e>

00000000802081f0 <uartintr>:
// handle a uart interrupt, raised because input has
// arrived, or the uart is ready for more output, or
// both. called from trap.c.
void
uartintr(void)
{
    802081f0:	1101                	addi	sp,sp,-32
    802081f2:	ec06                	sd	ra,24(sp)
    802081f4:	e822                	sd	s0,16(sp)
    802081f6:	e426                	sd	s1,8(sp)
    802081f8:	1000                	addi	s0,sp,32
  // read and process incoming characters.
  while(1){
    int c = uartgetc();
    if(c == -1)
    802081fa:	54fd                	li	s1,-1
    int c = uartgetc();
    802081fc:	00000097          	auipc	ra,0x0
    80208200:	fcc080e7          	jalr	-52(ra) # 802081c8 <uartgetc>
    if(c == -1)
    80208204:	00950763          	beq	a0,s1,80208212 <uartintr+0x22>
      break;
    consoleintr(c);
    80208208:	fffff097          	auipc	ra,0xfffff
    8020820c:	66a080e7          	jalr	1642(ra) # 80207872 <consoleintr>
  while(1){
    80208210:	b7f5                	j	802081fc <uartintr+0xc>
  }

  // send buffered characters.
  acquire(&uart_tx_lock);
    80208212:	0002c497          	auipc	s1,0x2c
    80208216:	df648493          	addi	s1,s1,-522 # 80234008 <uart_tx_lock>
    8020821a:	8526                	mv	a0,s1
    8020821c:	ffff8097          	auipc	ra,0xffff8
    80208220:	4ac080e7          	jalr	1196(ra) # 802006c8 <acquire>
  uartstart();
    80208224:	00000097          	auipc	ra,0x0
    80208228:	e74080e7          	jalr	-396(ra) # 80208098 <uartstart>
  release(&uart_tx_lock);
    8020822c:	8526                	mv	a0,s1
    8020822e:	ffff8097          	auipc	ra,0xffff8
    80208232:	4ee080e7          	jalr	1262(ra) # 8020071c <release>
}
    80208236:	60e2                	ld	ra,24(sp)
    80208238:	6442                	ld	s0,16(sp)
    8020823a:	64a2                	ld	s1,8(sp)
    8020823c:	6105                	addi	sp,sp,32
    8020823e:	8082                	ret
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
