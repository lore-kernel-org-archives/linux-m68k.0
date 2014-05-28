From: gerg@uclinux.org
Subject: [PATCH 7/9] m68knommu: modify ColdFire dma_timer to use common definitions
Date: Wed, 28 May 2014 10:49:47 +1000
Message-ID: <1401238189-4402-8-git-send-email-gerg@uclinux.org>
References: <1401238189-4402-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas03p.mx.bigpond.com ([61.9.168.143]:24916 "EHLO
	nskntmtas03p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752494AbaE1At5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 27 May 2014 20:49:57 -0400
In-Reply-To: <1401238189-4402-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire DMA Timer hardware module is used on a number of the ColdFire
family System on Chips. Modify the dma_timer.c driver address definitions
so that it can be used on any of those devices.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/dma_timer.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/arch/m68k/platform/coldfire/dma_timer.c b/arch/m68k/platform/coldfire/dma_timer.c
index 235ad57..9b7b950 100644
--- a/arch/m68k/platform/coldfire/dma_timer.c
+++ b/arch/m68k/platform/coldfire/dma_timer.c
@@ -14,17 +14,12 @@
 #include <asm/mcfpit.h>
 #include <asm/mcfsim.h>
 
-#define DMA_TIMER_0	(0x00)
-#define DMA_TIMER_1	(0x40)
-#define DMA_TIMER_2	(0x80)
-#define DMA_TIMER_3	(0xc0)
-
-#define DTMR0	(MCF_IPSBAR + DMA_TIMER_0 + 0x400)
-#define DTXMR0	(MCF_IPSBAR + DMA_TIMER_0 + 0x402)
-#define DTER0	(MCF_IPSBAR + DMA_TIMER_0 + 0x403)
-#define DTRR0	(MCF_IPSBAR + DMA_TIMER_0 + 0x404)
-#define DTCR0	(MCF_IPSBAR + DMA_TIMER_0 + 0x408)
-#define DTCN0	(MCF_IPSBAR + DMA_TIMER_0 + 0x40c)
+#define DTMR0	(MCFDTIM_BASE0 + 0x0)
+#define DTXMR0	(MCFDTIM_BASE0 + 0x2)
+#define DTER0	(MCFDTIM_BASE0 + 0x3)
+#define DTRR0	(MCFDTIM_BASE0 + 0x4)
+#define DTCR0	(MCFDTIM_BASE0 + 0x8)
+#define DTCN0	(MCFDTIM_BASE0 + 0xc)
 
 #define DMA_FREQ    ((MCF_CLK / 2) / 16)
 
-- 
1.8.1.4
