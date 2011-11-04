From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: make fp register stores consistent for m68k and
 ColdFire
Date: Fri, 4 Nov 2011 11:14:50 +1000
Message-ID: <4EB33C8A.5020000@snapgear.com>
References: <1320299907-11410-1-git-send-email-gerg@snapgear.com> <CAMuHMdVdwKG7jyTTi7Xbx11Avj=kLQL7wVV0gXwuZ71FQG5KPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:46056 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750777Ab1KDBNi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 3 Nov 2011 21:13:38 -0400
In-Reply-To: <CAMuHMdVdwKG7jyTTi7Xbx11Avj=kLQL7wVV0gXwuZ71FQG5KPg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 03/11/11 18:23, Geert Uytterhoeven wrote:
> On Thu, Nov 3, 2011 at 06:58,<gerg@snapgear.com>  wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> There is no reason we can't make the saved fp registers the same for all
>> m68k types and ColdFire. There is a little wasted space, but the code
>> consistentcy and cleanliness is a big win.
>
> consistency

I really need to spell check these :-)


>> sigcontext.h is an exported header, but currently there is no in-mainline
>> users of the !__uClinux__ and __mcoldfire__ case that this change effects.
>> Even better this change actually makes this structure consistent with
>> the out-of-mainline ColdFire/MMU code.
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
