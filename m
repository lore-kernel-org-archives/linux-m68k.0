Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D08C28934E
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Aug 2025 16:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754325863; cv=none; b=tE9FzVxFDkudW0BFyppwQu4djfmoDeIWIawnaXNAWt2tT4HwdrRBCiONUg6KAygzpRWR2t2EWmIf/FDltCbMD/T1dv4QEKstiJ8ii6UrxM9fnF6Ew3cV/POjhmM5xb5je8fW9/G5IClkU82dWdIsoDLLLMmoA6pqQS6XVYO2b7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754325863; c=relaxed/simple;
	bh=nGrvLP+52DqmCHeke8Z62fxml8VqaHAPq3pxBvDMhbA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nS15+Nrjt031hxdny2W9fHr2szyrDD3ppVwPzCPkM3xpMTy5oGdpuyOO7gZQkbhgIWibq9kOMFxms927SfjD+GtUFAgM7wLIn70fiW7N8ElOE7SJqBsvRJLj864wS0FXyWQrw1497q3tXd95e+ZkofN18YfpUBSAyUSX5qsOnrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ge6UnzC7; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ge6UnzC7"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CF5A45E8F;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633B5C113D0;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=nGrvLP+52DqmCHeke8Z62fxml8VqaHAPq3pxBvDMhbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ge6UnzC7RCLcQnB7l193lH28keaIzGG1YTTZUZMK4Velt+wX4iI+WLWhEq0f25glZ
	 EPQLcMekI7Qvor+gIO2PqW0/4OjdTkyLrHQ5EPHMRDAjBoA2HTeFoRsl6GXh/qJLgj
	 MF69H6fg2iDs2LL0gkx86SD4N/8EocNjtjMQgdHiqj44NY5Vqw8hA1wJB61jHXHHZm
	 v7W+8ZuG2nchNWjSRwa024Wv2ZapjnQQXpX6J88aI+CFwRDSUXs6ltLrZGcmXmcDWo
	 nS5iD0eGBf/ejiqGM9Qvn3UKnMrG6ib6iJFT4D42SgAa35HMf3R2+MzKIuOWsemar9
	 YnJC/kBSRhIUg==
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
Subject: [PATCH 13/17] parisc: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:09 -0700
Message-Id: <20250804164417.1612371-13-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804163910.work.929-kees@kernel.org>
References: <20250804163910.work.929-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2252; i=kees@kernel.org; h=from:subject; bh=nGrvLP+52DqmCHeke8Z62fxml8VqaHAPq3pxBvDMhbA=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkef/nFELezMN7cjNvMWx9sJHzw1i22t5cePF+sdU /Nld6080lHKwiDGxSArpsgSZOce5+Lxtj3cfa4izBxWJpAhDFycAjARL1mG/37Hr0ifUD5qKhpw fXet6D0J8bNfnog1bb1+l1/U9sh+7yBGhhm3b15IzvrjxfGP78CVyJl/F691fSu1dqHll4/JXsq 5jVwA
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

Add missing __attribute_const__ annotations to PARISC's implementations of
ffs(), __ffs(), and fls() functions. These are pure mathematical functions
that always return the same result for the same input with no side effects,
making them eligible for compiler optimization.

Build tested ARCH=parisc defconfig with GCC hppa-linux-gnu 14.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/parisc/include/asm/bitops.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/include/asm/bitops.h b/arch/parisc/include/asm/bitops.h
index 0ec9cfc5131f..bd1280a8a5ec 100644
--- a/arch/parisc/include/asm/bitops.h
+++ b/arch/parisc/include/asm/bitops.h
@@ -123,7 +123,7 @@ static __inline__ int test_and_change_bit(int nr, volatile unsigned long * addr)
  * cycles for each mispredicted branch.
  */
 
-static __inline__ unsigned long __ffs(unsigned long x)
+static __inline__ __attribute_const__ unsigned long __ffs(unsigned long x)
 {
 	unsigned long ret;
 
@@ -161,7 +161,7 @@ static __inline__ unsigned long __ffs(unsigned long x)
  * This is defined the same way as the libc and compiler builtin
  * ffs routines, therefore differs in spirit from the above ffz (man ffs).
  */
-static __inline__ int ffs(int x)
+static __inline__ __attribute_const__ int ffs(int x)
 {
 	return x ? (__ffs((unsigned long)x) + 1) : 0;
 }
@@ -171,7 +171,7 @@ static __inline__ int ffs(int x)
  * fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
  */
 
-static __inline__ int fls(unsigned int x)
+static __inline__ __attribute_const__ int fls(unsigned int x)
 {
 	int ret;
 	if (!x)
-- 
2.34.1

