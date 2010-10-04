From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for !CONFIG_ISA
Date: Mon, 4 Oct 2010 16:01:06 +0200
Message-ID: <AANLkTim_gdMc5scQm-oAD6Jowv6q=W0bK=rkjZUmAgLd@mail.gmail.com>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org>
	<Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org>
	<alpine.OSX.2.00.1010041149030.285@localhost>
	<Pine.BSM.4.64L.1010040738160.22274@herc.mirbsd.org>
	<alpine.OSX.2.00.1010041943530.285@localhost>
	<Pine.BSM.4.64L.1010040906400.22591@herc.mirbsd.org>
	<alpine.OSX.2.00.1010042115260.285@localhost>
	<AANLkTi=TZBpWS1_ybct=fHeZ9N9AZE_+UoJnwM0HxanM@mail.gmail.com>
	<Pine.BSM.4.64L.1010041338370.24518@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:59124 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753315Ab0JDOBN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Oct 2010 10:01:13 -0400
Received: by iwn5 with SMTP id 5so6954953iwn.19
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 07:01:13 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1010041338370.24518@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

On Mon, Oct 4, 2010 at 15:40, Thorsten Glaser <tg@mirbsd.de> wrote:
> Geert Uytterhoeven dixit:
>
>>I don't think it makes sense to build staging drivers on Debian/m68k.
>
> Yes. Tell that to *them*, though.
>
>>So can't you default to CONFIG_STAGING=3Dn?
>
> No *I* can=E2=80=99t.
>
> Besides, this still looks like an obvious omission to me.
> Look a few lines above, the macros are defined in the other
> case (CONFIG_ISA defined).

I'm not questioning they're missing.

I am questioning a distro building staging drivers for m68k.
IMHO it's a waste of CPU cycles (especially for native builds).

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
