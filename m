From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible patch)
Date: Tue, 24 Jan 2012 22:49:10 +0100
Message-ID: <CAMuHMdXU1z9GfbT9seMHEv-p76zyZ66zTZnGdShroaEkqidn6A@mail.gmail.com>
References: <4F1C577D.3040908@sigon.net>
	<CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com>
	<4F1EEBEF.4000400@sigon.net>
	<CAMuHMdWbQau3kS2-svDS705_PS4-0adCCvLvT=Af6VKKZfr+gA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:62647 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751040Ab2AXVtL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 24 Jan 2012 16:49:11 -0500
Received: by wics10 with SMTP id s10so3328747wic.19
        for <linux-m68k@vger.kernel.org>; Tue, 24 Jan 2012 13:49:10 -0800 (PST)
In-Reply-To: <CAMuHMdWbQau3kS2-svDS705_PS4-0adCCvLvT=Af6VKKZfr+gA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Patrick Bottelberger <patrick.bottelberger@sigon.net>
Cc: linux-m68k@vger.kernel.org

On Tue, Jan 24, 2012 at 22:17, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>>> Currently, Linux assumes an A2000 clock chip, which is an Oki MSM62=
42.
>>> If it's a Ricoh RP5C01, you have to modify arch/m68k/amiga/config.c=
 to
>>> select an A3000 clock chip on A600.
>>>
>> The kernel outputs: "Amiga hardware found: (...) A2000_CLK (...)", c=
an i
>> rely on that message, or should i get the A603 out of the case and c=
heck
>> the chip to be sure?
>
> You cannot rely on that message. It just assumes A2000/A500/A600 etc.
> have an A2000-style clock chip. But on all but A2000 the RTC is optio=
nal.
> BTW, I also asked Jens Sch=C3=B6nfeld.

Jens confirmed it has an MSM6242.

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
