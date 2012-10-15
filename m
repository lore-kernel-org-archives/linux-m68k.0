From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: M54xx FEC and DMA
Date: Mon, 15 Oct 2012 16:43:18 +0200
Message-ID: <20121015144318.GA12485@frolo.macqel>
References: <1512C13C0C5EA947AE50B9B9AC314F470343F021@ATLAS.pactenovation.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp2.macqel.be ([194.78.208.39]:24597 "EHLO smtp2.macqel.be"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750808Ab2JOOn0 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 15 Oct 2012 10:43:26 -0400
Content-Disposition: inline
In-Reply-To: <1512C13C0C5EA947AE50B9B9AC314F470343F021@ATLAS.pactenovation.fr>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Stany MARCEL <smarcel@pactenovation.fr>
Cc: Greg Ungerer <gerg@snapgear.com>, linux-m68k@vger.kernel.org

Hello Stany,

[CCing linux-m68k@vger.kernel.org]

On Mon, Oct 15, 2012 at 03:37:25PM +0200, Stany MARCEL wrote:
> Hello,
> 
>  
> 
> I have sent a patch on linuxm68k mailing list, a few minutes ago, that
> permits to use your driver correctly with MMU without caching issues.
> 
>  
> 
> The strategy is to map a memory zone used for dma allocation as non
> cachable. 

Bright idea.

> 
>  
> 
> It is a lot better than a complete flush at each network operation, and
> correct my issue of lost UDP frames.
> 
>  
> 
> With this and the read write operation replaced by __raw_* one Your FEC
> and MCD DMA works very well for me.

Thanks for the positive feedback.

I was not aware of any difference between __raw_writel and writel on m68k.

For the non-MMU case, I see:
arch/m68k/include/asm/io_no.h:#define __raw_writel writel

but now I have found  for the MMU case:
arch/m68k/include/asm/io_mm.h:#define writel(val,addr) out_le32((addr),(val))
arch/m68k/include/asm/raw_io.h:#define __raw_writel(val,addr) out_be32((addr),(val))

and I understand your problem (out_le32 vs out_be32), but I wonder:
should we not:

- try to understand/fix the difference between __raw_writel and writel in
CONFIG_MMU case (Greg, Geert ?)

- or go to out_be32

Best regards

Philippe
