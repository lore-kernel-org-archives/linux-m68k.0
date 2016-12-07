From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 14/22] m68k/q40: Modernize printing of kernel messages
Date: Wed,  7 Dec 2016 16:09:12 +0100
Message-ID: <1481123360-10978-15-git-send-email-geert@linux-m68k.org>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

  - Convert from printk() to pr_*(),
  - Use TABs for indentation while at it.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/q40/config.c  | 14 +++++++-------
 arch/m68k/q40/q40ints.c | 15 +++++++++------
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/arch/m68k/q40/config.c b/arch/m68k/q40/config.c
index ea89a24f46000e4f..71c0867ecf20f201 100644
--- a/arch/m68k/q40/config.c
+++ b/arch/m68k/q40/config.c
@@ -84,7 +84,7 @@ static int __init q40_debug_setup(char *arg)
 {
 	/* useful for early debugging stages - writes kernel messages into SRAM */
 	if (MACH_IS_Q40 && !strncmp(arg, "mem", 3)) {
-		/*printk("using NVRAM debug, q40_mem_cptr=%p\n",q40_mem_cptr);*/
+		/*pr_info("using NVRAM debug, q40_mem_cptr=%p\n",q40_mem_cptr);*/
 		_cpleft = 2000 - ((long)q40_mem_cptr-0xff020000) / 4;
 		register_console(&q40_console_driver);
 	}
@@ -124,8 +124,8 @@ static void q40_heartbeat(int on)
 
 static void q40_reset(void)
 {
-        halted = 1;
-        printk("\n\n*******************************************\n"
+	halted = 1;
+	pr_info("*******************************************\n"
 		"Called q40_reset : press the RESET button!!\n"
 		"*******************************************\n");
 	Q40_LED_ON();
@@ -135,10 +135,10 @@ static void q40_reset(void)
 
 static void q40_halt(void)
 {
-        halted = 1;
-        printk("\n\n*******************\n"
-		   "  Called q40_halt\n"
-		   "*******************\n");
+	halted = 1;
+	pr_info("*******************\n"
+		"  Called q40_halt\n"
+		"*******************\n");
 	Q40_LED_ON();
 	while (1)
 		;
diff --git a/arch/m68k/q40/q40ints.c b/arch/m68k/q40/q40ints.c
index 513f9bb17b9cffe6..3e7603202977e715 100644
--- a/arch/m68k/q40/q40ints.c
+++ b/arch/m68k/q40/q40ints.c
@@ -48,7 +48,8 @@ static unsigned int q40_irq_startup(struct irq_data *data)
 	switch (irq) {
 	case 1: case 2: case 8: case 9:
 	case 11: case 12: case 13:
-		printk("%s: ISA IRQ %d not implemented by HW\n", __func__, irq);
+		pr_warn("%s: ISA IRQ %d not implemented by HW\n", __func__,
+			irq);
 		/* FIXME return -ENXIO; */
 	}
 	return 0;
@@ -250,7 +251,7 @@ static void q40_irq_handler(unsigned int irq, struct pt_regs *fp)
 					disable_irq(irq);
 					disabled = 1;
 #else
-					/*printk("IRQ_INPROGRESS detected for irq %d, disabling - %s disabled\n",
+					/*pr_warn("IRQ_INPROGRESS detected for irq %d, disabling - %s disabled\n",
 						irq, disabled ? "already" : "not yet"); */
 					fp->sr = (((fp->sr) & (~0x700))+0x200);
 					disabled = 1;
@@ -273,7 +274,7 @@ static void q40_irq_handler(unsigned int irq, struct pt_regs *fp)
 					}
 #else
 					disabled = 0;
-					/*printk("reenabling irq %d\n", irq); */
+					/*pr_info("reenabling irq %d\n", irq); */
 #endif
 				}
 // used to do 'goto repeat;' here, this delayed bh processing too long
@@ -281,7 +282,8 @@ static void q40_irq_handler(unsigned int irq, struct pt_regs *fp)
 			}
 		}
 		if (mer && ccleirq > 0 && !aliased_irq) {
-			printk("ISA interrupt from unknown source? EIRQ_REG = %x\n",mer);
+			pr_warn("ISA interrupt from unknown source? EIRQ_REG = %x\n",
+				mer);
 			ccleirq--;
 		}
 	}
@@ -301,7 +303,7 @@ void q40_irq_enable(struct irq_data *data)
 	if (irq >= 5 && irq <= 15) {
 		mext_disabled--;
 		if (mext_disabled > 0)
-			printk("q40_irq_enable : nested disable/enable\n");
+			pr_warn("q40_irq_enable : nested disable/enable\n");
 		if (mext_disabled == 0)
 			master_outb(1, EXT_ENABLE_REG);
 	}
@@ -321,6 +323,7 @@ void q40_irq_disable(struct irq_data *data)
 		master_outb(0, EXT_ENABLE_REG);
 		mext_disabled++;
 		if (mext_disabled > 1)
-			printk("disable_irq nesting count %d\n",mext_disabled);
+			pr_info("disable_irq nesting count %d\n",
+				mext_disabled);
 	}
 }
-- 
1.9.1
