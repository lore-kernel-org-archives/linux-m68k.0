Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592D139E162
	for <linux-m68k@vger.kernel.org>; Sun, 16 Aug 2026 07:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786865887; cv=none; b=Hjk/h50NdGNpBg8kxEE0p1T2THqnCQrMoRrUZW8FmjcXzYBUVnuxQ+5gZDA74FVhm5DHnG4hr9HB2CDVbZxttG7F7oaonMN7M9wYUSQ5d5c/ZA/XqkT7vgeuWv8rsjXTMGNc5wfGhQgg5Jf1Ts4S50IyKSsnsGwqONHZJX+q4tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786865887; c=relaxed/simple;
	bh=xK/dS7GP0N4YcrW74gWzFN7qSvvVt1cHb7fnCoWrn9k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=MfdcYdY7koP7Ilnd7Ms3359vI3ADgpJG+Ox8wTm3vItalqy+NDmyIabTwjmLanOw47GlPIf44xPVQ5eY/nUcalrElRz696F/LDIBSpeZ562lwx5i/UsucKy+b8vampNEbvjmMcMpS4vwdRs7hSifQ1v1qG0KdvG47SqOgbz2XI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKbmYhSn; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKbmYhSn"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso1424627a12.2
        for <linux-m68k@vger.kernel.org>; Sun, 16 Aug 2026 00:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786865886; x=1787470686; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2g1mQ7kLrTZ2GkqBkSOvlcPi9ttUl/TP3eTqWq0Qsqk=;
        b=HKbmYhSnH1RCBTrV3NTt9FOTmfQn1U70WBbJOocGnulvvZBFVkJXgNFcf5luO8BYWc
         NKsbSmzXudjjEe4JG+ijI2zzPfyUjnQGmF0dWIIJ8vh5Z3AQSpxMVXGavbQAYtFKfo7p
         FPJp1HBN6gmrD7HpA3w4HuKNlzDJTfSHex3PdFJwy10bGNbhdFyh4uW6xf6gMgng3gGY
         1cGg0JosP5khI/F/q8iMHlqGJMRlvYPRBwtpSK7pTN9WORbj9HAuvSlCftHUFvq3oikL
         I4Rorv6CjV6norsXJ0s+NUs6SIRgpk9/zbVVbjiEhfJRLYa73h1cnEV09DfFSbORHkWn
         QmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786865886; x=1787470686;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2g1mQ7kLrTZ2GkqBkSOvlcPi9ttUl/TP3eTqWq0Qsqk=;
        b=Ue0vO8EmahrrcVdwd45gjr82sNbitkDfMZQgFIkDRQiv1qVTp7dcgRQYk+wyy19CkW
         0eOL60hyBamhBAh7jWjWxPb/P3ED7oVZP06nR/33vQ3J4tgTPRr9MUfHH3/AQ+mS5HAw
         2g4s2L0xHNodqpW3UQZXEteAOUssqrLGVdIpovGKXdecOdH0V8xcft+w0/o3lZqq+sB/
         oa43DUCP15MEOjL3G/t0DezliRDxRVapUbj8o+a7TPXu31mkHbcLLuZgJQXIU3QV9kLW
         BNUsWTvGRCmLF3G5YfCAMPNC2oLO7hSmQTGJuxzDS65VEWjKkuycEVjKis5dWcckAjdv
         TB0A==
X-Gm-Message-State: AOJu0YyRxckAd9UuVKSJosb1m+wpPITaAMRpA9ROwRhFxNw6foTgoUyf
	unPJoYv1aJDoK4FqRk0lDH+A6HJA2sv7B0ownCZ/+fArfAIwfavpKcVQefrKEw==
X-Gm-Gg: AR+sD12dknJ7tQTCyHYLc9jmshO1d9QBeVeNX12idof0/m6VrU7bM1Avw7korfyPY0G
	+e+S9evIDrjjhu8cqAe92i+vIC1TTmVy5u+E+8+QPNjCUUNyYO+kXCpgpb0kltAihceUJ3nkALY
	mj+7RsC0VZN942mlqd7REaiERfdCvj/u8xQysgBUMUFS7MMsBM6LRuWMCb/PYt154sbFllGqdao
	Nc3NTNdZ0AKXCEATiv16Cv+mv4/sgAdtZLX7sQPrsYuAoFJ15AZEBiIGk2k/N0GWkz9vXVCs9R+
	yy4N1L9a1xi1R+KK2gHhTyJTw7q9JQ9prAc1eWBzNRw0Jq+g9CBvr+KhHtAvO3vmkSoz/dTSZf9
	ATr+imkWp/IU8UXJ+Uo4n7pDAIyXbOA8P+twQaXhxpt+eKCnQhnMUaxDKqYKZ62N5oNH8Uml8Jy
	2i1E9DyTjPy7wpsVgAzfy+1IINKJeSijTLos9ytHZmPL9k4bKst3CLYdsoHUYW//d49AaHVjfmI
	RNdL/sfmCsKzOq3sG5B7YjY1/FsCYk4IKZfCUeyIGiyvqQot0Jsig==
X-Received: by 2002:a05:6a20:72a7:b0:3cc:4f34:3733 with SMTP id adf61e73a8af0-3cc71a6804bmr16748652637.10.1786865885460;
        Sun, 16 Aug 2026 00:38:05 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-170-159-fibre.sparkbb.co.nz. [222.152.170.159])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc08f3aa2bbsm2175041a12.9.2026.08.16.00.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 00:38:05 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 989383604D5; Sun, 16 Aug 2026 19:37:59 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: schmitzmic@gmail.com,
	Miro Kropacek <miro.kropacek@gmail.com>
Subject: [PATCH v2 5/5] m68k: Add support for Svethlana
Date: Sun, 16 Aug 2026 19:37:52 +1200
Message-Id: <20260816073752.16656-6-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260816073752.16656-1-schmitzmic@gmail.com>
References: <20260816073752.16656-1-schmitzmic@gmail.com>
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
---
 arch/m68k/Kconfig.devices         | 12 +++++
 arch/m68k/atari/config.c          | 74 +++++++++++++++++++++++++++++++
 arch/m68k/include/asm/atariints.h |  2 +-
 arch/m68k/include/asm/irq.h       |  6 +--
 4 files changed, 90 insertions(+), 4 deletions(-)

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
index ee2d061efb2a..84317e0f447a 100644
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
@@ -892,6 +949,23 @@ static int __init atari_platform_init(void)
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
+			    (__raw_readl(sv_version) & 0x3ff) >= 10)
+				error = platform_device_register(&svethlana_device);
+				if (error && !rv)
+					rv = error;
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

