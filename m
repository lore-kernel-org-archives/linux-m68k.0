From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: PROBLEM: Unselectable code in ./arch/m68k/sun3/prom/init.c
Date: Wed, 20 Jun 2012 16:04:19 +0200
Message-ID: <CAMuHMdWva+hYF=TU0SwTuwgyoKK62fQ8pP=miZF-2gH7U_Ou7w@mail.gmail.com>
References: <4FD65247.4000000@uwaterloo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:45668 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751950Ab2FTOEU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Jun 2012 10:04:20 -0400
Received: by yhmm54 with SMTP id m54so5781984yhm.19
        for <linux-m68k@vger.kernel.org>; Wed, 20 Jun 2012 07:04:19 -0700 (PDT)
In-Reply-To: <4FD65247.4000000@uwaterloo.ca>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sarah Nadi <snadi@uwaterloo.ca>
Cc: linux-m68k@vger.kernel.org, Sam Creasey <sammy@sammy.net>

Hi Sarah,

On Mon, Jun 11, 2012 at 10:17 PM, Sarah Nadi <snadi@uwaterloo.ca> wrote=
:
> Summary: Code block dead in ./arch/m68k/sun3/prom/init.c because file=
 only
> gets compiled if CONFIG_SUN3 is enabled.
>
> Problem Description:
> Code block below in file ./arch/m68k/sun3/prom/init.c is only compile=
d if
> CONFIG_SUN3 is not enabled, while the file is compiled if CONFIG_SUN3=
 is
> enabled which means that this code block is dead. Seems that this blo=
ck has
> always been around, and still exists in the latest release.
>
> In ./arch/m68k/Makefile: core-$(CONFIG_SUN3)=C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 +=3D arch/m68k/sun3/
> arch/m68k/sun3/prom/
> In ./arch/m68k/sun3/prom/init.c :
>
> #ifndef CONFIG_SUN3
> =C2=A0=C2=A0=C2=A0 switch(romvec->pv_romvers) {

> #endif
>
> Should this code be removed, or should the condition be changed?

Thanks! This code was copied from SPARC, but isn't relevant for the sup=
ported
Sun-3 platforms. I'll remove it.

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
