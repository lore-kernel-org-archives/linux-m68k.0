From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: merge the init_task code for mmu and non-mmu targets
Date: Sun, 11 Dec 2011 21:26:08 +1000
Message-ID: <4EE49350.1040902@snapgear.com>
References: <1314940809-31873-1-git-send-email-gerg@snapgear.com> <CAMuHMdWE7NLs9zeMRZ_iAcY2P8Zjd8OYUeY5bfHyK-6=hzbVbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:65484 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751311Ab1LKL0Y (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 11 Dec 2011 06:26:24 -0500
In-Reply-To: <CAMuHMdWE7NLs9zeMRZ_iAcY2P8Zjd8OYUeY5bfHyK-6=hzbVbA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On 12/11/2011 07:21 PM, Geert Uytterhoeven wrote:
> On Fri, Sep 2, 2011 at 07:20,<gerg@snapgear.com>  wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> The init_task code can be the same for both mmu and non-mmu targets.
>> None of the alignment carried out in the the current init_task code
>> is necessary. The linker script takes care of aligning the init_thread
>> structure to a THREAD SIZE boundary, and that is all we need.
>>
>> So use the init_task.c code for all target types, that makes m68k
>> code consistent with what most other architectures do.
>>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>
> Acked-by: Geert Uytterhoeven<geert@linux-m68k.org>

Thanks Geert!

Regards
Greg


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
