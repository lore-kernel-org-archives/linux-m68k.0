Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB535268699
	for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741873906; cv=none; b=MZ+/c3BagOUNcJHnySZNg7RO7vnPqOXNXm5J7Jha+Jg/x8GWUSCu1o2Ly82E/WuNDuLiJGpItNh+WjOSQ8O7U157aKJwrgZ+ZIAXDKIGhXhNAE6cjgtsHNrc+a7zIprVHbzsn21oY8k8QsIVzzDtJMa4H0Lw5o53jQyTHfVv0oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741873906; c=relaxed/simple;
	bh=uD5faVqJ7G6OTY8H5Svd8uEX7wWQ143lrl+QSf2xljc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQyfpOywiJ6LRQl25v209I4+tTZjUqgGBeY5AnIcu2FkWc68aAPelpp48Tu5CuGtrhIHH+CdmWf2x5pLZ5EA6NWNb8ofVOQNf2zb73F8q5PvN2Umuo2vMP/sjp13634M7cdO3WFuZr2yxNHRX7anZvzIrGzq7xAeQ6VkrbtF5m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tAvAkADl; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tAvAkADl"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C8BB0A474DA;
	Thu, 13 Mar 2025 13:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A398C4CEEA;
	Thu, 13 Mar 2025 13:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741873903;
	bh=uD5faVqJ7G6OTY8H5Svd8uEX7wWQ143lrl+QSf2xljc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tAvAkADl38NVbSZKILqjquMXN3H24XBk/B6I41lcVbP00o/57lseGod9pdeTReVMs
	 cGwlYVhuGgyWlrhDCI2daJ1ZuH+VeJ81cIRRK9frKmoiVueFr/N/mjUPeYtEx8wJ8T
	 nBs3CkwbMReqveisUvVZBC22mbfZgYYmTbCh29QOQKxl3NVOzvvN3jvxoRqmAwnVch
	 0ZqbY3ubQTUgmI2m+/Okv6ac4OZYKAK3inE5/1A+FzyXOEE0bOdUpCjBHuKjnqgp9K
	 6yHOo0+C4guHPMqoX35CH+VdOKq/D8Ff1oyIUB7Oo0RhP3dSOBxqfGBVfIxIiCRB+o
	 mLZqPSEOGfNGg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
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
	Mark Brown <broonie@kernel.org>,
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
Subject: [PATCH v2 06/13] nios2: move pr_debug() about memory start and end to setup_arch()
Date: Thu, 13 Mar 2025 15:49:56 +0200
Message-ID: <20250313135003.836600-7-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250313135003.836600-1-rppt@kernel.org>
References: <20250313135003.836600-1-rppt@kernel.org>
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
 arch/nios2/kernel/setup.c | 2 ++
 arch/nios2/mm/init.c      | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/nios2/kernel/setup.c b/arch/nios2/kernel/setup.c
index da122a5fa43b..a4cffbfc1399 100644
--- a/arch/nios2/kernel/setup.c
+++ b/arch/nios2/kernel/setup.c
@@ -149,6 +149,8 @@ void __init setup_arch(char **cmdline_p)
 	memory_start = memblock_start_of_DRAM();
 	memory_end = memblock_end_of_DRAM();
 
+	pr_debug("%s: start=%lx, end=%lx\n", __func__, memory_start, memory_end);
+
 	setup_initial_init_mm(_stext, _etext, _edata, _end);
 	init_task.thread.kregs = &fake_regs;
 
diff --git a/arch/nios2/mm/init.c b/arch/nios2/mm/init.c
index a2278485de19..aa692ad30044 100644
--- a/arch/nios2/mm/init.c
+++ b/arch/nios2/mm/init.c
@@ -65,8 +65,6 @@ void __init mem_init(void)
 	unsigned long end_mem   = memory_end; /* this must not include
 						kernel stack at top */
 
-	pr_debug("mem_init: start=%lx, end=%lx\n", memory_start, memory_end);
-
 	end_mem &= PAGE_MASK;
 	high_memory = __va(end_mem);
 
-- 
2.47.2

