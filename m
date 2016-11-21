From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Mac emulation, was Re: gcc-4.6.3
Date: Mon, 21 Nov 2016 20:10:05 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1611211829200.16800@nippy.intranet>
References: <574C132F.3070404@abbuc.de> <574C15C2.90908@abbuc.de> <ec5ded9d-b3c0-0bba-65b7-1e4d2cc063a2@physik.fu-berlin.de> <574C1792.4030403@abbuc.de> <57557722.5040808@yahoo.com> <alpine.LNX.2.00.1610251358330.443@nippy.intranet> <5810FA8D.4060702@yahoo.com>
 <58114F74.40408@yahoo.com> <alpine.LNX.2.00.1610271244020.21780@nippy.intranet> <5811F96F.3090602@yahoo.com> <58121D46.8060506@yahoo.com> <alpine.LNX.2.00.1611052134280.2870@nippy.intranet> <fbb16cf0-6fe1-8231-c85a-8c65b3d8f50d@physik.fu-berlin.de>
 <alpine.LNX.2.00.1611070917240.29060@nippy.intranet> <b731fd59-03b7-a443-650b-c023c1190385@gmail.com> <alpine.LNX.2.00.1611091759180.16562@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:58466 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753467AbcKUJKN (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 21 Nov 2016 04:10:13 -0500
In-Reply-To: <alpine.LNX.2.00.1611091759180.16562@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, debian-68k@lists.debian.org, linux-m68k@vger.kernel.org, Laurent Vivier <laurent@vivier.eu>


On Wed, 9 Nov 2016, I wrote:

> On Wed, 9 Nov 2016, Michael Schmitz wrote:
> 
> > 
> > Having something like ARAnyM for Mac or Amiga would increase coverage, 
> > but the varied and quirky Mac hardware out there makes that almost 
> > pointless again.
> 
> AFAIK, MAME/MESS is the only thing that would be accurate enough.
> 
> For the Mac models that I was interested in (LC III for Egret and LC 520 
> for Cuda), I was able to patch some of the known bugs in MAME/MESS to 
> get the ROM to boot to a flashing question mark, but I didn't try to 
> boot any further. I will try loading EMILE.
> 

Unfortunately EMILE did not boot the emulated Mac IIx or Mac IIci in 
MAME/MESS. This resulted in a sad mac (0000000F 00000002):

$ pramutil -f ~/.sdlmess/nvram/maciix/rtc --boot-slot e --boot-slotrsrc 254
$ sdlmess -ramsize 8M maciix -nbe image -disk boot-2.6.18-mac_0.12.bin

$ pramutil -f ~/.sdlmess/nvram/maciici/rtc --boot-slot e --boot-slotrsrc 254
$ sdlmess -ramsize 16M maciici -nbe image -disk boot-2.6.18-mac_0.12.bin

Both of these emulated machines were able to boot to the desktop using a 
System 7 disk image.

I didn't test EMILE on the emulated LC III as I can't make that machine 
load any media at all, so I can't get past the flashing question mark.

-- 
