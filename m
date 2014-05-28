From: gerg@uclinux.org
Subject: [PATCH 1/9] m68knommu: add DMA timer base address definitions for ColdFire 53xx
Date: Wed, 28 May 2014 10:49:41 +1000
Message-ID: <1401238189-4402-2-git-send-email-gerg@uclinux.org>
References: <1401238189-4402-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas04p.mx.bigpond.com ([61.9.168.146]:47251 "EHLO
	nskntmtas04p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751575AbaE1Atz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 27 May 2014 20:49:55 -0400
In-Reply-To: <1401238189-4402-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The Coldfire 532x and 537x CPU families also contain the ColdFire DMA Timer
hardware unit. Add address definitions for it.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m53xxsim.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/include/asm/m53xxsim.h b/arch/m68k/include/asm/m53xxsim.h
index 5497216..cea69b1 100644
--- a/arch/m68k/include/asm/m53xxsim.h
+++ b/arch/m68k/include/asm/m53xxsim.h
@@ -116,12 +116,12 @@
 #define MCFPIT_BASE4		0xFC08C000	/* Base address of TIMER4 */
 
 /*
- *  Timer module.
+ *  DMA Timer module.
  */
-#define MCFTIMER_BASE1		0xFC070000	/* Base address of TIMER1 */
-#define MCFTIMER_BASE2		0xFC074000	/* Base address of TIMER2 */
-#define MCFTIMER_BASE3		0xFC078000	/* Base address of TIMER3 */
-#define MCFTIMER_BASE4		0xFC07C000	/* Base address of TIMER4 */
+#define MCFDTIM_BASE0		0xFC070000	/* Base of DMA TIMER 0 */
+#define MCFDTIM_BASE1		0xFC074000	/* Base of DMA TIMER 1 */
+#define MCFDTIM_BASE2		0xFC078000	/* Base of DMA TIMER 2 */
+#define MCFDTIM_BASE3		0xFC07C000	/* Base of DMA TIMER 3 */
 
 /*********************************************************************
  *
-- 
1.8.1.4
