From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 2/2] m68k/amiga - Zorro ESP: convert old driver to ESP core
Date: Fri,  7 Jun 2013 08:56:39 +1200
Message-ID: <1370552199-15048-3-git-send-email-schmitz@debian.org>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:61688 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753197Ab3FFU5G (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 6 Jun 2013 16:57:06 -0400
Received: by mail-pd0-f182.google.com with SMTP id g10so3881923pdj.13
        for <linux-m68k@vger.kernel.org>; Thu, 06 Jun 2013 13:57:05 -0700 (PDT)
In-Reply-To: <1370552199-15048-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, Michael Schmitz <schmitz@debian.org>

---
 drivers/scsi/zorro_esp.c |  414 ++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 414 insertions(+), 0 deletions(-)
 create mode 100644 drivers/scsi/zorro_esp.c

diff --git a/drivers/scsi/zorro_esp.c b/drivers/scsi/zorro_esp.c
new file mode 100644
index 0000000..b0d4a56
--- /dev/null
+++ b/drivers/scsi/zorro_esp.c
@@ -0,0 +1,414 @@
+/* zorrro_esp.c: ESP front-end for Amiga ZORRO SCSI systems.
+ *
+ * Copyright (C) 1996 Jesper Skov (jskov@cygnus.co.uk)
+ *
+ * Copyright (C) 2011 Michael Schmitz (schmitz@debian.org) for 
+ *               migration to ESP SCSI core
+ */
+/*
+ * ZORRO bus code from:
+ */
+/*
+ * Detection routine for the NCR53c710 based Amiga SCSI Controllers for Linux.
+ *		Amiga MacroSystemUS WarpEngine SCSI controller.
+ *		Amiga Technologies/DKB A4091 SCSI controller.
+ *
+ * Written 1997 by Alan Hourihane <alanh@fairlite.demon.co.uk>
+ * plus modifications of the 53c7xx.c driver to support the Amiga.
+ *
+ * Rewritten to use 53c700.c by Kars de Jong <jongk@linux-m68k.org>
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/dma-mapping.h>
+#include <linux/scatterlist.h>
+#include <linux/zorro.h>
+#include <linux/slab.h>
+
+#include <asm/page.h>
+#include <asm/pgtable.h>
+#include <asm/cacheflush.h>
+#include <asm/amigahw.h>
+#include <asm/amigaints.h>
+
+#include <scsi/scsi_host.h>
+#include <scsi/scsi_transport_spi.h>
+
+#include "esp_scsi.h"
+
+MODULE_AUTHOR("Michael Schmitz <schmitz@debian.org>");
+MODULE_DESCRIPTION("Amiga Zorro NCR5C9x (ESP) driver");
+MODULE_LICENSE("GPL");
+
+
+static struct scsi_host_template zorro_esp_scsi_driver_template = {
+	.proc_name	= "zorro-esp",
+	.this_id	= 7,
+	.module		= THIS_MODULE,
+};
+
+static struct zorro_driver_data {
+	const char *name;
+	unsigned long offset;
+	unsigned long dma_offset;
+	int absolute;
+	int zorro3;	/* offset is absolute address */
+} zorro_esp_driver_data[] = {
+	{ .name = "CyberStormI", .offset = 0xf400, .dma_offset = 0xf800 },
+	{ .name = "CyberStormII", .offset = 0x1ff03, .dma_offset = 0x1ff43 },
+	{ .name = "Blizzard 2060", .offset = 0x1ff00, .dma_offset = 0x1ffe0 },
+	{ .name = "Blizzard 1230", .offset = 0x8000, .dma_offset = 0x10000 },
+	{ .name = "Blizzard 1230II", .offset = 0x10000, .dma_offset = 0x10021 },
+	{ .name = "Fastlane", .offset = 0x1000001, .dma_offset = 0x1000041, .zorro3 = 1 },
+	{ 0 }
+};
+
+static struct zorro_device_id zorro_esp_zorro_tbl[] = {
+	{
+		.id = ZORRO_PROD_PHASE5_BLIZZARD_1220_CYBERSTORM,
+		.driver_data = (unsigned long)&zorro_esp_driver_data[0],
+	},
+	{
+		.id = ZORRO_PROD_PHASE5_BLIZZARD_1230_II_FASTLANE_Z3_CYBERSCSI_CYBERSTORM060,
+		.driver_data = (unsigned long)&zorro_esp_driver_data[0],
+	},
+	{
+		.id = ZORRO_PROD_PHASE5_CYBERSTORM_MK_II,
+		.driver_data = (unsigned long)&zorro_esp_driver_data[1],
+	},
+	{
+		.id = ZORRO_PROD_PHASE5_BLIZZARD_2060,
+		.driver_data = (unsigned long)&zorro_esp_driver_data[2],
+	},
+	{
+		.id = ZORRO_PROD_PHASE5_BLIZZARD_1230_IV_1260,
+		.driver_data = (unsigned long)&zorro_esp_driver_data[3],
+	},
+	{
+		.id = ZORRO_PROD_PHASE5_BLIZZARD_1230_II_FASTLANE_Z3_CYBERSCSI_CYBERSTORM060,
+		.driver_data = (unsigned long)&zorro_esp_driver_data[4],
+	},
+	{ 0 }
+};
+MODULE_DEVICE_TABLE(zorro, zorro_esp_zorro_tbl);
+
+/* The controller registers can be found in the Z2 config area at these
+ * offsets:
+ */
+#define BLZ2060_ESP_ADDR 0x1ff00
+#define BLZ2060_DMA_ADDR 0x1ffe0
+
+
+/* The Blizzard 2060 DMA interface
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * Only two things can be programmed in the Blizzard DMA:
+ *  1) The data direction is controlled by the status of bit 31 (1 = write)
+ *  2) The source/dest address (word aligned, shifted one right) in bits 30-0
+ *
+ * Figure out interrupt status by reading the ESP status byte.
+ */
+struct blz2060_dma_registers {
+	volatile unsigned char dma_led_ctrl;	/* DMA led control   [0x000] */
+	unsigned char dmapad1[0x0f];
+	volatile unsigned char dma_addr0; 	/* DMA address (MSB) [0x010] */
+	unsigned char dmapad2[0x03];
+	volatile unsigned char dma_addr1; 	/* DMA address       [0x014] */
+	unsigned char dmapad3[0x03];
+	volatile unsigned char dma_addr2; 	/* DMA address       [0x018] */
+	unsigned char dmapad4[0x03];
+	volatile unsigned char dma_addr3; 	/* DMA address (LSB) [0x01c] */
+};
+
+#define BLZ2060_DMA_WRITE 0x80000000
+
+/* DMA control bits */
+#define BLZ2060_DMA_LED    0x02		/* HD led control 1 = off */
+
+
+/*
+ * m68k always assumes readl/writel operate on little endian
+ * mmio space; this is wrong at least for Sun3x, so we
+ * need to workaround this until a proper way is found
+ */
+#if 0
+#define dma_read32(REG) \
+	readl(esp->dma_regs + (REG))
+#define dma_write32(VAL, REG) \
+	writel((VAL), esp->dma_regs + (REG))
+#else
+#define dma_read32(REG) \
+	*(volatile u32 *)(esp->dma_regs + (REG))
+#define dma_write32(VAL, REG) \
+	do { *(volatile u32 *)(esp->dma_regs + (REG)) = (VAL); } while (0)
+#endif
+
+/*
+ * On all implementations except for the Oktagon, padding between ESP 
+ * registers is three bytes.
+ * On Oktagon, it is one byte - use a different accessor there. 
+ *
+ * Oktagon currently unsupported!
+ */
+
+static void zorro_esp_write8(struct esp *esp, u8 val, unsigned long reg)
+{
+	writeb(val, esp->regs + (reg * 4UL));
+}
+
+static u8 zorro_esp_read8(struct esp *esp, unsigned long reg)
+{
+	return readb(esp->regs + (reg * 4UL));
+}
+
+static dma_addr_t zorro_esp_map_single(struct esp *esp, void *buf,
+				      size_t sz, int dir)
+{
+	return dma_map_single(esp->dev, buf, sz, dir);
+}
+
+static int zorro_esp_map_sg(struct esp *esp, struct scatterlist *sg,
+				  int num_sg, int dir)
+{
+	return dma_map_sg(esp->dev, sg, num_sg, dir);
+}
+
+static void zorro_esp_unmap_single(struct esp *esp, dma_addr_t addr,
+				  size_t sz, int dir)
+{
+	dma_unmap_single(esp->dev, addr, sz, dir);
+}
+
+static void zorro_esp_unmap_sg(struct esp *esp, struct scatterlist *sg,
+			      int num_sg, int dir)
+{
+	dma_unmap_sg(esp->dev, sg, num_sg, dir);
+}
+
+static int zorro_esp_irq_pending(struct esp *esp)
+{
+	/* check ESP status register; DMA has no status reg. */
+	if (zorro_esp_read8(esp, ESP_STATUS) & ESP_STAT_INTR)
+		return 1;
+
+	return 0;
+}
+
+static void zorro_esp_reset_dma(struct esp *esp)
+{
+	/* nothing to do here */
+}
+
+static void zorro_esp_dma_drain(struct esp *esp)
+{
+	/* nothing to do here */
+}
+
+static void zorro_esp_dma_invalidate(struct esp *esp)
+{
+	/* nothing to do here */
+}
+
+static void zorro_esp_send_dma_cmd(struct esp *esp, u32 addr, u32 esp_count,
+				  u32 dma_count, int write, u8 cmd)
+{
+	struct blz2060_dma_registers *dregs = 
+		(struct blz2060_dma_registers *) (esp->dma_regs);
+
+	BUG_ON(!(cmd & ESP_CMD_DMA));
+	zorro_esp_write8(esp, (esp_count >> 0) & 0xff, ESP_TCLOW);
+	zorro_esp_write8(esp, (esp_count >> 8) & 0xff, ESP_TCMED);
+
+	/* 
+	 * This will differ among Amiga ESP implementations - DMA setup!
+	 */
+
+	if (write)
+		cache_clear(addr, esp_count);
+	else
+		cache_push(addr, esp_count);
+
+	/* On the Sparc, DMA_ST_WRITE means "move data from device to memory"
+	 * so when (write) is true, it actually means READ (from the ESP)!
+	 */
+	addr >>= 1;
+	if (write)
+		addr &= ~(BLZ2060_DMA_WRITE);
+	else
+		addr |= BLZ2060_DMA_WRITE;
+
+	dregs->dma_addr3 = (addr      ) & 0xff;
+	dregs->dma_addr2 = (addr >>  8) & 0xff;
+	dregs->dma_addr1 = (addr >> 16) & 0xff;
+	dregs->dma_addr0 = (addr >> 24) & 0xff;
+
+	scsi_esp_cmd(esp, cmd);
+}
+
+static int zorro_esp_dma_error(struct esp *esp)
+{
+	/* nothing to do here - there seems to be no way to check for DMA errors */
+	return 0;
+}
+
+static const struct esp_driver_ops zorro_esp_ops = {
+	.esp_write8	=	zorro_esp_write8,
+	.esp_read8	=	zorro_esp_read8,
+	.map_single	=	zorro_esp_map_single,
+	.map_sg		=	zorro_esp_map_sg,
+	.unmap_single	=	zorro_esp_unmap_single,
+	.unmap_sg	=	zorro_esp_unmap_sg,
+	.irq_pending	=	zorro_esp_irq_pending,
+	.reset_dma	=	zorro_esp_reset_dma,
+	.dma_drain	=	zorro_esp_dma_drain,
+	.dma_invalidate	=	zorro_esp_dma_invalidate,
+	.send_dma_cmd	=	zorro_esp_send_dma_cmd,
+	.dma_error	=	zorro_esp_dma_error,
+};
+
+static int zorro_esp_init_one(struct zorro_dev *z,
+				       const struct zorro_device_id *ent)
+{
+	struct scsi_host_template *tpnt = &zorro_esp_scsi_driver_template;
+	struct Scsi_Host *host;
+	struct esp *esp;
+	struct zorro_driver_data *zdd;
+	unsigned long board, ioaddr, dmaaddr, esp_base;
+	int err = -ENOMEM;
+
+	board = zorro_resource_start(z);
+	zdd = (struct zorro_driver_data *)ent->driver_data;
+
+	if (zdd->absolute) {
+		ioaddr  = zdd->offset;
+		dmaaddr = zdd->dma_offset;
+	} else {
+		ioaddr  = board + zdd->offset;
+		dmaaddr = board + zdd->dma_offset;
+	}
+
+	if (!zorro_request_device(z, zdd->name)) {
+		printk(KERN_ERR "zorro_esp: cannot reserve region 0x%lx, abort\n",
+		       board);
+		return -EBUSY;
+	}
+
+	/* Fill in the required pieces of hostdata */
+	if (ioaddr > 0x01000000)
+		esp_base = ioremap(ioaddr, zorro_resource_len(z));
+	else
+		esp_base = (void __iomem *)ZTWO_VADDR(ioaddr);
+
+	zorro_esp_scsi_driver_template.name = zdd->name;
+
+	/* and register the chip */
+	host = scsi_host_alloc(tpnt, sizeof(struct esp));
+
+	if (!host) {
+		printk(KERN_ERR "zorro_esp: No host detected; "
+				"board configuration problem?\n");
+		goto out_free;
+	}
+
+	host->max_id = 8;
+	esp = shost_priv(host);
+
+	esp->host = host;
+	esp->dev = z;
+	esp->ops = &zorro_esp_ops;
+
+	esp->regs = ioremap_nocache(ioaddr, 0x20);
+	if (!esp->regs)
+		goto fail_unmap_regs;
+
+	esp->dma_regs = ioremap_nocache(dmaaddr, 0x20);
+
+	esp->command_block = dma_alloc_coherent(esp->dev, 32,
+						&esp->command_block_dma,
+						GFP_KERNEL);
+	if (!esp->command_block)
+		goto fail_unmap_regs_dma;
+
+	host->irq = IRQ_AMIGA_PORTS;
+	err = request_irq(host->irq, scsi_esp_intr, IRQF_SHARED,
+			  "Amiga Zorro ESP", esp);
+	if (err < 0)
+		goto fail_unmap_command_block;
+
+	esp->scsi_id = 7;
+	esp->host->this_id = esp->scsi_id;
+	esp->scsi_id_mask = (1 << esp->scsi_id);
+	esp->cfreq = 20000000;
+
+	dev_set_drvdata(&z->dev, esp);
+
+	err = scsi_esp_register(esp, &z->dev);
+	if (err)
+		goto fail_free_irq;
+
+	zorro_set_drvdata(z, host);
+	scsi_scan_host(host);
+
+	return 0;
+
+fail_free_irq:
+	free_irq(host->irq, esp);
+fail_unmap_command_block:
+	dma_free_coherent(esp->dev, 16,
+			  esp->command_block,
+			  esp->command_block_dma);
+fail_unmap_regs_dma:
+	iounmap(esp->dma_regs);
+fail_unmap_regs:
+	iounmap(esp->regs);
+	scsi_host_put(host);
+out_free:
+	if (ioaddr > 0x01000000)
+		iounmap(esp_base);
+out_release:
+	zorro_release_device(z);
+
+	return -ENODEV;
+}
+
+static void zorro_esp_remove_one(struct zorro_dev *z)
+{
+	struct Scsi_Host *host = zorro_get_drvdata(z);
+	struct esp *esp = dev_get_drvdata(&z->dev);
+	unsigned int irq = esp->host->irq;
+	u32 val;
+
+	scsi_esp_unregister(esp);
+
+	/* Disable interrupts. Perhaps use disable_irq instead ... */
+
+	free_irq(irq, esp);
+	dma_free_coherent(esp->dev, 16,
+			  esp->command_block,
+			  esp->command_block_dma);
+
+	scsi_host_put(esp->host);
+
+	zorro_release_device(z);
+}
+
+static struct zorro_driver zorro_esp_driver = {
+	.name	  = "zorro_esp-scsi",
+	.id_table = zorro_esp_zorro_tbl,
+	.probe	  = zorro_esp_init_one,
+	.remove	  = zorro_esp_remove_one,
+};
+
+static int __init zorro_esp_scsi_init(void)
+{
+	return zorro_register_driver(&zorro_esp_driver);
+}
+
+static void __exit zorro_esp_scsi_exit(void)
+{
+	zorro_unregister_driver(&zorro_esp_driver);
+}
+
+module_init(zorro_esp_scsi_init);
+module_exit(zorro_esp_scsi_exit);
-- 
1.7.0.4
