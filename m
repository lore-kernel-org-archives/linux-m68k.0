From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: debian-installer progress and input needed
Date: Sun, 21 May 2017 13:33:20 +0200
Message-ID: <242cd92a-e660-088e-6656-393dbcf74792@physik.fu-berlin.de>
References: <b9651ade-0079-c8c6-40a3-80549f3601c5@physik.fu-berlin.de>
 <a86ad435-c026-55cb-5a0e-d2797e23736b@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:53278 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750824AbdEULdW (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 21 May 2017 07:33:22 -0400
In-Reply-To: <a86ad435-c026-55cb-5a0e-d2797e23736b@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Debian m68k <debian-68k@lists.debian.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On 05/17/2017 02:24 PM, John Paul Adrian Glaubitz wrote:
> Ok, let's get some order into this.
> 
> I have already opened a bug report to include loop-modules [1].
> 
> Then, looking at the module packages on m68k [2] and powerpc [3],
> I suggest to add the following new packages first:
> (...)
> Did I miss anything?

I have made some changes to src:linux now following the previous discussion
and I have pushed them to github [1].

Comments?

Adrian

> [1] https://github.com/glaubitz/linux-debian/commits/m68k

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
