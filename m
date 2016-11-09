From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: gcc-4.6.3, was Re: Debian on mac68k
Date: Wed, 9 Nov 2016 18:08:32 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1611091759180.16562@nippy.intranet>
References: <574C132F.3070404@abbuc.de> <574C15C2.90908@abbuc.de> <ec5ded9d-b3c0-0bba-65b7-1e4d2cc063a2@physik.fu-berlin.de> <574C1792.4030403@abbuc.de> <57557722.5040808@yahoo.com> <alpine.LNX.2.00.1610251358330.443@nippy.intranet> <5810FA8D.4060702@yahoo.com>
 <58114F74.40408@yahoo.com> <alpine.LNX.2.00.1610271244020.21780@nippy.intranet> <5811F96F.3090602@yahoo.com> <58121D46.8060506@yahoo.com> <alpine.LNX.2.00.1611052134280.2870@nippy.intranet> <fbb16cf0-6fe1-8231-c85a-8c65b3d8f50d@physik.fu-berlin.de>
 <alpine.LNX.2.00.1611070917240.29060@nippy.intranet> <b731fd59-03b7-a443-650b-c023c1190385@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:54196 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751591AbcKIHIQ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 9 Nov 2016 02:08:16 -0500
In-Reply-To: <b731fd59-03b7-a443-650b-c023c1190385@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, debian-68k@lists.debian.org, linux-m68k@vger.kernel.org


On Wed, 9 Nov 2016, Michael Schmitz wrote:

> Not for Mac, but Geert usually boots kernels using ARAnyM. Pretty basic, 
> for sure, but it's been good enough so have something to work from.

I thought Geert still used gcc-4.1 (?)

> 
> Having something like ARAnyM for Mac or Amiga would increase coverage, 
> but the varied and quirky Mac hardware out there makes that almost 
> pointless again.

AFAIK, MAME/MESS is the only thing that would be accurate enough.

For the Mac models that I was interested in (LC III for Egret and LC 520 
for Cuda), I was able to patch some of the known bugs in MAME/MESS to get 
the ROM to boot to a flashing question mark, but I didn't try to boot any 
further. I will try loading EMILE.

-- 

> 
> Cheers,
> 
> 	Michael
> 
> 
