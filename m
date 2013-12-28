From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Linux/m68k config again
Date: Sat, 28 Dec 2013 20:45:58 +0100
Message-ID: <CAMuHMdVbzcyfHhdLBrdQgH-8T7Ofsmc0EXNodMZioDPp0w4OmA@mail.gmail.com>
References: <Pine.BSM.4.64L.1311211444360.11120@herc.mirbsd.org>
	<Pine.BSM.4.64L.1312231011210.24287@herc.mirbsd.org>
	<alpine.LNX.2.00.1312232231090.18343@nippy.intranet>
	<Pine.BSM.4.64L.1312231645470.2621@herc.mirbsd.org>
	<alpine.LNX.2.00.1312240849320.18824@nippy.intranet>
	<Pine.BSM.4.64L.1312232208350.2621@herc.mirbsd.org>
	<alpine.LNX.2.00.1312241042520.20898@nippy.intranet>
	<Pine.BSM.4.64L.1312241341210.29139@herc.mirbsd.org>
	<alpine.LNX.2.00.1312281358180.17160@nippy.intranet>
	<Pine.BSM.4.64L.1312281257570.21577@herc.mirbsd.org>
	<CAMuHMdXaXXaLRftPXfoVwbprJbFJSUjKeOkxFx7yZfWxebcYfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:44310 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750711Ab3L1Tp7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 28 Dec 2013 14:45:59 -0500
Received: by mail-pb0-f43.google.com with SMTP id rq2so10296551pbb.2
        for <linux-m68k@vger.kernel.org>; Sat, 28 Dec 2013 11:45:58 -0800 (PST)
In-Reply-To: <CAMuHMdXaXXaLRftPXfoVwbprJbFJSUjKeOkxFx7yZfWxebcYfQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Finn Thain <fthain@telegraphics.com.au>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sat, Dec 28, 2013 at 8:11 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Sorry, I should spend a bit more time updating upstream's defconfigs.

I updated my defconfig branch, cfr.
https://git.kernel.org/cgit/linux/kernel/git/geert/linux-m68k.git/log/?h=defconfig
(waiting for the mirror to catch up, ... ah it's there):

8ab14ab4c65b m68k: Update defconfigs for v3.13-rc1
63dde0ea0298 m68k: Update defconfigs for v3.12-rc1
00c2b18d5b98 m68k: Update defconfigs for v3.11
c36a061ef595 m68k: Update defconfigs for v3.10
ab824d77934f m68k/defconfig: Disable /sbin/hotplug fork-bomb by default
c6188d0f5756 m68k/defconfig: Use ext4 for ext2/ext3 file systems
51b9310f0a33 m68k/defconfig: Make NFS_V4 modular instead of builtin

The first two (i.e. the 2 at the bottom) I had already queued up for 3.14.

Anything missing/wrong/dangerous/suboptimal/...?

Yes, multi-defconfig still gives you kernels larger than 4 MiB, i.e. unbootable.
Suggestions for improvement are welcome. Switching to initramfs and
everything modular is not an option here.

Atari_defconfig has USB_HID and USB_STORAGE for EtherNAT and
NetUSBee, while multi_defconfig hasn't. I don't want to pollute everybody
with USB ;-)
Apart from that, multi_defconfig should be a superset of all other configs
(except Sun-3), as usual, but I didn't check.

Note that minimal configs are generated from the upstream tree, not from
the m68k tree.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
