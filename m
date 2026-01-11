Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697C7318149
	for <linux-m68k@lists.linux-m68k.org>; Sun, 11 Jan 2026 08:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768119771; cv=none; b=gpK9Q23BxqV7hnKwFddTnf2tmDfZlmsmnGWgmwN4o+WDzqlCbf8Fu5I+iupJlE01We61yT94us1umRP5UoBcGz+qKTS483uorTRV8YvfhxwywdFVRzyarwHdgW2x2pUFoOqNCUm2YV6pCdAKSXukhhKVxYYdlSplkSW88vWU6Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768119771; c=relaxed/simple;
	bh=djQarGwsnsMGImsgSQVJ5sD5jo+ZigjiDeQZakHIJZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KLY3gJ3yMrC2rxyIiRgkcaLym2UT5cmB3NsFpGEAUK3cAtpW4HxNnO9hmeomTgOBvIbAAvldER8VrYYczYc2v0l82PT5B1UoB3crzOnVLoZeJ5Q+Q28pBXhLWStlWZZ37CA9M6hELuOxeJWya+7Q6YLWoJmf3ecXwIZqduC9bv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lw1lU3Ew; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lw1lU3Ew"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5E5D60129;
	Sun, 11 Jan 2026 08:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA77CC16AAE;
	Sun, 11 Jan 2026 08:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768119759;
	bh=djQarGwsnsMGImsgSQVJ5sD5jo+ZigjiDeQZakHIJZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lw1lU3Ewc+dtv3vDYJfQvcR3SFOO3fNdQZbUcukOU8uBYk43EPjoMNLHvS+ZVTXFY
	 kFiAwsUS0cL97IqVcj9lfrxTQhOT2vwhsvZsYZ978UiUZIG/ymSeKzXUMCvGav2t3T
	 vM5MZTJCCtREKdgx/Ctorld3QmD4G38UlxAV/FKOUGToSqJ9W/z041Qg3ZqaKRg0C6
	 0pqyd0jXlvxFbMeJVINiPfxlP57E5VlMoy0DwyzLHcSHXAWp+XP+b3aDLtpYYqQcns
	 gv9MGzAi0TPrvCroxyxabPW1rlLFsb8P84S1OTpkxsCAf7ZizWZpxO+8YyP01fxPJX
	 jR8BRtnoVff+g==
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
	Klara Modin <klarasmodin@gmail.com>,
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
	Ritesh Harjani <ritesh.list@gmail.com>,
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
Subject: [PATCH v3 05/29] arm64: introduce arch_zone_limits_init()
Date: Sun, 11 Jan 2026 10:20:39 +0200
Message-ID: <20260111082105.290734-6-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111082105.290734-1-rppt@kernel.org>
References: <20260111082105.290734-1-rppt@kernel.org>
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

While on it rename zone_sizes_init() to dma_limits_init() to better
reflect what that function does.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/arm64/mm/init.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 524d34a0e921..06815d34cc11 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -118,7 +118,21 @@ static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
 	return min(zone_limit, memblock_end_of_DRAM() - 1) + 1;
 }
 
-static void __init zone_sizes_init(void)
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
+{
+	phys_addr_t __maybe_unused dma32_phys_limit =
+		max_zone_phys(DMA_BIT_MASK(32));
+
+#ifdef CONFIG_ZONE_DMA
+	max_zone_pfns[ZONE_DMA] = PFN_DOWN(max_zone_phys(zone_dma_limit));
+#endif
+#ifdef CONFIG_ZONE_DMA32
+	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(dma32_phys_limit);
+#endif
+	max_zone_pfns[ZONE_NORMAL] = max_pfn;
+}
+
+static void __init dma_limits_init(void)
 {
 	unsigned long max_zone_pfns[MAX_NR_ZONES]  = {0};
 	phys_addr_t __maybe_unused acpi_zone_dma_limit;
@@ -139,17 +153,15 @@ static void __init zone_sizes_init(void)
 	if (memblock_start_of_DRAM() < U32_MAX)
 		zone_dma_limit = min(zone_dma_limit, U32_MAX);
 	arm64_dma_phys_limit = max_zone_phys(zone_dma_limit);
-	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);
 #endif
 #ifdef CONFIG_ZONE_DMA32
-	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(dma32_phys_limit);
 	if (!arm64_dma_phys_limit)
 		arm64_dma_phys_limit = dma32_phys_limit;
 #endif
 	if (!arm64_dma_phys_limit)
 		arm64_dma_phys_limit = PHYS_MASK + 1;
-	max_zone_pfns[ZONE_NORMAL] = max_pfn;
 
+	arch_zone_limits_init(max_zone_pfns);
 	free_area_init(max_zone_pfns);
 }
 
@@ -319,7 +331,7 @@ void __init bootmem_init(void)
 	 * done after the fixed reservations
 	 */
 	sparse_init();
-	zone_sizes_init();
+	dma_limits_init();
 
 	/*
 	 * Reserve the CMA area after arm64_dma_phys_limit was initialised.
-- 
2.51.0

