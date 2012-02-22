From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 4/5 v2] m68k: merge mmu and non-mmu versions of time.c
Date: Wed, 22 Feb 2012 21:41:05 +1000
Message-ID: <4F44D451.90209@snapgear.com>
References: <1329883136-9837-1-git-send-email-gerg@snapgear.com>	<1329883136-9837-4-git-send-email-gerg@snapgear.com> <CAMuHMdWwz8ou5fDKOb7Ef8fgn8aHCEzXigp1CBWqPc9w6+FUeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:37748 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754535Ab2BVLmf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 06:42:35 -0500
In-Reply-To: <CAMuHMdWwz8ou5fDKOb7Ef8fgn8aHCEzXigp1CBWqPc9w6+FUeg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 02/22/2012 07:42 PM, Geert Uytterhoeven wrote:
> On Wed, Feb 22, 2012 at 04:58,<gerg@snapgear.com>  wrote:
>> There is only trivial differences between the mmu time_mm.c and non-mmu
>> time_no.c files. Merge them back into a single time.c.
>>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>
> Acked-by: Geert Uytterhoeven<geert@linux-m68k.org>

Thanks for these acks too!

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
