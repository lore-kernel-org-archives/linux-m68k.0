From: =?ISO-8859-1?Q?David_G=E1lvez?= <dgalvez75@gmail.com>
Subject: Re: Atari ROM port ISA
Date: Sun, 13 May 2012 12:33:01 +0200
Message-ID: <CAL4YKD6AoF+tGByUYF0Zx=rrEx35m6Tzqr=PHUUs1tB5HW91pA@mail.gmail.com>
References: <alpine.DEB.2.00.1204151113430.31626@ayla.of.borg>
	<4F8BCF49.4060109@gmail.com>
	<20120417050500.GA14387@cynthia.pants.nu>
	<loom.20120419T165359-796@post.gmane.org>
	<CAOmrzkKRE2SsJM532itFRd5fG2Bx-wxfno=ftb0SjXC1vWkbgQ@mail.gmail.com>
	<Pine.BSM.4.64L.1204192041320.27380@herc.mirbsd.org>
	<4F92D5CA.1000205@gmail.com>
	<CAMuHMdWSpkD=-55nzG=mO=ZUVTG=-D0TM5-JGAhFWvdzTR=pPQ@mail.gmail.com>
	<CAMuHMdW6tYbn6aW46x9yDiG7hptjSPz9gGDhS=n7bBTs7=pLkA@mail.gmail.com>
	<4F93DF3D.5050402@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:54720 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751980Ab2EMKdB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 13 May 2012 06:33:01 -0400
Received: by dady13 with SMTP id y13so4781677dad.19
        for <linux-m68k@vger.kernel.org>; Sun, 13 May 2012 03:33:01 -0700 (PDT)
In-Reply-To: <4F93DF3D.5050402@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

2012/4/22 Michael Schmitz <schmitzmic@googlemail.com>:
>
> Correct again =A0- the A15 we can implement via the address field its=
elf (just
> as the USB command vs. data cycle on A14). The ISP1160 driver has pro=
visions
> to use two 8-bit writes in place of a 16 bit one but it might be clea=
ner to
> implement the 16 bit write the way the USB driver needs it.
>
> Now - does anyone here on this list or on debian-68k own such hardwar=
e and
> would be in a position to test a USB driver written to this spec? Is =
the
> hardware still for sale?
> (Not that I am at all sure whether the ISP1160 driver will run in a t=
imer
> polled mode at all ...)
>

Hi, I would like to help to make those tests, although my only
experience with Linux is as Ubuntu user. I have a CT060 Falcon with a
NetUSBee and also an Ethernat and I've just installed Linux in it. I
did some work for FreeMiNT's USB drivers for both cards. Under MiNT
the Ethernat driver is working but I have problems with the NetUSBee
one, it isn't working reliable. I hope that the Linux driver for the
NetUSBee enlighten me to see where is the problem with the MiNT
driver.

About if it's still possible to buy the NetUSBee, The last week there
was a thread in atari-forum.com talking about it, it looks like nobody
knows anybody who is making them right now:

http://www.atari-forum.com/viewtopic.php?f=3D15&t=3D23362

I bought mine last year from one person in Germany I can send you an
email with his address if you're interested, just to try.

Regards

David
