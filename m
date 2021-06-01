Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5652C47080
	for <linux-m68k@archiver.kernel.org>; Tue,  1 Jun 2021 07:55:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C918E6124B
	for <linux-m68k@archiver.kernel.org>; Tue,  1 Jun 2021 07:55:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233083AbhFAH5R (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 1 Jun 2021 03:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232963AbhFAH5Q (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 1 Jun 2021 03:57:16 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0784C061574
        for <linux-m68k@lists.linux-m68k.org>; Tue,  1 Jun 2021 00:55:33 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id v14so10081408pgi.6
        for <linux-m68k@lists.linux-m68k.org>; Tue, 01 Jun 2021 00:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=5GAebGDomnAu8pZR5GXwz8oLSEqnH1FWuVtmkyde95A=;
        b=NZB0kDoRcxFPdT7wX3FlcRDqK5fjKOlQfHxFflJVlmsObm2yFFgRcZJHN4ooDNF0nb
         4nuAaiSjKJ0ZAcb7RD3A2rm5xDJilCeiBjPZgrYPS2NAgh8qLGTWuksnzUtx7ReCtSTp
         kgOcVGs5OjSv9FdaJEtE/rAq+FVOH/47pMWhhqStp0JXA08w0AbS9ocEz2crQI4G3t8x
         6ST5SfhNwdm8gmngdkwKk8S1ny/6PWiXlJmvLEcXxt5HqwMryoB0Aq2PerODpZbALsn8
         RQB3KhG5ytSTdXi2FkOE2Mv64xdH+dn3knkwGldoSohXDtRrhK0hE8c5GrOqB+VgSB/F
         SUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=5GAebGDomnAu8pZR5GXwz8oLSEqnH1FWuVtmkyde95A=;
        b=sk78jJlF6JDhzCGcStm4tykWrNaKlx68rZrpX+0Pvx9ReqXLXXgPRhAQjEJORk00xj
         Hh+UOgIOerWhlIsNsfRGzFCsHAcocOyIiYiUiifuKz5tq6Rwi92V9+/egmy0ieaanQzJ
         5M14QxH97Jxxxnhpu5Fd362lh+eg0h1V2N2G2dFJmOALnIog5BPgX5qtI9gIgxkgbTeg
         KQOvQvxxFzvWETBaEAp6hRYUW0eROnbZmKv/gyTv4TdyNfODkK8sUW/ot6UE2HCProGX
         StjCljXflQvZ5L+NQDOH74ubBsFc3pqGgLg0RuGTJ/OLPqPlgCDI1su/QJ+nK0cF/VO7
         +g8w==
X-Gm-Message-State: AOAM531nX9f+ZGWPCBUZL3bUuXmglTFxuGNy6fyytSIcoVoG9mCyW33i
        NjxaH8gyo3DMiDG2LD9zsX+9z3itK88=
X-Google-Smtp-Source: ABdhPJxeB761SP284l4fSzpvnAWFo0Qwq41yxgPHeeR5m004RjMSIDFEhJcXiIsy3E8IOUs9f3UumQ==
X-Received: by 2002:a62:3106:0:b029:25c:cd66:3be1 with SMTP id x6-20020a6231060000b029025ccd663be1mr20807221pfx.29.1622534132534;
        Tue, 01 Jun 2021 00:55:32 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id b14sm918000pgl.52.2021.06.01.00.55.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Jun 2021 00:55:32 -0700 (PDT)
Subject: Re: [PATCH] m68k/mac: Replace macide driver with generic platform
 driver
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <793432cca963b632709c4d1312baa9874d73e1d8.1619341585.git.fthain@telegraphics.com.au>
 <ba908b1d-eab5-a4e5-0c0a-2c745287d121@physik.fu-berlin.de>
 <10a08764-c138-9fe5-966c-ce68349b9b6@nippy.intranet>
 <65f01f42-31d9-522a-e690-73d286405a01@gmail.com>
 <9650358f-a789-7dbd-4495-1d39ff321ded@nippy.intranet>
 <ada88dd6-f8d7-11dc-9a89-5c7e437a0981@gmail.com>
 <CAMuHMdUy_B_+pHZQpnDHYsee+gpXOs9ek_HaVxLjE2HVfGmLQg@mail.gmail.com>
 <e4635ac5-903a-a52e-51cf-b59295c76973@gmail.com>
Cc:     Finn Thain <fthain@fastmail.com.au>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Christoph Hellwig <hch@lst.de>,
        Joshua Thompson <funaho@jurai.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <dc393de9-b4ae-5c87-d7c7-b3dd55c514a5@gmail.com>
Date:   Tue, 1 Jun 2021 19:55:25 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <e4635ac5-903a-a52e-51cf-b59295c76973@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

Am 01.06.2021 um 15:32 schrieb Michael Schmitz:
>> That's supposed to work, else our multi_defconfig is broken.
>
> Took a while to get back to this, but I believe unless this
> configuration sets CONFIG_ISA && !CONFIG_ATARI_ROM_ISA, Q40 ISA support
> will indeed be broken, due to
>
> #define inb(port)       ((port) < 1024 ? isa_rom_inb(port) : in_8(port))
>
> using incorrect address translation on Q40 (either that for the Atari
> ROM port, or none)? Not entirely sure what I had been smoking when
> writing that ...
>
> Conversely, if that combination _is_ set, neither ROM port access nor
> IDE access on Atari will work (again due to incorrect address
> translation - indiscriminately applying the one required for the ROM
> port in that case, which is inappropriate for Atari IDE).
>
> I'm currently considering a fix that does conditional address
> translation in isa_itb() and its buddys, and replaces in_8() by
> isa_inb() in the definition above (and equivalent changes elsewhere).

Untested (and mangled formatting, sorry):

> diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io_mm.h
> index d41fa48..aaae12f 100644
> --- a/arch/m68k/include/asm/io_mm.h
> +++ b/arch/m68k/include/asm/io_mm.h
> @@ -135,7 +135,10 @@ static inline u8 __iomem *isa_itb(unsigned long addr)
>      case ISA_TYPE_AG: return (u8 __iomem *)AG_ISA_IO_B(addr);
>  #endif
>  #ifdef CONFIG_ATARI_ROM_ISA
> -    case ISA_TYPE_ENEC: return (u8 __iomem *)ENEC_ISA_IO_B(addr);
>  #endif
>  #ifdef CONFIG_ATARI_ROM_ISA
> -    case ISA_TYPE_ENEC: return (u8 __iomem *)ENEC_ISA_IO_B(addr);
> +    case ISA_TYPE_ENEC: if (addr < 1024)
> +                               return (u8 __iomem *)ENEC_ISA_IO_B(addr);
> +                       else
> +                               return (u8 __iomem *)(addr);
>  #endif
>      default: return NULL; /* avoid warnings, just in case */
>      }
> @@ -151,7 +154,10 @@ static inline u16 __iomem *isa_itw(unsigned long addr)
>      case ISA_TYPE_AG: return (u16 __iomem *)AG_ISA_IO_W(addr);
>  #endif
>  #ifdef CONFIG_ATARI_ROM_ISA
> -    case ISA_TYPE_ENEC: return (u16 __iomem *)ENEC_ISA_IO_W(addr);
> +    case ISA_TYPE_ENEC: if (addr < 1024)
> +                               return (u16 __iomem *)ENEC_ISA_IO_W(addr);
> +                       else
> +                               return (u16 __iomem *)(addr);
>  #endif
>      default: return NULL; /* avoid warnings, just in case */
>      }
> @@ -177,7 +183,10 @@ static inline u8 __iomem *isa_mtb(unsigned long addr)
>      case ISA_TYPE_AG: return (u8 __iomem *)addr;
>  #endif
>  #ifdef CONFIG_ATARI_ROM_ISA
> -    case ISA_TYPE_ENEC: return (u8 __iomem *)ENEC_ISA_MEM_B(addr);
> +    case ISA_TYPE_ENEC: if (addr < 1024)
> +                               return (u8 __iomem *)ENEC_ISA_MEM_B(addr);
> +                       else
> +                               return (u8 __iomem *)(addr);
>  #endif
>      default: return NULL; /* avoid warnings, just in case */
>      }
> @@ -193,7 +202,10 @@ static inline u16 __iomem *isa_mtw(unsigned long addr)
>      case ISA_TYPE_AG: return (u16 __iomem *)addr;
>  #endif
>  #ifdef CONFIG_ATARI_ROM_ISA
> -    case ISA_TYPE_ENEC: return (u16 __iomem *)ENEC_ISA_MEM_W(addr);
> +    case ISA_TYPE_ENEC: if (addr < 1024)
> +                               return (u16 __iomem *)ENEC_ISA_MEM_W(addr);
> +                       else
> +                               return (u16 __iomem *)(addr);
>  #endif
>      default: return NULL; /* avoid warnings, just in case */
>      }
> @@ -344,17 +356,17 @@ static inline void isa_delay(void)
>   * ROM port ISA and everything else regular ISA for IDE. read,write defined
>   * below.
>   */
> -#define inb(port)      ((port) < 1024 ? isa_rom_inb(port) : in_8(port))
> -#define inb_p(port)    ((port) < 1024 ? isa_rom_inb_p(port) : in_8(port))
> -#define inw(port)      ((port) < 1024 ? isa_rom_inw(port) : in_le16(port))
> -#define inw_p(port)    ((port) < 1024 ? isa_rom_inw_p(port) : in_le16(port))
> +#define inb(port)      ((port) < 1024 ? isa_rom_inb(port) : isa_inb(port))
> +#define inb_p(port)    ((port) < 1024 ? isa_rom_inb_p(port) : isa_inb_p(port))
> +#define inw(port)      ((port) < 1024 ? isa_rom_inw(port) : isa_inw(port))
> +#define inw_p(port)    ((port) < 1024 ? isa_rom_inw_p(port) : isa_inw_p(port))
>  #define inl            isa_inl
>  #define inl_p          isa_inl_p
>
> -#define outb(val, port)        ((port) < 1024 ? isa_rom_outb((val), (port)) : out_8((port), (val)))
> -#define outb_p(val, port) ((port) < 1024 ? isa_rom_outb_p((val), (port)) : out_8((port), (val)))
> -#define outw(val, port)        ((port) < 1024 ? isa_rom_outw((val), (port)) : out_le16((port), (val)))
> -#define outw_p(val, port) ((port) < 1024 ? isa_rom_outw_p((val), (port)) : out_le16((port), (val)))
> +#define outb(val, port)        ((port) < 1024 ? isa_rom_outb((val), (port)) : isa_outb((val), (port)))
> +#define outb_p(val, port) ((port) < 1024 ? isa_rom_outb_p((val), (port)) : isa_outb_p((val), (port)))
> +#define outw(val, port)        ((port) < 1024 ? isa_rom_outw((val), (port)) : isa_outw((val), (port)))
> +#define outw_p(val, port) ((port) < 1024 ? isa_rom_outw_p((val), (port)) : isa_outw_p((val), (port)))
>  #define outl           isa_outl
>  #define outl_p         isa_outl_p
>

Could that have any new side effects on multiplatform kernels (other 
than addresses < 1024 still mangled by wrong translation and IO 
primitive on non-Atari platforms)?

Cheers,

	Michael
