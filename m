From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 12/12] m68k/atari: USB - add ISP1160 USB host controller support
Date: Sat,  6 Apr 2013 13:26:46 +1300
Message-ID: <1365208006-16227-13-git-send-email-schmitz@debian.org>
References: <1365208006-16227-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:36708 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1163112Ab3DFA13 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 5 Apr 2013 20:27:29 -0400
Received: by mail-pd0-f179.google.com with SMTP id x11so2253588pdj.38
        for <linux-m68k@vger.kernel.org>; Fri, 05 Apr 2013 17:27:28 -0700 (PDT)
In-Reply-To: <1365208006-16227-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, Michael Schmitz <schmitz@debian.org>

Add Atari specific quirks to the isp116x-hcd USB driver used for
EtherNAT and NetUSBee. The bus interface of both devices is byte
swapped in hardware, this has to be taken into account by the
register access macros. On the EtherNAT, interrupts have to be
explicitly disabled and enabled around reset and start callbacks.

Debugging of FIFO register access code and NetUSBee support by
David Galvez <dgalvez75@gmail.com> (MiNT driver author)

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/Kconfig.bus          |   11 ++++++
 drivers/usb/host/isp116x-hcd.c |   69 +++++++++++++++++++++++++++++++++++++++-
 drivers/usb/host/isp116x.h     |   41 ++++++++++++++++++-----
 3 files changed, 111 insertions(+), 10 deletions(-)

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
index b64e661..8310045 100644
--- a/drivers/usb/host/isp116x-hcd.c
+++ b/drivers/usb/host/isp116x-hcd.c
@@ -82,8 +82,22 @@ MODULE_LICENSE("GPL");
 
 static const char hcd_name[] = "isp116x-hcd";
 
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
@@ -100,18 +114,27 @@ static void write_ptddata_to_fifo(struct isp116x *isp116x, void *buf, int len)
 
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
@@ -137,6 +160,7 @@ static void read_ptddata_from_fifo(struct isp116x *isp116x, void *buf, int len)
 
 	if ((unsigned long)dp2 & 1) {
 		/* not aligned */
+
 		for (; len > 1; len -= 2) {
 			w = isp116x_raw_read_data16(isp116x);
 			*dp++ = w & 0xff;
@@ -144,12 +168,20 @@ static void read_ptddata_from_fifo(struct isp116x *isp116x, void *buf, int len)
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
@@ -1261,6 +1293,12 @@ static int isp116x_reset(struct usb_hcd *hcd)
 	u16 clkrdy = 0;
 	int ret, timeout = 15 /* ms */ ;
 
+#if defined(CONFIG_ATARI)
+	/* NetUSBee needs longer timeout */
+	if ((unsigned long) hcd->rsrc_start < 0x80000000UL)
+		timeout = 200;
+#endif
+
 	ret = isp116x_sw_reset(isp116x);
 	if (ret)
 		return ret;
@@ -1291,6 +1329,11 @@ static void isp116x_stop(struct usb_hcd *hcd)
 	u32 val;
 
 	spin_lock_irqsave(&isp116x->lock, flags);
+
+#ifdef CONFIG_ATARI
+	if ((unsigned long) hcd->rsrc_start >= 0x80000000UL)
+		disable_irq(hcd->irq);
+#endif
 	isp116x_write_reg16(isp116x, HCuPINTENB, 0);
 
 	/* Switch off ports' power, some devices don't come up
@@ -1316,6 +1359,10 @@ static int isp116x_start(struct usb_hcd *hcd)
 
 	spin_lock_irqsave(&isp116x->lock, flags);
 
+#ifdef CONFIG_ATARI
+	if ((unsigned long) hcd->rsrc_start >= 0x80000000UL)
+		disable_irq(hcd->irq);
+#endif
 	/* clear interrupt status and disable all interrupt sources */
 	isp116x_write_reg16(isp116x, HCuPINT, 0xff);
 	isp116x_write_reg16(isp116x, HCuPINTENB, 0);
@@ -1356,6 +1403,12 @@ static int isp116x_start(struct usb_hcd *hcd)
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
 
@@ -1395,6 +1448,10 @@ static int isp116x_start(struct usb_hcd *hcd)
 	isp116x_write_reg32(isp116x, HCRHPORT2, RH_PS_CCS);
 
 	isp116x_show_regs_log(isp116x);
+#ifdef CONFIG_ATARI
+	if ((unsigned long) hcd->rsrc_start >= 0x80000000UL)
+		enable_irq(hcd->irq);
+#endif
 	spin_unlock_irqrestore(&isp116x->lock, flags);
 	return 0;
 }
@@ -1552,7 +1609,6 @@ static int isp116x_remove(struct platform_device *pdev)
 	iounmap(isp116x->addr_reg);
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	release_mem_region(res->start, 2);
-
 	usb_put_hcd(hcd);
 	return 0;
 }
@@ -1613,6 +1669,11 @@ static int isp116x_probe(struct platform_device *pdev)
 		goto err4;
 	}
 
+#ifdef CONFIG_ATARI
+	pr_info("ISP116X probe: data %p virt. %p, addr %p virt. %p\n",
+		(void *)data->start, data_reg, (void *)addr->start, addr_reg);
+#endif
+
 	/* allocate and initialize hcd */
 	hcd = usb_create_hcd(&isp116x_hc_driver, &pdev->dev, dev_name(&pdev->dev));
 	if (!hcd) {
@@ -1641,6 +1702,11 @@ static int isp116x_probe(struct platform_device *pdev)
 		goto err6;
 	}
 
+#ifdef CONFIG_ATARI
+	/* Disable USB interrupt in the EtherNat board */
+	if ((unsigned long) hcd->rsrc_start >= 0x80000000UL)
+		disable_irq(irq);
+#endif
 	ret = usb_add_hcd(hcd, irq, irqflags);
 	if (ret)
 		goto err6;
@@ -1653,6 +1719,7 @@ static int isp116x_probe(struct platform_device *pdev)
 
 	return 0;
 
+
       err7:
 	usb_remove_hcd(hcd);
       err6:
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
