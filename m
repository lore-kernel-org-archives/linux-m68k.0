From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: Yet more ARM breakage in linux-next
Date: Mon, 8 Dec 2008 16:50:34 +1030
Message-ID: <200812081650.35014.rusty@rustcorp.com.au>
References: <20081203192905.GA12502@flint.arm.linux.org.uk> <200812050042.28222.rusty@rustcorp.com.au> <Pine.LNX.4.64.0812072248430.14941@anakin>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:51408 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752135AbYLHGUk (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 8 Dec 2008 01:20:40 -0500
In-Reply-To: <Pine.LNX.4.64.0812072248430.14941@anakin>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Russell King <rmk+lkml@arm.linux.org.uk>, Haavard Skinnemoen <hskinnemoen@atmel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Monday 08 December 2008 08:20:59 Geert Uytterhoeven wrote:
> On Fri, 5 Dec 2008, Rusty Russell wrote: 
> > +static inline int __fls(int x)
>                  ^^^       ^^^
> Other implementations take `unsigned long' and return `unsigned long'...

It's all over the place, actually.  32 bit archs are especially loose.

I've been toying with the idea of a boottime testsuite for all the
bitops to see who gets them wrong.

> > +static inline int __fls(unsigned long word)
>                  ^^^       ^^^^^^^^^^^^^
> > +{
> > +	return fls(word) - 1;
> > +}
> > +
> 
> ... but this one uses mixed types?

I cut and pasted.  I thought you were 32 bit, so doesn't matter?

> What are the official semantics of __fls()?

Find last bit set in the word, undefined if word is 0.  Returns 0
to BITS_PER_LONG-1.

Cheers,
Rusty.
