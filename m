Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEADEC64ED8
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Feb 2023 14:43:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjB0On0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Feb 2023 09:43:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjB0OnZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Feb 2023 09:43:25 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA201BACE
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 06:43:23 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id l13so6857159qtv.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 06:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZtpzGlheMp9cWEjldclbCx07Trvxzhn2kfeNTxmqNPE=;
        b=TlxTYqdQl/Ci8UjQO/MB+g1bPs8zm3RZqVeYz1s3WPrkDq/sXYrd0IwMefBl07oPqh
         a1RP3lDnTFMoVCPhOOuGsHeyAnmz2242XcU5e1BMuH20P5TLF3vLSvck+iPWnM7GKzGG
         hktaXKY5QkPhRVrR/XRpkc++buImg4U3606xc9u/Faem6f6SafOjMa8Tng/2K/G4LDE9
         mXX48GF37fN8Z8D6V2U9TJiIH/3qi7RffFC9D4hGqSdIVEiTapXMs+cm/uG9gxaauRut
         RuQok9nXtNKBVpKnziO/xGpOL67RfQqjlVnAgZsnrQrYLAIf6Xau0iOwBSzj7nH3gbJY
         7zRg==
X-Gm-Message-State: AO0yUKUqWj2W1+v2ursvnwW3kByFTxOVRjmvs6P3+eeaSSc0Lnu0ZkVj
        gT4ll+oIqYbQD9oSSH7IUPnhvVh78AQv1w==
X-Google-Smtp-Source: AK7set9bj7rYNlSk5u4mhK1J5VvhaCTCQZiR1gR4xj4UFHlGJ58H6KltWP/WP5JD/0nC0NfT4X2I/g==
X-Received: by 2002:a05:622a:28e:b0:3bf:d9d2:4871 with SMTP id z14-20020a05622a028e00b003bfd9d24871mr5490592qtw.12.1677509002751;
        Mon, 27 Feb 2023 06:43:22 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id t30-20020a05620a005e00b00742709bc5edsm5018766qkt.5.2023.02.27.06.43.21
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 06:43:22 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-536be69eadfso182726647b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 06:43:21 -0800 (PST)
X-Received: by 2002:a81:ad43:0:b0:533:91d2:9d94 with SMTP id
 l3-20020a81ad43000000b0053391d29d94mr10571733ywk.5.1677509001567; Mon, 27 Feb
 2023 06:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20230113171026.582290-1-david@redhat.com> <20230113171026.582290-12-david@redhat.com>
 <CAMuHMdX-FDga8w=pgg1myskEx6wp+oyZifhPPPFnWrc1zW7ZpQ@mail.gmail.com> <9ed766a6-cf06-535d-3337-ea6ff25c2362@redhat.com>
In-Reply-To: <9ed766a6-cf06-535d-3337-ea6ff25c2362@redhat.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Feb 2023 15:43:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSaoKqO1Nx7QMDCcXrRmFbqqX8uwDRezXs8g+HdEFjKA@mail.gmail.com>
Message-ID: <CAMuHMdWSaoKqO1Nx7QMDCcXrRmFbqqX8uwDRezXs8g+HdEFjKA@mail.gmail.com>
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

On Mon, Feb 27, 2023 at 2:31 PM David Hildenbrand <david@redhat.com> wrote:
> On 26.02.23 21:13, Geert Uytterhoeven wrote:
> > On Fri, Jan 13, 2023 at 6:16 PM David Hildenbrand <david@redhat.com> wrote:
> >> Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by stealing one bit
> >> from the type. Generic MM currently only uses 5 bits for the type
> >> (MAX_SWAPFILES_SHIFT), so the stolen bit is effectively unused.
> >>
> >> The shift by 2 when converting between PTE and arch-specific swap entry
> >> makes the swap PTE layout a little bit harder to decipher.
> >>
> >> While at it, drop the comment from paulus---copy-and-paste leftover
> >> from powerpc where we actually have _PAGE_HASHPTE---and mask the type in
> >> __swp_entry_to_pte() as well.
> >>
> >> Cc: Michal Simek <monstr@monstr.eu>
> >> Signed-off-by: David Hildenbrand <david@redhat.com>
> >
> > Thanks for your patch, which is now commit b5c88f21531c3457
> > ("microblaze/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE") in
> >
>
> Right, it went upstream, so we can only fixup.
>
> >>   arch/m68k/include/asm/mcf_pgtable.h   |  4 +--
> >
> > What is this m68k change doing here?
> > Sorry for not noticing this earlier.
>
> Thanks for the late review, still valuable :)
>
> That hunk should have gone into the previous patch, looks like I messed
> that up when reworking.
>
> >
> > Furthermore, several things below look strange to me...
> >
> >>   arch/microblaze/include/asm/pgtable.h | 45 +++++++++++++++++++++------
> >>   2 files changed, 37 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/arch/m68k/include/asm/mcf_pgtable.h b/arch/m68k/include/asm/mcf_pgtable.h
> >> index 3f8f4d0e66dd..e573d7b649f7 100644
> >> --- a/arch/m68k/include/asm/mcf_pgtable.h
> >> +++ b/arch/m68k/include/asm/mcf_pgtable.h
> >> @@ -46,8 +46,8 @@
> >>   #define _CACHEMASK040          (~0x060)
> >>   #define _PAGE_GLOBAL040                0x400   /* 68040 global bit, used for kva descs */
> >>
> >> -/* We borrow bit 7 to store the exclusive marker in swap PTEs. */
> >> -#define _PAGE_SWP_EXCLUSIVE    0x080
> >> +/* We borrow bit 24 to store the exclusive marker in swap PTEs. */
> >> +#define _PAGE_SWP_EXCLUSIVE    CF_PAGE_NOCACHE
> >
> > CF_PAGE_NOCACHE is 0x80, so this is still bit 7, thus the new comment
> > is wrong?
>
> You're right, it's still bit 7 (and we use LSB-0 bit numbering in that
> file). I'll send a fixup.

OK.

> >>   /*
> >>    * Externally used page protection values.
> >> diff --git a/arch/microblaze/include/asm/pgtable.h b/arch/microblaze/include/asm/pgtable.h
> >> index 42f5988e998b..7e3de54bf426 100644
> >> --- a/arch/microblaze/include/asm/pgtable.h
> >> +++ b/arch/microblaze/include/asm/pgtable.h
> >> @@ -131,10 +131,10 @@ extern pte_t *va_to_pte(unsigned long address);
> >>    * of the 16 available.  Bit 24-26 of the TLB are cleared in the TLB
> >>    * miss handler.  Bit 27 is PAGE_USER, thus selecting the correct
> >>    * zone.
> >> - * - PRESENT *must* be in the bottom two bits because swap cache
> >> - * entries use the top 30 bits.  Because 4xx doesn't support SMP
> >> - * anyway, M is irrelevant so we borrow it for PAGE_PRESENT.  Bit 30
> >> - * is cleared in the TLB miss handler before the TLB entry is loaded.
> >> + * - PRESENT *must* be in the bottom two bits because swap PTEs use the top
> >> + * 30 bits.  Because 4xx doesn't support SMP anyway, M is irrelevant so we
> >> + * borrow it for PAGE_PRESENT.  Bit 30 is cleared in the TLB miss handler
> >> + * before the TLB entry is loaded.
> >
> > So the PowerPC 4xx comment is still here?
>
> I only dropped the comment above __swp_type(). I guess you mean that we
> could also drop the "Because 4xx doesn't support SMP anyway, M is
> irrelevant so we borrow it for PAGE_PRESENT." sentence, correct? Not

Yes, that's what I meant.

> sure about the "Bit 30 is cleared in the TLB miss handler" comment, if
> that can similarly be dropped.

No idea, didn't check. But if it was copied from PPC, chances are
high it's no longer true....

> >>    * - All other bits of the PTE are loaded into TLBLO without
> >>    *  * modification, leaving us only the bits 20, 21, 24, 25, 26, 30 for
> >>    * software PTE bits.  We actually use bits 21, 24, 25, and
> >> @@ -155,6 +155,9 @@ extern pte_t *va_to_pte(unsigned long address);
> >>   #define _PAGE_ACCESSED 0x400   /* software: R: page referenced */
> >>   #define _PMD_PRESENT   PAGE_MASK
> >>
> >> +/* We borrow bit 24 to store the exclusive marker in swap PTEs. */
> >> +#define _PAGE_SWP_EXCLUSIVE    _PAGE_DIRTY
> >
> > _PAGE_DIRTY is 0x80, so this is also bit 7, thus the new comment is
> > wrong?
>
> In the example, I use MSB-0 bit numbering (which I determined to be
> correct in microblaze context eventually, but I got confused a couple a
> times because it's very inconsistent). That should be MSB-0 bit 24.

Thanks, TIL microblaze uses IBM bit numbering...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
