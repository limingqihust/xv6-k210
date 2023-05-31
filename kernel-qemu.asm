
kernel-qemu:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_entry>:
    80200000:	00150293          	addi	t0,a0,1
    80200004:	02ba                	slli	t0,t0,0xe
    80200006:	0000e117          	auipc	sp,0xe
    8020000a:	cca13103          	ld	sp,-822(sp) # 8020dcd0 <_GLOBAL_OFFSET_TABLE_+0x60>
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
    80200098:	710080e7          	jalr	1808(ra) # 802077a4 <consputc>
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
    802000ce:	6da080e7          	jalr	1754(ra) # 802077a4 <consputc>
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
    80200222:	586080e7          	jalr	1414(ra) # 802077a4 <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80200226:	2485                	addiw	s1,s1,1
    80200228:	009a07b3          	add	a5,s4,s1
    8020022c:	0007c503          	lbu	a0,0(a5) # fffffffffffff000 <kernel_end+0xffffffff7fdd6000>
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
    802002b4:	4f4080e7          	jalr	1268(ra) # 802077a4 <consputc>
  consputc('x');
    802002b8:	07800513          	li	a0,120
    802002bc:	00007097          	auipc	ra,0x7
    802002c0:	4e8080e7          	jalr	1256(ra) # 802077a4 <consputc>
    802002c4:	896a                	mv	s2,s10
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802002c6:	03c9d793          	srli	a5,s3,0x3c
    802002ca:	97de                	add	a5,a5,s7
    802002cc:	0007c503          	lbu	a0,0(a5)
    802002d0:	00007097          	auipc	ra,0x7
    802002d4:	4d4080e7          	jalr	1236(ra) # 802077a4 <consputc>
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
    80200300:	4a8080e7          	jalr	1192(ra) # 802077a4 <consputc>
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
    80200322:	486080e7          	jalr	1158(ra) # 802077a4 <consputc>
      break;
    80200326:	b701                	j	80200226 <printf+0x9a>
      consputc('%');
    80200328:	8556                	mv	a0,s5
    8020032a:	00007097          	auipc	ra,0x7
    8020032e:	47a080e7          	jalr	1146(ra) # 802077a4 <consputc>
      consputc(c);
    80200332:	854a                	mv	a0,s2
    80200334:	00007097          	auipc	ra,0x7
    80200338:	470080e7          	jalr	1136(ra) # 802077a4 <consputc>
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
    80200458:	0000e797          	auipc	a5,0xe
    8020045c:	8487b783          	ld	a5,-1976(a5) # 8020dca0 <_GLOBAL_OFFSET_TABLE_+0x30>
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
    80200546:	75e53503          	ld	a0,1886(a0) # 8020dca0 <_GLOBAL_OFFSET_TABLE_+0x30>
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

extern char _entry[];

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
    80200a20:	e1a080e7          	jalr	-486(ra) # 80202836 <trapinithart>
    plicinithart();  // ask PLIC for device interrupts
    80200a24:	00007097          	auipc	ra,0x7
    80200a28:	b3a080e7          	jalr	-1222(ra) # 8020755e <plicinithart>
    printf("hart 1 init done\n");
    80200a2c:	0000a517          	auipc	a0,0xa
    80200a30:	9c450513          	addi	a0,a0,-1596 # 8020a3f0 <digits+0x70>
    80200a34:	fffff097          	auipc	ra,0xfffff
    80200a38:	758080e7          	jalr	1880(ra) # 8020018c <printf>
  }
  scheduler();
    80200a3c:	00001097          	auipc	ra,0x1
    80200a40:	5b4080e7          	jalr	1460(ra) # 80201ff0 <scheduler>
    consoleinit();
    80200a44:	00007097          	auipc	ra,0x7
    80200a48:	f30080e7          	jalr	-208(ra) # 80207974 <consoleinit>
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
    80200a78:	0ba080e7          	jalr	186(ra) # 80205b2e <timerinit>
    trapinithart();  // install kernel trap vector, including interrupt handler
    80200a7c:	00002097          	auipc	ra,0x2
    80200a80:	dba080e7          	jalr	-582(ra) # 80202836 <trapinithart>
    procinit();
    80200a84:	00001097          	auipc	ra,0x1
    80200a88:	f4e080e7          	jalr	-178(ra) # 802019d2 <procinit>
    plicinit();
    80200a8c:	00007097          	auipc	ra,0x7
    80200a90:	aba080e7          	jalr	-1350(ra) # 80207546 <plicinit>
    plicinithart();
    80200a94:	00007097          	auipc	ra,0x7
    80200a98:	aca080e7          	jalr	-1334(ra) # 8020755e <plicinithart>
    disk_init();
    80200a9c:	00005097          	auipc	ra,0x5
    80200aa0:	12e080e7          	jalr	302(ra) # 80205bca <disk_init>
    binit();         // buffer cache
    80200aa4:	00003097          	auipc	ra,0x3
    80200aa8:	c34080e7          	jalr	-972(ra) # 802036d8 <binit>
    fileinit();      // file table
    80200aac:	00003097          	auipc	ra,0x3
    80200ab0:	038080e7          	jalr	56(ra) # 80203ae4 <fileinit>
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
    80200ae4:	0000d597          	auipc	a1,0xd
    80200ae8:	1cc5b583          	ld	a1,460(a1) # 8020dcb0 <_GLOBAL_OFFSET_TABLE_+0x40>
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
    80200dee:	0000d497          	auipc	s1,0xd
    80200df2:	eaa4b483          	ld	s1,-342(s1) # 8020dc98 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80200e2a:	0000d597          	auipc	a1,0xd
    80200e2e:	e4e5b583          	ld	a1,-434(a1) # 8020dc78 <_GLOBAL_OFFSET_TABLE_+0x8>
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
    80201550:	00074703          	lbu	a4,0(a4) # fffffffffffff000 <kernel_end+0xffffffff7fdd6000>
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
    802017dc:	000ab603          	ld	a2,0(s5) # fffffffffffff000 <kernel_end+0xffffffff7fdd6000>
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
    80201820:	000bb603          	ld	a2,0(s7) # fffffffffffff000 <kernel_end+0xffffffff7fdd6000>
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
    80201a08:	00019917          	auipc	s2,0x19
    80201a0c:	0e890913          	addi	s2,s2,232 # 8021aaf0 <bcache>
    initlock(&p->lock, "proc");
    80201a10:	85ce                	mv	a1,s3
    80201a12:	8526                	mv	a0,s1
    80201a14:	fffff097          	auipc	ra,0xfffff
    80201a18:	c70080e7          	jalr	-912(ra) # 80200684 <initlock>
  for (p = proc; p < &proc[NPROC]; p++)
    80201a1c:	17848493          	addi	s1,s1,376
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
    80201aca:	53a7a783          	lw	a5,1338(a5) # 8020b000 <first.1692>
    80201ace:	eb91                	bnez	a5,80201ae2 <forkret+0x36>
  usertrapret();
    80201ad0:	00001097          	auipc	ra,0x1
    80201ad4:	da2080e7          	jalr	-606(ra) # 80202872 <usertrapret>
}
    80201ad8:	60e2                	ld	ra,24(sp)
    80201ada:	6442                	ld	s0,16(sp)
    80201adc:	64a2                	ld	s1,8(sp)
    80201ade:	6105                	addi	sp,sp,32
    80201ae0:	8082                	ret
    first = 0;
    80201ae2:	00009797          	auipc	a5,0x9
    80201ae6:	5007af23          	sw	zero,1310(a5) # 8020b000 <first.1692>
    fat32_init();
    80201aea:	00004097          	auipc	ra,0x4
    80201aee:	7c8080e7          	jalr	1992(ra) # 802062b2 <fat32_init>
    myproc()->cwd = ename("/");
    80201af2:	00000097          	auipc	ra,0x0
    80201af6:	f82080e7          	jalr	-126(ra) # 80201a74 <myproc>
    80201afa:	84aa                	mv	s1,a0
    80201afc:	00009517          	auipc	a0,0x9
    80201b00:	b3450513          	addi	a0,a0,-1228 # 8020a630 <digits+0x2b0>
    80201b04:	00006097          	auipc	ra,0x6
    80201b08:	a08080e7          	jalr	-1528(ra) # 8020750c <ename>
    80201b0c:	14a4bc23          	sd	a0,344(s1)
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
    80201b34:	4d078793          	addi	a5,a5,1232 # 8020b000 <first.1692>
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
    80201b74:	0000c697          	auipc	a3,0xc
    80201b78:	1046b683          	ld	a3,260(a3) # 8020dc78 <_GLOBAL_OFFSET_TABLE_+0x8>
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
    80201c92:	16048023          	sb	zero,352(s1)
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
    80201cc4:	00019917          	auipc	s2,0x19
    80201cc8:	e2c90913          	addi	s2,s2,-468 # 8021aaf0 <bcache>
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
    80201ce4:	17848493          	addi	s1,s1,376
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
    80201d8a:	e04a                	sd	s2,0(sp)
    80201d8c:	1000                	addi	s0,sp,32
  p = allocproc();
    80201d8e:	00000097          	auipc	ra,0x0
    80201d92:	f22080e7          	jalr	-222(ra) # 80201cb0 <allocproc>
    80201d96:	84aa                	mv	s1,a0
  initproc = p;
    80201d98:	00014797          	auipc	a5,0x14
    80201d9c:	3ea7b023          	sd	a0,992(a5) # 80216178 <initproc>
  uvminit(p->pagetable, p->kpagetable, initcode, sizeof(initcode));
    80201da0:	6905                	lui	s2,0x1
    80201da2:	bc090693          	addi	a3,s2,-1088 # bc0 <_entry-0x801ff440>
    80201da6:	00009617          	auipc	a2,0x9
    80201daa:	29a60613          	addi	a2,a2,666 # 8020b040 <initcode>
    80201dae:	6d2c                	ld	a1,88(a0)
    80201db0:	6928                	ld	a0,80(a0)
    80201db2:	fffff097          	auipc	ra,0xfffff
    80201db6:	18c080e7          	jalr	396(ra) # 80200f3e <uvminit>
  p->sz = PGSIZE;
    80201dba:	0524b423          	sd	s2,72(s1)
  p->trapframe->epc = 0x0;   // user program counter
    80201dbe:	70bc                	ld	a5,96(s1)
    80201dc0:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE; // user stack pointer
    80201dc4:	70bc                	ld	a5,96(s1)
    80201dc6:	0327b823          	sd	s2,48(a5)
  safestrcpy(p->name, "initcode", sizeof(p->name));
    80201dca:	4641                	li	a2,16
    80201dcc:	00009597          	auipc	a1,0x9
    80201dd0:	86c58593          	addi	a1,a1,-1940 # 8020a638 <digits+0x2b8>
    80201dd4:	16048513          	addi	a0,s1,352
    80201dd8:	fffff097          	auipc	ra,0xfffff
    80201ddc:	ae2080e7          	jalr	-1310(ra) # 802008ba <safestrcpy>
  p->state = RUNNABLE;
    80201de0:	4789                	li	a5,2
    80201de2:	cc9c                	sw	a5,24(s1)
  p->tmask = 0;
    80201de4:	1604a823          	sw	zero,368(s1)
  release(&p->lock);
    80201de8:	8526                	mv	a0,s1
    80201dea:	fffff097          	auipc	ra,0xfffff
    80201dee:	932080e7          	jalr	-1742(ra) # 8020071c <release>
}
    80201df2:	60e2                	ld	ra,24(sp)
    80201df4:	6442                	ld	s0,16(sp)
    80201df6:	64a2                	ld	s1,8(sp)
    80201df8:	6902                	ld	s2,0(sp)
    80201dfa:	6105                	addi	sp,sp,32
    80201dfc:	8082                	ret

0000000080201dfe <growproc>:
{
    80201dfe:	1101                	addi	sp,sp,-32
    80201e00:	ec06                	sd	ra,24(sp)
    80201e02:	e822                	sd	s0,16(sp)
    80201e04:	e426                	sd	s1,8(sp)
    80201e06:	e04a                	sd	s2,0(sp)
    80201e08:	1000                	addi	s0,sp,32
    80201e0a:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80201e0c:	00000097          	auipc	ra,0x0
    80201e10:	c68080e7          	jalr	-920(ra) # 80201a74 <myproc>
    80201e14:	892a                	mv	s2,a0
  sz = p->sz;
    80201e16:	6530                	ld	a2,72(a0)
    80201e18:	0006069b          	sext.w	a3,a2
  if (n > 0)
    80201e1c:	00904f63          	bgtz	s1,80201e3a <growproc+0x3c>
  else if (n < 0)
    80201e20:	0204cd63          	bltz	s1,80201e5a <growproc+0x5c>
  p->sz = sz;
    80201e24:	1682                	slli	a3,a3,0x20
    80201e26:	9281                	srli	a3,a3,0x20
    80201e28:	04d93423          	sd	a3,72(s2)
  return 0;
    80201e2c:	4501                	li	a0,0
}
    80201e2e:	60e2                	ld	ra,24(sp)
    80201e30:	6442                	ld	s0,16(sp)
    80201e32:	64a2                	ld	s1,8(sp)
    80201e34:	6902                	ld	s2,0(sp)
    80201e36:	6105                	addi	sp,sp,32
    80201e38:	8082                	ret
    if ((sz = uvmalloc(p->pagetable, p->kpagetable, sz, sz + n)) == 0)
    80201e3a:	9ea5                	addw	a3,a3,s1
    80201e3c:	1682                	slli	a3,a3,0x20
    80201e3e:	9281                	srli	a3,a3,0x20
    80201e40:	1602                	slli	a2,a2,0x20
    80201e42:	9201                	srli	a2,a2,0x20
    80201e44:	6d2c                	ld	a1,88(a0)
    80201e46:	6928                	ld	a0,80(a0)
    80201e48:	fffff097          	auipc	ra,0xfffff
    80201e4c:	1ec080e7          	jalr	492(ra) # 80201034 <uvmalloc>
    80201e50:	0005069b          	sext.w	a3,a0
    80201e54:	fae1                	bnez	a3,80201e24 <growproc+0x26>
      return -1;
    80201e56:	557d                	li	a0,-1
    80201e58:	bfd9                	j	80201e2e <growproc+0x30>
    sz = uvmdealloc(p->pagetable, p->kpagetable, sz, sz + n);
    80201e5a:	9ea5                	addw	a3,a3,s1
    80201e5c:	1682                	slli	a3,a3,0x20
    80201e5e:	9281                	srli	a3,a3,0x20
    80201e60:	1602                	slli	a2,a2,0x20
    80201e62:	9201                	srli	a2,a2,0x20
    80201e64:	6d2c                	ld	a1,88(a0)
    80201e66:	6928                	ld	a0,80(a0)
    80201e68:	fffff097          	auipc	ra,0xfffff
    80201e6c:	160080e7          	jalr	352(ra) # 80200fc8 <uvmdealloc>
    80201e70:	0005069b          	sext.w	a3,a0
    80201e74:	bf45                	j	80201e24 <growproc+0x26>

0000000080201e76 <fork>:
{
    80201e76:	7179                	addi	sp,sp,-48
    80201e78:	f406                	sd	ra,40(sp)
    80201e7a:	f022                	sd	s0,32(sp)
    80201e7c:	ec26                	sd	s1,24(sp)
    80201e7e:	e84a                	sd	s2,16(sp)
    80201e80:	e44e                	sd	s3,8(sp)
    80201e82:	e052                	sd	s4,0(sp)
    80201e84:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80201e86:	00000097          	auipc	ra,0x0
    80201e8a:	bee080e7          	jalr	-1042(ra) # 80201a74 <myproc>
    80201e8e:	892a                	mv	s2,a0
  if ((np = allocproc()) == NULL)
    80201e90:	00000097          	auipc	ra,0x0
    80201e94:	e20080e7          	jalr	-480(ra) # 80201cb0 <allocproc>
    80201e98:	c57d                	beqz	a0,80201f86 <fork+0x110>
    80201e9a:	89aa                	mv	s3,a0
  if (uvmcopy(p->pagetable, np->pagetable, np->kpagetable, p->sz) < 0)
    80201e9c:	04893683          	ld	a3,72(s2)
    80201ea0:	6d30                	ld	a2,88(a0)
    80201ea2:	692c                	ld	a1,80(a0)
    80201ea4:	05093503          	ld	a0,80(s2)
    80201ea8:	fffff097          	auipc	ra,0xfffff
    80201eac:	324080e7          	jalr	804(ra) # 802011cc <uvmcopy>
    80201eb0:	04054c63          	bltz	a0,80201f08 <fork+0x92>
  np->sz = p->sz;
    80201eb4:	04893783          	ld	a5,72(s2)
    80201eb8:	04f9b423          	sd	a5,72(s3)
  np->parent = p;
    80201ebc:	0329b023          	sd	s2,32(s3)
  np->tmask = p->tmask;
    80201ec0:	17092783          	lw	a5,368(s2)
    80201ec4:	16f9a823          	sw	a5,368(s3)
  *(np->trapframe) = *(p->trapframe);
    80201ec8:	06093683          	ld	a3,96(s2)
    80201ecc:	87b6                	mv	a5,a3
    80201ece:	0609b703          	ld	a4,96(s3)
    80201ed2:	12068693          	addi	a3,a3,288
    80201ed6:	0007b803          	ld	a6,0(a5)
    80201eda:	6788                	ld	a0,8(a5)
    80201edc:	6b8c                	ld	a1,16(a5)
    80201ede:	6f90                	ld	a2,24(a5)
    80201ee0:	01073023          	sd	a6,0(a4) # 1000 <_entry-0x801ff000>
    80201ee4:	e708                	sd	a0,8(a4)
    80201ee6:	eb0c                	sd	a1,16(a4)
    80201ee8:	ef10                	sd	a2,24(a4)
    80201eea:	02078793          	addi	a5,a5,32
    80201eee:	02070713          	addi	a4,a4,32
    80201ef2:	fed792e3          	bne	a5,a3,80201ed6 <fork+0x60>
  np->trapframe->a0 = 0;
    80201ef6:	0609b783          	ld	a5,96(s3)
    80201efa:	0607b823          	sd	zero,112(a5)
    80201efe:	0d800493          	li	s1,216
  for (i = 0; i < NOFILE; i++)
    80201f02:	15800a13          	li	s4,344
    80201f06:	a03d                	j	80201f34 <fork+0xbe>
    freeproc(np);
    80201f08:	854e                	mv	a0,s3
    80201f0a:	00000097          	auipc	ra,0x0
    80201f0e:	d3c080e7          	jalr	-708(ra) # 80201c46 <freeproc>
    release(&np->lock);
    80201f12:	854e                	mv	a0,s3
    80201f14:	fffff097          	auipc	ra,0xfffff
    80201f18:	808080e7          	jalr	-2040(ra) # 8020071c <release>
    return -1;
    80201f1c:	54fd                	li	s1,-1
    80201f1e:	a899                	j	80201f74 <fork+0xfe>
      np->ofile[i] = filedup(p->ofile[i]);
    80201f20:	00002097          	auipc	ra,0x2
    80201f24:	c86080e7          	jalr	-890(ra) # 80203ba6 <filedup>
    80201f28:	009987b3          	add	a5,s3,s1
    80201f2c:	e388                	sd	a0,0(a5)
  for (i = 0; i < NOFILE; i++)
    80201f2e:	04a1                	addi	s1,s1,8
    80201f30:	01448763          	beq	s1,s4,80201f3e <fork+0xc8>
    if (p->ofile[i])
    80201f34:	009907b3          	add	a5,s2,s1
    80201f38:	6388                	ld	a0,0(a5)
    80201f3a:	f17d                	bnez	a0,80201f20 <fork+0xaa>
    80201f3c:	bfcd                	j	80201f2e <fork+0xb8>
  np->cwd = edup(p->cwd);
    80201f3e:	15893503          	ld	a0,344(s2)
    80201f42:	00005097          	auipc	ra,0x5
    80201f46:	bc2080e7          	jalr	-1086(ra) # 80206b04 <edup>
    80201f4a:	14a9bc23          	sd	a0,344(s3)
  safestrcpy(np->name, p->name, sizeof(p->name));
    80201f4e:	4641                	li	a2,16
    80201f50:	16090593          	addi	a1,s2,352
    80201f54:	16098513          	addi	a0,s3,352
    80201f58:	fffff097          	auipc	ra,0xfffff
    80201f5c:	962080e7          	jalr	-1694(ra) # 802008ba <safestrcpy>
  pid = np->pid;
    80201f60:	0389a483          	lw	s1,56(s3)
  np->state = RUNNABLE;
    80201f64:	4789                	li	a5,2
    80201f66:	00f9ac23          	sw	a5,24(s3)
  release(&np->lock);
    80201f6a:	854e                	mv	a0,s3
    80201f6c:	ffffe097          	auipc	ra,0xffffe
    80201f70:	7b0080e7          	jalr	1968(ra) # 8020071c <release>
}
    80201f74:	8526                	mv	a0,s1
    80201f76:	70a2                	ld	ra,40(sp)
    80201f78:	7402                	ld	s0,32(sp)
    80201f7a:	64e2                	ld	s1,24(sp)
    80201f7c:	6942                	ld	s2,16(sp)
    80201f7e:	69a2                	ld	s3,8(sp)
    80201f80:	6a02                	ld	s4,0(sp)
    80201f82:	6145                	addi	sp,sp,48
    80201f84:	8082                	ret
    return -1;
    80201f86:	54fd                	li	s1,-1
    80201f88:	b7f5                	j	80201f74 <fork+0xfe>

0000000080201f8a <reparent>:
{
    80201f8a:	7179                	addi	sp,sp,-48
    80201f8c:	f406                	sd	ra,40(sp)
    80201f8e:	f022                	sd	s0,32(sp)
    80201f90:	ec26                	sd	s1,24(sp)
    80201f92:	e84a                	sd	s2,16(sp)
    80201f94:	e44e                	sd	s3,8(sp)
    80201f96:	e052                	sd	s4,0(sp)
    80201f98:	1800                	addi	s0,sp,48
    80201f9a:	892a                	mv	s2,a0
  for (pp = proc; pp < &proc[NPROC]; pp++)
    80201f9c:	00014497          	auipc	s1,0x14
    80201fa0:	1e448493          	addi	s1,s1,484 # 80216180 <proc>
      pp->parent = initproc;
    80201fa4:	00014a17          	auipc	s4,0x14
    80201fa8:	0bca0a13          	addi	s4,s4,188 # 80216060 <pid_lock>
  for (pp = proc; pp < &proc[NPROC]; pp++)
    80201fac:	00019997          	auipc	s3,0x19
    80201fb0:	b4498993          	addi	s3,s3,-1212 # 8021aaf0 <bcache>
    80201fb4:	a029                	j	80201fbe <reparent+0x34>
    80201fb6:	17848493          	addi	s1,s1,376
    80201fba:	03348363          	beq	s1,s3,80201fe0 <reparent+0x56>
    if (pp->parent == p)
    80201fbe:	709c                	ld	a5,32(s1)
    80201fc0:	ff279be3          	bne	a5,s2,80201fb6 <reparent+0x2c>
      acquire(&pp->lock);
    80201fc4:	8526                	mv	a0,s1
    80201fc6:	ffffe097          	auipc	ra,0xffffe
    80201fca:	702080e7          	jalr	1794(ra) # 802006c8 <acquire>
      pp->parent = initproc;
    80201fce:	118a3783          	ld	a5,280(s4)
    80201fd2:	f09c                	sd	a5,32(s1)
      release(&pp->lock);
    80201fd4:	8526                	mv	a0,s1
    80201fd6:	ffffe097          	auipc	ra,0xffffe
    80201fda:	746080e7          	jalr	1862(ra) # 8020071c <release>
    80201fde:	bfe1                	j	80201fb6 <reparent+0x2c>
}
    80201fe0:	70a2                	ld	ra,40(sp)
    80201fe2:	7402                	ld	s0,32(sp)
    80201fe4:	64e2                	ld	s1,24(sp)
    80201fe6:	6942                	ld	s2,16(sp)
    80201fe8:	69a2                	ld	s3,8(sp)
    80201fea:	6a02                	ld	s4,0(sp)
    80201fec:	6145                	addi	sp,sp,48
    80201fee:	8082                	ret

0000000080201ff0 <scheduler>:
{
    80201ff0:	715d                	addi	sp,sp,-80
    80201ff2:	e486                	sd	ra,72(sp)
    80201ff4:	e0a2                	sd	s0,64(sp)
    80201ff6:	fc26                	sd	s1,56(sp)
    80201ff8:	f84a                	sd	s2,48(sp)
    80201ffa:	f44e                	sd	s3,40(sp)
    80201ffc:	f052                	sd	s4,32(sp)
    80201ffe:	ec56                	sd	s5,24(sp)
    80202000:	e85a                	sd	s6,16(sp)
    80202002:	e45e                	sd	s7,8(sp)
    80202004:	e062                	sd	s8,0(sp)
    80202006:	0880                	addi	s0,sp,80
    80202008:	8792                	mv	a5,tp
  int id = r_tp();
    8020200a:	2781                	sext.w	a5,a5
  c->proc = 0;
    8020200c:	00779b13          	slli	s6,a5,0x7
    80202010:	00014717          	auipc	a4,0x14
    80202014:	05070713          	addi	a4,a4,80 # 80216060 <pid_lock>
    80202018:	975a                	add	a4,a4,s6
    8020201a:	00073c23          	sd	zero,24(a4)
        swtch(&c->context, &p->context);
    8020201e:	00014717          	auipc	a4,0x14
    80202022:	06270713          	addi	a4,a4,98 # 80216080 <cpus+0x8>
    80202026:	9b3a                	add	s6,s6,a4
        c->proc = p;
    80202028:	079e                	slli	a5,a5,0x7
    8020202a:	00014a97          	auipc	s5,0x14
    8020202e:	036a8a93          	addi	s5,s5,54 # 80216060 <pid_lock>
    80202032:	9abe                	add	s5,s5,a5
        w_satp(MAKE_SATP(p->kpagetable));
    80202034:	5a7d                	li	s4,-1
    80202036:	1a7e                	slli	s4,s4,0x3f
        w_satp(MAKE_SATP(kernel_pagetable));
    80202038:	0000cb97          	auipc	s7,0xc
    8020203c:	c90bbb83          	ld	s7,-880(s7) # 8020dcc8 <_GLOBAL_OFFSET_TABLE_+0x58>
    80202040:	a8a5                	j	802020b8 <scheduler+0xc8>
        p->state = RUNNING;
    80202042:	478d                	li	a5,3
    80202044:	cc9c                	sw	a5,24(s1)
        c->proc = p;
    80202046:	009abc23          	sd	s1,24(s5)
        w_satp(MAKE_SATP(p->kpagetable));
    8020204a:	6cbc                	ld	a5,88(s1)
    8020204c:	83b1                	srli	a5,a5,0xc
    8020204e:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    80202052:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    80202056:	12000073          	sfence.vma
        swtch(&c->context, &p->context);
    8020205a:	06848593          	addi	a1,s1,104
    8020205e:	855a                	mv	a0,s6
    80202060:	00000097          	auipc	ra,0x0
    80202064:	76c080e7          	jalr	1900(ra) # 802027cc <swtch>
        w_satp(MAKE_SATP(kernel_pagetable));
    80202068:	000bb783          	ld	a5,0(s7)
    8020206c:	83b1                	srli	a5,a5,0xc
    8020206e:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    80202072:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    80202076:	12000073          	sfence.vma
        c->proc = 0;
    8020207a:	000abc23          	sd	zero,24(s5)
        found = 1;
    8020207e:	4c05                	li	s8,1
      release(&p->lock);
    80202080:	8526                	mv	a0,s1
    80202082:	ffffe097          	auipc	ra,0xffffe
    80202086:	69a080e7          	jalr	1690(ra) # 8020071c <release>
    for (p = proc; p < &proc[NPROC]; p++)
    8020208a:	17848493          	addi	s1,s1,376
    8020208e:	01248b63          	beq	s1,s2,802020a4 <scheduler+0xb4>
      acquire(&p->lock);
    80202092:	8526                	mv	a0,s1
    80202094:	ffffe097          	auipc	ra,0xffffe
    80202098:	634080e7          	jalr	1588(ra) # 802006c8 <acquire>
      if (p->state == RUNNABLE)
    8020209c:	4c9c                	lw	a5,24(s1)
    8020209e:	ff3791e3          	bne	a5,s3,80202080 <scheduler+0x90>
    802020a2:	b745                	j	80202042 <scheduler+0x52>
    if (found == 0)
    802020a4:	000c1a63          	bnez	s8,802020b8 <scheduler+0xc8>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802020a8:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    802020ac:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802020b0:	10079073          	csrw	sstatus,a5
      asm volatile("wfi");
    802020b4:	10500073          	wfi
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802020b8:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    802020bc:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802020c0:	10079073          	csrw	sstatus,a5
    int found = 0;
    802020c4:	4c01                	li	s8,0
    for (p = proc; p < &proc[NPROC]; p++)
    802020c6:	00014497          	auipc	s1,0x14
    802020ca:	0ba48493          	addi	s1,s1,186 # 80216180 <proc>
      if (p->state == RUNNABLE)
    802020ce:	4989                	li	s3,2
    for (p = proc; p < &proc[NPROC]; p++)
    802020d0:	00019917          	auipc	s2,0x19
    802020d4:	a2090913          	addi	s2,s2,-1504 # 8021aaf0 <bcache>
    802020d8:	bf6d                	j	80202092 <scheduler+0xa2>

00000000802020da <sched>:
{
    802020da:	7179                	addi	sp,sp,-48
    802020dc:	f406                	sd	ra,40(sp)
    802020de:	f022                	sd	s0,32(sp)
    802020e0:	ec26                	sd	s1,24(sp)
    802020e2:	e84a                	sd	s2,16(sp)
    802020e4:	e44e                	sd	s3,8(sp)
    802020e6:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    802020e8:	00000097          	auipc	ra,0x0
    802020ec:	98c080e7          	jalr	-1652(ra) # 80201a74 <myproc>
    802020f0:	84aa                	mv	s1,a0
  if (!holding(&p->lock))
    802020f2:	ffffe097          	auipc	ra,0xffffe
    802020f6:	5a8080e7          	jalr	1448(ra) # 8020069a <holding>
    802020fa:	c93d                	beqz	a0,80202170 <sched+0x96>
  asm volatile("mv %0, tp" : "=r" (x) );
    802020fc:	8792                	mv	a5,tp
  if (mycpu()->noff != 1)
    802020fe:	2781                	sext.w	a5,a5
    80202100:	079e                	slli	a5,a5,0x7
    80202102:	00014717          	auipc	a4,0x14
    80202106:	f5e70713          	addi	a4,a4,-162 # 80216060 <pid_lock>
    8020210a:	97ba                	add	a5,a5,a4
    8020210c:	0907a703          	lw	a4,144(a5)
    80202110:	4785                	li	a5,1
    80202112:	06f71763          	bne	a4,a5,80202180 <sched+0xa6>
  if (p->state == RUNNING)
    80202116:	4c98                	lw	a4,24(s1)
    80202118:	478d                	li	a5,3
    8020211a:	06f70b63          	beq	a4,a5,80202190 <sched+0xb6>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8020211e:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80202122:	8b89                	andi	a5,a5,2
  if (intr_get())
    80202124:	efb5                	bnez	a5,802021a0 <sched+0xc6>
  asm volatile("mv %0, tp" : "=r" (x) );
    80202126:	8792                	mv	a5,tp
  intena = mycpu()->intena;
    80202128:	00014917          	auipc	s2,0x14
    8020212c:	f3890913          	addi	s2,s2,-200 # 80216060 <pid_lock>
    80202130:	2781                	sext.w	a5,a5
    80202132:	079e                	slli	a5,a5,0x7
    80202134:	97ca                	add	a5,a5,s2
    80202136:	0947a983          	lw	s3,148(a5)
    8020213a:	8792                	mv	a5,tp
  swtch(&p->context, &mycpu()->context);
    8020213c:	2781                	sext.w	a5,a5
    8020213e:	079e                	slli	a5,a5,0x7
    80202140:	00014597          	auipc	a1,0x14
    80202144:	f4058593          	addi	a1,a1,-192 # 80216080 <cpus+0x8>
    80202148:	95be                	add	a1,a1,a5
    8020214a:	06848513          	addi	a0,s1,104
    8020214e:	00000097          	auipc	ra,0x0
    80202152:	67e080e7          	jalr	1662(ra) # 802027cc <swtch>
    80202156:	8792                	mv	a5,tp
  mycpu()->intena = intena;
    80202158:	2781                	sext.w	a5,a5
    8020215a:	079e                	slli	a5,a5,0x7
    8020215c:	97ca                	add	a5,a5,s2
    8020215e:	0937aa23          	sw	s3,148(a5)
}
    80202162:	70a2                	ld	ra,40(sp)
    80202164:	7402                	ld	s0,32(sp)
    80202166:	64e2                	ld	s1,24(sp)
    80202168:	6942                	ld	s2,16(sp)
    8020216a:	69a2                	ld	s3,8(sp)
    8020216c:	6145                	addi	sp,sp,48
    8020216e:	8082                	ret
    panic("sched p->lock");
    80202170:	00008517          	auipc	a0,0x8
    80202174:	4d850513          	addi	a0,a0,1240 # 8020a648 <digits+0x2c8>
    80202178:	ffffe097          	auipc	ra,0xffffe
    8020217c:	fca080e7          	jalr	-54(ra) # 80200142 <panic>
    panic("sched locks");
    80202180:	00008517          	auipc	a0,0x8
    80202184:	4d850513          	addi	a0,a0,1240 # 8020a658 <digits+0x2d8>
    80202188:	ffffe097          	auipc	ra,0xffffe
    8020218c:	fba080e7          	jalr	-70(ra) # 80200142 <panic>
    panic("sched running");
    80202190:	00008517          	auipc	a0,0x8
    80202194:	4d850513          	addi	a0,a0,1240 # 8020a668 <digits+0x2e8>
    80202198:	ffffe097          	auipc	ra,0xffffe
    8020219c:	faa080e7          	jalr	-86(ra) # 80200142 <panic>
    panic("sched interruptible");
    802021a0:	00008517          	auipc	a0,0x8
    802021a4:	4d850513          	addi	a0,a0,1240 # 8020a678 <digits+0x2f8>
    802021a8:	ffffe097          	auipc	ra,0xffffe
    802021ac:	f9a080e7          	jalr	-102(ra) # 80200142 <panic>

00000000802021b0 <exit>:
{
    802021b0:	7179                	addi	sp,sp,-48
    802021b2:	f406                	sd	ra,40(sp)
    802021b4:	f022                	sd	s0,32(sp)
    802021b6:	ec26                	sd	s1,24(sp)
    802021b8:	e84a                	sd	s2,16(sp)
    802021ba:	e44e                	sd	s3,8(sp)
    802021bc:	e052                	sd	s4,0(sp)
    802021be:	1800                	addi	s0,sp,48
    802021c0:	8a2a                	mv	s4,a0
  struct proc *p = myproc();
    802021c2:	00000097          	auipc	ra,0x0
    802021c6:	8b2080e7          	jalr	-1870(ra) # 80201a74 <myproc>
    802021ca:	89aa                	mv	s3,a0
  for (int fd = 0; fd < NOFILE; fd++)
    802021cc:	0d850493          	addi	s1,a0,216
    802021d0:	15850913          	addi	s2,a0,344
    802021d4:	a811                	j	802021e8 <exit+0x38>
      fileclose(f);
    802021d6:	00002097          	auipc	ra,0x2
    802021da:	a22080e7          	jalr	-1502(ra) # 80203bf8 <fileclose>
      p->ofile[fd] = 0;
    802021de:	0004b023          	sd	zero,0(s1)
  for (int fd = 0; fd < NOFILE; fd++)
    802021e2:	04a1                	addi	s1,s1,8
    802021e4:	01248563          	beq	s1,s2,802021ee <exit+0x3e>
    if (p->ofile[fd])
    802021e8:	6088                	ld	a0,0(s1)
    802021ea:	f575                	bnez	a0,802021d6 <exit+0x26>
    802021ec:	bfdd                	j	802021e2 <exit+0x32>
  eput(p->cwd);
    802021ee:	1589b503          	ld	a0,344(s3)
    802021f2:	00005097          	auipc	ra,0x5
    802021f6:	bf4080e7          	jalr	-1036(ra) # 80206de6 <eput>
  p->cwd = 0;
    802021fa:	1409bc23          	sd	zero,344(s3)
  acquire(&initproc->lock);
    802021fe:	00014497          	auipc	s1,0x14
    80202202:	e6248493          	addi	s1,s1,-414 # 80216060 <pid_lock>
    80202206:	1184b503          	ld	a0,280(s1)
    8020220a:	ffffe097          	auipc	ra,0xffffe
    8020220e:	4be080e7          	jalr	1214(ra) # 802006c8 <acquire>
  wakeup1(initproc);
    80202212:	1184b503          	ld	a0,280(s1)
    80202216:	fffff097          	auipc	ra,0xfffff
    8020221a:	672080e7          	jalr	1650(ra) # 80201888 <wakeup1>
  release(&initproc->lock);
    8020221e:	1184b503          	ld	a0,280(s1)
    80202222:	ffffe097          	auipc	ra,0xffffe
    80202226:	4fa080e7          	jalr	1274(ra) # 8020071c <release>
  acquire(&p->lock);
    8020222a:	854e                	mv	a0,s3
    8020222c:	ffffe097          	auipc	ra,0xffffe
    80202230:	49c080e7          	jalr	1180(ra) # 802006c8 <acquire>
  struct proc *original_parent = p->parent;
    80202234:	0209b483          	ld	s1,32(s3)
  release(&p->lock);
    80202238:	854e                	mv	a0,s3
    8020223a:	ffffe097          	auipc	ra,0xffffe
    8020223e:	4e2080e7          	jalr	1250(ra) # 8020071c <release>
  acquire(&original_parent->lock);
    80202242:	8526                	mv	a0,s1
    80202244:	ffffe097          	auipc	ra,0xffffe
    80202248:	484080e7          	jalr	1156(ra) # 802006c8 <acquire>
  acquire(&p->lock);
    8020224c:	854e                	mv	a0,s3
    8020224e:	ffffe097          	auipc	ra,0xffffe
    80202252:	47a080e7          	jalr	1146(ra) # 802006c8 <acquire>
  reparent(p);
    80202256:	854e                	mv	a0,s3
    80202258:	00000097          	auipc	ra,0x0
    8020225c:	d32080e7          	jalr	-718(ra) # 80201f8a <reparent>
  wakeup1(original_parent);
    80202260:	8526                	mv	a0,s1
    80202262:	fffff097          	auipc	ra,0xfffff
    80202266:	626080e7          	jalr	1574(ra) # 80201888 <wakeup1>
  p->xstate=status<<8;
    8020226a:	008a1a1b          	slliw	s4,s4,0x8
    8020226e:	0349aa23          	sw	s4,52(s3)
  p->state = ZOMBIE;
    80202272:	4791                	li	a5,4
    80202274:	00f9ac23          	sw	a5,24(s3)
  release(&original_parent->lock);
    80202278:	8526                	mv	a0,s1
    8020227a:	ffffe097          	auipc	ra,0xffffe
    8020227e:	4a2080e7          	jalr	1186(ra) # 8020071c <release>
  sched();
    80202282:	00000097          	auipc	ra,0x0
    80202286:	e58080e7          	jalr	-424(ra) # 802020da <sched>
  panic("zombie exit");
    8020228a:	00008517          	auipc	a0,0x8
    8020228e:	40650513          	addi	a0,a0,1030 # 8020a690 <digits+0x310>
    80202292:	ffffe097          	auipc	ra,0xffffe
    80202296:	eb0080e7          	jalr	-336(ra) # 80200142 <panic>

000000008020229a <yield>:
{
    8020229a:	1101                	addi	sp,sp,-32
    8020229c:	ec06                	sd	ra,24(sp)
    8020229e:	e822                	sd	s0,16(sp)
    802022a0:	e426                	sd	s1,8(sp)
    802022a2:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    802022a4:	fffff097          	auipc	ra,0xfffff
    802022a8:	7d0080e7          	jalr	2000(ra) # 80201a74 <myproc>
    802022ac:	84aa                	mv	s1,a0
  acquire(&p->lock);
    802022ae:	ffffe097          	auipc	ra,0xffffe
    802022b2:	41a080e7          	jalr	1050(ra) # 802006c8 <acquire>
  p->state = RUNNABLE;
    802022b6:	4789                	li	a5,2
    802022b8:	cc9c                	sw	a5,24(s1)
  sched();
    802022ba:	00000097          	auipc	ra,0x0
    802022be:	e20080e7          	jalr	-480(ra) # 802020da <sched>
  release(&p->lock);
    802022c2:	8526                	mv	a0,s1
    802022c4:	ffffe097          	auipc	ra,0xffffe
    802022c8:	458080e7          	jalr	1112(ra) # 8020071c <release>
}
    802022cc:	60e2                	ld	ra,24(sp)
    802022ce:	6442                	ld	s0,16(sp)
    802022d0:	64a2                	ld	s1,8(sp)
    802022d2:	6105                	addi	sp,sp,32
    802022d4:	8082                	ret

00000000802022d6 <sleep>:
{
    802022d6:	7179                	addi	sp,sp,-48
    802022d8:	f406                	sd	ra,40(sp)
    802022da:	f022                	sd	s0,32(sp)
    802022dc:	ec26                	sd	s1,24(sp)
    802022de:	e84a                	sd	s2,16(sp)
    802022e0:	e44e                	sd	s3,8(sp)
    802022e2:	1800                	addi	s0,sp,48
    802022e4:	89aa                	mv	s3,a0
    802022e6:	892e                	mv	s2,a1
  struct proc *p = myproc();
    802022e8:	fffff097          	auipc	ra,0xfffff
    802022ec:	78c080e7          	jalr	1932(ra) # 80201a74 <myproc>
    802022f0:	84aa                	mv	s1,a0
  if (lk != &p->lock)
    802022f2:	05250663          	beq	a0,s2,8020233e <sleep+0x68>
    acquire(&p->lock); // DOC: sleeplock1
    802022f6:	ffffe097          	auipc	ra,0xffffe
    802022fa:	3d2080e7          	jalr	978(ra) # 802006c8 <acquire>
    release(lk);
    802022fe:	854a                	mv	a0,s2
    80202300:	ffffe097          	auipc	ra,0xffffe
    80202304:	41c080e7          	jalr	1052(ra) # 8020071c <release>
  p->chan = chan;
    80202308:	0334b423          	sd	s3,40(s1)
  p->state = SLEEPING;
    8020230c:	4785                	li	a5,1
    8020230e:	cc9c                	sw	a5,24(s1)
  sched();
    80202310:	00000097          	auipc	ra,0x0
    80202314:	dca080e7          	jalr	-566(ra) # 802020da <sched>
  p->chan = 0;
    80202318:	0204b423          	sd	zero,40(s1)
    release(&p->lock);
    8020231c:	8526                	mv	a0,s1
    8020231e:	ffffe097          	auipc	ra,0xffffe
    80202322:	3fe080e7          	jalr	1022(ra) # 8020071c <release>
    acquire(lk);
    80202326:	854a                	mv	a0,s2
    80202328:	ffffe097          	auipc	ra,0xffffe
    8020232c:	3a0080e7          	jalr	928(ra) # 802006c8 <acquire>
}
    80202330:	70a2                	ld	ra,40(sp)
    80202332:	7402                	ld	s0,32(sp)
    80202334:	64e2                	ld	s1,24(sp)
    80202336:	6942                	ld	s2,16(sp)
    80202338:	69a2                	ld	s3,8(sp)
    8020233a:	6145                	addi	sp,sp,48
    8020233c:	8082                	ret
  p->chan = chan;
    8020233e:	03353423          	sd	s3,40(a0)
  p->state = SLEEPING;
    80202342:	4785                	li	a5,1
    80202344:	cd1c                	sw	a5,24(a0)
  sched();
    80202346:	00000097          	auipc	ra,0x0
    8020234a:	d94080e7          	jalr	-620(ra) # 802020da <sched>
  p->chan = 0;
    8020234e:	0204b423          	sd	zero,40(s1)
  if (lk != &p->lock)
    80202352:	bff9                	j	80202330 <sleep+0x5a>

0000000080202354 <wait>:
{
    80202354:	715d                	addi	sp,sp,-80
    80202356:	e486                	sd	ra,72(sp)
    80202358:	e0a2                	sd	s0,64(sp)
    8020235a:	fc26                	sd	s1,56(sp)
    8020235c:	f84a                	sd	s2,48(sp)
    8020235e:	f44e                	sd	s3,40(sp)
    80202360:	f052                	sd	s4,32(sp)
    80202362:	ec56                	sd	s5,24(sp)
    80202364:	e85a                	sd	s6,16(sp)
    80202366:	e45e                	sd	s7,8(sp)
    80202368:	e062                	sd	s8,0(sp)
    8020236a:	0880                	addi	s0,sp,80
    8020236c:	8b2a                	mv	s6,a0
  struct proc *p = myproc();
    8020236e:	fffff097          	auipc	ra,0xfffff
    80202372:	706080e7          	jalr	1798(ra) # 80201a74 <myproc>
    80202376:	892a                	mv	s2,a0
  acquire(&p->lock);
    80202378:	8c2a                	mv	s8,a0
    8020237a:	ffffe097          	auipc	ra,0xffffe
    8020237e:	34e080e7          	jalr	846(ra) # 802006c8 <acquire>
    havekids = 0;
    80202382:	4b81                	li	s7,0
        if (np->state == ZOMBIE)
    80202384:	4a11                	li	s4,4
    for (np = proc; np < &proc[NPROC]; np++)
    80202386:	00018997          	auipc	s3,0x18
    8020238a:	76a98993          	addi	s3,s3,1898 # 8021aaf0 <bcache>
        havekids = 1;
    8020238e:	4a85                	li	s5,1
    havekids = 0;
    80202390:	875e                	mv	a4,s7
    for (np = proc; np < &proc[NPROC]; np++)
    80202392:	00014497          	auipc	s1,0x14
    80202396:	dee48493          	addi	s1,s1,-530 # 80216180 <proc>
    8020239a:	a8b9                	j	802023f8 <wait+0xa4>
          pid = np->pid;
    8020239c:	0384a983          	lw	s3,56(s1)
          if (addr != 0 && copyout2(addr, (char *)&np->xstate, sizeof(np->xstate)) < 0)
    802023a0:	000b0c63          	beqz	s6,802023b8 <wait+0x64>
    802023a4:	4611                	li	a2,4
    802023a6:	03448593          	addi	a1,s1,52
    802023aa:	855a                	mv	a0,s6
    802023ac:	fffff097          	auipc	ra,0xfffff
    802023b0:	fec080e7          	jalr	-20(ra) # 80201398 <copyout2>
    802023b4:	02054263          	bltz	a0,802023d8 <wait+0x84>
          freeproc(np);
    802023b8:	8526                	mv	a0,s1
    802023ba:	00000097          	auipc	ra,0x0
    802023be:	88c080e7          	jalr	-1908(ra) # 80201c46 <freeproc>
          release(&np->lock);
    802023c2:	8526                	mv	a0,s1
    802023c4:	ffffe097          	auipc	ra,0xffffe
    802023c8:	358080e7          	jalr	856(ra) # 8020071c <release>
          release(&p->lock);
    802023cc:	854a                	mv	a0,s2
    802023ce:	ffffe097          	auipc	ra,0xffffe
    802023d2:	34e080e7          	jalr	846(ra) # 8020071c <release>
          return pid;
    802023d6:	a8a9                	j	80202430 <wait+0xdc>
            release(&np->lock);
    802023d8:	8526                	mv	a0,s1
    802023da:	ffffe097          	auipc	ra,0xffffe
    802023de:	342080e7          	jalr	834(ra) # 8020071c <release>
            release(&p->lock);
    802023e2:	854a                	mv	a0,s2
    802023e4:	ffffe097          	auipc	ra,0xffffe
    802023e8:	338080e7          	jalr	824(ra) # 8020071c <release>
            return -1;
    802023ec:	59fd                	li	s3,-1
    802023ee:	a089                	j	80202430 <wait+0xdc>
    for (np = proc; np < &proc[NPROC]; np++)
    802023f0:	17848493          	addi	s1,s1,376
    802023f4:	03348463          	beq	s1,s3,8020241c <wait+0xc8>
      if (np->parent == p)
    802023f8:	709c                	ld	a5,32(s1)
    802023fa:	ff279be3          	bne	a5,s2,802023f0 <wait+0x9c>
        acquire(&np->lock);
    802023fe:	8526                	mv	a0,s1
    80202400:	ffffe097          	auipc	ra,0xffffe
    80202404:	2c8080e7          	jalr	712(ra) # 802006c8 <acquire>
        if (np->state == ZOMBIE)
    80202408:	4c9c                	lw	a5,24(s1)
    8020240a:	f94789e3          	beq	a5,s4,8020239c <wait+0x48>
        release(&np->lock);
    8020240e:	8526                	mv	a0,s1
    80202410:	ffffe097          	auipc	ra,0xffffe
    80202414:	30c080e7          	jalr	780(ra) # 8020071c <release>
        havekids = 1;
    80202418:	8756                	mv	a4,s5
    8020241a:	bfd9                	j	802023f0 <wait+0x9c>
    if (!havekids || p->killed)
    8020241c:	c701                	beqz	a4,80202424 <wait+0xd0>
    8020241e:	03092783          	lw	a5,48(s2)
    80202422:	c785                	beqz	a5,8020244a <wait+0xf6>
      release(&p->lock);
    80202424:	854a                	mv	a0,s2
    80202426:	ffffe097          	auipc	ra,0xffffe
    8020242a:	2f6080e7          	jalr	758(ra) # 8020071c <release>
      return -1;
    8020242e:	59fd                	li	s3,-1
}
    80202430:	854e                	mv	a0,s3
    80202432:	60a6                	ld	ra,72(sp)
    80202434:	6406                	ld	s0,64(sp)
    80202436:	74e2                	ld	s1,56(sp)
    80202438:	7942                	ld	s2,48(sp)
    8020243a:	79a2                	ld	s3,40(sp)
    8020243c:	7a02                	ld	s4,32(sp)
    8020243e:	6ae2                	ld	s5,24(sp)
    80202440:	6b42                	ld	s6,16(sp)
    80202442:	6ba2                	ld	s7,8(sp)
    80202444:	6c02                	ld	s8,0(sp)
    80202446:	6161                	addi	sp,sp,80
    80202448:	8082                	ret
    sleep(p, &p->lock); // DOC: wait-sleep
    8020244a:	85e2                	mv	a1,s8
    8020244c:	854a                	mv	a0,s2
    8020244e:	00000097          	auipc	ra,0x0
    80202452:	e88080e7          	jalr	-376(ra) # 802022d6 <sleep>
    havekids = 0;
    80202456:	bf2d                	j	80202390 <wait+0x3c>

0000000080202458 <wakeup>:
{
    80202458:	7139                	addi	sp,sp,-64
    8020245a:	fc06                	sd	ra,56(sp)
    8020245c:	f822                	sd	s0,48(sp)
    8020245e:	f426                	sd	s1,40(sp)
    80202460:	f04a                	sd	s2,32(sp)
    80202462:	ec4e                	sd	s3,24(sp)
    80202464:	e852                	sd	s4,16(sp)
    80202466:	e456                	sd	s5,8(sp)
    80202468:	0080                	addi	s0,sp,64
    8020246a:	8a2a                	mv	s4,a0
  for (p = proc; p < &proc[NPROC]; p++)
    8020246c:	00014497          	auipc	s1,0x14
    80202470:	d1448493          	addi	s1,s1,-748 # 80216180 <proc>
    if (p->state == SLEEPING && p->chan == chan)
    80202474:	4985                	li	s3,1
      p->state = RUNNABLE;
    80202476:	4a89                	li	s5,2
  for (p = proc; p < &proc[NPROC]; p++)
    80202478:	00018917          	auipc	s2,0x18
    8020247c:	67890913          	addi	s2,s2,1656 # 8021aaf0 <bcache>
    80202480:	a821                	j	80202498 <wakeup+0x40>
      p->state = RUNNABLE;
    80202482:	0154ac23          	sw	s5,24(s1)
    release(&p->lock);
    80202486:	8526                	mv	a0,s1
    80202488:	ffffe097          	auipc	ra,0xffffe
    8020248c:	294080e7          	jalr	660(ra) # 8020071c <release>
  for (p = proc; p < &proc[NPROC]; p++)
    80202490:	17848493          	addi	s1,s1,376
    80202494:	01248e63          	beq	s1,s2,802024b0 <wakeup+0x58>
    acquire(&p->lock);
    80202498:	8526                	mv	a0,s1
    8020249a:	ffffe097          	auipc	ra,0xffffe
    8020249e:	22e080e7          	jalr	558(ra) # 802006c8 <acquire>
    if (p->state == SLEEPING && p->chan == chan)
    802024a2:	4c9c                	lw	a5,24(s1)
    802024a4:	ff3791e3          	bne	a5,s3,80202486 <wakeup+0x2e>
    802024a8:	749c                	ld	a5,40(s1)
    802024aa:	fd479ee3          	bne	a5,s4,80202486 <wakeup+0x2e>
    802024ae:	bfd1                	j	80202482 <wakeup+0x2a>
}
    802024b0:	70e2                	ld	ra,56(sp)
    802024b2:	7442                	ld	s0,48(sp)
    802024b4:	74a2                	ld	s1,40(sp)
    802024b6:	7902                	ld	s2,32(sp)
    802024b8:	69e2                	ld	s3,24(sp)
    802024ba:	6a42                	ld	s4,16(sp)
    802024bc:	6aa2                	ld	s5,8(sp)
    802024be:	6121                	addi	sp,sp,64
    802024c0:	8082                	ret

00000000802024c2 <kill>:

// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int kill(int pid)
{
    802024c2:	7179                	addi	sp,sp,-48
    802024c4:	f406                	sd	ra,40(sp)
    802024c6:	f022                	sd	s0,32(sp)
    802024c8:	ec26                	sd	s1,24(sp)
    802024ca:	e84a                	sd	s2,16(sp)
    802024cc:	e44e                	sd	s3,8(sp)
    802024ce:	1800                	addi	s0,sp,48
    802024d0:	892a                	mv	s2,a0
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++)
    802024d2:	00014497          	auipc	s1,0x14
    802024d6:	cae48493          	addi	s1,s1,-850 # 80216180 <proc>
    802024da:	00018997          	auipc	s3,0x18
    802024de:	61698993          	addi	s3,s3,1558 # 8021aaf0 <bcache>
  {
    acquire(&p->lock);
    802024e2:	8526                	mv	a0,s1
    802024e4:	ffffe097          	auipc	ra,0xffffe
    802024e8:	1e4080e7          	jalr	484(ra) # 802006c8 <acquire>
    if (p->pid == pid)
    802024ec:	5c9c                	lw	a5,56(s1)
    802024ee:	01278d63          	beq	a5,s2,80202508 <kill+0x46>
        p->state = RUNNABLE;
      }
      release(&p->lock);
      return 0;
    }
    release(&p->lock);
    802024f2:	8526                	mv	a0,s1
    802024f4:	ffffe097          	auipc	ra,0xffffe
    802024f8:	228080e7          	jalr	552(ra) # 8020071c <release>
  for (p = proc; p < &proc[NPROC]; p++)
    802024fc:	17848493          	addi	s1,s1,376
    80202500:	ff3491e3          	bne	s1,s3,802024e2 <kill+0x20>
  }
  return -1;
    80202504:	557d                	li	a0,-1
    80202506:	a829                	j	80202520 <kill+0x5e>
      p->killed = 1;
    80202508:	4785                	li	a5,1
    8020250a:	d89c                	sw	a5,48(s1)
      if (p->state == SLEEPING)
    8020250c:	4c98                	lw	a4,24(s1)
    8020250e:	4785                	li	a5,1
    80202510:	00f70f63          	beq	a4,a5,8020252e <kill+0x6c>
      release(&p->lock);
    80202514:	8526                	mv	a0,s1
    80202516:	ffffe097          	auipc	ra,0xffffe
    8020251a:	206080e7          	jalr	518(ra) # 8020071c <release>
      return 0;
    8020251e:	4501                	li	a0,0
}
    80202520:	70a2                	ld	ra,40(sp)
    80202522:	7402                	ld	s0,32(sp)
    80202524:	64e2                	ld	s1,24(sp)
    80202526:	6942                	ld	s2,16(sp)
    80202528:	69a2                	ld	s3,8(sp)
    8020252a:	6145                	addi	sp,sp,48
    8020252c:	8082                	ret
        p->state = RUNNABLE;
    8020252e:	4789                	li	a5,2
    80202530:	cc9c                	sw	a5,24(s1)
    80202532:	b7cd                	j	80202514 <kill+0x52>

0000000080202534 <either_copyout>:

// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    80202534:	1101                	addi	sp,sp,-32
    80202536:	ec06                	sd	ra,24(sp)
    80202538:	e822                	sd	s0,16(sp)
    8020253a:	e426                	sd	s1,8(sp)
    8020253c:	1000                	addi	s0,sp,32
    8020253e:	84aa                	mv	s1,a0
    80202540:	852e                	mv	a0,a1
    80202542:	85b2                	mv	a1,a2
    80202544:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if (user_dst)
    80202546:	c891                	beqz	s1,8020255a <either_copyout+0x26>
  {
    // return copyout(p->pagetable, dst, src, len);
    return copyout2(dst, src, len);
    80202548:	fffff097          	auipc	ra,0xfffff
    8020254c:	e50080e7          	jalr	-432(ra) # 80201398 <copyout2>
  else
  {
    memmove((char *)dst, src, len);
    return 0;
  }
}
    80202550:	60e2                	ld	ra,24(sp)
    80202552:	6442                	ld	s0,16(sp)
    80202554:	64a2                	ld	s1,8(sp)
    80202556:	6105                	addi	sp,sp,32
    80202558:	8082                	ret
    memmove((char *)dst, src, len);
    8020255a:	0006861b          	sext.w	a2,a3
    8020255e:	ffffe097          	auipc	ra,0xffffe
    80202562:	266080e7          	jalr	614(ra) # 802007c4 <memmove>
    return 0;
    80202566:	8526                	mv	a0,s1
    80202568:	b7e5                	j	80202550 <either_copyout+0x1c>

000000008020256a <either_copyin>:

// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    8020256a:	1101                	addi	sp,sp,-32
    8020256c:	ec06                	sd	ra,24(sp)
    8020256e:	e822                	sd	s0,16(sp)
    80202570:	e426                	sd	s1,8(sp)
    80202572:	1000                	addi	s0,sp,32
    80202574:	84ae                	mv	s1,a1
    80202576:	85b2                	mv	a1,a2
    80202578:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if (user_src)
    8020257a:	c891                	beqz	s1,8020258e <either_copyin+0x24>
  {
    // return copyin(p->pagetable, dst, src, len);
    return copyin2(dst, src, len);
    8020257c:	fffff097          	auipc	ra,0xfffff
    80202580:	efa080e7          	jalr	-262(ra) # 80201476 <copyin2>
  else
  {
    memmove(dst, (char *)src, len);
    return 0;
  }
}
    80202584:	60e2                	ld	ra,24(sp)
    80202586:	6442                	ld	s0,16(sp)
    80202588:	64a2                	ld	s1,8(sp)
    8020258a:	6105                	addi	sp,sp,32
    8020258c:	8082                	ret
    memmove(dst, (char *)src, len);
    8020258e:	0006861b          	sext.w	a2,a3
    80202592:	ffffe097          	auipc	ra,0xffffe
    80202596:	232080e7          	jalr	562(ra) # 802007c4 <memmove>
    return 0;
    8020259a:	8526                	mv	a0,s1
    8020259c:	b7e5                	j	80202584 <either_copyin+0x1a>

000000008020259e <procdump>:

// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void procdump(void)
{
    8020259e:	715d                	addi	sp,sp,-80
    802025a0:	e486                	sd	ra,72(sp)
    802025a2:	e0a2                	sd	s0,64(sp)
    802025a4:	fc26                	sd	s1,56(sp)
    802025a6:	f84a                	sd	s2,48(sp)
    802025a8:	f44e                	sd	s3,40(sp)
    802025aa:	f052                	sd	s4,32(sp)
    802025ac:	ec56                	sd	s5,24(sp)
    802025ae:	e85a                	sd	s6,16(sp)
    802025b0:	e45e                	sd	s7,8(sp)
    802025b2:	0880                	addi	s0,sp,80
      [RUNNING] "run   ",
      [ZOMBIE] "zombie"};
  struct proc *p;
  char *state;

  printf("\nPID\tSTATE\tNAME\tMEM\n");
    802025b4:	00008517          	auipc	a0,0x8
    802025b8:	0f450513          	addi	a0,a0,244 # 8020a6a8 <digits+0x328>
    802025bc:	ffffe097          	auipc	ra,0xffffe
    802025c0:	bd0080e7          	jalr	-1072(ra) # 8020018c <printf>
  for (p = proc; p < &proc[NPROC]; p++)
    802025c4:	00014497          	auipc	s1,0x14
    802025c8:	d1c48493          	addi	s1,s1,-740 # 802162e0 <proc+0x160>
    802025cc:	00018917          	auipc	s2,0x18
    802025d0:	68490913          	addi	s2,s2,1668 # 8021ac50 <bcache+0x160>
  {
    if (p->state == UNUSED)
      continue;
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
    802025d4:	4b11                	li	s6,4
      state = states[p->state];
    else
      state = "???";
    802025d6:	00008997          	auipc	s3,0x8
    802025da:	0ca98993          	addi	s3,s3,202 # 8020a6a0 <digits+0x320>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    802025de:	00008a97          	auipc	s5,0x8
    802025e2:	0e2a8a93          	addi	s5,s5,226 # 8020a6c0 <digits+0x340>
    printf("\n");
    802025e6:	00008a17          	auipc	s4,0x8
    802025ea:	af2a0a13          	addi	s4,s4,-1294 # 8020a0d8 <etext+0xd8>
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
    802025ee:	00009b97          	auipc	s7,0x9
    802025f2:	612b8b93          	addi	s7,s7,1554 # 8020bc00 <states.1730>
    802025f6:	a01d                	j	8020261c <procdump+0x7e>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    802025f8:	ee86b703          	ld	a4,-280(a3)
    802025fc:	ed86a583          	lw	a1,-296(a3)
    80202600:	8556                	mv	a0,s5
    80202602:	ffffe097          	auipc	ra,0xffffe
    80202606:	b8a080e7          	jalr	-1142(ra) # 8020018c <printf>
    printf("\n");
    8020260a:	8552                	mv	a0,s4
    8020260c:	ffffe097          	auipc	ra,0xffffe
    80202610:	b80080e7          	jalr	-1152(ra) # 8020018c <printf>
  for (p = proc; p < &proc[NPROC]; p++)
    80202614:	17848493          	addi	s1,s1,376
    80202618:	03248163          	beq	s1,s2,8020263a <procdump+0x9c>
    if (p->state == UNUSED)
    8020261c:	86a6                	mv	a3,s1
    8020261e:	eb84a783          	lw	a5,-328(s1)
    80202622:	dbed                	beqz	a5,80202614 <procdump+0x76>
      state = "???";
    80202624:	864e                	mv	a2,s3
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80202626:	fcfb69e3          	bltu	s6,a5,802025f8 <procdump+0x5a>
    8020262a:	1782                	slli	a5,a5,0x20
    8020262c:	9381                	srli	a5,a5,0x20
    8020262e:	078e                	slli	a5,a5,0x3
    80202630:	97de                	add	a5,a5,s7
    80202632:	6390                	ld	a2,0(a5)
    80202634:	f271                	bnez	a2,802025f8 <procdump+0x5a>
      state = "???";
    80202636:	864e                	mv	a2,s3
    80202638:	b7c1                	j	802025f8 <procdump+0x5a>
  }
}
    8020263a:	60a6                	ld	ra,72(sp)
    8020263c:	6406                	ld	s0,64(sp)
    8020263e:	74e2                	ld	s1,56(sp)
    80202640:	7942                	ld	s2,48(sp)
    80202642:	79a2                	ld	s3,40(sp)
    80202644:	7a02                	ld	s4,32(sp)
    80202646:	6ae2                	ld	s5,24(sp)
    80202648:	6b42                	ld	s6,16(sp)
    8020264a:	6ba2                	ld	s7,8(sp)
    8020264c:	6161                	addi	sp,sp,80
    8020264e:	8082                	ret

0000000080202650 <procnum>:

uint64
procnum(void)
{
    80202650:	1141                	addi	sp,sp,-16
    80202652:	e422                	sd	s0,8(sp)
    80202654:	0800                	addi	s0,sp,16
  int num = 0;
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++)
    80202656:	00014797          	auipc	a5,0x14
    8020265a:	b2a78793          	addi	a5,a5,-1238 # 80216180 <proc>
  int num = 0;
    8020265e:	4501                	li	a0,0
  for (p = proc; p < &proc[NPROC]; p++)
    80202660:	00018697          	auipc	a3,0x18
    80202664:	49068693          	addi	a3,a3,1168 # 8021aaf0 <bcache>
    80202668:	a029                	j	80202672 <procnum+0x22>
    8020266a:	17878793          	addi	a5,a5,376
    8020266e:	00d78663          	beq	a5,a3,8020267a <procnum+0x2a>
  {
    if (p->state != UNUSED)
    80202672:	4f98                	lw	a4,24(a5)
    80202674:	db7d                	beqz	a4,8020266a <procnum+0x1a>
    {
      num++;
    80202676:	2505                	addiw	a0,a0,1
    80202678:	bfcd                	j	8020266a <procnum+0x1a>
    }
  }

  return num;
}
    8020267a:	6422                	ld	s0,8(sp)
    8020267c:	0141                	addi	sp,sp,16
    8020267e:	8082                	ret

0000000080202680 <clone>:


// added by lmq for SYS_clone
int clone(int flags, int stack, int ptid, int tls, int ctid)
{
    80202680:	1141                	addi	sp,sp,-16
    80202682:	e406                	sd	ra,8(sp)
    80202684:	e022                	sd	s0,0(sp)
    80202686:	0800                	addi	s0,sp,16
  int new_pid = fork();
    80202688:	fffff097          	auipc	ra,0xfffff
    8020268c:	7ee080e7          	jalr	2030(ra) # 80201e76 <fork>
  return new_pid;
}
    80202690:	60a2                	ld	ra,8(sp)
    80202692:	6402                	ld	s0,0(sp)
    80202694:	0141                	addi	sp,sp,16
    80202696:	8082                	ret

0000000080202698 <waitpid>:
 * @addr:address to store return status of child process
 * @options:default 0
 * @return:pid of child process;-1 means failure
 */
int waitpid(int cpid, uint64 addr, int options)
{
    80202698:	711d                	addi	sp,sp,-96
    8020269a:	ec86                	sd	ra,88(sp)
    8020269c:	e8a2                	sd	s0,80(sp)
    8020269e:	e4a6                	sd	s1,72(sp)
    802026a0:	e0ca                	sd	s2,64(sp)
    802026a2:	fc4e                	sd	s3,56(sp)
    802026a4:	f852                	sd	s4,48(sp)
    802026a6:	f456                	sd	s5,40(sp)
    802026a8:	f05a                	sd	s6,32(sp)
    802026aa:	ec5e                	sd	s7,24(sp)
    802026ac:	e862                	sd	s8,16(sp)
    802026ae:	e466                	sd	s9,8(sp)
    802026b0:	1080                	addi	s0,sp,96
    802026b2:	8bae                	mv	s7,a1
  if (cpid == -1) // wait for any child
    802026b4:	57fd                	li	a5,-1
    802026b6:	02f51663          	bne	a0,a5,802026e2 <waitpid+0x4a>
  {
    return wait(addr);
    802026ba:	852e                	mv	a0,a1
    802026bc:	00000097          	auipc	ra,0x0
    802026c0:	c98080e7          	jalr	-872(ra) # 80202354 <wait>
    802026c4:	89aa                	mv	s3,a0

    // Wait for a child to exit.
    sleep(p, &p->lock); // DOC: wait-sleep

  }
}
    802026c6:	854e                	mv	a0,s3
    802026c8:	60e6                	ld	ra,88(sp)
    802026ca:	6446                	ld	s0,80(sp)
    802026cc:	64a6                	ld	s1,72(sp)
    802026ce:	6906                	ld	s2,64(sp)
    802026d0:	79e2                	ld	s3,56(sp)
    802026d2:	7a42                	ld	s4,48(sp)
    802026d4:	7aa2                	ld	s5,40(sp)
    802026d6:	7b02                	ld	s6,32(sp)
    802026d8:	6be2                	ld	s7,24(sp)
    802026da:	6c42                	ld	s8,16(sp)
    802026dc:	6ca2                	ld	s9,8(sp)
    802026de:	6125                	addi	sp,sp,96
    802026e0:	8082                	ret
    802026e2:	8a2a                	mv	s4,a0
  struct proc *p = myproc();
    802026e4:	fffff097          	auipc	ra,0xfffff
    802026e8:	390080e7          	jalr	912(ra) # 80201a74 <myproc>
    802026ec:	892a                	mv	s2,a0
  acquire(&p->lock);
    802026ee:	8caa                	mv	s9,a0
    802026f0:	ffffe097          	auipc	ra,0xffffe
    802026f4:	fd8080e7          	jalr	-40(ra) # 802006c8 <acquire>
    havekids = 0;
    802026f8:	4c01                	li	s8,0
        if (pp->state == ZOMBIE)
    802026fa:	4a91                	li	s5,4
    for (pp = proc; pp < &proc[NPROC]; pp++)
    802026fc:	00018997          	auipc	s3,0x18
    80202700:	3f498993          	addi	s3,s3,1012 # 8021aaf0 <bcache>
        havekids = 1;
    80202704:	4b05                	li	s6,1
    80202706:	a045                	j	802027a6 <waitpid+0x10e>
          pid = pp->pid;
    80202708:	0384a983          	lw	s3,56(s1)
          if (addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
    8020270c:	000b8e63          	beqz	s7,80202728 <waitpid+0x90>
    80202710:	4691                	li	a3,4
    80202712:	03448613          	addi	a2,s1,52
    80202716:	85de                	mv	a1,s7
    80202718:	05093503          	ld	a0,80(s2)
    8020271c:	fffff097          	auipc	ra,0xfffff
    80202720:	bf0080e7          	jalr	-1040(ra) # 8020130c <copyout>
    80202724:	02054263          	bltz	a0,80202748 <waitpid+0xb0>
          freeproc(pp);
    80202728:	8526                	mv	a0,s1
    8020272a:	fffff097          	auipc	ra,0xfffff
    8020272e:	51c080e7          	jalr	1308(ra) # 80201c46 <freeproc>
          release(&pp->lock);
    80202732:	8526                	mv	a0,s1
    80202734:	ffffe097          	auipc	ra,0xffffe
    80202738:	fe8080e7          	jalr	-24(ra) # 8020071c <release>
          release(&p->lock);
    8020273c:	854a                	mv	a0,s2
    8020273e:	ffffe097          	auipc	ra,0xffffe
    80202742:	fde080e7          	jalr	-34(ra) # 8020071c <release>
          return pid;
    80202746:	b741                	j	802026c6 <waitpid+0x2e>
            release(&pp->lock);
    80202748:	8526                	mv	a0,s1
    8020274a:	ffffe097          	auipc	ra,0xffffe
    8020274e:	fd2080e7          	jalr	-46(ra) # 8020071c <release>
            release(&p->lock);
    80202752:	854a                	mv	a0,s2
    80202754:	ffffe097          	auipc	ra,0xffffe
    80202758:	fc8080e7          	jalr	-56(ra) # 8020071c <release>
            return -1;
    8020275c:	59fd                	li	s3,-1
    8020275e:	b7a5                	j	802026c6 <waitpid+0x2e>
    for (pp = proc; pp < &proc[NPROC]; pp++)
    80202760:	17848493          	addi	s1,s1,376
    80202764:	03348763          	beq	s1,s3,80202792 <waitpid+0xfa>
      if (pp->parent == p && pp->pid == cpid)
    80202768:	709c                	ld	a5,32(s1)
    8020276a:	ff279be3          	bne	a5,s2,80202760 <waitpid+0xc8>
    8020276e:	5c9c                	lw	a5,56(s1)
    80202770:	ff4798e3          	bne	a5,s4,80202760 <waitpid+0xc8>
        acquire(&pp->lock);
    80202774:	8526                	mv	a0,s1
    80202776:	ffffe097          	auipc	ra,0xffffe
    8020277a:	f52080e7          	jalr	-174(ra) # 802006c8 <acquire>
        if (pp->state == ZOMBIE)
    8020277e:	4c9c                	lw	a5,24(s1)
    80202780:	f95784e3          	beq	a5,s5,80202708 <waitpid+0x70>
        release(&pp->lock);
    80202784:	8526                	mv	a0,s1
    80202786:	ffffe097          	auipc	ra,0xffffe
    8020278a:	f96080e7          	jalr	-106(ra) # 8020071c <release>
        havekids = 1;
    8020278e:	875a                	mv	a4,s6
    80202790:	bfc1                	j	80202760 <waitpid+0xc8>
    if (!havekids || p->killed)
    80202792:	c305                	beqz	a4,802027b2 <waitpid+0x11a>
    80202794:	03092783          	lw	a5,48(s2)
    80202798:	ef89                	bnez	a5,802027b2 <waitpid+0x11a>
    sleep(p, &p->lock); // DOC: wait-sleep
    8020279a:	85e6                	mv	a1,s9
    8020279c:	854a                	mv	a0,s2
    8020279e:	00000097          	auipc	ra,0x0
    802027a2:	b38080e7          	jalr	-1224(ra) # 802022d6 <sleep>
    havekids = 0;
    802027a6:	8762                	mv	a4,s8
    for (pp = proc; pp < &proc[NPROC]; pp++)
    802027a8:	00014497          	auipc	s1,0x14
    802027ac:	9d848493          	addi	s1,s1,-1576 # 80216180 <proc>
    802027b0:	bf65                	j	80202768 <waitpid+0xd0>
      release(&p->lock);
    802027b2:	854a                	mv	a0,s2
    802027b4:	ffffe097          	auipc	ra,0xffffe
    802027b8:	f68080e7          	jalr	-152(ra) # 8020071c <release>
      panic("current process do not have child process [cpid]");
    802027bc:	00008517          	auipc	a0,0x8
    802027c0:	f1450513          	addi	a0,a0,-236 # 8020a6d0 <digits+0x350>
    802027c4:	ffffe097          	auipc	ra,0xffffe
    802027c8:	97e080e7          	jalr	-1666(ra) # 80200142 <panic>

00000000802027cc <swtch>:
    802027cc:	00153023          	sd	ra,0(a0)
    802027d0:	00253423          	sd	sp,8(a0)
    802027d4:	e900                	sd	s0,16(a0)
    802027d6:	ed04                	sd	s1,24(a0)
    802027d8:	03253023          	sd	s2,32(a0)
    802027dc:	03353423          	sd	s3,40(a0)
    802027e0:	03453823          	sd	s4,48(a0)
    802027e4:	03553c23          	sd	s5,56(a0)
    802027e8:	05653023          	sd	s6,64(a0)
    802027ec:	05753423          	sd	s7,72(a0)
    802027f0:	05853823          	sd	s8,80(a0)
    802027f4:	05953c23          	sd	s9,88(a0)
    802027f8:	07a53023          	sd	s10,96(a0)
    802027fc:	07b53423          	sd	s11,104(a0)
    80202800:	0005b083          	ld	ra,0(a1)
    80202804:	0085b103          	ld	sp,8(a1)
    80202808:	6980                	ld	s0,16(a1)
    8020280a:	6d84                	ld	s1,24(a1)
    8020280c:	0205b903          	ld	s2,32(a1)
    80202810:	0285b983          	ld	s3,40(a1)
    80202814:	0305ba03          	ld	s4,48(a1)
    80202818:	0385ba83          	ld	s5,56(a1)
    8020281c:	0405bb03          	ld	s6,64(a1)
    80202820:	0485bb83          	ld	s7,72(a1)
    80202824:	0505bc03          	ld	s8,80(a1)
    80202828:	0585bc83          	ld	s9,88(a1)
    8020282c:	0605bd03          	ld	s10,96(a1)
    80202830:	0685bd83          	ld	s11,104(a1)
    80202834:	8082                	ret

0000000080202836 <trapinithart>:
// }

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80202836:	1141                	addi	sp,sp,-16
    80202838:	e406                	sd	ra,8(sp)
    8020283a:	e022                	sd	s0,0(sp)
    8020283c:	0800                	addi	s0,sp,16
  asm volatile("csrw stvec, %0" : : "r" (x));
    8020283e:	0000b797          	auipc	a5,0xb
    80202842:	4527b783          	ld	a5,1106(a5) # 8020dc90 <_GLOBAL_OFFSET_TABLE_+0x20>
    80202846:	10579073          	csrw	stvec,a5
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8020284a:	100027f3          	csrr	a5,sstatus
  w_stvec((uint64)kernelvec);
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    8020284e:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202852:	10079073          	csrw	sstatus,a5
  asm volatile("csrr %0, sie" : "=r" (x) );
    80202856:	104027f3          	csrr	a5,sie
  // enable supervisor-mode timer interrupts.
  w_sie(r_sie() | SIE_SEIE | SIE_SSIE | SIE_STIE);
    8020285a:	2227e793          	ori	a5,a5,546
  asm volatile("csrw sie, %0" : : "r" (x));
    8020285e:	10479073          	csrw	sie,a5
  set_next_timeout();
    80202862:	00003097          	auipc	ra,0x3
    80202866:	2f4080e7          	jalr	756(ra) # 80205b56 <set_next_timeout>
  #ifdef DEBUG
  printf("trapinithart\n");
  #endif
}
    8020286a:	60a2                	ld	ra,8(sp)
    8020286c:	6402                	ld	s0,0(sp)
    8020286e:	0141                	addi	sp,sp,16
    80202870:	8082                	ret

0000000080202872 <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80202872:	1141                	addi	sp,sp,-16
    80202874:	e406                	sd	ra,8(sp)
    80202876:	e022                	sd	s0,0(sp)
    80202878:	0800                	addi	s0,sp,16
  struct proc *p = myproc();
    8020287a:	fffff097          	auipc	ra,0xfffff
    8020287e:	1fa080e7          	jalr	506(ra) # 80201a74 <myproc>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202882:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80202886:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202888:	10079073          	csrw	sstatus,a5
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    8020288c:	0000b617          	auipc	a2,0xb
    80202890:	3ec63603          	ld	a2,1004(a2) # 8020dc78 <_GLOBAL_OFFSET_TABLE_+0x8>
    80202894:	0000b697          	auipc	a3,0xb
    80202898:	4246b683          	ld	a3,1060(a3) # 8020dcb8 <_GLOBAL_OFFSET_TABLE_+0x48>
    8020289c:	8e91                	sub	a3,a3,a2
    8020289e:	040007b7          	lui	a5,0x4000
    802028a2:	17fd                	addi	a5,a5,-1
    802028a4:	07b2                	slli	a5,a5,0xc
    802028a6:	96be                	add	a3,a3,a5
  asm volatile("csrw stvec, %0" : : "r" (x));
    802028a8:	10569073          	csrw	stvec,a3

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    802028ac:	7138                	ld	a4,96(a0)
  asm volatile("csrr %0, satp" : "=r" (x) );
    802028ae:	180026f3          	csrr	a3,satp
    802028b2:	e314                	sd	a3,0(a4)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    802028b4:	7138                	ld	a4,96(a0)
    802028b6:	6134                	ld	a3,64(a0)
    802028b8:	6585                	lui	a1,0x1
    802028ba:	96ae                	add	a3,a3,a1
    802028bc:	e714                	sd	a3,8(a4)
  p->trapframe->kernel_trap = (uint64)usertrap;
    802028be:	7138                	ld	a4,96(a0)
    802028c0:	00000697          	auipc	a3,0x0
    802028c4:	0f468693          	addi	a3,a3,244 # 802029b4 <usertrap>
    802028c8:	eb14                	sd	a3,16(a4)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    802028ca:	7138                	ld	a4,96(a0)
  asm volatile("mv %0, tp" : "=r" (x) );
    802028cc:	8692                	mv	a3,tp
    802028ce:	f314                	sd	a3,32(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802028d0:	100026f3          	csrr	a3,sstatus
  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    802028d4:	eff6f693          	andi	a3,a3,-257
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    802028d8:	0206e693          	ori	a3,a3,32
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802028dc:	10069073          	csrw	sstatus,a3
  w_sstatus(x);

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    802028e0:	7138                	ld	a4,96(a0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    802028e2:	6f18                	ld	a4,24(a4)
    802028e4:	14171073          	csrw	sepc,a4

  // tell trampoline.S the user page table to switch to.
  // printf("[usertrapret]p->pagetable: %p\n", p->pagetable);
  uint64 satp = MAKE_SATP(p->pagetable);
    802028e8:	692c                	ld	a1,80(a0)
    802028ea:	81b1                	srli	a1,a1,0xc

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    802028ec:	0000b717          	auipc	a4,0xb
    802028f0:	39c73703          	ld	a4,924(a4) # 8020dc88 <_GLOBAL_OFFSET_TABLE_+0x18>
    802028f4:	8f11                	sub	a4,a4,a2
    802028f6:	97ba                	add	a5,a5,a4
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    802028f8:	577d                	li	a4,-1
    802028fa:	177e                	slli	a4,a4,0x3f
    802028fc:	8dd9                	or	a1,a1,a4
    802028fe:	02000537          	lui	a0,0x2000
    80202902:	157d                	addi	a0,a0,-1
    80202904:	0536                	slli	a0,a0,0xd
    80202906:	9782                	jalr	a5
}
    80202908:	60a2                	ld	ra,8(sp)
    8020290a:	6402                	ld	s0,0(sp)
    8020290c:	0141                	addi	sp,sp,16
    8020290e:	8082                	ret

0000000080202910 <devintr>:
// Check if it's an external/software interrupt, 
// and handle it. 
// returns  2 if timer interrupt, 
//          1 if other device, 
//          0 if not recognized. 
int devintr(void) {
    80202910:	1101                	addi	sp,sp,-32
    80202912:	ec06                	sd	ra,24(sp)
    80202914:	e822                	sd	s0,16(sp)
    80202916:	e426                	sd	s1,8(sp)
    80202918:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    8020291a:	14202773          	csrr	a4,scause
	uint64 scause = r_scause();

	#ifdef QEMU 
	// handle external interrupt 
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    8020291e:	00074d63          	bltz	a4,80202938 <devintr+0x28>
		sbi_set_mie();
		#endif 

		return 1;
	}
	else if (0x8000000000000005L == scause) {
    80202922:	57fd                	li	a5,-1
    80202924:	17fe                	slli	a5,a5,0x3f
    80202926:	0795                	addi	a5,a5,5
		timer_tick();
		return 2;
	}
	else { return 0;}
    80202928:	4501                	li	a0,0
	else if (0x8000000000000005L == scause) {
    8020292a:	06f70f63          	beq	a4,a5,802029a8 <devintr+0x98>
}
    8020292e:	60e2                	ld	ra,24(sp)
    80202930:	6442                	ld	s0,16(sp)
    80202932:	64a2                	ld	s1,8(sp)
    80202934:	6105                	addi	sp,sp,32
    80202936:	8082                	ret
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    80202938:	0ff77793          	andi	a5,a4,255
    8020293c:	46a5                	li	a3,9
    8020293e:	fed792e3          	bne	a5,a3,80202922 <devintr+0x12>
		int irq = plic_claim();
    80202942:	00005097          	auipc	ra,0x5
    80202946:	c5e080e7          	jalr	-930(ra) # 802075a0 <plic_claim>
    8020294a:	84aa                	mv	s1,a0
		if (UART_IRQ == irq) {
    8020294c:	47a9                	li	a5,10
    8020294e:	02f50163          	beq	a0,a5,80202970 <devintr+0x60>
		else if (DISK_IRQ == irq) {
    80202952:	4785                	li	a5,1
    80202954:	04f50563          	beq	a0,a5,8020299e <devintr+0x8e>
		return 1;
    80202958:	4505                	li	a0,1
		else if (irq) {
    8020295a:	d8f1                	beqz	s1,8020292e <devintr+0x1e>
			printf("unexpected interrupt irq = %d\n", irq);
    8020295c:	85a6                	mv	a1,s1
    8020295e:	00008517          	auipc	a0,0x8
    80202962:	dd250513          	addi	a0,a0,-558 # 8020a730 <digits+0x3b0>
    80202966:	ffffe097          	auipc	ra,0xffffe
    8020296a:	826080e7          	jalr	-2010(ra) # 8020018c <printf>
    8020296e:	a821                	j	80202986 <devintr+0x76>
	return SBI_CALL_0(SBI_CONSOLE_GETCHAR);
    80202970:	4501                	li	a0,0
    80202972:	4581                	li	a1,0
    80202974:	4601                	li	a2,0
    80202976:	4681                	li	a3,0
    80202978:	4889                	li	a7,2
    8020297a:	00000073          	ecall
    8020297e:	2501                	sext.w	a0,a0
			if (-1 != c) {
    80202980:	57fd                	li	a5,-1
    80202982:	00f51963          	bne	a0,a5,80202994 <devintr+0x84>
		if (irq) { plic_complete(irq);}
    80202986:	8526                	mv	a0,s1
    80202988:	00005097          	auipc	ra,0x5
    8020298c:	c42080e7          	jalr	-958(ra) # 802075ca <plic_complete>
		return 1;
    80202990:	4505                	li	a0,1
    80202992:	bf71                	j	8020292e <devintr+0x1e>
				consoleintr(c);
    80202994:	00005097          	auipc	ra,0x5
    80202998:	e4e080e7          	jalr	-434(ra) # 802077e2 <consoleintr>
    8020299c:	b7ed                	j	80202986 <devintr+0x76>
			disk_intr();
    8020299e:	00003097          	auipc	ra,0x3
    802029a2:	278080e7          	jalr	632(ra) # 80205c16 <disk_intr>
    802029a6:	b7c5                	j	80202986 <devintr+0x76>
		timer_tick();
    802029a8:	00003097          	auipc	ra,0x3
    802029ac:	1d4080e7          	jalr	468(ra) # 80205b7c <timer_tick>
		return 2;
    802029b0:	4509                	li	a0,2
    802029b2:	bfb5                	j	8020292e <devintr+0x1e>

00000000802029b4 <usertrap>:
{
    802029b4:	1101                	addi	sp,sp,-32
    802029b6:	ec06                	sd	ra,24(sp)
    802029b8:	e822                	sd	s0,16(sp)
    802029ba:	e426                	sd	s1,8(sp)
    802029bc:	e04a                	sd	s2,0(sp)
    802029be:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802029c0:	100027f3          	csrr	a5,sstatus
  if((r_sstatus() & SSTATUS_SPP) != 0)
    802029c4:	1007f793          	andi	a5,a5,256
    802029c8:	e3ad                	bnez	a5,80202a2a <usertrap+0x76>
  asm volatile("csrw stvec, %0" : : "r" (x));
    802029ca:	0000b797          	auipc	a5,0xb
    802029ce:	2c67b783          	ld	a5,710(a5) # 8020dc90 <_GLOBAL_OFFSET_TABLE_+0x20>
    802029d2:	10579073          	csrw	stvec,a5
  struct proc *p = myproc();
    802029d6:	fffff097          	auipc	ra,0xfffff
    802029da:	09e080e7          	jalr	158(ra) # 80201a74 <myproc>
    802029de:	84aa                	mv	s1,a0
  p->trapframe->epc = r_sepc();
    802029e0:	713c                	ld	a5,96(a0)
  asm volatile("csrr %0, sepc" : "=r" (x) );
    802029e2:	14102773          	csrr	a4,sepc
    802029e6:	ef98                	sd	a4,24(a5)
  asm volatile("csrr %0, scause" : "=r" (x) );
    802029e8:	14202773          	csrr	a4,scause
  if(r_scause() == 8){
    802029ec:	47a1                	li	a5,8
    802029ee:	04f71c63          	bne	a4,a5,80202a46 <usertrap+0x92>
    if(p->killed)
    802029f2:	591c                	lw	a5,48(a0)
    802029f4:	e3b9                	bnez	a5,80202a3a <usertrap+0x86>
    p->trapframe->epc += 4;
    802029f6:	70b8                	ld	a4,96(s1)
    802029f8:	6f1c                	ld	a5,24(a4)
    802029fa:	0791                	addi	a5,a5,4
    802029fc:	ef1c                	sd	a5,24(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802029fe:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202a02:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202a06:	10079073          	csrw	sstatus,a5
    syscall();
    80202a0a:	00000097          	auipc	ra,0x0
    80202a0e:	5d4080e7          	jalr	1492(ra) # 80202fde <syscall>
  if(p->killed)
    80202a12:	589c                	lw	a5,48(s1)
    80202a14:	ebd1                	bnez	a5,80202aa8 <usertrap+0xf4>
  usertrapret();
    80202a16:	00000097          	auipc	ra,0x0
    80202a1a:	e5c080e7          	jalr	-420(ra) # 80202872 <usertrapret>
}
    80202a1e:	60e2                	ld	ra,24(sp)
    80202a20:	6442                	ld	s0,16(sp)
    80202a22:	64a2                	ld	s1,8(sp)
    80202a24:	6902                	ld	s2,0(sp)
    80202a26:	6105                	addi	sp,sp,32
    80202a28:	8082                	ret
    panic("usertrap: not from user mode");
    80202a2a:	00008517          	auipc	a0,0x8
    80202a2e:	d2650513          	addi	a0,a0,-730 # 8020a750 <digits+0x3d0>
    80202a32:	ffffd097          	auipc	ra,0xffffd
    80202a36:	710080e7          	jalr	1808(ra) # 80200142 <panic>
      exit(-1);
    80202a3a:	557d                	li	a0,-1
    80202a3c:	fffff097          	auipc	ra,0xfffff
    80202a40:	774080e7          	jalr	1908(ra) # 802021b0 <exit>
    80202a44:	bf4d                	j	802029f6 <usertrap+0x42>
  else if((which_dev = devintr()) != 0){
    80202a46:	00000097          	auipc	ra,0x0
    80202a4a:	eca080e7          	jalr	-310(ra) # 80202910 <devintr>
    80202a4e:	892a                	mv	s2,a0
    80202a50:	c501                	beqz	a0,80202a58 <usertrap+0xa4>
  if(p->killed)
    80202a52:	589c                	lw	a5,48(s1)
    80202a54:	c3b1                	beqz	a5,80202a98 <usertrap+0xe4>
    80202a56:	a825                	j	80202a8e <usertrap+0xda>
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202a58:	142025f3          	csrr	a1,scause
    printf("\nusertrap(): unexpected scause %p pid=%d %s\n", r_scause(), p->pid, p->name);
    80202a5c:	16048693          	addi	a3,s1,352
    80202a60:	5c90                	lw	a2,56(s1)
    80202a62:	00008517          	auipc	a0,0x8
    80202a66:	d0e50513          	addi	a0,a0,-754 # 8020a770 <digits+0x3f0>
    80202a6a:	ffffd097          	auipc	ra,0xffffd
    80202a6e:	722080e7          	jalr	1826(ra) # 8020018c <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202a72:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202a76:	14302673          	csrr	a2,stval
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80202a7a:	00008517          	auipc	a0,0x8
    80202a7e:	d2650513          	addi	a0,a0,-730 # 8020a7a0 <digits+0x420>
    80202a82:	ffffd097          	auipc	ra,0xffffd
    80202a86:	70a080e7          	jalr	1802(ra) # 8020018c <printf>
    p->killed = 1;
    80202a8a:	4785                	li	a5,1
    80202a8c:	d89c                	sw	a5,48(s1)
    exit(-1);
    80202a8e:	557d                	li	a0,-1
    80202a90:	fffff097          	auipc	ra,0xfffff
    80202a94:	720080e7          	jalr	1824(ra) # 802021b0 <exit>
  if(which_dev == 2)
    80202a98:	4789                	li	a5,2
    80202a9a:	f6f91ee3          	bne	s2,a5,80202a16 <usertrap+0x62>
    yield();
    80202a9e:	fffff097          	auipc	ra,0xfffff
    80202aa2:	7fc080e7          	jalr	2044(ra) # 8020229a <yield>
    80202aa6:	bf85                	j	80202a16 <usertrap+0x62>
  int which_dev = 0;
    80202aa8:	4901                	li	s2,0
    80202aaa:	b7d5                	j	80202a8e <usertrap+0xda>

0000000080202aac <kerneltrap>:
kerneltrap() {
    80202aac:	7179                	addi	sp,sp,-48
    80202aae:	f406                	sd	ra,40(sp)
    80202ab0:	f022                	sd	s0,32(sp)
    80202ab2:	ec26                	sd	s1,24(sp)
    80202ab4:	e84a                	sd	s2,16(sp)
    80202ab6:	e44e                	sd	s3,8(sp)
    80202ab8:	1800                	addi	s0,sp,48
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202aba:	14102973          	csrr	s2,sepc
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202abe:	100024f3          	csrr	s1,sstatus
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202ac2:	142029f3          	csrr	s3,scause
  if((sstatus & SSTATUS_SPP) == 0)
    80202ac6:	1004f793          	andi	a5,s1,256
    80202aca:	cb85                	beqz	a5,80202afa <kerneltrap+0x4e>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202acc:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80202ad0:	8b89                	andi	a5,a5,2
  if(intr_get() != 0)
    80202ad2:	ef85                	bnez	a5,80202b0a <kerneltrap+0x5e>
  if((which_dev = devintr()) == 0){
    80202ad4:	00000097          	auipc	ra,0x0
    80202ad8:	e3c080e7          	jalr	-452(ra) # 80202910 <devintr>
    80202adc:	cd1d                	beqz	a0,80202b1a <kerneltrap+0x6e>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202ade:	4789                	li	a5,2
    80202ae0:	08f50b63          	beq	a0,a5,80202b76 <kerneltrap+0xca>
  asm volatile("csrw sepc, %0" : : "r" (x));
    80202ae4:	14191073          	csrw	sepc,s2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202ae8:	10049073          	csrw	sstatus,s1
}
    80202aec:	70a2                	ld	ra,40(sp)
    80202aee:	7402                	ld	s0,32(sp)
    80202af0:	64e2                	ld	s1,24(sp)
    80202af2:	6942                	ld	s2,16(sp)
    80202af4:	69a2                	ld	s3,8(sp)
    80202af6:	6145                	addi	sp,sp,48
    80202af8:	8082                	ret
    panic("kerneltrap: not from supervisor mode");
    80202afa:	00008517          	auipc	a0,0x8
    80202afe:	cc650513          	addi	a0,a0,-826 # 8020a7c0 <digits+0x440>
    80202b02:	ffffd097          	auipc	ra,0xffffd
    80202b06:	640080e7          	jalr	1600(ra) # 80200142 <panic>
    panic("kerneltrap: interrupts enabled");
    80202b0a:	00008517          	auipc	a0,0x8
    80202b0e:	cde50513          	addi	a0,a0,-802 # 8020a7e8 <digits+0x468>
    80202b12:	ffffd097          	auipc	ra,0xffffd
    80202b16:	630080e7          	jalr	1584(ra) # 80200142 <panic>
    printf("\nscause %p\n", scause);
    80202b1a:	85ce                	mv	a1,s3
    80202b1c:	00008517          	auipc	a0,0x8
    80202b20:	cec50513          	addi	a0,a0,-788 # 8020a808 <digits+0x488>
    80202b24:	ffffd097          	auipc	ra,0xffffd
    80202b28:	668080e7          	jalr	1640(ra) # 8020018c <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202b2c:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202b30:	14302673          	csrr	a2,stval
  asm volatile("mv %0, tp" : "=r" (x) );
    80202b34:	8692                	mv	a3,tp
    printf("sepc=%p stval=%p hart=%d\n", r_sepc(), r_stval(), r_tp());
    80202b36:	00008517          	auipc	a0,0x8
    80202b3a:	ce250513          	addi	a0,a0,-798 # 8020a818 <digits+0x498>
    80202b3e:	ffffd097          	auipc	ra,0xffffd
    80202b42:	64e080e7          	jalr	1614(ra) # 8020018c <printf>
    struct proc *p = myproc();
    80202b46:	fffff097          	auipc	ra,0xfffff
    80202b4a:	f2e080e7          	jalr	-210(ra) # 80201a74 <myproc>
    if (p != 0) {
    80202b4e:	cd01                	beqz	a0,80202b66 <kerneltrap+0xba>
      printf("pid: %d, name: %s\n", p->pid, p->name);
    80202b50:	16050613          	addi	a2,a0,352
    80202b54:	5d0c                	lw	a1,56(a0)
    80202b56:	00008517          	auipc	a0,0x8
    80202b5a:	ce250513          	addi	a0,a0,-798 # 8020a838 <digits+0x4b8>
    80202b5e:	ffffd097          	auipc	ra,0xffffd
    80202b62:	62e080e7          	jalr	1582(ra) # 8020018c <printf>
    panic("kerneltrap");
    80202b66:	00008517          	auipc	a0,0x8
    80202b6a:	cea50513          	addi	a0,a0,-790 # 8020a850 <digits+0x4d0>
    80202b6e:	ffffd097          	auipc	ra,0xffffd
    80202b72:	5d4080e7          	jalr	1492(ra) # 80200142 <panic>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202b76:	fffff097          	auipc	ra,0xfffff
    80202b7a:	efe080e7          	jalr	-258(ra) # 80201a74 <myproc>
    80202b7e:	d13d                	beqz	a0,80202ae4 <kerneltrap+0x38>
    80202b80:	fffff097          	auipc	ra,0xfffff
    80202b84:	ef4080e7          	jalr	-268(ra) # 80201a74 <myproc>
    80202b88:	4d18                	lw	a4,24(a0)
    80202b8a:	478d                	li	a5,3
    80202b8c:	f4f71ce3          	bne	a4,a5,80202ae4 <kerneltrap+0x38>
    yield();
    80202b90:	fffff097          	auipc	ra,0xfffff
    80202b94:	70a080e7          	jalr	1802(ra) # 8020229a <yield>
    80202b98:	b7b1                	j	80202ae4 <kerneltrap+0x38>

0000000080202b9a <trapframedump>:

void trapframedump(struct trapframe *tf)
{
    80202b9a:	1101                	addi	sp,sp,-32
    80202b9c:	ec06                	sd	ra,24(sp)
    80202b9e:	e822                	sd	s0,16(sp)
    80202ba0:	e426                	sd	s1,8(sp)
    80202ba2:	1000                	addi	s0,sp,32
    80202ba4:	84aa                	mv	s1,a0
  printf("a0: %p\t", tf->a0);
    80202ba6:	792c                	ld	a1,112(a0)
    80202ba8:	00008517          	auipc	a0,0x8
    80202bac:	cb850513          	addi	a0,a0,-840 # 8020a860 <digits+0x4e0>
    80202bb0:	ffffd097          	auipc	ra,0xffffd
    80202bb4:	5dc080e7          	jalr	1500(ra) # 8020018c <printf>
  printf("a1: %p\t", tf->a1);
    80202bb8:	7cac                	ld	a1,120(s1)
    80202bba:	00008517          	auipc	a0,0x8
    80202bbe:	cae50513          	addi	a0,a0,-850 # 8020a868 <digits+0x4e8>
    80202bc2:	ffffd097          	auipc	ra,0xffffd
    80202bc6:	5ca080e7          	jalr	1482(ra) # 8020018c <printf>
  printf("a2: %p\t", tf->a2);
    80202bca:	60cc                	ld	a1,128(s1)
    80202bcc:	00008517          	auipc	a0,0x8
    80202bd0:	ca450513          	addi	a0,a0,-860 # 8020a870 <digits+0x4f0>
    80202bd4:	ffffd097          	auipc	ra,0xffffd
    80202bd8:	5b8080e7          	jalr	1464(ra) # 8020018c <printf>
  printf("a3: %p\n", tf->a3);
    80202bdc:	64cc                	ld	a1,136(s1)
    80202bde:	00008517          	auipc	a0,0x8
    80202be2:	c9a50513          	addi	a0,a0,-870 # 8020a878 <digits+0x4f8>
    80202be6:	ffffd097          	auipc	ra,0xffffd
    80202bea:	5a6080e7          	jalr	1446(ra) # 8020018c <printf>
  printf("a4: %p\t", tf->a4);
    80202bee:	68cc                	ld	a1,144(s1)
    80202bf0:	00008517          	auipc	a0,0x8
    80202bf4:	c9050513          	addi	a0,a0,-880 # 8020a880 <digits+0x500>
    80202bf8:	ffffd097          	auipc	ra,0xffffd
    80202bfc:	594080e7          	jalr	1428(ra) # 8020018c <printf>
  printf("a5: %p\t", tf->a5);
    80202c00:	6ccc                	ld	a1,152(s1)
    80202c02:	00008517          	auipc	a0,0x8
    80202c06:	c8650513          	addi	a0,a0,-890 # 8020a888 <digits+0x508>
    80202c0a:	ffffd097          	auipc	ra,0xffffd
    80202c0e:	582080e7          	jalr	1410(ra) # 8020018c <printf>
  printf("a6: %p\t", tf->a6);
    80202c12:	70cc                	ld	a1,160(s1)
    80202c14:	00008517          	auipc	a0,0x8
    80202c18:	c7c50513          	addi	a0,a0,-900 # 8020a890 <digits+0x510>
    80202c1c:	ffffd097          	auipc	ra,0xffffd
    80202c20:	570080e7          	jalr	1392(ra) # 8020018c <printf>
  printf("a7: %p\n", tf->a7);
    80202c24:	74cc                	ld	a1,168(s1)
    80202c26:	00008517          	auipc	a0,0x8
    80202c2a:	c7250513          	addi	a0,a0,-910 # 8020a898 <digits+0x518>
    80202c2e:	ffffd097          	auipc	ra,0xffffd
    80202c32:	55e080e7          	jalr	1374(ra) # 8020018c <printf>
  printf("t0: %p\t", tf->t0);
    80202c36:	64ac                	ld	a1,72(s1)
    80202c38:	00008517          	auipc	a0,0x8
    80202c3c:	c6850513          	addi	a0,a0,-920 # 8020a8a0 <digits+0x520>
    80202c40:	ffffd097          	auipc	ra,0xffffd
    80202c44:	54c080e7          	jalr	1356(ra) # 8020018c <printf>
  printf("t1: %p\t", tf->t1);
    80202c48:	68ac                	ld	a1,80(s1)
    80202c4a:	00008517          	auipc	a0,0x8
    80202c4e:	c5e50513          	addi	a0,a0,-930 # 8020a8a8 <digits+0x528>
    80202c52:	ffffd097          	auipc	ra,0xffffd
    80202c56:	53a080e7          	jalr	1338(ra) # 8020018c <printf>
  printf("t2: %p\t", tf->t2);
    80202c5a:	6cac                	ld	a1,88(s1)
    80202c5c:	00008517          	auipc	a0,0x8
    80202c60:	c5450513          	addi	a0,a0,-940 # 8020a8b0 <digits+0x530>
    80202c64:	ffffd097          	auipc	ra,0xffffd
    80202c68:	528080e7          	jalr	1320(ra) # 8020018c <printf>
  printf("t3: %p\n", tf->t3);
    80202c6c:	1004b583          	ld	a1,256(s1)
    80202c70:	00008517          	auipc	a0,0x8
    80202c74:	c4850513          	addi	a0,a0,-952 # 8020a8b8 <digits+0x538>
    80202c78:	ffffd097          	auipc	ra,0xffffd
    80202c7c:	514080e7          	jalr	1300(ra) # 8020018c <printf>
  printf("t4: %p\t", tf->t4);
    80202c80:	1084b583          	ld	a1,264(s1)
    80202c84:	00008517          	auipc	a0,0x8
    80202c88:	c3c50513          	addi	a0,a0,-964 # 8020a8c0 <digits+0x540>
    80202c8c:	ffffd097          	auipc	ra,0xffffd
    80202c90:	500080e7          	jalr	1280(ra) # 8020018c <printf>
  printf("t5: %p\t", tf->t5);
    80202c94:	1104b583          	ld	a1,272(s1)
    80202c98:	00008517          	auipc	a0,0x8
    80202c9c:	c3050513          	addi	a0,a0,-976 # 8020a8c8 <digits+0x548>
    80202ca0:	ffffd097          	auipc	ra,0xffffd
    80202ca4:	4ec080e7          	jalr	1260(ra) # 8020018c <printf>
  printf("t6: %p\t", tf->t6);
    80202ca8:	1184b583          	ld	a1,280(s1)
    80202cac:	00008517          	auipc	a0,0x8
    80202cb0:	c2450513          	addi	a0,a0,-988 # 8020a8d0 <digits+0x550>
    80202cb4:	ffffd097          	auipc	ra,0xffffd
    80202cb8:	4d8080e7          	jalr	1240(ra) # 8020018c <printf>
  printf("s0: %p\n", tf->s0);
    80202cbc:	70ac                	ld	a1,96(s1)
    80202cbe:	00008517          	auipc	a0,0x8
    80202cc2:	c1a50513          	addi	a0,a0,-998 # 8020a8d8 <digits+0x558>
    80202cc6:	ffffd097          	auipc	ra,0xffffd
    80202cca:	4c6080e7          	jalr	1222(ra) # 8020018c <printf>
  printf("s1: %p\t", tf->s1);
    80202cce:	74ac                	ld	a1,104(s1)
    80202cd0:	00008517          	auipc	a0,0x8
    80202cd4:	c1050513          	addi	a0,a0,-1008 # 8020a8e0 <digits+0x560>
    80202cd8:	ffffd097          	auipc	ra,0xffffd
    80202cdc:	4b4080e7          	jalr	1204(ra) # 8020018c <printf>
  printf("s2: %p\t", tf->s2);
    80202ce0:	78cc                	ld	a1,176(s1)
    80202ce2:	00008517          	auipc	a0,0x8
    80202ce6:	c0650513          	addi	a0,a0,-1018 # 8020a8e8 <digits+0x568>
    80202cea:	ffffd097          	auipc	ra,0xffffd
    80202cee:	4a2080e7          	jalr	1186(ra) # 8020018c <printf>
  printf("s3: %p\t", tf->s3);
    80202cf2:	7ccc                	ld	a1,184(s1)
    80202cf4:	00008517          	auipc	a0,0x8
    80202cf8:	bfc50513          	addi	a0,a0,-1028 # 8020a8f0 <digits+0x570>
    80202cfc:	ffffd097          	auipc	ra,0xffffd
    80202d00:	490080e7          	jalr	1168(ra) # 8020018c <printf>
  printf("s4: %p\n", tf->s4);
    80202d04:	60ec                	ld	a1,192(s1)
    80202d06:	00008517          	auipc	a0,0x8
    80202d0a:	bf250513          	addi	a0,a0,-1038 # 8020a8f8 <digits+0x578>
    80202d0e:	ffffd097          	auipc	ra,0xffffd
    80202d12:	47e080e7          	jalr	1150(ra) # 8020018c <printf>
  printf("s5: %p\t", tf->s5);
    80202d16:	64ec                	ld	a1,200(s1)
    80202d18:	00008517          	auipc	a0,0x8
    80202d1c:	be850513          	addi	a0,a0,-1048 # 8020a900 <digits+0x580>
    80202d20:	ffffd097          	auipc	ra,0xffffd
    80202d24:	46c080e7          	jalr	1132(ra) # 8020018c <printf>
  printf("s6: %p\t", tf->s6);
    80202d28:	68ec                	ld	a1,208(s1)
    80202d2a:	00008517          	auipc	a0,0x8
    80202d2e:	bde50513          	addi	a0,a0,-1058 # 8020a908 <digits+0x588>
    80202d32:	ffffd097          	auipc	ra,0xffffd
    80202d36:	45a080e7          	jalr	1114(ra) # 8020018c <printf>
  printf("s7: %p\t", tf->s7);
    80202d3a:	6cec                	ld	a1,216(s1)
    80202d3c:	00008517          	auipc	a0,0x8
    80202d40:	bd450513          	addi	a0,a0,-1068 # 8020a910 <digits+0x590>
    80202d44:	ffffd097          	auipc	ra,0xffffd
    80202d48:	448080e7          	jalr	1096(ra) # 8020018c <printf>
  printf("s8: %p\n", tf->s8);
    80202d4c:	70ec                	ld	a1,224(s1)
    80202d4e:	00008517          	auipc	a0,0x8
    80202d52:	bca50513          	addi	a0,a0,-1078 # 8020a918 <digits+0x598>
    80202d56:	ffffd097          	auipc	ra,0xffffd
    80202d5a:	436080e7          	jalr	1078(ra) # 8020018c <printf>
  printf("s9: %p\t", tf->s9);
    80202d5e:	74ec                	ld	a1,232(s1)
    80202d60:	00008517          	auipc	a0,0x8
    80202d64:	bc050513          	addi	a0,a0,-1088 # 8020a920 <digits+0x5a0>
    80202d68:	ffffd097          	auipc	ra,0xffffd
    80202d6c:	424080e7          	jalr	1060(ra) # 8020018c <printf>
  printf("s10: %p\t", tf->s10);
    80202d70:	78ec                	ld	a1,240(s1)
    80202d72:	00008517          	auipc	a0,0x8
    80202d76:	bb650513          	addi	a0,a0,-1098 # 8020a928 <digits+0x5a8>
    80202d7a:	ffffd097          	auipc	ra,0xffffd
    80202d7e:	412080e7          	jalr	1042(ra) # 8020018c <printf>
  printf("s11: %p\t", tf->s11);
    80202d82:	7cec                	ld	a1,248(s1)
    80202d84:	00008517          	auipc	a0,0x8
    80202d88:	bb450513          	addi	a0,a0,-1100 # 8020a938 <digits+0x5b8>
    80202d8c:	ffffd097          	auipc	ra,0xffffd
    80202d90:	400080e7          	jalr	1024(ra) # 8020018c <printf>
  printf("ra: %p\n", tf->ra);
    80202d94:	748c                	ld	a1,40(s1)
    80202d96:	00008517          	auipc	a0,0x8
    80202d9a:	87a50513          	addi	a0,a0,-1926 # 8020a610 <digits+0x290>
    80202d9e:	ffffd097          	auipc	ra,0xffffd
    80202da2:	3ee080e7          	jalr	1006(ra) # 8020018c <printf>
  printf("sp: %p\t", tf->sp);
    80202da6:	788c                	ld	a1,48(s1)
    80202da8:	00008517          	auipc	a0,0x8
    80202dac:	ba050513          	addi	a0,a0,-1120 # 8020a948 <digits+0x5c8>
    80202db0:	ffffd097          	auipc	ra,0xffffd
    80202db4:	3dc080e7          	jalr	988(ra) # 8020018c <printf>
  printf("gp: %p\t", tf->gp);
    80202db8:	7c8c                	ld	a1,56(s1)
    80202dba:	00008517          	auipc	a0,0x8
    80202dbe:	b9650513          	addi	a0,a0,-1130 # 8020a950 <digits+0x5d0>
    80202dc2:	ffffd097          	auipc	ra,0xffffd
    80202dc6:	3ca080e7          	jalr	970(ra) # 8020018c <printf>
  printf("tp: %p\t", tf->tp);
    80202dca:	60ac                	ld	a1,64(s1)
    80202dcc:	00008517          	auipc	a0,0x8
    80202dd0:	b8c50513          	addi	a0,a0,-1140 # 8020a958 <digits+0x5d8>
    80202dd4:	ffffd097          	auipc	ra,0xffffd
    80202dd8:	3b8080e7          	jalr	952(ra) # 8020018c <printf>
  printf("epc: %p\n", tf->epc);
    80202ddc:	6c8c                	ld	a1,24(s1)
    80202dde:	00008517          	auipc	a0,0x8
    80202de2:	b8250513          	addi	a0,a0,-1150 # 8020a960 <digits+0x5e0>
    80202de6:	ffffd097          	auipc	ra,0xffffd
    80202dea:	3a6080e7          	jalr	934(ra) # 8020018c <printf>
}
    80202dee:	60e2                	ld	ra,24(sp)
    80202df0:	6442                	ld	s0,16(sp)
    80202df2:	64a2                	ld	s1,8(sp)
    80202df4:	6105                	addi	sp,sp,32
    80202df6:	8082                	ret

0000000080202df8 <argraw>:
  return strlen(buf);
}

static uint64
argraw(int n)
{
    80202df8:	1101                	addi	sp,sp,-32
    80202dfa:	ec06                	sd	ra,24(sp)
    80202dfc:	e822                	sd	s0,16(sp)
    80202dfe:	e426                	sd	s1,8(sp)
    80202e00:	1000                	addi	s0,sp,32
    80202e02:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80202e04:	fffff097          	auipc	ra,0xfffff
    80202e08:	c70080e7          	jalr	-912(ra) # 80201a74 <myproc>
  switch (n) {
    80202e0c:	4795                	li	a5,5
    80202e0e:	0497e163          	bltu	a5,s1,80202e50 <argraw+0x58>
    80202e12:	048a                	slli	s1,s1,0x2
    80202e14:	00008717          	auipc	a4,0x8
    80202e18:	d4c70713          	addi	a4,a4,-692 # 8020ab60 <digits+0x7e0>
    80202e1c:	94ba                	add	s1,s1,a4
    80202e1e:	409c                	lw	a5,0(s1)
    80202e20:	97ba                	add	a5,a5,a4
    80202e22:	8782                	jr	a5
  case 0:
    return p->trapframe->a0;
    80202e24:	713c                	ld	a5,96(a0)
    80202e26:	7ba8                	ld	a0,112(a5)
  case 5:
    return p->trapframe->a5;
  }
  panic("argraw");
  return -1;
}
    80202e28:	60e2                	ld	ra,24(sp)
    80202e2a:	6442                	ld	s0,16(sp)
    80202e2c:	64a2                	ld	s1,8(sp)
    80202e2e:	6105                	addi	sp,sp,32
    80202e30:	8082                	ret
    return p->trapframe->a1;
    80202e32:	713c                	ld	a5,96(a0)
    80202e34:	7fa8                	ld	a0,120(a5)
    80202e36:	bfcd                	j	80202e28 <argraw+0x30>
    return p->trapframe->a2;
    80202e38:	713c                	ld	a5,96(a0)
    80202e3a:	63c8                	ld	a0,128(a5)
    80202e3c:	b7f5                	j	80202e28 <argraw+0x30>
    return p->trapframe->a3;
    80202e3e:	713c                	ld	a5,96(a0)
    80202e40:	67c8                	ld	a0,136(a5)
    80202e42:	b7dd                	j	80202e28 <argraw+0x30>
    return p->trapframe->a4;
    80202e44:	713c                	ld	a5,96(a0)
    80202e46:	6bc8                	ld	a0,144(a5)
    80202e48:	b7c5                	j	80202e28 <argraw+0x30>
    return p->trapframe->a5;
    80202e4a:	713c                	ld	a5,96(a0)
    80202e4c:	6fc8                	ld	a0,152(a5)
    80202e4e:	bfe9                	j	80202e28 <argraw+0x30>
  panic("argraw");
    80202e50:	00008517          	auipc	a0,0x8
    80202e54:	b2050513          	addi	a0,a0,-1248 # 8020a970 <digits+0x5f0>
    80202e58:	ffffd097          	auipc	ra,0xffffd
    80202e5c:	2ea080e7          	jalr	746(ra) # 80200142 <panic>

0000000080202e60 <sys_sysinfo>:
    return 0;
}

uint64
sys_sysinfo(void)
{
    80202e60:	7179                	addi	sp,sp,-48
    80202e62:	f406                	sd	ra,40(sp)
    80202e64:	f022                	sd	s0,32(sp)
    80202e66:	ec26                	sd	s1,24(sp)
    80202e68:	1800                	addi	s0,sp,48
  *ip = argraw(n);
    80202e6a:	4501                	li	a0,0
    80202e6c:	00000097          	auipc	ra,0x0
    80202e70:	f8c080e7          	jalr	-116(ra) # 80202df8 <argraw>
    80202e74:	84aa                	mv	s1,a0
  if (argaddr(0, &addr) < 0) {
    return -1;
  }

  struct sysinfo info;
  info.freemem = freemem_amount();
    80202e76:	ffffd097          	auipc	ra,0xffffd
    80202e7a:	74c080e7          	jalr	1868(ra) # 802005c2 <freemem_amount>
    80202e7e:	fca43823          	sd	a0,-48(s0)
  info.nproc = procnum();
    80202e82:	fffff097          	auipc	ra,0xfffff
    80202e86:	7ce080e7          	jalr	1998(ra) # 80202650 <procnum>
    80202e8a:	fca43c23          	sd	a0,-40(s0)

  // if (copyout(p->pagetable, addr, (char *)&info, sizeof(info)) < 0) {
  if (copyout2(addr, (char *)&info, sizeof(info)) < 0) {
    80202e8e:	4641                	li	a2,16
    80202e90:	fd040593          	addi	a1,s0,-48
    80202e94:	8526                	mv	a0,s1
    80202e96:	ffffe097          	auipc	ra,0xffffe
    80202e9a:	502080e7          	jalr	1282(ra) # 80201398 <copyout2>
    return -1;
  }

  return 0;
    80202e9e:	957d                	srai	a0,a0,0x3f
    80202ea0:	70a2                	ld	ra,40(sp)
    80202ea2:	7402                	ld	s0,32(sp)
    80202ea4:	64e2                	ld	s1,24(sp)
    80202ea6:	6145                	addi	sp,sp,48
    80202ea8:	8082                	ret

0000000080202eaa <fetchaddr>:
{
    80202eaa:	1101                	addi	sp,sp,-32
    80202eac:	ec06                	sd	ra,24(sp)
    80202eae:	e822                	sd	s0,16(sp)
    80202eb0:	e426                	sd	s1,8(sp)
    80202eb2:	e04a                	sd	s2,0(sp)
    80202eb4:	1000                	addi	s0,sp,32
    80202eb6:	84aa                	mv	s1,a0
    80202eb8:	892e                	mv	s2,a1
  struct proc *p = myproc();
    80202eba:	fffff097          	auipc	ra,0xfffff
    80202ebe:	bba080e7          	jalr	-1094(ra) # 80201a74 <myproc>
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    80202ec2:	653c                	ld	a5,72(a0)
    80202ec4:	02f4f763          	bgeu	s1,a5,80202ef2 <fetchaddr+0x48>
    80202ec8:	00848713          	addi	a4,s1,8
    80202ecc:	02e7e563          	bltu	a5,a4,80202ef6 <fetchaddr+0x4c>
  if(copyin2((char *)ip, addr, sizeof(*ip)) != 0)
    80202ed0:	4621                	li	a2,8
    80202ed2:	85a6                	mv	a1,s1
    80202ed4:	854a                	mv	a0,s2
    80202ed6:	ffffe097          	auipc	ra,0xffffe
    80202eda:	5a0080e7          	jalr	1440(ra) # 80201476 <copyin2>
    80202ede:	00a03533          	snez	a0,a0
    80202ee2:	40a00533          	neg	a0,a0
}
    80202ee6:	60e2                	ld	ra,24(sp)
    80202ee8:	6442                	ld	s0,16(sp)
    80202eea:	64a2                	ld	s1,8(sp)
    80202eec:	6902                	ld	s2,0(sp)
    80202eee:	6105                	addi	sp,sp,32
    80202ef0:	8082                	ret
    return -1;
    80202ef2:	557d                	li	a0,-1
    80202ef4:	bfcd                	j	80202ee6 <fetchaddr+0x3c>
    80202ef6:	557d                	li	a0,-1
    80202ef8:	b7fd                	j	80202ee6 <fetchaddr+0x3c>

0000000080202efa <fetchstr>:
{
    80202efa:	1101                	addi	sp,sp,-32
    80202efc:	ec06                	sd	ra,24(sp)
    80202efe:	e822                	sd	s0,16(sp)
    80202f00:	e426                	sd	s1,8(sp)
    80202f02:	1000                	addi	s0,sp,32
    80202f04:	84ae                	mv	s1,a1
  int err = copyinstr2(buf, addr, max);
    80202f06:	85aa                	mv	a1,a0
    80202f08:	8526                	mv	a0,s1
    80202f0a:	ffffe097          	auipc	ra,0xffffe
    80202f0e:	672080e7          	jalr	1650(ra) # 8020157c <copyinstr2>
  if(err < 0)
    80202f12:	00054763          	bltz	a0,80202f20 <fetchstr+0x26>
  return strlen(buf);
    80202f16:	8526                	mv	a0,s1
    80202f18:	ffffe097          	auipc	ra,0xffffe
    80202f1c:	9d4080e7          	jalr	-1580(ra) # 802008ec <strlen>
}
    80202f20:	60e2                	ld	ra,24(sp)
    80202f22:	6442                	ld	s0,16(sp)
    80202f24:	64a2                	ld	s1,8(sp)
    80202f26:	6105                	addi	sp,sp,32
    80202f28:	8082                	ret

0000000080202f2a <argint>:
{
    80202f2a:	1101                	addi	sp,sp,-32
    80202f2c:	ec06                	sd	ra,24(sp)
    80202f2e:	e822                	sd	s0,16(sp)
    80202f30:	e426                	sd	s1,8(sp)
    80202f32:	1000                	addi	s0,sp,32
    80202f34:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80202f36:	00000097          	auipc	ra,0x0
    80202f3a:	ec2080e7          	jalr	-318(ra) # 80202df8 <argraw>
    80202f3e:	c088                	sw	a0,0(s1)
}
    80202f40:	4501                	li	a0,0
    80202f42:	60e2                	ld	ra,24(sp)
    80202f44:	6442                	ld	s0,16(sp)
    80202f46:	64a2                	ld	s1,8(sp)
    80202f48:	6105                	addi	sp,sp,32
    80202f4a:	8082                	ret

0000000080202f4c <sys_test_proc>:
sys_test_proc(void) {
    80202f4c:	1101                	addi	sp,sp,-32
    80202f4e:	ec06                	sd	ra,24(sp)
    80202f50:	e822                	sd	s0,16(sp)
    80202f52:	1000                	addi	s0,sp,32
    argint(0, &n);
    80202f54:	fec40593          	addi	a1,s0,-20
    80202f58:	4501                	li	a0,0
    80202f5a:	00000097          	auipc	ra,0x0
    80202f5e:	fd0080e7          	jalr	-48(ra) # 80202f2a <argint>
    printf("hello world from proc %d, hart %d, arg %d\n", myproc()->pid, r_tp(), n);
    80202f62:	fffff097          	auipc	ra,0xfffff
    80202f66:	b12080e7          	jalr	-1262(ra) # 80201a74 <myproc>
    80202f6a:	8612                	mv	a2,tp
    80202f6c:	fec42683          	lw	a3,-20(s0)
    80202f70:	5d0c                	lw	a1,56(a0)
    80202f72:	00008517          	auipc	a0,0x8
    80202f76:	a0650513          	addi	a0,a0,-1530 # 8020a978 <digits+0x5f8>
    80202f7a:	ffffd097          	auipc	ra,0xffffd
    80202f7e:	212080e7          	jalr	530(ra) # 8020018c <printf>
}
    80202f82:	4501                	li	a0,0
    80202f84:	60e2                	ld	ra,24(sp)
    80202f86:	6442                	ld	s0,16(sp)
    80202f88:	6105                	addi	sp,sp,32
    80202f8a:	8082                	ret

0000000080202f8c <argaddr>:
{
    80202f8c:	1101                	addi	sp,sp,-32
    80202f8e:	ec06                	sd	ra,24(sp)
    80202f90:	e822                	sd	s0,16(sp)
    80202f92:	e426                	sd	s1,8(sp)
    80202f94:	1000                	addi	s0,sp,32
    80202f96:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80202f98:	00000097          	auipc	ra,0x0
    80202f9c:	e60080e7          	jalr	-416(ra) # 80202df8 <argraw>
    80202fa0:	e088                	sd	a0,0(s1)
}
    80202fa2:	4501                	li	a0,0
    80202fa4:	60e2                	ld	ra,24(sp)
    80202fa6:	6442                	ld	s0,16(sp)
    80202fa8:	64a2                	ld	s1,8(sp)
    80202faa:	6105                	addi	sp,sp,32
    80202fac:	8082                	ret

0000000080202fae <argstr>:
{
    80202fae:	1101                	addi	sp,sp,-32
    80202fb0:	ec06                	sd	ra,24(sp)
    80202fb2:	e822                	sd	s0,16(sp)
    80202fb4:	e426                	sd	s1,8(sp)
    80202fb6:	e04a                	sd	s2,0(sp)
    80202fb8:	1000                	addi	s0,sp,32
    80202fba:	84ae                	mv	s1,a1
    80202fbc:	8932                	mv	s2,a2
  *ip = argraw(n);
    80202fbe:	00000097          	auipc	ra,0x0
    80202fc2:	e3a080e7          	jalr	-454(ra) # 80202df8 <argraw>
  return fetchstr(addr, buf, max);
    80202fc6:	864a                	mv	a2,s2
    80202fc8:	85a6                	mv	a1,s1
    80202fca:	00000097          	auipc	ra,0x0
    80202fce:	f30080e7          	jalr	-208(ra) # 80202efa <fetchstr>
}
    80202fd2:	60e2                	ld	ra,24(sp)
    80202fd4:	6442                	ld	s0,16(sp)
    80202fd6:	64a2                	ld	s1,8(sp)
    80202fd8:	6902                	ld	s2,0(sp)
    80202fda:	6105                	addi	sp,sp,32
    80202fdc:	8082                	ret

0000000080202fde <syscall>:
{
    80202fde:	7179                	addi	sp,sp,-48
    80202fe0:	f406                	sd	ra,40(sp)
    80202fe2:	f022                	sd	s0,32(sp)
    80202fe4:	ec26                	sd	s1,24(sp)
    80202fe6:	e84a                	sd	s2,16(sp)
    80202fe8:	e44e                	sd	s3,8(sp)
    80202fea:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80202fec:	fffff097          	auipc	ra,0xfffff
    80202ff0:	a88080e7          	jalr	-1400(ra) # 80201a74 <myproc>
    80202ff4:	84aa                	mv	s1,a0
  num = p->trapframe->a7;
    80202ff6:	06053903          	ld	s2,96(a0)
    80202ffa:	0a893783          	ld	a5,168(s2)
    80202ffe:	0007899b          	sext.w	s3,a5
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    80203002:	37fd                	addiw	a5,a5,-1
    80203004:	20100713          	li	a4,513
    80203008:	04f76863          	bltu	a4,a5,80203058 <syscall+0x7a>
    8020300c:	00399713          	slli	a4,s3,0x3
    80203010:	00009797          	auipc	a5,0x9
    80203014:	c1878793          	addi	a5,a5,-1000 # 8020bc28 <syscalls>
    80203018:	97ba                	add	a5,a5,a4
    8020301a:	639c                	ld	a5,0(a5)
    8020301c:	cf95                	beqz	a5,80203058 <syscall+0x7a>
    p->trapframe->a0 = syscalls[num]();
    8020301e:	9782                	jalr	a5
    80203020:	06a93823          	sd	a0,112(s2)
    if ((p->tmask & (1 << num)) != 0) {
    80203024:	1704a783          	lw	a5,368(s1)
    80203028:	4137d7bb          	sraw	a5,a5,s3
    8020302c:	8b85                	andi	a5,a5,1
    8020302e:	c7a1                	beqz	a5,80203076 <syscall+0x98>
      printf("pid %d: %s -> %d\n", p->pid, sysnames[num], p->trapframe->a0);
    80203030:	70b8                	ld	a4,96(s1)
    80203032:	098e                	slli	s3,s3,0x3
    80203034:	0000a797          	auipc	a5,0xa
    80203038:	c0c78793          	addi	a5,a5,-1012 # 8020cc40 <sysnames>
    8020303c:	99be                	add	s3,s3,a5
    8020303e:	7b34                	ld	a3,112(a4)
    80203040:	0009b603          	ld	a2,0(s3)
    80203044:	5c8c                	lw	a1,56(s1)
    80203046:	00008517          	auipc	a0,0x8
    8020304a:	96250513          	addi	a0,a0,-1694 # 8020a9a8 <digits+0x628>
    8020304e:	ffffd097          	auipc	ra,0xffffd
    80203052:	13e080e7          	jalr	318(ra) # 8020018c <printf>
    80203056:	a005                	j	80203076 <syscall+0x98>
    printf("pid %d %s: unknown sys call %d\n",
    80203058:	86ce                	mv	a3,s3
    8020305a:	16048613          	addi	a2,s1,352
    8020305e:	5c8c                	lw	a1,56(s1)
    80203060:	00008517          	auipc	a0,0x8
    80203064:	96050513          	addi	a0,a0,-1696 # 8020a9c0 <digits+0x640>
    80203068:	ffffd097          	auipc	ra,0xffffd
    8020306c:	124080e7          	jalr	292(ra) # 8020018c <printf>
    p->trapframe->a0 = -1;
    80203070:	70bc                	ld	a5,96(s1)
    80203072:	577d                	li	a4,-1
    80203074:	fbb8                	sd	a4,112(a5)
}
    80203076:	70a2                	ld	ra,40(sp)
    80203078:	7402                	ld	s0,32(sp)
    8020307a:	64e2                	ld	s1,24(sp)
    8020307c:	6942                	ld	s2,16(sp)
    8020307e:	69a2                	ld	s3,8(sp)
    80203080:	6145                	addi	sp,sp,48
    80203082:	8082                	ret

0000000080203084 <sys_exec>:
#include "include/sbi.h"
extern int exec(char *path, char **argv);

uint64
sys_exec(void)
{
    80203084:	da010113          	addi	sp,sp,-608
    80203088:	24113c23          	sd	ra,600(sp)
    8020308c:	24813823          	sd	s0,592(sp)
    80203090:	24913423          	sd	s1,584(sp)
    80203094:	25213023          	sd	s2,576(sp)
    80203098:	23313c23          	sd	s3,568(sp)
    8020309c:	23413823          	sd	s4,560(sp)
    802030a0:	23513423          	sd	s5,552(sp)
    802030a4:	23613023          	sd	s6,544(sp)
    802030a8:	1480                	addi	s0,sp,608
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    802030aa:	10400613          	li	a2,260
    802030ae:	eb840593          	addi	a1,s0,-328
    802030b2:	4501                	li	a0,0
    802030b4:	00000097          	auipc	ra,0x0
    802030b8:	efa080e7          	jalr	-262(ra) # 80202fae <argstr>
    return -1;
    802030bc:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    802030be:	0c054a63          	bltz	a0,80203192 <sys_exec+0x10e>
    802030c2:	db040593          	addi	a1,s0,-592
    802030c6:	4505                	li	a0,1
    802030c8:	00000097          	auipc	ra,0x0
    802030cc:	ec4080e7          	jalr	-316(ra) # 80202f8c <argaddr>
    802030d0:	0c054163          	bltz	a0,80203192 <sys_exec+0x10e>
  }
  memset(argv, 0, sizeof(argv));
    802030d4:	10000613          	li	a2,256
    802030d8:	4581                	li	a1,0
    802030da:	db840993          	addi	s3,s0,-584
    802030de:	854e                	mv	a0,s3
    802030e0:	ffffd097          	auipc	ra,0xffffd
    802030e4:	684080e7          	jalr	1668(ra) # 80200764 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    802030e8:	84ce                	mv	s1,s3
  memset(argv, 0, sizeof(argv));
    802030ea:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802030ec:	da840a13          	addi	s4,s0,-600
    if(i >= NELEM(argv)){
    802030f0:	02000a93          	li	s5,32
    802030f4:	00090b1b          	sext.w	s6,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802030f8:	00391513          	slli	a0,s2,0x3
    802030fc:	85d2                	mv	a1,s4
    802030fe:	db043783          	ld	a5,-592(s0)
    80203102:	953e                	add	a0,a0,a5
    80203104:	00000097          	auipc	ra,0x0
    80203108:	da6080e7          	jalr	-602(ra) # 80202eaa <fetchaddr>
    8020310c:	02054a63          	bltz	a0,80203140 <sys_exec+0xbc>
      goto bad;
    }
    if(uarg == 0){
    80203110:	da843783          	ld	a5,-600(s0)
    80203114:	c3b9                	beqz	a5,8020315a <sys_exec+0xd6>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    80203116:	ffffd097          	auipc	ra,0xffffd
    8020311a:	446080e7          	jalr	1094(ra) # 8020055c <kalloc>
    8020311e:	85aa                	mv	a1,a0
    80203120:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    80203124:	cd11                	beqz	a0,80203140 <sys_exec+0xbc>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80203126:	6605                	lui	a2,0x1
    80203128:	da843503          	ld	a0,-600(s0)
    8020312c:	00000097          	auipc	ra,0x0
    80203130:	dce080e7          	jalr	-562(ra) # 80202efa <fetchstr>
    80203134:	00054663          	bltz	a0,80203140 <sys_exec+0xbc>
    if(i >= NELEM(argv)){
    80203138:	0905                	addi	s2,s2,1
    8020313a:	09a1                	addi	s3,s3,8
    8020313c:	fb591ce3          	bne	s2,s5,802030f4 <sys_exec+0x70>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203140:	10048913          	addi	s2,s1,256
    80203144:	6088                	ld	a0,0(s1)
    80203146:	c529                	beqz	a0,80203190 <sys_exec+0x10c>
    kfree(argv[i]);
    80203148:	ffffd097          	auipc	ra,0xffffd
    8020314c:	2fc080e7          	jalr	764(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203150:	04a1                	addi	s1,s1,8
    80203152:	ff2499e3          	bne	s1,s2,80203144 <sys_exec+0xc0>
  return -1;
    80203156:	597d                	li	s2,-1
    80203158:	a82d                	j	80203192 <sys_exec+0x10e>
      argv[i] = 0;
    8020315a:	0b0e                	slli	s6,s6,0x3
    8020315c:	fc040793          	addi	a5,s0,-64
    80203160:	9b3e                	add	s6,s6,a5
    80203162:	de0b3c23          	sd	zero,-520(s6) # df8 <_entry-0x801ff208>
  int ret = exec(path, argv);
    80203166:	db840593          	addi	a1,s0,-584
    8020316a:	eb840513          	addi	a0,s0,-328
    8020316e:	00001097          	auipc	ra,0x1
    80203172:	15a080e7          	jalr	346(ra) # 802042c8 <exec>
    80203176:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203178:	10048993          	addi	s3,s1,256
    8020317c:	6088                	ld	a0,0(s1)
    8020317e:	c911                	beqz	a0,80203192 <sys_exec+0x10e>
    kfree(argv[i]);
    80203180:	ffffd097          	auipc	ra,0xffffd
    80203184:	2c4080e7          	jalr	708(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203188:	04a1                	addi	s1,s1,8
    8020318a:	ff3499e3          	bne	s1,s3,8020317c <sys_exec+0xf8>
    8020318e:	a011                	j	80203192 <sys_exec+0x10e>
  return -1;
    80203190:	597d                	li	s2,-1
}
    80203192:	854a                	mv	a0,s2
    80203194:	25813083          	ld	ra,600(sp)
    80203198:	25013403          	ld	s0,592(sp)
    8020319c:	24813483          	ld	s1,584(sp)
    802031a0:	24013903          	ld	s2,576(sp)
    802031a4:	23813983          	ld	s3,568(sp)
    802031a8:	23013a03          	ld	s4,560(sp)
    802031ac:	22813a83          	ld	s5,552(sp)
    802031b0:	22013b03          	ld	s6,544(sp)
    802031b4:	26010113          	addi	sp,sp,608
    802031b8:	8082                	ret

00000000802031ba <sys_exit>:

uint64
sys_exit(void)
{
    802031ba:	1101                	addi	sp,sp,-32
    802031bc:	ec06                	sd	ra,24(sp)
    802031be:	e822                	sd	s0,16(sp)
    802031c0:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    802031c2:	fec40593          	addi	a1,s0,-20
    802031c6:	4501                	li	a0,0
    802031c8:	00000097          	auipc	ra,0x0
    802031cc:	d62080e7          	jalr	-670(ra) # 80202f2a <argint>
    return -1;
    802031d0:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    802031d2:	00054963          	bltz	a0,802031e4 <sys_exit+0x2a>
  exit(n);
    802031d6:	fec42503          	lw	a0,-20(s0)
    802031da:	fffff097          	auipc	ra,0xfffff
    802031de:	fd6080e7          	jalr	-42(ra) # 802021b0 <exit>
  return 0;  // not reached
    802031e2:	4781                	li	a5,0
}
    802031e4:	853e                	mv	a0,a5
    802031e6:	60e2                	ld	ra,24(sp)
    802031e8:	6442                	ld	s0,16(sp)
    802031ea:	6105                	addi	sp,sp,32
    802031ec:	8082                	ret

00000000802031ee <sys_getpid>:

uint64
sys_getpid(void)
{
    802031ee:	1141                	addi	sp,sp,-16
    802031f0:	e406                	sd	ra,8(sp)
    802031f2:	e022                	sd	s0,0(sp)
    802031f4:	0800                	addi	s0,sp,16
  return myproc()->pid;
    802031f6:	fffff097          	auipc	ra,0xfffff
    802031fa:	87e080e7          	jalr	-1922(ra) # 80201a74 <myproc>
}
    802031fe:	5d08                	lw	a0,56(a0)
    80203200:	60a2                	ld	ra,8(sp)
    80203202:	6402                	ld	s0,0(sp)
    80203204:	0141                	addi	sp,sp,16
    80203206:	8082                	ret

0000000080203208 <sys_fork>:

uint64
sys_fork(void)
{
    80203208:	1141                	addi	sp,sp,-16
    8020320a:	e406                	sd	ra,8(sp)
    8020320c:	e022                	sd	s0,0(sp)
    8020320e:	0800                	addi	s0,sp,16
  return fork();
    80203210:	fffff097          	auipc	ra,0xfffff
    80203214:	c66080e7          	jalr	-922(ra) # 80201e76 <fork>
}
    80203218:	60a2                	ld	ra,8(sp)
    8020321a:	6402                	ld	s0,0(sp)
    8020321c:	0141                	addi	sp,sp,16
    8020321e:	8082                	ret

0000000080203220 <sys_wait>:

uint64
sys_wait(void)
{
    80203220:	1101                	addi	sp,sp,-32
    80203222:	ec06                	sd	ra,24(sp)
    80203224:	e822                	sd	s0,16(sp)
    80203226:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    80203228:	fe840593          	addi	a1,s0,-24
    8020322c:	4501                	li	a0,0
    8020322e:	00000097          	auipc	ra,0x0
    80203232:	d5e080e7          	jalr	-674(ra) # 80202f8c <argaddr>
    80203236:	87aa                	mv	a5,a0
    return -1;
    80203238:	557d                	li	a0,-1
  if(argaddr(0, &p) < 0)
    8020323a:	0007c863          	bltz	a5,8020324a <sys_wait+0x2a>
  return wait(p);
    8020323e:	fe843503          	ld	a0,-24(s0)
    80203242:	fffff097          	auipc	ra,0xfffff
    80203246:	112080e7          	jalr	274(ra) # 80202354 <wait>
}
    8020324a:	60e2                	ld	ra,24(sp)
    8020324c:	6442                	ld	s0,16(sp)
    8020324e:	6105                	addi	sp,sp,32
    80203250:	8082                	ret

0000000080203252 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    80203252:	7179                	addi	sp,sp,-48
    80203254:	f406                	sd	ra,40(sp)
    80203256:	f022                	sd	s0,32(sp)
    80203258:	ec26                	sd	s1,24(sp)
    8020325a:	1800                	addi	s0,sp,48
  int addr;
  int n;

  if(argint(0, &n) < 0)
    8020325c:	fdc40593          	addi	a1,s0,-36
    80203260:	4501                	li	a0,0
    80203262:	00000097          	auipc	ra,0x0
    80203266:	cc8080e7          	jalr	-824(ra) # 80202f2a <argint>
    8020326a:	87aa                	mv	a5,a0
    return -1;
    8020326c:	557d                	li	a0,-1
  if(argint(0, &n) < 0)
    8020326e:	0207c063          	bltz	a5,8020328e <sys_sbrk+0x3c>
  addr = myproc()->sz;
    80203272:	fffff097          	auipc	ra,0xfffff
    80203276:	802080e7          	jalr	-2046(ra) # 80201a74 <myproc>
    8020327a:	4524                	lw	s1,72(a0)
  if(growproc(n) < 0)
    8020327c:	fdc42503          	lw	a0,-36(s0)
    80203280:	fffff097          	auipc	ra,0xfffff
    80203284:	b7e080e7          	jalr	-1154(ra) # 80201dfe <growproc>
    80203288:	00054863          	bltz	a0,80203298 <sys_sbrk+0x46>
    return -1;
  return addr;
    8020328c:	8526                	mv	a0,s1
}
    8020328e:	70a2                	ld	ra,40(sp)
    80203290:	7402                	ld	s0,32(sp)
    80203292:	64e2                	ld	s1,24(sp)
    80203294:	6145                	addi	sp,sp,48
    80203296:	8082                	ret
    return -1;
    80203298:	557d                	li	a0,-1
    8020329a:	bfd5                	j	8020328e <sys_sbrk+0x3c>

000000008020329c <sys_sleep>:

uint64
sys_sleep(void)
{
    8020329c:	7139                	addi	sp,sp,-64
    8020329e:	fc06                	sd	ra,56(sp)
    802032a0:	f822                	sd	s0,48(sp)
    802032a2:	f426                	sd	s1,40(sp)
    802032a4:	f04a                	sd	s2,32(sp)
    802032a6:	ec4e                	sd	s3,24(sp)
    802032a8:	0080                	addi	s0,sp,64
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    802032aa:	fcc40593          	addi	a1,s0,-52
    802032ae:	4501                	li	a0,0
    802032b0:	00000097          	auipc	ra,0x0
    802032b4:	c7a080e7          	jalr	-902(ra) # 80202f2a <argint>
    return -1;
    802032b8:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    802032ba:	06054763          	bltz	a0,80203328 <sys_sleep+0x8c>
  acquire(&tickslock);
    802032be:	0000b517          	auipc	a0,0xb
    802032c2:	9ea53503          	ld	a0,-1558(a0) # 8020dca8 <_GLOBAL_OFFSET_TABLE_+0x38>
    802032c6:	ffffd097          	auipc	ra,0xffffd
    802032ca:	402080e7          	jalr	1026(ra) # 802006c8 <acquire>
  ticks0 = ticks;
    802032ce:	0000b797          	auipc	a5,0xb
    802032d2:	9f27b783          	ld	a5,-1550(a5) # 8020dcc0 <_GLOBAL_OFFSET_TABLE_+0x50>
    802032d6:	0007a903          	lw	s2,0(a5)
  while(ticks - ticks0 < n){
    802032da:	fcc42783          	lw	a5,-52(s0)
    802032de:	cf85                	beqz	a5,80203316 <sys_sleep+0x7a>
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
    802032e0:	0000b997          	auipc	s3,0xb
    802032e4:	9c89b983          	ld	s3,-1592(s3) # 8020dca8 <_GLOBAL_OFFSET_TABLE_+0x38>
    802032e8:	0000b497          	auipc	s1,0xb
    802032ec:	9d84b483          	ld	s1,-1576(s1) # 8020dcc0 <_GLOBAL_OFFSET_TABLE_+0x50>
    if(myproc()->killed){
    802032f0:	ffffe097          	auipc	ra,0xffffe
    802032f4:	784080e7          	jalr	1924(ra) # 80201a74 <myproc>
    802032f8:	591c                	lw	a5,48(a0)
    802032fa:	ef9d                	bnez	a5,80203338 <sys_sleep+0x9c>
    sleep(&ticks, &tickslock);
    802032fc:	85ce                	mv	a1,s3
    802032fe:	8526                	mv	a0,s1
    80203300:	fffff097          	auipc	ra,0xfffff
    80203304:	fd6080e7          	jalr	-42(ra) # 802022d6 <sleep>
  while(ticks - ticks0 < n){
    80203308:	409c                	lw	a5,0(s1)
    8020330a:	412787bb          	subw	a5,a5,s2
    8020330e:	fcc42703          	lw	a4,-52(s0)
    80203312:	fce7efe3          	bltu	a5,a4,802032f0 <sys_sleep+0x54>
  }
  release(&tickslock);
    80203316:	0000b517          	auipc	a0,0xb
    8020331a:	99253503          	ld	a0,-1646(a0) # 8020dca8 <_GLOBAL_OFFSET_TABLE_+0x38>
    8020331e:	ffffd097          	auipc	ra,0xffffd
    80203322:	3fe080e7          	jalr	1022(ra) # 8020071c <release>
  return 0;
    80203326:	4781                	li	a5,0
}
    80203328:	853e                	mv	a0,a5
    8020332a:	70e2                	ld	ra,56(sp)
    8020332c:	7442                	ld	s0,48(sp)
    8020332e:	74a2                	ld	s1,40(sp)
    80203330:	7902                	ld	s2,32(sp)
    80203332:	69e2                	ld	s3,24(sp)
    80203334:	6121                	addi	sp,sp,64
    80203336:	8082                	ret
      release(&tickslock);
    80203338:	0000b517          	auipc	a0,0xb
    8020333c:	97053503          	ld	a0,-1680(a0) # 8020dca8 <_GLOBAL_OFFSET_TABLE_+0x38>
    80203340:	ffffd097          	auipc	ra,0xffffd
    80203344:	3dc080e7          	jalr	988(ra) # 8020071c <release>
      return -1;
    80203348:	57fd                	li	a5,-1
    8020334a:	bff9                	j	80203328 <sys_sleep+0x8c>

000000008020334c <sys_kill>:

uint64
sys_kill(void)
{
    8020334c:	1101                	addi	sp,sp,-32
    8020334e:	ec06                	sd	ra,24(sp)
    80203350:	e822                	sd	s0,16(sp)
    80203352:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    80203354:	fec40593          	addi	a1,s0,-20
    80203358:	4501                	li	a0,0
    8020335a:	00000097          	auipc	ra,0x0
    8020335e:	bd0080e7          	jalr	-1072(ra) # 80202f2a <argint>
    80203362:	87aa                	mv	a5,a0
    return -1;
    80203364:	557d                	li	a0,-1
  if(argint(0, &pid) < 0)
    80203366:	0007c863          	bltz	a5,80203376 <sys_kill+0x2a>
  return kill(pid);
    8020336a:	fec42503          	lw	a0,-20(s0)
    8020336e:	fffff097          	auipc	ra,0xfffff
    80203372:	154080e7          	jalr	340(ra) # 802024c2 <kill>
}
    80203376:	60e2                	ld	ra,24(sp)
    80203378:	6442                	ld	s0,16(sp)
    8020337a:	6105                	addi	sp,sp,32
    8020337c:	8082                	ret

000000008020337e <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    8020337e:	1101                	addi	sp,sp,-32
    80203380:	ec06                	sd	ra,24(sp)
    80203382:	e822                	sd	s0,16(sp)
    80203384:	e426                	sd	s1,8(sp)
    80203386:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    80203388:	0000b517          	auipc	a0,0xb
    8020338c:	92053503          	ld	a0,-1760(a0) # 8020dca8 <_GLOBAL_OFFSET_TABLE_+0x38>
    80203390:	ffffd097          	auipc	ra,0xffffd
    80203394:	338080e7          	jalr	824(ra) # 802006c8 <acquire>
  xticks = ticks;
    80203398:	0000b797          	auipc	a5,0xb
    8020339c:	9287b783          	ld	a5,-1752(a5) # 8020dcc0 <_GLOBAL_OFFSET_TABLE_+0x50>
    802033a0:	4384                	lw	s1,0(a5)
  release(&tickslock);
    802033a2:	0000b517          	auipc	a0,0xb
    802033a6:	90653503          	ld	a0,-1786(a0) # 8020dca8 <_GLOBAL_OFFSET_TABLE_+0x38>
    802033aa:	ffffd097          	auipc	ra,0xffffd
    802033ae:	372080e7          	jalr	882(ra) # 8020071c <release>
  return xticks;
}
    802033b2:	02049513          	slli	a0,s1,0x20
    802033b6:	9101                	srli	a0,a0,0x20
    802033b8:	60e2                	ld	ra,24(sp)
    802033ba:	6442                	ld	s0,16(sp)
    802033bc:	64a2                	ld	s1,8(sp)
    802033be:	6105                	addi	sp,sp,32
    802033c0:	8082                	ret

00000000802033c2 <sys_trace>:
    
uint64
sys_trace(void)
{
    802033c2:	1101                	addi	sp,sp,-32
    802033c4:	ec06                	sd	ra,24(sp)
    802033c6:	e822                	sd	s0,16(sp)
    802033c8:	1000                	addi	s0,sp,32
  int mask;
  if(argint(0, &mask) < 0) {
    802033ca:	fec40593          	addi	a1,s0,-20
    802033ce:	4501                	li	a0,0
    802033d0:	00000097          	auipc	ra,0x0
    802033d4:	b5a080e7          	jalr	-1190(ra) # 80202f2a <argint>
    return -1;
    802033d8:	57fd                	li	a5,-1
  if(argint(0, &mask) < 0) {
    802033da:	00054b63          	bltz	a0,802033f0 <sys_trace+0x2e>
  }
  myproc()->tmask = mask;
    802033de:	ffffe097          	auipc	ra,0xffffe
    802033e2:	696080e7          	jalr	1686(ra) # 80201a74 <myproc>
    802033e6:	fec42783          	lw	a5,-20(s0)
    802033ea:	16f52823          	sw	a5,368(a0)
  return 0;
    802033ee:	4781                	li	a5,0
}
    802033f0:	853e                	mv	a0,a5
    802033f2:	60e2                	ld	ra,24(sp)
    802033f4:	6442                	ld	s0,16(sp)
    802033f6:	6105                	addi	sp,sp,32
    802033f8:	8082                	ret

00000000802033fa <sys_clone>:


// added by lmq for SYS_clone
uint64
sys_clone(void)
{
    802033fa:	7179                	addi	sp,sp,-48
    802033fc:	f406                	sd	ra,40(sp)
    802033fe:	f022                	sd	s0,32(sp)
    80203400:	1800                	addi	s0,sp,48
  int flags,stack,ptid,tls,ctid;
  if(argint(0, &flags) < 0) {
    80203402:	fec40593          	addi	a1,s0,-20
    80203406:	4501                	li	a0,0
    80203408:	00000097          	auipc	ra,0x0
    8020340c:	b22080e7          	jalr	-1246(ra) # 80202f2a <argint>
    return -1;
    80203410:	57fd                	li	a5,-1
  if(argint(0, &flags) < 0) {
    80203412:	06054963          	bltz	a0,80203484 <sys_clone+0x8a>
  }
  if(argint(1, &stack) < 0) {
    80203416:	fe840593          	addi	a1,s0,-24
    8020341a:	4505                	li	a0,1
    8020341c:	00000097          	auipc	ra,0x0
    80203420:	b0e080e7          	jalr	-1266(ra) # 80202f2a <argint>
    return -1;
    80203424:	57fd                	li	a5,-1
  if(argint(1, &stack) < 0) {
    80203426:	04054f63          	bltz	a0,80203484 <sys_clone+0x8a>
  }
  if(argint(2, &ptid) < 0) {
    8020342a:	fe440593          	addi	a1,s0,-28
    8020342e:	4509                	li	a0,2
    80203430:	00000097          	auipc	ra,0x0
    80203434:	afa080e7          	jalr	-1286(ra) # 80202f2a <argint>
    return -1;
    80203438:	57fd                	li	a5,-1
  if(argint(2, &ptid) < 0) {
    8020343a:	04054563          	bltz	a0,80203484 <sys_clone+0x8a>
  }
  if(argint(3, &tls) < 0) {
    8020343e:	fe040593          	addi	a1,s0,-32
    80203442:	450d                	li	a0,3
    80203444:	00000097          	auipc	ra,0x0
    80203448:	ae6080e7          	jalr	-1306(ra) # 80202f2a <argint>
    return -1;
    8020344c:	57fd                	li	a5,-1
  if(argint(3, &tls) < 0) {
    8020344e:	02054b63          	bltz	a0,80203484 <sys_clone+0x8a>
  }
  if(argint(4, &ctid) < 0) {
    80203452:	fdc40593          	addi	a1,s0,-36
    80203456:	4511                	li	a0,4
    80203458:	00000097          	auipc	ra,0x0
    8020345c:	ad2080e7          	jalr	-1326(ra) # 80202f2a <argint>
    return -1;
    80203460:	57fd                	li	a5,-1
  if(argint(4, &ctid) < 0) {
    80203462:	02054163          	bltz	a0,80203484 <sys_clone+0x8a>
  }

  int new_pid=clone(flags,stack,ptid,tls,ctid);
    80203466:	fdc42703          	lw	a4,-36(s0)
    8020346a:	fe042683          	lw	a3,-32(s0)
    8020346e:	fe442603          	lw	a2,-28(s0)
    80203472:	fe842583          	lw	a1,-24(s0)
    80203476:	fec42503          	lw	a0,-20(s0)
    8020347a:	fffff097          	auipc	ra,0xfffff
    8020347e:	206080e7          	jalr	518(ra) # 80202680 <clone>
  return new_pid;
    80203482:	87aa                	mv	a5,a0
}
    80203484:	853e                	mv	a0,a5
    80203486:	70a2                	ld	ra,40(sp)
    80203488:	7402                	ld	s0,32(sp)
    8020348a:	6145                	addi	sp,sp,48
    8020348c:	8082                	ret

000000008020348e <sys_brk>:

// sys_brk lzq
// 将数据段addr 修改为 pos ， 成功则返回0
// Linux brk(0) return 0, but different in this work this will return the now addr
uint64
sys_brk(void){
    8020348e:	1101                	addi	sp,sp,-32
    80203490:	ec06                	sd	ra,24(sp)
    80203492:	e822                	sd	s0,16(sp)
    80203494:	1000                	addi	s0,sp,32
    int addr, pos;
    if(argint(0, &pos) <0 )
    80203496:	fec40593          	addi	a1,s0,-20
    8020349a:	4501                	li	a0,0
    8020349c:	00000097          	auipc	ra,0x0
    802034a0:	a8e080e7          	jalr	-1394(ra) # 80202f2a <argint>
    802034a4:	04054063          	bltz	a0,802034e4 <sys_brk+0x56>
        return -1;
    addr = myproc()->sz;
    802034a8:	ffffe097          	auipc	ra,0xffffe
    802034ac:	5cc080e7          	jalr	1484(ra) # 80201a74 <myproc>
    802034b0:	4528                	lw	a0,72(a0)
    if(pos == 0) return addr;//the diff with Linux brk(0)
    802034b2:	fec42783          	lw	a5,-20(s0)
    802034b6:	e789                	bnez	a5,802034c0 <sys_brk+0x32>
    if(growproc(pos - addr) < 0)
        panic("growproc error");
    return 0;
}
    802034b8:	60e2                	ld	ra,24(sp)
    802034ba:	6442                	ld	s0,16(sp)
    802034bc:	6105                	addi	sp,sp,32
    802034be:	8082                	ret
    if(growproc(pos - addr) < 0)
    802034c0:	40a7853b          	subw	a0,a5,a0
    802034c4:	fffff097          	auipc	ra,0xfffff
    802034c8:	93a080e7          	jalr	-1734(ra) # 80201dfe <growproc>
    802034cc:	87aa                	mv	a5,a0
    return 0;
    802034ce:	4501                	li	a0,0
    if(growproc(pos - addr) < 0)
    802034d0:	fe07d4e3          	bgez	a5,802034b8 <sys_brk+0x2a>
        panic("growproc error");
    802034d4:	00007517          	auipc	a0,0x7
    802034d8:	6a450513          	addi	a0,a0,1700 # 8020ab78 <digits+0x7f8>
    802034dc:	ffffd097          	auipc	ra,0xffffd
    802034e0:	c66080e7          	jalr	-922(ra) # 80200142 <panic>
        return -1;
    802034e4:	557d                	li	a0,-1
    802034e6:	bfc9                	j	802034b8 <sys_brk+0x2a>

00000000802034e8 <sys_mmap>:

uint64
sys_mmap(void){
    802034e8:	1141                	addi	sp,sp,-16
    802034ea:	e422                	sd	s0,8(sp)
    802034ec:	0800                	addi	s0,sp,16
    if (mappages(myproc()->pagetable, len, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0) {
        kfree(mem);
        return 0;
    }
    return addr;
}
    802034ee:	4501                	li	a0,0
    802034f0:	6422                	ld	s0,8(sp)
    802034f2:	0141                	addi	sp,sp,16
    802034f4:	8082                	ret

00000000802034f6 <sys_wait4>:
//}

// added by lmq for SYS_wait4
uint64
sys_wait4(void)
{
    802034f6:	1101                	addi	sp,sp,-32
    802034f8:	ec06                	sd	ra,24(sp)
    802034fa:	e822                	sd	s0,16(sp)
    802034fc:	1000                	addi	s0,sp,32
  int cpid;             // child pid which current pid is waiting for
  uint64 addr;          // addr of wstatus
  argint(0,&cpid);
    802034fe:	fec40593          	addi	a1,s0,-20
    80203502:	4501                	li	a0,0
    80203504:	00000097          	auipc	ra,0x0
    80203508:	a26080e7          	jalr	-1498(ra) # 80202f2a <argint>
  argaddr(1, &addr);
    8020350c:	fe040593          	addi	a1,s0,-32
    80203510:	4505                	li	a0,1
    80203512:	00000097          	auipc	ra,0x0
    80203516:	a7a080e7          	jalr	-1414(ra) # 80202f8c <argaddr>
  return waitpid(cpid,addr,0);
    8020351a:	4601                	li	a2,0
    8020351c:	fe043583          	ld	a1,-32(s0)
    80203520:	fec42503          	lw	a0,-20(s0)
    80203524:	fffff097          	auipc	ra,0xfffff
    80203528:	174080e7          	jalr	372(ra) # 80202698 <waitpid>
}
    8020352c:	60e2                	ld	ra,24(sp)
    8020352e:	6442                	ld	s0,16(sp)
    80203530:	6105                	addi	sp,sp,32
    80203532:	8082                	ret

0000000080203534 <sys_sched_yield>:

// added by lmq for SYS_sched_yield
uint64
sys_sched_yield(void)
{
    80203534:	1141                	addi	sp,sp,-16
    80203536:	e406                	sd	ra,8(sp)
    80203538:	e022                	sd	s0,0(sp)
    8020353a:	0800                	addi	s0,sp,16
  yield();
    8020353c:	fffff097          	auipc	ra,0xfffff
    80203540:	d5e080e7          	jalr	-674(ra) # 8020229a <yield>
  return 0;
}
    80203544:	4501                	li	a0,0
    80203546:	60a2                	ld	ra,8(sp)
    80203548:	6402                	ld	s0,0(sp)
    8020354a:	0141                	addi	sp,sp,16
    8020354c:	8082                	ret

000000008020354e <sys_getppid>:

// added by lmq for SYS_getppid
uint64 
sys_getppid(void)
{
    8020354e:	1141                	addi	sp,sp,-16
    80203550:	e406                	sd	ra,8(sp)
    80203552:	e022                	sd	s0,0(sp)
    80203554:	0800                	addi	s0,sp,16
  return myproc()->parent->pid;
    80203556:	ffffe097          	auipc	ra,0xffffe
    8020355a:	51e080e7          	jalr	1310(ra) # 80201a74 <myproc>
    8020355e:	711c                	ld	a5,32(a0)
}
    80203560:	5f88                	lw	a0,56(a5)
    80203562:	60a2                	ld	ra,8(sp)
    80203564:	6402                	ld	s0,0(sp)
    80203566:	0141                	addi	sp,sp,16
    80203568:	8082                	ret

000000008020356a <sys_execve>:

// added by lmq for SYS_execve
uint64
sys_execve(void)
{
    8020356a:	da010113          	addi	sp,sp,-608
    8020356e:	24113c23          	sd	ra,600(sp)
    80203572:	24813823          	sd	s0,592(sp)
    80203576:	24913423          	sd	s1,584(sp)
    8020357a:	25213023          	sd	s2,576(sp)
    8020357e:	23313c23          	sd	s3,568(sp)
    80203582:	23413823          	sd	s4,560(sp)
    80203586:	23513423          	sd	s5,552(sp)
    8020358a:	23613023          	sd	s6,544(sp)
    8020358e:	1480                	addi	s0,sp,608
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    80203590:	10400613          	li	a2,260
    80203594:	eb840593          	addi	a1,s0,-328
    80203598:	4501                	li	a0,0
    8020359a:	00000097          	auipc	ra,0x0
    8020359e:	a14080e7          	jalr	-1516(ra) # 80202fae <argstr>
    return -1;
    802035a2:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    802035a4:	0c054a63          	bltz	a0,80203678 <sys_execve+0x10e>
    802035a8:	db040593          	addi	a1,s0,-592
    802035ac:	4505                	li	a0,1
    802035ae:	00000097          	auipc	ra,0x0
    802035b2:	9de080e7          	jalr	-1570(ra) # 80202f8c <argaddr>
    802035b6:	0c054163          	bltz	a0,80203678 <sys_execve+0x10e>
  }
  memset(argv, 0, sizeof(argv));
    802035ba:	10000613          	li	a2,256
    802035be:	4581                	li	a1,0
    802035c0:	db840993          	addi	s3,s0,-584
    802035c4:	854e                	mv	a0,s3
    802035c6:	ffffd097          	auipc	ra,0xffffd
    802035ca:	19e080e7          	jalr	414(ra) # 80200764 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    802035ce:	84ce                	mv	s1,s3
  memset(argv, 0, sizeof(argv));
    802035d0:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802035d2:	da840a13          	addi	s4,s0,-600
    if(i >= NELEM(argv)){
    802035d6:	02000a93          	li	s5,32
    802035da:	00090b1b          	sext.w	s6,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802035de:	00391513          	slli	a0,s2,0x3
    802035e2:	85d2                	mv	a1,s4
    802035e4:	db043783          	ld	a5,-592(s0)
    802035e8:	953e                	add	a0,a0,a5
    802035ea:	00000097          	auipc	ra,0x0
    802035ee:	8c0080e7          	jalr	-1856(ra) # 80202eaa <fetchaddr>
    802035f2:	02054a63          	bltz	a0,80203626 <sys_execve+0xbc>
      goto bad;
    }
    if(uarg == 0){
    802035f6:	da843783          	ld	a5,-600(s0)
    802035fa:	c3b9                	beqz	a5,80203640 <sys_execve+0xd6>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    802035fc:	ffffd097          	auipc	ra,0xffffd
    80203600:	f60080e7          	jalr	-160(ra) # 8020055c <kalloc>
    80203604:	85aa                	mv	a1,a0
    80203606:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    8020360a:	cd11                	beqz	a0,80203626 <sys_execve+0xbc>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    8020360c:	6605                	lui	a2,0x1
    8020360e:	da843503          	ld	a0,-600(s0)
    80203612:	00000097          	auipc	ra,0x0
    80203616:	8e8080e7          	jalr	-1816(ra) # 80202efa <fetchstr>
    8020361a:	00054663          	bltz	a0,80203626 <sys_execve+0xbc>
    if(i >= NELEM(argv)){
    8020361e:	0905                	addi	s2,s2,1
    80203620:	09a1                	addi	s3,s3,8
    80203622:	fb591ce3          	bne	s2,s5,802035da <sys_execve+0x70>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203626:	10048913          	addi	s2,s1,256
    8020362a:	6088                	ld	a0,0(s1)
    8020362c:	c529                	beqz	a0,80203676 <sys_execve+0x10c>
    kfree(argv[i]);
    8020362e:	ffffd097          	auipc	ra,0xffffd
    80203632:	e16080e7          	jalr	-490(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203636:	04a1                	addi	s1,s1,8
    80203638:	ff2499e3          	bne	s1,s2,8020362a <sys_execve+0xc0>
  return -1;
    8020363c:	597d                	li	s2,-1
    8020363e:	a82d                	j	80203678 <sys_execve+0x10e>
      argv[i] = 0;
    80203640:	0b0e                	slli	s6,s6,0x3
    80203642:	fc040793          	addi	a5,s0,-64
    80203646:	9b3e                	add	s6,s6,a5
    80203648:	de0b3c23          	sd	zero,-520(s6)
  int ret = exec(path, argv);
    8020364c:	db840593          	addi	a1,s0,-584
    80203650:	eb840513          	addi	a0,s0,-328
    80203654:	00001097          	auipc	ra,0x1
    80203658:	c74080e7          	jalr	-908(ra) # 802042c8 <exec>
    8020365c:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020365e:	10048993          	addi	s3,s1,256
    80203662:	6088                	ld	a0,0(s1)
    80203664:	c911                	beqz	a0,80203678 <sys_execve+0x10e>
    kfree(argv[i]);
    80203666:	ffffd097          	auipc	ra,0xffffd
    8020366a:	dde080e7          	jalr	-546(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020366e:	04a1                	addi	s1,s1,8
    80203670:	ff3499e3          	bne	s1,s3,80203662 <sys_execve+0xf8>
    80203674:	a011                	j	80203678 <sys_execve+0x10e>
  return -1;
    80203676:	597d                	li	s2,-1

}
    80203678:	854a                	mv	a0,s2
    8020367a:	25813083          	ld	ra,600(sp)
    8020367e:	25013403          	ld	s0,592(sp)
    80203682:	24813483          	ld	s1,584(sp)
    80203686:	24013903          	ld	s2,576(sp)
    8020368a:	23813983          	ld	s3,568(sp)
    8020368e:	23013a03          	ld	s4,560(sp)
    80203692:	22813a83          	ld	s5,552(sp)
    80203696:	22013b03          	ld	s6,544(sp)
    8020369a:	26010113          	addi	sp,sp,608
    8020369e:	8082                	ret

00000000802036a0 <sys_shutdown>:

uint64 
sys_shutdown(){
    802036a0:	1141                	addi	sp,sp,-16
    802036a2:	e422                	sd	s0,8(sp)
    802036a4:	0800                	addi	s0,sp,16
	SBI_CALL_0(SBI_SHUTDOWN);
    802036a6:	4501                	li	a0,0
    802036a8:	4581                	li	a1,0
    802036aa:	4601                	li	a2,0
    802036ac:	4681                	li	a3,0
    802036ae:	48a1                	li	a7,8
    802036b0:	00000073          	ecall
    sbi_shutdown();
    return 0;
}
    802036b4:	4501                	li	a0,0
    802036b6:	6422                	ld	s0,8(sp)
    802036b8:	0141                	addi	sp,sp,16
    802036ba:	8082                	ret

00000000802036bc <sys_uname>:

uint64 
sys_uname()
{
    802036bc:	1141                	addi	sp,sp,-16
    802036be:	e422                	sd	s0,8(sp)
    802036c0:	0800                	addi	s0,sp,16
  return 0;
}
    802036c2:	4501                	li	a0,0
    802036c4:	6422                	ld	s0,8(sp)
    802036c6:	0141                	addi	sp,sp,16
    802036c8:	8082                	ret

00000000802036ca <sys_gettimeofday>:

uint64 
sys_gettimeofday()
{
    802036ca:	1141                	addi	sp,sp,-16
    802036cc:	e422                	sd	s0,8(sp)
    802036ce:	0800                	addi	s0,sp,16
  return 0;
    802036d0:	4501                	li	a0,0
    802036d2:	6422                	ld	s0,8(sp)
    802036d4:	0141                	addi	sp,sp,16
    802036d6:	8082                	ret

00000000802036d8 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    802036d8:	7139                	addi	sp,sp,-64
    802036da:	fc06                	sd	ra,56(sp)
    802036dc:	f822                	sd	s0,48(sp)
    802036de:	f426                	sd	s1,40(sp)
    802036e0:	f04a                	sd	s2,32(sp)
    802036e2:	ec4e                	sd	s3,24(sp)
    802036e4:	e852                	sd	s4,16(sp)
    802036e6:	e456                	sd	s5,8(sp)
    802036e8:	0080                	addi	s0,sp,64
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    802036ea:	00007597          	auipc	a1,0x7
    802036ee:	49e58593          	addi	a1,a1,1182 # 8020ab88 <digits+0x808>
    802036f2:	00017517          	auipc	a0,0x17
    802036f6:	3fe50513          	addi	a0,a0,1022 # 8021aaf0 <bcache>
    802036fa:	ffffd097          	auipc	ra,0xffffd
    802036fe:	f8a080e7          	jalr	-118(ra) # 80200684 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    80203702:	0001b797          	auipc	a5,0x1b
    80203706:	3ee78793          	addi	a5,a5,1006 # 8021eaf0 <bcache+0x4000>
    8020370a:	0001c717          	auipc	a4,0x1c
    8020370e:	a4e70713          	addi	a4,a4,-1458 # 8021f158 <bcache+0x4668>
    80203712:	6ae7b823          	sd	a4,1712(a5)
  bcache.head.next = &bcache.head;
    80203716:	6ae7bc23          	sd	a4,1720(a5)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    8020371a:	00017497          	auipc	s1,0x17
    8020371e:	3ee48493          	addi	s1,s1,1006 # 8021ab08 <bcache+0x18>
    b->refcnt = 0;
    b->sectorno = ~0;
    80203722:	5a7d                	li	s4,-1
    b->dev = ~0;
    b->next = bcache.head.next;
    80203724:	893e                	mv	s2,a5
    b->prev = &bcache.head;
    80203726:	89ba                	mv	s3,a4
    initsleeplock(&b->lock, "buffer");
    80203728:	00007a97          	auipc	s5,0x7
    8020372c:	468a8a93          	addi	s5,s5,1128 # 8020ab90 <digits+0x810>
    b->refcnt = 0;
    80203730:	0404a023          	sw	zero,64(s1)
    b->sectorno = ~0;
    80203734:	0144a623          	sw	s4,12(s1)
    b->dev = ~0;
    80203738:	0144a423          	sw	s4,8(s1)
    b->next = bcache.head.next;
    8020373c:	6b893783          	ld	a5,1720(s2)
    80203740:	e8bc                	sd	a5,80(s1)
    b->prev = &bcache.head;
    80203742:	0534b423          	sd	s3,72(s1)
    initsleeplock(&b->lock, "buffer");
    80203746:	85d6                	mv	a1,s5
    80203748:	01048513          	addi	a0,s1,16
    8020374c:	00000097          	auipc	ra,0x0
    80203750:	26e080e7          	jalr	622(ra) # 802039ba <initsleeplock>
    bcache.head.next->prev = b;
    80203754:	6b893783          	ld	a5,1720(s2)
    80203758:	e7a4                	sd	s1,72(a5)
    bcache.head.next = b;
    8020375a:	6a993c23          	sd	s1,1720(s2)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    8020375e:	25848493          	addi	s1,s1,600
    80203762:	fd3497e3          	bne	s1,s3,80203730 <binit+0x58>
  }
  #ifdef DEBUG
  printf("binit\n");
  #endif
}
    80203766:	70e2                	ld	ra,56(sp)
    80203768:	7442                	ld	s0,48(sp)
    8020376a:	74a2                	ld	s1,40(sp)
    8020376c:	7902                	ld	s2,32(sp)
    8020376e:	69e2                	ld	s3,24(sp)
    80203770:	6a42                	ld	s4,16(sp)
    80203772:	6aa2                	ld	s5,8(sp)
    80203774:	6121                	addi	sp,sp,64
    80203776:	8082                	ret

0000000080203778 <bread>:
  panic("bget: no buffers");
}

// Return a locked buf with the contents of the indicated block.
struct buf* 
bread(uint dev, uint sectorno) {
    80203778:	7179                	addi	sp,sp,-48
    8020377a:	f406                	sd	ra,40(sp)
    8020377c:	f022                	sd	s0,32(sp)
    8020377e:	ec26                	sd	s1,24(sp)
    80203780:	e84a                	sd	s2,16(sp)
    80203782:	e44e                	sd	s3,8(sp)
    80203784:	1800                	addi	s0,sp,48
    80203786:	89aa                	mv	s3,a0
    80203788:	892e                	mv	s2,a1
  acquire(&bcache.lock);
    8020378a:	00017517          	auipc	a0,0x17
    8020378e:	36650513          	addi	a0,a0,870 # 8021aaf0 <bcache>
    80203792:	ffffd097          	auipc	ra,0xffffd
    80203796:	f36080e7          	jalr	-202(ra) # 802006c8 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    8020379a:	0001c497          	auipc	s1,0x1c
    8020379e:	a0e4b483          	ld	s1,-1522(s1) # 8021f1a8 <bcache+0x46b8>
    802037a2:	0001c797          	auipc	a5,0x1c
    802037a6:	9b678793          	addi	a5,a5,-1610 # 8021f158 <bcache+0x4668>
    802037aa:	02f48f63          	beq	s1,a5,802037e8 <bread+0x70>
    802037ae:	873e                	mv	a4,a5
    802037b0:	a021                	j	802037b8 <bread+0x40>
    802037b2:	68a4                	ld	s1,80(s1)
    802037b4:	02e48a63          	beq	s1,a4,802037e8 <bread+0x70>
    if(b->dev == dev && b->sectorno == sectorno){
    802037b8:	449c                	lw	a5,8(s1)
    802037ba:	ff379ce3          	bne	a5,s3,802037b2 <bread+0x3a>
    802037be:	44dc                	lw	a5,12(s1)
    802037c0:	ff2799e3          	bne	a5,s2,802037b2 <bread+0x3a>
      b->refcnt++;
    802037c4:	40bc                	lw	a5,64(s1)
    802037c6:	2785                	addiw	a5,a5,1
    802037c8:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    802037ca:	00017517          	auipc	a0,0x17
    802037ce:	32650513          	addi	a0,a0,806 # 8021aaf0 <bcache>
    802037d2:	ffffd097          	auipc	ra,0xffffd
    802037d6:	f4a080e7          	jalr	-182(ra) # 8020071c <release>
      acquiresleep(&b->lock);
    802037da:	01048513          	addi	a0,s1,16
    802037de:	00000097          	auipc	ra,0x0
    802037e2:	216080e7          	jalr	534(ra) # 802039f4 <acquiresleep>
      return b;
    802037e6:	a8b9                	j	80203844 <bread+0xcc>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    802037e8:	0001c497          	auipc	s1,0x1c
    802037ec:	9b84b483          	ld	s1,-1608(s1) # 8021f1a0 <bcache+0x46b0>
    802037f0:	0001c797          	auipc	a5,0x1c
    802037f4:	96878793          	addi	a5,a5,-1688 # 8021f158 <bcache+0x4668>
    802037f8:	00f48863          	beq	s1,a5,80203808 <bread+0x90>
    802037fc:	873e                	mv	a4,a5
    if(b->refcnt == 0) {
    802037fe:	40bc                	lw	a5,64(s1)
    80203800:	cf81                	beqz	a5,80203818 <bread+0xa0>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80203802:	64a4                	ld	s1,72(s1)
    80203804:	fee49de3          	bne	s1,a4,802037fe <bread+0x86>
  panic("bget: no buffers");
    80203808:	00007517          	auipc	a0,0x7
    8020380c:	39050513          	addi	a0,a0,912 # 8020ab98 <digits+0x818>
    80203810:	ffffd097          	auipc	ra,0xffffd
    80203814:	932080e7          	jalr	-1742(ra) # 80200142 <panic>
      b->dev = dev;
    80203818:	0134a423          	sw	s3,8(s1)
      b->sectorno = sectorno;
    8020381c:	0124a623          	sw	s2,12(s1)
      b->valid = 0;
    80203820:	0004a023          	sw	zero,0(s1)
      b->refcnt = 1;
    80203824:	4785                	li	a5,1
    80203826:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    80203828:	00017517          	auipc	a0,0x17
    8020382c:	2c850513          	addi	a0,a0,712 # 8021aaf0 <bcache>
    80203830:	ffffd097          	auipc	ra,0xffffd
    80203834:	eec080e7          	jalr	-276(ra) # 8020071c <release>
      acquiresleep(&b->lock);
    80203838:	01048513          	addi	a0,s1,16
    8020383c:	00000097          	auipc	ra,0x0
    80203840:	1b8080e7          	jalr	440(ra) # 802039f4 <acquiresleep>
  struct buf *b;

  b = bget(dev, sectorno);
  if (!b->valid) {
    80203844:	409c                	lw	a5,0(s1)
    80203846:	cb89                	beqz	a5,80203858 <bread+0xe0>
    disk_read(b);
    b->valid = 1;
  }

  return b;
}
    80203848:	8526                	mv	a0,s1
    8020384a:	70a2                	ld	ra,40(sp)
    8020384c:	7402                	ld	s0,32(sp)
    8020384e:	64e2                	ld	s1,24(sp)
    80203850:	6942                	ld	s2,16(sp)
    80203852:	69a2                	ld	s3,8(sp)
    80203854:	6145                	addi	sp,sp,48
    80203856:	8082                	ret
    disk_read(b);
    80203858:	8526                	mv	a0,s1
    8020385a:	00002097          	auipc	ra,0x2
    8020385e:	388080e7          	jalr	904(ra) # 80205be2 <disk_read>
    b->valid = 1;
    80203862:	4785                	li	a5,1
    80203864:	c09c                	sw	a5,0(s1)
  return b;
    80203866:	b7cd                	j	80203848 <bread+0xd0>

0000000080203868 <bwrite>:

// Write b's contents to disk.  Must be locked.
void 
bwrite(struct buf *b) {
    80203868:	1101                	addi	sp,sp,-32
    8020386a:	ec06                	sd	ra,24(sp)
    8020386c:	e822                	sd	s0,16(sp)
    8020386e:	e426                	sd	s1,8(sp)
    80203870:	1000                	addi	s0,sp,32
    80203872:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203874:	0541                	addi	a0,a0,16
    80203876:	00000097          	auipc	ra,0x0
    8020387a:	218080e7          	jalr	536(ra) # 80203a8e <holdingsleep>
    8020387e:	c919                	beqz	a0,80203894 <bwrite+0x2c>
    panic("bwrite");
  disk_write(b);
    80203880:	8526                	mv	a0,s1
    80203882:	00002097          	auipc	ra,0x2
    80203886:	37a080e7          	jalr	890(ra) # 80205bfc <disk_write>
}
    8020388a:	60e2                	ld	ra,24(sp)
    8020388c:	6442                	ld	s0,16(sp)
    8020388e:	64a2                	ld	s1,8(sp)
    80203890:	6105                	addi	sp,sp,32
    80203892:	8082                	ret
    panic("bwrite");
    80203894:	00007517          	auipc	a0,0x7
    80203898:	31c50513          	addi	a0,a0,796 # 8020abb0 <digits+0x830>
    8020389c:	ffffd097          	auipc	ra,0xffffd
    802038a0:	8a6080e7          	jalr	-1882(ra) # 80200142 <panic>

00000000802038a4 <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    802038a4:	1101                	addi	sp,sp,-32
    802038a6:	ec06                	sd	ra,24(sp)
    802038a8:	e822                	sd	s0,16(sp)
    802038aa:	e426                	sd	s1,8(sp)
    802038ac:	e04a                	sd	s2,0(sp)
    802038ae:	1000                	addi	s0,sp,32
    802038b0:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    802038b2:	01050913          	addi	s2,a0,16
    802038b6:	854a                	mv	a0,s2
    802038b8:	00000097          	auipc	ra,0x0
    802038bc:	1d6080e7          	jalr	470(ra) # 80203a8e <holdingsleep>
    802038c0:	c92d                	beqz	a0,80203932 <brelse+0x8e>
    panic("brelse");

  releasesleep(&b->lock);
    802038c2:	854a                	mv	a0,s2
    802038c4:	00000097          	auipc	ra,0x0
    802038c8:	186080e7          	jalr	390(ra) # 80203a4a <releasesleep>

  acquire(&bcache.lock);
    802038cc:	00017517          	auipc	a0,0x17
    802038d0:	22450513          	addi	a0,a0,548 # 8021aaf0 <bcache>
    802038d4:	ffffd097          	auipc	ra,0xffffd
    802038d8:	df4080e7          	jalr	-524(ra) # 802006c8 <acquire>
  b->refcnt--;
    802038dc:	40bc                	lw	a5,64(s1)
    802038de:	37fd                	addiw	a5,a5,-1
    802038e0:	0007871b          	sext.w	a4,a5
    802038e4:	c0bc                	sw	a5,64(s1)
  if (b->refcnt == 0) {
    802038e6:	eb05                	bnez	a4,80203916 <brelse+0x72>
    // no one is waiting for it.
    b->next->prev = b->prev;
    802038e8:	68bc                	ld	a5,80(s1)
    802038ea:	64b8                	ld	a4,72(s1)
    802038ec:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    802038ee:	64bc                	ld	a5,72(s1)
    802038f0:	68b8                	ld	a4,80(s1)
    802038f2:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    802038f4:	0001b797          	auipc	a5,0x1b
    802038f8:	1fc78793          	addi	a5,a5,508 # 8021eaf0 <bcache+0x4000>
    802038fc:	6b87b703          	ld	a4,1720(a5)
    80203900:	e8b8                	sd	a4,80(s1)
    b->prev = &bcache.head;
    80203902:	0001c717          	auipc	a4,0x1c
    80203906:	85670713          	addi	a4,a4,-1962 # 8021f158 <bcache+0x4668>
    8020390a:	e4b8                	sd	a4,72(s1)
    bcache.head.next->prev = b;
    8020390c:	6b87b703          	ld	a4,1720(a5)
    80203910:	e724                	sd	s1,72(a4)
    bcache.head.next = b;
    80203912:	6a97bc23          	sd	s1,1720(a5)
  }
  
  release(&bcache.lock);
    80203916:	00017517          	auipc	a0,0x17
    8020391a:	1da50513          	addi	a0,a0,474 # 8021aaf0 <bcache>
    8020391e:	ffffd097          	auipc	ra,0xffffd
    80203922:	dfe080e7          	jalr	-514(ra) # 8020071c <release>
}
    80203926:	60e2                	ld	ra,24(sp)
    80203928:	6442                	ld	s0,16(sp)
    8020392a:	64a2                	ld	s1,8(sp)
    8020392c:	6902                	ld	s2,0(sp)
    8020392e:	6105                	addi	sp,sp,32
    80203930:	8082                	ret
    panic("brelse");
    80203932:	00007517          	auipc	a0,0x7
    80203936:	28650513          	addi	a0,a0,646 # 8020abb8 <digits+0x838>
    8020393a:	ffffd097          	auipc	ra,0xffffd
    8020393e:	808080e7          	jalr	-2040(ra) # 80200142 <panic>

0000000080203942 <bpin>:

void
bpin(struct buf *b) {
    80203942:	1101                	addi	sp,sp,-32
    80203944:	ec06                	sd	ra,24(sp)
    80203946:	e822                	sd	s0,16(sp)
    80203948:	e426                	sd	s1,8(sp)
    8020394a:	1000                	addi	s0,sp,32
    8020394c:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    8020394e:	00017517          	auipc	a0,0x17
    80203952:	1a250513          	addi	a0,a0,418 # 8021aaf0 <bcache>
    80203956:	ffffd097          	auipc	ra,0xffffd
    8020395a:	d72080e7          	jalr	-654(ra) # 802006c8 <acquire>
  b->refcnt++;
    8020395e:	40bc                	lw	a5,64(s1)
    80203960:	2785                	addiw	a5,a5,1
    80203962:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203964:	00017517          	auipc	a0,0x17
    80203968:	18c50513          	addi	a0,a0,396 # 8021aaf0 <bcache>
    8020396c:	ffffd097          	auipc	ra,0xffffd
    80203970:	db0080e7          	jalr	-592(ra) # 8020071c <release>
}
    80203974:	60e2                	ld	ra,24(sp)
    80203976:	6442                	ld	s0,16(sp)
    80203978:	64a2                	ld	s1,8(sp)
    8020397a:	6105                	addi	sp,sp,32
    8020397c:	8082                	ret

000000008020397e <bunpin>:

void
bunpin(struct buf *b) {
    8020397e:	1101                	addi	sp,sp,-32
    80203980:	ec06                	sd	ra,24(sp)
    80203982:	e822                	sd	s0,16(sp)
    80203984:	e426                	sd	s1,8(sp)
    80203986:	1000                	addi	s0,sp,32
    80203988:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    8020398a:	00017517          	auipc	a0,0x17
    8020398e:	16650513          	addi	a0,a0,358 # 8021aaf0 <bcache>
    80203992:	ffffd097          	auipc	ra,0xffffd
    80203996:	d36080e7          	jalr	-714(ra) # 802006c8 <acquire>
  b->refcnt--;
    8020399a:	40bc                	lw	a5,64(s1)
    8020399c:	37fd                	addiw	a5,a5,-1
    8020399e:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    802039a0:	00017517          	auipc	a0,0x17
    802039a4:	15050513          	addi	a0,a0,336 # 8021aaf0 <bcache>
    802039a8:	ffffd097          	auipc	ra,0xffffd
    802039ac:	d74080e7          	jalr	-652(ra) # 8020071c <release>
}
    802039b0:	60e2                	ld	ra,24(sp)
    802039b2:	6442                	ld	s0,16(sp)
    802039b4:	64a2                	ld	s1,8(sp)
    802039b6:	6105                	addi	sp,sp,32
    802039b8:	8082                	ret

00000000802039ba <initsleeplock>:
#include "include/proc.h"
#include "include/sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    802039ba:	1101                	addi	sp,sp,-32
    802039bc:	ec06                	sd	ra,24(sp)
    802039be:	e822                	sd	s0,16(sp)
    802039c0:	e426                	sd	s1,8(sp)
    802039c2:	e04a                	sd	s2,0(sp)
    802039c4:	1000                	addi	s0,sp,32
    802039c6:	84aa                	mv	s1,a0
    802039c8:	892e                	mv	s2,a1
  initlock(&lk->lk, "sleep lock");
    802039ca:	00007597          	auipc	a1,0x7
    802039ce:	1f658593          	addi	a1,a1,502 # 8020abc0 <digits+0x840>
    802039d2:	0521                	addi	a0,a0,8
    802039d4:	ffffd097          	auipc	ra,0xffffd
    802039d8:	cb0080e7          	jalr	-848(ra) # 80200684 <initlock>
  lk->name = name;
    802039dc:	0324b023          	sd	s2,32(s1)
  lk->locked = 0;
    802039e0:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    802039e4:	0204a423          	sw	zero,40(s1)
}
    802039e8:	60e2                	ld	ra,24(sp)
    802039ea:	6442                	ld	s0,16(sp)
    802039ec:	64a2                	ld	s1,8(sp)
    802039ee:	6902                	ld	s2,0(sp)
    802039f0:	6105                	addi	sp,sp,32
    802039f2:	8082                	ret

00000000802039f4 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    802039f4:	1101                	addi	sp,sp,-32
    802039f6:	ec06                	sd	ra,24(sp)
    802039f8:	e822                	sd	s0,16(sp)
    802039fa:	e426                	sd	s1,8(sp)
    802039fc:	e04a                	sd	s2,0(sp)
    802039fe:	1000                	addi	s0,sp,32
    80203a00:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203a02:	00850913          	addi	s2,a0,8
    80203a06:	854a                	mv	a0,s2
    80203a08:	ffffd097          	auipc	ra,0xffffd
    80203a0c:	cc0080e7          	jalr	-832(ra) # 802006c8 <acquire>
  while (lk->locked) {
    80203a10:	409c                	lw	a5,0(s1)
    80203a12:	cb89                	beqz	a5,80203a24 <acquiresleep+0x30>
    sleep(lk, &lk->lk);
    80203a14:	85ca                	mv	a1,s2
    80203a16:	8526                	mv	a0,s1
    80203a18:	fffff097          	auipc	ra,0xfffff
    80203a1c:	8be080e7          	jalr	-1858(ra) # 802022d6 <sleep>
  while (lk->locked) {
    80203a20:	409c                	lw	a5,0(s1)
    80203a22:	fbed                	bnez	a5,80203a14 <acquiresleep+0x20>
  }
  lk->locked = 1;
    80203a24:	4785                	li	a5,1
    80203a26:	c09c                	sw	a5,0(s1)
  lk->pid = myproc()->pid;
    80203a28:	ffffe097          	auipc	ra,0xffffe
    80203a2c:	04c080e7          	jalr	76(ra) # 80201a74 <myproc>
    80203a30:	5d1c                	lw	a5,56(a0)
    80203a32:	d49c                	sw	a5,40(s1)
  release(&lk->lk);
    80203a34:	854a                	mv	a0,s2
    80203a36:	ffffd097          	auipc	ra,0xffffd
    80203a3a:	ce6080e7          	jalr	-794(ra) # 8020071c <release>
}
    80203a3e:	60e2                	ld	ra,24(sp)
    80203a40:	6442                	ld	s0,16(sp)
    80203a42:	64a2                	ld	s1,8(sp)
    80203a44:	6902                	ld	s2,0(sp)
    80203a46:	6105                	addi	sp,sp,32
    80203a48:	8082                	ret

0000000080203a4a <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80203a4a:	1101                	addi	sp,sp,-32
    80203a4c:	ec06                	sd	ra,24(sp)
    80203a4e:	e822                	sd	s0,16(sp)
    80203a50:	e426                	sd	s1,8(sp)
    80203a52:	e04a                	sd	s2,0(sp)
    80203a54:	1000                	addi	s0,sp,32
    80203a56:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203a58:	00850913          	addi	s2,a0,8
    80203a5c:	854a                	mv	a0,s2
    80203a5e:	ffffd097          	auipc	ra,0xffffd
    80203a62:	c6a080e7          	jalr	-918(ra) # 802006c8 <acquire>
  lk->locked = 0;
    80203a66:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203a6a:	0204a423          	sw	zero,40(s1)
  wakeup(lk);
    80203a6e:	8526                	mv	a0,s1
    80203a70:	fffff097          	auipc	ra,0xfffff
    80203a74:	9e8080e7          	jalr	-1560(ra) # 80202458 <wakeup>
  release(&lk->lk);
    80203a78:	854a                	mv	a0,s2
    80203a7a:	ffffd097          	auipc	ra,0xffffd
    80203a7e:	ca2080e7          	jalr	-862(ra) # 8020071c <release>
}
    80203a82:	60e2                	ld	ra,24(sp)
    80203a84:	6442                	ld	s0,16(sp)
    80203a86:	64a2                	ld	s1,8(sp)
    80203a88:	6902                	ld	s2,0(sp)
    80203a8a:	6105                	addi	sp,sp,32
    80203a8c:	8082                	ret

0000000080203a8e <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80203a8e:	7179                	addi	sp,sp,-48
    80203a90:	f406                	sd	ra,40(sp)
    80203a92:	f022                	sd	s0,32(sp)
    80203a94:	ec26                	sd	s1,24(sp)
    80203a96:	e84a                	sd	s2,16(sp)
    80203a98:	e44e                	sd	s3,8(sp)
    80203a9a:	1800                	addi	s0,sp,48
    80203a9c:	84aa                	mv	s1,a0
  int r;
  
  acquire(&lk->lk);
    80203a9e:	00850913          	addi	s2,a0,8
    80203aa2:	854a                	mv	a0,s2
    80203aa4:	ffffd097          	auipc	ra,0xffffd
    80203aa8:	c24080e7          	jalr	-988(ra) # 802006c8 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80203aac:	409c                	lw	a5,0(s1)
    80203aae:	ef99                	bnez	a5,80203acc <holdingsleep+0x3e>
    80203ab0:	4481                	li	s1,0
  release(&lk->lk);
    80203ab2:	854a                	mv	a0,s2
    80203ab4:	ffffd097          	auipc	ra,0xffffd
    80203ab8:	c68080e7          	jalr	-920(ra) # 8020071c <release>
  return r;
}
    80203abc:	8526                	mv	a0,s1
    80203abe:	70a2                	ld	ra,40(sp)
    80203ac0:	7402                	ld	s0,32(sp)
    80203ac2:	64e2                	ld	s1,24(sp)
    80203ac4:	6942                	ld	s2,16(sp)
    80203ac6:	69a2                	ld	s3,8(sp)
    80203ac8:	6145                	addi	sp,sp,48
    80203aca:	8082                	ret
  r = lk->locked && (lk->pid == myproc()->pid);
    80203acc:	0284a983          	lw	s3,40(s1)
    80203ad0:	ffffe097          	auipc	ra,0xffffe
    80203ad4:	fa4080e7          	jalr	-92(ra) # 80201a74 <myproc>
    80203ad8:	5d04                	lw	s1,56(a0)
    80203ada:	413484b3          	sub	s1,s1,s3
    80203ade:	0014b493          	seqz	s1,s1
    80203ae2:	bfc1                	j	80203ab2 <holdingsleep+0x24>

0000000080203ae4 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80203ae4:	1101                	addi	sp,sp,-32
    80203ae6:	ec06                	sd	ra,24(sp)
    80203ae8:	e822                	sd	s0,16(sp)
    80203aea:	e426                	sd	s1,8(sp)
    80203aec:	e04a                	sd	s2,0(sp)
    80203aee:	1000                	addi	s0,sp,32
  initlock(&ftable.lock, "ftable");
    80203af0:	00007597          	auipc	a1,0x7
    80203af4:	0e058593          	addi	a1,a1,224 # 8020abd0 <digits+0x850>
    80203af8:	0001c517          	auipc	a0,0x1c
    80203afc:	95850513          	addi	a0,a0,-1704 # 8021f450 <ftable>
    80203b00:	ffffd097          	auipc	ra,0xffffd
    80203b04:	b84080e7          	jalr	-1148(ra) # 80200684 <initlock>
  struct file *f;
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203b08:	0001c497          	auipc	s1,0x1c
    80203b0c:	96048493          	addi	s1,s1,-1696 # 8021f468 <ftable+0x18>
    80203b10:	0001d917          	auipc	s2,0x1d
    80203b14:	8f890913          	addi	s2,s2,-1800 # 80220408 <tickslock>
    memset(f, 0, sizeof(struct file));
    80203b18:	02800613          	li	a2,40
    80203b1c:	4581                	li	a1,0
    80203b1e:	8526                	mv	a0,s1
    80203b20:	ffffd097          	auipc	ra,0xffffd
    80203b24:	c44080e7          	jalr	-956(ra) # 80200764 <memset>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203b28:	02848493          	addi	s1,s1,40
    80203b2c:	ff2496e3          	bne	s1,s2,80203b18 <fileinit+0x34>
  }

  #ifdef DEBUG
  printf("fileinit\n");
  #endif
}
    80203b30:	60e2                	ld	ra,24(sp)
    80203b32:	6442                	ld	s0,16(sp)
    80203b34:	64a2                	ld	s1,8(sp)
    80203b36:	6902                	ld	s2,0(sp)
    80203b38:	6105                	addi	sp,sp,32
    80203b3a:	8082                	ret

0000000080203b3c <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80203b3c:	1101                	addi	sp,sp,-32
    80203b3e:	ec06                	sd	ra,24(sp)
    80203b40:	e822                	sd	s0,16(sp)
    80203b42:	e426                	sd	s1,8(sp)
    80203b44:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80203b46:	0001c517          	auipc	a0,0x1c
    80203b4a:	90a50513          	addi	a0,a0,-1782 # 8021f450 <ftable>
    80203b4e:	ffffd097          	auipc	ra,0xffffd
    80203b52:	b7a080e7          	jalr	-1158(ra) # 802006c8 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203b56:	0001c497          	auipc	s1,0x1c
    80203b5a:	91248493          	addi	s1,s1,-1774 # 8021f468 <ftable+0x18>
    80203b5e:	0001d717          	auipc	a4,0x1d
    80203b62:	8aa70713          	addi	a4,a4,-1878 # 80220408 <tickslock>
    if(f->ref == 0){
    80203b66:	40dc                	lw	a5,4(s1)
    80203b68:	cf99                	beqz	a5,80203b86 <filealloc+0x4a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203b6a:	02848493          	addi	s1,s1,40
    80203b6e:	fee49ce3          	bne	s1,a4,80203b66 <filealloc+0x2a>
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
    80203b72:	0001c517          	auipc	a0,0x1c
    80203b76:	8de50513          	addi	a0,a0,-1826 # 8021f450 <ftable>
    80203b7a:	ffffd097          	auipc	ra,0xffffd
    80203b7e:	ba2080e7          	jalr	-1118(ra) # 8020071c <release>
  return NULL;
    80203b82:	4481                	li	s1,0
    80203b84:	a819                	j	80203b9a <filealloc+0x5e>
      f->ref = 1;
    80203b86:	4785                	li	a5,1
    80203b88:	c0dc                	sw	a5,4(s1)
      release(&ftable.lock);
    80203b8a:	0001c517          	auipc	a0,0x1c
    80203b8e:	8c650513          	addi	a0,a0,-1850 # 8021f450 <ftable>
    80203b92:	ffffd097          	auipc	ra,0xffffd
    80203b96:	b8a080e7          	jalr	-1142(ra) # 8020071c <release>
}
    80203b9a:	8526                	mv	a0,s1
    80203b9c:	60e2                	ld	ra,24(sp)
    80203b9e:	6442                	ld	s0,16(sp)
    80203ba0:	64a2                	ld	s1,8(sp)
    80203ba2:	6105                	addi	sp,sp,32
    80203ba4:	8082                	ret

0000000080203ba6 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80203ba6:	1101                	addi	sp,sp,-32
    80203ba8:	ec06                	sd	ra,24(sp)
    80203baa:	e822                	sd	s0,16(sp)
    80203bac:	e426                	sd	s1,8(sp)
    80203bae:	1000                	addi	s0,sp,32
    80203bb0:	84aa                	mv	s1,a0
  acquire(&ftable.lock);
    80203bb2:	0001c517          	auipc	a0,0x1c
    80203bb6:	89e50513          	addi	a0,a0,-1890 # 8021f450 <ftable>
    80203bba:	ffffd097          	auipc	ra,0xffffd
    80203bbe:	b0e080e7          	jalr	-1266(ra) # 802006c8 <acquire>
  if(f->ref < 1)
    80203bc2:	40dc                	lw	a5,4(s1)
    80203bc4:	02f05263          	blez	a5,80203be8 <filedup+0x42>
    panic("filedup");
  f->ref++;
    80203bc8:	2785                	addiw	a5,a5,1
    80203bca:	c0dc                	sw	a5,4(s1)
  release(&ftable.lock);
    80203bcc:	0001c517          	auipc	a0,0x1c
    80203bd0:	88450513          	addi	a0,a0,-1916 # 8021f450 <ftable>
    80203bd4:	ffffd097          	auipc	ra,0xffffd
    80203bd8:	b48080e7          	jalr	-1208(ra) # 8020071c <release>
  return f;
}
    80203bdc:	8526                	mv	a0,s1
    80203bde:	60e2                	ld	ra,24(sp)
    80203be0:	6442                	ld	s0,16(sp)
    80203be2:	64a2                	ld	s1,8(sp)
    80203be4:	6105                	addi	sp,sp,32
    80203be6:	8082                	ret
    panic("filedup");
    80203be8:	00007517          	auipc	a0,0x7
    80203bec:	ff050513          	addi	a0,a0,-16 # 8020abd8 <digits+0x858>
    80203bf0:	ffffc097          	auipc	ra,0xffffc
    80203bf4:	552080e7          	jalr	1362(ra) # 80200142 <panic>

0000000080203bf8 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80203bf8:	7139                	addi	sp,sp,-64
    80203bfa:	fc06                	sd	ra,56(sp)
    80203bfc:	f822                	sd	s0,48(sp)
    80203bfe:	f426                	sd	s1,40(sp)
    80203c00:	f04a                	sd	s2,32(sp)
    80203c02:	ec4e                	sd	s3,24(sp)
    80203c04:	e852                	sd	s4,16(sp)
    80203c06:	e456                	sd	s5,8(sp)
    80203c08:	0080                	addi	s0,sp,64
    80203c0a:	84aa                	mv	s1,a0
  struct file ff;

  acquire(&ftable.lock);
    80203c0c:	0001c517          	auipc	a0,0x1c
    80203c10:	84450513          	addi	a0,a0,-1980 # 8021f450 <ftable>
    80203c14:	ffffd097          	auipc	ra,0xffffd
    80203c18:	ab4080e7          	jalr	-1356(ra) # 802006c8 <acquire>
  if(f->ref < 1)
    80203c1c:	40dc                	lw	a5,4(s1)
    80203c1e:	04f05863          	blez	a5,80203c6e <fileclose+0x76>
    panic("fileclose");
  if(--f->ref > 0){
    80203c22:	37fd                	addiw	a5,a5,-1
    80203c24:	0007871b          	sext.w	a4,a5
    80203c28:	c0dc                	sw	a5,4(s1)
    80203c2a:	04e04a63          	bgtz	a4,80203c7e <fileclose+0x86>
    release(&ftable.lock);
    return;
  }
  ff = *f;
    80203c2e:	0004a903          	lw	s2,0(s1)
    80203c32:	0094ca03          	lbu	s4,9(s1)
    80203c36:	0104b983          	ld	s3,16(s1)
    80203c3a:	0184ba83          	ld	s5,24(s1)
  f->ref = 0;
    80203c3e:	0004a223          	sw	zero,4(s1)
  f->type = FD_NONE;
    80203c42:	0004a023          	sw	zero,0(s1)
  release(&ftable.lock);
    80203c46:	0001c517          	auipc	a0,0x1c
    80203c4a:	80a50513          	addi	a0,a0,-2038 # 8021f450 <ftable>
    80203c4e:	ffffd097          	auipc	ra,0xffffd
    80203c52:	ace080e7          	jalr	-1330(ra) # 8020071c <release>

  if(ff.type == FD_PIPE){
    80203c56:	4785                	li	a5,1
    80203c58:	04f90463          	beq	s2,a5,80203ca0 <fileclose+0xa8>
    pipeclose(ff.pipe, ff.writable);
  } else if(ff.type == FD_ENTRY){
    80203c5c:	4789                	li	a5,2
    80203c5e:	02f91863          	bne	s2,a5,80203c8e <fileclose+0x96>
    eput(ff.ep);
    80203c62:	8556                	mv	a0,s5
    80203c64:	00003097          	auipc	ra,0x3
    80203c68:	182080e7          	jalr	386(ra) # 80206de6 <eput>
    80203c6c:	a00d                	j	80203c8e <fileclose+0x96>
    panic("fileclose");
    80203c6e:	00007517          	auipc	a0,0x7
    80203c72:	f7250513          	addi	a0,a0,-142 # 8020abe0 <digits+0x860>
    80203c76:	ffffc097          	auipc	ra,0xffffc
    80203c7a:	4cc080e7          	jalr	1228(ra) # 80200142 <panic>
    release(&ftable.lock);
    80203c7e:	0001b517          	auipc	a0,0x1b
    80203c82:	7d250513          	addi	a0,a0,2002 # 8021f450 <ftable>
    80203c86:	ffffd097          	auipc	ra,0xffffd
    80203c8a:	a96080e7          	jalr	-1386(ra) # 8020071c <release>
  } else if (ff.type == FD_DEVICE) {

  }
}
    80203c8e:	70e2                	ld	ra,56(sp)
    80203c90:	7442                	ld	s0,48(sp)
    80203c92:	74a2                	ld	s1,40(sp)
    80203c94:	7902                	ld	s2,32(sp)
    80203c96:	69e2                	ld	s3,24(sp)
    80203c98:	6a42                	ld	s4,16(sp)
    80203c9a:	6aa2                	ld	s5,8(sp)
    80203c9c:	6121                	addi	sp,sp,64
    80203c9e:	8082                	ret
    pipeclose(ff.pipe, ff.writable);
    80203ca0:	85d2                	mv	a1,s4
    80203ca2:	854e                	mv	a0,s3
    80203ca4:	00000097          	auipc	ra,0x0
    80203ca8:	3a2080e7          	jalr	930(ra) # 80204046 <pipeclose>
    80203cac:	b7cd                	j	80203c8e <fileclose+0x96>

0000000080203cae <filestat>:
int
filestat(struct file *f, uint64 addr)
{
  struct stat st;
  
  if(f->type == FD_ENTRY){
    80203cae:	4118                	lw	a4,0(a0)
    80203cb0:	4789                	li	a5,2
    80203cb2:	04f71e63          	bne	a4,a5,80203d0e <filestat+0x60>
{
    80203cb6:	7159                	addi	sp,sp,-112
    80203cb8:	f486                	sd	ra,104(sp)
    80203cba:	f0a2                	sd	s0,96(sp)
    80203cbc:	eca6                	sd	s1,88(sp)
    80203cbe:	e8ca                	sd	s2,80(sp)
    80203cc0:	e4ce                	sd	s3,72(sp)
    80203cc2:	1880                	addi	s0,sp,112
    80203cc4:	84aa                	mv	s1,a0
    80203cc6:	892e                	mv	s2,a1
    elock(f->ep);
    80203cc8:	6d08                	ld	a0,24(a0)
    80203cca:	00003097          	auipc	ra,0x3
    80203cce:	098080e7          	jalr	152(ra) # 80206d62 <elock>
    estat(f->ep, &st);
    80203cd2:	f9840993          	addi	s3,s0,-104
    80203cd6:	85ce                	mv	a1,s3
    80203cd8:	6c88                	ld	a0,24(s1)
    80203cda:	00003097          	auipc	ra,0x3
    80203cde:	244080e7          	jalr	580(ra) # 80206f1e <estat>
    eunlock(f->ep);
    80203ce2:	6c88                	ld	a0,24(s1)
    80203ce4:	00003097          	auipc	ra,0x3
    80203ce8:	0b4080e7          	jalr	180(ra) # 80206d98 <eunlock>
    // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203cec:	03800613          	li	a2,56
    80203cf0:	85ce                	mv	a1,s3
    80203cf2:	854a                	mv	a0,s2
    80203cf4:	ffffd097          	auipc	ra,0xffffd
    80203cf8:	6a4080e7          	jalr	1700(ra) # 80201398 <copyout2>
    80203cfc:	41f5551b          	sraiw	a0,a0,0x1f
      return -1;
    return 0;
  }
  return -1;
}
    80203d00:	70a6                	ld	ra,104(sp)
    80203d02:	7406                	ld	s0,96(sp)
    80203d04:	64e6                	ld	s1,88(sp)
    80203d06:	6946                	ld	s2,80(sp)
    80203d08:	69a6                	ld	s3,72(sp)
    80203d0a:	6165                	addi	sp,sp,112
    80203d0c:	8082                	ret
  return -1;
    80203d0e:	557d                	li	a0,-1
}
    80203d10:	8082                	ret

0000000080203d12 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80203d12:	7179                	addi	sp,sp,-48
    80203d14:	f406                	sd	ra,40(sp)
    80203d16:	f022                	sd	s0,32(sp)
    80203d18:	ec26                	sd	s1,24(sp)
    80203d1a:	e84a                	sd	s2,16(sp)
    80203d1c:	e44e                	sd	s3,8(sp)
    80203d1e:	1800                	addi	s0,sp,48
  int r = 0;

  if(f->readable == 0)
    80203d20:	00854783          	lbu	a5,8(a0)
    80203d24:	c3d5                	beqz	a5,80203dc8 <fileread+0xb6>
    80203d26:	84aa                	mv	s1,a0
    80203d28:	89ae                	mv	s3,a1
    80203d2a:	8932                	mv	s2,a2
    return -1;

  switch (f->type) {
    80203d2c:	411c                	lw	a5,0(a0)
    80203d2e:	4709                	li	a4,2
    80203d30:	06e78263          	beq	a5,a4,80203d94 <fileread+0x82>
    80203d34:	470d                	li	a4,3
    80203d36:	02e78b63          	beq	a5,a4,80203d6c <fileread+0x5a>
    80203d3a:	4705                	li	a4,1
    80203d3c:	00e78a63          	beq	a5,a4,80203d50 <fileread+0x3e>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
            f->off += r;
        eunlock(f->ep);
        break;
    default:
      panic("fileread");
    80203d40:	00007517          	auipc	a0,0x7
    80203d44:	eb050513          	addi	a0,a0,-336 # 8020abf0 <digits+0x870>
    80203d48:	ffffc097          	auipc	ra,0xffffc
    80203d4c:	3fa080e7          	jalr	1018(ra) # 80200142 <panic>
        r = piperead(f->pipe, addr, n);
    80203d50:	6908                	ld	a0,16(a0)
    80203d52:	00000097          	auipc	ra,0x0
    80203d56:	48c080e7          	jalr	1164(ra) # 802041de <piperead>
    80203d5a:	892a                	mv	s2,a0
  }

  return r;
}
    80203d5c:	854a                	mv	a0,s2
    80203d5e:	70a2                	ld	ra,40(sp)
    80203d60:	7402                	ld	s0,32(sp)
    80203d62:	64e2                	ld	s1,24(sp)
    80203d64:	6942                	ld	s2,16(sp)
    80203d66:	69a2                	ld	s3,8(sp)
    80203d68:	6145                	addi	sp,sp,48
    80203d6a:	8082                	ret
        if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80203d6c:	02451783          	lh	a5,36(a0)
    80203d70:	03079693          	slli	a3,a5,0x30
    80203d74:	92c1                	srli	a3,a3,0x30
    80203d76:	4725                	li	a4,9
    80203d78:	04d76a63          	bltu	a4,a3,80203dcc <fileread+0xba>
    80203d7c:	0792                	slli	a5,a5,0x4
    80203d7e:	0001b717          	auipc	a4,0x1b
    80203d82:	63270713          	addi	a4,a4,1586 # 8021f3b0 <devsw>
    80203d86:	97ba                	add	a5,a5,a4
    80203d88:	639c                	ld	a5,0(a5)
    80203d8a:	c3b9                	beqz	a5,80203dd0 <fileread+0xbe>
        r = devsw[f->major].read(1, addr, n);
    80203d8c:	4505                	li	a0,1
    80203d8e:	9782                	jalr	a5
    80203d90:	892a                	mv	s2,a0
        break;
    80203d92:	b7e9                	j	80203d5c <fileread+0x4a>
        elock(f->ep);
    80203d94:	6d08                	ld	a0,24(a0)
    80203d96:	00003097          	auipc	ra,0x3
    80203d9a:	fcc080e7          	jalr	-52(ra) # 80206d62 <elock>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
    80203d9e:	874a                	mv	a4,s2
    80203da0:	5094                	lw	a3,32(s1)
    80203da2:	864e                	mv	a2,s3
    80203da4:	4585                	li	a1,1
    80203da6:	6c88                	ld	a0,24(s1)
    80203da8:	00002097          	auipc	ra,0x2
    80203dac:	6d0080e7          	jalr	1744(ra) # 80206478 <eread>
    80203db0:	892a                	mv	s2,a0
    80203db2:	00a05563          	blez	a0,80203dbc <fileread+0xaa>
            f->off += r;
    80203db6:	509c                	lw	a5,32(s1)
    80203db8:	9fa9                	addw	a5,a5,a0
    80203dba:	d09c                	sw	a5,32(s1)
        eunlock(f->ep);
    80203dbc:	6c88                	ld	a0,24(s1)
    80203dbe:	00003097          	auipc	ra,0x3
    80203dc2:	fda080e7          	jalr	-38(ra) # 80206d98 <eunlock>
        break;
    80203dc6:	bf59                	j	80203d5c <fileread+0x4a>
    return -1;
    80203dc8:	597d                	li	s2,-1
    80203dca:	bf49                	j	80203d5c <fileread+0x4a>
          return -1;
    80203dcc:	597d                	li	s2,-1
    80203dce:	b779                	j	80203d5c <fileread+0x4a>
    80203dd0:	597d                	li	s2,-1
    80203dd2:	b769                	j	80203d5c <fileread+0x4a>

0000000080203dd4 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80203dd4:	7179                	addi	sp,sp,-48
    80203dd6:	f406                	sd	ra,40(sp)
    80203dd8:	f022                	sd	s0,32(sp)
    80203dda:	ec26                	sd	s1,24(sp)
    80203ddc:	e84a                	sd	s2,16(sp)
    80203dde:	e44e                	sd	s3,8(sp)
    80203de0:	e052                	sd	s4,0(sp)
    80203de2:	1800                	addi	s0,sp,48
  int ret = 0;

  if(f->writable == 0)
    80203de4:	00954783          	lbu	a5,9(a0)
    80203de8:	cbcd                	beqz	a5,80203e9a <filewrite+0xc6>
    80203dea:	84aa                	mv	s1,a0
    80203dec:	892e                	mv	s2,a1
    80203dee:	89b2                	mv	s3,a2
    return -1;

  if(f->type == FD_PIPE){
    80203df0:	411c                	lw	a5,0(a0)
    80203df2:	4705                	li	a4,1
    80203df4:	04e78963          	beq	a5,a4,80203e46 <filewrite+0x72>
    ret = pipewrite(f->pipe, addr, n);
  } else if(f->type == FD_DEVICE){
    80203df8:	470d                	li	a4,3
    80203dfa:	04e78d63          	beq	a5,a4,80203e54 <filewrite+0x80>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
      return -1;
    ret = devsw[f->major].write(1, addr, n);
  } else if(f->type == FD_ENTRY){
    80203dfe:	4709                	li	a4,2
    80203e00:	08e79563          	bne	a5,a4,80203e8a <filewrite+0xb6>
    elock(f->ep);
    80203e04:	6d08                	ld	a0,24(a0)
    80203e06:	00003097          	auipc	ra,0x3
    80203e0a:	f5c080e7          	jalr	-164(ra) # 80206d62 <elock>
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203e0e:	00098a1b          	sext.w	s4,s3
    80203e12:	8752                	mv	a4,s4
    80203e14:	5094                	lw	a3,32(s1)
    80203e16:	864a                	mv	a2,s2
    80203e18:	4585                	li	a1,1
    80203e1a:	6c88                	ld	a0,24(s1)
    80203e1c:	00002097          	auipc	ra,0x2
    80203e20:	754080e7          	jalr	1876(ra) # 80206570 <ewrite>
      ret = n;
      f->off += n;
    } else {
      ret = -1;
    80203e24:	597d                	li	s2,-1
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203e26:	05350b63          	beq	a0,s3,80203e7c <filewrite+0xa8>
    }
    eunlock(f->ep);
    80203e2a:	6c88                	ld	a0,24(s1)
    80203e2c:	00003097          	auipc	ra,0x3
    80203e30:	f6c080e7          	jalr	-148(ra) # 80206d98 <eunlock>
  } else {
    panic("filewrite");
  }

  return ret;
}
    80203e34:	854a                	mv	a0,s2
    80203e36:	70a2                	ld	ra,40(sp)
    80203e38:	7402                	ld	s0,32(sp)
    80203e3a:	64e2                	ld	s1,24(sp)
    80203e3c:	6942                	ld	s2,16(sp)
    80203e3e:	69a2                	ld	s3,8(sp)
    80203e40:	6a02                	ld	s4,0(sp)
    80203e42:	6145                	addi	sp,sp,48
    80203e44:	8082                	ret
    ret = pipewrite(f->pipe, addr, n);
    80203e46:	6908                	ld	a0,16(a0)
    80203e48:	00000097          	auipc	ra,0x0
    80203e4c:	26e080e7          	jalr	622(ra) # 802040b6 <pipewrite>
    80203e50:	892a                	mv	s2,a0
    80203e52:	b7cd                	j	80203e34 <filewrite+0x60>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80203e54:	02451783          	lh	a5,36(a0)
    80203e58:	03079693          	slli	a3,a5,0x30
    80203e5c:	92c1                	srli	a3,a3,0x30
    80203e5e:	4725                	li	a4,9
    80203e60:	02d76f63          	bltu	a4,a3,80203e9e <filewrite+0xca>
    80203e64:	0792                	slli	a5,a5,0x4
    80203e66:	0001b717          	auipc	a4,0x1b
    80203e6a:	54a70713          	addi	a4,a4,1354 # 8021f3b0 <devsw>
    80203e6e:	97ba                	add	a5,a5,a4
    80203e70:	679c                	ld	a5,8(a5)
    80203e72:	cb85                	beqz	a5,80203ea2 <filewrite+0xce>
    ret = devsw[f->major].write(1, addr, n);
    80203e74:	4505                	li	a0,1
    80203e76:	9782                	jalr	a5
    80203e78:	892a                	mv	s2,a0
    80203e7a:	bf6d                	j	80203e34 <filewrite+0x60>
      f->off += n;
    80203e7c:	509c                	lw	a5,32(s1)
    80203e7e:	01478a3b          	addw	s4,a5,s4
    80203e82:	0344a023          	sw	s4,32(s1)
      ret = n;
    80203e86:	894e                	mv	s2,s3
    80203e88:	b74d                	j	80203e2a <filewrite+0x56>
    panic("filewrite");
    80203e8a:	00007517          	auipc	a0,0x7
    80203e8e:	d7650513          	addi	a0,a0,-650 # 8020ac00 <digits+0x880>
    80203e92:	ffffc097          	auipc	ra,0xffffc
    80203e96:	2b0080e7          	jalr	688(ra) # 80200142 <panic>
    return -1;
    80203e9a:	597d                	li	s2,-1
    80203e9c:	bf61                	j	80203e34 <filewrite+0x60>
      return -1;
    80203e9e:	597d                	li	s2,-1
    80203ea0:	bf51                	j	80203e34 <filewrite+0x60>
    80203ea2:	597d                	li	s2,-1
    80203ea4:	bf41                	j	80203e34 <filewrite+0x60>

0000000080203ea6 <dirnext>:
int
dirnext(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();

  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203ea6:	00854783          	lbu	a5,8(a0)
    80203eaa:	cfdd                	beqz	a5,80203f68 <dirnext+0xc2>
{
    80203eac:	7141                	addi	sp,sp,-496
    80203eae:	f786                	sd	ra,488(sp)
    80203eb0:	f3a2                	sd	s0,480(sp)
    80203eb2:	efa6                	sd	s1,472(sp)
    80203eb4:	ebca                	sd	s2,464(sp)
    80203eb6:	e7ce                	sd	s3,456(sp)
    80203eb8:	e3d2                	sd	s4,448(sp)
    80203eba:	ff56                	sd	s5,440(sp)
    80203ebc:	1b80                	addi	s0,sp,496
    80203ebe:	84aa                	mv	s1,a0
    80203ec0:	8aae                	mv	s5,a1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203ec2:	6d18                	ld	a4,24(a0)
    80203ec4:	10074783          	lbu	a5,256(a4)
    80203ec8:	8bc1                	andi	a5,a5,16
    return -1;
    80203eca:	557d                	li	a0,-1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203ecc:	eb91                	bnez	a5,80203ee0 <dirnext+0x3a>
  // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    return -1;

  return 1;
    80203ece:	70be                	ld	ra,488(sp)
    80203ed0:	741e                	ld	s0,480(sp)
    80203ed2:	64fe                	ld	s1,472(sp)
    80203ed4:	695e                	ld	s2,464(sp)
    80203ed6:	69be                	ld	s3,456(sp)
    80203ed8:	6a1e                	ld	s4,448(sp)
    80203eda:	7afa                	ld	s5,440(sp)
    80203edc:	617d                	addi	sp,sp,496
    80203ede:	8082                	ret
  int count = 0;
    80203ee0:	e0042e23          	sw	zero,-484(s0)
  elock(f->ep);
    80203ee4:	853a                	mv	a0,a4
    80203ee6:	00003097          	auipc	ra,0x3
    80203eea:	e7c080e7          	jalr	-388(ra) # 80206d62 <elock>
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80203eee:	e1c40a13          	addi	s4,s0,-484
    80203ef2:	e5840993          	addi	s3,s0,-424
    80203ef6:	a801                	j	80203f06 <dirnext+0x60>
    f->off += count * 32;
    80203ef8:	e1c42783          	lw	a5,-484(s0)
    80203efc:	0057971b          	slliw	a4,a5,0x5
    80203f00:	509c                	lw	a5,32(s1)
    80203f02:	9fb9                	addw	a5,a5,a4
    80203f04:	d09c                	sw	a5,32(s1)
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80203f06:	86d2                	mv	a3,s4
    80203f08:	5090                	lw	a2,32(s1)
    80203f0a:	85ce                	mv	a1,s3
    80203f0c:	6c88                	ld	a0,24(s1)
    80203f0e:	00003097          	auipc	ra,0x3
    80203f12:	058080e7          	jalr	88(ra) # 80206f66 <enext>
    80203f16:	892a                	mv	s2,a0
    80203f18:	d165                	beqz	a0,80203ef8 <dirnext+0x52>
  eunlock(f->ep);
    80203f1a:	6c88                	ld	a0,24(s1)
    80203f1c:	00003097          	auipc	ra,0x3
    80203f20:	e7c080e7          	jalr	-388(ra) # 80206d98 <eunlock>
  if (ret == -1)
    80203f24:	57fd                	li	a5,-1
    return 0;
    80203f26:	4501                	li	a0,0
  if (ret == -1)
    80203f28:	faf903e3          	beq	s2,a5,80203ece <dirnext+0x28>
  f->off += count * 32;
    80203f2c:	e1c42783          	lw	a5,-484(s0)
    80203f30:	0057971b          	slliw	a4,a5,0x5
    80203f34:	509c                	lw	a5,32(s1)
    80203f36:	9fb9                	addw	a5,a5,a4
    80203f38:	d09c                	sw	a5,32(s1)
  estat(&de, &st);
    80203f3a:	e2040493          	addi	s1,s0,-480
    80203f3e:	85a6                	mv	a1,s1
    80203f40:	e5840513          	addi	a0,s0,-424
    80203f44:	00003097          	auipc	ra,0x3
    80203f48:	fda080e7          	jalr	-38(ra) # 80206f1e <estat>
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203f4c:	03800613          	li	a2,56
    80203f50:	85a6                	mv	a1,s1
    80203f52:	8556                	mv	a0,s5
    80203f54:	ffffd097          	auipc	ra,0xffffd
    80203f58:	444080e7          	jalr	1092(ra) # 80201398 <copyout2>
    80203f5c:	87aa                	mv	a5,a0
  return 1;
    80203f5e:	4505                	li	a0,1
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203f60:	f607d7e3          	bgez	a5,80203ece <dirnext+0x28>
    return -1;
    80203f64:	557d                	li	a0,-1
    80203f66:	b7a5                	j	80203ece <dirnext+0x28>
    return -1;
    80203f68:	557d                	li	a0,-1
    80203f6a:	8082                	ret

0000000080203f6c <pipealloc>:
#include "include/kalloc.h"
#include "include/vm.h"

int
pipealloc(struct file **f0, struct file **f1)
{
    80203f6c:	7179                	addi	sp,sp,-48
    80203f6e:	f406                	sd	ra,40(sp)
    80203f70:	f022                	sd	s0,32(sp)
    80203f72:	ec26                	sd	s1,24(sp)
    80203f74:	e84a                	sd	s2,16(sp)
    80203f76:	e44e                	sd	s3,8(sp)
    80203f78:	e052                	sd	s4,0(sp)
    80203f7a:	1800                	addi	s0,sp,48
    80203f7c:	84aa                	mv	s1,a0
    80203f7e:	8a2e                	mv	s4,a1
  struct pipe *pi;

  pi = 0;
  *f0 = *f1 = 0;
    80203f80:	0005b023          	sd	zero,0(a1)
    80203f84:	00053023          	sd	zero,0(a0)
  if((*f0 = filealloc()) == NULL || (*f1 = filealloc()) == NULL)
    80203f88:	00000097          	auipc	ra,0x0
    80203f8c:	bb4080e7          	jalr	-1100(ra) # 80203b3c <filealloc>
    80203f90:	e088                	sd	a0,0(s1)
    80203f92:	c551                	beqz	a0,8020401e <pipealloc+0xb2>
    80203f94:	00000097          	auipc	ra,0x0
    80203f98:	ba8080e7          	jalr	-1112(ra) # 80203b3c <filealloc>
    80203f9c:	00aa3023          	sd	a0,0(s4)
    80203fa0:	c92d                	beqz	a0,80204012 <pipealloc+0xa6>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == NULL)
    80203fa2:	ffffc097          	auipc	ra,0xffffc
    80203fa6:	5ba080e7          	jalr	1466(ra) # 8020055c <kalloc>
    80203faa:	892a                	mv	s2,a0
    80203fac:	c125                	beqz	a0,8020400c <pipealloc+0xa0>
    goto bad;
  pi->readopen = 1;
    80203fae:	4985                	li	s3,1
    80203fb0:	23352023          	sw	s3,544(a0)
  pi->writeopen = 1;
    80203fb4:	23352223          	sw	s3,548(a0)
  pi->nwrite = 0;
    80203fb8:	20052e23          	sw	zero,540(a0)
  pi->nread = 0;
    80203fbc:	20052c23          	sw	zero,536(a0)
  initlock(&pi->lock, "pipe");
    80203fc0:	00007597          	auipc	a1,0x7
    80203fc4:	a3858593          	addi	a1,a1,-1480 # 8020a9f8 <digits+0x678>
    80203fc8:	ffffc097          	auipc	ra,0xffffc
    80203fcc:	6bc080e7          	jalr	1724(ra) # 80200684 <initlock>
  (*f0)->type = FD_PIPE;
    80203fd0:	609c                	ld	a5,0(s1)
    80203fd2:	0137a023          	sw	s3,0(a5)
  (*f0)->readable = 1;
    80203fd6:	609c                	ld	a5,0(s1)
    80203fd8:	01378423          	sb	s3,8(a5)
  (*f0)->writable = 0;
    80203fdc:	609c                	ld	a5,0(s1)
    80203fde:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80203fe2:	609c                	ld	a5,0(s1)
    80203fe4:	0127b823          	sd	s2,16(a5)
  (*f1)->type = FD_PIPE;
    80203fe8:	000a3783          	ld	a5,0(s4)
    80203fec:	0137a023          	sw	s3,0(a5)
  (*f1)->readable = 0;
    80203ff0:	000a3783          	ld	a5,0(s4)
    80203ff4:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80203ff8:	000a3783          	ld	a5,0(s4)
    80203ffc:	013784a3          	sb	s3,9(a5)
  (*f1)->pipe = pi;
    80204000:	000a3783          	ld	a5,0(s4)
    80204004:	0127b823          	sd	s2,16(a5)
  return 0;
    80204008:	4501                	li	a0,0
    8020400a:	a025                	j	80204032 <pipealloc+0xc6>

 bad:
  if(pi)
    kfree((char*)pi);
  if(*f0)
    8020400c:	6088                	ld	a0,0(s1)
    8020400e:	e501                	bnez	a0,80204016 <pipealloc+0xaa>
    80204010:	a039                	j	8020401e <pipealloc+0xb2>
    80204012:	6088                	ld	a0,0(s1)
    80204014:	c51d                	beqz	a0,80204042 <pipealloc+0xd6>
    fileclose(*f0);
    80204016:	00000097          	auipc	ra,0x0
    8020401a:	be2080e7          	jalr	-1054(ra) # 80203bf8 <fileclose>
  if(*f1)
    8020401e:	000a3783          	ld	a5,0(s4)
    fileclose(*f1);
  return -1;
    80204022:	557d                	li	a0,-1
  if(*f1)
    80204024:	c799                	beqz	a5,80204032 <pipealloc+0xc6>
    fileclose(*f1);
    80204026:	853e                	mv	a0,a5
    80204028:	00000097          	auipc	ra,0x0
    8020402c:	bd0080e7          	jalr	-1072(ra) # 80203bf8 <fileclose>
  return -1;
    80204030:	557d                	li	a0,-1
}
    80204032:	70a2                	ld	ra,40(sp)
    80204034:	7402                	ld	s0,32(sp)
    80204036:	64e2                	ld	s1,24(sp)
    80204038:	6942                	ld	s2,16(sp)
    8020403a:	69a2                	ld	s3,8(sp)
    8020403c:	6a02                	ld	s4,0(sp)
    8020403e:	6145                	addi	sp,sp,48
    80204040:	8082                	ret
  return -1;
    80204042:	557d                	li	a0,-1
    80204044:	b7fd                	j	80204032 <pipealloc+0xc6>

0000000080204046 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    80204046:	1101                	addi	sp,sp,-32
    80204048:	ec06                	sd	ra,24(sp)
    8020404a:	e822                	sd	s0,16(sp)
    8020404c:	e426                	sd	s1,8(sp)
    8020404e:	e04a                	sd	s2,0(sp)
    80204050:	1000                	addi	s0,sp,32
    80204052:	84aa                	mv	s1,a0
    80204054:	892e                	mv	s2,a1
  acquire(&pi->lock);
    80204056:	ffffc097          	auipc	ra,0xffffc
    8020405a:	672080e7          	jalr	1650(ra) # 802006c8 <acquire>
  if(writable){
    8020405e:	02090d63          	beqz	s2,80204098 <pipeclose+0x52>
    pi->writeopen = 0;
    80204062:	2204a223          	sw	zero,548(s1)
    wakeup(&pi->nread);
    80204066:	21848513          	addi	a0,s1,536
    8020406a:	ffffe097          	auipc	ra,0xffffe
    8020406e:	3ee080e7          	jalr	1006(ra) # 80202458 <wakeup>
  } else {
    pi->readopen = 0;
    wakeup(&pi->nwrite);
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80204072:	2204b783          	ld	a5,544(s1)
    80204076:	eb95                	bnez	a5,802040aa <pipeclose+0x64>
    release(&pi->lock);
    80204078:	8526                	mv	a0,s1
    8020407a:	ffffc097          	auipc	ra,0xffffc
    8020407e:	6a2080e7          	jalr	1698(ra) # 8020071c <release>
    kfree((char*)pi);
    80204082:	8526                	mv	a0,s1
    80204084:	ffffc097          	auipc	ra,0xffffc
    80204088:	3c0080e7          	jalr	960(ra) # 80200444 <kfree>
  } else
    release(&pi->lock);
}
    8020408c:	60e2                	ld	ra,24(sp)
    8020408e:	6442                	ld	s0,16(sp)
    80204090:	64a2                	ld	s1,8(sp)
    80204092:	6902                	ld	s2,0(sp)
    80204094:	6105                	addi	sp,sp,32
    80204096:	8082                	ret
    pi->readopen = 0;
    80204098:	2204a023          	sw	zero,544(s1)
    wakeup(&pi->nwrite);
    8020409c:	21c48513          	addi	a0,s1,540
    802040a0:	ffffe097          	auipc	ra,0xffffe
    802040a4:	3b8080e7          	jalr	952(ra) # 80202458 <wakeup>
    802040a8:	b7e9                	j	80204072 <pipeclose+0x2c>
    release(&pi->lock);
    802040aa:	8526                	mv	a0,s1
    802040ac:	ffffc097          	auipc	ra,0xffffc
    802040b0:	670080e7          	jalr	1648(ra) # 8020071c <release>
}
    802040b4:	bfe1                	j	8020408c <pipeclose+0x46>

00000000802040b6 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    802040b6:	7175                	addi	sp,sp,-144
    802040b8:	e506                	sd	ra,136(sp)
    802040ba:	e122                	sd	s0,128(sp)
    802040bc:	fca6                	sd	s1,120(sp)
    802040be:	f8ca                	sd	s2,112(sp)
    802040c0:	f4ce                	sd	s3,104(sp)
    802040c2:	f0d2                	sd	s4,96(sp)
    802040c4:	ecd6                	sd	s5,88(sp)
    802040c6:	e8da                	sd	s6,80(sp)
    802040c8:	e4de                	sd	s7,72(sp)
    802040ca:	e0e2                	sd	s8,64(sp)
    802040cc:	fc66                	sd	s9,56(sp)
    802040ce:	f86a                	sd	s10,48(sp)
    802040d0:	f46e                	sd	s11,40(sp)
    802040d2:	0900                	addi	s0,sp,144
    802040d4:	84aa                	mv	s1,a0
    802040d6:	f6b43c23          	sd	a1,-136(s0)
    802040da:	8b32                	mv	s6,a2
  int i;
  char ch;
  struct proc *pr = myproc();
    802040dc:	ffffe097          	auipc	ra,0xffffe
    802040e0:	998080e7          	jalr	-1640(ra) # 80201a74 <myproc>
    802040e4:	892a                	mv	s2,a0

  acquire(&pi->lock);
    802040e6:	8526                	mv	a0,s1
    802040e8:	ffffc097          	auipc	ra,0xffffc
    802040ec:	5e0080e7          	jalr	1504(ra) # 802006c8 <acquire>
  for(i = 0; i < n; i++){
    802040f0:	0d605a63          	blez	s6,802041c4 <pipewrite+0x10e>
    802040f4:	89a6                	mv	s3,s1
    802040f6:	3b7d                	addiw	s6,s6,-1
    802040f8:	1b02                	slli	s6,s6,0x20
    802040fa:	020b5b13          	srli	s6,s6,0x20
    802040fe:	4b81                	li	s7,0
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
      if(pi->readopen == 0 || pr->killed){
        release(&pi->lock);
        return -1;
      }
      wakeup(&pi->nread);
    80204100:	21848a93          	addi	s5,s1,536
      sleep(&pi->nwrite, &pi->lock);
    80204104:	21c48a13          	addi	s4,s1,540
    }
    // if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    if(copyin2(&ch, addr + i, 1) == -1)
    80204108:	f8f40d93          	addi	s11,s0,-113
    8020410c:	5d7d                	li	s10,-1
    8020410e:	000b8c9b          	sext.w	s9,s7
    80204112:	8c66                	mv	s8,s9
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    80204114:	2184a783          	lw	a5,536(s1)
    80204118:	21c4a703          	lw	a4,540(s1)
    8020411c:	2007879b          	addiw	a5,a5,512
    80204120:	02f71b63          	bne	a4,a5,80204156 <pipewrite+0xa0>
      if(pi->readopen == 0 || pr->killed){
    80204124:	2204a783          	lw	a5,544(s1)
    80204128:	cba5                	beqz	a5,80204198 <pipewrite+0xe2>
    8020412a:	03092783          	lw	a5,48(s2)
    8020412e:	e7ad                	bnez	a5,80204198 <pipewrite+0xe2>
      wakeup(&pi->nread);
    80204130:	8556                	mv	a0,s5
    80204132:	ffffe097          	auipc	ra,0xffffe
    80204136:	326080e7          	jalr	806(ra) # 80202458 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    8020413a:	85ce                	mv	a1,s3
    8020413c:	8552                	mv	a0,s4
    8020413e:	ffffe097          	auipc	ra,0xffffe
    80204142:	198080e7          	jalr	408(ra) # 802022d6 <sleep>
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    80204146:	2184a783          	lw	a5,536(s1)
    8020414a:	21c4a703          	lw	a4,540(s1)
    8020414e:	2007879b          	addiw	a5,a5,512
    80204152:	fcf709e3          	beq	a4,a5,80204124 <pipewrite+0x6e>
    if(copyin2(&ch, addr + i, 1) == -1)
    80204156:	4605                	li	a2,1
    80204158:	f7843783          	ld	a5,-136(s0)
    8020415c:	00fb85b3          	add	a1,s7,a5
    80204160:	856e                	mv	a0,s11
    80204162:	ffffd097          	auipc	ra,0xffffd
    80204166:	314080e7          	jalr	788(ra) # 80201476 <copyin2>
    8020416a:	05a50e63          	beq	a0,s10,802041c6 <pipewrite+0x110>
      break;
    pi->data[pi->nwrite++ % PIPESIZE] = ch;
    8020416e:	21c4a783          	lw	a5,540(s1)
    80204172:	0017871b          	addiw	a4,a5,1
    80204176:	20e4ae23          	sw	a4,540(s1)
    8020417a:	1ff7f793          	andi	a5,a5,511
    8020417e:	97a6                	add	a5,a5,s1
    80204180:	f8f44703          	lbu	a4,-113(s0)
    80204184:	00e78c23          	sb	a4,24(a5)
  for(i = 0; i < n; i++){
    80204188:	001c8c1b          	addiw	s8,s9,1
    8020418c:	001b8793          	addi	a5,s7,1
    80204190:	036b8b63          	beq	s7,s6,802041c6 <pipewrite+0x110>
    80204194:	8bbe                	mv	s7,a5
    80204196:	bfa5                	j	8020410e <pipewrite+0x58>
        release(&pi->lock);
    80204198:	8526                	mv	a0,s1
    8020419a:	ffffc097          	auipc	ra,0xffffc
    8020419e:	582080e7          	jalr	1410(ra) # 8020071c <release>
        return -1;
    802041a2:	5c7d                	li	s8,-1
  }
  wakeup(&pi->nread);
  release(&pi->lock);
  return i;
}
    802041a4:	8562                	mv	a0,s8
    802041a6:	60aa                	ld	ra,136(sp)
    802041a8:	640a                	ld	s0,128(sp)
    802041aa:	74e6                	ld	s1,120(sp)
    802041ac:	7946                	ld	s2,112(sp)
    802041ae:	79a6                	ld	s3,104(sp)
    802041b0:	7a06                	ld	s4,96(sp)
    802041b2:	6ae6                	ld	s5,88(sp)
    802041b4:	6b46                	ld	s6,80(sp)
    802041b6:	6ba6                	ld	s7,72(sp)
    802041b8:	6c06                	ld	s8,64(sp)
    802041ba:	7ce2                	ld	s9,56(sp)
    802041bc:	7d42                	ld	s10,48(sp)
    802041be:	7da2                	ld	s11,40(sp)
    802041c0:	6149                	addi	sp,sp,144
    802041c2:	8082                	ret
  for(i = 0; i < n; i++){
    802041c4:	4c01                	li	s8,0
  wakeup(&pi->nread);
    802041c6:	21848513          	addi	a0,s1,536
    802041ca:	ffffe097          	auipc	ra,0xffffe
    802041ce:	28e080e7          	jalr	654(ra) # 80202458 <wakeup>
  release(&pi->lock);
    802041d2:	8526                	mv	a0,s1
    802041d4:	ffffc097          	auipc	ra,0xffffc
    802041d8:	548080e7          	jalr	1352(ra) # 8020071c <release>
  return i;
    802041dc:	b7e1                	j	802041a4 <pipewrite+0xee>

00000000802041de <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    802041de:	715d                	addi	sp,sp,-80
    802041e0:	e486                	sd	ra,72(sp)
    802041e2:	e0a2                	sd	s0,64(sp)
    802041e4:	fc26                	sd	s1,56(sp)
    802041e6:	f84a                	sd	s2,48(sp)
    802041e8:	f44e                	sd	s3,40(sp)
    802041ea:	f052                	sd	s4,32(sp)
    802041ec:	ec56                	sd	s5,24(sp)
    802041ee:	e85a                	sd	s6,16(sp)
    802041f0:	0880                	addi	s0,sp,80
    802041f2:	84aa                	mv	s1,a0
    802041f4:	892e                	mv	s2,a1
    802041f6:	8a32                	mv	s4,a2
  int i;
  struct proc *pr = myproc();
    802041f8:	ffffe097          	auipc	ra,0xffffe
    802041fc:	87c080e7          	jalr	-1924(ra) # 80201a74 <myproc>
    80204200:	89aa                	mv	s3,a0
  char ch;

  acquire(&pi->lock);
    80204202:	8b26                	mv	s6,s1
    80204204:	8526                	mv	a0,s1
    80204206:	ffffc097          	auipc	ra,0xffffc
    8020420a:	4c2080e7          	jalr	1218(ra) # 802006c8 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    8020420e:	2184a703          	lw	a4,536(s1)
    80204212:	21c4a783          	lw	a5,540(s1)
    if(pr->killed){
      release(&pi->lock);
      return -1;
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80204216:	21848a93          	addi	s5,s1,536
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    8020421a:	02f71463          	bne	a4,a5,80204242 <piperead+0x64>
    8020421e:	2244a783          	lw	a5,548(s1)
    80204222:	c385                	beqz	a5,80204242 <piperead+0x64>
    if(pr->killed){
    80204224:	0309a783          	lw	a5,48(s3)
    80204228:	e7d9                	bnez	a5,802042b6 <piperead+0xd8>
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    8020422a:	85da                	mv	a1,s6
    8020422c:	8556                	mv	a0,s5
    8020422e:	ffffe097          	auipc	ra,0xffffe
    80204232:	0a8080e7          	jalr	168(ra) # 802022d6 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80204236:	2184a703          	lw	a4,536(s1)
    8020423a:	21c4a783          	lw	a5,540(s1)
    8020423e:	fef700e3          	beq	a4,a5,8020421e <piperead+0x40>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80204242:	09405163          	blez	s4,802042c4 <piperead+0xe6>
    80204246:	4981                	li	s3,0
    if(pi->nread == pi->nwrite)
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    // if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    if(copyout2(addr + i, &ch, 1) == -1)
    80204248:	fbf40b13          	addi	s6,s0,-65
    8020424c:	5afd                	li	s5,-1
    if(pi->nread == pi->nwrite)
    8020424e:	2184a783          	lw	a5,536(s1)
    80204252:	21c4a703          	lw	a4,540(s1)
    80204256:	02f70a63          	beq	a4,a5,8020428a <piperead+0xac>
    ch = pi->data[pi->nread++ % PIPESIZE];
    8020425a:	0017871b          	addiw	a4,a5,1
    8020425e:	20e4ac23          	sw	a4,536(s1)
    80204262:	1ff7f793          	andi	a5,a5,511
    80204266:	97a6                	add	a5,a5,s1
    80204268:	0187c783          	lbu	a5,24(a5)
    8020426c:	faf40fa3          	sb	a5,-65(s0)
    if(copyout2(addr + i, &ch, 1) == -1)
    80204270:	4605                	li	a2,1
    80204272:	85da                	mv	a1,s6
    80204274:	854a                	mv	a0,s2
    80204276:	ffffd097          	auipc	ra,0xffffd
    8020427a:	122080e7          	jalr	290(ra) # 80201398 <copyout2>
    8020427e:	01550663          	beq	a0,s5,8020428a <piperead+0xac>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80204282:	2985                	addiw	s3,s3,1
    80204284:	0905                	addi	s2,s2,1
    80204286:	fd3a14e3          	bne	s4,s3,8020424e <piperead+0x70>
      break;
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    8020428a:	21c48513          	addi	a0,s1,540
    8020428e:	ffffe097          	auipc	ra,0xffffe
    80204292:	1ca080e7          	jalr	458(ra) # 80202458 <wakeup>
  release(&pi->lock);
    80204296:	8526                	mv	a0,s1
    80204298:	ffffc097          	auipc	ra,0xffffc
    8020429c:	484080e7          	jalr	1156(ra) # 8020071c <release>
  return i;
}
    802042a0:	854e                	mv	a0,s3
    802042a2:	60a6                	ld	ra,72(sp)
    802042a4:	6406                	ld	s0,64(sp)
    802042a6:	74e2                	ld	s1,56(sp)
    802042a8:	7942                	ld	s2,48(sp)
    802042aa:	79a2                	ld	s3,40(sp)
    802042ac:	7a02                	ld	s4,32(sp)
    802042ae:	6ae2                	ld	s5,24(sp)
    802042b0:	6b42                	ld	s6,16(sp)
    802042b2:	6161                	addi	sp,sp,80
    802042b4:	8082                	ret
      release(&pi->lock);
    802042b6:	8526                	mv	a0,s1
    802042b8:	ffffc097          	auipc	ra,0xffffc
    802042bc:	464080e7          	jalr	1124(ra) # 8020071c <release>
      return -1;
    802042c0:	59fd                	li	s3,-1
    802042c2:	bff9                	j	802042a0 <piperead+0xc2>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    802042c4:	4981                	li	s3,0
    802042c6:	b7d1                	j	8020428a <piperead+0xac>

00000000802042c8 <exec>:
  return 0;
}


int exec(char *path, char **argv)
{
    802042c8:	dd010113          	addi	sp,sp,-560
    802042cc:	22113423          	sd	ra,552(sp)
    802042d0:	22813023          	sd	s0,544(sp)
    802042d4:	20913c23          	sd	s1,536(sp)
    802042d8:	21213823          	sd	s2,528(sp)
    802042dc:	21313423          	sd	s3,520(sp)
    802042e0:	21413023          	sd	s4,512(sp)
    802042e4:	ffd6                	sd	s5,504(sp)
    802042e6:	fbda                	sd	s6,496(sp)
    802042e8:	f7de                	sd	s7,488(sp)
    802042ea:	f3e2                	sd	s8,480(sp)
    802042ec:	efe6                	sd	s9,472(sp)
    802042ee:	ebea                	sd	s10,464(sp)
    802042f0:	e7ee                	sd	s11,456(sp)
    802042f2:	1c00                	addi	s0,sp,560
    802042f4:	892a                	mv	s2,a0
    802042f6:	dca43c23          	sd	a0,-552(s0)
    802042fa:	deb43423          	sd	a1,-536(s0)
  struct elfhdr elf;
  struct dirent *ep;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
  pagetable_t kpagetable = 0, oldkpagetable;
  struct proc *p = myproc();
    802042fe:	ffffd097          	auipc	ra,0xffffd
    80204302:	776080e7          	jalr	1910(ra) # 80201a74 <myproc>
    80204306:	84aa                	mv	s1,a0

  // Make a copy of p->kpt without old user space, 
  // but with the same kstack we are using now, which can't be changed
  if ((kpagetable = (pagetable_t)kalloc()) == NULL) {
    80204308:	ffffc097          	auipc	ra,0xffffc
    8020430c:	254080e7          	jalr	596(ra) # 8020055c <kalloc>
    80204310:	2a050763          	beqz	a0,802045be <exec+0x2f6>
    80204314:	8aaa                	mv	s5,a0
    return -1;
  }
  memmove(kpagetable, p->kpagetable, PGSIZE);
    80204316:	6605                	lui	a2,0x1
    80204318:	6cac                	ld	a1,88(s1)
    8020431a:	ffffc097          	auipc	ra,0xffffc
    8020431e:	4aa080e7          	jalr	1194(ra) # 802007c4 <memmove>
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    kpagetable[i] = 0;
    80204322:	000ab023          	sd	zero,0(s5)
    80204326:	000ab423          	sd	zero,8(s5)
  }

  if((ep = ename(path)) == NULL) {
    8020432a:	854a                	mv	a0,s2
    8020432c:	00003097          	auipc	ra,0x3
    80204330:	1e0080e7          	jalr	480(ra) # 8020750c <ename>
    80204334:	8a2a                	mv	s4,a0
    80204336:	3a050d63          	beqz	a0,802046f0 <exec+0x428>
    #ifdef DEBUG
    printf("[exec] %s not found\n", path);
    #endif
    goto bad;
  }
  elock(ep);
    8020433a:	00003097          	auipc	ra,0x3
    8020433e:	a28080e7          	jalr	-1496(ra) # 80206d62 <elock>

  // Check ELF header
  if(eread(ep, 0, (uint64) &elf, 0, sizeof(elf)) != sizeof(elf))
    80204342:	04000713          	li	a4,64
    80204346:	4681                	li	a3,0
    80204348:	e4840613          	addi	a2,s0,-440
    8020434c:	4581                	li	a1,0
    8020434e:	8552                	mv	a0,s4
    80204350:	00002097          	auipc	ra,0x2
    80204354:	128080e7          	jalr	296(ra) # 80206478 <eread>
    80204358:	04000793          	li	a5,64
    8020435c:	00f51a63          	bne	a0,a5,80204370 <exec+0xa8>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    80204360:	e4842703          	lw	a4,-440(s0)
    80204364:	464c47b7          	lui	a5,0x464c4
    80204368:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39d3ba81>
    8020436c:	00f70963          	beq	a4,a5,8020437e <exec+0xb6>
  printf("[exec] reach bad\n");
  #endif
  if(pagetable)
    proc_freepagetable(pagetable, sz);
  if(kpagetable)
    kvmfree(kpagetable, 0);
    80204370:	4581                	li	a1,0
    80204372:	8556                	mv	a0,s5
    80204374:	ffffd097          	auipc	ra,0xffffd
    80204378:	326080e7          	jalr	806(ra) # 8020169a <kvmfree>
  if(ep){
    8020437c:	a4b5                	j	802045e8 <exec+0x320>
  if((pagetable = proc_pagetable(p)) == NULL)
    8020437e:	8526                	mv	a0,s1
    80204380:	ffffd097          	auipc	ra,0xffffd
    80204384:	7d8080e7          	jalr	2008(ra) # 80201b58 <proc_pagetable>
    80204388:	e0a43423          	sd	a0,-504(s0)
    8020438c:	d175                	beqz	a0,80204370 <exec+0xa8>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8020438e:	e6842783          	lw	a5,-408(s0)
    80204392:	e8045703          	lhu	a4,-384(s0)
    80204396:	cb3d                	beqz	a4,8020440c <exec+0x144>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    80204398:	4481                	li	s1,0
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8020439a:	e0043023          	sd	zero,-512(s0)
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    8020439e:	e1040713          	addi	a4,s0,-496
    802043a2:	dee43023          	sd	a4,-544(s0)
    if(ph.vaddr % PGSIZE != 0)
    802043a6:	6b05                	lui	s6,0x1
    802043a8:	fffb0713          	addi	a4,s6,-1 # fff <_entry-0x801ff001>
    802043ac:	dce43823          	sd	a4,-560(s0)
  for(i = 0; i < sz; i += PGSIZE){
    802043b0:	6d85                	lui	s11,0x1
    802043b2:	7bfd                	lui	s7,0xfffff
    802043b4:	a4c1                	j	80204674 <exec+0x3ac>
      panic("loadseg: address should exist");
    802043b6:	00007517          	auipc	a0,0x7
    802043ba:	85a50513          	addi	a0,a0,-1958 # 8020ac10 <digits+0x890>
    802043be:	ffffc097          	auipc	ra,0xffffc
    802043c2:	d84080e7          	jalr	-636(ra) # 80200142 <panic>
    if(eread(ep, 0, (uint64)pa, offset+i, n) != n)
    802043c6:	874e                	mv	a4,s3
    802043c8:	009d06bb          	addw	a3,s10,s1
    802043cc:	4581                	li	a1,0
    802043ce:	8552                	mv	a0,s4
    802043d0:	00002097          	auipc	ra,0x2
    802043d4:	0a8080e7          	jalr	168(ra) # 80206478 <eread>
    802043d8:	2501                	sext.w	a0,a0
    802043da:	1ea99663          	bne	s3,a0,802045c6 <exec+0x2fe>
  for(i = 0; i < sz; i += PGSIZE){
    802043de:	009d84bb          	addw	s1,s11,s1
    802043e2:	012b893b          	addw	s2,s7,s2
    802043e6:	2784f763          	bgeu	s1,s8,80204654 <exec+0x38c>
    pa = walkaddr(pagetable, va + i);
    802043ea:	02049593          	slli	a1,s1,0x20
    802043ee:	9181                	srli	a1,a1,0x20
    802043f0:	95e6                	add	a1,a1,s9
    802043f2:	e0843503          	ld	a0,-504(s0)
    802043f6:	ffffc097          	auipc	ra,0xffffc
    802043fa:	7e2080e7          	jalr	2018(ra) # 80200bd8 <walkaddr>
    802043fe:	862a                	mv	a2,a0
    if(pa == NULL)
    80204400:	d95d                	beqz	a0,802043b6 <exec+0xee>
      n = PGSIZE;
    80204402:	89da                	mv	s3,s6
    if(sz - i < PGSIZE)
    80204404:	fd6971e3          	bgeu	s2,s6,802043c6 <exec+0xfe>
      n = sz - i;
    80204408:	89ca                	mv	s3,s2
    8020440a:	bf75                	j	802043c6 <exec+0xfe>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    8020440c:	4481                	li	s1,0
  eunlock(ep);
    8020440e:	8552                	mv	a0,s4
    80204410:	00003097          	auipc	ra,0x3
    80204414:	988080e7          	jalr	-1656(ra) # 80206d98 <eunlock>
  eput(ep);
    80204418:	8552                	mv	a0,s4
    8020441a:	00003097          	auipc	ra,0x3
    8020441e:	9cc080e7          	jalr	-1588(ra) # 80206de6 <eput>
  p = myproc();
    80204422:	ffffd097          	auipc	ra,0xffffd
    80204426:	652080e7          	jalr	1618(ra) # 80201a74 <myproc>
    8020442a:	8b2a                	mv	s6,a0
  uint64 oldsz = p->sz;
    8020442c:	04853d83          	ld	s11,72(a0)
  sz = PGROUNDUP(sz);
    80204430:	6785                	lui	a5,0x1
    80204432:	17fd                	addi	a5,a5,-1
    80204434:	94be                	add	s1,s1,a5
    80204436:	77fd                	lui	a5,0xfffff
    80204438:	8fe5                	and	a5,a5,s1
    8020443a:	def43823          	sd	a5,-528(s0)
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    8020443e:	6689                	lui	a3,0x2
    80204440:	96be                	add	a3,a3,a5
    80204442:	863e                	mv	a2,a5
    80204444:	85d6                	mv	a1,s5
    80204446:	e0843483          	ld	s1,-504(s0)
    8020444a:	8526                	mv	a0,s1
    8020444c:	ffffd097          	auipc	ra,0xffffd
    80204450:	be8080e7          	jalr	-1048(ra) # 80201034 <uvmalloc>
    80204454:	8d2a                	mv	s10,a0
  ep = 0;
    80204456:	4a01                	li	s4,0
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    80204458:	16050763          	beqz	a0,802045c6 <exec+0x2fe>
  uvmclear(pagetable, sz-2*PGSIZE);
    8020445c:	75f9                	lui	a1,0xffffe
    8020445e:	95aa                	add	a1,a1,a0
    80204460:	8526                	mv	a0,s1
    80204462:	ffffd097          	auipc	ra,0xffffd
    80204466:	e78080e7          	jalr	-392(ra) # 802012da <uvmclear>
  stackbase = sp - PGSIZE;
    8020446a:	7c7d                	lui	s8,0xfffff
    8020446c:	9c6a                	add	s8,s8,s10
  for(argc = 0; argv[argc]; argc++) {
    8020446e:	de843783          	ld	a5,-536(s0)
    80204472:	6388                	ld	a0,0(a5)
    80204474:	c925                	beqz	a0,802044e4 <exec+0x21c>
    80204476:	e8840993          	addi	s3,s0,-376
    8020447a:	f8840c93          	addi	s9,s0,-120
  sp = sz;
    8020447e:	896a                	mv	s2,s10
  for(argc = 0; argv[argc]; argc++) {
    80204480:	4481                	li	s1,0
    sp -= strlen(argv[argc]) + 1;
    80204482:	ffffc097          	auipc	ra,0xffffc
    80204486:	46a080e7          	jalr	1130(ra) # 802008ec <strlen>
    8020448a:	2505                	addiw	a0,a0,1
    8020448c:	40a90933          	sub	s2,s2,a0
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    80204490:	ff097913          	andi	s2,s2,-16
    if(sp < stackbase)
    80204494:	1b896463          	bltu	s2,s8,8020463c <exec+0x374>
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    80204498:	de843b83          	ld	s7,-536(s0)
    8020449c:	000bba03          	ld	s4,0(s7) # fffffffffffff000 <kernel_end+0xffffffff7fdd6000>
    802044a0:	8552                	mv	a0,s4
    802044a2:	ffffc097          	auipc	ra,0xffffc
    802044a6:	44a080e7          	jalr	1098(ra) # 802008ec <strlen>
    802044aa:	0015069b          	addiw	a3,a0,1
    802044ae:	8652                	mv	a2,s4
    802044b0:	85ca                	mv	a1,s2
    802044b2:	e0843503          	ld	a0,-504(s0)
    802044b6:	ffffd097          	auipc	ra,0xffffd
    802044ba:	e56080e7          	jalr	-426(ra) # 8020130c <copyout>
    802044be:	18054363          	bltz	a0,80204644 <exec+0x37c>
    ustack[argc] = sp;
    802044c2:	0129b023          	sd	s2,0(s3)
  for(argc = 0; argv[argc]; argc++) {
    802044c6:	0485                	addi	s1,s1,1
    802044c8:	008b8793          	addi	a5,s7,8
    802044cc:	def43423          	sd	a5,-536(s0)
    802044d0:	008bb503          	ld	a0,8(s7)
    802044d4:	c911                	beqz	a0,802044e8 <exec+0x220>
    if(argc >= MAXARG)
    802044d6:	09a1                	addi	s3,s3,8
    802044d8:	fb3c95e3          	bne	s9,s3,80204482 <exec+0x1ba>
  sz = sz1;
    802044dc:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    802044e0:	4a01                	li	s4,0
    802044e2:	a0d5                	j	802045c6 <exec+0x2fe>
  sp = sz;
    802044e4:	896a                	mv	s2,s10
  for(argc = 0; argv[argc]; argc++) {
    802044e6:	4481                	li	s1,0
  ustack[argc] = 0;
    802044e8:	00349793          	slli	a5,s1,0x3
    802044ec:	f9040713          	addi	a4,s0,-112
    802044f0:	97ba                	add	a5,a5,a4
    802044f2:	ee07bc23          	sd	zero,-264(a5) # ffffffffffffeef8 <kernel_end+0xffffffff7fdd5ef8>
  sp -= (argc+1) * sizeof(uint64);
    802044f6:	00148693          	addi	a3,s1,1
    802044fa:	068e                	slli	a3,a3,0x3
    802044fc:	40d90933          	sub	s2,s2,a3
  sp -= sp % 16;
    80204500:	ff097913          	andi	s2,s2,-16
  if(sp < stackbase)
    80204504:	01897663          	bgeu	s2,s8,80204510 <exec+0x248>
  sz = sz1;
    80204508:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    8020450c:	4a01                	li	s4,0
    8020450e:	a865                	j	802045c6 <exec+0x2fe>
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    80204510:	e8840613          	addi	a2,s0,-376
    80204514:	85ca                	mv	a1,s2
    80204516:	e0843503          	ld	a0,-504(s0)
    8020451a:	ffffd097          	auipc	ra,0xffffd
    8020451e:	df2080e7          	jalr	-526(ra) # 8020130c <copyout>
    80204522:	12054563          	bltz	a0,8020464c <exec+0x384>
  p->trapframe->a1 = sp;
    80204526:	060b3783          	ld	a5,96(s6)
    8020452a:	0727bc23          	sd	s2,120(a5)
  for(last=s=path; *s; s++)
    8020452e:	dd843783          	ld	a5,-552(s0)
    80204532:	0007c703          	lbu	a4,0(a5)
    80204536:	cf11                	beqz	a4,80204552 <exec+0x28a>
    80204538:	0785                	addi	a5,a5,1
    if(*s == '/')
    8020453a:	02f00693          	li	a3,47
    8020453e:	a029                	j	80204548 <exec+0x280>
  for(last=s=path; *s; s++)
    80204540:	0785                	addi	a5,a5,1
    80204542:	fff7c703          	lbu	a4,-1(a5)
    80204546:	c711                	beqz	a4,80204552 <exec+0x28a>
    if(*s == '/')
    80204548:	fed71ce3          	bne	a4,a3,80204540 <exec+0x278>
      last = s+1;
    8020454c:	dcf43c23          	sd	a5,-552(s0)
    80204550:	bfc5                	j	80204540 <exec+0x278>
  safestrcpy(p->name, last, sizeof(p->name));
    80204552:	4641                	li	a2,16
    80204554:	dd843583          	ld	a1,-552(s0)
    80204558:	160b0513          	addi	a0,s6,352
    8020455c:	ffffc097          	auipc	ra,0xffffc
    80204560:	35e080e7          	jalr	862(ra) # 802008ba <safestrcpy>
  oldpagetable = p->pagetable;
    80204564:	050b3503          	ld	a0,80(s6)
  oldkpagetable = p->kpagetable;
    80204568:	058b3983          	ld	s3,88(s6)
  p->pagetable = pagetable;
    8020456c:	e0843783          	ld	a5,-504(s0)
    80204570:	04fb3823          	sd	a5,80(s6)
  p->kpagetable = kpagetable;
    80204574:	055b3c23          	sd	s5,88(s6)
  p->sz = sz;
    80204578:	05ab3423          	sd	s10,72(s6)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    8020457c:	060b3783          	ld	a5,96(s6)
    80204580:	e6043703          	ld	a4,-416(s0)
    80204584:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    80204586:	060b3783          	ld	a5,96(s6)
    8020458a:	0327b823          	sd	s2,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    8020458e:	85ee                	mv	a1,s11
    80204590:	ffffd097          	auipc	ra,0xffffd
    80204594:	664080e7          	jalr	1636(ra) # 80201bf4 <proc_freepagetable>
  w_satp(MAKE_SATP(p->kpagetable));
    80204598:	058b3783          	ld	a5,88(s6)
    8020459c:	83b1                	srli	a5,a5,0xc
    8020459e:	577d                	li	a4,-1
    802045a0:	177e                	slli	a4,a4,0x3f
    802045a2:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    802045a4:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    802045a8:	12000073          	sfence.vma
  kvmfree(oldkpagetable, 0);
    802045ac:	4581                	li	a1,0
    802045ae:	854e                	mv	a0,s3
    802045b0:	ffffd097          	auipc	ra,0xffffd
    802045b4:	0ea080e7          	jalr	234(ra) # 8020169a <kvmfree>
  return argc; // this ends up in a0, the first argument to main(argc, argv)
    802045b8:	0004851b          	sext.w	a0,s1
    802045bc:	a089                	j	802045fe <exec+0x336>
    return -1;
    802045be:	557d                	li	a0,-1
    802045c0:	a83d                	j	802045fe <exec+0x336>
    802045c2:	de943823          	sd	s1,-528(s0)
    proc_freepagetable(pagetable, sz);
    802045c6:	df043583          	ld	a1,-528(s0)
    802045ca:	e0843503          	ld	a0,-504(s0)
    802045ce:	ffffd097          	auipc	ra,0xffffd
    802045d2:	626080e7          	jalr	1574(ra) # 80201bf4 <proc_freepagetable>
    kvmfree(kpagetable, 0);
    802045d6:	4581                	li	a1,0
    802045d8:	8556                	mv	a0,s5
    802045da:	ffffd097          	auipc	ra,0xffffd
    802045de:	0c0080e7          	jalr	192(ra) # 8020169a <kvmfree>
    eunlock(ep);
    eput(ep);
  }
  return -1;
    802045e2:	557d                	li	a0,-1
  if(ep){
    802045e4:	000a0d63          	beqz	s4,802045fe <exec+0x336>
    eunlock(ep);
    802045e8:	8552                	mv	a0,s4
    802045ea:	00002097          	auipc	ra,0x2
    802045ee:	7ae080e7          	jalr	1966(ra) # 80206d98 <eunlock>
    eput(ep);
    802045f2:	8552                	mv	a0,s4
    802045f4:	00002097          	auipc	ra,0x2
    802045f8:	7f2080e7          	jalr	2034(ra) # 80206de6 <eput>
  return -1;
    802045fc:	557d                	li	a0,-1
}
    802045fe:	22813083          	ld	ra,552(sp)
    80204602:	22013403          	ld	s0,544(sp)
    80204606:	21813483          	ld	s1,536(sp)
    8020460a:	21013903          	ld	s2,528(sp)
    8020460e:	20813983          	ld	s3,520(sp)
    80204612:	20013a03          	ld	s4,512(sp)
    80204616:	7afe                	ld	s5,504(sp)
    80204618:	7b5e                	ld	s6,496(sp)
    8020461a:	7bbe                	ld	s7,488(sp)
    8020461c:	7c1e                	ld	s8,480(sp)
    8020461e:	6cfe                	ld	s9,472(sp)
    80204620:	6d5e                	ld	s10,464(sp)
    80204622:	6dbe                	ld	s11,456(sp)
    80204624:	23010113          	addi	sp,sp,560
    80204628:	8082                	ret
    8020462a:	de943823          	sd	s1,-528(s0)
    8020462e:	bf61                	j	802045c6 <exec+0x2fe>
    80204630:	de943823          	sd	s1,-528(s0)
    80204634:	bf49                	j	802045c6 <exec+0x2fe>
    80204636:	de943823          	sd	s1,-528(s0)
    8020463a:	b771                	j	802045c6 <exec+0x2fe>
  sz = sz1;
    8020463c:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    80204640:	4a01                	li	s4,0
    80204642:	b751                	j	802045c6 <exec+0x2fe>
  sz = sz1;
    80204644:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    80204648:	4a01                	li	s4,0
    8020464a:	bfb5                	j	802045c6 <exec+0x2fe>
  sz = sz1;
    8020464c:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    80204650:	4a01                	li	s4,0
    80204652:	bf95                	j	802045c6 <exec+0x2fe>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80204654:	df043483          	ld	s1,-528(s0)
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80204658:	e0043783          	ld	a5,-512(s0)
    8020465c:	0017869b          	addiw	a3,a5,1
    80204660:	e0d43023          	sd	a3,-512(s0)
    80204664:	df843783          	ld	a5,-520(s0)
    80204668:	0387879b          	addiw	a5,a5,56
    8020466c:	e8045703          	lhu	a4,-384(s0)
    80204670:	d8e6dfe3          	bge	a3,a4,8020440e <exec+0x146>
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80204674:	2781                	sext.w	a5,a5
    80204676:	def43c23          	sd	a5,-520(s0)
    8020467a:	03800713          	li	a4,56
    8020467e:	86be                	mv	a3,a5
    80204680:	de043603          	ld	a2,-544(s0)
    80204684:	4581                	li	a1,0
    80204686:	8552                	mv	a0,s4
    80204688:	00002097          	auipc	ra,0x2
    8020468c:	df0080e7          	jalr	-528(ra) # 80206478 <eread>
    80204690:	03800793          	li	a5,56
    80204694:	f2f517e3          	bne	a0,a5,802045c2 <exec+0x2fa>
    if(ph.type != ELF_PROG_LOAD)
    80204698:	e1042783          	lw	a5,-496(s0)
    8020469c:	4705                	li	a4,1
    8020469e:	fae79de3          	bne	a5,a4,80204658 <exec+0x390>
    if(ph.memsz < ph.filesz)
    802046a2:	e3843683          	ld	a3,-456(s0)
    802046a6:	e3043783          	ld	a5,-464(s0)
    802046aa:	f8f6e0e3          	bltu	a3,a5,8020462a <exec+0x362>
    if(ph.vaddr + ph.memsz < ph.vaddr)
    802046ae:	e2043783          	ld	a5,-480(s0)
    802046b2:	96be                	add	a3,a3,a5
    802046b4:	f6f6eee3          	bltu	a3,a5,80204630 <exec+0x368>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    802046b8:	8626                	mv	a2,s1
    802046ba:	85d6                	mv	a1,s5
    802046bc:	e0843503          	ld	a0,-504(s0)
    802046c0:	ffffd097          	auipc	ra,0xffffd
    802046c4:	974080e7          	jalr	-1676(ra) # 80201034 <uvmalloc>
    802046c8:	dea43823          	sd	a0,-528(s0)
    802046cc:	d52d                	beqz	a0,80204636 <exec+0x36e>
    if(ph.vaddr % PGSIZE != 0)
    802046ce:	e2043c83          	ld	s9,-480(s0)
    802046d2:	dd043783          	ld	a5,-560(s0)
    802046d6:	00fcf7b3          	and	a5,s9,a5
    802046da:	ee0796e3          	bnez	a5,802045c6 <exec+0x2fe>
    if(loadseg(pagetable, ph.vaddr, ep, ph.off, ph.filesz) < 0)
    802046de:	e1842d03          	lw	s10,-488(s0)
    802046e2:	e3042c03          	lw	s8,-464(s0)
  for(i = 0; i < sz; i += PGSIZE){
    802046e6:	f60c07e3          	beqz	s8,80204654 <exec+0x38c>
    802046ea:	8962                	mv	s2,s8
    802046ec:	4481                	li	s1,0
    802046ee:	b9f5                	j	802043ea <exec+0x122>
    kvmfree(kpagetable, 0);
    802046f0:	4581                	li	a1,0
    802046f2:	8556                	mv	a0,s5
    802046f4:	ffffd097          	auipc	ra,0xffffd
    802046f8:	fa6080e7          	jalr	-90(ra) # 8020169a <kvmfree>
  return -1;
    802046fc:	557d                	li	a0,-1
    802046fe:	b701                	j	802045fe <exec+0x336>

0000000080204700 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80204700:	7179                	addi	sp,sp,-48
    80204702:	f406                	sd	ra,40(sp)
    80204704:	f022                	sd	s0,32(sp)
    80204706:	ec26                	sd	s1,24(sp)
    80204708:	e84a                	sd	s2,16(sp)
    8020470a:	1800                	addi	s0,sp,48
    8020470c:	892e                	mv	s2,a1
    8020470e:	84b2                	mv	s1,a2
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    80204710:	fdc40593          	addi	a1,s0,-36
    80204714:	fffff097          	auipc	ra,0xfffff
    80204718:	816080e7          	jalr	-2026(ra) # 80202f2a <argint>
    8020471c:	04054063          	bltz	a0,8020475c <argfd+0x5c>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == NULL)
    80204720:	fdc42703          	lw	a4,-36(s0)
    80204724:	47bd                	li	a5,15
    80204726:	02e7ed63          	bltu	a5,a4,80204760 <argfd+0x60>
    8020472a:	ffffd097          	auipc	ra,0xffffd
    8020472e:	34a080e7          	jalr	842(ra) # 80201a74 <myproc>
    80204732:	fdc42703          	lw	a4,-36(s0)
    80204736:	01a70793          	addi	a5,a4,26
    8020473a:	078e                	slli	a5,a5,0x3
    8020473c:	953e                	add	a0,a0,a5
    8020473e:	651c                	ld	a5,8(a0)
    80204740:	c395                	beqz	a5,80204764 <argfd+0x64>
    return -1;
  if(pfd)
    80204742:	00090463          	beqz	s2,8020474a <argfd+0x4a>
    *pfd = fd;
    80204746:	00e92023          	sw	a4,0(s2)
  if(pf)
    *pf = f;
  return 0;
    8020474a:	4501                	li	a0,0
  if(pf)
    8020474c:	c091                	beqz	s1,80204750 <argfd+0x50>
    *pf = f;
    8020474e:	e09c                	sd	a5,0(s1)
}
    80204750:	70a2                	ld	ra,40(sp)
    80204752:	7402                	ld	s0,32(sp)
    80204754:	64e2                	ld	s1,24(sp)
    80204756:	6942                	ld	s2,16(sp)
    80204758:	6145                	addi	sp,sp,48
    8020475a:	8082                	ret
    return -1;
    8020475c:	557d                	li	a0,-1
    8020475e:	bfcd                	j	80204750 <argfd+0x50>
    return -1;
    80204760:	557d                	li	a0,-1
    80204762:	b7fd                	j	80204750 <argfd+0x50>
    80204764:	557d                	li	a0,-1
    80204766:	b7ed                	j	80204750 <argfd+0x50>

0000000080204768 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80204768:	1101                	addi	sp,sp,-32
    8020476a:	ec06                	sd	ra,24(sp)
    8020476c:	e822                	sd	s0,16(sp)
    8020476e:	e426                	sd	s1,8(sp)
    80204770:	1000                	addi	s0,sp,32
    80204772:	84aa                	mv	s1,a0
  int fd;
  struct proc *p = myproc();
    80204774:	ffffd097          	auipc	ra,0xffffd
    80204778:	300080e7          	jalr	768(ra) # 80201a74 <myproc>
    8020477c:	862a                	mv	a2,a0

  for(fd = 0; fd < NOFILE; fd++){
    8020477e:	0d850793          	addi	a5,a0,216
    80204782:	4501                	li	a0,0
    80204784:	46c1                	li	a3,16
    if(p->ofile[fd] == 0){
    80204786:	6398                	ld	a4,0(a5)
    80204788:	cb19                	beqz	a4,8020479e <fdalloc+0x36>
  for(fd = 0; fd < NOFILE; fd++){
    8020478a:	2505                	addiw	a0,a0,1
    8020478c:	07a1                	addi	a5,a5,8
    8020478e:	fed51ce3          	bne	a0,a3,80204786 <fdalloc+0x1e>
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
    80204792:	557d                	li	a0,-1
}
    80204794:	60e2                	ld	ra,24(sp)
    80204796:	6442                	ld	s0,16(sp)
    80204798:	64a2                	ld	s1,8(sp)
    8020479a:	6105                	addi	sp,sp,32
    8020479c:	8082                	ret
      p->ofile[fd] = f;
    8020479e:	01a50793          	addi	a5,a0,26
    802047a2:	078e                	slli	a5,a5,0x3
    802047a4:	963e                	add	a2,a2,a5
    802047a6:	e604                	sd	s1,8(a2)
      return fd;
    802047a8:	b7f5                	j	80204794 <fdalloc+0x2c>

00000000802047aa <create>:
  return filestat(f, st);
}

static struct dirent*
create(char *path, short type, int mode)
{
    802047aa:	7169                	addi	sp,sp,-304
    802047ac:	f606                	sd	ra,296(sp)
    802047ae:	f222                	sd	s0,288(sp)
    802047b0:	ee26                	sd	s1,280(sp)
    802047b2:	ea4a                	sd	s2,272(sp)
    802047b4:	e64e                	sd	s3,264(sp)
    802047b6:	1a00                	addi	s0,sp,304
    802047b8:	89ae                	mv	s3,a1
  struct dirent *ep, *dp;
  char name[FAT32_MAX_FILENAME + 1];

  if((dp = enameparent(path, name)) == NULL)
    802047ba:	ed040593          	addi	a1,s0,-304
    802047be:	00003097          	auipc	ra,0x3
    802047c2:	d6c080e7          	jalr	-660(ra) # 8020752a <enameparent>
    802047c6:	84aa                	mv	s1,a0
    802047c8:	cd3d                	beqz	a0,80204846 <create+0x9c>
    return NULL;

  if (type == T_DIR) {
    802047ca:	0009879b          	sext.w	a5,s3
    802047ce:	4705                	li	a4,1
    802047d0:	06e78d63          	beq	a5,a4,8020484a <create+0xa0>
    mode = ATTR_READ_ONLY;
  } else {
    mode = 0;  
  }

  elock(dp);
    802047d4:	00002097          	auipc	ra,0x2
    802047d8:	58e080e7          	jalr	1422(ra) # 80206d62 <elock>
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    802047dc:	4601                	li	a2,0
    802047de:	ed040593          	addi	a1,s0,-304
    802047e2:	8526                	mv	a0,s1
    802047e4:	00003097          	auipc	ra,0x3
    802047e8:	a70080e7          	jalr	-1424(ra) # 80207254 <ealloc>
    802047ec:	892a                	mv	s2,a0
    802047ee:	c121                	beqz	a0,8020482e <create+0x84>
    eunlock(dp);
    eput(dp);
    return NULL;
  }
  
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    802047f0:	2981                	sext.w	s3,s3
    802047f2:	4789                	li	a5,2
    802047f4:	00f99663          	bne	s3,a5,80204800 <create+0x56>
      (type == T_FILE && (ep->attribute & ATTR_DIRECTORY))) {
    802047f8:	10094783          	lbu	a5,256(s2)
    802047fc:	8bc1                	andi	a5,a5,16
    802047fe:	eba5                	bnez	a5,8020486e <create+0xc4>
    eput(ep);
    eput(dp);
    return NULL;
  }

  eunlock(dp);
    80204800:	8526                	mv	a0,s1
    80204802:	00002097          	auipc	ra,0x2
    80204806:	596080e7          	jalr	1430(ra) # 80206d98 <eunlock>
  eput(dp);
    8020480a:	8526                	mv	a0,s1
    8020480c:	00002097          	auipc	ra,0x2
    80204810:	5da080e7          	jalr	1498(ra) # 80206de6 <eput>

  elock(ep);
    80204814:	854a                	mv	a0,s2
    80204816:	00002097          	auipc	ra,0x2
    8020481a:	54c080e7          	jalr	1356(ra) # 80206d62 <elock>
  return ep;
}
    8020481e:	854a                	mv	a0,s2
    80204820:	70b2                	ld	ra,296(sp)
    80204822:	7412                	ld	s0,288(sp)
    80204824:	64f2                	ld	s1,280(sp)
    80204826:	6952                	ld	s2,272(sp)
    80204828:	69b2                	ld	s3,264(sp)
    8020482a:	6155                	addi	sp,sp,304
    8020482c:	8082                	ret
    eunlock(dp);
    8020482e:	8526                	mv	a0,s1
    80204830:	00002097          	auipc	ra,0x2
    80204834:	568080e7          	jalr	1384(ra) # 80206d98 <eunlock>
    eput(dp);
    80204838:	8526                	mv	a0,s1
    8020483a:	00002097          	auipc	ra,0x2
    8020483e:	5ac080e7          	jalr	1452(ra) # 80206de6 <eput>
    return NULL;
    80204842:	4901                	li	s2,0
    80204844:	bfe9                	j	8020481e <create+0x74>
    return NULL;
    80204846:	892a                	mv	s2,a0
    80204848:	bfd9                	j	8020481e <create+0x74>
  elock(dp);
    8020484a:	00002097          	auipc	ra,0x2
    8020484e:	518080e7          	jalr	1304(ra) # 80206d62 <elock>
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    80204852:	4641                	li	a2,16
    80204854:	ed040593          	addi	a1,s0,-304
    80204858:	8526                	mv	a0,s1
    8020485a:	00003097          	auipc	ra,0x3
    8020485e:	9fa080e7          	jalr	-1542(ra) # 80207254 <ealloc>
    80204862:	892a                	mv	s2,a0
    80204864:	d569                	beqz	a0,8020482e <create+0x84>
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204866:	10094783          	lbu	a5,256(s2)
    8020486a:	8bc1                	andi	a5,a5,16
    8020486c:	fbd1                	bnez	a5,80204800 <create+0x56>
    eunlock(dp);
    8020486e:	8526                	mv	a0,s1
    80204870:	00002097          	auipc	ra,0x2
    80204874:	528080e7          	jalr	1320(ra) # 80206d98 <eunlock>
    eput(ep);
    80204878:	854a                	mv	a0,s2
    8020487a:	00002097          	auipc	ra,0x2
    8020487e:	56c080e7          	jalr	1388(ra) # 80206de6 <eput>
    eput(dp);
    80204882:	8526                	mv	a0,s1
    80204884:	00002097          	auipc	ra,0x2
    80204888:	562080e7          	jalr	1378(ra) # 80206de6 <eput>
    return NULL;
    8020488c:	4901                	li	s2,0
    8020488e:	bf41                	j	8020481e <create+0x74>

0000000080204890 <sys_dup>:
{
    80204890:	7179                	addi	sp,sp,-48
    80204892:	f406                	sd	ra,40(sp)
    80204894:	f022                	sd	s0,32(sp)
    80204896:	ec26                	sd	s1,24(sp)
    80204898:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0)
    8020489a:	fd840613          	addi	a2,s0,-40
    8020489e:	4581                	li	a1,0
    802048a0:	4501                	li	a0,0
    802048a2:	00000097          	auipc	ra,0x0
    802048a6:	e5e080e7          	jalr	-418(ra) # 80204700 <argfd>
    return -1;
    802048aa:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0)
    802048ac:	02054363          	bltz	a0,802048d2 <sys_dup+0x42>
  if((fd=fdalloc(f)) < 0)
    802048b0:	fd843503          	ld	a0,-40(s0)
    802048b4:	00000097          	auipc	ra,0x0
    802048b8:	eb4080e7          	jalr	-332(ra) # 80204768 <fdalloc>
    802048bc:	84aa                	mv	s1,a0
    return -1;
    802048be:	57fd                	li	a5,-1
  if((fd=fdalloc(f)) < 0)
    802048c0:	00054963          	bltz	a0,802048d2 <sys_dup+0x42>
  filedup(f);
    802048c4:	fd843503          	ld	a0,-40(s0)
    802048c8:	fffff097          	auipc	ra,0xfffff
    802048cc:	2de080e7          	jalr	734(ra) # 80203ba6 <filedup>
  return fd;
    802048d0:	87a6                	mv	a5,s1
}
    802048d2:	853e                	mv	a0,a5
    802048d4:	70a2                	ld	ra,40(sp)
    802048d6:	7402                	ld	s0,32(sp)
    802048d8:	64e2                	ld	s1,24(sp)
    802048da:	6145                	addi	sp,sp,48
    802048dc:	8082                	ret

00000000802048de <sys_read>:
{
    802048de:	7179                	addi	sp,sp,-48
    802048e0:	f406                	sd	ra,40(sp)
    802048e2:	f022                	sd	s0,32(sp)
    802048e4:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802048e6:	fe840613          	addi	a2,s0,-24
    802048ea:	4581                	li	a1,0
    802048ec:	4501                	li	a0,0
    802048ee:	00000097          	auipc	ra,0x0
    802048f2:	e12080e7          	jalr	-494(ra) # 80204700 <argfd>
    return -1;
    802048f6:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802048f8:	04054163          	bltz	a0,8020493a <sys_read+0x5c>
    802048fc:	fe440593          	addi	a1,s0,-28
    80204900:	4509                	li	a0,2
    80204902:	ffffe097          	auipc	ra,0xffffe
    80204906:	628080e7          	jalr	1576(ra) # 80202f2a <argint>
    return -1;
    8020490a:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020490c:	02054763          	bltz	a0,8020493a <sys_read+0x5c>
    80204910:	fd840593          	addi	a1,s0,-40
    80204914:	4505                	li	a0,1
    80204916:	ffffe097          	auipc	ra,0xffffe
    8020491a:	676080e7          	jalr	1654(ra) # 80202f8c <argaddr>
    return -1;
    8020491e:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204920:	00054d63          	bltz	a0,8020493a <sys_read+0x5c>
  return fileread(f, p, n);
    80204924:	fe442603          	lw	a2,-28(s0)
    80204928:	fd843583          	ld	a1,-40(s0)
    8020492c:	fe843503          	ld	a0,-24(s0)
    80204930:	fffff097          	auipc	ra,0xfffff
    80204934:	3e2080e7          	jalr	994(ra) # 80203d12 <fileread>
    80204938:	87aa                	mv	a5,a0
}
    8020493a:	853e                	mv	a0,a5
    8020493c:	70a2                	ld	ra,40(sp)
    8020493e:	7402                	ld	s0,32(sp)
    80204940:	6145                	addi	sp,sp,48
    80204942:	8082                	ret

0000000080204944 <sys_write>:
{
    80204944:	7179                	addi	sp,sp,-48
    80204946:	f406                	sd	ra,40(sp)
    80204948:	f022                	sd	s0,32(sp)
    8020494a:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020494c:	fe840613          	addi	a2,s0,-24
    80204950:	4581                	li	a1,0
    80204952:	4501                	li	a0,0
    80204954:	00000097          	auipc	ra,0x0
    80204958:	dac080e7          	jalr	-596(ra) # 80204700 <argfd>
    return -1;
    8020495c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020495e:	04054163          	bltz	a0,802049a0 <sys_write+0x5c>
    80204962:	fe440593          	addi	a1,s0,-28
    80204966:	4509                	li	a0,2
    80204968:	ffffe097          	auipc	ra,0xffffe
    8020496c:	5c2080e7          	jalr	1474(ra) # 80202f2a <argint>
    return -1;
    80204970:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204972:	02054763          	bltz	a0,802049a0 <sys_write+0x5c>
    80204976:	fd840593          	addi	a1,s0,-40
    8020497a:	4505                	li	a0,1
    8020497c:	ffffe097          	auipc	ra,0xffffe
    80204980:	610080e7          	jalr	1552(ra) # 80202f8c <argaddr>
    return -1;
    80204984:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204986:	00054d63          	bltz	a0,802049a0 <sys_write+0x5c>
  return filewrite(f, p, n);
    8020498a:	fe442603          	lw	a2,-28(s0)
    8020498e:	fd843583          	ld	a1,-40(s0)
    80204992:	fe843503          	ld	a0,-24(s0)
    80204996:	fffff097          	auipc	ra,0xfffff
    8020499a:	43e080e7          	jalr	1086(ra) # 80203dd4 <filewrite>
    8020499e:	87aa                	mv	a5,a0
}
    802049a0:	853e                	mv	a0,a5
    802049a2:	70a2                	ld	ra,40(sp)
    802049a4:	7402                	ld	s0,32(sp)
    802049a6:	6145                	addi	sp,sp,48
    802049a8:	8082                	ret

00000000802049aa <sys_close>:
{
    802049aa:	1101                	addi	sp,sp,-32
    802049ac:	ec06                	sd	ra,24(sp)
    802049ae:	e822                	sd	s0,16(sp)
    802049b0:	1000                	addi	s0,sp,32
  if(argfd(0, &fd, &f) < 0)
    802049b2:	fe040613          	addi	a2,s0,-32
    802049b6:	fec40593          	addi	a1,s0,-20
    802049ba:	4501                	li	a0,0
    802049bc:	00000097          	auipc	ra,0x0
    802049c0:	d44080e7          	jalr	-700(ra) # 80204700 <argfd>
    return -1;
    802049c4:	57fd                	li	a5,-1
  if(argfd(0, &fd, &f) < 0)
    802049c6:	02054463          	bltz	a0,802049ee <sys_close+0x44>
  myproc()->ofile[fd] = 0;
    802049ca:	ffffd097          	auipc	ra,0xffffd
    802049ce:	0aa080e7          	jalr	170(ra) # 80201a74 <myproc>
    802049d2:	fec42783          	lw	a5,-20(s0)
    802049d6:	07e9                	addi	a5,a5,26
    802049d8:	078e                	slli	a5,a5,0x3
    802049da:	97aa                	add	a5,a5,a0
    802049dc:	0007b423          	sd	zero,8(a5)
  fileclose(f);
    802049e0:	fe043503          	ld	a0,-32(s0)
    802049e4:	fffff097          	auipc	ra,0xfffff
    802049e8:	214080e7          	jalr	532(ra) # 80203bf8 <fileclose>
  return 0;
    802049ec:	4781                	li	a5,0
}
    802049ee:	853e                	mv	a0,a5
    802049f0:	60e2                	ld	ra,24(sp)
    802049f2:	6442                	ld	s0,16(sp)
    802049f4:	6105                	addi	sp,sp,32
    802049f6:	8082                	ret

00000000802049f8 <sys_fstat>:
{
    802049f8:	1101                	addi	sp,sp,-32
    802049fa:	ec06                	sd	ra,24(sp)
    802049fc:	e822                	sd	s0,16(sp)
    802049fe:	1000                	addi	s0,sp,32
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204a00:	fe840613          	addi	a2,s0,-24
    80204a04:	4581                	li	a1,0
    80204a06:	4501                	li	a0,0
    80204a08:	00000097          	auipc	ra,0x0
    80204a0c:	cf8080e7          	jalr	-776(ra) # 80204700 <argfd>
    return -1;
    80204a10:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204a12:	02054563          	bltz	a0,80204a3c <sys_fstat+0x44>
    80204a16:	fe040593          	addi	a1,s0,-32
    80204a1a:	4505                	li	a0,1
    80204a1c:	ffffe097          	auipc	ra,0xffffe
    80204a20:	570080e7          	jalr	1392(ra) # 80202f8c <argaddr>
    return -1;
    80204a24:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204a26:	00054b63          	bltz	a0,80204a3c <sys_fstat+0x44>
  return filestat(f, st);
    80204a2a:	fe043583          	ld	a1,-32(s0)
    80204a2e:	fe843503          	ld	a0,-24(s0)
    80204a32:	fffff097          	auipc	ra,0xfffff
    80204a36:	27c080e7          	jalr	636(ra) # 80203cae <filestat>
    80204a3a:	87aa                	mv	a5,a0
}
    80204a3c:	853e                	mv	a0,a5
    80204a3e:	60e2                	ld	ra,24(sp)
    80204a40:	6442                	ld	s0,16(sp)
    80204a42:	6105                	addi	sp,sp,32
    80204a44:	8082                	ret

0000000080204a46 <sys_open>:

uint64
sys_open(void)
{
    80204a46:	7129                	addi	sp,sp,-320
    80204a48:	fe06                	sd	ra,312(sp)
    80204a4a:	fa22                	sd	s0,304(sp)
    80204a4c:	f626                	sd	s1,296(sp)
    80204a4e:	f24a                	sd	s2,288(sp)
    80204a50:	ee4e                	sd	s3,280(sp)
    80204a52:	0280                	addi	s0,sp,320
  char path[FAT32_MAX_PATH];
  int fd, omode;
  struct file *f;
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204a54:	10400613          	li	a2,260
    80204a58:	ec840593          	addi	a1,s0,-312
    80204a5c:	4501                	li	a0,0
    80204a5e:	ffffe097          	auipc	ra,0xffffe
    80204a62:	550080e7          	jalr	1360(ra) # 80202fae <argstr>
    80204a66:	87aa                	mv	a5,a0
    return -1;
    80204a68:	557d                	li	a0,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204a6a:	0807ce63          	bltz	a5,80204b06 <sys_open+0xc0>
    80204a6e:	ec440593          	addi	a1,s0,-316
    80204a72:	4505                	li	a0,1
    80204a74:	ffffe097          	auipc	ra,0xffffe
    80204a78:	4b6080e7          	jalr	1206(ra) # 80202f2a <argint>
    80204a7c:	0e054163          	bltz	a0,80204b5e <sys_open+0x118>

  if(omode & O_CREATE){
    80204a80:	ec442603          	lw	a2,-316(s0)
    80204a84:	24067793          	andi	a5,a2,576
    80204a88:	c7d1                	beqz	a5,80204b14 <sys_open+0xce>
    ep = create(path, T_FILE, omode);
    80204a8a:	4589                	li	a1,2
    80204a8c:	ec840513          	addi	a0,s0,-312
    80204a90:	00000097          	auipc	ra,0x0
    80204a94:	d1a080e7          	jalr	-742(ra) # 802047aa <create>
    80204a98:	892a                	mv	s2,a0
    if(ep == NULL){
    80204a9a:	c561                	beqz	a0,80204b62 <sys_open+0x11c>
      eput(ep);
      return -1;
    }
  }

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204a9c:	fffff097          	auipc	ra,0xfffff
    80204aa0:	0a0080e7          	jalr	160(ra) # 80203b3c <filealloc>
    80204aa4:	89aa                	mv	s3,a0
    80204aa6:	c579                	beqz	a0,80204b74 <sys_open+0x12e>
    80204aa8:	00000097          	auipc	ra,0x0
    80204aac:	cc0080e7          	jalr	-832(ra) # 80204768 <fdalloc>
    80204ab0:	84aa                	mv	s1,a0
    80204ab2:	0a054c63          	bltz	a0,80204b6a <sys_open+0x124>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    80204ab6:	10094783          	lbu	a5,256(s2)
    80204aba:	8bc1                	andi	a5,a5,16
    80204abc:	e791                	bnez	a5,80204ac8 <sys_open+0x82>
    80204abe:	ec442783          	lw	a5,-316(s0)
    80204ac2:	4007f793          	andi	a5,a5,1024
    80204ac6:	e7d1                	bnez	a5,80204b52 <sys_open+0x10c>
    etrunc(ep);
  }

  f->type = FD_ENTRY;
    80204ac8:	4789                	li	a5,2
    80204aca:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    80204ace:	ec442783          	lw	a5,-316(s0)
    80204ad2:	0047f693          	andi	a3,a5,4
    80204ad6:	4701                	li	a4,0
    80204ad8:	c299                	beqz	a3,80204ade <sys_open+0x98>
    80204ada:	10892703          	lw	a4,264(s2)
    80204ade:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    80204ae2:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    80204ae6:	0017c713          	xori	a4,a5,1
    80204aea:	8b05                	andi	a4,a4,1
    80204aec:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204af0:	8b8d                	andi	a5,a5,3
    80204af2:	00f037b3          	snez	a5,a5
    80204af6:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    80204afa:	854a                	mv	a0,s2
    80204afc:	00002097          	auipc	ra,0x2
    80204b00:	29c080e7          	jalr	668(ra) # 80206d98 <eunlock>

  return fd;
    80204b04:	8526                	mv	a0,s1
}
    80204b06:	70f2                	ld	ra,312(sp)
    80204b08:	7452                	ld	s0,304(sp)
    80204b0a:	74b2                	ld	s1,296(sp)
    80204b0c:	7912                	ld	s2,288(sp)
    80204b0e:	69f2                	ld	s3,280(sp)
    80204b10:	6131                	addi	sp,sp,320
    80204b12:	8082                	ret
    if((ep = ename(path)) == NULL){
    80204b14:	ec840513          	addi	a0,s0,-312
    80204b18:	00003097          	auipc	ra,0x3
    80204b1c:	9f4080e7          	jalr	-1548(ra) # 8020750c <ename>
    80204b20:	892a                	mv	s2,a0
    80204b22:	c131                	beqz	a0,80204b66 <sys_open+0x120>
    elock(ep);
    80204b24:	00002097          	auipc	ra,0x2
    80204b28:	23e080e7          	jalr	574(ra) # 80206d62 <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    80204b2c:	10094783          	lbu	a5,256(s2)
    80204b30:	8bc1                	andi	a5,a5,16
    80204b32:	d7ad                	beqz	a5,80204a9c <sys_open+0x56>
    80204b34:	ec442783          	lw	a5,-316(s0)
    80204b38:	d3b5                	beqz	a5,80204a9c <sys_open+0x56>
      eunlock(ep);
    80204b3a:	854a                	mv	a0,s2
    80204b3c:	00002097          	auipc	ra,0x2
    80204b40:	25c080e7          	jalr	604(ra) # 80206d98 <eunlock>
      eput(ep);
    80204b44:	854a                	mv	a0,s2
    80204b46:	00002097          	auipc	ra,0x2
    80204b4a:	2a0080e7          	jalr	672(ra) # 80206de6 <eput>
      return -1;
    80204b4e:	557d                	li	a0,-1
    80204b50:	bf5d                	j	80204b06 <sys_open+0xc0>
    etrunc(ep);
    80204b52:	854a                	mv	a0,s2
    80204b54:	00002097          	auipc	ra,0x2
    80204b58:	1a4080e7          	jalr	420(ra) # 80206cf8 <etrunc>
    80204b5c:	b7b5                	j	80204ac8 <sys_open+0x82>
    return -1;
    80204b5e:	557d                	li	a0,-1
    80204b60:	b75d                	j	80204b06 <sys_open+0xc0>
      return -1;
    80204b62:	557d                	li	a0,-1
    80204b64:	b74d                	j	80204b06 <sys_open+0xc0>
      return -1;
    80204b66:	557d                	li	a0,-1
    80204b68:	bf79                	j	80204b06 <sys_open+0xc0>
      fileclose(f);
    80204b6a:	854e                	mv	a0,s3
    80204b6c:	fffff097          	auipc	ra,0xfffff
    80204b70:	08c080e7          	jalr	140(ra) # 80203bf8 <fileclose>
    eunlock(ep);
    80204b74:	854a                	mv	a0,s2
    80204b76:	00002097          	auipc	ra,0x2
    80204b7a:	222080e7          	jalr	546(ra) # 80206d98 <eunlock>
    eput(ep);
    80204b7e:	854a                	mv	a0,s2
    80204b80:	00002097          	auipc	ra,0x2
    80204b84:	266080e7          	jalr	614(ra) # 80206de6 <eput>
    return -1;
    80204b88:	557d                	li	a0,-1
    80204b8a:	bfb5                	j	80204b06 <sys_open+0xc0>

0000000080204b8c <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80204b8c:	7169                	addi	sp,sp,-304
    80204b8e:	f606                	sd	ra,296(sp)
    80204b90:	f222                	sd	s0,288(sp)
    80204b92:	ee26                	sd	s1,280(sp)
    80204b94:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;

  if(argstr(1, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204b96:	10400613          	li	a2,260
    80204b9a:	ed840593          	addi	a1,s0,-296
    80204b9e:	4505                	li	a0,1
    80204ba0:	ffffe097          	auipc	ra,0xffffe
    80204ba4:	40e080e7          	jalr	1038(ra) # 80202fae <argstr>
    return -1;
    80204ba8:	57fd                	li	a5,-1
  if(argstr(1, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204baa:	02054663          	bltz	a0,80204bd6 <sys_mkdir+0x4a>
    80204bae:	4601                	li	a2,0
    80204bb0:	4585                	li	a1,1
    80204bb2:	ed840513          	addi	a0,s0,-296
    80204bb6:	00000097          	auipc	ra,0x0
    80204bba:	bf4080e7          	jalr	-1036(ra) # 802047aa <create>
    80204bbe:	84aa                	mv	s1,a0
    80204bc0:	c10d                	beqz	a0,80204be2 <sys_mkdir+0x56>
  }
  eunlock(ep);
    80204bc2:	00002097          	auipc	ra,0x2
    80204bc6:	1d6080e7          	jalr	470(ra) # 80206d98 <eunlock>
  eput(ep);
    80204bca:	8526                	mv	a0,s1
    80204bcc:	00002097          	auipc	ra,0x2
    80204bd0:	21a080e7          	jalr	538(ra) # 80206de6 <eput>
  return 0;
    80204bd4:	4781                	li	a5,0
}
    80204bd6:	853e                	mv	a0,a5
    80204bd8:	70b2                	ld	ra,296(sp)
    80204bda:	7412                	ld	s0,288(sp)
    80204bdc:	64f2                	ld	s1,280(sp)
    80204bde:	6155                	addi	sp,sp,304
    80204be0:	8082                	ret
    return -1;
    80204be2:	57fd                	li	a5,-1
    80204be4:	bfcd                	j	80204bd6 <sys_mkdir+0x4a>

0000000080204be6 <sys_chdir>:

uint64
sys_chdir(void)
{
    80204be6:	7169                	addi	sp,sp,-304
    80204be8:	f606                	sd	ra,296(sp)
    80204bea:	f222                	sd	s0,288(sp)
    80204bec:	ee26                	sd	s1,280(sp)
    80204bee:	ea4a                	sd	s2,272(sp)
    80204bf0:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  struct proc *p = myproc();
    80204bf2:	ffffd097          	auipc	ra,0xffffd
    80204bf6:	e82080e7          	jalr	-382(ra) # 80201a74 <myproc>
    80204bfa:	892a                	mv	s2,a0
  
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204bfc:	10400613          	li	a2,260
    80204c00:	ed840593          	addi	a1,s0,-296
    80204c04:	4501                	li	a0,0
    80204c06:	ffffe097          	auipc	ra,0xffffe
    80204c0a:	3a8080e7          	jalr	936(ra) # 80202fae <argstr>
    return -1;
    80204c0e:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204c10:	04054063          	bltz	a0,80204c50 <sys_chdir+0x6a>
    80204c14:	ed840513          	addi	a0,s0,-296
    80204c18:	00003097          	auipc	ra,0x3
    80204c1c:	8f4080e7          	jalr	-1804(ra) # 8020750c <ename>
    80204c20:	84aa                	mv	s1,a0
    80204c22:	c931                	beqz	a0,80204c76 <sys_chdir+0x90>
  }
  elock(ep);
    80204c24:	00002097          	auipc	ra,0x2
    80204c28:	13e080e7          	jalr	318(ra) # 80206d62 <elock>
  if(!(ep->attribute & ATTR_DIRECTORY)){
    80204c2c:	1004c783          	lbu	a5,256(s1)
    80204c30:	8bc1                	andi	a5,a5,16
    80204c32:	c795                	beqz	a5,80204c5e <sys_chdir+0x78>
    eunlock(ep);
    eput(ep);
    return -1;
  }
  eunlock(ep);
    80204c34:	8526                	mv	a0,s1
    80204c36:	00002097          	auipc	ra,0x2
    80204c3a:	162080e7          	jalr	354(ra) # 80206d98 <eunlock>
  eput(p->cwd);
    80204c3e:	15893503          	ld	a0,344(s2)
    80204c42:	00002097          	auipc	ra,0x2
    80204c46:	1a4080e7          	jalr	420(ra) # 80206de6 <eput>
  p->cwd = ep;
    80204c4a:	14993c23          	sd	s1,344(s2)
  return 0;
    80204c4e:	4781                	li	a5,0
}
    80204c50:	853e                	mv	a0,a5
    80204c52:	70b2                	ld	ra,296(sp)
    80204c54:	7412                	ld	s0,288(sp)
    80204c56:	64f2                	ld	s1,280(sp)
    80204c58:	6952                	ld	s2,272(sp)
    80204c5a:	6155                	addi	sp,sp,304
    80204c5c:	8082                	ret
    eunlock(ep);
    80204c5e:	8526                	mv	a0,s1
    80204c60:	00002097          	auipc	ra,0x2
    80204c64:	138080e7          	jalr	312(ra) # 80206d98 <eunlock>
    eput(ep);
    80204c68:	8526                	mv	a0,s1
    80204c6a:	00002097          	auipc	ra,0x2
    80204c6e:	17c080e7          	jalr	380(ra) # 80206de6 <eput>
    return -1;
    80204c72:	57fd                	li	a5,-1
    80204c74:	bff1                	j	80204c50 <sys_chdir+0x6a>
    return -1;
    80204c76:	57fd                	li	a5,-1
    80204c78:	bfe1                	j	80204c50 <sys_chdir+0x6a>

0000000080204c7a <sys_pipe>:

uint64
sys_pipe(void)
{
    80204c7a:	7139                	addi	sp,sp,-64
    80204c7c:	fc06                	sd	ra,56(sp)
    80204c7e:	f822                	sd	s0,48(sp)
    80204c80:	f426                	sd	s1,40(sp)
    80204c82:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80204c84:	ffffd097          	auipc	ra,0xffffd
    80204c88:	df0080e7          	jalr	-528(ra) # 80201a74 <myproc>
    80204c8c:	84aa                	mv	s1,a0

  if(argaddr(0, &fdarray) < 0)
    80204c8e:	fd840593          	addi	a1,s0,-40
    80204c92:	4501                	li	a0,0
    80204c94:	ffffe097          	auipc	ra,0xffffe
    80204c98:	2f8080e7          	jalr	760(ra) # 80202f8c <argaddr>
    return -1;
    80204c9c:	57fd                	li	a5,-1
  if(argaddr(0, &fdarray) < 0)
    80204c9e:	0c054e63          	bltz	a0,80204d7a <sys_pipe+0x100>
  if(pipealloc(&rf, &wf) < 0)
    80204ca2:	fc840593          	addi	a1,s0,-56
    80204ca6:	fd040513          	addi	a0,s0,-48
    80204caa:	fffff097          	auipc	ra,0xfffff
    80204cae:	2c2080e7          	jalr	706(ra) # 80203f6c <pipealloc>
    return -1;
    80204cb2:	57fd                	li	a5,-1
  if(pipealloc(&rf, &wf) < 0)
    80204cb4:	0c054363          	bltz	a0,80204d7a <sys_pipe+0x100>
  fd0 = -1;
    80204cb8:	fcf42223          	sw	a5,-60(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80204cbc:	fd043503          	ld	a0,-48(s0)
    80204cc0:	00000097          	auipc	ra,0x0
    80204cc4:	aa8080e7          	jalr	-1368(ra) # 80204768 <fdalloc>
    80204cc8:	fca42223          	sw	a0,-60(s0)
    80204ccc:	08054a63          	bltz	a0,80204d60 <sys_pipe+0xe6>
    80204cd0:	fc843503          	ld	a0,-56(s0)
    80204cd4:	00000097          	auipc	ra,0x0
    80204cd8:	a94080e7          	jalr	-1388(ra) # 80204768 <fdalloc>
    80204cdc:	fca42023          	sw	a0,-64(s0)
    80204ce0:	06054663          	bltz	a0,80204d4c <sys_pipe+0xd2>
    fileclose(wf);
    return -1;
  }
  // if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
  //    copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204ce4:	4611                	li	a2,4
    80204ce6:	fc440593          	addi	a1,s0,-60
    80204cea:	fd843503          	ld	a0,-40(s0)
    80204cee:	ffffc097          	auipc	ra,0xffffc
    80204cf2:	6aa080e7          	jalr	1706(ra) # 80201398 <copyout2>
    80204cf6:	00054f63          	bltz	a0,80204d14 <sys_pipe+0x9a>
     copyout2(fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80204cfa:	4611                	li	a2,4
    80204cfc:	fc040593          	addi	a1,s0,-64
    80204d00:	fd843503          	ld	a0,-40(s0)
    80204d04:	0511                	addi	a0,a0,4
    80204d06:	ffffc097          	auipc	ra,0xffffc
    80204d0a:	692080e7          	jalr	1682(ra) # 80201398 <copyout2>
    p->ofile[fd1] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  return 0;
    80204d0e:	4781                	li	a5,0
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204d10:	06055563          	bgez	a0,80204d7a <sys_pipe+0x100>
    p->ofile[fd0] = 0;
    80204d14:	fc442783          	lw	a5,-60(s0)
    80204d18:	07e9                	addi	a5,a5,26
    80204d1a:	078e                	slli	a5,a5,0x3
    80204d1c:	97a6                	add	a5,a5,s1
    80204d1e:	0007b423          	sd	zero,8(a5)
    p->ofile[fd1] = 0;
    80204d22:	fc042503          	lw	a0,-64(s0)
    80204d26:	0569                	addi	a0,a0,26
    80204d28:	050e                	slli	a0,a0,0x3
    80204d2a:	9526                	add	a0,a0,s1
    80204d2c:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    80204d30:	fd043503          	ld	a0,-48(s0)
    80204d34:	fffff097          	auipc	ra,0xfffff
    80204d38:	ec4080e7          	jalr	-316(ra) # 80203bf8 <fileclose>
    fileclose(wf);
    80204d3c:	fc843503          	ld	a0,-56(s0)
    80204d40:	fffff097          	auipc	ra,0xfffff
    80204d44:	eb8080e7          	jalr	-328(ra) # 80203bf8 <fileclose>
    return -1;
    80204d48:	57fd                	li	a5,-1
    80204d4a:	a805                	j	80204d7a <sys_pipe+0x100>
    if(fd0 >= 0)
    80204d4c:	fc442783          	lw	a5,-60(s0)
    80204d50:	0007c863          	bltz	a5,80204d60 <sys_pipe+0xe6>
      p->ofile[fd0] = 0;
    80204d54:	01a78513          	addi	a0,a5,26
    80204d58:	050e                	slli	a0,a0,0x3
    80204d5a:	9526                	add	a0,a0,s1
    80204d5c:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    80204d60:	fd043503          	ld	a0,-48(s0)
    80204d64:	fffff097          	auipc	ra,0xfffff
    80204d68:	e94080e7          	jalr	-364(ra) # 80203bf8 <fileclose>
    fileclose(wf);
    80204d6c:	fc843503          	ld	a0,-56(s0)
    80204d70:	fffff097          	auipc	ra,0xfffff
    80204d74:	e88080e7          	jalr	-376(ra) # 80203bf8 <fileclose>
    return -1;
    80204d78:	57fd                	li	a5,-1
}
    80204d7a:	853e                	mv	a0,a5
    80204d7c:	70e2                	ld	ra,56(sp)
    80204d7e:	7442                	ld	s0,48(sp)
    80204d80:	74a2                	ld	s1,40(sp)
    80204d82:	6121                	addi	sp,sp,64
    80204d84:	8082                	ret

0000000080204d86 <sys_dev>:

// To open console device.
uint64
sys_dev(void)
{
    80204d86:	7179                	addi	sp,sp,-48
    80204d88:	f406                	sd	ra,40(sp)
    80204d8a:	f022                	sd	s0,32(sp)
    80204d8c:	ec26                	sd	s1,24(sp)
    80204d8e:	1800                	addi	s0,sp,48
  int fd, omode;
  int major, minor;
  struct file *f;

  if(argint(0, &omode) < 0 || argint(1, &major) < 0 || argint(2, &minor) < 0){
    80204d90:	fdc40593          	addi	a1,s0,-36
    80204d94:	4501                	li	a0,0
    80204d96:	ffffe097          	auipc	ra,0xffffe
    80204d9a:	194080e7          	jalr	404(ra) # 80202f2a <argint>
    80204d9e:	08054a63          	bltz	a0,80204e32 <sys_dev+0xac>
    80204da2:	fd840593          	addi	a1,s0,-40
    80204da6:	4505                	li	a0,1
    80204da8:	ffffe097          	auipc	ra,0xffffe
    80204dac:	182080e7          	jalr	386(ra) # 80202f2a <argint>
    80204db0:	08054763          	bltz	a0,80204e3e <sys_dev+0xb8>
    80204db4:	fd440593          	addi	a1,s0,-44
    80204db8:	4509                	li	a0,2
    80204dba:	ffffe097          	auipc	ra,0xffffe
    80204dbe:	170080e7          	jalr	368(ra) # 80202f2a <argint>
    80204dc2:	08054063          	bltz	a0,80204e42 <sys_dev+0xbc>
    return -1;
  }

  if(omode & O_CREATE){
    80204dc6:	fdc42783          	lw	a5,-36(s0)
    80204dca:	2407f793          	andi	a5,a5,576
    80204dce:	ebb1                	bnez	a5,80204e22 <sys_dev+0x9c>
    panic("dev file on FAT");
  }

  if(major < 0 || major >= NDEV)
    80204dd0:	fd842703          	lw	a4,-40(s0)
    80204dd4:	47a5                	li	a5,9
    return -1;
    80204dd6:	557d                	li	a0,-1
  if(major < 0 || major >= NDEV)
    80204dd8:	04e7ee63          	bltu	a5,a4,80204e34 <sys_dev+0xae>

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204ddc:	fffff097          	auipc	ra,0xfffff
    80204de0:	d60080e7          	jalr	-672(ra) # 80203b3c <filealloc>
    80204de4:	84aa                	mv	s1,a0
    80204de6:	c125                	beqz	a0,80204e46 <sys_dev+0xc0>
    80204de8:	00000097          	auipc	ra,0x0
    80204dec:	980080e7          	jalr	-1664(ra) # 80204768 <fdalloc>
    80204df0:	04054d63          	bltz	a0,80204e4a <sys_dev+0xc4>
    if(f)
      fileclose(f);
    return -1;
  }

  f->type = FD_DEVICE;
    80204df4:	478d                	li	a5,3
    80204df6:	c09c                	sw	a5,0(s1)
  f->off = 0;
    80204df8:	0204a023          	sw	zero,32(s1)
  f->ep = 0;
    80204dfc:	0004bc23          	sd	zero,24(s1)
  f->major = major;
    80204e00:	fd842783          	lw	a5,-40(s0)
    80204e04:	02f49223          	sh	a5,36(s1)
  f->readable = !(omode & O_WRONLY);
    80204e08:	fdc42783          	lw	a5,-36(s0)
    80204e0c:	0017c713          	xori	a4,a5,1
    80204e10:	8b05                	andi	a4,a4,1
    80204e12:	00e48423          	sb	a4,8(s1)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204e16:	8b8d                	andi	a5,a5,3
    80204e18:	00f037b3          	snez	a5,a5
    80204e1c:	00f484a3          	sb	a5,9(s1)

  return fd;
    80204e20:	a811                	j	80204e34 <sys_dev+0xae>
    panic("dev file on FAT");
    80204e22:	00006517          	auipc	a0,0x6
    80204e26:	e0e50513          	addi	a0,a0,-498 # 8020ac30 <digits+0x8b0>
    80204e2a:	ffffb097          	auipc	ra,0xffffb
    80204e2e:	318080e7          	jalr	792(ra) # 80200142 <panic>
    return -1;
    80204e32:	557d                	li	a0,-1
}
    80204e34:	70a2                	ld	ra,40(sp)
    80204e36:	7402                	ld	s0,32(sp)
    80204e38:	64e2                	ld	s1,24(sp)
    80204e3a:	6145                	addi	sp,sp,48
    80204e3c:	8082                	ret
    return -1;
    80204e3e:	557d                	li	a0,-1
    80204e40:	bfd5                	j	80204e34 <sys_dev+0xae>
    80204e42:	557d                	li	a0,-1
    80204e44:	bfc5                	j	80204e34 <sys_dev+0xae>
    return -1;
    80204e46:	557d                	li	a0,-1
    80204e48:	b7f5                	j	80204e34 <sys_dev+0xae>
      fileclose(f);
    80204e4a:	8526                	mv	a0,s1
    80204e4c:	fffff097          	auipc	ra,0xfffff
    80204e50:	dac080e7          	jalr	-596(ra) # 80203bf8 <fileclose>
    return -1;
    80204e54:	557d                	li	a0,-1
    80204e56:	bff9                	j	80204e34 <sys_dev+0xae>

0000000080204e58 <sys_readdir>:

// To support ls command
uint64
sys_readdir(void)
{
    80204e58:	1101                	addi	sp,sp,-32
    80204e5a:	ec06                	sd	ra,24(sp)
    80204e5c:	e822                	sd	s0,16(sp)
    80204e5e:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204e60:	fe840613          	addi	a2,s0,-24
    80204e64:	4581                	li	a1,0
    80204e66:	4501                	li	a0,0
    80204e68:	00000097          	auipc	ra,0x0
    80204e6c:	898080e7          	jalr	-1896(ra) # 80204700 <argfd>
    return -1;
    80204e70:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204e72:	02054563          	bltz	a0,80204e9c <sys_readdir+0x44>
    80204e76:	fe040593          	addi	a1,s0,-32
    80204e7a:	4505                	li	a0,1
    80204e7c:	ffffe097          	auipc	ra,0xffffe
    80204e80:	110080e7          	jalr	272(ra) # 80202f8c <argaddr>
    return -1;
    80204e84:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204e86:	00054b63          	bltz	a0,80204e9c <sys_readdir+0x44>
  return dirnext(f, p);
    80204e8a:	fe043583          	ld	a1,-32(s0)
    80204e8e:	fe843503          	ld	a0,-24(s0)
    80204e92:	fffff097          	auipc	ra,0xfffff
    80204e96:	014080e7          	jalr	20(ra) # 80203ea6 <dirnext>
    80204e9a:	87aa                	mv	a5,a0
}
    80204e9c:	853e                	mv	a0,a5
    80204e9e:	60e2                	ld	ra,24(sp)
    80204ea0:	6442                	ld	s0,16(sp)
    80204ea2:	6105                	addi	sp,sp,32
    80204ea4:	8082                	ret

0000000080204ea6 <sys_getcwd>:

// get absolute cwd string
uint64
sys_getcwd(void)
{
    80204ea6:	714d                	addi	sp,sp,-336
    80204ea8:	e686                	sd	ra,328(sp)
    80204eaa:	e2a2                	sd	s0,320(sp)
    80204eac:	fe26                	sd	s1,312(sp)
    80204eae:	fa4a                	sd	s2,304(sp)
    80204eb0:	f64e                	sd	s3,296(sp)
    80204eb2:	f252                	sd	s4,288(sp)
    80204eb4:	ee56                	sd	s5,280(sp)
    80204eb6:	0a80                	addi	s0,sp,336
  uint64 addr;
  if (argaddr(0, &addr) < 0)
    80204eb8:	fb840593          	addi	a1,s0,-72
    80204ebc:	4501                	li	a0,0
    80204ebe:	ffffe097          	auipc	ra,0xffffe
    80204ec2:	0ce080e7          	jalr	206(ra) # 80202f8c <argaddr>
    return -1;
    80204ec6:	57fd                	li	a5,-1
  if (argaddr(0, &addr) < 0)
    80204ec8:	06054f63          	bltz	a0,80204f46 <sys_getcwd+0xa0>

  struct dirent *de = myproc()->cwd;
    80204ecc:	ffffd097          	auipc	ra,0xffffd
    80204ed0:	ba8080e7          	jalr	-1112(ra) # 80201a74 <myproc>
    80204ed4:	15853483          	ld	s1,344(a0)
  char path[FAT32_MAX_PATH];
  char *s;
  int len;

  if (de->parent == NULL) {
    80204ed8:	1204b783          	ld	a5,288(s1)
    80204edc:	cfbd                	beqz	a5,80204f5a <sys_getcwd+0xb4>
    s = "/";
  } else {
    s = path + FAT32_MAX_PATH - 1;
    *s = '\0';
    80204ede:	fa0409a3          	sb	zero,-77(s0)
    s = path + FAT32_MAX_PATH - 1;
    80204ee2:	fb340993          	addi	s3,s0,-77
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= path)          // can't reach root "/"
    80204ee6:	eb040a13          	addi	s4,s0,-336
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    80204eea:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    80204eee:	8526                	mv	a0,s1
    80204ef0:	ffffc097          	auipc	ra,0xffffc
    80204ef4:	9fc080e7          	jalr	-1540(ra) # 802008ec <strlen>
    80204ef8:	862a                	mv	a2,a0
      s -= len;
    80204efa:	40a98933          	sub	s2,s3,a0
      if (s <= path)          // can't reach root "/"
    80204efe:	072a7363          	bgeu	s4,s2,80204f64 <sys_getcwd+0xbe>
      strncpy(s, de->filename, len);
    80204f02:	85a6                	mv	a1,s1
    80204f04:	854a                	mv	a0,s2
    80204f06:	ffffc097          	auipc	ra,0xffffc
    80204f0a:	976080e7          	jalr	-1674(ra) # 8020087c <strncpy>
      *--s = '/';
    80204f0e:	fff90993          	addi	s3,s2,-1
    80204f12:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    80204f16:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    80204f1a:	1204b783          	ld	a5,288(s1)
    80204f1e:	fbe1                	bnez	a5,80204eee <sys_getcwd+0x48>
    }
  }

  // if (copyout(myproc()->pagetable, addr, s, strlen(s) + 1) < 0)
  if (copyout2(addr, s, strlen(s) + 1) < 0)
    80204f20:	fb843483          	ld	s1,-72(s0)
    80204f24:	854e                	mv	a0,s3
    80204f26:	ffffc097          	auipc	ra,0xffffc
    80204f2a:	9c6080e7          	jalr	-1594(ra) # 802008ec <strlen>
    80204f2e:	0015061b          	addiw	a2,a0,1
    80204f32:	85ce                	mv	a1,s3
    80204f34:	8526                	mv	a0,s1
    80204f36:	ffffc097          	auipc	ra,0xffffc
    80204f3a:	462080e7          	jalr	1122(ra) # 80201398 <copyout2>
    80204f3e:	02054563          	bltz	a0,80204f68 <sys_getcwd+0xc2>
    return -1;
  
  return addr;
    80204f42:	fb843783          	ld	a5,-72(s0)

}
    80204f46:	853e                	mv	a0,a5
    80204f48:	60b6                	ld	ra,328(sp)
    80204f4a:	6416                	ld	s0,320(sp)
    80204f4c:	74f2                	ld	s1,312(sp)
    80204f4e:	7952                	ld	s2,304(sp)
    80204f50:	79b2                	ld	s3,296(sp)
    80204f52:	7a12                	ld	s4,288(sp)
    80204f54:	6af2                	ld	s5,280(sp)
    80204f56:	6171                	addi	sp,sp,336
    80204f58:	8082                	ret
    s = "/";
    80204f5a:	00005997          	auipc	s3,0x5
    80204f5e:	6d698993          	addi	s3,s3,1750 # 8020a630 <digits+0x2b0>
    80204f62:	bf7d                	j	80204f20 <sys_getcwd+0x7a>
        return -1;
    80204f64:	57fd                	li	a5,-1
    80204f66:	b7c5                	j	80204f46 <sys_getcwd+0xa0>
    return -1;
    80204f68:	57fd                	li	a5,-1
    80204f6a:	bff1                	j	80204f46 <sys_getcwd+0xa0>

0000000080204f6c <sys_remove>:
  return ret == -1;
}

uint64
sys_remove(void)
{
    80204f6c:	d6010113          	addi	sp,sp,-672
    80204f70:	28113c23          	sd	ra,664(sp)
    80204f74:	28813823          	sd	s0,656(sp)
    80204f78:	28913423          	sd	s1,648(sp)
    80204f7c:	1500                	addi	s0,sp,672
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  int len;
  if((len = argstr(0, path, FAT32_MAX_PATH)) <= 0)
    80204f7e:	10400613          	li	a2,260
    80204f82:	ed840593          	addi	a1,s0,-296
    80204f86:	4501                	li	a0,0
    80204f88:	ffffe097          	auipc	ra,0xffffe
    80204f8c:	026080e7          	jalr	38(ra) # 80202fae <argstr>
    80204f90:	0ea05a63          	blez	a0,80205084 <sys_remove+0x118>
    return -1;

  char *s = path + len - 1;
    80204f94:	157d                	addi	a0,a0,-1
    80204f96:	ed840713          	addi	a4,s0,-296
    80204f9a:	00a707b3          	add	a5,a4,a0
  while (s >= path && *s == '/') {
    80204f9e:	02f00693          	li	a3,47
    80204fa2:	863a                	mv	a2,a4
    80204fa4:	00e7e963          	bltu	a5,a4,80204fb6 <sys_remove+0x4a>
    80204fa8:	0007c703          	lbu	a4,0(a5)
    80204fac:	08d71a63          	bne	a4,a3,80205040 <sys_remove+0xd4>
    s--;
    80204fb0:	17fd                	addi	a5,a5,-1
  while (s >= path && *s == '/') {
    80204fb2:	fec7fbe3          	bgeu	a5,a2,80204fa8 <sys_remove+0x3c>
  }
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    return -1;
  }
  
  if((ep = ename(path)) == NULL){
    80204fb6:	ed840513          	addi	a0,s0,-296
    80204fba:	00002097          	auipc	ra,0x2
    80204fbe:	552080e7          	jalr	1362(ra) # 8020750c <ename>
    80204fc2:	84aa                	mv	s1,a0
    80204fc4:	c561                	beqz	a0,8020508c <sys_remove+0x120>
    return -1;
  }
  elock(ep);
    80204fc6:	00002097          	auipc	ra,0x2
    80204fca:	d9c080e7          	jalr	-612(ra) # 80206d62 <elock>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80204fce:	1004c783          	lbu	a5,256(s1)
    80204fd2:	8bc1                	andi	a5,a5,16
    80204fd4:	c38d                	beqz	a5,80204ff6 <sys_remove+0x8a>
  ep.valid = 0;
    80204fd6:	e8041323          	sh	zero,-378(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80204fda:	d6c40693          	addi	a3,s0,-660
    80204fde:	04000613          	li	a2,64
    80204fe2:	d7040593          	addi	a1,s0,-656
    80204fe6:	8526                	mv	a0,s1
    80204fe8:	00002097          	auipc	ra,0x2
    80204fec:	f7e080e7          	jalr	-130(ra) # 80206f66 <enext>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80204ff0:	57fd                	li	a5,-1
    80204ff2:	06f51d63          	bne	a0,a5,8020506c <sys_remove+0x100>
      eunlock(ep);
      eput(ep);
      return -1;
  }
  elock(ep->parent);      // Will this lead to deadlock?
    80204ff6:	1204b503          	ld	a0,288(s1)
    80204ffa:	00002097          	auipc	ra,0x2
    80204ffe:	d68080e7          	jalr	-664(ra) # 80206d62 <elock>
  eremove(ep);
    80205002:	8526                	mv	a0,s1
    80205004:	00002097          	auipc	ra,0x2
    80205008:	c2a080e7          	jalr	-982(ra) # 80206c2e <eremove>
  eunlock(ep->parent);
    8020500c:	1204b503          	ld	a0,288(s1)
    80205010:	00002097          	auipc	ra,0x2
    80205014:	d88080e7          	jalr	-632(ra) # 80206d98 <eunlock>
  eunlock(ep);
    80205018:	8526                	mv	a0,s1
    8020501a:	00002097          	auipc	ra,0x2
    8020501e:	d7e080e7          	jalr	-642(ra) # 80206d98 <eunlock>
  eput(ep);
    80205022:	8526                	mv	a0,s1
    80205024:	00002097          	auipc	ra,0x2
    80205028:	dc2080e7          	jalr	-574(ra) # 80206de6 <eput>

  return 0;
    8020502c:	4501                	li	a0,0
}
    8020502e:	29813083          	ld	ra,664(sp)
    80205032:	29013403          	ld	s0,656(sp)
    80205036:	28813483          	ld	s1,648(sp)
    8020503a:	2a010113          	addi	sp,sp,672
    8020503e:	8082                	ret
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    80205040:	ed840713          	addi	a4,s0,-296
    80205044:	f6e7e9e3          	bltu	a5,a4,80204fb6 <sys_remove+0x4a>
    80205048:	0007c683          	lbu	a3,0(a5)
    8020504c:	02e00713          	li	a4,46
    80205050:	f6e693e3          	bne	a3,a4,80204fb6 <sys_remove+0x4a>
    80205054:	ed840713          	addi	a4,s0,-296
    80205058:	02e78863          	beq	a5,a4,80205088 <sys_remove+0x11c>
    8020505c:	fff7c703          	lbu	a4,-1(a5)
    80205060:	02f00793          	li	a5,47
    80205064:	f4f719e3          	bne	a4,a5,80204fb6 <sys_remove+0x4a>
    return -1;
    80205068:	557d                	li	a0,-1
    8020506a:	b7d1                	j	8020502e <sys_remove+0xc2>
      eunlock(ep);
    8020506c:	8526                	mv	a0,s1
    8020506e:	00002097          	auipc	ra,0x2
    80205072:	d2a080e7          	jalr	-726(ra) # 80206d98 <eunlock>
      eput(ep);
    80205076:	8526                	mv	a0,s1
    80205078:	00002097          	auipc	ra,0x2
    8020507c:	d6e080e7          	jalr	-658(ra) # 80206de6 <eput>
      return -1;
    80205080:	557d                	li	a0,-1
    80205082:	b775                	j	8020502e <sys_remove+0xc2>
    return -1;
    80205084:	557d                	li	a0,-1
    80205086:	b765                	j	8020502e <sys_remove+0xc2>
    return -1;
    80205088:	557d                	li	a0,-1
    8020508a:	b755                	j	8020502e <sys_remove+0xc2>
    return -1;
    8020508c:	557d                	li	a0,-1
    8020508e:	b745                	j	8020502e <sys_remove+0xc2>

0000000080205090 <sys_rename>:

// Must hold too many locks at a time! It's possible to raise a deadlock.
// Because this op takes some steps, we can't promise
uint64
sys_rename(void)
{
    80205090:	c4010113          	addi	sp,sp,-960
    80205094:	3a113c23          	sd	ra,952(sp)
    80205098:	3a813823          	sd	s0,944(sp)
    8020509c:	3a913423          	sd	s1,936(sp)
    802050a0:	3b213023          	sd	s2,928(sp)
    802050a4:	39313c23          	sd	s3,920(sp)
    802050a8:	39413823          	sd	s4,912(sp)
    802050ac:	0780                	addi	s0,sp,960
  char old[FAT32_MAX_PATH], new[FAT32_MAX_PATH];
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    802050ae:	10400613          	li	a2,260
    802050b2:	ec840593          	addi	a1,s0,-312
    802050b6:	4501                	li	a0,0
    802050b8:	ffffe097          	auipc	ra,0xffffe
    802050bc:	ef6080e7          	jalr	-266(ra) # 80202fae <argstr>
      return -1;
    802050c0:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    802050c2:	0c054d63          	bltz	a0,8020519c <sys_rename+0x10c>
    802050c6:	10400613          	li	a2,260
    802050ca:	dc040593          	addi	a1,s0,-576
    802050ce:	4505                	li	a0,1
    802050d0:	ffffe097          	auipc	ra,0xffffe
    802050d4:	ede080e7          	jalr	-290(ra) # 80202fae <argstr>
      return -1;
    802050d8:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    802050da:	0c054163          	bltz	a0,8020519c <sys_rename+0x10c>
  }

  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
  int srclock = 0;
  char *name;
  if ((src = ename(old)) == NULL || (pdst = enameparent(new, old)) == NULL
    802050de:	ec840513          	addi	a0,s0,-312
    802050e2:	00002097          	auipc	ra,0x2
    802050e6:	42a080e7          	jalr	1066(ra) # 8020750c <ename>
    802050ea:	84aa                	mv	s1,a0
    802050ec:	1c050963          	beqz	a0,802052be <sys_rename+0x22e>
    802050f0:	ec840593          	addi	a1,s0,-312
    802050f4:	dc040513          	addi	a0,s0,-576
    802050f8:	00002097          	auipc	ra,0x2
    802050fc:	432080e7          	jalr	1074(ra) # 8020752a <enameparent>
    80205100:	892a                	mv	s2,a0
    80205102:	cd35                	beqz	a0,8020517e <sys_rename+0xee>
      || (name = formatname(old)) == NULL) {
    80205104:	ec840513          	addi	a0,s0,-312
    80205108:	00001097          	auipc	ra,0x1
    8020510c:	594080e7          	jalr	1428(ra) # 8020669c <formatname>
    80205110:	89aa                	mv	s3,a0
    80205112:	c535                	beqz	a0,8020517e <sys_rename+0xee>
    goto fail;          // src doesn't exist || dst parent doesn't exist || illegal new name
  }
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    if (ep == src) {    // In what universe can we move a directory into its child?
    80205114:	07248563          	beq	s1,s2,8020517e <sys_rename+0xee>
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    80205118:	87ca                	mv	a5,s2
    8020511a:	1207b783          	ld	a5,288(a5)
    8020511e:	c781                	beqz	a5,80205126 <sys_rename+0x96>
    if (ep == src) {    // In what universe can we move a directory into its child?
    80205120:	fef49de3          	bne	s1,a5,8020511a <sys_rename+0x8a>
    80205124:	a8a9                	j	8020517e <sys_rename+0xee>
      goto fail;
    }
  }

  uint off;
  elock(src);     // must hold child's lock before acquiring parent's, because we do so in other similar cases
    80205126:	8526                	mv	a0,s1
    80205128:	00002097          	auipc	ra,0x2
    8020512c:	c3a080e7          	jalr	-966(ra) # 80206d62 <elock>
  srclock = 1;
  elock(pdst);
    80205130:	854a                	mv	a0,s2
    80205132:	00002097          	auipc	ra,0x2
    80205136:	c30080e7          	jalr	-976(ra) # 80206d62 <elock>
  dst = dirlookup(pdst, name, &off);
    8020513a:	dbc40613          	addi	a2,s0,-580
    8020513e:	85ce                	mv	a1,s3
    80205140:	854a                	mv	a0,s2
    80205142:	00002097          	auipc	ra,0x2
    80205146:	fb4080e7          	jalr	-76(ra) # 802070f6 <dirlookup>
    8020514a:	8a2a                	mv	s4,a0
  if (dst != NULL) {
    8020514c:	cd45                	beqz	a0,80205204 <sys_rename+0x174>
    eunlock(pdst);
    8020514e:	854a                	mv	a0,s2
    80205150:	00002097          	auipc	ra,0x2
    80205154:	c48080e7          	jalr	-952(ra) # 80206d98 <eunlock>
    if (src == dst) {
    80205158:	01448963          	beq	s1,s4,8020516a <sys_rename+0xda>
      goto fail;
    } else if (src->attribute & dst->attribute & ATTR_DIRECTORY) {
    8020515c:	1004c783          	lbu	a5,256(s1)
    80205160:	100a4703          	lbu	a4,256(s4)
    80205164:	8ff9                	and	a5,a5,a4
    80205166:	8bc1                	andi	a5,a5,16
    80205168:	ebb1                	bnez	a5,802051bc <sys_rename+0x12c>

  return 0;

fail:
  if (srclock)
    eunlock(src);
    8020516a:	8526                	mv	a0,s1
    8020516c:	00002097          	auipc	ra,0x2
    80205170:	c2c080e7          	jalr	-980(ra) # 80206d98 <eunlock>
  if (dst)
    eput(dst);
    80205174:	8552                	mv	a0,s4
    80205176:	00002097          	auipc	ra,0x2
    8020517a:	c70080e7          	jalr	-912(ra) # 80206de6 <eput>
  if (pdst)
    8020517e:	00090763          	beqz	s2,8020518c <sys_rename+0xfc>
    eput(pdst);
    80205182:	854a                	mv	a0,s2
    80205184:	00002097          	auipc	ra,0x2
    80205188:	c62080e7          	jalr	-926(ra) # 80206de6 <eput>
  if (src)
    eput(src);
  return -1;
    8020518c:	57fd                	li	a5,-1
  if (src)
    8020518e:	c499                	beqz	s1,8020519c <sys_rename+0x10c>
    eput(src);
    80205190:	8526                	mv	a0,s1
    80205192:	00002097          	auipc	ra,0x2
    80205196:	c54080e7          	jalr	-940(ra) # 80206de6 <eput>
  return -1;
    8020519a:	57fd                	li	a5,-1
}
    8020519c:	853e                	mv	a0,a5
    8020519e:	3b813083          	ld	ra,952(sp)
    802051a2:	3b013403          	ld	s0,944(sp)
    802051a6:	3a813483          	ld	s1,936(sp)
    802051aa:	3a013903          	ld	s2,928(sp)
    802051ae:	39813983          	ld	s3,920(sp)
    802051b2:	39013a03          	ld	s4,912(sp)
    802051b6:	3c010113          	addi	sp,sp,960
    802051ba:	8082                	ret
      elock(dst);
    802051bc:	8552                	mv	a0,s4
    802051be:	00002097          	auipc	ra,0x2
    802051c2:	ba4080e7          	jalr	-1116(ra) # 80206d62 <elock>
  ep.valid = 0;
    802051c6:	d6041323          	sh	zero,-666(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    802051ca:	c4c40693          	addi	a3,s0,-948
    802051ce:	04000613          	li	a2,64
    802051d2:	c5040593          	addi	a1,s0,-944
    802051d6:	8552                	mv	a0,s4
    802051d8:	00002097          	auipc	ra,0x2
    802051dc:	d8e080e7          	jalr	-626(ra) # 80206f66 <enext>
      if (!isdirempty(dst)) {    // it's ok to overwrite an empty dir
    802051e0:	57fd                	li	a5,-1
    802051e2:	0cf51863          	bne	a0,a5,802052b2 <sys_rename+0x222>
      elock(pdst);
    802051e6:	854a                	mv	a0,s2
    802051e8:	00002097          	auipc	ra,0x2
    802051ec:	b7a080e7          	jalr	-1158(ra) # 80206d62 <elock>
    eremove(dst);
    802051f0:	8552                	mv	a0,s4
    802051f2:	00002097          	auipc	ra,0x2
    802051f6:	a3c080e7          	jalr	-1476(ra) # 80206c2e <eremove>
    eunlock(dst);
    802051fa:	8552                	mv	a0,s4
    802051fc:	00002097          	auipc	ra,0x2
    80205200:	b9c080e7          	jalr	-1124(ra) # 80206d98 <eunlock>
  memmove(src->filename, name, FAT32_MAX_FILENAME);
    80205204:	0ff00613          	li	a2,255
    80205208:	85ce                	mv	a1,s3
    8020520a:	8526                	mv	a0,s1
    8020520c:	ffffb097          	auipc	ra,0xffffb
    80205210:	5b8080e7          	jalr	1464(ra) # 802007c4 <memmove>
  emake(pdst, src, off);
    80205214:	dbc42603          	lw	a2,-580(s0)
    80205218:	85a6                	mv	a1,s1
    8020521a:	854a                	mv	a0,s2
    8020521c:	00001097          	auipc	ra,0x1
    80205220:	538080e7          	jalr	1336(ra) # 80206754 <emake>
  if (src->parent != pdst) {
    80205224:	1204b783          	ld	a5,288(s1)
    80205228:	01278d63          	beq	a5,s2,80205242 <sys_rename+0x1b2>
    eunlock(pdst);
    8020522c:	854a                	mv	a0,s2
    8020522e:	00002097          	auipc	ra,0x2
    80205232:	b6a080e7          	jalr	-1174(ra) # 80206d98 <eunlock>
    elock(src->parent);
    80205236:	1204b503          	ld	a0,288(s1)
    8020523a:	00002097          	auipc	ra,0x2
    8020523e:	b28080e7          	jalr	-1240(ra) # 80206d62 <elock>
  eremove(src);
    80205242:	8526                	mv	a0,s1
    80205244:	00002097          	auipc	ra,0x2
    80205248:	9ea080e7          	jalr	-1558(ra) # 80206c2e <eremove>
  eunlock(src->parent);
    8020524c:	1204b503          	ld	a0,288(s1)
    80205250:	00002097          	auipc	ra,0x2
    80205254:	b48080e7          	jalr	-1208(ra) # 80206d98 <eunlock>
  struct dirent *psrc = src->parent;  // src must not be root, or it won't pass the for-loop test
    80205258:	1204b983          	ld	s3,288(s1)
  src->parent = edup(pdst);
    8020525c:	854a                	mv	a0,s2
    8020525e:	00002097          	auipc	ra,0x2
    80205262:	8a6080e7          	jalr	-1882(ra) # 80206b04 <edup>
    80205266:	12a4b023          	sd	a0,288(s1)
  src->off = off;
    8020526a:	dbc42783          	lw	a5,-580(s0)
    8020526e:	10f4ae23          	sw	a5,284(s1)
  src->valid = 1;
    80205272:	4785                	li	a5,1
    80205274:	10f49b23          	sh	a5,278(s1)
  eunlock(src);
    80205278:	8526                	mv	a0,s1
    8020527a:	00002097          	auipc	ra,0x2
    8020527e:	b1e080e7          	jalr	-1250(ra) # 80206d98 <eunlock>
  eput(psrc);
    80205282:	854e                	mv	a0,s3
    80205284:	00002097          	auipc	ra,0x2
    80205288:	b62080e7          	jalr	-1182(ra) # 80206de6 <eput>
  if (dst) {
    8020528c:	000a0763          	beqz	s4,8020529a <sys_rename+0x20a>
    eput(dst);
    80205290:	8552                	mv	a0,s4
    80205292:	00002097          	auipc	ra,0x2
    80205296:	b54080e7          	jalr	-1196(ra) # 80206de6 <eput>
  eput(pdst);
    8020529a:	854a                	mv	a0,s2
    8020529c:	00002097          	auipc	ra,0x2
    802052a0:	b4a080e7          	jalr	-1206(ra) # 80206de6 <eput>
  eput(src);
    802052a4:	8526                	mv	a0,s1
    802052a6:	00002097          	auipc	ra,0x2
    802052aa:	b40080e7          	jalr	-1216(ra) # 80206de6 <eput>
  return 0;
    802052ae:	4781                	li	a5,0
    802052b0:	b5f5                	j	8020519c <sys_rename+0x10c>
        eunlock(dst);
    802052b2:	8552                	mv	a0,s4
    802052b4:	00002097          	auipc	ra,0x2
    802052b8:	ae4080e7          	jalr	-1308(ra) # 80206d98 <eunlock>
        goto fail;
    802052bc:	b57d                	j	8020516a <sys_rename+0xda>
  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
    802052be:	892a                	mv	s2,a0
  if (dst)
    802052c0:	bd7d                	j	8020517e <sys_rename+0xee>

00000000802052c2 <sys_openat>:

// added by lmq for SYS_openat
uint64
sys_openat(void)
{
    802052c2:	ca010113          	addi	sp,sp,-864
    802052c6:	34113c23          	sd	ra,856(sp)
    802052ca:	34813823          	sd	s0,848(sp)
    802052ce:	34913423          	sd	s1,840(sp)
    802052d2:	35213023          	sd	s2,832(sp)
    802052d6:	33313c23          	sd	s3,824(sp)
    802052da:	33413823          	sd	s4,816(sp)
    802052de:	33513423          	sd	s5,808(sp)
    802052e2:	1680                	addi	s0,sp,864
  int dirfd;
  if(argint(0, &dirfd) < 0)
    802052e4:	fbc40593          	addi	a1,s0,-68
    802052e8:	4501                	li	a0,0
    802052ea:	ffffe097          	auipc	ra,0xffffe
    802052ee:	c40080e7          	jalr	-960(ra) # 80202f2a <argint>
    802052f2:	2e054563          	bltz	a0,802055dc <sys_openat+0x31a>
    return -1;
  struct dirent *de = myproc()->cwd;
    802052f6:	ffffc097          	auipc	ra,0xffffc
    802052fa:	77e080e7          	jalr	1918(ra) # 80201a74 <myproc>
  if(dirfd!=AT_FDCWD)
    802052fe:	fbc42703          	lw	a4,-68(s0)
    80205302:	f9c00793          	li	a5,-100
    80205306:	16f71563          	bne	a4,a5,80205470 <sys_openat+0x1ae>
  struct dirent *de = myproc()->cwd;
    8020530a:	15853483          	ld	s1,344(a0)
  {
    de=myproc()->ofile[dirfd]->ep;
  }
  char cur_path[FAT32_MAX_PATH];  // openat工作目录 可以为当前目录 也可以被指定
  memset(cur_path,0,FAT32_MAX_PATH);
    8020530e:	10400613          	li	a2,260
    80205312:	4581                	li	a1,0
    80205314:	eb840513          	addi	a0,s0,-328
    80205318:	ffffb097          	auipc	ra,0xffffb
    8020531c:	44c080e7          	jalr	1100(ra) # 80200764 <memset>
  char* s=NULL;
  int len;

  // 获得openat工作目录路径
  if (de->parent == NULL) {
    80205320:	1204b783          	ld	a5,288(s1)
    80205324:	16078263          	beqz	a5,80205488 <sys_openat+0x1c6>
    s = "/";
  } 
  else {
    s = cur_path + FAT32_MAX_PATH - 1;
    *s = '\0';
    80205328:	fa040da3          	sb	zero,-69(s0)
    s = cur_path + FAT32_MAX_PATH - 1;
    8020532c:	fbb40993          	addi	s3,s0,-69
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= cur_path)          // can't reach root "/"
    80205330:	eb840a13          	addi	s4,s0,-328
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    80205334:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    80205338:	8526                	mv	a0,s1
    8020533a:	ffffb097          	auipc	ra,0xffffb
    8020533e:	5b2080e7          	jalr	1458(ra) # 802008ec <strlen>
    80205342:	862a                	mv	a2,a0
      s -= len;
    80205344:	40a98933          	sub	s2,s3,a0
      if (s <= cur_path)          // can't reach root "/"
    80205348:	292a7c63          	bgeu	s4,s2,802055e0 <sys_openat+0x31e>
      strncpy(s, de->filename, len);
    8020534c:	85a6                	mv	a1,s1
    8020534e:	854a                	mv	a0,s2
    80205350:	ffffb097          	auipc	ra,0xffffb
    80205354:	52c080e7          	jalr	1324(ra) # 8020087c <strncpy>
      *--s = '/';
    80205358:	fff90993          	addi	s3,s2,-1
    8020535c:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    80205360:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    80205364:	1204b783          	ld	a5,288(s1)
    80205368:	fbe1                	bnez	a5,80205338 <sys_openat+0x76>
    }
  }
  
  // 获得openat的文件路径 openat工作目录+相对路径
  char absolute_path[FAT32_MAX_PATH];
  memset(absolute_path,0,FAT32_MAX_PATH);
    8020536a:	10400613          	li	a2,260
    8020536e:	4581                	li	a1,0
    80205370:	db040493          	addi	s1,s0,-592
    80205374:	8526                	mv	a0,s1
    80205376:	ffffb097          	auipc	ra,0xffffb
    8020537a:	3ee080e7          	jalr	1006(ra) # 80200764 <memset>
  strncpy(absolute_path,s,strlen(s));
    8020537e:	854e                	mv	a0,s3
    80205380:	ffffb097          	auipc	ra,0xffffb
    80205384:	56c080e7          	jalr	1388(ra) # 802008ec <strlen>
    80205388:	862a                	mv	a2,a0
    8020538a:	85ce                	mv	a1,s3
    8020538c:	8526                	mv	a0,s1
    8020538e:	ffffb097          	auipc	ra,0xffffb
    80205392:	4ee080e7          	jalr	1262(ra) # 8020087c <strncpy>

  int fd,omode;
  struct file *f;
  struct dirent *ep;
  char relative_path[FAT32_MAX_PATH];
  if(argstr(1, relative_path, FAT32_MAX_PATH) < 0 || argint(2,&omode) < 0)
    80205396:	10400613          	li	a2,260
    8020539a:	ca840593          	addi	a1,s0,-856
    8020539e:	4505                	li	a0,1
    802053a0:	ffffe097          	auipc	ra,0xffffe
    802053a4:	c0e080e7          	jalr	-1010(ra) # 80202fae <argstr>
    802053a8:	24054e63          	bltz	a0,80205604 <sys_openat+0x342>
    802053ac:	dac40593          	addi	a1,s0,-596
    802053b0:	4509                	li	a0,2
    802053b2:	ffffe097          	auipc	ra,0xffffe
    802053b6:	b78080e7          	jalr	-1160(ra) # 80202f2a <argint>
    802053ba:	24054763          	bltz	a0,80205608 <sys_openat+0x346>
    return -1;
  
  if(relative_path[0]=='/')                               // 为绝对路径 忽略dirfd
    802053be:	ca844783          	lbu	a5,-856(s0)
    802053c2:	02f00713          	li	a4,47
    802053c6:	0ce78663          	beq	a5,a4,80205492 <sys_openat+0x1d0>
  {
    memset(absolute_path,0,FAT32_MAX_PATH);
    strncpy(absolute_path,relative_path,strlen(relative_path));
  }
  else if(relative_path[0]=='.' && relative_path[1]=='/') // 为显式相对路径
    802053ca:	02e00713          	li	a4,46
    802053ce:	0ee78963          	beq	a5,a4,802054c0 <sys_openat+0x1fe>
  {
    panic("openat not support ..");
  }
  else                                                    // 为隐式相对路径
  {
    int absolute_path_old_len=strlen(absolute_path);
    802053d2:	db040913          	addi	s2,s0,-592
    802053d6:	854a                	mv	a0,s2
    802053d8:	ffffb097          	auipc	ra,0xffffb
    802053dc:	514080e7          	jalr	1300(ra) # 802008ec <strlen>
    absolute_path[absolute_path_old_len]='/';
    802053e0:	fc040793          	addi	a5,s0,-64
    802053e4:	97aa                	add	a5,a5,a0
    802053e6:	02f00713          	li	a4,47
    802053ea:	dee78823          	sb	a4,-528(a5)
    absolute_path[absolute_path_old_len+1]='\0';
    802053ee:	2505                	addiw	a0,a0,1
    802053f0:	fc040793          	addi	a5,s0,-64
    802053f4:	953e                	add	a0,a0,a5
    802053f6:	de050823          	sb	zero,-528(a0)
    strncpy(absolute_path+strlen(absolute_path),
    802053fa:	854a                	mv	a0,s2
    802053fc:	ffffb097          	auipc	ra,0xffffb
    80205400:	4f0080e7          	jalr	1264(ra) # 802008ec <strlen>
    80205404:	84aa                	mv	s1,a0
    80205406:	ca840993          	addi	s3,s0,-856
    8020540a:	854e                	mv	a0,s3
    8020540c:	ffffb097          	auipc	ra,0xffffb
    80205410:	4e0080e7          	jalr	1248(ra) # 802008ec <strlen>
    80205414:	862a                	mv	a2,a0
    80205416:	85ce                	mv	a1,s3
    80205418:	00990533          	add	a0,s2,s1
    8020541c:	ffffb097          	auipc	ra,0xffffb
    80205420:	460080e7          	jalr	1120(ra) # 8020087c <strncpy>
            relative_path,
            strlen(relative_path));
  }

  // 根据路径名打开文件
  if(omode & O_CREATE){                         // 创建文件
    80205424:	dac42603          	lw	a2,-596(s0)
    80205428:	24067793          	andi	a5,a2,576
    8020542c:	e7e5                	bnez	a5,80205514 <sys_openat+0x252>
    ep = create(absolute_path, T_FILE, omode);
    if(ep == NULL){
      return -1;
    }
  } 
  else if(omode & O_DIRECTORY)                  // 打开一个目录
    8020542e:	02a61793          	slli	a5,a2,0x2a
    80205432:	1607d063          	bgez	a5,80205592 <sys_openat+0x2d0>
  {
    
    if((ep=ename(absolute_path))==NULL)         // 获取目录项
    80205436:	db040513          	addi	a0,s0,-592
    8020543a:	00002097          	auipc	ra,0x2
    8020543e:	0d2080e7          	jalr	210(ra) # 8020750c <ename>
    80205442:	892a                	mv	s2,a0
    80205444:	1c050663          	beqz	a0,80205610 <sys_openat+0x34e>
    {
      return -1;
    }
    elock(ep);
    80205448:	00002097          	auipc	ra,0x2
    8020544c:	91a080e7          	jalr	-1766(ra) # 80206d62 <elock>
    if(!(ep->attribute & ATTR_DIRECTORY))       // 该文件不是目录文件
    80205450:	10094783          	lbu	a5,256(s2)
    80205454:	8bc1                	andi	a5,a5,16
    80205456:	ebe1                	bnez	a5,80205526 <sys_openat+0x264>
    {
      eunlock(ep);
    80205458:	854a                	mv	a0,s2
    8020545a:	00002097          	auipc	ra,0x2
    8020545e:	93e080e7          	jalr	-1730(ra) # 80206d98 <eunlock>
      eput(ep);
    80205462:	854a                	mv	a0,s2
    80205464:	00002097          	auipc	ra,0x2
    80205468:	982080e7          	jalr	-1662(ra) # 80206de6 <eput>
      return -1;
    8020546c:	557d                	li	a0,-1
    8020546e:	aa95                	j	802055e2 <sys_openat+0x320>
    de=myproc()->ofile[dirfd]->ep;
    80205470:	ffffc097          	auipc	ra,0xffffc
    80205474:	604080e7          	jalr	1540(ra) # 80201a74 <myproc>
    80205478:	fbc42783          	lw	a5,-68(s0)
    8020547c:	07e9                	addi	a5,a5,26
    8020547e:	078e                	slli	a5,a5,0x3
    80205480:	97aa                	add	a5,a5,a0
    80205482:	679c                	ld	a5,8(a5)
    80205484:	6f84                	ld	s1,24(a5)
    80205486:	b561                	j	8020530e <sys_openat+0x4c>
    s = "/";
    80205488:	00005997          	auipc	s3,0x5
    8020548c:	1a898993          	addi	s3,s3,424 # 8020a630 <digits+0x2b0>
    80205490:	bde9                	j	8020536a <sys_openat+0xa8>
    memset(absolute_path,0,FAT32_MAX_PATH);
    80205492:	10400613          	li	a2,260
    80205496:	4581                	li	a1,0
    80205498:	8526                	mv	a0,s1
    8020549a:	ffffb097          	auipc	ra,0xffffb
    8020549e:	2ca080e7          	jalr	714(ra) # 80200764 <memset>
    strncpy(absolute_path,relative_path,strlen(relative_path));
    802054a2:	ca840913          	addi	s2,s0,-856
    802054a6:	854a                	mv	a0,s2
    802054a8:	ffffb097          	auipc	ra,0xffffb
    802054ac:	444080e7          	jalr	1092(ra) # 802008ec <strlen>
    802054b0:	862a                	mv	a2,a0
    802054b2:	85ca                	mv	a1,s2
    802054b4:	8526                	mv	a0,s1
    802054b6:	ffffb097          	auipc	ra,0xffffb
    802054ba:	3c6080e7          	jalr	966(ra) # 8020087c <strncpy>
    802054be:	b79d                	j	80205424 <sys_openat+0x162>
  else if(relative_path[0]=='.' && relative_path[1]=='/') // 为显式相对路径
    802054c0:	ca944783          	lbu	a5,-855(s0)
    802054c4:	02f00713          	li	a4,47
    802054c8:	00e78e63          	beq	a5,a4,802054e4 <sys_openat+0x222>
  else if (relative_path[0]=='.' && relative_path[1]=='.')// 显示相对路径 没有实现
    802054cc:	02e00713          	li	a4,46
    802054d0:	f0e791e3          	bne	a5,a4,802053d2 <sys_openat+0x110>
    panic("openat not support ..");
    802054d4:	00005517          	auipc	a0,0x5
    802054d8:	76c50513          	addi	a0,a0,1900 # 8020ac40 <digits+0x8c0>
    802054dc:	ffffb097          	auipc	ra,0xffffb
    802054e0:	c66080e7          	jalr	-922(ra) # 80200142 <panic>
    strncpy(absolute_path+strlen(absolute_path),
    802054e4:	db040913          	addi	s2,s0,-592
    802054e8:	854a                	mv	a0,s2
    802054ea:	ffffb097          	auipc	ra,0xffffb
    802054ee:	402080e7          	jalr	1026(ra) # 802008ec <strlen>
    802054f2:	84aa                	mv	s1,a0
    802054f4:	ca940993          	addi	s3,s0,-855
    802054f8:	854e                	mv	a0,s3
    802054fa:	ffffb097          	auipc	ra,0xffffb
    802054fe:	3f2080e7          	jalr	1010(ra) # 802008ec <strlen>
    80205502:	862a                	mv	a2,a0
    80205504:	85ce                	mv	a1,s3
    80205506:	00990533          	add	a0,s2,s1
    8020550a:	ffffb097          	auipc	ra,0xffffb
    8020550e:	372080e7          	jalr	882(ra) # 8020087c <strncpy>
    80205512:	bf09                	j	80205424 <sys_openat+0x162>
    ep = create(absolute_path, T_FILE, omode);
    80205514:	4589                	li	a1,2
    80205516:	db040513          	addi	a0,s0,-592
    8020551a:	fffff097          	auipc	ra,0xfffff
    8020551e:	290080e7          	jalr	656(ra) # 802047aa <create>
    80205522:	892a                	mv	s2,a0
    if(ep == NULL){
    80205524:	c565                	beqz	a0,8020560c <sys_openat+0x34a>
      return -1;
    }
  }

  
  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80205526:	ffffe097          	auipc	ra,0xffffe
    8020552a:	616080e7          	jalr	1558(ra) # 80203b3c <filealloc>
    8020552e:	89aa                	mv	s3,a0
    80205530:	c96d                	beqz	a0,80205622 <sys_openat+0x360>
    80205532:	fffff097          	auipc	ra,0xfffff
    80205536:	236080e7          	jalr	566(ra) # 80204768 <fdalloc>
    8020553a:	84aa                	mv	s1,a0
    8020553c:	0c054e63          	bltz	a0,80205618 <sys_openat+0x356>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    80205540:	10094783          	lbu	a5,256(s2)
    80205544:	8bc1                	andi	a5,a5,16
    80205546:	e791                	bnez	a5,80205552 <sys_openat+0x290>
    80205548:	dac42783          	lw	a5,-596(s0)
    8020554c:	4007f793          	andi	a5,a5,1024
    80205550:	e3c1                	bnez	a5,802055d0 <sys_openat+0x30e>
    etrunc(ep);
  }

  // 设置权限
  f->type = FD_ENTRY;
    80205552:	4789                	li	a5,2
    80205554:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    80205558:	dac42783          	lw	a5,-596(s0)
    8020555c:	0047f693          	andi	a3,a5,4
    80205560:	4701                	li	a4,0
    80205562:	c299                	beqz	a3,80205568 <sys_openat+0x2a6>
    80205564:	10892703          	lw	a4,264(s2)
    80205568:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    8020556c:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    80205570:	0017c713          	xori	a4,a5,1
    80205574:	8b05                	andi	a4,a4,1
    80205576:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    8020557a:	8b8d                	andi	a5,a5,3
    8020557c:	00f037b3          	snez	a5,a5
    80205580:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    80205584:	854a                	mv	a0,s2
    80205586:	00002097          	auipc	ra,0x2
    8020558a:	812080e7          	jalr	-2030(ra) # 80206d98 <eunlock>

  return fd;
    8020558e:	8526                	mv	a0,s1
    80205590:	a889                	j	802055e2 <sys_openat+0x320>
    if((ep = ename(absolute_path)) == NULL){
    80205592:	db040513          	addi	a0,s0,-592
    80205596:	00002097          	auipc	ra,0x2
    8020559a:	f76080e7          	jalr	-138(ra) # 8020750c <ename>
    8020559e:	892a                	mv	s2,a0
    802055a0:	c935                	beqz	a0,80205614 <sys_openat+0x352>
    elock(ep);
    802055a2:	00001097          	auipc	ra,0x1
    802055a6:	7c0080e7          	jalr	1984(ra) # 80206d62 <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    802055aa:	10094783          	lbu	a5,256(s2)
    802055ae:	8bc1                	andi	a5,a5,16
    802055b0:	dbbd                	beqz	a5,80205526 <sys_openat+0x264>
    802055b2:	dac42783          	lw	a5,-596(s0)
    802055b6:	dba5                	beqz	a5,80205526 <sys_openat+0x264>
      eunlock(ep);
    802055b8:	854a                	mv	a0,s2
    802055ba:	00001097          	auipc	ra,0x1
    802055be:	7de080e7          	jalr	2014(ra) # 80206d98 <eunlock>
      eput(ep);
    802055c2:	854a                	mv	a0,s2
    802055c4:	00002097          	auipc	ra,0x2
    802055c8:	822080e7          	jalr	-2014(ra) # 80206de6 <eput>
      return -1;
    802055cc:	557d                	li	a0,-1
    802055ce:	a811                	j	802055e2 <sys_openat+0x320>
    etrunc(ep);
    802055d0:	854a                	mv	a0,s2
    802055d2:	00001097          	auipc	ra,0x1
    802055d6:	726080e7          	jalr	1830(ra) # 80206cf8 <etrunc>
    802055da:	bfa5                	j	80205552 <sys_openat+0x290>
    return -1;
    802055dc:	557d                	li	a0,-1
    802055de:	a011                	j	802055e2 <sys_openat+0x320>
        return -1;
    802055e0:	557d                	li	a0,-1
}
    802055e2:	35813083          	ld	ra,856(sp)
    802055e6:	35013403          	ld	s0,848(sp)
    802055ea:	34813483          	ld	s1,840(sp)
    802055ee:	34013903          	ld	s2,832(sp)
    802055f2:	33813983          	ld	s3,824(sp)
    802055f6:	33013a03          	ld	s4,816(sp)
    802055fa:	32813a83          	ld	s5,808(sp)
    802055fe:	36010113          	addi	sp,sp,864
    80205602:	8082                	ret
    return -1;
    80205604:	557d                	li	a0,-1
    80205606:	bff1                	j	802055e2 <sys_openat+0x320>
    80205608:	557d                	li	a0,-1
    8020560a:	bfe1                	j	802055e2 <sys_openat+0x320>
      return -1;
    8020560c:	557d                	li	a0,-1
    8020560e:	bfd1                	j	802055e2 <sys_openat+0x320>
      return -1;
    80205610:	557d                	li	a0,-1
    80205612:	bfc1                	j	802055e2 <sys_openat+0x320>
      return -1;
    80205614:	557d                	li	a0,-1
    80205616:	b7f1                	j	802055e2 <sys_openat+0x320>
      fileclose(f);
    80205618:	854e                	mv	a0,s3
    8020561a:	ffffe097          	auipc	ra,0xffffe
    8020561e:	5de080e7          	jalr	1502(ra) # 80203bf8 <fileclose>
    eunlock(ep);
    80205622:	854a                	mv	a0,s2
    80205624:	00001097          	auipc	ra,0x1
    80205628:	774080e7          	jalr	1908(ra) # 80206d98 <eunlock>
    eput(ep);
    8020562c:	854a                	mv	a0,s2
    8020562e:	00001097          	auipc	ra,0x1
    80205632:	7b8080e7          	jalr	1976(ra) # 80206de6 <eput>
    return -1;
    80205636:	557d                	li	a0,-1
    80205638:	b76d                	j	802055e2 <sys_openat+0x320>

000000008020563a <sys_mkdirat>:


// added by lmq for SYS_mkdirat
uint64
sys_mkdirat(void)
{
    8020563a:	da010113          	addi	sp,sp,-608
    8020563e:	24113c23          	sd	ra,600(sp)
    80205642:	24813823          	sd	s0,592(sp)
    80205646:	24913423          	sd	s1,584(sp)
    8020564a:	25213023          	sd	s2,576(sp)
    8020564e:	23313c23          	sd	s3,568(sp)
    80205652:	23413823          	sd	s4,560(sp)
    80205656:	23513423          	sd	s5,552(sp)
    8020565a:	1480                	addi	s0,sp,608
  int dirfd,omode;
  char des_path[FAT32_MAX_PATH];
  if(argint(0, &dirfd) < 0 || argstr(1,des_path,FAT32_MAX_PATH)<0 || argint(2,&omode)<0)
    8020565c:	fbc40593          	addi	a1,s0,-68
    80205660:	4501                	li	a0,0
    80205662:	ffffe097          	auipc	ra,0xffffe
    80205666:	8c8080e7          	jalr	-1848(ra) # 80202f2a <argint>
    8020566a:	20054663          	bltz	a0,80205876 <sys_mkdirat+0x23c>
    8020566e:	10400613          	li	a2,260
    80205672:	eb040593          	addi	a1,s0,-336
    80205676:	4505                	li	a0,1
    80205678:	ffffe097          	auipc	ra,0xffffe
    8020567c:	936080e7          	jalr	-1738(ra) # 80202fae <argstr>
    80205680:	20054d63          	bltz	a0,8020589a <sys_mkdirat+0x260>
    80205684:	fb840593          	addi	a1,s0,-72
    80205688:	4509                	li	a0,2
    8020568a:	ffffe097          	auipc	ra,0xffffe
    8020568e:	8a0080e7          	jalr	-1888(ra) # 80202f2a <argint>
    80205692:	20054663          	bltz	a0,8020589e <sys_mkdirat+0x264>
    return -1;


  // 如果dirfd不为AT_FDCWD 则获得dirfd的路径
  char cur_path[FAT32_MAX_PATH];
  memset(cur_path,0,FAT32_MAX_PATH);
    80205696:	10400613          	li	a2,260
    8020569a:	4581                	li	a1,0
    8020569c:	da840513          	addi	a0,s0,-600
    802056a0:	ffffb097          	auipc	ra,0xffffb
    802056a4:	0c4080e7          	jalr	196(ra) # 80200764 <memset>
  char* s=NULL;
  int len;
  if(dirfd!=AT_FDCWD)
    802056a8:	fbc42703          	lw	a4,-68(s0)
    802056ac:	f9c00793          	li	a5,-100
    802056b0:	10f70963          	beq	a4,a5,802057c2 <sys_mkdirat+0x188>
  {
    struct dirent* de=myproc()->ofile[dirfd]->ep;
    802056b4:	ffffc097          	auipc	ra,0xffffc
    802056b8:	3c0080e7          	jalr	960(ra) # 80201a74 <myproc>
    802056bc:	fbc42783          	lw	a5,-68(s0)
    802056c0:	07e9                	addi	a5,a5,26
    802056c2:	078e                	slli	a5,a5,0x3
    802056c4:	97aa                	add	a5,a5,a0
    802056c6:	679c                	ld	a5,8(a5)
    802056c8:	6f84                	ld	s1,24(a5)
    if (de->parent == NULL) {
    802056ca:	1204b783          	ld	a5,288(s1)
    802056ce:	12078063          	beqz	a5,802057ee <sys_mkdirat+0x1b4>
      s = "/";
    } 
    else {
      s = cur_path + FAT32_MAX_PATH - 1;
      *s = '\0';
    802056d2:	ea0405a3          	sb	zero,-341(s0)
      s = cur_path + FAT32_MAX_PATH - 1;
    802056d6:	eab40993          	addi	s3,s0,-341
      while (de->parent) {
        len = strlen(de->filename);
        s -= len;
        if (s <= cur_path)          // can't reach root "/"
    802056da:	da840a13          	addi	s4,s0,-600
          return -1;
        strncpy(s, de->filename, len);
        *--s = '/';
    802056de:	02f00a93          	li	s5,47
        len = strlen(de->filename);
    802056e2:	8526                	mv	a0,s1
    802056e4:	ffffb097          	auipc	ra,0xffffb
    802056e8:	208080e7          	jalr	520(ra) # 802008ec <strlen>
    802056ec:	862a                	mv	a2,a0
        s -= len;
    802056ee:	40a98933          	sub	s2,s3,a0
        if (s <= cur_path)          // can't reach root "/"
    802056f2:	1b2a7863          	bgeu	s4,s2,802058a2 <sys_mkdirat+0x268>
        strncpy(s, de->filename, len);
    802056f6:	85a6                	mv	a1,s1
    802056f8:	854a                	mv	a0,s2
    802056fa:	ffffb097          	auipc	ra,0xffffb
    802056fe:	182080e7          	jalr	386(ra) # 8020087c <strncpy>
        *--s = '/';
    80205702:	fff90993          	addi	s3,s2,-1
    80205706:	ff590fa3          	sb	s5,-1(s2)
        de = de->parent;
    8020570a:	1204b483          	ld	s1,288(s1)
      while (de->parent) {
    8020570e:	1204b783          	ld	a5,288(s1)
    80205712:	fbe1                	bnez	a5,802056e2 <sys_mkdirat+0xa8>
      }
    }
    memset(cur_path,0,FAT32_MAX_PATH);
    80205714:	10400613          	li	a2,260
    80205718:	4581                	li	a1,0
    8020571a:	da840493          	addi	s1,s0,-600
    8020571e:	8526                	mv	a0,s1
    80205720:	ffffb097          	auipc	ra,0xffffb
    80205724:	044080e7          	jalr	68(ra) # 80200764 <memset>
    strncpy(cur_path,s,strlen(s));
    80205728:	854e                	mv	a0,s3
    8020572a:	ffffb097          	auipc	ra,0xffffb
    8020572e:	1c2080e7          	jalr	450(ra) # 802008ec <strlen>
    80205732:	862a                	mv	a2,a0
    80205734:	85ce                	mv	a1,s3
    80205736:	8526                	mv	a0,s1
    80205738:	ffffb097          	auipc	ra,0xffffb
    8020573c:	144080e7          	jalr	324(ra) # 8020087c <strncpy>
    if(des_path[0]!='/')
    80205740:	eb044783          	lbu	a5,-336(s0)
    80205744:	02f00713          	li	a4,47
    80205748:	06e78d63          	beq	a5,a4,802057c2 <sys_mkdirat+0x188>
    {
      if(des_path[0]=='.' && des_path[1]=='/')
    8020574c:	02e00713          	li	a4,46
    80205750:	0ae78463          	beq	a5,a4,802057f8 <sys_mkdirat+0x1be>
      {
        panic("mkdirat not support ..\n");
      }
      else
      {
        cur_path[strlen(cur_path)]='/';
    80205754:	da840493          	addi	s1,s0,-600
    80205758:	8526                	mv	a0,s1
    8020575a:	ffffb097          	auipc	ra,0xffffb
    8020575e:	192080e7          	jalr	402(ra) # 802008ec <strlen>
    80205762:	fc040793          	addi	a5,s0,-64
    80205766:	953e                	add	a0,a0,a5
    80205768:	02f00793          	li	a5,47
    8020576c:	def50423          	sb	a5,-536(a0)
        strncpy(cur_path+strlen(cur_path),des_path,strlen(des_path));
    80205770:	8526                	mv	a0,s1
    80205772:	ffffb097          	auipc	ra,0xffffb
    80205776:	17a080e7          	jalr	378(ra) # 802008ec <strlen>
    8020577a:	89aa                	mv	s3,a0
    8020577c:	eb040913          	addi	s2,s0,-336
    80205780:	854a                	mv	a0,s2
    80205782:	ffffb097          	auipc	ra,0xffffb
    80205786:	16a080e7          	jalr	362(ra) # 802008ec <strlen>
    8020578a:	862a                	mv	a2,a0
    8020578c:	85ca                	mv	a1,s2
    8020578e:	01348533          	add	a0,s1,s3
    80205792:	ffffb097          	auipc	ra,0xffffb
    80205796:	0ea080e7          	jalr	234(ra) # 8020087c <strncpy>
        memset(des_path,0,FAT32_MAX_PATH);
    8020579a:	10400613          	li	a2,260
    8020579e:	4581                	li	a1,0
    802057a0:	854a                	mv	a0,s2
    802057a2:	ffffb097          	auipc	ra,0xffffb
    802057a6:	fc2080e7          	jalr	-62(ra) # 80200764 <memset>
        strncpy(des_path,cur_path,strlen(cur_path));
    802057aa:	8526                	mv	a0,s1
    802057ac:	ffffb097          	auipc	ra,0xffffb
    802057b0:	140080e7          	jalr	320(ra) # 802008ec <strlen>
    802057b4:	862a                	mv	a2,a0
    802057b6:	85a6                	mv	a1,s1
    802057b8:	854a                	mv	a0,s2
    802057ba:	ffffb097          	auipc	ra,0xffffb
    802057be:	0c2080e7          	jalr	194(ra) # 8020087c <strncpy>
    }
    
  }

  struct dirent* ep;
  if((ep = create(des_path, T_DIR, omode)) == 0)
    802057c2:	fb842603          	lw	a2,-72(s0)
    802057c6:	4585                	li	a1,1
    802057c8:	eb040513          	addi	a0,s0,-336
    802057cc:	fffff097          	auipc	ra,0xfffff
    802057d0:	fde080e7          	jalr	-34(ra) # 802047aa <create>
    802057d4:	84aa                	mv	s1,a0
    802057d6:	c961                	beqz	a0,802058a6 <sys_mkdirat+0x26c>
  {
    return -1;
  }

  eunlock(ep);
    802057d8:	00001097          	auipc	ra,0x1
    802057dc:	5c0080e7          	jalr	1472(ra) # 80206d98 <eunlock>
  eput(ep);
    802057e0:	8526                	mv	a0,s1
    802057e2:	00001097          	auipc	ra,0x1
    802057e6:	604080e7          	jalr	1540(ra) # 80206de6 <eput>
  return 0;
    802057ea:	4501                	li	a0,0
    802057ec:	a071                	j	80205878 <sys_mkdirat+0x23e>
      s = "/";
    802057ee:	00005997          	auipc	s3,0x5
    802057f2:	e4298993          	addi	s3,s3,-446 # 8020a630 <digits+0x2b0>
    802057f6:	bf39                	j	80205714 <sys_mkdirat+0xda>
      if(des_path[0]=='.' && des_path[1]=='/')
    802057f8:	eb144783          	lbu	a5,-335(s0)
    802057fc:	02f00713          	li	a4,47
    80205800:	00e78e63          	beq	a5,a4,8020581c <sys_mkdirat+0x1e2>
      else if(des_path[0]=='.' && des_path[1]=='.')
    80205804:	02e00713          	li	a4,46
    80205808:	f4e796e3          	bne	a5,a4,80205754 <sys_mkdirat+0x11a>
        panic("mkdirat not support ..\n");
    8020580c:	00005517          	auipc	a0,0x5
    80205810:	44c50513          	addi	a0,a0,1100 # 8020ac58 <digits+0x8d8>
    80205814:	ffffb097          	auipc	ra,0xffffb
    80205818:	92e080e7          	jalr	-1746(ra) # 80200142 <panic>
        strncpy(cur_path+strlen(cur_path),des_path+1,strlen(des_path+1));
    8020581c:	8926                	mv	s2,s1
    8020581e:	8526                	mv	a0,s1
    80205820:	ffffb097          	auipc	ra,0xffffb
    80205824:	0cc080e7          	jalr	204(ra) # 802008ec <strlen>
    80205828:	84aa                	mv	s1,a0
    8020582a:	eb140993          	addi	s3,s0,-335
    8020582e:	854e                	mv	a0,s3
    80205830:	ffffb097          	auipc	ra,0xffffb
    80205834:	0bc080e7          	jalr	188(ra) # 802008ec <strlen>
    80205838:	862a                	mv	a2,a0
    8020583a:	85ce                	mv	a1,s3
    8020583c:	00990533          	add	a0,s2,s1
    80205840:	ffffb097          	auipc	ra,0xffffb
    80205844:	03c080e7          	jalr	60(ra) # 8020087c <strncpy>
        memset(des_path,0,FAT32_MAX_PATH);
    80205848:	10400613          	li	a2,260
    8020584c:	4581                	li	a1,0
    8020584e:	eb040493          	addi	s1,s0,-336
    80205852:	8526                	mv	a0,s1
    80205854:	ffffb097          	auipc	ra,0xffffb
    80205858:	f10080e7          	jalr	-240(ra) # 80200764 <memset>
        strncpy(des_path,cur_path,strlen(cur_path));
    8020585c:	854a                	mv	a0,s2
    8020585e:	ffffb097          	auipc	ra,0xffffb
    80205862:	08e080e7          	jalr	142(ra) # 802008ec <strlen>
    80205866:	862a                	mv	a2,a0
    80205868:	85ca                	mv	a1,s2
    8020586a:	8526                	mv	a0,s1
    8020586c:	ffffb097          	auipc	ra,0xffffb
    80205870:	010080e7          	jalr	16(ra) # 8020087c <strncpy>
    80205874:	b7b9                	j	802057c2 <sys_mkdirat+0x188>
    return -1;
    80205876:	557d                	li	a0,-1
}
    80205878:	25813083          	ld	ra,600(sp)
    8020587c:	25013403          	ld	s0,592(sp)
    80205880:	24813483          	ld	s1,584(sp)
    80205884:	24013903          	ld	s2,576(sp)
    80205888:	23813983          	ld	s3,568(sp)
    8020588c:	23013a03          	ld	s4,560(sp)
    80205890:	22813a83          	ld	s5,552(sp)
    80205894:	26010113          	addi	sp,sp,608
    80205898:	8082                	ret
    return -1;
    8020589a:	557d                	li	a0,-1
    8020589c:	bff1                	j	80205878 <sys_mkdirat+0x23e>
    8020589e:	557d                	li	a0,-1
    802058a0:	bfe1                	j	80205878 <sys_mkdirat+0x23e>
          return -1;
    802058a2:	557d                	li	a0,-1
    802058a4:	bfd1                	j	80205878 <sys_mkdirat+0x23e>
    return -1;
    802058a6:	557d                	li	a0,-1
    802058a8:	bfc1                	j	80205878 <sys_mkdirat+0x23e>

00000000802058aa <sys_dup3>:

// added by lmq for SYS_dup3
uint64
sys_dup3(void)
{
    802058aa:	7179                	addi	sp,sp,-48
    802058ac:	f406                	sd	ra,40(sp)
    802058ae:	f022                	sd	s0,32(sp)
    802058b0:	ec26                	sd	s1,24(sp)
    802058b2:	1800                	addi	s0,sp,48
  struct file *f;
  int new_fd;
  struct proc* p=myproc();
    802058b4:	ffffc097          	auipc	ra,0xffffc
    802058b8:	1c0080e7          	jalr	448(ra) # 80201a74 <myproc>
    802058bc:	84aa                	mv	s1,a0

  if(argfd(0, 0, &f) < 0 || argint(1,&new_fd)<0)
    802058be:	fd840613          	addi	a2,s0,-40
    802058c2:	4581                	li	a1,0
    802058c4:	4501                	li	a0,0
    802058c6:	fffff097          	auipc	ra,0xfffff
    802058ca:	e3a080e7          	jalr	-454(ra) # 80204700 <argfd>
    return -1;
    802058ce:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(1,&new_fd)<0)
    802058d0:	02054263          	bltz	a0,802058f4 <sys_dup3+0x4a>
    802058d4:	fd440593          	addi	a1,s0,-44
    802058d8:	4505                	li	a0,1
    802058da:	ffffd097          	auipc	ra,0xffffd
    802058de:	650080e7          	jalr	1616(ra) # 80202f2a <argint>
    802058e2:	02054963          	bltz	a0,80205914 <sys_dup3+0x6a>
  if(p->ofile[new_fd]!=0)        // 文件描述符[new_fd]已被占用
    802058e6:	fd442503          	lw	a0,-44(s0)
    802058ea:	050e                	slli	a0,a0,0x3
    802058ec:	94aa                	add	s1,s1,a0
    802058ee:	6cf8                	ld	a4,216(s1)
  {
    return -1;
    802058f0:	57fd                	li	a5,-1
  if(p->ofile[new_fd]!=0)        // 文件描述符[new_fd]已被占用
    802058f2:	c719                	beqz	a4,80205900 <sys_dup3+0x56>
  }
  p->ofile[new_fd] = f;
  filedup(f);
  return new_fd;
}
    802058f4:	853e                	mv	a0,a5
    802058f6:	70a2                	ld	ra,40(sp)
    802058f8:	7402                	ld	s0,32(sp)
    802058fa:	64e2                	ld	s1,24(sp)
    802058fc:	6145                	addi	sp,sp,48
    802058fe:	8082                	ret
  p->ofile[new_fd] = f;
    80205900:	fd843503          	ld	a0,-40(s0)
    80205904:	ece8                	sd	a0,216(s1)
  filedup(f);
    80205906:	ffffe097          	auipc	ra,0xffffe
    8020590a:	2a0080e7          	jalr	672(ra) # 80203ba6 <filedup>
  return new_fd;
    8020590e:	fd442783          	lw	a5,-44(s0)
    80205912:	b7cd                	j	802058f4 <sys_dup3+0x4a>
    return -1;
    80205914:	57fd                	li	a5,-1
    80205916:	bff9                	j	802058f4 <sys_dup3+0x4a>

0000000080205918 <sys_getdents64>:
  unsigned char   d_type;	    // 文件类型    
  char            d_name[];	  // 文件名
};
uint64 
sys_getdents64(void)
{
    80205918:	7139                	addi	sp,sp,-64
    8020591a:	fc06                	sd	ra,56(sp)
    8020591c:	f822                	sd	s0,48(sp)
    8020591e:	f426                	sd	s1,40(sp)
    80205920:	0080                	addi	s0,sp,64
  int fd,len;
  struct file* f;
  struct linux_dirent64* dirp64;

  if(argfd(0,&fd,&f)<0 || argaddr(1,(uint64*)&dirp64)<0 || argint(2,&len))
    80205922:	fd040613          	addi	a2,s0,-48
    80205926:	fdc40593          	addi	a1,s0,-36
    8020592a:	4501                	li	a0,0
    8020592c:	fffff097          	auipc	ra,0xfffff
    80205930:	dd4080e7          	jalr	-556(ra) # 80204700 <argfd>
  {
    return -1;
    80205934:	54fd                	li	s1,-1
  if(argfd(0,&fd,&f)<0 || argaddr(1,(uint64*)&dirp64)<0 || argint(2,&len))
    80205936:	06054763          	bltz	a0,802059a4 <sys_getdents64+0x8c>
    8020593a:	fc840593          	addi	a1,s0,-56
    8020593e:	4505                	li	a0,1
    80205940:	ffffd097          	auipc	ra,0xffffd
    80205944:	64c080e7          	jalr	1612(ra) # 80202f8c <argaddr>
    80205948:	04054e63          	bltz	a0,802059a4 <sys_getdents64+0x8c>
    8020594c:	fd840593          	addi	a1,s0,-40
    80205950:	4509                	li	a0,2
    80205952:	ffffd097          	auipc	ra,0xffffd
    80205956:	5d8080e7          	jalr	1496(ra) # 80202f2a <argint>
    8020595a:	e529                	bnez	a0,802059a4 <sys_getdents64+0x8c>
  }
  int filename_len=strlen(f->ep->filename);
    8020595c:	fd043783          	ld	a5,-48(s0)
    80205960:	6f88                	ld	a0,24(a5)
    80205962:	ffffb097          	auipc	ra,0xffffb
    80205966:	f8a080e7          	jalr	-118(ra) # 802008ec <strlen>
    8020596a:	862a                	mv	a2,a0
  if(filename_len>len)
    8020596c:	fd842783          	lw	a5,-40(s0)
    80205970:	02a7ca63          	blt	a5,a0,802059a4 <sys_getdents64+0x8c>
  {
    return -1;
  }
  if(copyout2((uint64)dirp64->d_name, f->ep->filename, filename_len) < 0 ||
    80205974:	84aa                	mv	s1,a0
    80205976:	fd043783          	ld	a5,-48(s0)
    8020597a:	6f8c                	ld	a1,24(a5)
    8020597c:	fc843503          	ld	a0,-56(s0)
    80205980:	054d                	addi	a0,a0,19
    80205982:	ffffc097          	auipc	ra,0xffffc
    80205986:	a16080e7          	jalr	-1514(ra) # 80201398 <copyout2>
    8020598a:	02054563          	bltz	a0,802059b4 <sys_getdents64+0x9c>
    copyout2((uint64)&(dirp64->d_type),(char*)&f->type,sizeof(f->type) < 0 ))
    8020598e:	4601                	li	a2,0
    80205990:	fd043583          	ld	a1,-48(s0)
    80205994:	fc843503          	ld	a0,-56(s0)
    80205998:	0549                	addi	a0,a0,18
    8020599a:	ffffc097          	auipc	ra,0xffffc
    8020599e:	9fe080e7          	jalr	-1538(ra) # 80201398 <copyout2>
  if(copyout2((uint64)dirp64->d_name, f->ep->filename, filename_len) < 0 ||
    802059a2:	e519                	bnez	a0,802059b0 <sys_getdents64+0x98>
    return -1;

  return filename_len;
}
    802059a4:	8526                	mv	a0,s1
    802059a6:	70e2                	ld	ra,56(sp)
    802059a8:	7442                	ld	s0,48(sp)
    802059aa:	74a2                	ld	s1,40(sp)
    802059ac:	6121                	addi	sp,sp,64
    802059ae:	8082                	ret
    return -1;
    802059b0:	54fd                	li	s1,-1
    802059b2:	bfcd                	j	802059a4 <sys_getdents64+0x8c>
    802059b4:	54fd                	li	s1,-1
    802059b6:	b7fd                	j	802059a4 <sys_getdents64+0x8c>

00000000802059b8 <sys_fstat_cscc>:
        long st_ctime_nsec;
        unsigned __unused[2];
};
uint64
sys_fstat_cscc(void)
{
    802059b8:	7135                	addi	sp,sp,-160
    802059ba:	ed06                	sd	ra,152(sp)
    802059bc:	e922                	sd	s0,144(sp)
    802059be:	1100                	addi	s0,sp,160
  struct file* f;
  uint64 addr;
  if(argfd(0,0,&f)<0 || argaddr(1,&addr)<0)
    802059c0:	fe840613          	addi	a2,s0,-24
    802059c4:	4581                	li	a1,0
    802059c6:	4501                	li	a0,0
    802059c8:	fffff097          	auipc	ra,0xfffff
    802059cc:	d38080e7          	jalr	-712(ra) # 80204700 <argfd>
    802059d0:	87aa                	mv	a5,a0
  {
    return -1;
    802059d2:	557d                	li	a0,-1
  if(argfd(0,0,&f)<0 || argaddr(1,&addr)<0)
    802059d4:	0207c263          	bltz	a5,802059f8 <sys_fstat_cscc+0x40>
    802059d8:	fe040593          	addi	a1,s0,-32
    802059dc:	4505                	li	a0,1
    802059de:	ffffd097          	auipc	ra,0xffffd
    802059e2:	5ae080e7          	jalr	1454(ra) # 80202f8c <argaddr>
    802059e6:	08054d63          	bltz	a0,80205a80 <sys_fstat_cscc+0xc8>
  }

  struct kstat st;
  if(f->type!=FD_ENTRY)
    802059ea:	fe843783          	ld	a5,-24(s0)
    802059ee:	4394                	lw	a3,0(a5)
    802059f0:	4709                	li	a4,2
    return -1;
    802059f2:	557d                	li	a0,-1
  if(f->type!=FD_ENTRY)
    802059f4:	00e68663          	beq	a3,a4,80205a00 <sys_fstat_cscc+0x48>
  st.st_ctime_sec=0;
  eunlock(f->ep);
  if((copyout2(addr,(char*)&st,sizeof(struct kstat)))<0)
    return -1;
  return 0;
}
    802059f8:	60ea                	ld	ra,152(sp)
    802059fa:	644a                	ld	s0,144(sp)
    802059fc:	610d                	addi	sp,sp,160
    802059fe:	8082                	ret
  elock(f->ep);
    80205a00:	6f88                	ld	a0,24(a5)
    80205a02:	00001097          	auipc	ra,0x1
    80205a06:	360080e7          	jalr	864(ra) # 80206d62 <elock>
  st.st_dev=f->ep->dev;
    80205a0a:	fe843783          	ld	a5,-24(s0)
    80205a0e:	6f98                	ld	a4,24(a5)
    80205a10:	11474703          	lbu	a4,276(a4)
    80205a14:	f6e43023          	sd	a4,-160(s0)
  st.st_ino=0;
    80205a18:	f6043423          	sd	zero,-152(s0)
  st.st_mode=f->type;
    80205a1c:	4398                	lw	a4,0(a5)
    80205a1e:	f6e42823          	sw	a4,-144(s0)
  st.st_nlink=f->ref;
    80205a22:	43d8                	lw	a4,4(a5)
    80205a24:	f6e42a23          	sw	a4,-140(s0)
  st.st_gid=0;
    80205a28:	f6042e23          	sw	zero,-132(s0)
  st.st_uid=0;
    80205a2c:	f6042c23          	sw	zero,-136(s0)
  st.st_rdev=0;
    80205a30:	f8043023          	sd	zero,-128(s0)
  st.st_size=f->ep->file_size;
    80205a34:	6f98                	ld	a4,24(a5)
    80205a36:	10876703          	lwu	a4,264(a4)
    80205a3a:	f8e43823          	sd	a4,-112(s0)
  st.st_blocks=0;
    80205a3e:	fa043023          	sd	zero,-96(s0)
  st.st_blksize=0;
    80205a42:	f8042c23          	sw	zero,-104(s0)
  st.st_atime_sec=0;
    80205a46:	fa043423          	sd	zero,-88(s0)
  st.st_atime_nsec=0;
    80205a4a:	fa043823          	sd	zero,-80(s0)
  st.st_mtime_nsec=0;
    80205a4e:	fc043023          	sd	zero,-64(s0)
  st.st_mtime_sec=0;
    80205a52:	fa043c23          	sd	zero,-72(s0)
  st.st_ctime_nsec=0;
    80205a56:	fc043823          	sd	zero,-48(s0)
  st.st_ctime_sec=0;
    80205a5a:	fc043423          	sd	zero,-56(s0)
  eunlock(f->ep);
    80205a5e:	6f88                	ld	a0,24(a5)
    80205a60:	00001097          	auipc	ra,0x1
    80205a64:	338080e7          	jalr	824(ra) # 80206d98 <eunlock>
  if((copyout2(addr,(char*)&st,sizeof(struct kstat)))<0)
    80205a68:	08000613          	li	a2,128
    80205a6c:	f6040593          	addi	a1,s0,-160
    80205a70:	fe043503          	ld	a0,-32(s0)
    80205a74:	ffffc097          	auipc	ra,0xffffc
    80205a78:	924080e7          	jalr	-1756(ra) # 80201398 <copyout2>
    80205a7c:	957d                	srai	a0,a0,0x3f
    80205a7e:	bfad                	j	802059f8 <sys_fstat_cscc+0x40>
    return -1;
    80205a80:	557d                	li	a0,-1
    80205a82:	bf9d                	j	802059f8 <sys_fstat_cscc+0x40>

0000000080205a84 <sys_mount>:


uint64
sys_mount(void)
{
    80205a84:	1141                	addi	sp,sp,-16
    80205a86:	e422                	sd	s0,8(sp)
    80205a88:	0800                	addi	s0,sp,16
  return 0;
}
    80205a8a:	4501                	li	a0,0
    80205a8c:	6422                	ld	s0,8(sp)
    80205a8e:	0141                	addi	sp,sp,16
    80205a90:	8082                	ret

0000000080205a92 <sys_umount2>:


uint64 
sys_umount2(void)
{
    80205a92:	1141                	addi	sp,sp,-16
    80205a94:	e422                	sd	s0,8(sp)
    80205a96:	0800                	addi	s0,sp,16
  return 0;
    80205a98:	4501                	li	a0,0
    80205a9a:	6422                	ld	s0,8(sp)
    80205a9c:	0141                	addi	sp,sp,16
    80205a9e:	8082                	ret

0000000080205aa0 <kernelvec>:
    80205aa0:	7111                	addi	sp,sp,-256
    80205aa2:	e006                	sd	ra,0(sp)
    80205aa4:	e40a                	sd	sp,8(sp)
    80205aa6:	e80e                	sd	gp,16(sp)
    80205aa8:	ec12                	sd	tp,24(sp)
    80205aaa:	f016                	sd	t0,32(sp)
    80205aac:	f41a                	sd	t1,40(sp)
    80205aae:	f81e                	sd	t2,48(sp)
    80205ab0:	fc22                	sd	s0,56(sp)
    80205ab2:	e0a6                	sd	s1,64(sp)
    80205ab4:	e4aa                	sd	a0,72(sp)
    80205ab6:	e8ae                	sd	a1,80(sp)
    80205ab8:	ecb2                	sd	a2,88(sp)
    80205aba:	f0b6                	sd	a3,96(sp)
    80205abc:	f4ba                	sd	a4,104(sp)
    80205abe:	f8be                	sd	a5,112(sp)
    80205ac0:	fcc2                	sd	a6,120(sp)
    80205ac2:	e146                	sd	a7,128(sp)
    80205ac4:	e54a                	sd	s2,136(sp)
    80205ac6:	e94e                	sd	s3,144(sp)
    80205ac8:	ed52                	sd	s4,152(sp)
    80205aca:	f156                	sd	s5,160(sp)
    80205acc:	f55a                	sd	s6,168(sp)
    80205ace:	f95e                	sd	s7,176(sp)
    80205ad0:	fd62                	sd	s8,184(sp)
    80205ad2:	e1e6                	sd	s9,192(sp)
    80205ad4:	e5ea                	sd	s10,200(sp)
    80205ad6:	e9ee                	sd	s11,208(sp)
    80205ad8:	edf2                	sd	t3,216(sp)
    80205ada:	f1f6                	sd	t4,224(sp)
    80205adc:	f5fa                	sd	t5,232(sp)
    80205ade:	f9fe                	sd	t6,240(sp)
    80205ae0:	fcdfc0ef          	jal	ra,80202aac <kerneltrap>
    80205ae4:	6082                	ld	ra,0(sp)
    80205ae6:	6122                	ld	sp,8(sp)
    80205ae8:	61c2                	ld	gp,16(sp)
    80205aea:	7282                	ld	t0,32(sp)
    80205aec:	7322                	ld	t1,40(sp)
    80205aee:	73c2                	ld	t2,48(sp)
    80205af0:	7462                	ld	s0,56(sp)
    80205af2:	6486                	ld	s1,64(sp)
    80205af4:	6526                	ld	a0,72(sp)
    80205af6:	65c6                	ld	a1,80(sp)
    80205af8:	6666                	ld	a2,88(sp)
    80205afa:	7686                	ld	a3,96(sp)
    80205afc:	7726                	ld	a4,104(sp)
    80205afe:	77c6                	ld	a5,112(sp)
    80205b00:	7866                	ld	a6,120(sp)
    80205b02:	688a                	ld	a7,128(sp)
    80205b04:	692a                	ld	s2,136(sp)
    80205b06:	69ca                	ld	s3,144(sp)
    80205b08:	6a6a                	ld	s4,152(sp)
    80205b0a:	7a8a                	ld	s5,160(sp)
    80205b0c:	7b2a                	ld	s6,168(sp)
    80205b0e:	7bca                	ld	s7,176(sp)
    80205b10:	7c6a                	ld	s8,184(sp)
    80205b12:	6c8e                	ld	s9,192(sp)
    80205b14:	6d2e                	ld	s10,200(sp)
    80205b16:	6dce                	ld	s11,208(sp)
    80205b18:	6e6e                	ld	t3,216(sp)
    80205b1a:	7e8e                	ld	t4,224(sp)
    80205b1c:	7f2e                	ld	t5,232(sp)
    80205b1e:	7fce                	ld	t6,240(sp)
    80205b20:	6111                	addi	sp,sp,256
    80205b22:	10200073          	sret
	...

0000000080205b2e <timerinit>:
#include "include/proc.h"

struct spinlock tickslock;
uint ticks;

void timerinit() {
    80205b2e:	1141                	addi	sp,sp,-16
    80205b30:	e406                	sd	ra,8(sp)
    80205b32:	e022                	sd	s0,0(sp)
    80205b34:	0800                	addi	s0,sp,16
    initlock(&tickslock, "time");
    80205b36:	00005597          	auipc	a1,0x5
    80205b3a:	13a58593          	addi	a1,a1,314 # 8020ac70 <digits+0x8f0>
    80205b3e:	0001b517          	auipc	a0,0x1b
    80205b42:	8ca50513          	addi	a0,a0,-1846 # 80220408 <tickslock>
    80205b46:	ffffb097          	auipc	ra,0xffffb
    80205b4a:	b3e080e7          	jalr	-1218(ra) # 80200684 <initlock>
    #ifdef DEBUG
    printf("timerinit\n");
    #endif
}
    80205b4e:	60a2                	ld	ra,8(sp)
    80205b50:	6402                	ld	s0,0(sp)
    80205b52:	0141                	addi	sp,sp,16
    80205b54:	8082                	ret

0000000080205b56 <set_next_timeout>:

void
set_next_timeout() {
    80205b56:	1141                	addi	sp,sp,-16
    80205b58:	e422                	sd	s0,8(sp)
    80205b5a:	0800                	addi	s0,sp,16
  asm volatile("rdtime %0" : "=r" (x) );
    80205b5c:	c0102573          	rdtime	a0
    // if comment the `printf` line below
    // the timer will not work.

    // this bug seems to disappear automatically
    // printf("");
    sbi_set_timer(r_time() + INTERVAL);
    80205b60:	001dc7b7          	lui	a5,0x1dc
    80205b64:	13078793          	addi	a5,a5,304 # 1dc130 <_entry-0x80023ed0>
    80205b68:	953e                	add	a0,a0,a5
	SBI_CALL_1(SBI_SET_TIMER, stime_value);
    80205b6a:	4581                	li	a1,0
    80205b6c:	4601                	li	a2,0
    80205b6e:	4681                	li	a3,0
    80205b70:	4881                	li	a7,0
    80205b72:	00000073          	ecall
}
    80205b76:	6422                	ld	s0,8(sp)
    80205b78:	0141                	addi	sp,sp,16
    80205b7a:	8082                	ret

0000000080205b7c <timer_tick>:

void timer_tick() {
    80205b7c:	1101                	addi	sp,sp,-32
    80205b7e:	ec06                	sd	ra,24(sp)
    80205b80:	e822                	sd	s0,16(sp)
    80205b82:	e426                	sd	s1,8(sp)
    80205b84:	1000                	addi	s0,sp,32
    acquire(&tickslock);
    80205b86:	0001b497          	auipc	s1,0x1b
    80205b8a:	88248493          	addi	s1,s1,-1918 # 80220408 <tickslock>
    80205b8e:	8526                	mv	a0,s1
    80205b90:	ffffb097          	auipc	ra,0xffffb
    80205b94:	b38080e7          	jalr	-1224(ra) # 802006c8 <acquire>
    ticks++;
    80205b98:	4c9c                	lw	a5,24(s1)
    80205b9a:	2785                	addiw	a5,a5,1
    80205b9c:	cc9c                	sw	a5,24(s1)
    wakeup(&ticks);
    80205b9e:	0001b517          	auipc	a0,0x1b
    80205ba2:	88250513          	addi	a0,a0,-1918 # 80220420 <ticks>
    80205ba6:	ffffd097          	auipc	ra,0xffffd
    80205baa:	8b2080e7          	jalr	-1870(ra) # 80202458 <wakeup>
    release(&tickslock);
    80205bae:	8526                	mv	a0,s1
    80205bb0:	ffffb097          	auipc	ra,0xffffb
    80205bb4:	b6c080e7          	jalr	-1172(ra) # 8020071c <release>
    set_next_timeout();
    80205bb8:	00000097          	auipc	ra,0x0
    80205bbc:	f9e080e7          	jalr	-98(ra) # 80205b56 <set_next_timeout>
}
    80205bc0:	60e2                	ld	ra,24(sp)
    80205bc2:	6442                	ld	s0,16(sp)
    80205bc4:	64a2                	ld	s1,8(sp)
    80205bc6:	6105                	addi	sp,sp,32
    80205bc8:	8082                	ret

0000000080205bca <disk_init>:
#else
#include "include/virtio.h"
#endif 

void disk_init(void)
{
    80205bca:	1141                	addi	sp,sp,-16
    80205bcc:	e406                	sd	ra,8(sp)
    80205bce:	e022                	sd	s0,0(sp)
    80205bd0:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_init();
    80205bd2:	00002097          	auipc	ra,0x2
    80205bd6:	e82080e7          	jalr	-382(ra) # 80207a54 <virtio_disk_init>
	#else 
	sdcard_init();
    #endif
}
    80205bda:	60a2                	ld	ra,8(sp)
    80205bdc:	6402                	ld	s0,0(sp)
    80205bde:	0141                	addi	sp,sp,16
    80205be0:	8082                	ret

0000000080205be2 <disk_read>:

void disk_read(struct buf *b)
{
    80205be2:	1141                	addi	sp,sp,-16
    80205be4:	e406                	sd	ra,8(sp)
    80205be6:	e022                	sd	s0,0(sp)
    80205be8:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 0);
    80205bea:	4581                	li	a1,0
    80205bec:	00002097          	auipc	ra,0x2
    80205bf0:	ff0080e7          	jalr	-16(ra) # 80207bdc <virtio_disk_rw>
    #else 
	sdcard_read_sector(b->data, b->sectorno);
	#endif
}
    80205bf4:	60a2                	ld	ra,8(sp)
    80205bf6:	6402                	ld	s0,0(sp)
    80205bf8:	0141                	addi	sp,sp,16
    80205bfa:	8082                	ret

0000000080205bfc <disk_write>:

void disk_write(struct buf *b)
{
    80205bfc:	1141                	addi	sp,sp,-16
    80205bfe:	e406                	sd	ra,8(sp)
    80205c00:	e022                	sd	s0,0(sp)
    80205c02:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 1);
    80205c04:	4585                	li	a1,1
    80205c06:	00002097          	auipc	ra,0x2
    80205c0a:	fd6080e7          	jalr	-42(ra) # 80207bdc <virtio_disk_rw>
    #else 
	sdcard_write_sector(b->data, b->sectorno);
	#endif
}
    80205c0e:	60a2                	ld	ra,8(sp)
    80205c10:	6402                	ld	s0,0(sp)
    80205c12:	0141                	addi	sp,sp,16
    80205c14:	8082                	ret

0000000080205c16 <disk_intr>:

void disk_intr(void)
{
    80205c16:	1141                	addi	sp,sp,-16
    80205c18:	e406                	sd	ra,8(sp)
    80205c1a:	e022                	sd	s0,0(sp)
    80205c1c:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_intr();
    80205c1e:	00002097          	auipc	ra,0x2
    80205c22:	26c080e7          	jalr	620(ra) # 80207e8a <virtio_disk_intr>
    #else 
    dmac_intr(DMAC_CHANNEL0);
    #endif
}
    80205c26:	60a2                	ld	ra,8(sp)
    80205c28:	6402                	ld	s0,0(sp)
    80205c2a:	0141                	addi	sp,sp,16
    80205c2c:	8082                	ret

0000000080205c2e <read_fat>:
/**
 * Read the FAT table content corresponded to the given cluster number.
 * @param   cluster     the number of cluster which you want to read its content in FAT table
 */
static uint32 read_fat(uint32 cluster)
{
    80205c2e:	1101                	addi	sp,sp,-32
    80205c30:	ec06                	sd	ra,24(sp)
    80205c32:	e822                	sd	s0,16(sp)
    80205c34:	e426                	sd	s1,8(sp)
    80205c36:	e04a                	sd	s2,0(sp)
    80205c38:	1000                	addi	s0,sp,32
    if (cluster >= FAT32_EOC) {
    80205c3a:	100007b7          	lui	a5,0x10000
    80205c3e:	17dd                	addi	a5,a5,-9
        return cluster;
    80205c40:	84aa                	mv	s1,a0
    if (cluster >= FAT32_EOC) {
    80205c42:	00a7ea63          	bltu	a5,a0,80205c56 <read_fat+0x28>
    }
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205c46:	0001a797          	auipc	a5,0x1a
    80205c4a:	7ea7a783          	lw	a5,2026(a5) # 80220430 <fat+0x8>
    80205c4e:	2785                	addiw	a5,a5,1
        return 0;
    80205c50:	4481                	li	s1,0
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205c52:	00a7f963          	bgeu	a5,a0,80205c64 <read_fat+0x36>
    // here should be a cache layer for FAT table, but not implemented yet.
    struct buf *b = bread(0, fat_sec);
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    brelse(b);
    return next_clus;
}
    80205c56:	8526                	mv	a0,s1
    80205c58:	60e2                	ld	ra,24(sp)
    80205c5a:	6442                	ld	s0,16(sp)
    80205c5c:	64a2                	ld	s1,8(sp)
    80205c5e:	6902                	ld	s2,0(sp)
    80205c60:	6105                	addi	sp,sp,32
    80205c62:	8082                	ret
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80205c64:	0025149b          	slliw	s1,a0,0x2
    80205c68:	0001a917          	auipc	s2,0x1a
    80205c6c:	7c090913          	addi	s2,s2,1984 # 80220428 <fat>
    80205c70:	01095783          	lhu	a5,16(s2)
    80205c74:	02f4d7bb          	divuw	a5,s1,a5
    80205c78:	01495583          	lhu	a1,20(s2)
    struct buf *b = bread(0, fat_sec);
    80205c7c:	9dbd                	addw	a1,a1,a5
    80205c7e:	4501                	li	a0,0
    80205c80:	ffffe097          	auipc	ra,0xffffe
    80205c84:	af8080e7          	jalr	-1288(ra) # 80203778 <bread>
    return (cluster << 2) % fat.bpb.byts_per_sec;
    80205c88:	01095783          	lhu	a5,16(s2)
    80205c8c:	02f4f4bb          	remuw	s1,s1,a5
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    80205c90:	1482                	slli	s1,s1,0x20
    80205c92:	9081                	srli	s1,s1,0x20
    80205c94:	94aa                	add	s1,s1,a0
    80205c96:	4ca4                	lw	s1,88(s1)
    brelse(b);
    80205c98:	ffffe097          	auipc	ra,0xffffe
    80205c9c:	c0c080e7          	jalr	-1012(ra) # 802038a4 <brelse>
    return next_clus;
    80205ca0:	bf5d                	j	80205c56 <read_fat+0x28>

0000000080205ca2 <alloc_clus>:
        brelse(b);
    }
}

static uint32 alloc_clus(uint8 dev)
{
    80205ca2:	711d                	addi	sp,sp,-96
    80205ca4:	ec86                	sd	ra,88(sp)
    80205ca6:	e8a2                	sd	s0,80(sp)
    80205ca8:	e4a6                	sd	s1,72(sp)
    80205caa:	e0ca                	sd	s2,64(sp)
    80205cac:	fc4e                	sd	s3,56(sp)
    80205cae:	f852                	sd	s4,48(sp)
    80205cb0:	f456                	sd	s5,40(sp)
    80205cb2:	f05a                	sd	s6,32(sp)
    80205cb4:	ec5e                	sd	s7,24(sp)
    80205cb6:	e862                	sd	s8,16(sp)
    80205cb8:	e466                	sd	s9,8(sp)
    80205cba:	1080                	addi	s0,sp,96
    // should we keep a free cluster list? instead of searching fat every time.
    struct buf *b;
    uint32 sec = fat.bpb.rsvd_sec_cnt;
    80205cbc:	0001a797          	auipc	a5,0x1a
    80205cc0:	76c78793          	addi	a5,a5,1900 # 80220428 <fat>
    80205cc4:	0147db83          	lhu	s7,20(a5)
    uint32 const ent_per_sec = fat.bpb.byts_per_sec / sizeof(uint32);
    80205cc8:	0107d903          	lhu	s2,16(a5)
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205ccc:	539c                	lw	a5,32(a5)
    80205cce:	10078263          	beqz	a5,80205dd2 <alloc_clus+0x130>
    80205cd2:	0029591b          	srliw	s2,s2,0x2
    80205cd6:	0009099b          	sext.w	s3,s2
    80205cda:	4b01                	li	s6,0
        b = bread(dev, sec);
    80205cdc:	00050a9b          	sext.w	s5,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205ce0:	4c01                	li	s8,0
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205ce2:	0001ac97          	auipc	s9,0x1a
    80205ce6:	746c8c93          	addi	s9,s9,1862 # 80220428 <fat>
    80205cea:	a0c1                	j	80205daa <alloc_clus+0x108>
            if (((uint32 *)(b->data))[j] == 0) {
                ((uint32 *)(b->data))[j] = FAT32_EOC + 7;
    80205cec:	100007b7          	lui	a5,0x10000
    80205cf0:	37fd                	addiw	a5,a5,-1
    80205cf2:	c29c                	sw	a5,0(a3)
                bwrite(b);
    80205cf4:	8552                	mv	a0,s4
    80205cf6:	ffffe097          	auipc	ra,0xffffe
    80205cfa:	b72080e7          	jalr	-1166(ra) # 80203868 <bwrite>
                brelse(b);
    80205cfe:	8552                	mv	a0,s4
    80205d00:	ffffe097          	auipc	ra,0xffffe
    80205d04:	ba4080e7          	jalr	-1116(ra) # 802038a4 <brelse>
                uint32 clus = i * ent_per_sec + j;
    80205d08:	0369093b          	mulw	s2,s2,s6
    80205d0c:	009904bb          	addw	s1,s2,s1
    80205d10:	00048a9b          	sext.w	s5,s1
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80205d14:	0001a717          	auipc	a4,0x1a
    80205d18:	71470713          	addi	a4,a4,1812 # 80220428 <fat>
    80205d1c:	01274783          	lbu	a5,18(a4)
    80205d20:	34f9                	addiw	s1,s1,-2
    80205d22:	02f489bb          	mulw	s3,s1,a5
    80205d26:	4318                	lw	a4,0(a4)
    80205d28:	00e989bb          	addw	s3,s3,a4
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    80205d2c:	c7b1                	beqz	a5,80205d78 <alloc_clus+0xd6>
    80205d2e:	4901                	li	s2,0
    80205d30:	0001aa17          	auipc	s4,0x1a
    80205d34:	6f8a0a13          	addi	s4,s4,1784 # 80220428 <fat>
        b = bread(0, sec++);
    80205d38:	013905bb          	addw	a1,s2,s3
    80205d3c:	4501                	li	a0,0
    80205d3e:	ffffe097          	auipc	ra,0xffffe
    80205d42:	a3a080e7          	jalr	-1478(ra) # 80203778 <bread>
    80205d46:	84aa                	mv	s1,a0
        memset(b->data, 0, BSIZE);
    80205d48:	20000613          	li	a2,512
    80205d4c:	4581                	li	a1,0
    80205d4e:	05850513          	addi	a0,a0,88
    80205d52:	ffffb097          	auipc	ra,0xffffb
    80205d56:	a12080e7          	jalr	-1518(ra) # 80200764 <memset>
        bwrite(b);
    80205d5a:	8526                	mv	a0,s1
    80205d5c:	ffffe097          	auipc	ra,0xffffe
    80205d60:	b0c080e7          	jalr	-1268(ra) # 80203868 <bwrite>
        brelse(b);
    80205d64:	8526                	mv	a0,s1
    80205d66:	ffffe097          	auipc	ra,0xffffe
    80205d6a:	b3e080e7          	jalr	-1218(ra) # 802038a4 <brelse>
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    80205d6e:	2905                	addiw	s2,s2,1
    80205d70:	012a4783          	lbu	a5,18(s4)
    80205d74:	fcf942e3          	blt	s2,a5,80205d38 <alloc_clus+0x96>
            }
        }
        brelse(b);
    }
    panic("no clusters");
}
    80205d78:	8556                	mv	a0,s5
    80205d7a:	60e6                	ld	ra,88(sp)
    80205d7c:	6446                	ld	s0,80(sp)
    80205d7e:	64a6                	ld	s1,72(sp)
    80205d80:	6906                	ld	s2,64(sp)
    80205d82:	79e2                	ld	s3,56(sp)
    80205d84:	7a42                	ld	s4,48(sp)
    80205d86:	7aa2                	ld	s5,40(sp)
    80205d88:	7b02                	ld	s6,32(sp)
    80205d8a:	6be2                	ld	s7,24(sp)
    80205d8c:	6c42                	ld	s8,16(sp)
    80205d8e:	6ca2                	ld	s9,8(sp)
    80205d90:	6125                	addi	sp,sp,96
    80205d92:	8082                	ret
        brelse(b);
    80205d94:	8552                	mv	a0,s4
    80205d96:	ffffe097          	auipc	ra,0xffffe
    80205d9a:	b0e080e7          	jalr	-1266(ra) # 802038a4 <brelse>
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205d9e:	2b05                	addiw	s6,s6,1
    80205da0:	2b85                	addiw	s7,s7,1
    80205da2:	020ca783          	lw	a5,32(s9)
    80205da6:	02fb7663          	bgeu	s6,a5,80205dd2 <alloc_clus+0x130>
        b = bread(dev, sec);
    80205daa:	85de                	mv	a1,s7
    80205dac:	8556                	mv	a0,s5
    80205dae:	ffffe097          	auipc	ra,0xffffe
    80205db2:	9ca080e7          	jalr	-1590(ra) # 80203778 <bread>
    80205db6:	8a2a                	mv	s4,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205db8:	fc098ee3          	beqz	s3,80205d94 <alloc_clus+0xf2>
    80205dbc:	05850793          	addi	a5,a0,88
    80205dc0:	84e2                	mv	s1,s8
            if (((uint32 *)(b->data))[j] == 0) {
    80205dc2:	86be                	mv	a3,a5
    80205dc4:	4398                	lw	a4,0(a5)
    80205dc6:	d31d                	beqz	a4,80205cec <alloc_clus+0x4a>
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205dc8:	2485                	addiw	s1,s1,1
    80205dca:	0791                	addi	a5,a5,4
    80205dcc:	fe999be3          	bne	s3,s1,80205dc2 <alloc_clus+0x120>
    80205dd0:	b7d1                	j	80205d94 <alloc_clus+0xf2>
    panic("no clusters");
    80205dd2:	00005517          	auipc	a0,0x5
    80205dd6:	ea650513          	addi	a0,a0,-346 # 8020ac78 <digits+0x8f8>
    80205dda:	ffffa097          	auipc	ra,0xffffa
    80205dde:	368080e7          	jalr	872(ra) # 80200142 <panic>

0000000080205de2 <write_fat>:
    if (cluster > fat.data_clus_cnt + 1) {
    80205de2:	0001a797          	auipc	a5,0x1a
    80205de6:	64e7a783          	lw	a5,1614(a5) # 80220430 <fat+0x8>
    80205dea:	2785                	addiw	a5,a5,1
    80205dec:	06a7e963          	bltu	a5,a0,80205e5e <write_fat+0x7c>
{
    80205df0:	7179                	addi	sp,sp,-48
    80205df2:	f406                	sd	ra,40(sp)
    80205df4:	f022                	sd	s0,32(sp)
    80205df6:	ec26                	sd	s1,24(sp)
    80205df8:	e84a                	sd	s2,16(sp)
    80205dfa:	e44e                	sd	s3,8(sp)
    80205dfc:	e052                	sd	s4,0(sp)
    80205dfe:	1800                	addi	s0,sp,48
    80205e00:	89ae                	mv	s3,a1
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80205e02:	0025149b          	slliw	s1,a0,0x2
    80205e06:	0001aa17          	auipc	s4,0x1a
    80205e0a:	622a0a13          	addi	s4,s4,1570 # 80220428 <fat>
    80205e0e:	010a5783          	lhu	a5,16(s4)
    80205e12:	02f4d7bb          	divuw	a5,s1,a5
    80205e16:	014a5583          	lhu	a1,20(s4)
    struct buf *b = bread(0, fat_sec);
    80205e1a:	9dbd                	addw	a1,a1,a5
    80205e1c:	4501                	li	a0,0
    80205e1e:	ffffe097          	auipc	ra,0xffffe
    80205e22:	95a080e7          	jalr	-1702(ra) # 80203778 <bread>
    80205e26:	892a                	mv	s2,a0
    return (cluster << 2) % fat.bpb.byts_per_sec;
    80205e28:	010a5783          	lhu	a5,16(s4)
    80205e2c:	02f4f4bb          	remuw	s1,s1,a5
    *(uint32 *)(b->data + off) = content;
    80205e30:	1482                	slli	s1,s1,0x20
    80205e32:	9081                	srli	s1,s1,0x20
    80205e34:	94aa                	add	s1,s1,a0
    80205e36:	0534ac23          	sw	s3,88(s1)
    bwrite(b);
    80205e3a:	ffffe097          	auipc	ra,0xffffe
    80205e3e:	a2e080e7          	jalr	-1490(ra) # 80203868 <bwrite>
    brelse(b);
    80205e42:	854a                	mv	a0,s2
    80205e44:	ffffe097          	auipc	ra,0xffffe
    80205e48:	a60080e7          	jalr	-1440(ra) # 802038a4 <brelse>
    return 0;
    80205e4c:	4501                	li	a0,0
}
    80205e4e:	70a2                	ld	ra,40(sp)
    80205e50:	7402                	ld	s0,32(sp)
    80205e52:	64e2                	ld	s1,24(sp)
    80205e54:	6942                	ld	s2,16(sp)
    80205e56:	69a2                	ld	s3,8(sp)
    80205e58:	6a02                	ld	s4,0(sp)
    80205e5a:	6145                	addi	sp,sp,48
    80205e5c:	8082                	ret
        return -1;
    80205e5e:	557d                	li	a0,-1
}
    80205e60:	8082                	ret

0000000080205e62 <reloc_clus>:
 * @param   off         the offset from the beginning of the relative file
 * @param   alloc       whether alloc new cluster when meeting end of FAT chains
 * @return              the offset from the new cur_clus
 */
static int reloc_clus(struct dirent *entry, uint off, int alloc)
{
    80205e62:	715d                	addi	sp,sp,-80
    80205e64:	e486                	sd	ra,72(sp)
    80205e66:	e0a2                	sd	s0,64(sp)
    80205e68:	fc26                	sd	s1,56(sp)
    80205e6a:	f84a                	sd	s2,48(sp)
    80205e6c:	f44e                	sd	s3,40(sp)
    80205e6e:	f052                	sd	s4,32(sp)
    80205e70:	ec56                	sd	s5,24(sp)
    80205e72:	e85a                	sd	s6,16(sp)
    80205e74:	e45e                	sd	s7,8(sp)
    80205e76:	0880                	addi	s0,sp,80
    80205e78:	84aa                	mv	s1,a0
    80205e7a:	8a2e                	mv	s4,a1
    int clus_num = off / fat.byts_per_clus;
    80205e7c:	0001ab97          	auipc	s7,0x1a
    80205e80:	5b8bab83          	lw	s7,1464(s7) # 80220434 <fat+0xc>
    80205e84:	0375d9bb          	divuw	s3,a1,s7
    while (clus_num > entry->clus_cnt) {
    80205e88:	11052703          	lw	a4,272(a0)
    80205e8c:	07377663          	bgeu	a4,s3,80205ef8 <reloc_clus+0x96>
    80205e90:	8b32                	mv	s6,a2
        int clus = read_fat(entry->cur_clus);
        if (clus >= FAT32_EOC) {
    80205e92:	10000ab7          	lui	s5,0x10000
    80205e96:	1add                	addi	s5,s5,-9
    80205e98:	a025                	j	80205ec0 <reloc_clus+0x5e>
            if (alloc) {
                clus = alloc_clus(entry->dev);
                write_fat(entry->cur_clus, clus);
            } else {
                entry->cur_clus = entry->first_clus;
    80205e9a:	1044a783          	lw	a5,260(s1)
    80205e9e:	10f4a623          	sw	a5,268(s1)
                entry->clus_cnt = 0;
    80205ea2:	1004a823          	sw	zero,272(s1)
                return -1;
    80205ea6:	557d                	li	a0,-1
    80205ea8:	a879                	j	80205f46 <reloc_clus+0xe4>
            }
        }
        entry->cur_clus = clus;
    80205eaa:	1124a623          	sw	s2,268(s1)
        entry->clus_cnt++;
    80205eae:	1104a783          	lw	a5,272(s1)
    80205eb2:	2785                	addiw	a5,a5,1
    80205eb4:	0007871b          	sext.w	a4,a5
    80205eb8:	10f4a823          	sw	a5,272(s1)
    while (clus_num > entry->clus_cnt) {
    80205ebc:	03377e63          	bgeu	a4,s3,80205ef8 <reloc_clus+0x96>
        int clus = read_fat(entry->cur_clus);
    80205ec0:	10c4a503          	lw	a0,268(s1)
    80205ec4:	00000097          	auipc	ra,0x0
    80205ec8:	d6a080e7          	jalr	-662(ra) # 80205c2e <read_fat>
    80205ecc:	0005091b          	sext.w	s2,a0
        if (clus >= FAT32_EOC) {
    80205ed0:	fd2adde3          	bge	s5,s2,80205eaa <reloc_clus+0x48>
            if (alloc) {
    80205ed4:	fc0b03e3          	beqz	s6,80205e9a <reloc_clus+0x38>
                clus = alloc_clus(entry->dev);
    80205ed8:	1144c503          	lbu	a0,276(s1)
    80205edc:	00000097          	auipc	ra,0x0
    80205ee0:	dc6080e7          	jalr	-570(ra) # 80205ca2 <alloc_clus>
    80205ee4:	0005091b          	sext.w	s2,a0
                write_fat(entry->cur_clus, clus);
    80205ee8:	85ca                	mv	a1,s2
    80205eea:	10c4a503          	lw	a0,268(s1)
    80205eee:	00000097          	auipc	ra,0x0
    80205ef2:	ef4080e7          	jalr	-268(ra) # 80205de2 <write_fat>
    80205ef6:	bf55                	j	80205eaa <reloc_clus+0x48>
    }
    if (clus_num < entry->clus_cnt) {
    80205ef8:	04e9f163          	bgeu	s3,a4,80205f3a <reloc_clus+0xd8>
        entry->cur_clus = entry->first_clus;
    80205efc:	1044a783          	lw	a5,260(s1)
    80205f00:	10f4a623          	sw	a5,268(s1)
        entry->clus_cnt = 0;
    80205f04:	1004a823          	sw	zero,272(s1)
        while (entry->clus_cnt < clus_num) {
    80205f08:	037a6963          	bltu	s4,s7,80205f3a <reloc_clus+0xd8>
            entry->cur_clus = read_fat(entry->cur_clus);
            if (entry->cur_clus >= FAT32_EOC) {
    80205f0c:	10000937          	lui	s2,0x10000
    80205f10:	195d                	addi	s2,s2,-9
            entry->cur_clus = read_fat(entry->cur_clus);
    80205f12:	10c4a503          	lw	a0,268(s1)
    80205f16:	00000097          	auipc	ra,0x0
    80205f1a:	d18080e7          	jalr	-744(ra) # 80205c2e <read_fat>
    80205f1e:	2501                	sext.w	a0,a0
    80205f20:	10a4a623          	sw	a0,268(s1)
            if (entry->cur_clus >= FAT32_EOC) {
    80205f24:	02a96c63          	bltu	s2,a0,80205f5c <reloc_clus+0xfa>
                panic("reloc_clus");
            }
            entry->clus_cnt++;
    80205f28:	1104a783          	lw	a5,272(s1)
    80205f2c:	2785                	addiw	a5,a5,1
    80205f2e:	0007871b          	sext.w	a4,a5
    80205f32:	10f4a823          	sw	a5,272(s1)
        while (entry->clus_cnt < clus_num) {
    80205f36:	fd376ee3          	bltu	a4,s3,80205f12 <reloc_clus+0xb0>
        }
    }
    return off % fat.byts_per_clus;
    80205f3a:	0001a517          	auipc	a0,0x1a
    80205f3e:	4fa52503          	lw	a0,1274(a0) # 80220434 <fat+0xc>
    80205f42:	02aa753b          	remuw	a0,s4,a0
}
    80205f46:	60a6                	ld	ra,72(sp)
    80205f48:	6406                	ld	s0,64(sp)
    80205f4a:	74e2                	ld	s1,56(sp)
    80205f4c:	7942                	ld	s2,48(sp)
    80205f4e:	79a2                	ld	s3,40(sp)
    80205f50:	7a02                	ld	s4,32(sp)
    80205f52:	6ae2                	ld	s5,24(sp)
    80205f54:	6b42                	ld	s6,16(sp)
    80205f56:	6ba2                	ld	s7,8(sp)
    80205f58:	6161                	addi	sp,sp,80
    80205f5a:	8082                	ret
                panic("reloc_clus");
    80205f5c:	00005517          	auipc	a0,0x5
    80205f60:	d2c50513          	addi	a0,a0,-724 # 8020ac88 <digits+0x908>
    80205f64:	ffffa097          	auipc	ra,0xffffa
    80205f68:	1de080e7          	jalr	478(ra) # 80200142 <panic>

0000000080205f6c <rw_clus>:
{
    80205f6c:	7119                	addi	sp,sp,-128
    80205f6e:	fc86                	sd	ra,120(sp)
    80205f70:	f8a2                	sd	s0,112(sp)
    80205f72:	f4a6                	sd	s1,104(sp)
    80205f74:	f0ca                	sd	s2,96(sp)
    80205f76:	ecce                	sd	s3,88(sp)
    80205f78:	e8d2                	sd	s4,80(sp)
    80205f7a:	e4d6                	sd	s5,72(sp)
    80205f7c:	e0da                	sd	s6,64(sp)
    80205f7e:	fc5e                	sd	s7,56(sp)
    80205f80:	f862                	sd	s8,48(sp)
    80205f82:	f466                	sd	s9,40(sp)
    80205f84:	f06a                	sd	s10,32(sp)
    80205f86:	ec6e                	sd	s11,24(sp)
    80205f88:	0100                	addi	s0,sp,128
    80205f8a:	f8c43423          	sd	a2,-120(s0)
    80205f8e:	8b36                	mv	s6,a3
    80205f90:	8c3e                	mv	s8,a5
    if (off + n > fat.byts_per_clus)
    80205f92:	00f706bb          	addw	a3,a4,a5
    80205f96:	0001a797          	auipc	a5,0x1a
    80205f9a:	49e7a783          	lw	a5,1182(a5) # 80220434 <fat+0xc>
    80205f9e:	02d7ef63          	bltu	a5,a3,80205fdc <rw_clus+0x70>
    80205fa2:	8cae                	mv	s9,a1
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80205fa4:	0001a797          	auipc	a5,0x1a
    80205fa8:	48478793          	addi	a5,a5,1156 # 80220428 <fat>
    80205fac:	0107da83          	lhu	s5,16(a5)
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80205fb0:	ffe5099b          	addiw	s3,a0,-2
    80205fb4:	0127c503          	lbu	a0,18(a5)
    80205fb8:	02a989bb          	mulw	s3,s3,a0
    80205fbc:	4388                	lw	a0,0(a5)
    80205fbe:	00a989bb          	addw	s3,s3,a0
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80205fc2:	035757bb          	divuw	a5,a4,s5
    80205fc6:	00f989bb          	addw	s3,s3,a5
    off = off % fat.bpb.byts_per_sec;
    80205fca:	03577abb          	remuw	s5,a4,s5
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    80205fce:	0e0c0363          	beqz	s8,802060b4 <rw_clus+0x148>
    80205fd2:	4a01                	li	s4,0
        m = BSIZE - off % BSIZE;
    80205fd4:	20000d93          	li	s11,512
        if (bad == -1) {
    80205fd8:	5d7d                	li	s10,-1
    80205fda:	a095                	j	8020603e <rw_clus+0xd2>
        panic("offset out of range");
    80205fdc:	00005517          	auipc	a0,0x5
    80205fe0:	cbc50513          	addi	a0,a0,-836 # 8020ac98 <digits+0x918>
    80205fe4:	ffffa097          	auipc	ra,0xffffa
    80205fe8:	15e080e7          	jalr	350(ra) # 80200142 <panic>
                bwrite(bp);
    80205fec:	854a                	mv	a0,s2
    80205fee:	ffffe097          	auipc	ra,0xffffe
    80205ff2:	87a080e7          	jalr	-1926(ra) # 80203868 <bwrite>
        brelse(bp);
    80205ff6:	854a                	mv	a0,s2
    80205ff8:	ffffe097          	auipc	ra,0xffffe
    80205ffc:	8ac080e7          	jalr	-1876(ra) # 802038a4 <brelse>
        if (bad == -1) {
    80206000:	a02d                	j	8020602a <rw_clus+0xbe>
            bad = either_copyout(user, data, bp->data + (off % BSIZE), m);
    80206002:	05890613          	addi	a2,s2,88 # 10000058 <_entry-0x701fffa8>
    80206006:	1682                	slli	a3,a3,0x20
    80206008:	9281                	srli	a3,a3,0x20
    8020600a:	963a                	add	a2,a2,a4
    8020600c:	85da                	mv	a1,s6
    8020600e:	f8843503          	ld	a0,-120(s0)
    80206012:	ffffc097          	auipc	ra,0xffffc
    80206016:	522080e7          	jalr	1314(ra) # 80202534 <either_copyout>
    8020601a:	8baa                	mv	s7,a0
        brelse(bp);
    8020601c:	854a                	mv	a0,s2
    8020601e:	ffffe097          	auipc	ra,0xffffe
    80206022:	886080e7          	jalr	-1914(ra) # 802038a4 <brelse>
        if (bad == -1) {
    80206026:	07ab8763          	beq	s7,s10,80206094 <rw_clus+0x128>
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    8020602a:	01448a3b          	addw	s4,s1,s4
    8020602e:	01548abb          	addw	s5,s1,s5
    80206032:	1482                	slli	s1,s1,0x20
    80206034:	9081                	srli	s1,s1,0x20
    80206036:	9b26                	add	s6,s6,s1
    80206038:	2985                	addiw	s3,s3,1
    8020603a:	058a7d63          	bgeu	s4,s8,80206094 <rw_clus+0x128>
        bp = bread(0, sec);
    8020603e:	85ce                	mv	a1,s3
    80206040:	4501                	li	a0,0
    80206042:	ffffd097          	auipc	ra,0xffffd
    80206046:	736080e7          	jalr	1846(ra) # 80203778 <bread>
    8020604a:	892a                	mv	s2,a0
        m = BSIZE - off % BSIZE;
    8020604c:	1ffaf713          	andi	a4,s5,511
    80206050:	40ed863b          	subw	a2,s11,a4
        if (n - tot < m) {
    80206054:	414c07bb          	subw	a5,s8,s4
    80206058:	86be                	mv	a3,a5
    8020605a:	2781                	sext.w	a5,a5
    8020605c:	0006059b          	sext.w	a1,a2
    80206060:	00f5f363          	bgeu	a1,a5,80206066 <rw_clus+0xfa>
    80206064:	86b2                	mv	a3,a2
    80206066:	0006849b          	sext.w	s1,a3
        if (write) {
    8020606a:	f80c8ce3          	beqz	s9,80206002 <rw_clus+0x96>
            if ((bad = either_copyin(bp->data + (off % BSIZE), user, data, m)) != -1) {
    8020606e:	05890513          	addi	a0,s2,88
    80206072:	1682                	slli	a3,a3,0x20
    80206074:	9281                	srli	a3,a3,0x20
    80206076:	865a                	mv	a2,s6
    80206078:	f8843583          	ld	a1,-120(s0)
    8020607c:	953a                	add	a0,a0,a4
    8020607e:	ffffc097          	auipc	ra,0xffffc
    80206082:	4ec080e7          	jalr	1260(ra) # 8020256a <either_copyin>
    80206086:	f7a513e3          	bne	a0,s10,80205fec <rw_clus+0x80>
        brelse(bp);
    8020608a:	854a                	mv	a0,s2
    8020608c:	ffffe097          	auipc	ra,0xffffe
    80206090:	818080e7          	jalr	-2024(ra) # 802038a4 <brelse>
}
    80206094:	8552                	mv	a0,s4
    80206096:	70e6                	ld	ra,120(sp)
    80206098:	7446                	ld	s0,112(sp)
    8020609a:	74a6                	ld	s1,104(sp)
    8020609c:	7906                	ld	s2,96(sp)
    8020609e:	69e6                	ld	s3,88(sp)
    802060a0:	6a46                	ld	s4,80(sp)
    802060a2:	6aa6                	ld	s5,72(sp)
    802060a4:	6b06                	ld	s6,64(sp)
    802060a6:	7be2                	ld	s7,56(sp)
    802060a8:	7c42                	ld	s8,48(sp)
    802060aa:	7ca2                	ld	s9,40(sp)
    802060ac:	7d02                	ld	s10,32(sp)
    802060ae:	6de2                	ld	s11,24(sp)
    802060b0:	6109                	addi	sp,sp,128
    802060b2:	8082                	ret
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    802060b4:	8a62                	mv	s4,s8
    802060b6:	bff9                	j	80206094 <rw_clus+0x128>

00000000802060b8 <eget>:
// by their whole path. But when parsing a path, we open all the directories through it, 
// which forms a linked list from the final file to the root. Thus, we use the "parent" pointer 
// to recognize whether an entry with the "name" as given is really the file we want in the right path.
// Should never get root by eget, it's easy to understand.
static struct dirent *eget(struct dirent *parent, char *name)
{
    802060b8:	7139                	addi	sp,sp,-64
    802060ba:	fc06                	sd	ra,56(sp)
    802060bc:	f822                	sd	s0,48(sp)
    802060be:	f426                	sd	s1,40(sp)
    802060c0:	f04a                	sd	s2,32(sp)
    802060c2:	ec4e                	sd	s3,24(sp)
    802060c4:	e852                	sd	s4,16(sp)
    802060c6:	e456                	sd	s5,8(sp)
    802060c8:	0080                	addi	s0,sp,64
    802060ca:	8a2a                	mv	s4,a0
    802060cc:	8aae                	mv	s5,a1
    struct dirent *ep;
    acquire(&ecache.lock);
    802060ce:	0001a517          	auipc	a0,0x1a
    802060d2:	4ea50513          	addi	a0,a0,1258 # 802205b8 <ecache>
    802060d6:	ffffa097          	auipc	ra,0xffffa
    802060da:	5f2080e7          	jalr	1522(ra) # 802006c8 <acquire>
    if (name) {
    802060de:	060a8b63          	beqz	s5,80206154 <eget+0x9c>
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    802060e2:	0001a497          	auipc	s1,0x1a
    802060e6:	4964b483          	ld	s1,1174(s1) # 80220578 <root+0x128>
    802060ea:	0001a797          	auipc	a5,0x1a
    802060ee:	36678793          	addi	a5,a5,870 # 80220450 <root>
    802060f2:	06f48163          	beq	s1,a5,80206154 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    802060f6:	4905                	li	s2,1
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    802060f8:	89be                	mv	s3,a5
    802060fa:	a029                	j	80206104 <eget+0x4c>
    802060fc:	1284b483          	ld	s1,296(s1)
    80206100:	05348a63          	beq	s1,s3,80206154 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80206104:	11649783          	lh	a5,278(s1)
    80206108:	ff279ae3          	bne	a5,s2,802060fc <eget+0x44>
    8020610c:	1204b783          	ld	a5,288(s1)
    80206110:	ff4796e3          	bne	a5,s4,802060fc <eget+0x44>
                && strncmp(ep->filename, name, FAT32_MAX_FILENAME) == 0) {
    80206114:	0ff00613          	li	a2,255
    80206118:	85d6                	mv	a1,s5
    8020611a:	8526                	mv	a0,s1
    8020611c:	ffffa097          	auipc	ra,0xffffa
    80206120:	724080e7          	jalr	1828(ra) # 80200840 <strncmp>
    80206124:	fd61                	bnez	a0,802060fc <eget+0x44>
                if (ep->ref++ == 0) {
    80206126:	1184a783          	lw	a5,280(s1)
    8020612a:	0017871b          	addiw	a4,a5,1
    8020612e:	10e4ac23          	sw	a4,280(s1)
    80206132:	eb81                	bnez	a5,80206142 <eget+0x8a>
                    ep->parent->ref++;
    80206134:	1204b703          	ld	a4,288(s1)
    80206138:	11872783          	lw	a5,280(a4)
    8020613c:	2785                	addiw	a5,a5,1
    8020613e:	10f72c23          	sw	a5,280(a4)
                }
                release(&ecache.lock);
    80206142:	0001a517          	auipc	a0,0x1a
    80206146:	47650513          	addi	a0,a0,1142 # 802205b8 <ecache>
    8020614a:	ffffa097          	auipc	ra,0xffffa
    8020614e:	5d2080e7          	jalr	1490(ra) # 8020071c <release>
                // edup(ep->parent);
                return ep;
    80206152:	a085                	j	802061b2 <eget+0xfa>
            }
        }
    }
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80206154:	0001a497          	auipc	s1,0x1a
    80206158:	42c4b483          	ld	s1,1068(s1) # 80220580 <root+0x130>
    8020615c:	0001a797          	auipc	a5,0x1a
    80206160:	2f478793          	addi	a5,a5,756 # 80220450 <root>
    80206164:	00f48a63          	beq	s1,a5,80206178 <eget+0xc0>
    80206168:	873e                	mv	a4,a5
        if (ep->ref == 0) {
    8020616a:	1184a783          	lw	a5,280(s1)
    8020616e:	cf89                	beqz	a5,80206188 <eget+0xd0>
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80206170:	1304b483          	ld	s1,304(s1)
    80206174:	fee49be3          	bne	s1,a4,8020616a <eget+0xb2>
            ep->dirty = 0;
            release(&ecache.lock);
            return ep;
        }
    }
    panic("eget: insufficient ecache");
    80206178:	00005517          	auipc	a0,0x5
    8020617c:	b3850513          	addi	a0,a0,-1224 # 8020acb0 <digits+0x930>
    80206180:	ffffa097          	auipc	ra,0xffffa
    80206184:	fc2080e7          	jalr	-62(ra) # 80200142 <panic>
            ep->ref = 1;
    80206188:	4785                	li	a5,1
    8020618a:	10f4ac23          	sw	a5,280(s1)
            ep->dev = parent->dev;
    8020618e:	114a4783          	lbu	a5,276(s4)
    80206192:	10f48a23          	sb	a5,276(s1)
            ep->off = 0;
    80206196:	1004ae23          	sw	zero,284(s1)
            ep->valid = 0;
    8020619a:	10049b23          	sh	zero,278(s1)
            ep->dirty = 0;
    8020619e:	10048aa3          	sb	zero,277(s1)
            release(&ecache.lock);
    802061a2:	0001a517          	auipc	a0,0x1a
    802061a6:	41650513          	addi	a0,a0,1046 # 802205b8 <ecache>
    802061aa:	ffffa097          	auipc	ra,0xffffa
    802061ae:	572080e7          	jalr	1394(ra) # 8020071c <release>
    return 0;
}
    802061b2:	8526                	mv	a0,s1
    802061b4:	70e2                	ld	ra,56(sp)
    802061b6:	7442                	ld	s0,48(sp)
    802061b8:	74a2                	ld	s1,40(sp)
    802061ba:	7902                	ld	s2,32(sp)
    802061bc:	69e2                	ld	s3,24(sp)
    802061be:	6a42                	ld	s4,16(sp)
    802061c0:	6aa2                	ld	s5,8(sp)
    802061c2:	6121                	addi	sp,sp,64
    802061c4:	8082                	ret

00000000802061c6 <read_entry_name>:
 * @param   buffer      pointer to the array that stores the name
 * @param   raw_entry   pointer to the entry in a sector buffer
 * @param   islong      if non-zero, read as l-n-e, otherwise s-n-e.
 */
static void read_entry_name(char *buffer, union dentry *d)
{
    802061c6:	7139                	addi	sp,sp,-64
    802061c8:	fc06                	sd	ra,56(sp)
    802061ca:	f822                	sd	s0,48(sp)
    802061cc:	f426                	sd	s1,40(sp)
    802061ce:	f04a                	sd	s2,32(sp)
    802061d0:	ec4e                	sd	s3,24(sp)
    802061d2:	0080                	addi	s0,sp,64
    802061d4:	84aa                	mv	s1,a0
    802061d6:	892e                	mv	s2,a1
    if (d->lne.attr == ATTR_LONG_NAME) {                       // long entry branch
    802061d8:	00b5c703          	lbu	a4,11(a1)
    802061dc:	47bd                	li	a5,15
    802061de:	08f70563          	beq	a4,a5,80206268 <read_entry_name+0xa2>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
        buffer += NELEM(d->lne.name2);
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    } else {
        // assert: only "." and ".." will enter this branch
        memset(buffer, 0, CHAR_SHORT_NAME + 2); // plus '.' and '\0'
    802061e2:	4635                	li	a2,13
    802061e4:	4581                	li	a1,0
    802061e6:	ffffa097          	auipc	ra,0xffffa
    802061ea:	57e080e7          	jalr	1406(ra) # 80200764 <memset>
        int i;
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    802061ee:	00094703          	lbu	a4,0(s2)
    802061f2:	02000793          	li	a5,32
    802061f6:	0af70c63          	beq	a4,a5,802062ae <read_entry_name+0xe8>
    802061fa:	4785                	li	a5,1
    802061fc:	02000613          	li	a2,32
    80206200:	45a5                	li	a1,9
            buffer[i] = d->sne.name[i];
    80206202:	00f486b3          	add	a3,s1,a5
    80206206:	fee68fa3          	sb	a4,-1(a3) # 1fff <_entry-0x801fe001>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    8020620a:	0007851b          	sext.w	a0,a5
    8020620e:	00f90733          	add	a4,s2,a5
    80206212:	00074703          	lbu	a4,0(a4)
    80206216:	00c70563          	beq	a4,a2,80206220 <read_entry_name+0x5a>
    8020621a:	0785                	addi	a5,a5,1
    8020621c:	feb793e3          	bne	a5,a1,80206202 <read_entry_name+0x3c>
        }
        if (d->sne.name[8] != ' ') {
    80206220:	00894703          	lbu	a4,8(s2)
    80206224:	02000793          	li	a5,32
    80206228:	00f70963          	beq	a4,a5,8020623a <read_entry_name+0x74>
            buffer[i++] = '.';
    8020622c:	00a487b3          	add	a5,s1,a0
    80206230:	02e00713          	li	a4,46
    80206234:	00e78023          	sb	a4,0(a5)
    80206238:	2505                	addiw	a0,a0,1
        }
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    8020623a:	00890793          	addi	a5,s2,8
    8020623e:	94aa                	add	s1,s1,a0
    80206240:	092d                	addi	s2,s2,11
            if (d->sne.name[j] == ' ') { break; }
    80206242:	02000693          	li	a3,32
    80206246:	0007c703          	lbu	a4,0(a5)
    8020624a:	00d70863          	beq	a4,a3,8020625a <read_entry_name+0x94>
            buffer[i] = d->sne.name[j];
    8020624e:	00e48023          	sb	a4,0(s1)
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    80206252:	0785                	addi	a5,a5,1
    80206254:	0485                	addi	s1,s1,1
    80206256:	ff2798e3          	bne	a5,s2,80206246 <read_entry_name+0x80>
        }
    }
}
    8020625a:	70e2                	ld	ra,56(sp)
    8020625c:	7442                	ld	s0,48(sp)
    8020625e:	74a2                	ld	s1,40(sp)
    80206260:	7902                	ld	s2,32(sp)
    80206262:	69e2                	ld	s3,24(sp)
    80206264:	6121                	addi	sp,sp,64
    80206266:	8082                	ret
        memmove(temp, d->lne.name1, sizeof(temp));
    80206268:	4629                	li	a2,10
    8020626a:	0585                	addi	a1,a1,1
    8020626c:	fc040993          	addi	s3,s0,-64
    80206270:	854e                	mv	a0,s3
    80206272:	ffffa097          	auipc	ra,0xffffa
    80206276:	552080e7          	jalr	1362(ra) # 802007c4 <memmove>
        snstr(buffer, temp, NELEM(d->lne.name1));
    8020627a:	4615                	li	a2,5
    8020627c:	85ce                	mv	a1,s3
    8020627e:	8526                	mv	a0,s1
    80206280:	ffffa097          	auipc	ra,0xffffa
    80206284:	6ca080e7          	jalr	1738(ra) # 8020094a <snstr>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
    80206288:	4619                	li	a2,6
    8020628a:	00e90593          	addi	a1,s2,14
    8020628e:	00548513          	addi	a0,s1,5
    80206292:	ffffa097          	auipc	ra,0xffffa
    80206296:	6b8080e7          	jalr	1720(ra) # 8020094a <snstr>
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    8020629a:	4609                	li	a2,2
    8020629c:	01c90593          	addi	a1,s2,28
    802062a0:	00b48513          	addi	a0,s1,11
    802062a4:	ffffa097          	auipc	ra,0xffffa
    802062a8:	6a6080e7          	jalr	1702(ra) # 8020094a <snstr>
    802062ac:	b77d                	j	8020625a <read_entry_name+0x94>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    802062ae:	4501                	li	a0,0
    802062b0:	bf85                	j	80206220 <read_entry_name+0x5a>

00000000802062b2 <fat32_init>:
{
    802062b2:	7139                	addi	sp,sp,-64
    802062b4:	fc06                	sd	ra,56(sp)
    802062b6:	f822                	sd	s0,48(sp)
    802062b8:	f426                	sd	s1,40(sp)
    802062ba:	f04a                	sd	s2,32(sp)
    802062bc:	ec4e                	sd	s3,24(sp)
    802062be:	e852                	sd	s4,16(sp)
    802062c0:	e456                	sd	s5,8(sp)
    802062c2:	0080                	addi	s0,sp,64
    struct buf *b = bread(0, 0);
    802062c4:	4581                	li	a1,0
    802062c6:	4501                	li	a0,0
    802062c8:	ffffd097          	auipc	ra,0xffffd
    802062cc:	4b0080e7          	jalr	1200(ra) # 80203778 <bread>
    802062d0:	892a                	mv	s2,a0
    if (strncmp((char const*)(b->data + 82), "FAT32", 5))
    802062d2:	4615                	li	a2,5
    802062d4:	00005597          	auipc	a1,0x5
    802062d8:	9fc58593          	addi	a1,a1,-1540 # 8020acd0 <digits+0x950>
    802062dc:	0aa50513          	addi	a0,a0,170
    802062e0:	ffffa097          	auipc	ra,0xffffa
    802062e4:	560080e7          	jalr	1376(ra) # 80200840 <strncmp>
    802062e8:	16051863          	bnez	a0,80206458 <fat32_init+0x1a6>
    memmove(&fat.bpb.byts_per_sec, b->data + 11, 2);            // avoid misaligned load on k210
    802062ec:	0001a497          	auipc	s1,0x1a
    802062f0:	13c48493          	addi	s1,s1,316 # 80220428 <fat>
    802062f4:	4609                	li	a2,2
    802062f6:	06390593          	addi	a1,s2,99
    802062fa:	0001a517          	auipc	a0,0x1a
    802062fe:	13e50513          	addi	a0,a0,318 # 80220438 <fat+0x10>
    80206302:	ffffa097          	auipc	ra,0xffffa
    80206306:	4c2080e7          	jalr	1218(ra) # 802007c4 <memmove>
    fat.bpb.sec_per_clus = *(b->data + 13);
    8020630a:	06594683          	lbu	a3,101(s2)
    8020630e:	00d48923          	sb	a3,18(s1)
    fat.bpb.rsvd_sec_cnt = *(uint16 *)(b->data + 14);
    80206312:	06695603          	lhu	a2,102(s2)
    80206316:	00c49a23          	sh	a2,20(s1)
    fat.bpb.fat_cnt = *(b->data + 16);
    8020631a:	06894703          	lbu	a4,104(s2)
    8020631e:	00e48b23          	sb	a4,22(s1)
    fat.bpb.hidd_sec = *(uint32 *)(b->data + 28);
    80206322:	07492783          	lw	a5,116(s2)
    80206326:	cc9c                	sw	a5,24(s1)
    fat.bpb.tot_sec = *(uint32 *)(b->data + 32);
    80206328:	07892783          	lw	a5,120(s2)
    8020632c:	ccdc                	sw	a5,28(s1)
    fat.bpb.fat_sz = *(uint32 *)(b->data + 36);
    8020632e:	07c92583          	lw	a1,124(s2)
    80206332:	d08c                	sw	a1,32(s1)
    fat.bpb.root_clus = *(uint32 *)(b->data + 44);
    80206334:	08492503          	lw	a0,132(s2)
    80206338:	d0c8                	sw	a0,36(s1)
    fat.first_data_sec = fat.bpb.rsvd_sec_cnt + fat.bpb.fat_cnt * fat.bpb.fat_sz;
    8020633a:	02b7073b          	mulw	a4,a4,a1
    8020633e:	9f31                	addw	a4,a4,a2
    80206340:	c098                	sw	a4,0(s1)
    fat.data_sec_cnt = fat.bpb.tot_sec - fat.first_data_sec;
    80206342:	9f99                	subw	a5,a5,a4
    80206344:	c0dc                	sw	a5,4(s1)
    fat.data_clus_cnt = fat.data_sec_cnt / fat.bpb.sec_per_clus;
    80206346:	02d7d7bb          	divuw	a5,a5,a3
    8020634a:	c49c                	sw	a5,8(s1)
    fat.byts_per_clus = fat.bpb.sec_per_clus * fat.bpb.byts_per_sec;
    8020634c:	0104d783          	lhu	a5,16(s1)
    80206350:	02d787bb          	mulw	a5,a5,a3
    80206354:	c4dc                	sw	a5,12(s1)
    brelse(b);
    80206356:	854a                	mv	a0,s2
    80206358:	ffffd097          	auipc	ra,0xffffd
    8020635c:	54c080e7          	jalr	1356(ra) # 802038a4 <brelse>
    if (BSIZE != fat.bpb.byts_per_sec) 
    80206360:	0104d703          	lhu	a4,16(s1)
    80206364:	20000793          	li	a5,512
    80206368:	10f71063          	bne	a4,a5,80206468 <fat32_init+0x1b6>
    initlock(&ecache.lock, "ecache");
    8020636c:	00005597          	auipc	a1,0x5
    80206370:	99c58593          	addi	a1,a1,-1636 # 8020ad08 <digits+0x988>
    80206374:	0001a517          	auipc	a0,0x1a
    80206378:	24450513          	addi	a0,a0,580 # 802205b8 <ecache>
    8020637c:	ffffa097          	auipc	ra,0xffffa
    80206380:	308080e7          	jalr	776(ra) # 80200684 <initlock>
    memset(&root, 0, sizeof(root));
    80206384:	0001a497          	auipc	s1,0x1a
    80206388:	0a448493          	addi	s1,s1,164 # 80220428 <fat>
    8020638c:	0001a917          	auipc	s2,0x1a
    80206390:	0c490913          	addi	s2,s2,196 # 80220450 <root>
    80206394:	16800613          	li	a2,360
    80206398:	4581                	li	a1,0
    8020639a:	854a                	mv	a0,s2
    8020639c:	ffffa097          	auipc	ra,0xffffa
    802063a0:	3c8080e7          	jalr	968(ra) # 80200764 <memset>
    initsleeplock(&root.lock, "entry");
    802063a4:	00005597          	auipc	a1,0x5
    802063a8:	96c58593          	addi	a1,a1,-1684 # 8020ad10 <digits+0x990>
    802063ac:	0001a517          	auipc	a0,0x1a
    802063b0:	1dc50513          	addi	a0,a0,476 # 80220588 <root+0x138>
    802063b4:	ffffd097          	auipc	ra,0xffffd
    802063b8:	606080e7          	jalr	1542(ra) # 802039ba <initsleeplock>
    root.attribute = (ATTR_DIRECTORY | ATTR_SYSTEM);
    802063bc:	47d1                	li	a5,20
    802063be:	12f48423          	sb	a5,296(s1)
    root.first_clus = root.cur_clus = fat.bpb.root_clus;
    802063c2:	50dc                	lw	a5,36(s1)
    802063c4:	12f4aa23          	sw	a5,308(s1)
    802063c8:	12f4a623          	sw	a5,300(s1)
    root.valid = 1;
    802063cc:	4785                	li	a5,1
    802063ce:	12f49f23          	sh	a5,318(s1)
    root.prev = &root;
    802063d2:	1524bc23          	sd	s2,344(s1)
    root.next = &root;
    802063d6:	1524b823          	sd	s2,336(s1)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    802063da:	0001a497          	auipc	s1,0x1a
    802063de:	1f648493          	addi	s1,s1,502 # 802205d0 <ecache+0x18>
        de->next = root.next;
    802063e2:	0001a917          	auipc	s2,0x1a
    802063e6:	04690913          	addi	s2,s2,70 # 80220428 <fat>
        de->prev = &root;
    802063ea:	0001aa97          	auipc	s5,0x1a
    802063ee:	066a8a93          	addi	s5,s5,102 # 80220450 <root>
        initsleeplock(&de->lock, "entry");
    802063f2:	00005a17          	auipc	s4,0x5
    802063f6:	91ea0a13          	addi	s4,s4,-1762 # 8020ad10 <digits+0x990>
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    802063fa:	0001f997          	auipc	s3,0x1f
    802063fe:	82698993          	addi	s3,s3,-2010 # 80224c20 <cons>
        de->dev = 0;
    80206402:	10048a23          	sb	zero,276(s1)
        de->valid = 0;
    80206406:	10049b23          	sh	zero,278(s1)
        de->ref = 0;
    8020640a:	1004ac23          	sw	zero,280(s1)
        de->dirty = 0;
    8020640e:	10048aa3          	sb	zero,277(s1)
        de->parent = 0;
    80206412:	1204b023          	sd	zero,288(s1)
        de->next = root.next;
    80206416:	15093783          	ld	a5,336(s2)
    8020641a:	12f4b423          	sd	a5,296(s1)
        de->prev = &root;
    8020641e:	1354b823          	sd	s5,304(s1)
        initsleeplock(&de->lock, "entry");
    80206422:	85d2                	mv	a1,s4
    80206424:	13848513          	addi	a0,s1,312
    80206428:	ffffd097          	auipc	ra,0xffffd
    8020642c:	592080e7          	jalr	1426(ra) # 802039ba <initsleeplock>
        root.next->prev = de;
    80206430:	15093783          	ld	a5,336(s2)
    80206434:	1297b823          	sd	s1,304(a5)
        root.next = de;
    80206438:	14993823          	sd	s1,336(s2)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    8020643c:	16848493          	addi	s1,s1,360
    80206440:	fd3491e3          	bne	s1,s3,80206402 <fat32_init+0x150>
}
    80206444:	4501                	li	a0,0
    80206446:	70e2                	ld	ra,56(sp)
    80206448:	7442                	ld	s0,48(sp)
    8020644a:	74a2                	ld	s1,40(sp)
    8020644c:	7902                	ld	s2,32(sp)
    8020644e:	69e2                	ld	s3,24(sp)
    80206450:	6a42                	ld	s4,16(sp)
    80206452:	6aa2                	ld	s5,8(sp)
    80206454:	6121                	addi	sp,sp,64
    80206456:	8082                	ret
        panic("not FAT32 volume");
    80206458:	00005517          	auipc	a0,0x5
    8020645c:	88050513          	addi	a0,a0,-1920 # 8020acd8 <digits+0x958>
    80206460:	ffffa097          	auipc	ra,0xffffa
    80206464:	ce2080e7          	jalr	-798(ra) # 80200142 <panic>
        panic("byts_per_sec != BSIZE");
    80206468:	00005517          	auipc	a0,0x5
    8020646c:	88850513          	addi	a0,a0,-1912 # 8020acf0 <digits+0x970>
    80206470:	ffffa097          	auipc	ra,0xffffa
    80206474:	cd2080e7          	jalr	-814(ra) # 80200142 <panic>

0000000080206478 <eread>:
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80206478:	10852783          	lw	a5,264(a0)
    8020647c:	0ed7e863          	bltu	a5,a3,8020656c <eread+0xf4>
{
    80206480:	711d                	addi	sp,sp,-96
    80206482:	ec86                	sd	ra,88(sp)
    80206484:	e8a2                	sd	s0,80(sp)
    80206486:	e4a6                	sd	s1,72(sp)
    80206488:	e0ca                	sd	s2,64(sp)
    8020648a:	fc4e                	sd	s3,56(sp)
    8020648c:	f852                	sd	s4,48(sp)
    8020648e:	f456                	sd	s5,40(sp)
    80206490:	f05a                	sd	s6,32(sp)
    80206492:	ec5e                	sd	s7,24(sp)
    80206494:	e862                	sd	s8,16(sp)
    80206496:	e466                	sd	s9,8(sp)
    80206498:	e06a                	sd	s10,0(sp)
    8020649a:	1080                	addi	s0,sp,96
    8020649c:	8a2a                	mv	s4,a0
    8020649e:	8bae                	mv	s7,a1
    802064a0:	8ab2                	mv	s5,a2
    802064a2:	8936                	mv	s2,a3
    802064a4:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    802064a6:	9eb9                	addw	a3,a3,a4
        return 0;
    802064a8:	4501                	li	a0,0
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    802064aa:	0b26e163          	bltu	a3,s2,8020654c <eread+0xd4>
    802064ae:	100a4703          	lbu	a4,256(s4)
    802064b2:	8b41                	andi	a4,a4,16
    802064b4:	ef41                	bnez	a4,8020654c <eread+0xd4>
    if (off + n > entry->file_size) {
    802064b6:	00d7f463          	bgeu	a5,a3,802064be <eread+0x46>
        n = entry->file_size - off;
    802064ba:	41278b3b          	subw	s6,a5,s2
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802064be:	10ca2703          	lw	a4,268(s4)
    802064c2:	100007b7          	lui	a5,0x10000
    802064c6:	17dd                	addi	a5,a5,-9
    802064c8:	06e7ef63          	bltu	a5,a4,80206546 <eread+0xce>
    802064cc:	080b0e63          	beqz	s6,80206568 <eread+0xf0>
    802064d0:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    802064d2:	0001ac97          	auipc	s9,0x1a
    802064d6:	f56c8c93          	addi	s9,s9,-170 # 80220428 <fat>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802064da:	8c3e                	mv	s8,a5
    802064dc:	a82d                	j	80206516 <eread+0x9e>
    802064de:	00048d1b          	sext.w	s10,s1
        if (rw_clus(entry->cur_clus, 0, user_dst, dst, off % fat.byts_per_clus, m) != m) {
    802064e2:	87ea                	mv	a5,s10
    802064e4:	86d6                	mv	a3,s5
    802064e6:	865e                	mv	a2,s7
    802064e8:	4581                	li	a1,0
    802064ea:	10ca2503          	lw	a0,268(s4)
    802064ee:	00000097          	auipc	ra,0x0
    802064f2:	a7e080e7          	jalr	-1410(ra) # 80205f6c <rw_clus>
    802064f6:	2501                	sext.w	a0,a0
    802064f8:	04ad1863          	bne	s10,a0,80206548 <eread+0xd0>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802064fc:	013489bb          	addw	s3,s1,s3
    80206500:	0124893b          	addw	s2,s1,s2
    80206504:	1482                	slli	s1,s1,0x20
    80206506:	9081                	srli	s1,s1,0x20
    80206508:	9aa6                	add	s5,s5,s1
    8020650a:	10ca2783          	lw	a5,268(s4)
    8020650e:	02fc6d63          	bltu	s8,a5,80206548 <eread+0xd0>
    80206512:	0369fb63          	bgeu	s3,s6,80206548 <eread+0xd0>
        reloc_clus(entry, off, 0);
    80206516:	4601                	li	a2,0
    80206518:	85ca                	mv	a1,s2
    8020651a:	8552                	mv	a0,s4
    8020651c:	00000097          	auipc	ra,0x0
    80206520:	946080e7          	jalr	-1722(ra) # 80205e62 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206524:	00cca783          	lw	a5,12(s9)
    80206528:	02f976bb          	remuw	a3,s2,a5
    8020652c:	0006871b          	sext.w	a4,a3
    80206530:	9f95                	subw	a5,a5,a3
        if (n - tot < m) {
    80206532:	413b06bb          	subw	a3,s6,s3
    80206536:	84b6                	mv	s1,a3
    80206538:	2681                	sext.w	a3,a3
    8020653a:	0007861b          	sext.w	a2,a5
    8020653e:	fad670e3          	bgeu	a2,a3,802064de <eread+0x66>
    80206542:	84be                	mv	s1,a5
    80206544:	bf69                	j	802064de <eread+0x66>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206546:	4981                	li	s3,0
    return tot;
    80206548:	0009851b          	sext.w	a0,s3
}
    8020654c:	60e6                	ld	ra,88(sp)
    8020654e:	6446                	ld	s0,80(sp)
    80206550:	64a6                	ld	s1,72(sp)
    80206552:	6906                	ld	s2,64(sp)
    80206554:	79e2                	ld	s3,56(sp)
    80206556:	7a42                	ld	s4,48(sp)
    80206558:	7aa2                	ld	s5,40(sp)
    8020655a:	7b02                	ld	s6,32(sp)
    8020655c:	6be2                	ld	s7,24(sp)
    8020655e:	6c42                	ld	s8,16(sp)
    80206560:	6ca2                	ld	s9,8(sp)
    80206562:	6d02                	ld	s10,0(sp)
    80206564:	6125                	addi	sp,sp,96
    80206566:	8082                	ret
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206568:	89da                	mv	s3,s6
    8020656a:	bff9                	j	80206548 <eread+0xd0>
        return 0;
    8020656c:	4501                	li	a0,0
}
    8020656e:	8082                	ret

0000000080206570 <ewrite>:
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    80206570:	10852783          	lw	a5,264(a0)
    80206574:	0ed7e463          	bltu	a5,a3,8020665c <ewrite+0xec>
{
    80206578:	711d                	addi	sp,sp,-96
    8020657a:	ec86                	sd	ra,88(sp)
    8020657c:	e8a2                	sd	s0,80(sp)
    8020657e:	e4a6                	sd	s1,72(sp)
    80206580:	e0ca                	sd	s2,64(sp)
    80206582:	fc4e                	sd	s3,56(sp)
    80206584:	f852                	sd	s4,48(sp)
    80206586:	f456                	sd	s5,40(sp)
    80206588:	f05a                	sd	s6,32(sp)
    8020658a:	ec5e                	sd	s7,24(sp)
    8020658c:	e862                	sd	s8,16(sp)
    8020658e:	e466                	sd	s9,8(sp)
    80206590:	1080                	addi	s0,sp,96
    80206592:	8aaa                	mv	s5,a0
    80206594:	8bae                	mv	s7,a1
    80206596:	8a32                	mv	s4,a2
    80206598:	8936                	mv	s2,a3
    8020659a:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    8020659c:	00e687bb          	addw	a5,a3,a4
    802065a0:	0cd7e063          	bltu	a5,a3,80206660 <ewrite+0xf0>
    802065a4:	02069793          	slli	a5,a3,0x20
    802065a8:	9381                	srli	a5,a5,0x20
    802065aa:	1702                	slli	a4,a4,0x20
    802065ac:	9301                	srli	a4,a4,0x20
    802065ae:	97ba                	add	a5,a5,a4
    802065b0:	577d                	li	a4,-1
    802065b2:	9301                	srli	a4,a4,0x20
    802065b4:	0af76863          	bltu	a4,a5,80206664 <ewrite+0xf4>
        || (entry->attribute & ATTR_READ_ONLY)) {
    802065b8:	10054783          	lbu	a5,256(a0)
    802065bc:	8b85                	andi	a5,a5,1
    802065be:	e7cd                	bnez	a5,80206668 <ewrite+0xf8>
    if (entry->first_clus == 0) {   // so file_size if 0 too, which requests off == 0
    802065c0:	10452783          	lw	a5,260(a0)
    802065c4:	cb89                	beqz	a5,802065d6 <ewrite+0x66>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    802065c6:	080b0963          	beqz	s6,80206658 <ewrite+0xe8>
    802065ca:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    802065cc:	0001ac17          	auipc	s8,0x1a
    802065d0:	e5cc0c13          	addi	s8,s8,-420 # 80220428 <fat>
    802065d4:	a891                	j	80206628 <ewrite+0xb8>
        entry->cur_clus = entry->first_clus = alloc_clus(entry->dev);
    802065d6:	11454503          	lbu	a0,276(a0)
    802065da:	fffff097          	auipc	ra,0xfffff
    802065de:	6c8080e7          	jalr	1736(ra) # 80205ca2 <alloc_clus>
    802065e2:	2501                	sext.w	a0,a0
    802065e4:	10aaa223          	sw	a0,260(s5)
    802065e8:	10aaa623          	sw	a0,268(s5)
        entry->clus_cnt = 0;
    802065ec:	100aa823          	sw	zero,272(s5)
        entry->dirty = 1;
    802065f0:	4785                	li	a5,1
    802065f2:	10fa8aa3          	sb	a5,277(s5)
    802065f6:	bfc1                	j	802065c6 <ewrite+0x56>
    802065f8:	00048c9b          	sext.w	s9,s1
        if (rw_clus(entry->cur_clus, 1, user_src, src, off % fat.byts_per_clus, m) != m) {
    802065fc:	87e6                	mv	a5,s9
    802065fe:	86d2                	mv	a3,s4
    80206600:	865e                	mv	a2,s7
    80206602:	4585                	li	a1,1
    80206604:	10caa503          	lw	a0,268(s5)
    80206608:	00000097          	auipc	ra,0x0
    8020660c:	964080e7          	jalr	-1692(ra) # 80205f6c <rw_clus>
    80206610:	2501                	sext.w	a0,a0
    80206612:	04ac9d63          	bne	s9,a0,8020666c <ewrite+0xfc>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206616:	013489bb          	addw	s3,s1,s3
    8020661a:	0124893b          	addw	s2,s1,s2
    8020661e:	1482                	slli	s1,s1,0x20
    80206620:	9081                	srli	s1,s1,0x20
    80206622:	9a26                	add	s4,s4,s1
    80206624:	0569f463          	bgeu	s3,s6,8020666c <ewrite+0xfc>
        reloc_clus(entry, off, 1);
    80206628:	4605                	li	a2,1
    8020662a:	85ca                	mv	a1,s2
    8020662c:	8556                	mv	a0,s5
    8020662e:	00000097          	auipc	ra,0x0
    80206632:	834080e7          	jalr	-1996(ra) # 80205e62 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206636:	00cc2783          	lw	a5,12(s8)
    8020663a:	02f976bb          	remuw	a3,s2,a5
    8020663e:	0006871b          	sext.w	a4,a3
    80206642:	9f95                	subw	a5,a5,a3
        if (n - tot < m) {
    80206644:	413b06bb          	subw	a3,s6,s3
    80206648:	84b6                	mv	s1,a3
    8020664a:	2681                	sext.w	a3,a3
    8020664c:	0007861b          	sext.w	a2,a5
    80206650:	fad674e3          	bgeu	a2,a3,802065f8 <ewrite+0x88>
    80206654:	84be                	mv	s1,a5
    80206656:	b74d                	j	802065f8 <ewrite+0x88>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206658:	89da                	mv	s3,s6
    8020665a:	a015                	j	8020667e <ewrite+0x10e>
        return -1;
    8020665c:	557d                	li	a0,-1
}
    8020665e:	8082                	ret
        return -1;
    80206660:	557d                	li	a0,-1
    80206662:	a005                	j	80206682 <ewrite+0x112>
    80206664:	557d                	li	a0,-1
    80206666:	a831                	j	80206682 <ewrite+0x112>
    80206668:	557d                	li	a0,-1
    8020666a:	a821                	j	80206682 <ewrite+0x112>
        if(off > entry->file_size) {
    8020666c:	108aa783          	lw	a5,264(s5)
    80206670:	0127f763          	bgeu	a5,s2,8020667e <ewrite+0x10e>
            entry->file_size = off;
    80206674:	112aa423          	sw	s2,264(s5)
            entry->dirty = 1;
    80206678:	4785                	li	a5,1
    8020667a:	10fa8aa3          	sb	a5,277(s5)
    return tot;
    8020667e:	0009851b          	sext.w	a0,s3
}
    80206682:	60e6                	ld	ra,88(sp)
    80206684:	6446                	ld	s0,80(sp)
    80206686:	64a6                	ld	s1,72(sp)
    80206688:	6906                	ld	s2,64(sp)
    8020668a:	79e2                	ld	s3,56(sp)
    8020668c:	7a42                	ld	s4,48(sp)
    8020668e:	7aa2                	ld	s5,40(sp)
    80206690:	7b02                	ld	s6,32(sp)
    80206692:	6be2                	ld	s7,24(sp)
    80206694:	6c42                	ld	s8,16(sp)
    80206696:	6ca2                	ld	s9,8(sp)
    80206698:	6125                	addi	sp,sp,96
    8020669a:	8082                	ret

000000008020669c <formatname>:
{
    8020669c:	7179                	addi	sp,sp,-48
    8020669e:	f406                	sd	ra,40(sp)
    802066a0:	f022                	sd	s0,32(sp)
    802066a2:	ec26                	sd	s1,24(sp)
    802066a4:	e84a                	sd	s2,16(sp)
    802066a6:	e44e                	sd	s3,8(sp)
    802066a8:	e052                	sd	s4,0(sp)
    802066aa:	1800                	addi	s0,sp,48
    802066ac:	84aa                	mv	s1,a0
    while (*name == ' ' || *name == '.') { name++; }
    802066ae:	02000793          	li	a5,32
    802066b2:	02e00713          	li	a4,46
    802066b6:	a011                	j	802066ba <formatname+0x1e>
    802066b8:	0485                	addi	s1,s1,1
    802066ba:	0004c583          	lbu	a1,0(s1)
    802066be:	fef58de3          	beq	a1,a5,802066b8 <formatname+0x1c>
    802066c2:	fee58be3          	beq	a1,a4,802066b8 <formatname+0x1c>
    for (p = name; *p; p++) {
    802066c6:	c1b9                	beqz	a1,8020670c <formatname+0x70>
    802066c8:	8926                	mv	s2,s1
        if (c < 0x20 || strchr(illegal, c)) {
    802066ca:	49fd                	li	s3,31
    802066cc:	00007a17          	auipc	s4,0x7
    802066d0:	58ca0a13          	addi	s4,s4,1420 # 8020dc58 <illegal.1646>
    802066d4:	02b9fe63          	bgeu	s3,a1,80206710 <formatname+0x74>
    802066d8:	8552                	mv	a0,s4
    802066da:	ffffa097          	auipc	ra,0xffffa
    802066de:	2f4080e7          	jalr	756(ra) # 802009ce <strchr>
    802066e2:	e121                	bnez	a0,80206722 <formatname+0x86>
    for (p = name; *p; p++) {
    802066e4:	0905                	addi	s2,s2,1
    802066e6:	00094583          	lbu	a1,0(s2)
    802066ea:	f5ed                	bnez	a1,802066d4 <formatname+0x38>
        if (*p != ' ') {
    802066ec:	02000693          	li	a3,32
    802066f0:	874a                	mv	a4,s2
    while (p-- > name) {
    802066f2:	0124fb63          	bgeu	s1,s2,80206708 <formatname+0x6c>
        if (*p != ' ') {
    802066f6:	197d                	addi	s2,s2,-1
    802066f8:	00094783          	lbu	a5,0(s2)
    802066fc:	fed78ae3          	beq	a5,a3,802066f0 <formatname+0x54>
            p[1] = '\0';
    80206700:	00070023          	sb	zero,0(a4)
            break;
    80206704:	8526                	mv	a0,s1
    80206706:	a031                	j	80206712 <formatname+0x76>
    80206708:	8526                	mv	a0,s1
    8020670a:	a021                	j	80206712 <formatname+0x76>
    for (p = name; *p; p++) {
    8020670c:	8526                	mv	a0,s1
    8020670e:	a011                	j	80206712 <formatname+0x76>
            return 0;
    80206710:	4501                	li	a0,0
}
    80206712:	70a2                	ld	ra,40(sp)
    80206714:	7402                	ld	s0,32(sp)
    80206716:	64e2                	ld	s1,24(sp)
    80206718:	6942                	ld	s2,16(sp)
    8020671a:	69a2                	ld	s3,8(sp)
    8020671c:	6a02                	ld	s4,0(sp)
    8020671e:	6145                	addi	sp,sp,48
    80206720:	8082                	ret
            return 0;
    80206722:	4501                	li	a0,0
    80206724:	b7fd                	j	80206712 <formatname+0x76>

0000000080206726 <cal_checksum>:
{
    80206726:	1141                	addi	sp,sp,-16
    80206728:	e422                	sd	s0,8(sp)
    8020672a:	0800                	addi	s0,sp,16
    8020672c:	87aa                	mv	a5,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    8020672e:	00b50613          	addi	a2,a0,11
    uint8 sum = 0;
    80206732:	4501                	li	a0,0
        sum = ((sum & 1) ? 0x80 : 0) + (sum >> 1) + *shortname++;
    80206734:	0075171b          	slliw	a4,a0,0x7
    80206738:	0785                	addi	a5,a5,1
    8020673a:	0015551b          	srliw	a0,a0,0x1
    8020673e:	fff7c683          	lbu	a3,-1(a5) # fffffff <_entry-0x70200001>
    80206742:	9d35                	addw	a0,a0,a3
    80206744:	953a                	add	a0,a0,a4
    80206746:	0ff57513          	andi	a0,a0,255
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    8020674a:	fef615e3          	bne	a2,a5,80206734 <cal_checksum+0xe>
}
    8020674e:	6422                	ld	s0,8(sp)
    80206750:	0141                	addi	sp,sp,16
    80206752:	8082                	ret

0000000080206754 <emake>:
{
    80206754:	7131                	addi	sp,sp,-192
    80206756:	fd06                	sd	ra,184(sp)
    80206758:	f922                	sd	s0,176(sp)
    8020675a:	f526                	sd	s1,168(sp)
    8020675c:	f14a                	sd	s2,160(sp)
    8020675e:	ed4e                	sd	s3,152(sp)
    80206760:	e952                	sd	s4,144(sp)
    80206762:	e556                	sd	s5,136(sp)
    80206764:	e15a                	sd	s6,128(sp)
    80206766:	fcde                	sd	s7,120(sp)
    80206768:	f8e2                	sd	s8,112(sp)
    8020676a:	f4e6                	sd	s9,104(sp)
    8020676c:	f0ea                	sd	s10,96(sp)
    8020676e:	ecee                	sd	s11,88(sp)
    80206770:	0180                	addi	s0,sp,192
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206772:	10054783          	lbu	a5,256(a0)
    80206776:	8bc1                	andi	a5,a5,16
    80206778:	c3d5                	beqz	a5,8020681c <emake+0xc8>
    8020677a:	8b2a                	mv	s6,a0
    8020677c:	8d2e                	mv	s10,a1
    8020677e:	8cb2                	mv	s9,a2
    if (off % sizeof(union dentry))
    80206780:	01f67793          	andi	a5,a2,31
    80206784:	e7c5                	bnez	a5,8020682c <emake+0xd8>
    memset(&de, 0, sizeof(de));
    80206786:	02000613          	li	a2,32
    8020678a:	4581                	li	a1,0
    8020678c:	f7040513          	addi	a0,s0,-144
    80206790:	ffffa097          	auipc	ra,0xffffa
    80206794:	fd4080e7          	jalr	-44(ra) # 80200764 <memset>
    if (off <= 32) {
    80206798:	02000793          	li	a5,32
    8020679c:	0b97ec63          	bltu	a5,s9,80206854 <emake+0x100>
        if (off == 0) {
    802067a0:	080c9e63          	bnez	s9,8020683c <emake+0xe8>
            strncpy(de.sne.name, ".          ", sizeof(de.sne.name));
    802067a4:	462d                	li	a2,11
    802067a6:	00004597          	auipc	a1,0x4
    802067aa:	59a58593          	addi	a1,a1,1434 # 8020ad40 <digits+0x9c0>
    802067ae:	f7040513          	addi	a0,s0,-144
    802067b2:	ffffa097          	auipc	ra,0xffffa
    802067b6:	0ca080e7          	jalr	202(ra) # 8020087c <strncpy>
        de.sne.attr = ATTR_DIRECTORY;
    802067ba:	47c1                	li	a5,16
    802067bc:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);        // first clus high 16 bits
    802067c0:	104d2783          	lw	a5,260(s10)
    802067c4:	0107d71b          	srliw	a4,a5,0x10
    802067c8:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);       // low 16 bits
    802067cc:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = 0;                                       // filesize is updated in eupdate()
    802067d0:	f8042623          	sw	zero,-116(s0)
        off = reloc_clus(dp, off, 1);
    802067d4:	4605                	li	a2,1
    802067d6:	85e6                	mv	a1,s9
    802067d8:	855a                	mv	a0,s6
    802067da:	fffff097          	auipc	ra,0xfffff
    802067de:	688080e7          	jalr	1672(ra) # 80205e62 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    802067e2:	02000793          	li	a5,32
    802067e6:	0005071b          	sext.w	a4,a0
    802067ea:	f7040693          	addi	a3,s0,-144
    802067ee:	4601                	li	a2,0
    802067f0:	4585                	li	a1,1
    802067f2:	10cb2503          	lw	a0,268(s6)
    802067f6:	fffff097          	auipc	ra,0xfffff
    802067fa:	776080e7          	jalr	1910(ra) # 80205f6c <rw_clus>
}
    802067fe:	70ea                	ld	ra,184(sp)
    80206800:	744a                	ld	s0,176(sp)
    80206802:	74aa                	ld	s1,168(sp)
    80206804:	790a                	ld	s2,160(sp)
    80206806:	69ea                	ld	s3,152(sp)
    80206808:	6a4a                	ld	s4,144(sp)
    8020680a:	6aaa                	ld	s5,136(sp)
    8020680c:	6b0a                	ld	s6,128(sp)
    8020680e:	7be6                	ld	s7,120(sp)
    80206810:	7c46                	ld	s8,112(sp)
    80206812:	7ca6                	ld	s9,104(sp)
    80206814:	7d06                	ld	s10,96(sp)
    80206816:	6de6                	ld	s11,88(sp)
    80206818:	6129                	addi	sp,sp,192
    8020681a:	8082                	ret
        panic("emake: not dir");
    8020681c:	00004517          	auipc	a0,0x4
    80206820:	4fc50513          	addi	a0,a0,1276 # 8020ad18 <digits+0x998>
    80206824:	ffffa097          	auipc	ra,0xffffa
    80206828:	91e080e7          	jalr	-1762(ra) # 80200142 <panic>
        panic("emake: not aligned");
    8020682c:	00004517          	auipc	a0,0x4
    80206830:	4fc50513          	addi	a0,a0,1276 # 8020ad28 <digits+0x9a8>
    80206834:	ffffa097          	auipc	ra,0xffffa
    80206838:	90e080e7          	jalr	-1778(ra) # 80200142 <panic>
            strncpy(de.sne.name, "..         ", sizeof(de.sne.name));
    8020683c:	462d                	li	a2,11
    8020683e:	00004597          	auipc	a1,0x4
    80206842:	51258593          	addi	a1,a1,1298 # 8020ad50 <digits+0x9d0>
    80206846:	f7040513          	addi	a0,s0,-144
    8020684a:	ffffa097          	auipc	ra,0xffffa
    8020684e:	032080e7          	jalr	50(ra) # 8020087c <strncpy>
    80206852:	b7a5                	j	802067ba <emake+0x66>
        int entcnt = (strlen(ep->filename) + CHAR_LONG_NAME - 1) / CHAR_LONG_NAME;   // count of l-n-entries, rounds up
    80206854:	896a                	mv	s2,s10
    80206856:	856a                	mv	a0,s10
    80206858:	ffffa097          	auipc	ra,0xffffa
    8020685c:	094080e7          	jalr	148(ra) # 802008ec <strlen>
    80206860:	f4a43823          	sd	a0,-176(s0)
    80206864:	00c5071b          	addiw	a4,a0,12
    80206868:	47b5                	li	a5,13
    8020686a:	02f747bb          	divw	a5,a4,a5
    8020686e:	f4f42c23          	sw	a5,-168(s0)
    80206872:	00078d9b          	sext.w	s11,a5
        memset(shortname, 0, sizeof(shortname));
    80206876:	4631                	li	a2,12
    80206878:	4581                	li	a1,0
    8020687a:	f6040513          	addi	a0,s0,-160
    8020687e:	ffffa097          	auipc	ra,0xffffa
    80206882:	ee6080e7          	jalr	-282(ra) # 80200764 <memset>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80206886:	856a                	mv	a0,s10
    80206888:	ffffa097          	auipc	ra,0xffffa
    8020688c:	064080e7          	jalr	100(ra) # 802008ec <strlen>
    80206890:	fff5079b          	addiw	a5,a0,-1
    80206894:	0407c063          	bltz	a5,802068d4 <emake+0x180>
    80206898:	97ea                	add	a5,a5,s10
    8020689a:	ffed0693          	addi	a3,s10,-2
    8020689e:	96aa                	add	a3,a3,a0
    802068a0:	fff5071b          	addiw	a4,a0,-1
    802068a4:	1702                	slli	a4,a4,0x20
    802068a6:	9301                	srli	a4,a4,0x20
    802068a8:	8e99                	sub	a3,a3,a4
        if (name[j] == '.') {
    802068aa:	02e00613          	li	a2,46
    802068ae:	89be                	mv	s3,a5
    802068b0:	0007c703          	lbu	a4,0(a5)
    802068b4:	00c70663          	beq	a4,a2,802068c0 <emake+0x16c>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    802068b8:	17fd                	addi	a5,a5,-1
    802068ba:	fed79ae3          	bne	a5,a3,802068ae <emake+0x15a>
    char c, *p = name;
    802068be:	89ea                	mv	s3,s10
        shortname[i++] = c;
    802068c0:	4481                	li	s1,0
        if (i == 8 && p) {
    802068c2:	4aa1                	li	s5,8
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    802068c4:	4ba9                	li	s7,10
        if (c == '.') {
    802068c6:	02e00c13          	li	s8,46
                memset(shortname + i, ' ', 8 - i);
    802068ca:	f6040793          	addi	a5,s0,-160
    802068ce:	f4f43423          	sd	a5,-184(s0)
    802068d2:	a0f1                	j	8020699e <emake+0x24a>
    char c, *p = name;
    802068d4:	89ea                	mv	s3,s10
    802068d6:	b7ed                	j	802068c0 <emake+0x16c>
        if (i == 8 && p) {
    802068d8:	22098163          	beqz	s3,80206afa <emake+0x3a6>
            if (p + 1 < name) { break; }            // no '.'
    802068dc:	0985                	addi	s3,s3,1
    802068de:	0949f763          	bgeu	s3,s4,8020696c <emake+0x218>
    802068e2:	f6040793          	addi	a5,s0,-160
    802068e6:	97a6                	add	a5,a5,s1
        shortname[i++] = ' ';
    802068e8:	02000693          	li	a3,32
    while (i < CHAR_SHORT_NAME) {
    802068ec:	4729                	li	a4,10
        shortname[i++] = ' ';
    802068ee:	2485                	addiw	s1,s1,1
    802068f0:	00d78023          	sb	a3,0(a5)
    while (i < CHAR_SHORT_NAME) {
    802068f4:	0785                	addi	a5,a5,1
    802068f6:	fe975ce3          	bge	a4,s1,802068ee <emake+0x19a>
        de.lne.checksum = cal_checksum((uchar *)shortname);
    802068fa:	f6040513          	addi	a0,s0,-160
    802068fe:	00000097          	auipc	ra,0x0
    80206902:	e28080e7          	jalr	-472(ra) # 80206726 <cal_checksum>
    80206906:	f6a40ea3          	sb	a0,-131(s0)
        de.lne.attr = ATTR_LONG_NAME;
    8020690a:	47bd                	li	a5,15
    8020690c:	f6f40da3          	sb	a5,-133(s0)
        for (int i = entcnt; i > 0; i--) {
    80206910:	f5043783          	ld	a5,-176(s0)
    80206914:	0ef05f63          	blez	a5,80206a12 <emake+0x2be>
    80206918:	f5842783          	lw	a5,-168(s0)
    8020691c:	37fd                	addiw	a5,a5,-1
    8020691e:	f4f42423          	sw	a5,-184(s0)
    80206922:	00179b9b          	slliw	s7,a5,0x1
    80206926:	00fb8bbb          	addw	s7,s7,a5
    8020692a:	002b9b9b          	slliw	s7,s7,0x2
    8020692e:	00fb8bbb          	addw	s7,s7,a5
    80206932:	9bea                	add	s7,s7,s10
    80206934:	8a6e                	mv	s4,s11
    80206936:	8c66                	mv	s8,s9
            uint8 *w = (uint8 *)de.lne.name1;
    80206938:	f7140793          	addi	a5,s0,-143
    8020693c:	f4f43c23          	sd	a5,-168(s0)
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    80206940:	597d                	li	s2,-1
                switch (j) {
    80206942:	44ad                	li	s1,11
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80206944:	f7e40a93          	addi	s5,s0,-130
                switch (j) {
    80206948:	f8c40993          	addi	s3,s0,-116
    8020694c:	aa41                	j	80206adc <emake+0x388>
            if (name > p) {                    // last '.'
    8020694e:	0549f563          	bgeu	s3,s4,80206998 <emake+0x244>
                memset(shortname + i, ' ', 8 - i);
    80206952:	4621                	li	a2,8
    80206954:	9e05                	subw	a2,a2,s1
    80206956:	02000593          	li	a1,32
    8020695a:	f4843783          	ld	a5,-184(s0)
    8020695e:	00978533          	add	a0,a5,s1
    80206962:	ffffa097          	auipc	ra,0xffffa
    80206966:	e02080e7          	jalr	-510(ra) # 80200764 <memset>
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    8020696a:	89d2                	mv	s3,s4
        shortname[i++] = c;
    8020696c:	8a4e                	mv	s4,s3
    8020696e:	84d6                	mv	s1,s5
    80206970:	4981                	li	s3,0
    80206972:	a02d                	j	8020699c <emake+0x248>
            if (strchr(illegal, c) != NULL) {
    80206974:	85ca                	mv	a1,s2
    80206976:	00007517          	auipc	a0,0x7
    8020697a:	2f250513          	addi	a0,a0,754 # 8020dc68 <illegal.1662>
    8020697e:	ffffa097          	auipc	ra,0xffffa
    80206982:	050080e7          	jalr	80(ra) # 802009ce <strchr>
    80206986:	c119                	beqz	a0,8020698c <emake+0x238>
                c = '_';
    80206988:	05f00913          	li	s2,95
        shortname[i++] = c;
    8020698c:	f9040793          	addi	a5,s0,-112
    80206990:	97a6                	add	a5,a5,s1
    80206992:	fd278823          	sb	s2,-48(a5)
    80206996:	2485                	addiw	s1,s1,1
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206998:	f69bc1e3          	blt	s7,s1,802068fa <emake+0x1a6>
        shortname[i++] = c;
    8020699c:	8952                	mv	s2,s4
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    8020699e:	00190a13          	addi	s4,s2,1
    802069a2:	00094903          	lbu	s2,0(s2)
    802069a6:	02090563          	beqz	s2,802069d0 <emake+0x27c>
        if (i == 8 && p) {
    802069aa:	f35487e3          	beq	s1,s5,802068d8 <emake+0x184>
        if (c == ' ') { continue; }
    802069ae:	02000793          	li	a5,32
    802069b2:	fef903e3          	beq	s2,a5,80206998 <emake+0x244>
        if (c == '.') {
    802069b6:	f9890ce3          	beq	s2,s8,8020694e <emake+0x1fa>
        if (c >= 'a' && c <= 'z') {
    802069ba:	f9f9079b          	addiw	a5,s2,-97
    802069be:	0ff7f793          	andi	a5,a5,255
    802069c2:	4765                	li	a4,25
    802069c4:	faf768e3          	bltu	a4,a5,80206974 <emake+0x220>
            c += 'A' - 'a';
    802069c8:	3901                	addiw	s2,s2,-32
    802069ca:	0ff97913          	andi	s2,s2,255
    802069ce:	bf7d                	j	8020698c <emake+0x238>
    while (i < CHAR_SHORT_NAME) {
    802069d0:	47a9                	li	a5,10
    802069d2:	f097d8e3          	bge	a5,s1,802068e2 <emake+0x18e>
    802069d6:	b715                	j	802068fa <emake+0x1a6>
                de.lne.order |= LAST_LONG_ENTRY;
    802069d8:	0407e793          	ori	a5,a5,64
    802069dc:	f6f40823          	sb	a5,-144(s0)
    802069e0:	a221                	j	80206ae8 <emake+0x394>
                    if ((*w++ = *p++) == 0) {
    802069e2:	0005c683          	lbu	a3,0(a1)
    802069e6:	00d78023          	sb	a3,0(a5)
                        end = 1;
    802069ea:	0016b693          	seqz	a3,a3
                    *w++ = 0;
    802069ee:	000780a3          	sb	zero,1(a5)
    802069f2:	0789                	addi	a5,a5,2
                    if ((*w++ = *p++) == 0) {
    802069f4:	0585                	addi	a1,a1,1
    802069f6:	a04d                	j	80206a98 <emake+0x344>
    802069f8:	020c8c9b          	addiw	s9,s9,32
    802069fc:	4781                	li	a5,0
    802069fe:	f5043703          	ld	a4,-176(s0)
    80206a02:	00e05663          	blez	a4,80206a0e <emake+0x2ba>
    80206a06:	f4842783          	lw	a5,-184(s0)
    80206a0a:	0057979b          	slliw	a5,a5,0x5
    80206a0e:	01978cbb          	addw	s9,a5,s9
        memset(&de, 0, sizeof(de));
    80206a12:	02000613          	li	a2,32
    80206a16:	4581                	li	a1,0
    80206a18:	f7040493          	addi	s1,s0,-144
    80206a1c:	8526                	mv	a0,s1
    80206a1e:	ffffa097          	auipc	ra,0xffffa
    80206a22:	d46080e7          	jalr	-698(ra) # 80200764 <memset>
        strncpy(de.sne.name, shortname, sizeof(de.sne.name));
    80206a26:	462d                	li	a2,11
    80206a28:	f6040593          	addi	a1,s0,-160
    80206a2c:	8526                	mv	a0,s1
    80206a2e:	ffffa097          	auipc	ra,0xffffa
    80206a32:	e4e080e7          	jalr	-434(ra) # 8020087c <strncpy>
        de.sne.attr = ep->attribute;
    80206a36:	100d4783          	lbu	a5,256(s10)
    80206a3a:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);      // first clus high 16 bits
    80206a3e:	104d2783          	lw	a5,260(s10)
    80206a42:	0107d71b          	srliw	a4,a5,0x10
    80206a46:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);     // low 16 bits
    80206a4a:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = ep->file_size;                         // filesize is updated in eupdate()
    80206a4e:	108d2783          	lw	a5,264(s10)
    80206a52:	f8f42623          	sw	a5,-116(s0)
        off = reloc_clus(dp, off, 1);
    80206a56:	4605                	li	a2,1
    80206a58:	85e6                	mv	a1,s9
    80206a5a:	855a                	mv	a0,s6
    80206a5c:	fffff097          	auipc	ra,0xfffff
    80206a60:	406080e7          	jalr	1030(ra) # 80205e62 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206a64:	02000793          	li	a5,32
    80206a68:	0005071b          	sext.w	a4,a0
    80206a6c:	86a6                	mv	a3,s1
    80206a6e:	4601                	li	a2,0
    80206a70:	4585                	li	a1,1
    80206a72:	10cb2503          	lw	a0,268(s6)
    80206a76:	fffff097          	auipc	ra,0xfffff
    80206a7a:	4f6080e7          	jalr	1270(ra) # 80205f6c <rw_clus>
}
    80206a7e:	b341                	j	802067fe <emake+0xaa>
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80206a80:	87d6                	mv	a5,s5
    80206a82:	a011                	j	80206a86 <emake+0x332>
                switch (j) {
    80206a84:	87ce                	mv	a5,s3
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206a86:	2705                	addiw	a4,a4,1
    80206a88:	fff7061b          	addiw	a2,a4,-1
                if (end) {
    80206a8c:	dab9                	beqz	a3,802069e2 <emake+0x28e>
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    80206a8e:	01278023          	sb	s2,0(a5)
                    *w++ = 0xff;
    80206a92:	012780a3          	sb	s2,1(a5)
    80206a96:	0789                	addi	a5,a5,2
                switch (j) {
    80206a98:	fea604e3          	beq	a2,a0,80206a80 <emake+0x32c>
    80206a9c:	fe9604e3          	beq	a2,s1,80206a84 <emake+0x330>
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206aa0:	0007061b          	sext.w	a2,a4
    80206aa4:	fec851e3          	bge	a6,a2,80206a86 <emake+0x332>
            uint off2 = reloc_clus(dp, off, 1);
    80206aa8:	4605                	li	a2,1
    80206aaa:	85e2                	mv	a1,s8
    80206aac:	855a                	mv	a0,s6
    80206aae:	fffff097          	auipc	ra,0xfffff
    80206ab2:	3b4080e7          	jalr	948(ra) # 80205e62 <reloc_clus>
            rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off2, sizeof(de));
    80206ab6:	02000793          	li	a5,32
    80206aba:	0005071b          	sext.w	a4,a0
    80206abe:	f7040693          	addi	a3,s0,-144
    80206ac2:	4601                	li	a2,0
    80206ac4:	4585                	li	a1,1
    80206ac6:	10cb2503          	lw	a0,268(s6)
    80206aca:	fffff097          	auipc	ra,0xfffff
    80206ace:	4a2080e7          	jalr	1186(ra) # 80205f6c <rw_clus>
            off += sizeof(de);
    80206ad2:	020c0c1b          	addiw	s8,s8,32
        for (int i = entcnt; i > 0; i--) {
    80206ad6:	1bcd                	addi	s7,s7,-13
    80206ad8:	f34050e3          	blez	s4,802069f8 <emake+0x2a4>
            if ((de.lne.order = i) == entcnt) {
    80206adc:	0ffa7793          	andi	a5,s4,255
    80206ae0:	eefd8ce3          	beq	s11,a5,802069d8 <emake+0x284>
    80206ae4:	f6f40823          	sb	a5,-144(s0)
            char *p = ep->filename + (i - 1) * CHAR_LONG_NAME;
    80206ae8:	3a7d                	addiw	s4,s4,-1
    80206aea:	85de                	mv	a1,s7
    80206aec:	4709                	li	a4,2
            int end = 0;
    80206aee:	4681                	li	a3,0
            uint8 *w = (uint8 *)de.lne.name1;
    80206af0:	f5843783          	ld	a5,-168(s0)
                switch (j) {
    80206af4:	4515                	li	a0,5
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206af6:	4835                	li	a6,13
    80206af8:	bf41                	j	80206a88 <emake+0x334>
        if (c == ' ') { continue; }
    80206afa:	02000793          	li	a5,32
    80206afe:	eaf91ce3          	bne	s2,a5,802069b6 <emake+0x262>
    80206b02:	bd69                	j	8020699c <emake+0x248>

0000000080206b04 <edup>:
{
    80206b04:	1101                	addi	sp,sp,-32
    80206b06:	ec06                	sd	ra,24(sp)
    80206b08:	e822                	sd	s0,16(sp)
    80206b0a:	e426                	sd	s1,8(sp)
    80206b0c:	1000                	addi	s0,sp,32
    80206b0e:	84aa                	mv	s1,a0
    if (entry != 0) {
    80206b10:	c515                	beqz	a0,80206b3c <edup+0x38>
        acquire(&ecache.lock);
    80206b12:	0001a517          	auipc	a0,0x1a
    80206b16:	aa650513          	addi	a0,a0,-1370 # 802205b8 <ecache>
    80206b1a:	ffffa097          	auipc	ra,0xffffa
    80206b1e:	bae080e7          	jalr	-1106(ra) # 802006c8 <acquire>
        entry->ref++;
    80206b22:	1184a783          	lw	a5,280(s1)
    80206b26:	2785                	addiw	a5,a5,1
    80206b28:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    80206b2c:	0001a517          	auipc	a0,0x1a
    80206b30:	a8c50513          	addi	a0,a0,-1396 # 802205b8 <ecache>
    80206b34:	ffffa097          	auipc	ra,0xffffa
    80206b38:	be8080e7          	jalr	-1048(ra) # 8020071c <release>
}
    80206b3c:	8526                	mv	a0,s1
    80206b3e:	60e2                	ld	ra,24(sp)
    80206b40:	6442                	ld	s0,16(sp)
    80206b42:	64a2                	ld	s1,8(sp)
    80206b44:	6105                	addi	sp,sp,32
    80206b46:	8082                	ret

0000000080206b48 <eupdate>:
    if (!entry->dirty || entry->valid != 1) { return; }
    80206b48:	11554783          	lbu	a5,277(a0)
    80206b4c:	c3e5                	beqz	a5,80206c2c <eupdate+0xe4>
{
    80206b4e:	711d                	addi	sp,sp,-96
    80206b50:	ec86                	sd	ra,88(sp)
    80206b52:	e8a2                	sd	s0,80(sp)
    80206b54:	e4a6                	sd	s1,72(sp)
    80206b56:	e0ca                	sd	s2,64(sp)
    80206b58:	fc4e                	sd	s3,56(sp)
    80206b5a:	1080                	addi	s0,sp,96
    80206b5c:	84aa                	mv	s1,a0
    if (!entry->dirty || entry->valid != 1) { return; }
    80206b5e:	11651703          	lh	a4,278(a0)
    80206b62:	4785                	li	a5,1
    80206b64:	00f70963          	beq	a4,a5,80206b76 <eupdate+0x2e>
}
    80206b68:	60e6                	ld	ra,88(sp)
    80206b6a:	6446                	ld	s0,80(sp)
    80206b6c:	64a6                	ld	s1,72(sp)
    80206b6e:	6906                	ld	s2,64(sp)
    80206b70:	79e2                	ld	s3,56(sp)
    80206b72:	6125                	addi	sp,sp,96
    80206b74:	8082                	ret
    uint entcnt = 0;
    80206b76:	fc042623          	sw	zero,-52(s0)
    uint32 off = reloc_clus(entry->parent, entry->off, 0);
    80206b7a:	4601                	li	a2,0
    80206b7c:	11c52583          	lw	a1,284(a0)
    80206b80:	12053503          	ld	a0,288(a0)
    80206b84:	fffff097          	auipc	ra,0xfffff
    80206b88:	2de080e7          	jalr	734(ra) # 80205e62 <reloc_clus>
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off, 1);
    80206b8c:	1204b803          	ld	a6,288(s1)
    80206b90:	4785                	li	a5,1
    80206b92:	0005071b          	sext.w	a4,a0
    80206b96:	fcc40693          	addi	a3,s0,-52
    80206b9a:	4601                	li	a2,0
    80206b9c:	4581                	li	a1,0
    80206b9e:	10c82503          	lw	a0,268(a6)
    80206ba2:	fffff097          	auipc	ra,0xfffff
    80206ba6:	3ca080e7          	jalr	970(ra) # 80205f6c <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    80206baa:	fcc42583          	lw	a1,-52(s0)
    80206bae:	fbf5f593          	andi	a1,a1,-65
    80206bb2:	fcb42623          	sw	a1,-52(s0)
    off = reloc_clus(entry->parent, entry->off + (entcnt << 5), 0);
    80206bb6:	0055959b          	slliw	a1,a1,0x5
    80206bba:	11c4a783          	lw	a5,284(s1)
    80206bbe:	4601                	li	a2,0
    80206bc0:	9dbd                	addw	a1,a1,a5
    80206bc2:	1204b503          	ld	a0,288(s1)
    80206bc6:	fffff097          	auipc	ra,0xfffff
    80206bca:	29c080e7          	jalr	668(ra) # 80205e62 <reloc_clus>
    80206bce:	0005099b          	sext.w	s3,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64)&de, off, sizeof(de));
    80206bd2:	1204b503          	ld	a0,288(s1)
    80206bd6:	02000793          	li	a5,32
    80206bda:	874e                	mv	a4,s3
    80206bdc:	fa840913          	addi	s2,s0,-88
    80206be0:	86ca                	mv	a3,s2
    80206be2:	4601                	li	a2,0
    80206be4:	4581                	li	a1,0
    80206be6:	10c52503          	lw	a0,268(a0)
    80206bea:	fffff097          	auipc	ra,0xfffff
    80206bee:	382080e7          	jalr	898(ra) # 80205f6c <rw_clus>
    de.sne.fst_clus_hi = (uint16)(entry->first_clus >> 16);
    80206bf2:	1044a783          	lw	a5,260(s1)
    80206bf6:	0107d71b          	srliw	a4,a5,0x10
    80206bfa:	fae41e23          	sh	a4,-68(s0)
    de.sne.fst_clus_lo = (uint16)(entry->first_clus & 0xffff);
    80206bfe:	fcf41123          	sh	a5,-62(s0)
    de.sne.file_size = entry->file_size;
    80206c02:	1084a783          	lw	a5,264(s1)
    80206c06:	fcf42223          	sw	a5,-60(s0)
    rw_clus(entry->parent->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206c0a:	1204b503          	ld	a0,288(s1)
    80206c0e:	02000793          	li	a5,32
    80206c12:	874e                	mv	a4,s3
    80206c14:	86ca                	mv	a3,s2
    80206c16:	4601                	li	a2,0
    80206c18:	4585                	li	a1,1
    80206c1a:	10c52503          	lw	a0,268(a0)
    80206c1e:	fffff097          	auipc	ra,0xfffff
    80206c22:	34e080e7          	jalr	846(ra) # 80205f6c <rw_clus>
    entry->dirty = 0;
    80206c26:	10048aa3          	sb	zero,277(s1)
    80206c2a:	bf3d                	j	80206b68 <eupdate+0x20>
    80206c2c:	8082                	ret

0000000080206c2e <eremove>:
    if (entry->valid != 1) { return; }
    80206c2e:	11651703          	lh	a4,278(a0)
    80206c32:	4785                	li	a5,1
    80206c34:	00f70363          	beq	a4,a5,80206c3a <eremove+0xc>
    80206c38:	8082                	ret
{
    80206c3a:	715d                	addi	sp,sp,-80
    80206c3c:	e486                	sd	ra,72(sp)
    80206c3e:	e0a2                	sd	s0,64(sp)
    80206c40:	fc26                	sd	s1,56(sp)
    80206c42:	f84a                	sd	s2,48(sp)
    80206c44:	f44e                	sd	s3,40(sp)
    80206c46:	f052                	sd	s4,32(sp)
    80206c48:	ec56                	sd	s5,24(sp)
    80206c4a:	0880                	addi	s0,sp,80
    80206c4c:	89aa                	mv	s3,a0
    uint entcnt = 0;
    80206c4e:	fa042e23          	sw	zero,-68(s0)
    uint32 off = entry->off;
    80206c52:	11c52a03          	lw	s4,284(a0)
    uint32 off2 = reloc_clus(entry->parent, off, 0);
    80206c56:	4601                	li	a2,0
    80206c58:	85d2                	mv	a1,s4
    80206c5a:	12053503          	ld	a0,288(a0)
    80206c5e:	fffff097          	auipc	ra,0xfffff
    80206c62:	204080e7          	jalr	516(ra) # 80205e62 <reloc_clus>
    80206c66:	0005049b          	sext.w	s1,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off2, 1);
    80206c6a:	1209b503          	ld	a0,288(s3)
    80206c6e:	4785                	li	a5,1
    80206c70:	8726                	mv	a4,s1
    80206c72:	fbc40693          	addi	a3,s0,-68
    80206c76:	4601                	li	a2,0
    80206c78:	4581                	li	a1,0
    80206c7a:	10c52503          	lw	a0,268(a0)
    80206c7e:	fffff097          	auipc	ra,0xfffff
    80206c82:	2ee080e7          	jalr	750(ra) # 80205f6c <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    80206c86:	fbc42783          	lw	a5,-68(s0)
    80206c8a:	fbf7f793          	andi	a5,a5,-65
    80206c8e:	faf42e23          	sw	a5,-68(s0)
    uint8 flag = EMPTY_ENTRY;
    80206c92:	5795                	li	a5,-27
    80206c94:	faf40da3          	sb	a5,-69(s0)
    for (int i = 0; i <= entcnt; i++) {
    80206c98:	4901                	li	s2,0
        rw_clus(entry->parent->cur_clus, 1, 0, (uint64) &flag, off2, 1);
    80206c9a:	fbb40a93          	addi	s5,s0,-69
    80206c9e:	1209b503          	ld	a0,288(s3)
    80206ca2:	4785                	li	a5,1
    80206ca4:	8726                	mv	a4,s1
    80206ca6:	86d6                	mv	a3,s5
    80206ca8:	4601                	li	a2,0
    80206caa:	4585                	li	a1,1
    80206cac:	10c52503          	lw	a0,268(a0)
    80206cb0:	fffff097          	auipc	ra,0xfffff
    80206cb4:	2bc080e7          	jalr	700(ra) # 80205f6c <rw_clus>
        off += 32;
    80206cb8:	020a0a1b          	addiw	s4,s4,32
        off2 = reloc_clus(entry->parent, off, 0);
    80206cbc:	4601                	li	a2,0
    80206cbe:	85d2                	mv	a1,s4
    80206cc0:	1209b503          	ld	a0,288(s3)
    80206cc4:	fffff097          	auipc	ra,0xfffff
    80206cc8:	19e080e7          	jalr	414(ra) # 80205e62 <reloc_clus>
    80206ccc:	0005049b          	sext.w	s1,a0
    for (int i = 0; i <= entcnt; i++) {
    80206cd0:	0019079b          	addiw	a5,s2,1
    80206cd4:	0007891b          	sext.w	s2,a5
    80206cd8:	fbc42703          	lw	a4,-68(s0)
    80206cdc:	fd2771e3          	bgeu	a4,s2,80206c9e <eremove+0x70>
    entry->valid = -1;
    80206ce0:	57fd                	li	a5,-1
    80206ce2:	10f99b23          	sh	a5,278(s3)
}
    80206ce6:	60a6                	ld	ra,72(sp)
    80206ce8:	6406                	ld	s0,64(sp)
    80206cea:	74e2                	ld	s1,56(sp)
    80206cec:	7942                	ld	s2,48(sp)
    80206cee:	79a2                	ld	s3,40(sp)
    80206cf0:	7a02                	ld	s4,32(sp)
    80206cf2:	6ae2                	ld	s5,24(sp)
    80206cf4:	6161                	addi	sp,sp,80
    80206cf6:	8082                	ret

0000000080206cf8 <etrunc>:
{
    80206cf8:	7179                	addi	sp,sp,-48
    80206cfa:	f406                	sd	ra,40(sp)
    80206cfc:	f022                	sd	s0,32(sp)
    80206cfe:	ec26                	sd	s1,24(sp)
    80206d00:	e84a                	sd	s2,16(sp)
    80206d02:	e44e                	sd	s3,8(sp)
    80206d04:	e052                	sd	s4,0(sp)
    80206d06:	1800                	addi	s0,sp,48
    80206d08:	8a2a                	mv	s4,a0
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80206d0a:	10452483          	lw	s1,260(a0)
    80206d0e:	ffe4871b          	addiw	a4,s1,-2
    80206d12:	100007b7          	lui	a5,0x10000
    80206d16:	17d5                	addi	a5,a5,-11
    80206d18:	02e7e663          	bltu	a5,a4,80206d44 <etrunc+0x4c>
    80206d1c:	89be                	mv	s3,a5
        uint32 next = read_fat(clus);
    80206d1e:	0004891b          	sext.w	s2,s1
    80206d22:	8526                	mv	a0,s1
    80206d24:	fffff097          	auipc	ra,0xfffff
    80206d28:	f0a080e7          	jalr	-246(ra) # 80205c2e <read_fat>
    80206d2c:	0005049b          	sext.w	s1,a0
    write_fat(cluster, 0);
    80206d30:	4581                	li	a1,0
    80206d32:	854a                	mv	a0,s2
    80206d34:	fffff097          	auipc	ra,0xfffff
    80206d38:	0ae080e7          	jalr	174(ra) # 80205de2 <write_fat>
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80206d3c:	ffe4879b          	addiw	a5,s1,-2
    80206d40:	fcf9ffe3          	bgeu	s3,a5,80206d1e <etrunc+0x26>
    entry->file_size = 0;
    80206d44:	100a2423          	sw	zero,264(s4)
    entry->first_clus = 0;
    80206d48:	100a2223          	sw	zero,260(s4)
    entry->dirty = 1;
    80206d4c:	4785                	li	a5,1
    80206d4e:	10fa0aa3          	sb	a5,277(s4)
}
    80206d52:	70a2                	ld	ra,40(sp)
    80206d54:	7402                	ld	s0,32(sp)
    80206d56:	64e2                	ld	s1,24(sp)
    80206d58:	6942                	ld	s2,16(sp)
    80206d5a:	69a2                	ld	s3,8(sp)
    80206d5c:	6a02                	ld	s4,0(sp)
    80206d5e:	6145                	addi	sp,sp,48
    80206d60:	8082                	ret

0000000080206d62 <elock>:
{
    80206d62:	1141                	addi	sp,sp,-16
    80206d64:	e406                	sd	ra,8(sp)
    80206d66:	e022                	sd	s0,0(sp)
    80206d68:	0800                	addi	s0,sp,16
    if (entry == 0 || entry->ref < 1)
    80206d6a:	cd19                	beqz	a0,80206d88 <elock+0x26>
    80206d6c:	11852783          	lw	a5,280(a0)
    80206d70:	00f05c63          	blez	a5,80206d88 <elock+0x26>
    acquiresleep(&entry->lock);
    80206d74:	13850513          	addi	a0,a0,312
    80206d78:	ffffd097          	auipc	ra,0xffffd
    80206d7c:	c7c080e7          	jalr	-900(ra) # 802039f4 <acquiresleep>
}
    80206d80:	60a2                	ld	ra,8(sp)
    80206d82:	6402                	ld	s0,0(sp)
    80206d84:	0141                	addi	sp,sp,16
    80206d86:	8082                	ret
        panic("elock");
    80206d88:	00004517          	auipc	a0,0x4
    80206d8c:	fd850513          	addi	a0,a0,-40 # 8020ad60 <digits+0x9e0>
    80206d90:	ffff9097          	auipc	ra,0xffff9
    80206d94:	3b2080e7          	jalr	946(ra) # 80200142 <panic>

0000000080206d98 <eunlock>:
{
    80206d98:	1101                	addi	sp,sp,-32
    80206d9a:	ec06                	sd	ra,24(sp)
    80206d9c:	e822                	sd	s0,16(sp)
    80206d9e:	e426                	sd	s1,8(sp)
    80206da0:	e04a                	sd	s2,0(sp)
    80206da2:	1000                	addi	s0,sp,32
    if (entry == 0 || !holdingsleep(&entry->lock) || entry->ref < 1)
    80206da4:	c90d                	beqz	a0,80206dd6 <eunlock+0x3e>
    80206da6:	84aa                	mv	s1,a0
    80206da8:	13850913          	addi	s2,a0,312
    80206dac:	854a                	mv	a0,s2
    80206dae:	ffffd097          	auipc	ra,0xffffd
    80206db2:	ce0080e7          	jalr	-800(ra) # 80203a8e <holdingsleep>
    80206db6:	c105                	beqz	a0,80206dd6 <eunlock+0x3e>
    80206db8:	1184a783          	lw	a5,280(s1)
    80206dbc:	00f05d63          	blez	a5,80206dd6 <eunlock+0x3e>
    releasesleep(&entry->lock);
    80206dc0:	854a                	mv	a0,s2
    80206dc2:	ffffd097          	auipc	ra,0xffffd
    80206dc6:	c88080e7          	jalr	-888(ra) # 80203a4a <releasesleep>
}
    80206dca:	60e2                	ld	ra,24(sp)
    80206dcc:	6442                	ld	s0,16(sp)
    80206dce:	64a2                	ld	s1,8(sp)
    80206dd0:	6902                	ld	s2,0(sp)
    80206dd2:	6105                	addi	sp,sp,32
    80206dd4:	8082                	ret
        panic("eunlock");
    80206dd6:	00004517          	auipc	a0,0x4
    80206dda:	f9250513          	addi	a0,a0,-110 # 8020ad68 <digits+0x9e8>
    80206dde:	ffff9097          	auipc	ra,0xffff9
    80206de2:	364080e7          	jalr	868(ra) # 80200142 <panic>

0000000080206de6 <eput>:
{
    80206de6:	1101                	addi	sp,sp,-32
    80206de8:	ec06                	sd	ra,24(sp)
    80206dea:	e822                	sd	s0,16(sp)
    80206dec:	e426                	sd	s1,8(sp)
    80206dee:	e04a                	sd	s2,0(sp)
    80206df0:	1000                	addi	s0,sp,32
    80206df2:	84aa                	mv	s1,a0
    acquire(&ecache.lock);
    80206df4:	00019517          	auipc	a0,0x19
    80206df8:	7c450513          	addi	a0,a0,1988 # 802205b8 <ecache>
    80206dfc:	ffffa097          	auipc	ra,0xffffa
    80206e00:	8cc080e7          	jalr	-1844(ra) # 802006c8 <acquire>
    if (entry != &root && entry->valid != 0 && entry->ref == 1) {
    80206e04:	00019797          	auipc	a5,0x19
    80206e08:	64c78793          	addi	a5,a5,1612 # 80220450 <root>
    80206e0c:	00f48a63          	beq	s1,a5,80206e20 <eput+0x3a>
    80206e10:	11649783          	lh	a5,278(s1)
    80206e14:	c791                	beqz	a5,80206e20 <eput+0x3a>
    80206e16:	1184a703          	lw	a4,280(s1)
    80206e1a:	4785                	li	a5,1
    80206e1c:	02f70563          	beq	a4,a5,80206e46 <eput+0x60>
    entry->ref--;
    80206e20:	1184a783          	lw	a5,280(s1)
    80206e24:	37fd                	addiw	a5,a5,-1
    80206e26:	10f4ac23          	sw	a5,280(s1)
    release(&ecache.lock);
    80206e2a:	00019517          	auipc	a0,0x19
    80206e2e:	78e50513          	addi	a0,a0,1934 # 802205b8 <ecache>
    80206e32:	ffffa097          	auipc	ra,0xffffa
    80206e36:	8ea080e7          	jalr	-1814(ra) # 8020071c <release>
}
    80206e3a:	60e2                	ld	ra,24(sp)
    80206e3c:	6442                	ld	s0,16(sp)
    80206e3e:	64a2                	ld	s1,8(sp)
    80206e40:	6902                	ld	s2,0(sp)
    80206e42:	6105                	addi	sp,sp,32
    80206e44:	8082                	ret
        acquiresleep(&entry->lock);
    80206e46:	13848913          	addi	s2,s1,312
    80206e4a:	854a                	mv	a0,s2
    80206e4c:	ffffd097          	auipc	ra,0xffffd
    80206e50:	ba8080e7          	jalr	-1112(ra) # 802039f4 <acquiresleep>
        entry->next->prev = entry->prev;
    80206e54:	1284b703          	ld	a4,296(s1)
    80206e58:	1304b783          	ld	a5,304(s1)
    80206e5c:	12f73823          	sd	a5,304(a4)
        entry->prev->next = entry->next;
    80206e60:	1284b703          	ld	a4,296(s1)
    80206e64:	12e7b423          	sd	a4,296(a5)
        entry->next = root.next;
    80206e68:	00019797          	auipc	a5,0x19
    80206e6c:	5c078793          	addi	a5,a5,1472 # 80220428 <fat>
    80206e70:	1507b703          	ld	a4,336(a5)
    80206e74:	12e4b423          	sd	a4,296(s1)
        entry->prev = &root;
    80206e78:	00019697          	auipc	a3,0x19
    80206e7c:	5d868693          	addi	a3,a3,1496 # 80220450 <root>
    80206e80:	12d4b823          	sd	a3,304(s1)
        root.next->prev = entry;
    80206e84:	12973823          	sd	s1,304(a4)
        root.next = entry;
    80206e88:	1497b823          	sd	s1,336(a5)
        release(&ecache.lock);
    80206e8c:	00019517          	auipc	a0,0x19
    80206e90:	72c50513          	addi	a0,a0,1836 # 802205b8 <ecache>
    80206e94:	ffffa097          	auipc	ra,0xffffa
    80206e98:	888080e7          	jalr	-1912(ra) # 8020071c <release>
        if (entry->valid == -1) {       // this means some one has called eremove()
    80206e9c:	11649703          	lh	a4,278(s1)
    80206ea0:	57fd                	li	a5,-1
    80206ea2:	06f70863          	beq	a4,a5,80206f12 <eput+0x12c>
            elock(entry->parent);
    80206ea6:	1204b503          	ld	a0,288(s1)
    80206eaa:	00000097          	auipc	ra,0x0
    80206eae:	eb8080e7          	jalr	-328(ra) # 80206d62 <elock>
            eupdate(entry);
    80206eb2:	8526                	mv	a0,s1
    80206eb4:	00000097          	auipc	ra,0x0
    80206eb8:	c94080e7          	jalr	-876(ra) # 80206b48 <eupdate>
            eunlock(entry->parent);
    80206ebc:	1204b503          	ld	a0,288(s1)
    80206ec0:	00000097          	auipc	ra,0x0
    80206ec4:	ed8080e7          	jalr	-296(ra) # 80206d98 <eunlock>
        releasesleep(&entry->lock);
    80206ec8:	854a                	mv	a0,s2
    80206eca:	ffffd097          	auipc	ra,0xffffd
    80206ece:	b80080e7          	jalr	-1152(ra) # 80203a4a <releasesleep>
        struct dirent *eparent = entry->parent;
    80206ed2:	1204b903          	ld	s2,288(s1)
        acquire(&ecache.lock);
    80206ed6:	00019517          	auipc	a0,0x19
    80206eda:	6e250513          	addi	a0,a0,1762 # 802205b8 <ecache>
    80206ede:	ffff9097          	auipc	ra,0xffff9
    80206ee2:	7ea080e7          	jalr	2026(ra) # 802006c8 <acquire>
        entry->ref--;
    80206ee6:	1184a783          	lw	a5,280(s1)
    80206eea:	37fd                	addiw	a5,a5,-1
    80206eec:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    80206ef0:	00019517          	auipc	a0,0x19
    80206ef4:	6c850513          	addi	a0,a0,1736 # 802205b8 <ecache>
    80206ef8:	ffffa097          	auipc	ra,0xffffa
    80206efc:	824080e7          	jalr	-2012(ra) # 8020071c <release>
        if (entry->ref == 0) {
    80206f00:	1184a783          	lw	a5,280(s1)
    80206f04:	fb9d                	bnez	a5,80206e3a <eput+0x54>
            eput(eparent);
    80206f06:	854a                	mv	a0,s2
    80206f08:	00000097          	auipc	ra,0x0
    80206f0c:	ede080e7          	jalr	-290(ra) # 80206de6 <eput>
    80206f10:	b72d                	j	80206e3a <eput+0x54>
            etrunc(entry);
    80206f12:	8526                	mv	a0,s1
    80206f14:	00000097          	auipc	ra,0x0
    80206f18:	de4080e7          	jalr	-540(ra) # 80206cf8 <etrunc>
    80206f1c:	b775                	j	80206ec8 <eput+0xe2>

0000000080206f1e <estat>:
{
    80206f1e:	1101                	addi	sp,sp,-32
    80206f20:	ec06                	sd	ra,24(sp)
    80206f22:	e822                	sd	s0,16(sp)
    80206f24:	e426                	sd	s1,8(sp)
    80206f26:	e04a                	sd	s2,0(sp)
    80206f28:	1000                	addi	s0,sp,32
    80206f2a:	892a                	mv	s2,a0
    80206f2c:	84ae                	mv	s1,a1
    strncpy(st->name, de->filename, STAT_MAX_NAME);
    80206f2e:	02000613          	li	a2,32
    80206f32:	85aa                	mv	a1,a0
    80206f34:	8526                	mv	a0,s1
    80206f36:	ffffa097          	auipc	ra,0xffffa
    80206f3a:	946080e7          	jalr	-1722(ra) # 8020087c <strncpy>
    st->type = (de->attribute & ATTR_DIRECTORY) ? T_DIR : T_FILE;
    80206f3e:	10094783          	lbu	a5,256(s2)
    80206f42:	8bc1                	andi	a5,a5,16
    80206f44:	0017b793          	seqz	a5,a5
    80206f48:	0785                	addi	a5,a5,1
    80206f4a:	02f49423          	sh	a5,40(s1)
    st->dev = de->dev;
    80206f4e:	11494783          	lbu	a5,276(s2)
    80206f52:	d0dc                	sw	a5,36(s1)
    st->size = de->file_size;
    80206f54:	10896783          	lwu	a5,264(s2)
    80206f58:	f89c                	sd	a5,48(s1)
}
    80206f5a:	60e2                	ld	ra,24(sp)
    80206f5c:	6442                	ld	s0,16(sp)
    80206f5e:	64a2                	ld	s1,8(sp)
    80206f60:	6902                	ld	s2,0(sp)
    80206f62:	6105                	addi	sp,sp,32
    80206f64:	8082                	ret

0000000080206f66 <enext>:
 * @return  -1      meet the end of dir
 *          0       find empty slots
 *          1       find a file with all its entries
 */
int enext(struct dirent *dp, struct dirent *ep, uint off, int *count)
{
    80206f66:	7119                	addi	sp,sp,-128
    80206f68:	fc86                	sd	ra,120(sp)
    80206f6a:	f8a2                	sd	s0,112(sp)
    80206f6c:	f4a6                	sd	s1,104(sp)
    80206f6e:	f0ca                	sd	s2,96(sp)
    80206f70:	ecce                	sd	s3,88(sp)
    80206f72:	e8d2                	sd	s4,80(sp)
    80206f74:	e4d6                	sd	s5,72(sp)
    80206f76:	e0da                	sd	s6,64(sp)
    80206f78:	fc5e                	sd	s7,56(sp)
    80206f7a:	f862                	sd	s8,48(sp)
    80206f7c:	f466                	sd	s9,40(sp)
    80206f7e:	f06a                	sd	s10,32(sp)
    80206f80:	0100                	addi	s0,sp,128
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206f82:	10054783          	lbu	a5,256(a0)
    80206f86:	8bc1                	andi	a5,a5,16
    80206f88:	cf9d                	beqz	a5,80206fc6 <enext+0x60>
    80206f8a:	892a                	mv	s2,a0
    80206f8c:	8aae                	mv	s5,a1
    80206f8e:	84b2                	mv	s1,a2
    80206f90:	8a36                	mv	s4,a3
        panic("enext not dir");
    if (ep->valid)
    80206f92:	11659783          	lh	a5,278(a1)
    80206f96:	e3a1                	bnez	a5,80206fd6 <enext+0x70>
        panic("enext ep valid");
    if (off % 32)
    80206f98:	01f67793          	andi	a5,a2,31
    80206f9c:	e7a9                	bnez	a5,80206fe6 <enext+0x80>
        panic("enext not align");
    if (dp->valid != 1) { return -1; }
    80206f9e:	11651703          	lh	a4,278(a0)
    80206fa2:	4785                	li	a5,1
    80206fa4:	557d                	li	a0,-1
    80206fa6:	04f70863          	beq	a4,a5,80206ff6 <enext+0x90>
            read_entry_info(ep, &de);
            return 1;
        }
    }
    return -1;
}
    80206faa:	70e6                	ld	ra,120(sp)
    80206fac:	7446                	ld	s0,112(sp)
    80206fae:	74a6                	ld	s1,104(sp)
    80206fb0:	7906                	ld	s2,96(sp)
    80206fb2:	69e6                	ld	s3,88(sp)
    80206fb4:	6a46                	ld	s4,80(sp)
    80206fb6:	6aa6                	ld	s5,72(sp)
    80206fb8:	6b06                	ld	s6,64(sp)
    80206fba:	7be2                	ld	s7,56(sp)
    80206fbc:	7c42                	ld	s8,48(sp)
    80206fbe:	7ca2                	ld	s9,40(sp)
    80206fc0:	7d02                	ld	s10,32(sp)
    80206fc2:	6109                	addi	sp,sp,128
    80206fc4:	8082                	ret
        panic("enext not dir");
    80206fc6:	00004517          	auipc	a0,0x4
    80206fca:	daa50513          	addi	a0,a0,-598 # 8020ad70 <digits+0x9f0>
    80206fce:	ffff9097          	auipc	ra,0xffff9
    80206fd2:	174080e7          	jalr	372(ra) # 80200142 <panic>
        panic("enext ep valid");
    80206fd6:	00004517          	auipc	a0,0x4
    80206fda:	daa50513          	addi	a0,a0,-598 # 8020ad80 <digits+0xa00>
    80206fde:	ffff9097          	auipc	ra,0xffff9
    80206fe2:	164080e7          	jalr	356(ra) # 80200142 <panic>
        panic("enext not align");
    80206fe6:	00004517          	auipc	a0,0x4
    80206fea:	daa50513          	addi	a0,a0,-598 # 8020ad90 <digits+0xa10>
    80206fee:	ffff9097          	auipc	ra,0xffff9
    80206ff2:	154080e7          	jalr	340(ra) # 80200142 <panic>
    memset(ep->filename, 0, FAT32_MAX_FILENAME + 1);
    80206ff6:	8d2e                	mv	s10,a1
    80206ff8:	10000613          	li	a2,256
    80206ffc:	4581                	li	a1,0
    80206ffe:	8556                	mv	a0,s5
    80207000:	ffff9097          	auipc	ra,0xffff9
    80207004:	764080e7          	jalr	1892(ra) # 80200764 <memset>
    int cnt = 0;
    80207008:	4b01                	li	s6,0
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    8020700a:	5bfd                	li	s7,-1
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    8020700c:	f8040993          	addi	s3,s0,-128
        if (de.lne.order == EMPTY_ENTRY) {
    80207010:	0e500c13          	li	s8,229
        if (de.lne.attr == ATTR_LONG_NAME) {
    80207014:	4cbd                	li	s9,15
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80207016:	a03d                	j	80207044 <enext+0xde>
            cnt++;
    80207018:	2b05                	addiw	s6,s6,1
            continue;
    8020701a:	a01d                	j	80207040 <enext+0xda>
            *count = cnt;
    8020701c:	016a2023          	sw	s6,0(s4)
            return 0;
    80207020:	4501                	li	a0,0
    80207022:	b761                	j	80206faa <enext+0x44>
            read_entry_name(ep->filename + (lcnt - 1) * CHAR_LONG_NAME, &de);
    80207024:	fff5079b          	addiw	a5,a0,-1
    80207028:	0017951b          	slliw	a0,a5,0x1
    8020702c:	9d3d                	addw	a0,a0,a5
    8020702e:	0025151b          	slliw	a0,a0,0x2
    80207032:	9d3d                	addw	a0,a0,a5
    80207034:	85ce                	mv	a1,s3
    80207036:	956a                	add	a0,a0,s10
    80207038:	fffff097          	auipc	ra,0xfffff
    8020703c:	18e080e7          	jalr	398(ra) # 802061c6 <read_entry_name>
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80207040:	0204849b          	addiw	s1,s1,32
    80207044:	4601                	li	a2,0
    80207046:	85a6                	mv	a1,s1
    80207048:	854a                	mv	a0,s2
    8020704a:	fffff097          	auipc	ra,0xfffff
    8020704e:	e18080e7          	jalr	-488(ra) # 80205e62 <reloc_clus>
    80207052:	f5750ce3          	beq	a0,s7,80206faa <enext+0x44>
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    80207056:	02000793          	li	a5,32
    8020705a:	0005071b          	sext.w	a4,a0
    8020705e:	86ce                	mv	a3,s3
    80207060:	4601                	li	a2,0
    80207062:	4581                	li	a1,0
    80207064:	10c92503          	lw	a0,268(s2)
    80207068:	fffff097          	auipc	ra,0xfffff
    8020706c:	f04080e7          	jalr	-252(ra) # 80205f6c <rw_clus>
    80207070:	2501                	sext.w	a0,a0
    80207072:	02000793          	li	a5,32
    80207076:	06f51c63          	bne	a0,a5,802070ee <enext+0x188>
    8020707a:	f8044783          	lbu	a5,-128(s0)
    8020707e:	cbb5                	beqz	a5,802070f2 <enext+0x18c>
        if (de.lne.order == EMPTY_ENTRY) {
    80207080:	f9878ce3          	beq	a5,s8,80207018 <enext+0xb2>
        } else if (cnt) {
    80207084:	f80b1ce3          	bnez	s6,8020701c <enext+0xb6>
        if (de.lne.attr == ATTR_LONG_NAME) {
    80207088:	f8b44703          	lbu	a4,-117(s0)
    8020708c:	01971d63          	bne	a4,s9,802070a6 <enext+0x140>
            int lcnt = de.lne.order & ~LAST_LONG_ENTRY;
    80207090:	0bf7f513          	andi	a0,a5,191
            if (de.lne.order & LAST_LONG_ENTRY) {
    80207094:	0407f793          	andi	a5,a5,64
    80207098:	d7d1                	beqz	a5,80207024 <enext+0xbe>
                *count = lcnt + 1;                              // plus the s-n-e;
    8020709a:	0015079b          	addiw	a5,a0,1
    8020709e:	00fa2023          	sw	a5,0(s4)
                count = 0;
    802070a2:	4a01                	li	s4,0
    802070a4:	b741                	j	80207024 <enext+0xbe>
            if (count) {
    802070a6:	000a0c63          	beqz	s4,802070be <enext+0x158>
                *count = 1;
    802070aa:	4785                	li	a5,1
    802070ac:	00fa2023          	sw	a5,0(s4)
                read_entry_name(ep->filename, &de);
    802070b0:	f8040593          	addi	a1,s0,-128
    802070b4:	8556                	mv	a0,s5
    802070b6:	fffff097          	auipc	ra,0xfffff
    802070ba:	110080e7          	jalr	272(ra) # 802061c6 <read_entry_name>
    entry->attribute = d->sne.attr;
    802070be:	f8b44783          	lbu	a5,-117(s0)
    802070c2:	10fa8023          	sb	a5,256(s5)
    entry->first_clus = ((uint32)d->sne.fst_clus_hi << 16) | d->sne.fst_clus_lo;
    802070c6:	f9445783          	lhu	a5,-108(s0)
    802070ca:	0107979b          	slliw	a5,a5,0x10
    802070ce:	f9a45703          	lhu	a4,-102(s0)
    802070d2:	8fd9                	or	a5,a5,a4
    802070d4:	2781                	sext.w	a5,a5
    802070d6:	10faa223          	sw	a5,260(s5)
    entry->file_size = d->sne.file_size;
    802070da:	f9c42703          	lw	a4,-100(s0)
    802070de:	10eaa423          	sw	a4,264(s5)
    entry->cur_clus = entry->first_clus;
    802070e2:	10faa623          	sw	a5,268(s5)
    entry->clus_cnt = 0;
    802070e6:	100aa823          	sw	zero,272(s5)
            return 1;
    802070ea:	4505                	li	a0,1
}
    802070ec:	bd7d                	j	80206faa <enext+0x44>
            return -1;
    802070ee:	557d                	li	a0,-1
    802070f0:	bd6d                	j	80206faa <enext+0x44>
    802070f2:	557d                	li	a0,-1
    802070f4:	bd5d                	j	80206faa <enext+0x44>

00000000802070f6 <dirlookup>:
 * @param   dp          entry of a directory file
 * @param   filename    target filename
 * @param   poff        offset of proper empty entry slots from the beginning of the dir
 */
struct dirent *dirlookup(struct dirent *dp, char *filename, uint *poff)
{
    802070f6:	711d                	addi	sp,sp,-96
    802070f8:	ec86                	sd	ra,88(sp)
    802070fa:	e8a2                	sd	s0,80(sp)
    802070fc:	e4a6                	sd	s1,72(sp)
    802070fe:	e0ca                	sd	s2,64(sp)
    80207100:	fc4e                	sd	s3,56(sp)
    80207102:	f852                	sd	s4,48(sp)
    80207104:	f456                	sd	s5,40(sp)
    80207106:	f05a                	sd	s6,32(sp)
    80207108:	ec5e                	sd	s7,24(sp)
    8020710a:	1080                	addi	s0,sp,96
    if (!(dp->attribute & ATTR_DIRECTORY))
    8020710c:	10054783          	lbu	a5,256(a0)
    80207110:	8bc1                	andi	a5,a5,16
    80207112:	cbb1                	beqz	a5,80207166 <dirlookup+0x70>
    80207114:	84aa                	mv	s1,a0
    80207116:	89ae                	mv	s3,a1
    80207118:	8ab2                	mv	s5,a2
        panic("dirlookup not DIR");
    if (strncmp(filename, ".", FAT32_MAX_FILENAME) == 0) {
    8020711a:	0ff00613          	li	a2,255
    8020711e:	00004597          	auipc	a1,0x4
    80207122:	c9a58593          	addi	a1,a1,-870 # 8020adb8 <digits+0xa38>
    80207126:	854e                	mv	a0,s3
    80207128:	ffff9097          	auipc	ra,0xffff9
    8020712c:	718080e7          	jalr	1816(ra) # 80200840 <strncmp>
    80207130:	c139                	beqz	a0,80207176 <dirlookup+0x80>
        return edup(dp);
    } else if (strncmp(filename, "..", FAT32_MAX_FILENAME) == 0) {
    80207132:	0ff00613          	li	a2,255
    80207136:	00004597          	auipc	a1,0x4
    8020713a:	c8a58593          	addi	a1,a1,-886 # 8020adc0 <digits+0xa40>
    8020713e:	854e                	mv	a0,s3
    80207140:	ffff9097          	auipc	ra,0xffff9
    80207144:	700080e7          	jalr	1792(ra) # 80200840 <strncmp>
    80207148:	e125                	bnez	a0,802071a8 <dirlookup+0xb2>
        if (dp == &root) {
    8020714a:	00019797          	auipc	a5,0x19
    8020714e:	30678793          	addi	a5,a5,774 # 80220450 <root>
    80207152:	04f48463          	beq	s1,a5,8020719a <dirlookup+0xa4>
            return edup(&root);
        }
        return edup(dp->parent);
    80207156:	1204b503          	ld	a0,288(s1)
    8020715a:	00000097          	auipc	ra,0x0
    8020715e:	9aa080e7          	jalr	-1622(ra) # 80206b04 <edup>
    80207162:	892a                	mv	s2,a0
    80207164:	a839                	j	80207182 <dirlookup+0x8c>
        panic("dirlookup not DIR");
    80207166:	00004517          	auipc	a0,0x4
    8020716a:	c3a50513          	addi	a0,a0,-966 # 8020ada0 <digits+0xa20>
    8020716e:	ffff9097          	auipc	ra,0xffff9
    80207172:	fd4080e7          	jalr	-44(ra) # 80200142 <panic>
        return edup(dp);
    80207176:	8526                	mv	a0,s1
    80207178:	00000097          	auipc	ra,0x0
    8020717c:	98c080e7          	jalr	-1652(ra) # 80206b04 <edup>
    80207180:	892a                	mv	s2,a0
    if (poff) {
        *poff = off;
    }
    eput(ep);
    return NULL;
}
    80207182:	854a                	mv	a0,s2
    80207184:	60e6                	ld	ra,88(sp)
    80207186:	6446                	ld	s0,80(sp)
    80207188:	64a6                	ld	s1,72(sp)
    8020718a:	6906                	ld	s2,64(sp)
    8020718c:	79e2                	ld	s3,56(sp)
    8020718e:	7a42                	ld	s4,48(sp)
    80207190:	7aa2                	ld	s5,40(sp)
    80207192:	7b02                	ld	s6,32(sp)
    80207194:	6be2                	ld	s7,24(sp)
    80207196:	6125                	addi	sp,sp,96
    80207198:	8082                	ret
            return edup(&root);
    8020719a:	853e                	mv	a0,a5
    8020719c:	00000097          	auipc	ra,0x0
    802071a0:	968080e7          	jalr	-1688(ra) # 80206b04 <edup>
    802071a4:	892a                	mv	s2,a0
    802071a6:	bff1                	j	80207182 <dirlookup+0x8c>
    if (dp->valid != 1) {
    802071a8:	11649703          	lh	a4,278(s1)
    802071ac:	4785                	li	a5,1
        return NULL;
    802071ae:	4901                	li	s2,0
    if (dp->valid != 1) {
    802071b0:	fcf719e3          	bne	a4,a5,80207182 <dirlookup+0x8c>
    struct dirent *ep = eget(dp, filename);
    802071b4:	85ce                	mv	a1,s3
    802071b6:	8526                	mv	a0,s1
    802071b8:	fffff097          	auipc	ra,0xfffff
    802071bc:	f00080e7          	jalr	-256(ra) # 802060b8 <eget>
    802071c0:	892a                	mv	s2,a0
    if (ep->valid == 1) { return ep; }                               // ecache hits
    802071c2:	11651703          	lh	a4,278(a0)
    802071c6:	4785                	li	a5,1
    802071c8:	faf70de3          	beq	a4,a5,80207182 <dirlookup+0x8c>
    int len = strlen(filename);
    802071cc:	854e                	mv	a0,s3
    802071ce:	ffff9097          	auipc	ra,0xffff9
    802071d2:	71e080e7          	jalr	1822(ra) # 802008ec <strlen>
    int count = 0;
    802071d6:	fa042623          	sw	zero,-84(s0)
    reloc_clus(dp, 0, 0);
    802071da:	4601                	li	a2,0
    802071dc:	4581                	li	a1,0
    802071de:	8526                	mv	a0,s1
    802071e0:	fffff097          	auipc	ra,0xfffff
    802071e4:	c82080e7          	jalr	-894(ra) # 80205e62 <reloc_clus>
    uint off = 0;
    802071e8:	4a01                	li	s4,0
    while ((type = enext(dp, ep, off, &count) != -1)) {
    802071ea:	fac40b93          	addi	s7,s0,-84
    802071ee:	5b7d                	li	s6,-1
    802071f0:	86de                	mv	a3,s7
    802071f2:	8652                	mv	a2,s4
    802071f4:	85ca                	mv	a1,s2
    802071f6:	8526                	mv	a0,s1
    802071f8:	00000097          	auipc	ra,0x0
    802071fc:	d6e080e7          	jalr	-658(ra) # 80206f66 <enext>
    80207200:	03650f63          	beq	a0,s6,8020723e <dirlookup+0x148>
        } else if (strncmp(filename, ep->filename, FAT32_MAX_FILENAME) == 0) {
    80207204:	0ff00613          	li	a2,255
    80207208:	85ca                	mv	a1,s2
    8020720a:	854e                	mv	a0,s3
    8020720c:	ffff9097          	auipc	ra,0xffff9
    80207210:	634080e7          	jalr	1588(ra) # 80200840 <strncmp>
    80207214:	c901                	beqz	a0,80207224 <dirlookup+0x12e>
        off += count << 5;
    80207216:	fac42783          	lw	a5,-84(s0)
    8020721a:	0057979b          	slliw	a5,a5,0x5
    8020721e:	01478a3b          	addw	s4,a5,s4
    80207222:	b7f9                	j	802071f0 <dirlookup+0xfa>
            ep->parent = edup(dp);
    80207224:	8526                	mv	a0,s1
    80207226:	00000097          	auipc	ra,0x0
    8020722a:	8de080e7          	jalr	-1826(ra) # 80206b04 <edup>
    8020722e:	12a93023          	sd	a0,288(s2)
            ep->off = off;
    80207232:	11492e23          	sw	s4,284(s2)
            ep->valid = 1;
    80207236:	4785                	li	a5,1
    80207238:	10f91b23          	sh	a5,278(s2)
            return ep;
    8020723c:	b799                	j	80207182 <dirlookup+0x8c>
    if (poff) {
    8020723e:	000a8463          	beqz	s5,80207246 <dirlookup+0x150>
        *poff = off;
    80207242:	014aa023          	sw	s4,0(s5)
    eput(ep);
    80207246:	854a                	mv	a0,s2
    80207248:	00000097          	auipc	ra,0x0
    8020724c:	b9e080e7          	jalr	-1122(ra) # 80206de6 <eput>
    return NULL;
    80207250:	4901                	li	s2,0
    80207252:	bf05                	j	80207182 <dirlookup+0x8c>

0000000080207254 <ealloc>:
{
    80207254:	7139                	addi	sp,sp,-64
    80207256:	fc06                	sd	ra,56(sp)
    80207258:	f822                	sd	s0,48(sp)
    8020725a:	f426                	sd	s1,40(sp)
    8020725c:	f04a                	sd	s2,32(sp)
    8020725e:	ec4e                	sd	s3,24(sp)
    80207260:	e852                	sd	s4,16(sp)
    80207262:	0080                	addi	s0,sp,64
    80207264:	892a                	mv	s2,a0
    if (!(dp->attribute & ATTR_DIRECTORY)) {
    80207266:	10054783          	lbu	a5,256(a0)
    8020726a:	8bc1                	andi	a5,a5,16
    8020726c:	c7a9                	beqz	a5,802072b6 <ealloc+0x62>
    8020726e:	852e                	mv	a0,a1
    80207270:	8a32                	mv	s4,a2
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    80207272:	11691703          	lh	a4,278(s2)
    80207276:	4785                	li	a5,1
        return NULL;
    80207278:	4481                	li	s1,0
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    8020727a:	02f71563          	bne	a4,a5,802072a4 <ealloc+0x50>
    8020727e:	fffff097          	auipc	ra,0xfffff
    80207282:	41e080e7          	jalr	1054(ra) # 8020669c <formatname>
    80207286:	89aa                	mv	s3,a0
    80207288:	10050663          	beqz	a0,80207394 <ealloc+0x140>
    uint off = 0;
    8020728c:	fc042623          	sw	zero,-52(s0)
    if ((ep = dirlookup(dp, name, &off)) != 0) {      // entry exists
    80207290:	fcc40613          	addi	a2,s0,-52
    80207294:	85aa                	mv	a1,a0
    80207296:	854a                	mv	a0,s2
    80207298:	00000097          	auipc	ra,0x0
    8020729c:	e5e080e7          	jalr	-418(ra) # 802070f6 <dirlookup>
    802072a0:	84aa                	mv	s1,a0
    802072a2:	c115                	beqz	a0,802072c6 <ealloc+0x72>
}
    802072a4:	8526                	mv	a0,s1
    802072a6:	70e2                	ld	ra,56(sp)
    802072a8:	7442                	ld	s0,48(sp)
    802072aa:	74a2                	ld	s1,40(sp)
    802072ac:	7902                	ld	s2,32(sp)
    802072ae:	69e2                	ld	s3,24(sp)
    802072b0:	6a42                	ld	s4,16(sp)
    802072b2:	6121                	addi	sp,sp,64
    802072b4:	8082                	ret
        panic("ealloc not dir");
    802072b6:	00004517          	auipc	a0,0x4
    802072ba:	b1250513          	addi	a0,a0,-1262 # 8020adc8 <digits+0xa48>
    802072be:	ffff9097          	auipc	ra,0xffff9
    802072c2:	e84080e7          	jalr	-380(ra) # 80200142 <panic>
    ep = eget(dp, name);
    802072c6:	85ce                	mv	a1,s3
    802072c8:	854a                	mv	a0,s2
    802072ca:	fffff097          	auipc	ra,0xfffff
    802072ce:	dee080e7          	jalr	-530(ra) # 802060b8 <eget>
    802072d2:	84aa                	mv	s1,a0
    elock(ep);
    802072d4:	00000097          	auipc	ra,0x0
    802072d8:	a8e080e7          	jalr	-1394(ra) # 80206d62 <elock>
    ep->attribute = attr;
    802072dc:	11448023          	sb	s4,256(s1)
    ep->file_size = 0;
    802072e0:	1004a423          	sw	zero,264(s1)
    ep->first_clus = 0;
    802072e4:	1004a223          	sw	zero,260(s1)
    ep->parent = edup(dp);
    802072e8:	854a                	mv	a0,s2
    802072ea:	00000097          	auipc	ra,0x0
    802072ee:	81a080e7          	jalr	-2022(ra) # 80206b04 <edup>
    802072f2:	12a4b023          	sd	a0,288(s1)
    ep->off = off;
    802072f6:	fcc42783          	lw	a5,-52(s0)
    802072fa:	10f4ae23          	sw	a5,284(s1)
    ep->clus_cnt = 0;
    802072fe:	1004a823          	sw	zero,272(s1)
    ep->cur_clus = 0;
    80207302:	1004a623          	sw	zero,268(s1)
    ep->dirty = 0;
    80207306:	10048aa3          	sb	zero,277(s1)
    strncpy(ep->filename, name, FAT32_MAX_FILENAME);
    8020730a:	0ff00613          	li	a2,255
    8020730e:	85ce                	mv	a1,s3
    80207310:	8526                	mv	a0,s1
    80207312:	ffff9097          	auipc	ra,0xffff9
    80207316:	56a080e7          	jalr	1386(ra) # 8020087c <strncpy>
    ep->filename[FAT32_MAX_FILENAME] = '\0';
    8020731a:	0e048fa3          	sb	zero,255(s1)
    if (attr == ATTR_DIRECTORY) {    // generate "." and ".." for ep
    8020731e:	47c1                	li	a5,16
    80207320:	02fa0963          	beq	s4,a5,80207352 <ealloc+0xfe>
        ep->attribute |= ATTR_ARCHIVE;
    80207324:	1004c783          	lbu	a5,256(s1)
    80207328:	0207e793          	ori	a5,a5,32
    8020732c:	10f48023          	sb	a5,256(s1)
    emake(dp, ep, off);
    80207330:	fcc42603          	lw	a2,-52(s0)
    80207334:	85a6                	mv	a1,s1
    80207336:	854a                	mv	a0,s2
    80207338:	fffff097          	auipc	ra,0xfffff
    8020733c:	41c080e7          	jalr	1052(ra) # 80206754 <emake>
    ep->valid = 1;
    80207340:	4785                	li	a5,1
    80207342:	10f49b23          	sh	a5,278(s1)
    eunlock(ep);
    80207346:	8526                	mv	a0,s1
    80207348:	00000097          	auipc	ra,0x0
    8020734c:	a50080e7          	jalr	-1456(ra) # 80206d98 <eunlock>
    return ep;
    80207350:	bf91                	j	802072a4 <ealloc+0x50>
        ep->attribute |= ATTR_DIRECTORY;
    80207352:	1004c783          	lbu	a5,256(s1)
    80207356:	0107e793          	ori	a5,a5,16
    8020735a:	10f48023          	sb	a5,256(s1)
        ep->cur_clus = ep->first_clus = alloc_clus(dp->dev);
    8020735e:	11494503          	lbu	a0,276(s2)
    80207362:	fffff097          	auipc	ra,0xfffff
    80207366:	940080e7          	jalr	-1728(ra) # 80205ca2 <alloc_clus>
    8020736a:	2501                	sext.w	a0,a0
    8020736c:	10a4a223          	sw	a0,260(s1)
    80207370:	10a4a623          	sw	a0,268(s1)
        emake(ep, ep, 0);
    80207374:	4601                	li	a2,0
    80207376:	85a6                	mv	a1,s1
    80207378:	8526                	mv	a0,s1
    8020737a:	fffff097          	auipc	ra,0xfffff
    8020737e:	3da080e7          	jalr	986(ra) # 80206754 <emake>
        emake(ep, dp, 32);
    80207382:	02000613          	li	a2,32
    80207386:	85ca                	mv	a1,s2
    80207388:	8526                	mv	a0,s1
    8020738a:	fffff097          	auipc	ra,0xfffff
    8020738e:	3ca080e7          	jalr	970(ra) # 80206754 <emake>
    80207392:	bf79                	j	80207330 <ealloc+0xdc>
        return NULL;
    80207394:	84aa                	mv	s1,a0
    80207396:	b739                	j	802072a4 <ealloc+0x50>

0000000080207398 <lookup_path>:
    return path;
}

// FAT32 version of namex in xv6's original file system.
static struct dirent *lookup_path(char *path, int parent, char *name)
{
    80207398:	715d                	addi	sp,sp,-80
    8020739a:	e486                	sd	ra,72(sp)
    8020739c:	e0a2                	sd	s0,64(sp)
    8020739e:	fc26                	sd	s1,56(sp)
    802073a0:	f84a                	sd	s2,48(sp)
    802073a2:	f44e                	sd	s3,40(sp)
    802073a4:	f052                	sd	s4,32(sp)
    802073a6:	ec56                	sd	s5,24(sp)
    802073a8:	e85a                	sd	s6,16(sp)
    802073aa:	e45e                	sd	s7,8(sp)
    802073ac:	e062                	sd	s8,0(sp)
    802073ae:	0880                	addi	s0,sp,80
    802073b0:	892a                	mv	s2,a0
    802073b2:	8b2e                	mv	s6,a1
    802073b4:	8ab2                	mv	s5,a2
    struct dirent *entry, *next;
    if (*path == '/') {
    802073b6:	00054783          	lbu	a5,0(a0)
    802073ba:	02f00713          	li	a4,47
    802073be:	02e78663          	beq	a5,a4,802073ea <lookup_path+0x52>
        entry = edup(&root);
    } else if (*path != '\0') {
        entry = edup(myproc()->cwd);
    } else {
        return NULL;
    802073c2:	4981                	li	s3,0
    } else if (*path != '\0') {
    802073c4:	cba1                	beqz	a5,80207414 <lookup_path+0x7c>
        entry = edup(myproc()->cwd);
    802073c6:	ffffa097          	auipc	ra,0xffffa
    802073ca:	6ae080e7          	jalr	1710(ra) # 80201a74 <myproc>
    802073ce:	15853503          	ld	a0,344(a0)
    802073d2:	fffff097          	auipc	ra,0xfffff
    802073d6:	732080e7          	jalr	1842(ra) # 80206b04 <edup>
    802073da:	89aa                	mv	s3,a0
    while (*path == '/') {
    802073dc:	02f00a13          	li	s4,47
    802073e0:	0ff00b93          	li	s7,255
    802073e4:	0ff00c13          	li	s8,255
    802073e8:	a0dd                	j	802074ce <lookup_path+0x136>
        entry = edup(&root);
    802073ea:	00019517          	auipc	a0,0x19
    802073ee:	06650513          	addi	a0,a0,102 # 80220450 <root>
    802073f2:	fffff097          	auipc	ra,0xfffff
    802073f6:	712080e7          	jalr	1810(ra) # 80206b04 <edup>
    802073fa:	89aa                	mv	s3,a0
    802073fc:	b7c5                	j	802073dc <lookup_path+0x44>
    }
    while ((path = skipelem(path, name)) != 0) {
        elock(entry);
        if (!(entry->attribute & ATTR_DIRECTORY)) {
            eunlock(entry);
    802073fe:	854e                	mv	a0,s3
    80207400:	00000097          	auipc	ra,0x0
    80207404:	998080e7          	jalr	-1640(ra) # 80206d98 <eunlock>
            eput(entry);
    80207408:	854e                	mv	a0,s3
    8020740a:	00000097          	auipc	ra,0x0
    8020740e:	9dc080e7          	jalr	-1572(ra) # 80206de6 <eput>
            return NULL;
    80207412:	4981                	li	s3,0
    if (parent) {
        eput(entry);
        return NULL;
    }
    return entry;
}
    80207414:	854e                	mv	a0,s3
    80207416:	60a6                	ld	ra,72(sp)
    80207418:	6406                	ld	s0,64(sp)
    8020741a:	74e2                	ld	s1,56(sp)
    8020741c:	7942                	ld	s2,48(sp)
    8020741e:	79a2                	ld	s3,40(sp)
    80207420:	7a02                	ld	s4,32(sp)
    80207422:	6ae2                	ld	s5,24(sp)
    80207424:	6b42                	ld	s6,16(sp)
    80207426:	6ba2                	ld	s7,8(sp)
    80207428:	6c02                	ld	s8,0(sp)
    8020742a:	6161                	addi	sp,sp,80
    8020742c:	8082                	ret
            eunlock(entry);
    8020742e:	854e                	mv	a0,s3
    80207430:	00000097          	auipc	ra,0x0
    80207434:	968080e7          	jalr	-1688(ra) # 80206d98 <eunlock>
            return entry;
    80207438:	bff1                	j	80207414 <lookup_path+0x7c>
            eunlock(entry);
    8020743a:	854e                	mv	a0,s3
    8020743c:	00000097          	auipc	ra,0x0
    80207440:	95c080e7          	jalr	-1700(ra) # 80206d98 <eunlock>
            eput(entry);
    80207444:	854e                	mv	a0,s3
    80207446:	00000097          	auipc	ra,0x0
    8020744a:	9a0080e7          	jalr	-1632(ra) # 80206de6 <eput>
            return NULL;
    8020744e:	89ca                	mv	s3,s2
    80207450:	b7d1                	j	80207414 <lookup_path+0x7c>
    int len = path - s;
    80207452:	412487bb          	subw	a5,s1,s2
    if (len > FAT32_MAX_FILENAME) {
    80207456:	863e                	mv	a2,a5
    80207458:	00fbd363          	bge	s7,a5,8020745e <lookup_path+0xc6>
    8020745c:	8662                	mv	a2,s8
    8020745e:	0006079b          	sext.w	a5,a2
    name[len] = 0;
    80207462:	97d6                	add	a5,a5,s5
    80207464:	00078023          	sb	zero,0(a5)
    memmove(name, s, len);
    80207468:	2601                	sext.w	a2,a2
    8020746a:	85ca                	mv	a1,s2
    8020746c:	8556                	mv	a0,s5
    8020746e:	ffff9097          	auipc	ra,0xffff9
    80207472:	356080e7          	jalr	854(ra) # 802007c4 <memmove>
    while (*path == '/') {
    80207476:	0004c783          	lbu	a5,0(s1)
    8020747a:	01479763          	bne	a5,s4,80207488 <lookup_path+0xf0>
        path++;
    8020747e:	0485                	addi	s1,s1,1
    while (*path == '/') {
    80207480:	0004c783          	lbu	a5,0(s1)
    80207484:	ff478de3          	beq	a5,s4,8020747e <lookup_path+0xe6>
        elock(entry);
    80207488:	854e                	mv	a0,s3
    8020748a:	00000097          	auipc	ra,0x0
    8020748e:	8d8080e7          	jalr	-1832(ra) # 80206d62 <elock>
        if (!(entry->attribute & ATTR_DIRECTORY)) {
    80207492:	1009c783          	lbu	a5,256(s3)
    80207496:	8bc1                	andi	a5,a5,16
    80207498:	d3bd                	beqz	a5,802073fe <lookup_path+0x66>
        if (parent && *path == '\0') {
    8020749a:	000b0563          	beqz	s6,802074a4 <lookup_path+0x10c>
    8020749e:	0004c783          	lbu	a5,0(s1)
    802074a2:	d7d1                	beqz	a5,8020742e <lookup_path+0x96>
        if ((next = dirlookup(entry, name, 0)) == 0) {
    802074a4:	4601                	li	a2,0
    802074a6:	85d6                	mv	a1,s5
    802074a8:	854e                	mv	a0,s3
    802074aa:	00000097          	auipc	ra,0x0
    802074ae:	c4c080e7          	jalr	-948(ra) # 802070f6 <dirlookup>
    802074b2:	892a                	mv	s2,a0
    802074b4:	d159                	beqz	a0,8020743a <lookup_path+0xa2>
        eunlock(entry);
    802074b6:	854e                	mv	a0,s3
    802074b8:	00000097          	auipc	ra,0x0
    802074bc:	8e0080e7          	jalr	-1824(ra) # 80206d98 <eunlock>
        eput(entry);
    802074c0:	854e                	mv	a0,s3
    802074c2:	00000097          	auipc	ra,0x0
    802074c6:	924080e7          	jalr	-1756(ra) # 80206de6 <eput>
        entry = next;
    802074ca:	89ca                	mv	s3,s2
        eput(entry);
    802074cc:	8926                	mv	s2,s1
    while (*path == '/') {
    802074ce:	00094783          	lbu	a5,0(s2)
    802074d2:	03479363          	bne	a5,s4,802074f8 <lookup_path+0x160>
        path++;
    802074d6:	0905                	addi	s2,s2,1
    while (*path == '/') {
    802074d8:	00094783          	lbu	a5,0(s2)
    802074dc:	ff478de3          	beq	a5,s4,802074d6 <lookup_path+0x13e>
    if (*path == 0) { return NULL; }
    802074e0:	cf89                	beqz	a5,802074fa <lookup_path+0x162>
        path++;
    802074e2:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    802074e4:	f74787e3          	beq	a5,s4,80207452 <lookup_path+0xba>
        eput(entry);
    802074e8:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    802074ea:	d7a5                	beqz	a5,80207452 <lookup_path+0xba>
        path++;
    802074ec:	0485                	addi	s1,s1,1
    while (*path != '/' && *path != 0) {
    802074ee:	0004c783          	lbu	a5,0(s1)
    802074f2:	ff479ce3          	bne	a5,s4,802074ea <lookup_path+0x152>
    802074f6:	bfb1                	j	80207452 <lookup_path+0xba>
    if (*path == 0) { return NULL; }
    802074f8:	fbe5                	bnez	a5,802074e8 <lookup_path+0x150>
    if (parent) {
    802074fa:	f00b0de3          	beqz	s6,80207414 <lookup_path+0x7c>
        eput(entry);
    802074fe:	854e                	mv	a0,s3
    80207500:	00000097          	auipc	ra,0x0
    80207504:	8e6080e7          	jalr	-1818(ra) # 80206de6 <eput>
        return NULL;
    80207508:	4981                	li	s3,0
    8020750a:	b729                	j	80207414 <lookup_path+0x7c>

000000008020750c <ename>:

struct dirent *ename(char *path)
{
    8020750c:	716d                	addi	sp,sp,-272
    8020750e:	e606                	sd	ra,264(sp)
    80207510:	e222                	sd	s0,256(sp)
    80207512:	0a00                	addi	s0,sp,272
    char name[FAT32_MAX_FILENAME + 1];
    return lookup_path(path, 0, name);
    80207514:	ef040613          	addi	a2,s0,-272
    80207518:	4581                	li	a1,0
    8020751a:	00000097          	auipc	ra,0x0
    8020751e:	e7e080e7          	jalr	-386(ra) # 80207398 <lookup_path>
}
    80207522:	60b2                	ld	ra,264(sp)
    80207524:	6412                	ld	s0,256(sp)
    80207526:	6151                	addi	sp,sp,272
    80207528:	8082                	ret

000000008020752a <enameparent>:

struct dirent *enameparent(char *path, char *name)
{
    8020752a:	1141                	addi	sp,sp,-16
    8020752c:	e406                	sd	ra,8(sp)
    8020752e:	e022                	sd	s0,0(sp)
    80207530:	0800                	addi	s0,sp,16
    80207532:	862e                	mv	a2,a1
    return lookup_path(path, 1, name);
    80207534:	4585                	li	a1,1
    80207536:	00000097          	auipc	ra,0x0
    8020753a:	e62080e7          	jalr	-414(ra) # 80207398 <lookup_path>
}
    8020753e:	60a2                	ld	ra,8(sp)
    80207540:	6402                	ld	s0,0(sp)
    80207542:	0141                	addi	sp,sp,16
    80207544:	8082                	ret

0000000080207546 <plicinit>:

//
// the riscv Platform Level Interrupt Controller (PLIC).
//

void plicinit(void) {
    80207546:	1141                	addi	sp,sp,-16
    80207548:	e422                	sd	s0,8(sp)
    8020754a:	0800                	addi	s0,sp,16
	writed(1, PLIC_V + DISK_IRQ * sizeof(uint32));
    8020754c:	00fc37b7          	lui	a5,0xfc3
    80207550:	07ba                	slli	a5,a5,0xe
    80207552:	4705                	li	a4,1
    80207554:	c3d8                	sw	a4,4(a5)
	writed(1, PLIC_V + UART_IRQ * sizeof(uint32));
    80207556:	d798                	sw	a4,40(a5)

	#ifdef DEBUG 
	printf("plicinit\n");
	#endif 
}
    80207558:	6422                	ld	s0,8(sp)
    8020755a:	0141                	addi	sp,sp,16
    8020755c:	8082                	ret

000000008020755e <plicinithart>:

void
plicinithart(void)
{
    8020755e:	1141                	addi	sp,sp,-16
    80207560:	e406                	sd	ra,8(sp)
    80207562:	e022                	sd	s0,0(sp)
    80207564:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80207566:	ffffa097          	auipc	ra,0xffffa
    8020756a:	4e2080e7          	jalr	1250(ra) # 80201a48 <cpuid>
  #ifdef QEMU
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART_IRQ) | (1 << DISK_IRQ);
    8020756e:	0085171b          	slliw	a4,a0,0x8
    80207572:	01f867b7          	lui	a5,0x1f86
    80207576:	0785                	addi	a5,a5,1
    80207578:	07b6                	slli	a5,a5,0xd
    8020757a:	97ba                	add	a5,a5,a4
    8020757c:	40200713          	li	a4,1026
    80207580:	08e7a023          	sw	a4,128(a5) # 1f86080 <_entry-0x7e279f80>
  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80207584:	00d5179b          	slliw	a5,a0,0xd
    80207588:	03f0c537          	lui	a0,0x3f0c
    8020758c:	20150513          	addi	a0,a0,513 # 3f0c201 <_entry-0x7c2f3dff>
    80207590:	0532                	slli	a0,a0,0xc
    80207592:	953e                	add	a0,a0,a5
    80207594:	00052023          	sw	zero,0(a0)
  *(hart0_m_int_enable_hi) = readd(hart0_m_int_enable_hi) | (1 << (UART_IRQ % 32));
  #endif
  #ifdef DEBUG
  printf("plicinithart\n");
  #endif
}
    80207598:	60a2                	ld	ra,8(sp)
    8020759a:	6402                	ld	s0,0(sp)
    8020759c:	0141                	addi	sp,sp,16
    8020759e:	8082                	ret

00000000802075a0 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    802075a0:	1141                	addi	sp,sp,-16
    802075a2:	e406                	sd	ra,8(sp)
    802075a4:	e022                	sd	s0,0(sp)
    802075a6:	0800                	addi	s0,sp,16
  int hart = cpuid();
    802075a8:	ffffa097          	auipc	ra,0xffffa
    802075ac:	4a0080e7          	jalr	1184(ra) # 80201a48 <cpuid>
  int irq;
  #ifndef QEMU
  irq = *(uint32*)PLIC_MCLAIM(hart);
  #else
  irq = *(uint32*)PLIC_SCLAIM(hart);
    802075b0:	00d5179b          	slliw	a5,a0,0xd
    802075b4:	03f0c537          	lui	a0,0x3f0c
    802075b8:	20150513          	addi	a0,a0,513 # 3f0c201 <_entry-0x7c2f3dff>
    802075bc:	0532                	slli	a0,a0,0xc
    802075be:	953e                	add	a0,a0,a5
  #endif
  return irq;
}
    802075c0:	4148                	lw	a0,4(a0)
    802075c2:	60a2                	ld	ra,8(sp)
    802075c4:	6402                	ld	s0,0(sp)
    802075c6:	0141                	addi	sp,sp,16
    802075c8:	8082                	ret

00000000802075ca <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    802075ca:	1101                	addi	sp,sp,-32
    802075cc:	ec06                	sd	ra,24(sp)
    802075ce:	e822                	sd	s0,16(sp)
    802075d0:	e426                	sd	s1,8(sp)
    802075d2:	1000                	addi	s0,sp,32
    802075d4:	84aa                	mv	s1,a0
  int hart = cpuid();
    802075d6:	ffffa097          	auipc	ra,0xffffa
    802075da:	472080e7          	jalr	1138(ra) # 80201a48 <cpuid>
  #ifndef QEMU
  *(uint32*)PLIC_MCLAIM(hart) = irq;
  #else
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    802075de:	00d5151b          	slliw	a0,a0,0xd
    802075e2:	03f0c7b7          	lui	a5,0x3f0c
    802075e6:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    802075ea:	07b2                	slli	a5,a5,0xc
    802075ec:	97aa                	add	a5,a5,a0
    802075ee:	c3c4                	sw	s1,4(a5)
  #endif
}
    802075f0:	60e2                	ld	ra,24(sp)
    802075f2:	6442                	ld	s0,16(sp)
    802075f4:	64a2                	ld	s1,8(sp)
    802075f6:	6105                	addi	sp,sp,32
    802075f8:	8082                	ret

00000000802075fa <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    802075fa:	715d                	addi	sp,sp,-80
    802075fc:	e486                	sd	ra,72(sp)
    802075fe:	e0a2                	sd	s0,64(sp)
    80207600:	fc26                	sd	s1,56(sp)
    80207602:	f84a                	sd	s2,48(sp)
    80207604:	f44e                	sd	s3,40(sp)
    80207606:	f052                	sd	s4,32(sp)
    80207608:	ec56                	sd	s5,24(sp)
    8020760a:	e85a                	sd	s6,16(sp)
    8020760c:	0880                	addi	s0,sp,80
    8020760e:	8a2a                	mv	s4,a0
    80207610:	84ae                	mv	s1,a1
    80207612:	89b2                	mv	s3,a2
  int i;

  acquire(&cons.lock);
    80207614:	0001d517          	auipc	a0,0x1d
    80207618:	60c50513          	addi	a0,a0,1548 # 80224c20 <cons>
    8020761c:	ffff9097          	auipc	ra,0xffff9
    80207620:	0ac080e7          	jalr	172(ra) # 802006c8 <acquire>
  for(i = 0; i < n; i++){
    80207624:	05305f63          	blez	s3,80207682 <consolewrite+0x88>
    80207628:	4901                	li	s2,0
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    8020762a:	fbf40b13          	addi	s6,s0,-65
    8020762e:	5afd                	li	s5,-1
    80207630:	4685                	li	a3,1
    80207632:	8626                	mv	a2,s1
    80207634:	85d2                	mv	a1,s4
    80207636:	855a                	mv	a0,s6
    80207638:	ffffb097          	auipc	ra,0xffffb
    8020763c:	f32080e7          	jalr	-206(ra) # 8020256a <either_copyin>
    80207640:	01550e63          	beq	a0,s5,8020765c <consolewrite+0x62>
	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
    80207644:	fbf44503          	lbu	a0,-65(s0)
    80207648:	4581                	li	a1,0
    8020764a:	4601                	li	a2,0
    8020764c:	4681                	li	a3,0
    8020764e:	4885                	li	a7,1
    80207650:	00000073          	ecall
  for(i = 0; i < n; i++){
    80207654:	2905                	addiw	s2,s2,1
    80207656:	0485                	addi	s1,s1,1
    80207658:	fd299ce3          	bne	s3,s2,80207630 <consolewrite+0x36>
      break;
    sbi_console_putchar(c);
  }
  release(&cons.lock);
    8020765c:	0001d517          	auipc	a0,0x1d
    80207660:	5c450513          	addi	a0,a0,1476 # 80224c20 <cons>
    80207664:	ffff9097          	auipc	ra,0xffff9
    80207668:	0b8080e7          	jalr	184(ra) # 8020071c <release>

  return i;
}
    8020766c:	854a                	mv	a0,s2
    8020766e:	60a6                	ld	ra,72(sp)
    80207670:	6406                	ld	s0,64(sp)
    80207672:	74e2                	ld	s1,56(sp)
    80207674:	7942                	ld	s2,48(sp)
    80207676:	79a2                	ld	s3,40(sp)
    80207678:	7a02                	ld	s4,32(sp)
    8020767a:	6ae2                	ld	s5,24(sp)
    8020767c:	6b42                	ld	s6,16(sp)
    8020767e:	6161                	addi	sp,sp,80
    80207680:	8082                	ret
  for(i = 0; i < n; i++){
    80207682:	4901                	li	s2,0
    80207684:	bfe1                	j	8020765c <consolewrite+0x62>

0000000080207686 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80207686:	7175                	addi	sp,sp,-144
    80207688:	e506                	sd	ra,136(sp)
    8020768a:	e122                	sd	s0,128(sp)
    8020768c:	fca6                	sd	s1,120(sp)
    8020768e:	f8ca                	sd	s2,112(sp)
    80207690:	f4ce                	sd	s3,104(sp)
    80207692:	f0d2                	sd	s4,96(sp)
    80207694:	ecd6                	sd	s5,88(sp)
    80207696:	e8da                	sd	s6,80(sp)
    80207698:	e4de                	sd	s7,72(sp)
    8020769a:	e0e2                	sd	s8,64(sp)
    8020769c:	fc66                	sd	s9,56(sp)
    8020769e:	f86a                	sd	s10,48(sp)
    802076a0:	f46e                	sd	s11,40(sp)
    802076a2:	0900                	addi	s0,sp,144
    802076a4:	f6a43c23          	sd	a0,-136(s0)
    802076a8:	8aae                	mv	s5,a1
    802076aa:	8a32                	mv	s4,a2
  uint target;
  int c;
  char cbuf;

  target = n;
    802076ac:	00060b1b          	sext.w	s6,a2
  acquire(&cons.lock);
    802076b0:	0001d517          	auipc	a0,0x1d
    802076b4:	57050513          	addi	a0,a0,1392 # 80224c20 <cons>
    802076b8:	ffff9097          	auipc	ra,0xffff9
    802076bc:	010080e7          	jalr	16(ra) # 802006c8 <acquire>
  while(n > 0){
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
    802076c0:	0001d497          	auipc	s1,0x1d
    802076c4:	56048493          	addi	s1,s1,1376 # 80224c20 <cons>
      if(myproc()->killed){
        release(&cons.lock);
        return -1;
      }
      sleep(&cons.r, &cons.lock);
    802076c8:	89a6                	mv	s3,s1
    802076ca:	0001d917          	auipc	s2,0x1d
    802076ce:	5ee90913          	addi	s2,s2,1518 # 80224cb8 <cons+0x98>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];

    if(c == C('D')){  // end-of-file
    802076d2:	4c11                	li	s8,4
      break;
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    802076d4:	f8f40d13          	addi	s10,s0,-113
    802076d8:	5cfd                	li	s9,-1
      break;

    dst++;
    --n;

    if(c == '\n'){
    802076da:	4da9                	li	s11,10
  while(n > 0){
    802076dc:	07405863          	blez	s4,8020774c <consoleread+0xc6>
    while(cons.r == cons.w){
    802076e0:	0984a783          	lw	a5,152(s1)
    802076e4:	09c4a703          	lw	a4,156(s1)
    802076e8:	02f71463          	bne	a4,a5,80207710 <consoleread+0x8a>
      if(myproc()->killed){
    802076ec:	ffffa097          	auipc	ra,0xffffa
    802076f0:	388080e7          	jalr	904(ra) # 80201a74 <myproc>
    802076f4:	591c                	lw	a5,48(a0)
    802076f6:	e7b5                	bnez	a5,80207762 <consoleread+0xdc>
      sleep(&cons.r, &cons.lock);
    802076f8:	85ce                	mv	a1,s3
    802076fa:	854a                	mv	a0,s2
    802076fc:	ffffb097          	auipc	ra,0xffffb
    80207700:	bda080e7          	jalr	-1062(ra) # 802022d6 <sleep>
    while(cons.r == cons.w){
    80207704:	0984a783          	lw	a5,152(s1)
    80207708:	09c4a703          	lw	a4,156(s1)
    8020770c:	fef700e3          	beq	a4,a5,802076ec <consoleread+0x66>
    c = cons.buf[cons.r++ % INPUT_BUF];
    80207710:	0017871b          	addiw	a4,a5,1
    80207714:	08e4ac23          	sw	a4,152(s1)
    80207718:	07f7f713          	andi	a4,a5,127
    8020771c:	9726                	add	a4,a4,s1
    8020771e:	01874703          	lbu	a4,24(a4)
    80207722:	00070b9b          	sext.w	s7,a4
    if(c == C('D')){  // end-of-file
    80207726:	078b8663          	beq	s7,s8,80207792 <consoleread+0x10c>
    cbuf = c;
    8020772a:	f8e407a3          	sb	a4,-113(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    8020772e:	4685                	li	a3,1
    80207730:	866a                	mv	a2,s10
    80207732:	85d6                	mv	a1,s5
    80207734:	f7843503          	ld	a0,-136(s0)
    80207738:	ffffb097          	auipc	ra,0xffffb
    8020773c:	dfc080e7          	jalr	-516(ra) # 80202534 <either_copyout>
    80207740:	01950663          	beq	a0,s9,8020774c <consoleread+0xc6>
    dst++;
    80207744:	0a85                	addi	s5,s5,1
    --n;
    80207746:	3a7d                	addiw	s4,s4,-1
    if(c == '\n'){
    80207748:	f9bb9ae3          	bne	s7,s11,802076dc <consoleread+0x56>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    }
  }
  release(&cons.lock);
    8020774c:	0001d517          	auipc	a0,0x1d
    80207750:	4d450513          	addi	a0,a0,1236 # 80224c20 <cons>
    80207754:	ffff9097          	auipc	ra,0xffff9
    80207758:	fc8080e7          	jalr	-56(ra) # 8020071c <release>

  return target - n;
    8020775c:	414b053b          	subw	a0,s6,s4
    80207760:	a811                	j	80207774 <consoleread+0xee>
        release(&cons.lock);
    80207762:	0001d517          	auipc	a0,0x1d
    80207766:	4be50513          	addi	a0,a0,1214 # 80224c20 <cons>
    8020776a:	ffff9097          	auipc	ra,0xffff9
    8020776e:	fb2080e7          	jalr	-78(ra) # 8020071c <release>
        return -1;
    80207772:	557d                	li	a0,-1
}
    80207774:	60aa                	ld	ra,136(sp)
    80207776:	640a                	ld	s0,128(sp)
    80207778:	74e6                	ld	s1,120(sp)
    8020777a:	7946                	ld	s2,112(sp)
    8020777c:	79a6                	ld	s3,104(sp)
    8020777e:	7a06                	ld	s4,96(sp)
    80207780:	6ae6                	ld	s5,88(sp)
    80207782:	6b46                	ld	s6,80(sp)
    80207784:	6ba6                	ld	s7,72(sp)
    80207786:	6c06                	ld	s8,64(sp)
    80207788:	7ce2                	ld	s9,56(sp)
    8020778a:	7d42                	ld	s10,48(sp)
    8020778c:	7da2                	ld	s11,40(sp)
    8020778e:	6149                	addi	sp,sp,144
    80207790:	8082                	ret
      if(n < target){
    80207792:	000a071b          	sext.w	a4,s4
    80207796:	fb677be3          	bgeu	a4,s6,8020774c <consoleread+0xc6>
        cons.r--;
    8020779a:	0001d717          	auipc	a4,0x1d
    8020779e:	50f72f23          	sw	a5,1310(a4) # 80224cb8 <cons+0x98>
    802077a2:	b76d                	j	8020774c <consoleread+0xc6>

00000000802077a4 <consputc>:
void consputc(int c) {
    802077a4:	1141                	addi	sp,sp,-16
    802077a6:	e422                	sd	s0,8(sp)
    802077a8:	0800                	addi	s0,sp,16
  if(c == BACKSPACE){
    802077aa:	10000793          	li	a5,256
    802077ae:	00f50b63          	beq	a0,a5,802077c4 <consputc+0x20>
    802077b2:	4581                	li	a1,0
    802077b4:	4601                	li	a2,0
    802077b6:	4681                	li	a3,0
    802077b8:	4885                	li	a7,1
    802077ba:	00000073          	ecall
}
    802077be:	6422                	ld	s0,8(sp)
    802077c0:	0141                	addi	sp,sp,16
    802077c2:	8082                	ret
    802077c4:	4521                	li	a0,8
    802077c6:	4581                	li	a1,0
    802077c8:	4601                	li	a2,0
    802077ca:	4681                	li	a3,0
    802077cc:	4885                	li	a7,1
    802077ce:	00000073          	ecall
    802077d2:	02000513          	li	a0,32
    802077d6:	00000073          	ecall
    802077da:	4521                	li	a0,8
    802077dc:	00000073          	ecall
}
    802077e0:	bff9                	j	802077be <consputc+0x1a>

00000000802077e2 <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    802077e2:	1101                	addi	sp,sp,-32
    802077e4:	ec06                	sd	ra,24(sp)
    802077e6:	e822                	sd	s0,16(sp)
    802077e8:	e426                	sd	s1,8(sp)
    802077ea:	e04a                	sd	s2,0(sp)
    802077ec:	1000                	addi	s0,sp,32
    802077ee:	84aa                	mv	s1,a0
  acquire(&cons.lock);
    802077f0:	0001d517          	auipc	a0,0x1d
    802077f4:	43050513          	addi	a0,a0,1072 # 80224c20 <cons>
    802077f8:	ffff9097          	auipc	ra,0xffff9
    802077fc:	ed0080e7          	jalr	-304(ra) # 802006c8 <acquire>

  switch(c){
    80207800:	47d5                	li	a5,21
    80207802:	0af48663          	beq	s1,a5,802078ae <consoleintr+0xcc>
    80207806:	0297ca63          	blt	a5,s1,8020783a <consoleintr+0x58>
    8020780a:	47a1                	li	a5,8
    8020780c:	0ef48763          	beq	s1,a5,802078fa <consoleintr+0x118>
    80207810:	47c1                	li	a5,16
    80207812:	10f49a63          	bne	s1,a5,80207926 <consoleintr+0x144>
  case C('P'):  // Print process list.
    procdump();
    80207816:	ffffb097          	auipc	ra,0xffffb
    8020781a:	d88080e7          	jalr	-632(ra) # 8020259e <procdump>
      }
    }
    break;
  }
  
  release(&cons.lock);
    8020781e:	0001d517          	auipc	a0,0x1d
    80207822:	40250513          	addi	a0,a0,1026 # 80224c20 <cons>
    80207826:	ffff9097          	auipc	ra,0xffff9
    8020782a:	ef6080e7          	jalr	-266(ra) # 8020071c <release>
}
    8020782e:	60e2                	ld	ra,24(sp)
    80207830:	6442                	ld	s0,16(sp)
    80207832:	64a2                	ld	s1,8(sp)
    80207834:	6902                	ld	s2,0(sp)
    80207836:	6105                	addi	sp,sp,32
    80207838:	8082                	ret
  switch(c){
    8020783a:	07f00793          	li	a5,127
    8020783e:	0af48e63          	beq	s1,a5,802078fa <consoleintr+0x118>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80207842:	0001d717          	auipc	a4,0x1d
    80207846:	3de70713          	addi	a4,a4,990 # 80224c20 <cons>
    8020784a:	0a072783          	lw	a5,160(a4)
    8020784e:	09872703          	lw	a4,152(a4)
    80207852:	9f99                	subw	a5,a5,a4
    80207854:	07f00713          	li	a4,127
    80207858:	fcf763e3          	bltu	a4,a5,8020781e <consoleintr+0x3c>
      c = (c == '\r') ? '\n' : c;
    8020785c:	47b5                	li	a5,13
    8020785e:	0cf48763          	beq	s1,a5,8020792c <consoleintr+0x14a>
      consputc(c);
    80207862:	8526                	mv	a0,s1
    80207864:	00000097          	auipc	ra,0x0
    80207868:	f40080e7          	jalr	-192(ra) # 802077a4 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    8020786c:	0001d797          	auipc	a5,0x1d
    80207870:	3b478793          	addi	a5,a5,948 # 80224c20 <cons>
    80207874:	0a07a703          	lw	a4,160(a5)
    80207878:	0017069b          	addiw	a3,a4,1
    8020787c:	0006861b          	sext.w	a2,a3
    80207880:	0ad7a023          	sw	a3,160(a5)
    80207884:	07f77713          	andi	a4,a4,127
    80207888:	97ba                	add	a5,a5,a4
    8020788a:	00978c23          	sb	s1,24(a5)
      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    8020788e:	47a9                	li	a5,10
    80207890:	0cf48563          	beq	s1,a5,8020795a <consoleintr+0x178>
    80207894:	4791                	li	a5,4
    80207896:	0cf48263          	beq	s1,a5,8020795a <consoleintr+0x178>
    8020789a:	0001d797          	auipc	a5,0x1d
    8020789e:	41e7a783          	lw	a5,1054(a5) # 80224cb8 <cons+0x98>
    802078a2:	0807879b          	addiw	a5,a5,128
    802078a6:	f6f61ce3          	bne	a2,a5,8020781e <consoleintr+0x3c>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    802078aa:	863e                	mv	a2,a5
    802078ac:	a07d                	j	8020795a <consoleintr+0x178>
    while(cons.e != cons.w &&
    802078ae:	0001d717          	auipc	a4,0x1d
    802078b2:	37270713          	addi	a4,a4,882 # 80224c20 <cons>
    802078b6:	0a072783          	lw	a5,160(a4)
    802078ba:	09c72703          	lw	a4,156(a4)
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    802078be:	0001d497          	auipc	s1,0x1d
    802078c2:	36248493          	addi	s1,s1,866 # 80224c20 <cons>
    while(cons.e != cons.w &&
    802078c6:	4929                	li	s2,10
    802078c8:	f4f70be3          	beq	a4,a5,8020781e <consoleintr+0x3c>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    802078cc:	37fd                	addiw	a5,a5,-1
    802078ce:	07f7f713          	andi	a4,a5,127
    802078d2:	9726                	add	a4,a4,s1
    while(cons.e != cons.w &&
    802078d4:	01874703          	lbu	a4,24(a4)
    802078d8:	f52703e3          	beq	a4,s2,8020781e <consoleintr+0x3c>
      cons.e--;
    802078dc:	0af4a023          	sw	a5,160(s1)
      consputc(BACKSPACE);
    802078e0:	10000513          	li	a0,256
    802078e4:	00000097          	auipc	ra,0x0
    802078e8:	ec0080e7          	jalr	-320(ra) # 802077a4 <consputc>
    while(cons.e != cons.w &&
    802078ec:	0a04a783          	lw	a5,160(s1)
    802078f0:	09c4a703          	lw	a4,156(s1)
    802078f4:	fcf71ce3          	bne	a4,a5,802078cc <consoleintr+0xea>
    802078f8:	b71d                	j	8020781e <consoleintr+0x3c>
    if(cons.e != cons.w){
    802078fa:	0001d717          	auipc	a4,0x1d
    802078fe:	32670713          	addi	a4,a4,806 # 80224c20 <cons>
    80207902:	0a072783          	lw	a5,160(a4)
    80207906:	09c72703          	lw	a4,156(a4)
    8020790a:	f0f70ae3          	beq	a4,a5,8020781e <consoleintr+0x3c>
      cons.e--;
    8020790e:	37fd                	addiw	a5,a5,-1
    80207910:	0001d717          	auipc	a4,0x1d
    80207914:	3af72823          	sw	a5,944(a4) # 80224cc0 <cons+0xa0>
      consputc(BACKSPACE);
    80207918:	10000513          	li	a0,256
    8020791c:	00000097          	auipc	ra,0x0
    80207920:	e88080e7          	jalr	-376(ra) # 802077a4 <consputc>
    80207924:	bded                	j	8020781e <consoleintr+0x3c>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80207926:	ee048ce3          	beqz	s1,8020781e <consoleintr+0x3c>
    8020792a:	bf21                	j	80207842 <consoleintr+0x60>
      consputc(c);
    8020792c:	4529                	li	a0,10
    8020792e:	00000097          	auipc	ra,0x0
    80207932:	e76080e7          	jalr	-394(ra) # 802077a4 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80207936:	0001d797          	auipc	a5,0x1d
    8020793a:	2ea78793          	addi	a5,a5,746 # 80224c20 <cons>
    8020793e:	0a07a703          	lw	a4,160(a5)
    80207942:	0017069b          	addiw	a3,a4,1
    80207946:	0006861b          	sext.w	a2,a3
    8020794a:	0ad7a023          	sw	a3,160(a5)
    8020794e:	07f77713          	andi	a4,a4,127
    80207952:	97ba                	add	a5,a5,a4
    80207954:	4729                	li	a4,10
    80207956:	00e78c23          	sb	a4,24(a5)
        cons.w = cons.e;
    8020795a:	0001d797          	auipc	a5,0x1d
    8020795e:	36c7a123          	sw	a2,866(a5) # 80224cbc <cons+0x9c>
        wakeup(&cons.r);
    80207962:	0001d517          	auipc	a0,0x1d
    80207966:	35650513          	addi	a0,a0,854 # 80224cb8 <cons+0x98>
    8020796a:	ffffb097          	auipc	ra,0xffffb
    8020796e:	aee080e7          	jalr	-1298(ra) # 80202458 <wakeup>
    80207972:	b575                	j	8020781e <consoleintr+0x3c>

0000000080207974 <consoleinit>:

void
consoleinit(void)
{
    80207974:	1101                	addi	sp,sp,-32
    80207976:	ec06                	sd	ra,24(sp)
    80207978:	e822                	sd	s0,16(sp)
    8020797a:	e426                	sd	s1,8(sp)
    8020797c:	1000                	addi	s0,sp,32
  initlock(&cons.lock, "cons");
    8020797e:	0001d497          	auipc	s1,0x1d
    80207982:	2a248493          	addi	s1,s1,674 # 80224c20 <cons>
    80207986:	00003597          	auipc	a1,0x3
    8020798a:	45258593          	addi	a1,a1,1106 # 8020add8 <digits+0xa58>
    8020798e:	8526                	mv	a0,s1
    80207990:	ffff9097          	auipc	ra,0xffff9
    80207994:	cf4080e7          	jalr	-780(ra) # 80200684 <initlock>
  uartinit();
    80207998:	00000097          	auipc	ra,0x0
    8020799c:	5bc080e7          	jalr	1468(ra) # 80207f54 <uartinit>
  cons.e = cons.w = cons.r = 0;
    802079a0:	0804ac23          	sw	zero,152(s1)
    802079a4:	0804ae23          	sw	zero,156(s1)
    802079a8:	0a04a023          	sw	zero,160(s1)
  
  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    802079ac:	00006797          	auipc	a5,0x6
    802079b0:	32c7b783          	ld	a5,812(a5) # 8020dcd8 <_GLOBAL_OFFSET_TABLE_+0x68>
    802079b4:	00000717          	auipc	a4,0x0
    802079b8:	cd270713          	addi	a4,a4,-814 # 80207686 <consoleread>
    802079bc:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    802079be:	00000717          	auipc	a4,0x0
    802079c2:	c3c70713          	addi	a4,a4,-964 # 802075fa <consolewrite>
    802079c6:	ef98                	sd	a4,24(a5)
}
    802079c8:	60e2                	ld	ra,24(sp)
    802079ca:	6442                	ld	s0,16(sp)
    802079cc:	64a2                	ld	s1,8(sp)
    802079ce:	6105                	addi	sp,sp,32
    802079d0:	8082                	ret

00000000802079d2 <free_desc>:
}

// mark a descriptor as free.
static void
free_desc(int i)
{
    802079d2:	1141                	addi	sp,sp,-16
    802079d4:	e406                	sd	ra,8(sp)
    802079d6:	e022                	sd	s0,0(sp)
    802079d8:	0800                	addi	s0,sp,16
  if(i >= NUM)
    802079da:	479d                	li	a5,7
    802079dc:	04a7cc63          	blt	a5,a0,80207a34 <free_desc+0x62>
    panic("virtio_disk_intr 1");
  if(disk.free[i])
    802079e0:	0001d797          	auipc	a5,0x1d
    802079e4:	62078793          	addi	a5,a5,1568 # 80225000 <disk>
    802079e8:	00a78733          	add	a4,a5,a0
    802079ec:	6789                	lui	a5,0x2
    802079ee:	97ba                	add	a5,a5,a4
    802079f0:	0187c783          	lbu	a5,24(a5) # 2018 <_entry-0x801fdfe8>
    802079f4:	eba1                	bnez	a5,80207a44 <free_desc+0x72>
    panic("virtio_disk_intr 2");
  disk.desc[i].addr = 0;
    802079f6:	00451713          	slli	a4,a0,0x4
    802079fa:	0001f797          	auipc	a5,0x1f
    802079fe:	6067b783          	ld	a5,1542(a5) # 80227000 <disk+0x2000>
    80207a02:	97ba                	add	a5,a5,a4
    80207a04:	0007b023          	sd	zero,0(a5)
  disk.free[i] = 1;
    80207a08:	0001d797          	auipc	a5,0x1d
    80207a0c:	5f878793          	addi	a5,a5,1528 # 80225000 <disk>
    80207a10:	97aa                	add	a5,a5,a0
    80207a12:	6509                	lui	a0,0x2
    80207a14:	953e                	add	a0,a0,a5
    80207a16:	4785                	li	a5,1
    80207a18:	00f50c23          	sb	a5,24(a0) # 2018 <_entry-0x801fdfe8>
  wakeup(&disk.free[0]);
    80207a1c:	0001f517          	auipc	a0,0x1f
    80207a20:	5fc50513          	addi	a0,a0,1532 # 80227018 <disk+0x2018>
    80207a24:	ffffb097          	auipc	ra,0xffffb
    80207a28:	a34080e7          	jalr	-1484(ra) # 80202458 <wakeup>
}
    80207a2c:	60a2                	ld	ra,8(sp)
    80207a2e:	6402                	ld	s0,0(sp)
    80207a30:	0141                	addi	sp,sp,16
    80207a32:	8082                	ret
    panic("virtio_disk_intr 1");
    80207a34:	00003517          	auipc	a0,0x3
    80207a38:	3ac50513          	addi	a0,a0,940 # 8020ade0 <digits+0xa60>
    80207a3c:	ffff8097          	auipc	ra,0xffff8
    80207a40:	706080e7          	jalr	1798(ra) # 80200142 <panic>
    panic("virtio_disk_intr 2");
    80207a44:	00003517          	auipc	a0,0x3
    80207a48:	3b450513          	addi	a0,a0,948 # 8020adf8 <digits+0xa78>
    80207a4c:	ffff8097          	auipc	ra,0xffff8
    80207a50:	6f6080e7          	jalr	1782(ra) # 80200142 <panic>

0000000080207a54 <virtio_disk_init>:
{
    80207a54:	1141                	addi	sp,sp,-16
    80207a56:	e406                	sd	ra,8(sp)
    80207a58:	e022                	sd	s0,0(sp)
    80207a5a:	0800                	addi	s0,sp,16
  initlock(&disk.vdisk_lock, "virtio_disk");
    80207a5c:	00003597          	auipc	a1,0x3
    80207a60:	3b458593          	addi	a1,a1,948 # 8020ae10 <digits+0xa90>
    80207a64:	0001f517          	auipc	a0,0x1f
    80207a68:	64450513          	addi	a0,a0,1604 # 802270a8 <disk+0x20a8>
    80207a6c:	ffff9097          	auipc	ra,0xffff9
    80207a70:	c18080e7          	jalr	-1000(ra) # 80200684 <initlock>
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80207a74:	03f107b7          	lui	a5,0x3f10
    80207a78:	0785                	addi	a5,a5,1
    80207a7a:	07b2                	slli	a5,a5,0xc
    80207a7c:	4398                	lw	a4,0(a5)
    80207a7e:	2701                	sext.w	a4,a4
    80207a80:	747277b7          	lui	a5,0x74727
    80207a84:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xbad968a>
    80207a88:	12f71263          	bne	a4,a5,80207bac <virtio_disk_init+0x158>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80207a8c:	00003797          	auipc	a5,0x3
    80207a90:	40c7b783          	ld	a5,1036(a5) # 8020ae98 <digits+0xb18>
    80207a94:	439c                	lw	a5,0(a5)
    80207a96:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80207a98:	4705                	li	a4,1
    80207a9a:	10e79963          	bne	a5,a4,80207bac <virtio_disk_init+0x158>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80207a9e:	00003797          	auipc	a5,0x3
    80207aa2:	4027b783          	ld	a5,1026(a5) # 8020aea0 <digits+0xb20>
    80207aa6:	439c                	lw	a5,0(a5)
    80207aa8:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80207aaa:	4709                	li	a4,2
    80207aac:	10e79063          	bne	a5,a4,80207bac <virtio_disk_init+0x158>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80207ab0:	00003797          	auipc	a5,0x3
    80207ab4:	3f87b783          	ld	a5,1016(a5) # 8020aea8 <digits+0xb28>
    80207ab8:	4398                	lw	a4,0(a5)
    80207aba:	2701                	sext.w	a4,a4
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80207abc:	554d47b7          	lui	a5,0x554d4
    80207ac0:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ad2baaf>
    80207ac4:	0ef71463          	bne	a4,a5,80207bac <virtio_disk_init+0x158>
  *R(VIRTIO_MMIO_STATUS) = status;
    80207ac8:	00003717          	auipc	a4,0x3
    80207acc:	3e873703          	ld	a4,1000(a4) # 8020aeb0 <digits+0xb30>
    80207ad0:	4785                	li	a5,1
    80207ad2:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207ad4:	478d                	li	a5,3
    80207ad6:	c31c                	sw	a5,0(a4)
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80207ad8:	00003797          	auipc	a5,0x3
    80207adc:	3e07b783          	ld	a5,992(a5) # 8020aeb8 <digits+0xb38>
    80207ae0:	4394                	lw	a3,0(a5)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80207ae2:	c7ffe7b7          	lui	a5,0xc7ffe
    80207ae6:	75f78793          	addi	a5,a5,1887 # ffffffffc7ffe75f <kernel_end+0xffffffff47dd575f>
    80207aea:	8ff5                	and	a5,a5,a3
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80207aec:	2781                	sext.w	a5,a5
    80207aee:	00003697          	auipc	a3,0x3
    80207af2:	3d26b683          	ld	a3,978(a3) # 8020aec0 <digits+0xb40>
    80207af6:	c29c                	sw	a5,0(a3)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207af8:	47ad                	li	a5,11
    80207afa:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207afc:	47bd                	li	a5,15
    80207afe:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    80207b00:	00003797          	auipc	a5,0x3
    80207b04:	3c87b783          	ld	a5,968(a5) # 8020aec8 <digits+0xb48>
    80207b08:	6705                	lui	a4,0x1
    80207b0a:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    80207b0c:	00003797          	auipc	a5,0x3
    80207b10:	3c47b783          	ld	a5,964(a5) # 8020aed0 <digits+0xb50>
    80207b14:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    80207b18:	00003797          	auipc	a5,0x3
    80207b1c:	3c07b783          	ld	a5,960(a5) # 8020aed8 <digits+0xb58>
    80207b20:	439c                	lw	a5,0(a5)
    80207b22:	2781                	sext.w	a5,a5
  if(max == 0)
    80207b24:	cfc1                	beqz	a5,80207bbc <virtio_disk_init+0x168>
  if(max < NUM)
    80207b26:	471d                	li	a4,7
    80207b28:	0af77263          	bgeu	a4,a5,80207bcc <virtio_disk_init+0x178>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    80207b2c:	00003797          	auipc	a5,0x3
    80207b30:	3b47b783          	ld	a5,948(a5) # 8020aee0 <digits+0xb60>
    80207b34:	4721                	li	a4,8
    80207b36:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    80207b38:	6609                	lui	a2,0x2
    80207b3a:	4581                	li	a1,0
    80207b3c:	0001d517          	auipc	a0,0x1d
    80207b40:	4c450513          	addi	a0,a0,1220 # 80225000 <disk>
    80207b44:	ffff9097          	auipc	ra,0xffff9
    80207b48:	c20080e7          	jalr	-992(ra) # 80200764 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    80207b4c:	0001d717          	auipc	a4,0x1d
    80207b50:	4b470713          	addi	a4,a4,1204 # 80225000 <disk>
    80207b54:	00c75793          	srli	a5,a4,0xc
    80207b58:	2781                	sext.w	a5,a5
    80207b5a:	00003697          	auipc	a3,0x3
    80207b5e:	38e6b683          	ld	a3,910(a3) # 8020aee8 <digits+0xb68>
    80207b62:	c29c                	sw	a5,0(a3)
  disk.desc = (struct VRingDesc *) disk.pages;
    80207b64:	0001f797          	auipc	a5,0x1f
    80207b68:	49c78793          	addi	a5,a5,1180 # 80227000 <disk+0x2000>
    80207b6c:	e398                	sd	a4,0(a5)
  disk.avail = (uint16*)(((char*)disk.desc) + NUM*sizeof(struct VRingDesc));
    80207b6e:	0001d717          	auipc	a4,0x1d
    80207b72:	51270713          	addi	a4,a4,1298 # 80225080 <disk+0x80>
    80207b76:	e798                	sd	a4,8(a5)
  disk.used = (struct UsedArea *) (disk.pages + PGSIZE);
    80207b78:	0001e717          	auipc	a4,0x1e
    80207b7c:	48870713          	addi	a4,a4,1160 # 80226000 <disk+0x1000>
    80207b80:	eb98                	sd	a4,16(a5)
    disk.free[i] = 1;
    80207b82:	4705                	li	a4,1
    80207b84:	00e78c23          	sb	a4,24(a5)
    80207b88:	00e78ca3          	sb	a4,25(a5)
    80207b8c:	00e78d23          	sb	a4,26(a5)
    80207b90:	00e78da3          	sb	a4,27(a5)
    80207b94:	00e78e23          	sb	a4,28(a5)
    80207b98:	00e78ea3          	sb	a4,29(a5)
    80207b9c:	00e78f23          	sb	a4,30(a5)
    80207ba0:	00e78fa3          	sb	a4,31(a5)
}
    80207ba4:	60a2                	ld	ra,8(sp)
    80207ba6:	6402                	ld	s0,0(sp)
    80207ba8:	0141                	addi	sp,sp,16
    80207baa:	8082                	ret
    panic("could not find virtio disk");
    80207bac:	00003517          	auipc	a0,0x3
    80207bb0:	27450513          	addi	a0,a0,628 # 8020ae20 <digits+0xaa0>
    80207bb4:	ffff8097          	auipc	ra,0xffff8
    80207bb8:	58e080e7          	jalr	1422(ra) # 80200142 <panic>
    panic("virtio disk has no queue 0");
    80207bbc:	00003517          	auipc	a0,0x3
    80207bc0:	28450513          	addi	a0,a0,644 # 8020ae40 <digits+0xac0>
    80207bc4:	ffff8097          	auipc	ra,0xffff8
    80207bc8:	57e080e7          	jalr	1406(ra) # 80200142 <panic>
    panic("virtio disk max queue too short");
    80207bcc:	00003517          	auipc	a0,0x3
    80207bd0:	29450513          	addi	a0,a0,660 # 8020ae60 <digits+0xae0>
    80207bd4:	ffff8097          	auipc	ra,0xffff8
    80207bd8:	56e080e7          	jalr	1390(ra) # 80200142 <panic>

0000000080207bdc <virtio_disk_rw>:
  return 0;
}

void
virtio_disk_rw(struct buf *b, int write)
{
    80207bdc:	7119                	addi	sp,sp,-128
    80207bde:	fc86                	sd	ra,120(sp)
    80207be0:	f8a2                	sd	s0,112(sp)
    80207be2:	f4a6                	sd	s1,104(sp)
    80207be4:	f0ca                	sd	s2,96(sp)
    80207be6:	ecce                	sd	s3,88(sp)
    80207be8:	e8d2                	sd	s4,80(sp)
    80207bea:	e4d6                	sd	s5,72(sp)
    80207bec:	e0da                	sd	s6,64(sp)
    80207bee:	fc5e                	sd	s7,56(sp)
    80207bf0:	f862                	sd	s8,48(sp)
    80207bf2:	f466                	sd	s9,40(sp)
    80207bf4:	f06a                	sd	s10,32(sp)
    80207bf6:	0100                	addi	s0,sp,128
    80207bf8:	892a                	mv	s2,a0
    80207bfa:	8cae                	mv	s9,a1
  uint64 sector = b->sectorno;
    80207bfc:	00c56d03          	lwu	s10,12(a0)

  acquire(&disk.vdisk_lock);
    80207c00:	0001f517          	auipc	a0,0x1f
    80207c04:	4a850513          	addi	a0,a0,1192 # 802270a8 <disk+0x20a8>
    80207c08:	ffff9097          	auipc	ra,0xffff9
    80207c0c:	ac0080e7          	jalr	-1344(ra) # 802006c8 <acquire>
  for(int i = 0; i < 3; i++){
    80207c10:	4981                	li	s3,0
  for(int i = 0; i < NUM; i++){
    80207c12:	4c21                	li	s8,8
      disk.free[i] = 0;
    80207c14:	0001db97          	auipc	s7,0x1d
    80207c18:	3ecb8b93          	addi	s7,s7,1004 # 80225000 <disk>
    80207c1c:	6b09                	lui	s6,0x2
  for(int i = 0; i < 3; i++){
    80207c1e:	4a8d                	li	s5,3
  for(int i = 0; i < NUM; i++){
    80207c20:	8a4e                	mv	s4,s3
    80207c22:	a051                	j	80207ca6 <virtio_disk_rw+0xca>
      disk.free[i] = 0;
    80207c24:	00fb86b3          	add	a3,s7,a5
    80207c28:	96da                	add	a3,a3,s6
    80207c2a:	00068c23          	sb	zero,24(a3)
    idx[i] = alloc_desc();
    80207c2e:	c21c                	sw	a5,0(a2)
    if(idx[i] < 0){
    80207c30:	0207c563          	bltz	a5,80207c5a <virtio_disk_rw+0x7e>
  for(int i = 0; i < 3; i++){
    80207c34:	2485                	addiw	s1,s1,1
    80207c36:	0711                	addi	a4,a4,4
    80207c38:	25548463          	beq	s1,s5,80207e80 <virtio_disk_rw+0x2a4>
    idx[i] = alloc_desc();
    80207c3c:	863a                	mv	a2,a4
  for(int i = 0; i < NUM; i++){
    80207c3e:	0001f697          	auipc	a3,0x1f
    80207c42:	3da68693          	addi	a3,a3,986 # 80227018 <disk+0x2018>
    80207c46:	87d2                	mv	a5,s4
    if(disk.free[i]){
    80207c48:	0006c583          	lbu	a1,0(a3)
    80207c4c:	fde1                	bnez	a1,80207c24 <virtio_disk_rw+0x48>
  for(int i = 0; i < NUM; i++){
    80207c4e:	2785                	addiw	a5,a5,1
    80207c50:	0685                	addi	a3,a3,1
    80207c52:	ff879be3          	bne	a5,s8,80207c48 <virtio_disk_rw+0x6c>
    idx[i] = alloc_desc();
    80207c56:	57fd                	li	a5,-1
    80207c58:	c21c                	sw	a5,0(a2)
      for(int j = 0; j < i; j++)
    80207c5a:	02905a63          	blez	s1,80207c8e <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    80207c5e:	f9042503          	lw	a0,-112(s0)
    80207c62:	00000097          	auipc	ra,0x0
    80207c66:	d70080e7          	jalr	-656(ra) # 802079d2 <free_desc>
      for(int j = 0; j < i; j++)
    80207c6a:	4785                	li	a5,1
    80207c6c:	0297d163          	bge	a5,s1,80207c8e <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    80207c70:	f9442503          	lw	a0,-108(s0)
    80207c74:	00000097          	auipc	ra,0x0
    80207c78:	d5e080e7          	jalr	-674(ra) # 802079d2 <free_desc>
      for(int j = 0; j < i; j++)
    80207c7c:	4789                	li	a5,2
    80207c7e:	0097d863          	bge	a5,s1,80207c8e <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    80207c82:	f9842503          	lw	a0,-104(s0)
    80207c86:	00000097          	auipc	ra,0x0
    80207c8a:	d4c080e7          	jalr	-692(ra) # 802079d2 <free_desc>
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    80207c8e:	0001f597          	auipc	a1,0x1f
    80207c92:	41a58593          	addi	a1,a1,1050 # 802270a8 <disk+0x20a8>
    80207c96:	0001f517          	auipc	a0,0x1f
    80207c9a:	38250513          	addi	a0,a0,898 # 80227018 <disk+0x2018>
    80207c9e:	ffffa097          	auipc	ra,0xffffa
    80207ca2:	638080e7          	jalr	1592(ra) # 802022d6 <sleep>
  for(int i = 0; i < 3; i++){
    80207ca6:	f9040713          	addi	a4,s0,-112
    80207caa:	84ce                	mv	s1,s3
    80207cac:	bf41                	j	80207c3c <virtio_disk_rw+0x60>
    uint32 reserved;
    uint64 sector;
  } buf0;

  if(write)
    buf0.type = VIRTIO_BLK_T_OUT; // write the disk
    80207cae:	4785                	li	a5,1
    80207cb0:	f8f42023          	sw	a5,-128(s0)
  else
    buf0.type = VIRTIO_BLK_T_IN; // read the disk
  buf0.reserved = 0;
    80207cb4:	f8042223          	sw	zero,-124(s0)
  buf0.sector = sector;
    80207cb8:	f9a43423          	sd	s10,-120(s0)

  // buf0 is on a kernel stack, which is not direct mapped,
  // thus the call to kvmpa().
  disk.desc[idx[0]].addr = (uint64) kwalkaddr(myproc()->kpagetable, (uint64) &buf0);
    80207cbc:	ffffa097          	auipc	ra,0xffffa
    80207cc0:	db8080e7          	jalr	-584(ra) # 80201a74 <myproc>
    80207cc4:	f9042983          	lw	s3,-112(s0)
    80207cc8:	00499493          	slli	s1,s3,0x4
    80207ccc:	0001fa17          	auipc	s4,0x1f
    80207cd0:	334a0a13          	addi	s4,s4,820 # 80227000 <disk+0x2000>
    80207cd4:	000a3a83          	ld	s5,0(s4)
    80207cd8:	9aa6                	add	s5,s5,s1
    80207cda:	f8040593          	addi	a1,s0,-128
    80207cde:	6d28                	ld	a0,88(a0)
    80207ce0:	ffff9097          	auipc	ra,0xffff9
    80207ce4:	f3a080e7          	jalr	-198(ra) # 80200c1a <kwalkaddr>
    80207ce8:	00aab023          	sd	a0,0(s5)
  disk.desc[idx[0]].len = sizeof(buf0);
    80207cec:	000a3783          	ld	a5,0(s4)
    80207cf0:	97a6                	add	a5,a5,s1
    80207cf2:	4741                	li	a4,16
    80207cf4:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80207cf6:	000a3783          	ld	a5,0(s4)
    80207cfa:	97a6                	add	a5,a5,s1
    80207cfc:	4705                	li	a4,1
    80207cfe:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[0]].next = idx[1];
    80207d02:	f9442703          	lw	a4,-108(s0)
    80207d06:	000a3783          	ld	a5,0(s4)
    80207d0a:	97a6                	add	a5,a5,s1
    80207d0c:	00e79723          	sh	a4,14(a5)

  disk.desc[idx[1]].addr = (uint64) b->data;
    80207d10:	0712                	slli	a4,a4,0x4
    80207d12:	000a3783          	ld	a5,0(s4)
    80207d16:	97ba                	add	a5,a5,a4
    80207d18:	05890693          	addi	a3,s2,88
    80207d1c:	e394                	sd	a3,0(a5)
  disk.desc[idx[1]].len = BSIZE;
    80207d1e:	000a3783          	ld	a5,0(s4)
    80207d22:	97ba                	add	a5,a5,a4
    80207d24:	20000693          	li	a3,512
    80207d28:	c794                	sw	a3,8(a5)
  if(write)
    80207d2a:	100c8c63          	beqz	s9,80207e42 <virtio_disk_rw+0x266>
    disk.desc[idx[1]].flags = 0; // device reads b->data
    80207d2e:	0001f797          	auipc	a5,0x1f
    80207d32:	2d27b783          	ld	a5,722(a5) # 80227000 <disk+0x2000>
    80207d36:	97ba                	add	a5,a5,a4
    80207d38:	00079623          	sh	zero,12(a5)
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    80207d3c:	0001d517          	auipc	a0,0x1d
    80207d40:	2c450513          	addi	a0,a0,708 # 80225000 <disk>
    80207d44:	0001f797          	auipc	a5,0x1f
    80207d48:	2bc78793          	addi	a5,a5,700 # 80227000 <disk+0x2000>
    80207d4c:	6394                	ld	a3,0(a5)
    80207d4e:	96ba                	add	a3,a3,a4
    80207d50:	00c6d603          	lhu	a2,12(a3)
    80207d54:	00166613          	ori	a2,a2,1
    80207d58:	00c69623          	sh	a2,12(a3)
  disk.desc[idx[1]].next = idx[2];
    80207d5c:	f9842683          	lw	a3,-104(s0)
    80207d60:	6390                	ld	a2,0(a5)
    80207d62:	9732                	add	a4,a4,a2
    80207d64:	00d71723          	sh	a3,14(a4)

  disk.info[idx[0]].status = 0;
    80207d68:	20098613          	addi	a2,s3,512
    80207d6c:	0612                	slli	a2,a2,0x4
    80207d6e:	962a                	add	a2,a2,a0
    80207d70:	02060823          	sb	zero,48(a2) # 2030 <_entry-0x801fdfd0>
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    80207d74:	00469713          	slli	a4,a3,0x4
    80207d78:	6394                	ld	a3,0(a5)
    80207d7a:	96ba                	add	a3,a3,a4
    80207d7c:	6589                	lui	a1,0x2
    80207d7e:	03058593          	addi	a1,a1,48 # 2030 <_entry-0x801fdfd0>
    80207d82:	94ae                	add	s1,s1,a1
    80207d84:	94aa                	add	s1,s1,a0
    80207d86:	e284                	sd	s1,0(a3)
  disk.desc[idx[2]].len = 1;
    80207d88:	6394                	ld	a3,0(a5)
    80207d8a:	96ba                	add	a3,a3,a4
    80207d8c:	4585                	li	a1,1
    80207d8e:	c68c                	sw	a1,8(a3)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80207d90:	6394                	ld	a3,0(a5)
    80207d92:	96ba                	add	a3,a3,a4
    80207d94:	4509                	li	a0,2
    80207d96:	00a69623          	sh	a0,12(a3)
  disk.desc[idx[2]].next = 0;
    80207d9a:	6394                	ld	a3,0(a5)
    80207d9c:	9736                	add	a4,a4,a3
    80207d9e:	00071723          	sh	zero,14(a4)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    80207da2:	00b92223          	sw	a1,4(s2)
  disk.info[idx[0]].b = b;
    80207da6:	03263423          	sd	s2,40(a2)

  // avail[0] is flags
  // avail[1] tells the device how far to look in avail[2...].
  // avail[2...] are desc[] indices the device should process.
  // we only tell device the first index in our chain of descriptors.
  disk.avail[2 + (disk.avail[1] % NUM)] = idx[0];
    80207daa:	6794                	ld	a3,8(a5)
    80207dac:	0026d703          	lhu	a4,2(a3)
    80207db0:	8b1d                	andi	a4,a4,7
    80207db2:	2709                	addiw	a4,a4,2
    80207db4:	0706                	slli	a4,a4,0x1
    80207db6:	9736                	add	a4,a4,a3
    80207db8:	01371023          	sh	s3,0(a4)
  __sync_synchronize();
    80207dbc:	0ff0000f          	fence
  disk.avail[1] = disk.avail[1] + 1;
    80207dc0:	6798                	ld	a4,8(a5)
    80207dc2:	00275783          	lhu	a5,2(a4)
    80207dc6:	2785                	addiw	a5,a5,1
    80207dc8:	00f71123          	sh	a5,2(a4)

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    80207dcc:	00003797          	auipc	a5,0x3
    80207dd0:	1247b783          	ld	a5,292(a5) # 8020aef0 <digits+0xb70>
    80207dd4:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    80207dd8:	00492703          	lw	a4,4(s2)
    80207ddc:	4785                	li	a5,1
    80207dde:	02f71163          	bne	a4,a5,80207e00 <virtio_disk_rw+0x224>
    sleep(b, &disk.vdisk_lock);
    80207de2:	0001f997          	auipc	s3,0x1f
    80207de6:	2c698993          	addi	s3,s3,710 # 802270a8 <disk+0x20a8>
  while(b->disk == 1) {
    80207dea:	4485                	li	s1,1
    sleep(b, &disk.vdisk_lock);
    80207dec:	85ce                	mv	a1,s3
    80207dee:	854a                	mv	a0,s2
    80207df0:	ffffa097          	auipc	ra,0xffffa
    80207df4:	4e6080e7          	jalr	1254(ra) # 802022d6 <sleep>
  while(b->disk == 1) {
    80207df8:	00492783          	lw	a5,4(s2)
    80207dfc:	fe9788e3          	beq	a5,s1,80207dec <virtio_disk_rw+0x210>
  }

  disk.info[idx[0]].b = 0;
    80207e00:	f9042483          	lw	s1,-112(s0)
    80207e04:	20048793          	addi	a5,s1,512
    80207e08:	00479713          	slli	a4,a5,0x4
    80207e0c:	0001d797          	auipc	a5,0x1d
    80207e10:	1f478793          	addi	a5,a5,500 # 80225000 <disk>
    80207e14:	97ba                	add	a5,a5,a4
    80207e16:	0207b423          	sd	zero,40(a5)
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    80207e1a:	0001f917          	auipc	s2,0x1f
    80207e1e:	1e690913          	addi	s2,s2,486 # 80227000 <disk+0x2000>
    free_desc(i);
    80207e22:	8526                	mv	a0,s1
    80207e24:	00000097          	auipc	ra,0x0
    80207e28:	bae080e7          	jalr	-1106(ra) # 802079d2 <free_desc>
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    80207e2c:	0492                	slli	s1,s1,0x4
    80207e2e:	00093783          	ld	a5,0(s2)
    80207e32:	94be                	add	s1,s1,a5
    80207e34:	00c4d783          	lhu	a5,12(s1)
    80207e38:	8b85                	andi	a5,a5,1
    80207e3a:	cf89                	beqz	a5,80207e54 <virtio_disk_rw+0x278>
      i = disk.desc[i].next;
    80207e3c:	00e4d483          	lhu	s1,14(s1)
    free_desc(i);
    80207e40:	b7cd                	j	80207e22 <virtio_disk_rw+0x246>
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80207e42:	0001f797          	auipc	a5,0x1f
    80207e46:	1be7b783          	ld	a5,446(a5) # 80227000 <disk+0x2000>
    80207e4a:	97ba                	add	a5,a5,a4
    80207e4c:	4689                	li	a3,2
    80207e4e:	00d79623          	sh	a3,12(a5)
    80207e52:	b5ed                	j	80207d3c <virtio_disk_rw+0x160>
  free_chain(idx[0]);

  release(&disk.vdisk_lock);
    80207e54:	0001f517          	auipc	a0,0x1f
    80207e58:	25450513          	addi	a0,a0,596 # 802270a8 <disk+0x20a8>
    80207e5c:	ffff9097          	auipc	ra,0xffff9
    80207e60:	8c0080e7          	jalr	-1856(ra) # 8020071c <release>
}
    80207e64:	70e6                	ld	ra,120(sp)
    80207e66:	7446                	ld	s0,112(sp)
    80207e68:	74a6                	ld	s1,104(sp)
    80207e6a:	7906                	ld	s2,96(sp)
    80207e6c:	69e6                	ld	s3,88(sp)
    80207e6e:	6a46                	ld	s4,80(sp)
    80207e70:	6aa6                	ld	s5,72(sp)
    80207e72:	6b06                	ld	s6,64(sp)
    80207e74:	7be2                	ld	s7,56(sp)
    80207e76:	7c42                	ld	s8,48(sp)
    80207e78:	7ca2                	ld	s9,40(sp)
    80207e7a:	7d02                	ld	s10,32(sp)
    80207e7c:	6109                	addi	sp,sp,128
    80207e7e:	8082                	ret
  if(write)
    80207e80:	e20c97e3          	bnez	s9,80207cae <virtio_disk_rw+0xd2>
    buf0.type = VIRTIO_BLK_T_IN; // read the disk
    80207e84:	f8042023          	sw	zero,-128(s0)
    80207e88:	b535                	j	80207cb4 <virtio_disk_rw+0xd8>

0000000080207e8a <virtio_disk_intr>:

void
virtio_disk_intr()
{
    80207e8a:	1101                	addi	sp,sp,-32
    80207e8c:	ec06                	sd	ra,24(sp)
    80207e8e:	e822                	sd	s0,16(sp)
    80207e90:	e426                	sd	s1,8(sp)
    80207e92:	e04a                	sd	s2,0(sp)
    80207e94:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    80207e96:	0001f517          	auipc	a0,0x1f
    80207e9a:	21250513          	addi	a0,a0,530 # 802270a8 <disk+0x20a8>
    80207e9e:	ffff9097          	auipc	ra,0xffff9
    80207ea2:	82a080e7          	jalr	-2006(ra) # 802006c8 <acquire>

  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    80207ea6:	0001f717          	auipc	a4,0x1f
    80207eaa:	15a70713          	addi	a4,a4,346 # 80227000 <disk+0x2000>
    80207eae:	02075783          	lhu	a5,32(a4)
    80207eb2:	6b18                	ld	a4,16(a4)
    80207eb4:	00275683          	lhu	a3,2(a4)
    80207eb8:	8ebd                	xor	a3,a3,a5
    80207eba:	8a9d                	andi	a3,a3,7
    80207ebc:	cab9                	beqz	a3,80207f12 <virtio_disk_intr+0x88>
    int id = disk.used->elems[disk.used_idx].id;

    if(disk.info[id].status != 0)
    80207ebe:	0001d917          	auipc	s2,0x1d
    80207ec2:	14290913          	addi	s2,s2,322 # 80225000 <disk>
      panic("virtio_disk_intr status");
    
    disk.info[id].b->disk = 0;   // disk is done with buf
    wakeup(disk.info[id].b);

    disk.used_idx = (disk.used_idx + 1) % NUM;
    80207ec6:	0001f497          	auipc	s1,0x1f
    80207eca:	13a48493          	addi	s1,s1,314 # 80227000 <disk+0x2000>
    int id = disk.used->elems[disk.used_idx].id;
    80207ece:	078e                	slli	a5,a5,0x3
    80207ed0:	97ba                	add	a5,a5,a4
    80207ed2:	43dc                	lw	a5,4(a5)
    if(disk.info[id].status != 0)
    80207ed4:	20078713          	addi	a4,a5,512
    80207ed8:	0712                	slli	a4,a4,0x4
    80207eda:	974a                	add	a4,a4,s2
    80207edc:	03074703          	lbu	a4,48(a4)
    80207ee0:	e335                	bnez	a4,80207f44 <virtio_disk_intr+0xba>
    disk.info[id].b->disk = 0;   // disk is done with buf
    80207ee2:	20078793          	addi	a5,a5,512
    80207ee6:	0792                	slli	a5,a5,0x4
    80207ee8:	97ca                	add	a5,a5,s2
    80207eea:	7798                	ld	a4,40(a5)
    80207eec:	00072223          	sw	zero,4(a4)
    wakeup(disk.info[id].b);
    80207ef0:	7788                	ld	a0,40(a5)
    80207ef2:	ffffa097          	auipc	ra,0xffffa
    80207ef6:	566080e7          	jalr	1382(ra) # 80202458 <wakeup>
    disk.used_idx = (disk.used_idx + 1) % NUM;
    80207efa:	0204d783          	lhu	a5,32(s1)
    80207efe:	2785                	addiw	a5,a5,1
    80207f00:	8b9d                	andi	a5,a5,7
    80207f02:	02f49023          	sh	a5,32(s1)
  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    80207f06:	6898                	ld	a4,16(s1)
    80207f08:	00275683          	lhu	a3,2(a4)
    80207f0c:	8a9d                	andi	a3,a3,7
    80207f0e:	fcf690e3          	bne	a3,a5,80207ece <virtio_disk_intr+0x44>
  }
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    80207f12:	00003797          	auipc	a5,0x3
    80207f16:	fe67b783          	ld	a5,-26(a5) # 8020aef8 <digits+0xb78>
    80207f1a:	439c                	lw	a5,0(a5)
    80207f1c:	8b8d                	andi	a5,a5,3
    80207f1e:	00003717          	auipc	a4,0x3
    80207f22:	fe273703          	ld	a4,-30(a4) # 8020af00 <digits+0xb80>
    80207f26:	c31c                	sw	a5,0(a4)

  release(&disk.vdisk_lock);
    80207f28:	0001f517          	auipc	a0,0x1f
    80207f2c:	18050513          	addi	a0,a0,384 # 802270a8 <disk+0x20a8>
    80207f30:	ffff8097          	auipc	ra,0xffff8
    80207f34:	7ec080e7          	jalr	2028(ra) # 8020071c <release>
}
    80207f38:	60e2                	ld	ra,24(sp)
    80207f3a:	6442                	ld	s0,16(sp)
    80207f3c:	64a2                	ld	s1,8(sp)
    80207f3e:	6902                	ld	s2,0(sp)
    80207f40:	6105                	addi	sp,sp,32
    80207f42:	8082                	ret
      panic("virtio_disk_intr status");
    80207f44:	00003517          	auipc	a0,0x3
    80207f48:	f3c50513          	addi	a0,a0,-196 # 8020ae80 <digits+0xb00>
    80207f4c:	ffff8097          	auipc	ra,0xffff8
    80207f50:	1f6080e7          	jalr	502(ra) # 80200142 <panic>

0000000080207f54 <uartinit>:

void uartstart();

void
uartinit(void)
{
    80207f54:	1141                	addi	sp,sp,-16
    80207f56:	e406                	sd	ra,8(sp)
    80207f58:	e022                	sd	s0,0(sp)
    80207f5a:	0800                	addi	s0,sp,16
  // disable interrupts.
  WriteReg(IER, 0x00);
    80207f5c:	100007b7          	lui	a5,0x10000
    80207f60:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x701fffff>

  // special mode to set baud rate.
  WriteReg(LCR, LCR_BAUD_LATCH);
    80207f64:	f8000713          	li	a4,-128
    80207f68:	00e781a3          	sb	a4,3(a5)

  // LSB for baud rate of 38.4K.
  WriteReg(0, 0x03);
    80207f6c:	470d                	li	a4,3
    80207f6e:	00e78023          	sb	a4,0(a5)

  // MSB for baud rate of 38.4K.
  WriteReg(1, 0x00);
    80207f72:	000780a3          	sb	zero,1(a5)

  // leave set-baud mode,
  // and set word length to 8 bits, no parity.
  WriteReg(LCR, LCR_EIGHT_BITS);
    80207f76:	00e781a3          	sb	a4,3(a5)

  // reset and enable FIFOs.
  WriteReg(FCR, FCR_FIFO_ENABLE | FCR_FIFO_CLEAR);
    80207f7a:	469d                	li	a3,7
    80207f7c:	00d78123          	sb	a3,2(a5)

  // enable transmit and receive interrupts.
  WriteReg(IER, IER_TX_ENABLE | IER_RX_ENABLE);
    80207f80:	00e780a3          	sb	a4,1(a5)

    uart_tx_w = uart_tx_r = 0;
    80207f84:	00020797          	auipc	a5,0x20
    80207f88:	07c78793          	addi	a5,a5,124 # 80228000 <uart_tx_r>
    80207f8c:	0007a023          	sw	zero,0(a5)
    80207f90:	0007a223          	sw	zero,4(a5)

  initlock(&uart_tx_lock, "uart");
    80207f94:	00003597          	auipc	a1,0x3
    80207f98:	f7458593          	addi	a1,a1,-140 # 8020af08 <digits+0xb88>
    80207f9c:	00020517          	auipc	a0,0x20
    80207fa0:	06c50513          	addi	a0,a0,108 # 80228008 <uart_tx_lock>
    80207fa4:	ffff8097          	auipc	ra,0xffff8
    80207fa8:	6e0080e7          	jalr	1760(ra) # 80200684 <initlock>
}
    80207fac:	60a2                	ld	ra,8(sp)
    80207fae:	6402                	ld	s0,0(sp)
    80207fb0:	0141                	addi	sp,sp,16
    80207fb2:	8082                	ret

0000000080207fb4 <uartputc_sync>:
// use interrupts, for use by kernel printf() and
// to echo characters. it spins waiting for the uart's
// output register to be empty.
void
uartputc_sync(int c)
{
    80207fb4:	1101                	addi	sp,sp,-32
    80207fb6:	ec06                	sd	ra,24(sp)
    80207fb8:	e822                	sd	s0,16(sp)
    80207fba:	e426                	sd	s1,8(sp)
    80207fbc:	1000                	addi	s0,sp,32
    80207fbe:	84aa                	mv	s1,a0
  push_off();
    80207fc0:	ffff8097          	auipc	ra,0xffff8
    80207fc4:	618080e7          	jalr	1560(ra) # 802005d8 <push_off>

  if(panicked){
    80207fc8:	00006797          	auipc	a5,0x6
    80207fcc:	cb87b783          	ld	a5,-840(a5) # 8020dc80 <_GLOBAL_OFFSET_TABLE_+0x10>
    80207fd0:	439c                	lw	a5,0(a5)
    80207fd2:	2781                	sext.w	a5,a5
    for(;;)
      ;
  }

  // wait for Transmit Holding Empty to be set in LSR.
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    80207fd4:	10000737          	lui	a4,0x10000
  if(panicked){
    80207fd8:	c391                	beqz	a5,80207fdc <uartputc_sync+0x28>
    for(;;)
    80207fda:	a001                	j	80207fda <uartputc_sync+0x26>
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    80207fdc:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x701ffffb>
    80207fe0:	0ff7f793          	andi	a5,a5,255
    80207fe4:	0207f793          	andi	a5,a5,32
    80207fe8:	dbf5                	beqz	a5,80207fdc <uartputc_sync+0x28>
    ;
  WriteReg(THR, c);
    80207fea:	0ff4f793          	andi	a5,s1,255
    80207fee:	10000737          	lui	a4,0x10000
    80207ff2:	00f70023          	sb	a5,0(a4) # 10000000 <_entry-0x70200000>

  pop_off();
    80207ff6:	ffff8097          	auipc	ra,0xffff8
    80207ffa:	62e080e7          	jalr	1582(ra) # 80200624 <pop_off>
}
    80207ffe:	60e2                	ld	ra,24(sp)
    80208000:	6442                	ld	s0,16(sp)
    80208002:	64a2                	ld	s1,8(sp)
    80208004:	6105                	addi	sp,sp,32
    80208006:	8082                	ret

0000000080208008 <uartstart>:
// called from both the top- and bottom-half.
void
uartstart()
{
  while(1){
    if(uart_tx_w == uart_tx_r){
    80208008:	00020717          	auipc	a4,0x20
    8020800c:	ff870713          	addi	a4,a4,-8 # 80228000 <uart_tx_r>
    80208010:	431c                	lw	a5,0(a4)
    80208012:	4358                	lw	a4,4(a4)
    80208014:	06f70563          	beq	a4,a5,8020807e <uartstart+0x76>
{
    80208018:	7179                	addi	sp,sp,-48
    8020801a:	f406                	sd	ra,40(sp)
    8020801c:	f022                	sd	s0,32(sp)
    8020801e:	ec26                	sd	s1,24(sp)
    80208020:	e84a                	sd	s2,16(sp)
    80208022:	e44e                	sd	s3,8(sp)
    80208024:	1800                	addi	s0,sp,48
      // transmit buffer is empty.
      return;
    }
    
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    80208026:	10000937          	lui	s2,0x10000
      // so we cannot give it another byte.
      // it will interrupt when it's ready for a new byte.
      return;
    }
    
    int c = uart_tx_buf[uart_tx_r];
    8020802a:	00020497          	auipc	s1,0x20
    8020802e:	fd648493          	addi	s1,s1,-42 # 80228000 <uart_tx_r>
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    80208032:	00594703          	lbu	a4,5(s2) # 10000005 <_entry-0x701ffffb>
    80208036:	0ff77713          	andi	a4,a4,255
    8020803a:	02077713          	andi	a4,a4,32
    8020803e:	cb0d                	beqz	a4,80208070 <uartstart+0x68>
    int c = uart_tx_buf[uart_tx_r];
    80208040:	00f48733          	add	a4,s1,a5
    80208044:	02074983          	lbu	s3,32(a4)
    uart_tx_r = (uart_tx_r + 1) % UART_TX_BUF_SIZE;
    80208048:	2785                	addiw	a5,a5,1
    8020804a:	41f7d71b          	sraiw	a4,a5,0x1f
    8020804e:	01b7571b          	srliw	a4,a4,0x1b
    80208052:	9fb9                	addw	a5,a5,a4
    80208054:	8bfd                	andi	a5,a5,31
    80208056:	9f99                	subw	a5,a5,a4
    80208058:	c09c                	sw	a5,0(s1)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    8020805a:	8526                	mv	a0,s1
    8020805c:	ffffa097          	auipc	ra,0xffffa
    80208060:	3fc080e7          	jalr	1020(ra) # 80202458 <wakeup>
    
    WriteReg(THR, c);
    80208064:	01390023          	sb	s3,0(s2)
    if(uart_tx_w == uart_tx_r){
    80208068:	409c                	lw	a5,0(s1)
    8020806a:	40d8                	lw	a4,4(s1)
    8020806c:	fcf713e3          	bne	a4,a5,80208032 <uartstart+0x2a>
  }
}
    80208070:	70a2                	ld	ra,40(sp)
    80208072:	7402                	ld	s0,32(sp)
    80208074:	64e2                	ld	s1,24(sp)
    80208076:	6942                	ld	s2,16(sp)
    80208078:	69a2                	ld	s3,8(sp)
    8020807a:	6145                	addi	sp,sp,48
    8020807c:	8082                	ret
    8020807e:	8082                	ret

0000000080208080 <uartputc>:
{
    80208080:	7179                	addi	sp,sp,-48
    80208082:	f406                	sd	ra,40(sp)
    80208084:	f022                	sd	s0,32(sp)
    80208086:	ec26                	sd	s1,24(sp)
    80208088:	e84a                	sd	s2,16(sp)
    8020808a:	e44e                	sd	s3,8(sp)
    8020808c:	1800                	addi	s0,sp,48
    8020808e:	892a                	mv	s2,a0
  acquire(&uart_tx_lock);
    80208090:	00020517          	auipc	a0,0x20
    80208094:	f7850513          	addi	a0,a0,-136 # 80228008 <uart_tx_lock>
    80208098:	ffff8097          	auipc	ra,0xffff8
    8020809c:	630080e7          	jalr	1584(ra) # 802006c8 <acquire>
  if(panicked){
    802080a0:	00006797          	auipc	a5,0x6
    802080a4:	be07b783          	ld	a5,-1056(a5) # 8020dc80 <_GLOBAL_OFFSET_TABLE_+0x10>
    802080a8:	439c                	lw	a5,0(a5)
    802080aa:	2781                	sext.w	a5,a5
    802080ac:	c391                	beqz	a5,802080b0 <uartputc+0x30>
    for(;;)
    802080ae:	a001                	j	802080ae <uartputc+0x2e>
    if(((uart_tx_w + 1) % UART_TX_BUF_SIZE) == uart_tx_r){
    802080b0:	00020617          	auipc	a2,0x20
    802080b4:	f5060613          	addi	a2,a2,-176 # 80228000 <uart_tx_r>
    802080b8:	4258                	lw	a4,4(a2)
    802080ba:	0017079b          	addiw	a5,a4,1
    802080be:	41f7d69b          	sraiw	a3,a5,0x1f
    802080c2:	01b6d69b          	srliw	a3,a3,0x1b
    802080c6:	9fb5                	addw	a5,a5,a3
    802080c8:	8bfd                	andi	a5,a5,31
    802080ca:	9f95                	subw	a5,a5,a3
    802080cc:	4214                	lw	a3,0(a2)
    802080ce:	02f69a63          	bne	a3,a5,80208102 <uartputc+0x82>
      sleep(&uart_tx_r, &uart_tx_lock);
    802080d2:	84b2                	mv	s1,a2
    802080d4:	00020997          	auipc	s3,0x20
    802080d8:	f3498993          	addi	s3,s3,-204 # 80228008 <uart_tx_lock>
    802080dc:	85ce                	mv	a1,s3
    802080de:	8526                	mv	a0,s1
    802080e0:	ffffa097          	auipc	ra,0xffffa
    802080e4:	1f6080e7          	jalr	502(ra) # 802022d6 <sleep>
    if(((uart_tx_w + 1) % UART_TX_BUF_SIZE) == uart_tx_r){
    802080e8:	40d8                	lw	a4,4(s1)
    802080ea:	0017079b          	addiw	a5,a4,1
    802080ee:	41f7d69b          	sraiw	a3,a5,0x1f
    802080f2:	01b6d69b          	srliw	a3,a3,0x1b
    802080f6:	9fb5                	addw	a5,a5,a3
    802080f8:	8bfd                	andi	a5,a5,31
    802080fa:	9f95                	subw	a5,a5,a3
    802080fc:	4094                	lw	a3,0(s1)
    802080fe:	fcf68fe3          	beq	a3,a5,802080dc <uartputc+0x5c>
      uart_tx_buf[uart_tx_w] = c;
    80208102:	00020697          	auipc	a3,0x20
    80208106:	efe68693          	addi	a3,a3,-258 # 80228000 <uart_tx_r>
    8020810a:	9736                	add	a4,a4,a3
    8020810c:	03270023          	sb	s2,32(a4)
      uart_tx_w = (uart_tx_w + 1) % UART_TX_BUF_SIZE;
    80208110:	c2dc                	sw	a5,4(a3)
      uartstart();
    80208112:	00000097          	auipc	ra,0x0
    80208116:	ef6080e7          	jalr	-266(ra) # 80208008 <uartstart>
      release(&uart_tx_lock);
    8020811a:	00020517          	auipc	a0,0x20
    8020811e:	eee50513          	addi	a0,a0,-274 # 80228008 <uart_tx_lock>
    80208122:	ffff8097          	auipc	ra,0xffff8
    80208126:	5fa080e7          	jalr	1530(ra) # 8020071c <release>
}
    8020812a:	70a2                	ld	ra,40(sp)
    8020812c:	7402                	ld	s0,32(sp)
    8020812e:	64e2                	ld	s1,24(sp)
    80208130:	6942                	ld	s2,16(sp)
    80208132:	69a2                	ld	s3,8(sp)
    80208134:	6145                	addi	sp,sp,48
    80208136:	8082                	ret

0000000080208138 <uartgetc>:

// read one input character from the UART.
// return -1 if none is waiting.
int
uartgetc(void)
{
    80208138:	1141                	addi	sp,sp,-16
    8020813a:	e422                	sd	s0,8(sp)
    8020813c:	0800                	addi	s0,sp,16
  if(ReadReg(LSR) & 0x01){
    8020813e:	100007b7          	lui	a5,0x10000
    80208142:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x701ffffb>
    80208146:	8b85                	andi	a5,a5,1
    80208148:	cb91                	beqz	a5,8020815c <uartgetc+0x24>
    // input data is ready.
    return ReadReg(RHR);
    8020814a:	100007b7          	lui	a5,0x10000
    8020814e:	0007c503          	lbu	a0,0(a5) # 10000000 <_entry-0x70200000>
    80208152:	0ff57513          	andi	a0,a0,255
  } else {
    return -1;
  }
}
    80208156:	6422                	ld	s0,8(sp)
    80208158:	0141                	addi	sp,sp,16
    8020815a:	8082                	ret
    return -1;
    8020815c:	557d                	li	a0,-1
    8020815e:	bfe5                	j	80208156 <uartgetc+0x1e>

0000000080208160 <uartintr>:
// handle a uart interrupt, raised because input has
// arrived, or the uart is ready for more output, or
// both. called from trap.c.
void
uartintr(void)
{
    80208160:	1101                	addi	sp,sp,-32
    80208162:	ec06                	sd	ra,24(sp)
    80208164:	e822                	sd	s0,16(sp)
    80208166:	e426                	sd	s1,8(sp)
    80208168:	1000                	addi	s0,sp,32
  // read and process incoming characters.
  while(1){
    int c = uartgetc();
    if(c == -1)
    8020816a:	54fd                	li	s1,-1
    int c = uartgetc();
    8020816c:	00000097          	auipc	ra,0x0
    80208170:	fcc080e7          	jalr	-52(ra) # 80208138 <uartgetc>
    if(c == -1)
    80208174:	00950763          	beq	a0,s1,80208182 <uartintr+0x22>
      break;
    consoleintr(c);
    80208178:	fffff097          	auipc	ra,0xfffff
    8020817c:	66a080e7          	jalr	1642(ra) # 802077e2 <consoleintr>
  while(1){
    80208180:	b7f5                	j	8020816c <uartintr+0xc>
  }

  // send buffered characters.
  acquire(&uart_tx_lock);
    80208182:	00020497          	auipc	s1,0x20
    80208186:	e8648493          	addi	s1,s1,-378 # 80228008 <uart_tx_lock>
    8020818a:	8526                	mv	a0,s1
    8020818c:	ffff8097          	auipc	ra,0xffff8
    80208190:	53c080e7          	jalr	1340(ra) # 802006c8 <acquire>
  uartstart();
    80208194:	00000097          	auipc	ra,0x0
    80208198:	e74080e7          	jalr	-396(ra) # 80208008 <uartstart>
  release(&uart_tx_lock);
    8020819c:	8526                	mv	a0,s1
    8020819e:	ffff8097          	auipc	ra,0xffff8
    802081a2:	57e080e7          	jalr	1406(ra) # 8020071c <release>
}
    802081a6:	60e2                	ld	ra,24(sp)
    802081a8:	6442                	ld	s0,16(sp)
    802081aa:	64a2                	ld	s1,8(sp)
    802081ac:	6105                	addi	sp,sp,32
    802081ae:	8082                	ret
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
