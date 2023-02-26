Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D22A0C64ED6
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Feb 2023 20:19:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjBZUTH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 26 Feb 2023 15:19:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjBZUTG (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 26 Feb 2023 15:19:06 -0500
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9BE1FEF
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Feb 2023 12:19:02 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id c19so4673173qtn.13
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Feb 2023 12:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gg5lD1thnSOjSPD2ugSmhhuDJpRIfjxQ4WV4ji/sEm4=;
        b=mb76w+EnrBJNEKttL99LWD+U5vpVpChi8U4rDND0HrK6qQtdhk/U/AOYRhsM4lRSg3
         /xZULaqXcwl4IVYeV81avuRDUwKuUOQlZ+LR229eR2a+15Jv9SBvDaFZlG2ULwfnDT9g
         0RcPIu38knTJo1vBH80Yev1SDtlXuI2lilRW6SCH6zt2lttAZb0X6W+NNlr2wDcqTCZG
         zUbffnJbXfQTH6AKS4NmIwkkr29mMXWowI0vfU/pdPqRODbqmpIwZnCClmGJnBpP4mG+
         hKFmSYRB9RXnRYgqVZyx7fI/CbcbK1I6RwFMzxWdk9YvuV0K8U95VmMgqj9tBya4t1rq
         NxfA==
X-Gm-Message-State: AO0yUKUW25u3pvXtrI5MlQiHeegDgpa9CI2ijREeZZ+9a5AN9CXBRZmG
        CFX3oWeXk7MoCiTmubIyQ8y/pjQ8qZPKdg==
X-Google-Smtp-Source: AK7set8HC2fOSIvLZOUPRmc6/pSl7+OYQPqpgHiUjT0HEUdTvvMtDpu4fMTv1x3nbyWT2HTKSnMGkA==
X-Received: by 2002:ac8:5807:0:b0:3bd:1a8a:800b with SMTP id g7-20020ac85807000000b003bd1a8a800bmr41900339qtg.62.1677442741419;
        Sun, 26 Feb 2023 12:19:01 -0800 (PST)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com. [209.85.219.53])
        by smtp.gmail.com with ESMTPSA id c2-20020ac84e02000000b003bd21323c80sm3426660qtw.11.2023.02.26.12.19.01
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Feb 2023 12:19:01 -0800 (PST)
Received: by mail-qv1-f53.google.com with SMTP id m4so3231709qvq.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Feb 2023 12:19:01 -0800 (PST)
X-Received: by 2002:a81:af5f:0:b0:536:38b4:f51 with SMTP id
 x31-20020a81af5f000000b0053638b40f51mr8731562ywj.5.1677442427017; Sun, 26 Feb
 2023 12:13:47 -0800 (PST)
MIME-Version: 1.0
References: <20230113171026.582290-1-david@redhat.com> <20230113171026.582290-12-david@redhat.com>
In-Reply-To: <20230113171026.582290-12-david@redhat.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 26 Feb 2023 21:13:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-FDga8w=pgg1myskEx6wp+oyZifhPPPFnWrc1zW7ZpQ@mail.gmail.com>
Message-ID: <CAMuHMdX-FDga8w=pgg1myskEx6wp+oyZifhPPPFnWrc1zW7ZpQ@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 11/26] microblaze/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Yang Shi <shy828301@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Nadav Amit <namit@vmware.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
        x86@kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        Michal Simek <monstr@monstr.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi David,

On Fri, Jan 13, 2023 at 6:16 PM David Hildenbrand <david@redhat.com> wrote:
> Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by stealing one bit
> from the type. Generic MM currently only uses 5 bits for the type
> (MAX_SWAPFILES_SHIFT), so the stolen bit is effectively unused.
>
> The shift by 2 when converting between PTE and arch-specific swap entry
> makes the swap PTE layout a little bit harder to decipher.
>
> While at it, drop the comment from paulus---copy-and-paste leftover
> from powerpc where we actually have _PAGE_HASHPTE---and mask the type in
> __swp_entry_to_pte() as well.
>
> Cc: Michal Simek <monstr@monstr.eu>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Thanks for your patch, which is now commit b5c88f21531c3457
("microblaze/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE") in

>  arch/m68k/include/asm/mcf_pgtable.h   |  4 +--

What is this m68k change doing here?
Sorry for not noticing this earlier.

Furthermore, several things below look strange to me...

>  arch/microblaze/include/asm/pgtable.h | 45 +++++++++++++++++++++------
>  2 files changed, 37 insertions(+), 12 deletions(-)
>
> diff --git a/arch/m68k/include/asm/mcf_pgtable.h b/arch/m68k/include/asm/mcf_pgtable.h
> index 3f8f4d0e66dd..e573d7b649f7 100644
> --- a/arch/m68k/include/asm/mcf_pgtable.h
> +++ b/arch/m68k/include/asm/mcf_pgtable.h
> @@ -46,8 +46,8 @@
>  #define _CACHEMASK040          (~0x060)
>  #define _PAGE_GLOBAL040                0x400   /* 68040 global bit, used for kva descs */
>
> -/* We borrow bit 7 to store the exclusive marker in swap PTEs. */
> -#define _PAGE_SWP_EXCLUSIVE    0x080
> +/* We borrow bit 24 to store the exclusive marker in swap PTEs. */
> +#define _PAGE_SWP_EXCLUSIVE    CF_PAGE_NOCACHE

CF_PAGE_NOCACHE is 0x80, so this is still bit 7, thus the new comment
is wrong?

>
>  /*
>   * Externally used page protection values.
> diff --git a/arch/microblaze/include/asm/pgtable.h b/arch/microblaze/include/asm/pgtable.h
> index 42f5988e998b..7e3de54bf426 100644
> --- a/arch/microblaze/include/asm/pgtable.h
> +++ b/arch/microblaze/include/asm/pgtable.h
> @@ -131,10 +131,10 @@ extern pte_t *va_to_pte(unsigned long address);
>   * of the 16 available.  Bit 24-26 of the TLB are cleared in the TLB
>   * miss handler.  Bit 27 is PAGE_USER, thus selecting the correct
>   * zone.
> - * - PRESENT *must* be in the bottom two bits because swap cache
> - * entries use the top 30 bits.  Because 4xx doesn't support SMP
> - * anyway, M is irrelevant so we borrow it for PAGE_PRESENT.  Bit 30
> - * is cleared in the TLB miss handler before the TLB entry is loaded.
> + * - PRESENT *must* be in the bottom two bits because swap PTEs use the top
> + * 30 bits.  Because 4xx doesn't support SMP anyway, M is irrelevant so we
> + * borrow it for PAGE_PRESENT.  Bit 30 is cleared in the TLB miss handler
> + * before the TLB entry is loaded.

So the PowerPC 4xx comment is still here?

>   * - All other bits of the PTE are loaded into TLBLO without
>   *  * modification, leaving us only the bits 20, 21, 24, 25, 26, 30 for
>   * software PTE bits.  We actually use bits 21, 24, 25, and
> @@ -155,6 +155,9 @@ extern pte_t *va_to_pte(unsigned long address);
>  #define _PAGE_ACCESSED 0x400   /* software: R: page referenced */
>  #define _PMD_PRESENT   PAGE_MASK
>
> +/* We borrow bit 24 to store the exclusive marker in swap PTEs. */
> +#define _PAGE_SWP_EXCLUSIVE    _PAGE_DIRTY

_PAGE_DIRTY is 0x80, so this is also bit 7, thus the new comment is
wrong?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
