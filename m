From: =?ISO-8859-1?Q?David_G=E1lvez?= <dgalvez75@gmail.com>
Subject: Re: Atari ROM port ISA
Date: Thu, 17 May 2012 08:10:58 +0200
Message-ID: <CAL4YKD7Kb3deJGwMExEC9=gwr1-rjxSgWTfuRhny1TTTj7PkmA@mail.gmail.com>
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
Received: from mail-pz0-f46.google.com ([209.85.210.46]:40164 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754546Ab2EQGK7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 17 May 2012 02:10:59 -0400
Received: by dady13 with SMTP id y13so1989312dad.19
        for <linux-m68k@vger.kernel.org>; Wed, 16 May 2012 23:10:58 -0700 (PDT)
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
>> 2012/4/22 Michael Schmitz <schmitzmic@googlemail.com>:
>>> Now - does anyone here on this list or on debian-68k own such hardw=
are and
>>> would be in a position to test a USB driver written to this spec? I=
s the
>>> hardware still for sale?
>>> (Not that I am at all sure whether the ISP1160 driver will run in a=
 timer
>>> polled mode at all ...)
>>>
>>
>> Hi, I would like to help to make those tests, although my only
>> experience with Linux is as Ubuntu user. I have a CT060 Falcon with =
a
>> NetUSBee and also an Ethernat and I've just installed Linux in it. I
>
> Thanks for your offer - what kernel version does your Falcon Linux
> installation currently use?
>
> My development is based on 3.4-rc3, if your Linux system is a recent
> enough one there should not be any problems with booting 3.4 kernels.
> I will send a kernel image file and a modules archive by separate
> mail.
>
> The kernel and modules I can provide won't come nicely packaged as in
> Ubuntu or Debian kernel image packages. You will have to extract the
> modules archive in the root of your file system, and then run 'depmod
> -a 3.4.0-rc3-atari-35598-gf7ff2b8-dirty' (all as root) before booting
> the 3.4 kernel.
>
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

EtherNat's nertwork driver is working fine.

When loading the USB driver I'm getting this:

usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
isp116x-hcd isp116x-hcd: ISP116x Host Controller
isp116x-hcd isp116x-hcd: new USB bus registered, assigned bus number 1
116x: Clock not ready after 15ms
116x: Please make sure that the H_WAKEUP pin is pulled low!
isp116x-hcd isp116x-hcd: can't setup
isp116x-hcd isp116x-hcd: USB bus 1 deregistered
116x: init error, -19


Regards
