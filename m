From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 11/17] [m68k] Atari: add interrupt chip definition for EtherNAT CPLD interrupts (ethernet and USB)
Date: Thu, 31 Jan 2013 13:27:53 +1300 (NZDT)
Message-ID: <20130131002753.D0C79360095@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:54940 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751760Ab3AaA2A (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Jan 2013 19:28:00 -0500
Received: by mail-pa0-f48.google.com with SMTP id fa1so1400580pad.7
        for <linux-m68k@vger.kernel.org>; Wed, 30 Jan 2013 16:27:59 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

[PATCH 11/17] [m68k] Atari: add interrupt chip definition for EtherNAT CPLD interrupts (ethernet and USB)

Add a dedicated interrupt chip definition for the EtherNAT CPLD interrupts. SMC91C111 and
ISP1160 chips have separate interrupts that can be enabled and disabled in a CPLD register
at offset 0x23 from the card base.

The smc91x and isp116x-hcd drivers will use this feature.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/atari/ataints.c |   81 +++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 81 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/atari/ataints.c b/arch/m68k/atari/ataints.c
index 42b916f..da40ab1 100644
--- a/arch/m68k/atari/ataints.c
+++ b/arch/m68k/atari/ataints.c
@@ -49,6 +49,7 @@
 #include <asm/atari_stdma.h>
 #include <asm/irq.h>
 #include <asm/entry.h>
+#include <asm/io.h>
 
 
 /*
@@ -177,6 +178,74 @@ static struct irq_chip atari_mfptimer_chip = {
 	.irq_disable	= atari_mfptimer_disable,
 };
 
+
+/*
+ * EtherNAT CPLD interrupt handling
+ * CPLD interrupt register is at phys. 0x80000023
+ * Need this mapped in at interrupt startup time
+ */
+
+#define ATARI_ETHERNAT_PHYS_ADDR	0x80000000
+unsigned char *enat_cpld;
+
+static unsigned int atari_ethernat_startup(struct irq_data *data)
+{
+	int enat_num = 140 - data->irq + 1;
+
+	m68k_irq_startup(data);
+	/*
+	* map and probe CPLD interrupt register
+	* - note we don't need to probe here; already done in config.c
+	*/
+	enat_cpld = (unsigned char *)ioremap((ATARI_ETHERNAT_PHYS_ADDR+0x23), 0x2);
+	/*
+	 * do _not_ enable the USB chip interrupt here - causes interrupt storm
+	 * and triggers dead interrupt watchdog
+	 * Need to reset the USB chip to a sane state in early startup before removing this hack
+	 */
+	if (enat_num == 1)
+		*enat_cpld |= 1 << enat_num;
+	/*
+	 * debug printk will go away once driver is debugged
+	 */
+	/* barrier();
+	printk(KERN_INFO "atari_ethernat_startup: cpld io %p mask %x\n", enat_cpld, *enat_cpld); */
+	return 0;
+}
+
+static void atari_ethernat_enable(struct irq_data *data)
+{
+	int enat_num = 140 - data->irq + 1;
+	*enat_cpld |= 1 << enat_num;
+	/* barrier();
+	printk(KERN_INFO "atari_ethernat_enable: irq %d num %d mask %x\n", data->irq, enat_num, *enat_cpld); */
+}
+
+static void atari_ethernat_disable(struct irq_data *data)
+{
+	int enat_num = 140 - data->irq + 1;
+	*enat_cpld &= ~(1 << enat_num);
+	/* barrier();
+	printk(KERN_INFO "atari_ethernat_disable: irq %d num %d mask %x\n", data->irq, enat_num, *enat_cpld); */
+}
+
+static void atari_ethernat_shutdown(struct irq_data *data)
+{
+	int enat_num = 140 - data->irq + 1;
+	*enat_cpld &= ~(1 << enat_num);
+	/* barrier();
+	printk(KERN_INFO "atari_ethernat_shutdown: irq %d num %d mask %x\n", data->irq, enat_num, *enat_cpld); */
+	iounmap(enat_cpld);
+}
+
+static struct irq_chip atari_ethernat_chip = {
+	.name		= "ethernat",
+	.irq_startup	= atari_ethernat_startup,
+	.irq_shutdown	= atari_ethernat_shutdown,
+	.irq_enable	= atari_ethernat_enable,
+	.irq_disable	= atari_ethernat_disable,
+};
+
 /*
  * void atari_init_IRQ (void)
  *
@@ -255,6 +324,11 @@ void __init atari_init_IRQ(void)
 	sound_ym.rd_data_reg_sel = 7;
 	sound_ym.wd_data = 0xff;
 
+	/*
+	 * EtherNEC / NetUSBee timer D multiplexer - need to use polled_irq
+	 * to avoid unhandled interrupts triggering dead interrupt watchdog
+	 */
+
 	m68k_setup_irq_controller(&atari_mfptimer_chip, handle_polled_irq,
 				  IRQ_MFP_TIMER1, 8);
 	/* possibly unneeded */
@@ -274,6 +348,13 @@ void __init atari_init_IRQ(void)
 	if (request_irq(IRQ_MFP_TIMD, mfptimer_handler, IRQF_SHARED,
 			stmfp_base.name, &stmfp_base))
 		pr_err("Couldn't register %s interrupt\n", stmfp_base.name);
+
+	/*
+	 * EtherNAT ethernet / USB interrupt handlers
+	 */
+
+	m68k_setup_irq_controller(&atari_ethernat_chip, handle_simple_irq,
+				  139, 2);
 }
 
 
-- 
1.7.0.4
