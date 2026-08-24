Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAEE3AAF6D
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Aug 2026 15:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787585625; cv=none; b=PvQ74QcFy5Ehiw35pFxDj+nxLWd/MTH6F3Jpg4wjeLH+gFIW/D5+TZVYrliZ3WaVeblZGf7gC5bcj407VdsZCvzjkuKNOxwfMfxyLrxyZRF+hOys9kWDSi0V3JlNyGAhc9OiHe9akU6by5fst3RWV6hwJkAZTUZQxfcn3a5x8nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787585625; c=relaxed/simple;
	bh=5JpANtAU4t1Qi9Ex2ghJLfhPISzpH2MIaXcq7FB6Ffw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JidiPsdXTKduZgNQNe0Ox+RNAxSxBl3U5AvdlnG8v8JUbt++O+qxg6dy7HQPpCQNiSMlVlrR8VXvF1ZG81BT41xrqXR63oagr0RdMdssGwVxl4B3vaUQk+6s95kzBAJZauS6LEWMKyjQVWLV4vCMa3UXlxO3H3UmypSsM+cUenc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rn7GLt5N; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rn7GLt5N"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1c52d920b8so518537066b.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Aug 2026 08:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787585622; x=1788190422; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZpFddXWVYDgYNFEwNsi2m64DJAKBpVtw3pWl8Nr4DKg=;
        b=rn7GLt5NEqVHcPUPkVOSkYZ4Fukk+9dOcjqSxoXzm2mOFM33ipuKZRSw7bUuCcutFQ
         pIz8J8hsgBOeONKrZK+UvutD47vrhpCY+0/Tg89mSaeEVyCYoElzaixLMruOx2f2T54f
         oovyhtxPxRJKjP/aX/7wVtcQnmZXujdB4xgt2eJGfRCnEDhFG67ZpDlRe84l30XuSvt9
         +EHdckm4sPeVqF93tFWgxS1aikZUGbUI4ThEc3/pkbGQ1S9e2L+Waj9vQlZLP78uTknW
         aE+XNB79TvmsoD4jmwrjzn74O2zvKggueukDCriwu2p6xh5JuKbOzLhe5oZtifvhNajH
         ONhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787585622; x=1788190422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZpFddXWVYDgYNFEwNsi2m64DJAKBpVtw3pWl8Nr4DKg=;
        b=Me84ok6VQLDQffm5HIoUUUulN95d7Ibsq+E8TGdUEUijXODfseWSHBn90sKd9orBfx
         k1lY4YkXOtvhX5ecltm2Fdk7YUzoRYw6n/dU4Es046qUSRFUZ1R6/9KKco8UpNAzyKjt
         Eb8eIW19WfeQqoGyjUduK24/WQaDxv+tjmh1yzDZzBPrEApMrBJWaB4m93eXQvXnwyc6
         XbPIAK521oDbhPhPIjDExQ6VvvCV2x5D1pHEo9Dvwz4jKKyyf0mV5vSEYKx5LMrBIQ+1
         RwXK304IgnAtczTO40UlDPGTuYNTY/J2sHMaJgPsB/1GSOYHPfME0x2G/CA/DEv39DWO
         QHDA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8CZ5DG6NOfXqlbqfIkoc8eRciZ99psRIjv6ynWRUWeiwDovGh0eSubl+z+1E5+ikufAL5SZpgpyOQ@lists.linux-m68k.org
X-Gm-Message-State: AFuF++mWPTgBnnUdrCiKC51OlpUJsOCxHh6uJuJuAQsIsNu7ameC7uC7
	nnB/M5xQAXyf6h8JzXNMExkRD+kUaX97kX2cws8oc5WF8E/adFSYys32
X-Gm-Gg: AR+sD136bKzFNNA+52jMoETyK2rSWpeCisgkDUv7P03BXkAkybzWzIl1PmkkpVMP8je
	CZ4qb/H9DhmdwzwpcBFhw9+3b0e159agRLc4v8HzXII6Pl6zvuotMzecKM/JJzrpaYz49+ncQUw
	b/jrRNUIt2KQYvsu4RwQA4N7k25SCgfckIcZBgYMAxgNCoY7qIZtQPnDwhonrPd4LnxtPFXovT/
	lFmIIJRv4DDWbKXEEhmc7dKJ8EryRYXqjyaML2pY1iuOnKw+SBPlhKZpazqvRwpNiDeWswus2F1
	97yFC8hcUYGDiskzaRIUfv2JU6982p21TMschOQRVH+YNOjdHP71cSR3s1H9akKWtvtR07fhAQE
	U/osHofngq9xRtoNHGBrUH8Yg8XE5Y3xMHlaEqFXsetWQQpsMIstivxFX6Ki2Tk23AuJ0A6LEqZ
	rGkHg4ohlGhQobrQwLzbIHNsY1vi21Nd+XeMzOku4yHL2rPz8TgNRdIXsFB7k1oGgxclHVioDWb
	tMAH5KBS9tL1lPbH4wkhE9hVpjM7GJWyTlEXXYe3qasz84=
X-Received: by 2002:a17:906:f359:b0:c15:f0b8:eb91 with SMTP id a640c23a62f3a-c246a359a52mr2438732166b.7.1787585621680;
        Mon, 24 Aug 2026 08:33:41 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:5fe:e162:f6c3:e4f5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f64e0sm1585860166b.32.2026.08.24.08.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:33:41 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-ide@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] ata: pata_cswarp: Add Amiga cslab ata support
Date: Mon, 24 Aug 2026 17:33:38 +0200
Message-ID: <20260824153339.512487-2-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824153339.512487-1-p.pisati@gmail.com>
References: <20260824153339.512487-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver for the on-board IDE interface on CS-Lab Warp Expansion Card
(NOTE that idemode=native has to be set in Warp Configuration)

Assisted-by: Claude_Code:claude-opus-5
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/ata/Kconfig       |  10 +++
 drivers/ata/Makefile      |   1 +
 drivers/ata/pata_cswarp.c | 180 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 191 insertions(+)
 create mode 100644 drivers/ata/pata_cswarp.c

diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
index 28ca856ecc75..86af89a9bfce 100644
--- a/drivers/ata/Kconfig
+++ b/drivers/ata/Kconfig
@@ -1040,6 +1040,16 @@ config PATA_GAYLE
 
 	  If unsure, say N.
 
+config PATA_CSWARP
+	tristate "Amiga CS Warp PATA support"
+	depends on M68K && AMIGA && ZORRO
+	help
+	  This option enables support for the on-board IDE interface on
+	  CS-Lab Warp Expansion Card (NOTE that idemode=native has to be
+	  set in Warp Configuration)
+
+	  If unsure, say N.
+
 config PATA_BUDDHA
 	tristate "Buddha/Catweasel/X-Surf PATA support"
 	depends on ZORRO
diff --git a/drivers/ata/Makefile b/drivers/ata/Makefile
index b96025abd45e..647e3d4b6f75 100644
--- a/drivers/ata/Makefile
+++ b/drivers/ata/Makefile
@@ -100,6 +100,7 @@ obj-$(CONFIG_PATA_WINBOND)	+= pata_sl82c105.o
 obj-$(CONFIG_PATA_CMD640_PCI)	+= pata_cmd640.o
 obj-$(CONFIG_PATA_FALCON)	+= pata_falcon.o
 obj-$(CONFIG_PATA_GAYLE)	+= pata_gayle.o
+obj-$(CONFIG_PATA_CSWARP)	+= pata_cswarp.o
 obj-$(CONFIG_PATA_BUDDHA)	+= pata_buddha.o
 obj-$(CONFIG_PATA_ISAPNP)	+= pata_isapnp.o
 obj-$(CONFIG_PATA_IXP4XX_CF)	+= pata_ixp4xx_cf.o
diff --git a/drivers/ata/pata_cswarp.c b/drivers/ata/pata_cswarp.c
new file mode 100644
index 000000000000..55f000f42738
--- /dev/null
+++ b/drivers/ata/pata_cswarp.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Amiga CS Warp PATA controller driver
+ *
+ * Copyright (c) 2024 CS-Lab s.c.
+ *		http://www.cs-lab.eu
+ *
+ * Based on pata_gayle.c, pata_buddha.c and warpATA.device:
+ *
+ *     Created 2 Jun 2024 by Andrzej Rogozynski
+ */
+
+#include <linux/ata.h>
+#include <linux/blkdev.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/libata.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/zorro.h>
+#include <scsi/scsi_cmnd.h>
+#include <scsi/scsi_host.h>
+
+#include <asm/amigahw.h>
+#include <asm/amigaints.h>
+#include <asm/amigayle.h>
+#include <asm/setup.h>
+
+#define DRV_NAME "pata_cswarp"
+
+#define WARP_OFFSET_ATA         0x6000
+
+static const struct scsi_host_template pata_cswarp_sht = {
+	ATA_PIO_SHT(DRV_NAME),
+};
+
+static unsigned int pata_cswarp_data_xfer(struct ata_queued_cmd *qc,
+					  unsigned char *buf,
+					  unsigned int buflen, int rw)
+{
+	struct ata_device *dev = qc->dev;
+	struct ata_port *ap = dev->link->ap;
+	void __iomem *data_addr = ap->ioaddr.data_addr;
+	unsigned int words = buflen >> 1;
+	u16 *buf16 = (u16 *)buf;
+
+	/* Transfer multiple of 2 bytes */
+	if (rw == READ)
+		raw_insw(data_addr, buf16, words);
+	else
+		raw_outsw(data_addr, buf16, words);
+
+	/* Transfer trailing byte, if any. */
+	if (unlikely(buflen & 0x01)) {
+		if (rw == READ)
+			buf[buflen - 1] = raw_inw(data_addr) >> 8;
+		else
+			raw_outw(buf[buflen - 1] << 8, data_addr);
+		words++;
+	}
+
+	return words << 1;
+}
+
+/*
+ * Provide our own set_mode() as we don't want to change anything that has
+ * already been configured..
+ */
+static int pata_cswarp_set_mode(struct ata_link *link,
+				struct ata_device **unused)
+{
+	struct ata_device *dev;
+
+	ata_for_each_dev(dev, link, ENABLED) {
+		/* We don't really care */
+		dev->pio_mode = dev->xfer_mode = XFER_PIO_0;
+		dev->xfer_shift = ATA_SHIFT_PIO;
+		dev->flags |= ATA_DFLAG_PIO;
+		ata_dev_info(dev, "configured for PIO\n");
+	}
+	return 0;
+}
+
+static struct ata_port_operations pata_cswarp_ops = {
+	.inherits	= &ata_sff_port_ops,
+	.sff_data_xfer	= pata_cswarp_data_xfer,
+	.cable_detect	= ata_cable_unknown,
+	.set_mode	= pata_cswarp_set_mode,
+};
+
+static int pata_cswarp_probe(struct zorro_dev *z,
+			     const struct zorro_device_id *ent)
+{
+	static const char board_name[] = "csWarp";
+	struct ata_host *host;
+	struct ata_port *ap;
+	void __iomem *base;
+	unsigned long board = z->resource.start;
+
+	dev_info(&z->dev, "%s IDE controller (board: 0x%lx)\n", board_name,
+		 board);
+
+	if (!devm_request_mem_region(&z->dev, board + WARP_OFFSET_ATA, 0x1800,
+				     DRV_NAME))
+		return -ENXIO;
+
+	host = ata_host_alloc(&z->dev, 1);
+	if (!host)
+		return -ENXIO;
+
+	ap = host->ports[0];
+	base = ioremap(board + WARP_OFFSET_ATA, 0x1800);
+
+	ap->ops = &pata_cswarp_ops;
+
+	ap->pio_mask = ATA_PIO4;
+	ap->flags |= ATA_FLAG_SLAVE_POSS | ATA_FLAG_NO_IORDY |
+		ATA_FLAG_PIO_POLLING;
+
+	ap->ioaddr.data_addr		= base;
+	ap->ioaddr.error_addr		= base + 1 * 4;
+	ap->ioaddr.feature_addr		= base + 1 * 4;
+	ap->ioaddr.nsect_addr		= base + 2 * 4;
+	ap->ioaddr.lbal_addr		= base + 3 * 4;
+	ap->ioaddr.lbam_addr		= base + 4 * 4;
+	ap->ioaddr.lbah_addr		= base + 5 * 4;
+	ap->ioaddr.device_addr		= base + 6 * 4;
+	ap->ioaddr.status_addr		= base + 7 * 4;
+	ap->ioaddr.command_addr		= base + 7 * 4;
+
+	ap->ioaddr.altstatus_addr	= base + (0x1000 | (6UL << 2));
+	ap->ioaddr.ctl_addr		= base + (0x1000 | (6UL << 2));
+
+	ata_port_desc(ap, "  cmd 0x%lx ctl 0x%lx", (unsigned long)base,
+		      (unsigned long)ap->ioaddr.ctl_addr);
+
+	return ata_host_activate(host, 0, NULL,
+			  IRQF_SHARED, &pata_cswarp_sht);
+}
+
+static void pata_cswarp_remove(struct zorro_dev *z)
+{
+	struct ata_host *host = dev_get_drvdata(&z->dev);
+
+	ata_host_detach(host);
+	iounmap(host->ports[0]->ioaddr.data_addr);
+}
+
+static const struct zorro_device_id pata_cswarp_zorro_tbl[] = {
+	{ ZORRO_PROD_CSLAB_WARP_1260, 0},
+	{ 0 }
+};
+MODULE_DEVICE_TABLE(zorro, pata_cswarp_zorro_tbl);
+
+static struct zorro_driver pata_cswarp_driver = {
+	.name           = "pata_cswarp",
+	.id_table       = pata_cswarp_zorro_tbl,
+	.probe          = pata_cswarp_probe,
+	.remove         = pata_cswarp_remove,
+};
+
+static int __init pata_cswarp_init(void)
+{
+	return zorro_register_driver(&pata_cswarp_driver);
+}
+
+static void __exit pata_cswarp_unregister(void)
+{
+	zorro_unregister_driver(&pata_cswarp_driver);
+}
+
+module_init(pata_cswarp_init);
+module_exit(pata_cswarp_unregister);
+
+MODULE_AUTHOR("Andrzej Rogozynski");
+MODULE_DESCRIPTION("low-level driver for CSWarp PATA");
+MODULE_LICENSE("GPL");
-- 
2.43.0

