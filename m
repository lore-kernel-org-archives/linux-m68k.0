From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 10/22] m68k/mac: psc - Modernize printing of kernel messages
Date: Wed,  7 Dec 2016 16:09:08 +0100
Message-ID: <1481123360-10978-11-git-send-email-geert@linux-m68k.org>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

  - Introduce helpers for printing debug messages, incl. dummies for
    validating format strings when debugging is disabled,
  - Convert from printk() to pr_*(),
  - Add missing continuations,
  - Drop superfluous casts.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/mac/psc.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/arch/m68k/mac/psc.c b/arch/m68k/mac/psc.c
index cb2b1a3a2b62d97f..83f81790c9eba80a 100644
--- a/arch/m68k/mac/psc.c
+++ b/arch/m68k/mac/psc.c
@@ -26,6 +26,11 @@
 #include <asm/mac_psc.h>
 
 #define DEBUG_PSC
+#ifdef DEBUG_IRQS
+#define pr_irq(fmt, ...) printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
+#else
+#define pr_irq(fmt, ...) no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
+#endif
 
 volatile __u8 *psc;
 EXPORT_SYMBOL_GPL(psc);
@@ -42,10 +47,9 @@ static void psc_debug_dump(void)
 		return;
 
 	for (i = 0x30 ; i < 0x70 ; i += 0x10) {
-		printk("PSC #%d:  IFR = 0x%02X IER = 0x%02X\n",
-			i >> 4,
-			(int) psc_read_byte(pIFRbase + i),
-			(int) psc_read_byte(pIERbase + i));
+		pr_info("PSC #%d:  IFR = 0x%02X IER = 0x%02X\n", i >> 4,
+			psc_read_byte(pIFRbase + i),
+			psc_read_byte(pIERbase + i));
 	}
 }
 
@@ -59,14 +63,14 @@ static __init void psc_dma_die_die_die(void)
 {
 	int i;
 
-	printk("Killing all PSC DMA channels...");
+	pr_info("Killing all PSC DMA channels...");
 	for (i = 0 ; i < 9 ; i++) {
 		psc_write_word(PSC_CTL_BASE + (i << 4), 0x8800);
 		psc_write_word(PSC_CTL_BASE + (i << 4), 0x1000);
 		psc_write_word(PSC_CMD_BASE + (i << 5), 0x1100);
 		psc_write_word(PSC_CMD_BASE + (i << 5) + 0x10, 0x1100);
 	}
-	printk("done!\n");
+	pr_cont("done!\n");
 }
 
 /*
@@ -92,7 +96,7 @@ void __init psc_init(void)
 
 	psc = (void *) PSC_BASE;
 
-	printk("PSC detected at %p\n", psc);
+	pr_info("PSC detected at %p\n", psc);
 
 	psc_dma_die_die_die();
 
@@ -122,10 +126,8 @@ static void psc_irq(struct irq_desc *desc)
 	int irq_num;
 	unsigned char irq_bit, events;
 
-#ifdef DEBUG_IRQS
-	printk("psc_irq: irq %u pIFR = 0x%02X pIER = 0x%02X\n",
-		irq, (int) psc_read_byte(pIFR), (int) psc_read_byte(pIER));
-#endif
+	pr_irq("psc_irq: irq %u pIFR = 0x%02X pIER = 0x%02X\n", irq,
+	       psc_read_byte(pIFR), psc_read_byte(pIER));
 
 	events = psc_read_byte(pIFR) & psc_read_byte(pIER) & 0xF;
 	if (!events)
@@ -160,9 +162,7 @@ void psc_irq_enable(int irq) {
 	int irq_idx	= IRQ_IDX(irq);
 	int pIER	= pIERbase + (irq_src << 4);
 
-#ifdef DEBUG_IRQUSE
-	printk("psc_irq_enable(%d)\n", irq);
-#endif
+	pr_irq("psc_irq_enable(%d)\n", irq);
 	psc_write_byte(pIER, (1 << irq_idx) | 0x80);
 }
 
@@ -171,8 +171,6 @@ void psc_irq_disable(int irq) {
 	int irq_idx	= IRQ_IDX(irq);
 	int pIER	= pIERbase + (irq_src << 4);
 
-#ifdef DEBUG_IRQUSE
-	printk("psc_irq_disable(%d)\n", irq);
-#endif
+	pr_irq("psc_irq_disable(%d)\n", irq);
 	psc_write_byte(pIER, 1 << irq_idx);
 }
-- 
1.9.1
