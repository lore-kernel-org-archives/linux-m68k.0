Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72341FBC9E
	for <linux-m68k@lists.linux-m68k.org>; Sat, 15 Mar 2025 10:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742036375; cv=none; b=FRKVkaOuvK6ITD9QLr8PEsc0le+R8rD+p33tvVWywsYfcjA6hWUSwID2mTsEBEHoQQo8H5rgtnFAqYjeooMzfryLC1fjWc9nEhBaPtvjQLBW6JkHmf3bDbEwBDR6v+Esa08IOzPN6Sd2TW7ErppBknDDrObticK8/MFgHjDXkfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742036375; c=relaxed/simple;
	bh=/gsyKJhuoIen+vHsBslWnn/2C+BZeE5kQsZ8QckJoRI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BhjzJRDfUFApIzGrc1pGD6gAqD9yx5laU0cWiGtWTvtETPNWRc9rSy74Ig3pEu5KlahW12IlRC6Z0/K20ZCthsam6brRs39iOwmDEiRhn5zRy8uphh4usjmGCn39Cs+oG4gZw4R+XCzjeXVZQ69H6EGEyM4SvBiRi3uc89YHVZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+bdiqGN; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+bdiqGN"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3A48CA489D6;
	Sat, 15 Mar 2025 10:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94C1C4CEED;
	Sat, 15 Mar 2025 10:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742036372;
	bh=/gsyKJhuoIen+vHsBslWnn/2C+BZeE5kQsZ8QckJoRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V+bdiqGN8Z8XOKssQQKhRShJZpgdJU/nDmTn2ED0MtuKUnS5le08t96rPYxjBIW3W
	 EEjWDsWMb/VL49fo30BlNQ9aW1IqRkBdQPXhsa7JCcSJ1za3w9XXCKFqjVipuCYzSA
	 QLgWrS+9HVDy5DynWbyMvCZD/o2pd8i++ywdtQGNubkvh+FjQqVI8ogvKUmXVh8UIm
	 j5GRzafGvHy8Z9mU22LR87OV28V/hM7swqiMFSP+nmGB/4fJfA3M/nWf/b1J6du1xR
	 PTMFl0VGtXo0jf4htyqvc7URq4YGmmI/oIvLIHhSVmacjGt5VEU2RtCM8nbfnFi8Fx
	 tHb2HdNFzItjg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Julian Vetter <julian@outer-limits.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 3/6] parisc: stop using asm-generic/iomap.h
Date: Sat, 15 Mar 2025 11:59:04 +0100
Message-Id: <20250315105907.1275012-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250315105907.1275012-1-arnd@kernel.org>
References: <20250315105907.1275012-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

parisc uses custom iomap helpers to map bus specific function calls into
a linear __iomem token, but it tries to use the declarations from the x86
"generic iomap" code.

Untangle the two by duplicating the required declations and dropping
the #include that pulls in more stuff that is not needed here, to
allow simplify the generic version later.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/parisc/include/asm/io.h | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/arch/parisc/include/asm/io.h b/arch/parisc/include/asm/io.h
index 3143cf29ce27..59d85d2386bb 100644
--- a/arch/parisc/include/asm/io.h
+++ b/arch/parisc/include/asm/io.h
@@ -227,36 +227,54 @@ extern void outsl (unsigned long port, const void *src, unsigned long count);
 #define F_EXTEND(x) ((unsigned long)((x) | (0xffffffff00000000ULL)))
 
 #ifdef CONFIG_64BIT
-#define ioread64 ioread64
-#define ioread64be ioread64be
-#define iowrite64 iowrite64
-#define iowrite64be iowrite64be
 extern u64 ioread64(const void __iomem *addr);
 extern u64 ioread64be(const void __iomem *addr);
+#define ioread64 ioread64
+#define ioread64be ioread64be
+
 extern void iowrite64(u64 val, void __iomem *addr);
 extern void iowrite64be(u64 val, void __iomem *addr);
+#define iowrite64 iowrite64
+#define iowrite64be iowrite64be
 #endif
 
-#include <asm-generic/iomap.h>
-/*
- * These get provided from <asm-generic/iomap.h> since parisc does not
- * select GENERIC_IOMAP.
- */
+extern void __iomem *ioport_map(unsigned long port, unsigned int nr);
+extern void ioport_unmap(void __iomem *);
 #define ioport_map ioport_map
 #define ioport_unmap ioport_unmap
+
+extern unsigned int ioread8(const void __iomem *);
+extern unsigned int ioread16(const void __iomem *);
+extern unsigned int ioread16be(const void __iomem *);
+extern unsigned int ioread32(const void __iomem *);
+extern unsigned int ioread32be(const void __iomem *);
 #define ioread8 ioread8
 #define ioread16 ioread16
 #define ioread32 ioread32
 #define ioread16be ioread16be
 #define ioread32be ioread32be
+
+extern void iowrite8(u8, void __iomem *);
+extern void iowrite16(u16, void __iomem *);
+extern void iowrite16be(u16, void __iomem *);
+extern void iowrite32(u32, void __iomem *);
+extern void iowrite32be(u32, void __iomem *);
 #define iowrite8 iowrite8
 #define iowrite16 iowrite16
 #define iowrite32 iowrite32
 #define iowrite16be iowrite16be
 #define iowrite32be iowrite32be
+
+extern void ioread8_rep(const void __iomem *port, void *buf, unsigned long count);
+extern void ioread16_rep(const void __iomem *port, void *buf, unsigned long count);
+extern void ioread32_rep(const void __iomem *port, void *buf, unsigned long count);
 #define ioread8_rep ioread8_rep
 #define ioread16_rep ioread16_rep
 #define ioread32_rep ioread32_rep
+
+extern void iowrite8_rep(void __iomem *port, const void *buf, unsigned long count);
+extern void iowrite16_rep(void __iomem *port, const void *buf, unsigned long count);
+extern void iowrite32_rep(void __iomem *port, const void *buf, unsigned long count);
 #define iowrite8_rep iowrite8_rep
 #define iowrite16_rep iowrite16_rep
 #define iowrite32_rep iowrite32_rep
-- 
2.39.5

