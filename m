From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: Signal patchset
Date: Thu, 16 Dec 2010 23:23:54 +1000
Message-ID: <4D0A12EA.6040605@snapgear.com>
References: <AANLkTi=9B-8KN0oiXoiU+KqPt6B8Vs=d7yu9cui-7e1r@mail.gmail.com> <20101215101027.GA31097@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:52028 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755423Ab0LPN2n (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 16 Dec 2010 08:28:43 -0500
In-Reply-To: <20101215101027.GA31097@ZenIV.linux.org.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org

On 15/12/10 20:10, Al Viro wrote:
> On Sun, Dec 05, 2010 at 12:15:10PM +0100, Geert Uytterhoeven wrote:
>
>> Unless someone objects, I'm inclined to apply Al's patchset, as it improves the
>> situation anyway.
>>
>> OK?
>
> FWIW, there's an m68knommu counterpart (ACKed by gerg a while ago).  The
> entire bunch is on ftp.linux.org.uk/pub/people/viro/m68k-signals - both m68k
> and m68knommu sets.  I don't know how you guys would prefer it done, since
> there's a trivial dependency between m68k and m68knommu parts of series -
> the former has
> +#ifndef __uClinux__
> +#define __ARCH_WANT_SYS_RT_SIGSUSPEND
> +#endif
> in unistd.h and the latter does
> -#ifndef __uClinux__
>   #define __ARCH_WANT_SYS_RT_SIGSUSPEND
> -#endif
> Both parts switch to generic sys_rt_sigsuspend(), for mmu and nommu resp.,
> so they need __ARCH_WANT_SYS_RT_SIGSUSPEND defined as soon as conversion
> is done.  Other than that they are independent.

I can make sure to send to Linus after Geert. Unless Geert you
want to take and send both the m68k and m68knommu changes?

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
