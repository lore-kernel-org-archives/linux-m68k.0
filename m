From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] m68knommu: change definitions of __pa() and __va()
Date: Mon, 11 Jan 2010 16:53:56 -0800 (PST)
Message-ID: <alpine.LFD.2.00.1001111652500.17145@localhost.localdomain>
References: <201001120039.o0C0dboQ031390@goober.internal.moreton.com.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:45388 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750940Ab0ALAyG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Mon, 11 Jan 2010 19:54:06 -0500
In-Reply-To: <201001120039.o0C0dboQ031390@goober.internal.moreton.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: gerg@uclinux.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org



On Tue, 12 Jan 2010, Greg Ungerer wrote:
> +#else
> +#define page_to_phys(page)	((page - mem_map) << PAGE_SHIFT)
> +#define page_to_bus(page)	((page - mem_map) << PAGE_SHIFT)
> +#endif

Ok, so the old ones were total crap too, but when moving things around, 
don't just copy the crap like this.

Look at those two #define's for five seconds, and ask yourself what is 
wrong with them. Those macros are not good.

			Linus
