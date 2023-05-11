Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1893AC7EE2A
	for <linux-m68k@archiver.kernel.org>; Thu, 11 May 2023 06:54:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbjEKGyE convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 11 May 2023 02:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237199AbjEKGxo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 11 May 2023 02:53:44 -0400
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFEC55FDD
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 May 2023 23:53:42 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7575fc62c7aso547133785a.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 May 2023 23:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683788021; x=1686380021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MblyuSVWD0Rw/dgsETYZNoTE8y2XjkYZe4ysDLt2Njg=;
        b=eSifNd4VvpASn+F/syML//C9TcfATwGPSgDu7G+OeJ8m9ufmQ5m5XCrcvF0LBIsz7q
         /2iIt1GwFRpVPAUWPfRO2UGNuVr+C1fVYz9vR43bkLWY7PqMcbEPJp2y+BgX12Kvn7yP
         4gHThdCvs1xvChH2j5fuBWsQvQ7LHnx0lz3JfdEPCtcPWNofzleXybV/fFEbRvmsTGH8
         GTdaNa7bm2BmlUpdigNm+gh5Ou6TfyNjeOu5Z9qO1zq1V7H+xtyvN54DP6OVRu016fHF
         UhJUCOphiYsL5NR20bb37DaQrp5GT18BETZCgIgGW2za2x/HFP65mIeL1o6Tt54H+vo8
         kvNw==
X-Gm-Message-State: AC+VfDyL2BhHQN4a7GmgJgiUzy3hfJRq3JjNL7yt0NHftSdbewaBbMWx
        FLMHC4o1VbaovNZu42lUFTAAL0dyFvj1ag==
X-Google-Smtp-Source: ACHHUZ72dBVwaPgPpLoosMjL91BQHV58ItyFP4DmMo8Fwjj0kaGzfndILUp5KliIRxriTnDfVLYBbQ==
X-Received: by 2002:ac8:5b01:0:b0:3ef:499a:dd99 with SMTP id m1-20020ac85b01000000b003ef499add99mr27282036qtw.66.1683788021417;
        Wed, 10 May 2023 23:53:41 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id t21-20020ac86a15000000b003e4dab0776esm2019026qtr.40.2023.05.10.23.53.41
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 23:53:41 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-3ef32014101so82340641cf.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 May 2023 23:53:41 -0700 (PDT)
X-Received: by 2002:a25:aaa6:0:b0:b9d:a27c:3fc9 with SMTP id
 t35-20020a25aaa6000000b00b9da27c3fc9mr17668190ybi.33.1683787999800; Wed, 10
 May 2023 23:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
 <237c8410-ce61-94c-4260-7318ad6a4f3@google.com> <CAMuHMdWb0SrEs=cDzKW1Ai2UywnnpZip4pk9mOkiVGivPpj8sg@mail.gmail.com>
 <b4a5f11-68ee-7bba-b362-10ef7c9b956@google.com>
In-Reply-To: <b4a5f11-68ee-7bba-b362-10ef7c9b956@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 11 May 2023 08:53:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMhQ_DyNC-4yJRRHKYcKCrwRdxvBwGDv2FzhLSNw4Bmw@mail.gmail.com>
Message-ID: <CAMuHMdXMhQ_DyNC-4yJRRHKYcKCrwRdxvBwGDv2FzhLSNw4Bmw@mail.gmail.com>
Subject: Re: [PATCH 05/23] m68k: allow pte_offset_map[_lock]() to fail
To:     Hugh Dickins <hughd@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller <deller@gmx.de>,
        John David Anglin <dave.anglin@bell.net>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Hugh,

On Thu, May 11, 2023 at 4:58 AM Hugh Dickins <hughd@google.com> wrote:
> On Wed, 10 May 2023, Geert Uytterhoeven wrote:
> > On Wed, May 10, 2023 at 6:48 AM Hugh Dickins <hughd@google.com> wrote:
> > > In rare transient cases, not yet made possible, pte_offset_map() and
> > > pte_offset_map_lock() may not find a page table: handle appropriately.
> > >
> > > Restructure cf_tlb_miss() with a pte_unmap() (previously omitted)
> > > at label out, followed by one local_irq_restore() for all.
> >
> > That's a bug fix, which should be a separate patch?
>
> No, that's not a bug fix for the current tree, since m68k does not
> offer CONFIG_HIGHPTE, so pte_unmap() is never anything but a no-op
> for m68k (see include/linux/pgtable.h).
>
> But I want to change pte_unmap() to do something even without
> CONFIG_HIGHPTE, so have to fix up any such previously harmless
> omissions in this series first.

OK.

> > > --- a/arch/m68k/include/asm/mmu_context.h
> > > +++ b/arch/m68k/include/asm/mmu_context.h
> > > @@ -99,7 +99,7 @@ static inline void load_ksp_mmu(struct task_struct *task)
> > >         p4d_t *p4d;
> > >         pud_t *pud;
> > >         pmd_t *pmd;
> > > -       pte_t *pte;
> > > +       pte_t *pte = NULL;
> > >         unsigned long mmuar;
> > >
> > >         local_irq_save(flags);
> > > @@ -139,7 +139,7 @@ static inline void load_ksp_mmu(struct task_struct *task)
> > >
> > >         pte = (mmuar >= PAGE_OFFSET) ? pte_offset_kernel(pmd, mmuar)
> > >                                      : pte_offset_map(pmd, mmuar);
> > > -       if (pte_none(*pte) || !pte_present(*pte))
> > > +       if (!pte || pte_none(*pte) || !pte_present(*pte))
> > >                 goto bug;
> >
> > If the absence of a pte is to become a non-abnormal case, it should
> > probably jump to "end" instead, to avoid spamming the kernel log.
>
> I don't think so (but of course it's hard for you to tell, without
> seeing all completed series of series).  If pmd_none(*pmd) can safely
> goto bug just above, and pte_none(*pte) goto bug here, well, the !pte
> case is going to be stranger than either of those.
>
> My understanding of this function, load_ksp_mmu(), is that it's dealing
> at context switch with a part of userspace which very much needs to be
> present: whatever keeps that from being swapped out or migrated at
> present, will be sure to keep the !pte case away - we cannot steal its
> page table just at random (and a THP on m68k would be surprising too).
>
> Though there is one case I can think of which will cause !pte here,
> and so goto bug: if the pmd entry has got corrupted, and counts as
> pmd_bad(), which will be tested (and cleared) in pte_offset_map().
> But it is okay to report a bug in that case.
>
> I can certainly change this to goto end instead if you still prefer,
> no problem; but I'd rather keep it as is, if only for me to be proved
> wrong by you actually seeing spam there.

OK, makes sense.

> > > @@ -161,6 +161,8 @@ static inline void load_ksp_mmu(struct task_struct *task)
> > >  bug:
> > >         pr_info("ksp load failed: mm=0x%p ksp=0x08%lx\n", mm, mmuar);
> > >  end:
> > > +       if (pte && mmuar < PAGE_OFFSET)
> > > +               pte_unmap(pte);
> >
> > Is this also a bugfix, not mentioned in the patch description?
>
> I'm not sure whether you're referring to the pte_unmap() which we
> already discussed above, or you're seeing something else in addition;
> but I don't think there's a bugfix here, just a rearrangement because
> we now want lots of cases to do the pte_unmap() and local_irq_restore().

I was referring to the addition of pte_unmap().
As per your explanation above, this is not a bugfix.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
