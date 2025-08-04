Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C4C2882D2
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Aug 2025 16:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754325862; cv=none; b=G9hM/8qyLlZlAXBlKz2fPOZPexQpD8ifpWDa+5zNpSlR/zl3mwjBx4YLsUTLcOMCyHjjzvT8m3Nk2R2lQK9CqdTdJoHti/B9armbre2oJ16Ce/oO7naOVAhDmR/S9n+/TRB/8B0xePCT6ys4xtMf/fq9AmWOMDDphLJsSzrrkRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754325862; c=relaxed/simple;
	bh=r2v62d4bVt9owj808SKHRzdSx9oLY8KjiUCy34x/12Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FwtwD7iK6m8ilhPtJ+VuMmjAco7L+xVUBefWImBa6jfyaJki5HXFHYHvzFIzvD+C7MLAyr1GX5ibrXRLa7bFspqyryqWSpGTPQUiBeTL2fo0XPdFyRNluNcVj5gLj5do43XH71vPEdSnRXMUHOFx4Bca1Q5Bs2UAdEoJtAnw5Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qoDkY9It; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qoDkY9It"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3799560200;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE13C4CEE7;
	Mon,  4 Aug 2025 16:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325857;
	bh=r2v62d4bVt9owj808SKHRzdSx9oLY8KjiUCy34x/12Y=;
	h=From:To:Cc:Subject:Date:From;
	b=qoDkY9It5/lqR9fbX6g8iGg/nmmtCv14BOgAwhkb5uNiClyFaMkiukY7Oc+J1MaKh
	 dZnz4X/S3ajFCt76duYJHDx0quVZH6oSu/c0vStSRzaSzbCcMKFV4L18ye0ZTJoXPN
	 i3oURUhH5BvGFLUiBhUMaVt9LAqwPNrH4pyC8RyKbvz3yMn0pqcXcQS+g91j40QHjM
	 lNQCmlS8pNR7LcsmFHjuc2AbEWdFGnRvWbhlC/VB8DAo2fUatOIF7DscYokL7FpXgy
	 l5z39sJCmL4o5lHPcQDJdF9jtn/jsrC9WDmDQnvKWCYKZ26XpAxSx9TjSBv7Ns52lt
	 j7UHemkdNe4Mg==
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
Subject: [PATCH 00/17] Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:43:56 -0700
Message-Id: <20250804163910.work.929-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3619; i=kees@kernel.org; h=from:subject:message-id; bh=r2v62d4bVt9owj808SKHRzdSx9oLY8KjiUCy34x/12Y=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHofFXgjp7KzykhVPcF48Q+LLy7qNn3Wc38x5WLbt/ 44z4VPWdZSyMIhxMciKKbIE2bnHuXi8bQ93n6sIM4eVCWQIAxenAEzERo7hf8kiKe0FSd8l7Cv7 We7uUrdPYDs+m0lg/c5Dkx57tW49XMrwT2vS53lTDZ/v/XEnZcFFsaM9CXKfOL49eCxys3TZx5i tytwA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

While tracking down a problem where constant expressions used by
BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
initializer was convincing the compiler that it couldn't track the state
of the prior statically initialized value. Tracing this down found that
ffs() was used in the initializer macro, but since it wasn't marked with
__attribute_const__, the compiler had to assume the function might
change variable states as a side-effect (which is not true for ffs(),
which provides deterministic math results).

Add KUnit tests for the family of functions and then add __attribute_const__
to all architecture implementations and wrappers.

-Kees

[1] https://github.com/KSPP/linux/issues/364

Kees Cook (17):
  KUnit: Introduce ffs()-family tests
  bitops: Add __attribute_const__ to generic ffs()-family
    implementations
  csky: Add __attribute_const__ to ffs()-family implementations
  x86: Add __attribute_const__ to ffs()-family implementations
  powerpc: Add __attribute_const__ to ffs()-family implementations
  sh: Add __attribute_const__ to ffs()-family implementations
  alpha: Add __attribute_const__ to ffs()-family implementations
  hexagon: Add __attribute_const__ to ffs()-family implementations
  riscv: Add __attribute_const__ to ffs()-family implementations
  openrisc: Add __attribute_const__ to ffs()-family implementations
  m68k: Add __attribute_const__ to ffs()-family implementations
  mips: Add __attribute_const__ to ffs()-family implementations
  parisc: Add __attribute_const__ to ffs()-family implementations
  s390: Add __attribute_const__ to ffs()-family implementations
  xtensa: Add __attribute_const__ to ffs()-family implementations
  sparc: Add __attribute_const__ to ffs()-family implementations
  KUnit: ffs: Validate all the __attribute_const__ annotations

 lib/Kconfig.debug                          |  14 +
 lib/tests/Makefile                         |   1 +
 arch/alpha/include/asm/bitops.h            |  14 +-
 arch/csky/include/asm/bitops.h             |   8 +-
 arch/hexagon/include/asm/bitops.h          |  10 +-
 arch/m68k/include/asm/bitops.h             |  14 +-
 arch/mips/include/asm/bitops.h             |   8 +-
 arch/openrisc/include/asm/bitops/__ffs.h   |   2 +-
 arch/openrisc/include/asm/bitops/__fls.h   |   2 +-
 arch/openrisc/include/asm/bitops/ffs.h     |   2 +-
 arch/openrisc/include/asm/bitops/fls.h     |   2 +-
 arch/parisc/include/asm/bitops.h           |   6 +-
 arch/powerpc/include/asm/bitops.h          |   4 +-
 arch/riscv/include/asm/bitops.h            |   6 +-
 arch/s390/include/asm/bitops.h             |  10 +-
 arch/sh/include/asm/bitops.h               |   4 +-
 arch/sparc/include/asm/bitops_64.h         |   8 +-
 arch/x86/include/asm/bitops.h              |  12 +-
 arch/xtensa/include/asm/bitops.h           |  10 +-
 include/asm-generic/bitops/__ffs.h         |   2 +-
 include/asm-generic/bitops/__fls.h         |   2 +-
 include/asm-generic/bitops/builtin-__ffs.h |   2 +-
 include/asm-generic/bitops/builtin-__fls.h |   2 +-
 include/asm-generic/bitops/builtin-fls.h   |   2 +-
 include/asm-generic/bitops/ffs.h           |   2 +-
 include/asm-generic/bitops/fls.h           |   2 +-
 include/asm-generic/bitops/fls64.h         |   4 +-
 include/linux/bitops.h                     |   2 +-
 lib/clz_ctz.c                              |   8 +-
 lib/tests/ffs_kunit.c                      | 566 +++++++++++++++++++++
 30 files changed, 656 insertions(+), 75 deletions(-)
 create mode 100644 lib/tests/ffs_kunit.c

-- 
2.34.1

