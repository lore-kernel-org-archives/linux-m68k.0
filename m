From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: atafb and X/fbdev
Date: Sat, 14 Jul 2012 10:44:07 +0200
Message-ID: <CAMuHMdXG+TiuGi_chhx9dVJH+r4+4Lbj8BJDUCY0d_DH9zFPvA@mail.gmail.com>
References: <Pine.BSM.4.64L.1207062301330.12225@herc.mirbsd.org>
	<4FF7AFD7.8000005@biophys.uni-duesseldorf.de>
	<Pine.BSM.4.64L.1207070751590.7146@herc.mirbsd.org>
	<CAMuHMdW1Gigu0642GuXHGyOmghDLkndboTKyGt=z=zDgWcNWFw@mail.gmail.com>
	<Pine.BSM.4.64L.1207070912580.7146@herc.mirbsd.org>
	<Pine.BSM.4.64L.1207071537230.13285@herc.mirbsd.org>
	<4FF90ECF.2090001@gmail.com>
	<CAOmrzk+uSw+o1rzoZP5Xz5usFwYm1Fc8-0-dJRq+uh6dV4La8Q@mail.gmail.com>
	<5000EAB2.4080900@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:39911 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757878Ab2GNIoI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 14 Jul 2012 04:44:08 -0400
Received: by obbuo13 with SMTP id uo13so6161684obb.19
        for <linux-m68k@vger.kernel.org>; Sat, 14 Jul 2012 01:44:08 -0700 (PDT)
In-Reply-To: <5000EAB2.4080900@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org, debian m68k <debian-68k@lists.debian.org>

On Sat, Jul 14, 2012 at 5:42 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>> If all else fails I'll hack a truecolor command line option into atafb :-)
>
> I've played with the framebuffer timing calculations a bit - 16 bpp appears
> to require unreasonably
> low hsync frequency in order to keep within the available video bandwidth of
> 32 MHz.

For 640x480 that's true.

For 320x240, it should work. I definitely used a hicolor mode on ARAnyM when
atafb was revived.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
