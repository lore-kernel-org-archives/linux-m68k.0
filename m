From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 02/22] m68k/mac: macints - Modernize printing of kernel messages
Date: Wed,  7 Dec 2016 16:09:00 +0100
Message-ID: <1481123360-10978-3-git-send-email-geert__11895.151079125$1481123802$gmane$org@linux-m68k.org>
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
  - Add missing continuations, to fix user-visible breakage.

Fixes: 4bcc595ccd80decb ("printk: reinstate KERN_CONT for printing continuation lines")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/mac/macints.c | 42 ++++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/arch/m68k/mac/macints.c b/arch/m68k/mac/macints.c
index 9f98c08719010e27..8572290cb93b6679 100644
--- a/arch/m68k/mac/macints.c
+++ b/arch/m68k/mac/macints.c
@@ -135,6 +135,11 @@
 irqreturn_t mac_debug_handler(int, void *);
 
 /* #define DEBUG_MACINTS */
+#ifdef DEBUG_MACINTS
+#define pr_irq(fmt, ...) printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
+#else
+#define pr_irq(fmt, ...) no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
+#endif
 
 static unsigned int mac_irq_startup(struct irq_data *);
 static void mac_irq_shutdown(struct irq_data *);
@@ -149,20 +154,18 @@
 
 void __init mac_init_IRQ(void)
 {
-#ifdef DEBUG_MACINTS
-	printk("mac_init_IRQ(): Setting things up...\n");
-#endif
+	pr_irq("mac_init_IRQ(): Setting things up...\n");
 	m68k_setup_irq_controller(&mac_irq_chip, handle_simple_irq, IRQ_USER,
 				  NUM_MAC_SOURCES - IRQ_USER);
 	/* Make sure the SONIC interrupt is cleared or things get ugly */
 #ifdef SHUTUP_SONIC
-	printk("Killing onboard sonic... ");
+	pr_info("Killing onboard sonic... ");
 	/* This address should hopefully be mapped already */
 	if (hwreg_present((void*)(0x50f0a000))) {
 		*(long *)(0x50f0a014) = 0x7fffL;
 		*(long *)(0x50f0a010) = 0L;
 	}
-	printk("Done.\n");
+	pr_cont("Done.\n");
 #endif /* SHUTUP_SONIC */
 
 	/*
@@ -182,9 +185,7 @@ void __init mac_init_IRQ(void)
 	if (request_irq(IRQ_AUTO_7, mac_nmi_handler, 0, "NMI",
 			mac_nmi_handler))
 		pr_err("Couldn't register NMI\n");
-#ifdef DEBUG_MACINTS
-	printk("mac_init_IRQ(): Done!\n");
-#endif
+	pr_irq("mac_init_IRQ(): Done!\n");
 }
 
 /*
@@ -281,7 +282,7 @@ static void mac_irq_shutdown(struct irq_data *data)
 irqreturn_t mac_debug_handler(int irq, void *dev_id)
 {
 	if (num_debug[irq] < 10) {
-		printk("DEBUG: Unexpected IRQ %d\n", irq);
+		pr_info("DEBUG: Unexpected IRQ %d\n", irq);
 		num_debug[irq]++;
 	}
 	return IRQ_HANDLED;
@@ -304,9 +305,9 @@ irqreturn_t mac_nmi_handler(int irq, void *dev_id)
 
 	if (in_nmi == 1) {
 		nmi_hold = 1;
-		printk("... pausing, press NMI to resume ...");
+		pr_info("... pausing, press NMI to resume ...");
 	} else {
-		printk(" ok!\n");
+		pr_cont(" ok!\n");
 		nmi_hold = 0;
 	}
 
@@ -319,20 +320,21 @@ irqreturn_t mac_nmi_handler(int irq, void *dev_id)
 #if 0
 		struct pt_regs *fp = get_irq_regs();
 		show_state();
-		printk("PC: %08lx\nSR: %04x  SP: %p\n", fp->pc, fp->sr, fp);
-		printk("d0: %08lx    d1: %08lx    d2: %08lx    d3: %08lx\n",
-		       fp->d0, fp->d1, fp->d2, fp->d3);
-		printk("d4: %08lx    d5: %08lx    a0: %08lx    a1: %08lx\n",
-		       fp->d4, fp->d5, fp->a0, fp->a1);
+		pr_info("PC: %08lx\nSR: %04x  SP: %p\n", fp->pc, fp->sr, fp);
+		pr_info("d0: %08lx    d1: %08lx    d2: %08lx    d3: %08lx\n",
+			fp->d0, fp->d1, fp->d2, fp->d3);
+		pr_info("d4: %08lx    d5: %08lx    a0: %08lx    a1: %08lx\n",
+			fp->d4, fp->d5, fp->a0, fp->a1);
 
 		if (STACK_MAGIC != *(unsigned long *)current->kernel_stack_page)
-			printk("Corrupted stack page\n");
-		printk("Process %s (pid: %d, stackpage=%08lx)\n",
-			current->comm, current->pid, current->kernel_stack_page);
+			pr_info("Corrupted stack page\n");
+		pr_info("Process %s (pid: %d, stackpage=%08lx)\n",
+			current->comm, current->pid,
+			current->kernel_stack_page);
 		if (intr_count == 1)
 			dump_stack((struct frame *)fp);
 #else
-		/* printk("NMI "); */
+		/* pr_info("NMI "); */
 #endif
 	}
 	in_nmi--;
-- 
1.9.1
