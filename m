Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C47948BD29
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 20:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123720; cv=none; b=sRsgue3t9oACpYf9X81MEhDVVAHcgySKQpSUCIA+tw5hl3UvYkcLZTsiWqwdBXlLbtw0POt+jfApZiLmYYUj5tpKEEiIEOWKhowcLIxDIyHmh2S3H377oGt/JhCH5k1xvRWsFMosn3F7ab14tjKR/aJWAaU6piKpRtGeSBTxo8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123720; c=relaxed/simple;
	bh=dJzedjeiVUZZvYyRePQXz5ymJdk0khsi+RzoqP6SPL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EugdEX+vUElR46SvaiDKws8kde0wBOYQwXjKeIlPGcGzxlLLFlIa0qW8FKuOQ32sQbb7pjxNcK2kSSZ3IE2FYCOTEXQg/8P70QHflJpm7wWC2U5zv5cMJBBMo1CNYOpCNL/Ng/BwNuZlhYzSCi/TpatsTyva3xxNG8oPGm5pDus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=IgaUx1V4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="IgaUx1V4"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so59597745e9.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 13:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781123717; x=1781728517; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqvGT8nRbToe2huAj1fjYmy1gzrEv650bTAoZQ7pGZY=;
        b=IgaUx1V4cLegGDRJeSNapv3W28ygLHy5gXR9CvDc8K0vczjix9kprxhmDJdEzzie8C
         IpSxa8RdRuWx6UOdtWDoWCE/hPzw/sJlC8748JSK0vNr8gvmi0oR6+e6HtELs4M6lhql
         hZ5g3G5cB/GKMZYKHVNjifLtYeWcOgiAZQwxW2nkFXU4JKhClnKltN7fOAbZRruFis24
         8uzLHSLAwsDWXoUf7x7VZs7nWWrTatyaRhhVUmqkGb4SkttifU2yx25+ABL+XsN74Bpk
         xwYvMg9qbsFWIEzZmrbT3txTvuMGd7gB3Yc6Kea6fMESE07eE81bOaXmLBEhqmgTkONZ
         5cyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781123717; x=1781728517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fqvGT8nRbToe2huAj1fjYmy1gzrEv650bTAoZQ7pGZY=;
        b=oCiB9gS9xOcJ7cLIMyP9A+U7mXqXGJkGyLnvGyPeARi1CmTDcHADBKPsOIDHwqC0Ej
         EuRp3h8mo4XEB73bq++hg7OsbpH/1HtK6kf9HgzUOabaqHwEfxZ12ZBc4DU+1k1WcAcD
         zWkuPPV4kEZZh8SQppRhbj1SO4rdUoYEd+wbTlv145QywWCVb/j8xhR3etv+12CARhVH
         NNPSPs8q+COglVHqO0SbHQwWjRkbNXhda72E1lQcZV6KwNvpJR4ooews9vPn6WUcjaS3
         sCWiLSBz/p5mPO8g7Ldmu7CCOcRI3gnZEIuXO3RGEj14tRZAr4n1g+Xlp5BbRwZu+//g
         O1BQ==
X-Forwarded-Encrypted: i=1; AFNElJ806HCPvkBb52AhlpPtRd/GGMAL5YGKq81GSXYHwXEfVB/CQaiYHoFgFd5si6FiX6XB67V4uTDQopud@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxJ0if0mDdjZhX8i+LL3dtbQdAVKnwnXRR6XGIqFG2i6fdO828d
	R7II2WOwNA959o3bvy5S/wArYNFuJVs7TpcvV2fDoak27K4Br+lc9adEZbR34p7SfVI=
X-Gm-Gg: Acq92OFnAXyzMmcbQesY4SqGVagWWz0oPV8ufmLPM6xcgv+XNXl8TI1fsCZoQ2VdBBB
	tlaOTr9EooKqmJ+10/FAzNSjiIdF43bu2Qcz9YsP9CWt7Co9eLx7i3Us7/iV5Nas/82Flejxvy0
	AQMVjTkaAg/lW1t/ukefo2E1iZ0/LOx/azbQNRNbmFneNk7MwHugi2I4AkCDySol+OZu9XFjPCk
	YUODxCBHHCYOvHETnD9TwBoFVc36/oAi8os8P9Eh0LT/rRVbN//nN36z8QThbLWHY+YTkkN+Gp7
	URUFFjl0cN9WfqrkBmN+XhP+3CEFfFCPPRkebFnzZrpO+H7kUj574G1v9bJOeD6lBEoraBz+qe5
	66hgJANkujADN9VVMqbc+z424G6j9ig+vrIXjLHbg6CAfod/KH5leNOa0dBsYZ38p6euMEuQQdp
	Je75zBDuLPL2GRn5FgGQo/ha40FNAcHbrSN34qltxEMw==
X-Received: by 2002:a05:600c:35d4:b0:490:b8d3:5dcc with SMTP id 5b1f17b1804b1-490c25e4634mr451218185e9.19.1781123717535;
        Wed, 10 Jun 2026 13:35:17 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:35:17 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:11 +0200
Subject: [PATCH v5 06/10] m68k: stmark2: use ioport.h macros for resources
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-wip-stmark2-dac-v5-6-b76b83366d5c@baylibre.com>
References: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
In-Reply-To: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2

From: Angelo Dureghello <adureghello@baylibre.com>

Change resource declaration using DEFINE_RES_*() macros.
DEFINE_DMA_RES() is for a single dma channel, not a range, so used twice.

Also, some drivers assume IRQ resources are from index 1, so just to stay
uniform, moved IRQ resource at index 1.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- none
Changes in v3:
- moved this patch (cleanup) before adding new resources
- moved IRQ resource to index pos 1
Changes in v5:
- add linux/ioport.h include here
---
 arch/m68k/coldfire/stmark2.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index 9263b77bd09a..7eed6097f501 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -8,6 +8,7 @@
  * for more details.
  */
 
+#include <linux/ioport.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/partitions.h>
 #include <linux/spi/spi.h>
@@ -62,21 +63,10 @@ static struct fsl_dspi_platform_data dspi_spi0_info = {
 };
 
 static struct resource dspi_spi0_resource[] = {
-	[0] = {
-		.start = MCFDSPI_BASE0,
-		.end   = MCFDSPI_BASE0 + 0xFF,
-		.flags = IORESOURCE_MEM,
-		},
-	[1] = {
-		.start = 12,
-		.end   = 13,
-		.flags = IORESOURCE_DMA,
-	},
-	[2] = {
-		.start = MCF_IRQ_DSPI0,
-		.end   = MCF_IRQ_DSPI0,
-		.flags = IORESOURCE_IRQ,
-	},
+	DEFINE_RES_MEM(MCFDSPI_BASE0, 0x100),
+	DEFINE_RES_IRQ(MCF_IRQ_DSPI0),
+	DEFINE_RES_DMA(12),
+	DEFINE_RES_DMA(13),
 };
 
 static u64 stmark2_dspi_mask = DMA_BIT_MASK(32);

-- 
2.54.0

