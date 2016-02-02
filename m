From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k: use conventional function parameters for do_sigreturn
Date: Tue, 02 Feb 2016 20:25:32 +0100
Message-ID: <871t8u7w43.fsf@linux-m68k.org>
References: <1453183018-11722-1-git-send-email-gerg@uclinux.org>
	<8737tcxoka.fsf@linux-m68k.org> <56AFF16E.2020506@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:54437 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753880AbcBBTZg (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 2 Feb 2016 14:25:36 -0500
In-Reply-To: <56AFF16E.2020506@uclinux.org> (Greg Ungerer's message of "Tue, 2
	Feb 2016 09:59:42 +1000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: linux-m68k@vger.kernel.org

Greg Ungerer <gerg@uclinux.org> writes:

>> Does it work to use this signature:
>> 
>> asmlinkage int do_sigreturn(struct switch_stack sw, struct pt_regs regs)
>> 
>> without changing the caller?
>
> No, same problem.

So this is unrelated to aliasing.  Can you create a test case?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
