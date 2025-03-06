Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FE026E153
	for <linux-m68k@lists.linux-m68k.org>; Thu,  6 Mar 2025 18:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741287147; cv=none; b=EOoLcnqmXRc5dd5FwWAzvNAIWpnuU4XXFAlPl3NuRkvfOdwNVOjUOkZOW7Q37/CjsdpJOyIeEzGfNcDcWujM4o1xrGjNoyvbViKPVNBOA/JmBuSFsUn1Ha0pHR8Kf61CCA9+Dks+ZVP3sPuy+J/+Ya3eezsQYxXgPqgL4pjrdcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741287147; c=relaxed/simple;
	bh=3f2PL8+tvQz4kqOX8BsTM2Qrh30qjoJp6oFsaw3/420=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eeYkaDD3a2Ep5bDWo3myJe+R69h9mtPSlVm45PvabzHDTxlNA2JvJpXBqyNaT4Y1lHWXJEYaxhXm2c7WvJwCendoh+KUIiJEoKRYQ64wjtSDVWfY1KtPo7S4rvLxMB/R9LLEvwXDwJGxzIEZlEACtfA1IEKkwJ3d/9Ob3EorTpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJgzrjTO; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJgzrjTO"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1905E5C18B4;
	Thu,  6 Mar 2025 18:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7DB2C4CEED;
	Thu,  6 Mar 2025 18:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741287144;
	bh=3f2PL8+tvQz4kqOX8BsTM2Qrh30qjoJp6oFsaw3/420=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FJgzrjTO4LydJP8HiTJaetkeA9l5AEBKpAM8oOldJjnfSIsNdxHDVWTJYA8ZW+ytA
	 Gf6Qv2JH04v1Wv5MZqueKxNSDjn1bvxaES2Ur7agOMyA+oM/cLmVu4Wp52ZWKRFePe
	 sZyd0sVUs0txtZvPxmVDHQsORFcZRvNQnvfx4g/W2wHxnoZ7VhRd//aSxKK7XJStTy
	 sdd79C0Ssrv//n3N6cBDLeTrdB9KhSWEEtBzpAV84qCSM/2NMoenGBapXQxwZet7HJ
	 ldS9H0hKMEZgcYfgJnMdk4vJpeeALhqApfWyBsF4pj+idRDR4fcjmG4H92j5rE85ME
	 PX/YLB7CaLEzw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH 03/13] hexagon: move initialization of init_mm.context init to paging_init()
Date: Thu,  6 Mar 2025 20:51:13 +0200
Message-ID: <20250306185124.3147510-4-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250306185124.3147510-1-rppt@kernel.org>
References: <20250306185124.3147510-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

This will help with pulling out memblock_free_all() to the generic
code and reducing code duplication in arch::mem_init().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/hexagon/mm/init.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/hexagon/mm/init.c b/arch/hexagon/mm/init.c
index 3458f39ca2ac..508bb6a8dcc9 100644
--- a/arch/hexagon/mm/init.c
+++ b/arch/hexagon/mm/init.c
@@ -59,14 +59,6 @@ void __init mem_init(void)
 	 *  To-Do:  someone somewhere should wipe out the bootmem map
 	 *  after we're done?
 	 */
-
-	/*
-	 * This can be moved to some more virtual-memory-specific
-	 * initialization hook at some point.  Set the init_mm
-	 * descriptors "context" value to point to the initial
-	 * kernel segment table's physical address.
-	 */
-	init_mm.context.ptbase = __pa(init_mm.pgd);
 }
 
 void sync_icache_dcache(pte_t pte)
@@ -103,6 +95,12 @@ static void __init paging_init(void)
 
 	free_area_init(max_zone_pfn);  /*  sets up the zonelists and mem_map  */
 
+	/*
+	 * Set the init_mm descriptors "context" value to point to the
+	 * initial kernel segment table's physical address.
+	 */
+	init_mm.context.ptbase = __pa(init_mm.pgd);
+
 	/*
 	 * Start of high memory area.  Will probably need something more
 	 * fancy if we...  get more fancy.
-- 
2.47.2

