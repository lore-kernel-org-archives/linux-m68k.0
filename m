From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Bug#877735: busybox: m68k build broken due to "-Os" in CFLAGS
Date: Thu, 5 Oct 2017 21:52:55 +0200
Message-ID: <b2166bd9-576d-1fde-2349-a2b5ae64a842@physik.fu-berlin.de>
References: <150715899716.21351.14956363415364529265.reportbug@stretch64.physik.fu-berlin.de>
 <150715899716.21351.14956363415364529265.reportbug@stretch64.physik.fu-berlin.de>
 <998e4cf2-07bd-cb2d-1c47-c373372ce3fe@physik.fu-berlin.de>
 <20171005163846.kqzwht6276t3jxa6@tack.einval.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:59922 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751405AbdJETw5 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 5 Oct 2017 15:52:57 -0400
In-Reply-To: <20171005163846.kqzwht6276t3jxa6@tack.einval.com>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Steve McIntyre <steve@einval.com>, 877735@bugs.debian.org
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 10/05/2017 06:38 PM, Steve McIntyre wrote:
>> On second thought, I would actually recommended to revert this change
>> for all architectures. Size isn't so much a constraint anymore these
>> days, you reduce the binary by about 200k. I don't think this is worth
>> the risk of breaking something as fundemantal as busybox.
> 
> I'd be more worried about the compiler breakage, to be honest. -Os is
> meant to work!

Yes, it is meant to work. But it is not as guaranteed to work as -O2
simply because the majority of packages are built with -O2. So, there
is some potential of things breaking.

Of course, these issues should be fixed and I will file a bug report
on the problem. I just meant that varying the optimization levels
is not something that you can expect to work in 100% of the cases.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
