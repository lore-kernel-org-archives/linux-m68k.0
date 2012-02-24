From: <gerg@snapgear.com>
Subject: [PATCH 2/7] m68knommu: make 523x QSPI platform addressing consistent
Date: Fri, 24 Feb 2012 15:06:50 +1000
Message-ID: <1330060015-10877-3-git-send-email-gerg@snapgear.com>
References: <1330060015-10877-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:28473 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750912Ab2BXFGE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 24 Feb 2012 00:06:04 -0500
In-Reply-To: <1330060015-10877-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all QSPI (SPI protocol) addressing consistent across all ColdFire
family members then we will be able to remove the duplicated plaform data
and code and use a single setup for all.

So modify the ColdFire 523x QSPI addressing so that:

. base addresses are absolute (not relative to MBAR peripheral register)
. use a common name for IRQs used
. move chip select definitions (CS) to appropriate header

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m523xsim.h |   13 +++++++++++++
 arch/m68k/include/asm/mcfqspi.h  |    2 +-
 arch/m68k/platform/523x/config.c |   13 ++++---------
 3 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/include/asm/m523xsim.h b/arch/m68k/include/asm/m523xsim.h
index e1988dd..f2d21ce 100644
--- a/arch/m68k/include/asm/m523xsim.h
+++ b/arch/m68k/include/asm/m523xsim.h
@@ -51,6 +51,8 @@
 #define	MCF_IRQ_FECTX0		(MCFINT_VECBASE + MCFINT_FECTX0)
 #define	MCF_IRQ_FECENTC0	(MCFINT_VECBASE + MCFINT_FECENTC0)
 
+#define	MCF_IRQ_QSPI		(MCFINT_VECBASE + MCFINT_QSPI)
+
 /*
  *	SDRAM configuration registers.
  */
@@ -83,6 +85,17 @@
 #define	MCFFEC_SIZE0		0x800
 
 /*
+ *  QSPI module.
+ */
+#define	MCFQSPI_BASE		(MCF_IPSBAR + 0x340)
+#define	MCFQSPI_SIZE		0x40
+
+#define	MCFQSPI_CS0		91
+#define	MCFQSPI_CS1		92
+#define	MCFQSPI_CS2		103
+#define	MCFQSPI_CS3		99
+
+/*
  *  GPIO module.
  */
 #define MCFGPIO_PODR_ADDR	(MCF_IPSBAR + 0x100000)
diff --git a/arch/m68k/include/asm/mcfqspi.h b/arch/m68k/include/asm/mcfqspi.h
index 34a531e..62148b7 100644
--- a/arch/m68k/include/asm/mcfqspi.h
+++ b/arch/m68k/include/asm/mcfqspi.h
@@ -21,7 +21,7 @@
 #ifndef mcfqspi_h
 #define mcfqspi_h
 
-#if defined(CONFIG_M523x) || defined(CONFIG_M527x) || defined(CONFIG_M528x)
+#if defined(CONFIG_M527x) || defined(CONFIG_M528x)
 #define	MCFQSPI_IOBASE		(MCF_IPSBAR + 0x340)
 #elif defined(CONFIG_M5249)
 #define MCFQSPI_IOBASE         (MCF_MBAR + 0x300)
diff --git a/arch/m68k/platform/523x/config.c b/arch/m68k/platform/523x/config.c
index 371175d..32bb522 100644
--- a/arch/m68k/platform/523x/config.c
+++ b/arch/m68k/platform/523x/config.c
@@ -29,22 +29,17 @@
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
 static struct resource m523x_qspi_resources[] = {
 	{
-		.start		= MCFQSPI_IOBASE,
-		.end		= MCFQSPI_IOBASE + MCFQSPI_IOSIZE - 1,
+		.start		= MCFQSPI_BASE,
+		.end		= MCFQSPI_BASE + MCFQSPI_SIZE - 1,
 		.flags		= IORESOURCE_MEM,
 	},
 	{
-		.start		= MCFINT_VECBASE + MCFINT_QSPI,
-		.end		= MCFINT_VECBASE + MCFINT_QSPI,
+		.start		= MCF_IRQ_QSPI,
+		.end		= MCF_IRQ_QSPI,
 		.flags		= IORESOURCE_IRQ,
 	},
 };
 
-#define MCFQSPI_CS0    91
-#define MCFQSPI_CS1    92
-#define MCFQSPI_CS2    103
-#define MCFQSPI_CS3    99
-
 static int m523x_cs_setup(struct mcfqspi_cs_control *cs_control)
 {
 	int status;
-- 
1.7.0.4
