From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/3] m68k: Convert arch/m68k/kernel/traps.c to pr_*()
Date: Tue, 10 Dec 2013 12:11:59 +0100
Message-ID: <1386673920-5670-2-git-send-email-geert@linux-m68k.org>
References: <1386673920-5670-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1386673920-5670-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Also fix a few printf-style formats, to get rid of the following compil=
er
warnings when DEBUG is enabled:

arch/m68k/kernel/traps.c: In function =E2=80=98access_error060=E2=80=99=
:
arch/m68k/kernel/traps.c:166: warning: format =E2=80=98%d=E2=80=99 expe=
cts type =E2=80=98int=E2=80=99, but argument 2 has type =E2=80=98long u=
nsigned int=E2=80=99
arch/m68k/kernel/traps.c: In function =E2=80=98bus_error030=E2=80=99:
arch/m68k/kernel/traps.c:568: warning: format =E2=80=98%#lx=E2=80=99 ex=
pects type =E2=80=98long unsigned int=E2=80=99, but argument 2 has type=
 =E2=80=98void *=E2=80=99
arch/m68k/kernel/traps.c:682: warning: format =E2=80=98%#lx=E2=80=99 ex=
pects type =E2=80=98long unsigned int=E2=80=99, but argument 2 has type=
 =E2=80=98void *=E2=80=99

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/kernel/traps.c |  232 ++++++++++++++++++++------------------=
--------
 1 file changed, 101 insertions(+), 131 deletions(-)

diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index 88fcd8c70e7b..6c9ca24830e9 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -133,9 +133,7 @@ static inline void access_error060 (struct frame *f=
p)
 {
 	unsigned long fslw =3D fp->un.fmt4.pc; /* is really FSLW for access e=
rror */
=20
-#ifdef DEBUG
-	printk("fslw=3D%#lx, fa=3D%#lx\n", fslw, fp->un.fmt4.effaddr);
-#endif
+	pr_debug("fslw=3D%#lx, fa=3D%#lx\n", fslw, fp->un.fmt4.effaddr);
=20
 	if (fslw & MMU060_BPE) {
 		/* branch prediction error -> clear branch cache */
@@ -162,9 +160,7 @@ static inline void access_error060 (struct frame *f=
p)
 		}
 		if (fslw & MMU060_W)
 			errorcode |=3D 2;
-#ifdef DEBUG
-		printk("errorcode =3D %d\n", errorcode );
-#endif
+		pr_debug("errorcode =3D %ld\n", errorcode);
 		do_page_fault(&fp->ptregs, addr, errorcode);
 	} else if (fslw & (MMU060_SEE)){
 		/* Software Emulation Error.
@@ -173,8 +169,9 @@ static inline void access_error060 (struct frame *f=
p)
 		send_fault_sig(&fp->ptregs);
 	} else if (!(fslw & (MMU060_RE|MMU060_WE)) ||
 		   send_fault_sig(&fp->ptregs) > 0) {
-		printk("pc=3D%#lx, fa=3D%#lx\n", fp->ptregs.pc, fp->un.fmt4.effaddr)=
;
-		printk( "68060 access error, fslw=3D%lx\n", fslw );
+		pr_err("pc=3D%#lx, fa=3D%#lx\n", fp->ptregs.pc,
+		       fp->un.fmt4.effaddr);
+		pr_err("68060 access error, fslw=3D%lx\n", fslw);
 		trap_c( fp );
 	}
 }
@@ -225,9 +222,7 @@ static inline int do_040writeback1(unsigned short w=
bs, unsigned long wba,
 	set_fs(old_fs);
=20
=20
-#ifdef DEBUG
-	printk("do_040writeback1, res=3D%d\n",res);
-#endif
+	pr_debug("do_040writeback1, res=3D%d\n", res);
=20
 	return res;
 }
@@ -249,7 +244,7 @@ static inline void do_040writebacks(struct frame *f=
p)
 	int res =3D 0;
 #if 0
 	if (fp->un.fmt7.wb1s & WBV_040)
-		printk("access_error040: cannot handle 1st writeback. oops.\n");
+		pr_err("access_error040: cannot handle 1st writeback. oops.\n");
 #endif
=20
 	if ((fp->un.fmt7.wb2s & WBV_040) &&
@@ -302,14 +297,12 @@ static inline void access_error040(struct frame *=
fp)
 	unsigned short ssw =3D fp->un.fmt7.ssw;
 	unsigned long mmusr;
=20
-#ifdef DEBUG
-	printk("ssw=3D%#x, fa=3D%#lx\n", ssw, fp->un.fmt7.faddr);
-        printk("wb1s=3D%#x, wb2s=3D%#x, wb3s=3D%#x\n", fp->un.fmt7.wb1=
s,
+	pr_debug("ssw=3D%#x, fa=3D%#lx\n", ssw, fp->un.fmt7.faddr);
+	pr_debug("wb1s=3D%#x, wb2s=3D%#x, wb3s=3D%#x\n", fp->un.fmt7.wb1s,
 		fp->un.fmt7.wb2s, fp->un.fmt7.wb3s);
-	printk ("wb2a=3D%lx, wb3a=3D%lx, wb2d=3D%lx, wb3d=3D%lx\n",
+	pr_debug("wb2a=3D%lx, wb3a=3D%lx, wb2d=3D%lx, wb3d=3D%lx\n",
 		fp->un.fmt7.wb2a, fp->un.fmt7.wb3a,
 		fp->un.fmt7.wb2d, fp->un.fmt7.wb3d);
-#endif
=20
 	if (ssw & ATC_040) {
 		unsigned long addr =3D fp->un.fmt7.faddr;
@@ -324,9 +317,7 @@ static inline void access_error040(struct frame *fp=
)
=20
 		/* MMU error, get the MMUSR info for this access */
 		mmusr =3D probe040(!(ssw & RW_040), addr, ssw);
-#ifdef DEBUG
-		printk("mmusr =3D %lx\n", mmusr);
-#endif
+		pr_debug("mmusr =3D %lx\n", mmusr);
 		errorcode =3D 1;
 		if (!(mmusr & MMU_R_040)) {
 			/* clear the invalid atc entry */
@@ -340,14 +331,10 @@ static inline void access_error040(struct frame *=
fp)
 			errorcode |=3D 2;
=20
 		if (do_page_fault(&fp->ptregs, addr, errorcode)) {
-#ifdef DEBUG
-			printk("do_page_fault() !=3D0\n");
-#endif
+			pr_debug("do_page_fault() !=3D0\n");
 			if (user_mode(&fp->ptregs)){
 				/* delay writebacks after signal delivery */
-#ifdef DEBUG
-			        printk(".. was usermode - return\n");
-#endif
+				pr_debug(".. was usermode - return\n");
 				return;
 			}
 			/* disable writeback into user space from kernel
@@ -355,9 +342,7 @@ static inline void access_error040(struct frame *fp=
)
                          * the writeback won't do good)
 			 */
 disable_wb:
-#ifdef DEBUG
-			printk(".. disabling wb2\n");
-#endif
+			pr_debug(".. disabling wb2\n");
 			if (fp->un.fmt7.wb2a =3D=3D fp->un.fmt7.faddr)
 				fp->un.fmt7.wb2s &=3D ~WBV_040;
 			if (fp->un.fmt7.wb3a =3D=3D fp->un.fmt7.faddr)
@@ -371,7 +356,7 @@ disable_wb:
 		current->thread.signo =3D SIGBUS;
 		current->thread.faddr =3D fp->un.fmt7.faddr;
 		if (send_fault_sig(&fp->ptregs) >=3D 0)
-			printk("68040 bus error (ssw=3D%x, faddr=3D%lx)\n", ssw,
+			pr_err("68040 bus error (ssw=3D%x, faddr=3D%lx)\n", ssw,
 			       fp->un.fmt7.faddr);
 		goto disable_wb;
 	}
@@ -394,19 +379,17 @@ static inline void bus_error030 (struct frame *fp=
)
 	unsigned short ssw =3D fp->un.fmtb.ssw;
 	extern unsigned long _sun3_map_test_start, _sun3_map_test_end;
=20
-#ifdef DEBUG
 	if (ssw & (FC | FB))
-		printk ("Instruction fault at %#010lx\n",
+		pr_debug("Instruction fault at %#010lx\n",
 			ssw & FC ?
 			fp->ptregs.format =3D=3D 0xa ? fp->ptregs.pc + 2 : fp->un.fmtb.badd=
r - 2
 			:
 			fp->ptregs.format =3D=3D 0xa ? fp->ptregs.pc + 4 : fp->un.fmtb.badd=
r);
 	if (ssw & DF)
-		printk ("Data %s fault at %#010lx in %s (pc=3D%#lx)\n",
+		pr_debug("Data %s fault at %#010lx in %s (pc=3D%#lx)\n",
 			ssw & RW ? "read" : "write",
 			fp->un.fmtb.daddr,
 			space_names[ssw & DFC], fp->ptregs.pc);
-#endif
=20
 	/*
 	 * Check if this page should be demand-mapped. This needs to go befor=
e
@@ -429,7 +412,7 @@ static inline void bus_error030 (struct frame *fp)
 			  return;
 			/* instruction fault or kernel data fault! */
 			if (ssw & (FC | FB))
-				printk ("Instruction fault at %#010lx\n",
+				pr_err("Instruction fault at %#010lx\n",
 					fp->ptregs.pc);
 			if (ssw & DF) {
 				/* was this fault incurred testing bus mappings? */
@@ -439,12 +422,12 @@ static inline void bus_error030 (struct frame *fp=
)
 					return;
 				}
=20
-				printk ("Data %s fault at %#010lx in %s (pc=3D%#lx)\n",
+				pr_err("Data %s fault at %#010lx in %s (pc=3D%#lx)\n",
 					ssw & RW ? "read" : "write",
 					fp->un.fmtb.daddr,
 					space_names[ssw & DFC], fp->ptregs.pc);
 			}
-			printk ("BAD KERNEL BUSERR\n");
+			pr_err("BAD KERNEL BUSERR\n");
=20
 			die_if_kernel("Oops", &fp->ptregs,0);
 			force_sig(SIGKILL, current);
@@ -473,12 +456,11 @@ static inline void bus_error030 (struct frame *fp=
)
 		else if (buserr_type & SUN3_BUSERR_INVALID)
 			errorcode =3D 0x00;
 		else {
-#ifdef DEBUG
-			printk ("*** unexpected busfault type=3D%#04x\n", buserr_type);
-			printk ("invalid %s access at %#lx from pc %#lx\n",
-				!(ssw & RW) ? "write" : "read", addr,
-				fp->ptregs.pc);
-#endif
+			pr_debug("*** unexpected busfault type=3D%#04x\n",
+				 buserr_type);
+			pr_debug("invalid %s access at %#lx from pc %#lx\n",
+				 !(ssw & RW) ? "write" : "read", addr,
+				 fp->ptregs.pc);
 			die_if_kernel ("Oops", &fp->ptregs, buserr_type);
 			force_sig (SIGBUS, current);
 			return;
@@ -509,9 +491,7 @@ static inline void bus_error030 (struct frame *fp)
 		if (!mmu_emu_handle_fault(addr, 1, 0))
 			do_page_fault (&fp->ptregs, addr, 0);
        } else {
-#ifdef DEBUG
-		printk ("protection fault on insn access (segv).\n");
-#endif
+		pr_debug("protection fault on insn access (segv).\n");
 		force_sig (SIGSEGV, current);
        }
 }
@@ -525,22 +505,22 @@ static inline void bus_error030 (struct frame *fp=
)
 	unsigned short ssw =3D fp->un.fmtb.ssw;
 #ifdef DEBUG
 	unsigned long desc;
+#endif
=20
-	printk ("pid =3D %x  ", current->pid);
-	printk ("SSW=3D%#06x  ", ssw);
+	pr_debug("pid =3D %x  ", current->pid);
+	pr_debug("SSW=3D%#06x  ", ssw);
=20
 	if (ssw & (FC | FB))
-		printk ("Instruction fault at %#010lx\n",
+		pr_debug("Instruction fault at %#010lx\n",
 			ssw & FC ?
 			fp->ptregs.format =3D=3D 0xa ? fp->ptregs.pc + 2 : fp->un.fmtb.badd=
r - 2
 			:
 			fp->ptregs.format =3D=3D 0xa ? fp->ptregs.pc + 4 : fp->un.fmtb.badd=
r);
 	if (ssw & DF)
-		printk ("Data %s fault at %#010lx in %s (pc=3D%#lx)\n",
+		pr_debug("Data %s fault at %#010lx in %s (pc=3D%#lx)\n",
 			ssw & RW ? "read" : "write",
 			fp->un.fmtb.daddr,
 			space_names[ssw & DFC], fp->ptregs.pc);
-#endif
=20
 	/* ++andreas: If a data fault and an instruction fault happen
 	   at the same time map in both pages.  */
@@ -554,27 +534,23 @@ static inline void bus_error030 (struct frame *fp=
)
 			      "pmove %%psr,%1"
 			      : "=3Da&" (desc), "=3Dm" (temp)
 			      : "a" (addr), "d" (ssw));
+		pr_debug("mmusr is %#x for addr %#lx in task %p\n",
+			 temp, addr, current);
+		pr_debug("descriptor address is 0x%p, contents %#lx\n",
+			 __va(desc), *(unsigned long *)__va(desc));
 #else
 		asm volatile ("ptestr %2,%1@,#7\n\t"
 			      "pmove %%psr,%0"
 			      : "=3Dm" (temp) : "a" (addr), "d" (ssw));
 #endif
 		mmusr =3D temp;
-
-#ifdef DEBUG
-		printk("mmusr is %#x for addr %#lx in task %p\n",
-		       mmusr, addr, current);
-		printk("descriptor address is %#lx, contents %#lx\n",
-		       __va(desc), *(unsigned long *)__va(desc));
-#endif
-
 		errorcode =3D (mmusr & MMU_I) ? 0 : 1;
 		if (!(ssw & RW) || (ssw & RM))
 			errorcode |=3D 2;
=20
 		if (mmusr & (MMU_I | MMU_WP)) {
 			if (ssw & 4) {
-				printk("Data %s fault at %#010lx in %s (pc=3D%#lx)\n",
+				pr_err("Data %s fault at %#010lx in %s (pc=3D%#lx)\n",
 				       ssw & RW ? "read" : "write",
 				       fp->un.fmtb.daddr,
 				       space_names[ssw & DFC], fp->ptregs.pc);
@@ -587,9 +563,10 @@ static inline void bus_error030 (struct frame *fp)
 		} else if (!(mmusr & MMU_I)) {
 			/* probably a 020 cas fault */
 			if (!(ssw & RM) && send_fault_sig(&fp->ptregs) > 0)
-				printk("unexpected bus error (%#x,%#x)\n", ssw, mmusr);
+				pr_err("unexpected bus error (%#x,%#x)\n", ssw,
+				       mmusr);
 		} else if (mmusr & (MMU_B|MMU_L|MMU_S)) {
-			printk("invalid %s access at %#lx from pc %#lx\n",
+			pr_err("invalid %s access at %#lx from pc %#lx\n",
 			       !(ssw & RW) ? "write" : "read", addr,
 			       fp->ptregs.pc);
 			die_if_kernel("Oops",&fp->ptregs,mmusr);
@@ -600,7 +577,7 @@ static inline void bus_error030 (struct frame *fp)
 			static volatile long tlong;
 #endif
=20
-			printk("weird %s access at %#lx from pc %#lx (ssw is %#x)\n",
+			pr_err("weird %s access at %#lx from pc %#lx (ssw is %#x)\n",
 			       !(ssw & RW) ? "write" : "read", addr,
 			       fp->ptregs.pc, ssw);
 			asm volatile ("ptestr #1,%1@,#0\n\t"
@@ -609,18 +586,16 @@ static inline void bus_error030 (struct frame *fp=
)
 				      : "a" (addr));
 			mmusr =3D temp;
=20
-			printk ("level 0 mmusr is %#x\n", mmusr);
+			pr_err("level 0 mmusr is %#x\n", mmusr);
 #if 0
 			asm volatile ("pmove %%tt0,%0"
 				      : "=3Dm" (tlong));
-			printk("tt0 is %#lx, ", tlong);
+			pr_debug("tt0 is %#lx, ", tlong);
 			asm volatile ("pmove %%tt1,%0"
 				      : "=3Dm" (tlong));
-			printk("tt1 is %#lx\n", tlong);
-#endif
-#ifdef DEBUG
-			printk("Unknown SIGSEGV - 1\n");
+			pr_debug("tt1 is %#lx\n", tlong);
 #endif
+			pr_debug("Unknown SIGSEGV - 1\n");
 			die_if_kernel("Oops",&fp->ptregs,mmusr);
 			force_sig(SIGSEGV, current);
 			return;
@@ -641,10 +616,9 @@ static inline void bus_error030 (struct frame *fp)
 		return;
=20
 	if (fp->ptregs.sr & PS_S) {
-		printk("Instruction fault at %#010lx\n",
-			fp->ptregs.pc);
+		pr_err("Instruction fault at %#010lx\n", fp->ptregs.pc);
 	buserr:
-		printk ("BAD KERNEL BUSERR\n");
+		pr_err("BAD KERNEL BUSERR\n");
 		die_if_kernel("Oops",&fp->ptregs,0);
 		force_sig(SIGKILL, current);
 		return;
@@ -668,28 +642,22 @@ static inline void bus_error030 (struct frame *fp=
)
 		      "pmove %%psr,%1"
 		      : "=3Da&" (desc), "=3Dm" (temp)
 		      : "a" (addr));
+	pr_debug("mmusr is %#x for addr %#lx in task %p\n",
+		temp, addr, current);
+	pr_debug("descriptor address is 0x%p, contents %#lx\n",
+		__va(desc), *(unsigned long *)__va(desc));
 #else
 	asm volatile ("ptestr #1,%1@,#7\n\t"
 		      "pmove %%psr,%0"
 		      : "=3Dm" (temp) : "a" (addr));
 #endif
 	mmusr =3D temp;
-
-#ifdef DEBUG
-	printk ("mmusr is %#x for addr %#lx in task %p\n",
-		mmusr, addr, current);
-	printk ("descriptor address is %#lx, contents %#lx\n",
-		__va(desc), *(unsigned long *)__va(desc));
-#endif
-
 	if (mmusr & MMU_I)
 		do_page_fault (&fp->ptregs, addr, 0);
 	else if (mmusr & (MMU_B|MMU_L|MMU_S)) {
-		printk ("invalid insn access at %#lx from pc %#lx\n",
+		pr_err("invalid insn access at %#lx from pc %#lx\n",
 			addr, fp->ptregs.pc);
-#ifdef DEBUG
-		printk("Unknown SIGSEGV - 2\n");
-#endif
+		pr_debug("Unknown SIGSEGV - 2\n");
 		die_if_kernel("Oops",&fp->ptregs,mmusr);
 		force_sig(SIGSEGV, current);
 		return;
@@ -791,9 +759,7 @@ asmlinkage void buserr_c(struct frame *fp)
 	if (user_mode(&fp->ptregs))
 		current->thread.esp0 =3D (unsigned long) fp;
=20
-#ifdef DEBUG
-	printk ("*** Bus Error *** Format is %x\n", fp->ptregs.format);
-#endif
+	pr_debug("*** Bus Error *** Format is %x\n", fp->ptregs.format);
=20
 #if defined(CONFIG_COLDFIRE) && defined(CONFIG_MMU)
 	if (CPU_IS_COLDFIRE) {
@@ -836,9 +802,7 @@ asmlinkage void buserr_c(struct frame *fp)
 #endif
 	default:
 	  die_if_kernel("bad frame format",&fp->ptregs,0);
-#ifdef DEBUG
-	  printk("Unknown SIGSEGV - 4\n");
-#endif
+	  pr_debug("Unknown SIGSEGV - 4\n");
 	  force_sig(SIGSEGV, current);
 	}
 }
@@ -852,7 +816,7 @@ void show_trace(unsigned long *stack)
 	unsigned long addr;
 	int i;
=20
-	printk("Call Trace:");
+	pr_info("Call Trace:");
 	addr =3D (unsigned long)stack + THREAD_SIZE - 1;
 	endstack =3D (unsigned long *)(addr & -THREAD_SIZE);
 	i =3D 0;
@@ -869,13 +833,13 @@ void show_trace(unsigned long *stack)
 		if (__kernel_text_address(addr)) {
 #ifndef CONFIG_KALLSYMS
 			if (i % 5 =3D=3D 0)
-				printk("\n       ");
+				pr_cont("\n       ");
 #endif
-			printk(" [<%08lx>] %pS\n", addr, (void *)addr);
+			pr_cont(" [<%08lx>] %pS\n", addr, (void *)addr);
 			i++;
 		}
 	}
-	printk("\n");
+	pr_cont("\n");
 }
=20
 void show_registers(struct pt_regs *regs)
@@ -887,81 +851,87 @@ void show_registers(struct pt_regs *regs)
 	int i;
=20
 	print_modules();
-	printk("PC: [<%08lx>] %pS\n", regs->pc, (void *)regs->pc);
-	printk("SR: %04x  SP: %p  a2: %08lx\n", regs->sr, regs, regs->a2);
-	printk("d0: %08lx    d1: %08lx    d2: %08lx    d3: %08lx\n",
+	pr_info("PC: [<%08lx>] %pS\n", regs->pc, (void *)regs->pc);
+	pr_info("SR: %04x  SP: %p  a2: %08lx\n", regs->sr, regs, regs->a2);
+	pr_info("d0: %08lx    d1: %08lx    d2: %08lx    d3: %08lx\n",
 	       regs->d0, regs->d1, regs->d2, regs->d3);
-	printk("d4: %08lx    d5: %08lx    a0: %08lx    a1: %08lx\n",
+	pr_info("d4: %08lx    d5: %08lx    a0: %08lx    a1: %08lx\n",
 	       regs->d4, regs->d5, regs->a0, regs->a1);
=20
-	printk("Process %s (pid: %d, task=3D%p)\n",
+	pr_info("Process %s (pid: %d, task=3D%p)\n",
 		current->comm, task_pid_nr(current), current);
 	addr =3D (unsigned long)&fp->un;
-	printk("Frame format=3D%X ", regs->format);
+	pr_info("Frame format=3D%X ", regs->format);
 	switch (regs->format) {
 	case 0x2:
-		printk("instr addr=3D%08lx\n", fp->un.fmt2.iaddr);
+		pr_cont("instr addr=3D%08lx\n", fp->un.fmt2.iaddr);
 		addr +=3D sizeof(fp->un.fmt2);
 		break;
 	case 0x3:
-		printk("eff addr=3D%08lx\n", fp->un.fmt3.effaddr);
+		pr_cont("eff addr=3D%08lx\n", fp->un.fmt3.effaddr);
 		addr +=3D sizeof(fp->un.fmt3);
 		break;
 	case 0x4:
-		printk((CPU_IS_060 ? "fault addr=3D%08lx fslw=3D%08lx\n"
-			: "eff addr=3D%08lx pc=3D%08lx\n"),
-			fp->un.fmt4.effaddr, fp->un.fmt4.pc);
+		if (CPU_IS_060)
+			pr_cont("fault addr=3D%08lx fslw=3D%08lx\n",
+				fp->un.fmt4.effaddr, fp->un.fmt4.pc);
+		else
+			pr_cont("eff addr=3D%08lx pc=3D%08lx\n",
+				fp->un.fmt4.effaddr, fp->un.fmt4.pc);
 		addr +=3D sizeof(fp->un.fmt4);
 		break;
 	case 0x7:
-		printk("eff addr=3D%08lx ssw=3D%04x faddr=3D%08lx\n",
+		pr_cont("eff addr=3D%08lx ssw=3D%04x faddr=3D%08lx\n",
 			fp->un.fmt7.effaddr, fp->un.fmt7.ssw, fp->un.fmt7.faddr);
-		printk("wb 1 stat/addr/data: %04x %08lx %08lx\n",
+		pr_info("wb 1 stat/addr/data: %04x %08lx %08lx\n",
 			fp->un.fmt7.wb1s, fp->un.fmt7.wb1a, fp->un.fmt7.wb1dpd0);
-		printk("wb 2 stat/addr/data: %04x %08lx %08lx\n",
+		pr_info("wb 2 stat/addr/data: %04x %08lx %08lx\n",
 			fp->un.fmt7.wb2s, fp->un.fmt7.wb2a, fp->un.fmt7.wb2d);
-		printk("wb 3 stat/addr/data: %04x %08lx %08lx\n",
+		pr_info("wb 3 stat/addr/data: %04x %08lx %08lx\n",
 			fp->un.fmt7.wb3s, fp->un.fmt7.wb3a, fp->un.fmt7.wb3d);
-		printk("push data: %08lx %08lx %08lx %08lx\n",
+		pr_info("push data: %08lx %08lx %08lx %08lx\n",
 			fp->un.fmt7.wb1dpd0, fp->un.fmt7.pd1, fp->un.fmt7.pd2,
 			fp->un.fmt7.pd3);
 		addr +=3D sizeof(fp->un.fmt7);
 		break;
 	case 0x9:
-		printk("instr addr=3D%08lx\n", fp->un.fmt9.iaddr);
+		pr_cont("instr addr=3D%08lx\n", fp->un.fmt9.iaddr);
 		addr +=3D sizeof(fp->un.fmt9);
 		break;
 	case 0xa:
-		printk("ssw=3D%04x isc=3D%04x isb=3D%04x daddr=3D%08lx dobuf=3D%08lx=
\n",
+		pr_cont("ssw=3D%04x isc=3D%04x isb=3D%04x daddr=3D%08lx dobuf=3D%08l=
x\n",
 			fp->un.fmta.ssw, fp->un.fmta.isc, fp->un.fmta.isb,
 			fp->un.fmta.daddr, fp->un.fmta.dobuf);
 		addr +=3D sizeof(fp->un.fmta);
 		break;
 	case 0xb:
-		printk("ssw=3D%04x isc=3D%04x isb=3D%04x daddr=3D%08lx dobuf=3D%08lx=
\n",
+		pr_cont("ssw=3D%04x isc=3D%04x isb=3D%04x daddr=3D%08lx dobuf=3D%08l=
x\n",
 			fp->un.fmtb.ssw, fp->un.fmtb.isc, fp->un.fmtb.isb,
 			fp->un.fmtb.daddr, fp->un.fmtb.dobuf);
-		printk("baddr=3D%08lx dibuf=3D%08lx ver=3D%x\n",
+		pr_info("baddr=3D%08lx dibuf=3D%08lx ver=3D%x\n",
 			fp->un.fmtb.baddr, fp->un.fmtb.dibuf, fp->un.fmtb.ver);
 		addr +=3D sizeof(fp->un.fmtb);
 		break;
 	default:
-		printk("\n");
+		pr_cont("\n");
 	}
 	show_stack(NULL, (unsigned long *)addr);
=20
-	printk("Code:");
+	pr_info("Code:");
 	set_fs(KERNEL_DS);
 	cp =3D (u16 *)regs->pc;
 	for (i =3D -8; i < 16; i++) {
 		if (get_user(c, cp + i) && i >=3D 0) {
-			printk(" Bad PC value.");
+			pr_cont(" Bad PC value.");
 			break;
 		}
-		printk(i ? " %04x" : " <%04x>", c);
+		if (i)
+			pr_cont(" %04x", c);
+		else
+			pr_cont(" <%04x>", c);
 	}
 	set_fs(old_fs);
-	printk ("\n");
+	pr_cont("\n");
 }
=20
 void show_stack(struct task_struct *task, unsigned long *stack)
@@ -978,16 +948,16 @@ void show_stack(struct task_struct *task, unsigne=
d long *stack)
 	}
 	endstack =3D (unsigned long *)(((unsigned long)stack + THREAD_SIZE - =
1) & -THREAD_SIZE);
=20
-	printk("Stack from %08lx:", (unsigned long)stack);
+	pr_info("Stack from %08lx:", (unsigned long)stack);
 	p =3D stack;
 	for (i =3D 0; i < kstack_depth_to_print; i++) {
 		if (p + 1 > endstack)
 			break;
 		if (i % 8 =3D=3D 0)
-			printk("\n       ");
-		printk(" %08lx", *p++);
+			pr_cont("\n       ");
+		pr_cont(" %08lx", *p++);
 	}
-	printk("\n");
+	pr_cont("\n");
 	show_trace(stack);
 }
=20
@@ -1005,32 +975,32 @@ void bad_super_trap (struct frame *fp)
=20
 	console_verbose();
 	if (vector < ARRAY_SIZE(vec_names))
-		printk ("*** %s ***   FORMAT=3D%X\n",
+		pr_err("*** %s ***   FORMAT=3D%X\n",
 			vec_names[vector],
 			fp->ptregs.format);
 	else
-		printk ("*** Exception %d ***   FORMAT=3D%X\n",
+		pr_err("*** Exception %d ***   FORMAT=3D%X\n",
 			vector, fp->ptregs.format);
 	if (vector =3D=3D VEC_ADDRERR && CPU_IS_020_OR_030) {
 		unsigned short ssw =3D fp->un.fmtb.ssw;
=20
-		printk ("SSW=3D%#06x  ", ssw);
+		pr_err("SSW=3D%#06x  ", ssw);
=20
 		if (ssw & RC)
-			printk ("Pipe stage C instruction fault at %#010lx\n",
+			pr_err("Pipe stage C instruction fault at %#010lx\n",
 				(fp->ptregs.format) =3D=3D 0xA ?
 				fp->ptregs.pc + 2 : fp->un.fmtb.baddr - 2);
 		if (ssw & RB)
-			printk ("Pipe stage B instruction fault at %#010lx\n",
+			pr_err("Pipe stage B instruction fault at %#010lx\n",
 				(fp->ptregs.format) =3D=3D 0xA ?
 				fp->ptregs.pc + 4 : fp->un.fmtb.baddr);
 		if (ssw & DF)
-			printk ("Data %s fault at %#010lx in %s (pc=3D%#lx)\n",
+			pr_err("Data %s fault at %#010lx in %s (pc=3D%#lx)\n",
 				ssw & RW ? "read" : "write",
 				fp->un.fmtb.daddr, space_names[ssw & DFC],
 				fp->ptregs.pc);
 	}
-	printk ("Current process id is %d\n", task_pid_nr(current));
+	pr_err("Current process id is %d\n", task_pid_nr(current));
 	die_if_kernel("BAD KERNEL TRAP", &fp->ptregs, 0);
 }
=20
@@ -1162,7 +1132,7 @@ void die_if_kernel (char *str, struct pt_regs *fp=
, int nr)
 		return;
=20
 	console_verbose();
-	printk("%s: %08x\n",str,nr);
+	pr_crit("%s: %08x\n", str, nr);
 	show_registers(fp);
 	add_taint(TAINT_DIE, LOCKDEP_NOW_UNRELIABLE);
 	do_exit(SIGSEGV);
--=20
1.7.9.5
