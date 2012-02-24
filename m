From: <gerg@snapgear.com>
Subject: [PATCH 3/7] m68knommu: make 5272 FEC platform addressing consistent
Date: Fri, 24 Feb 2012 14:24:07 +1000
Message-ID: <1330057451-28481-4-git-send-email-gerg@snapgear.com>
References: <1330057451-28481-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:44622 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755680Ab2BXEXV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 23 Feb 2012 23:23:21 -0500
In-Reply-To: <1330057451-28481-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all FEC (ethernet) addressing consistent across all ColdFire
family members then we will be able to remove the duplicated plaform data
and use a single setup for all.

So modify the ColdFire 5272 FEC addressing so that:

. FECs are numbered from 0 up
. base addresses are absolute (not relative to MBAR peripheral register)
. use a common name for IRQs used

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m5272sim.h |    9 ++++++---
 arch/m68k/platform/5272/config.c |   16 ++++++++--------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/m68k/include/asm/m5272sim.h b/arch/m68k/include/asm/m5272sim.h
index 5c71bd4..a58f176 100644
--- a/arch/m68k/include/asm/m5272sim.h
+++ b/arch/m68k/include/asm/m5272sim.h
@@ -88,6 +88,9 @@
 #define	MCFTIMER_BASE3		(MCF_MBAR + 0x240) /* Base address TIMER4 */
 #define	MCFTIMER_BASE4		(MCF_MBAR + 0x260) /* Base address TIMER3 */
 
+#define	MCFFEC_BASE0		(MCF_MBAR + 0x840) /* Base FEC ethernet */
+#define	MCFFEC_SIZE0		0x1d0
+
 /*
  *	Define system peripheral IRQ usage.
  */
@@ -114,9 +117,9 @@
 #define	MCF_IRQ_USB6		83		/* USB Endpoint 6 */
 #define	MCF_IRQ_USB7		84		/* USB Endpoint 7 */
 #define	MCF_IRQ_DMA		85		/* DMA Controller */
-#define	MCF_IRQ_ERX		86		/* Ethernet Receiver */
-#define	MCF_IRQ_ETX		87		/* Ethernet Transmitter */
-#define	MCF_IRQ_ENTC		88		/* Ethernet Non-Time Critical */
+#define	MCF_IRQ_FECRX0		86		/* Ethernet Receiver */
+#define	MCF_IRQ_FECTX0		87		/* Ethernet Transmitter */
+#define	MCF_IRQ_FECENTC0	88		/* Ethernet Non-Time Critical */
 #define	MCF_IRQ_QSPI		89		/* Queued Serial Interface */
 #define	MCF_IRQ_EINT5		90		/* External Interrupt 5 */
 #define	MCF_IRQ_EINT6		91		/* External Interrupt 6 */
diff --git a/arch/m68k/platform/5272/config.c b/arch/m68k/platform/5272/config.c
index 2199c00..8c77fee 100644
--- a/arch/m68k/platform/5272/config.c
+++ b/arch/m68k/platform/5272/config.c
@@ -32,23 +32,23 @@ unsigned char ledbank = 0xff;
 
 static struct resource m5272_fec_resources[] = {
 	{
-		.start		= MCF_MBAR + 0x840,
-		.end		= MCF_MBAR + 0x840 + 0x1cf,
+		.start		= MCFFEC_BASE0,
+		.end		= MCFFEC_BASE0 + MCFFEC_SIZE0 - 1,
 		.flags		= IORESOURCE_MEM,
 	},
 	{
-		.start		= MCF_IRQ_ERX,
-		.end		= MCF_IRQ_ERX,
+		.start		= MCF_IRQ_FECRX0,
+		.end		= MCF_IRQ_FECRX0,
 		.flags		= IORESOURCE_IRQ,
 	},
 	{
-		.start		= MCF_IRQ_ETX,
-		.end		= MCF_IRQ_ETX,
+		.start		= MCF_IRQ_FECTX0,
+		.end		= MCF_IRQ_FECTX0,
 		.flags		= IORESOURCE_IRQ,
 	},
 	{
-		.start		= MCF_IRQ_ENTC,
-		.end		= MCF_IRQ_ENTC,
+		.start		= MCF_IRQ_FECENTC0,
+		.end		= MCF_IRQ_FECENTC0,
 		.flags		= IORESOURCE_IRQ,
 	},
 };
-- 
1.7.0.4
