From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k: use conventional function parameters for do_sigreturn
Date: Tue, 09 Feb 2016 00:31:54 +0100
Message-ID: <871t8mkcd1.fsf@linux-m68k.org>
References: <1453183018-11722-1-git-send-email-gerg@uclinux.org>
	<8737tcxoka.fsf@linux-m68k.org> <56AFF16E.2020506@uclinux.org>
	<871t8u7w43.fsf@linux-m68k.org> <56B17EA9.8020504@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:41717 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932759AbcBHXb6 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 8 Feb 2016 18:31:58 -0500
In-Reply-To: <56B17EA9.8020504@uclinux.org> (Greg Ungerer's message of "Wed, 3
	Feb 2016 14:14:33 +1000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: linux-m68k@vger.kernel.org

Greg Ungerer <gerg@uclinux.org> writes:

> Attached is a test case - derived from the original signal.c code.

It looks like with all those trivial functions in the non-MMU case the
compiler sees enough to consider the writes to the (pseudo) function
arguments dead.

How about this:

diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
index af1c4f3..3cc9eaa 100644
--- a/arch/m68k/kernel/signal.c
+++ b/arch/m68k/kernel/signal.c
@@ -757,6 +757,11 @@ asmlinkage int do_sigreturn(unsigned long __unused)
 
 	if (restore_sigcontext(regs, &frame->sc, frame + 1))
 		goto badframe;
+	/*
+	 * Force a barrier so that the compiler does not consider writes
+	 * to *sw and *regs as dead.
+	 */
+	barrier();
 	return regs->d0;
 
 badframe:
@@ -781,6 +786,11 @@ asmlinkage int do_rt_sigreturn(unsigned long __unused)
 
 	if (rt_restore_ucontext(regs, sw, &frame->uc))
 		goto badframe;
+	/*
+	 * Force a barrier so that the compiler does not consider writes
+	 * to *sw and *regs as dead.
+	 */
+	barrier();
 	return regs->d0;
 
 badframe:

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
