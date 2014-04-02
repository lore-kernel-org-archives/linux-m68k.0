From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Getting stuck during boot on a 68VZ328 (DragonBallVZ).
Date: Wed, 2 Apr 2014 16:06:35 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1404021529450.9604@nippy.intranet>
References: <CAO64nm7D_cfy95rdDasH9jeHhXRzLpMMpniK-BKxCsqZsn7yZw@mail.gmail.com> <CAO64nm6s8SYRFpnd1yMV5UsvM7JetkzkYgWMiRfNQyT93+PuGQ@mail.gmail.com> <CAO64nm6Z0rOhiUYu5nqeZuVvfz0-9wy8D02gj_82nXRdi0NECw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:53235 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755978AbaDBFG4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 2 Apr 2014 01:06:56 -0400
In-Reply-To: <CAO64nm6Z0rOhiUYu5nqeZuVvfz0-9wy8D02gj_82nXRdi0NECw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Daniel Palmer <danieruru@gmail.com>
Cc: linux-m68k@vger.kernel.org


On Wed, 2 Apr 2014, Daniel Palmer wrote:

> I now have this mostly working.

Well done!

> - For the 68[EZ|VZ|SZ]328 you will need to fix up the PLL settings and
> do the fixes from Luis Alves at
> https://github.com/ljalves/alce68k/commit/4ef1df317c7acb6dfcd0fe9e87be9b4a60b141a4

It would be nice if that work was pushed upstream. Of course, there are 
some hurdles to overcome (see Documentation/SubmittingPatches).

> If your chip isn't running at 16MHz you have to fix up the serial driver 
> as it seems to assume a clock of 16MHz for it's baud rate setting.

It's hard to comment without seeing patches, but Kconfig might help here.

> 
> To make life easier you can easily add early printk support with a
> routine like this:
> 
> ENTRY(vzads_early_print)
> ... Look at how it is wired up for the mac to wire it up.

If my multi-platform earlyprintk patch gets merged, you could just call 
that entry point "debug_cons_nputs". You wouldn't need to do anything more 
to wire it up.

> I added my own handlers and added some code to decode the 68000 stack 
> frames for bus and address exceptions and found that the m68k-uclinux 
> target in newer GCC versions is broken for 68000. There is a stale bug 
> open for it that'll probably never be fixed.

I'd assume that GCC developers don't have the hardware. But I've found 
that they are generally inclined to help. You'd need to build and test 
your patches though. Crosstool-NG or OpenEmbedded can help with this.

http://buildroot.uclibc.org/
https://www.kernel.org/pub/tools/crosstool/

-- 
