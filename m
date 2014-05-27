From: gerg@uclinux.org
Subject: [PATCH 2/2] m68knommu: clean up ColdFire legacy timer
Date: Tue, 27 May 2014 16:28:22 +1000
Message-ID: <1401172102-1599-3-git-send-email-gerg@uclinux.org>
References: <1401172102-1599-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntqsrv02p.mx.bigpond.com ([61.9.168.234]:35902 "EHLO
	nskntqsrv02p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751823AbaE0GmB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 27 May 2014 02:42:01 -0400
In-Reply-To: <1401172102-1599-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire legacy timer code is used by ColdFire parts using the old 16bit
hardware timer module. It is no longer used by the m5441x or 53xx parts, so
changes to support them can be cleaned out.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/mcftimer.h     |  4 ----
 arch/m68k/platform/coldfire/timers.c | 16 ++--------------
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/m68k/include/asm/mcftimer.h b/arch/m68k/include/asm/mcftimer.h
index 089f0f1..769acf3 100644
--- a/arch/m68k/include/asm/mcftimer.h
+++ b/arch/m68k/include/asm/mcftimer.h
@@ -19,11 +19,7 @@
 #define	MCFTIMER_TRR		0x04		/* Timer Reference (r/w) */
 #define	MCFTIMER_TCR		0x08		/* Timer Capture reg (r/w) */
 #define	MCFTIMER_TCN		0x0C		/* Timer Counter reg (r/w) */
-#if defined(CONFIG_M53xx) || defined(CONFIG_M5441x)
-#define	MCFTIMER_TER		0x03		/* Timer Event reg (r/w) */
-#else
 #define	MCFTIMER_TER		0x11		/* Timer Event reg (r/w) */
-#endif
 
 /*
  *	Bit definitions for the Timer Mode Register (TMR).
diff --git a/arch/m68k/platform/coldfire/timers.c b/arch/m68k/platform/coldfire/timers.c
index cd496a2..0b222c2 100644
--- a/arch/m68k/platform/coldfire/timers.c
+++ b/arch/m68k/platform/coldfire/timers.c
@@ -30,20 +30,8 @@
 #define	FREQ	(MCF_BUSCLK / 16)
 #define	TA(a)	(MCFTIMER_BASE1 + (a))
 
-/*
- *	These provide the underlying interrupt vector support.
- *	Unfortunately it is a little different on each ColdFire.
- */
 void coldfire_profile_init(void);
 
-#if defined(CONFIG_M53xx) || defined(CONFIG_M5441x)
-#define	__raw_readtrr	__raw_readl
-#define	__raw_writetrr	__raw_writel
-#else
-#define	__raw_readtrr	__raw_readw
-#define	__raw_writetrr	__raw_writew
-#endif
-
 static u32 mcftmr_cycles_per_jiffy;
 static u32 mcftmr_cnt;
 
@@ -125,7 +113,7 @@ void hw_timer_init(irq_handler_t handler)
 	 *	for 1 tick, not TRR.  So if you want n cycles,
 	 *	initialize TRR with n - 1.
 	 */
-	__raw_writetrr(mcftmr_cycles_per_jiffy - 1, TA(MCFTIMER_TRR));
+	__raw_writew(mcftmr_cycles_per_jiffy - 1, TA(MCFTIMER_TRR));
 	__raw_writew(MCFTIMER_TMR_ENORI | MCFTIMER_TMR_CLK16 |
 		MCFTIMER_TMR_RESTART | MCFTIMER_TMR_ENABLE, TA(MCFTIMER_TMR));
 
@@ -183,7 +171,7 @@ void coldfire_profile_init(void)
 	/* Set up TIMER 2 as high speed profile clock */
 	__raw_writew(MCFTIMER_TMR_DISABLE, PA(MCFTIMER_TMR));
 
-	__raw_writetrr(((MCF_BUSCLK / 16) / PROFILEHZ), PA(MCFTIMER_TRR));
+	__raw_writew(((MCF_BUSCLK / 16) / PROFILEHZ), PA(MCFTIMER_TRR));
 	__raw_writew(MCFTIMER_TMR_ENORI | MCFTIMER_TMR_CLK16 |
 		MCFTIMER_TMR_RESTART | MCFTIMER_TMR_ENABLE, PA(MCFTIMER_TMR));
 
-- 
1.8.1.4
