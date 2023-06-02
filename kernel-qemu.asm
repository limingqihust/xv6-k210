
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
    80200098:	c10080e7          	jalr	-1008(ra) # 80207ca4 <consputc>
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
    802000ce:	bda080e7          	jalr	-1062(ra) # 80207ca4 <consputc>
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
    80200222:	a86080e7          	jalr	-1402(ra) # 80207ca4 <consputc>
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
    802002b0:	00008097          	auipc	ra,0x8
    802002b4:	9f4080e7          	jalr	-1548(ra) # 80207ca4 <consputc>
  consputc('x');
    802002b8:	07800513          	li	a0,120
    802002bc:	00008097          	auipc	ra,0x8
    802002c0:	9e8080e7          	jalr	-1560(ra) # 80207ca4 <consputc>
    802002c4:	896a                	mv	s2,s10
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802002c6:	03c9d793          	srli	a5,s3,0x3c
    802002ca:	97de                	add	a5,a5,s7
    802002cc:	0007c503          	lbu	a0,0(a5)
    802002d0:	00008097          	auipc	ra,0x8
    802002d4:	9d4080e7          	jalr	-1580(ra) # 80207ca4 <consputc>
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
    80200300:	9a8080e7          	jalr	-1624(ra) # 80207ca4 <consputc>
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
    80200322:	986080e7          	jalr	-1658(ra) # 80207ca4 <consputc>
      break;
    80200326:	b701                	j	80200226 <printf+0x9a>
      consputc('%');
    80200328:	8556                	mv	a0,s5
    8020032a:	00008097          	auipc	ra,0x8
    8020032e:	97a080e7          	jalr	-1670(ra) # 80207ca4 <consputc>
      consputc(c);
    80200332:	854a                	mv	a0,s2
    80200334:	00008097          	auipc	ra,0x8
    80200338:	970080e7          	jalr	-1680(ra) # 80207ca4 <consputc>
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
    80200a20:	efe080e7          	jalr	-258(ra) # 8020291a <trapinithart>
    plicinithart();  // ask PLIC for device interrupts
    80200a24:	00007097          	auipc	ra,0x7
    80200a28:	03a080e7          	jalr	58(ra) # 80207a5e <plicinithart>
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
    80200a48:	430080e7          	jalr	1072(ra) # 80207e74 <consoleinit>
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
    80200a78:	5ba080e7          	jalr	1466(ra) # 8020602e <timerinit>
    trapinithart();  // install kernel trap vector, including interrupt handler
    80200a7c:	00002097          	auipc	ra,0x2
    80200a80:	e9e080e7          	jalr	-354(ra) # 8020291a <trapinithart>
    procinit();
    80200a84:	00001097          	auipc	ra,0x1
    80200a88:	f32080e7          	jalr	-206(ra) # 802019b6 <procinit>
    plicinit();
    80200a8c:	00007097          	auipc	ra,0x7
    80200a90:	fba080e7          	jalr	-70(ra) # 80207a46 <plicinit>
    plicinithart();
    80200a94:	00007097          	auipc	ra,0x7
    80200a98:	fca080e7          	jalr	-54(ra) # 80207a5e <plicinithart>
    disk_init();
    80200a9c:	00005097          	auipc	ra,0x5
    80200aa0:	62e080e7          	jalr	1582(ra) # 802060ca <disk_init>
    binit();         // buffer cache
    80200aa4:	00003097          	auipc	ra,0x3
    80200aa8:	f10080e7          	jalr	-240(ra) # 802039b4 <binit>
    fileinit();      // file table
    80200aac:	00003097          	auipc	ra,0x3
    80200ab0:	314080e7          	jalr	788(ra) # 80203dc0 <fileinit>
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
    80201ab8:	ea2080e7          	jalr	-350(ra) # 80202956 <usertrapret>
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
    80201ad2:	ce4080e7          	jalr	-796(ra) # 802067b2 <fat32_init>
    myproc()->cwd = ename("/");
    80201ad6:	00000097          	auipc	ra,0x0
    80201ada:	f82080e7          	jalr	-126(ra) # 80201a58 <myproc>
    80201ade:	84aa                	mv	s1,a0
    80201ae0:	00009517          	auipc	a0,0x9
    80201ae4:	b5050513          	addi	a0,a0,-1200 # 8020a630 <digits+0x2b0>
    80201ae8:	00006097          	auipc	ra,0x6
    80201aec:	f24080e7          	jalr	-220(ra) # 80207a0c <ename>
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
    80201f00:	f86080e7          	jalr	-122(ra) # 80203e82 <filedup>
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
    80201f22:	0e6080e7          	jalr	230(ra) # 80207004 <edup>
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
    8020203c:	00001097          	auipc	ra,0x1
    80202040:	874080e7          	jalr	-1932(ra) # 802028b0 <swtch>
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
    8020212e:	786080e7          	jalr	1926(ra) # 802028b0 <swtch>
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
    802021b6:	d22080e7          	jalr	-734(ra) # 80203ed4 <fileclose>
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
    802021d2:	118080e7          	jalr	280(ra) # 802072e6 <eput>
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
int clone(int flags, uint64 stack, int ptid, int tls, int ctid)
{
    8020265c:	7179                	addi	sp,sp,-48
    8020265e:	f406                	sd	ra,40(sp)
    80202660:	f022                	sd	s0,32(sp)
    80202662:	ec26                	sd	s1,24(sp)
    80202664:	e84a                	sd	s2,16(sp)
    80202666:	e44e                	sd	s3,8(sp)
    80202668:	e052                	sd	s4,0(sp)
    8020266a:	1800                	addi	s0,sp,48
    8020266c:	84ae                	mv	s1,a1
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    8020266e:	fffff097          	auipc	ra,0xfffff
    80202672:	3ea080e7          	jalr	1002(ra) # 80201a58 <myproc>
    80202676:	892a                	mv	s2,a0

  // Allocate process.
  if ((np = allocproc()) == NULL)
    80202678:	fffff097          	auipc	ra,0xfffff
    8020267c:	61c080e7          	jalr	1564(ra) # 80201c94 <allocproc>
    80202680:	cd65                	beqz	a0,80202778 <clone+0x11c>
    80202682:	8a2a                	mv	s4,a0
  {
    return -1;
  }

  // Copy user memory from parent to child.
  if (uvmcopy(p->pagetable, np->pagetable, np->kpagetable, p->sz) < 0)
    80202684:	04893683          	ld	a3,72(s2)
    80202688:	6d30                	ld	a2,88(a0)
    8020268a:	692c                	ld	a1,80(a0)
    8020268c:	05093503          	ld	a0,80(s2)
    80202690:	fffff097          	auipc	ra,0xfffff
    80202694:	b20080e7          	jalr	-1248(ra) # 802011b0 <uvmcopy>
    80202698:	06054163          	bltz	a0,802026fa <clone+0x9e>
  {
    freeproc(np);
    release(&np->lock);
    return -1;
  }
  np->sz = p->sz;
    8020269c:	04893783          	ld	a5,72(s2)
    802026a0:	04fa3423          	sd	a5,72(s4)

  np->parent = p;
    802026a4:	032a3023          	sd	s2,32(s4)

  // copy tracing mask from parent.
  np->tmask = p->tmask;
    802026a8:	4f092783          	lw	a5,1264(s2)
    802026ac:	4efa2823          	sw	a5,1264(s4)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    802026b0:	06093683          	ld	a3,96(s2)
    802026b4:	87b6                	mv	a5,a3
    802026b6:	060a3703          	ld	a4,96(s4)
    802026ba:	12068693          	addi	a3,a3,288
    802026be:	0007b883          	ld	a7,0(a5)
    802026c2:	0087b803          	ld	a6,8(a5)
    802026c6:	6b88                	ld	a0,16(a5)
    802026c8:	6f90                	ld	a2,24(a5)
    802026ca:	01173023          	sd	a7,0(a4)
    802026ce:	01073423          	sd	a6,8(a4)
    802026d2:	eb08                	sd	a0,16(a4)
    802026d4:	ef10                	sd	a2,24(a4)
    802026d6:	02078793          	addi	a5,a5,32
    802026da:	02070713          	addi	a4,a4,32
    802026de:	fed790e3          	bne	a5,a3,802026be <clone+0x62>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    802026e2:	060a3783          	ld	a5,96(s4)
    802026e6:	0607b823          	sd	zero,112(a5)
  // printf("child stack is %d\n", stack);
  np->trapframe->sp=stack;
    802026ea:	060a3783          	ld	a5,96(s4)
    802026ee:	fb84                	sd	s1,48(a5)
    802026f0:	0d800493          	li	s1,216
  // increment reference counts on open file descriptors.
  for (i = 0; i < NOFILE; i++)
    802026f4:	4d800993          	li	s3,1240
    802026f8:	a03d                	j	80202726 <clone+0xca>
    freeproc(np);
    802026fa:	8552                	mv	a0,s4
    802026fc:	fffff097          	auipc	ra,0xfffff
    80202700:	52e080e7          	jalr	1326(ra) # 80201c2a <freeproc>
    release(&np->lock);
    80202704:	8552                	mv	a0,s4
    80202706:	ffffe097          	auipc	ra,0xffffe
    8020270a:	016080e7          	jalr	22(ra) # 8020071c <release>
    return -1;
    8020270e:	54fd                	li	s1,-1
    80202710:	a899                	j	80202766 <clone+0x10a>
    if (p->ofile[i])
      np->ofile[i] = filedup(p->ofile[i]);
    80202712:	00001097          	auipc	ra,0x1
    80202716:	770080e7          	jalr	1904(ra) # 80203e82 <filedup>
    8020271a:	009a07b3          	add	a5,s4,s1
    8020271e:	e388                	sd	a0,0(a5)
  for (i = 0; i < NOFILE; i++)
    80202720:	04a1                	addi	s1,s1,8
    80202722:	01348763          	beq	s1,s3,80202730 <clone+0xd4>
    if (p->ofile[i])
    80202726:	009907b3          	add	a5,s2,s1
    8020272a:	6388                	ld	a0,0(a5)
    8020272c:	f17d                	bnez	a0,80202712 <clone+0xb6>
    8020272e:	bfcd                	j	80202720 <clone+0xc4>
  np->cwd = edup(p->cwd);
    80202730:	4d893503          	ld	a0,1240(s2)
    80202734:	00005097          	auipc	ra,0x5
    80202738:	8d0080e7          	jalr	-1840(ra) # 80207004 <edup>
    8020273c:	4caa3c23          	sd	a0,1240(s4)

  safestrcpy(np->name, p->name, sizeof(p->name));
    80202740:	4641                	li	a2,16
    80202742:	4e090593          	addi	a1,s2,1248
    80202746:	4e0a0513          	addi	a0,s4,1248
    8020274a:	ffffe097          	auipc	ra,0xffffe
    8020274e:	170080e7          	jalr	368(ra) # 802008ba <safestrcpy>

  pid = np->pid;
    80202752:	038a2483          	lw	s1,56(s4)

  np->state = RUNNABLE;
    80202756:	4789                	li	a5,2
    80202758:	00fa2c23          	sw	a5,24(s4)

  release(&np->lock);
    8020275c:	8552                	mv	a0,s4
    8020275e:	ffffe097          	auipc	ra,0xffffe
    80202762:	fbe080e7          	jalr	-66(ra) # 8020071c <release>

  return pid;
}
    80202766:	8526                	mv	a0,s1
    80202768:	70a2                	ld	ra,40(sp)
    8020276a:	7402                	ld	s0,32(sp)
    8020276c:	64e2                	ld	s1,24(sp)
    8020276e:	6942                	ld	s2,16(sp)
    80202770:	69a2                	ld	s3,8(sp)
    80202772:	6a02                	ld	s4,0(sp)
    80202774:	6145                	addi	sp,sp,48
    80202776:	8082                	ret
    return -1;
    80202778:	54fd                	li	s1,-1
    8020277a:	b7f5                	j	80202766 <clone+0x10a>

000000008020277c <waitpid>:
 * @addr:address to store return status of child process
 * @options:default 0
 * @return:pid of child process;-1 means failure
 */
int waitpid(int cpid, uint64 addr, int options)
{
    8020277c:	711d                	addi	sp,sp,-96
    8020277e:	ec86                	sd	ra,88(sp)
    80202780:	e8a2                	sd	s0,80(sp)
    80202782:	e4a6                	sd	s1,72(sp)
    80202784:	e0ca                	sd	s2,64(sp)
    80202786:	fc4e                	sd	s3,56(sp)
    80202788:	f852                	sd	s4,48(sp)
    8020278a:	f456                	sd	s5,40(sp)
    8020278c:	f05a                	sd	s6,32(sp)
    8020278e:	ec5e                	sd	s7,24(sp)
    80202790:	e862                	sd	s8,16(sp)
    80202792:	e466                	sd	s9,8(sp)
    80202794:	1080                	addi	s0,sp,96
    80202796:	8bae                	mv	s7,a1
  if (cpid == -1) // wait for any child
    80202798:	57fd                	li	a5,-1
    8020279a:	02f51663          	bne	a0,a5,802027c6 <waitpid+0x4a>
  {
    return wait(addr);
    8020279e:	852e                	mv	a0,a1
    802027a0:	00000097          	auipc	ra,0x0
    802027a4:	b90080e7          	jalr	-1136(ra) # 80202330 <wait>
    802027a8:	89aa                	mv	s3,a0

    // Wait for a child to exit.
    sleep(p, &p->lock); // DOC: wait-sleep

  }
}
    802027aa:	854e                	mv	a0,s3
    802027ac:	60e6                	ld	ra,88(sp)
    802027ae:	6446                	ld	s0,80(sp)
    802027b0:	64a6                	ld	s1,72(sp)
    802027b2:	6906                	ld	s2,64(sp)
    802027b4:	79e2                	ld	s3,56(sp)
    802027b6:	7a42                	ld	s4,48(sp)
    802027b8:	7aa2                	ld	s5,40(sp)
    802027ba:	7b02                	ld	s6,32(sp)
    802027bc:	6be2                	ld	s7,24(sp)
    802027be:	6c42                	ld	s8,16(sp)
    802027c0:	6ca2                	ld	s9,8(sp)
    802027c2:	6125                	addi	sp,sp,96
    802027c4:	8082                	ret
    802027c6:	8a2a                	mv	s4,a0
  struct proc *p = myproc();
    802027c8:	fffff097          	auipc	ra,0xfffff
    802027cc:	290080e7          	jalr	656(ra) # 80201a58 <myproc>
    802027d0:	892a                	mv	s2,a0
  acquire(&p->lock);
    802027d2:	8caa                	mv	s9,a0
    802027d4:	ffffe097          	auipc	ra,0xffffe
    802027d8:	ef4080e7          	jalr	-268(ra) # 802006c8 <acquire>
    havekids = 0;
    802027dc:	4c01                	li	s8,0
        if (pp->state == ZOMBIE)
    802027de:	4a91                	li	s5,4
    for (pp = proc; pp < &proc[NPROC]; pp++)
    802027e0:	00023997          	auipc	s3,0x23
    802027e4:	21098993          	addi	s3,s3,528 # 802259f0 <bcache>
        havekids = 1;
    802027e8:	4b05                	li	s6,1
    802027ea:	a045                	j	8020288a <waitpid+0x10e>
          pid = pp->pid;
    802027ec:	0384a983          	lw	s3,56(s1)
          if (addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
    802027f0:	000b8e63          	beqz	s7,8020280c <waitpid+0x90>
    802027f4:	4691                	li	a3,4
    802027f6:	03448613          	addi	a2,s1,52
    802027fa:	85de                	mv	a1,s7
    802027fc:	05093503          	ld	a0,80(s2)
    80202800:	fffff097          	auipc	ra,0xfffff
    80202804:	af0080e7          	jalr	-1296(ra) # 802012f0 <copyout>
    80202808:	02054263          	bltz	a0,8020282c <waitpid+0xb0>
          freeproc(pp);
    8020280c:	8526                	mv	a0,s1
    8020280e:	fffff097          	auipc	ra,0xfffff
    80202812:	41c080e7          	jalr	1052(ra) # 80201c2a <freeproc>
          release(&pp->lock);
    80202816:	8526                	mv	a0,s1
    80202818:	ffffe097          	auipc	ra,0xffffe
    8020281c:	f04080e7          	jalr	-252(ra) # 8020071c <release>
          release(&p->lock);
    80202820:	854a                	mv	a0,s2
    80202822:	ffffe097          	auipc	ra,0xffffe
    80202826:	efa080e7          	jalr	-262(ra) # 8020071c <release>
          return pid;
    8020282a:	b741                	j	802027aa <waitpid+0x2e>
            release(&pp->lock);
    8020282c:	8526                	mv	a0,s1
    8020282e:	ffffe097          	auipc	ra,0xffffe
    80202832:	eee080e7          	jalr	-274(ra) # 8020071c <release>
            release(&p->lock);
    80202836:	854a                	mv	a0,s2
    80202838:	ffffe097          	auipc	ra,0xffffe
    8020283c:	ee4080e7          	jalr	-284(ra) # 8020071c <release>
            return -1;
    80202840:	59fd                	li	s3,-1
    80202842:	b7a5                	j	802027aa <waitpid+0x2e>
    for (pp = proc; pp < &proc[NPROC]; pp++)
    80202844:	4f848493          	addi	s1,s1,1272
    80202848:	03348763          	beq	s1,s3,80202876 <waitpid+0xfa>
      if (pp->parent == p && pp->pid == cpid)
    8020284c:	709c                	ld	a5,32(s1)
    8020284e:	ff279be3          	bne	a5,s2,80202844 <waitpid+0xc8>
    80202852:	5c9c                	lw	a5,56(s1)
    80202854:	ff4798e3          	bne	a5,s4,80202844 <waitpid+0xc8>
        acquire(&pp->lock);
    80202858:	8526                	mv	a0,s1
    8020285a:	ffffe097          	auipc	ra,0xffffe
    8020285e:	e6e080e7          	jalr	-402(ra) # 802006c8 <acquire>
        if (pp->state == ZOMBIE)
    80202862:	4c9c                	lw	a5,24(s1)
    80202864:	f95784e3          	beq	a5,s5,802027ec <waitpid+0x70>
        release(&pp->lock);
    80202868:	8526                	mv	a0,s1
    8020286a:	ffffe097          	auipc	ra,0xffffe
    8020286e:	eb2080e7          	jalr	-334(ra) # 8020071c <release>
        havekids = 1;
    80202872:	875a                	mv	a4,s6
    80202874:	bfc1                	j	80202844 <waitpid+0xc8>
    if (!havekids || p->killed)
    80202876:	c305                	beqz	a4,80202896 <waitpid+0x11a>
    80202878:	03092783          	lw	a5,48(s2)
    8020287c:	ef89                	bnez	a5,80202896 <waitpid+0x11a>
    sleep(p, &p->lock); // DOC: wait-sleep
    8020287e:	85e6                	mv	a1,s9
    80202880:	854a                	mv	a0,s2
    80202882:	00000097          	auipc	ra,0x0
    80202886:	a30080e7          	jalr	-1488(ra) # 802022b2 <sleep>
    havekids = 0;
    8020288a:	8762                	mv	a4,s8
    for (pp = proc; pp < &proc[NPROC]; pp++)
    8020288c:	00014497          	auipc	s1,0x14
    80202890:	8f448493          	addi	s1,s1,-1804 # 80216180 <proc>
    80202894:	bf65                	j	8020284c <waitpid+0xd0>
      release(&p->lock);
    80202896:	854a                	mv	a0,s2
    80202898:	ffffe097          	auipc	ra,0xffffe
    8020289c:	e84080e7          	jalr	-380(ra) # 8020071c <release>
      panic("current process do not have child process [cpid]");
    802028a0:	00008517          	auipc	a0,0x8
    802028a4:	e3050513          	addi	a0,a0,-464 # 8020a6d0 <digits+0x350>
    802028a8:	ffffe097          	auipc	ra,0xffffe
    802028ac:	89a080e7          	jalr	-1894(ra) # 80200142 <panic>

00000000802028b0 <swtch>:
    802028b0:	00153023          	sd	ra,0(a0)
    802028b4:	00253423          	sd	sp,8(a0)
    802028b8:	e900                	sd	s0,16(a0)
    802028ba:	ed04                	sd	s1,24(a0)
    802028bc:	03253023          	sd	s2,32(a0)
    802028c0:	03353423          	sd	s3,40(a0)
    802028c4:	03453823          	sd	s4,48(a0)
    802028c8:	03553c23          	sd	s5,56(a0)
    802028cc:	05653023          	sd	s6,64(a0)
    802028d0:	05753423          	sd	s7,72(a0)
    802028d4:	05853823          	sd	s8,80(a0)
    802028d8:	05953c23          	sd	s9,88(a0)
    802028dc:	07a53023          	sd	s10,96(a0)
    802028e0:	07b53423          	sd	s11,104(a0)
    802028e4:	0005b083          	ld	ra,0(a1)
    802028e8:	0085b103          	ld	sp,8(a1)
    802028ec:	6980                	ld	s0,16(a1)
    802028ee:	6d84                	ld	s1,24(a1)
    802028f0:	0205b903          	ld	s2,32(a1)
    802028f4:	0285b983          	ld	s3,40(a1)
    802028f8:	0305ba03          	ld	s4,48(a1)
    802028fc:	0385ba83          	ld	s5,56(a1)
    80202900:	0405bb03          	ld	s6,64(a1)
    80202904:	0485bb83          	ld	s7,72(a1)
    80202908:	0505bc03          	ld	s8,80(a1)
    8020290c:	0585bc83          	ld	s9,88(a1)
    80202910:	0605bd03          	ld	s10,96(a1)
    80202914:	0685bd83          	ld	s11,104(a1)
    80202918:	8082                	ret

000000008020291a <trapinithart>:
// }

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    8020291a:	1141                	addi	sp,sp,-16
    8020291c:	e406                	sd	ra,8(sp)
    8020291e:	e022                	sd	s0,0(sp)
    80202920:	0800                	addi	s0,sp,16
  asm volatile("csrw stvec, %0" : : "r" (x));
    80202922:	0000a797          	auipc	a5,0xa
    80202926:	7ae7b783          	ld	a5,1966(a5) # 8020d0d0 <_GLOBAL_OFFSET_TABLE_+0x20>
    8020292a:	10579073          	csrw	stvec,a5
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8020292e:	100027f3          	csrr	a5,sstatus
  w_stvec((uint64)kernelvec);
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202932:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202936:	10079073          	csrw	sstatus,a5
  asm volatile("csrr %0, sie" : "=r" (x) );
    8020293a:	104027f3          	csrr	a5,sie
  // enable supervisor-mode timer interrupts.
  w_sie(r_sie() | SIE_SEIE | SIE_SSIE | SIE_STIE);
    8020293e:	2227e793          	ori	a5,a5,546
  asm volatile("csrw sie, %0" : : "r" (x));
    80202942:	10479073          	csrw	sie,a5
  set_next_timeout();
    80202946:	00003097          	auipc	ra,0x3
    8020294a:	710080e7          	jalr	1808(ra) # 80206056 <set_next_timeout>
  #ifdef DEBUG
  printf("trapinithart\n");
  #endif
}
    8020294e:	60a2                	ld	ra,8(sp)
    80202950:	6402                	ld	s0,0(sp)
    80202952:	0141                	addi	sp,sp,16
    80202954:	8082                	ret

0000000080202956 <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80202956:	1141                	addi	sp,sp,-16
    80202958:	e406                	sd	ra,8(sp)
    8020295a:	e022                	sd	s0,0(sp)
    8020295c:	0800                	addi	s0,sp,16
  struct proc *p = myproc();
    8020295e:	fffff097          	auipc	ra,0xfffff
    80202962:	0fa080e7          	jalr	250(ra) # 80201a58 <myproc>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202966:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    8020296a:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8020296c:	10079073          	csrw	sstatus,a5
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    80202970:	0000a617          	auipc	a2,0xa
    80202974:	74863603          	ld	a2,1864(a2) # 8020d0b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80202978:	0000a697          	auipc	a3,0xa
    8020297c:	7786b683          	ld	a3,1912(a3) # 8020d0f0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80202980:	8e91                	sub	a3,a3,a2
    80202982:	040007b7          	lui	a5,0x4000
    80202986:	17fd                	addi	a5,a5,-1
    80202988:	07b2                	slli	a5,a5,0xc
    8020298a:	96be                	add	a3,a3,a5
  asm volatile("csrw stvec, %0" : : "r" (x));
    8020298c:	10569073          	csrw	stvec,a3

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80202990:	7138                	ld	a4,96(a0)
  asm volatile("csrr %0, satp" : "=r" (x) );
    80202992:	180026f3          	csrr	a3,satp
    80202996:	e314                	sd	a3,0(a4)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80202998:	7138                	ld	a4,96(a0)
    8020299a:	6134                	ld	a3,64(a0)
    8020299c:	6585                	lui	a1,0x1
    8020299e:	96ae                	add	a3,a3,a1
    802029a0:	e714                	sd	a3,8(a4)
  p->trapframe->kernel_trap = (uint64)usertrap;
    802029a2:	7138                	ld	a4,96(a0)
    802029a4:	00000697          	auipc	a3,0x0
    802029a8:	0f468693          	addi	a3,a3,244 # 80202a98 <usertrap>
    802029ac:	eb14                	sd	a3,16(a4)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    802029ae:	7138                	ld	a4,96(a0)
  asm volatile("mv %0, tp" : "=r" (x) );
    802029b0:	8692                	mv	a3,tp
    802029b2:	f314                	sd	a3,32(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802029b4:	100026f3          	csrr	a3,sstatus
  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    802029b8:	eff6f693          	andi	a3,a3,-257
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    802029bc:	0206e693          	ori	a3,a3,32
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802029c0:	10069073          	csrw	sstatus,a3
  w_sstatus(x);

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    802029c4:	7138                	ld	a4,96(a0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    802029c6:	6f18                	ld	a4,24(a4)
    802029c8:	14171073          	csrw	sepc,a4

  // tell trampoline.S the user page table to switch to.
  // printf("[usertrapret]p->pagetable: %p\n", p->pagetable);
  uint64 satp = MAKE_SATP(p->pagetable);
    802029cc:	692c                	ld	a1,80(a0)
    802029ce:	81b1                	srli	a1,a1,0xc

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    802029d0:	0000a717          	auipc	a4,0xa
    802029d4:	6f873703          	ld	a4,1784(a4) # 8020d0c8 <_GLOBAL_OFFSET_TABLE_+0x18>
    802029d8:	8f11                	sub	a4,a4,a2
    802029da:	97ba                	add	a5,a5,a4
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    802029dc:	577d                	li	a4,-1
    802029de:	177e                	slli	a4,a4,0x3f
    802029e0:	8dd9                	or	a1,a1,a4
    802029e2:	02000537          	lui	a0,0x2000
    802029e6:	157d                	addi	a0,a0,-1
    802029e8:	0536                	slli	a0,a0,0xd
    802029ea:	9782                	jalr	a5
}
    802029ec:	60a2                	ld	ra,8(sp)
    802029ee:	6402                	ld	s0,0(sp)
    802029f0:	0141                	addi	sp,sp,16
    802029f2:	8082                	ret

00000000802029f4 <devintr>:
// Check if it's an external/software interrupt, 
// and handle it. 
// returns  2 if timer interrupt, 
//          1 if other device, 
//          0 if not recognized. 
int devintr(void) {
    802029f4:	1101                	addi	sp,sp,-32
    802029f6:	ec06                	sd	ra,24(sp)
    802029f8:	e822                	sd	s0,16(sp)
    802029fa:	e426                	sd	s1,8(sp)
    802029fc:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    802029fe:	14202773          	csrr	a4,scause
	uint64 scause = r_scause();

	#ifdef QEMU 
	// handle external interrupt 
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    80202a02:	00074d63          	bltz	a4,80202a1c <devintr+0x28>
		sbi_set_mie();
		#endif 

		return 1;
	}
	else if (0x8000000000000005L == scause) {
    80202a06:	57fd                	li	a5,-1
    80202a08:	17fe                	slli	a5,a5,0x3f
    80202a0a:	0795                	addi	a5,a5,5
		timer_tick();
		return 2;
	}
	else { return 0;}
    80202a0c:	4501                	li	a0,0
	else if (0x8000000000000005L == scause) {
    80202a0e:	06f70f63          	beq	a4,a5,80202a8c <devintr+0x98>
}
    80202a12:	60e2                	ld	ra,24(sp)
    80202a14:	6442                	ld	s0,16(sp)
    80202a16:	64a2                	ld	s1,8(sp)
    80202a18:	6105                	addi	sp,sp,32
    80202a1a:	8082                	ret
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    80202a1c:	0ff77793          	andi	a5,a4,255
    80202a20:	46a5                	li	a3,9
    80202a22:	fed792e3          	bne	a5,a3,80202a06 <devintr+0x12>
		int irq = plic_claim();
    80202a26:	00005097          	auipc	ra,0x5
    80202a2a:	07a080e7          	jalr	122(ra) # 80207aa0 <plic_claim>
    80202a2e:	84aa                	mv	s1,a0
		if (UART_IRQ == irq) {
    80202a30:	47a9                	li	a5,10
    80202a32:	02f50163          	beq	a0,a5,80202a54 <devintr+0x60>
		else if (DISK_IRQ == irq) {
    80202a36:	4785                	li	a5,1
    80202a38:	04f50563          	beq	a0,a5,80202a82 <devintr+0x8e>
		return 1;
    80202a3c:	4505                	li	a0,1
		else if (irq) {
    80202a3e:	d8f1                	beqz	s1,80202a12 <devintr+0x1e>
			printf("unexpected interrupt irq = %d\n", irq);
    80202a40:	85a6                	mv	a1,s1
    80202a42:	00008517          	auipc	a0,0x8
    80202a46:	cee50513          	addi	a0,a0,-786 # 8020a730 <digits+0x3b0>
    80202a4a:	ffffd097          	auipc	ra,0xffffd
    80202a4e:	742080e7          	jalr	1858(ra) # 8020018c <printf>
    80202a52:	a821                	j	80202a6a <devintr+0x76>
	return SBI_CALL_0(SBI_CONSOLE_GETCHAR);
    80202a54:	4501                	li	a0,0
    80202a56:	4581                	li	a1,0
    80202a58:	4601                	li	a2,0
    80202a5a:	4681                	li	a3,0
    80202a5c:	4889                	li	a7,2
    80202a5e:	00000073          	ecall
    80202a62:	2501                	sext.w	a0,a0
			if (-1 != c) {
    80202a64:	57fd                	li	a5,-1
    80202a66:	00f51963          	bne	a0,a5,80202a78 <devintr+0x84>
		if (irq) { plic_complete(irq);}
    80202a6a:	8526                	mv	a0,s1
    80202a6c:	00005097          	auipc	ra,0x5
    80202a70:	05e080e7          	jalr	94(ra) # 80207aca <plic_complete>
		return 1;
    80202a74:	4505                	li	a0,1
    80202a76:	bf71                	j	80202a12 <devintr+0x1e>
				consoleintr(c);
    80202a78:	00005097          	auipc	ra,0x5
    80202a7c:	26a080e7          	jalr	618(ra) # 80207ce2 <consoleintr>
    80202a80:	b7ed                	j	80202a6a <devintr+0x76>
			disk_intr();
    80202a82:	00003097          	auipc	ra,0x3
    80202a86:	694080e7          	jalr	1684(ra) # 80206116 <disk_intr>
    80202a8a:	b7c5                	j	80202a6a <devintr+0x76>
		timer_tick();
    80202a8c:	00003097          	auipc	ra,0x3
    80202a90:	5f0080e7          	jalr	1520(ra) # 8020607c <timer_tick>
		return 2;
    80202a94:	4509                	li	a0,2
    80202a96:	bfb5                	j	80202a12 <devintr+0x1e>

0000000080202a98 <usertrap>:
{
    80202a98:	1101                	addi	sp,sp,-32
    80202a9a:	ec06                	sd	ra,24(sp)
    80202a9c:	e822                	sd	s0,16(sp)
    80202a9e:	e426                	sd	s1,8(sp)
    80202aa0:	e04a                	sd	s2,0(sp)
    80202aa2:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202aa4:	100027f3          	csrr	a5,sstatus
  if((r_sstatus() & SSTATUS_SPP) != 0)
    80202aa8:	1007f793          	andi	a5,a5,256
    80202aac:	e3ad                	bnez	a5,80202b0e <usertrap+0x76>
  asm volatile("csrw stvec, %0" : : "r" (x));
    80202aae:	0000a797          	auipc	a5,0xa
    80202ab2:	6227b783          	ld	a5,1570(a5) # 8020d0d0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80202ab6:	10579073          	csrw	stvec,a5
  struct proc *p = myproc();
    80202aba:	fffff097          	auipc	ra,0xfffff
    80202abe:	f9e080e7          	jalr	-98(ra) # 80201a58 <myproc>
    80202ac2:	84aa                	mv	s1,a0
  p->trapframe->epc = r_sepc();
    80202ac4:	713c                	ld	a5,96(a0)
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202ac6:	14102773          	csrr	a4,sepc
    80202aca:	ef98                	sd	a4,24(a5)
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202acc:	14202773          	csrr	a4,scause
  if(r_scause() == 8){
    80202ad0:	47a1                	li	a5,8
    80202ad2:	04f71c63          	bne	a4,a5,80202b2a <usertrap+0x92>
    if(p->killed)
    80202ad6:	591c                	lw	a5,48(a0)
    80202ad8:	e3b9                	bnez	a5,80202b1e <usertrap+0x86>
    p->trapframe->epc += 4;
    80202ada:	70b8                	ld	a4,96(s1)
    80202adc:	6f1c                	ld	a5,24(a4)
    80202ade:	0791                	addi	a5,a5,4
    80202ae0:	ef1c                	sd	a5,24(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202ae2:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202ae6:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202aea:	10079073          	csrw	sstatus,a5
    syscall();
    80202aee:	00000097          	auipc	ra,0x0
    80202af2:	5d4080e7          	jalr	1492(ra) # 802030c2 <syscall>
  if(p->killed)
    80202af6:	589c                	lw	a5,48(s1)
    80202af8:	ebd1                	bnez	a5,80202b8c <usertrap+0xf4>
  usertrapret();
    80202afa:	00000097          	auipc	ra,0x0
    80202afe:	e5c080e7          	jalr	-420(ra) # 80202956 <usertrapret>
}
    80202b02:	60e2                	ld	ra,24(sp)
    80202b04:	6442                	ld	s0,16(sp)
    80202b06:	64a2                	ld	s1,8(sp)
    80202b08:	6902                	ld	s2,0(sp)
    80202b0a:	6105                	addi	sp,sp,32
    80202b0c:	8082                	ret
    panic("usertrap: not from user mode");
    80202b0e:	00008517          	auipc	a0,0x8
    80202b12:	c4250513          	addi	a0,a0,-958 # 8020a750 <digits+0x3d0>
    80202b16:	ffffd097          	auipc	ra,0xffffd
    80202b1a:	62c080e7          	jalr	1580(ra) # 80200142 <panic>
      exit(-1);
    80202b1e:	557d                	li	a0,-1
    80202b20:	fffff097          	auipc	ra,0xfffff
    80202b24:	66c080e7          	jalr	1644(ra) # 8020218c <exit>
    80202b28:	bf4d                	j	80202ada <usertrap+0x42>
  else if((which_dev = devintr()) != 0){
    80202b2a:	00000097          	auipc	ra,0x0
    80202b2e:	eca080e7          	jalr	-310(ra) # 802029f4 <devintr>
    80202b32:	892a                	mv	s2,a0
    80202b34:	c501                	beqz	a0,80202b3c <usertrap+0xa4>
  if(p->killed)
    80202b36:	589c                	lw	a5,48(s1)
    80202b38:	c3b1                	beqz	a5,80202b7c <usertrap+0xe4>
    80202b3a:	a825                	j	80202b72 <usertrap+0xda>
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202b3c:	142025f3          	csrr	a1,scause
    printf("\nusertrap(): unexpected scause %p pid=%d %s\n", r_scause(), p->pid, p->name);
    80202b40:	4e048693          	addi	a3,s1,1248
    80202b44:	5c90                	lw	a2,56(s1)
    80202b46:	00008517          	auipc	a0,0x8
    80202b4a:	c2a50513          	addi	a0,a0,-982 # 8020a770 <digits+0x3f0>
    80202b4e:	ffffd097          	auipc	ra,0xffffd
    80202b52:	63e080e7          	jalr	1598(ra) # 8020018c <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202b56:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202b5a:	14302673          	csrr	a2,stval
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80202b5e:	00008517          	auipc	a0,0x8
    80202b62:	c4250513          	addi	a0,a0,-958 # 8020a7a0 <digits+0x420>
    80202b66:	ffffd097          	auipc	ra,0xffffd
    80202b6a:	626080e7          	jalr	1574(ra) # 8020018c <printf>
    p->killed = 1;
    80202b6e:	4785                	li	a5,1
    80202b70:	d89c                	sw	a5,48(s1)
    exit(-1);
    80202b72:	557d                	li	a0,-1
    80202b74:	fffff097          	auipc	ra,0xfffff
    80202b78:	618080e7          	jalr	1560(ra) # 8020218c <exit>
  if(which_dev == 2)
    80202b7c:	4789                	li	a5,2
    80202b7e:	f6f91ee3          	bne	s2,a5,80202afa <usertrap+0x62>
    yield();
    80202b82:	fffff097          	auipc	ra,0xfffff
    80202b86:	6f4080e7          	jalr	1780(ra) # 80202276 <yield>
    80202b8a:	bf85                	j	80202afa <usertrap+0x62>
  int which_dev = 0;
    80202b8c:	4901                	li	s2,0
    80202b8e:	b7d5                	j	80202b72 <usertrap+0xda>

0000000080202b90 <kerneltrap>:
kerneltrap() {
    80202b90:	7179                	addi	sp,sp,-48
    80202b92:	f406                	sd	ra,40(sp)
    80202b94:	f022                	sd	s0,32(sp)
    80202b96:	ec26                	sd	s1,24(sp)
    80202b98:	e84a                	sd	s2,16(sp)
    80202b9a:	e44e                	sd	s3,8(sp)
    80202b9c:	1800                	addi	s0,sp,48
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202b9e:	14102973          	csrr	s2,sepc
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202ba2:	100024f3          	csrr	s1,sstatus
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202ba6:	142029f3          	csrr	s3,scause
  if((sstatus & SSTATUS_SPP) == 0)
    80202baa:	1004f793          	andi	a5,s1,256
    80202bae:	cb85                	beqz	a5,80202bde <kerneltrap+0x4e>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202bb0:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80202bb4:	8b89                	andi	a5,a5,2
  if(intr_get() != 0)
    80202bb6:	ef85                	bnez	a5,80202bee <kerneltrap+0x5e>
  if((which_dev = devintr()) == 0){
    80202bb8:	00000097          	auipc	ra,0x0
    80202bbc:	e3c080e7          	jalr	-452(ra) # 802029f4 <devintr>
    80202bc0:	cd1d                	beqz	a0,80202bfe <kerneltrap+0x6e>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202bc2:	4789                	li	a5,2
    80202bc4:	08f50b63          	beq	a0,a5,80202c5a <kerneltrap+0xca>
  asm volatile("csrw sepc, %0" : : "r" (x));
    80202bc8:	14191073          	csrw	sepc,s2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202bcc:	10049073          	csrw	sstatus,s1
}
    80202bd0:	70a2                	ld	ra,40(sp)
    80202bd2:	7402                	ld	s0,32(sp)
    80202bd4:	64e2                	ld	s1,24(sp)
    80202bd6:	6942                	ld	s2,16(sp)
    80202bd8:	69a2                	ld	s3,8(sp)
    80202bda:	6145                	addi	sp,sp,48
    80202bdc:	8082                	ret
    panic("kerneltrap: not from supervisor mode");
    80202bde:	00008517          	auipc	a0,0x8
    80202be2:	be250513          	addi	a0,a0,-1054 # 8020a7c0 <digits+0x440>
    80202be6:	ffffd097          	auipc	ra,0xffffd
    80202bea:	55c080e7          	jalr	1372(ra) # 80200142 <panic>
    panic("kerneltrap: interrupts enabled");
    80202bee:	00008517          	auipc	a0,0x8
    80202bf2:	bfa50513          	addi	a0,a0,-1030 # 8020a7e8 <digits+0x468>
    80202bf6:	ffffd097          	auipc	ra,0xffffd
    80202bfa:	54c080e7          	jalr	1356(ra) # 80200142 <panic>
    printf("\nscause %p\n", scause);
    80202bfe:	85ce                	mv	a1,s3
    80202c00:	00008517          	auipc	a0,0x8
    80202c04:	c0850513          	addi	a0,a0,-1016 # 8020a808 <digits+0x488>
    80202c08:	ffffd097          	auipc	ra,0xffffd
    80202c0c:	584080e7          	jalr	1412(ra) # 8020018c <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202c10:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202c14:	14302673          	csrr	a2,stval
  asm volatile("mv %0, tp" : "=r" (x) );
    80202c18:	8692                	mv	a3,tp
    printf("sepc=%p stval=%p hart=%d\n", r_sepc(), r_stval(), r_tp());
    80202c1a:	00008517          	auipc	a0,0x8
    80202c1e:	bfe50513          	addi	a0,a0,-1026 # 8020a818 <digits+0x498>
    80202c22:	ffffd097          	auipc	ra,0xffffd
    80202c26:	56a080e7          	jalr	1386(ra) # 8020018c <printf>
    struct proc *p = myproc();
    80202c2a:	fffff097          	auipc	ra,0xfffff
    80202c2e:	e2e080e7          	jalr	-466(ra) # 80201a58 <myproc>
    if (p != 0) {
    80202c32:	cd01                	beqz	a0,80202c4a <kerneltrap+0xba>
      printf("pid: %d, name: %s\n", p->pid, p->name);
    80202c34:	4e050613          	addi	a2,a0,1248
    80202c38:	5d0c                	lw	a1,56(a0)
    80202c3a:	00008517          	auipc	a0,0x8
    80202c3e:	bfe50513          	addi	a0,a0,-1026 # 8020a838 <digits+0x4b8>
    80202c42:	ffffd097          	auipc	ra,0xffffd
    80202c46:	54a080e7          	jalr	1354(ra) # 8020018c <printf>
    panic("kerneltrap");
    80202c4a:	00008517          	auipc	a0,0x8
    80202c4e:	c0650513          	addi	a0,a0,-1018 # 8020a850 <digits+0x4d0>
    80202c52:	ffffd097          	auipc	ra,0xffffd
    80202c56:	4f0080e7          	jalr	1264(ra) # 80200142 <panic>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202c5a:	fffff097          	auipc	ra,0xfffff
    80202c5e:	dfe080e7          	jalr	-514(ra) # 80201a58 <myproc>
    80202c62:	d13d                	beqz	a0,80202bc8 <kerneltrap+0x38>
    80202c64:	fffff097          	auipc	ra,0xfffff
    80202c68:	df4080e7          	jalr	-524(ra) # 80201a58 <myproc>
    80202c6c:	4d18                	lw	a4,24(a0)
    80202c6e:	478d                	li	a5,3
    80202c70:	f4f71ce3          	bne	a4,a5,80202bc8 <kerneltrap+0x38>
    yield();
    80202c74:	fffff097          	auipc	ra,0xfffff
    80202c78:	602080e7          	jalr	1538(ra) # 80202276 <yield>
    80202c7c:	b7b1                	j	80202bc8 <kerneltrap+0x38>

0000000080202c7e <trapframedump>:

void trapframedump(struct trapframe *tf)
{
    80202c7e:	1101                	addi	sp,sp,-32
    80202c80:	ec06                	sd	ra,24(sp)
    80202c82:	e822                	sd	s0,16(sp)
    80202c84:	e426                	sd	s1,8(sp)
    80202c86:	1000                	addi	s0,sp,32
    80202c88:	84aa                	mv	s1,a0
  printf("a0: %p\t", tf->a0);
    80202c8a:	792c                	ld	a1,112(a0)
    80202c8c:	00008517          	auipc	a0,0x8
    80202c90:	bd450513          	addi	a0,a0,-1068 # 8020a860 <digits+0x4e0>
    80202c94:	ffffd097          	auipc	ra,0xffffd
    80202c98:	4f8080e7          	jalr	1272(ra) # 8020018c <printf>
  printf("a1: %p\t", tf->a1);
    80202c9c:	7cac                	ld	a1,120(s1)
    80202c9e:	00008517          	auipc	a0,0x8
    80202ca2:	bca50513          	addi	a0,a0,-1078 # 8020a868 <digits+0x4e8>
    80202ca6:	ffffd097          	auipc	ra,0xffffd
    80202caa:	4e6080e7          	jalr	1254(ra) # 8020018c <printf>
  printf("a2: %p\t", tf->a2);
    80202cae:	60cc                	ld	a1,128(s1)
    80202cb0:	00008517          	auipc	a0,0x8
    80202cb4:	bc050513          	addi	a0,a0,-1088 # 8020a870 <digits+0x4f0>
    80202cb8:	ffffd097          	auipc	ra,0xffffd
    80202cbc:	4d4080e7          	jalr	1236(ra) # 8020018c <printf>
  printf("a3: %p\n", tf->a3);
    80202cc0:	64cc                	ld	a1,136(s1)
    80202cc2:	00008517          	auipc	a0,0x8
    80202cc6:	bb650513          	addi	a0,a0,-1098 # 8020a878 <digits+0x4f8>
    80202cca:	ffffd097          	auipc	ra,0xffffd
    80202cce:	4c2080e7          	jalr	1218(ra) # 8020018c <printf>
  printf("a4: %p\t", tf->a4);
    80202cd2:	68cc                	ld	a1,144(s1)
    80202cd4:	00008517          	auipc	a0,0x8
    80202cd8:	bac50513          	addi	a0,a0,-1108 # 8020a880 <digits+0x500>
    80202cdc:	ffffd097          	auipc	ra,0xffffd
    80202ce0:	4b0080e7          	jalr	1200(ra) # 8020018c <printf>
  printf("a5: %p\t", tf->a5);
    80202ce4:	6ccc                	ld	a1,152(s1)
    80202ce6:	00008517          	auipc	a0,0x8
    80202cea:	ba250513          	addi	a0,a0,-1118 # 8020a888 <digits+0x508>
    80202cee:	ffffd097          	auipc	ra,0xffffd
    80202cf2:	49e080e7          	jalr	1182(ra) # 8020018c <printf>
  printf("a6: %p\t", tf->a6);
    80202cf6:	70cc                	ld	a1,160(s1)
    80202cf8:	00008517          	auipc	a0,0x8
    80202cfc:	b9850513          	addi	a0,a0,-1128 # 8020a890 <digits+0x510>
    80202d00:	ffffd097          	auipc	ra,0xffffd
    80202d04:	48c080e7          	jalr	1164(ra) # 8020018c <printf>
  printf("a7: %p\n", tf->a7);
    80202d08:	74cc                	ld	a1,168(s1)
    80202d0a:	00008517          	auipc	a0,0x8
    80202d0e:	b8e50513          	addi	a0,a0,-1138 # 8020a898 <digits+0x518>
    80202d12:	ffffd097          	auipc	ra,0xffffd
    80202d16:	47a080e7          	jalr	1146(ra) # 8020018c <printf>
  printf("t0: %p\t", tf->t0);
    80202d1a:	64ac                	ld	a1,72(s1)
    80202d1c:	00008517          	auipc	a0,0x8
    80202d20:	b8450513          	addi	a0,a0,-1148 # 8020a8a0 <digits+0x520>
    80202d24:	ffffd097          	auipc	ra,0xffffd
    80202d28:	468080e7          	jalr	1128(ra) # 8020018c <printf>
  printf("t1: %p\t", tf->t1);
    80202d2c:	68ac                	ld	a1,80(s1)
    80202d2e:	00008517          	auipc	a0,0x8
    80202d32:	b7a50513          	addi	a0,a0,-1158 # 8020a8a8 <digits+0x528>
    80202d36:	ffffd097          	auipc	ra,0xffffd
    80202d3a:	456080e7          	jalr	1110(ra) # 8020018c <printf>
  printf("t2: %p\t", tf->t2);
    80202d3e:	6cac                	ld	a1,88(s1)
    80202d40:	00008517          	auipc	a0,0x8
    80202d44:	b7050513          	addi	a0,a0,-1168 # 8020a8b0 <digits+0x530>
    80202d48:	ffffd097          	auipc	ra,0xffffd
    80202d4c:	444080e7          	jalr	1092(ra) # 8020018c <printf>
  printf("t3: %p\n", tf->t3);
    80202d50:	1004b583          	ld	a1,256(s1)
    80202d54:	00008517          	auipc	a0,0x8
    80202d58:	b6450513          	addi	a0,a0,-1180 # 8020a8b8 <digits+0x538>
    80202d5c:	ffffd097          	auipc	ra,0xffffd
    80202d60:	430080e7          	jalr	1072(ra) # 8020018c <printf>
  printf("t4: %p\t", tf->t4);
    80202d64:	1084b583          	ld	a1,264(s1)
    80202d68:	00008517          	auipc	a0,0x8
    80202d6c:	b5850513          	addi	a0,a0,-1192 # 8020a8c0 <digits+0x540>
    80202d70:	ffffd097          	auipc	ra,0xffffd
    80202d74:	41c080e7          	jalr	1052(ra) # 8020018c <printf>
  printf("t5: %p\t", tf->t5);
    80202d78:	1104b583          	ld	a1,272(s1)
    80202d7c:	00008517          	auipc	a0,0x8
    80202d80:	b4c50513          	addi	a0,a0,-1204 # 8020a8c8 <digits+0x548>
    80202d84:	ffffd097          	auipc	ra,0xffffd
    80202d88:	408080e7          	jalr	1032(ra) # 8020018c <printf>
  printf("t6: %p\t", tf->t6);
    80202d8c:	1184b583          	ld	a1,280(s1)
    80202d90:	00008517          	auipc	a0,0x8
    80202d94:	b4050513          	addi	a0,a0,-1216 # 8020a8d0 <digits+0x550>
    80202d98:	ffffd097          	auipc	ra,0xffffd
    80202d9c:	3f4080e7          	jalr	1012(ra) # 8020018c <printf>
  printf("s0: %p\n", tf->s0);
    80202da0:	70ac                	ld	a1,96(s1)
    80202da2:	00008517          	auipc	a0,0x8
    80202da6:	b3650513          	addi	a0,a0,-1226 # 8020a8d8 <digits+0x558>
    80202daa:	ffffd097          	auipc	ra,0xffffd
    80202dae:	3e2080e7          	jalr	994(ra) # 8020018c <printf>
  printf("s1: %p\t", tf->s1);
    80202db2:	74ac                	ld	a1,104(s1)
    80202db4:	00008517          	auipc	a0,0x8
    80202db8:	b2c50513          	addi	a0,a0,-1236 # 8020a8e0 <digits+0x560>
    80202dbc:	ffffd097          	auipc	ra,0xffffd
    80202dc0:	3d0080e7          	jalr	976(ra) # 8020018c <printf>
  printf("s2: %p\t", tf->s2);
    80202dc4:	78cc                	ld	a1,176(s1)
    80202dc6:	00008517          	auipc	a0,0x8
    80202dca:	b2250513          	addi	a0,a0,-1246 # 8020a8e8 <digits+0x568>
    80202dce:	ffffd097          	auipc	ra,0xffffd
    80202dd2:	3be080e7          	jalr	958(ra) # 8020018c <printf>
  printf("s3: %p\t", tf->s3);
    80202dd6:	7ccc                	ld	a1,184(s1)
    80202dd8:	00008517          	auipc	a0,0x8
    80202ddc:	b1850513          	addi	a0,a0,-1256 # 8020a8f0 <digits+0x570>
    80202de0:	ffffd097          	auipc	ra,0xffffd
    80202de4:	3ac080e7          	jalr	940(ra) # 8020018c <printf>
  printf("s4: %p\n", tf->s4);
    80202de8:	60ec                	ld	a1,192(s1)
    80202dea:	00008517          	auipc	a0,0x8
    80202dee:	b0e50513          	addi	a0,a0,-1266 # 8020a8f8 <digits+0x578>
    80202df2:	ffffd097          	auipc	ra,0xffffd
    80202df6:	39a080e7          	jalr	922(ra) # 8020018c <printf>
  printf("s5: %p\t", tf->s5);
    80202dfa:	64ec                	ld	a1,200(s1)
    80202dfc:	00008517          	auipc	a0,0x8
    80202e00:	b0450513          	addi	a0,a0,-1276 # 8020a900 <digits+0x580>
    80202e04:	ffffd097          	auipc	ra,0xffffd
    80202e08:	388080e7          	jalr	904(ra) # 8020018c <printf>
  printf("s6: %p\t", tf->s6);
    80202e0c:	68ec                	ld	a1,208(s1)
    80202e0e:	00008517          	auipc	a0,0x8
    80202e12:	afa50513          	addi	a0,a0,-1286 # 8020a908 <digits+0x588>
    80202e16:	ffffd097          	auipc	ra,0xffffd
    80202e1a:	376080e7          	jalr	886(ra) # 8020018c <printf>
  printf("s7: %p\t", tf->s7);
    80202e1e:	6cec                	ld	a1,216(s1)
    80202e20:	00008517          	auipc	a0,0x8
    80202e24:	af050513          	addi	a0,a0,-1296 # 8020a910 <digits+0x590>
    80202e28:	ffffd097          	auipc	ra,0xffffd
    80202e2c:	364080e7          	jalr	868(ra) # 8020018c <printf>
  printf("s8: %p\n", tf->s8);
    80202e30:	70ec                	ld	a1,224(s1)
    80202e32:	00008517          	auipc	a0,0x8
    80202e36:	ae650513          	addi	a0,a0,-1306 # 8020a918 <digits+0x598>
    80202e3a:	ffffd097          	auipc	ra,0xffffd
    80202e3e:	352080e7          	jalr	850(ra) # 8020018c <printf>
  printf("s9: %p\t", tf->s9);
    80202e42:	74ec                	ld	a1,232(s1)
    80202e44:	00008517          	auipc	a0,0x8
    80202e48:	adc50513          	addi	a0,a0,-1316 # 8020a920 <digits+0x5a0>
    80202e4c:	ffffd097          	auipc	ra,0xffffd
    80202e50:	340080e7          	jalr	832(ra) # 8020018c <printf>
  printf("s10: %p\t", tf->s10);
    80202e54:	78ec                	ld	a1,240(s1)
    80202e56:	00008517          	auipc	a0,0x8
    80202e5a:	ad250513          	addi	a0,a0,-1326 # 8020a928 <digits+0x5a8>
    80202e5e:	ffffd097          	auipc	ra,0xffffd
    80202e62:	32e080e7          	jalr	814(ra) # 8020018c <printf>
  printf("s11: %p\t", tf->s11);
    80202e66:	7cec                	ld	a1,248(s1)
    80202e68:	00008517          	auipc	a0,0x8
    80202e6c:	ad050513          	addi	a0,a0,-1328 # 8020a938 <digits+0x5b8>
    80202e70:	ffffd097          	auipc	ra,0xffffd
    80202e74:	31c080e7          	jalr	796(ra) # 8020018c <printf>
  printf("ra: %p\n", tf->ra);
    80202e78:	748c                	ld	a1,40(s1)
    80202e7a:	00007517          	auipc	a0,0x7
    80202e7e:	79650513          	addi	a0,a0,1942 # 8020a610 <digits+0x290>
    80202e82:	ffffd097          	auipc	ra,0xffffd
    80202e86:	30a080e7          	jalr	778(ra) # 8020018c <printf>
  printf("sp: %p\t", tf->sp);
    80202e8a:	788c                	ld	a1,48(s1)
    80202e8c:	00008517          	auipc	a0,0x8
    80202e90:	abc50513          	addi	a0,a0,-1348 # 8020a948 <digits+0x5c8>
    80202e94:	ffffd097          	auipc	ra,0xffffd
    80202e98:	2f8080e7          	jalr	760(ra) # 8020018c <printf>
  printf("gp: %p\t", tf->gp);
    80202e9c:	7c8c                	ld	a1,56(s1)
    80202e9e:	00008517          	auipc	a0,0x8
    80202ea2:	ab250513          	addi	a0,a0,-1358 # 8020a950 <digits+0x5d0>
    80202ea6:	ffffd097          	auipc	ra,0xffffd
    80202eaa:	2e6080e7          	jalr	742(ra) # 8020018c <printf>
  printf("tp: %p\t", tf->tp);
    80202eae:	60ac                	ld	a1,64(s1)
    80202eb0:	00008517          	auipc	a0,0x8
    80202eb4:	aa850513          	addi	a0,a0,-1368 # 8020a958 <digits+0x5d8>
    80202eb8:	ffffd097          	auipc	ra,0xffffd
    80202ebc:	2d4080e7          	jalr	724(ra) # 8020018c <printf>
  printf("epc: %p\n", tf->epc);
    80202ec0:	6c8c                	ld	a1,24(s1)
    80202ec2:	00008517          	auipc	a0,0x8
    80202ec6:	a9e50513          	addi	a0,a0,-1378 # 8020a960 <digits+0x5e0>
    80202eca:	ffffd097          	auipc	ra,0xffffd
    80202ece:	2c2080e7          	jalr	706(ra) # 8020018c <printf>
}
    80202ed2:	60e2                	ld	ra,24(sp)
    80202ed4:	6442                	ld	s0,16(sp)
    80202ed6:	64a2                	ld	s1,8(sp)
    80202ed8:	6105                	addi	sp,sp,32
    80202eda:	8082                	ret

0000000080202edc <argraw>:
  return strlen(buf);
}

static uint64
argraw(int n)
{
    80202edc:	1101                	addi	sp,sp,-32
    80202ede:	ec06                	sd	ra,24(sp)
    80202ee0:	e822                	sd	s0,16(sp)
    80202ee2:	e426                	sd	s1,8(sp)
    80202ee4:	1000                	addi	s0,sp,32
    80202ee6:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80202ee8:	fffff097          	auipc	ra,0xfffff
    80202eec:	b70080e7          	jalr	-1168(ra) # 80201a58 <myproc>
  switch (n) {
    80202ef0:	4795                	li	a5,5
    80202ef2:	0497e163          	bltu	a5,s1,80202f34 <argraw+0x58>
    80202ef6:	048a                	slli	s1,s1,0x2
    80202ef8:	00008717          	auipc	a4,0x8
    80202efc:	c9070713          	addi	a4,a4,-880 # 8020ab88 <digits+0x808>
    80202f00:	94ba                	add	s1,s1,a4
    80202f02:	409c                	lw	a5,0(s1)
    80202f04:	97ba                	add	a5,a5,a4
    80202f06:	8782                	jr	a5
  case 0:
    return p->trapframe->a0;
    80202f08:	713c                	ld	a5,96(a0)
    80202f0a:	7ba8                	ld	a0,112(a5)
  case 5:
    return p->trapframe->a5;
  }
  panic("argraw");
  return -1;
}
    80202f0c:	60e2                	ld	ra,24(sp)
    80202f0e:	6442                	ld	s0,16(sp)
    80202f10:	64a2                	ld	s1,8(sp)
    80202f12:	6105                	addi	sp,sp,32
    80202f14:	8082                	ret
    return p->trapframe->a1;
    80202f16:	713c                	ld	a5,96(a0)
    80202f18:	7fa8                	ld	a0,120(a5)
    80202f1a:	bfcd                	j	80202f0c <argraw+0x30>
    return p->trapframe->a2;
    80202f1c:	713c                	ld	a5,96(a0)
    80202f1e:	63c8                	ld	a0,128(a5)
    80202f20:	b7f5                	j	80202f0c <argraw+0x30>
    return p->trapframe->a3;
    80202f22:	713c                	ld	a5,96(a0)
    80202f24:	67c8                	ld	a0,136(a5)
    80202f26:	b7dd                	j	80202f0c <argraw+0x30>
    return p->trapframe->a4;
    80202f28:	713c                	ld	a5,96(a0)
    80202f2a:	6bc8                	ld	a0,144(a5)
    80202f2c:	b7c5                	j	80202f0c <argraw+0x30>
    return p->trapframe->a5;
    80202f2e:	713c                	ld	a5,96(a0)
    80202f30:	6fc8                	ld	a0,152(a5)
    80202f32:	bfe9                	j	80202f0c <argraw+0x30>
  panic("argraw");
    80202f34:	00008517          	auipc	a0,0x8
    80202f38:	a3c50513          	addi	a0,a0,-1476 # 8020a970 <digits+0x5f0>
    80202f3c:	ffffd097          	auipc	ra,0xffffd
    80202f40:	206080e7          	jalr	518(ra) # 80200142 <panic>

0000000080202f44 <sys_sysinfo>:
    return 0;
}

uint64
sys_sysinfo(void)
{
    80202f44:	7179                	addi	sp,sp,-48
    80202f46:	f406                	sd	ra,40(sp)
    80202f48:	f022                	sd	s0,32(sp)
    80202f4a:	ec26                	sd	s1,24(sp)
    80202f4c:	1800                	addi	s0,sp,48
  *ip = argraw(n);
    80202f4e:	4501                	li	a0,0
    80202f50:	00000097          	auipc	ra,0x0
    80202f54:	f8c080e7          	jalr	-116(ra) # 80202edc <argraw>
    80202f58:	84aa                	mv	s1,a0
  if (argaddr(0, &addr) < 0) {
    return -1;
  }

  struct sysinfo info;
  info.freemem = freemem_amount();
    80202f5a:	ffffd097          	auipc	ra,0xffffd
    80202f5e:	668080e7          	jalr	1640(ra) # 802005c2 <freemem_amount>
    80202f62:	fca43823          	sd	a0,-48(s0)
  info.nproc = procnum();
    80202f66:	fffff097          	auipc	ra,0xfffff
    80202f6a:	6c6080e7          	jalr	1734(ra) # 8020262c <procnum>
    80202f6e:	fca43c23          	sd	a0,-40(s0)

  // if (copyout(p->pagetable, addr, (char *)&info, sizeof(info)) < 0) {
  if (copyout2(addr, (char *)&info, sizeof(info)) < 0) {
    80202f72:	4641                	li	a2,16
    80202f74:	fd040593          	addi	a1,s0,-48
    80202f78:	8526                	mv	a0,s1
    80202f7a:	ffffe097          	auipc	ra,0xffffe
    80202f7e:	402080e7          	jalr	1026(ra) # 8020137c <copyout2>
    return -1;
  }

  return 0;
    80202f82:	957d                	srai	a0,a0,0x3f
    80202f84:	70a2                	ld	ra,40(sp)
    80202f86:	7402                	ld	s0,32(sp)
    80202f88:	64e2                	ld	s1,24(sp)
    80202f8a:	6145                	addi	sp,sp,48
    80202f8c:	8082                	ret

0000000080202f8e <fetchaddr>:
{
    80202f8e:	1101                	addi	sp,sp,-32
    80202f90:	ec06                	sd	ra,24(sp)
    80202f92:	e822                	sd	s0,16(sp)
    80202f94:	e426                	sd	s1,8(sp)
    80202f96:	e04a                	sd	s2,0(sp)
    80202f98:	1000                	addi	s0,sp,32
    80202f9a:	84aa                	mv	s1,a0
    80202f9c:	892e                	mv	s2,a1
  struct proc *p = myproc();
    80202f9e:	fffff097          	auipc	ra,0xfffff
    80202fa2:	aba080e7          	jalr	-1350(ra) # 80201a58 <myproc>
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    80202fa6:	653c                	ld	a5,72(a0)
    80202fa8:	02f4f763          	bgeu	s1,a5,80202fd6 <fetchaddr+0x48>
    80202fac:	00848713          	addi	a4,s1,8
    80202fb0:	02e7e563          	bltu	a5,a4,80202fda <fetchaddr+0x4c>
  if(copyin2((char *)ip, addr, sizeof(*ip)) != 0)
    80202fb4:	4621                	li	a2,8
    80202fb6:	85a6                	mv	a1,s1
    80202fb8:	854a                	mv	a0,s2
    80202fba:	ffffe097          	auipc	ra,0xffffe
    80202fbe:	4a0080e7          	jalr	1184(ra) # 8020145a <copyin2>
    80202fc2:	00a03533          	snez	a0,a0
    80202fc6:	40a00533          	neg	a0,a0
}
    80202fca:	60e2                	ld	ra,24(sp)
    80202fcc:	6442                	ld	s0,16(sp)
    80202fce:	64a2                	ld	s1,8(sp)
    80202fd0:	6902                	ld	s2,0(sp)
    80202fd2:	6105                	addi	sp,sp,32
    80202fd4:	8082                	ret
    return -1;
    80202fd6:	557d                	li	a0,-1
    80202fd8:	bfcd                	j	80202fca <fetchaddr+0x3c>
    80202fda:	557d                	li	a0,-1
    80202fdc:	b7fd                	j	80202fca <fetchaddr+0x3c>

0000000080202fde <fetchstr>:
{
    80202fde:	1101                	addi	sp,sp,-32
    80202fe0:	ec06                	sd	ra,24(sp)
    80202fe2:	e822                	sd	s0,16(sp)
    80202fe4:	e426                	sd	s1,8(sp)
    80202fe6:	1000                	addi	s0,sp,32
    80202fe8:	84ae                	mv	s1,a1
  int err = copyinstr2(buf, addr, max);
    80202fea:	85aa                	mv	a1,a0
    80202fec:	8526                	mv	a0,s1
    80202fee:	ffffe097          	auipc	ra,0xffffe
    80202ff2:	572080e7          	jalr	1394(ra) # 80201560 <copyinstr2>
  if(err < 0)
    80202ff6:	00054763          	bltz	a0,80203004 <fetchstr+0x26>
  return strlen(buf);
    80202ffa:	8526                	mv	a0,s1
    80202ffc:	ffffe097          	auipc	ra,0xffffe
    80203000:	8f0080e7          	jalr	-1808(ra) # 802008ec <strlen>
}
    80203004:	60e2                	ld	ra,24(sp)
    80203006:	6442                	ld	s0,16(sp)
    80203008:	64a2                	ld	s1,8(sp)
    8020300a:	6105                	addi	sp,sp,32
    8020300c:	8082                	ret

000000008020300e <argint>:
{
    8020300e:	1101                	addi	sp,sp,-32
    80203010:	ec06                	sd	ra,24(sp)
    80203012:	e822                	sd	s0,16(sp)
    80203014:	e426                	sd	s1,8(sp)
    80203016:	1000                	addi	s0,sp,32
    80203018:	84ae                	mv	s1,a1
  *ip = argraw(n);
    8020301a:	00000097          	auipc	ra,0x0
    8020301e:	ec2080e7          	jalr	-318(ra) # 80202edc <argraw>
    80203022:	c088                	sw	a0,0(s1)
}
    80203024:	4501                	li	a0,0
    80203026:	60e2                	ld	ra,24(sp)
    80203028:	6442                	ld	s0,16(sp)
    8020302a:	64a2                	ld	s1,8(sp)
    8020302c:	6105                	addi	sp,sp,32
    8020302e:	8082                	ret

0000000080203030 <sys_test_proc>:
sys_test_proc(void) {
    80203030:	1101                	addi	sp,sp,-32
    80203032:	ec06                	sd	ra,24(sp)
    80203034:	e822                	sd	s0,16(sp)
    80203036:	1000                	addi	s0,sp,32
    argint(0, &n);
    80203038:	fec40593          	addi	a1,s0,-20
    8020303c:	4501                	li	a0,0
    8020303e:	00000097          	auipc	ra,0x0
    80203042:	fd0080e7          	jalr	-48(ra) # 8020300e <argint>
    printf("hello world from proc %d, hart %d, arg %d\n", myproc()->pid, r_tp(), n);
    80203046:	fffff097          	auipc	ra,0xfffff
    8020304a:	a12080e7          	jalr	-1518(ra) # 80201a58 <myproc>
    8020304e:	8612                	mv	a2,tp
    80203050:	fec42683          	lw	a3,-20(s0)
    80203054:	5d0c                	lw	a1,56(a0)
    80203056:	00008517          	auipc	a0,0x8
    8020305a:	92250513          	addi	a0,a0,-1758 # 8020a978 <digits+0x5f8>
    8020305e:	ffffd097          	auipc	ra,0xffffd
    80203062:	12e080e7          	jalr	302(ra) # 8020018c <printf>
}
    80203066:	4501                	li	a0,0
    80203068:	60e2                	ld	ra,24(sp)
    8020306a:	6442                	ld	s0,16(sp)
    8020306c:	6105                	addi	sp,sp,32
    8020306e:	8082                	ret

0000000080203070 <argaddr>:
{
    80203070:	1101                	addi	sp,sp,-32
    80203072:	ec06                	sd	ra,24(sp)
    80203074:	e822                	sd	s0,16(sp)
    80203076:	e426                	sd	s1,8(sp)
    80203078:	1000                	addi	s0,sp,32
    8020307a:	84ae                	mv	s1,a1
  *ip = argraw(n);
    8020307c:	00000097          	auipc	ra,0x0
    80203080:	e60080e7          	jalr	-416(ra) # 80202edc <argraw>
    80203084:	e088                	sd	a0,0(s1)
}
    80203086:	4501                	li	a0,0
    80203088:	60e2                	ld	ra,24(sp)
    8020308a:	6442                	ld	s0,16(sp)
    8020308c:	64a2                	ld	s1,8(sp)
    8020308e:	6105                	addi	sp,sp,32
    80203090:	8082                	ret

0000000080203092 <argstr>:
{
    80203092:	1101                	addi	sp,sp,-32
    80203094:	ec06                	sd	ra,24(sp)
    80203096:	e822                	sd	s0,16(sp)
    80203098:	e426                	sd	s1,8(sp)
    8020309a:	e04a                	sd	s2,0(sp)
    8020309c:	1000                	addi	s0,sp,32
    8020309e:	84ae                	mv	s1,a1
    802030a0:	8932                	mv	s2,a2
  *ip = argraw(n);
    802030a2:	00000097          	auipc	ra,0x0
    802030a6:	e3a080e7          	jalr	-454(ra) # 80202edc <argraw>
  return fetchstr(addr, buf, max);
    802030aa:	864a                	mv	a2,s2
    802030ac:	85a6                	mv	a1,s1
    802030ae:	00000097          	auipc	ra,0x0
    802030b2:	f30080e7          	jalr	-208(ra) # 80202fde <fetchstr>
}
    802030b6:	60e2                	ld	ra,24(sp)
    802030b8:	6442                	ld	s0,16(sp)
    802030ba:	64a2                	ld	s1,8(sp)
    802030bc:	6902                	ld	s2,0(sp)
    802030be:	6105                	addi	sp,sp,32
    802030c0:	8082                	ret

00000000802030c2 <syscall>:
{
    802030c2:	7179                	addi	sp,sp,-48
    802030c4:	f406                	sd	ra,40(sp)
    802030c6:	f022                	sd	s0,32(sp)
    802030c8:	ec26                	sd	s1,24(sp)
    802030ca:	e84a                	sd	s2,16(sp)
    802030cc:	e44e                	sd	s3,8(sp)
    802030ce:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    802030d0:	fffff097          	auipc	ra,0xfffff
    802030d4:	988080e7          	jalr	-1656(ra) # 80201a58 <myproc>
    802030d8:	84aa                	mv	s1,a0
  num = p->trapframe->a7;
    802030da:	06053903          	ld	s2,96(a0)
    802030de:	0a893783          	ld	a5,168(s2)
    802030e2:	0007899b          	sext.w	s3,a5
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    802030e6:	37fd                	addiw	a5,a5,-1
    802030e8:	20100713          	li	a4,513
    802030ec:	04f76863          	bltu	a4,a5,8020313c <syscall+0x7a>
    802030f0:	00399713          	slli	a4,s3,0x3
    802030f4:	00008797          	auipc	a5,0x8
    802030f8:	f7478793          	addi	a5,a5,-140 # 8020b068 <syscalls>
    802030fc:	97ba                	add	a5,a5,a4
    802030fe:	639c                	ld	a5,0(a5)
    80203100:	cf95                	beqz	a5,8020313c <syscall+0x7a>
    p->trapframe->a0 = syscalls[num]();
    80203102:	9782                	jalr	a5
    80203104:	06a93823          	sd	a0,112(s2)
    if ((p->tmask & (1 << num)) != 0) {
    80203108:	4f04a783          	lw	a5,1264(s1)
    8020310c:	4137d7bb          	sraw	a5,a5,s3
    80203110:	8b85                	andi	a5,a5,1
    80203112:	c7a1                	beqz	a5,8020315a <syscall+0x98>
      printf("pid %d: %s -> %d\n", p->pid, sysnames[num], p->trapframe->a0);
    80203114:	70b8                	ld	a4,96(s1)
    80203116:	098e                	slli	s3,s3,0x3
    80203118:	00009797          	auipc	a5,0x9
    8020311c:	f6878793          	addi	a5,a5,-152 # 8020c080 <sysnames>
    80203120:	99be                	add	s3,s3,a5
    80203122:	7b34                	ld	a3,112(a4)
    80203124:	0009b603          	ld	a2,0(s3)
    80203128:	5c8c                	lw	a1,56(s1)
    8020312a:	00008517          	auipc	a0,0x8
    8020312e:	87e50513          	addi	a0,a0,-1922 # 8020a9a8 <digits+0x628>
    80203132:	ffffd097          	auipc	ra,0xffffd
    80203136:	05a080e7          	jalr	90(ra) # 8020018c <printf>
    8020313a:	a005                	j	8020315a <syscall+0x98>
    printf("pid %d %s: unknown sys call %d\n",
    8020313c:	86ce                	mv	a3,s3
    8020313e:	4e048613          	addi	a2,s1,1248
    80203142:	5c8c                	lw	a1,56(s1)
    80203144:	00008517          	auipc	a0,0x8
    80203148:	87c50513          	addi	a0,a0,-1924 # 8020a9c0 <digits+0x640>
    8020314c:	ffffd097          	auipc	ra,0xffffd
    80203150:	040080e7          	jalr	64(ra) # 8020018c <printf>
    p->trapframe->a0 = -1;
    80203154:	70bc                	ld	a5,96(s1)
    80203156:	577d                	li	a4,-1
    80203158:	fbb8                	sd	a4,112(a5)
}
    8020315a:	70a2                	ld	ra,40(sp)
    8020315c:	7402                	ld	s0,32(sp)
    8020315e:	64e2                	ld	s1,24(sp)
    80203160:	6942                	ld	s2,16(sp)
    80203162:	69a2                	ld	s3,8(sp)
    80203164:	6145                	addi	sp,sp,48
    80203166:	8082                	ret

0000000080203168 <sys_exec>:
#include "include/sbi.h"
extern int exec(char *path, char **argv);

uint64
sys_exec(void)
{
    80203168:	da010113          	addi	sp,sp,-608
    8020316c:	24113c23          	sd	ra,600(sp)
    80203170:	24813823          	sd	s0,592(sp)
    80203174:	24913423          	sd	s1,584(sp)
    80203178:	25213023          	sd	s2,576(sp)
    8020317c:	23313c23          	sd	s3,568(sp)
    80203180:	23413823          	sd	s4,560(sp)
    80203184:	23513423          	sd	s5,552(sp)
    80203188:	23613023          	sd	s6,544(sp)
    8020318c:	1480                	addi	s0,sp,608
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    8020318e:	10400613          	li	a2,260
    80203192:	eb840593          	addi	a1,s0,-328
    80203196:	4501                	li	a0,0
    80203198:	00000097          	auipc	ra,0x0
    8020319c:	efa080e7          	jalr	-262(ra) # 80203092 <argstr>
    return -1;
    802031a0:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    802031a2:	0c054a63          	bltz	a0,80203276 <sys_exec+0x10e>
    802031a6:	db040593          	addi	a1,s0,-592
    802031aa:	4505                	li	a0,1
    802031ac:	00000097          	auipc	ra,0x0
    802031b0:	ec4080e7          	jalr	-316(ra) # 80203070 <argaddr>
    802031b4:	0c054163          	bltz	a0,80203276 <sys_exec+0x10e>
  }
  memset(argv, 0, sizeof(argv));
    802031b8:	10000613          	li	a2,256
    802031bc:	4581                	li	a1,0
    802031be:	db840993          	addi	s3,s0,-584
    802031c2:	854e                	mv	a0,s3
    802031c4:	ffffd097          	auipc	ra,0xffffd
    802031c8:	5a0080e7          	jalr	1440(ra) # 80200764 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    802031cc:	84ce                	mv	s1,s3
  memset(argv, 0, sizeof(argv));
    802031ce:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802031d0:	da840a13          	addi	s4,s0,-600
    if(i >= NELEM(argv)){
    802031d4:	02000a93          	li	s5,32
    802031d8:	00090b1b          	sext.w	s6,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802031dc:	00391513          	slli	a0,s2,0x3
    802031e0:	85d2                	mv	a1,s4
    802031e2:	db043783          	ld	a5,-592(s0)
    802031e6:	953e                	add	a0,a0,a5
    802031e8:	00000097          	auipc	ra,0x0
    802031ec:	da6080e7          	jalr	-602(ra) # 80202f8e <fetchaddr>
    802031f0:	02054a63          	bltz	a0,80203224 <sys_exec+0xbc>
      goto bad;
    }
    if(uarg == 0){
    802031f4:	da843783          	ld	a5,-600(s0)
    802031f8:	c3b9                	beqz	a5,8020323e <sys_exec+0xd6>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    802031fa:	ffffd097          	auipc	ra,0xffffd
    802031fe:	362080e7          	jalr	866(ra) # 8020055c <kalloc>
    80203202:	85aa                	mv	a1,a0
    80203204:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    80203208:	cd11                	beqz	a0,80203224 <sys_exec+0xbc>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    8020320a:	6605                	lui	a2,0x1
    8020320c:	da843503          	ld	a0,-600(s0)
    80203210:	00000097          	auipc	ra,0x0
    80203214:	dce080e7          	jalr	-562(ra) # 80202fde <fetchstr>
    80203218:	00054663          	bltz	a0,80203224 <sys_exec+0xbc>
    if(i >= NELEM(argv)){
    8020321c:	0905                	addi	s2,s2,1
    8020321e:	09a1                	addi	s3,s3,8
    80203220:	fb591ce3          	bne	s2,s5,802031d8 <sys_exec+0x70>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203224:	10048913          	addi	s2,s1,256
    80203228:	6088                	ld	a0,0(s1)
    8020322a:	c529                	beqz	a0,80203274 <sys_exec+0x10c>
    kfree(argv[i]);
    8020322c:	ffffd097          	auipc	ra,0xffffd
    80203230:	218080e7          	jalr	536(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203234:	04a1                	addi	s1,s1,8
    80203236:	ff2499e3          	bne	s1,s2,80203228 <sys_exec+0xc0>
  return -1;
    8020323a:	597d                	li	s2,-1
    8020323c:	a82d                	j	80203276 <sys_exec+0x10e>
      argv[i] = 0;
    8020323e:	0b0e                	slli	s6,s6,0x3
    80203240:	fc040793          	addi	a5,s0,-64
    80203244:	9b3e                	add	s6,s6,a5
    80203246:	de0b3c23          	sd	zero,-520(s6) # df8 <_entry-0x801ff208>
  int ret = exec(path, argv);
    8020324a:	db840593          	addi	a1,s0,-584
    8020324e:	eb840513          	addi	a0,s0,-328
    80203252:	00001097          	auipc	ra,0x1
    80203256:	352080e7          	jalr	850(ra) # 802045a4 <exec>
    8020325a:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020325c:	10048993          	addi	s3,s1,256
    80203260:	6088                	ld	a0,0(s1)
    80203262:	c911                	beqz	a0,80203276 <sys_exec+0x10e>
    kfree(argv[i]);
    80203264:	ffffd097          	auipc	ra,0xffffd
    80203268:	1e0080e7          	jalr	480(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020326c:	04a1                	addi	s1,s1,8
    8020326e:	ff3499e3          	bne	s1,s3,80203260 <sys_exec+0xf8>
    80203272:	a011                	j	80203276 <sys_exec+0x10e>
  return -1;
    80203274:	597d                	li	s2,-1
}
    80203276:	854a                	mv	a0,s2
    80203278:	25813083          	ld	ra,600(sp)
    8020327c:	25013403          	ld	s0,592(sp)
    80203280:	24813483          	ld	s1,584(sp)
    80203284:	24013903          	ld	s2,576(sp)
    80203288:	23813983          	ld	s3,568(sp)
    8020328c:	23013a03          	ld	s4,560(sp)
    80203290:	22813a83          	ld	s5,552(sp)
    80203294:	22013b03          	ld	s6,544(sp)
    80203298:	26010113          	addi	sp,sp,608
    8020329c:	8082                	ret

000000008020329e <sys_exit>:

uint64
sys_exit(void)
{
    8020329e:	1101                	addi	sp,sp,-32
    802032a0:	ec06                	sd	ra,24(sp)
    802032a2:	e822                	sd	s0,16(sp)
    802032a4:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    802032a6:	fec40593          	addi	a1,s0,-20
    802032aa:	4501                	li	a0,0
    802032ac:	00000097          	auipc	ra,0x0
    802032b0:	d62080e7          	jalr	-670(ra) # 8020300e <argint>
    return -1;
    802032b4:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    802032b6:	00054963          	bltz	a0,802032c8 <sys_exit+0x2a>
  exit(n);
    802032ba:	fec42503          	lw	a0,-20(s0)
    802032be:	fffff097          	auipc	ra,0xfffff
    802032c2:	ece080e7          	jalr	-306(ra) # 8020218c <exit>
  return 0;  // not reached
    802032c6:	4781                	li	a5,0
}
    802032c8:	853e                	mv	a0,a5
    802032ca:	60e2                	ld	ra,24(sp)
    802032cc:	6442                	ld	s0,16(sp)
    802032ce:	6105                	addi	sp,sp,32
    802032d0:	8082                	ret

00000000802032d2 <sys_getpid>:

uint64
sys_getpid(void)
{
    802032d2:	1141                	addi	sp,sp,-16
    802032d4:	e406                	sd	ra,8(sp)
    802032d6:	e022                	sd	s0,0(sp)
    802032d8:	0800                	addi	s0,sp,16
  return myproc()->pid;
    802032da:	ffffe097          	auipc	ra,0xffffe
    802032de:	77e080e7          	jalr	1918(ra) # 80201a58 <myproc>
}
    802032e2:	5d08                	lw	a0,56(a0)
    802032e4:	60a2                	ld	ra,8(sp)
    802032e6:	6402                	ld	s0,0(sp)
    802032e8:	0141                	addi	sp,sp,16
    802032ea:	8082                	ret

00000000802032ec <sys_fork>:

uint64
sys_fork(void)
{
    802032ec:	1141                	addi	sp,sp,-16
    802032ee:	e406                	sd	ra,8(sp)
    802032f0:	e022                	sd	s0,0(sp)
    802032f2:	0800                	addi	s0,sp,16
  return fork();
    802032f4:	fffff097          	auipc	ra,0xfffff
    802032f8:	b5e080e7          	jalr	-1186(ra) # 80201e52 <fork>
}
    802032fc:	60a2                	ld	ra,8(sp)
    802032fe:	6402                	ld	s0,0(sp)
    80203300:	0141                	addi	sp,sp,16
    80203302:	8082                	ret

0000000080203304 <sys_wait>:

uint64
sys_wait(void)
{
    80203304:	1101                	addi	sp,sp,-32
    80203306:	ec06                	sd	ra,24(sp)
    80203308:	e822                	sd	s0,16(sp)
    8020330a:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    8020330c:	fe840593          	addi	a1,s0,-24
    80203310:	4501                	li	a0,0
    80203312:	00000097          	auipc	ra,0x0
    80203316:	d5e080e7          	jalr	-674(ra) # 80203070 <argaddr>
    8020331a:	87aa                	mv	a5,a0
    return -1;
    8020331c:	557d                	li	a0,-1
  if(argaddr(0, &p) < 0)
    8020331e:	0007c863          	bltz	a5,8020332e <sys_wait+0x2a>
  return wait(p);
    80203322:	fe843503          	ld	a0,-24(s0)
    80203326:	fffff097          	auipc	ra,0xfffff
    8020332a:	00a080e7          	jalr	10(ra) # 80202330 <wait>
}
    8020332e:	60e2                	ld	ra,24(sp)
    80203330:	6442                	ld	s0,16(sp)
    80203332:	6105                	addi	sp,sp,32
    80203334:	8082                	ret

0000000080203336 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    80203336:	7179                	addi	sp,sp,-48
    80203338:	f406                	sd	ra,40(sp)
    8020333a:	f022                	sd	s0,32(sp)
    8020333c:	ec26                	sd	s1,24(sp)
    8020333e:	1800                	addi	s0,sp,48
  int addr;
  int n;

  if(argint(0, &n) < 0)
    80203340:	fdc40593          	addi	a1,s0,-36
    80203344:	4501                	li	a0,0
    80203346:	00000097          	auipc	ra,0x0
    8020334a:	cc8080e7          	jalr	-824(ra) # 8020300e <argint>
    8020334e:	87aa                	mv	a5,a0
    return -1;
    80203350:	557d                	li	a0,-1
  if(argint(0, &n) < 0)
    80203352:	0207c063          	bltz	a5,80203372 <sys_sbrk+0x3c>
  addr = myproc()->sz;
    80203356:	ffffe097          	auipc	ra,0xffffe
    8020335a:	702080e7          	jalr	1794(ra) # 80201a58 <myproc>
    8020335e:	4524                	lw	s1,72(a0)
  if(growproc(n) < 0)
    80203360:	fdc42503          	lw	a0,-36(s0)
    80203364:	fffff097          	auipc	ra,0xfffff
    80203368:	a76080e7          	jalr	-1418(ra) # 80201dda <growproc>
    8020336c:	00054863          	bltz	a0,8020337c <sys_sbrk+0x46>
    return -1;
  return addr;
    80203370:	8526                	mv	a0,s1
}
    80203372:	70a2                	ld	ra,40(sp)
    80203374:	7402                	ld	s0,32(sp)
    80203376:	64e2                	ld	s1,24(sp)
    80203378:	6145                	addi	sp,sp,48
    8020337a:	8082                	ret
    return -1;
    8020337c:	557d                	li	a0,-1
    8020337e:	bfd5                	j	80203372 <sys_sbrk+0x3c>

0000000080203380 <sys_sleep>:

uint64
sys_sleep(void)
{
    80203380:	7139                	addi	sp,sp,-64
    80203382:	fc06                	sd	ra,56(sp)
    80203384:	f822                	sd	s0,48(sp)
    80203386:	f426                	sd	s1,40(sp)
    80203388:	f04a                	sd	s2,32(sp)
    8020338a:	ec4e                	sd	s3,24(sp)
    8020338c:	0080                	addi	s0,sp,64
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    8020338e:	fcc40593          	addi	a1,s0,-52
    80203392:	4501                	li	a0,0
    80203394:	00000097          	auipc	ra,0x0
    80203398:	c7a080e7          	jalr	-902(ra) # 8020300e <argint>
    return -1;
    8020339c:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    8020339e:	06054763          	bltz	a0,8020340c <sys_sleep+0x8c>
  acquire(&tickslock);
    802033a2:	0000a517          	auipc	a0,0xa
    802033a6:	d4653503          	ld	a0,-698(a0) # 8020d0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    802033aa:	ffffd097          	auipc	ra,0xffffd
    802033ae:	31e080e7          	jalr	798(ra) # 802006c8 <acquire>
  ticks0 = ticks;
    802033b2:	0000a797          	auipc	a5,0xa
    802033b6:	d467b783          	ld	a5,-698(a5) # 8020d0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
    802033ba:	0007a903          	lw	s2,0(a5)
  while(ticks - ticks0 < n){
    802033be:	fcc42783          	lw	a5,-52(s0)
    802033c2:	cf85                	beqz	a5,802033fa <sys_sleep+0x7a>
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
    802033c4:	0000a997          	auipc	s3,0xa
    802033c8:	d249b983          	ld	s3,-732(s3) # 8020d0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    802033cc:	0000a497          	auipc	s1,0xa
    802033d0:	d2c4b483          	ld	s1,-724(s1) # 8020d0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
    if(myproc()->killed){
    802033d4:	ffffe097          	auipc	ra,0xffffe
    802033d8:	684080e7          	jalr	1668(ra) # 80201a58 <myproc>
    802033dc:	591c                	lw	a5,48(a0)
    802033de:	ef9d                	bnez	a5,8020341c <sys_sleep+0x9c>
    sleep(&ticks, &tickslock);
    802033e0:	85ce                	mv	a1,s3
    802033e2:	8526                	mv	a0,s1
    802033e4:	fffff097          	auipc	ra,0xfffff
    802033e8:	ece080e7          	jalr	-306(ra) # 802022b2 <sleep>
  while(ticks - ticks0 < n){
    802033ec:	409c                	lw	a5,0(s1)
    802033ee:	412787bb          	subw	a5,a5,s2
    802033f2:	fcc42703          	lw	a4,-52(s0)
    802033f6:	fce7efe3          	bltu	a5,a4,802033d4 <sys_sleep+0x54>
  }
  release(&tickslock);
    802033fa:	0000a517          	auipc	a0,0xa
    802033fe:	cee53503          	ld	a0,-786(a0) # 8020d0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    80203402:	ffffd097          	auipc	ra,0xffffd
    80203406:	31a080e7          	jalr	794(ra) # 8020071c <release>
  return 0;
    8020340a:	4781                	li	a5,0
}
    8020340c:	853e                	mv	a0,a5
    8020340e:	70e2                	ld	ra,56(sp)
    80203410:	7442                	ld	s0,48(sp)
    80203412:	74a2                	ld	s1,40(sp)
    80203414:	7902                	ld	s2,32(sp)
    80203416:	69e2                	ld	s3,24(sp)
    80203418:	6121                	addi	sp,sp,64
    8020341a:	8082                	ret
      release(&tickslock);
    8020341c:	0000a517          	auipc	a0,0xa
    80203420:	ccc53503          	ld	a0,-820(a0) # 8020d0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    80203424:	ffffd097          	auipc	ra,0xffffd
    80203428:	2f8080e7          	jalr	760(ra) # 8020071c <release>
      return -1;
    8020342c:	57fd                	li	a5,-1
    8020342e:	bff9                	j	8020340c <sys_sleep+0x8c>

0000000080203430 <sys_kill>:

uint64
sys_kill(void)
{
    80203430:	1101                	addi	sp,sp,-32
    80203432:	ec06                	sd	ra,24(sp)
    80203434:	e822                	sd	s0,16(sp)
    80203436:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    80203438:	fec40593          	addi	a1,s0,-20
    8020343c:	4501                	li	a0,0
    8020343e:	00000097          	auipc	ra,0x0
    80203442:	bd0080e7          	jalr	-1072(ra) # 8020300e <argint>
    80203446:	87aa                	mv	a5,a0
    return -1;
    80203448:	557d                	li	a0,-1
  if(argint(0, &pid) < 0)
    8020344a:	0007c863          	bltz	a5,8020345a <sys_kill+0x2a>
  return kill(pid);
    8020344e:	fec42503          	lw	a0,-20(s0)
    80203452:	fffff097          	auipc	ra,0xfffff
    80203456:	04c080e7          	jalr	76(ra) # 8020249e <kill>
}
    8020345a:	60e2                	ld	ra,24(sp)
    8020345c:	6442                	ld	s0,16(sp)
    8020345e:	6105                	addi	sp,sp,32
    80203460:	8082                	ret

0000000080203462 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    80203462:	1101                	addi	sp,sp,-32
    80203464:	ec06                	sd	ra,24(sp)
    80203466:	e822                	sd	s0,16(sp)
    80203468:	e426                	sd	s1,8(sp)
    8020346a:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    8020346c:	0000a517          	auipc	a0,0xa
    80203470:	c7c53503          	ld	a0,-900(a0) # 8020d0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    80203474:	ffffd097          	auipc	ra,0xffffd
    80203478:	254080e7          	jalr	596(ra) # 802006c8 <acquire>
  xticks = ticks;
    8020347c:	0000a797          	auipc	a5,0xa
    80203480:	c7c7b783          	ld	a5,-900(a5) # 8020d0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
    80203484:	4384                	lw	s1,0(a5)
  release(&tickslock);
    80203486:	0000a517          	auipc	a0,0xa
    8020348a:	c6253503          	ld	a0,-926(a0) # 8020d0e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    8020348e:	ffffd097          	auipc	ra,0xffffd
    80203492:	28e080e7          	jalr	654(ra) # 8020071c <release>
  return xticks;
}
    80203496:	02049513          	slli	a0,s1,0x20
    8020349a:	9101                	srli	a0,a0,0x20
    8020349c:	60e2                	ld	ra,24(sp)
    8020349e:	6442                	ld	s0,16(sp)
    802034a0:	64a2                	ld	s1,8(sp)
    802034a2:	6105                	addi	sp,sp,32
    802034a4:	8082                	ret

00000000802034a6 <sys_trace>:
    
uint64
sys_trace(void)
{
    802034a6:	1101                	addi	sp,sp,-32
    802034a8:	ec06                	sd	ra,24(sp)
    802034aa:	e822                	sd	s0,16(sp)
    802034ac:	1000                	addi	s0,sp,32
  int mask;
  if(argint(0, &mask) < 0) {
    802034ae:	fec40593          	addi	a1,s0,-20
    802034b2:	4501                	li	a0,0
    802034b4:	00000097          	auipc	ra,0x0
    802034b8:	b5a080e7          	jalr	-1190(ra) # 8020300e <argint>
    return -1;
    802034bc:	57fd                	li	a5,-1
  if(argint(0, &mask) < 0) {
    802034be:	00054b63          	bltz	a0,802034d4 <sys_trace+0x2e>
  }
  myproc()->tmask = mask;
    802034c2:	ffffe097          	auipc	ra,0xffffe
    802034c6:	596080e7          	jalr	1430(ra) # 80201a58 <myproc>
    802034ca:	fec42783          	lw	a5,-20(s0)
    802034ce:	4ef52823          	sw	a5,1264(a0)
  return 0;
    802034d2:	4781                	li	a5,0
}
    802034d4:	853e                	mv	a0,a5
    802034d6:	60e2                	ld	ra,24(sp)
    802034d8:	6442                	ld	s0,16(sp)
    802034da:	6105                	addi	sp,sp,32
    802034dc:	8082                	ret

00000000802034de <sys_clone>:


// added by lmq for SYS_clone
uint64
sys_clone(void)
{
    802034de:	7179                	addi	sp,sp,-48
    802034e0:	f406                	sd	ra,40(sp)
    802034e2:	f022                	sd	s0,32(sp)
    802034e4:	1800                	addi	s0,sp,48
  int flags,ptid,tls,ctid;
  uint64 stack;
  if(argint(0, &flags) < 0) {
    802034e6:	fec40593          	addi	a1,s0,-20
    802034ea:	4501                	li	a0,0
    802034ec:	00000097          	auipc	ra,0x0
    802034f0:	b22080e7          	jalr	-1246(ra) # 8020300e <argint>
    return -1;
    802034f4:	57fd                	li	a5,-1
  if(argint(0, &flags) < 0) {
    802034f6:	06054163          	bltz	a0,80203558 <sys_clone+0x7a>
  }
  if(argaddr(1, &stack) < 0) {    // 子进程的栈地址
    802034fa:	fd840593          	addi	a1,s0,-40
    802034fe:	4505                	li	a0,1
    80203500:	00000097          	auipc	ra,0x0
    80203504:	b70080e7          	jalr	-1168(ra) # 80203070 <argaddr>
    return -1;
    80203508:	57fd                	li	a5,-1
  if(argaddr(1, &stack) < 0) {    // 子进程的栈地址
    8020350a:	04054763          	bltz	a0,80203558 <sys_clone+0x7a>
  }
  if(argint(2, &ptid) < 0) {
    8020350e:	fe840593          	addi	a1,s0,-24
    80203512:	4509                	li	a0,2
    80203514:	00000097          	auipc	ra,0x0
    80203518:	afa080e7          	jalr	-1286(ra) # 8020300e <argint>
    return -1;
    8020351c:	57fd                	li	a5,-1
  if(argint(2, &ptid) < 0) {
    8020351e:	02054d63          	bltz	a0,80203558 <sys_clone+0x7a>
  }
  if(argint(3, &tls) < 0) {
    80203522:	fe440593          	addi	a1,s0,-28
    80203526:	450d                	li	a0,3
    80203528:	00000097          	auipc	ra,0x0
    8020352c:	ae6080e7          	jalr	-1306(ra) # 8020300e <argint>
    return -1;
    80203530:	57fd                	li	a5,-1
  if(argint(3, &tls) < 0) {
    80203532:	02054363          	bltz	a0,80203558 <sys_clone+0x7a>
  }
  if(argint(4, &ctid) < 0) {
    80203536:	fe040593          	addi	a1,s0,-32
    8020353a:	4511                	li	a0,4
    8020353c:	00000097          	auipc	ra,0x0
    80203540:	ad2080e7          	jalr	-1326(ra) # 8020300e <argint>
    80203544:	02054d63          	bltz	a0,8020357e <sys_clone+0xa0>
    return -1;
  }
  if(stack==0)
    80203548:	fd843583          	ld	a1,-40(s0)
    8020354c:	e999                	bnez	a1,80203562 <sys_clone+0x84>
  {
    return fork();
    8020354e:	fffff097          	auipc	ra,0xfffff
    80203552:	904080e7          	jalr	-1788(ra) # 80201e52 <fork>
    80203556:	87aa                	mv	a5,a0
  }
  else
    return clone(flags,stack,ptid,tls,ctid);
}
    80203558:	853e                	mv	a0,a5
    8020355a:	70a2                	ld	ra,40(sp)
    8020355c:	7402                	ld	s0,32(sp)
    8020355e:	6145                	addi	sp,sp,48
    80203560:	8082                	ret
    return clone(flags,stack,ptid,tls,ctid);
    80203562:	fe042703          	lw	a4,-32(s0)
    80203566:	fe442683          	lw	a3,-28(s0)
    8020356a:	fe842603          	lw	a2,-24(s0)
    8020356e:	fec42503          	lw	a0,-20(s0)
    80203572:	fffff097          	auipc	ra,0xfffff
    80203576:	0ea080e7          	jalr	234(ra) # 8020265c <clone>
    8020357a:	87aa                	mv	a5,a0
    8020357c:	bff1                	j	80203558 <sys_clone+0x7a>
    return -1;
    8020357e:	57fd                	li	a5,-1
    80203580:	bfe1                	j	80203558 <sys_clone+0x7a>

0000000080203582 <sys_brk>:

// sys_brk lzq
// 将数据段addr 修改为 pos ， 成功则返回0
// Linux brk(0) return 0, but different in this work this will return the now addr
uint64
sys_brk(void){
    80203582:	1101                	addi	sp,sp,-32
    80203584:	ec06                	sd	ra,24(sp)
    80203586:	e822                	sd	s0,16(sp)
    80203588:	1000                	addi	s0,sp,32
    int addr, pos;
    if(argint(0, &pos) <0 )
    8020358a:	fec40593          	addi	a1,s0,-20
    8020358e:	4501                	li	a0,0
    80203590:	00000097          	auipc	ra,0x0
    80203594:	a7e080e7          	jalr	-1410(ra) # 8020300e <argint>
    80203598:	04054063          	bltz	a0,802035d8 <sys_brk+0x56>
        return -1;
    addr = myproc()->sz;
    8020359c:	ffffe097          	auipc	ra,0xffffe
    802035a0:	4bc080e7          	jalr	1212(ra) # 80201a58 <myproc>
    802035a4:	4528                	lw	a0,72(a0)
    if(pos == 0) return addr;//the diff with Linux brk(0)
    802035a6:	fec42783          	lw	a5,-20(s0)
    802035aa:	e789                	bnez	a5,802035b4 <sys_brk+0x32>
    if(growproc(pos - addr) < 0)
        panic("growproc error");
    return 0;
}
    802035ac:	60e2                	ld	ra,24(sp)
    802035ae:	6442                	ld	s0,16(sp)
    802035b0:	6105                	addi	sp,sp,32
    802035b2:	8082                	ret
    if(growproc(pos - addr) < 0)
    802035b4:	40a7853b          	subw	a0,a5,a0
    802035b8:	fffff097          	auipc	ra,0xfffff
    802035bc:	822080e7          	jalr	-2014(ra) # 80201dda <growproc>
    802035c0:	87aa                	mv	a5,a0
    return 0;
    802035c2:	4501                	li	a0,0
    if(growproc(pos - addr) < 0)
    802035c4:	fe07d4e3          	bgez	a5,802035ac <sys_brk+0x2a>
        panic("growproc error");
    802035c8:	00007517          	auipc	a0,0x7
    802035cc:	5d850513          	addi	a0,a0,1496 # 8020aba0 <digits+0x820>
    802035d0:	ffffd097          	auipc	ra,0xffffd
    802035d4:	b72080e7          	jalr	-1166(ra) # 80200142 <panic>
        return -1;
    802035d8:	557d                	li	a0,-1
    802035da:	bfc9                	j	802035ac <sys_brk+0x2a>

00000000802035dc <sys_mmap>:

uint64
sys_mmap(void){
    802035dc:	1141                	addi	sp,sp,-16
    802035de:	e422                	sd	s0,8(sp)
    802035e0:	0800                	addi	s0,sp,16
    if (mappages(myproc()->pagetable, len, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0) {
        kfree(mem);
        return 0;
    }
    return addr;
}
    802035e2:	4501                	li	a0,0
    802035e4:	6422                	ld	s0,8(sp)
    802035e6:	0141                	addi	sp,sp,16
    802035e8:	8082                	ret

00000000802035ea <sys_wait4>:


// added by lmq for SYS_wait4
uint64
sys_wait4(void)
{
    802035ea:	1101                	addi	sp,sp,-32
    802035ec:	ec06                	sd	ra,24(sp)
    802035ee:	e822                	sd	s0,16(sp)
    802035f0:	1000                	addi	s0,sp,32
  int cpid;             // child pid which current pid is waiting for
  uint64 addr;          // addr of wstatus
  argint(0,&cpid);
    802035f2:	fec40593          	addi	a1,s0,-20
    802035f6:	4501                	li	a0,0
    802035f8:	00000097          	auipc	ra,0x0
    802035fc:	a16080e7          	jalr	-1514(ra) # 8020300e <argint>
  argaddr(1, &addr);
    80203600:	fe040593          	addi	a1,s0,-32
    80203604:	4505                	li	a0,1
    80203606:	00000097          	auipc	ra,0x0
    8020360a:	a6a080e7          	jalr	-1430(ra) # 80203070 <argaddr>
  return waitpid(cpid,addr,0);
    8020360e:	4601                	li	a2,0
    80203610:	fe043583          	ld	a1,-32(s0)
    80203614:	fec42503          	lw	a0,-20(s0)
    80203618:	fffff097          	auipc	ra,0xfffff
    8020361c:	164080e7          	jalr	356(ra) # 8020277c <waitpid>
}
    80203620:	60e2                	ld	ra,24(sp)
    80203622:	6442                	ld	s0,16(sp)
    80203624:	6105                	addi	sp,sp,32
    80203626:	8082                	ret

0000000080203628 <sys_sched_yield>:

// added by lmq for SYS_sched_yield
uint64
sys_sched_yield(void)
{
    80203628:	1141                	addi	sp,sp,-16
    8020362a:	e406                	sd	ra,8(sp)
    8020362c:	e022                	sd	s0,0(sp)
    8020362e:	0800                	addi	s0,sp,16
  yield();
    80203630:	fffff097          	auipc	ra,0xfffff
    80203634:	c46080e7          	jalr	-954(ra) # 80202276 <yield>
  return 0;
}
    80203638:	4501                	li	a0,0
    8020363a:	60a2                	ld	ra,8(sp)
    8020363c:	6402                	ld	s0,0(sp)
    8020363e:	0141                	addi	sp,sp,16
    80203640:	8082                	ret

0000000080203642 <sys_getppid>:

// added by lmq for SYS_getppid
uint64 
sys_getppid(void)
{
    80203642:	1141                	addi	sp,sp,-16
    80203644:	e406                	sd	ra,8(sp)
    80203646:	e022                	sd	s0,0(sp)
    80203648:	0800                	addi	s0,sp,16
  return myproc()->parent->pid;
    8020364a:	ffffe097          	auipc	ra,0xffffe
    8020364e:	40e080e7          	jalr	1038(ra) # 80201a58 <myproc>
    80203652:	711c                	ld	a5,32(a0)
}
    80203654:	5f88                	lw	a0,56(a5)
    80203656:	60a2                	ld	ra,8(sp)
    80203658:	6402                	ld	s0,0(sp)
    8020365a:	0141                	addi	sp,sp,16
    8020365c:	8082                	ret

000000008020365e <sys_execve>:

// added by lmq for SYS_execve
uint64
sys_execve(void)
{
    8020365e:	da010113          	addi	sp,sp,-608
    80203662:	24113c23          	sd	ra,600(sp)
    80203666:	24813823          	sd	s0,592(sp)
    8020366a:	24913423          	sd	s1,584(sp)
    8020366e:	25213023          	sd	s2,576(sp)
    80203672:	23313c23          	sd	s3,568(sp)
    80203676:	23413823          	sd	s4,560(sp)
    8020367a:	23513423          	sd	s5,552(sp)
    8020367e:	23613023          	sd	s6,544(sp)
    80203682:	1480                	addi	s0,sp,608
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    80203684:	10400613          	li	a2,260
    80203688:	eb840593          	addi	a1,s0,-328
    8020368c:	4501                	li	a0,0
    8020368e:	00000097          	auipc	ra,0x0
    80203692:	a04080e7          	jalr	-1532(ra) # 80203092 <argstr>
    return -1;
    80203696:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    80203698:	0c054a63          	bltz	a0,8020376c <sys_execve+0x10e>
    8020369c:	db040593          	addi	a1,s0,-592
    802036a0:	4505                	li	a0,1
    802036a2:	00000097          	auipc	ra,0x0
    802036a6:	9ce080e7          	jalr	-1586(ra) # 80203070 <argaddr>
    802036aa:	0c054163          	bltz	a0,8020376c <sys_execve+0x10e>
  }
  memset(argv, 0, sizeof(argv));
    802036ae:	10000613          	li	a2,256
    802036b2:	4581                	li	a1,0
    802036b4:	db840993          	addi	s3,s0,-584
    802036b8:	854e                	mv	a0,s3
    802036ba:	ffffd097          	auipc	ra,0xffffd
    802036be:	0aa080e7          	jalr	170(ra) # 80200764 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    802036c2:	84ce                	mv	s1,s3
  memset(argv, 0, sizeof(argv));
    802036c4:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802036c6:	da840a13          	addi	s4,s0,-600
    if(i >= NELEM(argv)){
    802036ca:	02000a93          	li	s5,32
    802036ce:	00090b1b          	sext.w	s6,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    802036d2:	00391513          	slli	a0,s2,0x3
    802036d6:	85d2                	mv	a1,s4
    802036d8:	db043783          	ld	a5,-592(s0)
    802036dc:	953e                	add	a0,a0,a5
    802036de:	00000097          	auipc	ra,0x0
    802036e2:	8b0080e7          	jalr	-1872(ra) # 80202f8e <fetchaddr>
    802036e6:	02054a63          	bltz	a0,8020371a <sys_execve+0xbc>
      goto bad;
    }
    if(uarg == 0){
    802036ea:	da843783          	ld	a5,-600(s0)
    802036ee:	c3b9                	beqz	a5,80203734 <sys_execve+0xd6>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    802036f0:	ffffd097          	auipc	ra,0xffffd
    802036f4:	e6c080e7          	jalr	-404(ra) # 8020055c <kalloc>
    802036f8:	85aa                	mv	a1,a0
    802036fa:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    802036fe:	cd11                	beqz	a0,8020371a <sys_execve+0xbc>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80203700:	6605                	lui	a2,0x1
    80203702:	da843503          	ld	a0,-600(s0)
    80203706:	00000097          	auipc	ra,0x0
    8020370a:	8d8080e7          	jalr	-1832(ra) # 80202fde <fetchstr>
    8020370e:	00054663          	bltz	a0,8020371a <sys_execve+0xbc>
    if(i >= NELEM(argv)){
    80203712:	0905                	addi	s2,s2,1
    80203714:	09a1                	addi	s3,s3,8
    80203716:	fb591ce3          	bne	s2,s5,802036ce <sys_execve+0x70>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020371a:	10048913          	addi	s2,s1,256
    8020371e:	6088                	ld	a0,0(s1)
    80203720:	c529                	beqz	a0,8020376a <sys_execve+0x10c>
    kfree(argv[i]);
    80203722:	ffffd097          	auipc	ra,0xffffd
    80203726:	d22080e7          	jalr	-734(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020372a:	04a1                	addi	s1,s1,8
    8020372c:	ff2499e3          	bne	s1,s2,8020371e <sys_execve+0xc0>
  return -1;
    80203730:	597d                	li	s2,-1
    80203732:	a82d                	j	8020376c <sys_execve+0x10e>
      argv[i] = 0;
    80203734:	0b0e                	slli	s6,s6,0x3
    80203736:	fc040793          	addi	a5,s0,-64
    8020373a:	9b3e                	add	s6,s6,a5
    8020373c:	de0b3c23          	sd	zero,-520(s6)
  int ret = exec(path, argv);
    80203740:	db840593          	addi	a1,s0,-584
    80203744:	eb840513          	addi	a0,s0,-328
    80203748:	00001097          	auipc	ra,0x1
    8020374c:	e5c080e7          	jalr	-420(ra) # 802045a4 <exec>
    80203750:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203752:	10048993          	addi	s3,s1,256
    80203756:	6088                	ld	a0,0(s1)
    80203758:	c911                	beqz	a0,8020376c <sys_execve+0x10e>
    kfree(argv[i]);
    8020375a:	ffffd097          	auipc	ra,0xffffd
    8020375e:	cea080e7          	jalr	-790(ra) # 80200444 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203762:	04a1                	addi	s1,s1,8
    80203764:	ff3499e3          	bne	s1,s3,80203756 <sys_execve+0xf8>
    80203768:	a011                	j	8020376c <sys_execve+0x10e>
  return -1;
    8020376a:	597d                	li	s2,-1

}
    8020376c:	854a                	mv	a0,s2
    8020376e:	25813083          	ld	ra,600(sp)
    80203772:	25013403          	ld	s0,592(sp)
    80203776:	24813483          	ld	s1,584(sp)
    8020377a:	24013903          	ld	s2,576(sp)
    8020377e:	23813983          	ld	s3,568(sp)
    80203782:	23013a03          	ld	s4,560(sp)
    80203786:	22813a83          	ld	s5,552(sp)
    8020378a:	22013b03          	ld	s6,544(sp)
    8020378e:	26010113          	addi	sp,sp,608
    80203792:	8082                	ret

0000000080203794 <sys_shutdown>:

uint64 
sys_shutdown(){
    80203794:	1141                	addi	sp,sp,-16
    80203796:	e422                	sd	s0,8(sp)
    80203798:	0800                	addi	s0,sp,16
	SBI_CALL_0(SBI_SHUTDOWN);
    8020379a:	4501                	li	a0,0
    8020379c:	4581                	li	a1,0
    8020379e:	4601                	li	a2,0
    802037a0:	4681                	li	a3,0
    802037a2:	48a1                	li	a7,8
    802037a4:	00000073          	ecall
    sbi_shutdown();
    return 0;
}
    802037a8:	4501                	li	a0,0
    802037aa:	6422                	ld	s0,8(sp)
    802037ac:	0141                	addi	sp,sp,16
    802037ae:	8082                	ret

00000000802037b0 <sys_times>:
	long tms_cstime; 
};


uint64 
sys_times(void) {
    802037b0:	1101                	addi	sp,sp,-32
    802037b2:	ec06                	sd	ra,24(sp)
    802037b4:	e822                	sd	s0,16(sp)
    802037b6:	1000                	addi	s0,sp,32
  struct tms *tmsbuf; // 用于存储时间数据的结构体指针

  if (argaddr(0, (void*)&tmsbuf) < 0)
    802037b8:	fe840593          	addi	a1,s0,-24
    802037bc:	4501                	li	a0,0
    802037be:	00000097          	auipc	ra,0x0
    802037c2:	8b2080e7          	jalr	-1870(ra) # 80203070 <argaddr>
    802037c6:	02054963          	bltz	a0,802037f8 <sys_times+0x48>
      return -1; // 验证用户传递的结构体指针是否有效

  // 获取当前进程的运行时间数据，并填充到tmsbuf指向的结构体中
  tmsbuf->tms_utime = ticks; // 用户态CPU时间
    802037ca:	0000a717          	auipc	a4,0xa
    802037ce:	92e73703          	ld	a4,-1746(a4) # 8020d0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
    802037d2:	00076683          	lwu	a3,0(a4)
    802037d6:	fe843783          	ld	a5,-24(s0)
    802037da:	e394                	sd	a3,0(a5)
  tmsbuf->tms_stime = 0; // 在xv6中无法直接获取系统态CPU时间
    802037dc:	fe843783          	ld	a5,-24(s0)
    802037e0:	0007b423          	sd	zero,8(a5)
  tmsbuf->tms_cutime = 0; // 在xv6中无法直接获取子进程的用户态CPU时间
    802037e4:	0007b823          	sd	zero,16(a5)
  tmsbuf->tms_cstime = 0; // 在xv6中无法直接获取子进程的系统态CPU时间
    802037e8:	0007bc23          	sd	zero,24(a5)

  return ticks; // 成功返回已经过去的滴答数
    802037ec:	00076503          	lwu	a0,0(a4)
}
    802037f0:	60e2                	ld	ra,24(sp)
    802037f2:	6442                	ld	s0,16(sp)
    802037f4:	6105                	addi	sp,sp,32
    802037f6:	8082                	ret
      return -1; // 验证用户传递的结构体指针是否有效
    802037f8:	557d                	li	a0,-1
    802037fa:	bfdd                	j	802037f0 <sys_times+0x40>

00000000802037fc <sys_uname>:
	char domainname[65];
};

uint64
sys_uname(void)
{
    802037fc:	1101                	addi	sp,sp,-32
    802037fe:	ec06                	sd	ra,24(sp)
    80203800:	e822                	sd	s0,16(sp)
    80203802:	1000                	addi	s0,sp,32
    struct utsname *buf; // 用于存储系统信息的结构体指针

    if (argaddr(0, (void*)&buf) < 0)
    80203804:	fe840593          	addi	a1,s0,-24
    80203808:	4501                	li	a0,0
    8020380a:	00000097          	auipc	ra,0x0
    8020380e:	866080e7          	jalr	-1946(ra) # 80203070 <argaddr>
        return -1; // 验证用户传递的结构体指针是否有效
    80203812:	57fd                	li	a5,-1
    if (argaddr(0, (void*)&buf) < 0)
    80203814:	08054763          	bltz	a0,802038a2 <sys_uname+0xa6>

    // 填充系统信息到buf指向的结构体中
    strncpy(buf->sysname, "HUSTLWL", sizeof(buf->sysname)); // 操作系统名称
    80203818:	04100613          	li	a2,65
    8020381c:	00007597          	auipc	a1,0x7
    80203820:	39458593          	addi	a1,a1,916 # 8020abb0 <digits+0x830>
    80203824:	fe843503          	ld	a0,-24(s0)
    80203828:	ffffd097          	auipc	ra,0xffffd
    8020382c:	054080e7          	jalr	84(ra) # 8020087c <strncpy>
    strncpy(buf->nodename, "LWL-host", sizeof(buf->nodename));  // 主机名
    80203830:	04100613          	li	a2,65
    80203834:	00007597          	auipc	a1,0x7
    80203838:	38458593          	addi	a1,a1,900 # 8020abb8 <digits+0x838>
    8020383c:	fe843503          	ld	a0,-24(s0)
    80203840:	04150513          	addi	a0,a0,65
    80203844:	ffffd097          	auipc	ra,0xffffd
    80203848:	038080e7          	jalr	56(ra) # 8020087c <strncpy>
    strncpy(buf->release, "LWL--FirstVersion", sizeof(buf->release)); // 操作系统版本
    8020384c:	04100613          	li	a2,65
    80203850:	00007597          	auipc	a1,0x7
    80203854:	37858593          	addi	a1,a1,888 # 8020abc8 <digits+0x848>
    80203858:	fe843503          	ld	a0,-24(s0)
    8020385c:	08250513          	addi	a0,a0,130
    80203860:	ffffd097          	auipc	ra,0xffffd
    80203864:	01c080e7          	jalr	28(ra) # 8020087c <strncpy>
    strncpy(buf->version, "0.1", sizeof(buf->version)); // 操作系统版本号
    80203868:	04100613          	li	a2,65
    8020386c:	00007597          	auipc	a1,0x7
    80203870:	37458593          	addi	a1,a1,884 # 8020abe0 <digits+0x860>
    80203874:	fe843503          	ld	a0,-24(s0)
    80203878:	0c350513          	addi	a0,a0,195
    8020387c:	ffffd097          	auipc	ra,0xffffd
    80203880:	000080e7          	jalr	ra # 8020087c <strncpy>
    strncpy(buf->machine, "x86-64", sizeof(buf->machine)); // 硬件架构
    80203884:	04100613          	li	a2,65
    80203888:	00007597          	auipc	a1,0x7
    8020388c:	36058593          	addi	a1,a1,864 # 8020abe8 <digits+0x868>
    80203890:	fe843503          	ld	a0,-24(s0)
    80203894:	10450513          	addi	a0,a0,260
    80203898:	ffffd097          	auipc	ra,0xffffd
    8020389c:	fe4080e7          	jalr	-28(ra) # 8020087c <strncpy>

    return 0; // 返回成功
    802038a0:	4781                	li	a5,0
}
    802038a2:	853e                	mv	a0,a5
    802038a4:	60e2                	ld	ra,24(sp)
    802038a6:	6442                	ld	s0,16(sp)
    802038a8:	6105                	addi	sp,sp,32
    802038aa:	8082                	ret

00000000802038ac <sys_gettimeofday>:
    long tv_nsec;  // 纳秒部分
};

uint64
sys_gettimeofday(void)
{
    802038ac:	7179                	addi	sp,sp,-48
    802038ae:	f406                	sd	ra,40(sp)
    802038b0:	f022                	sd	s0,32(sp)
    802038b2:	1800                	addi	s0,sp,48
    struct timespec now_ts; // 用于存储时间值的结构体指针
    uint64 ts_addr;
    if (argaddr(0, (void*)&ts_addr) < 0)
    802038b4:	fd840593          	addi	a1,s0,-40
    802038b8:	4501                	li	a0,0
    802038ba:	fffff097          	auipc	ra,0xfffff
    802038be:	7b6080e7          	jalr	1974(ra) # 80203070 <argaddr>
    802038c2:	87aa                	mv	a5,a0
        return -1; // 验证用户传递的结构体指针是否有效
    802038c4:	557d                	li	a0,-1
    if (argaddr(0, (void*)&ts_addr) < 0)
    802038c6:	0407c563          	bltz	a5,80203910 <sys_gettimeofday+0x64>

    // 获取当前时间，使用ticks转换为秒和纳秒部分
    uint tick = ticks;
    802038ca:	0000a797          	auipc	a5,0xa
    802038ce:	82e7b783          	ld	a5,-2002(a5) # 8020d0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
    802038d2:	439c                	lw	a5,0(a5)
    now_ts.tv_sec = tick / 100; // 每个滴答100个时钟周期，换算为秒
    802038d4:	06400693          	li	a3,100
    802038d8:	02d7d73b          	divuw	a4,a5,a3
    802038dc:	1702                	slli	a4,a4,0x20
    802038de:	9301                	srli	a4,a4,0x20
    802038e0:	fee43023          	sd	a4,-32(s0)
    now_ts.tv_nsec = (tick % 100) * (1000000000 / 100); // 换算为纳秒
    802038e4:	02d7f7bb          	remuw	a5,a5,a3
    802038e8:	00989737          	lui	a4,0x989
    802038ec:	6807071b          	addiw	a4,a4,1664
    802038f0:	02e787bb          	mulw	a5,a5,a4
    802038f4:	1782                	slli	a5,a5,0x20
    802038f6:	9381                	srli	a5,a5,0x20
    802038f8:	fef43423          	sd	a5,-24(s0)
    if(copyout2(ts_addr,(char*)&now_ts,sizeof(struct timespec)) < 0)
    802038fc:	4641                	li	a2,16
    802038fe:	fe040593          	addi	a1,s0,-32
    80203902:	fd843503          	ld	a0,-40(s0)
    80203906:	ffffe097          	auipc	ra,0xffffe
    8020390a:	a76080e7          	jalr	-1418(ra) # 8020137c <copyout2>
    8020390e:	957d                	srai	a0,a0,0x3f
        return -1; // 将时间值拷贝到用户空间
    return 0; // 返回成功
}
    80203910:	70a2                	ld	ra,40(sp)
    80203912:	7402                	ld	s0,32(sp)
    80203914:	6145                	addi	sp,sp,48
    80203916:	8082                	ret

0000000080203918 <sys_nanosleep>:

// added by wyx for SYS_nanosleep
uint64
sys_nanosleep(void)
{
    80203918:	7179                	addi	sp,sp,-48
    8020391a:	f406                	sd	ra,40(sp)
    8020391c:	f022                	sd	s0,32(sp)
    8020391e:	ec26                	sd	s1,24(sp)
    80203920:	e84a                	sd	s2,16(sp)
    80203922:	1800                	addi	s0,sp,48
    struct timespec *req; // 用于指定休眠时间的结构体指针
    struct timespec *rem; // 用于返回剩余休眠时间的结构体指针

    if (argaddr(0, (void*)&req) < 0 ||
    80203924:	fd840593          	addi	a1,s0,-40
    80203928:	4501                	li	a0,0
    8020392a:	fffff097          	auipc	ra,0xfffff
    8020392e:	746080e7          	jalr	1862(ra) # 80203070 <argaddr>
        argaddr(1, (void*)&rem) < 0)
        return -1; // 验证用户传递的结构体指针是否有效
    80203932:	57fd                	li	a5,-1
    if (argaddr(0, (void*)&req) < 0 ||
    80203934:	06054763          	bltz	a0,802039a2 <sys_nanosleep+0x8a>
        argaddr(1, (void*)&rem) < 0)
    80203938:	fd040593          	addi	a1,s0,-48
    8020393c:	4505                	li	a0,1
    8020393e:	fffff097          	auipc	ra,0xfffff
    80203942:	732080e7          	jalr	1842(ra) # 80203070 <argaddr>
    if (argaddr(0, (void*)&req) < 0 ||
    80203946:	06054563          	bltz	a0,802039b0 <sys_nanosleep+0x98>

    // 获取休眠时间
    uint sleep_sec = req->tv_sec;
    8020394a:	fd843783          	ld	a5,-40(s0)

    // 计算总的休眠时间（以ticks为单位）
    uint sleep_ticks = sleep_sec * 100 + sleep_nsec / (1000000000 / 100);

    // 获取当前ticks
    uint start_ticks = ticks;
    8020394e:	00009717          	auipc	a4,0x9
    80203952:	7aa73703          	ld	a4,1962(a4) # 8020d0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
    80203956:	4314                	lw	a3,0(a4)
    uint sleep_sec = req->tv_sec;
    80203958:	6398                	ld	a4,0(a5)
    uint sleep_ticks = sleep_sec * 100 + sleep_nsec / (1000000000 / 100);
    8020395a:	06400493          	li	s1,100
    8020395e:	02e484bb          	mulw	s1,s1,a4
    uint sleep_nsec = req->tv_nsec;
    80203962:	679c                	ld	a5,8(a5)
    uint sleep_ticks = sleep_sec * 100 + sleep_nsec / (1000000000 / 100);
    80203964:	00989737          	lui	a4,0x989
    80203968:	6807071b          	addiw	a4,a4,1664
    8020396c:	02e7d7bb          	divuw	a5,a5,a4
    80203970:	9cbd                	addw	s1,s1,a5
    uint end_ticks = start_ticks + sleep_ticks;
    80203972:	9cb5                	addw	s1,s1,a3

    // 执行休眠
    while (ticks < end_ticks)
    80203974:	0096fe63          	bgeu	a3,s1,80203990 <sys_nanosleep+0x78>
    80203978:	00009917          	auipc	s2,0x9
    8020397c:	78093903          	ld	s2,1920(s2) # 8020d0f8 <_GLOBAL_OFFSET_TABLE_+0x48>
        yield();
    80203980:	fffff097          	auipc	ra,0xfffff
    80203984:	8f6080e7          	jalr	-1802(ra) # 80202276 <yield>
    while (ticks < end_ticks)
    80203988:	00092783          	lw	a5,0(s2)
    8020398c:	fe97eae3          	bltu	a5,s1,80203980 <sys_nanosleep+0x68>

    // 返回剩余休眠时间（置为0，因为xv6没有提供返回剩余时间的功能）
    rem->tv_sec = 0;
    80203990:	fd043783          	ld	a5,-48(s0)
    80203994:	0007b023          	sd	zero,0(a5)
    rem->tv_nsec = 0;
    80203998:	fd043783          	ld	a5,-48(s0)
    8020399c:	0007b423          	sd	zero,8(a5)

    return 0; // 返回成功
    802039a0:	4781                	li	a5,0
}
    802039a2:	853e                	mv	a0,a5
    802039a4:	70a2                	ld	ra,40(sp)
    802039a6:	7402                	ld	s0,32(sp)
    802039a8:	64e2                	ld	s1,24(sp)
    802039aa:	6942                	ld	s2,16(sp)
    802039ac:	6145                	addi	sp,sp,48
    802039ae:	8082                	ret
        return -1; // 验证用户传递的结构体指针是否有效
    802039b0:	57fd                	li	a5,-1
    802039b2:	bfc5                	j	802039a2 <sys_nanosleep+0x8a>

00000000802039b4 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    802039b4:	7139                	addi	sp,sp,-64
    802039b6:	fc06                	sd	ra,56(sp)
    802039b8:	f822                	sd	s0,48(sp)
    802039ba:	f426                	sd	s1,40(sp)
    802039bc:	f04a                	sd	s2,32(sp)
    802039be:	ec4e                	sd	s3,24(sp)
    802039c0:	e852                	sd	s4,16(sp)
    802039c2:	e456                	sd	s5,8(sp)
    802039c4:	0080                	addi	s0,sp,64
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    802039c6:	00007597          	auipc	a1,0x7
    802039ca:	22a58593          	addi	a1,a1,554 # 8020abf0 <digits+0x870>
    802039ce:	00022517          	auipc	a0,0x22
    802039d2:	02250513          	addi	a0,a0,34 # 802259f0 <bcache>
    802039d6:	ffffd097          	auipc	ra,0xffffd
    802039da:	cae080e7          	jalr	-850(ra) # 80200684 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    802039de:	00026797          	auipc	a5,0x26
    802039e2:	01278793          	addi	a5,a5,18 # 802299f0 <bcache+0x4000>
    802039e6:	00026717          	auipc	a4,0x26
    802039ea:	67270713          	addi	a4,a4,1650 # 8022a058 <bcache+0x4668>
    802039ee:	6ae7b823          	sd	a4,1712(a5)
  bcache.head.next = &bcache.head;
    802039f2:	6ae7bc23          	sd	a4,1720(a5)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    802039f6:	00022497          	auipc	s1,0x22
    802039fa:	01248493          	addi	s1,s1,18 # 80225a08 <bcache+0x18>
    b->refcnt = 0;
    b->sectorno = ~0;
    802039fe:	5a7d                	li	s4,-1
    b->dev = ~0;
    b->next = bcache.head.next;
    80203a00:	893e                	mv	s2,a5
    b->prev = &bcache.head;
    80203a02:	89ba                	mv	s3,a4
    initsleeplock(&b->lock, "buffer");
    80203a04:	00007a97          	auipc	s5,0x7
    80203a08:	1f4a8a93          	addi	s5,s5,500 # 8020abf8 <digits+0x878>
    b->refcnt = 0;
    80203a0c:	0404a023          	sw	zero,64(s1)
    b->sectorno = ~0;
    80203a10:	0144a623          	sw	s4,12(s1)
    b->dev = ~0;
    80203a14:	0144a423          	sw	s4,8(s1)
    b->next = bcache.head.next;
    80203a18:	6b893783          	ld	a5,1720(s2)
    80203a1c:	e8bc                	sd	a5,80(s1)
    b->prev = &bcache.head;
    80203a1e:	0534b423          	sd	s3,72(s1)
    initsleeplock(&b->lock, "buffer");
    80203a22:	85d6                	mv	a1,s5
    80203a24:	01048513          	addi	a0,s1,16
    80203a28:	00000097          	auipc	ra,0x0
    80203a2c:	26e080e7          	jalr	622(ra) # 80203c96 <initsleeplock>
    bcache.head.next->prev = b;
    80203a30:	6b893783          	ld	a5,1720(s2)
    80203a34:	e7a4                	sd	s1,72(a5)
    bcache.head.next = b;
    80203a36:	6a993c23          	sd	s1,1720(s2)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80203a3a:	25848493          	addi	s1,s1,600
    80203a3e:	fd3497e3          	bne	s1,s3,80203a0c <binit+0x58>
  }
  #ifdef DEBUG
  printf("binit\n");
  #endif
}
    80203a42:	70e2                	ld	ra,56(sp)
    80203a44:	7442                	ld	s0,48(sp)
    80203a46:	74a2                	ld	s1,40(sp)
    80203a48:	7902                	ld	s2,32(sp)
    80203a4a:	69e2                	ld	s3,24(sp)
    80203a4c:	6a42                	ld	s4,16(sp)
    80203a4e:	6aa2                	ld	s5,8(sp)
    80203a50:	6121                	addi	sp,sp,64
    80203a52:	8082                	ret

0000000080203a54 <bread>:
  panic("bget: no buffers");
}

// Return a locked buf with the contents of the indicated block.
struct buf* 
bread(uint dev, uint sectorno) {
    80203a54:	7179                	addi	sp,sp,-48
    80203a56:	f406                	sd	ra,40(sp)
    80203a58:	f022                	sd	s0,32(sp)
    80203a5a:	ec26                	sd	s1,24(sp)
    80203a5c:	e84a                	sd	s2,16(sp)
    80203a5e:	e44e                	sd	s3,8(sp)
    80203a60:	1800                	addi	s0,sp,48
    80203a62:	89aa                	mv	s3,a0
    80203a64:	892e                	mv	s2,a1
  acquire(&bcache.lock);
    80203a66:	00022517          	auipc	a0,0x22
    80203a6a:	f8a50513          	addi	a0,a0,-118 # 802259f0 <bcache>
    80203a6e:	ffffd097          	auipc	ra,0xffffd
    80203a72:	c5a080e7          	jalr	-934(ra) # 802006c8 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80203a76:	00026497          	auipc	s1,0x26
    80203a7a:	6324b483          	ld	s1,1586(s1) # 8022a0a8 <bcache+0x46b8>
    80203a7e:	00026797          	auipc	a5,0x26
    80203a82:	5da78793          	addi	a5,a5,1498 # 8022a058 <bcache+0x4668>
    80203a86:	02f48f63          	beq	s1,a5,80203ac4 <bread+0x70>
    80203a8a:	873e                	mv	a4,a5
    80203a8c:	a021                	j	80203a94 <bread+0x40>
    80203a8e:	68a4                	ld	s1,80(s1)
    80203a90:	02e48a63          	beq	s1,a4,80203ac4 <bread+0x70>
    if(b->dev == dev && b->sectorno == sectorno){
    80203a94:	449c                	lw	a5,8(s1)
    80203a96:	ff379ce3          	bne	a5,s3,80203a8e <bread+0x3a>
    80203a9a:	44dc                	lw	a5,12(s1)
    80203a9c:	ff2799e3          	bne	a5,s2,80203a8e <bread+0x3a>
      b->refcnt++;
    80203aa0:	40bc                	lw	a5,64(s1)
    80203aa2:	2785                	addiw	a5,a5,1
    80203aa4:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    80203aa6:	00022517          	auipc	a0,0x22
    80203aaa:	f4a50513          	addi	a0,a0,-182 # 802259f0 <bcache>
    80203aae:	ffffd097          	auipc	ra,0xffffd
    80203ab2:	c6e080e7          	jalr	-914(ra) # 8020071c <release>
      acquiresleep(&b->lock);
    80203ab6:	01048513          	addi	a0,s1,16
    80203aba:	00000097          	auipc	ra,0x0
    80203abe:	216080e7          	jalr	534(ra) # 80203cd0 <acquiresleep>
      return b;
    80203ac2:	a8b9                	j	80203b20 <bread+0xcc>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80203ac4:	00026497          	auipc	s1,0x26
    80203ac8:	5dc4b483          	ld	s1,1500(s1) # 8022a0a0 <bcache+0x46b0>
    80203acc:	00026797          	auipc	a5,0x26
    80203ad0:	58c78793          	addi	a5,a5,1420 # 8022a058 <bcache+0x4668>
    80203ad4:	00f48863          	beq	s1,a5,80203ae4 <bread+0x90>
    80203ad8:	873e                	mv	a4,a5
    if(b->refcnt == 0) {
    80203ada:	40bc                	lw	a5,64(s1)
    80203adc:	cf81                	beqz	a5,80203af4 <bread+0xa0>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80203ade:	64a4                	ld	s1,72(s1)
    80203ae0:	fee49de3          	bne	s1,a4,80203ada <bread+0x86>
  panic("bget: no buffers");
    80203ae4:	00007517          	auipc	a0,0x7
    80203ae8:	11c50513          	addi	a0,a0,284 # 8020ac00 <digits+0x880>
    80203aec:	ffffc097          	auipc	ra,0xffffc
    80203af0:	656080e7          	jalr	1622(ra) # 80200142 <panic>
      b->dev = dev;
    80203af4:	0134a423          	sw	s3,8(s1)
      b->sectorno = sectorno;
    80203af8:	0124a623          	sw	s2,12(s1)
      b->valid = 0;
    80203afc:	0004a023          	sw	zero,0(s1)
      b->refcnt = 1;
    80203b00:	4785                	li	a5,1
    80203b02:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    80203b04:	00022517          	auipc	a0,0x22
    80203b08:	eec50513          	addi	a0,a0,-276 # 802259f0 <bcache>
    80203b0c:	ffffd097          	auipc	ra,0xffffd
    80203b10:	c10080e7          	jalr	-1008(ra) # 8020071c <release>
      acquiresleep(&b->lock);
    80203b14:	01048513          	addi	a0,s1,16
    80203b18:	00000097          	auipc	ra,0x0
    80203b1c:	1b8080e7          	jalr	440(ra) # 80203cd0 <acquiresleep>
  struct buf *b;

  b = bget(dev, sectorno);
  if (!b->valid) {
    80203b20:	409c                	lw	a5,0(s1)
    80203b22:	cb89                	beqz	a5,80203b34 <bread+0xe0>
    disk_read(b);
    b->valid = 1;
  }

  return b;
}
    80203b24:	8526                	mv	a0,s1
    80203b26:	70a2                	ld	ra,40(sp)
    80203b28:	7402                	ld	s0,32(sp)
    80203b2a:	64e2                	ld	s1,24(sp)
    80203b2c:	6942                	ld	s2,16(sp)
    80203b2e:	69a2                	ld	s3,8(sp)
    80203b30:	6145                	addi	sp,sp,48
    80203b32:	8082                	ret
    disk_read(b);
    80203b34:	8526                	mv	a0,s1
    80203b36:	00002097          	auipc	ra,0x2
    80203b3a:	5ac080e7          	jalr	1452(ra) # 802060e2 <disk_read>
    b->valid = 1;
    80203b3e:	4785                	li	a5,1
    80203b40:	c09c                	sw	a5,0(s1)
  return b;
    80203b42:	b7cd                	j	80203b24 <bread+0xd0>

0000000080203b44 <bwrite>:

// Write b's contents to disk.  Must be locked.
void 
bwrite(struct buf *b) {
    80203b44:	1101                	addi	sp,sp,-32
    80203b46:	ec06                	sd	ra,24(sp)
    80203b48:	e822                	sd	s0,16(sp)
    80203b4a:	e426                	sd	s1,8(sp)
    80203b4c:	1000                	addi	s0,sp,32
    80203b4e:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203b50:	0541                	addi	a0,a0,16
    80203b52:	00000097          	auipc	ra,0x0
    80203b56:	218080e7          	jalr	536(ra) # 80203d6a <holdingsleep>
    80203b5a:	c919                	beqz	a0,80203b70 <bwrite+0x2c>
    panic("bwrite");
  disk_write(b);
    80203b5c:	8526                	mv	a0,s1
    80203b5e:	00002097          	auipc	ra,0x2
    80203b62:	59e080e7          	jalr	1438(ra) # 802060fc <disk_write>
}
    80203b66:	60e2                	ld	ra,24(sp)
    80203b68:	6442                	ld	s0,16(sp)
    80203b6a:	64a2                	ld	s1,8(sp)
    80203b6c:	6105                	addi	sp,sp,32
    80203b6e:	8082                	ret
    panic("bwrite");
    80203b70:	00007517          	auipc	a0,0x7
    80203b74:	0a850513          	addi	a0,a0,168 # 8020ac18 <digits+0x898>
    80203b78:	ffffc097          	auipc	ra,0xffffc
    80203b7c:	5ca080e7          	jalr	1482(ra) # 80200142 <panic>

0000000080203b80 <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80203b80:	1101                	addi	sp,sp,-32
    80203b82:	ec06                	sd	ra,24(sp)
    80203b84:	e822                	sd	s0,16(sp)
    80203b86:	e426                	sd	s1,8(sp)
    80203b88:	e04a                	sd	s2,0(sp)
    80203b8a:	1000                	addi	s0,sp,32
    80203b8c:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203b8e:	01050913          	addi	s2,a0,16
    80203b92:	854a                	mv	a0,s2
    80203b94:	00000097          	auipc	ra,0x0
    80203b98:	1d6080e7          	jalr	470(ra) # 80203d6a <holdingsleep>
    80203b9c:	c92d                	beqz	a0,80203c0e <brelse+0x8e>
    panic("brelse");

  releasesleep(&b->lock);
    80203b9e:	854a                	mv	a0,s2
    80203ba0:	00000097          	auipc	ra,0x0
    80203ba4:	186080e7          	jalr	390(ra) # 80203d26 <releasesleep>

  acquire(&bcache.lock);
    80203ba8:	00022517          	auipc	a0,0x22
    80203bac:	e4850513          	addi	a0,a0,-440 # 802259f0 <bcache>
    80203bb0:	ffffd097          	auipc	ra,0xffffd
    80203bb4:	b18080e7          	jalr	-1256(ra) # 802006c8 <acquire>
  b->refcnt--;
    80203bb8:	40bc                	lw	a5,64(s1)
    80203bba:	37fd                	addiw	a5,a5,-1
    80203bbc:	0007871b          	sext.w	a4,a5
    80203bc0:	c0bc                	sw	a5,64(s1)
  if (b->refcnt == 0) {
    80203bc2:	eb05                	bnez	a4,80203bf2 <brelse+0x72>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80203bc4:	68bc                	ld	a5,80(s1)
    80203bc6:	64b8                	ld	a4,72(s1)
    80203bc8:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80203bca:	64bc                	ld	a5,72(s1)
    80203bcc:	68b8                	ld	a4,80(s1)
    80203bce:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80203bd0:	00026797          	auipc	a5,0x26
    80203bd4:	e2078793          	addi	a5,a5,-480 # 802299f0 <bcache+0x4000>
    80203bd8:	6b87b703          	ld	a4,1720(a5)
    80203bdc:	e8b8                	sd	a4,80(s1)
    b->prev = &bcache.head;
    80203bde:	00026717          	auipc	a4,0x26
    80203be2:	47a70713          	addi	a4,a4,1146 # 8022a058 <bcache+0x4668>
    80203be6:	e4b8                	sd	a4,72(s1)
    bcache.head.next->prev = b;
    80203be8:	6b87b703          	ld	a4,1720(a5)
    80203bec:	e724                	sd	s1,72(a4)
    bcache.head.next = b;
    80203bee:	6a97bc23          	sd	s1,1720(a5)
  }
  
  release(&bcache.lock);
    80203bf2:	00022517          	auipc	a0,0x22
    80203bf6:	dfe50513          	addi	a0,a0,-514 # 802259f0 <bcache>
    80203bfa:	ffffd097          	auipc	ra,0xffffd
    80203bfe:	b22080e7          	jalr	-1246(ra) # 8020071c <release>
}
    80203c02:	60e2                	ld	ra,24(sp)
    80203c04:	6442                	ld	s0,16(sp)
    80203c06:	64a2                	ld	s1,8(sp)
    80203c08:	6902                	ld	s2,0(sp)
    80203c0a:	6105                	addi	sp,sp,32
    80203c0c:	8082                	ret
    panic("brelse");
    80203c0e:	00007517          	auipc	a0,0x7
    80203c12:	01250513          	addi	a0,a0,18 # 8020ac20 <digits+0x8a0>
    80203c16:	ffffc097          	auipc	ra,0xffffc
    80203c1a:	52c080e7          	jalr	1324(ra) # 80200142 <panic>

0000000080203c1e <bpin>:

void
bpin(struct buf *b) {
    80203c1e:	1101                	addi	sp,sp,-32
    80203c20:	ec06                	sd	ra,24(sp)
    80203c22:	e822                	sd	s0,16(sp)
    80203c24:	e426                	sd	s1,8(sp)
    80203c26:	1000                	addi	s0,sp,32
    80203c28:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80203c2a:	00022517          	auipc	a0,0x22
    80203c2e:	dc650513          	addi	a0,a0,-570 # 802259f0 <bcache>
    80203c32:	ffffd097          	auipc	ra,0xffffd
    80203c36:	a96080e7          	jalr	-1386(ra) # 802006c8 <acquire>
  b->refcnt++;
    80203c3a:	40bc                	lw	a5,64(s1)
    80203c3c:	2785                	addiw	a5,a5,1
    80203c3e:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203c40:	00022517          	auipc	a0,0x22
    80203c44:	db050513          	addi	a0,a0,-592 # 802259f0 <bcache>
    80203c48:	ffffd097          	auipc	ra,0xffffd
    80203c4c:	ad4080e7          	jalr	-1324(ra) # 8020071c <release>
}
    80203c50:	60e2                	ld	ra,24(sp)
    80203c52:	6442                	ld	s0,16(sp)
    80203c54:	64a2                	ld	s1,8(sp)
    80203c56:	6105                	addi	sp,sp,32
    80203c58:	8082                	ret

0000000080203c5a <bunpin>:

void
bunpin(struct buf *b) {
    80203c5a:	1101                	addi	sp,sp,-32
    80203c5c:	ec06                	sd	ra,24(sp)
    80203c5e:	e822                	sd	s0,16(sp)
    80203c60:	e426                	sd	s1,8(sp)
    80203c62:	1000                	addi	s0,sp,32
    80203c64:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80203c66:	00022517          	auipc	a0,0x22
    80203c6a:	d8a50513          	addi	a0,a0,-630 # 802259f0 <bcache>
    80203c6e:	ffffd097          	auipc	ra,0xffffd
    80203c72:	a5a080e7          	jalr	-1446(ra) # 802006c8 <acquire>
  b->refcnt--;
    80203c76:	40bc                	lw	a5,64(s1)
    80203c78:	37fd                	addiw	a5,a5,-1
    80203c7a:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203c7c:	00022517          	auipc	a0,0x22
    80203c80:	d7450513          	addi	a0,a0,-652 # 802259f0 <bcache>
    80203c84:	ffffd097          	auipc	ra,0xffffd
    80203c88:	a98080e7          	jalr	-1384(ra) # 8020071c <release>
}
    80203c8c:	60e2                	ld	ra,24(sp)
    80203c8e:	6442                	ld	s0,16(sp)
    80203c90:	64a2                	ld	s1,8(sp)
    80203c92:	6105                	addi	sp,sp,32
    80203c94:	8082                	ret

0000000080203c96 <initsleeplock>:
#include "include/proc.h"
#include "include/sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80203c96:	1101                	addi	sp,sp,-32
    80203c98:	ec06                	sd	ra,24(sp)
    80203c9a:	e822                	sd	s0,16(sp)
    80203c9c:	e426                	sd	s1,8(sp)
    80203c9e:	e04a                	sd	s2,0(sp)
    80203ca0:	1000                	addi	s0,sp,32
    80203ca2:	84aa                	mv	s1,a0
    80203ca4:	892e                	mv	s2,a1
  initlock(&lk->lk, "sleep lock");
    80203ca6:	00007597          	auipc	a1,0x7
    80203caa:	f8258593          	addi	a1,a1,-126 # 8020ac28 <digits+0x8a8>
    80203cae:	0521                	addi	a0,a0,8
    80203cb0:	ffffd097          	auipc	ra,0xffffd
    80203cb4:	9d4080e7          	jalr	-1580(ra) # 80200684 <initlock>
  lk->name = name;
    80203cb8:	0324b023          	sd	s2,32(s1)
  lk->locked = 0;
    80203cbc:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203cc0:	0204a423          	sw	zero,40(s1)
}
    80203cc4:	60e2                	ld	ra,24(sp)
    80203cc6:	6442                	ld	s0,16(sp)
    80203cc8:	64a2                	ld	s1,8(sp)
    80203cca:	6902                	ld	s2,0(sp)
    80203ccc:	6105                	addi	sp,sp,32
    80203cce:	8082                	ret

0000000080203cd0 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80203cd0:	1101                	addi	sp,sp,-32
    80203cd2:	ec06                	sd	ra,24(sp)
    80203cd4:	e822                	sd	s0,16(sp)
    80203cd6:	e426                	sd	s1,8(sp)
    80203cd8:	e04a                	sd	s2,0(sp)
    80203cda:	1000                	addi	s0,sp,32
    80203cdc:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203cde:	00850913          	addi	s2,a0,8
    80203ce2:	854a                	mv	a0,s2
    80203ce4:	ffffd097          	auipc	ra,0xffffd
    80203ce8:	9e4080e7          	jalr	-1564(ra) # 802006c8 <acquire>
  while (lk->locked) {
    80203cec:	409c                	lw	a5,0(s1)
    80203cee:	cb89                	beqz	a5,80203d00 <acquiresleep+0x30>
    sleep(lk, &lk->lk);
    80203cf0:	85ca                	mv	a1,s2
    80203cf2:	8526                	mv	a0,s1
    80203cf4:	ffffe097          	auipc	ra,0xffffe
    80203cf8:	5be080e7          	jalr	1470(ra) # 802022b2 <sleep>
  while (lk->locked) {
    80203cfc:	409c                	lw	a5,0(s1)
    80203cfe:	fbed                	bnez	a5,80203cf0 <acquiresleep+0x20>
  }
  lk->locked = 1;
    80203d00:	4785                	li	a5,1
    80203d02:	c09c                	sw	a5,0(s1)
  lk->pid = myproc()->pid;
    80203d04:	ffffe097          	auipc	ra,0xffffe
    80203d08:	d54080e7          	jalr	-684(ra) # 80201a58 <myproc>
    80203d0c:	5d1c                	lw	a5,56(a0)
    80203d0e:	d49c                	sw	a5,40(s1)
  release(&lk->lk);
    80203d10:	854a                	mv	a0,s2
    80203d12:	ffffd097          	auipc	ra,0xffffd
    80203d16:	a0a080e7          	jalr	-1526(ra) # 8020071c <release>
}
    80203d1a:	60e2                	ld	ra,24(sp)
    80203d1c:	6442                	ld	s0,16(sp)
    80203d1e:	64a2                	ld	s1,8(sp)
    80203d20:	6902                	ld	s2,0(sp)
    80203d22:	6105                	addi	sp,sp,32
    80203d24:	8082                	ret

0000000080203d26 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80203d26:	1101                	addi	sp,sp,-32
    80203d28:	ec06                	sd	ra,24(sp)
    80203d2a:	e822                	sd	s0,16(sp)
    80203d2c:	e426                	sd	s1,8(sp)
    80203d2e:	e04a                	sd	s2,0(sp)
    80203d30:	1000                	addi	s0,sp,32
    80203d32:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203d34:	00850913          	addi	s2,a0,8
    80203d38:	854a                	mv	a0,s2
    80203d3a:	ffffd097          	auipc	ra,0xffffd
    80203d3e:	98e080e7          	jalr	-1650(ra) # 802006c8 <acquire>
  lk->locked = 0;
    80203d42:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203d46:	0204a423          	sw	zero,40(s1)
  wakeup(lk);
    80203d4a:	8526                	mv	a0,s1
    80203d4c:	ffffe097          	auipc	ra,0xffffe
    80203d50:	6e8080e7          	jalr	1768(ra) # 80202434 <wakeup>
  release(&lk->lk);
    80203d54:	854a                	mv	a0,s2
    80203d56:	ffffd097          	auipc	ra,0xffffd
    80203d5a:	9c6080e7          	jalr	-1594(ra) # 8020071c <release>
}
    80203d5e:	60e2                	ld	ra,24(sp)
    80203d60:	6442                	ld	s0,16(sp)
    80203d62:	64a2                	ld	s1,8(sp)
    80203d64:	6902                	ld	s2,0(sp)
    80203d66:	6105                	addi	sp,sp,32
    80203d68:	8082                	ret

0000000080203d6a <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80203d6a:	7179                	addi	sp,sp,-48
    80203d6c:	f406                	sd	ra,40(sp)
    80203d6e:	f022                	sd	s0,32(sp)
    80203d70:	ec26                	sd	s1,24(sp)
    80203d72:	e84a                	sd	s2,16(sp)
    80203d74:	e44e                	sd	s3,8(sp)
    80203d76:	1800                	addi	s0,sp,48
    80203d78:	84aa                	mv	s1,a0
  int r;
  
  acquire(&lk->lk);
    80203d7a:	00850913          	addi	s2,a0,8
    80203d7e:	854a                	mv	a0,s2
    80203d80:	ffffd097          	auipc	ra,0xffffd
    80203d84:	948080e7          	jalr	-1720(ra) # 802006c8 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80203d88:	409c                	lw	a5,0(s1)
    80203d8a:	ef99                	bnez	a5,80203da8 <holdingsleep+0x3e>
    80203d8c:	4481                	li	s1,0
  release(&lk->lk);
    80203d8e:	854a                	mv	a0,s2
    80203d90:	ffffd097          	auipc	ra,0xffffd
    80203d94:	98c080e7          	jalr	-1652(ra) # 8020071c <release>
  return r;
}
    80203d98:	8526                	mv	a0,s1
    80203d9a:	70a2                	ld	ra,40(sp)
    80203d9c:	7402                	ld	s0,32(sp)
    80203d9e:	64e2                	ld	s1,24(sp)
    80203da0:	6942                	ld	s2,16(sp)
    80203da2:	69a2                	ld	s3,8(sp)
    80203da4:	6145                	addi	sp,sp,48
    80203da6:	8082                	ret
  r = lk->locked && (lk->pid == myproc()->pid);
    80203da8:	0284a983          	lw	s3,40(s1)
    80203dac:	ffffe097          	auipc	ra,0xffffe
    80203db0:	cac080e7          	jalr	-852(ra) # 80201a58 <myproc>
    80203db4:	5d04                	lw	s1,56(a0)
    80203db6:	413484b3          	sub	s1,s1,s3
    80203dba:	0014b493          	seqz	s1,s1
    80203dbe:	bfc1                	j	80203d8e <holdingsleep+0x24>

0000000080203dc0 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80203dc0:	1101                	addi	sp,sp,-32
    80203dc2:	ec06                	sd	ra,24(sp)
    80203dc4:	e822                	sd	s0,16(sp)
    80203dc6:	e426                	sd	s1,8(sp)
    80203dc8:	e04a                	sd	s2,0(sp)
    80203dca:	1000                	addi	s0,sp,32
  initlock(&ftable.lock, "ftable");
    80203dcc:	00007597          	auipc	a1,0x7
    80203dd0:	e6c58593          	addi	a1,a1,-404 # 8020ac38 <digits+0x8b8>
    80203dd4:	00026517          	auipc	a0,0x26
    80203dd8:	57c50513          	addi	a0,a0,1404 # 8022a350 <ftable>
    80203ddc:	ffffd097          	auipc	ra,0xffffd
    80203de0:	8a8080e7          	jalr	-1880(ra) # 80200684 <initlock>
  struct file *f;
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203de4:	00026497          	auipc	s1,0x26
    80203de8:	58448493          	addi	s1,s1,1412 # 8022a368 <ftable+0x18>
    80203dec:	00028917          	auipc	s2,0x28
    80203df0:	97c90913          	addi	s2,s2,-1668 # 8022b768 <tickslock>
    memset(f, 0, sizeof(struct file));
    80203df4:	02800613          	li	a2,40
    80203df8:	4581                	li	a1,0
    80203dfa:	8526                	mv	a0,s1
    80203dfc:	ffffd097          	auipc	ra,0xffffd
    80203e00:	968080e7          	jalr	-1688(ra) # 80200764 <memset>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203e04:	02848493          	addi	s1,s1,40
    80203e08:	ff2496e3          	bne	s1,s2,80203df4 <fileinit+0x34>
  }

  #ifdef DEBUG
  printf("fileinit\n");
  #endif
}
    80203e0c:	60e2                	ld	ra,24(sp)
    80203e0e:	6442                	ld	s0,16(sp)
    80203e10:	64a2                	ld	s1,8(sp)
    80203e12:	6902                	ld	s2,0(sp)
    80203e14:	6105                	addi	sp,sp,32
    80203e16:	8082                	ret

0000000080203e18 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80203e18:	1101                	addi	sp,sp,-32
    80203e1a:	ec06                	sd	ra,24(sp)
    80203e1c:	e822                	sd	s0,16(sp)
    80203e1e:	e426                	sd	s1,8(sp)
    80203e20:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80203e22:	00026517          	auipc	a0,0x26
    80203e26:	52e50513          	addi	a0,a0,1326 # 8022a350 <ftable>
    80203e2a:	ffffd097          	auipc	ra,0xffffd
    80203e2e:	89e080e7          	jalr	-1890(ra) # 802006c8 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203e32:	00026497          	auipc	s1,0x26
    80203e36:	53648493          	addi	s1,s1,1334 # 8022a368 <ftable+0x18>
    80203e3a:	00028717          	auipc	a4,0x28
    80203e3e:	92e70713          	addi	a4,a4,-1746 # 8022b768 <tickslock>
    if(f->ref == 0){
    80203e42:	40dc                	lw	a5,4(s1)
    80203e44:	cf99                	beqz	a5,80203e62 <filealloc+0x4a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203e46:	02848493          	addi	s1,s1,40
    80203e4a:	fee49ce3          	bne	s1,a4,80203e42 <filealloc+0x2a>
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
    80203e4e:	00026517          	auipc	a0,0x26
    80203e52:	50250513          	addi	a0,a0,1282 # 8022a350 <ftable>
    80203e56:	ffffd097          	auipc	ra,0xffffd
    80203e5a:	8c6080e7          	jalr	-1850(ra) # 8020071c <release>
  return NULL;
    80203e5e:	4481                	li	s1,0
    80203e60:	a819                	j	80203e76 <filealloc+0x5e>
      f->ref = 1;
    80203e62:	4785                	li	a5,1
    80203e64:	c0dc                	sw	a5,4(s1)
      release(&ftable.lock);
    80203e66:	00026517          	auipc	a0,0x26
    80203e6a:	4ea50513          	addi	a0,a0,1258 # 8022a350 <ftable>
    80203e6e:	ffffd097          	auipc	ra,0xffffd
    80203e72:	8ae080e7          	jalr	-1874(ra) # 8020071c <release>
}
    80203e76:	8526                	mv	a0,s1
    80203e78:	60e2                	ld	ra,24(sp)
    80203e7a:	6442                	ld	s0,16(sp)
    80203e7c:	64a2                	ld	s1,8(sp)
    80203e7e:	6105                	addi	sp,sp,32
    80203e80:	8082                	ret

0000000080203e82 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80203e82:	1101                	addi	sp,sp,-32
    80203e84:	ec06                	sd	ra,24(sp)
    80203e86:	e822                	sd	s0,16(sp)
    80203e88:	e426                	sd	s1,8(sp)
    80203e8a:	1000                	addi	s0,sp,32
    80203e8c:	84aa                	mv	s1,a0
  acquire(&ftable.lock);
    80203e8e:	00026517          	auipc	a0,0x26
    80203e92:	4c250513          	addi	a0,a0,1218 # 8022a350 <ftable>
    80203e96:	ffffd097          	auipc	ra,0xffffd
    80203e9a:	832080e7          	jalr	-1998(ra) # 802006c8 <acquire>
  if(f->ref < 1)
    80203e9e:	40dc                	lw	a5,4(s1)
    80203ea0:	02f05263          	blez	a5,80203ec4 <filedup+0x42>
    panic("filedup");
  f->ref++;
    80203ea4:	2785                	addiw	a5,a5,1
    80203ea6:	c0dc                	sw	a5,4(s1)
  release(&ftable.lock);
    80203ea8:	00026517          	auipc	a0,0x26
    80203eac:	4a850513          	addi	a0,a0,1192 # 8022a350 <ftable>
    80203eb0:	ffffd097          	auipc	ra,0xffffd
    80203eb4:	86c080e7          	jalr	-1940(ra) # 8020071c <release>
  return f;
}
    80203eb8:	8526                	mv	a0,s1
    80203eba:	60e2                	ld	ra,24(sp)
    80203ebc:	6442                	ld	s0,16(sp)
    80203ebe:	64a2                	ld	s1,8(sp)
    80203ec0:	6105                	addi	sp,sp,32
    80203ec2:	8082                	ret
    panic("filedup");
    80203ec4:	00007517          	auipc	a0,0x7
    80203ec8:	d7c50513          	addi	a0,a0,-644 # 8020ac40 <digits+0x8c0>
    80203ecc:	ffffc097          	auipc	ra,0xffffc
    80203ed0:	276080e7          	jalr	630(ra) # 80200142 <panic>

0000000080203ed4 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80203ed4:	7139                	addi	sp,sp,-64
    80203ed6:	fc06                	sd	ra,56(sp)
    80203ed8:	f822                	sd	s0,48(sp)
    80203eda:	f426                	sd	s1,40(sp)
    80203edc:	f04a                	sd	s2,32(sp)
    80203ede:	ec4e                	sd	s3,24(sp)
    80203ee0:	e852                	sd	s4,16(sp)
    80203ee2:	e456                	sd	s5,8(sp)
    80203ee4:	0080                	addi	s0,sp,64
    80203ee6:	84aa                	mv	s1,a0
  struct file ff;

  acquire(&ftable.lock);
    80203ee8:	00026517          	auipc	a0,0x26
    80203eec:	46850513          	addi	a0,a0,1128 # 8022a350 <ftable>
    80203ef0:	ffffc097          	auipc	ra,0xffffc
    80203ef4:	7d8080e7          	jalr	2008(ra) # 802006c8 <acquire>
  if(f->ref < 1)
    80203ef8:	40dc                	lw	a5,4(s1)
    80203efa:	04f05863          	blez	a5,80203f4a <fileclose+0x76>
    panic("fileclose");
  if(--f->ref > 0){
    80203efe:	37fd                	addiw	a5,a5,-1
    80203f00:	0007871b          	sext.w	a4,a5
    80203f04:	c0dc                	sw	a5,4(s1)
    80203f06:	04e04a63          	bgtz	a4,80203f5a <fileclose+0x86>
    release(&ftable.lock);
    return;
  }
  ff = *f;
    80203f0a:	0004a903          	lw	s2,0(s1)
    80203f0e:	0094ca03          	lbu	s4,9(s1)
    80203f12:	0104b983          	ld	s3,16(s1)
    80203f16:	0184ba83          	ld	s5,24(s1)
  f->ref = 0;
    80203f1a:	0004a223          	sw	zero,4(s1)
  f->type = FD_NONE;
    80203f1e:	0004a023          	sw	zero,0(s1)
  release(&ftable.lock);
    80203f22:	00026517          	auipc	a0,0x26
    80203f26:	42e50513          	addi	a0,a0,1070 # 8022a350 <ftable>
    80203f2a:	ffffc097          	auipc	ra,0xffffc
    80203f2e:	7f2080e7          	jalr	2034(ra) # 8020071c <release>

  if(ff.type == FD_PIPE){
    80203f32:	4785                	li	a5,1
    80203f34:	04f90463          	beq	s2,a5,80203f7c <fileclose+0xa8>
    pipeclose(ff.pipe, ff.writable);
  } else if(ff.type == FD_ENTRY){
    80203f38:	4789                	li	a5,2
    80203f3a:	02f91863          	bne	s2,a5,80203f6a <fileclose+0x96>
    eput(ff.ep);
    80203f3e:	8556                	mv	a0,s5
    80203f40:	00003097          	auipc	ra,0x3
    80203f44:	3a6080e7          	jalr	934(ra) # 802072e6 <eput>
    80203f48:	a00d                	j	80203f6a <fileclose+0x96>
    panic("fileclose");
    80203f4a:	00007517          	auipc	a0,0x7
    80203f4e:	cfe50513          	addi	a0,a0,-770 # 8020ac48 <digits+0x8c8>
    80203f52:	ffffc097          	auipc	ra,0xffffc
    80203f56:	1f0080e7          	jalr	496(ra) # 80200142 <panic>
    release(&ftable.lock);
    80203f5a:	00026517          	auipc	a0,0x26
    80203f5e:	3f650513          	addi	a0,a0,1014 # 8022a350 <ftable>
    80203f62:	ffffc097          	auipc	ra,0xffffc
    80203f66:	7ba080e7          	jalr	1978(ra) # 8020071c <release>
  } else if (ff.type == FD_DEVICE) {

  }
}
    80203f6a:	70e2                	ld	ra,56(sp)
    80203f6c:	7442                	ld	s0,48(sp)
    80203f6e:	74a2                	ld	s1,40(sp)
    80203f70:	7902                	ld	s2,32(sp)
    80203f72:	69e2                	ld	s3,24(sp)
    80203f74:	6a42                	ld	s4,16(sp)
    80203f76:	6aa2                	ld	s5,8(sp)
    80203f78:	6121                	addi	sp,sp,64
    80203f7a:	8082                	ret
    pipeclose(ff.pipe, ff.writable);
    80203f7c:	85d2                	mv	a1,s4
    80203f7e:	854e                	mv	a0,s3
    80203f80:	00000097          	auipc	ra,0x0
    80203f84:	3a2080e7          	jalr	930(ra) # 80204322 <pipeclose>
    80203f88:	b7cd                	j	80203f6a <fileclose+0x96>

0000000080203f8a <filestat>:
int
filestat(struct file *f, uint64 addr)
{
  struct stat st;
  
  if(f->type == FD_ENTRY){
    80203f8a:	4118                	lw	a4,0(a0)
    80203f8c:	4789                	li	a5,2
    80203f8e:	04f71e63          	bne	a4,a5,80203fea <filestat+0x60>
{
    80203f92:	7159                	addi	sp,sp,-112
    80203f94:	f486                	sd	ra,104(sp)
    80203f96:	f0a2                	sd	s0,96(sp)
    80203f98:	eca6                	sd	s1,88(sp)
    80203f9a:	e8ca                	sd	s2,80(sp)
    80203f9c:	e4ce                	sd	s3,72(sp)
    80203f9e:	1880                	addi	s0,sp,112
    80203fa0:	84aa                	mv	s1,a0
    80203fa2:	892e                	mv	s2,a1
    elock(f->ep);
    80203fa4:	6d08                	ld	a0,24(a0)
    80203fa6:	00003097          	auipc	ra,0x3
    80203faa:	2bc080e7          	jalr	700(ra) # 80207262 <elock>
    estat(f->ep, &st);
    80203fae:	f9840993          	addi	s3,s0,-104
    80203fb2:	85ce                	mv	a1,s3
    80203fb4:	6c88                	ld	a0,24(s1)
    80203fb6:	00003097          	auipc	ra,0x3
    80203fba:	468080e7          	jalr	1128(ra) # 8020741e <estat>
    eunlock(f->ep);
    80203fbe:	6c88                	ld	a0,24(s1)
    80203fc0:	00003097          	auipc	ra,0x3
    80203fc4:	2d8080e7          	jalr	728(ra) # 80207298 <eunlock>
    // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203fc8:	03800613          	li	a2,56
    80203fcc:	85ce                	mv	a1,s3
    80203fce:	854a                	mv	a0,s2
    80203fd0:	ffffd097          	auipc	ra,0xffffd
    80203fd4:	3ac080e7          	jalr	940(ra) # 8020137c <copyout2>
    80203fd8:	41f5551b          	sraiw	a0,a0,0x1f
      return -1;
    return 0;
  }
  return -1;
}
    80203fdc:	70a6                	ld	ra,104(sp)
    80203fde:	7406                	ld	s0,96(sp)
    80203fe0:	64e6                	ld	s1,88(sp)
    80203fe2:	6946                	ld	s2,80(sp)
    80203fe4:	69a6                	ld	s3,72(sp)
    80203fe6:	6165                	addi	sp,sp,112
    80203fe8:	8082                	ret
  return -1;
    80203fea:	557d                	li	a0,-1
}
    80203fec:	8082                	ret

0000000080203fee <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80203fee:	7179                	addi	sp,sp,-48
    80203ff0:	f406                	sd	ra,40(sp)
    80203ff2:	f022                	sd	s0,32(sp)
    80203ff4:	ec26                	sd	s1,24(sp)
    80203ff6:	e84a                	sd	s2,16(sp)
    80203ff8:	e44e                	sd	s3,8(sp)
    80203ffa:	1800                	addi	s0,sp,48
  int r = 0;

  if(f->readable == 0)
    80203ffc:	00854783          	lbu	a5,8(a0)
    80204000:	c3d5                	beqz	a5,802040a4 <fileread+0xb6>
    80204002:	84aa                	mv	s1,a0
    80204004:	89ae                	mv	s3,a1
    80204006:	8932                	mv	s2,a2
    return -1;

  switch (f->type) {
    80204008:	411c                	lw	a5,0(a0)
    8020400a:	4709                	li	a4,2
    8020400c:	06e78263          	beq	a5,a4,80204070 <fileread+0x82>
    80204010:	470d                	li	a4,3
    80204012:	02e78b63          	beq	a5,a4,80204048 <fileread+0x5a>
    80204016:	4705                	li	a4,1
    80204018:	00e78a63          	beq	a5,a4,8020402c <fileread+0x3e>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
            f->off += r;
        eunlock(f->ep);
        break;
    default:
      panic("fileread");
    8020401c:	00007517          	auipc	a0,0x7
    80204020:	c3c50513          	addi	a0,a0,-964 # 8020ac58 <digits+0x8d8>
    80204024:	ffffc097          	auipc	ra,0xffffc
    80204028:	11e080e7          	jalr	286(ra) # 80200142 <panic>
        r = piperead(f->pipe, addr, n);
    8020402c:	6908                	ld	a0,16(a0)
    8020402e:	00000097          	auipc	ra,0x0
    80204032:	48c080e7          	jalr	1164(ra) # 802044ba <piperead>
    80204036:	892a                	mv	s2,a0
  }

  return r;
}
    80204038:	854a                	mv	a0,s2
    8020403a:	70a2                	ld	ra,40(sp)
    8020403c:	7402                	ld	s0,32(sp)
    8020403e:	64e2                	ld	s1,24(sp)
    80204040:	6942                	ld	s2,16(sp)
    80204042:	69a2                	ld	s3,8(sp)
    80204044:	6145                	addi	sp,sp,48
    80204046:	8082                	ret
        if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80204048:	02451783          	lh	a5,36(a0)
    8020404c:	03079693          	slli	a3,a5,0x30
    80204050:	92c1                	srli	a3,a3,0x30
    80204052:	4725                	li	a4,9
    80204054:	04d76a63          	bltu	a4,a3,802040a8 <fileread+0xba>
    80204058:	0792                	slli	a5,a5,0x4
    8020405a:	00026717          	auipc	a4,0x26
    8020405e:	25670713          	addi	a4,a4,598 # 8022a2b0 <devsw>
    80204062:	97ba                	add	a5,a5,a4
    80204064:	639c                	ld	a5,0(a5)
    80204066:	c3b9                	beqz	a5,802040ac <fileread+0xbe>
        r = devsw[f->major].read(1, addr, n);
    80204068:	4505                	li	a0,1
    8020406a:	9782                	jalr	a5
    8020406c:	892a                	mv	s2,a0
        break;
    8020406e:	b7e9                	j	80204038 <fileread+0x4a>
        elock(f->ep);
    80204070:	6d08                	ld	a0,24(a0)
    80204072:	00003097          	auipc	ra,0x3
    80204076:	1f0080e7          	jalr	496(ra) # 80207262 <elock>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
    8020407a:	874a                	mv	a4,s2
    8020407c:	5094                	lw	a3,32(s1)
    8020407e:	864e                	mv	a2,s3
    80204080:	4585                	li	a1,1
    80204082:	6c88                	ld	a0,24(s1)
    80204084:	00003097          	auipc	ra,0x3
    80204088:	8f4080e7          	jalr	-1804(ra) # 80206978 <eread>
    8020408c:	892a                	mv	s2,a0
    8020408e:	00a05563          	blez	a0,80204098 <fileread+0xaa>
            f->off += r;
    80204092:	509c                	lw	a5,32(s1)
    80204094:	9fa9                	addw	a5,a5,a0
    80204096:	d09c                	sw	a5,32(s1)
        eunlock(f->ep);
    80204098:	6c88                	ld	a0,24(s1)
    8020409a:	00003097          	auipc	ra,0x3
    8020409e:	1fe080e7          	jalr	510(ra) # 80207298 <eunlock>
        break;
    802040a2:	bf59                	j	80204038 <fileread+0x4a>
    return -1;
    802040a4:	597d                	li	s2,-1
    802040a6:	bf49                	j	80204038 <fileread+0x4a>
          return -1;
    802040a8:	597d                	li	s2,-1
    802040aa:	b779                	j	80204038 <fileread+0x4a>
    802040ac:	597d                	li	s2,-1
    802040ae:	b769                	j	80204038 <fileread+0x4a>

00000000802040b0 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    802040b0:	7179                	addi	sp,sp,-48
    802040b2:	f406                	sd	ra,40(sp)
    802040b4:	f022                	sd	s0,32(sp)
    802040b6:	ec26                	sd	s1,24(sp)
    802040b8:	e84a                	sd	s2,16(sp)
    802040ba:	e44e                	sd	s3,8(sp)
    802040bc:	e052                	sd	s4,0(sp)
    802040be:	1800                	addi	s0,sp,48
  int ret = 0;

  if(f->writable == 0)
    802040c0:	00954783          	lbu	a5,9(a0)
    802040c4:	cbcd                	beqz	a5,80204176 <filewrite+0xc6>
    802040c6:	84aa                	mv	s1,a0
    802040c8:	892e                	mv	s2,a1
    802040ca:	89b2                	mv	s3,a2
    return -1;

  if(f->type == FD_PIPE){
    802040cc:	411c                	lw	a5,0(a0)
    802040ce:	4705                	li	a4,1
    802040d0:	04e78963          	beq	a5,a4,80204122 <filewrite+0x72>
    ret = pipewrite(f->pipe, addr, n);
  } else if(f->type == FD_DEVICE){
    802040d4:	470d                	li	a4,3
    802040d6:	04e78d63          	beq	a5,a4,80204130 <filewrite+0x80>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
      return -1;
    ret = devsw[f->major].write(1, addr, n);
  } else if(f->type == FD_ENTRY){
    802040da:	4709                	li	a4,2
    802040dc:	08e79563          	bne	a5,a4,80204166 <filewrite+0xb6>
    elock(f->ep);
    802040e0:	6d08                	ld	a0,24(a0)
    802040e2:	00003097          	auipc	ra,0x3
    802040e6:	180080e7          	jalr	384(ra) # 80207262 <elock>
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    802040ea:	00098a1b          	sext.w	s4,s3
    802040ee:	8752                	mv	a4,s4
    802040f0:	5094                	lw	a3,32(s1)
    802040f2:	864a                	mv	a2,s2
    802040f4:	4585                	li	a1,1
    802040f6:	6c88                	ld	a0,24(s1)
    802040f8:	00003097          	auipc	ra,0x3
    802040fc:	978080e7          	jalr	-1672(ra) # 80206a70 <ewrite>
      ret = n;
      f->off += n;
    } else {
      ret = -1;
    80204100:	597d                	li	s2,-1
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80204102:	05350b63          	beq	a0,s3,80204158 <filewrite+0xa8>
    }
    eunlock(f->ep);
    80204106:	6c88                	ld	a0,24(s1)
    80204108:	00003097          	auipc	ra,0x3
    8020410c:	190080e7          	jalr	400(ra) # 80207298 <eunlock>
  } else {
    panic("filewrite");
  }

  return ret;
}
    80204110:	854a                	mv	a0,s2
    80204112:	70a2                	ld	ra,40(sp)
    80204114:	7402                	ld	s0,32(sp)
    80204116:	64e2                	ld	s1,24(sp)
    80204118:	6942                	ld	s2,16(sp)
    8020411a:	69a2                	ld	s3,8(sp)
    8020411c:	6a02                	ld	s4,0(sp)
    8020411e:	6145                	addi	sp,sp,48
    80204120:	8082                	ret
    ret = pipewrite(f->pipe, addr, n);
    80204122:	6908                	ld	a0,16(a0)
    80204124:	00000097          	auipc	ra,0x0
    80204128:	26e080e7          	jalr	622(ra) # 80204392 <pipewrite>
    8020412c:	892a                	mv	s2,a0
    8020412e:	b7cd                	j	80204110 <filewrite+0x60>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80204130:	02451783          	lh	a5,36(a0)
    80204134:	03079693          	slli	a3,a5,0x30
    80204138:	92c1                	srli	a3,a3,0x30
    8020413a:	4725                	li	a4,9
    8020413c:	02d76f63          	bltu	a4,a3,8020417a <filewrite+0xca>
    80204140:	0792                	slli	a5,a5,0x4
    80204142:	00026717          	auipc	a4,0x26
    80204146:	16e70713          	addi	a4,a4,366 # 8022a2b0 <devsw>
    8020414a:	97ba                	add	a5,a5,a4
    8020414c:	679c                	ld	a5,8(a5)
    8020414e:	cb85                	beqz	a5,8020417e <filewrite+0xce>
    ret = devsw[f->major].write(1, addr, n);
    80204150:	4505                	li	a0,1
    80204152:	9782                	jalr	a5
    80204154:	892a                	mv	s2,a0
    80204156:	bf6d                	j	80204110 <filewrite+0x60>
      f->off += n;
    80204158:	509c                	lw	a5,32(s1)
    8020415a:	01478a3b          	addw	s4,a5,s4
    8020415e:	0344a023          	sw	s4,32(s1)
      ret = n;
    80204162:	894e                	mv	s2,s3
    80204164:	b74d                	j	80204106 <filewrite+0x56>
    panic("filewrite");
    80204166:	00007517          	auipc	a0,0x7
    8020416a:	b0250513          	addi	a0,a0,-1278 # 8020ac68 <digits+0x8e8>
    8020416e:	ffffc097          	auipc	ra,0xffffc
    80204172:	fd4080e7          	jalr	-44(ra) # 80200142 <panic>
    return -1;
    80204176:	597d                	li	s2,-1
    80204178:	bf61                	j	80204110 <filewrite+0x60>
      return -1;
    8020417a:	597d                	li	s2,-1
    8020417c:	bf51                	j	80204110 <filewrite+0x60>
    8020417e:	597d                	li	s2,-1
    80204180:	bf41                	j	80204110 <filewrite+0x60>

0000000080204182 <dirnext>:
int
dirnext(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();

  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80204182:	00854783          	lbu	a5,8(a0)
    80204186:	cfdd                	beqz	a5,80204244 <dirnext+0xc2>
{
    80204188:	7141                	addi	sp,sp,-496
    8020418a:	f786                	sd	ra,488(sp)
    8020418c:	f3a2                	sd	s0,480(sp)
    8020418e:	efa6                	sd	s1,472(sp)
    80204190:	ebca                	sd	s2,464(sp)
    80204192:	e7ce                	sd	s3,456(sp)
    80204194:	e3d2                	sd	s4,448(sp)
    80204196:	ff56                	sd	s5,440(sp)
    80204198:	1b80                	addi	s0,sp,496
    8020419a:	84aa                	mv	s1,a0
    8020419c:	8aae                	mv	s5,a1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    8020419e:	6d18                	ld	a4,24(a0)
    802041a0:	10074783          	lbu	a5,256(a4)
    802041a4:	8bc1                	andi	a5,a5,16
    return -1;
    802041a6:	557d                	li	a0,-1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    802041a8:	eb91                	bnez	a5,802041bc <dirnext+0x3a>
  // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    return -1;

  return 1;
    802041aa:	70be                	ld	ra,488(sp)
    802041ac:	741e                	ld	s0,480(sp)
    802041ae:	64fe                	ld	s1,472(sp)
    802041b0:	695e                	ld	s2,464(sp)
    802041b2:	69be                	ld	s3,456(sp)
    802041b4:	6a1e                	ld	s4,448(sp)
    802041b6:	7afa                	ld	s5,440(sp)
    802041b8:	617d                	addi	sp,sp,496
    802041ba:	8082                	ret
  int count = 0;
    802041bc:	e0042e23          	sw	zero,-484(s0)
  elock(f->ep);
    802041c0:	853a                	mv	a0,a4
    802041c2:	00003097          	auipc	ra,0x3
    802041c6:	0a0080e7          	jalr	160(ra) # 80207262 <elock>
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    802041ca:	e1c40a13          	addi	s4,s0,-484
    802041ce:	e5840993          	addi	s3,s0,-424
    802041d2:	a801                	j	802041e2 <dirnext+0x60>
    f->off += count * 32;
    802041d4:	e1c42783          	lw	a5,-484(s0)
    802041d8:	0057971b          	slliw	a4,a5,0x5
    802041dc:	509c                	lw	a5,32(s1)
    802041de:	9fb9                	addw	a5,a5,a4
    802041e0:	d09c                	sw	a5,32(s1)
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    802041e2:	86d2                	mv	a3,s4
    802041e4:	5090                	lw	a2,32(s1)
    802041e6:	85ce                	mv	a1,s3
    802041e8:	6c88                	ld	a0,24(s1)
    802041ea:	00003097          	auipc	ra,0x3
    802041ee:	27c080e7          	jalr	636(ra) # 80207466 <enext>
    802041f2:	892a                	mv	s2,a0
    802041f4:	d165                	beqz	a0,802041d4 <dirnext+0x52>
  eunlock(f->ep);
    802041f6:	6c88                	ld	a0,24(s1)
    802041f8:	00003097          	auipc	ra,0x3
    802041fc:	0a0080e7          	jalr	160(ra) # 80207298 <eunlock>
  if (ret == -1)
    80204200:	57fd                	li	a5,-1
    return 0;
    80204202:	4501                	li	a0,0
  if (ret == -1)
    80204204:	faf903e3          	beq	s2,a5,802041aa <dirnext+0x28>
  f->off += count * 32;
    80204208:	e1c42783          	lw	a5,-484(s0)
    8020420c:	0057971b          	slliw	a4,a5,0x5
    80204210:	509c                	lw	a5,32(s1)
    80204212:	9fb9                	addw	a5,a5,a4
    80204214:	d09c                	sw	a5,32(s1)
  estat(&de, &st);
    80204216:	e2040493          	addi	s1,s0,-480
    8020421a:	85a6                	mv	a1,s1
    8020421c:	e5840513          	addi	a0,s0,-424
    80204220:	00003097          	auipc	ra,0x3
    80204224:	1fe080e7          	jalr	510(ra) # 8020741e <estat>
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80204228:	03800613          	li	a2,56
    8020422c:	85a6                	mv	a1,s1
    8020422e:	8556                	mv	a0,s5
    80204230:	ffffd097          	auipc	ra,0xffffd
    80204234:	14c080e7          	jalr	332(ra) # 8020137c <copyout2>
    80204238:	87aa                	mv	a5,a0
  return 1;
    8020423a:	4505                	li	a0,1
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    8020423c:	f607d7e3          	bgez	a5,802041aa <dirnext+0x28>
    return -1;
    80204240:	557d                	li	a0,-1
    80204242:	b7a5                	j	802041aa <dirnext+0x28>
    return -1;
    80204244:	557d                	li	a0,-1
    80204246:	8082                	ret

0000000080204248 <pipealloc>:
#include "include/kalloc.h"
#include "include/vm.h"

int
pipealloc(struct file **f0, struct file **f1)
{
    80204248:	7179                	addi	sp,sp,-48
    8020424a:	f406                	sd	ra,40(sp)
    8020424c:	f022                	sd	s0,32(sp)
    8020424e:	ec26                	sd	s1,24(sp)
    80204250:	e84a                	sd	s2,16(sp)
    80204252:	e44e                	sd	s3,8(sp)
    80204254:	e052                	sd	s4,0(sp)
    80204256:	1800                	addi	s0,sp,48
    80204258:	84aa                	mv	s1,a0
    8020425a:	8a2e                	mv	s4,a1
  struct pipe *pi;

  pi = 0;
  *f0 = *f1 = 0;
    8020425c:	0005b023          	sd	zero,0(a1)
    80204260:	00053023          	sd	zero,0(a0)
  if((*f0 = filealloc()) == NULL || (*f1 = filealloc()) == NULL)
    80204264:	00000097          	auipc	ra,0x0
    80204268:	bb4080e7          	jalr	-1100(ra) # 80203e18 <filealloc>
    8020426c:	e088                	sd	a0,0(s1)
    8020426e:	c551                	beqz	a0,802042fa <pipealloc+0xb2>
    80204270:	00000097          	auipc	ra,0x0
    80204274:	ba8080e7          	jalr	-1112(ra) # 80203e18 <filealloc>
    80204278:	00aa3023          	sd	a0,0(s4)
    8020427c:	c92d                	beqz	a0,802042ee <pipealloc+0xa6>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == NULL)
    8020427e:	ffffc097          	auipc	ra,0xffffc
    80204282:	2de080e7          	jalr	734(ra) # 8020055c <kalloc>
    80204286:	892a                	mv	s2,a0
    80204288:	c125                	beqz	a0,802042e8 <pipealloc+0xa0>
    goto bad;
  pi->readopen = 1;
    8020428a:	4985                	li	s3,1
    8020428c:	23352023          	sw	s3,544(a0)
  pi->writeopen = 1;
    80204290:	23352223          	sw	s3,548(a0)
  pi->nwrite = 0;
    80204294:	20052e23          	sw	zero,540(a0)
  pi->nread = 0;
    80204298:	20052c23          	sw	zero,536(a0)
  initlock(&pi->lock, "pipe");
    8020429c:	00007597          	auipc	a1,0x7
    802042a0:	81c58593          	addi	a1,a1,-2020 # 8020aab8 <digits+0x738>
    802042a4:	ffffc097          	auipc	ra,0xffffc
    802042a8:	3e0080e7          	jalr	992(ra) # 80200684 <initlock>
  (*f0)->type = FD_PIPE;
    802042ac:	609c                	ld	a5,0(s1)
    802042ae:	0137a023          	sw	s3,0(a5)
  (*f0)->readable = 1;
    802042b2:	609c                	ld	a5,0(s1)
    802042b4:	01378423          	sb	s3,8(a5)
  (*f0)->writable = 0;
    802042b8:	609c                	ld	a5,0(s1)
    802042ba:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    802042be:	609c                	ld	a5,0(s1)
    802042c0:	0127b823          	sd	s2,16(a5)
  (*f1)->type = FD_PIPE;
    802042c4:	000a3783          	ld	a5,0(s4)
    802042c8:	0137a023          	sw	s3,0(a5)
  (*f1)->readable = 0;
    802042cc:	000a3783          	ld	a5,0(s4)
    802042d0:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    802042d4:	000a3783          	ld	a5,0(s4)
    802042d8:	013784a3          	sb	s3,9(a5)
  (*f1)->pipe = pi;
    802042dc:	000a3783          	ld	a5,0(s4)
    802042e0:	0127b823          	sd	s2,16(a5)
  return 0;
    802042e4:	4501                	li	a0,0
    802042e6:	a025                	j	8020430e <pipealloc+0xc6>

 bad:
  if(pi)
    kfree((char*)pi);
  if(*f0)
    802042e8:	6088                	ld	a0,0(s1)
    802042ea:	e501                	bnez	a0,802042f2 <pipealloc+0xaa>
    802042ec:	a039                	j	802042fa <pipealloc+0xb2>
    802042ee:	6088                	ld	a0,0(s1)
    802042f0:	c51d                	beqz	a0,8020431e <pipealloc+0xd6>
    fileclose(*f0);
    802042f2:	00000097          	auipc	ra,0x0
    802042f6:	be2080e7          	jalr	-1054(ra) # 80203ed4 <fileclose>
  if(*f1)
    802042fa:	000a3783          	ld	a5,0(s4)
    fileclose(*f1);
  return -1;
    802042fe:	557d                	li	a0,-1
  if(*f1)
    80204300:	c799                	beqz	a5,8020430e <pipealloc+0xc6>
    fileclose(*f1);
    80204302:	853e                	mv	a0,a5
    80204304:	00000097          	auipc	ra,0x0
    80204308:	bd0080e7          	jalr	-1072(ra) # 80203ed4 <fileclose>
  return -1;
    8020430c:	557d                	li	a0,-1
}
    8020430e:	70a2                	ld	ra,40(sp)
    80204310:	7402                	ld	s0,32(sp)
    80204312:	64e2                	ld	s1,24(sp)
    80204314:	6942                	ld	s2,16(sp)
    80204316:	69a2                	ld	s3,8(sp)
    80204318:	6a02                	ld	s4,0(sp)
    8020431a:	6145                	addi	sp,sp,48
    8020431c:	8082                	ret
  return -1;
    8020431e:	557d                	li	a0,-1
    80204320:	b7fd                	j	8020430e <pipealloc+0xc6>

0000000080204322 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    80204322:	1101                	addi	sp,sp,-32
    80204324:	ec06                	sd	ra,24(sp)
    80204326:	e822                	sd	s0,16(sp)
    80204328:	e426                	sd	s1,8(sp)
    8020432a:	e04a                	sd	s2,0(sp)
    8020432c:	1000                	addi	s0,sp,32
    8020432e:	84aa                	mv	s1,a0
    80204330:	892e                	mv	s2,a1
  acquire(&pi->lock);
    80204332:	ffffc097          	auipc	ra,0xffffc
    80204336:	396080e7          	jalr	918(ra) # 802006c8 <acquire>
  if(writable){
    8020433a:	02090d63          	beqz	s2,80204374 <pipeclose+0x52>
    pi->writeopen = 0;
    8020433e:	2204a223          	sw	zero,548(s1)
    wakeup(&pi->nread);
    80204342:	21848513          	addi	a0,s1,536
    80204346:	ffffe097          	auipc	ra,0xffffe
    8020434a:	0ee080e7          	jalr	238(ra) # 80202434 <wakeup>
  } else {
    pi->readopen = 0;
    wakeup(&pi->nwrite);
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    8020434e:	2204b783          	ld	a5,544(s1)
    80204352:	eb95                	bnez	a5,80204386 <pipeclose+0x64>
    release(&pi->lock);
    80204354:	8526                	mv	a0,s1
    80204356:	ffffc097          	auipc	ra,0xffffc
    8020435a:	3c6080e7          	jalr	966(ra) # 8020071c <release>
    kfree((char*)pi);
    8020435e:	8526                	mv	a0,s1
    80204360:	ffffc097          	auipc	ra,0xffffc
    80204364:	0e4080e7          	jalr	228(ra) # 80200444 <kfree>
  } else
    release(&pi->lock);
}
    80204368:	60e2                	ld	ra,24(sp)
    8020436a:	6442                	ld	s0,16(sp)
    8020436c:	64a2                	ld	s1,8(sp)
    8020436e:	6902                	ld	s2,0(sp)
    80204370:	6105                	addi	sp,sp,32
    80204372:	8082                	ret
    pi->readopen = 0;
    80204374:	2204a023          	sw	zero,544(s1)
    wakeup(&pi->nwrite);
    80204378:	21c48513          	addi	a0,s1,540
    8020437c:	ffffe097          	auipc	ra,0xffffe
    80204380:	0b8080e7          	jalr	184(ra) # 80202434 <wakeup>
    80204384:	b7e9                	j	8020434e <pipeclose+0x2c>
    release(&pi->lock);
    80204386:	8526                	mv	a0,s1
    80204388:	ffffc097          	auipc	ra,0xffffc
    8020438c:	394080e7          	jalr	916(ra) # 8020071c <release>
}
    80204390:	bfe1                	j	80204368 <pipeclose+0x46>

0000000080204392 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80204392:	7175                	addi	sp,sp,-144
    80204394:	e506                	sd	ra,136(sp)
    80204396:	e122                	sd	s0,128(sp)
    80204398:	fca6                	sd	s1,120(sp)
    8020439a:	f8ca                	sd	s2,112(sp)
    8020439c:	f4ce                	sd	s3,104(sp)
    8020439e:	f0d2                	sd	s4,96(sp)
    802043a0:	ecd6                	sd	s5,88(sp)
    802043a2:	e8da                	sd	s6,80(sp)
    802043a4:	e4de                	sd	s7,72(sp)
    802043a6:	e0e2                	sd	s8,64(sp)
    802043a8:	fc66                	sd	s9,56(sp)
    802043aa:	f86a                	sd	s10,48(sp)
    802043ac:	f46e                	sd	s11,40(sp)
    802043ae:	0900                	addi	s0,sp,144
    802043b0:	84aa                	mv	s1,a0
    802043b2:	f6b43c23          	sd	a1,-136(s0)
    802043b6:	8b32                	mv	s6,a2
  int i;
  char ch;
  struct proc *pr = myproc();
    802043b8:	ffffd097          	auipc	ra,0xffffd
    802043bc:	6a0080e7          	jalr	1696(ra) # 80201a58 <myproc>
    802043c0:	892a                	mv	s2,a0

  acquire(&pi->lock);
    802043c2:	8526                	mv	a0,s1
    802043c4:	ffffc097          	auipc	ra,0xffffc
    802043c8:	304080e7          	jalr	772(ra) # 802006c8 <acquire>
  for(i = 0; i < n; i++){
    802043cc:	0d605a63          	blez	s6,802044a0 <pipewrite+0x10e>
    802043d0:	89a6                	mv	s3,s1
    802043d2:	3b7d                	addiw	s6,s6,-1
    802043d4:	1b02                	slli	s6,s6,0x20
    802043d6:	020b5b13          	srli	s6,s6,0x20
    802043da:	4b81                	li	s7,0
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
      if(pi->readopen == 0 || pr->killed){
        release(&pi->lock);
        return -1;
      }
      wakeup(&pi->nread);
    802043dc:	21848a93          	addi	s5,s1,536
      sleep(&pi->nwrite, &pi->lock);
    802043e0:	21c48a13          	addi	s4,s1,540
    }
    // if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    if(copyin2(&ch, addr + i, 1) == -1)
    802043e4:	f8f40d93          	addi	s11,s0,-113
    802043e8:	5d7d                	li	s10,-1
    802043ea:	000b8c9b          	sext.w	s9,s7
    802043ee:	8c66                	mv	s8,s9
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    802043f0:	2184a783          	lw	a5,536(s1)
    802043f4:	21c4a703          	lw	a4,540(s1)
    802043f8:	2007879b          	addiw	a5,a5,512
    802043fc:	02f71b63          	bne	a4,a5,80204432 <pipewrite+0xa0>
      if(pi->readopen == 0 || pr->killed){
    80204400:	2204a783          	lw	a5,544(s1)
    80204404:	cba5                	beqz	a5,80204474 <pipewrite+0xe2>
    80204406:	03092783          	lw	a5,48(s2)
    8020440a:	e7ad                	bnez	a5,80204474 <pipewrite+0xe2>
      wakeup(&pi->nread);
    8020440c:	8556                	mv	a0,s5
    8020440e:	ffffe097          	auipc	ra,0xffffe
    80204412:	026080e7          	jalr	38(ra) # 80202434 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    80204416:	85ce                	mv	a1,s3
    80204418:	8552                	mv	a0,s4
    8020441a:	ffffe097          	auipc	ra,0xffffe
    8020441e:	e98080e7          	jalr	-360(ra) # 802022b2 <sleep>
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    80204422:	2184a783          	lw	a5,536(s1)
    80204426:	21c4a703          	lw	a4,540(s1)
    8020442a:	2007879b          	addiw	a5,a5,512
    8020442e:	fcf709e3          	beq	a4,a5,80204400 <pipewrite+0x6e>
    if(copyin2(&ch, addr + i, 1) == -1)
    80204432:	4605                	li	a2,1
    80204434:	f7843783          	ld	a5,-136(s0)
    80204438:	00fb85b3          	add	a1,s7,a5
    8020443c:	856e                	mv	a0,s11
    8020443e:	ffffd097          	auipc	ra,0xffffd
    80204442:	01c080e7          	jalr	28(ra) # 8020145a <copyin2>
    80204446:	05a50e63          	beq	a0,s10,802044a2 <pipewrite+0x110>
      break;
    pi->data[pi->nwrite++ % PIPESIZE] = ch;
    8020444a:	21c4a783          	lw	a5,540(s1)
    8020444e:	0017871b          	addiw	a4,a5,1
    80204452:	20e4ae23          	sw	a4,540(s1)
    80204456:	1ff7f793          	andi	a5,a5,511
    8020445a:	97a6                	add	a5,a5,s1
    8020445c:	f8f44703          	lbu	a4,-113(s0)
    80204460:	00e78c23          	sb	a4,24(a5)
  for(i = 0; i < n; i++){
    80204464:	001c8c1b          	addiw	s8,s9,1
    80204468:	001b8793          	addi	a5,s7,1
    8020446c:	036b8b63          	beq	s7,s6,802044a2 <pipewrite+0x110>
    80204470:	8bbe                	mv	s7,a5
    80204472:	bfa5                	j	802043ea <pipewrite+0x58>
        release(&pi->lock);
    80204474:	8526                	mv	a0,s1
    80204476:	ffffc097          	auipc	ra,0xffffc
    8020447a:	2a6080e7          	jalr	678(ra) # 8020071c <release>
        return -1;
    8020447e:	5c7d                	li	s8,-1
  }
  wakeup(&pi->nread);
  release(&pi->lock);
  return i;
}
    80204480:	8562                	mv	a0,s8
    80204482:	60aa                	ld	ra,136(sp)
    80204484:	640a                	ld	s0,128(sp)
    80204486:	74e6                	ld	s1,120(sp)
    80204488:	7946                	ld	s2,112(sp)
    8020448a:	79a6                	ld	s3,104(sp)
    8020448c:	7a06                	ld	s4,96(sp)
    8020448e:	6ae6                	ld	s5,88(sp)
    80204490:	6b46                	ld	s6,80(sp)
    80204492:	6ba6                	ld	s7,72(sp)
    80204494:	6c06                	ld	s8,64(sp)
    80204496:	7ce2                	ld	s9,56(sp)
    80204498:	7d42                	ld	s10,48(sp)
    8020449a:	7da2                	ld	s11,40(sp)
    8020449c:	6149                	addi	sp,sp,144
    8020449e:	8082                	ret
  for(i = 0; i < n; i++){
    802044a0:	4c01                	li	s8,0
  wakeup(&pi->nread);
    802044a2:	21848513          	addi	a0,s1,536
    802044a6:	ffffe097          	auipc	ra,0xffffe
    802044aa:	f8e080e7          	jalr	-114(ra) # 80202434 <wakeup>
  release(&pi->lock);
    802044ae:	8526                	mv	a0,s1
    802044b0:	ffffc097          	auipc	ra,0xffffc
    802044b4:	26c080e7          	jalr	620(ra) # 8020071c <release>
  return i;
    802044b8:	b7e1                	j	80204480 <pipewrite+0xee>

00000000802044ba <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    802044ba:	715d                	addi	sp,sp,-80
    802044bc:	e486                	sd	ra,72(sp)
    802044be:	e0a2                	sd	s0,64(sp)
    802044c0:	fc26                	sd	s1,56(sp)
    802044c2:	f84a                	sd	s2,48(sp)
    802044c4:	f44e                	sd	s3,40(sp)
    802044c6:	f052                	sd	s4,32(sp)
    802044c8:	ec56                	sd	s5,24(sp)
    802044ca:	e85a                	sd	s6,16(sp)
    802044cc:	0880                	addi	s0,sp,80
    802044ce:	84aa                	mv	s1,a0
    802044d0:	892e                	mv	s2,a1
    802044d2:	8a32                	mv	s4,a2
  int i;
  struct proc *pr = myproc();
    802044d4:	ffffd097          	auipc	ra,0xffffd
    802044d8:	584080e7          	jalr	1412(ra) # 80201a58 <myproc>
    802044dc:	89aa                	mv	s3,a0
  char ch;

  acquire(&pi->lock);
    802044de:	8b26                	mv	s6,s1
    802044e0:	8526                	mv	a0,s1
    802044e2:	ffffc097          	auipc	ra,0xffffc
    802044e6:	1e6080e7          	jalr	486(ra) # 802006c8 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    802044ea:	2184a703          	lw	a4,536(s1)
    802044ee:	21c4a783          	lw	a5,540(s1)
    if(pr->killed){
      release(&pi->lock);
      return -1;
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    802044f2:	21848a93          	addi	s5,s1,536
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    802044f6:	02f71463          	bne	a4,a5,8020451e <piperead+0x64>
    802044fa:	2244a783          	lw	a5,548(s1)
    802044fe:	c385                	beqz	a5,8020451e <piperead+0x64>
    if(pr->killed){
    80204500:	0309a783          	lw	a5,48(s3)
    80204504:	e7d9                	bnez	a5,80204592 <piperead+0xd8>
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80204506:	85da                	mv	a1,s6
    80204508:	8556                	mv	a0,s5
    8020450a:	ffffe097          	auipc	ra,0xffffe
    8020450e:	da8080e7          	jalr	-600(ra) # 802022b2 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80204512:	2184a703          	lw	a4,536(s1)
    80204516:	21c4a783          	lw	a5,540(s1)
    8020451a:	fef700e3          	beq	a4,a5,802044fa <piperead+0x40>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8020451e:	09405163          	blez	s4,802045a0 <piperead+0xe6>
    80204522:	4981                	li	s3,0
    if(pi->nread == pi->nwrite)
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    // if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    if(copyout2(addr + i, &ch, 1) == -1)
    80204524:	fbf40b13          	addi	s6,s0,-65
    80204528:	5afd                	li	s5,-1
    if(pi->nread == pi->nwrite)
    8020452a:	2184a783          	lw	a5,536(s1)
    8020452e:	21c4a703          	lw	a4,540(s1)
    80204532:	02f70a63          	beq	a4,a5,80204566 <piperead+0xac>
    ch = pi->data[pi->nread++ % PIPESIZE];
    80204536:	0017871b          	addiw	a4,a5,1
    8020453a:	20e4ac23          	sw	a4,536(s1)
    8020453e:	1ff7f793          	andi	a5,a5,511
    80204542:	97a6                	add	a5,a5,s1
    80204544:	0187c783          	lbu	a5,24(a5)
    80204548:	faf40fa3          	sb	a5,-65(s0)
    if(copyout2(addr + i, &ch, 1) == -1)
    8020454c:	4605                	li	a2,1
    8020454e:	85da                	mv	a1,s6
    80204550:	854a                	mv	a0,s2
    80204552:	ffffd097          	auipc	ra,0xffffd
    80204556:	e2a080e7          	jalr	-470(ra) # 8020137c <copyout2>
    8020455a:	01550663          	beq	a0,s5,80204566 <piperead+0xac>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8020455e:	2985                	addiw	s3,s3,1
    80204560:	0905                	addi	s2,s2,1
    80204562:	fd3a14e3          	bne	s4,s3,8020452a <piperead+0x70>
      break;
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    80204566:	21c48513          	addi	a0,s1,540
    8020456a:	ffffe097          	auipc	ra,0xffffe
    8020456e:	eca080e7          	jalr	-310(ra) # 80202434 <wakeup>
  release(&pi->lock);
    80204572:	8526                	mv	a0,s1
    80204574:	ffffc097          	auipc	ra,0xffffc
    80204578:	1a8080e7          	jalr	424(ra) # 8020071c <release>
  return i;
}
    8020457c:	854e                	mv	a0,s3
    8020457e:	60a6                	ld	ra,72(sp)
    80204580:	6406                	ld	s0,64(sp)
    80204582:	74e2                	ld	s1,56(sp)
    80204584:	7942                	ld	s2,48(sp)
    80204586:	79a2                	ld	s3,40(sp)
    80204588:	7a02                	ld	s4,32(sp)
    8020458a:	6ae2                	ld	s5,24(sp)
    8020458c:	6b42                	ld	s6,16(sp)
    8020458e:	6161                	addi	sp,sp,80
    80204590:	8082                	ret
      release(&pi->lock);
    80204592:	8526                	mv	a0,s1
    80204594:	ffffc097          	auipc	ra,0xffffc
    80204598:	188080e7          	jalr	392(ra) # 8020071c <release>
      return -1;
    8020459c:	59fd                	li	s3,-1
    8020459e:	bff9                	j	8020457c <piperead+0xc2>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    802045a0:	4981                	li	s3,0
    802045a2:	b7d1                	j	80204566 <piperead+0xac>

00000000802045a4 <exec>:
  return 0;
}


int exec(char *path, char **argv)
{
    802045a4:	dd010113          	addi	sp,sp,-560
    802045a8:	22113423          	sd	ra,552(sp)
    802045ac:	22813023          	sd	s0,544(sp)
    802045b0:	20913c23          	sd	s1,536(sp)
    802045b4:	21213823          	sd	s2,528(sp)
    802045b8:	21313423          	sd	s3,520(sp)
    802045bc:	21413023          	sd	s4,512(sp)
    802045c0:	ffd6                	sd	s5,504(sp)
    802045c2:	fbda                	sd	s6,496(sp)
    802045c4:	f7de                	sd	s7,488(sp)
    802045c6:	f3e2                	sd	s8,480(sp)
    802045c8:	efe6                	sd	s9,472(sp)
    802045ca:	ebea                	sd	s10,464(sp)
    802045cc:	e7ee                	sd	s11,456(sp)
    802045ce:	1c00                	addi	s0,sp,560
    802045d0:	892a                	mv	s2,a0
    802045d2:	dca43c23          	sd	a0,-552(s0)
    802045d6:	deb43423          	sd	a1,-536(s0)
  struct elfhdr elf;
  struct dirent *ep;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
  pagetable_t kpagetable = 0, oldkpagetable;
  struct proc *p = myproc();
    802045da:	ffffd097          	auipc	ra,0xffffd
    802045de:	47e080e7          	jalr	1150(ra) # 80201a58 <myproc>
    802045e2:	84aa                	mv	s1,a0

  // Make a copy of p->kpt without old user space, 
  // but with the same kstack we are using now, which can't be changed
  if ((kpagetable = (pagetable_t)kalloc()) == NULL) {
    802045e4:	ffffc097          	auipc	ra,0xffffc
    802045e8:	f78080e7          	jalr	-136(ra) # 8020055c <kalloc>
    802045ec:	2a050763          	beqz	a0,8020489a <exec+0x2f6>
    802045f0:	8aaa                	mv	s5,a0
    return -1;
  }
  memmove(kpagetable, p->kpagetable, PGSIZE);
    802045f2:	6605                	lui	a2,0x1
    802045f4:	6cac                	ld	a1,88(s1)
    802045f6:	ffffc097          	auipc	ra,0xffffc
    802045fa:	1ce080e7          	jalr	462(ra) # 802007c4 <memmove>
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    kpagetable[i] = 0;
    802045fe:	000ab023          	sd	zero,0(s5)
    80204602:	000ab423          	sd	zero,8(s5)
  }

  if((ep = ename(path)) == NULL) {
    80204606:	854a                	mv	a0,s2
    80204608:	00003097          	auipc	ra,0x3
    8020460c:	404080e7          	jalr	1028(ra) # 80207a0c <ename>
    80204610:	8a2a                	mv	s4,a0
    80204612:	3a050d63          	beqz	a0,802049cc <exec+0x428>
    #ifdef DEBUG
    printf("[exec] %s not found\n", path);
    #endif
    goto bad;
  }
  elock(ep);
    80204616:	00003097          	auipc	ra,0x3
    8020461a:	c4c080e7          	jalr	-948(ra) # 80207262 <elock>

  // Check ELF header
  if(eread(ep, 0, (uint64) &elf, 0, sizeof(elf)) != sizeof(elf))
    8020461e:	04000713          	li	a4,64
    80204622:	4681                	li	a3,0
    80204624:	e4840613          	addi	a2,s0,-440
    80204628:	4581                	li	a1,0
    8020462a:	8552                	mv	a0,s4
    8020462c:	00002097          	auipc	ra,0x2
    80204630:	34c080e7          	jalr	844(ra) # 80206978 <eread>
    80204634:	04000793          	li	a5,64
    80204638:	00f51a63          	bne	a0,a5,8020464c <exec+0xa8>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    8020463c:	e4842703          	lw	a4,-440(s0)
    80204640:	464c47b7          	lui	a5,0x464c4
    80204644:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39d3ba81>
    80204648:	00f70963          	beq	a4,a5,8020465a <exec+0xb6>
  printf("[exec] reach bad\n");
  #endif
  if(pagetable)
    proc_freepagetable(pagetable, sz);
  if(kpagetable)
    kvmfree(kpagetable, 0);
    8020464c:	4581                	li	a1,0
    8020464e:	8556                	mv	a0,s5
    80204650:	ffffd097          	auipc	ra,0xffffd
    80204654:	02e080e7          	jalr	46(ra) # 8020167e <kvmfree>
  if(ep){
    80204658:	a4b5                	j	802048c4 <exec+0x320>
  if((pagetable = proc_pagetable(p)) == NULL)
    8020465a:	8526                	mv	a0,s1
    8020465c:	ffffd097          	auipc	ra,0xffffd
    80204660:	4e0080e7          	jalr	1248(ra) # 80201b3c <proc_pagetable>
    80204664:	e0a43423          	sd	a0,-504(s0)
    80204668:	d175                	beqz	a0,8020464c <exec+0xa8>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8020466a:	e6842783          	lw	a5,-408(s0)
    8020466e:	e8045703          	lhu	a4,-384(s0)
    80204672:	cb3d                	beqz	a4,802046e8 <exec+0x144>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    80204674:	4481                	li	s1,0
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80204676:	e0043023          	sd	zero,-512(s0)
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    8020467a:	e1040713          	addi	a4,s0,-496
    8020467e:	dee43023          	sd	a4,-544(s0)
    if(ph.vaddr % PGSIZE != 0)
    80204682:	6b05                	lui	s6,0x1
    80204684:	fffb0713          	addi	a4,s6,-1 # fff <_entry-0x801ff001>
    80204688:	dce43823          	sd	a4,-560(s0)
  for(i = 0; i < sz; i += PGSIZE){
    8020468c:	6d85                	lui	s11,0x1
    8020468e:	7bfd                	lui	s7,0xfffff
    80204690:	a4c1                	j	80204950 <exec+0x3ac>
      panic("loadseg: address should exist");
    80204692:	00006517          	auipc	a0,0x6
    80204696:	5e650513          	addi	a0,a0,1510 # 8020ac78 <digits+0x8f8>
    8020469a:	ffffc097          	auipc	ra,0xffffc
    8020469e:	aa8080e7          	jalr	-1368(ra) # 80200142 <panic>
    if(eread(ep, 0, (uint64)pa, offset+i, n) != n)
    802046a2:	874e                	mv	a4,s3
    802046a4:	009d06bb          	addw	a3,s10,s1
    802046a8:	4581                	li	a1,0
    802046aa:	8552                	mv	a0,s4
    802046ac:	00002097          	auipc	ra,0x2
    802046b0:	2cc080e7          	jalr	716(ra) # 80206978 <eread>
    802046b4:	2501                	sext.w	a0,a0
    802046b6:	1ea99663          	bne	s3,a0,802048a2 <exec+0x2fe>
  for(i = 0; i < sz; i += PGSIZE){
    802046ba:	009d84bb          	addw	s1,s11,s1
    802046be:	012b893b          	addw	s2,s7,s2
    802046c2:	2784f763          	bgeu	s1,s8,80204930 <exec+0x38c>
    pa = walkaddr(pagetable, va + i);
    802046c6:	02049593          	slli	a1,s1,0x20
    802046ca:	9181                	srli	a1,a1,0x20
    802046cc:	95e6                	add	a1,a1,s9
    802046ce:	e0843503          	ld	a0,-504(s0)
    802046d2:	ffffc097          	auipc	ra,0xffffc
    802046d6:	4ea080e7          	jalr	1258(ra) # 80200bbc <walkaddr>
    802046da:	862a                	mv	a2,a0
    if(pa == NULL)
    802046dc:	d95d                	beqz	a0,80204692 <exec+0xee>
      n = PGSIZE;
    802046de:	89da                	mv	s3,s6
    if(sz - i < PGSIZE)
    802046e0:	fd6971e3          	bgeu	s2,s6,802046a2 <exec+0xfe>
      n = sz - i;
    802046e4:	89ca                	mv	s3,s2
    802046e6:	bf75                	j	802046a2 <exec+0xfe>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    802046e8:	4481                	li	s1,0
  eunlock(ep);
    802046ea:	8552                	mv	a0,s4
    802046ec:	00003097          	auipc	ra,0x3
    802046f0:	bac080e7          	jalr	-1108(ra) # 80207298 <eunlock>
  eput(ep);
    802046f4:	8552                	mv	a0,s4
    802046f6:	00003097          	auipc	ra,0x3
    802046fa:	bf0080e7          	jalr	-1040(ra) # 802072e6 <eput>
  p = myproc();
    802046fe:	ffffd097          	auipc	ra,0xffffd
    80204702:	35a080e7          	jalr	858(ra) # 80201a58 <myproc>
    80204706:	8b2a                	mv	s6,a0
  uint64 oldsz = p->sz;
    80204708:	04853d83          	ld	s11,72(a0)
  sz = PGROUNDUP(sz);
    8020470c:	6785                	lui	a5,0x1
    8020470e:	17fd                	addi	a5,a5,-1
    80204710:	94be                	add	s1,s1,a5
    80204712:	77fd                	lui	a5,0xfffff
    80204714:	8fe5                	and	a5,a5,s1
    80204716:	def43823          	sd	a5,-528(s0)
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    8020471a:	6689                	lui	a3,0x2
    8020471c:	96be                	add	a3,a3,a5
    8020471e:	863e                	mv	a2,a5
    80204720:	85d6                	mv	a1,s5
    80204722:	e0843483          	ld	s1,-504(s0)
    80204726:	8526                	mv	a0,s1
    80204728:	ffffd097          	auipc	ra,0xffffd
    8020472c:	8f0080e7          	jalr	-1808(ra) # 80201018 <uvmalloc>
    80204730:	8d2a                	mv	s10,a0
  ep = 0;
    80204732:	4a01                	li	s4,0
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    80204734:	16050763          	beqz	a0,802048a2 <exec+0x2fe>
  uvmclear(pagetable, sz-2*PGSIZE);
    80204738:	75f9                	lui	a1,0xffffe
    8020473a:	95aa                	add	a1,a1,a0
    8020473c:	8526                	mv	a0,s1
    8020473e:	ffffd097          	auipc	ra,0xffffd
    80204742:	b80080e7          	jalr	-1152(ra) # 802012be <uvmclear>
  stackbase = sp - PGSIZE;
    80204746:	7c7d                	lui	s8,0xfffff
    80204748:	9c6a                	add	s8,s8,s10
  for(argc = 0; argv[argc]; argc++) {
    8020474a:	de843783          	ld	a5,-536(s0)
    8020474e:	6388                	ld	a0,0(a5)
    80204750:	c925                	beqz	a0,802047c0 <exec+0x21c>
    80204752:	e8840993          	addi	s3,s0,-376
    80204756:	f8840c93          	addi	s9,s0,-120
  sp = sz;
    8020475a:	896a                	mv	s2,s10
  for(argc = 0; argv[argc]; argc++) {
    8020475c:	4481                	li	s1,0
    sp -= strlen(argv[argc]) + 1;
    8020475e:	ffffc097          	auipc	ra,0xffffc
    80204762:	18e080e7          	jalr	398(ra) # 802008ec <strlen>
    80204766:	2505                	addiw	a0,a0,1
    80204768:	40a90933          	sub	s2,s2,a0
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    8020476c:	ff097913          	andi	s2,s2,-16
    if(sp < stackbase)
    80204770:	1b896463          	bltu	s2,s8,80204918 <exec+0x374>
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    80204774:	de843b83          	ld	s7,-536(s0)
    80204778:	000bba03          	ld	s4,0(s7) # fffffffffffff000 <kernel_end+0xffffffff7fdca000>
    8020477c:	8552                	mv	a0,s4
    8020477e:	ffffc097          	auipc	ra,0xffffc
    80204782:	16e080e7          	jalr	366(ra) # 802008ec <strlen>
    80204786:	0015069b          	addiw	a3,a0,1
    8020478a:	8652                	mv	a2,s4
    8020478c:	85ca                	mv	a1,s2
    8020478e:	e0843503          	ld	a0,-504(s0)
    80204792:	ffffd097          	auipc	ra,0xffffd
    80204796:	b5e080e7          	jalr	-1186(ra) # 802012f0 <copyout>
    8020479a:	18054363          	bltz	a0,80204920 <exec+0x37c>
    ustack[argc] = sp;
    8020479e:	0129b023          	sd	s2,0(s3)
  for(argc = 0; argv[argc]; argc++) {
    802047a2:	0485                	addi	s1,s1,1
    802047a4:	008b8793          	addi	a5,s7,8
    802047a8:	def43423          	sd	a5,-536(s0)
    802047ac:	008bb503          	ld	a0,8(s7)
    802047b0:	c911                	beqz	a0,802047c4 <exec+0x220>
    if(argc >= MAXARG)
    802047b2:	09a1                	addi	s3,s3,8
    802047b4:	fb3c95e3          	bne	s9,s3,8020475e <exec+0x1ba>
  sz = sz1;
    802047b8:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    802047bc:	4a01                	li	s4,0
    802047be:	a0d5                	j	802048a2 <exec+0x2fe>
  sp = sz;
    802047c0:	896a                	mv	s2,s10
  for(argc = 0; argv[argc]; argc++) {
    802047c2:	4481                	li	s1,0
  ustack[argc] = 0;
    802047c4:	00349793          	slli	a5,s1,0x3
    802047c8:	f9040713          	addi	a4,s0,-112
    802047cc:	97ba                	add	a5,a5,a4
    802047ce:	ee07bc23          	sd	zero,-264(a5) # ffffffffffffeef8 <kernel_end+0xffffffff7fdc9ef8>
  sp -= (argc+1) * sizeof(uint64);
    802047d2:	00148693          	addi	a3,s1,1
    802047d6:	068e                	slli	a3,a3,0x3
    802047d8:	40d90933          	sub	s2,s2,a3
  sp -= sp % 16;
    802047dc:	ff097913          	andi	s2,s2,-16
  if(sp < stackbase)
    802047e0:	01897663          	bgeu	s2,s8,802047ec <exec+0x248>
  sz = sz1;
    802047e4:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    802047e8:	4a01                	li	s4,0
    802047ea:	a865                	j	802048a2 <exec+0x2fe>
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    802047ec:	e8840613          	addi	a2,s0,-376
    802047f0:	85ca                	mv	a1,s2
    802047f2:	e0843503          	ld	a0,-504(s0)
    802047f6:	ffffd097          	auipc	ra,0xffffd
    802047fa:	afa080e7          	jalr	-1286(ra) # 802012f0 <copyout>
    802047fe:	12054563          	bltz	a0,80204928 <exec+0x384>
  p->trapframe->a1 = sp;
    80204802:	060b3783          	ld	a5,96(s6)
    80204806:	0727bc23          	sd	s2,120(a5)
  for(last=s=path; *s; s++)
    8020480a:	dd843783          	ld	a5,-552(s0)
    8020480e:	0007c703          	lbu	a4,0(a5)
    80204812:	cf11                	beqz	a4,8020482e <exec+0x28a>
    80204814:	0785                	addi	a5,a5,1
    if(*s == '/')
    80204816:	02f00693          	li	a3,47
    8020481a:	a029                	j	80204824 <exec+0x280>
  for(last=s=path; *s; s++)
    8020481c:	0785                	addi	a5,a5,1
    8020481e:	fff7c703          	lbu	a4,-1(a5)
    80204822:	c711                	beqz	a4,8020482e <exec+0x28a>
    if(*s == '/')
    80204824:	fed71ce3          	bne	a4,a3,8020481c <exec+0x278>
      last = s+1;
    80204828:	dcf43c23          	sd	a5,-552(s0)
    8020482c:	bfc5                	j	8020481c <exec+0x278>
  safestrcpy(p->name, last, sizeof(p->name));
    8020482e:	4641                	li	a2,16
    80204830:	dd843583          	ld	a1,-552(s0)
    80204834:	4e0b0513          	addi	a0,s6,1248
    80204838:	ffffc097          	auipc	ra,0xffffc
    8020483c:	082080e7          	jalr	130(ra) # 802008ba <safestrcpy>
  oldpagetable = p->pagetable;
    80204840:	050b3503          	ld	a0,80(s6)
  oldkpagetable = p->kpagetable;
    80204844:	058b3983          	ld	s3,88(s6)
  p->pagetable = pagetable;
    80204848:	e0843783          	ld	a5,-504(s0)
    8020484c:	04fb3823          	sd	a5,80(s6)
  p->kpagetable = kpagetable;
    80204850:	055b3c23          	sd	s5,88(s6)
  p->sz = sz;
    80204854:	05ab3423          	sd	s10,72(s6)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80204858:	060b3783          	ld	a5,96(s6)
    8020485c:	e6043703          	ld	a4,-416(s0)
    80204860:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    80204862:	060b3783          	ld	a5,96(s6)
    80204866:	0327b823          	sd	s2,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    8020486a:	85ee                	mv	a1,s11
    8020486c:	ffffd097          	auipc	ra,0xffffd
    80204870:	36c080e7          	jalr	876(ra) # 80201bd8 <proc_freepagetable>
  w_satp(MAKE_SATP(p->kpagetable));
    80204874:	058b3783          	ld	a5,88(s6)
    80204878:	83b1                	srli	a5,a5,0xc
    8020487a:	577d                	li	a4,-1
    8020487c:	177e                	slli	a4,a4,0x3f
    8020487e:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    80204880:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    80204884:	12000073          	sfence.vma
  kvmfree(oldkpagetable, 0);
    80204888:	4581                	li	a1,0
    8020488a:	854e                	mv	a0,s3
    8020488c:	ffffd097          	auipc	ra,0xffffd
    80204890:	df2080e7          	jalr	-526(ra) # 8020167e <kvmfree>
  return argc; // this ends up in a0, the first argument to main(argc, argv)
    80204894:	0004851b          	sext.w	a0,s1
    80204898:	a089                	j	802048da <exec+0x336>
    return -1;
    8020489a:	557d                	li	a0,-1
    8020489c:	a83d                	j	802048da <exec+0x336>
    8020489e:	de943823          	sd	s1,-528(s0)
    proc_freepagetable(pagetable, sz);
    802048a2:	df043583          	ld	a1,-528(s0)
    802048a6:	e0843503          	ld	a0,-504(s0)
    802048aa:	ffffd097          	auipc	ra,0xffffd
    802048ae:	32e080e7          	jalr	814(ra) # 80201bd8 <proc_freepagetable>
    kvmfree(kpagetable, 0);
    802048b2:	4581                	li	a1,0
    802048b4:	8556                	mv	a0,s5
    802048b6:	ffffd097          	auipc	ra,0xffffd
    802048ba:	dc8080e7          	jalr	-568(ra) # 8020167e <kvmfree>
    eunlock(ep);
    eput(ep);
  }
  return -1;
    802048be:	557d                	li	a0,-1
  if(ep){
    802048c0:	000a0d63          	beqz	s4,802048da <exec+0x336>
    eunlock(ep);
    802048c4:	8552                	mv	a0,s4
    802048c6:	00003097          	auipc	ra,0x3
    802048ca:	9d2080e7          	jalr	-1582(ra) # 80207298 <eunlock>
    eput(ep);
    802048ce:	8552                	mv	a0,s4
    802048d0:	00003097          	auipc	ra,0x3
    802048d4:	a16080e7          	jalr	-1514(ra) # 802072e6 <eput>
  return -1;
    802048d8:	557d                	li	a0,-1
}
    802048da:	22813083          	ld	ra,552(sp)
    802048de:	22013403          	ld	s0,544(sp)
    802048e2:	21813483          	ld	s1,536(sp)
    802048e6:	21013903          	ld	s2,528(sp)
    802048ea:	20813983          	ld	s3,520(sp)
    802048ee:	20013a03          	ld	s4,512(sp)
    802048f2:	7afe                	ld	s5,504(sp)
    802048f4:	7b5e                	ld	s6,496(sp)
    802048f6:	7bbe                	ld	s7,488(sp)
    802048f8:	7c1e                	ld	s8,480(sp)
    802048fa:	6cfe                	ld	s9,472(sp)
    802048fc:	6d5e                	ld	s10,464(sp)
    802048fe:	6dbe                	ld	s11,456(sp)
    80204900:	23010113          	addi	sp,sp,560
    80204904:	8082                	ret
    80204906:	de943823          	sd	s1,-528(s0)
    8020490a:	bf61                	j	802048a2 <exec+0x2fe>
    8020490c:	de943823          	sd	s1,-528(s0)
    80204910:	bf49                	j	802048a2 <exec+0x2fe>
    80204912:	de943823          	sd	s1,-528(s0)
    80204916:	b771                	j	802048a2 <exec+0x2fe>
  sz = sz1;
    80204918:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    8020491c:	4a01                	li	s4,0
    8020491e:	b751                	j	802048a2 <exec+0x2fe>
  sz = sz1;
    80204920:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    80204924:	4a01                	li	s4,0
    80204926:	bfb5                	j	802048a2 <exec+0x2fe>
  sz = sz1;
    80204928:	dfa43823          	sd	s10,-528(s0)
  ep = 0;
    8020492c:	4a01                	li	s4,0
    8020492e:	bf95                	j	802048a2 <exec+0x2fe>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80204930:	df043483          	ld	s1,-528(s0)
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80204934:	e0043783          	ld	a5,-512(s0)
    80204938:	0017869b          	addiw	a3,a5,1
    8020493c:	e0d43023          	sd	a3,-512(s0)
    80204940:	df843783          	ld	a5,-520(s0)
    80204944:	0387879b          	addiw	a5,a5,56
    80204948:	e8045703          	lhu	a4,-384(s0)
    8020494c:	d8e6dfe3          	bge	a3,a4,802046ea <exec+0x146>
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80204950:	2781                	sext.w	a5,a5
    80204952:	def43c23          	sd	a5,-520(s0)
    80204956:	03800713          	li	a4,56
    8020495a:	86be                	mv	a3,a5
    8020495c:	de043603          	ld	a2,-544(s0)
    80204960:	4581                	li	a1,0
    80204962:	8552                	mv	a0,s4
    80204964:	00002097          	auipc	ra,0x2
    80204968:	014080e7          	jalr	20(ra) # 80206978 <eread>
    8020496c:	03800793          	li	a5,56
    80204970:	f2f517e3          	bne	a0,a5,8020489e <exec+0x2fa>
    if(ph.type != ELF_PROG_LOAD)
    80204974:	e1042783          	lw	a5,-496(s0)
    80204978:	4705                	li	a4,1
    8020497a:	fae79de3          	bne	a5,a4,80204934 <exec+0x390>
    if(ph.memsz < ph.filesz)
    8020497e:	e3843683          	ld	a3,-456(s0)
    80204982:	e3043783          	ld	a5,-464(s0)
    80204986:	f8f6e0e3          	bltu	a3,a5,80204906 <exec+0x362>
    if(ph.vaddr + ph.memsz < ph.vaddr)
    8020498a:	e2043783          	ld	a5,-480(s0)
    8020498e:	96be                	add	a3,a3,a5
    80204990:	f6f6eee3          	bltu	a3,a5,8020490c <exec+0x368>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80204994:	8626                	mv	a2,s1
    80204996:	85d6                	mv	a1,s5
    80204998:	e0843503          	ld	a0,-504(s0)
    8020499c:	ffffc097          	auipc	ra,0xffffc
    802049a0:	67c080e7          	jalr	1660(ra) # 80201018 <uvmalloc>
    802049a4:	dea43823          	sd	a0,-528(s0)
    802049a8:	d52d                	beqz	a0,80204912 <exec+0x36e>
    if(ph.vaddr % PGSIZE != 0)
    802049aa:	e2043c83          	ld	s9,-480(s0)
    802049ae:	dd043783          	ld	a5,-560(s0)
    802049b2:	00fcf7b3          	and	a5,s9,a5
    802049b6:	ee0796e3          	bnez	a5,802048a2 <exec+0x2fe>
    if(loadseg(pagetable, ph.vaddr, ep, ph.off, ph.filesz) < 0)
    802049ba:	e1842d03          	lw	s10,-488(s0)
    802049be:	e3042c03          	lw	s8,-464(s0)
  for(i = 0; i < sz; i += PGSIZE){
    802049c2:	f60c07e3          	beqz	s8,80204930 <exec+0x38c>
    802049c6:	8962                	mv	s2,s8
    802049c8:	4481                	li	s1,0
    802049ca:	b9f5                	j	802046c6 <exec+0x122>
    kvmfree(kpagetable, 0);
    802049cc:	4581                	li	a1,0
    802049ce:	8556                	mv	a0,s5
    802049d0:	ffffd097          	auipc	ra,0xffffd
    802049d4:	cae080e7          	jalr	-850(ra) # 8020167e <kvmfree>
  return -1;
    802049d8:	557d                	li	a0,-1
    802049da:	b701                	j	802048da <exec+0x336>

00000000802049dc <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    802049dc:	7179                	addi	sp,sp,-48
    802049de:	f406                	sd	ra,40(sp)
    802049e0:	f022                	sd	s0,32(sp)
    802049e2:	ec26                	sd	s1,24(sp)
    802049e4:	e84a                	sd	s2,16(sp)
    802049e6:	1800                	addi	s0,sp,48
    802049e8:	892e                	mv	s2,a1
    802049ea:	84b2                	mv	s1,a2
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    802049ec:	fdc40593          	addi	a1,s0,-36
    802049f0:	ffffe097          	auipc	ra,0xffffe
    802049f4:	61e080e7          	jalr	1566(ra) # 8020300e <argint>
    802049f8:	04054163          	bltz	a0,80204a3a <argfd+0x5e>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == NULL)
    802049fc:	fdc42703          	lw	a4,-36(s0)
    80204a00:	07f00793          	li	a5,127
    80204a04:	02e7ed63          	bltu	a5,a4,80204a3e <argfd+0x62>
    80204a08:	ffffd097          	auipc	ra,0xffffd
    80204a0c:	050080e7          	jalr	80(ra) # 80201a58 <myproc>
    80204a10:	fdc42703          	lw	a4,-36(s0)
    80204a14:	01a70793          	addi	a5,a4,26
    80204a18:	078e                	slli	a5,a5,0x3
    80204a1a:	953e                	add	a0,a0,a5
    80204a1c:	651c                	ld	a5,8(a0)
    80204a1e:	c395                	beqz	a5,80204a42 <argfd+0x66>
    return -1;
  if(pfd)
    80204a20:	00090463          	beqz	s2,80204a28 <argfd+0x4c>
    *pfd = fd;
    80204a24:	00e92023          	sw	a4,0(s2)
  if(pf)
    *pf = f;
  return 0;
    80204a28:	4501                	li	a0,0
  if(pf)
    80204a2a:	c091                	beqz	s1,80204a2e <argfd+0x52>
    *pf = f;
    80204a2c:	e09c                	sd	a5,0(s1)
}
    80204a2e:	70a2                	ld	ra,40(sp)
    80204a30:	7402                	ld	s0,32(sp)
    80204a32:	64e2                	ld	s1,24(sp)
    80204a34:	6942                	ld	s2,16(sp)
    80204a36:	6145                	addi	sp,sp,48
    80204a38:	8082                	ret
    return -1;
    80204a3a:	557d                	li	a0,-1
    80204a3c:	bfcd                	j	80204a2e <argfd+0x52>
    return -1;
    80204a3e:	557d                	li	a0,-1
    80204a40:	b7fd                	j	80204a2e <argfd+0x52>
    80204a42:	557d                	li	a0,-1
    80204a44:	b7ed                	j	80204a2e <argfd+0x52>

0000000080204a46 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80204a46:	1101                	addi	sp,sp,-32
    80204a48:	ec06                	sd	ra,24(sp)
    80204a4a:	e822                	sd	s0,16(sp)
    80204a4c:	e426                	sd	s1,8(sp)
    80204a4e:	1000                	addi	s0,sp,32
    80204a50:	84aa                	mv	s1,a0
  int fd;
  struct proc *p = myproc();
    80204a52:	ffffd097          	auipc	ra,0xffffd
    80204a56:	006080e7          	jalr	6(ra) # 80201a58 <myproc>
    80204a5a:	862a                	mv	a2,a0

  for(fd = 0; fd < NOFILE; fd++){
    80204a5c:	0d850793          	addi	a5,a0,216
    80204a60:	4501                	li	a0,0
    80204a62:	08000693          	li	a3,128
    if(p->ofile[fd] == 0){
    80204a66:	6398                	ld	a4,0(a5)
    80204a68:	c719                	beqz	a4,80204a76 <fdalloc+0x30>
  for(fd = 0; fd < NOFILE; fd++){
    80204a6a:	2505                	addiw	a0,a0,1
    80204a6c:	07a1                	addi	a5,a5,8
    80204a6e:	fed51ce3          	bne	a0,a3,80204a66 <fdalloc+0x20>
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
    80204a72:	557d                	li	a0,-1
    80204a74:	a031                	j	80204a80 <fdalloc+0x3a>
      p->ofile[fd] = f;
    80204a76:	01a50793          	addi	a5,a0,26
    80204a7a:	078e                	slli	a5,a5,0x3
    80204a7c:	963e                	add	a2,a2,a5
    80204a7e:	e604                	sd	s1,8(a2)
}
    80204a80:	60e2                	ld	ra,24(sp)
    80204a82:	6442                	ld	s0,16(sp)
    80204a84:	64a2                	ld	s1,8(sp)
    80204a86:	6105                	addi	sp,sp,32
    80204a88:	8082                	ret

0000000080204a8a <create>:
  return filestat(f, st);
}

static struct dirent*
create(char *path, short type, int mode)
{
    80204a8a:	7169                	addi	sp,sp,-304
    80204a8c:	f606                	sd	ra,296(sp)
    80204a8e:	f222                	sd	s0,288(sp)
    80204a90:	ee26                	sd	s1,280(sp)
    80204a92:	ea4a                	sd	s2,272(sp)
    80204a94:	e64e                	sd	s3,264(sp)
    80204a96:	1a00                	addi	s0,sp,304
    80204a98:	89ae                	mv	s3,a1
  struct dirent *ep, *dp;
  char name[FAT32_MAX_FILENAME + 1];

  if((dp = enameparent(path, name)) == NULL)
    80204a9a:	ed040593          	addi	a1,s0,-304
    80204a9e:	00003097          	auipc	ra,0x3
    80204aa2:	f8c080e7          	jalr	-116(ra) # 80207a2a <enameparent>
    80204aa6:	84aa                	mv	s1,a0
    80204aa8:	cd3d                	beqz	a0,80204b26 <create+0x9c>
    return NULL;

  if (type == T_DIR) {
    80204aaa:	0009879b          	sext.w	a5,s3
    80204aae:	4705                	li	a4,1
    80204ab0:	06e78d63          	beq	a5,a4,80204b2a <create+0xa0>
    mode = ATTR_READ_ONLY;
  } else {
    mode = 0;  
  }

  elock(dp);
    80204ab4:	00002097          	auipc	ra,0x2
    80204ab8:	7ae080e7          	jalr	1966(ra) # 80207262 <elock>
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    80204abc:	4601                	li	a2,0
    80204abe:	ed040593          	addi	a1,s0,-304
    80204ac2:	8526                	mv	a0,s1
    80204ac4:	00003097          	auipc	ra,0x3
    80204ac8:	c90080e7          	jalr	-880(ra) # 80207754 <ealloc>
    80204acc:	892a                	mv	s2,a0
    80204ace:	c121                	beqz	a0,80204b0e <create+0x84>
    eunlock(dp);
    eput(dp);
    return NULL;
  }
  
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204ad0:	2981                	sext.w	s3,s3
    80204ad2:	4789                	li	a5,2
    80204ad4:	00f99663          	bne	s3,a5,80204ae0 <create+0x56>
      (type == T_FILE && (ep->attribute & ATTR_DIRECTORY))) {
    80204ad8:	10094783          	lbu	a5,256(s2)
    80204adc:	8bc1                	andi	a5,a5,16
    80204ade:	eba5                	bnez	a5,80204b4e <create+0xc4>
    eput(ep);
    eput(dp);
    return NULL;
  }

  eunlock(dp);
    80204ae0:	8526                	mv	a0,s1
    80204ae2:	00002097          	auipc	ra,0x2
    80204ae6:	7b6080e7          	jalr	1974(ra) # 80207298 <eunlock>
  eput(dp);
    80204aea:	8526                	mv	a0,s1
    80204aec:	00002097          	auipc	ra,0x2
    80204af0:	7fa080e7          	jalr	2042(ra) # 802072e6 <eput>

  elock(ep);
    80204af4:	854a                	mv	a0,s2
    80204af6:	00002097          	auipc	ra,0x2
    80204afa:	76c080e7          	jalr	1900(ra) # 80207262 <elock>
  return ep;
}
    80204afe:	854a                	mv	a0,s2
    80204b00:	70b2                	ld	ra,296(sp)
    80204b02:	7412                	ld	s0,288(sp)
    80204b04:	64f2                	ld	s1,280(sp)
    80204b06:	6952                	ld	s2,272(sp)
    80204b08:	69b2                	ld	s3,264(sp)
    80204b0a:	6155                	addi	sp,sp,304
    80204b0c:	8082                	ret
    eunlock(dp);
    80204b0e:	8526                	mv	a0,s1
    80204b10:	00002097          	auipc	ra,0x2
    80204b14:	788080e7          	jalr	1928(ra) # 80207298 <eunlock>
    eput(dp);
    80204b18:	8526                	mv	a0,s1
    80204b1a:	00002097          	auipc	ra,0x2
    80204b1e:	7cc080e7          	jalr	1996(ra) # 802072e6 <eput>
    return NULL;
    80204b22:	4901                	li	s2,0
    80204b24:	bfe9                	j	80204afe <create+0x74>
    return NULL;
    80204b26:	892a                	mv	s2,a0
    80204b28:	bfd9                	j	80204afe <create+0x74>
  elock(dp);
    80204b2a:	00002097          	auipc	ra,0x2
    80204b2e:	738080e7          	jalr	1848(ra) # 80207262 <elock>
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    80204b32:	4641                	li	a2,16
    80204b34:	ed040593          	addi	a1,s0,-304
    80204b38:	8526                	mv	a0,s1
    80204b3a:	00003097          	auipc	ra,0x3
    80204b3e:	c1a080e7          	jalr	-998(ra) # 80207754 <ealloc>
    80204b42:	892a                	mv	s2,a0
    80204b44:	d569                	beqz	a0,80204b0e <create+0x84>
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204b46:	10094783          	lbu	a5,256(s2)
    80204b4a:	8bc1                	andi	a5,a5,16
    80204b4c:	fbd1                	bnez	a5,80204ae0 <create+0x56>
    eunlock(dp);
    80204b4e:	8526                	mv	a0,s1
    80204b50:	00002097          	auipc	ra,0x2
    80204b54:	748080e7          	jalr	1864(ra) # 80207298 <eunlock>
    eput(ep);
    80204b58:	854a                	mv	a0,s2
    80204b5a:	00002097          	auipc	ra,0x2
    80204b5e:	78c080e7          	jalr	1932(ra) # 802072e6 <eput>
    eput(dp);
    80204b62:	8526                	mv	a0,s1
    80204b64:	00002097          	auipc	ra,0x2
    80204b68:	782080e7          	jalr	1922(ra) # 802072e6 <eput>
    return NULL;
    80204b6c:	4901                	li	s2,0
    80204b6e:	bf41                	j	80204afe <create+0x74>

0000000080204b70 <sys_dup>:
{
    80204b70:	7179                	addi	sp,sp,-48
    80204b72:	f406                	sd	ra,40(sp)
    80204b74:	f022                	sd	s0,32(sp)
    80204b76:	ec26                	sd	s1,24(sp)
    80204b78:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0)
    80204b7a:	fd840613          	addi	a2,s0,-40
    80204b7e:	4581                	li	a1,0
    80204b80:	4501                	li	a0,0
    80204b82:	00000097          	auipc	ra,0x0
    80204b86:	e5a080e7          	jalr	-422(ra) # 802049dc <argfd>
    return -1;
    80204b8a:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0)
    80204b8c:	02054363          	bltz	a0,80204bb2 <sys_dup+0x42>
  if((fd=fdalloc(f)) < 0)
    80204b90:	fd843503          	ld	a0,-40(s0)
    80204b94:	00000097          	auipc	ra,0x0
    80204b98:	eb2080e7          	jalr	-334(ra) # 80204a46 <fdalloc>
    80204b9c:	84aa                	mv	s1,a0
    return -1;
    80204b9e:	57fd                	li	a5,-1
  if((fd=fdalloc(f)) < 0)
    80204ba0:	00054963          	bltz	a0,80204bb2 <sys_dup+0x42>
  filedup(f);
    80204ba4:	fd843503          	ld	a0,-40(s0)
    80204ba8:	fffff097          	auipc	ra,0xfffff
    80204bac:	2da080e7          	jalr	730(ra) # 80203e82 <filedup>
  return fd;
    80204bb0:	87a6                	mv	a5,s1
}
    80204bb2:	853e                	mv	a0,a5
    80204bb4:	70a2                	ld	ra,40(sp)
    80204bb6:	7402                	ld	s0,32(sp)
    80204bb8:	64e2                	ld	s1,24(sp)
    80204bba:	6145                	addi	sp,sp,48
    80204bbc:	8082                	ret

0000000080204bbe <sys_read>:
{
    80204bbe:	7179                	addi	sp,sp,-48
    80204bc0:	f406                	sd	ra,40(sp)
    80204bc2:	f022                	sd	s0,32(sp)
    80204bc4:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204bc6:	fe840613          	addi	a2,s0,-24
    80204bca:	4581                	li	a1,0
    80204bcc:	4501                	li	a0,0
    80204bce:	00000097          	auipc	ra,0x0
    80204bd2:	e0e080e7          	jalr	-498(ra) # 802049dc <argfd>
    return -1;
    80204bd6:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204bd8:	04054163          	bltz	a0,80204c1a <sys_read+0x5c>
    80204bdc:	fe440593          	addi	a1,s0,-28
    80204be0:	4509                	li	a0,2
    80204be2:	ffffe097          	auipc	ra,0xffffe
    80204be6:	42c080e7          	jalr	1068(ra) # 8020300e <argint>
    return -1;
    80204bea:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204bec:	02054763          	bltz	a0,80204c1a <sys_read+0x5c>
    80204bf0:	fd840593          	addi	a1,s0,-40
    80204bf4:	4505                	li	a0,1
    80204bf6:	ffffe097          	auipc	ra,0xffffe
    80204bfa:	47a080e7          	jalr	1146(ra) # 80203070 <argaddr>
    return -1;
    80204bfe:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204c00:	00054d63          	bltz	a0,80204c1a <sys_read+0x5c>
  return fileread(f, p, n);
    80204c04:	fe442603          	lw	a2,-28(s0)
    80204c08:	fd843583          	ld	a1,-40(s0)
    80204c0c:	fe843503          	ld	a0,-24(s0)
    80204c10:	fffff097          	auipc	ra,0xfffff
    80204c14:	3de080e7          	jalr	990(ra) # 80203fee <fileread>
    80204c18:	87aa                	mv	a5,a0
}
    80204c1a:	853e                	mv	a0,a5
    80204c1c:	70a2                	ld	ra,40(sp)
    80204c1e:	7402                	ld	s0,32(sp)
    80204c20:	6145                	addi	sp,sp,48
    80204c22:	8082                	ret

0000000080204c24 <sys_write>:
{
    80204c24:	7179                	addi	sp,sp,-48
    80204c26:	f406                	sd	ra,40(sp)
    80204c28:	f022                	sd	s0,32(sp)
    80204c2a:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204c2c:	fe840613          	addi	a2,s0,-24
    80204c30:	4581                	li	a1,0
    80204c32:	4501                	li	a0,0
    80204c34:	00000097          	auipc	ra,0x0
    80204c38:	da8080e7          	jalr	-600(ra) # 802049dc <argfd>
    return -1;
    80204c3c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204c3e:	04054163          	bltz	a0,80204c80 <sys_write+0x5c>
    80204c42:	fe440593          	addi	a1,s0,-28
    80204c46:	4509                	li	a0,2
    80204c48:	ffffe097          	auipc	ra,0xffffe
    80204c4c:	3c6080e7          	jalr	966(ra) # 8020300e <argint>
    return -1;
    80204c50:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204c52:	02054763          	bltz	a0,80204c80 <sys_write+0x5c>
    80204c56:	fd840593          	addi	a1,s0,-40
    80204c5a:	4505                	li	a0,1
    80204c5c:	ffffe097          	auipc	ra,0xffffe
    80204c60:	414080e7          	jalr	1044(ra) # 80203070 <argaddr>
    return -1;
    80204c64:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204c66:	00054d63          	bltz	a0,80204c80 <sys_write+0x5c>
  return filewrite(f, p, n);
    80204c6a:	fe442603          	lw	a2,-28(s0)
    80204c6e:	fd843583          	ld	a1,-40(s0)
    80204c72:	fe843503          	ld	a0,-24(s0)
    80204c76:	fffff097          	auipc	ra,0xfffff
    80204c7a:	43a080e7          	jalr	1082(ra) # 802040b0 <filewrite>
    80204c7e:	87aa                	mv	a5,a0
}
    80204c80:	853e                	mv	a0,a5
    80204c82:	70a2                	ld	ra,40(sp)
    80204c84:	7402                	ld	s0,32(sp)
    80204c86:	6145                	addi	sp,sp,48
    80204c88:	8082                	ret

0000000080204c8a <sys_close>:
{
    80204c8a:	1101                	addi	sp,sp,-32
    80204c8c:	ec06                	sd	ra,24(sp)
    80204c8e:	e822                	sd	s0,16(sp)
    80204c90:	1000                	addi	s0,sp,32
  if(argfd(0, &fd, &f) < 0)
    80204c92:	fe040613          	addi	a2,s0,-32
    80204c96:	fec40593          	addi	a1,s0,-20
    80204c9a:	4501                	li	a0,0
    80204c9c:	00000097          	auipc	ra,0x0
    80204ca0:	d40080e7          	jalr	-704(ra) # 802049dc <argfd>
    return -1;
    80204ca4:	57fd                	li	a5,-1
  if(argfd(0, &fd, &f) < 0)
    80204ca6:	02054463          	bltz	a0,80204cce <sys_close+0x44>
  myproc()->ofile[fd] = 0;
    80204caa:	ffffd097          	auipc	ra,0xffffd
    80204cae:	dae080e7          	jalr	-594(ra) # 80201a58 <myproc>
    80204cb2:	fec42783          	lw	a5,-20(s0)
    80204cb6:	07e9                	addi	a5,a5,26
    80204cb8:	078e                	slli	a5,a5,0x3
    80204cba:	97aa                	add	a5,a5,a0
    80204cbc:	0007b423          	sd	zero,8(a5)
  fileclose(f);
    80204cc0:	fe043503          	ld	a0,-32(s0)
    80204cc4:	fffff097          	auipc	ra,0xfffff
    80204cc8:	210080e7          	jalr	528(ra) # 80203ed4 <fileclose>
  return 0;
    80204ccc:	4781                	li	a5,0
}
    80204cce:	853e                	mv	a0,a5
    80204cd0:	60e2                	ld	ra,24(sp)
    80204cd2:	6442                	ld	s0,16(sp)
    80204cd4:	6105                	addi	sp,sp,32
    80204cd6:	8082                	ret

0000000080204cd8 <sys_fstat>:
{
    80204cd8:	1101                	addi	sp,sp,-32
    80204cda:	ec06                	sd	ra,24(sp)
    80204cdc:	e822                	sd	s0,16(sp)
    80204cde:	1000                	addi	s0,sp,32
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204ce0:	fe840613          	addi	a2,s0,-24
    80204ce4:	4581                	li	a1,0
    80204ce6:	4501                	li	a0,0
    80204ce8:	00000097          	auipc	ra,0x0
    80204cec:	cf4080e7          	jalr	-780(ra) # 802049dc <argfd>
    return -1;
    80204cf0:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204cf2:	02054563          	bltz	a0,80204d1c <sys_fstat+0x44>
    80204cf6:	fe040593          	addi	a1,s0,-32
    80204cfa:	4505                	li	a0,1
    80204cfc:	ffffe097          	auipc	ra,0xffffe
    80204d00:	374080e7          	jalr	884(ra) # 80203070 <argaddr>
    return -1;
    80204d04:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204d06:	00054b63          	bltz	a0,80204d1c <sys_fstat+0x44>
  return filestat(f, st);
    80204d0a:	fe043583          	ld	a1,-32(s0)
    80204d0e:	fe843503          	ld	a0,-24(s0)
    80204d12:	fffff097          	auipc	ra,0xfffff
    80204d16:	278080e7          	jalr	632(ra) # 80203f8a <filestat>
    80204d1a:	87aa                	mv	a5,a0
}
    80204d1c:	853e                	mv	a0,a5
    80204d1e:	60e2                	ld	ra,24(sp)
    80204d20:	6442                	ld	s0,16(sp)
    80204d22:	6105                	addi	sp,sp,32
    80204d24:	8082                	ret

0000000080204d26 <sys_open>:

uint64
sys_open(void)
{
    80204d26:	7129                	addi	sp,sp,-320
    80204d28:	fe06                	sd	ra,312(sp)
    80204d2a:	fa22                	sd	s0,304(sp)
    80204d2c:	f626                	sd	s1,296(sp)
    80204d2e:	f24a                	sd	s2,288(sp)
    80204d30:	ee4e                	sd	s3,280(sp)
    80204d32:	0280                	addi	s0,sp,320
  char path[FAT32_MAX_PATH];
  int fd, omode;
  struct file *f;
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204d34:	10400613          	li	a2,260
    80204d38:	ec840593          	addi	a1,s0,-312
    80204d3c:	4501                	li	a0,0
    80204d3e:	ffffe097          	auipc	ra,0xffffe
    80204d42:	354080e7          	jalr	852(ra) # 80203092 <argstr>
    80204d46:	87aa                	mv	a5,a0
    return -1;
    80204d48:	557d                	li	a0,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204d4a:	0807ce63          	bltz	a5,80204de6 <sys_open+0xc0>
    80204d4e:	ec440593          	addi	a1,s0,-316
    80204d52:	4505                	li	a0,1
    80204d54:	ffffe097          	auipc	ra,0xffffe
    80204d58:	2ba080e7          	jalr	698(ra) # 8020300e <argint>
    80204d5c:	0e054163          	bltz	a0,80204e3e <sys_open+0x118>
  if(omode & O_CREATE){
    80204d60:	ec442603          	lw	a2,-316(s0)
    80204d64:	24067793          	andi	a5,a2,576
    80204d68:	c7d1                	beqz	a5,80204df4 <sys_open+0xce>
    ep = create(path, T_FILE, omode);
    80204d6a:	4589                	li	a1,2
    80204d6c:	ec840513          	addi	a0,s0,-312
    80204d70:	00000097          	auipc	ra,0x0
    80204d74:	d1a080e7          	jalr	-742(ra) # 80204a8a <create>
    80204d78:	892a                	mv	s2,a0
    if(ep == NULL){
    80204d7a:	c561                	beqz	a0,80204e42 <sys_open+0x11c>
      eput(ep);
      return -1;
    }
  }

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204d7c:	fffff097          	auipc	ra,0xfffff
    80204d80:	09c080e7          	jalr	156(ra) # 80203e18 <filealloc>
    80204d84:	89aa                	mv	s3,a0
    80204d86:	c579                	beqz	a0,80204e54 <sys_open+0x12e>
    80204d88:	00000097          	auipc	ra,0x0
    80204d8c:	cbe080e7          	jalr	-834(ra) # 80204a46 <fdalloc>
    80204d90:	84aa                	mv	s1,a0
    80204d92:	0a054c63          	bltz	a0,80204e4a <sys_open+0x124>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    80204d96:	10094783          	lbu	a5,256(s2)
    80204d9a:	8bc1                	andi	a5,a5,16
    80204d9c:	e791                	bnez	a5,80204da8 <sys_open+0x82>
    80204d9e:	ec442783          	lw	a5,-316(s0)
    80204da2:	4007f793          	andi	a5,a5,1024
    80204da6:	e7d1                	bnez	a5,80204e32 <sys_open+0x10c>
    etrunc(ep);
  }

  f->type = FD_ENTRY;
    80204da8:	4789                	li	a5,2
    80204daa:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    80204dae:	ec442783          	lw	a5,-316(s0)
    80204db2:	0047f693          	andi	a3,a5,4
    80204db6:	4701                	li	a4,0
    80204db8:	c299                	beqz	a3,80204dbe <sys_open+0x98>
    80204dba:	10892703          	lw	a4,264(s2)
    80204dbe:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    80204dc2:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    80204dc6:	0017c713          	xori	a4,a5,1
    80204dca:	8b05                	andi	a4,a4,1
    80204dcc:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204dd0:	8b8d                	andi	a5,a5,3
    80204dd2:	00f037b3          	snez	a5,a5
    80204dd6:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    80204dda:	854a                	mv	a0,s2
    80204ddc:	00002097          	auipc	ra,0x2
    80204de0:	4bc080e7          	jalr	1212(ra) # 80207298 <eunlock>

  return fd;
    80204de4:	8526                	mv	a0,s1
}
    80204de6:	70f2                	ld	ra,312(sp)
    80204de8:	7452                	ld	s0,304(sp)
    80204dea:	74b2                	ld	s1,296(sp)
    80204dec:	7912                	ld	s2,288(sp)
    80204dee:	69f2                	ld	s3,280(sp)
    80204df0:	6131                	addi	sp,sp,320
    80204df2:	8082                	ret
    if((ep = ename(path)) == NULL){
    80204df4:	ec840513          	addi	a0,s0,-312
    80204df8:	00003097          	auipc	ra,0x3
    80204dfc:	c14080e7          	jalr	-1004(ra) # 80207a0c <ename>
    80204e00:	892a                	mv	s2,a0
    80204e02:	c131                	beqz	a0,80204e46 <sys_open+0x120>
    elock(ep);
    80204e04:	00002097          	auipc	ra,0x2
    80204e08:	45e080e7          	jalr	1118(ra) # 80207262 <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    80204e0c:	10094783          	lbu	a5,256(s2)
    80204e10:	8bc1                	andi	a5,a5,16
    80204e12:	d7ad                	beqz	a5,80204d7c <sys_open+0x56>
    80204e14:	ec442783          	lw	a5,-316(s0)
    80204e18:	d3b5                	beqz	a5,80204d7c <sys_open+0x56>
      eunlock(ep);
    80204e1a:	854a                	mv	a0,s2
    80204e1c:	00002097          	auipc	ra,0x2
    80204e20:	47c080e7          	jalr	1148(ra) # 80207298 <eunlock>
      eput(ep);
    80204e24:	854a                	mv	a0,s2
    80204e26:	00002097          	auipc	ra,0x2
    80204e2a:	4c0080e7          	jalr	1216(ra) # 802072e6 <eput>
      return -1;
    80204e2e:	557d                	li	a0,-1
    80204e30:	bf5d                	j	80204de6 <sys_open+0xc0>
    etrunc(ep);
    80204e32:	854a                	mv	a0,s2
    80204e34:	00002097          	auipc	ra,0x2
    80204e38:	3c4080e7          	jalr	964(ra) # 802071f8 <etrunc>
    80204e3c:	b7b5                	j	80204da8 <sys_open+0x82>
    return -1;
    80204e3e:	557d                	li	a0,-1
    80204e40:	b75d                	j	80204de6 <sys_open+0xc0>
      return -1;
    80204e42:	557d                	li	a0,-1
    80204e44:	b74d                	j	80204de6 <sys_open+0xc0>
      return -1;
    80204e46:	557d                	li	a0,-1
    80204e48:	bf79                	j	80204de6 <sys_open+0xc0>
      fileclose(f);
    80204e4a:	854e                	mv	a0,s3
    80204e4c:	fffff097          	auipc	ra,0xfffff
    80204e50:	088080e7          	jalr	136(ra) # 80203ed4 <fileclose>
    eunlock(ep);
    80204e54:	854a                	mv	a0,s2
    80204e56:	00002097          	auipc	ra,0x2
    80204e5a:	442080e7          	jalr	1090(ra) # 80207298 <eunlock>
    eput(ep);
    80204e5e:	854a                	mv	a0,s2
    80204e60:	00002097          	auipc	ra,0x2
    80204e64:	486080e7          	jalr	1158(ra) # 802072e6 <eput>
    return -1;
    80204e68:	557d                	li	a0,-1
    80204e6a:	bfb5                	j	80204de6 <sys_open+0xc0>

0000000080204e6c <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80204e6c:	7169                	addi	sp,sp,-304
    80204e6e:	f606                	sd	ra,296(sp)
    80204e70:	f222                	sd	s0,288(sp)
    80204e72:	ee26                	sd	s1,280(sp)
    80204e74:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;

  if(argstr(1, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204e76:	10400613          	li	a2,260
    80204e7a:	ed840593          	addi	a1,s0,-296
    80204e7e:	4505                	li	a0,1
    80204e80:	ffffe097          	auipc	ra,0xffffe
    80204e84:	212080e7          	jalr	530(ra) # 80203092 <argstr>
    return -1;
    80204e88:	57fd                	li	a5,-1
  if(argstr(1, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204e8a:	02054663          	bltz	a0,80204eb6 <sys_mkdir+0x4a>
    80204e8e:	4601                	li	a2,0
    80204e90:	4585                	li	a1,1
    80204e92:	ed840513          	addi	a0,s0,-296
    80204e96:	00000097          	auipc	ra,0x0
    80204e9a:	bf4080e7          	jalr	-1036(ra) # 80204a8a <create>
    80204e9e:	84aa                	mv	s1,a0
    80204ea0:	c10d                	beqz	a0,80204ec2 <sys_mkdir+0x56>
  }
  eunlock(ep);
    80204ea2:	00002097          	auipc	ra,0x2
    80204ea6:	3f6080e7          	jalr	1014(ra) # 80207298 <eunlock>
  eput(ep);
    80204eaa:	8526                	mv	a0,s1
    80204eac:	00002097          	auipc	ra,0x2
    80204eb0:	43a080e7          	jalr	1082(ra) # 802072e6 <eput>
  return 0;
    80204eb4:	4781                	li	a5,0
}
    80204eb6:	853e                	mv	a0,a5
    80204eb8:	70b2                	ld	ra,296(sp)
    80204eba:	7412                	ld	s0,288(sp)
    80204ebc:	64f2                	ld	s1,280(sp)
    80204ebe:	6155                	addi	sp,sp,304
    80204ec0:	8082                	ret
    return -1;
    80204ec2:	57fd                	li	a5,-1
    80204ec4:	bfcd                	j	80204eb6 <sys_mkdir+0x4a>

0000000080204ec6 <sys_chdir>:

uint64
sys_chdir(void)
{
    80204ec6:	7169                	addi	sp,sp,-304
    80204ec8:	f606                	sd	ra,296(sp)
    80204eca:	f222                	sd	s0,288(sp)
    80204ecc:	ee26                	sd	s1,280(sp)
    80204ece:	ea4a                	sd	s2,272(sp)
    80204ed0:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  struct proc *p = myproc();
    80204ed2:	ffffd097          	auipc	ra,0xffffd
    80204ed6:	b86080e7          	jalr	-1146(ra) # 80201a58 <myproc>
    80204eda:	892a                	mv	s2,a0
  
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204edc:	10400613          	li	a2,260
    80204ee0:	ed840593          	addi	a1,s0,-296
    80204ee4:	4501                	li	a0,0
    80204ee6:	ffffe097          	auipc	ra,0xffffe
    80204eea:	1ac080e7          	jalr	428(ra) # 80203092 <argstr>
    return -1;
    80204eee:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204ef0:	04054063          	bltz	a0,80204f30 <sys_chdir+0x6a>
    80204ef4:	ed840513          	addi	a0,s0,-296
    80204ef8:	00003097          	auipc	ra,0x3
    80204efc:	b14080e7          	jalr	-1260(ra) # 80207a0c <ename>
    80204f00:	84aa                	mv	s1,a0
    80204f02:	c931                	beqz	a0,80204f56 <sys_chdir+0x90>
  }
  elock(ep);
    80204f04:	00002097          	auipc	ra,0x2
    80204f08:	35e080e7          	jalr	862(ra) # 80207262 <elock>
  if(!(ep->attribute & ATTR_DIRECTORY)){
    80204f0c:	1004c783          	lbu	a5,256(s1)
    80204f10:	8bc1                	andi	a5,a5,16
    80204f12:	c795                	beqz	a5,80204f3e <sys_chdir+0x78>
    eunlock(ep);
    eput(ep);
    return -1;
  }
  eunlock(ep);
    80204f14:	8526                	mv	a0,s1
    80204f16:	00002097          	auipc	ra,0x2
    80204f1a:	382080e7          	jalr	898(ra) # 80207298 <eunlock>
  eput(p->cwd);
    80204f1e:	4d893503          	ld	a0,1240(s2)
    80204f22:	00002097          	auipc	ra,0x2
    80204f26:	3c4080e7          	jalr	964(ra) # 802072e6 <eput>
  p->cwd = ep;
    80204f2a:	4c993c23          	sd	s1,1240(s2)
  return 0;
    80204f2e:	4781                	li	a5,0
}
    80204f30:	853e                	mv	a0,a5
    80204f32:	70b2                	ld	ra,296(sp)
    80204f34:	7412                	ld	s0,288(sp)
    80204f36:	64f2                	ld	s1,280(sp)
    80204f38:	6952                	ld	s2,272(sp)
    80204f3a:	6155                	addi	sp,sp,304
    80204f3c:	8082                	ret
    eunlock(ep);
    80204f3e:	8526                	mv	a0,s1
    80204f40:	00002097          	auipc	ra,0x2
    80204f44:	358080e7          	jalr	856(ra) # 80207298 <eunlock>
    eput(ep);
    80204f48:	8526                	mv	a0,s1
    80204f4a:	00002097          	auipc	ra,0x2
    80204f4e:	39c080e7          	jalr	924(ra) # 802072e6 <eput>
    return -1;
    80204f52:	57fd                	li	a5,-1
    80204f54:	bff1                	j	80204f30 <sys_chdir+0x6a>
    return -1;
    80204f56:	57fd                	li	a5,-1
    80204f58:	bfe1                	j	80204f30 <sys_chdir+0x6a>

0000000080204f5a <sys_pipe>:

uint64
sys_pipe(void)
{
    80204f5a:	7139                	addi	sp,sp,-64
    80204f5c:	fc06                	sd	ra,56(sp)
    80204f5e:	f822                	sd	s0,48(sp)
    80204f60:	f426                	sd	s1,40(sp)
    80204f62:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80204f64:	ffffd097          	auipc	ra,0xffffd
    80204f68:	af4080e7          	jalr	-1292(ra) # 80201a58 <myproc>
    80204f6c:	84aa                	mv	s1,a0

  if(argaddr(0, &fdarray) < 0)
    80204f6e:	fd840593          	addi	a1,s0,-40
    80204f72:	4501                	li	a0,0
    80204f74:	ffffe097          	auipc	ra,0xffffe
    80204f78:	0fc080e7          	jalr	252(ra) # 80203070 <argaddr>
    return -1;
    80204f7c:	57fd                	li	a5,-1
  if(argaddr(0, &fdarray) < 0)
    80204f7e:	0c054e63          	bltz	a0,8020505a <sys_pipe+0x100>
  if(pipealloc(&rf, &wf) < 0)
    80204f82:	fc840593          	addi	a1,s0,-56
    80204f86:	fd040513          	addi	a0,s0,-48
    80204f8a:	fffff097          	auipc	ra,0xfffff
    80204f8e:	2be080e7          	jalr	702(ra) # 80204248 <pipealloc>
    return -1;
    80204f92:	57fd                	li	a5,-1
  if(pipealloc(&rf, &wf) < 0)
    80204f94:	0c054363          	bltz	a0,8020505a <sys_pipe+0x100>
  fd0 = -1;
    80204f98:	fcf42223          	sw	a5,-60(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80204f9c:	fd043503          	ld	a0,-48(s0)
    80204fa0:	00000097          	auipc	ra,0x0
    80204fa4:	aa6080e7          	jalr	-1370(ra) # 80204a46 <fdalloc>
    80204fa8:	fca42223          	sw	a0,-60(s0)
    80204fac:	08054a63          	bltz	a0,80205040 <sys_pipe+0xe6>
    80204fb0:	fc843503          	ld	a0,-56(s0)
    80204fb4:	00000097          	auipc	ra,0x0
    80204fb8:	a92080e7          	jalr	-1390(ra) # 80204a46 <fdalloc>
    80204fbc:	fca42023          	sw	a0,-64(s0)
    80204fc0:	06054663          	bltz	a0,8020502c <sys_pipe+0xd2>
    fileclose(wf);
    return -1;
  }
  // if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
  //    copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204fc4:	4611                	li	a2,4
    80204fc6:	fc440593          	addi	a1,s0,-60
    80204fca:	fd843503          	ld	a0,-40(s0)
    80204fce:	ffffc097          	auipc	ra,0xffffc
    80204fd2:	3ae080e7          	jalr	942(ra) # 8020137c <copyout2>
    80204fd6:	00054f63          	bltz	a0,80204ff4 <sys_pipe+0x9a>
     copyout2(fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80204fda:	4611                	li	a2,4
    80204fdc:	fc040593          	addi	a1,s0,-64
    80204fe0:	fd843503          	ld	a0,-40(s0)
    80204fe4:	0511                	addi	a0,a0,4
    80204fe6:	ffffc097          	auipc	ra,0xffffc
    80204fea:	396080e7          	jalr	918(ra) # 8020137c <copyout2>
    p->ofile[fd1] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  return 0;
    80204fee:	4781                	li	a5,0
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204ff0:	06055563          	bgez	a0,8020505a <sys_pipe+0x100>
    p->ofile[fd0] = 0;
    80204ff4:	fc442783          	lw	a5,-60(s0)
    80204ff8:	07e9                	addi	a5,a5,26
    80204ffa:	078e                	slli	a5,a5,0x3
    80204ffc:	97a6                	add	a5,a5,s1
    80204ffe:	0007b423          	sd	zero,8(a5)
    p->ofile[fd1] = 0;
    80205002:	fc042503          	lw	a0,-64(s0)
    80205006:	0569                	addi	a0,a0,26
    80205008:	050e                	slli	a0,a0,0x3
    8020500a:	9526                	add	a0,a0,s1
    8020500c:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    80205010:	fd043503          	ld	a0,-48(s0)
    80205014:	fffff097          	auipc	ra,0xfffff
    80205018:	ec0080e7          	jalr	-320(ra) # 80203ed4 <fileclose>
    fileclose(wf);
    8020501c:	fc843503          	ld	a0,-56(s0)
    80205020:	fffff097          	auipc	ra,0xfffff
    80205024:	eb4080e7          	jalr	-332(ra) # 80203ed4 <fileclose>
    return -1;
    80205028:	57fd                	li	a5,-1
    8020502a:	a805                	j	8020505a <sys_pipe+0x100>
    if(fd0 >= 0)
    8020502c:	fc442783          	lw	a5,-60(s0)
    80205030:	0007c863          	bltz	a5,80205040 <sys_pipe+0xe6>
      p->ofile[fd0] = 0;
    80205034:	01a78513          	addi	a0,a5,26
    80205038:	050e                	slli	a0,a0,0x3
    8020503a:	9526                	add	a0,a0,s1
    8020503c:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    80205040:	fd043503          	ld	a0,-48(s0)
    80205044:	fffff097          	auipc	ra,0xfffff
    80205048:	e90080e7          	jalr	-368(ra) # 80203ed4 <fileclose>
    fileclose(wf);
    8020504c:	fc843503          	ld	a0,-56(s0)
    80205050:	fffff097          	auipc	ra,0xfffff
    80205054:	e84080e7          	jalr	-380(ra) # 80203ed4 <fileclose>
    return -1;
    80205058:	57fd                	li	a5,-1
}
    8020505a:	853e                	mv	a0,a5
    8020505c:	70e2                	ld	ra,56(sp)
    8020505e:	7442                	ld	s0,48(sp)
    80205060:	74a2                	ld	s1,40(sp)
    80205062:	6121                	addi	sp,sp,64
    80205064:	8082                	ret

0000000080205066 <sys_dev>:

// To open console device.
uint64
sys_dev(void)
{
    80205066:	7179                	addi	sp,sp,-48
    80205068:	f406                	sd	ra,40(sp)
    8020506a:	f022                	sd	s0,32(sp)
    8020506c:	ec26                	sd	s1,24(sp)
    8020506e:	1800                	addi	s0,sp,48
  int fd, omode;
  int major, minor;
  struct file *f;

  if(argint(0, &omode) < 0 || argint(1, &major) < 0 || argint(2, &minor) < 0){
    80205070:	fdc40593          	addi	a1,s0,-36
    80205074:	4501                	li	a0,0
    80205076:	ffffe097          	auipc	ra,0xffffe
    8020507a:	f98080e7          	jalr	-104(ra) # 8020300e <argint>
    8020507e:	08054a63          	bltz	a0,80205112 <sys_dev+0xac>
    80205082:	fd840593          	addi	a1,s0,-40
    80205086:	4505                	li	a0,1
    80205088:	ffffe097          	auipc	ra,0xffffe
    8020508c:	f86080e7          	jalr	-122(ra) # 8020300e <argint>
    80205090:	08054763          	bltz	a0,8020511e <sys_dev+0xb8>
    80205094:	fd440593          	addi	a1,s0,-44
    80205098:	4509                	li	a0,2
    8020509a:	ffffe097          	auipc	ra,0xffffe
    8020509e:	f74080e7          	jalr	-140(ra) # 8020300e <argint>
    802050a2:	08054063          	bltz	a0,80205122 <sys_dev+0xbc>
    return -1;
  }

  if(omode & O_CREATE){
    802050a6:	fdc42783          	lw	a5,-36(s0)
    802050aa:	2407f793          	andi	a5,a5,576
    802050ae:	ebb1                	bnez	a5,80205102 <sys_dev+0x9c>
    panic("dev file on FAT");
  }

  if(major < 0 || major >= NDEV)
    802050b0:	fd842703          	lw	a4,-40(s0)
    802050b4:	47a5                	li	a5,9
    return -1;
    802050b6:	557d                	li	a0,-1
  if(major < 0 || major >= NDEV)
    802050b8:	04e7ee63          	bltu	a5,a4,80205114 <sys_dev+0xae>

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    802050bc:	fffff097          	auipc	ra,0xfffff
    802050c0:	d5c080e7          	jalr	-676(ra) # 80203e18 <filealloc>
    802050c4:	84aa                	mv	s1,a0
    802050c6:	c125                	beqz	a0,80205126 <sys_dev+0xc0>
    802050c8:	00000097          	auipc	ra,0x0
    802050cc:	97e080e7          	jalr	-1666(ra) # 80204a46 <fdalloc>
    802050d0:	04054d63          	bltz	a0,8020512a <sys_dev+0xc4>
    if(f)
      fileclose(f);
    return -1;
  }

  f->type = FD_DEVICE;
    802050d4:	478d                	li	a5,3
    802050d6:	c09c                	sw	a5,0(s1)
  f->off = 0;
    802050d8:	0204a023          	sw	zero,32(s1)
  f->ep = 0;
    802050dc:	0004bc23          	sd	zero,24(s1)
  f->major = major;
    802050e0:	fd842783          	lw	a5,-40(s0)
    802050e4:	02f49223          	sh	a5,36(s1)
  f->readable = !(omode & O_WRONLY);
    802050e8:	fdc42783          	lw	a5,-36(s0)
    802050ec:	0017c713          	xori	a4,a5,1
    802050f0:	8b05                	andi	a4,a4,1
    802050f2:	00e48423          	sb	a4,8(s1)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    802050f6:	8b8d                	andi	a5,a5,3
    802050f8:	00f037b3          	snez	a5,a5
    802050fc:	00f484a3          	sb	a5,9(s1)

  return fd;
    80205100:	a811                	j	80205114 <sys_dev+0xae>
    panic("dev file on FAT");
    80205102:	00006517          	auipc	a0,0x6
    80205106:	b9650513          	addi	a0,a0,-1130 # 8020ac98 <digits+0x918>
    8020510a:	ffffb097          	auipc	ra,0xffffb
    8020510e:	038080e7          	jalr	56(ra) # 80200142 <panic>
    return -1;
    80205112:	557d                	li	a0,-1
}
    80205114:	70a2                	ld	ra,40(sp)
    80205116:	7402                	ld	s0,32(sp)
    80205118:	64e2                	ld	s1,24(sp)
    8020511a:	6145                	addi	sp,sp,48
    8020511c:	8082                	ret
    return -1;
    8020511e:	557d                	li	a0,-1
    80205120:	bfd5                	j	80205114 <sys_dev+0xae>
    80205122:	557d                	li	a0,-1
    80205124:	bfc5                	j	80205114 <sys_dev+0xae>
    return -1;
    80205126:	557d                	li	a0,-1
    80205128:	b7f5                	j	80205114 <sys_dev+0xae>
      fileclose(f);
    8020512a:	8526                	mv	a0,s1
    8020512c:	fffff097          	auipc	ra,0xfffff
    80205130:	da8080e7          	jalr	-600(ra) # 80203ed4 <fileclose>
    return -1;
    80205134:	557d                	li	a0,-1
    80205136:	bff9                	j	80205114 <sys_dev+0xae>

0000000080205138 <sys_readdir>:

// To support ls command
uint64
sys_readdir(void)
{
    80205138:	1101                	addi	sp,sp,-32
    8020513a:	ec06                	sd	ra,24(sp)
    8020513c:	e822                	sd	s0,16(sp)
    8020513e:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80205140:	fe840613          	addi	a2,s0,-24
    80205144:	4581                	li	a1,0
    80205146:	4501                	li	a0,0
    80205148:	00000097          	auipc	ra,0x0
    8020514c:	894080e7          	jalr	-1900(ra) # 802049dc <argfd>
    return -1;
    80205150:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80205152:	02054563          	bltz	a0,8020517c <sys_readdir+0x44>
    80205156:	fe040593          	addi	a1,s0,-32
    8020515a:	4505                	li	a0,1
    8020515c:	ffffe097          	auipc	ra,0xffffe
    80205160:	f14080e7          	jalr	-236(ra) # 80203070 <argaddr>
    return -1;
    80205164:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80205166:	00054b63          	bltz	a0,8020517c <sys_readdir+0x44>
  return dirnext(f, p);
    8020516a:	fe043583          	ld	a1,-32(s0)
    8020516e:	fe843503          	ld	a0,-24(s0)
    80205172:	fffff097          	auipc	ra,0xfffff
    80205176:	010080e7          	jalr	16(ra) # 80204182 <dirnext>
    8020517a:	87aa                	mv	a5,a0
}
    8020517c:	853e                	mv	a0,a5
    8020517e:	60e2                	ld	ra,24(sp)
    80205180:	6442                	ld	s0,16(sp)
    80205182:	6105                	addi	sp,sp,32
    80205184:	8082                	ret

0000000080205186 <sys_getcwd>:

// get absolute cwd string
uint64
sys_getcwd(void)
{
    80205186:	714d                	addi	sp,sp,-336
    80205188:	e686                	sd	ra,328(sp)
    8020518a:	e2a2                	sd	s0,320(sp)
    8020518c:	fe26                	sd	s1,312(sp)
    8020518e:	fa4a                	sd	s2,304(sp)
    80205190:	f64e                	sd	s3,296(sp)
    80205192:	f252                	sd	s4,288(sp)
    80205194:	ee56                	sd	s5,280(sp)
    80205196:	0a80                	addi	s0,sp,336
  uint64 addr;
  if (argaddr(0, &addr) < 0)
    80205198:	fb840593          	addi	a1,s0,-72
    8020519c:	4501                	li	a0,0
    8020519e:	ffffe097          	auipc	ra,0xffffe
    802051a2:	ed2080e7          	jalr	-302(ra) # 80203070 <argaddr>
    return -1;
    802051a6:	57fd                	li	a5,-1
  if (argaddr(0, &addr) < 0)
    802051a8:	06054f63          	bltz	a0,80205226 <sys_getcwd+0xa0>

  struct dirent *de = myproc()->cwd;
    802051ac:	ffffd097          	auipc	ra,0xffffd
    802051b0:	8ac080e7          	jalr	-1876(ra) # 80201a58 <myproc>
    802051b4:	4d853483          	ld	s1,1240(a0)
  char path[FAT32_MAX_PATH];
  char *s;
  int len;

  if (de->parent == NULL) {
    802051b8:	1204b783          	ld	a5,288(s1)
    802051bc:	cfbd                	beqz	a5,8020523a <sys_getcwd+0xb4>
    s = "/";
  } else {
    s = path + FAT32_MAX_PATH - 1;
    *s = '\0';
    802051be:	fa0409a3          	sb	zero,-77(s0)
    s = path + FAT32_MAX_PATH - 1;
    802051c2:	fb340993          	addi	s3,s0,-77
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= path)          // can't reach root "/"
    802051c6:	eb040a13          	addi	s4,s0,-336
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    802051ca:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    802051ce:	8526                	mv	a0,s1
    802051d0:	ffffb097          	auipc	ra,0xffffb
    802051d4:	71c080e7          	jalr	1820(ra) # 802008ec <strlen>
    802051d8:	862a                	mv	a2,a0
      s -= len;
    802051da:	40a98933          	sub	s2,s3,a0
      if (s <= path)          // can't reach root "/"
    802051de:	072a7363          	bgeu	s4,s2,80205244 <sys_getcwd+0xbe>
      strncpy(s, de->filename, len);
    802051e2:	85a6                	mv	a1,s1
    802051e4:	854a                	mv	a0,s2
    802051e6:	ffffb097          	auipc	ra,0xffffb
    802051ea:	696080e7          	jalr	1686(ra) # 8020087c <strncpy>
      *--s = '/';
    802051ee:	fff90993          	addi	s3,s2,-1
    802051f2:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    802051f6:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    802051fa:	1204b783          	ld	a5,288(s1)
    802051fe:	fbe1                	bnez	a5,802051ce <sys_getcwd+0x48>
    }
  }

  // if (copyout(myproc()->pagetable, addr, s, strlen(s) + 1) < 0)
  if (copyout2(addr, s, strlen(s) + 1) < 0)
    80205200:	fb843483          	ld	s1,-72(s0)
    80205204:	854e                	mv	a0,s3
    80205206:	ffffb097          	auipc	ra,0xffffb
    8020520a:	6e6080e7          	jalr	1766(ra) # 802008ec <strlen>
    8020520e:	0015061b          	addiw	a2,a0,1
    80205212:	85ce                	mv	a1,s3
    80205214:	8526                	mv	a0,s1
    80205216:	ffffc097          	auipc	ra,0xffffc
    8020521a:	166080e7          	jalr	358(ra) # 8020137c <copyout2>
    8020521e:	02054563          	bltz	a0,80205248 <sys_getcwd+0xc2>
    return -1;
  
  return addr;
    80205222:	fb843783          	ld	a5,-72(s0)

}
    80205226:	853e                	mv	a0,a5
    80205228:	60b6                	ld	ra,328(sp)
    8020522a:	6416                	ld	s0,320(sp)
    8020522c:	74f2                	ld	s1,312(sp)
    8020522e:	7952                	ld	s2,304(sp)
    80205230:	79b2                	ld	s3,296(sp)
    80205232:	7a12                	ld	s4,288(sp)
    80205234:	6af2                	ld	s5,280(sp)
    80205236:	6171                	addi	sp,sp,336
    80205238:	8082                	ret
    s = "/";
    8020523a:	00005997          	auipc	s3,0x5
    8020523e:	3f698993          	addi	s3,s3,1014 # 8020a630 <digits+0x2b0>
    80205242:	bf7d                	j	80205200 <sys_getcwd+0x7a>
        return -1;
    80205244:	57fd                	li	a5,-1
    80205246:	b7c5                	j	80205226 <sys_getcwd+0xa0>
    return -1;
    80205248:	57fd                	li	a5,-1
    8020524a:	bff1                	j	80205226 <sys_getcwd+0xa0>

000000008020524c <sys_remove>:
  return ret == -1;
}

uint64
sys_remove(void)
{
    8020524c:	d6010113          	addi	sp,sp,-672
    80205250:	28113c23          	sd	ra,664(sp)
    80205254:	28813823          	sd	s0,656(sp)
    80205258:	28913423          	sd	s1,648(sp)
    8020525c:	1500                	addi	s0,sp,672
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  int len;
  if((len = argstr(0, path, FAT32_MAX_PATH)) <= 0)
    8020525e:	10400613          	li	a2,260
    80205262:	ed840593          	addi	a1,s0,-296
    80205266:	4501                	li	a0,0
    80205268:	ffffe097          	auipc	ra,0xffffe
    8020526c:	e2a080e7          	jalr	-470(ra) # 80203092 <argstr>
    80205270:	0ea05a63          	blez	a0,80205364 <sys_remove+0x118>
    return -1;

  char *s = path + len - 1;
    80205274:	157d                	addi	a0,a0,-1
    80205276:	ed840713          	addi	a4,s0,-296
    8020527a:	00a707b3          	add	a5,a4,a0
  while (s >= path && *s == '/') {
    8020527e:	02f00693          	li	a3,47
    80205282:	863a                	mv	a2,a4
    80205284:	00e7e963          	bltu	a5,a4,80205296 <sys_remove+0x4a>
    80205288:	0007c703          	lbu	a4,0(a5)
    8020528c:	08d71a63          	bne	a4,a3,80205320 <sys_remove+0xd4>
    s--;
    80205290:	17fd                	addi	a5,a5,-1
  while (s >= path && *s == '/') {
    80205292:	fec7fbe3          	bgeu	a5,a2,80205288 <sys_remove+0x3c>
  }
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    return -1;
  }
  
  if((ep = ename(path)) == NULL){
    80205296:	ed840513          	addi	a0,s0,-296
    8020529a:	00002097          	auipc	ra,0x2
    8020529e:	772080e7          	jalr	1906(ra) # 80207a0c <ename>
    802052a2:	84aa                	mv	s1,a0
    802052a4:	c561                	beqz	a0,8020536c <sys_remove+0x120>
    return -1;
  }
  elock(ep);
    802052a6:	00002097          	auipc	ra,0x2
    802052aa:	fbc080e7          	jalr	-68(ra) # 80207262 <elock>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    802052ae:	1004c783          	lbu	a5,256(s1)
    802052b2:	8bc1                	andi	a5,a5,16
    802052b4:	c38d                	beqz	a5,802052d6 <sys_remove+0x8a>
  ep.valid = 0;
    802052b6:	e8041323          	sh	zero,-378(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    802052ba:	d6c40693          	addi	a3,s0,-660
    802052be:	04000613          	li	a2,64
    802052c2:	d7040593          	addi	a1,s0,-656
    802052c6:	8526                	mv	a0,s1
    802052c8:	00002097          	auipc	ra,0x2
    802052cc:	19e080e7          	jalr	414(ra) # 80207466 <enext>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    802052d0:	57fd                	li	a5,-1
    802052d2:	06f51d63          	bne	a0,a5,8020534c <sys_remove+0x100>
      eunlock(ep);
      eput(ep);
      return -1;
  }
  elock(ep->parent);      // Will this lead to deadlock?
    802052d6:	1204b503          	ld	a0,288(s1)
    802052da:	00002097          	auipc	ra,0x2
    802052de:	f88080e7          	jalr	-120(ra) # 80207262 <elock>
  eremove(ep);
    802052e2:	8526                	mv	a0,s1
    802052e4:	00002097          	auipc	ra,0x2
    802052e8:	e4a080e7          	jalr	-438(ra) # 8020712e <eremove>
  eunlock(ep->parent);
    802052ec:	1204b503          	ld	a0,288(s1)
    802052f0:	00002097          	auipc	ra,0x2
    802052f4:	fa8080e7          	jalr	-88(ra) # 80207298 <eunlock>
  eunlock(ep);
    802052f8:	8526                	mv	a0,s1
    802052fa:	00002097          	auipc	ra,0x2
    802052fe:	f9e080e7          	jalr	-98(ra) # 80207298 <eunlock>
  eput(ep);
    80205302:	8526                	mv	a0,s1
    80205304:	00002097          	auipc	ra,0x2
    80205308:	fe2080e7          	jalr	-30(ra) # 802072e6 <eput>

  return 0;
    8020530c:	4501                	li	a0,0
}
    8020530e:	29813083          	ld	ra,664(sp)
    80205312:	29013403          	ld	s0,656(sp)
    80205316:	28813483          	ld	s1,648(sp)
    8020531a:	2a010113          	addi	sp,sp,672
    8020531e:	8082                	ret
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    80205320:	ed840713          	addi	a4,s0,-296
    80205324:	f6e7e9e3          	bltu	a5,a4,80205296 <sys_remove+0x4a>
    80205328:	0007c683          	lbu	a3,0(a5)
    8020532c:	02e00713          	li	a4,46
    80205330:	f6e693e3          	bne	a3,a4,80205296 <sys_remove+0x4a>
    80205334:	ed840713          	addi	a4,s0,-296
    80205338:	02e78863          	beq	a5,a4,80205368 <sys_remove+0x11c>
    8020533c:	fff7c703          	lbu	a4,-1(a5)
    80205340:	02f00793          	li	a5,47
    80205344:	f4f719e3          	bne	a4,a5,80205296 <sys_remove+0x4a>
    return -1;
    80205348:	557d                	li	a0,-1
    8020534a:	b7d1                	j	8020530e <sys_remove+0xc2>
      eunlock(ep);
    8020534c:	8526                	mv	a0,s1
    8020534e:	00002097          	auipc	ra,0x2
    80205352:	f4a080e7          	jalr	-182(ra) # 80207298 <eunlock>
      eput(ep);
    80205356:	8526                	mv	a0,s1
    80205358:	00002097          	auipc	ra,0x2
    8020535c:	f8e080e7          	jalr	-114(ra) # 802072e6 <eput>
      return -1;
    80205360:	557d                	li	a0,-1
    80205362:	b775                	j	8020530e <sys_remove+0xc2>
    return -1;
    80205364:	557d                	li	a0,-1
    80205366:	b765                	j	8020530e <sys_remove+0xc2>
    return -1;
    80205368:	557d                	li	a0,-1
    8020536a:	b755                	j	8020530e <sys_remove+0xc2>
    return -1;
    8020536c:	557d                	li	a0,-1
    8020536e:	b745                	j	8020530e <sys_remove+0xc2>

0000000080205370 <sys_rename>:

// Must hold too many locks at a time! It's possible to raise a deadlock.
// Because this op takes some steps, we can't promise
uint64
sys_rename(void)
{
    80205370:	c4010113          	addi	sp,sp,-960
    80205374:	3a113c23          	sd	ra,952(sp)
    80205378:	3a813823          	sd	s0,944(sp)
    8020537c:	3a913423          	sd	s1,936(sp)
    80205380:	3b213023          	sd	s2,928(sp)
    80205384:	39313c23          	sd	s3,920(sp)
    80205388:	39413823          	sd	s4,912(sp)
    8020538c:	0780                	addi	s0,sp,960
  char old[FAT32_MAX_PATH], new[FAT32_MAX_PATH];
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    8020538e:	10400613          	li	a2,260
    80205392:	ec840593          	addi	a1,s0,-312
    80205396:	4501                	li	a0,0
    80205398:	ffffe097          	auipc	ra,0xffffe
    8020539c:	cfa080e7          	jalr	-774(ra) # 80203092 <argstr>
      return -1;
    802053a0:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    802053a2:	0c054d63          	bltz	a0,8020547c <sys_rename+0x10c>
    802053a6:	10400613          	li	a2,260
    802053aa:	dc040593          	addi	a1,s0,-576
    802053ae:	4505                	li	a0,1
    802053b0:	ffffe097          	auipc	ra,0xffffe
    802053b4:	ce2080e7          	jalr	-798(ra) # 80203092 <argstr>
      return -1;
    802053b8:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    802053ba:	0c054163          	bltz	a0,8020547c <sys_rename+0x10c>
  }

  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
  int srclock = 0;
  char *name;
  if ((src = ename(old)) == NULL || (pdst = enameparent(new, old)) == NULL
    802053be:	ec840513          	addi	a0,s0,-312
    802053c2:	00002097          	auipc	ra,0x2
    802053c6:	64a080e7          	jalr	1610(ra) # 80207a0c <ename>
    802053ca:	84aa                	mv	s1,a0
    802053cc:	1c050963          	beqz	a0,8020559e <sys_rename+0x22e>
    802053d0:	ec840593          	addi	a1,s0,-312
    802053d4:	dc040513          	addi	a0,s0,-576
    802053d8:	00002097          	auipc	ra,0x2
    802053dc:	652080e7          	jalr	1618(ra) # 80207a2a <enameparent>
    802053e0:	892a                	mv	s2,a0
    802053e2:	cd35                	beqz	a0,8020545e <sys_rename+0xee>
      || (name = formatname(old)) == NULL) {
    802053e4:	ec840513          	addi	a0,s0,-312
    802053e8:	00001097          	auipc	ra,0x1
    802053ec:	7b4080e7          	jalr	1972(ra) # 80206b9c <formatname>
    802053f0:	89aa                	mv	s3,a0
    802053f2:	c535                	beqz	a0,8020545e <sys_rename+0xee>
    goto fail;          // src doesn't exist || dst parent doesn't exist || illegal new name
  }
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    if (ep == src) {    // In what universe can we move a directory into its child?
    802053f4:	07248563          	beq	s1,s2,8020545e <sys_rename+0xee>
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    802053f8:	87ca                	mv	a5,s2
    802053fa:	1207b783          	ld	a5,288(a5)
    802053fe:	c781                	beqz	a5,80205406 <sys_rename+0x96>
    if (ep == src) {    // In what universe can we move a directory into its child?
    80205400:	fef49de3          	bne	s1,a5,802053fa <sys_rename+0x8a>
    80205404:	a8a9                	j	8020545e <sys_rename+0xee>
      goto fail;
    }
  }

  uint off;
  elock(src);     // must hold child's lock before acquiring parent's, because we do so in other similar cases
    80205406:	8526                	mv	a0,s1
    80205408:	00002097          	auipc	ra,0x2
    8020540c:	e5a080e7          	jalr	-422(ra) # 80207262 <elock>
  srclock = 1;
  elock(pdst);
    80205410:	854a                	mv	a0,s2
    80205412:	00002097          	auipc	ra,0x2
    80205416:	e50080e7          	jalr	-432(ra) # 80207262 <elock>
  dst = dirlookup(pdst, name, &off);
    8020541a:	dbc40613          	addi	a2,s0,-580
    8020541e:	85ce                	mv	a1,s3
    80205420:	854a                	mv	a0,s2
    80205422:	00002097          	auipc	ra,0x2
    80205426:	1d4080e7          	jalr	468(ra) # 802075f6 <dirlookup>
    8020542a:	8a2a                	mv	s4,a0
  if (dst != NULL) {
    8020542c:	cd45                	beqz	a0,802054e4 <sys_rename+0x174>
    eunlock(pdst);
    8020542e:	854a                	mv	a0,s2
    80205430:	00002097          	auipc	ra,0x2
    80205434:	e68080e7          	jalr	-408(ra) # 80207298 <eunlock>
    if (src == dst) {
    80205438:	01448963          	beq	s1,s4,8020544a <sys_rename+0xda>
      goto fail;
    } else if (src->attribute & dst->attribute & ATTR_DIRECTORY) {
    8020543c:	1004c783          	lbu	a5,256(s1)
    80205440:	100a4703          	lbu	a4,256(s4)
    80205444:	8ff9                	and	a5,a5,a4
    80205446:	8bc1                	andi	a5,a5,16
    80205448:	ebb1                	bnez	a5,8020549c <sys_rename+0x12c>

  return 0;

fail:
  if (srclock)
    eunlock(src);
    8020544a:	8526                	mv	a0,s1
    8020544c:	00002097          	auipc	ra,0x2
    80205450:	e4c080e7          	jalr	-436(ra) # 80207298 <eunlock>
  if (dst)
    eput(dst);
    80205454:	8552                	mv	a0,s4
    80205456:	00002097          	auipc	ra,0x2
    8020545a:	e90080e7          	jalr	-368(ra) # 802072e6 <eput>
  if (pdst)
    8020545e:	00090763          	beqz	s2,8020546c <sys_rename+0xfc>
    eput(pdst);
    80205462:	854a                	mv	a0,s2
    80205464:	00002097          	auipc	ra,0x2
    80205468:	e82080e7          	jalr	-382(ra) # 802072e6 <eput>
  if (src)
    eput(src);
  return -1;
    8020546c:	57fd                	li	a5,-1
  if (src)
    8020546e:	c499                	beqz	s1,8020547c <sys_rename+0x10c>
    eput(src);
    80205470:	8526                	mv	a0,s1
    80205472:	00002097          	auipc	ra,0x2
    80205476:	e74080e7          	jalr	-396(ra) # 802072e6 <eput>
  return -1;
    8020547a:	57fd                	li	a5,-1
}
    8020547c:	853e                	mv	a0,a5
    8020547e:	3b813083          	ld	ra,952(sp)
    80205482:	3b013403          	ld	s0,944(sp)
    80205486:	3a813483          	ld	s1,936(sp)
    8020548a:	3a013903          	ld	s2,928(sp)
    8020548e:	39813983          	ld	s3,920(sp)
    80205492:	39013a03          	ld	s4,912(sp)
    80205496:	3c010113          	addi	sp,sp,960
    8020549a:	8082                	ret
      elock(dst);
    8020549c:	8552                	mv	a0,s4
    8020549e:	00002097          	auipc	ra,0x2
    802054a2:	dc4080e7          	jalr	-572(ra) # 80207262 <elock>
  ep.valid = 0;
    802054a6:	d6041323          	sh	zero,-666(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    802054aa:	c4c40693          	addi	a3,s0,-948
    802054ae:	04000613          	li	a2,64
    802054b2:	c5040593          	addi	a1,s0,-944
    802054b6:	8552                	mv	a0,s4
    802054b8:	00002097          	auipc	ra,0x2
    802054bc:	fae080e7          	jalr	-82(ra) # 80207466 <enext>
      if (!isdirempty(dst)) {    // it's ok to overwrite an empty dir
    802054c0:	57fd                	li	a5,-1
    802054c2:	0cf51863          	bne	a0,a5,80205592 <sys_rename+0x222>
      elock(pdst);
    802054c6:	854a                	mv	a0,s2
    802054c8:	00002097          	auipc	ra,0x2
    802054cc:	d9a080e7          	jalr	-614(ra) # 80207262 <elock>
    eremove(dst);
    802054d0:	8552                	mv	a0,s4
    802054d2:	00002097          	auipc	ra,0x2
    802054d6:	c5c080e7          	jalr	-932(ra) # 8020712e <eremove>
    eunlock(dst);
    802054da:	8552                	mv	a0,s4
    802054dc:	00002097          	auipc	ra,0x2
    802054e0:	dbc080e7          	jalr	-580(ra) # 80207298 <eunlock>
  memmove(src->filename, name, FAT32_MAX_FILENAME);
    802054e4:	0ff00613          	li	a2,255
    802054e8:	85ce                	mv	a1,s3
    802054ea:	8526                	mv	a0,s1
    802054ec:	ffffb097          	auipc	ra,0xffffb
    802054f0:	2d8080e7          	jalr	728(ra) # 802007c4 <memmove>
  emake(pdst, src, off);
    802054f4:	dbc42603          	lw	a2,-580(s0)
    802054f8:	85a6                	mv	a1,s1
    802054fa:	854a                	mv	a0,s2
    802054fc:	00001097          	auipc	ra,0x1
    80205500:	758080e7          	jalr	1880(ra) # 80206c54 <emake>
  if (src->parent != pdst) {
    80205504:	1204b783          	ld	a5,288(s1)
    80205508:	01278d63          	beq	a5,s2,80205522 <sys_rename+0x1b2>
    eunlock(pdst);
    8020550c:	854a                	mv	a0,s2
    8020550e:	00002097          	auipc	ra,0x2
    80205512:	d8a080e7          	jalr	-630(ra) # 80207298 <eunlock>
    elock(src->parent);
    80205516:	1204b503          	ld	a0,288(s1)
    8020551a:	00002097          	auipc	ra,0x2
    8020551e:	d48080e7          	jalr	-696(ra) # 80207262 <elock>
  eremove(src);
    80205522:	8526                	mv	a0,s1
    80205524:	00002097          	auipc	ra,0x2
    80205528:	c0a080e7          	jalr	-1014(ra) # 8020712e <eremove>
  eunlock(src->parent);
    8020552c:	1204b503          	ld	a0,288(s1)
    80205530:	00002097          	auipc	ra,0x2
    80205534:	d68080e7          	jalr	-664(ra) # 80207298 <eunlock>
  struct dirent *psrc = src->parent;  // src must not be root, or it won't pass the for-loop test
    80205538:	1204b983          	ld	s3,288(s1)
  src->parent = edup(pdst);
    8020553c:	854a                	mv	a0,s2
    8020553e:	00002097          	auipc	ra,0x2
    80205542:	ac6080e7          	jalr	-1338(ra) # 80207004 <edup>
    80205546:	12a4b023          	sd	a0,288(s1)
  src->off = off;
    8020554a:	dbc42783          	lw	a5,-580(s0)
    8020554e:	10f4ae23          	sw	a5,284(s1)
  src->valid = 1;
    80205552:	4785                	li	a5,1
    80205554:	10f49b23          	sh	a5,278(s1)
  eunlock(src);
    80205558:	8526                	mv	a0,s1
    8020555a:	00002097          	auipc	ra,0x2
    8020555e:	d3e080e7          	jalr	-706(ra) # 80207298 <eunlock>
  eput(psrc);
    80205562:	854e                	mv	a0,s3
    80205564:	00002097          	auipc	ra,0x2
    80205568:	d82080e7          	jalr	-638(ra) # 802072e6 <eput>
  if (dst) {
    8020556c:	000a0763          	beqz	s4,8020557a <sys_rename+0x20a>
    eput(dst);
    80205570:	8552                	mv	a0,s4
    80205572:	00002097          	auipc	ra,0x2
    80205576:	d74080e7          	jalr	-652(ra) # 802072e6 <eput>
  eput(pdst);
    8020557a:	854a                	mv	a0,s2
    8020557c:	00002097          	auipc	ra,0x2
    80205580:	d6a080e7          	jalr	-662(ra) # 802072e6 <eput>
  eput(src);
    80205584:	8526                	mv	a0,s1
    80205586:	00002097          	auipc	ra,0x2
    8020558a:	d60080e7          	jalr	-672(ra) # 802072e6 <eput>
  return 0;
    8020558e:	4781                	li	a5,0
    80205590:	b5f5                	j	8020547c <sys_rename+0x10c>
        eunlock(dst);
    80205592:	8552                	mv	a0,s4
    80205594:	00002097          	auipc	ra,0x2
    80205598:	d04080e7          	jalr	-764(ra) # 80207298 <eunlock>
        goto fail;
    8020559c:	b57d                	j	8020544a <sys_rename+0xda>
  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
    8020559e:	892a                	mv	s2,a0
  if (dst)
    802055a0:	bd7d                	j	8020545e <sys_rename+0xee>

00000000802055a2 <sys_openat>:

// added by lmq for SYS_openat
uint64
sys_openat(void)
{
    802055a2:	ca010113          	addi	sp,sp,-864
    802055a6:	34113c23          	sd	ra,856(sp)
    802055aa:	34813823          	sd	s0,848(sp)
    802055ae:	34913423          	sd	s1,840(sp)
    802055b2:	35213023          	sd	s2,832(sp)
    802055b6:	33313c23          	sd	s3,824(sp)
    802055ba:	33413823          	sd	s4,816(sp)
    802055be:	33513423          	sd	s5,808(sp)
    802055c2:	1680                	addi	s0,sp,864
  int dirfd;
  if(argint(0, &dirfd) < 0)
    802055c4:	fbc40593          	addi	a1,s0,-68
    802055c8:	4501                	li	a0,0
    802055ca:	ffffe097          	auipc	ra,0xffffe
    802055ce:	a44080e7          	jalr	-1468(ra) # 8020300e <argint>
    802055d2:	2e054563          	bltz	a0,802058bc <sys_openat+0x31a>
    return -1;
  struct dirent *de = myproc()->cwd;
    802055d6:	ffffc097          	auipc	ra,0xffffc
    802055da:	482080e7          	jalr	1154(ra) # 80201a58 <myproc>
  if(dirfd!=AT_FDCWD)
    802055de:	fbc42703          	lw	a4,-68(s0)
    802055e2:	f9c00793          	li	a5,-100
    802055e6:	16f71563          	bne	a4,a5,80205750 <sys_openat+0x1ae>
  struct dirent *de = myproc()->cwd;
    802055ea:	4d853483          	ld	s1,1240(a0)
  {
    de=myproc()->ofile[dirfd]->ep;
  }
  char cur_path[FAT32_MAX_PATH];  // openat工作目录 可以为当前目录 也可以被指定
  memset(cur_path,0,FAT32_MAX_PATH);
    802055ee:	10400613          	li	a2,260
    802055f2:	4581                	li	a1,0
    802055f4:	eb840513          	addi	a0,s0,-328
    802055f8:	ffffb097          	auipc	ra,0xffffb
    802055fc:	16c080e7          	jalr	364(ra) # 80200764 <memset>
  char* s=NULL;
  int len;

  // 获得openat工作目录路径
  if (de->parent == NULL) {
    80205600:	1204b783          	ld	a5,288(s1)
    80205604:	16078263          	beqz	a5,80205768 <sys_openat+0x1c6>
    s = "/";
  } 
  else {
    s = cur_path + FAT32_MAX_PATH - 1;
    *s = '\0';
    80205608:	fa040da3          	sb	zero,-69(s0)
    s = cur_path + FAT32_MAX_PATH - 1;
    8020560c:	fbb40993          	addi	s3,s0,-69
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= cur_path)          // can't reach root "/"
    80205610:	eb840a13          	addi	s4,s0,-328
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    80205614:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    80205618:	8526                	mv	a0,s1
    8020561a:	ffffb097          	auipc	ra,0xffffb
    8020561e:	2d2080e7          	jalr	722(ra) # 802008ec <strlen>
    80205622:	862a                	mv	a2,a0
      s -= len;
    80205624:	40a98933          	sub	s2,s3,a0
      if (s <= cur_path)          // can't reach root "/"
    80205628:	292a7c63          	bgeu	s4,s2,802058c0 <sys_openat+0x31e>
      strncpy(s, de->filename, len);
    8020562c:	85a6                	mv	a1,s1
    8020562e:	854a                	mv	a0,s2
    80205630:	ffffb097          	auipc	ra,0xffffb
    80205634:	24c080e7          	jalr	588(ra) # 8020087c <strncpy>
      *--s = '/';
    80205638:	fff90993          	addi	s3,s2,-1
    8020563c:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    80205640:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    80205644:	1204b783          	ld	a5,288(s1)
    80205648:	fbe1                	bnez	a5,80205618 <sys_openat+0x76>
    }
  }
  
  // 获得openat的文件路径 openat工作目录+相对路径
  char absolute_path[FAT32_MAX_PATH];
  memset(absolute_path,0,FAT32_MAX_PATH);
    8020564a:	10400613          	li	a2,260
    8020564e:	4581                	li	a1,0
    80205650:	db040493          	addi	s1,s0,-592
    80205654:	8526                	mv	a0,s1
    80205656:	ffffb097          	auipc	ra,0xffffb
    8020565a:	10e080e7          	jalr	270(ra) # 80200764 <memset>
  strncpy(absolute_path,s,strlen(s));
    8020565e:	854e                	mv	a0,s3
    80205660:	ffffb097          	auipc	ra,0xffffb
    80205664:	28c080e7          	jalr	652(ra) # 802008ec <strlen>
    80205668:	862a                	mv	a2,a0
    8020566a:	85ce                	mv	a1,s3
    8020566c:	8526                	mv	a0,s1
    8020566e:	ffffb097          	auipc	ra,0xffffb
    80205672:	20e080e7          	jalr	526(ra) # 8020087c <strncpy>

  int fd,omode;
  struct file *f;
  struct dirent *ep;
  char relative_path[FAT32_MAX_PATH];
  if(argstr(1, relative_path, FAT32_MAX_PATH) < 0 || argint(2,&omode) < 0)
    80205676:	10400613          	li	a2,260
    8020567a:	ca840593          	addi	a1,s0,-856
    8020567e:	4505                	li	a0,1
    80205680:	ffffe097          	auipc	ra,0xffffe
    80205684:	a12080e7          	jalr	-1518(ra) # 80203092 <argstr>
    80205688:	24054e63          	bltz	a0,802058e4 <sys_openat+0x342>
    8020568c:	dac40593          	addi	a1,s0,-596
    80205690:	4509                	li	a0,2
    80205692:	ffffe097          	auipc	ra,0xffffe
    80205696:	97c080e7          	jalr	-1668(ra) # 8020300e <argint>
    8020569a:	24054763          	bltz	a0,802058e8 <sys_openat+0x346>
    return -1;
  
  if(relative_path[0]=='/')                               // 为绝对路径 忽略dirfd
    8020569e:	ca844783          	lbu	a5,-856(s0)
    802056a2:	02f00713          	li	a4,47
    802056a6:	0ce78663          	beq	a5,a4,80205772 <sys_openat+0x1d0>
  {
    memset(absolute_path,0,FAT32_MAX_PATH);
    strncpy(absolute_path,relative_path,strlen(relative_path));
  }
  else if(relative_path[0]=='.' && relative_path[1]=='/') // 为显式相对路径
    802056aa:	02e00713          	li	a4,46
    802056ae:	0ee78963          	beq	a5,a4,802057a0 <sys_openat+0x1fe>
  {
    panic("openat not support ..");
  }
  else                                                    // 为隐式相对路径
  {
    int absolute_path_old_len=strlen(absolute_path);
    802056b2:	db040913          	addi	s2,s0,-592
    802056b6:	854a                	mv	a0,s2
    802056b8:	ffffb097          	auipc	ra,0xffffb
    802056bc:	234080e7          	jalr	564(ra) # 802008ec <strlen>
    absolute_path[absolute_path_old_len]='/';
    802056c0:	fc040793          	addi	a5,s0,-64
    802056c4:	97aa                	add	a5,a5,a0
    802056c6:	02f00713          	li	a4,47
    802056ca:	dee78823          	sb	a4,-528(a5)
    absolute_path[absolute_path_old_len+1]='\0';
    802056ce:	2505                	addiw	a0,a0,1
    802056d0:	fc040793          	addi	a5,s0,-64
    802056d4:	953e                	add	a0,a0,a5
    802056d6:	de050823          	sb	zero,-528(a0)
    strncpy(absolute_path+strlen(absolute_path),
    802056da:	854a                	mv	a0,s2
    802056dc:	ffffb097          	auipc	ra,0xffffb
    802056e0:	210080e7          	jalr	528(ra) # 802008ec <strlen>
    802056e4:	84aa                	mv	s1,a0
    802056e6:	ca840993          	addi	s3,s0,-856
    802056ea:	854e                	mv	a0,s3
    802056ec:	ffffb097          	auipc	ra,0xffffb
    802056f0:	200080e7          	jalr	512(ra) # 802008ec <strlen>
    802056f4:	862a                	mv	a2,a0
    802056f6:	85ce                	mv	a1,s3
    802056f8:	00990533          	add	a0,s2,s1
    802056fc:	ffffb097          	auipc	ra,0xffffb
    80205700:	180080e7          	jalr	384(ra) # 8020087c <strncpy>
            relative_path,
            strlen(relative_path));
  }

  // 根据路径名打开文件
  if(omode & O_CREATE){                         // 创建文件
    80205704:	dac42603          	lw	a2,-596(s0)
    80205708:	24067793          	andi	a5,a2,576
    8020570c:	e7e5                	bnez	a5,802057f4 <sys_openat+0x252>
    ep = create(absolute_path, T_FILE, omode);
    if(ep == NULL){
      return -1;
    }
  } 
  else if(omode & O_DIRECTORY)                  // 打开一个目录
    8020570e:	02a61793          	slli	a5,a2,0x2a
    80205712:	1607d063          	bgez	a5,80205872 <sys_openat+0x2d0>
  {
    
    if((ep=ename(absolute_path))==NULL)         // 获取目录项
    80205716:	db040513          	addi	a0,s0,-592
    8020571a:	00002097          	auipc	ra,0x2
    8020571e:	2f2080e7          	jalr	754(ra) # 80207a0c <ename>
    80205722:	892a                	mv	s2,a0
    80205724:	1c050663          	beqz	a0,802058f0 <sys_openat+0x34e>
    {
      return -1;
    }
    elock(ep);
    80205728:	00002097          	auipc	ra,0x2
    8020572c:	b3a080e7          	jalr	-1222(ra) # 80207262 <elock>
    if(!(ep->attribute & ATTR_DIRECTORY))       // 该文件不是目录文件
    80205730:	10094783          	lbu	a5,256(s2)
    80205734:	8bc1                	andi	a5,a5,16
    80205736:	ebe1                	bnez	a5,80205806 <sys_openat+0x264>
    {
      eunlock(ep);
    80205738:	854a                	mv	a0,s2
    8020573a:	00002097          	auipc	ra,0x2
    8020573e:	b5e080e7          	jalr	-1186(ra) # 80207298 <eunlock>
      eput(ep);
    80205742:	854a                	mv	a0,s2
    80205744:	00002097          	auipc	ra,0x2
    80205748:	ba2080e7          	jalr	-1118(ra) # 802072e6 <eput>
      return -1;
    8020574c:	557d                	li	a0,-1
    8020574e:	aa95                	j	802058c2 <sys_openat+0x320>
    de=myproc()->ofile[dirfd]->ep;
    80205750:	ffffc097          	auipc	ra,0xffffc
    80205754:	308080e7          	jalr	776(ra) # 80201a58 <myproc>
    80205758:	fbc42783          	lw	a5,-68(s0)
    8020575c:	07e9                	addi	a5,a5,26
    8020575e:	078e                	slli	a5,a5,0x3
    80205760:	97aa                	add	a5,a5,a0
    80205762:	679c                	ld	a5,8(a5)
    80205764:	6f84                	ld	s1,24(a5)
    80205766:	b561                	j	802055ee <sys_openat+0x4c>
    s = "/";
    80205768:	00005997          	auipc	s3,0x5
    8020576c:	ec898993          	addi	s3,s3,-312 # 8020a630 <digits+0x2b0>
    80205770:	bde9                	j	8020564a <sys_openat+0xa8>
    memset(absolute_path,0,FAT32_MAX_PATH);
    80205772:	10400613          	li	a2,260
    80205776:	4581                	li	a1,0
    80205778:	8526                	mv	a0,s1
    8020577a:	ffffb097          	auipc	ra,0xffffb
    8020577e:	fea080e7          	jalr	-22(ra) # 80200764 <memset>
    strncpy(absolute_path,relative_path,strlen(relative_path));
    80205782:	ca840913          	addi	s2,s0,-856
    80205786:	854a                	mv	a0,s2
    80205788:	ffffb097          	auipc	ra,0xffffb
    8020578c:	164080e7          	jalr	356(ra) # 802008ec <strlen>
    80205790:	862a                	mv	a2,a0
    80205792:	85ca                	mv	a1,s2
    80205794:	8526                	mv	a0,s1
    80205796:	ffffb097          	auipc	ra,0xffffb
    8020579a:	0e6080e7          	jalr	230(ra) # 8020087c <strncpy>
    8020579e:	b79d                	j	80205704 <sys_openat+0x162>
  else if(relative_path[0]=='.' && relative_path[1]=='/') // 为显式相对路径
    802057a0:	ca944783          	lbu	a5,-855(s0)
    802057a4:	02f00713          	li	a4,47
    802057a8:	00e78e63          	beq	a5,a4,802057c4 <sys_openat+0x222>
  else if (relative_path[0]=='.' && relative_path[1]=='.')// 显示相对路径 没有实现
    802057ac:	02e00713          	li	a4,46
    802057b0:	f0e791e3          	bne	a5,a4,802056b2 <sys_openat+0x110>
    panic("openat not support ..");
    802057b4:	00005517          	auipc	a0,0x5
    802057b8:	4f450513          	addi	a0,a0,1268 # 8020aca8 <digits+0x928>
    802057bc:	ffffb097          	auipc	ra,0xffffb
    802057c0:	986080e7          	jalr	-1658(ra) # 80200142 <panic>
    strncpy(absolute_path+strlen(absolute_path),
    802057c4:	db040913          	addi	s2,s0,-592
    802057c8:	854a                	mv	a0,s2
    802057ca:	ffffb097          	auipc	ra,0xffffb
    802057ce:	122080e7          	jalr	290(ra) # 802008ec <strlen>
    802057d2:	84aa                	mv	s1,a0
    802057d4:	ca940993          	addi	s3,s0,-855
    802057d8:	854e                	mv	a0,s3
    802057da:	ffffb097          	auipc	ra,0xffffb
    802057de:	112080e7          	jalr	274(ra) # 802008ec <strlen>
    802057e2:	862a                	mv	a2,a0
    802057e4:	85ce                	mv	a1,s3
    802057e6:	00990533          	add	a0,s2,s1
    802057ea:	ffffb097          	auipc	ra,0xffffb
    802057ee:	092080e7          	jalr	146(ra) # 8020087c <strncpy>
    802057f2:	bf09                	j	80205704 <sys_openat+0x162>
    ep = create(absolute_path, T_FILE, omode);
    802057f4:	4589                	li	a1,2
    802057f6:	db040513          	addi	a0,s0,-592
    802057fa:	fffff097          	auipc	ra,0xfffff
    802057fe:	290080e7          	jalr	656(ra) # 80204a8a <create>
    80205802:	892a                	mv	s2,a0
    if(ep == NULL){
    80205804:	c565                	beqz	a0,802058ec <sys_openat+0x34a>
      return -1;
    }
  }

  
  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80205806:	ffffe097          	auipc	ra,0xffffe
    8020580a:	612080e7          	jalr	1554(ra) # 80203e18 <filealloc>
    8020580e:	89aa                	mv	s3,a0
    80205810:	c96d                	beqz	a0,80205902 <sys_openat+0x360>
    80205812:	fffff097          	auipc	ra,0xfffff
    80205816:	234080e7          	jalr	564(ra) # 80204a46 <fdalloc>
    8020581a:	84aa                	mv	s1,a0
    8020581c:	0c054e63          	bltz	a0,802058f8 <sys_openat+0x356>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    80205820:	10094783          	lbu	a5,256(s2)
    80205824:	8bc1                	andi	a5,a5,16
    80205826:	e791                	bnez	a5,80205832 <sys_openat+0x290>
    80205828:	dac42783          	lw	a5,-596(s0)
    8020582c:	4007f793          	andi	a5,a5,1024
    80205830:	e3c1                	bnez	a5,802058b0 <sys_openat+0x30e>
    etrunc(ep);
  }

  // 设置权限
  f->type = FD_ENTRY;
    80205832:	4789                	li	a5,2
    80205834:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    80205838:	dac42783          	lw	a5,-596(s0)
    8020583c:	0047f693          	andi	a3,a5,4
    80205840:	4701                	li	a4,0
    80205842:	c299                	beqz	a3,80205848 <sys_openat+0x2a6>
    80205844:	10892703          	lw	a4,264(s2)
    80205848:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    8020584c:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    80205850:	0017c713          	xori	a4,a5,1
    80205854:	8b05                	andi	a4,a4,1
    80205856:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    8020585a:	8b8d                	andi	a5,a5,3
    8020585c:	00f037b3          	snez	a5,a5
    80205860:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    80205864:	854a                	mv	a0,s2
    80205866:	00002097          	auipc	ra,0x2
    8020586a:	a32080e7          	jalr	-1486(ra) # 80207298 <eunlock>

  return fd;
    8020586e:	8526                	mv	a0,s1
    80205870:	a889                	j	802058c2 <sys_openat+0x320>
    if((ep = ename(absolute_path)) == NULL){
    80205872:	db040513          	addi	a0,s0,-592
    80205876:	00002097          	auipc	ra,0x2
    8020587a:	196080e7          	jalr	406(ra) # 80207a0c <ename>
    8020587e:	892a                	mv	s2,a0
    80205880:	c935                	beqz	a0,802058f4 <sys_openat+0x352>
    elock(ep);
    80205882:	00002097          	auipc	ra,0x2
    80205886:	9e0080e7          	jalr	-1568(ra) # 80207262 <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    8020588a:	10094783          	lbu	a5,256(s2)
    8020588e:	8bc1                	andi	a5,a5,16
    80205890:	dbbd                	beqz	a5,80205806 <sys_openat+0x264>
    80205892:	dac42783          	lw	a5,-596(s0)
    80205896:	dba5                	beqz	a5,80205806 <sys_openat+0x264>
      eunlock(ep);
    80205898:	854a                	mv	a0,s2
    8020589a:	00002097          	auipc	ra,0x2
    8020589e:	9fe080e7          	jalr	-1538(ra) # 80207298 <eunlock>
      eput(ep);
    802058a2:	854a                	mv	a0,s2
    802058a4:	00002097          	auipc	ra,0x2
    802058a8:	a42080e7          	jalr	-1470(ra) # 802072e6 <eput>
      return -1;
    802058ac:	557d                	li	a0,-1
    802058ae:	a811                	j	802058c2 <sys_openat+0x320>
    etrunc(ep);
    802058b0:	854a                	mv	a0,s2
    802058b2:	00002097          	auipc	ra,0x2
    802058b6:	946080e7          	jalr	-1722(ra) # 802071f8 <etrunc>
    802058ba:	bfa5                	j	80205832 <sys_openat+0x290>
    return -1;
    802058bc:	557d                	li	a0,-1
    802058be:	a011                	j	802058c2 <sys_openat+0x320>
        return -1;
    802058c0:	557d                	li	a0,-1
}
    802058c2:	35813083          	ld	ra,856(sp)
    802058c6:	35013403          	ld	s0,848(sp)
    802058ca:	34813483          	ld	s1,840(sp)
    802058ce:	34013903          	ld	s2,832(sp)
    802058d2:	33813983          	ld	s3,824(sp)
    802058d6:	33013a03          	ld	s4,816(sp)
    802058da:	32813a83          	ld	s5,808(sp)
    802058de:	36010113          	addi	sp,sp,864
    802058e2:	8082                	ret
    return -1;
    802058e4:	557d                	li	a0,-1
    802058e6:	bff1                	j	802058c2 <sys_openat+0x320>
    802058e8:	557d                	li	a0,-1
    802058ea:	bfe1                	j	802058c2 <sys_openat+0x320>
      return -1;
    802058ec:	557d                	li	a0,-1
    802058ee:	bfd1                	j	802058c2 <sys_openat+0x320>
      return -1;
    802058f0:	557d                	li	a0,-1
    802058f2:	bfc1                	j	802058c2 <sys_openat+0x320>
      return -1;
    802058f4:	557d                	li	a0,-1
    802058f6:	b7f1                	j	802058c2 <sys_openat+0x320>
      fileclose(f);
    802058f8:	854e                	mv	a0,s3
    802058fa:	ffffe097          	auipc	ra,0xffffe
    802058fe:	5da080e7          	jalr	1498(ra) # 80203ed4 <fileclose>
    eunlock(ep);
    80205902:	854a                	mv	a0,s2
    80205904:	00002097          	auipc	ra,0x2
    80205908:	994080e7          	jalr	-1644(ra) # 80207298 <eunlock>
    eput(ep);
    8020590c:	854a                	mv	a0,s2
    8020590e:	00002097          	auipc	ra,0x2
    80205912:	9d8080e7          	jalr	-1576(ra) # 802072e6 <eput>
    return -1;
    80205916:	557d                	li	a0,-1
    80205918:	b76d                	j	802058c2 <sys_openat+0x320>

000000008020591a <sys_mkdirat>:


// added by lmq for SYS_mkdirat
uint64
sys_mkdirat(void)
{
    8020591a:	da010113          	addi	sp,sp,-608
    8020591e:	24113c23          	sd	ra,600(sp)
    80205922:	24813823          	sd	s0,592(sp)
    80205926:	24913423          	sd	s1,584(sp)
    8020592a:	25213023          	sd	s2,576(sp)
    8020592e:	23313c23          	sd	s3,568(sp)
    80205932:	23413823          	sd	s4,560(sp)
    80205936:	23513423          	sd	s5,552(sp)
    8020593a:	1480                	addi	s0,sp,608
  int dirfd,omode;
  char des_path[FAT32_MAX_PATH];
  if(argint(0, &dirfd) < 0 || argstr(1,des_path,FAT32_MAX_PATH)<0 || argint(2,&omode)<0)
    8020593c:	fbc40593          	addi	a1,s0,-68
    80205940:	4501                	li	a0,0
    80205942:	ffffd097          	auipc	ra,0xffffd
    80205946:	6cc080e7          	jalr	1740(ra) # 8020300e <argint>
    8020594a:	20054663          	bltz	a0,80205b56 <sys_mkdirat+0x23c>
    8020594e:	10400613          	li	a2,260
    80205952:	eb040593          	addi	a1,s0,-336
    80205956:	4505                	li	a0,1
    80205958:	ffffd097          	auipc	ra,0xffffd
    8020595c:	73a080e7          	jalr	1850(ra) # 80203092 <argstr>
    80205960:	20054d63          	bltz	a0,80205b7a <sys_mkdirat+0x260>
    80205964:	fb840593          	addi	a1,s0,-72
    80205968:	4509                	li	a0,2
    8020596a:	ffffd097          	auipc	ra,0xffffd
    8020596e:	6a4080e7          	jalr	1700(ra) # 8020300e <argint>
    80205972:	20054663          	bltz	a0,80205b7e <sys_mkdirat+0x264>
    return -1;


  // 如果dirfd不为AT_FDCWD 则获得dirfd的路径
  char cur_path[FAT32_MAX_PATH];
  memset(cur_path,0,FAT32_MAX_PATH);
    80205976:	10400613          	li	a2,260
    8020597a:	4581                	li	a1,0
    8020597c:	da840513          	addi	a0,s0,-600
    80205980:	ffffb097          	auipc	ra,0xffffb
    80205984:	de4080e7          	jalr	-540(ra) # 80200764 <memset>
  char* s=NULL;
  int len;
  if(dirfd!=AT_FDCWD)
    80205988:	fbc42703          	lw	a4,-68(s0)
    8020598c:	f9c00793          	li	a5,-100
    80205990:	10f70963          	beq	a4,a5,80205aa2 <sys_mkdirat+0x188>
  {
    struct dirent* de=myproc()->ofile[dirfd]->ep;
    80205994:	ffffc097          	auipc	ra,0xffffc
    80205998:	0c4080e7          	jalr	196(ra) # 80201a58 <myproc>
    8020599c:	fbc42783          	lw	a5,-68(s0)
    802059a0:	07e9                	addi	a5,a5,26
    802059a2:	078e                	slli	a5,a5,0x3
    802059a4:	97aa                	add	a5,a5,a0
    802059a6:	679c                	ld	a5,8(a5)
    802059a8:	6f84                	ld	s1,24(a5)
    if (de->parent == NULL) {
    802059aa:	1204b783          	ld	a5,288(s1)
    802059ae:	12078063          	beqz	a5,80205ace <sys_mkdirat+0x1b4>
      s = "/";
    } 
    else {
      s = cur_path + FAT32_MAX_PATH - 1;
      *s = '\0';
    802059b2:	ea0405a3          	sb	zero,-341(s0)
      s = cur_path + FAT32_MAX_PATH - 1;
    802059b6:	eab40993          	addi	s3,s0,-341
      while (de->parent) {
        len = strlen(de->filename);
        s -= len;
        if (s <= cur_path)          // can't reach root "/"
    802059ba:	da840a13          	addi	s4,s0,-600
          return -1;
        strncpy(s, de->filename, len);
        *--s = '/';
    802059be:	02f00a93          	li	s5,47
        len = strlen(de->filename);
    802059c2:	8526                	mv	a0,s1
    802059c4:	ffffb097          	auipc	ra,0xffffb
    802059c8:	f28080e7          	jalr	-216(ra) # 802008ec <strlen>
    802059cc:	862a                	mv	a2,a0
        s -= len;
    802059ce:	40a98933          	sub	s2,s3,a0
        if (s <= cur_path)          // can't reach root "/"
    802059d2:	1b2a7863          	bgeu	s4,s2,80205b82 <sys_mkdirat+0x268>
        strncpy(s, de->filename, len);
    802059d6:	85a6                	mv	a1,s1
    802059d8:	854a                	mv	a0,s2
    802059da:	ffffb097          	auipc	ra,0xffffb
    802059de:	ea2080e7          	jalr	-350(ra) # 8020087c <strncpy>
        *--s = '/';
    802059e2:	fff90993          	addi	s3,s2,-1
    802059e6:	ff590fa3          	sb	s5,-1(s2)
        de = de->parent;
    802059ea:	1204b483          	ld	s1,288(s1)
      while (de->parent) {
    802059ee:	1204b783          	ld	a5,288(s1)
    802059f2:	fbe1                	bnez	a5,802059c2 <sys_mkdirat+0xa8>
      }
    }
    memset(cur_path,0,FAT32_MAX_PATH);
    802059f4:	10400613          	li	a2,260
    802059f8:	4581                	li	a1,0
    802059fa:	da840493          	addi	s1,s0,-600
    802059fe:	8526                	mv	a0,s1
    80205a00:	ffffb097          	auipc	ra,0xffffb
    80205a04:	d64080e7          	jalr	-668(ra) # 80200764 <memset>
    strncpy(cur_path,s,strlen(s));
    80205a08:	854e                	mv	a0,s3
    80205a0a:	ffffb097          	auipc	ra,0xffffb
    80205a0e:	ee2080e7          	jalr	-286(ra) # 802008ec <strlen>
    80205a12:	862a                	mv	a2,a0
    80205a14:	85ce                	mv	a1,s3
    80205a16:	8526                	mv	a0,s1
    80205a18:	ffffb097          	auipc	ra,0xffffb
    80205a1c:	e64080e7          	jalr	-412(ra) # 8020087c <strncpy>
    if(des_path[0]!='/')
    80205a20:	eb044783          	lbu	a5,-336(s0)
    80205a24:	02f00713          	li	a4,47
    80205a28:	06e78d63          	beq	a5,a4,80205aa2 <sys_mkdirat+0x188>
    {
      if(des_path[0]=='.' && des_path[1]=='/')
    80205a2c:	02e00713          	li	a4,46
    80205a30:	0ae78463          	beq	a5,a4,80205ad8 <sys_mkdirat+0x1be>
      {
        panic("mkdirat not support ..\n");
      }
      else
      {
        cur_path[strlen(cur_path)]='/';
    80205a34:	da840493          	addi	s1,s0,-600
    80205a38:	8526                	mv	a0,s1
    80205a3a:	ffffb097          	auipc	ra,0xffffb
    80205a3e:	eb2080e7          	jalr	-334(ra) # 802008ec <strlen>
    80205a42:	fc040793          	addi	a5,s0,-64
    80205a46:	953e                	add	a0,a0,a5
    80205a48:	02f00793          	li	a5,47
    80205a4c:	def50423          	sb	a5,-536(a0)
        strncpy(cur_path+strlen(cur_path),des_path,strlen(des_path));
    80205a50:	8526                	mv	a0,s1
    80205a52:	ffffb097          	auipc	ra,0xffffb
    80205a56:	e9a080e7          	jalr	-358(ra) # 802008ec <strlen>
    80205a5a:	89aa                	mv	s3,a0
    80205a5c:	eb040913          	addi	s2,s0,-336
    80205a60:	854a                	mv	a0,s2
    80205a62:	ffffb097          	auipc	ra,0xffffb
    80205a66:	e8a080e7          	jalr	-374(ra) # 802008ec <strlen>
    80205a6a:	862a                	mv	a2,a0
    80205a6c:	85ca                	mv	a1,s2
    80205a6e:	01348533          	add	a0,s1,s3
    80205a72:	ffffb097          	auipc	ra,0xffffb
    80205a76:	e0a080e7          	jalr	-502(ra) # 8020087c <strncpy>
        memset(des_path,0,FAT32_MAX_PATH);
    80205a7a:	10400613          	li	a2,260
    80205a7e:	4581                	li	a1,0
    80205a80:	854a                	mv	a0,s2
    80205a82:	ffffb097          	auipc	ra,0xffffb
    80205a86:	ce2080e7          	jalr	-798(ra) # 80200764 <memset>
        strncpy(des_path,cur_path,strlen(cur_path));
    80205a8a:	8526                	mv	a0,s1
    80205a8c:	ffffb097          	auipc	ra,0xffffb
    80205a90:	e60080e7          	jalr	-416(ra) # 802008ec <strlen>
    80205a94:	862a                	mv	a2,a0
    80205a96:	85a6                	mv	a1,s1
    80205a98:	854a                	mv	a0,s2
    80205a9a:	ffffb097          	auipc	ra,0xffffb
    80205a9e:	de2080e7          	jalr	-542(ra) # 8020087c <strncpy>
    }
    
  }

  struct dirent* ep;
  if((ep = create(des_path, T_DIR, omode)) == 0)
    80205aa2:	fb842603          	lw	a2,-72(s0)
    80205aa6:	4585                	li	a1,1
    80205aa8:	eb040513          	addi	a0,s0,-336
    80205aac:	fffff097          	auipc	ra,0xfffff
    80205ab0:	fde080e7          	jalr	-34(ra) # 80204a8a <create>
    80205ab4:	84aa                	mv	s1,a0
    80205ab6:	c961                	beqz	a0,80205b86 <sys_mkdirat+0x26c>
  {
    return -1;
  }

  eunlock(ep);
    80205ab8:	00001097          	auipc	ra,0x1
    80205abc:	7e0080e7          	jalr	2016(ra) # 80207298 <eunlock>
  eput(ep);
    80205ac0:	8526                	mv	a0,s1
    80205ac2:	00002097          	auipc	ra,0x2
    80205ac6:	824080e7          	jalr	-2012(ra) # 802072e6 <eput>
  return 0;
    80205aca:	4501                	li	a0,0
    80205acc:	a071                	j	80205b58 <sys_mkdirat+0x23e>
      s = "/";
    80205ace:	00005997          	auipc	s3,0x5
    80205ad2:	b6298993          	addi	s3,s3,-1182 # 8020a630 <digits+0x2b0>
    80205ad6:	bf39                	j	802059f4 <sys_mkdirat+0xda>
      if(des_path[0]=='.' && des_path[1]=='/')
    80205ad8:	eb144783          	lbu	a5,-335(s0)
    80205adc:	02f00713          	li	a4,47
    80205ae0:	00e78e63          	beq	a5,a4,80205afc <sys_mkdirat+0x1e2>
      else if(des_path[0]=='.' && des_path[1]=='.')
    80205ae4:	02e00713          	li	a4,46
    80205ae8:	f4e796e3          	bne	a5,a4,80205a34 <sys_mkdirat+0x11a>
        panic("mkdirat not support ..\n");
    80205aec:	00005517          	auipc	a0,0x5
    80205af0:	1d450513          	addi	a0,a0,468 # 8020acc0 <digits+0x940>
    80205af4:	ffffa097          	auipc	ra,0xffffa
    80205af8:	64e080e7          	jalr	1614(ra) # 80200142 <panic>
        strncpy(cur_path+strlen(cur_path),des_path+1,strlen(des_path+1));
    80205afc:	8926                	mv	s2,s1
    80205afe:	8526                	mv	a0,s1
    80205b00:	ffffb097          	auipc	ra,0xffffb
    80205b04:	dec080e7          	jalr	-532(ra) # 802008ec <strlen>
    80205b08:	84aa                	mv	s1,a0
    80205b0a:	eb140993          	addi	s3,s0,-335
    80205b0e:	854e                	mv	a0,s3
    80205b10:	ffffb097          	auipc	ra,0xffffb
    80205b14:	ddc080e7          	jalr	-548(ra) # 802008ec <strlen>
    80205b18:	862a                	mv	a2,a0
    80205b1a:	85ce                	mv	a1,s3
    80205b1c:	00990533          	add	a0,s2,s1
    80205b20:	ffffb097          	auipc	ra,0xffffb
    80205b24:	d5c080e7          	jalr	-676(ra) # 8020087c <strncpy>
        memset(des_path,0,FAT32_MAX_PATH);
    80205b28:	10400613          	li	a2,260
    80205b2c:	4581                	li	a1,0
    80205b2e:	eb040493          	addi	s1,s0,-336
    80205b32:	8526                	mv	a0,s1
    80205b34:	ffffb097          	auipc	ra,0xffffb
    80205b38:	c30080e7          	jalr	-976(ra) # 80200764 <memset>
        strncpy(des_path,cur_path,strlen(cur_path));
    80205b3c:	854a                	mv	a0,s2
    80205b3e:	ffffb097          	auipc	ra,0xffffb
    80205b42:	dae080e7          	jalr	-594(ra) # 802008ec <strlen>
    80205b46:	862a                	mv	a2,a0
    80205b48:	85ca                	mv	a1,s2
    80205b4a:	8526                	mv	a0,s1
    80205b4c:	ffffb097          	auipc	ra,0xffffb
    80205b50:	d30080e7          	jalr	-720(ra) # 8020087c <strncpy>
    80205b54:	b7b9                	j	80205aa2 <sys_mkdirat+0x188>
    return -1;
    80205b56:	557d                	li	a0,-1
}
    80205b58:	25813083          	ld	ra,600(sp)
    80205b5c:	25013403          	ld	s0,592(sp)
    80205b60:	24813483          	ld	s1,584(sp)
    80205b64:	24013903          	ld	s2,576(sp)
    80205b68:	23813983          	ld	s3,568(sp)
    80205b6c:	23013a03          	ld	s4,560(sp)
    80205b70:	22813a83          	ld	s5,552(sp)
    80205b74:	26010113          	addi	sp,sp,608
    80205b78:	8082                	ret
    return -1;
    80205b7a:	557d                	li	a0,-1
    80205b7c:	bff1                	j	80205b58 <sys_mkdirat+0x23e>
    80205b7e:	557d                	li	a0,-1
    80205b80:	bfe1                	j	80205b58 <sys_mkdirat+0x23e>
          return -1;
    80205b82:	557d                	li	a0,-1
    80205b84:	bfd1                	j	80205b58 <sys_mkdirat+0x23e>
    return -1;
    80205b86:	557d                	li	a0,-1
    80205b88:	bfc1                	j	80205b58 <sys_mkdirat+0x23e>

0000000080205b8a <sys_dup3>:

// added by lmq for SYS_dup3
uint64
sys_dup3(void)
{
    80205b8a:	7179                	addi	sp,sp,-48
    80205b8c:	f406                	sd	ra,40(sp)
    80205b8e:	f022                	sd	s0,32(sp)
    80205b90:	ec26                	sd	s1,24(sp)
    80205b92:	1800                	addi	s0,sp,48
  struct file *f;
  int new_fd;
  struct proc* p=myproc();
    80205b94:	ffffc097          	auipc	ra,0xffffc
    80205b98:	ec4080e7          	jalr	-316(ra) # 80201a58 <myproc>
    80205b9c:	84aa                	mv	s1,a0

  if(argfd(0, 0, &f) < 0 || argint(1,&new_fd)<0)
    80205b9e:	fd840613          	addi	a2,s0,-40
    80205ba2:	4581                	li	a1,0
    80205ba4:	4501                	li	a0,0
    80205ba6:	fffff097          	auipc	ra,0xfffff
    80205baa:	e36080e7          	jalr	-458(ra) # 802049dc <argfd>
    return -1;
    80205bae:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(1,&new_fd)<0)
    80205bb0:	02054263          	bltz	a0,80205bd4 <sys_dup3+0x4a>
    80205bb4:	fd440593          	addi	a1,s0,-44
    80205bb8:	4505                	li	a0,1
    80205bba:	ffffd097          	auipc	ra,0xffffd
    80205bbe:	454080e7          	jalr	1108(ra) # 8020300e <argint>
    80205bc2:	02054963          	bltz	a0,80205bf4 <sys_dup3+0x6a>
  if(p->ofile[new_fd]!=0)        // 文件描述符[new_fd]已被占用
    80205bc6:	fd442503          	lw	a0,-44(s0)
    80205bca:	050e                	slli	a0,a0,0x3
    80205bcc:	94aa                	add	s1,s1,a0
    80205bce:	6cf8                	ld	a4,216(s1)
  {
    return -1;
    80205bd0:	57fd                	li	a5,-1
  if(p->ofile[new_fd]!=0)        // 文件描述符[new_fd]已被占用
    80205bd2:	c719                	beqz	a4,80205be0 <sys_dup3+0x56>
  }
  p->ofile[new_fd] = f;
  filedup(f);
  return new_fd;
}
    80205bd4:	853e                	mv	a0,a5
    80205bd6:	70a2                	ld	ra,40(sp)
    80205bd8:	7402                	ld	s0,32(sp)
    80205bda:	64e2                	ld	s1,24(sp)
    80205bdc:	6145                	addi	sp,sp,48
    80205bde:	8082                	ret
  p->ofile[new_fd] = f;
    80205be0:	fd843503          	ld	a0,-40(s0)
    80205be4:	ece8                	sd	a0,216(s1)
  filedup(f);
    80205be6:	ffffe097          	auipc	ra,0xffffe
    80205bea:	29c080e7          	jalr	668(ra) # 80203e82 <filedup>
  return new_fd;
    80205bee:	fd442783          	lw	a5,-44(s0)
    80205bf2:	b7cd                	j	80205bd4 <sys_dup3+0x4a>
    return -1;
    80205bf4:	57fd                	li	a5,-1
    80205bf6:	bff9                	j	80205bd4 <sys_dup3+0x4a>

0000000080205bf8 <sys_getdents64>:
  unsigned char   d_type;	    // 文件类型    
  char            d_name[];	  // 文件名
};
uint64 
sys_getdents64(void)
{
    80205bf8:	7139                	addi	sp,sp,-64
    80205bfa:	fc06                	sd	ra,56(sp)
    80205bfc:	f822                	sd	s0,48(sp)
    80205bfe:	f426                	sd	s1,40(sp)
    80205c00:	0080                	addi	s0,sp,64
  int fd,len;                   // fd:要读取的目录的文件描述符
  struct file* f;
  struct linux_dirent64* dirp64;// dirp64:存储信息的地址

  if(argfd(0,&fd,&f)<0 || argaddr(1,(uint64*)&dirp64)<0 || argint(2,&len))
    80205c02:	fd040613          	addi	a2,s0,-48
    80205c06:	fdc40593          	addi	a1,s0,-36
    80205c0a:	4501                	li	a0,0
    80205c0c:	fffff097          	auipc	ra,0xfffff
    80205c10:	dd0080e7          	jalr	-560(ra) # 802049dc <argfd>
  {
    return -1;
    80205c14:	57fd                	li	a5,-1
  if(argfd(0,&fd,&f)<0 || argaddr(1,(uint64*)&dirp64)<0 || argint(2,&len))
    80205c16:	08054163          	bltz	a0,80205c98 <sys_getdents64+0xa0>
    80205c1a:	fc840593          	addi	a1,s0,-56
    80205c1e:	4505                	li	a0,1
    80205c20:	ffffd097          	auipc	ra,0xffffd
    80205c24:	450080e7          	jalr	1104(ra) # 80203070 <argaddr>
    return -1;
    80205c28:	57fd                	li	a5,-1
  if(argfd(0,&fd,&f)<0 || argaddr(1,(uint64*)&dirp64)<0 || argint(2,&len))
    80205c2a:	06054763          	bltz	a0,80205c98 <sys_getdents64+0xa0>
    80205c2e:	fd840593          	addi	a1,s0,-40
    80205c32:	4509                	li	a0,2
    80205c34:	ffffd097          	auipc	ra,0xffffd
    80205c38:	3da080e7          	jalr	986(ra) # 8020300e <argint>
    return -1;
    80205c3c:	57fd                	li	a5,-1
  if(argfd(0,&fd,&f)<0 || argaddr(1,(uint64*)&dirp64)<0 || argint(2,&len))
    80205c3e:	ed29                	bnez	a0,80205c98 <sys_getdents64+0xa0>
  }
  int filename_len=strlen(f->ep->filename);
    80205c40:	fd043783          	ld	a5,-48(s0)
    80205c44:	6f88                	ld	a0,24(a5)
    80205c46:	ffffb097          	auipc	ra,0xffffb
    80205c4a:	ca6080e7          	jalr	-858(ra) # 802008ec <strlen>
    80205c4e:	84aa                	mv	s1,a0
  if(filename_len>len)
    80205c50:	fd842703          	lw	a4,-40(s0)
  {
    return -1;
    80205c54:	57fd                	li	a5,-1
  if(filename_len>len)
    80205c56:	04a74163          	blt	a4,a0,80205c98 <sys_getdents64+0xa0>
  }
  if(f->ep->parent==NULL)   // this direntry is root
    80205c5a:	fd043783          	ld	a5,-48(s0)
    80205c5e:	6f8c                	ld	a1,24(a5)
    80205c60:	1205b783          	ld	a5,288(a1) # ffffffffffffe120 <kernel_end+0xffffffff7fdc9120>
    80205c64:	c3a1                	beqz	a5,80205ca4 <sys_getdents64+0xac>
  {
    if(copyout2((uint64)dirp64->d_name, "/", 1) < 0 ||
      copyout2((uint64)&(dirp64->d_type),(char*)&f->type,sizeof(f->type) < 0 ))
    return -1;
  }
  else if(copyout2((uint64)dirp64->d_name, f->ep->filename, filename_len) < 0 ||
    80205c66:	862a                	mv	a2,a0
    80205c68:	fc843503          	ld	a0,-56(s0)
    80205c6c:	054d                	addi	a0,a0,19
    80205c6e:	ffffb097          	auipc	ra,0xffffb
    80205c72:	70e080e7          	jalr	1806(ra) # 8020137c <copyout2>
        copyout2((uint64)&(dirp64->d_type),(char*)&f->type,sizeof(f->type) < 0 ))
    return -1;
    80205c76:	57fd                	li	a5,-1
  else if(copyout2((uint64)dirp64->d_name, f->ep->filename, filename_len) < 0 ||
    80205c78:	02054063          	bltz	a0,80205c98 <sys_getdents64+0xa0>
        copyout2((uint64)&(dirp64->d_type),(char*)&f->type,sizeof(f->type) < 0 ))
    80205c7c:	4601                	li	a2,0
    80205c7e:	fd043583          	ld	a1,-48(s0)
    80205c82:	fc843503          	ld	a0,-56(s0)
    80205c86:	0549                	addi	a0,a0,18
    80205c88:	ffffb097          	auipc	ra,0xffffb
    80205c8c:	6f4080e7          	jalr	1780(ra) # 8020137c <copyout2>
    return -1;
    80205c90:	57fd                	li	a5,-1
  else if(copyout2((uint64)dirp64->d_name, f->ep->filename, filename_len) < 0 ||
    80205c92:	e119                	bnez	a0,80205c98 <sys_getdents64+0xa0>

  return filename_len+sizeof(f->type);
    80205c94:	00448793          	addi	a5,s1,4
}
    80205c98:	853e                	mv	a0,a5
    80205c9a:	70e2                	ld	ra,56(sp)
    80205c9c:	7442                	ld	s0,48(sp)
    80205c9e:	74a2                	ld	s1,40(sp)
    80205ca0:	6121                	addi	sp,sp,64
    80205ca2:	8082                	ret
    if(copyout2((uint64)dirp64->d_name, "/", 1) < 0 ||
    80205ca4:	4605                	li	a2,1
    80205ca6:	00005597          	auipc	a1,0x5
    80205caa:	98a58593          	addi	a1,a1,-1654 # 8020a630 <digits+0x2b0>
    80205cae:	fc843503          	ld	a0,-56(s0)
    80205cb2:	054d                	addi	a0,a0,19
    80205cb4:	ffffb097          	auipc	ra,0xffffb
    80205cb8:	6c8080e7          	jalr	1736(ra) # 8020137c <copyout2>
    return -1;
    80205cbc:	57fd                	li	a5,-1
    if(copyout2((uint64)dirp64->d_name, "/", 1) < 0 ||
    80205cbe:	fc054de3          	bltz	a0,80205c98 <sys_getdents64+0xa0>
      copyout2((uint64)&(dirp64->d_type),(char*)&f->type,sizeof(f->type) < 0 ))
    80205cc2:	4601                	li	a2,0
    80205cc4:	fd043583          	ld	a1,-48(s0)
    80205cc8:	fc843503          	ld	a0,-56(s0)
    80205ccc:	0549                	addi	a0,a0,18
    80205cce:	ffffb097          	auipc	ra,0xffffb
    80205cd2:	6ae080e7          	jalr	1710(ra) # 8020137c <copyout2>
    return -1;
    80205cd6:	57fd                	li	a5,-1
    if(copyout2((uint64)dirp64->d_name, "/", 1) < 0 ||
    80205cd8:	dd55                	beqz	a0,80205c94 <sys_getdents64+0x9c>
    80205cda:	bf7d                	j	80205c98 <sys_getdents64+0xa0>

0000000080205cdc <sys_fstat_cscc>:
        long st_ctime_nsec;
        unsigned __unused[2];
};
uint64
sys_fstat_cscc(void)
{
    80205cdc:	7135                	addi	sp,sp,-160
    80205cde:	ed06                	sd	ra,152(sp)
    80205ce0:	e922                	sd	s0,144(sp)
    80205ce2:	1100                	addi	s0,sp,160
  struct file* f;
  uint64 addr;
  if(argfd(0,0,&f)<0 || argaddr(1,&addr)<0)
    80205ce4:	fe840613          	addi	a2,s0,-24
    80205ce8:	4581                	li	a1,0
    80205cea:	4501                	li	a0,0
    80205cec:	fffff097          	auipc	ra,0xfffff
    80205cf0:	cf0080e7          	jalr	-784(ra) # 802049dc <argfd>
    80205cf4:	87aa                	mv	a5,a0
  {
    return -1;
    80205cf6:	557d                	li	a0,-1
  if(argfd(0,0,&f)<0 || argaddr(1,&addr)<0)
    80205cf8:	0207c263          	bltz	a5,80205d1c <sys_fstat_cscc+0x40>
    80205cfc:	fe040593          	addi	a1,s0,-32
    80205d00:	4505                	li	a0,1
    80205d02:	ffffd097          	auipc	ra,0xffffd
    80205d06:	36e080e7          	jalr	878(ra) # 80203070 <argaddr>
    80205d0a:	08054d63          	bltz	a0,80205da4 <sys_fstat_cscc+0xc8>
  }

  struct kstat st;
  if(f->type!=FD_ENTRY)
    80205d0e:	fe843783          	ld	a5,-24(s0)
    80205d12:	4394                	lw	a3,0(a5)
    80205d14:	4709                	li	a4,2
    return -1;
    80205d16:	557d                	li	a0,-1
  if(f->type!=FD_ENTRY)
    80205d18:	00e68663          	beq	a3,a4,80205d24 <sys_fstat_cscc+0x48>
  st.st_ctime_sec=0;
  eunlock(f->ep);
  if((copyout2(addr,(char*)&st,sizeof(struct kstat)))<0)
    return -1;
  return 0;
}
    80205d1c:	60ea                	ld	ra,152(sp)
    80205d1e:	644a                	ld	s0,144(sp)
    80205d20:	610d                	addi	sp,sp,160
    80205d22:	8082                	ret
  elock(f->ep);
    80205d24:	6f88                	ld	a0,24(a5)
    80205d26:	00001097          	auipc	ra,0x1
    80205d2a:	53c080e7          	jalr	1340(ra) # 80207262 <elock>
  st.st_dev=f->ep->dev;
    80205d2e:	fe843783          	ld	a5,-24(s0)
    80205d32:	6f98                	ld	a4,24(a5)
    80205d34:	11474703          	lbu	a4,276(a4)
    80205d38:	f6e43023          	sd	a4,-160(s0)
  st.st_ino=0;
    80205d3c:	f6043423          	sd	zero,-152(s0)
  st.st_mode=f->type;
    80205d40:	4398                	lw	a4,0(a5)
    80205d42:	f6e42823          	sw	a4,-144(s0)
  st.st_nlink=f->ref;
    80205d46:	43d8                	lw	a4,4(a5)
    80205d48:	f6e42a23          	sw	a4,-140(s0)
  st.st_gid=0;
    80205d4c:	f6042e23          	sw	zero,-132(s0)
  st.st_uid=0;
    80205d50:	f6042c23          	sw	zero,-136(s0)
  st.st_rdev=0;
    80205d54:	f8043023          	sd	zero,-128(s0)
  st.st_size=f->ep->file_size;
    80205d58:	6f98                	ld	a4,24(a5)
    80205d5a:	10876703          	lwu	a4,264(a4)
    80205d5e:	f8e43823          	sd	a4,-112(s0)
  st.st_blocks=0;
    80205d62:	fa043023          	sd	zero,-96(s0)
  st.st_blksize=0;
    80205d66:	f8042c23          	sw	zero,-104(s0)
  st.st_atime_sec=0;
    80205d6a:	fa043423          	sd	zero,-88(s0)
  st.st_atime_nsec=0;
    80205d6e:	fa043823          	sd	zero,-80(s0)
  st.st_mtime_nsec=0;
    80205d72:	fc043023          	sd	zero,-64(s0)
  st.st_mtime_sec=0;
    80205d76:	fa043c23          	sd	zero,-72(s0)
  st.st_ctime_nsec=0;
    80205d7a:	fc043823          	sd	zero,-48(s0)
  st.st_ctime_sec=0;
    80205d7e:	fc043423          	sd	zero,-56(s0)
  eunlock(f->ep);
    80205d82:	6f88                	ld	a0,24(a5)
    80205d84:	00001097          	auipc	ra,0x1
    80205d88:	514080e7          	jalr	1300(ra) # 80207298 <eunlock>
  if((copyout2(addr,(char*)&st,sizeof(struct kstat)))<0)
    80205d8c:	08000613          	li	a2,128
    80205d90:	f6040593          	addi	a1,s0,-160
    80205d94:	fe043503          	ld	a0,-32(s0)
    80205d98:	ffffb097          	auipc	ra,0xffffb
    80205d9c:	5e4080e7          	jalr	1508(ra) # 8020137c <copyout2>
    80205da0:	957d                	srai	a0,a0,0x3f
    80205da2:	bfad                	j	80205d1c <sys_fstat_cscc+0x40>
    return -1;
    80205da4:	557d                	li	a0,-1
    80205da6:	bf9d                	j	80205d1c <sys_fstat_cscc+0x40>

0000000080205da8 <sys_linkat>:

// lzq link
uint64
sys_linkat(void){
    80205da8:	1141                	addi	sp,sp,-16
    80205daa:	e422                	sd	s0,8(sp)
    80205dac:	0800                	addi	s0,sp,16
//    if(argstr(1, path, FAT32_MAX_PATH) < 0)
//        return -1;
//    if((ep = ename(path)) == NULL)
//        return -1;
    return 0;
}
    80205dae:	4501                	li	a0,0
    80205db0:	6422                	ld	s0,8(sp)
    80205db2:	0141                	addi	sp,sp,16
    80205db4:	8082                	ret

0000000080205db6 <sys_unlink>:
uint64
sys_unlink(void){
    80205db6:	dd010113          	addi	sp,sp,-560
    80205dba:	22113423          	sd	ra,552(sp)
    80205dbe:	22813023          	sd	s0,544(sp)
    80205dc2:	20913c23          	sd	s1,536(sp)
    80205dc6:	21213823          	sd	s2,528(sp)
    80205dca:	1c00                	addi	s0,sp,560
    char path[FAT32_MAX_PATH];// file
    char name[FAT32_MAX_FILENAME + 1];//dir name
    struct dirent *ep,*dp;
    if(argstr(1, path, FAT32_MAX_PATH) < 0)
    80205dcc:	10400613          	li	a2,260
    80205dd0:	ed840593          	addi	a1,s0,-296
    80205dd4:	4505                	li	a0,1
    80205dd6:	ffffd097          	auipc	ra,0xffffd
    80205dda:	2bc080e7          	jalr	700(ra) # 80203092 <argstr>
        return -1;
    80205dde:	57fd                	li	a5,-1
    if(argstr(1, path, FAT32_MAX_PATH) < 0)
    80205de0:	06054263          	bltz	a0,80205e44 <sys_unlink+0x8e>
    if((ep = ename(path)) == NULL)
    80205de4:	ed840513          	addi	a0,s0,-296
    80205de8:	00002097          	auipc	ra,0x2
    80205dec:	c24080e7          	jalr	-988(ra) # 80207a0c <ename>
    80205df0:	84aa                	mv	s1,a0
    80205df2:	c52d                	beqz	a0,80205e5c <sys_unlink+0xa6>
        return -1;
    if((dp = enameparent(path, name)) == NULL)
    80205df4:	dd840593          	addi	a1,s0,-552
    80205df8:	ed840513          	addi	a0,s0,-296
    80205dfc:	00002097          	auipc	ra,0x2
    80205e00:	c2e080e7          	jalr	-978(ra) # 80207a2a <enameparent>
    80205e04:	892a                	mv	s2,a0
    80205e06:	cd29                	beqz	a0,80205e60 <sys_unlink+0xaa>
        return -1;
    elock(dp);
    80205e08:	00001097          	auipc	ra,0x1
    80205e0c:	45a080e7          	jalr	1114(ra) # 80207262 <elock>
    elock(ep);
    80205e10:	8526                	mv	a0,s1
    80205e12:	00001097          	auipc	ra,0x1
    80205e16:	450080e7          	jalr	1104(ra) # 80207262 <elock>
    eremove(ep);
    80205e1a:	8526                	mv	a0,s1
    80205e1c:	00001097          	auipc	ra,0x1
    80205e20:	312080e7          	jalr	786(ra) # 8020712e <eremove>
    eunlock(ep);
    80205e24:	8526                	mv	a0,s1
    80205e26:	00001097          	auipc	ra,0x1
    80205e2a:	472080e7          	jalr	1138(ra) # 80207298 <eunlock>
    eunlock(dp);
    80205e2e:	854a                	mv	a0,s2
    80205e30:	00001097          	auipc	ra,0x1
    80205e34:	468080e7          	jalr	1128(ra) # 80207298 <eunlock>
    eput(dp);
    80205e38:	854a                	mv	a0,s2
    80205e3a:	00001097          	auipc	ra,0x1
    80205e3e:	4ac080e7          	jalr	1196(ra) # 802072e6 <eput>
    return 0;
    80205e42:	4781                	li	a5,0
}
    80205e44:	853e                	mv	a0,a5
    80205e46:	22813083          	ld	ra,552(sp)
    80205e4a:	22013403          	ld	s0,544(sp)
    80205e4e:	21813483          	ld	s1,536(sp)
    80205e52:	21013903          	ld	s2,528(sp)
    80205e56:	23010113          	addi	sp,sp,560
    80205e5a:	8082                	ret
        return -1;
    80205e5c:	57fd                	li	a5,-1
    80205e5e:	b7dd                	j	80205e44 <sys_unlink+0x8e>
        return -1;
    80205e60:	57fd                	li	a5,-1
    80205e62:	b7cd                	j	80205e44 <sys_unlink+0x8e>

0000000080205e64 <open_dev>:
//    int minor;
    struct file *f;
//    if(omode & O_CREATE){
//        panic("dev file on FAT");
//    }
    if(major < 0 || major >= NDEV)
    80205e64:	47a5                	li	a5,9
    80205e66:	06a7e163          	bltu	a5,a0,80205ec8 <open_dev+0x64>
{
    80205e6a:	7179                	addi	sp,sp,-48
    80205e6c:	f406                	sd	ra,40(sp)
    80205e6e:	f022                	sd	s0,32(sp)
    80205e70:	ec26                	sd	s1,24(sp)
    80205e72:	e84a                	sd	s2,16(sp)
    80205e74:	e44e                	sd	s3,8(sp)
    80205e76:	1800                	addi	s0,sp,48
    80205e78:	892e                	mv	s2,a1
    80205e7a:	89aa                	mv	s3,a0
        return -1;

    if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80205e7c:	ffffe097          	auipc	ra,0xffffe
    80205e80:	f9c080e7          	jalr	-100(ra) # 80203e18 <filealloc>
    80205e84:	84aa                	mv	s1,a0
    80205e86:	c139                	beqz	a0,80205ecc <open_dev+0x68>
    80205e88:	fffff097          	auipc	ra,0xfffff
    80205e8c:	bbe080e7          	jalr	-1090(ra) # 80204a46 <fdalloc>
    80205e90:	04054063          	bltz	a0,80205ed0 <open_dev+0x6c>
        if(f)
            fileclose(f);
        return -1;
    }

    f->type = FD_DEVICE;
    80205e94:	478d                	li	a5,3
    80205e96:	c09c                	sw	a5,0(s1)
    f->off = 0;
    80205e98:	0204a023          	sw	zero,32(s1)
    f->ep = 0;
    80205e9c:	0004bc23          	sd	zero,24(s1)
    f->major = major;
    80205ea0:	03349223          	sh	s3,36(s1)
    f->readable = !(omode & O_WRONLY);
    80205ea4:	00194793          	xori	a5,s2,1
    80205ea8:	8b85                	andi	a5,a5,1
    80205eaa:	00f48423          	sb	a5,8(s1)
    f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80205eae:	00397593          	andi	a1,s2,3
    80205eb2:	00b035b3          	snez	a1,a1
    80205eb6:	00b484a3          	sb	a1,9(s1)

    return fd;
}
    80205eba:	70a2                	ld	ra,40(sp)
    80205ebc:	7402                	ld	s0,32(sp)
    80205ebe:	64e2                	ld	s1,24(sp)
    80205ec0:	6942                	ld	s2,16(sp)
    80205ec2:	69a2                	ld	s3,8(sp)
    80205ec4:	6145                	addi	sp,sp,48
    80205ec6:	8082                	ret
        return -1;
    80205ec8:	557d                	li	a0,-1
}
    80205eca:	8082                	ret
        return -1;
    80205ecc:	557d                	li	a0,-1
    80205ece:	b7f5                	j	80205eba <open_dev+0x56>
            fileclose(f);
    80205ed0:	8526                	mv	a0,s1
    80205ed2:	ffffe097          	auipc	ra,0xffffe
    80205ed6:	002080e7          	jalr	2(ra) # 80203ed4 <fileclose>
        return -1;
    80205eda:	557d                	li	a0,-1
    80205edc:	bff9                	j	80205eba <open_dev+0x56>

0000000080205ede <sys_mount>:
// test mount 1 /dev/vda2 /mnt
uint64
sys_mount(void)
{
    80205ede:	dd010113          	addi	sp,sp,-560
    80205ee2:	22113423          	sd	ra,552(sp)
    80205ee6:	22813023          	sd	s0,544(sp)
    80205eea:	20913c23          	sd	s1,536(sp)
    80205eee:	1c00                	addi	s0,sp,560
    char special[FAT32_MAX_PATH];
    char dir[FAT32_MAX_PATH]; //挂载设备,挂载点,挂载的文件系统类型
    if (argstr(0, special, FAT32_MAX_PATH) < 0 || argstr(1, dir, FAT32_MAX_PATH) < 0)
    80205ef0:	10400613          	li	a2,260
    80205ef4:	ed840593          	addi	a1,s0,-296
    80205ef8:	4501                	li	a0,0
    80205efa:	ffffd097          	auipc	ra,0xffffd
    80205efe:	198080e7          	jalr	408(ra) # 80203092 <argstr>
        return -1;
    80205f02:	57fd                	li	a5,-1
    if (argstr(0, special, FAT32_MAX_PATH) < 0 || argstr(1, dir, FAT32_MAX_PATH) < 0)
    80205f04:	04054463          	bltz	a0,80205f4c <sys_mount+0x6e>
    80205f08:	10400613          	li	a2,260
    80205f0c:	dd040593          	addi	a1,s0,-560
    80205f10:	4505                	li	a0,1
    80205f12:	ffffd097          	auipc	ra,0xffffd
    80205f16:	180080e7          	jalr	384(ra) # 80203092 <argstr>
        return -1;
    80205f1a:	57fd                	li	a5,-1
    if (argstr(0, special, FAT32_MAX_PATH) < 0 || argstr(1, dir, FAT32_MAX_PATH) < 0)
    80205f1c:	02054863          	bltz	a0,80205f4c <sys_mount+0x6e>
    //fstype， flags挂载参数， data传递给文件系统的字符串参数，可为NULL；

    //    struct fat *newfat;
    struct dirent * dp;
    dp = create(dir, T_DIR, O_CREATE);
    80205f20:	24000613          	li	a2,576
    80205f24:	4585                	li	a1,1
    80205f26:	dd040513          	addi	a0,s0,-560
    80205f2a:	fffff097          	auipc	ra,0xfffff
    80205f2e:	b60080e7          	jalr	-1184(ra) # 80204a8a <create>
    80205f32:	84aa                	mv	s1,a0
    if (dp == NULL || dp->attribute != ATTR_DIRECTORY) {
    80205f34:	c511                	beqz	a0,80205f40 <sys_mount+0x62>
    80205f36:	10054703          	lbu	a4,256(a0)
    80205f3a:	47c1                	li	a5,16
    80205f3c:	02f70263          	beq	a4,a5,80205f60 <sys_mount+0x82>
        eput(dp); // 指定的挂载点不存在或者不是目录
    80205f40:	8526                	mv	a0,s1
    80205f42:	00001097          	auipc	ra,0x1
    80205f46:	3a4080e7          	jalr	932(ra) # 802072e6 <eput>
        return -1;
    80205f4a:	57fd                	li	a5,-1
        return -1;
    dp->dev = dev;
    dp->parent = dp;
    dp->valid = 1;
    return 0;
}
    80205f4c:	853e                	mv	a0,a5
    80205f4e:	22813083          	ld	ra,552(sp)
    80205f52:	22013403          	ld	s0,544(sp)
    80205f56:	21813483          	ld	s1,536(sp)
    80205f5a:	23010113          	addi	sp,sp,560
    80205f5e:	8082                	ret
    int dev = open_dev(1, O_RDWR); //用作设备号(fd)
    80205f60:	4589                	li	a1,2
    80205f62:	4505                	li	a0,1
    80205f64:	00000097          	auipc	ra,0x0
    80205f68:	f00080e7          	jalr	-256(ra) # 80205e64 <open_dev>
    if (dev < 0)
    80205f6c:	02051793          	slli	a5,a0,0x20
    80205f70:	0007cb63          	bltz	a5,80205f86 <sys_mount+0xa8>
    dp->dev = dev;
    80205f74:	10a48a23          	sb	a0,276(s1)
    dp->parent = dp;
    80205f78:	1294b023          	sd	s1,288(s1)
    dp->valid = 1;
    80205f7c:	4785                	li	a5,1
    80205f7e:	10f49b23          	sh	a5,278(s1)
    return 0;
    80205f82:	4781                	li	a5,0
    80205f84:	b7e1                	j	80205f4c <sys_mount+0x6e>
        return -1;
    80205f86:	57fd                	li	a5,-1
    80205f88:	b7d1                	j	80205f4c <sys_mount+0x6e>

0000000080205f8a <sys_umount2>:
uint64
sys_umount2(void)
{
    80205f8a:	1141                	addi	sp,sp,-16
    80205f8c:	e422                	sd	s0,8(sp)
    80205f8e:	0800                	addi	s0,sp,16
//    char special[FAT32_MAX_PATH];
//    if (argstr(0, special, FAT32_MAX_PATH) < 0)
//        return -1;

    return 0;
    80205f90:	4501                	li	a0,0
    80205f92:	6422                	ld	s0,8(sp)
    80205f94:	0141                	addi	sp,sp,16
    80205f96:	8082                	ret
	...

0000000080205fa0 <kernelvec>:
    80205fa0:	7111                	addi	sp,sp,-256
    80205fa2:	e006                	sd	ra,0(sp)
    80205fa4:	e40a                	sd	sp,8(sp)
    80205fa6:	e80e                	sd	gp,16(sp)
    80205fa8:	ec12                	sd	tp,24(sp)
    80205faa:	f016                	sd	t0,32(sp)
    80205fac:	f41a                	sd	t1,40(sp)
    80205fae:	f81e                	sd	t2,48(sp)
    80205fb0:	fc22                	sd	s0,56(sp)
    80205fb2:	e0a6                	sd	s1,64(sp)
    80205fb4:	e4aa                	sd	a0,72(sp)
    80205fb6:	e8ae                	sd	a1,80(sp)
    80205fb8:	ecb2                	sd	a2,88(sp)
    80205fba:	f0b6                	sd	a3,96(sp)
    80205fbc:	f4ba                	sd	a4,104(sp)
    80205fbe:	f8be                	sd	a5,112(sp)
    80205fc0:	fcc2                	sd	a6,120(sp)
    80205fc2:	e146                	sd	a7,128(sp)
    80205fc4:	e54a                	sd	s2,136(sp)
    80205fc6:	e94e                	sd	s3,144(sp)
    80205fc8:	ed52                	sd	s4,152(sp)
    80205fca:	f156                	sd	s5,160(sp)
    80205fcc:	f55a                	sd	s6,168(sp)
    80205fce:	f95e                	sd	s7,176(sp)
    80205fd0:	fd62                	sd	s8,184(sp)
    80205fd2:	e1e6                	sd	s9,192(sp)
    80205fd4:	e5ea                	sd	s10,200(sp)
    80205fd6:	e9ee                	sd	s11,208(sp)
    80205fd8:	edf2                	sd	t3,216(sp)
    80205fda:	f1f6                	sd	t4,224(sp)
    80205fdc:	f5fa                	sd	t5,232(sp)
    80205fde:	f9fe                	sd	t6,240(sp)
    80205fe0:	bb1fc0ef          	jal	ra,80202b90 <kerneltrap>
    80205fe4:	6082                	ld	ra,0(sp)
    80205fe6:	6122                	ld	sp,8(sp)
    80205fe8:	61c2                	ld	gp,16(sp)
    80205fea:	7282                	ld	t0,32(sp)
    80205fec:	7322                	ld	t1,40(sp)
    80205fee:	73c2                	ld	t2,48(sp)
    80205ff0:	7462                	ld	s0,56(sp)
    80205ff2:	6486                	ld	s1,64(sp)
    80205ff4:	6526                	ld	a0,72(sp)
    80205ff6:	65c6                	ld	a1,80(sp)
    80205ff8:	6666                	ld	a2,88(sp)
    80205ffa:	7686                	ld	a3,96(sp)
    80205ffc:	7726                	ld	a4,104(sp)
    80205ffe:	77c6                	ld	a5,112(sp)
    80206000:	7866                	ld	a6,120(sp)
    80206002:	688a                	ld	a7,128(sp)
    80206004:	692a                	ld	s2,136(sp)
    80206006:	69ca                	ld	s3,144(sp)
    80206008:	6a6a                	ld	s4,152(sp)
    8020600a:	7a8a                	ld	s5,160(sp)
    8020600c:	7b2a                	ld	s6,168(sp)
    8020600e:	7bca                	ld	s7,176(sp)
    80206010:	7c6a                	ld	s8,184(sp)
    80206012:	6c8e                	ld	s9,192(sp)
    80206014:	6d2e                	ld	s10,200(sp)
    80206016:	6dce                	ld	s11,208(sp)
    80206018:	6e6e                	ld	t3,216(sp)
    8020601a:	7e8e                	ld	t4,224(sp)
    8020601c:	7f2e                	ld	t5,232(sp)
    8020601e:	7fce                	ld	t6,240(sp)
    80206020:	6111                	addi	sp,sp,256
    80206022:	10200073          	sret
	...

000000008020602e <timerinit>:
#include "include/proc.h"

struct spinlock tickslock;
uint ticks;

void timerinit() {
    8020602e:	1141                	addi	sp,sp,-16
    80206030:	e406                	sd	ra,8(sp)
    80206032:	e022                	sd	s0,0(sp)
    80206034:	0800                	addi	s0,sp,16
    initlock(&tickslock, "time");
    80206036:	00005597          	auipc	a1,0x5
    8020603a:	ca258593          	addi	a1,a1,-862 # 8020acd8 <digits+0x958>
    8020603e:	00025517          	auipc	a0,0x25
    80206042:	72a50513          	addi	a0,a0,1834 # 8022b768 <tickslock>
    80206046:	ffffa097          	auipc	ra,0xffffa
    8020604a:	63e080e7          	jalr	1598(ra) # 80200684 <initlock>
    #ifdef DEBUG
    printf("timerinit\n");
    #endif
}
    8020604e:	60a2                	ld	ra,8(sp)
    80206050:	6402                	ld	s0,0(sp)
    80206052:	0141                	addi	sp,sp,16
    80206054:	8082                	ret

0000000080206056 <set_next_timeout>:

void
set_next_timeout() {
    80206056:	1141                	addi	sp,sp,-16
    80206058:	e422                	sd	s0,8(sp)
    8020605a:	0800                	addi	s0,sp,16
  asm volatile("rdtime %0" : "=r" (x) );
    8020605c:	c0102573          	rdtime	a0
    // if comment the `printf` line below
    // the timer will not work.

    // this bug seems to disappear automatically
    // printf("");
    sbi_set_timer(r_time() + INTERVAL);
    80206060:	000307b7          	lui	a5,0x30
    80206064:	9b878793          	addi	a5,a5,-1608 # 2f9b8 <_entry-0x801d0648>
    80206068:	953e                	add	a0,a0,a5
	SBI_CALL_1(SBI_SET_TIMER, stime_value);
    8020606a:	4581                	li	a1,0
    8020606c:	4601                	li	a2,0
    8020606e:	4681                	li	a3,0
    80206070:	4881                	li	a7,0
    80206072:	00000073          	ecall
}
    80206076:	6422                	ld	s0,8(sp)
    80206078:	0141                	addi	sp,sp,16
    8020607a:	8082                	ret

000000008020607c <timer_tick>:

void timer_tick() {
    8020607c:	1101                	addi	sp,sp,-32
    8020607e:	ec06                	sd	ra,24(sp)
    80206080:	e822                	sd	s0,16(sp)
    80206082:	e426                	sd	s1,8(sp)
    80206084:	1000                	addi	s0,sp,32
    acquire(&tickslock);
    80206086:	00025497          	auipc	s1,0x25
    8020608a:	6e248493          	addi	s1,s1,1762 # 8022b768 <tickslock>
    8020608e:	8526                	mv	a0,s1
    80206090:	ffffa097          	auipc	ra,0xffffa
    80206094:	638080e7          	jalr	1592(ra) # 802006c8 <acquire>
    ticks++;
    80206098:	4c9c                	lw	a5,24(s1)
    8020609a:	2785                	addiw	a5,a5,1
    8020609c:	cc9c                	sw	a5,24(s1)
    wakeup(&ticks);
    8020609e:	00025517          	auipc	a0,0x25
    802060a2:	6e250513          	addi	a0,a0,1762 # 8022b780 <ticks>
    802060a6:	ffffc097          	auipc	ra,0xffffc
    802060aa:	38e080e7          	jalr	910(ra) # 80202434 <wakeup>
    release(&tickslock);
    802060ae:	8526                	mv	a0,s1
    802060b0:	ffffa097          	auipc	ra,0xffffa
    802060b4:	66c080e7          	jalr	1644(ra) # 8020071c <release>
    set_next_timeout();
    802060b8:	00000097          	auipc	ra,0x0
    802060bc:	f9e080e7          	jalr	-98(ra) # 80206056 <set_next_timeout>
}
    802060c0:	60e2                	ld	ra,24(sp)
    802060c2:	6442                	ld	s0,16(sp)
    802060c4:	64a2                	ld	s1,8(sp)
    802060c6:	6105                	addi	sp,sp,32
    802060c8:	8082                	ret

00000000802060ca <disk_init>:
#else
#include "include/virtio.h"
#endif 

void disk_init(void)
{
    802060ca:	1141                	addi	sp,sp,-16
    802060cc:	e406                	sd	ra,8(sp)
    802060ce:	e022                	sd	s0,0(sp)
    802060d0:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_init();
    802060d2:	00002097          	auipc	ra,0x2
    802060d6:	e82080e7          	jalr	-382(ra) # 80207f54 <virtio_disk_init>
	#else 
	sdcard_init();
    #endif
}
    802060da:	60a2                	ld	ra,8(sp)
    802060dc:	6402                	ld	s0,0(sp)
    802060de:	0141                	addi	sp,sp,16
    802060e0:	8082                	ret

00000000802060e2 <disk_read>:

void disk_read(struct buf *b)
{
    802060e2:	1141                	addi	sp,sp,-16
    802060e4:	e406                	sd	ra,8(sp)
    802060e6:	e022                	sd	s0,0(sp)
    802060e8:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 0);
    802060ea:	4581                	li	a1,0
    802060ec:	00002097          	auipc	ra,0x2
    802060f0:	ff0080e7          	jalr	-16(ra) # 802080dc <virtio_disk_rw>
    #else 
	sdcard_read_sector(b->data, b->sectorno);
	#endif
}
    802060f4:	60a2                	ld	ra,8(sp)
    802060f6:	6402                	ld	s0,0(sp)
    802060f8:	0141                	addi	sp,sp,16
    802060fa:	8082                	ret

00000000802060fc <disk_write>:

void disk_write(struct buf *b)
{
    802060fc:	1141                	addi	sp,sp,-16
    802060fe:	e406                	sd	ra,8(sp)
    80206100:	e022                	sd	s0,0(sp)
    80206102:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 1);
    80206104:	4585                	li	a1,1
    80206106:	00002097          	auipc	ra,0x2
    8020610a:	fd6080e7          	jalr	-42(ra) # 802080dc <virtio_disk_rw>
    #else 
	sdcard_write_sector(b->data, b->sectorno);
	#endif
}
    8020610e:	60a2                	ld	ra,8(sp)
    80206110:	6402                	ld	s0,0(sp)
    80206112:	0141                	addi	sp,sp,16
    80206114:	8082                	ret

0000000080206116 <disk_intr>:

void disk_intr(void)
{
    80206116:	1141                	addi	sp,sp,-16
    80206118:	e406                	sd	ra,8(sp)
    8020611a:	e022                	sd	s0,0(sp)
    8020611c:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_intr();
    8020611e:	00002097          	auipc	ra,0x2
    80206122:	26c080e7          	jalr	620(ra) # 8020838a <virtio_disk_intr>
    #else 
    dmac_intr(DMAC_CHANNEL0);
    #endif
}
    80206126:	60a2                	ld	ra,8(sp)
    80206128:	6402                	ld	s0,0(sp)
    8020612a:	0141                	addi	sp,sp,16
    8020612c:	8082                	ret

000000008020612e <read_fat>:
/**
 * Read the FAT table content corresponded to the given cluster number.
 * @param   cluster     the number of cluster which you want to read its content in FAT table
 */
static uint32 read_fat(uint32 cluster)
{
    8020612e:	1101                	addi	sp,sp,-32
    80206130:	ec06                	sd	ra,24(sp)
    80206132:	e822                	sd	s0,16(sp)
    80206134:	e426                	sd	s1,8(sp)
    80206136:	e04a                	sd	s2,0(sp)
    80206138:	1000                	addi	s0,sp,32
    if (cluster >= FAT32_EOC) {
    8020613a:	100007b7          	lui	a5,0x10000
    8020613e:	17dd                	addi	a5,a5,-9
        return cluster;
    80206140:	84aa                	mv	s1,a0
    if (cluster >= FAT32_EOC) {
    80206142:	00a7ea63          	bltu	a5,a0,80206156 <read_fat+0x28>
    }
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80206146:	00025797          	auipc	a5,0x25
    8020614a:	64a7a783          	lw	a5,1610(a5) # 8022b790 <fat+0x8>
    8020614e:	2785                	addiw	a5,a5,1
        return 0;
    80206150:	4481                	li	s1,0
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80206152:	00a7f963          	bgeu	a5,a0,80206164 <read_fat+0x36>
    // here should be a cache layer for FAT table, but not implemented yet.
    struct buf *b = bread(0, fat_sec);
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    brelse(b);
    return next_clus;
}
    80206156:	8526                	mv	a0,s1
    80206158:	60e2                	ld	ra,24(sp)
    8020615a:	6442                	ld	s0,16(sp)
    8020615c:	64a2                	ld	s1,8(sp)
    8020615e:	6902                	ld	s2,0(sp)
    80206160:	6105                	addi	sp,sp,32
    80206162:	8082                	ret
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80206164:	0025149b          	slliw	s1,a0,0x2
    80206168:	00025917          	auipc	s2,0x25
    8020616c:	62090913          	addi	s2,s2,1568 # 8022b788 <fat>
    80206170:	01095783          	lhu	a5,16(s2)
    80206174:	02f4d7bb          	divuw	a5,s1,a5
    80206178:	01495583          	lhu	a1,20(s2)
    struct buf *b = bread(0, fat_sec);
    8020617c:	9dbd                	addw	a1,a1,a5
    8020617e:	4501                	li	a0,0
    80206180:	ffffe097          	auipc	ra,0xffffe
    80206184:	8d4080e7          	jalr	-1836(ra) # 80203a54 <bread>
    return (cluster << 2) % fat.bpb.byts_per_sec;
    80206188:	01095783          	lhu	a5,16(s2)
    8020618c:	02f4f4bb          	remuw	s1,s1,a5
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    80206190:	1482                	slli	s1,s1,0x20
    80206192:	9081                	srli	s1,s1,0x20
    80206194:	94aa                	add	s1,s1,a0
    80206196:	4ca4                	lw	s1,88(s1)
    brelse(b);
    80206198:	ffffe097          	auipc	ra,0xffffe
    8020619c:	9e8080e7          	jalr	-1560(ra) # 80203b80 <brelse>
    return next_clus;
    802061a0:	bf5d                	j	80206156 <read_fat+0x28>

00000000802061a2 <alloc_clus>:
        brelse(b);
    }
}

static uint32 alloc_clus(uint8 dev)
{
    802061a2:	711d                	addi	sp,sp,-96
    802061a4:	ec86                	sd	ra,88(sp)
    802061a6:	e8a2                	sd	s0,80(sp)
    802061a8:	e4a6                	sd	s1,72(sp)
    802061aa:	e0ca                	sd	s2,64(sp)
    802061ac:	fc4e                	sd	s3,56(sp)
    802061ae:	f852                	sd	s4,48(sp)
    802061b0:	f456                	sd	s5,40(sp)
    802061b2:	f05a                	sd	s6,32(sp)
    802061b4:	ec5e                	sd	s7,24(sp)
    802061b6:	e862                	sd	s8,16(sp)
    802061b8:	e466                	sd	s9,8(sp)
    802061ba:	1080                	addi	s0,sp,96
    // should we keep a free cluster list? instead of searching fat every time.
    struct buf *b;
    uint32 sec = fat.bpb.rsvd_sec_cnt;
    802061bc:	00025797          	auipc	a5,0x25
    802061c0:	5cc78793          	addi	a5,a5,1484 # 8022b788 <fat>
    802061c4:	0147db83          	lhu	s7,20(a5)
    uint32 const ent_per_sec = fat.bpb.byts_per_sec / sizeof(uint32);
    802061c8:	0107d903          	lhu	s2,16(a5)
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    802061cc:	539c                	lw	a5,32(a5)
    802061ce:	10078263          	beqz	a5,802062d2 <alloc_clus+0x130>
    802061d2:	0029591b          	srliw	s2,s2,0x2
    802061d6:	0009099b          	sext.w	s3,s2
    802061da:	4b01                	li	s6,0
        b = bread(dev, sec);
    802061dc:	00050a9b          	sext.w	s5,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    802061e0:	4c01                	li	s8,0
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    802061e2:	00025c97          	auipc	s9,0x25
    802061e6:	5a6c8c93          	addi	s9,s9,1446 # 8022b788 <fat>
    802061ea:	a0c1                	j	802062aa <alloc_clus+0x108>
            if (((uint32 *)(b->data))[j] == 0) {
                ((uint32 *)(b->data))[j] = FAT32_EOC + 7;
    802061ec:	100007b7          	lui	a5,0x10000
    802061f0:	37fd                	addiw	a5,a5,-1
    802061f2:	c29c                	sw	a5,0(a3)
                bwrite(b);
    802061f4:	8552                	mv	a0,s4
    802061f6:	ffffe097          	auipc	ra,0xffffe
    802061fa:	94e080e7          	jalr	-1714(ra) # 80203b44 <bwrite>
                brelse(b);
    802061fe:	8552                	mv	a0,s4
    80206200:	ffffe097          	auipc	ra,0xffffe
    80206204:	980080e7          	jalr	-1664(ra) # 80203b80 <brelse>
                uint32 clus = i * ent_per_sec + j;
    80206208:	0369093b          	mulw	s2,s2,s6
    8020620c:	009904bb          	addw	s1,s2,s1
    80206210:	00048a9b          	sext.w	s5,s1
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80206214:	00025717          	auipc	a4,0x25
    80206218:	57470713          	addi	a4,a4,1396 # 8022b788 <fat>
    8020621c:	01274783          	lbu	a5,18(a4)
    80206220:	34f9                	addiw	s1,s1,-2
    80206222:	02f489bb          	mulw	s3,s1,a5
    80206226:	4318                	lw	a4,0(a4)
    80206228:	00e989bb          	addw	s3,s3,a4
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    8020622c:	c7b1                	beqz	a5,80206278 <alloc_clus+0xd6>
    8020622e:	4901                	li	s2,0
    80206230:	00025a17          	auipc	s4,0x25
    80206234:	558a0a13          	addi	s4,s4,1368 # 8022b788 <fat>
        b = bread(0, sec++);
    80206238:	013905bb          	addw	a1,s2,s3
    8020623c:	4501                	li	a0,0
    8020623e:	ffffe097          	auipc	ra,0xffffe
    80206242:	816080e7          	jalr	-2026(ra) # 80203a54 <bread>
    80206246:	84aa                	mv	s1,a0
        memset(b->data, 0, BSIZE);
    80206248:	20000613          	li	a2,512
    8020624c:	4581                	li	a1,0
    8020624e:	05850513          	addi	a0,a0,88
    80206252:	ffffa097          	auipc	ra,0xffffa
    80206256:	512080e7          	jalr	1298(ra) # 80200764 <memset>
        bwrite(b);
    8020625a:	8526                	mv	a0,s1
    8020625c:	ffffe097          	auipc	ra,0xffffe
    80206260:	8e8080e7          	jalr	-1816(ra) # 80203b44 <bwrite>
        brelse(b);
    80206264:	8526                	mv	a0,s1
    80206266:	ffffe097          	auipc	ra,0xffffe
    8020626a:	91a080e7          	jalr	-1766(ra) # 80203b80 <brelse>
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    8020626e:	2905                	addiw	s2,s2,1
    80206270:	012a4783          	lbu	a5,18(s4)
    80206274:	fcf942e3          	blt	s2,a5,80206238 <alloc_clus+0x96>
            }
        }
        brelse(b);
    }
    panic("no clusters");
}
    80206278:	8556                	mv	a0,s5
    8020627a:	60e6                	ld	ra,88(sp)
    8020627c:	6446                	ld	s0,80(sp)
    8020627e:	64a6                	ld	s1,72(sp)
    80206280:	6906                	ld	s2,64(sp)
    80206282:	79e2                	ld	s3,56(sp)
    80206284:	7a42                	ld	s4,48(sp)
    80206286:	7aa2                	ld	s5,40(sp)
    80206288:	7b02                	ld	s6,32(sp)
    8020628a:	6be2                	ld	s7,24(sp)
    8020628c:	6c42                	ld	s8,16(sp)
    8020628e:	6ca2                	ld	s9,8(sp)
    80206290:	6125                	addi	sp,sp,96
    80206292:	8082                	ret
        brelse(b);
    80206294:	8552                	mv	a0,s4
    80206296:	ffffe097          	auipc	ra,0xffffe
    8020629a:	8ea080e7          	jalr	-1814(ra) # 80203b80 <brelse>
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    8020629e:	2b05                	addiw	s6,s6,1
    802062a0:	2b85                	addiw	s7,s7,1
    802062a2:	020ca783          	lw	a5,32(s9)
    802062a6:	02fb7663          	bgeu	s6,a5,802062d2 <alloc_clus+0x130>
        b = bread(dev, sec);
    802062aa:	85de                	mv	a1,s7
    802062ac:	8556                	mv	a0,s5
    802062ae:	ffffd097          	auipc	ra,0xffffd
    802062b2:	7a6080e7          	jalr	1958(ra) # 80203a54 <bread>
    802062b6:	8a2a                	mv	s4,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    802062b8:	fc098ee3          	beqz	s3,80206294 <alloc_clus+0xf2>
    802062bc:	05850793          	addi	a5,a0,88
    802062c0:	84e2                	mv	s1,s8
            if (((uint32 *)(b->data))[j] == 0) {
    802062c2:	86be                	mv	a3,a5
    802062c4:	4398                	lw	a4,0(a5)
    802062c6:	d31d                	beqz	a4,802061ec <alloc_clus+0x4a>
        for (uint32 j = 0; j < ent_per_sec; j++) {
    802062c8:	2485                	addiw	s1,s1,1
    802062ca:	0791                	addi	a5,a5,4
    802062cc:	fe999be3          	bne	s3,s1,802062c2 <alloc_clus+0x120>
    802062d0:	b7d1                	j	80206294 <alloc_clus+0xf2>
    panic("no clusters");
    802062d2:	00005517          	auipc	a0,0x5
    802062d6:	a0e50513          	addi	a0,a0,-1522 # 8020ace0 <digits+0x960>
    802062da:	ffffa097          	auipc	ra,0xffffa
    802062de:	e68080e7          	jalr	-408(ra) # 80200142 <panic>

00000000802062e2 <write_fat>:
    if (cluster > fat.data_clus_cnt + 1) {
    802062e2:	00025797          	auipc	a5,0x25
    802062e6:	4ae7a783          	lw	a5,1198(a5) # 8022b790 <fat+0x8>
    802062ea:	2785                	addiw	a5,a5,1
    802062ec:	06a7e963          	bltu	a5,a0,8020635e <write_fat+0x7c>
{
    802062f0:	7179                	addi	sp,sp,-48
    802062f2:	f406                	sd	ra,40(sp)
    802062f4:	f022                	sd	s0,32(sp)
    802062f6:	ec26                	sd	s1,24(sp)
    802062f8:	e84a                	sd	s2,16(sp)
    802062fa:	e44e                	sd	s3,8(sp)
    802062fc:	e052                	sd	s4,0(sp)
    802062fe:	1800                	addi	s0,sp,48
    80206300:	89ae                	mv	s3,a1
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80206302:	0025149b          	slliw	s1,a0,0x2
    80206306:	00025a17          	auipc	s4,0x25
    8020630a:	482a0a13          	addi	s4,s4,1154 # 8022b788 <fat>
    8020630e:	010a5783          	lhu	a5,16(s4)
    80206312:	02f4d7bb          	divuw	a5,s1,a5
    80206316:	014a5583          	lhu	a1,20(s4)
    struct buf *b = bread(0, fat_sec);
    8020631a:	9dbd                	addw	a1,a1,a5
    8020631c:	4501                	li	a0,0
    8020631e:	ffffd097          	auipc	ra,0xffffd
    80206322:	736080e7          	jalr	1846(ra) # 80203a54 <bread>
    80206326:	892a                	mv	s2,a0
    return (cluster << 2) % fat.bpb.byts_per_sec;
    80206328:	010a5783          	lhu	a5,16(s4)
    8020632c:	02f4f4bb          	remuw	s1,s1,a5
    *(uint32 *)(b->data + off) = content;
    80206330:	1482                	slli	s1,s1,0x20
    80206332:	9081                	srli	s1,s1,0x20
    80206334:	94aa                	add	s1,s1,a0
    80206336:	0534ac23          	sw	s3,88(s1)
    bwrite(b);
    8020633a:	ffffe097          	auipc	ra,0xffffe
    8020633e:	80a080e7          	jalr	-2038(ra) # 80203b44 <bwrite>
    brelse(b);
    80206342:	854a                	mv	a0,s2
    80206344:	ffffe097          	auipc	ra,0xffffe
    80206348:	83c080e7          	jalr	-1988(ra) # 80203b80 <brelse>
    return 0;
    8020634c:	4501                	li	a0,0
}
    8020634e:	70a2                	ld	ra,40(sp)
    80206350:	7402                	ld	s0,32(sp)
    80206352:	64e2                	ld	s1,24(sp)
    80206354:	6942                	ld	s2,16(sp)
    80206356:	69a2                	ld	s3,8(sp)
    80206358:	6a02                	ld	s4,0(sp)
    8020635a:	6145                	addi	sp,sp,48
    8020635c:	8082                	ret
        return -1;
    8020635e:	557d                	li	a0,-1
}
    80206360:	8082                	ret

0000000080206362 <reloc_clus>:
 * @param   off         the offset from the beginning of the relative file
 * @param   alloc       whether alloc new cluster when meeting end of FAT chains
 * @return              the offset from the new cur_clus
 */
static int reloc_clus(struct dirent *entry, uint off, int alloc)
{
    80206362:	715d                	addi	sp,sp,-80
    80206364:	e486                	sd	ra,72(sp)
    80206366:	e0a2                	sd	s0,64(sp)
    80206368:	fc26                	sd	s1,56(sp)
    8020636a:	f84a                	sd	s2,48(sp)
    8020636c:	f44e                	sd	s3,40(sp)
    8020636e:	f052                	sd	s4,32(sp)
    80206370:	ec56                	sd	s5,24(sp)
    80206372:	e85a                	sd	s6,16(sp)
    80206374:	e45e                	sd	s7,8(sp)
    80206376:	0880                	addi	s0,sp,80
    80206378:	84aa                	mv	s1,a0
    8020637a:	8a2e                	mv	s4,a1
    int clus_num = off / fat.byts_per_clus;
    8020637c:	00025b97          	auipc	s7,0x25
    80206380:	418bab83          	lw	s7,1048(s7) # 8022b794 <fat+0xc>
    80206384:	0375d9bb          	divuw	s3,a1,s7
    while (clus_num > entry->clus_cnt) {
    80206388:	11052703          	lw	a4,272(a0)
    8020638c:	07377663          	bgeu	a4,s3,802063f8 <reloc_clus+0x96>
    80206390:	8b32                	mv	s6,a2
        int clus = read_fat(entry->cur_clus);
        if (clus >= FAT32_EOC) {
    80206392:	10000ab7          	lui	s5,0x10000
    80206396:	1add                	addi	s5,s5,-9
    80206398:	a025                	j	802063c0 <reloc_clus+0x5e>
            if (alloc) {
                clus = alloc_clus(entry->dev);
                write_fat(entry->cur_clus, clus);
            } else {
                entry->cur_clus = entry->first_clus;
    8020639a:	1044a783          	lw	a5,260(s1)
    8020639e:	10f4a623          	sw	a5,268(s1)
                entry->clus_cnt = 0;
    802063a2:	1004a823          	sw	zero,272(s1)
                return -1;
    802063a6:	557d                	li	a0,-1
    802063a8:	a879                	j	80206446 <reloc_clus+0xe4>
            }
        }
        entry->cur_clus = clus;
    802063aa:	1124a623          	sw	s2,268(s1)
        entry->clus_cnt++;
    802063ae:	1104a783          	lw	a5,272(s1)
    802063b2:	2785                	addiw	a5,a5,1
    802063b4:	0007871b          	sext.w	a4,a5
    802063b8:	10f4a823          	sw	a5,272(s1)
    while (clus_num > entry->clus_cnt) {
    802063bc:	03377e63          	bgeu	a4,s3,802063f8 <reloc_clus+0x96>
        int clus = read_fat(entry->cur_clus);
    802063c0:	10c4a503          	lw	a0,268(s1)
    802063c4:	00000097          	auipc	ra,0x0
    802063c8:	d6a080e7          	jalr	-662(ra) # 8020612e <read_fat>
    802063cc:	0005091b          	sext.w	s2,a0
        if (clus >= FAT32_EOC) {
    802063d0:	fd2adde3          	bge	s5,s2,802063aa <reloc_clus+0x48>
            if (alloc) {
    802063d4:	fc0b03e3          	beqz	s6,8020639a <reloc_clus+0x38>
                clus = alloc_clus(entry->dev);
    802063d8:	1144c503          	lbu	a0,276(s1)
    802063dc:	00000097          	auipc	ra,0x0
    802063e0:	dc6080e7          	jalr	-570(ra) # 802061a2 <alloc_clus>
    802063e4:	0005091b          	sext.w	s2,a0
                write_fat(entry->cur_clus, clus);
    802063e8:	85ca                	mv	a1,s2
    802063ea:	10c4a503          	lw	a0,268(s1)
    802063ee:	00000097          	auipc	ra,0x0
    802063f2:	ef4080e7          	jalr	-268(ra) # 802062e2 <write_fat>
    802063f6:	bf55                	j	802063aa <reloc_clus+0x48>
    }
    if (clus_num < entry->clus_cnt) {
    802063f8:	04e9f163          	bgeu	s3,a4,8020643a <reloc_clus+0xd8>
        entry->cur_clus = entry->first_clus;
    802063fc:	1044a783          	lw	a5,260(s1)
    80206400:	10f4a623          	sw	a5,268(s1)
        entry->clus_cnt = 0;
    80206404:	1004a823          	sw	zero,272(s1)
        while (entry->clus_cnt < clus_num) {
    80206408:	037a6963          	bltu	s4,s7,8020643a <reloc_clus+0xd8>
            entry->cur_clus = read_fat(entry->cur_clus);
            if (entry->cur_clus >= FAT32_EOC) {
    8020640c:	10000937          	lui	s2,0x10000
    80206410:	195d                	addi	s2,s2,-9
            entry->cur_clus = read_fat(entry->cur_clus);
    80206412:	10c4a503          	lw	a0,268(s1)
    80206416:	00000097          	auipc	ra,0x0
    8020641a:	d18080e7          	jalr	-744(ra) # 8020612e <read_fat>
    8020641e:	2501                	sext.w	a0,a0
    80206420:	10a4a623          	sw	a0,268(s1)
            if (entry->cur_clus >= FAT32_EOC) {
    80206424:	02a96c63          	bltu	s2,a0,8020645c <reloc_clus+0xfa>
                panic("reloc_clus");
            }
            entry->clus_cnt++;
    80206428:	1104a783          	lw	a5,272(s1)
    8020642c:	2785                	addiw	a5,a5,1
    8020642e:	0007871b          	sext.w	a4,a5
    80206432:	10f4a823          	sw	a5,272(s1)
        while (entry->clus_cnt < clus_num) {
    80206436:	fd376ee3          	bltu	a4,s3,80206412 <reloc_clus+0xb0>
        }
    }
    return off % fat.byts_per_clus;
    8020643a:	00025517          	auipc	a0,0x25
    8020643e:	35a52503          	lw	a0,858(a0) # 8022b794 <fat+0xc>
    80206442:	02aa753b          	remuw	a0,s4,a0
}
    80206446:	60a6                	ld	ra,72(sp)
    80206448:	6406                	ld	s0,64(sp)
    8020644a:	74e2                	ld	s1,56(sp)
    8020644c:	7942                	ld	s2,48(sp)
    8020644e:	79a2                	ld	s3,40(sp)
    80206450:	7a02                	ld	s4,32(sp)
    80206452:	6ae2                	ld	s5,24(sp)
    80206454:	6b42                	ld	s6,16(sp)
    80206456:	6ba2                	ld	s7,8(sp)
    80206458:	6161                	addi	sp,sp,80
    8020645a:	8082                	ret
                panic("reloc_clus");
    8020645c:	00005517          	auipc	a0,0x5
    80206460:	89450513          	addi	a0,a0,-1900 # 8020acf0 <digits+0x970>
    80206464:	ffffa097          	auipc	ra,0xffffa
    80206468:	cde080e7          	jalr	-802(ra) # 80200142 <panic>

000000008020646c <rw_clus>:
{
    8020646c:	7119                	addi	sp,sp,-128
    8020646e:	fc86                	sd	ra,120(sp)
    80206470:	f8a2                	sd	s0,112(sp)
    80206472:	f4a6                	sd	s1,104(sp)
    80206474:	f0ca                	sd	s2,96(sp)
    80206476:	ecce                	sd	s3,88(sp)
    80206478:	e8d2                	sd	s4,80(sp)
    8020647a:	e4d6                	sd	s5,72(sp)
    8020647c:	e0da                	sd	s6,64(sp)
    8020647e:	fc5e                	sd	s7,56(sp)
    80206480:	f862                	sd	s8,48(sp)
    80206482:	f466                	sd	s9,40(sp)
    80206484:	f06a                	sd	s10,32(sp)
    80206486:	ec6e                	sd	s11,24(sp)
    80206488:	0100                	addi	s0,sp,128
    8020648a:	f8c43423          	sd	a2,-120(s0)
    8020648e:	8b36                	mv	s6,a3
    80206490:	8c3e                	mv	s8,a5
    if (off + n > fat.byts_per_clus)
    80206492:	00f706bb          	addw	a3,a4,a5
    80206496:	00025797          	auipc	a5,0x25
    8020649a:	2fe7a783          	lw	a5,766(a5) # 8022b794 <fat+0xc>
    8020649e:	02d7ef63          	bltu	a5,a3,802064dc <rw_clus+0x70>
    802064a2:	8cae                	mv	s9,a1
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    802064a4:	00025797          	auipc	a5,0x25
    802064a8:	2e478793          	addi	a5,a5,740 # 8022b788 <fat>
    802064ac:	0107da83          	lhu	s5,16(a5)
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    802064b0:	ffe5099b          	addiw	s3,a0,-2
    802064b4:	0127c503          	lbu	a0,18(a5)
    802064b8:	02a989bb          	mulw	s3,s3,a0
    802064bc:	4388                	lw	a0,0(a5)
    802064be:	00a989bb          	addw	s3,s3,a0
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    802064c2:	035757bb          	divuw	a5,a4,s5
    802064c6:	00f989bb          	addw	s3,s3,a5
    off = off % fat.bpb.byts_per_sec;
    802064ca:	03577abb          	remuw	s5,a4,s5
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    802064ce:	0e0c0363          	beqz	s8,802065b4 <rw_clus+0x148>
    802064d2:	4a01                	li	s4,0
        m = BSIZE - off % BSIZE;
    802064d4:	20000d93          	li	s11,512
        if (bad == -1) {
    802064d8:	5d7d                	li	s10,-1
    802064da:	a095                	j	8020653e <rw_clus+0xd2>
        panic("offset out of range");
    802064dc:	00005517          	auipc	a0,0x5
    802064e0:	82450513          	addi	a0,a0,-2012 # 8020ad00 <digits+0x980>
    802064e4:	ffffa097          	auipc	ra,0xffffa
    802064e8:	c5e080e7          	jalr	-930(ra) # 80200142 <panic>
                bwrite(bp);
    802064ec:	854a                	mv	a0,s2
    802064ee:	ffffd097          	auipc	ra,0xffffd
    802064f2:	656080e7          	jalr	1622(ra) # 80203b44 <bwrite>
        brelse(bp);
    802064f6:	854a                	mv	a0,s2
    802064f8:	ffffd097          	auipc	ra,0xffffd
    802064fc:	688080e7          	jalr	1672(ra) # 80203b80 <brelse>
        if (bad == -1) {
    80206500:	a02d                	j	8020652a <rw_clus+0xbe>
            bad = either_copyout(user, data, bp->data + (off % BSIZE), m);
    80206502:	05890613          	addi	a2,s2,88 # 10000058 <_entry-0x701fffa8>
    80206506:	1682                	slli	a3,a3,0x20
    80206508:	9281                	srli	a3,a3,0x20
    8020650a:	963a                	add	a2,a2,a4
    8020650c:	85da                	mv	a1,s6
    8020650e:	f8843503          	ld	a0,-120(s0)
    80206512:	ffffc097          	auipc	ra,0xffffc
    80206516:	ffe080e7          	jalr	-2(ra) # 80202510 <either_copyout>
    8020651a:	8baa                	mv	s7,a0
        brelse(bp);
    8020651c:	854a                	mv	a0,s2
    8020651e:	ffffd097          	auipc	ra,0xffffd
    80206522:	662080e7          	jalr	1634(ra) # 80203b80 <brelse>
        if (bad == -1) {
    80206526:	07ab8763          	beq	s7,s10,80206594 <rw_clus+0x128>
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    8020652a:	01448a3b          	addw	s4,s1,s4
    8020652e:	01548abb          	addw	s5,s1,s5
    80206532:	1482                	slli	s1,s1,0x20
    80206534:	9081                	srli	s1,s1,0x20
    80206536:	9b26                	add	s6,s6,s1
    80206538:	2985                	addiw	s3,s3,1
    8020653a:	058a7d63          	bgeu	s4,s8,80206594 <rw_clus+0x128>
        bp = bread(0, sec);
    8020653e:	85ce                	mv	a1,s3
    80206540:	4501                	li	a0,0
    80206542:	ffffd097          	auipc	ra,0xffffd
    80206546:	512080e7          	jalr	1298(ra) # 80203a54 <bread>
    8020654a:	892a                	mv	s2,a0
        m = BSIZE - off % BSIZE;
    8020654c:	1ffaf713          	andi	a4,s5,511
    80206550:	40ed863b          	subw	a2,s11,a4
        if (n - tot < m) {
    80206554:	414c07bb          	subw	a5,s8,s4
    80206558:	86be                	mv	a3,a5
    8020655a:	2781                	sext.w	a5,a5
    8020655c:	0006059b          	sext.w	a1,a2
    80206560:	00f5f363          	bgeu	a1,a5,80206566 <rw_clus+0xfa>
    80206564:	86b2                	mv	a3,a2
    80206566:	0006849b          	sext.w	s1,a3
        if (write) {
    8020656a:	f80c8ce3          	beqz	s9,80206502 <rw_clus+0x96>
            if ((bad = either_copyin(bp->data + (off % BSIZE), user, data, m)) != -1) {
    8020656e:	05890513          	addi	a0,s2,88
    80206572:	1682                	slli	a3,a3,0x20
    80206574:	9281                	srli	a3,a3,0x20
    80206576:	865a                	mv	a2,s6
    80206578:	f8843583          	ld	a1,-120(s0)
    8020657c:	953a                	add	a0,a0,a4
    8020657e:	ffffc097          	auipc	ra,0xffffc
    80206582:	fc8080e7          	jalr	-56(ra) # 80202546 <either_copyin>
    80206586:	f7a513e3          	bne	a0,s10,802064ec <rw_clus+0x80>
        brelse(bp);
    8020658a:	854a                	mv	a0,s2
    8020658c:	ffffd097          	auipc	ra,0xffffd
    80206590:	5f4080e7          	jalr	1524(ra) # 80203b80 <brelse>
}
    80206594:	8552                	mv	a0,s4
    80206596:	70e6                	ld	ra,120(sp)
    80206598:	7446                	ld	s0,112(sp)
    8020659a:	74a6                	ld	s1,104(sp)
    8020659c:	7906                	ld	s2,96(sp)
    8020659e:	69e6                	ld	s3,88(sp)
    802065a0:	6a46                	ld	s4,80(sp)
    802065a2:	6aa6                	ld	s5,72(sp)
    802065a4:	6b06                	ld	s6,64(sp)
    802065a6:	7be2                	ld	s7,56(sp)
    802065a8:	7c42                	ld	s8,48(sp)
    802065aa:	7ca2                	ld	s9,40(sp)
    802065ac:	7d02                	ld	s10,32(sp)
    802065ae:	6de2                	ld	s11,24(sp)
    802065b0:	6109                	addi	sp,sp,128
    802065b2:	8082                	ret
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    802065b4:	8a62                	mv	s4,s8
    802065b6:	bff9                	j	80206594 <rw_clus+0x128>

00000000802065b8 <eget>:
// by their whole path. But when parsing a path, we open all the directories through it, 
// which forms a linked list from the final file to the root. Thus, we use the "parent" pointer 
// to recognize whether an entry with the "name" as given is really the file we want in the right path.
// Should never get root by eget, it's easy to understand.
static struct dirent *eget(struct dirent *parent, char *name)
{
    802065b8:	7139                	addi	sp,sp,-64
    802065ba:	fc06                	sd	ra,56(sp)
    802065bc:	f822                	sd	s0,48(sp)
    802065be:	f426                	sd	s1,40(sp)
    802065c0:	f04a                	sd	s2,32(sp)
    802065c2:	ec4e                	sd	s3,24(sp)
    802065c4:	e852                	sd	s4,16(sp)
    802065c6:	e456                	sd	s5,8(sp)
    802065c8:	0080                	addi	s0,sp,64
    802065ca:	8a2a                	mv	s4,a0
    802065cc:	8aae                	mv	s5,a1
    struct dirent *ep;
    acquire(&ecache.lock);
    802065ce:	00025517          	auipc	a0,0x25
    802065d2:	34a50513          	addi	a0,a0,842 # 8022b918 <ecache>
    802065d6:	ffffa097          	auipc	ra,0xffffa
    802065da:	0f2080e7          	jalr	242(ra) # 802006c8 <acquire>
    if (name) {
    802065de:	060a8b63          	beqz	s5,80206654 <eget+0x9c>
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    802065e2:	00025497          	auipc	s1,0x25
    802065e6:	2f64b483          	ld	s1,758(s1) # 8022b8d8 <root+0x128>
    802065ea:	00025797          	auipc	a5,0x25
    802065ee:	1c678793          	addi	a5,a5,454 # 8022b7b0 <root>
    802065f2:	06f48163          	beq	s1,a5,80206654 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    802065f6:	4905                	li	s2,1
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    802065f8:	89be                	mv	s3,a5
    802065fa:	a029                	j	80206604 <eget+0x4c>
    802065fc:	1284b483          	ld	s1,296(s1)
    80206600:	05348a63          	beq	s1,s3,80206654 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    80206604:	11649783          	lh	a5,278(s1)
    80206608:	ff279ae3          	bne	a5,s2,802065fc <eget+0x44>
    8020660c:	1204b783          	ld	a5,288(s1)
    80206610:	ff4796e3          	bne	a5,s4,802065fc <eget+0x44>
                && strncmp(ep->filename, name, FAT32_MAX_FILENAME) == 0) {
    80206614:	0ff00613          	li	a2,255
    80206618:	85d6                	mv	a1,s5
    8020661a:	8526                	mv	a0,s1
    8020661c:	ffffa097          	auipc	ra,0xffffa
    80206620:	224080e7          	jalr	548(ra) # 80200840 <strncmp>
    80206624:	fd61                	bnez	a0,802065fc <eget+0x44>
                if (ep->ref++ == 0) {
    80206626:	1184a783          	lw	a5,280(s1)
    8020662a:	0017871b          	addiw	a4,a5,1
    8020662e:	10e4ac23          	sw	a4,280(s1)
    80206632:	eb81                	bnez	a5,80206642 <eget+0x8a>
                    ep->parent->ref++;
    80206634:	1204b703          	ld	a4,288(s1)
    80206638:	11872783          	lw	a5,280(a4)
    8020663c:	2785                	addiw	a5,a5,1
    8020663e:	10f72c23          	sw	a5,280(a4)
                }
                release(&ecache.lock);
    80206642:	00025517          	auipc	a0,0x25
    80206646:	2d650513          	addi	a0,a0,726 # 8022b918 <ecache>
    8020664a:	ffffa097          	auipc	ra,0xffffa
    8020664e:	0d2080e7          	jalr	210(ra) # 8020071c <release>
                // edup(ep->parent);
                return ep;
    80206652:	a085                	j	802066b2 <eget+0xfa>
            }
        }
    }
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80206654:	00025497          	auipc	s1,0x25
    80206658:	28c4b483          	ld	s1,652(s1) # 8022b8e0 <root+0x130>
    8020665c:	00025797          	auipc	a5,0x25
    80206660:	15478793          	addi	a5,a5,340 # 8022b7b0 <root>
    80206664:	00f48a63          	beq	s1,a5,80206678 <eget+0xc0>
    80206668:	873e                	mv	a4,a5
        if (ep->ref == 0) {
    8020666a:	1184a783          	lw	a5,280(s1)
    8020666e:	cf89                	beqz	a5,80206688 <eget+0xd0>
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80206670:	1304b483          	ld	s1,304(s1)
    80206674:	fee49be3          	bne	s1,a4,8020666a <eget+0xb2>
            ep->dirty = 0;
            release(&ecache.lock);
            return ep;
        }
    }
    panic("eget: insufficient ecache");
    80206678:	00004517          	auipc	a0,0x4
    8020667c:	6a050513          	addi	a0,a0,1696 # 8020ad18 <digits+0x998>
    80206680:	ffffa097          	auipc	ra,0xffffa
    80206684:	ac2080e7          	jalr	-1342(ra) # 80200142 <panic>
            ep->ref = 1;
    80206688:	4785                	li	a5,1
    8020668a:	10f4ac23          	sw	a5,280(s1)
            ep->dev = parent->dev;
    8020668e:	114a4783          	lbu	a5,276(s4)
    80206692:	10f48a23          	sb	a5,276(s1)
            ep->off = 0;
    80206696:	1004ae23          	sw	zero,284(s1)
            ep->valid = 0;
    8020669a:	10049b23          	sh	zero,278(s1)
            ep->dirty = 0;
    8020669e:	10048aa3          	sb	zero,277(s1)
            release(&ecache.lock);
    802066a2:	00025517          	auipc	a0,0x25
    802066a6:	27650513          	addi	a0,a0,630 # 8022b918 <ecache>
    802066aa:	ffffa097          	auipc	ra,0xffffa
    802066ae:	072080e7          	jalr	114(ra) # 8020071c <release>
    return 0;
}
    802066b2:	8526                	mv	a0,s1
    802066b4:	70e2                	ld	ra,56(sp)
    802066b6:	7442                	ld	s0,48(sp)
    802066b8:	74a2                	ld	s1,40(sp)
    802066ba:	7902                	ld	s2,32(sp)
    802066bc:	69e2                	ld	s3,24(sp)
    802066be:	6a42                	ld	s4,16(sp)
    802066c0:	6aa2                	ld	s5,8(sp)
    802066c2:	6121                	addi	sp,sp,64
    802066c4:	8082                	ret

00000000802066c6 <read_entry_name>:
 * @param   buffer      pointer to the array that stores the name
 * @param   raw_entry   pointer to the entry in a sector buffer
 * @param   islong      if non-zero, read as l-n-e, otherwise s-n-e.
 */
static void read_entry_name(char *buffer, union dentry *d)
{
    802066c6:	7139                	addi	sp,sp,-64
    802066c8:	fc06                	sd	ra,56(sp)
    802066ca:	f822                	sd	s0,48(sp)
    802066cc:	f426                	sd	s1,40(sp)
    802066ce:	f04a                	sd	s2,32(sp)
    802066d0:	ec4e                	sd	s3,24(sp)
    802066d2:	0080                	addi	s0,sp,64
    802066d4:	84aa                	mv	s1,a0
    802066d6:	892e                	mv	s2,a1
    if (d->lne.attr == ATTR_LONG_NAME) {                       // long entry branch
    802066d8:	00b5c703          	lbu	a4,11(a1)
    802066dc:	47bd                	li	a5,15
    802066de:	08f70563          	beq	a4,a5,80206768 <read_entry_name+0xa2>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
        buffer += NELEM(d->lne.name2);
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    } else {
        // assert: only "." and ".." will enter this branch
        memset(buffer, 0, CHAR_SHORT_NAME + 2); // plus '.' and '\0'
    802066e2:	4635                	li	a2,13
    802066e4:	4581                	li	a1,0
    802066e6:	ffffa097          	auipc	ra,0xffffa
    802066ea:	07e080e7          	jalr	126(ra) # 80200764 <memset>
        int i;
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    802066ee:	00094703          	lbu	a4,0(s2)
    802066f2:	02000793          	li	a5,32
    802066f6:	0af70c63          	beq	a4,a5,802067ae <read_entry_name+0xe8>
    802066fa:	4785                	li	a5,1
    802066fc:	02000613          	li	a2,32
    80206700:	45a5                	li	a1,9
            buffer[i] = d->sne.name[i];
    80206702:	00f486b3          	add	a3,s1,a5
    80206706:	fee68fa3          	sb	a4,-1(a3) # 1fff <_entry-0x801fe001>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    8020670a:	0007851b          	sext.w	a0,a5
    8020670e:	00f90733          	add	a4,s2,a5
    80206712:	00074703          	lbu	a4,0(a4)
    80206716:	00c70563          	beq	a4,a2,80206720 <read_entry_name+0x5a>
    8020671a:	0785                	addi	a5,a5,1
    8020671c:	feb793e3          	bne	a5,a1,80206702 <read_entry_name+0x3c>
        }
        if (d->sne.name[8] != ' ') {
    80206720:	00894703          	lbu	a4,8(s2)
    80206724:	02000793          	li	a5,32
    80206728:	00f70963          	beq	a4,a5,8020673a <read_entry_name+0x74>
            buffer[i++] = '.';
    8020672c:	00a487b3          	add	a5,s1,a0
    80206730:	02e00713          	li	a4,46
    80206734:	00e78023          	sb	a4,0(a5)
    80206738:	2505                	addiw	a0,a0,1
        }
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    8020673a:	00890793          	addi	a5,s2,8
    8020673e:	94aa                	add	s1,s1,a0
    80206740:	092d                	addi	s2,s2,11
            if (d->sne.name[j] == ' ') { break; }
    80206742:	02000693          	li	a3,32
    80206746:	0007c703          	lbu	a4,0(a5)
    8020674a:	00d70863          	beq	a4,a3,8020675a <read_entry_name+0x94>
            buffer[i] = d->sne.name[j];
    8020674e:	00e48023          	sb	a4,0(s1)
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    80206752:	0785                	addi	a5,a5,1
    80206754:	0485                	addi	s1,s1,1
    80206756:	ff2798e3          	bne	a5,s2,80206746 <read_entry_name+0x80>
        }
    }
}
    8020675a:	70e2                	ld	ra,56(sp)
    8020675c:	7442                	ld	s0,48(sp)
    8020675e:	74a2                	ld	s1,40(sp)
    80206760:	7902                	ld	s2,32(sp)
    80206762:	69e2                	ld	s3,24(sp)
    80206764:	6121                	addi	sp,sp,64
    80206766:	8082                	ret
        memmove(temp, d->lne.name1, sizeof(temp));
    80206768:	4629                	li	a2,10
    8020676a:	0585                	addi	a1,a1,1
    8020676c:	fc040993          	addi	s3,s0,-64
    80206770:	854e                	mv	a0,s3
    80206772:	ffffa097          	auipc	ra,0xffffa
    80206776:	052080e7          	jalr	82(ra) # 802007c4 <memmove>
        snstr(buffer, temp, NELEM(d->lne.name1));
    8020677a:	4615                	li	a2,5
    8020677c:	85ce                	mv	a1,s3
    8020677e:	8526                	mv	a0,s1
    80206780:	ffffa097          	auipc	ra,0xffffa
    80206784:	1ca080e7          	jalr	458(ra) # 8020094a <snstr>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
    80206788:	4619                	li	a2,6
    8020678a:	00e90593          	addi	a1,s2,14
    8020678e:	00548513          	addi	a0,s1,5
    80206792:	ffffa097          	auipc	ra,0xffffa
    80206796:	1b8080e7          	jalr	440(ra) # 8020094a <snstr>
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    8020679a:	4609                	li	a2,2
    8020679c:	01c90593          	addi	a1,s2,28
    802067a0:	00b48513          	addi	a0,s1,11
    802067a4:	ffffa097          	auipc	ra,0xffffa
    802067a8:	1a6080e7          	jalr	422(ra) # 8020094a <snstr>
    802067ac:	b77d                	j	8020675a <read_entry_name+0x94>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    802067ae:	4501                	li	a0,0
    802067b0:	bf85                	j	80206720 <read_entry_name+0x5a>

00000000802067b2 <fat32_init>:
{
    802067b2:	7139                	addi	sp,sp,-64
    802067b4:	fc06                	sd	ra,56(sp)
    802067b6:	f822                	sd	s0,48(sp)
    802067b8:	f426                	sd	s1,40(sp)
    802067ba:	f04a                	sd	s2,32(sp)
    802067bc:	ec4e                	sd	s3,24(sp)
    802067be:	e852                	sd	s4,16(sp)
    802067c0:	e456                	sd	s5,8(sp)
    802067c2:	0080                	addi	s0,sp,64
    struct buf *b = bread(0, 0);
    802067c4:	4581                	li	a1,0
    802067c6:	4501                	li	a0,0
    802067c8:	ffffd097          	auipc	ra,0xffffd
    802067cc:	28c080e7          	jalr	652(ra) # 80203a54 <bread>
    802067d0:	892a                	mv	s2,a0
    if (strncmp((char const*)(b->data + 82), "FAT32", 5))
    802067d2:	4615                	li	a2,5
    802067d4:	00004597          	auipc	a1,0x4
    802067d8:	56458593          	addi	a1,a1,1380 # 8020ad38 <digits+0x9b8>
    802067dc:	0aa50513          	addi	a0,a0,170
    802067e0:	ffffa097          	auipc	ra,0xffffa
    802067e4:	060080e7          	jalr	96(ra) # 80200840 <strncmp>
    802067e8:	16051863          	bnez	a0,80206958 <fat32_init+0x1a6>
    memmove(&fat.bpb.byts_per_sec, b->data + 11, 2);            // avoid misaligned load on k210
    802067ec:	00025497          	auipc	s1,0x25
    802067f0:	f9c48493          	addi	s1,s1,-100 # 8022b788 <fat>
    802067f4:	4609                	li	a2,2
    802067f6:	06390593          	addi	a1,s2,99
    802067fa:	00025517          	auipc	a0,0x25
    802067fe:	f9e50513          	addi	a0,a0,-98 # 8022b798 <fat+0x10>
    80206802:	ffffa097          	auipc	ra,0xffffa
    80206806:	fc2080e7          	jalr	-62(ra) # 802007c4 <memmove>
    fat.bpb.sec_per_clus = *(b->data + 13);
    8020680a:	06594683          	lbu	a3,101(s2)
    8020680e:	00d48923          	sb	a3,18(s1)
    fat.bpb.rsvd_sec_cnt = *(uint16 *)(b->data + 14);
    80206812:	06695603          	lhu	a2,102(s2)
    80206816:	00c49a23          	sh	a2,20(s1)
    fat.bpb.fat_cnt = *(b->data + 16);
    8020681a:	06894703          	lbu	a4,104(s2)
    8020681e:	00e48b23          	sb	a4,22(s1)
    fat.bpb.hidd_sec = *(uint32 *)(b->data + 28);
    80206822:	07492783          	lw	a5,116(s2)
    80206826:	cc9c                	sw	a5,24(s1)
    fat.bpb.tot_sec = *(uint32 *)(b->data + 32);
    80206828:	07892783          	lw	a5,120(s2)
    8020682c:	ccdc                	sw	a5,28(s1)
    fat.bpb.fat_sz = *(uint32 *)(b->data + 36);
    8020682e:	07c92583          	lw	a1,124(s2)
    80206832:	d08c                	sw	a1,32(s1)
    fat.bpb.root_clus = *(uint32 *)(b->data + 44);
    80206834:	08492503          	lw	a0,132(s2)
    80206838:	d0c8                	sw	a0,36(s1)
    fat.first_data_sec = fat.bpb.rsvd_sec_cnt + fat.bpb.fat_cnt * fat.bpb.fat_sz;
    8020683a:	02b7073b          	mulw	a4,a4,a1
    8020683e:	9f31                	addw	a4,a4,a2
    80206840:	c098                	sw	a4,0(s1)
    fat.data_sec_cnt = fat.bpb.tot_sec - fat.first_data_sec;
    80206842:	9f99                	subw	a5,a5,a4
    80206844:	c0dc                	sw	a5,4(s1)
    fat.data_clus_cnt = fat.data_sec_cnt / fat.bpb.sec_per_clus;
    80206846:	02d7d7bb          	divuw	a5,a5,a3
    8020684a:	c49c                	sw	a5,8(s1)
    fat.byts_per_clus = fat.bpb.sec_per_clus * fat.bpb.byts_per_sec;
    8020684c:	0104d783          	lhu	a5,16(s1)
    80206850:	02d787bb          	mulw	a5,a5,a3
    80206854:	c4dc                	sw	a5,12(s1)
    brelse(b);
    80206856:	854a                	mv	a0,s2
    80206858:	ffffd097          	auipc	ra,0xffffd
    8020685c:	328080e7          	jalr	808(ra) # 80203b80 <brelse>
    if (BSIZE != fat.bpb.byts_per_sec) 
    80206860:	0104d703          	lhu	a4,16(s1)
    80206864:	20000793          	li	a5,512
    80206868:	10f71063          	bne	a4,a5,80206968 <fat32_init+0x1b6>
    initlock(&ecache.lock, "ecache");
    8020686c:	00004597          	auipc	a1,0x4
    80206870:	50458593          	addi	a1,a1,1284 # 8020ad70 <digits+0x9f0>
    80206874:	00025517          	auipc	a0,0x25
    80206878:	0a450513          	addi	a0,a0,164 # 8022b918 <ecache>
    8020687c:	ffffa097          	auipc	ra,0xffffa
    80206880:	e08080e7          	jalr	-504(ra) # 80200684 <initlock>
    memset(&root, 0, sizeof(root));
    80206884:	00025497          	auipc	s1,0x25
    80206888:	f0448493          	addi	s1,s1,-252 # 8022b788 <fat>
    8020688c:	00025917          	auipc	s2,0x25
    80206890:	f2490913          	addi	s2,s2,-220 # 8022b7b0 <root>
    80206894:	16800613          	li	a2,360
    80206898:	4581                	li	a1,0
    8020689a:	854a                	mv	a0,s2
    8020689c:	ffffa097          	auipc	ra,0xffffa
    802068a0:	ec8080e7          	jalr	-312(ra) # 80200764 <memset>
    initsleeplock(&root.lock, "entry");
    802068a4:	00004597          	auipc	a1,0x4
    802068a8:	4d458593          	addi	a1,a1,1236 # 8020ad78 <digits+0x9f8>
    802068ac:	00025517          	auipc	a0,0x25
    802068b0:	03c50513          	addi	a0,a0,60 # 8022b8e8 <root+0x138>
    802068b4:	ffffd097          	auipc	ra,0xffffd
    802068b8:	3e2080e7          	jalr	994(ra) # 80203c96 <initsleeplock>
    root.attribute = (ATTR_DIRECTORY | ATTR_SYSTEM);
    802068bc:	47d1                	li	a5,20
    802068be:	12f48423          	sb	a5,296(s1)
    root.first_clus = root.cur_clus = fat.bpb.root_clus;
    802068c2:	50dc                	lw	a5,36(s1)
    802068c4:	12f4aa23          	sw	a5,308(s1)
    802068c8:	12f4a623          	sw	a5,300(s1)
    root.valid = 1;
    802068cc:	4785                	li	a5,1
    802068ce:	12f49f23          	sh	a5,318(s1)
    root.prev = &root;
    802068d2:	1524bc23          	sd	s2,344(s1)
    root.next = &root;
    802068d6:	1524b823          	sd	s2,336(s1)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    802068da:	00025497          	auipc	s1,0x25
    802068de:	05648493          	addi	s1,s1,86 # 8022b930 <ecache+0x18>
        de->next = root.next;
    802068e2:	00025917          	auipc	s2,0x25
    802068e6:	ea690913          	addi	s2,s2,-346 # 8022b788 <fat>
        de->prev = &root;
    802068ea:	00025a97          	auipc	s5,0x25
    802068ee:	ec6a8a93          	addi	s5,s5,-314 # 8022b7b0 <root>
        initsleeplock(&de->lock, "entry");
    802068f2:	00004a17          	auipc	s4,0x4
    802068f6:	486a0a13          	addi	s4,s4,1158 # 8020ad78 <digits+0x9f8>
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    802068fa:	00029997          	auipc	s3,0x29
    802068fe:	68698993          	addi	s3,s3,1670 # 8022ff80 <cons>
        de->dev = 0;
    80206902:	10048a23          	sb	zero,276(s1)
        de->valid = 0;
    80206906:	10049b23          	sh	zero,278(s1)
        de->ref = 0;
    8020690a:	1004ac23          	sw	zero,280(s1)
        de->dirty = 0;
    8020690e:	10048aa3          	sb	zero,277(s1)
        de->parent = 0;
    80206912:	1204b023          	sd	zero,288(s1)
        de->next = root.next;
    80206916:	15093783          	ld	a5,336(s2)
    8020691a:	12f4b423          	sd	a5,296(s1)
        de->prev = &root;
    8020691e:	1354b823          	sd	s5,304(s1)
        initsleeplock(&de->lock, "entry");
    80206922:	85d2                	mv	a1,s4
    80206924:	13848513          	addi	a0,s1,312
    80206928:	ffffd097          	auipc	ra,0xffffd
    8020692c:	36e080e7          	jalr	878(ra) # 80203c96 <initsleeplock>
        root.next->prev = de;
    80206930:	15093783          	ld	a5,336(s2)
    80206934:	1297b823          	sd	s1,304(a5)
        root.next = de;
    80206938:	14993823          	sd	s1,336(s2)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    8020693c:	16848493          	addi	s1,s1,360
    80206940:	fd3491e3          	bne	s1,s3,80206902 <fat32_init+0x150>
}
    80206944:	4501                	li	a0,0
    80206946:	70e2                	ld	ra,56(sp)
    80206948:	7442                	ld	s0,48(sp)
    8020694a:	74a2                	ld	s1,40(sp)
    8020694c:	7902                	ld	s2,32(sp)
    8020694e:	69e2                	ld	s3,24(sp)
    80206950:	6a42                	ld	s4,16(sp)
    80206952:	6aa2                	ld	s5,8(sp)
    80206954:	6121                	addi	sp,sp,64
    80206956:	8082                	ret
        panic("not FAT32 volume");
    80206958:	00004517          	auipc	a0,0x4
    8020695c:	3e850513          	addi	a0,a0,1000 # 8020ad40 <digits+0x9c0>
    80206960:	ffff9097          	auipc	ra,0xffff9
    80206964:	7e2080e7          	jalr	2018(ra) # 80200142 <panic>
        panic("byts_per_sec != BSIZE");
    80206968:	00004517          	auipc	a0,0x4
    8020696c:	3f050513          	addi	a0,a0,1008 # 8020ad58 <digits+0x9d8>
    80206970:	ffff9097          	auipc	ra,0xffff9
    80206974:	7d2080e7          	jalr	2002(ra) # 80200142 <panic>

0000000080206978 <eread>:
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80206978:	10852783          	lw	a5,264(a0)
    8020697c:	0ed7e863          	bltu	a5,a3,80206a6c <eread+0xf4>
{
    80206980:	711d                	addi	sp,sp,-96
    80206982:	ec86                	sd	ra,88(sp)
    80206984:	e8a2                	sd	s0,80(sp)
    80206986:	e4a6                	sd	s1,72(sp)
    80206988:	e0ca                	sd	s2,64(sp)
    8020698a:	fc4e                	sd	s3,56(sp)
    8020698c:	f852                	sd	s4,48(sp)
    8020698e:	f456                	sd	s5,40(sp)
    80206990:	f05a                	sd	s6,32(sp)
    80206992:	ec5e                	sd	s7,24(sp)
    80206994:	e862                	sd	s8,16(sp)
    80206996:	e466                	sd	s9,8(sp)
    80206998:	e06a                	sd	s10,0(sp)
    8020699a:	1080                	addi	s0,sp,96
    8020699c:	8a2a                	mv	s4,a0
    8020699e:	8bae                	mv	s7,a1
    802069a0:	8ab2                	mv	s5,a2
    802069a2:	8936                	mv	s2,a3
    802069a4:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    802069a6:	9eb9                	addw	a3,a3,a4
        return 0;
    802069a8:	4501                	li	a0,0
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    802069aa:	0b26e163          	bltu	a3,s2,80206a4c <eread+0xd4>
    802069ae:	100a4703          	lbu	a4,256(s4)
    802069b2:	8b41                	andi	a4,a4,16
    802069b4:	ef41                	bnez	a4,80206a4c <eread+0xd4>
    if (off + n > entry->file_size) {
    802069b6:	00d7f463          	bgeu	a5,a3,802069be <eread+0x46>
        n = entry->file_size - off;
    802069ba:	41278b3b          	subw	s6,a5,s2
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802069be:	10ca2703          	lw	a4,268(s4)
    802069c2:	100007b7          	lui	a5,0x10000
    802069c6:	17dd                	addi	a5,a5,-9
    802069c8:	06e7ef63          	bltu	a5,a4,80206a46 <eread+0xce>
    802069cc:	080b0e63          	beqz	s6,80206a68 <eread+0xf0>
    802069d0:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    802069d2:	00025c97          	auipc	s9,0x25
    802069d6:	db6c8c93          	addi	s9,s9,-586 # 8022b788 <fat>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802069da:	8c3e                	mv	s8,a5
    802069dc:	a82d                	j	80206a16 <eread+0x9e>
    802069de:	00048d1b          	sext.w	s10,s1
        if (rw_clus(entry->cur_clus, 0, user_dst, dst, off % fat.byts_per_clus, m) != m) {
    802069e2:	87ea                	mv	a5,s10
    802069e4:	86d6                	mv	a3,s5
    802069e6:	865e                	mv	a2,s7
    802069e8:	4581                	li	a1,0
    802069ea:	10ca2503          	lw	a0,268(s4)
    802069ee:	00000097          	auipc	ra,0x0
    802069f2:	a7e080e7          	jalr	-1410(ra) # 8020646c <rw_clus>
    802069f6:	2501                	sext.w	a0,a0
    802069f8:	04ad1863          	bne	s10,a0,80206a48 <eread+0xd0>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    802069fc:	013489bb          	addw	s3,s1,s3
    80206a00:	0124893b          	addw	s2,s1,s2
    80206a04:	1482                	slli	s1,s1,0x20
    80206a06:	9081                	srli	s1,s1,0x20
    80206a08:	9aa6                	add	s5,s5,s1
    80206a0a:	10ca2783          	lw	a5,268(s4)
    80206a0e:	02fc6d63          	bltu	s8,a5,80206a48 <eread+0xd0>
    80206a12:	0369fb63          	bgeu	s3,s6,80206a48 <eread+0xd0>
        reloc_clus(entry, off, 0);
    80206a16:	4601                	li	a2,0
    80206a18:	85ca                	mv	a1,s2
    80206a1a:	8552                	mv	a0,s4
    80206a1c:	00000097          	auipc	ra,0x0
    80206a20:	946080e7          	jalr	-1722(ra) # 80206362 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206a24:	00cca783          	lw	a5,12(s9)
    80206a28:	02f976bb          	remuw	a3,s2,a5
    80206a2c:	0006871b          	sext.w	a4,a3
    80206a30:	9f95                	subw	a5,a5,a3
        if (n - tot < m) {
    80206a32:	413b06bb          	subw	a3,s6,s3
    80206a36:	84b6                	mv	s1,a3
    80206a38:	2681                	sext.w	a3,a3
    80206a3a:	0007861b          	sext.w	a2,a5
    80206a3e:	fad670e3          	bgeu	a2,a3,802069de <eread+0x66>
    80206a42:	84be                	mv	s1,a5
    80206a44:	bf69                	j	802069de <eread+0x66>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206a46:	4981                	li	s3,0
    return tot;
    80206a48:	0009851b          	sext.w	a0,s3
}
    80206a4c:	60e6                	ld	ra,88(sp)
    80206a4e:	6446                	ld	s0,80(sp)
    80206a50:	64a6                	ld	s1,72(sp)
    80206a52:	6906                	ld	s2,64(sp)
    80206a54:	79e2                	ld	s3,56(sp)
    80206a56:	7a42                	ld	s4,48(sp)
    80206a58:	7aa2                	ld	s5,40(sp)
    80206a5a:	7b02                	ld	s6,32(sp)
    80206a5c:	6be2                	ld	s7,24(sp)
    80206a5e:	6c42                	ld	s8,16(sp)
    80206a60:	6ca2                	ld	s9,8(sp)
    80206a62:	6d02                	ld	s10,0(sp)
    80206a64:	6125                	addi	sp,sp,96
    80206a66:	8082                	ret
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80206a68:	89da                	mv	s3,s6
    80206a6a:	bff9                	j	80206a48 <eread+0xd0>
        return 0;
    80206a6c:	4501                	li	a0,0
}
    80206a6e:	8082                	ret

0000000080206a70 <ewrite>:
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    80206a70:	10852783          	lw	a5,264(a0)
    80206a74:	0ed7e463          	bltu	a5,a3,80206b5c <ewrite+0xec>
{
    80206a78:	711d                	addi	sp,sp,-96
    80206a7a:	ec86                	sd	ra,88(sp)
    80206a7c:	e8a2                	sd	s0,80(sp)
    80206a7e:	e4a6                	sd	s1,72(sp)
    80206a80:	e0ca                	sd	s2,64(sp)
    80206a82:	fc4e                	sd	s3,56(sp)
    80206a84:	f852                	sd	s4,48(sp)
    80206a86:	f456                	sd	s5,40(sp)
    80206a88:	f05a                	sd	s6,32(sp)
    80206a8a:	ec5e                	sd	s7,24(sp)
    80206a8c:	e862                	sd	s8,16(sp)
    80206a8e:	e466                	sd	s9,8(sp)
    80206a90:	1080                	addi	s0,sp,96
    80206a92:	8aaa                	mv	s5,a0
    80206a94:	8bae                	mv	s7,a1
    80206a96:	8a32                	mv	s4,a2
    80206a98:	8936                	mv	s2,a3
    80206a9a:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    80206a9c:	00e687bb          	addw	a5,a3,a4
    80206aa0:	0cd7e063          	bltu	a5,a3,80206b60 <ewrite+0xf0>
    80206aa4:	02069793          	slli	a5,a3,0x20
    80206aa8:	9381                	srli	a5,a5,0x20
    80206aaa:	1702                	slli	a4,a4,0x20
    80206aac:	9301                	srli	a4,a4,0x20
    80206aae:	97ba                	add	a5,a5,a4
    80206ab0:	577d                	li	a4,-1
    80206ab2:	9301                	srli	a4,a4,0x20
    80206ab4:	0af76863          	bltu	a4,a5,80206b64 <ewrite+0xf4>
        || (entry->attribute & ATTR_READ_ONLY)) {
    80206ab8:	10054783          	lbu	a5,256(a0)
    80206abc:	8b85                	andi	a5,a5,1
    80206abe:	e7cd                	bnez	a5,80206b68 <ewrite+0xf8>
    if (entry->first_clus == 0) {   // so file_size if 0 too, which requests off == 0
    80206ac0:	10452783          	lw	a5,260(a0)
    80206ac4:	cb89                	beqz	a5,80206ad6 <ewrite+0x66>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206ac6:	080b0963          	beqz	s6,80206b58 <ewrite+0xe8>
    80206aca:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206acc:	00025c17          	auipc	s8,0x25
    80206ad0:	cbcc0c13          	addi	s8,s8,-836 # 8022b788 <fat>
    80206ad4:	a891                	j	80206b28 <ewrite+0xb8>
        entry->cur_clus = entry->first_clus = alloc_clus(entry->dev);
    80206ad6:	11454503          	lbu	a0,276(a0)
    80206ada:	fffff097          	auipc	ra,0xfffff
    80206ade:	6c8080e7          	jalr	1736(ra) # 802061a2 <alloc_clus>
    80206ae2:	2501                	sext.w	a0,a0
    80206ae4:	10aaa223          	sw	a0,260(s5)
    80206ae8:	10aaa623          	sw	a0,268(s5)
        entry->clus_cnt = 0;
    80206aec:	100aa823          	sw	zero,272(s5)
        entry->dirty = 1;
    80206af0:	4785                	li	a5,1
    80206af2:	10fa8aa3          	sb	a5,277(s5)
    80206af6:	bfc1                	j	80206ac6 <ewrite+0x56>
    80206af8:	00048c9b          	sext.w	s9,s1
        if (rw_clus(entry->cur_clus, 1, user_src, src, off % fat.byts_per_clus, m) != m) {
    80206afc:	87e6                	mv	a5,s9
    80206afe:	86d2                	mv	a3,s4
    80206b00:	865e                	mv	a2,s7
    80206b02:	4585                	li	a1,1
    80206b04:	10caa503          	lw	a0,268(s5)
    80206b08:	00000097          	auipc	ra,0x0
    80206b0c:	964080e7          	jalr	-1692(ra) # 8020646c <rw_clus>
    80206b10:	2501                	sext.w	a0,a0
    80206b12:	04ac9d63          	bne	s9,a0,80206b6c <ewrite+0xfc>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206b16:	013489bb          	addw	s3,s1,s3
    80206b1a:	0124893b          	addw	s2,s1,s2
    80206b1e:	1482                	slli	s1,s1,0x20
    80206b20:	9081                	srli	s1,s1,0x20
    80206b22:	9a26                	add	s4,s4,s1
    80206b24:	0569f463          	bgeu	s3,s6,80206b6c <ewrite+0xfc>
        reloc_clus(entry, off, 1);
    80206b28:	4605                	li	a2,1
    80206b2a:	85ca                	mv	a1,s2
    80206b2c:	8556                	mv	a0,s5
    80206b2e:	00000097          	auipc	ra,0x0
    80206b32:	834080e7          	jalr	-1996(ra) # 80206362 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80206b36:	00cc2783          	lw	a5,12(s8)
    80206b3a:	02f976bb          	remuw	a3,s2,a5
    80206b3e:	0006871b          	sext.w	a4,a3
    80206b42:	9f95                	subw	a5,a5,a3
        if (n - tot < m) {
    80206b44:	413b06bb          	subw	a3,s6,s3
    80206b48:	84b6                	mv	s1,a3
    80206b4a:	2681                	sext.w	a3,a3
    80206b4c:	0007861b          	sext.w	a2,a5
    80206b50:	fad674e3          	bgeu	a2,a3,80206af8 <ewrite+0x88>
    80206b54:	84be                	mv	s1,a5
    80206b56:	b74d                	j	80206af8 <ewrite+0x88>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80206b58:	89da                	mv	s3,s6
    80206b5a:	a015                	j	80206b7e <ewrite+0x10e>
        return -1;
    80206b5c:	557d                	li	a0,-1
}
    80206b5e:	8082                	ret
        return -1;
    80206b60:	557d                	li	a0,-1
    80206b62:	a005                	j	80206b82 <ewrite+0x112>
    80206b64:	557d                	li	a0,-1
    80206b66:	a831                	j	80206b82 <ewrite+0x112>
    80206b68:	557d                	li	a0,-1
    80206b6a:	a821                	j	80206b82 <ewrite+0x112>
        if(off > entry->file_size) {
    80206b6c:	108aa783          	lw	a5,264(s5)
    80206b70:	0127f763          	bgeu	a5,s2,80206b7e <ewrite+0x10e>
            entry->file_size = off;
    80206b74:	112aa423          	sw	s2,264(s5)
            entry->dirty = 1;
    80206b78:	4785                	li	a5,1
    80206b7a:	10fa8aa3          	sb	a5,277(s5)
    return tot;
    80206b7e:	0009851b          	sext.w	a0,s3
}
    80206b82:	60e6                	ld	ra,88(sp)
    80206b84:	6446                	ld	s0,80(sp)
    80206b86:	64a6                	ld	s1,72(sp)
    80206b88:	6906                	ld	s2,64(sp)
    80206b8a:	79e2                	ld	s3,56(sp)
    80206b8c:	7a42                	ld	s4,48(sp)
    80206b8e:	7aa2                	ld	s5,40(sp)
    80206b90:	7b02                	ld	s6,32(sp)
    80206b92:	6be2                	ld	s7,24(sp)
    80206b94:	6c42                	ld	s8,16(sp)
    80206b96:	6ca2                	ld	s9,8(sp)
    80206b98:	6125                	addi	sp,sp,96
    80206b9a:	8082                	ret

0000000080206b9c <formatname>:
{
    80206b9c:	7179                	addi	sp,sp,-48
    80206b9e:	f406                	sd	ra,40(sp)
    80206ba0:	f022                	sd	s0,32(sp)
    80206ba2:	ec26                	sd	s1,24(sp)
    80206ba4:	e84a                	sd	s2,16(sp)
    80206ba6:	e44e                	sd	s3,8(sp)
    80206ba8:	e052                	sd	s4,0(sp)
    80206baa:	1800                	addi	s0,sp,48
    80206bac:	84aa                	mv	s1,a0
    while (*name == ' ' || *name == '.') { name++; }
    80206bae:	02000793          	li	a5,32
    80206bb2:	02e00713          	li	a4,46
    80206bb6:	a011                	j	80206bba <formatname+0x1e>
    80206bb8:	0485                	addi	s1,s1,1
    80206bba:	0004c583          	lbu	a1,0(s1)
    80206bbe:	fef58de3          	beq	a1,a5,80206bb8 <formatname+0x1c>
    80206bc2:	fee58be3          	beq	a1,a4,80206bb8 <formatname+0x1c>
    for (p = name; *p; p++) {
    80206bc6:	c1b9                	beqz	a1,80206c0c <formatname+0x70>
    80206bc8:	8926                	mv	s2,s1
        if (c < 0x20 || strchr(illegal, c)) {
    80206bca:	49fd                	li	s3,31
    80206bcc:	00006a17          	auipc	s4,0x6
    80206bd0:	4cca0a13          	addi	s4,s4,1228 # 8020d098 <illegal.1646>
    80206bd4:	02b9fe63          	bgeu	s3,a1,80206c10 <formatname+0x74>
    80206bd8:	8552                	mv	a0,s4
    80206bda:	ffffa097          	auipc	ra,0xffffa
    80206bde:	df4080e7          	jalr	-524(ra) # 802009ce <strchr>
    80206be2:	e121                	bnez	a0,80206c22 <formatname+0x86>
    for (p = name; *p; p++) {
    80206be4:	0905                	addi	s2,s2,1
    80206be6:	00094583          	lbu	a1,0(s2)
    80206bea:	f5ed                	bnez	a1,80206bd4 <formatname+0x38>
        if (*p != ' ') {
    80206bec:	02000693          	li	a3,32
    80206bf0:	874a                	mv	a4,s2
    while (p-- > name) {
    80206bf2:	0124fb63          	bgeu	s1,s2,80206c08 <formatname+0x6c>
        if (*p != ' ') {
    80206bf6:	197d                	addi	s2,s2,-1
    80206bf8:	00094783          	lbu	a5,0(s2)
    80206bfc:	fed78ae3          	beq	a5,a3,80206bf0 <formatname+0x54>
            p[1] = '\0';
    80206c00:	00070023          	sb	zero,0(a4)
            break;
    80206c04:	8526                	mv	a0,s1
    80206c06:	a031                	j	80206c12 <formatname+0x76>
    80206c08:	8526                	mv	a0,s1
    80206c0a:	a021                	j	80206c12 <formatname+0x76>
    for (p = name; *p; p++) {
    80206c0c:	8526                	mv	a0,s1
    80206c0e:	a011                	j	80206c12 <formatname+0x76>
            return 0;
    80206c10:	4501                	li	a0,0
}
    80206c12:	70a2                	ld	ra,40(sp)
    80206c14:	7402                	ld	s0,32(sp)
    80206c16:	64e2                	ld	s1,24(sp)
    80206c18:	6942                	ld	s2,16(sp)
    80206c1a:	69a2                	ld	s3,8(sp)
    80206c1c:	6a02                	ld	s4,0(sp)
    80206c1e:	6145                	addi	sp,sp,48
    80206c20:	8082                	ret
            return 0;
    80206c22:	4501                	li	a0,0
    80206c24:	b7fd                	j	80206c12 <formatname+0x76>

0000000080206c26 <cal_checksum>:
{
    80206c26:	1141                	addi	sp,sp,-16
    80206c28:	e422                	sd	s0,8(sp)
    80206c2a:	0800                	addi	s0,sp,16
    80206c2c:	87aa                	mv	a5,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    80206c2e:	00b50613          	addi	a2,a0,11
    uint8 sum = 0;
    80206c32:	4501                	li	a0,0
        sum = ((sum & 1) ? 0x80 : 0) + (sum >> 1) + *shortname++;
    80206c34:	0075171b          	slliw	a4,a0,0x7
    80206c38:	0785                	addi	a5,a5,1
    80206c3a:	0015551b          	srliw	a0,a0,0x1
    80206c3e:	fff7c683          	lbu	a3,-1(a5) # fffffff <_entry-0x70200001>
    80206c42:	9d35                	addw	a0,a0,a3
    80206c44:	953a                	add	a0,a0,a4
    80206c46:	0ff57513          	andi	a0,a0,255
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    80206c4a:	fef615e3          	bne	a2,a5,80206c34 <cal_checksum+0xe>
}
    80206c4e:	6422                	ld	s0,8(sp)
    80206c50:	0141                	addi	sp,sp,16
    80206c52:	8082                	ret

0000000080206c54 <emake>:
{
    80206c54:	7131                	addi	sp,sp,-192
    80206c56:	fd06                	sd	ra,184(sp)
    80206c58:	f922                	sd	s0,176(sp)
    80206c5a:	f526                	sd	s1,168(sp)
    80206c5c:	f14a                	sd	s2,160(sp)
    80206c5e:	ed4e                	sd	s3,152(sp)
    80206c60:	e952                	sd	s4,144(sp)
    80206c62:	e556                	sd	s5,136(sp)
    80206c64:	e15a                	sd	s6,128(sp)
    80206c66:	fcde                	sd	s7,120(sp)
    80206c68:	f8e2                	sd	s8,112(sp)
    80206c6a:	f4e6                	sd	s9,104(sp)
    80206c6c:	f0ea                	sd	s10,96(sp)
    80206c6e:	ecee                	sd	s11,88(sp)
    80206c70:	0180                	addi	s0,sp,192
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206c72:	10054783          	lbu	a5,256(a0)
    80206c76:	8bc1                	andi	a5,a5,16
    80206c78:	c3d5                	beqz	a5,80206d1c <emake+0xc8>
    80206c7a:	8b2a                	mv	s6,a0
    80206c7c:	8d2e                	mv	s10,a1
    80206c7e:	8cb2                	mv	s9,a2
    if (off % sizeof(union dentry))
    80206c80:	01f67793          	andi	a5,a2,31
    80206c84:	e7c5                	bnez	a5,80206d2c <emake+0xd8>
    memset(&de, 0, sizeof(de));
    80206c86:	02000613          	li	a2,32
    80206c8a:	4581                	li	a1,0
    80206c8c:	f7040513          	addi	a0,s0,-144
    80206c90:	ffffa097          	auipc	ra,0xffffa
    80206c94:	ad4080e7          	jalr	-1324(ra) # 80200764 <memset>
    if (off <= 32) {
    80206c98:	02000793          	li	a5,32
    80206c9c:	0b97ec63          	bltu	a5,s9,80206d54 <emake+0x100>
        if (off == 0) {
    80206ca0:	080c9e63          	bnez	s9,80206d3c <emake+0xe8>
            strncpy(de.sne.name, ".          ", sizeof(de.sne.name));
    80206ca4:	462d                	li	a2,11
    80206ca6:	00004597          	auipc	a1,0x4
    80206caa:	10258593          	addi	a1,a1,258 # 8020ada8 <digits+0xa28>
    80206cae:	f7040513          	addi	a0,s0,-144
    80206cb2:	ffffa097          	auipc	ra,0xffffa
    80206cb6:	bca080e7          	jalr	-1078(ra) # 8020087c <strncpy>
        de.sne.attr = ATTR_DIRECTORY;
    80206cba:	47c1                	li	a5,16
    80206cbc:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);        // first clus high 16 bits
    80206cc0:	104d2783          	lw	a5,260(s10)
    80206cc4:	0107d71b          	srliw	a4,a5,0x10
    80206cc8:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);       // low 16 bits
    80206ccc:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = 0;                                       // filesize is updated in eupdate()
    80206cd0:	f8042623          	sw	zero,-116(s0)
        off = reloc_clus(dp, off, 1);
    80206cd4:	4605                	li	a2,1
    80206cd6:	85e6                	mv	a1,s9
    80206cd8:	855a                	mv	a0,s6
    80206cda:	fffff097          	auipc	ra,0xfffff
    80206cde:	688080e7          	jalr	1672(ra) # 80206362 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206ce2:	02000793          	li	a5,32
    80206ce6:	0005071b          	sext.w	a4,a0
    80206cea:	f7040693          	addi	a3,s0,-144
    80206cee:	4601                	li	a2,0
    80206cf0:	4585                	li	a1,1
    80206cf2:	10cb2503          	lw	a0,268(s6)
    80206cf6:	fffff097          	auipc	ra,0xfffff
    80206cfa:	776080e7          	jalr	1910(ra) # 8020646c <rw_clus>
}
    80206cfe:	70ea                	ld	ra,184(sp)
    80206d00:	744a                	ld	s0,176(sp)
    80206d02:	74aa                	ld	s1,168(sp)
    80206d04:	790a                	ld	s2,160(sp)
    80206d06:	69ea                	ld	s3,152(sp)
    80206d08:	6a4a                	ld	s4,144(sp)
    80206d0a:	6aaa                	ld	s5,136(sp)
    80206d0c:	6b0a                	ld	s6,128(sp)
    80206d0e:	7be6                	ld	s7,120(sp)
    80206d10:	7c46                	ld	s8,112(sp)
    80206d12:	7ca6                	ld	s9,104(sp)
    80206d14:	7d06                	ld	s10,96(sp)
    80206d16:	6de6                	ld	s11,88(sp)
    80206d18:	6129                	addi	sp,sp,192
    80206d1a:	8082                	ret
        panic("emake: not dir");
    80206d1c:	00004517          	auipc	a0,0x4
    80206d20:	06450513          	addi	a0,a0,100 # 8020ad80 <digits+0xa00>
    80206d24:	ffff9097          	auipc	ra,0xffff9
    80206d28:	41e080e7          	jalr	1054(ra) # 80200142 <panic>
        panic("emake: not aligned");
    80206d2c:	00004517          	auipc	a0,0x4
    80206d30:	06450513          	addi	a0,a0,100 # 8020ad90 <digits+0xa10>
    80206d34:	ffff9097          	auipc	ra,0xffff9
    80206d38:	40e080e7          	jalr	1038(ra) # 80200142 <panic>
            strncpy(de.sne.name, "..         ", sizeof(de.sne.name));
    80206d3c:	462d                	li	a2,11
    80206d3e:	00004597          	auipc	a1,0x4
    80206d42:	07a58593          	addi	a1,a1,122 # 8020adb8 <digits+0xa38>
    80206d46:	f7040513          	addi	a0,s0,-144
    80206d4a:	ffffa097          	auipc	ra,0xffffa
    80206d4e:	b32080e7          	jalr	-1230(ra) # 8020087c <strncpy>
    80206d52:	b7a5                	j	80206cba <emake+0x66>
        int entcnt = (strlen(ep->filename) + CHAR_LONG_NAME - 1) / CHAR_LONG_NAME;   // count of l-n-entries, rounds up
    80206d54:	896a                	mv	s2,s10
    80206d56:	856a                	mv	a0,s10
    80206d58:	ffffa097          	auipc	ra,0xffffa
    80206d5c:	b94080e7          	jalr	-1132(ra) # 802008ec <strlen>
    80206d60:	f4a43823          	sd	a0,-176(s0)
    80206d64:	00c5071b          	addiw	a4,a0,12
    80206d68:	47b5                	li	a5,13
    80206d6a:	02f747bb          	divw	a5,a4,a5
    80206d6e:	f4f42c23          	sw	a5,-168(s0)
    80206d72:	00078d9b          	sext.w	s11,a5
        memset(shortname, 0, sizeof(shortname));
    80206d76:	4631                	li	a2,12
    80206d78:	4581                	li	a1,0
    80206d7a:	f6040513          	addi	a0,s0,-160
    80206d7e:	ffffa097          	auipc	ra,0xffffa
    80206d82:	9e6080e7          	jalr	-1562(ra) # 80200764 <memset>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80206d86:	856a                	mv	a0,s10
    80206d88:	ffffa097          	auipc	ra,0xffffa
    80206d8c:	b64080e7          	jalr	-1180(ra) # 802008ec <strlen>
    80206d90:	fff5079b          	addiw	a5,a0,-1
    80206d94:	0407c063          	bltz	a5,80206dd4 <emake+0x180>
    80206d98:	97ea                	add	a5,a5,s10
    80206d9a:	ffed0693          	addi	a3,s10,-2
    80206d9e:	96aa                	add	a3,a3,a0
    80206da0:	fff5071b          	addiw	a4,a0,-1
    80206da4:	1702                	slli	a4,a4,0x20
    80206da6:	9301                	srli	a4,a4,0x20
    80206da8:	8e99                	sub	a3,a3,a4
        if (name[j] == '.') {
    80206daa:	02e00613          	li	a2,46
    80206dae:	89be                	mv	s3,a5
    80206db0:	0007c703          	lbu	a4,0(a5)
    80206db4:	00c70663          	beq	a4,a2,80206dc0 <emake+0x16c>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80206db8:	17fd                	addi	a5,a5,-1
    80206dba:	fed79ae3          	bne	a5,a3,80206dae <emake+0x15a>
    char c, *p = name;
    80206dbe:	89ea                	mv	s3,s10
        shortname[i++] = c;
    80206dc0:	4481                	li	s1,0
        if (i == 8 && p) {
    80206dc2:	4aa1                	li	s5,8
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206dc4:	4ba9                	li	s7,10
        if (c == '.') {
    80206dc6:	02e00c13          	li	s8,46
                memset(shortname + i, ' ', 8 - i);
    80206dca:	f6040793          	addi	a5,s0,-160
    80206dce:	f4f43423          	sd	a5,-184(s0)
    80206dd2:	a0f1                	j	80206e9e <emake+0x24a>
    char c, *p = name;
    80206dd4:	89ea                	mv	s3,s10
    80206dd6:	b7ed                	j	80206dc0 <emake+0x16c>
        if (i == 8 && p) {
    80206dd8:	22098163          	beqz	s3,80206ffa <emake+0x3a6>
            if (p + 1 < name) { break; }            // no '.'
    80206ddc:	0985                	addi	s3,s3,1
    80206dde:	0949f763          	bgeu	s3,s4,80206e6c <emake+0x218>
    80206de2:	f6040793          	addi	a5,s0,-160
    80206de6:	97a6                	add	a5,a5,s1
        shortname[i++] = ' ';
    80206de8:	02000693          	li	a3,32
    while (i < CHAR_SHORT_NAME) {
    80206dec:	4729                	li	a4,10
        shortname[i++] = ' ';
    80206dee:	2485                	addiw	s1,s1,1
    80206df0:	00d78023          	sb	a3,0(a5)
    while (i < CHAR_SHORT_NAME) {
    80206df4:	0785                	addi	a5,a5,1
    80206df6:	fe975ce3          	bge	a4,s1,80206dee <emake+0x19a>
        de.lne.checksum = cal_checksum((uchar *)shortname);
    80206dfa:	f6040513          	addi	a0,s0,-160
    80206dfe:	00000097          	auipc	ra,0x0
    80206e02:	e28080e7          	jalr	-472(ra) # 80206c26 <cal_checksum>
    80206e06:	f6a40ea3          	sb	a0,-131(s0)
        de.lne.attr = ATTR_LONG_NAME;
    80206e0a:	47bd                	li	a5,15
    80206e0c:	f6f40da3          	sb	a5,-133(s0)
        for (int i = entcnt; i > 0; i--) {
    80206e10:	f5043783          	ld	a5,-176(s0)
    80206e14:	0ef05f63          	blez	a5,80206f12 <emake+0x2be>
    80206e18:	f5842783          	lw	a5,-168(s0)
    80206e1c:	37fd                	addiw	a5,a5,-1
    80206e1e:	f4f42423          	sw	a5,-184(s0)
    80206e22:	00179b9b          	slliw	s7,a5,0x1
    80206e26:	00fb8bbb          	addw	s7,s7,a5
    80206e2a:	002b9b9b          	slliw	s7,s7,0x2
    80206e2e:	00fb8bbb          	addw	s7,s7,a5
    80206e32:	9bea                	add	s7,s7,s10
    80206e34:	8a6e                	mv	s4,s11
    80206e36:	8c66                	mv	s8,s9
            uint8 *w = (uint8 *)de.lne.name1;
    80206e38:	f7140793          	addi	a5,s0,-143
    80206e3c:	f4f43c23          	sd	a5,-168(s0)
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    80206e40:	597d                	li	s2,-1
                switch (j) {
    80206e42:	44ad                	li	s1,11
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80206e44:	f7e40a93          	addi	s5,s0,-130
                switch (j) {
    80206e48:	f8c40993          	addi	s3,s0,-116
    80206e4c:	aa41                	j	80206fdc <emake+0x388>
            if (name > p) {                    // last '.'
    80206e4e:	0549f563          	bgeu	s3,s4,80206e98 <emake+0x244>
                memset(shortname + i, ' ', 8 - i);
    80206e52:	4621                	li	a2,8
    80206e54:	9e05                	subw	a2,a2,s1
    80206e56:	02000593          	li	a1,32
    80206e5a:	f4843783          	ld	a5,-184(s0)
    80206e5e:	00978533          	add	a0,a5,s1
    80206e62:	ffffa097          	auipc	ra,0xffffa
    80206e66:	902080e7          	jalr	-1790(ra) # 80200764 <memset>
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206e6a:	89d2                	mv	s3,s4
        shortname[i++] = c;
    80206e6c:	8a4e                	mv	s4,s3
    80206e6e:	84d6                	mv	s1,s5
    80206e70:	4981                	li	s3,0
    80206e72:	a02d                	j	80206e9c <emake+0x248>
            if (strchr(illegal, c) != NULL) {
    80206e74:	85ca                	mv	a1,s2
    80206e76:	00006517          	auipc	a0,0x6
    80206e7a:	23250513          	addi	a0,a0,562 # 8020d0a8 <illegal.1662>
    80206e7e:	ffffa097          	auipc	ra,0xffffa
    80206e82:	b50080e7          	jalr	-1200(ra) # 802009ce <strchr>
    80206e86:	c119                	beqz	a0,80206e8c <emake+0x238>
                c = '_';
    80206e88:	05f00913          	li	s2,95
        shortname[i++] = c;
    80206e8c:	f9040793          	addi	a5,s0,-112
    80206e90:	97a6                	add	a5,a5,s1
    80206e92:	fd278823          	sb	s2,-48(a5)
    80206e96:	2485                	addiw	s1,s1,1
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206e98:	f69bc1e3          	blt	s7,s1,80206dfa <emake+0x1a6>
        shortname[i++] = c;
    80206e9c:	8952                	mv	s2,s4
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206e9e:	00190a13          	addi	s4,s2,1
    80206ea2:	00094903          	lbu	s2,0(s2)
    80206ea6:	02090563          	beqz	s2,80206ed0 <emake+0x27c>
        if (i == 8 && p) {
    80206eaa:	f35487e3          	beq	s1,s5,80206dd8 <emake+0x184>
        if (c == ' ') { continue; }
    80206eae:	02000793          	li	a5,32
    80206eb2:	fef903e3          	beq	s2,a5,80206e98 <emake+0x244>
        if (c == '.') {
    80206eb6:	f9890ce3          	beq	s2,s8,80206e4e <emake+0x1fa>
        if (c >= 'a' && c <= 'z') {
    80206eba:	f9f9079b          	addiw	a5,s2,-97
    80206ebe:	0ff7f793          	andi	a5,a5,255
    80206ec2:	4765                	li	a4,25
    80206ec4:	faf768e3          	bltu	a4,a5,80206e74 <emake+0x220>
            c += 'A' - 'a';
    80206ec8:	3901                	addiw	s2,s2,-32
    80206eca:	0ff97913          	andi	s2,s2,255
    80206ece:	bf7d                	j	80206e8c <emake+0x238>
    while (i < CHAR_SHORT_NAME) {
    80206ed0:	47a9                	li	a5,10
    80206ed2:	f097d8e3          	bge	a5,s1,80206de2 <emake+0x18e>
    80206ed6:	b715                	j	80206dfa <emake+0x1a6>
                de.lne.order |= LAST_LONG_ENTRY;
    80206ed8:	0407e793          	ori	a5,a5,64
    80206edc:	f6f40823          	sb	a5,-144(s0)
    80206ee0:	a221                	j	80206fe8 <emake+0x394>
                    if ((*w++ = *p++) == 0) {
    80206ee2:	0005c683          	lbu	a3,0(a1)
    80206ee6:	00d78023          	sb	a3,0(a5)
                        end = 1;
    80206eea:	0016b693          	seqz	a3,a3
                    *w++ = 0;
    80206eee:	000780a3          	sb	zero,1(a5)
    80206ef2:	0789                	addi	a5,a5,2
                    if ((*w++ = *p++) == 0) {
    80206ef4:	0585                	addi	a1,a1,1
    80206ef6:	a04d                	j	80206f98 <emake+0x344>
    80206ef8:	020c8c9b          	addiw	s9,s9,32
    80206efc:	4781                	li	a5,0
    80206efe:	f5043703          	ld	a4,-176(s0)
    80206f02:	00e05663          	blez	a4,80206f0e <emake+0x2ba>
    80206f06:	f4842783          	lw	a5,-184(s0)
    80206f0a:	0057979b          	slliw	a5,a5,0x5
    80206f0e:	01978cbb          	addw	s9,a5,s9
        memset(&de, 0, sizeof(de));
    80206f12:	02000613          	li	a2,32
    80206f16:	4581                	li	a1,0
    80206f18:	f7040493          	addi	s1,s0,-144
    80206f1c:	8526                	mv	a0,s1
    80206f1e:	ffffa097          	auipc	ra,0xffffa
    80206f22:	846080e7          	jalr	-1978(ra) # 80200764 <memset>
        strncpy(de.sne.name, shortname, sizeof(de.sne.name));
    80206f26:	462d                	li	a2,11
    80206f28:	f6040593          	addi	a1,s0,-160
    80206f2c:	8526                	mv	a0,s1
    80206f2e:	ffffa097          	auipc	ra,0xffffa
    80206f32:	94e080e7          	jalr	-1714(ra) # 8020087c <strncpy>
        de.sne.attr = ep->attribute;
    80206f36:	100d4783          	lbu	a5,256(s10)
    80206f3a:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);      // first clus high 16 bits
    80206f3e:	104d2783          	lw	a5,260(s10)
    80206f42:	0107d71b          	srliw	a4,a5,0x10
    80206f46:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);     // low 16 bits
    80206f4a:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = ep->file_size;                         // filesize is updated in eupdate()
    80206f4e:	108d2783          	lw	a5,264(s10)
    80206f52:	f8f42623          	sw	a5,-116(s0)
        off = reloc_clus(dp, off, 1);
    80206f56:	4605                	li	a2,1
    80206f58:	85e6                	mv	a1,s9
    80206f5a:	855a                	mv	a0,s6
    80206f5c:	fffff097          	auipc	ra,0xfffff
    80206f60:	406080e7          	jalr	1030(ra) # 80206362 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206f64:	02000793          	li	a5,32
    80206f68:	0005071b          	sext.w	a4,a0
    80206f6c:	86a6                	mv	a3,s1
    80206f6e:	4601                	li	a2,0
    80206f70:	4585                	li	a1,1
    80206f72:	10cb2503          	lw	a0,268(s6)
    80206f76:	fffff097          	auipc	ra,0xfffff
    80206f7a:	4f6080e7          	jalr	1270(ra) # 8020646c <rw_clus>
}
    80206f7e:	b341                	j	80206cfe <emake+0xaa>
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80206f80:	87d6                	mv	a5,s5
    80206f82:	a011                	j	80206f86 <emake+0x332>
                switch (j) {
    80206f84:	87ce                	mv	a5,s3
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206f86:	2705                	addiw	a4,a4,1
    80206f88:	fff7061b          	addiw	a2,a4,-1
                if (end) {
    80206f8c:	dab9                	beqz	a3,80206ee2 <emake+0x28e>
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    80206f8e:	01278023          	sb	s2,0(a5)
                    *w++ = 0xff;
    80206f92:	012780a3          	sb	s2,1(a5)
    80206f96:	0789                	addi	a5,a5,2
                switch (j) {
    80206f98:	fea604e3          	beq	a2,a0,80206f80 <emake+0x32c>
    80206f9c:	fe9604e3          	beq	a2,s1,80206f84 <emake+0x330>
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206fa0:	0007061b          	sext.w	a2,a4
    80206fa4:	fec851e3          	bge	a6,a2,80206f86 <emake+0x332>
            uint off2 = reloc_clus(dp, off, 1);
    80206fa8:	4605                	li	a2,1
    80206faa:	85e2                	mv	a1,s8
    80206fac:	855a                	mv	a0,s6
    80206fae:	fffff097          	auipc	ra,0xfffff
    80206fb2:	3b4080e7          	jalr	948(ra) # 80206362 <reloc_clus>
            rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off2, sizeof(de));
    80206fb6:	02000793          	li	a5,32
    80206fba:	0005071b          	sext.w	a4,a0
    80206fbe:	f7040693          	addi	a3,s0,-144
    80206fc2:	4601                	li	a2,0
    80206fc4:	4585                	li	a1,1
    80206fc6:	10cb2503          	lw	a0,268(s6)
    80206fca:	fffff097          	auipc	ra,0xfffff
    80206fce:	4a2080e7          	jalr	1186(ra) # 8020646c <rw_clus>
            off += sizeof(de);
    80206fd2:	020c0c1b          	addiw	s8,s8,32
        for (int i = entcnt; i > 0; i--) {
    80206fd6:	1bcd                	addi	s7,s7,-13
    80206fd8:	f34050e3          	blez	s4,80206ef8 <emake+0x2a4>
            if ((de.lne.order = i) == entcnt) {
    80206fdc:	0ffa7793          	andi	a5,s4,255
    80206fe0:	eefd8ce3          	beq	s11,a5,80206ed8 <emake+0x284>
    80206fe4:	f6f40823          	sb	a5,-144(s0)
            char *p = ep->filename + (i - 1) * CHAR_LONG_NAME;
    80206fe8:	3a7d                	addiw	s4,s4,-1
    80206fea:	85de                	mv	a1,s7
    80206fec:	4709                	li	a4,2
            int end = 0;
    80206fee:	4681                	li	a3,0
            uint8 *w = (uint8 *)de.lne.name1;
    80206ff0:	f5843783          	ld	a5,-168(s0)
                switch (j) {
    80206ff4:	4515                	li	a0,5
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206ff6:	4835                	li	a6,13
    80206ff8:	bf41                	j	80206f88 <emake+0x334>
        if (c == ' ') { continue; }
    80206ffa:	02000793          	li	a5,32
    80206ffe:	eaf91ce3          	bne	s2,a5,80206eb6 <emake+0x262>
    80207002:	bd69                	j	80206e9c <emake+0x248>

0000000080207004 <edup>:
{
    80207004:	1101                	addi	sp,sp,-32
    80207006:	ec06                	sd	ra,24(sp)
    80207008:	e822                	sd	s0,16(sp)
    8020700a:	e426                	sd	s1,8(sp)
    8020700c:	1000                	addi	s0,sp,32
    8020700e:	84aa                	mv	s1,a0
    if (entry != 0) {
    80207010:	c515                	beqz	a0,8020703c <edup+0x38>
        acquire(&ecache.lock);
    80207012:	00025517          	auipc	a0,0x25
    80207016:	90650513          	addi	a0,a0,-1786 # 8022b918 <ecache>
    8020701a:	ffff9097          	auipc	ra,0xffff9
    8020701e:	6ae080e7          	jalr	1710(ra) # 802006c8 <acquire>
        entry->ref++;
    80207022:	1184a783          	lw	a5,280(s1)
    80207026:	2785                	addiw	a5,a5,1
    80207028:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    8020702c:	00025517          	auipc	a0,0x25
    80207030:	8ec50513          	addi	a0,a0,-1812 # 8022b918 <ecache>
    80207034:	ffff9097          	auipc	ra,0xffff9
    80207038:	6e8080e7          	jalr	1768(ra) # 8020071c <release>
}
    8020703c:	8526                	mv	a0,s1
    8020703e:	60e2                	ld	ra,24(sp)
    80207040:	6442                	ld	s0,16(sp)
    80207042:	64a2                	ld	s1,8(sp)
    80207044:	6105                	addi	sp,sp,32
    80207046:	8082                	ret

0000000080207048 <eupdate>:
    if (!entry->dirty || entry->valid != 1) { return; }
    80207048:	11554783          	lbu	a5,277(a0)
    8020704c:	c3e5                	beqz	a5,8020712c <eupdate+0xe4>
{
    8020704e:	711d                	addi	sp,sp,-96
    80207050:	ec86                	sd	ra,88(sp)
    80207052:	e8a2                	sd	s0,80(sp)
    80207054:	e4a6                	sd	s1,72(sp)
    80207056:	e0ca                	sd	s2,64(sp)
    80207058:	fc4e                	sd	s3,56(sp)
    8020705a:	1080                	addi	s0,sp,96
    8020705c:	84aa                	mv	s1,a0
    if (!entry->dirty || entry->valid != 1) { return; }
    8020705e:	11651703          	lh	a4,278(a0)
    80207062:	4785                	li	a5,1
    80207064:	00f70963          	beq	a4,a5,80207076 <eupdate+0x2e>
}
    80207068:	60e6                	ld	ra,88(sp)
    8020706a:	6446                	ld	s0,80(sp)
    8020706c:	64a6                	ld	s1,72(sp)
    8020706e:	6906                	ld	s2,64(sp)
    80207070:	79e2                	ld	s3,56(sp)
    80207072:	6125                	addi	sp,sp,96
    80207074:	8082                	ret
    uint entcnt = 0;
    80207076:	fc042623          	sw	zero,-52(s0)
    uint32 off = reloc_clus(entry->parent, entry->off, 0);
    8020707a:	4601                	li	a2,0
    8020707c:	11c52583          	lw	a1,284(a0)
    80207080:	12053503          	ld	a0,288(a0)
    80207084:	fffff097          	auipc	ra,0xfffff
    80207088:	2de080e7          	jalr	734(ra) # 80206362 <reloc_clus>
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off, 1);
    8020708c:	1204b803          	ld	a6,288(s1)
    80207090:	4785                	li	a5,1
    80207092:	0005071b          	sext.w	a4,a0
    80207096:	fcc40693          	addi	a3,s0,-52
    8020709a:	4601                	li	a2,0
    8020709c:	4581                	li	a1,0
    8020709e:	10c82503          	lw	a0,268(a6)
    802070a2:	fffff097          	auipc	ra,0xfffff
    802070a6:	3ca080e7          	jalr	970(ra) # 8020646c <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    802070aa:	fcc42583          	lw	a1,-52(s0)
    802070ae:	fbf5f593          	andi	a1,a1,-65
    802070b2:	fcb42623          	sw	a1,-52(s0)
    off = reloc_clus(entry->parent, entry->off + (entcnt << 5), 0);
    802070b6:	0055959b          	slliw	a1,a1,0x5
    802070ba:	11c4a783          	lw	a5,284(s1)
    802070be:	4601                	li	a2,0
    802070c0:	9dbd                	addw	a1,a1,a5
    802070c2:	1204b503          	ld	a0,288(s1)
    802070c6:	fffff097          	auipc	ra,0xfffff
    802070ca:	29c080e7          	jalr	668(ra) # 80206362 <reloc_clus>
    802070ce:	0005099b          	sext.w	s3,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64)&de, off, sizeof(de));
    802070d2:	1204b503          	ld	a0,288(s1)
    802070d6:	02000793          	li	a5,32
    802070da:	874e                	mv	a4,s3
    802070dc:	fa840913          	addi	s2,s0,-88
    802070e0:	86ca                	mv	a3,s2
    802070e2:	4601                	li	a2,0
    802070e4:	4581                	li	a1,0
    802070e6:	10c52503          	lw	a0,268(a0)
    802070ea:	fffff097          	auipc	ra,0xfffff
    802070ee:	382080e7          	jalr	898(ra) # 8020646c <rw_clus>
    de.sne.fst_clus_hi = (uint16)(entry->first_clus >> 16);
    802070f2:	1044a783          	lw	a5,260(s1)
    802070f6:	0107d71b          	srliw	a4,a5,0x10
    802070fa:	fae41e23          	sh	a4,-68(s0)
    de.sne.fst_clus_lo = (uint16)(entry->first_clus & 0xffff);
    802070fe:	fcf41123          	sh	a5,-62(s0)
    de.sne.file_size = entry->file_size;
    80207102:	1084a783          	lw	a5,264(s1)
    80207106:	fcf42223          	sw	a5,-60(s0)
    rw_clus(entry->parent->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    8020710a:	1204b503          	ld	a0,288(s1)
    8020710e:	02000793          	li	a5,32
    80207112:	874e                	mv	a4,s3
    80207114:	86ca                	mv	a3,s2
    80207116:	4601                	li	a2,0
    80207118:	4585                	li	a1,1
    8020711a:	10c52503          	lw	a0,268(a0)
    8020711e:	fffff097          	auipc	ra,0xfffff
    80207122:	34e080e7          	jalr	846(ra) # 8020646c <rw_clus>
    entry->dirty = 0;
    80207126:	10048aa3          	sb	zero,277(s1)
    8020712a:	bf3d                	j	80207068 <eupdate+0x20>
    8020712c:	8082                	ret

000000008020712e <eremove>:
    if (entry->valid != 1) { return; }
    8020712e:	11651703          	lh	a4,278(a0)
    80207132:	4785                	li	a5,1
    80207134:	00f70363          	beq	a4,a5,8020713a <eremove+0xc>
    80207138:	8082                	ret
{
    8020713a:	715d                	addi	sp,sp,-80
    8020713c:	e486                	sd	ra,72(sp)
    8020713e:	e0a2                	sd	s0,64(sp)
    80207140:	fc26                	sd	s1,56(sp)
    80207142:	f84a                	sd	s2,48(sp)
    80207144:	f44e                	sd	s3,40(sp)
    80207146:	f052                	sd	s4,32(sp)
    80207148:	ec56                	sd	s5,24(sp)
    8020714a:	0880                	addi	s0,sp,80
    8020714c:	89aa                	mv	s3,a0
    uint entcnt = 0;
    8020714e:	fa042e23          	sw	zero,-68(s0)
    uint32 off = entry->off;
    80207152:	11c52a03          	lw	s4,284(a0)
    uint32 off2 = reloc_clus(entry->parent, off, 0);
    80207156:	4601                	li	a2,0
    80207158:	85d2                	mv	a1,s4
    8020715a:	12053503          	ld	a0,288(a0)
    8020715e:	fffff097          	auipc	ra,0xfffff
    80207162:	204080e7          	jalr	516(ra) # 80206362 <reloc_clus>
    80207166:	0005049b          	sext.w	s1,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off2, 1);
    8020716a:	1209b503          	ld	a0,288(s3)
    8020716e:	4785                	li	a5,1
    80207170:	8726                	mv	a4,s1
    80207172:	fbc40693          	addi	a3,s0,-68
    80207176:	4601                	li	a2,0
    80207178:	4581                	li	a1,0
    8020717a:	10c52503          	lw	a0,268(a0)
    8020717e:	fffff097          	auipc	ra,0xfffff
    80207182:	2ee080e7          	jalr	750(ra) # 8020646c <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    80207186:	fbc42783          	lw	a5,-68(s0)
    8020718a:	fbf7f793          	andi	a5,a5,-65
    8020718e:	faf42e23          	sw	a5,-68(s0)
    uint8 flag = EMPTY_ENTRY;
    80207192:	5795                	li	a5,-27
    80207194:	faf40da3          	sb	a5,-69(s0)
    for (int i = 0; i <= entcnt; i++) {
    80207198:	4901                	li	s2,0
        rw_clus(entry->parent->cur_clus, 1, 0, (uint64) &flag, off2, 1);
    8020719a:	fbb40a93          	addi	s5,s0,-69
    8020719e:	1209b503          	ld	a0,288(s3)
    802071a2:	4785                	li	a5,1
    802071a4:	8726                	mv	a4,s1
    802071a6:	86d6                	mv	a3,s5
    802071a8:	4601                	li	a2,0
    802071aa:	4585                	li	a1,1
    802071ac:	10c52503          	lw	a0,268(a0)
    802071b0:	fffff097          	auipc	ra,0xfffff
    802071b4:	2bc080e7          	jalr	700(ra) # 8020646c <rw_clus>
        off += 32;
    802071b8:	020a0a1b          	addiw	s4,s4,32
        off2 = reloc_clus(entry->parent, off, 0);
    802071bc:	4601                	li	a2,0
    802071be:	85d2                	mv	a1,s4
    802071c0:	1209b503          	ld	a0,288(s3)
    802071c4:	fffff097          	auipc	ra,0xfffff
    802071c8:	19e080e7          	jalr	414(ra) # 80206362 <reloc_clus>
    802071cc:	0005049b          	sext.w	s1,a0
    for (int i = 0; i <= entcnt; i++) {
    802071d0:	0019079b          	addiw	a5,s2,1
    802071d4:	0007891b          	sext.w	s2,a5
    802071d8:	fbc42703          	lw	a4,-68(s0)
    802071dc:	fd2771e3          	bgeu	a4,s2,8020719e <eremove+0x70>
    entry->valid = -1;
    802071e0:	57fd                	li	a5,-1
    802071e2:	10f99b23          	sh	a5,278(s3)
}
    802071e6:	60a6                	ld	ra,72(sp)
    802071e8:	6406                	ld	s0,64(sp)
    802071ea:	74e2                	ld	s1,56(sp)
    802071ec:	7942                	ld	s2,48(sp)
    802071ee:	79a2                	ld	s3,40(sp)
    802071f0:	7a02                	ld	s4,32(sp)
    802071f2:	6ae2                	ld	s5,24(sp)
    802071f4:	6161                	addi	sp,sp,80
    802071f6:	8082                	ret

00000000802071f8 <etrunc>:
{
    802071f8:	7179                	addi	sp,sp,-48
    802071fa:	f406                	sd	ra,40(sp)
    802071fc:	f022                	sd	s0,32(sp)
    802071fe:	ec26                	sd	s1,24(sp)
    80207200:	e84a                	sd	s2,16(sp)
    80207202:	e44e                	sd	s3,8(sp)
    80207204:	e052                	sd	s4,0(sp)
    80207206:	1800                	addi	s0,sp,48
    80207208:	8a2a                	mv	s4,a0
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    8020720a:	10452483          	lw	s1,260(a0)
    8020720e:	ffe4871b          	addiw	a4,s1,-2
    80207212:	100007b7          	lui	a5,0x10000
    80207216:	17d5                	addi	a5,a5,-11
    80207218:	02e7e663          	bltu	a5,a4,80207244 <etrunc+0x4c>
    8020721c:	89be                	mv	s3,a5
        uint32 next = read_fat(clus);
    8020721e:	0004891b          	sext.w	s2,s1
    80207222:	8526                	mv	a0,s1
    80207224:	fffff097          	auipc	ra,0xfffff
    80207228:	f0a080e7          	jalr	-246(ra) # 8020612e <read_fat>
    8020722c:	0005049b          	sext.w	s1,a0
    write_fat(cluster, 0);
    80207230:	4581                	li	a1,0
    80207232:	854a                	mv	a0,s2
    80207234:	fffff097          	auipc	ra,0xfffff
    80207238:	0ae080e7          	jalr	174(ra) # 802062e2 <write_fat>
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    8020723c:	ffe4879b          	addiw	a5,s1,-2
    80207240:	fcf9ffe3          	bgeu	s3,a5,8020721e <etrunc+0x26>
    entry->file_size = 0;
    80207244:	100a2423          	sw	zero,264(s4)
    entry->first_clus = 0;
    80207248:	100a2223          	sw	zero,260(s4)
    entry->dirty = 1;
    8020724c:	4785                	li	a5,1
    8020724e:	10fa0aa3          	sb	a5,277(s4)
}
    80207252:	70a2                	ld	ra,40(sp)
    80207254:	7402                	ld	s0,32(sp)
    80207256:	64e2                	ld	s1,24(sp)
    80207258:	6942                	ld	s2,16(sp)
    8020725a:	69a2                	ld	s3,8(sp)
    8020725c:	6a02                	ld	s4,0(sp)
    8020725e:	6145                	addi	sp,sp,48
    80207260:	8082                	ret

0000000080207262 <elock>:
{
    80207262:	1141                	addi	sp,sp,-16
    80207264:	e406                	sd	ra,8(sp)
    80207266:	e022                	sd	s0,0(sp)
    80207268:	0800                	addi	s0,sp,16
    if (entry == 0 || entry->ref < 1)
    8020726a:	cd19                	beqz	a0,80207288 <elock+0x26>
    8020726c:	11852783          	lw	a5,280(a0)
    80207270:	00f05c63          	blez	a5,80207288 <elock+0x26>
    acquiresleep(&entry->lock);
    80207274:	13850513          	addi	a0,a0,312
    80207278:	ffffd097          	auipc	ra,0xffffd
    8020727c:	a58080e7          	jalr	-1448(ra) # 80203cd0 <acquiresleep>
}
    80207280:	60a2                	ld	ra,8(sp)
    80207282:	6402                	ld	s0,0(sp)
    80207284:	0141                	addi	sp,sp,16
    80207286:	8082                	ret
        panic("elock");
    80207288:	00004517          	auipc	a0,0x4
    8020728c:	b4050513          	addi	a0,a0,-1216 # 8020adc8 <digits+0xa48>
    80207290:	ffff9097          	auipc	ra,0xffff9
    80207294:	eb2080e7          	jalr	-334(ra) # 80200142 <panic>

0000000080207298 <eunlock>:
{
    80207298:	1101                	addi	sp,sp,-32
    8020729a:	ec06                	sd	ra,24(sp)
    8020729c:	e822                	sd	s0,16(sp)
    8020729e:	e426                	sd	s1,8(sp)
    802072a0:	e04a                	sd	s2,0(sp)
    802072a2:	1000                	addi	s0,sp,32
    if (entry == 0 || !holdingsleep(&entry->lock) || entry->ref < 1)
    802072a4:	c90d                	beqz	a0,802072d6 <eunlock+0x3e>
    802072a6:	84aa                	mv	s1,a0
    802072a8:	13850913          	addi	s2,a0,312
    802072ac:	854a                	mv	a0,s2
    802072ae:	ffffd097          	auipc	ra,0xffffd
    802072b2:	abc080e7          	jalr	-1348(ra) # 80203d6a <holdingsleep>
    802072b6:	c105                	beqz	a0,802072d6 <eunlock+0x3e>
    802072b8:	1184a783          	lw	a5,280(s1)
    802072bc:	00f05d63          	blez	a5,802072d6 <eunlock+0x3e>
    releasesleep(&entry->lock);
    802072c0:	854a                	mv	a0,s2
    802072c2:	ffffd097          	auipc	ra,0xffffd
    802072c6:	a64080e7          	jalr	-1436(ra) # 80203d26 <releasesleep>
}
    802072ca:	60e2                	ld	ra,24(sp)
    802072cc:	6442                	ld	s0,16(sp)
    802072ce:	64a2                	ld	s1,8(sp)
    802072d0:	6902                	ld	s2,0(sp)
    802072d2:	6105                	addi	sp,sp,32
    802072d4:	8082                	ret
        panic("eunlock");
    802072d6:	00004517          	auipc	a0,0x4
    802072da:	afa50513          	addi	a0,a0,-1286 # 8020add0 <digits+0xa50>
    802072de:	ffff9097          	auipc	ra,0xffff9
    802072e2:	e64080e7          	jalr	-412(ra) # 80200142 <panic>

00000000802072e6 <eput>:
{
    802072e6:	1101                	addi	sp,sp,-32
    802072e8:	ec06                	sd	ra,24(sp)
    802072ea:	e822                	sd	s0,16(sp)
    802072ec:	e426                	sd	s1,8(sp)
    802072ee:	e04a                	sd	s2,0(sp)
    802072f0:	1000                	addi	s0,sp,32
    802072f2:	84aa                	mv	s1,a0
    acquire(&ecache.lock);
    802072f4:	00024517          	auipc	a0,0x24
    802072f8:	62450513          	addi	a0,a0,1572 # 8022b918 <ecache>
    802072fc:	ffff9097          	auipc	ra,0xffff9
    80207300:	3cc080e7          	jalr	972(ra) # 802006c8 <acquire>
    if (entry != &root && entry->valid != 0 && entry->ref == 1) {
    80207304:	00024797          	auipc	a5,0x24
    80207308:	4ac78793          	addi	a5,a5,1196 # 8022b7b0 <root>
    8020730c:	00f48a63          	beq	s1,a5,80207320 <eput+0x3a>
    80207310:	11649783          	lh	a5,278(s1)
    80207314:	c791                	beqz	a5,80207320 <eput+0x3a>
    80207316:	1184a703          	lw	a4,280(s1)
    8020731a:	4785                	li	a5,1
    8020731c:	02f70563          	beq	a4,a5,80207346 <eput+0x60>
    entry->ref--;
    80207320:	1184a783          	lw	a5,280(s1)
    80207324:	37fd                	addiw	a5,a5,-1
    80207326:	10f4ac23          	sw	a5,280(s1)
    release(&ecache.lock);
    8020732a:	00024517          	auipc	a0,0x24
    8020732e:	5ee50513          	addi	a0,a0,1518 # 8022b918 <ecache>
    80207332:	ffff9097          	auipc	ra,0xffff9
    80207336:	3ea080e7          	jalr	1002(ra) # 8020071c <release>
}
    8020733a:	60e2                	ld	ra,24(sp)
    8020733c:	6442                	ld	s0,16(sp)
    8020733e:	64a2                	ld	s1,8(sp)
    80207340:	6902                	ld	s2,0(sp)
    80207342:	6105                	addi	sp,sp,32
    80207344:	8082                	ret
        acquiresleep(&entry->lock);
    80207346:	13848913          	addi	s2,s1,312
    8020734a:	854a                	mv	a0,s2
    8020734c:	ffffd097          	auipc	ra,0xffffd
    80207350:	984080e7          	jalr	-1660(ra) # 80203cd0 <acquiresleep>
        entry->next->prev = entry->prev;
    80207354:	1284b703          	ld	a4,296(s1)
    80207358:	1304b783          	ld	a5,304(s1)
    8020735c:	12f73823          	sd	a5,304(a4)
        entry->prev->next = entry->next;
    80207360:	1284b703          	ld	a4,296(s1)
    80207364:	12e7b423          	sd	a4,296(a5)
        entry->next = root.next;
    80207368:	00024797          	auipc	a5,0x24
    8020736c:	42078793          	addi	a5,a5,1056 # 8022b788 <fat>
    80207370:	1507b703          	ld	a4,336(a5)
    80207374:	12e4b423          	sd	a4,296(s1)
        entry->prev = &root;
    80207378:	00024697          	auipc	a3,0x24
    8020737c:	43868693          	addi	a3,a3,1080 # 8022b7b0 <root>
    80207380:	12d4b823          	sd	a3,304(s1)
        root.next->prev = entry;
    80207384:	12973823          	sd	s1,304(a4)
        root.next = entry;
    80207388:	1497b823          	sd	s1,336(a5)
        release(&ecache.lock);
    8020738c:	00024517          	auipc	a0,0x24
    80207390:	58c50513          	addi	a0,a0,1420 # 8022b918 <ecache>
    80207394:	ffff9097          	auipc	ra,0xffff9
    80207398:	388080e7          	jalr	904(ra) # 8020071c <release>
        if (entry->valid == -1) {       // this means some one has called eremove()
    8020739c:	11649703          	lh	a4,278(s1)
    802073a0:	57fd                	li	a5,-1
    802073a2:	06f70863          	beq	a4,a5,80207412 <eput+0x12c>
            elock(entry->parent);
    802073a6:	1204b503          	ld	a0,288(s1)
    802073aa:	00000097          	auipc	ra,0x0
    802073ae:	eb8080e7          	jalr	-328(ra) # 80207262 <elock>
            eupdate(entry);
    802073b2:	8526                	mv	a0,s1
    802073b4:	00000097          	auipc	ra,0x0
    802073b8:	c94080e7          	jalr	-876(ra) # 80207048 <eupdate>
            eunlock(entry->parent);
    802073bc:	1204b503          	ld	a0,288(s1)
    802073c0:	00000097          	auipc	ra,0x0
    802073c4:	ed8080e7          	jalr	-296(ra) # 80207298 <eunlock>
        releasesleep(&entry->lock);
    802073c8:	854a                	mv	a0,s2
    802073ca:	ffffd097          	auipc	ra,0xffffd
    802073ce:	95c080e7          	jalr	-1700(ra) # 80203d26 <releasesleep>
        struct dirent *eparent = entry->parent;
    802073d2:	1204b903          	ld	s2,288(s1)
        acquire(&ecache.lock);
    802073d6:	00024517          	auipc	a0,0x24
    802073da:	54250513          	addi	a0,a0,1346 # 8022b918 <ecache>
    802073de:	ffff9097          	auipc	ra,0xffff9
    802073e2:	2ea080e7          	jalr	746(ra) # 802006c8 <acquire>
        entry->ref--;
    802073e6:	1184a783          	lw	a5,280(s1)
    802073ea:	37fd                	addiw	a5,a5,-1
    802073ec:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    802073f0:	00024517          	auipc	a0,0x24
    802073f4:	52850513          	addi	a0,a0,1320 # 8022b918 <ecache>
    802073f8:	ffff9097          	auipc	ra,0xffff9
    802073fc:	324080e7          	jalr	804(ra) # 8020071c <release>
        if (entry->ref == 0) {
    80207400:	1184a783          	lw	a5,280(s1)
    80207404:	fb9d                	bnez	a5,8020733a <eput+0x54>
            eput(eparent);
    80207406:	854a                	mv	a0,s2
    80207408:	00000097          	auipc	ra,0x0
    8020740c:	ede080e7          	jalr	-290(ra) # 802072e6 <eput>
    80207410:	b72d                	j	8020733a <eput+0x54>
            etrunc(entry);
    80207412:	8526                	mv	a0,s1
    80207414:	00000097          	auipc	ra,0x0
    80207418:	de4080e7          	jalr	-540(ra) # 802071f8 <etrunc>
    8020741c:	b775                	j	802073c8 <eput+0xe2>

000000008020741e <estat>:
{
    8020741e:	1101                	addi	sp,sp,-32
    80207420:	ec06                	sd	ra,24(sp)
    80207422:	e822                	sd	s0,16(sp)
    80207424:	e426                	sd	s1,8(sp)
    80207426:	e04a                	sd	s2,0(sp)
    80207428:	1000                	addi	s0,sp,32
    8020742a:	892a                	mv	s2,a0
    8020742c:	84ae                	mv	s1,a1
    strncpy(st->name, de->filename, STAT_MAX_NAME);
    8020742e:	02000613          	li	a2,32
    80207432:	85aa                	mv	a1,a0
    80207434:	8526                	mv	a0,s1
    80207436:	ffff9097          	auipc	ra,0xffff9
    8020743a:	446080e7          	jalr	1094(ra) # 8020087c <strncpy>
    st->type = (de->attribute & ATTR_DIRECTORY) ? T_DIR : T_FILE;
    8020743e:	10094783          	lbu	a5,256(s2)
    80207442:	8bc1                	andi	a5,a5,16
    80207444:	0017b793          	seqz	a5,a5
    80207448:	0785                	addi	a5,a5,1
    8020744a:	02f49423          	sh	a5,40(s1)
    st->dev = de->dev;
    8020744e:	11494783          	lbu	a5,276(s2)
    80207452:	d0dc                	sw	a5,36(s1)
    st->size = de->file_size;
    80207454:	10896783          	lwu	a5,264(s2)
    80207458:	f89c                	sd	a5,48(s1)
}
    8020745a:	60e2                	ld	ra,24(sp)
    8020745c:	6442                	ld	s0,16(sp)
    8020745e:	64a2                	ld	s1,8(sp)
    80207460:	6902                	ld	s2,0(sp)
    80207462:	6105                	addi	sp,sp,32
    80207464:	8082                	ret

0000000080207466 <enext>:
 * @return  -1      meet the end of dir
 *          0       find empty slots
 *          1       find a file with all its entries
 */
int enext(struct dirent *dp, struct dirent *ep, uint off, int *count)
{
    80207466:	7119                	addi	sp,sp,-128
    80207468:	fc86                	sd	ra,120(sp)
    8020746a:	f8a2                	sd	s0,112(sp)
    8020746c:	f4a6                	sd	s1,104(sp)
    8020746e:	f0ca                	sd	s2,96(sp)
    80207470:	ecce                	sd	s3,88(sp)
    80207472:	e8d2                	sd	s4,80(sp)
    80207474:	e4d6                	sd	s5,72(sp)
    80207476:	e0da                	sd	s6,64(sp)
    80207478:	fc5e                	sd	s7,56(sp)
    8020747a:	f862                	sd	s8,48(sp)
    8020747c:	f466                	sd	s9,40(sp)
    8020747e:	f06a                	sd	s10,32(sp)
    80207480:	0100                	addi	s0,sp,128
    if (!(dp->attribute & ATTR_DIRECTORY))
    80207482:	10054783          	lbu	a5,256(a0)
    80207486:	8bc1                	andi	a5,a5,16
    80207488:	cf9d                	beqz	a5,802074c6 <enext+0x60>
    8020748a:	892a                	mv	s2,a0
    8020748c:	8aae                	mv	s5,a1
    8020748e:	84b2                	mv	s1,a2
    80207490:	8a36                	mv	s4,a3
        panic("enext not dir");
    if (ep->valid)
    80207492:	11659783          	lh	a5,278(a1)
    80207496:	e3a1                	bnez	a5,802074d6 <enext+0x70>
        panic("enext ep valid");
    if (off % 32)
    80207498:	01f67793          	andi	a5,a2,31
    8020749c:	e7a9                	bnez	a5,802074e6 <enext+0x80>
        panic("enext not align");
    if (dp->valid != 1) { return -1; }
    8020749e:	11651703          	lh	a4,278(a0)
    802074a2:	4785                	li	a5,1
    802074a4:	557d                	li	a0,-1
    802074a6:	04f70863          	beq	a4,a5,802074f6 <enext+0x90>
            read_entry_info(ep, &de);
            return 1;
        }
    }
    return -1;
}
    802074aa:	70e6                	ld	ra,120(sp)
    802074ac:	7446                	ld	s0,112(sp)
    802074ae:	74a6                	ld	s1,104(sp)
    802074b0:	7906                	ld	s2,96(sp)
    802074b2:	69e6                	ld	s3,88(sp)
    802074b4:	6a46                	ld	s4,80(sp)
    802074b6:	6aa6                	ld	s5,72(sp)
    802074b8:	6b06                	ld	s6,64(sp)
    802074ba:	7be2                	ld	s7,56(sp)
    802074bc:	7c42                	ld	s8,48(sp)
    802074be:	7ca2                	ld	s9,40(sp)
    802074c0:	7d02                	ld	s10,32(sp)
    802074c2:	6109                	addi	sp,sp,128
    802074c4:	8082                	ret
        panic("enext not dir");
    802074c6:	00004517          	auipc	a0,0x4
    802074ca:	91250513          	addi	a0,a0,-1774 # 8020add8 <digits+0xa58>
    802074ce:	ffff9097          	auipc	ra,0xffff9
    802074d2:	c74080e7          	jalr	-908(ra) # 80200142 <panic>
        panic("enext ep valid");
    802074d6:	00004517          	auipc	a0,0x4
    802074da:	91250513          	addi	a0,a0,-1774 # 8020ade8 <digits+0xa68>
    802074de:	ffff9097          	auipc	ra,0xffff9
    802074e2:	c64080e7          	jalr	-924(ra) # 80200142 <panic>
        panic("enext not align");
    802074e6:	00004517          	auipc	a0,0x4
    802074ea:	91250513          	addi	a0,a0,-1774 # 8020adf8 <digits+0xa78>
    802074ee:	ffff9097          	auipc	ra,0xffff9
    802074f2:	c54080e7          	jalr	-940(ra) # 80200142 <panic>
    memset(ep->filename, 0, FAT32_MAX_FILENAME + 1);
    802074f6:	8d2e                	mv	s10,a1
    802074f8:	10000613          	li	a2,256
    802074fc:	4581                	li	a1,0
    802074fe:	8556                	mv	a0,s5
    80207500:	ffff9097          	auipc	ra,0xffff9
    80207504:	264080e7          	jalr	612(ra) # 80200764 <memset>
    int cnt = 0;
    80207508:	4b01                	li	s6,0
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    8020750a:	5bfd                	li	s7,-1
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    8020750c:	f8040993          	addi	s3,s0,-128
        if (de.lne.order == EMPTY_ENTRY) {
    80207510:	0e500c13          	li	s8,229
        if (de.lne.attr == ATTR_LONG_NAME) {
    80207514:	4cbd                	li	s9,15
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80207516:	a03d                	j	80207544 <enext+0xde>
            cnt++;
    80207518:	2b05                	addiw	s6,s6,1
            continue;
    8020751a:	a01d                	j	80207540 <enext+0xda>
            *count = cnt;
    8020751c:	016a2023          	sw	s6,0(s4)
            return 0;
    80207520:	4501                	li	a0,0
    80207522:	b761                	j	802074aa <enext+0x44>
            read_entry_name(ep->filename + (lcnt - 1) * CHAR_LONG_NAME, &de);
    80207524:	fff5079b          	addiw	a5,a0,-1
    80207528:	0017951b          	slliw	a0,a5,0x1
    8020752c:	9d3d                	addw	a0,a0,a5
    8020752e:	0025151b          	slliw	a0,a0,0x2
    80207532:	9d3d                	addw	a0,a0,a5
    80207534:	85ce                	mv	a1,s3
    80207536:	956a                	add	a0,a0,s10
    80207538:	fffff097          	auipc	ra,0xfffff
    8020753c:	18e080e7          	jalr	398(ra) # 802066c6 <read_entry_name>
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80207540:	0204849b          	addiw	s1,s1,32
    80207544:	4601                	li	a2,0
    80207546:	85a6                	mv	a1,s1
    80207548:	854a                	mv	a0,s2
    8020754a:	fffff097          	auipc	ra,0xfffff
    8020754e:	e18080e7          	jalr	-488(ra) # 80206362 <reloc_clus>
    80207552:	f5750ce3          	beq	a0,s7,802074aa <enext+0x44>
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    80207556:	02000793          	li	a5,32
    8020755a:	0005071b          	sext.w	a4,a0
    8020755e:	86ce                	mv	a3,s3
    80207560:	4601                	li	a2,0
    80207562:	4581                	li	a1,0
    80207564:	10c92503          	lw	a0,268(s2)
    80207568:	fffff097          	auipc	ra,0xfffff
    8020756c:	f04080e7          	jalr	-252(ra) # 8020646c <rw_clus>
    80207570:	2501                	sext.w	a0,a0
    80207572:	02000793          	li	a5,32
    80207576:	06f51c63          	bne	a0,a5,802075ee <enext+0x188>
    8020757a:	f8044783          	lbu	a5,-128(s0)
    8020757e:	cbb5                	beqz	a5,802075f2 <enext+0x18c>
        if (de.lne.order == EMPTY_ENTRY) {
    80207580:	f9878ce3          	beq	a5,s8,80207518 <enext+0xb2>
        } else if (cnt) {
    80207584:	f80b1ce3          	bnez	s6,8020751c <enext+0xb6>
        if (de.lne.attr == ATTR_LONG_NAME) {
    80207588:	f8b44703          	lbu	a4,-117(s0)
    8020758c:	01971d63          	bne	a4,s9,802075a6 <enext+0x140>
            int lcnt = de.lne.order & ~LAST_LONG_ENTRY;
    80207590:	0bf7f513          	andi	a0,a5,191
            if (de.lne.order & LAST_LONG_ENTRY) {
    80207594:	0407f793          	andi	a5,a5,64
    80207598:	d7d1                	beqz	a5,80207524 <enext+0xbe>
                *count = lcnt + 1;                              // plus the s-n-e;
    8020759a:	0015079b          	addiw	a5,a0,1
    8020759e:	00fa2023          	sw	a5,0(s4)
                count = 0;
    802075a2:	4a01                	li	s4,0
    802075a4:	b741                	j	80207524 <enext+0xbe>
            if (count) {
    802075a6:	000a0c63          	beqz	s4,802075be <enext+0x158>
                *count = 1;
    802075aa:	4785                	li	a5,1
    802075ac:	00fa2023          	sw	a5,0(s4)
                read_entry_name(ep->filename, &de);
    802075b0:	f8040593          	addi	a1,s0,-128
    802075b4:	8556                	mv	a0,s5
    802075b6:	fffff097          	auipc	ra,0xfffff
    802075ba:	110080e7          	jalr	272(ra) # 802066c6 <read_entry_name>
    entry->attribute = d->sne.attr;
    802075be:	f8b44783          	lbu	a5,-117(s0)
    802075c2:	10fa8023          	sb	a5,256(s5)
    entry->first_clus = ((uint32)d->sne.fst_clus_hi << 16) | d->sne.fst_clus_lo;
    802075c6:	f9445783          	lhu	a5,-108(s0)
    802075ca:	0107979b          	slliw	a5,a5,0x10
    802075ce:	f9a45703          	lhu	a4,-102(s0)
    802075d2:	8fd9                	or	a5,a5,a4
    802075d4:	2781                	sext.w	a5,a5
    802075d6:	10faa223          	sw	a5,260(s5)
    entry->file_size = d->sne.file_size;
    802075da:	f9c42703          	lw	a4,-100(s0)
    802075de:	10eaa423          	sw	a4,264(s5)
    entry->cur_clus = entry->first_clus;
    802075e2:	10faa623          	sw	a5,268(s5)
    entry->clus_cnt = 0;
    802075e6:	100aa823          	sw	zero,272(s5)
            return 1;
    802075ea:	4505                	li	a0,1
}
    802075ec:	bd7d                	j	802074aa <enext+0x44>
            return -1;
    802075ee:	557d                	li	a0,-1
    802075f0:	bd6d                	j	802074aa <enext+0x44>
    802075f2:	557d                	li	a0,-1
    802075f4:	bd5d                	j	802074aa <enext+0x44>

00000000802075f6 <dirlookup>:
 * @param   dp          entry of a directory file
 * @param   filename    target filename
 * @param   poff        offset of proper empty entry slots from the beginning of the dir
 */
struct dirent *dirlookup(struct dirent *dp, char *filename, uint *poff)
{
    802075f6:	711d                	addi	sp,sp,-96
    802075f8:	ec86                	sd	ra,88(sp)
    802075fa:	e8a2                	sd	s0,80(sp)
    802075fc:	e4a6                	sd	s1,72(sp)
    802075fe:	e0ca                	sd	s2,64(sp)
    80207600:	fc4e                	sd	s3,56(sp)
    80207602:	f852                	sd	s4,48(sp)
    80207604:	f456                	sd	s5,40(sp)
    80207606:	f05a                	sd	s6,32(sp)
    80207608:	ec5e                	sd	s7,24(sp)
    8020760a:	1080                	addi	s0,sp,96
    if (!(dp->attribute & ATTR_DIRECTORY))
    8020760c:	10054783          	lbu	a5,256(a0)
    80207610:	8bc1                	andi	a5,a5,16
    80207612:	cbb1                	beqz	a5,80207666 <dirlookup+0x70>
    80207614:	84aa                	mv	s1,a0
    80207616:	89ae                	mv	s3,a1
    80207618:	8ab2                	mv	s5,a2
        panic("dirlookup not DIR");
    if (strncmp(filename, ".", FAT32_MAX_FILENAME) == 0) {
    8020761a:	0ff00613          	li	a2,255
    8020761e:	00004597          	auipc	a1,0x4
    80207622:	80258593          	addi	a1,a1,-2046 # 8020ae20 <digits+0xaa0>
    80207626:	854e                	mv	a0,s3
    80207628:	ffff9097          	auipc	ra,0xffff9
    8020762c:	218080e7          	jalr	536(ra) # 80200840 <strncmp>
    80207630:	c139                	beqz	a0,80207676 <dirlookup+0x80>
        return edup(dp);
    } else if (strncmp(filename, "..", FAT32_MAX_FILENAME) == 0) {
    80207632:	0ff00613          	li	a2,255
    80207636:	00003597          	auipc	a1,0x3
    8020763a:	7f258593          	addi	a1,a1,2034 # 8020ae28 <digits+0xaa8>
    8020763e:	854e                	mv	a0,s3
    80207640:	ffff9097          	auipc	ra,0xffff9
    80207644:	200080e7          	jalr	512(ra) # 80200840 <strncmp>
    80207648:	e125                	bnez	a0,802076a8 <dirlookup+0xb2>
        if (dp == &root) {
    8020764a:	00024797          	auipc	a5,0x24
    8020764e:	16678793          	addi	a5,a5,358 # 8022b7b0 <root>
    80207652:	04f48463          	beq	s1,a5,8020769a <dirlookup+0xa4>
            return edup(&root);
        }
        return edup(dp->parent);
    80207656:	1204b503          	ld	a0,288(s1)
    8020765a:	00000097          	auipc	ra,0x0
    8020765e:	9aa080e7          	jalr	-1622(ra) # 80207004 <edup>
    80207662:	892a                	mv	s2,a0
    80207664:	a839                	j	80207682 <dirlookup+0x8c>
        panic("dirlookup not DIR");
    80207666:	00003517          	auipc	a0,0x3
    8020766a:	7a250513          	addi	a0,a0,1954 # 8020ae08 <digits+0xa88>
    8020766e:	ffff9097          	auipc	ra,0xffff9
    80207672:	ad4080e7          	jalr	-1324(ra) # 80200142 <panic>
        return edup(dp);
    80207676:	8526                	mv	a0,s1
    80207678:	00000097          	auipc	ra,0x0
    8020767c:	98c080e7          	jalr	-1652(ra) # 80207004 <edup>
    80207680:	892a                	mv	s2,a0
    if (poff) {
        *poff = off;
    }
    eput(ep);
    return NULL;
}
    80207682:	854a                	mv	a0,s2
    80207684:	60e6                	ld	ra,88(sp)
    80207686:	6446                	ld	s0,80(sp)
    80207688:	64a6                	ld	s1,72(sp)
    8020768a:	6906                	ld	s2,64(sp)
    8020768c:	79e2                	ld	s3,56(sp)
    8020768e:	7a42                	ld	s4,48(sp)
    80207690:	7aa2                	ld	s5,40(sp)
    80207692:	7b02                	ld	s6,32(sp)
    80207694:	6be2                	ld	s7,24(sp)
    80207696:	6125                	addi	sp,sp,96
    80207698:	8082                	ret
            return edup(&root);
    8020769a:	853e                	mv	a0,a5
    8020769c:	00000097          	auipc	ra,0x0
    802076a0:	968080e7          	jalr	-1688(ra) # 80207004 <edup>
    802076a4:	892a                	mv	s2,a0
    802076a6:	bff1                	j	80207682 <dirlookup+0x8c>
    if (dp->valid != 1) {
    802076a8:	11649703          	lh	a4,278(s1)
    802076ac:	4785                	li	a5,1
        return NULL;
    802076ae:	4901                	li	s2,0
    if (dp->valid != 1) {
    802076b0:	fcf719e3          	bne	a4,a5,80207682 <dirlookup+0x8c>
    struct dirent *ep = eget(dp, filename);
    802076b4:	85ce                	mv	a1,s3
    802076b6:	8526                	mv	a0,s1
    802076b8:	fffff097          	auipc	ra,0xfffff
    802076bc:	f00080e7          	jalr	-256(ra) # 802065b8 <eget>
    802076c0:	892a                	mv	s2,a0
    if (ep->valid == 1) { return ep; }                               // ecache hits
    802076c2:	11651703          	lh	a4,278(a0)
    802076c6:	4785                	li	a5,1
    802076c8:	faf70de3          	beq	a4,a5,80207682 <dirlookup+0x8c>
    int len = strlen(filename);
    802076cc:	854e                	mv	a0,s3
    802076ce:	ffff9097          	auipc	ra,0xffff9
    802076d2:	21e080e7          	jalr	542(ra) # 802008ec <strlen>
    int count = 0;
    802076d6:	fa042623          	sw	zero,-84(s0)
    reloc_clus(dp, 0, 0);
    802076da:	4601                	li	a2,0
    802076dc:	4581                	li	a1,0
    802076de:	8526                	mv	a0,s1
    802076e0:	fffff097          	auipc	ra,0xfffff
    802076e4:	c82080e7          	jalr	-894(ra) # 80206362 <reloc_clus>
    uint off = 0;
    802076e8:	4a01                	li	s4,0
    while ((type = enext(dp, ep, off, &count) != -1)) {
    802076ea:	fac40b93          	addi	s7,s0,-84
    802076ee:	5b7d                	li	s6,-1
    802076f0:	86de                	mv	a3,s7
    802076f2:	8652                	mv	a2,s4
    802076f4:	85ca                	mv	a1,s2
    802076f6:	8526                	mv	a0,s1
    802076f8:	00000097          	auipc	ra,0x0
    802076fc:	d6e080e7          	jalr	-658(ra) # 80207466 <enext>
    80207700:	03650f63          	beq	a0,s6,8020773e <dirlookup+0x148>
        } else if (strncmp(filename, ep->filename, FAT32_MAX_FILENAME) == 0) {
    80207704:	0ff00613          	li	a2,255
    80207708:	85ca                	mv	a1,s2
    8020770a:	854e                	mv	a0,s3
    8020770c:	ffff9097          	auipc	ra,0xffff9
    80207710:	134080e7          	jalr	308(ra) # 80200840 <strncmp>
    80207714:	c901                	beqz	a0,80207724 <dirlookup+0x12e>
        off += count << 5;
    80207716:	fac42783          	lw	a5,-84(s0)
    8020771a:	0057979b          	slliw	a5,a5,0x5
    8020771e:	01478a3b          	addw	s4,a5,s4
    80207722:	b7f9                	j	802076f0 <dirlookup+0xfa>
            ep->parent = edup(dp);
    80207724:	8526                	mv	a0,s1
    80207726:	00000097          	auipc	ra,0x0
    8020772a:	8de080e7          	jalr	-1826(ra) # 80207004 <edup>
    8020772e:	12a93023          	sd	a0,288(s2)
            ep->off = off;
    80207732:	11492e23          	sw	s4,284(s2)
            ep->valid = 1;
    80207736:	4785                	li	a5,1
    80207738:	10f91b23          	sh	a5,278(s2)
            return ep;
    8020773c:	b799                	j	80207682 <dirlookup+0x8c>
    if (poff) {
    8020773e:	000a8463          	beqz	s5,80207746 <dirlookup+0x150>
        *poff = off;
    80207742:	014aa023          	sw	s4,0(s5)
    eput(ep);
    80207746:	854a                	mv	a0,s2
    80207748:	00000097          	auipc	ra,0x0
    8020774c:	b9e080e7          	jalr	-1122(ra) # 802072e6 <eput>
    return NULL;
    80207750:	4901                	li	s2,0
    80207752:	bf05                	j	80207682 <dirlookup+0x8c>

0000000080207754 <ealloc>:
{
    80207754:	7139                	addi	sp,sp,-64
    80207756:	fc06                	sd	ra,56(sp)
    80207758:	f822                	sd	s0,48(sp)
    8020775a:	f426                	sd	s1,40(sp)
    8020775c:	f04a                	sd	s2,32(sp)
    8020775e:	ec4e                	sd	s3,24(sp)
    80207760:	e852                	sd	s4,16(sp)
    80207762:	0080                	addi	s0,sp,64
    80207764:	892a                	mv	s2,a0
    if (!(dp->attribute & ATTR_DIRECTORY)) {
    80207766:	10054783          	lbu	a5,256(a0)
    8020776a:	8bc1                	andi	a5,a5,16
    8020776c:	c7a9                	beqz	a5,802077b6 <ealloc+0x62>
    8020776e:	852e                	mv	a0,a1
    80207770:	8a32                	mv	s4,a2
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    80207772:	11691703          	lh	a4,278(s2)
    80207776:	4785                	li	a5,1
        return NULL;
    80207778:	4481                	li	s1,0
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    8020777a:	02f71563          	bne	a4,a5,802077a4 <ealloc+0x50>
    8020777e:	fffff097          	auipc	ra,0xfffff
    80207782:	41e080e7          	jalr	1054(ra) # 80206b9c <formatname>
    80207786:	89aa                	mv	s3,a0
    80207788:	10050663          	beqz	a0,80207894 <ealloc+0x140>
    uint off = 0;
    8020778c:	fc042623          	sw	zero,-52(s0)
    if ((ep = dirlookup(dp, name, &off)) != 0) {      // entry exists
    80207790:	fcc40613          	addi	a2,s0,-52
    80207794:	85aa                	mv	a1,a0
    80207796:	854a                	mv	a0,s2
    80207798:	00000097          	auipc	ra,0x0
    8020779c:	e5e080e7          	jalr	-418(ra) # 802075f6 <dirlookup>
    802077a0:	84aa                	mv	s1,a0
    802077a2:	c115                	beqz	a0,802077c6 <ealloc+0x72>
}
    802077a4:	8526                	mv	a0,s1
    802077a6:	70e2                	ld	ra,56(sp)
    802077a8:	7442                	ld	s0,48(sp)
    802077aa:	74a2                	ld	s1,40(sp)
    802077ac:	7902                	ld	s2,32(sp)
    802077ae:	69e2                	ld	s3,24(sp)
    802077b0:	6a42                	ld	s4,16(sp)
    802077b2:	6121                	addi	sp,sp,64
    802077b4:	8082                	ret
        panic("ealloc not dir");
    802077b6:	00003517          	auipc	a0,0x3
    802077ba:	67a50513          	addi	a0,a0,1658 # 8020ae30 <digits+0xab0>
    802077be:	ffff9097          	auipc	ra,0xffff9
    802077c2:	984080e7          	jalr	-1660(ra) # 80200142 <panic>
    ep = eget(dp, name);
    802077c6:	85ce                	mv	a1,s3
    802077c8:	854a                	mv	a0,s2
    802077ca:	fffff097          	auipc	ra,0xfffff
    802077ce:	dee080e7          	jalr	-530(ra) # 802065b8 <eget>
    802077d2:	84aa                	mv	s1,a0
    elock(ep);
    802077d4:	00000097          	auipc	ra,0x0
    802077d8:	a8e080e7          	jalr	-1394(ra) # 80207262 <elock>
    ep->attribute = attr;
    802077dc:	11448023          	sb	s4,256(s1)
    ep->file_size = 0;
    802077e0:	1004a423          	sw	zero,264(s1)
    ep->first_clus = 0;
    802077e4:	1004a223          	sw	zero,260(s1)
    ep->parent = edup(dp);
    802077e8:	854a                	mv	a0,s2
    802077ea:	00000097          	auipc	ra,0x0
    802077ee:	81a080e7          	jalr	-2022(ra) # 80207004 <edup>
    802077f2:	12a4b023          	sd	a0,288(s1)
    ep->off = off;
    802077f6:	fcc42783          	lw	a5,-52(s0)
    802077fa:	10f4ae23          	sw	a5,284(s1)
    ep->clus_cnt = 0;
    802077fe:	1004a823          	sw	zero,272(s1)
    ep->cur_clus = 0;
    80207802:	1004a623          	sw	zero,268(s1)
    ep->dirty = 0;
    80207806:	10048aa3          	sb	zero,277(s1)
    strncpy(ep->filename, name, FAT32_MAX_FILENAME);
    8020780a:	0ff00613          	li	a2,255
    8020780e:	85ce                	mv	a1,s3
    80207810:	8526                	mv	a0,s1
    80207812:	ffff9097          	auipc	ra,0xffff9
    80207816:	06a080e7          	jalr	106(ra) # 8020087c <strncpy>
    ep->filename[FAT32_MAX_FILENAME] = '\0';
    8020781a:	0e048fa3          	sb	zero,255(s1)
    if (attr == ATTR_DIRECTORY) {    // generate "." and ".." for ep
    8020781e:	47c1                	li	a5,16
    80207820:	02fa0963          	beq	s4,a5,80207852 <ealloc+0xfe>
        ep->attribute |= ATTR_ARCHIVE;
    80207824:	1004c783          	lbu	a5,256(s1)
    80207828:	0207e793          	ori	a5,a5,32
    8020782c:	10f48023          	sb	a5,256(s1)
    emake(dp, ep, off);
    80207830:	fcc42603          	lw	a2,-52(s0)
    80207834:	85a6                	mv	a1,s1
    80207836:	854a                	mv	a0,s2
    80207838:	fffff097          	auipc	ra,0xfffff
    8020783c:	41c080e7          	jalr	1052(ra) # 80206c54 <emake>
    ep->valid = 1;
    80207840:	4785                	li	a5,1
    80207842:	10f49b23          	sh	a5,278(s1)
    eunlock(ep);
    80207846:	8526                	mv	a0,s1
    80207848:	00000097          	auipc	ra,0x0
    8020784c:	a50080e7          	jalr	-1456(ra) # 80207298 <eunlock>
    return ep;
    80207850:	bf91                	j	802077a4 <ealloc+0x50>
        ep->attribute |= ATTR_DIRECTORY;
    80207852:	1004c783          	lbu	a5,256(s1)
    80207856:	0107e793          	ori	a5,a5,16
    8020785a:	10f48023          	sb	a5,256(s1)
        ep->cur_clus = ep->first_clus = alloc_clus(dp->dev);
    8020785e:	11494503          	lbu	a0,276(s2)
    80207862:	fffff097          	auipc	ra,0xfffff
    80207866:	940080e7          	jalr	-1728(ra) # 802061a2 <alloc_clus>
    8020786a:	2501                	sext.w	a0,a0
    8020786c:	10a4a223          	sw	a0,260(s1)
    80207870:	10a4a623          	sw	a0,268(s1)
        emake(ep, ep, 0);
    80207874:	4601                	li	a2,0
    80207876:	85a6                	mv	a1,s1
    80207878:	8526                	mv	a0,s1
    8020787a:	fffff097          	auipc	ra,0xfffff
    8020787e:	3da080e7          	jalr	986(ra) # 80206c54 <emake>
        emake(ep, dp, 32);
    80207882:	02000613          	li	a2,32
    80207886:	85ca                	mv	a1,s2
    80207888:	8526                	mv	a0,s1
    8020788a:	fffff097          	auipc	ra,0xfffff
    8020788e:	3ca080e7          	jalr	970(ra) # 80206c54 <emake>
    80207892:	bf79                	j	80207830 <ealloc+0xdc>
        return NULL;
    80207894:	84aa                	mv	s1,a0
    80207896:	b739                	j	802077a4 <ealloc+0x50>

0000000080207898 <lookup_path>:
    return path;
}

// FAT32 version of namex in xv6's original file system.
static struct dirent *lookup_path(char *path, int parent, char *name)
{
    80207898:	715d                	addi	sp,sp,-80
    8020789a:	e486                	sd	ra,72(sp)
    8020789c:	e0a2                	sd	s0,64(sp)
    8020789e:	fc26                	sd	s1,56(sp)
    802078a0:	f84a                	sd	s2,48(sp)
    802078a2:	f44e                	sd	s3,40(sp)
    802078a4:	f052                	sd	s4,32(sp)
    802078a6:	ec56                	sd	s5,24(sp)
    802078a8:	e85a                	sd	s6,16(sp)
    802078aa:	e45e                	sd	s7,8(sp)
    802078ac:	e062                	sd	s8,0(sp)
    802078ae:	0880                	addi	s0,sp,80
    802078b0:	892a                	mv	s2,a0
    802078b2:	8b2e                	mv	s6,a1
    802078b4:	8ab2                	mv	s5,a2
    struct dirent *entry, *next;
    if (*path == '/') {
    802078b6:	00054783          	lbu	a5,0(a0)
    802078ba:	02f00713          	li	a4,47
    802078be:	02e78663          	beq	a5,a4,802078ea <lookup_path+0x52>
        entry = edup(&root);
    } else if (*path != '\0') {
        entry = edup(myproc()->cwd);
    } else {
        return NULL;
    802078c2:	4981                	li	s3,0
    } else if (*path != '\0') {
    802078c4:	cba1                	beqz	a5,80207914 <lookup_path+0x7c>
        entry = edup(myproc()->cwd);
    802078c6:	ffffa097          	auipc	ra,0xffffa
    802078ca:	192080e7          	jalr	402(ra) # 80201a58 <myproc>
    802078ce:	4d853503          	ld	a0,1240(a0)
    802078d2:	fffff097          	auipc	ra,0xfffff
    802078d6:	732080e7          	jalr	1842(ra) # 80207004 <edup>
    802078da:	89aa                	mv	s3,a0
    while (*path == '/') {
    802078dc:	02f00a13          	li	s4,47
    802078e0:	0ff00b93          	li	s7,255
    802078e4:	0ff00c13          	li	s8,255
    802078e8:	a0dd                	j	802079ce <lookup_path+0x136>
        entry = edup(&root);
    802078ea:	00024517          	auipc	a0,0x24
    802078ee:	ec650513          	addi	a0,a0,-314 # 8022b7b0 <root>
    802078f2:	fffff097          	auipc	ra,0xfffff
    802078f6:	712080e7          	jalr	1810(ra) # 80207004 <edup>
    802078fa:	89aa                	mv	s3,a0
    802078fc:	b7c5                	j	802078dc <lookup_path+0x44>
    }
    while ((path = skipelem(path, name)) != 0) {
        elock(entry);
        if (!(entry->attribute & ATTR_DIRECTORY)) {
            eunlock(entry);
    802078fe:	854e                	mv	a0,s3
    80207900:	00000097          	auipc	ra,0x0
    80207904:	998080e7          	jalr	-1640(ra) # 80207298 <eunlock>
            eput(entry);
    80207908:	854e                	mv	a0,s3
    8020790a:	00000097          	auipc	ra,0x0
    8020790e:	9dc080e7          	jalr	-1572(ra) # 802072e6 <eput>
            return NULL;
    80207912:	4981                	li	s3,0
    if (parent) {
        eput(entry);
        return NULL;
    }
    return entry;
}
    80207914:	854e                	mv	a0,s3
    80207916:	60a6                	ld	ra,72(sp)
    80207918:	6406                	ld	s0,64(sp)
    8020791a:	74e2                	ld	s1,56(sp)
    8020791c:	7942                	ld	s2,48(sp)
    8020791e:	79a2                	ld	s3,40(sp)
    80207920:	7a02                	ld	s4,32(sp)
    80207922:	6ae2                	ld	s5,24(sp)
    80207924:	6b42                	ld	s6,16(sp)
    80207926:	6ba2                	ld	s7,8(sp)
    80207928:	6c02                	ld	s8,0(sp)
    8020792a:	6161                	addi	sp,sp,80
    8020792c:	8082                	ret
            eunlock(entry);
    8020792e:	854e                	mv	a0,s3
    80207930:	00000097          	auipc	ra,0x0
    80207934:	968080e7          	jalr	-1688(ra) # 80207298 <eunlock>
            return entry;
    80207938:	bff1                	j	80207914 <lookup_path+0x7c>
            eunlock(entry);
    8020793a:	854e                	mv	a0,s3
    8020793c:	00000097          	auipc	ra,0x0
    80207940:	95c080e7          	jalr	-1700(ra) # 80207298 <eunlock>
            eput(entry);
    80207944:	854e                	mv	a0,s3
    80207946:	00000097          	auipc	ra,0x0
    8020794a:	9a0080e7          	jalr	-1632(ra) # 802072e6 <eput>
            return NULL;
    8020794e:	89ca                	mv	s3,s2
    80207950:	b7d1                	j	80207914 <lookup_path+0x7c>
    int len = path - s;
    80207952:	412487bb          	subw	a5,s1,s2
    if (len > FAT32_MAX_FILENAME) {
    80207956:	863e                	mv	a2,a5
    80207958:	00fbd363          	bge	s7,a5,8020795e <lookup_path+0xc6>
    8020795c:	8662                	mv	a2,s8
    8020795e:	0006079b          	sext.w	a5,a2
    name[len] = 0;
    80207962:	97d6                	add	a5,a5,s5
    80207964:	00078023          	sb	zero,0(a5)
    memmove(name, s, len);
    80207968:	2601                	sext.w	a2,a2
    8020796a:	85ca                	mv	a1,s2
    8020796c:	8556                	mv	a0,s5
    8020796e:	ffff9097          	auipc	ra,0xffff9
    80207972:	e56080e7          	jalr	-426(ra) # 802007c4 <memmove>
    while (*path == '/') {
    80207976:	0004c783          	lbu	a5,0(s1)
    8020797a:	01479763          	bne	a5,s4,80207988 <lookup_path+0xf0>
        path++;
    8020797e:	0485                	addi	s1,s1,1
    while (*path == '/') {
    80207980:	0004c783          	lbu	a5,0(s1)
    80207984:	ff478de3          	beq	a5,s4,8020797e <lookup_path+0xe6>
        elock(entry);
    80207988:	854e                	mv	a0,s3
    8020798a:	00000097          	auipc	ra,0x0
    8020798e:	8d8080e7          	jalr	-1832(ra) # 80207262 <elock>
        if (!(entry->attribute & ATTR_DIRECTORY)) {
    80207992:	1009c783          	lbu	a5,256(s3)
    80207996:	8bc1                	andi	a5,a5,16
    80207998:	d3bd                	beqz	a5,802078fe <lookup_path+0x66>
        if (parent && *path == '\0') {
    8020799a:	000b0563          	beqz	s6,802079a4 <lookup_path+0x10c>
    8020799e:	0004c783          	lbu	a5,0(s1)
    802079a2:	d7d1                	beqz	a5,8020792e <lookup_path+0x96>
        if ((next = dirlookup(entry, name, 0)) == 0) {
    802079a4:	4601                	li	a2,0
    802079a6:	85d6                	mv	a1,s5
    802079a8:	854e                	mv	a0,s3
    802079aa:	00000097          	auipc	ra,0x0
    802079ae:	c4c080e7          	jalr	-948(ra) # 802075f6 <dirlookup>
    802079b2:	892a                	mv	s2,a0
    802079b4:	d159                	beqz	a0,8020793a <lookup_path+0xa2>
        eunlock(entry);
    802079b6:	854e                	mv	a0,s3
    802079b8:	00000097          	auipc	ra,0x0
    802079bc:	8e0080e7          	jalr	-1824(ra) # 80207298 <eunlock>
        eput(entry);
    802079c0:	854e                	mv	a0,s3
    802079c2:	00000097          	auipc	ra,0x0
    802079c6:	924080e7          	jalr	-1756(ra) # 802072e6 <eput>
        entry = next;
    802079ca:	89ca                	mv	s3,s2
        eput(entry);
    802079cc:	8926                	mv	s2,s1
    while (*path == '/') {
    802079ce:	00094783          	lbu	a5,0(s2)
    802079d2:	03479363          	bne	a5,s4,802079f8 <lookup_path+0x160>
        path++;
    802079d6:	0905                	addi	s2,s2,1
    while (*path == '/') {
    802079d8:	00094783          	lbu	a5,0(s2)
    802079dc:	ff478de3          	beq	a5,s4,802079d6 <lookup_path+0x13e>
    if (*path == 0) { return NULL; }
    802079e0:	cf89                	beqz	a5,802079fa <lookup_path+0x162>
        path++;
    802079e2:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    802079e4:	f74787e3          	beq	a5,s4,80207952 <lookup_path+0xba>
        eput(entry);
    802079e8:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    802079ea:	d7a5                	beqz	a5,80207952 <lookup_path+0xba>
        path++;
    802079ec:	0485                	addi	s1,s1,1
    while (*path != '/' && *path != 0) {
    802079ee:	0004c783          	lbu	a5,0(s1)
    802079f2:	ff479ce3          	bne	a5,s4,802079ea <lookup_path+0x152>
    802079f6:	bfb1                	j	80207952 <lookup_path+0xba>
    if (*path == 0) { return NULL; }
    802079f8:	fbe5                	bnez	a5,802079e8 <lookup_path+0x150>
    if (parent) {
    802079fa:	f00b0de3          	beqz	s6,80207914 <lookup_path+0x7c>
        eput(entry);
    802079fe:	854e                	mv	a0,s3
    80207a00:	00000097          	auipc	ra,0x0
    80207a04:	8e6080e7          	jalr	-1818(ra) # 802072e6 <eput>
        return NULL;
    80207a08:	4981                	li	s3,0
    80207a0a:	b729                	j	80207914 <lookup_path+0x7c>

0000000080207a0c <ename>:

struct dirent *ename(char *path)
{
    80207a0c:	716d                	addi	sp,sp,-272
    80207a0e:	e606                	sd	ra,264(sp)
    80207a10:	e222                	sd	s0,256(sp)
    80207a12:	0a00                	addi	s0,sp,272
    char name[FAT32_MAX_FILENAME + 1];
    return lookup_path(path, 0, name);
    80207a14:	ef040613          	addi	a2,s0,-272
    80207a18:	4581                	li	a1,0
    80207a1a:	00000097          	auipc	ra,0x0
    80207a1e:	e7e080e7          	jalr	-386(ra) # 80207898 <lookup_path>
}
    80207a22:	60b2                	ld	ra,264(sp)
    80207a24:	6412                	ld	s0,256(sp)
    80207a26:	6151                	addi	sp,sp,272
    80207a28:	8082                	ret

0000000080207a2a <enameparent>:

struct dirent *enameparent(char *path, char *name)
{
    80207a2a:	1141                	addi	sp,sp,-16
    80207a2c:	e406                	sd	ra,8(sp)
    80207a2e:	e022                	sd	s0,0(sp)
    80207a30:	0800                	addi	s0,sp,16
    80207a32:	862e                	mv	a2,a1
    return lookup_path(path, 1, name);
    80207a34:	4585                	li	a1,1
    80207a36:	00000097          	auipc	ra,0x0
    80207a3a:	e62080e7          	jalr	-414(ra) # 80207898 <lookup_path>
}
    80207a3e:	60a2                	ld	ra,8(sp)
    80207a40:	6402                	ld	s0,0(sp)
    80207a42:	0141                	addi	sp,sp,16
    80207a44:	8082                	ret

0000000080207a46 <plicinit>:

//
// the riscv Platform Level Interrupt Controller (PLIC).
//

void plicinit(void) {
    80207a46:	1141                	addi	sp,sp,-16
    80207a48:	e422                	sd	s0,8(sp)
    80207a4a:	0800                	addi	s0,sp,16
	writed(1, PLIC_V + DISK_IRQ * sizeof(uint32));
    80207a4c:	00fc37b7          	lui	a5,0xfc3
    80207a50:	07ba                	slli	a5,a5,0xe
    80207a52:	4705                	li	a4,1
    80207a54:	c3d8                	sw	a4,4(a5)
	writed(1, PLIC_V + UART_IRQ * sizeof(uint32));
    80207a56:	d798                	sw	a4,40(a5)

	#ifdef DEBUG 
	printf("plicinit\n");
	#endif 
}
    80207a58:	6422                	ld	s0,8(sp)
    80207a5a:	0141                	addi	sp,sp,16
    80207a5c:	8082                	ret

0000000080207a5e <plicinithart>:

void
plicinithart(void)
{
    80207a5e:	1141                	addi	sp,sp,-16
    80207a60:	e406                	sd	ra,8(sp)
    80207a62:	e022                	sd	s0,0(sp)
    80207a64:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80207a66:	ffffa097          	auipc	ra,0xffffa
    80207a6a:	fc6080e7          	jalr	-58(ra) # 80201a2c <cpuid>
  #ifdef QEMU
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART_IRQ) | (1 << DISK_IRQ);
    80207a6e:	0085171b          	slliw	a4,a0,0x8
    80207a72:	01f867b7          	lui	a5,0x1f86
    80207a76:	0785                	addi	a5,a5,1
    80207a78:	07b6                	slli	a5,a5,0xd
    80207a7a:	97ba                	add	a5,a5,a4
    80207a7c:	40200713          	li	a4,1026
    80207a80:	08e7a023          	sw	a4,128(a5) # 1f86080 <_entry-0x7e279f80>
  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80207a84:	00d5179b          	slliw	a5,a0,0xd
    80207a88:	03f0c537          	lui	a0,0x3f0c
    80207a8c:	20150513          	addi	a0,a0,513 # 3f0c201 <_entry-0x7c2f3dff>
    80207a90:	0532                	slli	a0,a0,0xc
    80207a92:	953e                	add	a0,a0,a5
    80207a94:	00052023          	sw	zero,0(a0)
  *(hart0_m_int_enable_hi) = readd(hart0_m_int_enable_hi) | (1 << (UART_IRQ % 32));
  #endif
  #ifdef DEBUG
  printf("plicinithart\n");
  #endif
}
    80207a98:	60a2                	ld	ra,8(sp)
    80207a9a:	6402                	ld	s0,0(sp)
    80207a9c:	0141                	addi	sp,sp,16
    80207a9e:	8082                	ret

0000000080207aa0 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80207aa0:	1141                	addi	sp,sp,-16
    80207aa2:	e406                	sd	ra,8(sp)
    80207aa4:	e022                	sd	s0,0(sp)
    80207aa6:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80207aa8:	ffffa097          	auipc	ra,0xffffa
    80207aac:	f84080e7          	jalr	-124(ra) # 80201a2c <cpuid>
  int irq;
  #ifndef QEMU
  irq = *(uint32*)PLIC_MCLAIM(hart);
  #else
  irq = *(uint32*)PLIC_SCLAIM(hart);
    80207ab0:	00d5179b          	slliw	a5,a0,0xd
    80207ab4:	03f0c537          	lui	a0,0x3f0c
    80207ab8:	20150513          	addi	a0,a0,513 # 3f0c201 <_entry-0x7c2f3dff>
    80207abc:	0532                	slli	a0,a0,0xc
    80207abe:	953e                	add	a0,a0,a5
  #endif
  return irq;
}
    80207ac0:	4148                	lw	a0,4(a0)
    80207ac2:	60a2                	ld	ra,8(sp)
    80207ac4:	6402                	ld	s0,0(sp)
    80207ac6:	0141                	addi	sp,sp,16
    80207ac8:	8082                	ret

0000000080207aca <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80207aca:	1101                	addi	sp,sp,-32
    80207acc:	ec06                	sd	ra,24(sp)
    80207ace:	e822                	sd	s0,16(sp)
    80207ad0:	e426                	sd	s1,8(sp)
    80207ad2:	1000                	addi	s0,sp,32
    80207ad4:	84aa                	mv	s1,a0
  int hart = cpuid();
    80207ad6:	ffffa097          	auipc	ra,0xffffa
    80207ada:	f56080e7          	jalr	-170(ra) # 80201a2c <cpuid>
  #ifndef QEMU
  *(uint32*)PLIC_MCLAIM(hart) = irq;
  #else
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80207ade:	00d5151b          	slliw	a0,a0,0xd
    80207ae2:	03f0c7b7          	lui	a5,0x3f0c
    80207ae6:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80207aea:	07b2                	slli	a5,a5,0xc
    80207aec:	97aa                	add	a5,a5,a0
    80207aee:	c3c4                	sw	s1,4(a5)
  #endif
}
    80207af0:	60e2                	ld	ra,24(sp)
    80207af2:	6442                	ld	s0,16(sp)
    80207af4:	64a2                	ld	s1,8(sp)
    80207af6:	6105                	addi	sp,sp,32
    80207af8:	8082                	ret

0000000080207afa <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    80207afa:	715d                	addi	sp,sp,-80
    80207afc:	e486                	sd	ra,72(sp)
    80207afe:	e0a2                	sd	s0,64(sp)
    80207b00:	fc26                	sd	s1,56(sp)
    80207b02:	f84a                	sd	s2,48(sp)
    80207b04:	f44e                	sd	s3,40(sp)
    80207b06:	f052                	sd	s4,32(sp)
    80207b08:	ec56                	sd	s5,24(sp)
    80207b0a:	e85a                	sd	s6,16(sp)
    80207b0c:	0880                	addi	s0,sp,80
    80207b0e:	8a2a                	mv	s4,a0
    80207b10:	84ae                	mv	s1,a1
    80207b12:	89b2                	mv	s3,a2
  int i;

  acquire(&cons.lock);
    80207b14:	00028517          	auipc	a0,0x28
    80207b18:	46c50513          	addi	a0,a0,1132 # 8022ff80 <cons>
    80207b1c:	ffff9097          	auipc	ra,0xffff9
    80207b20:	bac080e7          	jalr	-1108(ra) # 802006c8 <acquire>
  for(i = 0; i < n; i++){
    80207b24:	05305f63          	blez	s3,80207b82 <consolewrite+0x88>
    80207b28:	4901                	li	s2,0
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    80207b2a:	fbf40b13          	addi	s6,s0,-65
    80207b2e:	5afd                	li	s5,-1
    80207b30:	4685                	li	a3,1
    80207b32:	8626                	mv	a2,s1
    80207b34:	85d2                	mv	a1,s4
    80207b36:	855a                	mv	a0,s6
    80207b38:	ffffb097          	auipc	ra,0xffffb
    80207b3c:	a0e080e7          	jalr	-1522(ra) # 80202546 <either_copyin>
    80207b40:	01550e63          	beq	a0,s5,80207b5c <consolewrite+0x62>
	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
    80207b44:	fbf44503          	lbu	a0,-65(s0)
    80207b48:	4581                	li	a1,0
    80207b4a:	4601                	li	a2,0
    80207b4c:	4681                	li	a3,0
    80207b4e:	4885                	li	a7,1
    80207b50:	00000073          	ecall
  for(i = 0; i < n; i++){
    80207b54:	2905                	addiw	s2,s2,1
    80207b56:	0485                	addi	s1,s1,1
    80207b58:	fd299ce3          	bne	s3,s2,80207b30 <consolewrite+0x36>
      break;
    sbi_console_putchar(c);
  }
  release(&cons.lock);
    80207b5c:	00028517          	auipc	a0,0x28
    80207b60:	42450513          	addi	a0,a0,1060 # 8022ff80 <cons>
    80207b64:	ffff9097          	auipc	ra,0xffff9
    80207b68:	bb8080e7          	jalr	-1096(ra) # 8020071c <release>

  return i;
}
    80207b6c:	854a                	mv	a0,s2
    80207b6e:	60a6                	ld	ra,72(sp)
    80207b70:	6406                	ld	s0,64(sp)
    80207b72:	74e2                	ld	s1,56(sp)
    80207b74:	7942                	ld	s2,48(sp)
    80207b76:	79a2                	ld	s3,40(sp)
    80207b78:	7a02                	ld	s4,32(sp)
    80207b7a:	6ae2                	ld	s5,24(sp)
    80207b7c:	6b42                	ld	s6,16(sp)
    80207b7e:	6161                	addi	sp,sp,80
    80207b80:	8082                	ret
  for(i = 0; i < n; i++){
    80207b82:	4901                	li	s2,0
    80207b84:	bfe1                	j	80207b5c <consolewrite+0x62>

0000000080207b86 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80207b86:	7175                	addi	sp,sp,-144
    80207b88:	e506                	sd	ra,136(sp)
    80207b8a:	e122                	sd	s0,128(sp)
    80207b8c:	fca6                	sd	s1,120(sp)
    80207b8e:	f8ca                	sd	s2,112(sp)
    80207b90:	f4ce                	sd	s3,104(sp)
    80207b92:	f0d2                	sd	s4,96(sp)
    80207b94:	ecd6                	sd	s5,88(sp)
    80207b96:	e8da                	sd	s6,80(sp)
    80207b98:	e4de                	sd	s7,72(sp)
    80207b9a:	e0e2                	sd	s8,64(sp)
    80207b9c:	fc66                	sd	s9,56(sp)
    80207b9e:	f86a                	sd	s10,48(sp)
    80207ba0:	f46e                	sd	s11,40(sp)
    80207ba2:	0900                	addi	s0,sp,144
    80207ba4:	f6a43c23          	sd	a0,-136(s0)
    80207ba8:	8aae                	mv	s5,a1
    80207baa:	8a32                	mv	s4,a2
  uint target;
  int c;
  char cbuf;

  target = n;
    80207bac:	00060b1b          	sext.w	s6,a2
  acquire(&cons.lock);
    80207bb0:	00028517          	auipc	a0,0x28
    80207bb4:	3d050513          	addi	a0,a0,976 # 8022ff80 <cons>
    80207bb8:	ffff9097          	auipc	ra,0xffff9
    80207bbc:	b10080e7          	jalr	-1264(ra) # 802006c8 <acquire>
  while(n > 0){
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
    80207bc0:	00028497          	auipc	s1,0x28
    80207bc4:	3c048493          	addi	s1,s1,960 # 8022ff80 <cons>
      if(myproc()->killed){
        release(&cons.lock);
        return -1;
      }
      sleep(&cons.r, &cons.lock);
    80207bc8:	89a6                	mv	s3,s1
    80207bca:	00028917          	auipc	s2,0x28
    80207bce:	44e90913          	addi	s2,s2,1102 # 80230018 <cons+0x98>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];

    if(c == C('D')){  // end-of-file
    80207bd2:	4c11                	li	s8,4
      break;
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80207bd4:	f8f40d13          	addi	s10,s0,-113
    80207bd8:	5cfd                	li	s9,-1
      break;

    dst++;
    --n;

    if(c == '\n'){
    80207bda:	4da9                	li	s11,10
  while(n > 0){
    80207bdc:	07405863          	blez	s4,80207c4c <consoleread+0xc6>
    while(cons.r == cons.w){
    80207be0:	0984a783          	lw	a5,152(s1)
    80207be4:	09c4a703          	lw	a4,156(s1)
    80207be8:	02f71463          	bne	a4,a5,80207c10 <consoleread+0x8a>
      if(myproc()->killed){
    80207bec:	ffffa097          	auipc	ra,0xffffa
    80207bf0:	e6c080e7          	jalr	-404(ra) # 80201a58 <myproc>
    80207bf4:	591c                	lw	a5,48(a0)
    80207bf6:	e7b5                	bnez	a5,80207c62 <consoleread+0xdc>
      sleep(&cons.r, &cons.lock);
    80207bf8:	85ce                	mv	a1,s3
    80207bfa:	854a                	mv	a0,s2
    80207bfc:	ffffa097          	auipc	ra,0xffffa
    80207c00:	6b6080e7          	jalr	1718(ra) # 802022b2 <sleep>
    while(cons.r == cons.w){
    80207c04:	0984a783          	lw	a5,152(s1)
    80207c08:	09c4a703          	lw	a4,156(s1)
    80207c0c:	fef700e3          	beq	a4,a5,80207bec <consoleread+0x66>
    c = cons.buf[cons.r++ % INPUT_BUF];
    80207c10:	0017871b          	addiw	a4,a5,1
    80207c14:	08e4ac23          	sw	a4,152(s1)
    80207c18:	07f7f713          	andi	a4,a5,127
    80207c1c:	9726                	add	a4,a4,s1
    80207c1e:	01874703          	lbu	a4,24(a4)
    80207c22:	00070b9b          	sext.w	s7,a4
    if(c == C('D')){  // end-of-file
    80207c26:	078b8663          	beq	s7,s8,80207c92 <consoleread+0x10c>
    cbuf = c;
    80207c2a:	f8e407a3          	sb	a4,-113(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80207c2e:	4685                	li	a3,1
    80207c30:	866a                	mv	a2,s10
    80207c32:	85d6                	mv	a1,s5
    80207c34:	f7843503          	ld	a0,-136(s0)
    80207c38:	ffffb097          	auipc	ra,0xffffb
    80207c3c:	8d8080e7          	jalr	-1832(ra) # 80202510 <either_copyout>
    80207c40:	01950663          	beq	a0,s9,80207c4c <consoleread+0xc6>
    dst++;
    80207c44:	0a85                	addi	s5,s5,1
    --n;
    80207c46:	3a7d                	addiw	s4,s4,-1
    if(c == '\n'){
    80207c48:	f9bb9ae3          	bne	s7,s11,80207bdc <consoleread+0x56>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    }
  }
  release(&cons.lock);
    80207c4c:	00028517          	auipc	a0,0x28
    80207c50:	33450513          	addi	a0,a0,820 # 8022ff80 <cons>
    80207c54:	ffff9097          	auipc	ra,0xffff9
    80207c58:	ac8080e7          	jalr	-1336(ra) # 8020071c <release>

  return target - n;
    80207c5c:	414b053b          	subw	a0,s6,s4
    80207c60:	a811                	j	80207c74 <consoleread+0xee>
        release(&cons.lock);
    80207c62:	00028517          	auipc	a0,0x28
    80207c66:	31e50513          	addi	a0,a0,798 # 8022ff80 <cons>
    80207c6a:	ffff9097          	auipc	ra,0xffff9
    80207c6e:	ab2080e7          	jalr	-1358(ra) # 8020071c <release>
        return -1;
    80207c72:	557d                	li	a0,-1
}
    80207c74:	60aa                	ld	ra,136(sp)
    80207c76:	640a                	ld	s0,128(sp)
    80207c78:	74e6                	ld	s1,120(sp)
    80207c7a:	7946                	ld	s2,112(sp)
    80207c7c:	79a6                	ld	s3,104(sp)
    80207c7e:	7a06                	ld	s4,96(sp)
    80207c80:	6ae6                	ld	s5,88(sp)
    80207c82:	6b46                	ld	s6,80(sp)
    80207c84:	6ba6                	ld	s7,72(sp)
    80207c86:	6c06                	ld	s8,64(sp)
    80207c88:	7ce2                	ld	s9,56(sp)
    80207c8a:	7d42                	ld	s10,48(sp)
    80207c8c:	7da2                	ld	s11,40(sp)
    80207c8e:	6149                	addi	sp,sp,144
    80207c90:	8082                	ret
      if(n < target){
    80207c92:	000a071b          	sext.w	a4,s4
    80207c96:	fb677be3          	bgeu	a4,s6,80207c4c <consoleread+0xc6>
        cons.r--;
    80207c9a:	00028717          	auipc	a4,0x28
    80207c9e:	36f72f23          	sw	a5,894(a4) # 80230018 <cons+0x98>
    80207ca2:	b76d                	j	80207c4c <consoleread+0xc6>

0000000080207ca4 <consputc>:
void consputc(int c) {
    80207ca4:	1141                	addi	sp,sp,-16
    80207ca6:	e422                	sd	s0,8(sp)
    80207ca8:	0800                	addi	s0,sp,16
  if(c == BACKSPACE){
    80207caa:	10000793          	li	a5,256
    80207cae:	00f50b63          	beq	a0,a5,80207cc4 <consputc+0x20>
    80207cb2:	4581                	li	a1,0
    80207cb4:	4601                	li	a2,0
    80207cb6:	4681                	li	a3,0
    80207cb8:	4885                	li	a7,1
    80207cba:	00000073          	ecall
}
    80207cbe:	6422                	ld	s0,8(sp)
    80207cc0:	0141                	addi	sp,sp,16
    80207cc2:	8082                	ret
    80207cc4:	4521                	li	a0,8
    80207cc6:	4581                	li	a1,0
    80207cc8:	4601                	li	a2,0
    80207cca:	4681                	li	a3,0
    80207ccc:	4885                	li	a7,1
    80207cce:	00000073          	ecall
    80207cd2:	02000513          	li	a0,32
    80207cd6:	00000073          	ecall
    80207cda:	4521                	li	a0,8
    80207cdc:	00000073          	ecall
}
    80207ce0:	bff9                	j	80207cbe <consputc+0x1a>

0000000080207ce2 <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    80207ce2:	1101                	addi	sp,sp,-32
    80207ce4:	ec06                	sd	ra,24(sp)
    80207ce6:	e822                	sd	s0,16(sp)
    80207ce8:	e426                	sd	s1,8(sp)
    80207cea:	e04a                	sd	s2,0(sp)
    80207cec:	1000                	addi	s0,sp,32
    80207cee:	84aa                	mv	s1,a0
  acquire(&cons.lock);
    80207cf0:	00028517          	auipc	a0,0x28
    80207cf4:	29050513          	addi	a0,a0,656 # 8022ff80 <cons>
    80207cf8:	ffff9097          	auipc	ra,0xffff9
    80207cfc:	9d0080e7          	jalr	-1584(ra) # 802006c8 <acquire>

  switch(c){
    80207d00:	47d5                	li	a5,21
    80207d02:	0af48663          	beq	s1,a5,80207dae <consoleintr+0xcc>
    80207d06:	0297ca63          	blt	a5,s1,80207d3a <consoleintr+0x58>
    80207d0a:	47a1                	li	a5,8
    80207d0c:	0ef48763          	beq	s1,a5,80207dfa <consoleintr+0x118>
    80207d10:	47c1                	li	a5,16
    80207d12:	10f49a63          	bne	s1,a5,80207e26 <consoleintr+0x144>
  case C('P'):  // Print process list.
    procdump();
    80207d16:	ffffb097          	auipc	ra,0xffffb
    80207d1a:	864080e7          	jalr	-1948(ra) # 8020257a <procdump>
      }
    }
    break;
  }
  
  release(&cons.lock);
    80207d1e:	00028517          	auipc	a0,0x28
    80207d22:	26250513          	addi	a0,a0,610 # 8022ff80 <cons>
    80207d26:	ffff9097          	auipc	ra,0xffff9
    80207d2a:	9f6080e7          	jalr	-1546(ra) # 8020071c <release>
}
    80207d2e:	60e2                	ld	ra,24(sp)
    80207d30:	6442                	ld	s0,16(sp)
    80207d32:	64a2                	ld	s1,8(sp)
    80207d34:	6902                	ld	s2,0(sp)
    80207d36:	6105                	addi	sp,sp,32
    80207d38:	8082                	ret
  switch(c){
    80207d3a:	07f00793          	li	a5,127
    80207d3e:	0af48e63          	beq	s1,a5,80207dfa <consoleintr+0x118>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80207d42:	00028717          	auipc	a4,0x28
    80207d46:	23e70713          	addi	a4,a4,574 # 8022ff80 <cons>
    80207d4a:	0a072783          	lw	a5,160(a4)
    80207d4e:	09872703          	lw	a4,152(a4)
    80207d52:	9f99                	subw	a5,a5,a4
    80207d54:	07f00713          	li	a4,127
    80207d58:	fcf763e3          	bltu	a4,a5,80207d1e <consoleintr+0x3c>
      c = (c == '\r') ? '\n' : c;
    80207d5c:	47b5                	li	a5,13
    80207d5e:	0cf48763          	beq	s1,a5,80207e2c <consoleintr+0x14a>
      consputc(c);
    80207d62:	8526                	mv	a0,s1
    80207d64:	00000097          	auipc	ra,0x0
    80207d68:	f40080e7          	jalr	-192(ra) # 80207ca4 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80207d6c:	00028797          	auipc	a5,0x28
    80207d70:	21478793          	addi	a5,a5,532 # 8022ff80 <cons>
    80207d74:	0a07a703          	lw	a4,160(a5)
    80207d78:	0017069b          	addiw	a3,a4,1
    80207d7c:	0006861b          	sext.w	a2,a3
    80207d80:	0ad7a023          	sw	a3,160(a5)
    80207d84:	07f77713          	andi	a4,a4,127
    80207d88:	97ba                	add	a5,a5,a4
    80207d8a:	00978c23          	sb	s1,24(a5)
      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    80207d8e:	47a9                	li	a5,10
    80207d90:	0cf48563          	beq	s1,a5,80207e5a <consoleintr+0x178>
    80207d94:	4791                	li	a5,4
    80207d96:	0cf48263          	beq	s1,a5,80207e5a <consoleintr+0x178>
    80207d9a:	00028797          	auipc	a5,0x28
    80207d9e:	27e7a783          	lw	a5,638(a5) # 80230018 <cons+0x98>
    80207da2:	0807879b          	addiw	a5,a5,128
    80207da6:	f6f61ce3          	bne	a2,a5,80207d1e <consoleintr+0x3c>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80207daa:	863e                	mv	a2,a5
    80207dac:	a07d                	j	80207e5a <consoleintr+0x178>
    while(cons.e != cons.w &&
    80207dae:	00028717          	auipc	a4,0x28
    80207db2:	1d270713          	addi	a4,a4,466 # 8022ff80 <cons>
    80207db6:	0a072783          	lw	a5,160(a4)
    80207dba:	09c72703          	lw	a4,156(a4)
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    80207dbe:	00028497          	auipc	s1,0x28
    80207dc2:	1c248493          	addi	s1,s1,450 # 8022ff80 <cons>
    while(cons.e != cons.w &&
    80207dc6:	4929                	li	s2,10
    80207dc8:	f4f70be3          	beq	a4,a5,80207d1e <consoleintr+0x3c>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    80207dcc:	37fd                	addiw	a5,a5,-1
    80207dce:	07f7f713          	andi	a4,a5,127
    80207dd2:	9726                	add	a4,a4,s1
    while(cons.e != cons.w &&
    80207dd4:	01874703          	lbu	a4,24(a4)
    80207dd8:	f52703e3          	beq	a4,s2,80207d1e <consoleintr+0x3c>
      cons.e--;
    80207ddc:	0af4a023          	sw	a5,160(s1)
      consputc(BACKSPACE);
    80207de0:	10000513          	li	a0,256
    80207de4:	00000097          	auipc	ra,0x0
    80207de8:	ec0080e7          	jalr	-320(ra) # 80207ca4 <consputc>
    while(cons.e != cons.w &&
    80207dec:	0a04a783          	lw	a5,160(s1)
    80207df0:	09c4a703          	lw	a4,156(s1)
    80207df4:	fcf71ce3          	bne	a4,a5,80207dcc <consoleintr+0xea>
    80207df8:	b71d                	j	80207d1e <consoleintr+0x3c>
    if(cons.e != cons.w){
    80207dfa:	00028717          	auipc	a4,0x28
    80207dfe:	18670713          	addi	a4,a4,390 # 8022ff80 <cons>
    80207e02:	0a072783          	lw	a5,160(a4)
    80207e06:	09c72703          	lw	a4,156(a4)
    80207e0a:	f0f70ae3          	beq	a4,a5,80207d1e <consoleintr+0x3c>
      cons.e--;
    80207e0e:	37fd                	addiw	a5,a5,-1
    80207e10:	00028717          	auipc	a4,0x28
    80207e14:	20f72823          	sw	a5,528(a4) # 80230020 <cons+0xa0>
      consputc(BACKSPACE);
    80207e18:	10000513          	li	a0,256
    80207e1c:	00000097          	auipc	ra,0x0
    80207e20:	e88080e7          	jalr	-376(ra) # 80207ca4 <consputc>
    80207e24:	bded                	j	80207d1e <consoleintr+0x3c>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80207e26:	ee048ce3          	beqz	s1,80207d1e <consoleintr+0x3c>
    80207e2a:	bf21                	j	80207d42 <consoleintr+0x60>
      consputc(c);
    80207e2c:	4529                	li	a0,10
    80207e2e:	00000097          	auipc	ra,0x0
    80207e32:	e76080e7          	jalr	-394(ra) # 80207ca4 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80207e36:	00028797          	auipc	a5,0x28
    80207e3a:	14a78793          	addi	a5,a5,330 # 8022ff80 <cons>
    80207e3e:	0a07a703          	lw	a4,160(a5)
    80207e42:	0017069b          	addiw	a3,a4,1
    80207e46:	0006861b          	sext.w	a2,a3
    80207e4a:	0ad7a023          	sw	a3,160(a5)
    80207e4e:	07f77713          	andi	a4,a4,127
    80207e52:	97ba                	add	a5,a5,a4
    80207e54:	4729                	li	a4,10
    80207e56:	00e78c23          	sb	a4,24(a5)
        cons.w = cons.e;
    80207e5a:	00028797          	auipc	a5,0x28
    80207e5e:	1cc7a123          	sw	a2,450(a5) # 8023001c <cons+0x9c>
        wakeup(&cons.r);
    80207e62:	00028517          	auipc	a0,0x28
    80207e66:	1b650513          	addi	a0,a0,438 # 80230018 <cons+0x98>
    80207e6a:	ffffa097          	auipc	ra,0xffffa
    80207e6e:	5ca080e7          	jalr	1482(ra) # 80202434 <wakeup>
    80207e72:	b575                	j	80207d1e <consoleintr+0x3c>

0000000080207e74 <consoleinit>:

void
consoleinit(void)
{
    80207e74:	1101                	addi	sp,sp,-32
    80207e76:	ec06                	sd	ra,24(sp)
    80207e78:	e822                	sd	s0,16(sp)
    80207e7a:	e426                	sd	s1,8(sp)
    80207e7c:	1000                	addi	s0,sp,32
  initlock(&cons.lock, "cons");
    80207e7e:	00028497          	auipc	s1,0x28
    80207e82:	10248493          	addi	s1,s1,258 # 8022ff80 <cons>
    80207e86:	00003597          	auipc	a1,0x3
    80207e8a:	fba58593          	addi	a1,a1,-70 # 8020ae40 <digits+0xac0>
    80207e8e:	8526                	mv	a0,s1
    80207e90:	ffff8097          	auipc	ra,0xffff8
    80207e94:	7f4080e7          	jalr	2036(ra) # 80200684 <initlock>
  uartinit();
    80207e98:	00000097          	auipc	ra,0x0
    80207e9c:	5bc080e7          	jalr	1468(ra) # 80208454 <uartinit>
  cons.e = cons.w = cons.r = 0;
    80207ea0:	0804ac23          	sw	zero,152(s1)
    80207ea4:	0804ae23          	sw	zero,156(s1)
    80207ea8:	0a04a023          	sw	zero,160(s1)
  
  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    80207eac:	00005797          	auipc	a5,0x5
    80207eb0:	2647b783          	ld	a5,612(a5) # 8020d110 <_GLOBAL_OFFSET_TABLE_+0x60>
    80207eb4:	00000717          	auipc	a4,0x0
    80207eb8:	cd270713          	addi	a4,a4,-814 # 80207b86 <consoleread>
    80207ebc:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    80207ebe:	00000717          	auipc	a4,0x0
    80207ec2:	c3c70713          	addi	a4,a4,-964 # 80207afa <consolewrite>
    80207ec6:	ef98                	sd	a4,24(a5)
}
    80207ec8:	60e2                	ld	ra,24(sp)
    80207eca:	6442                	ld	s0,16(sp)
    80207ecc:	64a2                	ld	s1,8(sp)
    80207ece:	6105                	addi	sp,sp,32
    80207ed0:	8082                	ret

0000000080207ed2 <free_desc>:
}

// mark a descriptor as free.
static void
free_desc(int i)
{
    80207ed2:	1141                	addi	sp,sp,-16
    80207ed4:	e406                	sd	ra,8(sp)
    80207ed6:	e022                	sd	s0,0(sp)
    80207ed8:	0800                	addi	s0,sp,16
  if(i >= NUM)
    80207eda:	479d                	li	a5,7
    80207edc:	04a7cc63          	blt	a5,a0,80207f34 <free_desc+0x62>
    panic("virtio_disk_intr 1");
  if(disk.free[i])
    80207ee0:	00029797          	auipc	a5,0x29
    80207ee4:	12078793          	addi	a5,a5,288 # 80231000 <disk>
    80207ee8:	00a78733          	add	a4,a5,a0
    80207eec:	6789                	lui	a5,0x2
    80207eee:	97ba                	add	a5,a5,a4
    80207ef0:	0187c783          	lbu	a5,24(a5) # 2018 <_entry-0x801fdfe8>
    80207ef4:	eba1                	bnez	a5,80207f44 <free_desc+0x72>
    panic("virtio_disk_intr 2");
  disk.desc[i].addr = 0;
    80207ef6:	00451713          	slli	a4,a0,0x4
    80207efa:	0002b797          	auipc	a5,0x2b
    80207efe:	1067b783          	ld	a5,262(a5) # 80233000 <disk+0x2000>
    80207f02:	97ba                	add	a5,a5,a4
    80207f04:	0007b023          	sd	zero,0(a5)
  disk.free[i] = 1;
    80207f08:	00029797          	auipc	a5,0x29
    80207f0c:	0f878793          	addi	a5,a5,248 # 80231000 <disk>
    80207f10:	97aa                	add	a5,a5,a0
    80207f12:	6509                	lui	a0,0x2
    80207f14:	953e                	add	a0,a0,a5
    80207f16:	4785                	li	a5,1
    80207f18:	00f50c23          	sb	a5,24(a0) # 2018 <_entry-0x801fdfe8>
  wakeup(&disk.free[0]);
    80207f1c:	0002b517          	auipc	a0,0x2b
    80207f20:	0fc50513          	addi	a0,a0,252 # 80233018 <disk+0x2018>
    80207f24:	ffffa097          	auipc	ra,0xffffa
    80207f28:	510080e7          	jalr	1296(ra) # 80202434 <wakeup>
}
    80207f2c:	60a2                	ld	ra,8(sp)
    80207f2e:	6402                	ld	s0,0(sp)
    80207f30:	0141                	addi	sp,sp,16
    80207f32:	8082                	ret
    panic("virtio_disk_intr 1");
    80207f34:	00003517          	auipc	a0,0x3
    80207f38:	f1450513          	addi	a0,a0,-236 # 8020ae48 <digits+0xac8>
    80207f3c:	ffff8097          	auipc	ra,0xffff8
    80207f40:	206080e7          	jalr	518(ra) # 80200142 <panic>
    panic("virtio_disk_intr 2");
    80207f44:	00003517          	auipc	a0,0x3
    80207f48:	f1c50513          	addi	a0,a0,-228 # 8020ae60 <digits+0xae0>
    80207f4c:	ffff8097          	auipc	ra,0xffff8
    80207f50:	1f6080e7          	jalr	502(ra) # 80200142 <panic>

0000000080207f54 <virtio_disk_init>:
{
    80207f54:	1141                	addi	sp,sp,-16
    80207f56:	e406                	sd	ra,8(sp)
    80207f58:	e022                	sd	s0,0(sp)
    80207f5a:	0800                	addi	s0,sp,16
  initlock(&disk.vdisk_lock, "virtio_disk");
    80207f5c:	00003597          	auipc	a1,0x3
    80207f60:	f1c58593          	addi	a1,a1,-228 # 8020ae78 <digits+0xaf8>
    80207f64:	0002b517          	auipc	a0,0x2b
    80207f68:	14450513          	addi	a0,a0,324 # 802330a8 <disk+0x20a8>
    80207f6c:	ffff8097          	auipc	ra,0xffff8
    80207f70:	718080e7          	jalr	1816(ra) # 80200684 <initlock>
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80207f74:	03f107b7          	lui	a5,0x3f10
    80207f78:	0785                	addi	a5,a5,1
    80207f7a:	07b2                	slli	a5,a5,0xc
    80207f7c:	4398                	lw	a4,0(a5)
    80207f7e:	2701                	sext.w	a4,a4
    80207f80:	747277b7          	lui	a5,0x74727
    80207f84:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xbad968a>
    80207f88:	12f71263          	bne	a4,a5,802080ac <virtio_disk_init+0x158>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80207f8c:	00003797          	auipc	a5,0x3
    80207f90:	f747b783          	ld	a5,-140(a5) # 8020af00 <digits+0xb80>
    80207f94:	439c                	lw	a5,0(a5)
    80207f96:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80207f98:	4705                	li	a4,1
    80207f9a:	10e79963          	bne	a5,a4,802080ac <virtio_disk_init+0x158>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80207f9e:	00003797          	auipc	a5,0x3
    80207fa2:	f6a7b783          	ld	a5,-150(a5) # 8020af08 <digits+0xb88>
    80207fa6:	439c                	lw	a5,0(a5)
    80207fa8:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80207faa:	4709                	li	a4,2
    80207fac:	10e79063          	bne	a5,a4,802080ac <virtio_disk_init+0x158>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80207fb0:	00003797          	auipc	a5,0x3
    80207fb4:	f607b783          	ld	a5,-160(a5) # 8020af10 <digits+0xb90>
    80207fb8:	4398                	lw	a4,0(a5)
    80207fba:	2701                	sext.w	a4,a4
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80207fbc:	554d47b7          	lui	a5,0x554d4
    80207fc0:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ad2baaf>
    80207fc4:	0ef71463          	bne	a4,a5,802080ac <virtio_disk_init+0x158>
  *R(VIRTIO_MMIO_STATUS) = status;
    80207fc8:	00003717          	auipc	a4,0x3
    80207fcc:	f5073703          	ld	a4,-176(a4) # 8020af18 <digits+0xb98>
    80207fd0:	4785                	li	a5,1
    80207fd2:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207fd4:	478d                	li	a5,3
    80207fd6:	c31c                	sw	a5,0(a4)
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80207fd8:	00003797          	auipc	a5,0x3
    80207fdc:	f487b783          	ld	a5,-184(a5) # 8020af20 <digits+0xba0>
    80207fe0:	4394                	lw	a3,0(a5)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80207fe2:	c7ffe7b7          	lui	a5,0xc7ffe
    80207fe6:	75f78793          	addi	a5,a5,1887 # ffffffffc7ffe75f <kernel_end+0xffffffff47dc975f>
    80207fea:	8ff5                	and	a5,a5,a3
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80207fec:	2781                	sext.w	a5,a5
    80207fee:	00003697          	auipc	a3,0x3
    80207ff2:	f3a6b683          	ld	a3,-198(a3) # 8020af28 <digits+0xba8>
    80207ff6:	c29c                	sw	a5,0(a3)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207ff8:	47ad                	li	a5,11
    80207ffa:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207ffc:	47bd                	li	a5,15
    80207ffe:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    80208000:	00003797          	auipc	a5,0x3
    80208004:	f307b783          	ld	a5,-208(a5) # 8020af30 <digits+0xbb0>
    80208008:	6705                	lui	a4,0x1
    8020800a:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    8020800c:	00003797          	auipc	a5,0x3
    80208010:	f2c7b783          	ld	a5,-212(a5) # 8020af38 <digits+0xbb8>
    80208014:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    80208018:	00003797          	auipc	a5,0x3
    8020801c:	f287b783          	ld	a5,-216(a5) # 8020af40 <digits+0xbc0>
    80208020:	439c                	lw	a5,0(a5)
    80208022:	2781                	sext.w	a5,a5
  if(max == 0)
    80208024:	cfc1                	beqz	a5,802080bc <virtio_disk_init+0x168>
  if(max < NUM)
    80208026:	471d                	li	a4,7
    80208028:	0af77263          	bgeu	a4,a5,802080cc <virtio_disk_init+0x178>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    8020802c:	00003797          	auipc	a5,0x3
    80208030:	f1c7b783          	ld	a5,-228(a5) # 8020af48 <digits+0xbc8>
    80208034:	4721                	li	a4,8
    80208036:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    80208038:	6609                	lui	a2,0x2
    8020803a:	4581                	li	a1,0
    8020803c:	00029517          	auipc	a0,0x29
    80208040:	fc450513          	addi	a0,a0,-60 # 80231000 <disk>
    80208044:	ffff8097          	auipc	ra,0xffff8
    80208048:	720080e7          	jalr	1824(ra) # 80200764 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    8020804c:	00029717          	auipc	a4,0x29
    80208050:	fb470713          	addi	a4,a4,-76 # 80231000 <disk>
    80208054:	00c75793          	srli	a5,a4,0xc
    80208058:	2781                	sext.w	a5,a5
    8020805a:	00003697          	auipc	a3,0x3
    8020805e:	ef66b683          	ld	a3,-266(a3) # 8020af50 <digits+0xbd0>
    80208062:	c29c                	sw	a5,0(a3)
  disk.desc = (struct VRingDesc *) disk.pages;
    80208064:	0002b797          	auipc	a5,0x2b
    80208068:	f9c78793          	addi	a5,a5,-100 # 80233000 <disk+0x2000>
    8020806c:	e398                	sd	a4,0(a5)
  disk.avail = (uint16*)(((char*)disk.desc) + NUM*sizeof(struct VRingDesc));
    8020806e:	00029717          	auipc	a4,0x29
    80208072:	01270713          	addi	a4,a4,18 # 80231080 <disk+0x80>
    80208076:	e798                	sd	a4,8(a5)
  disk.used = (struct UsedArea *) (disk.pages + PGSIZE);
    80208078:	0002a717          	auipc	a4,0x2a
    8020807c:	f8870713          	addi	a4,a4,-120 # 80232000 <disk+0x1000>
    80208080:	eb98                	sd	a4,16(a5)
    disk.free[i] = 1;
    80208082:	4705                	li	a4,1
    80208084:	00e78c23          	sb	a4,24(a5)
    80208088:	00e78ca3          	sb	a4,25(a5)
    8020808c:	00e78d23          	sb	a4,26(a5)
    80208090:	00e78da3          	sb	a4,27(a5)
    80208094:	00e78e23          	sb	a4,28(a5)
    80208098:	00e78ea3          	sb	a4,29(a5)
    8020809c:	00e78f23          	sb	a4,30(a5)
    802080a0:	00e78fa3          	sb	a4,31(a5)
}
    802080a4:	60a2                	ld	ra,8(sp)
    802080a6:	6402                	ld	s0,0(sp)
    802080a8:	0141                	addi	sp,sp,16
    802080aa:	8082                	ret
    panic("could not find virtio disk");
    802080ac:	00003517          	auipc	a0,0x3
    802080b0:	ddc50513          	addi	a0,a0,-548 # 8020ae88 <digits+0xb08>
    802080b4:	ffff8097          	auipc	ra,0xffff8
    802080b8:	08e080e7          	jalr	142(ra) # 80200142 <panic>
    panic("virtio disk has no queue 0");
    802080bc:	00003517          	auipc	a0,0x3
    802080c0:	dec50513          	addi	a0,a0,-532 # 8020aea8 <digits+0xb28>
    802080c4:	ffff8097          	auipc	ra,0xffff8
    802080c8:	07e080e7          	jalr	126(ra) # 80200142 <panic>
    panic("virtio disk max queue too short");
    802080cc:	00003517          	auipc	a0,0x3
    802080d0:	dfc50513          	addi	a0,a0,-516 # 8020aec8 <digits+0xb48>
    802080d4:	ffff8097          	auipc	ra,0xffff8
    802080d8:	06e080e7          	jalr	110(ra) # 80200142 <panic>

00000000802080dc <virtio_disk_rw>:
  return 0;
}

void
virtio_disk_rw(struct buf *b, int write)
{
    802080dc:	7119                	addi	sp,sp,-128
    802080de:	fc86                	sd	ra,120(sp)
    802080e0:	f8a2                	sd	s0,112(sp)
    802080e2:	f4a6                	sd	s1,104(sp)
    802080e4:	f0ca                	sd	s2,96(sp)
    802080e6:	ecce                	sd	s3,88(sp)
    802080e8:	e8d2                	sd	s4,80(sp)
    802080ea:	e4d6                	sd	s5,72(sp)
    802080ec:	e0da                	sd	s6,64(sp)
    802080ee:	fc5e                	sd	s7,56(sp)
    802080f0:	f862                	sd	s8,48(sp)
    802080f2:	f466                	sd	s9,40(sp)
    802080f4:	f06a                	sd	s10,32(sp)
    802080f6:	0100                	addi	s0,sp,128
    802080f8:	892a                	mv	s2,a0
    802080fa:	8cae                	mv	s9,a1
  uint64 sector = b->sectorno;
    802080fc:	00c56d03          	lwu	s10,12(a0)

  acquire(&disk.vdisk_lock);
    80208100:	0002b517          	auipc	a0,0x2b
    80208104:	fa850513          	addi	a0,a0,-88 # 802330a8 <disk+0x20a8>
    80208108:	ffff8097          	auipc	ra,0xffff8
    8020810c:	5c0080e7          	jalr	1472(ra) # 802006c8 <acquire>
  for(int i = 0; i < 3; i++){
    80208110:	4981                	li	s3,0
  for(int i = 0; i < NUM; i++){
    80208112:	4c21                	li	s8,8
      disk.free[i] = 0;
    80208114:	00029b97          	auipc	s7,0x29
    80208118:	eecb8b93          	addi	s7,s7,-276 # 80231000 <disk>
    8020811c:	6b09                	lui	s6,0x2
  for(int i = 0; i < 3; i++){
    8020811e:	4a8d                	li	s5,3
  for(int i = 0; i < NUM; i++){
    80208120:	8a4e                	mv	s4,s3
    80208122:	a051                	j	802081a6 <virtio_disk_rw+0xca>
      disk.free[i] = 0;
    80208124:	00fb86b3          	add	a3,s7,a5
    80208128:	96da                	add	a3,a3,s6
    8020812a:	00068c23          	sb	zero,24(a3)
    idx[i] = alloc_desc();
    8020812e:	c21c                	sw	a5,0(a2)
    if(idx[i] < 0){
    80208130:	0207c563          	bltz	a5,8020815a <virtio_disk_rw+0x7e>
  for(int i = 0; i < 3; i++){
    80208134:	2485                	addiw	s1,s1,1
    80208136:	0711                	addi	a4,a4,4
    80208138:	25548463          	beq	s1,s5,80208380 <virtio_disk_rw+0x2a4>
    idx[i] = alloc_desc();
    8020813c:	863a                	mv	a2,a4
  for(int i = 0; i < NUM; i++){
    8020813e:	0002b697          	auipc	a3,0x2b
    80208142:	eda68693          	addi	a3,a3,-294 # 80233018 <disk+0x2018>
    80208146:	87d2                	mv	a5,s4
    if(disk.free[i]){
    80208148:	0006c583          	lbu	a1,0(a3)
    8020814c:	fde1                	bnez	a1,80208124 <virtio_disk_rw+0x48>
  for(int i = 0; i < NUM; i++){
    8020814e:	2785                	addiw	a5,a5,1
    80208150:	0685                	addi	a3,a3,1
    80208152:	ff879be3          	bne	a5,s8,80208148 <virtio_disk_rw+0x6c>
    idx[i] = alloc_desc();
    80208156:	57fd                	li	a5,-1
    80208158:	c21c                	sw	a5,0(a2)
      for(int j = 0; j < i; j++)
    8020815a:	02905a63          	blez	s1,8020818e <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    8020815e:	f9042503          	lw	a0,-112(s0)
    80208162:	00000097          	auipc	ra,0x0
    80208166:	d70080e7          	jalr	-656(ra) # 80207ed2 <free_desc>
      for(int j = 0; j < i; j++)
    8020816a:	4785                	li	a5,1
    8020816c:	0297d163          	bge	a5,s1,8020818e <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    80208170:	f9442503          	lw	a0,-108(s0)
    80208174:	00000097          	auipc	ra,0x0
    80208178:	d5e080e7          	jalr	-674(ra) # 80207ed2 <free_desc>
      for(int j = 0; j < i; j++)
    8020817c:	4789                	li	a5,2
    8020817e:	0097d863          	bge	a5,s1,8020818e <virtio_disk_rw+0xb2>
        free_desc(idx[j]);
    80208182:	f9842503          	lw	a0,-104(s0)
    80208186:	00000097          	auipc	ra,0x0
    8020818a:	d4c080e7          	jalr	-692(ra) # 80207ed2 <free_desc>
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    8020818e:	0002b597          	auipc	a1,0x2b
    80208192:	f1a58593          	addi	a1,a1,-230 # 802330a8 <disk+0x20a8>
    80208196:	0002b517          	auipc	a0,0x2b
    8020819a:	e8250513          	addi	a0,a0,-382 # 80233018 <disk+0x2018>
    8020819e:	ffffa097          	auipc	ra,0xffffa
    802081a2:	114080e7          	jalr	276(ra) # 802022b2 <sleep>
  for(int i = 0; i < 3; i++){
    802081a6:	f9040713          	addi	a4,s0,-112
    802081aa:	84ce                	mv	s1,s3
    802081ac:	bf41                	j	8020813c <virtio_disk_rw+0x60>
    uint32 reserved;
    uint64 sector;
  } buf0;

  if(write)
    buf0.type = VIRTIO_BLK_T_OUT; // write the disk
    802081ae:	4785                	li	a5,1
    802081b0:	f8f42023          	sw	a5,-128(s0)
  else
    buf0.type = VIRTIO_BLK_T_IN; // read the disk
  buf0.reserved = 0;
    802081b4:	f8042223          	sw	zero,-124(s0)
  buf0.sector = sector;
    802081b8:	f9a43423          	sd	s10,-120(s0)

  // buf0 is on a kernel stack, which is not direct mapped,
  // thus the call to kvmpa().
  disk.desc[idx[0]].addr = (uint64) kwalkaddr(myproc()->kpagetable, (uint64) &buf0);
    802081bc:	ffffa097          	auipc	ra,0xffffa
    802081c0:	89c080e7          	jalr	-1892(ra) # 80201a58 <myproc>
    802081c4:	f9042983          	lw	s3,-112(s0)
    802081c8:	00499493          	slli	s1,s3,0x4
    802081cc:	0002ba17          	auipc	s4,0x2b
    802081d0:	e34a0a13          	addi	s4,s4,-460 # 80233000 <disk+0x2000>
    802081d4:	000a3a83          	ld	s5,0(s4)
    802081d8:	9aa6                	add	s5,s5,s1
    802081da:	f8040593          	addi	a1,s0,-128
    802081de:	6d28                	ld	a0,88(a0)
    802081e0:	ffff9097          	auipc	ra,0xffff9
    802081e4:	a1e080e7          	jalr	-1506(ra) # 80200bfe <kwalkaddr>
    802081e8:	00aab023          	sd	a0,0(s5)
  disk.desc[idx[0]].len = sizeof(buf0);
    802081ec:	000a3783          	ld	a5,0(s4)
    802081f0:	97a6                	add	a5,a5,s1
    802081f2:	4741                	li	a4,16
    802081f4:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    802081f6:	000a3783          	ld	a5,0(s4)
    802081fa:	97a6                	add	a5,a5,s1
    802081fc:	4705                	li	a4,1
    802081fe:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[0]].next = idx[1];
    80208202:	f9442703          	lw	a4,-108(s0)
    80208206:	000a3783          	ld	a5,0(s4)
    8020820a:	97a6                	add	a5,a5,s1
    8020820c:	00e79723          	sh	a4,14(a5)

  disk.desc[idx[1]].addr = (uint64) b->data;
    80208210:	0712                	slli	a4,a4,0x4
    80208212:	000a3783          	ld	a5,0(s4)
    80208216:	97ba                	add	a5,a5,a4
    80208218:	05890693          	addi	a3,s2,88
    8020821c:	e394                	sd	a3,0(a5)
  disk.desc[idx[1]].len = BSIZE;
    8020821e:	000a3783          	ld	a5,0(s4)
    80208222:	97ba                	add	a5,a5,a4
    80208224:	20000693          	li	a3,512
    80208228:	c794                	sw	a3,8(a5)
  if(write)
    8020822a:	100c8c63          	beqz	s9,80208342 <virtio_disk_rw+0x266>
    disk.desc[idx[1]].flags = 0; // device reads b->data
    8020822e:	0002b797          	auipc	a5,0x2b
    80208232:	dd27b783          	ld	a5,-558(a5) # 80233000 <disk+0x2000>
    80208236:	97ba                	add	a5,a5,a4
    80208238:	00079623          	sh	zero,12(a5)
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    8020823c:	00029517          	auipc	a0,0x29
    80208240:	dc450513          	addi	a0,a0,-572 # 80231000 <disk>
    80208244:	0002b797          	auipc	a5,0x2b
    80208248:	dbc78793          	addi	a5,a5,-580 # 80233000 <disk+0x2000>
    8020824c:	6394                	ld	a3,0(a5)
    8020824e:	96ba                	add	a3,a3,a4
    80208250:	00c6d603          	lhu	a2,12(a3)
    80208254:	00166613          	ori	a2,a2,1
    80208258:	00c69623          	sh	a2,12(a3)
  disk.desc[idx[1]].next = idx[2];
    8020825c:	f9842683          	lw	a3,-104(s0)
    80208260:	6390                	ld	a2,0(a5)
    80208262:	9732                	add	a4,a4,a2
    80208264:	00d71723          	sh	a3,14(a4)

  disk.info[idx[0]].status = 0;
    80208268:	20098613          	addi	a2,s3,512
    8020826c:	0612                	slli	a2,a2,0x4
    8020826e:	962a                	add	a2,a2,a0
    80208270:	02060823          	sb	zero,48(a2) # 2030 <_entry-0x801fdfd0>
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    80208274:	00469713          	slli	a4,a3,0x4
    80208278:	6394                	ld	a3,0(a5)
    8020827a:	96ba                	add	a3,a3,a4
    8020827c:	6589                	lui	a1,0x2
    8020827e:	03058593          	addi	a1,a1,48 # 2030 <_entry-0x801fdfd0>
    80208282:	94ae                	add	s1,s1,a1
    80208284:	94aa                	add	s1,s1,a0
    80208286:	e284                	sd	s1,0(a3)
  disk.desc[idx[2]].len = 1;
    80208288:	6394                	ld	a3,0(a5)
    8020828a:	96ba                	add	a3,a3,a4
    8020828c:	4585                	li	a1,1
    8020828e:	c68c                	sw	a1,8(a3)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80208290:	6394                	ld	a3,0(a5)
    80208292:	96ba                	add	a3,a3,a4
    80208294:	4509                	li	a0,2
    80208296:	00a69623          	sh	a0,12(a3)
  disk.desc[idx[2]].next = 0;
    8020829a:	6394                	ld	a3,0(a5)
    8020829c:	9736                	add	a4,a4,a3
    8020829e:	00071723          	sh	zero,14(a4)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    802082a2:	00b92223          	sw	a1,4(s2)
  disk.info[idx[0]].b = b;
    802082a6:	03263423          	sd	s2,40(a2)

  // avail[0] is flags
  // avail[1] tells the device how far to look in avail[2...].
  // avail[2...] are desc[] indices the device should process.
  // we only tell device the first index in our chain of descriptors.
  disk.avail[2 + (disk.avail[1] % NUM)] = idx[0];
    802082aa:	6794                	ld	a3,8(a5)
    802082ac:	0026d703          	lhu	a4,2(a3)
    802082b0:	8b1d                	andi	a4,a4,7
    802082b2:	2709                	addiw	a4,a4,2
    802082b4:	0706                	slli	a4,a4,0x1
    802082b6:	9736                	add	a4,a4,a3
    802082b8:	01371023          	sh	s3,0(a4)
  __sync_synchronize();
    802082bc:	0ff0000f          	fence
  disk.avail[1] = disk.avail[1] + 1;
    802082c0:	6798                	ld	a4,8(a5)
    802082c2:	00275783          	lhu	a5,2(a4)
    802082c6:	2785                	addiw	a5,a5,1
    802082c8:	00f71123          	sh	a5,2(a4)

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    802082cc:	00003797          	auipc	a5,0x3
    802082d0:	c8c7b783          	ld	a5,-884(a5) # 8020af58 <digits+0xbd8>
    802082d4:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    802082d8:	00492703          	lw	a4,4(s2)
    802082dc:	4785                	li	a5,1
    802082de:	02f71163          	bne	a4,a5,80208300 <virtio_disk_rw+0x224>
    sleep(b, &disk.vdisk_lock);
    802082e2:	0002b997          	auipc	s3,0x2b
    802082e6:	dc698993          	addi	s3,s3,-570 # 802330a8 <disk+0x20a8>
  while(b->disk == 1) {
    802082ea:	4485                	li	s1,1
    sleep(b, &disk.vdisk_lock);
    802082ec:	85ce                	mv	a1,s3
    802082ee:	854a                	mv	a0,s2
    802082f0:	ffffa097          	auipc	ra,0xffffa
    802082f4:	fc2080e7          	jalr	-62(ra) # 802022b2 <sleep>
  while(b->disk == 1) {
    802082f8:	00492783          	lw	a5,4(s2)
    802082fc:	fe9788e3          	beq	a5,s1,802082ec <virtio_disk_rw+0x210>
  }

  disk.info[idx[0]].b = 0;
    80208300:	f9042483          	lw	s1,-112(s0)
    80208304:	20048793          	addi	a5,s1,512
    80208308:	00479713          	slli	a4,a5,0x4
    8020830c:	00029797          	auipc	a5,0x29
    80208310:	cf478793          	addi	a5,a5,-780 # 80231000 <disk>
    80208314:	97ba                	add	a5,a5,a4
    80208316:	0207b423          	sd	zero,40(a5)
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    8020831a:	0002b917          	auipc	s2,0x2b
    8020831e:	ce690913          	addi	s2,s2,-794 # 80233000 <disk+0x2000>
    free_desc(i);
    80208322:	8526                	mv	a0,s1
    80208324:	00000097          	auipc	ra,0x0
    80208328:	bae080e7          	jalr	-1106(ra) # 80207ed2 <free_desc>
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    8020832c:	0492                	slli	s1,s1,0x4
    8020832e:	00093783          	ld	a5,0(s2)
    80208332:	94be                	add	s1,s1,a5
    80208334:	00c4d783          	lhu	a5,12(s1)
    80208338:	8b85                	andi	a5,a5,1
    8020833a:	cf89                	beqz	a5,80208354 <virtio_disk_rw+0x278>
      i = disk.desc[i].next;
    8020833c:	00e4d483          	lhu	s1,14(s1)
    free_desc(i);
    80208340:	b7cd                	j	80208322 <virtio_disk_rw+0x246>
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80208342:	0002b797          	auipc	a5,0x2b
    80208346:	cbe7b783          	ld	a5,-834(a5) # 80233000 <disk+0x2000>
    8020834a:	97ba                	add	a5,a5,a4
    8020834c:	4689                	li	a3,2
    8020834e:	00d79623          	sh	a3,12(a5)
    80208352:	b5ed                	j	8020823c <virtio_disk_rw+0x160>
  free_chain(idx[0]);

  release(&disk.vdisk_lock);
    80208354:	0002b517          	auipc	a0,0x2b
    80208358:	d5450513          	addi	a0,a0,-684 # 802330a8 <disk+0x20a8>
    8020835c:	ffff8097          	auipc	ra,0xffff8
    80208360:	3c0080e7          	jalr	960(ra) # 8020071c <release>
}
    80208364:	70e6                	ld	ra,120(sp)
    80208366:	7446                	ld	s0,112(sp)
    80208368:	74a6                	ld	s1,104(sp)
    8020836a:	7906                	ld	s2,96(sp)
    8020836c:	69e6                	ld	s3,88(sp)
    8020836e:	6a46                	ld	s4,80(sp)
    80208370:	6aa6                	ld	s5,72(sp)
    80208372:	6b06                	ld	s6,64(sp)
    80208374:	7be2                	ld	s7,56(sp)
    80208376:	7c42                	ld	s8,48(sp)
    80208378:	7ca2                	ld	s9,40(sp)
    8020837a:	7d02                	ld	s10,32(sp)
    8020837c:	6109                	addi	sp,sp,128
    8020837e:	8082                	ret
  if(write)
    80208380:	e20c97e3          	bnez	s9,802081ae <virtio_disk_rw+0xd2>
    buf0.type = VIRTIO_BLK_T_IN; // read the disk
    80208384:	f8042023          	sw	zero,-128(s0)
    80208388:	b535                	j	802081b4 <virtio_disk_rw+0xd8>

000000008020838a <virtio_disk_intr>:

void
virtio_disk_intr()
{
    8020838a:	1101                	addi	sp,sp,-32
    8020838c:	ec06                	sd	ra,24(sp)
    8020838e:	e822                	sd	s0,16(sp)
    80208390:	e426                	sd	s1,8(sp)
    80208392:	e04a                	sd	s2,0(sp)
    80208394:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    80208396:	0002b517          	auipc	a0,0x2b
    8020839a:	d1250513          	addi	a0,a0,-750 # 802330a8 <disk+0x20a8>
    8020839e:	ffff8097          	auipc	ra,0xffff8
    802083a2:	32a080e7          	jalr	810(ra) # 802006c8 <acquire>

  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    802083a6:	0002b717          	auipc	a4,0x2b
    802083aa:	c5a70713          	addi	a4,a4,-934 # 80233000 <disk+0x2000>
    802083ae:	02075783          	lhu	a5,32(a4)
    802083b2:	6b18                	ld	a4,16(a4)
    802083b4:	00275683          	lhu	a3,2(a4)
    802083b8:	8ebd                	xor	a3,a3,a5
    802083ba:	8a9d                	andi	a3,a3,7
    802083bc:	cab9                	beqz	a3,80208412 <virtio_disk_intr+0x88>
    int id = disk.used->elems[disk.used_idx].id;

    if(disk.info[id].status != 0)
    802083be:	00029917          	auipc	s2,0x29
    802083c2:	c4290913          	addi	s2,s2,-958 # 80231000 <disk>
      panic("virtio_disk_intr status");
    
    disk.info[id].b->disk = 0;   // disk is done with buf
    wakeup(disk.info[id].b);

    disk.used_idx = (disk.used_idx + 1) % NUM;
    802083c6:	0002b497          	auipc	s1,0x2b
    802083ca:	c3a48493          	addi	s1,s1,-966 # 80233000 <disk+0x2000>
    int id = disk.used->elems[disk.used_idx].id;
    802083ce:	078e                	slli	a5,a5,0x3
    802083d0:	97ba                	add	a5,a5,a4
    802083d2:	43dc                	lw	a5,4(a5)
    if(disk.info[id].status != 0)
    802083d4:	20078713          	addi	a4,a5,512
    802083d8:	0712                	slli	a4,a4,0x4
    802083da:	974a                	add	a4,a4,s2
    802083dc:	03074703          	lbu	a4,48(a4)
    802083e0:	e335                	bnez	a4,80208444 <virtio_disk_intr+0xba>
    disk.info[id].b->disk = 0;   // disk is done with buf
    802083e2:	20078793          	addi	a5,a5,512
    802083e6:	0792                	slli	a5,a5,0x4
    802083e8:	97ca                	add	a5,a5,s2
    802083ea:	7798                	ld	a4,40(a5)
    802083ec:	00072223          	sw	zero,4(a4)
    wakeup(disk.info[id].b);
    802083f0:	7788                	ld	a0,40(a5)
    802083f2:	ffffa097          	auipc	ra,0xffffa
    802083f6:	042080e7          	jalr	66(ra) # 80202434 <wakeup>
    disk.used_idx = (disk.used_idx + 1) % NUM;
    802083fa:	0204d783          	lhu	a5,32(s1)
    802083fe:	2785                	addiw	a5,a5,1
    80208400:	8b9d                	andi	a5,a5,7
    80208402:	02f49023          	sh	a5,32(s1)
  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    80208406:	6898                	ld	a4,16(s1)
    80208408:	00275683          	lhu	a3,2(a4)
    8020840c:	8a9d                	andi	a3,a3,7
    8020840e:	fcf690e3          	bne	a3,a5,802083ce <virtio_disk_intr+0x44>
  }
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    80208412:	00003797          	auipc	a5,0x3
    80208416:	b4e7b783          	ld	a5,-1202(a5) # 8020af60 <digits+0xbe0>
    8020841a:	439c                	lw	a5,0(a5)
    8020841c:	8b8d                	andi	a5,a5,3
    8020841e:	00003717          	auipc	a4,0x3
    80208422:	b4a73703          	ld	a4,-1206(a4) # 8020af68 <digits+0xbe8>
    80208426:	c31c                	sw	a5,0(a4)

  release(&disk.vdisk_lock);
    80208428:	0002b517          	auipc	a0,0x2b
    8020842c:	c8050513          	addi	a0,a0,-896 # 802330a8 <disk+0x20a8>
    80208430:	ffff8097          	auipc	ra,0xffff8
    80208434:	2ec080e7          	jalr	748(ra) # 8020071c <release>
}
    80208438:	60e2                	ld	ra,24(sp)
    8020843a:	6442                	ld	s0,16(sp)
    8020843c:	64a2                	ld	s1,8(sp)
    8020843e:	6902                	ld	s2,0(sp)
    80208440:	6105                	addi	sp,sp,32
    80208442:	8082                	ret
      panic("virtio_disk_intr status");
    80208444:	00003517          	auipc	a0,0x3
    80208448:	aa450513          	addi	a0,a0,-1372 # 8020aee8 <digits+0xb68>
    8020844c:	ffff8097          	auipc	ra,0xffff8
    80208450:	cf6080e7          	jalr	-778(ra) # 80200142 <panic>

0000000080208454 <uartinit>:

void uartstart();

void
uartinit(void)
{
    80208454:	1141                	addi	sp,sp,-16
    80208456:	e406                	sd	ra,8(sp)
    80208458:	e022                	sd	s0,0(sp)
    8020845a:	0800                	addi	s0,sp,16
  // disable interrupts.
  WriteReg(IER, 0x00);
    8020845c:	100007b7          	lui	a5,0x10000
    80208460:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x701fffff>

  // special mode to set baud rate.
  WriteReg(LCR, LCR_BAUD_LATCH);
    80208464:	f8000713          	li	a4,-128
    80208468:	00e781a3          	sb	a4,3(a5)

  // LSB for baud rate of 38.4K.
  WriteReg(0, 0x03);
    8020846c:	470d                	li	a4,3
    8020846e:	00e78023          	sb	a4,0(a5)

  // MSB for baud rate of 38.4K.
  WriteReg(1, 0x00);
    80208472:	000780a3          	sb	zero,1(a5)

  // leave set-baud mode,
  // and set word length to 8 bits, no parity.
  WriteReg(LCR, LCR_EIGHT_BITS);
    80208476:	00e781a3          	sb	a4,3(a5)

  // reset and enable FIFOs.
  WriteReg(FCR, FCR_FIFO_ENABLE | FCR_FIFO_CLEAR);
    8020847a:	469d                	li	a3,7
    8020847c:	00d78123          	sb	a3,2(a5)

  // enable transmit and receive interrupts.
  WriteReg(IER, IER_TX_ENABLE | IER_RX_ENABLE);
    80208480:	00e780a3          	sb	a4,1(a5)

    uart_tx_w = uart_tx_r = 0;
    80208484:	0002c797          	auipc	a5,0x2c
    80208488:	b7c78793          	addi	a5,a5,-1156 # 80234000 <uart_tx_r>
    8020848c:	0007a023          	sw	zero,0(a5)
    80208490:	0007a223          	sw	zero,4(a5)

  initlock(&uart_tx_lock, "uart");
    80208494:	00003597          	auipc	a1,0x3
    80208498:	adc58593          	addi	a1,a1,-1316 # 8020af70 <digits+0xbf0>
    8020849c:	0002c517          	auipc	a0,0x2c
    802084a0:	b6c50513          	addi	a0,a0,-1172 # 80234008 <uart_tx_lock>
    802084a4:	ffff8097          	auipc	ra,0xffff8
    802084a8:	1e0080e7          	jalr	480(ra) # 80200684 <initlock>
}
    802084ac:	60a2                	ld	ra,8(sp)
    802084ae:	6402                	ld	s0,0(sp)
    802084b0:	0141                	addi	sp,sp,16
    802084b2:	8082                	ret

00000000802084b4 <uartputc_sync>:
// use interrupts, for use by kernel printf() and
// to echo characters. it spins waiting for the uart's
// output register to be empty.
void
uartputc_sync(int c)
{
    802084b4:	1101                	addi	sp,sp,-32
    802084b6:	ec06                	sd	ra,24(sp)
    802084b8:	e822                	sd	s0,16(sp)
    802084ba:	e426                	sd	s1,8(sp)
    802084bc:	1000                	addi	s0,sp,32
    802084be:	84aa                	mv	s1,a0
  push_off();
    802084c0:	ffff8097          	auipc	ra,0xffff8
    802084c4:	118080e7          	jalr	280(ra) # 802005d8 <push_off>

  if(panicked){
    802084c8:	00005797          	auipc	a5,0x5
    802084cc:	bf87b783          	ld	a5,-1032(a5) # 8020d0c0 <_GLOBAL_OFFSET_TABLE_+0x10>
    802084d0:	439c                	lw	a5,0(a5)
    802084d2:	2781                	sext.w	a5,a5
    for(;;)
      ;
  }

  // wait for Transmit Holding Empty to be set in LSR.
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    802084d4:	10000737          	lui	a4,0x10000
  if(panicked){
    802084d8:	c391                	beqz	a5,802084dc <uartputc_sync+0x28>
    for(;;)
    802084da:	a001                	j	802084da <uartputc_sync+0x26>
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    802084dc:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x701ffffb>
    802084e0:	0ff7f793          	andi	a5,a5,255
    802084e4:	0207f793          	andi	a5,a5,32
    802084e8:	dbf5                	beqz	a5,802084dc <uartputc_sync+0x28>
    ;
  WriteReg(THR, c);
    802084ea:	0ff4f793          	andi	a5,s1,255
    802084ee:	10000737          	lui	a4,0x10000
    802084f2:	00f70023          	sb	a5,0(a4) # 10000000 <_entry-0x70200000>

  pop_off();
    802084f6:	ffff8097          	auipc	ra,0xffff8
    802084fa:	12e080e7          	jalr	302(ra) # 80200624 <pop_off>
}
    802084fe:	60e2                	ld	ra,24(sp)
    80208500:	6442                	ld	s0,16(sp)
    80208502:	64a2                	ld	s1,8(sp)
    80208504:	6105                	addi	sp,sp,32
    80208506:	8082                	ret

0000000080208508 <uartstart>:
// called from both the top- and bottom-half.
void
uartstart()
{
  while(1){
    if(uart_tx_w == uart_tx_r){
    80208508:	0002c717          	auipc	a4,0x2c
    8020850c:	af870713          	addi	a4,a4,-1288 # 80234000 <uart_tx_r>
    80208510:	431c                	lw	a5,0(a4)
    80208512:	4358                	lw	a4,4(a4)
    80208514:	06f70563          	beq	a4,a5,8020857e <uartstart+0x76>
{
    80208518:	7179                	addi	sp,sp,-48
    8020851a:	f406                	sd	ra,40(sp)
    8020851c:	f022                	sd	s0,32(sp)
    8020851e:	ec26                	sd	s1,24(sp)
    80208520:	e84a                	sd	s2,16(sp)
    80208522:	e44e                	sd	s3,8(sp)
    80208524:	1800                	addi	s0,sp,48
      // transmit buffer is empty.
      return;
    }
    
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    80208526:	10000937          	lui	s2,0x10000
      // so we cannot give it another byte.
      // it will interrupt when it's ready for a new byte.
      return;
    }
    
    int c = uart_tx_buf[uart_tx_r];
    8020852a:	0002c497          	auipc	s1,0x2c
    8020852e:	ad648493          	addi	s1,s1,-1322 # 80234000 <uart_tx_r>
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    80208532:	00594703          	lbu	a4,5(s2) # 10000005 <_entry-0x701ffffb>
    80208536:	0ff77713          	andi	a4,a4,255
    8020853a:	02077713          	andi	a4,a4,32
    8020853e:	cb0d                	beqz	a4,80208570 <uartstart+0x68>
    int c = uart_tx_buf[uart_tx_r];
    80208540:	00f48733          	add	a4,s1,a5
    80208544:	02074983          	lbu	s3,32(a4)
    uart_tx_r = (uart_tx_r + 1) % UART_TX_BUF_SIZE;
    80208548:	2785                	addiw	a5,a5,1
    8020854a:	41f7d71b          	sraiw	a4,a5,0x1f
    8020854e:	01b7571b          	srliw	a4,a4,0x1b
    80208552:	9fb9                	addw	a5,a5,a4
    80208554:	8bfd                	andi	a5,a5,31
    80208556:	9f99                	subw	a5,a5,a4
    80208558:	c09c                	sw	a5,0(s1)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    8020855a:	8526                	mv	a0,s1
    8020855c:	ffffa097          	auipc	ra,0xffffa
    80208560:	ed8080e7          	jalr	-296(ra) # 80202434 <wakeup>
    
    WriteReg(THR, c);
    80208564:	01390023          	sb	s3,0(s2)
    if(uart_tx_w == uart_tx_r){
    80208568:	409c                	lw	a5,0(s1)
    8020856a:	40d8                	lw	a4,4(s1)
    8020856c:	fcf713e3          	bne	a4,a5,80208532 <uartstart+0x2a>
  }
}
    80208570:	70a2                	ld	ra,40(sp)
    80208572:	7402                	ld	s0,32(sp)
    80208574:	64e2                	ld	s1,24(sp)
    80208576:	6942                	ld	s2,16(sp)
    80208578:	69a2                	ld	s3,8(sp)
    8020857a:	6145                	addi	sp,sp,48
    8020857c:	8082                	ret
    8020857e:	8082                	ret

0000000080208580 <uartputc>:
{
    80208580:	7179                	addi	sp,sp,-48
    80208582:	f406                	sd	ra,40(sp)
    80208584:	f022                	sd	s0,32(sp)
    80208586:	ec26                	sd	s1,24(sp)
    80208588:	e84a                	sd	s2,16(sp)
    8020858a:	e44e                	sd	s3,8(sp)
    8020858c:	1800                	addi	s0,sp,48
    8020858e:	892a                	mv	s2,a0
  acquire(&uart_tx_lock);
    80208590:	0002c517          	auipc	a0,0x2c
    80208594:	a7850513          	addi	a0,a0,-1416 # 80234008 <uart_tx_lock>
    80208598:	ffff8097          	auipc	ra,0xffff8
    8020859c:	130080e7          	jalr	304(ra) # 802006c8 <acquire>
  if(panicked){
    802085a0:	00005797          	auipc	a5,0x5
    802085a4:	b207b783          	ld	a5,-1248(a5) # 8020d0c0 <_GLOBAL_OFFSET_TABLE_+0x10>
    802085a8:	439c                	lw	a5,0(a5)
    802085aa:	2781                	sext.w	a5,a5
    802085ac:	c391                	beqz	a5,802085b0 <uartputc+0x30>
    for(;;)
    802085ae:	a001                	j	802085ae <uartputc+0x2e>
    if(((uart_tx_w + 1) % UART_TX_BUF_SIZE) == uart_tx_r){
    802085b0:	0002c617          	auipc	a2,0x2c
    802085b4:	a5060613          	addi	a2,a2,-1456 # 80234000 <uart_tx_r>
    802085b8:	4258                	lw	a4,4(a2)
    802085ba:	0017079b          	addiw	a5,a4,1
    802085be:	41f7d69b          	sraiw	a3,a5,0x1f
    802085c2:	01b6d69b          	srliw	a3,a3,0x1b
    802085c6:	9fb5                	addw	a5,a5,a3
    802085c8:	8bfd                	andi	a5,a5,31
    802085ca:	9f95                	subw	a5,a5,a3
    802085cc:	4214                	lw	a3,0(a2)
    802085ce:	02f69a63          	bne	a3,a5,80208602 <uartputc+0x82>
      sleep(&uart_tx_r, &uart_tx_lock);
    802085d2:	84b2                	mv	s1,a2
    802085d4:	0002c997          	auipc	s3,0x2c
    802085d8:	a3498993          	addi	s3,s3,-1484 # 80234008 <uart_tx_lock>
    802085dc:	85ce                	mv	a1,s3
    802085de:	8526                	mv	a0,s1
    802085e0:	ffffa097          	auipc	ra,0xffffa
    802085e4:	cd2080e7          	jalr	-814(ra) # 802022b2 <sleep>
    if(((uart_tx_w + 1) % UART_TX_BUF_SIZE) == uart_tx_r){
    802085e8:	40d8                	lw	a4,4(s1)
    802085ea:	0017079b          	addiw	a5,a4,1
    802085ee:	41f7d69b          	sraiw	a3,a5,0x1f
    802085f2:	01b6d69b          	srliw	a3,a3,0x1b
    802085f6:	9fb5                	addw	a5,a5,a3
    802085f8:	8bfd                	andi	a5,a5,31
    802085fa:	9f95                	subw	a5,a5,a3
    802085fc:	4094                	lw	a3,0(s1)
    802085fe:	fcf68fe3          	beq	a3,a5,802085dc <uartputc+0x5c>
      uart_tx_buf[uart_tx_w] = c;
    80208602:	0002c697          	auipc	a3,0x2c
    80208606:	9fe68693          	addi	a3,a3,-1538 # 80234000 <uart_tx_r>
    8020860a:	9736                	add	a4,a4,a3
    8020860c:	03270023          	sb	s2,32(a4)
      uart_tx_w = (uart_tx_w + 1) % UART_TX_BUF_SIZE;
    80208610:	c2dc                	sw	a5,4(a3)
      uartstart();
    80208612:	00000097          	auipc	ra,0x0
    80208616:	ef6080e7          	jalr	-266(ra) # 80208508 <uartstart>
      release(&uart_tx_lock);
    8020861a:	0002c517          	auipc	a0,0x2c
    8020861e:	9ee50513          	addi	a0,a0,-1554 # 80234008 <uart_tx_lock>
    80208622:	ffff8097          	auipc	ra,0xffff8
    80208626:	0fa080e7          	jalr	250(ra) # 8020071c <release>
}
    8020862a:	70a2                	ld	ra,40(sp)
    8020862c:	7402                	ld	s0,32(sp)
    8020862e:	64e2                	ld	s1,24(sp)
    80208630:	6942                	ld	s2,16(sp)
    80208632:	69a2                	ld	s3,8(sp)
    80208634:	6145                	addi	sp,sp,48
    80208636:	8082                	ret

0000000080208638 <uartgetc>:

// read one input character from the UART.
// return -1 if none is waiting.
int
uartgetc(void)
{
    80208638:	1141                	addi	sp,sp,-16
    8020863a:	e422                	sd	s0,8(sp)
    8020863c:	0800                	addi	s0,sp,16
  if(ReadReg(LSR) & 0x01){
    8020863e:	100007b7          	lui	a5,0x10000
    80208642:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x701ffffb>
    80208646:	8b85                	andi	a5,a5,1
    80208648:	cb91                	beqz	a5,8020865c <uartgetc+0x24>
    // input data is ready.
    return ReadReg(RHR);
    8020864a:	100007b7          	lui	a5,0x10000
    8020864e:	0007c503          	lbu	a0,0(a5) # 10000000 <_entry-0x70200000>
    80208652:	0ff57513          	andi	a0,a0,255
  } else {
    return -1;
  }
}
    80208656:	6422                	ld	s0,8(sp)
    80208658:	0141                	addi	sp,sp,16
    8020865a:	8082                	ret
    return -1;
    8020865c:	557d                	li	a0,-1
    8020865e:	bfe5                	j	80208656 <uartgetc+0x1e>

0000000080208660 <uartintr>:
// handle a uart interrupt, raised because input has
// arrived, or the uart is ready for more output, or
// both. called from trap.c.
void
uartintr(void)
{
    80208660:	1101                	addi	sp,sp,-32
    80208662:	ec06                	sd	ra,24(sp)
    80208664:	e822                	sd	s0,16(sp)
    80208666:	e426                	sd	s1,8(sp)
    80208668:	1000                	addi	s0,sp,32
  // read and process incoming characters.
  while(1){
    int c = uartgetc();
    if(c == -1)
    8020866a:	54fd                	li	s1,-1
    int c = uartgetc();
    8020866c:	00000097          	auipc	ra,0x0
    80208670:	fcc080e7          	jalr	-52(ra) # 80208638 <uartgetc>
    if(c == -1)
    80208674:	00950763          	beq	a0,s1,80208682 <uartintr+0x22>
      break;
    consoleintr(c);
    80208678:	fffff097          	auipc	ra,0xfffff
    8020867c:	66a080e7          	jalr	1642(ra) # 80207ce2 <consoleintr>
  while(1){
    80208680:	b7f5                	j	8020866c <uartintr+0xc>
  }

  // send buffered characters.
  acquire(&uart_tx_lock);
    80208682:	0002c497          	auipc	s1,0x2c
    80208686:	98648493          	addi	s1,s1,-1658 # 80234008 <uart_tx_lock>
    8020868a:	8526                	mv	a0,s1
    8020868c:	ffff8097          	auipc	ra,0xffff8
    80208690:	03c080e7          	jalr	60(ra) # 802006c8 <acquire>
  uartstart();
    80208694:	00000097          	auipc	ra,0x0
    80208698:	e74080e7          	jalr	-396(ra) # 80208508 <uartstart>
  release(&uart_tx_lock);
    8020869c:	8526                	mv	a0,s1
    8020869e:	ffff8097          	auipc	ra,0xffff8
    802086a2:	07e080e7          	jalr	126(ra) # 8020071c <release>
}
    802086a6:	60e2                	ld	ra,24(sp)
    802086a8:	6442                	ld	s0,16(sp)
    802086aa:	64a2                	ld	s1,8(sp)
    802086ac:	6105                	addi	sp,sp,32
    802086ae:	8082                	ret
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
