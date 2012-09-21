From: <gerg@snapgear.com>
Subject: [PATCH 02/11] m68knommu: remove unused ColdFire 5282 register definitions
Date: Fri, 21 Sep 2012 16:51:04 +1000
Message-ID: <1348210273-31246-3-git-send-email-gerg@snapgear.com>
References: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:28458 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752319Ab2IUGv1 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Sep 2012 02:51:27 -0400
In-Reply-To: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

There is a bunch of old unused and ugly register definitions in the ColdFire
5282 header. Remove them.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m528xsim.h |   51 +-------------------------------------
 1 files changed, 1 insertions(+), 50 deletions(-)

diff --git a/arch/m68k/include/asm/m528xsim.h b/arch/m68k/include/asm/m528xsim.h
index 4acb3c0..cf68ca0 100644
--- a/arch/m68k/include/asm/m528xsim.h
+++ b/arch/m68k/include/asm/m528xsim.h
@@ -233,23 +233,6 @@
 #define MCFGPIO_IRQ_VECBASE	MCFINT_VECBASE
 #define MCFGPIO_PIN_MAX		180
 
-
-/*
- *	Derek Cheung - 6 Feb 2005
- *		add I2C and QSPI register definition using Freescale's MCF5282
- */
-/* set Port AS pin for I2C or UART */
-#define MCF5282_GPIO_PASPAR     (volatile u16 *) (MCF_IPSBAR + 0x00100056)
-
-/* Port UA Pin Assignment Register (8 Bit) */
-#define MCF5282_GPIO_PUAPAR	0x10005C
-
-/* Interrupt Mask Register Register Low */ 
-#define MCF5282_INTC0_IMRL      (volatile u32 *) (MCF_IPSBAR + 0x0C0C)
-/* Interrupt Control Register 7 */
-#define MCF5282_INTC0_ICR17     (volatile u8 *) (MCF_IPSBAR + 0x0C51)
-
-
 /*
  *  Reset Control Unit (relative to IPSBAR).
  */
@@ -259,37 +242,5 @@
 #define	MCF_RCR_SWRESET		0x80		/* Software reset bit */
 #define	MCF_RCR_FRCSTOUT	0x40		/* Force external reset */
 
-/*********************************************************************
-*
-* Inter-IC (I2C) Module
-*
-*********************************************************************/
-/* Read/Write access macros for general use */
-#define MCF5282_I2C_I2ADR       (volatile u8 *) (MCF_IPSBAR + 0x0300) // Address 
-#define MCF5282_I2C_I2FDR       (volatile u8 *) (MCF_IPSBAR + 0x0304) // Freq Divider
-#define MCF5282_I2C_I2CR        (volatile u8 *) (MCF_IPSBAR + 0x0308) // Control
-#define MCF5282_I2C_I2SR        (volatile u8 *) (MCF_IPSBAR + 0x030C) // Status
-#define MCF5282_I2C_I2DR        (volatile u8 *) (MCF_IPSBAR + 0x0310) // Data I/O
-
-/* Bit level definitions and macros */
-#define MCF5282_I2C_I2ADR_ADDR(x)                       (((x)&0x7F)<<0x01)
-
-#define MCF5282_I2C_I2FDR_IC(x)                         (((x)&0x3F))
-
-#define MCF5282_I2C_I2CR_IEN    (0x80)	// I2C enable
-#define MCF5282_I2C_I2CR_IIEN   (0x40)  // interrupt enable
-#define MCF5282_I2C_I2CR_MSTA   (0x20)  // master/slave mode
-#define MCF5282_I2C_I2CR_MTX    (0x10)  // transmit/receive mode
-#define MCF5282_I2C_I2CR_TXAK   (0x08)  // transmit acknowledge enable
-#define MCF5282_I2C_I2CR_RSTA   (0x04)  // repeat start
-
-#define MCF5282_I2C_I2SR_ICF    (0x80)  // data transfer bit
-#define MCF5282_I2C_I2SR_IAAS   (0x40)  // I2C addressed as a slave
-#define MCF5282_I2C_I2SR_IBB    (0x20)  // I2C bus busy
-#define MCF5282_I2C_I2SR_IAL    (0x10)  // aribitration lost
-#define MCF5282_I2C_I2SR_SRW    (0x04)  // slave read/write
-#define MCF5282_I2C_I2SR_IIF    (0x02)  // I2C interrupt
-#define MCF5282_I2C_I2SR_RXAK   (0x01)  // received acknowledge
-
-
+/****************************************************************************/
 #endif	/* m528xsim_h */
-- 
1.7.0.4
