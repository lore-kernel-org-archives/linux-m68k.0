From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Futex problems with firebird3.0 and openjdk-8 on m68k
Date: Thu, 11 May 2017 12:46:52 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1705111246370.21370@nippy.intranet>
References: <1628e911-c94f-2cdd-6c48-5a54829a032f@physik.fu-berlin.de> <Pine.BSM.4.64L.1705102120080.22216@herc.mirbsd.org> <3adce84b-790a-9e6f-724d-d8e873632aef@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:50174 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752398AbdEKCqY (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 10 May 2017 22:46:24 -0400
In-Reply-To: <3adce84b-790a-9e6f-724d-d8e873632aef@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Thorsten Glaser <tg@mirbsd.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Wed, 10 May 2017, John Paul Adrian Glaubitz wrote:

> On 05/10/2017 11:21 PM, Thorsten Glaser wrote:

> > Does diffing the disassembly of (parts of) that give any meaningful 
> > information? Maybe rather the individual .a files in libjvm.a?
> 
> Hmm, that could be an idea. However, I don't have a static library at 
> the moment, just the dynamic one.
> 
> Here's a tarball containing the working one and the broken one, with the 
> SUSE one being the one that works:
> 
> > https://people.debian.org/~glaubitz/libjvm-m68k.tgz
> 

Or maybe a race condition in the kernel or glibc futex implementation? If 
so, the problem won't be apparent from comparing libjvm builds. Are there 
any other known issues with libjvm on m68k?

I can run the kernel futex test suite under QEMU once this debootstrap 
issue is sorted:

dpkg: error processing package mac-fdisk (--configure):
 subprocess installed post-installation script returned error exit status 2
Errors were encountered while processing:
 mac-fdisk
Setting up mac-fdisk (0.1-16+b1) ...
dpkg: error: unknown option --print-installation-architecture

(Or maybe on some other system, given remote access.)

-- 
