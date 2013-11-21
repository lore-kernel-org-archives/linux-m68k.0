From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Debian kernel regression, was Re: Modernizing a Macintosh LC
 III
Date: Fri, 22 Nov 2013 09:02:45 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1311220823360.25790@nippy.intranet>
References: <mcII9-2Ep-5@gated-at.bofh.it> <mdhPA-3Y1-15@gated-at.bofh.it> <52824A09.3060906@gmail.com> <CAMuHMdUJTx3pRzW8xewbhq+yow5CbXNKix2Za5kUqP5m7kv-Dg@mail.gmail.com> <Pine.BSM.4.64L.1311121708580.2989@herc.mirbsd.org> <5282DE78.2000109@iamscott.net>
 <alpine.LNX.2.00.1311170913380.6636@nippy.intranet> <5289723D.5090509@iamscott.net> <CAMuHMdUz=cJK7VTgvL3-4BWOqK-kP4ge5LD6v1snsRtkL3aNiw@mail.gmail.com> <1f16cd3b6538d850d32c3f8274fd8688@biophys.uni-duesseldorf.de> <alpine.LNX.2.00.1311192205430.3217@nippy.intranet>
 <89f415777a8134f27561668e8fb56d65@biophys.uni-duesseldorf.de> <alpine.LNX.2.00.1311212023220.17773@nippy.intranet> <CAMuHMdXN2CZqNorxPmHqw3cpFqBtfX-GOCqLcBpJ5wKV5DByPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:55496 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754338Ab3KUWCu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 21 Nov 2013 17:02:50 -0500
In-Reply-To: <CAMuHMdXN2CZqNorxPmHqw3cpFqBtfX-GOCqLcBpJ5wKV5DByPA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Scott Holder <scott@iamscott.net>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Thu, 21 Nov 2013, Geert Uytterhoeven wrote:

> head.S has this "interesting" piece of code, which plays foul of
> multi-platform kernels:
> 
> #ifdef CONFIG_MAC
> 
> #include <asm/machw.h>
> 
> #ifdef CONFIG_FRAMEBUFFER_CONSOLE
> #define CONSOLE
> #define CONSOLE_PENGUIN
> #endif
> 
> #ifdef CONFIG_EARLY_PRINTK
> #define SERIAL_DEBUG
> #else
> #undef SERIAL_DEBUG
> #endif
> 
> #else /* !CONFIG_MAC */
> 
> #define SERIAL_DEBUG
> 
> #endif /* !CONFIG_MAC */
> 
> As CONFIG_MAC=y, and CONFIG_EARLY_PRINTK=n, SERIAL_DEBUG
> is not defined, and no one gets early serial debug output :-(
> Enabling CONFIG_EARLY_PRINTK fixes this.
> Is there a good reason for this construct?

Not if there's a good reason for multi-platform kernels. When I changed 
that logic, they weren't used except for build testing AFAIK.

Here's the relevant commit: 
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/arch/m68k/kernel/head.S?id=93edd023a7de1ea4fe6e5de631982b96156eef03

To be honest, the old logic never made a whole lot of sense to me.

>   - Should it check for MACH_MAC_ONLY instead?
>   - Can we just unconditionally enable SERIAL_DEBUG?

If multi-platform kernels are a good idea, then so is multi-platform 
config logic.

IMHO all platforms should respond to these obscure buried macros in the 
same way. That's why I eliminated MAC_SERIAL_DEBUG. (Certainly the new 
code in that commit would also benefit Atari machines with Zilog SCC.)

The comments make it clear that the author(s) of that file expected 
CONSOLE to be used cross-platform (though this never eventuated). My patch 
was an attempt to make SERIAL_CONSOLE work cross-platform also.

Moreover, the code you cited,

#ifdef CONFIG_EARLY_PRINTK
#define SERIAL_DEBUG
#else
#undef SERIAL_DEBUG
#endif

was written in the hope that CONFIG_EARLY_PRINTK would eventually be 
embraced as a better mechanism than the obscure SERIAL_DEBUG and CONSOLE 
macros. I guess that never eventuated either.

> Surprise 2: Instead of a deadly non-Mac driver, I found a deadly Mac driver.
> When passing "debug=ser", it crashes with:

The __pmz_startup() crash could be expected regardless of "debug=ser", no? 
I wonder why no-one else reported it?

> Unable to handle kernel NULL pointer dereference at virtual address   (null)
> Oops: 00000000
> PC: [<0013ad28>] __pmz_startup+0x32/0x2a0

...

> 
> drivers/tty/serial/pmac_zilog.c needs some MACH_IS_MAC() tests.
> 

Yes (given that Debian now ships multi-platform kernels). I'll send a 
patch.

Finn
