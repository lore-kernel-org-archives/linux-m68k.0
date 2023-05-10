Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E654BC7EE25
	for <linux-m68k@archiver.kernel.org>; Wed, 10 May 2023 07:14:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236106AbjEJHOa convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 10 May 2023 03:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236462AbjEJHO0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 10 May 2023 03:14:26 -0400
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0671B3C2F
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 May 2023 00:14:25 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4348416ae45so3717937137.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 May 2023 00:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683702864; x=1686294864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvYmUAzo0cwOybz0hjxV39+5gh/FQ5/NU0n3aFKpLiE=;
        b=SIDqvp2aaifXV+67C9gBM5tHi/b23LzS+DPNzmu8QaUM0aEzU/EnFFGAlPGZmGhiIo
         RS+pS9xvQqNaY1g5cyHdkArRu3bSqeDbQvKpMwS6Uz37272k2j0EHpCcP9Rrfiqq6NhQ
         XRgPlp4tBlflx/Z6Wbwn4q7DdBTTaVgdtfIlfCMd89OjgcCGz4iypEDwpYaQ1YNvEHpT
         ZVHAwWo1rAYz7tCGo41mrXYeh3/TQeo79coNmlRQSRvDP+HimfH35PTbeBGtH3wF+XmN
         NPi0jT1cEtHhZVAg3+57G/BqDKLERnKeuwYOzhjQacNema696VF6mLB8cI38pOyFVA6x
         72ZA==
X-Gm-Message-State: AC+VfDzDYbQ2HL9rf3pqMIsL3GUyxu94I/kxoL6idtuTCxactdWpZb2e
        z8Bhb4O8SkS35jLyWgEK9Dhha0K9b37VPA==
X-Google-Smtp-Source: ACHHUZ5DwjUxpAJb0yBLFhD7IBIPu6N9ilxLBqbgaw+ZO0KLGQkj6WzvelYxCbBpbRcLLtXfRPYNsg==
X-Received: by 2002:a05:6102:3a66:b0:42f:46d6:7a65 with SMTP id bf6-20020a0561023a6600b0042f46d67a65mr5960966vsb.21.1683702863651;
        Wed, 10 May 2023 00:14:23 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id n15-20020a67e04f000000b0042d50a6c251sm1919945vsl.14.2023.05.10.00.14.23
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:14:23 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4348416ae45so3717928137.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 May 2023 00:14:23 -0700 (PDT)
X-Received: by 2002:a05:6902:1147:b0:b99:4ac6:3c75 with SMTP id
 p7-20020a056902114700b00b994ac63c75mr18672301ybu.10.1683702842290; Wed, 10
 May 2023 00:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com> <237c8410-ce61-94c-4260-7318ad6a4f3@google.com>
In-Reply-To: <237c8410-ce61-94c-4260-7318ad6a4f3@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 May 2023 09:13:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWb0SrEs=cDzKW1Ai2UywnnpZip4pk9mOkiVGivPpj8sg@mail.gmail.com>
Message-ID: <CAMuHMdWb0SrEs=cDzKW1Ai2UywnnpZip4pk9mOkiVGivPpj8sg@mail.gmail.com>
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

Thanks for your patch!

On Wed, May 10, 2023 at 6:48 AM Hugh Dickins <hughd@google.com> wrote:
> In rare transient cases, not yet made possible, pte_offset_map() and
> pte_offset_map_lock() may not find a page table: handle appropriately.
>
> Restructure cf_tlb_miss() with a pte_unmap() (previously omitted)
> at label out, followed by one local_irq_restore() for all.

That's a bug fix, which should be a separate patch?

>
> Signed-off-by: Hugh Dickins <hughd@google.com>


> --- a/arch/m68k/include/asm/mmu_context.h
> +++ b/arch/m68k/include/asm/mmu_context.h
> @@ -99,7 +99,7 @@ static inline void load_ksp_mmu(struct task_struct *task)
>         p4d_t *p4d;
>         pud_t *pud;
>         pmd_t *pmd;
> -       pte_t *pte;
> +       pte_t *pte = NULL;
>         unsigned long mmuar;
>
>         local_irq_save(flags);
> @@ -139,7 +139,7 @@ static inline void load_ksp_mmu(struct task_struct *task)
>
>         pte = (mmuar >= PAGE_OFFSET) ? pte_offset_kernel(pmd, mmuar)
>                                      : pte_offset_map(pmd, mmuar);
> -       if (pte_none(*pte) || !pte_present(*pte))
> +       if (!pte || pte_none(*pte) || !pte_present(*pte))
>                 goto bug;

If the absence of a pte is to become a non-abnormal case, it should
probably jump to "end" instead, to avoid spamming the kernel log.

>
>         set_pte(pte, pte_mkyoung(*pte));
> @@ -161,6 +161,8 @@ static inline void load_ksp_mmu(struct task_struct *task)
>  bug:
>         pr_info("ksp load failed: mm=0x%p ksp=0x08%lx\n", mm, mmuar);
>  end:
> +       if (pte && mmuar < PAGE_OFFSET)
> +               pte_unmap(pte);

Is this also a bugfix, not mentioned in the patch description?

>         local_irq_restore(flags);
>  }
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
