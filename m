From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/m68knommu: merge MMU and non-MMU string.h
Date: Wed, 8 Sep 2010 14:52:07 +0200
Message-ID: <AANLkTi=77etd9nzCK835+Q7ObXON-Y6A-mBcp8tGj7VH@mail.gmail.com>
References: <201009070452.o874qqmg006794@goober.internal.moreton.com.au>
	<AANLkTim+jWjOKX_M52DWSKH2+oRWBXqc3TUFQp6esf3r@mail.gmail.com>
	<4C8776C5.9030205@snapgear.com>
	<m3lj7ctpfg.fsf@hase.home>
	<4C877FF1.30808@snapgear.com>
	<m37hiwtnkl.fsf@hase.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:38476 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753165Ab0IHMwI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Sep 2010 08:52:08 -0400
Received: by gwj17 with SMTP id 17so2316372gwj.19
        for <linux-m68k@vger.kernel.org>; Wed, 08 Sep 2010 05:52:07 -0700 (PDT)
In-Reply-To: <m37hiwtnkl.fsf@hase.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Greg Ungerer <gerg@snapgear.com>, linux-m68k@vger.kernel.org, gerg@uclinux.org

On Wed, Sep 8, 2010 at 14:41, Andreas Schwab <schwab@linux-m68k.org> wr=
ote:
> Greg Ungerer <gerg@snapgear.com> writes:
>
>> I used:
>>
>> =C2=A0 git format-patch -M -B <COMMIT-ID>
>
> Ok, -B did it. =C2=A0Perhaps worth reporting as a git bug that git am=
/apply
> cannot cope with this.

Will do

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
