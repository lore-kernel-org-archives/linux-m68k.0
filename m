From: <gerg@snapgear.com>
Subject: [PATCH 01/11] m68knommu: fix wrong register offsets used for ColdFire 5272 multi-function pins
Date: Fri, 21 Sep 2012 16:51:03 +1000
Message-ID: <1348210273-31246-2-git-send-email-gerg@snapgear.com>
References: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:28492 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753360Ab2IUGvd (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Sep 2012 02:51:33 -0400
In-Reply-To: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The registers used to configure and set the multifunction pins on the 5272
ColdFire are defined as absolute addresses. So the use of them does not need
to be offset relative to the peripheral region address.

Fix two cases of incorrect usage of these addresses. Both affect UART
initialization, one in the common UART pin setup code, the other in the
NETtel board specific UART signal handling.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/nettel.h      |    9 +++------
 arch/m68k/platform/coldfire/m5272.c |    8 ++++----
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/include/asm/nettel.h b/arch/m68k/include/asm/nettel.h
index 4dec2d9..2a7a766 100644
--- a/arch/m68k/include/asm/nettel.h
+++ b/arch/m68k/include/asm/nettel.h
@@ -21,6 +21,7 @@
 #ifdef CONFIG_COLDFIRE
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
+#include <asm/io.h>
 #endif
 
 /*---------------------------------------------------------------------------*/
@@ -86,16 +87,12 @@ static __inline__ void mcf_setppdata(unsigned int mask, unsigned int bits)
  */
 static __inline__ unsigned int mcf_getppdata(void)
 {
-	volatile unsigned short *pp;
-	pp = (volatile unsigned short *) (MCF_MBAR + MCFSIM_PBDAT);
-	return((unsigned int) *pp);
+	return readw(MCFSIM_PBDAT);
 }
 
 static __inline__ void mcf_setppdata(unsigned int mask, unsigned int bits)
 {
-	volatile unsigned short *pp;
-	pp = (volatile unsigned short *) (MCF_MBAR + MCFSIM_PBDAT);
-	*pp = (*pp & ~mask) | bits;
+	write((readw(MCFSIM_PBDAT) & ~mask) | bits, MCFSIM_PBDAT);
 }
 #endif
 
diff --git a/arch/m68k/platform/coldfire/m5272.c b/arch/m68k/platform/coldfire/m5272.c
index eae59f6..45b246d 100644
--- a/arch/m68k/platform/coldfire/m5272.c
+++ b/arch/m68k/platform/coldfire/m5272.c
@@ -35,13 +35,13 @@ static void __init m5272_uarts_init(void)
 	u32 v;
 
 	/* Enable the output lines for the serial ports */
-	v = readl(MCF_MBAR + MCFSIM_PBCNT);
+	v = readl(MCFSIM_PBCNT);
 	v = (v & ~0x000000ff) | 0x00000055;
-	writel(v, MCF_MBAR + MCFSIM_PBCNT);
+	writel(v, MCFSIM_PBCNT);
 
-	v = readl(MCF_MBAR + MCFSIM_PDCNT);
+	v = readl(MCFSIM_PDCNT);
 	v = (v & ~0x000003fc) | 0x000002a8;
-	writel(v, MCF_MBAR + MCFSIM_PDCNT);
+	writel(v, MCFSIM_PDCNT);
 }
 
 /***************************************************************************/
-- 
1.7.0.4
