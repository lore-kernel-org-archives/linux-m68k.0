From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Boot crash on 68030, was Re: [PATCH][M68K] implement futex.h to support userspace robust futexes and PI mutexes
Date: Fri, 21 Feb 2014 10:53:45 +0100
Message-ID: <8738jcpz9y.fsf@igel.home>
References: <20793.61385.652975.797741@pilspetsen.it.uu.se>
	<alpine.LNX.2.00.1312101000250.10258@nippy.intranet>
	<87iouxzju3.fsf@igel.home>
	<alpine.LNX.2.00.1312101141250.17926@nippy.intranet>
	<CAMuHMdVB3w3JpNSrdZXPk+xrDXyhm-CgDHX5XW_1CUKn8pQmtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:55292 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754663AbaBUJxs (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Feb 2014 04:53:48 -0500
In-Reply-To: <CAMuHMdVB3w3JpNSrdZXPk+xrDXyhm-CgDHX5XW_1CUKn8pQmtA@mail.gmail.com>
	(Geert Uytterhoeven's message of "Tue, 10 Dec 2013 11:12:50 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>, Mikael Pettersson <mikpelinux@gmail.com>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> On '030, the relevant code is:
>
>     if (mmusr & (MMU_I | MMU_WP)) {
>             if (ssw & 4) {
>                     printk("Data %s fault at %#010lx in %s (pc=%#lx)\n",
>                            ssw & RW ? "read" : "write",
>                            fp->un.fmtb.daddr,
>                            space_names[ssw & DFC], fp->ptregs.pc);
>                     goto buserr;
>             }
>             /* Don't try to do anything further if an exception was
>                handled. */
>             if (do_page_fault (&fp->ptregs, addr, errorcode) < 0)
>                     return;
>
> But we never get to do_page_fault(), as ssw = 5 (SUPER_DATA).
>
> The "if (ssw & 4) { ... }" chunk was added in commit
> e48d483d581278fae02a5fffeba2b1fef47be4d4 (from full-history-linux):

I guess it just reinstates the condition in the first hunk.

-       if (fp->ptregs.sr & PS_S) {
-               /* kernel fault must be a data fault to user space */

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
