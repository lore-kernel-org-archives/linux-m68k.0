From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: [PATCH] Define sigcontext ABI of ColdFire
Date: Fri, 18 Sep 2009 14:28:44 +0400
Message-ID: <4AB360DC.9030902@codesourcery.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070401040600080203040906"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([65.74.133.4]:34538 "EHLO
	mail.codesourcery.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751672AbZIRK2v (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 18 Sep 2009 06:28:51 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org

This is a multi-part message in MIME format.
--------------070401040600080203040906
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The following patch define sigcontext ABI of ColdFire.

Once these changes are reviewed, I'll follow up with patches to GLIBC 
and GCC's linux-unwind.h.

Thanks,

--
Maxim K.
CodeSourcery

--------------070401040600080203040906
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="0001-Define-sigcontext-ABI-of-ColdFire.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-Define-sigcontext-ABI-of-ColdFire.patch"

>From 998f3f07de69f51aa6d810800c8e8a685a4dec77 Mon Sep 17 00:00:00 2001
From: Maxim Kuvyrkov <maxim@codesourcery.com>
Date: Fri, 18 Sep 2009 14:09:03 +0400
Subject: [PATCH] Define sigcontext ABI of ColdFire

The following patch defines sigcontext ABI of ColdFire.  Due to ISA
restrictions ColdFire needs different rt_sigreturn trampoline.

And due to ColdFire FP registers being 8-bytes instead of 12-bytes on
m68k, sigcontext and fpregset structures should be updated.

Regarding the sc_fpstate[16+6*8] field, it would've been enough 16
bytes to store ColdFire's FP state.  To accomodate GLIBC's libSegFault
it would'be been enough 6*8 bytes (room for the 6 non-call-clobbered
FP registers).  I set it to 16+6*8 to provide some extra space for any
future changes in the ColdFire FPU.

Signed-off-by: Maxim Kuvyrkov <maxim@codesourcery.com>
---
 arch/m68k/include/asm/sigcontext.h |    6 ++++++
 arch/m68k/include/asm/ucontext.h   |    4 ++++
 arch/m68k/kernel/signal.c          |    6 ++++++
 3 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/include/asm/sigcontext.h b/arch/m68k/include/asm/sigcontext.h
index 523db2a..1320eaa 100644
--- a/arch/m68k/include/asm/sigcontext.h
+++ b/arch/m68k/include/asm/sigcontext.h
@@ -15,9 +15,15 @@ struct sigcontext {
 	unsigned long  sc_pc;
 	unsigned short sc_formatvec;
 #ifndef __uClinux__
+# ifdef __mcoldfire__
+	unsigned long  sc_fpregs[2][2];	/* room for two fp registers */
+	unsigned long  sc_fpcntl[3];
+	unsigned char  sc_fpstate[16+6*8];
+# else
 	unsigned long  sc_fpregs[2*3];  /* room for two fp registers */
 	unsigned long  sc_fpcntl[3];
 	unsigned char  sc_fpstate[216];
+# endif
 #endif
 };
 
diff --git a/arch/m68k/include/asm/ucontext.h b/arch/m68k/include/asm/ucontext.h
index e4e2266..00dcc51 100644
--- a/arch/m68k/include/asm/ucontext.h
+++ b/arch/m68k/include/asm/ucontext.h
@@ -7,7 +7,11 @@ typedef greg_t gregset_t[NGREG];
 
 typedef struct fpregset {
 	int f_fpcntl[3];
+#ifdef __mcoldfire__
+	int f_fpregs[8][2];
+#else
 	int f_fpregs[8*3];
+#endif
 } fpregset_t;
 
 struct mcontext {
diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
index de2d05d..9913c2b 100644
--- a/arch/m68k/kernel/signal.c
+++ b/arch/m68k/kernel/signal.c
@@ -897,9 +897,15 @@ static void setup_rt_frame (int sig, struct k_sigaction *ka, siginfo_t *info,
 
 	/* Set up to return from userspace.  */
 	err |= __put_user(frame->retcode, &frame->pretcode);
+#ifdef __mcoldfire__
+	/* move.w #,d0; trap #0 */
+	err |= __put_user(0x303c0000 + __NR_rt_sigreturn,
+			  (long __user *)(frame->retcode + 0));
+#else
 	/* moveq #,d0; notb d0; trap #0 */
 	err |= __put_user(0x70004600 + ((__NR_rt_sigreturn ^ 0xff) << 16),
 			  (long __user *)(frame->retcode + 0));
+#endif
 	err |= __put_user(0x4e40, (short __user *)(frame->retcode + 4));
 
 	if (err)
-- 
1.6.4


--------------070401040600080203040906--
