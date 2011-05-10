From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Debian kernel 2.6.38-5
Date: Tue, 10 May 2011 19:38:48 +1200
Message-ID: <BANLkTikcH8GH2cy+N=XV+-ZwE9yJ3ty=yQ@mail.gmail.com>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
	<Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org>
	<20110508165909.GA16281@chumley.earth.sol>
	<Pine.BSM.4.64L.1105081834101.28983@herc.mirbsd.org>
	<20110508200802.GB16281@chumley.earth.sol>
	<alpine.OSX.2.00.1105090909080.194@ibook.intranet>
	<BANLkTim6_gHr_re0bv0eTWCQ7=5AG1HzwQ@mail.gmail.com>
	<20110509202559.GA27320@chumley.earth.sol>
	<BANLkTinP_U1c+X_zVrT1zXdzVh_p=STP0Q@mail.gmail.com>
	<20110510070002.GA32329@chumley.earth.sol>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:57161 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754941Ab1EJHit convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 10 May 2011 03:38:49 -0400
Received: by pvg12 with SMTP id 12so2707749pvg.19
        for <linux-m68k@vger.kernel.org>; Tue, 10 May 2011 00:38:48 -0700 (PDT)
In-Reply-To: <20110510070002.GA32329@chumley.earth.sol>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Finn Thain <fthain@telegraphics.com.au>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

Hi Christian,

>> > I also changed this line to have 4 underscores at the beginning:
>> >
>> > =A0 =A0 =A0 =A0{ 0xec940559, "____alloc_ei_netdev" },
>>
>> Where does that appear? Can't find it in drivers/net anywhere.
>
> It's in zorro8390.mod.c, but *.mod.c is listed in .gitignore, so it m=
ust be
> a remnant of my experiments with git and older branches. I wonder why=
 it has
> been compiled, though, I did not change any of the Makefiles.

This is being compiled whenever zorro8390.c is compiled as module - do
not change it.

>> The only symbol exported by zorro8390.c should be __alloc_ei_netdev =
-
>> if your above change was done in some symbol exports file it should
>> probably have been left at __alloc_ei_netdev.
>
> I did none of that, but to be sure, I should build another kernel wit=
h
> Geert's patch on a clean checkout.

Should not change anything - the .mod.c should be rebuilt when any
dependent file is changed.

> I installed a few packages, rebooted to check if the network is set u=
p
> automatically (it is!), and installed more packages. Now I am upgradi=
ng
> some more and I see reasonable download speeds: 140kB/s. However, I a=
lso saw
> this flying by:
>
> eth0: Interrupted while interrupts are masked! isr=3D0x0 imr=3D0x0.

Looks like you're not getting packets off the card fast enough on
receive. I'd have to look at the source to know what the status and
mask register values mean though.

> Three times in about one minute. The whole system is a bit more respo=
nsive
> now (I an log in on a second console without a long delay). I could n=
ot log
> in with ssh yet, though I get a little bit further than yesterday, th=
ere is
> some response already from the remote system.

ssh login should work if sshd is up and running, and the network
appears to be working as you describe.

Cheers,

  MIchael
