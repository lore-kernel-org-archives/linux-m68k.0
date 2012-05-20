From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 1/2] m68knommu: reorganize the no-MMU cache flushing to
 match m68k
Date: Sun, 20 May 2012 21:12:50 +1000
Message-ID: <4FB8D1B2.8060302@snapgear.com>
References: <1336114247-22764-1-git-send-email-gerg@snapgear.com> <1336114247-22764-2-git-send-email-gerg@snapgear.com> <CAMuHMdX48_zgpkRcVwOjLG6ahqZJ8wfLzX0QxhoyWVzh2ZBH+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:60454 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753531Ab2ETLNE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 20 May 2012 07:13:04 -0400
In-Reply-To: <CAMuHMdX48_zgpkRcVwOjLG6ahqZJ8wfLzX0QxhoyWVzh2ZBH+w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 05/20/2012 07:07 PM, Geert Uytterhoeven wrote:
> On Fri, May 4, 2012 at 8:50 AM,<gerg@snapgear.com>  wrote:
>> In particular by reorganizing the __flush_caceh_all() code and separating
>
> __flush_cache_all()

I'll fix that up.

Thanks for all the other acks too, I'll update the patches.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
