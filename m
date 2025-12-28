Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1862FC007
	for <linux-m68k@lists.linux-m68k.org>; Sun, 28 Dec 2025 12:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766925962; cv=none; b=jqvQxRfumvICC/mXsuWhUyEHJvOem/aii/jwGe084vuxUE0qRlIT1mgsGCrXD6flXwMZKgmH9z2GcJWvaSVdQbYtP9OX4I160Tvsf/Ioi086zTKiUGHK3IzL2CpRlPzaNFlsLCKZ8YVC+MSdlJhKXWtpLPnejMHKv5kY6HcuYnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766925962; c=relaxed/simple;
	bh=zd5p0i2OlJkjqXnS1oV6Bjn1onLoj8/4tNSvugcI3Wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cz8QH20C+LBeIBwYRUrVJYB/JeonqaLeUN8av+LnO6s6enZguXPItK5PtB7ZW4tUKc9joLqV1JeruJsB5gK2UxZYgi3yOd8vbAWG6XZ7QzjsECLHvYnIGKW+Qiz19oP9Fj1vwyedGIwo7uWACYiSe4q0X0UrbExvzs1bn75LtTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sfjQZ4Ma; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sfjQZ4Ma"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 59337435FE;
	Sun, 28 Dec 2025 12:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37A8C19422;
	Sun, 28 Dec 2025 12:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766925960;
	bh=zd5p0i2OlJkjqXnS1oV6Bjn1onLoj8/4tNSvugcI3Wg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sfjQZ4MaJbYdgWueLdXcBmDVU38OdK56kgVm+DeDe8fqmqjt1fCb6ErJZO9P1rIEt
	 GRJeqLqBy0TlDwsKktTLsNK6umjRi12aUfepLg+2ZgTGR4HU1zTAT8cadFa1bbcPqk
	 Hq02jezoVzB3ovYJaouQxYn4EhXEyd4p42VaB8FalDOHjiuDHtBmE8SXFzsb3Qybvs
	 zT2EI02+yjpeL+u6PNj5jGcA5nKlMhyKwQknu5W+D7x1RuSUvncx+6LFSDf0i+7zI2
	 faRLXte7BWgSIT3A3h5I1dHTU7z2ib/JULlm1VMjgFv4M9KdIUcHy4u9xMyfE/W3EK
	 7OoAMM9Lvwh6Q==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org
Subject: [PATCH 24/28] mips: drop paging_init()
Date: Sun, 28 Dec 2025 14:39:54 +0200
Message-ID: <20251228124001.3624742-25-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251228124001.3624742-1-rppt@kernel.org>
References: <20251228124001.3624742-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

All three variants of paging_init() on MIPS are wrappers for
pagetable_init().

Instead of having three identical wrappers, call pagetable_init() directly
from setup_arch() and remove the unnecessary paging_init() functions.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/mips/include/asm/pgalloc.h  | 2 --
 arch/mips/include/asm/pgtable.h  | 2 +-
 arch/mips/kernel/setup.c         | 4 ++--
 arch/mips/loongson64/numa.c      | 5 -----
 arch/mips/mm/init.c              | 5 -----
 arch/mips/sgi-ip27/ip27-memory.c | 5 -----
 6 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index 7a04381efa0b..6efd4a58bf10 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -101,6 +101,4 @@ static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4d, pud_t *pud)
 
 #endif /* __PAGETABLE_PUD_FOLDED */
 
-extern void pagetable_init(void);
-
 #endif /* _ASM_PGALLOC_H */
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 9c06a612d33a..fa7b935f947c 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -56,7 +56,7 @@ extern unsigned long zero_page_mask;
 	(virt_to_page((void *)(empty_zero_page + (((unsigned long)(vaddr)) & zero_page_mask))))
 #define __HAVE_COLOR_ZERO_PAGE
 
-extern void paging_init(void);
+extern void pagetable_init(void);
 
 /*
  * Conversion functions: convert a page and protection to a page entry,
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index d36d89d01fa4..7622aad0f0b3 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -614,7 +614,7 @@ static void __init bootcmdline_init(void)
  * kernel but generic memory management system is still entirely uninitialized.
  *
  *  o bootmem_init()
- *  o paging_init()
+ *  o pagetable_init()
  *  o dma_contiguous_reserve()
  *
  * At this stage the bootmem allocator is ready to use.
@@ -778,7 +778,7 @@ void __init setup_arch(char **cmdline_p)
 	prefill_possible_map();
 
 	cpu_cache_init();
-	paging_init();
+	pagetable_init();
 
 	memblock_dump_all();
 
diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index 2cd95020df08..16ffb32cca50 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -160,11 +160,6 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
 	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
 }
 
-void __init paging_init(void)
-{
-	pagetable_init();
-}
-
 /* All PCI device belongs to logical Node-0 */
 int pcibus_to_node(struct pci_bus *bus)
 {
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index c479c42141c3..cd04200d0573 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -415,11 +415,6 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
 #endif
 }
 
-void __init paging_init(void)
-{
-	pagetable_init();
-}
-
 #ifdef CONFIG_64BIT
 static struct kcore_list kcore_kseg0;
 #endif
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index 082651facf4f..4317f5ae1fd1 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -410,8 +410,3 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
 {
 	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
 }
-
-void __init paging_init(void)
-{
-	pagetable_init();
-}
-- 
2.51.0

