Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E94C38E8A1
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 21:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484888; cv=none; b=Mlc482uzPVUEb4dav5Lv/zJCxd2lc7cqq9jcGC2e0SoJO6DZgMTh9SjqE3bVBIqeTbdtdmydidGS9XvJxfnADgyTd1LNaxn28Tzc/y4kQpmnS83x5lE56VBWjFnzMD83UEBPDILzhlD7C5Kz7SbWgWlon3aJdTlKRt+3+o7t6us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484888; c=relaxed/simple;
	bh=iFBnWNy9SV4SAcwunY1yH81YlisibbWmCe18BpxZkj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hO/Jz+528BeIRKkWSiMeOYcGHnRXPQLhlwbYzizC3lmql1HCbQ2MSRhaK7exo2ii29eyZQAK0f/XLt7d1IvUyWOyfMWDYx81HOrDCoukE+B3O7fcM6tzk2fb/ovG3QVZICPthmzd6azPbLNOYPDpJRfWRR2UBBhQxUqOxiLMVJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Cgtg4u6x; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Cgtg4u6x"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49048e043e5so5875165e9.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 14:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484885; x=1780089685; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkH/fl0oDwirECp71YLEqMq9AkaqaSB6/Kul4n+Czac=;
        b=Cgtg4u6xcQ77PG8RUyqNOhbh4F6bru4TbW9KV4VSuvPJ9K7T+aMHj7G1XI92i+Q/mm
         HPr9xnMjX8ZRDBxbptpT98ZjZ0Owc12HB1gQ4baEBevvuxw4T5vP6D3q5KboIewxLH8P
         sYpVHUf8ThPPZHj7HR1bEEF2T3OXxXrsL2hCVOTW0HcnLZ4+50Cf07jBZ4L9jOcZqRuF
         2bopXSTlAmAoSi9rn4XDs6OKpl+OexaQLz1F+wpNvKgnqz7X/tbhJNAV3pQmUHULnI4H
         GLqGPl6RHbrf4xNgrLG1PscJwZ5RyGaa+nRHtLvS2zzk4ZdFcWdbR/pOhBWxwWdvsq41
         VyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484885; x=1780089685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VkH/fl0oDwirECp71YLEqMq9AkaqaSB6/Kul4n+Czac=;
        b=VLOlswTU7RG847fETYifCL6nBn6ojhl4UatKR66mQot365tNShjERo9FOAfoalSLoD
         aYHOFqZhSyGLbpgRFYC4zJyHSzg5B7QebJk2NXBu+tKgRbcICIUXtnEcjSom9cSJxw3Z
         PRYoM3us3hZuj6fIK3dhaSBdNf7BHkXJ3UdzGuV500YEzMEV6zQM/LNACeFWW8ov014j
         i9RgnGjvwOh5rCYyaItreHqtrNMyljwqTxSfxIeQPP55nAnZtAlx/o8DELTflvgCJzpk
         SaT5URPfXmEiJ95PMqi3cSFLPqmYhpeprVEqC/D8HqGlMuKhEkEgMWE52h7pXKOUxWXo
         iWcg==
X-Forwarded-Encrypted: i=1; AFNElJ8dT+m3hrxZ3vDLTsKaKqoHRPV84HiCFbrYFLaAhQgmAnsI8lNP5oQWw9EpNTFU6U/c0OCWPWw0ahlt@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzeyMDvqlcY8vvPRO3NWqosqx48RGC/ejtdqiteJGtNFWlRYg+O
	MD+sufFd2rq/kdKaqND7DFpSs+344v5UB7vbQLMoOKXpjoiqfEpvs7xk26GKQ81ZOyk=
X-Gm-Gg: Acq92OHsJbP+CBR/rP+ua3dBLlwRbbRcEuEnUrMq3bEiZ6hX/+zOymeYcRgPTeRGAYL
	S361/kwdFFazsW/4oUUDEvZ4tYXNqiKiGNkefvxg4oF04CgKXlp1/4CrqxDjQSUsB+gFL3bq7CA
	gYK0nkj1dLw0q8MO6/8K5Zp0qTFsSuRCZ+l5xUPXewSnFc5xIXgbJ24RV5nxC4QnFvySa7cYi9/
	Nzc6fl5+NEWywp9J3+9wWZpjR+Qefrj9anp/QX7VdiBcnuZUK8ruxz7wwDwi0EJFH1VeWR+vwVz
	6zFztlY9IDvZi3c6VLSTwGNjqNuDNNrMt5Zvp2vrul+0q+GQdDb6ul2DjnX56HyxXDtqG4vZB4p
	VxLFQnoHv/ShzbAWqT13kYNGNl3v66fBtIGtrolnORpM9d83CCrTNjenew7f3G5KtYXH6efxltG
	RHUD6+1h3bUNAqLWpA4Bj8e/XuGJr3WgE=
X-Received: by 2002:a05:600c:1c0b:b0:490:44eb:c1dc with SMTP id 5b1f17b1804b1-49044ebc2e0mr79758455e9.20.1779484884911;
        Fri, 22 May 2026 14:21:24 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:24 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:36 +0200
Subject: [PATCH v3 08/11] m68k: stmark2: use ioport.h macros for resources
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-8-16be0ad35a67@baylibre.com>
References: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
In-Reply-To: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
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
---
 arch/m68k/coldfire/stmark2.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index 9263b77bd09a..536252ccb87e 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -62,21 +62,10 @@ static struct fsl_dspi_platform_data dspi_spi0_info = {
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

