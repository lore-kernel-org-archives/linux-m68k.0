From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 06/14] m68k/atari: use dedicated irq_chip for timer D interrupts
Date: Mon, 25 Mar 2013 14:16:24 +1300
Message-ID: <1364174192-25406-7-git-send-email-schmitz@debian.org>
References: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:48620 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756522Ab3CYBQ5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Mar 2013 21:16:57 -0400
Received: by mail-pd0-f180.google.com with SMTP id g10so2293162pdj.39
        for <linux-m68k@vger.kernel.org>; Sun, 24 Mar 2013 18:16:57 -0700 (PDT)
In-Reply-To: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org, Michael Schmitz <schmitz@debian.org>

The MFP timer D is used as a polling timer for EtherNEC and NetUSBee
on Atari. Set up a dedicated IRQ chip for timer D to simplify interrupt
sharing, and use the new 'polling' IRQ handler for its interrupts.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/atari/ataints.c         |   70 +++++++++++++++++++++++++++++++++++++
 arch/m68k/include/asm/atariints.h |    9 +++++
 2 files changed, 79 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/atari/ataints.c b/arch/m68k/atari/ataints.c
index 3f41092..2cf7349 100644
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
+	int mfp_num = data->irq - IRQ_MFP_TIMER1;
+	stmfp_base.int_mask |= 1 << mfp_num;
+	atari_enable_irq(IRQ_MFP_TIMD);
+}
+
+static void atari_mfptimer_disable(struct irq_data *data)
+{
+	int mfp_num = data->irq - IRQ_MFP_TIMER1;
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
@@ -198,6 +254,20 @@ void __init atari_init_IRQ(void)
 	/* Initialize the PSG: all sounds off, both ports output */
 	sound_ym.rd_data_reg_sel = 7;
 	sound_ym.wd_data = 0xff;
+
+	m68k_setup_irq_controller(&atari_mfptimer_chip, handle_polled_irq,
+				  IRQ_MFP_TIMER1, 8);
+
+	/* prepare timer D data for use as poll interrupt */
+	/* set Timer D data Register - needs to be > 0 */
+	st_mfp.tim_dt_d = 254;	/* < 100 Hz */
+	/* start timer D, div = 1:100 */
+	st_mfp.tim_ct_cd = (st_mfp.tim_ct_cd & 0xf0) | 0x6;
+
+	/* request timer D dispatch handler */
+	if (request_irq(IRQ_MFP_TIMD, mfptimer_handler, IRQF_SHARED,
+			stmfp_base.name, &stmfp_base))
+		pr_err("Couldn't register %s interrupt\n", stmfp_base.name);
 }
 
 
diff --git a/arch/m68k/include/asm/atariints.h b/arch/m68k/include/asm/atariints.h
index 12c759a..953e0ac 100644
--- a/arch/m68k/include/asm/atariints.h
+++ b/arch/m68k/include/asm/atariints.h
@@ -94,6 +94,15 @@
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
1.7.0.4
