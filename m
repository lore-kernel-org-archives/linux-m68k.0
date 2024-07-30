Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A9D19146C
	for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Jul 2024 07:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722324241; cv=none; b=TdGaqKoK49KjbGJsQyznOVp0+YZ4wWxOdgF/mbDKCElgtciHfSr+EBV2IdEIPO9ZmF4xAt8LlwUNHcWxDDY9I8YiTRhz93pa+s3IUug4xpX6p9Zow/3dZ60QfKw3l0xrsNep5dN/aTRbQG4hz1DNBh5jrlvlawe7I3+VKRvFuEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722324241; c=relaxed/simple;
	bh=hohz5++xhGxNDKVPZKJqUhh7A1cYUT79OYxYo7u11yY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCSPG+OZKbVr3dGfi0LQlWi87ATWVhry/Mb2YfouTvTFaclxFIDZz8EQ3thyXB4vq4DjFFNtJhbzb305sfthed+izJ6LAk0/qg/EEFsL8KReRyxYCma5BLw70yZDoDKWQpGqpmip9pf29BEpcBkeRcTQPqdukTjItwOHqZnA+E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Umdw1n/4; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Umdw1n/4"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EE2E161E00;
	Tue, 30 Jul 2024 07:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0D5C4AF0F;
	Tue, 30 Jul 2024 07:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722324238;
	bh=hohz5++xhGxNDKVPZKJqUhh7A1cYUT79OYxYo7u11yY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Umdw1n/4ZRW6vj4XY31OqgNYPiPhAbZlbgkm463jfeKHwogT02Y63bxfSFWNs6V7i
	 IbJVXhKCJIDwUUeMqi8R0XrMXUHiugWfyCxKZqI770IZLjiuICkEJnn+DmK0S0wtXg
	 wUCiuEnqytXfwcqqtWz5fOkHF+luguzZyWaFMoJ4rhle5cDdQdyE5uQaHGo1ueEOcb
	 h/0PAa/PMRqHVn0XqkQbLbFosheXAJ2bz8RLIDCtPfwms57k82sGo6pfGja5YC1oQa
	 kpLBBVhBZpJMpUdVnsCBJv3mecb+/z0M1D++yUjl5E3rrcM36nTFGIo1ZUq4uLWm+B
	 aAD8huEqWxnFw==
From: alexs@kernel.org
To: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Brian Cain <bcain@quicinc.com>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Bibo Mao <maobibo@loongson.cn>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Vishal Moola <vishal.moola@gmail.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Lance Yang <ioworker0@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Barry Song <baohua@kernel.org>,
	linux-s390@vger.kernel.org
Cc: Guo Ren <guoren@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mike Rapoport <rppt@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Hugh Dickins <hughd@google.com>,
	David Hildenbrand <david@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Alex Shi <alexs@kernel.org>,
	"Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
	linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [RFC PATCH 17/18] mm: convert vmf.prealloc_pte to struct ptdesc pointer
Date: Tue, 30 Jul 2024 15:27:18 +0800
Message-ID: <20240730072719.3715016-7-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730072719.3715016-1-alexs@kernel.org>
References: <20240730064712.3714387-1-alexs@kernel.org>
 <20240730072719.3715016-1-alexs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alex Shi <alexs@kernel.org>

vmfs.prealloc_pte is a pointer to page table memory, so converter it to
struct ptdesc pointer.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: Matthew Wilcox  <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 include/linux/mm.h |  2 +-
 mm/filemap.c       |  2 +-
 mm/memory.c        | 12 ++++++------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7424f964dff3..749d6dd311fa 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -567,7 +567,7 @@ struct vm_fault {
 					 * Protects pte page table if 'pte'
 					 * is not NULL, otherwise pmd.
 					 */
-	pgtable_t prealloc_pte;		/* Pre-allocated pte page table.
+	struct ptdesc *prealloc_pte;	/* Pre-allocated pte page table.
 					 * vm_ops->map_pages() sets up a page
 					 * table from atomic context.
 					 * do_fault_around() pre-allocates
diff --git a/mm/filemap.c b/mm/filemap.c
index 3708ef71182e..d62150418b91 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3453,7 +3453,7 @@ static bool filemap_map_pmd(struct vm_fault *vmf, struct folio *folio,
 	}
 
 	if (pmd_none(*vmf->pmd) && vmf->prealloc_pte)
-		pmd_install(mm, vmf->pmd, (struct ptdesc **)&vmf->prealloc_pte);
+		pmd_install(mm, vmf->pmd, &vmf->prealloc_pte);
 
 	return false;
 }
diff --git a/mm/memory.c b/mm/memory.c
index 79685600d23f..1a5fb17ab045 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4648,7 +4648,7 @@ static vm_fault_t __do_fault(struct vm_fault *vmf)
 	 *				# flush A, B to clear the writeback
 	 */
 	if (pmd_none(*vmf->pmd) && !vmf->prealloc_pte) {
-		vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vma->vm_mm));
+		vmf->prealloc_pte = pte_alloc_one(vma->vm_mm);
 		if (!vmf->prealloc_pte)
 			return VM_FAULT_OOM;
 	}
@@ -4687,7 +4687,7 @@ static void deposit_prealloc_pte(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 
-	pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, page_ptdesc(vmf->prealloc_pte));
+	pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, vmf->prealloc_pte);
 	/*
 	 * We are going to consume the prealloc table,
 	 * count that as nr_ptes.
@@ -4726,7 +4726,7 @@ vm_fault_t do_set_pmd(struct vm_fault *vmf, struct page *page)
 	 * related to pte entry. Use the preallocated table for that.
 	 */
 	if (arch_needs_pgtable_deposit() && !vmf->prealloc_pte) {
-		vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vma->vm_mm));
+		vmf->prealloc_pte = pte_alloc_one(vma->vm_mm);
 		if (!vmf->prealloc_pte)
 			return VM_FAULT_OOM;
 	}
@@ -4868,7 +4868,7 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
 		}
 
 		if (vmf->prealloc_pte)
-			pmd_install(vma->vm_mm, vmf->pmd, (struct ptdesc **)&vmf->prealloc_pte);
+			pmd_install(vma->vm_mm, vmf->pmd, &vmf->prealloc_pte);
 		else if (unlikely(pte_alloc(vma->vm_mm, vmf->pmd)))
 			return VM_FAULT_OOM;
 	}
@@ -5011,7 +5011,7 @@ static vm_fault_t do_fault_around(struct vm_fault *vmf)
 		      pte_off + vma_pages(vmf->vma) - vma_off) - 1;
 
 	if (pmd_none(*vmf->pmd)) {
-		vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vmf->vma->vm_mm));
+		vmf->prealloc_pte = pte_alloc_one(vmf->vma->vm_mm);
 		if (!vmf->prealloc_pte)
 			return VM_FAULT_OOM;
 	}
@@ -5197,7 +5197,7 @@ static vm_fault_t do_fault(struct vm_fault *vmf)
 
 	/* preallocated pagetable is unused: free it */
 	if (vmf->prealloc_pte) {
-		pte_free(vm_mm, page_ptdesc(vmf->prealloc_pte));
+		pte_free(vm_mm, vmf->prealloc_pte);
 		vmf->prealloc_pte = NULL;
 	}
 	return ret;
-- 
2.43.0

