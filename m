From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: merge the mmu and non-mmu kernel/Makefiles
Date: Mon, 15 Aug 2011 11:12:46 +1000
Message-ID: <4E48728E.3090602@snapgear.com>
References: <1313038044-25522-1-git-send-email-gerg@snapgear.com> <m28vqxdzxl.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:53829 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750783Ab1HOBLZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 14 Aug 2011 21:11:25 -0400
In-Reply-To: <m28vqxdzxl.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Andreas,

On 14/08/11 02:44, Andreas Schwab wrote:
> <gerg@snapgear.com>  writes:
>
>> +obj-y$(CONFIG_MMU_SUN3) += dma.o	# no, it's not a typo
>
> I'd rather put ifndef CONFIG_MMU_SUN3 around it.

I agree. It is much more obvious what it is doing with the ifndef.
I'll change it over to that.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
