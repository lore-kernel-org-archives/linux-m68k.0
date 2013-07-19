From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Atari 4 MiB kernel limit
Date: Fri, 19 Jul 2013 17:49:15 +0200
Message-ID: <CAMuHMdXh9NHMeqVck23aXco0m1N9qHkB7L9vAd7Rva4mh1ePcQ@mail.gmail.com>
References: <alpine.DEB.2.10.1307191630490.14572@tglase.lan.tarent.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:38967 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752643Ab3GSPtP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 19 Jul 2013 11:49:15 -0400
Received: by mail-pd0-f173.google.com with SMTP id v14so4400689pde.32
        for <linux-m68k@vger.kernel.org>; Fri, 19 Jul 2013 08:49:15 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1307191630490.14572@tglase.lan.tarent.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Fri, Jul 19, 2013 at 4:31 PM, Thorsten Glaser <tg@mirbsd.de> wrote:
> does the limit apply to just the kernel image
> (plus some margin) or is the initrd also subject
> to that restriction?

That's a very good question ;-)

The 4 MiB limit only applies to early startup, in arch/m68k/kernel/head.S.
Initrd is accessed later, in arch/m68k/kernel/setup_mm.c, so I'd expect it to
not fall under the limit.

Of course, better try it to be sure ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
