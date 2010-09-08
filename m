From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k/m68knommu: merge MMU and non-MMU string.h
Date: Wed, 08 Sep 2010 14:01:07 +0200
Message-ID: <m3lj7ctpfg.fsf@hase.home>
References: <201009070452.o874qqmg006794@goober.internal.moreton.com.au>
	<AANLkTim+jWjOKX_M52DWSKH2+oRWBXqc3TUFQp6esf3r@mail.gmail.com>
	<4C8776C5.9030205@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:52271 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751535Ab0IHMBL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Sep 2010 08:01:11 -0400
In-Reply-To: <4C8776C5.9030205@snapgear.com> (Greg Ungerer's message of "Wed,
	8 Sep 2010 21:43:01 +1000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, gerg@uclinux.org

Greg Ungerer <gerg@snapgear.com> writes:

> Hmm, good question. Maybe I should generate stand alone patches
> without gits rename detection turned on?

How did you manage to create the patch?  When I try I'm unable to get
this kind of patch even with rename/copy detection (I have set
diff.renamelimit=0 and diff.renames=copies).

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
