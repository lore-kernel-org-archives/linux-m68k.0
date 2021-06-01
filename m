Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75800C47080
	for <linux-m68k@archiver.kernel.org>; Tue,  1 Jun 2021 08:43:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52B6B60FDA
	for <linux-m68k@archiver.kernel.org>; Tue,  1 Jun 2021 08:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232869AbhFAIo4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 1 Jun 2021 04:44:56 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:40662 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbhFAIo4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 1 Jun 2021 04:44:56 -0400
Received: by mail-vs1-f42.google.com with SMTP id e2so5127880vsr.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 01 Jun 2021 01:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rcat9HYTkzPzyYAdiDEubVK+fpMXpoBVyKObXi0xt+8=;
        b=XvOXUmQQ0hvkSOLQqL6z2WgPQUrBNyyq44LCl5hc3/usxB2hWVNZB1Q8pz/PNLkVz1
         ak85S1ToWE0iUCUN286SmIH9lPFrYBeeJCE7ZjKyoqWIphPyiNFCCVLFzunvvEl60t9m
         JTP3T+5yapoYkxxnD8hU3KskEImLN8aX39yWNm6s74z4I2gAp1K2qmeolWt68yw8PC04
         8BbNpN+CmWu05Cd4fnIWWfA9F9wi/4rkdNOO1o2OTeziBZppHuFISJJ8nOowJXCtSqqI
         K/jgiovz0CyXCnxwLbJh/fmVfIMUCN5x/Zyap07+MYcFzGutrWyx2qNzVsJuMdDxy+jc
         oS3w==
X-Gm-Message-State: AOAM5306ZGYf89wCcv3KaIkGsrWGBIPkYzU9RPPExQn6Bm/di1+xEO+5
        8UmvFaXuf+R487KTb1XpMCXQzq+TFz5dHkheCM8=
X-Google-Smtp-Source: ABdhPJxXFH627HL0faBJj7C4caKn/Kq65USNnNYw4tyHsH3RFajpLfRv7xOWPkly91iycO1TbAsrjah0h3eaaRiMkwM=
X-Received: by 2002:a67:b303:: with SMTP id a3mr6943953vsm.40.1622536993591;
 Tue, 01 Jun 2021 01:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <793432cca963b632709c4d1312baa9874d73e1d8.1619341585.git.fthain@telegraphics.com.au>
 <ba908b1d-eab5-a4e5-0c0a-2c745287d121@physik.fu-berlin.de>
 <10a08764-c138-9fe5-966c-ce68349b9b6@nippy.intranet> <65f01f42-31d9-522a-e690-73d286405a01@gmail.com>
 <9650358f-a789-7dbd-4495-1d39ff321ded@nippy.intranet> <ada88dd6-f8d7-11dc-9a89-5c7e437a0981@gmail.com>
 <CAMuHMdUy_B_+pHZQpnDHYsee+gpXOs9ek_HaVxLjE2HVfGmLQg@mail.gmail.com>
 <e4635ac5-903a-a52e-51cf-b59295c76973@gmail.com> <dc393de9-b4ae-5c87-d7c7-b3dd55c514a5@gmail.com>
In-Reply-To: <dc393de9-b4ae-5c87-d7c7-b3dd55c514a5@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Jun 2021 10:43:02 +0200
Message-ID: <CAMuHMdUskb3oicq8Kbf6MY_4mn4-Y1pJ-om4fny7k48gndscgg@mail.gmail.com>
Subject: Re: [PATCH] m68k/mac: Replace macide driver with generic platform driver
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Finn Thain <fthain@fastmail.com.au>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Christoph Hellwig <hch@lst.de>,
        Joshua Thompson <funaho@jurai.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Tue, Jun 1, 2021 at 9:55 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 01.06.2021 um 15:32 schrieb Michael Schmitz:
> >> That's supposed to work, else our multi_defconfig is broken.
> >
> > Took a while to get back to this, but I believe unless this
> > configuration sets CONFIG_ISA && !CONFIG_ATARI_ROM_ISA, Q40 ISA support
> > will indeed be broken, due to
> >
> > #define inb(port)       ((port) < 1024 ? isa_rom_inb(port) : in_8(port))
> >
> > using incorrect address translation on Q40 (either that for the Atari
> > ROM port, or none)? Not entirely sure what I had been smoking when
> > writing that ...
> >
> > Conversely, if that combination _is_ set, neither ROM port access nor
> > IDE access on Atari will work (again due to incorrect address
> > translation - indiscriminately applying the one required for the ROM
> > port in that case, which is inappropriate for Atari IDE).
> >
> > I'm currently considering a fix that does conditional address
> > translation in isa_itb() and its buddys, and replaces in_8() by
> > isa_inb() in the definition above (and equivalent changes elsewhere).
>
> Untested (and mangled formatting, sorry):
>
> > diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io_mm.h
> > index d41fa48..aaae12f 100644
> > --- a/arch/m68k/include/asm/io_mm.h
> > +++ b/arch/m68k/include/asm/io_mm.h
> > @@ -135,7 +135,10 @@ static inline u8 __iomem *isa_itb(unsigned long addr)
> >      case ISA_TYPE_AG: return (u8 __iomem *)AG_ISA_IO_B(addr);
> >  #endif
> >  #ifdef CONFIG_ATARI_ROM_ISA
> > -    case ISA_TYPE_ENEC: return (u8 __iomem *)ENEC_ISA_IO_B(addr);
> >  #endif

Bogus hunk?

> >  #ifdef CONFIG_ATARI_ROM_ISA
> > -    case ISA_TYPE_ENEC: return (u8 __iomem *)ENEC_ISA_IO_B(addr);
> > +    case ISA_TYPE_ENEC: if (addr < 1024)
> > +                               return (u8 __iomem *)ENEC_ISA_IO_B(addr);
> > +                       else
> > +                               return (u8 __iomem *)(addr);
> >  #endif
> >      default: return NULL; /* avoid warnings, just in case */
> >      }
> > @@ -151,7 +154,10 @@ static inline u16 __iomem *isa_itw(unsigned long addr)
> >      case ISA_TYPE_AG: return (u16 __iomem *)AG_ISA_IO_W(addr);
> >  #endif
> >  #ifdef CONFIG_ATARI_ROM_ISA
> > -    case ISA_TYPE_ENEC: return (u16 __iomem *)ENEC_ISA_IO_W(addr);
> > +    case ISA_TYPE_ENEC: if (addr < 1024)
> > +                               return (u16 __iomem *)ENEC_ISA_IO_W(addr);
> > +                       else
> > +                               return (u16 __iomem *)(addr);
> >  #endif
> >      default: return NULL; /* avoid warnings, just in case */
> >      }
> > @@ -177,7 +183,10 @@ static inline u8 __iomem *isa_mtb(unsigned long addr)
> >      case ISA_TYPE_AG: return (u8 __iomem *)addr;
> >  #endif
> >  #ifdef CONFIG_ATARI_ROM_ISA
> > -    case ISA_TYPE_ENEC: return (u8 __iomem *)ENEC_ISA_MEM_B(addr);
> > +    case ISA_TYPE_ENEC: if (addr < 1024)
> > +                               return (u8 __iomem *)ENEC_ISA_MEM_B(addr);
> > +                       else
> > +                               return (u8 __iomem *)(addr);
> >  #endif
> >      default: return NULL; /* avoid warnings, just in case */
> >      }
> > @@ -193,7 +202,10 @@ static inline u16 __iomem *isa_mtw(unsigned long addr)
> >      case ISA_TYPE_AG: return (u16 __iomem *)addr;
> >  #endif
> >  #ifdef CONFIG_ATARI_ROM_ISA
> > -    case ISA_TYPE_ENEC: return (u16 __iomem *)ENEC_ISA_MEM_W(addr);
> > +    case ISA_TYPE_ENEC: if (addr < 1024)
> > +                               return (u16 __iomem *)ENEC_ISA_MEM_W(addr);
> > +                       else
> > +                               return (u16 __iomem *)(addr);
> >  #endif
> >      default: return NULL; /* avoid warnings, just in case */
> >      }
> > @@ -344,17 +356,17 @@ static inline void isa_delay(void)
> >   * ROM port ISA and everything else regular ISA for IDE. read,write defined
> >   * below.
> >   */
> > -#define inb(port)      ((port) < 1024 ? isa_rom_inb(port) : in_8(port))
> > -#define inb_p(port)    ((port) < 1024 ? isa_rom_inb_p(port) : in_8(port))
> > -#define inw(port)      ((port) < 1024 ? isa_rom_inw(port) : in_le16(port))
> > -#define inw_p(port)    ((port) < 1024 ? isa_rom_inw_p(port) : in_le16(port))
> > +#define inb(port)      ((port) < 1024 ? isa_rom_inb(port) : isa_inb(port))
> > +#define inb_p(port)    ((port) < 1024 ? isa_rom_inb_p(port) : isa_inb_p(port))
> > +#define inw(port)      ((port) < 1024 ? isa_rom_inw(port) : isa_inw(port))
> > +#define inw_p(port)    ((port) < 1024 ? isa_rom_inw_p(port) : isa_inw_p(port))
> >  #define inl            isa_inl
> >  #define inl_p          isa_inl_p
> >
> > -#define outb(val, port)        ((port) < 1024 ? isa_rom_outb((val), (port)) : out_8((port), (val)))
> > -#define outb_p(val, port) ((port) < 1024 ? isa_rom_outb_p((val), (port)) : out_8((port), (val)))
> > -#define outw(val, port)        ((port) < 1024 ? isa_rom_outw((val), (port)) : out_le16((port), (val)))
> > -#define outw_p(val, port) ((port) < 1024 ? isa_rom_outw_p((val), (port)) : out_le16((port), (val)))
> > +#define outb(val, port)        ((port) < 1024 ? isa_rom_outb((val), (port)) : isa_outb((val), (port)))
> > +#define outb_p(val, port) ((port) < 1024 ? isa_rom_outb_p((val), (port)) : isa_outb_p((val), (port)))
> > +#define outw(val, port)        ((port) < 1024 ? isa_rom_outw((val), (port)) : isa_outw((val), (port)))
> > +#define outw_p(val, port) ((port) < 1024 ? isa_rom_outw_p((val), (port)) : isa_outw_p((val), (port)))
> >  #define outl           isa_outl
> >  #define outl_p         isa_outl_p
> >
>
> Could that have any new side effects on multiplatform kernels (other

Sorry, being an Amiga MMIO user, I don't know my way through the
maze of ISA I/O accessors...

> than addresses < 1024 still mangled by wrong translation and IO
> primitive on non-Atari platforms)?

Hence q40ide is still broken on Q40 in multi-platform kernels?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
