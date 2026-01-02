Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B9F2ECE9B
	for <linux-m68k@lists.linux-m68k.org>; Fri,  2 Jan 2026 07:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767337529; cv=none; b=DB/hY7/KsE/g8t2MGf91SB0kdHD6QHbMDI0RSHDvj2cWsScBVl2/Y8ihdMXFFAaRDSh4qL+aLa22ufvV6ooLrfaw0LMlnp2De9G6+2sGdDJBAz4RBdbTXYM1IuFMXwrD6TcdzNz2AFpcDj3CPznS57OvXPH0AlsBv3ZS7t5Zq/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767337529; c=relaxed/simple;
	bh=RfrVgNIj9rxp9R6SGMWNq/5X+PJ8wzbzZyqbje0LIeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwElxBAgzWmTYD0/6ORj0dpjB/QucJL5625hH+NK4IiWhdEr83++qMuezJZGuEPzWQOfLW+eb06uhh5LF3sQ9oB4BsK8tp7iOxXESLy04DrqFhbk6N+HtqidgGoTl2+o6r8MJbr5jZZFm4KqKx3tAG6o73jkk/hxlMYxsQBWRSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aVMy1uEj; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aVMy1uEj"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ADAAB436EC;
	Fri,  2 Jan 2026 07:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A822AC19421;
	Fri,  2 Jan 2026 07:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767337526;
	bh=RfrVgNIj9rxp9R6SGMWNq/5X+PJ8wzbzZyqbje0LIeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aVMy1uEjz+i8JVR5vvetsdLlgetPkDBi4pcNoZ4vjSKDBc19eAiwfNmFLk+7mga3L
	 CoRj28PGPQFLtYhjpAFGOpcJutt4IEAphYnmmrXUanPJV/sEjuRaYp5ErdlMYFMwBa
	 y7Tx3dNUc/RzrtMBd/C++WHUWIgC4F/tyXDOwS85cAPJvO+XvNSexJlAVbEAIac8yK
	 7B8AnG2S4pCOhihUnC0FMc3yT8kq9pvWxyPULUe8cP34d112OYpiJ6uofrGOoed7ZQ
	 J3GRwa/R04BfG9D1qMTYLWoomnB7hJ4FZjufi3DB/KiokHvaSbus/icytAHD/NLK2p
	 CLxFTDSXhTUeA==
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
Subject: [PATCH v2 21/28] xtensa: introduce arch_zone_limits_init()
Date: Fri,  2 Jan 2026 08:59:57 +0200
Message-ID: <20260102070005.65328-22-rppt@kernel.org>
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
 arch/xtensa/mm/init.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/xtensa/mm/init.c b/arch/xtensa/mm/init.c
index cc52733a0649..60299f359a3c 100644
--- a/arch/xtensa/mm/init.c
+++ b/arch/xtensa/mm/init.c
@@ -116,15 +116,19 @@ static void __init print_vm_layout(void)
 		(unsigned long)(__bss_stop - __bss_start) >> 10);
 }
 
-void __init zones_init(void)
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
 {
-	/* All pages are DMA-able, so we put them all in the DMA zone. */
-	unsigned long max_zone_pfn[MAX_NR_ZONES] = {
-		[ZONE_NORMAL] = max_low_pfn,
+	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
 #ifdef CONFIG_HIGHMEM
-		[ZONE_HIGHMEM] = max_pfn,
+	max_zone_pfns[ZONE_HIGHMEM] = max_pfn;
 #endif
-	};
+}
+
+void __init zones_init(void)
+{
+	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0, };
+
+	arch_zone_limits_init(max_zone_pfn);
 	free_area_init(max_zone_pfn);
 	print_vm_layout();
 }
-- 
2.51.0

