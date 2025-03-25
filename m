Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51499209F40
	for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Mar 2025 15:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742918181; cv=none; b=XjGh9WOfoJor29UxAn5oiht9Fa8MPlBFfiMT3u4LHdhJzfVSXYqjFZh55g+b2TzqAG4IyARq5HWJ4pRNg34Y/nj7PEcWVU8aXGGI5i7/SA+18uQpIoHiBAhAv/PD64pSo9E+OX7jiYHH4XFzapHVHTuLbLLIhyUMx/yu82steLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742918181; c=relaxed/simple;
	bh=aCJBE2lgj8MkqWDd1ScVKjhjkgNXfLiCz3sz3n79pEM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hrEI7idwWI+3nLNvPjaHvVAAWvoFRw/8PNpY4NF0juD3ftH/kVb/PbfBXPNX6ym6XgWdIx6eUSe8TkCtWNpuuO83TPdJSNM2xHmHmQQy13TQtZir4xfBDcbM/JzvrqgI+vNTxsawIqE8cPJH4P7BtzDgaG5bVE7hBMG8z/tqLMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfiTaeSO; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfiTaeSO"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso26777225e9.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Mar 2025 08:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742918176; x=1743522976; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iam3/iyXlFRBKEXY5zGks8R7nTB81GJyDiAoBfPEZKE=;
        b=nfiTaeSOhuOLVdnIWzxqm/N9ulAdDdMOW1iEKQX0bFYm3xfvDNVDuWuv+YHUQEZsV9
         WtSV7VobnEUMr+Zd2ir+ziLiAE59yFE8s9ztMuEbiFtsFyPPYNIHqyQZdoKkEfRE2DI/
         BJefhfq9mMNGX9XtTHqUUf0PJ1lTAwvMlflWbCfqGX6rke0mX9AjgXhi+/sQ9yxDqJUt
         Jv6f2NNyat5zPl+F6FLqEhTStF1mC+C34a2At3N5WPwUxXtymRqEPdlp2DiDykKq1Hqf
         78j6oGNKACF6tsEKHvBEod/fAA3sC/P2Ygwhv3XndgY0VpCURbeTignGYDgtSf1bbckC
         2jTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742918176; x=1743522976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iam3/iyXlFRBKEXY5zGks8R7nTB81GJyDiAoBfPEZKE=;
        b=BaT6sNh59jw/mL02Wa6N3WtcVHD15Je1THNjPQtlKn2WA6CLtS/yC9+qOhgHu8KKq7
         9dKqJ7Iviz7iC11dlxFvbTkmVt3aVWUZHK5EvNbZPsyo5eWoEbaqawuxPGX8gRID6Bql
         /k8GZDq9j7JLzoxb/e+T70Gpmi2bRixnWfRx3N7LAPcJc7Q0FvjUiKhX2JBwesLIog4u
         8p62TFnmCzgI1KuU20x8Gsed7BDr3AHwcHHeQqwjLvZhAkrckfhjuObnzuPvFWsRxAUS
         Ay27ChhP64i+zEu/OiRtP5dCOn7XvjCrFFJgp2SWPnDlqKzhR+3AAC9RXUjqAQfKZRVQ
         SBOw==
X-Forwarded-Encrypted: i=1; AJvYcCWzwHPgxHALI2cQLWvMO9JkjtX47FQAJPCGPxwcFg4PqtWBOn8s7rnfX9SF/rvAuO8PzpDltWnoR+cB@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx7WYuT7LPggn/mw9hm3SWUNvDVg7XqBgLTBCwC+DgWs83WJSwz
	+Bv84SJa52oBK6z8kH7ox/wjmUGWiVbXmxxd4TBrCoxbjAzHmV/C
X-Gm-Gg: ASbGncuMOavETy4Ic3hGp6mi4c9vdhV9fcKDOfkQ4EbM2CipifQcpJY+Zc5abQdKjQo
	hiSH/6LOFGLQxIUKN+Qay6XK+19qkOEEJUCNAFSgXZ03ktdjkcZDeS5ebXALMxPvYkKJh8AJV7M
	wgeGX0udJda3TYUJ5LWILnQ/YiTbolgvZGlfZdW50/PJ2Ca+59eo9fpI1/RwI/o9A0kKBpbSv/F
	OcG3/U5A3GMCxz/6yagvp0U2Oxrc1dgpEu7AU/tCiaOYkkCle2kiInRv1F/ZC1uE7o+GLWt5rbZ
	3QO4hyYMxin9/UjbzZcMfVNAotbM3sFo5iijqH4qRdQ=
X-Google-Smtp-Source: AGHT+IGDHFkdiRLiroa7erJdIHO3+tgaBQGPwGJ67hDljqSscb/hFi8075Z/Ogor7B7EuKm/tC3J2A==
X-Received: by 2002:a05:6000:418a:b0:391:49f6:dad4 with SMTP id ffacd0b85a97d-3997f94de0dmr11953840f8f.41.1742918176326;
        Tue, 25 Mar 2025 08:56:16 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:eead:4845:67bf:e110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm13753454f8f.29.2025.03.25.08.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 08:56:15 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-ide@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH v4 1/2] ata: pata_cswarp: Add Amiga cslab ata support
Date: Tue, 25 Mar 2025 16:56:12 +0100
Message-Id: <20250325155613.352680-2-p.pisati@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250325155613.352680-1-p.pisati@gmail.com>
References: <20250325155613.352680-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver for the on-board IDE interface on CS-Lab Warp Expansion Card
(NOTE that idemode=native has to be set in Warp Configuration)

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/ata/Kconfig       |  11 +++
 drivers/ata/Makefile      |   1 +
 drivers/ata/pata_cswarp.c | 185 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 197 insertions(+)
 create mode 100644 drivers/ata/pata_cswarp.c

diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
index e00536b49552..2fa96dbf2e3e 100644
--- a/drivers/ata/Kconfig
+++ b/drivers/ata/Kconfig
@@ -1025,6 +1025,17 @@ config PATA_GAYLE
 
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
+
 config PATA_BUDDHA
 	tristate "Buddha/Catweasel/X-Surf PATA support"
 	depends on ZORRO
diff --git a/drivers/ata/Makefile b/drivers/ata/Makefile
index 20e6645ab737..7b9b87ebacea 100644
--- a/drivers/ata/Makefile
+++ b/drivers/ata/Makefile
@@ -98,6 +98,7 @@ obj-$(CONFIG_PATA_WINBOND)	+= pata_sl82c105.o
 obj-$(CONFIG_PATA_CMD640_PCI)	+= pata_cmd640.o
 obj-$(CONFIG_PATA_FALCON)	+= pata_falcon.o
 obj-$(CONFIG_PATA_GAYLE)	+= pata_gayle.o
+obj-$(CONFIG_PATA_CSWARP)	+= pata_cswarp.o
 obj-$(CONFIG_PATA_BUDDHA)	+= pata_buddha.o
 obj-$(CONFIG_PATA_ISAPNP)	+= pata_isapnp.o
 obj-$(CONFIG_PATA_IXP4XX_CF)	+= pata_ixp4xx_cf.o
diff --git a/drivers/ata/pata_cswarp.c b/drivers/ata/pata_cswarp.c
new file mode 100644
index 000000000000..e0a0db6f7cfd
--- /dev/null
+++ b/drivers/ata/pata_cswarp.c
@@ -0,0 +1,185 @@
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
+					 unsigned char *buf,
+					 unsigned int buflen, int rw)
+{
+	struct ata_device *dev = qc->dev;
+	struct ata_port *ap = dev->link->ap;
+	volatile void __iomem *data_addr = ap->ioaddr.data_addr;
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
+		unsigned char pad[2] = { };
+
+		/* Point buf to the tail of buffer */
+		buf16 += words;
+
+		if (rw == READ) {
+			*pad = raw_inw(data_addr);
+			*buf16 = pad[0];
+		} else {
+			pad[0] = *buf16;
+			raw_outw(*pad, data_addr);
+		}
+	}
+
+	return buflen;
+}
+
+/*
+ * Provide our own set_mode() as we don't want to change anything that has
+ * already been configured..
+ */
+static int pata_cswarp_set_mode(struct ata_link *link,
+			       struct ata_device **unused)
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
+static int __init pata_cswarp_init(void) {
+	return zorro_register_driver(&pata_cswarp_driver);
+}
+
+static void __exit pata_cswarp_unregister(void) {
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
2.34.1

