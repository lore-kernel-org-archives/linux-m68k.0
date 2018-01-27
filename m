From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] m68k/mac: Fix apparent race condition in Baboon interrupt
 dispatch
Date: Sat, 27 Jan 2018 18:51:40 -0500 (EST)
Message-ID: <20180127235140.CBFF12962D__1166.65222817591$1517097030$gmane$org@kvm5.telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

The algorithm used in baboon_irq() appears to be subject to a race
condition: an IRQ flag could be lost if asserted between the MOV
instructions from and to the interrupt flag register. However,
testing shows that the write to the flag register has no effect.
Rewrite this loop to remove the apparent race condition.

No-one seems to know how to clear Baboon IRQ flags, or whether
that's even possible, so add a comment about this.

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 arch/m68k/mac/baboon.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/arch/m68k/mac/baboon.c b/arch/m68k/mac/baboon.c
index c7ea6475ef9b..a7d280220662 100644
--- a/arch/m68k/mac/baboon.c
+++ b/arch/m68k/mac/baboon.c
@@ -18,10 +18,6 @@
 int baboon_present;
 static volatile struct baboon *baboon;
 
-#if 0
-extern int macide_ack_intr(struct ata_channel *);
-#endif
-
 /*
  * Baboon initialization.
  */
@@ -41,33 +37,26 @@ void __init baboon_init(void)
 }
 
 /*
- * Baboon interrupt handler. This works a lot like a VIA.
+ * Baboon interrupt handler.
+ * XXX how do you clear a pending IRQ? is it even necessary?
  */
 
 static void baboon_irq(struct irq_desc *desc)
 {
-	int irq_bit, irq_num;
-	unsigned char events;
+	short events, irq_bit;
+	int irq_num;
 
 	events = baboon->mb_ifr & 0x07;
-	if (!events)
-		return;
-
 	irq_num = IRQ_BABOON_0;
 	irq_bit = 1;
 	do {
-	        if (events & irq_bit) {
-			baboon->mb_ifr &= ~irq_bit;
+		if (events & irq_bit) {
+			events &= ~irq_bit;
 			generic_handle_irq(irq_num);
 		}
+		++irq_num;
 		irq_bit <<= 1;
-		irq_num++;
-	} while(events >= irq_bit);
-#if 0
-	if (baboon->mb_ifr & 0x02) macide_ack_intr(NULL);
-	/* for now we need to smash all interrupts */
-	baboon->mb_ifr &= ~events;
-#endif
+	} while (events);
 }
 
 /*
-- 
2.13.6
