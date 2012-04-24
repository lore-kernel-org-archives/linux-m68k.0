From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: __udivsi3: coldfire vs non-coldfire implementation
Date: Tue, 24 Apr 2012 17:39:15 +0200
Message-ID: <m2wr55jg0s.fsf@igel.home>
References: <CAGj5WxCrOC-SKUjrv=3RTTjx7F5n4+vLhH_7HRS1crVSnf6RuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:43351 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755559Ab2DXPjR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 24 Apr 2012 11:39:17 -0400
In-Reply-To: <CAGj5WxCrOC-SKUjrv=3RTTjx7F5n4+vLhH_7HRS1crVSnf6RuA@mail.gmail.com>
	(Luis Alves's message of "Tue, 24 Apr 2012 15:14:17 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Luis Alves <ljalvs@gmail.com>
Cc: linux-m68k@vger.kernel.org

Luis Alves <ljalvs@gmail.com> writes:

> What's the reason for having two different algorithms for this function?
> The coldfire version seems faster since it doesn't perform any div/mul
> opcodes. Or am I wrong?

The coldfire version would require a minimum of 1800 cycles on a 68000.
The 68000 version is dominated by either two divu (max 140 cycles each)
or an lsr loop of max 900 cycles plus divu and two mulu (max 70 cycles
each) plus some 100 cycles for the rest.  That should make it better for
all inputs.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
