Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509532E2EF2
	for <linux-m68k@lists.linux-m68k.org>; Fri,  2 Jan 2026 07:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767337427; cv=none; b=c6l2JCahoJ2ZcbUUCYIQz2X2vS4BD/5IYzSR8zNrQG2mTDw1Tx95+BjnY0LxqzHzm91SyH+IBEtFzhD+XBSxqcowq6h9zoP2jDngf7bF5chAVhRPe0eE8VSgjelcUAgl6z7vFLvvIBiRXhb9FeLdC9YfB21Od7ON9rtlrhXuhUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767337427; c=relaxed/simple;
	bh=7cRQHQcJTxCSxc9tvl2G7dMvx0rutizHF89BihPwSeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YI9IMFXmYVzgqYHwqIK6qlr7MjLiJI/qB36rh/4NCF/s81MkiuDjHbunu6+fJ0UW7LAjVvl/bblC6HGfIRkn3BkrpO4QoJ/Zo+gzx9rFbeFRcMz3Zntcm3eV/J1afbp+iTifEUcYR6+2+AhcBL8gpNtvFP8tUNzvZn0TjZqsWgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXMa09yB; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXMa09yB"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D8AE543386;
	Fri,  2 Jan 2026 07:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC80EC116B1;
	Fri,  2 Jan 2026 07:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767337425;
	bh=7cRQHQcJTxCSxc9tvl2G7dMvx0rutizHF89BihPwSeg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WXMa09yBg0tSjYHq9f9IeN1blNFAUX5LPbmAcZXTIcLFIhw3wDjAOleJmx/F17HYv
	 DR/XhO43ZicM0ZzN/IylLOlc6TIvzzYw30yLyImZYlnIZOkfgkXLPeKS3KmqjXhef6
	 7Xqozq3RTQUIwv95IOKdrcgqsq7QTcmppbXQJr2NFgNTpEMaAaxVrHTWJemz62cI0e
	 EI+nC09iXbdxet8WSVPNLPNmYPWpC8MthdMNGYVSvRQn8uLJUVipftJdPEOnMLgFJC
	 Ffthwjks+FE6Yu/bSgN4+CtYSegAgdS1XujRR8oHw2GikpOK4R9aMTfMNz2zM8aM6W
	 fysQUznA4UdgQ==
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
Subject: [PATCH v2 14/28] powerpc: introduce arch_zone_limits_init()
Date: Fri,  2 Jan 2026 08:59:50 +0200
Message-ID: <20260102070005.65328-15-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102070005.65328-1-rppt@kernel.org>
References: <20260102070005.65328-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Move calculations of zone limits to a dedicated arch_zone_limits_init()
function.

Later MM core will use this function as an architecture specific callback
during nodes and zones initialization and thus there won't be a need to
call free_area_init() from every architecture.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/powerpc/mm/mem.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 3ddbfdbfa941..32c496bfab4f 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -221,13 +221,23 @@ static int __init mark_nonram_nosave(void)
  * anyway) will take a first dip into ZONE_NORMAL and get otherwise served by
  * ZONE_DMA.
  */
-static unsigned long max_zone_pfns[MAX_NR_ZONES];
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
+{
+#ifdef CONFIG_ZONE_DMA
+	max_zone_pfns[ZONE_DMA]	= min(zone_dma_limit, max_low_pfn - 1) + 1;
+#endif
+	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
+#ifdef CONFIG_HIGHMEM
+	max_zone_pfns[ZONE_HIGHMEM] = max_pfn;
+#endif
+}
 
 /*
  * paging_init() sets up the page tables - in fact we've already done this.
  */
 void __init paging_init(void)
 {
+	unsigned long max_zone_pfns[MAX_NR_ZONES];
 	unsigned long long total_ram = memblock_phys_mem_size();
 	phys_addr_t top_of_ram = memblock_end_of_DRAM();
 	int zone_dma_bits;
@@ -259,15 +269,7 @@ void __init paging_init(void)
 
 	zone_dma_limit = DMA_BIT_MASK(zone_dma_bits);
 
-#ifdef CONFIG_ZONE_DMA
-	max_zone_pfns[ZONE_DMA]	= min(max_low_pfn,
-				      1UL << (zone_dma_bits - PAGE_SHIFT));
-#endif
-	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
-#ifdef CONFIG_HIGHMEM
-	max_zone_pfns[ZONE_HIGHMEM] = max_pfn;
-#endif
-
+	arch_zone_limits_init(max_zone_pfns);
 	free_area_init(max_zone_pfns);
 
 	mark_nonram_nosave();
-- 
2.51.0

