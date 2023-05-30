
kernel-qemu:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_entry>:
    80200000:	00150293          	addi	t0,a0,1
    80200004:	02ba                	slli	t0,t0,0xe
    80200006:	0000c117          	auipc	sp,0xc
    8020000a:	0fa13103          	ld	sp,250(sp) # 8020c100 <_GLOBAL_OFFSET_TABLE_+0x50>
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
    80200036:	00009617          	auipc	a2,0x9
    8020003a:	34a60613          	addi	a2,a2,842 # 80209380 <digits>
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
    80200098:	780080e7          	jalr	1920(ra) # 80207814 <consputc>
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
    802000ce:	74a080e7          	jalr	1866(ra) # 80207814 <consputc>
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
    80200100:	00009517          	auipc	a0,0x9
    80200104:	f0050513          	addi	a0,a0,-256 # 80209000 <etext>
    80200108:	00000097          	auipc	ra,0x0
    8020010c:	084080e7          	jalr	132(ra) # 8020018c <printf>
  while (fp < bottom) {
    80200110:	0324f263          	bgeu	s1,s2,80200134 <backtrace+0x52>
    uint64 ra = *(fp - 1);
    printf("%p\n", ra - 4);
    80200114:	00009997          	auipc	s3,0x9
    80200118:	4d498993          	addi	s3,s3,1236 # 802095e8 <digits+0x268>
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
    8020014e:	00009517          	auipc	a0,0x9
    80200152:	ec250513          	addi	a0,a0,-318 # 80209010 <etext+0x10>
    80200156:	00000097          	auipc	ra,0x0
    8020015a:	036080e7          	jalr	54(ra) # 8020018c <printf>
  printf(s);
    8020015e:	8526                	mv	a0,s1
    80200160:	00000097          	auipc	ra,0x0
    80200164:	02c080e7          	jalr	44(ra) # 8020018c <printf>
  printf("\n");
    80200168:	00009517          	auipc	a0,0x9
    8020016c:	f7050513          	addi	a0,a0,-144 # 802090d8 <etext+0xd8>
    80200170:	00000097          	auipc	ra,0x0
    80200174:	01c080e7          	jalr	28(ra) # 8020018c <printf>
  backtrace();
    80200178:	00000097          	auipc	ra,0x0
    8020017c:	f6a080e7          	jalr	-150(ra) # 802000e2 <backtrace>
  panicked = 1; // freeze uart output from other CPUs
    80200180:	4785                	li	a5,1
    80200182:	00015717          	auipc	a4,0x15
    80200186:	e6f72f23          	sw	a5,-386(a4) # 80215000 <panicked>
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
    802001be:	00015d97          	auipc	s11,0x15
    802001c2:	e62dad83          	lw	s11,-414(s11) # 80215020 <pr+0x18>
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
    802001ea:	00009b97          	auipc	s7,0x9
    802001ee:	196b8b93          	addi	s7,s7,406 # 80209380 <digits>
    switch(c){
    802001f2:	07300c93          	li	s9,115
    802001f6:	06400c13          	li	s8,100
    802001fa:	a82d                	j	80200234 <printf+0xa8>
    acquire(&pr.lock);
    802001fc:	00015517          	auipc	a0,0x15
    80200200:	e0c50513          	addi	a0,a0,-500 # 80215008 <pr>
    80200204:	00000097          	auipc	ra,0x0
    80200208:	4c4080e7          	jalr	1220(ra) # 802006c8 <acquire>
    8020020c:	bf7d                	j	802001ca <printf+0x3e>
    panic("null fmt");
    8020020e:	00009517          	auipc	a0,0x9
    80200212:	e1250513          	addi	a0,a0,-494 # 80209020 <etext+0x20>
    80200216:	00000097          	auipc	ra,0x0
    8020021a:	f2c080e7          	jalr	-212(ra) # 80200142 <panic>
      consputc(c);
    8020021e:	00007097          	auipc	ra,0x7
    80200222:	5f6080e7          	jalr	1526(ra) # 80207814 <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80200226:	2485                	addiw	s1,s1,1
    80200228:	009a07b3          	add	a5,s4,s1
    8020022c:	0007c503          	lbu	a0,0(a5) # fffffffffffff000 <ebss_clear+0xffffffff7fdcc000>
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
    802002b4:	564080e7          	jalr	1380(ra) # 80207814 <consputc>
  consputc('x');
    802002b8:	07800513          	li	a0,120
    802002bc:	00007097          	auipc	ra,0x7
    802002c0:	558080e7          	jalr	1368(ra) # 80207814 <consputc>
    802002c4:	896a                	mv	s2,s10
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802002c6:	03c9d793          	srli	a5,s3,0x3c
    802002ca:	97de                	add	a5,a5,s7
    802002cc:	0007c503          	lbu	a0,0(a5)
    802002d0:	00007097          	auipc	ra,0x7
    802002d4:	544080e7          	jalr	1348(ra) # 80207814 <consputc>
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
    80200300:	518080e7          	jalr	1304(ra) # 80207814 <consputc>
      for(; *s; s++)
    80200304:	0905                	addi	s2,s2,1
    80200306:	00094503          	lbu	a0,0(s2)
    8020030a:	f96d                	bnez	a0,802002fc <printf+0x170>
    8020030c:	bf29                	j	80200226 <printf+0x9a>
        s = "(null)";
    8020030e:	00009917          	auipc	s2,0x9
    80200312:	d0a90913          	addi	s2,s2,-758 # 80209018 <etext+0x18>
      for(; *s; s++)
    80200316:	02800513          	li	a0,40
    8020031a:	b7cd                	j	802002fc <printf+0x170>
      consputc('%');
    8020031c:	8556                	mv	a0,s5
    8020031e:	00007097          	auipc	ra,0x7
    80200322:	4f6080e7          	jalr	1270(ra) # 80207814 <consputc>
      break;
    80200326:	b701                	j	80200226 <printf+0x9a>
      consputc('%');
    80200328:	8556                	mv	a0,s5
    8020032a:	00007097          	auipc	ra,0x7
    8020032e:	4ea080e7          	jalr	1258(ra) # 80207814 <consputc>
      consputc(c);
    80200332:	854a                	mv	a0,s2
    80200334:	00007097          	auipc	ra,0x7
    80200338:	4e0080e7          	jalr	1248(ra) # 80207814 <consputc>
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
    80200360:	00015517          	auipc	a0,0x15
    80200364:	ca850513          	addi	a0,a0,-856 # 80215008 <pr>
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
    8020037a:	00009597          	auipc	a1,0x9
    8020037e:	cb658593          	addi	a1,a1,-842 # 80209030 <etext+0x30>
    80200382:	00015517          	auipc	a0,0x15
    80200386:	c8650513          	addi	a0,a0,-890 # 80215008 <pr>
    8020038a:	00000097          	auipc	ra,0x0
    8020038e:	2fa080e7          	jalr	762(ra) # 80200684 <initlock>
  pr.locking = 1;   // changed, used to be 1
    80200392:	4785                	li	a5,1
    80200394:	00015717          	auipc	a4,0x15
    80200398:	c8f72623          	sw	a5,-884(a4) # 80215020 <pr+0x18>
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
    802003ac:	00009517          	auipc	a0,0x9
    802003b0:	c8c50513          	addi	a0,a0,-884 # 80209038 <etext+0x38>
    802003b4:	00000097          	auipc	ra,0x0
    802003b8:	dd8080e7          	jalr	-552(ra) # 8020018c <printf>
    printf(" ( OO ).        _(OO  )_                        .(  OO)    _(  OO)  ( '.( OO )_ \n");
    802003bc:	00009517          	auipc	a0,0x9
    802003c0:	ccc50513          	addi	a0,a0,-820 # 80209088 <etext+0x88>
    802003c4:	00000097          	auipc	ra,0x0
    802003c8:	dc8080e7          	jalr	-568(ra) # 8020018c <printf>
    printf("(_/.  \\_)-. ,--(_/   ,. \\  ,--.                (_)---\\_)  (,------.  ,--.   ,--.) ,--. ,--.  \n");
    802003cc:	00009517          	auipc	a0,0x9
    802003d0:	d1450513          	addi	a0,a0,-748 # 802090e0 <etext+0xe0>
    802003d4:	00000097          	auipc	ra,0x0
    802003d8:	db8080e7          	jalr	-584(ra) # 8020018c <printf>
    printf(" \\  `.'  /  \\   \\   /(__/ /  .'       .-')     '  .-.  '   |  .---'  |   `.'   |  |  | |  |   \n");
    802003dc:	00009517          	auipc	a0,0x9
    802003e0:	d6450513          	addi	a0,a0,-668 # 80209140 <etext+0x140>
    802003e4:	00000097          	auipc	ra,0x0
    802003e8:	da8080e7          	jalr	-600(ra) # 8020018c <printf>
    printf("  \\     /\\   \\   \\ /   / .  / -.    _(  OO)   ,|  | |  |   |  |      |         |  |  | | .-')\n");
    802003ec:	00009517          	auipc	a0,0x9
    802003f0:	db450513          	addi	a0,a0,-588 # 802091a0 <etext+0x1a0>
    802003f4:	00000097          	auipc	ra,0x0
    802003f8:	d98080e7          	jalr	-616(ra) # 8020018c <printf>
    printf("   \\   \\ |    \\   '   /, | .-.  '  (,------. (_|  | |  |  (|  '--.   |  |'.'|  |  |  |_|( OO )\n");
    802003fc:	00009517          	auipc	a0,0x9
    80200400:	e0450513          	addi	a0,a0,-508 # 80209200 <etext+0x200>
    80200404:	00000097          	auipc	ra,0x0
    80200408:	d88080e7          	jalr	-632(ra) # 8020018c <printf>
    printf("  .'    \\_)    \\     /__)' \\  |  |  '------'   |  | |  |   |  .--'   |  |   |  |  |  | | `-' /\n");
    8020040c:	00009517          	auipc	a0,0x9
    80200410:	e5450513          	addi	a0,a0,-428 # 80209260 <etext+0x260>
    80200414:	00000097          	auipc	ra,0x0
    80200418:	d78080e7          	jalr	-648(ra) # 8020018c <printf>
    printf(" /  .'.  \\      \\   /    \\  `'  /              '  '-'  '-. |  `---.  |  |   |  | ('  '-'(_.-'\n");
    8020041c:	00009517          	auipc	a0,0x9
    80200420:	ea450513          	addi	a0,a0,-348 # 802092c0 <etext+0x2c0>
    80200424:	00000097          	auipc	ra,0x0
    80200428:	d68080e7          	jalr	-664(ra) # 8020018c <printf>
    printf("'--'   '--'      `-'      `----'                `-----'--' `------'  `--'   `--'   `-----'\n");
    8020042c:	00009517          	auipc	a0,0x9
    80200430:	ef450513          	addi	a0,a0,-268 # 80209320 <etext+0x320>
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
    80200458:	0000c797          	auipc	a5,0xc
    8020045c:	c807b783          	ld	a5,-896(a5) # 8020c0d8 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    8020047a:	00015917          	auipc	s2,0x15
    8020047e:	bae90913          	addi	s2,s2,-1106 # 80215028 <kmem>
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
    802004b6:	00009517          	auipc	a0,0x9
    802004ba:	ee250513          	addi	a0,a0,-286 # 80209398 <digits+0x18>
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
    8020051a:	00015497          	auipc	s1,0x15
    8020051e:	b0e48493          	addi	s1,s1,-1266 # 80215028 <kmem>
    80200522:	00009597          	auipc	a1,0x9
    80200526:	e7e58593          	addi	a1,a1,-386 # 802093a0 <digits+0x20>
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
    80200542:	0000c517          	auipc	a0,0xc
    80200546:	b9653503          	ld	a0,-1130(a0) # 8020c0d8 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80200566:	00015497          	auipc	s1,0x15
    8020056a:	ac248493          	addi	s1,s1,-1342 # 80215028 <kmem>
    8020056e:	8526                	mv	a0,s1
    80200570:	00000097          	auipc	ra,0x0
    80200574:	158080e7          	jalr	344(ra) # 802006c8 <acquire>
  r = kmem.freelist;
    80200578:	6c84                	ld	s1,24(s1)
  if(r) {
    8020057a:	c89d                	beqz	s1,802005b0 <kalloc+0x54>
    kmem.freelist = r->next;
    8020057c:	609c                	ld	a5,0(s1)
    8020057e:	00015517          	auipc	a0,0x15
    80200582:	aaa50513          	addi	a0,a0,-1366 # 80215028 <kmem>
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
    802005b0:	00015517          	auipc	a0,0x15
    802005b4:	a7850513          	addi	a0,a0,-1416 # 80215028 <kmem>
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
    802005c8:	00015517          	auipc	a0,0x15
    802005cc:	a8053503          	ld	a0,-1408(a0) # 80215048 <kmem+0x20>
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
    80200664:	00009517          	auipc	a0,0x9
    80200668:	d4450513          	addi	a0,a0,-700 # 802093a8 <digits+0x28>
    8020066c:	00000097          	auipc	ra,0x0
    80200670:	ad6080e7          	jalr	-1322(ra) # 80200142 <panic>
    panic("pop_off");
    80200674:	00009517          	auipc	a0,0x9
    80200678:	d4c50513          	addi	a0,a0,-692 # 802093c0 <digits+0x40>
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
    8020070c:	00009517          	auipc	a0,0x9
    80200710:	cbc50513          	addi	a0,a0,-836 # 802093c8 <digits+0x48>
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
    80200754:	00009517          	auipc	a0,0x9
    80200758:	c7c50513          	addi	a0,a0,-900 # 802093d0 <digits+0x50>
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
    80200a00:	00014717          	auipc	a4,0x14
    80200a04:	65070713          	addi	a4,a4,1616 # 80215050 <started>
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
    80200a20:	e10080e7          	jalr	-496(ra) # 8020282c <trapinithart>
    plicinithart();  // ask PLIC for device interrupts
    80200a24:	00007097          	auipc	ra,0x7
    80200a28:	baa080e7          	jalr	-1110(ra) # 802075ce <plicinithart>
    printf("hart 1 init done\n");
    80200a2c:	00009517          	auipc	a0,0x9
    80200a30:	9c450513          	addi	a0,a0,-1596 # 802093f0 <digits+0x70>
    80200a34:	fffff097          	auipc	ra,0xfffff
    80200a38:	758080e7          	jalr	1880(ra) # 8020018c <printf>
  }
  scheduler();
    80200a3c:	00001097          	auipc	ra,0x1
    80200a40:	590080e7          	jalr	1424(ra) # 80201fcc <scheduler>
    consoleinit();
    80200a44:	00007097          	auipc	ra,0x7
    80200a48:	fa0080e7          	jalr	-96(ra) # 802079e4 <consoleinit>
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
    80200a78:	12a080e7          	jalr	298(ra) # 80205b9e <timerinit>
    trapinithart();  // install kernel trap vector, including interrupt handler
    80200a7c:	00002097          	auipc	ra,0x2
    80200a80:	db0080e7          	jalr	-592(ra) # 8020282c <trapinithart>
    procinit();
    80200a84:	00001097          	auipc	ra,0x1
    80200a88:	f32080e7          	jalr	-206(ra) # 802019b6 <procinit>
    plicinit();
    80200a8c:	00007097          	auipc	ra,0x7
    80200a90:	b2a080e7          	jalr	-1238(ra) # 802075b6 <plicinit>
    plicinithart();
    80200a94:	00007097          	auipc	ra,0x7
    80200a98:	b3a080e7          	jalr	-1222(ra) # 802075ce <plicinithart>
    disk_init();
    80200a9c:	00005097          	auipc	ra,0x5
    80200aa0:	19e080e7          	jalr	414(ra) # 80205c3a <disk_init>
    binit();         // buffer cache
    80200aa4:	00003097          	auipc	ra,0x3
    80200aa8:	cb8080e7          	jalr	-840(ra) # 8020375c <binit>
    fileinit();      // file table
    80200aac:	00003097          	auipc	ra,0x3
    80200ab0:	0bc080e7          	jalr	188(ra) # 80203b68 <fileinit>
    userinit();      // first user process
    80200ab4:	00001097          	auipc	ra,0x1
    80200ab8:	2b2080e7          	jalr	690(ra) # 80201d66 <userinit>
    printf("hart 0 init done\n");
    80200abc:	00009517          	auipc	a0,0x9
    80200ac0:	91c50513          	addi	a0,a0,-1764 # 802093d8 <digits+0x58>
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
    80200ae8:	00014717          	auipc	a4,0x14
    80200aec:	56f72423          	sw	a5,1384(a4) # 80215050 <started>
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
    80200af8:	00014797          	auipc	a5,0x14
    80200afc:	5607b783          	ld	a5,1376(a5) # 80215058 <kernel_pagetable>
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
    80200b3c:	00009517          	auipc	a0,0x9
    80200b40:	8cc50513          	addi	a0,a0,-1844 # 80209408 <digits+0x88>
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
    80200c34:	00008517          	auipc	a0,0x8
    80200c38:	7dc50513          	addi	a0,a0,2012 # 80209410 <digits+0x90>
    80200c3c:	fffff097          	auipc	ra,0xfffff
    80200c40:	506080e7          	jalr	1286(ra) # 80200142 <panic>
    panic("kvmpa");
    80200c44:	00008517          	auipc	a0,0x8
    80200c48:	7cc50513          	addi	a0,a0,1996 # 80209410 <digits+0x90>
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
    80200c5e:	00014517          	auipc	a0,0x14
    80200c62:	3fa53503          	ld	a0,1018(a0) # 80215058 <kernel_pagetable>
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
    80200cd8:	00008517          	auipc	a0,0x8
    80200cdc:	74050513          	addi	a0,a0,1856 # 80209418 <digits+0x98>
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
    80200d12:	00014517          	auipc	a0,0x14
    80200d16:	34653503          	ld	a0,838(a0) # 80215058 <kernel_pagetable>
    80200d1a:	00000097          	auipc	ra,0x0
    80200d1e:	f5c080e7          	jalr	-164(ra) # 80200c76 <mappages>
    80200d22:	e509                	bnez	a0,80200d2c <kvmmap+0x28>
}
    80200d24:	60a2                	ld	ra,8(sp)
    80200d26:	6402                	ld	s0,0(sp)
    80200d28:	0141                	addi	sp,sp,16
    80200d2a:	8082                	ret
    panic("kvmmap");
    80200d2c:	00008517          	auipc	a0,0x8
    80200d30:	6f450513          	addi	a0,a0,1780 # 80209420 <digits+0xa0>
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
    80200d4e:	00014797          	auipc	a5,0x14
    80200d52:	30a7b523          	sd	a0,778(a5) # 80215058 <kernel_pagetable>
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
    80200dd2:	0000b497          	auipc	s1,0xb
    80200dd6:	2fe4b483          	ld	s1,766(s1) # 8020c0d0 <_GLOBAL_OFFSET_TABLE_+0x20>
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
    80200e0e:	0000b597          	auipc	a1,0xb
    80200e12:	2aa5b583          	ld	a1,682(a1) # 8020c0b8 <_GLOBAL_OFFSET_TABLE_+0x8>
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
    80200e76:	00008517          	auipc	a0,0x8
    80200e7a:	5b250513          	addi	a0,a0,1458 # 80209428 <digits+0xa8>
    80200e7e:	fffff097          	auipc	ra,0xfffff
    80200e82:	2c4080e7          	jalr	708(ra) # 80200142 <panic>
      panic("vmunmap: walk");
    80200e86:	00008517          	auipc	a0,0x8
    80200e8a:	5ba50513          	addi	a0,a0,1466 # 80209440 <digits+0xc0>
    80200e8e:	fffff097          	auipc	ra,0xfffff
    80200e92:	2b4080e7          	jalr	692(ra) # 80200142 <panic>
      panic("vmunmap: not mapped");
    80200e96:	00008517          	auipc	a0,0x8
    80200e9a:	5ba50513          	addi	a0,a0,1466 # 80209450 <digits+0xd0>
    80200e9e:	fffff097          	auipc	ra,0xfffff
    80200ea2:	2a4080e7          	jalr	676(ra) # 80200142 <panic>
      panic("vmunmap: not a leaf");
    80200ea6:	00008517          	auipc	a0,0x8
    80200eaa:	5c250513          	addi	a0,a0,1474 # 80209468 <digits+0xe8>
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
    80200f9c:	00008517          	auipc	a0,0x8
    80200fa0:	4e450513          	addi	a0,a0,1252 # 80209480 <digits+0x100>
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
    8020114e:	00008517          	auipc	a0,0x8
    80201152:	35250513          	addi	a0,a0,850 # 802094a0 <digits+0x120>
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
    8020124c:	00008517          	auipc	a0,0x8
    80201250:	26450513          	addi	a0,a0,612 # 802094b0 <digits+0x130>
    80201254:	fffff097          	auipc	ra,0xfffff
    80201258:	eee080e7          	jalr	-274(ra) # 80200142 <panic>
      panic("uvmcopy: page not present");
    8020125c:	00008517          	auipc	a0,0x8
    80201260:	27450513          	addi	a0,a0,628 # 802094d0 <digits+0x150>
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
    802012e0:	00008517          	auipc	a0,0x8
    802012e4:	21050513          	addi	a0,a0,528 # 802094f0 <digits+0x170>
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
    80201534:	00074703          	lbu	a4,0(a4) # fffffffffffff000 <ebss_clear+0xffffffff7fdcc000>
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
    802016f0:	00014597          	auipc	a1,0x14
    802016f4:	9685b583          	ld	a1,-1688(a1) # 80215058 <kernel_pagetable>
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
    80201764:	00008517          	auipc	a0,0x8
    80201768:	d9c50513          	addi	a0,a0,-612 # 80209500 <digits+0x180>
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
    8020177a:	00008c97          	auipc	s9,0x8
    8020177e:	daec8c93          	addi	s9,s9,-594 # 80209528 <digits+0x1a8>
    80201782:	20000793          	li	a5,512
    80201786:	f8f43423          	sd	a5,-120(s0)

          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
            if (*pte3 & PTE_V)
              printf(".. .. ..%d: pte %p pa %p\n", pte3 - pt3, *pte3, PTE2PA(*pte3));
    8020178a:	00008a17          	auipc	s4,0x8
    8020178e:	db6a0a13          	addi	s4,s4,-586 # 80209540 <digits+0x1c0>
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
    802017c0:	000ab603          	ld	a2,0(s5) # fffffffffffff000 <ebss_clear+0xffffffff7fdcc000>
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
    80201804:	000bb603          	ld	a2,0(s7) # fffffffffffff000 <ebss_clear+0xffffffff7fdcc000>
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
    80201824:	00008517          	auipc	a0,0x8
    80201828:	cec50513          	addi	a0,a0,-788 # 80209510 <digits+0x190>
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
    80201892:	00008517          	auipc	a0,0x8
    80201896:	cce50513          	addi	a0,a0,-818 # 80209560 <digits+0x1e0>
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
    802018b8:	00008517          	auipc	a0,0x8
    802018bc:	cb050513          	addi	a0,a0,-848 # 80209568 <digits+0x1e8>
    802018c0:	fffff097          	auipc	ra,0xfffff
    802018c4:	8cc080e7          	jalr	-1844(ra) # 8020018c <printf>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802018c8:	100025f3          	csrr	a1,sstatus
  printf("sstatus: %p\n", r_sstatus());
    802018cc:	00008517          	auipc	a0,0x8
    802018d0:	cb450513          	addi	a0,a0,-844 # 80209580 <digits+0x200>
    802018d4:	fffff097          	auipc	ra,0xfffff
    802018d8:	8b8080e7          	jalr	-1864(ra) # 8020018c <printf>
  asm volatile("csrr %0, sip" : "=r" (x) );
    802018dc:	144025f3          	csrr	a1,sip
  printf("sip: %p\n", r_sip());
    802018e0:	00008517          	auipc	a0,0x8
    802018e4:	cb050513          	addi	a0,a0,-848 # 80209590 <digits+0x210>
    802018e8:	fffff097          	auipc	ra,0xfffff
    802018ec:	8a4080e7          	jalr	-1884(ra) # 8020018c <printf>
  asm volatile("csrr %0, sie" : "=r" (x) );
    802018f0:	104025f3          	csrr	a1,sie
  printf("sie: %p\n", r_sie());
    802018f4:	00008517          	auipc	a0,0x8
    802018f8:	cac50513          	addi	a0,a0,-852 # 802095a0 <digits+0x220>
    802018fc:	fffff097          	auipc	ra,0xfffff
    80201900:	890080e7          	jalr	-1904(ra) # 8020018c <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80201904:	141025f3          	csrr	a1,sepc
  printf("sepc: %p\n", r_sepc());
    80201908:	00008517          	auipc	a0,0x8
    8020190c:	ca850513          	addi	a0,a0,-856 # 802095b0 <digits+0x230>
    80201910:	fffff097          	auipc	ra,0xfffff
    80201914:	87c080e7          	jalr	-1924(ra) # 8020018c <printf>
  asm volatile("csrr %0, stvec" : "=r" (x) );
    80201918:	105025f3          	csrr	a1,stvec
  printf("stvec: %p\n", r_stvec());
    8020191c:	00008517          	auipc	a0,0x8
    80201920:	ca450513          	addi	a0,a0,-860 # 802095c0 <digits+0x240>
    80201924:	fffff097          	auipc	ra,0xfffff
    80201928:	868080e7          	jalr	-1944(ra) # 8020018c <printf>
  asm volatile("csrr %0, satp" : "=r" (x) );
    8020192c:	180025f3          	csrr	a1,satp
  printf("satp: %p\n", r_satp());
    80201930:	00008517          	auipc	a0,0x8
    80201934:	ca050513          	addi	a0,a0,-864 # 802095d0 <digits+0x250>
    80201938:	fffff097          	auipc	ra,0xfffff
    8020193c:	854080e7          	jalr	-1964(ra) # 8020018c <printf>
  asm volatile("csrr %0, scause" : "=r" (x) );
    80201940:	142025f3          	csrr	a1,scause
  printf("scause: %p\n", r_scause());
    80201944:	00008517          	auipc	a0,0x8
    80201948:	c9c50513          	addi	a0,a0,-868 # 802095e0 <digits+0x260>
    8020194c:	fffff097          	auipc	ra,0xfffff
    80201950:	840080e7          	jalr	-1984(ra) # 8020018c <printf>
  asm volatile("csrr %0, stval" : "=r" (x) );
    80201954:	143025f3          	csrr	a1,stval
  printf("stval: %p\n", r_stval());
    80201958:	00008517          	auipc	a0,0x8
    8020195c:	c9850513          	addi	a0,a0,-872 # 802095f0 <digits+0x270>
    80201960:	fffff097          	auipc	ra,0xfffff
    80201964:	82c080e7          	jalr	-2004(ra) # 8020018c <printf>
  asm volatile("mv %0, sp" : "=r" (x) );
    80201968:	858a                	mv	a1,sp
  printf("sp: %p\n", r_sp());
    8020196a:	00008517          	auipc	a0,0x8
    8020196e:	c9650513          	addi	a0,a0,-874 # 80209600 <digits+0x280>
    80201972:	fffff097          	auipc	ra,0xfffff
    80201976:	81a080e7          	jalr	-2022(ra) # 8020018c <printf>
  asm volatile("mv %0, tp" : "=r" (x) );
    8020197a:	8592                	mv	a1,tp
  printf("tp: %p\n", r_tp());
    8020197c:	00008517          	auipc	a0,0x8
    80201980:	c8c50513          	addi	a0,a0,-884 # 80209608 <digits+0x288>
    80201984:	fffff097          	auipc	ra,0xfffff
    80201988:	808080e7          	jalr	-2040(ra) # 8020018c <printf>
  asm volatile("mv %0, ra" : "=r" (x) );
    8020198c:	8586                	mv	a1,ra
  printf("ra: %p\n", r_ra());
    8020198e:	00008517          	auipc	a0,0x8
    80201992:	c8250513          	addi	a0,a0,-894 # 80209610 <digits+0x290>
    80201996:	ffffe097          	auipc	ra,0xffffe
    8020199a:	7f6080e7          	jalr	2038(ra) # 8020018c <printf>
  printf("}\n");
    8020199e:	00008517          	auipc	a0,0x8
    802019a2:	c7a50513          	addi	a0,a0,-902 # 80209618 <digits+0x298>
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
    802019c4:	00008597          	auipc	a1,0x8
    802019c8:	c5c58593          	addi	a1,a1,-932 # 80209620 <digits+0x2a0>
    802019cc:	00013517          	auipc	a0,0x13
    802019d0:	69450513          	addi	a0,a0,1684 # 80215060 <pid_lock>
    802019d4:	fffff097          	auipc	ra,0xfffff
    802019d8:	cb0080e7          	jalr	-848(ra) # 80200684 <initlock>
  for (p = proc; p < &proc[NPROC]; p++)
    802019dc:	00013497          	auipc	s1,0x13
    802019e0:	7a448493          	addi	s1,s1,1956 # 80215180 <proc>
    initlock(&p->lock, "proc");
    802019e4:	00008997          	auipc	s3,0x8
    802019e8:	c4498993          	addi	s3,s3,-956 # 80209628 <digits+0x2a8>
  for (p = proc; p < &proc[NPROC]; p++)
    802019ec:	00023917          	auipc	s2,0x23
    802019f0:	00490913          	addi	s2,s2,4 # 802249f0 <bcache>
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
    80201a0e:	00013517          	auipc	a0,0x13
    80201a12:	66a50513          	addi	a0,a0,1642 # 80215078 <cpus>
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
    80201a48:	00013517          	auipc	a0,0x13
    80201a4c:	63050513          	addi	a0,a0,1584 # 80215078 <cpus>
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
    80201a70:	00013717          	auipc	a4,0x13
    80201a74:	5f070713          	addi	a4,a4,1520 # 80215060 <pid_lock>
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
    80201aaa:	00008797          	auipc	a5,0x8
    80201aae:	5567a783          	lw	a5,1366(a5) # 8020a000 <first.1691>
    80201ab2:	eb91                	bnez	a5,80201ac6 <forkret+0x36>
  usertrapret();
    80201ab4:	00001097          	auipc	ra,0x1
    80201ab8:	db4080e7          	jalr	-588(ra) # 80202868 <usertrapret>
}
    80201abc:	60e2                	ld	ra,24(sp)
    80201abe:	6442                	ld	s0,16(sp)
    80201ac0:	64a2                	ld	s1,8(sp)
    80201ac2:	6105                	addi	sp,sp,32
    80201ac4:	8082                	ret
    first = 0;
    80201ac6:	00008797          	auipc	a5,0x8
    80201aca:	5207ad23          	sw	zero,1338(a5) # 8020a000 <first.1691>
    fat32_init();
    80201ace:	00005097          	auipc	ra,0x5
    80201ad2:	854080e7          	jalr	-1964(ra) # 80206322 <fat32_init>
    myproc()->cwd = ename("/");
    80201ad6:	00000097          	auipc	ra,0x0
    80201ada:	f82080e7          	jalr	-126(ra) # 80201a58 <myproc>
    80201ade:	84aa                	mv	s1,a0
    80201ae0:	00008517          	auipc	a0,0x8
    80201ae4:	b5050513          	addi	a0,a0,-1200 # 80209630 <digits+0x2b0>
    80201ae8:	00006097          	auipc	ra,0x6
    80201aec:	a94080e7          	jalr	-1388(ra) # 8020757c <ename>
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
    80201b02:	00013917          	auipc	s2,0x13
    80201b06:	55e90913          	addi	s2,s2,1374 # 80215060 <pid_lock>
    80201b0a:	854a                	mv	a0,s2
    80201b0c:	fffff097          	auipc	ra,0xfffff
    80201b10:	bbc080e7          	jalr	-1092(ra) # 802006c8 <acquire>
  pid = nextpid;
    80201b14:	00008797          	auipc	a5,0x8
    80201b18:	4ec78793          	addi	a5,a5,1260 # 8020a000 <first.1691>
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
    80201b58:	0000a697          	auipc	a3,0xa
    80201b5c:	5606b683          	ld	a3,1376(a3) # 8020c0b8 <_GLOBAL_OFFSET_TABLE_+0x8>
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
    80201ca0:	00013497          	auipc	s1,0x13
    80201ca4:	4e048493          	addi	s1,s1,1248 # 80215180 <proc>
    80201ca8:	00023917          	auipc	s2,0x23
    80201cac:	d4890913          	addi	s2,s2,-696 # 802249f0 <bcache>
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
    80201d7a:	00013797          	auipc	a5,0x13
    80201d7e:	3ea7bf23          	sd	a0,1022(a5) # 80215178 <initproc>
  uvminit(p->pagetable, p->kpagetable, initcode, sizeof(initcode));
    80201d82:	03400693          	li	a3,52
    80201d86:	00008617          	auipc	a2,0x8
    80201d8a:	28260613          	addi	a2,a2,642 # 8020a008 <initcode>
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
    80201daa:	00008597          	auipc	a1,0x8
    80201dae:	88e58593          	addi	a1,a1,-1906 # 80209638 <digits+0x2b8>
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
    80201f00:	d2e080e7          	jalr	-722(ra) # 80203c2a <filedup>
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
    80201f22:	c56080e7          	jalr	-938(ra) # 80206b74 <edup>
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
    80201f78:	00013497          	auipc	s1,0x13
    80201f7c:	20848493          	addi	s1,s1,520 # 80215180 <proc>
      pp->parent = initproc;
    80201f80:	00013a17          	auipc	s4,0x13
    80201f84:	0e0a0a13          	addi	s4,s4,224 # 80215060 <pid_lock>
  for (pp = proc; pp < &proc[NPROC]; pp++)
    80201f88:	00023997          	auipc	s3,0x23
    80201f8c:	a6898993          	addi	s3,s3,-1432 # 802249f0 <bcache>
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
    80201fec:	00013717          	auipc	a4,0x13
    80201ff0:	07470713          	addi	a4,a4,116 # 80215060 <pid_lock>
    80201ff4:	975a                	add	a4,a4,s6
    80201ff6:	00073c23          	sd	zero,24(a4)
        swtch(&c->context, &p->context);
    80201ffa:	00013717          	auipc	a4,0x13
    80201ffe:	08670713          	addi	a4,a4,134 # 80215080 <cpus+0x8>
    80202002:	9b3a                	add	s6,s6,a4
        c->proc = p;
    80202004:	079e                	slli	a5,a5,0x7
    80202006:	00013a97          	auipc	s5,0x13
    8020200a:	05aa8a93          	addi	s5,s5,90 # 80215060 <pid_lock>
    8020200e:	9abe                	add	s5,s5,a5
        w_satp(MAKE_SATP(p->kpagetable));
    80202010:	5a7d                	li	s4,-1
    80202012:	1a7e                	slli	s4,s4,0x3f
        w_satp(MAKE_SATP(kernel_pagetable));
    80202014:	0000ab97          	auipc	s7,0xa
    80202018:	0e4bbb83          	ld	s7,228(s7) # 8020c0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
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
    80202040:	786080e7          	jalr	1926(ra) # 802027c2 <swtch>
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
    802020a2:	00013497          	auipc	s1,0x13
    802020a6:	0de48493          	addi	s1,s1,222 # 80215180 <proc>
      if (p->state == RUNNABLE)
    802020aa:	4989                	li	s3,2
    for (p = proc; p < &proc[NPROC]; p++)
    802020ac:	00023917          	auipc	s2,0x23
    802020b0:	94490913          	addi	s2,s2,-1724 # 802249f0 <bcache>
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
    802020de:	00013717          	auipc	a4,0x13
    802020e2:	f8270713          	addi	a4,a4,-126 # 80215060 <pid_lock>
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
    80202104:	00013917          	auipc	s2,0x13
    80202108:	f5c90913          	addi	s2,s2,-164 # 80215060 <pid_lock>
    8020210c:	2781                	sext.w	a5,a5
    8020210e:	079e                	slli	a5,a5,0x7
    80202110:	97ca                	add	a5,a5,s2
    80202112:	0947a983          	lw	s3,148(a5)
    80202116:	8792                	mv	a5,tp
  swtch(&p->context, &mycpu()->context);
    80202118:	2781                	sext.w	a5,a5
    8020211a:	079e                	slli	a5,a5,0x7
    8020211c:	00013597          	auipc	a1,0x13
    80202120:	f6458593          	addi	a1,a1,-156 # 80215080 <cpus+0x8>
    80202124:	95be                	add	a1,a1,a5
    80202126:	06848513          	addi	a0,s1,104
    8020212a:	00000097          	auipc	ra,0x0
    8020212e:	698080e7          	jalr	1688(ra) # 802027c2 <swtch>
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
    8020214c:	00007517          	auipc	a0,0x7
    80202150:	4fc50513          	addi	a0,a0,1276 # 80209648 <digits+0x2c8>
    80202154:	ffffe097          	auipc	ra,0xffffe
    80202158:	fee080e7          	jalr	-18(ra) # 80200142 <panic>
    panic("sched locks");
    8020215c:	00007517          	auipc	a0,0x7
    80202160:	4fc50513          	addi	a0,a0,1276 # 80209658 <digits+0x2d8>
    80202164:	ffffe097          	auipc	ra,0xffffe
    80202168:	fde080e7          	jalr	-34(ra) # 80200142 <panic>
    panic("sched running");
    8020216c:	00007517          	auipc	a0,0x7
    80202170:	4fc50513          	addi	a0,a0,1276 # 80209668 <digits+0x2e8>
    80202174:	ffffe097          	auipc	ra,0xffffe
    80202178:	fce080e7          	jalr	-50(ra) # 80200142 <panic>
    panic("sched interruptible");
    8020217c:	00007517          	auipc	a0,0x7
    80202180:	4fc50513          	addi	a0,a0,1276 # 80209678 <digits+0x2f8>
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
  if (p == initproc)
    802021a8:	00013797          	auipc	a5,0x13
    802021ac:	fd07b783          	ld	a5,-48(a5) # 80215178 <initproc>
    802021b0:	0d850493          	addi	s1,a0,216
    802021b4:	4d850913          	addi	s2,a0,1240
    802021b8:	02a79363          	bne	a5,a0,802021de <exit+0x52>
    panic("init exiting");
    802021bc:	00007517          	auipc	a0,0x7
    802021c0:	4d450513          	addi	a0,a0,1236 # 80209690 <digits+0x310>
    802021c4:	ffffe097          	auipc	ra,0xffffe
    802021c8:	f7e080e7          	jalr	-130(ra) # 80200142 <panic>
      fileclose(f);
    802021cc:	00002097          	auipc	ra,0x2
    802021d0:	ab0080e7          	jalr	-1360(ra) # 80203c7c <fileclose>
      p->ofile[fd] = 0;
    802021d4:	0004b023          	sd	zero,0(s1)
  for (int fd = 0; fd < NOFILE; fd++)
    802021d8:	04a1                	addi	s1,s1,8
    802021da:	01248563          	beq	s1,s2,802021e4 <exit+0x58>
    if (p->ofile[fd])
    802021de:	6088                	ld	a0,0(s1)
    802021e0:	f575                	bnez	a0,802021cc <exit+0x40>
    802021e2:	bfdd                	j	802021d8 <exit+0x4c>
  eput(p->cwd);
    802021e4:	4d89b503          	ld	a0,1240(s3)
    802021e8:	00005097          	auipc	ra,0x5
    802021ec:	c6e080e7          	jalr	-914(ra) # 80206e56 <eput>
  p->cwd = 0;
    802021f0:	4c09bc23          	sd	zero,1240(s3)
  acquire(&initproc->lock);
    802021f4:	00013497          	auipc	s1,0x13
    802021f8:	e6c48493          	addi	s1,s1,-404 # 80215060 <pid_lock>
    802021fc:	1184b503          	ld	a0,280(s1)
    80202200:	ffffe097          	auipc	ra,0xffffe
    80202204:	4c8080e7          	jalr	1224(ra) # 802006c8 <acquire>
  wakeup1(initproc);
    80202208:	1184b503          	ld	a0,280(s1)
    8020220c:	fffff097          	auipc	ra,0xfffff
    80202210:	660080e7          	jalr	1632(ra) # 8020186c <wakeup1>
  release(&initproc->lock);
    80202214:	1184b503          	ld	a0,280(s1)
    80202218:	ffffe097          	auipc	ra,0xffffe
    8020221c:	504080e7          	jalr	1284(ra) # 8020071c <release>
  acquire(&p->lock);
    80202220:	854e                	mv	a0,s3
    80202222:	ffffe097          	auipc	ra,0xffffe
    80202226:	4a6080e7          	jalr	1190(ra) # 802006c8 <acquire>
  struct proc *original_parent = p->parent;
    8020222a:	0209b483          	ld	s1,32(s3)
  release(&p->lock);
    8020222e:	854e                	mv	a0,s3
    80202230:	ffffe097          	auipc	ra,0xffffe
    80202234:	4ec080e7          	jalr	1260(ra) # 8020071c <release>
  acquire(&original_parent->lock);
    80202238:	8526                	mv	a0,s1
    8020223a:	ffffe097          	auipc	ra,0xffffe
    8020223e:	48e080e7          	jalr	1166(ra) # 802006c8 <acquire>
  acquire(&p->lock);
    80202242:	854e                	mv	a0,s3
    80202244:	ffffe097          	auipc	ra,0xffffe
    80202248:	484080e7          	jalr	1156(ra) # 802006c8 <acquire>
  reparent(p);
    8020224c:	854e                	mv	a0,s3
    8020224e:	00000097          	auipc	ra,0x0
    80202252:	d18080e7          	jalr	-744(ra) # 80201f66 <reparent>
  wakeup1(original_parent);
    80202256:	8526                	mv	a0,s1
    80202258:	fffff097          	auipc	ra,0xfffff
    8020225c:	614080e7          	jalr	1556(ra) # 8020186c <wakeup1>
  p->xstate=status<<8;
    80202260:	008a151b          	slliw	a0,s4,0x8
    80202264:	02a9aa23          	sw	a0,52(s3)
  p->state = ZOMBIE;
    80202268:	4791                	li	a5,4
    8020226a:	00f9ac23          	sw	a5,24(s3)
  release(&original_parent->lock);
    8020226e:	8526                	mv	a0,s1
    80202270:	ffffe097          	auipc	ra,0xffffe
    80202274:	4ac080e7          	jalr	1196(ra) # 8020071c <release>
  sched();
    80202278:	00000097          	auipc	ra,0x0
    8020227c:	e3e080e7          	jalr	-450(ra) # 802020b6 <sched>
  panic("zombie exit");
    80202280:	00007517          	auipc	a0,0x7
    80202284:	42050513          	addi	a0,a0,1056 # 802096a0 <digits+0x320>
    80202288:	ffffe097          	auipc	ra,0xffffe
    8020228c:	eba080e7          	jalr	-326(ra) # 80200142 <panic>

0000000080202290 <yield>:
{
    80202290:	1101                	addi	sp,sp,-32
    80202292:	ec06                	sd	ra,24(sp)
    80202294:	e822                	sd	s0,16(sp)
    80202296:	e426                	sd	s1,8(sp)
    80202298:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    8020229a:	fffff097          	auipc	ra,0xfffff
    8020229e:	7be080e7          	jalr	1982(ra) # 80201a58 <myproc>
    802022a2:	84aa                	mv	s1,a0
  acquire(&p->lock);
    802022a4:	ffffe097          	auipc	ra,0xffffe
    802022a8:	424080e7          	jalr	1060(ra) # 802006c8 <acquire>
  p->state = RUNNABLE;
    802022ac:	4789                	li	a5,2
    802022ae:	cc9c                	sw	a5,24(s1)
  sched();
    802022b0:	00000097          	auipc	ra,0x0
    802022b4:	e06080e7          	jalr	-506(ra) # 802020b6 <sched>
  release(&p->lock);
    802022b8:	8526                	mv	a0,s1
    802022ba:	ffffe097          	auipc	ra,0xffffe
    802022be:	462080e7          	jalr	1122(ra) # 8020071c <release>
}
    802022c2:	60e2                	ld	ra,24(sp)
    802022c4:	6442                	ld	s0,16(sp)
    802022c6:	64a2                	ld	s1,8(sp)
    802022c8:	6105                	addi	sp,sp,32
    802022ca:	8082                	ret

00000000802022cc <sleep>:
{
    802022cc:	7179                	addi	sp,sp,-48
    802022ce:	f406                	sd	ra,40(sp)
    802022d0:	f022                	sd	s0,32(sp)
    802022d2:	ec26                	sd	s1,24(sp)
    802022d4:	e84a                	sd	s2,16(sp)
    802022d6:	e44e                	sd	s3,8(sp)
    802022d8:	1800                	addi	s0,sp,48
    802022da:	89aa                	mv	s3,a0
    802022dc:	892e                	mv	s2,a1
  struct proc *p = myproc();
    802022de:	fffff097          	auipc	ra,0xfffff
    802022e2:	77a080e7          	jalr	1914(ra) # 80201a58 <myproc>
    802022e6:	84aa                	mv	s1,a0
  if (lk != &p->lock)
    802022e8:	05250663          	beq	a0,s2,80202334 <sleep+0x68>
    acquire(&p->lock); // DOC: sleeplock1
    802022ec:	ffffe097          	auipc	ra,0xffffe
    802022f0:	3dc080e7          	jalr	988(ra) # 802006c8 <acquire>
    release(lk);
    802022f4:	854a                	mv	a0,s2
    802022f6:	ffffe097          	auipc	ra,0xffffe
    802022fa:	426080e7          	jalr	1062(ra) # 8020071c <release>
  p->chan = chan;
    802022fe:	0334b423          	sd	s3,40(s1)
  p->state = SLEEPING;
    80202302:	4785                	li	a5,1
    80202304:	cc9c                	sw	a5,24(s1)
  sched();
    80202306:	00000097          	auipc	ra,0x0
    8020230a:	db0080e7          	jalr	-592(ra) # 802020b6 <sched>
  p->chan = 0;
    8020230e:	0204b423          	sd	zero,40(s1)
    release(&p->lock);
    80202312:	8526                	mv	a0,s1
    80202314:	ffffe097          	auipc	ra,0xffffe
    80202318:	408080e7          	jalr	1032(ra) # 8020071c <release>
    acquire(lk);
    8020231c:	854a                	mv	a0,s2
    8020231e:	ffffe097          	auipc	ra,0xffffe
    80202322:	3aa080e7          	jalr	938(ra) # 802006c8 <acquire>
}
    80202326:	70a2                	ld	ra,40(sp)
    80202328:	7402                	ld	s0,32(sp)
    8020232a:	64e2                	ld	s1,24(sp)
    8020232c:	6942                	ld	s2,16(sp)
    8020232e:	69a2                	ld	s3,8(sp)
    80202330:	6145                	addi	sp,sp,48
    80202332:	8082                	ret
  p->chan = chan;
    80202334:	03353423          	sd	s3,40(a0)
  p->state = SLEEPING;
    80202338:	4785                	li	a5,1
    8020233a:	cd1c                	sw	a5,24(a0)
  sched();
    8020233c:	00000097          	auipc	ra,0x0
    80202340:	d7a080e7          	jalr	-646(ra) # 802020b6 <sched>
  p->chan = 0;
    80202344:	0204b423          	sd	zero,40(s1)
  if (lk != &p->lock)
    80202348:	bff9                	j	80202326 <sleep+0x5a>

000000008020234a <wait>:
{
    8020234a:	715d                	addi	sp,sp,-80
    8020234c:	e486                	sd	ra,72(sp)
    8020234e:	e0a2                	sd	s0,64(sp)
    80202350:	fc26                	sd	s1,56(sp)
    80202352:	f84a                	sd	s2,48(sp)
    80202354:	f44e                	sd	s3,40(sp)
    80202356:	f052                	sd	s4,32(sp)
    80202358:	ec56                	sd	s5,24(sp)
    8020235a:	e85a                	sd	s6,16(sp)
    8020235c:	e45e                	sd	s7,8(sp)
    8020235e:	e062                	sd	s8,0(sp)
    80202360:	0880                	addi	s0,sp,80
    80202362:	8b2a                	mv	s6,a0
  struct proc *p = myproc();
    80202364:	fffff097          	auipc	ra,0xfffff
    80202368:	6f4080e7          	jalr	1780(ra) # 80201a58 <myproc>
    8020236c:	892a                	mv	s2,a0
  acquire(&p->lock);
    8020236e:	8c2a                	mv	s8,a0
    80202370:	ffffe097          	auipc	ra,0xffffe
    80202374:	358080e7          	jalr	856(ra) # 802006c8 <acquire>
    havekids = 0;
    80202378:	4b81                	li	s7,0
        if (np->state == ZOMBIE)
    8020237a:	4a11                	li	s4,4
    for (np = proc; np < &proc[NPROC]; np++)
    8020237c:	00022997          	auipc	s3,0x22
    80202380:	67498993          	addi	s3,s3,1652 # 802249f0 <bcache>
        havekids = 1;
    80202384:	4a85                	li	s5,1
    havekids = 0;
    80202386:	875e                	mv	a4,s7
    for (np = proc; np < &proc[NPROC]; np++)
    80202388:	00013497          	auipc	s1,0x13
    8020238c:	df848493          	addi	s1,s1,-520 # 80215180 <proc>
    80202390:	a8b9                	j	802023ee <wait+0xa4>
          pid = np->pid;
    80202392:	0384a983          	lw	s3,56(s1)
          if (addr != 0 && copyout2(addr, (char *)&np->xstate, sizeof(np->xstate)) < 0)
    80202396:	000b0c63          	beqz	s6,802023ae <wait+0x64>
    8020239a:	4611                	li	a2,4
    8020239c:	03448593          	addi	a1,s1,52
    802023a0:	855a                	mv	a0,s6
    802023a2:	fffff097          	auipc	ra,0xfffff
    802023a6:	fda080e7          	jalr	-38(ra) # 8020137c <copyout2>
    802023aa:	02054263          	bltz	a0,802023ce <wait+0x84>
          freeproc(np);
    802023ae:	8526                	mv	a0,s1
    802023b0:	00000097          	auipc	ra,0x0
    802023b4:	87a080e7          	jalr	-1926(ra) # 80201c2a <freeproc>
          release(&np->lock);
    802023b8:	8526                	mv	a0,s1
    802023ba:	ffffe097          	auipc	ra,0xffffe
    802023be:	362080e7          	jalr	866(ra) # 8020071c <release>
          release(&p->lock);
    802023c2:	854a                	mv	a0,s2
    802023c4:	ffffe097          	auipc	ra,0xffffe
    802023c8:	358080e7          	jalr	856(ra) # 8020071c <release>
          return pid;
    802023cc:	a8a9                	j	80202426 <wait+0xdc>
            release(&np->lock);
    802023ce:	8526                	mv	a0,s1
    802023d0:	ffffe097          	auipc	ra,0xffffe
    802023d4:	34c080e7          	jalr	844(ra) # 8020071c <release>
            release(&p->lock);
    802023d8:	854a                	mv	a0,s2
    802023da:	ffffe097          	auipc	ra,0xffffe
    802023de:	342080e7          	jalr	834(ra) # 8020071c <release>
            return -1;
    802023e2:	59fd                	li	s3,-1
    802023e4:	a089                	j	80202426 <wait+0xdc>
    for (np = proc; np < &proc[NPROC]; np++)
    802023e6:	4f848493          	addi	s1,s1,1272
    802023ea:	03348463          	beq	s1,s3,80202412 <wait+0xc8>
      if (np->parent == p)
    802023ee:	709c                	ld	a5,32(s1)
    802023f0:	ff279be3          	bne	a5,s2,802023e6 <wait+0x9c>
        acquire(&np->lock);
    802023f4:	8526                	mv	a0,s1
    802023f6:	ffffe097          	auipc	ra,0xffffe
    802023fa:	2d2080e7          	jalr	722(ra) # 802006c8 <acquire>
        if (np->state == ZOMBIE)
    802023fe:	4c9c                	lw	a5,24(s1)
    80202400:	f94789e3          	beq	a5,s4,80202392 <wait+0x48>
        release(&np->lock);
    80202404:	8526                	mv	a0,s1
    80202406:	ffffe097          	auipc	ra,0xffffe
    8020240a:	316080e7          	jalr	790(ra) # 8020071c <release>
        havekids = 1;
    8020240e:	8756                	mv	a4,s5
    80202410:	bfd9                	j	802023e6 <wait+0x9c>
    if (!havekids || p->killed)
    80202412:	c701                	beqz	a4,8020241a <wait+0xd0>
    80202414:	03092783          	lw	a5,48(s2)
    80202418:	c785                	beqz	a5,80202440 <wait+0xf6>
      release(&p->lock);
    8020241a:	854a                	mv	a0,s2
    8020241c:	ffffe097          	auipc	ra,0xffffe
    80202420:	300080e7          	jalr	768(ra) # 8020071c <release>
      return -1;
    80202424:	59fd                	li	s3,-1
}
    80202426:	854e                	mv	a0,s3
    80202428:	60a6                	ld	ra,72(sp)
    8020242a:	6406                	ld	s0,64(sp)
    8020242c:	74e2                	ld	s1,56(sp)
    8020242e:	7942                	ld	s2,48(sp)
    80202430:	79a2                	ld	s3,40(sp)
    80202432:	7a02                	ld	s4,32(sp)
    80202434:	6ae2                	ld	s5,24(sp)
    80202436:	6b42                	ld	s6,16(sp)
    80202438:	6ba2                	ld	s7,8(sp)
    8020243a:	6c02                	ld	s8,0(sp)
    8020243c:	6161                	addi	sp,sp,80
    8020243e:	8082                	ret
    sleep(p, &p->lock); // DOC: wait-sleep
    80202440:	85e2                	mv	a1,s8
    80202442:	854a                	mv	a0,s2
    80202444:	00000097          	auipc	ra,0x0
    80202448:	e88080e7          	jalr	-376(ra) # 802022cc <sleep>
    havekids = 0;
    8020244c:	bf2d                	j	80202386 <wait+0x3c>

000000008020244e <wakeup>:
{
    8020244e:	7139                	addi	sp,sp,-64
    80202450:	fc06                	sd	ra,56(sp)
    80202452:	f822                	sd	s0,48(sp)
    80202454:	f426                	sd	s1,40(sp)
    80202456:	f04a                	sd	s2,32(sp)
    80202458:	ec4e                	sd	s3,24(sp)
    8020245a:	e852                	sd	s4,16(sp)
    8020245c:	e456                	sd	s5,8(sp)
    8020245e:	0080                	addi	s0,sp,64
    80202460:	8a2a                	mv	s4,a0
  for (p = proc; p < &proc[NPROC]; p++)
    80202462:	00013497          	auipc	s1,0x13
    80202466:	d1e48493          	addi	s1,s1,-738 # 80215180 <proc>
    if (p->state == SLEEPING && p->chan == chan)
    8020246a:	4985                	li	s3,1
      p->state = RUNNABLE;
    8020246c:	4a89                	li	s5,2
  for (p = proc; p < &proc[NPROC]; p++)
    8020246e:	00022917          	auipc	s2,0x22
    80202472:	58290913          	addi	s2,s2,1410 # 802249f0 <bcache>
    80202476:	a821                	j	8020248e <wakeup+0x40>
      p->state = RUNNABLE;
    80202478:	0154ac23          	sw	s5,24(s1)
    release(&p->lock);
    8020247c:	8526                	mv	a0,s1
    8020247e:	ffffe097          	auipc	ra,0xffffe
    80202482:	29e080e7          	jalr	670(ra) # 8020071c <release>
  for (p = proc; p < &proc[NPROC]; p++)
    80202486:	4f848493          	addi	s1,s1,1272
    8020248a:	01248e63          	beq	s1,s2,802024a6 <wakeup+0x58>
    acquire(&p->lock);
    8020248e:	8526                	mv	a0,s1
    80202490:	ffffe097          	auipc	ra,0xffffe
    80202494:	238080e7          	jalr	568(ra) # 802006c8 <acquire>
    if (p->state == SLEEPING && p->chan == chan)
    80202498:	4c9c                	lw	a5,24(s1)
    8020249a:	ff3791e3          	bne	a5,s3,8020247c <wakeup+0x2e>
    8020249e:	749c                	ld	a5,40(s1)
    802024a0:	fd479ee3          	bne	a5,s4,8020247c <wakeup+0x2e>
    802024a4:	bfd1                	j	80202478 <wakeup+0x2a>
}
    802024a6:	70e2                	ld	ra,56(sp)
    802024a8:	7442                	ld	s0,48(sp)
    802024aa:	74a2                	ld	s1,40(sp)
    802024ac:	7902                	ld	s2,32(sp)
    802024ae:	69e2                	ld	s3,24(sp)
    802024b0:	6a42                	ld	s4,16(sp)
    802024b2:	6aa2                	ld	s5,8(sp)
    802024b4:	6121                	addi	sp,sp,64
    802024b6:	8082                	ret

00000000802024b8 <kill>:

// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int kill(int pid)
{
    802024b8:	7179                	addi	sp,sp,-48
    802024ba:	f406                	sd	ra,40(sp)
    802024bc:	f022                	sd	s0,32(sp)
    802024be:	ec26                	sd	s1,24(sp)
    802024c0:	e84a                	sd	s2,16(sp)
    802024c2:	e44e                	sd	s3,8(sp)
    802024c4:	1800                	addi	s0,sp,48
    802024c6:	892a                	mv	s2,a0
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++)
    802024c8:	00013497          	auipc	s1,0x13
    802024cc:	cb848493          	addi	s1,s1,-840 # 80215180 <proc>
    802024d0:	00022997          	auipc	s3,0x22
    802024d4:	52098993          	addi	s3,s3,1312 # 802249f0 <bcache>
  {
    acquire(&p->lock);
    802024d8:	8526                	mv	a0,s1
    802024da:	ffffe097          	auipc	ra,0xffffe
    802024de:	1ee080e7          	jalr	494(ra) # 802006c8 <acquire>
    if (p->pid == pid)
    802024e2:	5c9c                	lw	a5,56(s1)
    802024e4:	01278d63          	beq	a5,s2,802024fe <kill+0x46>
        p->state = RUNNABLE;
      }
      release(&p->lock);
      return 0;
    }
    release(&p->lock);
    802024e8:	8526                	mv	a0,s1
    802024ea:	ffffe097          	auipc	ra,0xffffe
    802024ee:	232080e7          	jalr	562(ra) # 8020071c <release>
  for (p = proc; p < &proc[NPROC]; p++)
    802024f2:	4f848493          	addi	s1,s1,1272
    802024f6:	ff3491e3          	bne	s1,s3,802024d8 <kill+0x20>
  }
  return -1;
    802024fa:	557d                	li	a0,-1
    802024fc:	a829                	j	80202516 <kill+0x5e>
      p->killed = 1;
    802024fe:	4785                	li	a5,1
    80202500:	d89c                	sw	a5,48(s1)
      if (p->state == SLEEPING)
    80202502:	4c98                	lw	a4,24(s1)
    80202504:	4785                	li	a5,1
    80202506:	00f70f63          	beq	a4,a5,80202524 <kill+0x6c>
      release(&p->lock);
    8020250a:	8526                	mv	a0,s1
    8020250c:	ffffe097          	auipc	ra,0xffffe
    80202510:	210080e7          	jalr	528(ra) # 8020071c <release>
      return 0;
    80202514:	4501                	li	a0,0
}
    80202516:	70a2                	ld	ra,40(sp)
    80202518:	7402                	ld	s0,32(sp)
    8020251a:	64e2                	ld	s1,24(sp)
    8020251c:	6942                	ld	s2,16(sp)
    8020251e:	69a2                	ld	s3,8(sp)
    80202520:	6145                	addi	sp,sp,48
    80202522:	8082                	ret
        p->state = RUNNABLE;
    80202524:	4789                	li	a5,2
    80202526:	cc9c                	sw	a5,24(s1)
    80202528:	b7cd                	j	8020250a <kill+0x52>

000000008020252a <either_copyout>:

// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    8020252a:	1101                	addi	sp,sp,-32
    8020252c:	ec06                	sd	ra,24(sp)
    8020252e:	e822                	sd	s0,16(sp)
    80202530:	e426                	sd	s1,8(sp)
    80202532:	1000                	addi	s0,sp,32
    80202534:	84aa                	mv	s1,a0
    80202536:	852e                	mv	a0,a1
    80202538:	85b2                	mv	a1,a2
    8020253a:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if (user_dst)
    8020253c:	c891                	beqz	s1,80202550 <either_copyout+0x26>
  {
    // return copyout(p->pagetable, dst, src, len);
    return copyout2(dst, src, len);
    8020253e:	fffff097          	auipc	ra,0xfffff
    80202542:	e3e080e7          	jalr	-450(ra) # 8020137c <copyout2>
  else
  {
    memmove((char *)dst, src, len);
    return 0;
  }
}
    80202546:	60e2                	ld	ra,24(sp)
    80202548:	6442                	ld	s0,16(sp)
    8020254a:	64a2                	ld	s1,8(sp)
    8020254c:	6105                	addi	sp,sp,32
    8020254e:	8082                	ret
    memmove((char *)dst, src, len);
    80202550:	0006861b          	sext.w	a2,a3
    80202554:	ffffe097          	auipc	ra,0xffffe
    80202558:	270080e7          	jalr	624(ra) # 802007c4 <memmove>
    return 0;
    8020255c:	8526                	mv	a0,s1
    8020255e:	b7e5                	j	80202546 <either_copyout+0x1c>

0000000080202560 <either_copyin>:

// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    80202560:	1101                	addi	sp,sp,-32
    80202562:	ec06                	sd	ra,24(sp)
    80202564:	e822                	sd	s0,16(sp)
    80202566:	e426                	sd	s1,8(sp)
    80202568:	1000                	addi	s0,sp,32
    8020256a:	84ae                	mv	s1,a1
    8020256c:	85b2                	mv	a1,a2
    8020256e:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if (user_src)
    80202570:	c891                	beqz	s1,80202584 <either_copyin+0x24>
  {
    // return copyin(p->pagetable, dst, src, len);
    return copyin2(dst, src, len);
    80202572:	fffff097          	auipc	ra,0xfffff
    80202576:	ee8080e7          	jalr	-280(ra) # 8020145a <copyin2>
  else
  {
    memmove(dst, (char *)src, len);
    return 0;
  }
}
    8020257a:	60e2                	ld	ra,24(sp)
    8020257c:	6442                	ld	s0,16(sp)
    8020257e:	64a2                	ld	s1,8(sp)
    80202580:	6105                	addi	sp,sp,32
    80202582:	8082                	ret
    memmove(dst, (char *)src, len);
    80202584:	0006861b          	sext.w	a2,a3
    80202588:	ffffe097          	auipc	ra,0xffffe
    8020258c:	23c080e7          	jalr	572(ra) # 802007c4 <memmove>
    return 0;
    80202590:	8526                	mv	a0,s1
    80202592:	b7e5                	j	8020257a <either_copyin+0x1a>

0000000080202594 <procdump>:

// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void procdump(void)
{
    80202594:	715d                	addi	sp,sp,-80
    80202596:	e486                	sd	ra,72(sp)
    80202598:	e0a2                	sd	s0,64(sp)
    8020259a:	fc26                	sd	s1,56(sp)
    8020259c:	f84a                	sd	s2,48(sp)
    8020259e:	f44e                	sd	s3,40(sp)
    802025a0:	f052                	sd	s4,32(sp)
    802025a2:	ec56                	sd	s5,24(sp)
    802025a4:	e85a                	sd	s6,16(sp)
    802025a6:	e45e                	sd	s7,8(sp)
    802025a8:	0880                	addi	s0,sp,80
      [RUNNING] "run   ",
      [ZOMBIE] "zombie"};
  struct proc *p;
  char *state;

  printf("\nPID\tSTATE\tNAME\tMEM\n");
    802025aa:	00007517          	auipc	a0,0x7
    802025ae:	10e50513          	addi	a0,a0,270 # 802096b8 <digits+0x338>
    802025b2:	ffffe097          	auipc	ra,0xffffe
    802025b6:	bda080e7          	jalr	-1062(ra) # 8020018c <printf>
  for (p = proc; p < &proc[NPROC]; p++)
    802025ba:	00013497          	auipc	s1,0x13
    802025be:	0a648493          	addi	s1,s1,166 # 80215660 <proc+0x4e0>
    802025c2:	00023917          	auipc	s2,0x23
    802025c6:	90e90913          	addi	s2,s2,-1778 # 80224ed0 <bcache+0x4e0>
  {
    if (p->state == UNUSED)
      continue;
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
    802025ca:	4b11                	li	s6,4
      state = states[p->state];
    else
      state = "???";
    802025cc:	00007997          	auipc	s3,0x7
    802025d0:	0e498993          	addi	s3,s3,228 # 802096b0 <digits+0x330>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    802025d4:	00007a97          	auipc	s5,0x7
    802025d8:	0fca8a93          	addi	s5,s5,252 # 802096d0 <digits+0x350>
    printf("\n");
    802025dc:	00007a17          	auipc	s4,0x7
    802025e0:	afca0a13          	addi	s4,s4,-1284 # 802090d8 <etext+0xd8>
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
    802025e4:	00008b97          	auipc	s7,0x8
    802025e8:	a5cb8b93          	addi	s7,s7,-1444 # 8020a040 <states.1729>
    802025ec:	a01d                	j	80202612 <procdump+0x7e>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    802025ee:	b686b703          	ld	a4,-1176(a3)
    802025f2:	b586a583          	lw	a1,-1192(a3)
    802025f6:	8556                	mv	a0,s5
    802025f8:	ffffe097          	auipc	ra,0xffffe
    802025fc:	b94080e7          	jalr	-1132(ra) # 8020018c <printf>
    printf("\n");
    80202600:	8552                	mv	a0,s4
    80202602:	ffffe097          	auipc	ra,0xffffe
    80202606:	b8a080e7          	jalr	-1142(ra) # 8020018c <printf>
  for (p = proc; p < &proc[NPROC]; p++)
    8020260a:	4f848493          	addi	s1,s1,1272
    8020260e:	03248163          	beq	s1,s2,80202630 <procdump+0x9c>
    if (p->state == UNUSED)
    80202612:	86a6                	mv	a3,s1
    80202614:	b384a783          	lw	a5,-1224(s1)
    80202618:	dbed                	beqz	a5,8020260a <procdump+0x76>
      state = "???";
    8020261a:	864e                	mv	a2,s3
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
    8020261c:	fcfb69e3          	bltu	s6,a5,802025ee <procdump+0x5a>
    80202620:	1782                	slli	a5,a5,0x20
    80202622:	9381                	srli	a5,a5,0x20
    80202624:	078e                	slli	a5,a5,0x3
    80202626:	97de                	add	a5,a5,s7
    80202628:	6390                	ld	a2,0(a5)
    8020262a:	f271                	bnez	a2,802025ee <procdump+0x5a>
      state = "???";
    8020262c:	864e                	mv	a2,s3
    8020262e:	b7c1                	j	802025ee <procdump+0x5a>
  }
}
    80202630:	60a6                	ld	ra,72(sp)
    80202632:	6406                	ld	s0,64(sp)
    80202634:	74e2                	ld	s1,56(sp)
    80202636:	7942                	ld	s2,48(sp)
    80202638:	79a2                	ld	s3,40(sp)
    8020263a:	7a02                	ld	s4,32(sp)
    8020263c:	6ae2                	ld	s5,24(sp)
    8020263e:	6b42                	ld	s6,16(sp)
    80202640:	6ba2                	ld	s7,8(sp)
    80202642:	6161                	addi	sp,sp,80
    80202644:	8082                	ret

0000000080202646 <procnum>:

uint64
procnum(void)
{
    80202646:	1141                	addi	sp,sp,-16
    80202648:	e422                	sd	s0,8(sp)
    8020264a:	0800                	addi	s0,sp,16
  int num = 0;
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++)
    8020264c:	00013797          	auipc	a5,0x13
    80202650:	b3478793          	addi	a5,a5,-1228 # 80215180 <proc>
  int num = 0;
    80202654:	4501                	li	a0,0
  for (p = proc; p < &proc[NPROC]; p++)
    80202656:	00022697          	auipc	a3,0x22
    8020265a:	39a68693          	addi	a3,a3,922 # 802249f0 <bcache>
    8020265e:	a029                	j	80202668 <procnum+0x22>
    80202660:	4f878793          	addi	a5,a5,1272
    80202664:	00d78663          	beq	a5,a3,80202670 <procnum+0x2a>
  {
    if (p->state != UNUSED)
    80202668:	4f98                	lw	a4,24(a5)
    8020266a:	db7d                	beqz	a4,80202660 <procnum+0x1a>
    {
      num++;
    8020266c:	2505                	addiw	a0,a0,1
    8020266e:	bfcd                	j	80202660 <procnum+0x1a>
    }
  }

  return num;
}
    80202670:	6422                	ld	s0,8(sp)
    80202672:	0141                	addi	sp,sp,16
    80202674:	8082                	ret

0000000080202676 <clone>:


// added by lmq for SYS_clone
int clone(int flags, int stack, int ptid, int tls, int ctid)
{
    80202676:	1141                	addi	sp,sp,-16
    80202678:	e406                	sd	ra,8(sp)
    8020267a:	e022                	sd	s0,0(sp)
    8020267c:	0800                	addi	s0,sp,16
  int new_pid = fork();
    8020267e:	fffff097          	auipc	ra,0xfffff
    80202682:	7d4080e7          	jalr	2004(ra) # 80201e52 <fork>
  return new_pid;
}
    80202686:	60a2                	ld	ra,8(sp)
    80202688:	6402                	ld	s0,0(sp)
    8020268a:	0141                	addi	sp,sp,16
    8020268c:	8082                	ret

000000008020268e <waitpid>:
 * @addr:address to store return status of child process
 * @options:default 0
 * @return:pid of child process;-1 means failure
 */
int waitpid(int cpid, uint64 addr, int options)
{
    8020268e:	711d                	addi	sp,sp,-96
    80202690:	ec86                	sd	ra,88(sp)
    80202692:	e8a2                	sd	s0,80(sp)
    80202694:	e4a6                	sd	s1,72(sp)
    80202696:	e0ca                	sd	s2,64(sp)
    80202698:	fc4e                	sd	s3,56(sp)
    8020269a:	f852                	sd	s4,48(sp)
    8020269c:	f456                	sd	s5,40(sp)
    8020269e:	f05a                	sd	s6,32(sp)
    802026a0:	ec5e                	sd	s7,24(sp)
    802026a2:	e862                	sd	s8,16(sp)
    802026a4:	e466                	sd	s9,8(sp)
    802026a6:	1080                	addi	s0,sp,96
    802026a8:	8bae                	mv	s7,a1
  if (cpid == -1) // wait for any child
    802026aa:	57fd                	li	a5,-1
    802026ac:	02f51663          	bne	a0,a5,802026d8 <waitpid+0x4a>
  {
    return wait(addr);
    802026b0:	852e                	mv	a0,a1
    802026b2:	00000097          	auipc	ra,0x0
    802026b6:	c98080e7          	jalr	-872(ra) # 8020234a <wait>
    802026ba:	89aa                	mv	s3,a0

    // Wait for a child to exit.
    sleep(p, &p->lock); // DOC: wait-sleep

  }
}
    802026bc:	854e                	mv	a0,s3
    802026be:	60e6                	ld	ra,88(sp)
    802026c0:	6446                	ld	s0,80(sp)
    802026c2:	64a6                	ld	s1,72(sp)
    802026c4:	6906                	ld	s2,64(sp)
    802026c6:	79e2                	ld	s3,56(sp)
    802026c8:	7a42                	ld	s4,48(sp)
    802026ca:	7aa2                	ld	s5,40(sp)
    802026cc:	7b02                	ld	s6,32(sp)
    802026ce:	6be2                	ld	s7,24(sp)
    802026d0:	6c42                	ld	s8,16(sp)
    802026d2:	6ca2                	ld	s9,8(sp)
    802026d4:	6125                	addi	sp,sp,96
    802026d6:	8082                	ret
    802026d8:	8a2a                	mv	s4,a0
  struct proc *p = myproc();
    802026da:	fffff097          	auipc	ra,0xfffff
    802026de:	37e080e7          	jalr	894(ra) # 80201a58 <myproc>
    802026e2:	892a                	mv	s2,a0
  acquire(&p->lock);
    802026e4:	8caa                	mv	s9,a0
    802026e6:	ffffe097          	auipc	ra,0xffffe
    802026ea:	fe2080e7          	jalr	-30(ra) # 802006c8 <acquire>
    havekids = 0;
    802026ee:	4c01                	li	s8,0
        if (pp->state == ZOMBIE)
    802026f0:	4a91                	li	s5,4
    for (pp = proc; pp < &proc[NPROC]; pp++)
    802026f2:	00022997          	auipc	s3,0x22
    802026f6:	2fe98993          	addi	s3,s3,766 # 802249f0 <bcache>
        havekids = 1;
    802026fa:	4b05                	li	s6,1
    802026fc:	a045                	j	8020279c <waitpid+0x10e>
          pid = pp->pid;
    802026fe:	0384a983          	lw	s3,56(s1)
          if (addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
    80202702:	000b8e63          	beqz	s7,8020271e <waitpid+0x90>
    80202706:	4691                	li	a3,4
    80202708:	03448613          	addi	a2,s1,52
    8020270c:	85de                	mv	a1,s7
    8020270e:	05093503          	ld	a0,80(s2)
    80202712:	fffff097          	auipc	ra,0xfffff
    80202716:	bde080e7          	jalr	-1058(ra) # 802012f0 <copyout>
    8020271a:	02054263          	bltz	a0,8020273e <waitpid+0xb0>
          freeproc(pp);
    8020271e:	8526                	mv	a0,s1
    80202720:	fffff097          	auipc	ra,0xfffff
    80202724:	50a080e7          	jalr	1290(ra) # 80201c2a <freeproc>
          release(&pp->lock);
    80202728:	8526                	mv	a0,s1
    8020272a:	ffffe097          	auipc	ra,0xffffe
    8020272e:	ff2080e7          	jalr	-14(ra) # 8020071c <release>
          release(&p->lock);
    80202732:	854a                	mv	a0,s2
    80202734:	ffffe097          	auipc	ra,0xffffe
    80202738:	fe8080e7          	jalr	-24(ra) # 8020071c <release>
          return pid;
    8020273c:	b741                	j	802026bc <waitpid+0x2e>
            release(&pp->lock);
    8020273e:	8526                	mv	a0,s1
    80202740:	ffffe097          	auipc	ra,0xffffe
    80202744:	fdc080e7          	jalr	-36(ra) # 8020071c <release>
            release(&p->lock);
    80202748:	854a                	mv	a0,s2
    8020274a:	ffffe097          	auipc	ra,0xffffe
    8020274e:	fd2080e7          	jalr	-46(ra) # 8020071c <release>
            return -1;
    80202752:	59fd                	li	s3,-1
    80202754:	b7a5                	j	802026bc <waitpid+0x2e>
    for (pp = proc; pp < &proc[NPROC]; pp++)
    80202756:	4f848493          	addi	s1,s1,1272
    8020275a:	03348763          	beq	s1,s3,80202788 <waitpid+0xfa>
      if (pp->parent == p && pp->pid == cpid)
    8020275e:	709c                	ld	a5,32(s1)
    80202760:	ff279be3          	bne	a5,s2,80202756 <waitpid+0xc8>
    80202764:	5c9c                	lw	a5,56(s1)
    80202766:	ff4798e3          	bne	a5,s4,80202756 <waitpid+0xc8>
        acquire(&pp->lock);
    8020276a:	8526                	mv	a0,s1
    8020276c:	ffffe097          	auipc	ra,0xffffe
    80202770:	f5c080e7          	jalr	-164(ra) # 802006c8 <acquire>
        if (pp->state == ZOMBIE)
    80202774:	4c9c                	lw	a5,24(s1)
    80202776:	f95784e3          	beq	a5,s5,802026fe <waitpid+0x70>
        release(&pp->lock);
    8020277a:	8526                	mv	a0,s1
    8020277c:	ffffe097          	auipc	ra,0xffffe
    80202780:	fa0080e7          	jalr	-96(ra) # 8020071c <release>
        havekids = 1;
    80202784:	875a                	mv	a4,s6
    80202786:	bfc1                	j	80202756 <waitpid+0xc8>
    if (!havekids || p->killed)
    80202788:	c305                	beqz	a4,802027a8 <waitpid+0x11a>
    8020278a:	03092783          	lw	a5,48(s2)
    8020278e:	ef89                	bnez	a5,802027a8 <waitpid+0x11a>
    sleep(p, &p->lock); // DOC: wait-sleep
    80202790:	85e6                	mv	a1,s9
    80202792:	854a                	mv	a0,s2
    80202794:	00000097          	auipc	ra,0x0
    80202798:	b38080e7          	jalr	-1224(ra) # 802022cc <sleep>
    havekids = 0;
    8020279c:	8762                	mv	a4,s8
    for (pp = proc; pp < &proc[NPROC]; pp++)
    8020279e:	00013497          	auipc	s1,0x13
    802027a2:	9e248493          	addi	s1,s1,-1566 # 80215180 <proc>
    802027a6:	bf65                	j	8020275e <waitpid+0xd0>
      release(&p->lock);
    802027a8:	854a                	mv	a0,s2
    802027aa:	ffffe097          	auipc	ra,0xffffe
    802027ae:	f72080e7          	jalr	-142(ra) # 8020071c <release>
      panic("current process do not have child process [cpid]");
    802027b2:	00007517          	auipc	a0,0x7
    802027b6:	f2e50513          	addi	a0,a0,-210 # 802096e0 <digits+0x360>
    802027ba:	ffffe097          	auipc	ra,0xffffe
    802027be:	988080e7          	jalr	-1656(ra) # 80200142 <panic>

00000000802027c2 <swtch>:
    802027c2:	00153023          	sd	ra,0(a0)
    802027c6:	00253423          	sd	sp,8(a0)
    802027ca:	e900                	sd	s0,16(a0)
    802027cc:	ed04                	sd	s1,24(a0)
    802027ce:	03253023          	sd	s2,32(a0)
    802027d2:	03353423          	sd	s3,40(a0)
    802027d6:	03453823          	sd	s4,48(a0)
    802027da:	03553c23          	sd	s5,56(a0)
    802027de:	05653023          	sd	s6,64(a0)
    802027e2:	05753423          	sd	s7,72(a0)
    802027e6:	05853823          	sd	s8,80(a0)
    802027ea:	05953c23          	sd	s9,88(a0)
    802027ee:	07a53023          	sd	s10,96(a0)
    802027f2:	07b53423          	sd	s11,104(a0)
    802027f6:	0005b083          	ld	ra,0(a1)
    802027fa:	0085b103          	ld	sp,8(a1)
    802027fe:	6980                	ld	s0,16(a1)
    80202800:	6d84                	ld	s1,24(a1)
    80202802:	0205b903          	ld	s2,32(a1)
    80202806:	0285b983          	ld	s3,40(a1)
    8020280a:	0305ba03          	ld	s4,48(a1)
    8020280e:	0385ba83          	ld	s5,56(a1)
    80202812:	0405bb03          	ld	s6,64(a1)
    80202816:	0485bb83          	ld	s7,72(a1)
    8020281a:	0505bc03          	ld	s8,80(a1)
    8020281e:	0585bc83          	ld	s9,88(a1)
    80202822:	0605bd03          	ld	s10,96(a1)
    80202826:	0685bd83          	ld	s11,104(a1)
    8020282a:	8082                	ret

000000008020282c <trapinithart>:
// }

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    8020282c:	1141                	addi	sp,sp,-16
    8020282e:	e406                	sd	ra,8(sp)
    80202830:	e022                	sd	s0,0(sp)
    80202832:	0800                	addi	s0,sp,16
  asm volatile("csrw stvec, %0" : : "r" (x));
    80202834:	0000a797          	auipc	a5,0xa
    80202838:	8947b783          	ld	a5,-1900(a5) # 8020c0c8 <_GLOBAL_OFFSET_TABLE_+0x18>
    8020283c:	10579073          	csrw	stvec,a5
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202840:	100027f3          	csrr	a5,sstatus
  w_stvec((uint64)kernelvec);
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202844:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202848:	10079073          	csrw	sstatus,a5
  asm volatile("csrr %0, sie" : "=r" (x) );
    8020284c:	104027f3          	csrr	a5,sie
  // enable supervisor-mode timer interrupts.
  w_sie(r_sie() | SIE_SEIE | SIE_SSIE | SIE_STIE);
    80202850:	2227e793          	ori	a5,a5,546
  asm volatile("csrw sie, %0" : : "r" (x));
    80202854:	10479073          	csrw	sie,a5
  set_next_timeout();
    80202858:	00003097          	auipc	ra,0x3
    8020285c:	36e080e7          	jalr	878(ra) # 80205bc6 <set_next_timeout>
  #ifdef DEBUG
  printf("trapinithart\n");
  #endif
}
    80202860:	60a2                	ld	ra,8(sp)
    80202862:	6402                	ld	s0,0(sp)
    80202864:	0141                	addi	sp,sp,16
    80202866:	8082                	ret

0000000080202868 <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80202868:	1141                	addi	sp,sp,-16
    8020286a:	e406                	sd	ra,8(sp)
    8020286c:	e022                	sd	s0,0(sp)
    8020286e:	0800                	addi	s0,sp,16
  struct proc *p = myproc();
    80202870:	fffff097          	auipc	ra,0xfffff
    80202874:	1e8080e7          	jalr	488(ra) # 80201a58 <myproc>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202878:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    8020287c:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8020287e:	10079073          	csrw	sstatus,a5
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    80202882:	0000a617          	auipc	a2,0xa
    80202886:	83663603          	ld	a2,-1994(a2) # 8020c0b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    8020288a:	0000a697          	auipc	a3,0xa
    8020288e:	85e6b683          	ld	a3,-1954(a3) # 8020c0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    80202892:	8e91                	sub	a3,a3,a2
    80202894:	040007b7          	lui	a5,0x4000
    80202898:	17fd                	addi	a5,a5,-1
    8020289a:	07b2                	slli	a5,a5,0xc
    8020289c:	96be                	add	a3,a3,a5
  asm volatile("csrw stvec, %0" : : "r" (x));
    8020289e:	10569073          	csrw	stvec,a3

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    802028a2:	7138                	ld	a4,96(a0)
  asm volatile("csrr %0, satp" : "=r" (x) );
    802028a4:	180026f3          	csrr	a3,satp
    802028a8:	e314                	sd	a3,0(a4)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    802028aa:	7138                	ld	a4,96(a0)
    802028ac:	6134                	ld	a3,64(a0)
    802028ae:	6585                	lui	a1,0x1
    802028b0:	96ae                	add	a3,a3,a1
    802028b2:	e714                	sd	a3,8(a4)
  p->trapframe->kernel_trap = (uint64)usertrap;
    802028b4:	7138                	ld	a4,96(a0)
    802028b6:	00000697          	auipc	a3,0x0
    802028ba:	0f468693          	addi	a3,a3,244 # 802029aa <usertrap>
    802028be:	eb14                	sd	a3,16(a4)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    802028c0:	7138                	ld	a4,96(a0)
  asm volatile("mv %0, tp" : "=r" (x) );
    802028c2:	8692                	mv	a3,tp
    802028c4:	f314                	sd	a3,32(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802028c6:	100026f3          	csrr	a3,sstatus
  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    802028ca:	eff6f693          	andi	a3,a3,-257
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    802028ce:	0206e693          	ori	a3,a3,32
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802028d2:	10069073          	csrw	sstatus,a3
  w_sstatus(x);

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    802028d6:	7138                	ld	a4,96(a0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    802028d8:	6f18                	ld	a4,24(a4)
    802028da:	14171073          	csrw	sepc,a4

  // tell trampoline.S the user page table to switch to.
  // printf("[usertrapret]p->pagetable: %p\n", p->pagetable);
  uint64 satp = MAKE_SATP(p->pagetable);
    802028de:	692c                	ld	a1,80(a0)
    802028e0:	81b1                	srli	a1,a1,0xc

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    802028e2:	00009717          	auipc	a4,0x9
    802028e6:	7de73703          	ld	a4,2014(a4) # 8020c0c0 <_GLOBAL_OFFSET_TABLE_+0x10>
    802028ea:	8f11                	sub	a4,a4,a2
    802028ec:	97ba                	add	a5,a5,a4
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    802028ee:	577d                	li	a4,-1
    802028f0:	177e                	slli	a4,a4,0x3f
    802028f2:	8dd9                	or	a1,a1,a4
    802028f4:	02000537          	lui	a0,0x2000
    802028f8:	157d                	addi	a0,a0,-1
    802028fa:	0536                	slli	a0,a0,0xd
    802028fc:	9782                	jalr	a5
}
    802028fe:	60a2                	ld	ra,8(sp)
    80202900:	6402                	ld	s0,0(sp)
    80202902:	0141                	addi	sp,sp,16
    80202904:	8082                	ret

0000000080202906 <devintr>:
// Check if it's an external/software interrupt, 
// and handle it. 
// returns  2 if timer interrupt, 
//          1 if other device, 
//          0 if not recognized. 
int devintr(void) {
    80202906:	1101                	addi	sp,sp,-32
    80202908:	ec06                	sd	ra,24(sp)
    8020290a:	e822                	sd	s0,16(sp)
    8020290c:	e426                	sd	s1,8(sp)
    8020290e:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202910:	14202773          	csrr	a4,scause
	uint64 scause = r_scause();

	#ifdef QEMU 
	// handle external interrupt 
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    80202914:	00074d63          	bltz	a4,8020292e <devintr+0x28>
		sbi_set_mie();
		#endif 

		return 1;
	}
	else if (0x8000000000000005L == scause) {
    80202918:	57fd                	li	a5,-1
    8020291a:	17fe                	slli	a5,a5,0x3f
    8020291c:	0795                	addi	a5,a5,5
		timer_tick();
		return 2;
	}
	else { return 0;}
    8020291e:	4501                	li	a0,0
	else if (0x8000000000000005L == scause) {
    80202920:	06f70f63          	beq	a4,a5,8020299e <devintr+0x98>
}
    80202924:	60e2                	ld	ra,24(sp)
    80202926:	6442                	ld	s0,16(sp)
    80202928:	64a2                	ld	s1,8(sp)
    8020292a:	6105                	addi	sp,sp,32
    8020292c:	8082                	ret
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    8020292e:	0ff77793          	andi	a5,a4,255
    80202932:	46a5                	li	a3,9
    80202934:	fed792e3          	bne	a5,a3,80202918 <devintr+0x12>
		int irq = plic_claim();
    80202938:	00005097          	auipc	ra,0x5
    8020293c:	cd8080e7          	jalr	-808(ra) # 80207610 <plic_claim>
    80202940:	84aa                	mv	s1,a0
		if (UART_IRQ == irq) {
    80202942:	47a9                	li	a5,10
    80202944:	02f50163          	beq	a0,a5,80202966 <devintr+0x60>
		else if (DISK_IRQ == irq) {
    80202948:	4785                	li	a5,1
    8020294a:	04f50563          	beq	a0,a5,80202994 <devintr+0x8e>
		return 1;
    8020294e:	4505                	li	a0,1
		else if (irq) {
    80202950:	d8f1                	beqz	s1,80202924 <devintr+0x1e>
			printf("unexpected interrupt irq = %d\n", irq);
    80202952:	85a6                	mv	a1,s1
    80202954:	00007517          	auipc	a0,0x7
    80202958:	dec50513          	addi	a0,a0,-532 # 80209740 <digits+0x3c0>
    8020295c:	ffffe097          	auipc	ra,0xffffe
    80202960:	830080e7          	jalr	-2000(ra) # 8020018c <printf>
    80202964:	a821                	j	8020297c <devintr+0x76>
	return SBI_CALL_0(SBI_CONSOLE_GETCHAR);
    80202966:	4501                	li	a0,0
    80202968:	4581                	li	a1,0
    8020296a:	4601                	li	a2,0
    8020296c:	4681                	li	a3,0
    8020296e:	4889                	li	a7,2
    80202970:	00000073          	ecall
    80202974:	2501                	sext.w	a0,a0
			if (-1 != c) {
    80202976:	57fd                	li	a5,-1
    80202978:	00f51963          	bne	a0,a5,8020298a <devintr+0x84>
		if (irq) { plic_complete(irq);}
    8020297c:	8526                	mv	a0,s1
    8020297e:	00005097          	auipc	ra,0x5
    80202982:	cbc080e7          	jalr	-836(ra) # 8020763a <plic_complete>
		return 1;
    80202986:	4505                	li	a0,1
    80202988:	bf71                	j	80202924 <devintr+0x1e>
				consoleintr(c);
    8020298a:	00005097          	auipc	ra,0x5
    8020298e:	ec8080e7          	jalr	-312(ra) # 80207852 <consoleintr>
    80202992:	b7ed                	j	8020297c <devintr+0x76>
			disk_intr();
    80202994:	00003097          	auipc	ra,0x3
    80202998:	2f2080e7          	jalr	754(ra) # 80205c86 <disk_intr>
    8020299c:	b7c5                	j	8020297c <devintr+0x76>
		timer_tick();
    8020299e:	00003097          	auipc	ra,0x3
    802029a2:	24e080e7          	jalr	590(ra) # 80205bec <timer_tick>
		return 2;
    802029a6:	4509                	li	a0,2
    802029a8:	bfb5                	j	80202924 <devintr+0x1e>

00000000802029aa <usertrap>:
{
    802029aa:	1101                	addi	sp,sp,-32
    802029ac:	ec06                	sd	ra,24(sp)
    802029ae:	e822                	sd	s0,16(sp)
    802029b0:	e426                	sd	s1,8(sp)
    802029b2:	e04a                	sd	s2,0(sp)
    802029b4:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802029b6:	100027f3          	csrr	a5,sstatus
  if((r_sstatus() & SSTATUS_SPP) != 0)
    802029ba:	1007f793          	andi	a5,a5,256
    802029be:	e3ad                	bnez	a5,80202a20 <usertrap+0x76>
  asm volatile("csrw stvec, %0" : : "r" (x));
    802029c0:	00009797          	auipc	a5,0x9
    802029c4:	7087b783          	ld	a5,1800(a5) # 8020c0c8 <_GLOBAL_OFFSET_TABLE_+0x18>
    802029c8:	10579073          	csrw	stvec,a5
  struct proc *p = myproc();
    802029cc:	fffff097          	auipc	ra,0xfffff
    802029d0:	08c080e7          	jalr	140(ra) # 80201a58 <myproc>
    802029d4:	84aa                	mv	s1,a0
  p->trapframe->epc = r_sepc();
    802029d6:	713c                	ld	a5,96(a0)
  asm volatile("csrr %0, sepc" : "=r" (x) );
    802029d8:	14102773          	csrr	a4,sepc
    802029dc:	ef98                	sd	a4,24(a5)
  asm volatile("csrr %0, scause" : "=r" (x) );
    802029de:	14202773          	csrr	a4,scause
  if(r_scause() == 8){
    802029e2:	47a1                	li	a5,8
    802029e4:	04f71c63          	bne	a4,a5,80202a3c <usertrap+0x92>
    if(p->killed)
    802029e8:	591c                	lw	a5,48(a0)
    802029ea:	e3b9                	bnez	a5,80202a30 <usertrap+0x86>
    p->trapframe->epc += 4;
    802029ec:	70b8                	ld	a4,96(s1)
    802029ee:	6f1c                	ld	a5,24(a4)
    802029f0:	0791                	addi	a5,a5,4
    802029f2:	ef1c                	sd	a5,24(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802029f4:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    802029f8:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802029fc:	10079073          	csrw	sstatus,a5
    syscall();
    80202a00:	00000097          	auipc	ra,0x0
    80202a04:	5d4080e7          	jalr	1492(ra) # 80202fd4 <syscall>
  if(p->killed)
    80202a08:	589c                	lw	a5,48(s1)
    80202a0a:	ebd1                	bnez	a5,80202a9e <usertrap+0xf4>
  usertrapret();
    80202a0c:	00000097          	auipc	ra,0x0
    80202a10:	e5c080e7          	jalr	-420(ra) # 80202868 <usertrapret>
}
    80202a14:	60e2                	ld	ra,24(sp)
    80202a16:	6442                	ld	s0,16(sp)
    80202a18:	64a2                	ld	s1,8(sp)
    80202a1a:	6902                	ld	s2,0(sp)
    80202a1c:	6105                	addi	sp,sp,32
    80202a1e:	8082                	ret
    panic("usertrap: not from user mode");
    80202a20:	00007517          	auipc	a0,0x7
    80202a24:	d4050513          	addi	a0,a0,-704 # 80209760 <digits+0x3e0>
    80202a28:	ffffd097          	auipc	ra,0xffffd
    80202a2c:	71a080e7          	jalr	1818(ra) # 80200142 <panic>
      exit(-1);
    80202a30:	557d                	li	a0,-1
    80202a32:	fffff097          	auipc	ra,0xfffff
    80202a36:	75a080e7          	jalr	1882(ra) # 8020218c <exit>
    80202a3a:	bf4d                	j	802029ec <usertrap+0x42>
  else if((which_dev = devintr()) != 0){
    80202a3c:	00000097          	auipc	ra,0x0
    80202a40:	eca080e7          	jalr	-310(ra) # 80202906 <devintr>
    80202a44:	892a                	mv	s2,a0
    80202a46:	c501                	beqz	a0,80202a4e <usertrap+0xa4>
  if(p->killed)
    80202a48:	589c                	lw	a5,48(s1)
    80202a4a:	c3b1                	beqz	a5,80202a8e <usertrap+0xe4>
    80202a4c:	a825                	j	80202a84 <usertrap+0xda>
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202a4e:	142025f3          	csrr	a1,scause
    printf("\nusertrap(): unexpected scause %p pid=%d %s\n", r_scause(), p->pid, p->name);
    80202a52:	4e048693          	addi	a3,s1,1248
    80202a56:	5c90                	lw	a2,56(s1)
    80202a58:	00007517          	auipc	a0,0x7
    80202a5c:	d2850513          	addi	a0,a0,-728 # 80209780 <digits+0x400>
    80202a60:	ffffd097          	auipc	ra,0xffffd
    80202a64:	72c080e7          	jalr	1836(ra) # 8020018c <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202a68:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202a6c:	14302673          	csrr	a2,stval
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80202a70:	00007517          	auipc	a0,0x7
    80202a74:	d4050513          	addi	a0,a0,-704 # 802097b0 <digits+0x430>
    80202a78:	ffffd097          	auipc	ra,0xffffd
    80202a7c:	714080e7          	jalr	1812(ra) # 8020018c <printf>
    p->killed = 1;
    80202a80:	4785                	li	a5,1
    80202a82:	d89c                	sw	a5,48(s1)
    exit(-1);
    80202a84:	557d                	li	a0,-1
    80202a86:	fffff097          	auipc	ra,0xfffff
    80202a8a:	706080e7          	jalr	1798(ra) # 8020218c <exit>
  if(which_dev == 2)
    80202a8e:	4789                	li	a5,2
    80202a90:	f6f91ee3          	bne	s2,a5,80202a0c <usertrap+0x62>
    yield();
    80202a94:	fffff097          	auipc	ra,0xfffff
    80202a98:	7fc080e7          	jalr	2044(ra) # 80202290 <yield>
    80202a9c:	bf85                	j	80202a0c <usertrap+0x62>
  int which_dev = 0;
    80202a9e:	4901                	li	s2,0
    80202aa0:	b7d5                	j	80202a84 <usertrap+0xda>

0000000080202aa2 <kerneltrap>:
kerneltrap() {
    80202aa2:	7179                	addi	sp,sp,-48
    80202aa4:	f406                	sd	ra,40(sp)
    80202aa6:	f022                	sd	s0,32(sp)
    80202aa8:	ec26                	sd	s1,24(sp)
    80202aaa:	e84a                	sd	s2,16(sp)
    80202aac:	e44e                	sd	s3,8(sp)
    80202aae:	1800                	addi	s0,sp,48
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202ab0:	14102973          	csrr	s2,sepc
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202ab4:	100024f3          	csrr	s1,sstatus
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202ab8:	142029f3          	csrr	s3,scause
  if((sstatus & SSTATUS_SPP) == 0)
    80202abc:	1004f793          	andi	a5,s1,256
    80202ac0:	cb85                	beqz	a5,80202af0 <kerneltrap+0x4e>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202ac2:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80202ac6:	8b89                	andi	a5,a5,2
  if(intr_get() != 0)
    80202ac8:	ef85                	bnez	a5,80202b00 <kerneltrap+0x5e>
  if((which_dev = devintr()) == 0){
    80202aca:	00000097          	auipc	ra,0x0
    80202ace:	e3c080e7          	jalr	-452(ra) # 80202906 <devintr>
    80202ad2:	cd1d                	beqz	a0,80202b10 <kerneltrap+0x6e>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202ad4:	4789                	li	a5,2
    80202ad6:	08f50b63          	beq	a0,a5,80202b6c <kerneltrap+0xca>
  asm volatile("csrw sepc, %0" : : "r" (x));
    80202ada:	14191073          	csrw	sepc,s2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202ade:	10049073          	csrw	sstatus,s1
}
    80202ae2:	70a2                	ld	ra,40(sp)
    80202ae4:	7402                	ld	s0,32(sp)
    80202ae6:	64e2                	ld	s1,24(sp)
    80202ae8:	6942                	ld	s2,16(sp)
    80202aea:	69a2                	ld	s3,8(sp)
    80202aec:	6145                	addi	sp,sp,48
    80202aee:	8082                	ret
    panic("kerneltrap: not from supervisor mode");
    80202af0:	00007517          	auipc	a0,0x7
    80202af4:	ce050513          	addi	a0,a0,-800 # 802097d0 <digits+0x450>
    80202af8:	ffffd097          	auipc	ra,0xffffd
    80202afc:	64a080e7          	jalr	1610(ra) # 80200142 <panic>
    panic("kerneltrap: interrupts enabled");
    80202b00:	00007517          	auipc	a0,0x7
    80202b04:	cf850513          	addi	a0,a0,-776 # 802097f8 <digits+0x478>
    80202b08:	ffffd097          	auipc	ra,0xffffd
    80202b0c:	63a080e7          	jalr	1594(ra) # 80200142 <panic>
    printf("\nscause %p\n", scause);
    80202b10:	85ce                	mv	a1,s3
    80202b12:	00007517          	auipc	a0,0x7
    80202b16:	d0650513          	addi	a0,a0,-762 # 80209818 <digits+0x498>
    80202b1a:	ffffd097          	auipc	ra,0xffffd
    80202b1e:	672080e7          	jalr	1650(ra) # 8020018c <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202b22:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202b26:	14302673          	csrr	a2,stval
  asm volatile("mv %0, tp" : "=r" (x) );
    80202b2a:	8692                	mv	a3,tp
    printf("sepc=%p stval=%p hart=%d\n", r_sepc(), r_stval(), r_tp());
    80202b2c:	00007517          	auipc	a0,0x7
    80202b30:	cfc50513          	addi	a0,a0,-772 # 80209828 <digits+0x4a8>
    80202b34:	ffffd097          	auipc	ra,0xffffd
    80202b38:	658080e7          	jalr	1624(ra) # 8020018c <printf>
    struct proc *p = myproc();
    80202b3c:	fffff097          	auipc	ra,0xfffff
    80202b40:	f1c080e7          	jalr	-228(ra) # 80201a58 <myproc>
    if (p != 0) {
    80202b44:	cd01                	beqz	a0,80202b5c <kerneltrap+0xba>
      printf("pid: %d, name: %s\n", p->pid, p->name);
    80202b46:	4e050613          	addi	a2,a0,1248
    80202b4a:	5d0c                	lw	a1,56(a0)
    80202b4c:	00007517          	auipc	a0,0x7
    80202b50:	cfc50513          	addi	a0,a0,-772 # 80209848 <digits+0x4c8>
    80202b54:	ffffd097          	auipc	ra,0xffffd
    80202b58:	638080e7          	jalr	1592(ra) # 8020018c <printf>
    panic("kerneltrap");
    80202b5c:	00007517          	auipc	a0,0x7
    80202b60:	d0450513          	addi	a0,a0,-764 # 80209860 <digits+0x4e0>
    80202b64:	ffffd097          	auipc	ra,0xffffd
    80202b68:	5de080e7          	jalr	1502(ra) # 80200142 <panic>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202b6c:	fffff097          	auipc	ra,0xfffff
    80202b70:	eec080e7          	jalr	-276(ra) # 80201a58 <myproc>
    80202b74:	d13d                	beqz	a0,80202ada <kerneltrap+0x38>
    80202b76:	fffff097          	auipc	ra,0xfffff
    80202b7a:	ee2080e7          	jalr	-286(ra) # 80201a58 <myproc>
    80202b7e:	4d18                	lw	a4,24(a0)
    80202b80:	478d                	li	a5,3
    80202b82:	f4f71ce3          	bne	a4,a5,80202ada <kerneltrap+0x38>
    yield();
    80202b86:	fffff097          	auipc	ra,0xfffff
    80202b8a:	70a080e7          	jalr	1802(ra) # 80202290 <yield>
    80202b8e:	b7b1                	j	80202ada <kerneltrap+0x38>

0000000080202b90 <trapframedump>:

void trapframedump(struct trapframe *tf)
{
    80202b90:	1101                	addi	sp,sp,-32
    80202b92:	ec06                	sd	ra,24(sp)
    80202b94:	e822                	sd	s0,16(sp)
    80202b96:	e426                	sd	s1,8(sp)
    80202b98:	1000                	addi	s0,sp,32
    80202b9a:	84aa                	mv	s1,a0
  printf("a0: %p\t", tf->a0);
    80202b9c:	792c                	ld	a1,112(a0)
    80202b9e:	00007517          	auipc	a0,0x7
    80202ba2:	cd250513          	addi	a0,a0,-814 # 80209870 <digits+0x4f0>
    80202ba6:	ffffd097          	auipc	ra,0xffffd
    80202baa:	5e6080e7          	jalr	1510(ra) # 8020018c <printf>
  printf("a1: %p\t", tf->a1);
    80202bae:	7cac                	ld	a1,120(s1)
    80202bb0:	00007517          	auipc	a0,0x7
    80202bb4:	cc850513          	addi	a0,a0,-824 # 80209878 <digits+0x4f8>
    80202bb8:	ffffd097          	auipc	ra,0xffffd
    80202bbc:	5d4080e7          	jalr	1492(ra) # 8020018c <printf>
  printf("a2: %p\t", tf->a2);
    80202bc0:	60cc                	ld	a1,128(s1)
    80202bc2:	00007517          	auipc	a0,0x7
    80202bc6:	cbe50513          	addi	a0,a0,-834 # 80209880 <digits+0x500>
    80202bca:	ffffd097          	auipc	ra,0xffffd
    80202bce:	5c2080e7          	jalr	1474(ra) # 8020018c <printf>
  printf("a3: %p\n", tf->a3);
    80202bd2:	64cc                	ld	a1,136(s1)
    80202bd4:	00007517          	auipc	a0,0x7
    80202bd8:	cb450513          	addi	a0,a0,-844 # 80209888 <digits+0x508>
    80202bdc:	ffffd097          	auipc	ra,0xffffd
    80202be0:	5b0080e7          	jalr	1456(ra) # 8020018c <printf>
  printf("a4: %p\t", tf->a4);
    80202be4:	68cc                	ld	a1,144(s1)
    80202be6:	00007517          	auipc	a0,0x7
    80202bea:	caa50513          	addi	a0,a0,-854 # 80209890 <digits+0x510>
    80202bee:	ffffd097          	auipc	ra,0xffffd
    80202bf2:	59e080e7          	jalr	1438(ra) # 8020018c <printf>
  printf("a5: %p\t", tf->a5);
    80202bf6:	6ccc                	ld	a1,152(s1)
    80202bf8:	00007517          	auipc	a0,0x7
    80202bfc:	ca050513          	addi	a0,a0,-864 # 80209898 <digits+0x518>
    80202c00:	ffffd097          	auipc	ra,0xffffd
    80202c04:	58c080e7          	jalr	1420(ra) # 8020018c <printf>
  printf("a6: %p\t", tf->a6);
    80202c08:	70cc                	ld	a1,160(s1)
    80202c0a:	00007517          	auipc	a0,0x7
    80202c0e:	c9650513          	addi	a0,a0,-874 # 802098a0 <digits+0x520>
    80202c12:	ffffd097          	auipc	ra,0xffffd
    80202c16:	57a080e7          	jalr	1402(ra) # 8020018c <printf>
  printf("a7: %p\n", tf->a7);
    80202c1a:	74cc                	ld	a1,168(s1)
    80202c1c:	00007517          	auipc	a0,0x7
    80202c20:	c8c50513          	addi	a0,a0,-884 # 802098a8 <digits+0x528>
    80202c24:	ffffd097          	auipc	ra,0xffffd
    80202c28:	568080e7          	jalr	1384(ra) # 8020018c <printf>
  printf("t0: %p\t", tf->t0);
    80202c2c:	64ac                	ld	a1,72(s1)
    80202c2e:	00007517          	auipc	a0,0x7
    80202c32:	c8250513          	addi	a0,a0,-894 # 802098b0 <digits+0x530>
    80202c36:	ffffd097          	auipc	ra,0xffffd
    80202c3a:	556080e7          	jalr	1366(ra) # 8020018c <printf>
  printf("t1: %p\t", tf->t1);
    80202c3e:	68ac                	ld	a1,80(s1)
    80202c40:	00007517          	auipc	a0,0x7
    80202c44:	c7850513          	addi	a0,a0,-904 # 802098b8 <digits+0x538>
    80202c48:	ffffd097          	auipc	ra,0xffffd
    80202c4c:	544080e7          	jalr	1348(ra) # 8020018c <printf>
  printf("t2: %p\t", tf->t2);
    80202c50:	6cac                	ld	a1,88(s1)
    80202c52:	00007517          	auipc	a0,0x7
    80202c56:	c6e50513          	addi	a0,a0,-914 # 802098c0 <digits+0x540>
    80202c5a:	ffffd097          	auipc	ra,0xffffd
    80202c5e:	532080e7          	jalr	1330(ra) # 8020018c <printf>
  printf("t3: %p\n", tf->t3);
    80202c62:	1004b583          	ld	a1,256(s1)
    80202c66:	00007517          	auipc	a0,0x7
    80202c6a:	c6250513          	addi	a0,a0,-926 # 802098c8 <digits+0x548>
    80202c6e:	ffffd097          	auipc	ra,0xffffd
    80202c72:	51e080e7          	jalr	1310(ra) # 8020018c <printf>
  printf("t4: %p\t", tf->t4);
    80202c76:	1084b583          	ld	a1,264(s1)
    80202c7a:	00007517          	auipc	a0,0x7
    80202c7e:	c5650513          	addi	a0,a0,-938 # 802098d0 <digits+0x550>
    80202c82:	ffffd097          	auipc	ra,0xffffd
    80202c86:	50a080e7          	jalr	1290(ra) # 8020018c <printf>
  printf("t5: %p\t", tf->t5);
    80202c8a:	1104b583          	ld	a1,272(s1)
    80202c8e:	00007517          	auipc	a0,0x7
    80202c92:	c4a50513          	addi	a0,a0,-950 # 802098d8 <digits+0x558>
    80202c96:	ffffd097          	auipc	ra,0xffffd
    80202c9a:	4f6080e7          	jalr	1270(ra) # 8020018c <printf>
  printf("t6: %p\t", tf->t6);
    80202c9e:	1184b583          	ld	a1,280(s1)
    80202ca2:	00007517          	auipc	a0,0x7
    80202ca6:	c3e50513          	addi	a0,a0,-962 # 802098e0 <digits+0x560>
    80202caa:	ffffd097          	auipc	ra,0xffffd
    80202cae:	4e2080e7          	jalr	1250(ra) # 8020018c <printf>
  printf("s0: %p\n", tf->s0);
    80202cb2:	70ac                	ld	a1,96(s1)
    80202cb4:	00007517          	auipc	a0,0x7
    80202cb8:	c3450513          	addi	a0,a0,-972 # 802098e8 <digits+0x568>
    80202cbc:	ffffd097          	auipc	ra,0xffffd
    80202cc0:	4d0080e7          	jalr	1232(ra) # 8020018c <printf>
  printf("s1: %p\t", tf->s1);
    80202cc4:	74ac                	ld	a1,104(s1)
    80202cc6:	00007517          	auipc	a0,0x7
    80202cca:	c2a50513          	addi	a0,a0,-982 # 802098f0 <digits+0x570>
    80202cce:	ffffd097          	auipc	ra,0xffffd
    80202cd2:	4be080e7          	jalr	1214(ra) # 8020018c <printf>
  printf("s2: %p\t", tf->s2);
    80202cd6:	78cc                	ld	a1,176(s1)
    80202cd8:	00007517          	auipc	a0,0x7
    80202cdc:	c2050513          	addi	a0,a0,-992 # 802098f8 <digits+0x578>
    80202ce0:	ffffd097          	auipc	ra,0xffffd
    80202ce4:	4ac080e7          	jalr	1196(ra) # 8020018c <printf>
  printf("s3: %p\t", tf->s3);
    80202ce8:	7ccc                	ld	a1,184(s1)
    80202cea:	00007517          	auipc	a0,0x7
    80202cee:	c1650513          	addi	a0,a0,-1002 # 80209900 <digits+0x580>
    80202cf2:	ffffd097          	auipc	ra,0xffffd
    80202cf6:	49a080e7          	jalr	1178(ra) # 8020018c <printf>
  printf("s4: %p\n", tf->s4);
    80202cfa:	60ec                	ld	a1,192(s1)
    80202cfc:	00007517          	auipc	a0,0x7
    80202d00:	c0c50513          	addi	a0,a0,-1012 # 80209908 <digits+0x588>
    80202d04:	ffffd097          	auipc	ra,0xffffd
    80202d08:	488080e7          	jalr	1160(ra) # 8020018c <printf>
  printf("s5: %p\t", tf->s5);
    80202d0c:	64ec                	ld	a1,200(s1)
    80202d0e:	00007517          	auipc	a0,0x7
    80202d12:	c0250513          	addi	a0,a0,-1022 # 80209910 <digits+0x590>
    80202d16:	ffffd097          	auipc	ra,0xffffd
    80202d1a:	476080e7          	jalr	1142(ra) # 8020018c <printf>
  printf("s6: %p\t", tf->s6);
    80202d1e:	68ec                	ld	a1,208(s1)
    80202d20:	00007517          	auipc	a0,0x7
    80202d24:	bf850513          	addi	a0,a0,-1032 # 80209918 <digits+0x598>
    80202d28:	ffffd097          	auipc	ra,0xffffd
    80202d2c:	464080e7          	jalr	1124(ra) # 8020018c <printf>
  printf("s7: %p\t", tf->s7);
    80202d30:	6cec                	ld	a1,216(s1)
    80202d32:	00007517          	auipc	a0,0x7
    80202d36:	bee50513          	addi	a0,a0,-1042 # 80209920 <digits+0x5a0>
    80202d3a:	ffffd097          	auipc	ra,0xffffd
    80202d3e:	452080e7          	jalr	1106(ra) # 8020018c <printf>
  printf("s8: %p\n", tf->s8);
    80202d42:	70ec                	ld	a1,224(s1)
    80202d44:	00007517          	auipc	a0,0x7
    80202d48:	be450513          	addi	a0,a0,-1052 # 80209928 <digits+0x5a8>
    80202d4c:	ffffd097          	auipc	ra,0xffffd
    80202d50:	440080e7          	jalr	1088(ra) # 8020018c <printf>
  printf("s9: %p\t", tf->s9);
    80202d54:	74ec                	ld	a1,232(s1)
    80202d56:	00007517          	auipc	a0,0x7
    80202d5a:	bda50513          	addi	a0,a0,-1062 # 80209930 <digits+0x5b0>
    80202d5e:	ffffd097          	auipc	ra,0xffffd
    80202d62:	42e080e7          	jalr	1070(ra) # 8020018c <printf>
  printf("s10: %p\t", tf->s10);
    80202d66:	78ec                	ld	a1,240(s1)
    80202d68:	00007517          	auipc	a0,0x7
    80202d6c:	bd050513          	addi	a0,a0,-1072 # 80209938 <digits+0x5b8>
    80202d70:	ffffd097          	auipc	ra,0xffffd
    80202d74:	41c080e7          	jalr	1052(ra) # 8020018c <printf>
  printf("s11: %p\t", tf->s11);
    80202d78:	7cec                	ld	a1,248(s1)
    80202d7a:	00007517          	auipc	a0,0x7
    80202d7e:	bce50513          	addi	a0,a0,-1074 # 80209948 <digits+0x5c8>
    80202d82:	ffffd097          	auipc	ra,0xffffd
    80202d86:	40a080e7          	jalr	1034(ra) # 8020018c <printf>
  printf("ra: %p\n", tf->ra);
    80202d8a:	748c                	ld	a1,40(s1)
    80202d8c:	00007517          	auipc	a0,0x7
    80202d90:	88450513          	addi	a0,a0,-1916 # 80209610 <digits+0x290>
    80202d94:	ffffd097          	auipc	ra,0xffffd
    80202d98:	3f8080e7          	jalr	1016(ra) # 8020018c <printf>
  printf("sp: %p\t", tf->sp);
    80202d9c:	788c                	ld	a1,48(s1)
    80202d9e:	00007517          	auipc	a0,0x7
    80202da2:	bba50513          	addi	a0,a0,-1094 # 80209958 <digits+0x5d8>
    80202da6:	ffffd097          	auipc	ra,0xffffd
    80202daa:	3e6080e7          	jalr	998(ra) # 8020018c <printf>
  printf("gp: %p\t", tf->gp);
    80202dae:	7c8c                	ld	a1,56(s1)
    80202db0:	00007517          	auipc	a0,0x7
    80202db4:	bb050513          	addi	a0,a0,-1104 # 80209960 <digits+0x5e0>
    80202db8:	ffffd097          	auipc	ra,0xffffd
    80202dbc:	3d4080e7          	jalr	980(ra) # 8020018c <printf>
  printf("tp: %p\t", tf->tp);
    80202dc0:	60ac                	ld	a1,64(s1)
    80202dc2:	00007517          	auipc	a0,0x7
    80202dc6:	ba650513          	addi	a0,a0,-1114 # 80209968 <digits+0x5e8>
    80202dca:	ffffd097          	auipc	ra,0xffffd
    80202dce:	3c2080e7          	jalr	962(ra) # 8020018c <printf>
  printf("epc: %p\n", tf->epc);
    80202dd2:	6c8c                	ld	a1,24(s1)
    80202dd4:	00007517          	auipc	a0,0x7
    80202dd8:	b9c50513          	addi	a0,a0,-1124 # 80209970 <digits+0x5f0>
    80202ddc:	ffffd097          	auipc	ra,0xffffd
    80202de0:	3b0080e7          	jalr	944(ra) # 8020018c <printf>
}
    80202de4:	60e2                	ld	ra,24(sp)
    80202de6:	6442                	ld	s0,16(sp)
    80202de8:	64a2                	ld	s1,8(sp)
    80202dea:	6105                	addi	sp,sp,32
    80202dec:	8082                	ret

0000000080202dee <argraw>:
  return strlen(buf);
}

static uint64
argraw(int n)
{
    80202dee:	1101                	addi	sp,sp,-32
    80202df0:	ec06                	sd	ra,24(sp)
    80202df2:	e822                	sd	s0,16(sp)
    80202df4:	e426                	sd	s1,8(sp)
    80202df6:	1000                	addi	s0,sp,32
    80202df8:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80202dfa:	fffff097          	auipc	ra,0xfffff
    80202dfe:	c5e080e7          	jalr	-930(ra) # 80201a58 <myproc>
  switch (n) {
    80202e02:	4795                	li	a5,5
    80202e04:	0497e163          	bltu	a5,s1,80202e46 <argraw+0x58>
    80202e08:	048a                	slli	s1,s1,0x2
    80202e0a:	00007717          	auipc	a4,0x7
    80202e0e:	d2e70713          	addi	a4,a4,-722 # 80209b38 <digits+0x7b8>
    80202e12:	94ba                	add	s1,s1,a4
    80202e14:	409c                	lw	a5,0(s1)
    80202e16:	97ba                	add	a5,a5,a4
    80202e18:	8782                	jr	a5
  case 0:
    return p->trapframe->a0;
    80202e1a:	713c                	ld	a5,96(a0)
    80202e1c:	7ba8                	ld	a0,112(a5)
  case 5:
    return p->trapframe->a5;
  }
  panic("argraw");
  return -1;
}
    80202e1e:	60e2                	ld	ra,24(sp)
    80202e20:	6442                	ld	s0,16(sp)
    80202e22:	64a2                	ld	s1,8(sp)
    80202e24:	6105                	addi	sp,sp,32
    80202e26:	8082                	ret
    return p->trapframe->a1;
    80202e28:	713c                	ld	a5,96(a0)
    80202e2a:	7fa8                	ld	a0,120(a5)
    80202e2c:	bfcd                	j	80202e1e <argraw+0x30>
    return p->trapframe->a2;
    80202e2e:	713c                	ld	a5,96(a0)
    80202e30:	63c8                	ld	a0,128(a5)
    80202e32:	b7f5                	j	80202e1e <argraw+0x30>
    return p->trapframe->a3;
    80202e34:	713c                	ld	a5,96(a0)
    80202e36:	67c8                	ld	a0,136(a5)
    80202e38:	b7dd                	j	80202e1e <argraw+0x30>
    return p->trapframe->a4;
    80202e3a:	713c                	ld	a5,96(a0)
    80202e3c:	6bc8                	ld	a0,144(a5)
    80202e3e:	b7c5                	j	80202e1e <argraw+0x30>
    return p->trapframe->a5;
    80202e40:	713c                	ld	a5,96(a0)
    80202e42:	6fc8                	ld	a0,152(a5)
    80202e44:	bfe9                	j	80202e1e <argraw+0x30>
  panic("argraw");
    80202e46:	00007517          	auipc	a0,0x7
    80202e4a:	b3a50513          	addi	a0,a0,-1222 # 80209980 <digits+0x600>
    80202e4e:	ffffd097          	auipc	ra,0xffffd
    80202e52:	2f4080e7          	jalr	756(ra) # 80200142 <panic>

0000000080202e56 <sys_sysinfo>:
    return 0;
}

uint64
sys_sysinfo(void)
{
    80202e56:	7179                	addi	sp,sp,-48
    80202e58:	f406                	sd	ra,40(sp)
    80202e5a:	f022                	sd	s0,32(sp)
    80202e5c:	ec26                	sd	s1,24(sp)
    80202e5e:	1800                	addi	s0,sp,48
  *ip = argraw(n);
    80202e60:	4501                	li	a0,0
    80202e62:	00000097          	auipc	ra,0x0
    80202e66:	f8c080e7          	jalr	-116(ra) # 80202dee <argraw>
    80202e6a:	84aa                	mv	s1,a0
  if (argaddr(0, &addr) < 0) {
    return -1;
  }

  struct sysinfo info;
  info.freemem = freemem_amount();
    80202e6c:	ffffd097          	auipc	ra,0xffffd
    80202e70:	756080e7          	jalr	1878(ra) # 802005c2 <freemem_amount>
    80202e74:	fca43823          	sd	a0,-48(s0)
  info.nproc = procnum();
    80202e78:	fffff097          	auipc	ra,0xfffff
    80202e7c:	7ce080e7          	jalr	1998(ra) # 80202646 <procnum>
    80202e80:	fca43c23          	sd	a0,-40(s0)

  // if (copyout(p->pagetable, addr, (char *)&info, sizeof(info)) < 0) {
  if (copyout2(addr, (char *)&info, sizeof(info)) < 0) {
    80202e84:	4641                	li	a2,16
    80202e86:	fd040593          	addi	a1,s0,-48
    80202e8a:	8526                	mv	a0,s1
    80202e8c:	ffffe097          	auipc	ra,0xffffe
    80202e90:	4f0080e7          	jalr	1264(ra) # 8020137c <copyout2>
    return -1;
  }

  return 0;
    80202e94:	957d                	srai	a0,a0,0x3f
    80202e96:	70a2                	ld	ra,40(sp)
    80202e98:	7402                	ld	s0,32(sp)
    80202e9a:	64e2                	ld	s1,24(sp)
    80202e9c:	6145                	addi	sp,sp,48
    80202e9e:	8082                	ret

0000000080202ea0 <fetchaddr>:
{
    80202ea0:	1101                	addi	sp,sp,-32
    80202ea2:	ec06                	sd	ra,24(sp)
    80202ea4:	e822                	sd	s0,16(sp)
    80202ea6:	e426                	sd	s1,8(sp)
    80202ea8:	e04a                	sd	s2,0(sp)
    80202eaa:	1000                	addi	s0,sp,32
    80202eac:	84aa                	mv	s1,a0
    80202eae:	892e                	mv	s2,a1
  struct proc *p = myproc();
    80202eb0:	fffff097          	auipc	ra,0xfffff
    80202eb4:	ba8080e7          	jalr	-1112(ra) # 80201a58 <myproc>
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    80202eb8:	653c                	ld	a5,72(a0)
    80202eba:	02f4f763          	bgeu	s1,a5,80202ee8 <fetchaddr+0x48>
    80202ebe:	00848713          	addi	a4,s1,8
    80202ec2:	02e7e563          	bltu	a5,a4,80202eec <fetchaddr+0x4c>
  if(copyin2((char *)ip, addr, sizeof(*ip)) != 0)
    80202ec6:	4621                	li	a2,8
    80202ec8:	85a6                	mv	a1,s1
    80202eca:	854a                	mv	a0,s2
    80202ecc:	ffffe097          	auipc	ra,0xffffe
    80202ed0:	58e080e7          	jalr	1422(ra) # 8020145a <copyin2>
    80202ed4:	00a03533          	snez	a0,a0
    80202ed8:	40a00533          	neg	a0,a0
}
    80202edc:	60e2                	ld	ra,24(sp)
    80202ede:	6442                	ld	s0,16(sp)
    80202ee0:	64a2                	ld	s1,8(sp)
    80202ee2:	6902                	ld	s2,0(sp)
    80202ee4:	6105                	addi	sp,sp,32
    80202ee6:	8082                	ret
    return -1;
    80202ee8:	557d                	li	a0,-1
    80202eea:	bfcd                	j	80202edc <fetchaddr+0x3c>
    80202eec:	557d                	li	a0,-1
    80202eee:	b7fd                	j	80202edc <fetchaddr+0x3c>

0000000080202ef0 <fetchstr>:
{
    80202ef0:	1101                	addi	sp,sp,-32
    80202ef2:	ec06                	sd	ra,24(sp)
    80202ef4:	e822                	sd	s0,16(sp)
    80202ef6:	e426                	sd	s1,8(sp)
    80202ef8:	1000                	addi	s0,sp,32
    80202efa:	84ae                	mv	s1,a1
  int err = copyinstr2(buf, addr, max);
    80202efc:	85aa                	mv	a1,a0
    80202efe:	8526                	mv	a0,s1
    80202f00:	ffffe097          	auipc	ra,0xffffe
    80202f04:	660080e7          	jalr	1632(ra) # 80201560 <copyinstr2>
  if(err < 0)
    80202f08:	00054763          	bltz	a0,80202f16 <fetchstr+0x26>
  return strlen(buf);
    80202f0c:	8526                	mv	a0,s1
    80202f0e:	ffffe097          	auipc	ra,0xffffe
    80202f12:	9de080e7          	jalr	-1570(ra) # 802008ec <strlen>
}
    80202f16:	60e2                	ld	ra,24(sp)
    80202f18:	6442                	ld	s0,16(sp)
    80202f1a:	64a2                	ld	s1,8(sp)
    80202f1c:	6105                	addi	sp,sp,32
    80202f1e:	8082                	ret

0000000080202f20 <argint>:
{
    80202f20:	1101                	addi	sp,sp,-32
    80202f22:	ec06                	sd	ra,24(sp)
    80202f24:	e822                	sd	s0,16(sp)
    80202f26:	e426                	sd	s1,8(sp)
    80202f28:	1000                	addi	s0,sp,32
    80202f2a:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80202f2c:	00000097          	auipc	ra,0x0
    80202f30:	ec2080e7          	jalr	-318(ra) # 80202dee <argraw>
    80202f34:	c088                	sw	a0,0(s1)
}
    80202f36:	4501                	li	a0,0
    80202f38:	60e2                	ld	ra,24(sp)
    80202f3a:	6442                	ld	s0,16(sp)
    80202f3c:	64a2                	ld	s1,8(sp)
    80202f3e:	6105                	addi	sp,sp,32
    80202f40:	8082                	ret

0000000080202f42 <sys_test_proc>:
sys_test_proc(void) {
    80202f42:	1101                	addi	sp,sp,-32
    80202f44:	ec06                	sd	ra,24(sp)
    80202f46:	e822                	sd	s0,16(sp)
    80202f48:	1000                	addi	s0,sp,32
    argint(0, &n);
    80202f4a:	fec40593          	addi	a1,s0,-20
    80202f4e:	4501                	li	a0,0
    80202f50:	00000097          	auipc	ra,0x0
    80202f54:	fd0080e7          	jalr	-48(ra) # 80202f20 <argint>
    printf("hello world from proc %d, hart %d, arg %d\n", myproc()->pid, r_tp(), n);
    80202f58:	fffff097          	auipc	ra,0xfffff
    80202f5c:	b00080e7          	jalr	-1280(ra) # 80201a58 <myproc>
    80202f60:	8612                	mv	a2,tp
    80202f62:	fec42683          	lw	a3,-20(s0)
    80202f66:	5d0c                	lw	a1,56(a0)
    80202f68:	00007517          	auipc	a0,0x7
    80202f6c:	a2050513          	addi	a0,a0,-1504 # 80209988 <digits+0x608>
    80202f70:	ffffd097          	auipc	ra,0xffffd
    80202f74:	21c080e7          	jalr	540(ra) # 8020018c <printf>
}
    80202f78:	4501                	li	a0,0
    80202f7a:	60e2                	ld	ra,24(sp)
    80202f7c:	6442                	ld	s0,16(sp)
    80202f7e:	6105                	addi	sp,sp,32
    80202f80:	8082                	ret

0000000080202f82 <argaddr>:
{
    80202f82:	1101                	addi	sp,sp,-32
    80202f84:	ec06                	sd	ra,24(sp)
    80202f86:	e822                	sd	s0,16(sp)
    80202f88:	e426                	sd	s1,8(sp)
    80202f8a:	1000                	addi	s0,sp,32
    80202f8c:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80202f8e:	00000097          	auipc	ra,0x0
    80202f92:	e60080e7          	jalr	-416(ra) # 80202dee <argraw>
    80202f96:	e088                	sd	a0,0(s1)
}
    80202f98:	4501                	li	a0,0
    80202f9a:	60e2                	ld	ra,24(sp)
    80202f9c:	6442                	ld	s0,16(sp)
    80202f9e:	64a2                	ld	s1,8(sp)
    80202fa0:	6105                	addi	sp,sp,32
    80202fa2:	8082                	ret

0000000080202fa4 <argstr>:
{
    80202fa4:	1101                	addi	sp,sp,-32
    80202fa6:	ec06                	sd	ra,24(sp)
    80202fa8:	e822                	sd	s0,16(sp)
    80202faa:	e426                	sd	s1,8(sp)
    80202fac:	e04a                	sd	s2,0(sp)
    80202fae:	1000                	addi	s0,sp,32
    80202fb0:	84ae                	mv	s1,a1
    80202fb2:	8932                	mv	s2,a2
  *ip = argraw(n);
    80202fb4:	00000097          	auipc	ra,0x0
    80202fb8:	e3a080e7          	jalr	-454(ra) # 80202dee <argraw>
  return fetchstr(addr, buf, max);
    80202fbc:	864a                	mv	a2,s2
    80202fbe:	85a6                	mv	a1,s1
    80202fc0:	00000097          	auipc	ra,0x0
    80202fc4:	f30080e7          	jalr	-208(ra) # 80202ef0 <fetchstr>
}
    80202fc8:	60e2                	ld	ra,24(sp)
    80202fca:	6442                	ld	s0,16(sp)
    80202fcc:	64a2                	ld	s1,8(sp)
    80202fce:	6902                	ld	s2,0(sp)
    80202fd0:	6105                	addi	sp,sp,32
    80202fd2:	8082                	ret

0000000080202fd4 <syscall>:
{
    80202fd4:	7179                	addi	sp,sp,-48
    80202fd6:	f406                	sd	ra,40(sp)
    80202fd8:	f022                	sd	s0,32(sp)
    80202fda:	ec26                	sd	s1,24(sp)
    80202fdc:	e84a                	sd	s2,16(sp)
    80202fde:	e44e                	sd	s3,8(sp)
    80202fe0:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80202fe2:	fffff097          	auipc	ra,0xfffff
    80202fe6:	a76080e7          	jalr	-1418(ra) # 80201a58 <myproc>
    80202fea:	84aa                	mv	s1,a0
  num = p->trapframe->a7;
    80202fec:	06053903          	ld	s2,96(a0)
    80202ff0:	0a893783          	ld	a5,168(s2)
    80202ff4:	0007899b          	sext.w	s3,a5
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    80202ff8:	37fd                	addiw	a5,a5,-1
    80202ffa:	20100713          	li	a4,513
    80202ffe:	04f76863          	bltu	a4,a5,8020304e <syscall+0x7a>
    80203002:	00399713          	slli	a4,s3,0x3
    80203006:	00007797          	auipc	a5,0x7
    8020300a:	06278793          	addi	a5,a5,98 # 8020a068 <syscalls>
    8020300e:	97ba                	add	a5,a5,a4
    80203010:	639c                	ld	a5,0(a5)
    80203012:	cf95                	beqz	a5,8020304e <syscall+0x7a>
    p->trapframe->a0 = syscalls[num]();
    80203014:	9782                	jalr	a5
    80203016:	06a93823          	sd	a0,112(s2)
    if ((p->tmask & (1 << num)) != 0) {
    8020301a:	4f04a783          	lw	a5,1264(s1)
    8020301e:	4137d7bb          	sraw	a5,a5,s3
    80203022:	8b85                	andi	a5,a5,1
    80203024:	c7a1                	beqz	a5,8020306c <syscall+0x98>
      printf("pid %d: %s -> %d\n", p->pid, sysnames[num], p->trapframe->a0);
    80203026:	70b8                	ld	a4,96(s1)
    80203028:	098e                	slli	s3,s3,0x3
    8020302a:	00008797          	auipc	a5,0x8
    8020302e:	05678793          	addi	a5,a5,86 # 8020b080 <sysnames>
    80203032:	99be                	add	s3,s3,a5
    80203034:	7b34                	ld	a3,112(a4)
    80203036:	0009b603          	ld	a2,0(s3)
    8020303a:	5c8c                	lw	a1,56(s1)
    8020303c:	00007517          	auipc	a0,0x7
    80203040:	97c50513          	addi	a0,a0,-1668 # 802099b8 <digits+0x638>
    80203044:	ffffd097          	auipc	ra,0xffffd
    80203048:	148080e7          	jalr	328(ra) # 8020018c <printf>
    8020304c:	a005                	j	8020306c <syscall+0x98>
    printf("pid %d %s: unknown sys call %d\n",
    8020304e:	86ce                	mv	a3,s3
    80203050:	4e048613          	addi	a2,s1,1248
    80203054:	5c8c                	lw	a1,56(s1)
    80203056:	00007517          	auipc	a0,0x7
    8020305a:	97a50513          	addi	a0,a0,-1670 # 802099d0 <digits+0x650>
    8020305e:	ffffd097          	auipc	ra,0xffffd
    80203062:	12e080e7          	jalr	302(ra) # 8020018c <printf>
    p->trapframe->a0 = -1;
    80203066:	70bc                	ld	a5,96(s1)
    80203068:	577d                	li	a4,-1
    8020306a:	fbb8                	sd	a4,112(a5)
}
    8020306c:	70a2                	ld	ra,40(sp)
    8020306e:	7402                	ld	s0,32(sp)
    80203070:	64e2                	ld	s1,24(sp)
    80203072:	6942                	ld	s2,16(sp)
    80203074:	69a2                	ld	s3,8(sp)
    80203076:	6145                	addi	sp,sp,48
    80203078:	8082                	ret

000000008020307a <sys_exec>:
#include "include/vm.h"
extern int exec(char *path, char **argv);

uint64
sys_exec(void)
{
    8020307a:	da010113          	addi	sp,sp,-608
    8020307e:	24113c23          	sd	ra,600(sp)
    80203082:	24813823          	sd	s0,592(sp)
    80203086:	24913423          	sd	s1,584(sp)
    8020308a:	25213023          	sd	s2,576(sp)
    8020308e:	23313c23          	sd	s3,568(sp)
    80203092:	23413823          	sd	s4,560(sp)
    80203096:	23513423          	sd	s5,552(sp)
    8020309a:	23613023          	sd	s6,544(sp)
    8020309e:	1480                	addi	s0,sp,608
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    802030a0:	10400613          	li	a2,260
    802030a4:	eb840593          	addi	a1,s0,-328
    802030a8:	4501                	li	a0,0
    802030aa:	00000097          	auipc	ra,0x0
    802030ae:	efa080e7          	jalr	-262(ra) # 80202fa4 <argstr>
    return -1;
    802030b2:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    802030b4:	0c054a63          	bltz	a0,80203188 <sys_exec+0x10e>
    802030b8:	db040593          	addi	a1,s0,-592
    802030bc:	4505                	li	a0,1
    802030be:	00000097          	auipc	ra,0x0
    802030c2:	ec4080e7          	jalr	-316(ra) # 80202f82 <argaddr>
    802030c6:	0c054163          	bltz	a0,80203188 <sys_exec+0x10e>
  }
  memset(argv, 0, sizeof(argv));
    802030ca:	10000613          	li	a2,256
    802030ce:	4581                	li	a1,0
    802030d0:	db840993          	addi	s3,s0,-584
    802030d4:	854e                	mv	a0,s3
    802030d6:	ffffd097          	auipc	ra,0xffffd
    802030da:	68e080e7          	jalr	1678(ra) # 80200764 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    802030de:	84ce                	mv	s1,s3
  memset(argv, 0, sizeof(argv));
    802030e0:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802030e2:	da840a13          	addi	s4,s0,-600
    if(i >= NELEM(argv)){
    802030e6:	02000a93          	li	s5,32
    802030ea:	00090b1b          	sext.w	s6,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802030ee:	00391513          	slli	a0,s2,0x3
    802030f2:	85d2                	mv	a1,s4
    802030f4:	db043783          	ld	a5,-592(s0)
    802030f8:	953e                	add	a0,a0,a5
    802030fa:	00000097          	auipc	ra,0x0
    802030fe:	da6080e7          	jalr	-602(ra) # 80202ea0 <fetchaddr>
    80203102:	02054a63          	bltz	a0,80203136 <sys_exec+0xbc>
      goto bad;
    }
    if(uarg == 0){
    80203106:	da843783          	ld	a5,-600(s0)
    8020310a:	c3b9                	beqz	a5,80203150 <sys_exec+0xd6>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    8020310c:	ffffd097          	auipc	ra,0xffffd
    80203110:	450080e7          	jalr	1104(ra) # 8020055c <kalloc>
    80203114:	85aa                	mv	a1,a0
    80203116:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    8020311a:	cd11                	beqz	a0,80203136 <sys_exec+0xbc>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    8020311c:	6605                	lui	a2,0x1
    8020311e:	da843503          	ld	a0,-600(s0)
    80203122:	00000097          	auipc	ra,0x0
    80203126:	dce080e7          	jalr	-562(ra) # 80202ef0 <fetchstr>
    8020312a:	00054663          	bltz	a0,80203136 <sys_exec+0xbc>
    if(i >= NELEM(argv)){
    8020312e:	0905                	addi	s2,s2,1
    80203130:	09a1                	addi	s3,s3,8
    80203132:	fb591ce3          	bne	s2,s5,802030ea <sys_exec+0x70>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203136:	10048913          	addi	s2,s1,256
    8020313a:	6088                	ld	a0,0(s1)
    8020313c:	c529                	beqz	a0,80203186 <sys_exec+0x10c>
    kfree(argv[i]);
    8020313e:	ffffd097          	auipc	ra,0xffffd
    80203142:	306080e7          	jalr	774(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203146:	04a1                	addi	s1,s1,8
    80203148:	ff2499e3          	bne	s1,s2,8020313a <sys_exec+0xc0>
  return -1;
    8020314c:	597d                	li	s2,-1
    8020314e:	a82d                	j	80203188 <sys_exec+0x10e>
      argv[i] = 0;
    80203150:	0b0e                	slli	s6,s6,0x3
    80203152:	fc040793          	addi	a5,s0,-64
    80203156:	9b3e                	add	s6,s6,a5
    80203158:	de0b3c23          	sd	zero,-520(s6) # df8 <_entry-0x801ff208>
  int ret = exec(path, argv);
    8020315c:	db840593          	addi	a1,s0,-584
    80203160:	eb840513          	addi	a0,s0,-328
    80203164:	00001097          	auipc	ra,0x1
    80203168:	1e8080e7          	jalr	488(ra) # 8020434c <exec>
    8020316c:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020316e:	10048993          	addi	s3,s1,256
    80203172:	6088                	ld	a0,0(s1)
    80203174:	c911                	beqz	a0,80203188 <sys_exec+0x10e>
    kfree(argv[i]);
    80203176:	ffffd097          	auipc	ra,0xffffd
    8020317a:	2ce080e7          	jalr	718(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020317e:	04a1                	addi	s1,s1,8
    80203180:	ff3499e3          	bne	s1,s3,80203172 <sys_exec+0xf8>
    80203184:	a011                	j	80203188 <sys_exec+0x10e>
  return -1;
    80203186:	597d                	li	s2,-1
}
    80203188:	854a                	mv	a0,s2
    8020318a:	25813083          	ld	ra,600(sp)
    8020318e:	25013403          	ld	s0,592(sp)
    80203192:	24813483          	ld	s1,584(sp)
    80203196:	24013903          	ld	s2,576(sp)
    8020319a:	23813983          	ld	s3,568(sp)
    8020319e:	23013a03          	ld	s4,560(sp)
    802031a2:	22813a83          	ld	s5,552(sp)
    802031a6:	22013b03          	ld	s6,544(sp)
    802031aa:	26010113          	addi	sp,sp,608
    802031ae:	8082                	ret

00000000802031b0 <sys_exit>:

uint64
sys_exit(void)
{
    802031b0:	1101                	addi	sp,sp,-32
    802031b2:	ec06                	sd	ra,24(sp)
    802031b4:	e822                	sd	s0,16(sp)
    802031b6:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    802031b8:	fec40593          	addi	a1,s0,-20
    802031bc:	4501                	li	a0,0
    802031be:	00000097          	auipc	ra,0x0
    802031c2:	d62080e7          	jalr	-670(ra) # 80202f20 <argint>
    return -1;
    802031c6:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    802031c8:	00054963          	bltz	a0,802031da <sys_exit+0x2a>
  exit(n);
    802031cc:	fec42503          	lw	a0,-20(s0)
    802031d0:	fffff097          	auipc	ra,0xfffff
    802031d4:	fbc080e7          	jalr	-68(ra) # 8020218c <exit>
  return 0;  // not reached
    802031d8:	4781                	li	a5,0
}
    802031da:	853e                	mv	a0,a5
    802031dc:	60e2                	ld	ra,24(sp)
    802031de:	6442                	ld	s0,16(sp)
    802031e0:	6105                	addi	sp,sp,32
    802031e2:	8082                	ret

00000000802031e4 <sys_getpid>:

uint64
sys_getpid(void)
{
    802031e4:	1141                	addi	sp,sp,-16
    802031e6:	e406                	sd	ra,8(sp)
    802031e8:	e022                	sd	s0,0(sp)
    802031ea:	0800                	addi	s0,sp,16
  return myproc()->pid;
    802031ec:	fffff097          	auipc	ra,0xfffff
    802031f0:	86c080e7          	jalr	-1940(ra) # 80201a58 <myproc>
}
    802031f4:	5d08                	lw	a0,56(a0)
    802031f6:	60a2                	ld	ra,8(sp)
    802031f8:	6402                	ld	s0,0(sp)
    802031fa:	0141                	addi	sp,sp,16
    802031fc:	8082                	ret

00000000802031fe <sys_fork>:

uint64
sys_fork(void)
{
    802031fe:	1141                	addi	sp,sp,-16
    80203200:	e406                	sd	ra,8(sp)
    80203202:	e022                	sd	s0,0(sp)
    80203204:	0800                	addi	s0,sp,16
  return fork();
    80203206:	fffff097          	auipc	ra,0xfffff
    8020320a:	c4c080e7          	jalr	-948(ra) # 80201e52 <fork>
}
    8020320e:	60a2                	ld	ra,8(sp)
    80203210:	6402                	ld	s0,0(sp)
    80203212:	0141                	addi	sp,sp,16
    80203214:	8082                	ret

0000000080203216 <sys_wait>:

uint64
sys_wait(void)
{
    80203216:	1101                	addi	sp,sp,-32
    80203218:	ec06                	sd	ra,24(sp)
    8020321a:	e822                	sd	s0,16(sp)
    8020321c:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    8020321e:	fe840593          	addi	a1,s0,-24
    80203222:	4501                	li	a0,0
    80203224:	00000097          	auipc	ra,0x0
    80203228:	d5e080e7          	jalr	-674(ra) # 80202f82 <argaddr>
    8020322c:	87aa                	mv	a5,a0
    return -1;
    8020322e:	557d                	li	a0,-1
  if(argaddr(0, &p) < 0)
    80203230:	0007c863          	bltz	a5,80203240 <sys_wait+0x2a>
  return wait(p);
    80203234:	fe843503          	ld	a0,-24(s0)
    80203238:	fffff097          	auipc	ra,0xfffff
    8020323c:	112080e7          	jalr	274(ra) # 8020234a <wait>
}
    80203240:	60e2                	ld	ra,24(sp)
    80203242:	6442                	ld	s0,16(sp)
    80203244:	6105                	addi	sp,sp,32
    80203246:	8082                	ret

0000000080203248 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    80203248:	7179                	addi	sp,sp,-48
    8020324a:	f406                	sd	ra,40(sp)
    8020324c:	f022                	sd	s0,32(sp)
    8020324e:	ec26                	sd	s1,24(sp)
    80203250:	1800                	addi	s0,sp,48
  int addr;
  int n;

  if(argint(0, &n) < 0)
    80203252:	fdc40593          	addi	a1,s0,-36
    80203256:	4501                	li	a0,0
    80203258:	00000097          	auipc	ra,0x0
    8020325c:	cc8080e7          	jalr	-824(ra) # 80202f20 <argint>
    80203260:	87aa                	mv	a5,a0
    return -1;
    80203262:	557d                	li	a0,-1
  if(argint(0, &n) < 0)
    80203264:	0207c063          	bltz	a5,80203284 <sys_sbrk+0x3c>
  addr = myproc()->sz;
    80203268:	ffffe097          	auipc	ra,0xffffe
    8020326c:	7f0080e7          	jalr	2032(ra) # 80201a58 <myproc>
    80203270:	4524                	lw	s1,72(a0)
  if(growproc(n) < 0)
    80203272:	fdc42503          	lw	a0,-36(s0)
    80203276:	fffff097          	auipc	ra,0xfffff
    8020327a:	b64080e7          	jalr	-1180(ra) # 80201dda <growproc>
    8020327e:	00054863          	bltz	a0,8020328e <sys_sbrk+0x46>
    return -1;
  return addr;
    80203282:	8526                	mv	a0,s1
}
    80203284:	70a2                	ld	ra,40(sp)
    80203286:	7402                	ld	s0,32(sp)
    80203288:	64e2                	ld	s1,24(sp)
    8020328a:	6145                	addi	sp,sp,48
    8020328c:	8082                	ret
    return -1;
    8020328e:	557d                	li	a0,-1
    80203290:	bfd5                	j	80203284 <sys_sbrk+0x3c>

0000000080203292 <sys_sleep>:

uint64
sys_sleep(void)
{
    80203292:	7139                	addi	sp,sp,-64
    80203294:	fc06                	sd	ra,56(sp)
    80203296:	f822                	sd	s0,48(sp)
    80203298:	f426                	sd	s1,40(sp)
    8020329a:	f04a                	sd	s2,32(sp)
    8020329c:	ec4e                	sd	s3,24(sp)
    8020329e:	0080                	addi	s0,sp,64
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    802032a0:	fcc40593          	addi	a1,s0,-52
    802032a4:	4501                	li	a0,0
    802032a6:	00000097          	auipc	ra,0x0
    802032aa:	c7a080e7          	jalr	-902(ra) # 80202f20 <argint>
    return -1;
    802032ae:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    802032b0:	06054763          	bltz	a0,8020331e <sys_sleep+0x8c>
  acquire(&tickslock);
    802032b4:	00009517          	auipc	a0,0x9
    802032b8:	e2c53503          	ld	a0,-468(a0) # 8020c0e0 <_GLOBAL_OFFSET_TABLE_+0x30>
    802032bc:	ffffd097          	auipc	ra,0xffffd
    802032c0:	40c080e7          	jalr	1036(ra) # 802006c8 <acquire>
  ticks0 = ticks;
    802032c4:	00009797          	auipc	a5,0x9
    802032c8:	e2c7b783          	ld	a5,-468(a5) # 8020c0f0 <_GLOBAL_OFFSET_TABLE_+0x40>
    802032cc:	0007a903          	lw	s2,0(a5)
  while(ticks - ticks0 < n){
    802032d0:	fcc42783          	lw	a5,-52(s0)
    802032d4:	cf85                	beqz	a5,8020330c <sys_sleep+0x7a>
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
    802032d6:	00009997          	auipc	s3,0x9
    802032da:	e0a9b983          	ld	s3,-502(s3) # 8020c0e0 <_GLOBAL_OFFSET_TABLE_+0x30>
    802032de:	00009497          	auipc	s1,0x9
    802032e2:	e124b483          	ld	s1,-494(s1) # 8020c0f0 <_GLOBAL_OFFSET_TABLE_+0x40>
    if(myproc()->killed){
    802032e6:	ffffe097          	auipc	ra,0xffffe
    802032ea:	772080e7          	jalr	1906(ra) # 80201a58 <myproc>
    802032ee:	591c                	lw	a5,48(a0)
    802032f0:	ef9d                	bnez	a5,8020332e <sys_sleep+0x9c>
    sleep(&ticks, &tickslock);
    802032f2:	85ce                	mv	a1,s3
    802032f4:	8526                	mv	a0,s1
    802032f6:	fffff097          	auipc	ra,0xfffff
    802032fa:	fd6080e7          	jalr	-42(ra) # 802022cc <sleep>
  while(ticks - ticks0 < n){
    802032fe:	409c                	lw	a5,0(s1)
    80203300:	412787bb          	subw	a5,a5,s2
    80203304:	fcc42703          	lw	a4,-52(s0)
    80203308:	fce7efe3          	bltu	a5,a4,802032e6 <sys_sleep+0x54>
  }
  release(&tickslock);
    8020330c:	00009517          	auipc	a0,0x9
    80203310:	dd453503          	ld	a0,-556(a0) # 8020c0e0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80203314:	ffffd097          	auipc	ra,0xffffd
    80203318:	408080e7          	jalr	1032(ra) # 8020071c <release>
  return 0;
    8020331c:	4781                	li	a5,0
}
    8020331e:	853e                	mv	a0,a5
    80203320:	70e2                	ld	ra,56(sp)
    80203322:	7442                	ld	s0,48(sp)
    80203324:	74a2                	ld	s1,40(sp)
    80203326:	7902                	ld	s2,32(sp)
    80203328:	69e2                	ld	s3,24(sp)
    8020332a:	6121                	addi	sp,sp,64
    8020332c:	8082                	ret
      release(&tickslock);
    8020332e:	00009517          	auipc	a0,0x9
    80203332:	db253503          	ld	a0,-590(a0) # 8020c0e0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80203336:	ffffd097          	auipc	ra,0xffffd
    8020333a:	3e6080e7          	jalr	998(ra) # 8020071c <release>
      return -1;
    8020333e:	57fd                	li	a5,-1
    80203340:	bff9                	j	8020331e <sys_sleep+0x8c>

0000000080203342 <sys_kill>:

uint64
sys_kill(void)
{
    80203342:	1101                	addi	sp,sp,-32
    80203344:	ec06                	sd	ra,24(sp)
    80203346:	e822                	sd	s0,16(sp)
    80203348:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    8020334a:	fec40593          	addi	a1,s0,-20
    8020334e:	4501                	li	a0,0
    80203350:	00000097          	auipc	ra,0x0
    80203354:	bd0080e7          	jalr	-1072(ra) # 80202f20 <argint>
    80203358:	87aa                	mv	a5,a0
    return -1;
    8020335a:	557d                	li	a0,-1
  if(argint(0, &pid) < 0)
    8020335c:	0007c863          	bltz	a5,8020336c <sys_kill+0x2a>
  return kill(pid);
    80203360:	fec42503          	lw	a0,-20(s0)
    80203364:	fffff097          	auipc	ra,0xfffff
    80203368:	154080e7          	jalr	340(ra) # 802024b8 <kill>
}
    8020336c:	60e2                	ld	ra,24(sp)
    8020336e:	6442                	ld	s0,16(sp)
    80203370:	6105                	addi	sp,sp,32
    80203372:	8082                	ret

0000000080203374 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    80203374:	1101                	addi	sp,sp,-32
    80203376:	ec06                	sd	ra,24(sp)
    80203378:	e822                	sd	s0,16(sp)
    8020337a:	e426                	sd	s1,8(sp)
    8020337c:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    8020337e:	00009517          	auipc	a0,0x9
    80203382:	d6253503          	ld	a0,-670(a0) # 8020c0e0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80203386:	ffffd097          	auipc	ra,0xffffd
    8020338a:	342080e7          	jalr	834(ra) # 802006c8 <acquire>
  xticks = ticks;
    8020338e:	00009797          	auipc	a5,0x9
    80203392:	d627b783          	ld	a5,-670(a5) # 8020c0f0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80203396:	4384                	lw	s1,0(a5)
  release(&tickslock);
    80203398:	00009517          	auipc	a0,0x9
    8020339c:	d4853503          	ld	a0,-696(a0) # 8020c0e0 <_GLOBAL_OFFSET_TABLE_+0x30>
    802033a0:	ffffd097          	auipc	ra,0xffffd
    802033a4:	37c080e7          	jalr	892(ra) # 8020071c <release>
  return xticks;
}
    802033a8:	02049513          	slli	a0,s1,0x20
    802033ac:	9101                	srli	a0,a0,0x20
    802033ae:	60e2                	ld	ra,24(sp)
    802033b0:	6442                	ld	s0,16(sp)
    802033b2:	64a2                	ld	s1,8(sp)
    802033b4:	6105                	addi	sp,sp,32
    802033b6:	8082                	ret

00000000802033b8 <sys_trace>:
    
uint64
sys_trace(void)
{
    802033b8:	1101                	addi	sp,sp,-32
    802033ba:	ec06                	sd	ra,24(sp)
    802033bc:	e822                	sd	s0,16(sp)
    802033be:	1000                	addi	s0,sp,32
  int mask;
  if(argint(0, &mask) < 0) {
    802033c0:	fec40593          	addi	a1,s0,-20
    802033c4:	4501                	li	a0,0
    802033c6:	00000097          	auipc	ra,0x0
    802033ca:	b5a080e7          	jalr	-1190(ra) # 80202f20 <argint>
    return -1;
    802033ce:	57fd                	li	a5,-1
  if(argint(0, &mask) < 0) {
    802033d0:	00054b63          	bltz	a0,802033e6 <sys_trace+0x2e>
  }
  myproc()->tmask = mask;
    802033d4:	ffffe097          	auipc	ra,0xffffe
    802033d8:	684080e7          	jalr	1668(ra) # 80201a58 <myproc>
    802033dc:	fec42783          	lw	a5,-20(s0)
    802033e0:	4ef52823          	sw	a5,1264(a0)
  return 0;
    802033e4:	4781                	li	a5,0
}
    802033e6:	853e                	mv	a0,a5
    802033e8:	60e2                	ld	ra,24(sp)
    802033ea:	6442                	ld	s0,16(sp)
    802033ec:	6105                	addi	sp,sp,32
    802033ee:	8082                	ret

00000000802033f0 <sys_clone>:


// added by lmq for SYS_clone
uint64
sys_clone(void)
{
    802033f0:	7179                	addi	sp,sp,-48
    802033f2:	f406                	sd	ra,40(sp)
    802033f4:	f022                	sd	s0,32(sp)
    802033f6:	1800                	addi	s0,sp,48
  int flags,stack,ptid,tls,ctid;
  if(argint(0, &flags) < 0) {
    802033f8:	fec40593          	addi	a1,s0,-20
    802033fc:	4501                	li	a0,0
    802033fe:	00000097          	auipc	ra,0x0
    80203402:	b22080e7          	jalr	-1246(ra) # 80202f20 <argint>
    return -1;
    80203406:	57fd                	li	a5,-1
  if(argint(0, &flags) < 0) {
    80203408:	06054963          	bltz	a0,8020347a <sys_clone+0x8a>
  }
  if(argint(1, &stack) < 0) {
    8020340c:	fe840593          	addi	a1,s0,-24
    80203410:	4505                	li	a0,1
    80203412:	00000097          	auipc	ra,0x0
    80203416:	b0e080e7          	jalr	-1266(ra) # 80202f20 <argint>
    return -1;
    8020341a:	57fd                	li	a5,-1
  if(argint(1, &stack) < 0) {
    8020341c:	04054f63          	bltz	a0,8020347a <sys_clone+0x8a>
  }
  if(argint(2, &ptid) < 0) {
    80203420:	fe440593          	addi	a1,s0,-28
    80203424:	4509                	li	a0,2
    80203426:	00000097          	auipc	ra,0x0
    8020342a:	afa080e7          	jalr	-1286(ra) # 80202f20 <argint>
    return -1;
    8020342e:	57fd                	li	a5,-1
  if(argint(2, &ptid) < 0) {
    80203430:	04054563          	bltz	a0,8020347a <sys_clone+0x8a>
  }
  if(argint(3, &tls) < 0) {
    80203434:	fe040593          	addi	a1,s0,-32
    80203438:	450d                	li	a0,3
    8020343a:	00000097          	auipc	ra,0x0
    8020343e:	ae6080e7          	jalr	-1306(ra) # 80202f20 <argint>
    return -1;
    80203442:	57fd                	li	a5,-1
  if(argint(3, &tls) < 0) {
    80203444:	02054b63          	bltz	a0,8020347a <sys_clone+0x8a>
  }
  if(argint(4, &ctid) < 0) {
    80203448:	fdc40593          	addi	a1,s0,-36
    8020344c:	4511                	li	a0,4
    8020344e:	00000097          	auipc	ra,0x0
    80203452:	ad2080e7          	jalr	-1326(ra) # 80202f20 <argint>
    return -1;
    80203456:	57fd                	li	a5,-1
  if(argint(4, &ctid) < 0) {
    80203458:	02054163          	bltz	a0,8020347a <sys_clone+0x8a>
  }

  int new_pid=clone(flags,stack,ptid,tls,ctid);
    8020345c:	fdc42703          	lw	a4,-36(s0)
    80203460:	fe042683          	lw	a3,-32(s0)
    80203464:	fe442603          	lw	a2,-28(s0)
    80203468:	fe842583          	lw	a1,-24(s0)
    8020346c:	fec42503          	lw	a0,-20(s0)
    80203470:	fffff097          	auipc	ra,0xfffff
    80203474:	206080e7          	jalr	518(ra) # 80202676 <clone>
  return new_pid;
    80203478:	87aa                	mv	a5,a0
}
    8020347a:	853e                	mv	a0,a5
    8020347c:	70a2                	ld	ra,40(sp)
    8020347e:	7402                	ld	s0,32(sp)
    80203480:	6145                	addi	sp,sp,48
    80203482:	8082                	ret

0000000080203484 <sys_brk>:

// sys_brk lzq
// 将数据段addr 修改为 pos ， 成功则返回0
// Linux brk(0) return 0, but different in this work this will return the now addr
uint64
sys_brk(void){
    80203484:	1101                	addi	sp,sp,-32
    80203486:	ec06                	sd	ra,24(sp)
    80203488:	e822                	sd	s0,16(sp)
    8020348a:	1000                	addi	s0,sp,32
    int addr, pos;
    if(argint(0, &pos) <0 )
    8020348c:	fec40593          	addi	a1,s0,-20
    80203490:	4501                	li	a0,0
    80203492:	00000097          	auipc	ra,0x0
    80203496:	a8e080e7          	jalr	-1394(ra) # 80202f20 <argint>
    8020349a:	04054063          	bltz	a0,802034da <sys_brk+0x56>
        return -1;
    addr = myproc()->sz;
    8020349e:	ffffe097          	auipc	ra,0xffffe
    802034a2:	5ba080e7          	jalr	1466(ra) # 80201a58 <myproc>
    802034a6:	4528                	lw	a0,72(a0)
    if(pos == 0) return addr;//the diff with Linux brk(0)
    802034a8:	fec42783          	lw	a5,-20(s0)
    802034ac:	e789                	bnez	a5,802034b6 <sys_brk+0x32>
    if(growproc(pos - addr) < 0)
        panic("growproc error");
    return 0;
}
    802034ae:	60e2                	ld	ra,24(sp)
    802034b0:	6442                	ld	s0,16(sp)
    802034b2:	6105                	addi	sp,sp,32
    802034b4:	8082                	ret
    if(growproc(pos - addr) < 0)
    802034b6:	40a7853b          	subw	a0,a5,a0
    802034ba:	fffff097          	auipc	ra,0xfffff
    802034be:	920080e7          	jalr	-1760(ra) # 80201dda <growproc>
    802034c2:	87aa                	mv	a5,a0
    return 0;
    802034c4:	4501                	li	a0,0
    if(growproc(pos - addr) < 0)
    802034c6:	fe07d4e3          	bgez	a5,802034ae <sys_brk+0x2a>
        panic("growproc error");
    802034ca:	00006517          	auipc	a0,0x6
    802034ce:	68650513          	addi	a0,a0,1670 # 80209b50 <digits+0x7d0>
    802034d2:	ffffd097          	auipc	ra,0xffffd
    802034d6:	c70080e7          	jalr	-912(ra) # 80200142 <panic>
        return -1;
    802034da:	557d                	li	a0,-1
    802034dc:	bfc9                	j	802034ae <sys_brk+0x2a>

00000000802034de <sys_mmap>:

uint64
sys_mmap(void){
    802034de:	7139                	addi	sp,sp,-64
    802034e0:	fc06                	sd	ra,56(sp)
    802034e2:	f822                	sd	s0,48(sp)
    802034e4:	f426                	sd	s1,40(sp)
    802034e6:	0080                	addi	s0,sp,64
    int prot;// 映射的内存保护方式，可取：PROT_EXEC, PROT_READ, PROT_WRITE, PROT_NONE
    int flags;// 映射是否与其他进程共享的标志，
    int fd;// 文件句柄，
    int off;// 文件偏移量；

    if(argint(0, &addr) < 0 || argint(1, &len) < 0 || argint(2, &prot) < 0 ||
    802034e8:	fdc40593          	addi	a1,s0,-36
    802034ec:	4501                	li	a0,0
    802034ee:	00000097          	auipc	ra,0x0
    802034f2:	a32080e7          	jalr	-1486(ra) # 80202f20 <argint>
       argint(3, &flags) < 0 || argint(4, &fd) < 0 || argint(5, &off) < 0)
        return -1;
    802034f6:	57fd                	li	a5,-1
    if(argint(0, &addr) < 0 || argint(1, &len) < 0 || argint(2, &prot) < 0 ||
    802034f8:	0a054063          	bltz	a0,80203598 <sys_mmap+0xba>
    802034fc:	fd840593          	addi	a1,s0,-40
    80203500:	4505                	li	a0,1
    80203502:	00000097          	auipc	ra,0x0
    80203506:	a1e080e7          	jalr	-1506(ra) # 80202f20 <argint>
        return -1;
    8020350a:	57fd                	li	a5,-1
    if(argint(0, &addr) < 0 || argint(1, &len) < 0 || argint(2, &prot) < 0 ||
    8020350c:	08054663          	bltz	a0,80203598 <sys_mmap+0xba>
    80203510:	fd440593          	addi	a1,s0,-44
    80203514:	4509                	li	a0,2
    80203516:	00000097          	auipc	ra,0x0
    8020351a:	a0a080e7          	jalr	-1526(ra) # 80202f20 <argint>
        return -1;
    8020351e:	57fd                	li	a5,-1
    if(argint(0, &addr) < 0 || argint(1, &len) < 0 || argint(2, &prot) < 0 ||
    80203520:	06054c63          	bltz	a0,80203598 <sys_mmap+0xba>
       argint(3, &flags) < 0 || argint(4, &fd) < 0 || argint(5, &off) < 0)
    80203524:	fd040593          	addi	a1,s0,-48
    80203528:	450d                	li	a0,3
    8020352a:	00000097          	auipc	ra,0x0
    8020352e:	9f6080e7          	jalr	-1546(ra) # 80202f20 <argint>
        return -1;
    80203532:	57fd                	li	a5,-1
    if(argint(0, &addr) < 0 || argint(1, &len) < 0 || argint(2, &prot) < 0 ||
    80203534:	06054263          	bltz	a0,80203598 <sys_mmap+0xba>
       argint(3, &flags) < 0 || argint(4, &fd) < 0 || argint(5, &off) < 0)
    80203538:	fcc40593          	addi	a1,s0,-52
    8020353c:	4511                	li	a0,4
    8020353e:	00000097          	auipc	ra,0x0
    80203542:	9e2080e7          	jalr	-1566(ra) # 80202f20 <argint>
        return -1;
    80203546:	57fd                	li	a5,-1
       argint(3, &flags) < 0 || argint(4, &fd) < 0 || argint(5, &off) < 0)
    80203548:	04054863          	bltz	a0,80203598 <sys_mmap+0xba>
    8020354c:	fc840593          	addi	a1,s0,-56
    80203550:	4515                	li	a0,5
    80203552:	00000097          	auipc	ra,0x0
    80203556:	9ce080e7          	jalr	-1586(ra) # 80202f20 <argint>
        return -1;
    8020355a:	57fd                	li	a5,-1
       argint(3, &flags) < 0 || argint(4, &fd) < 0 || argint(5, &off) < 0)
    8020355c:	02054e63          	bltz	a0,80203598 <sys_mmap+0xba>

    char *mem = kalloc();
    80203560:	ffffd097          	auipc	ra,0xffffd
    80203564:	ffc080e7          	jalr	-4(ra) # 8020055c <kalloc>
    80203568:	84aa                	mv	s1,a0
    memset(mem, 0, PGSIZE);
    8020356a:	6605                	lui	a2,0x1
    8020356c:	4581                	li	a1,0
    8020356e:	ffffd097          	auipc	ra,0xffffd
    80203572:	1f6080e7          	jalr	502(ra) # 80200764 <memset>
    if (mappages(myproc()->pagetable, len, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0) {
    80203576:	ffffe097          	auipc	ra,0xffffe
    8020357a:	4e2080e7          	jalr	1250(ra) # 80201a58 <myproc>
    8020357e:	4779                	li	a4,30
    80203580:	86a6                	mv	a3,s1
    80203582:	6605                	lui	a2,0x1
    80203584:	fd842583          	lw	a1,-40(s0)
    80203588:	6928                	ld	a0,80(a0)
    8020358a:	ffffd097          	auipc	ra,0xffffd
    8020358e:	6ec080e7          	jalr	1772(ra) # 80200c76 <mappages>
    80203592:	e909                	bnez	a0,802035a4 <sys_mmap+0xc6>
        kfree(mem);
        return 0;
    }
    return addr;
    80203594:	fdc42783          	lw	a5,-36(s0)
}
    80203598:	853e                	mv	a0,a5
    8020359a:	70e2                	ld	ra,56(sp)
    8020359c:	7442                	ld	s0,48(sp)
    8020359e:	74a2                	ld	s1,40(sp)
    802035a0:	6121                	addi	sp,sp,64
    802035a2:	8082                	ret
        kfree(mem);
    802035a4:	8526                	mv	a0,s1
    802035a6:	ffffd097          	auipc	ra,0xffffd
    802035aa:	e9e080e7          	jalr	-354(ra) # 80200444 <kfree>
        return 0;
    802035ae:	4781                	li	a5,0
    802035b0:	b7e5                	j	80203598 <sys_mmap+0xba>

00000000802035b2 <sys_wait4>:
//}

// added by lmq for SYS_wait4
uint64
sys_wait4(void)
{
    802035b2:	1101                	addi	sp,sp,-32
    802035b4:	ec06                	sd	ra,24(sp)
    802035b6:	e822                	sd	s0,16(sp)
    802035b8:	1000                	addi	s0,sp,32
  int cpid;             // child pid which current pid is waiting for
  uint64 addr;          // addr of wstatus
  argint(0,&cpid);
    802035ba:	fec40593          	addi	a1,s0,-20
    802035be:	4501                	li	a0,0
    802035c0:	00000097          	auipc	ra,0x0
    802035c4:	960080e7          	jalr	-1696(ra) # 80202f20 <argint>
  argaddr(1, &addr);
    802035c8:	fe040593          	addi	a1,s0,-32
    802035cc:	4505                	li	a0,1
    802035ce:	00000097          	auipc	ra,0x0
    802035d2:	9b4080e7          	jalr	-1612(ra) # 80202f82 <argaddr>
  return waitpid(cpid,addr,0);
    802035d6:	4601                	li	a2,0
    802035d8:	fe043583          	ld	a1,-32(s0)
    802035dc:	fec42503          	lw	a0,-20(s0)
    802035e0:	fffff097          	auipc	ra,0xfffff
    802035e4:	0ae080e7          	jalr	174(ra) # 8020268e <waitpid>
}
    802035e8:	60e2                	ld	ra,24(sp)
    802035ea:	6442                	ld	s0,16(sp)
    802035ec:	6105                	addi	sp,sp,32
    802035ee:	8082                	ret

00000000802035f0 <sys_sched_yield>:

// added by lmq for SYS_sched_yield
uint64
sys_sched_yield(void)
{
    802035f0:	1141                	addi	sp,sp,-16
    802035f2:	e406                	sd	ra,8(sp)
    802035f4:	e022                	sd	s0,0(sp)
    802035f6:	0800                	addi	s0,sp,16
  yield();
    802035f8:	fffff097          	auipc	ra,0xfffff
    802035fc:	c98080e7          	jalr	-872(ra) # 80202290 <yield>
  return 0;
}
    80203600:	4501                	li	a0,0
    80203602:	60a2                	ld	ra,8(sp)
    80203604:	6402                	ld	s0,0(sp)
    80203606:	0141                	addi	sp,sp,16
    80203608:	8082                	ret

000000008020360a <sys_getppid>:

// added by lmq for SYS_getppid
uint64 
sys_getppid(void)
{
    8020360a:	1141                	addi	sp,sp,-16
    8020360c:	e406                	sd	ra,8(sp)
    8020360e:	e022                	sd	s0,0(sp)
    80203610:	0800                	addi	s0,sp,16
  return myproc()->parent->pid;
    80203612:	ffffe097          	auipc	ra,0xffffe
    80203616:	446080e7          	jalr	1094(ra) # 80201a58 <myproc>
    8020361a:	711c                	ld	a5,32(a0)
}
    8020361c:	5f88                	lw	a0,56(a5)
    8020361e:	60a2                	ld	ra,8(sp)
    80203620:	6402                	ld	s0,0(sp)
    80203622:	0141                	addi	sp,sp,16
    80203624:	8082                	ret

0000000080203626 <sys_execve>:

// added by lmq for SYS_execve
uint64
sys_execve(void)
{
    80203626:	da010113          	addi	sp,sp,-608
    8020362a:	24113c23          	sd	ra,600(sp)
    8020362e:	24813823          	sd	s0,592(sp)
    80203632:	24913423          	sd	s1,584(sp)
    80203636:	25213023          	sd	s2,576(sp)
    8020363a:	23313c23          	sd	s3,568(sp)
    8020363e:	23413823          	sd	s4,560(sp)
    80203642:	23513423          	sd	s5,552(sp)
    80203646:	23613023          	sd	s6,544(sp)
    8020364a:	1480                	addi	s0,sp,608
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    8020364c:	10400613          	li	a2,260
    80203650:	eb840593          	addi	a1,s0,-328
    80203654:	4501                	li	a0,0
    80203656:	00000097          	auipc	ra,0x0
    8020365a:	94e080e7          	jalr	-1714(ra) # 80202fa4 <argstr>
    return -1;
    8020365e:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    80203660:	0c054a63          	bltz	a0,80203734 <sys_execve+0x10e>
    80203664:	db040593          	addi	a1,s0,-592
    80203668:	4505                	li	a0,1
    8020366a:	00000097          	auipc	ra,0x0
    8020366e:	918080e7          	jalr	-1768(ra) # 80202f82 <argaddr>
    80203672:	0c054163          	bltz	a0,80203734 <sys_execve+0x10e>
  }
  memset(argv, 0, sizeof(argv));
    80203676:	10000613          	li	a2,256
    8020367a:	4581                	li	a1,0
    8020367c:	db840993          	addi	s3,s0,-584
    80203680:	854e                	mv	a0,s3
    80203682:	ffffd097          	auipc	ra,0xffffd
    80203686:	0e2080e7          	jalr	226(ra) # 80200764 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    8020368a:	84ce                	mv	s1,s3
  memset(argv, 0, sizeof(argv));
    8020368c:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    8020368e:	da840a13          	addi	s4,s0,-600
    if(i >= NELEM(argv)){
    80203692:	02000a93          	li	s5,32
    80203696:	00090b1b          	sext.w	s6,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    8020369a:	00391513          	slli	a0,s2,0x3
    8020369e:	85d2                	mv	a1,s4
    802036a0:	db043783          	ld	a5,-592(s0)
    802036a4:	953e                	add	a0,a0,a5
    802036a6:	fffff097          	auipc	ra,0xfffff
    802036aa:	7fa080e7          	jalr	2042(ra) # 80202ea0 <fetchaddr>
    802036ae:	02054a63          	bltz	a0,802036e2 <sys_execve+0xbc>
      goto bad;
    }
    if(uarg == 0){
    802036b2:	da843783          	ld	a5,-600(s0)
    802036b6:	c3b9                	beqz	a5,802036fc <sys_execve+0xd6>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    802036b8:	ffffd097          	auipc	ra,0xffffd
    802036bc:	ea4080e7          	jalr	-348(ra) # 8020055c <kalloc>
    802036c0:	85aa                	mv	a1,a0
    802036c2:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    802036c6:	cd11                	beqz	a0,802036e2 <sys_execve+0xbc>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    802036c8:	6605                	lui	a2,0x1
    802036ca:	da843503          	ld	a0,-600(s0)
    802036ce:	00000097          	auipc	ra,0x0
    802036d2:	822080e7          	jalr	-2014(ra) # 80202ef0 <fetchstr>
    802036d6:	00054663          	bltz	a0,802036e2 <sys_execve+0xbc>
    if(i >= NELEM(argv)){
    802036da:	0905                	addi	s2,s2,1
    802036dc:	09a1                	addi	s3,s3,8
    802036de:	fb591ce3          	bne	s2,s5,80203696 <sys_execve+0x70>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802036e2:	10048913          	addi	s2,s1,256
    802036e6:	6088                	ld	a0,0(s1)
    802036e8:	c529                	beqz	a0,80203732 <sys_execve+0x10c>
    kfree(argv[i]);
    802036ea:	ffffd097          	auipc	ra,0xffffd
    802036ee:	d5a080e7          	jalr	-678(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802036f2:	04a1                	addi	s1,s1,8
    802036f4:	ff2499e3          	bne	s1,s2,802036e6 <sys_execve+0xc0>
  return -1;
    802036f8:	597d                	li	s2,-1
    802036fa:	a82d                	j	80203734 <sys_execve+0x10e>
      argv[i] = 0;
    802036fc:	0b0e                	slli	s6,s6,0x3
    802036fe:	fc040793          	addi	a5,s0,-64
    80203702:	9b3e                	add	s6,s6,a5
    80203704:	de0b3c23          	sd	zero,-520(s6)
  int ret = exec(path, argv);
    80203708:	db840593          	addi	a1,s0,-584
    8020370c:	eb840513          	addi	a0,s0,-328
    80203710:	00001097          	auipc	ra,0x1
    80203714:	c3c080e7          	jalr	-964(ra) # 8020434c <exec>
    80203718:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020371a:	10048993          	addi	s3,s1,256
    8020371e:	6088                	ld	a0,0(s1)
    80203720:	c911                	beqz	a0,80203734 <sys_execve+0x10e>
    kfree(argv[i]);
    80203722:	ffffd097          	auipc	ra,0xffffd
    80203726:	d22080e7          	jalr	-734(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020372a:	04a1                	addi	s1,s1,8
    8020372c:	ff3499e3          	bne	s1,s3,8020371e <sys_execve+0xf8>
    80203730:	a011                	j	80203734 <sys_execve+0x10e>
  return -1;
    80203732:	597d                	li	s2,-1

}
    80203734:	854a                	mv	a0,s2
    80203736:	25813083          	ld	ra,600(sp)
    8020373a:	25013403          	ld	s0,592(sp)
    8020373e:	24813483          	ld	s1,584(sp)
    80203742:	24013903          	ld	s2,576(sp)
    80203746:	23813983          	ld	s3,568(sp)
    8020374a:	23013a03          	ld	s4,560(sp)
    8020374e:	22813a83          	ld	s5,552(sp)
    80203752:	22013b03          	ld	s6,544(sp)
    80203756:	26010113          	addi	sp,sp,608
    8020375a:	8082                	ret

000000008020375c <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    8020375c:	7139                	addi	sp,sp,-64
    8020375e:	fc06                	sd	ra,56(sp)
    80203760:	f822                	sd	s0,48(sp)
    80203762:	f426                	sd	s1,40(sp)
    80203764:	f04a                	sd	s2,32(sp)
    80203766:	ec4e                	sd	s3,24(sp)
    80203768:	e852                	sd	s4,16(sp)
    8020376a:	e456                	sd	s5,8(sp)
    8020376c:	0080                	addi	s0,sp,64
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    8020376e:	00006597          	auipc	a1,0x6
    80203772:	3f258593          	addi	a1,a1,1010 # 80209b60 <digits+0x7e0>
    80203776:	00021517          	auipc	a0,0x21
    8020377a:	27a50513          	addi	a0,a0,634 # 802249f0 <bcache>
    8020377e:	ffffd097          	auipc	ra,0xffffd
    80203782:	f06080e7          	jalr	-250(ra) # 80200684 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    80203786:	00025797          	auipc	a5,0x25
    8020378a:	26a78793          	addi	a5,a5,618 # 802289f0 <bcache+0x4000>
    8020378e:	00026717          	auipc	a4,0x26
    80203792:	8ca70713          	addi	a4,a4,-1846 # 80229058 <bcache+0x4668>
    80203796:	6ae7b823          	sd	a4,1712(a5)
  bcache.head.next = &bcache.head;
    8020379a:	6ae7bc23          	sd	a4,1720(a5)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    8020379e:	00021497          	auipc	s1,0x21
    802037a2:	26a48493          	addi	s1,s1,618 # 80224a08 <bcache+0x18>
    b->refcnt = 0;
    b->sectorno = ~0;
    802037a6:	5a7d                	li	s4,-1
    b->dev = ~0;
    b->next = bcache.head.next;
    802037a8:	893e                	mv	s2,a5
    b->prev = &bcache.head;
    802037aa:	89ba                	mv	s3,a4
    initsleeplock(&b->lock, "buffer");
    802037ac:	00006a97          	auipc	s5,0x6
    802037b0:	3bca8a93          	addi	s5,s5,956 # 80209b68 <digits+0x7e8>
    b->refcnt = 0;
    802037b4:	0404a023          	sw	zero,64(s1)
    b->sectorno = ~0;
    802037b8:	0144a623          	sw	s4,12(s1)
    b->dev = ~0;
    802037bc:	0144a423          	sw	s4,8(s1)
    b->next = bcache.head.next;
    802037c0:	6b893783          	ld	a5,1720(s2)
    802037c4:	e8bc                	sd	a5,80(s1)
    b->prev = &bcache.head;
    802037c6:	0534b423          	sd	s3,72(s1)
    initsleeplock(&b->lock, "buffer");
    802037ca:	85d6                	mv	a1,s5
    802037cc:	01048513          	addi	a0,s1,16
    802037d0:	00000097          	auipc	ra,0x0
    802037d4:	26e080e7          	jalr	622(ra) # 80203a3e <initsleeplock>
    bcache.head.next->prev = b;
    802037d8:	6b893783          	ld	a5,1720(s2)
    802037dc:	e7a4                	sd	s1,72(a5)
    bcache.head.next = b;
    802037de:	6a993c23          	sd	s1,1720(s2)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    802037e2:	25848493          	addi	s1,s1,600
    802037e6:	fd3497e3          	bne	s1,s3,802037b4 <binit+0x58>
  }
  #ifdef DEBUG
  printf("binit\n");
  #endif
}
    802037ea:	70e2                	ld	ra,56(sp)
    802037ec:	7442                	ld	s0,48(sp)
    802037ee:	74a2                	ld	s1,40(sp)
    802037f0:	7902                	ld	s2,32(sp)
    802037f2:	69e2                	ld	s3,24(sp)
    802037f4:	6a42                	ld	s4,16(sp)
    802037f6:	6aa2                	ld	s5,8(sp)
    802037f8:	6121                	addi	sp,sp,64
    802037fa:	8082                	ret

00000000802037fc <bread>:
  panic("bget: no buffers");
}

// Return a locked buf with the contents of the indicated block.
struct buf* 
bread(uint dev, uint sectorno) {
    802037fc:	7179                	addi	sp,sp,-48
    802037fe:	f406                	sd	ra,40(sp)
    80203800:	f022                	sd	s0,32(sp)
    80203802:	ec26                	sd	s1,24(sp)
    80203804:	e84a                	sd	s2,16(sp)
    80203806:	e44e                	sd	s3,8(sp)
    80203808:	1800                	addi	s0,sp,48
    8020380a:	89aa                	mv	s3,a0
    8020380c:	892e                	mv	s2,a1
  acquire(&bcache.lock);
    8020380e:	00021517          	auipc	a0,0x21
    80203812:	1e250513          	addi	a0,a0,482 # 802249f0 <bcache>
    80203816:	ffffd097          	auipc	ra,0xffffd
    8020381a:	eb2080e7          	jalr	-334(ra) # 802006c8 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    8020381e:	00026497          	auipc	s1,0x26
    80203822:	88a4b483          	ld	s1,-1910(s1) # 802290a8 <bcache+0x46b8>
    80203826:	00026797          	auipc	a5,0x26
    8020382a:	83278793          	addi	a5,a5,-1998 # 80229058 <bcache+0x4668>
    8020382e:	02f48f63          	beq	s1,a5,8020386c <bread+0x70>
    80203832:	873e                	mv	a4,a5
    80203834:	a021                	j	8020383c <bread+0x40>
    80203836:	68a4                	ld	s1,80(s1)
    80203838:	02e48a63          	beq	s1,a4,8020386c <bread+0x70>
    if(b->dev == dev && b->sectorno == sectorno){
    8020383c:	449c                	lw	a5,8(s1)
    8020383e:	ff379ce3          	bne	a5,s3,80203836 <bread+0x3a>
    80203842:	44dc                	lw	a5,12(s1)
    80203844:	ff2799e3          	bne	a5,s2,80203836 <bread+0x3a>
      b->refcnt++;
    80203848:	40bc                	lw	a5,64(s1)
    8020384a:	2785                	addiw	a5,a5,1
    8020384c:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    8020384e:	00021517          	auipc	a0,0x21
    80203852:	1a250513          	addi	a0,a0,418 # 802249f0 <bcache>
    80203856:	ffffd097          	auipc	ra,0xffffd
    8020385a:	ec6080e7          	jalr	-314(ra) # 8020071c <release>
      acquiresleep(&b->lock);
    8020385e:	01048513          	addi	a0,s1,16
    80203862:	00000097          	auipc	ra,0x0
    80203866:	216080e7          	jalr	534(ra) # 80203a78 <acquiresleep>
      return b;
    8020386a:	a8b9                	j	802038c8 <bread+0xcc>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    8020386c:	00026497          	auipc	s1,0x26
    80203870:	8344b483          	ld	s1,-1996(s1) # 802290a0 <bcache+0x46b0>
    80203874:	00025797          	auipc	a5,0x25
    80203878:	7e478793          	addi	a5,a5,2020 # 80229058 <bcache+0x4668>
    8020387c:	00f48863          	beq	s1,a5,8020388c <bread+0x90>
    80203880:	873e                	mv	a4,a5
    if(b->refcnt == 0) {
    80203882:	40bc                	lw	a5,64(s1)
    80203884:	cf81                	beqz	a5,8020389c <bread+0xa0>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80203886:	64a4                	ld	s1,72(s1)
    80203888:	fee49de3          	bne	s1,a4,80203882 <bread+0x86>
  panic("bget: no buffers");
    8020388c:	00006517          	auipc	a0,0x6
    80203890:	2e450513          	addi	a0,a0,740 # 80209b70 <digits+0x7f0>
    80203894:	ffffd097          	auipc	ra,0xffffd
    80203898:	8ae080e7          	jalr	-1874(ra) # 80200142 <panic>
      b->dev = dev;
    8020389c:	0134a423          	sw	s3,8(s1)
      b->sectorno = sectorno;
    802038a0:	0124a623          	sw	s2,12(s1)
      b->valid = 0;
    802038a4:	0004a023          	sw	zero,0(s1)
      b->refcnt = 1;
    802038a8:	4785                	li	a5,1
    802038aa:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    802038ac:	00021517          	auipc	a0,0x21
    802038b0:	14450513          	addi	a0,a0,324 # 802249f0 <bcache>
    802038b4:	ffffd097          	auipc	ra,0xffffd
    802038b8:	e68080e7          	jalr	-408(ra) # 8020071c <release>
      acquiresleep(&b->lock);
    802038bc:	01048513          	addi	a0,s1,16
    802038c0:	00000097          	auipc	ra,0x0
    802038c4:	1b8080e7          	jalr	440(ra) # 80203a78 <acquiresleep>
  struct buf *b;

  b = bget(dev, sectorno);
  if (!b->valid) {
    802038c8:	409c                	lw	a5,0(s1)
    802038ca:	cb89                	beqz	a5,802038dc <bread+0xe0>
    disk_read(b);
    b->valid = 1;
  }

  return b;
}
    802038cc:	8526                	mv	a0,s1
    802038ce:	70a2                	ld	ra,40(sp)
    802038d0:	7402                	ld	s0,32(sp)
    802038d2:	64e2                	ld	s1,24(sp)
    802038d4:	6942                	ld	s2,16(sp)
    802038d6:	69a2                	ld	s3,8(sp)
    802038d8:	6145                	addi	sp,sp,48
    802038da:	8082                	ret
    disk_read(b);
    802038dc:	8526                	mv	a0,s1
    802038de:	00002097          	auipc	ra,0x2
    802038e2:	374080e7          	jalr	884(ra) # 80205c52 <disk_read>
    b->valid = 1;
    802038e6:	4785                	li	a5,1
    802038e8:	c09c                	sw	a5,0(s1)
  return b;
    802038ea:	b7cd                	j	802038cc <bread+0xd0>

00000000802038ec <bwrite>:

// Write b's contents to disk.  Must be locked.
void 
bwrite(struct buf *b) {
    802038ec:	1101                	addi	sp,sp,-32
    802038ee:	ec06                	sd	ra,24(sp)
    802038f0:	e822                	sd	s0,16(sp)
    802038f2:	e426                	sd	s1,8(sp)
    802038f4:	1000                	addi	s0,sp,32
    802038f6:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    802038f8:	0541                	addi	a0,a0,16
    802038fa:	00000097          	auipc	ra,0x0
    802038fe:	218080e7          	jalr	536(ra) # 80203b12 <holdingsleep>
    80203902:	c919                	beqz	a0,80203918 <bwrite+0x2c>
    panic("bwrite");
  disk_write(b);
    80203904:	8526                	mv	a0,s1
    80203906:	00002097          	auipc	ra,0x2
    8020390a:	366080e7          	jalr	870(ra) # 80205c6c <disk_write>
}
    8020390e:	60e2                	ld	ra,24(sp)
    80203910:	6442                	ld	s0,16(sp)
    80203912:	64a2                	ld	s1,8(sp)
    80203914:	6105                	addi	sp,sp,32
    80203916:	8082                	ret
    panic("bwrite");
    80203918:	00006517          	auipc	a0,0x6
    8020391c:	27050513          	addi	a0,a0,624 # 80209b88 <digits+0x808>
    80203920:	ffffd097          	auipc	ra,0xffffd
    80203924:	822080e7          	jalr	-2014(ra) # 80200142 <panic>

0000000080203928 <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80203928:	1101                	addi	sp,sp,-32
    8020392a:	ec06                	sd	ra,24(sp)
    8020392c:	e822                	sd	s0,16(sp)
    8020392e:	e426                	sd	s1,8(sp)
    80203930:	e04a                	sd	s2,0(sp)
    80203932:	1000                	addi	s0,sp,32
    80203934:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203936:	01050913          	addi	s2,a0,16
    8020393a:	854a                	mv	a0,s2
    8020393c:	00000097          	auipc	ra,0x0
    80203940:	1d6080e7          	jalr	470(ra) # 80203b12 <holdingsleep>
    80203944:	c92d                	beqz	a0,802039b6 <brelse+0x8e>
    panic("brelse");

  releasesleep(&b->lock);
    80203946:	854a                	mv	a0,s2
    80203948:	00000097          	auipc	ra,0x0
    8020394c:	186080e7          	jalr	390(ra) # 80203ace <releasesleep>

  acquire(&bcache.lock);
    80203950:	00021517          	auipc	a0,0x21
    80203954:	0a050513          	addi	a0,a0,160 # 802249f0 <bcache>
    80203958:	ffffd097          	auipc	ra,0xffffd
    8020395c:	d70080e7          	jalr	-656(ra) # 802006c8 <acquire>
  b->refcnt--;
    80203960:	40bc                	lw	a5,64(s1)
    80203962:	37fd                	addiw	a5,a5,-1
    80203964:	0007871b          	sext.w	a4,a5
    80203968:	c0bc                	sw	a5,64(s1)
  if (b->refcnt == 0) {
    8020396a:	eb05                	bnez	a4,8020399a <brelse+0x72>
    // no one is waiting for it.
    b->next->prev = b->prev;
    8020396c:	68bc                	ld	a5,80(s1)
    8020396e:	64b8                	ld	a4,72(s1)
    80203970:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80203972:	64bc                	ld	a5,72(s1)
    80203974:	68b8                	ld	a4,80(s1)
    80203976:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80203978:	00025797          	auipc	a5,0x25
    8020397c:	07878793          	addi	a5,a5,120 # 802289f0 <bcache+0x4000>
    80203980:	6b87b703          	ld	a4,1720(a5)
    80203984:	e8b8                	sd	a4,80(s1)
    b->prev = &bcache.head;
    80203986:	00025717          	auipc	a4,0x25
    8020398a:	6d270713          	addi	a4,a4,1746 # 80229058 <bcache+0x4668>
    8020398e:	e4b8                	sd	a4,72(s1)
    bcache.head.next->prev = b;
    80203990:	6b87b703          	ld	a4,1720(a5)
    80203994:	e724                	sd	s1,72(a4)
    bcache.head.next = b;
    80203996:	6a97bc23          	sd	s1,1720(a5)
  }
  
  release(&bcache.lock);
    8020399a:	00021517          	auipc	a0,0x21
    8020399e:	05650513          	addi	a0,a0,86 # 802249f0 <bcache>
    802039a2:	ffffd097          	auipc	ra,0xffffd
    802039a6:	d7a080e7          	jalr	-646(ra) # 8020071c <release>
}
    802039aa:	60e2                	ld	ra,24(sp)
    802039ac:	6442                	ld	s0,16(sp)
    802039ae:	64a2                	ld	s1,8(sp)
    802039b0:	6902                	ld	s2,0(sp)
    802039b2:	6105                	addi	sp,sp,32
    802039b4:	8082                	ret
    panic("brelse");
    802039b6:	00006517          	auipc	a0,0x6
    802039ba:	1da50513          	addi	a0,a0,474 # 80209b90 <digits+0x810>
    802039be:	ffffc097          	auipc	ra,0xffffc
    802039c2:	784080e7          	jalr	1924(ra) # 80200142 <panic>

00000000802039c6 <bpin>:

void
bpin(struct buf *b) {
    802039c6:	1101                	addi	sp,sp,-32
    802039c8:	ec06                	sd	ra,24(sp)
    802039ca:	e822                	sd	s0,16(sp)
    802039cc:	e426                	sd	s1,8(sp)
    802039ce:	1000                	addi	s0,sp,32
    802039d0:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    802039d2:	00021517          	auipc	a0,0x21
    802039d6:	01e50513          	addi	a0,a0,30 # 802249f0 <bcache>
    802039da:	ffffd097          	auipc	ra,0xffffd
    802039de:	cee080e7          	jalr	-786(ra) # 802006c8 <acquire>
  b->refcnt++;
    802039e2:	40bc                	lw	a5,64(s1)
    802039e4:	2785                	addiw	a5,a5,1
    802039e6:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    802039e8:	00021517          	auipc	a0,0x21
    802039ec:	00850513          	addi	a0,a0,8 # 802249f0 <bcache>
    802039f0:	ffffd097          	auipc	ra,0xffffd
    802039f4:	d2c080e7          	jalr	-724(ra) # 8020071c <release>
}
    802039f8:	60e2                	ld	ra,24(sp)
    802039fa:	6442                	ld	s0,16(sp)
    802039fc:	64a2                	ld	s1,8(sp)
    802039fe:	6105                	addi	sp,sp,32
    80203a00:	8082                	ret

0000000080203a02 <bunpin>:

void
bunpin(struct buf *b) {
    80203a02:	1101                	addi	sp,sp,-32
    80203a04:	ec06                	sd	ra,24(sp)
    80203a06:	e822                	sd	s0,16(sp)
    80203a08:	e426                	sd	s1,8(sp)
    80203a0a:	1000                	addi	s0,sp,32
    80203a0c:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80203a0e:	00021517          	auipc	a0,0x21
    80203a12:	fe250513          	addi	a0,a0,-30 # 802249f0 <bcache>
    80203a16:	ffffd097          	auipc	ra,0xffffd
    80203a1a:	cb2080e7          	jalr	-846(ra) # 802006c8 <acquire>
  b->refcnt--;
    80203a1e:	40bc                	lw	a5,64(s1)
    80203a20:	37fd                	addiw	a5,a5,-1
    80203a22:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203a24:	00021517          	auipc	a0,0x21
    80203a28:	fcc50513          	addi	a0,a0,-52 # 802249f0 <bcache>
    80203a2c:	ffffd097          	auipc	ra,0xffffd
    80203a30:	cf0080e7          	jalr	-784(ra) # 8020071c <release>
}
    80203a34:	60e2                	ld	ra,24(sp)
    80203a36:	6442                	ld	s0,16(sp)
    80203a38:	64a2                	ld	s1,8(sp)
    80203a3a:	6105                	addi	sp,sp,32
    80203a3c:	8082                	ret

0000000080203a3e <initsleeplock>:
#include "include/proc.h"
#include "include/sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80203a3e:	1101                	addi	sp,sp,-32
    80203a40:	ec06                	sd	ra,24(sp)
    80203a42:	e822                	sd	s0,16(sp)
    80203a44:	e426                	sd	s1,8(sp)
    80203a46:	e04a                	sd	s2,0(sp)
    80203a48:	1000                	addi	s0,sp,32
    80203a4a:	84aa                	mv	s1,a0
    80203a4c:	892e                	mv	s2,a1
  initlock(&lk->lk, "sleep lock");
    80203a4e:	00006597          	auipc	a1,0x6
    80203a52:	14a58593          	addi	a1,a1,330 # 80209b98 <digits+0x818>
    80203a56:	0521                	addi	a0,a0,8
    80203a58:	ffffd097          	auipc	ra,0xffffd
    80203a5c:	c2c080e7          	jalr	-980(ra) # 80200684 <initlock>
  lk->name = name;
    80203a60:	0324b023          	sd	s2,32(s1)
  lk->locked = 0;
    80203a64:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203a68:	0204a423          	sw	zero,40(s1)
}
    80203a6c:	60e2                	ld	ra,24(sp)
    80203a6e:	6442                	ld	s0,16(sp)
    80203a70:	64a2                	ld	s1,8(sp)
    80203a72:	6902                	ld	s2,0(sp)
    80203a74:	6105                	addi	sp,sp,32
    80203a76:	8082                	ret

0000000080203a78 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80203a78:	1101                	addi	sp,sp,-32
    80203a7a:	ec06                	sd	ra,24(sp)
    80203a7c:	e822                	sd	s0,16(sp)
    80203a7e:	e426                	sd	s1,8(sp)
    80203a80:	e04a                	sd	s2,0(sp)
    80203a82:	1000                	addi	s0,sp,32
    80203a84:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203a86:	00850913          	addi	s2,a0,8
    80203a8a:	854a                	mv	a0,s2
    80203a8c:	ffffd097          	auipc	ra,0xffffd
    80203a90:	c3c080e7          	jalr	-964(ra) # 802006c8 <acquire>
  while (lk->locked) {
    80203a94:	409c                	lw	a5,0(s1)
    80203a96:	cb89                	beqz	a5,80203aa8 <acquiresleep+0x30>
    sleep(lk, &lk->lk);
    80203a98:	85ca                	mv	a1,s2
    80203a9a:	8526                	mv	a0,s1
    80203a9c:	fffff097          	auipc	ra,0xfffff
    80203aa0:	830080e7          	jalr	-2000(ra) # 802022cc <sleep>
  while (lk->locked) {
    80203aa4:	409c                	lw	a5,0(s1)
    80203aa6:	fbed                	bnez	a5,80203a98 <acquiresleep+0x20>
  }
  lk->locked = 1;
    80203aa8:	4785                	li	a5,1
    80203aaa:	c09c                	sw	a5,0(s1)
  lk->pid = myproc()->pid;
    80203aac:	ffffe097          	auipc	ra,0xffffe
    80203ab0:	fac080e7          	jalr	-84(ra) # 80201a58 <myproc>
    80203ab4:	5d1c                	lw	a5,56(a0)
    80203ab6:	d49c                	sw	a5,40(s1)
  release(&lk->lk);
    80203ab8:	854a                	mv	a0,s2
    80203aba:	ffffd097          	auipc	ra,0xffffd
    80203abe:	c62080e7          	jalr	-926(ra) # 8020071c <release>
}
    80203ac2:	60e2                	ld	ra,24(sp)
    80203ac4:	6442                	ld	s0,16(sp)
    80203ac6:	64a2                	ld	s1,8(sp)
    80203ac8:	6902                	ld	s2,0(sp)
    80203aca:	6105                	addi	sp,sp,32
    80203acc:	8082                	ret

0000000080203ace <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80203ace:	1101                	addi	sp,sp,-32
    80203ad0:	ec06                	sd	ra,24(sp)
    80203ad2:	e822                	sd	s0,16(sp)
    80203ad4:	e426                	sd	s1,8(sp)
    80203ad6:	e04a                	sd	s2,0(sp)
    80203ad8:	1000                	addi	s0,sp,32
    80203ada:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203adc:	00850913          	addi	s2,a0,8
    80203ae0:	854a                	mv	a0,s2
    80203ae2:	ffffd097          	auipc	ra,0xffffd
    80203ae6:	be6080e7          	jalr	-1050(ra) # 802006c8 <acquire>
  lk->locked = 0;
    80203aea:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203aee:	0204a423          	sw	zero,40(s1)
  wakeup(lk);
    80203af2:	8526                	mv	a0,s1
    80203af4:	fffff097          	auipc	ra,0xfffff
    80203af8:	95a080e7          	jalr	-1702(ra) # 8020244e <wakeup>
  release(&lk->lk);
    80203afc:	854a                	mv	a0,s2
    80203afe:	ffffd097          	auipc	ra,0xffffd
    80203b02:	c1e080e7          	jalr	-994(ra) # 8020071c <release>
}
    80203b06:	60e2                	ld	ra,24(sp)
    80203b08:	6442                	ld	s0,16(sp)
    80203b0a:	64a2                	ld	s1,8(sp)
    80203b0c:	6902                	ld	s2,0(sp)
    80203b0e:	6105                	addi	sp,sp,32
    80203b10:	8082                	ret

0000000080203b12 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80203b12:	7179                	addi	sp,sp,-48
    80203b14:	f406                	sd	ra,40(sp)
    80203b16:	f022                	sd	s0,32(sp)
    80203b18:	ec26                	sd	s1,24(sp)
    80203b1a:	e84a                	sd	s2,16(sp)
    80203b1c:	e44e                	sd	s3,8(sp)
    80203b1e:	1800                	addi	s0,sp,48
    80203b20:	84aa                	mv	s1,a0
  int r;
  
  acquire(&lk->lk);
    80203b22:	00850913          	addi	s2,a0,8
    80203b26:	854a                	mv	a0,s2
    80203b28:	ffffd097          	auipc	ra,0xffffd
    80203b2c:	ba0080e7          	jalr	-1120(ra) # 802006c8 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80203b30:	409c                	lw	a5,0(s1)
    80203b32:	ef99                	bnez	a5,80203b50 <holdingsleep+0x3e>
    80203b34:	4481                	li	s1,0
  release(&lk->lk);
    80203b36:	854a                	mv	a0,s2
    80203b38:	ffffd097          	auipc	ra,0xffffd
    80203b3c:	be4080e7          	jalr	-1052(ra) # 8020071c <release>
  return r;
}
    80203b40:	8526                	mv	a0,s1
    80203b42:	70a2                	ld	ra,40(sp)
    80203b44:	7402                	ld	s0,32(sp)
    80203b46:	64e2                	ld	s1,24(sp)
    80203b48:	6942                	ld	s2,16(sp)
    80203b4a:	69a2                	ld	s3,8(sp)
    80203b4c:	6145                	addi	sp,sp,48
    80203b4e:	8082                	ret
  r = lk->locked && (lk->pid == myproc()->pid);
    80203b50:	0284a983          	lw	s3,40(s1)
    80203b54:	ffffe097          	auipc	ra,0xffffe
    80203b58:	f04080e7          	jalr	-252(ra) # 80201a58 <myproc>
    80203b5c:	5d04                	lw	s1,56(a0)
    80203b5e:	413484b3          	sub	s1,s1,s3
    80203b62:	0014b493          	seqz	s1,s1
    80203b66:	bfc1                	j	80203b36 <holdingsleep+0x24>

0000000080203b68 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80203b68:	1101                	addi	sp,sp,-32
    80203b6a:	ec06                	sd	ra,24(sp)
    80203b6c:	e822                	sd	s0,16(sp)
    80203b6e:	e426                	sd	s1,8(sp)
    80203b70:	e04a                	sd	s2,0(sp)
    80203b72:	1000                	addi	s0,sp,32
  initlock(&ftable.lock, "ftable");
    80203b74:	00006597          	auipc	a1,0x6
    80203b78:	03458593          	addi	a1,a1,52 # 80209ba8 <digits+0x828>
    80203b7c:	00025517          	auipc	a0,0x25
    80203b80:	7d450513          	addi	a0,a0,2004 # 80229350 <ftable>
    80203b84:	ffffd097          	auipc	ra,0xffffd
    80203b88:	b00080e7          	jalr	-1280(ra) # 80200684 <initlock>
  struct file *f;
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203b8c:	00025497          	auipc	s1,0x25
    80203b90:	7dc48493          	addi	s1,s1,2012 # 80229368 <ftable+0x18>
    80203b94:	00027917          	auipc	s2,0x27
    80203b98:	bd490913          	addi	s2,s2,-1068 # 8022a768 <tickslock>
    memset(f, 0, sizeof(struct file));
    80203b9c:	02800613          	li	a2,40
    80203ba0:	4581                	li	a1,0
    80203ba2:	8526                	mv	a0,s1
    80203ba4:	ffffd097          	auipc	ra,0xffffd
    80203ba8:	bc0080e7          	jalr	-1088(ra) # 80200764 <memset>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203bac:	02848493          	addi	s1,s1,40
    80203bb0:	ff2496e3          	bne	s1,s2,80203b9c <fileinit+0x34>
  }
  #ifdef DEBUG
  printf("fileinit\n");
  #endif
}
    80203bb4:	60e2                	ld	ra,24(sp)
    80203bb6:	6442                	ld	s0,16(sp)
    80203bb8:	64a2                	ld	s1,8(sp)
    80203bba:	6902                	ld	s2,0(sp)
    80203bbc:	6105                	addi	sp,sp,32
    80203bbe:	8082                	ret

0000000080203bc0 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80203bc0:	1101                	addi	sp,sp,-32
    80203bc2:	ec06                	sd	ra,24(sp)
    80203bc4:	e822                	sd	s0,16(sp)
    80203bc6:	e426                	sd	s1,8(sp)
    80203bc8:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80203bca:	00025517          	auipc	a0,0x25
    80203bce:	78650513          	addi	a0,a0,1926 # 80229350 <ftable>
    80203bd2:	ffffd097          	auipc	ra,0xffffd
    80203bd6:	af6080e7          	jalr	-1290(ra) # 802006c8 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203bda:	00025497          	auipc	s1,0x25
    80203bde:	78e48493          	addi	s1,s1,1934 # 80229368 <ftable+0x18>
    80203be2:	00027717          	auipc	a4,0x27
    80203be6:	b8670713          	addi	a4,a4,-1146 # 8022a768 <tickslock>
    if(f->ref == 0){
    80203bea:	40dc                	lw	a5,4(s1)
    80203bec:	cf99                	beqz	a5,80203c0a <filealloc+0x4a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203bee:	02848493          	addi	s1,s1,40
    80203bf2:	fee49ce3          	bne	s1,a4,80203bea <filealloc+0x2a>
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
    80203bf6:	00025517          	auipc	a0,0x25
    80203bfa:	75a50513          	addi	a0,a0,1882 # 80229350 <ftable>
    80203bfe:	ffffd097          	auipc	ra,0xffffd
    80203c02:	b1e080e7          	jalr	-1250(ra) # 8020071c <release>
  return NULL;
    80203c06:	4481                	li	s1,0
    80203c08:	a819                	j	80203c1e <filealloc+0x5e>
      f->ref = 1;
    80203c0a:	4785                	li	a5,1
    80203c0c:	c0dc                	sw	a5,4(s1)
      release(&ftable.lock);
    80203c0e:	00025517          	auipc	a0,0x25
    80203c12:	74250513          	addi	a0,a0,1858 # 80229350 <ftable>
    80203c16:	ffffd097          	auipc	ra,0xffffd
    80203c1a:	b06080e7          	jalr	-1274(ra) # 8020071c <release>
}
    80203c1e:	8526                	mv	a0,s1
    80203c20:	60e2                	ld	ra,24(sp)
    80203c22:	6442                	ld	s0,16(sp)
    80203c24:	64a2                	ld	s1,8(sp)
    80203c26:	6105                	addi	sp,sp,32
    80203c28:	8082                	ret

0000000080203c2a <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80203c2a:	1101                	addi	sp,sp,-32
    80203c2c:	ec06                	sd	ra,24(sp)
    80203c2e:	e822                	sd	s0,16(sp)
    80203c30:	e426                	sd	s1,8(sp)
    80203c32:	1000                	addi	s0,sp,32
    80203c34:	84aa                	mv	s1,a0
  acquire(&ftable.lock);
    80203c36:	00025517          	auipc	a0,0x25
    80203c3a:	71a50513          	addi	a0,a0,1818 # 80229350 <ftable>
    80203c3e:	ffffd097          	auipc	ra,0xffffd
    80203c42:	a8a080e7          	jalr	-1398(ra) # 802006c8 <acquire>
  if(f->ref < 1)
    80203c46:	40dc                	lw	a5,4(s1)
    80203c48:	02f05263          	blez	a5,80203c6c <filedup+0x42>
    panic("filedup");
  f->ref++;
    80203c4c:	2785                	addiw	a5,a5,1
    80203c4e:	c0dc                	sw	a5,4(s1)
  release(&ftable.lock);
    80203c50:	00025517          	auipc	a0,0x25
    80203c54:	70050513          	addi	a0,a0,1792 # 80229350 <ftable>
    80203c58:	ffffd097          	auipc	ra,0xffffd
    80203c5c:	ac4080e7          	jalr	-1340(ra) # 8020071c <release>
  return f;
}
    80203c60:	8526                	mv	a0,s1
    80203c62:	60e2                	ld	ra,24(sp)
    80203c64:	6442                	ld	s0,16(sp)
    80203c66:	64a2                	ld	s1,8(sp)
    80203c68:	6105                	addi	sp,sp,32
    80203c6a:	8082                	ret
    panic("filedup");
    80203c6c:	00006517          	auipc	a0,0x6
    80203c70:	f4450513          	addi	a0,a0,-188 # 80209bb0 <digits+0x830>
    80203c74:	ffffc097          	auipc	ra,0xffffc
    80203c78:	4ce080e7          	jalr	1230(ra) # 80200142 <panic>

0000000080203c7c <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80203c7c:	7139                	addi	sp,sp,-64
    80203c7e:	fc06                	sd	ra,56(sp)
    80203c80:	f822                	sd	s0,48(sp)
    80203c82:	f426                	sd	s1,40(sp)
    80203c84:	f04a                	sd	s2,32(sp)
    80203c86:	ec4e                	sd	s3,24(sp)
    80203c88:	e852                	sd	s4,16(sp)
    80203c8a:	e456                	sd	s5,8(sp)
    80203c8c:	0080                	addi	s0,sp,64
    80203c8e:	84aa                	mv	s1,a0
  struct file ff;

  acquire(&ftable.lock);
    80203c90:	00025517          	auipc	a0,0x25
    80203c94:	6c050513          	addi	a0,a0,1728 # 80229350 <ftable>
    80203c98:	ffffd097          	auipc	ra,0xffffd
    80203c9c:	a30080e7          	jalr	-1488(ra) # 802006c8 <acquire>
  if(f->ref < 1)
    80203ca0:	40dc                	lw	a5,4(s1)
    80203ca2:	04f05863          	blez	a5,80203cf2 <fileclose+0x76>
    panic("fileclose");
  if(--f->ref > 0){
    80203ca6:	37fd                	addiw	a5,a5,-1
    80203ca8:	0007871b          	sext.w	a4,a5
    80203cac:	c0dc                	sw	a5,4(s1)
    80203cae:	04e04a63          	bgtz	a4,80203d02 <fileclose+0x86>
    release(&ftable.lock);
    return;
  }
  ff = *f;
    80203cb2:	0004a903          	lw	s2,0(s1)
    80203cb6:	0094ca03          	lbu	s4,9(s1)
    80203cba:	0104b983          	ld	s3,16(s1)
    80203cbe:	0184ba83          	ld	s5,24(s1)
  f->ref = 0;
    80203cc2:	0004a223          	sw	zero,4(s1)
  f->type = FD_NONE;
    80203cc6:	0004a023          	sw	zero,0(s1)
  release(&ftable.lock);
    80203cca:	00025517          	auipc	a0,0x25
    80203cce:	68650513          	addi	a0,a0,1670 # 80229350 <ftable>
    80203cd2:	ffffd097          	auipc	ra,0xffffd
    80203cd6:	a4a080e7          	jalr	-1462(ra) # 8020071c <release>

  if(ff.type == FD_PIPE){
    80203cda:	4785                	li	a5,1
    80203cdc:	04f90463          	beq	s2,a5,80203d24 <fileclose+0xa8>
    pipeclose(ff.pipe, ff.writable);
  } else if(ff.type == FD_ENTRY){
    80203ce0:	4789                	li	a5,2
    80203ce2:	02f91863          	bne	s2,a5,80203d12 <fileclose+0x96>
    eput(ff.ep);
    80203ce6:	8556                	mv	a0,s5
    80203ce8:	00003097          	auipc	ra,0x3
    80203cec:	16e080e7          	jalr	366(ra) # 80206e56 <eput>
    80203cf0:	a00d                	j	80203d12 <fileclose+0x96>
    panic("fileclose");
    80203cf2:	00006517          	auipc	a0,0x6
    80203cf6:	ec650513          	addi	a0,a0,-314 # 80209bb8 <digits+0x838>
    80203cfa:	ffffc097          	auipc	ra,0xffffc
    80203cfe:	448080e7          	jalr	1096(ra) # 80200142 <panic>
    release(&ftable.lock);
    80203d02:	00025517          	auipc	a0,0x25
    80203d06:	64e50513          	addi	a0,a0,1614 # 80229350 <ftable>
    80203d0a:	ffffd097          	auipc	ra,0xffffd
    80203d0e:	a12080e7          	jalr	-1518(ra) # 8020071c <release>
  } else if (ff.type == FD_DEVICE) {

  }
}
    80203d12:	70e2                	ld	ra,56(sp)
    80203d14:	7442                	ld	s0,48(sp)
    80203d16:	74a2                	ld	s1,40(sp)
    80203d18:	7902                	ld	s2,32(sp)
    80203d1a:	69e2                	ld	s3,24(sp)
    80203d1c:	6a42                	ld	s4,16(sp)
    80203d1e:	6aa2                	ld	s5,8(sp)
    80203d20:	6121                	addi	sp,sp,64
    80203d22:	8082                	ret
    pipeclose(ff.pipe, ff.writable);
    80203d24:	85d2                	mv	a1,s4
    80203d26:	854e                	mv	a0,s3
    80203d28:	00000097          	auipc	ra,0x0
    80203d2c:	3a2080e7          	jalr	930(ra) # 802040ca <pipeclose>
    80203d30:	b7cd                	j	80203d12 <fileclose+0x96>

0000000080203d32 <filestat>:
int
filestat(struct file *f, uint64 addr)
{
  struct stat st;
  
  if(f->type == FD_ENTRY){
    80203d32:	4118                	lw	a4,0(a0)
    80203d34:	4789                	li	a5,2
    80203d36:	04f71e63          	bne	a4,a5,80203d92 <filestat+0x60>
{
    80203d3a:	7159                	addi	sp,sp,-112
    80203d3c:	f486                	sd	ra,104(sp)
    80203d3e:	f0a2                	sd	s0,96(sp)
    80203d40:	eca6                	sd	s1,88(sp)
    80203d42:	e8ca                	sd	s2,80(sp)
    80203d44:	e4ce                	sd	s3,72(sp)
    80203d46:	1880                	addi	s0,sp,112
    80203d48:	84aa                	mv	s1,a0
    80203d4a:	892e                	mv	s2,a1
    elock(f->ep);
    80203d4c:	6d08                	ld	a0,24(a0)
    80203d4e:	00003097          	auipc	ra,0x3
    80203d52:	084080e7          	jalr	132(ra) # 80206dd2 <elock>
    estat(f->ep, &st);
    80203d56:	f9840993          	addi	s3,s0,-104
    80203d5a:	85ce                	mv	a1,s3
    80203d5c:	6c88                	ld	a0,24(s1)
    80203d5e:	00003097          	auipc	ra,0x3
    80203d62:	230080e7          	jalr	560(ra) # 80206f8e <estat>
    eunlock(f->ep);
    80203d66:	6c88                	ld	a0,24(s1)
    80203d68:	00003097          	auipc	ra,0x3
    80203d6c:	0a0080e7          	jalr	160(ra) # 80206e08 <eunlock>
    // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203d70:	03800613          	li	a2,56
    80203d74:	85ce                	mv	a1,s3
    80203d76:	854a                	mv	a0,s2
    80203d78:	ffffd097          	auipc	ra,0xffffd
    80203d7c:	604080e7          	jalr	1540(ra) # 8020137c <copyout2>
    80203d80:	41f5551b          	sraiw	a0,a0,0x1f
      return -1;
    return 0;
  }
  return -1;
}
    80203d84:	70a6                	ld	ra,104(sp)
    80203d86:	7406                	ld	s0,96(sp)
    80203d88:	64e6                	ld	s1,88(sp)
    80203d8a:	6946                	ld	s2,80(sp)
    80203d8c:	69a6                	ld	s3,72(sp)
    80203d8e:	6165                	addi	sp,sp,112
    80203d90:	8082                	ret
  return -1;
    80203d92:	557d                	li	a0,-1
}
    80203d94:	8082                	ret

0000000080203d96 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80203d96:	7179                	addi	sp,sp,-48
    80203d98:	f406                	sd	ra,40(sp)
    80203d9a:	f022                	sd	s0,32(sp)
    80203d9c:	ec26                	sd	s1,24(sp)
    80203d9e:	e84a                	sd	s2,16(sp)
    80203da0:	e44e                	sd	s3,8(sp)
    80203da2:	1800                	addi	s0,sp,48
  int r = 0;

  if(f->readable == 0)
    80203da4:	00854783          	lbu	a5,8(a0)
    80203da8:	c3d5                	beqz	a5,80203e4c <fileread+0xb6>
    80203daa:	84aa                	mv	s1,a0
    80203dac:	89ae                	mv	s3,a1
    80203dae:	8932                	mv	s2,a2
    return -1;

  switch (f->type) {
    80203db0:	411c                	lw	a5,0(a0)
    80203db2:	4709                	li	a4,2
    80203db4:	06e78263          	beq	a5,a4,80203e18 <fileread+0x82>
    80203db8:	470d                	li	a4,3
    80203dba:	02e78b63          	beq	a5,a4,80203df0 <fileread+0x5a>
    80203dbe:	4705                	li	a4,1
    80203dc0:	00e78a63          	beq	a5,a4,80203dd4 <fileread+0x3e>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
            f->off += r;
        eunlock(f->ep);
        break;
    default:
      panic("fileread");
    80203dc4:	00006517          	auipc	a0,0x6
    80203dc8:	e0450513          	addi	a0,a0,-508 # 80209bc8 <digits+0x848>
    80203dcc:	ffffc097          	auipc	ra,0xffffc
    80203dd0:	376080e7          	jalr	886(ra) # 80200142 <panic>
        r = piperead(f->pipe, addr, n);
    80203dd4:	6908                	ld	a0,16(a0)
    80203dd6:	00000097          	auipc	ra,0x0
    80203dda:	48c080e7          	jalr	1164(ra) # 80204262 <piperead>
    80203dde:	892a                	mv	s2,a0
  }

  return r;
}
    80203de0:	854a                	mv	a0,s2
    80203de2:	70a2                	ld	ra,40(sp)
    80203de4:	7402                	ld	s0,32(sp)
    80203de6:	64e2                	ld	s1,24(sp)
    80203de8:	6942                	ld	s2,16(sp)
    80203dea:	69a2                	ld	s3,8(sp)
    80203dec:	6145                	addi	sp,sp,48
    80203dee:	8082                	ret
        if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80203df0:	02451783          	lh	a5,36(a0)
    80203df4:	03079693          	slli	a3,a5,0x30
    80203df8:	92c1                	srli	a3,a3,0x30
    80203dfa:	4725                	li	a4,9
    80203dfc:	04d76a63          	bltu	a4,a3,80203e50 <fileread+0xba>
    80203e00:	0792                	slli	a5,a5,0x4
    80203e02:	00025717          	auipc	a4,0x25
    80203e06:	4ae70713          	addi	a4,a4,1198 # 802292b0 <devsw>
    80203e0a:	97ba                	add	a5,a5,a4
    80203e0c:	639c                	ld	a5,0(a5)
    80203e0e:	c3b9                	beqz	a5,80203e54 <fileread+0xbe>
        r = devsw[f->major].read(1, addr, n);
    80203e10:	4505                	li	a0,1
    80203e12:	9782                	jalr	a5
    80203e14:	892a                	mv	s2,a0
        break;
    80203e16:	b7e9                	j	80203de0 <fileread+0x4a>
        elock(f->ep);
    80203e18:	6d08                	ld	a0,24(a0)
    80203e1a:	00003097          	auipc	ra,0x3
    80203e1e:	fb8080e7          	jalr	-72(ra) # 80206dd2 <elock>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
    80203e22:	874a                	mv	a4,s2
    80203e24:	5094                	lw	a3,32(s1)
    80203e26:	864e                	mv	a2,s3
    80203e28:	4585                	li	a1,1
    80203e2a:	6c88                	ld	a0,24(s1)
    80203e2c:	00002097          	auipc	ra,0x2
    80203e30:	6bc080e7          	jalr	1724(ra) # 802064e8 <eread>
    80203e34:	892a                	mv	s2,a0
    80203e36:	00a05563          	blez	a0,80203e40 <fileread+0xaa>
            f->off += r;
    80203e3a:	509c                	lw	a5,32(s1)
    80203e3c:	9fa9                	addw	a5,a5,a0
    80203e3e:	d09c                	sw	a5,32(s1)
        eunlock(f->ep);
    80203e40:	6c88                	ld	a0,24(s1)
    80203e42:	00003097          	auipc	ra,0x3
    80203e46:	fc6080e7          	jalr	-58(ra) # 80206e08 <eunlock>
        break;
    80203e4a:	bf59                	j	80203de0 <fileread+0x4a>
    return -1;
    80203e4c:	597d                	li	s2,-1
    80203e4e:	bf49                	j	80203de0 <fileread+0x4a>
          return -1;
    80203e50:	597d                	li	s2,-1
    80203e52:	b779                	j	80203de0 <fileread+0x4a>
    80203e54:	597d                	li	s2,-1
    80203e56:	b769                	j	80203de0 <fileread+0x4a>

0000000080203e58 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80203e58:	7179                	addi	sp,sp,-48
    80203e5a:	f406                	sd	ra,40(sp)
    80203e5c:	f022                	sd	s0,32(sp)
    80203e5e:	ec26                	sd	s1,24(sp)
    80203e60:	e84a                	sd	s2,16(sp)
    80203e62:	e44e                	sd	s3,8(sp)
    80203e64:	e052                	sd	s4,0(sp)
    80203e66:	1800                	addi	s0,sp,48
  int ret = 0;

  if(f->writable == 0)
    80203e68:	00954783          	lbu	a5,9(a0)
    80203e6c:	cbcd                	beqz	a5,80203f1e <filewrite+0xc6>
    80203e6e:	84aa                	mv	s1,a0
    80203e70:	892e                	mv	s2,a1
    80203e72:	89b2                	mv	s3,a2
    return -1;

  if(f->type == FD_PIPE){
    80203e74:	411c                	lw	a5,0(a0)
    80203e76:	4705                	li	a4,1
    80203e78:	04e78963          	beq	a5,a4,80203eca <filewrite+0x72>
    ret = pipewrite(f->pipe, addr, n);
  } else if(f->type == FD_DEVICE){
    80203e7c:	470d                	li	a4,3
    80203e7e:	04e78d63          	beq	a5,a4,80203ed8 <filewrite+0x80>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
      return -1;
    ret = devsw[f->major].write(1, addr, n);
  } else if(f->type == FD_ENTRY){
    80203e82:	4709                	li	a4,2
    80203e84:	08e79563          	bne	a5,a4,80203f0e <filewrite+0xb6>
    elock(f->ep);
    80203e88:	6d08                	ld	a0,24(a0)
    80203e8a:	00003097          	auipc	ra,0x3
    80203e8e:	f48080e7          	jalr	-184(ra) # 80206dd2 <elock>
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203e92:	00098a1b          	sext.w	s4,s3
    80203e96:	8752                	mv	a4,s4
    80203e98:	5094                	lw	a3,32(s1)
    80203e9a:	864a                	mv	a2,s2
    80203e9c:	4585                	li	a1,1
    80203e9e:	6c88                	ld	a0,24(s1)
    80203ea0:	00002097          	auipc	ra,0x2
    80203ea4:	740080e7          	jalr	1856(ra) # 802065e0 <ewrite>
      ret = n;
      f->off += n;
    } else {
      ret = -1;
    80203ea8:	597d                	li	s2,-1
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203eaa:	05350b63          	beq	a0,s3,80203f00 <filewrite+0xa8>
    }
    eunlock(f->ep);
    80203eae:	6c88                	ld	a0,24(s1)
    80203eb0:	00003097          	auipc	ra,0x3
    80203eb4:	f58080e7          	jalr	-168(ra) # 80206e08 <eunlock>
  } else {
    panic("filewrite");
  }

  return ret;
}
    80203eb8:	854a                	mv	a0,s2
    80203eba:	70a2                	ld	ra,40(sp)
    80203ebc:	7402                	ld	s0,32(sp)
    80203ebe:	64e2                	ld	s1,24(sp)
    80203ec0:	6942                	ld	s2,16(sp)
    80203ec2:	69a2                	ld	s3,8(sp)
    80203ec4:	6a02                	ld	s4,0(sp)
    80203ec6:	6145                	addi	sp,sp,48
    80203ec8:	8082                	ret
    ret = pipewrite(f->pipe, addr, n);
    80203eca:	6908                	ld	a0,16(a0)
    80203ecc:	00000097          	auipc	ra,0x0
    80203ed0:	26e080e7          	jalr	622(ra) # 8020413a <pipewrite>
    80203ed4:	892a                	mv	s2,a0
    80203ed6:	b7cd                	j	80203eb8 <filewrite+0x60>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80203ed8:	02451783          	lh	a5,36(a0)
    80203edc:	03079693          	slli	a3,a5,0x30
    80203ee0:	92c1                	srli	a3,a3,0x30
    80203ee2:	4725                	li	a4,9
    80203ee4:	02d76f63          	bltu	a4,a3,80203f22 <filewrite+0xca>
    80203ee8:	0792                	slli	a5,a5,0x4
    80203eea:	00025717          	auipc	a4,0x25
    80203eee:	3c670713          	addi	a4,a4,966 # 802292b0 <devsw>
    80203ef2:	97ba                	add	a5,a5,a4
    80203ef4:	679c                	ld	a5,8(a5)
    80203ef6:	cb85                	beqz	a5,80203f26 <filewrite+0xce>
    ret = devsw[f->major].write(1, addr, n);
    80203ef8:	4505                	li	a0,1
    80203efa:	9782                	jalr	a5
    80203efc:	892a                	mv	s2,a0
    80203efe:	bf6d                	j	80203eb8 <filewrite+0x60>
      f->off += n;
    80203f00:	509c                	lw	a5,32(s1)
    80203f02:	01478a3b          	addw	s4,a5,s4
    80203f06:	0344a023          	sw	s4,32(s1)
      ret = n;
    80203f0a:	894e                	mv	s2,s3
    80203f0c:	b74d                	j	80203eae <filewrite+0x56>
    panic("filewrite");
    80203f0e:	00006517          	auipc	a0,0x6
    80203f12:	cca50513          	addi	a0,a0,-822 # 80209bd8 <digits+0x858>
    80203f16:	ffffc097          	auipc	ra,0xffffc
    80203f1a:	22c080e7          	jalr	556(ra) # 80200142 <panic>
    return -1;
    80203f1e:	597d                	li	s2,-1
    80203f20:	bf61                	j	80203eb8 <filewrite+0x60>
      return -1;
    80203f22:	597d                	li	s2,-1
    80203f24:	bf51                	j	80203eb8 <filewrite+0x60>
    80203f26:	597d                	li	s2,-1
    80203f28:	bf41                	j	80203eb8 <filewrite+0x60>

0000000080203f2a <dirnext>:
int
dirnext(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();

  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203f2a:	00854783          	lbu	a5,8(a0)
    80203f2e:	cfdd                	beqz	a5,80203fec <dirnext+0xc2>
{
    80203f30:	7141                	addi	sp,sp,-496
    80203f32:	f786                	sd	ra,488(sp)
    80203f34:	f3a2                	sd	s0,480(sp)
    80203f36:	efa6                	sd	s1,472(sp)
    80203f38:	ebca                	sd	s2,464(sp)
    80203f3a:	e7ce                	sd	s3,456(sp)
    80203f3c:	e3d2                	sd	s4,448(sp)
    80203f3e:	ff56                	sd	s5,440(sp)
    80203f40:	1b80                	addi	s0,sp,496
    80203f42:	84aa                	mv	s1,a0
    80203f44:	8aae                	mv	s5,a1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203f46:	6d18                	ld	a4,24(a0)
    80203f48:	10074783          	lbu	a5,256(a4)
    80203f4c:	8bc1                	andi	a5,a5,16
    return -1;
    80203f4e:	557d                	li	a0,-1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203f50:	eb91                	bnez	a5,80203f64 <dirnext+0x3a>
  // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    return -1;

  return 1;
    80203f52:	70be                	ld	ra,488(sp)
    80203f54:	741e                	ld	s0,480(sp)
    80203f56:	64fe                	ld	s1,472(sp)
    80203f58:	695e                	ld	s2,464(sp)
    80203f5a:	69be                	ld	s3,456(sp)
    80203f5c:	6a1e                	ld	s4,448(sp)
    80203f5e:	7afa                	ld	s5,440(sp)
    80203f60:	617d                	addi	sp,sp,496
    80203f62:	8082                	ret
  int count = 0;
    80203f64:	e0042e23          	sw	zero,-484(s0)
  elock(f->ep);
    80203f68:	853a                	mv	a0,a4
    80203f6a:	00003097          	auipc	ra,0x3
    80203f6e:	e68080e7          	jalr	-408(ra) # 80206dd2 <elock>
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80203f72:	e1c40a13          	addi	s4,s0,-484
    80203f76:	e5840993          	addi	s3,s0,-424
    80203f7a:	a801                	j	80203f8a <dirnext+0x60>
    f->off += count * 32;
    80203f7c:	e1c42783          	lw	a5,-484(s0)
    80203f80:	0057971b          	slliw	a4,a5,0x5
    80203f84:	509c                	lw	a5,32(s1)
    80203f86:	9fb9                	addw	a5,a5,a4
    80203f88:	d09c                	sw	a5,32(s1)
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80203f8a:	86d2                	mv	a3,s4
    80203f8c:	5090                	lw	a2,32(s1)
    80203f8e:	85ce                	mv	a1,s3
    80203f90:	6c88                	ld	a0,24(s1)
    80203f92:	00003097          	auipc	ra,0x3
    80203f96:	044080e7          	jalr	68(ra) # 80206fd6 <enext>
    80203f9a:	892a                	mv	s2,a0
    80203f9c:	d165                	beqz	a0,80203f7c <dirnext+0x52>
  eunlock(f->ep);
    80203f9e:	6c88                	ld	a0,24(s1)
    80203fa0:	00003097          	auipc	ra,0x3
    80203fa4:	e68080e7          	jalr	-408(ra) # 80206e08 <eunlock>
  if (ret == -1)
    80203fa8:	57fd                	li	a5,-1
    return 0;
    80203faa:	4501                	li	a0,0
  if (ret == -1)
    80203fac:	faf903e3          	beq	s2,a5,80203f52 <dirnext+0x28>
  f->off += count * 32;
    80203fb0:	e1c42783          	lw	a5,-484(s0)
    80203fb4:	0057971b          	slliw	a4,a5,0x5
    80203fb8:	509c                	lw	a5,32(s1)
    80203fba:	9fb9                	addw	a5,a5,a4
    80203fbc:	d09c                	sw	a5,32(s1)
  estat(&de, &st);
    80203fbe:	e2040493          	addi	s1,s0,-480
    80203fc2:	85a6                	mv	a1,s1
    80203fc4:	e5840513          	addi	a0,s0,-424
    80203fc8:	00003097          	auipc	ra,0x3
    80203fcc:	fc6080e7          	jalr	-58(ra) # 80206f8e <estat>
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203fd0:	03800613          	li	a2,56
    80203fd4:	85a6                	mv	a1,s1
    80203fd6:	8556                	mv	a0,s5
    80203fd8:	ffffd097          	auipc	ra,0xffffd
    80203fdc:	3a4080e7          	jalr	932(ra) # 8020137c <copyout2>
    80203fe0:	87aa                	mv	a5,a0
  return 1;
    80203fe2:	4505                	li	a0,1
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203fe4:	f607d7e3          	bgez	a5,80203f52 <dirnext+0x28>
    return -1;
    80203fe8:	557d                	li	a0,-1
    80203fea:	b7a5                	j	80203f52 <dirnext+0x28>
    return -1;
    80203fec:	557d                	li	a0,-1
    80203fee:	8082                	ret

0000000080203ff0 <pipealloc>:
#include "include/kalloc.h"
#include "include/vm.h"

int
pipealloc(struct file **f0, struct file **f1)
{
    80203ff0:	7179                	addi	sp,sp,-48
    80203ff2:	f406                	sd	ra,40(sp)
    80203ff4:	f022                	sd	s0,32(sp)
    80203ff6:	ec26                	sd	s1,24(sp)
    80203ff8:	e84a                	sd	s2,16(sp)
    80203ffa:	e44e                	sd	s3,8(sp)
    80203ffc:	e052                	sd	s4,0(sp)
    80203ffe:	1800                	addi	s0,sp,48
    80204000:	84aa                	mv	s1,a0
    80204002:	8a2e                	mv	s4,a1
  struct pipe *pi;

  pi = 0;
  *f0 = *f1 = 0;
    80204004:	0005b023          	sd	zero,0(a1)
    80204008:	00053023          	sd	zero,0(a0)
  if((*f0 = filealloc()) == NULL || (*f1 = filealloc()) == NULL)
    8020400c:	00000097          	auipc	ra,0x0
    80204010:	bb4080e7          	jalr	-1100(ra) # 80203bc0 <filealloc>
    80204014:	e088                	sd	a0,0(s1)
    80204016:	c551                	beqz	a0,802040a2 <pipealloc+0xb2>
    80204018:	00000097          	auipc	ra,0x0
    8020401c:	ba8080e7          	jalr	-1112(ra) # 80203bc0 <filealloc>
    80204020:	00aa3023          	sd	a0,0(s4)
    80204024:	c92d                	beqz	a0,80204096 <pipealloc+0xa6>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == NULL)
    80204026:	ffffc097          	auipc	ra,0xffffc
    8020402a:	536080e7          	jalr	1334(ra) # 8020055c <kalloc>
    8020402e:	892a                	mv	s2,a0
    80204030:	c125                	beqz	a0,80204090 <pipealloc+0xa0>
    goto bad;
  pi->readopen = 1;
    80204032:	4985                	li	s3,1
    80204034:	23352023          	sw	s3,544(a0)
  pi->writeopen = 1;
    80204038:	23352223          	sw	s3,548(a0)
  pi->nwrite = 0;
    8020403c:	20052e23          	sw	zero,540(a0)
  pi->nread = 0;
    80204040:	20052c23          	sw	zero,536(a0)
  initlock(&pi->lock, "pipe");
    80204044:	00006597          	auipc	a1,0x6
    80204048:	9c458593          	addi	a1,a1,-1596 # 80209a08 <digits+0x688>
    8020404c:	ffffc097          	auipc	ra,0xffffc
    80204050:	638080e7          	jalr	1592(ra) # 80200684 <initlock>
  (*f0)->type = FD_PIPE;
    80204054:	609c                	ld	a5,0(s1)
    80204056:	0137a023          	sw	s3,0(a5)
  (*f0)->readable = 1;
    8020405a:	609c                	ld	a5,0(s1)
    8020405c:	01378423          	sb	s3,8(a5)
  (*f0)->writable = 0;
    80204060:	609c                	ld	a5,0(s1)
    80204062:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80204066:	609c                	ld	a5,0(s1)
    80204068:	0127b823          	sd	s2,16(a5)
  (*f1)->type = FD_PIPE;
    8020406c:	000a3783          	ld	a5,0(s4)
    80204070:	0137a023          	sw	s3,0(a5)
  (*f1)->readable = 0;
    80204074:	000a3783          	ld	a5,0(s4)
    80204078:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    8020407c:	000a3783          	ld	a5,0(s4)
    80204080:	013784a3          	sb	s3,9(a5)
  (*f1)->pipe = pi;
    80204084:	000a3783          	ld	a5,0(s4)
    80204088:	0127b823          	sd	s2,16(a5)
  return 0;
    8020408c:	4501                	li	a0,0
    8020408e:	a025                	j	802040b6 <pipealloc+0xc6>

 bad:
  if(pi)
    kfree((char*)pi);
  if(*f0)
    80204090:	6088                	ld	a0,0(s1)
    80204092:	e501                	bnez	a0,8020409a <pipealloc+0xaa>
    80204094:	a039                	j	802040a2 <pipealloc+0xb2>
    80204096:	6088                	ld	a0,0(s1)
    80204098:	c51d                	beqz	a0,802040c6 <pipealloc+0xd6>
    fileclose(*f0);
    8020409a:	00000097          	auipc	ra,0x0
    8020409e:	be2080e7          	jalr	-1054(ra) # 80203c7c <fileclose>
  if(*f1)
    802040a2:	000a3783          	ld	a5,0(s4)
    fileclose(*f1);
  return -1;
    802040a6:	557d                	li	a0,-1
  if(*f1)
    802040a8:	c799                	beqz	a5,802040b6 <pipealloc+0xc6>
    fileclose(*f1);
    802040aa:	853e                	mv	a0,a5
    802040ac:	00000097          	auipc	ra,0x0
    802040b0:	bd0080e7          	jalr	-1072(ra) # 80203c7c <fileclose>
  return -1;
    802040b4:	557d                	li	a0,-1
}
    802040b6:	70a2                	ld	ra,40(sp)
    802040b8:	7402                	ld	s0,32(sp)
    802040ba:	64e2                	ld	s1,24(sp)
    802040bc:	6942                	ld	s2,16(sp)
    802040be:	69a2                	ld	s3,8(sp)
    802040c0:	6a02                	ld	s4,0(sp)
    802040c2:	6145                	addi	sp,sp,48
    802040c4:	8082                	ret
  return -1;
    802040c6:	557d                	li	a0,-1
    802040c8:	b7fd                	j	802040b6 <pipealloc+0xc6>

00000000802040ca <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    802040ca:	1101                	addi	sp,sp,-32
    802040cc:	ec06                	sd	ra,24(sp)
    802040ce:	e822                	sd	s0,16(sp)
    802040d0:	e426                	sd	s1,8(sp)
    802040d2:	e04a                	sd	s2,0(sp)
    802040d4:	1000                	addi	s0,sp,32
    802040d6:	84aa                	mv	s1,a0
    802040d8:	892e                	mv	s2,a1
  acquire(&pi->lock);
    802040da:	ffffc097          	auipc	ra,0xffffc
    802040de:	5ee080e7          	jalr	1518(ra) # 802006c8 <acquire>
  if(writable){
    802040e2:	02090d63          	beqz	s2,8020411c <pipeclose+0x52>
    pi->writeopen = 0;
    802040e6:	2204a223          	sw	zero,548(s1)
    wakeup(&pi->nread);
    802040ea:	21848513          	addi	a0,s1,536
    802040ee:	ffffe097          	auipc	ra,0xffffe
    802040f2:	360080e7          	jalr	864(ra) # 8020244e <wakeup>
  } else {
    pi->readopen = 0;
    wakeup(&pi->nwrite);
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    802040f6:	2204b783          	ld	a5,544(s1)
    802040fa:	eb95                	bnez	a5,8020412e <pipeclose+0x64>
    release(&pi->lock);
    802040fc:	8526                	mv	a0,s1
    802040fe:	ffffc097          	auipc	ra,0xffffc
    80204102:	61e080e7          	jalr	1566(ra) # 8020071c <release>
    kfree((char*)pi);
    80204106:	8526                	mv	a0,s1
    80204108:	ffffc097          	auipc	ra,0xffffc
    8020410c:	33c080e7          	jalr	828(ra) # 80200444 <kfree>
  } else
    release(&pi->lock);
}
    80204110:	60e2                	ld	ra,24(sp)
    80204112:	6442                	ld	s0,16(sp)
    80204114:	64a2                	ld	s1,8(sp)
    80204116:	6902                	ld	s2,0(sp)
    80204118:	6105                	addi	sp,sp,32
    8020411a:	8082                	ret
    pi->readopen = 0;
    8020411c:	2204a023          	sw	zero,544(s1)
    wakeup(&pi->nwrite);
    80204120:	21c48513          	addi	a0,s1,540
    80204124:	ffffe097          	auipc	ra,0xffffe
    80204128:	32a080e7          	jalr	810(ra) # 8020244e <wakeup>
    8020412c:	b7e9                	j	802040f6 <pipeclose+0x2c>
    release(&pi->lock);
    8020412e:	8526                	mv	a0,s1
    80204130:	ffffc097          	auipc	ra,0xffffc
    80204134:	5ec080e7          	jalr	1516(ra) # 8020071c <release>
}
    80204138:	bfe1                	j	80204110 <pipeclose+0x46>

000000008020413a <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    8020413a:	7175                	addi	sp,sp,-144
    8020413c:	e506                	sd	ra,136(sp)
    8020413e:	e122                	sd	s0,128(sp)
    80204140:	fca6                	sd	s1,120(sp)
    80204142:	f8ca                	sd	s2,112(sp)
    80204144:	f4ce                	sd	s3,104(sp)
    80204146:	f0d2                	sd	s4,96(sp)
    80204148:	ecd6                	sd	s5,88(sp)
    8020414a:	e8da                	sd	s6,80(sp)
    8020414c:	e4de                	sd	s7,72(sp)
    8020414e:	e0e2                	sd	s8,64(sp)
    80204150:	fc66                	sd	s9,56(sp)
    80204152:	f86a                	sd	s10,48(sp)
    80204154:	f46e                	sd	s11,40(sp)
    80204156:	0900                	addi	s0,sp,144
    80204158:	84aa                	mv	s1,a0
    8020415a:	f6b43c23          	sd	a1,-136(s0)
    8020415e:	8b32                	mv	s6,a2
  int i;
  char ch;
  struct proc *pr = myproc();
    80204160:	ffffe097          	auipc	ra,0xffffe
    80204164:	8f8080e7          	jalr	-1800(ra) # 80201a58 <myproc>
    80204168:	892a                	mv	s2,a0

  acquire(&pi->lock);
    8020416a:	8526                	mv	a0,s1
    8020416c:	ffffc097          	auipc	ra,0xffffc
    80204170:	55c080e7          	jalr	1372(ra) # 802006c8 <acquire>
  for(i = 0; i < n; i++){
    80204174:	0d605a63          	blez	s6,80204248 <pipewrite+0x10e>
    80204178:	89a6                	mv	s3,s1
    8020417a:	3b7d                	addiw	s6,s6,-1
    8020417c:	1b02                	slli	s6,s6,0x20
    8020417e:	020b5b13          	srli	s6,s6,0x20
    80204182:	4b81                	li	s7,0
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
      if(pi->readopen == 0 || pr->killed){
        release(&pi->lock);
        return -1;
      }
      wakeup(&pi->nread);
    80204184:	21848a93          	addi	s5,s1,536
      sleep(&pi->nwrite, &pi->lock);
    80204188:	21c48a13          	addi	s4,s1,540
    }
    // if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    if(copyin2(&ch, addr + i, 1) == -1)
    8020418c:	f8f40d93          	addi	s11,s0,-113
    80204190:	5d7d                	li	s10,-1
    80204192:	000b8c9b          	sext.w	s9,s7
    80204196:	8c66                	mv	s8,s9
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    80204198:	2184a783          	lw	a5,536(s1)
    8020419c:	21c4a703          	lw	a4,540(s1)
    802041a0:	2007879b          	addiw	a5,a5,512
    802041a4:	02f71b63          	bne	a4,a5,802041da <pipewrite+0xa0>
      if(pi->readopen == 0 || pr->killed){
    802041a8:	2204a783          	lw	a5,544(s1)
    802041ac:	cba5                	beqz	a5,8020421c <pipewrite+0xe2>
    802041ae:	03092783          	lw	a5,48(s2)
    802041b2:	e7ad                	bnez	a5,8020421c <pipewrite+0xe2>
      wakeup(&pi->nread);
    802041b4:	8556                	mv	a0,s5
    802041b6:	ffffe097          	auipc	ra,0xffffe
    802041ba:	298080e7          	jalr	664(ra) # 8020244e <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    802041be:	85ce                	mv	a1,s3
    802041c0:	8552                	mv	a0,s4
    802041c2:	ffffe097          	auipc	ra,0xffffe
    802041c6:	10a080e7          	jalr	266(ra) # 802022cc <sleep>
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    802041ca:	2184a783          	lw	a5,536(s1)
    802041ce:	21c4a703          	lw	a4,540(s1)
    802041d2:	2007879b          	addiw	a5,a5,512
    802041d6:	fcf709e3          	beq	a4,a5,802041a8 <pipewrite+0x6e>
    if(copyin2(&ch, addr + i, 1) == -1)
    802041da:	4605                	li	a2,1
    802041dc:	f7843783          	ld	a5,-136(s0)
    802041e0:	00fb85b3          	add	a1,s7,a5
    802041e4:	856e                	mv	a0,s11
    802041e6:	ffffd097          	auipc	ra,0xffffd
    802041ea:	274080e7          	jalr	628(ra) # 8020145a <copyin2>
    802041ee:	05a50e63          	beq	a0,s10,8020424a <pipewrite+0x110>
      break;
    pi->data[pi->nwrite++ % PIPESIZE] = ch;
    802041f2:	21c4a783          	lw	a5,540(s1)
    802041f6:	0017871b          	addiw	a4,a5,1
    802041fa:	20e4ae23          	sw	a4,540(s1)
    802041fe:	1ff7f793          	andi	a5,a5,511
    80204202:	97a6                	add	a5,a5,s1
    80204204:	f8f44703          	lbu	a4,-113(s0)
    80204208:	00e78c23          	sb	a4,24(a5)
  for(i = 0; i < n; i++){
    8020420c:	001c8c1b          	addiw	s8,s9,1
    80204210:	001b8793          	addi	a5,s7,1
    80204214:	036b8b63          	beq	s7,s6,8020424a <pipewrite+0x110>
    80204218:	8bbe                	mv	s7,a5
    8020421a:	bfa5                	j	80204192 <pipewrite+0x58>
        release(&pi->lock);
    8020421c:	8526                	mv	a0,s1
    8020421e:	ffffc097          	auipc	ra,0xffffc
    80204222:	4fe080e7          	jalr	1278(ra) # 8020071c <release>
        return -1;
    80204226:	5c7d                	li	s8,-1
  }
  wakeup(&pi->nread);
  release(&pi->lock);
  return i;
}
    80204228:	8562                	mv	a0,s8
    8020422a:	60aa                	ld	ra,136(sp)
    8020422c:	640a                	ld	s0,128(sp)
    8020422e:	74e6                	ld	s1,120(sp)
    80204230:	7946                	ld	s2,112(sp)
    80204232:	79a6                	ld	s3,104(sp)
    80204234:	7a06                	ld	s4,96(sp)
    80204236:	6ae6                	ld	s5,88(sp)
    80204238:	6b46                	ld	s6,80(sp)
    8020423a:	6ba6                	ld	s7,72(sp)
    8020423c:	6c06                	ld	s8,64(sp)
    8020423e:	7ce2                	ld	s9,56(sp)
    80204240:	7d42                	ld	s10,48(sp)
    80204242:	7da2                	ld	s11,40(sp)
    80204244:	6149                	addi	sp,sp,144
    80204246:	8082                	ret
  for(i = 0; i < n; i++){
    80204248:	4c01                	li	s8,0
  wakeup(&pi->nread);
    8020424a:	21848513          	addi	a0,s1,536
    8020424e:	ffffe097          	auipc	ra,0xffffe
    80204252:	200080e7          	jalr	512(ra) # 8020244e <wakeup>
  release(&pi->lock);
    80204256:	8526                	mv	a0,s1
    80204258:	ffffc097          	auipc	ra,0xffffc
    8020425c:	4c4080e7          	jalr	1220(ra) # 8020071c <release>
  return i;
    80204260:	b7e1                	j	80204228 <pipewrite+0xee>

0000000080204262 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    80204262:	715d                	addi	sp,sp,-80
    80204264:	e486                	sd	ra,72(sp)
    80204266:	e0a2                	sd	s0,64(sp)
    80204268:	fc26                	sd	s1,56(sp)
    8020426a:	f84a                	sd	s2,48(sp)
    8020426c:	f44e                	sd	s3,40(sp)
    8020426e:	f052                	sd	s4,32(sp)
    80204270:	ec56                	sd	s5,24(sp)
    80204272:	e85a                	sd	s6,16(sp)
    80204274:	0880                	addi	s0,sp,80
    80204276:	84aa                	mv	s1,a0
    80204278:	892e                	mv	s2,a1
    8020427a:	8a32                	mv	s4,a2
  int i;
  struct proc *pr = myproc();
    8020427c:	ffffd097          	auipc	ra,0xffffd
    80204280:	7dc080e7          	jalr	2012(ra) # 80201a58 <myproc>
    80204284:	89aa                	mv	s3,a0
  char ch;

  acquire(&pi->lock);
    80204286:	8b26                	mv	s6,s1
    80204288:	8526                	mv	a0,s1
    8020428a:	ffffc097          	auipc	ra,0xffffc
    8020428e:	43e080e7          	jalr	1086(ra) # 802006c8 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80204292:	2184a703          	lw	a4,536(s1)
    80204296:	21c4a783          	lw	a5,540(s1)
    if(pr->killed){
      release(&pi->lock);
      return -1;
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    8020429a:	21848a93          	addi	s5,s1,536
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    8020429e:	02f71463          	bne	a4,a5,802042c6 <piperead+0x64>
    802042a2:	2244a783          	lw	a5,548(s1)
    802042a6:	c385                	beqz	a5,802042c6 <piperead+0x64>
    if(pr->killed){
    802042a8:	0309a783          	lw	a5,48(s3)
    802042ac:	e7d9                	bnez	a5,8020433a <piperead+0xd8>
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    802042ae:	85da                	mv	a1,s6
    802042b0:	8556                	mv	a0,s5
    802042b2:	ffffe097          	auipc	ra,0xffffe
    802042b6:	01a080e7          	jalr	26(ra) # 802022cc <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    802042ba:	2184a703          	lw	a4,536(s1)
    802042be:	21c4a783          	lw	a5,540(s1)
    802042c2:	fef700e3          	beq	a4,a5,802042a2 <piperead+0x40>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    802042c6:	09405163          	blez	s4,80204348 <piperead+0xe6>
    802042ca:	4981                	li	s3,0
    if(pi->nread == pi->nwrite)
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    // if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    if(copyout2(addr + i, &ch, 1) == -1)
    802042cc:	fbf40b13          	addi	s6,s0,-65
    802042d0:	5afd                	li	s5,-1
    if(pi->nread == pi->nwrite)
    802042d2:	2184a783          	lw	a5,536(s1)
    802042d6:	21c4a703          	lw	a4,540(s1)
    802042da:	02f70a63          	beq	a4,a5,8020430e <piperead+0xac>
    ch = pi->data[pi->nread++ % PIPESIZE];
    802042de:	0017871b          	addiw	a4,a5,1
    802042e2:	20e4ac23          	sw	a4,536(s1)
    802042e6:	1ff7f793          	andi	a5,a5,511
    802042ea:	97a6                	add	a5,a5,s1
    802042ec:	0187c783          	lbu	a5,24(a5)
    802042f0:	faf40fa3          	sb	a5,-65(s0)
    if(copyout2(addr + i, &ch, 1) == -1)
    802042f4:	4605                	li	a2,1
    802042f6:	85da                	mv	a1,s6
    802042f8:	854a                	mv	a0,s2
    802042fa:	ffffd097          	auipc	ra,0xffffd
    802042fe:	082080e7          	jalr	130(ra) # 8020137c <copyout2>
    80204302:	01550663          	beq	a0,s5,8020430e <piperead+0xac>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80204306:	2985                	addiw	s3,s3,1
    80204308:	0905                	addi	s2,s2,1
    8020430a:	fd3a14e3          	bne	s4,s3,802042d2 <piperead+0x70>
      break;
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    8020430e:	21c48513          	addi	a0,s1,540
    80204312:	ffffe097          	auipc	ra,0xffffe
    80204316:	13c080e7          	jalr	316(ra) # 8020244e <wakeup>
  release(&pi->lock);
    8020431a:	8526                	mv	a0,s1
    8020431c:	ffffc097          	auipc	ra,0xffffc
    80204320:	400080e7          	jalr	1024(ra) # 8020071c <release>
  return i;
}
    80204324:	854e                	mv	a0,s3
    80204326:	60a6                	ld	ra,72(sp)
    80204328:	6406                	ld	s0,64(sp)
    8020432a:	74e2                	ld	s1,56(sp)
    8020432c:	7942                	ld	s2,48(sp)
    8020432e:	79a2                	ld	s3,40(sp)
    80204330:	7a02                	ld	s4,32(sp)
    80204332:	6ae2                	ld	s5,24(sp)
    80204334:	6b42                	ld	s6,16(sp)
    80204336:	6161                	addi	sp,sp,80
    80204338:	8082                	ret
      release(&pi->lock);
    8020433a:	8526                	mv	a0,s1
    8020433c:	ffffc097          	auipc	ra,0xffffc
    80204340:	3e0080e7          	jalr	992(ra) # 8020071c <release>
      return -1;
    80204344:	59fd                	li	s3,-1
    80204346:	bff9                	j	80204324 <piperead+0xc2>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80204348:	4981                	li	s3,0
    8020434a:	b7d1                	j	8020430e <piperead+0xac>

000000008020434c <exec>:
  return 0;
}


int exec(char *path, char **argv)
{
    8020434c:	dd010113          	addi	sp,sp,-560
    80204350:	22113423          	sd	ra,552(sp)
    80204354:	22813023          	sd	s0,544(sp)
    80204358:	20913c23          	sd	s1,536(sp)
    8020435c:	21213823          	sd	s2,528(sp)
    80204360:	21313423          	sd	s3,520(sp)
    80204364:	21413023          	sd	s4,512(sp)
    80204368:	ffd6                	sd	s5,504(sp)
    8020436a:	fbda                	sd	s6,496(sp)
    8020436c:	f7de                	sd	s7,488(sp)
    8020436e:	f3e2                	sd	s8,480(sp)
    80204370:	efe6                	sd	s9,472(sp)
    80204372:	ebea                	sd	s10,464(sp)
    80204374:	e7ee                	sd	s11,456(sp)
    80204376:	1c00                	addi	s0,sp,560
    80204378:	892a                	mv	s2,a0
    8020437a:	dca43c23          	sd	a0,-552(s0)
    8020437e:	deb43423          	sd	a1,-536(s0)
  struct elfhdr elf;
  struct dirent *ep;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
  pagetable_t kpagetable = 0, oldkpagetable;
  struct proc *p = myproc();
    80204382:	ffffd097          	auipc	ra,0xffffd
    80204386:	6d6080e7          	jalr	1750(ra) # 80201a58 <myproc>
    8020438a:	84aa                	mv	s1,a0

  // Make a copy of p->kpt without old user space, 
  // but with the same kstack we are using now, which can't be changed
  if ((kpagetable = (pagetable_t)kalloc()) == NULL) {
    8020438c:	ffffc097          	auipc	ra,0xffffc
    80204390:	1d0080e7          	jalr	464(ra) # 8020055c <kalloc>
    80204394:	2a050763          	beqz	a0,80204642 <exec+0x2f6>
    80204398:	8aaa                	mv	s5,a0
    return -1;
  }
  memmove(kpagetable, p->kpagetable, PGSIZE);
    8020439a:	6605                	lui	a2,0x1
    8020439c:	6cac                	ld	a1,88(s1)
    8020439e:	ffffc097          	auipc	ra,0xffffc
    802043a2:	426080e7          	jalr	1062(ra) # 802007c4 <memmove>
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    kpagetable[i] = 0;
    802043a6:	000ab023          	sd	zero,0(s5)
    802043aa:	000ab423          	sd	zero,8(s5)
  }

  if((ep = ename(path)) == NULL) {
    802043ae:	854a                	mv	a0,s2
    802043b0:	00003097          	auipc	ra,0x3
    802043b4:	1cc080e7          	jalr	460(ra) # 8020757c <ename>
    802043b8:	8a2a                	mv	s4,a0
    802043ba:	3a050d63          	beqz	a0,80204774 <exec+0x428>
    #ifdef DEBUG
    printf("[exec] %s not found\n", path);
    #endif
    goto bad;
  }
  elock(ep);
    802043be:	00003097          	auipc	ra,0x3
    802043c2:	a14080e7          	jalr	-1516(ra) # 80206dd2 <elock>

  // Check ELF header
  if(eread(ep, 0, (uint64) &elf, 0, sizeof(elf)) != sizeof(elf))
    802043c6:	04000713          	li	a4,64
    802043ca:	4681                	li	a3,0
    802043cc:	e4840613          	addi	a2,s0,-440
    802043d0:	4581                	li	a1,0
    802043d2:	8552                	mv	a0,s4
    802043d4:	00002097          	auipc	ra,0x2
    802043d8:	114080e7          	jalr	276(ra) # 802064e8 <eread>
    802043dc:	04000793          	li	a5,64
    802043e0:	00f51a63          	bne	a0,a5,802043f4 <exec+0xa8>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    802043e4:	e4842703          	lw	a4,-440(s0)
    802043e8:	464c47b7          	lui	a5,0x464c4
    802043ec:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39d3ba81>
    802043f0:	00f70963          	beq	a4,a5,80204402 <exec+0xb6>
  printf("[exec] reach bad\n");
  #endif
  if(pagetable)
    proc_freepagetable(pagetable, sz);
  if(kpagetable)
    kvmfree(kpagetable, 0);
    802043f4:	4581                	li	a1,0
    802043f6:	8556                	mv	a0,s5
    802043f8:	ffffd097          	auipc	ra,0xffffd
    802043fc:	286080e7          	jalr	646(ra) # 8020167e <kvmfree>
  if(ep){
    80204400:	a4b5                	j	8020466c <exec+0x320>
  if((pagetable = proc_pagetable(p)) == NULL)
    80204402:	8526                	mv	a0,s1
    80204404:	ffffd097          	auipc	ra,0xffffd
    80204408:	738080e7          	jalr	1848(ra) # 80201b3c <proc_pagetable>
    8020440c:	e0a43423          	sd	a0,-504(s0)
    80204410:	d175                	beqz	a0,802043f4 <exec+0xa8>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80204412:	e6842783          	lw	a5,-408(s0)
    80204416:	e8045703          	lhu	a4,-384(s0)
    8020441a:	cb3d                	beqz	a4,80204490 <exec+0x144>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    8020441c:	4481                	li	s1,0
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8020441e:	e0043023          	sd	zero,-512(s0)
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80204422:	e1040713          	addi	a4,s0,-496
    80204426:	dee43023          	sd	a4,-544(s0)
    if(ph.vaddr % PGSIZE != 0)
    8020442a:	6b05                	lui	s6,0x1
    8020442c:	fffb0713          	addi	a4,s6,-1 # fff <_entry-0x801ff001>
    80204430:	dce43823          	sd	a4,-560(s0)
  for(i = 0; i < sz; i += PGSIZE){
    80204434:	6d85                	lui	s11,0x1
    80204436:	7bfd                	lui	s7,0xfffff
    80204438:	a4c1                	j	802046f8 <exec+0x3ac>
      panic("loadseg: address should exist");
    8020443a:	00005517          	auipc	a0,0x5
    8020443e:	7ae50513          	addi	a0,a0,1966 # 80209be8 <digits+0x868>
    80204442:	ffffc097          	auipc	ra,0xffffc
    80204446:	d00080e7          	jalr	-768(ra) # 80200142 <panic>
    if(eread(ep, 0, (uint64)pa, offset+i, n) != n)
    8020444a:	874e                	mv	a4,s3
    8020444c:	009d06bb          	addw	a3,s10,s1
    80204450:	4581                	li	a1,0
    80204452:	8552                	mv	a0,s4
    80204454:	00002097          	auipc	ra,0x2
    80204458:	094080e7          	jalr	148(ra) # 802064e8 <eread>
    8020445c:	2501                	sext.w	a0,a0
    8020445e:	1ea99663          	bne	s3,a0,8020464a <exec+0x2fe>
  for(i = 0; i < sz; i += PGSIZE){
    80204462:	009d84bb          	addw	s1,s11,s1
    80204466:	012b893b          	addw	s2,s7,s2
    8020446a:	2784f763          	bgeu	s1,s8,802046d8 <exec+0x38c>
    pa = walkaddr(pagetable, va + i);
    8020446e:	02049593          	slli	a1,s1,0x20
    80204472:	9181                	srli	a1,a1,0x20
    80204474:	95e6                	add	a1,a1,s9
    80204476:	e0843503          	ld	a0,-504(s0)
    8020447a:	ffffc097          	auipc	ra,0xffffc
    8020447e:	742080e7          	jalr	1858(ra) # 80200bbc <walkaddr>
    80204482:	862a                	mv	a2,a0
    if(pa == NULL)
    80204484:	d95d                	beqz	a0,8020443a <exec+0xee>
      n = PGSIZE;
    80204486:	89da                	mv	s3,s6
    if(sz - i < PGSIZE)
    80204488:	fd6971e3          	bgeu	s2,s6,8020444a <exec+0xfe>
      n = sz - i;
    8020448c:	89ca                	mv	s3,s2
    8020448e:	bf75                	j	8020444a <exec+0xfe>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    80204490:	4481                	li	s1,0
  eunlock(ep);
    80204492:	8552                	mv	a0,s4
    80204494:	00003097          	auipc	ra,0x3
    80204498:	974080e7          	jalr	-1676(ra) # 80206e08 <eunlock>
  eput(ep);
    8020449c:	8552                	mv	a0,s4
    8020449e:	00003097          	auipc	ra,0x3
    802044a2:	9b8080e7          	jalr	-1608(ra) # 80206e56 <eput>
  p = myproc();
    802044a6:	ffffd097          	auipc	ra,0xffffd
    802044aa:	5b2080e7          	jalr	1458(ra) # 80201a58 <myproc>
    802044ae:	8b2a                	mv	s6,a0
  uint64 oldsz = p->sz;
    802044b0:	04853d83          	ld	s11,72(a0)
  sz = PGROUNDUP(sz);
    802044b4:	6785                	lui	a5,0x1
    802044b6:	17fd                	addi	a5,a5,-1
    802044b8:	94be                	add	s1,s1,a5
    802044ba:	77fd                	lui	a5,0xfffff
    802044bc:	8fe5                	and	a5,a5,s1
    802044be:	def43823          	sd	a5,-528(s0)
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    802044c2:	6689                	lui	a3,0x2
    802044c4:	96be                	add	a3,a3,a5
    802044c6:	863e                	mv	a2,a5
    802044c8:	85d6                	mv	a1,s5
    802044ca:	e0843483          	ld	s1,-504(s0)
    802044ce:	8526                	mv	a0,s1
    802044d0:	ffffd097          	auipc	ra,0xffffd
    802044d4:	b48080e7          	jalr	-1208(ra) # 80201018 <uvmalloc>
    802044d8:	8d2a                	mv	s10,a0
  ep = 0;
    802044da:	4a01                	li	s4,0
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    802044dc:	16050763          	beqz	a0,8020464a <exec+0x2fe>
  uvmclear(pagetable, sz-2*PGSIZE);
    802044e0:	75f9                	lui	a1,0xffffe
    802044e2:	95aa                	add	a1,a1,a0
    802044e4:	8526                	mv	a0,s1
    802044e6:	ffffd097          	auipc	ra,0xffffd
    802044ea:	dd8080e7          	jalr	-552(ra) # 802012be <uvmclear>
  stackbase = sp - PGSIZE;
    802044ee:	7c7d                	lui	s8,0xfffff
    802044f0:	9c6a                	add	s8,s8,s10
  for(argc = 0; argv[argc]; argc++) {
    802044f2:	de843783          	ld	a5,-536(s0)
    802044f6:	6388                	ld	a0,0(a5)
    802044f8:	c925                	beqz	a0,80204568 <exec+0x21c>
    802044fa:	e8840993          	addi	s3,s0,-376
    802044fe:	f8840c93          	addi	s9,s0,-120
  sp = sz;
    80204502:	896a                	mv	s2,s10
  for(argc = 0; argv[argc]; argc++) {
    80204504:	4481                	li	s1,0
    sp -= strlen(argv[argc]) + 1;
    80204506:	ffffc097          	auipc	ra,0xffffc
    8020450a:	3e6080e7          	jalr	998(ra) # 802008ec <strlen>
    8020450e:	2505                	addiw	a0,a0,1
    80204510:	40a90933          	sub	s2,s2,a0
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    80204514:	ff097913          	andi	s2,s2,-16
    if(sp < stackbase)
    80204518:	1b896463          	bltu	s2,s8,802046c0 <exec+0x374>
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    8020451c:	de843b83          	ld	s7,-536(s0)
    80204520:	000bba03          	ld	s4,0(s7) # fffffffffffff000 <ebss_clear+0xffffffff7fdcc000>
    80204524:	8552                	mv	a0,s4
    80204526:	ffffc097          	auipc	ra,0xffffc
    8020452a:	3c6080e7          	jalr	966(ra) # 802008ec <strlen>
    8020452e:	0015069b          	addiw	a3,a0,1
    80204532:	8652                	mv	a2,s4
    80204534:	85ca                	mv	a1,s2
    80204536:	e0843503          	ld	a0,-504(s0)
    8020453a:	ffffd097          	auipc	ra,0xffffd
    8020453e:	db6080e7          	jalr	-586(ra) # 802012f0 <copyout>
    80204542:	18054363          	bltz	a0,802046c8 <exec+0x37c>
    ustack[argc] = sp;
    80204546:	0129b023          	sd	s2,0(s3)
  for(argc = 0; argv[argc]; argc++) {
    8020454a:	0485                	addi	s1,s1,1
    8020454c:	008b8793          	addi	a5,s7,8
    80204550:	def43423          	sd	a5,-536(s0)
    80204554:	008bb503          	ld	a0,8(s7)
    80204558:	c911                	beqz	a0,8020456c <exec+0x220>
    if(argc >= MAXARG)
    8020455a:	09a1                	addi	s3,s3,8
    8020455c:	fb3c95e3          	bne	s9,s3,80204506 <exec+0x1ba>
  sz = sz1;
    80204560:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    80204564:	4a01                	li	s4,0
    80204566:	a0d5                	j	8020464a <exec+0x2fe>
  sp = sz;
    80204568:	896a                	mv	s2,s10
  for(argc = 0; argv[argc]; argc++) {
    8020456a:	4481                	li	s1,0
  ustack[argc] = 0;
    8020456c:	00349793          	slli	a5,s1,0x3
    80204570:	f9040713          	addi	a4,s0,-112
    80204574:	97ba                	add	a5,a5,a4
    80204576:	ee07bc23          	sd	zero,-264(a5) # ffffffffffffeef8 <ebss_clear+0xffffffff7fdcbef8>
  sp -= (argc+1) * sizeof(uint64);
    8020457a:	00148693          	addi	a3,s1,1
    8020457e:	068e                	slli	a3,a3,0x3
    80204580:	40d90933          	sub	s2,s2,a3
  sp -= sp % 16;
    80204584:	ff097913          	andi	s2,s2,-16
  if(sp < stackbase)
    80204588:	01897663          	bgeu	s2,s8,80204594 <exec+0x248>
  sz = sz1;
    8020458c:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    80204590:	4a01                	li	s4,0
    80204592:	a865                	j	8020464a <exec+0x2fe>
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    80204594:	e8840613          	addi	a2,s0,-376
    80204598:	85ca                	mv	a1,s2
    8020459a:	e0843503          	ld	a0,-504(s0)
    8020459e:	ffffd097          	auipc	ra,0xffffd
    802045a2:	d52080e7          	jalr	-686(ra) # 802012f0 <copyout>
    802045a6:	12054563          	bltz	a0,802046d0 <exec+0x384>
  p->trapframe->a1 = sp;
    802045aa:	060b3783          	ld	a5,96(s6)
    802045ae:	0727bc23          	sd	s2,120(a5)
  for(last=s=path; *s; s++)
    802045b2:	dd843783          	ld	a5,-552(s0)
    802045b6:	0007c703          	lbu	a4,0(a5)
    802045ba:	cf11                	beqz	a4,802045d6 <exec+0x28a>
    802045bc:	0785                	addi	a5,a5,1
    if(*s == '/')
    802045be:	02f00693          	li	a3,47
    802045c2:	a029                	j	802045cc <exec+0x280>
  for(last=s=path; *s; s++)
    802045c4:	0785                	addi	a5,a5,1
    802045c6:	fff7c703          	lbu	a4,-1(a5)
    802045ca:	c711                	beqz	a4,802045d6 <exec+0x28a>
    if(*s == '/')
    802045cc:	fed71ce3          	bne	a4,a3,802045c4 <exec+0x278>
      last = s+1;
    802045d0:	dcf43c23          	sd	a5,-552(s0)
    802045d4:	bfc5                	j	802045c4 <exec+0x278>
  safestrcpy(p->name, last, sizeof(p->name));
    802045d6:	4641                	li	a2,16
    802045d8:	dd843583          	ld	a1,-552(s0)
    802045dc:	4e0b0513          	addi	a0,s6,1248
    802045e0:	ffffc097          	auipc	ra,0xffffc
    802045e4:	2da080e7          	jalr	730(ra) # 802008ba <safestrcpy>
  oldpagetable = p->pagetable;
    802045e8:	050b3503          	ld	a0,80(s6)
  oldkpagetable = p->kpagetable;
    802045ec:	058b3983          	ld	s3,88(s6)
  p->pagetable = pagetable;
    802045f0:	e0843783          	ld	a5,-504(s0)
    802045f4:	04fb3823          	sd	a5,80(s6)
  p->kpagetable = kpagetable;
    802045f8:	055b3c23          	sd	s5,88(s6)
  p->sz = sz;
    802045fc:	05ab3423          	sd	s10,72(s6)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80204600:	060b3783          	ld	a5,96(s6)
    80204604:	e6043703          	ld	a4,-416(s0)
    80204608:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    8020460a:	060b3783          	ld	a5,96(s6)
    8020460e:	0327b823          	sd	s2,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80204612:	85ee                	mv	a1,s11
    80204614:	ffffd097          	auipc	ra,0xffffd
    80204618:	5c4080e7          	jalr	1476(ra) # 80201bd8 <proc_freepagetable>
  w_satp(MAKE_SATP(p->kpagetable));
    8020461c:	058b3783          	ld	a5,88(s6)
    80204620:	83b1                	srli	a5,a5,0xc
    80204622:	577d                	li	a4,-1
    80204624:	177e                	slli	a4,a4,0x3f
    80204626:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    80204628:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    8020462c:	12000073          	sfence.vma
  kvmfree(oldkpagetable, 0);
    80204630:	4581                	li	a1,0
    80204632:	854e                	mv	a0,s3
    80204634:	ffffd097          	auipc	ra,0xffffd
    80204638:	04a080e7          	jalr	74(ra) # 8020167e <kvmfree>
  return argc; // this ends up in a0, the first argument to main(argc, argv)
    8020463c:	0004851b          	sext.w	a0,s1
    80204640:	a089                	j	80204682 <exec+0x336>
    return -1;
    80204642:	557d                	li	a0,-1
    80204644:	a83d                	j	80204682 <exec+0x336>
    80204646:	de943823          	sd	s1,-528(s0)
    proc_freepagetable(pagetable, sz);
    8020464a:	df043583          	ld	a1,-528(s0)
    8020464e:	e0843503          	ld	a0,-504(s0)
    80204652:	ffffd097          	auipc	ra,0xffffd
    80204656:	586080e7          	jalr	1414(ra) # 80201bd8 <proc_freepagetable>
    kvmfree(kpagetable, 0);
    8020465a:	4581                	li	a1,0
    8020465c:	8556                	mv	a0,s5
    8020465e:	ffffd097          	auipc	ra,0xffffd
    80204662:	020080e7          	jalr	32(ra) # 8020167e <kvmfree>
    eunlock(ep);
    eput(ep);
  }
  return -1;
    80204666:	557d                	li	a0,-1
  if(ep){
    80204668:	000a0d63          	beqz	s4,80204682 <exec+0x336>
    eunlock(ep);
    8020466c:	8552                	mv	a0,s4
    8020466e:	00002097          	auipc	ra,0x2
    80204672:	79a080e7          	jalr	1946(ra) # 80206e08 <eunlock>
    eput(ep);
    80204676:	8552                	mv	a0,s4
    80204678:	00002097          	auipc	ra,0x2
    8020467c:	7de080e7          	jalr	2014(ra) # 80206e56 <eput>
  return -1;
    80204680:	557d                	li	a0,-1
}
    80204682:	22813083          	ld	ra,552(sp)
    80204686:	22013403          	ld	s0,544(sp)
    8020468a:	21813483          	ld	s1,536(sp)
    8020468e:	21013903          	ld	s2,528(sp)
    80204692:	20813983          	ld	s3,520(sp)
    80204696:	20013a03          	ld	s4,512(sp)
    8020469a:	7afe                	ld	s5,504(sp)
    8020469c:	7b5e                	ld	s6,496(sp)
    8020469e:	7bbe                	ld	s7,488(sp)
    802046a0:	7c1e                	ld	s8,480(sp)
    802046a2:	6cfe                	ld	s9,472(sp)
    802046a4:	6d5e                	ld	s10,464(sp)
    802046a6:	6dbe                	ld	s11,456(sp)
    802046a8:	23010113          	addi	sp,sp,560
    802046ac:	8082                	ret
    802046ae:	de943823          	sd	s1,-528(s0)
    802046b2:	bf61                	j	8020464a <exec+0x2fe>
    802046b4:	de943823          	sd	s1,-528(s0)
    802046b8:	bf49                	j	8020464a <exec+0x2fe>
    802046ba:	de943823          	sd	s1,-528(s0)
    802046be:	b771                	j	8020464a <exec+0x2fe>
  sz = sz1;
    802046c0:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    802046c4:	4a01                	li	s4,0
    802046c6:	b751                	j	8020464a <exec+0x2fe>
  sz = sz1;
    802046c8:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    802046cc:	4a01                	li	s4,0
    802046ce:	bfb5                	j	8020464a <exec+0x2fe>
  sz = sz1;
    802046d0:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    802046d4:	4a01                	li	s4,0
    802046d6:	bf95                	j	8020464a <exec+0x2fe>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    802046d8:	df043483          	ld	s1,-528(s0)
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    802046dc:	e0043783          	ld	a5,-512(s0)
    802046e0:	0017869b          	addiw	a3,a5,1
    802046e4:	e0d43023          	sd	a3,-512(s0)
    802046e8:	df843783          	ld	a5,-520(s0)
    802046ec:	0387879b          	addiw	a5,a5,56
    802046f0:	e8045703          	lhu	a4,-384(s0)
    802046f4:	d8e6dfe3          	bge	a3,a4,80204492 <exec+0x146>
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    802046f8:	2781                	sext.w	a5,a5
    802046fa:	def43c23          	sd	a5,-520(s0)
    802046fe:	03800713          	li	a4,56
    80204702:	86be                	mv	a3,a5
    80204704:	de043603          	ld	a2,-544(s0)
    80204708:	4581                	li	a1,0
    8020470a:	8552                	mv	a0,s4
    8020470c:	00002097          	auipc	ra,0x2
    80204710:	ddc080e7          	jalr	-548(ra) # 802064e8 <eread>
    80204714:	03800793          	li	a5,56
    80204718:	f2f517e3          	bne	a0,a5,80204646 <exec+0x2fa>
    if(ph.type != ELF_PROG_LOAD)
    8020471c:	e1042783          	lw	a5,-496(s0)
    80204720:	4705                	li	a4,1
    80204722:	fae79de3          	bne	a5,a4,802046dc <exec+0x390>
    if(ph.memsz < ph.filesz)
    80204726:	e3843683          	ld	a3,-456(s0)
    8020472a:	e3043783          	ld	a5,-464(s0)
    8020472e:	f8f6e0e3          	bltu	a3,a5,802046ae <exec+0x362>
    if(ph.vaddr + ph.memsz < ph.vaddr)
    80204732:	e2043783          	ld	a5,-480(s0)
    80204736:	96be                	add	a3,a3,a5
    80204738:	f6f6eee3          	bltu	a3,a5,802046b4 <exec+0x368>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    8020473c:	8626                	mv	a2,s1
    8020473e:	85d6                	mv	a1,s5
    80204740:	e0843503          	ld	a0,-504(s0)
    80204744:	ffffd097          	auipc	ra,0xffffd
    80204748:	8d4080e7          	jalr	-1836(ra) # 80201018 <uvmalloc>
    8020474c:	dea43823          	sd	a0,-528(s0)
    80204750:	d52d                	beqz	a0,802046ba <exec+0x36e>
    if(ph.vaddr % PGSIZE != 0)
    80204752:	e2043c83          	ld	s9,-480(s0)
    80204756:	dd043783          	ld	a5,-560(s0)
    8020475a:	00fcf7b3          	and	a5,s9,a5
    8020475e:	ee0796e3          	bnez	a5,8020464a <exec+0x2fe>
    if(loadseg(pagetable, ph.vaddr, ep, ph.off, ph.filesz) < 0)
    80204762:	e1842d03          	lw	s10,-488(s0)
    80204766:	e3042c03          	lw	s8,-464(s0)
  for(i = 0; i < sz; i += PGSIZE){
    8020476a:	f60c07e3          	beqz	s8,802046d8 <exec+0x38c>
    8020476e:	8962                	mv	s2,s8
    80204770:	4481                	li	s1,0
    80204772:	b9f5                	j	8020446e <exec+0x122>
    kvmfree(kpagetable, 0);
    80204774:	4581                	li	a1,0
    80204776:	8556                	mv	a0,s5
    80204778:	ffffd097          	auipc	ra,0xffffd
    8020477c:	f06080e7          	jalr	-250(ra) # 8020167e <kvmfree>
  return -1;
    80204780:	557d                	li	a0,-1
    80204782:	b701                	j	80204682 <exec+0x336>

0000000080204784 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80204784:	7179                	addi	sp,sp,-48
    80204786:	f406                	sd	ra,40(sp)
    80204788:	f022                	sd	s0,32(sp)
    8020478a:	ec26                	sd	s1,24(sp)
    8020478c:	e84a                	sd	s2,16(sp)
    8020478e:	1800                	addi	s0,sp,48
    80204790:	892e                	mv	s2,a1
    80204792:	84b2                	mv	s1,a2
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    80204794:	fdc40593          	addi	a1,s0,-36
    80204798:	ffffe097          	auipc	ra,0xffffe
    8020479c:	788080e7          	jalr	1928(ra) # 80202f20 <argint>
    802047a0:	04054163          	bltz	a0,802047e2 <argfd+0x5e>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == NULL)
    802047a4:	fdc42703          	lw	a4,-36(s0)
    802047a8:	07f00793          	li	a5,127
    802047ac:	02e7ed63          	bltu	a5,a4,802047e6 <argfd+0x62>
    802047b0:	ffffd097          	auipc	ra,0xffffd
    802047b4:	2a8080e7          	jalr	680(ra) # 80201a58 <myproc>
    802047b8:	fdc42703          	lw	a4,-36(s0)
    802047bc:	01a70793          	addi	a5,a4,26
    802047c0:	078e                	slli	a5,a5,0x3
    802047c2:	953e                	add	a0,a0,a5
    802047c4:	651c                	ld	a5,8(a0)
    802047c6:	c395                	beqz	a5,802047ea <argfd+0x66>
    return -1;
  if(pfd)
    802047c8:	00090463          	beqz	s2,802047d0 <argfd+0x4c>
    *pfd = fd;
    802047cc:	00e92023          	sw	a4,0(s2)
  if(pf)
    *pf = f;
  return 0;
    802047d0:	4501                	li	a0,0
  if(pf)
    802047d2:	c091                	beqz	s1,802047d6 <argfd+0x52>
    *pf = f;
    802047d4:	e09c                	sd	a5,0(s1)
}
    802047d6:	70a2                	ld	ra,40(sp)
    802047d8:	7402                	ld	s0,32(sp)
    802047da:	64e2                	ld	s1,24(sp)
    802047dc:	6942                	ld	s2,16(sp)
    802047de:	6145                	addi	sp,sp,48
    802047e0:	8082                	ret
    return -1;
    802047e2:	557d                	li	a0,-1
    802047e4:	bfcd                	j	802047d6 <argfd+0x52>
    return -1;
    802047e6:	557d                	li	a0,-1
    802047e8:	b7fd                	j	802047d6 <argfd+0x52>
    802047ea:	557d                	li	a0,-1
    802047ec:	b7ed                	j	802047d6 <argfd+0x52>

00000000802047ee <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    802047ee:	1101                	addi	sp,sp,-32
    802047f0:	ec06                	sd	ra,24(sp)
    802047f2:	e822                	sd	s0,16(sp)
    802047f4:	e426                	sd	s1,8(sp)
    802047f6:	1000                	addi	s0,sp,32
    802047f8:	84aa                	mv	s1,a0
  int fd;
  struct proc *p = myproc();
    802047fa:	ffffd097          	auipc	ra,0xffffd
    802047fe:	25e080e7          	jalr	606(ra) # 80201a58 <myproc>
    80204802:	862a                	mv	a2,a0

  for(fd = 0; fd < NOFILE; fd++){
    80204804:	0d850793          	addi	a5,a0,216
    80204808:	4501                	li	a0,0
    8020480a:	08000693          	li	a3,128
    if(p->ofile[fd] == 0){
    8020480e:	6398                	ld	a4,0(a5)
    80204810:	c719                	beqz	a4,8020481e <fdalloc+0x30>
  for(fd = 0; fd < NOFILE; fd++){
    80204812:	2505                	addiw	a0,a0,1
    80204814:	07a1                	addi	a5,a5,8
    80204816:	fed51ce3          	bne	a0,a3,8020480e <fdalloc+0x20>
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
    8020481a:	557d                	li	a0,-1
    8020481c:	a031                	j	80204828 <fdalloc+0x3a>
      p->ofile[fd] = f;
    8020481e:	01a50793          	addi	a5,a0,26
    80204822:	078e                	slli	a5,a5,0x3
    80204824:	963e                	add	a2,a2,a5
    80204826:	e604                	sd	s1,8(a2)
}
    80204828:	60e2                	ld	ra,24(sp)
    8020482a:	6442                	ld	s0,16(sp)
    8020482c:	64a2                	ld	s1,8(sp)
    8020482e:	6105                	addi	sp,sp,32
    80204830:	8082                	ret

0000000080204832 <create>:
  return filestat(f, st);
}

static struct dirent*
create(char *path, short type, int mode)
{
    80204832:	7169                	addi	sp,sp,-304
    80204834:	f606                	sd	ra,296(sp)
    80204836:	f222                	sd	s0,288(sp)
    80204838:	ee26                	sd	s1,280(sp)
    8020483a:	ea4a                	sd	s2,272(sp)
    8020483c:	e64e                	sd	s3,264(sp)
    8020483e:	1a00                	addi	s0,sp,304
    80204840:	89ae                	mv	s3,a1
  struct dirent *ep, *dp;
  char name[FAT32_MAX_FILENAME + 1];

  if((dp = enameparent(path, name)) == NULL)
    80204842:	ed040593          	addi	a1,s0,-304
    80204846:	00003097          	auipc	ra,0x3
    8020484a:	d54080e7          	jalr	-684(ra) # 8020759a <enameparent>
    8020484e:	84aa                	mv	s1,a0
    80204850:	cd3d                	beqz	a0,802048ce <create+0x9c>
    return NULL;

  if (type == T_DIR) {
    80204852:	0009879b          	sext.w	a5,s3
    80204856:	4705                	li	a4,1
    80204858:	06e78d63          	beq	a5,a4,802048d2 <create+0xa0>
    mode = ATTR_READ_ONLY;
  } else {
    mode = 0;  
  }

  elock(dp);
    8020485c:	00002097          	auipc	ra,0x2
    80204860:	576080e7          	jalr	1398(ra) # 80206dd2 <elock>
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    80204864:	4601                	li	a2,0
    80204866:	ed040593          	addi	a1,s0,-304
    8020486a:	8526                	mv	a0,s1
    8020486c:	00003097          	auipc	ra,0x3
    80204870:	a58080e7          	jalr	-1448(ra) # 802072c4 <ealloc>
    80204874:	892a                	mv	s2,a0
    80204876:	c121                	beqz	a0,802048b6 <create+0x84>
    eunlock(dp);
    eput(dp);
    return NULL;
  }
  
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204878:	2981                	sext.w	s3,s3
    8020487a:	4789                	li	a5,2
    8020487c:	00f99663          	bne	s3,a5,80204888 <create+0x56>
      (type == T_FILE && (ep->attribute & ATTR_DIRECTORY))) {
    80204880:	10094783          	lbu	a5,256(s2)
    80204884:	8bc1                	andi	a5,a5,16
    80204886:	eba5                	bnez	a5,802048f6 <create+0xc4>
    eput(ep);
    eput(dp);
    return NULL;
  }

  eunlock(dp);
    80204888:	8526                	mv	a0,s1
    8020488a:	00002097          	auipc	ra,0x2
    8020488e:	57e080e7          	jalr	1406(ra) # 80206e08 <eunlock>
  eput(dp);
    80204892:	8526                	mv	a0,s1
    80204894:	00002097          	auipc	ra,0x2
    80204898:	5c2080e7          	jalr	1474(ra) # 80206e56 <eput>

  elock(ep);
    8020489c:	854a                	mv	a0,s2
    8020489e:	00002097          	auipc	ra,0x2
    802048a2:	534080e7          	jalr	1332(ra) # 80206dd2 <elock>
  return ep;
}
    802048a6:	854a                	mv	a0,s2
    802048a8:	70b2                	ld	ra,296(sp)
    802048aa:	7412                	ld	s0,288(sp)
    802048ac:	64f2                	ld	s1,280(sp)
    802048ae:	6952                	ld	s2,272(sp)
    802048b0:	69b2                	ld	s3,264(sp)
    802048b2:	6155                	addi	sp,sp,304
    802048b4:	8082                	ret
    eunlock(dp);
    802048b6:	8526                	mv	a0,s1
    802048b8:	00002097          	auipc	ra,0x2
    802048bc:	550080e7          	jalr	1360(ra) # 80206e08 <eunlock>
    eput(dp);
    802048c0:	8526                	mv	a0,s1
    802048c2:	00002097          	auipc	ra,0x2
    802048c6:	594080e7          	jalr	1428(ra) # 80206e56 <eput>
    return NULL;
    802048ca:	4901                	li	s2,0
    802048cc:	bfe9                	j	802048a6 <create+0x74>
    return NULL;
    802048ce:	892a                	mv	s2,a0
    802048d0:	bfd9                	j	802048a6 <create+0x74>
  elock(dp);
    802048d2:	00002097          	auipc	ra,0x2
    802048d6:	500080e7          	jalr	1280(ra) # 80206dd2 <elock>
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    802048da:	4641                	li	a2,16
    802048dc:	ed040593          	addi	a1,s0,-304
    802048e0:	8526                	mv	a0,s1
    802048e2:	00003097          	auipc	ra,0x3
    802048e6:	9e2080e7          	jalr	-1566(ra) # 802072c4 <ealloc>
    802048ea:	892a                	mv	s2,a0
    802048ec:	d569                	beqz	a0,802048b6 <create+0x84>
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    802048ee:	10094783          	lbu	a5,256(s2)
    802048f2:	8bc1                	andi	a5,a5,16
    802048f4:	fbd1                	bnez	a5,80204888 <create+0x56>
    eunlock(dp);
    802048f6:	8526                	mv	a0,s1
    802048f8:	00002097          	auipc	ra,0x2
    802048fc:	510080e7          	jalr	1296(ra) # 80206e08 <eunlock>
    eput(ep);
    80204900:	854a                	mv	a0,s2
    80204902:	00002097          	auipc	ra,0x2
    80204906:	554080e7          	jalr	1364(ra) # 80206e56 <eput>
    eput(dp);
    8020490a:	8526                	mv	a0,s1
    8020490c:	00002097          	auipc	ra,0x2
    80204910:	54a080e7          	jalr	1354(ra) # 80206e56 <eput>
    return NULL;
    80204914:	4901                	li	s2,0
    80204916:	bf41                	j	802048a6 <create+0x74>

0000000080204918 <sys_dup>:
{
    80204918:	7179                	addi	sp,sp,-48
    8020491a:	f406                	sd	ra,40(sp)
    8020491c:	f022                	sd	s0,32(sp)
    8020491e:	ec26                	sd	s1,24(sp)
    80204920:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0)
    80204922:	fd840613          	addi	a2,s0,-40
    80204926:	4581                	li	a1,0
    80204928:	4501                	li	a0,0
    8020492a:	00000097          	auipc	ra,0x0
    8020492e:	e5a080e7          	jalr	-422(ra) # 80204784 <argfd>
    return -1;
    80204932:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0)
    80204934:	02054363          	bltz	a0,8020495a <sys_dup+0x42>
  if((fd=fdalloc(f)) < 0)
    80204938:	fd843503          	ld	a0,-40(s0)
    8020493c:	00000097          	auipc	ra,0x0
    80204940:	eb2080e7          	jalr	-334(ra) # 802047ee <fdalloc>
    80204944:	84aa                	mv	s1,a0
    return -1;
    80204946:	57fd                	li	a5,-1
  if((fd=fdalloc(f)) < 0)
    80204948:	00054963          	bltz	a0,8020495a <sys_dup+0x42>
  filedup(f);
    8020494c:	fd843503          	ld	a0,-40(s0)
    80204950:	fffff097          	auipc	ra,0xfffff
    80204954:	2da080e7          	jalr	730(ra) # 80203c2a <filedup>
  return fd;
    80204958:	87a6                	mv	a5,s1
}
    8020495a:	853e                	mv	a0,a5
    8020495c:	70a2                	ld	ra,40(sp)
    8020495e:	7402                	ld	s0,32(sp)
    80204960:	64e2                	ld	s1,24(sp)
    80204962:	6145                	addi	sp,sp,48
    80204964:	8082                	ret

0000000080204966 <sys_read>:
{
    80204966:	7179                	addi	sp,sp,-48
    80204968:	f406                	sd	ra,40(sp)
    8020496a:	f022                	sd	s0,32(sp)
    8020496c:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020496e:	fe840613          	addi	a2,s0,-24
    80204972:	4581                	li	a1,0
    80204974:	4501                	li	a0,0
    80204976:	00000097          	auipc	ra,0x0
    8020497a:	e0e080e7          	jalr	-498(ra) # 80204784 <argfd>
    return -1;
    8020497e:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204980:	04054163          	bltz	a0,802049c2 <sys_read+0x5c>
    80204984:	fe440593          	addi	a1,s0,-28
    80204988:	4509                	li	a0,2
    8020498a:	ffffe097          	auipc	ra,0xffffe
    8020498e:	596080e7          	jalr	1430(ra) # 80202f20 <argint>
    return -1;
    80204992:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204994:	02054763          	bltz	a0,802049c2 <sys_read+0x5c>
    80204998:	fd840593          	addi	a1,s0,-40
    8020499c:	4505                	li	a0,1
    8020499e:	ffffe097          	auipc	ra,0xffffe
    802049a2:	5e4080e7          	jalr	1508(ra) # 80202f82 <argaddr>
    return -1;
    802049a6:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802049a8:	00054d63          	bltz	a0,802049c2 <sys_read+0x5c>
  return fileread(f, p, n);
    802049ac:	fe442603          	lw	a2,-28(s0)
    802049b0:	fd843583          	ld	a1,-40(s0)
    802049b4:	fe843503          	ld	a0,-24(s0)
    802049b8:	fffff097          	auipc	ra,0xfffff
    802049bc:	3de080e7          	jalr	990(ra) # 80203d96 <fileread>
    802049c0:	87aa                	mv	a5,a0
}
    802049c2:	853e                	mv	a0,a5
    802049c4:	70a2                	ld	ra,40(sp)
    802049c6:	7402                	ld	s0,32(sp)
    802049c8:	6145                	addi	sp,sp,48
    802049ca:	8082                	ret

00000000802049cc <sys_write>:
{
    802049cc:	7179                	addi	sp,sp,-48
    802049ce:	f406                	sd	ra,40(sp)
    802049d0:	f022                	sd	s0,32(sp)
    802049d2:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802049d4:	fe840613          	addi	a2,s0,-24
    802049d8:	4581                	li	a1,0
    802049da:	4501                	li	a0,0
    802049dc:	00000097          	auipc	ra,0x0
    802049e0:	da8080e7          	jalr	-600(ra) # 80204784 <argfd>
    return -1;
    802049e4:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802049e6:	04054163          	bltz	a0,80204a28 <sys_write+0x5c>
    802049ea:	fe440593          	addi	a1,s0,-28
    802049ee:	4509                	li	a0,2
    802049f0:	ffffe097          	auipc	ra,0xffffe
    802049f4:	530080e7          	jalr	1328(ra) # 80202f20 <argint>
    return -1;
    802049f8:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802049fa:	02054763          	bltz	a0,80204a28 <sys_write+0x5c>
    802049fe:	fd840593          	addi	a1,s0,-40
    80204a02:	4505                	li	a0,1
    80204a04:	ffffe097          	auipc	ra,0xffffe
    80204a08:	57e080e7          	jalr	1406(ra) # 80202f82 <argaddr>
    return -1;
    80204a0c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204a0e:	00054d63          	bltz	a0,80204a28 <sys_write+0x5c>
  return filewrite(f, p, n);
    80204a12:	fe442603          	lw	a2,-28(s0)
    80204a16:	fd843583          	ld	a1,-40(s0)
    80204a1a:	fe843503          	ld	a0,-24(s0)
    80204a1e:	fffff097          	auipc	ra,0xfffff
    80204a22:	43a080e7          	jalr	1082(ra) # 80203e58 <filewrite>
    80204a26:	87aa                	mv	a5,a0
}
    80204a28:	853e                	mv	a0,a5
    80204a2a:	70a2                	ld	ra,40(sp)
    80204a2c:	7402                	ld	s0,32(sp)
    80204a2e:	6145                	addi	sp,sp,48
    80204a30:	8082                	ret

0000000080204a32 <sys_close>:
{
    80204a32:	1101                	addi	sp,sp,-32
    80204a34:	ec06                	sd	ra,24(sp)
    80204a36:	e822                	sd	s0,16(sp)
    80204a38:	1000                	addi	s0,sp,32
  if(argfd(0, &fd, &f) < 0)
    80204a3a:	fe040613          	addi	a2,s0,-32
    80204a3e:	fec40593          	addi	a1,s0,-20
    80204a42:	4501                	li	a0,0
    80204a44:	00000097          	auipc	ra,0x0
    80204a48:	d40080e7          	jalr	-704(ra) # 80204784 <argfd>
    return -1;
    80204a4c:	57fd                	li	a5,-1
  if(argfd(0, &fd, &f) < 0)
    80204a4e:	02054463          	bltz	a0,80204a76 <sys_close+0x44>
  myproc()->ofile[fd] = 0;
    80204a52:	ffffd097          	auipc	ra,0xffffd
    80204a56:	006080e7          	jalr	6(ra) # 80201a58 <myproc>
    80204a5a:	fec42783          	lw	a5,-20(s0)
    80204a5e:	07e9                	addi	a5,a5,26
    80204a60:	078e                	slli	a5,a5,0x3
    80204a62:	97aa                	add	a5,a5,a0
    80204a64:	0007b423          	sd	zero,8(a5)
  fileclose(f);
    80204a68:	fe043503          	ld	a0,-32(s0)
    80204a6c:	fffff097          	auipc	ra,0xfffff
    80204a70:	210080e7          	jalr	528(ra) # 80203c7c <fileclose>
  return 0;
    80204a74:	4781                	li	a5,0
}
    80204a76:	853e                	mv	a0,a5
    80204a78:	60e2                	ld	ra,24(sp)
    80204a7a:	6442                	ld	s0,16(sp)
    80204a7c:	6105                	addi	sp,sp,32
    80204a7e:	8082                	ret

0000000080204a80 <sys_fstat>:
{
    80204a80:	1101                	addi	sp,sp,-32
    80204a82:	ec06                	sd	ra,24(sp)
    80204a84:	e822                	sd	s0,16(sp)
    80204a86:	1000                	addi	s0,sp,32
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204a88:	fe840613          	addi	a2,s0,-24
    80204a8c:	4581                	li	a1,0
    80204a8e:	4501                	li	a0,0
    80204a90:	00000097          	auipc	ra,0x0
    80204a94:	cf4080e7          	jalr	-780(ra) # 80204784 <argfd>
    return -1;
    80204a98:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204a9a:	02054563          	bltz	a0,80204ac4 <sys_fstat+0x44>
    80204a9e:	fe040593          	addi	a1,s0,-32
    80204aa2:	4505                	li	a0,1
    80204aa4:	ffffe097          	auipc	ra,0xffffe
    80204aa8:	4de080e7          	jalr	1246(ra) # 80202f82 <argaddr>
    return -1;
    80204aac:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204aae:	00054b63          	bltz	a0,80204ac4 <sys_fstat+0x44>
  return filestat(f, st);
    80204ab2:	fe043583          	ld	a1,-32(s0)
    80204ab6:	fe843503          	ld	a0,-24(s0)
    80204aba:	fffff097          	auipc	ra,0xfffff
    80204abe:	278080e7          	jalr	632(ra) # 80203d32 <filestat>
    80204ac2:	87aa                	mv	a5,a0
}
    80204ac4:	853e                	mv	a0,a5
    80204ac6:	60e2                	ld	ra,24(sp)
    80204ac8:	6442                	ld	s0,16(sp)
    80204aca:	6105                	addi	sp,sp,32
    80204acc:	8082                	ret

0000000080204ace <sys_open>:

uint64
sys_open(void)
{
    80204ace:	7129                	addi	sp,sp,-320
    80204ad0:	fe06                	sd	ra,312(sp)
    80204ad2:	fa22                	sd	s0,304(sp)
    80204ad4:	f626                	sd	s1,296(sp)
    80204ad6:	f24a                	sd	s2,288(sp)
    80204ad8:	ee4e                	sd	s3,280(sp)
    80204ada:	0280                	addi	s0,sp,320
  char path[FAT32_MAX_PATH];
  int fd, omode;
  struct file *f;
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204adc:	10400613          	li	a2,260
    80204ae0:	ec840593          	addi	a1,s0,-312
    80204ae4:	4501                	li	a0,0
    80204ae6:	ffffe097          	auipc	ra,0xffffe
    80204aea:	4be080e7          	jalr	1214(ra) # 80202fa4 <argstr>
    80204aee:	87aa                	mv	a5,a0
    return -1;
    80204af0:	557d                	li	a0,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204af2:	0807ce63          	bltz	a5,80204b8e <sys_open+0xc0>
    80204af6:	ec440593          	addi	a1,s0,-316
    80204afa:	4505                	li	a0,1
    80204afc:	ffffe097          	auipc	ra,0xffffe
    80204b00:	424080e7          	jalr	1060(ra) # 80202f20 <argint>
    80204b04:	0e054163          	bltz	a0,80204be6 <sys_open+0x118>

  if(omode & O_CREATE){
    80204b08:	ec442603          	lw	a2,-316(s0)
    80204b0c:	24067793          	andi	a5,a2,576
    80204b10:	c7d1                	beqz	a5,80204b9c <sys_open+0xce>
    ep = create(path, T_FILE, omode);
    80204b12:	4589                	li	a1,2
    80204b14:	ec840513          	addi	a0,s0,-312
    80204b18:	00000097          	auipc	ra,0x0
    80204b1c:	d1a080e7          	jalr	-742(ra) # 80204832 <create>
    80204b20:	892a                	mv	s2,a0
    if(ep == NULL){
    80204b22:	c561                	beqz	a0,80204bea <sys_open+0x11c>
      eput(ep);
      return -1;
    }
  }

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204b24:	fffff097          	auipc	ra,0xfffff
    80204b28:	09c080e7          	jalr	156(ra) # 80203bc0 <filealloc>
    80204b2c:	89aa                	mv	s3,a0
    80204b2e:	c579                	beqz	a0,80204bfc <sys_open+0x12e>
    80204b30:	00000097          	auipc	ra,0x0
    80204b34:	cbe080e7          	jalr	-834(ra) # 802047ee <fdalloc>
    80204b38:	84aa                	mv	s1,a0
    80204b3a:	0a054c63          	bltz	a0,80204bf2 <sys_open+0x124>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    80204b3e:	10094783          	lbu	a5,256(s2)
    80204b42:	8bc1                	andi	a5,a5,16
    80204b44:	e791                	bnez	a5,80204b50 <sys_open+0x82>
    80204b46:	ec442783          	lw	a5,-316(s0)
    80204b4a:	4007f793          	andi	a5,a5,1024
    80204b4e:	e7d1                	bnez	a5,80204bda <sys_open+0x10c>
    etrunc(ep);
  }

  f->type = FD_ENTRY;
    80204b50:	4789                	li	a5,2
    80204b52:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    80204b56:	ec442783          	lw	a5,-316(s0)
    80204b5a:	0047f693          	andi	a3,a5,4
    80204b5e:	4701                	li	a4,0
    80204b60:	c299                	beqz	a3,80204b66 <sys_open+0x98>
    80204b62:	10892703          	lw	a4,264(s2)
    80204b66:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    80204b6a:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    80204b6e:	0017c713          	xori	a4,a5,1
    80204b72:	8b05                	andi	a4,a4,1
    80204b74:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204b78:	8b8d                	andi	a5,a5,3
    80204b7a:	00f037b3          	snez	a5,a5
    80204b7e:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    80204b82:	854a                	mv	a0,s2
    80204b84:	00002097          	auipc	ra,0x2
    80204b88:	284080e7          	jalr	644(ra) # 80206e08 <eunlock>

  return fd;
    80204b8c:	8526                	mv	a0,s1
}
    80204b8e:	70f2                	ld	ra,312(sp)
    80204b90:	7452                	ld	s0,304(sp)
    80204b92:	74b2                	ld	s1,296(sp)
    80204b94:	7912                	ld	s2,288(sp)
    80204b96:	69f2                	ld	s3,280(sp)
    80204b98:	6131                	addi	sp,sp,320
    80204b9a:	8082                	ret
    if((ep = ename(path)) == NULL){
    80204b9c:	ec840513          	addi	a0,s0,-312
    80204ba0:	00003097          	auipc	ra,0x3
    80204ba4:	9dc080e7          	jalr	-1572(ra) # 8020757c <ename>
    80204ba8:	892a                	mv	s2,a0
    80204baa:	c131                	beqz	a0,80204bee <sys_open+0x120>
    elock(ep);
    80204bac:	00002097          	auipc	ra,0x2
    80204bb0:	226080e7          	jalr	550(ra) # 80206dd2 <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    80204bb4:	10094783          	lbu	a5,256(s2)
    80204bb8:	8bc1                	andi	a5,a5,16
    80204bba:	d7ad                	beqz	a5,80204b24 <sys_open+0x56>
    80204bbc:	ec442783          	lw	a5,-316(s0)
    80204bc0:	d3b5                	beqz	a5,80204b24 <sys_open+0x56>
      eunlock(ep);
    80204bc2:	854a                	mv	a0,s2
    80204bc4:	00002097          	auipc	ra,0x2
    80204bc8:	244080e7          	jalr	580(ra) # 80206e08 <eunlock>
      eput(ep);
    80204bcc:	854a                	mv	a0,s2
    80204bce:	00002097          	auipc	ra,0x2
    80204bd2:	288080e7          	jalr	648(ra) # 80206e56 <eput>
      return -1;
    80204bd6:	557d                	li	a0,-1
    80204bd8:	bf5d                	j	80204b8e <sys_open+0xc0>
    etrunc(ep);
    80204bda:	854a                	mv	a0,s2
    80204bdc:	00002097          	auipc	ra,0x2
    80204be0:	18c080e7          	jalr	396(ra) # 80206d68 <etrunc>
    80204be4:	b7b5                	j	80204b50 <sys_open+0x82>
    return -1;
    80204be6:	557d                	li	a0,-1
    80204be8:	b75d                	j	80204b8e <sys_open+0xc0>
      return -1;
    80204bea:	557d                	li	a0,-1
    80204bec:	b74d                	j	80204b8e <sys_open+0xc0>
      return -1;
    80204bee:	557d                	li	a0,-1
    80204bf0:	bf79                	j	80204b8e <sys_open+0xc0>
      fileclose(f);
    80204bf2:	854e                	mv	a0,s3
    80204bf4:	fffff097          	auipc	ra,0xfffff
    80204bf8:	088080e7          	jalr	136(ra) # 80203c7c <fileclose>
    eunlock(ep);
    80204bfc:	854a                	mv	a0,s2
    80204bfe:	00002097          	auipc	ra,0x2
    80204c02:	20a080e7          	jalr	522(ra) # 80206e08 <eunlock>
    eput(ep);
    80204c06:	854a                	mv	a0,s2
    80204c08:	00002097          	auipc	ra,0x2
    80204c0c:	24e080e7          	jalr	590(ra) # 80206e56 <eput>
    return -1;
    80204c10:	557d                	li	a0,-1
    80204c12:	bfb5                	j	80204b8e <sys_open+0xc0>

0000000080204c14 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80204c14:	7169                	addi	sp,sp,-304
    80204c16:	f606                	sd	ra,296(sp)
    80204c18:	f222                	sd	s0,288(sp)
    80204c1a:	ee26                	sd	s1,280(sp)
    80204c1c:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;

  if(argstr(1, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204c1e:	10400613          	li	a2,260
    80204c22:	ed840593          	addi	a1,s0,-296
    80204c26:	4505                	li	a0,1
    80204c28:	ffffe097          	auipc	ra,0xffffe
    80204c2c:	37c080e7          	jalr	892(ra) # 80202fa4 <argstr>
    return -1;
    80204c30:	57fd                	li	a5,-1
  if(argstr(1, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204c32:	02054663          	bltz	a0,80204c5e <sys_mkdir+0x4a>
    80204c36:	4601                	li	a2,0
    80204c38:	4585                	li	a1,1
    80204c3a:	ed840513          	addi	a0,s0,-296
    80204c3e:	00000097          	auipc	ra,0x0
    80204c42:	bf4080e7          	jalr	-1036(ra) # 80204832 <create>
    80204c46:	84aa                	mv	s1,a0
    80204c48:	c10d                	beqz	a0,80204c6a <sys_mkdir+0x56>
  }
  eunlock(ep);
    80204c4a:	00002097          	auipc	ra,0x2
    80204c4e:	1be080e7          	jalr	446(ra) # 80206e08 <eunlock>
  eput(ep);
    80204c52:	8526                	mv	a0,s1
    80204c54:	00002097          	auipc	ra,0x2
    80204c58:	202080e7          	jalr	514(ra) # 80206e56 <eput>
  return 0;
    80204c5c:	4781                	li	a5,0
}
    80204c5e:	853e                	mv	a0,a5
    80204c60:	70b2                	ld	ra,296(sp)
    80204c62:	7412                	ld	s0,288(sp)
    80204c64:	64f2                	ld	s1,280(sp)
    80204c66:	6155                	addi	sp,sp,304
    80204c68:	8082                	ret
    return -1;
    80204c6a:	57fd                	li	a5,-1
    80204c6c:	bfcd                	j	80204c5e <sys_mkdir+0x4a>

0000000080204c6e <sys_chdir>:

uint64
sys_chdir(void)
{
    80204c6e:	7169                	addi	sp,sp,-304
    80204c70:	f606                	sd	ra,296(sp)
    80204c72:	f222                	sd	s0,288(sp)
    80204c74:	ee26                	sd	s1,280(sp)
    80204c76:	ea4a                	sd	s2,272(sp)
    80204c78:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  struct proc *p = myproc();
    80204c7a:	ffffd097          	auipc	ra,0xffffd
    80204c7e:	dde080e7          	jalr	-546(ra) # 80201a58 <myproc>
    80204c82:	892a                	mv	s2,a0
  
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204c84:	10400613          	li	a2,260
    80204c88:	ed840593          	addi	a1,s0,-296
    80204c8c:	4501                	li	a0,0
    80204c8e:	ffffe097          	auipc	ra,0xffffe
    80204c92:	316080e7          	jalr	790(ra) # 80202fa4 <argstr>
    return -1;
    80204c96:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204c98:	04054063          	bltz	a0,80204cd8 <sys_chdir+0x6a>
    80204c9c:	ed840513          	addi	a0,s0,-296
    80204ca0:	00003097          	auipc	ra,0x3
    80204ca4:	8dc080e7          	jalr	-1828(ra) # 8020757c <ename>
    80204ca8:	84aa                	mv	s1,a0
    80204caa:	c931                	beqz	a0,80204cfe <sys_chdir+0x90>
  }
  elock(ep);
    80204cac:	00002097          	auipc	ra,0x2
    80204cb0:	126080e7          	jalr	294(ra) # 80206dd2 <elock>
  if(!(ep->attribute & ATTR_DIRECTORY)){
    80204cb4:	1004c783          	lbu	a5,256(s1)
    80204cb8:	8bc1                	andi	a5,a5,16
    80204cba:	c795                	beqz	a5,80204ce6 <sys_chdir+0x78>
    eunlock(ep);
    eput(ep);
    return -1;
  }
  eunlock(ep);
    80204cbc:	8526                	mv	a0,s1
    80204cbe:	00002097          	auipc	ra,0x2
    80204cc2:	14a080e7          	jalr	330(ra) # 80206e08 <eunlock>
  eput(p->cwd);
    80204cc6:	4d893503          	ld	a0,1240(s2)
    80204cca:	00002097          	auipc	ra,0x2
    80204cce:	18c080e7          	jalr	396(ra) # 80206e56 <eput>
  p->cwd = ep;
    80204cd2:	4c993c23          	sd	s1,1240(s2)
  return 0;
    80204cd6:	4781                	li	a5,0
}
    80204cd8:	853e                	mv	a0,a5
    80204cda:	70b2                	ld	ra,296(sp)
    80204cdc:	7412                	ld	s0,288(sp)
    80204cde:	64f2                	ld	s1,280(sp)
    80204ce0:	6952                	ld	s2,272(sp)
    80204ce2:	6155                	addi	sp,sp,304
    80204ce4:	8082                	ret
    eunlock(ep);
    80204ce6:	8526                	mv	a0,s1
    80204ce8:	00002097          	auipc	ra,0x2
    80204cec:	120080e7          	jalr	288(ra) # 80206e08 <eunlock>
    eput(ep);
    80204cf0:	8526                	mv	a0,s1
    80204cf2:	00002097          	auipc	ra,0x2
    80204cf6:	164080e7          	jalr	356(ra) # 80206e56 <eput>
    return -1;
    80204cfa:	57fd                	li	a5,-1
    80204cfc:	bff1                	j	80204cd8 <sys_chdir+0x6a>
    return -1;
    80204cfe:	57fd                	li	a5,-1
    80204d00:	bfe1                	j	80204cd8 <sys_chdir+0x6a>

0000000080204d02 <sys_pipe>:

uint64
sys_pipe(void)
{
    80204d02:	7139                	addi	sp,sp,-64
    80204d04:	fc06                	sd	ra,56(sp)
    80204d06:	f822                	sd	s0,48(sp)
    80204d08:	f426                	sd	s1,40(sp)
    80204d0a:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80204d0c:	ffffd097          	auipc	ra,0xffffd
    80204d10:	d4c080e7          	jalr	-692(ra) # 80201a58 <myproc>
    80204d14:	84aa                	mv	s1,a0

  if(argaddr(0, &fdarray) < 0)
    80204d16:	fd840593          	addi	a1,s0,-40
    80204d1a:	4501                	li	a0,0
    80204d1c:	ffffe097          	auipc	ra,0xffffe
    80204d20:	266080e7          	jalr	614(ra) # 80202f82 <argaddr>
    return -1;
    80204d24:	57fd                	li	a5,-1
  if(argaddr(0, &fdarray) < 0)
    80204d26:	0c054e63          	bltz	a0,80204e02 <sys_pipe+0x100>
  if(pipealloc(&rf, &wf) < 0)
    80204d2a:	fc840593          	addi	a1,s0,-56
    80204d2e:	fd040513          	addi	a0,s0,-48
    80204d32:	fffff097          	auipc	ra,0xfffff
    80204d36:	2be080e7          	jalr	702(ra) # 80203ff0 <pipealloc>
    return -1;
    80204d3a:	57fd                	li	a5,-1
  if(pipealloc(&rf, &wf) < 0)
    80204d3c:	0c054363          	bltz	a0,80204e02 <sys_pipe+0x100>
  fd0 = -1;
    80204d40:	fcf42223          	sw	a5,-60(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80204d44:	fd043503          	ld	a0,-48(s0)
    80204d48:	00000097          	auipc	ra,0x0
    80204d4c:	aa6080e7          	jalr	-1370(ra) # 802047ee <fdalloc>
    80204d50:	fca42223          	sw	a0,-60(s0)
    80204d54:	08054a63          	bltz	a0,80204de8 <sys_pipe+0xe6>
    80204d58:	fc843503          	ld	a0,-56(s0)
    80204d5c:	00000097          	auipc	ra,0x0
    80204d60:	a92080e7          	jalr	-1390(ra) # 802047ee <fdalloc>
    80204d64:	fca42023          	sw	a0,-64(s0)
    80204d68:	06054663          	bltz	a0,80204dd4 <sys_pipe+0xd2>
    fileclose(wf);
    return -1;
  }
  // if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
  //    copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204d6c:	4611                	li	a2,4
    80204d6e:	fc440593          	addi	a1,s0,-60
    80204d72:	fd843503          	ld	a0,-40(s0)
    80204d76:	ffffc097          	auipc	ra,0xffffc
    80204d7a:	606080e7          	jalr	1542(ra) # 8020137c <copyout2>
    80204d7e:	00054f63          	bltz	a0,80204d9c <sys_pipe+0x9a>
     copyout2(fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80204d82:	4611                	li	a2,4
    80204d84:	fc040593          	addi	a1,s0,-64
    80204d88:	fd843503          	ld	a0,-40(s0)
    80204d8c:	0511                	addi	a0,a0,4
    80204d8e:	ffffc097          	auipc	ra,0xffffc
    80204d92:	5ee080e7          	jalr	1518(ra) # 8020137c <copyout2>
    p->ofile[fd1] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  return 0;
    80204d96:	4781                	li	a5,0
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204d98:	06055563          	bgez	a0,80204e02 <sys_pipe+0x100>
    p->ofile[fd0] = 0;
    80204d9c:	fc442783          	lw	a5,-60(s0)
    80204da0:	07e9                	addi	a5,a5,26
    80204da2:	078e                	slli	a5,a5,0x3
    80204da4:	97a6                	add	a5,a5,s1
    80204da6:	0007b423          	sd	zero,8(a5)
    p->ofile[fd1] = 0;
    80204daa:	fc042503          	lw	a0,-64(s0)
    80204dae:	0569                	addi	a0,a0,26
    80204db0:	050e                	slli	a0,a0,0x3
    80204db2:	9526                	add	a0,a0,s1
    80204db4:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    80204db8:	fd043503          	ld	a0,-48(s0)
    80204dbc:	fffff097          	auipc	ra,0xfffff
    80204dc0:	ec0080e7          	jalr	-320(ra) # 80203c7c <fileclose>
    fileclose(wf);
    80204dc4:	fc843503          	ld	a0,-56(s0)
    80204dc8:	fffff097          	auipc	ra,0xfffff
    80204dcc:	eb4080e7          	jalr	-332(ra) # 80203c7c <fileclose>
    return -1;
    80204dd0:	57fd                	li	a5,-1
    80204dd2:	a805                	j	80204e02 <sys_pipe+0x100>
    if(fd0 >= 0)
    80204dd4:	fc442783          	lw	a5,-60(s0)
    80204dd8:	0007c863          	bltz	a5,80204de8 <sys_pipe+0xe6>
      p->ofile[fd0] = 0;
    80204ddc:	01a78513          	addi	a0,a5,26
    80204de0:	050e                	slli	a0,a0,0x3
    80204de2:	9526                	add	a0,a0,s1
    80204de4:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    80204de8:	fd043503          	ld	a0,-48(s0)
    80204dec:	fffff097          	auipc	ra,0xfffff
    80204df0:	e90080e7          	jalr	-368(ra) # 80203c7c <fileclose>
    fileclose(wf);
    80204df4:	fc843503          	ld	a0,-56(s0)
    80204df8:	fffff097          	auipc	ra,0xfffff
    80204dfc:	e84080e7          	jalr	-380(ra) # 80203c7c <fileclose>
    return -1;
    80204e00:	57fd                	li	a5,-1
}
    80204e02:	853e                	mv	a0,a5
    80204e04:	70e2                	ld	ra,56(sp)
    80204e06:	7442                	ld	s0,48(sp)
    80204e08:	74a2                	ld	s1,40(sp)
    80204e0a:	6121                	addi	sp,sp,64
    80204e0c:	8082                	ret

0000000080204e0e <sys_dev>:

// To open console device.
uint64
sys_dev(void)
{
    80204e0e:	7179                	addi	sp,sp,-48
    80204e10:	f406                	sd	ra,40(sp)
    80204e12:	f022                	sd	s0,32(sp)
    80204e14:	ec26                	sd	s1,24(sp)
    80204e16:	1800                	addi	s0,sp,48
  int fd, omode;
  int major, minor;
  struct file *f;

  if(argint(0, &omode) < 0 || argint(1, &major) < 0 || argint(2, &minor) < 0){
    80204e18:	fdc40593          	addi	a1,s0,-36
    80204e1c:	4501                	li	a0,0
    80204e1e:	ffffe097          	auipc	ra,0xffffe
    80204e22:	102080e7          	jalr	258(ra) # 80202f20 <argint>
    80204e26:	08054a63          	bltz	a0,80204eba <sys_dev+0xac>
    80204e2a:	fd840593          	addi	a1,s0,-40
    80204e2e:	4505                	li	a0,1
    80204e30:	ffffe097          	auipc	ra,0xffffe
    80204e34:	0f0080e7          	jalr	240(ra) # 80202f20 <argint>
    80204e38:	08054763          	bltz	a0,80204ec6 <sys_dev+0xb8>
    80204e3c:	fd440593          	addi	a1,s0,-44
    80204e40:	4509                	li	a0,2
    80204e42:	ffffe097          	auipc	ra,0xffffe
    80204e46:	0de080e7          	jalr	222(ra) # 80202f20 <argint>
    80204e4a:	08054063          	bltz	a0,80204eca <sys_dev+0xbc>
    return -1;
  }

  if(omode & O_CREATE){
    80204e4e:	fdc42783          	lw	a5,-36(s0)
    80204e52:	2407f793          	andi	a5,a5,576
    80204e56:	ebb1                	bnez	a5,80204eaa <sys_dev+0x9c>
    panic("dev file on FAT");
  }

  if(major < 0 || major >= NDEV)
    80204e58:	fd842703          	lw	a4,-40(s0)
    80204e5c:	47a5                	li	a5,9
    return -1;
    80204e5e:	557d                	li	a0,-1
  if(major < 0 || major >= NDEV)
    80204e60:	04e7ee63          	bltu	a5,a4,80204ebc <sys_dev+0xae>

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204e64:	fffff097          	auipc	ra,0xfffff
    80204e68:	d5c080e7          	jalr	-676(ra) # 80203bc0 <filealloc>
    80204e6c:	84aa                	mv	s1,a0
    80204e6e:	c125                	beqz	a0,80204ece <sys_dev+0xc0>
    80204e70:	00000097          	auipc	ra,0x0
    80204e74:	97e080e7          	jalr	-1666(ra) # 802047ee <fdalloc>
    80204e78:	04054d63          	bltz	a0,80204ed2 <sys_dev+0xc4>
    if(f)
      fileclose(f);
    return -1;
  }

  f->type = FD_DEVICE;
    80204e7c:	478d                	li	a5,3
    80204e7e:	c09c                	sw	a5,0(s1)
  f->off = 0;
    80204e80:	0204a023          	sw	zero,32(s1)
  f->ep = 0;
    80204e84:	0004bc23          	sd	zero,24(s1)
  f->major = major;
    80204e88:	fd842783          	lw	a5,-40(s0)
    80204e8c:	02f49223          	sh	a5,36(s1)
  f->readable = !(omode & O_WRONLY);
    80204e90:	fdc42783          	lw	a5,-36(s0)
    80204e94:	0017c713          	xori	a4,a5,1
    80204e98:	8b05                	andi	a4,a4,1
    80204e9a:	00e48423          	sb	a4,8(s1)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204e9e:	8b8d                	andi	a5,a5,3
    80204ea0:	00f037b3          	snez	a5,a5
    80204ea4:	00f484a3          	sb	a5,9(s1)

  return fd;
    80204ea8:	a811                	j	80204ebc <sys_dev+0xae>
    panic("dev file on FAT");
    80204eaa:	00005517          	auipc	a0,0x5
    80204eae:	d5e50513          	addi	a0,a0,-674 # 80209c08 <digits+0x888>
    80204eb2:	ffffb097          	auipc	ra,0xffffb
    80204eb6:	290080e7          	jalr	656(ra) # 80200142 <panic>
    return -1;
    80204eba:	557d                	li	a0,-1
}
    80204ebc:	70a2                	ld	ra,40(sp)
    80204ebe:	7402                	ld	s0,32(sp)
    80204ec0:	64e2                	ld	s1,24(sp)
    80204ec2:	6145                	addi	sp,sp,48
    80204ec4:	8082                	ret
    return -1;
    80204ec6:	557d                	li	a0,-1
    80204ec8:	bfd5                	j	80204ebc <sys_dev+0xae>
    80204eca:	557d                	li	a0,-1
    80204ecc:	bfc5                	j	80204ebc <sys_dev+0xae>
    return -1;
    80204ece:	557d                	li	a0,-1
    80204ed0:	b7f5                	j	80204ebc <sys_dev+0xae>
      fileclose(f);
    80204ed2:	8526                	mv	a0,s1
    80204ed4:	fffff097          	auipc	ra,0xfffff
    80204ed8:	da8080e7          	jalr	-600(ra) # 80203c7c <fileclose>
    return -1;
    80204edc:	557d                	li	a0,-1
    80204ede:	bff9                	j	80204ebc <sys_dev+0xae>

0000000080204ee0 <sys_readdir>:

// To support ls command
uint64
sys_readdir(void)
{
    80204ee0:	1101                	addi	sp,sp,-32
    80204ee2:	ec06                	sd	ra,24(sp)
    80204ee4:	e822                	sd	s0,16(sp)
    80204ee6:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204ee8:	fe840613          	addi	a2,s0,-24
    80204eec:	4581                	li	a1,0
    80204eee:	4501                	li	a0,0
    80204ef0:	00000097          	auipc	ra,0x0
    80204ef4:	894080e7          	jalr	-1900(ra) # 80204784 <argfd>
    return -1;
    80204ef8:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204efa:	02054563          	bltz	a0,80204f24 <sys_readdir+0x44>
    80204efe:	fe040593          	addi	a1,s0,-32
    80204f02:	4505                	li	a0,1
    80204f04:	ffffe097          	auipc	ra,0xffffe
    80204f08:	07e080e7          	jalr	126(ra) # 80202f82 <argaddr>
    return -1;
    80204f0c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204f0e:	00054b63          	bltz	a0,80204f24 <sys_readdir+0x44>
  return dirnext(f, p);
    80204f12:	fe043583          	ld	a1,-32(s0)
    80204f16:	fe843503          	ld	a0,-24(s0)
    80204f1a:	fffff097          	auipc	ra,0xfffff
    80204f1e:	010080e7          	jalr	16(ra) # 80203f2a <dirnext>
    80204f22:	87aa                	mv	a5,a0
}
    80204f24:	853e                	mv	a0,a5
    80204f26:	60e2                	ld	ra,24(sp)
    80204f28:	6442                	ld	s0,16(sp)
    80204f2a:	6105                	addi	sp,sp,32
    80204f2c:	8082                	ret

0000000080204f2e <sys_getcwd>:

// get absolute cwd string
uint64
sys_getcwd(void)
{
    80204f2e:	714d                	addi	sp,sp,-336
    80204f30:	e686                	sd	ra,328(sp)
    80204f32:	e2a2                	sd	s0,320(sp)
    80204f34:	fe26                	sd	s1,312(sp)
    80204f36:	fa4a                	sd	s2,304(sp)
    80204f38:	f64e                	sd	s3,296(sp)
    80204f3a:	f252                	sd	s4,288(sp)
    80204f3c:	ee56                	sd	s5,280(sp)
    80204f3e:	0a80                	addi	s0,sp,336
  uint64 addr;
  if (argaddr(0, &addr) < 0)
    80204f40:	fb840593          	addi	a1,s0,-72
    80204f44:	4501                	li	a0,0
    80204f46:	ffffe097          	auipc	ra,0xffffe
    80204f4a:	03c080e7          	jalr	60(ra) # 80202f82 <argaddr>
    return -1;
    80204f4e:	57fd                	li	a5,-1
  if (argaddr(0, &addr) < 0)
    80204f50:	06054f63          	bltz	a0,80204fce <sys_getcwd+0xa0>

  struct dirent *de = myproc()->cwd;
    80204f54:	ffffd097          	auipc	ra,0xffffd
    80204f58:	b04080e7          	jalr	-1276(ra) # 80201a58 <myproc>
    80204f5c:	4d853483          	ld	s1,1240(a0)
  char path[FAT32_MAX_PATH];
  char *s;
  int len;

  if (de->parent == NULL) {
    80204f60:	1204b783          	ld	a5,288(s1)
    80204f64:	cfbd                	beqz	a5,80204fe2 <sys_getcwd+0xb4>
    s = "/";
  } else {
    s = path + FAT32_MAX_PATH - 1;
    *s = '\0';
    80204f66:	fa0409a3          	sb	zero,-77(s0)
    s = path + FAT32_MAX_PATH - 1;
    80204f6a:	fb340993          	addi	s3,s0,-77
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= path)          // can't reach root "/"
    80204f6e:	eb040a13          	addi	s4,s0,-336
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    80204f72:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    80204f76:	8526                	mv	a0,s1
    80204f78:	ffffc097          	auipc	ra,0xffffc
    80204f7c:	974080e7          	jalr	-1676(ra) # 802008ec <strlen>
    80204f80:	862a                	mv	a2,a0
      s -= len;
    80204f82:	40a98933          	sub	s2,s3,a0
      if (s <= path)          // can't reach root "/"
    80204f86:	072a7363          	bgeu	s4,s2,80204fec <sys_getcwd+0xbe>
      strncpy(s, de->filename, len);
    80204f8a:	85a6                	mv	a1,s1
    80204f8c:	854a                	mv	a0,s2
    80204f8e:	ffffc097          	auipc	ra,0xffffc
    80204f92:	8ee080e7          	jalr	-1810(ra) # 8020087c <strncpy>
      *--s = '/';
    80204f96:	fff90993          	addi	s3,s2,-1
    80204f9a:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    80204f9e:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    80204fa2:	1204b783          	ld	a5,288(s1)
    80204fa6:	fbe1                	bnez	a5,80204f76 <sys_getcwd+0x48>
    }
  }

  // if (copyout(myproc()->pagetable, addr, s, strlen(s) + 1) < 0)
  if (copyout2(addr, s, strlen(s) + 1) < 0)
    80204fa8:	fb843483          	ld	s1,-72(s0)
    80204fac:	854e                	mv	a0,s3
    80204fae:	ffffc097          	auipc	ra,0xffffc
    80204fb2:	93e080e7          	jalr	-1730(ra) # 802008ec <strlen>
    80204fb6:	0015061b          	addiw	a2,a0,1
    80204fba:	85ce                	mv	a1,s3
    80204fbc:	8526                	mv	a0,s1
    80204fbe:	ffffc097          	auipc	ra,0xffffc
    80204fc2:	3be080e7          	jalr	958(ra) # 8020137c <copyout2>
    80204fc6:	02054563          	bltz	a0,80204ff0 <sys_getcwd+0xc2>
    return -1;
  
  return addr;
    80204fca:	fb843783          	ld	a5,-72(s0)

}
    80204fce:	853e                	mv	a0,a5
    80204fd0:	60b6                	ld	ra,328(sp)
    80204fd2:	6416                	ld	s0,320(sp)
    80204fd4:	74f2                	ld	s1,312(sp)
    80204fd6:	7952                	ld	s2,304(sp)
    80204fd8:	79b2                	ld	s3,296(sp)
    80204fda:	7a12                	ld	s4,288(sp)
    80204fdc:	6af2                	ld	s5,280(sp)
    80204fde:	6171                	addi	sp,sp,336
    80204fe0:	8082                	ret
    s = "/";
    80204fe2:	00004997          	auipc	s3,0x4
    80204fe6:	64e98993          	addi	s3,s3,1614 # 80209630 <digits+0x2b0>
    80204fea:	bf7d                	j	80204fa8 <sys_getcwd+0x7a>
        return -1;
    80204fec:	57fd                	li	a5,-1
    80204fee:	b7c5                	j	80204fce <sys_getcwd+0xa0>
    return -1;
    80204ff0:	57fd                	li	a5,-1
    80204ff2:	bff1                	j	80204fce <sys_getcwd+0xa0>

0000000080204ff4 <sys_remove>:
  return ret == -1;
}

uint64
sys_remove(void)
{
    80204ff4:	d6010113          	addi	sp,sp,-672
    80204ff8:	28113c23          	sd	ra,664(sp)
    80204ffc:	28813823          	sd	s0,656(sp)
    80205000:	28913423          	sd	s1,648(sp)
    80205004:	1500                	addi	s0,sp,672
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  int len;
  if((len = argstr(0, path, FAT32_MAX_PATH)) <= 0)
    80205006:	10400613          	li	a2,260
    8020500a:	ed840593          	addi	a1,s0,-296
    8020500e:	4501                	li	a0,0
    80205010:	ffffe097          	auipc	ra,0xffffe
    80205014:	f94080e7          	jalr	-108(ra) # 80202fa4 <argstr>
    80205018:	0ea05a63          	blez	a0,8020510c <sys_remove+0x118>
    return -1;

  char *s = path + len - 1;
    8020501c:	157d                	addi	a0,a0,-1
    8020501e:	ed840713          	addi	a4,s0,-296
    80205022:	00a707b3          	add	a5,a4,a0
  while (s >= path && *s == '/') {
    80205026:	02f00693          	li	a3,47
    8020502a:	863a                	mv	a2,a4
    8020502c:	00e7e963          	bltu	a5,a4,8020503e <sys_remove+0x4a>
    80205030:	0007c703          	lbu	a4,0(a5)
    80205034:	08d71a63          	bne	a4,a3,802050c8 <sys_remove+0xd4>
    s--;
    80205038:	17fd                	addi	a5,a5,-1
  while (s >= path && *s == '/') {
    8020503a:	fec7fbe3          	bgeu	a5,a2,80205030 <sys_remove+0x3c>
  }
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    return -1;
  }
  
  if((ep = ename(path)) == NULL){
    8020503e:	ed840513          	addi	a0,s0,-296
    80205042:	00002097          	auipc	ra,0x2
    80205046:	53a080e7          	jalr	1338(ra) # 8020757c <ename>
    8020504a:	84aa                	mv	s1,a0
    8020504c:	c561                	beqz	a0,80205114 <sys_remove+0x120>
    return -1;
  }
  elock(ep);
    8020504e:	00002097          	auipc	ra,0x2
    80205052:	d84080e7          	jalr	-636(ra) # 80206dd2 <elock>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80205056:	1004c783          	lbu	a5,256(s1)
    8020505a:	8bc1                	andi	a5,a5,16
    8020505c:	c38d                	beqz	a5,8020507e <sys_remove+0x8a>
  ep.valid = 0;
    8020505e:	e8041323          	sh	zero,-378(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80205062:	d6c40693          	addi	a3,s0,-660
    80205066:	04000613          	li	a2,64
    8020506a:	d7040593          	addi	a1,s0,-656
    8020506e:	8526                	mv	a0,s1
    80205070:	00002097          	auipc	ra,0x2
    80205074:	f66080e7          	jalr	-154(ra) # 80206fd6 <enext>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80205078:	57fd                	li	a5,-1
    8020507a:	06f51d63          	bne	a0,a5,802050f4 <sys_remove+0x100>
      eunlock(ep);
      eput(ep);
      return -1;
  }
  elock(ep->parent);      // Will this lead to deadlock?
    8020507e:	1204b503          	ld	a0,288(s1)
    80205082:	00002097          	auipc	ra,0x2
    80205086:	d50080e7          	jalr	-688(ra) # 80206dd2 <elock>
  eremove(ep);
    8020508a:	8526                	mv	a0,s1
    8020508c:	00002097          	auipc	ra,0x2
    80205090:	c12080e7          	jalr	-1006(ra) # 80206c9e <eremove>
  eunlock(ep->parent);
    80205094:	1204b503          	ld	a0,288(s1)
    80205098:	00002097          	auipc	ra,0x2
    8020509c:	d70080e7          	jalr	-656(ra) # 80206e08 <eunlock>
  eunlock(ep);
    802050a0:	8526                	mv	a0,s1
    802050a2:	00002097          	auipc	ra,0x2
    802050a6:	d66080e7          	jalr	-666(ra) # 80206e08 <eunlock>
  eput(ep);
    802050aa:	8526                	mv	a0,s1
    802050ac:	00002097          	auipc	ra,0x2
    802050b0:	daa080e7          	jalr	-598(ra) # 80206e56 <eput>

  return 0;
    802050b4:	4501                	li	a0,0
}
    802050b6:	29813083          	ld	ra,664(sp)
    802050ba:	29013403          	ld	s0,656(sp)
    802050be:	28813483          	ld	s1,648(sp)
    802050c2:	2a010113          	addi	sp,sp,672
    802050c6:	8082                	ret
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    802050c8:	ed840713          	addi	a4,s0,-296
    802050cc:	f6e7e9e3          	bltu	a5,a4,8020503e <sys_remove+0x4a>
    802050d0:	0007c683          	lbu	a3,0(a5)
    802050d4:	02e00713          	li	a4,46
    802050d8:	f6e693e3          	bne	a3,a4,8020503e <sys_remove+0x4a>
    802050dc:	ed840713          	addi	a4,s0,-296
    802050e0:	02e78863          	beq	a5,a4,80205110 <sys_remove+0x11c>
    802050e4:	fff7c703          	lbu	a4,-1(a5)
    802050e8:	02f00793          	li	a5,47
    802050ec:	f4f719e3          	bne	a4,a5,8020503e <sys_remove+0x4a>
    return -1;
    802050f0:	557d                	li	a0,-1
    802050f2:	b7d1                	j	802050b6 <sys_remove+0xc2>
      eunlock(ep);
    802050f4:	8526                	mv	a0,s1
    802050f6:	00002097          	auipc	ra,0x2
    802050fa:	d12080e7          	jalr	-750(ra) # 80206e08 <eunlock>
      eput(ep);
    802050fe:	8526                	mv	a0,s1
    80205100:	00002097          	auipc	ra,0x2
    80205104:	d56080e7          	jalr	-682(ra) # 80206e56 <eput>
      return -1;
    80205108:	557d                	li	a0,-1
    8020510a:	b775                	j	802050b6 <sys_remove+0xc2>
    return -1;
    8020510c:	557d                	li	a0,-1
    8020510e:	b765                	j	802050b6 <sys_remove+0xc2>
    return -1;
    80205110:	557d                	li	a0,-1
    80205112:	b755                	j	802050b6 <sys_remove+0xc2>
    return -1;
    80205114:	557d                	li	a0,-1
    80205116:	b745                	j	802050b6 <sys_remove+0xc2>

0000000080205118 <sys_rename>:

// Must hold too many locks at a time! It's possible to raise a deadlock.
// Because this op takes some steps, we can't promise
uint64
sys_rename(void)
{
    80205118:	c4010113          	addi	sp,sp,-960
    8020511c:	3a113c23          	sd	ra,952(sp)
    80205120:	3a813823          	sd	s0,944(sp)
    80205124:	3a913423          	sd	s1,936(sp)
    80205128:	3b213023          	sd	s2,928(sp)
    8020512c:	39313c23          	sd	s3,920(sp)
    80205130:	39413823          	sd	s4,912(sp)
    80205134:	0780                	addi	s0,sp,960
  char old[FAT32_MAX_PATH], new[FAT32_MAX_PATH];
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80205136:	10400613          	li	a2,260
    8020513a:	ec840593          	addi	a1,s0,-312
    8020513e:	4501                	li	a0,0
    80205140:	ffffe097          	auipc	ra,0xffffe
    80205144:	e64080e7          	jalr	-412(ra) # 80202fa4 <argstr>
      return -1;
    80205148:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    8020514a:	0c054d63          	bltz	a0,80205224 <sys_rename+0x10c>
    8020514e:	10400613          	li	a2,260
    80205152:	dc040593          	addi	a1,s0,-576
    80205156:	4505                	li	a0,1
    80205158:	ffffe097          	auipc	ra,0xffffe
    8020515c:	e4c080e7          	jalr	-436(ra) # 80202fa4 <argstr>
      return -1;
    80205160:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80205162:	0c054163          	bltz	a0,80205224 <sys_rename+0x10c>
  }

  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
  int srclock = 0;
  char *name;
  if ((src = ename(old)) == NULL || (pdst = enameparent(new, old)) == NULL
    80205166:	ec840513          	addi	a0,s0,-312
    8020516a:	00002097          	auipc	ra,0x2
    8020516e:	412080e7          	jalr	1042(ra) # 8020757c <ename>
    80205172:	84aa                	mv	s1,a0
    80205174:	1c050963          	beqz	a0,80205346 <sys_rename+0x22e>
    80205178:	ec840593          	addi	a1,s0,-312
    8020517c:	dc040513          	addi	a0,s0,-576
    80205180:	00002097          	auipc	ra,0x2
    80205184:	41a080e7          	jalr	1050(ra) # 8020759a <enameparent>
    80205188:	892a                	mv	s2,a0
    8020518a:	cd35                	beqz	a0,80205206 <sys_rename+0xee>
      || (name = formatname(old)) == NULL) {
    8020518c:	ec840513          	addi	a0,s0,-312
    80205190:	00001097          	auipc	ra,0x1
    80205194:	57c080e7          	jalr	1404(ra) # 8020670c <formatname>
    80205198:	89aa                	mv	s3,a0
    8020519a:	c535                	beqz	a0,80205206 <sys_rename+0xee>
    goto fail;          // src doesn't exist || dst parent doesn't exist || illegal new name
  }
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    if (ep == src) {    // In what universe can we move a directory into its child?
    8020519c:	07248563          	beq	s1,s2,80205206 <sys_rename+0xee>
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    802051a0:	87ca                	mv	a5,s2
    802051a2:	1207b783          	ld	a5,288(a5)
    802051a6:	c781                	beqz	a5,802051ae <sys_rename+0x96>
    if (ep == src) {    // In what universe can we move a directory into its child?
    802051a8:	fef49de3          	bne	s1,a5,802051a2 <sys_rename+0x8a>
    802051ac:	a8a9                	j	80205206 <sys_rename+0xee>
      goto fail;
    }
  }

  uint off;
  elock(src);     // must hold child's lock before acquiring parent's, because we do so in other similar cases
    802051ae:	8526                	mv	a0,s1
    802051b0:	00002097          	auipc	ra,0x2
    802051b4:	c22080e7          	jalr	-990(ra) # 80206dd2 <elock>
  srclock = 1;
  elock(pdst);
    802051b8:	854a                	mv	a0,s2
    802051ba:	00002097          	auipc	ra,0x2
    802051be:	c18080e7          	jalr	-1000(ra) # 80206dd2 <elock>
  dst = dirlookup(pdst, name, &off);
    802051c2:	dbc40613          	addi	a2,s0,-580
    802051c6:	85ce                	mv	a1,s3
    802051c8:	854a                	mv	a0,s2
    802051ca:	00002097          	auipc	ra,0x2
    802051ce:	f9c080e7          	jalr	-100(ra) # 80207166 <dirlookup>
    802051d2:	8a2a                	mv	s4,a0
  if (dst != NULL) {
    802051d4:	cd45                	beqz	a0,8020528c <sys_rename+0x174>
    eunlock(pdst);
    802051d6:	854a                	mv	a0,s2
    802051d8:	00002097          	auipc	ra,0x2
    802051dc:	c30080e7          	jalr	-976(ra) # 80206e08 <eunlock>
    if (src == dst) {
    802051e0:	01448963          	beq	s1,s4,802051f2 <sys_rename+0xda>
      goto fail;
    } else if (src->attribute & dst->attribute & ATTR_DIRECTORY) {
    802051e4:	1004c783          	lbu	a5,256(s1)
    802051e8:	100a4703          	lbu	a4,256(s4)
    802051ec:	8ff9                	and	a5,a5,a4
    802051ee:	8bc1                	andi	a5,a5,16
    802051f0:	ebb1                	bnez	a5,80205244 <sys_rename+0x12c>

  return 0;

fail:
  if (srclock)
    eunlock(src);
    802051f2:	8526                	mv	a0,s1
    802051f4:	00002097          	auipc	ra,0x2
    802051f8:	c14080e7          	jalr	-1004(ra) # 80206e08 <eunlock>
  if (dst)
    eput(dst);
    802051fc:	8552                	mv	a0,s4
    802051fe:	00002097          	auipc	ra,0x2
    80205202:	c58080e7          	jalr	-936(ra) # 80206e56 <eput>
  if (pdst)
    80205206:	00090763          	beqz	s2,80205214 <sys_rename+0xfc>
    eput(pdst);
    8020520a:	854a                	mv	a0,s2
    8020520c:	00002097          	auipc	ra,0x2
    80205210:	c4a080e7          	jalr	-950(ra) # 80206e56 <eput>
  if (src)
    eput(src);
  return -1;
    80205214:	57fd                	li	a5,-1
  if (src)
    80205216:	c499                	beqz	s1,80205224 <sys_rename+0x10c>
    eput(src);
    80205218:	8526                	mv	a0,s1
    8020521a:	00002097          	auipc	ra,0x2
    8020521e:	c3c080e7          	jalr	-964(ra) # 80206e56 <eput>
  return -1;
    80205222:	57fd                	li	a5,-1
}
    80205224:	853e                	mv	a0,a5
    80205226:	3b813083          	ld	ra,952(sp)
    8020522a:	3b013403          	ld	s0,944(sp)
    8020522e:	3a813483          	ld	s1,936(sp)
    80205232:	3a013903          	ld	s2,928(sp)
    80205236:	39813983          	ld	s3,920(sp)
    8020523a:	39013a03          	ld	s4,912(sp)
    8020523e:	3c010113          	addi	sp,sp,960
    80205242:	8082                	ret
      elock(dst);
    80205244:	8552                	mv	a0,s4
    80205246:	00002097          	auipc	ra,0x2
    8020524a:	b8c080e7          	jalr	-1140(ra) # 80206dd2 <elock>
  ep.valid = 0;
    8020524e:	d6041323          	sh	zero,-666(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80205252:	c4c40693          	addi	a3,s0,-948
    80205256:	04000613          	li	a2,64
    8020525a:	c5040593          	addi	a1,s0,-944
    8020525e:	8552                	mv	a0,s4
    80205260:	00002097          	auipc	ra,0x2
    80205264:	d76080e7          	jalr	-650(ra) # 80206fd6 <enext>
      if (!isdirempty(dst)) {    // it's ok to overwrite an empty dir
    80205268:	57fd                	li	a5,-1
    8020526a:	0cf51863          	bne	a0,a5,8020533a <sys_rename+0x222>
      elock(pdst);
    8020526e:	854a                	mv	a0,s2
    80205270:	00002097          	auipc	ra,0x2
    80205274:	b62080e7          	jalr	-1182(ra) # 80206dd2 <elock>
    eremove(dst);
    80205278:	8552                	mv	a0,s4
    8020527a:	00002097          	auipc	ra,0x2
    8020527e:	a24080e7          	jalr	-1500(ra) # 80206c9e <eremove>
    eunlock(dst);
    80205282:	8552                	mv	a0,s4
    80205284:	00002097          	auipc	ra,0x2
    80205288:	b84080e7          	jalr	-1148(ra) # 80206e08 <eunlock>
  memmove(src->filename, name, FAT32_MAX_FILENAME);
    8020528c:	0ff00613          	li	a2,255
    80205290:	85ce                	mv	a1,s3
    80205292:	8526                	mv	a0,s1
    80205294:	ffffb097          	auipc	ra,0xffffb
    80205298:	530080e7          	jalr	1328(ra) # 802007c4 <memmove>
  emake(pdst, src, off);
    8020529c:	dbc42603          	lw	a2,-580(s0)
    802052a0:	85a6                	mv	a1,s1
    802052a2:	854a                	mv	a0,s2
    802052a4:	00001097          	auipc	ra,0x1
    802052a8:	520080e7          	jalr	1312(ra) # 802067c4 <emake>
  if (src->parent != pdst) {
    802052ac:	1204b783          	ld	a5,288(s1)
    802052b0:	01278d63          	beq	a5,s2,802052ca <sys_rename+0x1b2>
    eunlock(pdst);
    802052b4:	854a                	mv	a0,s2
    802052b6:	00002097          	auipc	ra,0x2
    802052ba:	b52080e7          	jalr	-1198(ra) # 80206e08 <eunlock>
    elock(src->parent);
    802052be:	1204b503          	ld	a0,288(s1)
    802052c2:	00002097          	auipc	ra,0x2
    802052c6:	b10080e7          	jalr	-1264(ra) # 80206dd2 <elock>
  eremove(src);
    802052ca:	8526                	mv	a0,s1
    802052cc:	00002097          	auipc	ra,0x2
    802052d0:	9d2080e7          	jalr	-1582(ra) # 80206c9e <eremove>
  eunlock(src->parent);
    802052d4:	1204b503          	ld	a0,288(s1)
    802052d8:	00002097          	auipc	ra,0x2
    802052dc:	b30080e7          	jalr	-1232(ra) # 80206e08 <eunlock>
  struct dirent *psrc = src->parent;  // src must not be root, or it won't pass the for-loop test
    802052e0:	1204b983          	ld	s3,288(s1)
  src->parent = edup(pdst);
    802052e4:	854a                	mv	a0,s2
    802052e6:	00002097          	auipc	ra,0x2
    802052ea:	88e080e7          	jalr	-1906(ra) # 80206b74 <edup>
    802052ee:	12a4b023          	sd	a0,288(s1)
  src->off = off;
    802052f2:	dbc42783          	lw	a5,-580(s0)
    802052f6:	10f4ae23          	sw	a5,284(s1)
  src->valid = 1;
    802052fa:	4785                	li	a5,1
    802052fc:	10f49b23          	sh	a5,278(s1)
  eunlock(src);
    80205300:	8526                	mv	a0,s1
    80205302:	00002097          	auipc	ra,0x2
    80205306:	b06080e7          	jalr	-1274(ra) # 80206e08 <eunlock>
  eput(psrc);
    8020530a:	854e                	mv	a0,s3
    8020530c:	00002097          	auipc	ra,0x2
    80205310:	b4a080e7          	jalr	-1206(ra) # 80206e56 <eput>
  if (dst) {
    80205314:	000a0763          	beqz	s4,80205322 <sys_rename+0x20a>
    eput(dst);
    80205318:	8552                	mv	a0,s4
    8020531a:	00002097          	auipc	ra,0x2
    8020531e:	b3c080e7          	jalr	-1220(ra) # 80206e56 <eput>
  eput(pdst);
    80205322:	854a                	mv	a0,s2
    80205324:	00002097          	auipc	ra,0x2
    80205328:	b32080e7          	jalr	-1230(ra) # 80206e56 <eput>
  eput(src);
    8020532c:	8526                	mv	a0,s1
    8020532e:	00002097          	auipc	ra,0x2
    80205332:	b28080e7          	jalr	-1240(ra) # 80206e56 <eput>
  return 0;
    80205336:	4781                	li	a5,0
    80205338:	b5f5                	j	80205224 <sys_rename+0x10c>
        eunlock(dst);
    8020533a:	8552                	mv	a0,s4
    8020533c:	00002097          	auipc	ra,0x2
    80205340:	acc080e7          	jalr	-1332(ra) # 80206e08 <eunlock>
        goto fail;
    80205344:	b57d                	j	802051f2 <sys_rename+0xda>
  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
    80205346:	892a                	mv	s2,a0
  if (dst)
    80205348:	bd7d                	j	80205206 <sys_rename+0xee>

000000008020534a <sys_openat>:

// added by lmq for SYS_openat
uint64
sys_openat(void)
{
    8020534a:	ca010113          	addi	sp,sp,-864
    8020534e:	34113c23          	sd	ra,856(sp)
    80205352:	34813823          	sd	s0,848(sp)
    80205356:	34913423          	sd	s1,840(sp)
    8020535a:	35213023          	sd	s2,832(sp)
    8020535e:	33313c23          	sd	s3,824(sp)
    80205362:	33413823          	sd	s4,816(sp)
    80205366:	33513423          	sd	s5,808(sp)
    8020536a:	1680                	addi	s0,sp,864
  int dirfd;
  if(argint(0, &dirfd) < 0)
    8020536c:	fbc40593          	addi	a1,s0,-68
    80205370:	4501                	li	a0,0
    80205372:	ffffe097          	auipc	ra,0xffffe
    80205376:	bae080e7          	jalr	-1106(ra) # 80202f20 <argint>
    8020537a:	2e054563          	bltz	a0,80205664 <sys_openat+0x31a>
    return -1;
  struct dirent *de = myproc()->cwd;
    8020537e:	ffffc097          	auipc	ra,0xffffc
    80205382:	6da080e7          	jalr	1754(ra) # 80201a58 <myproc>
  if(dirfd!=AT_FDCWD)
    80205386:	fbc42703          	lw	a4,-68(s0)
    8020538a:	f9c00793          	li	a5,-100
    8020538e:	16f71563          	bne	a4,a5,802054f8 <sys_openat+0x1ae>
  struct dirent *de = myproc()->cwd;
    80205392:	4d853483          	ld	s1,1240(a0)
  {
    de=myproc()->ofile[dirfd]->ep;
  }
  char cur_path[FAT32_MAX_PATH];  // openat工作目录 可以为当前目录 也可以被指定
  memset(cur_path,0,FAT32_MAX_PATH);
    80205396:	10400613          	li	a2,260
    8020539a:	4581                	li	a1,0
    8020539c:	eb840513          	addi	a0,s0,-328
    802053a0:	ffffb097          	auipc	ra,0xffffb
    802053a4:	3c4080e7          	jalr	964(ra) # 80200764 <memset>
  char* s=NULL;
  int len;

  // 获得openat工作目录路径
  if (de->parent == NULL) {
    802053a8:	1204b783          	ld	a5,288(s1)
    802053ac:	16078263          	beqz	a5,80205510 <sys_openat+0x1c6>
    s = "/";
  } 
  else {
    s = cur_path + FAT32_MAX_PATH - 1;
    *s = '\0';
    802053b0:	fa040da3          	sb	zero,-69(s0)
    s = cur_path + FAT32_MAX_PATH - 1;
    802053b4:	fbb40993          	addi	s3,s0,-69
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= cur_path)          // can't reach root "/"
    802053b8:	eb840a13          	addi	s4,s0,-328
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    802053bc:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    802053c0:	8526                	mv	a0,s1
    802053c2:	ffffb097          	auipc	ra,0xffffb
    802053c6:	52a080e7          	jalr	1322(ra) # 802008ec <strlen>
    802053ca:	862a                	mv	a2,a0
      s -= len;
    802053cc:	40a98933          	sub	s2,s3,a0
      if (s <= cur_path)          // can't reach root "/"
    802053d0:	292a7c63          	bgeu	s4,s2,80205668 <sys_openat+0x31e>
      strncpy(s, de->filename, len);
    802053d4:	85a6                	mv	a1,s1
    802053d6:	854a                	mv	a0,s2
    802053d8:	ffffb097          	auipc	ra,0xffffb
    802053dc:	4a4080e7          	jalr	1188(ra) # 8020087c <strncpy>
      *--s = '/';
    802053e0:	fff90993          	addi	s3,s2,-1
    802053e4:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    802053e8:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    802053ec:	1204b783          	ld	a5,288(s1)
    802053f0:	fbe1                	bnez	a5,802053c0 <sys_openat+0x76>
    }
  }
  
  // 获得openat的文件路径 openat工作目录+相对路径
  char absolute_path[FAT32_MAX_PATH];
  memset(absolute_path,0,FAT32_MAX_PATH);
    802053f2:	10400613          	li	a2,260
    802053f6:	4581                	li	a1,0
    802053f8:	db040493          	addi	s1,s0,-592
    802053fc:	8526                	mv	a0,s1
    802053fe:	ffffb097          	auipc	ra,0xffffb
    80205402:	366080e7          	jalr	870(ra) # 80200764 <memset>
  strncpy(absolute_path,s,strlen(s));
    80205406:	854e                	mv	a0,s3
    80205408:	ffffb097          	auipc	ra,0xffffb
    8020540c:	4e4080e7          	jalr	1252(ra) # 802008ec <strlen>
    80205410:	862a                	mv	a2,a0
    80205412:	85ce                	mv	a1,s3
    80205414:	8526                	mv	a0,s1
    80205416:	ffffb097          	auipc	ra,0xffffb
    8020541a:	466080e7          	jalr	1126(ra) # 8020087c <strncpy>

  int fd,omode;
  struct file *f;
  struct dirent *ep;
  char relative_path[FAT32_MAX_PATH];
  if(argstr(1, relative_path, FAT32_MAX_PATH) < 0 || argint(2,&omode) < 0)
    8020541e:	10400613          	li	a2,260
    80205422:	ca840593          	addi	a1,s0,-856
    80205426:	4505                	li	a0,1
    80205428:	ffffe097          	auipc	ra,0xffffe
    8020542c:	b7c080e7          	jalr	-1156(ra) # 80202fa4 <argstr>
    80205430:	24054e63          	bltz	a0,8020568c <sys_openat+0x342>
    80205434:	dac40593          	addi	a1,s0,-596
    80205438:	4509                	li	a0,2
    8020543a:	ffffe097          	auipc	ra,0xffffe
    8020543e:	ae6080e7          	jalr	-1306(ra) # 80202f20 <argint>
    80205442:	24054763          	bltz	a0,80205690 <sys_openat+0x346>
    return -1;
  
  if(relative_path[0]=='/')                               // 为绝对路径 忽略dirfd
    80205446:	ca844783          	lbu	a5,-856(s0)
    8020544a:	02f00713          	li	a4,47
    8020544e:	0ce78663          	beq	a5,a4,8020551a <sys_openat+0x1d0>
  {
    memset(absolute_path,0,FAT32_MAX_PATH);
    strncpy(absolute_path,relative_path,strlen(relative_path));
  }
  else if(relative_path[0]=='.' && relative_path[1]=='/') // 为显式相对路径
    80205452:	02e00713          	li	a4,46
    80205456:	0ee78963          	beq	a5,a4,80205548 <sys_openat+0x1fe>
  {
    panic("openat not support ..");
  }
  else                                                    // 为隐式相对路径
  {
    int absolute_path_old_len=strlen(absolute_path);
    8020545a:	db040913          	addi	s2,s0,-592
    8020545e:	854a                	mv	a0,s2
    80205460:	ffffb097          	auipc	ra,0xffffb
    80205464:	48c080e7          	jalr	1164(ra) # 802008ec <strlen>
    absolute_path[absolute_path_old_len]='/';
    80205468:	fc040793          	addi	a5,s0,-64
    8020546c:	97aa                	add	a5,a5,a0
    8020546e:	02f00713          	li	a4,47
    80205472:	dee78823          	sb	a4,-528(a5)
    absolute_path[absolute_path_old_len+1]='\0';
    80205476:	2505                	addiw	a0,a0,1
    80205478:	fc040793          	addi	a5,s0,-64
    8020547c:	953e                	add	a0,a0,a5
    8020547e:	de050823          	sb	zero,-528(a0)
    strncpy(absolute_path+strlen(absolute_path),
    80205482:	854a                	mv	a0,s2
    80205484:	ffffb097          	auipc	ra,0xffffb
    80205488:	468080e7          	jalr	1128(ra) # 802008ec <strlen>
    8020548c:	84aa                	mv	s1,a0
    8020548e:	ca840993          	addi	s3,s0,-856
    80205492:	854e                	mv	a0,s3
    80205494:	ffffb097          	auipc	ra,0xffffb
    80205498:	458080e7          	jalr	1112(ra) # 802008ec <strlen>
    8020549c:	862a                	mv	a2,a0
    8020549e:	85ce                	mv	a1,s3
    802054a0:	00990533          	add	a0,s2,s1
    802054a4:	ffffb097          	auipc	ra,0xffffb
    802054a8:	3d8080e7          	jalr	984(ra) # 8020087c <strncpy>
            relative_path,
            strlen(relative_path));
  }

  // 根据路径名打开文件
  if(omode & O_CREATE){                         // 创建文件
    802054ac:	dac42603          	lw	a2,-596(s0)
    802054b0:	24067793          	andi	a5,a2,576
    802054b4:	e7e5                	bnez	a5,8020559c <sys_openat+0x252>
    ep = create(absolute_path, T_FILE, omode);
    if(ep == NULL){
      return -1;
    }
  } 
  else if(omode & O_DIRECTORY)                  // 打开一个目录
    802054b6:	02a61793          	slli	a5,a2,0x2a
    802054ba:	1607d063          	bgez	a5,8020561a <sys_openat+0x2d0>
  {
    
    if((ep=ename(absolute_path))==NULL)         // 获取目录项
    802054be:	db040513          	addi	a0,s0,-592
    802054c2:	00002097          	auipc	ra,0x2
    802054c6:	0ba080e7          	jalr	186(ra) # 8020757c <ename>
    802054ca:	892a                	mv	s2,a0
    802054cc:	1c050663          	beqz	a0,80205698 <sys_openat+0x34e>
    {
      return -1;
    }
    elock(ep);
    802054d0:	00002097          	auipc	ra,0x2
    802054d4:	902080e7          	jalr	-1790(ra) # 80206dd2 <elock>
    if(!(ep->attribute & ATTR_DIRECTORY))       // 该文件不是目录文件
    802054d8:	10094783          	lbu	a5,256(s2)
    802054dc:	8bc1                	andi	a5,a5,16
    802054de:	ebe1                	bnez	a5,802055ae <sys_openat+0x264>
    {
      eunlock(ep);
    802054e0:	854a                	mv	a0,s2
    802054e2:	00002097          	auipc	ra,0x2
    802054e6:	926080e7          	jalr	-1754(ra) # 80206e08 <eunlock>
      eput(ep);
    802054ea:	854a                	mv	a0,s2
    802054ec:	00002097          	auipc	ra,0x2
    802054f0:	96a080e7          	jalr	-1686(ra) # 80206e56 <eput>
      return -1;
    802054f4:	557d                	li	a0,-1
    802054f6:	aa95                	j	8020566a <sys_openat+0x320>
    de=myproc()->ofile[dirfd]->ep;
    802054f8:	ffffc097          	auipc	ra,0xffffc
    802054fc:	560080e7          	jalr	1376(ra) # 80201a58 <myproc>
    80205500:	fbc42783          	lw	a5,-68(s0)
    80205504:	07e9                	addi	a5,a5,26
    80205506:	078e                	slli	a5,a5,0x3
    80205508:	97aa                	add	a5,a5,a0
    8020550a:	679c                	ld	a5,8(a5)
    8020550c:	6f84                	ld	s1,24(a5)
    8020550e:	b561                	j	80205396 <sys_openat+0x4c>
    s = "/";
    80205510:	00004997          	auipc	s3,0x4
    80205514:	12098993          	addi	s3,s3,288 # 80209630 <digits+0x2b0>
    80205518:	bde9                	j	802053f2 <sys_openat+0xa8>
    memset(absolute_path,0,FAT32_MAX_PATH);
    8020551a:	10400613          	li	a2,260
    8020551e:	4581                	li	a1,0
    80205520:	8526                	mv	a0,s1
    80205522:	ffffb097          	auipc	ra,0xffffb
    80205526:	242080e7          	jalr	578(ra) # 80200764 <memset>
    strncpy(absolute_path,relative_path,strlen(relative_path));
    8020552a:	ca840913          	addi	s2,s0,-856
    8020552e:	854a                	mv	a0,s2
    80205530:	ffffb097          	auipc	ra,0xffffb
    80205534:	3bc080e7          	jalr	956(ra) # 802008ec <strlen>
    80205538:	862a                	mv	a2,a0
    8020553a:	85ca                	mv	a1,s2
    8020553c:	8526                	mv	a0,s1
    8020553e:	ffffb097          	auipc	ra,0xffffb
    80205542:	33e080e7          	jalr	830(ra) # 8020087c <strncpy>
    80205546:	b79d                	j	802054ac <sys_openat+0x162>
  else if(relative_path[0]=='.' && relative_path[1]=='/') // 为显式相对路径
    80205548:	ca944783          	lbu	a5,-855(s0)
    8020554c:	02f00713          	li	a4,47
    80205550:	00e78e63          	beq	a5,a4,8020556c <sys_openat+0x222>
  else if (relative_path[0]=='.' && relative_path[1]=='.')// 显示相对路径 没有实现
    80205554:	02e00713          	li	a4,46
    80205558:	f0e791e3          	bne	a5,a4,8020545a <sys_openat+0x110>
    panic("openat not support ..");
    8020555c:	00004517          	auipc	a0,0x4
    80205560:	6bc50513          	addi	a0,a0,1724 # 80209c18 <digits+0x898>
    80205564:	ffffb097          	auipc	ra,0xffffb
    80205568:	bde080e7          	jalr	-1058(ra) # 80200142 <panic>
    strncpy(absolute_path+strlen(absolute_path),
    8020556c:	db040913          	addi	s2,s0,-592
    80205570:	854a                	mv	a0,s2
    80205572:	ffffb097          	auipc	ra,0xffffb
    80205576:	37a080e7          	jalr	890(ra) # 802008ec <strlen>
    8020557a:	84aa                	mv	s1,a0
    8020557c:	ca940993          	addi	s3,s0,-855
    80205580:	854e                	mv	a0,s3
    80205582:	ffffb097          	auipc	ra,0xffffb
    80205586:	36a080e7          	jalr	874(ra) # 802008ec <strlen>
    8020558a:	862a                	mv	a2,a0
    8020558c:	85ce                	mv	a1,s3
    8020558e:	00990533          	add	a0,s2,s1
    80205592:	ffffb097          	auipc	ra,0xffffb
    80205596:	2ea080e7          	jalr	746(ra) # 8020087c <strncpy>
    8020559a:	bf09                	j	802054ac <sys_openat+0x162>
    ep = create(absolute_path, T_FILE, omode);
    8020559c:	4589                	li	a1,2
    8020559e:	db040513          	addi	a0,s0,-592
    802055a2:	fffff097          	auipc	ra,0xfffff
    802055a6:	290080e7          	jalr	656(ra) # 80204832 <create>
    802055aa:	892a                	mv	s2,a0
    if(ep == NULL){
    802055ac:	c565                	beqz	a0,80205694 <sys_openat+0x34a>
      return -1;
    }
  }

  
  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    802055ae:	ffffe097          	auipc	ra,0xffffe
    802055b2:	612080e7          	jalr	1554(ra) # 80203bc0 <filealloc>
    802055b6:	89aa                	mv	s3,a0
    802055b8:	c96d                	beqz	a0,802056aa <sys_openat+0x360>
    802055ba:	fffff097          	auipc	ra,0xfffff
    802055be:	234080e7          	jalr	564(ra) # 802047ee <fdalloc>
    802055c2:	84aa                	mv	s1,a0
    802055c4:	0c054e63          	bltz	a0,802056a0 <sys_openat+0x356>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    802055c8:	10094783          	lbu	a5,256(s2)
    802055cc:	8bc1                	andi	a5,a5,16
    802055ce:	e791                	bnez	a5,802055da <sys_openat+0x290>
    802055d0:	dac42783          	lw	a5,-596(s0)
    802055d4:	4007f793          	andi	a5,a5,1024
    802055d8:	e3c1                	bnez	a5,80205658 <sys_openat+0x30e>
    etrunc(ep);
  }

  // 设置权限
  f->type = FD_ENTRY;
    802055da:	4789                	li	a5,2
    802055dc:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    802055e0:	dac42783          	lw	a5,-596(s0)
    802055e4:	0047f693          	andi	a3,a5,4
    802055e8:	4701                	li	a4,0
    802055ea:	c299                	beqz	a3,802055f0 <sys_openat+0x2a6>
    802055ec:	10892703          	lw	a4,264(s2)
    802055f0:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    802055f4:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    802055f8:	0017c713          	xori	a4,a5,1
    802055fc:	8b05                	andi	a4,a4,1
    802055fe:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80205602:	8b8d                	andi	a5,a5,3
    80205604:	00f037b3          	snez	a5,a5
    80205608:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    8020560c:	854a                	mv	a0,s2
    8020560e:	00001097          	auipc	ra,0x1
    80205612:	7fa080e7          	jalr	2042(ra) # 80206e08 <eunlock>

  return fd;
    80205616:	8526                	mv	a0,s1
    80205618:	a889                	j	8020566a <sys_openat+0x320>
    if((ep = ename(absolute_path)) == NULL){
    8020561a:	db040513          	addi	a0,s0,-592
    8020561e:	00002097          	auipc	ra,0x2
    80205622:	f5e080e7          	jalr	-162(ra) # 8020757c <ename>
    80205626:	892a                	mv	s2,a0
    80205628:	c935                	beqz	a0,8020569c <sys_openat+0x352>
    elock(ep);
    8020562a:	00001097          	auipc	ra,0x1
    8020562e:	7a8080e7          	jalr	1960(ra) # 80206dd2 <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    80205632:	10094783          	lbu	a5,256(s2)
    80205636:	8bc1                	andi	a5,a5,16
    80205638:	dbbd                	beqz	a5,802055ae <sys_openat+0x264>
    8020563a:	dac42783          	lw	a5,-596(s0)
    8020563e:	dba5                	beqz	a5,802055ae <sys_openat+0x264>
      eunlock(ep);
    80205640:	854a                	mv	a0,s2
    80205642:	00001097          	auipc	ra,0x1
    80205646:	7c6080e7          	jalr	1990(ra) # 80206e08 <eunlock>
      eput(ep);
    8020564a:	854a                	mv	a0,s2
    8020564c:	00002097          	auipc	ra,0x2
    80205650:	80a080e7          	jalr	-2038(ra) # 80206e56 <eput>
      return -1;
    80205654:	557d                	li	a0,-1
    80205656:	a811                	j	8020566a <sys_openat+0x320>
    etrunc(ep);
    80205658:	854a                	mv	a0,s2
    8020565a:	00001097          	auipc	ra,0x1
    8020565e:	70e080e7          	jalr	1806(ra) # 80206d68 <etrunc>
    80205662:	bfa5                	j	802055da <sys_openat+0x290>
    return -1;
    80205664:	557d                	li	a0,-1
    80205666:	a011                	j	8020566a <sys_openat+0x320>
        return -1;
    80205668:	557d                	li	a0,-1
}
    8020566a:	35813083          	ld	ra,856(sp)
    8020566e:	35013403          	ld	s0,848(sp)
    80205672:	34813483          	ld	s1,840(sp)
    80205676:	34013903          	ld	s2,832(sp)
    8020567a:	33813983          	ld	s3,824(sp)
    8020567e:	33013a03          	ld	s4,816(sp)
    80205682:	32813a83          	ld	s5,808(sp)
    80205686:	36010113          	addi	sp,sp,864
    8020568a:	8082                	ret
    return -1;
    8020568c:	557d                	li	a0,-1
    8020568e:	bff1                	j	8020566a <sys_openat+0x320>
    80205690:	557d                	li	a0,-1
    80205692:	bfe1                	j	8020566a <sys_openat+0x320>
      return -1;
    80205694:	557d                	li	a0,-1
    80205696:	bfd1                	j	8020566a <sys_openat+0x320>
      return -1;
    80205698:	557d                	li	a0,-1
    8020569a:	bfc1                	j	8020566a <sys_openat+0x320>
      return -1;
    8020569c:	557d                	li	a0,-1
    8020569e:	b7f1                	j	8020566a <sys_openat+0x320>
      fileclose(f);
    802056a0:	854e                	mv	a0,s3
    802056a2:	ffffe097          	auipc	ra,0xffffe
    802056a6:	5da080e7          	jalr	1498(ra) # 80203c7c <fileclose>
    eunlock(ep);
    802056aa:	854a                	mv	a0,s2
    802056ac:	00001097          	auipc	ra,0x1
    802056b0:	75c080e7          	jalr	1884(ra) # 80206e08 <eunlock>
    eput(ep);
    802056b4:	854a                	mv	a0,s2
    802056b6:	00001097          	auipc	ra,0x1
    802056ba:	7a0080e7          	jalr	1952(ra) # 80206e56 <eput>
    return -1;
    802056be:	557d                	li	a0,-1
    802056c0:	b76d                	j	8020566a <sys_openat+0x320>

00000000802056c2 <sys_mkdirat>:


// added by lmq for SYS_mkdirat
uint64
sys_mkdirat(void)
{
    802056c2:	da010113          	addi	sp,sp,-608
    802056c6:	24113c23          	sd	ra,600(sp)
    802056ca:	24813823          	sd	s0,592(sp)
    802056ce:	24913423          	sd	s1,584(sp)
    802056d2:	25213023          	sd	s2,576(sp)
    802056d6:	23313c23          	sd	s3,568(sp)
    802056da:	23413823          	sd	s4,560(sp)
    802056de:	23513423          	sd	s5,552(sp)
    802056e2:	1480                	addi	s0,sp,608
  int dirfd,omode;
  char des_path[FAT32_MAX_PATH];
  if(argint(0, &dirfd) < 0 || argstr(1,des_path,FAT32_MAX_PATH)<0 || argint(2,&omode)<0)
    802056e4:	fbc40593          	addi	a1,s0,-68
    802056e8:	4501                	li	a0,0
    802056ea:	ffffe097          	auipc	ra,0xffffe
    802056ee:	836080e7          	jalr	-1994(ra) # 80202f20 <argint>
    802056f2:	20054663          	bltz	a0,802058fe <sys_mkdirat+0x23c>
    802056f6:	10400613          	li	a2,260
    802056fa:	eb040593          	addi	a1,s0,-336
    802056fe:	4505                	li	a0,1
    80205700:	ffffe097          	auipc	ra,0xffffe
    80205704:	8a4080e7          	jalr	-1884(ra) # 80202fa4 <argstr>
    80205708:	20054d63          	bltz	a0,80205922 <sys_mkdirat+0x260>
    8020570c:	fb840593          	addi	a1,s0,-72
    80205710:	4509                	li	a0,2
    80205712:	ffffe097          	auipc	ra,0xffffe
    80205716:	80e080e7          	jalr	-2034(ra) # 80202f20 <argint>
    8020571a:	20054663          	bltz	a0,80205926 <sys_mkdirat+0x264>
    return -1;


  // 如果dirfd不为AT_FDCWD 则获得dirfd的路径
  char cur_path[FAT32_MAX_PATH];
  memset(cur_path,0,FAT32_MAX_PATH);
    8020571e:	10400613          	li	a2,260
    80205722:	4581                	li	a1,0
    80205724:	da840513          	addi	a0,s0,-600
    80205728:	ffffb097          	auipc	ra,0xffffb
    8020572c:	03c080e7          	jalr	60(ra) # 80200764 <memset>
  char* s=NULL;
  int len;
  if(dirfd!=AT_FDCWD)
    80205730:	fbc42703          	lw	a4,-68(s0)
    80205734:	f9c00793          	li	a5,-100
    80205738:	10f70963          	beq	a4,a5,8020584a <sys_mkdirat+0x188>
  {
    struct dirent* de=myproc()->ofile[dirfd]->ep;
    8020573c:	ffffc097          	auipc	ra,0xffffc
    80205740:	31c080e7          	jalr	796(ra) # 80201a58 <myproc>
    80205744:	fbc42783          	lw	a5,-68(s0)
    80205748:	07e9                	addi	a5,a5,26
    8020574a:	078e                	slli	a5,a5,0x3
    8020574c:	97aa                	add	a5,a5,a0
    8020574e:	679c                	ld	a5,8(a5)
    80205750:	6f84                	ld	s1,24(a5)
    if (de->parent == NULL) {
    80205752:	1204b783          	ld	a5,288(s1)
    80205756:	12078063          	beqz	a5,80205876 <sys_mkdirat+0x1b4>
      s = "/";
    } 
    else {
      s = cur_path + FAT32_MAX_PATH - 1;
      *s = '\0';
    8020575a:	ea0405a3          	sb	zero,-341(s0)
      s = cur_path + FAT32_MAX_PATH - 1;
    8020575e:	eab40993          	addi	s3,s0,-341
      while (de->parent) {
        len = strlen(de->filename);
        s -= len;
        if (s <= cur_path)          // can't reach root "/"
    80205762:	da840a13          	addi	s4,s0,-600
          return -1;
        strncpy(s, de->filename, len);
        *--s = '/';
    80205766:	02f00a93          	li	s5,47
        len = strlen(de->filename);
    8020576a:	8526                	mv	a0,s1
    8020576c:	ffffb097          	auipc	ra,0xffffb
    80205770:	180080e7          	jalr	384(ra) # 802008ec <strlen>
    80205774:	862a                	mv	a2,a0
        s -= len;
    80205776:	40a98933          	sub	s2,s3,a0
        if (s <= cur_path)          // can't reach root "/"
    8020577a:	1b2a7863          	bgeu	s4,s2,8020592a <sys_mkdirat+0x268>
        strncpy(s, de->filename, len);
    8020577e:	85a6                	mv	a1,s1
    80205780:	854a                	mv	a0,s2
    80205782:	ffffb097          	auipc	ra,0xffffb
    80205786:	0fa080e7          	jalr	250(ra) # 8020087c <strncpy>
        *--s = '/';
    8020578a:	fff90993          	addi	s3,s2,-1
    8020578e:	ff590fa3          	sb	s5,-1(s2)
        de = de->parent;
    80205792:	1204b483          	ld	s1,288(s1)
      while (de->parent) {
    80205796:	1204b783          	ld	a5,288(s1)
    8020579a:	fbe1                	bnez	a5,8020576a <sys_mkdirat+0xa8>
      }
    }
    memset(cur_path,0,FAT32_MAX_PATH);
    8020579c:	10400613          	li	a2,260
    802057a0:	4581                	li	a1,0
    802057a2:	da840493          	addi	s1,s0,-600
    802057a6:	8526                	mv	a0,s1
    802057a8:	ffffb097          	auipc	ra,0xffffb
    802057ac:	fbc080e7          	jalr	-68(ra) # 80200764 <memset>
    strncpy(cur_path,s,strlen(s));
    802057b0:	854e                	mv	a0,s3
    802057b2:	ffffb097          	auipc	ra,0xffffb
    802057b6:	13a080e7          	jalr	314(ra) # 802008ec <strlen>
    802057ba:	862a                	mv	a2,a0
    802057bc:	85ce                	mv	a1,s3
    802057be:	8526                	mv	a0,s1
    802057c0:	ffffb097          	auipc	ra,0xffffb
    802057c4:	0bc080e7          	jalr	188(ra) # 8020087c <strncpy>
    if(des_path[0]!='/')
    802057c8:	eb044783          	lbu	a5,-336(s0)
    802057cc:	02f00713          	li	a4,47
    802057d0:	06e78d63          	beq	a5,a4,8020584a <sys_mkdirat+0x188>
    {
      if(des_path[0]=='.' && des_path[1]=='/')
    802057d4:	02e00713          	li	a4,46
    802057d8:	0ae78463          	beq	a5,a4,80205880 <sys_mkdirat+0x1be>
      {
        panic("mkdirat not support ..\n");
      }
      else
      {
        cur_path[strlen(cur_path)]='/';
    802057dc:	da840493          	addi	s1,s0,-600
    802057e0:	8526                	mv	a0,s1
    802057e2:	ffffb097          	auipc	ra,0xffffb
    802057e6:	10a080e7          	jalr	266(ra) # 802008ec <strlen>
    802057ea:	fc040793          	addi	a5,s0,-64
    802057ee:	953e                	add	a0,a0,a5
    802057f0:	02f00793          	li	a5,47
    802057f4:	def50423          	sb	a5,-536(a0)
        strncpy(cur_path+strlen(cur_path),des_path,strlen(des_path));
    802057f8:	8526                	mv	a0,s1
    802057fa:	ffffb097          	auipc	ra,0xffffb
    802057fe:	0f2080e7          	jalr	242(ra) # 802008ec <strlen>
    80205802:	89aa                	mv	s3,a0
    80205804:	eb040913          	addi	s2,s0,-336
    80205808:	854a                	mv	a0,s2
    8020580a:	ffffb097          	auipc	ra,0xffffb
    8020580e:	0e2080e7          	jalr	226(ra) # 802008ec <strlen>
    80205812:	862a                	mv	a2,a0
    80205814:	85ca                	mv	a1,s2
    80205816:	01348533          	add	a0,s1,s3
    8020581a:	ffffb097          	auipc	ra,0xffffb
    8020581e:	062080e7          	jalr	98(ra) # 8020087c <strncpy>
        memset(des_path,0,FAT32_MAX_PATH);
    80205822:	10400613          	li	a2,260
    80205826:	4581                	li	a1,0
    80205828:	854a                	mv	a0,s2
    8020582a:	ffffb097          	auipc	ra,0xffffb
    8020582e:	f3a080e7          	jalr	-198(ra) # 80200764 <memset>
        strncpy(des_path,cur_path,strlen(cur_path));
    80205832:	8526                	mv	a0,s1
    80205834:	ffffb097          	auipc	ra,0xffffb
    80205838:	0b8080e7          	jalr	184(ra) # 802008ec <strlen>
    8020583c:	862a                	mv	a2,a0
    8020583e:	85a6                	mv	a1,s1
    80205840:	854a                	mv	a0,s2
    80205842:	ffffb097          	auipc	ra,0xffffb
    80205846:	03a080e7          	jalr	58(ra) # 8020087c <strncpy>
    }
    
  }

  struct dirent* ep;
  if((ep = create(des_path, T_DIR, omode)) == 0)
    8020584a:	fb842603          	lw	a2,-72(s0)
    8020584e:	4585                	li	a1,1
    80205850:	eb040513          	addi	a0,s0,-336
    80205854:	fffff097          	auipc	ra,0xfffff
    80205858:	fde080e7          	jalr	-34(ra) # 80204832 <create>
    8020585c:	84aa                	mv	s1,a0
    8020585e:	c961                	beqz	a0,8020592e <sys_mkdirat+0x26c>
  {
    return -1;
  }

  eunlock(ep);
    80205860:	00001097          	auipc	ra,0x1
    80205864:	5a8080e7          	jalr	1448(ra) # 80206e08 <eunlock>
  eput(ep);
    80205868:	8526                	mv	a0,s1
    8020586a:	00001097          	auipc	ra,0x1
    8020586e:	5ec080e7          	jalr	1516(ra) # 80206e56 <eput>
  return 0;
    80205872:	4501                	li	a0,0
    80205874:	a071                	j	80205900 <sys_mkdirat+0x23e>
      s = "/";
    80205876:	00004997          	auipc	s3,0x4
    8020587a:	dba98993          	addi	s3,s3,-582 # 80209630 <digits+0x2b0>
    8020587e:	bf39                	j	8020579c <sys_mkdirat+0xda>
      if(des_path[0]=='.' && des_path[1]=='/')
    80205880:	eb144783          	lbu	a5,-335(s0)
    80205884:	02f00713          	li	a4,47
    80205888:	00e78e63          	beq	a5,a4,802058a4 <sys_mkdirat+0x1e2>
      else if(des_path[0]=='.' && des_path[1]=='.')
    8020588c:	02e00713          	li	a4,46
    80205890:	f4e796e3          	bne	a5,a4,802057dc <sys_mkdirat+0x11a>
        panic("mkdirat not support ..\n");
    80205894:	00004517          	auipc	a0,0x4
    80205898:	39c50513          	addi	a0,a0,924 # 80209c30 <digits+0x8b0>
    8020589c:	ffffb097          	auipc	ra,0xffffb
    802058a0:	8a6080e7          	jalr	-1882(ra) # 80200142 <panic>
        strncpy(cur_path+strlen(cur_path),des_path+1,strlen(des_path+1));
    802058a4:	8926                	mv	s2,s1
    802058a6:	8526                	mv	a0,s1
    802058a8:	ffffb097          	auipc	ra,0xffffb
    802058ac:	044080e7          	jalr	68(ra) # 802008ec <strlen>
    802058b0:	84aa                	mv	s1,a0
    802058b2:	eb140993          	addi	s3,s0,-335
    802058b6:	854e                	mv	a0,s3
    802058b8:	ffffb097          	auipc	ra,0xffffb
    802058bc:	034080e7          	jalr	52(ra) # 802008ec <strlen>
    802058c0:	862a                	mv	a2,a0
    802058c2:	85ce                	mv	a1,s3
    802058c4:	00990533          	add	a0,s2,s1
    802058c8:	ffffb097          	auipc	ra,0xffffb
    802058cc:	fb4080e7          	jalr	-76(ra) # 8020087c <strncpy>
        memset(des_path,0,FAT32_MAX_PATH);
    802058d0:	10400613          	li	a2,260
    802058d4:	4581                	li	a1,0
    802058d6:	eb040493          	addi	s1,s0,-336
    802058da:	8526                	mv	a0,s1
    802058dc:	ffffb097          	auipc	ra,0xffffb
    802058e0:	e88080e7          	jalr	-376(ra) # 80200764 <memset>
        strncpy(des_path,cur_path,strlen(cur_path));
    802058e4:	854a                	mv	a0,s2
    802058e6:	ffffb097          	auipc	ra,0xffffb
    802058ea:	006080e7          	jalr	6(ra) # 802008ec <strlen>
    802058ee:	862a                	mv	a2,a0
    802058f0:	85ca                	mv	a1,s2
    802058f2:	8526                	mv	a0,s1
    802058f4:	ffffb097          	auipc	ra,0xffffb
    802058f8:	f88080e7          	jalr	-120(ra) # 8020087c <strncpy>
    802058fc:	b7b9                	j	8020584a <sys_mkdirat+0x188>
    return -1;
    802058fe:	557d                	li	a0,-1
}
    80205900:	25813083          	ld	ra,600(sp)
    80205904:	25013403          	ld	s0,592(sp)
    80205908:	24813483          	ld	s1,584(sp)
    8020590c:	24013903          	ld	s2,576(sp)
    80205910:	23813983          	ld	s3,568(sp)
    80205914:	23013a03          	ld	s4,560(sp)
    80205918:	22813a83          	ld	s5,552(sp)
    8020591c:	26010113          	addi	sp,sp,608
    80205920:	8082                	ret
    return -1;
    80205922:	557d                	li	a0,-1
    80205924:	bff1                	j	80205900 <sys_mkdirat+0x23e>
    80205926:	557d                	li	a0,-1
    80205928:	bfe1                	j	80205900 <sys_mkdirat+0x23e>
          return -1;
    8020592a:	557d                	li	a0,-1
    8020592c:	bfd1                	j	80205900 <sys_mkdirat+0x23e>
    return -1;
    8020592e:	557d                	li	a0,-1
    80205930:	bfc1                	j	80205900 <sys_mkdirat+0x23e>

0000000080205932 <sys_dup3>:

// added by lmq for SYS_dup3
uint64
sys_dup3(void)
{
    80205932:	7179                	addi	sp,sp,-48
    80205934:	f406                	sd	ra,40(sp)
    80205936:	f022                	sd	s0,32(sp)
    80205938:	ec26                	sd	s1,24(sp)
    8020593a:	1800                	addi	s0,sp,48
  struct file *f;
  int new_fd;
  struct proc* p=myproc();
    8020593c:	ffffc097          	auipc	ra,0xffffc
    80205940:	11c080e7          	jalr	284(ra) # 80201a58 <myproc>
    80205944:	84aa                	mv	s1,a0

  if(argfd(0, 0, &f) < 0 || argint(1,&new_fd)<0)
    80205946:	fd840613          	addi	a2,s0,-40
    8020594a:	4581                	li	a1,0
    8020594c:	4501                	li	a0,0
    8020594e:	fffff097          	auipc	ra,0xfffff
    80205952:	e36080e7          	jalr	-458(ra) # 80204784 <argfd>
    return -1;
    80205956:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(1,&new_fd)<0)
    80205958:	02054263          	bltz	a0,8020597c <sys_dup3+0x4a>
    8020595c:	fd440593          	addi	a1,s0,-44
    80205960:	4505                	li	a0,1
    80205962:	ffffd097          	auipc	ra,0xffffd
    80205966:	5be080e7          	jalr	1470(ra) # 80202f20 <argint>
    8020596a:	02054963          	bltz	a0,8020599c <sys_dup3+0x6a>
  if(p->ofile[new_fd]!=0)        // 文件描述符[new_fd]已被占用
    8020596e:	fd442503          	lw	a0,-44(s0)
    80205972:	050e                	slli	a0,a0,0x3
    80205974:	94aa                	add	s1,s1,a0
    80205976:	6cf8                	ld	a4,216(s1)
  {
    return -1;
    80205978:	57fd                	li	a5,-1
  if(p->ofile[new_fd]!=0)        // 文件描述符[new_fd]已被占用
    8020597a:	c719                	beqz	a4,80205988 <sys_dup3+0x56>
  }
  p->ofile[new_fd] = f;
  filedup(f);
  return new_fd;
}
    8020597c:	853e                	mv	a0,a5
    8020597e:	70a2                	ld	ra,40(sp)
    80205980:	7402                	ld	s0,32(sp)
    80205982:	64e2                	ld	s1,24(sp)
    80205984:	6145                	addi	sp,sp,48
    80205986:	8082                	ret
  p->ofile[new_fd] = f;
    80205988:	fd843503          	ld	a0,-40(s0)
    8020598c:	ece8                	sd	a0,216(s1)
  filedup(f);
    8020598e:	ffffe097          	auipc	ra,0xffffe
    80205992:	29c080e7          	jalr	668(ra) # 80203c2a <filedup>
  return new_fd;
    80205996:	fd442783          	lw	a5,-44(s0)
    8020599a:	b7cd                	j	8020597c <sys_dup3+0x4a>
    return -1;
    8020599c:	57fd                	li	a5,-1
    8020599e:	bff9                	j	8020597c <sys_dup3+0x4a>

00000000802059a0 <sys_getdents64>:
  unsigned char   d_type;	    // 文件类型    
  char            d_name[];	  // 文件名
};
uint64 
sys_getdents64(void)
{
    802059a0:	7139                	addi	sp,sp,-64
    802059a2:	fc06                	sd	ra,56(sp)
    802059a4:	f822                	sd	s0,48(sp)
    802059a6:	f426                	sd	s1,40(sp)
    802059a8:	0080                	addi	s0,sp,64
  int fd,len;
  struct file* f;
  struct linux_dirent64* dirp64;

  if(argfd(0,&fd,&f)<0 || argaddr(1,(uint64*)&dirp64)<0 || argint(2,&len))
    802059aa:	fd040613          	addi	a2,s0,-48
    802059ae:	fdc40593          	addi	a1,s0,-36
    802059b2:	4501                	li	a0,0
    802059b4:	fffff097          	auipc	ra,0xfffff
    802059b8:	dd0080e7          	jalr	-560(ra) # 80204784 <argfd>
  {
    return -1;
    802059bc:	54fd                	li	s1,-1
  if(argfd(0,&fd,&f)<0 || argaddr(1,(uint64*)&dirp64)<0 || argint(2,&len))
    802059be:	06054763          	bltz	a0,80205a2c <sys_getdents64+0x8c>
    802059c2:	fc840593          	addi	a1,s0,-56
    802059c6:	4505                	li	a0,1
    802059c8:	ffffd097          	auipc	ra,0xffffd
    802059cc:	5ba080e7          	jalr	1466(ra) # 80202f82 <argaddr>
    802059d0:	04054e63          	bltz	a0,80205a2c <sys_getdents64+0x8c>
    802059d4:	fd840593          	addi	a1,s0,-40
    802059d8:	4509                	li	a0,2
    802059da:	ffffd097          	auipc	ra,0xffffd
    802059de:	546080e7          	jalr	1350(ra) # 80202f20 <argint>
    802059e2:	e529                	bnez	a0,80205a2c <sys_getdents64+0x8c>
  }
  int filename_len=strlen(f->ep->filename);
    802059e4:	fd043783          	ld	a5,-48(s0)
    802059e8:	6f88                	ld	a0,24(a5)
    802059ea:	ffffb097          	auipc	ra,0xffffb
    802059ee:	f02080e7          	jalr	-254(ra) # 802008ec <strlen>
    802059f2:	862a                	mv	a2,a0
  if(filename_len>len)
    802059f4:	fd842783          	lw	a5,-40(s0)
    802059f8:	02a7ca63          	blt	a5,a0,80205a2c <sys_getdents64+0x8c>
  {
    return -1;
  }
  if(copyout2((uint64)dirp64->d_name, f->ep->filename, filename_len) < 0 ||
    802059fc:	84aa                	mv	s1,a0
    802059fe:	fd043783          	ld	a5,-48(s0)
    80205a02:	6f8c                	ld	a1,24(a5)
    80205a04:	fc843503          	ld	a0,-56(s0)
    80205a08:	054d                	addi	a0,a0,19
    80205a0a:	ffffc097          	auipc	ra,0xffffc
    80205a0e:	972080e7          	jalr	-1678(ra) # 8020137c <copyout2>
    80205a12:	02054563          	bltz	a0,80205a3c <sys_getdents64+0x9c>
    copyout2((uint64)&(dirp64->d_type),(char*)&f->type,sizeof(f->type) < 0 ))
    80205a16:	4601                	li	a2,0
    80205a18:	fd043583          	ld	a1,-48(s0)
    80205a1c:	fc843503          	ld	a0,-56(s0)
    80205a20:	0549                	addi	a0,a0,18
    80205a22:	ffffc097          	auipc	ra,0xffffc
    80205a26:	95a080e7          	jalr	-1702(ra) # 8020137c <copyout2>
  if(copyout2((uint64)dirp64->d_name, f->ep->filename, filename_len) < 0 ||
    80205a2a:	e519                	bnez	a0,80205a38 <sys_getdents64+0x98>
    return -1;

  return filename_len;
}
    80205a2c:	8526                	mv	a0,s1
    80205a2e:	70e2                	ld	ra,56(sp)
    80205a30:	7442                	ld	s0,48(sp)
    80205a32:	74a2                	ld	s1,40(sp)
    80205a34:	6121                	addi	sp,sp,64
    80205a36:	8082                	ret
    return -1;
    80205a38:	54fd                	li	s1,-1
    80205a3a:	bfcd                	j	80205a2c <sys_getdents64+0x8c>
    80205a3c:	54fd                	li	s1,-1
    80205a3e:	b7fd                	j	80205a2c <sys_getdents64+0x8c>

0000000080205a40 <sys_fstat_cscc>:
        long st_ctime_nsec;
        unsigned __unused[2];
};
uint64
sys_fstat_cscc(void)
{
    80205a40:	7135                	addi	sp,sp,-160
    80205a42:	ed06                	sd	ra,152(sp)
    80205a44:	e922                	sd	s0,144(sp)
    80205a46:	1100                	addi	s0,sp,160
  struct file* f;
  uint64 addr;
  if(argfd(0,0,&f)<0 || argaddr(1,&addr)<0)
    80205a48:	fe840613          	addi	a2,s0,-24
    80205a4c:	4581                	li	a1,0
    80205a4e:	4501                	li	a0,0
    80205a50:	fffff097          	auipc	ra,0xfffff
    80205a54:	d34080e7          	jalr	-716(ra) # 80204784 <argfd>
    80205a58:	87aa                	mv	a5,a0
  {
    return -1;
    80205a5a:	557d                	li	a0,-1
  if(argfd(0,0,&f)<0 || argaddr(1,&addr)<0)
    80205a5c:	0207c263          	bltz	a5,80205a80 <sys_fstat_cscc+0x40>
    80205a60:	fe040593          	addi	a1,s0,-32
    80205a64:	4505                	li	a0,1
    80205a66:	ffffd097          	auipc	ra,0xffffd
    80205a6a:	51c080e7          	jalr	1308(ra) # 80202f82 <argaddr>
    80205a6e:	08054d63          	bltz	a0,80205b08 <sys_fstat_cscc+0xc8>
  }

  struct kstat st;
  if(f->type!=FD_ENTRY)
    80205a72:	fe843783          	ld	a5,-24(s0)
    80205a76:	4394                	lw	a3,0(a5)
    80205a78:	4709                	li	a4,2
    return -1;
    80205a7a:	557d                	li	a0,-1
  if(f->type!=FD_ENTRY)
    80205a7c:	00e68663          	beq	a3,a4,80205a88 <sys_fstat_cscc+0x48>
  st.st_ctime_sec=0;
  eunlock(f->ep);
  if((copyout2(addr,(char*)&st,sizeof(struct kstat)))<0)
    return -1;
  return 0;
    80205a80:	60ea                	ld	ra,152(sp)
    80205a82:	644a                	ld	s0,144(sp)
    80205a84:	610d                	addi	sp,sp,160
    80205a86:	8082                	ret
  elock(f->ep);
    80205a88:	6f88                	ld	a0,24(a5)
    80205a8a:	00001097          	auipc	ra,0x1
    80205a8e:	348080e7          	jalr	840(ra) # 80206dd2 <elock>
  st.st_dev=f->ep->dev;
    80205a92:	fe843783          	ld	a5,-24(s0)
    80205a96:	6f98                	ld	a4,24(a5)
    80205a98:	11474703          	lbu	a4,276(a4)
    80205a9c:	f6e43023          	sd	a4,-160(s0)
  st.st_ino=0;
    80205aa0:	f6043423          	sd	zero,-152(s0)
  st.st_mode=f->type;
    80205aa4:	4398                	lw	a4,0(a5)
    80205aa6:	f6e42823          	sw	a4,-144(s0)
  st.st_nlink=f->ref;
    80205aaa:	43d8                	lw	a4,4(a5)
    80205aac:	f6e42a23          	sw	a4,-140(s0)
  st.st_gid=0;
    80205ab0:	f6042e23          	sw	zero,-132(s0)
  st.st_uid=0;
    80205ab4:	f6042c23          	sw	zero,-136(s0)
  st.st_rdev=0;
    80205ab8:	f8043023          	sd	zero,-128(s0)
  st.st_size=f->ep->file_size;
    80205abc:	6f98                	ld	a4,24(a5)
    80205abe:	10876703          	lwu	a4,264(a4)
    80205ac2:	f8e43823          	sd	a4,-112(s0)
  st.st_blocks=0;
    80205ac6:	fa043023          	sd	zero,-96(s0)
  st.st_blksize=0;
    80205aca:	f8042c23          	sw	zero,-104(s0)
  st.st_atime_sec=0;
    80205ace:	fa043423          	sd	zero,-88(s0)
  st.st_atime_nsec=0;
    80205ad2:	fa043823          	sd	zero,-80(s0)
  st.st_mtime_nsec=0;
    80205ad6:	fc043023          	sd	zero,-64(s0)
  st.st_mtime_sec=0;
    80205ada:	fa043c23          	sd	zero,-72(s0)
  st.st_ctime_nsec=0;
    80205ade:	fc043823          	sd	zero,-48(s0)
  st.st_ctime_sec=0;
    80205ae2:	fc043423          	sd	zero,-56(s0)
  eunlock(f->ep);
    80205ae6:	6f88                	ld	a0,24(a5)
    80205ae8:	00001097          	auipc	ra,0x1
    80205aec:	320080e7          	jalr	800(ra) # 80206e08 <eunlock>
  if((copyout2(addr,(char*)&st,sizeof(struct kstat)))<0)
    80205af0:	08000613          	li	a2,128
    80205af4:	f6040593          	addi	a1,s0,-160
    80205af8:	fe043503          	ld	a0,-32(s0)
    80205afc:	ffffc097          	auipc	ra,0xffffc
    80205b00:	880080e7          	jalr	-1920(ra) # 8020137c <copyout2>
    80205b04:	957d                	srai	a0,a0,0x3f
    80205b06:	bfad                	j	80205a80 <sys_fstat_cscc+0x40>
    return -1;
    80205b08:	557d                	li	a0,-1
    80205b0a:	bf9d                	j	80205a80 <sys_fstat_cscc+0x40>
    80205b0c:	0000                	unimp
	...

0000000080205b10 <kernelvec>:
    80205b10:	7111                	addi	sp,sp,-256
    80205b12:	e006                	sd	ra,0(sp)
    80205b14:	e40a                	sd	sp,8(sp)
    80205b16:	e80e                	sd	gp,16(sp)
    80205b18:	ec12                	sd	tp,24(sp)
    80205b1a:	f016                	sd	t0,32(sp)
    80205b1c:	f41a                	sd	t1,40(sp)
    80205b1e:	f81e                	sd	t2,48(sp)
    80205b20:	fc22                	sd	s0,56(sp)
    80205b22:	e0a6                	sd	s1,64(sp)
    80205b24:	e4aa                	sd	a0,72(sp)
    80205b26:	e8ae                	sd	a1,80(sp)
    80205b28:	ecb2                	sd	a2,88(sp)
    80205b2a:	f0b6                	sd	a3,96(sp)
    80205b2c:	f4ba                	sd	a4,104(sp)
    80205b2e:	f8be                	sd	a5,112(sp)
    80205b30:	fcc2                	sd	a6,120(sp)
    80205b32:	e146                	sd	a7,128(sp)
    80205b34:	e54a                	sd	s2,136(sp)
    80205b36:	e94e                	sd	s3,144(sp)
    80205b38:	ed52                	sd	s4,152(sp)
    80205b3a:	f156                	sd	s5,160(sp)
    80205b3c:	f55a                	sd	s6,168(sp)
    80205b3e:	f95e                	sd	s7,176(sp)
    80205b40:	fd62                	sd	s8,184(sp)
    80205b42:	e1e6                	sd	s9,192(sp)
    80205b44:	e5ea                	sd	s10,200(sp)
    80205b46:	e9ee                	sd	s11,208(sp)
    80205b48:	edf2                	sd	t3,216(sp)
    80205b4a:	f1f6                	sd	t4,224(sp)
    80205b4c:	f5fa                	sd	t5,232(sp)
    80205b4e:	f9fe                	sd	t6,240(sp)
    80205b50:	f53fc0ef          	jal	ra,80202aa2 <kerneltrap>
    80205b54:	6082                	ld	ra,0(sp)
    80205b56:	6122                	ld	sp,8(sp)
    80205b58:	61c2                	ld	gp,16(sp)
    80205b5a:	7282                	ld	t0,32(sp)
    80205b5c:	7322                	ld	t1,40(sp)
    80205b5e:	73c2                	ld	t2,48(sp)
    80205b60:	7462                	ld	s0,56(sp)
    80205b62:	6486                	ld	s1,64(sp)
    80205b64:	6526                	ld	a0,72(sp)
    80205b66:	65c6                	ld	a1,80(sp)
    80205b68:	6666                	ld	a2,88(sp)
    80205b6a:	7686                	ld	a3,96(sp)
    80205b6c:	7726                	ld	a4,104(sp)
    80205b6e:	77c6                	ld	a5,112(sp)
    80205b70:	7866                	ld	a6,120(sp)
    80205b72:	688a                	ld	a7,128(sp)
    80205b74:	692a                	ld	s2,136(sp)
    80205b76:	69ca                	ld	s3,144(sp)
    80205b78:	6a6a                	ld	s4,152(sp)
    80205b7a:	7a8a                	ld	s5,160(sp)
    80205b7c:	7b2a                	ld	s6,168(sp)
    80205b7e:	7bca                	ld	s7,176(sp)
    80205b80:	7c6a                	ld	s8,184(sp)
    80205b82:	6c8e                	ld	s9,192(sp)
    80205b84:	6d2e                	ld	s10,200(sp)
    80205b86:	6dce                	ld	s11,208(sp)
    80205b88:	6e6e                	ld	t3,216(sp)
    80205b8a:	7e8e                	ld	t4,224(sp)
    80205b8c:	7f2e                	ld	t5,232(sp)
    80205b8e:	7fce                	ld	t6,240(sp)
    80205b90:	6111                	addi	sp,sp,256
    80205b92:	10200073          	sret
	...

0000000080205b9e <timerinit>:
#include "include/proc.h"

struct spinlock tickslock;
uint ticks;

void timerinit() {
    80205b9e:	1141                	addi	sp,sp,-16
    80205ba0:	e406                	sd	ra,8(sp)
    80205ba2:	e022                	sd	s0,0(sp)
    80205ba4:	0800                	addi	s0,sp,16
    initlock(&tickslock, "time");
    80205ba6:	00004597          	auipc	a1,0x4
    80205baa:	0a258593          	addi	a1,a1,162 # 80209c48 <digits+0x8c8>
    80205bae:	00025517          	auipc	a0,0x25
    80205bb2:	bba50513          	addi	a0,a0,-1094 # 8022a768 <tickslock>
    80205bb6:	ffffb097          	auipc	ra,0xffffb
    80205bba:	ace080e7          	jalr	-1330(ra) # 80200684 <initlock>
    #ifdef DEBUG
    printf("timerinit\n");
    #endif
}
    80205bbe:	60a2                	ld	ra,8(sp)
    80205bc0:	6402                	ld	s0,0(sp)
    80205bc2:	0141                	addi	sp,sp,16
    80205bc4:	8082                	ret

0000000080205bc6 <set_next_timeout>:

void
set_next_timeout() {
    80205bc6:	1141                	addi	sp,sp,-16
    80205bc8:	e422                	sd	s0,8(sp)
    80205bca:	0800                	addi	s0,sp,16
  asm volatile("rdtime %0" : "=r" (x) );
    80205bcc:	c0102573          	rdtime	a0
    // if comment the `printf` line below
    // the timer will not work.

    // this bug seems to disappear automatically
    // printf("");
    sbi_set_timer(r_time() + INTERVAL);
    80205bd0:	001dc7b7          	lui	a5,0x1dc
    80205bd4:	13078793          	addi	a5,a5,304 # 1dc130 <_entry-0x80023ed0>
    80205bd8:	953e                	add	a0,a0,a5
	SBI_CALL_1(SBI_SET_TIMER, stime_value);
    80205bda:	4581                	li	a1,0
    80205bdc:	4601                	li	a2,0
    80205bde:	4681                	li	a3,0
    80205be0:	4881                	li	a7,0
    80205be2:	00000073          	ecall
}
    80205be6:	6422                	ld	s0,8(sp)
    80205be8:	0141                	addi	sp,sp,16
    80205bea:	8082                	ret

0000000080205bec <timer_tick>:

void timer_tick() {
    80205bec:	1101                	addi	sp,sp,-32
    80205bee:	ec06                	sd	ra,24(sp)
    80205bf0:	e822                	sd	s0,16(sp)
    80205bf2:	e426                	sd	s1,8(sp)
    80205bf4:	1000                	addi	s0,sp,32
    acquire(&tickslock);
    80205bf6:	00025497          	auipc	s1,0x25
    80205bfa:	b7248493          	addi	s1,s1,-1166 # 8022a768 <tickslock>
    80205bfe:	8526                	mv	a0,s1
    80205c00:	ffffb097          	auipc	ra,0xffffb
    80205c04:	ac8080e7          	jalr	-1336(ra) # 802006c8 <acquire>
    ticks++;
    80205c08:	4c9c                	lw	a5,24(s1)
    80205c0a:	2785                	addiw	a5,a5,1
    80205c0c:	cc9c                	sw	a5,24(s1)
    wakeup(&ticks);
    80205c0e:	00025517          	auipc	a0,0x25
    80205c12:	b7250513          	addi	a0,a0,-1166 # 8022a780 <ticks>
    80205c16:	ffffd097          	auipc	ra,0xffffd
    80205c1a:	838080e7          	jalr	-1992(ra) # 8020244e <wakeup>
    release(&tickslock);
    80205c1e:	8526                	mv	a0,s1
    80205c20:	ffffb097          	auipc	ra,0xffffb
    80205c24:	afc080e7          	jalr	-1284(ra) # 8020071c <release>
    set_next_timeout();
    80205c28:	00000097          	auipc	ra,0x0
    80205c2c:	f9e080e7          	jalr	-98(ra) # 80205bc6 <set_next_timeout>
}
    80205c30:	60e2                	ld	ra,24(sp)
    80205c32:	6442                	ld	s0,16(sp)
    80205c34:	64a2                	ld	s1,8(sp)
    80205c36:	6105                	addi	sp,sp,32
    80205c38:	8082                	ret

0000000080205c3a <disk_init>:
#else
#include "include/virtio.h"
#endif 

void disk_init(void)
{
    80205c3a:	1141                	addi	sp,sp,-16
    80205c3c:	e406                	sd	ra,8(sp)
    80205c3e:	e022                	sd	s0,0(sp)
    80205c40:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_init();
    80205c42:	00002097          	auipc	ra,0x2
    80205c46:	e7a080e7          	jalr	-390(ra) # 80207abc <virtio_disk_init>
	#else 
	sdcard_init();
    #endif
}
    80205c4a:	60a2                	ld	ra,8(sp)
    80205c4c:	6402                	ld	s0,0(sp)
    80205c4e:	0141                	addi	sp,sp,16
    80205c50:	8082                	ret

0000000080205c52 <disk_read>:

void disk_read(struct buf *b)
{
    80205c52:	1141                	addi	sp,sp,-16
    80205c54:	e406                	sd	ra,8(sp)
    80205c56:	e022                	sd	s0,0(sp)
    80205c58:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 0);
    80205c5a:	4581                	li	a1,0
    80205c5c:	00002097          	auipc	ra,0x2
    80205c60:	fe8080e7          	jalr	-24(ra) # 80207c44 <virtio_disk_rw>
    #else 
	sdcard_read_sector(b->data, b->sectorno);
	#endif
}
    80205c64:	60a2                	ld	ra,8(sp)
    80205c66:	6402                	ld	s0,0(sp)
    80205c68:	0141                	addi	sp,sp,16
    80205c6a:	8082                	ret

0000000080205c6c <disk_write>:

void disk_write(struct buf *b)
{
    80205c6c:	1141                	addi	sp,sp,-16
    80205c6e:	e406                	sd	ra,8(sp)
    80205c70:	e022                	sd	s0,0(sp)
    80205c72:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 1);
    80205c74:	4585                	li	a1,1
    80205c76:	00002097          	auipc	ra,0x2
    80205c7a:	fce080e7          	jalr	-50(ra) # 80207c44 <virtio_disk_rw>
    #else 
	sdcard_write_sector(b->data, b->sectorno);
	#endif
}
    80205c7e:	60a2                	ld	ra,8(sp)
    80205c80:	6402                	ld	s0,0(sp)
    80205c82:	0141                	addi	sp,sp,16
    80205c84:	8082                	ret

0000000080205c86 <disk_intr>:

void disk_intr(void)
{
    80205c86:	1141                	addi	sp,sp,-16
    80205c88:	e406                	sd	ra,8(sp)
    80205c8a:	e022                	sd	s0,0(sp)
    80205c8c:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_intr();
    80205c8e:	00002097          	auipc	ra,0x2
    80205c92:	264080e7          	jalr	612(ra) # 80207ef2 <virtio_disk_intr>
    #else 
    dmac_intr(DMAC_CHANNEL0);
    #endif
}
    80205c96:	60a2                	ld	ra,8(sp)
    80205c98:	6402                	ld	s0,0(sp)
    80205c9a:	0141                	addi	sp,sp,16
    80205c9c:	8082                	ret

0000000080205c9e <read_fat>:
/**
 * Read the FAT table content corresponded to the given cluster number.
 * @param   cluster     the number of cluster which you want to read its content in FAT table
 */
static uint32 read_fat(uint32 cluster)
{
    80205c9e:	1101                	addi	sp,sp,-32
    80205ca0:	ec06                	sd	ra,24(sp)
    80205ca2:	e822                	sd	s0,16(sp)
    80205ca4:	e426                	sd	s1,8(sp)
    80205ca6:	e04a                	sd	s2,0(sp)
    80205ca8:	1000                	addi	s0,sp,32
    if (cluster >= FAT32_EOC) {
    80205caa:	100007b7          	lui	a5,0x10000
    80205cae:	17dd                	addi	a5,a5,-9
        return cluster;
    80205cb0:	84aa                	mv	s1,a0
    if (cluster >= FAT32_EOC) {
    80205cb2:	00a7ea63          	bltu	a5,a0,80205cc6 <read_fat+0x28>
    }
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205cb6:	00025797          	auipc	a5,0x25
    80205cba:	ada7a783          	lw	a5,-1318(a5) # 8022a790 <fat+0x8>
    80205cbe:	2785                	addiw	a5,a5,1
        return 0;
    80205cc0:	4481                	li	s1,0
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205cc2:	00a7f963          	bgeu	a5,a0,80205cd4 <read_fat+0x36>
    // here should be a cache layer for FAT table, but not implemented yet.
    struct buf *b = bread(0, fat_sec);
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    brelse(b);
    return next_clus;
}
    80205cc6:	8526                	mv	a0,s1
    80205cc8:	60e2                	ld	ra,24(sp)
    80205cca:	6442                	ld	s0,16(sp)
    80205ccc:	64a2                	ld	s1,8(sp)
    80205cce:	6902                	ld	s2,0(sp)
    80205cd0:	6105                	addi	sp,sp,32
    80205cd2:	8082                	ret
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80205cd4:	0025149b          	slliw	s1,a0,0x2
    80205cd8:	00025917          	auipc	s2,0x25
    80205cdc:	ab090913          	addi	s2,s2,-1360 # 8022a788 <fat>
    80205ce0:	01095783          	lhu	a5,16(s2)
    80205ce4:	02f4d7bb          	divuw	a5,s1,a5
    80205ce8:	01495583          	lhu	a1,20(s2)
    struct buf *b = bread(0, fat_sec);
    80205cec:	9dbd                	addw	a1,a1,a5
    80205cee:	4501                	li	a0,0
    80205cf0:	ffffe097          	auipc	ra,0xffffe
    80205cf4:	b0c080e7          	jalr	-1268(ra) # 802037fc <bread>
    return (cluster << 2) % fat.bpb.byts_per_sec;
    80205cf8:	01095783          	lhu	a5,16(s2)
    80205cfc:	02f4f4bb          	remuw	s1,s1,a5
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    80205d00:	1482                	slli	s1,s1,0x20
    80205d02:	9081                	srli	s1,s1,0x20
    80205d04:	94aa                	add	s1,s1,a0
    80205d06:	4ca4                	lw	s1,88(s1)
    brelse(b);
    80205d08:	ffffe097          	auipc	ra,0xffffe
    80205d0c:	c20080e7          	jalr	-992(ra) # 80203928 <brelse>
    return next_clus;
    80205d10:	bf5d                	j	80205cc6 <read_fat+0x28>

0000000080205d12 <alloc_clus>:
        brelse(b);
    }
}

static uint32 alloc_clus(uint8 dev)
{
    80205d12:	711d                	addi	sp,sp,-96
    80205d14:	ec86                	sd	ra,88(sp)
    80205d16:	e8a2                	sd	s0,80(sp)
    80205d18:	e4a6                	sd	s1,72(sp)
    80205d1a:	e0ca                	sd	s2,64(sp)
    80205d1c:	fc4e                	sd	s3,56(sp)
    80205d1e:	f852                	sd	s4,48(sp)
    80205d20:	f456                	sd	s5,40(sp)
    80205d22:	f05a                	sd	s6,32(sp)
    80205d24:	ec5e                	sd	s7,24(sp)
    80205d26:	e862                	sd	s8,16(sp)
    80205d28:	e466                	sd	s9,8(sp)
    80205d2a:	1080                	addi	s0,sp,96
    // should we keep a free cluster list? instead of searching fat every time.
    struct buf *b;
    uint32 sec = fat.bpb.rsvd_sec_cnt;
    80205d2c:	00025797          	auipc	a5,0x25
    80205d30:	a5c78793          	addi	a5,a5,-1444 # 8022a788 <fat>
    80205d34:	0147db83          	lhu	s7,20(a5)
    uint32 const ent_per_sec = fat.bpb.byts_per_sec / sizeof(uint32);
    80205d38:	0107d903          	lhu	s2,16(a5)
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205d3c:	539c                	lw	a5,32(a5)
    80205d3e:	10078263          	beqz	a5,80205e42 <alloc_clus+0x130>
    80205d42:	0029591b          	srliw	s2,s2,0x2
    80205d46:	0009099b          	sext.w	s3,s2
    80205d4a:	4b01                	li	s6,0
        b = bread(dev, sec);
    80205d4c:	00050a9b          	sext.w	s5,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205d50:	4c01                	li	s8,0
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205d52:	00025c97          	auipc	s9,0x25
    80205d56:	a36c8c93          	addi	s9,s9,-1482 # 8022a788 <fat>
    80205d5a:	a0c1                	j	80205e1a <alloc_clus+0x108>
            if (((uint32 *)(b->data))[j] == 0) {
                ((uint32 *)(b->data))[j] = FAT32_EOC + 7;
    80205d5c:	100007b7          	lui	a5,0x10000
    80205d60:	37fd                	addiw	a5,a5,-1
    80205d62:	c29c                	sw	a5,0(a3)
                bwrite(b);
    80205d64:	8552                	mv	a0,s4
    80205d66:	ffffe097          	auipc	ra,0xffffe
    80205d6a:	b86080e7          	jalr	-1146(ra) # 802038ec <bwrite>
                brelse(b);
    80205d6e:	8552                	mv	a0,s4
    80205d70:	ffffe097          	auipc	ra,0xffffe
    80205d74:	bb8080e7          	jalr	-1096(ra) # 80203928 <brelse>
                uint32 clus = i * ent_per_sec + j;
    80205d78:	0369093b          	mulw	s2,s2,s6
    80205d7c:	009904bb          	addw	s1,s2,s1
    80205d80:	00048a9b          	sext.w	s5,s1
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80205d84:	00025717          	auipc	a4,0x25
    80205d88:	a0470713          	addi	a4,a4,-1532 # 8022a788 <fat>
    80205d8c:	01274783          	lbu	a5,18(a4)
    80205d90:	34f9                	addiw	s1,s1,-2
    80205d92:	02f489bb          	mulw	s3,s1,a5
    80205d96:	4318                	lw	a4,0(a4)
    80205d98:	00e989bb          	addw	s3,s3,a4
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    80205d9c:	c7b1                	beqz	a5,80205de8 <alloc_clus+0xd6>
    80205d9e:	4901                	li	s2,0
    80205da0:	00025a17          	auipc	s4,0x25
    80205da4:	9e8a0a13          	addi	s4,s4,-1560 # 8022a788 <fat>
        b = bread(0, sec++);
    80205da8:	013905bb          	addw	a1,s2,s3
    80205dac:	4501                	li	a0,0
    80205dae:	ffffe097          	auipc	ra,0xffffe
    80205db2:	a4e080e7          	jalr	-1458(ra) # 802037fc <bread>
    80205db6:	84aa                	mv	s1,a0
        memset(b->data, 0, BSIZE);
    80205db8:	20000613          	li	a2,512
    80205dbc:	4581                	li	a1,0
    80205dbe:	05850513          	addi	a0,a0,88
    80205dc2:	ffffb097          	auipc	ra,0xffffb
    80205dc6:	9a2080e7          	jalr	-1630(ra) # 80200764 <memset>
        bwrite(b);
    80205dca:	8526                	mv	a0,s1
    80205dcc:	ffffe097          	auipc	ra,0xffffe
    80205dd0:	b20080e7          	jalr	-1248(ra) # 802038ec <bwrite>
        brelse(b);
    80205dd4:	8526                	mv	a0,s1
    80205dd6:	ffffe097          	auipc	ra,0xffffe
    80205dda:	b52080e7          	jalr	-1198(ra) # 80203928 <brelse>
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    80205dde:	2905                	addiw	s2,s2,1
    80205de0:	012a4783          	lbu	a5,18(s4)
    80205de4:	fcf942e3          	blt	s2,a5,80205da8 <alloc_clus+0x96>
            }
        }
        brelse(b);
    }
    panic("no clusters");
}
    80205de8:	8556                	mv	a0,s5
    80205dea:	60e6                	ld	ra,88(sp)
    80205dec:	6446                	ld	s0,80(sp)
    80205dee:	64a6                	ld	s1,72(sp)
    80205df0:	6906                	ld	s2,64(sp)
    80205df2:	79e2                	ld	s3,56(sp)
    80205df4:	7a42                	ld	s4,48(sp)
    80205df6:	7aa2                	ld	s5,40(sp)
    80205df8:	7b02                	ld	s6,32(sp)
    80205dfa:	6be2                	ld	s7,24(sp)
    80205dfc:	6c42                	ld	s8,16(sp)
    80205dfe:	6ca2                	ld	s9,8(sp)
    80205e00:	6125                	addi	sp,sp,96
    80205e02:	8082                	ret
        brelse(b);
    80205e04:	8552                	mv	a0,s4
    80205e06:	ffffe097          	auipc	ra,0xffffe
    80205e0a:	b22080e7          	jalr	-1246(ra) # 80203928 <brelse>
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205e0e:	2b05                	addiw	s6,s6,1
    80205e10:	2b85                	addiw	s7,s7,1
    80205e12:	020ca783          	lw	a5,32(s9)
    80205e16:	02fb7663          	bgeu	s6,a5,80205e42 <alloc_clus+0x130>
        b = bread(dev, sec);
    80205e1a:	85de                	mv	a1,s7
    80205e1c:	8556                	mv	a0,s5
    80205e1e:	ffffe097          	auipc	ra,0xffffe
    80205e22:	9de080e7          	jalr	-1570(ra) # 802037fc <bread>
    80205e26:	8a2a                	mv	s4,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205e28:	fc098ee3          	beqz	s3,80205e04 <alloc_clus+0xf2>
    80205e2c:	05850793          	addi	a5,a0,88
    80205e30:	84e2                	mv	s1,s8
            if (((uint32 *)(b->data))[j] == 0) {
    80205e32:	86be                	mv	a3,a5
    80205e34:	4398                	lw	a4,0(a5)
    80205e36:	d31d                	beqz	a4,80205d5c <alloc_clus+0x4a>
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205e38:	2485                	addiw	s1,s1,1
    80205e3a:	0791                	addi	a5,a5,4
    80205e3c:	fe999be3          	bne	s3,s1,80205e32 <alloc_clus+0x120>
    80205e40:	b7d1                	j	80205e04 <alloc_clus+0xf2>
    panic("no clusters");
    80205e42:	00004517          	auipc	a0,0x4
    80205e46:	e0e50513          	addi	a0,a0,-498 # 80209c50 <digits+0x8d0>
    80205e4a:	ffffa097          	auipc	ra,0xffffa
    80205e4e:	2f8080e7          	jalr	760(ra) # 80200142 <panic>

0000000080205e52 <write_fat>:
    if (cluster > fat.data_clus_cnt + 1) {
    80205e52:	00025797          	auipc	a5,0x25
    80205e56:	93e7a783          	lw	a5,-1730(a5) # 8022a790 <fat+0x8>
    80205e5a:	2785                	addiw	a5,a5,1
    80205e5c:	06a7e963          	bltu	a5,a0,80205ece <write_fat+0x7c>
{
    80205e60:	7179                	addi	sp,sp,-48
    80205e62:	f406                	sd	ra,40(sp)
    80205e64:	f022                	sd	s0,32(sp)
    80205e66:	ec26                	sd	s1,24(sp)
    80205e68:	e84a                	sd	s2,16(sp)
    80205e6a:	e44e                	sd	s3,8(sp)
    80205e6c:	e052                	sd	s4,0(sp)
    80205e6e:	1800                	addi	s0,sp,48
    80205e70:	89ae                	mv	s3,a1
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80205e72:	0025149b          	slliw	s1,a0,0x2
    80205e76:	00025a17          	auipc	s4,0x25
    80205e7a:	912a0a13          	addi	s4,s4,-1774 # 8022a788 <fat>
    80205e7e:	010a5783          	lhu	a5,16(s4)
    80205e82:	02f4d7bb          	divuw	a5,s1,a5
    80205e86:	014a5583          	lhu	a1,20(s4)
    struct buf *b = bread(0, fat_sec);
    80205e8a:	9dbd                	addw	a1,a1,a5
    80205e8c:	4501                	li	a0,0
    80205e8e:	ffffe097          	auipc	ra,0xffffe
    80205e92:	96e080e7          	jalr	-1682(ra) # 802037fc <bread>
    80205e96:	892a                	mv	s2,a0
    return (cluster << 2) % fat.bpb.byts_per_sec;
    80205e98:	010a5783          	lhu	a5,16(s4)
    80205e9c:	02f4f4bb          	remuw	s1,s1,a5
    *(uint32 *)(b->data + off) = content;
    80205ea0:	1482                	slli	s1,s1,0x20
    80205ea2:	9081                	srli	s1,s1,0x20
    80205ea4:	94aa                	add	s1,s1,a0
    80205ea6:	0534ac23          	sw	s3,88(s1)
    bwrite(b);
    80205eaa:	ffffe097          	auipc	ra,0xffffe
    80205eae:	a42080e7          	jalr	-1470(ra) # 802038ec <bwrite>
    brelse(b);
    80205eb2:	854a                	mv	a0,s2
    80205eb4:	ffffe097          	auipc	ra,0xffffe
    80205eb8:	a74080e7          	jalr	-1420(ra) # 80203928 <brelse>
    return 0;
    80205ebc:	4501                	li	a0,0
}
    80205ebe:	70a2                	ld	ra,40(sp)
    80205ec0:	7402                	ld	s0,32(sp)
    80205ec2:	64e2                	ld	s1,24(sp)
    80205ec4:	6942                	ld	s2,16(sp)
    80205ec6:	69a2                	ld	s3,8(sp)
    80205ec8:	6a02                	ld	s4,0(sp)
    80205eca:	6145                	addi	sp,sp,48
    80205ecc:	8082                	ret
        return -1;
    80205ece:	557d                	li	a0,-1
}
    80205ed0:	8082                	ret

0000000080205ed2 <reloc_clus>:
 * @param   off         the offset from the beginning of the relative file
 * @param   alloc       whether alloc new cluster when meeting end of FAT chains
 * @return              the offset from the new cur_clus
 */
static int reloc_clus(struct dirent *entry, uint off, int alloc)
{
    80205ed2:	715d                	addi	sp,sp,-80
    80205ed4:	e486                	sd	ra,72(sp)
    80205ed6:	e0a2                	sd	s0,64(sp)
    80205ed8:	fc26                	sd	s1,56(sp)
    80205eda:	f84a                	sd	s2,48(sp)
    80205edc:	f44e                	sd	s3,40(sp)
    80205ede:	f052                	sd	s4,32(sp)
    80205ee0:	ec56                	sd	s5,24(sp)
    80205ee2:	e85a                	sd	s6,16(sp)
    80205ee4:	e45e                	sd	s7,8(sp)
    80205ee6:	0880                	addi	s0,sp,80
    80205ee8:	84aa                	mv	s1,a0
    80205eea:	8a2e                	mv	s4,a1
    int clus_num = off / fat.byts_per_clus;
    80205eec:	00025b97          	auipc	s7,0x25
    80205ef0:	8a8bab83          	lw	s7,-1880(s7) # 8022a794 <fat+0xc>
    80205ef4:	0375d9bb          	divuw	s3,a1,s7
    while (clus_num > entry->clus_cnt) {
    80205ef8:	11052703          	lw	a4,272(a0)
    80205efc:	07377663          	bgeu	a4,s3,80205f68 <reloc_clus+0x96>
    80205f00:	8b32                	mv	s6,a2
        int clus = read_fat(entry->cur_clus);
        if (clus >= FAT32_EOC) {
    80205f02:	10000ab7          	lui	s5,0x10000
    80205f06:	1add                	addi	s5,s5,-9
    80205f08:	a025                	j	80205f30 <reloc_clus+0x5e>
            if (alloc) {
                clus = alloc_clus(entry->dev);
                write_fat(entry->cur_clus, clus);
            } else {
                entry->cur_clus = entry->first_clus;
    80205f0a:	1044a783          	lw	a5,260(s1)
    80205f0e:	10f4a623          	sw	a5,268(s1)
                entry->clus_cnt = 0;
    80205f12:	1004a823          	sw	zero,272(s1)
                return -1;
    80205f16:	557d                	li	a0,-1
    80205f18:	a879                	j	80205fb6 <reloc_clus+0xe4>
            }
        }
        entry->cur_clus = clus;
    80205f1a:	1124a623          	sw	s2,268(s1)
        entry->clus_cnt++;
    80205f1e:	1104a783          	lw	a5,272(s1)
    80205f22:	2785                	addiw	a5,a5,1
    80205f24:	0007871b          	sext.w	a4,a5
    80205f28:	10f4a823          	sw	a5,272(s1)
    while (clus_num > entry->clus_cnt) {
    80205f2c:	03377e63          	bgeu	a4,s3,80205f68 <reloc_clus+0x96>
        int clus = read_fat(entry->cur_clus);
    80205f30:	10c4a503          	lw	a0,268(s1)
    80205f34:	00000097          	auipc	ra,0x0
    80205f38:	d6a080e7          	jalr	-662(ra) # 80205c9e <read_fat>
    80205f3c:	0005091b          	sext.w	s2,a0
        if (clus >= FAT32_EOC) {
    80205f40:	fd2adde3          	bge	s5,s2,80205f1a <reloc_clus+0x48>
            if (alloc) {
    80205f44:	fc0b03e3          	beqz	s6,80205f0a <reloc_clus+0x38>
                clus = alloc_clus(entry->dev);
    80205f48:	1144c503          	lbu	a0,276(s1)
    80205f4c:	00000097          	auipc	ra,0x0
    80205f50:	dc6080e7          	jalr	-570(ra) # 80205d12 <alloc_clus>
    80205f54:	0005091b          	sext.w	s2,a0
                write_fat(entry->cur_clus, clus);
    80205f58:	85ca                	mv	a1,s2
    80205f5a:	10c4a503          	lw	a0,268(s1)
    80205f5e:	00000097          	auipc	ra,0x0
    80205f62:	ef4080e7          	jalr	-268(ra) # 80205e52 <write_fat>
    80205f66:	bf55                	j	80205f1a <reloc_clus+0x48>
    }
    if (clus_num < entry->clus_cnt) {
    80205f68:	04e9f163          	bgeu	s3,a4,80205faa <reloc_clus+0xd8>
        entry->cur_clus = entry->first_clus;
    80205f6c:	1044a783          	lw	a5,260(s1)
    80205f70:	10f4a623          	sw	a5,268(s1)
        entry->clus_cnt = 0;
    80205f74:	1004a823          	sw	zero,272(s1)
        while (entry->clus_cnt < clus_num) {
    80205f78:	037a6963          	bltu	s4,s7,80205faa <reloc_clus+0xd8>
            entry->cur_clus = read_fat(entry->cur_clus);
            if (entry->cur_clus >= FAT32_EOC) {
    80205f7c:	10000937          	lui	s2,0x10000
    80205f80:	195d                	addi	s2,s2,-9
            entry->cur_clus = read_fat(entry->cur_clus);
    80205f82:	10c4a503          	lw	a0,268(s1)
    80205f86:	00000097          	auipc	ra,0x0
    80205f8a:	d18080e7          	jalr	-744(ra) # 80205c9e <read_fat>
    80205f8e:	2501                	sext.w	a0,a0
    80205f90:	10a4a623          	sw	a0,268(s1)
            if (entry->cur_clus >= FAT32_EOC) {
    80205f94:	02a96c63          	bltu	s2,a0,80205fcc <reloc_clus+0xfa>
                panic("reloc_clus");
            }
            entry->clus_cnt++;
    80205f98:	1104a783          	lw	a5,272(s1)
    80205f9c:	2785                	addiw	a5,a5,1
    80205f9e:	0007871b          	sext.w	a4,a5
    80205fa2:	10f4a823          	sw	a5,272(s1)
        while (entry->clus_cnt < clus_num) {
    80205fa6:	fd376ee3          	bltu	a4,s3,80205f82 <reloc_clus+0xb0>
        }
    }
    return off % fat.byts_per_clus;
    80205faa:	00024517          	auipc	a0,0x24
    80205fae:	7ea52503          	lw	a0,2026(a0) # 8022a794 <fat+0xc>
    80205fb2:	02aa753b          	remuw	a0,s4,a0
}
    80205fb6:	60a6                	ld	ra,72(sp)
    80205fb8:	6406                	ld	s0,64(sp)
    80205fba:	74e2                	ld	s1,56(sp)
    80205fbc:	7942                	ld	s2,48(sp)
    80205fbe:	79a2                	ld	s3,40(sp)
    80205fc0:	7a02                	ld	s4,32(sp)
    80205fc2:	6ae2                	ld	s5,24(sp)
    80205fc4:	6b42                	ld	s6,16(sp)
    80205fc6:	6ba2                	ld	s7,8(sp)
    80205fc8:	6161                	addi	sp,sp,80
    80205fca:	8082                	ret
                panic("reloc_clus");
    80205fcc:	00004517          	auipc	a0,0x4
    80205fd0:	c9450513          	addi	a0,a0,-876 # 80209c60 <digits+0x8e0>
    80205fd4:	ffffa097          	auipc	ra,0xffffa
    80205fd8:	16e080e7          	jalr	366(ra) # 80200142 <panic>

0000000080205fdc <rw_clus>:
{
    80205fdc:	7119                	addi	sp,sp,-128
    80205fde:	fc86                	sd	ra,120(sp)
    80205fe0:	f8a2                	sd	s0,112(sp)
    80205fe2:	f4a6                	sd	s1,104(sp)
    80205fe4:	f0ca                	sd	s2,96(sp)
    80205fe6:	ecce                	sd	s3,88(sp)
    80205fe8:	e8d2                	sd	s4,80(sp)
    80205fea:	e4d6                	sd	s5,72(sp)
    80205fec:	e0da                	sd	s6,64(sp)
    80205fee:	fc5e                	sd	s7,56(sp)
    80205ff0:	f862                	sd	s8,48(sp)
    80205ff2:	f466                	sd	s9,40(sp)
    80205ff4:	f06a                	sd	s10,32(sp)
    80205ff6:	ec6e                	sd	s11,24(sp)
    80205ff8:	0100                	addi	s0,sp,128
    80205ffa:	f8c43423          	sd	a2,-120(s0)
    80205ffe:	8b36                	mv	s6,a3
    80206000:	8c3e                	mv	s8,a5
    if (off + n > fat.byts_per_clus)
    80206002:	00f706bb          	addw	a3,a4,a5
    80206006:	00024797          	auipc	a5,0x24
    8020600a:	78e7a783          	lw	a5,1934(a5) # 8022a794 <fat+0xc>
    8020600e:	02d7ef63          	bltu	a5,a3,8020604c <rw_clus+0x70>
    80206012:	8cae                	mv	s9,a1
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80206014:	00024797          	auipc	a5,0x24
    80206018:	77478793          	addi	a5,a5,1908 # 8022a788 <fat>
    8020601c:	0107da83          	lhu	s5,16(a5)
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80206020:	ffe5099b          	addiw	s3,a0,-2
    80206024:	0127c503          	lbu	a0,18(a5)
    80206028:	02a989bb          	mulw	s3,s3,a0
    8020602c:	4388                	lw	a0,0(a5)
    8020602e:	00a989bb          	addw	s3,s3,a0
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80206032:	035757bb          	divuw	a5,a4,s5
    80206036:	00f989bb          	addw	s3,s3,a5
    off = off % fat.bpb.byts_per_sec;
    8020603a:	03577abb          	remuw	s5,a4,s5
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    8020603e:	0e0c0363          	beqz	s8,80206124 <rw_clus+0x148>
    80206042:	4a01                	li	s4,0
        m = BSIZE - off % BSIZE;
    80206044:	20000d93          	li	s11,512
        if (bad == -1) {
    80206048:	5d7d                	li	s10,-1
    8020604a:	a095                	j	802060ae <rw_clus+0xd2>
        panic("offset out of range");
    8020604c:	00004517          	auipc	a0,0x4
    80206050:	c2450513          	addi	a0,a0,-988 # 80209c70 <digits+0x8f0>
    80206054:	ffffa097          	auipc	ra,0xffffa
    80206058:	0ee080e7          	jalr	238(ra) # 80200142 <panic>
                bwrite(bp);
    8020605c:	854a                	mv	a0,s2
    8020605e:	ffffe097          	auipc	ra,0xffffe
    80206062:	88e080e7          	jalr	-1906(ra) # 802038ec <bwrite>
        brelse(bp);
    80206066:	854a                	mv	a0,s2
    80206068:	ffffe097          	auipc	ra,0xffffe
    8020606c:	8c0080e7          	jalr	-1856(ra) # 80203928 <brelse>
        if (bad == -1) {
    80206070:	a02d                	j	8020609a <rw_clus+0xbe>
            bad = either_copyout(user, data, bp->data + (off % BSIZE), m);
    80206072:	05890613          	addi	a2,s2,88 # 10000058 <_entry-0x701fffa8>
    80206076:	1682                	slli	a3,a3,0x20
    80206078:	9281                	srli	a3,a3,0x20
    8020607a:	963a                	add	a2,a2,a4
    8020607c:	85da                	mv	a1,s6
    8020607e:	f8843503          	ld	a0,-120(s0)
    80206082:	ffffc097          	auipc	ra,0xffffc
    80206086:	4a8080e7          	jalr	1192(ra) # 8020252a <either_copyout>
    8020608a:	8baa                	mv	s7,a0
        brelse(bp);
    8020608c:	854a                	mv	a0,s2
    8020608e:	ffffe097          	auipc	ra,0xffffe
    80206092:	89a080e7          	jalr	-1894(ra) # 80203928 <brelse>
        if (bad == -1) {
    80206096:	07ab8763          	beq	s7,s10,80206104 <rw_clus+0x128>
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    8020609a:	01448a3b          	addw	s4,s1,s4
    8020609e:	01548abb          	addw	s5,s1,s5
    802060a2:	1482                	slli	s1,s1,0x20
    802060a4:	9081                	srli	s1,s1,0x20
    802060a6:	9b26                	add	s6,s6,s1
    802060a8:	2985                	addiw	s3,s3,1
    802060aa:	058a7d63          	bgeu	s4,s8,80206104 <rw_clus+0x128>
        bp = bread(0, sec);
    802060ae:	85ce                	mv	a1,s3
    802060b0:	4501                	li	a0,0
    802060b2:	ffffd097          	auipc	ra,0xffffd
    802060b6:	74a080e7          	jalr	1866(ra) # 802037fc <bread>
    802060ba:	892a                	mv	s2,a0
        m = BSIZE - off % BSIZE;
    802060bc:	1ffaf713          	andi	a4,s5,511
    802060c0:	40ed863b          	subw	a2,s11,a4
        if (n - tot < m) {
    802060c4:	414c07bb          	subw	a5,s8,s4
    802060c8:	86be                	mv	a3,a5
    802060ca:	2781                	sext.w	a5,a5
    802060cc:	0006059b          	sext.w	a1,a2
    802060d0:	00f5f363          	bgeu	a1,a5,802060d6 <rw_clus+0xfa>
    802060d4:	86b2                	mv	a3,a2
    802060d6:	0006849b          	sext.w	s1,a3
        if (write) {
    802060da:	f80c8ce3          	beqz	s9,80206072 <rw_clus+0x96>
            if ((bad = either_copyin(bp->data + (off % BSIZE), user, data, m)) != -1) {
    802060de:	05890513          	addi	a0,s2,88
    802060e2:	1682                	slli	a3,a3,0x20
    802060e4:	9281                	srli	a3,a3,0x20
    802060e6:	865a                	mv	a2,s6
    802060e8:	f8843583          	ld	a1,-120(s0)
    802060ec:	953a                	add	a0,a0,a4
    802060ee:	ffffc097          	auipc	ra,0xffffc
    802060f2:	472080e7          	jalr	1138(ra) # 80202560 <either_copyin>
    802060f6:	f7a513e3          	bne	a0,s10,8020605c <rw_clus+0x80>
        brelse(bp);
    802060fa:	854a                	mv	a0,s2
    802060fc:	ffffe097          	auipc	ra,0xffffe
    80206100:	82c080e7          	jalr	-2004(ra) # 80203928 <brelse>
}
    80206104:	8552                	mv	a0,s4
    80206106:	70e6                	ld	ra,120(sp)
    80206108:	7446                	ld	s0,112(sp)
    8020610a:	74a6                	ld	s1,104(sp)
    8020610c:	7906                	ld	s2,96(sp)
    8020610e:	69e6                	ld	s3,88(sp)
    80206110:	6a46                	ld	s4,80(sp)
    80206112:	6aa6                	ld	s5,72(sp)
    80206114:	6b06                	ld	s6,64(sp)
    80206116:	7be2                	ld	s7,56(sp)
    80206118:	7c42                	ld	s8,48(sp)
    8020611a:	7ca2                	ld	s9,40(sp)
    8020611c:	7d02                	ld	s10,32(sp)
    8020611e:	6de2                	ld	s11,24(sp)
    80206120:	6109                	addi	sp,sp,128
    80206122:	8082                	ret
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    80206124:	8a62                	mv	s4,s8
    80206126:	bff9                	j	80206104 <rw_clus+0x128>

0000000080206128 <eget>:
// by their whole path. But when parsing a path, we open all the directories through it, 
// which forms a linked list from the final file to the root. Thus, we use the "parent" pointer 
// to recognize whether an entry with the "name" as given is really the file we want in the right path.
// Should never get root by eget, it's easy to understand.
static struct dirent *eget(struct dirent *parent, char *name)
{
    80206128:	7139                	addi	sp,sp,-64
    8020612a:	fc06                	sd	ra,56(sp)
    8020612c:	f822                	sd	s0,48(sp)
    8020612e:	f426                	sd	s1,40(sp)
    80206130:	f04a                	sd	s2,32(sp)
    80206132:	ec4e                	sd	s3,24(sp)
    80206134:	e852                	sd	s4,16(sp)
    80206136:	e456                	sd	s5,8(sp)
    80206138:	0080                	addi	s0,sp,64
    8020613a:	8a2a                	mv	s4,a0
    8020613c:	8aae                	mv	s5,a1
    struct dirent *ep;
    acquire(&ecache.lock);
    8020613e:	00024517          	auipc	a0,0x24
    80206142:	7da50513          	addi	a0,a0,2010 # 8022a918 <ecache>
    80206146:	ffffa097          	auipc	ra,0xffffa
    8020614a:	582080e7          	jalr	1410(ra) # 802006c8 <acquire>
    if (name) {
    8020614e:	060a8b63          	beqz	s5,802061c4 <eget+0x9c>
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    80206152:	00024497          	auipc	s1,0x24
    80206156:	7864b483          	ld	s1,1926(s1) # 8022a8d8 <root+0x128>
    8020615a:	00024797          	auipc	a5,0x24
    8020615e:	65678793          	addi	a5,a5,1622 # 8022a7b0 <root>
    80206162:	06f48163          	beq	s1,a5,802061c4 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80206166:	4905                	li	s2,1
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    80206168:	89be                	mv	s3,a5
    8020616a:	a029                	j	80206174 <eget+0x4c>
    8020616c:	1284b483          	ld	s1,296(s1)
    80206170:	05348a63          	beq	s1,s3,802061c4 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80206174:	11649783          	lh	a5,278(s1)
    80206178:	ff279ae3          	bne	a5,s2,8020616c <eget+0x44>
    8020617c:	1204b783          	ld	a5,288(s1)
    80206180:	ff4796e3          	bne	a5,s4,8020616c <eget+0x44>
                && strncmp(ep->filename, name, FAT32_MAX_FILENAME) == 0) {
    80206184:	0ff00613          	li	a2,255
    80206188:	85d6                	mv	a1,s5
    8020618a:	8526                	mv	a0,s1
    8020618c:	ffffa097          	auipc	ra,0xffffa
    80206190:	6b4080e7          	jalr	1716(ra) # 80200840 <strncmp>
    80206194:	fd61                	bnez	a0,8020616c <eget+0x44>
                if (ep->ref++ == 0) {
    80206196:	1184a783          	lw	a5,280(s1)
    8020619a:	0017871b          	addiw	a4,a5,1
    8020619e:	10e4ac23          	sw	a4,280(s1)
    802061a2:	eb81                	bnez	a5,802061b2 <eget+0x8a>
                    ep->parent->ref++;
    802061a4:	1204b703          	ld	a4,288(s1)
    802061a8:	11872783          	lw	a5,280(a4)
    802061ac:	2785                	addiw	a5,a5,1
    802061ae:	10f72c23          	sw	a5,280(a4)
                }
                release(&ecache.lock);
    802061b2:	00024517          	auipc	a0,0x24
    802061b6:	76650513          	addi	a0,a0,1894 # 8022a918 <ecache>
    802061ba:	ffffa097          	auipc	ra,0xffffa
    802061be:	562080e7          	jalr	1378(ra) # 8020071c <release>
                // edup(ep->parent);
                return ep;
    802061c2:	a085                	j	80206222 <eget+0xfa>
            }
        }
    }
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    802061c4:	00024497          	auipc	s1,0x24
    802061c8:	71c4b483          	ld	s1,1820(s1) # 8022a8e0 <root+0x130>
    802061cc:	00024797          	auipc	a5,0x24
    802061d0:	5e478793          	addi	a5,a5,1508 # 8022a7b0 <root>
    802061d4:	00f48a63          	beq	s1,a5,802061e8 <eget+0xc0>
    802061d8:	873e                	mv	a4,a5
        if (ep->ref == 0) {
    802061da:	1184a783          	lw	a5,280(s1)
    802061de:	cf89                	beqz	a5,802061f8 <eget+0xd0>
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    802061e0:	1304b483          	ld	s1,304(s1)
    802061e4:	fee49be3          	bne	s1,a4,802061da <eget+0xb2>
            ep->dirty = 0;
            release(&ecache.lock);
            return ep;
        }
    }
    panic("eget: insufficient ecache");
    802061e8:	00004517          	auipc	a0,0x4
    802061ec:	aa050513          	addi	a0,a0,-1376 # 80209c88 <digits+0x908>
    802061f0:	ffffa097          	auipc	ra,0xffffa
    802061f4:	f52080e7          	jalr	-174(ra) # 80200142 <panic>
            ep->ref = 1;
    802061f8:	4785                	li	a5,1
    802061fa:	10f4ac23          	sw	a5,280(s1)
            ep->dev = parent->dev;
    802061fe:	114a4783          	lbu	a5,276(s4)
    80206202:	10f48a23          	sb	a5,276(s1)
            ep->off = 0;
    80206206:	1004ae23          	sw	zero,284(s1)
            ep->valid = 0;
    8020620a:	10049b23          	sh	zero,278(s1)
            ep->dirty = 0;
    8020620e:	10048aa3          	sb	zero,277(s1)
            release(&ecache.lock);
    80206212:	00024517          	auipc	a0,0x24
    80206216:	70650513          	addi	a0,a0,1798 # 8022a918 <ecache>
    8020621a:	ffffa097          	auipc	ra,0xffffa
    8020621e:	502080e7          	jalr	1282(ra) # 8020071c <release>
    return 0;
}
    80206222:	8526                	mv	a0,s1
    80206224:	70e2                	ld	ra,56(sp)
    80206226:	7442                	ld	s0,48(sp)
    80206228:	74a2                	ld	s1,40(sp)
    8020622a:	7902                	ld	s2,32(sp)
    8020622c:	69e2                	ld	s3,24(sp)
    8020622e:	6a42                	ld	s4,16(sp)
    80206230:	6aa2                	ld	s5,8(sp)
    80206232:	6121                	addi	sp,sp,64
    80206234:	8082                	ret

0000000080206236 <read_entry_name>:
 * @param   buffer      pointer to the array that stores the name
 * @param   raw_entry   pointer to the entry in a sector buffer
 * @param   islong      if non-zero, read as l-n-e, otherwise s-n-e.
 */
static void read_entry_name(char *buffer, union dentry *d)
{
    80206236:	7139                	addi	sp,sp,-64
    80206238:	fc06                	sd	ra,56(sp)
    8020623a:	f822                	sd	s0,48(sp)
    8020623c:	f426                	sd	s1,40(sp)
    8020623e:	f04a                	sd	s2,32(sp)
    80206240:	ec4e                	sd	s3,24(sp)
    80206242:	0080                	addi	s0,sp,64
    80206244:	84aa                	mv	s1,a0
    80206246:	892e                	mv	s2,a1
    if (d->lne.attr == ATTR_LONG_NAME) {                       // long entry branch
    80206248:	00b5c703          	lbu	a4,11(a1)
    8020624c:	47bd                	li	a5,15
    8020624e:	08f70563          	beq	a4,a5,802062d8 <read_entry_name+0xa2>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
        buffer += NELEM(d->lne.name2);
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    } else {
        // assert: only "." and ".." will enter this branch
        memset(buffer, 0, CHAR_SHORT_NAME + 2); // plus '.' and '\0'
    80206252:	4635                	li	a2,13
    80206254:	4581                	li	a1,0
    80206256:	ffffa097          	auipc	ra,0xffffa
    8020625a:	50e080e7          	jalr	1294(ra) # 80200764 <memset>
        int i;
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    8020625e:	00094703          	lbu	a4,0(s2)
    80206262:	02000793          	li	a5,32
    80206266:	0af70c63          	beq	a4,a5,8020631e <read_entry_name+0xe8>
    8020626a:	4785                	li	a5,1
    8020626c:	02000613          	li	a2,32
    80206270:	45a5                	li	a1,9
            buffer[i] = d->sne.name[i];
    80206272:	00f486b3          	add	a3,s1,a5
    80206276:	fee68fa3          	sb	a4,-1(a3) # 1fff <_entry-0x801fe001>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    8020627a:	0007851b          	sext.w	a0,a5
    8020627e:	00f90733          	add	a4,s2,a5
    80206282:	00074703          	lbu	a4,0(a4)
    80206286:	00c70563          	beq	a4,a2,80206290 <read_entry_name+0x5a>
    8020628a:	0785                	addi	a5,a5,1
    8020628c:	feb793e3          	bne	a5,a1,80206272 <read_entry_name+0x3c>
        }
        if (d->sne.name[8] != ' ') {
    80206290:	00894703          	lbu	a4,8(s2)
    80206294:	02000793          	li	a5,32
    80206298:	00f70963          	beq	a4,a5,802062aa <read_entry_name+0x74>
            buffer[i++] = '.';
    8020629c:	00a487b3          	add	a5,s1,a0
    802062a0:	02e00713          	li	a4,46
    802062a4:	00e78023          	sb	a4,0(a5)
    802062a8:	2505                	addiw	a0,a0,1
        }
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    802062aa:	00890793          	addi	a5,s2,8
    802062ae:	94aa                	add	s1,s1,a0
    802062b0:	092d                	addi	s2,s2,11
            if (d->sne.name[j] == ' ') { break; }
    802062b2:	02000693          	li	a3,32
    802062b6:	0007c703          	lbu	a4,0(a5)
    802062ba:	00d70863          	beq	a4,a3,802062ca <read_entry_name+0x94>
            buffer[i] = d->sne.name[j];
    802062be:	00e48023          	sb	a4,0(s1)
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    802062c2:	0785                	addi	a5,a5,1
    802062c4:	0485                	addi	s1,s1,1
    802062c6:	ff2798e3          	bne	a5,s2,802062b6 <read_entry_name+0x80>
        }
    }
}
    802062ca:	70e2                	ld	ra,56(sp)
    802062cc:	7442                	ld	s0,48(sp)
    802062ce:	74a2                	ld	s1,40(sp)
    802062d0:	7902                	ld	s2,32(sp)
    802062d2:	69e2                	ld	s3,24(sp)
    802062d4:	6121                	addi	sp,sp,64
    802062d6:	8082                	ret
        memmove(temp, d->lne.name1, sizeof(temp));
    802062d8:	4629                	li	a2,10
    802062da:	0585                	addi	a1,a1,1
    802062dc:	fc040993          	addi	s3,s0,-64
    802062e0:	854e                	mv	a0,s3
    802062e2:	ffffa097          	auipc	ra,0xffffa
    802062e6:	4e2080e7          	jalr	1250(ra) # 802007c4 <memmove>
        snstr(buffer, temp, NELEM(d->lne.name1));
    802062ea:	4615                	li	a2,5
    802062ec:	85ce                	mv	a1,s3
    802062ee:	8526                	mv	a0,s1
    802062f0:	ffffa097          	auipc	ra,0xffffa
    802062f4:	65a080e7          	jalr	1626(ra) # 8020094a <snstr>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
    802062f8:	4619                	li	a2,6
    802062fa:	00e90593          	addi	a1,s2,14
    802062fe:	00548513          	addi	a0,s1,5
    80206302:	ffffa097          	auipc	ra,0xffffa
    80206306:	648080e7          	jalr	1608(ra) # 8020094a <snstr>
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    8020630a:	4609                	li	a2,2
    8020630c:	01c90593          	addi	a1,s2,28
    80206310:	00b48513          	addi	a0,s1,11
    80206314:	ffffa097          	auipc	ra,0xffffa
    80206318:	636080e7          	jalr	1590(ra) # 8020094a <snstr>
    8020631c:	b77d                	j	802062ca <read_entry_name+0x94>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    8020631e:	4501                	li	a0,0
    80206320:	bf85                	j	80206290 <read_entry_name+0x5a>

0000000080206322 <fat32_init>:
{
    80206322:	7139                	addi	sp,sp,-64
    80206324:	fc06                	sd	ra,56(sp)
    80206326:	f822                	sd	s0,48(sp)
    80206328:	f426                	sd	s1,40(sp)
    8020632a:	f04a                	sd	s2,32(sp)
    8020632c:	ec4e                	sd	s3,24(sp)
    8020632e:	e852                	sd	s4,16(sp)
    80206330:	e456                	sd	s5,8(sp)
    80206332:	0080                	addi	s0,sp,64
    struct buf *b = bread(0, 0);
    80206334:	4581                	li	a1,0
    80206336:	4501                	li	a0,0
    80206338:	ffffd097          	auipc	ra,0xffffd
    8020633c:	4c4080e7          	jalr	1220(ra) # 802037fc <bread>
    80206340:	892a                	mv	s2,a0
    if (strncmp((char const*)(b->data + 82), "FAT32", 5))
    80206342:	4615                	li	a2,5
    80206344:	00004597          	auipc	a1,0x4
    80206348:	96458593          	addi	a1,a1,-1692 # 80209ca8 <digits+0x928>
    8020634c:	0aa50513          	addi	a0,a0,170
    80206350:	ffffa097          	auipc	ra,0xffffa
    80206354:	4f0080e7          	jalr	1264(ra) # 80200840 <strncmp>
    80206358:	16051863          	bnez	a0,802064c8 <fat32_init+0x1a6>
    memmove(&fat.bpb.byts_per_sec, b->data + 11, 2);            // avoid misaligned load on k210
    8020635c:	00024497          	auipc	s1,0x24
    80206360:	42c48493          	addi	s1,s1,1068 # 8022a788 <fat>
    80206364:	4609                	li	a2,2
    80206366:	06390593          	addi	a1,s2,99
    8020636a:	00024517          	auipc	a0,0x24
    8020636e:	42e50513          	addi	a0,a0,1070 # 8022a798 <fat+0x10>
    80206372:	ffffa097          	auipc	ra,0xffffa
    80206376:	452080e7          	jalr	1106(ra) # 802007c4 <memmove>
    fat.bpb.sec_per_clus = *(b->data + 13);
    8020637a:	06594683          	lbu	a3,101(s2)
    8020637e:	00d48923          	sb	a3,18(s1)
    fat.bpb.rsvd_sec_cnt = *(uint16 *)(b->data + 14);
    80206382:	06695603          	lhu	a2,102(s2)
    80206386:	00c49a23          	sh	a2,20(s1)
    fat.bpb.fat_cnt = *(b->data + 16);
    8020638a:	06894703          	lbu	a4,104(s2)
    8020638e:	00e48b23          	sb	a4,22(s1)
    fat.bpb.hidd_sec = *(uint32 *)(b->data + 28);
    80206392:	07492783          	lw	a5,116(s2)
    80206396:	cc9c                	sw	a5,24(s1)
    fat.bpb.tot_sec = *(uint32 *)(b->data + 32);
    80206398:	07892783          	lw	a5,120(s2)
    8020639c:	ccdc                	sw	a5,28(s1)
    fat.bpb.fat_sz = *(uint32 *)(b->data + 36);
    8020639e:	07c92583          	lw	a1,124(s2)
    802063a2:	d08c                	sw	a1,32(s1)
    fat.bpb.root_clus = *(uint32 *)(b->data + 44);
    802063a4:	08492503          	lw	a0,132(s2)
    802063a8:	d0c8                	sw	a0,36(s1)
    fat.first_data_sec = fat.bpb.rsvd_sec_cnt + fat.bpb.fat_cnt * fat.bpb.fat_sz;
    802063aa:	02b7073b          	mulw	a4,a4,a1
    802063ae:	9f31                	addw	a4,a4,a2
    802063b0:	c098                	sw	a4,0(s1)
    fat.data_sec_cnt = fat.bpb.tot_sec - fat.first_data_sec;
    802063b2:	9f99                	subw	a5,a5,a4
    802063b4:	c0dc                	sw	a5,4(s1)
    fat.data_clus_cnt = fat.data_sec_cnt / fat.bpb.sec_per_clus;
    802063b6:	02d7d7bb          	divuw	a5,a5,a3
    802063ba:	c49c                	sw	a5,8(s1)
    fat.byts_per_clus = fat.bpb.sec_per_clus * fat.bpb.byts_per_sec;
    802063bc:	0104d783          	lhu	a5,16(s1)
    802063c0:	02d787bb          	mulw	a5,a5,a3
    802063c4:	c4dc                	sw	a5,12(s1)
    brelse(b);
    802063c6:	854a                	mv	a0,s2
    802063c8:	ffffd097          	auipc	ra,0xffffd
    802063cc:	560080e7          	jalr	1376(ra) # 80203928 <brelse>
    if (BSIZE != fat.bpb.byts_per_sec) 
    802063d0:	0104d703          	lhu	a4,16(s1)
    802063d4:	20000793          	li	a5,512
    802063d8:	10f71063          	bne	a4,a5,802064d8 <fat32_init+0x1b6>
    initlock(&ecache.lock, "ecache");
    802063dc:	00004597          	auipc	a1,0x4
    802063e0:	90458593          	addi	a1,a1,-1788 # 80209ce0 <digits+0x960>
    802063e4:	00024517          	auipc	a0,0x24
    802063e8:	53450513          	addi	a0,a0,1332 # 8022a918 <ecache>
    802063ec:	ffffa097          	auipc	ra,0xffffa
    802063f0:	298080e7          	jalr	664(ra) # 80200684 <initlock>
    memset(&root, 0, sizeof(root));
    802063f4:	00024497          	auipc	s1,0x24
    802063f8:	39448493          	addi	s1,s1,916 # 8022a788 <fat>
    802063fc:	00024917          	auipc	s2,0x24
    80206400:	3b490913          	addi	s2,s2,948 # 8022a7b0 <root>
    80206404:	16800613          	li	a2,360
    80206408:	4581                	li	a1,0
    8020640a:	854a                	mv	a0,s2
    8020640c:	ffffa097          	auipc	ra,0xffffa
    80206410:	358080e7          	jalr	856(ra) # 80200764 <memset>
    initsleeplock(&root.lock, "entry");
    80206414:	00004597          	auipc	a1,0x4
    80206418:	8d458593          	addi	a1,a1,-1836 # 80209ce8 <digits+0x968>
    8020641c:	00024517          	auipc	a0,0x24
    80206420:	4cc50513          	addi	a0,a0,1228 # 8022a8e8 <root+0x138>
    80206424:	ffffd097          	auipc	ra,0xffffd
    80206428:	61a080e7          	jalr	1562(ra) # 80203a3e <initsleeplock>
    root.attribute = (ATTR_DIRECTORY | ATTR_SYSTEM);
    8020642c:	47d1                	li	a5,20
    8020642e:	12f48423          	sb	a5,296(s1)
    root.first_clus = root.cur_clus = fat.bpb.root_clus;
    80206432:	50dc                	lw	a5,36(s1)
    80206434:	12f4aa23          	sw	a5,308(s1)
    80206438:	12f4a623          	sw	a5,300(s1)
    root.valid = 1;
    8020643c:	4785                	li	a5,1
    8020643e:	12f49f23          	sh	a5,318(s1)
    root.prev = &root;
    80206442:	1524bc23          	sd	s2,344(s1)
    root.next = &root;
    80206446:	1524b823          	sd	s2,336(s1)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    8020644a:	00024497          	auipc	s1,0x24
    8020644e:	4e648493          	addi	s1,s1,1254 # 8022a930 <ecache+0x18>
        de->next = root.next;
    80206452:	00024917          	auipc	s2,0x24
    80206456:	33690913          	addi	s2,s2,822 # 8022a788 <fat>
        de->prev = &root;
    8020645a:	00024a97          	auipc	s5,0x24
    8020645e:	356a8a93          	addi	s5,s5,854 # 8022a7b0 <root>
        initsleeplock(&de->lock, "entry");
    80206462:	00004a17          	auipc	s4,0x4
    80206466:	886a0a13          	addi	s4,s4,-1914 # 80209ce8 <digits+0x968>
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    8020646a:	00029997          	auipc	s3,0x29
    8020646e:	b1698993          	addi	s3,s3,-1258 # 8022ef80 <cons>
        de->dev = 0;
    80206472:	10048a23          	sb	zero,276(s1)
        de->valid = 0;
    80206476:	10049b23          	sh	zero,278(s1)
        de->ref = 0;
    8020647a:	1004ac23          	sw	zero,280(s1)
        de->dirty = 0;
    8020647e:	10048aa3          	sb	zero,277(s1)
        de->parent = 0;
    80206482:	1204b023          	sd	zero,288(s1)
        de->next = root.next;
    80206486:	15093783          	ld	a5,336(s2)
    8020648a:	12f4b423          	sd	a5,296(s1)
        de->prev = &root;
    8020648e:	1354b823          	sd	s5,304(s1)
        initsleeplock(&de->lock, "entry");
    80206492:	85d2                	mv	a1,s4
    80206494:	13848513          	addi	a0,s1,312
    80206498:	ffffd097          	auipc	ra,0xffffd
    8020649c:	5a6080e7          	jalr	1446(ra) # 80203a3e <initsleeplock>
        root.next->prev = de;
    802064a0:	15093783          	ld	a5,336(s2)
    802064a4:	1297b823          	sd	s1,304(a5)
        root.next = de;
    802064a8:	14993823          	sd	s1,336(s2)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    802064ac:	16848493          	addi	s1,s1,360
    802064b0:	fd3491e3          	bne	s1,s3,80206472 <fat32_init+0x150>
}
    802064b4:	4501                	li	a0,0
    802064b6:	70e2                	ld	ra,56(sp)
    802064b8:	7442                	ld	s0,48(sp)
    802064ba:	74a2                	ld	s1,40(sp)
    802064bc:	7902                	ld	s2,32(sp)
    802064be:	69e2                	ld	s3,24(sp)
    802064c0:	6a42                	ld	s4,16(sp)
    802064c2:	6aa2                	ld	s5,8(sp)
    802064c4:	6121                	addi	sp,sp,64
    802064c6:	8082                	ret
        panic("not FAT32 volume");
    802064c8:	00003517          	auipc	a0,0x3
    802064cc:	7e850513          	addi	a0,a0,2024 # 80209cb0 <digits+0x930>
    802064d0:	ffffa097          	auipc	ra,0xffffa
    802064d4:	c72080e7          	jalr	-910(ra) # 80200142 <panic>
        panic("byts_per_sec != BSIZE");
    802064d8:	00003517          	auipc	a0,0x3
    802064dc:	7f050513          	addi	a0,a0,2032 # 80209cc8 <digits+0x948>
    802064e0:	ffffa097          	auipc	ra,0xffffa
    802064e4:	c62080e7          	jalr	-926(ra) # 80200142 <panic>

00000000802064e8 <eread>:
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    802064e8:	10852783          	lw	a5,264(a0)
    802064ec:	0ed7e863          	bltu	a5,a3,802065dc <eread+0xf4>
{
    802064f0:	711d                	addi	sp,sp,-96
    802064f2:	ec86                	sd	ra,88(sp)
    802064f4:	e8a2                	sd	s0,80(sp)
    802064f6:	e4a6                	sd	s1,72(sp)
    802064f8:	e0ca                	sd	s2,64(sp)
    802064fa:	fc4e                	sd	s3,56(sp)
    802064fc:	f852                	sd	s4,48(sp)
    802064fe:	f456                	sd	s5,40(sp)
    80206500:	f05a                	sd	s6,32(sp)
    80206502:	ec5e                	sd	s7,24(sp)
    80206504:	e862                	sd	s8,16(sp)
    80206506:	e466                	sd	s9,8(sp)
    80206508:	e06a                	sd	s10,0(sp)
    8020650a:	1080                	addi	s0,sp,96
    8020650c:	8a2a                	mv	s4,a0
    8020650e:	8bae                	mv	s7,a1
    80206510:	8ab2                	mv	s5,a2
    80206512:	8936                	mv	s2,a3
    80206514:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80206516:	9eb9                	addw	a3,a3,a4
        return 0;
    80206518:	4501                	li	a0,0
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    8020651a:	0b26e163          	bltu	a3,s2,802065bc <eread+0xd4>
    8020651e:	100a4703          	lbu	a4,256(s4)
    80206522:	8b41                	andi	a4,a4,16
    80206524:	ef41                	bnez	a4,802065bc <eread+0xd4>
    if (off + n > entry->file_size) {
    80206526:	00d7f463          	bgeu	a5,a3,8020652e <eread+0x46>
        n = entry->file_size - off;
    8020652a:	41278b3b          	subw	s6,a5,s2
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    8020652e:	10ca2703          	lw	a4,268(s4)
    80206532:	100007b7          	lui	a5,0x10000
    80206536:	17dd                	addi	a5,a5,-9
    80206538:	06e7ef63          	bltu	a5,a4,802065b6 <eread+0xce>
    8020653c:	080b0e63          	beqz	s6,802065d8 <eread+0xf0>
    80206540:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206542:	00024c97          	auipc	s9,0x24
    80206546:	246c8c93          	addi	s9,s9,582 # 8022a788 <fat>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    8020654a:	8c3e                	mv	s8,a5
    8020654c:	a82d                	j	80206586 <eread+0x9e>
    8020654e:	00048d1b          	sext.w	s10,s1
        if (rw_clus(entry->cur_clus, 0, user_dst, dst, off % fat.byts_per_clus, m) != m) {
    80206552:	87ea                	mv	a5,s10
    80206554:	86d6                	mv	a3,s5
    80206556:	865e                	mv	a2,s7
    80206558:	4581                	li	a1,0
    8020655a:	10ca2503          	lw	a0,268(s4)
    8020655e:	00000097          	auipc	ra,0x0
    80206562:	a7e080e7          	jalr	-1410(ra) # 80205fdc <rw_clus>
    80206566:	2501                	sext.w	a0,a0
    80206568:	04ad1863          	bne	s10,a0,802065b8 <eread+0xd0>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    8020656c:	013489bb          	addw	s3,s1,s3
    80206570:	0124893b          	addw	s2,s1,s2
    80206574:	1482                	slli	s1,s1,0x20
    80206576:	9081                	srli	s1,s1,0x20
    80206578:	9aa6                	add	s5,s5,s1
    8020657a:	10ca2783          	lw	a5,268(s4)
    8020657e:	02fc6d63          	bltu	s8,a5,802065b8 <eread+0xd0>
    80206582:	0369fb63          	bgeu	s3,s6,802065b8 <eread+0xd0>
        reloc_clus(entry, off, 0);
    80206586:	4601                	li	a2,0
    80206588:	85ca                	mv	a1,s2
    8020658a:	8552                	mv	a0,s4
    8020658c:	00000097          	auipc	ra,0x0
    80206590:	946080e7          	jalr	-1722(ra) # 80205ed2 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206594:	00cca783          	lw	a5,12(s9)
    80206598:	02f976bb          	remuw	a3,s2,a5
    8020659c:	0006871b          	sext.w	a4,a3
    802065a0:	9f95                	subw	a5,a5,a3
        if (n - tot < m) {
    802065a2:	413b06bb          	subw	a3,s6,s3
    802065a6:	84b6                	mv	s1,a3
    802065a8:	2681                	sext.w	a3,a3
    802065aa:	0007861b          	sext.w	a2,a5
    802065ae:	fad670e3          	bgeu	a2,a3,8020654e <eread+0x66>
    802065b2:	84be                	mv	s1,a5
    802065b4:	bf69                	j	8020654e <eread+0x66>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802065b6:	4981                	li	s3,0
    return tot;
    802065b8:	0009851b          	sext.w	a0,s3
}
    802065bc:	60e6                	ld	ra,88(sp)
    802065be:	6446                	ld	s0,80(sp)
    802065c0:	64a6                	ld	s1,72(sp)
    802065c2:	6906                	ld	s2,64(sp)
    802065c4:	79e2                	ld	s3,56(sp)
    802065c6:	7a42                	ld	s4,48(sp)
    802065c8:	7aa2                	ld	s5,40(sp)
    802065ca:	7b02                	ld	s6,32(sp)
    802065cc:	6be2                	ld	s7,24(sp)
    802065ce:	6c42                	ld	s8,16(sp)
    802065d0:	6ca2                	ld	s9,8(sp)
    802065d2:	6d02                	ld	s10,0(sp)
    802065d4:	6125                	addi	sp,sp,96
    802065d6:	8082                	ret
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802065d8:	89da                	mv	s3,s6
    802065da:	bff9                	j	802065b8 <eread+0xd0>
        return 0;
    802065dc:	4501                	li	a0,0
}
    802065de:	8082                	ret

00000000802065e0 <ewrite>:
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    802065e0:	10852783          	lw	a5,264(a0)
    802065e4:	0ed7e463          	bltu	a5,a3,802066cc <ewrite+0xec>
{
    802065e8:	711d                	addi	sp,sp,-96
    802065ea:	ec86                	sd	ra,88(sp)
    802065ec:	e8a2                	sd	s0,80(sp)
    802065ee:	e4a6                	sd	s1,72(sp)
    802065f0:	e0ca                	sd	s2,64(sp)
    802065f2:	fc4e                	sd	s3,56(sp)
    802065f4:	f852                	sd	s4,48(sp)
    802065f6:	f456                	sd	s5,40(sp)
    802065f8:	f05a                	sd	s6,32(sp)
    802065fa:	ec5e                	sd	s7,24(sp)
    802065fc:	e862                	sd	s8,16(sp)
    802065fe:	e466                	sd	s9,8(sp)
    80206600:	1080                	addi	s0,sp,96
    80206602:	8aaa                	mv	s5,a0
    80206604:	8bae                	mv	s7,a1
    80206606:	8a32                	mv	s4,a2
    80206608:	8936                	mv	s2,a3
    8020660a:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    8020660c:	00e687bb          	addw	a5,a3,a4
    80206610:	0cd7e063          	bltu	a5,a3,802066d0 <ewrite+0xf0>
    80206614:	02069793          	slli	a5,a3,0x20
    80206618:	9381                	srli	a5,a5,0x20
    8020661a:	1702                	slli	a4,a4,0x20
    8020661c:	9301                	srli	a4,a4,0x20
    8020661e:	97ba                	add	a5,a5,a4
    80206620:	577d                	li	a4,-1
    80206622:	9301                	srli	a4,a4,0x20
    80206624:	0af76863          	bltu	a4,a5,802066d4 <ewrite+0xf4>
        || (entry->attribute & ATTR_READ_ONLY)) {
    80206628:	10054783          	lbu	a5,256(a0)
    8020662c:	8b85                	andi	a5,a5,1
    8020662e:	e7cd                	bnez	a5,802066d8 <ewrite+0xf8>
    if (entry->first_clus == 0) {   // so file_size if 0 too, which requests off == 0
    80206630:	10452783          	lw	a5,260(a0)
    80206634:	cb89                	beqz	a5,80206646 <ewrite+0x66>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206636:	080b0963          	beqz	s6,802066c8 <ewrite+0xe8>
    8020663a:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    8020663c:	00024c17          	auipc	s8,0x24
    80206640:	14cc0c13          	addi	s8,s8,332 # 8022a788 <fat>
    80206644:	a891                	j	80206698 <ewrite+0xb8>
        entry->cur_clus = entry->first_clus = alloc_clus(entry->dev);
    80206646:	11454503          	lbu	a0,276(a0)
    8020664a:	fffff097          	auipc	ra,0xfffff
    8020664e:	6c8080e7          	jalr	1736(ra) # 80205d12 <alloc_clus>
    80206652:	2501                	sext.w	a0,a0
    80206654:	10aaa223          	sw	a0,260(s5)
    80206658:	10aaa623          	sw	a0,268(s5)
        entry->clus_cnt = 0;
    8020665c:	100aa823          	sw	zero,272(s5)
        entry->dirty = 1;
    80206660:	4785                	li	a5,1
    80206662:	10fa8aa3          	sb	a5,277(s5)
    80206666:	bfc1                	j	80206636 <ewrite+0x56>
    80206668:	00048c9b          	sext.w	s9,s1
        if (rw_clus(entry->cur_clus, 1, user_src, src, off % fat.byts_per_clus, m) != m) {
    8020666c:	87e6                	mv	a5,s9
    8020666e:	86d2                	mv	a3,s4
    80206670:	865e                	mv	a2,s7
    80206672:	4585                	li	a1,1
    80206674:	10caa503          	lw	a0,268(s5)
    80206678:	00000097          	auipc	ra,0x0
    8020667c:	964080e7          	jalr	-1692(ra) # 80205fdc <rw_clus>
    80206680:	2501                	sext.w	a0,a0
    80206682:	04ac9d63          	bne	s9,a0,802066dc <ewrite+0xfc>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206686:	013489bb          	addw	s3,s1,s3
    8020668a:	0124893b          	addw	s2,s1,s2
    8020668e:	1482                	slli	s1,s1,0x20
    80206690:	9081                	srli	s1,s1,0x20
    80206692:	9a26                	add	s4,s4,s1
    80206694:	0569f463          	bgeu	s3,s6,802066dc <ewrite+0xfc>
        reloc_clus(entry, off, 1);
    80206698:	4605                	li	a2,1
    8020669a:	85ca                	mv	a1,s2
    8020669c:	8556                	mv	a0,s5
    8020669e:	00000097          	auipc	ra,0x0
    802066a2:	834080e7          	jalr	-1996(ra) # 80205ed2 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    802066a6:	00cc2783          	lw	a5,12(s8)
    802066aa:	02f976bb          	remuw	a3,s2,a5
    802066ae:	0006871b          	sext.w	a4,a3
    802066b2:	9f95                	subw	a5,a5,a3
        if (n - tot < m) {
    802066b4:	413b06bb          	subw	a3,s6,s3
    802066b8:	84b6                	mv	s1,a3
    802066ba:	2681                	sext.w	a3,a3
    802066bc:	0007861b          	sext.w	a2,a5
    802066c0:	fad674e3          	bgeu	a2,a3,80206668 <ewrite+0x88>
    802066c4:	84be                	mv	s1,a5
    802066c6:	b74d                	j	80206668 <ewrite+0x88>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    802066c8:	89da                	mv	s3,s6
    802066ca:	a015                	j	802066ee <ewrite+0x10e>
        return -1;
    802066cc:	557d                	li	a0,-1
}
    802066ce:	8082                	ret
        return -1;
    802066d0:	557d                	li	a0,-1
    802066d2:	a005                	j	802066f2 <ewrite+0x112>
    802066d4:	557d                	li	a0,-1
    802066d6:	a831                	j	802066f2 <ewrite+0x112>
    802066d8:	557d                	li	a0,-1
    802066da:	a821                	j	802066f2 <ewrite+0x112>
        if(off > entry->file_size) {
    802066dc:	108aa783          	lw	a5,264(s5)
    802066e0:	0127f763          	bgeu	a5,s2,802066ee <ewrite+0x10e>
            entry->file_size = off;
    802066e4:	112aa423          	sw	s2,264(s5)
            entry->dirty = 1;
    802066e8:	4785                	li	a5,1
    802066ea:	10fa8aa3          	sb	a5,277(s5)
    return tot;
    802066ee:	0009851b          	sext.w	a0,s3
}
    802066f2:	60e6                	ld	ra,88(sp)
    802066f4:	6446                	ld	s0,80(sp)
    802066f6:	64a6                	ld	s1,72(sp)
    802066f8:	6906                	ld	s2,64(sp)
    802066fa:	79e2                	ld	s3,56(sp)
    802066fc:	7a42                	ld	s4,48(sp)
    802066fe:	7aa2                	ld	s5,40(sp)
    80206700:	7b02                	ld	s6,32(sp)
    80206702:	6be2                	ld	s7,24(sp)
    80206704:	6c42                	ld	s8,16(sp)
    80206706:	6ca2                	ld	s9,8(sp)
    80206708:	6125                	addi	sp,sp,96
    8020670a:	8082                	ret

000000008020670c <formatname>:
{
    8020670c:	7179                	addi	sp,sp,-48
    8020670e:	f406                	sd	ra,40(sp)
    80206710:	f022                	sd	s0,32(sp)
    80206712:	ec26                	sd	s1,24(sp)
    80206714:	e84a                	sd	s2,16(sp)
    80206716:	e44e                	sd	s3,8(sp)
    80206718:	e052                	sd	s4,0(sp)
    8020671a:	1800                	addi	s0,sp,48
    8020671c:	84aa                	mv	s1,a0
    while (*name == ' ' || *name == '.') { name++; }
    8020671e:	02000793          	li	a5,32
    80206722:	02e00713          	li	a4,46
    80206726:	a011                	j	8020672a <formatname+0x1e>
    80206728:	0485                	addi	s1,s1,1
    8020672a:	0004c583          	lbu	a1,0(s1)
    8020672e:	fef58de3          	beq	a1,a5,80206728 <formatname+0x1c>
    80206732:	fee58be3          	beq	a1,a4,80206728 <formatname+0x1c>
    for (p = name; *p; p++) {
    80206736:	c1b9                	beqz	a1,8020677c <formatname+0x70>
    80206738:	8926                	mv	s2,s1
        if (c < 0x20 || strchr(illegal, c)) {
    8020673a:	49fd                	li	s3,31
    8020673c:	00006a17          	auipc	s4,0x6
    80206740:	95ca0a13          	addi	s4,s4,-1700 # 8020c098 <illegal.1646>
    80206744:	02b9fe63          	bgeu	s3,a1,80206780 <formatname+0x74>
    80206748:	8552                	mv	a0,s4
    8020674a:	ffffa097          	auipc	ra,0xffffa
    8020674e:	284080e7          	jalr	644(ra) # 802009ce <strchr>
    80206752:	e121                	bnez	a0,80206792 <formatname+0x86>
    for (p = name; *p; p++) {
    80206754:	0905                	addi	s2,s2,1
    80206756:	00094583          	lbu	a1,0(s2)
    8020675a:	f5ed                	bnez	a1,80206744 <formatname+0x38>
        if (*p != ' ') {
    8020675c:	02000693          	li	a3,32
    80206760:	874a                	mv	a4,s2
    while (p-- > name) {
    80206762:	0124fb63          	bgeu	s1,s2,80206778 <formatname+0x6c>
        if (*p != ' ') {
    80206766:	197d                	addi	s2,s2,-1
    80206768:	00094783          	lbu	a5,0(s2)
    8020676c:	fed78ae3          	beq	a5,a3,80206760 <formatname+0x54>
            p[1] = '\0';
    80206770:	00070023          	sb	zero,0(a4)
            break;
    80206774:	8526                	mv	a0,s1
    80206776:	a031                	j	80206782 <formatname+0x76>
    80206778:	8526                	mv	a0,s1
    8020677a:	a021                	j	80206782 <formatname+0x76>
    for (p = name; *p; p++) {
    8020677c:	8526                	mv	a0,s1
    8020677e:	a011                	j	80206782 <formatname+0x76>
            return 0;
    80206780:	4501                	li	a0,0
}
    80206782:	70a2                	ld	ra,40(sp)
    80206784:	7402                	ld	s0,32(sp)
    80206786:	64e2                	ld	s1,24(sp)
    80206788:	6942                	ld	s2,16(sp)
    8020678a:	69a2                	ld	s3,8(sp)
    8020678c:	6a02                	ld	s4,0(sp)
    8020678e:	6145                	addi	sp,sp,48
    80206790:	8082                	ret
            return 0;
    80206792:	4501                	li	a0,0
    80206794:	b7fd                	j	80206782 <formatname+0x76>

0000000080206796 <cal_checksum>:
{
    80206796:	1141                	addi	sp,sp,-16
    80206798:	e422                	sd	s0,8(sp)
    8020679a:	0800                	addi	s0,sp,16
    8020679c:	87aa                	mv	a5,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    8020679e:	00b50613          	addi	a2,a0,11
    uint8 sum = 0;
    802067a2:	4501                	li	a0,0
        sum = ((sum & 1) ? 0x80 : 0) + (sum >> 1) + *shortname++;
    802067a4:	0075171b          	slliw	a4,a0,0x7
    802067a8:	0785                	addi	a5,a5,1
    802067aa:	0015551b          	srliw	a0,a0,0x1
    802067ae:	fff7c683          	lbu	a3,-1(a5) # fffffff <_entry-0x70200001>
    802067b2:	9d35                	addw	a0,a0,a3
    802067b4:	953a                	add	a0,a0,a4
    802067b6:	0ff57513          	andi	a0,a0,255
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    802067ba:	fef615e3          	bne	a2,a5,802067a4 <cal_checksum+0xe>
}
    802067be:	6422                	ld	s0,8(sp)
    802067c0:	0141                	addi	sp,sp,16
    802067c2:	8082                	ret

00000000802067c4 <emake>:
{
    802067c4:	7131                	addi	sp,sp,-192
    802067c6:	fd06                	sd	ra,184(sp)
    802067c8:	f922                	sd	s0,176(sp)
    802067ca:	f526                	sd	s1,168(sp)
    802067cc:	f14a                	sd	s2,160(sp)
    802067ce:	ed4e                	sd	s3,152(sp)
    802067d0:	e952                	sd	s4,144(sp)
    802067d2:	e556                	sd	s5,136(sp)
    802067d4:	e15a                	sd	s6,128(sp)
    802067d6:	fcde                	sd	s7,120(sp)
    802067d8:	f8e2                	sd	s8,112(sp)
    802067da:	f4e6                	sd	s9,104(sp)
    802067dc:	f0ea                	sd	s10,96(sp)
    802067de:	ecee                	sd	s11,88(sp)
    802067e0:	0180                	addi	s0,sp,192
    if (!(dp->attribute & ATTR_DIRECTORY))
    802067e2:	10054783          	lbu	a5,256(a0)
    802067e6:	8bc1                	andi	a5,a5,16
    802067e8:	c3d5                	beqz	a5,8020688c <emake+0xc8>
    802067ea:	8b2a                	mv	s6,a0
    802067ec:	8d2e                	mv	s10,a1
    802067ee:	8cb2                	mv	s9,a2
    if (off % sizeof(union dentry))
    802067f0:	01f67793          	andi	a5,a2,31
    802067f4:	e7c5                	bnez	a5,8020689c <emake+0xd8>
    memset(&de, 0, sizeof(de));
    802067f6:	02000613          	li	a2,32
    802067fa:	4581                	li	a1,0
    802067fc:	f7040513          	addi	a0,s0,-144
    80206800:	ffffa097          	auipc	ra,0xffffa
    80206804:	f64080e7          	jalr	-156(ra) # 80200764 <memset>
    if (off <= 32) {
    80206808:	02000793          	li	a5,32
    8020680c:	0b97ec63          	bltu	a5,s9,802068c4 <emake+0x100>
        if (off == 0) {
    80206810:	080c9e63          	bnez	s9,802068ac <emake+0xe8>
            strncpy(de.sne.name, ".          ", sizeof(de.sne.name));
    80206814:	462d                	li	a2,11
    80206816:	00003597          	auipc	a1,0x3
    8020681a:	50258593          	addi	a1,a1,1282 # 80209d18 <digits+0x998>
    8020681e:	f7040513          	addi	a0,s0,-144
    80206822:	ffffa097          	auipc	ra,0xffffa
    80206826:	05a080e7          	jalr	90(ra) # 8020087c <strncpy>
        de.sne.attr = ATTR_DIRECTORY;
    8020682a:	47c1                	li	a5,16
    8020682c:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);        // first clus high 16 bits
    80206830:	104d2783          	lw	a5,260(s10)
    80206834:	0107d71b          	srliw	a4,a5,0x10
    80206838:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);       // low 16 bits
    8020683c:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = 0;                                       // filesize is updated in eupdate()
    80206840:	f8042623          	sw	zero,-116(s0)
        off = reloc_clus(dp, off, 1);
    80206844:	4605                	li	a2,1
    80206846:	85e6                	mv	a1,s9
    80206848:	855a                	mv	a0,s6
    8020684a:	fffff097          	auipc	ra,0xfffff
    8020684e:	688080e7          	jalr	1672(ra) # 80205ed2 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206852:	02000793          	li	a5,32
    80206856:	0005071b          	sext.w	a4,a0
    8020685a:	f7040693          	addi	a3,s0,-144
    8020685e:	4601                	li	a2,0
    80206860:	4585                	li	a1,1
    80206862:	10cb2503          	lw	a0,268(s6)
    80206866:	fffff097          	auipc	ra,0xfffff
    8020686a:	776080e7          	jalr	1910(ra) # 80205fdc <rw_clus>
}
    8020686e:	70ea                	ld	ra,184(sp)
    80206870:	744a                	ld	s0,176(sp)
    80206872:	74aa                	ld	s1,168(sp)
    80206874:	790a                	ld	s2,160(sp)
    80206876:	69ea                	ld	s3,152(sp)
    80206878:	6a4a                	ld	s4,144(sp)
    8020687a:	6aaa                	ld	s5,136(sp)
    8020687c:	6b0a                	ld	s6,128(sp)
    8020687e:	7be6                	ld	s7,120(sp)
    80206880:	7c46                	ld	s8,112(sp)
    80206882:	7ca6                	ld	s9,104(sp)
    80206884:	7d06                	ld	s10,96(sp)
    80206886:	6de6                	ld	s11,88(sp)
    80206888:	6129                	addi	sp,sp,192
    8020688a:	8082                	ret
        panic("emake: not dir");
    8020688c:	00003517          	auipc	a0,0x3
    80206890:	46450513          	addi	a0,a0,1124 # 80209cf0 <digits+0x970>
    80206894:	ffffa097          	auipc	ra,0xffffa
    80206898:	8ae080e7          	jalr	-1874(ra) # 80200142 <panic>
        panic("emake: not aligned");
    8020689c:	00003517          	auipc	a0,0x3
    802068a0:	46450513          	addi	a0,a0,1124 # 80209d00 <digits+0x980>
    802068a4:	ffffa097          	auipc	ra,0xffffa
    802068a8:	89e080e7          	jalr	-1890(ra) # 80200142 <panic>
            strncpy(de.sne.name, "..         ", sizeof(de.sne.name));
    802068ac:	462d                	li	a2,11
    802068ae:	00003597          	auipc	a1,0x3
    802068b2:	47a58593          	addi	a1,a1,1146 # 80209d28 <digits+0x9a8>
    802068b6:	f7040513          	addi	a0,s0,-144
    802068ba:	ffffa097          	auipc	ra,0xffffa
    802068be:	fc2080e7          	jalr	-62(ra) # 8020087c <strncpy>
    802068c2:	b7a5                	j	8020682a <emake+0x66>
        int entcnt = (strlen(ep->filename) + CHAR_LONG_NAME - 1) / CHAR_LONG_NAME;   // count of l-n-entries, rounds up
    802068c4:	896a                	mv	s2,s10
    802068c6:	856a                	mv	a0,s10
    802068c8:	ffffa097          	auipc	ra,0xffffa
    802068cc:	024080e7          	jalr	36(ra) # 802008ec <strlen>
    802068d0:	f4a43823          	sd	a0,-176(s0)
    802068d4:	00c5071b          	addiw	a4,a0,12
    802068d8:	47b5                	li	a5,13
    802068da:	02f747bb          	divw	a5,a4,a5
    802068de:	f4f42c23          	sw	a5,-168(s0)
    802068e2:	00078d9b          	sext.w	s11,a5
        memset(shortname, 0, sizeof(shortname));
    802068e6:	4631                	li	a2,12
    802068e8:	4581                	li	a1,0
    802068ea:	f6040513          	addi	a0,s0,-160
    802068ee:	ffffa097          	auipc	ra,0xffffa
    802068f2:	e76080e7          	jalr	-394(ra) # 80200764 <memset>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    802068f6:	856a                	mv	a0,s10
    802068f8:	ffffa097          	auipc	ra,0xffffa
    802068fc:	ff4080e7          	jalr	-12(ra) # 802008ec <strlen>
    80206900:	fff5079b          	addiw	a5,a0,-1
    80206904:	0407c063          	bltz	a5,80206944 <emake+0x180>
    80206908:	97ea                	add	a5,a5,s10
    8020690a:	ffed0693          	addi	a3,s10,-2
    8020690e:	96aa                	add	a3,a3,a0
    80206910:	fff5071b          	addiw	a4,a0,-1
    80206914:	1702                	slli	a4,a4,0x20
    80206916:	9301                	srli	a4,a4,0x20
    80206918:	8e99                	sub	a3,a3,a4
        if (name[j] == '.') {
    8020691a:	02e00613          	li	a2,46
    8020691e:	89be                	mv	s3,a5
    80206920:	0007c703          	lbu	a4,0(a5)
    80206924:	00c70663          	beq	a4,a2,80206930 <emake+0x16c>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80206928:	17fd                	addi	a5,a5,-1
    8020692a:	fed79ae3          	bne	a5,a3,8020691e <emake+0x15a>
    char c, *p = name;
    8020692e:	89ea                	mv	s3,s10
        shortname[i++] = c;
    80206930:	4481                	li	s1,0
        if (i == 8 && p) {
    80206932:	4aa1                	li	s5,8
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206934:	4ba9                	li	s7,10
        if (c == '.') {
    80206936:	02e00c13          	li	s8,46
                memset(shortname + i, ' ', 8 - i);
    8020693a:	f6040793          	addi	a5,s0,-160
    8020693e:	f4f43423          	sd	a5,-184(s0)
    80206942:	a0f1                	j	80206a0e <emake+0x24a>
    char c, *p = name;
    80206944:	89ea                	mv	s3,s10
    80206946:	b7ed                	j	80206930 <emake+0x16c>
        if (i == 8 && p) {
    80206948:	22098163          	beqz	s3,80206b6a <emake+0x3a6>
            if (p + 1 < name) { break; }            // no '.'
    8020694c:	0985                	addi	s3,s3,1
    8020694e:	0949f763          	bgeu	s3,s4,802069dc <emake+0x218>
    80206952:	f6040793          	addi	a5,s0,-160
    80206956:	97a6                	add	a5,a5,s1
        shortname[i++] = ' ';
    80206958:	02000693          	li	a3,32
    while (i < CHAR_SHORT_NAME) {
    8020695c:	4729                	li	a4,10
        shortname[i++] = ' ';
    8020695e:	2485                	addiw	s1,s1,1
    80206960:	00d78023          	sb	a3,0(a5)
    while (i < CHAR_SHORT_NAME) {
    80206964:	0785                	addi	a5,a5,1
    80206966:	fe975ce3          	bge	a4,s1,8020695e <emake+0x19a>
        de.lne.checksum = cal_checksum((uchar *)shortname);
    8020696a:	f6040513          	addi	a0,s0,-160
    8020696e:	00000097          	auipc	ra,0x0
    80206972:	e28080e7          	jalr	-472(ra) # 80206796 <cal_checksum>
    80206976:	f6a40ea3          	sb	a0,-131(s0)
        de.lne.attr = ATTR_LONG_NAME;
    8020697a:	47bd                	li	a5,15
    8020697c:	f6f40da3          	sb	a5,-133(s0)
        for (int i = entcnt; i > 0; i--) {
    80206980:	f5043783          	ld	a5,-176(s0)
    80206984:	0ef05f63          	blez	a5,80206a82 <emake+0x2be>
    80206988:	f5842783          	lw	a5,-168(s0)
    8020698c:	37fd                	addiw	a5,a5,-1
    8020698e:	f4f42423          	sw	a5,-184(s0)
    80206992:	00179b9b          	slliw	s7,a5,0x1
    80206996:	00fb8bbb          	addw	s7,s7,a5
    8020699a:	002b9b9b          	slliw	s7,s7,0x2
    8020699e:	00fb8bbb          	addw	s7,s7,a5
    802069a2:	9bea                	add	s7,s7,s10
    802069a4:	8a6e                	mv	s4,s11
    802069a6:	8c66                	mv	s8,s9
            uint8 *w = (uint8 *)de.lne.name1;
    802069a8:	f7140793          	addi	a5,s0,-143
    802069ac:	f4f43c23          	sd	a5,-168(s0)
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    802069b0:	597d                	li	s2,-1
                switch (j) {
    802069b2:	44ad                	li	s1,11
                    case 5:     w = (uint8 *)de.lne.name2; break;
    802069b4:	f7e40a93          	addi	s5,s0,-130
                switch (j) {
    802069b8:	f8c40993          	addi	s3,s0,-116
    802069bc:	aa41                	j	80206b4c <emake+0x388>
            if (name > p) {                    // last '.'
    802069be:	0549f563          	bgeu	s3,s4,80206a08 <emake+0x244>
                memset(shortname + i, ' ', 8 - i);
    802069c2:	4621                	li	a2,8
    802069c4:	9e05                	subw	a2,a2,s1
    802069c6:	02000593          	li	a1,32
    802069ca:	f4843783          	ld	a5,-184(s0)
    802069ce:	00978533          	add	a0,a5,s1
    802069d2:	ffffa097          	auipc	ra,0xffffa
    802069d6:	d92080e7          	jalr	-622(ra) # 80200764 <memset>
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    802069da:	89d2                	mv	s3,s4
        shortname[i++] = c;
    802069dc:	8a4e                	mv	s4,s3
    802069de:	84d6                	mv	s1,s5
    802069e0:	4981                	li	s3,0
    802069e2:	a02d                	j	80206a0c <emake+0x248>
            if (strchr(illegal, c) != NULL) {
    802069e4:	85ca                	mv	a1,s2
    802069e6:	00005517          	auipc	a0,0x5
    802069ea:	6c250513          	addi	a0,a0,1730 # 8020c0a8 <illegal.1662>
    802069ee:	ffffa097          	auipc	ra,0xffffa
    802069f2:	fe0080e7          	jalr	-32(ra) # 802009ce <strchr>
    802069f6:	c119                	beqz	a0,802069fc <emake+0x238>
                c = '_';
    802069f8:	05f00913          	li	s2,95
        shortname[i++] = c;
    802069fc:	f9040793          	addi	a5,s0,-112
    80206a00:	97a6                	add	a5,a5,s1
    80206a02:	fd278823          	sb	s2,-48(a5)
    80206a06:	2485                	addiw	s1,s1,1
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206a08:	f69bc1e3          	blt	s7,s1,8020696a <emake+0x1a6>
        shortname[i++] = c;
    80206a0c:	8952                	mv	s2,s4
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206a0e:	00190a13          	addi	s4,s2,1
    80206a12:	00094903          	lbu	s2,0(s2)
    80206a16:	02090563          	beqz	s2,80206a40 <emake+0x27c>
        if (i == 8 && p) {
    80206a1a:	f35487e3          	beq	s1,s5,80206948 <emake+0x184>
        if (c == ' ') { continue; }
    80206a1e:	02000793          	li	a5,32
    80206a22:	fef903e3          	beq	s2,a5,80206a08 <emake+0x244>
        if (c == '.') {
    80206a26:	f9890ce3          	beq	s2,s8,802069be <emake+0x1fa>
        if (c >= 'a' && c <= 'z') {
    80206a2a:	f9f9079b          	addiw	a5,s2,-97
    80206a2e:	0ff7f793          	andi	a5,a5,255
    80206a32:	4765                	li	a4,25
    80206a34:	faf768e3          	bltu	a4,a5,802069e4 <emake+0x220>
            c += 'A' - 'a';
    80206a38:	3901                	addiw	s2,s2,-32
    80206a3a:	0ff97913          	andi	s2,s2,255
    80206a3e:	bf7d                	j	802069fc <emake+0x238>
    while (i < CHAR_SHORT_NAME) {
    80206a40:	47a9                	li	a5,10
    80206a42:	f097d8e3          	bge	a5,s1,80206952 <emake+0x18e>
    80206a46:	b715                	j	8020696a <emake+0x1a6>
                de.lne.order |= LAST_LONG_ENTRY;
    80206a48:	0407e793          	ori	a5,a5,64
    80206a4c:	f6f40823          	sb	a5,-144(s0)
    80206a50:	a221                	j	80206b58 <emake+0x394>
                    if ((*w++ = *p++) == 0) {
    80206a52:	0005c683          	lbu	a3,0(a1)
    80206a56:	00d78023          	sb	a3,0(a5)
                        end = 1;
    80206a5a:	0016b693          	seqz	a3,a3
                    *w++ = 0;
    80206a5e:	000780a3          	sb	zero,1(a5)
    80206a62:	0789                	addi	a5,a5,2
                    if ((*w++ = *p++) == 0) {
    80206a64:	0585                	addi	a1,a1,1
    80206a66:	a04d                	j	80206b08 <emake+0x344>
    80206a68:	020c8c9b          	addiw	s9,s9,32
    80206a6c:	4781                	li	a5,0
    80206a6e:	f5043703          	ld	a4,-176(s0)
    80206a72:	00e05663          	blez	a4,80206a7e <emake+0x2ba>
    80206a76:	f4842783          	lw	a5,-184(s0)
    80206a7a:	0057979b          	slliw	a5,a5,0x5
    80206a7e:	01978cbb          	addw	s9,a5,s9
        memset(&de, 0, sizeof(de));
    80206a82:	02000613          	li	a2,32
    80206a86:	4581                	li	a1,0
    80206a88:	f7040493          	addi	s1,s0,-144
    80206a8c:	8526                	mv	a0,s1
    80206a8e:	ffffa097          	auipc	ra,0xffffa
    80206a92:	cd6080e7          	jalr	-810(ra) # 80200764 <memset>
        strncpy(de.sne.name, shortname, sizeof(de.sne.name));
    80206a96:	462d                	li	a2,11
    80206a98:	f6040593          	addi	a1,s0,-160
    80206a9c:	8526                	mv	a0,s1
    80206a9e:	ffffa097          	auipc	ra,0xffffa
    80206aa2:	dde080e7          	jalr	-546(ra) # 8020087c <strncpy>
        de.sne.attr = ep->attribute;
    80206aa6:	100d4783          	lbu	a5,256(s10)
    80206aaa:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);      // first clus high 16 bits
    80206aae:	104d2783          	lw	a5,260(s10)
    80206ab2:	0107d71b          	srliw	a4,a5,0x10
    80206ab6:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);     // low 16 bits
    80206aba:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = ep->file_size;                         // filesize is updated in eupdate()
    80206abe:	108d2783          	lw	a5,264(s10)
    80206ac2:	f8f42623          	sw	a5,-116(s0)
        off = reloc_clus(dp, off, 1);
    80206ac6:	4605                	li	a2,1
    80206ac8:	85e6                	mv	a1,s9
    80206aca:	855a                	mv	a0,s6
    80206acc:	fffff097          	auipc	ra,0xfffff
    80206ad0:	406080e7          	jalr	1030(ra) # 80205ed2 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206ad4:	02000793          	li	a5,32
    80206ad8:	0005071b          	sext.w	a4,a0
    80206adc:	86a6                	mv	a3,s1
    80206ade:	4601                	li	a2,0
    80206ae0:	4585                	li	a1,1
    80206ae2:	10cb2503          	lw	a0,268(s6)
    80206ae6:	fffff097          	auipc	ra,0xfffff
    80206aea:	4f6080e7          	jalr	1270(ra) # 80205fdc <rw_clus>
}
    80206aee:	b341                	j	8020686e <emake+0xaa>
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80206af0:	87d6                	mv	a5,s5
    80206af2:	a011                	j	80206af6 <emake+0x332>
                switch (j) {
    80206af4:	87ce                	mv	a5,s3
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206af6:	2705                	addiw	a4,a4,1
    80206af8:	fff7061b          	addiw	a2,a4,-1
                if (end) {
    80206afc:	dab9                	beqz	a3,80206a52 <emake+0x28e>
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    80206afe:	01278023          	sb	s2,0(a5)
                    *w++ = 0xff;
    80206b02:	012780a3          	sb	s2,1(a5)
    80206b06:	0789                	addi	a5,a5,2
                switch (j) {
    80206b08:	fea604e3          	beq	a2,a0,80206af0 <emake+0x32c>
    80206b0c:	fe9604e3          	beq	a2,s1,80206af4 <emake+0x330>
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206b10:	0007061b          	sext.w	a2,a4
    80206b14:	fec851e3          	bge	a6,a2,80206af6 <emake+0x332>
            uint off2 = reloc_clus(dp, off, 1);
    80206b18:	4605                	li	a2,1
    80206b1a:	85e2                	mv	a1,s8
    80206b1c:	855a                	mv	a0,s6
    80206b1e:	fffff097          	auipc	ra,0xfffff
    80206b22:	3b4080e7          	jalr	948(ra) # 80205ed2 <reloc_clus>
            rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off2, sizeof(de));
    80206b26:	02000793          	li	a5,32
    80206b2a:	0005071b          	sext.w	a4,a0
    80206b2e:	f7040693          	addi	a3,s0,-144
    80206b32:	4601                	li	a2,0
    80206b34:	4585                	li	a1,1
    80206b36:	10cb2503          	lw	a0,268(s6)
    80206b3a:	fffff097          	auipc	ra,0xfffff
    80206b3e:	4a2080e7          	jalr	1186(ra) # 80205fdc <rw_clus>
            off += sizeof(de);
    80206b42:	020c0c1b          	addiw	s8,s8,32
        for (int i = entcnt; i > 0; i--) {
    80206b46:	1bcd                	addi	s7,s7,-13
    80206b48:	f34050e3          	blez	s4,80206a68 <emake+0x2a4>
            if ((de.lne.order = i) == entcnt) {
    80206b4c:	0ffa7793          	andi	a5,s4,255
    80206b50:	eefd8ce3          	beq	s11,a5,80206a48 <emake+0x284>
    80206b54:	f6f40823          	sb	a5,-144(s0)
            char *p = ep->filename + (i - 1) * CHAR_LONG_NAME;
    80206b58:	3a7d                	addiw	s4,s4,-1
    80206b5a:	85de                	mv	a1,s7
    80206b5c:	4709                	li	a4,2
            int end = 0;
    80206b5e:	4681                	li	a3,0
            uint8 *w = (uint8 *)de.lne.name1;
    80206b60:	f5843783          	ld	a5,-168(s0)
                switch (j) {
    80206b64:	4515                	li	a0,5
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206b66:	4835                	li	a6,13
    80206b68:	bf41                	j	80206af8 <emake+0x334>
        if (c == ' ') { continue; }
    80206b6a:	02000793          	li	a5,32
    80206b6e:	eaf91ce3          	bne	s2,a5,80206a26 <emake+0x262>
    80206b72:	bd69                	j	80206a0c <emake+0x248>

0000000080206b74 <edup>:
{
    80206b74:	1101                	addi	sp,sp,-32
    80206b76:	ec06                	sd	ra,24(sp)
    80206b78:	e822                	sd	s0,16(sp)
    80206b7a:	e426                	sd	s1,8(sp)
    80206b7c:	1000                	addi	s0,sp,32
    80206b7e:	84aa                	mv	s1,a0
    if (entry != 0) {
    80206b80:	c515                	beqz	a0,80206bac <edup+0x38>
        acquire(&ecache.lock);
    80206b82:	00024517          	auipc	a0,0x24
    80206b86:	d9650513          	addi	a0,a0,-618 # 8022a918 <ecache>
    80206b8a:	ffffa097          	auipc	ra,0xffffa
    80206b8e:	b3e080e7          	jalr	-1218(ra) # 802006c8 <acquire>
        entry->ref++;
    80206b92:	1184a783          	lw	a5,280(s1)
    80206b96:	2785                	addiw	a5,a5,1
    80206b98:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    80206b9c:	00024517          	auipc	a0,0x24
    80206ba0:	d7c50513          	addi	a0,a0,-644 # 8022a918 <ecache>
    80206ba4:	ffffa097          	auipc	ra,0xffffa
    80206ba8:	b78080e7          	jalr	-1160(ra) # 8020071c <release>
}
    80206bac:	8526                	mv	a0,s1
    80206bae:	60e2                	ld	ra,24(sp)
    80206bb0:	6442                	ld	s0,16(sp)
    80206bb2:	64a2                	ld	s1,8(sp)
    80206bb4:	6105                	addi	sp,sp,32
    80206bb6:	8082                	ret

0000000080206bb8 <eupdate>:
    if (!entry->dirty || entry->valid != 1) { return; }
    80206bb8:	11554783          	lbu	a5,277(a0)
    80206bbc:	c3e5                	beqz	a5,80206c9c <eupdate+0xe4>
{
    80206bbe:	711d                	addi	sp,sp,-96
    80206bc0:	ec86                	sd	ra,88(sp)
    80206bc2:	e8a2                	sd	s0,80(sp)
    80206bc4:	e4a6                	sd	s1,72(sp)
    80206bc6:	e0ca                	sd	s2,64(sp)
    80206bc8:	fc4e                	sd	s3,56(sp)
    80206bca:	1080                	addi	s0,sp,96
    80206bcc:	84aa                	mv	s1,a0
    if (!entry->dirty || entry->valid != 1) { return; }
    80206bce:	11651703          	lh	a4,278(a0)
    80206bd2:	4785                	li	a5,1
    80206bd4:	00f70963          	beq	a4,a5,80206be6 <eupdate+0x2e>
}
    80206bd8:	60e6                	ld	ra,88(sp)
    80206bda:	6446                	ld	s0,80(sp)
    80206bdc:	64a6                	ld	s1,72(sp)
    80206bde:	6906                	ld	s2,64(sp)
    80206be0:	79e2                	ld	s3,56(sp)
    80206be2:	6125                	addi	sp,sp,96
    80206be4:	8082                	ret
    uint entcnt = 0;
    80206be6:	fc042623          	sw	zero,-52(s0)
    uint32 off = reloc_clus(entry->parent, entry->off, 0);
    80206bea:	4601                	li	a2,0
    80206bec:	11c52583          	lw	a1,284(a0)
    80206bf0:	12053503          	ld	a0,288(a0)
    80206bf4:	fffff097          	auipc	ra,0xfffff
    80206bf8:	2de080e7          	jalr	734(ra) # 80205ed2 <reloc_clus>
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off, 1);
    80206bfc:	1204b803          	ld	a6,288(s1)
    80206c00:	4785                	li	a5,1
    80206c02:	0005071b          	sext.w	a4,a0
    80206c06:	fcc40693          	addi	a3,s0,-52
    80206c0a:	4601                	li	a2,0
    80206c0c:	4581                	li	a1,0
    80206c0e:	10c82503          	lw	a0,268(a6)
    80206c12:	fffff097          	auipc	ra,0xfffff
    80206c16:	3ca080e7          	jalr	970(ra) # 80205fdc <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    80206c1a:	fcc42583          	lw	a1,-52(s0)
    80206c1e:	fbf5f593          	andi	a1,a1,-65
    80206c22:	fcb42623          	sw	a1,-52(s0)
    off = reloc_clus(entry->parent, entry->off + (entcnt << 5), 0);
    80206c26:	0055959b          	slliw	a1,a1,0x5
    80206c2a:	11c4a783          	lw	a5,284(s1)
    80206c2e:	4601                	li	a2,0
    80206c30:	9dbd                	addw	a1,a1,a5
    80206c32:	1204b503          	ld	a0,288(s1)
    80206c36:	fffff097          	auipc	ra,0xfffff
    80206c3a:	29c080e7          	jalr	668(ra) # 80205ed2 <reloc_clus>
    80206c3e:	0005099b          	sext.w	s3,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64)&de, off, sizeof(de));
    80206c42:	1204b503          	ld	a0,288(s1)
    80206c46:	02000793          	li	a5,32
    80206c4a:	874e                	mv	a4,s3
    80206c4c:	fa840913          	addi	s2,s0,-88
    80206c50:	86ca                	mv	a3,s2
    80206c52:	4601                	li	a2,0
    80206c54:	4581                	li	a1,0
    80206c56:	10c52503          	lw	a0,268(a0)
    80206c5a:	fffff097          	auipc	ra,0xfffff
    80206c5e:	382080e7          	jalr	898(ra) # 80205fdc <rw_clus>
    de.sne.fst_clus_hi = (uint16)(entry->first_clus >> 16);
    80206c62:	1044a783          	lw	a5,260(s1)
    80206c66:	0107d71b          	srliw	a4,a5,0x10
    80206c6a:	fae41e23          	sh	a4,-68(s0)
    de.sne.fst_clus_lo = (uint16)(entry->first_clus & 0xffff);
    80206c6e:	fcf41123          	sh	a5,-62(s0)
    de.sne.file_size = entry->file_size;
    80206c72:	1084a783          	lw	a5,264(s1)
    80206c76:	fcf42223          	sw	a5,-60(s0)
    rw_clus(entry->parent->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206c7a:	1204b503          	ld	a0,288(s1)
    80206c7e:	02000793          	li	a5,32
    80206c82:	874e                	mv	a4,s3
    80206c84:	86ca                	mv	a3,s2
    80206c86:	4601                	li	a2,0
    80206c88:	4585                	li	a1,1
    80206c8a:	10c52503          	lw	a0,268(a0)
    80206c8e:	fffff097          	auipc	ra,0xfffff
    80206c92:	34e080e7          	jalr	846(ra) # 80205fdc <rw_clus>
    entry->dirty = 0;
    80206c96:	10048aa3          	sb	zero,277(s1)
    80206c9a:	bf3d                	j	80206bd8 <eupdate+0x20>
    80206c9c:	8082                	ret

0000000080206c9e <eremove>:
    if (entry->valid != 1) { return; }
    80206c9e:	11651703          	lh	a4,278(a0)
    80206ca2:	4785                	li	a5,1
    80206ca4:	00f70363          	beq	a4,a5,80206caa <eremove+0xc>
    80206ca8:	8082                	ret
{
    80206caa:	715d                	addi	sp,sp,-80
    80206cac:	e486                	sd	ra,72(sp)
    80206cae:	e0a2                	sd	s0,64(sp)
    80206cb0:	fc26                	sd	s1,56(sp)
    80206cb2:	f84a                	sd	s2,48(sp)
    80206cb4:	f44e                	sd	s3,40(sp)
    80206cb6:	f052                	sd	s4,32(sp)
    80206cb8:	ec56                	sd	s5,24(sp)
    80206cba:	0880                	addi	s0,sp,80
    80206cbc:	89aa                	mv	s3,a0
    uint entcnt = 0;
    80206cbe:	fa042e23          	sw	zero,-68(s0)
    uint32 off = entry->off;
    80206cc2:	11c52a03          	lw	s4,284(a0)
    uint32 off2 = reloc_clus(entry->parent, off, 0);
    80206cc6:	4601                	li	a2,0
    80206cc8:	85d2                	mv	a1,s4
    80206cca:	12053503          	ld	a0,288(a0)
    80206cce:	fffff097          	auipc	ra,0xfffff
    80206cd2:	204080e7          	jalr	516(ra) # 80205ed2 <reloc_clus>
    80206cd6:	0005049b          	sext.w	s1,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off2, 1);
    80206cda:	1209b503          	ld	a0,288(s3)
    80206cde:	4785                	li	a5,1
    80206ce0:	8726                	mv	a4,s1
    80206ce2:	fbc40693          	addi	a3,s0,-68
    80206ce6:	4601                	li	a2,0
    80206ce8:	4581                	li	a1,0
    80206cea:	10c52503          	lw	a0,268(a0)
    80206cee:	fffff097          	auipc	ra,0xfffff
    80206cf2:	2ee080e7          	jalr	750(ra) # 80205fdc <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    80206cf6:	fbc42783          	lw	a5,-68(s0)
    80206cfa:	fbf7f793          	andi	a5,a5,-65
    80206cfe:	faf42e23          	sw	a5,-68(s0)
    uint8 flag = EMPTY_ENTRY;
    80206d02:	5795                	li	a5,-27
    80206d04:	faf40da3          	sb	a5,-69(s0)
    for (int i = 0; i <= entcnt; i++) {
    80206d08:	4901                	li	s2,0
        rw_clus(entry->parent->cur_clus, 1, 0, (uint64) &flag, off2, 1);
    80206d0a:	fbb40a93          	addi	s5,s0,-69
    80206d0e:	1209b503          	ld	a0,288(s3)
    80206d12:	4785                	li	a5,1
    80206d14:	8726                	mv	a4,s1
    80206d16:	86d6                	mv	a3,s5
    80206d18:	4601                	li	a2,0
    80206d1a:	4585                	li	a1,1
    80206d1c:	10c52503          	lw	a0,268(a0)
    80206d20:	fffff097          	auipc	ra,0xfffff
    80206d24:	2bc080e7          	jalr	700(ra) # 80205fdc <rw_clus>
        off += 32;
    80206d28:	020a0a1b          	addiw	s4,s4,32
        off2 = reloc_clus(entry->parent, off, 0);
    80206d2c:	4601                	li	a2,0
    80206d2e:	85d2                	mv	a1,s4
    80206d30:	1209b503          	ld	a0,288(s3)
    80206d34:	fffff097          	auipc	ra,0xfffff
    80206d38:	19e080e7          	jalr	414(ra) # 80205ed2 <reloc_clus>
    80206d3c:	0005049b          	sext.w	s1,a0
    for (int i = 0; i <= entcnt; i++) {
    80206d40:	0019079b          	addiw	a5,s2,1
    80206d44:	0007891b          	sext.w	s2,a5
    80206d48:	fbc42703          	lw	a4,-68(s0)
    80206d4c:	fd2771e3          	bgeu	a4,s2,80206d0e <eremove+0x70>
    entry->valid = -1;
    80206d50:	57fd                	li	a5,-1
    80206d52:	10f99b23          	sh	a5,278(s3)
}
    80206d56:	60a6                	ld	ra,72(sp)
    80206d58:	6406                	ld	s0,64(sp)
    80206d5a:	74e2                	ld	s1,56(sp)
    80206d5c:	7942                	ld	s2,48(sp)
    80206d5e:	79a2                	ld	s3,40(sp)
    80206d60:	7a02                	ld	s4,32(sp)
    80206d62:	6ae2                	ld	s5,24(sp)
    80206d64:	6161                	addi	sp,sp,80
    80206d66:	8082                	ret

0000000080206d68 <etrunc>:
{
    80206d68:	7179                	addi	sp,sp,-48
    80206d6a:	f406                	sd	ra,40(sp)
    80206d6c:	f022                	sd	s0,32(sp)
    80206d6e:	ec26                	sd	s1,24(sp)
    80206d70:	e84a                	sd	s2,16(sp)
    80206d72:	e44e                	sd	s3,8(sp)
    80206d74:	e052                	sd	s4,0(sp)
    80206d76:	1800                	addi	s0,sp,48
    80206d78:	8a2a                	mv	s4,a0
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80206d7a:	10452483          	lw	s1,260(a0)
    80206d7e:	ffe4871b          	addiw	a4,s1,-2
    80206d82:	100007b7          	lui	a5,0x10000
    80206d86:	17d5                	addi	a5,a5,-11
    80206d88:	02e7e663          	bltu	a5,a4,80206db4 <etrunc+0x4c>
    80206d8c:	89be                	mv	s3,a5
        uint32 next = read_fat(clus);
    80206d8e:	0004891b          	sext.w	s2,s1
    80206d92:	8526                	mv	a0,s1
    80206d94:	fffff097          	auipc	ra,0xfffff
    80206d98:	f0a080e7          	jalr	-246(ra) # 80205c9e <read_fat>
    80206d9c:	0005049b          	sext.w	s1,a0
    write_fat(cluster, 0);
    80206da0:	4581                	li	a1,0
    80206da2:	854a                	mv	a0,s2
    80206da4:	fffff097          	auipc	ra,0xfffff
    80206da8:	0ae080e7          	jalr	174(ra) # 80205e52 <write_fat>
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80206dac:	ffe4879b          	addiw	a5,s1,-2
    80206db0:	fcf9ffe3          	bgeu	s3,a5,80206d8e <etrunc+0x26>
    entry->file_size = 0;
    80206db4:	100a2423          	sw	zero,264(s4)
    entry->first_clus = 0;
    80206db8:	100a2223          	sw	zero,260(s4)
    entry->dirty = 1;
    80206dbc:	4785                	li	a5,1
    80206dbe:	10fa0aa3          	sb	a5,277(s4)
}
    80206dc2:	70a2                	ld	ra,40(sp)
    80206dc4:	7402                	ld	s0,32(sp)
    80206dc6:	64e2                	ld	s1,24(sp)
    80206dc8:	6942                	ld	s2,16(sp)
    80206dca:	69a2                	ld	s3,8(sp)
    80206dcc:	6a02                	ld	s4,0(sp)
    80206dce:	6145                	addi	sp,sp,48
    80206dd0:	8082                	ret

0000000080206dd2 <elock>:
{
    80206dd2:	1141                	addi	sp,sp,-16
    80206dd4:	e406                	sd	ra,8(sp)
    80206dd6:	e022                	sd	s0,0(sp)
    80206dd8:	0800                	addi	s0,sp,16
    if (entry == 0 || entry->ref < 1)
    80206dda:	cd19                	beqz	a0,80206df8 <elock+0x26>
    80206ddc:	11852783          	lw	a5,280(a0)
    80206de0:	00f05c63          	blez	a5,80206df8 <elock+0x26>
    acquiresleep(&entry->lock);
    80206de4:	13850513          	addi	a0,a0,312
    80206de8:	ffffd097          	auipc	ra,0xffffd
    80206dec:	c90080e7          	jalr	-880(ra) # 80203a78 <acquiresleep>
}
    80206df0:	60a2                	ld	ra,8(sp)
    80206df2:	6402                	ld	s0,0(sp)
    80206df4:	0141                	addi	sp,sp,16
    80206df6:	8082                	ret
        panic("elock");
    80206df8:	00003517          	auipc	a0,0x3
    80206dfc:	f4050513          	addi	a0,a0,-192 # 80209d38 <digits+0x9b8>
    80206e00:	ffff9097          	auipc	ra,0xffff9
    80206e04:	342080e7          	jalr	834(ra) # 80200142 <panic>

0000000080206e08 <eunlock>:
{
    80206e08:	1101                	addi	sp,sp,-32
    80206e0a:	ec06                	sd	ra,24(sp)
    80206e0c:	e822                	sd	s0,16(sp)
    80206e0e:	e426                	sd	s1,8(sp)
    80206e10:	e04a                	sd	s2,0(sp)
    80206e12:	1000                	addi	s0,sp,32
    if (entry == 0 || !holdingsleep(&entry->lock) || entry->ref < 1)
    80206e14:	c90d                	beqz	a0,80206e46 <eunlock+0x3e>
    80206e16:	84aa                	mv	s1,a0
    80206e18:	13850913          	addi	s2,a0,312
    80206e1c:	854a                	mv	a0,s2
    80206e1e:	ffffd097          	auipc	ra,0xffffd
    80206e22:	cf4080e7          	jalr	-780(ra) # 80203b12 <holdingsleep>
    80206e26:	c105                	beqz	a0,80206e46 <eunlock+0x3e>
    80206e28:	1184a783          	lw	a5,280(s1)
    80206e2c:	00f05d63          	blez	a5,80206e46 <eunlock+0x3e>
    releasesleep(&entry->lock);
    80206e30:	854a                	mv	a0,s2
    80206e32:	ffffd097          	auipc	ra,0xffffd
    80206e36:	c9c080e7          	jalr	-868(ra) # 80203ace <releasesleep>
}
    80206e3a:	60e2                	ld	ra,24(sp)
    80206e3c:	6442                	ld	s0,16(sp)
    80206e3e:	64a2                	ld	s1,8(sp)
    80206e40:	6902                	ld	s2,0(sp)
    80206e42:	6105                	addi	sp,sp,32
    80206e44:	8082                	ret
        panic("eunlock");
    80206e46:	00003517          	auipc	a0,0x3
    80206e4a:	efa50513          	addi	a0,a0,-262 # 80209d40 <digits+0x9c0>
    80206e4e:	ffff9097          	auipc	ra,0xffff9
    80206e52:	2f4080e7          	jalr	756(ra) # 80200142 <panic>

0000000080206e56 <eput>:
{
    80206e56:	1101                	addi	sp,sp,-32
    80206e58:	ec06                	sd	ra,24(sp)
    80206e5a:	e822                	sd	s0,16(sp)
    80206e5c:	e426                	sd	s1,8(sp)
    80206e5e:	e04a                	sd	s2,0(sp)
    80206e60:	1000                	addi	s0,sp,32
    80206e62:	84aa                	mv	s1,a0
    acquire(&ecache.lock);
    80206e64:	00024517          	auipc	a0,0x24
    80206e68:	ab450513          	addi	a0,a0,-1356 # 8022a918 <ecache>
    80206e6c:	ffffa097          	auipc	ra,0xffffa
    80206e70:	85c080e7          	jalr	-1956(ra) # 802006c8 <acquire>
    if (entry != &root && entry->valid != 0 && entry->ref == 1) {
    80206e74:	00024797          	auipc	a5,0x24
    80206e78:	93c78793          	addi	a5,a5,-1732 # 8022a7b0 <root>
    80206e7c:	00f48a63          	beq	s1,a5,80206e90 <eput+0x3a>
    80206e80:	11649783          	lh	a5,278(s1)
    80206e84:	c791                	beqz	a5,80206e90 <eput+0x3a>
    80206e86:	1184a703          	lw	a4,280(s1)
    80206e8a:	4785                	li	a5,1
    80206e8c:	02f70563          	beq	a4,a5,80206eb6 <eput+0x60>
    entry->ref--;
    80206e90:	1184a783          	lw	a5,280(s1)
    80206e94:	37fd                	addiw	a5,a5,-1
    80206e96:	10f4ac23          	sw	a5,280(s1)
    release(&ecache.lock);
    80206e9a:	00024517          	auipc	a0,0x24
    80206e9e:	a7e50513          	addi	a0,a0,-1410 # 8022a918 <ecache>
    80206ea2:	ffffa097          	auipc	ra,0xffffa
    80206ea6:	87a080e7          	jalr	-1926(ra) # 8020071c <release>
}
    80206eaa:	60e2                	ld	ra,24(sp)
    80206eac:	6442                	ld	s0,16(sp)
    80206eae:	64a2                	ld	s1,8(sp)
    80206eb0:	6902                	ld	s2,0(sp)
    80206eb2:	6105                	addi	sp,sp,32
    80206eb4:	8082                	ret
        acquiresleep(&entry->lock);
    80206eb6:	13848913          	addi	s2,s1,312
    80206eba:	854a                	mv	a0,s2
    80206ebc:	ffffd097          	auipc	ra,0xffffd
    80206ec0:	bbc080e7          	jalr	-1092(ra) # 80203a78 <acquiresleep>
        entry->next->prev = entry->prev;
    80206ec4:	1284b703          	ld	a4,296(s1)
    80206ec8:	1304b783          	ld	a5,304(s1)
    80206ecc:	12f73823          	sd	a5,304(a4)
        entry->prev->next = entry->next;
    80206ed0:	1284b703          	ld	a4,296(s1)
    80206ed4:	12e7b423          	sd	a4,296(a5)
        entry->next = root.next;
    80206ed8:	00024797          	auipc	a5,0x24
    80206edc:	8b078793          	addi	a5,a5,-1872 # 8022a788 <fat>
    80206ee0:	1507b703          	ld	a4,336(a5)
    80206ee4:	12e4b423          	sd	a4,296(s1)
        entry->prev = &root;
    80206ee8:	00024697          	auipc	a3,0x24
    80206eec:	8c868693          	addi	a3,a3,-1848 # 8022a7b0 <root>
    80206ef0:	12d4b823          	sd	a3,304(s1)
        root.next->prev = entry;
    80206ef4:	12973823          	sd	s1,304(a4)
        root.next = entry;
    80206ef8:	1497b823          	sd	s1,336(a5)
        release(&ecache.lock);
    80206efc:	00024517          	auipc	a0,0x24
    80206f00:	a1c50513          	addi	a0,a0,-1508 # 8022a918 <ecache>
    80206f04:	ffffa097          	auipc	ra,0xffffa
    80206f08:	818080e7          	jalr	-2024(ra) # 8020071c <release>
        if (entry->valid == -1) {       // this means some one has called eremove()
    80206f0c:	11649703          	lh	a4,278(s1)
    80206f10:	57fd                	li	a5,-1
    80206f12:	06f70863          	beq	a4,a5,80206f82 <eput+0x12c>
            elock(entry->parent);
    80206f16:	1204b503          	ld	a0,288(s1)
    80206f1a:	00000097          	auipc	ra,0x0
    80206f1e:	eb8080e7          	jalr	-328(ra) # 80206dd2 <elock>
            eupdate(entry);
    80206f22:	8526                	mv	a0,s1
    80206f24:	00000097          	auipc	ra,0x0
    80206f28:	c94080e7          	jalr	-876(ra) # 80206bb8 <eupdate>
            eunlock(entry->parent);
    80206f2c:	1204b503          	ld	a0,288(s1)
    80206f30:	00000097          	auipc	ra,0x0
    80206f34:	ed8080e7          	jalr	-296(ra) # 80206e08 <eunlock>
        releasesleep(&entry->lock);
    80206f38:	854a                	mv	a0,s2
    80206f3a:	ffffd097          	auipc	ra,0xffffd
    80206f3e:	b94080e7          	jalr	-1132(ra) # 80203ace <releasesleep>
        struct dirent *eparent = entry->parent;
    80206f42:	1204b903          	ld	s2,288(s1)
        acquire(&ecache.lock);
    80206f46:	00024517          	auipc	a0,0x24
    80206f4a:	9d250513          	addi	a0,a0,-1582 # 8022a918 <ecache>
    80206f4e:	ffff9097          	auipc	ra,0xffff9
    80206f52:	77a080e7          	jalr	1914(ra) # 802006c8 <acquire>
        entry->ref--;
    80206f56:	1184a783          	lw	a5,280(s1)
    80206f5a:	37fd                	addiw	a5,a5,-1
    80206f5c:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    80206f60:	00024517          	auipc	a0,0x24
    80206f64:	9b850513          	addi	a0,a0,-1608 # 8022a918 <ecache>
    80206f68:	ffff9097          	auipc	ra,0xffff9
    80206f6c:	7b4080e7          	jalr	1972(ra) # 8020071c <release>
        if (entry->ref == 0) {
    80206f70:	1184a783          	lw	a5,280(s1)
    80206f74:	fb9d                	bnez	a5,80206eaa <eput+0x54>
            eput(eparent);
    80206f76:	854a                	mv	a0,s2
    80206f78:	00000097          	auipc	ra,0x0
    80206f7c:	ede080e7          	jalr	-290(ra) # 80206e56 <eput>
    80206f80:	b72d                	j	80206eaa <eput+0x54>
            etrunc(entry);
    80206f82:	8526                	mv	a0,s1
    80206f84:	00000097          	auipc	ra,0x0
    80206f88:	de4080e7          	jalr	-540(ra) # 80206d68 <etrunc>
    80206f8c:	b775                	j	80206f38 <eput+0xe2>

0000000080206f8e <estat>:
{
    80206f8e:	1101                	addi	sp,sp,-32
    80206f90:	ec06                	sd	ra,24(sp)
    80206f92:	e822                	sd	s0,16(sp)
    80206f94:	e426                	sd	s1,8(sp)
    80206f96:	e04a                	sd	s2,0(sp)
    80206f98:	1000                	addi	s0,sp,32
    80206f9a:	892a                	mv	s2,a0
    80206f9c:	84ae                	mv	s1,a1
    strncpy(st->name, de->filename, STAT_MAX_NAME);
    80206f9e:	02000613          	li	a2,32
    80206fa2:	85aa                	mv	a1,a0
    80206fa4:	8526                	mv	a0,s1
    80206fa6:	ffffa097          	auipc	ra,0xffffa
    80206faa:	8d6080e7          	jalr	-1834(ra) # 8020087c <strncpy>
    st->type = (de->attribute & ATTR_DIRECTORY) ? T_DIR : T_FILE;
    80206fae:	10094783          	lbu	a5,256(s2)
    80206fb2:	8bc1                	andi	a5,a5,16
    80206fb4:	0017b793          	seqz	a5,a5
    80206fb8:	0785                	addi	a5,a5,1
    80206fba:	02f49423          	sh	a5,40(s1)
    st->dev = de->dev;
    80206fbe:	11494783          	lbu	a5,276(s2)
    80206fc2:	d0dc                	sw	a5,36(s1)
    st->size = de->file_size;
    80206fc4:	10896783          	lwu	a5,264(s2)
    80206fc8:	f89c                	sd	a5,48(s1)
}
    80206fca:	60e2                	ld	ra,24(sp)
    80206fcc:	6442                	ld	s0,16(sp)
    80206fce:	64a2                	ld	s1,8(sp)
    80206fd0:	6902                	ld	s2,0(sp)
    80206fd2:	6105                	addi	sp,sp,32
    80206fd4:	8082                	ret

0000000080206fd6 <enext>:
 * @return  -1      meet the end of dir
 *          0       find empty slots
 *          1       find a file with all its entries
 */
int enext(struct dirent *dp, struct dirent *ep, uint off, int *count)
{
    80206fd6:	7119                	addi	sp,sp,-128
    80206fd8:	fc86                	sd	ra,120(sp)
    80206fda:	f8a2                	sd	s0,112(sp)
    80206fdc:	f4a6                	sd	s1,104(sp)
    80206fde:	f0ca                	sd	s2,96(sp)
    80206fe0:	ecce                	sd	s3,88(sp)
    80206fe2:	e8d2                	sd	s4,80(sp)
    80206fe4:	e4d6                	sd	s5,72(sp)
    80206fe6:	e0da                	sd	s6,64(sp)
    80206fe8:	fc5e                	sd	s7,56(sp)
    80206fea:	f862                	sd	s8,48(sp)
    80206fec:	f466                	sd	s9,40(sp)
    80206fee:	f06a                	sd	s10,32(sp)
    80206ff0:	0100                	addi	s0,sp,128
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206ff2:	10054783          	lbu	a5,256(a0)
    80206ff6:	8bc1                	andi	a5,a5,16
    80206ff8:	cf9d                	beqz	a5,80207036 <enext+0x60>
    80206ffa:	892a                	mv	s2,a0
    80206ffc:	8aae                	mv	s5,a1
    80206ffe:	84b2                	mv	s1,a2
    80207000:	8a36                	mv	s4,a3
        panic("enext not dir");
    if (ep->valid)
    80207002:	11659783          	lh	a5,278(a1)
    80207006:	e3a1                	bnez	a5,80207046 <enext+0x70>
        panic("enext ep valid");
    if (off % 32)
    80207008:	01f67793          	andi	a5,a2,31
    8020700c:	e7a9                	bnez	a5,80207056 <enext+0x80>
        panic("enext not align");
    if (dp->valid != 1) { return -1; }
    8020700e:	11651703          	lh	a4,278(a0)
    80207012:	4785                	li	a5,1
    80207014:	557d                	li	a0,-1
    80207016:	04f70863          	beq	a4,a5,80207066 <enext+0x90>
            read_entry_info(ep, &de);
            return 1;
        }
    }
    return -1;
}
    8020701a:	70e6                	ld	ra,120(sp)
    8020701c:	7446                	ld	s0,112(sp)
    8020701e:	74a6                	ld	s1,104(sp)
    80207020:	7906                	ld	s2,96(sp)
    80207022:	69e6                	ld	s3,88(sp)
    80207024:	6a46                	ld	s4,80(sp)
    80207026:	6aa6                	ld	s5,72(sp)
    80207028:	6b06                	ld	s6,64(sp)
    8020702a:	7be2                	ld	s7,56(sp)
    8020702c:	7c42                	ld	s8,48(sp)
    8020702e:	7ca2                	ld	s9,40(sp)
    80207030:	7d02                	ld	s10,32(sp)
    80207032:	6109                	addi	sp,sp,128
    80207034:	8082                	ret
        panic("enext not dir");
    80207036:	00003517          	auipc	a0,0x3
    8020703a:	d1250513          	addi	a0,a0,-750 # 80209d48 <digits+0x9c8>
    8020703e:	ffff9097          	auipc	ra,0xffff9
    80207042:	104080e7          	jalr	260(ra) # 80200142 <panic>
        panic("enext ep valid");
    80207046:	00003517          	auipc	a0,0x3
    8020704a:	d1250513          	addi	a0,a0,-750 # 80209d58 <digits+0x9d8>
    8020704e:	ffff9097          	auipc	ra,0xffff9
    80207052:	0f4080e7          	jalr	244(ra) # 80200142 <panic>
        panic("enext not align");
    80207056:	00003517          	auipc	a0,0x3
    8020705a:	d1250513          	addi	a0,a0,-750 # 80209d68 <digits+0x9e8>
    8020705e:	ffff9097          	auipc	ra,0xffff9
    80207062:	0e4080e7          	jalr	228(ra) # 80200142 <panic>
    memset(ep->filename, 0, FAT32_MAX_FILENAME + 1);
    80207066:	8d2e                	mv	s10,a1
    80207068:	10000613          	li	a2,256
    8020706c:	4581                	li	a1,0
    8020706e:	8556                	mv	a0,s5
    80207070:	ffff9097          	auipc	ra,0xffff9
    80207074:	6f4080e7          	jalr	1780(ra) # 80200764 <memset>
    int cnt = 0;
    80207078:	4b01                	li	s6,0
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    8020707a:	5bfd                	li	s7,-1
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    8020707c:	f8040993          	addi	s3,s0,-128
        if (de.lne.order == EMPTY_ENTRY) {
    80207080:	0e500c13          	li	s8,229
        if (de.lne.attr == ATTR_LONG_NAME) {
    80207084:	4cbd                	li	s9,15
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80207086:	a03d                	j	802070b4 <enext+0xde>
            cnt++;
    80207088:	2b05                	addiw	s6,s6,1
            continue;
    8020708a:	a01d                	j	802070b0 <enext+0xda>
            *count = cnt;
    8020708c:	016a2023          	sw	s6,0(s4)
            return 0;
    80207090:	4501                	li	a0,0
    80207092:	b761                	j	8020701a <enext+0x44>
            read_entry_name(ep->filename + (lcnt - 1) * CHAR_LONG_NAME, &de);
    80207094:	fff5079b          	addiw	a5,a0,-1
    80207098:	0017951b          	slliw	a0,a5,0x1
    8020709c:	9d3d                	addw	a0,a0,a5
    8020709e:	0025151b          	slliw	a0,a0,0x2
    802070a2:	9d3d                	addw	a0,a0,a5
    802070a4:	85ce                	mv	a1,s3
    802070a6:	956a                	add	a0,a0,s10
    802070a8:	fffff097          	auipc	ra,0xfffff
    802070ac:	18e080e7          	jalr	398(ra) # 80206236 <read_entry_name>
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    802070b0:	0204849b          	addiw	s1,s1,32
    802070b4:	4601                	li	a2,0
    802070b6:	85a6                	mv	a1,s1
    802070b8:	854a                	mv	a0,s2
    802070ba:	fffff097          	auipc	ra,0xfffff
    802070be:	e18080e7          	jalr	-488(ra) # 80205ed2 <reloc_clus>
    802070c2:	f5750ce3          	beq	a0,s7,8020701a <enext+0x44>
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    802070c6:	02000793          	li	a5,32
    802070ca:	0005071b          	sext.w	a4,a0
    802070ce:	86ce                	mv	a3,s3
    802070d0:	4601                	li	a2,0
    802070d2:	4581                	li	a1,0
    802070d4:	10c92503          	lw	a0,268(s2)
    802070d8:	fffff097          	auipc	ra,0xfffff
    802070dc:	f04080e7          	jalr	-252(ra) # 80205fdc <rw_clus>
    802070e0:	2501                	sext.w	a0,a0
    802070e2:	02000793          	li	a5,32
    802070e6:	06f51c63          	bne	a0,a5,8020715e <enext+0x188>
    802070ea:	f8044783          	lbu	a5,-128(s0)
    802070ee:	cbb5                	beqz	a5,80207162 <enext+0x18c>
        if (de.lne.order == EMPTY_ENTRY) {
    802070f0:	f9878ce3          	beq	a5,s8,80207088 <enext+0xb2>
        } else if (cnt) {
    802070f4:	f80b1ce3          	bnez	s6,8020708c <enext+0xb6>
        if (de.lne.attr == ATTR_LONG_NAME) {
    802070f8:	f8b44703          	lbu	a4,-117(s0)
    802070fc:	01971d63          	bne	a4,s9,80207116 <enext+0x140>
            int lcnt = de.lne.order & ~LAST_LONG_ENTRY;
    80207100:	0bf7f513          	andi	a0,a5,191
            if (de.lne.order & LAST_LONG_ENTRY) {
    80207104:	0407f793          	andi	a5,a5,64
    80207108:	d7d1                	beqz	a5,80207094 <enext+0xbe>
                *count = lcnt + 1;                              // plus the s-n-e;
    8020710a:	0015079b          	addiw	a5,a0,1
    8020710e:	00fa2023          	sw	a5,0(s4)
                count = 0;
    80207112:	4a01                	li	s4,0
    80207114:	b741                	j	80207094 <enext+0xbe>
            if (count) {
    80207116:	000a0c63          	beqz	s4,8020712e <enext+0x158>
                *count = 1;
    8020711a:	4785                	li	a5,1
    8020711c:	00fa2023          	sw	a5,0(s4)
                read_entry_name(ep->filename, &de);
    80207120:	f8040593          	addi	a1,s0,-128
    80207124:	8556                	mv	a0,s5
    80207126:	fffff097          	auipc	ra,0xfffff
    8020712a:	110080e7          	jalr	272(ra) # 80206236 <read_entry_name>
    entry->attribute = d->sne.attr;
    8020712e:	f8b44783          	lbu	a5,-117(s0)
    80207132:	10fa8023          	sb	a5,256(s5)
    entry->first_clus = ((uint32)d->sne.fst_clus_hi << 16) | d->sne.fst_clus_lo;
    80207136:	f9445783          	lhu	a5,-108(s0)
    8020713a:	0107979b          	slliw	a5,a5,0x10
    8020713e:	f9a45703          	lhu	a4,-102(s0)
    80207142:	8fd9                	or	a5,a5,a4
    80207144:	2781                	sext.w	a5,a5
    80207146:	10faa223          	sw	a5,260(s5)
    entry->file_size = d->sne.file_size;
    8020714a:	f9c42703          	lw	a4,-100(s0)
    8020714e:	10eaa423          	sw	a4,264(s5)
    entry->cur_clus = entry->first_clus;
    80207152:	10faa623          	sw	a5,268(s5)
    entry->clus_cnt = 0;
    80207156:	100aa823          	sw	zero,272(s5)
            return 1;
    8020715a:	4505                	li	a0,1
}
    8020715c:	bd7d                	j	8020701a <enext+0x44>
            return -1;
    8020715e:	557d                	li	a0,-1
    80207160:	bd6d                	j	8020701a <enext+0x44>
    80207162:	557d                	li	a0,-1
    80207164:	bd5d                	j	8020701a <enext+0x44>

0000000080207166 <dirlookup>:
 * @param   dp          entry of a directory file
 * @param   filename    target filename
 * @param   poff        offset of proper empty entry slots from the beginning of the dir
 */
struct dirent *dirlookup(struct dirent *dp, char *filename, uint *poff)
{
    80207166:	711d                	addi	sp,sp,-96
    80207168:	ec86                	sd	ra,88(sp)
    8020716a:	e8a2                	sd	s0,80(sp)
    8020716c:	e4a6                	sd	s1,72(sp)
    8020716e:	e0ca                	sd	s2,64(sp)
    80207170:	fc4e                	sd	s3,56(sp)
    80207172:	f852                	sd	s4,48(sp)
    80207174:	f456                	sd	s5,40(sp)
    80207176:	f05a                	sd	s6,32(sp)
    80207178:	ec5e                	sd	s7,24(sp)
    8020717a:	1080                	addi	s0,sp,96
    if (!(dp->attribute & ATTR_DIRECTORY))
    8020717c:	10054783          	lbu	a5,256(a0)
    80207180:	8bc1                	andi	a5,a5,16
    80207182:	cbb1                	beqz	a5,802071d6 <dirlookup+0x70>
    80207184:	84aa                	mv	s1,a0
    80207186:	89ae                	mv	s3,a1
    80207188:	8ab2                	mv	s5,a2
        panic("dirlookup not DIR");
    if (strncmp(filename, ".", FAT32_MAX_FILENAME) == 0) {
    8020718a:	0ff00613          	li	a2,255
    8020718e:	00003597          	auipc	a1,0x3
    80207192:	c0258593          	addi	a1,a1,-1022 # 80209d90 <digits+0xa10>
    80207196:	854e                	mv	a0,s3
    80207198:	ffff9097          	auipc	ra,0xffff9
    8020719c:	6a8080e7          	jalr	1704(ra) # 80200840 <strncmp>
    802071a0:	c139                	beqz	a0,802071e6 <dirlookup+0x80>
        return edup(dp);
    } else if (strncmp(filename, "..", FAT32_MAX_FILENAME) == 0) {
    802071a2:	0ff00613          	li	a2,255
    802071a6:	00003597          	auipc	a1,0x3
    802071aa:	bf258593          	addi	a1,a1,-1038 # 80209d98 <digits+0xa18>
    802071ae:	854e                	mv	a0,s3
    802071b0:	ffff9097          	auipc	ra,0xffff9
    802071b4:	690080e7          	jalr	1680(ra) # 80200840 <strncmp>
    802071b8:	e125                	bnez	a0,80207218 <dirlookup+0xb2>
        if (dp == &root) {
    802071ba:	00023797          	auipc	a5,0x23
    802071be:	5f678793          	addi	a5,a5,1526 # 8022a7b0 <root>
    802071c2:	04f48463          	beq	s1,a5,8020720a <dirlookup+0xa4>
            return edup(&root);
        }
        return edup(dp->parent);
    802071c6:	1204b503          	ld	a0,288(s1)
    802071ca:	00000097          	auipc	ra,0x0
    802071ce:	9aa080e7          	jalr	-1622(ra) # 80206b74 <edup>
    802071d2:	892a                	mv	s2,a0
    802071d4:	a839                	j	802071f2 <dirlookup+0x8c>
        panic("dirlookup not DIR");
    802071d6:	00003517          	auipc	a0,0x3
    802071da:	ba250513          	addi	a0,a0,-1118 # 80209d78 <digits+0x9f8>
    802071de:	ffff9097          	auipc	ra,0xffff9
    802071e2:	f64080e7          	jalr	-156(ra) # 80200142 <panic>
        return edup(dp);
    802071e6:	8526                	mv	a0,s1
    802071e8:	00000097          	auipc	ra,0x0
    802071ec:	98c080e7          	jalr	-1652(ra) # 80206b74 <edup>
    802071f0:	892a                	mv	s2,a0
    if (poff) {
        *poff = off;
    }
    eput(ep);
    return NULL;
}
    802071f2:	854a                	mv	a0,s2
    802071f4:	60e6                	ld	ra,88(sp)
    802071f6:	6446                	ld	s0,80(sp)
    802071f8:	64a6                	ld	s1,72(sp)
    802071fa:	6906                	ld	s2,64(sp)
    802071fc:	79e2                	ld	s3,56(sp)
    802071fe:	7a42                	ld	s4,48(sp)
    80207200:	7aa2                	ld	s5,40(sp)
    80207202:	7b02                	ld	s6,32(sp)
    80207204:	6be2                	ld	s7,24(sp)
    80207206:	6125                	addi	sp,sp,96
    80207208:	8082                	ret
            return edup(&root);
    8020720a:	853e                	mv	a0,a5
    8020720c:	00000097          	auipc	ra,0x0
    80207210:	968080e7          	jalr	-1688(ra) # 80206b74 <edup>
    80207214:	892a                	mv	s2,a0
    80207216:	bff1                	j	802071f2 <dirlookup+0x8c>
    if (dp->valid != 1) {
    80207218:	11649703          	lh	a4,278(s1)
    8020721c:	4785                	li	a5,1
        return NULL;
    8020721e:	4901                	li	s2,0
    if (dp->valid != 1) {
    80207220:	fcf719e3          	bne	a4,a5,802071f2 <dirlookup+0x8c>
    struct dirent *ep = eget(dp, filename);
    80207224:	85ce                	mv	a1,s3
    80207226:	8526                	mv	a0,s1
    80207228:	fffff097          	auipc	ra,0xfffff
    8020722c:	f00080e7          	jalr	-256(ra) # 80206128 <eget>
    80207230:	892a                	mv	s2,a0
    if (ep->valid == 1) { return ep; }                               // ecache hits
    80207232:	11651703          	lh	a4,278(a0)
    80207236:	4785                	li	a5,1
    80207238:	faf70de3          	beq	a4,a5,802071f2 <dirlookup+0x8c>
    int len = strlen(filename);
    8020723c:	854e                	mv	a0,s3
    8020723e:	ffff9097          	auipc	ra,0xffff9
    80207242:	6ae080e7          	jalr	1710(ra) # 802008ec <strlen>
    int count = 0;
    80207246:	fa042623          	sw	zero,-84(s0)
    reloc_clus(dp, 0, 0);
    8020724a:	4601                	li	a2,0
    8020724c:	4581                	li	a1,0
    8020724e:	8526                	mv	a0,s1
    80207250:	fffff097          	auipc	ra,0xfffff
    80207254:	c82080e7          	jalr	-894(ra) # 80205ed2 <reloc_clus>
    uint off = 0;
    80207258:	4a01                	li	s4,0
    while ((type = enext(dp, ep, off, &count) != -1)) {
    8020725a:	fac40b93          	addi	s7,s0,-84
    8020725e:	5b7d                	li	s6,-1
    80207260:	86de                	mv	a3,s7
    80207262:	8652                	mv	a2,s4
    80207264:	85ca                	mv	a1,s2
    80207266:	8526                	mv	a0,s1
    80207268:	00000097          	auipc	ra,0x0
    8020726c:	d6e080e7          	jalr	-658(ra) # 80206fd6 <enext>
    80207270:	03650f63          	beq	a0,s6,802072ae <dirlookup+0x148>
        } else if (strncmp(filename, ep->filename, FAT32_MAX_FILENAME) == 0) {
    80207274:	0ff00613          	li	a2,255
    80207278:	85ca                	mv	a1,s2
    8020727a:	854e                	mv	a0,s3
    8020727c:	ffff9097          	auipc	ra,0xffff9
    80207280:	5c4080e7          	jalr	1476(ra) # 80200840 <strncmp>
    80207284:	c901                	beqz	a0,80207294 <dirlookup+0x12e>
        off += count << 5;
    80207286:	fac42783          	lw	a5,-84(s0)
    8020728a:	0057979b          	slliw	a5,a5,0x5
    8020728e:	01478a3b          	addw	s4,a5,s4
    80207292:	b7f9                	j	80207260 <dirlookup+0xfa>
            ep->parent = edup(dp);
    80207294:	8526                	mv	a0,s1
    80207296:	00000097          	auipc	ra,0x0
    8020729a:	8de080e7          	jalr	-1826(ra) # 80206b74 <edup>
    8020729e:	12a93023          	sd	a0,288(s2)
            ep->off = off;
    802072a2:	11492e23          	sw	s4,284(s2)
            ep->valid = 1;
    802072a6:	4785                	li	a5,1
    802072a8:	10f91b23          	sh	a5,278(s2)
            return ep;
    802072ac:	b799                	j	802071f2 <dirlookup+0x8c>
    if (poff) {
    802072ae:	000a8463          	beqz	s5,802072b6 <dirlookup+0x150>
        *poff = off;
    802072b2:	014aa023          	sw	s4,0(s5)
    eput(ep);
    802072b6:	854a                	mv	a0,s2
    802072b8:	00000097          	auipc	ra,0x0
    802072bc:	b9e080e7          	jalr	-1122(ra) # 80206e56 <eput>
    return NULL;
    802072c0:	4901                	li	s2,0
    802072c2:	bf05                	j	802071f2 <dirlookup+0x8c>

00000000802072c4 <ealloc>:
{
    802072c4:	7139                	addi	sp,sp,-64
    802072c6:	fc06                	sd	ra,56(sp)
    802072c8:	f822                	sd	s0,48(sp)
    802072ca:	f426                	sd	s1,40(sp)
    802072cc:	f04a                	sd	s2,32(sp)
    802072ce:	ec4e                	sd	s3,24(sp)
    802072d0:	e852                	sd	s4,16(sp)
    802072d2:	0080                	addi	s0,sp,64
    802072d4:	892a                	mv	s2,a0
    if (!(dp->attribute & ATTR_DIRECTORY)) {
    802072d6:	10054783          	lbu	a5,256(a0)
    802072da:	8bc1                	andi	a5,a5,16
    802072dc:	c7a9                	beqz	a5,80207326 <ealloc+0x62>
    802072de:	852e                	mv	a0,a1
    802072e0:	8a32                	mv	s4,a2
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    802072e2:	11691703          	lh	a4,278(s2)
    802072e6:	4785                	li	a5,1
        return NULL;
    802072e8:	4481                	li	s1,0
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    802072ea:	02f71563          	bne	a4,a5,80207314 <ealloc+0x50>
    802072ee:	fffff097          	auipc	ra,0xfffff
    802072f2:	41e080e7          	jalr	1054(ra) # 8020670c <formatname>
    802072f6:	89aa                	mv	s3,a0
    802072f8:	10050663          	beqz	a0,80207404 <ealloc+0x140>
    uint off = 0;
    802072fc:	fc042623          	sw	zero,-52(s0)
    if ((ep = dirlookup(dp, name, &off)) != 0) {      // entry exists
    80207300:	fcc40613          	addi	a2,s0,-52
    80207304:	85aa                	mv	a1,a0
    80207306:	854a                	mv	a0,s2
    80207308:	00000097          	auipc	ra,0x0
    8020730c:	e5e080e7          	jalr	-418(ra) # 80207166 <dirlookup>
    80207310:	84aa                	mv	s1,a0
    80207312:	c115                	beqz	a0,80207336 <ealloc+0x72>
}
    80207314:	8526                	mv	a0,s1
    80207316:	70e2                	ld	ra,56(sp)
    80207318:	7442                	ld	s0,48(sp)
    8020731a:	74a2                	ld	s1,40(sp)
    8020731c:	7902                	ld	s2,32(sp)
    8020731e:	69e2                	ld	s3,24(sp)
    80207320:	6a42                	ld	s4,16(sp)
    80207322:	6121                	addi	sp,sp,64
    80207324:	8082                	ret
        panic("ealloc not dir");
    80207326:	00003517          	auipc	a0,0x3
    8020732a:	a7a50513          	addi	a0,a0,-1414 # 80209da0 <digits+0xa20>
    8020732e:	ffff9097          	auipc	ra,0xffff9
    80207332:	e14080e7          	jalr	-492(ra) # 80200142 <panic>
    ep = eget(dp, name);
    80207336:	85ce                	mv	a1,s3
    80207338:	854a                	mv	a0,s2
    8020733a:	fffff097          	auipc	ra,0xfffff
    8020733e:	dee080e7          	jalr	-530(ra) # 80206128 <eget>
    80207342:	84aa                	mv	s1,a0
    elock(ep);
    80207344:	00000097          	auipc	ra,0x0
    80207348:	a8e080e7          	jalr	-1394(ra) # 80206dd2 <elock>
    ep->attribute = attr;
    8020734c:	11448023          	sb	s4,256(s1)
    ep->file_size = 0;
    80207350:	1004a423          	sw	zero,264(s1)
    ep->first_clus = 0;
    80207354:	1004a223          	sw	zero,260(s1)
    ep->parent = edup(dp);
    80207358:	854a                	mv	a0,s2
    8020735a:	00000097          	auipc	ra,0x0
    8020735e:	81a080e7          	jalr	-2022(ra) # 80206b74 <edup>
    80207362:	12a4b023          	sd	a0,288(s1)
    ep->off = off;
    80207366:	fcc42783          	lw	a5,-52(s0)
    8020736a:	10f4ae23          	sw	a5,284(s1)
    ep->clus_cnt = 0;
    8020736e:	1004a823          	sw	zero,272(s1)
    ep->cur_clus = 0;
    80207372:	1004a623          	sw	zero,268(s1)
    ep->dirty = 0;
    80207376:	10048aa3          	sb	zero,277(s1)
    strncpy(ep->filename, name, FAT32_MAX_FILENAME);
    8020737a:	0ff00613          	li	a2,255
    8020737e:	85ce                	mv	a1,s3
    80207380:	8526                	mv	a0,s1
    80207382:	ffff9097          	auipc	ra,0xffff9
    80207386:	4fa080e7          	jalr	1274(ra) # 8020087c <strncpy>
    ep->filename[FAT32_MAX_FILENAME] = '\0';
    8020738a:	0e048fa3          	sb	zero,255(s1)
    if (attr == ATTR_DIRECTORY) {    // generate "." and ".." for ep
    8020738e:	47c1                	li	a5,16
    80207390:	02fa0963          	beq	s4,a5,802073c2 <ealloc+0xfe>
        ep->attribute |= ATTR_ARCHIVE;
    80207394:	1004c783          	lbu	a5,256(s1)
    80207398:	0207e793          	ori	a5,a5,32
    8020739c:	10f48023          	sb	a5,256(s1)
    emake(dp, ep, off);
    802073a0:	fcc42603          	lw	a2,-52(s0)
    802073a4:	85a6                	mv	a1,s1
    802073a6:	854a                	mv	a0,s2
    802073a8:	fffff097          	auipc	ra,0xfffff
    802073ac:	41c080e7          	jalr	1052(ra) # 802067c4 <emake>
    ep->valid = 1;
    802073b0:	4785                	li	a5,1
    802073b2:	10f49b23          	sh	a5,278(s1)
    eunlock(ep);
    802073b6:	8526                	mv	a0,s1
    802073b8:	00000097          	auipc	ra,0x0
    802073bc:	a50080e7          	jalr	-1456(ra) # 80206e08 <eunlock>
    return ep;
    802073c0:	bf91                	j	80207314 <ealloc+0x50>
        ep->attribute |= ATTR_DIRECTORY;
    802073c2:	1004c783          	lbu	a5,256(s1)
    802073c6:	0107e793          	ori	a5,a5,16
    802073ca:	10f48023          	sb	a5,256(s1)
        ep->cur_clus = ep->first_clus = alloc_clus(dp->dev);
    802073ce:	11494503          	lbu	a0,276(s2)
    802073d2:	fffff097          	auipc	ra,0xfffff
    802073d6:	940080e7          	jalr	-1728(ra) # 80205d12 <alloc_clus>
    802073da:	2501                	sext.w	a0,a0
    802073dc:	10a4a223          	sw	a0,260(s1)
    802073e0:	10a4a623          	sw	a0,268(s1)
        emake(ep, ep, 0);
    802073e4:	4601                	li	a2,0
    802073e6:	85a6                	mv	a1,s1
    802073e8:	8526                	mv	a0,s1
    802073ea:	fffff097          	auipc	ra,0xfffff
    802073ee:	3da080e7          	jalr	986(ra) # 802067c4 <emake>
        emake(ep, dp, 32);
    802073f2:	02000613          	li	a2,32
    802073f6:	85ca                	mv	a1,s2
    802073f8:	8526                	mv	a0,s1
    802073fa:	fffff097          	auipc	ra,0xfffff
    802073fe:	3ca080e7          	jalr	970(ra) # 802067c4 <emake>
    80207402:	bf79                	j	802073a0 <ealloc+0xdc>
        return NULL;
    80207404:	84aa                	mv	s1,a0
    80207406:	b739                	j	80207314 <ealloc+0x50>

0000000080207408 <lookup_path>:
    return path;
}

// FAT32 version of namex in xv6's original file system.
static struct dirent *lookup_path(char *path, int parent, char *name)
{
    80207408:	715d                	addi	sp,sp,-80
    8020740a:	e486                	sd	ra,72(sp)
    8020740c:	e0a2                	sd	s0,64(sp)
    8020740e:	fc26                	sd	s1,56(sp)
    80207410:	f84a                	sd	s2,48(sp)
    80207412:	f44e                	sd	s3,40(sp)
    80207414:	f052                	sd	s4,32(sp)
    80207416:	ec56                	sd	s5,24(sp)
    80207418:	e85a                	sd	s6,16(sp)
    8020741a:	e45e                	sd	s7,8(sp)
    8020741c:	e062                	sd	s8,0(sp)
    8020741e:	0880                	addi	s0,sp,80
    80207420:	892a                	mv	s2,a0
    80207422:	8b2e                	mv	s6,a1
    80207424:	8ab2                	mv	s5,a2
    struct dirent *entry, *next;
    if (*path == '/') {
    80207426:	00054783          	lbu	a5,0(a0)
    8020742a:	02f00713          	li	a4,47
    8020742e:	02e78663          	beq	a5,a4,8020745a <lookup_path+0x52>
        entry = edup(&root);
    } else if (*path != '\0') {
        entry = edup(myproc()->cwd);
    } else {
        return NULL;
    80207432:	4981                	li	s3,0
    } else if (*path != '\0') {
    80207434:	cba1                	beqz	a5,80207484 <lookup_path+0x7c>
        entry = edup(myproc()->cwd);
    80207436:	ffffa097          	auipc	ra,0xffffa
    8020743a:	622080e7          	jalr	1570(ra) # 80201a58 <myproc>
    8020743e:	4d853503          	ld	a0,1240(a0)
    80207442:	fffff097          	auipc	ra,0xfffff
    80207446:	732080e7          	jalr	1842(ra) # 80206b74 <edup>
    8020744a:	89aa                	mv	s3,a0
    while (*path == '/') {
    8020744c:	02f00a13          	li	s4,47
    80207450:	0ff00b93          	li	s7,255
    80207454:	0ff00c13          	li	s8,255
    80207458:	a0dd                	j	8020753e <lookup_path+0x136>
        entry = edup(&root);
    8020745a:	00023517          	auipc	a0,0x23
    8020745e:	35650513          	addi	a0,a0,854 # 8022a7b0 <root>
    80207462:	fffff097          	auipc	ra,0xfffff
    80207466:	712080e7          	jalr	1810(ra) # 80206b74 <edup>
    8020746a:	89aa                	mv	s3,a0
    8020746c:	b7c5                	j	8020744c <lookup_path+0x44>
    }
    while ((path = skipelem(path, name)) != 0) {
        elock(entry);
        if (!(entry->attribute & ATTR_DIRECTORY)) {
            eunlock(entry);
    8020746e:	854e                	mv	a0,s3
    80207470:	00000097          	auipc	ra,0x0
    80207474:	998080e7          	jalr	-1640(ra) # 80206e08 <eunlock>
            eput(entry);
    80207478:	854e                	mv	a0,s3
    8020747a:	00000097          	auipc	ra,0x0
    8020747e:	9dc080e7          	jalr	-1572(ra) # 80206e56 <eput>
            return NULL;
    80207482:	4981                	li	s3,0
    if (parent) {
        eput(entry);
        return NULL;
    }
    return entry;
}
    80207484:	854e                	mv	a0,s3
    80207486:	60a6                	ld	ra,72(sp)
    80207488:	6406                	ld	s0,64(sp)
    8020748a:	74e2                	ld	s1,56(sp)
    8020748c:	7942                	ld	s2,48(sp)
    8020748e:	79a2                	ld	s3,40(sp)
    80207490:	7a02                	ld	s4,32(sp)
    80207492:	6ae2                	ld	s5,24(sp)
    80207494:	6b42                	ld	s6,16(sp)
    80207496:	6ba2                	ld	s7,8(sp)
    80207498:	6c02                	ld	s8,0(sp)
    8020749a:	6161                	addi	sp,sp,80
    8020749c:	8082                	ret
            eunlock(entry);
    8020749e:	854e                	mv	a0,s3
    802074a0:	00000097          	auipc	ra,0x0
    802074a4:	968080e7          	jalr	-1688(ra) # 80206e08 <eunlock>
            return entry;
    802074a8:	bff1                	j	80207484 <lookup_path+0x7c>
            eunlock(entry);
    802074aa:	854e                	mv	a0,s3
    802074ac:	00000097          	auipc	ra,0x0
    802074b0:	95c080e7          	jalr	-1700(ra) # 80206e08 <eunlock>
            eput(entry);
    802074b4:	854e                	mv	a0,s3
    802074b6:	00000097          	auipc	ra,0x0
    802074ba:	9a0080e7          	jalr	-1632(ra) # 80206e56 <eput>
            return NULL;
    802074be:	89ca                	mv	s3,s2
    802074c0:	b7d1                	j	80207484 <lookup_path+0x7c>
    int len = path - s;
    802074c2:	412487bb          	subw	a5,s1,s2
    if (len > FAT32_MAX_FILENAME) {
    802074c6:	863e                	mv	a2,a5
    802074c8:	00fbd363          	bge	s7,a5,802074ce <lookup_path+0xc6>
    802074cc:	8662                	mv	a2,s8
    802074ce:	0006079b          	sext.w	a5,a2
    name[len] = 0;
    802074d2:	97d6                	add	a5,a5,s5
    802074d4:	00078023          	sb	zero,0(a5)
    memmove(name, s, len);
    802074d8:	2601                	sext.w	a2,a2
    802074da:	85ca                	mv	a1,s2
    802074dc:	8556                	mv	a0,s5
    802074de:	ffff9097          	auipc	ra,0xffff9
    802074e2:	2e6080e7          	jalr	742(ra) # 802007c4 <memmove>
    while (*path == '/') {
    802074e6:	0004c783          	lbu	a5,0(s1)
    802074ea:	01479763          	bne	a5,s4,802074f8 <lookup_path+0xf0>
        path++;
    802074ee:	0485                	addi	s1,s1,1
    while (*path == '/') {
    802074f0:	0004c783          	lbu	a5,0(s1)
    802074f4:	ff478de3          	beq	a5,s4,802074ee <lookup_path+0xe6>
        elock(entry);
    802074f8:	854e                	mv	a0,s3
    802074fa:	00000097          	auipc	ra,0x0
    802074fe:	8d8080e7          	jalr	-1832(ra) # 80206dd2 <elock>
        if (!(entry->attribute & ATTR_DIRECTORY)) {
    80207502:	1009c783          	lbu	a5,256(s3)
    80207506:	8bc1                	andi	a5,a5,16
    80207508:	d3bd                	beqz	a5,8020746e <lookup_path+0x66>
        if (parent && *path == '\0') {
    8020750a:	000b0563          	beqz	s6,80207514 <lookup_path+0x10c>
    8020750e:	0004c783          	lbu	a5,0(s1)
    80207512:	d7d1                	beqz	a5,8020749e <lookup_path+0x96>
        if ((next = dirlookup(entry, name, 0)) == 0) {
    80207514:	4601                	li	a2,0
    80207516:	85d6                	mv	a1,s5
    80207518:	854e                	mv	a0,s3
    8020751a:	00000097          	auipc	ra,0x0
    8020751e:	c4c080e7          	jalr	-948(ra) # 80207166 <dirlookup>
    80207522:	892a                	mv	s2,a0
    80207524:	d159                	beqz	a0,802074aa <lookup_path+0xa2>
        eunlock(entry);
    80207526:	854e                	mv	a0,s3
    80207528:	00000097          	auipc	ra,0x0
    8020752c:	8e0080e7          	jalr	-1824(ra) # 80206e08 <eunlock>
        eput(entry);
    80207530:	854e                	mv	a0,s3
    80207532:	00000097          	auipc	ra,0x0
    80207536:	924080e7          	jalr	-1756(ra) # 80206e56 <eput>
        entry = next;
    8020753a:	89ca                	mv	s3,s2
        eput(entry);
    8020753c:	8926                	mv	s2,s1
    while (*path == '/') {
    8020753e:	00094783          	lbu	a5,0(s2)
    80207542:	03479363          	bne	a5,s4,80207568 <lookup_path+0x160>
        path++;
    80207546:	0905                	addi	s2,s2,1
    while (*path == '/') {
    80207548:	00094783          	lbu	a5,0(s2)
    8020754c:	ff478de3          	beq	a5,s4,80207546 <lookup_path+0x13e>
    if (*path == 0) { return NULL; }
    80207550:	cf89                	beqz	a5,8020756a <lookup_path+0x162>
        path++;
    80207552:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    80207554:	f74787e3          	beq	a5,s4,802074c2 <lookup_path+0xba>
        eput(entry);
    80207558:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    8020755a:	d7a5                	beqz	a5,802074c2 <lookup_path+0xba>
        path++;
    8020755c:	0485                	addi	s1,s1,1
    while (*path != '/' && *path != 0) {
    8020755e:	0004c783          	lbu	a5,0(s1)
    80207562:	ff479ce3          	bne	a5,s4,8020755a <lookup_path+0x152>
    80207566:	bfb1                	j	802074c2 <lookup_path+0xba>
    if (*path == 0) { return NULL; }
    80207568:	fbe5                	bnez	a5,80207558 <lookup_path+0x150>
    if (parent) {
    8020756a:	f00b0de3          	beqz	s6,80207484 <lookup_path+0x7c>
        eput(entry);
    8020756e:	854e                	mv	a0,s3
    80207570:	00000097          	auipc	ra,0x0
    80207574:	8e6080e7          	jalr	-1818(ra) # 80206e56 <eput>
        return NULL;
    80207578:	4981                	li	s3,0
    8020757a:	b729                	j	80207484 <lookup_path+0x7c>

000000008020757c <ename>:

struct dirent *ename(char *path)
{
    8020757c:	716d                	addi	sp,sp,-272
    8020757e:	e606                	sd	ra,264(sp)
    80207580:	e222                	sd	s0,256(sp)
    80207582:	0a00                	addi	s0,sp,272
    char name[FAT32_MAX_FILENAME + 1];
    return lookup_path(path, 0, name);
    80207584:	ef040613          	addi	a2,s0,-272
    80207588:	4581                	li	a1,0
    8020758a:	00000097          	auipc	ra,0x0
    8020758e:	e7e080e7          	jalr	-386(ra) # 80207408 <lookup_path>
}
    80207592:	60b2                	ld	ra,264(sp)
    80207594:	6412                	ld	s0,256(sp)
    80207596:	6151                	addi	sp,sp,272
    80207598:	8082                	ret

000000008020759a <enameparent>:

struct dirent *enameparent(char *path, char *name)
{
    8020759a:	1141                	addi	sp,sp,-16
    8020759c:	e406                	sd	ra,8(sp)
    8020759e:	e022                	sd	s0,0(sp)
    802075a0:	0800                	addi	s0,sp,16
    802075a2:	862e                	mv	a2,a1
    return lookup_path(path, 1, name);
    802075a4:	4585                	li	a1,1
    802075a6:	00000097          	auipc	ra,0x0
    802075aa:	e62080e7          	jalr	-414(ra) # 80207408 <lookup_path>
}
    802075ae:	60a2                	ld	ra,8(sp)
    802075b0:	6402                	ld	s0,0(sp)
    802075b2:	0141                	addi	sp,sp,16
    802075b4:	8082                	ret

00000000802075b6 <plicinit>:

//
// the riscv Platform Level Interrupt Controller (PLIC).
//

void plicinit(void) {
    802075b6:	1141                	addi	sp,sp,-16
    802075b8:	e422                	sd	s0,8(sp)
    802075ba:	0800                	addi	s0,sp,16
	writed(1, PLIC_V + DISK_IRQ * sizeof(uint32));
    802075bc:	00fc37b7          	lui	a5,0xfc3
    802075c0:	07ba                	slli	a5,a5,0xe
    802075c2:	4705                	li	a4,1
    802075c4:	c3d8                	sw	a4,4(a5)
	writed(1, PLIC_V + UART_IRQ * sizeof(uint32));
    802075c6:	d798                	sw	a4,40(a5)

	#ifdef DEBUG 
	printf("plicinit\n");
	#endif 
}
    802075c8:	6422                	ld	s0,8(sp)
    802075ca:	0141                	addi	sp,sp,16
    802075cc:	8082                	ret

00000000802075ce <plicinithart>:

void
plicinithart(void)
{
    802075ce:	1141                	addi	sp,sp,-16
    802075d0:	e406                	sd	ra,8(sp)
    802075d2:	e022                	sd	s0,0(sp)
    802075d4:	0800                	addi	s0,sp,16
  int hart = cpuid();
    802075d6:	ffffa097          	auipc	ra,0xffffa
    802075da:	456080e7          	jalr	1110(ra) # 80201a2c <cpuid>
  #ifdef QEMU
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART_IRQ) | (1 << DISK_IRQ);
    802075de:	0085171b          	slliw	a4,a0,0x8
    802075e2:	01f867b7          	lui	a5,0x1f86
    802075e6:	0785                	addi	a5,a5,1
    802075e8:	07b6                	slli	a5,a5,0xd
    802075ea:	97ba                	add	a5,a5,a4
    802075ec:	40200713          	li	a4,1026
    802075f0:	08e7a023          	sw	a4,128(a5) # 1f86080 <_entry-0x7e279f80>
  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    802075f4:	00d5179b          	slliw	a5,a0,0xd
    802075f8:	03f0c537          	lui	a0,0x3f0c
    802075fc:	20150513          	addi	a0,a0,513 # 3f0c201 <_entry-0x7c2f3dff>
    80207600:	0532                	slli	a0,a0,0xc
    80207602:	953e                	add	a0,a0,a5
    80207604:	00052023          	sw	zero,0(a0)
  *(hart0_m_int_enable_hi) = readd(hart0_m_int_enable_hi) | (1 << (UART_IRQ % 32));
  #endif
  #ifdef DEBUG
  printf("plicinithart\n");
  #endif
}
    80207608:	60a2                	ld	ra,8(sp)
    8020760a:	6402                	ld	s0,0(sp)
    8020760c:	0141                	addi	sp,sp,16
    8020760e:	8082                	ret

0000000080207610 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80207610:	1141                	addi	sp,sp,-16
    80207612:	e406                	sd	ra,8(sp)
    80207614:	e022                	sd	s0,0(sp)
    80207616:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80207618:	ffffa097          	auipc	ra,0xffffa
    8020761c:	414080e7          	jalr	1044(ra) # 80201a2c <cpuid>
  int irq;
  #ifndef QEMU
  irq = *(uint32*)PLIC_MCLAIM(hart);
  #else
  irq = *(uint32*)PLIC_SCLAIM(hart);
    80207620:	00d5179b          	slliw	a5,a0,0xd
    80207624:	03f0c537          	lui	a0,0x3f0c
    80207628:	20150513          	addi	a0,a0,513 # 3f0c201 <_entry-0x7c2f3dff>
    8020762c:	0532                	slli	a0,a0,0xc
    8020762e:	953e                	add	a0,a0,a5
  #endif
  return irq;
}
    80207630:	4148                	lw	a0,4(a0)
    80207632:	60a2                	ld	ra,8(sp)
    80207634:	6402                	ld	s0,0(sp)
    80207636:	0141                	addi	sp,sp,16
    80207638:	8082                	ret

000000008020763a <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    8020763a:	1101                	addi	sp,sp,-32
    8020763c:	ec06                	sd	ra,24(sp)
    8020763e:	e822                	sd	s0,16(sp)
    80207640:	e426                	sd	s1,8(sp)
    80207642:	1000                	addi	s0,sp,32
    80207644:	84aa                	mv	s1,a0
  int hart = cpuid();
    80207646:	ffffa097          	auipc	ra,0xffffa
    8020764a:	3e6080e7          	jalr	998(ra) # 80201a2c <cpuid>
  #ifndef QEMU
  *(uint32*)PLIC_MCLAIM(hart) = irq;
  #else
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    8020764e:	00d5151b          	slliw	a0,a0,0xd
    80207652:	03f0c7b7          	lui	a5,0x3f0c
    80207656:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    8020765a:	07b2                	slli	a5,a5,0xc
    8020765c:	97aa                	add	a5,a5,a0
    8020765e:	c3c4                	sw	s1,4(a5)
  #endif
}
    80207660:	60e2                	ld	ra,24(sp)
    80207662:	6442                	ld	s0,16(sp)
    80207664:	64a2                	ld	s1,8(sp)
    80207666:	6105                	addi	sp,sp,32
    80207668:	8082                	ret

000000008020766a <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    8020766a:	715d                	addi	sp,sp,-80
    8020766c:	e486                	sd	ra,72(sp)
    8020766e:	e0a2                	sd	s0,64(sp)
    80207670:	fc26                	sd	s1,56(sp)
    80207672:	f84a                	sd	s2,48(sp)
    80207674:	f44e                	sd	s3,40(sp)
    80207676:	f052                	sd	s4,32(sp)
    80207678:	ec56                	sd	s5,24(sp)
    8020767a:	e85a                	sd	s6,16(sp)
    8020767c:	0880                	addi	s0,sp,80
    8020767e:	8a2a                	mv	s4,a0
    80207680:	84ae                	mv	s1,a1
    80207682:	89b2                	mv	s3,a2
  int i;

  acquire(&cons.lock);
    80207684:	00028517          	auipc	a0,0x28
    80207688:	8fc50513          	addi	a0,a0,-1796 # 8022ef80 <cons>
    8020768c:	ffff9097          	auipc	ra,0xffff9
    80207690:	03c080e7          	jalr	60(ra) # 802006c8 <acquire>
  for(i = 0; i < n; i++){
    80207694:	05305f63          	blez	s3,802076f2 <consolewrite+0x88>
    80207698:	4901                	li	s2,0
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    8020769a:	fbf40b13          	addi	s6,s0,-65
    8020769e:	5afd                	li	s5,-1
    802076a0:	4685                	li	a3,1
    802076a2:	8626                	mv	a2,s1
    802076a4:	85d2                	mv	a1,s4
    802076a6:	855a                	mv	a0,s6
    802076a8:	ffffb097          	auipc	ra,0xffffb
    802076ac:	eb8080e7          	jalr	-328(ra) # 80202560 <either_copyin>
    802076b0:	01550e63          	beq	a0,s5,802076cc <consolewrite+0x62>
	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
    802076b4:	fbf44503          	lbu	a0,-65(s0)
    802076b8:	4581                	li	a1,0
    802076ba:	4601                	li	a2,0
    802076bc:	4681                	li	a3,0
    802076be:	4885                	li	a7,1
    802076c0:	00000073          	ecall
  for(i = 0; i < n; i++){
    802076c4:	2905                	addiw	s2,s2,1
    802076c6:	0485                	addi	s1,s1,1
    802076c8:	fd299ce3          	bne	s3,s2,802076a0 <consolewrite+0x36>
      break;
    sbi_console_putchar(c);
  }
  release(&cons.lock);
    802076cc:	00028517          	auipc	a0,0x28
    802076d0:	8b450513          	addi	a0,a0,-1868 # 8022ef80 <cons>
    802076d4:	ffff9097          	auipc	ra,0xffff9
    802076d8:	048080e7          	jalr	72(ra) # 8020071c <release>

  return i;
}
    802076dc:	854a                	mv	a0,s2
    802076de:	60a6                	ld	ra,72(sp)
    802076e0:	6406                	ld	s0,64(sp)
    802076e2:	74e2                	ld	s1,56(sp)
    802076e4:	7942                	ld	s2,48(sp)
    802076e6:	79a2                	ld	s3,40(sp)
    802076e8:	7a02                	ld	s4,32(sp)
    802076ea:	6ae2                	ld	s5,24(sp)
    802076ec:	6b42                	ld	s6,16(sp)
    802076ee:	6161                	addi	sp,sp,80
    802076f0:	8082                	ret
  for(i = 0; i < n; i++){
    802076f2:	4901                	li	s2,0
    802076f4:	bfe1                	j	802076cc <consolewrite+0x62>

00000000802076f6 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    802076f6:	7175                	addi	sp,sp,-144
    802076f8:	e506                	sd	ra,136(sp)
    802076fa:	e122                	sd	s0,128(sp)
    802076fc:	fca6                	sd	s1,120(sp)
    802076fe:	f8ca                	sd	s2,112(sp)
    80207700:	f4ce                	sd	s3,104(sp)
    80207702:	f0d2                	sd	s4,96(sp)
    80207704:	ecd6                	sd	s5,88(sp)
    80207706:	e8da                	sd	s6,80(sp)
    80207708:	e4de                	sd	s7,72(sp)
    8020770a:	e0e2                	sd	s8,64(sp)
    8020770c:	fc66                	sd	s9,56(sp)
    8020770e:	f86a                	sd	s10,48(sp)
    80207710:	f46e                	sd	s11,40(sp)
    80207712:	0900                	addi	s0,sp,144
    80207714:	f6a43c23          	sd	a0,-136(s0)
    80207718:	8aae                	mv	s5,a1
    8020771a:	8a32                	mv	s4,a2
  uint target;
  int c;
  char cbuf;

  target = n;
    8020771c:	00060b1b          	sext.w	s6,a2
  acquire(&cons.lock);
    80207720:	00028517          	auipc	a0,0x28
    80207724:	86050513          	addi	a0,a0,-1952 # 8022ef80 <cons>
    80207728:	ffff9097          	auipc	ra,0xffff9
    8020772c:	fa0080e7          	jalr	-96(ra) # 802006c8 <acquire>
  while(n > 0){
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
    80207730:	00028497          	auipc	s1,0x28
    80207734:	85048493          	addi	s1,s1,-1968 # 8022ef80 <cons>
      if(myproc()->killed){
        release(&cons.lock);
        return -1;
      }
      sleep(&cons.r, &cons.lock);
    80207738:	89a6                	mv	s3,s1
    8020773a:	00028917          	auipc	s2,0x28
    8020773e:	8de90913          	addi	s2,s2,-1826 # 8022f018 <cons+0x98>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];

    if(c == C('D')){  // end-of-file
    80207742:	4c11                	li	s8,4
      break;
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80207744:	f8f40d13          	addi	s10,s0,-113
    80207748:	5cfd                	li	s9,-1
      break;

    dst++;
    --n;

    if(c == '\n'){
    8020774a:	4da9                	li	s11,10
  while(n > 0){
    8020774c:	07405863          	blez	s4,802077bc <consoleread+0xc6>
    while(cons.r == cons.w){
    80207750:	0984a783          	lw	a5,152(s1)
    80207754:	09c4a703          	lw	a4,156(s1)
    80207758:	02f71463          	bne	a4,a5,80207780 <consoleread+0x8a>
      if(myproc()->killed){
    8020775c:	ffffa097          	auipc	ra,0xffffa
    80207760:	2fc080e7          	jalr	764(ra) # 80201a58 <myproc>
    80207764:	591c                	lw	a5,48(a0)
    80207766:	e7b5                	bnez	a5,802077d2 <consoleread+0xdc>
      sleep(&cons.r, &cons.lock);
    80207768:	85ce                	mv	a1,s3
    8020776a:	854a                	mv	a0,s2
    8020776c:	ffffb097          	auipc	ra,0xffffb
    80207770:	b60080e7          	jalr	-1184(ra) # 802022cc <sleep>
    while(cons.r == cons.w){
    80207774:	0984a783          	lw	a5,152(s1)
    80207778:	09c4a703          	lw	a4,156(s1)
    8020777c:	fef700e3          	beq	a4,a5,8020775c <consoleread+0x66>
    c = cons.buf[cons.r++ % INPUT_BUF];
    80207780:	0017871b          	addiw	a4,a5,1
    80207784:	08e4ac23          	sw	a4,152(s1)
    80207788:	07f7f713          	andi	a4,a5,127
    8020778c:	9726                	add	a4,a4,s1
    8020778e:	01874703          	lbu	a4,24(a4)
    80207792:	00070b9b          	sext.w	s7,a4
    if(c == C('D')){  // end-of-file
    80207796:	078b8663          	beq	s7,s8,80207802 <consoleread+0x10c>
    cbuf = c;
    8020779a:	f8e407a3          	sb	a4,-113(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    8020779e:	4685                	li	a3,1
    802077a0:	866a                	mv	a2,s10
    802077a2:	85d6                	mv	a1,s5
    802077a4:	f7843503          	ld	a0,-136(s0)
    802077a8:	ffffb097          	auipc	ra,0xffffb
    802077ac:	d82080e7          	jalr	-638(ra) # 8020252a <either_copyout>
    802077b0:	01950663          	beq	a0,s9,802077bc <consoleread+0xc6>
    dst++;
    802077b4:	0a85                	addi	s5,s5,1
    --n;
    802077b6:	3a7d                	addiw	s4,s4,-1
    if(c == '\n'){
    802077b8:	f9bb9ae3          	bne	s7,s11,8020774c <consoleread+0x56>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    }
  }
  release(&cons.lock);
    802077bc:	00027517          	auipc	a0,0x27
    802077c0:	7c450513          	addi	a0,a0,1988 # 8022ef80 <cons>
    802077c4:	ffff9097          	auipc	ra,0xffff9
    802077c8:	f58080e7          	jalr	-168(ra) # 8020071c <release>

  return target - n;
    802077cc:	414b053b          	subw	a0,s6,s4
    802077d0:	a811                	j	802077e4 <consoleread+0xee>
        release(&cons.lock);
    802077d2:	00027517          	auipc	a0,0x27
    802077d6:	7ae50513          	addi	a0,a0,1966 # 8022ef80 <cons>
    802077da:	ffff9097          	auipc	ra,0xffff9
    802077de:	f42080e7          	jalr	-190(ra) # 8020071c <release>
        return -1;
    802077e2:	557d                	li	a0,-1
}
    802077e4:	60aa                	ld	ra,136(sp)
    802077e6:	640a                	ld	s0,128(sp)
    802077e8:	74e6                	ld	s1,120(sp)
    802077ea:	7946                	ld	s2,112(sp)
    802077ec:	79a6                	ld	s3,104(sp)
    802077ee:	7a06                	ld	s4,96(sp)
    802077f0:	6ae6                	ld	s5,88(sp)
    802077f2:	6b46                	ld	s6,80(sp)
    802077f4:	6ba6                	ld	s7,72(sp)
    802077f6:	6c06                	ld	s8,64(sp)
    802077f8:	7ce2                	ld	s9,56(sp)
    802077fa:	7d42                	ld	s10,48(sp)
    802077fc:	7da2                	ld	s11,40(sp)
    802077fe:	6149                	addi	sp,sp,144
    80207800:	8082                	ret
      if(n < target){
    80207802:	000a071b          	sext.w	a4,s4
    80207806:	fb677be3          	bgeu	a4,s6,802077bc <consoleread+0xc6>
        cons.r--;
    8020780a:	00028717          	auipc	a4,0x28
    8020780e:	80f72723          	sw	a5,-2034(a4) # 8022f018 <cons+0x98>
    80207812:	b76d                	j	802077bc <consoleread+0xc6>

0000000080207814 <consputc>:
void consputc(int c) {
    80207814:	1141                	addi	sp,sp,-16
    80207816:	e422                	sd	s0,8(sp)
    80207818:	0800                	addi	s0,sp,16
  if(c == BACKSPACE){
    8020781a:	10000793          	li	a5,256
    8020781e:	00f50b63          	beq	a0,a5,80207834 <consputc+0x20>
    80207822:	4581                	li	a1,0
    80207824:	4601                	li	a2,0
    80207826:	4681                	li	a3,0
    80207828:	4885                	li	a7,1
    8020782a:	00000073          	ecall
}
    8020782e:	6422                	ld	s0,8(sp)
    80207830:	0141                	addi	sp,sp,16
    80207832:	8082                	ret
    80207834:	4521                	li	a0,8
    80207836:	4581                	li	a1,0
    80207838:	4601                	li	a2,0
    8020783a:	4681                	li	a3,0
    8020783c:	4885                	li	a7,1
    8020783e:	00000073          	ecall
    80207842:	02000513          	li	a0,32
    80207846:	00000073          	ecall
    8020784a:	4521                	li	a0,8
    8020784c:	00000073          	ecall
}
    80207850:	bff9                	j	8020782e <consputc+0x1a>

0000000080207852 <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    80207852:	1101                	addi	sp,sp,-32
    80207854:	ec06                	sd	ra,24(sp)
    80207856:	e822                	sd	s0,16(sp)
    80207858:	e426                	sd	s1,8(sp)
    8020785a:	e04a                	sd	s2,0(sp)
    8020785c:	1000                	addi	s0,sp,32
    8020785e:	84aa                	mv	s1,a0
  acquire(&cons.lock);
    80207860:	00027517          	auipc	a0,0x27
    80207864:	72050513          	addi	a0,a0,1824 # 8022ef80 <cons>
    80207868:	ffff9097          	auipc	ra,0xffff9
    8020786c:	e60080e7          	jalr	-416(ra) # 802006c8 <acquire>

  switch(c){
    80207870:	47d5                	li	a5,21
    80207872:	0af48663          	beq	s1,a5,8020791e <consoleintr+0xcc>
    80207876:	0297ca63          	blt	a5,s1,802078aa <consoleintr+0x58>
    8020787a:	47a1                	li	a5,8
    8020787c:	0ef48763          	beq	s1,a5,8020796a <consoleintr+0x118>
    80207880:	47c1                	li	a5,16
    80207882:	10f49a63          	bne	s1,a5,80207996 <consoleintr+0x144>
  case C('P'):  // Print process list.
    procdump();
    80207886:	ffffb097          	auipc	ra,0xffffb
    8020788a:	d0e080e7          	jalr	-754(ra) # 80202594 <procdump>
      }
    }
    break;
  }
  
  release(&cons.lock);
    8020788e:	00027517          	auipc	a0,0x27
    80207892:	6f250513          	addi	a0,a0,1778 # 8022ef80 <cons>
    80207896:	ffff9097          	auipc	ra,0xffff9
    8020789a:	e86080e7          	jalr	-378(ra) # 8020071c <release>
}
    8020789e:	60e2                	ld	ra,24(sp)
    802078a0:	6442                	ld	s0,16(sp)
    802078a2:	64a2                	ld	s1,8(sp)
    802078a4:	6902                	ld	s2,0(sp)
    802078a6:	6105                	addi	sp,sp,32
    802078a8:	8082                	ret
  switch(c){
    802078aa:	07f00793          	li	a5,127
    802078ae:	0af48e63          	beq	s1,a5,8020796a <consoleintr+0x118>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    802078b2:	00027717          	auipc	a4,0x27
    802078b6:	6ce70713          	addi	a4,a4,1742 # 8022ef80 <cons>
    802078ba:	0a072783          	lw	a5,160(a4)
    802078be:	09872703          	lw	a4,152(a4)
    802078c2:	9f99                	subw	a5,a5,a4
    802078c4:	07f00713          	li	a4,127
    802078c8:	fcf763e3          	bltu	a4,a5,8020788e <consoleintr+0x3c>
      c = (c == '\r') ? '\n' : c;
    802078cc:	47b5                	li	a5,13
    802078ce:	0cf48763          	beq	s1,a5,8020799c <consoleintr+0x14a>
      consputc(c);
    802078d2:	8526                	mv	a0,s1
    802078d4:	00000097          	auipc	ra,0x0
    802078d8:	f40080e7          	jalr	-192(ra) # 80207814 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    802078dc:	00027797          	auipc	a5,0x27
    802078e0:	6a478793          	addi	a5,a5,1700 # 8022ef80 <cons>
    802078e4:	0a07a703          	lw	a4,160(a5)
    802078e8:	0017069b          	addiw	a3,a4,1
    802078ec:	0006861b          	sext.w	a2,a3
    802078f0:	0ad7a023          	sw	a3,160(a5)
    802078f4:	07f77713          	andi	a4,a4,127
    802078f8:	97ba                	add	a5,a5,a4
    802078fa:	00978c23          	sb	s1,24(a5)
      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    802078fe:	47a9                	li	a5,10
    80207900:	0cf48563          	beq	s1,a5,802079ca <consoleintr+0x178>
    80207904:	4791                	li	a5,4
    80207906:	0cf48263          	beq	s1,a5,802079ca <consoleintr+0x178>
    8020790a:	00027797          	auipc	a5,0x27
    8020790e:	70e7a783          	lw	a5,1806(a5) # 8022f018 <cons+0x98>
    80207912:	0807879b          	addiw	a5,a5,128
    80207916:	f6f61ce3          	bne	a2,a5,8020788e <consoleintr+0x3c>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    8020791a:	863e                	mv	a2,a5
    8020791c:	a07d                	j	802079ca <consoleintr+0x178>
    while(cons.e != cons.w &&
    8020791e:	00027717          	auipc	a4,0x27
    80207922:	66270713          	addi	a4,a4,1634 # 8022ef80 <cons>
    80207926:	0a072783          	lw	a5,160(a4)
    8020792a:	09c72703          	lw	a4,156(a4)
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    8020792e:	00027497          	auipc	s1,0x27
    80207932:	65248493          	addi	s1,s1,1618 # 8022ef80 <cons>
    while(cons.e != cons.w &&
    80207936:	4929                	li	s2,10
    80207938:	f4f70be3          	beq	a4,a5,8020788e <consoleintr+0x3c>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    8020793c:	37fd                	addiw	a5,a5,-1
    8020793e:	07f7f713          	andi	a4,a5,127
    80207942:	9726                	add	a4,a4,s1
    while(cons.e != cons.w &&
    80207944:	01874703          	lbu	a4,24(a4)
    80207948:	f52703e3          	beq	a4,s2,8020788e <consoleintr+0x3c>
      cons.e--;
    8020794c:	0af4a023          	sw	a5,160(s1)
      consputc(BACKSPACE);
    80207950:	10000513          	li	a0,256
    80207954:	00000097          	auipc	ra,0x0
    80207958:	ec0080e7          	jalr	-320(ra) # 80207814 <consputc>
    while(cons.e != cons.w &&
    8020795c:	0a04a783          	lw	a5,160(s1)
    80207960:	09c4a703          	lw	a4,156(s1)
    80207964:	fcf71ce3          	bne	a4,a5,8020793c <consoleintr+0xea>
    80207968:	b71d                	j	8020788e <consoleintr+0x3c>
    if(cons.e != cons.w){
    8020796a:	00027717          	auipc	a4,0x27
    8020796e:	61670713          	addi	a4,a4,1558 # 8022ef80 <cons>
    80207972:	0a072783          	lw	a5,160(a4)
    80207976:	09c72703          	lw	a4,156(a4)
    8020797a:	f0f70ae3          	beq	a4,a5,8020788e <consoleintr+0x3c>
      cons.e--;
    8020797e:	37fd                	addiw	a5,a5,-1
    80207980:	00027717          	auipc	a4,0x27
    80207984:	6af72023          	sw	a5,1696(a4) # 8022f020 <cons+0xa0>
      consputc(BACKSPACE);
    80207988:	10000513          	li	a0,256
    8020798c:	00000097          	auipc	ra,0x0
    80207990:	e88080e7          	jalr	-376(ra) # 80207814 <consputc>
    80207994:	bded                	j	8020788e <consoleintr+0x3c>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80207996:	ee048ce3          	beqz	s1,8020788e <consoleintr+0x3c>
    8020799a:	bf21                	j	802078b2 <consoleintr+0x60>
      consputc(c);
    8020799c:	4529                	li	a0,10
    8020799e:	00000097          	auipc	ra,0x0
    802079a2:	e76080e7          	jalr	-394(ra) # 80207814 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    802079a6:	00027797          	auipc	a5,0x27
    802079aa:	5da78793          	addi	a5,a5,1498 # 8022ef80 <cons>
    802079ae:	0a07a703          	lw	a4,160(a5)
    802079b2:	0017069b          	addiw	a3,a4,1
    802079b6:	0006861b          	sext.w	a2,a3
    802079ba:	0ad7a023          	sw	a3,160(a5)
    802079be:	07f77713          	andi	a4,a4,127
    802079c2:	97ba                	add	a5,a5,a4
    802079c4:	4729                	li	a4,10
    802079c6:	00e78c23          	sb	a4,24(a5)
        cons.w = cons.e;
    802079ca:	00027797          	auipc	a5,0x27
    802079ce:	64c7a923          	sw	a2,1618(a5) # 8022f01c <cons+0x9c>
        wakeup(&cons.r);
    802079d2:	00027517          	auipc	a0,0x27
    802079d6:	64650513          	addi	a0,a0,1606 # 8022f018 <cons+0x98>
    802079da:	ffffb097          	auipc	ra,0xffffb
    802079de:	a74080e7          	jalr	-1420(ra) # 8020244e <wakeup>
    802079e2:	b575                	j	8020788e <consoleintr+0x3c>

00000000802079e4 <consoleinit>:

void
consoleinit(void)
{
    802079e4:	1101                	addi	sp,sp,-32
    802079e6:	ec06                	sd	ra,24(sp)
    802079e8:	e822                	sd	s0,16(sp)
    802079ea:	e426                	sd	s1,8(sp)
    802079ec:	1000                	addi	s0,sp,32
  initlock(&cons.lock, "cons");
    802079ee:	00027497          	auipc	s1,0x27
    802079f2:	59248493          	addi	s1,s1,1426 # 8022ef80 <cons>
    802079f6:	00002597          	auipc	a1,0x2
    802079fa:	3ba58593          	addi	a1,a1,954 # 80209db0 <digits+0xa30>
    802079fe:	8526                	mv	a0,s1
    80207a00:	ffff9097          	auipc	ra,0xffff9
    80207a04:	c84080e7          	jalr	-892(ra) # 80200684 <initlock>

  cons.e = cons.w = cons.r = 0;
    80207a08:	0804ac23          	sw	zero,152(s1)
    80207a0c:	0804ae23          	sw	zero,156(s1)
    80207a10:	0a04a023          	sw	zero,160(s1)
  
  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    80207a14:	00004797          	auipc	a5,0x4
    80207a18:	6f47b783          	ld	a5,1780(a5) # 8020c108 <_GLOBAL_OFFSET_TABLE_+0x58>
    80207a1c:	00000717          	auipc	a4,0x0
    80207a20:	cda70713          	addi	a4,a4,-806 # 802076f6 <consoleread>
    80207a24:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    80207a26:	00000717          	auipc	a4,0x0
    80207a2a:	c4470713          	addi	a4,a4,-956 # 8020766a <consolewrite>
    80207a2e:	ef98                	sd	a4,24(a5)
}
    80207a30:	60e2                	ld	ra,24(sp)
    80207a32:	6442                	ld	s0,16(sp)
    80207a34:	64a2                	ld	s1,8(sp)
    80207a36:	6105                	addi	sp,sp,32
    80207a38:	8082                	ret

0000000080207a3a <free_desc>:
}

// mark a descriptor as free.
static void
free_desc(int i)
{
    80207a3a:	1141                	addi	sp,sp,-16
    80207a3c:	e406                	sd	ra,8(sp)
    80207a3e:	e022                	sd	s0,0(sp)
    80207a40:	0800                	addi	s0,sp,16
  if(i >= NUM)
    80207a42:	479d                	li	a5,7
    80207a44:	04a7cc63          	blt	a5,a0,80207a9c <free_desc+0x62>
    panic("virtio_disk_intr 1");
  if(disk.free[i])
    80207a48:	00028797          	auipc	a5,0x28
    80207a4c:	5b878793          	addi	a5,a5,1464 # 80230000 <disk>
    80207a50:	00a78733          	add	a4,a5,a0
    80207a54:	6789                	lui	a5,0x2
    80207a56:	97ba                	add	a5,a5,a4
    80207a58:	0187c783          	lbu	a5,24(a5) # 2018 <_entry-0x801fdfe8>
    80207a5c:	eba1                	bnez	a5,80207aac <free_desc+0x72>
    panic("virtio_disk_intr 2");
  disk.desc[i].addr = 0;
    80207a5e:	00451713          	slli	a4,a0,0x4
    80207a62:	0002a797          	auipc	a5,0x2a
    80207a66:	59e7b783          	ld	a5,1438(a5) # 80232000 <disk+0x2000>
    80207a6a:	97ba                	add	a5,a5,a4
    80207a6c:	0007b023          	sd	zero,0(a5)
  disk.free[i] = 1;
    80207a70:	00028797          	auipc	a5,0x28
    80207a74:	59078793          	addi	a5,a5,1424 # 80230000 <disk>
    80207a78:	97aa                	add	a5,a5,a0
    80207a7a:	6509                	lui	a0,0x2
    80207a7c:	953e                	add	a0,a0,a5
    80207a7e:	4785                	li	a5,1
    80207a80:	00f50c23          	sb	a5,24(a0) # 2018 <_entry-0x801fdfe8>
  wakeup(&disk.free[0]);
    80207a84:	0002a517          	auipc	a0,0x2a
    80207a88:	59450513          	addi	a0,a0,1428 # 80232018 <disk+0x2018>
    80207a8c:	ffffb097          	auipc	ra,0xffffb
    80207a90:	9c2080e7          	jalr	-1598(ra) # 8020244e <wakeup>
}
    80207a94:	60a2                	ld	ra,8(sp)
    80207a96:	6402                	ld	s0,0(sp)
    80207a98:	0141                	addi	sp,sp,16
    80207a9a:	8082                	ret
    panic("virtio_disk_intr 1");
    80207a9c:	00002517          	auipc	a0,0x2
    80207aa0:	31c50513          	addi	a0,a0,796 # 80209db8 <digits+0xa38>
    80207aa4:	ffff8097          	auipc	ra,0xffff8
    80207aa8:	69e080e7          	jalr	1694(ra) # 80200142 <panic>
    panic("virtio_disk_intr 2");
    80207aac:	00002517          	auipc	a0,0x2
    80207ab0:	32450513          	addi	a0,a0,804 # 80209dd0 <digits+0xa50>
    80207ab4:	ffff8097          	auipc	ra,0xffff8
    80207ab8:	68e080e7          	jalr	1678(ra) # 80200142 <panic>

0000000080207abc <virtio_disk_init>:
{
    80207abc:	1141                	addi	sp,sp,-16
    80207abe:	e406                	sd	ra,8(sp)
    80207ac0:	e022                	sd	s0,0(sp)
    80207ac2:	0800                	addi	s0,sp,16
  initlock(&disk.vdisk_lock, "virtio_disk");
    80207ac4:	00002597          	auipc	a1,0x2
    80207ac8:	32458593          	addi	a1,a1,804 # 80209de8 <digits+0xa68>
    80207acc:	0002a517          	auipc	a0,0x2a
    80207ad0:	5dc50513          	addi	a0,a0,1500 # 802320a8 <disk+0x20a8>
    80207ad4:	ffff9097          	auipc	ra,0xffff9
    80207ad8:	bb0080e7          	jalr	-1104(ra) # 80200684 <initlock>
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80207adc:	03f107b7          	lui	a5,0x3f10
    80207ae0:	0785                	addi	a5,a5,1
    80207ae2:	07b2                	slli	a5,a5,0xc
    80207ae4:	4398                	lw	a4,0(a5)
    80207ae6:	2701                	sext.w	a4,a4
    80207ae8:	747277b7          	lui	a5,0x74727
    80207aec:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xbad968a>
    80207af0:	12f71263          	bne	a4,a5,80207c14 <virtio_disk_init+0x158>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80207af4:	00002797          	auipc	a5,0x2
    80207af8:	37c7b783          	ld	a5,892(a5) # 80209e70 <digits+0xaf0>
    80207afc:	439c                	lw	a5,0(a5)
    80207afe:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80207b00:	4705                	li	a4,1
    80207b02:	10e79963          	bne	a5,a4,80207c14 <virtio_disk_init+0x158>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80207b06:	00002797          	auipc	a5,0x2
    80207b0a:	3727b783          	ld	a5,882(a5) # 80209e78 <digits+0xaf8>
    80207b0e:	439c                	lw	a5,0(a5)
    80207b10:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80207b12:	4709                	li	a4,2
    80207b14:	10e79063          	bne	a5,a4,80207c14 <virtio_disk_init+0x158>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80207b18:	00002797          	auipc	a5,0x2
    80207b1c:	3687b783          	ld	a5,872(a5) # 80209e80 <digits+0xb00>
    80207b20:	4398                	lw	a4,0(a5)
    80207b22:	2701                	sext.w	a4,a4
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80207b24:	554d47b7          	lui	a5,0x554d4
    80207b28:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ad2baaf>
    80207b2c:	0ef71463          	bne	a4,a5,80207c14 <virtio_disk_init+0x158>
  *R(VIRTIO_MMIO_STATUS) = status;
    80207b30:	00002717          	auipc	a4,0x2
    80207b34:	35873703          	ld	a4,856(a4) # 80209e88 <digits+0xb08>
    80207b38:	4785                	li	a5,1
    80207b3a:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207b3c:	478d                	li	a5,3
    80207b3e:	c31c                	sw	a5,0(a4)
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80207b40:	00002797          	auipc	a5,0x2
    80207b44:	3507b783          	ld	a5,848(a5) # 80209e90 <digits+0xb10>
    80207b48:	4394                	lw	a3,0(a5)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80207b4a:	c7ffe7b7          	lui	a5,0xc7ffe
    80207b4e:	75f78793          	addi	a5,a5,1887 # ffffffffc7ffe75f <ebss_clear+0xffffffff47dcb75f>
    80207b52:	8ff5                	and	a5,a5,a3
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80207b54:	2781                	sext.w	a5,a5
    80207b56:	00002697          	auipc	a3,0x2
    80207b5a:	3426b683          	ld	a3,834(a3) # 80209e98 <digits+0xb18>
    80207b5e:	c29c                	sw	a5,0(a3)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207b60:	47ad                	li	a5,11
    80207b62:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207b64:	47bd                	li	a5,15
    80207b66:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    80207b68:	00002797          	auipc	a5,0x2
    80207b6c:	3387b783          	ld	a5,824(a5) # 80209ea0 <digits+0xb20>
    80207b70:	6705                	lui	a4,0x1
    80207b72:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    80207b74:	00002797          	auipc	a5,0x2
    80207b78:	3347b783          	ld	a5,820(a5) # 80209ea8 <digits+0xb28>
    80207b7c:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    80207b80:	00002797          	auipc	a5,0x2
    80207b84:	3307b783          	ld	a5,816(a5) # 80209eb0 <digits+0xb30>
    80207b88:	439c                	lw	a5,0(a5)
    80207b8a:	2781                	sext.w	a5,a5
  if(max == 0)
    80207b8c:	cfc1                	beqz	a5,80207c24 <virtio_disk_init+0x168>
  if(max < NUM)
    80207b8e:	471d                	li	a4,7
    80207b90:	0af77263          	bgeu	a4,a5,80207c34 <virtio_disk_init+0x178>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    80207b94:	00002797          	auipc	a5,0x2
    80207b98:	3247b783          	ld	a5,804(a5) # 80209eb8 <digits+0xb38>
    80207b9c:	4721                	li	a4,8
    80207b9e:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    80207ba0:	6609                	lui	a2,0x2
    80207ba2:	4581                	li	a1,0
    80207ba4:	00028517          	auipc	a0,0x28
    80207ba8:	45c50513          	addi	a0,a0,1116 # 80230000 <disk>
    80207bac:	ffff9097          	auipc	ra,0xffff9
    80207bb0:	bb8080e7          	jalr	-1096(ra) # 80200764 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    80207bb4:	00028717          	auipc	a4,0x28
    80207bb8:	44c70713          	addi	a4,a4,1100 # 80230000 <disk>
    80207bbc:	00c75793          	srli	a5,a4,0xc
    80207bc0:	2781                	sext.w	a5,a5
    80207bc2:	00002697          	auipc	a3,0x2
    80207bc6:	2fe6b683          	ld	a3,766(a3) # 80209ec0 <digits+0xb40>
    80207bca:	c29c                	sw	a5,0(a3)
  disk.desc = (struct VRingDesc *) disk.pages;
    80207bcc:	0002a797          	auipc	a5,0x2a
    80207bd0:	43478793          	addi	a5,a5,1076 # 80232000 <disk+0x2000>
    80207bd4:	e398                	sd	a4,0(a5)
  disk.avail = (uint16*)(((char*)disk.desc) + NUM*sizeof(struct VRingDesc));
    80207bd6:	00028717          	auipc	a4,0x28
    80207bda:	4aa70713          	addi	a4,a4,1194 # 80230080 <disk+0x80>
    80207bde:	e798                	sd	a4,8(a5)
  disk.used = (struct UsedArea *) (disk.pages + PGSIZE);
    80207be0:	00029717          	auipc	a4,0x29
    80207be4:	42070713          	addi	a4,a4,1056 # 80231000 <disk+0x1000>
    80207be8:	eb98                	sd	a4,16(a5)
    disk.free[i] = 1;
    80207bea:	4705                	li	a4,1
    80207bec:	00e78c23          	sb	a4,24(a5)
    80207bf0:	00e78ca3          	sb	a4,25(a5)
    80207bf4:	00e78d23          	sb	a4,26(a5)
    80207bf8:	00e78da3          	sb	a4,27(a5)
    80207bfc:	00e78e23          	sb	a4,28(a5)
    80207c00:	00e78ea3          	sb	a4,29(a5)
    80207c04:	00e78f23          	sb	a4,30(a5)
    80207c08:	00e78fa3          	sb	a4,31(a5)
}
    80207c0c:	60a2                	ld	ra,8(sp)
    80207c0e:	6402                	ld	s0,0(sp)
    80207c10:	0141                	addi	sp,sp,16
    80207c12:	8082                	ret
    panic("could not find virtio disk");
    80207c14:	00002517          	auipc	a0,0x2
    80207c18:	1e450513          	addi	a0,a0,484 # 80209df8 <digits+0xa78>
    80207c1c:	ffff8097          	auipc	ra,0xffff8
    80207c20:	526080e7          	jalr	1318(ra) # 80200142 <panic>
    panic("virtio disk has no queue 0");
    80207c24:	00002517          	auipc	a0,0x2
    80207c28:	1f450513          	addi	a0,a0,500 # 80209e18 <digits+0xa98>
    80207c2c:	ffff8097          	auipc	ra,0xffff8
    80207c30:	516080e7          	jalr	1302(ra) # 80200142 <panic>
    panic("virtio disk max queue too short");
    80207c34:	00002517          	auipc	a0,0x2
    80207c38:	20450513          	addi	a0,a0,516 # 80209e38 <digits+0xab8>
    80207c3c:	ffff8097          	auipc	ra,0xffff8
    80207c40:	506080e7          	jalr	1286(ra) # 80200142 <panic>

0000000080207c44 <virtio_disk_rw>:
  return 0;
}

void
virtio_disk_rw(struct buf *b, int write)
{
    80207c44:	7119                	addi	sp,sp,-128
    80207c46:	fc86                	sd	ra,120(sp)
    80207c48:	f8a2                	sd	s0,112(sp)
    80207c4a:	f4a6                	sd	s1,104(sp)
    80207c4c:	f0ca                	sd	s2,96(sp)
    80207c4e:	ecce                	sd	s3,88(sp)
    80207c50:	e8d2                	sd	s4,80(sp)
    80207c52:	e4d6                	sd	s5,72(sp)
    80207c54:	e0da                	sd	s6,64(sp)
    80207c56:	fc5e                	sd	s7,56(sp)
    80207c58:	f862                	sd	s8,48(sp)
    80207c5a:	f466                	sd	s9,40(sp)
    80207c5c:	f06a                	sd	s10,32(sp)
    80207c5e:	0100                	addi	s0,sp,128
    80207c60:	892a                	mv	s2,a0
    80207c62:	8cae                	mv	s9,a1
  uint64 sector = b->sectorno;
    80207c64:	00c56d03          	lwu	s10,12(a0)

  acquire(&disk.vdisk_lock);
    80207c68:	0002a517          	auipc	a0,0x2a
    80207c6c:	44050513          	addi	a0,a0,1088 # 802320a8 <disk+0x20a8>
    80207c70:	ffff9097          	auipc	ra,0xffff9
    80207c74:	a58080e7          	jalr	-1448(ra) # 802006c8 <acquire>
  for(int i = 0; i < 3; i++){
    80207c78:	4981                	li	s3,0
  for(int i = 0; i < NUM; i++){
    80207c7a:	4c21                	li	s8,8
      disk.free[i] = 0;
    80207c7c:	00028b97          	auipc	s7,0x28
    80207c80:	384b8b93          	addi	s7,s7,900 # 80230000 <disk>
    80207c84:	6b09                	lui	s6,0x2
  for(int i = 0; i < 3; i++){
    80207c86:	4a8d                	li	s5,3
  for(int i = 0; i < NUM; i++){
    80207c88:	8a4e                	mv	s4,s3
    80207c8a:	a051                	j	80207d0e <virtio_disk_rw+0xca>
      disk.free[i] = 0;
    80207c8c:	00fb86b3          	add	a3,s7,a5
    80207c90:	96da                	add	a3,a3,s6
    80207c92:	00068c23          	sb	zero,24(a3)
    idx[i] = alloc_desc();
    80207c96:	c21c                	sw	a5,0(a2)
    if(idx[i] < 0){
    80207c98:	0207c563          	bltz	a5,80207cc2 <virtio_disk_rw+0x7e>
  for(int i = 0; i < 3; i++){
    80207c9c:	2485                	addiw	s1,s1,1
    80207c9e:	0711                	addi	a4,a4,4
    80207ca0:	25548463          	beq	s1,s5,80207ee8 <virtio_disk_rw+0x2a4>
    idx[i] = alloc_desc();
    80207ca4:	863a                	mv	a2,a4
  for(int i = 0; i < NUM; i++){
    80207ca6:	0002a697          	auipc	a3,0x2a
    80207caa:	37268693          	addi	a3,a3,882 # 80232018 <disk+0x2018>
    80207cae:	87d2                	mv	a5,s4
    if(disk.free[i]){
    80207cb0:	0006c583          	lbu	a1,0(a3)
    80207cb4:	fde1                	bnez	a1,80207c8c <virtio_disk_rw+0x48>
  for(int i = 0; i < NUM; i++){
    80207cb6:	2785                	addiw	a5,a5,1
    80207cb8:	0685                	addi	a3,a3,1
    80207cba:	ff879be3          	bne	a5,s8,80207cb0 <virtio_disk_rw+0x6c>
    idx[i] = alloc_desc();
    80207cbe:	57fd                	li	a5,-1
    80207cc0:	c21c                	sw	a5,0(a2)
      for(int j = 0; j < i; j++)
    80207cc2:	02905a63          	blez	s1,80207cf6 <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    80207cc6:	f9042503          	lw	a0,-112(s0)
    80207cca:	00000097          	auipc	ra,0x0
    80207cce:	d70080e7          	jalr	-656(ra) # 80207a3a <free_desc>
      for(int j = 0; j < i; j++)
    80207cd2:	4785                	li	a5,1
    80207cd4:	0297d163          	bge	a5,s1,80207cf6 <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    80207cd8:	f9442503          	lw	a0,-108(s0)
    80207cdc:	00000097          	auipc	ra,0x0
    80207ce0:	d5e080e7          	jalr	-674(ra) # 80207a3a <free_desc>
      for(int j = 0; j < i; j++)
    80207ce4:	4789                	li	a5,2
    80207ce6:	0097d863          	bge	a5,s1,80207cf6 <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    80207cea:	f9842503          	lw	a0,-104(s0)
    80207cee:	00000097          	auipc	ra,0x0
    80207cf2:	d4c080e7          	jalr	-692(ra) # 80207a3a <free_desc>
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    80207cf6:	0002a597          	auipc	a1,0x2a
    80207cfa:	3b258593          	addi	a1,a1,946 # 802320a8 <disk+0x20a8>
    80207cfe:	0002a517          	auipc	a0,0x2a
    80207d02:	31a50513          	addi	a0,a0,794 # 80232018 <disk+0x2018>
    80207d06:	ffffa097          	auipc	ra,0xffffa
    80207d0a:	5c6080e7          	jalr	1478(ra) # 802022cc <sleep>
  for(int i = 0; i < 3; i++){
    80207d0e:	f9040713          	addi	a4,s0,-112
    80207d12:	84ce                	mv	s1,s3
    80207d14:	bf41                	j	80207ca4 <virtio_disk_rw+0x60>
    uint32 reserved;
    uint64 sector;
  } buf0;

  if(write)
    buf0.type = VIRTIO_BLK_T_OUT; // write the disk
    80207d16:	4785                	li	a5,1
    80207d18:	f8f42023          	sw	a5,-128(s0)
  else
    buf0.type = VIRTIO_BLK_T_IN; // read the disk
  buf0.reserved = 0;
    80207d1c:	f8042223          	sw	zero,-124(s0)
  buf0.sector = sector;
    80207d20:	f9a43423          	sd	s10,-120(s0)

  // buf0 is on a kernel stack, which is not direct mapped,
  // thus the call to kvmpa().
  disk.desc[idx[0]].addr = (uint64) kwalkaddr(myproc()->kpagetable, (uint64) &buf0);
    80207d24:	ffffa097          	auipc	ra,0xffffa
    80207d28:	d34080e7          	jalr	-716(ra) # 80201a58 <myproc>
    80207d2c:	f9042983          	lw	s3,-112(s0)
    80207d30:	00499493          	slli	s1,s3,0x4
    80207d34:	0002aa17          	auipc	s4,0x2a
    80207d38:	2cca0a13          	addi	s4,s4,716 # 80232000 <disk+0x2000>
    80207d3c:	000a3a83          	ld	s5,0(s4)
    80207d40:	9aa6                	add	s5,s5,s1
    80207d42:	f8040593          	addi	a1,s0,-128
    80207d46:	6d28                	ld	a0,88(a0)
    80207d48:	ffff9097          	auipc	ra,0xffff9
    80207d4c:	eb6080e7          	jalr	-330(ra) # 80200bfe <kwalkaddr>
    80207d50:	00aab023          	sd	a0,0(s5)
  disk.desc[idx[0]].len = sizeof(buf0);
    80207d54:	000a3783          	ld	a5,0(s4)
    80207d58:	97a6                	add	a5,a5,s1
    80207d5a:	4741                	li	a4,16
    80207d5c:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80207d5e:	000a3783          	ld	a5,0(s4)
    80207d62:	97a6                	add	a5,a5,s1
    80207d64:	4705                	li	a4,1
    80207d66:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[0]].next = idx[1];
    80207d6a:	f9442703          	lw	a4,-108(s0)
    80207d6e:	000a3783          	ld	a5,0(s4)
    80207d72:	97a6                	add	a5,a5,s1
    80207d74:	00e79723          	sh	a4,14(a5)

  disk.desc[idx[1]].addr = (uint64) b->data;
    80207d78:	0712                	slli	a4,a4,0x4
    80207d7a:	000a3783          	ld	a5,0(s4)
    80207d7e:	97ba                	add	a5,a5,a4
    80207d80:	05890693          	addi	a3,s2,88
    80207d84:	e394                	sd	a3,0(a5)
  disk.desc[idx[1]].len = BSIZE;
    80207d86:	000a3783          	ld	a5,0(s4)
    80207d8a:	97ba                	add	a5,a5,a4
    80207d8c:	20000693          	li	a3,512
    80207d90:	c794                	sw	a3,8(a5)
  if(write)
    80207d92:	100c8c63          	beqz	s9,80207eaa <virtio_disk_rw+0x266>
    disk.desc[idx[1]].flags = 0; // device reads b->data
    80207d96:	0002a797          	auipc	a5,0x2a
    80207d9a:	26a7b783          	ld	a5,618(a5) # 80232000 <disk+0x2000>
    80207d9e:	97ba                	add	a5,a5,a4
    80207da0:	00079623          	sh	zero,12(a5)
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    80207da4:	00028517          	auipc	a0,0x28
    80207da8:	25c50513          	addi	a0,a0,604 # 80230000 <disk>
    80207dac:	0002a797          	auipc	a5,0x2a
    80207db0:	25478793          	addi	a5,a5,596 # 80232000 <disk+0x2000>
    80207db4:	6394                	ld	a3,0(a5)
    80207db6:	96ba                	add	a3,a3,a4
    80207db8:	00c6d603          	lhu	a2,12(a3)
    80207dbc:	00166613          	ori	a2,a2,1
    80207dc0:	00c69623          	sh	a2,12(a3)
  disk.desc[idx[1]].next = idx[2];
    80207dc4:	f9842683          	lw	a3,-104(s0)
    80207dc8:	6390                	ld	a2,0(a5)
    80207dca:	9732                	add	a4,a4,a2
    80207dcc:	00d71723          	sh	a3,14(a4)

  disk.info[idx[0]].status = 0;
    80207dd0:	20098613          	addi	a2,s3,512
    80207dd4:	0612                	slli	a2,a2,0x4
    80207dd6:	962a                	add	a2,a2,a0
    80207dd8:	02060823          	sb	zero,48(a2) # 2030 <_entry-0x801fdfd0>
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    80207ddc:	00469713          	slli	a4,a3,0x4
    80207de0:	6394                	ld	a3,0(a5)
    80207de2:	96ba                	add	a3,a3,a4
    80207de4:	6589                	lui	a1,0x2
    80207de6:	03058593          	addi	a1,a1,48 # 2030 <_entry-0x801fdfd0>
    80207dea:	94ae                	add	s1,s1,a1
    80207dec:	94aa                	add	s1,s1,a0
    80207dee:	e284                	sd	s1,0(a3)
  disk.desc[idx[2]].len = 1;
    80207df0:	6394                	ld	a3,0(a5)
    80207df2:	96ba                	add	a3,a3,a4
    80207df4:	4585                	li	a1,1
    80207df6:	c68c                	sw	a1,8(a3)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80207df8:	6394                	ld	a3,0(a5)
    80207dfa:	96ba                	add	a3,a3,a4
    80207dfc:	4509                	li	a0,2
    80207dfe:	00a69623          	sh	a0,12(a3)
  disk.desc[idx[2]].next = 0;
    80207e02:	6394                	ld	a3,0(a5)
    80207e04:	9736                	add	a4,a4,a3
    80207e06:	00071723          	sh	zero,14(a4)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    80207e0a:	00b92223          	sw	a1,4(s2)
  disk.info[idx[0]].b = b;
    80207e0e:	03263423          	sd	s2,40(a2)

  // avail[0] is flags
  // avail[1] tells the device how far to look in avail[2...].
  // avail[2...] are desc[] indices the device should process.
  // we only tell device the first index in our chain of descriptors.
  disk.avail[2 + (disk.avail[1] % NUM)] = idx[0];
    80207e12:	6794                	ld	a3,8(a5)
    80207e14:	0026d703          	lhu	a4,2(a3)
    80207e18:	8b1d                	andi	a4,a4,7
    80207e1a:	2709                	addiw	a4,a4,2
    80207e1c:	0706                	slli	a4,a4,0x1
    80207e1e:	9736                	add	a4,a4,a3
    80207e20:	01371023          	sh	s3,0(a4)
  __sync_synchronize();
    80207e24:	0ff0000f          	fence
  disk.avail[1] = disk.avail[1] + 1;
    80207e28:	6798                	ld	a4,8(a5)
    80207e2a:	00275783          	lhu	a5,2(a4)
    80207e2e:	2785                	addiw	a5,a5,1
    80207e30:	00f71123          	sh	a5,2(a4)

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    80207e34:	00002797          	auipc	a5,0x2
    80207e38:	0947b783          	ld	a5,148(a5) # 80209ec8 <digits+0xb48>
    80207e3c:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    80207e40:	00492703          	lw	a4,4(s2)
    80207e44:	4785                	li	a5,1
    80207e46:	02f71163          	bne	a4,a5,80207e68 <virtio_disk_rw+0x224>
    sleep(b, &disk.vdisk_lock);
    80207e4a:	0002a997          	auipc	s3,0x2a
    80207e4e:	25e98993          	addi	s3,s3,606 # 802320a8 <disk+0x20a8>
  while(b->disk == 1) {
    80207e52:	4485                	li	s1,1
    sleep(b, &disk.vdisk_lock);
    80207e54:	85ce                	mv	a1,s3
    80207e56:	854a                	mv	a0,s2
    80207e58:	ffffa097          	auipc	ra,0xffffa
    80207e5c:	474080e7          	jalr	1140(ra) # 802022cc <sleep>
  while(b->disk == 1) {
    80207e60:	00492783          	lw	a5,4(s2)
    80207e64:	fe9788e3          	beq	a5,s1,80207e54 <virtio_disk_rw+0x210>
  }

  disk.info[idx[0]].b = 0;
    80207e68:	f9042483          	lw	s1,-112(s0)
    80207e6c:	20048793          	addi	a5,s1,512
    80207e70:	00479713          	slli	a4,a5,0x4
    80207e74:	00028797          	auipc	a5,0x28
    80207e78:	18c78793          	addi	a5,a5,396 # 80230000 <disk>
    80207e7c:	97ba                	add	a5,a5,a4
    80207e7e:	0207b423          	sd	zero,40(a5)
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    80207e82:	0002a917          	auipc	s2,0x2a
    80207e86:	17e90913          	addi	s2,s2,382 # 80232000 <disk+0x2000>
    free_desc(i);
    80207e8a:	8526                	mv	a0,s1
    80207e8c:	00000097          	auipc	ra,0x0
    80207e90:	bae080e7          	jalr	-1106(ra) # 80207a3a <free_desc>
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    80207e94:	0492                	slli	s1,s1,0x4
    80207e96:	00093783          	ld	a5,0(s2)
    80207e9a:	94be                	add	s1,s1,a5
    80207e9c:	00c4d783          	lhu	a5,12(s1)
    80207ea0:	8b85                	andi	a5,a5,1
    80207ea2:	cf89                	beqz	a5,80207ebc <virtio_disk_rw+0x278>
      i = disk.desc[i].next;
    80207ea4:	00e4d483          	lhu	s1,14(s1)
    free_desc(i);
    80207ea8:	b7cd                	j	80207e8a <virtio_disk_rw+0x246>
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80207eaa:	0002a797          	auipc	a5,0x2a
    80207eae:	1567b783          	ld	a5,342(a5) # 80232000 <disk+0x2000>
    80207eb2:	97ba                	add	a5,a5,a4
    80207eb4:	4689                	li	a3,2
    80207eb6:	00d79623          	sh	a3,12(a5)
    80207eba:	b5ed                	j	80207da4 <virtio_disk_rw+0x160>
  free_chain(idx[0]);

  release(&disk.vdisk_lock);
    80207ebc:	0002a517          	auipc	a0,0x2a
    80207ec0:	1ec50513          	addi	a0,a0,492 # 802320a8 <disk+0x20a8>
    80207ec4:	ffff9097          	auipc	ra,0xffff9
    80207ec8:	858080e7          	jalr	-1960(ra) # 8020071c <release>
}
    80207ecc:	70e6                	ld	ra,120(sp)
    80207ece:	7446                	ld	s0,112(sp)
    80207ed0:	74a6                	ld	s1,104(sp)
    80207ed2:	7906                	ld	s2,96(sp)
    80207ed4:	69e6                	ld	s3,88(sp)
    80207ed6:	6a46                	ld	s4,80(sp)
    80207ed8:	6aa6                	ld	s5,72(sp)
    80207eda:	6b06                	ld	s6,64(sp)
    80207edc:	7be2                	ld	s7,56(sp)
    80207ede:	7c42                	ld	s8,48(sp)
    80207ee0:	7ca2                	ld	s9,40(sp)
    80207ee2:	7d02                	ld	s10,32(sp)
    80207ee4:	6109                	addi	sp,sp,128
    80207ee6:	8082                	ret
  if(write)
    80207ee8:	e20c97e3          	bnez	s9,80207d16 <virtio_disk_rw+0xd2>
    buf0.type = VIRTIO_BLK_T_IN; // read the disk
    80207eec:	f8042023          	sw	zero,-128(s0)
    80207ef0:	b535                	j	80207d1c <virtio_disk_rw+0xd8>

0000000080207ef2 <virtio_disk_intr>:

void
virtio_disk_intr()
{
    80207ef2:	1101                	addi	sp,sp,-32
    80207ef4:	ec06                	sd	ra,24(sp)
    80207ef6:	e822                	sd	s0,16(sp)
    80207ef8:	e426                	sd	s1,8(sp)
    80207efa:	e04a                	sd	s2,0(sp)
    80207efc:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    80207efe:	0002a517          	auipc	a0,0x2a
    80207f02:	1aa50513          	addi	a0,a0,426 # 802320a8 <disk+0x20a8>
    80207f06:	ffff8097          	auipc	ra,0xffff8
    80207f0a:	7c2080e7          	jalr	1986(ra) # 802006c8 <acquire>

  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    80207f0e:	0002a717          	auipc	a4,0x2a
    80207f12:	0f270713          	addi	a4,a4,242 # 80232000 <disk+0x2000>
    80207f16:	02075783          	lhu	a5,32(a4)
    80207f1a:	6b18                	ld	a4,16(a4)
    80207f1c:	00275683          	lhu	a3,2(a4)
    80207f20:	8ebd                	xor	a3,a3,a5
    80207f22:	8a9d                	andi	a3,a3,7
    80207f24:	cab9                	beqz	a3,80207f7a <virtio_disk_intr+0x88>
    int id = disk.used->elems[disk.used_idx].id;

    if(disk.info[id].status != 0)
    80207f26:	00028917          	auipc	s2,0x28
    80207f2a:	0da90913          	addi	s2,s2,218 # 80230000 <disk>
      panic("virtio_disk_intr status");
    
    disk.info[id].b->disk = 0;   // disk is done with buf
    wakeup(disk.info[id].b);

    disk.used_idx = (disk.used_idx + 1) % NUM;
    80207f2e:	0002a497          	auipc	s1,0x2a
    80207f32:	0d248493          	addi	s1,s1,210 # 80232000 <disk+0x2000>
    int id = disk.used->elems[disk.used_idx].id;
    80207f36:	078e                	slli	a5,a5,0x3
    80207f38:	97ba                	add	a5,a5,a4
    80207f3a:	43dc                	lw	a5,4(a5)
    if(disk.info[id].status != 0)
    80207f3c:	20078713          	addi	a4,a5,512
    80207f40:	0712                	slli	a4,a4,0x4
    80207f42:	974a                	add	a4,a4,s2
    80207f44:	03074703          	lbu	a4,48(a4)
    80207f48:	e335                	bnez	a4,80207fac <virtio_disk_intr+0xba>
    disk.info[id].b->disk = 0;   // disk is done with buf
    80207f4a:	20078793          	addi	a5,a5,512
    80207f4e:	0792                	slli	a5,a5,0x4
    80207f50:	97ca                	add	a5,a5,s2
    80207f52:	7798                	ld	a4,40(a5)
    80207f54:	00072223          	sw	zero,4(a4)
    wakeup(disk.info[id].b);
    80207f58:	7788                	ld	a0,40(a5)
    80207f5a:	ffffa097          	auipc	ra,0xffffa
    80207f5e:	4f4080e7          	jalr	1268(ra) # 8020244e <wakeup>
    disk.used_idx = (disk.used_idx + 1) % NUM;
    80207f62:	0204d783          	lhu	a5,32(s1)
    80207f66:	2785                	addiw	a5,a5,1
    80207f68:	8b9d                	andi	a5,a5,7
    80207f6a:	02f49023          	sh	a5,32(s1)
  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    80207f6e:	6898                	ld	a4,16(s1)
    80207f70:	00275683          	lhu	a3,2(a4)
    80207f74:	8a9d                	andi	a3,a3,7
    80207f76:	fcf690e3          	bne	a3,a5,80207f36 <virtio_disk_intr+0x44>
  }
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    80207f7a:	00002797          	auipc	a5,0x2
    80207f7e:	f567b783          	ld	a5,-170(a5) # 80209ed0 <digits+0xb50>
    80207f82:	439c                	lw	a5,0(a5)
    80207f84:	8b8d                	andi	a5,a5,3
    80207f86:	00002717          	auipc	a4,0x2
    80207f8a:	f5273703          	ld	a4,-174(a4) # 80209ed8 <digits+0xb58>
    80207f8e:	c31c                	sw	a5,0(a4)

  release(&disk.vdisk_lock);
    80207f90:	0002a517          	auipc	a0,0x2a
    80207f94:	11850513          	addi	a0,a0,280 # 802320a8 <disk+0x20a8>
    80207f98:	ffff8097          	auipc	ra,0xffff8
    80207f9c:	784080e7          	jalr	1924(ra) # 8020071c <release>
}
    80207fa0:	60e2                	ld	ra,24(sp)
    80207fa2:	6442                	ld	s0,16(sp)
    80207fa4:	64a2                	ld	s1,8(sp)
    80207fa6:	6902                	ld	s2,0(sp)
    80207fa8:	6105                	addi	sp,sp,32
    80207faa:	8082                	ret
      panic("virtio_disk_intr status");
    80207fac:	00002517          	auipc	a0,0x2
    80207fb0:	eac50513          	addi	a0,a0,-340 # 80209e58 <digits+0xad8>
    80207fb4:	ffff8097          	auipc	ra,0xffff8
    80207fb8:	18e080e7          	jalr	398(ra) # 80200142 <panic>
	...

0000000080208000 <_trampoline>:
    80208000:	14051573          	csrrw	a0,sscratch,a0
    80208004:	02153423          	sd	ra,40(a0)
    80208008:	02253823          	sd	sp,48(a0)
    8020800c:	02353c23          	sd	gp,56(a0)
    80208010:	04453023          	sd	tp,64(a0)
    80208014:	04553423          	sd	t0,72(a0)
    80208018:	04653823          	sd	t1,80(a0)
    8020801c:	04753c23          	sd	t2,88(a0)
    80208020:	f120                	sd	s0,96(a0)
    80208022:	f524                	sd	s1,104(a0)
    80208024:	fd2c                	sd	a1,120(a0)
    80208026:	e150                	sd	a2,128(a0)
    80208028:	e554                	sd	a3,136(a0)
    8020802a:	e958                	sd	a4,144(a0)
    8020802c:	ed5c                	sd	a5,152(a0)
    8020802e:	0b053023          	sd	a6,160(a0)
    80208032:	0b153423          	sd	a7,168(a0)
    80208036:	0b253823          	sd	s2,176(a0)
    8020803a:	0b353c23          	sd	s3,184(a0)
    8020803e:	0d453023          	sd	s4,192(a0)
    80208042:	0d553423          	sd	s5,200(a0)
    80208046:	0d653823          	sd	s6,208(a0)
    8020804a:	0d753c23          	sd	s7,216(a0)
    8020804e:	0f853023          	sd	s8,224(a0)
    80208052:	0f953423          	sd	s9,232(a0)
    80208056:	0fa53823          	sd	s10,240(a0)
    8020805a:	0fb53c23          	sd	s11,248(a0)
    8020805e:	11c53023          	sd	t3,256(a0)
    80208062:	11d53423          	sd	t4,264(a0)
    80208066:	11e53823          	sd	t5,272(a0)
    8020806a:	11f53c23          	sd	t6,280(a0)
    8020806e:	140022f3          	csrr	t0,sscratch
    80208072:	06553823          	sd	t0,112(a0)
    80208076:	00853103          	ld	sp,8(a0)
    8020807a:	02053203          	ld	tp,32(a0)
    8020807e:	01053283          	ld	t0,16(a0)
    80208082:	00053303          	ld	t1,0(a0)
    80208086:	18031073          	csrw	satp,t1
    8020808a:	12000073          	sfence.vma
    8020808e:	8282                	jr	t0

0000000080208090 <userret>:
    80208090:	18059073          	csrw	satp,a1
    80208094:	12000073          	sfence.vma
    80208098:	07053283          	ld	t0,112(a0)
    8020809c:	14029073          	csrw	sscratch,t0
    802080a0:	02853083          	ld	ra,40(a0)
    802080a4:	03053103          	ld	sp,48(a0)
    802080a8:	03853183          	ld	gp,56(a0)
    802080ac:	04053203          	ld	tp,64(a0)
    802080b0:	04853283          	ld	t0,72(a0)
    802080b4:	05053303          	ld	t1,80(a0)
    802080b8:	05853383          	ld	t2,88(a0)
    802080bc:	7120                	ld	s0,96(a0)
    802080be:	7524                	ld	s1,104(a0)
    802080c0:	7d2c                	ld	a1,120(a0)
    802080c2:	6150                	ld	a2,128(a0)
    802080c4:	6554                	ld	a3,136(a0)
    802080c6:	6958                	ld	a4,144(a0)
    802080c8:	6d5c                	ld	a5,152(a0)
    802080ca:	0a053803          	ld	a6,160(a0)
    802080ce:	0a853883          	ld	a7,168(a0)
    802080d2:	0b053903          	ld	s2,176(a0)
    802080d6:	0b853983          	ld	s3,184(a0)
    802080da:	0c053a03          	ld	s4,192(a0)
    802080de:	0c853a83          	ld	s5,200(a0)
    802080e2:	0d053b03          	ld	s6,208(a0)
    802080e6:	0d853b83          	ld	s7,216(a0)
    802080ea:	0e053c03          	ld	s8,224(a0)
    802080ee:	0e853c83          	ld	s9,232(a0)
    802080f2:	0f053d03          	ld	s10,240(a0)
    802080f6:	0f853d83          	ld	s11,248(a0)
    802080fa:	10053e03          	ld	t3,256(a0)
    802080fe:	10853e83          	ld	t4,264(a0)
    80208102:	11053f03          	ld	t5,272(a0)
    80208106:	11853f83          	ld	t6,280(a0)
    8020810a:	14051573          	csrrw	a0,sscratch,a0
    8020810e:	10200073          	sret
	...
