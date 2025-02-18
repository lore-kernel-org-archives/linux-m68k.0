Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF311ABEA5
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 12:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883189; cv=none; b=IoxCMaYKaNEIxgFOZJSwhPnD9ASwyORFRD73iD71+U8vNbAf+P8wNXXmc5jJGuJP5/gaE17fZGyJpEWqrPITgXfhm7mJ3q/Ceo5t/Xrfm37tkpeAUI2HtxqNbi4+Fzd4jvWEIqiX90H6vTNmqewepx/nYhnIIXB79dQUvjVHKuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883189; c=relaxed/simple;
	bh=AWCtufLKZ6okAh7zNdnTbu6J3EIL/3fhzh9LJaik6DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IadeeKeKL1mQI0aNMr3xbGb04eseqqu3pa2Pht99PEvyRqzRiitxIptAFflFkypk1LbUPNILUEnVhrH09Px0OP9Ia8hB99LGfUjIAhCtRlRcwYGfG941aezVBLEWPJe5uZe9Vw+YIDX7IAvcUVsYQXrwIYxVCxc+dVG3YrIZq4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 140F95C5DC6;
	Tue, 18 Feb 2025 12:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57FE2C4CEE6;
	Tue, 18 Feb 2025 12:53:06 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 13/13] m68k: coldfire: enable devicetree use
Date: Tue, 18 Feb 2025 22:46:33 +1000
Message-ID: <20250218125124.2692982-14-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218125124.2692982-1-gerg@linux-m68k.org>
References: <20250218125124.2692982-1-gerg@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With minimal devicetree support in place enable the devicetree kernel
configuration options to use it on ColdFire platforms.

This is purely a proof-of-concept change. It is enough to use basic
devicetrees on the MCF5208EVB and M5475EVB platforms.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/Kconfig     | 2 ++
 arch/m68k/Kconfig.cpu | 1 +
 2 files changed, 3 insertions(+)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index b2ed0308c0ea..be87aef84373 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -41,6 +41,8 @@ config M68K
 	select OLD_SIGSUSPEND3
 	select UACCESS_MEMCPY if !MMU
 	select ZONE_DMA
+	select OF if COLDFIRE
+	select OF_EARLY_FLATTREE if COLDFIRE
 
 config CPU_BIG_ENDIAN
 	def_bool y
diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 50ecb16d0a1f..e2dce38607cf 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -31,6 +31,7 @@ config COLDFIRE
 	select GENERIC_CSUM
 	select GPIOLIB
 	select COMMON_CLK
+	select IRQ_DOMAIN
 	select HAVE_PAGE_SIZE_8KB if !MMU
 
 config SUN3
-- 
2.43.0

