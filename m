From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Atari ROM port ISA
Date: Thu, 17 May 2012 18:51:32 +1200
Message-ID: <4FB49FF4.1060908@gmail.com>
References: <alpine.DEB.2.00.1204151113430.31626@ayla.of.borg> <4F8BCF49.4060109@gmail.com> <20120417050500.GA14387@cynthia.pants.nu> <loom.20120419T165359-796@post.gmane.org> <CAOmrzkKRE2SsJM532itFRd5fG2Bx-wxfno=ftb0SjXC1vWkbgQ@mail.gmail.com> <Pine.BSM.4.64L.1204192041320.27380@herc.mirbsd.org> <4F92D5CA.1000205@gmail.com> <CAMuHMdWSpkD=-55nzG=mO=ZUVTG=-D0TM5-JGAhFWvdzTR=pPQ@mail.gmail.com> <CAMuHMdW6tYbn6aW46x9yDiG7hptjSPz9gGDhS=n7bBTs7=pLkA@mail.gmail.com> <4F93DF3D.5050402@gmail.com> <CAL4YKD6AoF+tGByUYF0Zx=rrEx35m6Tzqr=PHUUs1tB5HW91pA@mail.gmail.com> <CAOmrzkKG1CwN+OAUfsqC1T6FDUU+DEFRysYnR618B4Rk9=vMCA@mail.gmail.com> <CAL4YKD7Kb3deJGwMExEC9=gwr1-rjxSgWTfuRhny1TTTj7PkmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:59399 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759707Ab2EQGvn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 17 May 2012 02:51:43 -0400
Received: by pbbrp8 with SMTP id rp8so2143526pbb.19
        for <linux-m68k@vger.kernel.org>; Wed, 16 May 2012 23:51:42 -0700 (PDT)
In-Reply-To: <CAL4YKD7Kb3deJGwMExEC9=gwr1-rjxSgWTfuRhny1TTTj7PkmA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?ISO-8859-1?Q?David_G=E1lvez?= <dgalvez75@gmail.com>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On 17/05/12 18:10, David G=E1lvez wrote:
> EtherNat's nertwork driver is working fine.
That's good to know. Well, not entirely - it does mean my EtherNAT is=20
dead ...

What interrupt does it report it uses? Do you see the card interrupts=20
accumulate in /proc/interrupts?
> When loading the USB driver I'm getting this:
>
> usbcore: registered new interface driver usbfs
> usbcore: registered new interface driver hub
> usbcore: registered new device driver usb
> isp116x-hcd isp116x-hcd: ISP116x Host Controller
> isp116x-hcd isp116x-hcd: new USB bus registered, assigned bus number =
1
> 116x: Clock not ready after 15ms
> 116x: Please make sure that the H_WAKEUP pin is pulled low!
> isp116x-hcd isp116x-hcd: can't setup
> isp116x-hcd isp116x-hcd: USB bus 1 deregistered
> 116x: init error, -19
Just what I'm getting as well. Back to the drawing board. I'll have to=20
get confirmation on the exact addresses being used from the EtherNAT=20
designer.

Thanks a lot,

   Michael
