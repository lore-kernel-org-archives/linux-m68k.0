Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC243E49C7
	for <linux-m68k@vger.kernel.org>; Wed, 19 Aug 2026 22:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787178541; cv=none; b=gE+6nHt1Mgx0xpRQoF7mjBmHamVjvRur0xN2kdyjyrl3q4QC+DK7hoQwLAjMx9S5B3+2WIDua9jecPTm9YOS/6f9wZX9Icl48JNFc7lRnagivJnanzpumhfd65QDGxzCvpU3Kf1ffuhjrR9prO8bqX1wbf0V78cE6R1yEFho9/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787178541; c=relaxed/simple;
	bh=O/uyLOadIholZXFOREBx4GrNlW2Vw+MN068Dd5A+TtU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ttD5d3ImBpc+emWpaa81BhHsnYjmfN3fLpWHyOvgC4GMft5D4+YxHFmgLwtAdeHZHxpNXP/v6Vs9JfXm3p617PgFqR2oFE5OJ80fLuu8o3Mrc3SMCRmxpOoik9EUuWuKeAb/Xow1ijs3AeLPWM5NMjPqLlraWyNUgq+iPnZj1h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Odi9PQbN; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Odi9PQbN"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1418734a91.1
        for <linux-m68k@vger.kernel.org>; Wed, 19 Aug 2026 15:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787178539; x=1787783339; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OmhL5zFvURE4Kevu7PUkEbrSC1a1J5jCL8vn+lKJFYw=;
        b=Odi9PQbNzXvGXLd6ZSqRB37rYwxNtPW73mWWnLlPC3TcEV/11pqz80XT4V/jiXJ/0I
         pblDw6TEoM/VC+QXJj+5o4Dbs6qoHruIRrmMfwDOLWPI5yWGMZGVxZlwzK6QVDKvGL1i
         m0kvR6q5NHZz1pOmejLrLwiMd5ZKiMEqIGHgJt2GE1Ur+O55U1MSmiaEhcr9opOJZ+oX
         VGG/t5fIg2VpH5ST3zc657XwBaMshKJ5Shzw2xqezrrvcTtNGuwPL70K9PAi+46G+hsc
         e/64HVVvCFfyfm6OZvM8VLoNtlz+3mn3HZa/o93s0jd3uqvcDCIF1TrABkBW5P/OBKZZ
         EWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787178539; x=1787783339;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OmhL5zFvURE4Kevu7PUkEbrSC1a1J5jCL8vn+lKJFYw=;
        b=XH0AbfFf3ACrexSOH4o69wZLnpIx16UZQguET/i3m53ZK4Y71kIPrE6P1L1pMWIqz/
         6mjIfTxtb2fx4TUDFfSKD0avnsNqgDkGci7RaqznWmY/m7ECewOgIuIBm9REA9yFl4ok
         /7++BtyP3xKLMQasqT+yqeUt4e+4r08QJTLoON4TufueK7XljCTv8dlwxc3NsqMCvOaM
         PqdkCHMTUL3+Bo7E70IdcNTMRLAxSXjuOQvP9Lq5zqfqIyL/nLRqPB2t9CYG4D2+Y887
         OxSaKJ4Kl8UugIF/8Iufg25IewU+BtHbxG7WZhzfLb5DlPu4cek1LsBAiSkO6ctWQLvy
         DSqg==
X-Gm-Message-State: AFuF++lsAM6//lYL/ehC76VlC4LtHPtgKo5Lr8+XP03TfwN2YhMc0jmz
	NvkCD4ooami7/c9fHzVPtVuIOfyLhs1dVg/4Drfs/R0w0VaSmKKlY45u
X-Gm-Gg: AR+sD13rnpye/z6ojfUnAw9SkyYOn8NtQNKuPA3xWYG7J1iSFAbBx76GVBJtZzGICS7
	UpZ7qSrZ8pNTqk6sg9l9+IXGCarcqpWtcmEdoD3Jej2dACivfPMYrZvj8rkulMPBAyPt08NmHyI
	mGD+qU5QNGhU+EC3ROZngnK6IRlcuFTqsBQF9imKCMNi1fGdQI7SAQBwn8Y+z+nGyRelocei6Ub
	2/oZgDTYiUeiROgs2qKMRBNcxJtNCsXryS2oI5gRYciPshbLSxWNpLSzPiB8ZimjA+MW6jEqwmE
	e13VnQDfSVNPgapRqxHuoJJiyfnUR/67RzN1lVCdQ7YnKHoXkMiq9TCSz1eNlvpmO4b+L6QvkAP
	u+W4HNIYgTKcLgs6PRZykMs1NzZng5QDXdjJmUfHY5LLoBCEmQeVLy3dkcwTYE+MWqwhdbWEctg
	7S7B9WGxLZlITYFJ5jWCzgR/JsS1lHf3oR4xjwuxs42H6cWJVk4TWxc2/PE05iXy6XvQxce1v7m
	b4U5met7u635XEEx13CbZHcCLEkEnSuNakzqnzt6qjryWD8ZX6yH6twoDc9
X-Received: by 2002:a17:90b:28cd:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-395812a8b7emr15280182a91.6.1787178538564;
        Wed, 19 Aug 2026 15:28:58 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (122-59-250-182-adsl.sparkbb.co.nz. [122.59.250.182])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae143edsm18727230c88.10.2026.08.19.15.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 15:28:58 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id D179D36057D; Thu, 20 Aug 2026 10:28:53 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: schmitzmic@gmail.com,
	Miro Kropacek <miro.kropacek@gmail.com>
Subject: [PATCH v3 5/5] m68k: Add support for Svethlana
Date: Thu, 20 Aug 2026 10:28:38 +1200
Message-Id: <20260819222838.21256-6-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260819222838.21256-1-schmitzmic@gmail.com>
References: <20260819222838.21256-1-schmitzmic@gmail.com>
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
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html

---

Changes in v2:

- fix svethlana platform register error handling (Geert)

Changes in v3:

- fix mistake introduced in error handling (Geert)
---
 arch/m68k/Kconfig.devices         | 12 +++++
 arch/m68k/atari/config.c          | 75 +++++++++++++++++++++++++++++++
 arch/m68k/include/asm/atariints.h |  2 +-
 arch/m68k/include/asm/irq.h       |  6 +--
 4 files changed, 91 insertions(+), 4 deletions(-)

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
index ee2d061efb2a..64fb1dc6a58c 100644
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
@@ -892,6 +949,24 @@ static int __init atari_platform_init(void)
 	}
 #endif
 
+#ifdef CONFIG_ATARI_SVETHLANA
+	{
+		int error;
+		void __iomem *sv_version;
+
+		sv_version = ioremap(ATARI_SV_VERSION_PHYS_ADDR, 4);
+		if (sv_version) {
+			if (hwreg_present(sv_version) &&
+			    (__raw_readl(sv_version) & 0x3ff) >= 10) {
+				error = platform_device_register(&svethlana_device);
+				if (error && !rv)
+					rv = error;
+			}
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

