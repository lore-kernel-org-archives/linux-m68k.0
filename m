From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: gcc-4.6.3, was Re: Debian on mac68k
Date: Sun, 6 Nov 2016 23:33:31 +0100
Message-ID: <7e252240-de89-6d27-fa6e-518beedf1cd6@physik.fu-berlin.de>
References: <574C132F.3070404@abbuc.de> <574C15C2.90908@abbuc.de>
 <ec5ded9d-b3c0-0bba-65b7-1e4d2cc063a2@physik.fu-berlin.de>
 <574C1792.4030403@abbuc.de> <57557722.5040808@yahoo.com>
 <alpine.LNX.2.00.1610251358330.443@nippy.intranet>
 <5810FA8D.4060702@yahoo.com> <58114F74.40408@yahoo.com>
 <alpine.LNX.2.00.1610271244020.21780@nippy.intranet>
 <5811F96F.3090602@yahoo.com> <58121D46.8060506@yahoo.com>
 <alpine.LNX.2.00.1611052134280.2870@nippy.intranet>
 <fbb16cf0-6fe1-8231-c85a-8c65b3d8f50d@physik.fu-berlin.de>
 <alpine.LNX.2.00.1611070917240.29060@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:55595 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750955AbcKFWdf (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 6 Nov 2016 17:33:35 -0500
In-Reply-To: <alpine.LNX.2.00.1611070917240.29060@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: debian-68k@lists.debian.org, linux-m68k@vger.kernel.org

On 11/06/2016 11:22 PM, Finn Thain wrote:
>> No, not really. Is there any particular reason why you are using these 
>> old compilers?
> 
> Mature, proven tools are important to upstream developers. Developers of 
> distros needn't have the same expectations, since they take it upon 
> themselves to put together reliable tools.

To be honest, my personal experience is different. The toolchain has often
bugs and lots of bugs are constantly being fixed upstream which is why
Debian is always following the respective gcc SVN branches instead of
using release versions.

Thus, gcc-6 in Debian isn't based on a release version but rather on the
current gcc-6 SVN branch with all recent fixes and updates.

>> In Debian, we have up-to-date versions of the gcc cross-toolchain for 
>> all target architectures we have in Debian,
> 
> Some years ago, for Debian users, I added links to those tools here: 
> http://www.mac.linux-m68k.org/docs/cross-dev.php
> 
> But I suspect that this information is no longer current. It may give the 
> impression that Debian m68k cross-compilers are unavailable. Do you have 
> any better sources of information that I could link to?

If you're on Debian Stretch or newer, you can just install everything
directly from the regular package archives, very convenient:

$ apt install gcc-m68k-linux-gnu g++-m68k-linux-gnu binutils-m68k-linux-gnu

>> so I think there is little incentive to use these old compilers.
> 
> It is useful for upstream developers to have distro-neutral tools. 
> Ideally, we could use the kernel.org compiler as a "reference compiler".
> For automated builds, it seems to be that already. But no-one boots those 
> binaries AFAIK.

The problem with the toolchain on kernel.org seems that it's not updated
very often if at all. I mean, gcc-4.6.3 is ancient, that was released
over four years ago [1]. gcc has seen lots of improvements and fixes,
particularly the SH has had so many bugs fixed that I'd highly discourage
people using any of the older versions.

Adrian

> [1] https://gcc.gnu.org/gcc-4.6/

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
