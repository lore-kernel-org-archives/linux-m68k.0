Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB433002DD
	for <linux-m68k@lists.linux-m68k.org>; Sun, 28 Dec 2025 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766925976; cv=none; b=O1gEfQcvtllRTmNcjb/jmgc9/TkDs9x9Upq4SwHrvMirHI/yW0BkaXbSNv2rG6u/vF71Z+wgK/uc9Aq/VW5/GjDHGODcxHn1SiCUjd02D+7Sk4OFT1TyKunfmKUi4l/mPDlllqb3fhkDvMvne6UPjFN2iZnZ3OPNhlXi8yp7jqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766925976; c=relaxed/simple;
	bh=RZ/DiLSy5d6B26KkgahmhRPqqfwFfapSaWjdzs9zbh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m/Pl845l3Tjvi+xboIVyQC/0bVVd54pChJWgC/LaXZxBrI8aFD77RuOHesyV3HEhOai/FdGBbPLJMlTs1Xd1E2YoBpo+lRD4i7zPXrWzDkaQZveLPhJKkg9YiMHTUaldljPGtKYnzN+kOF0IDgZ3ShO85tJfWo28u0Bzg48XlC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HP+mA+BZ; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HP+mA+BZ"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 546DE43EBE;
	Sun, 28 Dec 2025 12:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19A2C4CEFB;
	Sun, 28 Dec 2025 12:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766925974;
	bh=RZ/DiLSy5d6B26KkgahmhRPqqfwFfapSaWjdzs9zbh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HP+mA+BZahH8JKqMnF569bvDW7aEOc3ZV2OzZ8CeJV0pYGatK4hGWAcTJZtJKMc1l
	 zQa5VLTkCrBWM5fbpERPbQ1eZnpBZhfcIVKsdvya2ruS9g4VKsLOvR4muWleMIXdla
	 N4/GhIBuMW0Jb4/krptZ6sXqeyLQQT0F8Ku6SldAUhjleZjmJZC7Jv3LxQ7CPEH24Z
	 z9gWkCFCTS/wqOBx+z47sRhJJDJM0wnI33NNyzKaPRXEoRxTuQveIyJMBXpW7feKtO
	 92D+nORg+iwZw37Q98hv9ae8aJIO4Z062T9I/ZK+PBtq9Bt9jycEry4Sf1W/NPPXcE
	 GjRe8TOVu5LkQ==
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
Subject: [PATCH 25/28] x86: don't reserve hugetlb memory in setup_arch()
Date: Sun, 28 Dec 2025 14:39:55 +0200
Message-ID: <20251228124001.3624742-26-rppt@kernel.org>
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

Commit 665eaf313314 ("x86/setup: call hugetlb_bootmem_alloc early")
added an early call to hugetlb_bootmem_alloc() to setup_arch() to allow
HVO style pre-initialization of vmemmap on x86.

With the ordering of hugetlb reservation vs memory map initiaization
sorted out in core MM this no longer needs to be an architecture specific
quirk.

Drop the call to hugetlb_bootmem_alloc() from x86::setup_arch().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/setup.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 1b2edd07a3e1..e2318fa9b1bb 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1191,7 +1191,6 @@ void __init setup_arch(char **cmdline_p)
 
 	if (boot_cpu_has(X86_FEATURE_GBPAGES)) {
 		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
-		hugetlb_bootmem_alloc();
 	}
 
 	/*
-- 
2.51.0

