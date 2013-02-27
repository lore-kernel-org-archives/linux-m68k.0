From: Luis Alves <ljalvs@gmail.com>
Subject: [PATCH] Fix MC68328.h defines
Date: Wed, 27 Feb 2013 21:05:42 +0000
Message-ID: <1361999142-15483-1-git-send-email-ljalvs@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ee0-f43.google.com ([74.125.83.43]:42994 "EHLO
	mail-ee0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752275Ab3B0VFN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 27 Feb 2013 16:05:13 -0500
Received: by mail-ee0-f43.google.com with SMTP id c50so914014eek.2
        for <linux-m68k@vger.kernel.org>; Wed, 27 Feb 2013 13:05:12 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org, linux-m68k@vger.kernel.org
Cc: gerg@uclinux.org, ljalvs@gmail.com

Hi,

This patch fixes some broken #define's in the MC68328.h file.
Most of them are whitespaces and one is an incorrect define of TCN.

Regards,
Luis Alves

Signed-off-by: Luis Alves <ljalvs@gmail.com>
---
 arch/m68k/include/asm/MC68328.h |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/include/asm/MC68328.h b/arch/m68k/include/asm/MC68328.h
index a337e56..4ebf098 100644
--- a/arch/m68k/include/asm/MC68328.h
+++ b/arch/m68k/include/asm/MC68328.h
@@ -293,7 +293,7 @@
 /*
  * Here go the bitmasks themselves
  */
-#define IMR_MSPIM 	(1 << SPIM _IRQ_NUM)	/* Mask SPI Master interrupt */
+#define IMR_MSPIM 	(1 << SPIM_IRQ_NUM)	/* Mask SPI Master interrupt */
 #define	IMR_MTMR2	(1 << TMR2_IRQ_NUM)	/* Mask Timer 2 interrupt */
 #define IMR_MUART	(1 << UART_IRQ_NUM)	/* Mask UART interrupt */	
 #define	IMR_MWDT	(1 << WDT_IRQ_NUM)	/* Mask Watchdog Timer interrupt */
@@ -327,7 +327,7 @@
 #define IWR_ADDR	0xfffff308
 #define IWR		LONG_REF(IWR_ADDR)
 
-#define IWR_SPIM 	(1 << SPIM _IRQ_NUM)	/* SPI Master interrupt */
+#define IWR_SPIM 	(1 << SPIM_IRQ_NUM)	/* SPI Master interrupt */
 #define	IWR_TMR2	(1 << TMR2_IRQ_NUM)	/* Timer 2 interrupt */
 #define IWR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */	
 #define	IWR_WDT		(1 << WDT_IRQ_NUM)	/* Watchdog Timer interrupt */
@@ -357,7 +357,7 @@
 #define ISR_ADDR	0xfffff30c
 #define ISR		LONG_REF(ISR_ADDR)
 
-#define ISR_SPIM 	(1 << SPIM _IRQ_NUM)	/* SPI Master interrupt */
+#define ISR_SPIM 	(1 << SPIM_IRQ_NUM)	/* SPI Master interrupt */
 #define	ISR_TMR2	(1 << TMR2_IRQ_NUM)	/* Timer 2 interrupt */
 #define ISR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */	
 #define	ISR_WDT		(1 << WDT_IRQ_NUM)	/* Watchdog Timer interrupt */
@@ -391,7 +391,7 @@
 #define IPR_ADDR	0xfffff310
 #define IPR		LONG_REF(IPR_ADDR)
 
-#define IPR_SPIM 	(1 << SPIM _IRQ_NUM)	/* SPI Master interrupt */
+#define IPR_SPIM 	(1 << SPIM_IRQ_NUM)	/* SPI Master interrupt */
 #define	IPR_TMR2	(1 << TMR2_IRQ_NUM)	/* Timer 2 interrupt */
 #define IPR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */	
 #define	IPR_WDT		(1 << WDT_IRQ_NUM)	/* Watchdog Timer interrupt */
@@ -757,7 +757,7 @@
 
 /* 'EZ328-compatible definitions */
 #define TCN_ADDR	TCN1_ADDR
-#define TCN		TCN
+#define TCN		TCN1
 
 /*
  * Timer Unit 1 and 2 Status Registers
-- 
1.7.10.4
