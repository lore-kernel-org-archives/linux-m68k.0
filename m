From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k: fix ColdFire clear cache operation
Date: Tue, 10 Jul 2012 09:12:12 +0200
Message-ID: <m2629w5bub.fsf@igel.home>
References: <1341902481-8321-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:55418 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752152Ab2GJHMT (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 10 Jul 2012 03:12:19 -0400
In-Reply-To: <1341902481-8321-1-git-send-email-gerg@snapgear.com>
	(gerg@snapgear.com's message of "Tue, 10 Jul 2012 16:41:21 +1000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

<gerg@snapgear.com> writes:

> +static inline void clear_cf_icache(unsigned long start, unsigned long end)
> +{
> +	__asm__ __volatile__ (
> +		"movel	%0,%%d0\n\t"
> +		"movec	%%d0,%%cacr\n\t"
> +		"nop\n\t"
> +		:
> +		: "i" (CACHE_MODE | CACR_ICINVA | CACR_BCINVA)

Why not "r"?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
