From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 2/2] [m68k] Atari: use dedicated timer interrupts for EtherNEC (ne.c driver).
Date: Sat, 11 Aug 2012 21:01:54 +1200 (NZST)
Message-ID: <20120811090154.A3218360087@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:55738 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752874Ab2HKJCA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 11 Aug 2012 05:02:00 -0400
Received: by pbbrr13 with SMTP id rr13so4129111pbb.19
        for <linux-m68k@vger.kernel.org>; Sat, 11 Aug 2012 02:02:00 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org


Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/atari/config.c |   33 ++++++++++++---------------------
 1 files changed, 12 insertions(+), 21 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index c7bbfd8..b514aac 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -694,7 +694,7 @@ static struct platform_device *atari_ethernat_devices[] __initdata = {
 
 #define ATARI_ETHERNEC_PHYS_ADDR	0xfffa0000
 #define ATARI_ETHERNEC_BASE		0x300
-#define ATARI_ETHERNEC_IRQ		IRQ_MFP_TIMD
+#define ATARI_ETHERNEC_IRQ		IRQ_MFP_TIMER1
 
 static struct resource rtl8019_resources[] = {
 	[0] = {
@@ -721,17 +721,12 @@ static struct platform_device rtl8019_device = {
 static struct platform_device *atari_ethernec_devices[] __initdata = {
 	&rtl8019_device
 };
-
-irqreturn_t atari_timerd_interrupt(int irq, void *dev_id)
-{
-	return IRQ_HANDLED;
-}
 #endif
 
 int __init atari_platform_init(void)
 {
 	unsigned char *enatc_virt, *enec_virt;
-	int rv = -ENODEV, rv2 = -ENODEV;
+	int rv = -ENODEV, rv2 = -ENODEV, need_timer = 0;
 
 	if (!MACH_IS_ATARI)
 		return -ENODEV;
@@ -740,7 +735,7 @@ int __init atari_platform_init(void)
 	enatc_virt = (unsigned char *)ioremap((ATARI_ETHERNAT_PHYS_ADDR+0x23),2);
 	if (hwreg_present(enatc_virt)) {
 		*enatc_virt |= 0x2;	/* enable SMC91C111 interrupt */
-		rv = platform_add_devices(atari_ethernat_devices, 
+		rv = platform_add_devices(atari_ethernat_devices,
 					  ARRAY_SIZE(atari_ethernat_devices));
 	}
 	iounmap(enatc_virt);
@@ -749,25 +744,21 @@ int __init atari_platform_init(void)
 #if IS_ENABLED(CONFIG_ATARI_ETHERNEC)
 	enec_virt = (unsigned char *)ioremap((ATARI_ETHERNEC_PHYS_ADDR), 0xf);
 	if (hwreg_present(enec_virt)) {
-		int ret;
-		const char *name = "Timer D dummy interrupt";
+		need_timer = 1;
+		rv2 = platform_add_devices(atari_ethernec_devices,
+					   ARRAY_SIZE(atari_ethernec_devices));
+	}
+	iounmap(enec_virt);
+#endif
 
-		/* timer routine set up in atari_ethernec_probe() */
+	if (need_timer) {
 		/* set Timer D data Register */
 		st_mfp.tim_dt_d = 123;	/* 200 Hz */
 		/* start timer D, div = 1:100 */
 		st_mfp.tim_ct_cd = (st_mfp.tim_ct_cd & 0xf0) | 0x6;
-		/* Must make this shared in case other timer ints are needed */
-		ret = request_irq(IRQ_MFP_TIMD, atari_timerd_interrupt,
-				  IRQF_SHARED, name, atari_timerd_interrupt);
-		if (ret) {
-			printk(KERN_ERR "atari_platform_init: failed to register dummy timer interrupt for EtherNEC/EtherNAT!\n");
-		}
-		rv2 = platform_add_devices(atari_ethernec_devices,
-					   ARRAY_SIZE(atari_ethernec_devices));
+		/* timer routine set up in atari_init_IRQ -
+		   master interrupt for multiple timer users */
 	}
-	iounmap(enec_virt);
-#endif
 
 	if (rv2) 
 		return rv2;
-- 
1.5.6
