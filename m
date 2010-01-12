From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68knommu: change definitions of __pa() and __va()
Date: Tue, 12 Jan 2010 17:02:26 +1000
Message-ID: <4B4C1E82.7000907@snapgear.com>
References: <201001120039.o0C0dboQ031390@goober.internal.moreton.com.au> <alpine.LFD.2.00.1001111652500.17145@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from rex.securecomputing.com ([203.24.151.4]:49457 "EHLO
	cyberguard.com.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751160Ab0ALHCN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 12 Jan 2010 02:02:13 -0500
In-Reply-To: <alpine.LFD.2.00.1001111652500.17145@localhost.localdomain>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: gerg@uclinux.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org


Hi Linus,

Linus Torvalds wrote:
> On Tue, 12 Jan 2010, Greg Ungerer wrote:
>> +#else
>> +#define page_to_phys(page)	((page - mem_map) << PAGE_SHIFT)
>> +#define page_to_bus(page)	((page - mem_map) << PAGE_SHIFT)
>> +#endif
> 
> Ok, so the old ones were total crap too, but when moving things around, 
> don't just copy the crap like this.
> 
> Look at those two #define's for five seconds, and ask yourself what is 
> wrong with them. Those macros are not good.

Ok. Easily fixed.

page_to_bus() doesn't even look like it is used anywhere (and m68k
itself doesn't define it). So I'll remove it.

I propose changing page_to_phys() to be:

#define page_to_phys(page)      (page_to_pfn(page) << PAGE_SHIFT)

Which seems consistent with many other arches. (And it works on
m68knommu too :-)

I'll generate a new patch with that changed.

A quick grep shows page_to_phys() defined this way in a couple of
other places too:

   h8300/include/asm/io.h
   sparc/include/asm/io_32.h

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
