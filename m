From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Bug#877735: busybox: m68k build broken due to "-Os" in CFLAGS
Date: Fri, 6 Oct 2017 01:09:35 +0200
Message-ID: <a9f5598b-7b94-e71d-ab75-2aff62efe52e@physik.fu-berlin.de>
References: <150715899716.21351.14956363415364529265.reportbug@stretch64.physik.fu-berlin.de>
 <998e4cf2-07bd-cb2d-1c47-c373372ce3fe@physik.fu-berlin.de>
 <CAEQ9gEmFPeibJUANPFbkTJfjyv6hLOG7Wr=ijyfrVSfRkKPEtw@mail.gmail.com>
 <150715899716.21351.14956363415364529265.reportbug@stretch64.physik.fu-berlin.de>
 <fb548f7a-eb98-949b-296c-fd031d8afa5f@physik.fu-berlin.de>
 <150715899716.21351.14956363415364529265.reportbug@stretch64.physik.fu-berlin.de>
 <20171005164054.k3tln4hduzmaw4tb@tack.einval.com>
 <1507237676@msgid.manchmal.in-ulm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:57486 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751083AbdJEXJh (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 5 Oct 2017 19:09:37 -0400
In-Reply-To: <1507237676@msgid.manchmal.in-ulm.de>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Christoph Biedl <debian.axhn@manchmal.in-ulm.de>
Cc: Steve McIntyre <steve@einval.com>, 877735@bugs.debian.org, Roger Shimizu <rogershimizu@gmail.com>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 10/05/2017 11:49 PM, Christoph Biedl wrote:
> About that particular issue I'd really like to avoid a per-architecture
> switch in busybox. It adds complexity and works around a problem
> instead of solving it.

I wouldn't call that simple if-clause complexity.

> So please take this to gcc first unless you've
> already done so. And let us know if you get the impression this won't
> get fixed soon-ish - breaking an architecture still beats packaging
> principles.

gcc bugs aren't usually something that get fixed promptly, in particular
when talking about non-mainstream architectures like m68k.

I will mark busybox as "Not-For-Us" for the time being now because I
don't want to be chasing this package over this and keep building
it manually so that debian-installer doesn't break for us.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
