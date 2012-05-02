From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 00/11] m68knommu: remove ColdFire sub-architecture directories
Date: Wed, 2 May 2012 19:47:19 +1000
Message-ID: <4FA102A7.409@snapgear.com>
References: <1335920946-11297-1-git-send-email-gerg@snapgear.com> <CAMuHMdWzjtD2C+AjxAi3v3B=aaMPX_RwNHpQZUt1U8jX6uC1cQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:18976 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751617Ab2EBJri (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 2 May 2012 05:47:38 -0400
In-Reply-To: <CAMuHMdWzjtD2C+AjxAi3v3B=aaMPX_RwNHpQZUt1U8jX6uC1cQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org

Hi Geert,

On 05/02/2012 07:16 PM, Geert Uytterhoeven wrote:
> On Wed, May 2, 2012 at 3:08 AM,<gerg@snapgear.com>  wrote:
>> Move all the ColdFire sub-architecture code into the platform/coldfire
>> directory, and remove the sub-architecture directories. We already build
>> the common ColdFire components based on sub-architecture type anyway,
>> so there is very little Makefile change required.
>
> This looks like a weird diffstat:
>
>> arch/m68k/Makefile				|  10 ----------
>> arch/m68k/platform/5206/Makefile		|  18 ------------------
>> arch/m68k/platform/520x/Makefile		|  17 -----------------
>> arch/m68k/platform/523x/Makefile		|  17 -----------------
>> arch/m68k/platform/5249/Makefile		|  18 ------------------
>> arch/m68k/platform/5272/Makefile		|  18 ------------------
>> arch/m68k/platform/527x/Makefile		|  18 ------------------
>> arch/m68k/platform/528x/Makefile		|  18 ------------------
>> arch/m68k/platform/5307/Makefile		|  20 --------------------
>> arch/m68k/platform/532x/Makefile		|  18 ------------------
>> arch/m68k/platform/5407/Makefile		|  18 ------------------
>> arch/m68k/platform/54xx/Makefile		|  19 -------------------
>> arch/m68k/platform/coldfire/Makefile		|  24 ++++++++++++++----------
>> b/arch/m68k/Makefile				|  2 --
>> b/arch/m68k/platform/coldfire/Makefile	|  4 ++--
>
> We already had these two files in the diffstat, with different values?
>
>> b/arch/m68k/platform/coldfire/m5206.c	|  1 -
>> b/arch/m68k/platform/coldfire/m520x.c	|  1 -
>> b/arch/m68k/platform/coldfire/m523x.c	|  1 -
>> b/arch/m68k/platform/coldfire/m5249.c	|  1 -
>> b/arch/m68k/platform/coldfire/m5272.c	|  1 -
>> b/arch/m68k/platform/coldfire/m527x.c	|  1 -
>> b/arch/m68k/platform/coldfire/m528x.c	|  1 -
>> b/arch/m68k/platform/coldfire/m532x.c	|  1 -
>> b/arch/m68k/platform/coldfire/m5407.c	|  1 -
>> b/arch/m68k/platform/coldfire/m54xx.c	|  1 -
>> b/arch/m68k/platform/coldfire/nettel.c	|  1 -
>
> All of these are created, not deleted?

Yeah, it is pretty odd. I think diffstat is getting confused by the
git rename/delete actions in the diffs. I used git format-patch with
the -M option, since there was so much moving about of files.


> The actual patches look fine, though ;-)

Thanks for the review :-)

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
