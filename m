Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54253BBA1A
	for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Aug 2026 09:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169482; cv=none; b=Ez9LX/hiUUIeVhGIKD9LfyUP/a7nZKt2VHjhnX2C0BnN44V6O1fd0gcuksIvK2rvpuaewWuq5MsYOK2/fxnui45QZJu+W0bh12npz5PXi+A955Ip+H+MQYQpuRF91VqCD69Ckh4eemZT1cJTa1EDIIw7S00sWHEHJaPG7p46pUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169482; c=relaxed/simple;
	bh=I+pmILgH4P+czBvVne3LqS1IDHE0D6UGovvrIR7eE8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hxnRgVfKcLKykLgXCXxCVRiRmwg1VRyaky3HRZWU7QrWld+6D/Vqv8ISuXKtXJiG5klEdn+o/lW4Zn4n/WNpZszKUerKByJaPzHMk62caN7F2dKjQgDo4E7AHvC0tz94AXIs8QtBgQP0BkDVe55MHmqgcRq2Vc9yMuS5Z/9p1Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 50E47601DB;
	Mon, 31 Aug 2026 09:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9EF1F00A3D;
	Mon, 31 Aug 2026 09:44:37 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: defconfig: Update defconfigs for v7.3-rc1
Date: Mon, 31 Aug 2026 11:44:34 +0200
Message-ID: <2b621309c18a776a41d8daaa4b67e652482b3719.1788169336.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  - Enable modular build of the new xor_gen, raid P/Q generation, and
    bitmap, IDA and Maple Tree region allocation tests.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be queued in the m68k tree for v7.4.
---
 arch/m68k/configs/amiga_defconfig    | 3 +++
 arch/m68k/configs/apollo_defconfig   | 3 +++
 arch/m68k/configs/atari_defconfig    | 3 +++
 arch/m68k/configs/bvme6000_defconfig | 3 +++
 arch/m68k/configs/hp300_defconfig    | 3 +++
 arch/m68k/configs/mac_defconfig      | 3 +++
 arch/m68k/configs/multi_defconfig    | 3 +++
 arch/m68k/configs/mvme147_defconfig  | 3 +++
 arch/m68k/configs/mvme16x_defconfig  | 3 +++
 arch/m68k/configs/q40_defconfig      | 3 +++
 arch/m68k/configs/sun3_defconfig     | 3 +++
 arch/m68k/configs/sun3x_defconfig    | 3 +++
 12 files changed, 36 insertions(+)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index 5ded2a944b3e1d8f..47518e3840322a6d 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -555,6 +555,8 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
+CONFIG_XOR_BENCHMARK=y
+CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
@@ -583,6 +585,7 @@ CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_WORKQUEUE=m
 CONFIG_TEST_BPF=m
 CONFIG_FIND_BIT_BENCHMARK=m
+CONFIG_REGION_ALLOC_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
 CONFIG_LINEAR_RANGES_TEST=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index fe5c5cb2c80cc1bd..a6979f6b8859529f 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -510,6 +510,8 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
+CONFIG_XOR_BENCHMARK=y
+CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
@@ -538,6 +540,7 @@ CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_WORKQUEUE=m
 CONFIG_TEST_BPF=m
 CONFIG_FIND_BIT_BENCHMARK=m
+CONFIG_REGION_ALLOC_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
 CONFIG_LINEAR_RANGES_TEST=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index f1c22ad839ebd93d..4673a7f6b14e2225 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -540,6 +540,8 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
+CONFIG_XOR_BENCHMARK=y
+CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
@@ -568,6 +570,7 @@ CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_WORKQUEUE=m
 CONFIG_TEST_BPF=m
 CONFIG_FIND_BIT_BENCHMARK=m
+CONFIG_REGION_ALLOC_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
 CONFIG_LINEAR_RANGES_TEST=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 12be82eb84f3ed43..282819a5f4d223e7 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -502,6 +502,8 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
+CONFIG_XOR_BENCHMARK=y
+CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
@@ -530,6 +532,7 @@ CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_WORKQUEUE=m
 CONFIG_TEST_BPF=m
 CONFIG_FIND_BIT_BENCHMARK=m
+CONFIG_REGION_ALLOC_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
 CONFIG_LINEAR_RANGES_TEST=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index e30154f85f24b498..488420ebf1563ff1 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -512,6 +512,8 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
+CONFIG_XOR_BENCHMARK=y
+CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
@@ -540,6 +542,7 @@ CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_WORKQUEUE=m
 CONFIG_TEST_BPF=m
 CONFIG_FIND_BIT_BENCHMARK=m
+CONFIG_REGION_ALLOC_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
 CONFIG_LINEAR_RANGES_TEST=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index fe56b8d2182d4301..c22e4d967cbd0ab3 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -531,6 +531,8 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
+CONFIG_XOR_BENCHMARK=y
+CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
@@ -559,6 +561,7 @@ CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_WORKQUEUE=m
 CONFIG_TEST_BPF=m
 CONFIG_FIND_BIT_BENCHMARK=m
+CONFIG_REGION_ALLOC_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
 CONFIG_LINEAR_RANGES_TEST=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 9c39b54ab6cd1fe1..80be9d658d10690a 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -618,6 +618,8 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
+CONFIG_XOR_BENCHMARK=y
+CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
@@ -646,6 +648,7 @@ CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_WORKQUEUE=m
 CONFIG_TEST_BPF=m
 CONFIG_FIND_BIT_BENCHMARK=m
+CONFIG_REGION_ALLOC_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
 CONFIG_LINEAR_RANGES_TEST=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index 5b0fa1df1d2723d3..cf491df8dffc7dda 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -502,6 +502,8 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
+CONFIG_XOR_BENCHMARK=y
+CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
@@ -530,6 +532,7 @@ CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_WORKQUEUE=m
 CONFIG_TEST_BPF=m
 CONFIG_FIND_BIT_BENCHMARK=m
+CONFIG_REGION_ALLOC_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
 CONFIG_LINEAR_RANGES_TEST=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index a74e3b70806b2c43..f1855ab5aaf156cf 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -503,6 +503,8 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
+CONFIG_XOR_BENCHMARK=y
+CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
@@ -531,6 +533,7 @@ CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_WORKQUEUE=m
 CONFIG_TEST_BPF=m
 CONFIG_FIND_BIT_BENCHMARK=m
+CONFIG_REGION_ALLOC_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
 CONFIG_LINEAR_RANGES_TEST=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index cc0eded41ef6e3f7..062dea094d69f4db 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -521,6 +521,8 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
+CONFIG_XOR_BENCHMARK=y
+CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
@@ -549,6 +551,7 @@ CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_WORKQUEUE=m
 CONFIG_TEST_BPF=m
 CONFIG_FIND_BIT_BENCHMARK=m
+CONFIG_REGION_ALLOC_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
 CONFIG_LINEAR_RANGES_TEST=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index e1955acb45674f87..afc8929520f1ff0e 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -500,6 +500,8 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
+CONFIG_XOR_BENCHMARK=y
+CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
@@ -527,6 +529,7 @@ CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_WORKQUEUE=m
 CONFIG_TEST_BPF=m
 CONFIG_FIND_BIT_BENCHMARK=m
+CONFIG_REGION_ALLOC_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
 CONFIG_LINEAR_RANGES_TEST=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index 55833d2541aa388f..a504421918739d5a 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -500,6 +500,8 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
+CONFIG_XOR_BENCHMARK=y
+CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
@@ -528,6 +530,7 @@ CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_WORKQUEUE=m
 CONFIG_TEST_BPF=m
 CONFIG_FIND_BIT_BENCHMARK=m
+CONFIG_REGION_ALLOC_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
 CONFIG_LINEAR_RANGES_TEST=m
-- 
2.43.0

