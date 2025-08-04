Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982AF2882CB
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Aug 2025 16:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754325862; cv=none; b=JQ83UbomQqhk/hwF/tz9QjdEieaUnyYibnXj7ftnFbhn+rFw1DNMBjf1++QWLQglGHs0F6ndZ9voq3pJntMOF3MChh+Ue0HxHiYH6OZOd+kaAO/tKBi9wge1rDrPAozFQbCdvtitfKCaEER+mRyhlde+IBUDZ9Ox8i6xMg1+RV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754325862; c=relaxed/simple;
	bh=g9NWGXns36jX28IL85SFtHFGu7oIjU0Ua5dSHJdI5kc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cdMYP/zF80lxVdlCfwBqhIUdUnLDLv0sYJdSJSJtBLjZUhj98/8AcqbK0CdN4dYbPUXBptE5pqvuDbN1Qp4trxkEmpp83ZZpa+azPYeQH1p+zK67snqmUzfhdsF95jrLPCyOPns8HhJvfYbnQ/zCkJYxsFjLpBU3vov1q/WRMeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0wr+SOQ; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0wr+SOQ"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B0C40A55A54;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B7BC4AF0C;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=g9NWGXns36jX28IL85SFtHFGu7oIjU0Ua5dSHJdI5kc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o0wr+SOQrJ8Pb1HYn23m4nYGmmpz1RDCR0ieEPGyaoZStf9uxSKkOeJ+ht08w8Btg
	 Mk16Oj5DcqMKz/MiKi8tHWrMk13bxl6FmvWQLkLC9rcpfJZE6u8Pgf6DcugDDacw/n
	 Gt1m4MotOXAbpwe1NUuHL8wW+JPWgcHeXq2UruCVO8Nxp4xDsYHY6mP6CA6UJep8Gi
	 4v4XsgZvc5nHH0fLusjDc2D7xmP4pPA5nbCjn3spw2vXn4Kuax1rC1vilgHcaGL1u5
	 +BXbkvga5yhWQsopUPn8srq6zLvG798XxT0hdKDu652cFd9q5dF1ACGM650jF2MJx2
	 QaBmx5wtzTV7A==
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
Subject: [PATCH 09/17] riscv: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:05 -0700
Message-Id: <20250804164417.1612371-9-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804163910.work.929-kees@kernel.org>
References: <20250804163910.work.929-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467; i=kees@kernel.org; h=from:subject; bh=g9NWGXns36jX28IL85SFtHFGu7oIjU0Ua5dSHJdI5kc=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkemZM9qPHqPbYffitvpiduXcnN//Wz59H7Src5ro iuN53c7dZSyMIhxMciKKbIE2bnHuXi8bQ93n6sIM4eVCWQIAxenAEzk8wJGhkbFJarr3qZFnVMK ivFlq+MtkmgR9Xud8jxCoklDa6WcBcNf2d0LPUQOnJ4w6cfNbUl3P7lbnX7u8W9y56Vbs2y2ORi cYgEA
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

Add missing __attribute_const__ annotations to RISC-V's implementations of
variable__ffs(), variable__fls(), and variable_ffs() functions. These are pure
mathematical functions that always return the same result for the same
input with no side effects, making them eligible for compiler optimization.

Build tested ARCH=riscv defconfig with GCC riscv64-linux-gnu 14.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/riscv/include/asm/bitops.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index d59310f74c2b..77880677b06e 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -45,7 +45,7 @@
 #error "Unexpected BITS_PER_LONG"
 #endif
 
-static __always_inline unsigned long variable__ffs(unsigned long word)
+static __always_inline __attribute_const__ unsigned long variable__ffs(unsigned long word)
 {
 	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
 				      RISCV_ISA_EXT_ZBB, 1)
@@ -74,7 +74,7 @@ static __always_inline unsigned long variable__ffs(unsigned long word)
 	 (unsigned long)__builtin_ctzl(word) :	\
 	 variable__ffs(word))
 
-static __always_inline unsigned long variable__fls(unsigned long word)
+static __always_inline __attribute_const__ unsigned long variable__fls(unsigned long word)
 {
 	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
 				      RISCV_ISA_EXT_ZBB, 1)
@@ -103,7 +103,7 @@ static __always_inline unsigned long variable__fls(unsigned long word)
 	 (unsigned long)(BITS_PER_LONG - 1 - __builtin_clzl(word)) :	\
 	 variable__fls(word))
 
-static __always_inline int variable_ffs(int x)
+static __always_inline __attribute_const__ int variable_ffs(int x)
 {
 	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
 				      RISCV_ISA_EXT_ZBB, 1)
-- 
2.34.1

