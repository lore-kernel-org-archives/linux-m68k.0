Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A721C7EE2D
	for <linux-m68k@archiver.kernel.org>; Wed, 10 May 2023 05:06:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235856AbjEJFGE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 10 May 2023 01:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235830AbjEJFGC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 10 May 2023 01:06:02 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9534210A
        for <linux-m68k@lists.linux-m68k.org>; Tue,  9 May 2023 22:05:59 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-55dc3431c64so41307397b3.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 09 May 2023 22:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683695159; x=1686287159;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5V1nU3Kqzs/xawWKyc6+rxjcg3uMlDunTMtenGe5HoU=;
        b=N0ccCCldJapvDLseC6Ae/gJD9q2DIxAAw3KJfS7S7+Q6UO+MDy+UPXowXV56kKNmBh
         3Mokmi2EfuhYkE861agEU1f2+N38vFtBHN3adZPFSiNymcRq542MbJVdXHAXiJKHJj6j
         PW5BTFVqGg6WFWoU7ktsXhOWcUHvRDHGQ80ER3IipejgH466kSQjsSlWFLeYSYGuMRUz
         5wZRydrye3Efl1dYbQY0dngm8iOQ+1rBqJUd0qyj5Y3wp8X11XeCTxr6rq2XWmLrCq9U
         m9ccZupOhFtmx78yl7pPnJqam79iz8vb7MqRUPeR4jlUG408eYqlsqjsYTCBLZhrcSbS
         fkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683695159; x=1686287159;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5V1nU3Kqzs/xawWKyc6+rxjcg3uMlDunTMtenGe5HoU=;
        b=UOlrrnoMZVydE60x2TFAxCb6SwOw97HiO45fXb5enKqL0ZqIDXKyD3FjPV+IhCgT3N
         yaxurZk8H6SzFNkL5ImbKsTbt1FbqI6lzUPpCuWegIlm7wkGZX9+r+vhCVi1dcBM+EsW
         A3WcsTp0CKwxypyCirywiDzUPvGCh3XkENqgZh/2hom22USJn2xjsm4nGsYfeMpU8rvy
         851K2DXDRgK7LWGVTcLEX+OaCC7Pn9UVHA60tzP2DoMTJpmvVF9Vb9Wjh1LV4EWloOnb
         nkS7Dm6H70xmNERQa6i64AnU3iLjzRm/T4VbT5+toIhP4u4HtayswYaaBniowVABGphw
         25fA==
X-Gm-Message-State: AC+VfDzz5vpyf9uegdfgoLk02GAXOAH1xFGzLwYVt6mEuFJ6nfs8Xhv/
        KGISqhPFeONuG8bOFg5VCuBaKw==
X-Google-Smtp-Source: ACHHUZ4VqfeD37+8vGXb4Tz4frVt9EXwydQ25483WjEBunDFIHM7rsDjQYcLcdYu9I7uAgIFi9akfA==
X-Received: by 2002:a81:4897:0:b0:55a:e0db:5604 with SMTP id v145-20020a814897000000b0055ae0db5604mr17598841ywa.26.1683695159017;
        Tue, 09 May 2023 22:05:59 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id l186-20020a0dc9c3000000b0055d8768408dsm3772359ywd.105.2023.05.09.22.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 22:05:58 -0700 (PDT)
Date:   Tue, 9 May 2023 22:05:55 -0700 (PDT)
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
Subject: [PATCH 19/23] sparc: allow pte_offset_map() to fail
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <552ae7db-9c88-6f6b-aa6-45337d64447f@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

In rare transient cases, not yet made possible, pte_offset_map() and
pte_offset_map_lock() may not find a page table: handle appropriately.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/sparc/kernel/signal32.c | 2 ++
 arch/sparc/mm/fault_64.c     | 3 +++
 arch/sparc/mm/tlb.c          | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/arch/sparc/kernel/signal32.c b/arch/sparc/kernel/signal32.c
index dad38960d1a8..ca450c7bc53f 100644
--- a/arch/sparc/kernel/signal32.c
+++ b/arch/sparc/kernel/signal32.c
@@ -328,6 +328,8 @@ static void flush_signal_insns(unsigned long address)
 		goto out_irqs_on;
 
 	ptep = pte_offset_map(pmdp, address);
+	if (!ptep)
+		goto out_irqs_on;
 	pte = *ptep;
 	if (!pte_present(pte))
 		goto out_unmap;
diff --git a/arch/sparc/mm/fault_64.c b/arch/sparc/mm/fault_64.c
index d91305de694c..d8a407fbe350 100644
--- a/arch/sparc/mm/fault_64.c
+++ b/arch/sparc/mm/fault_64.c
@@ -99,6 +99,7 @@ static unsigned int get_user_insn(unsigned long tpc)
 	local_irq_disable();
 
 	pmdp = pmd_offset(pudp, tpc);
+again:
 	if (pmd_none(*pmdp) || unlikely(pmd_bad(*pmdp)))
 		goto out_irq_enable;
 
@@ -115,6 +116,8 @@ static unsigned int get_user_insn(unsigned long tpc)
 #endif
 	{
 		ptep = pte_offset_map(pmdp, tpc);
+		if (!ptep)
+			goto again;
 		pte = *ptep;
 		if (pte_present(pte)) {
 			pa  = (pte_pfn(pte) << PAGE_SHIFT);
diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
index 9a725547578e..7ecf8556947a 100644
--- a/arch/sparc/mm/tlb.c
+++ b/arch/sparc/mm/tlb.c
@@ -149,6 +149,8 @@ static void tlb_batch_pmd_scan(struct mm_struct *mm, unsigned long vaddr,
 	pte_t *pte;
 
 	pte = pte_offset_map(&pmd, vaddr);
+	if (!pte)
+		return;
 	end = vaddr + HPAGE_SIZE;
 	while (vaddr < end) {
 		if (pte_val(*pte) & _PAGE_VALID) {
-- 
2.35.3

