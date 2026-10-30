Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349508;
	b=ih7zwptBPjkqfb47jOOIlsnLMpO6xLx310UH4xH5TKqxBbxlm7OTNA5/fndrJ2XYBH5I
	 63snJGxeuLC7OWurTlURI5iQYMD8J2Z9SWhDN3JwmleSUkcdkc3q7XiW7pieX0GyeWvdP
	 lzIsuOj7mELsgQg/Gyon54B5Y9mhzVCwkW316csW+oFb/0KeOs9qbURPB1V/bYXyuCuBR
	 1XkvaSBoHR4ZUJ8MnnJVM9rJpl0bCnbdprtQeSJAbwzuwjhmqlpQ2jW1k6lkHbxhuivps
	 pmIkiYhWiD/SDpVlFrUb4t1e5qbaKQnCa2e0q5wqWKj+KAySxGxZWUOggwCUwi/G+tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kNSWkSKbXy4yqbi1F/NqpsveYsUGyKJhJ7RGmrJoCBE=;
	b=snWwttSIXruRhgseJEcd9lovVWiJ4wLwcOHIwOCvNbML3PNjo+bSLPAOUtrjAzc0BRVK
	 qMJcfX5H8gu9nSD9rlZFEN09rhte2eI9iy6fqK+JASFc1hhY3+/DNmNzdEOixbSYcAPY2
	 mmjdx9zqRfv//E7ITCAZzb394fjIUbVyVFznl2mE3FbjMFP929qjtdSsTZAAfbWZLZ3FR
	 B2SL0UNhiwagsWfdV9ix9jBXdrhTXHJMSqxQ8qpSfshqo3zI9c9LVPpphvoSzsNe+Fqi0
	 U6KWq9XaYm3sm86+KsIYoriwbXLENvUMIuiSssRqsFoH/63wcPibMkQwegtTsXpitEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TAJ+Kps4;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF8360A2633
	for <linux-m68k@lists.linux-m68k.org>; Fri, 30 Oct 2026 08:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF8360A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TAJ+Kps4
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so175089a91.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 30 Oct 2026 01:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793349507; x=1793954307; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNSWkSKbXy4yqbi1F/NqpsveYsUGyKJhJ7RGmrJoCBE=;
        b=TAJ+Kps4HGYJeoDSCnIdBVBHtcyDDMXEZUWM9aH2yhPlYc8iUjl0NBKkbUDE0/XMYd
         8vl+Jfy6fAvO8R/0FYqYytHMfSS1qtZQyoULYU4vUkPREq8AxmP4b9/44VU31A2mbnjY
         kjrxsjBzPCZmoYFY7Z4+w13VJ4EvnF7Ar6+2OD/I9zUeCz/3KrqiRD4qrJvTwV4X64t1
         fos/eXn7sMIIDMUhoftORyCInDZX2z86FRFRzDZXIPUTz9XiN8DqgaW+OUDJxaOoVSxs
         LFjICVRRBTWjbvJUhSSu0uu5LcAakbMMeyqmZONzNfrTF0G4EajHeRvhVgAM2aiDsrWt
         dJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349507; x=1793954307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kNSWkSKbXy4yqbi1F/NqpsveYsUGyKJhJ7RGmrJoCBE=;
        b=qTXlzeCAhGAFydQsPw3WJOFJzcR1/ay+om/3JBjNO46UYpBP53sUNeDkjE8nSANAH2
         m7byOT0yhKuFm4ZpmFJL6UNyJ+NhnMK6T8BTZAR4zxZhXTr2sXeoC5rt6/nvniL3zL97
         amqvvy4K8kt9DNwDc8WiJsYpkYYH2U1Q0L/WpjVq5mjyn76f/xd74GwKsvvRlUrZN01k
         +EID5I9E2tLhHmuRV9hCSW1CcdA+bzaoKUdjXC7cMQyGx/JQZg/muvEi7u7N1a+pXHat
         j21UkCca53L8+PoMqxN7rhmK5acox2lkXj0AG1WkvLrPcJw3fn8khH7P4stbru8g+99d
         bKeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwN+UfDv/GBuRzY0kDmqx4eSv3hLbx589VwkdQ5YEt5o68ECUGSnJKPToEsm0oiHS6z3JTIkufR5kao@lists.linux-m68k.org
X-Gm-Message-State: AFq9FYJFXiONNhe8JxZM0ZUlp7VOyv6ZNKM4KqIke2W/MH1vZkQ1vvNH
	b4cYVDB4tIZtnQkOIMH+PKSVBodYn42YLXe5wDSsM0PEJKutHda904oWx3/BPBVoWX4=
X-Gm-Gg: AYBFou3HcdRmgdOHegdMu2DRd3Ak2E7lspLa1920g6Kh14yFWbbnHESu5MyjKwWvr9t
	aD2fDqr5L5zmSeSoIA0FdsjtKT22k1eePRK5lzPnn+u7LomKIf76GdDUsyJTwB/TBN7fmhpld9e
	xY6Q1BWOteIb2sI3mM5MnZAUz6HGbaV2fOyaQIR4FyCV1PO5H98NxyzNS6DqI/yVYh0fufnjOT0
	KgMHDbpT90ObPQpVMrfRuQRiId3/wBYS5Z9MQkFr3n+Ie3Q9N6wOukF8Hr1rSeKW9K0HrH98j2q
	P3YohotwsXg+R608NUuuSm9qdCpD7qc0c51WtyrpVlHLu8nOXzG7NrvCtKbB9ruLSTfoCFa20Sx
	sUfgnLcda4HRi0M88ysJ3dmbT0gOu7q6Z2gCb/NrEnpMSnSpyH4MuSqcBPoYx2ZZMKFvvIty6cq
	25uDPYHsm1ymEFS1RQm2N/Rmp/E8lRp37fn7qnGe9xCQQ6G+Bw6Ixrpns83avI59uEdIRPPJSD3
	kmz/58TffhtB95HMqtftWSY6ZrkAlco1sB5i5QGzr89TVFqkdZWWdU7Wl52iFaaVpzT6UOQbnqS
	m85tNJGkyRil0eAKTfrvCJ+bA8tj8KvbJkVJey0KzSZUzFoWIRE=
X-Received: by 2002:a17:90a:e70c:b0:3ad:a232:4044 with SMTP id 98e67ed59e1d1-3ae8979969fmr1091626a91.38.1793349506870;
        Fri, 30 Oct 2026 01:38:26 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9b1506sm7542122a91.15.2026.10.30.01.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:38:26 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Alistair Popple <apopple@nvidia.com>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>
Subject: [PATCH 2/2] mm: remove redundant pagetable_dtor() calls
Date: Fri, 30 Oct 2026 16:38:00 +0800
Message-ID: <20261030083800.599152-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030083800.599152-1-songmuchun@bytedance.com>
References: <20261030083800.599152-1-songmuchun@bytedance.com>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pagetable_free() now runs pagetable_dtor() for constructed page
tables. Calling the destructor immediately before freeing the page table
therefore duplicates the lifecycle handling at each caller.

Remove the redundant calls and let pagetable_free() handle the
destructor. No functional change is intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/m68k/include/asm/mcf_pgalloc.h    | 1 -
 arch/powerpc/mm/book3s64/mmu_context.c | 1 -
 arch/powerpc/mm/book3s64/pgtable.c     | 1 -
 arch/powerpc/mm/pgtable-frag.c         | 2 --
 arch/s390/include/asm/pgalloc.h        | 4 ----
 arch/sparc/mm/init_64.c                | 1 -
 arch/x86/mm/pgtable.c                  | 1 -
 7 files changed, 11 deletions(-)

diff --git a/arch/m68k/include/asm/mcf_pgalloc.h b/arch/m68k/include/asm/mcf_pgalloc.h
index 27c3b91ac0b8..f607d239ce16 100644
--- a/arch/m68k/include/asm/mcf_pgalloc.h
+++ b/arch/m68k/include/asm/mcf_pgalloc.h
@@ -62,7 +62,6 @@ static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(pgtable);
 
-	pagetable_dtor(ptdesc);
 	pagetable_free(ptdesc);
 }
 
diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
index 2fe787e6c2dc..36ce18e625cc 100644
--- a/arch/powerpc/mm/book3s64/mmu_context.c
+++ b/arch/powerpc/mm/book3s64/mmu_context.c
@@ -249,7 +249,6 @@ static void pmd_frag_destroy(void *pmd_frag)
 	count = ((unsigned long)pmd_frag & ~PAGE_MASK) >> PMD_FRAG_SIZE_SHIFT;
 	/* We allow PTE_FRAG_NR fragments from a PTE page */
 	if (atomic_sub_and_test(PMD_FRAG_NR - count, &ptdesc->pt_frag_refcount)) {
-		pagetable_dtor(ptdesc);
 		pagetable_free(ptdesc);
 	}
 }
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 85ab6723c8f2..4ff471775f2d 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -450,7 +450,6 @@ void pmd_fragment_free(unsigned long *pmd)
 
 	BUG_ON(atomic_read(&ptdesc->pt_frag_refcount) <= 0);
 	if (atomic_dec_and_test(&ptdesc->pt_frag_refcount)) {
-		pagetable_dtor(ptdesc);
 		pagetable_free(ptdesc);
 	}
 }
diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
index ae742564a3d5..2568bb514181 100644
--- a/arch/powerpc/mm/pgtable-frag.c
+++ b/arch/powerpc/mm/pgtable-frag.c
@@ -26,7 +26,6 @@ void pte_frag_destroy(void *pte_frag)
 	/* We allow PTE_FRAG_NR fragments from a PTE page */
 	if (atomic_sub_and_test(PTE_FRAG_NR - count, &ptdesc->pt_frag_refcount)) {
 		folio_clear_active(ptdesc_folio(ptdesc));
-		pagetable_dtor(ptdesc);
 		pagetable_free(ptdesc);
 	}
 }
@@ -110,7 +109,6 @@ static void pte_free_now(struct rcu_head *head)
 	struct ptdesc *ptdesc;
 
 	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
-	pagetable_dtor(ptdesc);
 	pagetable_free(ptdesc);
 }
 
diff --git a/arch/s390/include/asm/pgalloc.h b/arch/s390/include/asm/pgalloc.h
index a5de9e61ea9e..d554c475c61f 100644
--- a/arch/s390/include/asm/pgalloc.h
+++ b/arch/s390/include/asm/pgalloc.h
@@ -66,7 +66,6 @@ static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
 	if (mm_p4d_folded(mm))
 		return;
 
-	pagetable_dtor(virt_to_ptdesc(p4d));
 	crst_table_free(mm, (unsigned long *) p4d);
 }
 
@@ -88,7 +87,6 @@ static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 	if (mm_pud_folded(mm))
 		return;
 
-	pagetable_dtor(virt_to_ptdesc(pud));
 	crst_table_free(mm, (unsigned long *) pud);
 }
 
@@ -111,7 +109,6 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 {
 	if (mm_pmd_folded(mm))
 		return;
-	pagetable_dtor(virt_to_ptdesc(pmd));
 	crst_table_free(mm, (unsigned long *) pmd);
 }
 
@@ -144,7 +141,6 @@ static inline pgd_t *pgd_alloc_noprof(struct mm_struct *mm)
 
 static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 {
-	pagetable_dtor(virt_to_ptdesc(pgd));
 	crst_table_free(mm, (unsigned long *) pgd);
 }
 
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 9bbccb5d23a8..9f3cb7883f3f 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2840,7 +2840,6 @@ static void __pte_free(pgtable_t pte)
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(pte);
 
-	pagetable_dtor(ptdesc);
 	pagetable_free(ptdesc);
 }
 
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 81b3bb9a197a..9929d7d55d72 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -156,7 +156,6 @@ static void free_pmds(struct mm_struct *mm, pmd_t *pmds[], int count)
 		if (pmds[i]) {
 			ptdesc = virt_to_ptdesc(pmds[i]);
 
-			pagetable_dtor(ptdesc);
 			pagetable_free(ptdesc);
 			mm_dec_nr_pmds(mm);
 		}
-- 
2.54.0

