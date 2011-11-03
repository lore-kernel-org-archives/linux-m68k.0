From: <gerg@snapgear.com>
Subject: [PATCH] m68k: make fp register stores consistent for m68k and ColdFire
Date: Thu, 3 Nov 2011 15:58:27 +1000
Message-ID: <1320299907-11410-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:50476 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750880Ab1KCGAM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 3 Nov 2011 02:00:12 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

There is no reason we can't make the saved fp registers the same for all
m68k types and ColdFire. There is a little wasted space, but the code
consistentcy and cleanliness is a big win.

sigcontext.h is an exported header, but currently there is no in-mainline
users of the !__uClinux__ and __mcoldfire__ case that this change effects.
Even better this change actually makes this structure consistent with
the out-of-mainline ColdFire/MMU code.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/sigcontext.h |    4 ----
 arch/m68k/include/asm/ucontext.h   |    4 ----
 2 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/include/asm/sigcontext.h b/arch/m68k/include/asm/sigcontext.h
index a29dd74..523db2a 100644
--- a/arch/m68k/include/asm/sigcontext.h
+++ b/arch/m68k/include/asm/sigcontext.h
@@ -15,11 +15,7 @@ struct sigcontext {
 	unsigned long  sc_pc;
 	unsigned short sc_formatvec;
 #ifndef __uClinux__
-# ifdef __mcoldfire__
-	unsigned long  sc_fpregs[2][2];	/* room for two fp registers */
-# else
 	unsigned long  sc_fpregs[2*3];  /* room for two fp registers */
-# endif
 	unsigned long  sc_fpcntl[3];
 	unsigned char  sc_fpstate[216];
 #endif
diff --git a/arch/m68k/include/asm/ucontext.h b/arch/m68k/include/asm/ucontext.h
index 00dcc51..e4e2266 100644
--- a/arch/m68k/include/asm/ucontext.h
+++ b/arch/m68k/include/asm/ucontext.h
@@ -7,11 +7,7 @@ typedef greg_t gregset_t[NGREG];
 
 typedef struct fpregset {
 	int f_fpcntl[3];
-#ifdef __mcoldfire__
-	int f_fpregs[8][2];
-#else
 	int f_fpregs[8*3];
-#endif
 } fpregset_t;
 
 struct mcontext {
-- 
1.7.0.4
