From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v7 11/26] char/nvram: Add "devname:nvram" module alias
Date: Sun, 01 Nov 2015 21:42:13 +1100
Message-ID: <20151101104205.031702434@telegraphics.com.au>
References: <20151101104202.301856132@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:46448 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752525AbbKAKtH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Nov 2015 05:49:07 -0500
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
--- linux.orig/drivers/char/nvram.c	2015-11-01 21:41:35.000000000 +1100
+++ linux/drivers/char/nvram.c	2015-11-01 21:41:37.000000000 +1100
@@ -577,3 +577,4 @@ module_exit(nvram_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_MISCDEV(NVRAM_MINOR);
+MODULE_ALIAS("devname:nvram");
