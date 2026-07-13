Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37B13BC69C
	for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Jul 2026 10:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783937995; cv=none; b=HFihI4oPSaRM3u22ZqfRgoMZbXf30kj8sUII4gtojOywbjBI3A6kboeQQarFAQy1SiO4lepBfZkEi0rfN68WVBQvcuPoCOJSikHW2NSqQ9I66HlyMTuHQj29Ty5HmG/ITtJt3YiXBL7kkT5wxrG7cV3wwe0odVG+9E/4oCiPbjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783937995; c=relaxed/simple;
	bh=RWFi9YEYPrxCAMVoxAq3Lu5Qc5KD/8DsAYlrrJPSAro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gwumjVKNu33xiRPXMyK/5hzpgxY75E3dpVKhimrlueJvsQefGZ/d+Wk8+bijatFnHKXrjPZ0so1QiItaI78vvSQQ7Hx3vdQvcuziTSVVDgyfNALGXam55w7vuCq3iJQRzeirI4SltFTmvFGEyBpuH/kKdBy/wvh5GmfsYNPMyMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 091FB4091E;
	Mon, 13 Jul 2026 10:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B1F1F00A3A;
	Mon, 13 Jul 2026 10:19:51 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: defconfig: Update defconfigs for v7.2-rc1
Date: Mon, 13 Jul 2026 12:19:47 +0200
Message-ID: <9842659245b4b16187fab67813cc98217d8a7036.1783937585.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  - Drop CONFIG_CRYPTO_CAMELLIA=m, CONFIG_CRYPTO_CTS=m,
    CONFIG_CRYPTO_CMAC=m, CONFIG_CRYPTO_SHA1=m, and
    CONFIG_CRYPTO_SHA512=m (auto-enabled since commit bf8672b99402abd8
    ("SUNRPC: Add Kconfig dependency on CRYPTO_KRB5")).

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be queued in the m68k tree for v7.3.

 arch/m68k/configs/amiga_defconfig    | 5 -----
 arch/m68k/configs/apollo_defconfig   | 5 -----
 arch/m68k/configs/atari_defconfig    | 5 -----
 arch/m68k/configs/bvme6000_defconfig | 5 -----
 arch/m68k/configs/hp300_defconfig    | 5 -----
 arch/m68k/configs/mac_defconfig      | 5 -----
 arch/m68k/configs/multi_defconfig    | 5 -----
 arch/m68k/configs/mvme147_defconfig  | 5 -----
 arch/m68k/configs/mvme16x_defconfig  | 5 -----
 arch/m68k/configs/q40_defconfig      | 5 -----
 arch/m68k/configs/sun3_defconfig     | 5 -----
 arch/m68k/configs/sun3x_defconfig    | 5 -----
 12 files changed, 60 deletions(-)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index 5ed08e0fdf882f81..8b7efe20dd1285ba 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -516,7 +516,6 @@ CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_DES=m
@@ -528,17 +527,13 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MD5=m
 CONFIG_CRYPTO_RMD160=m
-CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SHA512=m
 CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index 4690fcd5b2f5bd1b..c7f7705806f97c12 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -471,7 +471,6 @@ CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_DES=m
@@ -483,17 +482,13 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MD5=m
 CONFIG_CRYPTO_RMD160=m
-CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SHA512=m
 CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index 5b3f9db297c866b4..2fb213161baec91f 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -494,7 +494,6 @@ CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_DES=m
@@ -506,17 +505,13 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MD5=m
 CONFIG_CRYPTO_RMD160=m
-CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SHA512=m
 CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 65370825c72655c9..6730242d4d48613f 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -463,7 +463,6 @@ CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_DES=m
@@ -475,17 +474,13 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MD5=m
 CONFIG_CRYPTO_RMD160=m
-CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SHA512=m
 CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 31a58e0b865469d3..2b3ff26ac8fdff27 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -473,7 +473,6 @@ CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_DES=m
@@ -485,17 +484,13 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MD5=m
 CONFIG_CRYPTO_RMD160=m
-CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SHA512=m
 CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index 22b815d0909ef1e2..61f32ef2547e05b9 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -492,7 +492,6 @@ CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_DES=m
@@ -504,17 +503,13 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MD5=m
 CONFIG_CRYPTO_RMD160=m
-CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SHA512=m
 CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 615e2dcad3d3b2c2..2cbd6bf20a6873c7 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -579,7 +579,6 @@ CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_DES=m
@@ -591,17 +590,13 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MD5=m
 CONFIG_CRYPTO_RMD160=m
-CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SHA512=m
 CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index 99014914182051c2..019f8b8070be8d4e 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -463,7 +463,6 @@ CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_DES=m
@@ -475,17 +474,13 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MD5=m
 CONFIG_CRYPTO_RMD160=m
-CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SHA512=m
 CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 12686bf3ff732fc1..38916328742582e4 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -464,7 +464,6 @@ CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_DES=m
@@ -476,17 +475,13 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MD5=m
 CONFIG_CRYPTO_RMD160=m
-CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SHA512=m
 CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 25a971b9819d1bd2..cbc41443cffa6ece 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -482,7 +482,6 @@ CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_DES=m
@@ -494,17 +493,13 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MD5=m
 CONFIG_CRYPTO_RMD160=m
-CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SHA512=m
 CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index e070628b006ef8cf..273e840dc8d6a021 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -461,7 +461,6 @@ CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_DES=m
@@ -473,17 +472,13 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MD5=m
 CONFIG_CRYPTO_RMD160=m
-CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SHA512=m
 CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index 9fc2943dc4ce2a33..843d72924bcb20fa 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -461,7 +461,6 @@ CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_ARIA=m
 CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_DES=m
@@ -473,17 +472,13 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_MD4=m
 CONFIG_CRYPTO_MD5=m
 CONFIG_CRYPTO_RMD160=m
-CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_SHA512=m
 CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_WP512=m
-- 
2.43.0

