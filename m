Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285EB18FC9A
	for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Jul 2024 06:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722321880; cv=none; b=o0IAY3bIio9ucqDUofAFMCaNQ6cJT2+Mfng3cAsOI9hfjoqGzUiS7Ql2JrEfY4b6PprdGwsOkbeflRBbBMtdkwmdewQyTtgUnDzATfwUjy28Og94RjUiyh4S6SJOdkWakK0qQzpUa1fk32i/hM/ar9Lx48OZd7Qd/BDE/A7uvtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722321880; c=relaxed/simple;
	bh=ccXL2chU8a/94eL1T1pI+a3Q5/w60GPmzE5TdAMCqlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WiNCgmhYQ0l5sudcOteF/wpPGCPrY2CPw/l3tiVQwy9ySBmNV5OqqlzZL/Cfq62PT6be15g1dNjGHRbMkVX6Aj+JH46H4GlfE0jgA84uNxETEnrToE3alYIBztZCL2wq008rqzRmZDO+jH6Kg32yYGF1RRA6hkdLMY4SqqOtS6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfAajOsY; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfAajOsY"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3F38ACE0E51;
	Tue, 30 Jul 2024 06:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939DCC4AF09;
	Tue, 30 Jul 2024 06:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722321875;
	bh=ccXL2chU8a/94eL1T1pI+a3Q5/w60GPmzE5TdAMCqlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mfAajOsY0bas1KjIZ7zbi0ly7eR8srfqY9/dGjSCEZBhCcX9YS6VakfWING1fsGF9
	 W0YCBavaz4bKXWCT+t6Yhfu/nqQvhZRU8uQ4308gV21op4ifIO73UuI1kTRWXnNtuQ
	 s5Z/K60Rw4yOKEM2lNhxjV21z9g0mIa7otDskKJSUtzhlDHiE0nSamwvKeBMBIax9v
	 uECArXHvXKdVLqGvan7uo4dKgcLJgys3j/9lFLYcEfUC1FUurphSmLjUuWStQ30LeH
	 mcqLnZdVd1vSIjm4Q5ofH7j6+1Ir6OhcZ/gLzfEGTM1DHna6l6J8fJTKaOJDBS/8EQ
	 RPhVDl0tGnBTA==
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
	Andrew Morton <akpm@linux-foundation.org>
Subject: [RFC PATCH 08/18] mm/memory: use ptdesc in __pte_alloc
Date: Tue, 30 Jul 2024 14:47:02 +0800
Message-ID: <20240730064712.3714387-9-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730064712.3714387-1-alexs@kernel.org>
References: <20240730064712.3714387-1-alexs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alex Shi <alexs@kernel.org>

Replace pgtable_t by ptdesc in function __pte_alloc.
We will remove pgtable_t from all place.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 mm/memory.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index b9f5cc0db3eb..5b01d94a0b5f 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -445,13 +445,13 @@ void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte)
 
 int __pte_alloc(struct mm_struct *mm, pmd_t *pmd)
 {
-	pgtable_t new = pte_alloc_one(mm);
-	if (!new)
+	struct ptdesc *ptdesc = page_ptdesc(pte_alloc_one(mm));
+	if (!ptdesc)
 		return -ENOMEM;
 
-	pmd_install(mm, pmd, &new);
-	if (new)
-		pte_free(mm, new);
+	pmd_install(mm, pmd, (pgtable_t *)&ptdesc);
+	if (ptdesc)
+		pte_free(mm, ptdesc_page(ptdesc));
 	return 0;
 }
 
-- 
2.43.0

