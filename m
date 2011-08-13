From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k: merge the mmu and non-mmu kernel/Makefiles
Date: Sat, 13 Aug 2011 18:44:06 +0200
Message-ID: <m28vqxdzxl.fsf@igel.home>
References: <1313038044-25522-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:53011 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751385Ab1HMQoM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 13 Aug 2011 12:44:12 -0400
In-Reply-To: <1313038044-25522-1-git-send-email-gerg@snapgear.com>
	(gerg@snapgear.com's message of "Thu, 11 Aug 2011 14:47:24 +1000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

<gerg@snapgear.com> writes:

> +obj-y$(CONFIG_MMU_SUN3) += dma.o	# no, it's not a typo

I'd rather put ifndef CONFIG_MMU_SUN3 around it.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
