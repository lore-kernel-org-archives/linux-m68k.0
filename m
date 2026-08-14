Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B027326FA60
	for <linux-m68k@vger.kernel.org>; Fri, 14 Aug 2026 03:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786677481; cv=none; b=NXws6hSN4yvivXz7iYsFsr3aQND1zpjDBipw3GKU5mpp3UjOgn1CarmNgvbsfNjDTAtVF4ETK0NZcH5OoN4v9+KmxOecdtUT+U4wv0uLZu4eqDXaYBWm+4mBxADDmnRrCpKgay0NBiED9kbFG2ZcAkySoJhUCU6Z5zTsBDZe8TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786677481; c=relaxed/simple;
	bh=Xr8ia8WJL/YURnXPLk9+0d2cIwEhZr0NwO5wva9d34c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=LwpC5CBJtCbtoPLrqbp85f0WzQuBrkZ8t9Beg8oFZ64GtUy6+7md69uuDinrI9Jq7A/kLmfWbCTYd/boZxW2V8oE43kn7ueCTxCUBN3BL/i4iX6OOLmXnr0TMwW1vkOTk/Hl41wVjxoHOZy8yu7yZGVmPCH3dlyEC+qzaQl6sVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kqtaN3cK; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kqtaN3cK"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so416249a12.0
        for <linux-m68k@vger.kernel.org>; Thu, 13 Aug 2026 20:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786677479; x=1787282279; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YKDPy/LxEO2NVElPbmKidRkQxBYUmhdseW1CDs/g+/I=;
        b=kqtaN3cKDiuzHE3dlAPDIMZM0pIOfTuo8dDinyMfLv7Q/cs4mA6pH8RNr6WsVzIa9o
         aBdao6A6KI4KksZFegPv3NRjmqmG1j+HJDLcGDcDOcRJdF4EWv67ocYOs24guTbKXHow
         BOgqcNiY1IoO6QtR1R9rz5JirG6zBCBpIm2YP8O97RPYVowxH+CZ73jEOHTYwRS0mK1r
         0EyL9J5qT+MYEHDYe0bc2tDkU8y9fmOCWmIBHqgDJoaaoby4rhbJ2Bk02Xi+IUb2duEs
         U7dgnSEZ2eRpgUdhMPqzCT3kR7O1/ZxLgWRWjYB0ZnTX+ubCrc5XP+/6uewfDeO7Qu4x
         Zq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786677479; x=1787282279;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKDPy/LxEO2NVElPbmKidRkQxBYUmhdseW1CDs/g+/I=;
        b=RwqpscA+Lg1SCkJrAZ5MJg2KPVqmIF7cP4LCixLse8b6Doli5upQPRLU5r5rCNqSE3
         2elnOts2zB0tWOzgr4K+ssRkgeDv/MhnYRmPBPwSc9kPEm39Z2Rua/j4NQBUHxO2kGMM
         oIcsM2yoc6vx0rUk5djxVCp+Yc96tIOJbrC/M4QvZUbO3Ko3aT+ZFCVJvNO1d1jySCvR
         CY5HlVhEQ8YB69HrKRMBLoPJCkaUFH5+sZsml7+E+2ATxxHYCbtlwcu3zUoK7RlrptP9
         +ByA7p4v2J0kv21ezZWMi8rmUFjT5e0IvICwKmeWd2Cz43kQo/ngpMVyb+RgEjqFv4J1
         ST1g==
X-Gm-Message-State: AOJu0YxeGTor0l5iIk1nfG8hBDilW5Gvr4ThuxEEdmXWAKsXZfmwOKNK
	NhpcMhLPgvOdcmTE2j3j/8PkitX5pcQ4Db4MWj3oNojnUZSd3qcSEyKT
X-Gm-Gg: AR+sD12MolFznJObtW601lbFzdTAFglgTvHB0M0SnGUf76SX9axGC0tapOjt8+TYvGX
	cYYwSAFxoBJRT6FpHvaTmfNwCPEznUCND0k0oQaG/DDeotiNiF0zQN6f4MIeH8aj4X/QrEoI9AG
	ycpyaM2VutMnmFQIt6rIaQtzm5klfIbfmEVEV3SZ64R17P7oJH6cL/E8rV6miwDMkiDVG+GvAKH
	U0apPCGXk47+/J+kNfqxkNZBQ77WPdXFWt4J0bMov8SkyeVTfqYUxb120LN8sOIpFa3ihruZdIs
	YuyE7zQ+P9AZgKqOlQqb5PmhrVRpLIXZjS4Q5DrmoeaocwgAFvUbe7ujhKArSTfUhQnzQTGVtWA
	63tvTicbBlNf39Xk207kQftP0bfELDaAVPb6ImCVAWNwZXtX3RkpkQJueCwAOnUtyHcz+QNMNJn
	Q6hgeQAXuPRiP/Pl2AeNVJIriIpZvTZLgfkvljU211AZSCM+1NCnDC5T1kDiGni8Cb4BX8tth4f
	W63IoX+iYs3TARgMdiscvhcwkb4cHHMoaDaX9oUSXzqvAFeusmNFQ==
X-Received: by 2002:a05:6a20:2589:b0:3c3:8d86:9856 with SMTP id adf61e73a8af0-3cc71b3eaacmr2693304637.14.1786677478938;
        Thu, 13 Aug 2026 20:17:58 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-170-159-fibre.sparkbb.co.nz. [222.152.170.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d8casm14990225eec.3.2026.08.13.20.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 20:17:58 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id E690D3604D5; Fri, 14 Aug 2026 15:17:54 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: schmitzmic@gmail.com,
	Miro Kropacek <miro.kropacek@gmail.com>
Subject: [PATCH 5/5] m68k: Add support for Svethlana
Date: Fri, 14 Aug 2026 15:17:45 +1200
Message-Id: <20260814031745.17140-6-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260814031745.17140-1-schmitzmic@gmail.com>
References: <20260814031745.17140-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

From: Miro Kropacek <miro.kropacek@gmail.com>

The SuperVidel FPGA contains an OpenCore ethernet package. Add
platform device data and other necessary definitions to support
this device on Atari.

The ethoc module must be enabled separately by the user.

Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
---
 arch/m68k/Kconfig.devices         | 12 ++++++
 arch/m68k/atari/config.c          | 71 +++++++++++++++++++++++++++++++
 arch/m68k/include/asm/atariints.h |  2 +-
 arch/m68k/include/asm/irq.h       |  6 +--
 4 files changed, 87 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/Kconfig.devices b/arch/m68k/Kconfig.devices
index e6e3efac1840..48f964d1615e 100644
--- a/arch/m68k/Kconfig.devices
+++ b/arch/m68k/Kconfig.devices
@@ -67,6 +67,18 @@ config ATARI_ETHERNAT
 	  To compile the actual ethernet driver, choose Y or M for the SMC91X
 	  option in the network device section; the module will be called smc91x.
 
+config ATARI_SVETHLANA
+	bool "Atari SuperVidel SVEthlana Ethernet support"
+	depends on ATARI
+	help
+	  Say Y to include support for the SVEthlana network adapter built
+	  into the SuperVidel FPGA. SuperVidel firmware version 10 or newer
+	  is required (older firmware lacks the Ethernet DMA).
+
+	  To compile the actual ethernet driver, choose Y or M for the ETHOC
+	  option in the network device section; the module will be called
+	  ethoc.
+
 config ATARI_ETHERNEC
 	bool "Atari EtherNEC Ethernet support"
 	depends on ATARI_ROM_ISA
diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index ee2d061efb2a..86f07d0b85e0 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -34,6 +34,7 @@
 #include <linux/platform_device.h>
 #include <linux/usb/isp116x.h>
 #include <linux/module.h>
+#include <net/ethoc.h>
 
 #include <asm/bootinfo.h>
 #include <asm/bootinfo-atari.h>
@@ -748,6 +749,62 @@ static struct platform_device *atari_ethernat_devices[] __initdata = {
 };
 #endif /* CONFIG_ATARI_ETHERNAT */
 
+#ifdef CONFIG_ATARI_SVETHLANA
+/*
+ * SVEthlana: OpenCores 10/100 Mbps Ethernet MAC in the SuperVidel FPGA,
+ * handled by the ethoc driver. Requires SuperVidel firmware version 10
+ * or newer (Ethernet DMA).
+ *
+ * The MAC can only DMA within the SuperVidel DDR RAM, so the packet
+ * buffers are carved out of the top of the DDR; the framebuffer lives
+ * at the bottom.
+ */
+
+#define ATARI_SVETHLANA_PHYS_ADDR	0x80012000
+#define ATARI_SVETHLANA_IRQ		141	/* vector 0xc5 */
+
+#define ATARI_SV_VERSION_PHYS_ADDR	0x8001007c
+#define ATARI_SV_DDR_END		0xa8000000
+/* 128 packet buffers of 1536 bytes each, the maximum ethoc supports */
+#define SVETHLANA_BUF_SIZE		(128 * 1536)
+
+static struct resource svethlana_resources[] = {
+	[0] = {
+		.name	= "ethoc-regs",
+		.start	= ATARI_SVETHLANA_PHYS_ADDR,
+		.end	= ATARI_SVETHLANA_PHYS_ADDR + 0x7ff,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.name	= "ethoc-buf",
+		.start	= ATARI_SV_DDR_END - SVETHLANA_BUF_SIZE,
+		.end	= ATARI_SV_DDR_END - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[2] = {
+		.name	= "ethoc-irq",
+		.start	= ATARI_SVETHLANA_IRQ,
+		.end	= ATARI_SVETHLANA_IRQ,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+static struct ethoc_platform_data svethlana_platform_data = {
+	.phy_id		= -1,
+	.big_endian	= true,
+};
+
+static struct platform_device svethlana_device = {
+	.name		= "ethoc",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(svethlana_resources),
+	.resource	= svethlana_resources,
+	.dev		= {
+		.platform_data	= &svethlana_platform_data,
+	},
+};
+#endif /* CONFIG_ATARI_SVETHLANA */
+
 #ifdef CONFIG_ATARI_ETHERNEC
 /*
  * EtherNEC: RTL8019 (NE2000 compatible) Ethernet chipset,
@@ -892,6 +949,20 @@ static int __init atari_platform_init(void)
 	}
 #endif
 
+#ifdef CONFIG_ATARI_SVETHLANA
+	{
+		void __iomem *sv_version;
+
+		sv_version = ioremap(ATARI_SV_VERSION_PHYS_ADDR, 4);
+		if (sv_version) {
+			if (hwreg_present(sv_version) &&
+			    (__raw_readl(sv_version) & 0x3ff) >= 10)
+				rv = platform_device_register(&svethlana_device);
+			iounmap(sv_version);
+		}
+	}
+#endif
+
 #ifdef CONFIG_ATARI_ETHERNEC
 	{
 		int error;
diff --git a/arch/m68k/include/asm/atariints.h b/arch/m68k/include/asm/atariints.h
index 6321c4495620..cb15361d14e9 100644
--- a/arch/m68k/include/asm/atariints.h
+++ b/arch/m68k/include/asm/atariints.h
@@ -32,7 +32,7 @@
 #define VME_SOURCE_BASE    56
 #define VME_MAX_SOURCES    16
 
-#define NUM_ATARI_SOURCES  141
+#define NUM_ATARI_SOURCES  142
 
 /* convert vector number to int source number */
 #define IRQ_VECTOR_TO_SOURCE(v)	((v) - ((v) < 0x20 ? 0x18 : (0x40-8)))
diff --git a/arch/m68k/include/asm/irq.h b/arch/m68k/include/asm/irq.h
index 2263e92d418a..8bac43d0f49d 100644
--- a/arch/m68k/include/asm/irq.h
+++ b/arch/m68k/include/asm/irq.h
@@ -10,8 +10,8 @@
  * different m68k hosts compiled into the kernel.
  * Currently the Atari has 72 and the Amiga 24, but if both are
  * supported in the kernel it is better to make room for 72.
- * With EtherNAT add-on card on Atari, the highest interrupt
- * number is 140 so NR_IRQS needs to be 141.
+ * With the SVEthlana adapter in the SuperVidel on Atari, the highest
+ * interrupt number is 141 so NR_IRQS needs to be 142.
  */
 #if defined(CONFIG_COLDFIRE)
 #define NR_IRQS 256
@@ -19,7 +19,7 @@
       defined(CONFIG_SUN3X) || defined(CONFIG_VIRT)
 #define NR_IRQS 200
 #elif defined(CONFIG_ATARI)
-#define NR_IRQS 141
+#define NR_IRQS 142
 #elif defined(CONFIG_MAC)
 #define NR_IRQS 72
 #elif defined(CONFIG_Q40)
-- 
2.17.1

