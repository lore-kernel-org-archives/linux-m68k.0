From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Futex problems with firebird3.0 and openjdk-8 on m68k
Date: Thu, 25 May 2017 15:17:05 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1705251447120.1848@nippy.intranet>
References: <1628e911-c94f-2cdd-6c48-5a54829a032f@physik.fu-berlin.de> <Pine.BSM.4.64L.1705102120080.22216@herc.mirbsd.org> <3adce84b-790a-9e6f-724d-d8e873632aef@physik.fu-berlin.de> <alpine.LNX.2.00.1705111246370.21370@nippy.intranet>
 <57267999-aa42-3478-9527-8d3c6fcba004@physik.fu-berlin.de> <alpine.LNX.2.00.1705111610410.23897@nippy.intranet> <97dd75af-d1da-5cb6-ef73-e1f968be3d61@physik.fu-berlin.de> <20170511082001.GA10826@physik.fu-berlin.de> <alpine.LNX.2.00.1705201604460.2137@nippy.intranet>
 <29030655-b6d9-9301-5c0e-fcb78aad28f1@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:38770 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941907AbdEYFRH (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 25 May 2017 01:17:07 -0400
In-Reply-To: <29030655-b6d9-9301-5c0e-fcb78aad28f1@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Thorsten Glaser <tg@mirbsd.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, 21 May 2017, John Paul Adrian Glaubitz wrote:
> On 05/20/2017 08:53 AM, Finn Thain wrote:
> >> Btw, if you build firebird3.0 in this chroot without updating the 
> >> glibc, the problem will actually go away.
> > 
> > OK, I will try that too. But first I will try to reproduce the bug.
> > 
> > What's the quickest way to reproduce the build failure for the 
> > firebird3.0 deb?
> 
> 1. Make sure you have the necessary "deb-src" entries in your 
>    sources.list:
> 
> # binary default
> deb http://ftp.ports.debian.org/debian-ports/ unstable main
> deb http://incoming.ports.debian.org/buildd/ unstable main
> deb http://ftp.ports.debian.org/debian-ports/ unreleased main
> 
> # source
> deb-src http://ftp.debian.org/debian/ unstable main
> deb-src http://incoming.debian.org/debian-buildd/ buildd-unstable main
> 
> 2. Run "apt update"
> 
> 3. apt install devscripts && apt build-dep firebird3.0
> 
> 4. dget -u http://deb.debian.org/debian/pool/main/f/firebird3.0/firebird3.0_3.0.2.32703.ds4-1.dsc
> 
> 5. cd firebird3.0-3.0.2.32703.ds4/
> 
> 6. ./debian/rules binary-arch
> 
> It should hang at some point when running the compiled binary on Aranym 
> or qemu-system. On qemu-user, it will just crash but for other reasons.
> 
> Although I didn't test it with qemu-system, I am very confident it 
> should hang the same way as on Aranym. The qemu-user crash is related to 
> the broken atomics in qemu-user.
> 

The build didn't hang when I ran it (twice) on vanilla kernel v4.11.0 on 
Laurent's qemu-system. This rootfs is fully up-to-date, as I described in 
earlier in this thread.

The build stops here:

[snip]
touch build-firebird-stamp
touch build-stamp
dh_testdir
dh_testroot
dh_prep
dh_installdirs
sh debian/make_packages.sh
Creating firebird3.0-server-core content
Creating firebird3.0-server content
stdin not open for reading!
stdin not open for reading!
dh_installman: man --recode UTF-8 ./fbtracemgr\.1 > fbtracemgr\.1\.new 
returned exit code 2
debian/rules:217: recipe for target 'install-stamp' failed
make: *** [install-stamp] Error 2

Let me know if you would like me to send the entire log.

It may be that following the same steps would yield the same result under 
Aranym that I got under qemu (being that Andreas was able to build 
3.0.1.32609 under Aranym).

Or it may be that you, Andreas and I have attempted to build three 
different versions of firebird3.0, meaning that our results can't be 
compared.

But my guess is that your build chroots and/or their host kernel is 
different to this system in some small but significant way.

P.S. This thread could perhaps be confined to the debian-68k list?

-- 

> Adrian
> 
> 
