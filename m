Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623641;
	b=O5snBcCdshjYXZXB3qA2AIZMVzDHOWwJeUYXtBhCon/JSaRrKcgUtAi9czFm+7T19sUr
	 MID3QLoZ7sGY7Ak0zp9Drn6+vVjijd5dMx6z/UCJzWEv7YsoYGvoSEeKxvDoSF3pPrdv6
	 6c/ZbRcUMe2a1tL9SurIO3ns5a1tc2K7AGJRjSRzRj8teBw6xOtQjR9Hh3wnDaqx/M4K8
	 1wP2OCVx0P/zil7IQemqBo5F3GH2GNiMCY0yFxAsNeJw7R5bQeWibi/4q/nlYUP1N+eZn
	 JFWi5aBP0BMOFr8VSD1nu4wcHfXilbvCzoswAdvUZeOVC3ZWGSgxHNmRJB8sgM8qLew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623641;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=TO91KoG1vI9ce1NgrS1H3y4AjLuUyVF7kQXnRdtAC4g=;
	b=gtOdG8qAGWhoVBnumUwVxEcfqSL+wSEIT4Bieme/25eWzWQ3WxaJMSvCGCTdjhHfvF+T
	 lUOoqw2aimgGADJYk1pCf8cDb+16aNbHYvjgq1BPddZNQm3PUQJ/iY9GPRyAa7f8jNUMP
	 UttZ7ehr47BraeliK6+MZYOtEAeS0UanTGnKjp+MlQSnfYYFV9UQ0AP6yhTUj4o/C1Iw3
	 D2voC2BYUsZ+vjgePPY/KNJexUTaDDbG0lT5cwohwvFwuCSmSYO+Kbw16r0m/j/RlWZv2
	 UtkPtY5XLTtFs+zGC0Jg03DEb3INlW8HVOtIhApfCru4J5UIwZIukgvBi+GmdYk6zWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=kernel.org;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569ED606A324
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Nov 2026 12:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 569ED606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D7AF340213;
	Mon,  2 Nov 2026 12:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0548F1F00A16;
	Mon,  2 Nov 2026 12:47:18 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: defconfig: Update defconfigs for v7.4-rc1
Date: Mon,  2 Nov 2026 13:47:15 +0100
Message-ID: <d2cbb6f63f246237dd2d7818790a4374cea0d00b.1793623549.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  - Drop CONFIG_XOR_BENCHMARK=y and CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
    (auto-enabled since commit cba342dde142494a ("raid/kunit: enable
    RAID6 PQ and XOR benchmarks if KUNIT_ALL_TESTS=m")).

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be queued in the m68k tree for v7.4.
---
 arch/m68k/configs/amiga_defconfig    | 2 --
 arch/m68k/configs/apollo_defconfig   | 2 --
 arch/m68k/configs/atari_defconfig    | 2 --
 arch/m68k/configs/bvme6000_defconfig | 2 --
 arch/m68k/configs/hp300_defconfig    | 2 --
 arch/m68k/configs/mac_defconfig      | 2 --
 arch/m68k/configs/multi_defconfig    | 2 --
 arch/m68k/configs/mvme147_defconfig  | 2 --
 arch/m68k/configs/mvme16x_defconfig  | 2 --
 arch/m68k/configs/q40_defconfig      | 2 --
 arch/m68k/configs/sun3_defconfig     | 2 --
 arch/m68k/configs/sun3x_defconfig    | 2 --
 12 files changed, 24 deletions(-)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index e2d474e8cb8fab19..02d851bac96305d4 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -552,8 +552,6 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
-CONFIG_XOR_BENCHMARK=y
-CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index 77669e31bb5af0c7..799f1bacd902c344 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -506,8 +506,6 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
-CONFIG_XOR_BENCHMARK=y
-CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index 55ebd7c67937abd5..1f8d8237bb87a017 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -541,8 +541,6 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
-CONFIG_XOR_BENCHMARK=y
-CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 44c1a2228d5f2ef4..f894161a8b1822dc 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -498,8 +498,6 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
-CONFIG_XOR_BENCHMARK=y
-CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 7ab25377bfe80d57..8990c1bd668e1122 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -508,8 +508,6 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
-CONFIG_XOR_BENCHMARK=y
-CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index 13f642884a948978..d9396edd11f10adc 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -527,8 +527,6 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
-CONFIG_XOR_BENCHMARK=y
-CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 1bbd2aa653c08814..16a06da9f7735260 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -617,8 +617,6 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
-CONFIG_XOR_BENCHMARK=y
-CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index 3bfc36faf8d5bae3..7e92fc0602b2b021 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -498,8 +498,6 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
-CONFIG_XOR_BENCHMARK=y
-CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 41ceed87c78a9e57..54dec1976199bba0 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -499,8 +499,6 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
-CONFIG_XOR_BENCHMARK=y
-CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index af4b5c6e4655fe0c..d02cb75492cf9abc 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -517,8 +517,6 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
-CONFIG_XOR_BENCHMARK=y
-CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index 1140951fefe7dba4..b568bcf29c47af92 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -496,8 +496,6 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
-CONFIG_XOR_BENCHMARK=y
-CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index bc9358e71ee08413..0146fe25846b9bf6 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -496,8 +496,6 @@ CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_PRIME_NUMBERS=m
 CONFIG_CRC_ENABLE_ALL_FOR_KUNIT=m
 CONFIG_CRC_BENCHMARK=y
-CONFIG_XOR_BENCHMARK=y
-CONFIG_RAID6_PQ_KUNIT_BENCHMARK=y
 CONFIG_XZ_DEC_TEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
-- 
2.43.0

