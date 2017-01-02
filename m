From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 3/3] m68k/mac: Clean up interrupt debug macros and printk
 statements
Date: Mon,  2 Jan 2017 04:53:54 -0500 (EST)
Message-ID: <902ad0eafb63e92838ba344a256d54cdcf542653.1483350483.git.fthain@telegraphics.com.au>
References: <cover.1483350483.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1483350483.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Mac interrupt code has been debugged. The Penguin deficiencies that
still cause unhandled interrupts aren't fixable here. Besides,
interrupts are fast and frequent and these printk statements
were never really useful IMO. Remove them.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 arch/m68k/include/asm/macints.h | 16 ----------------
 arch/m68k/mac/baboon.c          | 16 ----------------
 arch/m68k/mac/macints.c         |  8 --------
 arch/m68k/mac/oss.c             | 20 --------------------
 arch/m68k/mac/psc.c             | 11 -----------
 arch/m68k/mac/via.c             |  8 --------
 6 files changed, 79 deletions(-)

diff --git a/arch/m68k/include/asm/macints.h b/arch/m68k/include/asm/macints.h
index 92aa8a4..cddb2d3 100644
--- a/arch/m68k/include/asm/macints.h
+++ b/arch/m68k/include/asm/macints.h
@@ -14,22 +14,6 @@
 
 #include <asm/irq.h>
 
-/* Setting this prints debugging info for unclaimed interrupts */
-
-#define DEBUG_SPURIOUS
-
-/* Setting this prints debugging info on each autovector interrupt */
-
-/* #define DEBUG_IRQS */
-
-/* Setting this prints debugging info on each Nubus interrupt */
-
-/* #define DEBUG_NUBUS_INT */
-
-/* Setting this prints debugging info on irqs as they enabled and disabled. */
-
-/* #define DEBUG_IRQUSE */
-
 /*
  * Base IRQ number for all Mac68K interrupt sources. Each source
  * has eight indexes (base -> base+7).
diff --git a/arch/m68k/mac/baboon.c b/arch/m68k/mac/baboon.c
index f6f7d42..514acde 100644
--- a/arch/m68k/mac/baboon.c
+++ b/arch/m68k/mac/baboon.c
@@ -14,8 +14,6 @@
 #include <asm/macints.h>
 #include <asm/mac_baboon.h>
 
-/* #define DEBUG_IRQS */
-
 int baboon_present;
 static volatile struct baboon *baboon;
 
@@ -50,12 +48,6 @@ static void baboon_irq(struct irq_desc *desc)
 	int irq_bit, irq_num;
 	unsigned char events;
 
-#ifdef DEBUG_IRQS
-	printk("baboon_irq: mb_control %02X mb_ifr %02X mb_status %02X\n",
-		(uint) baboon->mb_control, (uint) baboon->mb_ifr,
-		(uint) baboon->mb_status);
-#endif
-
 	events = baboon->mb_ifr & 0x07;
 	if (!events)
 		return;
@@ -97,18 +89,10 @@ void __init baboon_register_interrupts(void)
 
 void baboon_irq_enable(int irq)
 {
-#ifdef DEBUG_IRQUSE
-	printk("baboon_irq_enable(%d)\n", irq);
-#endif
-
 	mac_irq_enable(irq_get_irq_data(IRQ_NUBUS_C));
 }
 
 void baboon_irq_disable(int irq)
 {
-#ifdef DEBUG_IRQUSE
-	printk("baboon_irq_disable(%d)\n", irq);
-#endif
-
 	mac_irq_disable(irq_get_irq_data(IRQ_NUBUS_C));
 }
diff --git a/arch/m68k/mac/macints.c b/arch/m68k/mac/macints.c
index 1244d36..b5cd06d 100644
--- a/arch/m68k/mac/macints.c
+++ b/arch/m68k/mac/macints.c
@@ -129,8 +129,6 @@ extern void show_registers(struct pt_regs *);
 
 irqreturn_t mac_nmi_handler(int, void *);
 
-/* #define DEBUG_MACINTS */
-
 static unsigned int mac_irq_startup(struct irq_data *);
 static void mac_irq_shutdown(struct irq_data *);
 
@@ -144,9 +142,6 @@ static struct irq_chip mac_irq_chip = {
 
 void __init mac_init_IRQ(void)
 {
-#ifdef DEBUG_MACINTS
-	printk("mac_init_IRQ(): Setting things up...\n");
-#endif
 	m68k_setup_irq_controller(&mac_irq_chip, handle_simple_irq, IRQ_USER,
 				  NUM_MAC_SOURCES - IRQ_USER);
 
@@ -167,9 +162,6 @@ void __init mac_init_IRQ(void)
 	if (request_irq(IRQ_AUTO_7, mac_nmi_handler, 0, "NMI",
 			mac_nmi_handler))
 		pr_err("Couldn't register NMI\n");
-#ifdef DEBUG_MACINTS
-	printk("mac_init_IRQ(): Done!\n");
-#endif
 }
 
 /*
diff --git a/arch/m68k/mac/oss.c b/arch/m68k/mac/oss.c
index 55d65927..ca84dcf 100644
--- a/arch/m68k/mac/oss.c
+++ b/arch/m68k/mac/oss.c
@@ -68,15 +68,6 @@ static void oss_irq(struct irq_desc *desc)
 	int events = oss->irq_pending &
 		(OSS_IP_IOPSCC | OSS_IP_SCSI | OSS_IP_IOPISM);
 
-#ifdef DEBUG_IRQS
-	if ((console_loglevel == 10) && !(events & OSS_IP_SCSI)) {
-		unsigned int irq = irq_desc_get_irq(desc);
-
-		printk("oss_irq: irq %u events = 0x%04X\n", irq,
-			(int) oss->irq_pending);
-	}
-#endif
-
 	if (events & OSS_IP_IOPSCC) {
 		oss->irq_pending &= ~OSS_IP_IOPSCC;
 		generic_handle_irq(IRQ_MAC_SCC);
@@ -107,11 +98,6 @@ static void oss_nubus_irq(struct irq_desc *desc)
 	if (!events)
 		return;
 
-#ifdef DEBUG_NUBUS_INT
-	if (console_loglevel > 7) {
-		printk("oss_nubus_irq: events = 0x%04X\n", events);
-	}
-#endif
 	/* There are only six slots on the OSS, not seven */
 
 	i = 6;
@@ -163,9 +149,6 @@ void __init oss_register_interrupts(void)
  */
 
 void oss_irq_enable(int irq) {
-#ifdef DEBUG_IRQUSE
-	printk("oss_irq_enable(%d)\n", irq);
-#endif
 	switch(irq) {
 		case IRQ_MAC_SCC:
 			oss->irq_level[OSS_IOPSCC] = OSS_IRQLEV_IOPSCC;
@@ -199,9 +182,6 @@ void oss_irq_enable(int irq) {
  */
 
 void oss_irq_disable(int irq) {
-#ifdef DEBUG_IRQUSE
-	printk("oss_irq_disable(%d)\n", irq);
-#endif
 	switch(irq) {
 		case IRQ_MAC_SCC:
 			oss->irq_level[OSS_IOPSCC] = 0;
diff --git a/arch/m68k/mac/psc.c b/arch/m68k/mac/psc.c
index cb2b1a3..439a2a2 100644
--- a/arch/m68k/mac/psc.c
+++ b/arch/m68k/mac/psc.c
@@ -122,11 +122,6 @@ static void psc_irq(struct irq_desc *desc)
 	int irq_num;
 	unsigned char irq_bit, events;
 
-#ifdef DEBUG_IRQS
-	printk("psc_irq: irq %u pIFR = 0x%02X pIER = 0x%02X\n",
-		irq, (int) psc_read_byte(pIFR), (int) psc_read_byte(pIER));
-#endif
-
 	events = psc_read_byte(pIFR) & psc_read_byte(pIER) & 0xF;
 	if (!events)
 		return;
@@ -160,9 +155,6 @@ void psc_irq_enable(int irq) {
 	int irq_idx	= IRQ_IDX(irq);
 	int pIER	= pIERbase + (irq_src << 4);
 
-#ifdef DEBUG_IRQUSE
-	printk("psc_irq_enable(%d)\n", irq);
-#endif
 	psc_write_byte(pIER, (1 << irq_idx) | 0x80);
 }
 
@@ -171,8 +163,5 @@ void psc_irq_disable(int irq) {
 	int irq_idx	= IRQ_IDX(irq);
 	int pIER	= pIERbase + (irq_src << 4);
 
-#ifdef DEBUG_IRQUSE
-	printk("psc_irq_disable(%d)\n", irq);
-#endif
 	psc_write_byte(pIER, 1 << irq_idx);
 }
diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
index 920ff63..16629e9 100644
--- a/arch/m68k/mac/via.c
+++ b/arch/m68k/mac/via.c
@@ -550,10 +550,6 @@ void via_irq_enable(int irq) {
 	int irq_src	= IRQ_SRC(irq);
 	int irq_idx	= IRQ_IDX(irq);
 
-#ifdef DEBUG_IRQUSE
-	printk(KERN_DEBUG "via_irq_enable(%d)\n", irq);
-#endif
-
 	if (irq_src == 1) {
 		via1[vIER] = IER_SET_BIT(irq_idx);
 	} else if (irq_src == 2) {
@@ -582,10 +578,6 @@ void via_irq_disable(int irq) {
 	int irq_src	= IRQ_SRC(irq);
 	int irq_idx	= IRQ_IDX(irq);
 
-#ifdef DEBUG_IRQUSE
-	printk(KERN_DEBUG "via_irq_disable(%d)\n", irq);
-#endif
-
 	if (irq_src == 1) {
 		via1[vIER] = IER_CLR_BIT(irq_idx);
 	} else if (irq_src == 2) {
-- 
2.10.2
