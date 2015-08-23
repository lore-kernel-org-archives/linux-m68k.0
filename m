From: Finn Thain <fthain@telegraphics.com.au>
Subject: [RFC v6 11/25] char/nvram: Add "devname:nvram" module alias
Date: Sun, 23 Aug 2015 20:41:40 +1000
Message-ID: <20150823104132.297909047@telegraphics.com.au>
References: <20150823104129.517600532@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline; filename=nvram-module-alias
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-m68k@vger.kernel.org

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

---
 drivers/char/nvram.c |    1 +
 1 file changed, 1 insertion(+)

Index: linux/drivers/char/nvram.c
===================================================================
--- linux.orig/drivers/char/nvram.c	2015-08-23 20:41:04.000000000 +1000
+++ linux/drivers/char/nvram.c	2015-08-23 20:41:07.000000000 +1000
@@ -577,3 +577,4 @@ module_exit(nvram_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_MISCDEV(NVRAM_MINOR);
+MODULE_ALIAS("devname:nvram");
