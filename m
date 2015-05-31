From: Finn Thain <fthain@telegraphics.com.au>
Subject: [RFC 12/24] char/nvram: Add "devname:nvram" module alias
Date: Sun, 31 May 2015 11:01:44 +1000
Message-ID: <20150531010135.349475001@telegraphics.com.au>
References: <20150531010132.289674310@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:47150 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754718AbbEaBQ7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 30 May 2015 21:16:59 -0400
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
--- linux.orig/drivers/char/nvram.c	2015-05-31 11:01:11.000000000 +1000
+++ linux/drivers/char/nvram.c	2015-05-31 11:01:13.000000000 +1000
@@ -575,3 +575,4 @@ module_exit(nvram_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_MISCDEV(NVRAM_MINOR);
+MODULE_ALIAS("devname:nvram");
