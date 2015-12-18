From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] m68k/atari, m68k/sun3: Fix SCSI platform device registration
 when driver is modular
Date: Fri, 18 Dec 2015 12:44:28 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1512181218530.12965@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:44003 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752783AbbLRBop (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Dec 2015 20:44:45 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org


Fixes: 3ff228af84b5 ("atari_scsi: Convert to platform device")
Fixes: 0d31f8759109 ("sun3_scsi: Convert to platform device")
Reported-by: Michael Schmitz <schmitzmic@gmail.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Index: linux/arch/m68k/atari/config.c
===================================================================
--- linux.orig/arch/m68k/atari/config.c	2015-12-18 12:06:53.000000000 +1100
+++ linux/arch/m68k/atari/config.c	2015-12-18 12:07:00.000000000 +1100
@@ -858,7 +858,7 @@ static struct platform_device *atari_net
 };
 #endif /* CONFIG_ATARI_ETHERNEC */
 
-#ifdef CONFIG_ATARI_SCSI
+#if IS_ENABLED(CONFIG_ATARI_SCSI)
 static const struct resource atari_scsi_st_rsrc[] __initconst = {
 	{
 		.flags = IORESOURCE_IRQ,
@@ -910,7 +910,7 @@ int __init atari_platform_init(void)
 	}
 #endif
 
-#ifdef CONFIG_ATARI_SCSI
+#if IS_ENABLED(CONFIG_ATARI_SCSI)
 	if (ATARIHW_PRESENT(ST_SCSI))
 		platform_device_register_simple("atari_scsi", -1,
 			atari_scsi_st_rsrc, ARRAY_SIZE(atari_scsi_st_rsrc));
Index: linux/arch/m68k/sun3/config.c
===================================================================
--- linux.orig/arch/m68k/sun3/config.c	2015-12-18 12:06:53.000000000 +1100
+++ linux/arch/m68k/sun3/config.c	2015-12-18 12:07:00.000000000 +1100
@@ -171,7 +171,7 @@ static void __init sun3_sched_init(irq_h
         intersil_clear();
 }
 
-#ifdef CONFIG_SUN3_SCSI
+#if IS_ENABLED(CONFIG_SUN3_SCSI)
 
 static const struct resource sun3_scsi_vme_rsrc[] __initconst = {
 	{
