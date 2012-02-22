From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH v2] m68k: merge the mmu and non-mmu versions of ptrace.c
Date: Wed, 22 Feb 2012 21:37:47 +1000
Message-ID: <4F44D38B.6060303@snapgear.com>
References: <1329880414-8301-1-git-send-email-gerg@snapgear.com> <CAMuHMdVD-QuZ+HEEuJFXp2=H=XZum+QVqw36LWKu_6jboCMKMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:53980 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754535Ab2BVLnM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 06:43:12 -0500
In-Reply-To: <CAMuHMdVD-QuZ+HEEuJFXp2=H=XZum+QVqw36LWKu_6jboCMKMA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 02/22/2012 07:41 PM, Geert Uytterhoeven wrote:
> On Wed, Feb 22, 2012 at 04:13,<gerg@snapgear.com>  wrote:
>> Most of the code in the non-mmu ptrace_no.c file is the same as the mmu
>> version ptrace_mm.c. So merge them back into a single file.
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
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
