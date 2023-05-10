Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3F5C77B7C
	for <linux-m68k@archiver.kernel.org>; Wed, 10 May 2023 05:03:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235765AbjEJFDu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 10 May 2023 01:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjEJFDs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 10 May 2023 01:03:48 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B3B1FE7
        for <linux-m68k@lists.linux-m68k.org>; Tue,  9 May 2023 22:03:44 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-55af4277904so104230997b3.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 09 May 2023 22:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683695024; x=1686287024;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mCwP+3tlZqvvMSbN25I242CI8N2o4w3/6RVIlVlj13g=;
        b=f+IDJIOxeE7pBv/ncUF3Dg8yBdNeigyWPgONUVZVc2EQnlwiXg/VQTMZqIyi1FwbhF
         hB12dPYWMlW78XVP1iXq4ueyFowA50D/X9k7kSng633zgtc6Ft9O69KyiELqvbNIUVet
         ZV3CNBYMAMk1NaEigxnnVZgnTZDfN2Zgt7qDs5DqEMg/xKQN3cvE2DpHKAZxvYja2q57
         EzxbR8ATmL4FQRq126r5Vter9+9PB+pvzYqq8Q0Kq08+IAz0Ct1bpmRKsD6HzoQSgfyW
         CVzetCsMpC4GogX7r4Ise+/fDJ+qVHJTfa1OEDnQ873jx9nxbHKiO6uVblFCp5x/gnEx
         bWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683695024; x=1686287024;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mCwP+3tlZqvvMSbN25I242CI8N2o4w3/6RVIlVlj13g=;
        b=HF+D+ix57wTyf4QZCoxPN2U9JnuT/YGzathXKoVfM6TQXI92fDv/Ik15sbfGL/naN+
         aq28ZejKXP3BjWFS7YcjaaF+kXDNQ2SudRDFWdZulHVzZ5ZyFsQrzZfnFv7AApywAArY
         VmE2ENVLVRX6Zkk/kM8rw6ih8kLnwSlJZC8FIYN0u/laZbWLfhuAxXyPOpBBYlJPrI+F
         wpWzKTfN1JnjJvO85x+1EygfArv0A4/gZk5ErxLbHBIDcLgzE1hCe29dC5j5ADa2fUna
         aIlohv5C0+8BIEJBVacDvnS+kdlgPMHVPTYxITJmJKb0NONchaAIwIO386wUZSD1Aj7w
         tTPw==
X-Gm-Message-State: AC+VfDxoF51J5uOKNoBg3X15HNOvjXRW7g9eBg8rcZsw0DZ5k4VBTtm/
        GBiAXg+xVe3PjAMeDSIA0zqljw==
X-Google-Smtp-Source: ACHHUZ57BibEP8l5nJ6F5+RjmWOH1yRU/GU0ORzVTyycrrSkC73g/4H986WkI3WYpSdD5+TSi7jmbQ==
X-Received: by 2002:a81:6c42:0:b0:55a:1022:7814 with SMTP id h63-20020a816c42000000b0055a10227814mr19292393ywc.28.1683695023901;
        Tue, 09 May 2023 22:03:43 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id i189-20020a816dc6000000b005463239c01esm3871312ywc.51.2023.05.09.22.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 22:03:43 -0700 (PDT)
Date:   Tue, 9 May 2023 22:03:39 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To:     Andrew Morton <akpm@linux-foundation.org>
cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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
Subject: [PATCH 17/23] sh/hugetlb: pte_alloc_huge() pte_offset_huge()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <85eeffe5-95f2-2574-365e-c9af663c8672@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

pte_alloc_map() expects to be followed by pte_unmap(), but hugetlb omits
that: to keep balance in future, use the recently added pte_alloc_huge()
instead; with pte_offset_huge() a better name for pte_offset_kernel().

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/sh/mm/hugetlbpage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sh/mm/hugetlbpage.c b/arch/sh/mm/hugetlbpage.c
index 999ab5916e69..6cb0ad73dbb9 100644
--- a/arch/sh/mm/hugetlbpage.c
+++ b/arch/sh/mm/hugetlbpage.c
@@ -38,7 +38,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 			if (pud) {
 				pmd = pmd_alloc(mm, pud, addr);
 				if (pmd)
-					pte = pte_alloc_map(mm, pmd, addr);
+					pte = pte_alloc_huge(mm, pmd, addr);
 			}
 		}
 	}
@@ -63,7 +63,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 			if (pud) {
 				pmd = pmd_offset(pud, addr);
 				if (pmd)
-					pte = pte_offset_map(pmd, addr);
+					pte = pte_offset_huge(pmd, addr);
 			}
 		}
 	}
-- 
2.35.3

