
kernel-qemu:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_entry>:
    80200000:	00150293          	addi	t0,a0,1
    80200004:	02ba                	slli	t0,t0,0xe
    80200006:	0000e117          	auipc	sp,0xe
    8020000a:	10213103          	ld	sp,258(sp) # 8020e108 <_GLOBAL_OFFSET_TABLE_+0x58>
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
    80200098:	042080e7          	jalr	66(ra) # 802080d6 <consputc>
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
    802000ce:	00c080e7          	jalr	12(ra) # 802080d6 <consputc>
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
    80200182:	00017717          	auipc	a4,0x17
    80200186:	e6f72f23          	sw	a5,-386(a4) # 80217000 <panicked>
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
    802001be:	00017d97          	auipc	s11,0x17
    802001c2:	e62dad83          	lw	s11,-414(s11) # 80217020 <pr+0x18>
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
    802001fc:	00017517          	auipc	a0,0x17
    80200200:	e0c50513          	addi	a0,a0,-500 # 80217008 <pr>
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
    80200222:	eb8080e7          	jalr	-328(ra) # 802080d6 <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80200226:	2485                	addiw	s1,s1,1
    80200228:	009a07b3          	add	a5,s4,s1
    8020022c:	0007c503          	lbu	a0,0(a5) # fffffffffffff000 <kernel_end+0xffffffff7fdc0000>
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
    802002b0:	00008097          	auipc	ra,0x8
    802002b4:	e26080e7          	jalr	-474(ra) # 802080d6 <consputc>
  consputc('x');
    802002b8:	07800513          	li	a0,120
    802002bc:	00008097          	auipc	ra,0x8
    802002c0:	e1a080e7          	jalr	-486(ra) # 802080d6 <consputc>
    802002c4:	896a                	mv	s2,s10
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802002c6:	03c9d793          	srli	a5,s3,0x3c
    802002ca:	97de                	add	a5,a5,s7
    802002cc:	0007c503          	lbu	a0,0(a5)
    802002d0:	00008097          	auipc	ra,0x8
    802002d4:	e06080e7          	jalr	-506(ra) # 802080d6 <consputc>
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
    802002fc:	00008097          	auipc	ra,0x8
    80200300:	dda080e7          	jalr	-550(ra) # 802080d6 <consputc>
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
    8020031e:	00008097          	auipc	ra,0x8
    80200322:	db8080e7          	jalr	-584(ra) # 802080d6 <consputc>
      break;
    80200326:	b701                	j	80200226 <printf+0x9a>
      consputc('%');
    80200328:	8556                	mv	a0,s5
    8020032a:	00008097          	auipc	ra,0x8
    8020032e:	dac080e7          	jalr	-596(ra) # 802080d6 <consputc>
      consputc(c);
    80200332:	854a                	mv	a0,s2
    80200334:	00008097          	auipc	ra,0x8
    80200338:	da2080e7          	jalr	-606(ra) # 802080d6 <consputc>
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
    80200360:	00017517          	auipc	a0,0x17
    80200364:	ca850513          	addi	a0,a0,-856 # 80217008 <pr>
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
    80200382:	00017517          	auipc	a0,0x17
    80200386:	c8650513          	addi	a0,a0,-890 # 80217008 <pr>
    8020038a:	00000097          	auipc	ra,0x0
    8020038e:	2fa080e7          	jalr	762(ra) # 80200684 <initlock>
  pr.locking = 1;   // changed, used to be 1
    80200392:	4785                	li	a5,1
    80200394:	00017717          	auipc	a4,0x17
    80200398:	c8f72623          	sw	a5,-884(a4) # 80217020 <pr+0x18>
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
    80200458:	0000e797          	auipc	a5,0xe
    8020045c:	c887b783          	ld	a5,-888(a5) # 8020e0e0 <_GLOBAL_OFFSET_TABLE_+0x30>
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
    8020047a:	00017917          	auipc	s2,0x17
    8020047e:	bae90913          	addi	s2,s2,-1106 # 80217028 <kmem>
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
    8020051a:	00017497          	auipc	s1,0x17
    8020051e:	b0e48493          	addi	s1,s1,-1266 # 80217028 <kmem>
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
    80200542:	0000e517          	auipc	a0,0xe
    80200546:	b9e53503          	ld	a0,-1122(a0) # 8020e0e0 <_GLOBAL_OFFSET_TABLE_+0x30>
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
    80200566:	00017497          	auipc	s1,0x17
    8020056a:	ac248493          	addi	s1,s1,-1342 # 80217028 <kmem>
    8020056e:	8526                	mv	a0,s1
    80200570:	00000097          	auipc	ra,0x0
    80200574:	158080e7          	jalr	344(ra) # 802006c8 <acquire>
  r = kmem.freelist;
    80200578:	6c84                	ld	s1,24(s1)
  if(r) {
    8020057a:	c89d                	beqz	s1,802005b0 <kalloc+0x54>
    kmem.freelist = r->next;
    8020057c:	609c                	ld	a5,0(s1)
    8020057e:	00017517          	auipc	a0,0x17
    80200582:	aaa50513          	addi	a0,a0,-1366 # 80217028 <kmem>
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
    802005b0:	00017517          	auipc	a0,0x17
    802005b4:	a7850513          	addi	a0,a0,-1416 # 80217028 <kmem>
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
    802005c8:	00017517          	auipc	a0,0x17
    802005cc:	a8053503          	ld	a0,-1408(a0) # 80217048 <kmem+0x20>
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
    802005f4:	454080e7          	jalr	1108(ra) # 80201a44 <mycpu>
    802005f8:	5d3c                	lw	a5,120(a0)
    802005fa:	cf89                	beqz	a5,80200614 <push_off+0x3c>
    mycpu()->intena = old;
  mycpu()->noff += 1;
    802005fc:	00001097          	auipc	ra,0x1
    80200600:	448080e7          	jalr	1096(ra) # 80201a44 <mycpu>
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
    80200618:	430080e7          	jalr	1072(ra) # 80201a44 <mycpu>
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
    80200630:	418080e7          	jalr	1048(ra) # 80201a44 <mycpu>
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
    802006b2:	396080e7          	jalr	918(ra) # 80201a44 <mycpu>
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
    802006fc:	34c080e7          	jalr	844(ra) # 80201a44 <mycpu>
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
    80200a00:	00016717          	auipc	a4,0x16
    80200a04:	65070713          	addi	a4,a4,1616 # 80217050 <started>
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
    80200a20:	fa4080e7          	jalr	-92(ra) # 802029c0 <trapinithart>
    plicinithart();  // ask PLIC for device interrupts
    80200a24:	00007097          	auipc	ra,0x7
    80200a28:	46c080e7          	jalr	1132(ra) # 80207e90 <plicinithart>
    printf("hart 1 init done\n");
    80200a2c:	0000a517          	auipc	a0,0xa
    80200a30:	9c450513          	addi	a0,a0,-1596 # 8020a3f0 <digits+0x70>
    80200a34:	fffff097          	auipc	ra,0xfffff
    80200a38:	758080e7          	jalr	1880(ra) # 8020018c <printf>
  }
  scheduler();
    80200a3c:	00001097          	auipc	ra,0x1
    80200a40:	5d0080e7          	jalr	1488(ra) # 8020200c <scheduler>
    consoleinit();
    80200a44:	00008097          	auipc	ra,0x8
    80200a48:	862080e7          	jalr	-1950(ra) # 802082a6 <consoleinit>
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
    80200a74:	00006097          	auipc	ra,0x6
    80200a78:	98a080e7          	jalr	-1654(ra) # 802063fe <timerinit>
    trapinithart();  // install kernel trap vector, including interrupt handler
    80200a7c:	00002097          	auipc	ra,0x2
    80200a80:	f44080e7          	jalr	-188(ra) # 802029c0 <trapinithart>
    procinit();
    80200a84:	00001097          	auipc	ra,0x1
    80200a88:	f32080e7          	jalr	-206(ra) # 802019b6 <procinit>
    plicinit();
    80200a8c:	00007097          	auipc	ra,0x7
    80200a90:	3ec080e7          	jalr	1004(ra) # 80207e78 <plicinit>
    plicinithart();
    80200a94:	00007097          	auipc	ra,0x7
    80200a98:	3fc080e7          	jalr	1020(ra) # 80207e90 <plicinithart>
    disk_init();
    80200a9c:	00006097          	auipc	ra,0x6
    80200aa0:	9fe080e7          	jalr	-1538(ra) # 8020649a <disk_init>
    binit();         // buffer cache
    80200aa4:	00003097          	auipc	ra,0x3
    80200aa8:	05c080e7          	jalr	92(ra) # 80203b00 <binit>
    fileinit();      // file table
    80200aac:	00003097          	auipc	ra,0x3
    80200ab0:	460080e7          	jalr	1120(ra) # 80203f0c <fileinit>
    userinit();      // first user process
    80200ab4:	00001097          	auipc	ra,0x1
    80200ab8:	2ea080e7          	jalr	746(ra) # 80201d9e <userinit>
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
    80200ae8:	00016717          	auipc	a4,0x16
    80200aec:	56f72423          	sw	a5,1384(a4) # 80217050 <started>
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
    80200af8:	00016797          	auipc	a5,0x16
    80200afc:	5607b783          	ld	a5,1376(a5) # 80217058 <kernel_pagetable>
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
    80200c5e:	00016517          	auipc	a0,0x16
    80200c62:	3fa53503          	ld	a0,1018(a0) # 80217058 <kernel_pagetable>
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
    80200d12:	00016517          	auipc	a0,0x16
    80200d16:	34653503          	ld	a0,838(a0) # 80217058 <kernel_pagetable>
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
    80200d4e:	00016797          	auipc	a5,0x16
    80200d52:	30a7b523          	sd	a0,778(a5) # 80217058 <kernel_pagetable>
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
    80200dd2:	0000d497          	auipc	s1,0xd
    80200dd6:	3064b483          	ld	s1,774(s1) # 8020e0d8 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80200e0e:	0000d597          	auipc	a1,0xd
    80200e12:	2aa5b583          	ld	a1,682(a1) # 8020e0b8 <_GLOBAL_OFFSET_TABLE_+0x8>
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
    80201394:	6d0080e7          	jalr	1744(ra) # 80201a60 <myproc>
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
    80201472:	5f2080e7          	jalr	1522(ra) # 80201a60 <myproc>
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
    80201534:	00074703          	lbu	a4,0(a4) # fffffffffffff000 <kernel_end+0xffffffff7fdc0000>
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
    80201578:	4ec080e7          	jalr	1260(ra) # 80201a60 <myproc>
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
    802016f0:	00016597          	auipc	a1,0x16
    802016f4:	9685b583          	ld	a1,-1688(a1) # 80217058 <kernel_pagetable>
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
    802017c0:	000ab603          	ld	a2,0(s5) # fffffffffffff000 <kernel_end+0xffffffff7fdc0000>
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
    80201804:	000bb603          	ld	a2,0(s7) # fffffffffffff000 <kernel_end+0xffffffff7fdc0000>
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
    802019c2:	e052                	sd	s4,0(sp)
    802019c4:	1800                	addi	s0,sp,48
  initlock(&pid_lock, "nextpid");
    802019c6:	00009597          	auipc	a1,0x9
    802019ca:	c5a58593          	addi	a1,a1,-934 # 8020a620 <digits+0x2a0>
    802019ce:	00015517          	auipc	a0,0x15
    802019d2:	69250513          	addi	a0,a0,1682 # 80217060 <pid_lock>
    802019d6:	fffff097          	auipc	ra,0xfffff
    802019da:	cae080e7          	jalr	-850(ra) # 80200684 <initlock>
  for (p = proc; p < &proc[NPROC]; p++)
    802019de:	00015497          	auipc	s1,0x15
    802019e2:	7a248493          	addi	s1,s1,1954 # 80217180 <proc>
    initlock(&p->lock, "proc");
    802019e6:	00009a17          	auipc	s4,0x9
    802019ea:	c42a0a13          	addi	s4,s4,-958 # 8020a628 <digits+0x2a8>
  for (p = proc; p < &proc[NPROC]; p++)
    802019ee:	6905                	lui	s2,0x1
    802019f0:	80090913          	addi	s2,s2,-2048 # 800 <_entry-0x801ff800>
    802019f4:	0002e997          	auipc	s3,0x2e
    802019f8:	78c98993          	addi	s3,s3,1932 # 80230180 <bcache>
    initlock(&p->lock, "proc");
    802019fc:	85d2                	mv	a1,s4
    802019fe:	8526                	mv	a0,s1
    80201a00:	fffff097          	auipc	ra,0xfffff
    80201a04:	c84080e7          	jalr	-892(ra) # 80200684 <initlock>
  for (p = proc; p < &proc[NPROC]; p++)
    80201a08:	94ca                	add	s1,s1,s2
    80201a0a:	ff3499e3          	bne	s1,s3,802019fc <procinit+0x46>
  memset(cpus, 0, sizeof(cpus));
    80201a0e:	10000613          	li	a2,256
    80201a12:	4581                	li	a1,0
    80201a14:	00015517          	auipc	a0,0x15
    80201a18:	66450513          	addi	a0,a0,1636 # 80217078 <cpus>
    80201a1c:	fffff097          	auipc	ra,0xfffff
    80201a20:	d48080e7          	jalr	-696(ra) # 80200764 <memset>
}
    80201a24:	70a2                	ld	ra,40(sp)
    80201a26:	7402                	ld	s0,32(sp)
    80201a28:	64e2                	ld	s1,24(sp)
    80201a2a:	6942                	ld	s2,16(sp)
    80201a2c:	69a2                	ld	s3,8(sp)
    80201a2e:	6a02                	ld	s4,0(sp)
    80201a30:	6145                	addi	sp,sp,48
    80201a32:	8082                	ret

0000000080201a34 <cpuid>:
{
    80201a34:	1141                	addi	sp,sp,-16
    80201a36:	e422                	sd	s0,8(sp)
    80201a38:	0800                	addi	s0,sp,16
  asm volatile("mv %0, tp" : "=r" (x) );
    80201a3a:	8512                	mv	a0,tp
}
    80201a3c:	2501                	sext.w	a0,a0
    80201a3e:	6422                	ld	s0,8(sp)
    80201a40:	0141                	addi	sp,sp,16
    80201a42:	8082                	ret

0000000080201a44 <mycpu>:
{
    80201a44:	1141                	addi	sp,sp,-16
    80201a46:	e422                	sd	s0,8(sp)
    80201a48:	0800                	addi	s0,sp,16
    80201a4a:	8792                	mv	a5,tp
  struct cpu *c = &cpus[id];
    80201a4c:	2781                	sext.w	a5,a5
    80201a4e:	079e                	slli	a5,a5,0x7
}
    80201a50:	00015517          	auipc	a0,0x15
    80201a54:	62850513          	addi	a0,a0,1576 # 80217078 <cpus>
    80201a58:	953e                	add	a0,a0,a5
    80201a5a:	6422                	ld	s0,8(sp)
    80201a5c:	0141                	addi	sp,sp,16
    80201a5e:	8082                	ret

0000000080201a60 <myproc>:
{
    80201a60:	1101                	addi	sp,sp,-32
    80201a62:	ec06                	sd	ra,24(sp)
    80201a64:	e822                	sd	s0,16(sp)
    80201a66:	e426                	sd	s1,8(sp)
    80201a68:	1000                	addi	s0,sp,32
  push_off();
    80201a6a:	fffff097          	auipc	ra,0xfffff
    80201a6e:	b6e080e7          	jalr	-1170(ra) # 802005d8 <push_off>
    80201a72:	8792                	mv	a5,tp
  struct proc *p = c->proc;
    80201a74:	2781                	sext.w	a5,a5
    80201a76:	079e                	slli	a5,a5,0x7
    80201a78:	00015717          	auipc	a4,0x15
    80201a7c:	5e870713          	addi	a4,a4,1512 # 80217060 <pid_lock>
    80201a80:	97ba                	add	a5,a5,a4
    80201a82:	6f84                	ld	s1,24(a5)
  pop_off();
    80201a84:	fffff097          	auipc	ra,0xfffff
    80201a88:	ba0080e7          	jalr	-1120(ra) # 80200624 <pop_off>
}
    80201a8c:	8526                	mv	a0,s1
    80201a8e:	60e2                	ld	ra,24(sp)
    80201a90:	6442                	ld	s0,16(sp)
    80201a92:	64a2                	ld	s1,8(sp)
    80201a94:	6105                	addi	sp,sp,32
    80201a96:	8082                	ret

0000000080201a98 <forkret>:
{
    80201a98:	1101                	addi	sp,sp,-32
    80201a9a:	ec06                	sd	ra,24(sp)
    80201a9c:	e822                	sd	s0,16(sp)
    80201a9e:	e426                	sd	s1,8(sp)
    80201aa0:	1000                	addi	s0,sp,32
  release(&myproc()->lock);
    80201aa2:	00000097          	auipc	ra,0x0
    80201aa6:	fbe080e7          	jalr	-66(ra) # 80201a60 <myproc>
    80201aaa:	fffff097          	auipc	ra,0xfffff
    80201aae:	c72080e7          	jalr	-910(ra) # 8020071c <release>
  if (first)
    80201ab2:	0000a797          	auipc	a5,0xa
    80201ab6:	54e7a783          	lw	a5,1358(a5) # 8020c000 <first.1718>
    80201aba:	eb91                	bnez	a5,80201ace <forkret+0x36>
  usertrapret();
    80201abc:	00001097          	auipc	ra,0x1
    80201ac0:	f40080e7          	jalr	-192(ra) # 802029fc <usertrapret>
}
    80201ac4:	60e2                	ld	ra,24(sp)
    80201ac6:	6442                	ld	s0,16(sp)
    80201ac8:	64a2                	ld	s1,8(sp)
    80201aca:	6105                	addi	sp,sp,32
    80201acc:	8082                	ret
    first = 0;
    80201ace:	0000a797          	auipc	a5,0xa
    80201ad2:	5207a923          	sw	zero,1330(a5) # 8020c000 <first.1718>
    fat32_init();
    80201ad6:	00005097          	auipc	ra,0x5
    80201ada:	0ac080e7          	jalr	172(ra) # 80206b82 <fat32_init>
    myproc()->cwd = ename("/");
    80201ade:	00000097          	auipc	ra,0x0
    80201ae2:	f82080e7          	jalr	-126(ra) # 80201a60 <myproc>
    80201ae6:	84aa                	mv	s1,a0
    80201ae8:	00009517          	auipc	a0,0x9
    80201aec:	b4850513          	addi	a0,a0,-1208 # 8020a630 <digits+0x2b0>
    80201af0:	00006097          	auipc	ra,0x6
    80201af4:	2ec080e7          	jalr	748(ra) # 80207ddc <ename>
    80201af8:	4ca4bc23          	sd	a0,1240(s1)
    80201afc:	b7c1                	j	80201abc <forkret+0x24>

0000000080201afe <allocpid>:
{
    80201afe:	1101                	addi	sp,sp,-32
    80201b00:	ec06                	sd	ra,24(sp)
    80201b02:	e822                	sd	s0,16(sp)
    80201b04:	e426                	sd	s1,8(sp)
    80201b06:	e04a                	sd	s2,0(sp)
    80201b08:	1000                	addi	s0,sp,32
  acquire(&pid_lock);
    80201b0a:	00015917          	auipc	s2,0x15
    80201b0e:	55690913          	addi	s2,s2,1366 # 80217060 <pid_lock>
    80201b12:	854a                	mv	a0,s2
    80201b14:	fffff097          	auipc	ra,0xfffff
    80201b18:	bb4080e7          	jalr	-1100(ra) # 802006c8 <acquire>
  pid = nextpid;
    80201b1c:	0000a797          	auipc	a5,0xa
    80201b20:	4e478793          	addi	a5,a5,1252 # 8020c000 <first.1718>
    80201b24:	43c4                	lw	s1,4(a5)
  nextpid = nextpid + 1;
    80201b26:	0014871b          	addiw	a4,s1,1
    80201b2a:	c3d8                	sw	a4,4(a5)
  release(&pid_lock);
    80201b2c:	854a                	mv	a0,s2
    80201b2e:	fffff097          	auipc	ra,0xfffff
    80201b32:	bee080e7          	jalr	-1042(ra) # 8020071c <release>
}
    80201b36:	8526                	mv	a0,s1
    80201b38:	60e2                	ld	ra,24(sp)
    80201b3a:	6442                	ld	s0,16(sp)
    80201b3c:	64a2                	ld	s1,8(sp)
    80201b3e:	6902                	ld	s2,0(sp)
    80201b40:	6105                	addi	sp,sp,32
    80201b42:	8082                	ret

0000000080201b44 <proc_pagetable>:
{
    80201b44:	1101                	addi	sp,sp,-32
    80201b46:	ec06                	sd	ra,24(sp)
    80201b48:	e822                	sd	s0,16(sp)
    80201b4a:	e426                	sd	s1,8(sp)
    80201b4c:	e04a                	sd	s2,0(sp)
    80201b4e:	1000                	addi	s0,sp,32
    80201b50:	892a                	mv	s2,a0
  pagetable = uvmcreate();
    80201b52:	fffff097          	auipc	ra,0xfffff
    80201b56:	3a2080e7          	jalr	930(ra) # 80200ef4 <uvmcreate>
    80201b5a:	84aa                	mv	s1,a0
  if (pagetable == 0)
    80201b5c:	c121                	beqz	a0,80201b9c <proc_pagetable+0x58>
  if (mappages(pagetable, TRAMPOLINE, PGSIZE,
    80201b5e:	4729                	li	a4,10
    80201b60:	0000c697          	auipc	a3,0xc
    80201b64:	5586b683          	ld	a3,1368(a3) # 8020e0b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201b68:	6605                	lui	a2,0x1
    80201b6a:	040005b7          	lui	a1,0x4000
    80201b6e:	15fd                	addi	a1,a1,-1
    80201b70:	05b2                	slli	a1,a1,0xc
    80201b72:	fffff097          	auipc	ra,0xfffff
    80201b76:	104080e7          	jalr	260(ra) # 80200c76 <mappages>
    80201b7a:	02054863          	bltz	a0,80201baa <proc_pagetable+0x66>
  if (mappages(pagetable, TRAPFRAME, PGSIZE,
    80201b7e:	4719                	li	a4,6
    80201b80:	06093683          	ld	a3,96(s2)
    80201b84:	6605                	lui	a2,0x1
    80201b86:	020005b7          	lui	a1,0x2000
    80201b8a:	15fd                	addi	a1,a1,-1
    80201b8c:	05b6                	slli	a1,a1,0xd
    80201b8e:	8526                	mv	a0,s1
    80201b90:	fffff097          	auipc	ra,0xfffff
    80201b94:	0e6080e7          	jalr	230(ra) # 80200c76 <mappages>
    80201b98:	02054163          	bltz	a0,80201bba <proc_pagetable+0x76>
}
    80201b9c:	8526                	mv	a0,s1
    80201b9e:	60e2                	ld	ra,24(sp)
    80201ba0:	6442                	ld	s0,16(sp)
    80201ba2:	64a2                	ld	s1,8(sp)
    80201ba4:	6902                	ld	s2,0(sp)
    80201ba6:	6105                	addi	sp,sp,32
    80201ba8:	8082                	ret
    uvmfree(pagetable, 0);
    80201baa:	4581                	li	a1,0
    80201bac:	8526                	mv	a0,s1
    80201bae:	fffff097          	auipc	ra,0xfffff
    80201bb2:	5ca080e7          	jalr	1482(ra) # 80201178 <uvmfree>
    return NULL;
    80201bb6:	4481                	li	s1,0
    80201bb8:	b7d5                	j	80201b9c <proc_pagetable+0x58>
    vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201bba:	4681                	li	a3,0
    80201bbc:	4605                	li	a2,1
    80201bbe:	040005b7          	lui	a1,0x4000
    80201bc2:	15fd                	addi	a1,a1,-1
    80201bc4:	05b2                	slli	a1,a1,0xc
    80201bc6:	8526                	mv	a0,s1
    80201bc8:	fffff097          	auipc	ra,0xfffff
    80201bcc:	268080e7          	jalr	616(ra) # 80200e30 <vmunmap>
    uvmfree(pagetable, 0);
    80201bd0:	4581                	li	a1,0
    80201bd2:	8526                	mv	a0,s1
    80201bd4:	fffff097          	auipc	ra,0xfffff
    80201bd8:	5a4080e7          	jalr	1444(ra) # 80201178 <uvmfree>
    return NULL;
    80201bdc:	4481                	li	s1,0
    80201bde:	bf7d                	j	80201b9c <proc_pagetable+0x58>

0000000080201be0 <proc_freepagetable>:
{
    80201be0:	1101                	addi	sp,sp,-32
    80201be2:	ec06                	sd	ra,24(sp)
    80201be4:	e822                	sd	s0,16(sp)
    80201be6:	e426                	sd	s1,8(sp)
    80201be8:	e04a                	sd	s2,0(sp)
    80201bea:	1000                	addi	s0,sp,32
    80201bec:	84aa                	mv	s1,a0
    80201bee:	892e                	mv	s2,a1
  vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201bf0:	4681                	li	a3,0
    80201bf2:	4605                	li	a2,1
    80201bf4:	040005b7          	lui	a1,0x4000
    80201bf8:	15fd                	addi	a1,a1,-1
    80201bfa:	05b2                	slli	a1,a1,0xc
    80201bfc:	fffff097          	auipc	ra,0xfffff
    80201c00:	234080e7          	jalr	564(ra) # 80200e30 <vmunmap>
  vmunmap(pagetable, TRAPFRAME, 1, 0);
    80201c04:	4681                	li	a3,0
    80201c06:	4605                	li	a2,1
    80201c08:	020005b7          	lui	a1,0x2000
    80201c0c:	15fd                	addi	a1,a1,-1
    80201c0e:	05b6                	slli	a1,a1,0xd
    80201c10:	8526                	mv	a0,s1
    80201c12:	fffff097          	auipc	ra,0xfffff
    80201c16:	21e080e7          	jalr	542(ra) # 80200e30 <vmunmap>
  uvmfree(pagetable, sz);
    80201c1a:	85ca                	mv	a1,s2
    80201c1c:	8526                	mv	a0,s1
    80201c1e:	fffff097          	auipc	ra,0xfffff
    80201c22:	55a080e7          	jalr	1370(ra) # 80201178 <uvmfree>
}
    80201c26:	60e2                	ld	ra,24(sp)
    80201c28:	6442                	ld	s0,16(sp)
    80201c2a:	64a2                	ld	s1,8(sp)
    80201c2c:	6902                	ld	s2,0(sp)
    80201c2e:	6105                	addi	sp,sp,32
    80201c30:	8082                	ret

0000000080201c32 <freeproc>:
{
    80201c32:	1101                	addi	sp,sp,-32
    80201c34:	ec06                	sd	ra,24(sp)
    80201c36:	e822                	sd	s0,16(sp)
    80201c38:	e426                	sd	s1,8(sp)
    80201c3a:	1000                	addi	s0,sp,32
    80201c3c:	84aa                	mv	s1,a0
  if (p->trapframe)
    80201c3e:	7128                	ld	a0,96(a0)
    80201c40:	c509                	beqz	a0,80201c4a <freeproc+0x18>
    kfree((void *)p->trapframe);
    80201c42:	fffff097          	auipc	ra,0xfffff
    80201c46:	802080e7          	jalr	-2046(ra) # 80200444 <kfree>
  p->trapframe = 0;
    80201c4a:	0604b023          	sd	zero,96(s1)
  if (p->kpagetable)
    80201c4e:	6ca8                	ld	a0,88(s1)
    80201c50:	c511                	beqz	a0,80201c5c <freeproc+0x2a>
    kvmfree(p->kpagetable, 1);
    80201c52:	4585                	li	a1,1
    80201c54:	00000097          	auipc	ra,0x0
    80201c58:	a2a080e7          	jalr	-1494(ra) # 8020167e <kvmfree>
  p->kpagetable = 0;
    80201c5c:	0404bc23          	sd	zero,88(s1)
  if (p->pagetable)
    80201c60:	68a8                	ld	a0,80(s1)
    80201c62:	c511                	beqz	a0,80201c6e <freeproc+0x3c>
    proc_freepagetable(p->pagetable, p->sz);
    80201c64:	64ac                	ld	a1,72(s1)
    80201c66:	00000097          	auipc	ra,0x0
    80201c6a:	f7a080e7          	jalr	-134(ra) # 80201be0 <proc_freepagetable>
  p->pagetable = 0;
    80201c6e:	0404b823          	sd	zero,80(s1)
  p->sz = 0;
    80201c72:	0404b423          	sd	zero,72(s1)
  p->pid = 0;
    80201c76:	0204ac23          	sw	zero,56(s1)
  p->parent = 0;
    80201c7a:	0204b023          	sd	zero,32(s1)
  p->name[0] = 0;
    80201c7e:	4e048023          	sb	zero,1248(s1)
  p->chan = 0;
    80201c82:	0204b423          	sd	zero,40(s1)
  p->killed = 0;
    80201c86:	0204a823          	sw	zero,48(s1)
  p->xstate = 0;
    80201c8a:	0204aa23          	sw	zero,52(s1)
  p->state = UNUSED;
    80201c8e:	0004ac23          	sw	zero,24(s1)
}
    80201c92:	60e2                	ld	ra,24(sp)
    80201c94:	6442                	ld	s0,16(sp)
    80201c96:	64a2                	ld	s1,8(sp)
    80201c98:	6105                	addi	sp,sp,32
    80201c9a:	8082                	ret

0000000080201c9c <allocproc>:
{
    80201c9c:	7179                	addi	sp,sp,-48
    80201c9e:	f406                	sd	ra,40(sp)
    80201ca0:	f022                	sd	s0,32(sp)
    80201ca2:	ec26                	sd	s1,24(sp)
    80201ca4:	e84a                	sd	s2,16(sp)
    80201ca6:	e44e                	sd	s3,8(sp)
    80201ca8:	e052                	sd	s4,0(sp)
    80201caa:	1800                	addi	s0,sp,48
  for (p = proc; p < &proc[NPROC]; p++)
    80201cac:	00015497          	auipc	s1,0x15
    80201cb0:	4d448493          	addi	s1,s1,1236 # 80217180 <proc>
    80201cb4:	6985                	lui	s3,0x1
    80201cb6:	80098993          	addi	s3,s3,-2048 # 800 <_entry-0x801ff800>
    80201cba:	0002ea17          	auipc	s4,0x2e
    80201cbe:	4c6a0a13          	addi	s4,s4,1222 # 80230180 <bcache>
    acquire(&p->lock);
    80201cc2:	8526                	mv	a0,s1
    80201cc4:	fffff097          	auipc	ra,0xfffff
    80201cc8:	a04080e7          	jalr	-1532(ra) # 802006c8 <acquire>
    if (p->state == UNUSED)
    80201ccc:	4c9c                	lw	a5,24(s1)
    80201cce:	cb99                	beqz	a5,80201ce4 <allocproc+0x48>
      release(&p->lock);
    80201cd0:	8526                	mv	a0,s1
    80201cd2:	fffff097          	auipc	ra,0xfffff
    80201cd6:	a4a080e7          	jalr	-1462(ra) # 8020071c <release>
  for (p = proc; p < &proc[NPROC]; p++)
    80201cda:	94ce                	add	s1,s1,s3
    80201cdc:	ff4493e3          	bne	s1,s4,80201cc2 <allocproc+0x26>
  return NULL;
    80201ce0:	4481                	li	s1,0
    80201ce2:	a051                	j	80201d66 <allocproc+0xca>
  p->pid = allocpid();
    80201ce4:	00000097          	auipc	ra,0x0
    80201ce8:	e1a080e7          	jalr	-486(ra) # 80201afe <allocpid>
    80201cec:	dc88                	sw	a0,56(s1)
  if ((p->trapframe = (struct trapframe *)kalloc()) == NULL)
    80201cee:	fffff097          	auipc	ra,0xfffff
    80201cf2:	86e080e7          	jalr	-1938(ra) # 8020055c <kalloc>
    80201cf6:	89aa                	mv	s3,a0
    80201cf8:	f0a8                	sd	a0,96(s1)
    80201cfa:	cd3d                	beqz	a0,80201d78 <allocproc+0xdc>
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201cfc:	8526                	mv	a0,s1
    80201cfe:	00000097          	auipc	ra,0x0
    80201d02:	e46080e7          	jalr	-442(ra) # 80201b44 <proc_pagetable>
    80201d06:	e8a8                	sd	a0,80(s1)
    80201d08:	cd3d                	beqz	a0,80201d86 <allocproc+0xea>
      (p->kpagetable = proc_kpagetable()) == NULL)
    80201d0a:	00000097          	auipc	ra,0x0
    80201d0e:	9ce080e7          	jalr	-1586(ra) # 802016d8 <proc_kpagetable>
    80201d12:	eca8                	sd	a0,88(s1)
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201d14:	c92d                	beqz	a0,80201d86 <allocproc+0xea>
  p->kstack = VKSTACK;
    80201d16:	0fb00793          	li	a5,251
    80201d1a:	07fa                	slli	a5,a5,0x1e
    80201d1c:	e0bc                	sd	a5,64(s1)
  memset(&p->context, 0, sizeof(p->context));
    80201d1e:	07000613          	li	a2,112
    80201d22:	4581                	li	a1,0
    80201d24:	06848513          	addi	a0,s1,104
    80201d28:	fffff097          	auipc	ra,0xfffff
    80201d2c:	a3c080e7          	jalr	-1476(ra) # 80200764 <memset>
  p->context.ra = (uint64)forkret;
    80201d30:	00000797          	auipc	a5,0x0
    80201d34:	d6878793          	addi	a5,a5,-664 # 80201a98 <forkret>
    80201d38:	f4bc                	sd	a5,104(s1)
  p->context.sp = p->kstack + PGSIZE;
    80201d3a:	60bc                	ld	a5,64(s1)
    80201d3c:	6705                	lui	a4,0x1
    80201d3e:	97ba                	add	a5,a5,a4
    80201d40:	f8bc                	sd	a5,112(s1)
  for(int i=0;i<VMA_MAX;i++)
    80201d42:	4f848793          	addi	a5,s1,1272
    80201d46:	7f848913          	addi	s2,s1,2040
    p->vma[i].valid=0;
    80201d4a:	0007a023          	sw	zero,0(a5)
    p->vma[i].mapcnt=0;
    80201d4e:	0207b423          	sd	zero,40(a5)
  for(int i=0;i<VMA_MAX;i++)
    80201d52:	03078793          	addi	a5,a5,48
    80201d56:	ff279ae3          	bne	a5,s2,80201d4a <allocproc+0xae>
  p->maxaddr=MAXVA-2*PGSIZE;
    80201d5a:	020007b7          	lui	a5,0x2000
    80201d5e:	17fd                	addi	a5,a5,-1
    80201d60:	07b6                	slli	a5,a5,0xd
    80201d62:	7ef4bc23          	sd	a5,2040(s1)
}
    80201d66:	8526                	mv	a0,s1
    80201d68:	70a2                	ld	ra,40(sp)
    80201d6a:	7402                	ld	s0,32(sp)
    80201d6c:	64e2                	ld	s1,24(sp)
    80201d6e:	6942                	ld	s2,16(sp)
    80201d70:	69a2                	ld	s3,8(sp)
    80201d72:	6a02                	ld	s4,0(sp)
    80201d74:	6145                	addi	sp,sp,48
    80201d76:	8082                	ret
    release(&p->lock);
    80201d78:	8526                	mv	a0,s1
    80201d7a:	fffff097          	auipc	ra,0xfffff
    80201d7e:	9a2080e7          	jalr	-1630(ra) # 8020071c <release>
    return NULL;
    80201d82:	84ce                	mv	s1,s3
    80201d84:	b7cd                	j	80201d66 <allocproc+0xca>
    freeproc(p);
    80201d86:	8526                	mv	a0,s1
    80201d88:	00000097          	auipc	ra,0x0
    80201d8c:	eaa080e7          	jalr	-342(ra) # 80201c32 <freeproc>
    release(&p->lock);
    80201d90:	8526                	mv	a0,s1
    80201d92:	fffff097          	auipc	ra,0xfffff
    80201d96:	98a080e7          	jalr	-1654(ra) # 8020071c <release>
    return NULL;
    80201d9a:	4481                	li	s1,0
    80201d9c:	b7e9                	j	80201d66 <allocproc+0xca>

0000000080201d9e <userinit>:
{
    80201d9e:	1101                	addi	sp,sp,-32
    80201da0:	ec06                	sd	ra,24(sp)
    80201da2:	e822                	sd	s0,16(sp)
    80201da4:	e426                	sd	s1,8(sp)
    80201da6:	1000                	addi	s0,sp,32
  p = allocproc();
    80201da8:	00000097          	auipc	ra,0x0
    80201dac:	ef4080e7          	jalr	-268(ra) # 80201c9c <allocproc>
    80201db0:	84aa                	mv	s1,a0
  initproc = p;
    80201db2:	00015797          	auipc	a5,0x15
    80201db6:	3ca7b323          	sd	a0,966(a5) # 80217178 <initproc>
  uvminit(p->pagetable, p->kpagetable, initcode, sizeof(initcode));
    80201dba:	03400693          	li	a3,52
    80201dbe:	0000a617          	auipc	a2,0xa
    80201dc2:	24a60613          	addi	a2,a2,586 # 8020c008 <initcode>
    80201dc6:	6d2c                	ld	a1,88(a0)
    80201dc8:	6928                	ld	a0,80(a0)
    80201dca:	fffff097          	auipc	ra,0xfffff
    80201dce:	158080e7          	jalr	344(ra) # 80200f22 <uvminit>
  p->sz = PGSIZE;
    80201dd2:	6785                	lui	a5,0x1
    80201dd4:	e4bc                	sd	a5,72(s1)
  p->trapframe->epc = 0x0;   // user program counter
    80201dd6:	70b8                	ld	a4,96(s1)
    80201dd8:	00073c23          	sd	zero,24(a4) # 1018 <_entry-0x801fefe8>
  p->trapframe->sp = PGSIZE; // user stack pointer
    80201ddc:	70b8                	ld	a4,96(s1)
    80201dde:	fb1c                	sd	a5,48(a4)
  safestrcpy(p->name, "initcode", sizeof(p->name));
    80201de0:	4641                	li	a2,16
    80201de2:	00009597          	auipc	a1,0x9
    80201de6:	85658593          	addi	a1,a1,-1962 # 8020a638 <digits+0x2b8>
    80201dea:	4e048513          	addi	a0,s1,1248
    80201dee:	fffff097          	auipc	ra,0xfffff
    80201df2:	acc080e7          	jalr	-1332(ra) # 802008ba <safestrcpy>
  p->state = RUNNABLE;
    80201df6:	4789                	li	a5,2
    80201df8:	cc9c                	sw	a5,24(s1)
  p->tmask = 0;
    80201dfa:	4e04a823          	sw	zero,1264(s1)
  release(&p->lock);
    80201dfe:	8526                	mv	a0,s1
    80201e00:	fffff097          	auipc	ra,0xfffff
    80201e04:	91c080e7          	jalr	-1764(ra) # 8020071c <release>
}
    80201e08:	60e2                	ld	ra,24(sp)
    80201e0a:	6442                	ld	s0,16(sp)
    80201e0c:	64a2                	ld	s1,8(sp)
    80201e0e:	6105                	addi	sp,sp,32
    80201e10:	8082                	ret

0000000080201e12 <growproc>:
{
    80201e12:	1101                	addi	sp,sp,-32
    80201e14:	ec06                	sd	ra,24(sp)
    80201e16:	e822                	sd	s0,16(sp)
    80201e18:	e426                	sd	s1,8(sp)
    80201e1a:	e04a                	sd	s2,0(sp)
    80201e1c:	1000                	addi	s0,sp,32
    80201e1e:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80201e20:	00000097          	auipc	ra,0x0
    80201e24:	c40080e7          	jalr	-960(ra) # 80201a60 <myproc>
    80201e28:	892a                	mv	s2,a0
  sz = p->sz;
    80201e2a:	6530                	ld	a2,72(a0)
    80201e2c:	0006069b          	sext.w	a3,a2
  if (n > 0)
    80201e30:	00904f63          	bgtz	s1,80201e4e <growproc+0x3c>
  else if (n < 0)
    80201e34:	0204cd63          	bltz	s1,80201e6e <growproc+0x5c>
  p->sz = sz;
    80201e38:	1682                	slli	a3,a3,0x20
    80201e3a:	9281                	srli	a3,a3,0x20
    80201e3c:	04d93423          	sd	a3,72(s2)
  return 0;
    80201e40:	4501                	li	a0,0
}
    80201e42:	60e2                	ld	ra,24(sp)
    80201e44:	6442                	ld	s0,16(sp)
    80201e46:	64a2                	ld	s1,8(sp)
    80201e48:	6902                	ld	s2,0(sp)
    80201e4a:	6105                	addi	sp,sp,32
    80201e4c:	8082                	ret
    if ((sz = uvmalloc(p->pagetable, p->kpagetable, sz, sz + n)) == 0)
    80201e4e:	9ea5                	addw	a3,a3,s1
    80201e50:	1682                	slli	a3,a3,0x20
    80201e52:	9281                	srli	a3,a3,0x20
    80201e54:	1602                	slli	a2,a2,0x20
    80201e56:	9201                	srli	a2,a2,0x20
    80201e58:	6d2c                	ld	a1,88(a0)
    80201e5a:	6928                	ld	a0,80(a0)
    80201e5c:	fffff097          	auipc	ra,0xfffff
    80201e60:	1bc080e7          	jalr	444(ra) # 80201018 <uvmalloc>
    80201e64:	0005069b          	sext.w	a3,a0
    80201e68:	fae1                	bnez	a3,80201e38 <growproc+0x26>
      return -1;
    80201e6a:	557d                	li	a0,-1
    80201e6c:	bfd9                	j	80201e42 <growproc+0x30>
    sz = uvmdealloc(p->pagetable, p->kpagetable, sz, sz + n);
    80201e6e:	9ea5                	addw	a3,a3,s1
    80201e70:	1682                	slli	a3,a3,0x20
    80201e72:	9281                	srli	a3,a3,0x20
    80201e74:	1602                	slli	a2,a2,0x20
    80201e76:	9201                	srli	a2,a2,0x20
    80201e78:	6d2c                	ld	a1,88(a0)
    80201e7a:	6928                	ld	a0,80(a0)
    80201e7c:	fffff097          	auipc	ra,0xfffff
    80201e80:	130080e7          	jalr	304(ra) # 80200fac <uvmdealloc>
    80201e84:	0005069b          	sext.w	a3,a0
    80201e88:	bf45                	j	80201e38 <growproc+0x26>

0000000080201e8a <fork>:
{
    80201e8a:	7179                	addi	sp,sp,-48
    80201e8c:	f406                	sd	ra,40(sp)
    80201e8e:	f022                	sd	s0,32(sp)
    80201e90:	ec26                	sd	s1,24(sp)
    80201e92:	e84a                	sd	s2,16(sp)
    80201e94:	e44e                	sd	s3,8(sp)
    80201e96:	e052                	sd	s4,0(sp)
    80201e98:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80201e9a:	00000097          	auipc	ra,0x0
    80201e9e:	bc6080e7          	jalr	-1082(ra) # 80201a60 <myproc>
    80201ea2:	892a                	mv	s2,a0
  if ((np = allocproc()) == NULL)
    80201ea4:	00000097          	auipc	ra,0x0
    80201ea8:	df8080e7          	jalr	-520(ra) # 80201c9c <allocproc>
    80201eac:	c57d                	beqz	a0,80201f9a <fork+0x110>
    80201eae:	8a2a                	mv	s4,a0
  if (uvmcopy(p->pagetable, np->pagetable, np->kpagetable, p->sz) < 0)
    80201eb0:	04893683          	ld	a3,72(s2)
    80201eb4:	6d30                	ld	a2,88(a0)
    80201eb6:	692c                	ld	a1,80(a0)
    80201eb8:	05093503          	ld	a0,80(s2)
    80201ebc:	fffff097          	auipc	ra,0xfffff
    80201ec0:	2f4080e7          	jalr	756(ra) # 802011b0 <uvmcopy>
    80201ec4:	04054c63          	bltz	a0,80201f1c <fork+0x92>
  np->sz = p->sz;
    80201ec8:	04893783          	ld	a5,72(s2)
    80201ecc:	04fa3423          	sd	a5,72(s4)
  np->parent = p;
    80201ed0:	032a3023          	sd	s2,32(s4)
  np->tmask = p->tmask;
    80201ed4:	4f092783          	lw	a5,1264(s2)
    80201ed8:	4efa2823          	sw	a5,1264(s4)
  *(np->trapframe) = *(p->trapframe);
    80201edc:	06093683          	ld	a3,96(s2)
    80201ee0:	87b6                	mv	a5,a3
    80201ee2:	060a3703          	ld	a4,96(s4)
    80201ee6:	12068693          	addi	a3,a3,288
    80201eea:	0007b803          	ld	a6,0(a5) # 1000 <_entry-0x801ff000>
    80201eee:	6788                	ld	a0,8(a5)
    80201ef0:	6b8c                	ld	a1,16(a5)
    80201ef2:	6f90                	ld	a2,24(a5)
    80201ef4:	01073023          	sd	a6,0(a4)
    80201ef8:	e708                	sd	a0,8(a4)
    80201efa:	eb0c                	sd	a1,16(a4)
    80201efc:	ef10                	sd	a2,24(a4)
    80201efe:	02078793          	addi	a5,a5,32
    80201f02:	02070713          	addi	a4,a4,32
    80201f06:	fed792e3          	bne	a5,a3,80201eea <fork+0x60>
  np->trapframe->a0 = 0;
    80201f0a:	060a3783          	ld	a5,96(s4)
    80201f0e:	0607b823          	sd	zero,112(a5)
    80201f12:	0d800493          	li	s1,216
  for (i = 0; i < NOFILE; i++)
    80201f16:	4d800993          	li	s3,1240
    80201f1a:	a03d                	j	80201f48 <fork+0xbe>
    freeproc(np);
    80201f1c:	8552                	mv	a0,s4
    80201f1e:	00000097          	auipc	ra,0x0
    80201f22:	d14080e7          	jalr	-748(ra) # 80201c32 <freeproc>
    release(&np->lock);
    80201f26:	8552                	mv	a0,s4
    80201f28:	ffffe097          	auipc	ra,0xffffe
    80201f2c:	7f4080e7          	jalr	2036(ra) # 8020071c <release>
    return -1;
    80201f30:	54fd                	li	s1,-1
    80201f32:	a899                	j	80201f88 <fork+0xfe>
      np->ofile[i] = filedup(p->ofile[i]);
    80201f34:	00002097          	auipc	ra,0x2
    80201f38:	09a080e7          	jalr	154(ra) # 80203fce <filedup>
    80201f3c:	009a07b3          	add	a5,s4,s1
    80201f40:	e388                	sd	a0,0(a5)
  for (i = 0; i < NOFILE; i++)
    80201f42:	04a1                	addi	s1,s1,8
    80201f44:	01348763          	beq	s1,s3,80201f52 <fork+0xc8>
    if (p->ofile[i])
    80201f48:	009907b3          	add	a5,s2,s1
    80201f4c:	6388                	ld	a0,0(a5)
    80201f4e:	f17d                	bnez	a0,80201f34 <fork+0xaa>
    80201f50:	bfcd                	j	80201f42 <fork+0xb8>
  np->cwd = edup(p->cwd);
    80201f52:	4d893503          	ld	a0,1240(s2)
    80201f56:	00005097          	auipc	ra,0x5
    80201f5a:	47e080e7          	jalr	1150(ra) # 802073d4 <edup>
    80201f5e:	4caa3c23          	sd	a0,1240(s4)
  safestrcpy(np->name, p->name, sizeof(p->name));
    80201f62:	4641                	li	a2,16
    80201f64:	4e090593          	addi	a1,s2,1248
    80201f68:	4e0a0513          	addi	a0,s4,1248
    80201f6c:	fffff097          	auipc	ra,0xfffff
    80201f70:	94e080e7          	jalr	-1714(ra) # 802008ba <safestrcpy>
  pid = np->pid;
    80201f74:	038a2483          	lw	s1,56(s4)
  np->state = RUNNABLE;
    80201f78:	4789                	li	a5,2
    80201f7a:	00fa2c23          	sw	a5,24(s4)
  release(&np->lock);
    80201f7e:	8552                	mv	a0,s4
    80201f80:	ffffe097          	auipc	ra,0xffffe
    80201f84:	79c080e7          	jalr	1948(ra) # 8020071c <release>
}
    80201f88:	8526                	mv	a0,s1
    80201f8a:	70a2                	ld	ra,40(sp)
    80201f8c:	7402                	ld	s0,32(sp)
    80201f8e:	64e2                	ld	s1,24(sp)
    80201f90:	6942                	ld	s2,16(sp)
    80201f92:	69a2                	ld	s3,8(sp)
    80201f94:	6a02                	ld	s4,0(sp)
    80201f96:	6145                	addi	sp,sp,48
    80201f98:	8082                	ret
    return -1;
    80201f9a:	54fd                	li	s1,-1
    80201f9c:	b7f5                	j	80201f88 <fork+0xfe>

0000000080201f9e <reparent>:
{
    80201f9e:	7139                	addi	sp,sp,-64
    80201fa0:	fc06                	sd	ra,56(sp)
    80201fa2:	f822                	sd	s0,48(sp)
    80201fa4:	f426                	sd	s1,40(sp)
    80201fa6:	f04a                	sd	s2,32(sp)
    80201fa8:	ec4e                	sd	s3,24(sp)
    80201faa:	e852                	sd	s4,16(sp)
    80201fac:	e456                	sd	s5,8(sp)
    80201fae:	0080                	addi	s0,sp,64
    80201fb0:	89aa                	mv	s3,a0
  for (pp = proc; pp < &proc[NPROC]; pp++)
    80201fb2:	00015497          	auipc	s1,0x15
    80201fb6:	1ce48493          	addi	s1,s1,462 # 80217180 <proc>
      pp->parent = initproc;
    80201fba:	00015a97          	auipc	s5,0x15
    80201fbe:	0a6a8a93          	addi	s5,s5,166 # 80217060 <pid_lock>
  for (pp = proc; pp < &proc[NPROC]; pp++)
    80201fc2:	6905                	lui	s2,0x1
    80201fc4:	80090913          	addi	s2,s2,-2048 # 800 <_entry-0x801ff800>
    80201fc8:	0002ea17          	auipc	s4,0x2e
    80201fcc:	1b8a0a13          	addi	s4,s4,440 # 80230180 <bcache>
    80201fd0:	a021                	j	80201fd8 <reparent+0x3a>
    80201fd2:	94ca                	add	s1,s1,s2
    80201fd4:	03448363          	beq	s1,s4,80201ffa <reparent+0x5c>
    if (pp->parent == p)
    80201fd8:	709c                	ld	a5,32(s1)
    80201fda:	ff379ce3          	bne	a5,s3,80201fd2 <reparent+0x34>
      acquire(&pp->lock);
    80201fde:	8526                	mv	a0,s1
    80201fe0:	ffffe097          	auipc	ra,0xffffe
    80201fe4:	6e8080e7          	jalr	1768(ra) # 802006c8 <acquire>
      pp->parent = initproc;
    80201fe8:	118ab783          	ld	a5,280(s5)
    80201fec:	f09c                	sd	a5,32(s1)
      release(&pp->lock);
    80201fee:	8526                	mv	a0,s1
    80201ff0:	ffffe097          	auipc	ra,0xffffe
    80201ff4:	72c080e7          	jalr	1836(ra) # 8020071c <release>
    80201ff8:	bfe9                	j	80201fd2 <reparent+0x34>
}
    80201ffa:	70e2                	ld	ra,56(sp)
    80201ffc:	7442                	ld	s0,48(sp)
    80201ffe:	74a2                	ld	s1,40(sp)
    80202000:	7902                	ld	s2,32(sp)
    80202002:	69e2                	ld	s3,24(sp)
    80202004:	6a42                	ld	s4,16(sp)
    80202006:	6aa2                	ld	s5,8(sp)
    80202008:	6121                	addi	sp,sp,64
    8020200a:	8082                	ret

000000008020200c <scheduler>:
{
    8020200c:	715d                	addi	sp,sp,-80
    8020200e:	e486                	sd	ra,72(sp)
    80202010:	e0a2                	sd	s0,64(sp)
    80202012:	fc26                	sd	s1,56(sp)
    80202014:	f84a                	sd	s2,48(sp)
    80202016:	f44e                	sd	s3,40(sp)
    80202018:	f052                	sd	s4,32(sp)
    8020201a:	ec56                	sd	s5,24(sp)
    8020201c:	e85a                	sd	s6,16(sp)
    8020201e:	e45e                	sd	s7,8(sp)
    80202020:	e062                	sd	s8,0(sp)
    80202022:	0880                	addi	s0,sp,80
    80202024:	8792                	mv	a5,tp
  int id = r_tp();
    80202026:	2781                	sext.w	a5,a5
  c->proc = 0;
    80202028:	00779b93          	slli	s7,a5,0x7
    8020202c:	00015717          	auipc	a4,0x15
    80202030:	03470713          	addi	a4,a4,52 # 80217060 <pid_lock>
    80202034:	975e                	add	a4,a4,s7
    80202036:	00073c23          	sd	zero,24(a4)
        swtch(&c->context, &p->context);
    8020203a:	00015717          	auipc	a4,0x15
    8020203e:	04670713          	addi	a4,a4,70 # 80217080 <cpus+0x8>
    80202042:	9bba                	add	s7,s7,a4
        c->proc = p;
    80202044:	079e                	slli	a5,a5,0x7
    80202046:	00015a97          	auipc	s5,0x15
    8020204a:	01aa8a93          	addi	s5,s5,26 # 80217060 <pid_lock>
    8020204e:	9abe                	add	s5,s5,a5
        w_satp(MAKE_SATP(p->kpagetable));
    80202050:	5a7d                	li	s4,-1
    80202052:	1a7e                	slli	s4,s4,0x3f
    for (p = proc; p < &proc[NPROC]; p++)
    80202054:	6985                	lui	s3,0x1
    80202056:	80098993          	addi	s3,s3,-2048 # 800 <_entry-0x801ff800>
    8020205a:	a8a5                	j	802020d2 <scheduler+0xc6>
        p->state = RUNNING;
    8020205c:	478d                	li	a5,3
    8020205e:	cc9c                	sw	a5,24(s1)
        c->proc = p;
    80202060:	009abc23          	sd	s1,24(s5)
        w_satp(MAKE_SATP(p->kpagetable));
    80202064:	6cbc                	ld	a5,88(s1)
    80202066:	83b1                	srli	a5,a5,0xc
    80202068:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    8020206c:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    80202070:	12000073          	sfence.vma
        swtch(&c->context, &p->context);
    80202074:	06848593          	addi	a1,s1,104
    80202078:	855e                	mv	a0,s7
    8020207a:	00001097          	auipc	ra,0x1
    8020207e:	8dc080e7          	jalr	-1828(ra) # 80202956 <swtch>
        w_satp(MAKE_SATP(kernel_pagetable));
    80202082:	000b3783          	ld	a5,0(s6) # 1000 <_entry-0x801ff000>
    80202086:	83b1                	srli	a5,a5,0xc
    80202088:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    8020208c:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    80202090:	12000073          	sfence.vma
        c->proc = 0;
    80202094:	000abc23          	sd	zero,24(s5)
        found = 1;
    80202098:	4c05                	li	s8,1
      release(&p->lock);
    8020209a:	8526                	mv	a0,s1
    8020209c:	ffffe097          	auipc	ra,0xffffe
    802020a0:	680080e7          	jalr	1664(ra) # 8020071c <release>
    for (p = proc; p < &proc[NPROC]; p++)
    802020a4:	94ce                	add	s1,s1,s3
    802020a6:	01248c63          	beq	s1,s2,802020be <scheduler+0xb2>
      acquire(&p->lock);
    802020aa:	8526                	mv	a0,s1
    802020ac:	ffffe097          	auipc	ra,0xffffe
    802020b0:	61c080e7          	jalr	1564(ra) # 802006c8 <acquire>
      if (p->state == RUNNABLE)
    802020b4:	4c98                	lw	a4,24(s1)
    802020b6:	4789                	li	a5,2
    802020b8:	fef711e3          	bne	a4,a5,8020209a <scheduler+0x8e>
    802020bc:	b745                	j	8020205c <scheduler+0x50>
    if (found == 0)
    802020be:	000c1a63          	bnez	s8,802020d2 <scheduler+0xc6>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802020c2:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    802020c6:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802020ca:	10079073          	csrw	sstatus,a5
      asm volatile("wfi");
    802020ce:	10500073          	wfi
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802020d2:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    802020d6:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802020da:	10079073          	csrw	sstatus,a5
    int found = 0;
    802020de:	4c01                	li	s8,0
    for (p = proc; p < &proc[NPROC]; p++)
    802020e0:	00015497          	auipc	s1,0x15
    802020e4:	0a048493          	addi	s1,s1,160 # 80217180 <proc>
        w_satp(MAKE_SATP(kernel_pagetable));
    802020e8:	0000cb17          	auipc	s6,0xc
    802020ec:	018b3b03          	ld	s6,24(s6) # 8020e100 <_GLOBAL_OFFSET_TABLE_+0x50>
    for (p = proc; p < &proc[NPROC]; p++)
    802020f0:	0002e917          	auipc	s2,0x2e
    802020f4:	09090913          	addi	s2,s2,144 # 80230180 <bcache>
    802020f8:	bf4d                	j	802020aa <scheduler+0x9e>

00000000802020fa <sched>:
{
    802020fa:	7179                	addi	sp,sp,-48
    802020fc:	f406                	sd	ra,40(sp)
    802020fe:	f022                	sd	s0,32(sp)
    80202100:	ec26                	sd	s1,24(sp)
    80202102:	e84a                	sd	s2,16(sp)
    80202104:	e44e                	sd	s3,8(sp)
    80202106:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80202108:	00000097          	auipc	ra,0x0
    8020210c:	958080e7          	jalr	-1704(ra) # 80201a60 <myproc>
    80202110:	84aa                	mv	s1,a0
  if (!holding(&p->lock))
    80202112:	ffffe097          	auipc	ra,0xffffe
    80202116:	588080e7          	jalr	1416(ra) # 8020069a <holding>
    8020211a:	c93d                	beqz	a0,80202190 <sched+0x96>
  asm volatile("mv %0, tp" : "=r" (x) );
    8020211c:	8792                	mv	a5,tp
  if (mycpu()->noff != 1)
    8020211e:	2781                	sext.w	a5,a5
    80202120:	079e                	slli	a5,a5,0x7
    80202122:	00015717          	auipc	a4,0x15
    80202126:	f3e70713          	addi	a4,a4,-194 # 80217060 <pid_lock>
    8020212a:	97ba                	add	a5,a5,a4
    8020212c:	0907a703          	lw	a4,144(a5)
    80202130:	4785                	li	a5,1
    80202132:	06f71763          	bne	a4,a5,802021a0 <sched+0xa6>
  if (p->state == RUNNING)
    80202136:	4c98                	lw	a4,24(s1)
    80202138:	478d                	li	a5,3
    8020213a:	06f70b63          	beq	a4,a5,802021b0 <sched+0xb6>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8020213e:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80202142:	8b89                	andi	a5,a5,2
  if (intr_get())
    80202144:	efb5                	bnez	a5,802021c0 <sched+0xc6>
  asm volatile("mv %0, tp" : "=r" (x) );
    80202146:	8792                	mv	a5,tp
  intena = mycpu()->intena;
    80202148:	00015917          	auipc	s2,0x15
    8020214c:	f1890913          	addi	s2,s2,-232 # 80217060 <pid_lock>
    80202150:	2781                	sext.w	a5,a5
    80202152:	079e                	slli	a5,a5,0x7
    80202154:	97ca                	add	a5,a5,s2
    80202156:	0947a983          	lw	s3,148(a5)
    8020215a:	8792                	mv	a5,tp
  swtch(&p->context, &mycpu()->context);
    8020215c:	2781                	sext.w	a5,a5
    8020215e:	079e                	slli	a5,a5,0x7
    80202160:	00015597          	auipc	a1,0x15
    80202164:	f2058593          	addi	a1,a1,-224 # 80217080 <cpus+0x8>
    80202168:	95be                	add	a1,a1,a5
    8020216a:	06848513          	addi	a0,s1,104
    8020216e:	00000097          	auipc	ra,0x0
    80202172:	7e8080e7          	jalr	2024(ra) # 80202956 <swtch>
    80202176:	8792                	mv	a5,tp
  mycpu()->intena = intena;
    80202178:	2781                	sext.w	a5,a5
    8020217a:	079e                	slli	a5,a5,0x7
    8020217c:	97ca                	add	a5,a5,s2
    8020217e:	0937aa23          	sw	s3,148(a5)
}
    80202182:	70a2                	ld	ra,40(sp)
    80202184:	7402                	ld	s0,32(sp)
    80202186:	64e2                	ld	s1,24(sp)
    80202188:	6942                	ld	s2,16(sp)
    8020218a:	69a2                	ld	s3,8(sp)
    8020218c:	6145                	addi	sp,sp,48
    8020218e:	8082                	ret
    panic("sched p->lock");
    80202190:	00008517          	auipc	a0,0x8
    80202194:	4b850513          	addi	a0,a0,1208 # 8020a648 <digits+0x2c8>
    80202198:	ffffe097          	auipc	ra,0xffffe
    8020219c:	faa080e7          	jalr	-86(ra) # 80200142 <panic>
    panic("sched locks");
    802021a0:	00008517          	auipc	a0,0x8
    802021a4:	4b850513          	addi	a0,a0,1208 # 8020a658 <digits+0x2d8>
    802021a8:	ffffe097          	auipc	ra,0xffffe
    802021ac:	f9a080e7          	jalr	-102(ra) # 80200142 <panic>
    panic("sched running");
    802021b0:	00008517          	auipc	a0,0x8
    802021b4:	4b850513          	addi	a0,a0,1208 # 8020a668 <digits+0x2e8>
    802021b8:	ffffe097          	auipc	ra,0xffffe
    802021bc:	f8a080e7          	jalr	-118(ra) # 80200142 <panic>
    panic("sched interruptible");
    802021c0:	00008517          	auipc	a0,0x8
    802021c4:	4b850513          	addi	a0,a0,1208 # 8020a678 <digits+0x2f8>
    802021c8:	ffffe097          	auipc	ra,0xffffe
    802021cc:	f7a080e7          	jalr	-134(ra) # 80200142 <panic>

00000000802021d0 <exit>:
{
    802021d0:	7179                	addi	sp,sp,-48
    802021d2:	f406                	sd	ra,40(sp)
    802021d4:	f022                	sd	s0,32(sp)
    802021d6:	ec26                	sd	s1,24(sp)
    802021d8:	e84a                	sd	s2,16(sp)
    802021da:	e44e                	sd	s3,8(sp)
    802021dc:	e052                	sd	s4,0(sp)
    802021de:	1800                	addi	s0,sp,48
    802021e0:	8a2a                	mv	s4,a0
  struct proc *p = myproc();
    802021e2:	00000097          	auipc	ra,0x0
    802021e6:	87e080e7          	jalr	-1922(ra) # 80201a60 <myproc>
    802021ea:	89aa                	mv	s3,a0
  for (int fd = 0; fd < NOFILE; fd++)
    802021ec:	0d850493          	addi	s1,a0,216
    802021f0:	4d850913          	addi	s2,a0,1240
    802021f4:	a811                	j	80202208 <exit+0x38>
      fileclose(f);
    802021f6:	00002097          	auipc	ra,0x2
    802021fa:	e2a080e7          	jalr	-470(ra) # 80204020 <fileclose>
      p->ofile[fd] = 0;
    802021fe:	0004b023          	sd	zero,0(s1)
  for (int fd = 0; fd < NOFILE; fd++)
    80202202:	04a1                	addi	s1,s1,8
    80202204:	01248563          	beq	s1,s2,8020220e <exit+0x3e>
    if (p->ofile[fd])
    80202208:	6088                	ld	a0,0(s1)
    8020220a:	f575                	bnez	a0,802021f6 <exit+0x26>
    8020220c:	bfdd                	j	80202202 <exit+0x32>
  eput(p->cwd);
    8020220e:	4d89b503          	ld	a0,1240(s3)
    80202212:	00005097          	auipc	ra,0x5
    80202216:	4a4080e7          	jalr	1188(ra) # 802076b6 <eput>
  p->cwd = 0;
    8020221a:	4c09bc23          	sd	zero,1240(s3)
  acquire(&initproc->lock);
    8020221e:	00015497          	auipc	s1,0x15
    80202222:	e4248493          	addi	s1,s1,-446 # 80217060 <pid_lock>
    80202226:	1184b503          	ld	a0,280(s1)
    8020222a:	ffffe097          	auipc	ra,0xffffe
    8020222e:	49e080e7          	jalr	1182(ra) # 802006c8 <acquire>
  wakeup1(initproc);
    80202232:	1184b503          	ld	a0,280(s1)
    80202236:	fffff097          	auipc	ra,0xfffff
    8020223a:	636080e7          	jalr	1590(ra) # 8020186c <wakeup1>
  release(&initproc->lock);
    8020223e:	1184b503          	ld	a0,280(s1)
    80202242:	ffffe097          	auipc	ra,0xffffe
    80202246:	4da080e7          	jalr	1242(ra) # 8020071c <release>
  acquire(&p->lock);
    8020224a:	854e                	mv	a0,s3
    8020224c:	ffffe097          	auipc	ra,0xffffe
    80202250:	47c080e7          	jalr	1148(ra) # 802006c8 <acquire>
  struct proc *original_parent = p->parent;
    80202254:	0209b483          	ld	s1,32(s3)
  release(&p->lock);
    80202258:	854e                	mv	a0,s3
    8020225a:	ffffe097          	auipc	ra,0xffffe
    8020225e:	4c2080e7          	jalr	1218(ra) # 8020071c <release>
  acquire(&original_parent->lock);
    80202262:	8526                	mv	a0,s1
    80202264:	ffffe097          	auipc	ra,0xffffe
    80202268:	464080e7          	jalr	1124(ra) # 802006c8 <acquire>
  acquire(&p->lock);
    8020226c:	854e                	mv	a0,s3
    8020226e:	ffffe097          	auipc	ra,0xffffe
    80202272:	45a080e7          	jalr	1114(ra) # 802006c8 <acquire>
  reparent(p);
    80202276:	854e                	mv	a0,s3
    80202278:	00000097          	auipc	ra,0x0
    8020227c:	d26080e7          	jalr	-730(ra) # 80201f9e <reparent>
  wakeup1(original_parent);
    80202280:	8526                	mv	a0,s1
    80202282:	fffff097          	auipc	ra,0xfffff
    80202286:	5ea080e7          	jalr	1514(ra) # 8020186c <wakeup1>
  p->xstate=status<<8;
    8020228a:	008a1a1b          	slliw	s4,s4,0x8
    8020228e:	0349aa23          	sw	s4,52(s3)
  p->state = ZOMBIE;
    80202292:	4791                	li	a5,4
    80202294:	00f9ac23          	sw	a5,24(s3)
  release(&original_parent->lock);
    80202298:	8526                	mv	a0,s1
    8020229a:	ffffe097          	auipc	ra,0xffffe
    8020229e:	482080e7          	jalr	1154(ra) # 8020071c <release>
  sched();
    802022a2:	00000097          	auipc	ra,0x0
    802022a6:	e58080e7          	jalr	-424(ra) # 802020fa <sched>
  panic("zombie exit");
    802022aa:	00008517          	auipc	a0,0x8
    802022ae:	3e650513          	addi	a0,a0,998 # 8020a690 <digits+0x310>
    802022b2:	ffffe097          	auipc	ra,0xffffe
    802022b6:	e90080e7          	jalr	-368(ra) # 80200142 <panic>

00000000802022ba <yield>:
{
    802022ba:	1101                	addi	sp,sp,-32
    802022bc:	ec06                	sd	ra,24(sp)
    802022be:	e822                	sd	s0,16(sp)
    802022c0:	e426                	sd	s1,8(sp)
    802022c2:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    802022c4:	fffff097          	auipc	ra,0xfffff
    802022c8:	79c080e7          	jalr	1948(ra) # 80201a60 <myproc>
    802022cc:	84aa                	mv	s1,a0
  acquire(&p->lock);
    802022ce:	ffffe097          	auipc	ra,0xffffe
    802022d2:	3fa080e7          	jalr	1018(ra) # 802006c8 <acquire>
  p->state = RUNNABLE;
    802022d6:	4789                	li	a5,2
    802022d8:	cc9c                	sw	a5,24(s1)
  sched();
    802022da:	00000097          	auipc	ra,0x0
    802022de:	e20080e7          	jalr	-480(ra) # 802020fa <sched>
  release(&p->lock);
    802022e2:	8526                	mv	a0,s1
    802022e4:	ffffe097          	auipc	ra,0xffffe
    802022e8:	438080e7          	jalr	1080(ra) # 8020071c <release>
}
    802022ec:	60e2                	ld	ra,24(sp)
    802022ee:	6442                	ld	s0,16(sp)
    802022f0:	64a2                	ld	s1,8(sp)
    802022f2:	6105                	addi	sp,sp,32
    802022f4:	8082                	ret

00000000802022f6 <sleep>:
{
    802022f6:	7179                	addi	sp,sp,-48
    802022f8:	f406                	sd	ra,40(sp)
    802022fa:	f022                	sd	s0,32(sp)
    802022fc:	ec26                	sd	s1,24(sp)
    802022fe:	e84a                	sd	s2,16(sp)
    80202300:	e44e                	sd	s3,8(sp)
    80202302:	1800                	addi	s0,sp,48
    80202304:	89aa                	mv	s3,a0
    80202306:	892e                	mv	s2,a1
  struct proc *p = myproc();
    80202308:	fffff097          	auipc	ra,0xfffff
    8020230c:	758080e7          	jalr	1880(ra) # 80201a60 <myproc>
    80202310:	84aa                	mv	s1,a0
  if (lk != &p->lock)
    80202312:	05250663          	beq	a0,s2,8020235e <sleep+0x68>
    acquire(&p->lock); // DOC: sleeplock1
    80202316:	ffffe097          	auipc	ra,0xffffe
    8020231a:	3b2080e7          	jalr	946(ra) # 802006c8 <acquire>
    release(lk);
    8020231e:	854a                	mv	a0,s2
    80202320:	ffffe097          	auipc	ra,0xffffe
    80202324:	3fc080e7          	jalr	1020(ra) # 8020071c <release>
  p->chan = chan;
    80202328:	0334b423          	sd	s3,40(s1)
  p->state = SLEEPING;
    8020232c:	4785                	li	a5,1
    8020232e:	cc9c                	sw	a5,24(s1)
  sched();
    80202330:	00000097          	auipc	ra,0x0
    80202334:	dca080e7          	jalr	-566(ra) # 802020fa <sched>
  p->chan = 0;
    80202338:	0204b423          	sd	zero,40(s1)
    release(&p->lock);
    8020233c:	8526                	mv	a0,s1
    8020233e:	ffffe097          	auipc	ra,0xffffe
    80202342:	3de080e7          	jalr	990(ra) # 8020071c <release>
    acquire(lk);
    80202346:	854a                	mv	a0,s2
    80202348:	ffffe097          	auipc	ra,0xffffe
    8020234c:	380080e7          	jalr	896(ra) # 802006c8 <acquire>
}
    80202350:	70a2                	ld	ra,40(sp)
    80202352:	7402                	ld	s0,32(sp)
    80202354:	64e2                	ld	s1,24(sp)
    80202356:	6942                	ld	s2,16(sp)
    80202358:	69a2                	ld	s3,8(sp)
    8020235a:	6145                	addi	sp,sp,48
    8020235c:	8082                	ret
  p->chan = chan;
    8020235e:	03353423          	sd	s3,40(a0)
  p->state = SLEEPING;
    80202362:	4785                	li	a5,1
    80202364:	cd1c                	sw	a5,24(a0)
  sched();
    80202366:	00000097          	auipc	ra,0x0
    8020236a:	d94080e7          	jalr	-620(ra) # 802020fa <sched>
  p->chan = 0;
    8020236e:	0204b423          	sd	zero,40(s1)
  if (lk != &p->lock)
    80202372:	bff9                	j	80202350 <sleep+0x5a>

0000000080202374 <wait>:
{
    80202374:	715d                	addi	sp,sp,-80
    80202376:	e486                	sd	ra,72(sp)
    80202378:	e0a2                	sd	s0,64(sp)
    8020237a:	fc26                	sd	s1,56(sp)
    8020237c:	f84a                	sd	s2,48(sp)
    8020237e:	f44e                	sd	s3,40(sp)
    80202380:	f052                	sd	s4,32(sp)
    80202382:	ec56                	sd	s5,24(sp)
    80202384:	e85a                	sd	s6,16(sp)
    80202386:	e45e                	sd	s7,8(sp)
    80202388:	e062                	sd	s8,0(sp)
    8020238a:	0880                	addi	s0,sp,80
    8020238c:	8baa                	mv	s7,a0
  struct proc *p = myproc();
    8020238e:	fffff097          	auipc	ra,0xfffff
    80202392:	6d2080e7          	jalr	1746(ra) # 80201a60 <myproc>
    80202396:	892a                	mv	s2,a0
  acquire(&p->lock);
    80202398:	8c2a                	mv	s8,a0
    8020239a:	ffffe097          	auipc	ra,0xffffe
    8020239e:	32e080e7          	jalr	814(ra) # 802006c8 <acquire>
        if (np->state == ZOMBIE)
    802023a2:	4a91                	li	s5,4
    for (np = proc; np < &proc[NPROC]; np++)
    802023a4:	6985                	lui	s3,0x1
    802023a6:	80098993          	addi	s3,s3,-2048 # 800 <_entry-0x801ff800>
    802023aa:	0002ea17          	auipc	s4,0x2e
    802023ae:	dd6a0a13          	addi	s4,s4,-554 # 80230180 <bcache>
        havekids = 1;
    802023b2:	4b05                	li	s6,1
    havekids = 0;
    802023b4:	4701                	li	a4,0
    for (np = proc; np < &proc[NPROC]; np++)
    802023b6:	00015497          	auipc	s1,0x15
    802023ba:	dca48493          	addi	s1,s1,-566 # 80217180 <proc>
    802023be:	a8b1                	j	8020241a <wait+0xa6>
          pid = np->pid;
    802023c0:	0384a983          	lw	s3,56(s1)
          if (addr != 0 && copyout2(addr, (char *)&np->xstate, sizeof(np->xstate)) < 0)
    802023c4:	000b8c63          	beqz	s7,802023dc <wait+0x68>
    802023c8:	4611                	li	a2,4
    802023ca:	03448593          	addi	a1,s1,52
    802023ce:	855e                	mv	a0,s7
    802023d0:	fffff097          	auipc	ra,0xfffff
    802023d4:	fac080e7          	jalr	-84(ra) # 8020137c <copyout2>
    802023d8:	02054263          	bltz	a0,802023fc <wait+0x88>
          freeproc(np);
    802023dc:	8526                	mv	a0,s1
    802023de:	00000097          	auipc	ra,0x0
    802023e2:	854080e7          	jalr	-1964(ra) # 80201c32 <freeproc>
          release(&np->lock);
    802023e6:	8526                	mv	a0,s1
    802023e8:	ffffe097          	auipc	ra,0xffffe
    802023ec:	334080e7          	jalr	820(ra) # 8020071c <release>
          release(&p->lock);
    802023f0:	854a                	mv	a0,s2
    802023f2:	ffffe097          	auipc	ra,0xffffe
    802023f6:	32a080e7          	jalr	810(ra) # 8020071c <release>
          return pid;
    802023fa:	a8a1                	j	80202452 <wait+0xde>
            release(&np->lock);
    802023fc:	8526                	mv	a0,s1
    802023fe:	ffffe097          	auipc	ra,0xffffe
    80202402:	31e080e7          	jalr	798(ra) # 8020071c <release>
            release(&p->lock);
    80202406:	854a                	mv	a0,s2
    80202408:	ffffe097          	auipc	ra,0xffffe
    8020240c:	314080e7          	jalr	788(ra) # 8020071c <release>
            return -1;
    80202410:	59fd                	li	s3,-1
    80202412:	a081                	j	80202452 <wait+0xde>
    for (np = proc; np < &proc[NPROC]; np++)
    80202414:	94ce                	add	s1,s1,s3
    80202416:	03448463          	beq	s1,s4,8020243e <wait+0xca>
      if (np->parent == p)
    8020241a:	709c                	ld	a5,32(s1)
    8020241c:	ff279ce3          	bne	a5,s2,80202414 <wait+0xa0>
        acquire(&np->lock);
    80202420:	8526                	mv	a0,s1
    80202422:	ffffe097          	auipc	ra,0xffffe
    80202426:	2a6080e7          	jalr	678(ra) # 802006c8 <acquire>
        if (np->state == ZOMBIE)
    8020242a:	4c9c                	lw	a5,24(s1)
    8020242c:	f9578ae3          	beq	a5,s5,802023c0 <wait+0x4c>
        release(&np->lock);
    80202430:	8526                	mv	a0,s1
    80202432:	ffffe097          	auipc	ra,0xffffe
    80202436:	2ea080e7          	jalr	746(ra) # 8020071c <release>
        havekids = 1;
    8020243a:	875a                	mv	a4,s6
    8020243c:	bfe1                	j	80202414 <wait+0xa0>
    if (!havekids || p->killed)
    8020243e:	c701                	beqz	a4,80202446 <wait+0xd2>
    80202440:	03092783          	lw	a5,48(s2)
    80202444:	c785                	beqz	a5,8020246c <wait+0xf8>
      release(&p->lock);
    80202446:	854a                	mv	a0,s2
    80202448:	ffffe097          	auipc	ra,0xffffe
    8020244c:	2d4080e7          	jalr	724(ra) # 8020071c <release>
      return -1;
    80202450:	59fd                	li	s3,-1
}
    80202452:	854e                	mv	a0,s3
    80202454:	60a6                	ld	ra,72(sp)
    80202456:	6406                	ld	s0,64(sp)
    80202458:	74e2                	ld	s1,56(sp)
    8020245a:	7942                	ld	s2,48(sp)
    8020245c:	79a2                	ld	s3,40(sp)
    8020245e:	7a02                	ld	s4,32(sp)
    80202460:	6ae2                	ld	s5,24(sp)
    80202462:	6b42                	ld	s6,16(sp)
    80202464:	6ba2                	ld	s7,8(sp)
    80202466:	6c02                	ld	s8,0(sp)
    80202468:	6161                	addi	sp,sp,80
    8020246a:	8082                	ret
    sleep(p, &p->lock); // DOC: wait-sleep
    8020246c:	85e2                	mv	a1,s8
    8020246e:	854a                	mv	a0,s2
    80202470:	00000097          	auipc	ra,0x0
    80202474:	e86080e7          	jalr	-378(ra) # 802022f6 <sleep>
    havekids = 0;
    80202478:	bf35                	j	802023b4 <wait+0x40>

000000008020247a <wakeup>:
{
    8020247a:	7139                	addi	sp,sp,-64
    8020247c:	fc06                	sd	ra,56(sp)
    8020247e:	f822                	sd	s0,48(sp)
    80202480:	f426                	sd	s1,40(sp)
    80202482:	f04a                	sd	s2,32(sp)
    80202484:	ec4e                	sd	s3,24(sp)
    80202486:	e852                	sd	s4,16(sp)
    80202488:	e456                	sd	s5,8(sp)
    8020248a:	e05a                	sd	s6,0(sp)
    8020248c:	0080                	addi	s0,sp,64
    8020248e:	8aaa                	mv	s5,a0
  for (p = proc; p < &proc[NPROC]; p++)
    80202490:	00015497          	auipc	s1,0x15
    80202494:	cf048493          	addi	s1,s1,-784 # 80217180 <proc>
    if (p->state == SLEEPING && p->chan == chan)
    80202498:	4a05                	li	s4,1
      p->state = RUNNABLE;
    8020249a:	4b09                	li	s6,2
  for (p = proc; p < &proc[NPROC]; p++)
    8020249c:	6905                	lui	s2,0x1
    8020249e:	80090913          	addi	s2,s2,-2048 # 800 <_entry-0x801ff800>
    802024a2:	0002e997          	auipc	s3,0x2e
    802024a6:	cde98993          	addi	s3,s3,-802 # 80230180 <bcache>
    802024aa:	a819                	j	802024c0 <wakeup+0x46>
      p->state = RUNNABLE;
    802024ac:	0164ac23          	sw	s6,24(s1)
    release(&p->lock);
    802024b0:	8526                	mv	a0,s1
    802024b2:	ffffe097          	auipc	ra,0xffffe
    802024b6:	26a080e7          	jalr	618(ra) # 8020071c <release>
  for (p = proc; p < &proc[NPROC]; p++)
    802024ba:	94ca                	add	s1,s1,s2
    802024bc:	01348e63          	beq	s1,s3,802024d8 <wakeup+0x5e>
    acquire(&p->lock);
    802024c0:	8526                	mv	a0,s1
    802024c2:	ffffe097          	auipc	ra,0xffffe
    802024c6:	206080e7          	jalr	518(ra) # 802006c8 <acquire>
    if (p->state == SLEEPING && p->chan == chan)
    802024ca:	4c9c                	lw	a5,24(s1)
    802024cc:	ff4792e3          	bne	a5,s4,802024b0 <wakeup+0x36>
    802024d0:	749c                	ld	a5,40(s1)
    802024d2:	fd579fe3          	bne	a5,s5,802024b0 <wakeup+0x36>
    802024d6:	bfd9                	j	802024ac <wakeup+0x32>
}
    802024d8:	70e2                	ld	ra,56(sp)
    802024da:	7442                	ld	s0,48(sp)
    802024dc:	74a2                	ld	s1,40(sp)
    802024de:	7902                	ld	s2,32(sp)
    802024e0:	69e2                	ld	s3,24(sp)
    802024e2:	6a42                	ld	s4,16(sp)
    802024e4:	6aa2                	ld	s5,8(sp)
    802024e6:	6b02                	ld	s6,0(sp)
    802024e8:	6121                	addi	sp,sp,64
    802024ea:	8082                	ret

00000000802024ec <kill>:

// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int kill(int pid)
{
    802024ec:	7179                	addi	sp,sp,-48
    802024ee:	f406                	sd	ra,40(sp)
    802024f0:	f022                	sd	s0,32(sp)
    802024f2:	ec26                	sd	s1,24(sp)
    802024f4:	e84a                	sd	s2,16(sp)
    802024f6:	e44e                	sd	s3,8(sp)
    802024f8:	e052                	sd	s4,0(sp)
    802024fa:	1800                	addi	s0,sp,48
    802024fc:	892a                	mv	s2,a0
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++)
    802024fe:	00015497          	auipc	s1,0x15
    80202502:	c8248493          	addi	s1,s1,-894 # 80217180 <proc>
    80202506:	6985                	lui	s3,0x1
    80202508:	80098993          	addi	s3,s3,-2048 # 800 <_entry-0x801ff800>
    8020250c:	0002ea17          	auipc	s4,0x2e
    80202510:	c74a0a13          	addi	s4,s4,-908 # 80230180 <bcache>
  {
    acquire(&p->lock);
    80202514:	8526                	mv	a0,s1
    80202516:	ffffe097          	auipc	ra,0xffffe
    8020251a:	1b2080e7          	jalr	434(ra) # 802006c8 <acquire>
    if (p->pid == pid)
    8020251e:	5c9c                	lw	a5,56(s1)
    80202520:	01278c63          	beq	a5,s2,80202538 <kill+0x4c>
        p->state = RUNNABLE;
      }
      release(&p->lock);
      return 0;
    }
    release(&p->lock);
    80202524:	8526                	mv	a0,s1
    80202526:	ffffe097          	auipc	ra,0xffffe
    8020252a:	1f6080e7          	jalr	502(ra) # 8020071c <release>
  for (p = proc; p < &proc[NPROC]; p++)
    8020252e:	94ce                	add	s1,s1,s3
    80202530:	ff4492e3          	bne	s1,s4,80202514 <kill+0x28>
  }
  return -1;
    80202534:	557d                	li	a0,-1
    80202536:	a829                	j	80202550 <kill+0x64>
      p->killed = 1;
    80202538:	4785                	li	a5,1
    8020253a:	d89c                	sw	a5,48(s1)
      if (p->state == SLEEPING)
    8020253c:	4c98                	lw	a4,24(s1)
    8020253e:	4785                	li	a5,1
    80202540:	02f70063          	beq	a4,a5,80202560 <kill+0x74>
      release(&p->lock);
    80202544:	8526                	mv	a0,s1
    80202546:	ffffe097          	auipc	ra,0xffffe
    8020254a:	1d6080e7          	jalr	470(ra) # 8020071c <release>
      return 0;
    8020254e:	4501                	li	a0,0
}
    80202550:	70a2                	ld	ra,40(sp)
    80202552:	7402                	ld	s0,32(sp)
    80202554:	64e2                	ld	s1,24(sp)
    80202556:	6942                	ld	s2,16(sp)
    80202558:	69a2                	ld	s3,8(sp)
    8020255a:	6a02                	ld	s4,0(sp)
    8020255c:	6145                	addi	sp,sp,48
    8020255e:	8082                	ret
        p->state = RUNNABLE;
    80202560:	4789                	li	a5,2
    80202562:	cc9c                	sw	a5,24(s1)
    80202564:	b7c5                	j	80202544 <kill+0x58>

0000000080202566 <either_copyout>:

// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    80202566:	7179                	addi	sp,sp,-48
    80202568:	f406                	sd	ra,40(sp)
    8020256a:	f022                	sd	s0,32(sp)
    8020256c:	ec26                	sd	s1,24(sp)
    8020256e:	e84a                	sd	s2,16(sp)
    80202570:	e44e                	sd	s3,8(sp)
    80202572:	e052                	sd	s4,0(sp)
    80202574:	1800                	addi	s0,sp,48
    80202576:	84aa                	mv	s1,a0
    80202578:	892e                	mv	s2,a1
    8020257a:	89b2                	mv	s3,a2
    8020257c:	8a36                	mv	s4,a3
  struct proc *p = myproc();
    8020257e:	fffff097          	auipc	ra,0xfffff
    80202582:	4e2080e7          	jalr	1250(ra) # 80201a60 <myproc>
  if (user_dst)
    80202586:	c08d                	beqz	s1,802025a8 <either_copyout+0x42>
  {
    return copyout(p->pagetable, dst, src, len);
    80202588:	86d2                	mv	a3,s4
    8020258a:	864e                	mv	a2,s3
    8020258c:	85ca                	mv	a1,s2
    8020258e:	6928                	ld	a0,80(a0)
    80202590:	fffff097          	auipc	ra,0xfffff
    80202594:	d60080e7          	jalr	-672(ra) # 802012f0 <copyout>
  else
  {
    memmove((char *)dst, src, len);
    return 0;
  }
}
    80202598:	70a2                	ld	ra,40(sp)
    8020259a:	7402                	ld	s0,32(sp)
    8020259c:	64e2                	ld	s1,24(sp)
    8020259e:	6942                	ld	s2,16(sp)
    802025a0:	69a2                	ld	s3,8(sp)
    802025a2:	6a02                	ld	s4,0(sp)
    802025a4:	6145                	addi	sp,sp,48
    802025a6:	8082                	ret
    memmove((char *)dst, src, len);
    802025a8:	000a061b          	sext.w	a2,s4
    802025ac:	85ce                	mv	a1,s3
    802025ae:	854a                	mv	a0,s2
    802025b0:	ffffe097          	auipc	ra,0xffffe
    802025b4:	214080e7          	jalr	532(ra) # 802007c4 <memmove>
    return 0;
    802025b8:	8526                	mv	a0,s1
    802025ba:	bff9                	j	80202598 <either_copyout+0x32>

00000000802025bc <either_copyin>:

// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    802025bc:	7179                	addi	sp,sp,-48
    802025be:	f406                	sd	ra,40(sp)
    802025c0:	f022                	sd	s0,32(sp)
    802025c2:	ec26                	sd	s1,24(sp)
    802025c4:	e84a                	sd	s2,16(sp)
    802025c6:	e44e                	sd	s3,8(sp)
    802025c8:	e052                	sd	s4,0(sp)
    802025ca:	1800                	addi	s0,sp,48
    802025cc:	892a                	mv	s2,a0
    802025ce:	84ae                	mv	s1,a1
    802025d0:	89b2                	mv	s3,a2
    802025d2:	8a36                	mv	s4,a3
  struct proc *p = myproc();
    802025d4:	fffff097          	auipc	ra,0xfffff
    802025d8:	48c080e7          	jalr	1164(ra) # 80201a60 <myproc>
  if (user_src)
    802025dc:	c08d                	beqz	s1,802025fe <either_copyin+0x42>
  {
    return copyin(p->pagetable, dst, src, len);
    802025de:	86d2                	mv	a3,s4
    802025e0:	864e                	mv	a2,s3
    802025e2:	85ca                	mv	a1,s2
    802025e4:	6928                	ld	a0,80(a0)
    802025e6:	fffff097          	auipc	ra,0xfffff
    802025ea:	de8080e7          	jalr	-536(ra) # 802013ce <copyin>
  else
  {
    memmove(dst, (char *)src, len);
    return 0;
  }
}
    802025ee:	70a2                	ld	ra,40(sp)
    802025f0:	7402                	ld	s0,32(sp)
    802025f2:	64e2                	ld	s1,24(sp)
    802025f4:	6942                	ld	s2,16(sp)
    802025f6:	69a2                	ld	s3,8(sp)
    802025f8:	6a02                	ld	s4,0(sp)
    802025fa:	6145                	addi	sp,sp,48
    802025fc:	8082                	ret
    memmove(dst, (char *)src, len);
    802025fe:	000a061b          	sext.w	a2,s4
    80202602:	85ce                	mv	a1,s3
    80202604:	854a                	mv	a0,s2
    80202606:	ffffe097          	auipc	ra,0xffffe
    8020260a:	1be080e7          	jalr	446(ra) # 802007c4 <memmove>
    return 0;
    8020260e:	8526                	mv	a0,s1
    80202610:	bff9                	j	802025ee <either_copyin+0x32>

0000000080202612 <procdump>:

// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void procdump(void)
{
    80202612:	715d                	addi	sp,sp,-80
    80202614:	e486                	sd	ra,72(sp)
    80202616:	e0a2                	sd	s0,64(sp)
    80202618:	fc26                	sd	s1,56(sp)
    8020261a:	f84a                	sd	s2,48(sp)
    8020261c:	f44e                	sd	s3,40(sp)
    8020261e:	f052                	sd	s4,32(sp)
    80202620:	ec56                	sd	s5,24(sp)
    80202622:	e85a                	sd	s6,16(sp)
    80202624:	e45e                	sd	s7,8(sp)
    80202626:	e062                	sd	s8,0(sp)
    80202628:	0880                	addi	s0,sp,80
      [RUNNING] "run   ",
      [ZOMBIE] "zombie"};
  struct proc *p;
  char *state;

  printf("\nPID\tSTATE\tNAME\tMEM\n");
    8020262a:	00008517          	auipc	a0,0x8
    8020262e:	07e50513          	addi	a0,a0,126 # 8020a6a8 <digits+0x328>
    80202632:	ffffe097          	auipc	ra,0xffffe
    80202636:	b5a080e7          	jalr	-1190(ra) # 8020018c <printf>
  for (p = proc; p < &proc[NPROC]; p++)
    8020263a:	00015497          	auipc	s1,0x15
    8020263e:	02648493          	addi	s1,s1,38 # 80217660 <proc+0x4e0>
    80202642:	0002e997          	auipc	s3,0x2e
    80202646:	01e98993          	addi	s3,s3,30 # 80230660 <bcache+0x4e0>
  {
    if (p->state == UNUSED)
      continue;
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
    8020264a:	4b91                	li	s7,4
      state = states[p->state];
    else
      state = "???";
    8020264c:	00008a17          	auipc	s4,0x8
    80202650:	054a0a13          	addi	s4,s4,84 # 8020a6a0 <digits+0x320>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    80202654:	00008b17          	auipc	s6,0x8
    80202658:	06cb0b13          	addi	s6,s6,108 # 8020a6c0 <digits+0x340>
    printf("\n");
    8020265c:	00008a97          	auipc	s5,0x8
    80202660:	a7ca8a93          	addi	s5,s5,-1412 # 8020a0d8 <etext+0xd8>
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80202664:	0000ac17          	auipc	s8,0xa
    80202668:	9dcc0c13          	addi	s8,s8,-1572 # 8020c040 <states.1758>
    8020266c:	6905                	lui	s2,0x1
    8020266e:	80090913          	addi	s2,s2,-2048 # 800 <_entry-0x801ff800>
    80202672:	a015                	j	80202696 <procdump+0x84>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    80202674:	b686b703          	ld	a4,-1176(a3)
    80202678:	b586a583          	lw	a1,-1192(a3)
    8020267c:	855a                	mv	a0,s6
    8020267e:	ffffe097          	auipc	ra,0xffffe
    80202682:	b0e080e7          	jalr	-1266(ra) # 8020018c <printf>
    printf("\n");
    80202686:	8556                	mv	a0,s5
    80202688:	ffffe097          	auipc	ra,0xffffe
    8020268c:	b04080e7          	jalr	-1276(ra) # 8020018c <printf>
  for (p = proc; p < &proc[NPROC]; p++)
    80202690:	94ca                	add	s1,s1,s2
    80202692:	03348163          	beq	s1,s3,802026b4 <procdump+0xa2>
    if (p->state == UNUSED)
    80202696:	86a6                	mv	a3,s1
    80202698:	b384a783          	lw	a5,-1224(s1)
    8020269c:	dbf5                	beqz	a5,80202690 <procdump+0x7e>
      state = "???";
    8020269e:	8652                	mv	a2,s4
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
    802026a0:	fcfbeae3          	bltu	s7,a5,80202674 <procdump+0x62>
    802026a4:	1782                	slli	a5,a5,0x20
    802026a6:	9381                	srli	a5,a5,0x20
    802026a8:	078e                	slli	a5,a5,0x3
    802026aa:	97e2                	add	a5,a5,s8
    802026ac:	6390                	ld	a2,0(a5)
    802026ae:	f279                	bnez	a2,80202674 <procdump+0x62>
      state = "???";
    802026b0:	8652                	mv	a2,s4
    802026b2:	b7c9                	j	80202674 <procdump+0x62>
  }
}
    802026b4:	60a6                	ld	ra,72(sp)
    802026b6:	6406                	ld	s0,64(sp)
    802026b8:	74e2                	ld	s1,56(sp)
    802026ba:	7942                	ld	s2,48(sp)
    802026bc:	79a2                	ld	s3,40(sp)
    802026be:	7a02                	ld	s4,32(sp)
    802026c0:	6ae2                	ld	s5,24(sp)
    802026c2:	6b42                	ld	s6,16(sp)
    802026c4:	6ba2                	ld	s7,8(sp)
    802026c6:	6c02                	ld	s8,0(sp)
    802026c8:	6161                	addi	sp,sp,80
    802026ca:	8082                	ret

00000000802026cc <procnum>:

uint64
procnum(void)
{
    802026cc:	1141                	addi	sp,sp,-16
    802026ce:	e422                	sd	s0,8(sp)
    802026d0:	0800                	addi	s0,sp,16
  int num = 0;
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++)
    802026d2:	00015797          	auipc	a5,0x15
    802026d6:	aae78793          	addi	a5,a5,-1362 # 80217180 <proc>
  int num = 0;
    802026da:	4501                	li	a0,0
  for (p = proc; p < &proc[NPROC]; p++)
    802026dc:	6685                	lui	a3,0x1
    802026de:	80068693          	addi	a3,a3,-2048 # 800 <_entry-0x801ff800>
    802026e2:	0002e617          	auipc	a2,0x2e
    802026e6:	a9e60613          	addi	a2,a2,-1378 # 80230180 <bcache>
    802026ea:	a021                	j	802026f2 <procnum+0x26>
    802026ec:	97b6                	add	a5,a5,a3
    802026ee:	00c78663          	beq	a5,a2,802026fa <procnum+0x2e>
  {
    if (p->state != UNUSED)
    802026f2:	4f98                	lw	a4,24(a5)
    802026f4:	df65                	beqz	a4,802026ec <procnum+0x20>
    {
      num++;
    802026f6:	2505                	addiw	a0,a0,1
    802026f8:	bfd5                	j	802026ec <procnum+0x20>
    }
  }

  return num;
}
    802026fa:	6422                	ld	s0,8(sp)
    802026fc:	0141                	addi	sp,sp,16
    802026fe:	8082                	ret

0000000080202700 <clone>:


// added by lmq for SYS_clone
int clone(int flags, uint64 stack, int ptid, int tls, int ctid)
{
    80202700:	7179                	addi	sp,sp,-48
    80202702:	f406                	sd	ra,40(sp)
    80202704:	f022                	sd	s0,32(sp)
    80202706:	ec26                	sd	s1,24(sp)
    80202708:	e84a                	sd	s2,16(sp)
    8020270a:	e44e                	sd	s3,8(sp)
    8020270c:	e052                	sd	s4,0(sp)
    8020270e:	1800                	addi	s0,sp,48
    80202710:	84ae                	mv	s1,a1
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    80202712:	fffff097          	auipc	ra,0xfffff
    80202716:	34e080e7          	jalr	846(ra) # 80201a60 <myproc>
    8020271a:	892a                	mv	s2,a0

  // Allocate process.
  if ((np = allocproc()) == NULL)
    8020271c:	fffff097          	auipc	ra,0xfffff
    80202720:	580080e7          	jalr	1408(ra) # 80201c9c <allocproc>
    80202724:	cd65                	beqz	a0,8020281c <clone+0x11c>
    80202726:	8a2a                	mv	s4,a0
  {
    return -1;
  }

  // Copy user memory from parent to child.
  if (uvmcopy(p->pagetable, np->pagetable, np->kpagetable, p->sz) < 0)
    80202728:	04893683          	ld	a3,72(s2)
    8020272c:	6d30                	ld	a2,88(a0)
    8020272e:	692c                	ld	a1,80(a0)
    80202730:	05093503          	ld	a0,80(s2)
    80202734:	fffff097          	auipc	ra,0xfffff
    80202738:	a7c080e7          	jalr	-1412(ra) # 802011b0 <uvmcopy>
    8020273c:	06054163          	bltz	a0,8020279e <clone+0x9e>
  {
    freeproc(np);
    release(&np->lock);
    return -1;
  }
  np->sz = p->sz;
    80202740:	04893783          	ld	a5,72(s2)
    80202744:	04fa3423          	sd	a5,72(s4)

  np->parent = p;
    80202748:	032a3023          	sd	s2,32(s4)

  // copy tracing mask from parent.
  np->tmask = p->tmask;
    8020274c:	4f092783          	lw	a5,1264(s2)
    80202750:	4efa2823          	sw	a5,1264(s4)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    80202754:	06093683          	ld	a3,96(s2)
    80202758:	87b6                	mv	a5,a3
    8020275a:	060a3703          	ld	a4,96(s4)
    8020275e:	12068693          	addi	a3,a3,288
    80202762:	0007b883          	ld	a7,0(a5)
    80202766:	0087b803          	ld	a6,8(a5)
    8020276a:	6b88                	ld	a0,16(a5)
    8020276c:	6f90                	ld	a2,24(a5)
    8020276e:	01173023          	sd	a7,0(a4)
    80202772:	01073423          	sd	a6,8(a4)
    80202776:	eb08                	sd	a0,16(a4)
    80202778:	ef10                	sd	a2,24(a4)
    8020277a:	02078793          	addi	a5,a5,32
    8020277e:	02070713          	addi	a4,a4,32
    80202782:	fed790e3          	bne	a5,a3,80202762 <clone+0x62>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    80202786:	060a3783          	ld	a5,96(s4)
    8020278a:	0607b823          	sd	zero,112(a5)
  // printf("child stack is %d\n", stack);
  np->trapframe->sp=stack;
    8020278e:	060a3783          	ld	a5,96(s4)
    80202792:	fb84                	sd	s1,48(a5)
    80202794:	0d800493          	li	s1,216
  // increment reference counts on open file descriptors.
  for (i = 0; i < NOFILE; i++)
    80202798:	4d800993          	li	s3,1240
    8020279c:	a03d                	j	802027ca <clone+0xca>
    freeproc(np);
    8020279e:	8552                	mv	a0,s4
    802027a0:	fffff097          	auipc	ra,0xfffff
    802027a4:	492080e7          	jalr	1170(ra) # 80201c32 <freeproc>
    release(&np->lock);
    802027a8:	8552                	mv	a0,s4
    802027aa:	ffffe097          	auipc	ra,0xffffe
    802027ae:	f72080e7          	jalr	-142(ra) # 8020071c <release>
    return -1;
    802027b2:	54fd                	li	s1,-1
    802027b4:	a899                	j	8020280a <clone+0x10a>
    if (p->ofile[i])
      np->ofile[i] = filedup(p->ofile[i]);
    802027b6:	00002097          	auipc	ra,0x2
    802027ba:	818080e7          	jalr	-2024(ra) # 80203fce <filedup>
    802027be:	009a07b3          	add	a5,s4,s1
    802027c2:	e388                	sd	a0,0(a5)
  for (i = 0; i < NOFILE; i++)
    802027c4:	04a1                	addi	s1,s1,8
    802027c6:	01348763          	beq	s1,s3,802027d4 <clone+0xd4>
    if (p->ofile[i])
    802027ca:	009907b3          	add	a5,s2,s1
    802027ce:	6388                	ld	a0,0(a5)
    802027d0:	f17d                	bnez	a0,802027b6 <clone+0xb6>
    802027d2:	bfcd                	j	802027c4 <clone+0xc4>
  np->cwd = edup(p->cwd);
    802027d4:	4d893503          	ld	a0,1240(s2)
    802027d8:	00005097          	auipc	ra,0x5
    802027dc:	bfc080e7          	jalr	-1028(ra) # 802073d4 <edup>
    802027e0:	4caa3c23          	sd	a0,1240(s4)

  safestrcpy(np->name, p->name, sizeof(p->name));
    802027e4:	4641                	li	a2,16
    802027e6:	4e090593          	addi	a1,s2,1248
    802027ea:	4e0a0513          	addi	a0,s4,1248
    802027ee:	ffffe097          	auipc	ra,0xffffe
    802027f2:	0cc080e7          	jalr	204(ra) # 802008ba <safestrcpy>

  pid = np->pid;
    802027f6:	038a2483          	lw	s1,56(s4)

  np->state = RUNNABLE;
    802027fa:	4789                	li	a5,2
    802027fc:	00fa2c23          	sw	a5,24(s4)

  release(&np->lock);
    80202800:	8552                	mv	a0,s4
    80202802:	ffffe097          	auipc	ra,0xffffe
    80202806:	f1a080e7          	jalr	-230(ra) # 8020071c <release>

  return pid;
}
    8020280a:	8526                	mv	a0,s1
    8020280c:	70a2                	ld	ra,40(sp)
    8020280e:	7402                	ld	s0,32(sp)
    80202810:	64e2                	ld	s1,24(sp)
    80202812:	6942                	ld	s2,16(sp)
    80202814:	69a2                	ld	s3,8(sp)
    80202816:	6a02                	ld	s4,0(sp)
    80202818:	6145                	addi	sp,sp,48
    8020281a:	8082                	ret
    return -1;
    8020281c:	54fd                	li	s1,-1
    8020281e:	b7f5                	j	8020280a <clone+0x10a>

0000000080202820 <waitpid>:
 * @addr:address to store return status of child process
 * @options:default 0
 * @return:pid of child process;-1 means failure
 */
int waitpid(int cpid, uint64 addr, int options)
{
    80202820:	711d                	addi	sp,sp,-96
    80202822:	ec86                	sd	ra,88(sp)
    80202824:	e8a2                	sd	s0,80(sp)
    80202826:	e4a6                	sd	s1,72(sp)
    80202828:	e0ca                	sd	s2,64(sp)
    8020282a:	fc4e                	sd	s3,56(sp)
    8020282c:	f852                	sd	s4,48(sp)
    8020282e:	f456                	sd	s5,40(sp)
    80202830:	f05a                	sd	s6,32(sp)
    80202832:	ec5e                	sd	s7,24(sp)
    80202834:	e862                	sd	s8,16(sp)
    80202836:	e466                	sd	s9,8(sp)
    80202838:	1080                	addi	s0,sp,96
    8020283a:	8c2e                	mv	s8,a1
  if (cpid == -1) // wait for any child
    8020283c:	57fd                	li	a5,-1
    8020283e:	02f51663          	bne	a0,a5,8020286a <waitpid+0x4a>
  {
    return wait(addr);
    80202842:	852e                	mv	a0,a1
    80202844:	00000097          	auipc	ra,0x0
    80202848:	b30080e7          	jalr	-1232(ra) # 80202374 <wait>
    8020284c:	89aa                	mv	s3,a0

    // Wait for a child to exit.
    sleep(p, &p->lock); // DOC: wait-sleep

  }
}
    8020284e:	854e                	mv	a0,s3
    80202850:	60e6                	ld	ra,88(sp)
    80202852:	6446                	ld	s0,80(sp)
    80202854:	64a6                	ld	s1,72(sp)
    80202856:	6906                	ld	s2,64(sp)
    80202858:	79e2                	ld	s3,56(sp)
    8020285a:	7a42                	ld	s4,48(sp)
    8020285c:	7aa2                	ld	s5,40(sp)
    8020285e:	7b02                	ld	s6,32(sp)
    80202860:	6be2                	ld	s7,24(sp)
    80202862:	6c42                	ld	s8,16(sp)
    80202864:	6ca2                	ld	s9,8(sp)
    80202866:	6125                	addi	sp,sp,96
    80202868:	8082                	ret
    8020286a:	8aaa                	mv	s5,a0
  struct proc *p = myproc();
    8020286c:	fffff097          	auipc	ra,0xfffff
    80202870:	1f4080e7          	jalr	500(ra) # 80201a60 <myproc>
    80202874:	892a                	mv	s2,a0
  acquire(&p->lock);
    80202876:	8caa                	mv	s9,a0
    80202878:	ffffe097          	auipc	ra,0xffffe
    8020287c:	e50080e7          	jalr	-432(ra) # 802006c8 <acquire>
        if (pp->state == ZOMBIE)
    80202880:	4b11                	li	s6,4
    for (pp = proc; pp < &proc[NPROC]; pp++)
    80202882:	6985                	lui	s3,0x1
    80202884:	80098993          	addi	s3,s3,-2048 # 800 <_entry-0x801ff800>
    80202888:	0002ea17          	auipc	s4,0x2e
    8020288c:	8f8a0a13          	addi	s4,s4,-1800 # 80230180 <bcache>
        havekids = 1;
    80202890:	4b85                	li	s7,1
    80202892:	a879                	j	80202930 <waitpid+0x110>
          pid = pp->pid;
    80202894:	0384a983          	lw	s3,56(s1)
          if (addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
    80202898:	000c0e63          	beqz	s8,802028b4 <waitpid+0x94>
    8020289c:	4691                	li	a3,4
    8020289e:	03448613          	addi	a2,s1,52
    802028a2:	85e2                	mv	a1,s8
    802028a4:	05093503          	ld	a0,80(s2)
    802028a8:	fffff097          	auipc	ra,0xfffff
    802028ac:	a48080e7          	jalr	-1464(ra) # 802012f0 <copyout>
    802028b0:	02054263          	bltz	a0,802028d4 <waitpid+0xb4>
          freeproc(pp);
    802028b4:	8526                	mv	a0,s1
    802028b6:	fffff097          	auipc	ra,0xfffff
    802028ba:	37c080e7          	jalr	892(ra) # 80201c32 <freeproc>
          release(&pp->lock);
    802028be:	8526                	mv	a0,s1
    802028c0:	ffffe097          	auipc	ra,0xffffe
    802028c4:	e5c080e7          	jalr	-420(ra) # 8020071c <release>
          release(&p->lock);
    802028c8:	854a                	mv	a0,s2
    802028ca:	ffffe097          	auipc	ra,0xffffe
    802028ce:	e52080e7          	jalr	-430(ra) # 8020071c <release>
          return pid;
    802028d2:	bfb5                	j	8020284e <waitpid+0x2e>
            release(&pp->lock);
    802028d4:	8526                	mv	a0,s1
    802028d6:	ffffe097          	auipc	ra,0xffffe
    802028da:	e46080e7          	jalr	-442(ra) # 8020071c <release>
            release(&p->lock);
    802028de:	854a                	mv	a0,s2
    802028e0:	ffffe097          	auipc	ra,0xffffe
    802028e4:	e3c080e7          	jalr	-452(ra) # 8020071c <release>
            return -1;
    802028e8:	59fd                	li	s3,-1
    802028ea:	b795                	j	8020284e <waitpid+0x2e>
    for (pp = proc; pp < &proc[NPROC]; pp++)
    802028ec:	94ce                	add	s1,s1,s3
    802028ee:	03448763          	beq	s1,s4,8020291c <waitpid+0xfc>
      if (pp->parent == p && pp->pid == cpid)
    802028f2:	709c                	ld	a5,32(s1)
    802028f4:	ff279ce3          	bne	a5,s2,802028ec <waitpid+0xcc>
    802028f8:	5c9c                	lw	a5,56(s1)
    802028fa:	ff5799e3          	bne	a5,s5,802028ec <waitpid+0xcc>
        acquire(&pp->lock);
    802028fe:	8526                	mv	a0,s1
    80202900:	ffffe097          	auipc	ra,0xffffe
    80202904:	dc8080e7          	jalr	-568(ra) # 802006c8 <acquire>
        if (pp->state == ZOMBIE)
    80202908:	4c9c                	lw	a5,24(s1)
    8020290a:	f96785e3          	beq	a5,s6,80202894 <waitpid+0x74>
        release(&pp->lock);
    8020290e:	8526                	mv	a0,s1
    80202910:	ffffe097          	auipc	ra,0xffffe
    80202914:	e0c080e7          	jalr	-500(ra) # 8020071c <release>
        havekids = 1;
    80202918:	875e                	mv	a4,s7
    8020291a:	bfc9                	j	802028ec <waitpid+0xcc>
    if (!havekids || p->killed)
    8020291c:	c305                	beqz	a4,8020293c <waitpid+0x11c>
    8020291e:	03092783          	lw	a5,48(s2)
    80202922:	ef89                	bnez	a5,8020293c <waitpid+0x11c>
    sleep(p, &p->lock); // DOC: wait-sleep
    80202924:	85e6                	mv	a1,s9
    80202926:	854a                	mv	a0,s2
    80202928:	00000097          	auipc	ra,0x0
    8020292c:	9ce080e7          	jalr	-1586(ra) # 802022f6 <sleep>
    havekids = 0;
    80202930:	4701                	li	a4,0
    for (pp = proc; pp < &proc[NPROC]; pp++)
    80202932:	00015497          	auipc	s1,0x15
    80202936:	84e48493          	addi	s1,s1,-1970 # 80217180 <proc>
    8020293a:	bf65                	j	802028f2 <waitpid+0xd2>
      release(&p->lock);
    8020293c:	854a                	mv	a0,s2
    8020293e:	ffffe097          	auipc	ra,0xffffe
    80202942:	dde080e7          	jalr	-546(ra) # 8020071c <release>
      panic("current process do not have child process [cpid]");
    80202946:	00008517          	auipc	a0,0x8
    8020294a:	d8a50513          	addi	a0,a0,-630 # 8020a6d0 <digits+0x350>
    8020294e:	ffffd097          	auipc	ra,0xffffd
    80202952:	7f4080e7          	jalr	2036(ra) # 80200142 <panic>

0000000080202956 <swtch>:
    80202956:	00153023          	sd	ra,0(a0)
    8020295a:	00253423          	sd	sp,8(a0)
    8020295e:	e900                	sd	s0,16(a0)
    80202960:	ed04                	sd	s1,24(a0)
    80202962:	03253023          	sd	s2,32(a0)
    80202966:	03353423          	sd	s3,40(a0)
    8020296a:	03453823          	sd	s4,48(a0)
    8020296e:	03553c23          	sd	s5,56(a0)
    80202972:	05653023          	sd	s6,64(a0)
    80202976:	05753423          	sd	s7,72(a0)
    8020297a:	05853823          	sd	s8,80(a0)
    8020297e:	05953c23          	sd	s9,88(a0)
    80202982:	07a53023          	sd	s10,96(a0)
    80202986:	07b53423          	sd	s11,104(a0)
    8020298a:	0005b083          	ld	ra,0(a1)
    8020298e:	0085b103          	ld	sp,8(a1)
    80202992:	6980                	ld	s0,16(a1)
    80202994:	6d84                	ld	s1,24(a1)
    80202996:	0205b903          	ld	s2,32(a1)
    8020299a:	0285b983          	ld	s3,40(a1)
    8020299e:	0305ba03          	ld	s4,48(a1)
    802029a2:	0385ba83          	ld	s5,56(a1)
    802029a6:	0405bb03          	ld	s6,64(a1)
    802029aa:	0485bb83          	ld	s7,72(a1)
    802029ae:	0505bc03          	ld	s8,80(a1)
    802029b2:	0585bc83          	ld	s9,88(a1)
    802029b6:	0605bd03          	ld	s10,96(a1)
    802029ba:	0685bd83          	ld	s11,104(a1)
    802029be:	8082                	ret

00000000802029c0 <trapinithart>:
// }

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    802029c0:	1141                	addi	sp,sp,-16
    802029c2:	e406                	sd	ra,8(sp)
    802029c4:	e022                	sd	s0,0(sp)
    802029c6:	0800                	addi	s0,sp,16
  asm volatile("csrw stvec, %0" : : "r" (x));
    802029c8:	0000b797          	auipc	a5,0xb
    802029cc:	7087b783          	ld	a5,1800(a5) # 8020e0d0 <_GLOBAL_OFFSET_TABLE_+0x20>
    802029d0:	10579073          	csrw	stvec,a5
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802029d4:	100027f3          	csrr	a5,sstatus
  w_stvec((uint64)kernelvec);
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    802029d8:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802029dc:	10079073          	csrw	sstatus,a5
  asm volatile("csrr %0, sie" : "=r" (x) );
    802029e0:	104027f3          	csrr	a5,sie
  // enable supervisor-mode timer interrupts.
  w_sie(r_sie() | SIE_SEIE | SIE_SSIE | SIE_STIE);
    802029e4:	2227e793          	ori	a5,a5,546
  asm volatile("csrw sie, %0" : : "r" (x));
    802029e8:	10479073          	csrw	sie,a5
  set_next_timeout();
    802029ec:	00004097          	auipc	ra,0x4
    802029f0:	a3a080e7          	jalr	-1478(ra) # 80206426 <set_next_timeout>
  #ifdef DEBUG
  printf("trapinithart\n");
  #endif
}
    802029f4:	60a2                	ld	ra,8(sp)
    802029f6:	6402                	ld	s0,0(sp)
    802029f8:	0141                	addi	sp,sp,16
    802029fa:	8082                	ret

00000000802029fc <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    802029fc:	1141                	addi	sp,sp,-16
    802029fe:	e406                	sd	ra,8(sp)
    80202a00:	e022                	sd	s0,0(sp)
    80202a02:	0800                	addi	s0,sp,16
  struct proc *p = myproc();
    80202a04:	fffff097          	auipc	ra,0xfffff
    80202a08:	05c080e7          	jalr	92(ra) # 80201a60 <myproc>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202a0c:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80202a10:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202a12:	10079073          	csrw	sstatus,a5
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    80202a16:	0000b617          	auipc	a2,0xb
    80202a1a:	6a263603          	ld	a2,1698(a2) # 8020e0b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80202a1e:	0000b697          	auipc	a3,0xb
    80202a22:	6d26b683          	ld	a3,1746(a3) # 8020e0f0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80202a26:	8e91                	sub	a3,a3,a2
    80202a28:	040007b7          	lui	a5,0x4000
    80202a2c:	17fd                	addi	a5,a5,-1
    80202a2e:	07b2                	slli	a5,a5,0xc
    80202a30:	96be                	add	a3,a3,a5
  asm volatile("csrw stvec, %0" : : "r" (x));
    80202a32:	10569073          	csrw	stvec,a3

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80202a36:	7138                	ld	a4,96(a0)
  asm volatile("csrr %0, satp" : "=r" (x) );
    80202a38:	180026f3          	csrr	a3,satp
    80202a3c:	e314                	sd	a3,0(a4)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80202a3e:	7138                	ld	a4,96(a0)
    80202a40:	6134                	ld	a3,64(a0)
    80202a42:	6585                	lui	a1,0x1
    80202a44:	96ae                	add	a3,a3,a1
    80202a46:	e714                	sd	a3,8(a4)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80202a48:	7138                	ld	a4,96(a0)
    80202a4a:	00000697          	auipc	a3,0x0
    80202a4e:	0f468693          	addi	a3,a3,244 # 80202b3e <usertrap>
    80202a52:	eb14                	sd	a3,16(a4)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80202a54:	7138                	ld	a4,96(a0)
  asm volatile("mv %0, tp" : "=r" (x) );
    80202a56:	8692                	mv	a3,tp
    80202a58:	f314                	sd	a3,32(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202a5a:	100026f3          	csrr	a3,sstatus
  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80202a5e:	eff6f693          	andi	a3,a3,-257
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80202a62:	0206e693          	ori	a3,a3,32
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202a66:	10069073          	csrw	sstatus,a3
  w_sstatus(x);

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80202a6a:	7138                	ld	a4,96(a0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80202a6c:	6f18                	ld	a4,24(a4)
    80202a6e:	14171073          	csrw	sepc,a4

  // tell trampoline.S the user page table to switch to.
  // printf("[usertrapret]p->pagetable: %p\n", p->pagetable);
  uint64 satp = MAKE_SATP(p->pagetable);
    80202a72:	692c                	ld	a1,80(a0)
    80202a74:	81b1                	srli	a1,a1,0xc

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    80202a76:	0000b717          	auipc	a4,0xb
    80202a7a:	65273703          	ld	a4,1618(a4) # 8020e0c8 <_GLOBAL_OFFSET_TABLE_+0x18>
    80202a7e:	8f11                	sub	a4,a4,a2
    80202a80:	97ba                	add	a5,a5,a4
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    80202a82:	577d                	li	a4,-1
    80202a84:	177e                	slli	a4,a4,0x3f
    80202a86:	8dd9                	or	a1,a1,a4
    80202a88:	02000537          	lui	a0,0x2000
    80202a8c:	157d                	addi	a0,a0,-1
    80202a8e:	0536                	slli	a0,a0,0xd
    80202a90:	9782                	jalr	a5
}
    80202a92:	60a2                	ld	ra,8(sp)
    80202a94:	6402                	ld	s0,0(sp)
    80202a96:	0141                	addi	sp,sp,16
    80202a98:	8082                	ret

0000000080202a9a <devintr>:
// Check if it's an external/software interrupt, 
// and handle it. 
// returns  2 if timer interrupt, 
//          1 if other device, 
//          0 if not recognized. 
int devintr(void) {
    80202a9a:	1101                	addi	sp,sp,-32
    80202a9c:	ec06                	sd	ra,24(sp)
    80202a9e:	e822                	sd	s0,16(sp)
    80202aa0:	e426                	sd	s1,8(sp)
    80202aa2:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202aa4:	14202773          	csrr	a4,scause
	uint64 scause = r_scause();

	#ifdef QEMU 
	// handle external interrupt 
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    80202aa8:	00074d63          	bltz	a4,80202ac2 <devintr+0x28>
		sbi_set_mie();
		#endif 

		return 1;
	}
	else if (0x8000000000000005L == scause) {
    80202aac:	57fd                	li	a5,-1
    80202aae:	17fe                	slli	a5,a5,0x3f
    80202ab0:	0795                	addi	a5,a5,5
		timer_tick();
		return 2;
	}
	else { return 0;}
    80202ab2:	4501                	li	a0,0
	else if (0x8000000000000005L == scause) {
    80202ab4:	06f70f63          	beq	a4,a5,80202b32 <devintr+0x98>
}
    80202ab8:	60e2                	ld	ra,24(sp)
    80202aba:	6442                	ld	s0,16(sp)
    80202abc:	64a2                	ld	s1,8(sp)
    80202abe:	6105                	addi	sp,sp,32
    80202ac0:	8082                	ret
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    80202ac2:	0ff77793          	andi	a5,a4,255
    80202ac6:	46a5                	li	a3,9
    80202ac8:	fed792e3          	bne	a5,a3,80202aac <devintr+0x12>
		int irq = plic_claim();
    80202acc:	00005097          	auipc	ra,0x5
    80202ad0:	406080e7          	jalr	1030(ra) # 80207ed2 <plic_claim>
    80202ad4:	84aa                	mv	s1,a0
		if (UART_IRQ == irq) {
    80202ad6:	47a9                	li	a5,10
    80202ad8:	02f50163          	beq	a0,a5,80202afa <devintr+0x60>
		else if (DISK_IRQ == irq) {
    80202adc:	4785                	li	a5,1
    80202ade:	04f50563          	beq	a0,a5,80202b28 <devintr+0x8e>
		return 1;
    80202ae2:	4505                	li	a0,1
		else if (irq) {
    80202ae4:	d8f1                	beqz	s1,80202ab8 <devintr+0x1e>
			printf("unexpected interrupt irq = %d\n", irq);
    80202ae6:	85a6                	mv	a1,s1
    80202ae8:	00008517          	auipc	a0,0x8
    80202aec:	c4850513          	addi	a0,a0,-952 # 8020a730 <digits+0x3b0>
    80202af0:	ffffd097          	auipc	ra,0xffffd
    80202af4:	69c080e7          	jalr	1692(ra) # 8020018c <printf>
    80202af8:	a821                	j	80202b10 <devintr+0x76>
	return SBI_CALL_0(SBI_CONSOLE_GETCHAR);
    80202afa:	4501                	li	a0,0
    80202afc:	4581                	li	a1,0
    80202afe:	4601                	li	a2,0
    80202b00:	4681                	li	a3,0
    80202b02:	4889                	li	a7,2
    80202b04:	00000073          	ecall
    80202b08:	2501                	sext.w	a0,a0
			if (-1 != c) {
    80202b0a:	57fd                	li	a5,-1
    80202b0c:	00f51963          	bne	a0,a5,80202b1e <devintr+0x84>
		if (irq) { plic_complete(irq);}
    80202b10:	8526                	mv	a0,s1
    80202b12:	00005097          	auipc	ra,0x5
    80202b16:	3ea080e7          	jalr	1002(ra) # 80207efc <plic_complete>
		return 1;
    80202b1a:	4505                	li	a0,1
    80202b1c:	bf71                	j	80202ab8 <devintr+0x1e>
				consoleintr(c);
    80202b1e:	00005097          	auipc	ra,0x5
    80202b22:	5f6080e7          	jalr	1526(ra) # 80208114 <consoleintr>
    80202b26:	b7ed                	j	80202b10 <devintr+0x76>
			disk_intr();
    80202b28:	00004097          	auipc	ra,0x4
    80202b2c:	9be080e7          	jalr	-1602(ra) # 802064e6 <disk_intr>
    80202b30:	b7c5                	j	80202b10 <devintr+0x76>
		timer_tick();
    80202b32:	00004097          	auipc	ra,0x4
    80202b36:	91a080e7          	jalr	-1766(ra) # 8020644c <timer_tick>
		return 2;
    80202b3a:	4509                	li	a0,2
    80202b3c:	bfb5                	j	80202ab8 <devintr+0x1e>

0000000080202b3e <usertrap>:
{
    80202b3e:	7179                	addi	sp,sp,-48
    80202b40:	f406                	sd	ra,40(sp)
    80202b42:	f022                	sd	s0,32(sp)
    80202b44:	ec26                	sd	s1,24(sp)
    80202b46:	e84a                	sd	s2,16(sp)
    80202b48:	e44e                	sd	s3,8(sp)
    80202b4a:	1800                	addi	s0,sp,48
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202b4c:	100027f3          	csrr	a5,sstatus
  if((r_sstatus() & SSTATUS_SPP) != 0)
    80202b50:	1007f793          	andi	a5,a5,256
    80202b54:	e3a9                	bnez	a5,80202b96 <usertrap+0x58>
  asm volatile("csrw stvec, %0" : : "r" (x));
    80202b56:	0000b797          	auipc	a5,0xb
    80202b5a:	57a7b783          	ld	a5,1402(a5) # 8020e0d0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80202b5e:	10579073          	csrw	stvec,a5
  struct proc *p = myproc();
    80202b62:	fffff097          	auipc	ra,0xfffff
    80202b66:	efe080e7          	jalr	-258(ra) # 80201a60 <myproc>
    80202b6a:	84aa                	mv	s1,a0
  p->trapframe->epc = r_sepc();
    80202b6c:	713c                	ld	a5,96(a0)
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202b6e:	14102773          	csrr	a4,sepc
    80202b72:	ef98                	sd	a4,24(a5)
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202b74:	14202773          	csrr	a4,scause
  if(r_scause() == 8){
    80202b78:	47a1                	li	a5,8
    80202b7a:	02f70663          	beq	a4,a5,80202ba6 <usertrap+0x68>
    80202b7e:	14202773          	csrr	a4,scause
  else if(r_scause()==0xd)
    80202b82:	47b5                	li	a5,13
    80202b84:	0ef71863          	bne	a4,a5,80202c74 <usertrap+0x136>
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202b88:	143025f3          	csrr	a1,stval
    for(int i=0;i<VMA_MAX;i++)
    80202b8c:	4f850793          	addi	a5,a0,1272
    80202b90:	4681                	li	a3,0
    80202b92:	4841                	li	a6,16
    80202b94:	a08d                	j	80202bf6 <usertrap+0xb8>
    panic("usertrap: not from user mode");
    80202b96:	00008517          	auipc	a0,0x8
    80202b9a:	bba50513          	addi	a0,a0,-1094 # 8020a750 <digits+0x3d0>
    80202b9e:	ffffd097          	auipc	ra,0xffffd
    80202ba2:	5a4080e7          	jalr	1444(ra) # 80200142 <panic>
    if(p->killed)
    80202ba6:	591c                	lw	a5,48(a0)
    80202ba8:	ef85                	bnez	a5,80202be0 <usertrap+0xa2>
    p->trapframe->epc += 4;
    80202baa:	70b8                	ld	a4,96(s1)
    80202bac:	6f1c                	ld	a5,24(a4)
    80202bae:	0791                	addi	a5,a5,4
    80202bb0:	ef1c                	sd	a5,24(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202bb2:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202bb6:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202bba:	10079073          	csrw	sstatus,a5
    syscall();
    80202bbe:	00000097          	auipc	ra,0x0
    80202bc2:	65e080e7          	jalr	1630(ra) # 8020321c <syscall>
  if(p->killed)
    80202bc6:	589c                	lw	a5,48(s1)
    80202bc8:	ebfd                	bnez	a5,80202cbe <usertrap+0x180>
  usertrapret();
    80202bca:	00000097          	auipc	ra,0x0
    80202bce:	e32080e7          	jalr	-462(ra) # 802029fc <usertrapret>
}
    80202bd2:	70a2                	ld	ra,40(sp)
    80202bd4:	7402                	ld	s0,32(sp)
    80202bd6:	64e2                	ld	s1,24(sp)
    80202bd8:	6942                	ld	s2,16(sp)
    80202bda:	69a2                	ld	s3,8(sp)
    80202bdc:	6145                	addi	sp,sp,48
    80202bde:	8082                	ret
      exit(-1);
    80202be0:	557d                	li	a0,-1
    80202be2:	fffff097          	auipc	ra,0xfffff
    80202be6:	5ee080e7          	jalr	1518(ra) # 802021d0 <exit>
    80202bea:	b7c1                	j	80202baa <usertrap+0x6c>
    for(int i=0;i<VMA_MAX;i++)
    80202bec:	2685                	addiw	a3,a3,1
    80202bee:	03078793          	addi	a5,a5,48
    80202bf2:	0f068463          	beq	a3,a6,80202cda <usertrap+0x19c>
      if(p->vma[i].addr <= va && va <= p->vma[i].addr+p->vma[i].len-1  && p->vma[i].valid)
    80202bf6:	6798                	ld	a4,8(a5)
    80202bf8:	fee5eae3          	bltu	a1,a4,80202bec <usertrap+0xae>
    80202bfc:	4b90                	lw	a2,16(a5)
    80202bfe:	177d                	addi	a4,a4,-1
    80202c00:	9732                	add	a4,a4,a2
    80202c02:	feb765e3          	bltu	a4,a1,80202bec <usertrap+0xae>
    80202c06:	4398                	lw	a4,0(a5)
    80202c08:	d375                	beqz	a4,80202bec <usertrap+0xae>
        v=p->vma+i;
    80202c0a:	4f848913          	addi	s2,s1,1272
    80202c0e:	00169793          	slli	a5,a3,0x1
    80202c12:	96be                	add	a3,a3,a5
    80202c14:	0692                	slli	a3,a3,0x4
    80202c16:	9936                	add	s2,s2,a3
    uint64 pa=(uint64)kalloc();       // 物理地址
    80202c18:	ffffe097          	auipc	ra,0xffffe
    80202c1c:	944080e7          	jalr	-1724(ra) # 8020055c <kalloc>
    80202c20:	89aa                	mv	s3,a0
    memset((void*)pa,0,PGSIZE);
    80202c22:	6605                	lui	a2,0x1
    80202c24:	4581                	li	a1,0
    80202c26:	ffffe097          	auipc	ra,0xffffe
    80202c2a:	b3e080e7          	jalr	-1218(ra) # 80200764 <memset>
    if(mappages(p->pagetable, v->addr, PGSIZE, pa, v->prot) != 0)
    80202c2e:	01492703          	lw	a4,20(s2)
    80202c32:	86ce                	mv	a3,s3
    80202c34:	6605                	lui	a2,0x1
    80202c36:	00893583          	ld	a1,8(s2)
    80202c3a:	68a8                	ld	a0,80(s1)
    80202c3c:	ffffe097          	auipc	ra,0xffffe
    80202c40:	03a080e7          	jalr	58(ra) # 80200c76 <mappages>
    80202c44:	e105                	bnez	a0,80202c64 <usertrap+0x126>
    eread(v->f->ep,1,v->addr,v->off,v->len);
    80202c46:	02093783          	ld	a5,32(s2)
    80202c4a:	01092703          	lw	a4,16(s2)
    80202c4e:	01c92683          	lw	a3,28(s2)
    80202c52:	00893603          	ld	a2,8(s2)
    80202c56:	4585                	li	a1,1
    80202c58:	6f88                	ld	a0,24(a5)
    80202c5a:	00004097          	auipc	ra,0x4
    80202c5e:	0ee080e7          	jalr	238(ra) # 80206d48 <eread>
    80202c62:	b795                	j	80202bc6 <usertrap+0x88>
      panic("mmap: mappages user pagetable error\n");
    80202c64:	00008517          	auipc	a0,0x8
    80202c68:	b0c50513          	addi	a0,a0,-1268 # 8020a770 <digits+0x3f0>
    80202c6c:	ffffd097          	auipc	ra,0xffffd
    80202c70:	4d6080e7          	jalr	1238(ra) # 80200142 <panic>
  else if((which_dev = devintr()) != 0){
    80202c74:	00000097          	auipc	ra,0x0
    80202c78:	e26080e7          	jalr	-474(ra) # 80202a9a <devintr>
    80202c7c:	892a                	mv	s2,a0
    80202c7e:	c501                	beqz	a0,80202c86 <usertrap+0x148>
  if(p->killed)
    80202c80:	589c                	lw	a5,48(s1)
    80202c82:	c7a1                	beqz	a5,80202cca <usertrap+0x18c>
    80202c84:	a835                	j	80202cc0 <usertrap+0x182>
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202c86:	142025f3          	csrr	a1,scause
    printf("\nusertrap(): unexpected scause %p pid=%d %s\n", r_scause(), p->pid, p->name);
    80202c8a:	4e048693          	addi	a3,s1,1248
    80202c8e:	5c90                	lw	a2,56(s1)
    80202c90:	00008517          	auipc	a0,0x8
    80202c94:	b0850513          	addi	a0,a0,-1272 # 8020a798 <digits+0x418>
    80202c98:	ffffd097          	auipc	ra,0xffffd
    80202c9c:	4f4080e7          	jalr	1268(ra) # 8020018c <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202ca0:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202ca4:	14302673          	csrr	a2,stval
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80202ca8:	00008517          	auipc	a0,0x8
    80202cac:	b2050513          	addi	a0,a0,-1248 # 8020a7c8 <digits+0x448>
    80202cb0:	ffffd097          	auipc	ra,0xffffd
    80202cb4:	4dc080e7          	jalr	1244(ra) # 8020018c <printf>
    p->killed = 1;
    80202cb8:	4785                	li	a5,1
    80202cba:	d89c                	sw	a5,48(s1)
  if(p->killed)
    80202cbc:	a011                	j	80202cc0 <usertrap+0x182>
    80202cbe:	4901                	li	s2,0
    exit(-1);
    80202cc0:	557d                	li	a0,-1
    80202cc2:	fffff097          	auipc	ra,0xfffff
    80202cc6:	50e080e7          	jalr	1294(ra) # 802021d0 <exit>
  if(which_dev == 2)
    80202cca:	4789                	li	a5,2
    80202ccc:	eef91fe3          	bne	s2,a5,80202bca <usertrap+0x8c>
    yield();
    80202cd0:	fffff097          	auipc	ra,0xfffff
    80202cd4:	5ea080e7          	jalr	1514(ra) # 802022ba <yield>
    80202cd8:	bdcd                	j	80202bca <usertrap+0x8c>
    if(!v) panic("usertrap : no available vma found\n");
    80202cda:	00008517          	auipc	a0,0x8
    80202cde:	b0e50513          	addi	a0,a0,-1266 # 8020a7e8 <digits+0x468>
    80202ce2:	ffffd097          	auipc	ra,0xffffd
    80202ce6:	460080e7          	jalr	1120(ra) # 80200142 <panic>

0000000080202cea <kerneltrap>:
kerneltrap() {
    80202cea:	7179                	addi	sp,sp,-48
    80202cec:	f406                	sd	ra,40(sp)
    80202cee:	f022                	sd	s0,32(sp)
    80202cf0:	ec26                	sd	s1,24(sp)
    80202cf2:	e84a                	sd	s2,16(sp)
    80202cf4:	e44e                	sd	s3,8(sp)
    80202cf6:	1800                	addi	s0,sp,48
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202cf8:	14102973          	csrr	s2,sepc
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202cfc:	100024f3          	csrr	s1,sstatus
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202d00:	142029f3          	csrr	s3,scause
  if((sstatus & SSTATUS_SPP) == 0)
    80202d04:	1004f793          	andi	a5,s1,256
    80202d08:	cb85                	beqz	a5,80202d38 <kerneltrap+0x4e>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202d0a:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80202d0e:	8b89                	andi	a5,a5,2
  if(intr_get() != 0)
    80202d10:	ef85                	bnez	a5,80202d48 <kerneltrap+0x5e>
  if((which_dev = devintr()) == 0){
    80202d12:	00000097          	auipc	ra,0x0
    80202d16:	d88080e7          	jalr	-632(ra) # 80202a9a <devintr>
    80202d1a:	cd1d                	beqz	a0,80202d58 <kerneltrap+0x6e>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202d1c:	4789                	li	a5,2
    80202d1e:	08f50b63          	beq	a0,a5,80202db4 <kerneltrap+0xca>
  asm volatile("csrw sepc, %0" : : "r" (x));
    80202d22:	14191073          	csrw	sepc,s2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202d26:	10049073          	csrw	sstatus,s1
}
    80202d2a:	70a2                	ld	ra,40(sp)
    80202d2c:	7402                	ld	s0,32(sp)
    80202d2e:	64e2                	ld	s1,24(sp)
    80202d30:	6942                	ld	s2,16(sp)
    80202d32:	69a2                	ld	s3,8(sp)
    80202d34:	6145                	addi	sp,sp,48
    80202d36:	8082                	ret
    panic("kerneltrap: not from supervisor mode");
    80202d38:	00008517          	auipc	a0,0x8
    80202d3c:	ad850513          	addi	a0,a0,-1320 # 8020a810 <digits+0x490>
    80202d40:	ffffd097          	auipc	ra,0xffffd
    80202d44:	402080e7          	jalr	1026(ra) # 80200142 <panic>
    panic("kerneltrap: interrupts enabled");
    80202d48:	00008517          	auipc	a0,0x8
    80202d4c:	af050513          	addi	a0,a0,-1296 # 8020a838 <digits+0x4b8>
    80202d50:	ffffd097          	auipc	ra,0xffffd
    80202d54:	3f2080e7          	jalr	1010(ra) # 80200142 <panic>
    printf("\nscause %p\n", scause);
    80202d58:	85ce                	mv	a1,s3
    80202d5a:	00008517          	auipc	a0,0x8
    80202d5e:	afe50513          	addi	a0,a0,-1282 # 8020a858 <digits+0x4d8>
    80202d62:	ffffd097          	auipc	ra,0xffffd
    80202d66:	42a080e7          	jalr	1066(ra) # 8020018c <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202d6a:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202d6e:	14302673          	csrr	a2,stval
  asm volatile("mv %0, tp" : "=r" (x) );
    80202d72:	8692                	mv	a3,tp
    printf("sepc=%p stval=%p hart=%d\n", r_sepc(), r_stval(), r_tp());
    80202d74:	00008517          	auipc	a0,0x8
    80202d78:	af450513          	addi	a0,a0,-1292 # 8020a868 <digits+0x4e8>
    80202d7c:	ffffd097          	auipc	ra,0xffffd
    80202d80:	410080e7          	jalr	1040(ra) # 8020018c <printf>
    struct proc *p = myproc();
    80202d84:	fffff097          	auipc	ra,0xfffff
    80202d88:	cdc080e7          	jalr	-804(ra) # 80201a60 <myproc>
    if (p != 0) {
    80202d8c:	cd01                	beqz	a0,80202da4 <kerneltrap+0xba>
      printf("pid: %d, name: %s\n", p->pid, p->name);
    80202d8e:	4e050613          	addi	a2,a0,1248
    80202d92:	5d0c                	lw	a1,56(a0)
    80202d94:	00008517          	auipc	a0,0x8
    80202d98:	af450513          	addi	a0,a0,-1292 # 8020a888 <digits+0x508>
    80202d9c:	ffffd097          	auipc	ra,0xffffd
    80202da0:	3f0080e7          	jalr	1008(ra) # 8020018c <printf>
    panic("kerneltrap");
    80202da4:	00008517          	auipc	a0,0x8
    80202da8:	afc50513          	addi	a0,a0,-1284 # 8020a8a0 <digits+0x520>
    80202dac:	ffffd097          	auipc	ra,0xffffd
    80202db0:	396080e7          	jalr	918(ra) # 80200142 <panic>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202db4:	fffff097          	auipc	ra,0xfffff
    80202db8:	cac080e7          	jalr	-852(ra) # 80201a60 <myproc>
    80202dbc:	d13d                	beqz	a0,80202d22 <kerneltrap+0x38>
    80202dbe:	fffff097          	auipc	ra,0xfffff
    80202dc2:	ca2080e7          	jalr	-862(ra) # 80201a60 <myproc>
    80202dc6:	4d18                	lw	a4,24(a0)
    80202dc8:	478d                	li	a5,3
    80202dca:	f4f71ce3          	bne	a4,a5,80202d22 <kerneltrap+0x38>
    yield();
    80202dce:	fffff097          	auipc	ra,0xfffff
    80202dd2:	4ec080e7          	jalr	1260(ra) # 802022ba <yield>
    80202dd6:	b7b1                	j	80202d22 <kerneltrap+0x38>

0000000080202dd8 <trapframedump>:

void trapframedump(struct trapframe *tf)
{
    80202dd8:	1101                	addi	sp,sp,-32
    80202dda:	ec06                	sd	ra,24(sp)
    80202ddc:	e822                	sd	s0,16(sp)
    80202dde:	e426                	sd	s1,8(sp)
    80202de0:	1000                	addi	s0,sp,32
    80202de2:	84aa                	mv	s1,a0
  printf("a0: %p\t", tf->a0);
    80202de4:	792c                	ld	a1,112(a0)
    80202de6:	00008517          	auipc	a0,0x8
    80202dea:	aca50513          	addi	a0,a0,-1334 # 8020a8b0 <digits+0x530>
    80202dee:	ffffd097          	auipc	ra,0xffffd
    80202df2:	39e080e7          	jalr	926(ra) # 8020018c <printf>
  printf("a1: %p\t", tf->a1);
    80202df6:	7cac                	ld	a1,120(s1)
    80202df8:	00008517          	auipc	a0,0x8
    80202dfc:	ac050513          	addi	a0,a0,-1344 # 8020a8b8 <digits+0x538>
    80202e00:	ffffd097          	auipc	ra,0xffffd
    80202e04:	38c080e7          	jalr	908(ra) # 8020018c <printf>
  printf("a2: %p\t", tf->a2);
    80202e08:	60cc                	ld	a1,128(s1)
    80202e0a:	00008517          	auipc	a0,0x8
    80202e0e:	ab650513          	addi	a0,a0,-1354 # 8020a8c0 <digits+0x540>
    80202e12:	ffffd097          	auipc	ra,0xffffd
    80202e16:	37a080e7          	jalr	890(ra) # 8020018c <printf>
  printf("a3: %p\n", tf->a3);
    80202e1a:	64cc                	ld	a1,136(s1)
    80202e1c:	00008517          	auipc	a0,0x8
    80202e20:	aac50513          	addi	a0,a0,-1364 # 8020a8c8 <digits+0x548>
    80202e24:	ffffd097          	auipc	ra,0xffffd
    80202e28:	368080e7          	jalr	872(ra) # 8020018c <printf>
  printf("a4: %p\t", tf->a4);
    80202e2c:	68cc                	ld	a1,144(s1)
    80202e2e:	00008517          	auipc	a0,0x8
    80202e32:	aa250513          	addi	a0,a0,-1374 # 8020a8d0 <digits+0x550>
    80202e36:	ffffd097          	auipc	ra,0xffffd
    80202e3a:	356080e7          	jalr	854(ra) # 8020018c <printf>
  printf("a5: %p\t", tf->a5);
    80202e3e:	6ccc                	ld	a1,152(s1)
    80202e40:	00008517          	auipc	a0,0x8
    80202e44:	a9850513          	addi	a0,a0,-1384 # 8020a8d8 <digits+0x558>
    80202e48:	ffffd097          	auipc	ra,0xffffd
    80202e4c:	344080e7          	jalr	836(ra) # 8020018c <printf>
  printf("a6: %p\t", tf->a6);
    80202e50:	70cc                	ld	a1,160(s1)
    80202e52:	00008517          	auipc	a0,0x8
    80202e56:	a8e50513          	addi	a0,a0,-1394 # 8020a8e0 <digits+0x560>
    80202e5a:	ffffd097          	auipc	ra,0xffffd
    80202e5e:	332080e7          	jalr	818(ra) # 8020018c <printf>
  printf("a7: %p\n", tf->a7);
    80202e62:	74cc                	ld	a1,168(s1)
    80202e64:	00008517          	auipc	a0,0x8
    80202e68:	a8450513          	addi	a0,a0,-1404 # 8020a8e8 <digits+0x568>
    80202e6c:	ffffd097          	auipc	ra,0xffffd
    80202e70:	320080e7          	jalr	800(ra) # 8020018c <printf>
  printf("t0: %p\t", tf->t0);
    80202e74:	64ac                	ld	a1,72(s1)
    80202e76:	00008517          	auipc	a0,0x8
    80202e7a:	a7a50513          	addi	a0,a0,-1414 # 8020a8f0 <digits+0x570>
    80202e7e:	ffffd097          	auipc	ra,0xffffd
    80202e82:	30e080e7          	jalr	782(ra) # 8020018c <printf>
  printf("t1: %p\t", tf->t1);
    80202e86:	68ac                	ld	a1,80(s1)
    80202e88:	00008517          	auipc	a0,0x8
    80202e8c:	a7050513          	addi	a0,a0,-1424 # 8020a8f8 <digits+0x578>
    80202e90:	ffffd097          	auipc	ra,0xffffd
    80202e94:	2fc080e7          	jalr	764(ra) # 8020018c <printf>
  printf("t2: %p\t", tf->t2);
    80202e98:	6cac                	ld	a1,88(s1)
    80202e9a:	00008517          	auipc	a0,0x8
    80202e9e:	a6650513          	addi	a0,a0,-1434 # 8020a900 <digits+0x580>
    80202ea2:	ffffd097          	auipc	ra,0xffffd
    80202ea6:	2ea080e7          	jalr	746(ra) # 8020018c <printf>
  printf("t3: %p\n", tf->t3);
    80202eaa:	1004b583          	ld	a1,256(s1)
    80202eae:	00008517          	auipc	a0,0x8
    80202eb2:	a5a50513          	addi	a0,a0,-1446 # 8020a908 <digits+0x588>
    80202eb6:	ffffd097          	auipc	ra,0xffffd
    80202eba:	2d6080e7          	jalr	726(ra) # 8020018c <printf>
  printf("t4: %p\t", tf->t4);
    80202ebe:	1084b583          	ld	a1,264(s1)
    80202ec2:	00008517          	auipc	a0,0x8
    80202ec6:	a4e50513          	addi	a0,a0,-1458 # 8020a910 <digits+0x590>
    80202eca:	ffffd097          	auipc	ra,0xffffd
    80202ece:	2c2080e7          	jalr	706(ra) # 8020018c <printf>
  printf("t5: %p\t", tf->t5);
    80202ed2:	1104b583          	ld	a1,272(s1)
    80202ed6:	00008517          	auipc	a0,0x8
    80202eda:	a4250513          	addi	a0,a0,-1470 # 8020a918 <digits+0x598>
    80202ede:	ffffd097          	auipc	ra,0xffffd
    80202ee2:	2ae080e7          	jalr	686(ra) # 8020018c <printf>
  printf("t6: %p\t", tf->t6);
    80202ee6:	1184b583          	ld	a1,280(s1)
    80202eea:	00008517          	auipc	a0,0x8
    80202eee:	a3650513          	addi	a0,a0,-1482 # 8020a920 <digits+0x5a0>
    80202ef2:	ffffd097          	auipc	ra,0xffffd
    80202ef6:	29a080e7          	jalr	666(ra) # 8020018c <printf>
  printf("s0: %p\n", tf->s0);
    80202efa:	70ac                	ld	a1,96(s1)
    80202efc:	00008517          	auipc	a0,0x8
    80202f00:	a2c50513          	addi	a0,a0,-1492 # 8020a928 <digits+0x5a8>
    80202f04:	ffffd097          	auipc	ra,0xffffd
    80202f08:	288080e7          	jalr	648(ra) # 8020018c <printf>
  printf("s1: %p\t", tf->s1);
    80202f0c:	74ac                	ld	a1,104(s1)
    80202f0e:	00008517          	auipc	a0,0x8
    80202f12:	a2250513          	addi	a0,a0,-1502 # 8020a930 <digits+0x5b0>
    80202f16:	ffffd097          	auipc	ra,0xffffd
    80202f1a:	276080e7          	jalr	630(ra) # 8020018c <printf>
  printf("s2: %p\t", tf->s2);
    80202f1e:	78cc                	ld	a1,176(s1)
    80202f20:	00008517          	auipc	a0,0x8
    80202f24:	a1850513          	addi	a0,a0,-1512 # 8020a938 <digits+0x5b8>
    80202f28:	ffffd097          	auipc	ra,0xffffd
    80202f2c:	264080e7          	jalr	612(ra) # 8020018c <printf>
  printf("s3: %p\t", tf->s3);
    80202f30:	7ccc                	ld	a1,184(s1)
    80202f32:	00008517          	auipc	a0,0x8
    80202f36:	a0e50513          	addi	a0,a0,-1522 # 8020a940 <digits+0x5c0>
    80202f3a:	ffffd097          	auipc	ra,0xffffd
    80202f3e:	252080e7          	jalr	594(ra) # 8020018c <printf>
  printf("s4: %p\n", tf->s4);
    80202f42:	60ec                	ld	a1,192(s1)
    80202f44:	00008517          	auipc	a0,0x8
    80202f48:	a0450513          	addi	a0,a0,-1532 # 8020a948 <digits+0x5c8>
    80202f4c:	ffffd097          	auipc	ra,0xffffd
    80202f50:	240080e7          	jalr	576(ra) # 8020018c <printf>
  printf("s5: %p\t", tf->s5);
    80202f54:	64ec                	ld	a1,200(s1)
    80202f56:	00008517          	auipc	a0,0x8
    80202f5a:	9fa50513          	addi	a0,a0,-1542 # 8020a950 <digits+0x5d0>
    80202f5e:	ffffd097          	auipc	ra,0xffffd
    80202f62:	22e080e7          	jalr	558(ra) # 8020018c <printf>
  printf("s6: %p\t", tf->s6);
    80202f66:	68ec                	ld	a1,208(s1)
    80202f68:	00008517          	auipc	a0,0x8
    80202f6c:	9f050513          	addi	a0,a0,-1552 # 8020a958 <digits+0x5d8>
    80202f70:	ffffd097          	auipc	ra,0xffffd
    80202f74:	21c080e7          	jalr	540(ra) # 8020018c <printf>
  printf("s7: %p\t", tf->s7);
    80202f78:	6cec                	ld	a1,216(s1)
    80202f7a:	00008517          	auipc	a0,0x8
    80202f7e:	9e650513          	addi	a0,a0,-1562 # 8020a960 <digits+0x5e0>
    80202f82:	ffffd097          	auipc	ra,0xffffd
    80202f86:	20a080e7          	jalr	522(ra) # 8020018c <printf>
  printf("s8: %p\n", tf->s8);
    80202f8a:	70ec                	ld	a1,224(s1)
    80202f8c:	00008517          	auipc	a0,0x8
    80202f90:	9dc50513          	addi	a0,a0,-1572 # 8020a968 <digits+0x5e8>
    80202f94:	ffffd097          	auipc	ra,0xffffd
    80202f98:	1f8080e7          	jalr	504(ra) # 8020018c <printf>
  printf("s9: %p\t", tf->s9);
    80202f9c:	74ec                	ld	a1,232(s1)
    80202f9e:	00008517          	auipc	a0,0x8
    80202fa2:	9d250513          	addi	a0,a0,-1582 # 8020a970 <digits+0x5f0>
    80202fa6:	ffffd097          	auipc	ra,0xffffd
    80202faa:	1e6080e7          	jalr	486(ra) # 8020018c <printf>
  printf("s10: %p\t", tf->s10);
    80202fae:	78ec                	ld	a1,240(s1)
    80202fb0:	00008517          	auipc	a0,0x8
    80202fb4:	9c850513          	addi	a0,a0,-1592 # 8020a978 <digits+0x5f8>
    80202fb8:	ffffd097          	auipc	ra,0xffffd
    80202fbc:	1d4080e7          	jalr	468(ra) # 8020018c <printf>
  printf("s11: %p\t", tf->s11);
    80202fc0:	7cec                	ld	a1,248(s1)
    80202fc2:	00008517          	auipc	a0,0x8
    80202fc6:	9c650513          	addi	a0,a0,-1594 # 8020a988 <digits+0x608>
    80202fca:	ffffd097          	auipc	ra,0xffffd
    80202fce:	1c2080e7          	jalr	450(ra) # 8020018c <printf>
  printf("ra: %p\n", tf->ra);
    80202fd2:	748c                	ld	a1,40(s1)
    80202fd4:	00007517          	auipc	a0,0x7
    80202fd8:	63c50513          	addi	a0,a0,1596 # 8020a610 <digits+0x290>
    80202fdc:	ffffd097          	auipc	ra,0xffffd
    80202fe0:	1b0080e7          	jalr	432(ra) # 8020018c <printf>
  printf("sp: %p\t", tf->sp);
    80202fe4:	788c                	ld	a1,48(s1)
    80202fe6:	00008517          	auipc	a0,0x8
    80202fea:	9b250513          	addi	a0,a0,-1614 # 8020a998 <digits+0x618>
    80202fee:	ffffd097          	auipc	ra,0xffffd
    80202ff2:	19e080e7          	jalr	414(ra) # 8020018c <printf>
  printf("gp: %p\t", tf->gp);
    80202ff6:	7c8c                	ld	a1,56(s1)
    80202ff8:	00008517          	auipc	a0,0x8
    80202ffc:	9a850513          	addi	a0,a0,-1624 # 8020a9a0 <digits+0x620>
    80203000:	ffffd097          	auipc	ra,0xffffd
    80203004:	18c080e7          	jalr	396(ra) # 8020018c <printf>
  printf("tp: %p\t", tf->tp);
    80203008:	60ac                	ld	a1,64(s1)
    8020300a:	00008517          	auipc	a0,0x8
    8020300e:	99e50513          	addi	a0,a0,-1634 # 8020a9a8 <digits+0x628>
    80203012:	ffffd097          	auipc	ra,0xffffd
    80203016:	17a080e7          	jalr	378(ra) # 8020018c <printf>
  printf("epc: %p\n", tf->epc);
    8020301a:	6c8c                	ld	a1,24(s1)
    8020301c:	00008517          	auipc	a0,0x8
    80203020:	99450513          	addi	a0,a0,-1644 # 8020a9b0 <digits+0x630>
    80203024:	ffffd097          	auipc	ra,0xffffd
    80203028:	168080e7          	jalr	360(ra) # 8020018c <printf>
}
    8020302c:	60e2                	ld	ra,24(sp)
    8020302e:	6442                	ld	s0,16(sp)
    80203030:	64a2                	ld	s1,8(sp)
    80203032:	6105                	addi	sp,sp,32
    80203034:	8082                	ret

0000000080203036 <argraw>:
  return strlen(buf);
}

static uint64
argraw(int n)
{
    80203036:	1101                	addi	sp,sp,-32
    80203038:	ec06                	sd	ra,24(sp)
    8020303a:	e822                	sd	s0,16(sp)
    8020303c:	e426                	sd	s1,8(sp)
    8020303e:	1000                	addi	s0,sp,32
    80203040:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80203042:	fffff097          	auipc	ra,0xfffff
    80203046:	a1e080e7          	jalr	-1506(ra) # 80201a60 <myproc>
  switch (n) {
    8020304a:	4795                	li	a5,5
    8020304c:	0497e163          	bltu	a5,s1,8020308e <argraw+0x58>
    80203050:	048a                	slli	s1,s1,0x2
    80203052:	00008717          	auipc	a4,0x8
    80203056:	b9670713          	addi	a4,a4,-1130 # 8020abe8 <digits+0x868>
    8020305a:	94ba                	add	s1,s1,a4
    8020305c:	409c                	lw	a5,0(s1)
    8020305e:	97ba                	add	a5,a5,a4
    80203060:	8782                	jr	a5
  case 0:
    return p->trapframe->a0;
    80203062:	713c                	ld	a5,96(a0)
    80203064:	7ba8                	ld	a0,112(a5)
  case 5:
    return p->trapframe->a5;
  }
  panic("argraw");
  return -1;
}
    80203066:	60e2                	ld	ra,24(sp)
    80203068:	6442                	ld	s0,16(sp)
    8020306a:	64a2                	ld	s1,8(sp)
    8020306c:	6105                	addi	sp,sp,32
    8020306e:	8082                	ret
    return p->trapframe->a1;
    80203070:	713c                	ld	a5,96(a0)
    80203072:	7fa8                	ld	a0,120(a5)
    80203074:	bfcd                	j	80203066 <argraw+0x30>
    return p->trapframe->a2;
    80203076:	713c                	ld	a5,96(a0)
    80203078:	63c8                	ld	a0,128(a5)
    8020307a:	b7f5                	j	80203066 <argraw+0x30>
    return p->trapframe->a3;
    8020307c:	713c                	ld	a5,96(a0)
    8020307e:	67c8                	ld	a0,136(a5)
    80203080:	b7dd                	j	80203066 <argraw+0x30>
    return p->trapframe->a4;
    80203082:	713c                	ld	a5,96(a0)
    80203084:	6bc8                	ld	a0,144(a5)
    80203086:	b7c5                	j	80203066 <argraw+0x30>
    return p->trapframe->a5;
    80203088:	713c                	ld	a5,96(a0)
    8020308a:	6fc8                	ld	a0,152(a5)
    8020308c:	bfe9                	j	80203066 <argraw+0x30>
  panic("argraw");
    8020308e:	00008517          	auipc	a0,0x8
    80203092:	93250513          	addi	a0,a0,-1742 # 8020a9c0 <digits+0x640>
    80203096:	ffffd097          	auipc	ra,0xffffd
    8020309a:	0ac080e7          	jalr	172(ra) # 80200142 <panic>

000000008020309e <sys_sysinfo>:
    return 0;
}

uint64
sys_sysinfo(void)
{
    8020309e:	7179                	addi	sp,sp,-48
    802030a0:	f406                	sd	ra,40(sp)
    802030a2:	f022                	sd	s0,32(sp)
    802030a4:	ec26                	sd	s1,24(sp)
    802030a6:	1800                	addi	s0,sp,48
  *ip = argraw(n);
    802030a8:	4501                	li	a0,0
    802030aa:	00000097          	auipc	ra,0x0
    802030ae:	f8c080e7          	jalr	-116(ra) # 80203036 <argraw>
    802030b2:	84aa                	mv	s1,a0
  if (argaddr(0, &addr) < 0) {
    return -1;
  }

  struct sysinfo info;
  info.freemem = freemem_amount();
    802030b4:	ffffd097          	auipc	ra,0xffffd
    802030b8:	50e080e7          	jalr	1294(ra) # 802005c2 <freemem_amount>
    802030bc:	fca43823          	sd	a0,-48(s0)
  info.nproc = procnum();
    802030c0:	fffff097          	auipc	ra,0xfffff
    802030c4:	60c080e7          	jalr	1548(ra) # 802026cc <procnum>
    802030c8:	fca43c23          	sd	a0,-40(s0)

  // if (copyout(p->pagetable, addr, (char *)&info, sizeof(info)) < 0) {
  if (copyout2(addr, (char *)&info, sizeof(info)) < 0) {
    802030cc:	4641                	li	a2,16
    802030ce:	fd040593          	addi	a1,s0,-48
    802030d2:	8526                	mv	a0,s1
    802030d4:	ffffe097          	auipc	ra,0xffffe
    802030d8:	2a8080e7          	jalr	680(ra) # 8020137c <copyout2>
    return -1;
  }

  return 0;
    802030dc:	957d                	srai	a0,a0,0x3f
    802030de:	70a2                	ld	ra,40(sp)
    802030e0:	7402                	ld	s0,32(sp)
    802030e2:	64e2                	ld	s1,24(sp)
    802030e4:	6145                	addi	sp,sp,48
    802030e6:	8082                	ret

00000000802030e8 <fetchaddr>:
{
    802030e8:	1101                	addi	sp,sp,-32
    802030ea:	ec06                	sd	ra,24(sp)
    802030ec:	e822                	sd	s0,16(sp)
    802030ee:	e426                	sd	s1,8(sp)
    802030f0:	e04a                	sd	s2,0(sp)
    802030f2:	1000                	addi	s0,sp,32
    802030f4:	84aa                	mv	s1,a0
    802030f6:	892e                	mv	s2,a1
  struct proc *p = myproc();
    802030f8:	fffff097          	auipc	ra,0xfffff
    802030fc:	968080e7          	jalr	-1688(ra) # 80201a60 <myproc>
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    80203100:	653c                	ld	a5,72(a0)
    80203102:	02f4f763          	bgeu	s1,a5,80203130 <fetchaddr+0x48>
    80203106:	00848713          	addi	a4,s1,8
    8020310a:	02e7e563          	bltu	a5,a4,80203134 <fetchaddr+0x4c>
  if(copyin2((char *)ip, addr, sizeof(*ip)) != 0)
    8020310e:	4621                	li	a2,8
    80203110:	85a6                	mv	a1,s1
    80203112:	854a                	mv	a0,s2
    80203114:	ffffe097          	auipc	ra,0xffffe
    80203118:	346080e7          	jalr	838(ra) # 8020145a <copyin2>
    8020311c:	00a03533          	snez	a0,a0
    80203120:	40a00533          	neg	a0,a0
}
    80203124:	60e2                	ld	ra,24(sp)
    80203126:	6442                	ld	s0,16(sp)
    80203128:	64a2                	ld	s1,8(sp)
    8020312a:	6902                	ld	s2,0(sp)
    8020312c:	6105                	addi	sp,sp,32
    8020312e:	8082                	ret
    return -1;
    80203130:	557d                	li	a0,-1
    80203132:	bfcd                	j	80203124 <fetchaddr+0x3c>
    80203134:	557d                	li	a0,-1
    80203136:	b7fd                	j	80203124 <fetchaddr+0x3c>

0000000080203138 <fetchstr>:
{
    80203138:	1101                	addi	sp,sp,-32
    8020313a:	ec06                	sd	ra,24(sp)
    8020313c:	e822                	sd	s0,16(sp)
    8020313e:	e426                	sd	s1,8(sp)
    80203140:	1000                	addi	s0,sp,32
    80203142:	84ae                	mv	s1,a1
  int err = copyinstr2(buf, addr, max);
    80203144:	85aa                	mv	a1,a0
    80203146:	8526                	mv	a0,s1
    80203148:	ffffe097          	auipc	ra,0xffffe
    8020314c:	418080e7          	jalr	1048(ra) # 80201560 <copyinstr2>
  if(err < 0)
    80203150:	00054763          	bltz	a0,8020315e <fetchstr+0x26>
  return strlen(buf);
    80203154:	8526                	mv	a0,s1
    80203156:	ffffd097          	auipc	ra,0xffffd
    8020315a:	796080e7          	jalr	1942(ra) # 802008ec <strlen>
}
    8020315e:	60e2                	ld	ra,24(sp)
    80203160:	6442                	ld	s0,16(sp)
    80203162:	64a2                	ld	s1,8(sp)
    80203164:	6105                	addi	sp,sp,32
    80203166:	8082                	ret

0000000080203168 <argint>:
{
    80203168:	1101                	addi	sp,sp,-32
    8020316a:	ec06                	sd	ra,24(sp)
    8020316c:	e822                	sd	s0,16(sp)
    8020316e:	e426                	sd	s1,8(sp)
    80203170:	1000                	addi	s0,sp,32
    80203172:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80203174:	00000097          	auipc	ra,0x0
    80203178:	ec2080e7          	jalr	-318(ra) # 80203036 <argraw>
    8020317c:	c088                	sw	a0,0(s1)
}
    8020317e:	4501                	li	a0,0
    80203180:	60e2                	ld	ra,24(sp)
    80203182:	6442                	ld	s0,16(sp)
    80203184:	64a2                	ld	s1,8(sp)
    80203186:	6105                	addi	sp,sp,32
    80203188:	8082                	ret

000000008020318a <sys_test_proc>:
sys_test_proc(void) {
    8020318a:	1101                	addi	sp,sp,-32
    8020318c:	ec06                	sd	ra,24(sp)
    8020318e:	e822                	sd	s0,16(sp)
    80203190:	1000                	addi	s0,sp,32
    argint(0, &n);
    80203192:	fec40593          	addi	a1,s0,-20
    80203196:	4501                	li	a0,0
    80203198:	00000097          	auipc	ra,0x0
    8020319c:	fd0080e7          	jalr	-48(ra) # 80203168 <argint>
    printf("hello world from proc %d, hart %d, arg %d\n", myproc()->pid, r_tp(), n);
    802031a0:	fffff097          	auipc	ra,0xfffff
    802031a4:	8c0080e7          	jalr	-1856(ra) # 80201a60 <myproc>
    802031a8:	8612                	mv	a2,tp
    802031aa:	fec42683          	lw	a3,-20(s0)
    802031ae:	5d0c                	lw	a1,56(a0)
    802031b0:	00008517          	auipc	a0,0x8
    802031b4:	81850513          	addi	a0,a0,-2024 # 8020a9c8 <digits+0x648>
    802031b8:	ffffd097          	auipc	ra,0xffffd
    802031bc:	fd4080e7          	jalr	-44(ra) # 8020018c <printf>
}
    802031c0:	4501                	li	a0,0
    802031c2:	60e2                	ld	ra,24(sp)
    802031c4:	6442                	ld	s0,16(sp)
    802031c6:	6105                	addi	sp,sp,32
    802031c8:	8082                	ret

00000000802031ca <argaddr>:
{
    802031ca:	1101                	addi	sp,sp,-32
    802031cc:	ec06                	sd	ra,24(sp)
    802031ce:	e822                	sd	s0,16(sp)
    802031d0:	e426                	sd	s1,8(sp)
    802031d2:	1000                	addi	s0,sp,32
    802031d4:	84ae                	mv	s1,a1
  *ip = argraw(n);
    802031d6:	00000097          	auipc	ra,0x0
    802031da:	e60080e7          	jalr	-416(ra) # 80203036 <argraw>
    802031de:	e088                	sd	a0,0(s1)
}
    802031e0:	4501                	li	a0,0
    802031e2:	60e2                	ld	ra,24(sp)
    802031e4:	6442                	ld	s0,16(sp)
    802031e6:	64a2                	ld	s1,8(sp)
    802031e8:	6105                	addi	sp,sp,32
    802031ea:	8082                	ret

00000000802031ec <argstr>:
{
    802031ec:	1101                	addi	sp,sp,-32
    802031ee:	ec06                	sd	ra,24(sp)
    802031f0:	e822                	sd	s0,16(sp)
    802031f2:	e426                	sd	s1,8(sp)
    802031f4:	e04a                	sd	s2,0(sp)
    802031f6:	1000                	addi	s0,sp,32
    802031f8:	84ae                	mv	s1,a1
    802031fa:	8932                	mv	s2,a2
  *ip = argraw(n);
    802031fc:	00000097          	auipc	ra,0x0
    80203200:	e3a080e7          	jalr	-454(ra) # 80203036 <argraw>
  return fetchstr(addr, buf, max);
    80203204:	864a                	mv	a2,s2
    80203206:	85a6                	mv	a1,s1
    80203208:	00000097          	auipc	ra,0x0
    8020320c:	f30080e7          	jalr	-208(ra) # 80203138 <fetchstr>
}
    80203210:	60e2                	ld	ra,24(sp)
    80203212:	6442                	ld	s0,16(sp)
    80203214:	64a2                	ld	s1,8(sp)
    80203216:	6902                	ld	s2,0(sp)
    80203218:	6105                	addi	sp,sp,32
    8020321a:	8082                	ret

000000008020321c <syscall>:
{
    8020321c:	7179                	addi	sp,sp,-48
    8020321e:	f406                	sd	ra,40(sp)
    80203220:	f022                	sd	s0,32(sp)
    80203222:	ec26                	sd	s1,24(sp)
    80203224:	e84a                	sd	s2,16(sp)
    80203226:	e44e                	sd	s3,8(sp)
    80203228:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    8020322a:	fffff097          	auipc	ra,0xfffff
    8020322e:	836080e7          	jalr	-1994(ra) # 80201a60 <myproc>
    80203232:	84aa                	mv	s1,a0
  num = p->trapframe->a7;
    80203234:	06053903          	ld	s2,96(a0)
    80203238:	0a893783          	ld	a5,168(s2)
    8020323c:	0007899b          	sext.w	s3,a5
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    80203240:	37fd                	addiw	a5,a5,-1
    80203242:	20100713          	li	a4,513
    80203246:	04f76863          	bltu	a4,a5,80203296 <syscall+0x7a>
    8020324a:	00399713          	slli	a4,s3,0x3
    8020324e:	00009797          	auipc	a5,0x9
    80203252:	e1a78793          	addi	a5,a5,-486 # 8020c068 <syscalls>
    80203256:	97ba                	add	a5,a5,a4
    80203258:	639c                	ld	a5,0(a5)
    8020325a:	cf95                	beqz	a5,80203296 <syscall+0x7a>
    p->trapframe->a0 = syscalls[num]();
    8020325c:	9782                	jalr	a5
    8020325e:	06a93823          	sd	a0,112(s2)
    if ((p->tmask & (1 << num)) != 0) {
    80203262:	4f04a783          	lw	a5,1264(s1)
    80203266:	4137d7bb          	sraw	a5,a5,s3
    8020326a:	8b85                	andi	a5,a5,1
    8020326c:	c7a1                	beqz	a5,802032b4 <syscall+0x98>
      printf("pid %d: %s -> %d\n", p->pid, sysnames[num], p->trapframe->a0);
    8020326e:	70b8                	ld	a4,96(s1)
    80203270:	098e                	slli	s3,s3,0x3
    80203272:	0000a797          	auipc	a5,0xa
    80203276:	e0e78793          	addi	a5,a5,-498 # 8020d080 <sysnames>
    8020327a:	99be                	add	s3,s3,a5
    8020327c:	7b34                	ld	a3,112(a4)
    8020327e:	0009b603          	ld	a2,0(s3)
    80203282:	5c8c                	lw	a1,56(s1)
    80203284:	00007517          	auipc	a0,0x7
    80203288:	77450513          	addi	a0,a0,1908 # 8020a9f8 <digits+0x678>
    8020328c:	ffffd097          	auipc	ra,0xffffd
    80203290:	f00080e7          	jalr	-256(ra) # 8020018c <printf>
    80203294:	a005                	j	802032b4 <syscall+0x98>
    printf("pid %d %s: unknown sys call %d\n",
    80203296:	86ce                	mv	a3,s3
    80203298:	4e048613          	addi	a2,s1,1248
    8020329c:	5c8c                	lw	a1,56(s1)
    8020329e:	00007517          	auipc	a0,0x7
    802032a2:	77250513          	addi	a0,a0,1906 # 8020aa10 <digits+0x690>
    802032a6:	ffffd097          	auipc	ra,0xffffd
    802032aa:	ee6080e7          	jalr	-282(ra) # 8020018c <printf>
    p->trapframe->a0 = -1;
    802032ae:	70bc                	ld	a5,96(s1)
    802032b0:	577d                	li	a4,-1
    802032b2:	fbb8                	sd	a4,112(a5)
}
    802032b4:	70a2                	ld	ra,40(sp)
    802032b6:	7402                	ld	s0,32(sp)
    802032b8:	64e2                	ld	s1,24(sp)
    802032ba:	6942                	ld	s2,16(sp)
    802032bc:	69a2                	ld	s3,8(sp)
    802032be:	6145                	addi	sp,sp,48
    802032c0:	8082                	ret

00000000802032c2 <sys_exec>:
#include "include/sbi.h"
extern int exec(char *path, char **argv);

uint64
sys_exec(void)
{  
    802032c2:	da010113          	addi	sp,sp,-608
    802032c6:	24113c23          	sd	ra,600(sp)
    802032ca:	24813823          	sd	s0,592(sp)
    802032ce:	24913423          	sd	s1,584(sp)
    802032d2:	25213023          	sd	s2,576(sp)
    802032d6:	23313c23          	sd	s3,568(sp)
    802032da:	23413823          	sd	s4,560(sp)
    802032de:	23513423          	sd	s5,552(sp)
    802032e2:	23613023          	sd	s6,544(sp)
    802032e6:	1480                	addi	s0,sp,608
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    802032e8:	10400613          	li	a2,260
    802032ec:	eb840593          	addi	a1,s0,-328
    802032f0:	4501                	li	a0,0
    802032f2:	00000097          	auipc	ra,0x0
    802032f6:	efa080e7          	jalr	-262(ra) # 802031ec <argstr>
    return -1;
    802032fa:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    802032fc:	0c054a63          	bltz	a0,802033d0 <sys_exec+0x10e>
    80203300:	db040593          	addi	a1,s0,-592
    80203304:	4505                	li	a0,1
    80203306:	00000097          	auipc	ra,0x0
    8020330a:	ec4080e7          	jalr	-316(ra) # 802031ca <argaddr>
    8020330e:	0c054163          	bltz	a0,802033d0 <sys_exec+0x10e>
  }
  memset(argv, 0, sizeof(argv));
    80203312:	10000613          	li	a2,256
    80203316:	4581                	li	a1,0
    80203318:	db840993          	addi	s3,s0,-584
    8020331c:	854e                	mv	a0,s3
    8020331e:	ffffd097          	auipc	ra,0xffffd
    80203322:	446080e7          	jalr	1094(ra) # 80200764 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    80203326:	84ce                	mv	s1,s3
  memset(argv, 0, sizeof(argv));
    80203328:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    8020332a:	da840a13          	addi	s4,s0,-600
    if(i >= NELEM(argv)){
    8020332e:	02000a93          	li	s5,32
    80203332:	00090b1b          	sext.w	s6,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80203336:	00391513          	slli	a0,s2,0x3
    8020333a:	85d2                	mv	a1,s4
    8020333c:	db043783          	ld	a5,-592(s0)
    80203340:	953e                	add	a0,a0,a5
    80203342:	00000097          	auipc	ra,0x0
    80203346:	da6080e7          	jalr	-602(ra) # 802030e8 <fetchaddr>
    8020334a:	02054a63          	bltz	a0,8020337e <sys_exec+0xbc>
      goto bad;
    }
    if(uarg == 0){
    8020334e:	da843783          	ld	a5,-600(s0)
    80203352:	c3b9                	beqz	a5,80203398 <sys_exec+0xd6>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    80203354:	ffffd097          	auipc	ra,0xffffd
    80203358:	208080e7          	jalr	520(ra) # 8020055c <kalloc>
    8020335c:	85aa                	mv	a1,a0
    8020335e:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    80203362:	cd11                	beqz	a0,8020337e <sys_exec+0xbc>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80203364:	6605                	lui	a2,0x1
    80203366:	da843503          	ld	a0,-600(s0)
    8020336a:	00000097          	auipc	ra,0x0
    8020336e:	dce080e7          	jalr	-562(ra) # 80203138 <fetchstr>
    80203372:	00054663          	bltz	a0,8020337e <sys_exec+0xbc>
    if(i >= NELEM(argv)){
    80203376:	0905                	addi	s2,s2,1
    80203378:	09a1                	addi	s3,s3,8
    8020337a:	fb591ce3          	bne	s2,s5,80203332 <sys_exec+0x70>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020337e:	10048913          	addi	s2,s1,256
    80203382:	6088                	ld	a0,0(s1)
    80203384:	c529                	beqz	a0,802033ce <sys_exec+0x10c>
    kfree(argv[i]);
    80203386:	ffffd097          	auipc	ra,0xffffd
    8020338a:	0be080e7          	jalr	190(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020338e:	04a1                	addi	s1,s1,8
    80203390:	ff2499e3          	bne	s1,s2,80203382 <sys_exec+0xc0>
  return -1;
    80203394:	597d                	li	s2,-1
    80203396:	a82d                	j	802033d0 <sys_exec+0x10e>
      argv[i] = 0;
    80203398:	0b0e                	slli	s6,s6,0x3
    8020339a:	fc040793          	addi	a5,s0,-64
    8020339e:	9b3e                	add	s6,s6,a5
    802033a0:	de0b3c23          	sd	zero,-520(s6)
  int ret = exec(path, argv);  
    802033a4:	db840593          	addi	a1,s0,-584
    802033a8:	eb840513          	addi	a0,s0,-328
    802033ac:	00001097          	auipc	ra,0x1
    802033b0:	344080e7          	jalr	836(ra) # 802046f0 <exec>
    802033b4:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802033b6:	10048993          	addi	s3,s1,256
    802033ba:	6088                	ld	a0,0(s1)
    802033bc:	c911                	beqz	a0,802033d0 <sys_exec+0x10e>
    kfree(argv[i]);
    802033be:	ffffd097          	auipc	ra,0xffffd
    802033c2:	086080e7          	jalr	134(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802033c6:	04a1                	addi	s1,s1,8
    802033c8:	ff3499e3          	bne	s1,s3,802033ba <sys_exec+0xf8>
    802033cc:	a011                	j	802033d0 <sys_exec+0x10e>
  return -1;
    802033ce:	597d                	li	s2,-1
}
    802033d0:	854a                	mv	a0,s2
    802033d2:	25813083          	ld	ra,600(sp)
    802033d6:	25013403          	ld	s0,592(sp)
    802033da:	24813483          	ld	s1,584(sp)
    802033de:	24013903          	ld	s2,576(sp)
    802033e2:	23813983          	ld	s3,568(sp)
    802033e6:	23013a03          	ld	s4,560(sp)
    802033ea:	22813a83          	ld	s5,552(sp)
    802033ee:	22013b03          	ld	s6,544(sp)
    802033f2:	26010113          	addi	sp,sp,608
    802033f6:	8082                	ret

00000000802033f8 <sys_exit>:

uint64
sys_exit(void)
{
    802033f8:	1101                	addi	sp,sp,-32
    802033fa:	ec06                	sd	ra,24(sp)
    802033fc:	e822                	sd	s0,16(sp)
    802033fe:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    80203400:	fec40593          	addi	a1,s0,-20
    80203404:	4501                	li	a0,0
    80203406:	00000097          	auipc	ra,0x0
    8020340a:	d62080e7          	jalr	-670(ra) # 80203168 <argint>
    return -1;
    8020340e:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    80203410:	00054963          	bltz	a0,80203422 <sys_exit+0x2a>
  exit(n);
    80203414:	fec42503          	lw	a0,-20(s0)
    80203418:	fffff097          	auipc	ra,0xfffff
    8020341c:	db8080e7          	jalr	-584(ra) # 802021d0 <exit>
  return 0;  // not reached
    80203420:	4781                	li	a5,0
}
    80203422:	853e                	mv	a0,a5
    80203424:	60e2                	ld	ra,24(sp)
    80203426:	6442                	ld	s0,16(sp)
    80203428:	6105                	addi	sp,sp,32
    8020342a:	8082                	ret

000000008020342c <sys_getpid>:

uint64
sys_getpid(void)
{
    8020342c:	1141                	addi	sp,sp,-16
    8020342e:	e406                	sd	ra,8(sp)
    80203430:	e022                	sd	s0,0(sp)
    80203432:	0800                	addi	s0,sp,16
  return myproc()->pid;
    80203434:	ffffe097          	auipc	ra,0xffffe
    80203438:	62c080e7          	jalr	1580(ra) # 80201a60 <myproc>
}
    8020343c:	5d08                	lw	a0,56(a0)
    8020343e:	60a2                	ld	ra,8(sp)
    80203440:	6402                	ld	s0,0(sp)
    80203442:	0141                	addi	sp,sp,16
    80203444:	8082                	ret

0000000080203446 <sys_fork>:

uint64
sys_fork(void)
{
    80203446:	1141                	addi	sp,sp,-16
    80203448:	e406                	sd	ra,8(sp)
    8020344a:	e022                	sd	s0,0(sp)
    8020344c:	0800                	addi	s0,sp,16
  return fork();
    8020344e:	fffff097          	auipc	ra,0xfffff
    80203452:	a3c080e7          	jalr	-1476(ra) # 80201e8a <fork>
}
    80203456:	60a2                	ld	ra,8(sp)
    80203458:	6402                	ld	s0,0(sp)
    8020345a:	0141                	addi	sp,sp,16
    8020345c:	8082                	ret

000000008020345e <sys_wait>:

uint64
sys_wait(void)
{
    8020345e:	1101                	addi	sp,sp,-32
    80203460:	ec06                	sd	ra,24(sp)
    80203462:	e822                	sd	s0,16(sp)
    80203464:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    80203466:	fe840593          	addi	a1,s0,-24
    8020346a:	4501                	li	a0,0
    8020346c:	00000097          	auipc	ra,0x0
    80203470:	d5e080e7          	jalr	-674(ra) # 802031ca <argaddr>
    80203474:	87aa                	mv	a5,a0
    return -1;
    80203476:	557d                	li	a0,-1
  if(argaddr(0, &p) < 0)
    80203478:	0007c863          	bltz	a5,80203488 <sys_wait+0x2a>
  return wait(p);
    8020347c:	fe843503          	ld	a0,-24(s0)
    80203480:	fffff097          	auipc	ra,0xfffff
    80203484:	ef4080e7          	jalr	-268(ra) # 80202374 <wait>
}
    80203488:	60e2                	ld	ra,24(sp)
    8020348a:	6442                	ld	s0,16(sp)
    8020348c:	6105                	addi	sp,sp,32
    8020348e:	8082                	ret

0000000080203490 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    80203490:	7179                	addi	sp,sp,-48
    80203492:	f406                	sd	ra,40(sp)
    80203494:	f022                	sd	s0,32(sp)
    80203496:	ec26                	sd	s1,24(sp)
    80203498:	1800                	addi	s0,sp,48
  int addr;
  int n;

  if(argint(0, &n) < 0)
    8020349a:	fdc40593          	addi	a1,s0,-36
    8020349e:	4501                	li	a0,0
    802034a0:	00000097          	auipc	ra,0x0
    802034a4:	cc8080e7          	jalr	-824(ra) # 80203168 <argint>
    802034a8:	87aa                	mv	a5,a0
    return -1;
    802034aa:	557d                	li	a0,-1
  if(argint(0, &n) < 0)
    802034ac:	0207c063          	bltz	a5,802034cc <sys_sbrk+0x3c>
  addr = myproc()->sz;
    802034b0:	ffffe097          	auipc	ra,0xffffe
    802034b4:	5b0080e7          	jalr	1456(ra) # 80201a60 <myproc>
    802034b8:	4524                	lw	s1,72(a0)
  if(growproc(n) < 0)
    802034ba:	fdc42503          	lw	a0,-36(s0)
    802034be:	fffff097          	auipc	ra,0xfffff
    802034c2:	954080e7          	jalr	-1708(ra) # 80201e12 <growproc>
    802034c6:	00054863          	bltz	a0,802034d6 <sys_sbrk+0x46>
    return -1;
  return addr;
    802034ca:	8526                	mv	a0,s1
}
    802034cc:	70a2                	ld	ra,40(sp)
    802034ce:	7402                	ld	s0,32(sp)
    802034d0:	64e2                	ld	s1,24(sp)
    802034d2:	6145                	addi	sp,sp,48
    802034d4:	8082                	ret
    return -1;
    802034d6:	557d                	li	a0,-1
    802034d8:	bfd5                	j	802034cc <sys_sbrk+0x3c>

00000000802034da <sys_sleep>:

uint64
sys_sleep(void)
{
    802034da:	7139                	addi	sp,sp,-64
    802034dc:	fc06                	sd	ra,56(sp)
    802034de:	f822                	sd	s0,48(sp)
    802034e0:	f426                	sd	s1,40(sp)
    802034e2:	f04a                	sd	s2,32(sp)
    802034e4:	ec4e                	sd	s3,24(sp)
    802034e6:	0080                	addi	s0,sp,64
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    802034e8:	fcc40593          	addi	a1,s0,-52
    802034ec:	4501                	li	a0,0
    802034ee:	00000097          	auipc	ra,0x0
    802034f2:	c7a080e7          	jalr	-902(ra) # 80203168 <argint>
    return -1;
    802034f6:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    802034f8:	06054763          	bltz	a0,80203566 <sys_sleep+0x8c>
  acquire(&tickslock);
    802034fc:	0000b517          	auipc	a0,0xb
    80203500:	bec53503          	ld	a0,-1044(a0) # 8020e0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    80203504:	ffffd097          	auipc	ra,0xffffd
    80203508:	1c4080e7          	jalr	452(ra) # 802006c8 <acquire>
  ticks0 = ticks;
    8020350c:	0000b797          	auipc	a5,0xb
    80203510:	bec7b783          	ld	a5,-1044(a5) # 8020e0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
    80203514:	0007a903          	lw	s2,0(a5)
  while(ticks - ticks0 < n){
    80203518:	fcc42783          	lw	a5,-52(s0)
    8020351c:	cf85                	beqz	a5,80203554 <sys_sleep+0x7a>
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
    8020351e:	0000b997          	auipc	s3,0xb
    80203522:	bca9b983          	ld	s3,-1078(s3) # 8020e0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    80203526:	0000b497          	auipc	s1,0xb
    8020352a:	bd24b483          	ld	s1,-1070(s1) # 8020e0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
    if(myproc()->killed){
    8020352e:	ffffe097          	auipc	ra,0xffffe
    80203532:	532080e7          	jalr	1330(ra) # 80201a60 <myproc>
    80203536:	591c                	lw	a5,48(a0)
    80203538:	ef9d                	bnez	a5,80203576 <sys_sleep+0x9c>
    sleep(&ticks, &tickslock);
    8020353a:	85ce                	mv	a1,s3
    8020353c:	8526                	mv	a0,s1
    8020353e:	fffff097          	auipc	ra,0xfffff
    80203542:	db8080e7          	jalr	-584(ra) # 802022f6 <sleep>
  while(ticks - ticks0 < n){
    80203546:	409c                	lw	a5,0(s1)
    80203548:	412787bb          	subw	a5,a5,s2
    8020354c:	fcc42703          	lw	a4,-52(s0)
    80203550:	fce7efe3          	bltu	a5,a4,8020352e <sys_sleep+0x54>
  }
  release(&tickslock);
    80203554:	0000b517          	auipc	a0,0xb
    80203558:	b9453503          	ld	a0,-1132(a0) # 8020e0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    8020355c:	ffffd097          	auipc	ra,0xffffd
    80203560:	1c0080e7          	jalr	448(ra) # 8020071c <release>
  return 0;
    80203564:	4781                	li	a5,0
}
    80203566:	853e                	mv	a0,a5
    80203568:	70e2                	ld	ra,56(sp)
    8020356a:	7442                	ld	s0,48(sp)
    8020356c:	74a2                	ld	s1,40(sp)
    8020356e:	7902                	ld	s2,32(sp)
    80203570:	69e2                	ld	s3,24(sp)
    80203572:	6121                	addi	sp,sp,64
    80203574:	8082                	ret
      release(&tickslock);
    80203576:	0000b517          	auipc	a0,0xb
    8020357a:	b7253503          	ld	a0,-1166(a0) # 8020e0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    8020357e:	ffffd097          	auipc	ra,0xffffd
    80203582:	19e080e7          	jalr	414(ra) # 8020071c <release>
      return -1;
    80203586:	57fd                	li	a5,-1
    80203588:	bff9                	j	80203566 <sys_sleep+0x8c>

000000008020358a <sys_kill>:

uint64
sys_kill(void)
{
    8020358a:	1101                	addi	sp,sp,-32
    8020358c:	ec06                	sd	ra,24(sp)
    8020358e:	e822                	sd	s0,16(sp)
    80203590:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    80203592:	fec40593          	addi	a1,s0,-20
    80203596:	4501                	li	a0,0
    80203598:	00000097          	auipc	ra,0x0
    8020359c:	bd0080e7          	jalr	-1072(ra) # 80203168 <argint>
    802035a0:	87aa                	mv	a5,a0
    return -1;
    802035a2:	557d                	li	a0,-1
  if(argint(0, &pid) < 0)
    802035a4:	0007c863          	bltz	a5,802035b4 <sys_kill+0x2a>
  return kill(pid);
    802035a8:	fec42503          	lw	a0,-20(s0)
    802035ac:	fffff097          	auipc	ra,0xfffff
    802035b0:	f40080e7          	jalr	-192(ra) # 802024ec <kill>
}
    802035b4:	60e2                	ld	ra,24(sp)
    802035b6:	6442                	ld	s0,16(sp)
    802035b8:	6105                	addi	sp,sp,32
    802035ba:	8082                	ret

00000000802035bc <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    802035bc:	1101                	addi	sp,sp,-32
    802035be:	ec06                	sd	ra,24(sp)
    802035c0:	e822                	sd	s0,16(sp)
    802035c2:	e426                	sd	s1,8(sp)
    802035c4:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    802035c6:	0000b517          	auipc	a0,0xb
    802035ca:	b2253503          	ld	a0,-1246(a0) # 8020e0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    802035ce:	ffffd097          	auipc	ra,0xffffd
    802035d2:	0fa080e7          	jalr	250(ra) # 802006c8 <acquire>
  xticks = ticks;
    802035d6:	0000b797          	auipc	a5,0xb
    802035da:	b227b783          	ld	a5,-1246(a5) # 8020e0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
    802035de:	4384                	lw	s1,0(a5)
  release(&tickslock);
    802035e0:	0000b517          	auipc	a0,0xb
    802035e4:	b0853503          	ld	a0,-1272(a0) # 8020e0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    802035e8:	ffffd097          	auipc	ra,0xffffd
    802035ec:	134080e7          	jalr	308(ra) # 8020071c <release>
  return xticks;
}
    802035f0:	02049513          	slli	a0,s1,0x20
    802035f4:	9101                	srli	a0,a0,0x20
    802035f6:	60e2                	ld	ra,24(sp)
    802035f8:	6442                	ld	s0,16(sp)
    802035fa:	64a2                	ld	s1,8(sp)
    802035fc:	6105                	addi	sp,sp,32
    802035fe:	8082                	ret

0000000080203600 <sys_trace>:
    
uint64
sys_trace(void)
{
    80203600:	1101                	addi	sp,sp,-32
    80203602:	ec06                	sd	ra,24(sp)
    80203604:	e822                	sd	s0,16(sp)
    80203606:	1000                	addi	s0,sp,32
  int mask;
  if(argint(0, &mask) < 0) {
    80203608:	fec40593          	addi	a1,s0,-20
    8020360c:	4501                	li	a0,0
    8020360e:	00000097          	auipc	ra,0x0
    80203612:	b5a080e7          	jalr	-1190(ra) # 80203168 <argint>
    return -1;
    80203616:	57fd                	li	a5,-1
  if(argint(0, &mask) < 0) {
    80203618:	00054b63          	bltz	a0,8020362e <sys_trace+0x2e>
  }
  myproc()->tmask = mask;
    8020361c:	ffffe097          	auipc	ra,0xffffe
    80203620:	444080e7          	jalr	1092(ra) # 80201a60 <myproc>
    80203624:	fec42783          	lw	a5,-20(s0)
    80203628:	4ef52823          	sw	a5,1264(a0)
  return 0;
    8020362c:	4781                	li	a5,0
}
    8020362e:	853e                	mv	a0,a5
    80203630:	60e2                	ld	ra,24(sp)
    80203632:	6442                	ld	s0,16(sp)
    80203634:	6105                	addi	sp,sp,32
    80203636:	8082                	ret

0000000080203638 <sys_clone>:


// added by lmq for SYS_clone
uint64
sys_clone(void)
{
    80203638:	7179                	addi	sp,sp,-48
    8020363a:	f406                	sd	ra,40(sp)
    8020363c:	f022                	sd	s0,32(sp)
    8020363e:	1800                	addi	s0,sp,48
  int flags,ptid,tls,ctid;
  uint64 stack;
  if(argint(0, &flags) < 0) {
    80203640:	fec40593          	addi	a1,s0,-20
    80203644:	4501                	li	a0,0
    80203646:	00000097          	auipc	ra,0x0
    8020364a:	b22080e7          	jalr	-1246(ra) # 80203168 <argint>
    return -1;
    8020364e:	57fd                	li	a5,-1
  if(argint(0, &flags) < 0) {
    80203650:	06054163          	bltz	a0,802036b2 <sys_clone+0x7a>
  }
  if(argaddr(1, &stack) < 0) {    // 子进程的栈地址
    80203654:	fd840593          	addi	a1,s0,-40
    80203658:	4505                	li	a0,1
    8020365a:	00000097          	auipc	ra,0x0
    8020365e:	b70080e7          	jalr	-1168(ra) # 802031ca <argaddr>
    return -1;
    80203662:	57fd                	li	a5,-1
  if(argaddr(1, &stack) < 0) {    // 子进程的栈地址
    80203664:	04054763          	bltz	a0,802036b2 <sys_clone+0x7a>
  }
  if(argint(2, &ptid) < 0) {
    80203668:	fe840593          	addi	a1,s0,-24
    8020366c:	4509                	li	a0,2
    8020366e:	00000097          	auipc	ra,0x0
    80203672:	afa080e7          	jalr	-1286(ra) # 80203168 <argint>
    return -1;
    80203676:	57fd                	li	a5,-1
  if(argint(2, &ptid) < 0) {
    80203678:	02054d63          	bltz	a0,802036b2 <sys_clone+0x7a>
  }
  if(argint(3, &tls) < 0) {
    8020367c:	fe440593          	addi	a1,s0,-28
    80203680:	450d                	li	a0,3
    80203682:	00000097          	auipc	ra,0x0
    80203686:	ae6080e7          	jalr	-1306(ra) # 80203168 <argint>
    return -1;
    8020368a:	57fd                	li	a5,-1
  if(argint(3, &tls) < 0) {
    8020368c:	02054363          	bltz	a0,802036b2 <sys_clone+0x7a>
  }
  if(argint(4, &ctid) < 0) {
    80203690:	fe040593          	addi	a1,s0,-32
    80203694:	4511                	li	a0,4
    80203696:	00000097          	auipc	ra,0x0
    8020369a:	ad2080e7          	jalr	-1326(ra) # 80203168 <argint>
    8020369e:	02054d63          	bltz	a0,802036d8 <sys_clone+0xa0>
    return -1;
  }
  if(stack==0)
    802036a2:	fd843583          	ld	a1,-40(s0)
    802036a6:	e999                	bnez	a1,802036bc <sys_clone+0x84>
  {
    return fork();
    802036a8:	ffffe097          	auipc	ra,0xffffe
    802036ac:	7e2080e7          	jalr	2018(ra) # 80201e8a <fork>
    802036b0:	87aa                	mv	a5,a0
  }
  else
    return clone(flags,stack,ptid,tls,ctid);
}
    802036b2:	853e                	mv	a0,a5
    802036b4:	70a2                	ld	ra,40(sp)
    802036b6:	7402                	ld	s0,32(sp)
    802036b8:	6145                	addi	sp,sp,48
    802036ba:	8082                	ret
    return clone(flags,stack,ptid,tls,ctid);
    802036bc:	fe042703          	lw	a4,-32(s0)
    802036c0:	fe442683          	lw	a3,-28(s0)
    802036c4:	fe842603          	lw	a2,-24(s0)
    802036c8:	fec42503          	lw	a0,-20(s0)
    802036cc:	fffff097          	auipc	ra,0xfffff
    802036d0:	034080e7          	jalr	52(ra) # 80202700 <clone>
    802036d4:	87aa                	mv	a5,a0
    802036d6:	bff1                	j	802036b2 <sys_clone+0x7a>
    return -1;
    802036d8:	57fd                	li	a5,-1
    802036da:	bfe1                	j	802036b2 <sys_clone+0x7a>

00000000802036dc <sys_brk>:

// sys_brk lzq
// 将数据段addr 修改为 pos ， 成功则返回0
// Linux brk(0) return 0, but different in this work this will return the now addr
uint64
sys_brk(void){
    802036dc:	1101                	addi	sp,sp,-32
    802036de:	ec06                	sd	ra,24(sp)
    802036e0:	e822                	sd	s0,16(sp)
    802036e2:	1000                	addi	s0,sp,32
    int addr, pos;
    if(argint(0, &pos) <0 )
    802036e4:	fec40593          	addi	a1,s0,-20
    802036e8:	4501                	li	a0,0
    802036ea:	00000097          	auipc	ra,0x0
    802036ee:	a7e080e7          	jalr	-1410(ra) # 80203168 <argint>
    802036f2:	04054063          	bltz	a0,80203732 <sys_brk+0x56>
        return -1;
    addr = myproc()->sz;
    802036f6:	ffffe097          	auipc	ra,0xffffe
    802036fa:	36a080e7          	jalr	874(ra) # 80201a60 <myproc>
    802036fe:	4528                	lw	a0,72(a0)
    if(pos == 0) return addr;//the diff with Linux brk(0)
    80203700:	fec42783          	lw	a5,-20(s0)
    80203704:	e789                	bnez	a5,8020370e <sys_brk+0x32>
    if(growproc(pos - addr) < 0)
        panic("growproc error");
    return 0;
}
    80203706:	60e2                	ld	ra,24(sp)
    80203708:	6442                	ld	s0,16(sp)
    8020370a:	6105                	addi	sp,sp,32
    8020370c:	8082                	ret
    if(growproc(pos - addr) < 0)
    8020370e:	40a7853b          	subw	a0,a5,a0
    80203712:	ffffe097          	auipc	ra,0xffffe
    80203716:	700080e7          	jalr	1792(ra) # 80201e12 <growproc>
    8020371a:	87aa                	mv	a5,a0
    return 0;
    8020371c:	4501                	li	a0,0
    if(growproc(pos - addr) < 0)
    8020371e:	fe07d4e3          	bgez	a5,80203706 <sys_brk+0x2a>
        panic("growproc error");
    80203722:	00007517          	auipc	a0,0x7
    80203726:	4de50513          	addi	a0,a0,1246 # 8020ac00 <digits+0x880>
    8020372a:	ffffd097          	auipc	ra,0xffffd
    8020372e:	a18080e7          	jalr	-1512(ra) # 80200142 <panic>
        return -1;
    80203732:	557d                	li	a0,-1
    80203734:	bfc9                	j	80203706 <sys_brk+0x2a>

0000000080203736 <sys_wait4>:

// added by lmq for SYS_wait4
uint64
sys_wait4(void)
{
    80203736:	1101                	addi	sp,sp,-32
    80203738:	ec06                	sd	ra,24(sp)
    8020373a:	e822                	sd	s0,16(sp)
    8020373c:	1000                	addi	s0,sp,32
  int cpid;             // child pid which current pid is waiting for
  uint64 addr;          // addr of wstatus
  argint(0,&cpid);
    8020373e:	fec40593          	addi	a1,s0,-20
    80203742:	4501                	li	a0,0
    80203744:	00000097          	auipc	ra,0x0
    80203748:	a24080e7          	jalr	-1500(ra) # 80203168 <argint>
  argaddr(1, &addr);
    8020374c:	fe040593          	addi	a1,s0,-32
    80203750:	4505                	li	a0,1
    80203752:	00000097          	auipc	ra,0x0
    80203756:	a78080e7          	jalr	-1416(ra) # 802031ca <argaddr>
  return waitpid(cpid,addr,0);
    8020375a:	4601                	li	a2,0
    8020375c:	fe043583          	ld	a1,-32(s0)
    80203760:	fec42503          	lw	a0,-20(s0)
    80203764:	fffff097          	auipc	ra,0xfffff
    80203768:	0bc080e7          	jalr	188(ra) # 80202820 <waitpid>
}
    8020376c:	60e2                	ld	ra,24(sp)
    8020376e:	6442                	ld	s0,16(sp)
    80203770:	6105                	addi	sp,sp,32
    80203772:	8082                	ret

0000000080203774 <sys_sched_yield>:

// added by lmq for SYS_sched_yield
uint64
sys_sched_yield(void)
{
    80203774:	1141                	addi	sp,sp,-16
    80203776:	e406                	sd	ra,8(sp)
    80203778:	e022                	sd	s0,0(sp)
    8020377a:	0800                	addi	s0,sp,16
  yield();
    8020377c:	fffff097          	auipc	ra,0xfffff
    80203780:	b3e080e7          	jalr	-1218(ra) # 802022ba <yield>
  return 0;
}
    80203784:	4501                	li	a0,0
    80203786:	60a2                	ld	ra,8(sp)
    80203788:	6402                	ld	s0,0(sp)
    8020378a:	0141                	addi	sp,sp,16
    8020378c:	8082                	ret

000000008020378e <sys_getppid>:

// added by lmq for SYS_getppid
uint64 
sys_getppid(void)
{
    8020378e:	1141                	addi	sp,sp,-16
    80203790:	e406                	sd	ra,8(sp)
    80203792:	e022                	sd	s0,0(sp)
    80203794:	0800                	addi	s0,sp,16
  return myproc()->parent->pid;
    80203796:	ffffe097          	auipc	ra,0xffffe
    8020379a:	2ca080e7          	jalr	714(ra) # 80201a60 <myproc>
    8020379e:	711c                	ld	a5,32(a0)
}
    802037a0:	5f88                	lw	a0,56(a5)
    802037a2:	60a2                	ld	ra,8(sp)
    802037a4:	6402                	ld	s0,0(sp)
    802037a6:	0141                	addi	sp,sp,16
    802037a8:	8082                	ret

00000000802037aa <sys_execve>:

// added by lmq for SYS_execve
uint64
sys_execve(void)
{
    802037aa:	da010113          	addi	sp,sp,-608
    802037ae:	24113c23          	sd	ra,600(sp)
    802037b2:	24813823          	sd	s0,592(sp)
    802037b6:	24913423          	sd	s1,584(sp)
    802037ba:	25213023          	sd	s2,576(sp)
    802037be:	23313c23          	sd	s3,568(sp)
    802037c2:	23413823          	sd	s4,560(sp)
    802037c6:	23513423          	sd	s5,552(sp)
    802037ca:	23613023          	sd	s6,544(sp)
    802037ce:	1480                	addi	s0,sp,608
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    802037d0:	10400613          	li	a2,260
    802037d4:	eb840593          	addi	a1,s0,-328
    802037d8:	4501                	li	a0,0
    802037da:	00000097          	auipc	ra,0x0
    802037de:	a12080e7          	jalr	-1518(ra) # 802031ec <argstr>
    return -1;
    802037e2:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    802037e4:	0c054a63          	bltz	a0,802038b8 <sys_execve+0x10e>
    802037e8:	db040593          	addi	a1,s0,-592
    802037ec:	4505                	li	a0,1
    802037ee:	00000097          	auipc	ra,0x0
    802037f2:	9dc080e7          	jalr	-1572(ra) # 802031ca <argaddr>
    802037f6:	0c054163          	bltz	a0,802038b8 <sys_execve+0x10e>
  }
  memset(argv, 0, sizeof(argv));
    802037fa:	10000613          	li	a2,256
    802037fe:	4581                	li	a1,0
    80203800:	db840993          	addi	s3,s0,-584
    80203804:	854e                	mv	a0,s3
    80203806:	ffffd097          	auipc	ra,0xffffd
    8020380a:	f5e080e7          	jalr	-162(ra) # 80200764 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    8020380e:	84ce                	mv	s1,s3
  memset(argv, 0, sizeof(argv));
    80203810:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80203812:	da840a13          	addi	s4,s0,-600
    if(i >= NELEM(argv)){
    80203816:	02000a93          	li	s5,32
    8020381a:	00090b1b          	sext.w	s6,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    8020381e:	00391513          	slli	a0,s2,0x3
    80203822:	85d2                	mv	a1,s4
    80203824:	db043783          	ld	a5,-592(s0)
    80203828:	953e                	add	a0,a0,a5
    8020382a:	00000097          	auipc	ra,0x0
    8020382e:	8be080e7          	jalr	-1858(ra) # 802030e8 <fetchaddr>
    80203832:	02054a63          	bltz	a0,80203866 <sys_execve+0xbc>
      goto bad;
    }
    if(uarg == 0){
    80203836:	da843783          	ld	a5,-600(s0)
    8020383a:	c3b9                	beqz	a5,80203880 <sys_execve+0xd6>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    8020383c:	ffffd097          	auipc	ra,0xffffd
    80203840:	d20080e7          	jalr	-736(ra) # 8020055c <kalloc>
    80203844:	85aa                	mv	a1,a0
    80203846:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    8020384a:	cd11                	beqz	a0,80203866 <sys_execve+0xbc>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    8020384c:	6605                	lui	a2,0x1
    8020384e:	da843503          	ld	a0,-600(s0)
    80203852:	00000097          	auipc	ra,0x0
    80203856:	8e6080e7          	jalr	-1818(ra) # 80203138 <fetchstr>
    8020385a:	00054663          	bltz	a0,80203866 <sys_execve+0xbc>
    if(i >= NELEM(argv)){
    8020385e:	0905                	addi	s2,s2,1
    80203860:	09a1                	addi	s3,s3,8
    80203862:	fb591ce3          	bne	s2,s5,8020381a <sys_execve+0x70>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203866:	10048913          	addi	s2,s1,256
    8020386a:	6088                	ld	a0,0(s1)
    8020386c:	c529                	beqz	a0,802038b6 <sys_execve+0x10c>
    kfree(argv[i]);
    8020386e:	ffffd097          	auipc	ra,0xffffd
    80203872:	bd6080e7          	jalr	-1066(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203876:	04a1                	addi	s1,s1,8
    80203878:	ff2499e3          	bne	s1,s2,8020386a <sys_execve+0xc0>
  return -1;
    8020387c:	597d                	li	s2,-1
    8020387e:	a82d                	j	802038b8 <sys_execve+0x10e>
      argv[i] = 0;
    80203880:	0b0e                	slli	s6,s6,0x3
    80203882:	fc040793          	addi	a5,s0,-64
    80203886:	9b3e                	add	s6,s6,a5
    80203888:	de0b3c23          	sd	zero,-520(s6)
  int ret = exec(path, argv);
    8020388c:	db840593          	addi	a1,s0,-584
    80203890:	eb840513          	addi	a0,s0,-328
    80203894:	00001097          	auipc	ra,0x1
    80203898:	e5c080e7          	jalr	-420(ra) # 802046f0 <exec>
    8020389c:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020389e:	10048993          	addi	s3,s1,256
    802038a2:	6088                	ld	a0,0(s1)
    802038a4:	c911                	beqz	a0,802038b8 <sys_execve+0x10e>
    kfree(argv[i]);
    802038a6:	ffffd097          	auipc	ra,0xffffd
    802038aa:	b9e080e7          	jalr	-1122(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802038ae:	04a1                	addi	s1,s1,8
    802038b0:	ff3499e3          	bne	s1,s3,802038a2 <sys_execve+0xf8>
    802038b4:	a011                	j	802038b8 <sys_execve+0x10e>
  return -1;
    802038b6:	597d                	li	s2,-1

}
    802038b8:	854a                	mv	a0,s2
    802038ba:	25813083          	ld	ra,600(sp)
    802038be:	25013403          	ld	s0,592(sp)
    802038c2:	24813483          	ld	s1,584(sp)
    802038c6:	24013903          	ld	s2,576(sp)
    802038ca:	23813983          	ld	s3,568(sp)
    802038ce:	23013a03          	ld	s4,560(sp)
    802038d2:	22813a83          	ld	s5,552(sp)
    802038d6:	22013b03          	ld	s6,544(sp)
    802038da:	26010113          	addi	sp,sp,608
    802038de:	8082                	ret

00000000802038e0 <sys_shutdown>:

uint64 
sys_shutdown(){
    802038e0:	1141                	addi	sp,sp,-16
    802038e2:	e422                	sd	s0,8(sp)
    802038e4:	0800                	addi	s0,sp,16
	SBI_CALL_0(SBI_SHUTDOWN);
    802038e6:	4501                	li	a0,0
    802038e8:	4581                	li	a1,0
    802038ea:	4601                	li	a2,0
    802038ec:	4681                	li	a3,0
    802038ee:	48a1                	li	a7,8
    802038f0:	00000073          	ecall
    sbi_shutdown();
    return 0;
}
    802038f4:	4501                	li	a0,0
    802038f6:	6422                	ld	s0,8(sp)
    802038f8:	0141                	addi	sp,sp,16
    802038fa:	8082                	ret

00000000802038fc <sys_times>:
	long tms_cstime; 
};


uint64 
sys_times(void) {
    802038fc:	1101                	addi	sp,sp,-32
    802038fe:	ec06                	sd	ra,24(sp)
    80203900:	e822                	sd	s0,16(sp)
    80203902:	1000                	addi	s0,sp,32
  struct tms *tmsbuf; // 用于存储时间数据的结构体指针

  if (argaddr(0, (void*)&tmsbuf) < 0)
    80203904:	fe840593          	addi	a1,s0,-24
    80203908:	4501                	li	a0,0
    8020390a:	00000097          	auipc	ra,0x0
    8020390e:	8c0080e7          	jalr	-1856(ra) # 802031ca <argaddr>
    80203912:	02054963          	bltz	a0,80203944 <sys_times+0x48>
      return -1; // 验证用户传递的结构体指针是否有效

  // 获取当前进程的运行时间数据，并填充到tmsbuf指向的结构体中
  tmsbuf->tms_utime = ticks; // 用户态CPU时间
    80203916:	0000a717          	auipc	a4,0xa
    8020391a:	7e273703          	ld	a4,2018(a4) # 8020e0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
    8020391e:	00076683          	lwu	a3,0(a4)
    80203922:	fe843783          	ld	a5,-24(s0)
    80203926:	e394                	sd	a3,0(a5)
  tmsbuf->tms_stime = 0; // 在xv6中无法直接获取系统态CPU时间
    80203928:	fe843783          	ld	a5,-24(s0)
    8020392c:	0007b423          	sd	zero,8(a5)
  tmsbuf->tms_cutime = 0; // 在xv6中无法直接获取子进程的用户态CPU时间
    80203930:	0007b823          	sd	zero,16(a5)
  tmsbuf->tms_cstime = 0; // 在xv6中无法直接获取子进程的系统态CPU时间
    80203934:	0007bc23          	sd	zero,24(a5)

  return ticks; // 成功返回已经过去的滴答数
    80203938:	00076503          	lwu	a0,0(a4)
}
    8020393c:	60e2                	ld	ra,24(sp)
    8020393e:	6442                	ld	s0,16(sp)
    80203940:	6105                	addi	sp,sp,32
    80203942:	8082                	ret
      return -1; // 验证用户传递的结构体指针是否有效
    80203944:	557d                	li	a0,-1
    80203946:	bfdd                	j	8020393c <sys_times+0x40>

0000000080203948 <sys_uname>:
	char domainname[65];
};

uint64
sys_uname(void)
{
    80203948:	1101                	addi	sp,sp,-32
    8020394a:	ec06                	sd	ra,24(sp)
    8020394c:	e822                	sd	s0,16(sp)
    8020394e:	1000                	addi	s0,sp,32
    struct utsname *buf; // 用于存储系统信息的结构体指针

    if (argaddr(0, (void*)&buf) < 0)
    80203950:	fe840593          	addi	a1,s0,-24
    80203954:	4501                	li	a0,0
    80203956:	00000097          	auipc	ra,0x0
    8020395a:	874080e7          	jalr	-1932(ra) # 802031ca <argaddr>
        return -1; // 验证用户传递的结构体指针是否有效
    8020395e:	57fd                	li	a5,-1
    if (argaddr(0, (void*)&buf) < 0)
    80203960:	08054763          	bltz	a0,802039ee <sys_uname+0xa6>

    // 填充系统信息到buf指向的结构体中
    strncpy(buf->sysname, "HUSTLWL", sizeof(buf->sysname)); // 操作系统名称
    80203964:	04100613          	li	a2,65
    80203968:	00007597          	auipc	a1,0x7
    8020396c:	2a858593          	addi	a1,a1,680 # 8020ac10 <digits+0x890>
    80203970:	fe843503          	ld	a0,-24(s0)
    80203974:	ffffd097          	auipc	ra,0xffffd
    80203978:	f08080e7          	jalr	-248(ra) # 8020087c <strncpy>
    strncpy(buf->nodename, "LWL-host", sizeof(buf->nodename));  // 主机名
    8020397c:	04100613          	li	a2,65
    80203980:	00007597          	auipc	a1,0x7
    80203984:	29858593          	addi	a1,a1,664 # 8020ac18 <digits+0x898>
    80203988:	fe843503          	ld	a0,-24(s0)
    8020398c:	04150513          	addi	a0,a0,65
    80203990:	ffffd097          	auipc	ra,0xffffd
    80203994:	eec080e7          	jalr	-276(ra) # 8020087c <strncpy>
    strncpy(buf->release, "LWL--FirstVersion", sizeof(buf->release)); // 操作系统版本
    80203998:	04100613          	li	a2,65
    8020399c:	00007597          	auipc	a1,0x7
    802039a0:	28c58593          	addi	a1,a1,652 # 8020ac28 <digits+0x8a8>
    802039a4:	fe843503          	ld	a0,-24(s0)
    802039a8:	08250513          	addi	a0,a0,130
    802039ac:	ffffd097          	auipc	ra,0xffffd
    802039b0:	ed0080e7          	jalr	-304(ra) # 8020087c <strncpy>
    strncpy(buf->version, "0.1", sizeof(buf->version)); // 操作系统版本号
    802039b4:	04100613          	li	a2,65
    802039b8:	00007597          	auipc	a1,0x7
    802039bc:	28858593          	addi	a1,a1,648 # 8020ac40 <digits+0x8c0>
    802039c0:	fe843503          	ld	a0,-24(s0)
    802039c4:	0c350513          	addi	a0,a0,195
    802039c8:	ffffd097          	auipc	ra,0xffffd
    802039cc:	eb4080e7          	jalr	-332(ra) # 8020087c <strncpy>
    strncpy(buf->machine, "x86-64", sizeof(buf->machine)); // 硬件架构
    802039d0:	04100613          	li	a2,65
    802039d4:	00007597          	auipc	a1,0x7
    802039d8:	27458593          	addi	a1,a1,628 # 8020ac48 <digits+0x8c8>
    802039dc:	fe843503          	ld	a0,-24(s0)
    802039e0:	10450513          	addi	a0,a0,260
    802039e4:	ffffd097          	auipc	ra,0xffffd
    802039e8:	e98080e7          	jalr	-360(ra) # 8020087c <strncpy>

    return 0; // 返回成功
    802039ec:	4781                	li	a5,0
}
    802039ee:	853e                	mv	a0,a5
    802039f0:	60e2                	ld	ra,24(sp)
    802039f2:	6442                	ld	s0,16(sp)
    802039f4:	6105                	addi	sp,sp,32
    802039f6:	8082                	ret

00000000802039f8 <sys_gettimeofday>:
    long tv_nsec;  // 纳秒部分
};

uint64
sys_gettimeofday(void)
{
    802039f8:	7179                	addi	sp,sp,-48
    802039fa:	f406                	sd	ra,40(sp)
    802039fc:	f022                	sd	s0,32(sp)
    802039fe:	1800                	addi	s0,sp,48
    struct timespec now_ts; // 用于存储时间值的结构体指针
    uint64 ts_addr;
    if (argaddr(0, (void*)&ts_addr) < 0)
    80203a00:	fd840593          	addi	a1,s0,-40
    80203a04:	4501                	li	a0,0
    80203a06:	fffff097          	auipc	ra,0xfffff
    80203a0a:	7c4080e7          	jalr	1988(ra) # 802031ca <argaddr>
    80203a0e:	87aa                	mv	a5,a0
        return -1; // 验证用户传递的结构体指针是否有效
    80203a10:	557d                	li	a0,-1
    if (argaddr(0, (void*)&ts_addr) < 0)
    80203a12:	0407c563          	bltz	a5,80203a5c <sys_gettimeofday+0x64>

    // 获取当前时间，使用ticks转换为秒和纳秒部分
    uint tick = ticks;
    80203a16:	0000a797          	auipc	a5,0xa
    80203a1a:	6e27b783          	ld	a5,1762(a5) # 8020e0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
    80203a1e:	439c                	lw	a5,0(a5)
    now_ts.tv_sec = tick / 100; // 每个滴答100个时钟周期，换算为秒
    80203a20:	06400693          	li	a3,100
    80203a24:	02d7d73b          	divuw	a4,a5,a3
    80203a28:	1702                	slli	a4,a4,0x20
    80203a2a:	9301                	srli	a4,a4,0x20
    80203a2c:	fee43023          	sd	a4,-32(s0)
    now_ts.tv_nsec = (tick % 100) * (1000000000 / 100); // 换算为纳秒
    80203a30:	02d7f7bb          	remuw	a5,a5,a3
    80203a34:	00989737          	lui	a4,0x989
    80203a38:	6807071b          	addiw	a4,a4,1664
    80203a3c:	02e787bb          	mulw	a5,a5,a4
    80203a40:	1782                	slli	a5,a5,0x20
    80203a42:	9381                	srli	a5,a5,0x20
    80203a44:	fef43423          	sd	a5,-24(s0)
    if(copyout2(ts_addr,(char*)&now_ts,sizeof(struct timespec)) < 0)
    80203a48:	4641                	li	a2,16
    80203a4a:	fe040593          	addi	a1,s0,-32
    80203a4e:	fd843503          	ld	a0,-40(s0)
    80203a52:	ffffe097          	auipc	ra,0xffffe
    80203a56:	92a080e7          	jalr	-1750(ra) # 8020137c <copyout2>
    80203a5a:	957d                	srai	a0,a0,0x3f
        return -1; // 将时间值拷贝到用户空间
    return 0; // 返回成功
}
    80203a5c:	70a2                	ld	ra,40(sp)
    80203a5e:	7402                	ld	s0,32(sp)
    80203a60:	6145                	addi	sp,sp,48
    80203a62:	8082                	ret

0000000080203a64 <sys_nanosleep>:

// added by wyx for SYS_nanosleep
uint64
sys_nanosleep(void)
{
    80203a64:	7179                	addi	sp,sp,-48
    80203a66:	f406                	sd	ra,40(sp)
    80203a68:	f022                	sd	s0,32(sp)
    80203a6a:	ec26                	sd	s1,24(sp)
    80203a6c:	e84a                	sd	s2,16(sp)
    80203a6e:	1800                	addi	s0,sp,48
    struct timespec *req; // 用于指定休眠时间的结构体指针
    struct timespec *rem; // 用于返回剩余休眠时间的结构体指针

    if (argaddr(0, (void*)&req) < 0 ||
    80203a70:	fd840593          	addi	a1,s0,-40
    80203a74:	4501                	li	a0,0
    80203a76:	fffff097          	auipc	ra,0xfffff
    80203a7a:	754080e7          	jalr	1876(ra) # 802031ca <argaddr>
        argaddr(1, (void*)&rem) < 0)
        return -1; // 验证用户传递的结构体指针是否有效
    80203a7e:	57fd                	li	a5,-1
    if (argaddr(0, (void*)&req) < 0 ||
    80203a80:	06054763          	bltz	a0,80203aee <sys_nanosleep+0x8a>
        argaddr(1, (void*)&rem) < 0)
    80203a84:	fd040593          	addi	a1,s0,-48
    80203a88:	4505                	li	a0,1
    80203a8a:	fffff097          	auipc	ra,0xfffff
    80203a8e:	740080e7          	jalr	1856(ra) # 802031ca <argaddr>
    if (argaddr(0, (void*)&req) < 0 ||
    80203a92:	06054563          	bltz	a0,80203afc <sys_nanosleep+0x98>

    // 获取休眠时间
    uint sleep_sec = req->tv_sec;
    80203a96:	fd843783          	ld	a5,-40(s0)

    // 计算总的休眠时间（以ticks为单位）
    uint sleep_ticks = sleep_sec * 100 + sleep_nsec / (1000000000 / 100);

    // 获取当前ticks
    uint start_ticks = ticks;
    80203a9a:	0000a717          	auipc	a4,0xa
    80203a9e:	65e73703          	ld	a4,1630(a4) # 8020e0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
    80203aa2:	4314                	lw	a3,0(a4)
    uint sleep_sec = req->tv_sec;
    80203aa4:	6398                	ld	a4,0(a5)
    uint sleep_ticks = sleep_sec * 100 + sleep_nsec / (1000000000 / 100);
    80203aa6:	06400493          	li	s1,100
    80203aaa:	02e484bb          	mulw	s1,s1,a4
    uint sleep_nsec = req->tv_nsec;
    80203aae:	679c                	ld	a5,8(a5)
    uint sleep_ticks = sleep_sec * 100 + sleep_nsec / (1000000000 / 100);
    80203ab0:	00989737          	lui	a4,0x989
    80203ab4:	6807071b          	addiw	a4,a4,1664
    80203ab8:	02e7d7bb          	divuw	a5,a5,a4
    80203abc:	9cbd                	addw	s1,s1,a5
    uint end_ticks = start_ticks + sleep_ticks;
    80203abe:	9cb5                	addw	s1,s1,a3

    // 执行休眠
    while (ticks < end_ticks)
    80203ac0:	0096fe63          	bgeu	a3,s1,80203adc <sys_nanosleep+0x78>
    80203ac4:	0000a917          	auipc	s2,0xa
    80203ac8:	63493903          	ld	s2,1588(s2) # 8020e0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
        yield();
    80203acc:	ffffe097          	auipc	ra,0xffffe
    80203ad0:	7ee080e7          	jalr	2030(ra) # 802022ba <yield>
    while (ticks < end_ticks)
    80203ad4:	00092783          	lw	a5,0(s2)
    80203ad8:	fe97eae3          	bltu	a5,s1,80203acc <sys_nanosleep+0x68>

    // 返回剩余休眠时间（置为0，因为xv6没有提供返回剩余时间的功能）
    rem->tv_sec = 0;
    80203adc:	fd043783          	ld	a5,-48(s0)
    80203ae0:	0007b023          	sd	zero,0(a5)
    rem->tv_nsec = 0;
    80203ae4:	fd043783          	ld	a5,-48(s0)
    80203ae8:	0007b423          	sd	zero,8(a5)

    return 0; // 返回成功
    80203aec:	4781                	li	a5,0
}
    80203aee:	853e                	mv	a0,a5
    80203af0:	70a2                	ld	ra,40(sp)
    80203af2:	7402                	ld	s0,32(sp)
    80203af4:	64e2                	ld	s1,24(sp)
    80203af6:	6942                	ld	s2,16(sp)
    80203af8:	6145                	addi	sp,sp,48
    80203afa:	8082                	ret
        return -1; // 验证用户传递的结构体指针是否有效
    80203afc:	57fd                	li	a5,-1
    80203afe:	bfc5                	j	80203aee <sys_nanosleep+0x8a>

0000000080203b00 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    80203b00:	7139                	addi	sp,sp,-64
    80203b02:	fc06                	sd	ra,56(sp)
    80203b04:	f822                	sd	s0,48(sp)
    80203b06:	f426                	sd	s1,40(sp)
    80203b08:	f04a                	sd	s2,32(sp)
    80203b0a:	ec4e                	sd	s3,24(sp)
    80203b0c:	e852                	sd	s4,16(sp)
    80203b0e:	e456                	sd	s5,8(sp)
    80203b10:	0080                	addi	s0,sp,64
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    80203b12:	00007597          	auipc	a1,0x7
    80203b16:	13e58593          	addi	a1,a1,318 # 8020ac50 <digits+0x8d0>
    80203b1a:	0002c517          	auipc	a0,0x2c
    80203b1e:	66650513          	addi	a0,a0,1638 # 80230180 <bcache>
    80203b22:	ffffd097          	auipc	ra,0xffffd
    80203b26:	b62080e7          	jalr	-1182(ra) # 80200684 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    80203b2a:	00030797          	auipc	a5,0x30
    80203b2e:	65678793          	addi	a5,a5,1622 # 80234180 <bcache+0x4000>
    80203b32:	00031717          	auipc	a4,0x31
    80203b36:	cb670713          	addi	a4,a4,-842 # 802347e8 <bcache+0x4668>
    80203b3a:	6ae7b823          	sd	a4,1712(a5)
  bcache.head.next = &bcache.head;
    80203b3e:	6ae7bc23          	sd	a4,1720(a5)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80203b42:	0002c497          	auipc	s1,0x2c
    80203b46:	65648493          	addi	s1,s1,1622 # 80230198 <bcache+0x18>
    b->refcnt = 0;
    b->sectorno = ~0;
    80203b4a:	5a7d                	li	s4,-1
    b->dev = ~0;
    b->next = bcache.head.next;
    80203b4c:	893e                	mv	s2,a5
    b->prev = &bcache.head;
    80203b4e:	89ba                	mv	s3,a4
    initsleeplock(&b->lock, "buffer");
    80203b50:	00007a97          	auipc	s5,0x7
    80203b54:	108a8a93          	addi	s5,s5,264 # 8020ac58 <digits+0x8d8>
    b->refcnt = 0;
    80203b58:	0404a023          	sw	zero,64(s1)
    b->sectorno = ~0;
    80203b5c:	0144a623          	sw	s4,12(s1)
    b->dev = ~0;
    80203b60:	0144a423          	sw	s4,8(s1)
    b->next = bcache.head.next;
    80203b64:	6b893783          	ld	a5,1720(s2)
    80203b68:	e8bc                	sd	a5,80(s1)
    b->prev = &bcache.head;
    80203b6a:	0534b423          	sd	s3,72(s1)
    initsleeplock(&b->lock, "buffer");
    80203b6e:	85d6                	mv	a1,s5
    80203b70:	01048513          	addi	a0,s1,16
    80203b74:	00000097          	auipc	ra,0x0
    80203b78:	26e080e7          	jalr	622(ra) # 80203de2 <initsleeplock>
    bcache.head.next->prev = b;
    80203b7c:	6b893783          	ld	a5,1720(s2)
    80203b80:	e7a4                	sd	s1,72(a5)
    bcache.head.next = b;
    80203b82:	6a993c23          	sd	s1,1720(s2)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80203b86:	25848493          	addi	s1,s1,600
    80203b8a:	fd3497e3          	bne	s1,s3,80203b58 <binit+0x58>
  }
  #ifdef DEBUG
  printf("binit\n");
  #endif
}
    80203b8e:	70e2                	ld	ra,56(sp)
    80203b90:	7442                	ld	s0,48(sp)
    80203b92:	74a2                	ld	s1,40(sp)
    80203b94:	7902                	ld	s2,32(sp)
    80203b96:	69e2                	ld	s3,24(sp)
    80203b98:	6a42                	ld	s4,16(sp)
    80203b9a:	6aa2                	ld	s5,8(sp)
    80203b9c:	6121                	addi	sp,sp,64
    80203b9e:	8082                	ret

0000000080203ba0 <bread>:
  panic("bget: no buffers");
}

// Return a locked buf with the contents of the indicated block.
struct buf* 
bread(uint dev, uint sectorno) {
    80203ba0:	7179                	addi	sp,sp,-48
    80203ba2:	f406                	sd	ra,40(sp)
    80203ba4:	f022                	sd	s0,32(sp)
    80203ba6:	ec26                	sd	s1,24(sp)
    80203ba8:	e84a                	sd	s2,16(sp)
    80203baa:	e44e                	sd	s3,8(sp)
    80203bac:	1800                	addi	s0,sp,48
    80203bae:	89aa                	mv	s3,a0
    80203bb0:	892e                	mv	s2,a1
  acquire(&bcache.lock);
    80203bb2:	0002c517          	auipc	a0,0x2c
    80203bb6:	5ce50513          	addi	a0,a0,1486 # 80230180 <bcache>
    80203bba:	ffffd097          	auipc	ra,0xffffd
    80203bbe:	b0e080e7          	jalr	-1266(ra) # 802006c8 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80203bc2:	00031497          	auipc	s1,0x31
    80203bc6:	c764b483          	ld	s1,-906(s1) # 80234838 <bcache+0x46b8>
    80203bca:	00031797          	auipc	a5,0x31
    80203bce:	c1e78793          	addi	a5,a5,-994 # 802347e8 <bcache+0x4668>
    80203bd2:	02f48f63          	beq	s1,a5,80203c10 <bread+0x70>
    80203bd6:	873e                	mv	a4,a5
    80203bd8:	a021                	j	80203be0 <bread+0x40>
    80203bda:	68a4                	ld	s1,80(s1)
    80203bdc:	02e48a63          	beq	s1,a4,80203c10 <bread+0x70>
    if(b->dev == dev && b->sectorno == sectorno){
    80203be0:	449c                	lw	a5,8(s1)
    80203be2:	ff379ce3          	bne	a5,s3,80203bda <bread+0x3a>
    80203be6:	44dc                	lw	a5,12(s1)
    80203be8:	ff2799e3          	bne	a5,s2,80203bda <bread+0x3a>
      b->refcnt++;
    80203bec:	40bc                	lw	a5,64(s1)
    80203bee:	2785                	addiw	a5,a5,1
    80203bf0:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    80203bf2:	0002c517          	auipc	a0,0x2c
    80203bf6:	58e50513          	addi	a0,a0,1422 # 80230180 <bcache>
    80203bfa:	ffffd097          	auipc	ra,0xffffd
    80203bfe:	b22080e7          	jalr	-1246(ra) # 8020071c <release>
      acquiresleep(&b->lock);
    80203c02:	01048513          	addi	a0,s1,16
    80203c06:	00000097          	auipc	ra,0x0
    80203c0a:	216080e7          	jalr	534(ra) # 80203e1c <acquiresleep>
      return b;
    80203c0e:	a8b9                	j	80203c6c <bread+0xcc>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80203c10:	00031497          	auipc	s1,0x31
    80203c14:	c204b483          	ld	s1,-992(s1) # 80234830 <bcache+0x46b0>
    80203c18:	00031797          	auipc	a5,0x31
    80203c1c:	bd078793          	addi	a5,a5,-1072 # 802347e8 <bcache+0x4668>
    80203c20:	00f48863          	beq	s1,a5,80203c30 <bread+0x90>
    80203c24:	873e                	mv	a4,a5
    if(b->refcnt == 0) {
    80203c26:	40bc                	lw	a5,64(s1)
    80203c28:	cf81                	beqz	a5,80203c40 <bread+0xa0>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80203c2a:	64a4                	ld	s1,72(s1)
    80203c2c:	fee49de3          	bne	s1,a4,80203c26 <bread+0x86>
  panic("bget: no buffers");
    80203c30:	00007517          	auipc	a0,0x7
    80203c34:	03050513          	addi	a0,a0,48 # 8020ac60 <digits+0x8e0>
    80203c38:	ffffc097          	auipc	ra,0xffffc
    80203c3c:	50a080e7          	jalr	1290(ra) # 80200142 <panic>
      b->dev = dev;
    80203c40:	0134a423          	sw	s3,8(s1)
      b->sectorno = sectorno;
    80203c44:	0124a623          	sw	s2,12(s1)
      b->valid = 0;
    80203c48:	0004a023          	sw	zero,0(s1)
      b->refcnt = 1;
    80203c4c:	4785                	li	a5,1
    80203c4e:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    80203c50:	0002c517          	auipc	a0,0x2c
    80203c54:	53050513          	addi	a0,a0,1328 # 80230180 <bcache>
    80203c58:	ffffd097          	auipc	ra,0xffffd
    80203c5c:	ac4080e7          	jalr	-1340(ra) # 8020071c <release>
      acquiresleep(&b->lock);
    80203c60:	01048513          	addi	a0,s1,16
    80203c64:	00000097          	auipc	ra,0x0
    80203c68:	1b8080e7          	jalr	440(ra) # 80203e1c <acquiresleep>
  struct buf *b;

  b = bget(dev, sectorno);
  if (!b->valid) {
    80203c6c:	409c                	lw	a5,0(s1)
    80203c6e:	cb89                	beqz	a5,80203c80 <bread+0xe0>
    disk_read(b);
    b->valid = 1;
  }

  return b;
}
    80203c70:	8526                	mv	a0,s1
    80203c72:	70a2                	ld	ra,40(sp)
    80203c74:	7402                	ld	s0,32(sp)
    80203c76:	64e2                	ld	s1,24(sp)
    80203c78:	6942                	ld	s2,16(sp)
    80203c7a:	69a2                	ld	s3,8(sp)
    80203c7c:	6145                	addi	sp,sp,48
    80203c7e:	8082                	ret
    disk_read(b);
    80203c80:	8526                	mv	a0,s1
    80203c82:	00003097          	auipc	ra,0x3
    80203c86:	830080e7          	jalr	-2000(ra) # 802064b2 <disk_read>
    b->valid = 1;
    80203c8a:	4785                	li	a5,1
    80203c8c:	c09c                	sw	a5,0(s1)
  return b;
    80203c8e:	b7cd                	j	80203c70 <bread+0xd0>

0000000080203c90 <bwrite>:

// Write b's contents to disk.  Must be locked.
void 
bwrite(struct buf *b) {
    80203c90:	1101                	addi	sp,sp,-32
    80203c92:	ec06                	sd	ra,24(sp)
    80203c94:	e822                	sd	s0,16(sp)
    80203c96:	e426                	sd	s1,8(sp)
    80203c98:	1000                	addi	s0,sp,32
    80203c9a:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203c9c:	0541                	addi	a0,a0,16
    80203c9e:	00000097          	auipc	ra,0x0
    80203ca2:	218080e7          	jalr	536(ra) # 80203eb6 <holdingsleep>
    80203ca6:	c919                	beqz	a0,80203cbc <bwrite+0x2c>
    panic("bwrite");
  disk_write(b);
    80203ca8:	8526                	mv	a0,s1
    80203caa:	00003097          	auipc	ra,0x3
    80203cae:	822080e7          	jalr	-2014(ra) # 802064cc <disk_write>
}
    80203cb2:	60e2                	ld	ra,24(sp)
    80203cb4:	6442                	ld	s0,16(sp)
    80203cb6:	64a2                	ld	s1,8(sp)
    80203cb8:	6105                	addi	sp,sp,32
    80203cba:	8082                	ret
    panic("bwrite");
    80203cbc:	00007517          	auipc	a0,0x7
    80203cc0:	fbc50513          	addi	a0,a0,-68 # 8020ac78 <digits+0x8f8>
    80203cc4:	ffffc097          	auipc	ra,0xffffc
    80203cc8:	47e080e7          	jalr	1150(ra) # 80200142 <panic>

0000000080203ccc <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80203ccc:	1101                	addi	sp,sp,-32
    80203cce:	ec06                	sd	ra,24(sp)
    80203cd0:	e822                	sd	s0,16(sp)
    80203cd2:	e426                	sd	s1,8(sp)
    80203cd4:	e04a                	sd	s2,0(sp)
    80203cd6:	1000                	addi	s0,sp,32
    80203cd8:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203cda:	01050913          	addi	s2,a0,16
    80203cde:	854a                	mv	a0,s2
    80203ce0:	00000097          	auipc	ra,0x0
    80203ce4:	1d6080e7          	jalr	470(ra) # 80203eb6 <holdingsleep>
    80203ce8:	c92d                	beqz	a0,80203d5a <brelse+0x8e>
    panic("brelse");

  releasesleep(&b->lock);
    80203cea:	854a                	mv	a0,s2
    80203cec:	00000097          	auipc	ra,0x0
    80203cf0:	186080e7          	jalr	390(ra) # 80203e72 <releasesleep>

  acquire(&bcache.lock);
    80203cf4:	0002c517          	auipc	a0,0x2c
    80203cf8:	48c50513          	addi	a0,a0,1164 # 80230180 <bcache>
    80203cfc:	ffffd097          	auipc	ra,0xffffd
    80203d00:	9cc080e7          	jalr	-1588(ra) # 802006c8 <acquire>
  b->refcnt--;
    80203d04:	40bc                	lw	a5,64(s1)
    80203d06:	37fd                	addiw	a5,a5,-1
    80203d08:	0007871b          	sext.w	a4,a5
    80203d0c:	c0bc                	sw	a5,64(s1)
  if (b->refcnt == 0) {
    80203d0e:	eb05                	bnez	a4,80203d3e <brelse+0x72>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80203d10:	68bc                	ld	a5,80(s1)
    80203d12:	64b8                	ld	a4,72(s1)
    80203d14:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80203d16:	64bc                	ld	a5,72(s1)
    80203d18:	68b8                	ld	a4,80(s1)
    80203d1a:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80203d1c:	00030797          	auipc	a5,0x30
    80203d20:	46478793          	addi	a5,a5,1124 # 80234180 <bcache+0x4000>
    80203d24:	6b87b703          	ld	a4,1720(a5)
    80203d28:	e8b8                	sd	a4,80(s1)
    b->prev = &bcache.head;
    80203d2a:	00031717          	auipc	a4,0x31
    80203d2e:	abe70713          	addi	a4,a4,-1346 # 802347e8 <bcache+0x4668>
    80203d32:	e4b8                	sd	a4,72(s1)
    bcache.head.next->prev = b;
    80203d34:	6b87b703          	ld	a4,1720(a5)
    80203d38:	e724                	sd	s1,72(a4)
    bcache.head.next = b;
    80203d3a:	6a97bc23          	sd	s1,1720(a5)
  }
  
  release(&bcache.lock);
    80203d3e:	0002c517          	auipc	a0,0x2c
    80203d42:	44250513          	addi	a0,a0,1090 # 80230180 <bcache>
    80203d46:	ffffd097          	auipc	ra,0xffffd
    80203d4a:	9d6080e7          	jalr	-1578(ra) # 8020071c <release>
}
    80203d4e:	60e2                	ld	ra,24(sp)
    80203d50:	6442                	ld	s0,16(sp)
    80203d52:	64a2                	ld	s1,8(sp)
    80203d54:	6902                	ld	s2,0(sp)
    80203d56:	6105                	addi	sp,sp,32
    80203d58:	8082                	ret
    panic("brelse");
    80203d5a:	00007517          	auipc	a0,0x7
    80203d5e:	f2650513          	addi	a0,a0,-218 # 8020ac80 <digits+0x900>
    80203d62:	ffffc097          	auipc	ra,0xffffc
    80203d66:	3e0080e7          	jalr	992(ra) # 80200142 <panic>

0000000080203d6a <bpin>:

void
bpin(struct buf *b) {
    80203d6a:	1101                	addi	sp,sp,-32
    80203d6c:	ec06                	sd	ra,24(sp)
    80203d6e:	e822                	sd	s0,16(sp)
    80203d70:	e426                	sd	s1,8(sp)
    80203d72:	1000                	addi	s0,sp,32
    80203d74:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80203d76:	0002c517          	auipc	a0,0x2c
    80203d7a:	40a50513          	addi	a0,a0,1034 # 80230180 <bcache>
    80203d7e:	ffffd097          	auipc	ra,0xffffd
    80203d82:	94a080e7          	jalr	-1718(ra) # 802006c8 <acquire>
  b->refcnt++;
    80203d86:	40bc                	lw	a5,64(s1)
    80203d88:	2785                	addiw	a5,a5,1
    80203d8a:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203d8c:	0002c517          	auipc	a0,0x2c
    80203d90:	3f450513          	addi	a0,a0,1012 # 80230180 <bcache>
    80203d94:	ffffd097          	auipc	ra,0xffffd
    80203d98:	988080e7          	jalr	-1656(ra) # 8020071c <release>
}
    80203d9c:	60e2                	ld	ra,24(sp)
    80203d9e:	6442                	ld	s0,16(sp)
    80203da0:	64a2                	ld	s1,8(sp)
    80203da2:	6105                	addi	sp,sp,32
    80203da4:	8082                	ret

0000000080203da6 <bunpin>:

void
bunpin(struct buf *b) {
    80203da6:	1101                	addi	sp,sp,-32
    80203da8:	ec06                	sd	ra,24(sp)
    80203daa:	e822                	sd	s0,16(sp)
    80203dac:	e426                	sd	s1,8(sp)
    80203dae:	1000                	addi	s0,sp,32
    80203db0:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80203db2:	0002c517          	auipc	a0,0x2c
    80203db6:	3ce50513          	addi	a0,a0,974 # 80230180 <bcache>
    80203dba:	ffffd097          	auipc	ra,0xffffd
    80203dbe:	90e080e7          	jalr	-1778(ra) # 802006c8 <acquire>
  b->refcnt--;
    80203dc2:	40bc                	lw	a5,64(s1)
    80203dc4:	37fd                	addiw	a5,a5,-1
    80203dc6:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203dc8:	0002c517          	auipc	a0,0x2c
    80203dcc:	3b850513          	addi	a0,a0,952 # 80230180 <bcache>
    80203dd0:	ffffd097          	auipc	ra,0xffffd
    80203dd4:	94c080e7          	jalr	-1716(ra) # 8020071c <release>
}
    80203dd8:	60e2                	ld	ra,24(sp)
    80203dda:	6442                	ld	s0,16(sp)
    80203ddc:	64a2                	ld	s1,8(sp)
    80203dde:	6105                	addi	sp,sp,32
    80203de0:	8082                	ret

0000000080203de2 <initsleeplock>:
#include "include/proc.h"
#include "include/sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80203de2:	1101                	addi	sp,sp,-32
    80203de4:	ec06                	sd	ra,24(sp)
    80203de6:	e822                	sd	s0,16(sp)
    80203de8:	e426                	sd	s1,8(sp)
    80203dea:	e04a                	sd	s2,0(sp)
    80203dec:	1000                	addi	s0,sp,32
    80203dee:	84aa                	mv	s1,a0
    80203df0:	892e                	mv	s2,a1
  initlock(&lk->lk, "sleep lock");
    80203df2:	00007597          	auipc	a1,0x7
    80203df6:	e9658593          	addi	a1,a1,-362 # 8020ac88 <digits+0x908>
    80203dfa:	0521                	addi	a0,a0,8
    80203dfc:	ffffd097          	auipc	ra,0xffffd
    80203e00:	888080e7          	jalr	-1912(ra) # 80200684 <initlock>
  lk->name = name;
    80203e04:	0324b023          	sd	s2,32(s1)
  lk->locked = 0;
    80203e08:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203e0c:	0204a423          	sw	zero,40(s1)
}
    80203e10:	60e2                	ld	ra,24(sp)
    80203e12:	6442                	ld	s0,16(sp)
    80203e14:	64a2                	ld	s1,8(sp)
    80203e16:	6902                	ld	s2,0(sp)
    80203e18:	6105                	addi	sp,sp,32
    80203e1a:	8082                	ret

0000000080203e1c <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80203e1c:	1101                	addi	sp,sp,-32
    80203e1e:	ec06                	sd	ra,24(sp)
    80203e20:	e822                	sd	s0,16(sp)
    80203e22:	e426                	sd	s1,8(sp)
    80203e24:	e04a                	sd	s2,0(sp)
    80203e26:	1000                	addi	s0,sp,32
    80203e28:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203e2a:	00850913          	addi	s2,a0,8
    80203e2e:	854a                	mv	a0,s2
    80203e30:	ffffd097          	auipc	ra,0xffffd
    80203e34:	898080e7          	jalr	-1896(ra) # 802006c8 <acquire>
  while (lk->locked) {
    80203e38:	409c                	lw	a5,0(s1)
    80203e3a:	cb89                	beqz	a5,80203e4c <acquiresleep+0x30>
    sleep(lk, &lk->lk);
    80203e3c:	85ca                	mv	a1,s2
    80203e3e:	8526                	mv	a0,s1
    80203e40:	ffffe097          	auipc	ra,0xffffe
    80203e44:	4b6080e7          	jalr	1206(ra) # 802022f6 <sleep>
  while (lk->locked) {
    80203e48:	409c                	lw	a5,0(s1)
    80203e4a:	fbed                	bnez	a5,80203e3c <acquiresleep+0x20>
  }
  lk->locked = 1;
    80203e4c:	4785                	li	a5,1
    80203e4e:	c09c                	sw	a5,0(s1)
  lk->pid = myproc()->pid;
    80203e50:	ffffe097          	auipc	ra,0xffffe
    80203e54:	c10080e7          	jalr	-1008(ra) # 80201a60 <myproc>
    80203e58:	5d1c                	lw	a5,56(a0)
    80203e5a:	d49c                	sw	a5,40(s1)
  release(&lk->lk);
    80203e5c:	854a                	mv	a0,s2
    80203e5e:	ffffd097          	auipc	ra,0xffffd
    80203e62:	8be080e7          	jalr	-1858(ra) # 8020071c <release>
}
    80203e66:	60e2                	ld	ra,24(sp)
    80203e68:	6442                	ld	s0,16(sp)
    80203e6a:	64a2                	ld	s1,8(sp)
    80203e6c:	6902                	ld	s2,0(sp)
    80203e6e:	6105                	addi	sp,sp,32
    80203e70:	8082                	ret

0000000080203e72 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80203e72:	1101                	addi	sp,sp,-32
    80203e74:	ec06                	sd	ra,24(sp)
    80203e76:	e822                	sd	s0,16(sp)
    80203e78:	e426                	sd	s1,8(sp)
    80203e7a:	e04a                	sd	s2,0(sp)
    80203e7c:	1000                	addi	s0,sp,32
    80203e7e:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203e80:	00850913          	addi	s2,a0,8
    80203e84:	854a                	mv	a0,s2
    80203e86:	ffffd097          	auipc	ra,0xffffd
    80203e8a:	842080e7          	jalr	-1982(ra) # 802006c8 <acquire>
  lk->locked = 0;
    80203e8e:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203e92:	0204a423          	sw	zero,40(s1)
  wakeup(lk);
    80203e96:	8526                	mv	a0,s1
    80203e98:	ffffe097          	auipc	ra,0xffffe
    80203e9c:	5e2080e7          	jalr	1506(ra) # 8020247a <wakeup>
  release(&lk->lk);
    80203ea0:	854a                	mv	a0,s2
    80203ea2:	ffffd097          	auipc	ra,0xffffd
    80203ea6:	87a080e7          	jalr	-1926(ra) # 8020071c <release>
}
    80203eaa:	60e2                	ld	ra,24(sp)
    80203eac:	6442                	ld	s0,16(sp)
    80203eae:	64a2                	ld	s1,8(sp)
    80203eb0:	6902                	ld	s2,0(sp)
    80203eb2:	6105                	addi	sp,sp,32
    80203eb4:	8082                	ret

0000000080203eb6 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80203eb6:	7179                	addi	sp,sp,-48
    80203eb8:	f406                	sd	ra,40(sp)
    80203eba:	f022                	sd	s0,32(sp)
    80203ebc:	ec26                	sd	s1,24(sp)
    80203ebe:	e84a                	sd	s2,16(sp)
    80203ec0:	e44e                	sd	s3,8(sp)
    80203ec2:	1800                	addi	s0,sp,48
    80203ec4:	84aa                	mv	s1,a0
  int r;
  
  acquire(&lk->lk);
    80203ec6:	00850913          	addi	s2,a0,8
    80203eca:	854a                	mv	a0,s2
    80203ecc:	ffffc097          	auipc	ra,0xffffc
    80203ed0:	7fc080e7          	jalr	2044(ra) # 802006c8 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80203ed4:	409c                	lw	a5,0(s1)
    80203ed6:	ef99                	bnez	a5,80203ef4 <holdingsleep+0x3e>
    80203ed8:	4481                	li	s1,0
  release(&lk->lk);
    80203eda:	854a                	mv	a0,s2
    80203edc:	ffffd097          	auipc	ra,0xffffd
    80203ee0:	840080e7          	jalr	-1984(ra) # 8020071c <release>
  return r;
}
    80203ee4:	8526                	mv	a0,s1
    80203ee6:	70a2                	ld	ra,40(sp)
    80203ee8:	7402                	ld	s0,32(sp)
    80203eea:	64e2                	ld	s1,24(sp)
    80203eec:	6942                	ld	s2,16(sp)
    80203eee:	69a2                	ld	s3,8(sp)
    80203ef0:	6145                	addi	sp,sp,48
    80203ef2:	8082                	ret
  r = lk->locked && (lk->pid == myproc()->pid);
    80203ef4:	0284a983          	lw	s3,40(s1)
    80203ef8:	ffffe097          	auipc	ra,0xffffe
    80203efc:	b68080e7          	jalr	-1176(ra) # 80201a60 <myproc>
    80203f00:	5d04                	lw	s1,56(a0)
    80203f02:	413484b3          	sub	s1,s1,s3
    80203f06:	0014b493          	seqz	s1,s1
    80203f0a:	bfc1                	j	80203eda <holdingsleep+0x24>

0000000080203f0c <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80203f0c:	1101                	addi	sp,sp,-32
    80203f0e:	ec06                	sd	ra,24(sp)
    80203f10:	e822                	sd	s0,16(sp)
    80203f12:	e426                	sd	s1,8(sp)
    80203f14:	e04a                	sd	s2,0(sp)
    80203f16:	1000                	addi	s0,sp,32
  initlock(&ftable.lock, "ftable");
    80203f18:	00007597          	auipc	a1,0x7
    80203f1c:	d8058593          	addi	a1,a1,-640 # 8020ac98 <digits+0x918>
    80203f20:	00031517          	auipc	a0,0x31
    80203f24:	bc050513          	addi	a0,a0,-1088 # 80234ae0 <ftable>
    80203f28:	ffffc097          	auipc	ra,0xffffc
    80203f2c:	75c080e7          	jalr	1884(ra) # 80200684 <initlock>
  struct file *f;
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203f30:	00031497          	auipc	s1,0x31
    80203f34:	bc848493          	addi	s1,s1,-1080 # 80234af8 <ftable+0x18>
    80203f38:	00032917          	auipc	s2,0x32
    80203f3c:	fc090913          	addi	s2,s2,-64 # 80235ef8 <tickslock>
    memset(f, 0, sizeof(struct file));
    80203f40:	02800613          	li	a2,40
    80203f44:	4581                	li	a1,0
    80203f46:	8526                	mv	a0,s1
    80203f48:	ffffd097          	auipc	ra,0xffffd
    80203f4c:	81c080e7          	jalr	-2020(ra) # 80200764 <memset>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203f50:	02848493          	addi	s1,s1,40
    80203f54:	ff2496e3          	bne	s1,s2,80203f40 <fileinit+0x34>
  }

  #ifdef DEBUG
  printf("fileinit\n");
  #endif
}
    80203f58:	60e2                	ld	ra,24(sp)
    80203f5a:	6442                	ld	s0,16(sp)
    80203f5c:	64a2                	ld	s1,8(sp)
    80203f5e:	6902                	ld	s2,0(sp)
    80203f60:	6105                	addi	sp,sp,32
    80203f62:	8082                	ret

0000000080203f64 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80203f64:	1101                	addi	sp,sp,-32
    80203f66:	ec06                	sd	ra,24(sp)
    80203f68:	e822                	sd	s0,16(sp)
    80203f6a:	e426                	sd	s1,8(sp)
    80203f6c:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80203f6e:	00031517          	auipc	a0,0x31
    80203f72:	b7250513          	addi	a0,a0,-1166 # 80234ae0 <ftable>
    80203f76:	ffffc097          	auipc	ra,0xffffc
    80203f7a:	752080e7          	jalr	1874(ra) # 802006c8 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203f7e:	00031497          	auipc	s1,0x31
    80203f82:	b7a48493          	addi	s1,s1,-1158 # 80234af8 <ftable+0x18>
    80203f86:	00032717          	auipc	a4,0x32
    80203f8a:	f7270713          	addi	a4,a4,-142 # 80235ef8 <tickslock>
    if(f->ref == 0){
    80203f8e:	40dc                	lw	a5,4(s1)
    80203f90:	cf99                	beqz	a5,80203fae <filealloc+0x4a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203f92:	02848493          	addi	s1,s1,40
    80203f96:	fee49ce3          	bne	s1,a4,80203f8e <filealloc+0x2a>
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
    80203f9a:	00031517          	auipc	a0,0x31
    80203f9e:	b4650513          	addi	a0,a0,-1210 # 80234ae0 <ftable>
    80203fa2:	ffffc097          	auipc	ra,0xffffc
    80203fa6:	77a080e7          	jalr	1914(ra) # 8020071c <release>
  return NULL;
    80203faa:	4481                	li	s1,0
    80203fac:	a819                	j	80203fc2 <filealloc+0x5e>
      f->ref = 1;
    80203fae:	4785                	li	a5,1
    80203fb0:	c0dc                	sw	a5,4(s1)
      release(&ftable.lock);
    80203fb2:	00031517          	auipc	a0,0x31
    80203fb6:	b2e50513          	addi	a0,a0,-1234 # 80234ae0 <ftable>
    80203fba:	ffffc097          	auipc	ra,0xffffc
    80203fbe:	762080e7          	jalr	1890(ra) # 8020071c <release>
}
    80203fc2:	8526                	mv	a0,s1
    80203fc4:	60e2                	ld	ra,24(sp)
    80203fc6:	6442                	ld	s0,16(sp)
    80203fc8:	64a2                	ld	s1,8(sp)
    80203fca:	6105                	addi	sp,sp,32
    80203fcc:	8082                	ret

0000000080203fce <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80203fce:	1101                	addi	sp,sp,-32
    80203fd0:	ec06                	sd	ra,24(sp)
    80203fd2:	e822                	sd	s0,16(sp)
    80203fd4:	e426                	sd	s1,8(sp)
    80203fd6:	1000                	addi	s0,sp,32
    80203fd8:	84aa                	mv	s1,a0
  acquire(&ftable.lock);
    80203fda:	00031517          	auipc	a0,0x31
    80203fde:	b0650513          	addi	a0,a0,-1274 # 80234ae0 <ftable>
    80203fe2:	ffffc097          	auipc	ra,0xffffc
    80203fe6:	6e6080e7          	jalr	1766(ra) # 802006c8 <acquire>
  if(f->ref < 1)
    80203fea:	40dc                	lw	a5,4(s1)
    80203fec:	02f05263          	blez	a5,80204010 <filedup+0x42>
    panic("filedup");
  f->ref++;
    80203ff0:	2785                	addiw	a5,a5,1
    80203ff2:	c0dc                	sw	a5,4(s1)
  release(&ftable.lock);
    80203ff4:	00031517          	auipc	a0,0x31
    80203ff8:	aec50513          	addi	a0,a0,-1300 # 80234ae0 <ftable>
    80203ffc:	ffffc097          	auipc	ra,0xffffc
    80204000:	720080e7          	jalr	1824(ra) # 8020071c <release>
  return f;
}
    80204004:	8526                	mv	a0,s1
    80204006:	60e2                	ld	ra,24(sp)
    80204008:	6442                	ld	s0,16(sp)
    8020400a:	64a2                	ld	s1,8(sp)
    8020400c:	6105                	addi	sp,sp,32
    8020400e:	8082                	ret
    panic("filedup");
    80204010:	00007517          	auipc	a0,0x7
    80204014:	c9050513          	addi	a0,a0,-880 # 8020aca0 <digits+0x920>
    80204018:	ffffc097          	auipc	ra,0xffffc
    8020401c:	12a080e7          	jalr	298(ra) # 80200142 <panic>

0000000080204020 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80204020:	7139                	addi	sp,sp,-64
    80204022:	fc06                	sd	ra,56(sp)
    80204024:	f822                	sd	s0,48(sp)
    80204026:	f426                	sd	s1,40(sp)
    80204028:	f04a                	sd	s2,32(sp)
    8020402a:	ec4e                	sd	s3,24(sp)
    8020402c:	e852                	sd	s4,16(sp)
    8020402e:	e456                	sd	s5,8(sp)
    80204030:	0080                	addi	s0,sp,64
    80204032:	84aa                	mv	s1,a0
  struct file ff;

  acquire(&ftable.lock);
    80204034:	00031517          	auipc	a0,0x31
    80204038:	aac50513          	addi	a0,a0,-1364 # 80234ae0 <ftable>
    8020403c:	ffffc097          	auipc	ra,0xffffc
    80204040:	68c080e7          	jalr	1676(ra) # 802006c8 <acquire>
  if(f->ref < 1)
    80204044:	40dc                	lw	a5,4(s1)
    80204046:	04f05863          	blez	a5,80204096 <fileclose+0x76>
    panic("fileclose");
  if(--f->ref > 0){
    8020404a:	37fd                	addiw	a5,a5,-1
    8020404c:	0007871b          	sext.w	a4,a5
    80204050:	c0dc                	sw	a5,4(s1)
    80204052:	04e04a63          	bgtz	a4,802040a6 <fileclose+0x86>
    release(&ftable.lock);
    return;
  }
  ff = *f;
    80204056:	0004a903          	lw	s2,0(s1)
    8020405a:	0094ca03          	lbu	s4,9(s1)
    8020405e:	0104b983          	ld	s3,16(s1)
    80204062:	0184ba83          	ld	s5,24(s1)
  f->ref = 0;
    80204066:	0004a223          	sw	zero,4(s1)
  f->type = FD_NONE;
    8020406a:	0004a023          	sw	zero,0(s1)
  release(&ftable.lock);
    8020406e:	00031517          	auipc	a0,0x31
    80204072:	a7250513          	addi	a0,a0,-1422 # 80234ae0 <ftable>
    80204076:	ffffc097          	auipc	ra,0xffffc
    8020407a:	6a6080e7          	jalr	1702(ra) # 8020071c <release>

  if(ff.type == FD_PIPE){
    8020407e:	4785                	li	a5,1
    80204080:	04f90463          	beq	s2,a5,802040c8 <fileclose+0xa8>
    pipeclose(ff.pipe, ff.writable);
  } else if(ff.type == FD_ENTRY){
    80204084:	4789                	li	a5,2
    80204086:	02f91863          	bne	s2,a5,802040b6 <fileclose+0x96>
    eput(ff.ep);
    8020408a:	8556                	mv	a0,s5
    8020408c:	00003097          	auipc	ra,0x3
    80204090:	62a080e7          	jalr	1578(ra) # 802076b6 <eput>
    80204094:	a00d                	j	802040b6 <fileclose+0x96>
    panic("fileclose");
    80204096:	00007517          	auipc	a0,0x7
    8020409a:	c1250513          	addi	a0,a0,-1006 # 8020aca8 <digits+0x928>
    8020409e:	ffffc097          	auipc	ra,0xffffc
    802040a2:	0a4080e7          	jalr	164(ra) # 80200142 <panic>
    release(&ftable.lock);
    802040a6:	00031517          	auipc	a0,0x31
    802040aa:	a3a50513          	addi	a0,a0,-1478 # 80234ae0 <ftable>
    802040ae:	ffffc097          	auipc	ra,0xffffc
    802040b2:	66e080e7          	jalr	1646(ra) # 8020071c <release>
  } else if (ff.type == FD_DEVICE) {

  }
}
    802040b6:	70e2                	ld	ra,56(sp)
    802040b8:	7442                	ld	s0,48(sp)
    802040ba:	74a2                	ld	s1,40(sp)
    802040bc:	7902                	ld	s2,32(sp)
    802040be:	69e2                	ld	s3,24(sp)
    802040c0:	6a42                	ld	s4,16(sp)
    802040c2:	6aa2                	ld	s5,8(sp)
    802040c4:	6121                	addi	sp,sp,64
    802040c6:	8082                	ret
    pipeclose(ff.pipe, ff.writable);
    802040c8:	85d2                	mv	a1,s4
    802040ca:	854e                	mv	a0,s3
    802040cc:	00000097          	auipc	ra,0x0
    802040d0:	3a2080e7          	jalr	930(ra) # 8020446e <pipeclose>
    802040d4:	b7cd                	j	802040b6 <fileclose+0x96>

00000000802040d6 <filestat>:
int
filestat(struct file *f, uint64 addr)
{
  struct stat st;
  
  if(f->type == FD_ENTRY){
    802040d6:	4118                	lw	a4,0(a0)
    802040d8:	4789                	li	a5,2
    802040da:	04f71e63          	bne	a4,a5,80204136 <filestat+0x60>
{
    802040de:	7159                	addi	sp,sp,-112
    802040e0:	f486                	sd	ra,104(sp)
    802040e2:	f0a2                	sd	s0,96(sp)
    802040e4:	eca6                	sd	s1,88(sp)
    802040e6:	e8ca                	sd	s2,80(sp)
    802040e8:	e4ce                	sd	s3,72(sp)
    802040ea:	1880                	addi	s0,sp,112
    802040ec:	84aa                	mv	s1,a0
    802040ee:	892e                	mv	s2,a1
    elock(f->ep);
    802040f0:	6d08                	ld	a0,24(a0)
    802040f2:	00003097          	auipc	ra,0x3
    802040f6:	540080e7          	jalr	1344(ra) # 80207632 <elock>
    estat(f->ep, &st);
    802040fa:	f9840993          	addi	s3,s0,-104
    802040fe:	85ce                	mv	a1,s3
    80204100:	6c88                	ld	a0,24(s1)
    80204102:	00003097          	auipc	ra,0x3
    80204106:	6ec080e7          	jalr	1772(ra) # 802077ee <estat>
    eunlock(f->ep);
    8020410a:	6c88                	ld	a0,24(s1)
    8020410c:	00003097          	auipc	ra,0x3
    80204110:	55c080e7          	jalr	1372(ra) # 80207668 <eunlock>
    // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80204114:	03800613          	li	a2,56
    80204118:	85ce                	mv	a1,s3
    8020411a:	854a                	mv	a0,s2
    8020411c:	ffffd097          	auipc	ra,0xffffd
    80204120:	260080e7          	jalr	608(ra) # 8020137c <copyout2>
    80204124:	41f5551b          	sraiw	a0,a0,0x1f
      return -1;
    return 0;
  }
  return -1;
}
    80204128:	70a6                	ld	ra,104(sp)
    8020412a:	7406                	ld	s0,96(sp)
    8020412c:	64e6                	ld	s1,88(sp)
    8020412e:	6946                	ld	s2,80(sp)
    80204130:	69a6                	ld	s3,72(sp)
    80204132:	6165                	addi	sp,sp,112
    80204134:	8082                	ret
  return -1;
    80204136:	557d                	li	a0,-1
}
    80204138:	8082                	ret

000000008020413a <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    8020413a:	7179                	addi	sp,sp,-48
    8020413c:	f406                	sd	ra,40(sp)
    8020413e:	f022                	sd	s0,32(sp)
    80204140:	ec26                	sd	s1,24(sp)
    80204142:	e84a                	sd	s2,16(sp)
    80204144:	e44e                	sd	s3,8(sp)
    80204146:	1800                	addi	s0,sp,48
  int r = 0;

  if(f->readable == 0)
    80204148:	00854783          	lbu	a5,8(a0)
    8020414c:	c3d5                	beqz	a5,802041f0 <fileread+0xb6>
    8020414e:	84aa                	mv	s1,a0
    80204150:	89ae                	mv	s3,a1
    80204152:	8932                	mv	s2,a2
    return -1;

  switch (f->type) {
    80204154:	411c                	lw	a5,0(a0)
    80204156:	4709                	li	a4,2
    80204158:	06e78263          	beq	a5,a4,802041bc <fileread+0x82>
    8020415c:	470d                	li	a4,3
    8020415e:	02e78b63          	beq	a5,a4,80204194 <fileread+0x5a>
    80204162:	4705                	li	a4,1
    80204164:	00e78a63          	beq	a5,a4,80204178 <fileread+0x3e>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
            f->off += r;
        eunlock(f->ep);
        break;
    default:
      panic("fileread");
    80204168:	00007517          	auipc	a0,0x7
    8020416c:	b5050513          	addi	a0,a0,-1200 # 8020acb8 <digits+0x938>
    80204170:	ffffc097          	auipc	ra,0xffffc
    80204174:	fd2080e7          	jalr	-46(ra) # 80200142 <panic>
        r = piperead(f->pipe, addr, n);
    80204178:	6908                	ld	a0,16(a0)
    8020417a:	00000097          	auipc	ra,0x0
    8020417e:	48c080e7          	jalr	1164(ra) # 80204606 <piperead>
    80204182:	892a                	mv	s2,a0
  }

  return r;
}
    80204184:	854a                	mv	a0,s2
    80204186:	70a2                	ld	ra,40(sp)
    80204188:	7402                	ld	s0,32(sp)
    8020418a:	64e2                	ld	s1,24(sp)
    8020418c:	6942                	ld	s2,16(sp)
    8020418e:	69a2                	ld	s3,8(sp)
    80204190:	6145                	addi	sp,sp,48
    80204192:	8082                	ret
        if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80204194:	02451783          	lh	a5,36(a0)
    80204198:	03079693          	slli	a3,a5,0x30
    8020419c:	92c1                	srli	a3,a3,0x30
    8020419e:	4725                	li	a4,9
    802041a0:	04d76a63          	bltu	a4,a3,802041f4 <fileread+0xba>
    802041a4:	0792                	slli	a5,a5,0x4
    802041a6:	00031717          	auipc	a4,0x31
    802041aa:	89a70713          	addi	a4,a4,-1894 # 80234a40 <devsw>
    802041ae:	97ba                	add	a5,a5,a4
    802041b0:	639c                	ld	a5,0(a5)
    802041b2:	c3b9                	beqz	a5,802041f8 <fileread+0xbe>
        r = devsw[f->major].read(1, addr, n);
    802041b4:	4505                	li	a0,1
    802041b6:	9782                	jalr	a5
    802041b8:	892a                	mv	s2,a0
        break;
    802041ba:	b7e9                	j	80204184 <fileread+0x4a>
        elock(f->ep);
    802041bc:	6d08                	ld	a0,24(a0)
    802041be:	00003097          	auipc	ra,0x3
    802041c2:	474080e7          	jalr	1140(ra) # 80207632 <elock>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
    802041c6:	874a                	mv	a4,s2
    802041c8:	5094                	lw	a3,32(s1)
    802041ca:	864e                	mv	a2,s3
    802041cc:	4585                	li	a1,1
    802041ce:	6c88                	ld	a0,24(s1)
    802041d0:	00003097          	auipc	ra,0x3
    802041d4:	b78080e7          	jalr	-1160(ra) # 80206d48 <eread>
    802041d8:	892a                	mv	s2,a0
    802041da:	00a05563          	blez	a0,802041e4 <fileread+0xaa>
            f->off += r;
    802041de:	509c                	lw	a5,32(s1)
    802041e0:	9fa9                	addw	a5,a5,a0
    802041e2:	d09c                	sw	a5,32(s1)
        eunlock(f->ep);
    802041e4:	6c88                	ld	a0,24(s1)
    802041e6:	00003097          	auipc	ra,0x3
    802041ea:	482080e7          	jalr	1154(ra) # 80207668 <eunlock>
        break;
    802041ee:	bf59                	j	80204184 <fileread+0x4a>
    return -1;
    802041f0:	597d                	li	s2,-1
    802041f2:	bf49                	j	80204184 <fileread+0x4a>
          return -1;
    802041f4:	597d                	li	s2,-1
    802041f6:	b779                	j	80204184 <fileread+0x4a>
    802041f8:	597d                	li	s2,-1
    802041fa:	b769                	j	80204184 <fileread+0x4a>

00000000802041fc <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    802041fc:	7179                	addi	sp,sp,-48
    802041fe:	f406                	sd	ra,40(sp)
    80204200:	f022                	sd	s0,32(sp)
    80204202:	ec26                	sd	s1,24(sp)
    80204204:	e84a                	sd	s2,16(sp)
    80204206:	e44e                	sd	s3,8(sp)
    80204208:	e052                	sd	s4,0(sp)
    8020420a:	1800                	addi	s0,sp,48
  int ret = 0;

  if(f->writable == 0)
    8020420c:	00954783          	lbu	a5,9(a0)
    80204210:	cbcd                	beqz	a5,802042c2 <filewrite+0xc6>
    80204212:	84aa                	mv	s1,a0
    80204214:	892e                	mv	s2,a1
    80204216:	89b2                	mv	s3,a2
    return -1;

  if(f->type == FD_PIPE){
    80204218:	411c                	lw	a5,0(a0)
    8020421a:	4705                	li	a4,1
    8020421c:	04e78963          	beq	a5,a4,8020426e <filewrite+0x72>
    ret = pipewrite(f->pipe, addr, n);
  } else if(f->type == FD_DEVICE){
    80204220:	470d                	li	a4,3
    80204222:	04e78d63          	beq	a5,a4,8020427c <filewrite+0x80>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
      return -1;
    ret = devsw[f->major].write(1, addr, n);
  } else if(f->type == FD_ENTRY){
    80204226:	4709                	li	a4,2
    80204228:	08e79563          	bne	a5,a4,802042b2 <filewrite+0xb6>
    elock(f->ep);
    8020422c:	6d08                	ld	a0,24(a0)
    8020422e:	00003097          	auipc	ra,0x3
    80204232:	404080e7          	jalr	1028(ra) # 80207632 <elock>
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80204236:	00098a1b          	sext.w	s4,s3
    8020423a:	8752                	mv	a4,s4
    8020423c:	5094                	lw	a3,32(s1)
    8020423e:	864a                	mv	a2,s2
    80204240:	4585                	li	a1,1
    80204242:	6c88                	ld	a0,24(s1)
    80204244:	00003097          	auipc	ra,0x3
    80204248:	bfc080e7          	jalr	-1028(ra) # 80206e40 <ewrite>
      ret = n;
      f->off += n;
    } else {
      ret = -1;
    8020424c:	597d                	li	s2,-1
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    8020424e:	05350b63          	beq	a0,s3,802042a4 <filewrite+0xa8>
    }
    eunlock(f->ep);
    80204252:	6c88                	ld	a0,24(s1)
    80204254:	00003097          	auipc	ra,0x3
    80204258:	414080e7          	jalr	1044(ra) # 80207668 <eunlock>
  } else {
    panic("filewrite");
  }

  return ret;
}
    8020425c:	854a                	mv	a0,s2
    8020425e:	70a2                	ld	ra,40(sp)
    80204260:	7402                	ld	s0,32(sp)
    80204262:	64e2                	ld	s1,24(sp)
    80204264:	6942                	ld	s2,16(sp)
    80204266:	69a2                	ld	s3,8(sp)
    80204268:	6a02                	ld	s4,0(sp)
    8020426a:	6145                	addi	sp,sp,48
    8020426c:	8082                	ret
    ret = pipewrite(f->pipe, addr, n);
    8020426e:	6908                	ld	a0,16(a0)
    80204270:	00000097          	auipc	ra,0x0
    80204274:	26e080e7          	jalr	622(ra) # 802044de <pipewrite>
    80204278:	892a                	mv	s2,a0
    8020427a:	b7cd                	j	8020425c <filewrite+0x60>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    8020427c:	02451783          	lh	a5,36(a0)
    80204280:	03079693          	slli	a3,a5,0x30
    80204284:	92c1                	srli	a3,a3,0x30
    80204286:	4725                	li	a4,9
    80204288:	02d76f63          	bltu	a4,a3,802042c6 <filewrite+0xca>
    8020428c:	0792                	slli	a5,a5,0x4
    8020428e:	00030717          	auipc	a4,0x30
    80204292:	7b270713          	addi	a4,a4,1970 # 80234a40 <devsw>
    80204296:	97ba                	add	a5,a5,a4
    80204298:	679c                	ld	a5,8(a5)
    8020429a:	cb85                	beqz	a5,802042ca <filewrite+0xce>
    ret = devsw[f->major].write(1, addr, n);
    8020429c:	4505                	li	a0,1
    8020429e:	9782                	jalr	a5
    802042a0:	892a                	mv	s2,a0
    802042a2:	bf6d                	j	8020425c <filewrite+0x60>
      f->off += n;
    802042a4:	509c                	lw	a5,32(s1)
    802042a6:	01478a3b          	addw	s4,a5,s4
    802042aa:	0344a023          	sw	s4,32(s1)
      ret = n;
    802042ae:	894e                	mv	s2,s3
    802042b0:	b74d                	j	80204252 <filewrite+0x56>
    panic("filewrite");
    802042b2:	00007517          	auipc	a0,0x7
    802042b6:	a1650513          	addi	a0,a0,-1514 # 8020acc8 <digits+0x948>
    802042ba:	ffffc097          	auipc	ra,0xffffc
    802042be:	e88080e7          	jalr	-376(ra) # 80200142 <panic>
    return -1;
    802042c2:	597d                	li	s2,-1
    802042c4:	bf61                	j	8020425c <filewrite+0x60>
      return -1;
    802042c6:	597d                	li	s2,-1
    802042c8:	bf51                	j	8020425c <filewrite+0x60>
    802042ca:	597d                	li	s2,-1
    802042cc:	bf41                	j	8020425c <filewrite+0x60>

00000000802042ce <dirnext>:
int
dirnext(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();

  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    802042ce:	00854783          	lbu	a5,8(a0)
    802042d2:	cfdd                	beqz	a5,80204390 <dirnext+0xc2>
{
    802042d4:	7141                	addi	sp,sp,-496
    802042d6:	f786                	sd	ra,488(sp)
    802042d8:	f3a2                	sd	s0,480(sp)
    802042da:	efa6                	sd	s1,472(sp)
    802042dc:	ebca                	sd	s2,464(sp)
    802042de:	e7ce                	sd	s3,456(sp)
    802042e0:	e3d2                	sd	s4,448(sp)
    802042e2:	ff56                	sd	s5,440(sp)
    802042e4:	1b80                	addi	s0,sp,496
    802042e6:	84aa                	mv	s1,a0
    802042e8:	8aae                	mv	s5,a1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    802042ea:	6d18                	ld	a4,24(a0)
    802042ec:	10074783          	lbu	a5,256(a4)
    802042f0:	8bc1                	andi	a5,a5,16
    return -1;
    802042f2:	557d                	li	a0,-1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    802042f4:	eb91                	bnez	a5,80204308 <dirnext+0x3a>
  // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    return -1;

  return 1;
    802042f6:	70be                	ld	ra,488(sp)
    802042f8:	741e                	ld	s0,480(sp)
    802042fa:	64fe                	ld	s1,472(sp)
    802042fc:	695e                	ld	s2,464(sp)
    802042fe:	69be                	ld	s3,456(sp)
    80204300:	6a1e                	ld	s4,448(sp)
    80204302:	7afa                	ld	s5,440(sp)
    80204304:	617d                	addi	sp,sp,496
    80204306:	8082                	ret
  int count = 0;
    80204308:	e0042e23          	sw	zero,-484(s0)
  elock(f->ep);
    8020430c:	853a                	mv	a0,a4
    8020430e:	00003097          	auipc	ra,0x3
    80204312:	324080e7          	jalr	804(ra) # 80207632 <elock>
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80204316:	e1c40a13          	addi	s4,s0,-484
    8020431a:	e5840993          	addi	s3,s0,-424
    8020431e:	a801                	j	8020432e <dirnext+0x60>
    f->off += count * 32;
    80204320:	e1c42783          	lw	a5,-484(s0)
    80204324:	0057971b          	slliw	a4,a5,0x5
    80204328:	509c                	lw	a5,32(s1)
    8020432a:	9fb9                	addw	a5,a5,a4
    8020432c:	d09c                	sw	a5,32(s1)
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    8020432e:	86d2                	mv	a3,s4
    80204330:	5090                	lw	a2,32(s1)
    80204332:	85ce                	mv	a1,s3
    80204334:	6c88                	ld	a0,24(s1)
    80204336:	00003097          	auipc	ra,0x3
    8020433a:	500080e7          	jalr	1280(ra) # 80207836 <enext>
    8020433e:	892a                	mv	s2,a0
    80204340:	d165                	beqz	a0,80204320 <dirnext+0x52>
  eunlock(f->ep);
    80204342:	6c88                	ld	a0,24(s1)
    80204344:	00003097          	auipc	ra,0x3
    80204348:	324080e7          	jalr	804(ra) # 80207668 <eunlock>
  if (ret == -1)
    8020434c:	57fd                	li	a5,-1
    return 0;
    8020434e:	4501                	li	a0,0
  if (ret == -1)
    80204350:	faf903e3          	beq	s2,a5,802042f6 <dirnext+0x28>
  f->off += count * 32;
    80204354:	e1c42783          	lw	a5,-484(s0)
    80204358:	0057971b          	slliw	a4,a5,0x5
    8020435c:	509c                	lw	a5,32(s1)
    8020435e:	9fb9                	addw	a5,a5,a4
    80204360:	d09c                	sw	a5,32(s1)
  estat(&de, &st);
    80204362:	e2040493          	addi	s1,s0,-480
    80204366:	85a6                	mv	a1,s1
    80204368:	e5840513          	addi	a0,s0,-424
    8020436c:	00003097          	auipc	ra,0x3
    80204370:	482080e7          	jalr	1154(ra) # 802077ee <estat>
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80204374:	03800613          	li	a2,56
    80204378:	85a6                	mv	a1,s1
    8020437a:	8556                	mv	a0,s5
    8020437c:	ffffd097          	auipc	ra,0xffffd
    80204380:	000080e7          	jalr	ra # 8020137c <copyout2>
    80204384:	87aa                	mv	a5,a0
  return 1;
    80204386:	4505                	li	a0,1
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80204388:	f607d7e3          	bgez	a5,802042f6 <dirnext+0x28>
    return -1;
    8020438c:	557d                	li	a0,-1
    8020438e:	b7a5                	j	802042f6 <dirnext+0x28>
    return -1;
    80204390:	557d                	li	a0,-1
    80204392:	8082                	ret

0000000080204394 <pipealloc>:
#include "include/kalloc.h"
#include "include/vm.h"

int
pipealloc(struct file **f0, struct file **f1)
{
    80204394:	7179                	addi	sp,sp,-48
    80204396:	f406                	sd	ra,40(sp)
    80204398:	f022                	sd	s0,32(sp)
    8020439a:	ec26                	sd	s1,24(sp)
    8020439c:	e84a                	sd	s2,16(sp)
    8020439e:	e44e                	sd	s3,8(sp)
    802043a0:	e052                	sd	s4,0(sp)
    802043a2:	1800                	addi	s0,sp,48
    802043a4:	84aa                	mv	s1,a0
    802043a6:	8a2e                	mv	s4,a1
  struct pipe *pi;

  pi = 0;
  *f0 = *f1 = 0;
    802043a8:	0005b023          	sd	zero,0(a1)
    802043ac:	00053023          	sd	zero,0(a0)
  if((*f0 = filealloc()) == NULL || (*f1 = filealloc()) == NULL)
    802043b0:	00000097          	auipc	ra,0x0
    802043b4:	bb4080e7          	jalr	-1100(ra) # 80203f64 <filealloc>
    802043b8:	e088                	sd	a0,0(s1)
    802043ba:	c551                	beqz	a0,80204446 <pipealloc+0xb2>
    802043bc:	00000097          	auipc	ra,0x0
    802043c0:	ba8080e7          	jalr	-1112(ra) # 80203f64 <filealloc>
    802043c4:	00aa3023          	sd	a0,0(s4)
    802043c8:	c92d                	beqz	a0,8020443a <pipealloc+0xa6>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == NULL)
    802043ca:	ffffc097          	auipc	ra,0xffffc
    802043ce:	192080e7          	jalr	402(ra) # 8020055c <kalloc>
    802043d2:	892a                	mv	s2,a0
    802043d4:	c125                	beqz	a0,80204434 <pipealloc+0xa0>
    goto bad;
  pi->readopen = 1;
    802043d6:	4985                	li	s3,1
    802043d8:	23352023          	sw	s3,544(a0)
  pi->writeopen = 1;
    802043dc:	23352223          	sw	s3,548(a0)
  pi->nwrite = 0;
    802043e0:	20052e23          	sw	zero,540(a0)
  pi->nread = 0;
    802043e4:	20052c23          	sw	zero,536(a0)
  initlock(&pi->lock, "pipe");
    802043e8:	00006597          	auipc	a1,0x6
    802043ec:	72058593          	addi	a1,a1,1824 # 8020ab08 <digits+0x788>
    802043f0:	ffffc097          	auipc	ra,0xffffc
    802043f4:	294080e7          	jalr	660(ra) # 80200684 <initlock>
  (*f0)->type = FD_PIPE;
    802043f8:	609c                	ld	a5,0(s1)
    802043fa:	0137a023          	sw	s3,0(a5)
  (*f0)->readable = 1;
    802043fe:	609c                	ld	a5,0(s1)
    80204400:	01378423          	sb	s3,8(a5)
  (*f0)->writable = 0;
    80204404:	609c                	ld	a5,0(s1)
    80204406:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    8020440a:	609c                	ld	a5,0(s1)
    8020440c:	0127b823          	sd	s2,16(a5)
  (*f1)->type = FD_PIPE;
    80204410:	000a3783          	ld	a5,0(s4)
    80204414:	0137a023          	sw	s3,0(a5)
  (*f1)->readable = 0;
    80204418:	000a3783          	ld	a5,0(s4)
    8020441c:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80204420:	000a3783          	ld	a5,0(s4)
    80204424:	013784a3          	sb	s3,9(a5)
  (*f1)->pipe = pi;
    80204428:	000a3783          	ld	a5,0(s4)
    8020442c:	0127b823          	sd	s2,16(a5)
  return 0;
    80204430:	4501                	li	a0,0
    80204432:	a025                	j	8020445a <pipealloc+0xc6>

 bad:
  if(pi)
    kfree((char*)pi);
  if(*f0)
    80204434:	6088                	ld	a0,0(s1)
    80204436:	e501                	bnez	a0,8020443e <pipealloc+0xaa>
    80204438:	a039                	j	80204446 <pipealloc+0xb2>
    8020443a:	6088                	ld	a0,0(s1)
    8020443c:	c51d                	beqz	a0,8020446a <pipealloc+0xd6>
    fileclose(*f0);
    8020443e:	00000097          	auipc	ra,0x0
    80204442:	be2080e7          	jalr	-1054(ra) # 80204020 <fileclose>
  if(*f1)
    80204446:	000a3783          	ld	a5,0(s4)
    fileclose(*f1);
  return -1;
    8020444a:	557d                	li	a0,-1
  if(*f1)
    8020444c:	c799                	beqz	a5,8020445a <pipealloc+0xc6>
    fileclose(*f1);
    8020444e:	853e                	mv	a0,a5
    80204450:	00000097          	auipc	ra,0x0
    80204454:	bd0080e7          	jalr	-1072(ra) # 80204020 <fileclose>
  return -1;
    80204458:	557d                	li	a0,-1
}
    8020445a:	70a2                	ld	ra,40(sp)
    8020445c:	7402                	ld	s0,32(sp)
    8020445e:	64e2                	ld	s1,24(sp)
    80204460:	6942                	ld	s2,16(sp)
    80204462:	69a2                	ld	s3,8(sp)
    80204464:	6a02                	ld	s4,0(sp)
    80204466:	6145                	addi	sp,sp,48
    80204468:	8082                	ret
  return -1;
    8020446a:	557d                	li	a0,-1
    8020446c:	b7fd                	j	8020445a <pipealloc+0xc6>

000000008020446e <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    8020446e:	1101                	addi	sp,sp,-32
    80204470:	ec06                	sd	ra,24(sp)
    80204472:	e822                	sd	s0,16(sp)
    80204474:	e426                	sd	s1,8(sp)
    80204476:	e04a                	sd	s2,0(sp)
    80204478:	1000                	addi	s0,sp,32
    8020447a:	84aa                	mv	s1,a0
    8020447c:	892e                	mv	s2,a1
  acquire(&pi->lock);
    8020447e:	ffffc097          	auipc	ra,0xffffc
    80204482:	24a080e7          	jalr	586(ra) # 802006c8 <acquire>
  if(writable){
    80204486:	02090d63          	beqz	s2,802044c0 <pipeclose+0x52>
    pi->writeopen = 0;
    8020448a:	2204a223          	sw	zero,548(s1)
    wakeup(&pi->nread);
    8020448e:	21848513          	addi	a0,s1,536
    80204492:	ffffe097          	auipc	ra,0xffffe
    80204496:	fe8080e7          	jalr	-24(ra) # 8020247a <wakeup>
  } else {
    pi->readopen = 0;
    wakeup(&pi->nwrite);
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    8020449a:	2204b783          	ld	a5,544(s1)
    8020449e:	eb95                	bnez	a5,802044d2 <pipeclose+0x64>
    release(&pi->lock);
    802044a0:	8526                	mv	a0,s1
    802044a2:	ffffc097          	auipc	ra,0xffffc
    802044a6:	27a080e7          	jalr	634(ra) # 8020071c <release>
    kfree((char*)pi);
    802044aa:	8526                	mv	a0,s1
    802044ac:	ffffc097          	auipc	ra,0xffffc
    802044b0:	f98080e7          	jalr	-104(ra) # 80200444 <kfree>
  } else
    release(&pi->lock);
}
    802044b4:	60e2                	ld	ra,24(sp)
    802044b6:	6442                	ld	s0,16(sp)
    802044b8:	64a2                	ld	s1,8(sp)
    802044ba:	6902                	ld	s2,0(sp)
    802044bc:	6105                	addi	sp,sp,32
    802044be:	8082                	ret
    pi->readopen = 0;
    802044c0:	2204a023          	sw	zero,544(s1)
    wakeup(&pi->nwrite);
    802044c4:	21c48513          	addi	a0,s1,540
    802044c8:	ffffe097          	auipc	ra,0xffffe
    802044cc:	fb2080e7          	jalr	-78(ra) # 8020247a <wakeup>
    802044d0:	b7e9                	j	8020449a <pipeclose+0x2c>
    release(&pi->lock);
    802044d2:	8526                	mv	a0,s1
    802044d4:	ffffc097          	auipc	ra,0xffffc
    802044d8:	248080e7          	jalr	584(ra) # 8020071c <release>
}
    802044dc:	bfe1                	j	802044b4 <pipeclose+0x46>

00000000802044de <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    802044de:	7175                	addi	sp,sp,-144
    802044e0:	e506                	sd	ra,136(sp)
    802044e2:	e122                	sd	s0,128(sp)
    802044e4:	fca6                	sd	s1,120(sp)
    802044e6:	f8ca                	sd	s2,112(sp)
    802044e8:	f4ce                	sd	s3,104(sp)
    802044ea:	f0d2                	sd	s4,96(sp)
    802044ec:	ecd6                	sd	s5,88(sp)
    802044ee:	e8da                	sd	s6,80(sp)
    802044f0:	e4de                	sd	s7,72(sp)
    802044f2:	e0e2                	sd	s8,64(sp)
    802044f4:	fc66                	sd	s9,56(sp)
    802044f6:	f86a                	sd	s10,48(sp)
    802044f8:	f46e                	sd	s11,40(sp)
    802044fa:	0900                	addi	s0,sp,144
    802044fc:	84aa                	mv	s1,a0
    802044fe:	f6b43c23          	sd	a1,-136(s0)
    80204502:	8b32                	mv	s6,a2
  int i;
  char ch;
  struct proc *pr = myproc();
    80204504:	ffffd097          	auipc	ra,0xffffd
    80204508:	55c080e7          	jalr	1372(ra) # 80201a60 <myproc>
    8020450c:	892a                	mv	s2,a0

  acquire(&pi->lock);
    8020450e:	8526                	mv	a0,s1
    80204510:	ffffc097          	auipc	ra,0xffffc
    80204514:	1b8080e7          	jalr	440(ra) # 802006c8 <acquire>
  for(i = 0; i < n; i++){
    80204518:	0d605a63          	blez	s6,802045ec <pipewrite+0x10e>
    8020451c:	89a6                	mv	s3,s1
    8020451e:	3b7d                	addiw	s6,s6,-1
    80204520:	1b02                	slli	s6,s6,0x20
    80204522:	020b5b13          	srli	s6,s6,0x20
    80204526:	4b81                	li	s7,0
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
      if(pi->readopen == 0 || pr->killed){
        release(&pi->lock);
        return -1;
      }
      wakeup(&pi->nread);
    80204528:	21848a93          	addi	s5,s1,536
      sleep(&pi->nwrite, &pi->lock);
    8020452c:	21c48a13          	addi	s4,s1,540
    }
    // if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    if(copyin2(&ch, addr + i, 1) == -1)
    80204530:	f8f40d93          	addi	s11,s0,-113
    80204534:	5d7d                	li	s10,-1
    80204536:	000b8c9b          	sext.w	s9,s7
    8020453a:	8c66                	mv	s8,s9
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    8020453c:	2184a783          	lw	a5,536(s1)
    80204540:	21c4a703          	lw	a4,540(s1)
    80204544:	2007879b          	addiw	a5,a5,512
    80204548:	02f71b63          	bne	a4,a5,8020457e <pipewrite+0xa0>
      if(pi->readopen == 0 || pr->killed){
    8020454c:	2204a783          	lw	a5,544(s1)
    80204550:	cba5                	beqz	a5,802045c0 <pipewrite+0xe2>
    80204552:	03092783          	lw	a5,48(s2)
    80204556:	e7ad                	bnez	a5,802045c0 <pipewrite+0xe2>
      wakeup(&pi->nread);
    80204558:	8556                	mv	a0,s5
    8020455a:	ffffe097          	auipc	ra,0xffffe
    8020455e:	f20080e7          	jalr	-224(ra) # 8020247a <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    80204562:	85ce                	mv	a1,s3
    80204564:	8552                	mv	a0,s4
    80204566:	ffffe097          	auipc	ra,0xffffe
    8020456a:	d90080e7          	jalr	-624(ra) # 802022f6 <sleep>
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    8020456e:	2184a783          	lw	a5,536(s1)
    80204572:	21c4a703          	lw	a4,540(s1)
    80204576:	2007879b          	addiw	a5,a5,512
    8020457a:	fcf709e3          	beq	a4,a5,8020454c <pipewrite+0x6e>
    if(copyin2(&ch, addr + i, 1) == -1)
    8020457e:	4605                	li	a2,1
    80204580:	f7843783          	ld	a5,-136(s0)
    80204584:	00fb85b3          	add	a1,s7,a5
    80204588:	856e                	mv	a0,s11
    8020458a:	ffffd097          	auipc	ra,0xffffd
    8020458e:	ed0080e7          	jalr	-304(ra) # 8020145a <copyin2>
    80204592:	05a50e63          	beq	a0,s10,802045ee <pipewrite+0x110>
      break;
    pi->data[pi->nwrite++ % PIPESIZE] = ch;
    80204596:	21c4a783          	lw	a5,540(s1)
    8020459a:	0017871b          	addiw	a4,a5,1
    8020459e:	20e4ae23          	sw	a4,540(s1)
    802045a2:	1ff7f793          	andi	a5,a5,511
    802045a6:	97a6                	add	a5,a5,s1
    802045a8:	f8f44703          	lbu	a4,-113(s0)
    802045ac:	00e78c23          	sb	a4,24(a5)
  for(i = 0; i < n; i++){
    802045b0:	001c8c1b          	addiw	s8,s9,1
    802045b4:	001b8793          	addi	a5,s7,1
    802045b8:	036b8b63          	beq	s7,s6,802045ee <pipewrite+0x110>
    802045bc:	8bbe                	mv	s7,a5
    802045be:	bfa5                	j	80204536 <pipewrite+0x58>
        release(&pi->lock);
    802045c0:	8526                	mv	a0,s1
    802045c2:	ffffc097          	auipc	ra,0xffffc
    802045c6:	15a080e7          	jalr	346(ra) # 8020071c <release>
        return -1;
    802045ca:	5c7d                	li	s8,-1
  }
  wakeup(&pi->nread);
  release(&pi->lock);
  return i;
}
    802045cc:	8562                	mv	a0,s8
    802045ce:	60aa                	ld	ra,136(sp)
    802045d0:	640a                	ld	s0,128(sp)
    802045d2:	74e6                	ld	s1,120(sp)
    802045d4:	7946                	ld	s2,112(sp)
    802045d6:	79a6                	ld	s3,104(sp)
    802045d8:	7a06                	ld	s4,96(sp)
    802045da:	6ae6                	ld	s5,88(sp)
    802045dc:	6b46                	ld	s6,80(sp)
    802045de:	6ba6                	ld	s7,72(sp)
    802045e0:	6c06                	ld	s8,64(sp)
    802045e2:	7ce2                	ld	s9,56(sp)
    802045e4:	7d42                	ld	s10,48(sp)
    802045e6:	7da2                	ld	s11,40(sp)
    802045e8:	6149                	addi	sp,sp,144
    802045ea:	8082                	ret
  for(i = 0; i < n; i++){
    802045ec:	4c01                	li	s8,0
  wakeup(&pi->nread);
    802045ee:	21848513          	addi	a0,s1,536
    802045f2:	ffffe097          	auipc	ra,0xffffe
    802045f6:	e88080e7          	jalr	-376(ra) # 8020247a <wakeup>
  release(&pi->lock);
    802045fa:	8526                	mv	a0,s1
    802045fc:	ffffc097          	auipc	ra,0xffffc
    80204600:	120080e7          	jalr	288(ra) # 8020071c <release>
  return i;
    80204604:	b7e1                	j	802045cc <pipewrite+0xee>

0000000080204606 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    80204606:	715d                	addi	sp,sp,-80
    80204608:	e486                	sd	ra,72(sp)
    8020460a:	e0a2                	sd	s0,64(sp)
    8020460c:	fc26                	sd	s1,56(sp)
    8020460e:	f84a                	sd	s2,48(sp)
    80204610:	f44e                	sd	s3,40(sp)
    80204612:	f052                	sd	s4,32(sp)
    80204614:	ec56                	sd	s5,24(sp)
    80204616:	e85a                	sd	s6,16(sp)
    80204618:	0880                	addi	s0,sp,80
    8020461a:	84aa                	mv	s1,a0
    8020461c:	892e                	mv	s2,a1
    8020461e:	8a32                	mv	s4,a2
  int i;
  struct proc *pr = myproc();
    80204620:	ffffd097          	auipc	ra,0xffffd
    80204624:	440080e7          	jalr	1088(ra) # 80201a60 <myproc>
    80204628:	89aa                	mv	s3,a0
  char ch;

  acquire(&pi->lock);
    8020462a:	8b26                	mv	s6,s1
    8020462c:	8526                	mv	a0,s1
    8020462e:	ffffc097          	auipc	ra,0xffffc
    80204632:	09a080e7          	jalr	154(ra) # 802006c8 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80204636:	2184a703          	lw	a4,536(s1)
    8020463a:	21c4a783          	lw	a5,540(s1)
    if(pr->killed){
      release(&pi->lock);
      return -1;
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    8020463e:	21848a93          	addi	s5,s1,536
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80204642:	02f71463          	bne	a4,a5,8020466a <piperead+0x64>
    80204646:	2244a783          	lw	a5,548(s1)
    8020464a:	c385                	beqz	a5,8020466a <piperead+0x64>
    if(pr->killed){
    8020464c:	0309a783          	lw	a5,48(s3)
    80204650:	e7d9                	bnez	a5,802046de <piperead+0xd8>
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80204652:	85da                	mv	a1,s6
    80204654:	8556                	mv	a0,s5
    80204656:	ffffe097          	auipc	ra,0xffffe
    8020465a:	ca0080e7          	jalr	-864(ra) # 802022f6 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    8020465e:	2184a703          	lw	a4,536(s1)
    80204662:	21c4a783          	lw	a5,540(s1)
    80204666:	fef700e3          	beq	a4,a5,80204646 <piperead+0x40>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8020466a:	09405163          	blez	s4,802046ec <piperead+0xe6>
    8020466e:	4981                	li	s3,0
    if(pi->nread == pi->nwrite)
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    // if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    if(copyout2(addr + i, &ch, 1) == -1)
    80204670:	fbf40b13          	addi	s6,s0,-65
    80204674:	5afd                	li	s5,-1
    if(pi->nread == pi->nwrite)
    80204676:	2184a783          	lw	a5,536(s1)
    8020467a:	21c4a703          	lw	a4,540(s1)
    8020467e:	02f70a63          	beq	a4,a5,802046b2 <piperead+0xac>
    ch = pi->data[pi->nread++ % PIPESIZE];
    80204682:	0017871b          	addiw	a4,a5,1
    80204686:	20e4ac23          	sw	a4,536(s1)
    8020468a:	1ff7f793          	andi	a5,a5,511
    8020468e:	97a6                	add	a5,a5,s1
    80204690:	0187c783          	lbu	a5,24(a5)
    80204694:	faf40fa3          	sb	a5,-65(s0)
    if(copyout2(addr + i, &ch, 1) == -1)
    80204698:	4605                	li	a2,1
    8020469a:	85da                	mv	a1,s6
    8020469c:	854a                	mv	a0,s2
    8020469e:	ffffd097          	auipc	ra,0xffffd
    802046a2:	cde080e7          	jalr	-802(ra) # 8020137c <copyout2>
    802046a6:	01550663          	beq	a0,s5,802046b2 <piperead+0xac>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    802046aa:	2985                	addiw	s3,s3,1
    802046ac:	0905                	addi	s2,s2,1
    802046ae:	fd3a14e3          	bne	s4,s3,80204676 <piperead+0x70>
      break;
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    802046b2:	21c48513          	addi	a0,s1,540
    802046b6:	ffffe097          	auipc	ra,0xffffe
    802046ba:	dc4080e7          	jalr	-572(ra) # 8020247a <wakeup>
  release(&pi->lock);
    802046be:	8526                	mv	a0,s1
    802046c0:	ffffc097          	auipc	ra,0xffffc
    802046c4:	05c080e7          	jalr	92(ra) # 8020071c <release>
  return i;
}
    802046c8:	854e                	mv	a0,s3
    802046ca:	60a6                	ld	ra,72(sp)
    802046cc:	6406                	ld	s0,64(sp)
    802046ce:	74e2                	ld	s1,56(sp)
    802046d0:	7942                	ld	s2,48(sp)
    802046d2:	79a2                	ld	s3,40(sp)
    802046d4:	7a02                	ld	s4,32(sp)
    802046d6:	6ae2                	ld	s5,24(sp)
    802046d8:	6b42                	ld	s6,16(sp)
    802046da:	6161                	addi	sp,sp,80
    802046dc:	8082                	ret
      release(&pi->lock);
    802046de:	8526                	mv	a0,s1
    802046e0:	ffffc097          	auipc	ra,0xffffc
    802046e4:	03c080e7          	jalr	60(ra) # 8020071c <release>
      return -1;
    802046e8:	59fd                	li	s3,-1
    802046ea:	bff9                	j	802046c8 <piperead+0xc2>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    802046ec:	4981                	li	s3,0
    802046ee:	b7d1                	j	802046b2 <piperead+0xac>

00000000802046f0 <exec>:
  return 0;
}


int exec(char *path, char **argv)
{
    802046f0:	dd010113          	addi	sp,sp,-560
    802046f4:	22113423          	sd	ra,552(sp)
    802046f8:	22813023          	sd	s0,544(sp)
    802046fc:	20913c23          	sd	s1,536(sp)
    80204700:	21213823          	sd	s2,528(sp)
    80204704:	21313423          	sd	s3,520(sp)
    80204708:	21413023          	sd	s4,512(sp)
    8020470c:	ffd6                	sd	s5,504(sp)
    8020470e:	fbda                	sd	s6,496(sp)
    80204710:	f7de                	sd	s7,488(sp)
    80204712:	f3e2                	sd	s8,480(sp)
    80204714:	efe6                	sd	s9,472(sp)
    80204716:	ebea                	sd	s10,464(sp)
    80204718:	e7ee                	sd	s11,456(sp)
    8020471a:	1c00                	addi	s0,sp,560
    8020471c:	892a                	mv	s2,a0
    8020471e:	dca43c23          	sd	a0,-552(s0)
    80204722:	deb43423          	sd	a1,-536(s0)
  struct elfhdr elf;
  struct dirent *ep;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
  pagetable_t kpagetable = 0, oldkpagetable;
  struct proc *p = myproc();
    80204726:	ffffd097          	auipc	ra,0xffffd
    8020472a:	33a080e7          	jalr	826(ra) # 80201a60 <myproc>
    8020472e:	84aa                	mv	s1,a0

  // Make a copy of p->kpt without old user space, 
  // but with the same kstack we are using now, which can't be changed
  if ((kpagetable = (pagetable_t)kalloc()) == NULL) {
    80204730:	ffffc097          	auipc	ra,0xffffc
    80204734:	e2c080e7          	jalr	-468(ra) # 8020055c <kalloc>
    80204738:	2a050763          	beqz	a0,802049e6 <exec+0x2f6>
    8020473c:	8aaa                	mv	s5,a0
    return -1;
  }
  memmove(kpagetable, p->kpagetable, PGSIZE);
    8020473e:	6605                	lui	a2,0x1
    80204740:	6cac                	ld	a1,88(s1)
    80204742:	ffffc097          	auipc	ra,0xffffc
    80204746:	082080e7          	jalr	130(ra) # 802007c4 <memmove>
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    kpagetable[i] = 0;
    8020474a:	000ab023          	sd	zero,0(s5)
    8020474e:	000ab423          	sd	zero,8(s5)
  }

  if((ep = ename(path)) == NULL) {
    80204752:	854a                	mv	a0,s2
    80204754:	00003097          	auipc	ra,0x3
    80204758:	688080e7          	jalr	1672(ra) # 80207ddc <ename>
    8020475c:	8a2a                	mv	s4,a0
    8020475e:	3a050d63          	beqz	a0,80204b18 <exec+0x428>
    #ifdef DEBUG
    printf("[exec] %s not found\n", path);
    #endif
    goto bad;
  }
  elock(ep);
    80204762:	00003097          	auipc	ra,0x3
    80204766:	ed0080e7          	jalr	-304(ra) # 80207632 <elock>

  // Check ELF header
  if(eread(ep, 0, (uint64) &elf, 0, sizeof(elf)) != sizeof(elf))
    8020476a:	04000713          	li	a4,64
    8020476e:	4681                	li	a3,0
    80204770:	e4840613          	addi	a2,s0,-440
    80204774:	4581                	li	a1,0
    80204776:	8552                	mv	a0,s4
    80204778:	00002097          	auipc	ra,0x2
    8020477c:	5d0080e7          	jalr	1488(ra) # 80206d48 <eread>
    80204780:	04000793          	li	a5,64
    80204784:	00f51a63          	bne	a0,a5,80204798 <exec+0xa8>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    80204788:	e4842703          	lw	a4,-440(s0)
    8020478c:	464c47b7          	lui	a5,0x464c4
    80204790:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39d3ba81>
    80204794:	00f70963          	beq	a4,a5,802047a6 <exec+0xb6>
  printf("[exec] reach bad\n");
  #endif
  if(pagetable)
    proc_freepagetable(pagetable, sz);
  if(kpagetable)
    kvmfree(kpagetable, 0);
    80204798:	4581                	li	a1,0
    8020479a:	8556                	mv	a0,s5
    8020479c:	ffffd097          	auipc	ra,0xffffd
    802047a0:	ee2080e7          	jalr	-286(ra) # 8020167e <kvmfree>
  if(ep){
    802047a4:	a4b5                	j	80204a10 <exec+0x320>
  if((pagetable = proc_pagetable(p)) == NULL)
    802047a6:	8526                	mv	a0,s1
    802047a8:	ffffd097          	auipc	ra,0xffffd
    802047ac:	39c080e7          	jalr	924(ra) # 80201b44 <proc_pagetable>
    802047b0:	e0a43423          	sd	a0,-504(s0)
    802047b4:	d175                	beqz	a0,80204798 <exec+0xa8>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    802047b6:	e6842783          	lw	a5,-408(s0)
    802047ba:	e8045703          	lhu	a4,-384(s0)
    802047be:	cb3d                	beqz	a4,80204834 <exec+0x144>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    802047c0:	4481                	li	s1,0
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    802047c2:	e0043023          	sd	zero,-512(s0)
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    802047c6:	e1040713          	addi	a4,s0,-496
    802047ca:	dee43023          	sd	a4,-544(s0)
    if(ph.vaddr % PGSIZE != 0)
    802047ce:	6b05                	lui	s6,0x1
    802047d0:	fffb0713          	addi	a4,s6,-1 # fff <_entry-0x801ff001>
    802047d4:	dce43823          	sd	a4,-560(s0)
  for(i = 0; i < sz; i += PGSIZE){
    802047d8:	6d85                	lui	s11,0x1
    802047da:	7bfd                	lui	s7,0xfffff
    802047dc:	a4c1                	j	80204a9c <exec+0x3ac>
      panic("loadseg: address should exist");
    802047de:	00006517          	auipc	a0,0x6
    802047e2:	4fa50513          	addi	a0,a0,1274 # 8020acd8 <digits+0x958>
    802047e6:	ffffc097          	auipc	ra,0xffffc
    802047ea:	95c080e7          	jalr	-1700(ra) # 80200142 <panic>
    if(eread(ep, 0, (uint64)pa, offset+i, n) != n)
    802047ee:	874e                	mv	a4,s3
    802047f0:	009d06bb          	addw	a3,s10,s1
    802047f4:	4581                	li	a1,0
    802047f6:	8552                	mv	a0,s4
    802047f8:	00002097          	auipc	ra,0x2
    802047fc:	550080e7          	jalr	1360(ra) # 80206d48 <eread>
    80204800:	2501                	sext.w	a0,a0
    80204802:	1ea99663          	bne	s3,a0,802049ee <exec+0x2fe>
  for(i = 0; i < sz; i += PGSIZE){
    80204806:	009d84bb          	addw	s1,s11,s1
    8020480a:	012b893b          	addw	s2,s7,s2
    8020480e:	2784f763          	bgeu	s1,s8,80204a7c <exec+0x38c>
    pa = walkaddr(pagetable, va + i);
    80204812:	02049593          	slli	a1,s1,0x20
    80204816:	9181                	srli	a1,a1,0x20
    80204818:	95e6                	add	a1,a1,s9
    8020481a:	e0843503          	ld	a0,-504(s0)
    8020481e:	ffffc097          	auipc	ra,0xffffc
    80204822:	39e080e7          	jalr	926(ra) # 80200bbc <walkaddr>
    80204826:	862a                	mv	a2,a0
    if(pa == NULL)
    80204828:	d95d                	beqz	a0,802047de <exec+0xee>
      n = PGSIZE;
    8020482a:	89da                	mv	s3,s6
    if(sz - i < PGSIZE)
    8020482c:	fd6971e3          	bgeu	s2,s6,802047ee <exec+0xfe>
      n = sz - i;
    80204830:	89ca                	mv	s3,s2
    80204832:	bf75                	j	802047ee <exec+0xfe>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    80204834:	4481                	li	s1,0
  eunlock(ep);
    80204836:	8552                	mv	a0,s4
    80204838:	00003097          	auipc	ra,0x3
    8020483c:	e30080e7          	jalr	-464(ra) # 80207668 <eunlock>
  eput(ep);
    80204840:	8552                	mv	a0,s4
    80204842:	00003097          	auipc	ra,0x3
    80204846:	e74080e7          	jalr	-396(ra) # 802076b6 <eput>
  p = myproc();
    8020484a:	ffffd097          	auipc	ra,0xffffd
    8020484e:	216080e7          	jalr	534(ra) # 80201a60 <myproc>
    80204852:	8b2a                	mv	s6,a0
  uint64 oldsz = p->sz;
    80204854:	04853d83          	ld	s11,72(a0)
  sz = PGROUNDUP(sz);
    80204858:	6785                	lui	a5,0x1
    8020485a:	17fd                	addi	a5,a5,-1
    8020485c:	94be                	add	s1,s1,a5
    8020485e:	77fd                	lui	a5,0xfffff
    80204860:	8fe5                	and	a5,a5,s1
    80204862:	def43823          	sd	a5,-528(s0)
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    80204866:	6689                	lui	a3,0x2
    80204868:	96be                	add	a3,a3,a5
    8020486a:	863e                	mv	a2,a5
    8020486c:	85d6                	mv	a1,s5
    8020486e:	e0843483          	ld	s1,-504(s0)
    80204872:	8526                	mv	a0,s1
    80204874:	ffffc097          	auipc	ra,0xffffc
    80204878:	7a4080e7          	jalr	1956(ra) # 80201018 <uvmalloc>
    8020487c:	8d2a                	mv	s10,a0
  ep = 0;
    8020487e:	4a01                	li	s4,0
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    80204880:	16050763          	beqz	a0,802049ee <exec+0x2fe>
  uvmclear(pagetable, sz-2*PGSIZE);
    80204884:	75f9                	lui	a1,0xffffe
    80204886:	95aa                	add	a1,a1,a0
    80204888:	8526                	mv	a0,s1
    8020488a:	ffffd097          	auipc	ra,0xffffd
    8020488e:	a34080e7          	jalr	-1484(ra) # 802012be <uvmclear>
  stackbase = sp - PGSIZE;
    80204892:	7c7d                	lui	s8,0xfffff
    80204894:	9c6a                	add	s8,s8,s10
  for(argc = 0; argv[argc]; argc++) {
    80204896:	de843783          	ld	a5,-536(s0)
    8020489a:	6388                	ld	a0,0(a5)
    8020489c:	c925                	beqz	a0,8020490c <exec+0x21c>
    8020489e:	e8840993          	addi	s3,s0,-376
    802048a2:	f8840c93          	addi	s9,s0,-120
  sp = sz;
    802048a6:	896a                	mv	s2,s10
  for(argc = 0; argv[argc]; argc++) {
    802048a8:	4481                	li	s1,0
    sp -= strlen(argv[argc]) + 1;
    802048aa:	ffffc097          	auipc	ra,0xffffc
    802048ae:	042080e7          	jalr	66(ra) # 802008ec <strlen>
    802048b2:	2505                	addiw	a0,a0,1
    802048b4:	40a90933          	sub	s2,s2,a0
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    802048b8:	ff097913          	andi	s2,s2,-16
    if(sp < stackbase)
    802048bc:	1b896463          	bltu	s2,s8,80204a64 <exec+0x374>
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    802048c0:	de843b83          	ld	s7,-536(s0)
    802048c4:	000bba03          	ld	s4,0(s7) # fffffffffffff000 <kernel_end+0xffffffff7fdc0000>
    802048c8:	8552                	mv	a0,s4
    802048ca:	ffffc097          	auipc	ra,0xffffc
    802048ce:	022080e7          	jalr	34(ra) # 802008ec <strlen>
    802048d2:	0015069b          	addiw	a3,a0,1
    802048d6:	8652                	mv	a2,s4
    802048d8:	85ca                	mv	a1,s2
    802048da:	e0843503          	ld	a0,-504(s0)
    802048de:	ffffd097          	auipc	ra,0xffffd
    802048e2:	a12080e7          	jalr	-1518(ra) # 802012f0 <copyout>
    802048e6:	18054363          	bltz	a0,80204a6c <exec+0x37c>
    ustack[argc] = sp;
    802048ea:	0129b023          	sd	s2,0(s3)
  for(argc = 0; argv[argc]; argc++) {
    802048ee:	0485                	addi	s1,s1,1
    802048f0:	008b8793          	addi	a5,s7,8
    802048f4:	def43423          	sd	a5,-536(s0)
    802048f8:	008bb503          	ld	a0,8(s7)
    802048fc:	c911                	beqz	a0,80204910 <exec+0x220>
    if(argc >= MAXARG)
    802048fe:	09a1                	addi	s3,s3,8
    80204900:	fb3c95e3          	bne	s9,s3,802048aa <exec+0x1ba>
  sz = sz1;
    80204904:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    80204908:	4a01                	li	s4,0
    8020490a:	a0d5                	j	802049ee <exec+0x2fe>
  sp = sz;
    8020490c:	896a                	mv	s2,s10
  for(argc = 0; argv[argc]; argc++) {
    8020490e:	4481                	li	s1,0
  ustack[argc] = 0;
    80204910:	00349793          	slli	a5,s1,0x3
    80204914:	f9040713          	addi	a4,s0,-112
    80204918:	97ba                	add	a5,a5,a4
    8020491a:	ee07bc23          	sd	zero,-264(a5) # ffffffffffffeef8 <kernel_end+0xffffffff7fdbfef8>
  sp -= (argc+1) * sizeof(uint64);
    8020491e:	00148693          	addi	a3,s1,1
    80204922:	068e                	slli	a3,a3,0x3
    80204924:	40d90933          	sub	s2,s2,a3
  sp -= sp % 16;
    80204928:	ff097913          	andi	s2,s2,-16
  if(sp < stackbase)
    8020492c:	01897663          	bgeu	s2,s8,80204938 <exec+0x248>
  sz = sz1;
    80204930:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    80204934:	4a01                	li	s4,0
    80204936:	a865                	j	802049ee <exec+0x2fe>
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    80204938:	e8840613          	addi	a2,s0,-376
    8020493c:	85ca                	mv	a1,s2
    8020493e:	e0843503          	ld	a0,-504(s0)
    80204942:	ffffd097          	auipc	ra,0xffffd
    80204946:	9ae080e7          	jalr	-1618(ra) # 802012f0 <copyout>
    8020494a:	12054563          	bltz	a0,80204a74 <exec+0x384>
  p->trapframe->a1 = sp;
    8020494e:	060b3783          	ld	a5,96(s6)
    80204952:	0727bc23          	sd	s2,120(a5)
  for(last=s=path; *s; s++)
    80204956:	dd843783          	ld	a5,-552(s0)
    8020495a:	0007c703          	lbu	a4,0(a5)
    8020495e:	cf11                	beqz	a4,8020497a <exec+0x28a>
    80204960:	0785                	addi	a5,a5,1
    if(*s == '/')
    80204962:	02f00693          	li	a3,47
    80204966:	a029                	j	80204970 <exec+0x280>
  for(last=s=path; *s; s++)
    80204968:	0785                	addi	a5,a5,1
    8020496a:	fff7c703          	lbu	a4,-1(a5)
    8020496e:	c711                	beqz	a4,8020497a <exec+0x28a>
    if(*s == '/')
    80204970:	fed71ce3          	bne	a4,a3,80204968 <exec+0x278>
      last = s+1;
    80204974:	dcf43c23          	sd	a5,-552(s0)
    80204978:	bfc5                	j	80204968 <exec+0x278>
  safestrcpy(p->name, last, sizeof(p->name));
    8020497a:	4641                	li	a2,16
    8020497c:	dd843583          	ld	a1,-552(s0)
    80204980:	4e0b0513          	addi	a0,s6,1248
    80204984:	ffffc097          	auipc	ra,0xffffc
    80204988:	f36080e7          	jalr	-202(ra) # 802008ba <safestrcpy>
  oldpagetable = p->pagetable;
    8020498c:	050b3503          	ld	a0,80(s6)
  oldkpagetable = p->kpagetable;
    80204990:	058b3983          	ld	s3,88(s6)
  p->pagetable = pagetable;
    80204994:	e0843783          	ld	a5,-504(s0)
    80204998:	04fb3823          	sd	a5,80(s6)
  p->kpagetable = kpagetable;
    8020499c:	055b3c23          	sd	s5,88(s6)
  p->sz = sz;
    802049a0:	05ab3423          	sd	s10,72(s6)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    802049a4:	060b3783          	ld	a5,96(s6)
    802049a8:	e6043703          	ld	a4,-416(s0)
    802049ac:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    802049ae:	060b3783          	ld	a5,96(s6)
    802049b2:	0327b823          	sd	s2,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    802049b6:	85ee                	mv	a1,s11
    802049b8:	ffffd097          	auipc	ra,0xffffd
    802049bc:	228080e7          	jalr	552(ra) # 80201be0 <proc_freepagetable>
  w_satp(MAKE_SATP(p->kpagetable));
    802049c0:	058b3783          	ld	a5,88(s6)
    802049c4:	83b1                	srli	a5,a5,0xc
    802049c6:	577d                	li	a4,-1
    802049c8:	177e                	slli	a4,a4,0x3f
    802049ca:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    802049cc:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    802049d0:	12000073          	sfence.vma
  kvmfree(oldkpagetable, 0);
    802049d4:	4581                	li	a1,0
    802049d6:	854e                	mv	a0,s3
    802049d8:	ffffd097          	auipc	ra,0xffffd
    802049dc:	ca6080e7          	jalr	-858(ra) # 8020167e <kvmfree>
  return argc; // this ends up in a0, the first argument to main(argc, argv)
    802049e0:	0004851b          	sext.w	a0,s1
    802049e4:	a089                	j	80204a26 <exec+0x336>
    return -1;
    802049e6:	557d                	li	a0,-1
    802049e8:	a83d                	j	80204a26 <exec+0x336>
    802049ea:	de943823          	sd	s1,-528(s0)
    proc_freepagetable(pagetable, sz);
    802049ee:	df043583          	ld	a1,-528(s0)
    802049f2:	e0843503          	ld	a0,-504(s0)
    802049f6:	ffffd097          	auipc	ra,0xffffd
    802049fa:	1ea080e7          	jalr	490(ra) # 80201be0 <proc_freepagetable>
    kvmfree(kpagetable, 0);
    802049fe:	4581                	li	a1,0
    80204a00:	8556                	mv	a0,s5
    80204a02:	ffffd097          	auipc	ra,0xffffd
    80204a06:	c7c080e7          	jalr	-900(ra) # 8020167e <kvmfree>
    eunlock(ep);
    eput(ep);
  }
  return -1;
    80204a0a:	557d                	li	a0,-1
  if(ep){
    80204a0c:	000a0d63          	beqz	s4,80204a26 <exec+0x336>
    eunlock(ep);
    80204a10:	8552                	mv	a0,s4
    80204a12:	00003097          	auipc	ra,0x3
    80204a16:	c56080e7          	jalr	-938(ra) # 80207668 <eunlock>
    eput(ep);
    80204a1a:	8552                	mv	a0,s4
    80204a1c:	00003097          	auipc	ra,0x3
    80204a20:	c9a080e7          	jalr	-870(ra) # 802076b6 <eput>
  return -1;
    80204a24:	557d                	li	a0,-1
}
    80204a26:	22813083          	ld	ra,552(sp)
    80204a2a:	22013403          	ld	s0,544(sp)
    80204a2e:	21813483          	ld	s1,536(sp)
    80204a32:	21013903          	ld	s2,528(sp)
    80204a36:	20813983          	ld	s3,520(sp)
    80204a3a:	20013a03          	ld	s4,512(sp)
    80204a3e:	7afe                	ld	s5,504(sp)
    80204a40:	7b5e                	ld	s6,496(sp)
    80204a42:	7bbe                	ld	s7,488(sp)
    80204a44:	7c1e                	ld	s8,480(sp)
    80204a46:	6cfe                	ld	s9,472(sp)
    80204a48:	6d5e                	ld	s10,464(sp)
    80204a4a:	6dbe                	ld	s11,456(sp)
    80204a4c:	23010113          	addi	sp,sp,560
    80204a50:	8082                	ret
    80204a52:	de943823          	sd	s1,-528(s0)
    80204a56:	bf61                	j	802049ee <exec+0x2fe>
    80204a58:	de943823          	sd	s1,-528(s0)
    80204a5c:	bf49                	j	802049ee <exec+0x2fe>
    80204a5e:	de943823          	sd	s1,-528(s0)
    80204a62:	b771                	j	802049ee <exec+0x2fe>
  sz = sz1;
    80204a64:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    80204a68:	4a01                	li	s4,0
    80204a6a:	b751                	j	802049ee <exec+0x2fe>
  sz = sz1;
    80204a6c:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    80204a70:	4a01                	li	s4,0
    80204a72:	bfb5                	j	802049ee <exec+0x2fe>
  sz = sz1;
    80204a74:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    80204a78:	4a01                	li	s4,0
    80204a7a:	bf95                	j	802049ee <exec+0x2fe>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80204a7c:	df043483          	ld	s1,-528(s0)
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80204a80:	e0043783          	ld	a5,-512(s0)
    80204a84:	0017869b          	addiw	a3,a5,1
    80204a88:	e0d43023          	sd	a3,-512(s0)
    80204a8c:	df843783          	ld	a5,-520(s0)
    80204a90:	0387879b          	addiw	a5,a5,56
    80204a94:	e8045703          	lhu	a4,-384(s0)
    80204a98:	d8e6dfe3          	bge	a3,a4,80204836 <exec+0x146>
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80204a9c:	2781                	sext.w	a5,a5
    80204a9e:	def43c23          	sd	a5,-520(s0)
    80204aa2:	03800713          	li	a4,56
    80204aa6:	86be                	mv	a3,a5
    80204aa8:	de043603          	ld	a2,-544(s0)
    80204aac:	4581                	li	a1,0
    80204aae:	8552                	mv	a0,s4
    80204ab0:	00002097          	auipc	ra,0x2
    80204ab4:	298080e7          	jalr	664(ra) # 80206d48 <eread>
    80204ab8:	03800793          	li	a5,56
    80204abc:	f2f517e3          	bne	a0,a5,802049ea <exec+0x2fa>
    if(ph.type != ELF_PROG_LOAD)
    80204ac0:	e1042783          	lw	a5,-496(s0)
    80204ac4:	4705                	li	a4,1
    80204ac6:	fae79de3          	bne	a5,a4,80204a80 <exec+0x390>
    if(ph.memsz < ph.filesz)
    80204aca:	e3843683          	ld	a3,-456(s0)
    80204ace:	e3043783          	ld	a5,-464(s0)
    80204ad2:	f8f6e0e3          	bltu	a3,a5,80204a52 <exec+0x362>
    if(ph.vaddr + ph.memsz < ph.vaddr)
    80204ad6:	e2043783          	ld	a5,-480(s0)
    80204ada:	96be                	add	a3,a3,a5
    80204adc:	f6f6eee3          	bltu	a3,a5,80204a58 <exec+0x368>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80204ae0:	8626                	mv	a2,s1
    80204ae2:	85d6                	mv	a1,s5
    80204ae4:	e0843503          	ld	a0,-504(s0)
    80204ae8:	ffffc097          	auipc	ra,0xffffc
    80204aec:	530080e7          	jalr	1328(ra) # 80201018 <uvmalloc>
    80204af0:	dea43823          	sd	a0,-528(s0)
    80204af4:	d52d                	beqz	a0,80204a5e <exec+0x36e>
    if(ph.vaddr % PGSIZE != 0)
    80204af6:	e2043c83          	ld	s9,-480(s0)
    80204afa:	dd043783          	ld	a5,-560(s0)
    80204afe:	00fcf7b3          	and	a5,s9,a5
    80204b02:	ee0796e3          	bnez	a5,802049ee <exec+0x2fe>
    if(loadseg(pagetable, ph.vaddr, ep, ph.off, ph.filesz) < 0)
    80204b06:	e1842d03          	lw	s10,-488(s0)
    80204b0a:	e3042c03          	lw	s8,-464(s0)
  for(i = 0; i < sz; i += PGSIZE){
    80204b0e:	f60c07e3          	beqz	s8,80204a7c <exec+0x38c>
    80204b12:	8962                	mv	s2,s8
    80204b14:	4481                	li	s1,0
    80204b16:	b9f5                	j	80204812 <exec+0x122>
    kvmfree(kpagetable, 0);
    80204b18:	4581                	li	a1,0
    80204b1a:	8556                	mv	a0,s5
    80204b1c:	ffffd097          	auipc	ra,0xffffd
    80204b20:	b62080e7          	jalr	-1182(ra) # 8020167e <kvmfree>
  return -1;
    80204b24:	557d                	li	a0,-1
    80204b26:	b701                	j	80204a26 <exec+0x336>

0000000080204b28 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80204b28:	7179                	addi	sp,sp,-48
    80204b2a:	f406                	sd	ra,40(sp)
    80204b2c:	f022                	sd	s0,32(sp)
    80204b2e:	ec26                	sd	s1,24(sp)
    80204b30:	e84a                	sd	s2,16(sp)
    80204b32:	1800                	addi	s0,sp,48
    80204b34:	892e                	mv	s2,a1
    80204b36:	84b2                	mv	s1,a2
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    80204b38:	fdc40593          	addi	a1,s0,-36
    80204b3c:	ffffe097          	auipc	ra,0xffffe
    80204b40:	62c080e7          	jalr	1580(ra) # 80203168 <argint>
    80204b44:	04054163          	bltz	a0,80204b86 <argfd+0x5e>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == NULL)
    80204b48:	fdc42703          	lw	a4,-36(s0)
    80204b4c:	07f00793          	li	a5,127
    80204b50:	02e7ed63          	bltu	a5,a4,80204b8a <argfd+0x62>
    80204b54:	ffffd097          	auipc	ra,0xffffd
    80204b58:	f0c080e7          	jalr	-244(ra) # 80201a60 <myproc>
    80204b5c:	fdc42703          	lw	a4,-36(s0)
    80204b60:	01a70793          	addi	a5,a4,26
    80204b64:	078e                	slli	a5,a5,0x3
    80204b66:	953e                	add	a0,a0,a5
    80204b68:	651c                	ld	a5,8(a0)
    80204b6a:	c395                	beqz	a5,80204b8e <argfd+0x66>
    return -1;
  if(pfd)
    80204b6c:	00090463          	beqz	s2,80204b74 <argfd+0x4c>
    *pfd = fd;
    80204b70:	00e92023          	sw	a4,0(s2)
  if(pf)
    *pf = f;
  return 0;
    80204b74:	4501                	li	a0,0
  if(pf)
    80204b76:	c091                	beqz	s1,80204b7a <argfd+0x52>
    *pf = f;
    80204b78:	e09c                	sd	a5,0(s1)
}
    80204b7a:	70a2                	ld	ra,40(sp)
    80204b7c:	7402                	ld	s0,32(sp)
    80204b7e:	64e2                	ld	s1,24(sp)
    80204b80:	6942                	ld	s2,16(sp)
    80204b82:	6145                	addi	sp,sp,48
    80204b84:	8082                	ret
    return -1;
    80204b86:	557d                	li	a0,-1
    80204b88:	bfcd                	j	80204b7a <argfd+0x52>
    return -1;
    80204b8a:	557d                	li	a0,-1
    80204b8c:	b7fd                	j	80204b7a <argfd+0x52>
    80204b8e:	557d                	li	a0,-1
    80204b90:	b7ed                	j	80204b7a <argfd+0x52>

0000000080204b92 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80204b92:	1101                	addi	sp,sp,-32
    80204b94:	ec06                	sd	ra,24(sp)
    80204b96:	e822                	sd	s0,16(sp)
    80204b98:	e426                	sd	s1,8(sp)
    80204b9a:	1000                	addi	s0,sp,32
    80204b9c:	84aa                	mv	s1,a0
  int fd;
  struct proc *p = myproc();
    80204b9e:	ffffd097          	auipc	ra,0xffffd
    80204ba2:	ec2080e7          	jalr	-318(ra) # 80201a60 <myproc>
    80204ba6:	862a                	mv	a2,a0

  for(fd = 0; fd < NOFILE; fd++){
    80204ba8:	0d850793          	addi	a5,a0,216
    80204bac:	4501                	li	a0,0
    80204bae:	08000693          	li	a3,128
    if(p->ofile[fd] == 0){
    80204bb2:	6398                	ld	a4,0(a5)
    80204bb4:	c719                	beqz	a4,80204bc2 <fdalloc+0x30>
  for(fd = 0; fd < NOFILE; fd++){
    80204bb6:	2505                	addiw	a0,a0,1
    80204bb8:	07a1                	addi	a5,a5,8
    80204bba:	fed51ce3          	bne	a0,a3,80204bb2 <fdalloc+0x20>
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
    80204bbe:	557d                	li	a0,-1
    80204bc0:	a031                	j	80204bcc <fdalloc+0x3a>
      p->ofile[fd] = f;
    80204bc2:	01a50793          	addi	a5,a0,26
    80204bc6:	078e                	slli	a5,a5,0x3
    80204bc8:	963e                	add	a2,a2,a5
    80204bca:	e604                	sd	s1,8(a2)
}
    80204bcc:	60e2                	ld	ra,24(sp)
    80204bce:	6442                	ld	s0,16(sp)
    80204bd0:	64a2                	ld	s1,8(sp)
    80204bd2:	6105                	addi	sp,sp,32
    80204bd4:	8082                	ret

0000000080204bd6 <create>:
  return filestat(f, st);
}

static struct dirent*
create(char *path, short type, int mode)
{
    80204bd6:	7169                	addi	sp,sp,-304
    80204bd8:	f606                	sd	ra,296(sp)
    80204bda:	f222                	sd	s0,288(sp)
    80204bdc:	ee26                	sd	s1,280(sp)
    80204bde:	ea4a                	sd	s2,272(sp)
    80204be0:	e64e                	sd	s3,264(sp)
    80204be2:	1a00                	addi	s0,sp,304
    80204be4:	89ae                	mv	s3,a1
  struct dirent *ep, *dp;
  char name[FAT32_MAX_FILENAME + 1];

  if((dp = enameparent(path, name)) == NULL)
    80204be6:	ed040593          	addi	a1,s0,-304
    80204bea:	00003097          	auipc	ra,0x3
    80204bee:	210080e7          	jalr	528(ra) # 80207dfa <enameparent>
    80204bf2:	84aa                	mv	s1,a0
    80204bf4:	cd3d                	beqz	a0,80204c72 <create+0x9c>
    return NULL;

  if (type == T_DIR) {
    80204bf6:	0009879b          	sext.w	a5,s3
    80204bfa:	4705                	li	a4,1
    80204bfc:	06e78d63          	beq	a5,a4,80204c76 <create+0xa0>
    mode = ATTR_READ_ONLY;
  } else {
    mode = 0;  
  }

  elock(dp);
    80204c00:	00003097          	auipc	ra,0x3
    80204c04:	a32080e7          	jalr	-1486(ra) # 80207632 <elock>
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    80204c08:	4601                	li	a2,0
    80204c0a:	ed040593          	addi	a1,s0,-304
    80204c0e:	8526                	mv	a0,s1
    80204c10:	00003097          	auipc	ra,0x3
    80204c14:	f14080e7          	jalr	-236(ra) # 80207b24 <ealloc>
    80204c18:	892a                	mv	s2,a0
    80204c1a:	c121                	beqz	a0,80204c5a <create+0x84>
    eunlock(dp);
    eput(dp);
    return NULL;
  }
  
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204c1c:	2981                	sext.w	s3,s3
    80204c1e:	4789                	li	a5,2
    80204c20:	00f99663          	bne	s3,a5,80204c2c <create+0x56>
      (type == T_FILE && (ep->attribute & ATTR_DIRECTORY))) {
    80204c24:	10094783          	lbu	a5,256(s2)
    80204c28:	8bc1                	andi	a5,a5,16
    80204c2a:	eba5                	bnez	a5,80204c9a <create+0xc4>
    eput(ep);
    eput(dp);
    return NULL;
  }

  eunlock(dp);
    80204c2c:	8526                	mv	a0,s1
    80204c2e:	00003097          	auipc	ra,0x3
    80204c32:	a3a080e7          	jalr	-1478(ra) # 80207668 <eunlock>
  eput(dp);
    80204c36:	8526                	mv	a0,s1
    80204c38:	00003097          	auipc	ra,0x3
    80204c3c:	a7e080e7          	jalr	-1410(ra) # 802076b6 <eput>

  elock(ep);
    80204c40:	854a                	mv	a0,s2
    80204c42:	00003097          	auipc	ra,0x3
    80204c46:	9f0080e7          	jalr	-1552(ra) # 80207632 <elock>
  return ep;
}
    80204c4a:	854a                	mv	a0,s2
    80204c4c:	70b2                	ld	ra,296(sp)
    80204c4e:	7412                	ld	s0,288(sp)
    80204c50:	64f2                	ld	s1,280(sp)
    80204c52:	6952                	ld	s2,272(sp)
    80204c54:	69b2                	ld	s3,264(sp)
    80204c56:	6155                	addi	sp,sp,304
    80204c58:	8082                	ret
    eunlock(dp);
    80204c5a:	8526                	mv	a0,s1
    80204c5c:	00003097          	auipc	ra,0x3
    80204c60:	a0c080e7          	jalr	-1524(ra) # 80207668 <eunlock>
    eput(dp);
    80204c64:	8526                	mv	a0,s1
    80204c66:	00003097          	auipc	ra,0x3
    80204c6a:	a50080e7          	jalr	-1456(ra) # 802076b6 <eput>
    return NULL;
    80204c6e:	4901                	li	s2,0
    80204c70:	bfe9                	j	80204c4a <create+0x74>
    return NULL;
    80204c72:	892a                	mv	s2,a0
    80204c74:	bfd9                	j	80204c4a <create+0x74>
  elock(dp);
    80204c76:	00003097          	auipc	ra,0x3
    80204c7a:	9bc080e7          	jalr	-1604(ra) # 80207632 <elock>
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    80204c7e:	4641                	li	a2,16
    80204c80:	ed040593          	addi	a1,s0,-304
    80204c84:	8526                	mv	a0,s1
    80204c86:	00003097          	auipc	ra,0x3
    80204c8a:	e9e080e7          	jalr	-354(ra) # 80207b24 <ealloc>
    80204c8e:	892a                	mv	s2,a0
    80204c90:	d569                	beqz	a0,80204c5a <create+0x84>
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204c92:	10094783          	lbu	a5,256(s2)
    80204c96:	8bc1                	andi	a5,a5,16
    80204c98:	fbd1                	bnez	a5,80204c2c <create+0x56>
    eunlock(dp);
    80204c9a:	8526                	mv	a0,s1
    80204c9c:	00003097          	auipc	ra,0x3
    80204ca0:	9cc080e7          	jalr	-1588(ra) # 80207668 <eunlock>
    eput(ep);
    80204ca4:	854a                	mv	a0,s2
    80204ca6:	00003097          	auipc	ra,0x3
    80204caa:	a10080e7          	jalr	-1520(ra) # 802076b6 <eput>
    eput(dp);
    80204cae:	8526                	mv	a0,s1
    80204cb0:	00003097          	auipc	ra,0x3
    80204cb4:	a06080e7          	jalr	-1530(ra) # 802076b6 <eput>
    return NULL;
    80204cb8:	4901                	li	s2,0
    80204cba:	bf41                	j	80204c4a <create+0x74>

0000000080204cbc <sys_dup>:
{
    80204cbc:	7179                	addi	sp,sp,-48
    80204cbe:	f406                	sd	ra,40(sp)
    80204cc0:	f022                	sd	s0,32(sp)
    80204cc2:	ec26                	sd	s1,24(sp)
    80204cc4:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0)
    80204cc6:	fd840613          	addi	a2,s0,-40
    80204cca:	4581                	li	a1,0
    80204ccc:	4501                	li	a0,0
    80204cce:	00000097          	auipc	ra,0x0
    80204cd2:	e5a080e7          	jalr	-422(ra) # 80204b28 <argfd>
    return -1;
    80204cd6:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0)
    80204cd8:	02054363          	bltz	a0,80204cfe <sys_dup+0x42>
  if((fd=fdalloc(f)) < 0)
    80204cdc:	fd843503          	ld	a0,-40(s0)
    80204ce0:	00000097          	auipc	ra,0x0
    80204ce4:	eb2080e7          	jalr	-334(ra) # 80204b92 <fdalloc>
    80204ce8:	84aa                	mv	s1,a0
    return -1;
    80204cea:	57fd                	li	a5,-1
  if((fd=fdalloc(f)) < 0)
    80204cec:	00054963          	bltz	a0,80204cfe <sys_dup+0x42>
  filedup(f);
    80204cf0:	fd843503          	ld	a0,-40(s0)
    80204cf4:	fffff097          	auipc	ra,0xfffff
    80204cf8:	2da080e7          	jalr	730(ra) # 80203fce <filedup>
  return fd;
    80204cfc:	87a6                	mv	a5,s1
}
    80204cfe:	853e                	mv	a0,a5
    80204d00:	70a2                	ld	ra,40(sp)
    80204d02:	7402                	ld	s0,32(sp)
    80204d04:	64e2                	ld	s1,24(sp)
    80204d06:	6145                	addi	sp,sp,48
    80204d08:	8082                	ret

0000000080204d0a <sys_read>:
{
    80204d0a:	7179                	addi	sp,sp,-48
    80204d0c:	f406                	sd	ra,40(sp)
    80204d0e:	f022                	sd	s0,32(sp)
    80204d10:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204d12:	fe840613          	addi	a2,s0,-24
    80204d16:	4581                	li	a1,0
    80204d18:	4501                	li	a0,0
    80204d1a:	00000097          	auipc	ra,0x0
    80204d1e:	e0e080e7          	jalr	-498(ra) # 80204b28 <argfd>
    return -1;
    80204d22:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204d24:	04054163          	bltz	a0,80204d66 <sys_read+0x5c>
    80204d28:	fe440593          	addi	a1,s0,-28
    80204d2c:	4509                	li	a0,2
    80204d2e:	ffffe097          	auipc	ra,0xffffe
    80204d32:	43a080e7          	jalr	1082(ra) # 80203168 <argint>
    return -1;
    80204d36:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204d38:	02054763          	bltz	a0,80204d66 <sys_read+0x5c>
    80204d3c:	fd840593          	addi	a1,s0,-40
    80204d40:	4505                	li	a0,1
    80204d42:	ffffe097          	auipc	ra,0xffffe
    80204d46:	488080e7          	jalr	1160(ra) # 802031ca <argaddr>
    return -1;
    80204d4a:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204d4c:	00054d63          	bltz	a0,80204d66 <sys_read+0x5c>
  return fileread(f, p, n);
    80204d50:	fe442603          	lw	a2,-28(s0)
    80204d54:	fd843583          	ld	a1,-40(s0)
    80204d58:	fe843503          	ld	a0,-24(s0)
    80204d5c:	fffff097          	auipc	ra,0xfffff
    80204d60:	3de080e7          	jalr	990(ra) # 8020413a <fileread>
    80204d64:	87aa                	mv	a5,a0
}
    80204d66:	853e                	mv	a0,a5
    80204d68:	70a2                	ld	ra,40(sp)
    80204d6a:	7402                	ld	s0,32(sp)
    80204d6c:	6145                	addi	sp,sp,48
    80204d6e:	8082                	ret

0000000080204d70 <sys_write>:
{
    80204d70:	7179                	addi	sp,sp,-48
    80204d72:	f406                	sd	ra,40(sp)
    80204d74:	f022                	sd	s0,32(sp)
    80204d76:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204d78:	fe840613          	addi	a2,s0,-24
    80204d7c:	4581                	li	a1,0
    80204d7e:	4501                	li	a0,0
    80204d80:	00000097          	auipc	ra,0x0
    80204d84:	da8080e7          	jalr	-600(ra) # 80204b28 <argfd>
    return -1;
    80204d88:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204d8a:	04054163          	bltz	a0,80204dcc <sys_write+0x5c>
    80204d8e:	fe440593          	addi	a1,s0,-28
    80204d92:	4509                	li	a0,2
    80204d94:	ffffe097          	auipc	ra,0xffffe
    80204d98:	3d4080e7          	jalr	980(ra) # 80203168 <argint>
    return -1;
    80204d9c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204d9e:	02054763          	bltz	a0,80204dcc <sys_write+0x5c>
    80204da2:	fd840593          	addi	a1,s0,-40
    80204da6:	4505                	li	a0,1
    80204da8:	ffffe097          	auipc	ra,0xffffe
    80204dac:	422080e7          	jalr	1058(ra) # 802031ca <argaddr>
    return -1;
    80204db0:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204db2:	00054d63          	bltz	a0,80204dcc <sys_write+0x5c>
  return filewrite(f, p, n);
    80204db6:	fe442603          	lw	a2,-28(s0)
    80204dba:	fd843583          	ld	a1,-40(s0)
    80204dbe:	fe843503          	ld	a0,-24(s0)
    80204dc2:	fffff097          	auipc	ra,0xfffff
    80204dc6:	43a080e7          	jalr	1082(ra) # 802041fc <filewrite>
    80204dca:	87aa                	mv	a5,a0
}
    80204dcc:	853e                	mv	a0,a5
    80204dce:	70a2                	ld	ra,40(sp)
    80204dd0:	7402                	ld	s0,32(sp)
    80204dd2:	6145                	addi	sp,sp,48
    80204dd4:	8082                	ret

0000000080204dd6 <sys_close>:
{
    80204dd6:	1101                	addi	sp,sp,-32
    80204dd8:	ec06                	sd	ra,24(sp)
    80204dda:	e822                	sd	s0,16(sp)
    80204ddc:	1000                	addi	s0,sp,32
  if(argfd(0, &fd, &f) < 0)
    80204dde:	fe040613          	addi	a2,s0,-32
    80204de2:	fec40593          	addi	a1,s0,-20
    80204de6:	4501                	li	a0,0
    80204de8:	00000097          	auipc	ra,0x0
    80204dec:	d40080e7          	jalr	-704(ra) # 80204b28 <argfd>
    return -1;
    80204df0:	57fd                	li	a5,-1
  if(argfd(0, &fd, &f) < 0)
    80204df2:	02054463          	bltz	a0,80204e1a <sys_close+0x44>
  myproc()->ofile[fd] = 0;
    80204df6:	ffffd097          	auipc	ra,0xffffd
    80204dfa:	c6a080e7          	jalr	-918(ra) # 80201a60 <myproc>
    80204dfe:	fec42783          	lw	a5,-20(s0)
    80204e02:	07e9                	addi	a5,a5,26
    80204e04:	078e                	slli	a5,a5,0x3
    80204e06:	97aa                	add	a5,a5,a0
    80204e08:	0007b423          	sd	zero,8(a5)
  fileclose(f);
    80204e0c:	fe043503          	ld	a0,-32(s0)
    80204e10:	fffff097          	auipc	ra,0xfffff
    80204e14:	210080e7          	jalr	528(ra) # 80204020 <fileclose>
  return 0;
    80204e18:	4781                	li	a5,0
}
    80204e1a:	853e                	mv	a0,a5
    80204e1c:	60e2                	ld	ra,24(sp)
    80204e1e:	6442                	ld	s0,16(sp)
    80204e20:	6105                	addi	sp,sp,32
    80204e22:	8082                	ret

0000000080204e24 <sys_fstat>:
{
    80204e24:	1101                	addi	sp,sp,-32
    80204e26:	ec06                	sd	ra,24(sp)
    80204e28:	e822                	sd	s0,16(sp)
    80204e2a:	1000                	addi	s0,sp,32
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204e2c:	fe840613          	addi	a2,s0,-24
    80204e30:	4581                	li	a1,0
    80204e32:	4501                	li	a0,0
    80204e34:	00000097          	auipc	ra,0x0
    80204e38:	cf4080e7          	jalr	-780(ra) # 80204b28 <argfd>
    return -1;
    80204e3c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204e3e:	02054563          	bltz	a0,80204e68 <sys_fstat+0x44>
    80204e42:	fe040593          	addi	a1,s0,-32
    80204e46:	4505                	li	a0,1
    80204e48:	ffffe097          	auipc	ra,0xffffe
    80204e4c:	382080e7          	jalr	898(ra) # 802031ca <argaddr>
    return -1;
    80204e50:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204e52:	00054b63          	bltz	a0,80204e68 <sys_fstat+0x44>
  return filestat(f, st);
    80204e56:	fe043583          	ld	a1,-32(s0)
    80204e5a:	fe843503          	ld	a0,-24(s0)
    80204e5e:	fffff097          	auipc	ra,0xfffff
    80204e62:	278080e7          	jalr	632(ra) # 802040d6 <filestat>
    80204e66:	87aa                	mv	a5,a0
}
    80204e68:	853e                	mv	a0,a5
    80204e6a:	60e2                	ld	ra,24(sp)
    80204e6c:	6442                	ld	s0,16(sp)
    80204e6e:	6105                	addi	sp,sp,32
    80204e70:	8082                	ret

0000000080204e72 <sys_open>:

uint64
sys_open(void)
{
    80204e72:	7129                	addi	sp,sp,-320
    80204e74:	fe06                	sd	ra,312(sp)
    80204e76:	fa22                	sd	s0,304(sp)
    80204e78:	f626                	sd	s1,296(sp)
    80204e7a:	f24a                	sd	s2,288(sp)
    80204e7c:	ee4e                	sd	s3,280(sp)
    80204e7e:	0280                	addi	s0,sp,320
  char path[FAT32_MAX_PATH];
  int fd, omode;
  struct file *f;
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204e80:	10400613          	li	a2,260
    80204e84:	ec840593          	addi	a1,s0,-312
    80204e88:	4501                	li	a0,0
    80204e8a:	ffffe097          	auipc	ra,0xffffe
    80204e8e:	362080e7          	jalr	866(ra) # 802031ec <argstr>
    80204e92:	87aa                	mv	a5,a0
    return -1;
    80204e94:	557d                	li	a0,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204e96:	0807ce63          	bltz	a5,80204f32 <sys_open+0xc0>
    80204e9a:	ec440593          	addi	a1,s0,-316
    80204e9e:	4505                	li	a0,1
    80204ea0:	ffffe097          	auipc	ra,0xffffe
    80204ea4:	2c8080e7          	jalr	712(ra) # 80203168 <argint>
    80204ea8:	0e054163          	bltz	a0,80204f8a <sys_open+0x118>
  if(omode & O_CREATE){
    80204eac:	ec442603          	lw	a2,-316(s0)
    80204eb0:	24067793          	andi	a5,a2,576
    80204eb4:	c7d1                	beqz	a5,80204f40 <sys_open+0xce>
    ep = create(path, T_FILE, omode);
    80204eb6:	4589                	li	a1,2
    80204eb8:	ec840513          	addi	a0,s0,-312
    80204ebc:	00000097          	auipc	ra,0x0
    80204ec0:	d1a080e7          	jalr	-742(ra) # 80204bd6 <create>
    80204ec4:	892a                	mv	s2,a0
    if(ep == NULL){
    80204ec6:	c561                	beqz	a0,80204f8e <sys_open+0x11c>
      eput(ep);
      return -1;
    }
  }

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204ec8:	fffff097          	auipc	ra,0xfffff
    80204ecc:	09c080e7          	jalr	156(ra) # 80203f64 <filealloc>
    80204ed0:	89aa                	mv	s3,a0
    80204ed2:	c579                	beqz	a0,80204fa0 <sys_open+0x12e>
    80204ed4:	00000097          	auipc	ra,0x0
    80204ed8:	cbe080e7          	jalr	-834(ra) # 80204b92 <fdalloc>
    80204edc:	84aa                	mv	s1,a0
    80204ede:	0a054c63          	bltz	a0,80204f96 <sys_open+0x124>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    80204ee2:	10094783          	lbu	a5,256(s2)
    80204ee6:	8bc1                	andi	a5,a5,16
    80204ee8:	e791                	bnez	a5,80204ef4 <sys_open+0x82>
    80204eea:	ec442783          	lw	a5,-316(s0)
    80204eee:	4007f793          	andi	a5,a5,1024
    80204ef2:	e7d1                	bnez	a5,80204f7e <sys_open+0x10c>
    etrunc(ep);
  }

  f->type = FD_ENTRY;
    80204ef4:	4789                	li	a5,2
    80204ef6:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    80204efa:	ec442783          	lw	a5,-316(s0)
    80204efe:	0047f693          	andi	a3,a5,4
    80204f02:	4701                	li	a4,0
    80204f04:	c299                	beqz	a3,80204f0a <sys_open+0x98>
    80204f06:	10892703          	lw	a4,264(s2)
    80204f0a:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    80204f0e:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    80204f12:	0017c713          	xori	a4,a5,1
    80204f16:	8b05                	andi	a4,a4,1
    80204f18:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204f1c:	8b8d                	andi	a5,a5,3
    80204f1e:	00f037b3          	snez	a5,a5
    80204f22:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    80204f26:	854a                	mv	a0,s2
    80204f28:	00002097          	auipc	ra,0x2
    80204f2c:	740080e7          	jalr	1856(ra) # 80207668 <eunlock>

  return fd;
    80204f30:	8526                	mv	a0,s1
}
    80204f32:	70f2                	ld	ra,312(sp)
    80204f34:	7452                	ld	s0,304(sp)
    80204f36:	74b2                	ld	s1,296(sp)
    80204f38:	7912                	ld	s2,288(sp)
    80204f3a:	69f2                	ld	s3,280(sp)
    80204f3c:	6131                	addi	sp,sp,320
    80204f3e:	8082                	ret
    if((ep = ename(path)) == NULL){
    80204f40:	ec840513          	addi	a0,s0,-312
    80204f44:	00003097          	auipc	ra,0x3
    80204f48:	e98080e7          	jalr	-360(ra) # 80207ddc <ename>
    80204f4c:	892a                	mv	s2,a0
    80204f4e:	c131                	beqz	a0,80204f92 <sys_open+0x120>
    elock(ep);
    80204f50:	00002097          	auipc	ra,0x2
    80204f54:	6e2080e7          	jalr	1762(ra) # 80207632 <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    80204f58:	10094783          	lbu	a5,256(s2)
    80204f5c:	8bc1                	andi	a5,a5,16
    80204f5e:	d7ad                	beqz	a5,80204ec8 <sys_open+0x56>
    80204f60:	ec442783          	lw	a5,-316(s0)
    80204f64:	d3b5                	beqz	a5,80204ec8 <sys_open+0x56>
      eunlock(ep);
    80204f66:	854a                	mv	a0,s2
    80204f68:	00002097          	auipc	ra,0x2
    80204f6c:	700080e7          	jalr	1792(ra) # 80207668 <eunlock>
      eput(ep);
    80204f70:	854a                	mv	a0,s2
    80204f72:	00002097          	auipc	ra,0x2
    80204f76:	744080e7          	jalr	1860(ra) # 802076b6 <eput>
      return -1;
    80204f7a:	557d                	li	a0,-1
    80204f7c:	bf5d                	j	80204f32 <sys_open+0xc0>
    etrunc(ep);
    80204f7e:	854a                	mv	a0,s2
    80204f80:	00002097          	auipc	ra,0x2
    80204f84:	648080e7          	jalr	1608(ra) # 802075c8 <etrunc>
    80204f88:	b7b5                	j	80204ef4 <sys_open+0x82>
    return -1;
    80204f8a:	557d                	li	a0,-1
    80204f8c:	b75d                	j	80204f32 <sys_open+0xc0>
      return -1;
    80204f8e:	557d                	li	a0,-1
    80204f90:	b74d                	j	80204f32 <sys_open+0xc0>
      return -1;
    80204f92:	557d                	li	a0,-1
    80204f94:	bf79                	j	80204f32 <sys_open+0xc0>
      fileclose(f);
    80204f96:	854e                	mv	a0,s3
    80204f98:	fffff097          	auipc	ra,0xfffff
    80204f9c:	088080e7          	jalr	136(ra) # 80204020 <fileclose>
    eunlock(ep);
    80204fa0:	854a                	mv	a0,s2
    80204fa2:	00002097          	auipc	ra,0x2
    80204fa6:	6c6080e7          	jalr	1734(ra) # 80207668 <eunlock>
    eput(ep);
    80204faa:	854a                	mv	a0,s2
    80204fac:	00002097          	auipc	ra,0x2
    80204fb0:	70a080e7          	jalr	1802(ra) # 802076b6 <eput>
    return -1;
    80204fb4:	557d                	li	a0,-1
    80204fb6:	bfb5                	j	80204f32 <sys_open+0xc0>

0000000080204fb8 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80204fb8:	7169                	addi	sp,sp,-304
    80204fba:	f606                	sd	ra,296(sp)
    80204fbc:	f222                	sd	s0,288(sp)
    80204fbe:	ee26                	sd	s1,280(sp)
    80204fc0:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;

  if(argstr(1, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204fc2:	10400613          	li	a2,260
    80204fc6:	ed840593          	addi	a1,s0,-296
    80204fca:	4505                	li	a0,1
    80204fcc:	ffffe097          	auipc	ra,0xffffe
    80204fd0:	220080e7          	jalr	544(ra) # 802031ec <argstr>
    return -1;
    80204fd4:	57fd                	li	a5,-1
  if(argstr(1, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204fd6:	02054663          	bltz	a0,80205002 <sys_mkdir+0x4a>
    80204fda:	4601                	li	a2,0
    80204fdc:	4585                	li	a1,1
    80204fde:	ed840513          	addi	a0,s0,-296
    80204fe2:	00000097          	auipc	ra,0x0
    80204fe6:	bf4080e7          	jalr	-1036(ra) # 80204bd6 <create>
    80204fea:	84aa                	mv	s1,a0
    80204fec:	c10d                	beqz	a0,8020500e <sys_mkdir+0x56>
  }
  eunlock(ep);
    80204fee:	00002097          	auipc	ra,0x2
    80204ff2:	67a080e7          	jalr	1658(ra) # 80207668 <eunlock>
  eput(ep);
    80204ff6:	8526                	mv	a0,s1
    80204ff8:	00002097          	auipc	ra,0x2
    80204ffc:	6be080e7          	jalr	1726(ra) # 802076b6 <eput>
  return 0;
    80205000:	4781                	li	a5,0
}
    80205002:	853e                	mv	a0,a5
    80205004:	70b2                	ld	ra,296(sp)
    80205006:	7412                	ld	s0,288(sp)
    80205008:	64f2                	ld	s1,280(sp)
    8020500a:	6155                	addi	sp,sp,304
    8020500c:	8082                	ret
    return -1;
    8020500e:	57fd                	li	a5,-1
    80205010:	bfcd                	j	80205002 <sys_mkdir+0x4a>

0000000080205012 <sys_chdir>:

uint64
sys_chdir(void)
{
    80205012:	7169                	addi	sp,sp,-304
    80205014:	f606                	sd	ra,296(sp)
    80205016:	f222                	sd	s0,288(sp)
    80205018:	ee26                	sd	s1,280(sp)
    8020501a:	ea4a                	sd	s2,272(sp)
    8020501c:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  struct proc *p = myproc();
    8020501e:	ffffd097          	auipc	ra,0xffffd
    80205022:	a42080e7          	jalr	-1470(ra) # 80201a60 <myproc>
    80205026:	892a                	mv	s2,a0
  
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80205028:	10400613          	li	a2,260
    8020502c:	ed840593          	addi	a1,s0,-296
    80205030:	4501                	li	a0,0
    80205032:	ffffe097          	auipc	ra,0xffffe
    80205036:	1ba080e7          	jalr	442(ra) # 802031ec <argstr>
    return -1;
    8020503a:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    8020503c:	04054063          	bltz	a0,8020507c <sys_chdir+0x6a>
    80205040:	ed840513          	addi	a0,s0,-296
    80205044:	00003097          	auipc	ra,0x3
    80205048:	d98080e7          	jalr	-616(ra) # 80207ddc <ename>
    8020504c:	84aa                	mv	s1,a0
    8020504e:	c931                	beqz	a0,802050a2 <sys_chdir+0x90>
  }
  elock(ep);
    80205050:	00002097          	auipc	ra,0x2
    80205054:	5e2080e7          	jalr	1506(ra) # 80207632 <elock>
  if(!(ep->attribute & ATTR_DIRECTORY)){
    80205058:	1004c783          	lbu	a5,256(s1)
    8020505c:	8bc1                	andi	a5,a5,16
    8020505e:	c795                	beqz	a5,8020508a <sys_chdir+0x78>
    eunlock(ep);
    eput(ep);
    return -1;
  }
  eunlock(ep);
    80205060:	8526                	mv	a0,s1
    80205062:	00002097          	auipc	ra,0x2
    80205066:	606080e7          	jalr	1542(ra) # 80207668 <eunlock>
  eput(p->cwd);
    8020506a:	4d893503          	ld	a0,1240(s2)
    8020506e:	00002097          	auipc	ra,0x2
    80205072:	648080e7          	jalr	1608(ra) # 802076b6 <eput>
  p->cwd = ep;
    80205076:	4c993c23          	sd	s1,1240(s2)
  return 0;
    8020507a:	4781                	li	a5,0
}
    8020507c:	853e                	mv	a0,a5
    8020507e:	70b2                	ld	ra,296(sp)
    80205080:	7412                	ld	s0,288(sp)
    80205082:	64f2                	ld	s1,280(sp)
    80205084:	6952                	ld	s2,272(sp)
    80205086:	6155                	addi	sp,sp,304
    80205088:	8082                	ret
    eunlock(ep);
    8020508a:	8526                	mv	a0,s1
    8020508c:	00002097          	auipc	ra,0x2
    80205090:	5dc080e7          	jalr	1500(ra) # 80207668 <eunlock>
    eput(ep);
    80205094:	8526                	mv	a0,s1
    80205096:	00002097          	auipc	ra,0x2
    8020509a:	620080e7          	jalr	1568(ra) # 802076b6 <eput>
    return -1;
    8020509e:	57fd                	li	a5,-1
    802050a0:	bff1                	j	8020507c <sys_chdir+0x6a>
    return -1;
    802050a2:	57fd                	li	a5,-1
    802050a4:	bfe1                	j	8020507c <sys_chdir+0x6a>

00000000802050a6 <sys_pipe>:

uint64
sys_pipe(void)
{
    802050a6:	7139                	addi	sp,sp,-64
    802050a8:	fc06                	sd	ra,56(sp)
    802050aa:	f822                	sd	s0,48(sp)
    802050ac:	f426                	sd	s1,40(sp)
    802050ae:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    802050b0:	ffffd097          	auipc	ra,0xffffd
    802050b4:	9b0080e7          	jalr	-1616(ra) # 80201a60 <myproc>
    802050b8:	84aa                	mv	s1,a0

  if(argaddr(0, &fdarray) < 0)
    802050ba:	fd840593          	addi	a1,s0,-40
    802050be:	4501                	li	a0,0
    802050c0:	ffffe097          	auipc	ra,0xffffe
    802050c4:	10a080e7          	jalr	266(ra) # 802031ca <argaddr>
    return -1;
    802050c8:	57fd                	li	a5,-1
  if(argaddr(0, &fdarray) < 0)
    802050ca:	0c054e63          	bltz	a0,802051a6 <sys_pipe+0x100>
  if(pipealloc(&rf, &wf) < 0)
    802050ce:	fc840593          	addi	a1,s0,-56
    802050d2:	fd040513          	addi	a0,s0,-48
    802050d6:	fffff097          	auipc	ra,0xfffff
    802050da:	2be080e7          	jalr	702(ra) # 80204394 <pipealloc>
    return -1;
    802050de:	57fd                	li	a5,-1
  if(pipealloc(&rf, &wf) < 0)
    802050e0:	0c054363          	bltz	a0,802051a6 <sys_pipe+0x100>
  fd0 = -1;
    802050e4:	fcf42223          	sw	a5,-60(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    802050e8:	fd043503          	ld	a0,-48(s0)
    802050ec:	00000097          	auipc	ra,0x0
    802050f0:	aa6080e7          	jalr	-1370(ra) # 80204b92 <fdalloc>
    802050f4:	fca42223          	sw	a0,-60(s0)
    802050f8:	08054a63          	bltz	a0,8020518c <sys_pipe+0xe6>
    802050fc:	fc843503          	ld	a0,-56(s0)
    80205100:	00000097          	auipc	ra,0x0
    80205104:	a92080e7          	jalr	-1390(ra) # 80204b92 <fdalloc>
    80205108:	fca42023          	sw	a0,-64(s0)
    8020510c:	06054663          	bltz	a0,80205178 <sys_pipe+0xd2>
    fileclose(wf);
    return -1;
  }
  // if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
  //    copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80205110:	4611                	li	a2,4
    80205112:	fc440593          	addi	a1,s0,-60
    80205116:	fd843503          	ld	a0,-40(s0)
    8020511a:	ffffc097          	auipc	ra,0xffffc
    8020511e:	262080e7          	jalr	610(ra) # 8020137c <copyout2>
    80205122:	00054f63          	bltz	a0,80205140 <sys_pipe+0x9a>
     copyout2(fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80205126:	4611                	li	a2,4
    80205128:	fc040593          	addi	a1,s0,-64
    8020512c:	fd843503          	ld	a0,-40(s0)
    80205130:	0511                	addi	a0,a0,4
    80205132:	ffffc097          	auipc	ra,0xffffc
    80205136:	24a080e7          	jalr	586(ra) # 8020137c <copyout2>
    p->ofile[fd1] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  return 0;
    8020513a:	4781                	li	a5,0
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    8020513c:	06055563          	bgez	a0,802051a6 <sys_pipe+0x100>
    p->ofile[fd0] = 0;
    80205140:	fc442783          	lw	a5,-60(s0)
    80205144:	07e9                	addi	a5,a5,26
    80205146:	078e                	slli	a5,a5,0x3
    80205148:	97a6                	add	a5,a5,s1
    8020514a:	0007b423          	sd	zero,8(a5)
    p->ofile[fd1] = 0;
    8020514e:	fc042503          	lw	a0,-64(s0)
    80205152:	0569                	addi	a0,a0,26
    80205154:	050e                	slli	a0,a0,0x3
    80205156:	9526                	add	a0,a0,s1
    80205158:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    8020515c:	fd043503          	ld	a0,-48(s0)
    80205160:	fffff097          	auipc	ra,0xfffff
    80205164:	ec0080e7          	jalr	-320(ra) # 80204020 <fileclose>
    fileclose(wf);
    80205168:	fc843503          	ld	a0,-56(s0)
    8020516c:	fffff097          	auipc	ra,0xfffff
    80205170:	eb4080e7          	jalr	-332(ra) # 80204020 <fileclose>
    return -1;
    80205174:	57fd                	li	a5,-1
    80205176:	a805                	j	802051a6 <sys_pipe+0x100>
    if(fd0 >= 0)
    80205178:	fc442783          	lw	a5,-60(s0)
    8020517c:	0007c863          	bltz	a5,8020518c <sys_pipe+0xe6>
      p->ofile[fd0] = 0;
    80205180:	01a78513          	addi	a0,a5,26
    80205184:	050e                	slli	a0,a0,0x3
    80205186:	9526                	add	a0,a0,s1
    80205188:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    8020518c:	fd043503          	ld	a0,-48(s0)
    80205190:	fffff097          	auipc	ra,0xfffff
    80205194:	e90080e7          	jalr	-368(ra) # 80204020 <fileclose>
    fileclose(wf);
    80205198:	fc843503          	ld	a0,-56(s0)
    8020519c:	fffff097          	auipc	ra,0xfffff
    802051a0:	e84080e7          	jalr	-380(ra) # 80204020 <fileclose>
    return -1;
    802051a4:	57fd                	li	a5,-1
}
    802051a6:	853e                	mv	a0,a5
    802051a8:	70e2                	ld	ra,56(sp)
    802051aa:	7442                	ld	s0,48(sp)
    802051ac:	74a2                	ld	s1,40(sp)
    802051ae:	6121                	addi	sp,sp,64
    802051b0:	8082                	ret

00000000802051b2 <sys_dev>:

// To open console device.
uint64
sys_dev(void)
{
    802051b2:	7179                	addi	sp,sp,-48
    802051b4:	f406                	sd	ra,40(sp)
    802051b6:	f022                	sd	s0,32(sp)
    802051b8:	ec26                	sd	s1,24(sp)
    802051ba:	1800                	addi	s0,sp,48
  int fd, omode;
  int major, minor;
  struct file *f;

  if(argint(0, &omode) < 0 || argint(1, &major) < 0 || argint(2, &minor) < 0){
    802051bc:	fdc40593          	addi	a1,s0,-36
    802051c0:	4501                	li	a0,0
    802051c2:	ffffe097          	auipc	ra,0xffffe
    802051c6:	fa6080e7          	jalr	-90(ra) # 80203168 <argint>
    802051ca:	08054a63          	bltz	a0,8020525e <sys_dev+0xac>
    802051ce:	fd840593          	addi	a1,s0,-40
    802051d2:	4505                	li	a0,1
    802051d4:	ffffe097          	auipc	ra,0xffffe
    802051d8:	f94080e7          	jalr	-108(ra) # 80203168 <argint>
    802051dc:	08054763          	bltz	a0,8020526a <sys_dev+0xb8>
    802051e0:	fd440593          	addi	a1,s0,-44
    802051e4:	4509                	li	a0,2
    802051e6:	ffffe097          	auipc	ra,0xffffe
    802051ea:	f82080e7          	jalr	-126(ra) # 80203168 <argint>
    802051ee:	08054063          	bltz	a0,8020526e <sys_dev+0xbc>
    return -1;
  }

  if(omode & O_CREATE){
    802051f2:	fdc42783          	lw	a5,-36(s0)
    802051f6:	2407f793          	andi	a5,a5,576
    802051fa:	ebb1                	bnez	a5,8020524e <sys_dev+0x9c>
    panic("dev file on FAT");
  }

  if(major < 0 || major >= NDEV)
    802051fc:	fd842703          	lw	a4,-40(s0)
    80205200:	47a5                	li	a5,9
    return -1;
    80205202:	557d                	li	a0,-1
  if(major < 0 || major >= NDEV)
    80205204:	04e7ee63          	bltu	a5,a4,80205260 <sys_dev+0xae>

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80205208:	fffff097          	auipc	ra,0xfffff
    8020520c:	d5c080e7          	jalr	-676(ra) # 80203f64 <filealloc>
    80205210:	84aa                	mv	s1,a0
    80205212:	c125                	beqz	a0,80205272 <sys_dev+0xc0>
    80205214:	00000097          	auipc	ra,0x0
    80205218:	97e080e7          	jalr	-1666(ra) # 80204b92 <fdalloc>
    8020521c:	04054d63          	bltz	a0,80205276 <sys_dev+0xc4>
    if(f)
      fileclose(f);
    return -1;
  }

  f->type = FD_DEVICE;
    80205220:	478d                	li	a5,3
    80205222:	c09c                	sw	a5,0(s1)
  f->off = 0;
    80205224:	0204a023          	sw	zero,32(s1)
  f->ep = 0;
    80205228:	0004bc23          	sd	zero,24(s1)
  f->major = major;
    8020522c:	fd842783          	lw	a5,-40(s0)
    80205230:	02f49223          	sh	a5,36(s1)
  f->readable = !(omode & O_WRONLY);
    80205234:	fdc42783          	lw	a5,-36(s0)
    80205238:	0017c713          	xori	a4,a5,1
    8020523c:	8b05                	andi	a4,a4,1
    8020523e:	00e48423          	sb	a4,8(s1)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80205242:	8b8d                	andi	a5,a5,3
    80205244:	00f037b3          	snez	a5,a5
    80205248:	00f484a3          	sb	a5,9(s1)

  return fd;
    8020524c:	a811                	j	80205260 <sys_dev+0xae>
    panic("dev file on FAT");
    8020524e:	00006517          	auipc	a0,0x6
    80205252:	aaa50513          	addi	a0,a0,-1366 # 8020acf8 <digits+0x978>
    80205256:	ffffb097          	auipc	ra,0xffffb
    8020525a:	eec080e7          	jalr	-276(ra) # 80200142 <panic>
    return -1;
    8020525e:	557d                	li	a0,-1
}
    80205260:	70a2                	ld	ra,40(sp)
    80205262:	7402                	ld	s0,32(sp)
    80205264:	64e2                	ld	s1,24(sp)
    80205266:	6145                	addi	sp,sp,48
    80205268:	8082                	ret
    return -1;
    8020526a:	557d                	li	a0,-1
    8020526c:	bfd5                	j	80205260 <sys_dev+0xae>
    8020526e:	557d                	li	a0,-1
    80205270:	bfc5                	j	80205260 <sys_dev+0xae>
    return -1;
    80205272:	557d                	li	a0,-1
    80205274:	b7f5                	j	80205260 <sys_dev+0xae>
      fileclose(f);
    80205276:	8526                	mv	a0,s1
    80205278:	fffff097          	auipc	ra,0xfffff
    8020527c:	da8080e7          	jalr	-600(ra) # 80204020 <fileclose>
    return -1;
    80205280:	557d                	li	a0,-1
    80205282:	bff9                	j	80205260 <sys_dev+0xae>

0000000080205284 <sys_readdir>:

// To support ls command
uint64
sys_readdir(void)
{
    80205284:	1101                	addi	sp,sp,-32
    80205286:	ec06                	sd	ra,24(sp)
    80205288:	e822                	sd	s0,16(sp)
    8020528a:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    8020528c:	fe840613          	addi	a2,s0,-24
    80205290:	4581                	li	a1,0
    80205292:	4501                	li	a0,0
    80205294:	00000097          	auipc	ra,0x0
    80205298:	894080e7          	jalr	-1900(ra) # 80204b28 <argfd>
    return -1;
    8020529c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    8020529e:	02054563          	bltz	a0,802052c8 <sys_readdir+0x44>
    802052a2:	fe040593          	addi	a1,s0,-32
    802052a6:	4505                	li	a0,1
    802052a8:	ffffe097          	auipc	ra,0xffffe
    802052ac:	f22080e7          	jalr	-222(ra) # 802031ca <argaddr>
    return -1;
    802052b0:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    802052b2:	00054b63          	bltz	a0,802052c8 <sys_readdir+0x44>
  return dirnext(f, p);
    802052b6:	fe043583          	ld	a1,-32(s0)
    802052ba:	fe843503          	ld	a0,-24(s0)
    802052be:	fffff097          	auipc	ra,0xfffff
    802052c2:	010080e7          	jalr	16(ra) # 802042ce <dirnext>
    802052c6:	87aa                	mv	a5,a0
}
    802052c8:	853e                	mv	a0,a5
    802052ca:	60e2                	ld	ra,24(sp)
    802052cc:	6442                	ld	s0,16(sp)
    802052ce:	6105                	addi	sp,sp,32
    802052d0:	8082                	ret

00000000802052d2 <sys_getcwd>:

// get absolute cwd string
uint64
sys_getcwd(void)
{
    802052d2:	714d                	addi	sp,sp,-336
    802052d4:	e686                	sd	ra,328(sp)
    802052d6:	e2a2                	sd	s0,320(sp)
    802052d8:	fe26                	sd	s1,312(sp)
    802052da:	fa4a                	sd	s2,304(sp)
    802052dc:	f64e                	sd	s3,296(sp)
    802052de:	f252                	sd	s4,288(sp)
    802052e0:	ee56                	sd	s5,280(sp)
    802052e2:	0a80                	addi	s0,sp,336
  uint64 addr;
  if (argaddr(0, &addr) < 0)
    802052e4:	fb840593          	addi	a1,s0,-72
    802052e8:	4501                	li	a0,0
    802052ea:	ffffe097          	auipc	ra,0xffffe
    802052ee:	ee0080e7          	jalr	-288(ra) # 802031ca <argaddr>
    return -1;
    802052f2:	57fd                	li	a5,-1
  if (argaddr(0, &addr) < 0)
    802052f4:	06054f63          	bltz	a0,80205372 <sys_getcwd+0xa0>

  struct dirent *de = myproc()->cwd;
    802052f8:	ffffc097          	auipc	ra,0xffffc
    802052fc:	768080e7          	jalr	1896(ra) # 80201a60 <myproc>
    80205300:	4d853483          	ld	s1,1240(a0)
  char path[FAT32_MAX_PATH];
  char *s;
  int len;

  if (de->parent == NULL) {
    80205304:	1204b783          	ld	a5,288(s1)
    80205308:	cfbd                	beqz	a5,80205386 <sys_getcwd+0xb4>
    s = "/";
  } else {
    s = path + FAT32_MAX_PATH - 1;
    *s = '\0';
    8020530a:	fa0409a3          	sb	zero,-77(s0)
    s = path + FAT32_MAX_PATH - 1;
    8020530e:	fb340993          	addi	s3,s0,-77
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= path)          // can't reach root "/"
    80205312:	eb040a13          	addi	s4,s0,-336
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    80205316:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    8020531a:	8526                	mv	a0,s1
    8020531c:	ffffb097          	auipc	ra,0xffffb
    80205320:	5d0080e7          	jalr	1488(ra) # 802008ec <strlen>
    80205324:	862a                	mv	a2,a0
      s -= len;
    80205326:	40a98933          	sub	s2,s3,a0
      if (s <= path)          // can't reach root "/"
    8020532a:	072a7363          	bgeu	s4,s2,80205390 <sys_getcwd+0xbe>
      strncpy(s, de->filename, len);
    8020532e:	85a6                	mv	a1,s1
    80205330:	854a                	mv	a0,s2
    80205332:	ffffb097          	auipc	ra,0xffffb
    80205336:	54a080e7          	jalr	1354(ra) # 8020087c <strncpy>
      *--s = '/';
    8020533a:	fff90993          	addi	s3,s2,-1
    8020533e:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    80205342:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    80205346:	1204b783          	ld	a5,288(s1)
    8020534a:	fbe1                	bnez	a5,8020531a <sys_getcwd+0x48>
    }
  }

  // if (copyout(myproc()->pagetable, addr, s, strlen(s) + 1) < 0)
  if (copyout2(addr, s, strlen(s) + 1) < 0)
    8020534c:	fb843483          	ld	s1,-72(s0)
    80205350:	854e                	mv	a0,s3
    80205352:	ffffb097          	auipc	ra,0xffffb
    80205356:	59a080e7          	jalr	1434(ra) # 802008ec <strlen>
    8020535a:	0015061b          	addiw	a2,a0,1
    8020535e:	85ce                	mv	a1,s3
    80205360:	8526                	mv	a0,s1
    80205362:	ffffc097          	auipc	ra,0xffffc
    80205366:	01a080e7          	jalr	26(ra) # 8020137c <copyout2>
    8020536a:	02054563          	bltz	a0,80205394 <sys_getcwd+0xc2>
    return -1;
  
  return addr;
    8020536e:	fb843783          	ld	a5,-72(s0)

}
    80205372:	853e                	mv	a0,a5
    80205374:	60b6                	ld	ra,328(sp)
    80205376:	6416                	ld	s0,320(sp)
    80205378:	74f2                	ld	s1,312(sp)
    8020537a:	7952                	ld	s2,304(sp)
    8020537c:	79b2                	ld	s3,296(sp)
    8020537e:	7a12                	ld	s4,288(sp)
    80205380:	6af2                	ld	s5,280(sp)
    80205382:	6171                	addi	sp,sp,336
    80205384:	8082                	ret
    s = "/";
    80205386:	00005997          	auipc	s3,0x5
    8020538a:	2aa98993          	addi	s3,s3,682 # 8020a630 <digits+0x2b0>
    8020538e:	bf7d                	j	8020534c <sys_getcwd+0x7a>
        return -1;
    80205390:	57fd                	li	a5,-1
    80205392:	b7c5                	j	80205372 <sys_getcwd+0xa0>
    return -1;
    80205394:	57fd                	li	a5,-1
    80205396:	bff1                	j	80205372 <sys_getcwd+0xa0>

0000000080205398 <sys_remove>:
  return ret == -1;
}

uint64
sys_remove(void)
{
    80205398:	d6010113          	addi	sp,sp,-672
    8020539c:	28113c23          	sd	ra,664(sp)
    802053a0:	28813823          	sd	s0,656(sp)
    802053a4:	28913423          	sd	s1,648(sp)
    802053a8:	1500                	addi	s0,sp,672
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  int len;
  if((len = argstr(0, path, FAT32_MAX_PATH)) <= 0)
    802053aa:	10400613          	li	a2,260
    802053ae:	ed840593          	addi	a1,s0,-296
    802053b2:	4501                	li	a0,0
    802053b4:	ffffe097          	auipc	ra,0xffffe
    802053b8:	e38080e7          	jalr	-456(ra) # 802031ec <argstr>
    802053bc:	0ea05a63          	blez	a0,802054b0 <sys_remove+0x118>
    return -1;

  char *s = path + len - 1;
    802053c0:	157d                	addi	a0,a0,-1
    802053c2:	ed840713          	addi	a4,s0,-296
    802053c6:	00a707b3          	add	a5,a4,a0
  while (s >= path && *s == '/') {
    802053ca:	02f00693          	li	a3,47
    802053ce:	863a                	mv	a2,a4
    802053d0:	00e7e963          	bltu	a5,a4,802053e2 <sys_remove+0x4a>
    802053d4:	0007c703          	lbu	a4,0(a5)
    802053d8:	08d71a63          	bne	a4,a3,8020546c <sys_remove+0xd4>
    s--;
    802053dc:	17fd                	addi	a5,a5,-1
  while (s >= path && *s == '/') {
    802053de:	fec7fbe3          	bgeu	a5,a2,802053d4 <sys_remove+0x3c>
  }
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    return -1;
  }
  
  if((ep = ename(path)) == NULL){
    802053e2:	ed840513          	addi	a0,s0,-296
    802053e6:	00003097          	auipc	ra,0x3
    802053ea:	9f6080e7          	jalr	-1546(ra) # 80207ddc <ename>
    802053ee:	84aa                	mv	s1,a0
    802053f0:	c561                	beqz	a0,802054b8 <sys_remove+0x120>
    return -1;
  }
  elock(ep);
    802053f2:	00002097          	auipc	ra,0x2
    802053f6:	240080e7          	jalr	576(ra) # 80207632 <elock>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    802053fa:	1004c783          	lbu	a5,256(s1)
    802053fe:	8bc1                	andi	a5,a5,16
    80205400:	c38d                	beqz	a5,80205422 <sys_remove+0x8a>
  ep.valid = 0;
    80205402:	e8041323          	sh	zero,-378(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80205406:	d6c40693          	addi	a3,s0,-660
    8020540a:	04000613          	li	a2,64
    8020540e:	d7040593          	addi	a1,s0,-656
    80205412:	8526                	mv	a0,s1
    80205414:	00002097          	auipc	ra,0x2
    80205418:	422080e7          	jalr	1058(ra) # 80207836 <enext>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    8020541c:	57fd                	li	a5,-1
    8020541e:	06f51d63          	bne	a0,a5,80205498 <sys_remove+0x100>
      eunlock(ep);
      eput(ep);
      return -1;
  }
  elock(ep->parent);      // Will this lead to deadlock?
    80205422:	1204b503          	ld	a0,288(s1)
    80205426:	00002097          	auipc	ra,0x2
    8020542a:	20c080e7          	jalr	524(ra) # 80207632 <elock>
  eremove(ep);
    8020542e:	8526                	mv	a0,s1
    80205430:	00002097          	auipc	ra,0x2
    80205434:	0ce080e7          	jalr	206(ra) # 802074fe <eremove>
  eunlock(ep->parent);
    80205438:	1204b503          	ld	a0,288(s1)
    8020543c:	00002097          	auipc	ra,0x2
    80205440:	22c080e7          	jalr	556(ra) # 80207668 <eunlock>
  eunlock(ep);
    80205444:	8526                	mv	a0,s1
    80205446:	00002097          	auipc	ra,0x2
    8020544a:	222080e7          	jalr	546(ra) # 80207668 <eunlock>
  eput(ep);
    8020544e:	8526                	mv	a0,s1
    80205450:	00002097          	auipc	ra,0x2
    80205454:	266080e7          	jalr	614(ra) # 802076b6 <eput>

  return 0;
    80205458:	4501                	li	a0,0
}
    8020545a:	29813083          	ld	ra,664(sp)
    8020545e:	29013403          	ld	s0,656(sp)
    80205462:	28813483          	ld	s1,648(sp)
    80205466:	2a010113          	addi	sp,sp,672
    8020546a:	8082                	ret
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    8020546c:	ed840713          	addi	a4,s0,-296
    80205470:	f6e7e9e3          	bltu	a5,a4,802053e2 <sys_remove+0x4a>
    80205474:	0007c683          	lbu	a3,0(a5)
    80205478:	02e00713          	li	a4,46
    8020547c:	f6e693e3          	bne	a3,a4,802053e2 <sys_remove+0x4a>
    80205480:	ed840713          	addi	a4,s0,-296
    80205484:	02e78863          	beq	a5,a4,802054b4 <sys_remove+0x11c>
    80205488:	fff7c703          	lbu	a4,-1(a5)
    8020548c:	02f00793          	li	a5,47
    80205490:	f4f719e3          	bne	a4,a5,802053e2 <sys_remove+0x4a>
    return -1;
    80205494:	557d                	li	a0,-1
    80205496:	b7d1                	j	8020545a <sys_remove+0xc2>
      eunlock(ep);
    80205498:	8526                	mv	a0,s1
    8020549a:	00002097          	auipc	ra,0x2
    8020549e:	1ce080e7          	jalr	462(ra) # 80207668 <eunlock>
      eput(ep);
    802054a2:	8526                	mv	a0,s1
    802054a4:	00002097          	auipc	ra,0x2
    802054a8:	212080e7          	jalr	530(ra) # 802076b6 <eput>
      return -1;
    802054ac:	557d                	li	a0,-1
    802054ae:	b775                	j	8020545a <sys_remove+0xc2>
    return -1;
    802054b0:	557d                	li	a0,-1
    802054b2:	b765                	j	8020545a <sys_remove+0xc2>
    return -1;
    802054b4:	557d                	li	a0,-1
    802054b6:	b755                	j	8020545a <sys_remove+0xc2>
    return -1;
    802054b8:	557d                	li	a0,-1
    802054ba:	b745                	j	8020545a <sys_remove+0xc2>

00000000802054bc <sys_rename>:

// Must hold too many locks at a time! It's possible to raise a deadlock.
// Because this op takes some steps, we can't promise
uint64
sys_rename(void)
{
    802054bc:	c4010113          	addi	sp,sp,-960
    802054c0:	3a113c23          	sd	ra,952(sp)
    802054c4:	3a813823          	sd	s0,944(sp)
    802054c8:	3a913423          	sd	s1,936(sp)
    802054cc:	3b213023          	sd	s2,928(sp)
    802054d0:	39313c23          	sd	s3,920(sp)
    802054d4:	39413823          	sd	s4,912(sp)
    802054d8:	0780                	addi	s0,sp,960
  char old[FAT32_MAX_PATH], new[FAT32_MAX_PATH];
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    802054da:	10400613          	li	a2,260
    802054de:	ec840593          	addi	a1,s0,-312
    802054e2:	4501                	li	a0,0
    802054e4:	ffffe097          	auipc	ra,0xffffe
    802054e8:	d08080e7          	jalr	-760(ra) # 802031ec <argstr>
      return -1;
    802054ec:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    802054ee:	0c054d63          	bltz	a0,802055c8 <sys_rename+0x10c>
    802054f2:	10400613          	li	a2,260
    802054f6:	dc040593          	addi	a1,s0,-576
    802054fa:	4505                	li	a0,1
    802054fc:	ffffe097          	auipc	ra,0xffffe
    80205500:	cf0080e7          	jalr	-784(ra) # 802031ec <argstr>
      return -1;
    80205504:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80205506:	0c054163          	bltz	a0,802055c8 <sys_rename+0x10c>
  }

  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
  int srclock = 0;
  char *name;
  if ((src = ename(old)) == NULL || (pdst = enameparent(new, old)) == NULL
    8020550a:	ec840513          	addi	a0,s0,-312
    8020550e:	00003097          	auipc	ra,0x3
    80205512:	8ce080e7          	jalr	-1842(ra) # 80207ddc <ename>
    80205516:	84aa                	mv	s1,a0
    80205518:	1c050963          	beqz	a0,802056ea <sys_rename+0x22e>
    8020551c:	ec840593          	addi	a1,s0,-312
    80205520:	dc040513          	addi	a0,s0,-576
    80205524:	00003097          	auipc	ra,0x3
    80205528:	8d6080e7          	jalr	-1834(ra) # 80207dfa <enameparent>
    8020552c:	892a                	mv	s2,a0
    8020552e:	cd35                	beqz	a0,802055aa <sys_rename+0xee>
      || (name = formatname(old)) == NULL) {
    80205530:	ec840513          	addi	a0,s0,-312
    80205534:	00002097          	auipc	ra,0x2
    80205538:	a38080e7          	jalr	-1480(ra) # 80206f6c <formatname>
    8020553c:	89aa                	mv	s3,a0
    8020553e:	c535                	beqz	a0,802055aa <sys_rename+0xee>
    goto fail;          // src doesn't exist || dst parent doesn't exist || illegal new name
  }
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    if (ep == src) {    // In what universe can we move a directory into its child?
    80205540:	07248563          	beq	s1,s2,802055aa <sys_rename+0xee>
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    80205544:	87ca                	mv	a5,s2
    80205546:	1207b783          	ld	a5,288(a5)
    8020554a:	c781                	beqz	a5,80205552 <sys_rename+0x96>
    if (ep == src) {    // In what universe can we move a directory into its child?
    8020554c:	fef49de3          	bne	s1,a5,80205546 <sys_rename+0x8a>
    80205550:	a8a9                	j	802055aa <sys_rename+0xee>
      goto fail;
    }
  }

  uint off;
  elock(src);     // must hold child's lock before acquiring parent's, because we do so in other similar cases
    80205552:	8526                	mv	a0,s1
    80205554:	00002097          	auipc	ra,0x2
    80205558:	0de080e7          	jalr	222(ra) # 80207632 <elock>
  srclock = 1;
  elock(pdst);
    8020555c:	854a                	mv	a0,s2
    8020555e:	00002097          	auipc	ra,0x2
    80205562:	0d4080e7          	jalr	212(ra) # 80207632 <elock>
  dst = dirlookup(pdst, name, &off);
    80205566:	dbc40613          	addi	a2,s0,-580
    8020556a:	85ce                	mv	a1,s3
    8020556c:	854a                	mv	a0,s2
    8020556e:	00002097          	auipc	ra,0x2
    80205572:	458080e7          	jalr	1112(ra) # 802079c6 <dirlookup>
    80205576:	8a2a                	mv	s4,a0
  if (dst != NULL) {
    80205578:	cd45                	beqz	a0,80205630 <sys_rename+0x174>
    eunlock(pdst);
    8020557a:	854a                	mv	a0,s2
    8020557c:	00002097          	auipc	ra,0x2
    80205580:	0ec080e7          	jalr	236(ra) # 80207668 <eunlock>
    if (src == dst) {
    80205584:	01448963          	beq	s1,s4,80205596 <sys_rename+0xda>
      goto fail;
    } else if (src->attribute & dst->attribute & ATTR_DIRECTORY) {
    80205588:	1004c783          	lbu	a5,256(s1)
    8020558c:	100a4703          	lbu	a4,256(s4)
    80205590:	8ff9                	and	a5,a5,a4
    80205592:	8bc1                	andi	a5,a5,16
    80205594:	ebb1                	bnez	a5,802055e8 <sys_rename+0x12c>

  return 0;

fail:
  if (srclock)
    eunlock(src);
    80205596:	8526                	mv	a0,s1
    80205598:	00002097          	auipc	ra,0x2
    8020559c:	0d0080e7          	jalr	208(ra) # 80207668 <eunlock>
  if (dst)
    eput(dst);
    802055a0:	8552                	mv	a0,s4
    802055a2:	00002097          	auipc	ra,0x2
    802055a6:	114080e7          	jalr	276(ra) # 802076b6 <eput>
  if (pdst)
    802055aa:	00090763          	beqz	s2,802055b8 <sys_rename+0xfc>
    eput(pdst);
    802055ae:	854a                	mv	a0,s2
    802055b0:	00002097          	auipc	ra,0x2
    802055b4:	106080e7          	jalr	262(ra) # 802076b6 <eput>
  if (src)
    eput(src);
  return -1;
    802055b8:	57fd                	li	a5,-1
  if (src)
    802055ba:	c499                	beqz	s1,802055c8 <sys_rename+0x10c>
    eput(src);
    802055bc:	8526                	mv	a0,s1
    802055be:	00002097          	auipc	ra,0x2
    802055c2:	0f8080e7          	jalr	248(ra) # 802076b6 <eput>
  return -1;
    802055c6:	57fd                	li	a5,-1
}
    802055c8:	853e                	mv	a0,a5
    802055ca:	3b813083          	ld	ra,952(sp)
    802055ce:	3b013403          	ld	s0,944(sp)
    802055d2:	3a813483          	ld	s1,936(sp)
    802055d6:	3a013903          	ld	s2,928(sp)
    802055da:	39813983          	ld	s3,920(sp)
    802055de:	39013a03          	ld	s4,912(sp)
    802055e2:	3c010113          	addi	sp,sp,960
    802055e6:	8082                	ret
      elock(dst);
    802055e8:	8552                	mv	a0,s4
    802055ea:	00002097          	auipc	ra,0x2
    802055ee:	048080e7          	jalr	72(ra) # 80207632 <elock>
  ep.valid = 0;
    802055f2:	d6041323          	sh	zero,-666(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    802055f6:	c4c40693          	addi	a3,s0,-948
    802055fa:	04000613          	li	a2,64
    802055fe:	c5040593          	addi	a1,s0,-944
    80205602:	8552                	mv	a0,s4
    80205604:	00002097          	auipc	ra,0x2
    80205608:	232080e7          	jalr	562(ra) # 80207836 <enext>
      if (!isdirempty(dst)) {    // it's ok to overwrite an empty dir
    8020560c:	57fd                	li	a5,-1
    8020560e:	0cf51863          	bne	a0,a5,802056de <sys_rename+0x222>
      elock(pdst);
    80205612:	854a                	mv	a0,s2
    80205614:	00002097          	auipc	ra,0x2
    80205618:	01e080e7          	jalr	30(ra) # 80207632 <elock>
    eremove(dst);
    8020561c:	8552                	mv	a0,s4
    8020561e:	00002097          	auipc	ra,0x2
    80205622:	ee0080e7          	jalr	-288(ra) # 802074fe <eremove>
    eunlock(dst);
    80205626:	8552                	mv	a0,s4
    80205628:	00002097          	auipc	ra,0x2
    8020562c:	040080e7          	jalr	64(ra) # 80207668 <eunlock>
  memmove(src->filename, name, FAT32_MAX_FILENAME);
    80205630:	0ff00613          	li	a2,255
    80205634:	85ce                	mv	a1,s3
    80205636:	8526                	mv	a0,s1
    80205638:	ffffb097          	auipc	ra,0xffffb
    8020563c:	18c080e7          	jalr	396(ra) # 802007c4 <memmove>
  emake(pdst, src, off);
    80205640:	dbc42603          	lw	a2,-580(s0)
    80205644:	85a6                	mv	a1,s1
    80205646:	854a                	mv	a0,s2
    80205648:	00002097          	auipc	ra,0x2
    8020564c:	9dc080e7          	jalr	-1572(ra) # 80207024 <emake>
  if (src->parent != pdst) {
    80205650:	1204b783          	ld	a5,288(s1)
    80205654:	01278d63          	beq	a5,s2,8020566e <sys_rename+0x1b2>
    eunlock(pdst);
    80205658:	854a                	mv	a0,s2
    8020565a:	00002097          	auipc	ra,0x2
    8020565e:	00e080e7          	jalr	14(ra) # 80207668 <eunlock>
    elock(src->parent);
    80205662:	1204b503          	ld	a0,288(s1)
    80205666:	00002097          	auipc	ra,0x2
    8020566a:	fcc080e7          	jalr	-52(ra) # 80207632 <elock>
  eremove(src);
    8020566e:	8526                	mv	a0,s1
    80205670:	00002097          	auipc	ra,0x2
    80205674:	e8e080e7          	jalr	-370(ra) # 802074fe <eremove>
  eunlock(src->parent);
    80205678:	1204b503          	ld	a0,288(s1)
    8020567c:	00002097          	auipc	ra,0x2
    80205680:	fec080e7          	jalr	-20(ra) # 80207668 <eunlock>
  struct dirent *psrc = src->parent;  // src must not be root, or it won't pass the for-loop test
    80205684:	1204b983          	ld	s3,288(s1)
  src->parent = edup(pdst);
    80205688:	854a                	mv	a0,s2
    8020568a:	00002097          	auipc	ra,0x2
    8020568e:	d4a080e7          	jalr	-694(ra) # 802073d4 <edup>
    80205692:	12a4b023          	sd	a0,288(s1)
  src->off = off;
    80205696:	dbc42783          	lw	a5,-580(s0)
    8020569a:	10f4ae23          	sw	a5,284(s1)
  src->valid = 1;
    8020569e:	4785                	li	a5,1
    802056a0:	10f49b23          	sh	a5,278(s1)
  eunlock(src);
    802056a4:	8526                	mv	a0,s1
    802056a6:	00002097          	auipc	ra,0x2
    802056aa:	fc2080e7          	jalr	-62(ra) # 80207668 <eunlock>
  eput(psrc);
    802056ae:	854e                	mv	a0,s3
    802056b0:	00002097          	auipc	ra,0x2
    802056b4:	006080e7          	jalr	6(ra) # 802076b6 <eput>
  if (dst) {
    802056b8:	000a0763          	beqz	s4,802056c6 <sys_rename+0x20a>
    eput(dst);
    802056bc:	8552                	mv	a0,s4
    802056be:	00002097          	auipc	ra,0x2
    802056c2:	ff8080e7          	jalr	-8(ra) # 802076b6 <eput>
  eput(pdst);
    802056c6:	854a                	mv	a0,s2
    802056c8:	00002097          	auipc	ra,0x2
    802056cc:	fee080e7          	jalr	-18(ra) # 802076b6 <eput>
  eput(src);
    802056d0:	8526                	mv	a0,s1
    802056d2:	00002097          	auipc	ra,0x2
    802056d6:	fe4080e7          	jalr	-28(ra) # 802076b6 <eput>
  return 0;
    802056da:	4781                	li	a5,0
    802056dc:	b5f5                	j	802055c8 <sys_rename+0x10c>
        eunlock(dst);
    802056de:	8552                	mv	a0,s4
    802056e0:	00002097          	auipc	ra,0x2
    802056e4:	f88080e7          	jalr	-120(ra) # 80207668 <eunlock>
        goto fail;
    802056e8:	b57d                	j	80205596 <sys_rename+0xda>
  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
    802056ea:	892a                	mv	s2,a0
  if (dst)
    802056ec:	bd7d                	j	802055aa <sys_rename+0xee>

00000000802056ee <sys_openat>:

// added by lmq for SYS_openat
uint64
sys_openat(void)
{
    802056ee:	ca010113          	addi	sp,sp,-864
    802056f2:	34113c23          	sd	ra,856(sp)
    802056f6:	34813823          	sd	s0,848(sp)
    802056fa:	34913423          	sd	s1,840(sp)
    802056fe:	35213023          	sd	s2,832(sp)
    80205702:	33313c23          	sd	s3,824(sp)
    80205706:	33413823          	sd	s4,816(sp)
    8020570a:	33513423          	sd	s5,808(sp)
    8020570e:	1680                	addi	s0,sp,864
  int dirfd;
  if(argint(0, &dirfd) < 0)
    80205710:	fbc40593          	addi	a1,s0,-68
    80205714:	4501                	li	a0,0
    80205716:	ffffe097          	auipc	ra,0xffffe
    8020571a:	a52080e7          	jalr	-1454(ra) # 80203168 <argint>
    8020571e:	2e054563          	bltz	a0,80205a08 <sys_openat+0x31a>
    return -1;
  struct dirent *de = myproc()->cwd;
    80205722:	ffffc097          	auipc	ra,0xffffc
    80205726:	33e080e7          	jalr	830(ra) # 80201a60 <myproc>
  if(dirfd!=AT_FDCWD)
    8020572a:	fbc42703          	lw	a4,-68(s0)
    8020572e:	f9c00793          	li	a5,-100
    80205732:	16f71563          	bne	a4,a5,8020589c <sys_openat+0x1ae>
  struct dirent *de = myproc()->cwd;
    80205736:	4d853483          	ld	s1,1240(a0)
  {
    de=myproc()->ofile[dirfd]->ep;
  }
  char cur_path[FAT32_MAX_PATH];  // openat工作目录 可以为当前目录 也可以被指定
  memset(cur_path,0,FAT32_MAX_PATH);
    8020573a:	10400613          	li	a2,260
    8020573e:	4581                	li	a1,0
    80205740:	eb840513          	addi	a0,s0,-328
    80205744:	ffffb097          	auipc	ra,0xffffb
    80205748:	020080e7          	jalr	32(ra) # 80200764 <memset>
  char* s=NULL;
  int len;

  // 获得openat工作目录路径
  if (de->parent == NULL) {
    8020574c:	1204b783          	ld	a5,288(s1)
    80205750:	16078263          	beqz	a5,802058b4 <sys_openat+0x1c6>
    s = "/";
  } 
  else {
    s = cur_path + FAT32_MAX_PATH - 1;
    *s = '\0';
    80205754:	fa040da3          	sb	zero,-69(s0)
    s = cur_path + FAT32_MAX_PATH - 1;
    80205758:	fbb40993          	addi	s3,s0,-69
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= cur_path)          // can't reach root "/"
    8020575c:	eb840a13          	addi	s4,s0,-328
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    80205760:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    80205764:	8526                	mv	a0,s1
    80205766:	ffffb097          	auipc	ra,0xffffb
    8020576a:	186080e7          	jalr	390(ra) # 802008ec <strlen>
    8020576e:	862a                	mv	a2,a0
      s -= len;
    80205770:	40a98933          	sub	s2,s3,a0
      if (s <= cur_path)          // can't reach root "/"
    80205774:	292a7c63          	bgeu	s4,s2,80205a0c <sys_openat+0x31e>
      strncpy(s, de->filename, len);
    80205778:	85a6                	mv	a1,s1
    8020577a:	854a                	mv	a0,s2
    8020577c:	ffffb097          	auipc	ra,0xffffb
    80205780:	100080e7          	jalr	256(ra) # 8020087c <strncpy>
      *--s = '/';
    80205784:	fff90993          	addi	s3,s2,-1
    80205788:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    8020578c:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    80205790:	1204b783          	ld	a5,288(s1)
    80205794:	fbe1                	bnez	a5,80205764 <sys_openat+0x76>
    }
  }
  
  // 获得openat的文件路径 openat工作目录+相对路径
  char absolute_path[FAT32_MAX_PATH];
  memset(absolute_path,0,FAT32_MAX_PATH);
    80205796:	10400613          	li	a2,260
    8020579a:	4581                	li	a1,0
    8020579c:	db040493          	addi	s1,s0,-592
    802057a0:	8526                	mv	a0,s1
    802057a2:	ffffb097          	auipc	ra,0xffffb
    802057a6:	fc2080e7          	jalr	-62(ra) # 80200764 <memset>
  strncpy(absolute_path,s,strlen(s));
    802057aa:	854e                	mv	a0,s3
    802057ac:	ffffb097          	auipc	ra,0xffffb
    802057b0:	140080e7          	jalr	320(ra) # 802008ec <strlen>
    802057b4:	862a                	mv	a2,a0
    802057b6:	85ce                	mv	a1,s3
    802057b8:	8526                	mv	a0,s1
    802057ba:	ffffb097          	auipc	ra,0xffffb
    802057be:	0c2080e7          	jalr	194(ra) # 8020087c <strncpy>

  int fd,omode;
  struct file *f;
  struct dirent *ep;
  char relative_path[FAT32_MAX_PATH];
  if(argstr(1, relative_path, FAT32_MAX_PATH) < 0 || argint(2,&omode) < 0)
    802057c2:	10400613          	li	a2,260
    802057c6:	ca840593          	addi	a1,s0,-856
    802057ca:	4505                	li	a0,1
    802057cc:	ffffe097          	auipc	ra,0xffffe
    802057d0:	a20080e7          	jalr	-1504(ra) # 802031ec <argstr>
    802057d4:	24054e63          	bltz	a0,80205a30 <sys_openat+0x342>
    802057d8:	dac40593          	addi	a1,s0,-596
    802057dc:	4509                	li	a0,2
    802057de:	ffffe097          	auipc	ra,0xffffe
    802057e2:	98a080e7          	jalr	-1654(ra) # 80203168 <argint>
    802057e6:	24054763          	bltz	a0,80205a34 <sys_openat+0x346>
    return -1;
  
  if(relative_path[0]=='/')                               // 为绝对路径 忽略dirfd
    802057ea:	ca844783          	lbu	a5,-856(s0)
    802057ee:	02f00713          	li	a4,47
    802057f2:	0ce78663          	beq	a5,a4,802058be <sys_openat+0x1d0>
  {
    memset(absolute_path,0,FAT32_MAX_PATH);
    strncpy(absolute_path,relative_path,strlen(relative_path));
  }
  else if(relative_path[0]=='.' && relative_path[1]=='/') // 为显式相对路径
    802057f6:	02e00713          	li	a4,46
    802057fa:	0ee78963          	beq	a5,a4,802058ec <sys_openat+0x1fe>
  {
    panic("openat not support ..");
  }
  else                                                    // 为隐式相对路径
  {
    int absolute_path_old_len=strlen(absolute_path);
    802057fe:	db040913          	addi	s2,s0,-592
    80205802:	854a                	mv	a0,s2
    80205804:	ffffb097          	auipc	ra,0xffffb
    80205808:	0e8080e7          	jalr	232(ra) # 802008ec <strlen>
    absolute_path[absolute_path_old_len]='/';
    8020580c:	fc040793          	addi	a5,s0,-64
    80205810:	97aa                	add	a5,a5,a0
    80205812:	02f00713          	li	a4,47
    80205816:	dee78823          	sb	a4,-528(a5)
    absolute_path[absolute_path_old_len+1]='\0';
    8020581a:	2505                	addiw	a0,a0,1
    8020581c:	fc040793          	addi	a5,s0,-64
    80205820:	953e                	add	a0,a0,a5
    80205822:	de050823          	sb	zero,-528(a0)
    strncpy(absolute_path+strlen(absolute_path),
    80205826:	854a                	mv	a0,s2
    80205828:	ffffb097          	auipc	ra,0xffffb
    8020582c:	0c4080e7          	jalr	196(ra) # 802008ec <strlen>
    80205830:	84aa                	mv	s1,a0
    80205832:	ca840993          	addi	s3,s0,-856
    80205836:	854e                	mv	a0,s3
    80205838:	ffffb097          	auipc	ra,0xffffb
    8020583c:	0b4080e7          	jalr	180(ra) # 802008ec <strlen>
    80205840:	862a                	mv	a2,a0
    80205842:	85ce                	mv	a1,s3
    80205844:	00990533          	add	a0,s2,s1
    80205848:	ffffb097          	auipc	ra,0xffffb
    8020584c:	034080e7          	jalr	52(ra) # 8020087c <strncpy>
            relative_path,
            strlen(relative_path));
  }

  // 根据路径名打开文件
  if(omode & O_CREATE){                         // 创建文件
    80205850:	dac42603          	lw	a2,-596(s0)
    80205854:	24067793          	andi	a5,a2,576
    80205858:	e7e5                	bnez	a5,80205940 <sys_openat+0x252>
    ep = create(absolute_path, T_FILE, omode);
    if(ep == NULL){
      return -1;
    }
  } 
  else if(omode & O_DIRECTORY)                  // 打开一个目录
    8020585a:	02a61793          	slli	a5,a2,0x2a
    8020585e:	1607d063          	bgez	a5,802059be <sys_openat+0x2d0>
  {
    
    if((ep=ename(absolute_path))==NULL)         // 获取目录项
    80205862:	db040513          	addi	a0,s0,-592
    80205866:	00002097          	auipc	ra,0x2
    8020586a:	576080e7          	jalr	1398(ra) # 80207ddc <ename>
    8020586e:	892a                	mv	s2,a0
    80205870:	1c050663          	beqz	a0,80205a3c <sys_openat+0x34e>
    {
      return -1;
    }
    elock(ep);
    80205874:	00002097          	auipc	ra,0x2
    80205878:	dbe080e7          	jalr	-578(ra) # 80207632 <elock>
    if(!(ep->attribute & ATTR_DIRECTORY))       // 该文件不是目录文件
    8020587c:	10094783          	lbu	a5,256(s2)
    80205880:	8bc1                	andi	a5,a5,16
    80205882:	ebe1                	bnez	a5,80205952 <sys_openat+0x264>
    {
      eunlock(ep);
    80205884:	854a                	mv	a0,s2
    80205886:	00002097          	auipc	ra,0x2
    8020588a:	de2080e7          	jalr	-542(ra) # 80207668 <eunlock>
      eput(ep);
    8020588e:	854a                	mv	a0,s2
    80205890:	00002097          	auipc	ra,0x2
    80205894:	e26080e7          	jalr	-474(ra) # 802076b6 <eput>
      return -1;
    80205898:	557d                	li	a0,-1
    8020589a:	aa95                	j	80205a0e <sys_openat+0x320>
    de=myproc()->ofile[dirfd]->ep;
    8020589c:	ffffc097          	auipc	ra,0xffffc
    802058a0:	1c4080e7          	jalr	452(ra) # 80201a60 <myproc>
    802058a4:	fbc42783          	lw	a5,-68(s0)
    802058a8:	07e9                	addi	a5,a5,26
    802058aa:	078e                	slli	a5,a5,0x3
    802058ac:	97aa                	add	a5,a5,a0
    802058ae:	679c                	ld	a5,8(a5)
    802058b0:	6f84                	ld	s1,24(a5)
    802058b2:	b561                	j	8020573a <sys_openat+0x4c>
    s = "/";
    802058b4:	00005997          	auipc	s3,0x5
    802058b8:	d7c98993          	addi	s3,s3,-644 # 8020a630 <digits+0x2b0>
    802058bc:	bde9                	j	80205796 <sys_openat+0xa8>
    memset(absolute_path,0,FAT32_MAX_PATH);
    802058be:	10400613          	li	a2,260
    802058c2:	4581                	li	a1,0
    802058c4:	8526                	mv	a0,s1
    802058c6:	ffffb097          	auipc	ra,0xffffb
    802058ca:	e9e080e7          	jalr	-354(ra) # 80200764 <memset>
    strncpy(absolute_path,relative_path,strlen(relative_path));
    802058ce:	ca840913          	addi	s2,s0,-856
    802058d2:	854a                	mv	a0,s2
    802058d4:	ffffb097          	auipc	ra,0xffffb
    802058d8:	018080e7          	jalr	24(ra) # 802008ec <strlen>
    802058dc:	862a                	mv	a2,a0
    802058de:	85ca                	mv	a1,s2
    802058e0:	8526                	mv	a0,s1
    802058e2:	ffffb097          	auipc	ra,0xffffb
    802058e6:	f9a080e7          	jalr	-102(ra) # 8020087c <strncpy>
    802058ea:	b79d                	j	80205850 <sys_openat+0x162>
  else if(relative_path[0]=='.' && relative_path[1]=='/') // 为显式相对路径
    802058ec:	ca944783          	lbu	a5,-855(s0)
    802058f0:	02f00713          	li	a4,47
    802058f4:	00e78e63          	beq	a5,a4,80205910 <sys_openat+0x222>
  else if (relative_path[0]=='.' && relative_path[1]=='.')// 显示相对路径 没有实现
    802058f8:	02e00713          	li	a4,46
    802058fc:	f0e791e3          	bne	a5,a4,802057fe <sys_openat+0x110>
    panic("openat not support ..");
    80205900:	00005517          	auipc	a0,0x5
    80205904:	40850513          	addi	a0,a0,1032 # 8020ad08 <digits+0x988>
    80205908:	ffffb097          	auipc	ra,0xffffb
    8020590c:	83a080e7          	jalr	-1990(ra) # 80200142 <panic>
    strncpy(absolute_path+strlen(absolute_path),
    80205910:	db040913          	addi	s2,s0,-592
    80205914:	854a                	mv	a0,s2
    80205916:	ffffb097          	auipc	ra,0xffffb
    8020591a:	fd6080e7          	jalr	-42(ra) # 802008ec <strlen>
    8020591e:	84aa                	mv	s1,a0
    80205920:	ca940993          	addi	s3,s0,-855
    80205924:	854e                	mv	a0,s3
    80205926:	ffffb097          	auipc	ra,0xffffb
    8020592a:	fc6080e7          	jalr	-58(ra) # 802008ec <strlen>
    8020592e:	862a                	mv	a2,a0
    80205930:	85ce                	mv	a1,s3
    80205932:	00990533          	add	a0,s2,s1
    80205936:	ffffb097          	auipc	ra,0xffffb
    8020593a:	f46080e7          	jalr	-186(ra) # 8020087c <strncpy>
    8020593e:	bf09                	j	80205850 <sys_openat+0x162>
    ep = create(absolute_path, T_FILE, omode);
    80205940:	4589                	li	a1,2
    80205942:	db040513          	addi	a0,s0,-592
    80205946:	fffff097          	auipc	ra,0xfffff
    8020594a:	290080e7          	jalr	656(ra) # 80204bd6 <create>
    8020594e:	892a                	mv	s2,a0
    if(ep == NULL){
    80205950:	c565                	beqz	a0,80205a38 <sys_openat+0x34a>
      return -1;
    }
  }

  
  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80205952:	ffffe097          	auipc	ra,0xffffe
    80205956:	612080e7          	jalr	1554(ra) # 80203f64 <filealloc>
    8020595a:	89aa                	mv	s3,a0
    8020595c:	c96d                	beqz	a0,80205a4e <sys_openat+0x360>
    8020595e:	fffff097          	auipc	ra,0xfffff
    80205962:	234080e7          	jalr	564(ra) # 80204b92 <fdalloc>
    80205966:	84aa                	mv	s1,a0
    80205968:	0c054e63          	bltz	a0,80205a44 <sys_openat+0x356>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    8020596c:	10094783          	lbu	a5,256(s2)
    80205970:	8bc1                	andi	a5,a5,16
    80205972:	e791                	bnez	a5,8020597e <sys_openat+0x290>
    80205974:	dac42783          	lw	a5,-596(s0)
    80205978:	4007f793          	andi	a5,a5,1024
    8020597c:	e3c1                	bnez	a5,802059fc <sys_openat+0x30e>
    etrunc(ep);
  }

  // 设置权限
  f->type = FD_ENTRY;
    8020597e:	4789                	li	a5,2
    80205980:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    80205984:	dac42783          	lw	a5,-596(s0)
    80205988:	0047f693          	andi	a3,a5,4
    8020598c:	4701                	li	a4,0
    8020598e:	c299                	beqz	a3,80205994 <sys_openat+0x2a6>
    80205990:	10892703          	lw	a4,264(s2)
    80205994:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    80205998:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    8020599c:	0017c713          	xori	a4,a5,1
    802059a0:	8b05                	andi	a4,a4,1
    802059a2:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    802059a6:	8b8d                	andi	a5,a5,3
    802059a8:	00f037b3          	snez	a5,a5
    802059ac:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    802059b0:	854a                	mv	a0,s2
    802059b2:	00002097          	auipc	ra,0x2
    802059b6:	cb6080e7          	jalr	-842(ra) # 80207668 <eunlock>

  return fd;
    802059ba:	8526                	mv	a0,s1
    802059bc:	a889                	j	80205a0e <sys_openat+0x320>
    if((ep = ename(absolute_path)) == NULL){
    802059be:	db040513          	addi	a0,s0,-592
    802059c2:	00002097          	auipc	ra,0x2
    802059c6:	41a080e7          	jalr	1050(ra) # 80207ddc <ename>
    802059ca:	892a                	mv	s2,a0
    802059cc:	c935                	beqz	a0,80205a40 <sys_openat+0x352>
    elock(ep);
    802059ce:	00002097          	auipc	ra,0x2
    802059d2:	c64080e7          	jalr	-924(ra) # 80207632 <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    802059d6:	10094783          	lbu	a5,256(s2)
    802059da:	8bc1                	andi	a5,a5,16
    802059dc:	dbbd                	beqz	a5,80205952 <sys_openat+0x264>
    802059de:	dac42783          	lw	a5,-596(s0)
    802059e2:	dba5                	beqz	a5,80205952 <sys_openat+0x264>
      eunlock(ep);
    802059e4:	854a                	mv	a0,s2
    802059e6:	00002097          	auipc	ra,0x2
    802059ea:	c82080e7          	jalr	-894(ra) # 80207668 <eunlock>
      eput(ep);
    802059ee:	854a                	mv	a0,s2
    802059f0:	00002097          	auipc	ra,0x2
    802059f4:	cc6080e7          	jalr	-826(ra) # 802076b6 <eput>
      return -1;
    802059f8:	557d                	li	a0,-1
    802059fa:	a811                	j	80205a0e <sys_openat+0x320>
    etrunc(ep);
    802059fc:	854a                	mv	a0,s2
    802059fe:	00002097          	auipc	ra,0x2
    80205a02:	bca080e7          	jalr	-1078(ra) # 802075c8 <etrunc>
    80205a06:	bfa5                	j	8020597e <sys_openat+0x290>
    return -1;
    80205a08:	557d                	li	a0,-1
    80205a0a:	a011                	j	80205a0e <sys_openat+0x320>
        return -1;
    80205a0c:	557d                	li	a0,-1
}
    80205a0e:	35813083          	ld	ra,856(sp)
    80205a12:	35013403          	ld	s0,848(sp)
    80205a16:	34813483          	ld	s1,840(sp)
    80205a1a:	34013903          	ld	s2,832(sp)
    80205a1e:	33813983          	ld	s3,824(sp)
    80205a22:	33013a03          	ld	s4,816(sp)
    80205a26:	32813a83          	ld	s5,808(sp)
    80205a2a:	36010113          	addi	sp,sp,864
    80205a2e:	8082                	ret
    return -1;
    80205a30:	557d                	li	a0,-1
    80205a32:	bff1                	j	80205a0e <sys_openat+0x320>
    80205a34:	557d                	li	a0,-1
    80205a36:	bfe1                	j	80205a0e <sys_openat+0x320>
      return -1;
    80205a38:	557d                	li	a0,-1
    80205a3a:	bfd1                	j	80205a0e <sys_openat+0x320>
      return -1;
    80205a3c:	557d                	li	a0,-1
    80205a3e:	bfc1                	j	80205a0e <sys_openat+0x320>
      return -1;
    80205a40:	557d                	li	a0,-1
    80205a42:	b7f1                	j	80205a0e <sys_openat+0x320>
      fileclose(f);
    80205a44:	854e                	mv	a0,s3
    80205a46:	ffffe097          	auipc	ra,0xffffe
    80205a4a:	5da080e7          	jalr	1498(ra) # 80204020 <fileclose>
    eunlock(ep);
    80205a4e:	854a                	mv	a0,s2
    80205a50:	00002097          	auipc	ra,0x2
    80205a54:	c18080e7          	jalr	-1000(ra) # 80207668 <eunlock>
    eput(ep);
    80205a58:	854a                	mv	a0,s2
    80205a5a:	00002097          	auipc	ra,0x2
    80205a5e:	c5c080e7          	jalr	-932(ra) # 802076b6 <eput>
    return -1;
    80205a62:	557d                	li	a0,-1
    80205a64:	b76d                	j	80205a0e <sys_openat+0x320>

0000000080205a66 <sys_mkdirat>:


// added by lmq for SYS_mkdirat
uint64
sys_mkdirat(void)
{
    80205a66:	da010113          	addi	sp,sp,-608
    80205a6a:	24113c23          	sd	ra,600(sp)
    80205a6e:	24813823          	sd	s0,592(sp)
    80205a72:	24913423          	sd	s1,584(sp)
    80205a76:	25213023          	sd	s2,576(sp)
    80205a7a:	23313c23          	sd	s3,568(sp)
    80205a7e:	23413823          	sd	s4,560(sp)
    80205a82:	23513423          	sd	s5,552(sp)
    80205a86:	1480                	addi	s0,sp,608
  int dirfd,omode;
  char des_path[FAT32_MAX_PATH];
  if(argint(0, &dirfd) < 0 || argstr(1,des_path,FAT32_MAX_PATH)<0 || argint(2,&omode)<0)
    80205a88:	fbc40593          	addi	a1,s0,-68
    80205a8c:	4501                	li	a0,0
    80205a8e:	ffffd097          	auipc	ra,0xffffd
    80205a92:	6da080e7          	jalr	1754(ra) # 80203168 <argint>
    80205a96:	20054663          	bltz	a0,80205ca2 <sys_mkdirat+0x23c>
    80205a9a:	10400613          	li	a2,260
    80205a9e:	eb040593          	addi	a1,s0,-336
    80205aa2:	4505                	li	a0,1
    80205aa4:	ffffd097          	auipc	ra,0xffffd
    80205aa8:	748080e7          	jalr	1864(ra) # 802031ec <argstr>
    80205aac:	20054d63          	bltz	a0,80205cc6 <sys_mkdirat+0x260>
    80205ab0:	fb840593          	addi	a1,s0,-72
    80205ab4:	4509                	li	a0,2
    80205ab6:	ffffd097          	auipc	ra,0xffffd
    80205aba:	6b2080e7          	jalr	1714(ra) # 80203168 <argint>
    80205abe:	20054663          	bltz	a0,80205cca <sys_mkdirat+0x264>
    return -1;


  // 如果dirfd不为AT_FDCWD 则获得dirfd的路径
  char cur_path[FAT32_MAX_PATH];
  memset(cur_path,0,FAT32_MAX_PATH);
    80205ac2:	10400613          	li	a2,260
    80205ac6:	4581                	li	a1,0
    80205ac8:	da840513          	addi	a0,s0,-600
    80205acc:	ffffb097          	auipc	ra,0xffffb
    80205ad0:	c98080e7          	jalr	-872(ra) # 80200764 <memset>
  char* s=NULL;
  int len;
  if(dirfd!=AT_FDCWD)
    80205ad4:	fbc42703          	lw	a4,-68(s0)
    80205ad8:	f9c00793          	li	a5,-100
    80205adc:	10f70963          	beq	a4,a5,80205bee <sys_mkdirat+0x188>
  {
    struct dirent* de=myproc()->ofile[dirfd]->ep;
    80205ae0:	ffffc097          	auipc	ra,0xffffc
    80205ae4:	f80080e7          	jalr	-128(ra) # 80201a60 <myproc>
    80205ae8:	fbc42783          	lw	a5,-68(s0)
    80205aec:	07e9                	addi	a5,a5,26
    80205aee:	078e                	slli	a5,a5,0x3
    80205af0:	97aa                	add	a5,a5,a0
    80205af2:	679c                	ld	a5,8(a5)
    80205af4:	6f84                	ld	s1,24(a5)
    if (de->parent == NULL) {
    80205af6:	1204b783          	ld	a5,288(s1)
    80205afa:	12078063          	beqz	a5,80205c1a <sys_mkdirat+0x1b4>
      s = "/";
    } 
    else {
      s = cur_path + FAT32_MAX_PATH - 1;
      *s = '\0';
    80205afe:	ea0405a3          	sb	zero,-341(s0)
      s = cur_path + FAT32_MAX_PATH - 1;
    80205b02:	eab40993          	addi	s3,s0,-341
      while (de->parent) {
        len = strlen(de->filename);
        s -= len;
        if (s <= cur_path)          // can't reach root "/"
    80205b06:	da840a13          	addi	s4,s0,-600
          return -1;
        strncpy(s, de->filename, len);
        *--s = '/';
    80205b0a:	02f00a93          	li	s5,47
        len = strlen(de->filename);
    80205b0e:	8526                	mv	a0,s1
    80205b10:	ffffb097          	auipc	ra,0xffffb
    80205b14:	ddc080e7          	jalr	-548(ra) # 802008ec <strlen>
    80205b18:	862a                	mv	a2,a0
        s -= len;
    80205b1a:	40a98933          	sub	s2,s3,a0
        if (s <= cur_path)          // can't reach root "/"
    80205b1e:	1b2a7863          	bgeu	s4,s2,80205cce <sys_mkdirat+0x268>
        strncpy(s, de->filename, len);
    80205b22:	85a6                	mv	a1,s1
    80205b24:	854a                	mv	a0,s2
    80205b26:	ffffb097          	auipc	ra,0xffffb
    80205b2a:	d56080e7          	jalr	-682(ra) # 8020087c <strncpy>
        *--s = '/';
    80205b2e:	fff90993          	addi	s3,s2,-1
    80205b32:	ff590fa3          	sb	s5,-1(s2)
        de = de->parent;
    80205b36:	1204b483          	ld	s1,288(s1)
      while (de->parent) {
    80205b3a:	1204b783          	ld	a5,288(s1)
    80205b3e:	fbe1                	bnez	a5,80205b0e <sys_mkdirat+0xa8>
      }
    }
    memset(cur_path,0,FAT32_MAX_PATH);
    80205b40:	10400613          	li	a2,260
    80205b44:	4581                	li	a1,0
    80205b46:	da840493          	addi	s1,s0,-600
    80205b4a:	8526                	mv	a0,s1
    80205b4c:	ffffb097          	auipc	ra,0xffffb
    80205b50:	c18080e7          	jalr	-1000(ra) # 80200764 <memset>
    strncpy(cur_path,s,strlen(s));
    80205b54:	854e                	mv	a0,s3
    80205b56:	ffffb097          	auipc	ra,0xffffb
    80205b5a:	d96080e7          	jalr	-618(ra) # 802008ec <strlen>
    80205b5e:	862a                	mv	a2,a0
    80205b60:	85ce                	mv	a1,s3
    80205b62:	8526                	mv	a0,s1
    80205b64:	ffffb097          	auipc	ra,0xffffb
    80205b68:	d18080e7          	jalr	-744(ra) # 8020087c <strncpy>
    if(des_path[0]!='/')
    80205b6c:	eb044783          	lbu	a5,-336(s0)
    80205b70:	02f00713          	li	a4,47
    80205b74:	06e78d63          	beq	a5,a4,80205bee <sys_mkdirat+0x188>
    {
      if(des_path[0]=='.' && des_path[1]=='/')
    80205b78:	02e00713          	li	a4,46
    80205b7c:	0ae78463          	beq	a5,a4,80205c24 <sys_mkdirat+0x1be>
      {
        panic("mkdirat not support ..\n");
      }
      else
      {
        cur_path[strlen(cur_path)]='/';
    80205b80:	da840493          	addi	s1,s0,-600
    80205b84:	8526                	mv	a0,s1
    80205b86:	ffffb097          	auipc	ra,0xffffb
    80205b8a:	d66080e7          	jalr	-666(ra) # 802008ec <strlen>
    80205b8e:	fc040793          	addi	a5,s0,-64
    80205b92:	953e                	add	a0,a0,a5
    80205b94:	02f00793          	li	a5,47
    80205b98:	def50423          	sb	a5,-536(a0)
        strncpy(cur_path+strlen(cur_path),des_path,strlen(des_path));
    80205b9c:	8526                	mv	a0,s1
    80205b9e:	ffffb097          	auipc	ra,0xffffb
    80205ba2:	d4e080e7          	jalr	-690(ra) # 802008ec <strlen>
    80205ba6:	89aa                	mv	s3,a0
    80205ba8:	eb040913          	addi	s2,s0,-336
    80205bac:	854a                	mv	a0,s2
    80205bae:	ffffb097          	auipc	ra,0xffffb
    80205bb2:	d3e080e7          	jalr	-706(ra) # 802008ec <strlen>
    80205bb6:	862a                	mv	a2,a0
    80205bb8:	85ca                	mv	a1,s2
    80205bba:	01348533          	add	a0,s1,s3
    80205bbe:	ffffb097          	auipc	ra,0xffffb
    80205bc2:	cbe080e7          	jalr	-834(ra) # 8020087c <strncpy>
        memset(des_path,0,FAT32_MAX_PATH);
    80205bc6:	10400613          	li	a2,260
    80205bca:	4581                	li	a1,0
    80205bcc:	854a                	mv	a0,s2
    80205bce:	ffffb097          	auipc	ra,0xffffb
    80205bd2:	b96080e7          	jalr	-1130(ra) # 80200764 <memset>
        strncpy(des_path,cur_path,strlen(cur_path));
    80205bd6:	8526                	mv	a0,s1
    80205bd8:	ffffb097          	auipc	ra,0xffffb
    80205bdc:	d14080e7          	jalr	-748(ra) # 802008ec <strlen>
    80205be0:	862a                	mv	a2,a0
    80205be2:	85a6                	mv	a1,s1
    80205be4:	854a                	mv	a0,s2
    80205be6:	ffffb097          	auipc	ra,0xffffb
    80205bea:	c96080e7          	jalr	-874(ra) # 8020087c <strncpy>
    }
    
  }

  struct dirent* ep;
  if((ep = create(des_path, T_DIR, omode)) == 0)
    80205bee:	fb842603          	lw	a2,-72(s0)
    80205bf2:	4585                	li	a1,1
    80205bf4:	eb040513          	addi	a0,s0,-336
    80205bf8:	fffff097          	auipc	ra,0xfffff
    80205bfc:	fde080e7          	jalr	-34(ra) # 80204bd6 <create>
    80205c00:	84aa                	mv	s1,a0
    80205c02:	c961                	beqz	a0,80205cd2 <sys_mkdirat+0x26c>
  {
    return -1;
  }

  eunlock(ep);
    80205c04:	00002097          	auipc	ra,0x2
    80205c08:	a64080e7          	jalr	-1436(ra) # 80207668 <eunlock>
  eput(ep);
    80205c0c:	8526                	mv	a0,s1
    80205c0e:	00002097          	auipc	ra,0x2
    80205c12:	aa8080e7          	jalr	-1368(ra) # 802076b6 <eput>
  return 0;
    80205c16:	4501                	li	a0,0
    80205c18:	a071                	j	80205ca4 <sys_mkdirat+0x23e>
      s = "/";
    80205c1a:	00005997          	auipc	s3,0x5
    80205c1e:	a1698993          	addi	s3,s3,-1514 # 8020a630 <digits+0x2b0>
    80205c22:	bf39                	j	80205b40 <sys_mkdirat+0xda>
      if(des_path[0]=='.' && des_path[1]=='/')
    80205c24:	eb144783          	lbu	a5,-335(s0)
    80205c28:	02f00713          	li	a4,47
    80205c2c:	00e78e63          	beq	a5,a4,80205c48 <sys_mkdirat+0x1e2>
      else if(des_path[0]=='.' && des_path[1]=='.')
    80205c30:	02e00713          	li	a4,46
    80205c34:	f4e796e3          	bne	a5,a4,80205b80 <sys_mkdirat+0x11a>
        panic("mkdirat not support ..\n");
    80205c38:	00005517          	auipc	a0,0x5
    80205c3c:	0e850513          	addi	a0,a0,232 # 8020ad20 <digits+0x9a0>
    80205c40:	ffffa097          	auipc	ra,0xffffa
    80205c44:	502080e7          	jalr	1282(ra) # 80200142 <panic>
        strncpy(cur_path+strlen(cur_path),des_path+1,strlen(des_path+1));
    80205c48:	8926                	mv	s2,s1
    80205c4a:	8526                	mv	a0,s1
    80205c4c:	ffffb097          	auipc	ra,0xffffb
    80205c50:	ca0080e7          	jalr	-864(ra) # 802008ec <strlen>
    80205c54:	84aa                	mv	s1,a0
    80205c56:	eb140993          	addi	s3,s0,-335
    80205c5a:	854e                	mv	a0,s3
    80205c5c:	ffffb097          	auipc	ra,0xffffb
    80205c60:	c90080e7          	jalr	-880(ra) # 802008ec <strlen>
    80205c64:	862a                	mv	a2,a0
    80205c66:	85ce                	mv	a1,s3
    80205c68:	00990533          	add	a0,s2,s1
    80205c6c:	ffffb097          	auipc	ra,0xffffb
    80205c70:	c10080e7          	jalr	-1008(ra) # 8020087c <strncpy>
        memset(des_path,0,FAT32_MAX_PATH);
    80205c74:	10400613          	li	a2,260
    80205c78:	4581                	li	a1,0
    80205c7a:	eb040493          	addi	s1,s0,-336
    80205c7e:	8526                	mv	a0,s1
    80205c80:	ffffb097          	auipc	ra,0xffffb
    80205c84:	ae4080e7          	jalr	-1308(ra) # 80200764 <memset>
        strncpy(des_path,cur_path,strlen(cur_path));
    80205c88:	854a                	mv	a0,s2
    80205c8a:	ffffb097          	auipc	ra,0xffffb
    80205c8e:	c62080e7          	jalr	-926(ra) # 802008ec <strlen>
    80205c92:	862a                	mv	a2,a0
    80205c94:	85ca                	mv	a1,s2
    80205c96:	8526                	mv	a0,s1
    80205c98:	ffffb097          	auipc	ra,0xffffb
    80205c9c:	be4080e7          	jalr	-1052(ra) # 8020087c <strncpy>
    80205ca0:	b7b9                	j	80205bee <sys_mkdirat+0x188>
    return -1;
    80205ca2:	557d                	li	a0,-1
}
    80205ca4:	25813083          	ld	ra,600(sp)
    80205ca8:	25013403          	ld	s0,592(sp)
    80205cac:	24813483          	ld	s1,584(sp)
    80205cb0:	24013903          	ld	s2,576(sp)
    80205cb4:	23813983          	ld	s3,568(sp)
    80205cb8:	23013a03          	ld	s4,560(sp)
    80205cbc:	22813a83          	ld	s5,552(sp)
    80205cc0:	26010113          	addi	sp,sp,608
    80205cc4:	8082                	ret
    return -1;
    80205cc6:	557d                	li	a0,-1
    80205cc8:	bff1                	j	80205ca4 <sys_mkdirat+0x23e>
    80205cca:	557d                	li	a0,-1
    80205ccc:	bfe1                	j	80205ca4 <sys_mkdirat+0x23e>
          return -1;
    80205cce:	557d                	li	a0,-1
    80205cd0:	bfd1                	j	80205ca4 <sys_mkdirat+0x23e>
    return -1;
    80205cd2:	557d                	li	a0,-1
    80205cd4:	bfc1                	j	80205ca4 <sys_mkdirat+0x23e>

0000000080205cd6 <sys_dup3>:

// added by lmq for SYS_dup3
uint64
sys_dup3(void)
{
    80205cd6:	7179                	addi	sp,sp,-48
    80205cd8:	f406                	sd	ra,40(sp)
    80205cda:	f022                	sd	s0,32(sp)
    80205cdc:	ec26                	sd	s1,24(sp)
    80205cde:	1800                	addi	s0,sp,48
  struct file *f;
  int new_fd;
  struct proc* p=myproc();
    80205ce0:	ffffc097          	auipc	ra,0xffffc
    80205ce4:	d80080e7          	jalr	-640(ra) # 80201a60 <myproc>
    80205ce8:	84aa                	mv	s1,a0

  if(argfd(0, 0, &f) < 0 || argint(1,&new_fd)<0)
    80205cea:	fd840613          	addi	a2,s0,-40
    80205cee:	4581                	li	a1,0
    80205cf0:	4501                	li	a0,0
    80205cf2:	fffff097          	auipc	ra,0xfffff
    80205cf6:	e36080e7          	jalr	-458(ra) # 80204b28 <argfd>
    return -1;
    80205cfa:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(1,&new_fd)<0)
    80205cfc:	02054263          	bltz	a0,80205d20 <sys_dup3+0x4a>
    80205d00:	fd440593          	addi	a1,s0,-44
    80205d04:	4505                	li	a0,1
    80205d06:	ffffd097          	auipc	ra,0xffffd
    80205d0a:	462080e7          	jalr	1122(ra) # 80203168 <argint>
    80205d0e:	02054963          	bltz	a0,80205d40 <sys_dup3+0x6a>
  if(p->ofile[new_fd]!=0)        // 文件描述符[new_fd]已被占用
    80205d12:	fd442503          	lw	a0,-44(s0)
    80205d16:	050e                	slli	a0,a0,0x3
    80205d18:	94aa                	add	s1,s1,a0
    80205d1a:	6cf8                	ld	a4,216(s1)
  {
    return -1;
    80205d1c:	57fd                	li	a5,-1
  if(p->ofile[new_fd]!=0)        // 文件描述符[new_fd]已被占用
    80205d1e:	c719                	beqz	a4,80205d2c <sys_dup3+0x56>
  }
  p->ofile[new_fd] = f;
  filedup(f);
  return new_fd;
}
    80205d20:	853e                	mv	a0,a5
    80205d22:	70a2                	ld	ra,40(sp)
    80205d24:	7402                	ld	s0,32(sp)
    80205d26:	64e2                	ld	s1,24(sp)
    80205d28:	6145                	addi	sp,sp,48
    80205d2a:	8082                	ret
  p->ofile[new_fd] = f;
    80205d2c:	fd843503          	ld	a0,-40(s0)
    80205d30:	ece8                	sd	a0,216(s1)
  filedup(f);
    80205d32:	ffffe097          	auipc	ra,0xffffe
    80205d36:	29c080e7          	jalr	668(ra) # 80203fce <filedup>
  return new_fd;
    80205d3a:	fd442783          	lw	a5,-44(s0)
    80205d3e:	b7cd                	j	80205d20 <sys_dup3+0x4a>
    return -1;
    80205d40:	57fd                	li	a5,-1
    80205d42:	bff9                	j	80205d20 <sys_dup3+0x4a>

0000000080205d44 <sys_getdents64>:
  unsigned char   d_type;	    // 文件类型    
  char            d_name[];	  // 文件名
};
uint64 
sys_getdents64(void)
{
    80205d44:	7139                	addi	sp,sp,-64
    80205d46:	fc06                	sd	ra,56(sp)
    80205d48:	f822                	sd	s0,48(sp)
    80205d4a:	f426                	sd	s1,40(sp)
    80205d4c:	0080                	addi	s0,sp,64
  int fd,len;                   // fd:要读取的目录的文件描述符
  struct file* f;
  struct linux_dirent64* dirp64;// dirp64:存储信息的地址

  if(argfd(0,&fd,&f)<0 || argaddr(1,(uint64*)&dirp64)<0 || argint(2,&len))
    80205d4e:	fd040613          	addi	a2,s0,-48
    80205d52:	fdc40593          	addi	a1,s0,-36
    80205d56:	4501                	li	a0,0
    80205d58:	fffff097          	auipc	ra,0xfffff
    80205d5c:	dd0080e7          	jalr	-560(ra) # 80204b28 <argfd>
  {
    return -1;
    80205d60:	57fd                	li	a5,-1
  if(argfd(0,&fd,&f)<0 || argaddr(1,(uint64*)&dirp64)<0 || argint(2,&len))
    80205d62:	08054163          	bltz	a0,80205de4 <sys_getdents64+0xa0>
    80205d66:	fc840593          	addi	a1,s0,-56
    80205d6a:	4505                	li	a0,1
    80205d6c:	ffffd097          	auipc	ra,0xffffd
    80205d70:	45e080e7          	jalr	1118(ra) # 802031ca <argaddr>
    return -1;
    80205d74:	57fd                	li	a5,-1
  if(argfd(0,&fd,&f)<0 || argaddr(1,(uint64*)&dirp64)<0 || argint(2,&len))
    80205d76:	06054763          	bltz	a0,80205de4 <sys_getdents64+0xa0>
    80205d7a:	fd840593          	addi	a1,s0,-40
    80205d7e:	4509                	li	a0,2
    80205d80:	ffffd097          	auipc	ra,0xffffd
    80205d84:	3e8080e7          	jalr	1000(ra) # 80203168 <argint>
    return -1;
    80205d88:	57fd                	li	a5,-1
  if(argfd(0,&fd,&f)<0 || argaddr(1,(uint64*)&dirp64)<0 || argint(2,&len))
    80205d8a:	ed29                	bnez	a0,80205de4 <sys_getdents64+0xa0>
  }
  int filename_len=strlen(f->ep->filename);
    80205d8c:	fd043783          	ld	a5,-48(s0)
    80205d90:	6f88                	ld	a0,24(a5)
    80205d92:	ffffb097          	auipc	ra,0xffffb
    80205d96:	b5a080e7          	jalr	-1190(ra) # 802008ec <strlen>
    80205d9a:	84aa                	mv	s1,a0
  if(filename_len>len)
    80205d9c:	fd842703          	lw	a4,-40(s0)
  {
    return -1;
    80205da0:	57fd                	li	a5,-1
  if(filename_len>len)
    80205da2:	04a74163          	blt	a4,a0,80205de4 <sys_getdents64+0xa0>
  }
  if(f->ep->parent==NULL)   // this direntry is root
    80205da6:	fd043783          	ld	a5,-48(s0)
    80205daa:	6f8c                	ld	a1,24(a5)
    80205dac:	1205b783          	ld	a5,288(a1) # ffffffffffffe120 <kernel_end+0xffffffff7fdbf120>
    80205db0:	c3a1                	beqz	a5,80205df0 <sys_getdents64+0xac>
  {
    if(copyout2((uint64)dirp64->d_name, "/", 1) < 0 ||
      copyout2((uint64)&(dirp64->d_type),(char*)&f->type,sizeof(f->type) < 0 ))
    return -1;
  }
  else if(copyout2((uint64)dirp64->d_name, f->ep->filename, filename_len) < 0 ||
    80205db2:	862a                	mv	a2,a0
    80205db4:	fc843503          	ld	a0,-56(s0)
    80205db8:	054d                	addi	a0,a0,19
    80205dba:	ffffb097          	auipc	ra,0xffffb
    80205dbe:	5c2080e7          	jalr	1474(ra) # 8020137c <copyout2>
        copyout2((uint64)&(dirp64->d_type),(char*)&f->type,sizeof(f->type) < 0 ))
    return -1;
    80205dc2:	57fd                	li	a5,-1
  else if(copyout2((uint64)dirp64->d_name, f->ep->filename, filename_len) < 0 ||
    80205dc4:	02054063          	bltz	a0,80205de4 <sys_getdents64+0xa0>
        copyout2((uint64)&(dirp64->d_type),(char*)&f->type,sizeof(f->type) < 0 ))
    80205dc8:	4601                	li	a2,0
    80205dca:	fd043583          	ld	a1,-48(s0)
    80205dce:	fc843503          	ld	a0,-56(s0)
    80205dd2:	0549                	addi	a0,a0,18
    80205dd4:	ffffb097          	auipc	ra,0xffffb
    80205dd8:	5a8080e7          	jalr	1448(ra) # 8020137c <copyout2>
    return -1;
    80205ddc:	57fd                	li	a5,-1
  else if(copyout2((uint64)dirp64->d_name, f->ep->filename, filename_len) < 0 ||
    80205dde:	e119                	bnez	a0,80205de4 <sys_getdents64+0xa0>

  return filename_len+sizeof(f->type);
    80205de0:	00448793          	addi	a5,s1,4
}
    80205de4:	853e                	mv	a0,a5
    80205de6:	70e2                	ld	ra,56(sp)
    80205de8:	7442                	ld	s0,48(sp)
    80205dea:	74a2                	ld	s1,40(sp)
    80205dec:	6121                	addi	sp,sp,64
    80205dee:	8082                	ret
    if(copyout2((uint64)dirp64->d_name, "/", 1) < 0 ||
    80205df0:	4605                	li	a2,1
    80205df2:	00005597          	auipc	a1,0x5
    80205df6:	83e58593          	addi	a1,a1,-1986 # 8020a630 <digits+0x2b0>
    80205dfa:	fc843503          	ld	a0,-56(s0)
    80205dfe:	054d                	addi	a0,a0,19
    80205e00:	ffffb097          	auipc	ra,0xffffb
    80205e04:	57c080e7          	jalr	1404(ra) # 8020137c <copyout2>
    return -1;
    80205e08:	57fd                	li	a5,-1
    if(copyout2((uint64)dirp64->d_name, "/", 1) < 0 ||
    80205e0a:	fc054de3          	bltz	a0,80205de4 <sys_getdents64+0xa0>
      copyout2((uint64)&(dirp64->d_type),(char*)&f->type,sizeof(f->type) < 0 ))
    80205e0e:	4601                	li	a2,0
    80205e10:	fd043583          	ld	a1,-48(s0)
    80205e14:	fc843503          	ld	a0,-56(s0)
    80205e18:	0549                	addi	a0,a0,18
    80205e1a:	ffffb097          	auipc	ra,0xffffb
    80205e1e:	562080e7          	jalr	1378(ra) # 8020137c <copyout2>
    return -1;
    80205e22:	57fd                	li	a5,-1
    if(copyout2((uint64)dirp64->d_name, "/", 1) < 0 ||
    80205e24:	dd55                	beqz	a0,80205de0 <sys_getdents64+0x9c>
    80205e26:	bf7d                	j	80205de4 <sys_getdents64+0xa0>

0000000080205e28 <sys_fstat_cscc>:
        long st_ctime_nsec;
        unsigned __unused[2];
};
uint64
sys_fstat_cscc(void)
{
    80205e28:	7135                	addi	sp,sp,-160
    80205e2a:	ed06                	sd	ra,152(sp)
    80205e2c:	e922                	sd	s0,144(sp)
    80205e2e:	1100                	addi	s0,sp,160
  struct file* f;
  uint64 addr;
  if(argfd(0,0,&f)<0 || argaddr(1,&addr)<0)
    80205e30:	fe840613          	addi	a2,s0,-24
    80205e34:	4581                	li	a1,0
    80205e36:	4501                	li	a0,0
    80205e38:	fffff097          	auipc	ra,0xfffff
    80205e3c:	cf0080e7          	jalr	-784(ra) # 80204b28 <argfd>
    80205e40:	87aa                	mv	a5,a0
  {
    return -1;
    80205e42:	557d                	li	a0,-1
  if(argfd(0,0,&f)<0 || argaddr(1,&addr)<0)
    80205e44:	0207c263          	bltz	a5,80205e68 <sys_fstat_cscc+0x40>
    80205e48:	fe040593          	addi	a1,s0,-32
    80205e4c:	4505                	li	a0,1
    80205e4e:	ffffd097          	auipc	ra,0xffffd
    80205e52:	37c080e7          	jalr	892(ra) # 802031ca <argaddr>
    80205e56:	08054d63          	bltz	a0,80205ef0 <sys_fstat_cscc+0xc8>
  }

  struct kstat st;
  if(f->type!=FD_ENTRY)
    80205e5a:	fe843783          	ld	a5,-24(s0)
    80205e5e:	4394                	lw	a3,0(a5)
    80205e60:	4709                	li	a4,2
    return -1;
    80205e62:	557d                	li	a0,-1
  if(f->type!=FD_ENTRY)
    80205e64:	00e68663          	beq	a3,a4,80205e70 <sys_fstat_cscc+0x48>
  st.st_ctime_sec=0;
  eunlock(f->ep);
  if((copyout2(addr,(char*)&st,sizeof(struct kstat)))<0)
    return -1;
  return 0;
}
    80205e68:	60ea                	ld	ra,152(sp)
    80205e6a:	644a                	ld	s0,144(sp)
    80205e6c:	610d                	addi	sp,sp,160
    80205e6e:	8082                	ret
  elock(f->ep);
    80205e70:	6f88                	ld	a0,24(a5)
    80205e72:	00001097          	auipc	ra,0x1
    80205e76:	7c0080e7          	jalr	1984(ra) # 80207632 <elock>
  st.st_dev=f->ep->dev;
    80205e7a:	fe843783          	ld	a5,-24(s0)
    80205e7e:	6f98                	ld	a4,24(a5)
    80205e80:	11474703          	lbu	a4,276(a4)
    80205e84:	f6e43023          	sd	a4,-160(s0)
  st.st_ino=0;
    80205e88:	f6043423          	sd	zero,-152(s0)
  st.st_mode=f->type;
    80205e8c:	4398                	lw	a4,0(a5)
    80205e8e:	f6e42823          	sw	a4,-144(s0)
  st.st_nlink=f->ref;
    80205e92:	43d8                	lw	a4,4(a5)
    80205e94:	f6e42a23          	sw	a4,-140(s0)
  st.st_gid=0;
    80205e98:	f6042e23          	sw	zero,-132(s0)
  st.st_uid=0;
    80205e9c:	f6042c23          	sw	zero,-136(s0)
  st.st_rdev=0;
    80205ea0:	f8043023          	sd	zero,-128(s0)
  st.st_size=f->ep->file_size;
    80205ea4:	6f98                	ld	a4,24(a5)
    80205ea6:	10876703          	lwu	a4,264(a4)
    80205eaa:	f8e43823          	sd	a4,-112(s0)
  st.st_blocks=0;
    80205eae:	fa043023          	sd	zero,-96(s0)
  st.st_blksize=0;
    80205eb2:	f8042c23          	sw	zero,-104(s0)
  st.st_atime_sec=0;
    80205eb6:	fa043423          	sd	zero,-88(s0)
  st.st_atime_nsec=0;
    80205eba:	fa043823          	sd	zero,-80(s0)
  st.st_mtime_nsec=0;
    80205ebe:	fc043023          	sd	zero,-64(s0)
  st.st_mtime_sec=0;
    80205ec2:	fa043c23          	sd	zero,-72(s0)
  st.st_ctime_nsec=0;
    80205ec6:	fc043823          	sd	zero,-48(s0)
  st.st_ctime_sec=0;
    80205eca:	fc043423          	sd	zero,-56(s0)
  eunlock(f->ep);
    80205ece:	6f88                	ld	a0,24(a5)
    80205ed0:	00001097          	auipc	ra,0x1
    80205ed4:	798080e7          	jalr	1944(ra) # 80207668 <eunlock>
  if((copyout2(addr,(char*)&st,sizeof(struct kstat)))<0)
    80205ed8:	08000613          	li	a2,128
    80205edc:	f6040593          	addi	a1,s0,-160
    80205ee0:	fe043503          	ld	a0,-32(s0)
    80205ee4:	ffffb097          	auipc	ra,0xffffb
    80205ee8:	498080e7          	jalr	1176(ra) # 8020137c <copyout2>
    80205eec:	957d                	srai	a0,a0,0x3f
    80205eee:	bfad                	j	80205e68 <sys_fstat_cscc+0x40>
    return -1;
    80205ef0:	557d                	li	a0,-1
    80205ef2:	bf9d                	j	80205e68 <sys_fstat_cscc+0x40>

0000000080205ef4 <sys_linkat>:

// lzq link
uint64
sys_linkat(void){
    80205ef4:	1141                	addi	sp,sp,-16
    80205ef6:	e422                	sd	s0,8(sp)
    80205ef8:	0800                	addi	s0,sp,16
//    if(argstr(1, path, FAT32_MAX_PATH) < 0)
//        return -1;
//    if((ep = ename(path)) == NULL)
//        return -1;
    return 0;
}
    80205efa:	4501                	li	a0,0
    80205efc:	6422                	ld	s0,8(sp)
    80205efe:	0141                	addi	sp,sp,16
    80205f00:	8082                	ret

0000000080205f02 <sys_unlink>:
uint64
sys_unlink(void){
    80205f02:	dd010113          	addi	sp,sp,-560
    80205f06:	22113423          	sd	ra,552(sp)
    80205f0a:	22813023          	sd	s0,544(sp)
    80205f0e:	20913c23          	sd	s1,536(sp)
    80205f12:	21213823          	sd	s2,528(sp)
    80205f16:	1c00                	addi	s0,sp,560
    char path[FAT32_MAX_PATH];// file
    char name[FAT32_MAX_FILENAME + 1];//dir name
    struct dirent *ep,*dp;
    if(argstr(1, path, FAT32_MAX_PATH) < 0)
    80205f18:	10400613          	li	a2,260
    80205f1c:	ed840593          	addi	a1,s0,-296
    80205f20:	4505                	li	a0,1
    80205f22:	ffffd097          	auipc	ra,0xffffd
    80205f26:	2ca080e7          	jalr	714(ra) # 802031ec <argstr>
        return -1;
    80205f2a:	57fd                	li	a5,-1
    if(argstr(1, path, FAT32_MAX_PATH) < 0)
    80205f2c:	06054263          	bltz	a0,80205f90 <sys_unlink+0x8e>
    if((ep = ename(path)) == NULL)
    80205f30:	ed840513          	addi	a0,s0,-296
    80205f34:	00002097          	auipc	ra,0x2
    80205f38:	ea8080e7          	jalr	-344(ra) # 80207ddc <ename>
    80205f3c:	84aa                	mv	s1,a0
    80205f3e:	c52d                	beqz	a0,80205fa8 <sys_unlink+0xa6>
        return -1;
    if((dp = enameparent(path, name)) == NULL)
    80205f40:	dd840593          	addi	a1,s0,-552
    80205f44:	ed840513          	addi	a0,s0,-296
    80205f48:	00002097          	auipc	ra,0x2
    80205f4c:	eb2080e7          	jalr	-334(ra) # 80207dfa <enameparent>
    80205f50:	892a                	mv	s2,a0
    80205f52:	cd29                	beqz	a0,80205fac <sys_unlink+0xaa>
        return -1;
    elock(dp);
    80205f54:	00001097          	auipc	ra,0x1
    80205f58:	6de080e7          	jalr	1758(ra) # 80207632 <elock>
    elock(ep);
    80205f5c:	8526                	mv	a0,s1
    80205f5e:	00001097          	auipc	ra,0x1
    80205f62:	6d4080e7          	jalr	1748(ra) # 80207632 <elock>
    eremove(ep);
    80205f66:	8526                	mv	a0,s1
    80205f68:	00001097          	auipc	ra,0x1
    80205f6c:	596080e7          	jalr	1430(ra) # 802074fe <eremove>
    eunlock(ep);
    80205f70:	8526                	mv	a0,s1
    80205f72:	00001097          	auipc	ra,0x1
    80205f76:	6f6080e7          	jalr	1782(ra) # 80207668 <eunlock>
    eunlock(dp);
    80205f7a:	854a                	mv	a0,s2
    80205f7c:	00001097          	auipc	ra,0x1
    80205f80:	6ec080e7          	jalr	1772(ra) # 80207668 <eunlock>
    eput(dp);
    80205f84:	854a                	mv	a0,s2
    80205f86:	00001097          	auipc	ra,0x1
    80205f8a:	730080e7          	jalr	1840(ra) # 802076b6 <eput>
    return 0;
    80205f8e:	4781                	li	a5,0
}
    80205f90:	853e                	mv	a0,a5
    80205f92:	22813083          	ld	ra,552(sp)
    80205f96:	22013403          	ld	s0,544(sp)
    80205f9a:	21813483          	ld	s1,536(sp)
    80205f9e:	21013903          	ld	s2,528(sp)
    80205fa2:	23010113          	addi	sp,sp,560
    80205fa6:	8082                	ret
        return -1;
    80205fa8:	57fd                	li	a5,-1
    80205faa:	b7dd                	j	80205f90 <sys_unlink+0x8e>
        return -1;
    80205fac:	57fd                	li	a5,-1
    80205fae:	b7cd                	j	80205f90 <sys_unlink+0x8e>

0000000080205fb0 <open_dev>:
//    int minor;
    struct file *f;
//    if(omode & O_CREATE){
//        panic("dev file on FAT");
//    }
    if(major < 0 || major >= NDEV)
    80205fb0:	47a5                	li	a5,9
    80205fb2:	06a7e163          	bltu	a5,a0,80206014 <open_dev+0x64>
{
    80205fb6:	7179                	addi	sp,sp,-48
    80205fb8:	f406                	sd	ra,40(sp)
    80205fba:	f022                	sd	s0,32(sp)
    80205fbc:	ec26                	sd	s1,24(sp)
    80205fbe:	e84a                	sd	s2,16(sp)
    80205fc0:	e44e                	sd	s3,8(sp)
    80205fc2:	1800                	addi	s0,sp,48
    80205fc4:	892e                	mv	s2,a1
    80205fc6:	89aa                	mv	s3,a0
        return -1;

    if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80205fc8:	ffffe097          	auipc	ra,0xffffe
    80205fcc:	f9c080e7          	jalr	-100(ra) # 80203f64 <filealloc>
    80205fd0:	84aa                	mv	s1,a0
    80205fd2:	c139                	beqz	a0,80206018 <open_dev+0x68>
    80205fd4:	fffff097          	auipc	ra,0xfffff
    80205fd8:	bbe080e7          	jalr	-1090(ra) # 80204b92 <fdalloc>
    80205fdc:	04054063          	bltz	a0,8020601c <open_dev+0x6c>
        if(f)
            fileclose(f);
        return -1;
    }

    f->type = FD_DEVICE;
    80205fe0:	478d                	li	a5,3
    80205fe2:	c09c                	sw	a5,0(s1)
    f->off = 0;
    80205fe4:	0204a023          	sw	zero,32(s1)
    f->ep = 0;
    80205fe8:	0004bc23          	sd	zero,24(s1)
    f->major = major;
    80205fec:	03349223          	sh	s3,36(s1)
    f->readable = !(omode & O_WRONLY);
    80205ff0:	00194793          	xori	a5,s2,1
    80205ff4:	8b85                	andi	a5,a5,1
    80205ff6:	00f48423          	sb	a5,8(s1)
    f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80205ffa:	00397593          	andi	a1,s2,3
    80205ffe:	00b035b3          	snez	a1,a1
    80206002:	00b484a3          	sb	a1,9(s1)

    return fd;
}
    80206006:	70a2                	ld	ra,40(sp)
    80206008:	7402                	ld	s0,32(sp)
    8020600a:	64e2                	ld	s1,24(sp)
    8020600c:	6942                	ld	s2,16(sp)
    8020600e:	69a2                	ld	s3,8(sp)
    80206010:	6145                	addi	sp,sp,48
    80206012:	8082                	ret
        return -1;
    80206014:	557d                	li	a0,-1
}
    80206016:	8082                	ret
        return -1;
    80206018:	557d                	li	a0,-1
    8020601a:	b7f5                	j	80206006 <open_dev+0x56>
            fileclose(f);
    8020601c:	8526                	mv	a0,s1
    8020601e:	ffffe097          	auipc	ra,0xffffe
    80206022:	002080e7          	jalr	2(ra) # 80204020 <fileclose>
        return -1;
    80206026:	557d                	li	a0,-1
    80206028:	bff9                	j	80206006 <open_dev+0x56>

000000008020602a <sys_mount>:
// test mount 1 /dev/vda2 /mnt
uint64
sys_mount(void)
{
    8020602a:	dd010113          	addi	sp,sp,-560
    8020602e:	22113423          	sd	ra,552(sp)
    80206032:	22813023          	sd	s0,544(sp)
    80206036:	20913c23          	sd	s1,536(sp)
    8020603a:	1c00                	addi	s0,sp,560
    char special[FAT32_MAX_PATH];
    char dir[FAT32_MAX_PATH]; //挂载设备,挂载点,挂载的文件系统类型
    if (argstr(0, special, FAT32_MAX_PATH) < 0 || argstr(1, dir, FAT32_MAX_PATH) < 0)
    8020603c:	10400613          	li	a2,260
    80206040:	ed840593          	addi	a1,s0,-296
    80206044:	4501                	li	a0,0
    80206046:	ffffd097          	auipc	ra,0xffffd
    8020604a:	1a6080e7          	jalr	422(ra) # 802031ec <argstr>
        return -1;
    8020604e:	57fd                	li	a5,-1
    if (argstr(0, special, FAT32_MAX_PATH) < 0 || argstr(1, dir, FAT32_MAX_PATH) < 0)
    80206050:	04054463          	bltz	a0,80206098 <sys_mount+0x6e>
    80206054:	10400613          	li	a2,260
    80206058:	dd040593          	addi	a1,s0,-560
    8020605c:	4505                	li	a0,1
    8020605e:	ffffd097          	auipc	ra,0xffffd
    80206062:	18e080e7          	jalr	398(ra) # 802031ec <argstr>
        return -1;
    80206066:	57fd                	li	a5,-1
    if (argstr(0, special, FAT32_MAX_PATH) < 0 || argstr(1, dir, FAT32_MAX_PATH) < 0)
    80206068:	02054863          	bltz	a0,80206098 <sys_mount+0x6e>
    //fstype， flags挂载参数， data传递给文件系统的字符串参数，可为NULL；

    //建立目标文件夹
    struct dirent * dp, *devp;
    dp = create(dir, T_DIR, O_CREATE);
    8020606c:	24000613          	li	a2,576
    80206070:	4585                	li	a1,1
    80206072:	dd040513          	addi	a0,s0,-560
    80206076:	fffff097          	auipc	ra,0xfffff
    8020607a:	b60080e7          	jalr	-1184(ra) # 80204bd6 <create>
    8020607e:	84aa                	mv	s1,a0
    if (dp == NULL || dp->attribute != ATTR_DIRECTORY) {
    80206080:	c511                	beqz	a0,8020608c <sys_mount+0x62>
    80206082:	10054703          	lbu	a4,256(a0)
    80206086:	47c1                	li	a5,16
    80206088:	02f70263          	beq	a4,a5,802060ac <sys_mount+0x82>
        eput(dp); // 指定的挂载点不存在或者不是目录
    8020608c:	8526                	mv	a0,s1
    8020608e:	00001097          	auipc	ra,0x1
    80206092:	628080e7          	jalr	1576(ra) # 802076b6 <eput>
        return -1;
    80206096:	57fd                	li	a5,-1
        return -1;
    dp->dev = dev;
    dp->parent = dp;
    dp->valid = 1;
    return 0;
}
    80206098:	853e                	mv	a0,a5
    8020609a:	22813083          	ld	ra,552(sp)
    8020609e:	22013403          	ld	s0,544(sp)
    802060a2:	21813483          	ld	s1,536(sp)
    802060a6:	23010113          	addi	sp,sp,560
    802060aa:	8082                	ret
    devp = ename(special);
    802060ac:	ed840513          	addi	a0,s0,-296
    802060b0:	00002097          	auipc	ra,0x2
    802060b4:	d2c080e7          	jalr	-724(ra) # 80207ddc <ename>
    int dev = open_dev(major, O_RDWR); //用作设备号(fd)
    802060b8:	4589                	li	a1,2
    802060ba:	11454503          	lbu	a0,276(a0)
    802060be:	00000097          	auipc	ra,0x0
    802060c2:	ef2080e7          	jalr	-270(ra) # 80205fb0 <open_dev>
    if (dev < 0)
    802060c6:	02051793          	slli	a5,a0,0x20
    802060ca:	0007cb63          	bltz	a5,802060e0 <sys_mount+0xb6>
    dp->dev = dev;
    802060ce:	10a48a23          	sb	a0,276(s1)
    dp->parent = dp;
    802060d2:	1294b023          	sd	s1,288(s1)
    dp->valid = 1;
    802060d6:	4785                	li	a5,1
    802060d8:	10f49b23          	sh	a5,278(s1)
    return 0;
    802060dc:	4781                	li	a5,0
    802060de:	bf6d                	j	80206098 <sys_mount+0x6e>
        return -1;
    802060e0:	57fd                	li	a5,-1
    802060e2:	bf5d                	j	80206098 <sys_mount+0x6e>

00000000802060e4 <sys_umount2>:
uint64
sys_umount2(void)
{
    802060e4:	1141                	addi	sp,sp,-16
    802060e6:	e422                	sd	s0,8(sp)
    802060e8:	0800                	addi	s0,sp,16
  return 0;
}
    802060ea:	4501                	li	a0,0
    802060ec:	6422                	ld	s0,8(sp)
    802060ee:	0141                	addi	sp,sp,16
    802060f0:	8082                	ret

00000000802060f2 <sys_mmap>:

// added by lmq for SYS_mmap
uint64
sys_mmap(void)
{
    802060f2:	7139                	addi	sp,sp,-64
    802060f4:	fc06                	sd	ra,56(sp)
    802060f6:	f822                	sd	s0,48(sp)
    802060f8:	f426                	sd	s1,40(sp)
    802060fa:	0080                	addi	s0,sp,64
  int prot;       // 映射的内存保护方式，可取：PROT_EXEC, PROT_READ, PROT_WRITE, PROT_NONE
  int flags;      // 映射是否与其他进程共享的标志，
  int fd;         // 被映射的文件句柄，
  int off;        // 文件偏移量；
  
  if(argaddr(0, &addr) < 0 || argint(1, &len) < 0 || argint(2, &prot) < 0 ||
    802060fc:	fd840593          	addi	a1,s0,-40
    80206100:	4501                	li	a0,0
    80206102:	ffffd097          	auipc	ra,0xffffd
    80206106:	0c8080e7          	jalr	200(ra) # 802031ca <argaddr>
    8020610a:	16054263          	bltz	a0,8020626e <sys_mmap+0x17c>
    8020610e:	fd440593          	addi	a1,s0,-44
    80206112:	4505                	li	a0,1
    80206114:	ffffd097          	auipc	ra,0xffffd
    80206118:	054080e7          	jalr	84(ra) # 80203168 <argint>
    8020611c:	14054f63          	bltz	a0,8020627a <sys_mmap+0x188>
    80206120:	fd040593          	addi	a1,s0,-48
    80206124:	4509                	li	a0,2
    80206126:	ffffd097          	auipc	ra,0xffffd
    8020612a:	042080e7          	jalr	66(ra) # 80203168 <argint>
    8020612e:	14054863          	bltz	a0,8020627e <sys_mmap+0x18c>
      argint(3, &flags) < 0 || argint(4, &fd) < 0 || argint(5, &off) < 0)
    80206132:	fcc40593          	addi	a1,s0,-52
    80206136:	450d                	li	a0,3
    80206138:	ffffd097          	auipc	ra,0xffffd
    8020613c:	030080e7          	jalr	48(ra) # 80203168 <argint>
  if(argaddr(0, &addr) < 0 || argint(1, &len) < 0 || argint(2, &prot) < 0 ||
    80206140:	14054163          	bltz	a0,80206282 <sys_mmap+0x190>
      argint(3, &flags) < 0 || argint(4, &fd) < 0 || argint(5, &off) < 0)
    80206144:	fc840593          	addi	a1,s0,-56
    80206148:	4511                	li	a0,4
    8020614a:	ffffd097          	auipc	ra,0xffffd
    8020614e:	01e080e7          	jalr	30(ra) # 80203168 <argint>
    80206152:	12054a63          	bltz	a0,80206286 <sys_mmap+0x194>
    80206156:	fc440593          	addi	a1,s0,-60
    8020615a:	4515                	li	a0,5
    8020615c:	ffffd097          	auipc	ra,0xffffd
    80206160:	00c080e7          	jalr	12(ra) # 80203168 <argint>
    80206164:	12054363          	bltz	a0,8020628a <sys_mmap+0x198>
      return -1;
  
  
  struct proc* p=myproc();
    80206168:	ffffc097          	auipc	ra,0xffffc
    8020616c:	8f8080e7          	jalr	-1800(ra) # 80201a60 <myproc>
    80206170:	85aa                	mv	a1,a0
  struct file* f=p->ofile[fd];
    80206172:	fc842783          	lw	a5,-56(s0)
    80206176:	07e9                	addi	a5,a5,26
    80206178:	078e                	slli	a5,a5,0x3
    8020617a:	97aa                	add	a5,a5,a0
    8020617c:	6788                	ld	a0,8(a5)
  // 检查权限是否非法
  if(!f->writable && (prot&PROT_WRITE) && !(flags & MAP_PRIVATE)) 
    8020617e:	00954783          	lbu	a5,9(a0)
    80206182:	eb89                	bnez	a5,80206194 <sys_mmap+0xa2>
    80206184:	fd042783          	lw	a5,-48(s0)
    80206188:	8b89                	andi	a5,a5,2
    8020618a:	c789                	beqz	a5,80206194 <sys_mmap+0xa2>
    8020618c:	fcc42783          	lw	a5,-52(s0)
    80206190:	8b89                	andi	a5,a5,2
    80206192:	cb9d                	beqz	a5,802061c8 <sys_mmap+0xd6>
    panic("mmap: prot illegal");
  if(!f->readable && (prot&PROT_READ))
    80206194:	00854783          	lbu	a5,8(a0)
    80206198:	e789                	bnez	a5,802061a2 <sys_mmap+0xb0>
    8020619a:	fd042783          	lw	a5,-48(s0)
    8020619e:	8b85                	andi	a5,a5,1
    802061a0:	ef85                	bnez	a5,802061d8 <sys_mmap+0xe6>
    802061a2:	4f858713          	addi	a4,a1,1272
{
    802061a6:	4781                	li	a5,0
    panic("mmap: prot illegal");

  int available_vma_idx=-1;
  for(int i=0;i<VMA_MAX;i++)
    802061a8:	4641                	li	a2,16
  {
    if(p->vma[i].valid==0)
    802061aa:	4314                	lw	a3,0(a4)
    802061ac:	ce95                	beqz	a3,802061e8 <sys_mmap+0xf6>
  for(int i=0;i<VMA_MAX;i++)
    802061ae:	2785                	addiw	a5,a5,1
    802061b0:	03070713          	addi	a4,a4,48
    802061b4:	fec79be3          	bne	a5,a2,802061aa <sys_mmap+0xb8>
      available_vma_idx=i;
      break;
    }
  }
  if(available_vma_idx==-1)
    panic("do not have enough vma\n");
    802061b8:	00005517          	auipc	a0,0x5
    802061bc:	b9850513          	addi	a0,a0,-1128 # 8020ad50 <digits+0x9d0>
    802061c0:	ffffa097          	auipc	ra,0xffffa
    802061c4:	f82080e7          	jalr	-126(ra) # 80200142 <panic>
    panic("mmap: prot illegal");
    802061c8:	00005517          	auipc	a0,0x5
    802061cc:	b7050513          	addi	a0,a0,-1168 # 8020ad38 <digits+0x9b8>
    802061d0:	ffffa097          	auipc	ra,0xffffa
    802061d4:	f72080e7          	jalr	-142(ra) # 80200142 <panic>
    panic("mmap: prot illegal");
    802061d8:	00005517          	auipc	a0,0x5
    802061dc:	b6050513          	addi	a0,a0,-1184 # 8020ad38 <digits+0x9b8>
    802061e0:	ffffa097          	auipc	ra,0xffffa
    802061e4:	f62080e7          	jalr	-158(ra) # 80200142 <panic>
  if(available_vma_idx==-1)
    802061e8:	577d                	li	a4,-1
    802061ea:	fce787e3          	beq	a5,a4,802061b8 <sys_mmap+0xc6>
  struct VMA* v=p->vma+available_vma_idx;
    802061ee:	4f858493          	addi	s1,a1,1272
    802061f2:	00179713          	slli	a4,a5,0x1
    802061f6:	97ba                	add	a5,a5,a4
    802061f8:	0792                	slli	a5,a5,0x4
    802061fa:	94be                	add	s1,s1,a5

  v->valid=1;                       // 有效位
    802061fc:	4785                	li	a5,1
    802061fe:	c09c                	sw	a5,0(s1)
  v->len=len;                       // 映射长度
    80206200:	fd442783          	lw	a5,-44(s0)
    80206204:	c89c                	sw	a5,16(s1)
  p->maxaddr-=PGROUNDUP(len);
    80206206:	6705                	lui	a4,0x1
    80206208:	377d                	addiw	a4,a4,-1
    8020620a:	9fb9                	addw	a5,a5,a4
    8020620c:	777d                	lui	a4,0xfffff
    8020620e:	8ff9                	and	a5,a5,a4
    80206210:	2781                	sext.w	a5,a5
    80206212:	7f85b703          	ld	a4,2040(a1)
    80206216:	40f707b3          	sub	a5,a4,a5
    8020621a:	7ef5bc23          	sd	a5,2040(a1)
  v->addr=p->maxaddr;               // 虚拟内存的虚拟地址
    8020621e:	e49c                	sd	a5,8(s1)
  v->prot=0;                        // 权限 可读/可写/可读可写
    80206220:	0004aa23          	sw	zero,20(s1)
  if(prot & PROT_READ)
    80206224:	fd042783          	lw	a5,-48(s0)
    80206228:	0017f713          	andi	a4,a5,1
    8020622c:	c319                	beqz	a4,80206232 <sys_mmap+0x140>
    v->prot |= PTE_R;
    8020622e:	4709                	li	a4,2
    80206230:	c8d8                	sw	a4,20(s1)
  if(prot & PROT_WRITE)
    80206232:	0027f713          	andi	a4,a5,2
    80206236:	c709                	beqz	a4,80206240 <sys_mmap+0x14e>
    v->prot |= PTE_W;
    80206238:	48d8                	lw	a4,20(s1)
    8020623a:	00476713          	ori	a4,a4,4
    8020623e:	c8d8                	sw	a4,20(s1)
  if(prot & PROT_EXEC)
    80206240:	8b91                	andi	a5,a5,4
    80206242:	c789                	beqz	a5,8020624c <sys_mmap+0x15a>
    v->prot |= PTE_X;
    80206244:	48dc                	lw	a5,20(s1)
    80206246:	0087e793          	ori	a5,a5,8
    8020624a:	c8dc                	sw	a5,20(s1)
  v->prot |= (PTE_V | PTE_U);                
    8020624c:	48dc                	lw	a5,20(s1)
    8020624e:	0117e793          	ori	a5,a5,17
    80206252:	c8dc                	sw	a5,20(s1)
  v->flags=flags;                   // 标志位 共享/私有
    80206254:	fcc42783          	lw	a5,-52(s0)
    80206258:	cc9c                	sw	a5,24(s1)
  v->off=off;                       // 文件偏移量
    8020625a:	fc442783          	lw	a5,-60(s0)
    8020625e:	ccdc                	sw	a5,28(s1)
  v->f=f;                           // 文件描述符
    80206260:	f088                	sd	a0,32(s1)
  filedup(f);                       // 增加文件引用计数
    80206262:	ffffe097          	auipc	ra,0xffffe
    80206266:	d6c080e7          	jalr	-660(ra) # 80203fce <filedup>
  // memset((void*)pa,0,PGSIZE);
  // if(mappages(p->pagetable, v->addr, PGSIZE, pa, PTE_V | PTE_U | PTE_A | PTE_W | PTE_R | PTE_D) != 0)
  //   panic("mmap: mappages user pagetable error\n");
  // eread(v->f->ep,1,v->addr,v->off,v->len);

  return v->addr;
    8020626a:	6488                	ld	a0,8(s1)
    8020626c:	a011                	j	80206270 <sys_mmap+0x17e>
      return -1;
    8020626e:	557d                	li	a0,-1
}
    80206270:	70e2                	ld	ra,56(sp)
    80206272:	7442                	ld	s0,48(sp)
    80206274:	74a2                	ld	s1,40(sp)
    80206276:	6121                	addi	sp,sp,64
    80206278:	8082                	ret
      return -1;
    8020627a:	557d                	li	a0,-1
    8020627c:	bfd5                	j	80206270 <sys_mmap+0x17e>
    8020627e:	557d                	li	a0,-1
    80206280:	bfc5                	j	80206270 <sys_mmap+0x17e>
    80206282:	557d                	li	a0,-1
    80206284:	b7f5                	j	80206270 <sys_mmap+0x17e>
    80206286:	557d                	li	a0,-1
    80206288:	b7e5                	j	80206270 <sys_mmap+0x17e>
    8020628a:	557d                	li	a0,-1
    8020628c:	b7d5                	j	80206270 <sys_mmap+0x17e>

000000008020628e <sys_munmap>:

// added by lmq for SYS_munmap
uint64
sys_munmap(void)
{
    8020628e:	7179                	addi	sp,sp,-48
    80206290:	f406                	sd	ra,40(sp)
    80206292:	f022                	sd	s0,32(sp)
    80206294:	ec26                	sd	s1,24(sp)
    80206296:	e84a                	sd	s2,16(sp)
    80206298:	1800                	addi	s0,sp,48
  uint64 addr;
  int len;
  if(argaddr(0, &addr) < 0 || argint(1, &len) < 0)
    8020629a:	fd840593          	addi	a1,s0,-40
    8020629e:	4501                	li	a0,0
    802062a0:	ffffd097          	auipc	ra,0xffffd
    802062a4:	f2a080e7          	jalr	-214(ra) # 802031ca <argaddr>
    802062a8:	0a054e63          	bltz	a0,80206364 <sys_munmap+0xd6>
    802062ac:	fd440593          	addi	a1,s0,-44
    802062b0:	4505                	li	a0,1
    802062b2:	ffffd097          	auipc	ra,0xffffd
    802062b6:	eb6080e7          	jalr	-330(ra) # 80203168 <argint>
    802062ba:	0a054763          	bltz	a0,80206368 <sys_munmap+0xda>
    return -1;
  struct proc* p=myproc();
    802062be:	ffffb097          	auipc	ra,0xffffb
    802062c2:	7a2080e7          	jalr	1954(ra) # 80201a60 <myproc>
    802062c6:	892a                	mv	s2,a0
  struct VMA* v=0;
  for(int i=0;i<VMA_MAX;i++)
  {
    if(p->vma[i].valid && p->vma[i].addr==addr)
    802062c8:	fd843583          	ld	a1,-40(s0)
    802062cc:	4f850793          	addi	a5,a0,1272
    802062d0:	7f850613          	addi	a2,a0,2040
  struct VMA* v=0;
    802062d4:	4481                	li	s1,0
    802062d6:	a029                	j	802062e0 <sys_munmap+0x52>
  for(int i=0;i<VMA_MAX;i++)
    802062d8:	03078793          	addi	a5,a5,48
    802062dc:	00c78963          	beq	a5,a2,802062ee <sys_munmap+0x60>
    if(p->vma[i].valid && p->vma[i].addr==addr)
    802062e0:	4398                	lw	a4,0(a5)
    802062e2:	db7d                	beqz	a4,802062d8 <sys_munmap+0x4a>
    802062e4:	6798                	ld	a4,8(a5)
    802062e6:	feb719e3          	bne	a4,a1,802062d8 <sys_munmap+0x4a>
    {
      v=p->vma+i;
    802062ea:	84be                	mv	s1,a5
    802062ec:	b7f5                	j	802062d8 <sys_munmap+0x4a>
    }
  }
  if(!v)
    802062ee:	c8a1                	beqz	s1,8020633e <sys_munmap+0xb0>
    panic("munmap: wrong!can not find the vma\n");
  
  if(walkaddr(p->pagetable,v->addr)!=0)
    802062f0:	648c                	ld	a1,8(s1)
    802062f2:	05093503          	ld	a0,80(s2)
    802062f6:	ffffb097          	auipc	ra,0xffffb
    802062fa:	8c6080e7          	jalr	-1850(ra) # 80200bbc <walkaddr>
    802062fe:	c115                	beqz	a0,80206322 <sys_munmap+0x94>
  {
    if( v->flags & MAP_SHARED )
    80206300:	4c9c                	lw	a5,24(s1)
    80206302:	8b85                	andi	a5,a5,1
    80206304:	e7a9                	bnez	a5,8020634e <sys_munmap+0xc0>
      ewrite(v->f->ep, 1, v->addr, v->off, v->len);                  // 写回文件
    vmunmap( p->pagetable , v->addr , PGROUNDUP(v->len)/PGSIZE , 1 );   //unmap
    80206306:	4890                	lw	a2,16(s1)
    80206308:	6785                	lui	a5,0x1
    8020630a:	37fd                	addiw	a5,a5,-1
    8020630c:	9e3d                	addw	a2,a2,a5
    8020630e:	4685                	li	a3,1
    80206310:	40c6561b          	sraiw	a2,a2,0xc
    80206314:	648c                	ld	a1,8(s1)
    80206316:	05093503          	ld	a0,80(s2)
    8020631a:	ffffb097          	auipc	ra,0xffffb
    8020631e:	b16080e7          	jalr	-1258(ra) # 80200e30 <vmunmap>
  }

  fileclose(v->f);
    80206322:	7088                	ld	a0,32(s1)
    80206324:	ffffe097          	auipc	ra,0xffffe
    80206328:	cfc080e7          	jalr	-772(ra) # 80204020 <fileclose>
  v->valid=0;
    8020632c:	0004a023          	sw	zero,0(s1)
  return 0;
    80206330:	4501                	li	a0,0
}
    80206332:	70a2                	ld	ra,40(sp)
    80206334:	7402                	ld	s0,32(sp)
    80206336:	64e2                	ld	s1,24(sp)
    80206338:	6942                	ld	s2,16(sp)
    8020633a:	6145                	addi	sp,sp,48
    8020633c:	8082                	ret
    panic("munmap: wrong!can not find the vma\n");
    8020633e:	00005517          	auipc	a0,0x5
    80206342:	a2a50513          	addi	a0,a0,-1494 # 8020ad68 <digits+0x9e8>
    80206346:	ffffa097          	auipc	ra,0xffffa
    8020634a:	dfc080e7          	jalr	-516(ra) # 80200142 <panic>
      ewrite(v->f->ep, 1, v->addr, v->off, v->len);                  // 写回文件
    8020634e:	709c                	ld	a5,32(s1)
    80206350:	4898                	lw	a4,16(s1)
    80206352:	4cd4                	lw	a3,28(s1)
    80206354:	6490                	ld	a2,8(s1)
    80206356:	4585                	li	a1,1
    80206358:	6f88                	ld	a0,24(a5)
    8020635a:	00001097          	auipc	ra,0x1
    8020635e:	ae6080e7          	jalr	-1306(ra) # 80206e40 <ewrite>
    80206362:	b755                	j	80206306 <sys_munmap+0x78>
    return -1;
    80206364:	557d                	li	a0,-1
    80206366:	b7f1                	j	80206332 <sys_munmap+0xa4>
    80206368:	557d                	li	a0,-1
    8020636a:	b7e1                	j	80206332 <sys_munmap+0xa4>
    8020636c:	0000                	unimp
	...

0000000080206370 <kernelvec>:
    80206370:	7111                	addi	sp,sp,-256
    80206372:	e006                	sd	ra,0(sp)
    80206374:	e40a                	sd	sp,8(sp)
    80206376:	e80e                	sd	gp,16(sp)
    80206378:	ec12                	sd	tp,24(sp)
    8020637a:	f016                	sd	t0,32(sp)
    8020637c:	f41a                	sd	t1,40(sp)
    8020637e:	f81e                	sd	t2,48(sp)
    80206380:	fc22                	sd	s0,56(sp)
    80206382:	e0a6                	sd	s1,64(sp)
    80206384:	e4aa                	sd	a0,72(sp)
    80206386:	e8ae                	sd	a1,80(sp)
    80206388:	ecb2                	sd	a2,88(sp)
    8020638a:	f0b6                	sd	a3,96(sp)
    8020638c:	f4ba                	sd	a4,104(sp)
    8020638e:	f8be                	sd	a5,112(sp)
    80206390:	fcc2                	sd	a6,120(sp)
    80206392:	e146                	sd	a7,128(sp)
    80206394:	e54a                	sd	s2,136(sp)
    80206396:	e94e                	sd	s3,144(sp)
    80206398:	ed52                	sd	s4,152(sp)
    8020639a:	f156                	sd	s5,160(sp)
    8020639c:	f55a                	sd	s6,168(sp)
    8020639e:	f95e                	sd	s7,176(sp)
    802063a0:	fd62                	sd	s8,184(sp)
    802063a2:	e1e6                	sd	s9,192(sp)
    802063a4:	e5ea                	sd	s10,200(sp)
    802063a6:	e9ee                	sd	s11,208(sp)
    802063a8:	edf2                	sd	t3,216(sp)
    802063aa:	f1f6                	sd	t4,224(sp)
    802063ac:	f5fa                	sd	t5,232(sp)
    802063ae:	f9fe                	sd	t6,240(sp)
    802063b0:	93bfc0ef          	jal	ra,80202cea <kerneltrap>
    802063b4:	6082                	ld	ra,0(sp)
    802063b6:	6122                	ld	sp,8(sp)
    802063b8:	61c2                	ld	gp,16(sp)
    802063ba:	7282                	ld	t0,32(sp)
    802063bc:	7322                	ld	t1,40(sp)
    802063be:	73c2                	ld	t2,48(sp)
    802063c0:	7462                	ld	s0,56(sp)
    802063c2:	6486                	ld	s1,64(sp)
    802063c4:	6526                	ld	a0,72(sp)
    802063c6:	65c6                	ld	a1,80(sp)
    802063c8:	6666                	ld	a2,88(sp)
    802063ca:	7686                	ld	a3,96(sp)
    802063cc:	7726                	ld	a4,104(sp)
    802063ce:	77c6                	ld	a5,112(sp)
    802063d0:	7866                	ld	a6,120(sp)
    802063d2:	688a                	ld	a7,128(sp)
    802063d4:	692a                	ld	s2,136(sp)
    802063d6:	69ca                	ld	s3,144(sp)
    802063d8:	6a6a                	ld	s4,152(sp)
    802063da:	7a8a                	ld	s5,160(sp)
    802063dc:	7b2a                	ld	s6,168(sp)
    802063de:	7bca                	ld	s7,176(sp)
    802063e0:	7c6a                	ld	s8,184(sp)
    802063e2:	6c8e                	ld	s9,192(sp)
    802063e4:	6d2e                	ld	s10,200(sp)
    802063e6:	6dce                	ld	s11,208(sp)
    802063e8:	6e6e                	ld	t3,216(sp)
    802063ea:	7e8e                	ld	t4,224(sp)
    802063ec:	7f2e                	ld	t5,232(sp)
    802063ee:	7fce                	ld	t6,240(sp)
    802063f0:	6111                	addi	sp,sp,256
    802063f2:	10200073          	sret
	...

00000000802063fe <timerinit>:
#include "include/proc.h"

struct spinlock tickslock;
uint ticks;

void timerinit() {
    802063fe:	1141                	addi	sp,sp,-16
    80206400:	e406                	sd	ra,8(sp)
    80206402:	e022                	sd	s0,0(sp)
    80206404:	0800                	addi	s0,sp,16
    initlock(&tickslock, "time");
    80206406:	00005597          	auipc	a1,0x5
    8020640a:	98a58593          	addi	a1,a1,-1654 # 8020ad90 <digits+0xa10>
    8020640e:	00030517          	auipc	a0,0x30
    80206412:	aea50513          	addi	a0,a0,-1302 # 80235ef8 <tickslock>
    80206416:	ffffa097          	auipc	ra,0xffffa
    8020641a:	26e080e7          	jalr	622(ra) # 80200684 <initlock>
    #ifdef DEBUG
    printf("timerinit\n");
    #endif
}
    8020641e:	60a2                	ld	ra,8(sp)
    80206420:	6402                	ld	s0,0(sp)
    80206422:	0141                	addi	sp,sp,16
    80206424:	8082                	ret

0000000080206426 <set_next_timeout>:

void
set_next_timeout() {
    80206426:	1141                	addi	sp,sp,-16
    80206428:	e422                	sd	s0,8(sp)
    8020642a:	0800                	addi	s0,sp,16
  asm volatile("rdtime %0" : "=r" (x) );
    8020642c:	c0102573          	rdtime	a0
    // if comment the `printf` line below
    // the timer will not work.

    // this bug seems to disappear automatically
    // printf("");
    sbi_set_timer(r_time() + INTERVAL);
    80206430:	0007a7b7          	lui	a5,0x7a
    80206434:	12078793          	addi	a5,a5,288 # 7a120 <_entry-0x80185ee0>
    80206438:	953e                	add	a0,a0,a5
	SBI_CALL_1(SBI_SET_TIMER, stime_value);
    8020643a:	4581                	li	a1,0
    8020643c:	4601                	li	a2,0
    8020643e:	4681                	li	a3,0
    80206440:	4881                	li	a7,0
    80206442:	00000073          	ecall
}
    80206446:	6422                	ld	s0,8(sp)
    80206448:	0141                	addi	sp,sp,16
    8020644a:	8082                	ret

000000008020644c <timer_tick>:

void timer_tick() {
    8020644c:	1101                	addi	sp,sp,-32
    8020644e:	ec06                	sd	ra,24(sp)
    80206450:	e822                	sd	s0,16(sp)
    80206452:	e426                	sd	s1,8(sp)
    80206454:	1000                	addi	s0,sp,32
    acquire(&tickslock);
    80206456:	00030497          	auipc	s1,0x30
    8020645a:	aa248493          	addi	s1,s1,-1374 # 80235ef8 <tickslock>
    8020645e:	8526                	mv	a0,s1
    80206460:	ffffa097          	auipc	ra,0xffffa
    80206464:	268080e7          	jalr	616(ra) # 802006c8 <acquire>
    ticks++;
    80206468:	4c9c                	lw	a5,24(s1)
    8020646a:	2785                	addiw	a5,a5,1
    8020646c:	cc9c                	sw	a5,24(s1)
    wakeup(&ticks);
    8020646e:	00030517          	auipc	a0,0x30
    80206472:	aa250513          	addi	a0,a0,-1374 # 80235f10 <ticks>
    80206476:	ffffc097          	auipc	ra,0xffffc
    8020647a:	004080e7          	jalr	4(ra) # 8020247a <wakeup>
    release(&tickslock);
    8020647e:	8526                	mv	a0,s1
    80206480:	ffffa097          	auipc	ra,0xffffa
    80206484:	29c080e7          	jalr	668(ra) # 8020071c <release>
    set_next_timeout();
    80206488:	00000097          	auipc	ra,0x0
    8020648c:	f9e080e7          	jalr	-98(ra) # 80206426 <set_next_timeout>
}
    80206490:	60e2                	ld	ra,24(sp)
    80206492:	6442                	ld	s0,16(sp)
    80206494:	64a2                	ld	s1,8(sp)
    80206496:	6105                	addi	sp,sp,32
    80206498:	8082                	ret

000000008020649a <disk_init>:
#else
#include "include/virtio.h"
#endif 

void disk_init(void)
{
    8020649a:	1141                	addi	sp,sp,-16
    8020649c:	e406                	sd	ra,8(sp)
    8020649e:	e022                	sd	s0,0(sp)
    802064a0:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_init();
    802064a2:	00002097          	auipc	ra,0x2
    802064a6:	ee4080e7          	jalr	-284(ra) # 80208386 <virtio_disk_init>
	#else 
	sdcard_init();
    #endif
}
    802064aa:	60a2                	ld	ra,8(sp)
    802064ac:	6402                	ld	s0,0(sp)
    802064ae:	0141                	addi	sp,sp,16
    802064b0:	8082                	ret

00000000802064b2 <disk_read>:

void disk_read(struct buf *b)
{
    802064b2:	1141                	addi	sp,sp,-16
    802064b4:	e406                	sd	ra,8(sp)
    802064b6:	e022                	sd	s0,0(sp)
    802064b8:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 0);
    802064ba:	4581                	li	a1,0
    802064bc:	00002097          	auipc	ra,0x2
    802064c0:	052080e7          	jalr	82(ra) # 8020850e <virtio_disk_rw>
    #else 
	sdcard_read_sector(b->data, b->sectorno);
	#endif
}
    802064c4:	60a2                	ld	ra,8(sp)
    802064c6:	6402                	ld	s0,0(sp)
    802064c8:	0141                	addi	sp,sp,16
    802064ca:	8082                	ret

00000000802064cc <disk_write>:

void disk_write(struct buf *b)
{
    802064cc:	1141                	addi	sp,sp,-16
    802064ce:	e406                	sd	ra,8(sp)
    802064d0:	e022                	sd	s0,0(sp)
    802064d2:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 1);
    802064d4:	4585                	li	a1,1
    802064d6:	00002097          	auipc	ra,0x2
    802064da:	038080e7          	jalr	56(ra) # 8020850e <virtio_disk_rw>
    #else 
	sdcard_write_sector(b->data, b->sectorno);
	#endif
}
    802064de:	60a2                	ld	ra,8(sp)
    802064e0:	6402                	ld	s0,0(sp)
    802064e2:	0141                	addi	sp,sp,16
    802064e4:	8082                	ret

00000000802064e6 <disk_intr>:

void disk_intr(void)
{
    802064e6:	1141                	addi	sp,sp,-16
    802064e8:	e406                	sd	ra,8(sp)
    802064ea:	e022                	sd	s0,0(sp)
    802064ec:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_intr();
    802064ee:	00002097          	auipc	ra,0x2
    802064f2:	2ce080e7          	jalr	718(ra) # 802087bc <virtio_disk_intr>
    #else 
    dmac_intr(DMAC_CHANNEL0);
    #endif
}
    802064f6:	60a2                	ld	ra,8(sp)
    802064f8:	6402                	ld	s0,0(sp)
    802064fa:	0141                	addi	sp,sp,16
    802064fc:	8082                	ret

00000000802064fe <read_fat>:
/**
 * Read the FAT table content corresponded to the given cluster number.
 * @param   cluster     the number of cluster which you want to read its content in FAT table
 */
static uint32 read_fat(uint32 cluster)
{
    802064fe:	1101                	addi	sp,sp,-32
    80206500:	ec06                	sd	ra,24(sp)
    80206502:	e822                	sd	s0,16(sp)
    80206504:	e426                	sd	s1,8(sp)
    80206506:	e04a                	sd	s2,0(sp)
    80206508:	1000                	addi	s0,sp,32
    if (cluster >= FAT32_EOC) {
    8020650a:	100007b7          	lui	a5,0x10000
    8020650e:	17dd                	addi	a5,a5,-9
        return cluster;
    80206510:	84aa                	mv	s1,a0
    if (cluster >= FAT32_EOC) {
    80206512:	00a7ea63          	bltu	a5,a0,80206526 <read_fat+0x28>
    }
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80206516:	00030797          	auipc	a5,0x30
    8020651a:	a0a7a783          	lw	a5,-1526(a5) # 80235f20 <fat+0x8>
    8020651e:	2785                	addiw	a5,a5,1
        return 0;
    80206520:	4481                	li	s1,0
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80206522:	00a7f963          	bgeu	a5,a0,80206534 <read_fat+0x36>
    // here should be a cache layer for FAT table, but not implemented yet.
    struct buf *b = bread(0, fat_sec);
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    brelse(b);
    return next_clus;
}
    80206526:	8526                	mv	a0,s1
    80206528:	60e2                	ld	ra,24(sp)
    8020652a:	6442                	ld	s0,16(sp)
    8020652c:	64a2                	ld	s1,8(sp)
    8020652e:	6902                	ld	s2,0(sp)
    80206530:	6105                	addi	sp,sp,32
    80206532:	8082                	ret
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80206534:	0025149b          	slliw	s1,a0,0x2
    80206538:	00030917          	auipc	s2,0x30
    8020653c:	9e090913          	addi	s2,s2,-1568 # 80235f18 <fat>
    80206540:	01095783          	lhu	a5,16(s2)
    80206544:	02f4d7bb          	divuw	a5,s1,a5
    80206548:	01495583          	lhu	a1,20(s2)
    struct buf *b = bread(0, fat_sec);
    8020654c:	9dbd                	addw	a1,a1,a5
    8020654e:	4501                	li	a0,0
    80206550:	ffffd097          	auipc	ra,0xffffd
    80206554:	650080e7          	jalr	1616(ra) # 80203ba0 <bread>
    return (cluster << 2) % fat.bpb.byts_per_sec;
    80206558:	01095783          	lhu	a5,16(s2)
    8020655c:	02f4f4bb          	remuw	s1,s1,a5
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    80206560:	1482                	slli	s1,s1,0x20
    80206562:	9081                	srli	s1,s1,0x20
    80206564:	94aa                	add	s1,s1,a0
    80206566:	4ca4                	lw	s1,88(s1)
    brelse(b);
    80206568:	ffffd097          	auipc	ra,0xffffd
    8020656c:	764080e7          	jalr	1892(ra) # 80203ccc <brelse>
    return next_clus;
    80206570:	bf5d                	j	80206526 <read_fat+0x28>

0000000080206572 <alloc_clus>:
        brelse(b);
    }
}

static uint32 alloc_clus(uint8 dev)
{
    80206572:	711d                	addi	sp,sp,-96
    80206574:	ec86                	sd	ra,88(sp)
    80206576:	e8a2                	sd	s0,80(sp)
    80206578:	e4a6                	sd	s1,72(sp)
    8020657a:	e0ca                	sd	s2,64(sp)
    8020657c:	fc4e                	sd	s3,56(sp)
    8020657e:	f852                	sd	s4,48(sp)
    80206580:	f456                	sd	s5,40(sp)
    80206582:	f05a                	sd	s6,32(sp)
    80206584:	ec5e                	sd	s7,24(sp)
    80206586:	e862                	sd	s8,16(sp)
    80206588:	e466                	sd	s9,8(sp)
    8020658a:	1080                	addi	s0,sp,96
    // should we keep a free cluster list? instead of searching fat every time.
    struct buf *b;
    uint32 sec = fat.bpb.rsvd_sec_cnt;
    8020658c:	00030797          	auipc	a5,0x30
    80206590:	98c78793          	addi	a5,a5,-1652 # 80235f18 <fat>
    80206594:	0147db83          	lhu	s7,20(a5)
    uint32 const ent_per_sec = fat.bpb.byts_per_sec / sizeof(uint32);
    80206598:	0107d903          	lhu	s2,16(a5)
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    8020659c:	539c                	lw	a5,32(a5)
    8020659e:	10078263          	beqz	a5,802066a2 <alloc_clus+0x130>
    802065a2:	0029591b          	srliw	s2,s2,0x2
    802065a6:	0009099b          	sext.w	s3,s2
    802065aa:	4b01                	li	s6,0
        b = bread(dev, sec);
    802065ac:	00050a9b          	sext.w	s5,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    802065b0:	4c01                	li	s8,0
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    802065b2:	00030c97          	auipc	s9,0x30
    802065b6:	966c8c93          	addi	s9,s9,-1690 # 80235f18 <fat>
    802065ba:	a0c1                	j	8020667a <alloc_clus+0x108>
            if (((uint32 *)(b->data))[j] == 0) {
                ((uint32 *)(b->data))[j] = FAT32_EOC + 7;
    802065bc:	100007b7          	lui	a5,0x10000
    802065c0:	37fd                	addiw	a5,a5,-1
    802065c2:	c29c                	sw	a5,0(a3)
                bwrite(b);
    802065c4:	8552                	mv	a0,s4
    802065c6:	ffffd097          	auipc	ra,0xffffd
    802065ca:	6ca080e7          	jalr	1738(ra) # 80203c90 <bwrite>
                brelse(b);
    802065ce:	8552                	mv	a0,s4
    802065d0:	ffffd097          	auipc	ra,0xffffd
    802065d4:	6fc080e7          	jalr	1788(ra) # 80203ccc <brelse>
                uint32 clus = i * ent_per_sec + j;
    802065d8:	0369093b          	mulw	s2,s2,s6
    802065dc:	009904bb          	addw	s1,s2,s1
    802065e0:	00048a9b          	sext.w	s5,s1
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    802065e4:	00030717          	auipc	a4,0x30
    802065e8:	93470713          	addi	a4,a4,-1740 # 80235f18 <fat>
    802065ec:	01274783          	lbu	a5,18(a4)
    802065f0:	34f9                	addiw	s1,s1,-2
    802065f2:	02f489bb          	mulw	s3,s1,a5
    802065f6:	4318                	lw	a4,0(a4)
    802065f8:	00e989bb          	addw	s3,s3,a4
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    802065fc:	c7b1                	beqz	a5,80206648 <alloc_clus+0xd6>
    802065fe:	4901                	li	s2,0
    80206600:	00030a17          	auipc	s4,0x30
    80206604:	918a0a13          	addi	s4,s4,-1768 # 80235f18 <fat>
        b = bread(0, sec++);
    80206608:	013905bb          	addw	a1,s2,s3
    8020660c:	4501                	li	a0,0
    8020660e:	ffffd097          	auipc	ra,0xffffd
    80206612:	592080e7          	jalr	1426(ra) # 80203ba0 <bread>
    80206616:	84aa                	mv	s1,a0
        memset(b->data, 0, BSIZE);
    80206618:	20000613          	li	a2,512
    8020661c:	4581                	li	a1,0
    8020661e:	05850513          	addi	a0,a0,88
    80206622:	ffffa097          	auipc	ra,0xffffa
    80206626:	142080e7          	jalr	322(ra) # 80200764 <memset>
        bwrite(b);
    8020662a:	8526                	mv	a0,s1
    8020662c:	ffffd097          	auipc	ra,0xffffd
    80206630:	664080e7          	jalr	1636(ra) # 80203c90 <bwrite>
        brelse(b);
    80206634:	8526                	mv	a0,s1
    80206636:	ffffd097          	auipc	ra,0xffffd
    8020663a:	696080e7          	jalr	1686(ra) # 80203ccc <brelse>
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    8020663e:	2905                	addiw	s2,s2,1
    80206640:	012a4783          	lbu	a5,18(s4)
    80206644:	fcf942e3          	blt	s2,a5,80206608 <alloc_clus+0x96>
            }
        }
        brelse(b);
    }
    panic("no clusters");
}
    80206648:	8556                	mv	a0,s5
    8020664a:	60e6                	ld	ra,88(sp)
    8020664c:	6446                	ld	s0,80(sp)
    8020664e:	64a6                	ld	s1,72(sp)
    80206650:	6906                	ld	s2,64(sp)
    80206652:	79e2                	ld	s3,56(sp)
    80206654:	7a42                	ld	s4,48(sp)
    80206656:	7aa2                	ld	s5,40(sp)
    80206658:	7b02                	ld	s6,32(sp)
    8020665a:	6be2                	ld	s7,24(sp)
    8020665c:	6c42                	ld	s8,16(sp)
    8020665e:	6ca2                	ld	s9,8(sp)
    80206660:	6125                	addi	sp,sp,96
    80206662:	8082                	ret
        brelse(b);
    80206664:	8552                	mv	a0,s4
    80206666:	ffffd097          	auipc	ra,0xffffd
    8020666a:	666080e7          	jalr	1638(ra) # 80203ccc <brelse>
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    8020666e:	2b05                	addiw	s6,s6,1
    80206670:	2b85                	addiw	s7,s7,1
    80206672:	020ca783          	lw	a5,32(s9)
    80206676:	02fb7663          	bgeu	s6,a5,802066a2 <alloc_clus+0x130>
        b = bread(dev, sec);
    8020667a:	85de                	mv	a1,s7
    8020667c:	8556                	mv	a0,s5
    8020667e:	ffffd097          	auipc	ra,0xffffd
    80206682:	522080e7          	jalr	1314(ra) # 80203ba0 <bread>
    80206686:	8a2a                	mv	s4,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80206688:	fc098ee3          	beqz	s3,80206664 <alloc_clus+0xf2>
    8020668c:	05850793          	addi	a5,a0,88
    80206690:	84e2                	mv	s1,s8
            if (((uint32 *)(b->data))[j] == 0) {
    80206692:	86be                	mv	a3,a5
    80206694:	4398                	lw	a4,0(a5)
    80206696:	d31d                	beqz	a4,802065bc <alloc_clus+0x4a>
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80206698:	2485                	addiw	s1,s1,1
    8020669a:	0791                	addi	a5,a5,4
    8020669c:	fe999be3          	bne	s3,s1,80206692 <alloc_clus+0x120>
    802066a0:	b7d1                	j	80206664 <alloc_clus+0xf2>
    panic("no clusters");
    802066a2:	00004517          	auipc	a0,0x4
    802066a6:	6f650513          	addi	a0,a0,1782 # 8020ad98 <digits+0xa18>
    802066aa:	ffffa097          	auipc	ra,0xffffa
    802066ae:	a98080e7          	jalr	-1384(ra) # 80200142 <panic>

00000000802066b2 <write_fat>:
    if (cluster > fat.data_clus_cnt + 1) {
    802066b2:	00030797          	auipc	a5,0x30
    802066b6:	86e7a783          	lw	a5,-1938(a5) # 80235f20 <fat+0x8>
    802066ba:	2785                	addiw	a5,a5,1
    802066bc:	06a7e963          	bltu	a5,a0,8020672e <write_fat+0x7c>
{
    802066c0:	7179                	addi	sp,sp,-48
    802066c2:	f406                	sd	ra,40(sp)
    802066c4:	f022                	sd	s0,32(sp)
    802066c6:	ec26                	sd	s1,24(sp)
    802066c8:	e84a                	sd	s2,16(sp)
    802066ca:	e44e                	sd	s3,8(sp)
    802066cc:	e052                	sd	s4,0(sp)
    802066ce:	1800                	addi	s0,sp,48
    802066d0:	89ae                	mv	s3,a1
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    802066d2:	0025149b          	slliw	s1,a0,0x2
    802066d6:	00030a17          	auipc	s4,0x30
    802066da:	842a0a13          	addi	s4,s4,-1982 # 80235f18 <fat>
    802066de:	010a5783          	lhu	a5,16(s4)
    802066e2:	02f4d7bb          	divuw	a5,s1,a5
    802066e6:	014a5583          	lhu	a1,20(s4)
    struct buf *b = bread(0, fat_sec);
    802066ea:	9dbd                	addw	a1,a1,a5
    802066ec:	4501                	li	a0,0
    802066ee:	ffffd097          	auipc	ra,0xffffd
    802066f2:	4b2080e7          	jalr	1202(ra) # 80203ba0 <bread>
    802066f6:	892a                	mv	s2,a0
    return (cluster << 2) % fat.bpb.byts_per_sec;
    802066f8:	010a5783          	lhu	a5,16(s4)
    802066fc:	02f4f4bb          	remuw	s1,s1,a5
    *(uint32 *)(b->data + off) = content;
    80206700:	1482                	slli	s1,s1,0x20
    80206702:	9081                	srli	s1,s1,0x20
    80206704:	94aa                	add	s1,s1,a0
    80206706:	0534ac23          	sw	s3,88(s1)
    bwrite(b);
    8020670a:	ffffd097          	auipc	ra,0xffffd
    8020670e:	586080e7          	jalr	1414(ra) # 80203c90 <bwrite>
    brelse(b);
    80206712:	854a                	mv	a0,s2
    80206714:	ffffd097          	auipc	ra,0xffffd
    80206718:	5b8080e7          	jalr	1464(ra) # 80203ccc <brelse>
    return 0;
    8020671c:	4501                	li	a0,0
}
    8020671e:	70a2                	ld	ra,40(sp)
    80206720:	7402                	ld	s0,32(sp)
    80206722:	64e2                	ld	s1,24(sp)
    80206724:	6942                	ld	s2,16(sp)
    80206726:	69a2                	ld	s3,8(sp)
    80206728:	6a02                	ld	s4,0(sp)
    8020672a:	6145                	addi	sp,sp,48
    8020672c:	8082                	ret
        return -1;
    8020672e:	557d                	li	a0,-1
}
    80206730:	8082                	ret

0000000080206732 <reloc_clus>:
 * @param   off         the offset from the beginning of the relative file
 * @param   alloc       whether alloc new cluster when meeting end of FAT chains
 * @return              the offset from the new cur_clus
 */
static int reloc_clus(struct dirent *entry, uint off, int alloc)
{
    80206732:	715d                	addi	sp,sp,-80
    80206734:	e486                	sd	ra,72(sp)
    80206736:	e0a2                	sd	s0,64(sp)
    80206738:	fc26                	sd	s1,56(sp)
    8020673a:	f84a                	sd	s2,48(sp)
    8020673c:	f44e                	sd	s3,40(sp)
    8020673e:	f052                	sd	s4,32(sp)
    80206740:	ec56                	sd	s5,24(sp)
    80206742:	e85a                	sd	s6,16(sp)
    80206744:	e45e                	sd	s7,8(sp)
    80206746:	0880                	addi	s0,sp,80
    80206748:	84aa                	mv	s1,a0
    8020674a:	8a2e                	mv	s4,a1
    int clus_num = off / fat.byts_per_clus;
    8020674c:	0002fb97          	auipc	s7,0x2f
    80206750:	7d8bab83          	lw	s7,2008(s7) # 80235f24 <fat+0xc>
    80206754:	0375d9bb          	divuw	s3,a1,s7
    while (clus_num > entry->clus_cnt) {
    80206758:	11052703          	lw	a4,272(a0)
    8020675c:	07377663          	bgeu	a4,s3,802067c8 <reloc_clus+0x96>
    80206760:	8b32                	mv	s6,a2
        int clus = read_fat(entry->cur_clus);
        if (clus >= FAT32_EOC) {
    80206762:	10000ab7          	lui	s5,0x10000
    80206766:	1add                	addi	s5,s5,-9
    80206768:	a025                	j	80206790 <reloc_clus+0x5e>
            if (alloc) {
                clus = alloc_clus(entry->dev);
                write_fat(entry->cur_clus, clus);
            } else {
                entry->cur_clus = entry->first_clus;
    8020676a:	1044a783          	lw	a5,260(s1)
    8020676e:	10f4a623          	sw	a5,268(s1)
                entry->clus_cnt = 0;
    80206772:	1004a823          	sw	zero,272(s1)
                return -1;
    80206776:	557d                	li	a0,-1
    80206778:	a879                	j	80206816 <reloc_clus+0xe4>
            }
        }
        entry->cur_clus = clus;
    8020677a:	1124a623          	sw	s2,268(s1)
        entry->clus_cnt++;
    8020677e:	1104a783          	lw	a5,272(s1)
    80206782:	2785                	addiw	a5,a5,1
    80206784:	0007871b          	sext.w	a4,a5
    80206788:	10f4a823          	sw	a5,272(s1)
    while (clus_num > entry->clus_cnt) {
    8020678c:	03377e63          	bgeu	a4,s3,802067c8 <reloc_clus+0x96>
        int clus = read_fat(entry->cur_clus);
    80206790:	10c4a503          	lw	a0,268(s1)
    80206794:	00000097          	auipc	ra,0x0
    80206798:	d6a080e7          	jalr	-662(ra) # 802064fe <read_fat>
    8020679c:	0005091b          	sext.w	s2,a0
        if (clus >= FAT32_EOC) {
    802067a0:	fd2adde3          	bge	s5,s2,8020677a <reloc_clus+0x48>
            if (alloc) {
    802067a4:	fc0b03e3          	beqz	s6,8020676a <reloc_clus+0x38>
                clus = alloc_clus(entry->dev);
    802067a8:	1144c503          	lbu	a0,276(s1)
    802067ac:	00000097          	auipc	ra,0x0
    802067b0:	dc6080e7          	jalr	-570(ra) # 80206572 <alloc_clus>
    802067b4:	0005091b          	sext.w	s2,a0
                write_fat(entry->cur_clus, clus);
    802067b8:	85ca                	mv	a1,s2
    802067ba:	10c4a503          	lw	a0,268(s1)
    802067be:	00000097          	auipc	ra,0x0
    802067c2:	ef4080e7          	jalr	-268(ra) # 802066b2 <write_fat>
    802067c6:	bf55                	j	8020677a <reloc_clus+0x48>
    }
    if (clus_num < entry->clus_cnt) {
    802067c8:	04e9f163          	bgeu	s3,a4,8020680a <reloc_clus+0xd8>
        entry->cur_clus = entry->first_clus;
    802067cc:	1044a783          	lw	a5,260(s1)
    802067d0:	10f4a623          	sw	a5,268(s1)
        entry->clus_cnt = 0;
    802067d4:	1004a823          	sw	zero,272(s1)
        while (entry->clus_cnt < clus_num) {
    802067d8:	037a6963          	bltu	s4,s7,8020680a <reloc_clus+0xd8>
            entry->cur_clus = read_fat(entry->cur_clus);
            if (entry->cur_clus >= FAT32_EOC) {
    802067dc:	10000937          	lui	s2,0x10000
    802067e0:	195d                	addi	s2,s2,-9
            entry->cur_clus = read_fat(entry->cur_clus);
    802067e2:	10c4a503          	lw	a0,268(s1)
    802067e6:	00000097          	auipc	ra,0x0
    802067ea:	d18080e7          	jalr	-744(ra) # 802064fe <read_fat>
    802067ee:	2501                	sext.w	a0,a0
    802067f0:	10a4a623          	sw	a0,268(s1)
            if (entry->cur_clus >= FAT32_EOC) {
    802067f4:	02a96c63          	bltu	s2,a0,8020682c <reloc_clus+0xfa>
                panic("reloc_clus");
            }
            entry->clus_cnt++;
    802067f8:	1104a783          	lw	a5,272(s1)
    802067fc:	2785                	addiw	a5,a5,1
    802067fe:	0007871b          	sext.w	a4,a5
    80206802:	10f4a823          	sw	a5,272(s1)
        while (entry->clus_cnt < clus_num) {
    80206806:	fd376ee3          	bltu	a4,s3,802067e2 <reloc_clus+0xb0>
        }
    }
    return off % fat.byts_per_clus;
    8020680a:	0002f517          	auipc	a0,0x2f
    8020680e:	71a52503          	lw	a0,1818(a0) # 80235f24 <fat+0xc>
    80206812:	02aa753b          	remuw	a0,s4,a0
}
    80206816:	60a6                	ld	ra,72(sp)
    80206818:	6406                	ld	s0,64(sp)
    8020681a:	74e2                	ld	s1,56(sp)
    8020681c:	7942                	ld	s2,48(sp)
    8020681e:	79a2                	ld	s3,40(sp)
    80206820:	7a02                	ld	s4,32(sp)
    80206822:	6ae2                	ld	s5,24(sp)
    80206824:	6b42                	ld	s6,16(sp)
    80206826:	6ba2                	ld	s7,8(sp)
    80206828:	6161                	addi	sp,sp,80
    8020682a:	8082                	ret
                panic("reloc_clus");
    8020682c:	00004517          	auipc	a0,0x4
    80206830:	57c50513          	addi	a0,a0,1404 # 8020ada8 <digits+0xa28>
    80206834:	ffffa097          	auipc	ra,0xffffa
    80206838:	90e080e7          	jalr	-1778(ra) # 80200142 <panic>

000000008020683c <rw_clus>:
{
    8020683c:	7119                	addi	sp,sp,-128
    8020683e:	fc86                	sd	ra,120(sp)
    80206840:	f8a2                	sd	s0,112(sp)
    80206842:	f4a6                	sd	s1,104(sp)
    80206844:	f0ca                	sd	s2,96(sp)
    80206846:	ecce                	sd	s3,88(sp)
    80206848:	e8d2                	sd	s4,80(sp)
    8020684a:	e4d6                	sd	s5,72(sp)
    8020684c:	e0da                	sd	s6,64(sp)
    8020684e:	fc5e                	sd	s7,56(sp)
    80206850:	f862                	sd	s8,48(sp)
    80206852:	f466                	sd	s9,40(sp)
    80206854:	f06a                	sd	s10,32(sp)
    80206856:	ec6e                	sd	s11,24(sp)
    80206858:	0100                	addi	s0,sp,128
    8020685a:	f8c43423          	sd	a2,-120(s0)
    8020685e:	8b36                	mv	s6,a3
    80206860:	8c3e                	mv	s8,a5
    if (off + n > fat.byts_per_clus)
    80206862:	00f706bb          	addw	a3,a4,a5
    80206866:	0002f797          	auipc	a5,0x2f
    8020686a:	6be7a783          	lw	a5,1726(a5) # 80235f24 <fat+0xc>
    8020686e:	02d7ef63          	bltu	a5,a3,802068ac <rw_clus+0x70>
    80206872:	8cae                	mv	s9,a1
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80206874:	0002f797          	auipc	a5,0x2f
    80206878:	6a478793          	addi	a5,a5,1700 # 80235f18 <fat>
    8020687c:	0107da83          	lhu	s5,16(a5)
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80206880:	ffe5099b          	addiw	s3,a0,-2
    80206884:	0127c503          	lbu	a0,18(a5)
    80206888:	02a989bb          	mulw	s3,s3,a0
    8020688c:	4388                	lw	a0,0(a5)
    8020688e:	00a989bb          	addw	s3,s3,a0
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80206892:	035757bb          	divuw	a5,a4,s5
    80206896:	00f989bb          	addw	s3,s3,a5
    off = off % fat.bpb.byts_per_sec;
    8020689a:	03577abb          	remuw	s5,a4,s5
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    8020689e:	0e0c0363          	beqz	s8,80206984 <rw_clus+0x148>
    802068a2:	4a01                	li	s4,0
        m = BSIZE - off % BSIZE;
    802068a4:	20000d93          	li	s11,512
        if (bad == -1) {
    802068a8:	5d7d                	li	s10,-1
    802068aa:	a095                	j	8020690e <rw_clus+0xd2>
        panic("offset out of range");
    802068ac:	00004517          	auipc	a0,0x4
    802068b0:	50c50513          	addi	a0,a0,1292 # 8020adb8 <digits+0xa38>
    802068b4:	ffffa097          	auipc	ra,0xffffa
    802068b8:	88e080e7          	jalr	-1906(ra) # 80200142 <panic>
                bwrite(bp);
    802068bc:	854a                	mv	a0,s2
    802068be:	ffffd097          	auipc	ra,0xffffd
    802068c2:	3d2080e7          	jalr	978(ra) # 80203c90 <bwrite>
        brelse(bp);
    802068c6:	854a                	mv	a0,s2
    802068c8:	ffffd097          	auipc	ra,0xffffd
    802068cc:	404080e7          	jalr	1028(ra) # 80203ccc <brelse>
        if (bad == -1) {
    802068d0:	a02d                	j	802068fa <rw_clus+0xbe>
            bad = either_copyout(user, data, bp->data + (off % BSIZE), m);
    802068d2:	05890613          	addi	a2,s2,88 # 10000058 <_entry-0x701fffa8>
    802068d6:	1682                	slli	a3,a3,0x20
    802068d8:	9281                	srli	a3,a3,0x20
    802068da:	963a                	add	a2,a2,a4
    802068dc:	85da                	mv	a1,s6
    802068de:	f8843503          	ld	a0,-120(s0)
    802068e2:	ffffc097          	auipc	ra,0xffffc
    802068e6:	c84080e7          	jalr	-892(ra) # 80202566 <either_copyout>
    802068ea:	8baa                	mv	s7,a0
        brelse(bp);
    802068ec:	854a                	mv	a0,s2
    802068ee:	ffffd097          	auipc	ra,0xffffd
    802068f2:	3de080e7          	jalr	990(ra) # 80203ccc <brelse>
        if (bad == -1) {
    802068f6:	07ab8763          	beq	s7,s10,80206964 <rw_clus+0x128>
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    802068fa:	01448a3b          	addw	s4,s1,s4
    802068fe:	01548abb          	addw	s5,s1,s5
    80206902:	1482                	slli	s1,s1,0x20
    80206904:	9081                	srli	s1,s1,0x20
    80206906:	9b26                	add	s6,s6,s1
    80206908:	2985                	addiw	s3,s3,1
    8020690a:	058a7d63          	bgeu	s4,s8,80206964 <rw_clus+0x128>
        bp = bread(0, sec);
    8020690e:	85ce                	mv	a1,s3
    80206910:	4501                	li	a0,0
    80206912:	ffffd097          	auipc	ra,0xffffd
    80206916:	28e080e7          	jalr	654(ra) # 80203ba0 <bread>
    8020691a:	892a                	mv	s2,a0
        m = BSIZE - off % BSIZE;
    8020691c:	1ffaf713          	andi	a4,s5,511
    80206920:	40ed863b          	subw	a2,s11,a4
        if (n - tot < m) {
    80206924:	414c07bb          	subw	a5,s8,s4
    80206928:	86be                	mv	a3,a5
    8020692a:	2781                	sext.w	a5,a5
    8020692c:	0006059b          	sext.w	a1,a2
    80206930:	00f5f363          	bgeu	a1,a5,80206936 <rw_clus+0xfa>
    80206934:	86b2                	mv	a3,a2
    80206936:	0006849b          	sext.w	s1,a3
        if (write) {
    8020693a:	f80c8ce3          	beqz	s9,802068d2 <rw_clus+0x96>
            if ((bad = either_copyin(bp->data + (off % BSIZE), user, data, m)) != -1) {
    8020693e:	05890513          	addi	a0,s2,88
    80206942:	1682                	slli	a3,a3,0x20
    80206944:	9281                	srli	a3,a3,0x20
    80206946:	865a                	mv	a2,s6
    80206948:	f8843583          	ld	a1,-120(s0)
    8020694c:	953a                	add	a0,a0,a4
    8020694e:	ffffc097          	auipc	ra,0xffffc
    80206952:	c6e080e7          	jalr	-914(ra) # 802025bc <either_copyin>
    80206956:	f7a513e3          	bne	a0,s10,802068bc <rw_clus+0x80>
        brelse(bp);
    8020695a:	854a                	mv	a0,s2
    8020695c:	ffffd097          	auipc	ra,0xffffd
    80206960:	370080e7          	jalr	880(ra) # 80203ccc <brelse>
}
    80206964:	8552                	mv	a0,s4
    80206966:	70e6                	ld	ra,120(sp)
    80206968:	7446                	ld	s0,112(sp)
    8020696a:	74a6                	ld	s1,104(sp)
    8020696c:	7906                	ld	s2,96(sp)
    8020696e:	69e6                	ld	s3,88(sp)
    80206970:	6a46                	ld	s4,80(sp)
    80206972:	6aa6                	ld	s5,72(sp)
    80206974:	6b06                	ld	s6,64(sp)
    80206976:	7be2                	ld	s7,56(sp)
    80206978:	7c42                	ld	s8,48(sp)
    8020697a:	7ca2                	ld	s9,40(sp)
    8020697c:	7d02                	ld	s10,32(sp)
    8020697e:	6de2                	ld	s11,24(sp)
    80206980:	6109                	addi	sp,sp,128
    80206982:	8082                	ret
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    80206984:	8a62                	mv	s4,s8
    80206986:	bff9                	j	80206964 <rw_clus+0x128>

0000000080206988 <eget>:
// by their whole path. But when parsing a path, we open all the directories through it, 
// which forms a linked list from the final file to the root. Thus, we use the "parent" pointer 
// to recognize whether an entry with the "name" as given is really the file we want in the right path.
// Should never get root by eget, it's easy to understand.
static struct dirent *eget(struct dirent *parent, char *name)
{
    80206988:	7139                	addi	sp,sp,-64
    8020698a:	fc06                	sd	ra,56(sp)
    8020698c:	f822                	sd	s0,48(sp)
    8020698e:	f426                	sd	s1,40(sp)
    80206990:	f04a                	sd	s2,32(sp)
    80206992:	ec4e                	sd	s3,24(sp)
    80206994:	e852                	sd	s4,16(sp)
    80206996:	e456                	sd	s5,8(sp)
    80206998:	0080                	addi	s0,sp,64
    8020699a:	8a2a                	mv	s4,a0
    8020699c:	8aae                	mv	s5,a1
    struct dirent *ep;
    acquire(&ecache.lock);
    8020699e:	0002f517          	auipc	a0,0x2f
    802069a2:	70a50513          	addi	a0,a0,1802 # 802360a8 <ecache>
    802069a6:	ffffa097          	auipc	ra,0xffffa
    802069aa:	d22080e7          	jalr	-734(ra) # 802006c8 <acquire>
    if (name) {
    802069ae:	060a8b63          	beqz	s5,80206a24 <eget+0x9c>
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    802069b2:	0002f497          	auipc	s1,0x2f
    802069b6:	6b64b483          	ld	s1,1718(s1) # 80236068 <root+0x128>
    802069ba:	0002f797          	auipc	a5,0x2f
    802069be:	58678793          	addi	a5,a5,1414 # 80235f40 <root>
    802069c2:	06f48163          	beq	s1,a5,80206a24 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    802069c6:	4905                	li	s2,1
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    802069c8:	89be                	mv	s3,a5
    802069ca:	a029                	j	802069d4 <eget+0x4c>
    802069cc:	1284b483          	ld	s1,296(s1)
    802069d0:	05348a63          	beq	s1,s3,80206a24 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    802069d4:	11649783          	lh	a5,278(s1)
    802069d8:	ff279ae3          	bne	a5,s2,802069cc <eget+0x44>
    802069dc:	1204b783          	ld	a5,288(s1)
    802069e0:	ff4796e3          	bne	a5,s4,802069cc <eget+0x44>
                && strncmp(ep->filename, name, FAT32_MAX_FILENAME) == 0) {
    802069e4:	0ff00613          	li	a2,255
    802069e8:	85d6                	mv	a1,s5
    802069ea:	8526                	mv	a0,s1
    802069ec:	ffffa097          	auipc	ra,0xffffa
    802069f0:	e54080e7          	jalr	-428(ra) # 80200840 <strncmp>
    802069f4:	fd61                	bnez	a0,802069cc <eget+0x44>
                if (ep->ref++ == 0) {
    802069f6:	1184a783          	lw	a5,280(s1)
    802069fa:	0017871b          	addiw	a4,a5,1
    802069fe:	10e4ac23          	sw	a4,280(s1)
    80206a02:	eb81                	bnez	a5,80206a12 <eget+0x8a>
                    ep->parent->ref++;
    80206a04:	1204b703          	ld	a4,288(s1)
    80206a08:	11872783          	lw	a5,280(a4)
    80206a0c:	2785                	addiw	a5,a5,1
    80206a0e:	10f72c23          	sw	a5,280(a4)
                }
                release(&ecache.lock);
    80206a12:	0002f517          	auipc	a0,0x2f
    80206a16:	69650513          	addi	a0,a0,1686 # 802360a8 <ecache>
    80206a1a:	ffffa097          	auipc	ra,0xffffa
    80206a1e:	d02080e7          	jalr	-766(ra) # 8020071c <release>
                // edup(ep->parent);
                return ep;
    80206a22:	a085                	j	80206a82 <eget+0xfa>
            }
        }
    }
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80206a24:	0002f497          	auipc	s1,0x2f
    80206a28:	64c4b483          	ld	s1,1612(s1) # 80236070 <root+0x130>
    80206a2c:	0002f797          	auipc	a5,0x2f
    80206a30:	51478793          	addi	a5,a5,1300 # 80235f40 <root>
    80206a34:	00f48a63          	beq	s1,a5,80206a48 <eget+0xc0>
    80206a38:	873e                	mv	a4,a5
        if (ep->ref == 0) {
    80206a3a:	1184a783          	lw	a5,280(s1)
    80206a3e:	cf89                	beqz	a5,80206a58 <eget+0xd0>
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80206a40:	1304b483          	ld	s1,304(s1)
    80206a44:	fee49be3          	bne	s1,a4,80206a3a <eget+0xb2>
            ep->dirty = 0;
            release(&ecache.lock);
            return ep;
        }
    }
    panic("eget: insufficient ecache");
    80206a48:	00004517          	auipc	a0,0x4
    80206a4c:	38850513          	addi	a0,a0,904 # 8020add0 <digits+0xa50>
    80206a50:	ffff9097          	auipc	ra,0xffff9
    80206a54:	6f2080e7          	jalr	1778(ra) # 80200142 <panic>
            ep->ref = 1;
    80206a58:	4785                	li	a5,1
    80206a5a:	10f4ac23          	sw	a5,280(s1)
            ep->dev = parent->dev;
    80206a5e:	114a4783          	lbu	a5,276(s4)
    80206a62:	10f48a23          	sb	a5,276(s1)
            ep->off = 0;
    80206a66:	1004ae23          	sw	zero,284(s1)
            ep->valid = 0;
    80206a6a:	10049b23          	sh	zero,278(s1)
            ep->dirty = 0;
    80206a6e:	10048aa3          	sb	zero,277(s1)
            release(&ecache.lock);
    80206a72:	0002f517          	auipc	a0,0x2f
    80206a76:	63650513          	addi	a0,a0,1590 # 802360a8 <ecache>
    80206a7a:	ffffa097          	auipc	ra,0xffffa
    80206a7e:	ca2080e7          	jalr	-862(ra) # 8020071c <release>
    return 0;
}
    80206a82:	8526                	mv	a0,s1
    80206a84:	70e2                	ld	ra,56(sp)
    80206a86:	7442                	ld	s0,48(sp)
    80206a88:	74a2                	ld	s1,40(sp)
    80206a8a:	7902                	ld	s2,32(sp)
    80206a8c:	69e2                	ld	s3,24(sp)
    80206a8e:	6a42                	ld	s4,16(sp)
    80206a90:	6aa2                	ld	s5,8(sp)
    80206a92:	6121                	addi	sp,sp,64
    80206a94:	8082                	ret

0000000080206a96 <read_entry_name>:
 * @param   buffer      pointer to the array that stores the name
 * @param   raw_entry   pointer to the entry in a sector buffer
 * @param   islong      if non-zero, read as l-n-e, otherwise s-n-e.
 */
static void read_entry_name(char *buffer, union dentry *d)
{
    80206a96:	7139                	addi	sp,sp,-64
    80206a98:	fc06                	sd	ra,56(sp)
    80206a9a:	f822                	sd	s0,48(sp)
    80206a9c:	f426                	sd	s1,40(sp)
    80206a9e:	f04a                	sd	s2,32(sp)
    80206aa0:	ec4e                	sd	s3,24(sp)
    80206aa2:	0080                	addi	s0,sp,64
    80206aa4:	84aa                	mv	s1,a0
    80206aa6:	892e                	mv	s2,a1
    if (d->lne.attr == ATTR_LONG_NAME) {                       // long entry branch
    80206aa8:	00b5c703          	lbu	a4,11(a1)
    80206aac:	47bd                	li	a5,15
    80206aae:	08f70563          	beq	a4,a5,80206b38 <read_entry_name+0xa2>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
        buffer += NELEM(d->lne.name2);
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    } else {
        // assert: only "." and ".." will enter this branch
        memset(buffer, 0, CHAR_SHORT_NAME + 2); // plus '.' and '\0'
    80206ab2:	4635                	li	a2,13
    80206ab4:	4581                	li	a1,0
    80206ab6:	ffffa097          	auipc	ra,0xffffa
    80206aba:	cae080e7          	jalr	-850(ra) # 80200764 <memset>
        int i;
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    80206abe:	00094703          	lbu	a4,0(s2)
    80206ac2:	02000793          	li	a5,32
    80206ac6:	0af70c63          	beq	a4,a5,80206b7e <read_entry_name+0xe8>
    80206aca:	4785                	li	a5,1
    80206acc:	02000613          	li	a2,32
    80206ad0:	45a5                	li	a1,9
            buffer[i] = d->sne.name[i];
    80206ad2:	00f486b3          	add	a3,s1,a5
    80206ad6:	fee68fa3          	sb	a4,-1(a3) # 1fff <_entry-0x801fe001>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    80206ada:	0007851b          	sext.w	a0,a5
    80206ade:	00f90733          	add	a4,s2,a5
    80206ae2:	00074703          	lbu	a4,0(a4)
    80206ae6:	00c70563          	beq	a4,a2,80206af0 <read_entry_name+0x5a>
    80206aea:	0785                	addi	a5,a5,1
    80206aec:	feb793e3          	bne	a5,a1,80206ad2 <read_entry_name+0x3c>
        }
        if (d->sne.name[8] != ' ') {
    80206af0:	00894703          	lbu	a4,8(s2)
    80206af4:	02000793          	li	a5,32
    80206af8:	00f70963          	beq	a4,a5,80206b0a <read_entry_name+0x74>
            buffer[i++] = '.';
    80206afc:	00a487b3          	add	a5,s1,a0
    80206b00:	02e00713          	li	a4,46
    80206b04:	00e78023          	sb	a4,0(a5)
    80206b08:	2505                	addiw	a0,a0,1
        }
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    80206b0a:	00890793          	addi	a5,s2,8
    80206b0e:	94aa                	add	s1,s1,a0
    80206b10:	092d                	addi	s2,s2,11
            if (d->sne.name[j] == ' ') { break; }
    80206b12:	02000693          	li	a3,32
    80206b16:	0007c703          	lbu	a4,0(a5)
    80206b1a:	00d70863          	beq	a4,a3,80206b2a <read_entry_name+0x94>
            buffer[i] = d->sne.name[j];
    80206b1e:	00e48023          	sb	a4,0(s1)
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    80206b22:	0785                	addi	a5,a5,1
    80206b24:	0485                	addi	s1,s1,1
    80206b26:	ff2798e3          	bne	a5,s2,80206b16 <read_entry_name+0x80>
        }
    }
}
    80206b2a:	70e2                	ld	ra,56(sp)
    80206b2c:	7442                	ld	s0,48(sp)
    80206b2e:	74a2                	ld	s1,40(sp)
    80206b30:	7902                	ld	s2,32(sp)
    80206b32:	69e2                	ld	s3,24(sp)
    80206b34:	6121                	addi	sp,sp,64
    80206b36:	8082                	ret
        memmove(temp, d->lne.name1, sizeof(temp));
    80206b38:	4629                	li	a2,10
    80206b3a:	0585                	addi	a1,a1,1
    80206b3c:	fc040993          	addi	s3,s0,-64
    80206b40:	854e                	mv	a0,s3
    80206b42:	ffffa097          	auipc	ra,0xffffa
    80206b46:	c82080e7          	jalr	-894(ra) # 802007c4 <memmove>
        snstr(buffer, temp, NELEM(d->lne.name1));
    80206b4a:	4615                	li	a2,5
    80206b4c:	85ce                	mv	a1,s3
    80206b4e:	8526                	mv	a0,s1
    80206b50:	ffffa097          	auipc	ra,0xffffa
    80206b54:	dfa080e7          	jalr	-518(ra) # 8020094a <snstr>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
    80206b58:	4619                	li	a2,6
    80206b5a:	00e90593          	addi	a1,s2,14
    80206b5e:	00548513          	addi	a0,s1,5
    80206b62:	ffffa097          	auipc	ra,0xffffa
    80206b66:	de8080e7          	jalr	-536(ra) # 8020094a <snstr>
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    80206b6a:	4609                	li	a2,2
    80206b6c:	01c90593          	addi	a1,s2,28
    80206b70:	00b48513          	addi	a0,s1,11
    80206b74:	ffffa097          	auipc	ra,0xffffa
    80206b78:	dd6080e7          	jalr	-554(ra) # 8020094a <snstr>
    80206b7c:	b77d                	j	80206b2a <read_entry_name+0x94>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    80206b7e:	4501                	li	a0,0
    80206b80:	bf85                	j	80206af0 <read_entry_name+0x5a>

0000000080206b82 <fat32_init>:
{
    80206b82:	7139                	addi	sp,sp,-64
    80206b84:	fc06                	sd	ra,56(sp)
    80206b86:	f822                	sd	s0,48(sp)
    80206b88:	f426                	sd	s1,40(sp)
    80206b8a:	f04a                	sd	s2,32(sp)
    80206b8c:	ec4e                	sd	s3,24(sp)
    80206b8e:	e852                	sd	s4,16(sp)
    80206b90:	e456                	sd	s5,8(sp)
    80206b92:	0080                	addi	s0,sp,64
    struct buf *b = bread(0, 0);
    80206b94:	4581                	li	a1,0
    80206b96:	4501                	li	a0,0
    80206b98:	ffffd097          	auipc	ra,0xffffd
    80206b9c:	008080e7          	jalr	8(ra) # 80203ba0 <bread>
    80206ba0:	892a                	mv	s2,a0
    if (strncmp((char const*)(b->data + 82), "FAT32", 5))
    80206ba2:	4615                	li	a2,5
    80206ba4:	00004597          	auipc	a1,0x4
    80206ba8:	24c58593          	addi	a1,a1,588 # 8020adf0 <digits+0xa70>
    80206bac:	0aa50513          	addi	a0,a0,170
    80206bb0:	ffffa097          	auipc	ra,0xffffa
    80206bb4:	c90080e7          	jalr	-880(ra) # 80200840 <strncmp>
    80206bb8:	16051863          	bnez	a0,80206d28 <fat32_init+0x1a6>
    memmove(&fat.bpb.byts_per_sec, b->data + 11, 2);            // avoid misaligned load on k210
    80206bbc:	0002f497          	auipc	s1,0x2f
    80206bc0:	35c48493          	addi	s1,s1,860 # 80235f18 <fat>
    80206bc4:	4609                	li	a2,2
    80206bc6:	06390593          	addi	a1,s2,99
    80206bca:	0002f517          	auipc	a0,0x2f
    80206bce:	35e50513          	addi	a0,a0,862 # 80235f28 <fat+0x10>
    80206bd2:	ffffa097          	auipc	ra,0xffffa
    80206bd6:	bf2080e7          	jalr	-1038(ra) # 802007c4 <memmove>
    fat.bpb.sec_per_clus = *(b->data + 13);
    80206bda:	06594683          	lbu	a3,101(s2)
    80206bde:	00d48923          	sb	a3,18(s1)
    fat.bpb.rsvd_sec_cnt = *(uint16 *)(b->data + 14);
    80206be2:	06695603          	lhu	a2,102(s2)
    80206be6:	00c49a23          	sh	a2,20(s1)
    fat.bpb.fat_cnt = *(b->data + 16);
    80206bea:	06894703          	lbu	a4,104(s2)
    80206bee:	00e48b23          	sb	a4,22(s1)
    fat.bpb.hidd_sec = *(uint32 *)(b->data + 28);
    80206bf2:	07492783          	lw	a5,116(s2)
    80206bf6:	cc9c                	sw	a5,24(s1)
    fat.bpb.tot_sec = *(uint32 *)(b->data + 32);
    80206bf8:	07892783          	lw	a5,120(s2)
    80206bfc:	ccdc                	sw	a5,28(s1)
    fat.bpb.fat_sz = *(uint32 *)(b->data + 36);
    80206bfe:	07c92583          	lw	a1,124(s2)
    80206c02:	d08c                	sw	a1,32(s1)
    fat.bpb.root_clus = *(uint32 *)(b->data + 44);
    80206c04:	08492503          	lw	a0,132(s2)
    80206c08:	d0c8                	sw	a0,36(s1)
    fat.first_data_sec = fat.bpb.rsvd_sec_cnt + fat.bpb.fat_cnt * fat.bpb.fat_sz;
    80206c0a:	02b7073b          	mulw	a4,a4,a1
    80206c0e:	9f31                	addw	a4,a4,a2
    80206c10:	c098                	sw	a4,0(s1)
    fat.data_sec_cnt = fat.bpb.tot_sec - fat.first_data_sec;
    80206c12:	9f99                	subw	a5,a5,a4
    80206c14:	c0dc                	sw	a5,4(s1)
    fat.data_clus_cnt = fat.data_sec_cnt / fat.bpb.sec_per_clus;
    80206c16:	02d7d7bb          	divuw	a5,a5,a3
    80206c1a:	c49c                	sw	a5,8(s1)
    fat.byts_per_clus = fat.bpb.sec_per_clus * fat.bpb.byts_per_sec;
    80206c1c:	0104d783          	lhu	a5,16(s1)
    80206c20:	02d787bb          	mulw	a5,a5,a3
    80206c24:	c4dc                	sw	a5,12(s1)
    brelse(b);
    80206c26:	854a                	mv	a0,s2
    80206c28:	ffffd097          	auipc	ra,0xffffd
    80206c2c:	0a4080e7          	jalr	164(ra) # 80203ccc <brelse>
    if (BSIZE != fat.bpb.byts_per_sec) 
    80206c30:	0104d703          	lhu	a4,16(s1)
    80206c34:	20000793          	li	a5,512
    80206c38:	10f71063          	bne	a4,a5,80206d38 <fat32_init+0x1b6>
    initlock(&ecache.lock, "ecache");
    80206c3c:	00004597          	auipc	a1,0x4
    80206c40:	1ec58593          	addi	a1,a1,492 # 8020ae28 <digits+0xaa8>
    80206c44:	0002f517          	auipc	a0,0x2f
    80206c48:	46450513          	addi	a0,a0,1124 # 802360a8 <ecache>
    80206c4c:	ffffa097          	auipc	ra,0xffffa
    80206c50:	a38080e7          	jalr	-1480(ra) # 80200684 <initlock>
    memset(&root, 0, sizeof(root));
    80206c54:	0002f497          	auipc	s1,0x2f
    80206c58:	2c448493          	addi	s1,s1,708 # 80235f18 <fat>
    80206c5c:	0002f917          	auipc	s2,0x2f
    80206c60:	2e490913          	addi	s2,s2,740 # 80235f40 <root>
    80206c64:	16800613          	li	a2,360
    80206c68:	4581                	li	a1,0
    80206c6a:	854a                	mv	a0,s2
    80206c6c:	ffffa097          	auipc	ra,0xffffa
    80206c70:	af8080e7          	jalr	-1288(ra) # 80200764 <memset>
    initsleeplock(&root.lock, "entry");
    80206c74:	00004597          	auipc	a1,0x4
    80206c78:	1bc58593          	addi	a1,a1,444 # 8020ae30 <digits+0xab0>
    80206c7c:	0002f517          	auipc	a0,0x2f
    80206c80:	3fc50513          	addi	a0,a0,1020 # 80236078 <root+0x138>
    80206c84:	ffffd097          	auipc	ra,0xffffd
    80206c88:	15e080e7          	jalr	350(ra) # 80203de2 <initsleeplock>
    root.attribute = (ATTR_DIRECTORY | ATTR_SYSTEM);
    80206c8c:	47d1                	li	a5,20
    80206c8e:	12f48423          	sb	a5,296(s1)
    root.first_clus = root.cur_clus = fat.bpb.root_clus;
    80206c92:	50dc                	lw	a5,36(s1)
    80206c94:	12f4aa23          	sw	a5,308(s1)
    80206c98:	12f4a623          	sw	a5,300(s1)
    root.valid = 1;
    80206c9c:	4785                	li	a5,1
    80206c9e:	12f49f23          	sh	a5,318(s1)
    root.prev = &root;
    80206ca2:	1524bc23          	sd	s2,344(s1)
    root.next = &root;
    80206ca6:	1524b823          	sd	s2,336(s1)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    80206caa:	0002f497          	auipc	s1,0x2f
    80206cae:	41648493          	addi	s1,s1,1046 # 802360c0 <ecache+0x18>
        de->next = root.next;
    80206cb2:	0002f917          	auipc	s2,0x2f
    80206cb6:	26690913          	addi	s2,s2,614 # 80235f18 <fat>
        de->prev = &root;
    80206cba:	0002fa97          	auipc	s5,0x2f
    80206cbe:	286a8a93          	addi	s5,s5,646 # 80235f40 <root>
        initsleeplock(&de->lock, "entry");
    80206cc2:	00004a17          	auipc	s4,0x4
    80206cc6:	16ea0a13          	addi	s4,s4,366 # 8020ae30 <digits+0xab0>
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    80206cca:	00034997          	auipc	s3,0x34
    80206cce:	a4698993          	addi	s3,s3,-1466 # 8023a710 <cons>
        de->dev = 0;
    80206cd2:	10048a23          	sb	zero,276(s1)
        de->valid = 0;
    80206cd6:	10049b23          	sh	zero,278(s1)
        de->ref = 0;
    80206cda:	1004ac23          	sw	zero,280(s1)
        de->dirty = 0;
    80206cde:	10048aa3          	sb	zero,277(s1)
        de->parent = 0;
    80206ce2:	1204b023          	sd	zero,288(s1)
        de->next = root.next;
    80206ce6:	15093783          	ld	a5,336(s2)
    80206cea:	12f4b423          	sd	a5,296(s1)
        de->prev = &root;
    80206cee:	1354b823          	sd	s5,304(s1)
        initsleeplock(&de->lock, "entry");
    80206cf2:	85d2                	mv	a1,s4
    80206cf4:	13848513          	addi	a0,s1,312
    80206cf8:	ffffd097          	auipc	ra,0xffffd
    80206cfc:	0ea080e7          	jalr	234(ra) # 80203de2 <initsleeplock>
        root.next->prev = de;
    80206d00:	15093783          	ld	a5,336(s2)
    80206d04:	1297b823          	sd	s1,304(a5)
        root.next = de;
    80206d08:	14993823          	sd	s1,336(s2)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    80206d0c:	16848493          	addi	s1,s1,360
    80206d10:	fd3491e3          	bne	s1,s3,80206cd2 <fat32_init+0x150>
}
    80206d14:	4501                	li	a0,0
    80206d16:	70e2                	ld	ra,56(sp)
    80206d18:	7442                	ld	s0,48(sp)
    80206d1a:	74a2                	ld	s1,40(sp)
    80206d1c:	7902                	ld	s2,32(sp)
    80206d1e:	69e2                	ld	s3,24(sp)
    80206d20:	6a42                	ld	s4,16(sp)
    80206d22:	6aa2                	ld	s5,8(sp)
    80206d24:	6121                	addi	sp,sp,64
    80206d26:	8082                	ret
        panic("not FAT32 volume");
    80206d28:	00004517          	auipc	a0,0x4
    80206d2c:	0d050513          	addi	a0,a0,208 # 8020adf8 <digits+0xa78>
    80206d30:	ffff9097          	auipc	ra,0xffff9
    80206d34:	412080e7          	jalr	1042(ra) # 80200142 <panic>
        panic("byts_per_sec != BSIZE");
    80206d38:	00004517          	auipc	a0,0x4
    80206d3c:	0d850513          	addi	a0,a0,216 # 8020ae10 <digits+0xa90>
    80206d40:	ffff9097          	auipc	ra,0xffff9
    80206d44:	402080e7          	jalr	1026(ra) # 80200142 <panic>

0000000080206d48 <eread>:
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80206d48:	10852783          	lw	a5,264(a0)
    80206d4c:	0ed7e863          	bltu	a5,a3,80206e3c <eread+0xf4>
{
    80206d50:	711d                	addi	sp,sp,-96
    80206d52:	ec86                	sd	ra,88(sp)
    80206d54:	e8a2                	sd	s0,80(sp)
    80206d56:	e4a6                	sd	s1,72(sp)
    80206d58:	e0ca                	sd	s2,64(sp)
    80206d5a:	fc4e                	sd	s3,56(sp)
    80206d5c:	f852                	sd	s4,48(sp)
    80206d5e:	f456                	sd	s5,40(sp)
    80206d60:	f05a                	sd	s6,32(sp)
    80206d62:	ec5e                	sd	s7,24(sp)
    80206d64:	e862                	sd	s8,16(sp)
    80206d66:	e466                	sd	s9,8(sp)
    80206d68:	e06a                	sd	s10,0(sp)
    80206d6a:	1080                	addi	s0,sp,96
    80206d6c:	8a2a                	mv	s4,a0
    80206d6e:	8bae                	mv	s7,a1
    80206d70:	8ab2                	mv	s5,a2
    80206d72:	8936                	mv	s2,a3
    80206d74:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80206d76:	9eb9                	addw	a3,a3,a4
        return 0;
    80206d78:	4501                	li	a0,0
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80206d7a:	0b26e163          	bltu	a3,s2,80206e1c <eread+0xd4>
    80206d7e:	100a4703          	lbu	a4,256(s4)
    80206d82:	8b41                	andi	a4,a4,16
    80206d84:	ef41                	bnez	a4,80206e1c <eread+0xd4>
    if (off + n > entry->file_size) {
    80206d86:	00d7f463          	bgeu	a5,a3,80206d8e <eread+0x46>
        n = entry->file_size - off;
    80206d8a:	41278b3b          	subw	s6,a5,s2
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206d8e:	10ca2703          	lw	a4,268(s4)
    80206d92:	100007b7          	lui	a5,0x10000
    80206d96:	17dd                	addi	a5,a5,-9
    80206d98:	06e7ef63          	bltu	a5,a4,80206e16 <eread+0xce>
    80206d9c:	080b0e63          	beqz	s6,80206e38 <eread+0xf0>
    80206da0:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206da2:	0002fc97          	auipc	s9,0x2f
    80206da6:	176c8c93          	addi	s9,s9,374 # 80235f18 <fat>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206daa:	8c3e                	mv	s8,a5
    80206dac:	a82d                	j	80206de6 <eread+0x9e>
    80206dae:	00048d1b          	sext.w	s10,s1
        if (rw_clus(entry->cur_clus, 0, user_dst, dst, off % fat.byts_per_clus, m) != m) {
    80206db2:	87ea                	mv	a5,s10
    80206db4:	86d6                	mv	a3,s5
    80206db6:	865e                	mv	a2,s7
    80206db8:	4581                	li	a1,0
    80206dba:	10ca2503          	lw	a0,268(s4)
    80206dbe:	00000097          	auipc	ra,0x0
    80206dc2:	a7e080e7          	jalr	-1410(ra) # 8020683c <rw_clus>
    80206dc6:	2501                	sext.w	a0,a0
    80206dc8:	04ad1863          	bne	s10,a0,80206e18 <eread+0xd0>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206dcc:	013489bb          	addw	s3,s1,s3
    80206dd0:	0124893b          	addw	s2,s1,s2
    80206dd4:	1482                	slli	s1,s1,0x20
    80206dd6:	9081                	srli	s1,s1,0x20
    80206dd8:	9aa6                	add	s5,s5,s1
    80206dda:	10ca2783          	lw	a5,268(s4)
    80206dde:	02fc6d63          	bltu	s8,a5,80206e18 <eread+0xd0>
    80206de2:	0369fb63          	bgeu	s3,s6,80206e18 <eread+0xd0>
        reloc_clus(entry, off, 0);
    80206de6:	4601                	li	a2,0
    80206de8:	85ca                	mv	a1,s2
    80206dea:	8552                	mv	a0,s4
    80206dec:	00000097          	auipc	ra,0x0
    80206df0:	946080e7          	jalr	-1722(ra) # 80206732 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206df4:	00cca783          	lw	a5,12(s9)
    80206df8:	02f976bb          	remuw	a3,s2,a5
    80206dfc:	0006871b          	sext.w	a4,a3
    80206e00:	9f95                	subw	a5,a5,a3
        if (n - tot < m) {
    80206e02:	413b06bb          	subw	a3,s6,s3
    80206e06:	84b6                	mv	s1,a3
    80206e08:	2681                	sext.w	a3,a3
    80206e0a:	0007861b          	sext.w	a2,a5
    80206e0e:	fad670e3          	bgeu	a2,a3,80206dae <eread+0x66>
    80206e12:	84be                	mv	s1,a5
    80206e14:	bf69                	j	80206dae <eread+0x66>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206e16:	4981                	li	s3,0
    return tot;
    80206e18:	0009851b          	sext.w	a0,s3
}
    80206e1c:	60e6                	ld	ra,88(sp)
    80206e1e:	6446                	ld	s0,80(sp)
    80206e20:	64a6                	ld	s1,72(sp)
    80206e22:	6906                	ld	s2,64(sp)
    80206e24:	79e2                	ld	s3,56(sp)
    80206e26:	7a42                	ld	s4,48(sp)
    80206e28:	7aa2                	ld	s5,40(sp)
    80206e2a:	7b02                	ld	s6,32(sp)
    80206e2c:	6be2                	ld	s7,24(sp)
    80206e2e:	6c42                	ld	s8,16(sp)
    80206e30:	6ca2                	ld	s9,8(sp)
    80206e32:	6d02                	ld	s10,0(sp)
    80206e34:	6125                	addi	sp,sp,96
    80206e36:	8082                	ret
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206e38:	89da                	mv	s3,s6
    80206e3a:	bff9                	j	80206e18 <eread+0xd0>
        return 0;
    80206e3c:	4501                	li	a0,0
}
    80206e3e:	8082                	ret

0000000080206e40 <ewrite>:
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    80206e40:	10852783          	lw	a5,264(a0)
    80206e44:	0ed7e463          	bltu	a5,a3,80206f2c <ewrite+0xec>
{
    80206e48:	711d                	addi	sp,sp,-96
    80206e4a:	ec86                	sd	ra,88(sp)
    80206e4c:	e8a2                	sd	s0,80(sp)
    80206e4e:	e4a6                	sd	s1,72(sp)
    80206e50:	e0ca                	sd	s2,64(sp)
    80206e52:	fc4e                	sd	s3,56(sp)
    80206e54:	f852                	sd	s4,48(sp)
    80206e56:	f456                	sd	s5,40(sp)
    80206e58:	f05a                	sd	s6,32(sp)
    80206e5a:	ec5e                	sd	s7,24(sp)
    80206e5c:	e862                	sd	s8,16(sp)
    80206e5e:	e466                	sd	s9,8(sp)
    80206e60:	1080                	addi	s0,sp,96
    80206e62:	8aaa                	mv	s5,a0
    80206e64:	8bae                	mv	s7,a1
    80206e66:	8a32                	mv	s4,a2
    80206e68:	8936                	mv	s2,a3
    80206e6a:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    80206e6c:	00e687bb          	addw	a5,a3,a4
    80206e70:	0cd7e063          	bltu	a5,a3,80206f30 <ewrite+0xf0>
    80206e74:	02069793          	slli	a5,a3,0x20
    80206e78:	9381                	srli	a5,a5,0x20
    80206e7a:	1702                	slli	a4,a4,0x20
    80206e7c:	9301                	srli	a4,a4,0x20
    80206e7e:	97ba                	add	a5,a5,a4
    80206e80:	577d                	li	a4,-1
    80206e82:	9301                	srli	a4,a4,0x20
    80206e84:	0af76863          	bltu	a4,a5,80206f34 <ewrite+0xf4>
        || (entry->attribute & ATTR_READ_ONLY)) {
    80206e88:	10054783          	lbu	a5,256(a0)
    80206e8c:	8b85                	andi	a5,a5,1
    80206e8e:	e7cd                	bnez	a5,80206f38 <ewrite+0xf8>
    if (entry->first_clus == 0) {   // so file_size if 0 too, which requests off == 0
    80206e90:	10452783          	lw	a5,260(a0)
    80206e94:	cb89                	beqz	a5,80206ea6 <ewrite+0x66>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206e96:	080b0963          	beqz	s6,80206f28 <ewrite+0xe8>
    80206e9a:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206e9c:	0002fc17          	auipc	s8,0x2f
    80206ea0:	07cc0c13          	addi	s8,s8,124 # 80235f18 <fat>
    80206ea4:	a891                	j	80206ef8 <ewrite+0xb8>
        entry->cur_clus = entry->first_clus = alloc_clus(entry->dev);
    80206ea6:	11454503          	lbu	a0,276(a0)
    80206eaa:	fffff097          	auipc	ra,0xfffff
    80206eae:	6c8080e7          	jalr	1736(ra) # 80206572 <alloc_clus>
    80206eb2:	2501                	sext.w	a0,a0
    80206eb4:	10aaa223          	sw	a0,260(s5)
    80206eb8:	10aaa623          	sw	a0,268(s5)
        entry->clus_cnt = 0;
    80206ebc:	100aa823          	sw	zero,272(s5)
        entry->dirty = 1;
    80206ec0:	4785                	li	a5,1
    80206ec2:	10fa8aa3          	sb	a5,277(s5)
    80206ec6:	bfc1                	j	80206e96 <ewrite+0x56>
    80206ec8:	00048c9b          	sext.w	s9,s1
        if (rw_clus(entry->cur_clus, 1, user_src, src, off % fat.byts_per_clus, m) != m) {
    80206ecc:	87e6                	mv	a5,s9
    80206ece:	86d2                	mv	a3,s4
    80206ed0:	865e                	mv	a2,s7
    80206ed2:	4585                	li	a1,1
    80206ed4:	10caa503          	lw	a0,268(s5)
    80206ed8:	00000097          	auipc	ra,0x0
    80206edc:	964080e7          	jalr	-1692(ra) # 8020683c <rw_clus>
    80206ee0:	2501                	sext.w	a0,a0
    80206ee2:	04ac9d63          	bne	s9,a0,80206f3c <ewrite+0xfc>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206ee6:	013489bb          	addw	s3,s1,s3
    80206eea:	0124893b          	addw	s2,s1,s2
    80206eee:	1482                	slli	s1,s1,0x20
    80206ef0:	9081                	srli	s1,s1,0x20
    80206ef2:	9a26                	add	s4,s4,s1
    80206ef4:	0569f463          	bgeu	s3,s6,80206f3c <ewrite+0xfc>
        reloc_clus(entry, off, 1);
    80206ef8:	4605                	li	a2,1
    80206efa:	85ca                	mv	a1,s2
    80206efc:	8556                	mv	a0,s5
    80206efe:	00000097          	auipc	ra,0x0
    80206f02:	834080e7          	jalr	-1996(ra) # 80206732 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206f06:	00cc2783          	lw	a5,12(s8)
    80206f0a:	02f976bb          	remuw	a3,s2,a5
    80206f0e:	0006871b          	sext.w	a4,a3
    80206f12:	9f95                	subw	a5,a5,a3
        if (n - tot < m) {
    80206f14:	413b06bb          	subw	a3,s6,s3
    80206f18:	84b6                	mv	s1,a3
    80206f1a:	2681                	sext.w	a3,a3
    80206f1c:	0007861b          	sext.w	a2,a5
    80206f20:	fad674e3          	bgeu	a2,a3,80206ec8 <ewrite+0x88>
    80206f24:	84be                	mv	s1,a5
    80206f26:	b74d                	j	80206ec8 <ewrite+0x88>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206f28:	89da                	mv	s3,s6
    80206f2a:	a015                	j	80206f4e <ewrite+0x10e>
        return -1;
    80206f2c:	557d                	li	a0,-1
}
    80206f2e:	8082                	ret
        return -1;
    80206f30:	557d                	li	a0,-1
    80206f32:	a005                	j	80206f52 <ewrite+0x112>
    80206f34:	557d                	li	a0,-1
    80206f36:	a831                	j	80206f52 <ewrite+0x112>
    80206f38:	557d                	li	a0,-1
    80206f3a:	a821                	j	80206f52 <ewrite+0x112>
        if(off > entry->file_size) {
    80206f3c:	108aa783          	lw	a5,264(s5)
    80206f40:	0127f763          	bgeu	a5,s2,80206f4e <ewrite+0x10e>
            entry->file_size = off;
    80206f44:	112aa423          	sw	s2,264(s5)
            entry->dirty = 1;
    80206f48:	4785                	li	a5,1
    80206f4a:	10fa8aa3          	sb	a5,277(s5)
    return tot;
    80206f4e:	0009851b          	sext.w	a0,s3
}
    80206f52:	60e6                	ld	ra,88(sp)
    80206f54:	6446                	ld	s0,80(sp)
    80206f56:	64a6                	ld	s1,72(sp)
    80206f58:	6906                	ld	s2,64(sp)
    80206f5a:	79e2                	ld	s3,56(sp)
    80206f5c:	7a42                	ld	s4,48(sp)
    80206f5e:	7aa2                	ld	s5,40(sp)
    80206f60:	7b02                	ld	s6,32(sp)
    80206f62:	6be2                	ld	s7,24(sp)
    80206f64:	6c42                	ld	s8,16(sp)
    80206f66:	6ca2                	ld	s9,8(sp)
    80206f68:	6125                	addi	sp,sp,96
    80206f6a:	8082                	ret

0000000080206f6c <formatname>:
{
    80206f6c:	7179                	addi	sp,sp,-48
    80206f6e:	f406                	sd	ra,40(sp)
    80206f70:	f022                	sd	s0,32(sp)
    80206f72:	ec26                	sd	s1,24(sp)
    80206f74:	e84a                	sd	s2,16(sp)
    80206f76:	e44e                	sd	s3,8(sp)
    80206f78:	e052                	sd	s4,0(sp)
    80206f7a:	1800                	addi	s0,sp,48
    80206f7c:	84aa                	mv	s1,a0
    while (*name == ' ' || *name == '.') { name++; }
    80206f7e:	02000793          	li	a5,32
    80206f82:	02e00713          	li	a4,46
    80206f86:	a011                	j	80206f8a <formatname+0x1e>
    80206f88:	0485                	addi	s1,s1,1
    80206f8a:	0004c583          	lbu	a1,0(s1)
    80206f8e:	fef58de3          	beq	a1,a5,80206f88 <formatname+0x1c>
    80206f92:	fee58be3          	beq	a1,a4,80206f88 <formatname+0x1c>
    for (p = name; *p; p++) {
    80206f96:	c1b9                	beqz	a1,80206fdc <formatname+0x70>
    80206f98:	8926                	mv	s2,s1
        if (c < 0x20 || strchr(illegal, c)) {
    80206f9a:	49fd                	li	s3,31
    80206f9c:	00007a17          	auipc	s4,0x7
    80206fa0:	0fca0a13          	addi	s4,s4,252 # 8020e098 <illegal.1661>
    80206fa4:	02b9fe63          	bgeu	s3,a1,80206fe0 <formatname+0x74>
    80206fa8:	8552                	mv	a0,s4
    80206faa:	ffffa097          	auipc	ra,0xffffa
    80206fae:	a24080e7          	jalr	-1500(ra) # 802009ce <strchr>
    80206fb2:	e121                	bnez	a0,80206ff2 <formatname+0x86>
    for (p = name; *p; p++) {
    80206fb4:	0905                	addi	s2,s2,1
    80206fb6:	00094583          	lbu	a1,0(s2)
    80206fba:	f5ed                	bnez	a1,80206fa4 <formatname+0x38>
        if (*p != ' ') {
    80206fbc:	02000693          	li	a3,32
    80206fc0:	874a                	mv	a4,s2
    while (p-- > name) {
    80206fc2:	0124fb63          	bgeu	s1,s2,80206fd8 <formatname+0x6c>
        if (*p != ' ') {
    80206fc6:	197d                	addi	s2,s2,-1
    80206fc8:	00094783          	lbu	a5,0(s2)
    80206fcc:	fed78ae3          	beq	a5,a3,80206fc0 <formatname+0x54>
            p[1] = '\0';
    80206fd0:	00070023          	sb	zero,0(a4)
            break;
    80206fd4:	8526                	mv	a0,s1
    80206fd6:	a031                	j	80206fe2 <formatname+0x76>
    80206fd8:	8526                	mv	a0,s1
    80206fda:	a021                	j	80206fe2 <formatname+0x76>
    for (p = name; *p; p++) {
    80206fdc:	8526                	mv	a0,s1
    80206fde:	a011                	j	80206fe2 <formatname+0x76>
            return 0;
    80206fe0:	4501                	li	a0,0
}
    80206fe2:	70a2                	ld	ra,40(sp)
    80206fe4:	7402                	ld	s0,32(sp)
    80206fe6:	64e2                	ld	s1,24(sp)
    80206fe8:	6942                	ld	s2,16(sp)
    80206fea:	69a2                	ld	s3,8(sp)
    80206fec:	6a02                	ld	s4,0(sp)
    80206fee:	6145                	addi	sp,sp,48
    80206ff0:	8082                	ret
            return 0;
    80206ff2:	4501                	li	a0,0
    80206ff4:	b7fd                	j	80206fe2 <formatname+0x76>

0000000080206ff6 <cal_checksum>:
{
    80206ff6:	1141                	addi	sp,sp,-16
    80206ff8:	e422                	sd	s0,8(sp)
    80206ffa:	0800                	addi	s0,sp,16
    80206ffc:	87aa                	mv	a5,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    80206ffe:	00b50613          	addi	a2,a0,11
    uint8 sum = 0;
    80207002:	4501                	li	a0,0
        sum = ((sum & 1) ? 0x80 : 0) + (sum >> 1) + *shortname++;
    80207004:	0075171b          	slliw	a4,a0,0x7
    80207008:	0785                	addi	a5,a5,1
    8020700a:	0015551b          	srliw	a0,a0,0x1
    8020700e:	fff7c683          	lbu	a3,-1(a5) # fffffff <_entry-0x70200001>
    80207012:	9d35                	addw	a0,a0,a3
    80207014:	953a                	add	a0,a0,a4
    80207016:	0ff57513          	andi	a0,a0,255
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    8020701a:	fef615e3          	bne	a2,a5,80207004 <cal_checksum+0xe>
}
    8020701e:	6422                	ld	s0,8(sp)
    80207020:	0141                	addi	sp,sp,16
    80207022:	8082                	ret

0000000080207024 <emake>:
{
    80207024:	7131                	addi	sp,sp,-192
    80207026:	fd06                	sd	ra,184(sp)
    80207028:	f922                	sd	s0,176(sp)
    8020702a:	f526                	sd	s1,168(sp)
    8020702c:	f14a                	sd	s2,160(sp)
    8020702e:	ed4e                	sd	s3,152(sp)
    80207030:	e952                	sd	s4,144(sp)
    80207032:	e556                	sd	s5,136(sp)
    80207034:	e15a                	sd	s6,128(sp)
    80207036:	fcde                	sd	s7,120(sp)
    80207038:	f8e2                	sd	s8,112(sp)
    8020703a:	f4e6                	sd	s9,104(sp)
    8020703c:	f0ea                	sd	s10,96(sp)
    8020703e:	ecee                	sd	s11,88(sp)
    80207040:	0180                	addi	s0,sp,192
    if (!(dp->attribute & ATTR_DIRECTORY))
    80207042:	10054783          	lbu	a5,256(a0)
    80207046:	8bc1                	andi	a5,a5,16
    80207048:	c3d5                	beqz	a5,802070ec <emake+0xc8>
    8020704a:	8b2a                	mv	s6,a0
    8020704c:	8d2e                	mv	s10,a1
    8020704e:	8cb2                	mv	s9,a2
    if (off % sizeof(union dentry))
    80207050:	01f67793          	andi	a5,a2,31
    80207054:	e7c5                	bnez	a5,802070fc <emake+0xd8>
    memset(&de, 0, sizeof(de));
    80207056:	02000613          	li	a2,32
    8020705a:	4581                	li	a1,0
    8020705c:	f7040513          	addi	a0,s0,-144
    80207060:	ffff9097          	auipc	ra,0xffff9
    80207064:	704080e7          	jalr	1796(ra) # 80200764 <memset>
    if (off <= 32) {
    80207068:	02000793          	li	a5,32
    8020706c:	0b97ec63          	bltu	a5,s9,80207124 <emake+0x100>
        if (off == 0) {
    80207070:	080c9e63          	bnez	s9,8020710c <emake+0xe8>
            strncpy(de.sne.name, ".          ", sizeof(de.sne.name));
    80207074:	462d                	li	a2,11
    80207076:	00004597          	auipc	a1,0x4
    8020707a:	dea58593          	addi	a1,a1,-534 # 8020ae60 <digits+0xae0>
    8020707e:	f7040513          	addi	a0,s0,-144
    80207082:	ffff9097          	auipc	ra,0xffff9
    80207086:	7fa080e7          	jalr	2042(ra) # 8020087c <strncpy>
        de.sne.attr = ATTR_DIRECTORY;
    8020708a:	47c1                	li	a5,16
    8020708c:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);        // first clus high 16 bits
    80207090:	104d2783          	lw	a5,260(s10)
    80207094:	0107d71b          	srliw	a4,a5,0x10
    80207098:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);       // low 16 bits
    8020709c:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = 0;                                       // filesize is updated in eupdate()
    802070a0:	f8042623          	sw	zero,-116(s0)
        off = reloc_clus(dp, off, 1);
    802070a4:	4605                	li	a2,1
    802070a6:	85e6                	mv	a1,s9
    802070a8:	855a                	mv	a0,s6
    802070aa:	fffff097          	auipc	ra,0xfffff
    802070ae:	688080e7          	jalr	1672(ra) # 80206732 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    802070b2:	02000793          	li	a5,32
    802070b6:	0005071b          	sext.w	a4,a0
    802070ba:	f7040693          	addi	a3,s0,-144
    802070be:	4601                	li	a2,0
    802070c0:	4585                	li	a1,1
    802070c2:	10cb2503          	lw	a0,268(s6)
    802070c6:	fffff097          	auipc	ra,0xfffff
    802070ca:	776080e7          	jalr	1910(ra) # 8020683c <rw_clus>
}
    802070ce:	70ea                	ld	ra,184(sp)
    802070d0:	744a                	ld	s0,176(sp)
    802070d2:	74aa                	ld	s1,168(sp)
    802070d4:	790a                	ld	s2,160(sp)
    802070d6:	69ea                	ld	s3,152(sp)
    802070d8:	6a4a                	ld	s4,144(sp)
    802070da:	6aaa                	ld	s5,136(sp)
    802070dc:	6b0a                	ld	s6,128(sp)
    802070de:	7be6                	ld	s7,120(sp)
    802070e0:	7c46                	ld	s8,112(sp)
    802070e2:	7ca6                	ld	s9,104(sp)
    802070e4:	7d06                	ld	s10,96(sp)
    802070e6:	6de6                	ld	s11,88(sp)
    802070e8:	6129                	addi	sp,sp,192
    802070ea:	8082                	ret
        panic("emake: not dir");
    802070ec:	00004517          	auipc	a0,0x4
    802070f0:	d4c50513          	addi	a0,a0,-692 # 8020ae38 <digits+0xab8>
    802070f4:	ffff9097          	auipc	ra,0xffff9
    802070f8:	04e080e7          	jalr	78(ra) # 80200142 <panic>
        panic("emake: not aligned");
    802070fc:	00004517          	auipc	a0,0x4
    80207100:	d4c50513          	addi	a0,a0,-692 # 8020ae48 <digits+0xac8>
    80207104:	ffff9097          	auipc	ra,0xffff9
    80207108:	03e080e7          	jalr	62(ra) # 80200142 <panic>
            strncpy(de.sne.name, "..         ", sizeof(de.sne.name));
    8020710c:	462d                	li	a2,11
    8020710e:	00004597          	auipc	a1,0x4
    80207112:	d6258593          	addi	a1,a1,-670 # 8020ae70 <digits+0xaf0>
    80207116:	f7040513          	addi	a0,s0,-144
    8020711a:	ffff9097          	auipc	ra,0xffff9
    8020711e:	762080e7          	jalr	1890(ra) # 8020087c <strncpy>
    80207122:	b7a5                	j	8020708a <emake+0x66>
        int entcnt = (strlen(ep->filename) + CHAR_LONG_NAME - 1) / CHAR_LONG_NAME;   // count of l-n-entries, rounds up
    80207124:	896a                	mv	s2,s10
    80207126:	856a                	mv	a0,s10
    80207128:	ffff9097          	auipc	ra,0xffff9
    8020712c:	7c4080e7          	jalr	1988(ra) # 802008ec <strlen>
    80207130:	f4a43823          	sd	a0,-176(s0)
    80207134:	00c5071b          	addiw	a4,a0,12
    80207138:	47b5                	li	a5,13
    8020713a:	02f747bb          	divw	a5,a4,a5
    8020713e:	f4f42c23          	sw	a5,-168(s0)
    80207142:	00078d9b          	sext.w	s11,a5
        memset(shortname, 0, sizeof(shortname));
    80207146:	4631                	li	a2,12
    80207148:	4581                	li	a1,0
    8020714a:	f6040513          	addi	a0,s0,-160
    8020714e:	ffff9097          	auipc	ra,0xffff9
    80207152:	616080e7          	jalr	1558(ra) # 80200764 <memset>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80207156:	856a                	mv	a0,s10
    80207158:	ffff9097          	auipc	ra,0xffff9
    8020715c:	794080e7          	jalr	1940(ra) # 802008ec <strlen>
    80207160:	fff5079b          	addiw	a5,a0,-1
    80207164:	0407c063          	bltz	a5,802071a4 <emake+0x180>
    80207168:	97ea                	add	a5,a5,s10
    8020716a:	ffed0693          	addi	a3,s10,-2
    8020716e:	96aa                	add	a3,a3,a0
    80207170:	fff5071b          	addiw	a4,a0,-1
    80207174:	1702                	slli	a4,a4,0x20
    80207176:	9301                	srli	a4,a4,0x20
    80207178:	8e99                	sub	a3,a3,a4
        if (name[j] == '.') {
    8020717a:	02e00613          	li	a2,46
    8020717e:	89be                	mv	s3,a5
    80207180:	0007c703          	lbu	a4,0(a5)
    80207184:	00c70663          	beq	a4,a2,80207190 <emake+0x16c>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80207188:	17fd                	addi	a5,a5,-1
    8020718a:	fed79ae3          	bne	a5,a3,8020717e <emake+0x15a>
    char c, *p = name;
    8020718e:	89ea                	mv	s3,s10
        shortname[i++] = c;
    80207190:	4481                	li	s1,0
        if (i == 8 && p) {
    80207192:	4aa1                	li	s5,8
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80207194:	4ba9                	li	s7,10
        if (c == '.') {
    80207196:	02e00c13          	li	s8,46
                memset(shortname + i, ' ', 8 - i);
    8020719a:	f6040793          	addi	a5,s0,-160
    8020719e:	f4f43423          	sd	a5,-184(s0)
    802071a2:	a0f1                	j	8020726e <emake+0x24a>
    char c, *p = name;
    802071a4:	89ea                	mv	s3,s10
    802071a6:	b7ed                	j	80207190 <emake+0x16c>
        if (i == 8 && p) {
    802071a8:	22098163          	beqz	s3,802073ca <emake+0x3a6>
            if (p + 1 < name) { break; }            // no '.'
    802071ac:	0985                	addi	s3,s3,1
    802071ae:	0949f763          	bgeu	s3,s4,8020723c <emake+0x218>
    802071b2:	f6040793          	addi	a5,s0,-160
    802071b6:	97a6                	add	a5,a5,s1
        shortname[i++] = ' ';
    802071b8:	02000693          	li	a3,32
    while (i < CHAR_SHORT_NAME) {
    802071bc:	4729                	li	a4,10
        shortname[i++] = ' ';
    802071be:	2485                	addiw	s1,s1,1
    802071c0:	00d78023          	sb	a3,0(a5)
    while (i < CHAR_SHORT_NAME) {
    802071c4:	0785                	addi	a5,a5,1
    802071c6:	fe975ce3          	bge	a4,s1,802071be <emake+0x19a>
        de.lne.checksum = cal_checksum((uchar *)shortname);
    802071ca:	f6040513          	addi	a0,s0,-160
    802071ce:	00000097          	auipc	ra,0x0
    802071d2:	e28080e7          	jalr	-472(ra) # 80206ff6 <cal_checksum>
    802071d6:	f6a40ea3          	sb	a0,-131(s0)
        de.lne.attr = ATTR_LONG_NAME;
    802071da:	47bd                	li	a5,15
    802071dc:	f6f40da3          	sb	a5,-133(s0)
        for (int i = entcnt; i > 0; i--) {
    802071e0:	f5043783          	ld	a5,-176(s0)
    802071e4:	0ef05f63          	blez	a5,802072e2 <emake+0x2be>
    802071e8:	f5842783          	lw	a5,-168(s0)
    802071ec:	37fd                	addiw	a5,a5,-1
    802071ee:	f4f42423          	sw	a5,-184(s0)
    802071f2:	00179b9b          	slliw	s7,a5,0x1
    802071f6:	00fb8bbb          	addw	s7,s7,a5
    802071fa:	002b9b9b          	slliw	s7,s7,0x2
    802071fe:	00fb8bbb          	addw	s7,s7,a5
    80207202:	9bea                	add	s7,s7,s10
    80207204:	8a6e                	mv	s4,s11
    80207206:	8c66                	mv	s8,s9
            uint8 *w = (uint8 *)de.lne.name1;
    80207208:	f7140793          	addi	a5,s0,-143
    8020720c:	f4f43c23          	sd	a5,-168(s0)
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    80207210:	597d                	li	s2,-1
                switch (j) {
    80207212:	44ad                	li	s1,11
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80207214:	f7e40a93          	addi	s5,s0,-130
                switch (j) {
    80207218:	f8c40993          	addi	s3,s0,-116
    8020721c:	aa41                	j	802073ac <emake+0x388>
            if (name > p) {                    // last '.'
    8020721e:	0549f563          	bgeu	s3,s4,80207268 <emake+0x244>
                memset(shortname + i, ' ', 8 - i);
    80207222:	4621                	li	a2,8
    80207224:	9e05                	subw	a2,a2,s1
    80207226:	02000593          	li	a1,32
    8020722a:	f4843783          	ld	a5,-184(s0)
    8020722e:	00978533          	add	a0,a5,s1
    80207232:	ffff9097          	auipc	ra,0xffff9
    80207236:	532080e7          	jalr	1330(ra) # 80200764 <memset>
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    8020723a:	89d2                	mv	s3,s4
        shortname[i++] = c;
    8020723c:	8a4e                	mv	s4,s3
    8020723e:	84d6                	mv	s1,s5
    80207240:	4981                	li	s3,0
    80207242:	a02d                	j	8020726c <emake+0x248>
            if (strchr(illegal, c) != NULL) {
    80207244:	85ca                	mv	a1,s2
    80207246:	00007517          	auipc	a0,0x7
    8020724a:	e6250513          	addi	a0,a0,-414 # 8020e0a8 <illegal.1677>
    8020724e:	ffff9097          	auipc	ra,0xffff9
    80207252:	780080e7          	jalr	1920(ra) # 802009ce <strchr>
    80207256:	c119                	beqz	a0,8020725c <emake+0x238>
                c = '_';
    80207258:	05f00913          	li	s2,95
        shortname[i++] = c;
    8020725c:	f9040793          	addi	a5,s0,-112
    80207260:	97a6                	add	a5,a5,s1
    80207262:	fd278823          	sb	s2,-48(a5)
    80207266:	2485                	addiw	s1,s1,1
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80207268:	f69bc1e3          	blt	s7,s1,802071ca <emake+0x1a6>
        shortname[i++] = c;
    8020726c:	8952                	mv	s2,s4
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    8020726e:	00190a13          	addi	s4,s2,1
    80207272:	00094903          	lbu	s2,0(s2)
    80207276:	02090563          	beqz	s2,802072a0 <emake+0x27c>
        if (i == 8 && p) {
    8020727a:	f35487e3          	beq	s1,s5,802071a8 <emake+0x184>
        if (c == ' ') { continue; }
    8020727e:	02000793          	li	a5,32
    80207282:	fef903e3          	beq	s2,a5,80207268 <emake+0x244>
        if (c == '.') {
    80207286:	f9890ce3          	beq	s2,s8,8020721e <emake+0x1fa>
        if (c >= 'a' && c <= 'z') {
    8020728a:	f9f9079b          	addiw	a5,s2,-97
    8020728e:	0ff7f793          	andi	a5,a5,255
    80207292:	4765                	li	a4,25
    80207294:	faf768e3          	bltu	a4,a5,80207244 <emake+0x220>
            c += 'A' - 'a';
    80207298:	3901                	addiw	s2,s2,-32
    8020729a:	0ff97913          	andi	s2,s2,255
    8020729e:	bf7d                	j	8020725c <emake+0x238>
    while (i < CHAR_SHORT_NAME) {
    802072a0:	47a9                	li	a5,10
    802072a2:	f097d8e3          	bge	a5,s1,802071b2 <emake+0x18e>
    802072a6:	b715                	j	802071ca <emake+0x1a6>
                de.lne.order |= LAST_LONG_ENTRY;
    802072a8:	0407e793          	ori	a5,a5,64
    802072ac:	f6f40823          	sb	a5,-144(s0)
    802072b0:	a221                	j	802073b8 <emake+0x394>
                    if ((*w++ = *p++) == 0) {
    802072b2:	0005c683          	lbu	a3,0(a1)
    802072b6:	00d78023          	sb	a3,0(a5)
                        end = 1;
    802072ba:	0016b693          	seqz	a3,a3
                    *w++ = 0;
    802072be:	000780a3          	sb	zero,1(a5)
    802072c2:	0789                	addi	a5,a5,2
                    if ((*w++ = *p++) == 0) {
    802072c4:	0585                	addi	a1,a1,1
    802072c6:	a04d                	j	80207368 <emake+0x344>
    802072c8:	020c8c9b          	addiw	s9,s9,32
    802072cc:	4781                	li	a5,0
    802072ce:	f5043703          	ld	a4,-176(s0)
    802072d2:	00e05663          	blez	a4,802072de <emake+0x2ba>
    802072d6:	f4842783          	lw	a5,-184(s0)
    802072da:	0057979b          	slliw	a5,a5,0x5
    802072de:	01978cbb          	addw	s9,a5,s9
        memset(&de, 0, sizeof(de));
    802072e2:	02000613          	li	a2,32
    802072e6:	4581                	li	a1,0
    802072e8:	f7040493          	addi	s1,s0,-144
    802072ec:	8526                	mv	a0,s1
    802072ee:	ffff9097          	auipc	ra,0xffff9
    802072f2:	476080e7          	jalr	1142(ra) # 80200764 <memset>
        strncpy(de.sne.name, shortname, sizeof(de.sne.name));
    802072f6:	462d                	li	a2,11
    802072f8:	f6040593          	addi	a1,s0,-160
    802072fc:	8526                	mv	a0,s1
    802072fe:	ffff9097          	auipc	ra,0xffff9
    80207302:	57e080e7          	jalr	1406(ra) # 8020087c <strncpy>
        de.sne.attr = ep->attribute;
    80207306:	100d4783          	lbu	a5,256(s10)
    8020730a:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);      // first clus high 16 bits
    8020730e:	104d2783          	lw	a5,260(s10)
    80207312:	0107d71b          	srliw	a4,a5,0x10
    80207316:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);     // low 16 bits
    8020731a:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = ep->file_size;                         // filesize is updated in eupdate()
    8020731e:	108d2783          	lw	a5,264(s10)
    80207322:	f8f42623          	sw	a5,-116(s0)
        off = reloc_clus(dp, off, 1);
    80207326:	4605                	li	a2,1
    80207328:	85e6                	mv	a1,s9
    8020732a:	855a                	mv	a0,s6
    8020732c:	fffff097          	auipc	ra,0xfffff
    80207330:	406080e7          	jalr	1030(ra) # 80206732 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80207334:	02000793          	li	a5,32
    80207338:	0005071b          	sext.w	a4,a0
    8020733c:	86a6                	mv	a3,s1
    8020733e:	4601                	li	a2,0
    80207340:	4585                	li	a1,1
    80207342:	10cb2503          	lw	a0,268(s6)
    80207346:	fffff097          	auipc	ra,0xfffff
    8020734a:	4f6080e7          	jalr	1270(ra) # 8020683c <rw_clus>
}
    8020734e:	b341                	j	802070ce <emake+0xaa>
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80207350:	87d6                	mv	a5,s5
    80207352:	a011                	j	80207356 <emake+0x332>
                switch (j) {
    80207354:	87ce                	mv	a5,s3
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80207356:	2705                	addiw	a4,a4,1
    80207358:	fff7061b          	addiw	a2,a4,-1
                if (end) {
    8020735c:	dab9                	beqz	a3,802072b2 <emake+0x28e>
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    8020735e:	01278023          	sb	s2,0(a5)
                    *w++ = 0xff;
    80207362:	012780a3          	sb	s2,1(a5)
    80207366:	0789                	addi	a5,a5,2
                switch (j) {
    80207368:	fea604e3          	beq	a2,a0,80207350 <emake+0x32c>
    8020736c:	fe9604e3          	beq	a2,s1,80207354 <emake+0x330>
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80207370:	0007061b          	sext.w	a2,a4
    80207374:	fec851e3          	bge	a6,a2,80207356 <emake+0x332>
            uint off2 = reloc_clus(dp, off, 1);
    80207378:	4605                	li	a2,1
    8020737a:	85e2                	mv	a1,s8
    8020737c:	855a                	mv	a0,s6
    8020737e:	fffff097          	auipc	ra,0xfffff
    80207382:	3b4080e7          	jalr	948(ra) # 80206732 <reloc_clus>
            rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off2, sizeof(de));
    80207386:	02000793          	li	a5,32
    8020738a:	0005071b          	sext.w	a4,a0
    8020738e:	f7040693          	addi	a3,s0,-144
    80207392:	4601                	li	a2,0
    80207394:	4585                	li	a1,1
    80207396:	10cb2503          	lw	a0,268(s6)
    8020739a:	fffff097          	auipc	ra,0xfffff
    8020739e:	4a2080e7          	jalr	1186(ra) # 8020683c <rw_clus>
            off += sizeof(de);
    802073a2:	020c0c1b          	addiw	s8,s8,32
        for (int i = entcnt; i > 0; i--) {
    802073a6:	1bcd                	addi	s7,s7,-13
    802073a8:	f34050e3          	blez	s4,802072c8 <emake+0x2a4>
            if ((de.lne.order = i) == entcnt) {
    802073ac:	0ffa7793          	andi	a5,s4,255
    802073b0:	eefd8ce3          	beq	s11,a5,802072a8 <emake+0x284>
    802073b4:	f6f40823          	sb	a5,-144(s0)
            char *p = ep->filename + (i - 1) * CHAR_LONG_NAME;
    802073b8:	3a7d                	addiw	s4,s4,-1
    802073ba:	85de                	mv	a1,s7
    802073bc:	4709                	li	a4,2
            int end = 0;
    802073be:	4681                	li	a3,0
            uint8 *w = (uint8 *)de.lne.name1;
    802073c0:	f5843783          	ld	a5,-168(s0)
                switch (j) {
    802073c4:	4515                	li	a0,5
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    802073c6:	4835                	li	a6,13
    802073c8:	bf41                	j	80207358 <emake+0x334>
        if (c == ' ') { continue; }
    802073ca:	02000793          	li	a5,32
    802073ce:	eaf91ce3          	bne	s2,a5,80207286 <emake+0x262>
    802073d2:	bd69                	j	8020726c <emake+0x248>

00000000802073d4 <edup>:
{
    802073d4:	1101                	addi	sp,sp,-32
    802073d6:	ec06                	sd	ra,24(sp)
    802073d8:	e822                	sd	s0,16(sp)
    802073da:	e426                	sd	s1,8(sp)
    802073dc:	1000                	addi	s0,sp,32
    802073de:	84aa                	mv	s1,a0
    if (entry != 0) {
    802073e0:	c515                	beqz	a0,8020740c <edup+0x38>
        acquire(&ecache.lock);
    802073e2:	0002f517          	auipc	a0,0x2f
    802073e6:	cc650513          	addi	a0,a0,-826 # 802360a8 <ecache>
    802073ea:	ffff9097          	auipc	ra,0xffff9
    802073ee:	2de080e7          	jalr	734(ra) # 802006c8 <acquire>
        entry->ref++;
    802073f2:	1184a783          	lw	a5,280(s1)
    802073f6:	2785                	addiw	a5,a5,1
    802073f8:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    802073fc:	0002f517          	auipc	a0,0x2f
    80207400:	cac50513          	addi	a0,a0,-852 # 802360a8 <ecache>
    80207404:	ffff9097          	auipc	ra,0xffff9
    80207408:	318080e7          	jalr	792(ra) # 8020071c <release>
}
    8020740c:	8526                	mv	a0,s1
    8020740e:	60e2                	ld	ra,24(sp)
    80207410:	6442                	ld	s0,16(sp)
    80207412:	64a2                	ld	s1,8(sp)
    80207414:	6105                	addi	sp,sp,32
    80207416:	8082                	ret

0000000080207418 <eupdate>:
    if (!entry->dirty || entry->valid != 1) { return; }
    80207418:	11554783          	lbu	a5,277(a0)
    8020741c:	c3e5                	beqz	a5,802074fc <eupdate+0xe4>
{
    8020741e:	711d                	addi	sp,sp,-96
    80207420:	ec86                	sd	ra,88(sp)
    80207422:	e8a2                	sd	s0,80(sp)
    80207424:	e4a6                	sd	s1,72(sp)
    80207426:	e0ca                	sd	s2,64(sp)
    80207428:	fc4e                	sd	s3,56(sp)
    8020742a:	1080                	addi	s0,sp,96
    8020742c:	84aa                	mv	s1,a0
    if (!entry->dirty || entry->valid != 1) { return; }
    8020742e:	11651703          	lh	a4,278(a0)
    80207432:	4785                	li	a5,1
    80207434:	00f70963          	beq	a4,a5,80207446 <eupdate+0x2e>
}
    80207438:	60e6                	ld	ra,88(sp)
    8020743a:	6446                	ld	s0,80(sp)
    8020743c:	64a6                	ld	s1,72(sp)
    8020743e:	6906                	ld	s2,64(sp)
    80207440:	79e2                	ld	s3,56(sp)
    80207442:	6125                	addi	sp,sp,96
    80207444:	8082                	ret
    uint entcnt = 0;
    80207446:	fc042623          	sw	zero,-52(s0)
    uint32 off = reloc_clus(entry->parent, entry->off, 0);
    8020744a:	4601                	li	a2,0
    8020744c:	11c52583          	lw	a1,284(a0)
    80207450:	12053503          	ld	a0,288(a0)
    80207454:	fffff097          	auipc	ra,0xfffff
    80207458:	2de080e7          	jalr	734(ra) # 80206732 <reloc_clus>
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off, 1);
    8020745c:	1204b803          	ld	a6,288(s1)
    80207460:	4785                	li	a5,1
    80207462:	0005071b          	sext.w	a4,a0
    80207466:	fcc40693          	addi	a3,s0,-52
    8020746a:	4601                	li	a2,0
    8020746c:	4581                	li	a1,0
    8020746e:	10c82503          	lw	a0,268(a6)
    80207472:	fffff097          	auipc	ra,0xfffff
    80207476:	3ca080e7          	jalr	970(ra) # 8020683c <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    8020747a:	fcc42583          	lw	a1,-52(s0)
    8020747e:	fbf5f593          	andi	a1,a1,-65
    80207482:	fcb42623          	sw	a1,-52(s0)
    off = reloc_clus(entry->parent, entry->off + (entcnt << 5), 0);
    80207486:	0055959b          	slliw	a1,a1,0x5
    8020748a:	11c4a783          	lw	a5,284(s1)
    8020748e:	4601                	li	a2,0
    80207490:	9dbd                	addw	a1,a1,a5
    80207492:	1204b503          	ld	a0,288(s1)
    80207496:	fffff097          	auipc	ra,0xfffff
    8020749a:	29c080e7          	jalr	668(ra) # 80206732 <reloc_clus>
    8020749e:	0005099b          	sext.w	s3,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64)&de, off, sizeof(de));
    802074a2:	1204b503          	ld	a0,288(s1)
    802074a6:	02000793          	li	a5,32
    802074aa:	874e                	mv	a4,s3
    802074ac:	fa840913          	addi	s2,s0,-88
    802074b0:	86ca                	mv	a3,s2
    802074b2:	4601                	li	a2,0
    802074b4:	4581                	li	a1,0
    802074b6:	10c52503          	lw	a0,268(a0)
    802074ba:	fffff097          	auipc	ra,0xfffff
    802074be:	382080e7          	jalr	898(ra) # 8020683c <rw_clus>
    de.sne.fst_clus_hi = (uint16)(entry->first_clus >> 16);
    802074c2:	1044a783          	lw	a5,260(s1)
    802074c6:	0107d71b          	srliw	a4,a5,0x10
    802074ca:	fae41e23          	sh	a4,-68(s0)
    de.sne.fst_clus_lo = (uint16)(entry->first_clus & 0xffff);
    802074ce:	fcf41123          	sh	a5,-62(s0)
    de.sne.file_size = entry->file_size;
    802074d2:	1084a783          	lw	a5,264(s1)
    802074d6:	fcf42223          	sw	a5,-60(s0)
    rw_clus(entry->parent->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    802074da:	1204b503          	ld	a0,288(s1)
    802074de:	02000793          	li	a5,32
    802074e2:	874e                	mv	a4,s3
    802074e4:	86ca                	mv	a3,s2
    802074e6:	4601                	li	a2,0
    802074e8:	4585                	li	a1,1
    802074ea:	10c52503          	lw	a0,268(a0)
    802074ee:	fffff097          	auipc	ra,0xfffff
    802074f2:	34e080e7          	jalr	846(ra) # 8020683c <rw_clus>
    entry->dirty = 0;
    802074f6:	10048aa3          	sb	zero,277(s1)
    802074fa:	bf3d                	j	80207438 <eupdate+0x20>
    802074fc:	8082                	ret

00000000802074fe <eremove>:
    if (entry->valid != 1) { return; }
    802074fe:	11651703          	lh	a4,278(a0)
    80207502:	4785                	li	a5,1
    80207504:	00f70363          	beq	a4,a5,8020750a <eremove+0xc>
    80207508:	8082                	ret
{
    8020750a:	715d                	addi	sp,sp,-80
    8020750c:	e486                	sd	ra,72(sp)
    8020750e:	e0a2                	sd	s0,64(sp)
    80207510:	fc26                	sd	s1,56(sp)
    80207512:	f84a                	sd	s2,48(sp)
    80207514:	f44e                	sd	s3,40(sp)
    80207516:	f052                	sd	s4,32(sp)
    80207518:	ec56                	sd	s5,24(sp)
    8020751a:	0880                	addi	s0,sp,80
    8020751c:	89aa                	mv	s3,a0
    uint entcnt = 0;
    8020751e:	fa042e23          	sw	zero,-68(s0)
    uint32 off = entry->off;
    80207522:	11c52a03          	lw	s4,284(a0)
    uint32 off2 = reloc_clus(entry->parent, off, 0);
    80207526:	4601                	li	a2,0
    80207528:	85d2                	mv	a1,s4
    8020752a:	12053503          	ld	a0,288(a0)
    8020752e:	fffff097          	auipc	ra,0xfffff
    80207532:	204080e7          	jalr	516(ra) # 80206732 <reloc_clus>
    80207536:	0005049b          	sext.w	s1,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off2, 1);
    8020753a:	1209b503          	ld	a0,288(s3)
    8020753e:	4785                	li	a5,1
    80207540:	8726                	mv	a4,s1
    80207542:	fbc40693          	addi	a3,s0,-68
    80207546:	4601                	li	a2,0
    80207548:	4581                	li	a1,0
    8020754a:	10c52503          	lw	a0,268(a0)
    8020754e:	fffff097          	auipc	ra,0xfffff
    80207552:	2ee080e7          	jalr	750(ra) # 8020683c <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    80207556:	fbc42783          	lw	a5,-68(s0)
    8020755a:	fbf7f793          	andi	a5,a5,-65
    8020755e:	faf42e23          	sw	a5,-68(s0)
    uint8 flag = EMPTY_ENTRY;
    80207562:	5795                	li	a5,-27
    80207564:	faf40da3          	sb	a5,-69(s0)
    for (int i = 0; i <= entcnt; i++) {
    80207568:	4901                	li	s2,0
        rw_clus(entry->parent->cur_clus, 1, 0, (uint64) &flag, off2, 1);
    8020756a:	fbb40a93          	addi	s5,s0,-69
    8020756e:	1209b503          	ld	a0,288(s3)
    80207572:	4785                	li	a5,1
    80207574:	8726                	mv	a4,s1
    80207576:	86d6                	mv	a3,s5
    80207578:	4601                	li	a2,0
    8020757a:	4585                	li	a1,1
    8020757c:	10c52503          	lw	a0,268(a0)
    80207580:	fffff097          	auipc	ra,0xfffff
    80207584:	2bc080e7          	jalr	700(ra) # 8020683c <rw_clus>
        off += 32;
    80207588:	020a0a1b          	addiw	s4,s4,32
        off2 = reloc_clus(entry->parent, off, 0);
    8020758c:	4601                	li	a2,0
    8020758e:	85d2                	mv	a1,s4
    80207590:	1209b503          	ld	a0,288(s3)
    80207594:	fffff097          	auipc	ra,0xfffff
    80207598:	19e080e7          	jalr	414(ra) # 80206732 <reloc_clus>
    8020759c:	0005049b          	sext.w	s1,a0
    for (int i = 0; i <= entcnt; i++) {
    802075a0:	0019079b          	addiw	a5,s2,1
    802075a4:	0007891b          	sext.w	s2,a5
    802075a8:	fbc42703          	lw	a4,-68(s0)
    802075ac:	fd2771e3          	bgeu	a4,s2,8020756e <eremove+0x70>
    entry->valid = -1;
    802075b0:	57fd                	li	a5,-1
    802075b2:	10f99b23          	sh	a5,278(s3)
}
    802075b6:	60a6                	ld	ra,72(sp)
    802075b8:	6406                	ld	s0,64(sp)
    802075ba:	74e2                	ld	s1,56(sp)
    802075bc:	7942                	ld	s2,48(sp)
    802075be:	79a2                	ld	s3,40(sp)
    802075c0:	7a02                	ld	s4,32(sp)
    802075c2:	6ae2                	ld	s5,24(sp)
    802075c4:	6161                	addi	sp,sp,80
    802075c6:	8082                	ret

00000000802075c8 <etrunc>:
{
    802075c8:	7179                	addi	sp,sp,-48
    802075ca:	f406                	sd	ra,40(sp)
    802075cc:	f022                	sd	s0,32(sp)
    802075ce:	ec26                	sd	s1,24(sp)
    802075d0:	e84a                	sd	s2,16(sp)
    802075d2:	e44e                	sd	s3,8(sp)
    802075d4:	e052                	sd	s4,0(sp)
    802075d6:	1800                	addi	s0,sp,48
    802075d8:	8a2a                	mv	s4,a0
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    802075da:	10452483          	lw	s1,260(a0)
    802075de:	ffe4871b          	addiw	a4,s1,-2
    802075e2:	100007b7          	lui	a5,0x10000
    802075e6:	17d5                	addi	a5,a5,-11
    802075e8:	02e7e663          	bltu	a5,a4,80207614 <etrunc+0x4c>
    802075ec:	89be                	mv	s3,a5
        uint32 next = read_fat(clus);
    802075ee:	0004891b          	sext.w	s2,s1
    802075f2:	8526                	mv	a0,s1
    802075f4:	fffff097          	auipc	ra,0xfffff
    802075f8:	f0a080e7          	jalr	-246(ra) # 802064fe <read_fat>
    802075fc:	0005049b          	sext.w	s1,a0
    write_fat(cluster, 0);
    80207600:	4581                	li	a1,0
    80207602:	854a                	mv	a0,s2
    80207604:	fffff097          	auipc	ra,0xfffff
    80207608:	0ae080e7          	jalr	174(ra) # 802066b2 <write_fat>
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    8020760c:	ffe4879b          	addiw	a5,s1,-2
    80207610:	fcf9ffe3          	bgeu	s3,a5,802075ee <etrunc+0x26>
    entry->file_size = 0;
    80207614:	100a2423          	sw	zero,264(s4)
    entry->first_clus = 0;
    80207618:	100a2223          	sw	zero,260(s4)
    entry->dirty = 1;
    8020761c:	4785                	li	a5,1
    8020761e:	10fa0aa3          	sb	a5,277(s4)
}
    80207622:	70a2                	ld	ra,40(sp)
    80207624:	7402                	ld	s0,32(sp)
    80207626:	64e2                	ld	s1,24(sp)
    80207628:	6942                	ld	s2,16(sp)
    8020762a:	69a2                	ld	s3,8(sp)
    8020762c:	6a02                	ld	s4,0(sp)
    8020762e:	6145                	addi	sp,sp,48
    80207630:	8082                	ret

0000000080207632 <elock>:
{
    80207632:	1141                	addi	sp,sp,-16
    80207634:	e406                	sd	ra,8(sp)
    80207636:	e022                	sd	s0,0(sp)
    80207638:	0800                	addi	s0,sp,16
    if (entry == 0 || entry->ref < 1)
    8020763a:	cd19                	beqz	a0,80207658 <elock+0x26>
    8020763c:	11852783          	lw	a5,280(a0)
    80207640:	00f05c63          	blez	a5,80207658 <elock+0x26>
    acquiresleep(&entry->lock);
    80207644:	13850513          	addi	a0,a0,312
    80207648:	ffffc097          	auipc	ra,0xffffc
    8020764c:	7d4080e7          	jalr	2004(ra) # 80203e1c <acquiresleep>
}
    80207650:	60a2                	ld	ra,8(sp)
    80207652:	6402                	ld	s0,0(sp)
    80207654:	0141                	addi	sp,sp,16
    80207656:	8082                	ret
        panic("elock");
    80207658:	00004517          	auipc	a0,0x4
    8020765c:	82850513          	addi	a0,a0,-2008 # 8020ae80 <digits+0xb00>
    80207660:	ffff9097          	auipc	ra,0xffff9
    80207664:	ae2080e7          	jalr	-1310(ra) # 80200142 <panic>

0000000080207668 <eunlock>:
{
    80207668:	1101                	addi	sp,sp,-32
    8020766a:	ec06                	sd	ra,24(sp)
    8020766c:	e822                	sd	s0,16(sp)
    8020766e:	e426                	sd	s1,8(sp)
    80207670:	e04a                	sd	s2,0(sp)
    80207672:	1000                	addi	s0,sp,32
    if (entry == 0 || !holdingsleep(&entry->lock) || entry->ref < 1)
    80207674:	c90d                	beqz	a0,802076a6 <eunlock+0x3e>
    80207676:	84aa                	mv	s1,a0
    80207678:	13850913          	addi	s2,a0,312
    8020767c:	854a                	mv	a0,s2
    8020767e:	ffffd097          	auipc	ra,0xffffd
    80207682:	838080e7          	jalr	-1992(ra) # 80203eb6 <holdingsleep>
    80207686:	c105                	beqz	a0,802076a6 <eunlock+0x3e>
    80207688:	1184a783          	lw	a5,280(s1)
    8020768c:	00f05d63          	blez	a5,802076a6 <eunlock+0x3e>
    releasesleep(&entry->lock);
    80207690:	854a                	mv	a0,s2
    80207692:	ffffc097          	auipc	ra,0xffffc
    80207696:	7e0080e7          	jalr	2016(ra) # 80203e72 <releasesleep>
}
    8020769a:	60e2                	ld	ra,24(sp)
    8020769c:	6442                	ld	s0,16(sp)
    8020769e:	64a2                	ld	s1,8(sp)
    802076a0:	6902                	ld	s2,0(sp)
    802076a2:	6105                	addi	sp,sp,32
    802076a4:	8082                	ret
        panic("eunlock");
    802076a6:	00003517          	auipc	a0,0x3
    802076aa:	7e250513          	addi	a0,a0,2018 # 8020ae88 <digits+0xb08>
    802076ae:	ffff9097          	auipc	ra,0xffff9
    802076b2:	a94080e7          	jalr	-1388(ra) # 80200142 <panic>

00000000802076b6 <eput>:
{
    802076b6:	1101                	addi	sp,sp,-32
    802076b8:	ec06                	sd	ra,24(sp)
    802076ba:	e822                	sd	s0,16(sp)
    802076bc:	e426                	sd	s1,8(sp)
    802076be:	e04a                	sd	s2,0(sp)
    802076c0:	1000                	addi	s0,sp,32
    802076c2:	84aa                	mv	s1,a0
    acquire(&ecache.lock);
    802076c4:	0002f517          	auipc	a0,0x2f
    802076c8:	9e450513          	addi	a0,a0,-1564 # 802360a8 <ecache>
    802076cc:	ffff9097          	auipc	ra,0xffff9
    802076d0:	ffc080e7          	jalr	-4(ra) # 802006c8 <acquire>
    if (entry != &root && entry->valid != 0 && entry->ref == 1) {
    802076d4:	0002f797          	auipc	a5,0x2f
    802076d8:	86c78793          	addi	a5,a5,-1940 # 80235f40 <root>
    802076dc:	00f48a63          	beq	s1,a5,802076f0 <eput+0x3a>
    802076e0:	11649783          	lh	a5,278(s1)
    802076e4:	c791                	beqz	a5,802076f0 <eput+0x3a>
    802076e6:	1184a703          	lw	a4,280(s1)
    802076ea:	4785                	li	a5,1
    802076ec:	02f70563          	beq	a4,a5,80207716 <eput+0x60>
    entry->ref--;
    802076f0:	1184a783          	lw	a5,280(s1)
    802076f4:	37fd                	addiw	a5,a5,-1
    802076f6:	10f4ac23          	sw	a5,280(s1)
    release(&ecache.lock);
    802076fa:	0002f517          	auipc	a0,0x2f
    802076fe:	9ae50513          	addi	a0,a0,-1618 # 802360a8 <ecache>
    80207702:	ffff9097          	auipc	ra,0xffff9
    80207706:	01a080e7          	jalr	26(ra) # 8020071c <release>
}
    8020770a:	60e2                	ld	ra,24(sp)
    8020770c:	6442                	ld	s0,16(sp)
    8020770e:	64a2                	ld	s1,8(sp)
    80207710:	6902                	ld	s2,0(sp)
    80207712:	6105                	addi	sp,sp,32
    80207714:	8082                	ret
        acquiresleep(&entry->lock);
    80207716:	13848913          	addi	s2,s1,312
    8020771a:	854a                	mv	a0,s2
    8020771c:	ffffc097          	auipc	ra,0xffffc
    80207720:	700080e7          	jalr	1792(ra) # 80203e1c <acquiresleep>
        entry->next->prev = entry->prev;
    80207724:	1284b703          	ld	a4,296(s1)
    80207728:	1304b783          	ld	a5,304(s1)
    8020772c:	12f73823          	sd	a5,304(a4)
        entry->prev->next = entry->next;
    80207730:	1284b703          	ld	a4,296(s1)
    80207734:	12e7b423          	sd	a4,296(a5)
        entry->next = root.next;
    80207738:	0002e797          	auipc	a5,0x2e
    8020773c:	7e078793          	addi	a5,a5,2016 # 80235f18 <fat>
    80207740:	1507b703          	ld	a4,336(a5)
    80207744:	12e4b423          	sd	a4,296(s1)
        entry->prev = &root;
    80207748:	0002e697          	auipc	a3,0x2e
    8020774c:	7f868693          	addi	a3,a3,2040 # 80235f40 <root>
    80207750:	12d4b823          	sd	a3,304(s1)
        root.next->prev = entry;
    80207754:	12973823          	sd	s1,304(a4)
        root.next = entry;
    80207758:	1497b823          	sd	s1,336(a5)
        release(&ecache.lock);
    8020775c:	0002f517          	auipc	a0,0x2f
    80207760:	94c50513          	addi	a0,a0,-1716 # 802360a8 <ecache>
    80207764:	ffff9097          	auipc	ra,0xffff9
    80207768:	fb8080e7          	jalr	-72(ra) # 8020071c <release>
        if (entry->valid == -1) {       // this means some one has called eremove()
    8020776c:	11649703          	lh	a4,278(s1)
    80207770:	57fd                	li	a5,-1
    80207772:	06f70863          	beq	a4,a5,802077e2 <eput+0x12c>
            elock(entry->parent);
    80207776:	1204b503          	ld	a0,288(s1)
    8020777a:	00000097          	auipc	ra,0x0
    8020777e:	eb8080e7          	jalr	-328(ra) # 80207632 <elock>
            eupdate(entry);
    80207782:	8526                	mv	a0,s1
    80207784:	00000097          	auipc	ra,0x0
    80207788:	c94080e7          	jalr	-876(ra) # 80207418 <eupdate>
            eunlock(entry->parent);
    8020778c:	1204b503          	ld	a0,288(s1)
    80207790:	00000097          	auipc	ra,0x0
    80207794:	ed8080e7          	jalr	-296(ra) # 80207668 <eunlock>
        releasesleep(&entry->lock);
    80207798:	854a                	mv	a0,s2
    8020779a:	ffffc097          	auipc	ra,0xffffc
    8020779e:	6d8080e7          	jalr	1752(ra) # 80203e72 <releasesleep>
        struct dirent *eparent = entry->parent;
    802077a2:	1204b903          	ld	s2,288(s1)
        acquire(&ecache.lock);
    802077a6:	0002f517          	auipc	a0,0x2f
    802077aa:	90250513          	addi	a0,a0,-1790 # 802360a8 <ecache>
    802077ae:	ffff9097          	auipc	ra,0xffff9
    802077b2:	f1a080e7          	jalr	-230(ra) # 802006c8 <acquire>
        entry->ref--;
    802077b6:	1184a783          	lw	a5,280(s1)
    802077ba:	37fd                	addiw	a5,a5,-1
    802077bc:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    802077c0:	0002f517          	auipc	a0,0x2f
    802077c4:	8e850513          	addi	a0,a0,-1816 # 802360a8 <ecache>
    802077c8:	ffff9097          	auipc	ra,0xffff9
    802077cc:	f54080e7          	jalr	-172(ra) # 8020071c <release>
        if (entry->ref == 0) {
    802077d0:	1184a783          	lw	a5,280(s1)
    802077d4:	fb9d                	bnez	a5,8020770a <eput+0x54>
            eput(eparent);
    802077d6:	854a                	mv	a0,s2
    802077d8:	00000097          	auipc	ra,0x0
    802077dc:	ede080e7          	jalr	-290(ra) # 802076b6 <eput>
    802077e0:	b72d                	j	8020770a <eput+0x54>
            etrunc(entry);
    802077e2:	8526                	mv	a0,s1
    802077e4:	00000097          	auipc	ra,0x0
    802077e8:	de4080e7          	jalr	-540(ra) # 802075c8 <etrunc>
    802077ec:	b775                	j	80207798 <eput+0xe2>

00000000802077ee <estat>:
{
    802077ee:	1101                	addi	sp,sp,-32
    802077f0:	ec06                	sd	ra,24(sp)
    802077f2:	e822                	sd	s0,16(sp)
    802077f4:	e426                	sd	s1,8(sp)
    802077f6:	e04a                	sd	s2,0(sp)
    802077f8:	1000                	addi	s0,sp,32
    802077fa:	892a                	mv	s2,a0
    802077fc:	84ae                	mv	s1,a1
    strncpy(st->name, de->filename, STAT_MAX_NAME);
    802077fe:	02000613          	li	a2,32
    80207802:	85aa                	mv	a1,a0
    80207804:	8526                	mv	a0,s1
    80207806:	ffff9097          	auipc	ra,0xffff9
    8020780a:	076080e7          	jalr	118(ra) # 8020087c <strncpy>
    st->type = (de->attribute & ATTR_DIRECTORY) ? T_DIR : T_FILE;
    8020780e:	10094783          	lbu	a5,256(s2)
    80207812:	8bc1                	andi	a5,a5,16
    80207814:	0017b793          	seqz	a5,a5
    80207818:	0785                	addi	a5,a5,1
    8020781a:	02f49423          	sh	a5,40(s1)
    st->dev = de->dev;
    8020781e:	11494783          	lbu	a5,276(s2)
    80207822:	d0dc                	sw	a5,36(s1)
    st->size = de->file_size;
    80207824:	10896783          	lwu	a5,264(s2)
    80207828:	f89c                	sd	a5,48(s1)
}
    8020782a:	60e2                	ld	ra,24(sp)
    8020782c:	6442                	ld	s0,16(sp)
    8020782e:	64a2                	ld	s1,8(sp)
    80207830:	6902                	ld	s2,0(sp)
    80207832:	6105                	addi	sp,sp,32
    80207834:	8082                	ret

0000000080207836 <enext>:
 * @return  -1      meet the end of dir
 *          0       find empty slots
 *          1       find a file with all its entries
 */
int enext(struct dirent *dp, struct dirent *ep, uint off, int *count)
{
    80207836:	7119                	addi	sp,sp,-128
    80207838:	fc86                	sd	ra,120(sp)
    8020783a:	f8a2                	sd	s0,112(sp)
    8020783c:	f4a6                	sd	s1,104(sp)
    8020783e:	f0ca                	sd	s2,96(sp)
    80207840:	ecce                	sd	s3,88(sp)
    80207842:	e8d2                	sd	s4,80(sp)
    80207844:	e4d6                	sd	s5,72(sp)
    80207846:	e0da                	sd	s6,64(sp)
    80207848:	fc5e                	sd	s7,56(sp)
    8020784a:	f862                	sd	s8,48(sp)
    8020784c:	f466                	sd	s9,40(sp)
    8020784e:	f06a                	sd	s10,32(sp)
    80207850:	0100                	addi	s0,sp,128
    if (!(dp->attribute & ATTR_DIRECTORY))
    80207852:	10054783          	lbu	a5,256(a0)
    80207856:	8bc1                	andi	a5,a5,16
    80207858:	cf9d                	beqz	a5,80207896 <enext+0x60>
    8020785a:	892a                	mv	s2,a0
    8020785c:	8aae                	mv	s5,a1
    8020785e:	84b2                	mv	s1,a2
    80207860:	8a36                	mv	s4,a3
        panic("enext not dir");
    if (ep->valid)
    80207862:	11659783          	lh	a5,278(a1)
    80207866:	e3a1                	bnez	a5,802078a6 <enext+0x70>
        panic("enext ep valid");
    if (off % 32)
    80207868:	01f67793          	andi	a5,a2,31
    8020786c:	e7a9                	bnez	a5,802078b6 <enext+0x80>
        panic("enext not align");
    if (dp->valid != 1) { return -1; }
    8020786e:	11651703          	lh	a4,278(a0)
    80207872:	4785                	li	a5,1
    80207874:	557d                	li	a0,-1
    80207876:	04f70863          	beq	a4,a5,802078c6 <enext+0x90>
            read_entry_info(ep, &de);
            return 1;
        }
    }
    return -1;
}
    8020787a:	70e6                	ld	ra,120(sp)
    8020787c:	7446                	ld	s0,112(sp)
    8020787e:	74a6                	ld	s1,104(sp)
    80207880:	7906                	ld	s2,96(sp)
    80207882:	69e6                	ld	s3,88(sp)
    80207884:	6a46                	ld	s4,80(sp)
    80207886:	6aa6                	ld	s5,72(sp)
    80207888:	6b06                	ld	s6,64(sp)
    8020788a:	7be2                	ld	s7,56(sp)
    8020788c:	7c42                	ld	s8,48(sp)
    8020788e:	7ca2                	ld	s9,40(sp)
    80207890:	7d02                	ld	s10,32(sp)
    80207892:	6109                	addi	sp,sp,128
    80207894:	8082                	ret
        panic("enext not dir");
    80207896:	00003517          	auipc	a0,0x3
    8020789a:	5fa50513          	addi	a0,a0,1530 # 8020ae90 <digits+0xb10>
    8020789e:	ffff9097          	auipc	ra,0xffff9
    802078a2:	8a4080e7          	jalr	-1884(ra) # 80200142 <panic>
        panic("enext ep valid");
    802078a6:	00003517          	auipc	a0,0x3
    802078aa:	5fa50513          	addi	a0,a0,1530 # 8020aea0 <digits+0xb20>
    802078ae:	ffff9097          	auipc	ra,0xffff9
    802078b2:	894080e7          	jalr	-1900(ra) # 80200142 <panic>
        panic("enext not align");
    802078b6:	00003517          	auipc	a0,0x3
    802078ba:	5fa50513          	addi	a0,a0,1530 # 8020aeb0 <digits+0xb30>
    802078be:	ffff9097          	auipc	ra,0xffff9
    802078c2:	884080e7          	jalr	-1916(ra) # 80200142 <panic>
    memset(ep->filename, 0, FAT32_MAX_FILENAME + 1);
    802078c6:	8d2e                	mv	s10,a1
    802078c8:	10000613          	li	a2,256
    802078cc:	4581                	li	a1,0
    802078ce:	8556                	mv	a0,s5
    802078d0:	ffff9097          	auipc	ra,0xffff9
    802078d4:	e94080e7          	jalr	-364(ra) # 80200764 <memset>
    int cnt = 0;
    802078d8:	4b01                	li	s6,0
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    802078da:	5bfd                	li	s7,-1
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    802078dc:	f8040993          	addi	s3,s0,-128
        if (de.lne.order == EMPTY_ENTRY) {
    802078e0:	0e500c13          	li	s8,229
        if (de.lne.attr == ATTR_LONG_NAME) {
    802078e4:	4cbd                	li	s9,15
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    802078e6:	a03d                	j	80207914 <enext+0xde>
            cnt++;
    802078e8:	2b05                	addiw	s6,s6,1
            continue;
    802078ea:	a01d                	j	80207910 <enext+0xda>
            *count = cnt;
    802078ec:	016a2023          	sw	s6,0(s4)
            return 0;
    802078f0:	4501                	li	a0,0
    802078f2:	b761                	j	8020787a <enext+0x44>
            read_entry_name(ep->filename + (lcnt - 1) * CHAR_LONG_NAME, &de);
    802078f4:	fff5079b          	addiw	a5,a0,-1
    802078f8:	0017951b          	slliw	a0,a5,0x1
    802078fc:	9d3d                	addw	a0,a0,a5
    802078fe:	0025151b          	slliw	a0,a0,0x2
    80207902:	9d3d                	addw	a0,a0,a5
    80207904:	85ce                	mv	a1,s3
    80207906:	956a                	add	a0,a0,s10
    80207908:	fffff097          	auipc	ra,0xfffff
    8020790c:	18e080e7          	jalr	398(ra) # 80206a96 <read_entry_name>
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80207910:	0204849b          	addiw	s1,s1,32
    80207914:	4601                	li	a2,0
    80207916:	85a6                	mv	a1,s1
    80207918:	854a                	mv	a0,s2
    8020791a:	fffff097          	auipc	ra,0xfffff
    8020791e:	e18080e7          	jalr	-488(ra) # 80206732 <reloc_clus>
    80207922:	f5750ce3          	beq	a0,s7,8020787a <enext+0x44>
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    80207926:	02000793          	li	a5,32
    8020792a:	0005071b          	sext.w	a4,a0
    8020792e:	86ce                	mv	a3,s3
    80207930:	4601                	li	a2,0
    80207932:	4581                	li	a1,0
    80207934:	10c92503          	lw	a0,268(s2)
    80207938:	fffff097          	auipc	ra,0xfffff
    8020793c:	f04080e7          	jalr	-252(ra) # 8020683c <rw_clus>
    80207940:	2501                	sext.w	a0,a0
    80207942:	02000793          	li	a5,32
    80207946:	06f51c63          	bne	a0,a5,802079be <enext+0x188>
    8020794a:	f8044783          	lbu	a5,-128(s0)
    8020794e:	cbb5                	beqz	a5,802079c2 <enext+0x18c>
        if (de.lne.order == EMPTY_ENTRY) {
    80207950:	f9878ce3          	beq	a5,s8,802078e8 <enext+0xb2>
        } else if (cnt) {
    80207954:	f80b1ce3          	bnez	s6,802078ec <enext+0xb6>
        if (de.lne.attr == ATTR_LONG_NAME) {
    80207958:	f8b44703          	lbu	a4,-117(s0)
    8020795c:	01971d63          	bne	a4,s9,80207976 <enext+0x140>
            int lcnt = de.lne.order & ~LAST_LONG_ENTRY;
    80207960:	0bf7f513          	andi	a0,a5,191
            if (de.lne.order & LAST_LONG_ENTRY) {
    80207964:	0407f793          	andi	a5,a5,64
    80207968:	d7d1                	beqz	a5,802078f4 <enext+0xbe>
                *count = lcnt + 1;                              // plus the s-n-e;
    8020796a:	0015079b          	addiw	a5,a0,1
    8020796e:	00fa2023          	sw	a5,0(s4)
                count = 0;
    80207972:	4a01                	li	s4,0
    80207974:	b741                	j	802078f4 <enext+0xbe>
            if (count) {
    80207976:	000a0c63          	beqz	s4,8020798e <enext+0x158>
                *count = 1;
    8020797a:	4785                	li	a5,1
    8020797c:	00fa2023          	sw	a5,0(s4)
                read_entry_name(ep->filename, &de);
    80207980:	f8040593          	addi	a1,s0,-128
    80207984:	8556                	mv	a0,s5
    80207986:	fffff097          	auipc	ra,0xfffff
    8020798a:	110080e7          	jalr	272(ra) # 80206a96 <read_entry_name>
    entry->attribute = d->sne.attr;
    8020798e:	f8b44783          	lbu	a5,-117(s0)
    80207992:	10fa8023          	sb	a5,256(s5)
    entry->first_clus = ((uint32)d->sne.fst_clus_hi << 16) | d->sne.fst_clus_lo;
    80207996:	f9445783          	lhu	a5,-108(s0)
    8020799a:	0107979b          	slliw	a5,a5,0x10
    8020799e:	f9a45703          	lhu	a4,-102(s0)
    802079a2:	8fd9                	or	a5,a5,a4
    802079a4:	2781                	sext.w	a5,a5
    802079a6:	10faa223          	sw	a5,260(s5)
    entry->file_size = d->sne.file_size;
    802079aa:	f9c42703          	lw	a4,-100(s0)
    802079ae:	10eaa423          	sw	a4,264(s5)
    entry->cur_clus = entry->first_clus;
    802079b2:	10faa623          	sw	a5,268(s5)
    entry->clus_cnt = 0;
    802079b6:	100aa823          	sw	zero,272(s5)
            return 1;
    802079ba:	4505                	li	a0,1
}
    802079bc:	bd7d                	j	8020787a <enext+0x44>
            return -1;
    802079be:	557d                	li	a0,-1
    802079c0:	bd6d                	j	8020787a <enext+0x44>
    802079c2:	557d                	li	a0,-1
    802079c4:	bd5d                	j	8020787a <enext+0x44>

00000000802079c6 <dirlookup>:
 * @param   dp          entry of a directory file
 * @param   filename    target filename
 * @param   poff        offset of proper empty entry slots from the beginning of the dir
 */
struct dirent *dirlookup(struct dirent *dp, char *filename, uint *poff)
{
    802079c6:	711d                	addi	sp,sp,-96
    802079c8:	ec86                	sd	ra,88(sp)
    802079ca:	e8a2                	sd	s0,80(sp)
    802079cc:	e4a6                	sd	s1,72(sp)
    802079ce:	e0ca                	sd	s2,64(sp)
    802079d0:	fc4e                	sd	s3,56(sp)
    802079d2:	f852                	sd	s4,48(sp)
    802079d4:	f456                	sd	s5,40(sp)
    802079d6:	f05a                	sd	s6,32(sp)
    802079d8:	ec5e                	sd	s7,24(sp)
    802079da:	1080                	addi	s0,sp,96
    if (!(dp->attribute & ATTR_DIRECTORY))
    802079dc:	10054783          	lbu	a5,256(a0)
    802079e0:	8bc1                	andi	a5,a5,16
    802079e2:	cbb1                	beqz	a5,80207a36 <dirlookup+0x70>
    802079e4:	84aa                	mv	s1,a0
    802079e6:	89ae                	mv	s3,a1
    802079e8:	8ab2                	mv	s5,a2
        panic("dirlookup not DIR");
    if (strncmp(filename, ".", FAT32_MAX_FILENAME) == 0) {
    802079ea:	0ff00613          	li	a2,255
    802079ee:	00003597          	auipc	a1,0x3
    802079f2:	4ea58593          	addi	a1,a1,1258 # 8020aed8 <digits+0xb58>
    802079f6:	854e                	mv	a0,s3
    802079f8:	ffff9097          	auipc	ra,0xffff9
    802079fc:	e48080e7          	jalr	-440(ra) # 80200840 <strncmp>
    80207a00:	c139                	beqz	a0,80207a46 <dirlookup+0x80>
        return edup(dp);
    } else if (strncmp(filename, "..", FAT32_MAX_FILENAME) == 0) {
    80207a02:	0ff00613          	li	a2,255
    80207a06:	00003597          	auipc	a1,0x3
    80207a0a:	4da58593          	addi	a1,a1,1242 # 8020aee0 <digits+0xb60>
    80207a0e:	854e                	mv	a0,s3
    80207a10:	ffff9097          	auipc	ra,0xffff9
    80207a14:	e30080e7          	jalr	-464(ra) # 80200840 <strncmp>
    80207a18:	e125                	bnez	a0,80207a78 <dirlookup+0xb2>
        if (dp == &root) {
    80207a1a:	0002e797          	auipc	a5,0x2e
    80207a1e:	52678793          	addi	a5,a5,1318 # 80235f40 <root>
    80207a22:	04f48463          	beq	s1,a5,80207a6a <dirlookup+0xa4>
            return edup(&root);
        }
        return edup(dp->parent);
    80207a26:	1204b503          	ld	a0,288(s1)
    80207a2a:	00000097          	auipc	ra,0x0
    80207a2e:	9aa080e7          	jalr	-1622(ra) # 802073d4 <edup>
    80207a32:	892a                	mv	s2,a0
    80207a34:	a839                	j	80207a52 <dirlookup+0x8c>
        panic("dirlookup not DIR");
    80207a36:	00003517          	auipc	a0,0x3
    80207a3a:	48a50513          	addi	a0,a0,1162 # 8020aec0 <digits+0xb40>
    80207a3e:	ffff8097          	auipc	ra,0xffff8
    80207a42:	704080e7          	jalr	1796(ra) # 80200142 <panic>
        return edup(dp);
    80207a46:	8526                	mv	a0,s1
    80207a48:	00000097          	auipc	ra,0x0
    80207a4c:	98c080e7          	jalr	-1652(ra) # 802073d4 <edup>
    80207a50:	892a                	mv	s2,a0
    if (poff) {
        *poff = off;
    }
    eput(ep);
    return NULL;
}
    80207a52:	854a                	mv	a0,s2
    80207a54:	60e6                	ld	ra,88(sp)
    80207a56:	6446                	ld	s0,80(sp)
    80207a58:	64a6                	ld	s1,72(sp)
    80207a5a:	6906                	ld	s2,64(sp)
    80207a5c:	79e2                	ld	s3,56(sp)
    80207a5e:	7a42                	ld	s4,48(sp)
    80207a60:	7aa2                	ld	s5,40(sp)
    80207a62:	7b02                	ld	s6,32(sp)
    80207a64:	6be2                	ld	s7,24(sp)
    80207a66:	6125                	addi	sp,sp,96
    80207a68:	8082                	ret
            return edup(&root);
    80207a6a:	853e                	mv	a0,a5
    80207a6c:	00000097          	auipc	ra,0x0
    80207a70:	968080e7          	jalr	-1688(ra) # 802073d4 <edup>
    80207a74:	892a                	mv	s2,a0
    80207a76:	bff1                	j	80207a52 <dirlookup+0x8c>
    if (dp->valid != 1) {
    80207a78:	11649703          	lh	a4,278(s1)
    80207a7c:	4785                	li	a5,1
        return NULL;
    80207a7e:	4901                	li	s2,0
    if (dp->valid != 1) {
    80207a80:	fcf719e3          	bne	a4,a5,80207a52 <dirlookup+0x8c>
    struct dirent *ep = eget(dp, filename);
    80207a84:	85ce                	mv	a1,s3
    80207a86:	8526                	mv	a0,s1
    80207a88:	fffff097          	auipc	ra,0xfffff
    80207a8c:	f00080e7          	jalr	-256(ra) # 80206988 <eget>
    80207a90:	892a                	mv	s2,a0
    if (ep->valid == 1) { return ep; }                               // ecache hits
    80207a92:	11651703          	lh	a4,278(a0)
    80207a96:	4785                	li	a5,1
    80207a98:	faf70de3          	beq	a4,a5,80207a52 <dirlookup+0x8c>
    int len = strlen(filename);
    80207a9c:	854e                	mv	a0,s3
    80207a9e:	ffff9097          	auipc	ra,0xffff9
    80207aa2:	e4e080e7          	jalr	-434(ra) # 802008ec <strlen>
    int count = 0;
    80207aa6:	fa042623          	sw	zero,-84(s0)
    reloc_clus(dp, 0, 0);
    80207aaa:	4601                	li	a2,0
    80207aac:	4581                	li	a1,0
    80207aae:	8526                	mv	a0,s1
    80207ab0:	fffff097          	auipc	ra,0xfffff
    80207ab4:	c82080e7          	jalr	-894(ra) # 80206732 <reloc_clus>
    uint off = 0;
    80207ab8:	4a01                	li	s4,0
    while ((type = enext(dp, ep, off, &count) != -1)) {
    80207aba:	fac40b93          	addi	s7,s0,-84
    80207abe:	5b7d                	li	s6,-1
    80207ac0:	86de                	mv	a3,s7
    80207ac2:	8652                	mv	a2,s4
    80207ac4:	85ca                	mv	a1,s2
    80207ac6:	8526                	mv	a0,s1
    80207ac8:	00000097          	auipc	ra,0x0
    80207acc:	d6e080e7          	jalr	-658(ra) # 80207836 <enext>
    80207ad0:	03650f63          	beq	a0,s6,80207b0e <dirlookup+0x148>
        } else if (strncmp(filename, ep->filename, FAT32_MAX_FILENAME) == 0) {
    80207ad4:	0ff00613          	li	a2,255
    80207ad8:	85ca                	mv	a1,s2
    80207ada:	854e                	mv	a0,s3
    80207adc:	ffff9097          	auipc	ra,0xffff9
    80207ae0:	d64080e7          	jalr	-668(ra) # 80200840 <strncmp>
    80207ae4:	c901                	beqz	a0,80207af4 <dirlookup+0x12e>
        off += count << 5;
    80207ae6:	fac42783          	lw	a5,-84(s0)
    80207aea:	0057979b          	slliw	a5,a5,0x5
    80207aee:	01478a3b          	addw	s4,a5,s4
    80207af2:	b7f9                	j	80207ac0 <dirlookup+0xfa>
            ep->parent = edup(dp);
    80207af4:	8526                	mv	a0,s1
    80207af6:	00000097          	auipc	ra,0x0
    80207afa:	8de080e7          	jalr	-1826(ra) # 802073d4 <edup>
    80207afe:	12a93023          	sd	a0,288(s2)
            ep->off = off;
    80207b02:	11492e23          	sw	s4,284(s2)
            ep->valid = 1;
    80207b06:	4785                	li	a5,1
    80207b08:	10f91b23          	sh	a5,278(s2)
            return ep;
    80207b0c:	b799                	j	80207a52 <dirlookup+0x8c>
    if (poff) {
    80207b0e:	000a8463          	beqz	s5,80207b16 <dirlookup+0x150>
        *poff = off;
    80207b12:	014aa023          	sw	s4,0(s5)
    eput(ep);
    80207b16:	854a                	mv	a0,s2
    80207b18:	00000097          	auipc	ra,0x0
    80207b1c:	b9e080e7          	jalr	-1122(ra) # 802076b6 <eput>
    return NULL;
    80207b20:	4901                	li	s2,0
    80207b22:	bf05                	j	80207a52 <dirlookup+0x8c>

0000000080207b24 <ealloc>:
{
    80207b24:	7139                	addi	sp,sp,-64
    80207b26:	fc06                	sd	ra,56(sp)
    80207b28:	f822                	sd	s0,48(sp)
    80207b2a:	f426                	sd	s1,40(sp)
    80207b2c:	f04a                	sd	s2,32(sp)
    80207b2e:	ec4e                	sd	s3,24(sp)
    80207b30:	e852                	sd	s4,16(sp)
    80207b32:	0080                	addi	s0,sp,64
    80207b34:	892a                	mv	s2,a0
    if (!(dp->attribute & ATTR_DIRECTORY)) {
    80207b36:	10054783          	lbu	a5,256(a0)
    80207b3a:	8bc1                	andi	a5,a5,16
    80207b3c:	c7a9                	beqz	a5,80207b86 <ealloc+0x62>
    80207b3e:	852e                	mv	a0,a1
    80207b40:	8a32                	mv	s4,a2
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    80207b42:	11691703          	lh	a4,278(s2)
    80207b46:	4785                	li	a5,1
        return NULL;
    80207b48:	4481                	li	s1,0
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    80207b4a:	02f71563          	bne	a4,a5,80207b74 <ealloc+0x50>
    80207b4e:	fffff097          	auipc	ra,0xfffff
    80207b52:	41e080e7          	jalr	1054(ra) # 80206f6c <formatname>
    80207b56:	89aa                	mv	s3,a0
    80207b58:	10050663          	beqz	a0,80207c64 <ealloc+0x140>
    uint off = 0;
    80207b5c:	fc042623          	sw	zero,-52(s0)
    if ((ep = dirlookup(dp, name, &off)) != 0) {      // entry exists
    80207b60:	fcc40613          	addi	a2,s0,-52
    80207b64:	85aa                	mv	a1,a0
    80207b66:	854a                	mv	a0,s2
    80207b68:	00000097          	auipc	ra,0x0
    80207b6c:	e5e080e7          	jalr	-418(ra) # 802079c6 <dirlookup>
    80207b70:	84aa                	mv	s1,a0
    80207b72:	c115                	beqz	a0,80207b96 <ealloc+0x72>
}
    80207b74:	8526                	mv	a0,s1
    80207b76:	70e2                	ld	ra,56(sp)
    80207b78:	7442                	ld	s0,48(sp)
    80207b7a:	74a2                	ld	s1,40(sp)
    80207b7c:	7902                	ld	s2,32(sp)
    80207b7e:	69e2                	ld	s3,24(sp)
    80207b80:	6a42                	ld	s4,16(sp)
    80207b82:	6121                	addi	sp,sp,64
    80207b84:	8082                	ret
        panic("ealloc not dir");
    80207b86:	00003517          	auipc	a0,0x3
    80207b8a:	36250513          	addi	a0,a0,866 # 8020aee8 <digits+0xb68>
    80207b8e:	ffff8097          	auipc	ra,0xffff8
    80207b92:	5b4080e7          	jalr	1460(ra) # 80200142 <panic>
    ep = eget(dp, name);
    80207b96:	85ce                	mv	a1,s3
    80207b98:	854a                	mv	a0,s2
    80207b9a:	fffff097          	auipc	ra,0xfffff
    80207b9e:	dee080e7          	jalr	-530(ra) # 80206988 <eget>
    80207ba2:	84aa                	mv	s1,a0
    elock(ep);
    80207ba4:	00000097          	auipc	ra,0x0
    80207ba8:	a8e080e7          	jalr	-1394(ra) # 80207632 <elock>
    ep->attribute = attr;
    80207bac:	11448023          	sb	s4,256(s1)
    ep->file_size = 0;
    80207bb0:	1004a423          	sw	zero,264(s1)
    ep->first_clus = 0;
    80207bb4:	1004a223          	sw	zero,260(s1)
    ep->parent = edup(dp);
    80207bb8:	854a                	mv	a0,s2
    80207bba:	00000097          	auipc	ra,0x0
    80207bbe:	81a080e7          	jalr	-2022(ra) # 802073d4 <edup>
    80207bc2:	12a4b023          	sd	a0,288(s1)
    ep->off = off;
    80207bc6:	fcc42783          	lw	a5,-52(s0)
    80207bca:	10f4ae23          	sw	a5,284(s1)
    ep->clus_cnt = 0;
    80207bce:	1004a823          	sw	zero,272(s1)
    ep->cur_clus = 0;
    80207bd2:	1004a623          	sw	zero,268(s1)
    ep->dirty = 0;
    80207bd6:	10048aa3          	sb	zero,277(s1)
    strncpy(ep->filename, name, FAT32_MAX_FILENAME);
    80207bda:	0ff00613          	li	a2,255
    80207bde:	85ce                	mv	a1,s3
    80207be0:	8526                	mv	a0,s1
    80207be2:	ffff9097          	auipc	ra,0xffff9
    80207be6:	c9a080e7          	jalr	-870(ra) # 8020087c <strncpy>
    ep->filename[FAT32_MAX_FILENAME] = '\0';
    80207bea:	0e048fa3          	sb	zero,255(s1)
    if (attr == ATTR_DIRECTORY) {    // generate "." and ".." for ep
    80207bee:	47c1                	li	a5,16
    80207bf0:	02fa0963          	beq	s4,a5,80207c22 <ealloc+0xfe>
        ep->attribute |= ATTR_ARCHIVE;
    80207bf4:	1004c783          	lbu	a5,256(s1)
    80207bf8:	0207e793          	ori	a5,a5,32
    80207bfc:	10f48023          	sb	a5,256(s1)
    emake(dp, ep, off);
    80207c00:	fcc42603          	lw	a2,-52(s0)
    80207c04:	85a6                	mv	a1,s1
    80207c06:	854a                	mv	a0,s2
    80207c08:	fffff097          	auipc	ra,0xfffff
    80207c0c:	41c080e7          	jalr	1052(ra) # 80207024 <emake>
    ep->valid = 1;
    80207c10:	4785                	li	a5,1
    80207c12:	10f49b23          	sh	a5,278(s1)
    eunlock(ep);
    80207c16:	8526                	mv	a0,s1
    80207c18:	00000097          	auipc	ra,0x0
    80207c1c:	a50080e7          	jalr	-1456(ra) # 80207668 <eunlock>
    return ep;
    80207c20:	bf91                	j	80207b74 <ealloc+0x50>
        ep->attribute |= ATTR_DIRECTORY;
    80207c22:	1004c783          	lbu	a5,256(s1)
    80207c26:	0107e793          	ori	a5,a5,16
    80207c2a:	10f48023          	sb	a5,256(s1)
        ep->cur_clus = ep->first_clus = alloc_clus(dp->dev);
    80207c2e:	11494503          	lbu	a0,276(s2)
    80207c32:	fffff097          	auipc	ra,0xfffff
    80207c36:	940080e7          	jalr	-1728(ra) # 80206572 <alloc_clus>
    80207c3a:	2501                	sext.w	a0,a0
    80207c3c:	10a4a223          	sw	a0,260(s1)
    80207c40:	10a4a623          	sw	a0,268(s1)
        emake(ep, ep, 0);
    80207c44:	4601                	li	a2,0
    80207c46:	85a6                	mv	a1,s1
    80207c48:	8526                	mv	a0,s1
    80207c4a:	fffff097          	auipc	ra,0xfffff
    80207c4e:	3da080e7          	jalr	986(ra) # 80207024 <emake>
        emake(ep, dp, 32);
    80207c52:	02000613          	li	a2,32
    80207c56:	85ca                	mv	a1,s2
    80207c58:	8526                	mv	a0,s1
    80207c5a:	fffff097          	auipc	ra,0xfffff
    80207c5e:	3ca080e7          	jalr	970(ra) # 80207024 <emake>
    80207c62:	bf79                	j	80207c00 <ealloc+0xdc>
        return NULL;
    80207c64:	84aa                	mv	s1,a0
    80207c66:	b739                	j	80207b74 <ealloc+0x50>

0000000080207c68 <lookup_path>:
    return path;
}

// FAT32 version of namex in xv6's original file system.
static struct dirent *lookup_path(char *path, int parent, char *name)
{
    80207c68:	715d                	addi	sp,sp,-80
    80207c6a:	e486                	sd	ra,72(sp)
    80207c6c:	e0a2                	sd	s0,64(sp)
    80207c6e:	fc26                	sd	s1,56(sp)
    80207c70:	f84a                	sd	s2,48(sp)
    80207c72:	f44e                	sd	s3,40(sp)
    80207c74:	f052                	sd	s4,32(sp)
    80207c76:	ec56                	sd	s5,24(sp)
    80207c78:	e85a                	sd	s6,16(sp)
    80207c7a:	e45e                	sd	s7,8(sp)
    80207c7c:	e062                	sd	s8,0(sp)
    80207c7e:	0880                	addi	s0,sp,80
    80207c80:	892a                	mv	s2,a0
    80207c82:	8b2e                	mv	s6,a1
    80207c84:	8ab2                	mv	s5,a2
    struct dirent *entry, *next;
    if (*path == '/') {
    80207c86:	00054783          	lbu	a5,0(a0)
    80207c8a:	02f00713          	li	a4,47
    80207c8e:	02e78663          	beq	a5,a4,80207cba <lookup_path+0x52>
        entry = edup(&root);
    } else if (*path != '\0') {
        entry = edup(myproc()->cwd);
    } else {
        return NULL;
    80207c92:	4981                	li	s3,0
    } else if (*path != '\0') {
    80207c94:	cba1                	beqz	a5,80207ce4 <lookup_path+0x7c>
        entry = edup(myproc()->cwd);
    80207c96:	ffffa097          	auipc	ra,0xffffa
    80207c9a:	dca080e7          	jalr	-566(ra) # 80201a60 <myproc>
    80207c9e:	4d853503          	ld	a0,1240(a0)
    80207ca2:	fffff097          	auipc	ra,0xfffff
    80207ca6:	732080e7          	jalr	1842(ra) # 802073d4 <edup>
    80207caa:	89aa                	mv	s3,a0
    while (*path == '/') {
    80207cac:	02f00a13          	li	s4,47
    80207cb0:	0ff00b93          	li	s7,255
    80207cb4:	0ff00c13          	li	s8,255
    80207cb8:	a0dd                	j	80207d9e <lookup_path+0x136>
        entry = edup(&root);
    80207cba:	0002e517          	auipc	a0,0x2e
    80207cbe:	28650513          	addi	a0,a0,646 # 80235f40 <root>
    80207cc2:	fffff097          	auipc	ra,0xfffff
    80207cc6:	712080e7          	jalr	1810(ra) # 802073d4 <edup>
    80207cca:	89aa                	mv	s3,a0
    80207ccc:	b7c5                	j	80207cac <lookup_path+0x44>
    }
    while ((path = skipelem(path, name)) != 0) {
        elock(entry);
        if (!(entry->attribute & ATTR_DIRECTORY)) {
            eunlock(entry);
    80207cce:	854e                	mv	a0,s3
    80207cd0:	00000097          	auipc	ra,0x0
    80207cd4:	998080e7          	jalr	-1640(ra) # 80207668 <eunlock>
            eput(entry);
    80207cd8:	854e                	mv	a0,s3
    80207cda:	00000097          	auipc	ra,0x0
    80207cde:	9dc080e7          	jalr	-1572(ra) # 802076b6 <eput>
            return NULL;
    80207ce2:	4981                	li	s3,0
    if (parent) {
        eput(entry);
        return NULL;
    }
    return entry;
}
    80207ce4:	854e                	mv	a0,s3
    80207ce6:	60a6                	ld	ra,72(sp)
    80207ce8:	6406                	ld	s0,64(sp)
    80207cea:	74e2                	ld	s1,56(sp)
    80207cec:	7942                	ld	s2,48(sp)
    80207cee:	79a2                	ld	s3,40(sp)
    80207cf0:	7a02                	ld	s4,32(sp)
    80207cf2:	6ae2                	ld	s5,24(sp)
    80207cf4:	6b42                	ld	s6,16(sp)
    80207cf6:	6ba2                	ld	s7,8(sp)
    80207cf8:	6c02                	ld	s8,0(sp)
    80207cfa:	6161                	addi	sp,sp,80
    80207cfc:	8082                	ret
            eunlock(entry);
    80207cfe:	854e                	mv	a0,s3
    80207d00:	00000097          	auipc	ra,0x0
    80207d04:	968080e7          	jalr	-1688(ra) # 80207668 <eunlock>
            return entry;
    80207d08:	bff1                	j	80207ce4 <lookup_path+0x7c>
            eunlock(entry);
    80207d0a:	854e                	mv	a0,s3
    80207d0c:	00000097          	auipc	ra,0x0
    80207d10:	95c080e7          	jalr	-1700(ra) # 80207668 <eunlock>
            eput(entry);
    80207d14:	854e                	mv	a0,s3
    80207d16:	00000097          	auipc	ra,0x0
    80207d1a:	9a0080e7          	jalr	-1632(ra) # 802076b6 <eput>
            return NULL;
    80207d1e:	89ca                	mv	s3,s2
    80207d20:	b7d1                	j	80207ce4 <lookup_path+0x7c>
    int len = path - s;
    80207d22:	412487bb          	subw	a5,s1,s2
    if (len > FAT32_MAX_FILENAME) {
    80207d26:	863e                	mv	a2,a5
    80207d28:	00fbd363          	bge	s7,a5,80207d2e <lookup_path+0xc6>
    80207d2c:	8662                	mv	a2,s8
    80207d2e:	0006079b          	sext.w	a5,a2
    name[len] = 0;
    80207d32:	97d6                	add	a5,a5,s5
    80207d34:	00078023          	sb	zero,0(a5)
    memmove(name, s, len);
    80207d38:	2601                	sext.w	a2,a2
    80207d3a:	85ca                	mv	a1,s2
    80207d3c:	8556                	mv	a0,s5
    80207d3e:	ffff9097          	auipc	ra,0xffff9
    80207d42:	a86080e7          	jalr	-1402(ra) # 802007c4 <memmove>
    while (*path == '/') {
    80207d46:	0004c783          	lbu	a5,0(s1)
    80207d4a:	01479763          	bne	a5,s4,80207d58 <lookup_path+0xf0>
        path++;
    80207d4e:	0485                	addi	s1,s1,1
    while (*path == '/') {
    80207d50:	0004c783          	lbu	a5,0(s1)
    80207d54:	ff478de3          	beq	a5,s4,80207d4e <lookup_path+0xe6>
        elock(entry);
    80207d58:	854e                	mv	a0,s3
    80207d5a:	00000097          	auipc	ra,0x0
    80207d5e:	8d8080e7          	jalr	-1832(ra) # 80207632 <elock>
        if (!(entry->attribute & ATTR_DIRECTORY)) {
    80207d62:	1009c783          	lbu	a5,256(s3)
    80207d66:	8bc1                	andi	a5,a5,16
    80207d68:	d3bd                	beqz	a5,80207cce <lookup_path+0x66>
        if (parent && *path == '\0') {
    80207d6a:	000b0563          	beqz	s6,80207d74 <lookup_path+0x10c>
    80207d6e:	0004c783          	lbu	a5,0(s1)
    80207d72:	d7d1                	beqz	a5,80207cfe <lookup_path+0x96>
        if ((next = dirlookup(entry, name, 0)) == 0) {
    80207d74:	4601                	li	a2,0
    80207d76:	85d6                	mv	a1,s5
    80207d78:	854e                	mv	a0,s3
    80207d7a:	00000097          	auipc	ra,0x0
    80207d7e:	c4c080e7          	jalr	-948(ra) # 802079c6 <dirlookup>
    80207d82:	892a                	mv	s2,a0
    80207d84:	d159                	beqz	a0,80207d0a <lookup_path+0xa2>
        eunlock(entry);
    80207d86:	854e                	mv	a0,s3
    80207d88:	00000097          	auipc	ra,0x0
    80207d8c:	8e0080e7          	jalr	-1824(ra) # 80207668 <eunlock>
        eput(entry);
    80207d90:	854e                	mv	a0,s3
    80207d92:	00000097          	auipc	ra,0x0
    80207d96:	924080e7          	jalr	-1756(ra) # 802076b6 <eput>
        entry = next;
    80207d9a:	89ca                	mv	s3,s2
        eput(entry);
    80207d9c:	8926                	mv	s2,s1
    while (*path == '/') {
    80207d9e:	00094783          	lbu	a5,0(s2)
    80207da2:	03479363          	bne	a5,s4,80207dc8 <lookup_path+0x160>
        path++;
    80207da6:	0905                	addi	s2,s2,1
    while (*path == '/') {
    80207da8:	00094783          	lbu	a5,0(s2)
    80207dac:	ff478de3          	beq	a5,s4,80207da6 <lookup_path+0x13e>
    if (*path == 0) { return NULL; }
    80207db0:	cf89                	beqz	a5,80207dca <lookup_path+0x162>
        path++;
    80207db2:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    80207db4:	f74787e3          	beq	a5,s4,80207d22 <lookup_path+0xba>
        eput(entry);
    80207db8:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    80207dba:	d7a5                	beqz	a5,80207d22 <lookup_path+0xba>
        path++;
    80207dbc:	0485                	addi	s1,s1,1
    while (*path != '/' && *path != 0) {
    80207dbe:	0004c783          	lbu	a5,0(s1)
    80207dc2:	ff479ce3          	bne	a5,s4,80207dba <lookup_path+0x152>
    80207dc6:	bfb1                	j	80207d22 <lookup_path+0xba>
    if (*path == 0) { return NULL; }
    80207dc8:	fbe5                	bnez	a5,80207db8 <lookup_path+0x150>
    if (parent) {
    80207dca:	f00b0de3          	beqz	s6,80207ce4 <lookup_path+0x7c>
        eput(entry);
    80207dce:	854e                	mv	a0,s3
    80207dd0:	00000097          	auipc	ra,0x0
    80207dd4:	8e6080e7          	jalr	-1818(ra) # 802076b6 <eput>
        return NULL;
    80207dd8:	4981                	li	s3,0
    80207dda:	b729                	j	80207ce4 <lookup_path+0x7c>

0000000080207ddc <ename>:

struct dirent *ename(char *path)
{
    80207ddc:	716d                	addi	sp,sp,-272
    80207dde:	e606                	sd	ra,264(sp)
    80207de0:	e222                	sd	s0,256(sp)
    80207de2:	0a00                	addi	s0,sp,272
    char name[FAT32_MAX_FILENAME + 1];
    return lookup_path(path, 0, name);
    80207de4:	ef040613          	addi	a2,s0,-272
    80207de8:	4581                	li	a1,0
    80207dea:	00000097          	auipc	ra,0x0
    80207dee:	e7e080e7          	jalr	-386(ra) # 80207c68 <lookup_path>
}
    80207df2:	60b2                	ld	ra,264(sp)
    80207df4:	6412                	ld	s0,256(sp)
    80207df6:	6151                	addi	sp,sp,272
    80207df8:	8082                	ret

0000000080207dfa <enameparent>:

struct dirent *enameparent(char *path, char *name)
{
    80207dfa:	1141                	addi	sp,sp,-16
    80207dfc:	e406                	sd	ra,8(sp)
    80207dfe:	e022                	sd	s0,0(sp)
    80207e00:	0800                	addi	s0,sp,16
    80207e02:	862e                	mv	a2,a1
    return lookup_path(path, 1, name);
    80207e04:	4585                	li	a1,1
    80207e06:	00000097          	auipc	ra,0x0
    80207e0a:	e62080e7          	jalr	-414(ra) # 80207c68 <lookup_path>
}
    80207e0e:	60a2                	ld	ra,8(sp)
    80207e10:	6402                	ld	s0,0(sp)
    80207e12:	0141                	addi	sp,sp,16
    80207e14:	8082                	ret

0000000080207e16 <get_pa_of_entry>:
 * ep:      映射文件的第一个entry
 * off:     映射文件的偏移 这里先默认为0
 * len:     映射文件的长度
*/
uint64 get_pa_of_entry(struct dirent* ep,int off,int len)
{
    80207e16:	1101                	addi	sp,sp,-32
    80207e18:	ec06                	sd	ra,24(sp)
    80207e1a:	e822                	sd	s0,16(sp)
    80207e1c:	e426                	sd	s1,8(sp)
    80207e1e:	e04a                	sd	s2,0(sp)
    80207e20:	1000                	addi	s0,sp,32
    80207e22:	892a                	mv	s2,a0
    80207e24:	84ae                	mv	s1,a1
    // 定位到映射文件的目标簇 
    reloc_clus(ep, off, 0);
    80207e26:	4601                	li	a2,0
    80207e28:	fffff097          	auipc	ra,0xfffff
    80207e2c:	90a080e7          	jalr	-1782(ra) # 80206732 <reloc_clus>
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80207e30:	10c92783          	lw	a5,268(s2)
    80207e34:	37f9                	addiw	a5,a5,-2
    80207e36:	0002e717          	auipc	a4,0x2e
    80207e3a:	0e270713          	addi	a4,a4,226 # 80235f18 <fat>
    80207e3e:	01274583          	lbu	a1,18(a4)
    80207e42:	02b787bb          	mulw	a5,a5,a1
    80207e46:	430c                	lw	a1,0(a4)
    80207e48:	9fad                	addw	a5,a5,a1
    struct buf *bp;
    // 获得目标簇中要读取的扇区号
    uint sec = first_sec_of_clus(ep->cur_clus) + off / fat.bpb.byts_per_sec;
    80207e4a:	01075583          	lhu	a1,16(a4)
    80207e4e:	02b4c5bb          	divw	a1,s1,a1
    bp = bread(0, sec);
    80207e52:	9dbd                	addw	a1,a1,a5
    80207e54:	4501                	li	a0,0
    80207e56:	ffffc097          	auipc	ra,0xffffc
    80207e5a:	d4a080e7          	jalr	-694(ra) # 80203ba0 <bread>
    80207e5e:	84aa                	mv	s1,a0
    uint64 pa=(uint64)bp->data;
    brelse(bp);
    80207e60:	ffffc097          	auipc	ra,0xffffc
    80207e64:	e6c080e7          	jalr	-404(ra) # 80203ccc <brelse>
    // printf("get_pa_of_entry: bp->data = %s\n",bp->data);
    return pa;
}
    80207e68:	05848513          	addi	a0,s1,88
    80207e6c:	60e2                	ld	ra,24(sp)
    80207e6e:	6442                	ld	s0,16(sp)
    80207e70:	64a2                	ld	s1,8(sp)
    80207e72:	6902                	ld	s2,0(sp)
    80207e74:	6105                	addi	sp,sp,32
    80207e76:	8082                	ret

0000000080207e78 <plicinit>:

//
// the riscv Platform Level Interrupt Controller (PLIC).
//

void plicinit(void) {
    80207e78:	1141                	addi	sp,sp,-16
    80207e7a:	e422                	sd	s0,8(sp)
    80207e7c:	0800                	addi	s0,sp,16
	writed(1, PLIC_V + DISK_IRQ * sizeof(uint32));
    80207e7e:	00fc37b7          	lui	a5,0xfc3
    80207e82:	07ba                	slli	a5,a5,0xe
    80207e84:	4705                	li	a4,1
    80207e86:	c3d8                	sw	a4,4(a5)
	writed(1, PLIC_V + UART_IRQ * sizeof(uint32));
    80207e88:	d798                	sw	a4,40(a5)

	#ifdef DEBUG 
	printf("plicinit\n");
	#endif 
}
    80207e8a:	6422                	ld	s0,8(sp)
    80207e8c:	0141                	addi	sp,sp,16
    80207e8e:	8082                	ret

0000000080207e90 <plicinithart>:

void
plicinithart(void)
{
    80207e90:	1141                	addi	sp,sp,-16
    80207e92:	e406                	sd	ra,8(sp)
    80207e94:	e022                	sd	s0,0(sp)
    80207e96:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80207e98:	ffffa097          	auipc	ra,0xffffa
    80207e9c:	b9c080e7          	jalr	-1124(ra) # 80201a34 <cpuid>
  #ifdef QEMU
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART_IRQ) | (1 << DISK_IRQ);
    80207ea0:	0085171b          	slliw	a4,a0,0x8
    80207ea4:	01f867b7          	lui	a5,0x1f86
    80207ea8:	0785                	addi	a5,a5,1
    80207eaa:	07b6                	slli	a5,a5,0xd
    80207eac:	97ba                	add	a5,a5,a4
    80207eae:	40200713          	li	a4,1026
    80207eb2:	08e7a023          	sw	a4,128(a5) # 1f86080 <_entry-0x7e279f80>
  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80207eb6:	00d5179b          	slliw	a5,a0,0xd
    80207eba:	03f0c537          	lui	a0,0x3f0c
    80207ebe:	20150513          	addi	a0,a0,513 # 3f0c201 <_entry-0x7c2f3dff>
    80207ec2:	0532                	slli	a0,a0,0xc
    80207ec4:	953e                	add	a0,a0,a5
    80207ec6:	00052023          	sw	zero,0(a0)
  *(hart0_m_int_enable_hi) = readd(hart0_m_int_enable_hi) | (1 << (UART_IRQ % 32));
  #endif
  #ifdef DEBUG
  printf("plicinithart\n");
  #endif
}
    80207eca:	60a2                	ld	ra,8(sp)
    80207ecc:	6402                	ld	s0,0(sp)
    80207ece:	0141                	addi	sp,sp,16
    80207ed0:	8082                	ret

0000000080207ed2 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80207ed2:	1141                	addi	sp,sp,-16
    80207ed4:	e406                	sd	ra,8(sp)
    80207ed6:	e022                	sd	s0,0(sp)
    80207ed8:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80207eda:	ffffa097          	auipc	ra,0xffffa
    80207ede:	b5a080e7          	jalr	-1190(ra) # 80201a34 <cpuid>
  int irq;
  #ifndef QEMU
  irq = *(uint32*)PLIC_MCLAIM(hart);
  #else
  irq = *(uint32*)PLIC_SCLAIM(hart);
    80207ee2:	00d5179b          	slliw	a5,a0,0xd
    80207ee6:	03f0c537          	lui	a0,0x3f0c
    80207eea:	20150513          	addi	a0,a0,513 # 3f0c201 <_entry-0x7c2f3dff>
    80207eee:	0532                	slli	a0,a0,0xc
    80207ef0:	953e                	add	a0,a0,a5
  #endif
  return irq;
}
    80207ef2:	4148                	lw	a0,4(a0)
    80207ef4:	60a2                	ld	ra,8(sp)
    80207ef6:	6402                	ld	s0,0(sp)
    80207ef8:	0141                	addi	sp,sp,16
    80207efa:	8082                	ret

0000000080207efc <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80207efc:	1101                	addi	sp,sp,-32
    80207efe:	ec06                	sd	ra,24(sp)
    80207f00:	e822                	sd	s0,16(sp)
    80207f02:	e426                	sd	s1,8(sp)
    80207f04:	1000                	addi	s0,sp,32
    80207f06:	84aa                	mv	s1,a0
  int hart = cpuid();
    80207f08:	ffffa097          	auipc	ra,0xffffa
    80207f0c:	b2c080e7          	jalr	-1236(ra) # 80201a34 <cpuid>
  #ifndef QEMU
  *(uint32*)PLIC_MCLAIM(hart) = irq;
  #else
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80207f10:	00d5151b          	slliw	a0,a0,0xd
    80207f14:	03f0c7b7          	lui	a5,0x3f0c
    80207f18:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80207f1c:	07b2                	slli	a5,a5,0xc
    80207f1e:	97aa                	add	a5,a5,a0
    80207f20:	c3c4                	sw	s1,4(a5)
  #endif
}
    80207f22:	60e2                	ld	ra,24(sp)
    80207f24:	6442                	ld	s0,16(sp)
    80207f26:	64a2                	ld	s1,8(sp)
    80207f28:	6105                	addi	sp,sp,32
    80207f2a:	8082                	ret

0000000080207f2c <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    80207f2c:	715d                	addi	sp,sp,-80
    80207f2e:	e486                	sd	ra,72(sp)
    80207f30:	e0a2                	sd	s0,64(sp)
    80207f32:	fc26                	sd	s1,56(sp)
    80207f34:	f84a                	sd	s2,48(sp)
    80207f36:	f44e                	sd	s3,40(sp)
    80207f38:	f052                	sd	s4,32(sp)
    80207f3a:	ec56                	sd	s5,24(sp)
    80207f3c:	e85a                	sd	s6,16(sp)
    80207f3e:	0880                	addi	s0,sp,80
    80207f40:	8a2a                	mv	s4,a0
    80207f42:	84ae                	mv	s1,a1
    80207f44:	89b2                	mv	s3,a2
  int i;

  acquire(&cons.lock);
    80207f46:	00032517          	auipc	a0,0x32
    80207f4a:	7ca50513          	addi	a0,a0,1994 # 8023a710 <cons>
    80207f4e:	ffff8097          	auipc	ra,0xffff8
    80207f52:	77a080e7          	jalr	1914(ra) # 802006c8 <acquire>
  for(i = 0; i < n; i++){
    80207f56:	05305f63          	blez	s3,80207fb4 <consolewrite+0x88>
    80207f5a:	4901                	li	s2,0
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    80207f5c:	fbf40b13          	addi	s6,s0,-65
    80207f60:	5afd                	li	s5,-1
    80207f62:	4685                	li	a3,1
    80207f64:	8626                	mv	a2,s1
    80207f66:	85d2                	mv	a1,s4
    80207f68:	855a                	mv	a0,s6
    80207f6a:	ffffa097          	auipc	ra,0xffffa
    80207f6e:	652080e7          	jalr	1618(ra) # 802025bc <either_copyin>
    80207f72:	01550e63          	beq	a0,s5,80207f8e <consolewrite+0x62>
	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
    80207f76:	fbf44503          	lbu	a0,-65(s0)
    80207f7a:	4581                	li	a1,0
    80207f7c:	4601                	li	a2,0
    80207f7e:	4681                	li	a3,0
    80207f80:	4885                	li	a7,1
    80207f82:	00000073          	ecall
  for(i = 0; i < n; i++){
    80207f86:	2905                	addiw	s2,s2,1
    80207f88:	0485                	addi	s1,s1,1
    80207f8a:	fd299ce3          	bne	s3,s2,80207f62 <consolewrite+0x36>
      break;
    sbi_console_putchar(c);
  }
  release(&cons.lock);
    80207f8e:	00032517          	auipc	a0,0x32
    80207f92:	78250513          	addi	a0,a0,1922 # 8023a710 <cons>
    80207f96:	ffff8097          	auipc	ra,0xffff8
    80207f9a:	786080e7          	jalr	1926(ra) # 8020071c <release>

  return i;
}
    80207f9e:	854a                	mv	a0,s2
    80207fa0:	60a6                	ld	ra,72(sp)
    80207fa2:	6406                	ld	s0,64(sp)
    80207fa4:	74e2                	ld	s1,56(sp)
    80207fa6:	7942                	ld	s2,48(sp)
    80207fa8:	79a2                	ld	s3,40(sp)
    80207faa:	7a02                	ld	s4,32(sp)
    80207fac:	6ae2                	ld	s5,24(sp)
    80207fae:	6b42                	ld	s6,16(sp)
    80207fb0:	6161                	addi	sp,sp,80
    80207fb2:	8082                	ret
  for(i = 0; i < n; i++){
    80207fb4:	4901                	li	s2,0
    80207fb6:	bfe1                	j	80207f8e <consolewrite+0x62>

0000000080207fb8 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80207fb8:	7175                	addi	sp,sp,-144
    80207fba:	e506                	sd	ra,136(sp)
    80207fbc:	e122                	sd	s0,128(sp)
    80207fbe:	fca6                	sd	s1,120(sp)
    80207fc0:	f8ca                	sd	s2,112(sp)
    80207fc2:	f4ce                	sd	s3,104(sp)
    80207fc4:	f0d2                	sd	s4,96(sp)
    80207fc6:	ecd6                	sd	s5,88(sp)
    80207fc8:	e8da                	sd	s6,80(sp)
    80207fca:	e4de                	sd	s7,72(sp)
    80207fcc:	e0e2                	sd	s8,64(sp)
    80207fce:	fc66                	sd	s9,56(sp)
    80207fd0:	f86a                	sd	s10,48(sp)
    80207fd2:	f46e                	sd	s11,40(sp)
    80207fd4:	0900                	addi	s0,sp,144
    80207fd6:	f6a43c23          	sd	a0,-136(s0)
    80207fda:	8aae                	mv	s5,a1
    80207fdc:	8a32                	mv	s4,a2
  uint target;
  int c;
  char cbuf;

  target = n;
    80207fde:	00060b1b          	sext.w	s6,a2
  acquire(&cons.lock);
    80207fe2:	00032517          	auipc	a0,0x32
    80207fe6:	72e50513          	addi	a0,a0,1838 # 8023a710 <cons>
    80207fea:	ffff8097          	auipc	ra,0xffff8
    80207fee:	6de080e7          	jalr	1758(ra) # 802006c8 <acquire>
  while(n > 0){
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
    80207ff2:	00032497          	auipc	s1,0x32
    80207ff6:	71e48493          	addi	s1,s1,1822 # 8023a710 <cons>
      if(myproc()->killed){
        release(&cons.lock);
        return -1;
      }
      sleep(&cons.r, &cons.lock);
    80207ffa:	89a6                	mv	s3,s1
    80207ffc:	00032917          	auipc	s2,0x32
    80208000:	7ac90913          	addi	s2,s2,1964 # 8023a7a8 <cons+0x98>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];

    if(c == C('D')){  // end-of-file
    80208004:	4c11                	li	s8,4
      break;
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80208006:	f8f40d13          	addi	s10,s0,-113
    8020800a:	5cfd                	li	s9,-1
      break;

    dst++;
    --n;

    if(c == '\n'){
    8020800c:	4da9                	li	s11,10
  while(n > 0){
    8020800e:	07405863          	blez	s4,8020807e <consoleread+0xc6>
    while(cons.r == cons.w){
    80208012:	0984a783          	lw	a5,152(s1)
    80208016:	09c4a703          	lw	a4,156(s1)
    8020801a:	02f71463          	bne	a4,a5,80208042 <consoleread+0x8a>
      if(myproc()->killed){
    8020801e:	ffffa097          	auipc	ra,0xffffa
    80208022:	a42080e7          	jalr	-1470(ra) # 80201a60 <myproc>
    80208026:	591c                	lw	a5,48(a0)
    80208028:	e7b5                	bnez	a5,80208094 <consoleread+0xdc>
      sleep(&cons.r, &cons.lock);
    8020802a:	85ce                	mv	a1,s3
    8020802c:	854a                	mv	a0,s2
    8020802e:	ffffa097          	auipc	ra,0xffffa
    80208032:	2c8080e7          	jalr	712(ra) # 802022f6 <sleep>
    while(cons.r == cons.w){
    80208036:	0984a783          	lw	a5,152(s1)
    8020803a:	09c4a703          	lw	a4,156(s1)
    8020803e:	fef700e3          	beq	a4,a5,8020801e <consoleread+0x66>
    c = cons.buf[cons.r++ % INPUT_BUF];
    80208042:	0017871b          	addiw	a4,a5,1
    80208046:	08e4ac23          	sw	a4,152(s1)
    8020804a:	07f7f713          	andi	a4,a5,127
    8020804e:	9726                	add	a4,a4,s1
    80208050:	01874703          	lbu	a4,24(a4)
    80208054:	00070b9b          	sext.w	s7,a4
    if(c == C('D')){  // end-of-file
    80208058:	078b8663          	beq	s7,s8,802080c4 <consoleread+0x10c>
    cbuf = c;
    8020805c:	f8e407a3          	sb	a4,-113(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80208060:	4685                	li	a3,1
    80208062:	866a                	mv	a2,s10
    80208064:	85d6                	mv	a1,s5
    80208066:	f7843503          	ld	a0,-136(s0)
    8020806a:	ffffa097          	auipc	ra,0xffffa
    8020806e:	4fc080e7          	jalr	1276(ra) # 80202566 <either_copyout>
    80208072:	01950663          	beq	a0,s9,8020807e <consoleread+0xc6>
    dst++;
    80208076:	0a85                	addi	s5,s5,1
    --n;
    80208078:	3a7d                	addiw	s4,s4,-1
    if(c == '\n'){
    8020807a:	f9bb9ae3          	bne	s7,s11,8020800e <consoleread+0x56>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    }
  }
  release(&cons.lock);
    8020807e:	00032517          	auipc	a0,0x32
    80208082:	69250513          	addi	a0,a0,1682 # 8023a710 <cons>
    80208086:	ffff8097          	auipc	ra,0xffff8
    8020808a:	696080e7          	jalr	1686(ra) # 8020071c <release>

  return target - n;
    8020808e:	414b053b          	subw	a0,s6,s4
    80208092:	a811                	j	802080a6 <consoleread+0xee>
        release(&cons.lock);
    80208094:	00032517          	auipc	a0,0x32
    80208098:	67c50513          	addi	a0,a0,1660 # 8023a710 <cons>
    8020809c:	ffff8097          	auipc	ra,0xffff8
    802080a0:	680080e7          	jalr	1664(ra) # 8020071c <release>
        return -1;
    802080a4:	557d                	li	a0,-1
}
    802080a6:	60aa                	ld	ra,136(sp)
    802080a8:	640a                	ld	s0,128(sp)
    802080aa:	74e6                	ld	s1,120(sp)
    802080ac:	7946                	ld	s2,112(sp)
    802080ae:	79a6                	ld	s3,104(sp)
    802080b0:	7a06                	ld	s4,96(sp)
    802080b2:	6ae6                	ld	s5,88(sp)
    802080b4:	6b46                	ld	s6,80(sp)
    802080b6:	6ba6                	ld	s7,72(sp)
    802080b8:	6c06                	ld	s8,64(sp)
    802080ba:	7ce2                	ld	s9,56(sp)
    802080bc:	7d42                	ld	s10,48(sp)
    802080be:	7da2                	ld	s11,40(sp)
    802080c0:	6149                	addi	sp,sp,144
    802080c2:	8082                	ret
      if(n < target){
    802080c4:	000a071b          	sext.w	a4,s4
    802080c8:	fb677be3          	bgeu	a4,s6,8020807e <consoleread+0xc6>
        cons.r--;
    802080cc:	00032717          	auipc	a4,0x32
    802080d0:	6cf72e23          	sw	a5,1756(a4) # 8023a7a8 <cons+0x98>
    802080d4:	b76d                	j	8020807e <consoleread+0xc6>

00000000802080d6 <consputc>:
void consputc(int c) {
    802080d6:	1141                	addi	sp,sp,-16
    802080d8:	e422                	sd	s0,8(sp)
    802080da:	0800                	addi	s0,sp,16
  if(c == BACKSPACE){
    802080dc:	10000793          	li	a5,256
    802080e0:	00f50b63          	beq	a0,a5,802080f6 <consputc+0x20>
    802080e4:	4581                	li	a1,0
    802080e6:	4601                	li	a2,0
    802080e8:	4681                	li	a3,0
    802080ea:	4885                	li	a7,1
    802080ec:	00000073          	ecall
}
    802080f0:	6422                	ld	s0,8(sp)
    802080f2:	0141                	addi	sp,sp,16
    802080f4:	8082                	ret
    802080f6:	4521                	li	a0,8
    802080f8:	4581                	li	a1,0
    802080fa:	4601                	li	a2,0
    802080fc:	4681                	li	a3,0
    802080fe:	4885                	li	a7,1
    80208100:	00000073          	ecall
    80208104:	02000513          	li	a0,32
    80208108:	00000073          	ecall
    8020810c:	4521                	li	a0,8
    8020810e:	00000073          	ecall
}
    80208112:	bff9                	j	802080f0 <consputc+0x1a>

0000000080208114 <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    80208114:	1101                	addi	sp,sp,-32
    80208116:	ec06                	sd	ra,24(sp)
    80208118:	e822                	sd	s0,16(sp)
    8020811a:	e426                	sd	s1,8(sp)
    8020811c:	e04a                	sd	s2,0(sp)
    8020811e:	1000                	addi	s0,sp,32
    80208120:	84aa                	mv	s1,a0
  acquire(&cons.lock);
    80208122:	00032517          	auipc	a0,0x32
    80208126:	5ee50513          	addi	a0,a0,1518 # 8023a710 <cons>
    8020812a:	ffff8097          	auipc	ra,0xffff8
    8020812e:	59e080e7          	jalr	1438(ra) # 802006c8 <acquire>

  switch(c){
    80208132:	47d5                	li	a5,21
    80208134:	0af48663          	beq	s1,a5,802081e0 <consoleintr+0xcc>
    80208138:	0297ca63          	blt	a5,s1,8020816c <consoleintr+0x58>
    8020813c:	47a1                	li	a5,8
    8020813e:	0ef48763          	beq	s1,a5,8020822c <consoleintr+0x118>
    80208142:	47c1                	li	a5,16
    80208144:	10f49a63          	bne	s1,a5,80208258 <consoleintr+0x144>
  case C('P'):  // Print process list.
    procdump();
    80208148:	ffffa097          	auipc	ra,0xffffa
    8020814c:	4ca080e7          	jalr	1226(ra) # 80202612 <procdump>
      }
    }
    break;
  }
  
  release(&cons.lock);
    80208150:	00032517          	auipc	a0,0x32
    80208154:	5c050513          	addi	a0,a0,1472 # 8023a710 <cons>
    80208158:	ffff8097          	auipc	ra,0xffff8
    8020815c:	5c4080e7          	jalr	1476(ra) # 8020071c <release>
}
    80208160:	60e2                	ld	ra,24(sp)
    80208162:	6442                	ld	s0,16(sp)
    80208164:	64a2                	ld	s1,8(sp)
    80208166:	6902                	ld	s2,0(sp)
    80208168:	6105                	addi	sp,sp,32
    8020816a:	8082                	ret
  switch(c){
    8020816c:	07f00793          	li	a5,127
    80208170:	0af48e63          	beq	s1,a5,8020822c <consoleintr+0x118>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80208174:	00032717          	auipc	a4,0x32
    80208178:	59c70713          	addi	a4,a4,1436 # 8023a710 <cons>
    8020817c:	0a072783          	lw	a5,160(a4)
    80208180:	09872703          	lw	a4,152(a4)
    80208184:	9f99                	subw	a5,a5,a4
    80208186:	07f00713          	li	a4,127
    8020818a:	fcf763e3          	bltu	a4,a5,80208150 <consoleintr+0x3c>
      c = (c == '\r') ? '\n' : c;
    8020818e:	47b5                	li	a5,13
    80208190:	0cf48763          	beq	s1,a5,8020825e <consoleintr+0x14a>
      consputc(c);
    80208194:	8526                	mv	a0,s1
    80208196:	00000097          	auipc	ra,0x0
    8020819a:	f40080e7          	jalr	-192(ra) # 802080d6 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    8020819e:	00032797          	auipc	a5,0x32
    802081a2:	57278793          	addi	a5,a5,1394 # 8023a710 <cons>
    802081a6:	0a07a703          	lw	a4,160(a5)
    802081aa:	0017069b          	addiw	a3,a4,1
    802081ae:	0006861b          	sext.w	a2,a3
    802081b2:	0ad7a023          	sw	a3,160(a5)
    802081b6:	07f77713          	andi	a4,a4,127
    802081ba:	97ba                	add	a5,a5,a4
    802081bc:	00978c23          	sb	s1,24(a5)
      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    802081c0:	47a9                	li	a5,10
    802081c2:	0cf48563          	beq	s1,a5,8020828c <consoleintr+0x178>
    802081c6:	4791                	li	a5,4
    802081c8:	0cf48263          	beq	s1,a5,8020828c <consoleintr+0x178>
    802081cc:	00032797          	auipc	a5,0x32
    802081d0:	5dc7a783          	lw	a5,1500(a5) # 8023a7a8 <cons+0x98>
    802081d4:	0807879b          	addiw	a5,a5,128
    802081d8:	f6f61ce3          	bne	a2,a5,80208150 <consoleintr+0x3c>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    802081dc:	863e                	mv	a2,a5
    802081de:	a07d                	j	8020828c <consoleintr+0x178>
    while(cons.e != cons.w &&
    802081e0:	00032717          	auipc	a4,0x32
    802081e4:	53070713          	addi	a4,a4,1328 # 8023a710 <cons>
    802081e8:	0a072783          	lw	a5,160(a4)
    802081ec:	09c72703          	lw	a4,156(a4)
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    802081f0:	00032497          	auipc	s1,0x32
    802081f4:	52048493          	addi	s1,s1,1312 # 8023a710 <cons>
    while(cons.e != cons.w &&
    802081f8:	4929                	li	s2,10
    802081fa:	f4f70be3          	beq	a4,a5,80208150 <consoleintr+0x3c>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    802081fe:	37fd                	addiw	a5,a5,-1
    80208200:	07f7f713          	andi	a4,a5,127
    80208204:	9726                	add	a4,a4,s1
    while(cons.e != cons.w &&
    80208206:	01874703          	lbu	a4,24(a4)
    8020820a:	f52703e3          	beq	a4,s2,80208150 <consoleintr+0x3c>
      cons.e--;
    8020820e:	0af4a023          	sw	a5,160(s1)
      consputc(BACKSPACE);
    80208212:	10000513          	li	a0,256
    80208216:	00000097          	auipc	ra,0x0
    8020821a:	ec0080e7          	jalr	-320(ra) # 802080d6 <consputc>
    while(cons.e != cons.w &&
    8020821e:	0a04a783          	lw	a5,160(s1)
    80208222:	09c4a703          	lw	a4,156(s1)
    80208226:	fcf71ce3          	bne	a4,a5,802081fe <consoleintr+0xea>
    8020822a:	b71d                	j	80208150 <consoleintr+0x3c>
    if(cons.e != cons.w){
    8020822c:	00032717          	auipc	a4,0x32
    80208230:	4e470713          	addi	a4,a4,1252 # 8023a710 <cons>
    80208234:	0a072783          	lw	a5,160(a4)
    80208238:	09c72703          	lw	a4,156(a4)
    8020823c:	f0f70ae3          	beq	a4,a5,80208150 <consoleintr+0x3c>
      cons.e--;
    80208240:	37fd                	addiw	a5,a5,-1
    80208242:	00032717          	auipc	a4,0x32
    80208246:	56f72723          	sw	a5,1390(a4) # 8023a7b0 <cons+0xa0>
      consputc(BACKSPACE);
    8020824a:	10000513          	li	a0,256
    8020824e:	00000097          	auipc	ra,0x0
    80208252:	e88080e7          	jalr	-376(ra) # 802080d6 <consputc>
    80208256:	bded                	j	80208150 <consoleintr+0x3c>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80208258:	ee048ce3          	beqz	s1,80208150 <consoleintr+0x3c>
    8020825c:	bf21                	j	80208174 <consoleintr+0x60>
      consputc(c);
    8020825e:	4529                	li	a0,10
    80208260:	00000097          	auipc	ra,0x0
    80208264:	e76080e7          	jalr	-394(ra) # 802080d6 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80208268:	00032797          	auipc	a5,0x32
    8020826c:	4a878793          	addi	a5,a5,1192 # 8023a710 <cons>
    80208270:	0a07a703          	lw	a4,160(a5)
    80208274:	0017069b          	addiw	a3,a4,1
    80208278:	0006861b          	sext.w	a2,a3
    8020827c:	0ad7a023          	sw	a3,160(a5)
    80208280:	07f77713          	andi	a4,a4,127
    80208284:	97ba                	add	a5,a5,a4
    80208286:	4729                	li	a4,10
    80208288:	00e78c23          	sb	a4,24(a5)
        cons.w = cons.e;
    8020828c:	00032797          	auipc	a5,0x32
    80208290:	52c7a023          	sw	a2,1312(a5) # 8023a7ac <cons+0x9c>
        wakeup(&cons.r);
    80208294:	00032517          	auipc	a0,0x32
    80208298:	51450513          	addi	a0,a0,1300 # 8023a7a8 <cons+0x98>
    8020829c:	ffffa097          	auipc	ra,0xffffa
    802082a0:	1de080e7          	jalr	478(ra) # 8020247a <wakeup>
    802082a4:	b575                	j	80208150 <consoleintr+0x3c>

00000000802082a6 <consoleinit>:

void
consoleinit(void)
{
    802082a6:	1101                	addi	sp,sp,-32
    802082a8:	ec06                	sd	ra,24(sp)
    802082aa:	e822                	sd	s0,16(sp)
    802082ac:	e426                	sd	s1,8(sp)
    802082ae:	1000                	addi	s0,sp,32
  initlock(&cons.lock, "cons");
    802082b0:	00032497          	auipc	s1,0x32
    802082b4:	46048493          	addi	s1,s1,1120 # 8023a710 <cons>
    802082b8:	00003597          	auipc	a1,0x3
    802082bc:	c4058593          	addi	a1,a1,-960 # 8020aef8 <digits+0xb78>
    802082c0:	8526                	mv	a0,s1
    802082c2:	ffff8097          	auipc	ra,0xffff8
    802082c6:	3c2080e7          	jalr	962(ra) # 80200684 <initlock>
  uartinit();
    802082ca:	00000097          	auipc	ra,0x0
    802082ce:	5bc080e7          	jalr	1468(ra) # 80208886 <uartinit>
  cons.e = cons.w = cons.r = 0;
    802082d2:	0804ac23          	sw	zero,152(s1)
    802082d6:	0804ae23          	sw	zero,156(s1)
    802082da:	0a04a023          	sw	zero,160(s1)
  
  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    802082de:	00006797          	auipc	a5,0x6
    802082e2:	e327b783          	ld	a5,-462(a5) # 8020e110 <_GLOBAL_OFFSET_TABLE_+0x60>
    802082e6:	00000717          	auipc	a4,0x0
    802082ea:	cd270713          	addi	a4,a4,-814 # 80207fb8 <consoleread>
    802082ee:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    802082f0:	00000717          	auipc	a4,0x0
    802082f4:	c3c70713          	addi	a4,a4,-964 # 80207f2c <consolewrite>
    802082f8:	ef98                	sd	a4,24(a5)
}
    802082fa:	60e2                	ld	ra,24(sp)
    802082fc:	6442                	ld	s0,16(sp)
    802082fe:	64a2                	ld	s1,8(sp)
    80208300:	6105                	addi	sp,sp,32
    80208302:	8082                	ret

0000000080208304 <free_desc>:
}

// mark a descriptor as free.
static void
free_desc(int i)
{
    80208304:	1141                	addi	sp,sp,-16
    80208306:	e406                	sd	ra,8(sp)
    80208308:	e022                	sd	s0,0(sp)
    8020830a:	0800                	addi	s0,sp,16
  if(i >= NUM)
    8020830c:	479d                	li	a5,7
    8020830e:	04a7cc63          	blt	a5,a0,80208366 <free_desc+0x62>
    panic("virtio_disk_intr 1");
  if(disk.free[i])
    80208312:	00033797          	auipc	a5,0x33
    80208316:	cee78793          	addi	a5,a5,-786 # 8023b000 <disk>
    8020831a:	00a78733          	add	a4,a5,a0
    8020831e:	6789                	lui	a5,0x2
    80208320:	97ba                	add	a5,a5,a4
    80208322:	0187c783          	lbu	a5,24(a5) # 2018 <_entry-0x801fdfe8>
    80208326:	eba1                	bnez	a5,80208376 <free_desc+0x72>
    panic("virtio_disk_intr 2");
  disk.desc[i].addr = 0;
    80208328:	00451713          	slli	a4,a0,0x4
    8020832c:	00035797          	auipc	a5,0x35
    80208330:	cd47b783          	ld	a5,-812(a5) # 8023d000 <disk+0x2000>
    80208334:	97ba                	add	a5,a5,a4
    80208336:	0007b023          	sd	zero,0(a5)
  disk.free[i] = 1;
    8020833a:	00033797          	auipc	a5,0x33
    8020833e:	cc678793          	addi	a5,a5,-826 # 8023b000 <disk>
    80208342:	97aa                	add	a5,a5,a0
    80208344:	6509                	lui	a0,0x2
    80208346:	953e                	add	a0,a0,a5
    80208348:	4785                	li	a5,1
    8020834a:	00f50c23          	sb	a5,24(a0) # 2018 <_entry-0x801fdfe8>
  wakeup(&disk.free[0]);
    8020834e:	00035517          	auipc	a0,0x35
    80208352:	cca50513          	addi	a0,a0,-822 # 8023d018 <disk+0x2018>
    80208356:	ffffa097          	auipc	ra,0xffffa
    8020835a:	124080e7          	jalr	292(ra) # 8020247a <wakeup>
}
    8020835e:	60a2                	ld	ra,8(sp)
    80208360:	6402                	ld	s0,0(sp)
    80208362:	0141                	addi	sp,sp,16
    80208364:	8082                	ret
    panic("virtio_disk_intr 1");
    80208366:	00003517          	auipc	a0,0x3
    8020836a:	b9a50513          	addi	a0,a0,-1126 # 8020af00 <digits+0xb80>
    8020836e:	ffff8097          	auipc	ra,0xffff8
    80208372:	dd4080e7          	jalr	-556(ra) # 80200142 <panic>
    panic("virtio_disk_intr 2");
    80208376:	00003517          	auipc	a0,0x3
    8020837a:	ba250513          	addi	a0,a0,-1118 # 8020af18 <digits+0xb98>
    8020837e:	ffff8097          	auipc	ra,0xffff8
    80208382:	dc4080e7          	jalr	-572(ra) # 80200142 <panic>

0000000080208386 <virtio_disk_init>:
{
    80208386:	1141                	addi	sp,sp,-16
    80208388:	e406                	sd	ra,8(sp)
    8020838a:	e022                	sd	s0,0(sp)
    8020838c:	0800                	addi	s0,sp,16
  initlock(&disk.vdisk_lock, "virtio_disk");
    8020838e:	00003597          	auipc	a1,0x3
    80208392:	ba258593          	addi	a1,a1,-1118 # 8020af30 <digits+0xbb0>
    80208396:	00035517          	auipc	a0,0x35
    8020839a:	d1250513          	addi	a0,a0,-750 # 8023d0a8 <disk+0x20a8>
    8020839e:	ffff8097          	auipc	ra,0xffff8
    802083a2:	2e6080e7          	jalr	742(ra) # 80200684 <initlock>
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    802083a6:	03f107b7          	lui	a5,0x3f10
    802083aa:	0785                	addi	a5,a5,1
    802083ac:	07b2                	slli	a5,a5,0xc
    802083ae:	4398                	lw	a4,0(a5)
    802083b0:	2701                	sext.w	a4,a4
    802083b2:	747277b7          	lui	a5,0x74727
    802083b6:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xbad968a>
    802083ba:	12f71263          	bne	a4,a5,802084de <virtio_disk_init+0x158>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    802083be:	00003797          	auipc	a5,0x3
    802083c2:	bfa7b783          	ld	a5,-1030(a5) # 8020afb8 <digits+0xc38>
    802083c6:	439c                	lw	a5,0(a5)
    802083c8:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    802083ca:	4705                	li	a4,1
    802083cc:	10e79963          	bne	a5,a4,802084de <virtio_disk_init+0x158>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    802083d0:	00003797          	auipc	a5,0x3
    802083d4:	bf07b783          	ld	a5,-1040(a5) # 8020afc0 <digits+0xc40>
    802083d8:	439c                	lw	a5,0(a5)
    802083da:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    802083dc:	4709                	li	a4,2
    802083de:	10e79063          	bne	a5,a4,802084de <virtio_disk_init+0x158>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    802083e2:	00003797          	auipc	a5,0x3
    802083e6:	be67b783          	ld	a5,-1050(a5) # 8020afc8 <digits+0xc48>
    802083ea:	4398                	lw	a4,0(a5)
    802083ec:	2701                	sext.w	a4,a4
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    802083ee:	554d47b7          	lui	a5,0x554d4
    802083f2:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ad2baaf>
    802083f6:	0ef71463          	bne	a4,a5,802084de <virtio_disk_init+0x158>
  *R(VIRTIO_MMIO_STATUS) = status;
    802083fa:	00003717          	auipc	a4,0x3
    802083fe:	bd673703          	ld	a4,-1066(a4) # 8020afd0 <digits+0xc50>
    80208402:	4785                	li	a5,1
    80208404:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_STATUS) = status;
    80208406:	478d                	li	a5,3
    80208408:	c31c                	sw	a5,0(a4)
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    8020840a:	00003797          	auipc	a5,0x3
    8020840e:	bce7b783          	ld	a5,-1074(a5) # 8020afd8 <digits+0xc58>
    80208412:	4394                	lw	a3,0(a5)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80208414:	c7ffe7b7          	lui	a5,0xc7ffe
    80208418:	75f78793          	addi	a5,a5,1887 # ffffffffc7ffe75f <kernel_end+0xffffffff47dbf75f>
    8020841c:	8ff5                	and	a5,a5,a3
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    8020841e:	2781                	sext.w	a5,a5
    80208420:	00003697          	auipc	a3,0x3
    80208424:	bc06b683          	ld	a3,-1088(a3) # 8020afe0 <digits+0xc60>
    80208428:	c29c                	sw	a5,0(a3)
  *R(VIRTIO_MMIO_STATUS) = status;
    8020842a:	47ad                	li	a5,11
    8020842c:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_STATUS) = status;
    8020842e:	47bd                	li	a5,15
    80208430:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    80208432:	00003797          	auipc	a5,0x3
    80208436:	bb67b783          	ld	a5,-1098(a5) # 8020afe8 <digits+0xc68>
    8020843a:	6705                	lui	a4,0x1
    8020843c:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    8020843e:	00003797          	auipc	a5,0x3
    80208442:	bb27b783          	ld	a5,-1102(a5) # 8020aff0 <digits+0xc70>
    80208446:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    8020844a:	00003797          	auipc	a5,0x3
    8020844e:	bae7b783          	ld	a5,-1106(a5) # 8020aff8 <digits+0xc78>
    80208452:	439c                	lw	a5,0(a5)
    80208454:	2781                	sext.w	a5,a5
  if(max == 0)
    80208456:	cfc1                	beqz	a5,802084ee <virtio_disk_init+0x168>
  if(max < NUM)
    80208458:	471d                	li	a4,7
    8020845a:	0af77263          	bgeu	a4,a5,802084fe <virtio_disk_init+0x178>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    8020845e:	00003797          	auipc	a5,0x3
    80208462:	ba27b783          	ld	a5,-1118(a5) # 8020b000 <digits+0xc80>
    80208466:	4721                	li	a4,8
    80208468:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    8020846a:	6609                	lui	a2,0x2
    8020846c:	4581                	li	a1,0
    8020846e:	00033517          	auipc	a0,0x33
    80208472:	b9250513          	addi	a0,a0,-1134 # 8023b000 <disk>
    80208476:	ffff8097          	auipc	ra,0xffff8
    8020847a:	2ee080e7          	jalr	750(ra) # 80200764 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    8020847e:	00033717          	auipc	a4,0x33
    80208482:	b8270713          	addi	a4,a4,-1150 # 8023b000 <disk>
    80208486:	00c75793          	srli	a5,a4,0xc
    8020848a:	2781                	sext.w	a5,a5
    8020848c:	00003697          	auipc	a3,0x3
    80208490:	b7c6b683          	ld	a3,-1156(a3) # 8020b008 <digits+0xc88>
    80208494:	c29c                	sw	a5,0(a3)
  disk.desc = (struct VRingDesc *) disk.pages;
    80208496:	00035797          	auipc	a5,0x35
    8020849a:	b6a78793          	addi	a5,a5,-1174 # 8023d000 <disk+0x2000>
    8020849e:	e398                	sd	a4,0(a5)
  disk.avail = (uint16*)(((char*)disk.desc) + NUM*sizeof(struct VRingDesc));
    802084a0:	00033717          	auipc	a4,0x33
    802084a4:	be070713          	addi	a4,a4,-1056 # 8023b080 <disk+0x80>
    802084a8:	e798                	sd	a4,8(a5)
  disk.used = (struct UsedArea *) (disk.pages + PGSIZE);
    802084aa:	00034717          	auipc	a4,0x34
    802084ae:	b5670713          	addi	a4,a4,-1194 # 8023c000 <disk+0x1000>
    802084b2:	eb98                	sd	a4,16(a5)
    disk.free[i] = 1;
    802084b4:	4705                	li	a4,1
    802084b6:	00e78c23          	sb	a4,24(a5)
    802084ba:	00e78ca3          	sb	a4,25(a5)
    802084be:	00e78d23          	sb	a4,26(a5)
    802084c2:	00e78da3          	sb	a4,27(a5)
    802084c6:	00e78e23          	sb	a4,28(a5)
    802084ca:	00e78ea3          	sb	a4,29(a5)
    802084ce:	00e78f23          	sb	a4,30(a5)
    802084d2:	00e78fa3          	sb	a4,31(a5)
}
    802084d6:	60a2                	ld	ra,8(sp)
    802084d8:	6402                	ld	s0,0(sp)
    802084da:	0141                	addi	sp,sp,16
    802084dc:	8082                	ret
    panic("could not find virtio disk");
    802084de:	00003517          	auipc	a0,0x3
    802084e2:	a6250513          	addi	a0,a0,-1438 # 8020af40 <digits+0xbc0>
    802084e6:	ffff8097          	auipc	ra,0xffff8
    802084ea:	c5c080e7          	jalr	-932(ra) # 80200142 <panic>
    panic("virtio disk has no queue 0");
    802084ee:	00003517          	auipc	a0,0x3
    802084f2:	a7250513          	addi	a0,a0,-1422 # 8020af60 <digits+0xbe0>
    802084f6:	ffff8097          	auipc	ra,0xffff8
    802084fa:	c4c080e7          	jalr	-948(ra) # 80200142 <panic>
    panic("virtio disk max queue too short");
    802084fe:	00003517          	auipc	a0,0x3
    80208502:	a8250513          	addi	a0,a0,-1406 # 8020af80 <digits+0xc00>
    80208506:	ffff8097          	auipc	ra,0xffff8
    8020850a:	c3c080e7          	jalr	-964(ra) # 80200142 <panic>

000000008020850e <virtio_disk_rw>:
  return 0;
}

void
virtio_disk_rw(struct buf *b, int write)
{
    8020850e:	7119                	addi	sp,sp,-128
    80208510:	fc86                	sd	ra,120(sp)
    80208512:	f8a2                	sd	s0,112(sp)
    80208514:	f4a6                	sd	s1,104(sp)
    80208516:	f0ca                	sd	s2,96(sp)
    80208518:	ecce                	sd	s3,88(sp)
    8020851a:	e8d2                	sd	s4,80(sp)
    8020851c:	e4d6                	sd	s5,72(sp)
    8020851e:	e0da                	sd	s6,64(sp)
    80208520:	fc5e                	sd	s7,56(sp)
    80208522:	f862                	sd	s8,48(sp)
    80208524:	f466                	sd	s9,40(sp)
    80208526:	f06a                	sd	s10,32(sp)
    80208528:	0100                	addi	s0,sp,128
    8020852a:	892a                	mv	s2,a0
    8020852c:	8cae                	mv	s9,a1
  uint64 sector = b->sectorno;
    8020852e:	00c56d03          	lwu	s10,12(a0)

  acquire(&disk.vdisk_lock);
    80208532:	00035517          	auipc	a0,0x35
    80208536:	b7650513          	addi	a0,a0,-1162 # 8023d0a8 <disk+0x20a8>
    8020853a:	ffff8097          	auipc	ra,0xffff8
    8020853e:	18e080e7          	jalr	398(ra) # 802006c8 <acquire>
  for(int i = 0; i < 3; i++){
    80208542:	4981                	li	s3,0
  for(int i = 0; i < NUM; i++){
    80208544:	4c21                	li	s8,8
      disk.free[i] = 0;
    80208546:	00033b97          	auipc	s7,0x33
    8020854a:	abab8b93          	addi	s7,s7,-1350 # 8023b000 <disk>
    8020854e:	6b09                	lui	s6,0x2
  for(int i = 0; i < 3; i++){
    80208550:	4a8d                	li	s5,3
  for(int i = 0; i < NUM; i++){
    80208552:	8a4e                	mv	s4,s3
    80208554:	a051                	j	802085d8 <virtio_disk_rw+0xca>
      disk.free[i] = 0;
    80208556:	00fb86b3          	add	a3,s7,a5
    8020855a:	96da                	add	a3,a3,s6
    8020855c:	00068c23          	sb	zero,24(a3)
    idx[i] = alloc_desc();
    80208560:	c21c                	sw	a5,0(a2)
    if(idx[i] < 0){
    80208562:	0207c563          	bltz	a5,8020858c <virtio_disk_rw+0x7e>
  for(int i = 0; i < 3; i++){
    80208566:	2485                	addiw	s1,s1,1
    80208568:	0711                	addi	a4,a4,4
    8020856a:	25548463          	beq	s1,s5,802087b2 <virtio_disk_rw+0x2a4>
    idx[i] = alloc_desc();
    8020856e:	863a                	mv	a2,a4
  for(int i = 0; i < NUM; i++){
    80208570:	00035697          	auipc	a3,0x35
    80208574:	aa868693          	addi	a3,a3,-1368 # 8023d018 <disk+0x2018>
    80208578:	87d2                	mv	a5,s4
    if(disk.free[i]){
    8020857a:	0006c583          	lbu	a1,0(a3)
    8020857e:	fde1                	bnez	a1,80208556 <virtio_disk_rw+0x48>
  for(int i = 0; i < NUM; i++){
    80208580:	2785                	addiw	a5,a5,1
    80208582:	0685                	addi	a3,a3,1
    80208584:	ff879be3          	bne	a5,s8,8020857a <virtio_disk_rw+0x6c>
    idx[i] = alloc_desc();
    80208588:	57fd                	li	a5,-1
    8020858a:	c21c                	sw	a5,0(a2)
      for(int j = 0; j < i; j++)
    8020858c:	02905a63          	blez	s1,802085c0 <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    80208590:	f9042503          	lw	a0,-112(s0)
    80208594:	00000097          	auipc	ra,0x0
    80208598:	d70080e7          	jalr	-656(ra) # 80208304 <free_desc>
      for(int j = 0; j < i; j++)
    8020859c:	4785                	li	a5,1
    8020859e:	0297d163          	bge	a5,s1,802085c0 <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    802085a2:	f9442503          	lw	a0,-108(s0)
    802085a6:	00000097          	auipc	ra,0x0
    802085aa:	d5e080e7          	jalr	-674(ra) # 80208304 <free_desc>
      for(int j = 0; j < i; j++)
    802085ae:	4789                	li	a5,2
    802085b0:	0097d863          	bge	a5,s1,802085c0 <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    802085b4:	f9842503          	lw	a0,-104(s0)
    802085b8:	00000097          	auipc	ra,0x0
    802085bc:	d4c080e7          	jalr	-692(ra) # 80208304 <free_desc>
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    802085c0:	00035597          	auipc	a1,0x35
    802085c4:	ae858593          	addi	a1,a1,-1304 # 8023d0a8 <disk+0x20a8>
    802085c8:	00035517          	auipc	a0,0x35
    802085cc:	a5050513          	addi	a0,a0,-1456 # 8023d018 <disk+0x2018>
    802085d0:	ffffa097          	auipc	ra,0xffffa
    802085d4:	d26080e7          	jalr	-730(ra) # 802022f6 <sleep>
  for(int i = 0; i < 3; i++){
    802085d8:	f9040713          	addi	a4,s0,-112
    802085dc:	84ce                	mv	s1,s3
    802085de:	bf41                	j	8020856e <virtio_disk_rw+0x60>
    uint32 reserved;
    uint64 sector;
  } buf0;

  if(write)
    buf0.type = VIRTIO_BLK_T_OUT; // write the disk
    802085e0:	4785                	li	a5,1
    802085e2:	f8f42023          	sw	a5,-128(s0)
  else
    buf0.type = VIRTIO_BLK_T_IN; // read the disk
  buf0.reserved = 0;
    802085e6:	f8042223          	sw	zero,-124(s0)
  buf0.sector = sector;
    802085ea:	f9a43423          	sd	s10,-120(s0)

  // buf0 is on a kernel stack, which is not direct mapped,
  // thus the call to kvmpa().
  disk.desc[idx[0]].addr = (uint64) kwalkaddr(myproc()->kpagetable, (uint64) &buf0);
    802085ee:	ffff9097          	auipc	ra,0xffff9
    802085f2:	472080e7          	jalr	1138(ra) # 80201a60 <myproc>
    802085f6:	f9042983          	lw	s3,-112(s0)
    802085fa:	00499493          	slli	s1,s3,0x4
    802085fe:	00035a17          	auipc	s4,0x35
    80208602:	a02a0a13          	addi	s4,s4,-1534 # 8023d000 <disk+0x2000>
    80208606:	000a3a83          	ld	s5,0(s4)
    8020860a:	9aa6                	add	s5,s5,s1
    8020860c:	f8040593          	addi	a1,s0,-128
    80208610:	6d28                	ld	a0,88(a0)
    80208612:	ffff8097          	auipc	ra,0xffff8
    80208616:	5ec080e7          	jalr	1516(ra) # 80200bfe <kwalkaddr>
    8020861a:	00aab023          	sd	a0,0(s5)
  disk.desc[idx[0]].len = sizeof(buf0);
    8020861e:	000a3783          	ld	a5,0(s4)
    80208622:	97a6                	add	a5,a5,s1
    80208624:	4741                	li	a4,16
    80208626:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80208628:	000a3783          	ld	a5,0(s4)
    8020862c:	97a6                	add	a5,a5,s1
    8020862e:	4705                	li	a4,1
    80208630:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[0]].next = idx[1];
    80208634:	f9442703          	lw	a4,-108(s0)
    80208638:	000a3783          	ld	a5,0(s4)
    8020863c:	97a6                	add	a5,a5,s1
    8020863e:	00e79723          	sh	a4,14(a5)

  disk.desc[idx[1]].addr = (uint64) b->data;
    80208642:	0712                	slli	a4,a4,0x4
    80208644:	000a3783          	ld	a5,0(s4)
    80208648:	97ba                	add	a5,a5,a4
    8020864a:	05890693          	addi	a3,s2,88
    8020864e:	e394                	sd	a3,0(a5)
  disk.desc[idx[1]].len = BSIZE;
    80208650:	000a3783          	ld	a5,0(s4)
    80208654:	97ba                	add	a5,a5,a4
    80208656:	20000693          	li	a3,512
    8020865a:	c794                	sw	a3,8(a5)
  if(write)
    8020865c:	100c8c63          	beqz	s9,80208774 <virtio_disk_rw+0x266>
    disk.desc[idx[1]].flags = 0; // device reads b->data
    80208660:	00035797          	auipc	a5,0x35
    80208664:	9a07b783          	ld	a5,-1632(a5) # 8023d000 <disk+0x2000>
    80208668:	97ba                	add	a5,a5,a4
    8020866a:	00079623          	sh	zero,12(a5)
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    8020866e:	00033517          	auipc	a0,0x33
    80208672:	99250513          	addi	a0,a0,-1646 # 8023b000 <disk>
    80208676:	00035797          	auipc	a5,0x35
    8020867a:	98a78793          	addi	a5,a5,-1654 # 8023d000 <disk+0x2000>
    8020867e:	6394                	ld	a3,0(a5)
    80208680:	96ba                	add	a3,a3,a4
    80208682:	00c6d603          	lhu	a2,12(a3)
    80208686:	00166613          	ori	a2,a2,1
    8020868a:	00c69623          	sh	a2,12(a3)
  disk.desc[idx[1]].next = idx[2];
    8020868e:	f9842683          	lw	a3,-104(s0)
    80208692:	6390                	ld	a2,0(a5)
    80208694:	9732                	add	a4,a4,a2
    80208696:	00d71723          	sh	a3,14(a4)

  disk.info[idx[0]].status = 0;
    8020869a:	20098613          	addi	a2,s3,512
    8020869e:	0612                	slli	a2,a2,0x4
    802086a0:	962a                	add	a2,a2,a0
    802086a2:	02060823          	sb	zero,48(a2) # 2030 <_entry-0x801fdfd0>
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    802086a6:	00469713          	slli	a4,a3,0x4
    802086aa:	6394                	ld	a3,0(a5)
    802086ac:	96ba                	add	a3,a3,a4
    802086ae:	6589                	lui	a1,0x2
    802086b0:	03058593          	addi	a1,a1,48 # 2030 <_entry-0x801fdfd0>
    802086b4:	94ae                	add	s1,s1,a1
    802086b6:	94aa                	add	s1,s1,a0
    802086b8:	e284                	sd	s1,0(a3)
  disk.desc[idx[2]].len = 1;
    802086ba:	6394                	ld	a3,0(a5)
    802086bc:	96ba                	add	a3,a3,a4
    802086be:	4585                	li	a1,1
    802086c0:	c68c                	sw	a1,8(a3)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    802086c2:	6394                	ld	a3,0(a5)
    802086c4:	96ba                	add	a3,a3,a4
    802086c6:	4509                	li	a0,2
    802086c8:	00a69623          	sh	a0,12(a3)
  disk.desc[idx[2]].next = 0;
    802086cc:	6394                	ld	a3,0(a5)
    802086ce:	9736                	add	a4,a4,a3
    802086d0:	00071723          	sh	zero,14(a4)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    802086d4:	00b92223          	sw	a1,4(s2)
  disk.info[idx[0]].b = b;
    802086d8:	03263423          	sd	s2,40(a2)

  // avail[0] is flags
  // avail[1] tells the device how far to look in avail[2...].
  // avail[2...] are desc[] indices the device should process.
  // we only tell device the first index in our chain of descriptors.
  disk.avail[2 + (disk.avail[1] % NUM)] = idx[0];
    802086dc:	6794                	ld	a3,8(a5)
    802086de:	0026d703          	lhu	a4,2(a3)
    802086e2:	8b1d                	andi	a4,a4,7
    802086e4:	2709                	addiw	a4,a4,2
    802086e6:	0706                	slli	a4,a4,0x1
    802086e8:	9736                	add	a4,a4,a3
    802086ea:	01371023          	sh	s3,0(a4)
  __sync_synchronize();
    802086ee:	0ff0000f          	fence
  disk.avail[1] = disk.avail[1] + 1;
    802086f2:	6798                	ld	a4,8(a5)
    802086f4:	00275783          	lhu	a5,2(a4)
    802086f8:	2785                	addiw	a5,a5,1
    802086fa:	00f71123          	sh	a5,2(a4)

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    802086fe:	00003797          	auipc	a5,0x3
    80208702:	9127b783          	ld	a5,-1774(a5) # 8020b010 <digits+0xc90>
    80208706:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    8020870a:	00492703          	lw	a4,4(s2)
    8020870e:	4785                	li	a5,1
    80208710:	02f71163          	bne	a4,a5,80208732 <virtio_disk_rw+0x224>
    sleep(b, &disk.vdisk_lock);
    80208714:	00035997          	auipc	s3,0x35
    80208718:	99498993          	addi	s3,s3,-1644 # 8023d0a8 <disk+0x20a8>
  while(b->disk == 1) {
    8020871c:	4485                	li	s1,1
    sleep(b, &disk.vdisk_lock);
    8020871e:	85ce                	mv	a1,s3
    80208720:	854a                	mv	a0,s2
    80208722:	ffffa097          	auipc	ra,0xffffa
    80208726:	bd4080e7          	jalr	-1068(ra) # 802022f6 <sleep>
  while(b->disk == 1) {
    8020872a:	00492783          	lw	a5,4(s2)
    8020872e:	fe9788e3          	beq	a5,s1,8020871e <virtio_disk_rw+0x210>
  }

  disk.info[idx[0]].b = 0;
    80208732:	f9042483          	lw	s1,-112(s0)
    80208736:	20048793          	addi	a5,s1,512
    8020873a:	00479713          	slli	a4,a5,0x4
    8020873e:	00033797          	auipc	a5,0x33
    80208742:	8c278793          	addi	a5,a5,-1854 # 8023b000 <disk>
    80208746:	97ba                	add	a5,a5,a4
    80208748:	0207b423          	sd	zero,40(a5)
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    8020874c:	00035917          	auipc	s2,0x35
    80208750:	8b490913          	addi	s2,s2,-1868 # 8023d000 <disk+0x2000>
    free_desc(i);
    80208754:	8526                	mv	a0,s1
    80208756:	00000097          	auipc	ra,0x0
    8020875a:	bae080e7          	jalr	-1106(ra) # 80208304 <free_desc>
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    8020875e:	0492                	slli	s1,s1,0x4
    80208760:	00093783          	ld	a5,0(s2)
    80208764:	94be                	add	s1,s1,a5
    80208766:	00c4d783          	lhu	a5,12(s1)
    8020876a:	8b85                	andi	a5,a5,1
    8020876c:	cf89                	beqz	a5,80208786 <virtio_disk_rw+0x278>
      i = disk.desc[i].next;
    8020876e:	00e4d483          	lhu	s1,14(s1)
    free_desc(i);
    80208772:	b7cd                	j	80208754 <virtio_disk_rw+0x246>
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80208774:	00035797          	auipc	a5,0x35
    80208778:	88c7b783          	ld	a5,-1908(a5) # 8023d000 <disk+0x2000>
    8020877c:	97ba                	add	a5,a5,a4
    8020877e:	4689                	li	a3,2
    80208780:	00d79623          	sh	a3,12(a5)
    80208784:	b5ed                	j	8020866e <virtio_disk_rw+0x160>
  free_chain(idx[0]);

  release(&disk.vdisk_lock);
    80208786:	00035517          	auipc	a0,0x35
    8020878a:	92250513          	addi	a0,a0,-1758 # 8023d0a8 <disk+0x20a8>
    8020878e:	ffff8097          	auipc	ra,0xffff8
    80208792:	f8e080e7          	jalr	-114(ra) # 8020071c <release>
}
    80208796:	70e6                	ld	ra,120(sp)
    80208798:	7446                	ld	s0,112(sp)
    8020879a:	74a6                	ld	s1,104(sp)
    8020879c:	7906                	ld	s2,96(sp)
    8020879e:	69e6                	ld	s3,88(sp)
    802087a0:	6a46                	ld	s4,80(sp)
    802087a2:	6aa6                	ld	s5,72(sp)
    802087a4:	6b06                	ld	s6,64(sp)
    802087a6:	7be2                	ld	s7,56(sp)
    802087a8:	7c42                	ld	s8,48(sp)
    802087aa:	7ca2                	ld	s9,40(sp)
    802087ac:	7d02                	ld	s10,32(sp)
    802087ae:	6109                	addi	sp,sp,128
    802087b0:	8082                	ret
  if(write)
    802087b2:	e20c97e3          	bnez	s9,802085e0 <virtio_disk_rw+0xd2>
    buf0.type = VIRTIO_BLK_T_IN; // read the disk
    802087b6:	f8042023          	sw	zero,-128(s0)
    802087ba:	b535                	j	802085e6 <virtio_disk_rw+0xd8>

00000000802087bc <virtio_disk_intr>:

void
virtio_disk_intr()
{
    802087bc:	1101                	addi	sp,sp,-32
    802087be:	ec06                	sd	ra,24(sp)
    802087c0:	e822                	sd	s0,16(sp)
    802087c2:	e426                	sd	s1,8(sp)
    802087c4:	e04a                	sd	s2,0(sp)
    802087c6:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    802087c8:	00035517          	auipc	a0,0x35
    802087cc:	8e050513          	addi	a0,a0,-1824 # 8023d0a8 <disk+0x20a8>
    802087d0:	ffff8097          	auipc	ra,0xffff8
    802087d4:	ef8080e7          	jalr	-264(ra) # 802006c8 <acquire>

  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    802087d8:	00035717          	auipc	a4,0x35
    802087dc:	82870713          	addi	a4,a4,-2008 # 8023d000 <disk+0x2000>
    802087e0:	02075783          	lhu	a5,32(a4)
    802087e4:	6b18                	ld	a4,16(a4)
    802087e6:	00275683          	lhu	a3,2(a4)
    802087ea:	8ebd                	xor	a3,a3,a5
    802087ec:	8a9d                	andi	a3,a3,7
    802087ee:	cab9                	beqz	a3,80208844 <virtio_disk_intr+0x88>
    int id = disk.used->elems[disk.used_idx].id;

    if(disk.info[id].status != 0)
    802087f0:	00033917          	auipc	s2,0x33
    802087f4:	81090913          	addi	s2,s2,-2032 # 8023b000 <disk>
      panic("virtio_disk_intr status");
    
    disk.info[id].b->disk = 0;   // disk is done with buf
    wakeup(disk.info[id].b);

    disk.used_idx = (disk.used_idx + 1) % NUM;
    802087f8:	00035497          	auipc	s1,0x35
    802087fc:	80848493          	addi	s1,s1,-2040 # 8023d000 <disk+0x2000>
    int id = disk.used->elems[disk.used_idx].id;
    80208800:	078e                	slli	a5,a5,0x3
    80208802:	97ba                	add	a5,a5,a4
    80208804:	43dc                	lw	a5,4(a5)
    if(disk.info[id].status != 0)
    80208806:	20078713          	addi	a4,a5,512
    8020880a:	0712                	slli	a4,a4,0x4
    8020880c:	974a                	add	a4,a4,s2
    8020880e:	03074703          	lbu	a4,48(a4)
    80208812:	e335                	bnez	a4,80208876 <virtio_disk_intr+0xba>
    disk.info[id].b->disk = 0;   // disk is done with buf
    80208814:	20078793          	addi	a5,a5,512
    80208818:	0792                	slli	a5,a5,0x4
    8020881a:	97ca                	add	a5,a5,s2
    8020881c:	7798                	ld	a4,40(a5)
    8020881e:	00072223          	sw	zero,4(a4)
    wakeup(disk.info[id].b);
    80208822:	7788                	ld	a0,40(a5)
    80208824:	ffffa097          	auipc	ra,0xffffa
    80208828:	c56080e7          	jalr	-938(ra) # 8020247a <wakeup>
    disk.used_idx = (disk.used_idx + 1) % NUM;
    8020882c:	0204d783          	lhu	a5,32(s1)
    80208830:	2785                	addiw	a5,a5,1
    80208832:	8b9d                	andi	a5,a5,7
    80208834:	02f49023          	sh	a5,32(s1)
  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    80208838:	6898                	ld	a4,16(s1)
    8020883a:	00275683          	lhu	a3,2(a4)
    8020883e:	8a9d                	andi	a3,a3,7
    80208840:	fcf690e3          	bne	a3,a5,80208800 <virtio_disk_intr+0x44>
  }
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    80208844:	00002797          	auipc	a5,0x2
    80208848:	7d47b783          	ld	a5,2004(a5) # 8020b018 <digits+0xc98>
    8020884c:	439c                	lw	a5,0(a5)
    8020884e:	8b8d                	andi	a5,a5,3
    80208850:	00002717          	auipc	a4,0x2
    80208854:	7d073703          	ld	a4,2000(a4) # 8020b020 <digits+0xca0>
    80208858:	c31c                	sw	a5,0(a4)

  release(&disk.vdisk_lock);
    8020885a:	00035517          	auipc	a0,0x35
    8020885e:	84e50513          	addi	a0,a0,-1970 # 8023d0a8 <disk+0x20a8>
    80208862:	ffff8097          	auipc	ra,0xffff8
    80208866:	eba080e7          	jalr	-326(ra) # 8020071c <release>
}
    8020886a:	60e2                	ld	ra,24(sp)
    8020886c:	6442                	ld	s0,16(sp)
    8020886e:	64a2                	ld	s1,8(sp)
    80208870:	6902                	ld	s2,0(sp)
    80208872:	6105                	addi	sp,sp,32
    80208874:	8082                	ret
      panic("virtio_disk_intr status");
    80208876:	00002517          	auipc	a0,0x2
    8020887a:	72a50513          	addi	a0,a0,1834 # 8020afa0 <digits+0xc20>
    8020887e:	ffff8097          	auipc	ra,0xffff8
    80208882:	8c4080e7          	jalr	-1852(ra) # 80200142 <panic>

0000000080208886 <uartinit>:

void uartstart();

void
uartinit(void)
{
    80208886:	1141                	addi	sp,sp,-16
    80208888:	e406                	sd	ra,8(sp)
    8020888a:	e022                	sd	s0,0(sp)
    8020888c:	0800                	addi	s0,sp,16
  // disable interrupts.
  WriteReg(IER, 0x00);
    8020888e:	100007b7          	lui	a5,0x10000
    80208892:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x701fffff>

  // special mode to set baud rate.
  WriteReg(LCR, LCR_BAUD_LATCH);
    80208896:	f8000713          	li	a4,-128
    8020889a:	00e781a3          	sb	a4,3(a5)

  // LSB for baud rate of 38.4K.
  WriteReg(0, 0x03);
    8020889e:	470d                	li	a4,3
    802088a0:	00e78023          	sb	a4,0(a5)

  // MSB for baud rate of 38.4K.
  WriteReg(1, 0x00);
    802088a4:	000780a3          	sb	zero,1(a5)

  // leave set-baud mode,
  // and set word length to 8 bits, no parity.
  WriteReg(LCR, LCR_EIGHT_BITS);
    802088a8:	00e781a3          	sb	a4,3(a5)

  // reset and enable FIFOs.
  WriteReg(FCR, FCR_FIFO_ENABLE | FCR_FIFO_CLEAR);
    802088ac:	469d                	li	a3,7
    802088ae:	00d78123          	sb	a3,2(a5)

  // enable transmit and receive interrupts.
  WriteReg(IER, IER_TX_ENABLE | IER_RX_ENABLE);
    802088b2:	00e780a3          	sb	a4,1(a5)

    uart_tx_w = uart_tx_r = 0;
    802088b6:	00035797          	auipc	a5,0x35
    802088ba:	74a78793          	addi	a5,a5,1866 # 8023e000 <uart_tx_r>
    802088be:	0007a023          	sw	zero,0(a5)
    802088c2:	0007a223          	sw	zero,4(a5)

  initlock(&uart_tx_lock, "uart");
    802088c6:	00002597          	auipc	a1,0x2
    802088ca:	76258593          	addi	a1,a1,1890 # 8020b028 <digits+0xca8>
    802088ce:	00035517          	auipc	a0,0x35
    802088d2:	73a50513          	addi	a0,a0,1850 # 8023e008 <uart_tx_lock>
    802088d6:	ffff8097          	auipc	ra,0xffff8
    802088da:	dae080e7          	jalr	-594(ra) # 80200684 <initlock>
}
    802088de:	60a2                	ld	ra,8(sp)
    802088e0:	6402                	ld	s0,0(sp)
    802088e2:	0141                	addi	sp,sp,16
    802088e4:	8082                	ret

00000000802088e6 <uartputc_sync>:
// use interrupts, for use by kernel printf() and
// to echo characters. it spins waiting for the uart's
// output register to be empty.
void
uartputc_sync(int c)
{
    802088e6:	1101                	addi	sp,sp,-32
    802088e8:	ec06                	sd	ra,24(sp)
    802088ea:	e822                	sd	s0,16(sp)
    802088ec:	e426                	sd	s1,8(sp)
    802088ee:	1000                	addi	s0,sp,32
    802088f0:	84aa                	mv	s1,a0
  push_off();
    802088f2:	ffff8097          	auipc	ra,0xffff8
    802088f6:	ce6080e7          	jalr	-794(ra) # 802005d8 <push_off>

  if(panicked){
    802088fa:	00005797          	auipc	a5,0x5
    802088fe:	7c67b783          	ld	a5,1990(a5) # 8020e0c0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80208902:	439c                	lw	a5,0(a5)
    80208904:	2781                	sext.w	a5,a5
    for(;;)
      ;
  }

  // wait for Transmit Holding Empty to be set in LSR.
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    80208906:	10000737          	lui	a4,0x10000
  if(panicked){
    8020890a:	c391                	beqz	a5,8020890e <uartputc_sync+0x28>
    for(;;)
    8020890c:	a001                	j	8020890c <uartputc_sync+0x26>
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    8020890e:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x701ffffb>
    80208912:	0ff7f793          	andi	a5,a5,255
    80208916:	0207f793          	andi	a5,a5,32
    8020891a:	dbf5                	beqz	a5,8020890e <uartputc_sync+0x28>
    ;
  WriteReg(THR, c);
    8020891c:	0ff4f793          	andi	a5,s1,255
    80208920:	10000737          	lui	a4,0x10000
    80208924:	00f70023          	sb	a5,0(a4) # 10000000 <_entry-0x70200000>

  pop_off();
    80208928:	ffff8097          	auipc	ra,0xffff8
    8020892c:	cfc080e7          	jalr	-772(ra) # 80200624 <pop_off>
}
    80208930:	60e2                	ld	ra,24(sp)
    80208932:	6442                	ld	s0,16(sp)
    80208934:	64a2                	ld	s1,8(sp)
    80208936:	6105                	addi	sp,sp,32
    80208938:	8082                	ret

000000008020893a <uartstart>:
// called from both the top- and bottom-half.
void
uartstart()
{
  while(1){
    if(uart_tx_w == uart_tx_r){
    8020893a:	00035717          	auipc	a4,0x35
    8020893e:	6c670713          	addi	a4,a4,1734 # 8023e000 <uart_tx_r>
    80208942:	431c                	lw	a5,0(a4)
    80208944:	4358                	lw	a4,4(a4)
    80208946:	06f70563          	beq	a4,a5,802089b0 <uartstart+0x76>
{
    8020894a:	7179                	addi	sp,sp,-48
    8020894c:	f406                	sd	ra,40(sp)
    8020894e:	f022                	sd	s0,32(sp)
    80208950:	ec26                	sd	s1,24(sp)
    80208952:	e84a                	sd	s2,16(sp)
    80208954:	e44e                	sd	s3,8(sp)
    80208956:	1800                	addi	s0,sp,48
      // transmit buffer is empty.
      return;
    }
    
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    80208958:	10000937          	lui	s2,0x10000
      // so we cannot give it another byte.
      // it will interrupt when it's ready for a new byte.
      return;
    }
    
    int c = uart_tx_buf[uart_tx_r];
    8020895c:	00035497          	auipc	s1,0x35
    80208960:	6a448493          	addi	s1,s1,1700 # 8023e000 <uart_tx_r>
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    80208964:	00594703          	lbu	a4,5(s2) # 10000005 <_entry-0x701ffffb>
    80208968:	0ff77713          	andi	a4,a4,255
    8020896c:	02077713          	andi	a4,a4,32
    80208970:	cb0d                	beqz	a4,802089a2 <uartstart+0x68>
    int c = uart_tx_buf[uart_tx_r];
    80208972:	00f48733          	add	a4,s1,a5
    80208976:	02074983          	lbu	s3,32(a4)
    uart_tx_r = (uart_tx_r + 1) % UART_TX_BUF_SIZE;
    8020897a:	2785                	addiw	a5,a5,1
    8020897c:	41f7d71b          	sraiw	a4,a5,0x1f
    80208980:	01b7571b          	srliw	a4,a4,0x1b
    80208984:	9fb9                	addw	a5,a5,a4
    80208986:	8bfd                	andi	a5,a5,31
    80208988:	9f99                	subw	a5,a5,a4
    8020898a:	c09c                	sw	a5,0(s1)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    8020898c:	8526                	mv	a0,s1
    8020898e:	ffffa097          	auipc	ra,0xffffa
    80208992:	aec080e7          	jalr	-1300(ra) # 8020247a <wakeup>
    
    WriteReg(THR, c);
    80208996:	01390023          	sb	s3,0(s2)
    if(uart_tx_w == uart_tx_r){
    8020899a:	409c                	lw	a5,0(s1)
    8020899c:	40d8                	lw	a4,4(s1)
    8020899e:	fcf713e3          	bne	a4,a5,80208964 <uartstart+0x2a>
  }
}
    802089a2:	70a2                	ld	ra,40(sp)
    802089a4:	7402                	ld	s0,32(sp)
    802089a6:	64e2                	ld	s1,24(sp)
    802089a8:	6942                	ld	s2,16(sp)
    802089aa:	69a2                	ld	s3,8(sp)
    802089ac:	6145                	addi	sp,sp,48
    802089ae:	8082                	ret
    802089b0:	8082                	ret

00000000802089b2 <uartputc>:
{
    802089b2:	7179                	addi	sp,sp,-48
    802089b4:	f406                	sd	ra,40(sp)
    802089b6:	f022                	sd	s0,32(sp)
    802089b8:	ec26                	sd	s1,24(sp)
    802089ba:	e84a                	sd	s2,16(sp)
    802089bc:	e44e                	sd	s3,8(sp)
    802089be:	1800                	addi	s0,sp,48
    802089c0:	892a                	mv	s2,a0
  acquire(&uart_tx_lock);
    802089c2:	00035517          	auipc	a0,0x35
    802089c6:	64650513          	addi	a0,a0,1606 # 8023e008 <uart_tx_lock>
    802089ca:	ffff8097          	auipc	ra,0xffff8
    802089ce:	cfe080e7          	jalr	-770(ra) # 802006c8 <acquire>
  if(panicked){
    802089d2:	00005797          	auipc	a5,0x5
    802089d6:	6ee7b783          	ld	a5,1774(a5) # 8020e0c0 <_GLOBAL_OFFSET_TABLE_+0x10>
    802089da:	439c                	lw	a5,0(a5)
    802089dc:	2781                	sext.w	a5,a5
    802089de:	c391                	beqz	a5,802089e2 <uartputc+0x30>
    for(;;)
    802089e0:	a001                	j	802089e0 <uartputc+0x2e>
    if(((uart_tx_w + 1) % UART_TX_BUF_SIZE) == uart_tx_r){
    802089e2:	00035617          	auipc	a2,0x35
    802089e6:	61e60613          	addi	a2,a2,1566 # 8023e000 <uart_tx_r>
    802089ea:	4258                	lw	a4,4(a2)
    802089ec:	0017079b          	addiw	a5,a4,1
    802089f0:	41f7d69b          	sraiw	a3,a5,0x1f
    802089f4:	01b6d69b          	srliw	a3,a3,0x1b
    802089f8:	9fb5                	addw	a5,a5,a3
    802089fa:	8bfd                	andi	a5,a5,31
    802089fc:	9f95                	subw	a5,a5,a3
    802089fe:	4214                	lw	a3,0(a2)
    80208a00:	02f69a63          	bne	a3,a5,80208a34 <uartputc+0x82>
      sleep(&uart_tx_r, &uart_tx_lock);
    80208a04:	84b2                	mv	s1,a2
    80208a06:	00035997          	auipc	s3,0x35
    80208a0a:	60298993          	addi	s3,s3,1538 # 8023e008 <uart_tx_lock>
    80208a0e:	85ce                	mv	a1,s3
    80208a10:	8526                	mv	a0,s1
    80208a12:	ffffa097          	auipc	ra,0xffffa
    80208a16:	8e4080e7          	jalr	-1820(ra) # 802022f6 <sleep>
    if(((uart_tx_w + 1) % UART_TX_BUF_SIZE) == uart_tx_r){
    80208a1a:	40d8                	lw	a4,4(s1)
    80208a1c:	0017079b          	addiw	a5,a4,1
    80208a20:	41f7d69b          	sraiw	a3,a5,0x1f
    80208a24:	01b6d69b          	srliw	a3,a3,0x1b
    80208a28:	9fb5                	addw	a5,a5,a3
    80208a2a:	8bfd                	andi	a5,a5,31
    80208a2c:	9f95                	subw	a5,a5,a3
    80208a2e:	4094                	lw	a3,0(s1)
    80208a30:	fcf68fe3          	beq	a3,a5,80208a0e <uartputc+0x5c>
      uart_tx_buf[uart_tx_w] = c;
    80208a34:	00035697          	auipc	a3,0x35
    80208a38:	5cc68693          	addi	a3,a3,1484 # 8023e000 <uart_tx_r>
    80208a3c:	9736                	add	a4,a4,a3
    80208a3e:	03270023          	sb	s2,32(a4)
      uart_tx_w = (uart_tx_w + 1) % UART_TX_BUF_SIZE;
    80208a42:	c2dc                	sw	a5,4(a3)
      uartstart();
    80208a44:	00000097          	auipc	ra,0x0
    80208a48:	ef6080e7          	jalr	-266(ra) # 8020893a <uartstart>
      release(&uart_tx_lock);
    80208a4c:	00035517          	auipc	a0,0x35
    80208a50:	5bc50513          	addi	a0,a0,1468 # 8023e008 <uart_tx_lock>
    80208a54:	ffff8097          	auipc	ra,0xffff8
    80208a58:	cc8080e7          	jalr	-824(ra) # 8020071c <release>
}
    80208a5c:	70a2                	ld	ra,40(sp)
    80208a5e:	7402                	ld	s0,32(sp)
    80208a60:	64e2                	ld	s1,24(sp)
    80208a62:	6942                	ld	s2,16(sp)
    80208a64:	69a2                	ld	s3,8(sp)
    80208a66:	6145                	addi	sp,sp,48
    80208a68:	8082                	ret

0000000080208a6a <uartgetc>:

// read one input character from the UART.
// return -1 if none is waiting.
int
uartgetc(void)
{
    80208a6a:	1141                	addi	sp,sp,-16
    80208a6c:	e422                	sd	s0,8(sp)
    80208a6e:	0800                	addi	s0,sp,16
  if(ReadReg(LSR) & 0x01){
    80208a70:	100007b7          	lui	a5,0x10000
    80208a74:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x701ffffb>
    80208a78:	8b85                	andi	a5,a5,1
    80208a7a:	cb91                	beqz	a5,80208a8e <uartgetc+0x24>
    // input data is ready.
    return ReadReg(RHR);
    80208a7c:	100007b7          	lui	a5,0x10000
    80208a80:	0007c503          	lbu	a0,0(a5) # 10000000 <_entry-0x70200000>
    80208a84:	0ff57513          	andi	a0,a0,255
  } else {
    return -1;
  }
}
    80208a88:	6422                	ld	s0,8(sp)
    80208a8a:	0141                	addi	sp,sp,16
    80208a8c:	8082                	ret
    return -1;
    80208a8e:	557d                	li	a0,-1
    80208a90:	bfe5                	j	80208a88 <uartgetc+0x1e>

0000000080208a92 <uartintr>:
// handle a uart interrupt, raised because input has
// arrived, or the uart is ready for more output, or
// both. called from trap.c.
void
uartintr(void)
{
    80208a92:	1101                	addi	sp,sp,-32
    80208a94:	ec06                	sd	ra,24(sp)
    80208a96:	e822                	sd	s0,16(sp)
    80208a98:	e426                	sd	s1,8(sp)
    80208a9a:	1000                	addi	s0,sp,32
  // read and process incoming characters.
  while(1){
    int c = uartgetc();
    if(c == -1)
    80208a9c:	54fd                	li	s1,-1
    int c = uartgetc();
    80208a9e:	00000097          	auipc	ra,0x0
    80208aa2:	fcc080e7          	jalr	-52(ra) # 80208a6a <uartgetc>
    if(c == -1)
    80208aa6:	00950763          	beq	a0,s1,80208ab4 <uartintr+0x22>
      break;
    consoleintr(c);
    80208aaa:	fffff097          	auipc	ra,0xfffff
    80208aae:	66a080e7          	jalr	1642(ra) # 80208114 <consoleintr>
  while(1){
    80208ab2:	b7f5                	j	80208a9e <uartintr+0xc>
  }

  // send buffered characters.
  acquire(&uart_tx_lock);
    80208ab4:	00035497          	auipc	s1,0x35
    80208ab8:	55448493          	addi	s1,s1,1364 # 8023e008 <uart_tx_lock>
    80208abc:	8526                	mv	a0,s1
    80208abe:	ffff8097          	auipc	ra,0xffff8
    80208ac2:	c0a080e7          	jalr	-1014(ra) # 802006c8 <acquire>
  uartstart();
    80208ac6:	00000097          	auipc	ra,0x0
    80208aca:	e74080e7          	jalr	-396(ra) # 8020893a <uartstart>
  release(&uart_tx_lock);
    80208ace:	8526                	mv	a0,s1
    80208ad0:	ffff8097          	auipc	ra,0xffff8
    80208ad4:	c4c080e7          	jalr	-948(ra) # 8020071c <release>
}
    80208ad8:	60e2                	ld	ra,24(sp)
    80208ada:	6442                	ld	s0,16(sp)
    80208adc:	64a2                	ld	s1,8(sp)
    80208ade:	6105                	addi	sp,sp,32
    80208ae0:	8082                	ret
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
