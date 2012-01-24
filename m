From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible patch)
Date: Tue, 24 Jan 2012 22:17:48 +0100
Message-ID: <CAMuHMdWbQau3kS2-svDS705_PS4-0adCCvLvT=Af6VKKZfr+gA@mail.gmail.com>
References: <4F1C577D.3040908@sigon.net>
	<CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com>
	<4F1EEBEF.4000400@sigon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:46647 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755844Ab2AXVRu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 24 Jan 2012 16:17:50 -0500
Received: by werb13 with SMTP id b13so3315020wer.19
        for <linux-m68k@vger.kernel.org>; Tue, 24 Jan 2012 13:17:48 -0800 (PST)
In-Reply-To: <4F1EEBEF.4000400@sigon.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Patrick Bottelberger <patrick.bottelberger@sigon.net>
Cc: linux-m68k@vger.kernel.org

Hi Patrick,

On Tue, Jan 24, 2012 at 18:35, Patrick Bottelberger
<patrick.bottelberger@sigon.net> wrote:
> Geert Uytterhoeven schrieb:
>> What did Amiboot detect without the `-p` option (you may want ti try=
 `-d')?
>> Does it assume a 68882 FPU?
>>
> Without supplying the '-p' parameter amiboot didn't output anything a=
t
> all, it just froze the amiga directly after entering the command.

Even with '-d'?

>> I'd expected this to be the topology issue, but that change doesn't =
seem
>> to be in 3.1.4. I'll see whether I can reproduce this.

I can't reproduce it on ARAnyM with 3.1.4.

> Call Trace: [<0000ffff>] mm_release+0xa1/0xa4
> =C2=A0[<002b84fa>] topology_sysfs_init+0x0/0x1e
>
> Seems to prove that, do you think

But this indeed looks like the same problem. Are you using a Debianized=
 3.1.4
source tree?

> http://www.spinics.net/lists/linux-m68k/msg04709.html would solve the=
 issue?

Yes, that should fix this problem.

>> Do you know what clock chip is used on the A603? I had a quick look =
on the
>> net, but couldn't find it (I did see a picture of an A604 with a par=
tially
>> covered chip that said M6242). If you can't find it, I can ask Jens.
>>
>> Currently, Linux assumes an A2000 clock chip, which is an Oki MSM624=
2.
>> If it's a Ricoh RP5C01, you have to modify arch/m68k/amiga/config.c =
to
>> select an A3000 clock chip on A600.
>>
> The kernel outputs: "Amiga hardware found: (...) A2000_CLK (...)", ca=
n i
> rely on that message, or should i get the A603 out of the case and ch=
eck
> the chip to be sure?

You cannot rely on that message. It just assumes A2000/A500/A600 etc.
have an A2000-style clock chip. But on all but A2000 the RTC is optiona=
l.
BTW, I also asked Jens Sch=C3=B6nfeld.

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
