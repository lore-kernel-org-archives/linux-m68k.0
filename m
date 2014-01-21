From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: v3.13 panic in init_bootmem_core
Date: Tue, 21 Jan 2014 15:13:29 +0100
Message-ID: <87bnz5ifsm.fsf@igel.home>
References: <87sishiqmg.fsf@igel.home>
	<CAMuHMdUcGzFsnaxpLfvhEXyHc79c7e7Hd6RjmSFj1nk++zS00g@mail.gmail.com>
	<87fvohihx4.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:37073 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754277AbaAUONc (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 21 Jan 2014 09:13:32 -0500
In-Reply-To: <87fvohihx4.fsf@igel.home> (Andreas Schwab's message of "Tue, 21
	Jan 2014 14:27:35 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

> The size is 4089118 vs. 4135192, so still below 4M, though already
> pretty close.

I'd guess it just got too close to 4M to be useful.  Rebuilding with
CC_OPTIMIZE_FOR_SIZE=y gives a 3530k kernel with much more leeway for
the size of FastRAM.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
