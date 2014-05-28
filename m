From: gerg@uclinux.org
Subject: [PATCH 2/9] m68knommu: add DMA timer base address definitions for ColdFire 520x
Date: Wed, 28 May 2014 10:49:42 +1000
Message-ID: <1401238189-4402-3-git-send-email-gerg@uclinux.org>
References: <1401238189-4402-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas06p.mx.bigpond.com ([61.9.168.152]:18587 "EHLO
	nskntmtas06p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752039AbaE1Atz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 27 May 2014 20:49:55 -0400
In-Reply-To: <1401238189-4402-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The Coldfire 520x CPU family also contains the ColdFire DMA Timer hardware
unit. Add address definitions for it.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m520xsim.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/m68k/include/asm/m520xsim.h b/arch/m68k/include/asm/m520xsim.h
index db3f8ee..dbc9584 100644
--- a/arch/m68k/include/asm/m520xsim.h
+++ b/arch/m68k/include/asm/m520xsim.h
@@ -159,6 +159,14 @@
 #define	MCFPIT_BASE2		0xFC084000	/* Base address of TIMER2 */
 
 /*
+ *  DMA Timer module.
+ */
+#define MCFDTIM_BASE0		0xFC070000	/* Base of DMA TIMER 0 */
+#define MCFDTIM_BASE1		0xFC074000	/* Base of DMA TIMER 1 */
+#define MCFDTIM_BASE2		0xFC078000	/* Base of DMA TIMER 2 */
+#define MCFDTIM_BASE3		0xFC07C000	/* Base of DMA TIMER 3 */
+
+/*
  *  UART module.
  */
 #define MCFUART_BASE0		0xFC060000	/* Base address of UART0 */
-- 
1.8.1.4
