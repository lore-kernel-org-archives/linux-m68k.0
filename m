Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234EA198845
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 09:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742808257; cv=none; b=Y/5IeJKvWPUzCM1vl66XZZXq575xJ7kZU9J/OZ7MHFKSy7IAnMPKiQ31AE+bkytMlcpkQSQNpwIjSpdaMqVBj82Cjl8BXQ+Ypmbe0FEp+LsCWRLkkMHXhh/Cr5MjDWl5T/4Emdo27Wyk56ZlmyFsNzpKmWlbavBc9s1KMITFqZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742808257; c=relaxed/simple;
	bh=w7N3ZGC8oZfy9s7CJRQggk18LPXxoPavYpa30KfVsnk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kD8fkPz25jG8YfBEFFCadUNMC/KxxaUveJbaIdMna1C8TzkYOdjfywVTm5WjMmR89OPT0S5QqRvr/D27O+uGzxTERw9peiivuxKPxJpolqFwsHyZ7VIZ1yj/167DRk3fE8z1UnMMDoWIW8TcQjUdf6VxwENsrY2G4kXdBYgfJm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVEFbmN1; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVEFbmN1"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3913fdd0120so2175252f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 02:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742808253; x=1743413053; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2pVkgI6zSs4/Eh2YQU3jRNZ9meV8bB0vZzCdDrTclI=;
        b=cVEFbmN16Jasj3b4p+2Hd8xBQQu/viz3ddvwSNAqH++/L4/1zZs+CLLPQ5+4r0h19h
         R2Hz43CVToQonQqVqW/87+xbub85f+I+q6YxoiJ7NDJtDytk1DBUcYvy6OqgfZ598MAc
         7Z8Ya6IH/Bqky7t540HnY1gK8YfPFaNu86nkvEk4BERdwy+PZgB/ZB9Lio74m2GNxS67
         xWOqGEi5Qcz23acUCRZMyus+l7tQIy7dfyBhL5DTt2dWX17nA+zXGUJpuoovRpI8+a3B
         bqj+e9/f1fi/EomnuNT/o+QiQctSnW+vjCSi8Y/i3+yPAOH7PIQkqgMDwH5OWbVMoZUC
         2sxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742808253; x=1743413053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2pVkgI6zSs4/Eh2YQU3jRNZ9meV8bB0vZzCdDrTclI=;
        b=cwPww/qCjDuEhj8wa9QUmTKlF8aDxRugiOm7ajNgTorDCduFwc22ce/ja8mWpzBl6W
         cEH7LD6j0Yf7iPy4477hvMPEJgQpwCVnokpQcMjY+CWyrl0S3zgYDj/NQPaU0fWorbKn
         kehWu0SM0pnLOzsocgAn+oeDhsIq3LqabogOYbzXFFZh1n+GplDJLs0MAVW6FpFQ6eDX
         rwsXikau8ewQQxw/GkroX3LJnEXdLjWuViBcWwgnWo5j3HHkjcdngbHWjNVzEgyCwhJs
         blIROs+L9r8e2xpvRVPtWL0ElLnX3Xk52vpuEyVyonjpWm5pVucSrvRNwtZr0Xg05YQZ
         huJg==
X-Forwarded-Encrypted: i=1; AJvYcCXDZQLhxCemo7nnhpmzYX58lOWlPvQOWrcdcweIuJNESajPeBMabWgIUOMFNXxIEU3GWcAuUTZgE5BC@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw925MNHPFXAa4bBevguQJV/E5u7aYYFlu3d4GlQha35GmFfGGs
	adxhbkhsDXXa0qMFVqBp6QN9MDHB5xKgh/q1jMi1a+6dzkA59WKF
X-Gm-Gg: ASbGnctqrXsOQoZulcWExvKKrbxZmV/kWgXBfl6s2LcvUzmSwFWAmKvNRLjFtzA0q1P
	WSK8XliJGHPViFUa+y7suamReYD1DZtWt+NhXXntlahjOCy+1CiwzyGd2mYJJsdqdiO9we9exMF
	uXTnoUhEyOxw1xM8nXBqCA4g2foCemxygZkzpKDumB2O29lZr9MiSPQ2qtPoVpdfoHb9gHaJqji
	1f7KoIrCQBYfi7gfT5CxqZJ3b2kuf+xheVfkzcyO4WUIz4gOvB05dElvXqG2A1tjkj0fLYIiV7a
	lQx+WUO7sNMmx0H7Ey3h2rDu0yGHzCMUf3MI+wyuTIE=
X-Google-Smtp-Source: AGHT+IFx0TpnMzDvA4TqwZ4MOGgw0qdEOJgOP//9Pvwb3eM2wOMGafiyh6hib9ewcZMuRD+XGgWIwA==
X-Received: by 2002:a05:6000:2b08:b0:391:4999:778b with SMTP id ffacd0b85a97d-3997f90e310mr8651403f8f.28.1742808253307;
        Mon, 24 Mar 2025 02:24:13 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:fd58:9303:2c1b:4279])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3c90sm10630233f8f.36.2025.03.24.02.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 02:24:12 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-ide@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH v2 2/2] ata: pata_cswarp: Add Amiga cslab ata support
Date: Mon, 24 Mar 2025 10:24:09 +0100
Message-Id: <20250324092409.99430-3-p.pisati@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250324092409.99430-1-p.pisati@gmail.com>
References: <20250324092409.99430-1-p.pisati@gmail.com>
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
 drivers/ata/pata_cswarp.c | 189 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 201 insertions(+)
 create mode 100644 drivers/ata/pata_cswarp.c

diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
index e00536b49552..a278386f0fa2 100644
--- a/drivers/ata/Kconfig
+++ b/drivers/ata/Kconfig
@@ -1025,6 +1025,17 @@ config PATA_GAYLE
 
 	  If unsure, say N.
 
+config PATA_CSWARP
+	tristate "Amiga CS Warp PATA support"
+	depends on M68K && AMIGA
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
index 000000000000..4e2877ed93c9
--- /dev/null
+++ b/drivers/ata/pata_cswarp.c
@@ -0,0 +1,189 @@
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
+	void __iomem *data_addr = ap->ioaddr.data_addr;
+	unsigned int words = buflen >> 1;
+
+	/* Transfer multiple of 2 bytes */
+	if (rw == READ)
+		raw_insw((u16 *)data_addr, (u16 *)buf, words);
+	else
+		raw_outsw((u16 *)data_addr, (u16 *)buf, words);
+
+	/* Transfer trailing byte, if any. */
+	if (unlikely(buflen & 0x01)) {
+		unsigned char pad[2] = { };
+
+		/* Point buf to the tail of buffer */
+		buf += buflen - 1;
+
+		if (rw == READ) {
+			raw_insw((u16 *)data_addr, (u16 *)pad, 1);
+			*buf = pad[0];
+		} else {
+			pad[0] = *buf;
+			raw_outsw((u16 *)data_addr, (u16 *)pad, 1);
+		}
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
+	void __iomem *cswarp_ctrl_board, *base;
+	unsigned long board = z->resource.start;
+
+	dev_info(&z->dev, "%s IDE controller (board: 0x%lx)\n", board_name,
+		 board);
+
+	if (!devm_request_mem_region(&z->dev, board + WARP_OFFSET_ATA, 0x1800,
+				     DRV_NAME))
+		return -ENXIO;
+
+	/* allocate host */
+	host = ata_host_alloc(&z->dev, 1);
+	if (!host)
+		return -ENXIO;
+
+	cswarp_ctrl_board = (void *)board;
+
+	ap = host->ports[0];
+	base = cswarp_ctrl_board + WARP_OFFSET_ATA;
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
+	ata_host_activate(host, 0, NULL,
+			  IRQF_SHARED, &pata_cswarp_sht);
+
+	return 0;
+}
+
+static void pata_cswarp_remove(struct zorro_dev *z)
+{
+	struct ata_host *host = dev_get_drvdata(&z->dev);
+
+	ata_host_detach(host);
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

