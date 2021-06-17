Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381EFC2B9F4
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Jun 2021 06:59:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18FF26120A
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Jun 2021 06:59:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhFQHBJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Jun 2021 03:01:09 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:33498 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbhFQHBJ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Jun 2021 03:01:09 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id BEC332BD2A;
        Thu, 17 Jun 2021 02:58:59 -0400 (EDT)
Date:   Thu, 17 Jun 2021 16:58:59 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org, alex@kazik.de
Subject: Re: [PATCH v3 1/2] m68k: io_mm.h - add APNE 100 MBit support
In-Reply-To: <1623907712-29366-2-git-send-email-schmitzmic@gmail.com>
Message-ID: <8fad435e-e541-befe-8e3c-ccd75b3db0db@linux-m68k.org>
References: <1623907712-29366-1-git-send-email-schmitzmic@gmail.com> <1623907712-29366-2-git-send-email-schmitzmic@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, 17 Jun 2021, Michael Schmitz wrote:

> Add code to support 10 Mbit and 100 Mbit mode for APNE driver.
> 
> A new ISA type ISA_TYPE_AG16 dynamically switches the Amiga
> ISA inb accessor to word access as required by the 100 Mbit cards.
> 
> Patch modified after patch "[PATCH RFC net-next] Amiga PCMCIA
> 100 MBit card support" submitted to netdev 2018/09/16 by Alex
> Kazik <alex@kazik.de>.
> 
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> 
> --
> Changes from v1:
> 
> Andreas Schwab:
> - remove redundant fallthrough annotations
> 
> Changes from RFC:
> 
> Geert Uytterhoeven:
> - rename ISA_TYPE_AG100 to ISA_TYPE_AG16 (16 bit cards)
> - move ISA_TYPE_AG16 case inside #ifdef CONFIG_AMIGA_PCMCIA
> - change #if defined(CONFIG_APNE_100MBIT) to #ifdef
> - fix parentheses in isa_inb() define
> - omit comment about compiler optimization
> 
> - add ISA_TYPE_AG16 case to isa_delay()
> 
> fixup - review comment Andreas Schwab (fallthrough)
> ---
>  arch/m68k/include/asm/io_mm.h | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io_mm.h
> index 9c521b0..3ab2f1d 100644
> --- a/arch/m68k/include/asm/io_mm.h
> +++ b/arch/m68k/include/asm/io_mm.h
> @@ -101,6 +101,11 @@
>  #define ISA_TYPE_Q40  (1)
>  #define ISA_TYPE_AG   (2)
>  #define ISA_TYPE_ENEC (3)
> +#define ISA_TYPE_AG16 (4)	/* for 100 MBit APNE card */
> +
> +#if defined(CONFIG_APNE100MBIT)
> +#define MULTI_ISA 1
> +#endif
>  
>  #if defined(CONFIG_Q40) && !defined(MULTI_ISA)
>  #define ISA_TYPE ISA_TYPE_Q40
> @@ -136,6 +141,9 @@ static inline u8 __iomem *isa_itb(unsigned long addr)
>      case ISA_TYPE_Q40: return (u8 __iomem *)Q40_ISA_IO_B(addr);
>  #endif
>  #ifdef CONFIG_AMIGA_PCMCIA
> +#ifdef CONFIG_APNE100MBIT
> +    case ISA_TYPE_AG16:
> +#endif
>      case ISA_TYPE_AG: return (u8 __iomem *)AG_ISA_IO_B(addr);
>  #endif
>  #ifdef CONFIG_ATARI_ROM_ISA
> @@ -155,6 +163,9 @@ static inline u16 __iomem *isa_itw(unsigned long addr)
>      case ISA_TYPE_Q40: return (u16 __iomem *)Q40_ISA_IO_W(addr);
>  #endif
>  #ifdef CONFIG_AMIGA_PCMCIA
> +#ifdef CONFIG_APNE100MBIT
> +    case ISA_TYPE_AG16:
> +#endif
>      case ISA_TYPE_AG: return (u16 __iomem *)AG_ISA_IO_W(addr);
>  #endif
>  #ifdef CONFIG_ATARI_ROM_ISA
> @@ -171,6 +182,9 @@ static inline u32 __iomem *isa_itl(unsigned long addr)
>    switch(ISA_TYPE)
>      {
>  #ifdef CONFIG_AMIGA_PCMCIA
> +#ifdef CONFIG_APNE100MBIT
> +    case ISA_TYPE_AG16:
> +#endif
>      case ISA_TYPE_AG: return (u32 __iomem *)AG_ISA_IO_W(addr);
>  #endif
>      }
> @@ -184,6 +198,9 @@ static inline u8 __iomem *isa_mtb(unsigned long addr)
>      case ISA_TYPE_Q40: return (u8 __iomem *)Q40_ISA_MEM_B(addr);
>  #endif
>  #ifdef CONFIG_AMIGA_PCMCIA
> +#ifdef CONFIG_APNE100MBIT
> +    case ISA_TYPE_AG16:
> +#endif
>      case ISA_TYPE_AG: return (u8 __iomem *)addr;
>  #endif
>  #ifdef CONFIG_ATARI_ROM_ISA
> @@ -203,6 +220,9 @@ static inline u16 __iomem *isa_mtw(unsigned long addr)
>      case ISA_TYPE_Q40: return (u16 __iomem *)Q40_ISA_MEM_W(addr);
>  #endif
>  #ifdef CONFIG_AMIGA_PCMCIA
> +#ifdef CONFIG_APNE100MBIT
> +    case ISA_TYPE_AG16:
> +#endif
>      case ISA_TYPE_AG: return (u16 __iomem *)addr;
>  #endif
>  #ifdef CONFIG_ATARI_ROM_ISA
> @@ -216,13 +236,14 @@ static inline u16 __iomem *isa_mtw(unsigned long addr)
>  }
>  
>  
> -#define isa_inb(port)      in_8(isa_itb(port))
>  #define isa_inw(port)      (ISA_SEX ? in_be16(isa_itw(port)) : in_le16(isa_itw(port)))
>  #define isa_inl(port)      (ISA_SEX ? in_be32(isa_itl(port)) : in_le32(isa_itl(port)))
>  #define isa_outb(val,port) out_8(isa_itb(port),(val))
>  #define isa_outw(val,port) (ISA_SEX ? out_be16(isa_itw(port),(val)) : out_le16(isa_itw(port),(val)))
>  #define isa_outl(val,port) (ISA_SEX ? out_be32(isa_itl(port),(val)) : out_le32(isa_itl(port),(val)))
>  
> +#define isa_inb(port)      ((ISA_TYPE == ISA_TYPE_AG16) ? ((port) & 1 ? isa_inw((port) - 1) & 0xff : isa_inw(port) >> 8) : in_8(isa_itb(port)))
> +
>  #define isa_readb(p)       in_8(isa_mtb((unsigned long)(p)))
>  #define isa_readw(p)       \
>  	(ISA_SEX ? in_be16(isa_mtw((unsigned long)(p)))	\

Was the re-ordering of definitions deliberate?


> @@ -270,6 +291,9 @@ static inline void isa_delay(void)
>      case ISA_TYPE_Q40: isa_outb(0,0x80); break;
>  #endif
>  #ifdef CONFIG_AMIGA_PCMCIA
> +#ifdef CONFIG_APNE100MBIT
> +    case ISA_TYPE_AG16: break;
> +#endif
>      case ISA_TYPE_AG: break;
>  #endif
>  #ifdef CONFIG_ATARI_ROM_ISA
> 

I think most of these "#ifdef CONFIG_APNE100MBIT" conditionals are 
redundant. case ISA_TYPE_AG16 should be optimized away as dead code in the 
MULTI_ISA == 0 configuration. And in the MULTI_ISA == 1 configuration, the 
logic used to assign isa_type already depends on 
defined(CONFIG_APNE100MBIT).
