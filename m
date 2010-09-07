From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k/m68knommu: merge MMU and non-MMU atomic.h
Date: Tue, 7 Sep 2010 19:53:21 +1000
Message-ID: <4C860B91.30009@snapgear.com>
References: <201009070549.o875nKHX008042@goober.internal.moreton.com.au> <m3eid6uhz5.fsf@hase.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:18366 "HELO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755420Ab0IGJ7u (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Sep 2010 05:59:50 -0400
In-Reply-To: <m3eid6uhz5.fsf@hase.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org

On 07/09/10 17:32, Andreas Schwab wrote:
> Greg Ungerer<gerg@snapgear.com>  writes:
>
>> +/*
>> + * The ColdFire parts cannot do some immediate to memory operations,
>> + * so for them we do not specify the "i" asm constraint.
>> + */
>> +#ifdef CONFIG_COLDFIRE
>> +#define	DI	"d"
>> +#else
>> +#define	DI	"di"
>> +#endif
>
> I'd suggest to rename the macro, since DI could easily conflict with a
> definition in a driver.

Yeah, I agree. I'll make it a little more descriptive and longer.

Thanks
Greg
