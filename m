Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C87C43334
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Jul 2022 10:03:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbiGFKD5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 6 Jul 2022 06:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbiGFKDw (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 6 Jul 2022 06:03:52 -0400
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC0C24F12
        for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Jul 2022 03:03:51 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id g14so17494589qto.9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 03:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=moQR5LBdu+yLzctPNV/vOqPzvGKHHurzxQlNOu9l9Us=;
        b=FaJ5irlwb8lhxD0GdEo5c2KYY42toa0uoyy88t6hAh9WYvGlv6hMp/IZtuaheo6D/c
         AtVkdtT/DvvxIVIQ/r4CHPyKcXr7n2QtCP5TLsPwSzhW7RXbxTBS0f2ObJhmnlb5xhJL
         WVd376z6IzdamObjdEn1xIx7z57/EQHEBom/idM3MO0FrfUoX8HHy9hZ8AVEHDRu3DkA
         qLIVagW1OKWHol0O/zDXxtsbAmxz+SN2iMFttE0nl9qk9hvWu3yT3vh911rs52O5fH4X
         3QeGxW2ByhrCiI/ogstN7Ute9C1mXOY1KJWAHMlWrSn9Enb05TeoSCNl9/gUUybG6W0O
         NNFg==
X-Gm-Message-State: AJIora8bZNDUpQ5nflst0ShTpa+n4NiTa+0nw/nG66rJQQgpWE/3TTid
        ChQDHEI1QZmsnuPPkAosjV30HMX1ciNyJjJZ
X-Google-Smtp-Source: AGRyM1vfItpOx3ci8dxMvQu4j9k295SZflT814yJvBmP8Xejor65rV9eX5euwUD1hSyPjhtascXWBA==
X-Received: by 2002:ac8:5bcf:0:b0:31b:ebe2:fee7 with SMTP id b15-20020ac85bcf000000b0031bebe2fee7mr31734316qtb.653.1657101830659;
        Wed, 06 Jul 2022 03:03:50 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id x19-20020ac87ed3000000b0031bf4dd8a39sm15803755qtj.56.2022.07.06.03.03.49
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 03:03:49 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-317a66d62dfso134718757b3.7
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 03:03:49 -0700 (PDT)
X-Received: by 2002:a0d:c787:0:b0:31b:a963:e1de with SMTP id
 j129-20020a0dc787000000b0031ba963e1demr44581975ywd.283.1657101828958; Wed, 06
 Jul 2022 03:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220630051630.1718927-1-anshuman.khandual@arm.com> <20220630051630.1718927-22-anshuman.khandual@arm.com>
In-Reply-To: <20220630051630.1718927-22-anshuman.khandual@arm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Jul 2022 12:03:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_Ji7dCzzCc3xw5ic6J=0PaPkyzXKpOgUFjjEkR+yJOw@mail.gmail.com>
Message-ID: <CAMuHMdX_Ji7dCzzCc3xw5ic6J=0PaPkyzXKpOgUFjjEkR+yJOw@mail.gmail.com>
Subject: Re: [PATCH V6 21/26] m68k/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-csky@vger.kernel.org,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Christoph Hellwig <hch@infradead.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        linux-um <linux-um@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Openrisc <openrisc@lists.librecores.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Parisc List <linux-parisc@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Anshuman,

On Thu, Jun 30, 2022 at 7:19 AM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> This enables ARCH_HAS_VM_GET_PAGE_PROT on the platform and exports standard
> vm_get_page_prot() implementation via DECLARE_VM_GET_PAGE_PROT, which looks
> up a private and static protection_map[] array. Subsequently all __SXXX and
> __PXXX macros can be dropped which are no longer needed.
>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Thanks for your patch!

> --- a/arch/m68k/include/asm/mcf_pgtable.h
> +++ b/arch/m68k/include/asm/mcf_pgtable.h
> @@ -91,60 +91,6 @@
>   * for use. In general, the bit positions are xwr, and P-items are
>   * private, the S-items are shared.
>   */

The comment above should be removed, too.

> -#define __P000         PAGE_NONE
> -#define __P001         __pgprot(CF_PAGE_VALID \
> -                                | CF_PAGE_ACCESSED \
> -                                | CF_PAGE_READABLE)

> --- a/arch/m68k/include/asm/motorola_pgtable.h
> +++ b/arch/m68k/include/asm/motorola_pgtable.h
> @@ -83,28 +83,6 @@ extern unsigned long mm_cachebits;
>  #define PAGE_COPY_C    __pgprot(_PAGE_PRESENT | _PAGE_RONLY | _PAGE_ACCESSED)
>  #define PAGE_READONLY_C        __pgprot(_PAGE_PRESENT | _PAGE_RONLY | _PAGE_ACCESSED)

You might move the *_C definitions above into arch/m68k/mm/motorola.c
as well, as they are only used in the latter.

>
> -/*
> - * The m68k can't do page protection for execute, and considers that the same are read.
> - * Also, write permissions imply read permissions. This is the closest we can get..
> - */
> -#define __P000 PAGE_NONE_C
> -#define __P001 PAGE_READONLY_C
> -#define __P010 PAGE_COPY_C
> -#define __P011 PAGE_COPY_C
> -#define __P100 PAGE_READONLY_C
> -#define __P101 PAGE_READONLY_C
> -#define __P110 PAGE_COPY_C
> -#define __P111 PAGE_COPY_C
> -
> -#define __S000 PAGE_NONE_C
> -#define __S001 PAGE_READONLY_C
> -#define __S010 PAGE_SHARED_C
> -#define __S011 PAGE_SHARED_C
> -#define __S100 PAGE_READONLY_C
> -#define __S101 PAGE_READONLY_C
> -#define __S110 PAGE_SHARED_C
> -#define __S111 PAGE_SHARED_C
> -
>  #define pmd_pgtable(pmd) ((pgtable_t)pmd_page_vaddr(pmd))
>
>  /*
> diff --git a/arch/m68k/include/asm/sun3_pgtable.h b/arch/m68k/include/asm/sun3_pgtable.h
> index 5e4e753f0d24..9d919491765b 100644
> --- a/arch/m68k/include/asm/sun3_pgtable.h
> +++ b/arch/m68k/include/asm/sun3_pgtable.h
> @@ -71,23 +71,6 @@
>   * protection settings, valid (implying read and execute) and writeable. These
>   * are as close as we can get...
>   */

The comment above should be removed, too.

> -#define __P000 PAGE_NONE
> -#define __P001 PAGE_READONLY

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
