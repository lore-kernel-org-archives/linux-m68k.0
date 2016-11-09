From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: gcc-4.6.3, was Re: Debian on mac68k
Date: Wed, 9 Nov 2016 11:24:01 +0100
Message-ID: <531d0bf8-3f25-3df8-10de-1f20fac214c8@physik.fu-berlin.de>
References: <574C132F.3070404@abbuc.de> <574C15C2.90908@abbuc.de>
 <ec5ded9d-b3c0-0bba-65b7-1e4d2cc063a2@physik.fu-berlin.de>
 <574C1792.4030403@abbuc.de> <57557722.5040808@yahoo.com>
 <alpine.LNX.2.00.1610251358330.443@nippy.intranet>
 <5810FA8D.4060702@yahoo.com> <58114F74.40408@yahoo.com>
 <alpine.LNX.2.00.1610271244020.21780@nippy.intranet>
 <5811F96F.3090602@yahoo.com> <58121D46.8060506@yahoo.com>
 <alpine.LNX.2.00.1611052134280.2870@nippy.intranet>
 <5873dbec-38c0-7f7f-4a6b-68c5deb546be@sysam.it>
 <alpine.LNX.2.00.1611082000250.11408@nippy.intranet>
 <ea450097-fdfc-800a-a28f-79b086ba7eac@physik.fu-berlin.de>
 <alpine.LNX.2.00.1611090924080.2702@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:57213 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752429AbcKIKYE (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 9 Nov 2016 05:24:04 -0500
In-Reply-To: <alpine.LNX.2.00.1611090924080.2702@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Angelo Dureghello <angelo@sysam.it>, debian-68k@lists.debian.org, linux-m68k@vger.kernel.org

On 11/09/2016 12:06 AM, Finn Thain wrote:
> As a way to get a compiler, it's more difficult than untarring the one 
> from kernel.org, which was the effort I've been willing to invest so far.

If you're not on a Debian-based distribution, that is :).

> I would consider installing the Debian Testing compiler in the form of a 
> container, if one was available.

You can just install Debian into a systemd-nspawn chroot with the help
of debootstrap. No need to use Docker or anything else. I have used
this method to install and boot Fedora Rawhide on my Debian unstable
system. Pretty nifty and simple:

# debootstrap --no-check-gpg --arch=amd64 --variant=buildd unstable /srv/unstable/ ftp://ftp.debian.org/debian
# systemd-nspawn -bD /srv/unstable

That's all you need to boot a Debian container on any machine running systemd.

> Or I could just update my cross-compiler build scripts again, but that 
> solution doesn't get the upstream project much closer to the ideal 
> solution, i.e. a convenient, reliable "reference" compiler.

Does that really make such a difference? I have always used the gcc
versions shipped in Debian and never had any issues. Matthias Klose
also updates them very regularly, so I don't have to worry about
that.

> That would require supported compiler and distro releases. Certainly 
> Debian's gcc-5-m68k-linux-gnu or gcc-6-m68k-linux-gnu packages are good 
> candidates for building a container, and time permitting, I would 
> willingly test them and isolate and report any bugs I found.

We're thoroughly testing the toolchain in Debian on the buildds. By
actively building packages, we have found many bugs in gcc and binutils,
most of them were in the SH and SPARC targets though. I don't remember
running into any m68k-related toolchain issue.

Btw, there is one additional advantage using Debian for cross-platform
work: Multi-Arch. You can easily install build dependencies when
cross-building for other targets. I have used this extensively to
bootstrap ghc [1].

Adrian

> [1] https://wiki.debian.org/PortsDocs/BootstrappingGHC

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
