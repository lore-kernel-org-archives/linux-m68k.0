Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415061;
	b=xTG79An/vPmN4vrNdyhK6OqgsP+WHsExyCfQSoBNvpx0Jldw7Enfo3b6di72XISgvmeM
	 9ID8gnDqjlstBrOxNjb7iDNGFjfNRsp1jPOidWdX7lhAAhGMHaNIvEsX/Wh5OlejPXN1P
	 A/IIyzNlL9hcEjzWAvZHKNZGiXJSeH/qyOljLAZ/ARuzSBFvH2zg0rYJX/XBIEmY+KlwF
	 xYnnGIp7myILEfn7Zjt6ta0+/yZaStFnaMcQ2bD3KdTeJpwoPNnK8hUWDCIALi3OqNO0R
	 +TiQxwTJl3T2PzoGFitOc2B8zW9089of2Y7c8N79bTKbq/Ms0si743+uF2C8NWFss9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KXjsm9ORz3HR//q2A0kstQ3Pi4RAW90rgXKjKRzFtHY=;
	b=KfWBOEceyQ1uU1u3xErmlspgXsteX6Skkms8+90htMBoZ3xB0W5g/HBh83xOXivrwRwF
	 e/rfqxFpdRw9URrUB1KtTuYklEw82yPEaF4nbdKI0NG06I8p0Ku/95KT45KQHp2wzx6e1
	 t/Hs2RFQir+/7O+c/VXti04YXzAej8GvuRmfTwaUK5gh6H6azwL+sjvg5uplXi5sl1vgp
	 BD+HT3ASpzwo/972Y76WsdUlixwSYH45gxBpUbCr6PCd/e5GxvWIj7sY1MJdYhk1DEzp0
	 gC1dUv2s0KHwc02abJLTGdXigYsX3CHr/xemTdMs24iKp7hAegWBH/GlzPU8tomW8NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qmiLKXgN;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1050D606A32A
	for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Nov 2026 16:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1050D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qmiLKXgN
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2987905f8f.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Nov 2026 08:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415059; x=1795019859; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXjsm9ORz3HR//q2A0kstQ3Pi4RAW90rgXKjKRzFtHY=;
        b=qmiLKXgNlJhCdfFE5tjnmy12uIiwyTv2ju75hdF8EoNPUx/JzqsLy75IJABwkKG6S3
         6gplq1tGZ9Gd7hQp5JD6EKJGIY+xzVcru8yn7Qz8qS04QouIKqXjwn+zLFl8ANgW8fJl
         D+YSAwPPpmmBXbSpXqQqdo1q21nHxDHsomlMQt4+7KMaufiFtS/+cNSI+EjKuDyLpI/T
         7tQ16YVE355HfeC+qI834y/kdHhQAizSRvJzxIGFNR3F/gN2rnlqIe1en9guUZnDbe+O
         Obr9lGnn4/6F+b1c5EueNZyHR5xkuaNb+kPPMd30vD8dTxtnAbqvAH/2hJDSHR7enTEl
         QVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415059; x=1795019859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXjsm9ORz3HR//q2A0kstQ3Pi4RAW90rgXKjKRzFtHY=;
        b=pC2Lu1Ryxki/3YcXa+Yajc/GEsO4JXB/2Jox4L/DmQt86NN9tedAd1HuDDEyjt+/fZ
         Wwnml8Ff6TP9TxU7rldUFJBKBqn37mz49Vqr8s33HaufZ+eS/L6RDhtAMvh9nPxJOdJP
         1nsv1JbM/gxc4cMSehSoxWN9W+Ah8kEqlSMVBkleVSLWmQSxm/hUUGGKnBq7yUm9op6N
         +0L8/cUfyU+sfUaADN1t6mfcsYgeSypSC0z0o+uW+LaPEZ0VRWdKjdej+Of8cOSC0CtG
         PmPBYwj67wVHV2yEHZ3nPEV/Bx893j7ciG3iJbBPMS2EfBwB32t36n4/9srhu2blIyNj
         3wzw==
X-Gm-Message-State: APuU4Z/FJ/0XZkZoivC7CyZKLw/XJMxshWmnglTM7enYiSQHVnFtrF7O
	eMDXJrWkRLpTD1oR/IUgHpRxVnCRM7As/K1XUgvF/t874HkD/X05wMYJVml5nnsD
X-Gm-Gg: AYBFou23HlLwJh+CDCHp++iCQhxyBKj93ijoA/UtzsLKnEhBDEHDccOFrwM1FPbXusz
	sznDCzAuIuafURzujH1ZoGQ2Tg20EkJpXnq5BpqW5yiVLwaXuAAxb0CALTZRkHaKVkp4dIGUxsn
	dcEGpyIbbnKu6IyNunTS4d9Pq1k85d2HWBvWTBLeeMFGL/ETVtjrgaGfZBta7yqghM8LZ1pShlj
	cA3BJC05QOBA3LEUfe6DVXH5Df/yqWjXbeHPbUWXeCwbykyGZnA9EzGITjgdQ7+SkXHCWUu1t4Z
	iAw2YBARyIZi/V6j+3RDh/Rs2Xd3/oBI0RgVEMbtI9rfiDAUk1utZGVPonOSDHNVIQ+H+DC5omn
	mLaajdGjDex7prNRYts1IeTipcnRsz70EjQWVuNPgvPWDF0RMlTb7KYXFEg4FKp3JDHzs1/He2z
	ozkeCUJbHRMwjHGYjkAYT2zsw2J4RyDputzc3WeXEIWDxEiCwm97rcG0uwqyO7EbAjG3mYTxB8s
	5ktuv3QV/BffnkCMG+jkauvCRPdiz+vYkI7VE/EzK8LkXN24bMYjGcOLlW6TBG+skEdEPHx2AUy
	aUCEptlnINPLN1xmnNJXDKR4o2J/GAsT8Lustk0DKNWDXBtuMlt+0f57NMQC40+XBA4JcWvdv9q
	b5E62MfPDQ0wn
X-Received: by 2002:a05:6000:18a9:b0:48e:5df9:1ec9 with SMTP id ffacd0b85a97d-499c6f8db6cmr5151187f8f.24.1794415059075;
        Wed, 11 Nov 2026 08:37:39 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:6e81:13fe:ca06:8db8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835c37bdfsm11895837f8f.22.2026.11.11.08.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:37:38 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v1 2/7] ata: pata_cswarp: bind to the Warp mfd cell instead of the Zorro device
Date: Wed, 11 Nov 2026 17:37:29 +0100
Message-ID: <20261111163735.227286-3-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111163735.227286-1-p.pisati@gmail.com>
References: <20261111163735.227286-1-p.pisati@gmail.com>
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
 drivers/ata/pata_cswarp.c | 48 ++++++++++++++-------------------------
 2 files changed, 18 insertions(+), 32 deletions(-)

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
index 58fe6d0012dc..41b4c93052cf 100644
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
@@ -92,33 +88,27 @@ static struct ata_port_operations pata_cswarp_ops = {
 	.set_mode	= pata_cswarp_set_mode,
 };
 
-static int pata_cswarp_probe(struct zorro_dev *z,
-			     const struct zorro_device_id *ent)
+static int pata_cswarp_probe(struct platform_device *pdev)
 {
 	static const char board_name[] = "csWarp";
 	struct ata_host *host;
 	struct ata_port *ap;
 	struct resource *res;
 	void __iomem *base;
-	unsigned long board = z->resource.start;
 
-	dev_info(&z->dev, "%s IDE controller (board: 0x%lx)\n", board_name,
-		 board);
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pata");
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
-	res = devm_request_mem_region(&z->dev, board + WARP_OFFSET_ATA, 0x1800,
-				      DRV_NAME);
-	if (!res)
-		return -ENXIO;
+	dev_info(&pdev->dev, "%s IDE controller (board: %pR)\n", board_name,
+		 res);
 
-	host = ata_host_alloc(&z->dev, 1);
+	host = ata_host_alloc(&pdev->dev, 1);
 	if (!host)
 		return -ENXIO;
 
 	ap = host->ports[0];
-	base = devm_ioremap(&z->dev, board + WARP_OFFSET_ATA, 0x1800);
-	if (!base)
-		return -ENOMEM;
-
 	ap->ops = &pata_cswarp_ops;
 
 	ap->pio_mask = ATA_PIO4;
@@ -145,34 +135,29 @@ static int pata_cswarp_probe(struct zorro_dev *z,
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
@@ -181,3 +166,4 @@ module_exit(pata_cswarp_unregister);
 MODULE_AUTHOR("Andrzej Rogozynski");
 MODULE_DESCRIPTION("low-level driver for CSWarp PATA");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:warp-pata");
-- 
2.43.0

