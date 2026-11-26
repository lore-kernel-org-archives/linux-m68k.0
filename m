Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719104;
	b=VUSWH5/Om8oTo8pidInvfNBoxO6mebJ4m6yc6WWVicg5B+5DVq8teLa9ySzI5tt0fNx8
	 iFgMC46dRqOxwM52huN82v15BdBqkFTSoG6IAOtg20gPlFcx7R09WBa5RPf5OoJ9If6To
	 sHdXUl4e9ky38sBm8+txaIOpozhk7WbJ5nCVtB5ys+jYeVw3EVrnKcZGCk0dDn1XnfRnQ
	 +zd2Vv4uj5FbKGTG2w+y9/eJpTFel0iKxhVK87Xr5+0h5YU2dmQXVZG8BxSrakLikg0F2
	 o3EqVo18IsgRNcgyOFPbCF7O4lrLbPKSwV8RqJ0RRe1jqPDiLFTvO1uxtlTPrpiA88Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9op6aZg6wt9mYcZ/x9nGwKZlYrpFcKQlkp4PjEN5GXQ=;
	b=Guqy2YCGToKQCxxCUEW3VXdvypPMqUiI6EeE0K2XGjrZKKFagon9DfSUUMtcTqL2lz/w
	 wyVdjfnl8gWZLF7KP38ke78wA42mstSR8c+7K4UbKRA1+ID24pNYyKvbXZt4bolnxf0gS
	 QlkQ/jZmKbp4BmbxAmSA3NWfq4f5Lg5rQRKAYrBa54tKozO9x1RcBD6l94DC8BNYfmxUG
	 46fsLHFFRhyipra8CGsYPGSguSSjXKbHsVAj8Bx+WGV9PPBPz9aJWgVQEj8sHSO2oJInV
	 F4etnUrLRH3wEWa1Iv3EqLfQMB3NxlqRedeJXG4gQu57zsGlapEODXbzeRe+511KMZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=izSeY+kc;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054D8606A326
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 18:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 054D8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=izSeY+kc
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f0464dd6b6so45117745ad.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 10:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795719103; x=1796323903; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9op6aZg6wt9mYcZ/x9nGwKZlYrpFcKQlkp4PjEN5GXQ=;
        b=izSeY+kc0Q77XIQZEe1n6uSRfOIvN14RXJMEtHFe3PcGQNeHB/5nH2upuEj4pPY2vU
         IKv5oLx43PPdY5o3vKdl30a2SV9EFKnzqvoXacx4CLe+6GVH0B5mbwYbgO+HVcFSWrcm
         YIul+BnQsXSkFRUZMRz8C5YI4EoJcC5+PN1gy2DuQh8dZPb7t4wX/RDV8A9E3i0QLafD
         Uh53DkpfS4JSbCY+7ZLBhqu1BLdhgxtCeVrL9yMmvS61pLmAOc945QfCmACbDG4M/HKU
         7UGZtwDlI0efU8cG6Is+nNWFygNqHpH536OUwsaTE+7o7hpmE7rYLmCMYfWIXSL81w17
         Nv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719103; x=1796323903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9op6aZg6wt9mYcZ/x9nGwKZlYrpFcKQlkp4PjEN5GXQ=;
        b=OubivDIuDja8ug2xv3MZEZx5yB1Wfqr1tb0MAK0YpNdK3N7gnyg6zsMn1lYPwnKtAW
         m1NRVTns1JdES7rgrG617i27VI3cfxgq9A3iD1531ROPIgsErj8ibn6YITiguPSvQabW
         asrqJSic/oPV9MHCcBfj0mhsEFN42e14fSFszAsWrChuzAEHT6uIRfONltCWA8IXY/tR
         1oDo9KdYA7+LgyLhWSopQL/GmW/aN8WW7uxoajvI9T50JJM2vqNP904psDDVLpjwbXNO
         0TT9F8foPNuGrLRrbqcWYJ4XI8g6BTqr4kJyKpodEVonb/xeTAinmhvYZ0KGlFVGsiAC
         yCYA==
X-Forwarded-Encrypted: i=1; AL+hErExtrTHoFxFLPqvlqj3VYQxx4ENK+wSNHOsxmf67Ohr/NbuFn+mlmry4ns3ow29CLFkxMOUuOI+XCwu@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z8I9I29j+wkiQWMXSK/XCOtpFDvZK33tGz/UfSwWO1nCCnhrEx/
	0xQ8m/lNyKjPYSZspVJ1+djDHjkK1AfXWEZBgjBKYWFihKbwnqg0DbgqFXKnNQ==
X-Gm-Gg: AZFdTZdyy1nM7VAGrTMMkjD4/EPHecPS5LFhB1UcBWskTSBVh2D43veMJ/IhxWYMqHw
	G6YqED2bb1w3VxFhOY6GsXsDFU+IiIVQDtaZraPDmWyP18I19+zExN8RepEJwm8k9epIJe6MMTD
	2bxLEWBAFYV0yqGRXIRepETxJVAmjeY75Quws1C+uTTL80yjUrsWU7kDfqyfRkNYNTauNKntS2Z
	PKD++uPfgE0H3No4RnPllknFAMKbFVRmtR012DUmmhHw5mLnBJTLqv5RM3twX8fme4xR7SxHkW4
	Rr3cpw69FO92NeXRQNzP+qeep2BtOkTiIyeXWR0f1wWxs+3OHw0OX4gjjMDvvMc6AcqfDiv39hy
	KopwQSxnIBxv+ngRJHa3Ri39Vd3OOU884xLPi/BGDnXJjRht3eI8oSzQ4G1KRsQNQdzXtA00c3b
	p3Yp9N6twImEIKo2nlXHSo1Fyx19TE90sD/+V+kVTkufTeyCwNgG+2XO6wl1jF/VASRv1ip1JUt
	2tNniMN0+O9kyRt7NYZT+qm36Dcz8Rygy/wZBpoVKVBqosr4z9KT83i83YaKZCHGFsZkmH2q9q2
	o20GFtli7f9vbJ4v2K+yZtOpdq+acgkshghDz/xxusbysCPjhS4+q27KYa0cHuNr+PV8qYaJIz5
	dMz06Hc5AaSBMndCcticYjLtG
X-Received: by 2002:a17:902:db11:b0:2ef:e13e:779c with SMTP id d9443c01a7336-2f03ef873cfmr229125015ad.6.1795719103356;
        Thu, 26 Nov 2026 10:51:43 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1276c5sm112041665ad.67.2026.11.26.10.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:51:43 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 3/7] irqchip/goldfish-pic: Allow selecting CONFIG_GOLDFISH_PIC on other architectures
Date: Thu, 26 Nov 2026 18:51:16 +0000
Message-ID: <20261126185120.3815699-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126185120.3815699-1-visitorckw@gmail.com>
References: <20261126185120.3815699-1-visitorckw@gmail.com>
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

Drop the MIPS dependency from CONFIG_GOLDFISH_PIC so that other
architectures can use this driver, and add a dependency on HAS_IOMEM
since the driver uses MMIO helpers. Also update the file header comment
to remove the MIPS reference.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/irqchip/Kconfig            | 3 ++-
 drivers/irqchip/irq-goldfish-pic.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 20b77fbc51ee..a1c1e067022a 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -513,7 +513,8 @@ config MESON_IRQ_GPIO
 
 config GOLDFISH_PIC
        bool "Goldfish programmable interrupt controller"
-       depends on MIPS && (GOLDFISH || COMPILE_TEST)
+       depends on HAS_IOMEM
+       depends on GOLDFISH || COMPILE_TEST
        select GENERIC_IRQ_CHIP
        select IRQ_DOMAIN
        help
diff --git a/drivers/irqchip/irq-goldfish-pic.c b/drivers/irqchip/irq-goldfish-pic.c
index 12113ca90872..8d40df0e3a88 100644
--- a/drivers/irqchip/irq-goldfish-pic.c
+++ b/drivers/irqchip/irq-goldfish-pic.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Driver for MIPS Goldfish Programmable Interrupt Controller.
+ * Driver for Goldfish Programmable Interrupt Controller.
  *
  * Author: Miodrag Dinic <miodrag.dinic@mips.com>
  */
-- 
2.56.1.839.g22a8290db9-goog

