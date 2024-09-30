Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC80155312
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Sep 2024 12:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727699278; cv=none; b=Wk00ftFoXHxd1P68GOZmOo8BeW8tngHBKyqBiVbhuNXN9mKpXXkjYN6cPKPlBmbfnnhyIzSu4DUZbDAVLq2LJMjeNApBw/K+3rG3yq4mq4V18ETLJTgIQbz3oFN6Q/+EZyKOlHanyQZdWMj7cvyRw/3xEg5YTAQQM+VyrOjlReg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727699278; c=relaxed/simple;
	bh=m41vD3XS2qNR5ZsELkfM/IIdIqmysp/yUzMrGBZMRHk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U8Efj2UVdl4FVFOh6oTqVQTDY5BIWl8hTy/EwxGPr9EHiyX0XZOGKK3YFOmJkQ3/85tdo1MP9C0djvMCa7YAJ4tKWwWNUvrcbs2Vx9C3cSgM1GKht6J+40Qi/KjkaGJPA3aHoFGKXMHksS5C8v1i4WKKwtyy5/4roveg65LmtPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:99bb:7ad4:7fac:370a])
	by michel.telenet-ops.be with cmsmtp
	id JcTn2D00Q4pGYif06cTnSj; Mon, 30 Sep 2024 14:27:48 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1svFV6-000uSC-4s;
	Mon, 30 Sep 2024 14:27:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1svFVD-000S1M-IS;
	Mon, 30 Sep 2024 14:27:47 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: defconfig: Update defconfigs for v6.12-rc1
Date: Mon, 30 Sep 2024 14:27:46 +0200
Message-Id: <4092672cb64b86ec3f300b4cf0ea0c2db2b52e2e.1727699197.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  - Enable modular build of the new mul_u64_u64_div_u64() test.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be queued in the m68k tree for v6.13.

 arch/m68k/configs/amiga_defconfig    | 1 +
 arch/m68k/configs/apollo_defconfig   | 1 +
 arch/m68k/configs/atari_defconfig    | 1 +
 arch/m68k/configs/bvme6000_defconfig | 1 +
 arch/m68k/configs/hp300_defconfig    | 1 +
 arch/m68k/configs/mac_defconfig      | 1 +
 arch/m68k/configs/multi_defconfig    | 1 +
 arch/m68k/configs/mvme147_defconfig  | 1 +
 arch/m68k/configs/mvme16x_defconfig  | 1 +
 arch/m68k/configs/q40_defconfig      | 1 +
 arch/m68k/configs/sun3_defconfig     | 1 +
 arch/m68k/configs/sun3x_defconfig    | 1 +
 12 files changed, 12 insertions(+)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index d01dc47d52ea2ffd..a70aec9a05c41f0c 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -620,6 +620,7 @@ CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
 CONFIG_TEST_DIV64=m
+CONFIG_TEST_MULDIV64=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index 46808e581d7b4709..312853f3d26ae043 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -577,6 +577,7 @@ CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
 CONFIG_TEST_DIV64=m
+CONFIG_TEST_MULDIV64=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index f09d1d687d0779a2..45737fe6d1add519 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -613,6 +613,7 @@ CONFIG_TEST_DHRY=m
 CONFIG_LKDTM=m
 CONFIG_TEST_MIN_HEAP=m
 CONFIG_TEST_DIV64=m
+CONFIG_TEST_MULDIV64=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index c0719322c0283751..f738202d1f369a65 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -569,6 +569,7 @@ CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
 CONFIG_TEST_DIV64=m
+CONFIG_TEST_MULDIV64=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 8d429e63f8f21471..74f74e03ccc97d14 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -579,6 +579,7 @@ CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
 CONFIG_TEST_DIV64=m
+CONFIG_TEST_MULDIV64=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index bafd33da27c1101a..14c8f1b374aaa725 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -596,6 +596,7 @@ CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
 CONFIG_TEST_DIV64=m
+CONFIG_TEST_MULDIV64=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 6f5ca3f85ea16028..41c8112c6d0dff72 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -682,6 +682,7 @@ CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
 CONFIG_TEST_DIV64=m
+CONFIG_TEST_MULDIV64=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index d16b328c71363f51..e72d37ee90a7e679 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -568,6 +568,7 @@ CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
 CONFIG_TEST_DIV64=m
+CONFIG_TEST_MULDIV64=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 80f6c15a5ed5c8f8..733f1fc9a50a03cf 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -569,6 +569,7 @@ CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
 CONFIG_TEST_DIV64=m
+CONFIG_TEST_MULDIV64=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 0e81589f0ee26d76..3efe254355619bb0 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -586,6 +586,7 @@ CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
 CONFIG_TEST_DIV64=m
+CONFIG_TEST_MULDIV64=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index 8cd785290339db25..1b8ea0e7acb4cfef 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -566,6 +566,7 @@ CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
 CONFIG_TEST_DIV64=m
+CONFIG_TEST_MULDIV64=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index 78035369f60f1b4b..5bda93f6a2000d99 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -567,6 +567,7 @@ CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
 CONFIG_TEST_DIV64=m
+CONFIG_TEST_MULDIV64=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
-- 
2.34.1

