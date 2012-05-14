From: =?ISO-8859-1?Q?David_G=E1lvez?= <dgalvez75@gmail.com>
Subject: Re: Atari ROM port ISA
Date: Mon, 14 May 2012 13:17:01 +0200
Message-ID: <CAL4YKD7d5bR7o136Euoa_VukuJGRfa8egjoNzUKOH91=sJXtMw@mail.gmail.com>
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
	<CAOmrzkKG1CwN+OAUfsqC1T6FDUU+DEFRysYnR618B4Rk9=vMCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:33632 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755708Ab2ENLRC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 14 May 2012 07:17:02 -0400
Received: by pbbrp8 with SMTP id rp8so5986527pbb.19
        for <linux-m68k@vger.kernel.org>; Mon, 14 May 2012 04:17:01 -0700 (PDT)
In-Reply-To: <CAOmrzkKG1CwN+OAUfsqC1T6FDUU+DEFRysYnR618B4Rk9=vMCA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

2012/5/14 Michael Schmitz <schmitzmic@googlemail.com>:
> Hi David,
>
> On Sun, May 13, 2012 at 10:33 PM, David G=E1lvez <dgalvez75@gmail.com=
> wrote:
>> Hi, I would like to help to make those tests, although my only
>> experience with Linux is as Ubuntu user. I have a CT060 Falcon with =
a
>> NetUSBee and also an Ethernat and I've just installed Linux in it. I
>
> Thanks for your offer - what kernel version does your Falcon Linux
> installation currently use?
>

3.4-rc5, I've cloned Geert's tree and compiled the kernel using
atari_defcofig, then I should enable the configuration option
"Maintain a devtmpfs filesystem to mount at /dev" to make the kernel
to finish the boot process.

> My development is based on 3.4-rc3, if your Linux system is a recent
> enough one there should not be any problems with booting 3.4 kernels.
> I will send a kernel image file and a modules archive by separate
> mail.
>

OK, my installation is based on this https://wiki.debian.org/Aranym/Qui=
ck

> The kernel and modules I can provide won't come nicely packaged as in
> Ubuntu or Debian kernel image packages. You will have to extract the
> modules archive in the root of your file system, and then run 'depmod
> -a 3.4.0-rc3-atari-35598-gf7ff2b8-dirty' (all as root) before booting
> the 3.4 kernel.
>

OK, no problem, thanks for the explanation.

> Once the new kernel has booted, please try loading the EtherNAT
> drivers (called smc91x for the network and isp116x-hcd for the USB
> driver). Check the kernel message log (command 'dmesg') for any
> messages relating to the modules loading. The smc91x should load OK, =
I
> run into problems later on when the corresponding network interface i=
s
> brought up. The USB one balks at the initial hardware checks on my
> Falcon.
>
> If you happen to get kernel panic messages these should be possible t=
o
> catch with a serial nullmodem cable between your Falcon and another
> computer.
>

OK, I have the cable and I've already tested debugging this way.

> We don't have a USB driver for the NetUSBee right now - though it
> should not be too hard to pull off (I need to write a bit of ROM port
> access glue for that). I will have to send a new kernel image for tha=
t
> kind of change but most of the modules should be possible to reuse.
>
> The Ethernet part of the NetUSBee should work using the atari_etherne=
c
> driver in currrent kernels. The driver has been renamed to 'ne' in my
> development branch.
>
> The USB driver is named isp116x-hcd for the EtherNAT. I'll try to use
> the same driver name for the NetUSBee if that's possible (it's easy
> enough if you only have one of the two installed, but may be a bit
> difficult if you've got them both).
>
>
> Stay tuned for the kernel and modules - I'll send them off right away=
=2E
>

I'll report back here as soon as I'm done with the tests.

Thanks.
