From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: arch_ptrace() question
Date: Mon, 04 Oct 2010 22:46:40 +0200
Message-ID: <m2lj6dlm8f.fsf@igel.home>
References: <AANLkTikZ8b9QNBkNQRCJj7ajy86hrxiPqdC-oHDe+748@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:40341 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757020Ab0JDUqn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Oct 2010 16:46:43 -0400
In-Reply-To: <AANLkTikZ8b9QNBkNQRCJj7ajy86hrxiPqdC-oHDe+748@mail.gmail.com>
	(Geert Uytterhoeven's message of "Mon, 4 Oct 2010 21:35:05 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> However, in the PTRACE_PEEKUSR case, the limit is 49, not 48, so it
> allows to access the
> first 4 bytes of fpstate[], too.
>
> Is this intentional

Yes, I think it is.  It allows to check whether the state is NULL or
not, thus whether the fpu registers are actually valid.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
