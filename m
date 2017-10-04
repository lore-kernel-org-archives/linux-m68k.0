From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Kernel 4.13 is broken on m68k
Date: Thu, 5 Oct 2017 01:00:28 +0200
Message-ID: <0dee43df-02c5-de28-7934-13ae94f00737@physik.fu-berlin.de>
References: <9f2342b1-af46-27e9-e38d-9485d1719c07@physik.fu-berlin.de>
 <a10e5dde-b3a6-a525-d403-154c16e60b35@physik.fu-berlin.de>
 <874lre7cvf.fsf@linux-m68k.org>
 <63aaef75-5504-a8b9-485f-746f25391cfa@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:56807 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750951AbdJDXAa (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 4 Oct 2017 19:00:30 -0400
In-Reply-To: <63aaef75-5504-a8b9-485f-746f25391cfa@physik.fu-berlin.de>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On 10/05/2017 12:49 AM, John Paul Adrian Glaubitz wrote:
> busybox has gotten new maintainers in Debian and they have stripped
> "-O2" from CFLAGS so that it's building with "-Os" now [1].
> 
> Maybe that caused the code to be miscompiled. I hope I won't have
> to bisect busybox.

Reverting the commit from [1] fixes the problem for me:

root@pacman:~# busybox ash -c 'echo ${x}'

root@pacman:~#

Adrian

>> [1] https://anonscm.debian.org/cgit/d-i/busybox.git/commit/?id=8a115a910fb3cd7a525972e150a32f8aeb1da49

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
