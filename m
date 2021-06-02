Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379A3C47098
	for <linux-m68k@archiver.kernel.org>; Wed,  2 Jun 2021 11:26:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26CDE613D2
	for <linux-m68k@archiver.kernel.org>; Wed,  2 Jun 2021 11:26:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232939AbhFBL2E (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 2 Jun 2021 07:28:04 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:43835 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232947AbhFBL1U (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 2 Jun 2021 07:27:20 -0400
Received: by mail-ua1-f50.google.com with SMTP id f1so1071208uaj.10
        for <linux-m68k@lists.linux-m68k.org>; Wed, 02 Jun 2021 04:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AV6hHV9w+Q9HOaDxt1MduQbvvUP04JEJ1UZD5l/XTkY=;
        b=a7NWhwd3Kv5MtVbCWSt0W2aOo8Bk+FHKWtxdquHTas0jB4qEd9EBo8w29Mq2Rjb6J+
         C2d3kgwV1Vlzn8aigVHZTFYd40QnTH2ABSh6yTVSsrNykYBdIqHcj6g1yQ/otOA3qOLM
         5Nh895chpodMNo3YiT+s7O6VVmpFfAPdL7OhZNdPGCR27PTFGJM1+j9U3arX22pSqqik
         KlQgC1B3y1+cZYoVGkd6taA9m6cSL/BpXSxK5tFk1Gyl9szz79ZV4kGxbivkBFYMeiOC
         uims1acns93Em/k0Z1thY1D4frV1NqDfmgeQs9Rw4cMvIfoSsn+ecFLudNPpWPmcAXme
         3/2Q==
X-Gm-Message-State: AOAM530P/nt238Q1yZ3rLG1OisgtEuGw3/ZV1YT/YsAJX4T0/qwdtFiK
        BE1xLfGSlEvKMvzhJMvBLf+QuEOclpU6lZWiPAY=
X-Google-Smtp-Source: ABdhPJyzzWa9paQxXHYFBMFScAZBlkmtyILKANDBBOx9rPPA/yxyu03vLu3qpQ9izu7tVqpx2AMkJo4APWbgLQB/p8I=
X-Received: by 2002:ab0:26d8:: with SMTP id b24mr14134972uap.58.1622633136111;
 Wed, 02 Jun 2021 04:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210602105348.13387-1-rppt@kernel.org> <20210602105348.13387-5-rppt@kernel.org>
In-Reply-To: <20210602105348.13387-5-rppt@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 2 Jun 2021 13:25:24 +0200
Message-ID: <CAMuHMdUUzMNcWNXCjwZmH-VBC+jH1ShBpeg6EBCdRXv3mwHxsQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] m68k: remove support for DISCONTIGMEM
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Jonathan Corbet <corbet@lwn.net>,
        Matt Turner <mattst88@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Richard Henderson <rth@twiddle.net>,
        Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
        alpha <linux-alpha@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        sparclinux <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Mike,

On Wed, Jun 2, 2021 at 12:54 PM Mike Rapoport <rppt@kernel.org> wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> DISCONTIGMEM was replaced by FLATMEM with freeing of the unused memory map
> in v5.11.
>
> Remove the support for DISCONTIGMEM entirely.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/arch/m68k/include/asm/page_mm.h
> +++ b/arch/m68k/include/asm/page_mm.h
> @@ -126,25 +126,7 @@ static inline void *__va(unsigned long x)
>
>  extern int m68k_virt_to_node_shift;
>
> -#ifndef CONFIG_DISCONTIGMEM
>  #define __virt_to_node(addr)   (&pg_data_map[0])

With pg_data_map[] removed, this definition can go as well.
Seems to be a leftover from 1008a11590b966b4 ("m68k: switch to MEMBLOCK
 + NO_BOOTMEM")

There are a few more:
arch/m68k/include/asm/mmzone.h:extern pg_data_t pg_data_map[];
arch/m68k/include/asm/mmzone.h:#define NODE_DATA(nid)
(&pg_data_map[nid])

> -#else
> -extern struct pglist_data *pg_data_table[];
> -
> -static inline __attribute_const__ int __virt_to_node_shift(void)
> -{
> -       int shift;
> -
> -       asm (
> -               "1:     moveq   #0,%0\n"
> -               m68k_fixup(%c1, 1b)
> -               : "=d" (shift)
> -               : "i" (m68k_fixup_vnode_shift));
> -       return shift;
> -}
> -
> -#define __virt_to_node(addr)   (pg_data_table[(unsigned long)(addr) >> __virt_to_node_shift()])
> -#endif

> --- a/arch/m68k/mm/init.c
> +++ b/arch/m68k/mm/init.c
> @@ -44,28 +44,8 @@ EXPORT_SYMBOL(empty_zero_page);
>
>  int m68k_virt_to_node_shift;
>
> -#ifdef CONFIG_DISCONTIGMEM
> -pg_data_t pg_data_map[MAX_NUMNODES];
> -EXPORT_SYMBOL(pg_data_map);
> -
> -pg_data_t *pg_data_table[65];
> -EXPORT_SYMBOL(pg_data_table);
> -#endif
> -

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
