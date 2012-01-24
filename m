From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible patch)
Date: Tue, 24 Jan 2012 22:19:11 +0100
Message-ID: <CAMuHMdWRT2WdwzMdD3Ts2EyuKgCKGwS9+710HYB7BQvVr8K1pQ@mail.gmail.com>
References: <4F1C577D.3040908@sigon.net>
	<CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com>
	<CAOmrzkJO8hiMJhN5eanXpjjGnaLYrCDAbekX2=FY394+Vt1UHw@mail.gmail.com>
	<4F1EF0CE.9050300@sigon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:63575 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755844Ab2AXVTN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 24 Jan 2012 16:19:13 -0500
Received: by werb13 with SMTP id b13so3315941wer.19
        for <linux-m68k@vger.kernel.org>; Tue, 24 Jan 2012 13:19:12 -0800 (PST)
In-Reply-To: <4F1EF0CE.9050300@sigon.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Patrick Bottelberger <patrick.bottelberger@sigon.net>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, linux-m68k@vger.kernel.org

Hi Patrick,

On Tue, Jan 24, 2012 at 18:56, Patrick Bottelberger
<patrick.bottelberger@sigon.net> wrote:
> Michael Schmitz schrieb:
>> Might be the wrong /dev/rtc device - it should be major 254 minor 0
>> not major 10 minor 135 (or whatever).
>>
> I tried major 254 with minor 1 to 10, none of the nodes seems to be
> connected. I thought 254/x was used by CONFIG_RTC_CLASS and 10/135 by
> CONFIG_GEN_RTC? I'll compile the kernel with CONFIG_RTC_CLASS and try=
 again.

These days you need CONFIG_RTC_CLASS and CONFIG_RTC_DRV_MSM6242.
CONFIG_GEN_RTC only works with old-style RTC drivers, which we no longe=
r
use on Amiga.

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
