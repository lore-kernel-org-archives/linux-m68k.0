From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: fix ColdFire clear cache operation
Date: Tue, 10 Jul 2012 22:50:40 +1000
Message-ID: <4FFC2520.4030604@snapgear.com>
References: <1341902481-8321-1-git-send-email-gerg@snapgear.com> <m2629w5bub.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:57980 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755617Ab2GJMxe (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 10 Jul 2012 08:53:34 -0400
In-Reply-To: <m2629w5bub.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

Hi Andreas,

On 07/10/2012 05:12 PM, Andreas Schwab wrote:
> <gerg@snapgear.com> writes:
>
>> +static inline void clear_cf_icache(unsigned long start, unsigned long end)
>> +{
>> +	__asm__ __volatile__ (
>> +		"movel	%0,%%d0\n\t"
>> +		"movec	%%d0,%%cacr\n\t"
>> +		"nop\n\t"
>> +		:
>> +		: "i" (CACHE_MODE | CACR_ICINVA | CACR_BCINVA)
>
> Why not "r"?

Yes, that is better. I will revise and repost.

Thanks
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
