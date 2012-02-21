From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 3/3] m68k: merge mmu and non-mmu versions of time.c
Date: Tue, 21 Feb 2012 16:37:09 +1000
Message-ID: <4F433B95.6020604@snapgear.com>
References: <1328584190-30827-1-git-send-email-gerg@snapgear.com>	<1328584190-30827-3-git-send-email-gerg@snapgear.com> <CAMuHMdU5vcfBc=DSgv=2w-xiFVwoP7_4jG+F04v-J_jE3O31WQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:59155 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750804Ab2BUGmQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 21 Feb 2012 01:42:16 -0500
In-Reply-To: <CAMuHMdU5vcfBc=DSgv=2w-xiFVwoP7_4jG+F04v-J_jE3O31WQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 19/02/12 20:10, Geert Uytterhoeven wrote:
> On Tue, Feb 7, 2012 at 04:09,<gerg@snapgear.com>  wrote:
>> +int update_persistent_clock(struct timespec now)
>> +{
>> +	return set_rtc_mmss(now.tv_sec);
>> +}
>
> This adds update_persistent_clock() for MMU, which was not present before.
> It's only called if CONFIG_GENERIC_CMOS_UPDATE is set, but
> arch/m68k/Kconfig has:
>
> config GENERIC_CMOS_UPDATE
>          def_bool !MMU

Yep. Again I was trying to just have fewer #ifdefs.

But looking at this further, I don't think there is any point having
CONFIG_GENERIC_CMOS_UPDATE defined for the non-MMU case. The code for
update_persistent_clock() calls set_rtc_mmss() which relies on the
sub-arch code having set mach_set_clock_mmss to do the real work. But
that is not set for any non-MMU code paths. Seems like we can remove it
for everyone m68k type. Or did I miss something :-)

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
