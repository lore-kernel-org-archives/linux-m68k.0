From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 12/12] m68knommu: make ColdFire internal peripheral region configurable
Date: Tue, 8 Mar 2011 23:04:09 +1000
Message-ID: <1299589449-24974-13-git-send-email-gerg@uclinux.org>
References: <1299589449-24974-1-git-send-email-gerg@uclinux.org>
 <1299589449-24974-2-git-send-email-gerg@uclinux.org>
 <1299589449-24974-3-git-send-email-gerg@uclinux.org>
 <1299589449-24974-4-git-send-email-gerg@uclinux.org>
 <1299589449-24974-5-git-send-email-gerg@uclinux.org>
 <1299589449-24974-6-git-send-email-gerg@uclinux.org>
 <1299589449-24974-7-git-send-email-gerg@uclinux.org>
 <1299589449-24974-8-git-send-email-gerg@uclinux.org>
 <1299589449-24974-9-git-send-email-gerg@uclinux.org>
 <1299589449-24974-10-git-send-email-gerg@uclinux.org>
 <1299589449-24974-11-git-send-email-gerg@uclinux.org>
 <1299589449-24974-12-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:51469 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754370Ab1CHNIL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Mar 2011 08:08:11 -0500
In-Reply-To: <1299589449-24974-12-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

Most ColdFire CPUs have an internal peripheral set that can be mapped at
a user selectable address. Different ColdFire parts either use an MBAR
register of an IPSBAR register to map the peripheral region. Most boards
use the Freescale default mappings - but not all.

Make the setting of the MBAR or IPSBAR register configurable. And only make
the selection available on the appropriate ColdFire CPU types.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/coldfire.h |   15 ++++++++-----
 arch/m68knommu/Kconfig           |   40 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/include/asm/coldfire.h b/arch/m68k/include/asm/coldfire.h
index f06a0a4..98d1d25 100644
--- a/arch/m68k/include/asm/coldfire.h
+++ b/arch/m68k/include/asm/coldfire.h
@@ -33,14 +33,17 @@
  *	the base address. Some have an IPSBAR register instead, and it
  *	has slightly different rules on its size and alignment. Some
  *	parts have fixed addresses and the internal peripherals cannot
- *	be relocated in the address space.
+ *	be relocated in the CPU address space.
  *
- *	This is generally setup by the boards start up code.
+ *	The value of MBAR or IPSBAR is config time selectable, we no
+ *	longer hard define it here. No MBAR or IPSBAR will be defined if
+ *	this part has a fixed peripheral address map.
  */
-#if defined(CONFIG_M523x) || defined(CONFIG_M527x) || defined(CONFIG_M528x)
-#define	MCF_IPSBAR	0x40000000
-#else
-#define	MCF_MBAR	0x10000000
+#ifdef CONFIG_MBAR
+#define	MCF_MBAR	CONFIG_MBAR
+#endif
+#ifdef CONFIG_IPSBAR
+#define	MCF_IPSBAR	CONFIG_IPSBAR
 #endif
 
 /****************************************************************************/
diff --git a/arch/m68knommu/Kconfig b/arch/m68knommu/Kconfig
index 04c7d34..b597ce0 100644
--- a/arch/m68knommu/Kconfig
+++ b/arch/m68knommu/Kconfig
@@ -79,6 +79,12 @@ config HAVE_CACHE_SPLIT
 config HAVE_CACHE_CB
 	bool
 
+config HAVE_MBAR
+	bool
+
+config HAVE_IPSBAR
+	bool
+
 source "init/Kconfig"
 
 source "kernel/Kconfig.freezer"
@@ -112,12 +118,14 @@ config M68360
 config M5206
 	bool "MCF5206"
 	select COLDFIRE_SW_A7
+	select HAVE_MBAR
 	help
 	  Motorola ColdFire 5206 processor support.
 
 config M5206e
 	bool "MCF5206e"
 	select COLDFIRE_SW_A7
+	select HAVE_MBAR
 	help
 	  Motorola ColdFire 5206e processor support.
 
@@ -132,30 +140,35 @@ config M523x
 	bool "MCF523x"
 	select GENERIC_CLOCKEVENTS
 	select HAVE_CACHE_SPLIT
+	select HAVE_IPSBAR
 	help
 	  Freescale Coldfire 5230/1/2/4/5 processor support
 
 config M5249
 	bool "MCF5249"
 	select COLDFIRE_SW_A7
+	select HAVE_MBAR
 	help
 	  Motorola ColdFire 5249 processor support.
 
 config M5271
 	bool "MCF5271"
 	select HAVE_CACHE_SPLIT
+	select HAVE_IPSBAR
 	help
 	  Freescale (Motorola) ColdFire 5270/5271 processor support.
 
 config M5272
 	bool "MCF5272"
 	select COLDFIRE_SW_A7
+	select HAVE_MBAR
 	help
 	  Motorola ColdFire 5272 processor support.
 
 config M5275
 	bool "MCF5275"
 	select HAVE_CACHE_SPLIT
+	select HAVE_IPSBAR
 	help
 	  Freescale (Motorola) ColdFire 5274/5275 processor support.
 
@@ -163,6 +176,7 @@ config M528x
 	bool "MCF528x"
 	select GENERIC_CLOCKEVENTS
 	select HAVE_CACHE_SPLIT
+	select HAVE_IPSBAR
 	help
 	  Motorola ColdFire 5280/5282 processor support.
 
@@ -170,6 +184,7 @@ config M5307
 	bool "MCF5307"
 	select COLDFIRE_SW_A7
 	select HAVE_CACHE_CB
+	select HAVE_MBAR
 	help
 	  Motorola ColdFire 5307 processor support.
 
@@ -183,18 +198,21 @@ config M5407
 	bool "MCF5407"
 	select COLDFIRE_SW_A7
 	select HAVE_CACHE_CB
+	select HAVE_MBAR
 	help
 	  Motorola ColdFire 5407 processor support.
 
 config M547x
 	bool "MCF547x"
 	select HAVE_CACHE_CB
+	select HAVE_MBAR
 	help
 	  Freescale ColdFire 5470/5471/5472/5473/5474/5475 processor support.
 
 config M548x
 	bool "MCF548x"
 	select HAVE_CACHE_CB
+	select HAVE_MBAR
 	help
 	  Freescale ColdFire 5480/5481/5482/5483/5484/5485 processor support.
 
@@ -650,6 +668,28 @@ config VECTORBASE
 	  platforms this address is programmed into the VBR register, thus
 	  actually setting the address to use.
 
+config MBAR
+	hex "Address of the MBAR (internal peripherals)"
+	default "0x10000000"
+	depends on HAVE_MBAR
+	help
+	  Define the address of the internal system peripherals. This value
+	  is set in the processors MBAR register. This is generally setup by
+	  the boot loader, and will not be written by the kernel. By far most
+	  ColdFire boards use the default 0x10000000 value, so if unsure then
+	  use this.
+
+config IPSBAR
+	hex "Address of the IPSBAR (internal peripherals)"
+	default "0x40000000"
+	depends on HAVE_IPSBAR
+	help
+	  Define the address of the internal system peripherals. This value
+	  is set in the processors IPSBAR register. This is generally setup by
+	  the boot loader, and will not be written by the kernel. By far most
+	  ColdFire boards use the default 0x40000000 value, so if unsure then
+	  use this.
+
 config KERNELBASE
 	hex "Address of the base of kernel code"
 	default "0x400"
-- 
1.7.0.4
