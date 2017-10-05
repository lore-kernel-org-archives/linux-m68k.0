From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Bug#877735: busybox: m68k build broken due to "-Os" in CFLAGS
Date: Thu, 5 Oct 2017 09:25:12 +0200
Message-ID: <998e4cf2-07bd-cb2d-1c47-c373372ce3fe@physik.fu-berlin.de>
References: <150715899716.21351.14956363415364529265.reportbug@stretch64.physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:45245 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751278AbdJEHZP (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 5 Oct 2017 03:25:15 -0400
In-Reply-To: <150715899716.21351.14956363415364529265.reportbug@stretch64.physik.fu-berlin.de>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Debian m68k <debian-68k@lists.debian.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, 877735@bugs.debian.org

Hi!

On 10/05/2017 01:16 AM, John Paul Adrian Glaubitz wrote:
> Since busybox is very important to boot the system and get
> debian-installer working, I would like to ask to have the
> change from [1] reverted for m68k until we have fixed the
> potential bug in gcc which most likely mis-compiled busybox.

On second thought, I would actually recommended to revert this change
for all architectures. Size isn't so much a constraint anymore these
days, you reduce the binary by about 200k. I don't think this is worth
the risk of breaking something as fundemantal as busybox.

Adrian

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
