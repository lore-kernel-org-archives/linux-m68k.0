From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: remove duplicate asm offset for task thread.info
Date: Sun, 11 Dec 2011 21:26:31 +1000
Message-ID: <4EE49367.9080005@snapgear.com>
References: <1314940906-31969-1-git-send-email-gerg@snapgear.com> <CAMuHMdWuv8MtwHnUKALZVHhVZVP0VkfH7pCNU=Qk61ViXZTQ9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:65494 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751620Ab1LKL0j (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 11 Dec 2011 06:26:39 -0500
In-Reply-To: <CAMuHMdWuv8MtwHnUKALZVHhVZVP0VkfH7pCNU=Qk61ViXZTQ9A@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On 12/11/2011 07:23 PM, Geert Uytterhoeven wrote:
> On Fri, Sep 2, 2011 at 07:21,<gerg@snapgear.com>  wrote:
>> We have a duplicate name and definition for the offset of the thread.info
>> struct within the task struct in our asm-offsets.c code. Remove one of them,
>> and consolidate to use a single define, TASK_INFO.
>>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>
> Acked-by:  Geert Uytterhoeven<geert@linux-m68k.org>

Thanks Geert!

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
