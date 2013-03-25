From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 05/14] m68k/irq: add handle_polled_irq() for timer based soft interrupts
Date: Mon, 25 Mar 2013 14:16:23 +1300
Message-ID: <1364174192-25406-6-git-send-email-schmitz@debian.org>
References: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:46214 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756521Ab3CYBQ4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Mar 2013 21:16:56 -0400
Received: by mail-pa0-f50.google.com with SMTP id bg2so734044pad.23
        for <linux-m68k@vger.kernel.org>; Sun, 24 Mar 2013 18:16:55 -0700 (PDT)
In-Reply-To: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org, Michael Schmitz <schmitz@debian.org>

This patch adds a special 'polled interrupt' handler for timer based software interrupts.

handle_simple_irq() will respond to excessive unhandled interrupts (as are expected for a
polling timer interrupt) by disabling the apparently unhandled interrupt source.

handle_polled_irq() prevents this by setting the IRQS_POLL_INPROGRESS flag which will cause
the unhandled interrupt events to be ignored.

This is a temporary hack to allow timer based polling of the Atari ROM port network and USB
cards only. Suggestions on how to properly handle this in the normal interrupt framework are
most welcome.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 include/linux/irq.h |    1 +
 kernel/irq/chip.c   |   36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index bc4e066..5064385 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -407,6 +407,7 @@ extern void handle_fasteoi_irq(unsigned int irq, struct irq_desc *desc);
 extern void handle_edge_irq(unsigned int irq, struct irq_desc *desc);
 extern void handle_edge_eoi_irq(unsigned int irq, struct irq_desc *desc);
 extern void handle_simple_irq(unsigned int irq, struct irq_desc *desc);
+extern void handle_polled_irq(unsigned int irq, struct irq_desc *desc);
 extern void handle_percpu_irq(unsigned int irq, struct irq_desc *desc);
 extern void handle_percpu_devid_irq(unsigned int irq, struct irq_desc *desc);
 extern void handle_bad_irq(unsigned int irq, struct irq_desc *desc);
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index cbd97ce..667e4c1 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -353,6 +353,42 @@ out_unlock:
 }
 EXPORT_SYMBOL_GPL(handle_simple_irq);
 
+/**
+ *	handle_polled_irq - Simple and software-decoded IRQs.
+ *	@irq:	the interrupt number
+ *	@desc:	the interrupt description structure for this irq
+ *
+ *	Polled interrupts are sent from a demultiplexing software interrupt
+ *	handler, where no interrupt hardware control is necessary.
+ */
+void
+handle_polled_irq(unsigned int irq, struct irq_desc *desc)
+{
+	raw_spin_lock(&desc->lock);
+
+	if (unlikely(irqd_irq_inprogress(&desc->irq_data)))
+		if (!irq_check_poll(desc))
+			goto out_unlock;
+
+	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
+	kstat_incr_irqs_this_cpu(irq, desc);
+
+	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
+		desc->istate |= IRQS_PENDING;
+		goto out_unlock;
+	}
+
+	desc->istate |= IRQS_POLL_INPROGRESS;
+
+	handle_irq_event(desc);
+
+	desc->istate &= ~(IRQS_POLL_INPROGRESS);
+
+out_unlock:
+	raw_spin_unlock(&desc->lock);
+}
+EXPORT_SYMBOL_GPL(handle_polled_irq);
+
 /*
  * Called unconditionally from handle_level_irq() and only for oneshot
  * interrupts from handle_fasteoi_irq()
-- 
1.7.0.4
