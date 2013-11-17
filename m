From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH WIP] X-Surf-100 Ethernet driver
Date: Sun, 17 Nov 2013 11:18:39 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1311171005410.19767@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>
Cc: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

This is a preliminary driver for the Individual Computers X-Surf-100 Ethernet
card, written by Michael Karcher. It currently works fine with the 3.2.0-4
kernel in Debian.

I'm posting it here as there may be other XSurf100 owners who are interested
in completing the driver.

Some documentation can be found at http://wiki.icomp.de/wiki/X-Surf-100

--- linux-3.2.0-4/drivers/net/ethernet/8390/ax88796.c.orig	2013-11-16 13:49:37.000000000 +0100
+++ linux-3.2.0-4/drivers/net/ethernet/8390/ax88796.c	2013-09-14 13:52:35.000000000 +0200
@@ -10,6 +10,7 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
+#define CONFIG_AX88796_93CX6
 
 #include <linux/module.h>
 #include <linux/kernel.h>
@@ -18,7 +19,6 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
-#include <linux/platform_device.h>
 #include <linux/delay.h>
 #include <linux/timer.h>
 #include <linux/netdevice.h>
@@ -28,9 +28,11 @@
 #include <linux/phy.h>
 #include <linux/eeprom_93cx6.h>
 #include <linux/slab.h>
+#include <linux/zorro.h>
 
 #include <net/ax88796.h>
 
+#include <asm/amigaints.h>
 #include <asm/system.h>
 
 /* Rename the lib8390.c functions to show that they are in this driver */
@@ -48,8 +50,8 @@
 /* force unsigned long back to 'void __iomem *' */
 #define ax_convert_addr(_a) ((void __force __iomem *)(_a))
 
-#define ei_inb(_a) readb(ax_convert_addr(_a))
-#define ei_outb(_v, _a) writeb(_v, ax_convert_addr(_a))
+#define ei_inb(_a) (z_readb(ax_convert_addr(_a)))
+#define ei_outb(_v, _a) z_writeb((_v), ax_convert_addr(_a))
 
 #define ei_inb_p(_a) ei_inb(_a)
 #define ei_outb_p(_v, _a) ei_outb(_v, _a)
@@ -79,6 +81,8 @@ static unsigned char version[] = "ax8879
 
 #define AX_GPOC_PPDSET	BIT(6)
 
+static int ax_mii_init(struct net_device *dev);
+
 /* device private data */
 
 struct ax_device {
@@ -101,6 +105,19 @@ struct ax_device {
 	u32 reg_offsets[0x20];
 };
 
+static inline void fast_out32(char *out, const char *in, size_t len)
+{
+	while(len > 128)
+	{
+		memcpy(out, in, 128);
+		in += 128;
+		len -= 128;
+	}
+	memcpy(out, in, len & 0xFC);
+	in += len & 0xFC;
+	memcpy(out, in, len & 3);
+}
+
 static inline struct ax_device *to_ax_dev(struct net_device *dev)
 {
 	struct ei_device *ei_local = netdev_priv(dev);
@@ -192,10 +209,10 @@ static void ax_get_8390_hdr(struct net_d
 	ei_outb(E8390_RREAD+E8390_START, nic_base + NE_CMD);
 
 	if (ei_local->word16)
-		readsw(nic_base + NE_DATAPORT, hdr,
+		ioread16_rep(nic_base + NE_DATAPORT, hdr,
 		       sizeof(struct e8390_pkt_hdr) >> 1);
 	else
-		readsb(nic_base + NE_DATAPORT, hdr,
+		ioread8_rep(nic_base + NE_DATAPORT, hdr,
 		       sizeof(struct e8390_pkt_hdr));
 
 	ei_outb(ENISR_RDC, nic_base + EN0_ISR);	/* Ack intr. */
@@ -238,12 +255,12 @@ static void ax_block_input(struct net_de
 	ei_outb(E8390_RREAD+E8390_START, nic_base + NE_CMD);
 
 	if (ei_local->word16) {
-		readsw(nic_base + NE_DATAPORT, buf, count >> 1);
+		ioread16_rep(nic_base + NE_DATAPORT, buf, count >> 1);
 		if (count & 0x01)
 			buf[count-1] = ei_inb(nic_base + NE_DATAPORT);
 
 	} else {
-		readsb(nic_base + NE_DATAPORT, buf, count);
+		ioread8_rep(nic_base + NE_DATAPORT, buf, count);
 	}
 
 	ei_local->dmaing &= ~1;
@@ -286,10 +303,11 @@ static void ax_block_output(struct net_d
 	ei_outb(start_page, nic_base + EN0_RSARHI);
 
 	ei_outb(E8390_RWRITE+E8390_START, nic_base + NE_CMD);
-	if (ei_local->word16)
-		writesw(nic_base + NE_DATAPORT, buf, count >> 1);
+/*	if (ei_local->word16)
+		iowrite16_rep(nic_base + NE_DATAPORT, buf, count >> 1);
 	else
-		writesb(nic_base + NE_DATAPORT, buf, count);
+		iowrite8_rep(nic_base + NE_DATAPORT, buf, count);*/
+	fast_out32(nic_base + NE_DATAPORT, buf, count);
 
 	dma_start = jiffies;
 
@@ -400,6 +418,10 @@ static int ax_open(struct net_device *de
 
 	netdev_dbg(dev, "open\n");
 
+	ret = ax_mii_init(dev);
+	if (ret)
+		goto failed_request_irq;
+
 	ret = request_irq(dev->irq, ax_ei_interrupt, ax->irqflags,
 			  dev->name, dev);
 	if (ret)
@@ -446,6 +468,10 @@ static int ax_close(struct net_device *d
 	phy_disconnect(ax->phy_dev);
 
 	free_irq(dev->irq, dev);
+
+	mdiobus_unregister(ax->mii_bus);
+	kfree(ax->mii_bus->irq);
+	free_mdio_bitbang(ax->mii_bus);
 	return 0;
 }
 
@@ -468,7 +494,7 @@ static int ax_ioctl(struct net_device *d
 static void ax_get_drvinfo(struct net_device *dev,
 			   struct ethtool_drvinfo *info)
 {
-	struct platform_device *pdev = to_platform_device(dev->dev.parent);
+	struct zorro_dev *pdev = to_zorro_dev(dev->dev.parent);
 
 	strcpy(info->driver, DRV_NAME);
 	strcpy(info->version, DRV_VERSION);
@@ -608,7 +634,7 @@ static struct mdiobb_ops bb_ops = {
 
 static int ax_mii_init(struct net_device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev->dev.parent);
+	struct zorro_dev *pdev = to_zorro_dev(dev->dev.parent);
 	struct ei_device *ei_local = netdev_priv(dev);
 	struct ax_device *ax = to_ax_dev(dev);
 	int err, i;
@@ -692,10 +718,16 @@ static int ax_init_dev(struct net_device
 	if (ax->plat->flags & AXFLG_HAS_EEPROM) {
 		unsigned char SA_prom[32];
 
+		ei_outb(6, ioaddr + EN0_RCNTLO);
+		ei_outb(0, ioaddr + EN0_RCNTHI);
+		ei_outb(0, ioaddr + EN0_RSARLO);
+		ei_outb(0, ioaddr + EN0_RSARHI);
+		ei_outb(E8390_RREAD+E8390_START, ioaddr + NE_CMD);
 		for (i = 0; i < sizeof(SA_prom); i += 2) {
 			SA_prom[i] = ei_inb(ioaddr + NE_DATAPORT);
 			SA_prom[i + 1] = ei_inb(ioaddr + NE_DATAPORT);
 		}
+		ei_outb(ENISR_RDC, ioaddr + EN0_ISR);	/* Ack intr. */
 
 		if (ax->plat->wordlength == 2)
 			for (i = 0; i < 16; i++)
@@ -767,10 +799,6 @@ static int ax_init_dev(struct net_device
 	dev->netdev_ops = &ax_netdev_ops;
 	dev->ethtool_ops = &ax_ethtool_ops;
 
-	ret = ax_mii_init(dev);
-	if (ret)
-		goto out_irq;
-
 	ax_NS8390_init(dev, 0);
 
 	ret = register_netdev(dev);
@@ -790,31 +818,27 @@ static int ax_init_dev(struct net_device
 	return ret;
 }
 
-static int ax_remove(struct platform_device *pdev)
+static void ax_remove(struct zorro_dev *pdev)
 {
-	struct net_device *dev = platform_get_drvdata(pdev);
+	struct net_device *dev = zorro_get_drvdata(pdev);
 	struct ei_device *ei_local = netdev_priv(dev);
 	struct ax_device *ax = to_ax_dev(dev);
-	struct resource *mem;
 
 	unregister_netdev(dev);
-	free_irq(dev->irq, dev);
 
-	iounmap(ei_local->mem);
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	release_mem_region(mem->start, resource_size(mem));
-
-	if (ax->map2) {
-		iounmap(ax->map2);
-		mem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-		release_mem_region(mem->start, resource_size(mem));
-	}
+	z_iounmap(ei_local->mem);
+	release_mem_region(pdev->resource.start, 4*0x20+0x800);
 
 	free_netdev(dev);
-
-	return 0;
 }
 
+static const struct ax_plat_data xsurf100_plat_data = {
+	.flags = AXFLG_HAS_EEPROM,
+	.wordlength = 2,
+	.dcr_val = 0x48,
+	.rcr_val = 0x40,
+};
+
 /*
  * ax_probe
  *
@@ -822,13 +846,11 @@ static int ax_remove(struct platform_dev
  * notify us of a new device to attach to. Allocate memory, find the
  * resources and information passed, and map the necessary registers.
  */
-static int ax_probe(struct platform_device *pdev)
+static int ax_probe(struct zorro_dev *z, const struct zorro_device_id *ent)
 {
 	struct net_device *dev;
 	struct ei_device *ei_local;
 	struct ax_device *ax;
-	struct resource *irq, *mem, *mem2;
-	resource_size_t mem_size, mem2_size = 0;
 	int ret = 0;
 
 	dev = ax__alloc_ei_netdev(sizeof(struct ax_device));
@@ -836,107 +858,51 @@ static int ax_probe(struct platform_devi
 		return -ENOMEM;
 
 	/* ok, let's setup our device */
-	SET_NETDEV_DEV(dev, &pdev->dev);
+	SET_NETDEV_DEV(dev, &z->dev);
 	ei_local = netdev_priv(dev);
 	ax = to_ax_dev(dev);
 
-	ax->plat = pdev->dev.platform_data;
-	platform_set_drvdata(pdev, dev);
+	ax->plat = &xsurf100_plat_data;
+	zorro_set_drvdata(z, dev);
 
 	ei_local->rxcr_base = ax->plat->rcr_val;
 
-	/* find the platform resources */
-	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!irq) {
-		dev_err(&pdev->dev, "no IRQ specified\n");
-		ret = -ENXIO;
-		goto exit_mem;
-	}
-
-	dev->irq = irq->start;
-	ax->irqflags = irq->flags & IRQF_TRIGGER_MASK;
-
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem) {
-		dev_err(&pdev->dev, "no MEM specified\n");
-		ret = -ENXIO;
-		goto exit_mem;
-	}
-
-	mem_size = resource_size(mem);
+	dev->irq = IRQ_AMIGA_PORTS;
+	ax->irqflags = IRQF_SHARED;
 
 	/*
 	 * setup the register offsets from either the platform data or
 	 * by using the size of the resource provided
 	 */
-	if (ax->plat->reg_offsets)
-		ei_local->reg_offset = ax->plat->reg_offsets;
-	else {
-		ei_local->reg_offset = ax->reg_offsets;
-		for (ret = 0; ret < 0x18; ret++)
-			ax->reg_offsets[ret] = (mem_size / 0x18) * ret;
-	}
+	ei_local->reg_offset = ax->reg_offsets;
+	for (ret = 0; ret < 0x20; ret++)
+		ax->reg_offsets[ret] = 4 * ret + 0x800;
 
-	if (!request_mem_region(mem->start, mem_size, pdev->name)) {
-		dev_err(&pdev->dev, "cannot reserve registers\n");
+	if (!request_mem_region(z->resource.start, 4*0x20+0x800, "X-Surf 100")) {
+		dev_err(&z->dev, "cannot reserve registers\n");
 		ret = -ENXIO;
 		goto exit_mem;
 	}
 
-	ei_local->mem = ioremap(mem->start, mem_size);
+	ei_local->mem = z_ioremap(z->resource.start, 4*0x20+0x800);
 	dev->base_addr = (unsigned long)ei_local->mem;
 
 	if (ei_local->mem == NULL) {
-		dev_err(&pdev->dev, "Cannot ioremap area %pR\n", mem);
+		dev_err(&z->dev, "Cannot ioremap area %pR\n", (void*)z->resource.start);
 
 		ret = -ENXIO;
 		goto exit_req;
 	}
 
-	/* look for reset area */
-	mem2 = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!mem2) {
-		if (!ax->plat->reg_offsets) {
-			for (ret = 0; ret < 0x20; ret++)
-				ax->reg_offsets[ret] = (mem_size / 0x20) * ret;
-		}
-	} else {
-		mem2_size = resource_size(mem2);
-
-		if (!request_mem_region(mem2->start, mem2_size, pdev->name)) {
-			dev_err(&pdev->dev, "cannot reserve registers\n");
-			ret = -ENXIO;
-			goto exit_mem1;
-		}
-
-		ax->map2 = ioremap(mem2->start, mem2_size);
-		if (!ax->map2) {
-			dev_err(&pdev->dev, "cannot map reset register\n");
-			ret = -ENXIO;
-			goto exit_mem2;
-		}
-
-		ei_local->reg_offset[0x1f] = ax->map2 - ei_local->mem;
-	}
-
 	/* got resources, now initialise and register device */
 	ret = ax_init_dev(dev);
 	if (!ret)
 		return 0;
 
-	if (!ax->map2)
-		goto exit_mem1;
-
-	iounmap(ax->map2);
-
- exit_mem2:
-	release_mem_region(mem2->start, mem2_size);
-
- exit_mem1:
-	iounmap(ei_local->mem);
+	z_iounmap(ei_local->mem);
 
  exit_req:
-	release_mem_region(mem->start, mem_size);
+	release_mem_region(z->resource.start, 4*0x20+0x800);
 
  exit_mem:
 	free_netdev(dev);
@@ -944,43 +910,22 @@ static int ax_probe(struct platform_devi
 	return ret;
 }
 
-/* suspend and resume */
-
-#ifdef CONFIG_PM
-static int ax_suspend(struct platform_device *dev, pm_message_t state)
-{
-	struct net_device *ndev = platform_get_drvdata(dev);
-	struct ax_device *ax = to_ax_dev(ndev);
-
-	ax->resume_open = ax->running;
+#define ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF100 ZORRO_ID(INDIVIDUAL_COMPUTERS, 0x64, 0)
 
-	netif_device_detach(ndev);
-	ax_close(ndev);
-
-	return 0;
-}
-
-static int ax_resume(struct platform_device *pdev)
-{
-	struct net_device *ndev = platform_get_drvdata(pdev);
-	struct ax_device *ax = to_ax_dev(ndev);
-
-	ax_initial_setup(ndev, netdev_priv(ndev));
-	ax_NS8390_init(ndev, ax->resume_open);
-	netif_device_attach(ndev);
-
-	if (ax->resume_open)
-		ax_open(ndev);
-
-	return 0;
-}
+static struct zorro_device_id xsurf100_zorro_tbl[] __devinitdata = {
+	{ ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF100, },
+	{ 0 }
+};
+MODULE_DEVICE_TABLE(zorro, xsurf100_zorro_tbl);
 
-#else
-#define ax_suspend NULL
-#define ax_resume NULL
-#endif
+static struct zorro_driver xsurf100_driver = {
+	.name		= "xsurf100",
+	.id_table	= xsurf100_zorro_tbl,
+	.probe		= ax_probe,
+	.remove		= __devexit_p(ax_remove),
+};
 
-static struct platform_driver axdrv = {
+/*static struct platform_driver axdrv = {
 	.driver	= {
 		.name		= "ax88796",
 		.owner		= THIS_MODULE,
@@ -989,22 +934,23 @@ static struct platform_driver axdrv = {
 	.remove		= ax_remove,
 	.suspend	= ax_suspend,
 	.resume		= ax_resume,
-};
+};*/
 
 static int __init axdrv_init(void)
 {
-	return platform_driver_register(&axdrv);
+	return zorro_register_driver(&xsurf100_driver);
+//	return platform_driver_register(&axdrv);
 }
 
 static void __exit axdrv_exit(void)
 {
-	platform_driver_unregister(&axdrv);
+	zorro_unregister_driver(&xsurf100_driver);
+//	platform_driver_unregister(&axdrv);
 }
 
 module_init(axdrv_init);
 module_exit(axdrv_exit);
 
-MODULE_DESCRIPTION("AX88796 10/100 Ethernet platform driver");
-MODULE_AUTHOR("Ben Dooks, <ben@simtec.co.uk>");
+MODULE_DESCRIPTION("X-Surf 100 driver");
+MODULE_AUTHOR("Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:ax88796");

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
