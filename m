From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] m68k: remove CONFIG_EARLY_PRINTK dependency on CONFIG_EMBEDDED,
 default to n
Date: Wed, 29 May 2013 16:53:32 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1305291630520.10197@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:56169 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934833Ab3E2Gxn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 29 May 2013 02:53:43 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>


Allow CONFIG_EARLY_PRINTK without requiring both CONFIG_EMBEDDED and 
CONFIG_DEBUG. Default to disabled.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>


Index: linux-3.3/arch/m68k/Kconfig.debug
===================================================================
--- linux-3.3.orig/arch/m68k/Kconfig.debug	2012-03-19 10:15:34.000000000 +1100
+++ linux-3.3/arch/m68k/Kconfig.debug	2013-05-29 10:54:21.000000000 +1000
@@ -11,9 +11,9 @@ config BOOTPARAM_STRING
 	depends on BOOTPARAM
 
 config EARLY_PRINTK
-	bool "Early printk" if EMBEDDED
+	bool "Early printk"
 	depends on MVME16x || MAC
-	default y
+	default n
 	help
           Write kernel log output directly to a serial port.
 
