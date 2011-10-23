From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 07/16] m68k/mac: cleanup forward declarations
Date: Mon, 24 Oct 2011 01:11:15 +1100
Message-ID: <20111023141143.048746772@telegraphics.com.au>
References: <20111023141108.856998818@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:46030 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755598Ab1JWOLr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 23 Oct 2011 10:11:47 -0400
Content-Disposition: inline; filename=cleanup-headers
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Move some forward declarations into header files and adjust includes.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Index: linux-m68k/arch/m68k/include/asm/macintosh.h
===================================================================
--- linux-m68k.orig/arch/m68k/include/asm/macintosh.h	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/include/asm/macintosh.h	2011-10-23 00:51:01.000000000 +1100
@@ -16,12 +16,6 @@ extern void mac_irq_enable(struct irq_da
 extern void mac_irq_disable(struct irq_data *data);
 
 /*
- *	Floppy driver magic hook - probably shouldn't be here
- */
-
-extern void via1_set_head(int);
-
-/*
  *	Macintosh Table
  */
 
Index: linux-m68k/drivers/block/swim.c
===================================================================
--- linux-m68k.orig/drivers/block/swim.c	2011-10-22 23:02:22.000000000 +1100
+++ linux-m68k/drivers/block/swim.c	2011-10-22 23:02:38.000000000 +1100
@@ -26,7 +26,6 @@
 #include <linux/delay.h>
 #include <linux/platform_device.h>
 
-#include <asm/macintosh.h>
 #include <asm/mac_via.h>
 
 #define CARDNAME "swim"
Index: linux-m68k/arch/m68k/include/asm/mac_baboon.h
===================================================================
--- linux-m68k.orig/arch/m68k/include/asm/mac_baboon.h	2011-10-22 23:02:22.000000000 +1100
+++ linux-m68k/arch/m68k/include/asm/mac_baboon.h	2011-10-22 23:02:38.000000000 +1100
@@ -29,4 +29,10 @@ struct baboon {
 				 */
 };
 
+extern int baboon_present;
+
+extern void baboon_register_interrupts(void);
+extern void baboon_irq_enable(int);
+extern void baboon_irq_disable(int);
+
 #endif /* __ASSEMBLY **/
Index: linux-m68k/arch/m68k/include/asm/mac_iop.h
===================================================================
--- linux-m68k.orig/arch/m68k/include/asm/mac_iop.h	2011-10-22 23:02:22.000000000 +1100
+++ linux-m68k/arch/m68k/include/asm/mac_iop.h	2011-10-22 23:02:38.000000000 +1100
@@ -159,4 +159,6 @@ extern void iop_upload_code(uint, __u8 *
 extern void iop_download_code(uint, __u8 *, uint, __u16);
 extern __u8 *iop_compare_code(uint, __u8 *, uint, __u16);
 
+extern void iop_register_interrupts(void);
+
 #endif /* __ASSEMBLY__ */
Index: linux-m68k/arch/m68k/include/asm/mac_oss.h
===================================================================
--- linux-m68k.orig/arch/m68k/include/asm/mac_oss.h	2011-10-22 23:02:22.000000000 +1100
+++ linux-m68k/arch/m68k/include/asm/mac_oss.h	2011-10-23 00:51:05.000000000 +1100
@@ -91,4 +91,8 @@ struct mac_oss {
 extern volatile struct mac_oss *oss;
 extern int oss_present;
 
+extern void oss_register_interrupts(void);
+extern void oss_irq_enable(int);
+extern void oss_irq_disable(int);
+
 #endif /* __ASSEMBLY__ */
Index: linux-m68k/arch/m68k/include/asm/mac_psc.h
===================================================================
--- linux-m68k.orig/arch/m68k/include/asm/mac_psc.h	2011-10-22 23:02:22.000000000 +1100
+++ linux-m68k/arch/m68k/include/asm/mac_psc.h	2011-10-22 23:02:38.000000000 +1100
@@ -211,6 +211,10 @@
 extern volatile __u8 *psc;
 extern int psc_present;
 
+extern void psc_register_interrupts(void);
+extern void psc_irq_enable(int);
+extern void psc_irq_disable(int);
+
 /*
  *	Access functions
  */
Index: linux-m68k/arch/m68k/include/asm/mac_via.h
===================================================================
--- linux-m68k.orig/arch/m68k/include/asm/mac_via.h	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/include/asm/mac_via.h	2011-10-23 00:51:06.000000000 +1100
@@ -254,6 +254,11 @@
 extern volatile __u8 *via1,*via2;
 extern int rbv_present,via_alt_mapping;
 
+extern void via_register_interrupts(void);
+extern void via_irq_enable(int);
+extern void via_irq_disable(int);
+extern void via1_irq(unsigned int irq, struct irq_desc *desc);
+extern void via1_set_head(int);
 extern int via2_scsi_drq_pending(void);
 
 static inline int rbv_set_video_bpp(int bpp)
Index: linux-m68k/arch/m68k/mac/macints.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/macints.c	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/mac/macints.c	2011-10-23 00:51:07.000000000 +1100
@@ -110,75 +110,27 @@
  *
  */
 
-#include <linux/module.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/sched.h>
-#include <linux/kernel_stat.h>
-#include <linux/interrupt.h> /* for intr_count */
+#include <linux/interrupt.h>
+#include <linux/irq.h>
 #include <linux/delay.h>
-#include <linux/seq_file.h>
 
-#include <asm/system.h>
 #include <asm/irq.h>
-#include <asm/traps.h>
-#include <asm/bootinfo.h>
 #include <asm/macintosh.h>
+#include <asm/macints.h>
 #include <asm/mac_via.h>
 #include <asm/mac_psc.h>
+#include <asm/mac_oss.h>
+#include <asm/mac_iop.h>
+#include <asm/mac_baboon.h>
 #include <asm/hwtest.h>
-#include <asm/errno.h>
-#include <asm/macints.h>
 #include <asm/irq_regs.h>
-#include <asm/mac_oss.h>
 
 #define SHUTUP_SONIC
 
 /*
- * VIA/RBV hooks
- */
-
-extern void via_register_interrupts(void);
-extern void via_irq_enable(int);
-extern void via_irq_disable(int);
-extern void via_irq_clear(int);
-
-/*
- * OSS hooks
- */
-
-extern void oss_register_interrupts(void);
-extern void oss_irq_enable(int);
-extern void oss_irq_disable(int);
-extern void oss_irq_clear(int);
-
-/*
- * PSC hooks
- */
-
-extern void psc_register_interrupts(void);
-extern void psc_irq_enable(int);
-extern void psc_irq_disable(int);
-extern void psc_irq_clear(int);
-
-/*
- * IOP hooks
- */
-
-extern void iop_register_interrupts(void);
-
-/*
- * Baboon hooks
- */
-
-extern int baboon_present;
-
-extern void baboon_register_interrupts(void);
-extern void baboon_irq_enable(int);
-extern void baboon_irq_disable(int);
-extern void baboon_irq_clear(int);
-
-/*
  * console_loglevel determines NMI handler function
  */
 
Index: linux-m68k/arch/m68k/mac/oss.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/oss.c	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/mac/oss.c	2011-10-23 00:51:05.000000000 +1100
@@ -30,8 +30,6 @@
 int oss_present;
 volatile struct mac_oss *oss;
 
-extern void via1_irq(unsigned int irq, struct irq_desc *desc);
-
 /*
  * Initialize the OSS
  *
Index: linux-m68k/arch/m68k/mac/via.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/via.c	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/mac/via.c	2011-10-23 00:51:07.000000000 +1100
@@ -77,9 +77,6 @@ static int gIER,gIFR,gBufA,gBufB;
 static u8 nubus_disabled;
 
 void via_debug_dump(void);
-void via_irq_enable(int irq);
-void via_irq_disable(int irq);
-void via_irq_clear(int irq);
 
 /*
  * Initialize the VIAs
Index: linux-m68k/arch/m68k/mac/baboon.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/baboon.c	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/mac/baboon.c	2011-10-23 00:51:04.000000000 +1100
@@ -8,13 +8,8 @@
 
 #include <linux/types.h>
 #include <linux/kernel.h>
-#include <linux/mm.h>
-#include <linux/delay.h>
-#include <linux/init.h>
 #include <linux/irq.h>
 
-#include <asm/traps.h>
-#include <asm/bootinfo.h>
 #include <asm/macintosh.h>
 #include <asm/macints.h>
 #include <asm/mac_baboon.h>
