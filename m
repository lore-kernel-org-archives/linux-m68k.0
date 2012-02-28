From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: move old ColdFire timers init from CPU init to timers code
Date: Tue, 28 Feb 2012 13:48:10 +1000
Message-ID: <1330400890-24595-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:39663 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753423Ab2B1DsV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 27 Feb 2012 22:48:21 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The original ColdFire timer interrupt setup is used by most of the users
of the original ColdFire timer code. But the code is currently duplicated
in each of the ColdFire CPU specific init files. Move it to the timers
code that it is really part of. It is strait forward to make it conditional
on also having the original interrupt engine that it needs.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/5206/config.c     |   18 ------------------
 arch/m68k/platform/5249/config.c     |   18 ------------------
 arch/m68k/platform/5307/config.c     |   18 ------------------
 arch/m68k/platform/5407/config.c     |   18 ------------------
 arch/m68k/platform/coldfire/timers.c |   20 ++++++++++++++++++++
 5 files changed, 20 insertions(+), 72 deletions(-)

diff --git a/arch/m68k/platform/5206/config.c b/arch/m68k/platform/5206/config.c
index 570934d..00182b7 100644
--- a/arch/m68k/platform/5206/config.c
+++ b/arch/m68k/platform/5206/config.c
@@ -19,23 +19,6 @@
 
 /***************************************************************************/
 
-static void __init m5206_timers_init(void)
-{
-	/* Timer1 is always used as system timer */
-	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI3,
-		MCF_MBAR + MCFSIM_TIMER1ICR);
-	mcf_mapirq2imr(MCF_IRQ_TIMER, MCFINTC_TIMER1);
-
-#ifdef CONFIG_HIGHPROFILE
-	/* Timer2 is to be used as a high speed profile timer  */
-	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL7 | MCFSIM_ICR_PRI3,
-		MCF_MBAR + MCFSIM_TIMER2ICR);
-	mcf_mapirq2imr(MCF_IRQ_PROFILER, MCFINTC_TIMER2);
-#endif
-}
-
-/***************************************************************************/
-
 void m5206_cpu_reset(void)
 {
 	local_irq_disable();
@@ -56,7 +39,6 @@ void __init config_BSP(char *commandp, int size)
 #endif /* CONFIG_NETtel */
 
 	mach_reset = m5206_cpu_reset;
-	m5206_timers_init();
 
 	/* Only support the external interrupts on their primary level */
 	mcf_mapirq2imr(25, MCFINTC_EINT1);
diff --git a/arch/m68k/platform/5249/config.c b/arch/m68k/platform/5249/config.c
index ac4386a..ef34f58 100644
--- a/arch/m68k/platform/5249/config.c
+++ b/arch/m68k/platform/5249/config.c
@@ -83,23 +83,6 @@ static void __init m5249_smc91x_init(void)
 
 /***************************************************************************/
 
-static void __init m5249_timers_init(void)
-{
-	/* Timer1 is always used as system timer */
-	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI3,
-		MCF_MBAR + MCFSIM_TIMER1ICR);
-	mcf_mapirq2imr(MCF_IRQ_TIMER, MCFINTC_TIMER1);
-
-#ifdef CONFIG_HIGHPROFILE
-	/* Timer2 is to be used as a high speed profile timer  */
-	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL7 | MCFSIM_ICR_PRI3,
-		MCF_MBAR + MCFSIM_TIMER2ICR);
-	mcf_mapirq2imr(MCF_IRQ_PROFILER, MCFINTC_TIMER2);
-#endif
-}
-
-/***************************************************************************/
-
 void m5249_cpu_reset(void)
 {
 	local_irq_disable();
@@ -114,7 +97,6 @@ void m5249_cpu_reset(void)
 void __init config_BSP(char *commandp, int size)
 {
 	mach_reset = m5249_cpu_reset;
-	m5249_timers_init();
 #ifdef CONFIG_M5249C3
 	m5249_smc91x_init();
 #endif
diff --git a/arch/m68k/platform/5307/config.c b/arch/m68k/platform/5307/config.c
index a45db41..86f92ef 100644
--- a/arch/m68k/platform/5307/config.c
+++ b/arch/m68k/platform/5307/config.c
@@ -28,23 +28,6 @@ unsigned char ledbank = 0xff;
 
 /***************************************************************************/
 
-static void __init m5307_timers_init(void)
-{
-	/* Timer1 is always used as system timer */
-	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI3,
-		MCF_MBAR + MCFSIM_TIMER1ICR);
-	mcf_mapirq2imr(MCF_IRQ_TIMER, MCFINTC_TIMER1);
-
-#ifdef CONFIG_HIGHPROFILE
-	/* Timer2 is to be used as a high speed profile timer  */
-	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL7 | MCFSIM_ICR_PRI3,
-		MCF_MBAR + MCFSIM_TIMER2ICR);
-	mcf_mapirq2imr(MCF_IRQ_PROFILER, MCFINTC_TIMER2);
-#endif
-}
-
-/***************************************************************************/
-
 void m5307_cpu_reset(void)
 {
 	local_irq_disable();
@@ -66,7 +49,6 @@ void __init config_BSP(char *commandp, int size)
 #endif
 
 	mach_reset = m5307_cpu_reset;
-	m5307_timers_init();
 
 	/* Only support the external interrupts on their primary level */
 	mcf_mapirq2imr(25, MCFINTC_EINT1);
diff --git a/arch/m68k/platform/5407/config.c b/arch/m68k/platform/5407/config.c
index 3fb3010..02177b9 100644
--- a/arch/m68k/platform/5407/config.c
+++ b/arch/m68k/platform/5407/config.c
@@ -19,23 +19,6 @@
 
 /***************************************************************************/
 
-static void __init m5407_timers_init(void)
-{
-	/* Timer1 is always used as system timer */
-	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI3,
-		MCF_MBAR + MCFSIM_TIMER1ICR);
-	mcf_mapirq2imr(MCF_IRQ_TIMER, MCFINTC_TIMER1);
-
-#ifdef CONFIG_HIGHPROFILE
-	/* Timer2 is to be used as a high speed profile timer  */
-	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL7 | MCFSIM_ICR_PRI3,
-		MCF_MBAR + MCFSIM_TIMER2ICR);
-	mcf_mapirq2imr(MCF_IRQ_PROFILER, MCFINTC_TIMER2);
-#endif
-}
-
-/***************************************************************************/
-
 void m5407_cpu_reset(void)
 {
 	local_irq_disable();
@@ -50,7 +33,6 @@ void m5407_cpu_reset(void)
 void __init config_BSP(char *commandp, int size)
 {
 	mach_reset = m5407_cpu_reset;
-	m5407_timers_init();
 
 	/* Only support the external interrupts on their primary level */
 	mcf_mapirq2imr(25, MCFINTC_EINT1);
diff --git a/arch/m68k/platform/coldfire/timers.c b/arch/m68k/platform/coldfire/timers.c
index 0d90da3..b1c1547 100644
--- a/arch/m68k/platform/coldfire/timers.c
+++ b/arch/m68k/platform/coldfire/timers.c
@@ -49,6 +49,25 @@ static u32 mcftmr_cnt;
 
 /***************************************************************************/
 
+static void init_timer_irq(void)
+{
+#ifdef MCFSIM_ICR_AUTOVEC
+	/* Timer1 is always used as system timer */
+	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI3,
+		MCF_MBAR + MCFSIM_TIMER1ICR);
+	mcf_mapirq2imr(MCF_IRQ_TIMER, MCFINTC_TIMER1);
+
+#ifdef CONFIG_HIGHPROFILE
+	/* Timer2 is to be used as a high speed profile timer  */
+	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL7 | MCFSIM_ICR_PRI3,
+		MCF_MBAR + MCFSIM_TIMER2ICR);
+	mcf_mapirq2imr(MCF_IRQ_PROFILER, MCFINTC_TIMER2);
+#endif
+#endif /* MCFSIM_ICR_AUTOVEC */
+}
+
+/***************************************************************************/
+
 static irqreturn_t mcftmr_tick(int irq, void *dummy)
 {
 	/* Reset the ColdFire timer */
@@ -110,6 +129,7 @@ void hw_timer_init(void)
 
 	clocksource_register_hz(&mcftmr_clk, FREQ);
 
+	init_timer_irq();
 	setup_irq(MCF_IRQ_TIMER, &mcftmr_timer_irq);
 
 #ifdef CONFIG_HIGHPROFILE
-- 
1.7.0.4
