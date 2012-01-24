From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible patch)
Date: Tue, 24 Jan 2012 09:41:43 +0100
Message-ID: <CAMuHMdX_ng8uQ2OYwceb3uTsGSRSRKp0C1C9xpTyi7cN6L__Ow@mail.gmail.com>
References: <4F1C577D.3040908@sigon.net>
	<CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com>
	<CAOmrzkJO8hiMJhN5eanXpjjGnaLYrCDAbekX2=FY394+Vt1UHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:59194 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754750Ab2AXIlo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 24 Jan 2012 03:41:44 -0500
Received: by wgbed3 with SMTP id ed3so3725833wgb.1
        for <linux-m68k@vger.kernel.org>; Tue, 24 Jan 2012 00:41:43 -0800 (PST)
In-Reply-To: <CAOmrzkJO8hiMJhN5eanXpjjGnaLYrCDAbekX2=FY394+Vt1UHw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Patrick Bottelberger <patrick.bottelberger@sigon.net>, linux-m68k@vger.kernel.org

On Tue, Jan 24, 2012 at 00:04, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
>>> the debian system and mknod'ing all needed device-files everything =
seems
>>> to be running fine, with the exception of the RTC (i think that's m=
y
>>> fault, something i missed while configuring my kernel, is there
>>> something needed besides of genrtc to get the A600/A603-clock worki=
ng?)
>>
>> Do you know what clock chip is used on the A603? I had a quick look =
on the
>> net, but couldn't find it (I did see a picture of an A604 with a par=
tially
>> covered chip that said M6242). If you can't find it, I can ask Jens.
>
> Might be the wrong /dev/rtc device - it should be major 254 minor 0
> not major 10 minor 135 (or whatever).

That can also be the problem. Note that the 254/0 is a dynamic number,
so it may be different for you.

You can check under /sys/class/devices whether your rtc was found.
I think there's also a virtual file there to show the current time with=
out
having to use hwclock.

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
