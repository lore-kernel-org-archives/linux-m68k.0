From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k/m68knommu: merge MMU and non-MMU string.h
Date: Wed, 08 Sep 2010 14:41:14 +0200
Message-ID: <m37hiwtnkl.fsf@hase.home>
References: <201009070452.o874qqmg006794@goober.internal.moreton.com.au>
	<AANLkTim+jWjOKX_M52DWSKH2+oRWBXqc3TUFQp6esf3r@mail.gmail.com>
	<4C8776C5.9030205@snapgear.com> <m3lj7ctpfg.fsf@hase.home>
	<4C877FF1.30808@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:53517 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753697Ab0IHMlQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Sep 2010 08:41:16 -0400
In-Reply-To: <4C877FF1.30808@snapgear.com> (Greg Ungerer's message of "Wed, 8
	Sep 2010 22:22:09 +1000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, gerg@uclinux.org

Greg Ungerer <gerg@snapgear.com> writes:

> I used:
>
>   git format-patch -M -B <COMMIT-ID>

Ok, -B did it.  Perhaps worth reporting as a git bug that git am/apply
cannot cope with this.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
