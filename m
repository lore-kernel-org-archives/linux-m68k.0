From: <gerg@snapgear.com>
Subject: [PATCH 2/5 v2] m68knommu: modify timer init code to make it consistent with m68k code
Date: Wed, 22 Feb 2012 13:58:53 +1000
Message-ID: <1329883136-9837-2-git-send-email-gerg@snapgear.com>
References: <1329883136-9837-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:50758 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932107Ab2BVD7b (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 21 Feb 2012 22:59:31 -0500
In-Reply-To: <1329883136-9837-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

With a few small changes we can make the m68knommu timer init code the
same as the m68k code. By using the mach_sched_init function pointer
and reworking the current timer initializers to keep track of the common
m68k timer_interrupt() handler we end up with almost identical code for
m68knommu.

This will allow us to more easily merge the mmu and non-mmu m68k time.c
in future patches.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/machdep.h        |    3 +--
 arch/m68k/kernel/setup_no.c            |    1 +
 arch/m68k/kernel/time_no.c             |    8 +++-----
 arch/m68k/platform/5206/config.c       |    1 +
 arch/m68k/platform/520x/config.c       |    1 +
 arch/m68k/platform/523x/config.c       |    1 +
 arch/m68k/platform/5249/config.c       |    1 +
 arch/m68k/platform/5272/config.c       |    1 +
 arch/m68k/platform/527x/config.c       |    1 +
 arch/m68k/platform/528x/config.c       |    1 +
 arch/m68k/platform/5307/config.c       |    1 +
 arch/m68k/platform/532x/config.c       |    2 ++
 arch/m68k/platform/5407/config.c       |    1 +
 arch/m68k/platform/54xx/config.c       |    1 +
 arch/m68k/platform/coldfire/pit.c      |    2 +-
 arch/m68k/platform/coldfire/sltimers.c |    7 +++++--
 arch/m68k/platform/coldfire/timers.c   |    7 +++++--
 17 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/arch/m68k/include/asm/machdep.h b/arch/m68k/include/asm/machdep.h
index 3bfa7df..825c1c8 100644
--- a/arch/m68k/include/asm/machdep.h
+++ b/arch/m68k/include/asm/machdep.h
@@ -33,9 +33,8 @@ extern void (*mach_l2_flush) (int);
 extern void (*mach_beep) (unsigned int, unsigned int);
 
 /* Hardware clock functions */
-extern void hw_timer_init(void);
+extern void hw_timer_init(irq_handler_t handler);
 extern unsigned long hw_timer_offset(void);
-extern irqreturn_t arch_timer_interrupt(int irq, void *dummy);
 
 extern void config_BSP(char *command, int len);
 
diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index 8394b56..7dc186b 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -48,6 +48,7 @@ EXPORT_SYMBOL(memory_end);
 char __initdata command_line[COMMAND_LINE_SIZE];
 
 /* machine dependent timer functions */
+void (*mach_sched_init)(irq_handler_t handler) __initdata = NULL;
 int (*mach_set_clock_mmss)(unsigned long);
 int (*mach_hwclk) (int, struct rtc_time*);
 
diff --git a/arch/m68k/kernel/time_no.c b/arch/m68k/kernel/time_no.c
index ca3b3b4..5fa42f1 100644
--- a/arch/m68k/kernel/time_no.c
+++ b/arch/m68k/kernel/time_no.c
@@ -32,12 +32,11 @@ static inline int set_rtc_mmss(unsigned long nowtime)
 	return -1;
 }
 
-#ifndef CONFIG_GENERIC_CLOCKEVENTS
 /*
  * timer_interrupt() needs to keep up the real-time clock,
  * as well as call the "xtime_update()" routine every clocktick
  */
-irqreturn_t arch_timer_interrupt(int irq, void *dummy)
+static irqreturn_t timer_interrupt(int irq, void *dummy)
 {
 
 	if (current->pid)
@@ -49,7 +48,6 @@ irqreturn_t arch_timer_interrupt(int irq, void *dummy)
 
 	return(IRQ_HANDLED);
 }
-#endif
 
 void read_persistent_clock(struct timespec *ts)
 {
@@ -72,7 +70,7 @@ int update_persistent_clock(struct timespec now)
 	return set_rtc_mmss(now.tv_sec);
 }
 
-void time_init(void)
+void __init time_init(void)
 {
-	hw_timer_init();
+	mach_sched_init(timer_interrupt);
 }
diff --git a/arch/m68k/platform/5206/config.c b/arch/m68k/platform/5206/config.c
index 6fa3f80..7826b70 100644
--- a/arch/m68k/platform/5206/config.c
+++ b/arch/m68k/platform/5206/config.c
@@ -105,6 +105,7 @@ void __init config_BSP(char *commandp, int size)
 #endif /* CONFIG_NETtel */
 
 	mach_reset = m5206_cpu_reset;
+	mach_sched_init = hw_timer_init;
 	m5206_timers_init();
 	m5206_uarts_init();
 
diff --git a/arch/m68k/platform/520x/config.c b/arch/m68k/platform/520x/config.c
index 8a98683..61c2515 100644
--- a/arch/m68k/platform/520x/config.c
+++ b/arch/m68k/platform/520x/config.c
@@ -291,6 +291,7 @@ static void m520x_cpu_reset(void)
 void __init config_BSP(char *commandp, int size)
 {
 	mach_reset = m520x_cpu_reset;
+	mach_sched_init = hw_timer_init;
 	m520x_uarts_init();
 	m520x_fec_init();
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
diff --git a/arch/m68k/platform/523x/config.c b/arch/m68k/platform/523x/config.c
index 71f4436..aa28392 100644
--- a/arch/m68k/platform/523x/config.c
+++ b/arch/m68k/platform/523x/config.c
@@ -274,6 +274,7 @@ static void m523x_cpu_reset(void)
 void __init config_BSP(char *commandp, int size)
 {
 	mach_reset = m523x_cpu_reset;
+	mach_sched_init = hw_timer_init;
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/platform/5249/config.c b/arch/m68k/platform/5249/config.c
index ceb31e5..50e2d8f 100644
--- a/arch/m68k/platform/5249/config.c
+++ b/arch/m68k/platform/5249/config.c
@@ -307,6 +307,7 @@ void m5249_cpu_reset(void)
 void __init config_BSP(char *commandp, int size)
 {
 	mach_reset = m5249_cpu_reset;
+	mach_sched_init = hw_timer_init;
 	m5249_timers_init();
 	m5249_uarts_init();
 #ifdef CONFIG_M5249C3
diff --git a/arch/m68k/platform/5272/config.c b/arch/m68k/platform/5272/config.c
index 65bb582..426e66c 100644
--- a/arch/m68k/platform/5272/config.c
+++ b/arch/m68k/platform/5272/config.c
@@ -146,6 +146,7 @@ void __init config_BSP(char *commandp, int size)
 #endif
 
 	mach_reset = m5272_cpu_reset;
+	mach_sched_init = hw_timer_init;
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/platform/527x/config.c b/arch/m68k/platform/527x/config.c
index 3ebc769..c948a16 100644
--- a/arch/m68k/platform/527x/config.c
+++ b/arch/m68k/platform/527x/config.c
@@ -364,6 +364,7 @@ static void m527x_cpu_reset(void)
 void __init config_BSP(char *commandp, int size)
 {
 	mach_reset = m527x_cpu_reset;
+	mach_sched_init = hw_timer_init;
 	m527x_uarts_init();
 	m527x_fec_init();
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
diff --git a/arch/m68k/platform/528x/config.c b/arch/m68k/platform/528x/config.c
index 7abe77a..08f397a 100644
--- a/arch/m68k/platform/528x/config.c
+++ b/arch/m68k/platform/528x/config.c
@@ -306,6 +306,7 @@ void __init config_BSP(char *commandp, int size)
 static int __init init_BSP(void)
 {
 	mach_reset = m528x_cpu_reset;
+	mach_sched_init = hw_timer_init;
 	m528x_uarts_init();
 	m528x_fec_init();
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
diff --git a/arch/m68k/platform/5307/config.c b/arch/m68k/platform/5307/config.c
index 00900ac..6bf7c1c 100644
--- a/arch/m68k/platform/5307/config.c
+++ b/arch/m68k/platform/5307/config.c
@@ -115,6 +115,7 @@ void __init config_BSP(char *commandp, int size)
 #endif
 
 	mach_reset = m5307_cpu_reset;
+	mach_sched_init = hw_timer_init;
 	m5307_timers_init();
 	m5307_uarts_init();
 
diff --git a/arch/m68k/platform/532x/config.c b/arch/m68k/platform/532x/config.c
index ca51323..3558a62 100644
--- a/arch/m68k/platform/532x/config.c
+++ b/arch/m68k/platform/532x/config.c
@@ -263,6 +263,8 @@ void __init config_BSP(char *commandp, int size)
 	}
 #endif
 
+	mach_sched_init = hw_timer_init;
+
 #ifdef CONFIG_BDM_DISABLE
 	/*
 	 * Disable the BDM clocking.  This also turns off most of the rest of
diff --git a/arch/m68k/platform/5407/config.c b/arch/m68k/platform/5407/config.c
index 70ea789..4861be6 100644
--- a/arch/m68k/platform/5407/config.c
+++ b/arch/m68k/platform/5407/config.c
@@ -99,6 +99,7 @@ void m5407_cpu_reset(void)
 void __init config_BSP(char *commandp, int size)
 {
 	mach_reset = m5407_cpu_reset;
+	mach_sched_init = hw_timer_init;
 	m5407_timers_init();
 	m5407_uarts_init();
 
diff --git a/arch/m68k/platform/54xx/config.c b/arch/m68k/platform/54xx/config.c
index ee04354..8282ef1 100644
--- a/arch/m68k/platform/54xx/config.c
+++ b/arch/m68k/platform/54xx/config.c
@@ -145,6 +145,7 @@ void __init config_BSP(char *commandp, int size)
 	mmu_context_init();
 #endif
 	mach_reset = mcf54xx_reset;
+	mach_sched_init = hw_timer_init;
 	m54xx_uarts_init();
 }
 
diff --git a/arch/m68k/platform/coldfire/pit.c b/arch/m68k/platform/coldfire/pit.c
index 02663d2..e62dbbc 100644
--- a/arch/m68k/platform/coldfire/pit.c
+++ b/arch/m68k/platform/coldfire/pit.c
@@ -149,7 +149,7 @@ static struct clocksource pit_clk = {
 
 /***************************************************************************/
 
-void hw_timer_init(void)
+void hw_timer_init(irq_handler_t handler)
 {
 	cf_pit_clockevent.cpumask = cpumask_of(smp_processor_id());
 	cf_pit_clockevent.mult = div_sc(FREQ, NSEC_PER_SEC, 32);
diff --git a/arch/m68k/platform/coldfire/sltimers.c b/arch/m68k/platform/coldfire/sltimers.c
index 54e1452..2027fc2 100644
--- a/arch/m68k/platform/coldfire/sltimers.c
+++ b/arch/m68k/platform/coldfire/sltimers.c
@@ -81,12 +81,14 @@ void mcfslt_profile_init(void)
 static u32 mcfslt_cycles_per_jiffy;
 static u32 mcfslt_cnt;
 
+static irq_handler_t timer_interrupt;
+
 static irqreturn_t mcfslt_tick(int irq, void *dummy)
 {
 	/* Reset Slice Timer 0 */
 	__raw_writel(MCFSLT_SSR_BE | MCFSLT_SSR_TE, TA(MCFSLT_SSR));
 	mcfslt_cnt += mcfslt_cycles_per_jiffy;
-	return arch_timer_interrupt(irq, dummy);
+	return timer_interrupt(irq, dummy);
 }
 
 static struct irqaction mcfslt_timer_irq = {
@@ -121,7 +123,7 @@ static struct clocksource mcfslt_clk = {
 	.flags	= CLOCK_SOURCE_IS_CONTINUOUS,
 };
 
-void hw_timer_init(void)
+void hw_timer_init(irq_handler_t handler)
 {
 	mcfslt_cycles_per_jiffy = MCF_BUSCLK / HZ;
 	/*
@@ -136,6 +138,7 @@ void hw_timer_init(void)
 	/* initialize mcfslt_cnt knowing that slice timers count down */
 	mcfslt_cnt = mcfslt_cycles_per_jiffy;
 
+	timer_interrupt = handler;
 	setup_irq(MCF_IRQ_TIMER, &mcfslt_timer_irq);
 
 	clocksource_register_hz(&mcfslt_clk, MCF_BUSCLK);
diff --git a/arch/m68k/platform/coldfire/timers.c b/arch/m68k/platform/coldfire/timers.c
index 0d90da3..d0b4e97 100644
--- a/arch/m68k/platform/coldfire/timers.c
+++ b/arch/m68k/platform/coldfire/timers.c
@@ -47,6 +47,8 @@ void coldfire_profile_init(void);
 static u32 mcftmr_cycles_per_jiffy;
 static u32 mcftmr_cnt;
 
+static irq_handler_t timer_interrupt;
+
 /***************************************************************************/
 
 static irqreturn_t mcftmr_tick(int irq, void *dummy)
@@ -55,7 +57,7 @@ static irqreturn_t mcftmr_tick(int irq, void *dummy)
 	__raw_writeb(MCFTIMER_TER_CAP | MCFTIMER_TER_REF, TA(MCFTIMER_TER));
 
 	mcftmr_cnt += mcftmr_cycles_per_jiffy;
-	return arch_timer_interrupt(irq, dummy);
+	return timer_interrupt(irq, dummy);
 }
 
 /***************************************************************************/
@@ -94,7 +96,7 @@ static struct clocksource mcftmr_clk = {
 
 /***************************************************************************/
 
-void hw_timer_init(void)
+void hw_timer_init(irq_handler_t handler)
 {
 	__raw_writew(MCFTIMER_TMR_DISABLE, TA(MCFTIMER_TMR));
 	mcftmr_cycles_per_jiffy = FREQ / HZ;
@@ -110,6 +112,7 @@ void hw_timer_init(void)
 
 	clocksource_register_hz(&mcftmr_clk, FREQ);
 
+	timer_interrupt = handler;
 	setup_irq(MCF_IRQ_TIMER, &mcftmr_timer_irq);
 
 #ifdef CONFIG_HIGHPROFILE
-- 
1.7.0.4
