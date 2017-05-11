From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Futex problems with firebird3.0 and openjdk-8 on m68k
Date: Thu, 11 May 2017 07:55:23 +0200
Message-ID: <57267999-aa42-3478-9527-8d3c6fcba004@physik.fu-berlin.de>
References: <1628e911-c94f-2cdd-6c48-5a54829a032f@physik.fu-berlin.de>
 <Pine.BSM.4.64L.1705102120080.22216@herc.mirbsd.org>
 <3adce84b-790a-9e6f-724d-d8e873632aef@physik.fu-berlin.de>
 <alpine.LNX.2.00.1705111246370.21370@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:35780 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751146AbdEKFzZ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Thu, 11 May 2017 01:55:25 -0400
In-Reply-To: <alpine.LNX.2.00.1705111246370.21370@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Thorsten Glaser <tg@mirbsd.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 05/11/2017 04:46 AM, Finn Thain wrote:
> Or maybe a race condition in the kernel or glibc futex implementation?

On qemu-m68k, the kernel isn't even running. And on Aranym, I'm running
the same kernel on which it works with an older chroot. And, as I said,
when I replace the libjvm.so itself, it works. So, it seems the library
is getting somehow miscompiled.

> If so, the problem won't be apparent from comparing libjvm builds. Are there 
> any other known issues with libjvm on m68k?

Not that I know of. However, since I haven't managed yet to do a clean
openjdk build on Debian/m68k, I can't really say.

> I can run the kernel futex test suite under QEMU once this debootstrap 
> issue is sorted:
> 
> dpkg: error processing package mac-fdisk (--configure):
>  subprocess installed post-installation script returned error exit status 2
> Errors were encountered while processing:
>  mac-fdisk
> Setting up mac-fdisk (0.1-16+b1) ...

I'm not sure why you keep including mac-fdisk in your debbootstrap run,
it's not required at all. A regular debootstrap works without problems,
it's performed regularly on the buildds:

# debootstrap --no-check-gpg --include=apt,nano,aptitude,vim unstable unstable-m68k ftp://ftp.debian-ports.org/debian

Or, when cross-bootstrapping:

# debootstrap --no-check-gpg --arch=m68k --foreign --include=apt,nano,aptitude,vim unstable unstable-m68k ftp://ftp.debian-ports.org/debian

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
