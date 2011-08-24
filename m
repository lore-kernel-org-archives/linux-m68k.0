From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68knommu: remove extern definitions of memory_start/memory_end
 from mm/init
Date: Wed, 24 Aug 2011 11:23:57 +1000
Message-ID: <4E5452AD.6080106@snapgear.com>
References: <1314079503-26758-1-git-send-email-gerg@snapgear.com> <m2mxf0p1wj.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:18020 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753515Ab1HXBZK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 23 Aug 2011 21:25:10 -0400
In-Reply-To: <m2mxf0p1wj.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org

Hi Andreas,

On 24/08/11 01:45, Andreas Schwab wrote:
> <gerg@snapgear.com>  writes:
>
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> We do not need to have local extern definitions of memory_start and
>> memory_end in mm/init_no.c. There are definitions already in asm/page_no.h.
>
> s/definitions/declarations/

Yep, I'll change that. Thanks.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
