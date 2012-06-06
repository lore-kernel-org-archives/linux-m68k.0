From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 6/11] Atari: new EtherNEC driver (ne.c)
Date: Wed, 6 Jun 2012 10:05:55 +0200
Message-ID: <CAOmrzkJiEe_hd6BJKU-aWv7HU3EH7L-OWzi++2z0arcadAppKw@mail.gmail.com>
References: <E1SXMG4-0002Xo-BD@zirkon.biophys.uni-duesseldorf.de>
	<CAMuHMdVSJ0etRcKUZTPKh_mq8Lz-GK+Ys5QWfq3e9BrsNoN=cA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:46287 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751701Ab2FFIFz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Jun 2012 04:05:55 -0400
Received: by dady13 with SMTP id y13so8449036dad.19
        for <linux-m68k@vger.kernel.org>; Wed, 06 Jun 2012 01:05:55 -0700 (PDT)
In-Reply-To: <CAMuHMdVSJ0etRcKUZTPKh_mq8Lz-GK+Ys5QWfq3e9BrsNoN=cA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>, linux-m68k@vger.kernel.org

Geert,


>> +obj-$(CONFIG_ATARI_ETHERNEC) +=3D ne.o 8390p.o
>
> This duplicates the line for CONFIG_NE2000. You can remove it, if you
> make CONFIG_NE2000 selectable on Atari (see below).

True - it would be cleaner if everyone understood the EtherNEC really
is a NE2000.

>> +config ATARI_ETHERNEC
>> + =A0 =A0 =A0 tristate "Atari EtherNEC Ethernet support"
>
> I would make this bool, and move this section to arch/m68k/Kconfig.de=
vices.
> Then CONFIG_ATARI_ETHERNEC can control the creation of the platform
> devices.
>
> After that, you still need a way to make CONFIG_NE2000 selectable. E.=
g.
> in drivers/net/ethernet/8390/Kconfig:
>
> =A0config NE2000
> =A0 =A0 =A0 =A0 tristate "NE2000/NE1000 support"
> - =A0 =A0 =A0 =A0depends on (ISA || (Q40 && m) || M32R || MACH_TX49XX=
)
> + =A0 =A0 =A0 =A0depends on (ISA || (Q40 && m) || M32R || MACH_TX49XX=
 || ATARI_ETHERNEC)

Can't we force NE2000 to be enabled whenever ATARI_ETHERNEC is enabled
by default? We would not want one without the other usually.

Cheers,

  Michael
