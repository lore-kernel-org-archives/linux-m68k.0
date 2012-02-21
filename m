From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 1/2] m68k: make support for FPU hardware configurable
Date: Tue, 21 Feb 2012 15:56:30 +1000
Message-ID: <4F43320E.4000900@snapgear.com>
References: <1328854457-24859-1-git-send-email-gerg@snapgear.com> <CAMuHMdVnOsxKCvUtCbwb_RqKp8L7HLfb4jEO8_Hnewvry+33nQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:27020 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751058Ab2BUGAb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 21 Feb 2012 01:00:31 -0500
In-Reply-To: <CAMuHMdVnOsxKCvUtCbwb_RqKp8L7HLfb4jEO8_Hnewvry+33nQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 19/02/12 20:17, Geert Uytterhoeven wrote:
> On Fri, Feb 10, 2012 at 07:14,<gerg@snapgear.com>  wrote:
>> The classic m68k code has always supported an FPU (although it may have
>> been a software emulated one). The non-MMU m68k code has never supported FPU
>> hardware. To help in merging common code create a configation setting that
>> signifies if we are builing in FPU support or not.
>>
>> This switch, CONFIG_FPU, is set as per the current use cases. So it is
>> always enabled if CONFIG_MMU is set, and disabled otherwise. With a little
>> extra code it will be possible to disable it on the classic m68k platforms
>> as well, and to enable it on non-MMU platforms that do have hardware FPU.
>>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>
> Acked-by: Geert Uytterhoeven<geert@linux-m68k.org>

Thanks!

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
