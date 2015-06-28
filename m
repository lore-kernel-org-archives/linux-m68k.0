From: Finn Thain <fthain@telegraphics.com.au>
Subject: [RFC v3 11/24] char/nvram: Add "devname:nvram" module alias
Date: Sun, 28 Jun 2015 11:42:10 +1000
Message-ID: <20150628014202.392612846@telegraphics.com.au>
References: <20150628014159.732792697@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:43692 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752164AbbF1But (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 27 Jun 2015 21:50:49 -0400
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
--- linux.orig/drivers/char/nvram.c	2015-06-28 11:41:38.000000000 +1000
+++ linux/drivers/char/nvram.c	2015-06-28 11:41:40.000000000 +1000
@@ -577,3 +577,4 @@ module_exit(nvram_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_MISCDEV(NVRAM_MINOR);
+MODULE_ALIAS("devname:nvram");
