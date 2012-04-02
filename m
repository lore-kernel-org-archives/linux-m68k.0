From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/5] m68k/atari: EtherNAT - change number of Atari
 interrupts to make room for EtherNAT interrupts
Date: Mon, 2 Apr 2012 09:35:53 +0200
Message-ID: <CAMuHMdXnVU2ZuCVLWA27RaCm2COi_AdDE9F2hj=qBGQLB6KxuA@mail.gmail.com>
References: <1327085843-6980-1-git-send-email-geert@linux-m68k.org>
	<4F4B2BB6.900@gmail.com>
	<4F77C245.5090002@gmail.com>
	<CAMuHMdUm8Mot6ioYemQVacCZxgYKBGBDGUz2X4Xh_zJf_ZPgKQ@mail.gmail.com>
	<CAOmrzkJqkLC=dhsY0AUduv3Mm7PVmbtHrsjgS6v=V14eXuuA8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:56039 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751040Ab2DBHfx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 2 Apr 2012 03:35:53 -0400
Received: by mail-iy0-f174.google.com with SMTP id z16so3755962iag.19
        for <linux-m68k@vger.kernel.org>; Mon, 02 Apr 2012 00:35:53 -0700 (PDT)
In-Reply-To: <CAOmrzkJqkLC=dhsY0AUduv3Mm7PVmbtHrsjgS6v=V14eXuuA8g@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Hi Michael,

On Mon, Apr 2, 2012 at 00:44, Michael Schmitz <schmitzmic@googlemail.co=
m> wrote:
>> Part 1 (this): make room for the EtherNAT interrupts - they appear a=
t
>>> vectors 0xc3 (USB ISP1160) and 0xc4 (SMC91C111)
>>
>> Is there any specific reason you cannot use atari_register_vme_int()=
, like
>> drivers/net/ethernet/amd/atarilance.c, to avoid increasing NR_IRQS?
>
> From what I read in atari_register_vme_int(), it returns the next fre=
e
> VME interrupt starting at VME_SOURCE_BASE. This required the vector
> number to be programmable in the correspomding VME device.
>
> To the best of my knowledge, vector numbers are fixed (0xc3 and 0xc4)
> for the EtherNAT.

OK. If they are fixed, there's nothing we can do about that.

> I definitely need to increase NR_IRQS - it might be better to leave
> VME_MAX_SOURCES unchanged and change the NUM_ATARI_SOURCES definition
> above instead.
>
> I'm uncertain whether the complicated definition of NUM_ATARI_SOURCES
> is needed anymore - are the IRQ_VECTOR_TO_SOURCE and
> IRQ_SOURCE_TO_VECTOR macros still used anywhere?

Only the latter:

drivers/net/ethernet/amd/atarilance.c:          IO->ivec =3D
IRQ_SOURCE_TO_VECTOR(dev->irq);
drivers/net/ethernet/amd/atarilance.c:          *RIEBL_IVEC_ADDR =3D
IRQ_SOURCE_TO_VECTOR(dev->irq);


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
