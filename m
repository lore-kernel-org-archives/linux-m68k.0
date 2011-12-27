From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 33/35] m68k: do not use m68k startup or interrupt code for
 ColdFire CPU's
Date: Tue, 27 Dec 2011 19:30:25 +0100
Message-ID: <CAMuHMdW6Yh33i2H+V_A4o846TNyeDrbDbtwv17=Z794PfCn7vg@mail.gmail.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
	<1324610148-20666-34-git-send-email-gerg@snapgear.com>
	<CAMuHMdX00Q9PFWPXRBRyMCFJgXaCmBtP7RLB-R+mU58iPHLwCA@mail.gmail.com>
	<4EF9B8FC.7080206@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:45453 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751121Ab1L0Sa0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 27 Dec 2011 13:30:26 -0500
Received: by wibhm6 with SMTP id hm6so5101965wib.19
        for <linux-m68k@vger.kernel.org>; Tue, 27 Dec 2011 10:30:25 -0800 (PST)
In-Reply-To: <4EF9B8FC.7080206@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Tue, Dec 27, 2011 at 13:24, Greg Ungerer <gerg@snapgear.com> wrote:
>>> =C2=A0extra-$(CONFIG_MMU) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
:=3D head.o
>>> =C2=A0extra-$(CONFIG_SUN3) =C2=A0 :=3D sun3-head.o
>>> +extra-$(CONFIG_COLDFIRE) =C2=A0 =C2=A0 =C2=A0 :=3D
>>
>> Why do you need the line above?
>
> That is to avoid using a "#ifndef CONFIG_COLDFIRE" around these.
> This entry clears out extra-y for the case when both CONFIG_MMU
> and CONFIG_COLDFIRE are set.

Ooh, that's ugly, and easily overlooked (I missed it).
So you don't want head.o for Coldfire. What about

extra-$(CONFIG_MMU_MOTOROLA) :=3D head.o
extra-$(CONFIG_SUN3)   :=3D sun3-head.o

?

But since head.o is not really about MMU or not, but about the machine,
perhaps it should be explicitly written as

extra-$(CONFIG_AMIGA) :=3D head.o
extra-$(CONFIG_ATARI) :=3D head.o
=2E..
extra-$(CONFIG_SUN3X) :=3D head.o

?

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
