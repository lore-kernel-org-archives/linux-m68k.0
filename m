From: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Subject: [PATCH 4/11] Atari: fix EtherNAT interrupt; conditonal platform device
 register
Date: Thu, 24 May 2012 02:48:15 +0200
Message-ID: <E1SXMDv-0002Xe-6F@zirkon.biophys.uni-duesseldorf.de>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-venus.uni-duesseldorf.de ([134.99.128.32]:43705 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1756001Ab2EXBsQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 23 May 2012 21:48:16 -0400
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-11.01 (built Feb 12 2010; 32bit))
 id <0M4I00D004WF1M00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Thu, 24 May 2012 02:48:15 +0200 (MEST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

>From 15da61fd8cb166dd9402b98eb9c835e0e29b5ae0 Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitz@debian.org>
Date: Wed, 23 May 2012 20:19:39 +1200
Subject: [PATCH 04/11] [m68k] Atari: fix EtherNAT interrupt number; conditionalize EtherNAT platform device register

---
 arch/m68k/atari/config.c |   17 ++++++++++++++---
 1 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 4fc7396..9a83537 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -662,7 +662,7 @@ static void atari_get_hardware_list(struct seq_file *m)
  */
 
 #define ATARI_ETHERNAT_PHYS_ADDR	0x80000000
-#define ATARI_ETHERNAT_IRQ		0xc3
+#define ATARI_ETHERNAT_IRQ		140
 
 static struct resource smc91x_resources[] = {
 	[0] = {
@@ -686,16 +686,27 @@ static struct platform_device smc91x_device = {
 	.resource	= smc91x_resources,
 };
 
-static struct platform_device *atari_platform_devices[] __initdata = {
+static struct platform_device *atari_ethernat_devices[] __initdata = {
 	&smc91x_device
 };
 
 int __init atari_platform_init(void)
 {
+	unsigned char *enatc_virt;
+	int rv = -ENODEV;
+	
 	if (!MACH_IS_ATARI)
 		return -ENODEV;
 
-	return platform_add_devices(atari_platform_devices, ARRAY_SIZE(atari_platform_devices));
+#if IS_ENABLED(CONFIG_ATARI_ETHERNAT_OLD)
+	enatc_virt = (unsigned char *)ioremap((ATARI_ETHERNAT_PHYS_ADDR+0x23), 0xf);
+	if (hwreg_present(enatc_virt)) {
+		*enatc_virt |= 0x2;	/* enable SMC91C111 interrupt */
+		rv = platform_add_devices(atari_ethernat_devices, ARRAY_SIZE(atari_ethernat_devices));
+	}
+#endif
+
+	return rv;
 }
 
 arch_initcall(atari_platform_init);
-- 
1.7.0.4
