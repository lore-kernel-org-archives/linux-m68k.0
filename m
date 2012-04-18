From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k: Make sure {read,write}s[bwl]() are always defined
Date: Wed, 18 Apr 2012 13:49:08 +0200
Message-ID: <m2vckx9s5n.fsf@igel.home>
References: <1334516410-5777-1-git-send-email-geert@linux-m68k.org>
	<4F8C08F1.5050907@snapgear.com> <4F8E7458.8030301@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:49837 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752524Ab2DRLtN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 18 Apr 2012 07:49:13 -0400
In-Reply-To: <4F8E7458.8030301@gmail.com> (Michael Schmitz's message of "Wed,
	18 Apr 2012 19:59:20 +1200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Greg Ungerer <gerg@snapgear.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Michael Schmitz <schmitzmic@googlemail.com> writes:

> I sure hope you are wrong :-) But I think I saw some non-MMU Atari use
> attempts mentioned on the list, and the ROM port ISA adapter could well be
> used on non-MMU Ataris (though I'm not sure what address the ROM port
> would be mapped at on those - I'm sure Andreas will know the details
> there).

There is no difference in the I/O memory layout between the Atari models
for hardware components that are in common.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
