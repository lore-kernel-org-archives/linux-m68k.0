Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D361FF1B5
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 05:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777526602; cv=none; b=iG3mq75GEeTsxgvtbWRBkF3hqFsL0N2y+Tq+uyt34Srb0PaNiBcIKzGFLup62NkuGKxgfd2HaalTbrr3ND/CFJYSPWxkAcOrMCN9ddndHnIdkC5/ACRenLQ56wnRBcZqiFBB+rHVEUuyRkKsT6UJrx7zPAFYO2yFii8SCfVWxag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777526602; c=relaxed/simple;
	bh=pJoH3NdxtBZLMycqeseOQPObAkzsZlDEfPgwQMw+0yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pFHbANo674ryZa0VuHecodRjYWq7E+lYL/KT0ZJ4wJ6MeDBCPhBtm6GN4hqPI/bPONH+0a9ABbFIiQgm3bP9sqREvtOifiy7qLdp/AK4dMPXn99znD3MTXb28PqdDmv2gctuT7IOU0vGDaUTaNTFpvrCb0tYqlybQFcyuLPQxVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1977544261;
	Thu, 30 Apr 2026 05:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A4EC2BCB8;
	Thu, 30 Apr 2026 05:23:19 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: arnd@kernel.org,
	Greg Ungerer <gerg@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 4/7] m68k: coldfire: use ColdFire specifc IO access in timer code
Date: Thu, 30 Apr 2026 15:19:20 +1000
Message-ID: <20260430052047.1827575-5-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430052047.1827575-1-gerg@linux-m68k.org>
References: <20260430052047.1827575-1-gerg@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Greg Ungerer <gerg@kernel.org>

Convert all coldfire specific timer setup code to only use the
newly created internal register access methods. This is replacing the
mixed and inconsistent use of readx/writex and __raw_readx/__raw_writex
for internal SoC registers.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/dma_timer.c | 12 ++++++------
 arch/m68k/coldfire/pit.c       | 20 ++++++++++----------
 arch/m68k/coldfire/sltimers.c  | 18 +++++++++---------
 arch/m68k/coldfire/timers.c    | 26 +++++++++++++-------------
 4 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/arch/m68k/coldfire/dma_timer.c b/arch/m68k/coldfire/dma_timer.c
index 91e6728f51ed..0605050d83c2 100644
--- a/arch/m68k/coldfire/dma_timer.c
+++ b/arch/m68k/coldfire/dma_timer.c
@@ -37,7 +37,7 @@
 
 static u64 cf_dt_get_cycles(struct clocksource *cs)
 {
-	return __raw_readl(DTCN0);
+	return mcf_read32(DTCN0);
 }
 
 static struct clocksource clocksource_cf_dt = {
@@ -56,10 +56,10 @@ static int __init init_cf_dt_clocksource(void)
 	 * get a ~213 ns resolution and the 32bit register will overflow almost
 	 * every 15 minutes.
 	 */
-	__raw_writeb(0x00, DTXMR0);
-	__raw_writeb(0x00, DTER0);
-	__raw_writel(0x00000000, DTRR0);
-	__raw_writew(DMA_DTMR_CLK_DIV_16 | DMA_DTMR_ENABLE, DTMR0);
+	mcf_write8(0x00, DTXMR0);
+	mcf_write8(0x00, DTER0);
+	mcf_write32(0x00000000, DTRR0);
+	mcf_write16(DMA_DTMR_CLK_DIV_16 | DMA_DTMR_ENABLE, DTMR0);
 	return clocksource_register_hz(&clocksource_cf_dt, DMA_FREQ);
 }
 
@@ -76,7 +76,7 @@ static unsigned long long cycles2ns(unsigned long cycl)
 
 unsigned long long sched_clock(void)
 {
-	unsigned long cycl = __raw_readl(DTCN0);
+	unsigned long cycl = mcf_read32(DTCN0);
 
 	return cycles2ns(cycl);
 }
diff --git a/arch/m68k/coldfire/pit.c b/arch/m68k/coldfire/pit.c
index 855d0af47097..de4eaf8db22c 100644
--- a/arch/m68k/coldfire/pit.c
+++ b/arch/m68k/coldfire/pit.c
@@ -45,9 +45,9 @@ static u32 pit_cnt;
 
 static int cf_pit_set_periodic(struct clock_event_device *evt)
 {
-	__raw_writew(MCFPIT_PCSR_DISABLE, TA(MCFPIT_PCSR));
-	__raw_writew(PIT_CYCLES_PER_JIFFY, TA(MCFPIT_PMR));
-	__raw_writew(MCFPIT_PCSR_EN | MCFPIT_PCSR_PIE |
+	mcf_write16(MCFPIT_PCSR_DISABLE, TA(MCFPIT_PCSR));
+	mcf_write16(PIT_CYCLES_PER_JIFFY, TA(MCFPIT_PMR));
+	mcf_write16(MCFPIT_PCSR_EN | MCFPIT_PCSR_PIE |
 		     MCFPIT_PCSR_OVW | MCFPIT_PCSR_RLD |
 		     MCFPIT_PCSR_CLK64, TA(MCFPIT_PCSR));
 	return 0;
@@ -55,15 +55,15 @@ static int cf_pit_set_periodic(struct clock_event_device *evt)
 
 static int cf_pit_set_oneshot(struct clock_event_device *evt)
 {
-	__raw_writew(MCFPIT_PCSR_DISABLE, TA(MCFPIT_PCSR));
-	__raw_writew(MCFPIT_PCSR_EN | MCFPIT_PCSR_PIE |
+	mcf_write16(MCFPIT_PCSR_DISABLE, TA(MCFPIT_PCSR));
+	mcf_write16(MCFPIT_PCSR_EN | MCFPIT_PCSR_PIE |
 		     MCFPIT_PCSR_OVW | MCFPIT_PCSR_CLK64, TA(MCFPIT_PCSR));
 	return 0;
 }
 
 static int cf_pit_shutdown(struct clock_event_device *evt)
 {
-	__raw_writew(MCFPIT_PCSR_DISABLE, TA(MCFPIT_PCSR));
+	mcf_write16(MCFPIT_PCSR_DISABLE, TA(MCFPIT_PCSR));
 	return 0;
 }
 
@@ -75,7 +75,7 @@ static int cf_pit_shutdown(struct clock_event_device *evt)
 static int cf_pit_next_event(unsigned long delta,
 		struct clock_event_device *evt)
 {
-	__raw_writew(delta, TA(MCFPIT_PMR));
+	mcf_write16(delta, TA(MCFPIT_PMR));
 	return 0;
 }
 
@@ -101,8 +101,8 @@ static irqreturn_t pit_tick(int irq, void *dummy)
 	u16 pcsr;
 
 	/* Reset the ColdFire timer */
-	pcsr = __raw_readw(TA(MCFPIT_PCSR));
-	__raw_writew(pcsr | MCFPIT_PCSR_PIF, TA(MCFPIT_PCSR));
+	pcsr = mcf_read16(TA(MCFPIT_PCSR));
+	mcf_write16(pcsr | MCFPIT_PCSR_PIF, TA(MCFPIT_PCSR));
 
 	pit_cnt += PIT_CYCLES_PER_JIFFY;
 	evt->event_handler(evt);
@@ -118,7 +118,7 @@ static u64 pit_read_clk(struct clocksource *cs)
 	u16 pcntr;
 
 	local_irq_save(flags);
-	pcntr = __raw_readw(TA(MCFPIT_PCNTR));
+	pcntr = mcf_read16(TA(MCFPIT_PCNTR));
 	cycles = pit_cnt;
 	local_irq_restore(flags);
 
diff --git a/arch/m68k/coldfire/sltimers.c b/arch/m68k/coldfire/sltimers.c
index f9d572ee63db..e683f29df806 100644
--- a/arch/m68k/coldfire/sltimers.c
+++ b/arch/m68k/coldfire/sltimers.c
@@ -44,7 +44,7 @@
 irqreturn_t mcfslt_profile_tick(int irq, void *dummy)
 {
 	/* Reset Slice Timer 1 */
-	__raw_writel(MCFSLT_SSR_BE | MCFSLT_SSR_TE, PA(MCFSLT_SSR));
+	mcf_write32(MCFSLT_SSR_BE | MCFSLT_SSR_TE, PA(MCFSLT_SSR));
 	if (current->pid)
 		profile_tick(CPU_PROFILING);
 	return IRQ_HANDLED;
@@ -65,8 +65,8 @@ void mcfslt_profile_init(void)
 	}
 
 	/* Set up TIMER 2 as high speed profile clock */
-	__raw_writel(MCF_BUSCLK / PROFILEHZ - 1, PA(MCFSLT_STCNT));
-	__raw_writel(MCFSLT_SCR_RUN | MCFSLT_SCR_IEN | MCFSLT_SCR_TEN,
+	mcf_write32(MCF_BUSCLK / PROFILEHZ - 1, PA(MCFSLT_STCNT));
+	mcf_write32(MCFSLT_SCR_RUN | MCFSLT_SCR_IEN | MCFSLT_SCR_TEN,
 								PA(MCFSLT_SCR));
 
 }
@@ -86,7 +86,7 @@ static u32 mcfslt_cnt;
 static irqreturn_t mcfslt_tick(int irq, void *dummy)
 {
 	/* Reset Slice Timer 0 */
-	__raw_writel(MCFSLT_SSR_BE | MCFSLT_SSR_TE, TA(MCFSLT_SSR));
+	mcf_write32(MCFSLT_SSR_BE | MCFSLT_SSR_TE, TA(MCFSLT_SSR));
 	mcfslt_cnt += mcfslt_cycles_per_jiffy;
 	legacy_timer_tick(1);
 	return IRQ_HANDLED;
@@ -98,11 +98,11 @@ static u64 mcfslt_read_clk(struct clocksource *cs)
 	u32 cycles, scnt;
 
 	local_irq_save(flags);
-	scnt = __raw_readl(TA(MCFSLT_SCNT));
+	scnt = mcf_read32(TA(MCFSLT_SCNT));
 	cycles = mcfslt_cnt;
-	if (__raw_readl(TA(MCFSLT_SSR)) & MCFSLT_SSR_TE) {
+	if (mcf_read32(TA(MCFSLT_SSR)) & MCFSLT_SSR_TE) {
 		cycles += mcfslt_cycles_per_jiffy;
-		scnt = __raw_readl(TA(MCFSLT_SCNT));
+		scnt = mcf_read32(TA(MCFSLT_SCNT));
 	}
 	local_irq_restore(flags);
 
@@ -129,8 +129,8 @@ void hw_timer_init(void)
 	 *	STCNT + 1 steps for 1 tick, not STCNT.  So if you want
 	 *	n cycles, initialize STCNT with n - 1.
 	 */
-	__raw_writel(mcfslt_cycles_per_jiffy - 1, TA(MCFSLT_STCNT));
-	__raw_writel(MCFSLT_SCR_RUN | MCFSLT_SCR_IEN | MCFSLT_SCR_TEN,
+	mcf_write32(mcfslt_cycles_per_jiffy - 1, TA(MCFSLT_STCNT));
+	mcf_write32(MCFSLT_SCR_RUN | MCFSLT_SCR_IEN | MCFSLT_SCR_TEN,
 								TA(MCFSLT_SCR));
 	/* initialize mcfslt_cnt knowing that slice timers count down */
 	mcfslt_cnt = mcfslt_cycles_per_jiffy;
diff --git a/arch/m68k/coldfire/timers.c b/arch/m68k/coldfire/timers.c
index 05a42d8e0a59..9a6b7d30e4d6 100644
--- a/arch/m68k/coldfire/timers.c
+++ b/arch/m68k/coldfire/timers.c
@@ -38,11 +38,11 @@
 void coldfire_profile_init(void);
 
 #if defined(CONFIG_M53xx) || defined(CONFIG_M5441x)
-#define	__raw_readtrr	__raw_readl
-#define	__raw_writetrr	__raw_writel
+#define	__raw_readtrr	mcf_read32
+#define	__raw_writetrr	mcf_write32
 #else
-#define	__raw_readtrr	__raw_readw
-#define	__raw_writetrr	__raw_writew
+#define	__raw_readtrr	mcf_read16
+#define	__raw_writetrr	mcf_write16
 #endif
 
 static u32 mcftmr_cycles_per_jiffy;
@@ -54,13 +54,13 @@ static void init_timer_irq(void)
 {
 #ifdef MCFSIM_ICR_AUTOVEC
 	/* Timer1 is always used as system timer */
-	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI3,
+	mcf_write8(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI3,
 		MCFSIM_TIMER1ICR);
 	mcf_mapirq2imr(MCF_IRQ_TIMER, MCFINTC_TIMER1);
 
 #ifdef CONFIG_HIGHPROFILE
 	/* Timer2 is to be used as a high speed profile timer  */
-	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL7 | MCFSIM_ICR_PRI3,
+	mcf_write8(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL7 | MCFSIM_ICR_PRI3,
 		MCFSIM_TIMER2ICR);
 	mcf_mapirq2imr(MCF_IRQ_PROFILER, MCFINTC_TIMER2);
 #endif
@@ -72,7 +72,7 @@ static void init_timer_irq(void)
 static irqreturn_t mcftmr_tick(int irq, void *dummy)
 {
 	/* Reset the ColdFire timer */
-	__raw_writeb(MCFTIMER_TER_CAP | MCFTIMER_TER_REF, TA(MCFTIMER_TER));
+	mcf_write8(MCFTIMER_TER_CAP | MCFTIMER_TER_REF, TA(MCFTIMER_TER));
 
 	mcftmr_cnt += mcftmr_cycles_per_jiffy;
 	legacy_timer_tick(1);
@@ -88,7 +88,7 @@ static u64 mcftmr_read_clk(struct clocksource *cs)
 	u16 tcn;
 
 	local_irq_save(flags);
-	tcn = __raw_readw(TA(MCFTIMER_TCN));
+	tcn = mcf_read16(TA(MCFTIMER_TCN));
 	cycles = mcftmr_cnt;
 	local_irq_restore(flags);
 
@@ -111,7 +111,7 @@ void hw_timer_init(void)
 {
 	int r;
 
-	__raw_writew(MCFTIMER_TMR_DISABLE, TA(MCFTIMER_TMR));
+	mcf_write16(MCFTIMER_TMR_DISABLE, TA(MCFTIMER_TMR));
 	mcftmr_cycles_per_jiffy = FREQ / HZ;
 	/*
 	 *	The coldfire timer runs from 0 to TRR included, then 0
@@ -120,7 +120,7 @@ void hw_timer_init(void)
 	 *	initialize TRR with n - 1.
 	 */
 	__raw_writetrr(mcftmr_cycles_per_jiffy - 1, TA(MCFTIMER_TRR));
-	__raw_writew(MCFTIMER_TMR_ENORI | MCFTIMER_TMR_CLK16 |
+	mcf_write16(MCFTIMER_TMR_ENORI | MCFTIMER_TMR_CLK16 |
 		MCFTIMER_TMR_RESTART | MCFTIMER_TMR_ENABLE, TA(MCFTIMER_TMR));
 
 	clocksource_register_hz(&mcftmr_clk, FREQ);
@@ -158,7 +158,7 @@ void hw_timer_init(void)
 irqreturn_t coldfire_profile_tick(int irq, void *dummy)
 {
 	/* Reset ColdFire timer2 */
-	__raw_writeb(MCFTIMER_TER_CAP | MCFTIMER_TER_REF, PA(MCFTIMER_TER));
+	mcf_write8(MCFTIMER_TER_CAP | MCFTIMER_TER_REF, PA(MCFTIMER_TER));
 	if (current->pid)
 		profile_tick(CPU_PROFILING);
 	return IRQ_HANDLED;
@@ -174,10 +174,10 @@ void coldfire_profile_init(void)
 	       PROFILEHZ);
 
 	/* Set up TIMER 2 as high speed profile clock */
-	__raw_writew(MCFTIMER_TMR_DISABLE, PA(MCFTIMER_TMR));
+	mcf_write16(MCFTIMER_TMR_DISABLE, PA(MCFTIMER_TMR));
 
 	__raw_writetrr(((MCF_BUSCLK / 16) / PROFILEHZ), PA(MCFTIMER_TRR));
-	__raw_writew(MCFTIMER_TMR_ENORI | MCFTIMER_TMR_CLK16 |
+	mcf_write16(MCFTIMER_TMR_ENORI | MCFTIMER_TMR_CLK16 |
 		MCFTIMER_TMR_RESTART | MCFTIMER_TMR_ENABLE, PA(MCFTIMER_TMR));
 
 	ret = request_irq(MCF_IRQ_PROFILER, coldfire_profile_tick, IRQF_TIMER,
-- 
2.54.0

