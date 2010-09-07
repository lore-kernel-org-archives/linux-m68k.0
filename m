From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k/m68knommu: merge MMU and non-MMU atomic.h
Date: Tue, 07 Sep 2010 09:32:14 +0200
Message-ID: <m3eid6uhz5.fsf@hase.home>
References: <201009070549.o875nKHX008042@goober.internal.moreton.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:56058 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755370Ab0IGHcQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Sep 2010 03:32:16 -0400
In-Reply-To: <201009070549.o875nKHX008042@goober.internal.moreton.com.au>
	(Greg Ungerer's message of "Tue, 7 Sep 2010 15:49:20 +1000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org

Greg Ungerer <gerg@snapgear.com> writes:

> +/*
> + * The ColdFire parts cannot do some immediate to memory operations,
> + * so for them we do not specify the "i" asm constraint.
> + */
> +#ifdef CONFIG_COLDFIRE
> +#define	DI	"d"
> +#else
> +#define	DI	"di"
> +#endif

I'd suggest to rename the macro, since DI could easily conflict with a
definition in a driver.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
