From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Debian kernel 2.6.38-5
Date: Tue, 10 May 2011 11:01:45 +0200
Message-ID: <BANLkTin-bsA6KYbCawtrnUdQ-PhqGrTyOA@mail.gmail.com>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
	<Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org>
	<20110508165909.GA16281@chumley.earth.sol>
	<Pine.BSM.4.64L.1105081834101.28983@herc.mirbsd.org>
	<20110508200802.GB16281@chumley.earth.sol>
	<alpine.OSX.2.00.1105090909080.194@ibook.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:51488 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752334Ab1EJJBq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 10 May 2011 05:01:46 -0400
Received: by bwz15 with SMTP id 15so4649279bwz.19
        for <linux-m68k@vger.kernel.org>; Tue, 10 May 2011 02:01:45 -0700 (PDT)
In-Reply-To: <alpine.OSX.2.00.1105090909080.194@ibook.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: "Christian T. Steigies" <cts@debian.org>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Mon, May 9, 2011 at 01:14, Finn Thain <fthain@telegraphics.com.au> w=
rote:
> On Sun, 8 May 2011, Christian T. Steigies wrote:
>>
>> PS 2.6.28 did not boot: kernel too old. When was TLS introduced? I'l=
l try to
>> apply the patch you mentioned in your other message.
>
> I sometimes test network cards with busybox. It can be built without
> linking in glibc and doesn't need TLS.
>
>
>> [ =C2=A0130.870000] eth0: trigger_send() called with the transmitter=
 busy.
>> [ =C2=A0132.240000] ------------[ cut here ]------------
>> [ =C2=A0132.240000] WARNING: at net/sched/sch_generic.c:256 dev_watc=
hdog+0x1ac/0x1cc()
>> [ =C2=A0132.250000] NETDEV WATCHDOG: eth0 (): transmit queue 0 timed=
 out
>
> Looks a lot like this problem:
>
> http://patchwork.ozlabs.org/patch/27774/

=46inn, could it also work if you remove the "#include "lib8390.c" from=
 *8390.c?
That would reduce code size for distro kernels, which would have too ma=
ny copies
of lib8390.c (for zorro8390, mac8390, hydra)?

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
