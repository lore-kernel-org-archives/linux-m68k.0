From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: [PATCH] Define sigcontext ABI for ColdFire
Date: Tue, 09 Feb 2010 14:22:33 +0300
Message-ID: <4B714579.3060508@codesourcery.com>
References: <4AB360DC.9030902@codesourcery.com> <4AB9439B.6050006@codesourcery.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080101080805010501040001"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([38.113.113.100]:38410 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754063Ab0BILWh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 9 Feb 2010 06:22:37 -0500
In-Reply-To: <4AB9439B.6050006@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Greg Ungerer <gerg@snapgear.com>, Linux/m68k <linux-m68k@vger.kernel.org>

This is a multi-part message in MIME format.
--------------080101080805010501040001
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/09 1:37 AM, Maxim Kuvyrkov wrote:
> Maxim Kuvyrkov wrote:
>> The following patch define sigcontext ABI of ColdFire.
...
> I was lured into thinking that the above sequence is OK by m68knommu's
> version of the trampoline. Arch/m68knommu/kernel/entry.S uses "move
> #__NR_rt_sigreturn,%d0" which assembles into "move.w". This is too is
> buggy and I'm also attaching the fix for the nommu version.

I have cleaned up the sigcontext patch for ColdFire to only touch the 
necessary fields in the sigcontext structure.  Attached are the cleaned 
up sigcontext patch and the rt_sigreturn fix for m68knommu.

I hope these patches will find their way into m68k/for-2.6.34 branch.

Regards,

-- 
Maxim Kuvyrkov
CodeSourcery
maxim@codesourcery.com
(650) 331-3385 x724

--------------080101080805010501040001
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="0001-Define-sigcontext-ABI-for-ColdFire.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-Define-sigcontext-ABI-for-ColdFire.patch"

>From 1630ef86e8a1239c1d4ec6f8a6566ab57771f615 Mon Sep 17 00:00:00 2001
From: Maxim Kuvyrkov <maxim@codesourcery.com>
Date: Tue, 9 Feb 2010 14:03:16 +0300
Subject: [PATCH 1/2] Define sigcontext ABI for ColdFire

The following patch defines sigcontext ABI of ColdFire.  Due to ISA
restrictions ColdFire needs different rt_sigreturn trampoline.  And
due to ColdFire FPU registers being 8-bytes instead of 12-bytes,
sigcontext and fpregset structures need to be updated.

Signed-off-by: Maxim Kuvyrkov <maxim@codesourcery.com>
---
 arch/m68k/include/asm/sigcontext.h |    4 ++++
 arch/m68k/include/asm/ucontext.h   |    4 ++++
 arch/m68k/kernel/signal.c          |    7 +++++++
 3 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/include/asm/sigcontext.h b/arch/m68k/include/asm/sigcontext.h
index 523db2a..68d8881 100644
--- a/arch/m68k/include/asm/sigcontext.h
+++ b/arch/m68k/include/asm/sigcontext.h
@@ -15,7 +15,11 @@ struct sigcontext {
 	unsigned long  sc_pc;
 	unsigned short sc_formatvec;
 #ifndef __uClinux__
+# ifndef __mcoldfire__
 	unsigned long  sc_fpregs[2*3];  /* room for two fp registers */
+# else
+	unsigned long  sc_fpregs[2][2];	/* room for two fp registers */
+# endif
 	unsigned long  sc_fpcntl[3];
 	unsigned char  sc_fpstate[216];
 #endif
diff --git a/arch/m68k/include/asm/ucontext.h b/arch/m68k/include/asm/ucontext.h
index e4e2266..465062b 100644
--- a/arch/m68k/include/asm/ucontext.h
+++ b/arch/m68k/include/asm/ucontext.h
@@ -7,7 +7,11 @@ typedef greg_t gregset_t[NGREG];
 
 typedef struct fpregset {
 	int f_fpcntl[3];
+#ifndef __mcoldfire__
 	int f_fpregs[8*3];
+#else
+	int f_fpregs[8][2];
+#endif
 } fpregset_t;
 
 struct mcontext {
diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
index de2d05d..3be91e1 100644
--- a/arch/m68k/kernel/signal.c
+++ b/arch/m68k/kernel/signal.c
@@ -897,10 +897,17 @@ static void setup_rt_frame (int sig, struct k_sigaction *ka, siginfo_t *info,
 
 	/* Set up to return from userspace.  */
 	err |= __put_user(frame->retcode, &frame->pretcode);
+#ifndef __mcoldfire__
 	/* moveq #,d0; notb d0; trap #0 */
 	err |= __put_user(0x70004600 + ((__NR_rt_sigreturn ^ 0xff) << 16),
 			  (long __user *)(frame->retcode + 0));
 	err |= __put_user(0x4e40, (short __user *)(frame->retcode + 4));
+#else
+	/* movel #__NR_rt_sigreturn,d0; trap #0 */
+	err |= __put_user(0x203c0000, (long __user *)(frame->retcode + 0));
+	err |= __put_user(0x00004e40 + (__NR_rt_sigreturn << 16),
+			  (long __user *)(frame->retcode + 4));
+#endif
 
 	if (err)
 		goto give_sigsegv;
-- 
1.6.6.1


--------------080101080805010501040001
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="0002-Fix-m68k-uclinux-s-rt_sigreturn-trampoline.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-Fix-m68k-uclinux-s-rt_sigreturn-trampoline.patch"

>From 68c601c6f0135ca7cede22d4b1d4f59ef545f965 Mon Sep 17 00:00:00 2001
From: Maxim Kuvyrkov <maxim@codesourcery.com>
Date: Wed, 23 Sep 2009 01:25:44 +0400
Subject: [PATCH 2/2] Fix m68k-uclinux's rt_sigreturn trampoline

Signed-off-by: Maxim Kuvyrkov <maxim@codesourcery.com>
---
 arch/m68knommu/kernel/entry.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68knommu/kernel/entry.S b/arch/m68knommu/kernel/entry.S
index 56043ad..aff6f57 100644
--- a/arch/m68knommu/kernel/entry.S
+++ b/arch/m68knommu/kernel/entry.S
@@ -145,6 +145,6 @@ ENTRY(ret_from_user_signal)
 	trap #0
 
 ENTRY(ret_from_user_rt_signal)
-	move #__NR_rt_sigreturn,%d0
+	movel #__NR_rt_sigreturn,%d0
 	trap #0
 
-- 
1.6.6.1


--------------080101080805010501040001--
