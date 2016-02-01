From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k: use conventional function parameters for do_sigreturn
Date: Mon, 01 Feb 2016 19:39:33 +0100
Message-ID: <8737tcxoka.fsf@linux-m68k.org>
References: <1453183018-11722-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:55987 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751662AbcBASjg (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 1 Feb 2016 13:39:36 -0500
In-Reply-To: <1453183018-11722-1-git-send-email-gerg@uclinux.org> (Greg
	Ungerer's message of "Tue, 19 Jan 2016 15:56:58 +1000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: linux-m68k@vger.kernel.org

Greg Ungerer <gerg@uclinux.org> writes:

> The motivation for this change is a problem with non-MMU targets that
> have broken signal return paths on newer versions of gcc. It appears as
> though aliasing of the regs and switch stack pointers, caused by their
> construction from pointers derived from the dummy long function parameter,
> is resulting in the gcc optimizer removing what it thinks is useless
> updates to the regs fields.

I wonder why gcc is doing that.  The kernel is explicitly built without
strict aliasing, so this looks like something to investigate.

> -asmlinkage int do_sigreturn(unsigned long __unused)
> +asmlinkage int do_sigreturn(struct pt_regs *regs, struct switch_stack *sw)

Does it work to use this signature:

asmlinkage int do_sigreturn(struct switch_stack sw, struct pt_regs regs)

without changing the caller?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
