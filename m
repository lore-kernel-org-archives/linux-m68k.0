From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Atari 4 MiB kernel limit
Date: Fri, 19 Jul 2013 22:30:10 +0200
Message-ID: <CAMuHMdW8eyR=mnAp58mN4Pv7NMamM=wqAuP7DcVMCXw-0-4xvA@mail.gmail.com>
References: <alpine.DEB.2.10.1307191630490.14572@tglase.lan.tarent.de>
	<CAMuHMdXh9NHMeqVck23aXco0m1N9qHkB7L9vAd7Rva4mh1ePcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:46335 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751287Ab3GSUaK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 19 Jul 2013 16:30:10 -0400
Received: by mail-pa0-f43.google.com with SMTP id hz11so4798447pad.30
        for <linux-m68k@vger.kernel.org>; Fri, 19 Jul 2013 13:30:10 -0700 (PDT)
In-Reply-To: <CAMuHMdXh9NHMeqVck23aXco0m1N9qHkB7L9vAd7Rva4mh1ePcQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Fri, Jul 19, 2013 at 5:49 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Fri, Jul 19, 2013 at 4:31 PM, Thorsten Glaser <tg@mirbsd.de> wrote:
>> does the limit apply to just the kernel image
>> (plus some margin) or is the initrd also subject
>> to that restriction?
>
> That's a very good question ;-)
>
> The 4 MiB limit only applies to early startup, in arch/m68k/kernel/head.S.
> Initrd is accessed later, in arch/m68k/kernel/setup_mm.c, so I'd expect it to
> not fall under the limit.
>
> Of course, better try it to be sure ;-)

On ARAnyM, I could boot a 4 MiB initrd (note that ARAnyM doesn't seem to
support gzipped ramdisks!), created by appending zeroes to the good old
filesys-ELF-2.0.x-1400K-2, and running resize2fs.

It even worked with a 32 MiB initrd, after increasing xx to 32768.

Haven't tried with the Amiga yet.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
