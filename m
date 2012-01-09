From: Andreas Schwab <schwab@linux-m68k.org>
Subject: [PATCH] m68k: fix assembler constraint to prevent overeager gcc
 optimisation
Date: Mon, 09 Jan 2012 15:10:15 +0100
Message-ID: <m2obudynjs.fsf_-_@igel.home>
References: <4F079F6B.8080502@fairlite.co.uk> <4F07EA66.6020603@gmail.com>
	<4F08E748.4020305@fairlite.co.uk> <4F0917E9.9090600@gmail.com>
	<4F0964EC.2080505@fairlite.co.uk>
	<CAOmrzkLH18VCY0dzJPM14dn5ccWmSBkiPzq8EFqnCDHiM3bECQ@mail.gmail.com>
	<4F0A2DD0.4000707@fairlite.co.uk>
	<CAOmrzk+P3mPXu_Q_KxgEk_jx-JNhXY4ydrKoGM+43LpD5icTHw@mail.gmail.com>
	<4F0A3CDE.7070308@fairlite.co.uk> <4F0A421C.9000600@fairlite.co.uk>
	<m2wr91yxa4.fsf@igel.home>
	<CAMuHMdXjWyEEOS4fJEaY1dg_cZWLyTps85jaQzsvbO_44-UhqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:42168 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755057Ab2AIOKV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 9 Jan 2012 09:10:21 -0500
In-Reply-To: <CAMuHMdXjWyEEOS4fJEaY1dg_cZWLyTps85jaQzsvbO_44-UhqA@mail.gmail.com>
	(Geert Uytterhoeven's message of "Mon, 9 Jan 2012 13:14:16 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tuomas Vainikka <tuomas.vainikka@aalto.fi>, Alan Hourihane <alanh@fairlite.co.uk>, Michael Schmitz <schmitzmic@googlemail.com>, Linux/m68k <linux-m68k@vger.kernel.org>

Passing the address of a variable as an operand to an asm statement
doesn't mark the value of this variable as used, so gcc may optimize its
initialisation away.  Fix this by using the "m" constraint instead.

Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
---
 arch/m68k/atari/config.c      |    8 ++++----
 arch/m68k/kernel/process_mm.c |    4 ++--
 arch/m68k/kernel/process_no.c |    4 ++--
 arch/m68k/kernel/traps.c      |   36 +++++++++++++++++-------------------
 arch/m68k/mm/cache.c          |    6 +++---
 5 files changed, 28 insertions(+), 30 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 273c7e8..af78731 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -415,9 +415,9 @@ void __init config_atari(void)
 					 * FDC val = 4 -> Supervisor only */
 		asm volatile ("\n"
 			"	.chip	68030\n"
-			"	pmove	%0@,%/tt1\n"
+			"	pmove	%0,%/tt1\n"
 			"	.chip	68k"
-			: : "a" (&tt1_val));
+			: : "m" (tt1_val));
 	} else {
 	        asm volatile ("\n"
 			"	.chip	68040\n"
@@ -570,10 +570,10 @@ static void atari_reset(void)
 			: "d0");
 	} else
 		asm volatile ("\n"
-			"	pmove	%0@,%%tc\n"
+			"	pmove	%0,%%tc\n"
 			"	jmp	%1@"
 			: /* no outputs */
-			: "a" (&tc_val), "a" (reset_addr));
+			: "m" (tc_val), "a" (reset_addr));
 }
 
 
diff --git a/arch/m68k/kernel/process_mm.c b/arch/m68k/kernel/process_mm.c
index 1bc223a..aa4ffb8 100644
--- a/arch/m68k/kernel/process_mm.c
+++ b/arch/m68k/kernel/process_mm.c
@@ -189,8 +189,8 @@ void flush_thread(void)
 	current->thread.fs = __USER_DS;
 	if (!FPU_IS_EMU)
 		asm volatile (".chip 68k/68881\n\t"
-			      "frestore %0@\n\t"
-			      ".chip 68k" : : "a" (&zero));
+			      "frestore %0\n\t"
+			      ".chip 68k" : : "m" (zero));
 }
 
 /*
diff --git a/arch/m68k/kernel/process_no.c b/arch/m68k/kernel/process_no.c
index 69c1803..5e1078c 100644
--- a/arch/m68k/kernel/process_no.c
+++ b/arch/m68k/kernel/process_no.c
@@ -163,8 +163,8 @@ void flush_thread(void)
 #ifdef CONFIG_FPU
 	if (!FPU_IS_EMU)
 		asm volatile (".chip 68k/68881\n\t"
-			      "frestore %0@\n\t"
-			      ".chip 68k" : : "a" (&zero));
+			      "frestore %0\n\t"
+			      ".chip 68k" : : "m" (zero));
 #endif
 }
 
diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index 89362f2..eb67469 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -552,13 +552,13 @@ static inline void bus_error030 (struct frame *fp)
 
 #ifdef DEBUG
 		asm volatile ("ptestr %3,%2@,#7,%0\n\t"
-			      "pmove %%psr,%1@"
-			      : "=a&" (desc)
-			      : "a" (&temp), "a" (addr), "d" (ssw));
+			      "pmove %%psr,%1"
+			      : "=a&" (desc), "=m" (temp)
+			      : "a" (addr), "d" (ssw));
 #else
 		asm volatile ("ptestr %2,%1@,#7\n\t"
-			      "pmove %%psr,%0@"
-			      : : "a" (&temp), "a" (addr), "d" (ssw));
+			      "pmove %%psr,%0"
+			      : "=m" (temp) : "a" (addr), "d" (ssw));
 #endif
 		mmusr = temp;
 
@@ -605,20 +605,18 @@ static inline void bus_error030 (struct frame *fp)
 			       !(ssw & RW) ? "write" : "read", addr,
 			       fp->ptregs.pc, ssw);
 			asm volatile ("ptestr #1,%1@,#0\n\t"
-				      "pmove %%psr,%0@"
-				      : /* no outputs */
-				      : "a" (&temp), "a" (addr));
+				      "pmove %%psr,%0"
+				      : "=m" (temp)
+				      : "a" (addr));
 			mmusr = temp;
 
 			printk ("level 0 mmusr is %#x\n", mmusr);
 #if 0
-			asm volatile ("pmove %%tt0,%0@"
-				      : /* no outputs */
-				      : "a" (&tlong));
+			asm volatile ("pmove %%tt0,%0"
+				      : "=m" (tlong));
 			printk("tt0 is %#lx, ", tlong);
-			asm volatile ("pmove %%tt1,%0@"
-				      : /* no outputs */
-				      : "a" (&tlong));
+			asm volatile ("pmove %%tt1,%0"
+				      : "=m" (tlong));
 			printk("tt1 is %#lx\n", tlong);
 #endif
 #ifdef DEBUG
@@ -668,13 +666,13 @@ static inline void bus_error030 (struct frame *fp)
 
 #ifdef DEBUG
 	asm volatile ("ptestr #1,%2@,#7,%0\n\t"
-		      "pmove %%psr,%1@"
-		      : "=a&" (desc)
-		      : "a" (&temp), "a" (addr));
+		      "pmove %%psr,%1"
+		      : "=a&" (desc), "=m" (temp)
+		      : "a" (addr));
 #else
 	asm volatile ("ptestr #1,%1@,#7\n\t"
-		      "pmove %%psr,%0@"
-		      : : "a" (&temp), "a" (addr));
+		      "pmove %%psr,%0"
+		      : "=m" (temp) : "a" (addr));
 #endif
 	mmusr = temp;
 
diff --git a/arch/m68k/mm/cache.c b/arch/m68k/mm/cache.c
index 5437fff..5550aa4 100644
--- a/arch/m68k/mm/cache.c
+++ b/arch/m68k/mm/cache.c
@@ -52,9 +52,9 @@ static unsigned long virt_to_phys_slow(unsigned long vaddr)
 		unsigned long *descaddr;
 
 		asm volatile ("ptestr %3,%2@,#7,%0\n\t"
-			      "pmove %%psr,%1@"
-			      : "=a&" (descaddr)
-			      : "a" (&mmusr), "a" (vaddr), "d" (get_fs().seg));
+			      "pmove %%psr,%1"
+			      : "=a&" (descaddr), "=m" (mmusr)
+			      : "a" (vaddr), "d" (get_fs().seg));
 		if (mmusr & (MMU_I|MMU_B|MMU_L))
 			return 0;
 		descaddr = phys_to_virt((unsigned long)descaddr);
-- 
1.7.8.3


-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
