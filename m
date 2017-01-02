From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 1/3] m68k/mac: Improve NMI handler
Date: Mon,  2 Jan 2017 04:53:54 -0500 (EST)
Message-ID: <0cb5e92b377bea6699f8af8f5c5a97081a217f74.1483350483.git.fthain@telegraphics.com.au>
References: <cover.1483350483.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1483350483.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

mac_nmi_handler() is useless in its present form and locks up my PowerBook
180. Let's throw out the dead code and make it do something useful: print
a register dump and a stack trace.

mac_debug_handler() is also dead code. Remove it along with its static
data.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 arch/m68k/mac/macints.c | 67 ++++++-------------------------------------------
 1 file changed, 8 insertions(+), 59 deletions(-)

diff --git a/arch/m68k/mac/macints.c b/arch/m68k/mac/macints.c
index 9f98c08..f9672bb 100644
--- a/arch/m68k/mac/macints.c
+++ b/arch/m68k/mac/macints.c
@@ -127,12 +127,9 @@
 
 #define SHUTUP_SONIC
 
-/*
- * console_loglevel determines NMI handler function
- */
+extern void show_registers(struct pt_regs *);
 
 irqreturn_t mac_nmi_handler(int, void *);
-irqreturn_t mac_debug_handler(int, void *);
 
 /* #define DEBUG_MACINTS */
 
@@ -276,65 +273,17 @@ static void mac_irq_shutdown(struct irq_data *data)
 		mac_irq_disable(data);
 }
 
-static int num_debug[8];
-
-irqreturn_t mac_debug_handler(int irq, void *dev_id)
-{
-	if (num_debug[irq] < 10) {
-		printk("DEBUG: Unexpected IRQ %d\n", irq);
-		num_debug[irq]++;
-	}
-	return IRQ_HANDLED;
-}
-
-static int in_nmi;
-static volatile int nmi_hold;
+static volatile int in_nmi;
 
 irqreturn_t mac_nmi_handler(int irq, void *dev_id)
 {
-	int i;
-	/*
-	 * generate debug output on NMI switch if 'debug' kernel option given
-	 * (only works with Penguin!)
-	 */
-
-	in_nmi++;
-	for (i=0; i<100; i++)
-		udelay(1000);
-
-	if (in_nmi == 1) {
-		nmi_hold = 1;
-		printk("... pausing, press NMI to resume ...");
-	} else {
-		printk(" ok!\n");
-		nmi_hold = 0;
-	}
+	if (in_nmi)
+		return IRQ_HANDLED;
+	in_nmi = 1;
 
-	barrier();
+	pr_info("Non-Maskable Interrupt\n");
+	show_registers(get_irq_regs());
 
-	while (nmi_hold == 1)
-		udelay(1000);
-
-	if (console_loglevel >= 8) {
-#if 0
-		struct pt_regs *fp = get_irq_regs();
-		show_state();
-		printk("PC: %08lx\nSR: %04x  SP: %p\n", fp->pc, fp->sr, fp);
-		printk("d0: %08lx    d1: %08lx    d2: %08lx    d3: %08lx\n",
-		       fp->d0, fp->d1, fp->d2, fp->d3);
-		printk("d4: %08lx    d5: %08lx    a0: %08lx    a1: %08lx\n",
-		       fp->d4, fp->d5, fp->a0, fp->a1);
-
-		if (STACK_MAGIC != *(unsigned long *)current->kernel_stack_page)
-			printk("Corrupted stack page\n");
-		printk("Process %s (pid: %d, stackpage=%08lx)\n",
-			current->comm, current->pid, current->kernel_stack_page);
-		if (intr_count == 1)
-			dump_stack((struct frame *)fp);
-#else
-		/* printk("NMI "); */
-#endif
-	}
-	in_nmi--;
+	in_nmi = 0;
 	return IRQ_HANDLED;
 }
-- 
2.10.2
