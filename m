From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Debian kernel 2.6.38-5
Date: Sun, 8 May 2011 22:22:23 +0200
Message-ID: <BANLkTimaARiTuGZ=51WU+DSX=kDsPatd8w@mail.gmail.com>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
	<Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org>
	<20110508165909.GA16281@chumley.earth.sol>
	<Pine.BSM.4.64L.1105081834101.28983@herc.mirbsd.org>
	<20110508200802.GB16281@chumley.earth.sol>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:64874 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750753Ab1EHUWY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 May 2011 16:22:24 -0400
Received: by bwz15 with SMTP id 15so3538500bwz.19
        for <linux-m68k@vger.kernel.org>; Sun, 08 May 2011 13:22:23 -0700 (PDT)
In-Reply-To: <20110508200802.GB16281@chumley.earth.sol>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Christian T. Steigies" <cts@debian.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Sun, May 8, 2011 at 22:08, Christian T. Steigies <cts@debian.org> wr=
ote:
> On Sun, May 08, 2011 at 06:40:40PM +0000, Thorsten Glaser wrote:
>> Christian T. Steigies dixit:
>> >How do I get the older versions from Geert's git? I don't see any o=
ther
>> >branches, I only see tags. What is the magic word to get for exampl=
e the 2.6.30
>> >tree?
>>
>> tg@zigo:~/linux-m68k $ git branch -r
>
> I did not know about -r, it was not mentioned in the tutorial I read.=
=2E.
> How do I switch back and forth between different branches? I got a co=
nflict

git checkout <branch>

> and could not switch back anymore. Then I deleted all files (except .=
git), I
> should be able to get everything back with git checkout? Well, I didn=
't. git
> newbie here...

`git reset --hard` will reset the state of your checked-out copy.

> Yes, but I am not trying to build a debian package, I try to build di=
rectly
> from linux-m68k. This has worked, only the Amiga complained a missing
> modules.dep (but I built in the network driver):
>
> make ARCH=3Dm68k CROSS_COMPILE=3Dm68k-linux-gnu-
> make ARCH=3Dm68k CROSS_COMPILE=3Dm68k-linux-gnu- INSTALL_MOD_PATH=3D/=
data/m68k modules_install
>
> The kernel boots, it configures the network (static). When I try to p=
ing a
> host on my network, I get this oops(?). =C2=A0A few seconds later I a=
lso get the
> mismatch message I reported earlier (does not show up in dmesg?).

Hmm, tx timed out.

> PS 2.6.28 did not boot: kernel too old. When was TLS introduced? I'll=
 try to
> apply the patch you mentioned in your other message.

m68k-v2.6.32

=46or older versions, you can use 'git cherry-pick <commit>' to backpor=
t.

> [ =C2=A0130.870000] eth0: trigger_send() called with the transmitter =
busy.

This is the real problem...

> [ =C2=A0132.240000] ------------[ cut here ]------------
> [ =C2=A0132.240000] WARNING: at net/sched/sch_generic.c:256 dev_watch=
dog+0x1ac/0x1cc()
> [ =C2=A0132.250000] NETDEV WATCHDOG: eth0 (): transmit queue 0 timed =
out

And a bit later the watchdog kicks in.

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
