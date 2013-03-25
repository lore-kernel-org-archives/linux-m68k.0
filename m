From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 14/14] m68k/atari: USB - Add ISP1160 USB host controller support
Date: Mon, 25 Mar 2013 14:16:32 +1300
Message-ID: <1364174192-25406-15-git-send-email-schmitz@debian.org>
References: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:60925 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756518Ab3CYBRD (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Mar 2013 21:17:03 -0400
Received: by mail-pb0-f50.google.com with SMTP id up1so3858689pbc.9
        for <linux-m68k@vger.kernel.org>; Sun, 24 Mar 2013 18:17:03 -0700 (PDT)
In-Reply-To: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org, Michael Schmitz <schmitz@debian.org>

Add Atari specific support code for isp116x-hcd driver used by EtherNAT
and NetUSBee adapters. Both use a 16-bit data bus wiring that is byte-swapped
in hardware. The EtherNAT adapter also has quirks relating to interrupts
and needs interrupts disabled until after the chip has been reset.

Debugging of FIFO register access code and NetUSBee support by David Galvez
<dgalvez75@gmail.com> (MiNT driver author).

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/Kconfig.bus          |   11 ++++
 drivers/usb/host/isp116x-hcd.c |  109 +++++++++++++++++++++++++++++++++++++++-
 drivers/usb/host/isp116x.h     |   41 ++++++++++++---
 3 files changed, 150 insertions(+), 11 deletions(-)

diff --git a/arch/m68k/Kconfig.bus b/arch/m68k/Kconfig.bus
index 675b087..efb6aab 100644
--- a/arch/m68k/Kconfig.bus
+++ b/arch/m68k/Kconfig.bus
@@ -55,6 +55,17 @@ config ATARI_ROM_ISA
 	  The only driver currently using this adapter is the EtherNEC
 	  driver for RTL8019AS based NE2000 compatible network cards.
 
+config ATARI_USB
+	bool "Atari USB host controller support"
+	depends on ATARI
+	select USB_SUPPORT
+	select USB_ARCH_HAS_HCD
+	help
+	  This option enables support for USB host controllers contained on
+	  the EtherNAT and NetUSBee cards for Atari. You will have to select
+	  an appropriate HCD driver in the USB section (the ISP1160 one is
+	  the most commonly used one).
+
 config GENERIC_ISA_DMA
 	def_bool ISA
 
diff --git a/drivers/usb/host/isp116x-hcd.c b/drivers/usb/host/isp116x-hcd.c
index b64e661..fce2766 100644
--- a/drivers/usb/host/isp116x-hcd.c
+++ b/drivers/usb/host/isp116x-hcd.c
@@ -82,8 +82,25 @@ MODULE_LICENSE("GPL");
 
 static const char hcd_name[] = "isp116x-hcd";
 
+#ifdef CONFIG_ATARI
+static unsigned char *enat_cr;		/* EtherNAT CPLD control register for USB interrupt enable */
+#endif
+
 /*-----------------------------------------------------------------*/
 
+  /*
+   * 16 bit data bus byte swapped in hardware
+   *
+   * isp116x_write_addr uses raw_readw - hw byte swap takes care of different endianness
+   *
+   * isp116x_write_data16 uses raw_readw - byte swap done in hw so BE data ends up in proper LE format
+   * isp116x_raw_write_data16 uses readw - effectively same endiannes retained, use for LE format data
+   *
+   * reversed semantics of primitives allows to keep the register
+   * access functions unchanged for commands and control data - byte
+   * swap done transparently
+   */
+
 /*
   Write len bytes to fifo, pad till 32-bit boundary
  */
@@ -100,18 +117,27 @@ static void write_ptddata_to_fifo(struct isp116x *isp116x, void *buf, int len)
 
 	if ((unsigned long)dp2 & 1) {
 		/* not aligned */
+
 		for (; len > 1; len -= 2) {
 			w = *dp++;
 			w |= *dp++ << 8;
 			isp116x_raw_write_data16(isp116x, w);
 		}
 		if (len)
+#ifdef CONFIG_ATARI	/* MSch: needs swap */
+			isp116x_raw_write_data16(isp116x, (u16) *dp);
+#else
 			isp116x_write_data16(isp116x, (u16) * dp);
+#endif
 	} else {
 		/* aligned */
 		for (; len > 1; len -= 2) {
 			/* Keep byte order ! */
+#ifdef CONFIG_ATARI	/* MSch: needs swap */
+			isp116x_write_data16(isp116x, cpu_to_le16(*dp2++));
+#else
 			isp116x_raw_write_data16(isp116x, cpu_to_le16(*dp2++));
+#endif
 		}
 
 		if (len)
@@ -137,6 +163,7 @@ static void read_ptddata_from_fifo(struct isp116x *isp116x, void *buf, int len)
 
 	if ((unsigned long)dp2 & 1) {
 		/* not aligned */
+
 		for (; len > 1; len -= 2) {
 			w = isp116x_raw_read_data16(isp116x);
 			*dp++ = w & 0xff;
@@ -144,12 +171,20 @@ static void read_ptddata_from_fifo(struct isp116x *isp116x, void *buf, int len)
 		}
 
 		if (len)
+#ifdef CONFIG_ATARI	/* MSch: needs swap */
+			*dp = 0xff & isp116x_raw_read_data16(isp116x);
+#else
 			*dp = 0xff & isp116x_read_data16(isp116x);
+#endif
 	} else {
 		/* aligned */
 		for (; len > 1; len -= 2) {
 			/* Keep byte order! */
+#ifdef CONFIG_ATARI	/* MSch: needs swap */
+			*dp2++ = le16_to_cpu(isp116x_read_data16(isp116x));
+#else
 			*dp2++ = le16_to_cpu(isp116x_raw_read_data16(isp116x));
+#endif
 		}
 
 		if (len)
@@ -593,6 +628,11 @@ static irqreturn_t isp116x_irq(struct usb_hcd *hcd)
 	u16 irqstat;
 	irqreturn_t ret = IRQ_NONE;
 
+#ifdef CONFIG_ATARI
+	if ((unsigned long) hcd->rsrc_start >= 0x80000000UL)
+		/* EtherNAT control register, disable interrupt for USB */
+		*enat_cr = (*enat_cr) & 0xFB;
+#endif
 	spin_lock(&isp116x->lock);
 	isp116x_write_reg16(isp116x, HCuPINTENB, 0);
 	irqstat = isp116x_read_reg16(isp116x, HCuPINT);
@@ -636,6 +676,10 @@ static irqreturn_t isp116x_irq(struct usb_hcd *hcd)
 	isp116x_write_reg16(isp116x, HCuPINTENB, isp116x->irqenb);
       done:
 	spin_unlock(&isp116x->lock);
+#ifdef CONFIG_ATARI
+	if ((unsigned long) hcd->rsrc_start >= 0x80000000UL)
+		*enat_cr = (*enat_cr) | 0x04;		/* EtherNAT control register, enable interrupt for USB */
+#endif
 	return ret;
 }
 
@@ -1259,8 +1303,11 @@ static int isp116x_reset(struct usb_hcd *hcd)
 	struct isp116x *isp116x = hcd_to_isp116x(hcd);
 	unsigned long t;
 	u16 clkrdy = 0;
+#ifdef CONFIG_ATARI
+	int ret, timeout = 200 /* ms */ ;
+#else
 	int ret, timeout = 15 /* ms */ ;
-
+#endif
 	ret = isp116x_sw_reset(isp116x);
 	if (ret)
 		return ret;
@@ -1291,6 +1338,12 @@ static void isp116x_stop(struct usb_hcd *hcd)
 	u32 val;
 
 	spin_lock_irqsave(&isp116x->lock, flags);
+
+#ifdef CONFIG_ATARI
+	if ((unsigned long) hcd->rsrc_start >= 0x80000000UL)
+		/* EtherNAT control register, disable interrupt for USB */
+		*enat_cr = (*enat_cr) & 0xFB;
+#endif
 	isp116x_write_reg16(isp116x, HCuPINTENB, 0);
 
 	/* Switch off ports' power, some devices don't come up
@@ -1356,6 +1409,12 @@ static int isp116x_start(struct usb_hcd *hcd)
 	val |= RH_A_PSM;
 	/* Report overcurrent per port */
 	val |= RH_A_OCPM;
+#ifdef CONFIG_ATARI
+	/* Galvez: For NetUSBee, Overcurrent protection disable,
+	   to stop interrupt storm because OC events */
+	if ((unsigned long) hcd->rsrc_start < 0x80000000UL)
+		val |= (RH_A_NOCP | RH_A_NPS);
+#endif
 	isp116x_write_reg32(isp116x, HCRHDESCA, val);
 	isp116x->rhdesca = isp116x_read_reg32(isp116x, HCRHDESCA);
 
@@ -1394,6 +1453,10 @@ static int isp116x_start(struct usb_hcd *hcd)
 	isp116x_write_reg32(isp116x, HCRHPORT1, RH_PS_CCS);
 	isp116x_write_reg32(isp116x, HCRHPORT2, RH_PS_CCS);
 
+#ifdef CONFIG_ATARI
+	if ((unsigned long) hcd->rsrc_start >= 0x80000000UL)
+		*enat_cr = (*enat_cr) | 0x04;		/* EtherNAT control register, enable interrupt for USB */
+#endif
 	isp116x_show_regs_log(isp116x);
 	spin_unlock_irqrestore(&isp116x->lock, flags);
 	return 0;
@@ -1539,6 +1602,9 @@ static int isp116x_remove(struct platform_device *pdev)
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 	struct isp116x *isp116x;
 	struct resource *res;
+#ifdef CONFIG_ATARI
+	unsigned long enat_cr_phys;
+#endif
 
 	if (!hcd)
 		return 0;
@@ -1552,7 +1618,14 @@ static int isp116x_remove(struct platform_device *pdev)
 	iounmap(isp116x->addr_reg);
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	release_mem_region(res->start, 2);
-
+#ifdef CONFIG_ATARI
+	if ((unsigned long) hcd->rsrc_start >= 0x80000000UL) {
+		iounmap(enat_cr);
+		/* unmap & release EtherNAT CPLD control register - at 0x23 off board base address */
+		enat_cr_phys = (res->start & 0xFFFFFF00) + 0x23;
+		release_mem_region(enat_cr_phys, 2);
+	}
+#endif
 	usb_put_hcd(hcd);
 	return 0;
 }
@@ -1567,6 +1640,9 @@ static int isp116x_probe(struct platform_device *pdev)
 	int irq;
 	int ret = 0;
 	unsigned long irqflags;
+#ifdef CONFIG_ATARI
+	unsigned long enat_cr_phys;
+#endif
 
 	if (usb_disabled())
 		return -ENODEV;
@@ -1613,6 +1689,26 @@ static int isp116x_probe(struct platform_device *pdev)
 		goto err4;
 	}
 
+#ifdef CONFIG_ATARI
+	if ((unsigned long) data->start >= 0x80000000UL) {
+		/* map EtherNAT CPLD control register - at 0x23 off board base address */
+		enat_cr_phys = (data->start & 0xffffff00) + 0x23;
+		if (!request_mem_region(enat_cr_phys, 2, hcd_name)) {
+			ret = -EBUSY;
+			goto err41;
+		}
+		enat_cr = ioremap(enat_cr_phys, 2);
+		if (enat_cr == NULL) {
+			ret = -ENOMEM;
+			goto err42;
+		}
+		/* Disable USB interrupt in the EtherNat board */
+		*enat_cr = (*enat_cr) & 0xFB;
+	}
+	pr_info("ISP116X probe: data %p virt. %p, addr %p virt. %p\n",
+		(void *)data->start, data_reg, (void *)addr->start, addr_reg);
+#endif
+
 	/* allocate and initialize hcd */
 	hcd = usb_create_hcd(&isp116x_hc_driver, &pdev->dev, dev_name(&pdev->dev));
 	if (!hcd) {
@@ -1653,11 +1749,20 @@ static int isp116x_probe(struct platform_device *pdev)
 
 	return 0;
 
+
       err7:
 	usb_remove_hcd(hcd);
       err6:
 	usb_put_hcd(hcd);
       err5:
+#ifdef CONFIG_ATARI
+	if ((unsigned long) data->start >= 0x80000000UL)
+		iounmap(enat_cr);
+      err42:
+	if ((unsigned long) data->start >= 0x80000000UL)
+		release_mem_region(enat_cr_phys, 2);
+      err41:
+#endif
 	iounmap(data_reg);
       err4:
 	release_mem_region(data->start, 2);
diff --git a/drivers/usb/host/isp116x.h b/drivers/usb/host/isp116x.h
index 9a2c400..6359ccb 100644
--- a/drivers/usb/host/isp116x.h
+++ b/drivers/usb/host/isp116x.h
@@ -364,22 +364,45 @@ struct isp116x_ep {
 #define	IRQ_TEST()	do{}while(0)
 #endif
 
+
+#ifdef CONFIG_ATARI
+  /*
+   * 16 bit data bus byte swapped in hardware on both Atari variants.
+   * EtherNAT variant of ISP1160 integration is memory mapped at 0x800000XX,
+   * and uses regular readw/__raw_readw (but semantics swapped).
+   * NetUSBee variant is hooked up through ROM port and uses ROM port
+   * IO access, with fake IO address of 0x3XX.
+   * Selection of the appropriate accessors relies on ioremapped addresses still
+   * retaining the 0x3XX bit.
+   */
+#define isp_readw(p)		((((unsigned long)(__pa(p)) & 0x00000F00) == 0x00000300UL) ? isa_rom_readw_raw(__pa(p)) : __raw_readw((p)))
+#define isp_writew(v, p)	((((unsigned long)(__pa(p)) & 0x00000F00) == 0x00000300UL) ? isa_rom_writew_raw((v), __pa(p)) : __raw_writew((v), (p)))
+#define isp_raw_readw(p)	((((unsigned long)(__pa(p)) & 0x00000F00) == 0x00000300UL) ? isa_rom_readw(__pa(p)) : readw((p)))
+#define isp_raw_writew(v, p)	((((unsigned long)(__pa(p)) & 0x00000F00) == 0x00000300UL) ? isa_rom_writew((v), __pa(p)) : writew((v), (p)))
+#else
+  /* sane hardware */
+#define isp_readw		readw
+#define isp_writew		writew
+#define isp_raw_readw		__raw_readw
+#define isp_raw_writew		__raw_writew
+#endif
+
 static inline void isp116x_write_addr(struct isp116x *isp116x, unsigned reg)
 {
 	IRQ_TEST();
-	writew(reg & 0xff, isp116x->addr_reg);
+	isp_writew(reg & 0xff, isp116x->addr_reg);
 	isp116x_delay(isp116x, 300);
 }
 
 static inline void isp116x_write_data16(struct isp116x *isp116x, u16 val)
 {
-	writew(val, isp116x->data_reg);
+	isp_writew(val, isp116x->data_reg);
 	isp116x_delay(isp116x, 150);
 }
 
 static inline void isp116x_raw_write_data16(struct isp116x *isp116x, u16 val)
 {
-	__raw_writew(val, isp116x->data_reg);
+	isp_raw_writew(val, isp116x->data_reg);
 	isp116x_delay(isp116x, 150);
 }
 
@@ -387,7 +410,7 @@ static inline u16 isp116x_read_data16(struct isp116x *isp116x)
 {
 	u16 val;
 
-	val = readw(isp116x->data_reg);
+	val = isp_readw(isp116x->data_reg);
 	isp116x_delay(isp116x, 150);
 	return val;
 }
@@ -396,16 +419,16 @@ static inline u16 isp116x_raw_read_data16(struct isp116x *isp116x)
 {
 	u16 val;
 
-	val = __raw_readw(isp116x->data_reg);
+	val = isp_raw_readw(isp116x->data_reg);
 	isp116x_delay(isp116x, 150);
 	return val;
 }
 
 static inline void isp116x_write_data32(struct isp116x *isp116x, u32 val)
 {
-	writew(val & 0xffff, isp116x->data_reg);
+	isp_writew(val & 0xffff, isp116x->data_reg);
 	isp116x_delay(isp116x, 150);
-	writew(val >> 16, isp116x->data_reg);
+	isp_writew(val >> 16, isp116x->data_reg);
 	isp116x_delay(isp116x, 150);
 }
 
@@ -413,9 +436,9 @@ static inline u32 isp116x_read_data32(struct isp116x *isp116x)
 {
 	u32 val;
 
-	val = (u32) readw(isp116x->data_reg);
+	val = (u32) isp_readw(isp116x->data_reg);
 	isp116x_delay(isp116x, 150);
-	val |= ((u32) readw(isp116x->data_reg)) << 16;
+	val |= ((u32) isp_readw(isp116x->data_reg)) << 16;
 	isp116x_delay(isp116x, 150);
 	return val;
 }
-- 
1.7.0.4
