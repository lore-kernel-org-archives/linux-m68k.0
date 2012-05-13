From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Atari ROM port ISA
Date: Mon, 14 May 2012 11:27:08 +1200
Message-ID: <CAOmrzkKG1CwN+OAUfsqC1T6FDUU+DEFRysYnR618B4Rk9=vMCA@mail.gmail.com>
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
	<CAL4YKD6AoF+tGByUYF0Zx=rrEx35m6Tzqr=PHUUs1tB5HW91pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:44287 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753682Ab2EMX1J convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 13 May 2012 19:27:09 -0400
Received: by dady13 with SMTP id y13so5169672dad.19
        for <linux-m68k@vger.kernel.org>; Sun, 13 May 2012 16:27:08 -0700 (PDT)
In-Reply-To: <CAL4YKD6AoF+tGByUYF0Zx=rrEx35m6Tzqr=PHUUs1tB5HW91pA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?ISO-8859-1?Q?David_G=E1lvez?= <dgalvez75@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

Hi David,

On Sun, May 13, 2012 at 10:33 PM, David G=E1lvez <dgalvez75@gmail.com> =
wrote:
> 2012/4/22 Michael Schmitz <schmitzmic@googlemail.com>:
>> Now - does anyone here on this list or on debian-68k own such hardwa=
re and
>> would be in a position to test a USB driver written to this spec? Is=
 the
>> hardware still for sale?
>> (Not that I am at all sure whether the ISP1160 driver will run in a =
timer
>> polled mode at all ...)
>>
>
> Hi, I would like to help to make those tests, although my only
> experience with Linux is as Ubuntu user. I have a CT060 Falcon with a
> NetUSBee and also an Ethernat and I've just installed Linux in it. I

Thanks for your offer - what kernel version does your Falcon Linux
installation currently use?

My development is based on 3.4-rc3, if your Linux system is a recent
enough one there should not be any problems with booting 3.4 kernels.
I will send a kernel image file and a modules archive by separate
mail.

The kernel and modules I can provide won't come nicely packaged as in
Ubuntu or Debian kernel image packages. You will have to extract the
modules archive in the root of your file system, and then run 'depmod
-a 3.4.0-rc3-atari-35598-gf7ff2b8-dirty' (all as root) before booting
the 3.4 kernel.

Once the new kernel has booted, please try loading the EtherNAT
drivers (called smc91x for the network and isp116x-hcd for the USB
driver). Check the kernel message log (command 'dmesg') for any
messages relating to the modules loading. The smc91x should load OK, I
run into problems later on when the corresponding network interface is
brought up. The USB one balks at the initial hardware checks on my
=46alcon.

If you happen to get kernel panic messages these should be possible to
catch with a serial nullmodem cable between your Falcon and another
computer.

> did some work for FreeMiNT's USB drivers for both cards. Under MiNT
> the Ethernat driver is working but I have problems with the NetUSBee
> one, it isn't working reliable. I hope that the Linux driver for the
> NetUSBee enlighten me to see where is the problem with the MiNT
> driver.

We don't have a USB driver for the NetUSBee right now - though it
should not be too hard to pull off (I need to write a bit of ROM port
access glue for that). I will have to send a new kernel image for that
kind of change but most of the modules should be possible to reuse.

The Ethernet part of the NetUSBee should work using the atari_ethernec
driver in currrent kernels. The driver has been renamed to 'ne' in my
development branch.

The USB driver is named isp116x-hcd for the EtherNAT. I'll try to use
the same driver name for the NetUSBee if that's possible (it's easy
enough if you only have one of the two installed, but may be a bit
difficult if you've got them both).

> About if it's still possible to buy the NetUSBee, The last week there
> was a thread in atari-forum.com talking about it, it looks like nobod=
y
> knows anybody who is making them right now:
>
> http://www.atari-forum.com/viewtopic.php?f=3D15&t=3D23362
>
> I bought mine last year from one person in Germany I can send you an
> email with his address if you're interested, just to try.

All I would do with the hardware is test a Linux driver on it - I'm OK
with the EtherNEC at the moment. Others may make better use of the
scarce hardware.

Stay tuned for the kernel and modules - I'll send them off right away.

Regards,

  Michael Schmitz
