From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 1/4] m68k/mac: More printk modernization
Date: Sat, 28 Oct 2017 13:04:25 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1710281242550.3@nippy.intranet>
References: <cover.1509071937.git.fthain@telegraphics.com.au> <afe6ecb8fcbe726eecc42bd967e5d71502658f40.1509071937.git.fthain@telegraphics.com.au> <CACz-3riWPO6Kef8mtSHWp=zm0Tzi5P-GvbRdgqp6RTSwauOrYg@mail.gmail.com>
 <alpine.LNX.2.00.1710280923440.3@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:56874 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751025AbdJ1CEV (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 27 Oct 2017 22:04:21 -0400
In-Reply-To: <alpine.LNX.2.00.1710280923440.3@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Kars de Jong <jongk@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 28 Oct 2017, I wrote:

> > Any particular reason why you didn't use pr_debug() here? I'm guessing 
> > it's because this is not a known pointer value?
> > 
> 
> It's because the call to psc_debug_dump() is already conditional on 
> #ifdef DEBUG_PSC.
> 
> Having the printk conditional on both DEBUG and DEBUG_PSC would be 
> annoying. And I didn't want an unconditional call to psc_debug_dump() 
> because I think PSC_DEBUG could become more useful given that PSC 
> support is woefully incomplete.
> 

Perhaps PSC_DEBUG should be scrapped in favour of DEBUG. Presently 
DEBUG_PSC is set and I think that's useful as long as those drivers are 
incomplete. So we would end up with this:


#define DEBUG

#include ...
...

static void psc_debug_dump(void)
{
	...
	pr_debug(...);
	...
}

void __init psc_init(void)
{
	...
#if DEBUG
	psc_debug_dump()
#endif
	...
}


In this version, the "#define DEBUG" at the top of the file has obscure 
side effects (not just in printk.h) considering all of the headers that 
get included, and their includes, and so on. I still prefer the patch that 
I sent.

-- 
