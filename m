From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Debian kernel 2.6.38-5
Date: Mon, 9 May 2011 09:16:16 +0200
Message-ID: <BANLkTim6_gHr_re0bv0eTWCQ7=5AG1HzwQ@mail.gmail.com>
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
Received: from mail-bw0-f46.google.com ([209.85.214.46]:36975 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752422Ab1EIHQl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 9 May 2011 03:16:41 -0400
Received: by bwz15 with SMTP id 15so3752193bwz.19
        for <linux-m68k@vger.kernel.org>; Mon, 09 May 2011 00:16:40 -0700 (PDT)
In-Reply-To: <alpine.OSX.2.00.1105090909080.194@ibook.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: "Christian T. Steigies" <cts@debian.org>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Mon, May 9, 2011 at 01:14, Finn Thain <fthain@telegraphics.com.au> w=
rote:
> On Sun, 8 May 2011, Christian T. Steigies wrote:
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

Yeah, that's a very likely culprit. Thx!

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
