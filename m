From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/mac: Kill psc_present
Date: Fri,  6 Nov 2015 12:20:33 +0100
Message-ID: <1446808833-25458-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

The presence of the Apple Peripheral System Controller (PSC) can be
tested for by just checking its base address pointer.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/mac_psc.h | 1 -
 arch/m68k/mac/macints.c         | 6 +++---
 arch/m68k/mac/psc.c             | 7 +++----
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/include/asm/mac_psc.h b/arch/m68k/include/asm/mac_psc.h
index e5c0d71d154324bf..923305117a69ad5b 100644
--- a/arch/m68k/include/asm/mac_psc.h
+++ b/arch/m68k/include/asm/mac_psc.h
@@ -209,7 +209,6 @@
 #ifndef __ASSEMBLY__
 
 extern volatile __u8 *psc;
-extern int psc_present;
 
 extern void psc_register_interrupts(void);
 extern void psc_irq_enable(int);
diff --git a/arch/m68k/mac/macints.c b/arch/m68k/mac/macints.c
index da42c1885cb0b932..8b9dda28e0d07b4d 100644
--- a/arch/m68k/mac/macints.c
+++ b/arch/m68k/mac/macints.c
@@ -174,7 +174,7 @@ void __init mac_init_IRQ(void)
 		oss_register_interrupts();
 	else
 		via_register_interrupts();
-	if (psc_present)
+	if (psc)
 		psc_register_interrupts();
 	if (baboon_present)
 		baboon_register_interrupts();
@@ -211,7 +211,7 @@ void mac_irq_enable(struct irq_data *data)
 	case 4:
 	case 5:
 	case 6:
-		if (psc_present)
+		if (psc)
 			psc_irq_enable(irq);
 		else if (oss_present)
 			oss_irq_enable(irq);
@@ -241,7 +241,7 @@ void mac_irq_disable(struct irq_data *data)
 	case 4:
 	case 5:
 	case 6:
-		if (psc_present)
+		if (psc)
 			psc_irq_disable(irq);
 		else if (oss_present)
 			oss_irq_disable(irq);
diff --git a/arch/m68k/mac/psc.c b/arch/m68k/mac/psc.c
index 2290c0cae48beb8a..cb2b1a3a2b62d97f 100644
--- a/arch/m68k/mac/psc.c
+++ b/arch/m68k/mac/psc.c
@@ -27,7 +27,6 @@
 
 #define DEBUG_PSC
 
-int psc_present;
 volatile __u8 *psc;
 EXPORT_SYMBOL_GPL(psc);
 
@@ -39,7 +38,9 @@ static void psc_debug_dump(void)
 {
 	int	i;
 
-	if (!psc_present) return;
+	if (!psc)
+		return;
+
 	for (i = 0x30 ; i < 0x70 ; i += 0x10) {
 		printk("PSC #%d:  IFR = 0x%02X IER = 0x%02X\n",
 			i >> 4,
@@ -81,7 +82,6 @@ void __init psc_init(void)
 	 && macintosh_config->ident != MAC_MODEL_Q840)
 	{
 		psc = NULL;
-		psc_present = 0;
 		return;
 	}
 
@@ -91,7 +91,6 @@ void __init psc_init(void)
 	 */
 
 	psc = (void *) PSC_BASE;
-	psc_present = 1;
 
 	printk("PSC detected at %p\n", psc);
 
-- 
1.9.1
