From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Futex problems with firebird3.0 and openjdk-8 on m68k
Date: Thu, 11 May 2017 10:20:01 +0200
Message-ID: <20170511082001.GA10826@physik.fu-berlin.de>
References: <1628e911-c94f-2cdd-6c48-5a54829a032f@physik.fu-berlin.de>
 <Pine.BSM.4.64L.1705102120080.22216@herc.mirbsd.org>
 <3adce84b-790a-9e6f-724d-d8e873632aef@physik.fu-berlin.de>
 <alpine.LNX.2.00.1705111246370.21370@nippy.intranet>
 <57267999-aa42-3478-9527-8d3c6fcba004@physik.fu-berlin.de>
 <alpine.LNX.2.00.1705111610410.23897@nippy.intranet>
 <97dd75af-d1da-5cb6-ef73-e1f968be3d61@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost5.zedat.fu-berlin.de ([130.133.4.89]:47249 "EHLO
        outpost5.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932084AbdEKI2i (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Thu, 11 May 2017 04:28:38 -0400
Content-Disposition: inline
In-Reply-To: <97dd75af-d1da-5cb6-ef73-e1f968be3d61@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Thorsten Glaser <tg@mirbsd.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, May 11, 2017 at 08:38:42AM +0200, John Paul Adrian Glaubitz wrote:
> Mmh, it doesn't work at the moment because I uploaded a patched glibc package
> to "unreleased" and debootstrap doesn't support that. You need a patched
> version of debootstrap to make this work.

FWIW, you can just download this older chroot I created in 2015 [1],
unpack it, copy qemu-m68k-static into the usr/bin sub-directory and
perform a dist-upgrade.

Use this updated sources.list [2], the old one doesn't work anymore.

Btw, if you build firebird3.0 in this chroot without updating the
glibc, the problem will actually go away. However, since there are a
lot of other packages tied to the version of glibc, especially Perl, I
cannot rule out it's not some other package causing the issue.

Adrian

> [1] https://people.debian.org/~glaubitz/chroots/unstable-m68k-20150315.tar.gz
> [2] https://people.debian.org/~glaubitz/sources.list

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
