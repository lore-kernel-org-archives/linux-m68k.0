From: sfking@fdwdc.com
Subject: [PATCH 10/13] generic GPIO support for the Freescale
	Coldfire 5307.
Date: Fri, 19 Jun 2009 18:11:09 -0700
Message-ID: <1245460272-4329-11-git-send-email-sfking@fdwdc.com>
References: <1245460272-4329-1-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-2-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-3-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-4-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-5-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-6-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-7-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-8-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-9-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-10-git-send-email-sfking@fdwdc.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <1245460272-4329-10-git-send-email-sfking@fdwdc.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: linux-kernel@vger.kernel.org
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
List-Id: linux-m68k@vger.kernel.org

Add support for the 5307.

Signed-off-by: Steven King <sfking@fdwdc.com>
---
 arch/m68k/include/asm/m5307sim.h      |   11 ++++++-
 arch/m68knommu/platform/5307/Makefile |    2 +-
 arch/m68knommu/platform/5307/gpio.c   |   49 +++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 3 deletions(-)
 create mode 100644 arch/m68knommu/platform/5307/gpio.c

diff --git a/arch/m68k/include/asm/m5307sim.h b/arch/m68k/include/asm/m5307sim.h
index 5886728..6a1870c 100644
--- a/arch/m68k/include/asm/m5307sim.h
+++ b/arch/m68k/include/asm/m5307sim.h
@@ -90,8 +90,15 @@
 #define MCFSIM_DACR1		0x110		/* DRAM 1 Addr and Ctrl (r/w) */
 #define MCFSIM_DMR1		0x114		/* DRAM 1 Mask reg (r/w) */
 
-#define	MCFSIM_PADDR		0x244		/* Parallel Direction (r/w) */
-#define	MCFSIM_PADAT		0x248		/* Parallel Data (r/w) */
+#define	MCFSIM_PADDR		(MCF_MBAR + 0x244)
+#define	MCFSIM_PADAT		(MCF_MBAR + 0x248)
+
+/*
+ * Generic GPIO support
+ */
+#define MCFGPIO_PIN_MAX			16
+#define MCFGPIO_IRQ_MAX			-1
+#define MCFGPIO_IRQ_VECBASE		-1
 
 
 /* Definition offset address for CS2-7  -- old mask 5307 */
diff --git a/arch/m68knommu/platform/5307/Makefile b/arch/m68knommu/platform/5307/Makefile
index cfd5868..667db65 100644
--- a/arch/m68knommu/platform/5307/Makefile
+++ b/arch/m68knommu/platform/5307/Makefile
@@ -14,5 +14,5 @@
 
 asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
 
-obj-y	+= config.o
+obj-y	+= config.o gpio.o
 
diff --git a/arch/m68knommu/platform/5307/gpio.c b/arch/m68knommu/platform/5307/gpio.c
new file mode 100644
index 0000000..7511068
--- /dev/null
+++ b/arch/m68knommu/platform/5307/gpio.c
@@ -0,0 +1,49 @@
+/*
+ * Coldfire generic GPIO support
+ *
+ * (C) Copyright 2009, Steven King <sfking@fdwdc.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+*/
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+
+#include <asm/coldfire.h>
+#include <asm/mcfsim.h>
+#include <asm/mcfgpio.h>
+ 
+static struct mcf_gpio_chip mcf_gpio_chips[] = {
+	{
+		.gpio_chip			= {
+			.label			= "PP",
+			.request		= mcf_gpio_request,
+			.free			= mcf_gpio_free,
+			.direction_input	= mcf_gpio_direction_input,
+			.direction_output	= mcf_gpio_direction_output,
+			.get			= mcf_gpio_get_value,
+			.set			= mcf_gpio_set_value,
+			.ngpio			= 16,
+		},
+		.pddr				= MCFSIM_PADDR,
+		.podr				= MCFSIM_PADAT,
+		.ppdr				= MCFSIM_PADAT,
+	},
+};
+
+static int __init mcf_gpio_init(void)
+{
+	unsigned i = 0;
+	while (i < ARRAY_SIZE(mcf_gpio_chips))
+		(void)gpiochip_add((struct gpio_chip *)&mcf_gpio_chips[i++]);
+	return 0;
+}
+
+core_initcall(mcf_gpio_init);
-- 
1.5.6.5

_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
