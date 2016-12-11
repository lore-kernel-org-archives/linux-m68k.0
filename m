From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] m68k/mac: Improve NMI handler
Date: Mon, 12 Dec 2016 10:29:06 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1612121027050.12827@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:44404 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753930AbcLKX2t (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 11 Dec 2016 18:28:49 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

mac_nmi_handler() is useless in its present form and locks up my PowerBook 
180. Instead, let's have it do something useful and print a register dump 
and a stack trace.

mac_debug_handler() is dead code. Remove it along with its static data.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Index: linux/arch/m68k/mac/macints.c
===================================================================
--- linux.orig/arch/m68k/mac/macints.c	2016-12-12 10:01:30.000000000 +1100
+++ linux/arch/m68k/mac/macints.c	2016-12-12 10:14:19.000000000 +1100
@@ -127,12 +127,9 @@
 
 #define SHUTUP_SONIC
 
-/*
- * console_loglevel determines NMI handler function
- */
+extern void show_registers(struct pt_regs *);
 
 irqreturn_t mac_nmi_handler(int, void *);
-irqreturn_t mac_debug_handler(int, void *);
 
 /* #define DEBUG_MACINTS */
 
@@ -276,65 +273,17 @@ static void mac_irq_shutdown(struct irq_
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
