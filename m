From: "George Spelvin" <linux@horizon.com>
Subject: Re: [RFC PATCH 1/2] arch/m68k/lib/mulsi3.S: Optimize]
Date: 12 May 2016 16:52:17 -0400
Message-ID: <20160512205217.19233.qmail@ns.horizon.com>
References: <57347B1E.9030108@westnet.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ns.horizon.com ([71.41.210.147]:51233 "HELO ns.horizon.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751902AbcELUwT (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 12 May 2016 16:52:19 -0400
In-Reply-To: <57347B1E.9030108@westnet.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org, gregungerer@westnet.com.au, linux-m68k@lists.linux-m68k.org, linux@horizon.com

Thank you very much!

Greg Ungerer wrote:
> This syntax fails for me (using a binutils-2.25.1 based toolchain).
> Registers must be prefixed with a "%", so here %sp and %a0.
>
>   arch/m68k/lib/mulsi3.S: Assembler messages:
>   arch/m68k/lib/mulsi3.S:12: Error: syntax error -- statement `lea 4(sp),a0' ignored
> 
> That was compiling with just this one patch for a ColdFire target.

Well, *that* is an embarrassing oversight.  If you fix that obvious typo
(I used ":%s/[ad][01]/%&/g"), do you have a way of testing it?

Setting up a suitable Qemu environment is many times the effort needed
to write the code, so I was hoping someone with the facilities already
in place would be willing to test.

I've stared at the code and am convinced it's right, but I remember
Knuth's words: "Beware of bugs in the above code; I have only proved it
correct, not tried it."
