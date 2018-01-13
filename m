From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] m68k/mac: Fix race conditions in OSS interrupt dispatch
Date: Sat, 13 Jan 2018 17:44:31 -0500 (EST)
Message-ID: <96431db1a6c217d5b6be05ff4c73e953834b1d81.1515881369.git.fthain@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:44288 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753414AbeAMWob (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 13 Jan 2018 17:44:31 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

The interrupt dispatch algorithm used in the OSS driver seems to be
subject to race conditions: an IRQ flag could be lost if asserted between
the MOV instructions from and to the interrupt flag register. But testing
shows that the write to the flag register has no effect, so rewrite the
algorithm without the theoretical race condition.

There is a second theoretical race condition here. When oss_irq() is
called with say, IPL == 2 it will invoke the SCSI interrupt handler.
The SCSI IRQ is then cleared by the mac_scsi driver. If SCSI and NuBus
IRQs are now asserted together, oss_irq() will be invoked with IPL == 3
and the mac_scsi interrupt handler can be re-entered. This re-entrance
issue is not limited to SCSI and could affect NuBus and ADB drivers too.
Fix it by splitting up oss_irq() into separate handlers for each IPL.

No-one seems to know how OSS irq flags can be cleared, if at all, so add
a comment to this effect (actually reinstate one I previously removed).
Testing showed that a slot IRQ with no handler can remain asserted (in
this case a Radius video card) without causing problems for other IRQs.

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 arch/m68k/mac/oss.c | 67 +++++++++++++++++++++--------------------------------
 1 file changed, 26 insertions(+), 41 deletions(-)

diff --git a/arch/m68k/mac/oss.c b/arch/m68k/mac/oss.c
index 3f81892527ad..921e6c092f2c 100644
--- a/arch/m68k/mac/oss.c
+++ b/arch/m68k/mac/oss.c
@@ -53,56 +53,41 @@ void __init oss_init(void)
 }
 
 /*
- * Handle miscellaneous OSS interrupts.
+ * Handle OSS interrupts.
+ * XXX how do you clear a pending IRQ? is it even necessary?
  */
 
-static void oss_irq(struct irq_desc *desc)
+static void oss_iopism_irq(struct irq_desc *desc)
 {
-	int events = oss->irq_pending &
-		(OSS_IP_IOPSCC | OSS_IP_SCSI | OSS_IP_IOPISM);
-
-	if (events & OSS_IP_IOPSCC) {
-		oss->irq_pending &= ~OSS_IP_IOPSCC;
-		generic_handle_irq(IRQ_MAC_SCC);
-	}
-
-	if (events & OSS_IP_SCSI) {
-		oss->irq_pending &= ~OSS_IP_SCSI;
-		generic_handle_irq(IRQ_MAC_SCSI);
-	}
-
-	if (events & OSS_IP_IOPISM) {
-		oss->irq_pending &= ~OSS_IP_IOPISM;
-		generic_handle_irq(IRQ_MAC_ADB);
-	}
+	generic_handle_irq(IRQ_MAC_ADB);
 }
 
-/*
- * Nubus IRQ handler, OSS style
- *
- * Unlike the VIA/RBV this is on its own autovector interrupt level.
- */
+static void oss_scsi_irq(struct irq_desc *desc)
+{
+	generic_handle_irq(IRQ_MAC_SCSI);
+}
 
 static void oss_nubus_irq(struct irq_desc *desc)
 {
-	int events, irq_bit, i;
+	u16 events, irq_bit;
+	int irq_num;
 
 	events = oss->irq_pending & OSS_IP_NUBUS;
-	if (!events)
-		return;
-
-	/* There are only six slots on the OSS, not seven */
-
-	i = 6;
-	irq_bit = 0x40;
+	irq_num = NUBUS_SOURCE_BASE + 5;
+	irq_bit = OSS_IP_NUBUS5;
 	do {
-		--i;
-		irq_bit >>= 1;
 		if (events & irq_bit) {
-			oss->irq_pending &= ~irq_bit;
-			generic_handle_irq(NUBUS_SOURCE_BASE + i);
+			events &= ~irq_bit;
+			generic_handle_irq(irq_num);
 		}
-	} while(events & (irq_bit - 1));
+		--irq_num;
+		irq_bit >>= 1;
+	} while (events);
+}
+
+static void oss_iopscc_irq(struct irq_desc *desc)
+{
+	generic_handle_irq(IRQ_MAC_SCC);
 }
 
 /*
@@ -122,14 +107,14 @@ static void oss_nubus_irq(struct irq_desc *desc)
 
 void __init oss_register_interrupts(void)
 {
-	irq_set_chained_handler(OSS_IRQLEV_IOPISM, oss_irq);
-	irq_set_chained_handler(OSS_IRQLEV_SCSI,   oss_irq);
+	irq_set_chained_handler(OSS_IRQLEV_IOPISM, oss_iopism_irq);
+	irq_set_chained_handler(OSS_IRQLEV_SCSI,   oss_scsi_irq);
 	irq_set_chained_handler(OSS_IRQLEV_NUBUS,  oss_nubus_irq);
-	irq_set_chained_handler(OSS_IRQLEV_IOPSCC, oss_irq);
+	irq_set_chained_handler(OSS_IRQLEV_IOPSCC, oss_iopscc_irq);
 	irq_set_chained_handler(OSS_IRQLEV_VIA1,   via1_irq);
 
 	/* OSS_VIA1 gets enabled here because it has no machspec interrupt. */
-	oss->irq_level[OSS_VIA1] = IRQ_AUTO_6;
+	oss->irq_level[OSS_VIA1] = OSS_IRQLEV_VIA1;
 }
 
 /*
-- 
2.13.6
