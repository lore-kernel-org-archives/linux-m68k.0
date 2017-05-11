From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Futex problems with firebird3.0 and openjdk-8 on m68k
Date: Thu, 11 May 2017 16:27:22 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1705111610410.23897@nippy.intranet>
References: <1628e911-c94f-2cdd-6c48-5a54829a032f@physik.fu-berlin.de> <Pine.BSM.4.64L.1705102120080.22216@herc.mirbsd.org> <3adce84b-790a-9e6f-724d-d8e873632aef@physik.fu-berlin.de> <alpine.LNX.2.00.1705111246370.21370@nippy.intranet>
 <57267999-aa42-3478-9527-8d3c6fcba004@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:55674 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753303AbdEKG0y (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 11 May 2017 02:26:54 -0400
In-Reply-To: <57267999-aa42-3478-9527-8d3c6fcba004@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Thorsten Glaser <tg@mirbsd.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Thu, 11 May 2017, John Paul Adrian Glaubitz wrote:

> On 05/11/2017 04:46 AM, Finn Thain wrote:
> > Or maybe a race condition in the kernel or glibc futex implementation?
> 
> On qemu-m68k, the kernel isn't even running.

That's promising, but it doesn't eliminate glibc as a potential problem.
Do we have glibc test suite results?

> And on Aranym, I'm running the same kernel on which it works with an 
> older chroot. And, as I said, when I replace the libjvm.so itself, it 
> works. So, it seems the library is getting somehow miscompiled.
> 

... and hence my race condition hypothesis. But I'm guessing.

> > If so, the problem won't be apparent from comparing libjvm builds. Are 
> > there any other known issues with libjvm on m68k?
> 
> Not that I know of. However, since I haven't managed yet to do a clean 
> openjdk build on Debian/m68k, I can't really say.
> 
> > I can run the kernel futex test suite under QEMU once this debootstrap 
> > issue is sorted:
> > 
> > dpkg: error processing package mac-fdisk (--configure):
> >  subprocess installed post-installation script returned error exit status 2
> > Errors were encountered while processing:
> >  mac-fdisk
> > Setting up mac-fdisk (0.1-16+b1) ...
> 
> I'm not sure why you keep including mac-fdisk in your debbootstrap run,

AFAIK I didn't include it. How would it get included?

> it's not required at all.

It shouldn't be; it's not useful on most m68k platforms.

> A regular debootstrap works without problems, it's performed regularly 
> on the buildds:
> 
> # debootstrap --no-check-gpg --include=apt,nano,aptitude,vim unstable unstable-m68k ftp://ftp.debian-ports.org/debian
> 
> Or, when cross-bootstrapping:
> 
> # debootstrap --no-check-gpg --arch=m68k --foreign --include=apt,nano,aptitude,vim unstable unstable-m68k ftp://ftp.debian-ports.org/debian
> 

Here's the command I used:

debootstrap --arch=m68k --foreign --no-check-gpg --include=apt,nano unstable /export/debian-68k http://ftp.de.debian.org/debian-ports

Full disclosure:

# which debootstrap
/usr/sbin/debootstrap
# equery belongs /usr/sbin/debootstrap
 * Searching for /usr/sbin/debootstrap ... 
dev-util/debootstrap-1.0.87 (/usr/sbin/debootstrap)
# 

Yep, it's Gentoo. But to be fair, it performed a native debootstrap just 
fine. Next time I'll use the native chroot to debootstrap the m68k one.

-- 

> Adrian
> 
> 
