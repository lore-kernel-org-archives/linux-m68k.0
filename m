From: Finn Thain <fthain@telegraphics.com.au>
Subject: [RFC v2 12/24] char/nvram: Add "devname:nvram" module alias
Date: Sun, 14 Jun 2015 17:46:19 +1000
Message-ID: <20150614074610.304677069@telegraphics.com.au>
References: <20150614074607.242676098@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:55699 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752143AbbFNNIT (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 14 Jun 2015 09:08:19 -0400
Content-Disposition: inline; filename=nvram-module-alias
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

---
 drivers/char/nvram.c |    1 +
 1 file changed, 1 insertion(+)

Index: linux/drivers/char/nvram.c
===================================================================
--- linux.orig/drivers/char/nvram.c	2015-06-14 17:45:46.000000000 +1000
+++ linux/drivers/char/nvram.c	2015-06-14 17:45:48.000000000 +1000
@@ -577,3 +577,4 @@ module_exit(nvram_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_MISCDEV(NVRAM_MINOR);
+MODULE_ALIAS("devname:nvram");
