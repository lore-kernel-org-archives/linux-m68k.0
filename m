From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [uClinux-dev] [PATCH] m68k: merge the mmu and non-mmu	kernel/Makefiles
Date: Thu, 11 Aug 2011 16:45:35 +1000
Message-ID: <4E437A8F.60505@snapgear.com>
References: <1313038044-25522-1-git-send-email-gerg@snapgear.com> <20110811060807.GB21757@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:15463 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751468Ab1HKGmU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 11 Aug 2011 02:42:20 -0400
In-Reply-To: <20110811060807.GB21757@merkur.ravnborg.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

On 11/08/11 16:08, Sam Ravnborg wrote:
> On Thu, Aug 11, 2011 at 02:47:24PM +1000, gerg@snapgear.com wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> [This is a resend of this patch. If no-one has any objections then I
>> want to push this into linux-next, for eventual inclusion in the 3.2
>> merge window.]
>>
>> The few differences between the mmu and non-mmu kernel/Makefiles can
>> easily be handled inside of a single Makefile. Merge the 2 back into
>> a single Makefile.
>
> Looks good (except the typo that is nto a typo:-) )

That is a little gem that one :-)


> Acked-by: Sam Ravnborg<sam@ravnborg.org>

Thanks Sam!

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
