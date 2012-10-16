From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [PATCH 3/4 V2] Add for MCF54xx a virtual non cached zone
	usable for data exchange with DMA
Date: Tue, 16 Oct 2012 13:23:49 +0200
Message-ID: <20121016112349.GA30393@frolo.macqel>
References: <1350305680-5441-3-git-send-email-stany.marcel@novasys-ingenierie.com> <1350307324-7396-1-git-send-email-stany.marcel@novasys-ingenierie.com> <507CED8E.1000004@snapgear.com> <1512C13C0C5EA947AE50B9B9AC314F4701B00E1D@ATLAS.pactenovation.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp2.macqel.be ([194.78.208.39]:3970 "EHLO smtp2.macqel.be"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753527Ab2JPLX4 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 16 Oct 2012 07:23:56 -0400
Content-Disposition: inline
In-Reply-To: <1512C13C0C5EA947AE50B9B9AC314F4701B00E1D@ATLAS.pactenovation.fr>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Stany MARCEL <smarcel@pactenovation.fr>
Cc: Greg Ungerer <gerg@snapgear.com>, linux-m68k@vger.kernel.org, gerg@uclinux.org

Hi Stany and Greg,

On Tue, Oct 16, 2012 at 12:46:02PM +0200, Stany MARCEL wrote:
> 
> It might not be the usual approach in Linux, but after reading the MCF548x Reference Manual, 
> I think that is the best approach for this family of MCU.

Maybe we should keep Stany's approach of reserving part of the memory
as uncached and use dma_alloc_coherent() or dma_pool_create().

Have a look at Documentation/DMA-API.txt

Best regards

Philippe

> 
> Regards,
> 
> Stany
> 
> 
> -----Original Message-----
> From: Greg Ungerer [mailto:gerg@snapgear.com]
> Sent: Tue 10/16/2012 7:15 AM
> To: Stany MARCEL
> Cc: linux-m68k@vger.kernel.org; gerg@uclinux.org
> Subject: Re: [PATCH 3/4 V2] Add for MCF54xx a virtual non cached zone usable for data exchange with DMA
>  
> Hi Stany,
> 
> On 15/10/12 23:22, Stany MARCEL wrote:
> > This permit to share data with DMA without caching issues. M54xx DMA bypass
> > cache so exchanged data must be flushed before DMA operation. But M54xx cache
> > opperation does not permit to easily flush concerned data. So this patch permit
> > to have a non cached zone used for GFP_DMA allocated data.
> 
> Interesting, but I think this is the wrong approach.
> 
> We don't want to bypass the cache. Admittedly the current cache support
> code we have for ColdFire is not great, it could be improved a lot. So
> lets do that, not work around it.
> 
> Regards
> Greg
