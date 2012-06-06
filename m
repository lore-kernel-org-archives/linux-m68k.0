From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/11] Atari: change number of interrupt sources
Date: Wed, 6 Jun 2012 14:10:06 +0200
Message-ID: <CAMuHMdUnooh3PR9hNSPHuh0brRCrK79YWoZiGeQ1q3hoxNmu9g@mail.gmail.com>
References: <E1SXMBV-0002XQ-JI@zirkon.biophys.uni-duesseldorf.de>
	<CAMuHMdVXZGJmhLvQ-rfPGXHd7p90dDuSd95SZT0uBnShbYY5Rg@mail.gmail.com>
	<CAOmrzkK7MbiTzAHR0s6dQdPK2y9ov3XTdEsOhH7TOwTQOMMHNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:47445 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751243Ab2FFMKG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Jun 2012 08:10:06 -0400
Received: by yenm10 with SMTP id m10so4859499yen.19
        for <linux-m68k@vger.kernel.org>; Wed, 06 Jun 2012 05:10:06 -0700 (PDT)
In-Reply-To: <CAOmrzkK7MbiTzAHR0s6dQdPK2y9ov3XTdEsOhH7TOwTQOMMHNg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>, linux-m68k@vger.kernel.org

On Wed, Jun 6, 2012 at 10:16 AM, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
>>> =C2=A0#define NR_IRQS 200
>>> -#elif defined(CONFIG_ATARI) || defined(CONFIG_MAC)
>>> +#elif defined(CONFIG_ATARI)
>>> +#define NR_IRQS 141
>>
>> This is the (not configurable) EtherNAT interrupt number + 1?
>
> Right - still not sure where the +1 results from though.

Because the interrupt array starts at zero, but zero itself is not used=
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
