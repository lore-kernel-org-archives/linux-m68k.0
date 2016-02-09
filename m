From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k: use conventional function parameters for do_sigreturn
Date: Tue, 09 Feb 2016 14:17:24 +0100
Message-ID: <mvm37t2uior.fsf@hawking.suse.de>
References: <1453183018-11722-1-git-send-email-gerg@uclinux.org>
	<8737tcxoka.fsf@linux-m68k.org> <56AFF16E.2020506@uclinux.org>
	<871t8u7w43.fsf@linux-m68k.org> <56B17EA9.8020504@uclinux.org>
	<871t8mkcd1.fsf@linux-m68k.org> <56B93106.4050806@uclinux.org>
	<mvmegcmw6y1.fsf@hawking.suse.de> <56B9E435.2000203@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:43909 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751653AbcBINR2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 9 Feb 2016 08:17:28 -0500
In-Reply-To: <56B9E435.2000203@uclinux.org> (Greg Ungerer's message of "Tue, 9
	Feb 2016 23:05:57 +1000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: linux-m68k@vger.kernel.org

Greg Ungerer <gerg@uclinux.org> writes:

> Given the original code is:
>
>   asmlinkage int do_sigreturn(unsigned long __unused)
>   {
>         struct switch_stack *sw = (struct switch_stack *) &__unused;
>         struct pt_regs *regs = (struct pt_regs *) (sw + 1);
>
> So gcc is determining that what sw and regs points to are
> part of do_sigreturn() parameters here?

It's basically what varags used to do.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
