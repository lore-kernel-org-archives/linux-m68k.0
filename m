Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920302882C1
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Aug 2025 16:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754325862; cv=none; b=iONVJ21D3dL6Az2eG/Di6islDGrKH3rvOwWxDALtUCi98YfuUt1pNhaNd03emTewGdb/jI3mZiCmjNLtwpU2H89Fe6C77aYshksZTzlsBY5ltIbwCLFCmF7LTIwngO+YDF712fYBAk38XaDtWLgz9mo+gpaigDNM82ZdOcfW25E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754325862; c=relaxed/simple;
	bh=Blko/RG2lvaODf864DzTpEKxwCgrc6vWtsbWwn+kegM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cufDT7Wl1ZakPe6B9aOlIIMSFsrxDWbc7vZbszSduoXNKA0eXAh0okhVUAwRa//a9aOUJx4fhxlsWreOzom8nSgnB/vfDhUGhtPF3k9YLquL+jhi9CmQBGg+75aOTX2TSX5+oT25gMy7YTgln8mcKSr2ryU+txtynBJgB98cc30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKm7fStn; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKm7fStn"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A7235C5AEF;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38944C4CEFA;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=Blko/RG2lvaODf864DzTpEKxwCgrc6vWtsbWwn+kegM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RKm7fStnT2f/O9WTNiGO7vEnfTrtD2BjrdbvAqXYGVLzrvGMKRZpwNljrVdV5Yc7F
	 ms/UkNjaUp45VzaxYml1V2nd8lcIp45AXVOtEcUonr/GGOlwTuoYIbgkvoQhFG/wN6
	 WKZh/vtDzYFHTHdBEIoe7UUh+2ifIrTv4JkUwkgI3r31kXpv/+gCV57tdSm5RVB+/O
	 k/FFqo6u0bVzkLRl1/HE6qUBw2RV4HQjdVjWVDfm2DbICcjzwJ+2AIF2V6qq7UvY2s
	 1GPhzwrTFl0I2J3UaB6SO0WN6XerugMXmpU92vxpkjKRJ1CQhkGFuh0FEX4P7zr0Pl
	 YCvaKu3TYXMJw==
From: Kees Cook <kees@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 05/17] powerpc: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:01 -0700
Message-Id: <20250804164417.1612371-5-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804163910.work.929-kees@kernel.org>
References: <20250804163910.work.929-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894; i=kees@kernel.org; h=from:subject; bh=Blko/RG2lvaODf864DzTpEKxwCgrc6vWtsbWwn+kegM=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkf8q+aJtHjfkMxRZhbRVyTe91hepyc95ULUY4Nmo RcSm190lLIwiHExyIopsgTZuce5eLxtD3efqwgzh5UJZAgDF6cATOTwfUaGT12nXSZdEFMMv1jN WH1s+TYRodUWp2689y1ICF67snCjFiPDy4IrLHkZtyc8f2I0KUiD65L66soy16kWMewJ/B3xN0J 4AA==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

While tracking down a problem where constant expressions used by
BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
initializer was convincing the compiler that it couldn't track the state
of the prior statically initialized value. Tracing this down found that
ffs() was used in the initializer macro, but since it wasn't marked with
__attribute__const__, the compiler had to assume the function might
change variable states as a side-effect (which is not true for ffs(),
which provides deterministic math results).

Add missing __attribute_const__ annotations to PowerPC's implementations of
fls() function. These are pure mathematical functions that always return
the same result for the same input with no side effects, making them eligible
for compiler optimization.

Build tested ARCH=powerpc defconfig with GCC powerpc-linux-gnu 14.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/powerpc/include/asm/bitops.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/bitops.h b/arch/powerpc/include/asm/bitops.h
index 671ecc6711e3..0d0470cd5ac3 100644
--- a/arch/powerpc/include/asm/bitops.h
+++ b/arch/powerpc/include/asm/bitops.h
@@ -276,7 +276,7 @@ static inline void arch___clear_bit_unlock(int nr, volatile unsigned long *addr)
  * fls: find last (most-significant) bit set.
  * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
  */
-static __always_inline int fls(unsigned int x)
+static __always_inline __attribute_const__ int fls(unsigned int x)
 {
 	int lz;
 
@@ -294,7 +294,7 @@ static __always_inline int fls(unsigned int x)
  * 32-bit fls calls.
  */
 #ifdef CONFIG_PPC64
-static __always_inline int fls64(__u64 x)
+static __always_inline __attribute_const__ int fls64(__u64 x)
 {
 	int lz;
 
-- 
2.34.1

