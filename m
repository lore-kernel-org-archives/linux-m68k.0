From: Finn Thain <fthain@telegraphics.com.au>
Subject: [RFC v2 11/24] m68k/atari: Implement arch_nvram_ops methods and enable CONFIG_HAVE_ARCH_NVRAM_OPS
Date: Sun, 14 Jun 2015 17:46:18 +1000
Message-ID: <20150614074610.054663362@telegraphics.com.au>
References: <20150614074607.242676098@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:55698 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752140AbbFNNIT (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 14 Jun 2015 09:08:19 -0400
Content-Disposition: inline; filename=atari-hook-up-misc-device
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Atari RTC NVRAM has a checksum so implement the remaining arch_nvram_ops
methods for the set_checksum and initialize ioctls. Enable
CONFIG_HAVE_ARCH_NVRAM_OPS.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

---

This re-enables the nvram module for Atari.

---
 arch/m68k/Kconfig       |    3 +++
 arch/m68k/atari/nvram.c |   24 ++++++++++++++++++++++++
 drivers/char/Kconfig    |    2 +-
 3 files changed, 28 insertions(+), 1 deletion(-)

Index: linux/arch/m68k/atari/nvram.c
===================================================================
--- linux.orig/arch/m68k/atari/nvram.c	2015-06-14 17:45:39.000000000 +1000
+++ linux/arch/m68k/atari/nvram.c	2015-06-14 17:45:47.000000000 +1000
@@ -73,6 +73,26 @@ static void __nvram_set_checksum(void)
 	__nvram_write_byte(sum, ATARI_CKS_LOC + 1);
 }
 
+static long nvram_set_checksum(void)
+{
+	spin_lock_irq(&rtc_lock);
+	__nvram_set_checksum();
+	spin_unlock_irq(&rtc_lock);
+	return 0;
+}
+
+static long nvram_initialize(void)
+{
+	loff_t i;
+
+	spin_lock_irq(&rtc_lock);
+	for (i = 0; i < NVRAM_BYTES; ++i)
+		__nvram_write_byte(0, i);
+	__nvram_set_checksum();
+	spin_unlock_irq(&rtc_lock);
+	return 0;
+}
+
 static ssize_t nvram_read(char *buf, size_t count, loff_t *ppos)
 {
 	char *p = buf;
@@ -119,6 +139,8 @@ static ssize_t nvram_write(char *buf, si
 
 static ssize_t nvram_get_size(void)
 {
+	if (!MACH_IS_ATARI)
+		return -ENODEV;
 	return NVRAM_BYTES;
 }
 
@@ -126,6 +148,8 @@ const struct nvram_ops arch_nvram_ops =
 	.read           = nvram_read,
 	.write          = nvram_write,
 	.get_size       = nvram_get_size,
+	.set_checksum   = nvram_set_checksum,
+	.initialize     = nvram_initialize,
 };
 EXPORT_SYMBOL(arch_nvram_ops);
 
Index: linux/drivers/char/Kconfig
===================================================================
--- linux.orig/drivers/char/Kconfig	2015-06-14 17:45:35.000000000 +1000
+++ linux/drivers/char/Kconfig	2015-06-14 17:45:47.000000000 +1000
@@ -247,7 +247,7 @@ source "drivers/char/hw_random/Kconfig"
 
 config NVRAM
 	tristate "/dev/nvram support"
-	depends on X86 || (ARM && RTC_DRV_CMOS) || GENERIC_NVRAM
+	depends on X86 || (ARM && RTC_DRV_CMOS) || GENERIC_NVRAM || HAVE_ARCH_NVRAM_OPS
 	---help---
 	  If you say Y here and create a character special file /dev/nvram
 	  with major number 10 and minor number 144 using mknod ("man mknod"),
Index: linux/arch/m68k/Kconfig
===================================================================
--- linux.orig/arch/m68k/Kconfig	2015-06-14 17:45:34.000000000 +1000
+++ linux/arch/m68k/Kconfig	2015-06-14 17:45:47.000000000 +1000
@@ -71,6 +71,9 @@ config PGTABLE_LEVELS
 	default 2 if SUN3 || COLDFIRE
 	default 3
 
+config HAVE_ARCH_NVRAM_OPS
+	def_bool ATARI
+
 source "init/Kconfig"
 
 source "kernel/Kconfig.freezer"
