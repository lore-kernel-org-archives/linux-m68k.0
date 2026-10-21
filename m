Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603758;
	b=cBxUk9Eit7PU7St+054aUXb/mt9zIkBk4VPbjJl8VgQMzptNsIgz5iLFoftH3uqryn2T
	 xxpYhkx3/6Taa5w0dQmvAdGDI7034K1IPtE0i05dUjsfBXOrvEzwib6GumTOGi4Hul7Fu
	 oJAUf0cNAwc5hGmIjIHQy/YNqHMnrIpnMhdhi/loe7wdzolmO2u6x0Ku/WQnDqY3+1Lts
	 9foMuJnmbUA0XnoZvZcEHgO81aekYqN1v4QmwXTH42j5DX0eqPqfQWOQYwYhqk556uwFo
	 UfDI3Hv6zFnyKqoCINbYHQQmrdabmVR3dlOvcPzxR68ZFuJ5jvNVYBLu2dkxIQxWUxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RF9Xhm2ZNzwfVYjqiPV9LG39fgypWtMaGNQsrUyfgoE=;
	b=TvsJ9Jx3ntKjQIAd6jhARjFfKEws7y2tIVhfPNxwFcY47CIZgLMzp87supgZn1KMSnZp
	 jGSUmPzXcE9xFEv7n9qhLKlcO9S2ExFAQIiPOL1SVlel0pcSkhZLAUplw5E6cfviGfGdi
	 ReILDNNS0EAO7nh/2ykezQFJP8ggtcxunVx0aZYvw2MI8k76JOMfoEMS3InzwZk4MoPyC
	 oQxpLOoXwPfhIpS58NTbPGcIqr2VqBKsm0AcSi0jJYUELMVuGT1iukn6Vrp/NwJK+GHFX
	 jzduXaYRjky2q801+GcYKLwXKUOKKgLaaEidUJ/+I6g6sDSHhasz1k6K9Ih9h9UEC3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lB9LJs9l;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA916606A32F
	for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2026 17:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA916606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lB9LJs9l
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso776357f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2026 10:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792603756; x=1793208556; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RF9Xhm2ZNzwfVYjqiPV9LG39fgypWtMaGNQsrUyfgoE=;
        b=lB9LJs9l664f148xtTGEVXp4Ch+1QmUmcOLwcCmuhWcJsZCaJzMzYNeDw2av+frQa6
         MQbcrBPU7yODFoRpqPHPt1HkNJydqNVzRQk9/glVacw/PUBCVLsB1PJFWCxfDanoSj4F
         +ocxAnyet1HS1qgGkD7YCt9YNCOUMGK++h+q/hxbynnWL6tIKz7VBrYCp7iWrf0teNss
         x4dE0UyeLx6AjILBUgsO1GNLIwS2yB6Mfs9IJO+8bgRWV18teR/0craxajurTa9VWECN
         8wwsyoAB3BvBH4TtT5FpAWjzdsAZX4s95ThS5IyAOvbYwtLAE4MEFuhqiiWaDO9mDcAt
         ITnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603756; x=1793208556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RF9Xhm2ZNzwfVYjqiPV9LG39fgypWtMaGNQsrUyfgoE=;
        b=X4xJvHvN20fgm557z4v/49lbUUJlk7cTLsAwJNm5rkicaM9cubUx1Jo3WPQPjwoku2
         Fy6un8vPr7pJHqp4hRSDXVp+IQAR6FOoiYyWoq0uEDqLYBEoUXF7PZBJwkQPC48khlE0
         P1+b7daUJUDlL4HTj1xflU2NZ8FZBv9N3Og5N/xfNHK6SzMsoeVYQ3yiXbKMVirEztwu
         yuEwYqSw6smgxS4ViD4NvzE8lhvNZ89QlH/o7Lt20yCs0PmYb+yiJy739nWv+fixJFTS
         bmO4faqYoXl+t3yOFN5olp8p7LFjEVdEMZMQ+6zyfOdihHYpP2PWhfcG6HFCbGx8rbRZ
         DRYw==
X-Gm-Message-State: AFq9FYIBKjvE+uOdzleBcchEyHtbdZNbV/zeTyeYGkm7C5bIkQdnq7UL
	l2n4NT866vb7ml8+y04q4sm/tZl22l/RA1Wg1vL7M0MlZYRi/axNC1zRNEvjhg==
X-Gm-Gg: AYBFou1F4rtD9ha3DCCze3lDnZ0dTzlepu7e84mGnZMDw7MO1hm934m98ui7OEoOF/P
	eRTprbVyqg4WgvR4jce4Biv5mB+boxFqQrbzQ4qALF2BR2JMreWsd3Sj4Q8QJUdkORkZkNSsZ+2
	lQD7iUHf1iUR1nEqwOIZ7XwLGmfKfXbYi/JEVyj4CIVRr7Z0xT5m2RcNlRjdq/65dU/wMC8tiYY
	eogf9NzPUQ6F3eaGMTawc+SC/UPWHiZSQjl5BFZyPjoF7ohxbb2wGER4Mvuykj+56/138rKowRv
	l4nHsQqPXvo0Ae9hMkIHYnAIhkQdugGXmmEeeVcTVmYAMiQxswZVMNK5+yC1Ax/rXRnrTpiJ4mJ
	beSPg0gHmFCCwThKJw3Ow2A2vEf3m60n9Y4L2dTupFdVRwe7iKTw8Xz8zNoQXhy9Ju9T9wAZIzB
	j41X5vG1Y43XzkoM4xi7NnQxFvjaBZ6hZqEoFnonDHZfHnYFiMFZqZbITQzIb1CtQDsMMqf48CF
	srSZfkr3/UEUowvz77aVyozjDn5I7fqEl0/m6hu4Dfocq10ugfRW0KzQTtypsN+hBD3FyFy3r17
	hztZmRHUhIxR2hLSA3B1N+BtjwNXkcVuedASXnE=
X-Received: by 2002:a05:6000:2f86:b0:48a:f36d:fb57 with SMTP id ffacd0b85a97d-48e264a1f8cmr5500070f8f.18.1792603755657;
        Wed, 21 Oct 2026 10:29:15 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:6d99:38f4:72d4:7bf7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cbfsm6793950f8f.23.2026.10.21.10.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:29:14 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [RFC PATCH 2/8] ata: pata_cswarp: bind to the Warp mfd cell instead of the Zorro device
Date: Wed, 21 Oct 2026 19:29:04 +0200
Message-ID: <20261021172910.134838-3-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021172910.134838-1-p.pisati@gmail.com>
References: <20261021172910.134838-1-p.pisati@gmail.com>
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

Now that warp-mfd owns the device and hands the window out as the
"warp-pata" cell, take it from there.

PATA_CSWARP depends on WARP_MFD from here on.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/ata/Kconfig       |  2 +-
 drivers/ata/pata_cswarp.c | 48 +++++++++++++++++----------------------
 2 files changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
index 9704ed688775..407b79bf9405 100644
--- a/drivers/ata/Kconfig
+++ b/drivers/ata/Kconfig
@@ -1035,7 +1035,7 @@ config PATA_GAYLE
 
 config PATA_CSWARP
 	tristate "Amiga CS Warp PATA support"
-	depends on M68K && AMIGA && ZORRO
+	depends on WARP_MFD
 	help
 	  This option enables support for the on-board IDE interface on
 	  CS-Lab Warp Expansion Card (NOTE that idemode=native has to be
diff --git a/drivers/ata/pata_cswarp.c b/drivers/ata/pata_cswarp.c
index 58fe6d0012dc..2e1737c09dc7 100644
--- a/drivers/ata/pata_cswarp.c
+++ b/drivers/ata/pata_cswarp.c
@@ -14,14 +14,12 @@
 #include <linux/ata.h>
 #include <linux/blkdev.h>
 #include <linux/delay.h>
-#include <linux/device-id/zorro.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/libata.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/zorro.h>
 #include <scsi/scsi_cmnd.h>
 #include <scsi/scsi_host.h>
 
@@ -32,8 +30,6 @@
 
 #define DRV_NAME "pata_cswarp"
 
-#define WARP_OFFSET_ATA         0x6000
-
 static const struct scsi_host_template pata_cswarp_sht = {
 	ATA_PIO_SHT(DRV_NAME),
 };
@@ -92,30 +88,32 @@ static struct ata_port_operations pata_cswarp_ops = {
 	.set_mode	= pata_cswarp_set_mode,
 };
 
-static int pata_cswarp_probe(struct zorro_dev *z,
-			     const struct zorro_device_id *ent)
+static int pata_cswarp_probe(struct platform_device *pdev)
 {
 	static const char board_name[] = "csWarp";
 	struct ata_host *host;
 	struct ata_port *ap;
-	struct resource *res;
+	struct resource *cell, *res;
 	void __iomem *base;
-	unsigned long board = z->resource.start;
 
-	dev_info(&z->dev, "%s IDE controller (board: 0x%lx)\n", board_name,
-		 board);
+	cell = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pata");
+	if (!cell)
+		return -ENXIO;
+
+	dev_info(&pdev->dev, "%s IDE controller (board: %pR)\n", board_name,
+		 cell);
 
-	res = devm_request_mem_region(&z->dev, board + WARP_OFFSET_ATA, 0x1800,
-				      DRV_NAME);
+	res = devm_request_mem_region(&pdev->dev, cell->start,
+				      resource_size(cell), DRV_NAME);
 	if (!res)
 		return -ENXIO;
 
-	host = ata_host_alloc(&z->dev, 1);
+	host = ata_host_alloc(&pdev->dev, 1);
 	if (!host)
 		return -ENXIO;
 
 	ap = host->ports[0];
-	base = devm_ioremap(&z->dev, board + WARP_OFFSET_ATA, 0x1800);
+	base = devm_ioremap(&pdev->dev, cell->start, resource_size(cell));
 	if (!base)
 		return -ENOMEM;
 
@@ -145,34 +143,29 @@ static int pata_cswarp_probe(struct zorro_dev *z,
 			  IRQF_SHARED, &pata_cswarp_sht);
 }
 
-static void pata_cswarp_remove(struct zorro_dev *z)
+static void pata_cswarp_remove(struct platform_device *pdev)
 {
-	struct ata_host *host = dev_get_drvdata(&z->dev);
+	struct ata_host *host = dev_get_drvdata(&pdev->dev);
 
 	ata_host_detach(host);
 }
 
-static const struct zorro_device_id pata_cswarp_zorro_tbl[] = {
-	{ .id = ZORRO_PROD_CSLAB_WARP_1260 },
-	{ }
-};
-MODULE_DEVICE_TABLE(zorro, pata_cswarp_zorro_tbl);
-
-static struct zorro_driver pata_cswarp_driver = {
-	.name           = "pata_cswarp",
-	.id_table       = pata_cswarp_zorro_tbl,
+static struct platform_driver pata_cswarp_driver = {
+	.driver = {
+		.name	= "warp-pata",
+	},
 	.probe          = pata_cswarp_probe,
 	.remove         = pata_cswarp_remove,
 };
 
 static int __init pata_cswarp_init(void)
 {
-	return zorro_register_driver(&pata_cswarp_driver);
+	return platform_driver_register(&pata_cswarp_driver);
 }
 
 static void __exit pata_cswarp_unregister(void)
 {
-	zorro_unregister_driver(&pata_cswarp_driver);
+	platform_driver_unregister(&pata_cswarp_driver);
 }
 
 module_init(pata_cswarp_init);
@@ -181,3 +174,4 @@ module_exit(pata_cswarp_unregister);
 MODULE_AUTHOR("Andrzej Rogozynski");
 MODULE_DESCRIPTION("low-level driver for CSWarp PATA");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:warp-pata");
-- 
2.43.0

