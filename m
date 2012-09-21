From: <gerg@snapgear.com>
Subject: [PATCH 08/11] m68knommu: move ColdFire slice timer address defiens to 54xx header
Date: Fri, 21 Sep 2012 16:51:10 +1000
Message-ID: <1348210273-31246-9-git-send-email-gerg@snapgear.com>
References: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:28519 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753637Ab2IUGvg (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Sep 2012 02:51:36 -0400
In-Reply-To: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Move the base address defines of the ColdFire 54xx CPU slice timers into the
54xx specific header (m54xxsim.h). They are CPU specific, and belong with the
CPU specific defines. Also make them relative to the MBAR peripheral region,
making the define the absolute address.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m54xxsim.h       |    6 ++++++
 arch/m68k/include/asm/mcfslt.h         |    7 -------
 arch/m68k/platform/coldfire/sltimers.c |    4 ++--
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/include/asm/m54xxsim.h b/arch/m68k/include/asm/m54xxsim.h
index d3c5e0d..d6a5079 100644
--- a/arch/m68k/include/asm/m54xxsim.h
+++ b/arch/m68k/include/asm/m54xxsim.h
@@ -47,6 +47,12 @@
 #define MCF_IRQ_UART3		(MCFINT_VECBASE + 32)
 
 /*
+ *	Slice Timer support.
+ */
+#define MCFSLT_TIMER0		(MCF_MBAR + 0x900)	/* Base addr TIMER0 */
+#define MCFSLT_TIMER1		(MCF_MBAR + 0x910)	/* Base addr TIMER1 */
+
+/*
  *	Generic GPIO support
  */
 #define MCFGPIO_PIN_MAX		0	/* I am too lazy to count */
diff --git a/arch/m68k/include/asm/mcfslt.h b/arch/m68k/include/asm/mcfslt.h
index d0d0ecb..c2314b6 100644
--- a/arch/m68k/include/asm/mcfslt.h
+++ b/arch/m68k/include/asm/mcfslt.h
@@ -13,13 +13,6 @@
 /****************************************************************************/
 
 /*
- *	Get address specific defines for the 547x.
- */
-#define MCFSLT_TIMER0		0x900	/* Base address of TIMER0 */
-#define MCFSLT_TIMER1		0x910	/* Base address of TIMER1 */
-
-
-/*
  *	Define the SLT timer register set addresses.
  */
 #define MCFSLT_STCNT		0x00	/* Terminal count */
diff --git a/arch/m68k/platform/coldfire/sltimers.c b/arch/m68k/platform/coldfire/sltimers.c
index 2027fc2..bb5a25a 100644
--- a/arch/m68k/platform/coldfire/sltimers.c
+++ b/arch/m68k/platform/coldfire/sltimers.c
@@ -32,7 +32,7 @@
 /*
  *	By default use Slice Timer 1 as the profiler clock timer.
  */
-#define	PA(a)	(MCF_MBAR + MCFSLT_TIMER1 + (a))
+#define	PA(a)	(MCFSLT_TIMER1 + (a))
 
 /*
  *	Choose a reasonably fast profile timer. Make it an odd value to
@@ -76,7 +76,7 @@ void mcfslt_profile_init(void)
 /*
  *	By default use Slice Timer 0 as the system clock timer.
  */
-#define	TA(a)	(MCF_MBAR + MCFSLT_TIMER0 + (a))
+#define	TA(a)	(MCFSLT_TIMER0 + (a))
 
 static u32 mcfslt_cycles_per_jiffy;
 static u32 mcfslt_cnt;
-- 
1.7.0.4
