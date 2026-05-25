Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B9930C16B
	for <linux-m68k@lists.linux-m68k.org>; Mon, 25 May 2026 04:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779681923; cv=none; b=EjijhvlXWQLkOPndGcRIcOjqmaKJFykzj42BWUD9sj6BdL5ZtlT6Pg+3n/NDHJfUkKdFPU0TuaxqOWyD2TUnnuw6IsjXNesxN8GczEC6GBd25dyVb8caEbe+GVSuXi3rEuoF8pfaMFwPeTKXhjcUDYs1fwXApDT19pV6WhvfRiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779681923; c=relaxed/simple;
	bh=0LiGFSnAG1ky07fXk30884dB5c4PT2edc9+LUOXuFH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T9QDpRKy2FWVzS9DNKuFQ842xs8PaGthtk7sH5zVQxXB2ULdYvpacAjOc6/lQe/Wm1aCzkR6uJz6zcN9EOoeC4LxTWveyZ2EqepZ5pG3jykThC5MqzTbhrvd+uaje3NbiqbTeGyq/7FIXepgRoQcqUJQggiKsi+8e89s4LGDRLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bx69HwaN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bx69HwaN"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso63229655e9.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 24 May 2026 21:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779681919; x=1780286719; darn=lists.linux-m68k.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=emURdgeOlHgaBm174Q/3Nh8W7QxeCMTToVw2jNEniUE=;
        b=bx69HwaNe9qTPaS1naNdEiMsq6thi025Hn0EJio+h/Be4u28Yvk+7B3zounvlOz9xe
         NAVvO1zjTpsOi8Tvh/DFbB8xShR5nfHDQmhYhumP/RzBpToi85TCWwz84d+sC0UsbRlH
         YvI8WwCpSPrQq4jCSCoDJIuvyo0Bhe1gvu6FLrxTQOB+C/ZZsC9xxe51oRor4r6xz+Ff
         E8fva49qug/szEe3GZt4jqoBKnxpMN27kQZeowfFO3+jYT7amfq6C212Sumn+JTTXcWM
         l3WkHxBKKFZozy71Zde0J4my/XmTx2QS1BvSjllLUg/7sIRacyRcsoDI1177QzveBAWk
         nz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779681919; x=1780286719;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emURdgeOlHgaBm174Q/3Nh8W7QxeCMTToVw2jNEniUE=;
        b=F1hbq86epuejot4r+z8eCPc+1a7g0AP4Z795VPEflu9sCt4UmIPEGeuGf+K7gYnEKv
         BL9CBlIfkYi3Un/kqPg2RM1yQqNEB7NUl+MMMC/FIrKCiJokzaCRfmRxZo0rkVdgJja7
         T3kzBt5S19mOl8vaHG/wPKl85A9nWW1ny1ZE4iwxdQ4m/uMCynczVasHAmA5v4pOZ2iw
         Q5/dimE0j/8w/QdU0/eCzhEBLefAxWCMMRIg4Glj47IpktkPCScBhtI01iLPuzMozsnM
         cljUMW+RhkoXuZwp1YTAQi0Rf2D9+ckeoxv0hwJJvC6AJWQm3ROUWaQRX+md7e2vE6Zs
         TjxA==
X-Gm-Message-State: AOJu0Yzpa74IDJ8GUt8CnrrMGR1K1v/VZuGEZySCn33Zw4NNd/yJkPPb
	m1Osi0C/QiQsr+RtcI+BRsMqTLzr5HYMwPrdn4w1qgLUdY1Ezbb2uasGO156rUTq+ofCybg+bMz
	eg/NGrvI=
X-Gm-Gg: Acq92OG/qSSjwMFhQ5XDL4osh1LoHBj7KMRExKP/skmd7d3XrkTymJaSZnqSdkGaut+
	zPSNEfp7AaNj1N9P70+HSc1hGWx55rMohZt03qBYbmzym41egXxuJHJwH9/ExI2qxD2cvDaCtcb
	xCC2yUpFqu+XrZlhGrH+jFsNqgta+YZG5OfM/C7ipBxHIwO0COUrL1fqh5S+yEBYRCMryHZSZAI
	l12S4wMRy9I3j4Q1NU5qhLAW0ohJ8WKK1leamXYPQqz7qMpVQVlLwQIYB2wjy2IZzlQlOCRRbVO
	t5CAWJma11QaNka7pUvywmhS/ou22+rZk6OirozyXC7IWxFSKGouT9XmuoG6c+7KGMeH/qYqM6C
	aN3LQcf326Jz6cnyOgLXvwStIFVl0Otizao1oVvqchK1+Suu9gFcTlvMV0G+UdXqwkYNoqwvO0r
	sbxqqtGB3WtzQHuwRa7OYrcS2wnN/5/LY=
X-Received: by 2002:a05:600c:c4a3:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-490426ceed2mr211907195e9.21.1779681919171;
        Sun, 24 May 2026 21:05:19 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d70c51sm26089543f8f.36.2026.05.24.21.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 21:05:18 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 25 May 2026 06:05:17 +0200
Subject: [PATCH] m68k: fix dma allocation for ColdFire with mmu
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-wip-bl-mcf-edma-v1-1-bd079bcb48b1@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CMBBA4as0s3aSOlgwXsW46M8UxgiSVtSk4
 e4UXX6L9wpkTsIZLqpA4rdkeU4Vx4MCP9ipZ5RQDaSp1YYMfmRG98DRR+QwWuzcSZNlik08Q63
 mxFG+v+P19nde3J39a9/Aum4VQM6ocwAAAA==
X-Change-ID: 20260525-wip-bl-mcf-edma-7b402ae2f3f8
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2

From: Angelo Dureghello <adureghello@baylibre.com>

This patch fixes the following issue on mcf54415:

[    2.270000] fsl-dspi fsl-dspi.0: Not able to get desc for DMA xfer
[    2.280000] fsl-dspi fsl-dspi.0: DMA transfer failed
[    2.280000] spi_master spi0: failed to transfer one message from queue
[    2.290000] spi_master spi0: noqueue transfer failed
[    2.290000] spi-nor spi0.1: probe with driver spi-nor failed with error -5

related to mcf-edma and spi-fsl-dspi drivers (dspi is using edma), visible
after the commit listed below.

The mmu available on some evoluted ColdFire SoCs as mcf54415 allows to
have a coherent dma allocation, so modify code accordingly.

Fixes: 7a360df941a4 ("m68k: don't provide arch_dma_alloc for nommu/coldfire")
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/Kconfig      | 4 ++--
 arch/m68k/kernel/dma.c | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 11835eb59d94..edbf6bc9c55a 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -7,7 +7,7 @@ config M68K
 	select ARCH_HAS_CPU_CACHE_ALIASING
 	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
 	select ARCH_HAS_CURRENT_STACK_POINTER
-	select ARCH_HAS_DMA_PREP_COHERENT if M68K_NONCOHERENT_DMA && !COLDFIRE
+	select ARCH_HAS_DMA_PREP_COHERENT if M68K_NONCOHERENT_DMA && (!COLDFIRE || MMU)
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if M68K_NONCOHERENT_DMA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
 	select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
@@ -15,7 +15,7 @@ config M68K
 	select ARCH_USE_MEMTEST if MMU_MOTOROLA
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
-	select DMA_DIRECT_REMAP if M68K_NONCOHERENT_DMA && !COLDFIRE
+	select DMA_DIRECT_REMAP if M68K_NONCOHERENT_DMA && (!COLDFIRE || MMU)
 	select GENERIC_ATOMIC64
 	select GENERIC_CPU_DEVICES
 	select GENERIC_IOMAP if HAS_IOPORT && MMU && !COLDFIRE
diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
index 16063783aa80..59233ebe3a63 100644
--- a/arch/m68k/kernel/dma.c
+++ b/arch/m68k/kernel/dma.c
@@ -8,12 +8,14 @@
 #include <linux/kernel.h>
 #include <asm/cacheflush.h>
 
-#ifndef CONFIG_COLDFIRE
+#ifdef CONFIG_MMU
 void arch_dma_prep_coherent(struct page *page, size_t size)
 {
 	cache_push(page_to_phys(page), size);
 }
+#endif
 
+#ifndef CONFIG_COLDFIRE
 pgprot_t pgprot_dmacoherent(pgprot_t prot)
 {
 	if (CPU_IS_040_OR_060) {
@@ -24,7 +26,7 @@ pgprot_t pgprot_dmacoherent(pgprot_t prot)
 	}
 	return prot;
 }
-#endif /* CONFIG_MMU && !CONFIG_COLDFIRE */
+#endif /* !CONFIG_COLDFIRE */
 
 void arch_sync_dma_for_device(phys_addr_t handle, size_t size,
 		enum dma_data_direction dir)

---
base-commit: cf72ff0dc9ecc711965604b4241314454d1f9ff3
change-id: 20260525-wip-bl-mcf-edma-7b402ae2f3f8

Best regards,
--  
Angelo Dureghello <adureghello@baylibre.com>

