Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54EB286893
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754325861; cv=none; b=CeqpukLYn/nQpoNYmTBsRDp1H0lrTlGxN1p7FAjA8ktVjUcXzJXf4ZTqiQMAA1hUhkcPYX5xBPViNLdhaezIhYDXhii+RRHJ8SZZ8H3OaFN9iJCRQAlRnWBzjvDa9SHU/KGAW/tunyGYI4Hn2hJgKQOigdfyMeJgKUN6xQ44ag4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754325861; c=relaxed/simple;
	bh=adGs1kuuk4zPQI9OS9eVOvJux65kSL76tPiJyL+ncj8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BMopHnnv3xIYWzpfzGywIz7H3FRMAWnxvN5QDYypkivL5h1Q5Rp5lccL0lIReyVtEEp0wFVrFdFnfoMmJinCBHdCLO5f42X1p+aQEtYySsfZhmRiUzrA48J4Ogi70Hiz7dg6+2xxoRWU/y3OEvOILHaA9z20NcVU9zKKzF0G+4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNX2f+uk; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNX2f+uk"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F16845DAE;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E879C4CEFF;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=adGs1kuuk4zPQI9OS9eVOvJux65kSL76tPiJyL+ncj8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZNX2f+ukbjZ1j6eu9fz/+prTtT0vGsnjndcPXpFpG7P0Ia1Ril8Zf05ioP7FLpyo+
	 Mm2+aQHENVj0SHKpUPkPNDfgX5KBmrxkUcMnELWwkSRO5YI2iFCS8V36kFAf3sXzwz
	 zIvsdeC0pDzY9IKgCqH+xjQqPw2s+/XGMq9xJey9eoC5Sun/SfxY85adcWU/9qVD5I
	 Eh9+V8XR+/ZCwx0FSYMbTtEWnpevQ2WhcEQ/mvJoIbxn3Y2oVc+jESY8sptZ+6Y1E7
	 hXKnvnLGQgbuK3ouTYEW2vnpMJujCrVf4XcvM08Nb1q67D1mup4HnPed6XG6GGawWY
	 izdWDqT9JS+RA==
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
Subject: [PATCH 04/17] x86: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:00 -0700
Message-Id: <20250804164417.1612371-4-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804163910.work.929-kees@kernel.org>
References: <20250804163910.work.929-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3280; i=kees@kernel.org; h=from:subject; bh=adGs1kuuk4zPQI9OS9eVOvJux65kSL76tPiJyL+ncj8=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkdcn9HKVsXGsIr7AKdfgqSU+aeIrz0tzpYr9wkum fXBvsyko5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgF4CbnMTJ099c09f3590OhLee3 kxnL/7s7bxwLjPFLUap6/mJdAGsII8MONcmt6pUnOeTOCVhKzbgjGJmr7T41n6lg2nSB8PZMR24 A
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

Add missing __attribute_const__ annotations to x86's implementations of
variable__ffs(), variable_ffz(), __fls(), variable_ffs(), and fls() functions.
These are pure mathematical functions that always return the same result for the same
input with no side effects, making them eligible for compiler optimization.

Build tested ARCH=x86_64 defconfig with GCC gcc 14.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/x86/include/asm/bitops.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bitops.h
index eebbc8889e70..a835f891164d 100644
--- a/arch/x86/include/asm/bitops.h
+++ b/arch/x86/include/asm/bitops.h
@@ -246,7 +246,7 @@ arch_test_bit_acquire(unsigned long nr, const volatile unsigned long *addr)
 					  variable_test_bit(nr, addr);
 }
 
-static __always_inline unsigned long variable__ffs(unsigned long word)
+static __always_inline __attribute_const__ unsigned long variable__ffs(unsigned long word)
 {
 	asm("tzcnt %1,%0"
 		: "=r" (word)
@@ -265,7 +265,7 @@ static __always_inline unsigned long variable__ffs(unsigned long word)
 	 (unsigned long)__builtin_ctzl(word) :	\
 	 variable__ffs(word))
 
-static __always_inline unsigned long variable_ffz(unsigned long word)
+static __always_inline __attribute_const__ unsigned long variable_ffz(unsigned long word)
 {
 	return variable__ffs(~word);
 }
@@ -287,7 +287,7 @@ static __always_inline unsigned long variable_ffz(unsigned long word)
  *
  * Undefined if no set bit exists, so code should check against 0 first.
  */
-static __always_inline unsigned long __fls(unsigned long word)
+static __always_inline __attribute_const__ unsigned long __fls(unsigned long word)
 {
 	if (__builtin_constant_p(word))
 		return BITS_PER_LONG - 1 - __builtin_clzl(word);
@@ -301,7 +301,7 @@ static __always_inline unsigned long __fls(unsigned long word)
 #undef ADDR
 
 #ifdef __KERNEL__
-static __always_inline int variable_ffs(int x)
+static __always_inline __attribute_const__ int variable_ffs(int x)
 {
 	int r;
 
@@ -355,7 +355,7 @@ static __always_inline int variable_ffs(int x)
  * set bit if value is nonzero. The last (most significant) bit is
  * at position 32.
  */
-static __always_inline int fls(unsigned int x)
+static __always_inline __attribute_const__ int fls(unsigned int x)
 {
 	int r;
 
@@ -400,7 +400,7 @@ static __always_inline int fls(unsigned int x)
  * at position 64.
  */
 #ifdef CONFIG_X86_64
-static __always_inline int fls64(__u64 x)
+static __always_inline __attribute_const__ int fls64(__u64 x)
 {
 	int bitpos = -1;
 
-- 
2.34.1

