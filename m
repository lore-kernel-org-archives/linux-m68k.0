From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Aranym, more than 244MB FastRAM, garbled display
Date: Thu, 7 Oct 2010 10:22:46 +0200
Message-ID: <AANLkTin+_c=Luvns2MYkVhBksB8vD3reDh8W6a8Bje2o@mail.gmail.com>
References: <alpine.LNX.2.00.1010011728270.4788@halbrend.uninett.no>
	<m2tyl5u9hu.fsf@igel.home>
	<alpine.LNX.2.00.1010011908550.4788@halbrend.uninett.no>
	<Pine.BSM.4.64L.1010041947160.3776@herc.mirbsd.org>
	<AANLkTinq7CXPpYVfAYhgH9ea1FQs_f+AhYsU1-+ZdUx+@mail.gmail.com>
	<Pine.BSM.4.64L.1010060910520.21623@herc.mirbsd.org>
	<AANLkTi=ZrDoFPxFNZ3OKurvcrBuN3fS0gTvAeYpLQqCi@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:62459 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760183Ab0JGIWz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 7 Oct 2010 04:22:55 -0400
Received: by iwn9 with SMTP id 9so538182iwn.19
        for <linux-m68k@vger.kernel.org>; Thu, 07 Oct 2010 01:22:55 -0700 (PDT)
In-Reply-To: <AANLkTi=ZrDoFPxFNZ3OKurvcrBuN3fS0gTvAeYpLQqCi@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Thu, Oct 7, 2010 at 09:47, Michael Schmitz <schmitzmic@googlemail.co=
m> wrote:
> BTW: browsing Geert's git tree online, I noticed that my old patch to
> reserve some of ST-RAM for use by atafb etc. has never made it into

That's correct.

> git. I'll clean that up and resubmit unless Geert has objections.

I'm blocked on this follow-up you sent me afterwards (without CC to the=
 list):

| Plus there's still a bug in stram_free_block, let's see if you can sp=
ot it :-)

> See: http://marc.info/?l=3Dlinux-m68k&m=3D124072556805722&w=3D2
>
> The amount of ST-RAM reserved is hardcoded and might need to be incre=
ased.

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
