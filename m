Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFE93FB7E7
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Jul 2026 12:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783428142; cv=none; b=GT640JwadTXQnVeIWV8ydpj/0U4qrYrGFT8UHGLRptuuZS0d/K2nwESnp9f61r8bmXh79uhIcQbQelpzCxi2ACqBbKw7Ui/eKuPC3kmE/QxFlytYpms19IrKdrVQ25JALrn8hroxbEIIAs40fRigOm9DdSObsRlCfKwYZEotn0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783428142; c=relaxed/simple;
	bh=/ZZlD3Qz0wjy5PtKrSynrirYAosFY4QZk9OKl+G3fd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aTdJZQ3pdFp1b1p6c9WVo7BxJ+uNjrNNQsM/O0pjdk+7xrt+TZCSMxNzbAUC22/OkTgv+M5Lxj0kIOnSvbKaWDYJaxDjRvBGBG5137e83eP4qKmHMS8n35z4uM2L/Y5qnqIw8Kxax9tfloUiyNeSZo2wrLUfREBM90kd3h1rnFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L3y/C11P; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L3y/C11P"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5ED1E434B4;
	Tue,  7 Jul 2026 12:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59571F000E9;
	Tue,  7 Jul 2026 12:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783428140;
	bh=ei0DHhFSR6ZwEA8Ihe7QeUDKYCgEidxXzmAfjPSBtEU=;
	h=From:To:Cc:Subject:Date;
	b=L3y/C11PNzTPFXQ8k8e+QKn+pm6b5Ze50tEDun7U2Om9to4jS/93fy85Pc2K2I9qT
	 er/3hWyUAN12qdG34jYmf7izGveY2ygBo6Atlrsmjx97xZkB6ITOVkuHepePiza0kz
	 vhK/pfzAt3z/35DNRI/ELnbCTZOdAq8/3UvqF1UBcyKG6s9z5NzThuWKGkfNwKjHRg
	 OPTen2GKWO1kaTyBJ38LTIFCg0YSchFLBQop7It5vCqHD0I8DLf1f4WZPHxWQR9QTB
	 Y8Zo9xMrP3qbUZ7aNdV+P2Gqz+CnuCMpkSbmiMpenTF2oMn3GI3X/pFa0X/Fxs4Y88
	 X5uLJeTptZb3w==
From: Greg Ungerer <gerg@kernel.org>
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	Greg Ungerer <gerg@linux-m68k.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] m68k: coldfire: fix breakage of missed IO access updates
Date: Tue,  7 Jul 2026 22:41:24 +1000
Message-ID: <20260707124124.2604211-1-gerg@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Greg Ungerer <gerg@linux-m68k.org>

Commit e1f3a00670d1 ("m68k: coldfire: use ColdFire specifc IO access in
SoC code") incorrectly updated a couple of local IO access uses. They
use "read8" when they should be using the new "mcf_read8". Fix them.

This causes compile time breakage for two specific SoC types, the ColdFire
5235 and 5282. They got missed in original testing due to not having
any defconfigs for these specific parts.

Fixes: e1f3a00670d1 ("m68k: coldfire: use ColdFire specifc IO access in SoC code")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607040536.BiSGmESw-lkp@intel.com/
Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/m523x.c | 2 +-
 arch/m68k/coldfire/m528x.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/coldfire/m523x.c b/arch/m68k/coldfire/m523x.c
index 11d7423ef646..ec04c32bb03c 100644
--- a/arch/m68k/coldfire/m523x.c
+++ b/arch/m68k/coldfire/m523x.c
@@ -79,7 +79,7 @@ static void __init m523x_i2c_init(void)
 static void __init m523x_fec_init(void)
 {
 	/* Set multi-function pins to ethernet use */
-	mcf_write8(read8(MCFGPIO_PAR_FECI2C) | 0xf0, MCFGPIO_PAR_FECI2C);
+	mcf_write8(mcf_read8(MCFGPIO_PAR_FECI2C) | 0xf0, MCFGPIO_PAR_FECI2C);
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m528x.c b/arch/m68k/coldfire/m528x.c
index b244c9ba40a7..3383b1ba106a 100644
--- a/arch/m68k/coldfire/m528x.c
+++ b/arch/m68k/coldfire/m528x.c
@@ -113,11 +113,11 @@ void wildfiremod_halt(void)
 	mcf_write16(read16(MCFGPIO_PEPAR) & ~(1 << (5 * 2)), MCFGPIO_PEPAR);
 
 	/* Make portE.5 an output */
-	mcf_write8(read8(MCFGPIO_PDDR_E) | (1 << 5), MCFGPIO_PDDR_E);
+	mcf_write8(mcf_read8(MCFGPIO_PDDR_E) | (1 << 5), MCFGPIO_PDDR_E);
 
 	/* Now toggle portE.5 from low to high */
-	mcf_write8(read8(MCFGPIO_PODR_E) & ~(1 << 5), MCFGPIO_PODR_E);
-	mcf_write8(read8(MCFGPIO_PODR_E) | (1 << 5), MCFGPIO_PODR_E);
+	mcf_write8(mcf_read8(MCFGPIO_PODR_E) & ~(1 << 5), MCFGPIO_PODR_E);
+	mcf_write8(mcf_read8(MCFGPIO_PODR_E) | (1 << 5), MCFGPIO_PODR_E);
 
 	printk(KERN_EMERG "Failed to hibernate. Halting!\n");
 }
-- 
2.54.0

