From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: Re: [PATCH -mm 06/12] m68k: use asm-generic/scatterlist.h
Date: Sun, 25 Apr 2010 22:46:35 +0900
Message-ID: <20100425224726P.fujita.tomonori@lab.ntt.co.jp>
References: <1270511567-18567-1-git-send-email-fujita.tomonori@lab.ntt.co.jp>
	<1270511567-18567-7-git-send-email-fujita.tomonori@lab.ntt.co.jp>
	<p2q10f740e81004230129rd5b07889m5ec7f453efd46403@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sh.osrg.net ([192.16.179.4]:53274 "EHLO sh.osrg.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753712Ab0DYNq5 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 25 Apr 2010 09:46:57 -0400
In-Reply-To: <p2q10f740e81004230129rd5b07889m5ec7f453efd46403@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: fujita.tomonori@lab.ntt.co.jp, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, zippel@linux-m68k.org, linux-m68k@vger.kernel.org

On Fri, 23 Apr 2010 10:29:04 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> > +#include <asm-generic/scatterlist.h>
> 
> This include should be ...
> 
> > /* This is bogus and should go away. */
> > #define ISA_DMA_THRESHOLD (0x00ffffff)

asm-generic/scatterlist.h can't define ISA_DMA_THRESHOLD because of
the way POWERPC uses ISA_DMA_THRESHOLD.


> ... below this definition, else you get duplicate definition errors
> (and the wrong definition).
> 
> > -#define sg_dma_address(sg) ((sg)->dma_address)
> > -#define sg_dma_len(sg) ((sg)->length)

This patch needs to be applied against -mm; including some changes to
asm-generic/scatterlist.h.

I've attached asm-generic/scatterlist.h in -mm.

=
#ifndef __ASM_GENERIC_SCATTERLIST_H
#define __ASM_GENERIC_SCATTERLIST_H

#include <linux/types.h>

struct scatterlist {
#ifdef CONFIG_DEBUG_SG
	unsigned long	sg_magic;
#endif
	unsigned long	page_link;
	unsigned int	offset;
	unsigned int	length;
	dma_addr_t	dma_address;
#ifdef CONFIG_NEED_SG_DMA_LENGTH
	unsigned int	dma_length;
#endif
};

/*
 * These macros should be used after a dma_map_sg call has been done
 * to get bus addresses of each of the SG entries and their lengths.
 * You should only work with the number of sg entries pci_map_sg
 * returns, or alternatively stop on the first sg_dma_len(sg) which
 * is 0.
 */
#define sg_dma_address(sg)	((sg)->dma_address)

#ifdef CONFIG_NEED_SG_DMA_LENGTH
#define sg_dma_len(sg)		((sg)->dma_length)
#else
#define sg_dma_len(sg)		((sg)->length)
#endif

#endif /* __ASM_GENERIC_SCATTERLIST_H */
