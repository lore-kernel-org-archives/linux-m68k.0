From: <gerg@snapgear.com>
Subject: [PATCH 10/11] m68knommu: clean up Pin Assignment definitions for the 54xx ColdFire CPU
Date: Fri, 21 Sep 2012 16:51:12 +1000
Message-ID: <1348210273-31246-11-git-send-email-gerg@snapgear.com>
References: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:28566 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754302Ab2IUGvo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Sep 2012 02:51:44 -0400
In-Reply-To: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The Pin Assignment register definitions for the ColdFire 54xx CPU family are
inconsistently named and defined compared to the other ColdFire part
definitions. Rename them with the same prefix as used on other parts,
MCFGPIO_PAR_, and make their definitions include the MCF_MBAR periphperal
region offset.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m54xxsim.h    |   21 ++++++++++++++-------
 arch/m68k/platform/coldfire/m54xx.c |   10 ++++------
 arch/m68k/platform/coldfire/pci.c   |    4 ++--
 3 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/arch/m68k/include/asm/m54xxsim.h b/arch/m68k/include/asm/m54xxsim.h
index d6a5079..d3bd838 100644
--- a/arch/m68k/include/asm/m54xxsim.h
+++ b/arch/m68k/include/asm/m54xxsim.h
@@ -70,15 +70,25 @@
 #define	MCFEPORT_EPFR		(MCF_MBAR + 0xf0c)	/* Flags */
 
 /*
- *	Some PSC related definitions
+ *	Pin Assignment register definitions
  */
-#define MCF_PAR_PSC(x)		(0x000A4F-((x)&0x3))
+#define MCFGPIO_PAR_FBCTL	(MCF_MBAR + 0xA40)
+#define MCFGPIO_PAR_FBCS	(MCF_MBAR + 0xA42)
+#define MCFGPIO_PAR_DMA		(MCF_MBAR + 0xA43)
+#define MCFGPIO_PAR_FECI2CIRQ	(MCF_MBAR + 0xA44)
+#define MCFGPIO_PAR_PCIBG	(MCF_MBAR + 0xA48)	/* PCI bus grant */
+#define MCFGPIO_PAR_PCIBR	(MCF_MBAR + 0xA4A)	/* PCI */
+#define MCFGPIO_PAR_PSC0	(MCF_MBAR + 0xA4F)
+#define MCFGPIO_PAR_PSC1	(MCF_MBAR + 0xA4E)
+#define MCFGPIO_PAR_PSC2	(MCF_MBAR + 0xA4D)
+#define MCFGPIO_PAR_PSC3	(MCF_MBAR + 0xA4C)
+#define MCFGPIO_PAR_DSPI	(MCF_MBAR + 0xA50)
+#define MCFGPIO_PAR_TIMER	(MCF_MBAR + 0xA52)
+
 #define MCF_PAR_SDA		(0x0008)
 #define MCF_PAR_SCL		(0x0004)
 #define MCF_PAR_PSC_TXD		(0x04)
 #define MCF_PAR_PSC_RXD		(0x08)
-#define MCF_PAR_PSC_RTS(x)	(((x)&0x03)<<4)
-#define MCF_PAR_PSC_CTS(x)	(((x)&0x03)<<6)
 #define MCF_PAR_PSC_CTS_GPIO	(0x00)
 #define MCF_PAR_PSC_CTS_BCLK	(0x80)
 #define MCF_PAR_PSC_CTS_CTS	(0xC0)
@@ -87,7 +97,4 @@
 #define MCF_PAR_PSC_RTS_RTS	(0x30)
 #define MCF_PAR_PSC_CANRX	(0x40)
 
-#define MCF_PAR_PCIBG		(CONFIG_MBAR + 0xa48)	/* PCI bus grant */
-#define MCF_PAR_PCIBR		(CONFIG_MBAR + 0xa4a)	/* PCI */
-
 #endif	/* m54xxsim_h */
diff --git a/arch/m68k/platform/coldfire/m54xx.c b/arch/m68k/platform/coldfire/m54xx.c
index 2081c6c..1f7c7fd 100644
--- a/arch/m68k/platform/coldfire/m54xx.c
+++ b/arch/m68k/platform/coldfire/m54xx.c
@@ -30,14 +30,12 @@
 static void __init m54xx_uarts_init(void)
 {
 	/* enable io pins */
-	__raw_writeb(MCF_PAR_PSC_TXD | MCF_PAR_PSC_RXD,
-		MCF_MBAR + MCF_PAR_PSC(0));
+	__raw_writeb(MCF_PAR_PSC_TXD | MCF_PAR_PSC_RXD, MCFGPIO_PAR_PSC0);
 	__raw_writeb(MCF_PAR_PSC_TXD | MCF_PAR_PSC_RXD | MCF_PAR_PSC_RTS_RTS,
-		MCF_MBAR + MCF_PAR_PSC(1));
+		MCFGPIO_PAR_PSC1);
 	__raw_writeb(MCF_PAR_PSC_TXD | MCF_PAR_PSC_RXD | MCF_PAR_PSC_RTS_RTS |
-		MCF_PAR_PSC_CTS_CTS, MCF_MBAR + MCF_PAR_PSC(2));
-	__raw_writeb(MCF_PAR_PSC_TXD | MCF_PAR_PSC_RXD,
-		MCF_MBAR + MCF_PAR_PSC(3));
+		MCF_PAR_PSC_CTS_CTS, MCFGPIO_PAR_PSC2);
+	__raw_writeb(MCF_PAR_PSC_TXD | MCF_PAR_PSC_RXD, MCFGPIO_PAR_PSC3);
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/platform/coldfire/pci.c b/arch/m68k/platform/coldfire/pci.c
index 553210d..8572246 100644
--- a/arch/m68k/platform/coldfire/pci.c
+++ b/arch/m68k/platform/coldfire/pci.c
@@ -272,8 +272,8 @@ static int __init mcf_pci_init(void)
 		PACR_EXTMINTE(0x1f), PACR);
 
 	/* Set required multi-function pins for PCI bus use */
-	__raw_writew(0x3ff, MCF_PAR_PCIBG);
-	__raw_writew(0x3ff, MCF_PAR_PCIBR);
+	__raw_writew(0x3ff, MCFGPIO_PAR_PCIBG);
+	__raw_writew(0x3ff, MCFGPIO_PAR_PCIBR);
 
 	/* Set up config space for local host bus controller */
 	__raw_writel(PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER |
-- 
1.7.0.4
