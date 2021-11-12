Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7DBC433F5
	for <linux-m68k@archiver.kernel.org>; Fri, 12 Nov 2021 08:05:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9003260FBF
	for <linux-m68k@archiver.kernel.org>; Fri, 12 Nov 2021 08:05:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233476AbhKLIIe (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 12 Nov 2021 03:08:34 -0500
Received: from mail-ua1-f53.google.com ([209.85.222.53]:35619 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233189AbhKLIId (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 12 Nov 2021 03:08:33 -0500
Received: by mail-ua1-f53.google.com with SMTP id l24so12922452uak.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Nov 2021 00:05:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CKrL2aGswaQqu3Y4OscoOg26JEi6rIvHQtas6Avt604=;
        b=4fc7RmsFaSgJEg1WFCUx5DueXEy1YkjmNeYDsGev/wNSfexOD7sCyAoIfkteRe/7E0
         shZs7tQIXk0uVBNw4+5GwnsLJbWuCYiKINHDN5sEbUud/kFAnVk96XlR2VQ4Lbs5fPGS
         SuhFrK2HPoosyoeKh7+QmfwITN55CbA8bYVvl/U69lDzx1+tvqrihG3fAwJzyJ0leGMj
         6Qmb46RGFPm4yCj0UotwJlwfMxgUn9SiUTJlIrMfUQ9RXOiBAwpsymiL3GxXHKEM88cg
         PoT4g0ZmYRUzgv8hSnf2otB3f6BXG3H/Bd8wPnXf/pRd5yLNrcrcIbN03Llo2GqVpN+b
         puog==
X-Gm-Message-State: AOAM532LSIwraWFrxg9TaxJT4lWLVvwd7I1wcaQ9vGuFCvzv+Tys2Ekp
        q/2kRqvb3P6iUUuwRFSWd77kbURVkpmcrA==
X-Google-Smtp-Source: ABdhPJwvSfm8DAZnj+oJ5QnI3gYsOwpy9fw9wOAh9twQS0aZdWshSi6whKsC0kvyUIYw4JbjNzQEOQ==
X-Received: by 2002:ab0:5b5d:: with SMTP id v29mr20048989uae.110.1636704342880;
        Fri, 12 Nov 2021 00:05:42 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id e9sm3832927uan.9.2021.11.12.00.05.42
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 00:05:42 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id i6so17183416uae.6
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Nov 2021 00:05:42 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr7254340vst.37.1636704342222;
 Fri, 12 Nov 2021 00:05:42 -0800 (PST)
MIME-Version: 1.0
References: <1a89fd7d58f22e4817cf5bb406cc191dc0bc9325.1636677401.git.fthain@linux-m68k.org>
In-Reply-To: <1a89fd7d58f22e4817cf5bb406cc191dc0bc9325.1636677401.git.fthain@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 09:05:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXsVvXCbmrdukLCd-AXrqT-LmCz427BdNNCbDUw9vmL1A@mail.gmail.com>
Message-ID: <CAMuHMdXsVvXCbmrdukLCd-AXrqT-LmCz427BdNNCbDUw9vmL1A@mail.gmail.com>
Subject: Re: [PATCH] m68k: Enable memtest functionality
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Mike Rapoport <rppt@kernel.org>, Sam Creasey <sammy@sammy.net>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Fri, Nov 12, 2021 at 1:37 AM Finn Thain <fthain@linux-m68k.org> wrote:
> Enable the memtest functionality and rearrange some code to prevent it
> from clobbering the initrd.
>
> The CONFIG_BLK_DEV_INITRD symbol was conditional on !defined(CONFIG_SUN3).
> For simplicity, remove that test on the basis that m68k_ramdisk.size == 0
> on Sun 3.
>
> The SLIME source code at
> http://sammy.net/sun3/ftp/pub/m68k/sun3/slime/slime-2.0.tar.gz
> indicates that no BI_RAMDISK entry is ever passed to the kernel due
> to #ifdef 0 around the relevant code.
>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Sam Creasey <sammy@sammy.net>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Thanks for your patch!

> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -9,6 +9,7 @@ config M68K
>         select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
>         select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
>         select ARCH_NO_PREEMPT if !COLDFIRE
> +       select ARCH_USE_MEMTEST

if MMU_MOTOROLA?

>         select ARCH_WANT_IPC_PARSE_VERSION
>         select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
>         select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE
> diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
> index 4b51bfd38e5f..49e573b94326 100644
> --- a/arch/m68k/kernel/setup_mm.c
> +++ b/arch/m68k/kernel/setup_mm.c
> @@ -338,13 +338,6 @@ void __init setup_arch(char **cmdline_p)
>                 panic("No configuration setup");
>         }
>
> -       paging_init();
> -
> -#ifdef CONFIG_NATFEAT
> -       nf_init();
> -#endif
> -
> -#ifndef CONFIG_SUN3
>  #ifdef CONFIG_BLK_DEV_INITRD
>         if (m68k_ramdisk.size) {
>                 memblock_reserve(m68k_ramdisk.addr, m68k_ramdisk.size);

Does this still work, given the initrd is part of memory that used
to be added before (in paging_init(), but now is added later?
(I'm no memblock expert, so that might be a silly question ;-)

> @@ -354,6 +347,12 @@ void __init setup_arch(char **cmdline_p)
>         }
>  #endif
>
> +       paging_init();
> +
> +#ifdef CONFIG_NATFEAT
> +       nf_init();
> +#endif
> +
>  #ifdef CONFIG_ATARI
>         if (MACH_IS_ATARI)
>                 atari_stram_reserve_pages((void *)availmem);
> @@ -364,8 +363,6 @@ void __init setup_arch(char **cmdline_p)
>         }
>  #endif
>
> -#endif /* !CONFIG_SUN3 */
> -
>  /* set ISA defs early as possible */
>  #if defined(CONFIG_ISA) && defined(MULTI_ISA)
>         if (MACH_IS_Q40) {
> diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
> index 9f3f77785aa7..5b6575eb6d02 100644
> --- a/arch/m68k/mm/motorola.c
> +++ b/arch/m68k/mm/motorola.c
> @@ -455,6 +455,8 @@ void __init paging_init(void)
>
>         flush_tlb_all();
>
> +       early_memtest(min_addr, max_addr);

So this is available only if MMU_MOTOROLA, not for Sun-3, Coldfire,
or nommu.

> +
>         /*
>          * initialize the bad page table and bad page to point
>          * to a couple of allocated pages

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
