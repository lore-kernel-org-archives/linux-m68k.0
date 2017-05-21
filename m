From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Futex problems with firebird3.0 and openjdk-8 on m68k
Date: Sun, 21 May 2017 07:27:43 +0200
Message-ID: <29030655-b6d9-9301-5c0e-fcb78aad28f1@physik.fu-berlin.de>
References: <1628e911-c94f-2cdd-6c48-5a54829a032f@physik.fu-berlin.de>
 <Pine.BSM.4.64L.1705102120080.22216@herc.mirbsd.org>
 <3adce84b-790a-9e6f-724d-d8e873632aef@physik.fu-berlin.de>
 <alpine.LNX.2.00.1705111246370.21370@nippy.intranet>
 <57267999-aa42-3478-9527-8d3c6fcba004@physik.fu-berlin.de>
 <alpine.LNX.2.00.1705111610410.23897@nippy.intranet>
 <97dd75af-d1da-5cb6-ef73-e1f968be3d61@physik.fu-berlin.de>
 <20170511082001.GA10826@physik.fu-berlin.de>
 <alpine.LNX.2.00.1705201604460.2137@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:35683 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751108AbdEUF1s (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 21 May 2017 01:27:48 -0400
In-Reply-To: <alpine.LNX.2.00.1705201604460.2137@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Thorsten Glaser <tg@mirbsd.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 05/20/2017 08:53 AM, Finn Thain wrote:
>> Btw, if you build firebird3.0 in this chroot without updating the glibc, 
>> the problem will actually go away.
> 
> OK, I will try that too. But first I will try to reproduce the bug.
> 
> What's the quickest way to reproduce the build failure for the firebird3.0 
> deb?

1. Make sure you have the necessary "deb-src" entries in your sources.list:

# binary default
deb http://ftp.ports.debian.org/debian-ports/ unstable main
deb http://incoming.ports.debian.org/buildd/ unstable main
deb http://ftp.ports.debian.org/debian-ports/ unreleased main

# source
deb-src http://ftp.debian.org/debian/ unstable main
deb-src http://incoming.debian.org/debian-buildd/ buildd-unstable main

2. Run "apt update"

3. apt install devscripts && apt build-dep firebird3.0

4. dget -u http://deb.debian.org/debian/pool/main/f/firebird3.0/firebird3.0_3.0.2.32703.ds4-1.dsc

5. cd firebird3.0-3.0.2.32703.ds4/

6. ./debian/rules binary-arch

It should hang at some point when running the compiled binary on Aranym
or qemu-system. On qemu-user, it will just crash but for other reasons.

Although I didn't test it with qemu-system, I am very confident it should
hang the same way as on Aranym. The qemu-user crash is related to the
broken atomics in qemu-user.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
