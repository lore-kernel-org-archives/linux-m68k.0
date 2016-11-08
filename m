From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: gcc-4.6.3, was Re: Debian on mac68k
Date: Wed, 9 Nov 2016 10:06:44 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1611090924080.2702@nippy.intranet>
References: <574C132F.3070404@abbuc.de> <574C15C2.90908@abbuc.de> <ec5ded9d-b3c0-0bba-65b7-1e4d2cc063a2@physik.fu-berlin.de> <574C1792.4030403@abbuc.de> <57557722.5040808@yahoo.com> <alpine.LNX.2.00.1610251358330.443@nippy.intranet> <5810FA8D.4060702@yahoo.com>
 <58114F74.40408@yahoo.com> <alpine.LNX.2.00.1610271244020.21780@nippy.intranet> <5811F96F.3090602@yahoo.com> <58121D46.8060506@yahoo.com> <alpine.LNX.2.00.1611052134280.2870@nippy.intranet> <5873dbec-38c0-7f7f-4a6b-68c5deb546be@sysam.it>
 <alpine.LNX.2.00.1611082000250.11408@nippy.intranet> <ea450097-fdfc-800a-a28f-79b086ba7eac@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:43242 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751032AbcKHXG2 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Nov 2016 18:06:28 -0500
In-Reply-To: <ea450097-fdfc-800a-a28f-79b086ba7eac@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Angelo Dureghello <angelo@sysam.it>, debian-68k@lists.debian.org, linux-m68k@vger.kernel.org


On Tue, 8 Nov 2016, John Paul Adrian Glaubitz wrote:

> On 11/08/2016 10:01 AM, Finn Thain wrote:
> > The only problem is that my fast Linux host is i686 and your compiler 
> > runs on x86_64. But it is a convenient way to get hold of a gcc-5.2 
> > compiler to target m68k/coldfire.
> 
> Installing Debian testing and running
> 
> 	apt install gcc-5-m68k-linux-gnu
> 
> is not an option?

As a way to get a compiler, it's more difficult than untarring the one 
from kernel.org, which was the effort I've been willing to invest so far.

I would consider installing the Debian Testing compiler in the form of a 
container, if one was available.

Or I could just update my cross-compiler build scripts again, but that 
solution doesn't get the upstream project much closer to the ideal 
solution, i.e. a convenient, reliable "reference" compiler.

That would require supported compiler and distro releases. Certainly 
Debian's gcc-5-m68k-linux-gnu or gcc-6-m68k-linux-gnu packages are good 
candidates for building a container, and time permitting, I would 
willingly test them and isolate and report any bugs I found.

-- 

> 
> Adrian
> 
> 
