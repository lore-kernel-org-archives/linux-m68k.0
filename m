From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Boot crash on 68030, was Re: [PATCH][M68K] implement futex.h to
 support userspace robust futexes and PI mutexes
Date: Tue, 10 Dec 2013 11:12:50 +0100
Message-ID: <CAMuHMdVB3w3JpNSrdZXPk+xrDXyhm-CgDHX5XW_1CUKn8pQmtA@mail.gmail.com>
References: <20793.61385.652975.797741@pilspetsen.it.uu.se>
	<alpine.LNX.2.00.1312101000250.10258@nippy.intranet>
	<87iouxzju3.fsf@igel.home>
	<alpine.LNX.2.00.1312101141250.17926@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:52083 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753187Ab3LJKMu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 10 Dec 2013 05:12:50 -0500
Received: by mail-pd0-f177.google.com with SMTP id q10so6995130pdj.22
        for <linux-m68k@vger.kernel.org>; Tue, 10 Dec 2013 02:12:50 -0800 (PST)
In-Reply-To: <alpine.LNX.2.00.1312101141250.17926@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Mikael Pettersson <mikpelinux@gmail.com>

On Tue, Dec 10, 2013 at 1:54 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> futex_init()
>   cmpxchg_futex_value_locked(&curval, NULL, 0, 0)
>     pagefault_disable();
>     futex_atomic_cmpxchg_inatomic(curval, NULL, 0, 0)
>       get_user(val, NULL)
>
> That is, futex_init() passes a NULL pointer expecting it to fault, as
> described in the comments in kernel/futex.c. Clearly the fault is not
> expected to be fatal.

I added some debugging (basically enabling DEBUG in
arch/m68k/kernel/traps.c, but dependent on a flag that's set to 1 in
futex_init(), and a check in do_page_fault()), and ran it on ARAnyM,
to get a grasp of what's happening on '040:

futex_atomic_cmpxchg_inatomic:20
*** Bus Error *** Format is 7
ssw=0x505, fa=0x0
wb1s=0x0, wb2s=0x0, wb3s=0x0
wb2a=0, wb3a=0, wb2d=0, wb3d=0
mmusr = 800
in_atomic() = 1
mm =   (null)
no_context
send_fault_sig:   (null),7,0
do_page_fault() !=0
.. disabling wb2

Summarized: access_error040() calls do_page_fault(), which just sends
SIGBUS (7), as in_atomic() is 1.

> Data read fault at 0x00000000 in Super Data (pc=0x3afec)
> BAD KERNEL BUSERR

On '030, the relevant code is:

    if (mmusr & (MMU_I | MMU_WP)) {
            if (ssw & 4) {
                    printk("Data %s fault at %#010lx in %s (pc=%#lx)\n",
                           ssw & RW ? "read" : "write",
                           fp->un.fmtb.daddr,
                           space_names[ssw & DFC], fp->ptregs.pc);
                    goto buserr;
            }
            /* Don't try to do anything further if an exception was
               handled. */
            if (do_page_fault (&fp->ptregs, addr, errorcode) < 0)
                    return;

But we never get to do_page_fault(), as ssw = 5 (SUPER_DATA).

The "if (ssw & 4) { ... }" chunk was added in commit
e48d483d581278fae02a5fffeba2b1fef47be4d4 (from full-history-linux):

Author: Andrew Morton <akpm@osdl.org>
Date:   Sun Jan 18 18:32:30 2004 -0800

    [PATCH] M68k RMW accesses

    From: Geert Uytterhoeven <geert@linux-m68k.org>

    M68k: Avoid bus fault for certain RMW accesses (from Roman Zippel)

Which originates from a CVS commit in 2003, based on v2 (v1 didn't have
the chunk) of a patch in the thread "RMW instructions on
MC68020/MC68851 combo..." between Kars and Roman Z.

I guess this case will work(TM) if you remove that chunk again?
But what are the other implications of that?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
