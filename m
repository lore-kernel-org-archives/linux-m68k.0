From: Finn Thain <fthain@telegraphics.com.au>
Subject: [RFC v5 12/26] char/nvram: Add "devname:nvram" module alias
Date: Sat, 25 Jul 2015 17:46:11 +1000
Message-ID: <20150725074602.453343896@telegraphics.com.au>
References: <20150725074559.543547894@telegraphics.com.au>
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
--- linux.orig/drivers/char/nvram.c	2015-07-25 17:45:35.000000000 +1000
+++ linux/drivers/char/nvram.c	2015-07-25 17:45:37.000000000 +1000
@@ -577,3 +577,4 @@ module_exit(nvram_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_MISCDEV(NVRAM_MINOR);
+MODULE_ALIAS("devname:nvram");
