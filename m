Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AD960DE4
	for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jan 2024 12:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706531892; cv=none; b=hMpla2i0VxMnA8zNBz6R9QSP61pkVBv6q7CX7+Yk6s/5F8PaAUvdlqDo5IhI6uR+LYut5cIk38tjfvjs+BDwkRqT/Mk57m9fPdJNZeSZPvZkJATBy/lXVIsQZg9LoM1grTwBA3kxdY/pg2i65nwoGmIo5iBEktE7XbE7Qs6jHsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706531892; c=relaxed/simple;
	bh=a3S0HTaEG+NRy3OuBzC4bJEk/TMKka1UdnM0wUTLvoE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UDakQXTANGeGu4cxOZ+zawU/68RCP7Z13RSevpSxQCfOMC5SCKhb4vu25NzXiIicahnFe2G9KFTm+2EKOycb6z9Gq+/G4jitUdYjo7qX1zoycovWK4K9eYMTIjflUDQmnN4ZZIC2fFB6KpGznVsrxGJjljAOPAP3k+xQtiGE5m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:3b5f:c6ad:b5fc:a0f3])
	by andre.telenet-ops.be with bizsmtp
	id gce02B00K2ZPkuY01ce0Tz; Mon, 29 Jan 2024 13:38:00 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rUQsu-00Gh8R-Kb;
	Mon, 29 Jan 2024 13:38:00 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rUQtk-007Vav-9a;
	Mon, 29 Jan 2024 13:38:00 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: defconfig: Update defconfigs for v6.8-rc1
Date: Mon, 29 Jan 2024 13:37:59 +0100
Message-Id: <902a6cfd5f0c5b67470658dd6dffdd1bac1948b5.1706272008.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  - Drop CONFIG_MD_LINEAR=m (removed in commit 849d18e27be9a125 ("md:
    Remove deprecated CONFIG_MD_LINEAR")),
  - Drop CONFIG_CRYPTO_CFB=m and CONFIG_CRYPTO_OFB=m (removed in commit
    412ac51ce0b8c558 ("crypto: cfb,ofb - Remove cfb and ofb")).

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be queued in the m68k for-v6.9 branch.

 arch/m68k/configs/amiga_defconfig    | 3 ---
 arch/m68k/configs/apollo_defconfig   | 3 ---
 arch/m68k/configs/atari_defconfig    | 3 ---
 arch/m68k/configs/bvme6000_defconfig | 3 ---
 arch/m68k/configs/hp300_defconfig    | 3 ---
 arch/m68k/configs/mac_defconfig      | 3 ---
 arch/m68k/configs/multi_defconfig    | 3 ---
 arch/m68k/configs/mvme147_defconfig  | 3 ---
 arch/m68k/configs/mvme16x_defconfig  | 3 ---
 arch/m68k/configs/q40_defconfig      | 3 ---
 arch/m68k/configs/sun3_defconfig     | 3 ---
 arch/m68k/configs/sun3x_defconfig    | 3 ---
 12 files changed, 36 deletions(-)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index b4d71fea558f1f0f..a6f6607efe79cd20 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -336,7 +336,6 @@ CONFIG_ATA=y
 CONFIG_PATA_GAYLE=y
 CONFIG_PATA_BUDDHA=y
 CONFIG_MD=y
-CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
@@ -579,12 +578,10 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CFB=m
 CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_KEYWRAP=m
 CONFIG_CRYPTO_LRW=m
-CONFIG_CRYPTO_OFB=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index 682d8cd3dd3cea94..0ca1f9f930bc1fd3 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -316,7 +316,6 @@ CONFIG_SCSI_SAS_ATTRS=m
 CONFIG_ISCSI_TCP=m
 CONFIG_ISCSI_BOOT_SYSFS=m
 CONFIG_MD=y
-CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
@@ -536,12 +535,10 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CFB=m
 CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_KEYWRAP=m
 CONFIG_CRYPTO_LRW=m
-CONFIG_CRYPTO_OFB=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index 946ac609c0d07da9..ad0b50923d99f6f7 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -331,7 +331,6 @@ CONFIG_ATA=y
 # CONFIG_ATA_BMDMA is not set
 CONFIG_PATA_FALCON=y
 CONFIG_MD=y
-CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
@@ -567,12 +566,10 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CFB=m
 CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_KEYWRAP=m
 CONFIG_CRYPTO_LRW=m
-CONFIG_CRYPTO_OFB=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 7395c12caef6e84a..ad8f81fbb630c2bc 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -314,7 +314,6 @@ CONFIG_ISCSI_TCP=m
 CONFIG_ISCSI_BOOT_SYSFS=m
 CONFIG_BVME6000_SCSI=y
 CONFIG_MD=y
-CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
@@ -528,12 +527,10 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CFB=m
 CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_KEYWRAP=m
 CONFIG_CRYPTO_LRW=m
-CONFIG_CRYPTO_OFB=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 92506bc7f78daef1..ff253b6accecbd3b 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -315,7 +315,6 @@ CONFIG_SCSI_SAS_ATTRS=m
 CONFIG_ISCSI_TCP=m
 CONFIG_ISCSI_BOOT_SYSFS=m
 CONFIG_MD=y
-CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
@@ -538,12 +537,10 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CFB=m
 CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_KEYWRAP=m
 CONFIG_CRYPTO_LRW=m
-CONFIG_CRYPTO_OFB=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index 144bc8c0d8b590b3..f92b866620a7de86 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -320,7 +320,6 @@ CONFIG_ATA=y
 # CONFIG_ATA_BMDMA is not set
 CONFIG_PATA_PLATFORM=y
 CONFIG_MD=y
-CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
@@ -555,12 +554,10 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CFB=m
 CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_KEYWRAP=m
 CONFIG_CRYPTO_LRW=m
-CONFIG_CRYPTO_OFB=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 07594c72949773f6..bd813beaa8a72553 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -363,7 +363,6 @@ CONFIG_PATA_GAYLE=y
 CONFIG_PATA_BUDDHA=y
 CONFIG_PATA_PLATFORM=y
 CONFIG_MD=y
-CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
@@ -641,12 +640,10 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CFB=m
 CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_KEYWRAP=m
 CONFIG_CRYPTO_LRW=m
-CONFIG_CRYPTO_OFB=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index c34de6c1de203f16..2237ee0fe4337607 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -313,7 +313,6 @@ CONFIG_ISCSI_TCP=m
 CONFIG_ISCSI_BOOT_SYSFS=m
 CONFIG_MVME147_SCSI=y
 CONFIG_MD=y
-CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
@@ -527,12 +526,10 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CFB=m
 CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_KEYWRAP=m
 CONFIG_CRYPTO_LRW=m
-CONFIG_CRYPTO_OFB=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 83bc029d1f335338..afb5aa9c5012c4d1 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -314,7 +314,6 @@ CONFIG_ISCSI_TCP=m
 CONFIG_ISCSI_BOOT_SYSFS=m
 CONFIG_MVME16x_SCSI=y
 CONFIG_MD=y
-CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
@@ -528,12 +527,10 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CFB=m
 CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_KEYWRAP=m
 CONFIG_CRYPTO_LRW=m
-CONFIG_CRYPTO_OFB=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 4f551dac2ed72e36..e40f7a308966e8f1 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -320,7 +320,6 @@ CONFIG_ATA=y
 # CONFIG_ATA_BMDMA is not set
 CONFIG_PATA_FALCON=y
 CONFIG_MD=y
-CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
@@ -545,12 +544,10 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CFB=m
 CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_KEYWRAP=m
 CONFIG_CRYPTO_LRW=m
-CONFIG_CRYPTO_OFB=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index b1bf01182bd32fa2..4df397c0395f4240 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -310,7 +310,6 @@ CONFIG_ISCSI_TCP=m
 CONFIG_ISCSI_BOOT_SYSFS=m
 CONFIG_SUN3_SCSI=y
 CONFIG_MD=y
-CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
@@ -526,12 +525,10 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CFB=m
 CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_KEYWRAP=m
 CONFIG_CRYPTO_LRW=m
-CONFIG_CRYPTO_OFB=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index 5c9a3f71f036e361..aa7719b3947fb17b 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -311,7 +311,6 @@ CONFIG_ISCSI_TCP=m
 CONFIG_ISCSI_BOOT_SYSFS=m
 CONFIG_SUN3X_ESP=y
 CONFIG_MD=y
-CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
@@ -526,12 +525,10 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_ADIANTUM=m
 CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_CFB=m
 CONFIG_CRYPTO_CTS=m
 CONFIG_CRYPTO_HCTR2=m
 CONFIG_CRYPTO_KEYWRAP=m
 CONFIG_CRYPTO_LRW=m
-CONFIG_CRYPTO_OFB=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_AEGIS128=m
-- 
2.34.1

