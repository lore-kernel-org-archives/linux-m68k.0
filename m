From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: boot-params tree build failure
Date: Wed, 17 Dec 2008 09:18:32 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0812170915400.29433@anakin>
References: <20081217165557.b4898a4b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from winston.telenet-ops.be ([195.130.137.75]:34661 "EHLO
	winston.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752634AbYLQISh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 17 Dec 2008 03:18:37 -0500
In-Reply-To: <20081217165557.b4898a4b.sfr@canb.auug.org.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, 17 Dec 2008, Stephen Rothwell wrote:
> The build of next-20081216 (m68k defconfig) failed like this:
> 
> arch/m68k/kernel/setup.c:230: error: conflicting types for '_end'
> arch/m68k/kernel/setup.c:215: error: previous declaration of '_end' was here
> 
> Caused by commit 0de5c2d9f02d2018fd671ca1015432dffa5eb338 ("param:
> arch_get_boot_command_line()") from the poot-params tree.

This is due to the existing

    extern int _etext, _edata, _end;

in and the newly added

    extern char _end[];

to arch/m68k/kernel/setup.c.

As these are already declared in asm-generic/sections.h (which is used by
asm-m68k/sections.h), I'll switch arch/m68k/kernel/setup.c to using them.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
