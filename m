From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: gcc-4.6.3, was Re: Debian on mac68k
Date: Mon, 7 Nov 2016 09:22:39 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1611070917240.29060@nippy.intranet>
References: <574C132F.3070404@abbuc.de> <574C15C2.90908@abbuc.de> <ec5ded9d-b3c0-0bba-65b7-1e4d2cc063a2@physik.fu-berlin.de> <574C1792.4030403@abbuc.de> <57557722.5040808@yahoo.com> <alpine.LNX.2.00.1610251358330.443@nippy.intranet> <5810FA8D.4060702@yahoo.com>
 <58114F74.40408@yahoo.com> <alpine.LNX.2.00.1610271244020.21780@nippy.intranet> <5811F96F.3090602@yahoo.com> <58121D46.8060506@yahoo.com> <alpine.LNX.2.00.1611052134280.2870@nippy.intranet> <fbb16cf0-6fe1-8231-c85a-8c65b3d8f50d@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:37852 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750920AbcKFWW2 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 6 Nov 2016 17:22:28 -0500
In-Reply-To: <fbb16cf0-6fe1-8231-c85a-8c65b3d8f50d@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: debian-68k@lists.debian.org, linux-m68k@vger.kernel.org


On Sun, 6 Nov 2016, John Paul Adrian Glaubitz wrote:

> On 11/06/2016 03:03 AM, Finn Thain wrote:
> 
> > Has anyone else tried the m68k cross-compiler from kernel.org and 
> > observed strange behaviour from the binaries it produces?
> 
> No, not really. Is there any particular reason why you are using these 
> old compilers?

Mature, proven tools are important to upstream developers. Developers of 
distros needn't have the same expectations, since they take it upon 
themselves to put together reliable tools.

Please forgive my cross-posting.

> In Debian, we have up-to-date versions of the gcc cross-toolchain for 
> all target architectures we have in Debian,

Some years ago, for Debian users, I added links to those tools here: 
http://www.mac.linux-m68k.org/docs/cross-dev.php

But I suspect that this information is no longer current. It may give the 
impression that Debian m68k cross-compilers are unavailable. Do you have 
any better sources of information that I could link to?

> so I think there is little incentive to use these old compilers.

It is useful for upstream developers to have distro-neutral tools. 
Ideally, we could use the kernel.org compiler as a "reference compiler".
For automated builds, it seems to be that already. But no-one boots those 
binaries AFAIK.

-- 

> 
> Adrian
> 
> 
