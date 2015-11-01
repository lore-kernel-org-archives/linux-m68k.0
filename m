From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v7 09/26] char/nvram: Use generic fixed_size_llseek()
Date: Sun, 01 Nov 2015 21:42:11 +1100
Message-ID: <20151101104204.541636065@telegraphics.com.au>
References: <20151101104202.301856132@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline; filename=nvram-generic-llseek
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-m68k@vger.kernel.org

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

---
 drivers/char/nvram.c |   16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

Index: linux/drivers/char/nvram.c
===================================================================
--- linux.orig/drivers/char/nvram.c	2015-11-01 21:41:34.000000000 +1100
+++ linux/drivers/char/nvram.c	2015-11-01 21:41:35.000000000 +1100
@@ -235,21 +235,7 @@ EXPORT_SYMBOL(arch_nvram_ops);
 
 static loff_t nvram_misc_llseek(struct file *file, loff_t offset, int origin)
 {
-	switch (origin) {
-	case 0:
-		/* nothing to do */
-		break;
-	case 1:
-		offset += file->f_pos;
-		break;
-	case 2:
-		offset += NVRAM_BYTES;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return (offset >= 0) ? (file->f_pos = offset) : -EINVAL;
+	return fixed_size_llseek(file, offset, origin, nvram_size);
 }
 
 static ssize_t nvram_misc_read(struct file *file, char __user *buf,
