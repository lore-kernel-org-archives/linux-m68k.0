From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: I/O macros redefined, inconsistent across m68k machdep headers
Date: Sun, 9 Jun 2013 14:44:41 +0200
Message-ID: <CAMuHMdVD5cP5kf8Fw7FA-Xi3T1TfRQEX2O7zv9bfjyrOODGFFg@mail.gmail.com>
References: <loom.20130511T171757-995@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:42718 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753818Ab3FIMol convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 9 Jun 2013 08:44:41 -0400
Received: by mail-pb0-f51.google.com with SMTP id um15so6283653pbc.24
        for <linux-m68k@vger.kernel.org>; Sun, 09 Jun 2013 05:44:41 -0700 (PDT)
In-Reply-To: <loom.20130511T171757-995@post.gmane.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@debian.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Sat, May 11, 2013 at 5:19 PM, Thorsten Glaser <tg@debian.org> wrote:
>   CC [M]  drivers/parport/parport_pc.o
> In file included from /tmp/buildd/linux-3.8.12/drivers/parport/
> parport_pc.c:67:0:
> /tmp/buildd/linux-3.8.12/arch/m68k/include/asm/parport.h:14:0: warnin=
g:
> "insl" redefined [enabled by default]
> /tmp/buildd/linux-3.8.12/arch/m68k/include/asm/io_mm.h:280:0: note: t=
his is
> the location of the previous definition
> /tmp/buildd/linux-3.8.12/arch/m68k/include/asm/parport.h:15:0: warnin=
g:
> "outsl" redefined [enabled by default]
> /tmp/buildd/linux-3.8.12/arch/m68k/include/asm/io_mm.h:283:0: note: t=
his is
> the location of the previous definition
> In file included from /tmp/buildd/linux-3.8.12/drivers/parport/
> parport_pc.c:67:0:
> /tmp/buildd/linux-3.8.12/arch/m68k/include/asm/parport.h:14:0: warnin=
g:
> "insl" redefined [enabled by default]
> /tmp/buildd/linux-3.8.12/arch/m68k/include/asm/io_mm.h:280:0: note: t=
his is
> the location of the previous definition
> /tmp/buildd/linux-3.8.12/arch/m68k/include/asm/parport.h:15:0: warnin=
g:
> "outsl" redefined [enabled by default]
> /tmp/buildd/linux-3.8.12/arch/m68k/include/asm/io_mm.h:283:0:this is =
the
> location of the previous definition
>
>
> This is from building the amiga flavour (first of six!) of the Debian
> unstable Linux kernel source package. We=E2=80=99ll have the new kern=
els in

I only have this warning in builds that enable as much as possible (e.g=
=2E
allmodconfig).

PARPORT_PC depends on (!M68K || ISA).
ISA depends on Q40 || AMIGA_PCMCIA.

However, I have CONFIG_PARPORT_PC=3Dn in amiga_defconfig and
multi_defconfig, and CONFIG_PARPORT=3Dn in q40_defconfig.
Hence I don't see it elsewhere.

As we don't have support for bridgeboards on Amiga, we probably don't
need CONFIG_PARPORT_PC on Amiga. Unless someone is using it
with a PCMCIA parallel port adapter?

Probably CONFIG_PARPORT and CONFIG_PARPORT_PC should be
enabled in q40_defconfig (and thus multi_defconfig) though, to accommod=
ate
ISA multi-I/O boards.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
