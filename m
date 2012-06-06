From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 9/11] Atari: add ndelay() (used by isp116x-hcd)
Date: Wed, 6 Jun 2012 10:22:11 +0200
Message-ID: <CAOmrzkLy-noQ=8xBifHcVTTskBJ7wLD6up24Hx3hT=QY6rc+ZQ@mail.gmail.com>
References: <E1SXMIc-0002Y2-NB@zirkon.biophys.uni-duesseldorf.de>
	<CAMuHMdV=U_6i=XaOUVC9rwy1WWbMDSF3WjRWDtLSG-6p+ecR2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:48429 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750862Ab2FFIWM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Jun 2012 04:22:12 -0400
Received: by dady13 with SMTP id y13so8465570dad.19
        for <linux-m68k@vger.kernel.org>; Wed, 06 Jun 2012 01:22:11 -0700 (PDT)
In-Reply-To: <CAMuHMdV=U_6i=XaOUVC9rwy1WWbMDSF3WjRWDtLSG-6p+ecR2A@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>, linux-m68k@vger.kernel.org

Geert,

On Tue, Jun 5, 2012 at 10:43 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, May 24, 2012 at 2:53 AM, Michael Schmitz
> <schmitz@zirkon.biophys.uni-duesseldorf.de> wrote:
>> +#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
>> +/*
>> + * The simpler m68k and ColdFire processors do not have a 32*32->64
>> + * multiply instruction. So we need to handle them a little differe=
ntly.
>> + * We use a bit of shifting and a single 32*32->32 multiply to get =
close.
>> + * This is a macro so that the const version can factor out the fir=
st
>> + * multiply and shift.
>> + */
>> +#define =A0 =A0 =A0 =A0HZSCALE =A0 =A0 =A0 =A0 (268435456 / (100000=
0 / HZ))
>> +
>> +#define ndelay(n) __delay( DIV_ROUND_UP( (n) * ((((HZSCALE) >> 11) =
* (loops_per_jiffy >> 11)) >> 6), 1000 ) );
>> +
>> +#endif
>
> Why do you need this? CONFIG_M68000 and CONFIG_COLDFIRE are not set?

CONFIG_M68000 is not set? I thought it's always set ... I was trying
to get the most generic implementation possible before using optimized
ones.

> You end up using the default implementation in include/linux/delay.h.

Meaning a true ndelay is not really needed at all - seems to work fine
without. I'll rework that and see if it improves anything. If not, it
can be dropped.

Cheers,

  Michael
