From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 9/11] Atari: add ndelay() (used by isp116x-hcd)
Date: Wed, 6 Jun 2012 14:13:01 +0200
Message-ID: <CAMuHMdXdsAWCxUpsan9OdV-Lb4Q8UVVUbwHO-kXD8ohkNwEgAQ@mail.gmail.com>
References: <E1SXMIc-0002Y2-NB@zirkon.biophys.uni-duesseldorf.de>
	<CAMuHMdV=U_6i=XaOUVC9rwy1WWbMDSF3WjRWDtLSG-6p+ecR2A@mail.gmail.com>
	<CAOmrzkLy-noQ=8xBifHcVTTskBJ7wLD6up24Hx3hT=QY6rc+ZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:38803 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751243Ab2FFMNC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Jun 2012 08:13:02 -0400
Received: by yenm10 with SMTP id m10so4861644yen.19
        for <linux-m68k@vger.kernel.org>; Wed, 06 Jun 2012 05:13:02 -0700 (PDT)
In-Reply-To: <CAOmrzkLy-noQ=8xBifHcVTTskBJ7wLD6up24Hx3hT=QY6rc+ZQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>, linux-m68k@vger.kernel.org

On Wed, Jun 6, 2012 at 10:22 AM, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
>>> +#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
>>> +/*
>>> + * The simpler m68k and ColdFire processors do not have a 32*32->6=
4
>>> + * multiply instruction. So we need to handle them a little differ=
ently.
>>> + * We use a bit of shifting and a single 32*32->32 multiply to get=
 close.
>>> + * This is a macro so that the const version can factor out the fi=
rst
>>> + * multiply and shift.
>>> + */
>>> +#define =C2=A0 =C2=A0 =C2=A0 =C2=A0HZSCALE =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (268435456 / (1000000 / HZ))
>>> +
>>> +#define ndelay(n) __delay( DIV_ROUND_UP( (n) * ((((HZSCALE) >> 11)=
 * (loops_per_jiffy >> 11)) >> 6), 1000 ) );
>>> +
>>> +#endif
>>
>> Why do you need this? CONFIG_M68000 and CONFIG_COLDFIRE are not set?
>
> CONFIG_M68000 is not set? I thought it's always set ... I was trying

No, M68000 is only selected for real 68000 cores, which is limited to
68328 for now.
I guess you confused it with M68KCLASSIC?

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
