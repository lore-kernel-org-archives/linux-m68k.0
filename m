From: Finn Thain <fthain@telegraphics.com.au>
Subject: [RFC v5 13/26] powerpc: Cleanup nvram includes
Date: Sat, 25 Jul 2015 17:46:12 +1000
Message-ID: <20150725074602.693328813@telegraphics.com.au>
References: <20150725074559.543547894@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:42475 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755045AbbGYH4x (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 25 Jul 2015 03:56:53 -0400
Content-Disposition: inline; filename=powerpc-fix-nvram-includes
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-fbdev@vger.kernel.org

The nvram_read_byte() and nvram_write_byte() definitions in asm/nvram.h
duplicate those in linux/nvram.h. Get rid of the former to prepare for
adoption of struct arch_nvram_ops (which is defined in linux/nvram.h for
general use).

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

---

Changes since v4:
- Fix possible git bisect build failure with CONFIG_PPC_PMAC=n.

---
 arch/powerpc/include/asm/nvram.h           |    3 ---
 arch/powerpc/kernel/setup_32.c             |    1 +
 drivers/char/generic_nvram.c               |    1 +
 drivers/video/fbdev/matrox/matroxfb_base.c |    2 +-
 4 files changed, 3 insertions(+), 4 deletions(-)

Index: linux/arch/powerpc/include/asm/nvram.h
===================================================================
--- linux.orig/arch/powerpc/include/asm/nvram.h	2015-07-25 17:42:34.000000000 +1000
+++ linux/arch/powerpc/include/asm/nvram.h	2015-07-25 17:45:38.000000000 +1000
@@ -101,7 +101,4 @@ extern int nvram_write_os_partition(stru
 /* Determine NVRAM size */
 extern ssize_t nvram_get_size(void);
 
-/* Normal access to NVRAM */
-extern unsigned char nvram_read_byte(int i);
-extern void nvram_write_byte(unsigned char c, int i);
 #endif /* _ASM_POWERPC_NVRAM_H */
Index: linux/arch/powerpc/kernel/setup_32.c
===================================================================
--- linux.orig/arch/powerpc/kernel/setup_32.c	2015-07-25 17:42:34.000000000 +1000
+++ linux/arch/powerpc/kernel/setup_32.c	2015-07-25 17:45:38.000000000 +1000
@@ -16,6 +16,7 @@
 #include <linux/cpu.h>
 #include <linux/console.h>
 #include <linux/memblock.h>
+#include <linux/nvram.h>
 
 #include <asm/io.h>
 #include <asm/prom.h>
Index: linux/drivers/video/fbdev/matrox/matroxfb_base.c
===================================================================
--- linux.orig/drivers/video/fbdev/matrox/matroxfb_base.c	2015-07-25 17:42:34.000000000 +1000
+++ linux/drivers/video/fbdev/matrox/matroxfb_base.c	2015-07-25 17:45:38.000000000 +1000
@@ -111,12 +111,12 @@
 #include "matroxfb_g450.h"
 #include <linux/matroxfb.h>
 #include <linux/interrupt.h>
+#include <linux/nvram.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 
 #ifdef CONFIG_PPC_PMAC
 #include <asm/machdep.h>
-unsigned char nvram_read_byte(int);
 static int default_vmode = VMODE_NVRAM;
 static int default_cmode = CMODE_NVRAM;
 #endif
Index: linux/drivers/char/generic_nvram.c
===================================================================
--- linux.orig/drivers/char/generic_nvram.c	2015-07-25 17:42:34.000000000 +1000
+++ linux/drivers/char/generic_nvram.c	2015-07-25 17:45:38.000000000 +1000
@@ -20,6 +20,7 @@
 #include <linux/fcntl.h>
 #include <linux/init.h>
 #include <linux/mutex.h>
+#include <linux/nvram.h>
 #include <asm/uaccess.h>
 #include <asm/nvram.h>
 #ifdef CONFIG_PPC_PMAC
