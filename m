From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Futex problems with firebird3.0 and openjdk-8 on m68k
Date: Thu, 11 May 2017 08:38:42 +0200
Message-ID: <97dd75af-d1da-5cb6-ef73-e1f968be3d61@physik.fu-berlin.de>
References: <1628e911-c94f-2cdd-6c48-5a54829a032f@physik.fu-berlin.de>
 <Pine.BSM.4.64L.1705102120080.22216@herc.mirbsd.org>
 <3adce84b-790a-9e6f-724d-d8e873632aef@physik.fu-berlin.de>
 <alpine.LNX.2.00.1705111246370.21370@nippy.intranet>
 <57267999-aa42-3478-9527-8d3c6fcba004@physik.fu-berlin.de>
 <alpine.LNX.2.00.1705111610410.23897@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:60383 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754664AbdEKGip (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Thu, 11 May 2017 02:38:45 -0400
In-Reply-To: <alpine.LNX.2.00.1705111610410.23897@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Thorsten Glaser <tg@mirbsd.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 05/11/2017 08:27 AM, Finn Thain wrote:
> That's promising, but it doesn't eliminate glibc as a potential problem.
> Do we have glibc test suite results?

Well, it's potentially a glibc problem. But I haven't fully ruled out
other packages yet. All I know is that it works with an older chroot
which has glibc-2.19. But it may be related to gcc as well, no idea.

>> And on Aranym, I'm running the same kernel on which it works with an 
>> older chroot. And, as I said, when I replace the libjvm.so itself, it 
>> works. So, it seems the library is getting somehow miscompiled.
>>
> 
> ... and hence my race condition hypothesis. But I'm guessing.

But wouldn't it then show in the old chroot sometimes as well? It never
shows there, just with the recent chroot.

>>> I can run the kernel futex test suite under QEMU once this debootstrap 
>>> issue is sorted:
>>>
>>> dpkg: error processing package mac-fdisk (--configure):
>>>  subprocess installed post-installation script returned error exit status 2
>>> Errors were encountered while processing:
>>>  mac-fdisk
>>> Setting up mac-fdisk (0.1-16+b1) ...
>>
>> I'm not sure why you keep including mac-fdisk in your debbootstrap run,
> 
> AFAIK I didn't include it. How would it get included?

It shouldn't. It's not necessary at all. Try bootstrapping with --variant=minimal.

> Here's the command I used:
> 
> debootstrap --arch=m68k --foreign --no-check-gpg --include=apt,nano unstable /export/debian-68k http://ftp.de.debian.org/debian-ports

Mmh, it doesn't work at the moment because I uploaded a patched glibc package
to "unreleased" and debootstrap doesn't support that. You need a patched
version of debootstrap to make this work.

> Yep, it's Gentoo. But to be fair, it performed a native debootstrap just 
> fine. Next time I'll use the native chroot to debootstrap the m68k one.

Unless Gentoo modified debootstrap in some way, that shouldn't be a problem.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
