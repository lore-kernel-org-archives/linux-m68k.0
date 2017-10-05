From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Bug#877735: busybox: m68k build broken due to "-Os" in CFLAGS
Date: Thu, 5 Oct 2017 18:12:46 +0200
Message-ID: <fb548f7a-eb98-949b-296c-fd031d8afa5f@physik.fu-berlin.de>
References: <150715899716.21351.14956363415364529265.reportbug@stretch64.physik.fu-berlin.de>
 <998e4cf2-07bd-cb2d-1c47-c373372ce3fe@physik.fu-berlin.de>
 <CAEQ9gEmFPeibJUANPFbkTJfjyv6hLOG7Wr=ijyfrVSfRkKPEtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:33155 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751094AbdJEQMs (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 5 Oct 2017 12:12:48 -0400
In-Reply-To: <CAEQ9gEmFPeibJUANPFbkTJfjyv6hLOG7Wr=ijyfrVSfRkKPEtw@mail.gmail.com>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Roger Shimizu <rogershimizu@gmail.com>, 877735@bugs.debian.org
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 10/05/2017 05:55 PM, Roger Shimizu wrote:
>> On second thought, I would actually recommended to revert this change
>> for all architectures. Size isn't so much a constraint anymore these
>> days, you reduce the binary by about 200k. I don't think this is worth
>> the risk of breaking something as fundemantal as busybox.
> 
> Please exclude armel, which has size limitation on initrd of d-i [0].
Hmm, ok. Is that currently actually a concern? If I'm seeing that correctly,
the "-Os" here only saved us around 200k. Does that already make a difference
on armel?

If yes, I'm also fine with something like

# On m68k, building with -Os leads to miscompiled code
ifeq (m68k,$(DEB_HOST_ARCH))
	CFLAGS := $(filter-out -Werror=format-security, ${CFLAGS})
else
	CFLAGS := $(filter-out -Werror=format-security -O2, ${CFLAGS})
endif

Adrian

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
