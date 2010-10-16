From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for !CONFIG_ISA
Date: Sat, 16 Oct 2010 19:12:21 +0200
Message-ID: <AANLkTikRzgXSwT34AoGhpSHqMSUrS9-3SF8aufSfqzMv@mail.gmail.com>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org>
	<Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:59328 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751768Ab0JPRMX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 16 Oct 2010 13:12:23 -0400
Received: by fxm4 with SMTP id 4so1216673fxm.19
        for <linux-m68k@vger.kernel.org>; Sat, 16 Oct 2010 10:12:22 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@debian.org>
Cc: linux-m68k@vger.kernel.org

On Sun, Oct 3, 2010 at 20:48, Thorsten Glaser <tg@debian.org> wrote:
> On m68k, I/O macros like inb() outw() etc. are only defined to
> something useful if CONFIG_ISA is set; dummies are in place if
> not, but four macros were missing from the !CONFIG_ISA case.
> Adding these makes some drivers, such as speakup, compile again.
> The patch was made against Debian=E2=80=99s linux-2.6_2.6.32-24, but
> applies cleanly on linux-m68k master.

Thanks, applied!

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
