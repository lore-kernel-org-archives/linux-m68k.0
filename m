Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7362AC7EE26
	for <linux-m68k@archiver.kernel.org>; Wed, 10 May 2023 04:54:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235583AbjEJEyN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 10 May 2023 00:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235407AbjEJEyH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 10 May 2023 00:54:07 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10BF0272B
        for <linux-m68k@lists.linux-m68k.org>; Tue,  9 May 2023 21:54:05 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-55aa1da9d4aso120935107b3.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 09 May 2023 21:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683694444; x=1686286444;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8E7TU+EpCMsIU6CqnZRd0vWJGC9oqEXRuUswowSWl1o=;
        b=nx2nVYMVrNHZwwSl8w3NSmhsRvWihgBOt84R2c16JqiYC4KBl38YHxIAdhEkbKIKU+
         3KinRet9UKewX1U+bJzN/HA2S7KOTkCF4X7wqaw/K7+S17drzHhQwyGVptzSW8CKp+rn
         7n/QckVxFQIds+kKrngIuvcYjerJY8U+pP0nKt9JbKkli09JNKT1dmegLnEsv/7gGsJF
         Qp1n5E/tb+Ovu77mxoxN3oLzT8n8iySQ8FxtBPgBcz8wTrqYdAKrqvMBlZ96CIsNIEnp
         6lPBYSKwbzZLj7KAL6W20hrNmnnmTZNvlsZaMnXbJsKFp6VCUGJP8Oy+j1QTC9dUJ6vO
         gsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683694444; x=1686286444;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8E7TU+EpCMsIU6CqnZRd0vWJGC9oqEXRuUswowSWl1o=;
        b=Z8ftSSbp8XPGU647TFow3RIJ8pleKV8P5YCF3xllCw0oogmddynZ8UfINUHyp5QHwI
         7K1J8S/DTJLHpKVCS388tx262J1BN+GwbA01B/O65Tz58s1nahsXcbXJiqebUnkPc81V
         NNSTrx5dGmAs2pchRyz+5dGS3J8gGnsvtY0z8TPfdksBev2Ozvw5RLCHOY/qv7MBIc/W
         LNY5eXH6MV0Vo9uQxqlE0kyQh2OEZfHESD/Al0PC/uGhHPcRP4h89bMt4RZjwlXnMLpa
         Aac+6/IO81E0fgXYlygYKcJRcUaCwwf1lTFsE14SM8fbUvcQxRDewqbBRJjyWACZkN6c
         56VA==
X-Gm-Message-State: AC+VfDz5mF86Cqz69piqX79Tr0Hu3HmQ5zUr1ggbD7+/g6JcW4/aZ+m/
        KEhRKeDhFtIEWnqIUt1bV4hCEw==
X-Google-Smtp-Source: ACHHUZ57Dsib2dNeEkcs0nwSe68HvlbijE2Qa11Gh7g4OTrdhlBqOZhC7lvqfUbJMl49On6qtViJzQ==
X-Received: by 2002:a0d:d955:0:b0:55a:ad0a:766 with SMTP id b82-20020a0dd955000000b0055aad0a0766mr17847236ywe.10.1683694444181;
        Tue, 09 May 2023 21:54:04 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id l4-20020a81d544000000b0055b46dac76esm3814196ywj.116.2023.05.09.21.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 21:54:03 -0700 (PDT)
Date:   Tue, 9 May 2023 21:54:00 -0700 (PDT)
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
Subject: [PATCH 09/23] parisc: unmap_uncached_pte() use pte_offset_kernel()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <12c4693d-8bb3-2852-8cf5-9777b427d770@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

unmap_uncached_pte() is working from pgd_offset_k(vaddr), so it should
use pte_offset_kernel() instead of pte_offset_map(), to avoid the
question of whether a pte_unmap() will be needed to balance.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/parisc/kernel/pci-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index ba87f791323b..52d5f8a5cdd2 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -164,7 +164,7 @@ static inline void unmap_uncached_pte(pmd_t * pmd, unsigned long vaddr,
 		pmd_clear(pmd);
 		return;
 	}
-	pte = pte_offset_map(pmd, vaddr);
+	pte = pte_offset_kernel(pmd, vaddr);
 	vaddr &= ~PMD_MASK;
 	end = vaddr + size;
 	if (end > PMD_SIZE)
-- 
2.35.3

