From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 1/2] [m68k] Atari: use dedicated irq_chip for timer D interrupts (polling timer for EtherNEC and friends)
Date: Sat, 11 Aug 2012 20:59:39 +1200 (NZST)
Message-ID: <20120811085939.C4DDD360087@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:42530 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752838Ab2HKI7q (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 11 Aug 2012 04:59:46 -0400
Received: by pbbrr13 with SMTP id rr13so4126540pbb.19
        for <linux-m68k@vger.kernel.org>; Sat, 11 Aug 2012 01:59:46 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org

Hi Geert,

This is part one of the interrupt changes required to avoid using the IRQF_SHARED flag in ne.c. 
As mentioned previously, this patch does not solve the unhandled interrupt watchdog problem, but 
a simple noirqdebug kernel option is sufficient to sort that out. 

Current sole user of the chained polling timer interrupt is ne.c - another user will be the driver 
for the ISP1160 USB host adapter to support the NetUSBee ROM port adapter.

Part 2 will be changes to atari/config.c tp make use of the new chained timer.

Cheers,

	Michael

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/atari/ataints.c         |   75 +++++++++++++++++++++++++++++++++++++
 arch/m68k/include/asm/atariints.h |    9 ++++
 2 files changed, 84 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/atari/ataints.c b/arch/m68k/atari/ataints.c
index 3f41092..96f82f7 100644
--- a/arch/m68k/atari/ataints.c
+++ b/arch/m68k/atari/ataints.c
@@ -122,6 +122,62 @@ static struct irq_chip atari_irq_chip = {
 };
 
 /*
+ * ST-MFP timer D chained interrupts - each driver gets its own timer
+ * interrupt instance.
+ */
+
+struct mfptimerbase {
+	volatile struct MFP *mfp;
+	unsigned char mfp_mask, mfp_data;
+	unsigned short int_mask;
+	int handler_irq, mfptimer_irq, server_irq;
+	char *name;
+} stmfp_base = {
+	.mfp		= &st_mfp,
+	.int_mask	= 0x0,
+	.handler_irq	= IRQ_MFP_TIMD,
+	.mfptimer_irq	= IRQ_MFP_TIMER1,
+	.name		= "MFP Timer D"
+};
+
+static irqreturn_t mfptimer_handler(int irq, void *dev_id)
+{
+	struct mfptimerbase *base = dev_id;
+	int mach_irq;
+	unsigned char ints;
+
+	mach_irq = base->mfptimer_irq;
+	ints = base->int_mask;
+	for (; ints; mach_irq++, ints >>= 1) {
+		if (ints & 1)
+			generic_handle_irq(mach_irq);
+	}
+	return IRQ_HANDLED;
+}
+
+
+static void atari_mfptimer_enable(struct irq_data *data)
+{
+	int mfp_num = IRQ_MFP_TIMER1 - data->irq;
+	stmfp_base.int_mask |= 1 << mfp_num;
+	atari_enable_irq(IRQ_MFP_TIMD);
+}
+
+static void atari_mfptimer_disable(struct irq_data *data)
+{
+	int mfp_num = IRQ_MFP_TIMER1 - data->irq;
+	stmfp_base.int_mask &= ~(1 << mfp_num);
+	if (!stmfp_base.int_mask)
+		atari_disable_irq(IRQ_MFP_TIMD);
+}
+
+static struct irq_chip atari_mfptimer_chip = {
+	.name		= "timer_d",
+	.irq_enable	= atari_mfptimer_enable,
+	.irq_disable	= atari_mfptimer_disable,
+};
+
+/*
  * void atari_init_IRQ (void)
  *
  * Parameters:	None
@@ -198,6 +254,26 @@ void __init atari_init_IRQ(void)
 	/* Initialize the PSG: all sounds off, both ports output */
 	sound_ym.rd_data_reg_sel = 7;
 	sound_ym.wd_data = 0xff;
+
+	m68k_setup_irq_controller(&atari_mfptimer_chip, handle_simple_irq,
+				  IRQ_MFP_TIMER1, 8);
+	/* possibly unneeded */
+	m68k_setup_irq_controller(&atari_irq_chip, handle_simple_irq,
+				  IRQ_MFP_TIMD, 1);
+
+	/* prepare timer D data for use as poll interrupt */
+	/* set Timer D data Register - needs to be > 0 */
+	st_mfp.tim_dt_d = 254;	/* < 100 Hz */
+	/* start timer D, div = 1:100 */
+	st_mfp.tim_ct_cd = (st_mfp.tim_ct_cd & 0xf0) | 0x6;
+
+	/* do we need this one ? */
+	m68k_irq_startup_irq(IRQ_MFP_TIMD);
+
+	/* request timer D dispatch handler */
+	if (request_irq(IRQ_MFP_TIMD, mfptimer_handler, IRQF_SHARED,
+			stmfp_base.name, &stmfp_base))
+		pr_err("Couldn't register %s interrupt\n", stmfp_base.name);
 }
 
 
diff --git a/arch/m68k/include/asm/atariints.h b/arch/m68k/include/asm/atariints.h
index 904d4ad..5f37fc5 100644
--- a/arch/m68k/include/asm/atariints.h
+++ b/arch/m68k/include/asm/atariints.h
@@ -98,6 +98,15 @@
 #define IRQ_SCCA_RX	     (52)
 #define IRQ_SCCA_SPCOND	     (54)
 
+/* shared MFP timer D interrupts - hires timer for EtherNEC et al. */
+#define IRQ_MFP_TIMER1       (64)
+#define IRQ_MFP_TIMER2       (65)
+#define IRQ_MFP_TIMER3       (66)
+#define IRQ_MFP_TIMER4       (67)
+#define IRQ_MFP_TIMER5       (68)
+#define IRQ_MFP_TIMER6       (69)
+#define IRQ_MFP_TIMER7       (70)
+#define IRQ_MFP_TIMER8       (71)
 
 #define INT_CLK   24576	    /* CLK while int_clk =2.456MHz and divide = 100 */
 #define INT_TICKS 246	    /* to make sched_time = 99.902... HZ */
-- 
1.5.6
