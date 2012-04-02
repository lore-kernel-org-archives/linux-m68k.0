From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 1/5] m68k/atari: EtherNAT - change number of Atari
 interrupts to make room for EtherNAT interrupts
Date: Tue, 3 Apr 2012 10:29:29 +1200
Message-ID: <CAOmrzkJGonrmY4jztegh3JqZRW17H1sF7en765=Em+_G7SodXw@mail.gmail.com>
References: <1327085843-6980-1-git-send-email-geert@linux-m68k.org>
	<4F4B2BB6.900@gmail.com>
	<4F77C245.5090002@gmail.com>
	<CAMuHMdUm8Mot6ioYemQVacCZxgYKBGBDGUz2X4Xh_zJf_ZPgKQ@mail.gmail.com>
	<CAOmrzkJqkLC=dhsY0AUduv3Mm7PVmbtHrsjgS6v=V14eXuuA8g@mail.gmail.com>
	<CAMuHMdXnVU2ZuCVLWA27RaCm2COi_AdDE9F2hj=qBGQLB6KxuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:49888 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753018Ab2DBW3a convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 2 Apr 2012 18:29:30 -0400
Received: by dake40 with SMTP id e40so2955143dak.11
        for <linux-m68k@vger.kernel.org>; Mon, 02 Apr 2012 15:29:29 -0700 (PDT)
In-Reply-To: <CAMuHMdXnVU2ZuCVLWA27RaCm2COi_AdDE9F2hj=qBGQLB6KxuA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Hi Geert,

>> I'm uncertain whether the complicated definition of NUM_ATARI_SOURCE=
S
>> is needed anymore - are the IRQ_VECTOR_TO_SOURCE and
>> IRQ_SOURCE_TO_VECTOR macros still used anywhere?
>
> Only the latter:
>
> drivers/net/ethernet/amd/atarilance.c: =A0 =A0 =A0 =A0 =A0IO->ivec =3D
> IRQ_SOURCE_TO_VECTOR(dev->irq);
> drivers/net/ethernet/amd/atarilance.c: =A0 =A0 =A0 =A0 =A0*RIEBL_IVEC=
_ADDR =3D
> IRQ_SOURCE_TO_VECTOR(dev->irq);

OK, so we'll need to retain that.

The definition of  NUM_ATARI_SOURCES will need to be changed again;
we'd best hardcode it to 140:
=46or one, allowing for 152 VME interrupts will exceed the boundaries o=
f
the allocated bitmap (i.e. trash other memory).
We won't need the full 200 either (I seem to have got the EtherNAT
source numbers wrong in my earlier patch).

I'll send patches for these fixes later.

Cheers,

  Michael
