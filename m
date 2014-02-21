From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Boot crash on 68030, was Re: [PATCH][M68K] implement futex.h to
 support userspace robust futexes and PI mutexes
Date: Fri, 21 Feb 2014 13:33:43 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1402211323140.7194@nippy.intranet>
References: <20793.61385.652975.797741@pilspetsen.it.uu.se> <alpine.LNX.2.00.1312101000250.10258@nippy.intranet> <87iouxzju3.fsf@igel.home> <alpine.LNX.2.00.1312101141250.17926@nippy.intranet>
 <CAMuHMdVB3w3JpNSrdZXPk+xrDXyhm-CgDHX5XW_1CUKn8pQmtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:47404 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751600AbaBUCof (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 20 Feb 2014 21:44:35 -0500
In-Reply-To: <CAMuHMdVB3w3JpNSrdZXPk+xrDXyhm-CgDHX5XW_1CUKn8pQmtA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Mikael Pettersson <mikpelinux@gmail.com>


On Tue, 10 Dec 2013, Geert Uytterhoeven wrote:

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

The entire commit can be found here as well, 
https://git.kernel.org/cgit/linux/kernel/git/tglx/history.git/commit/arch/m68k/kernel/traps.c?id=cf9c906f8eb31033b39f47b4313f7228dc5aa201

> Which originates from a CVS commit in 2003, based on v2 (v1 didn't have 
> the chunk) of a patch in the thread "RMW instructions on MC68020/MC68851 
> combo..." between Kars and Roman Z.
> 
> I guess this case will work(TM) if you remove that chunk again? But what 
> are the other implications of that?

So how shall we understand the intention of that patch? Here's the new 
logic:

	if (mmusr & (MMU_I | MMU_WP)) {
		if (ssw & 4) {
			...
		}
		...
	} else if (!(mmusr & MMU_I)) {
		/* propably a 020 cas fault */
		...
	} else if (mmusr & (MMU_B|MMU_L|MMU_S)) {
		...
	} else {
		...
	}

Seems to me that everything after the first else clause is dead code.

Finn
