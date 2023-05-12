Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7090FC77B7C
	for <linux-m68k@archiver.kernel.org>; Fri, 12 May 2023 09:56:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240585AbjELJ42 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 12 May 2023 05:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240577AbjELJ4R (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 12 May 2023 05:56:17 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21AD911568
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 May 2023 02:56:08 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-55a1462f9f6so94882707b3.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 May 2023 02:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683885367; x=1686477367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G26aphgD58tBa5cm3UBUurmWT+f5Rv1D2HQTBHZMzO8=;
        b=Fbphuz+q9ZIwjEIe5LecWhJ+wolQ8o3l6ACskPyPCNIYmNxAp7mnZ0MF5AP6Hbqq+Z
         uZGEjvGfgImmHN6Q7OOrJccFXstvBwVgzuMTOYgYK7IOZR83Gjv0dIswbhMXXTHKCv/9
         kBfjSR32lk211SgJ6Rd9OV5dIkuiODK1ObUfM7tG0oEU0rRYePJMhFvnzgyulJDlYtSm
         GfVBIQSpxT8u+YMiTJ9NKeQbBgpk7aKwhpYszx0wjdPmkaBS758CAOQFW4HrYreoh+V/
         uM7Wc9PVJX1e7VJH6gkMWAYu/h5BvC8CQg1arL0biuq57YcmLkm3D8ASjpExyFKLM7wH
         efYQ==
X-Gm-Message-State: AC+VfDxkVW2WOGO+7WPgoJqmUejVAE8sHe8APY+XGHARoobiG/f/yg14
        oCa2Zz2mpz8eEqYodS9QypUrwREbHC+Ngg==
X-Google-Smtp-Source: ACHHUZ6x91j5W0HYnh5xbnEY32VshuwxIUcz2AzDeJReIUJwoDn2V8DZusHXdXUMoDccMbn4VIORCQ==
X-Received: by 2002:a0d:c241:0:b0:556:2699:f3ce with SMTP id e62-20020a0dc241000000b005562699f3cemr21509312ywd.36.1683885367474;
        Fri, 12 May 2023 02:56:07 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id e6-20020a0dc206000000b0054e82b6a95esm5535449ywd.42.2023.05.12.02.56.06
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 02:56:06 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-55dc3431c64so71617077b3.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 May 2023 02:56:06 -0700 (PDT)
X-Received: by 2002:a81:a012:0:b0:555:f33e:e32e with SMTP id
 x18-20020a81a012000000b00555f33ee32emr22884527ywg.51.1683885366474; Fri, 12
 May 2023 02:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230503-virt-to-pfn-v6-4-rc1-v1-0-6c4698dcf9c8@linaro.org> <20230503-virt-to-pfn-v6-4-rc1-v1-2-6c4698dcf9c8@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v1-2-6c4698dcf9c8@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 May 2023 11:55:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJjjo9TMeow1-i27ybpQOu9-VZYnTkY5p8p_Cm6sW_GA@mail.gmail.com>
Message-ID: <CAMuHMdVJjjo9TMeow1-i27ybpQOu9-VZYnTkY5p8p_Cm6sW_GA@mail.gmail.com>
Subject: Re: [PATCH 02/12] m68k: Pass a pointer to virt_to_pfn() virt_to_page()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Vineet Gupta <vgupta@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-snps-arc@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
        linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Linus,

On Thu, May 11, 2023 at 1:59 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> Functions that work on a pointer to virtual memory such as
> virt_to_pfn() and users of that function such as
> virt_to_page() are supposed to pass a pointer to virtual
> memory, ideally a (void *) or other pointer. However since
> many architectures implement virt_to_pfn() as a macro,
> this function becomes polymorphic and accepts both a
> (unsigned long) and a (void *).
>
> Fix up the offending calls in arch/m68k with explicit casts.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Add an extra parens around the page argument to the
>   PD_PTABLE() macro, as is normally required.

Thanks for the update!

To build sun3_defconfig and m5475evb_defconfig cleanly, you need to
include the (Gmail-whitespace-damaged) changes below.
These were compile-tested only.

diff --git a/arch/m68k/include/asm/mcf_pgtable.h
b/arch/m68k/include/asm/mcf_pgtable.h
index 96d069829803505c..46ae379bb14d5e05 100644
--- a/arch/m68k/include/asm/mcf_pgtable.h
+++ b/arch/m68k/include/asm/mcf_pgtable.h
@@ -135,7 +135,7 @@ static inline void pte_clear(struct mm_struct *mm,
unsigned long addr,
 }

 #define pte_pagenr(pte)        ((__pte_page(pte) - PAGE_OFFSET) >> PAGE_SHIFT)
-#define pte_page(pte)  virt_to_page(__pte_page(pte))
+#define pte_page(pte)  virt_to_page((void *)__pte_page(pte))

 static inline int pmd_none2(pmd_t *pmd) { return !pmd_val(*pmd); }
 #define pmd_none(pmd) pmd_none2(&(pmd))
diff --git a/arch/m68k/include/asm/sun3_pgtable.h
b/arch/m68k/include/asm/sun3_pgtable.h
index e582b0484a55cd82..f3e7728f58cd9dd0 100644
--- a/arch/m68k/include/asm/sun3_pgtable.h
+++ b/arch/m68k/include/asm/sun3_pgtable.h
@@ -109,9 +109,9 @@ static inline void pte_clear (struct mm_struct
*mm, unsigned long addr, pte_t *p
 #define pfn_pte(pfn, pgprot) \
 ({ pte_t __pte; pte_val(__pte) = pfn | pgprot_val(pgprot); __pte; })

-#define pte_page(pte)          virt_to_page(__pte_page(pte))
+#define pte_page(pte)          virt_to_page((void *)__pte_page(pte))
 #define pmd_pfn(pmd)           (pmd_val(pmd) >> PAGE_SHIFT)
-#define pmd_page(pmd)          virt_to_page(pmd_page_vaddr(pmd))
+#define pmd_page(pmd)          virt_to_page((void *)pmd_page_vaddr(pmd))


 static inline int pmd_none2 (pmd_t *pmd) { return !pmd_val (*pmd); }
diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index 70aa0979e02710a8..a4c552c7e2c8ca12 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -69,7 +69,7 @@ void __init paging_init(void)

                /* now change pg_table to kernel virtual addresses */
                for (i = 0; i < PTRS_PER_PTE; ++i, ++pg_table) {
-                       pte_t pte = pfn_pte(virt_to_pfn(address), PAGE_INIT);
+                       pte_t pte = pfn_pte(virt_to_pfn((void
*)address), PAGE_INIT);
                        if (address >= (unsigned long) high_memory)
                                pte_val(pte) = 0;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
