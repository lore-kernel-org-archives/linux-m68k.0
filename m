From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 10/14] m68k/atari: EtherNAT - add interrupt chip for Ethernet and USB interrupts
Date: Mon, 25 Mar 2013 14:16:28 +1300
Message-ID: <1364174192-25406-11-git-send-email-schmitz@debian.org>
References: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-da0-f52.google.com ([209.85.210.52]:38601 "EHLO
	mail-da0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756527Ab3CYBRA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Mar 2013 21:17:00 -0400
Received: by mail-da0-f52.google.com with SMTP id f10so2987621dak.11
        for <linux-m68k@vger.kernel.org>; Sun, 24 Mar 2013 18:17:00 -0700 (PDT)
In-Reply-To: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org, Michael Schmitz <schmitz@debian.org>

Add a dedicated interrupt chip definition for the EtherNAT CPLD interrupts.
SMC91C111 and ISP1160 chips have separate interrupts that can be enabled
and disabled in a CPLD register at offset 0x23 from the card base.

The smc91x and isp116x-hcd drivers will use this feature.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/atari/ataints.c |   68 +++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 68 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/atari/ataints.c b/arch/m68k/atari/ataints.c
index 2cf7349..525e641 100644
--- a/arch/m68k/atari/ataints.c
+++ b/arch/m68k/atari/ataints.c
@@ -49,6 +49,7 @@
 #include <asm/atari_stdma.h>
 #include <asm/irq.h>
 #include <asm/entry.h>
+#include <asm/io.h>
 
 
 /*
@@ -177,6 +178,66 @@ static struct irq_chip atari_mfptimer_chip = {
 	.irq_disable	= atari_mfptimer_disable,
 };
 
+
+/*
+ * EtherNAT CPLD interrupt handling
+ * CPLD interrupt register is at phys. 0x80000023
+ * Need this mapped in at interrupt startup time
+ */
+
+static unsigned char *enat_cpld;
+
+static unsigned int atari_ethernat_startup(struct irq_data *data)
+{
+	int enat_num = 140 - data->irq + 1;
+
+	m68k_irq_startup(data);
+	/*
+	* map CPLD interrupt register
+	*/
+	if (!enat_cpld)
+		enat_cpld = (unsigned char *)ioremap((ATARI_ETHERNAT_PHYS_ADDR+0x23), 0x2);
+	/*
+	 * do _not_ enable the USB chip interrupt here - causes interrupt storm
+	 * and triggers dead interrupt watchdog
+	 * Need to reset the USB chip to a sane state in early startup before removing this hack
+	 */
+	if (enat_num == 1)
+		*enat_cpld |= 1 << enat_num;
+
+	return 0;
+}
+
+static void atari_ethernat_enable(struct irq_data *data)
+{
+	int enat_num = 140 - data->irq + 1;
+	*enat_cpld |= 1 << enat_num;
+}
+
+static void atari_ethernat_disable(struct irq_data *data)
+{
+	int enat_num = 140 - data->irq + 1;
+	*enat_cpld &= ~(1 << enat_num);
+}
+
+static void atari_ethernat_shutdown(struct irq_data *data)
+{
+	int enat_num = 140 - data->irq + 1;
+	if (enat_cpld) {
+		*enat_cpld &= ~(1 << enat_num);
+		iounmap(enat_cpld);
+		enat_cpld = NULL;
+	}
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
@@ -268,6 +329,13 @@ void __init atari_init_IRQ(void)
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
