From: sfking@fdwdc.com
Subject: [PATCH 06/13] generic GPIO support for the Freescale
	Coldfire 5249.
Date: Fri, 19 Jun 2009 18:11:05 -0700
Message-ID: <1245460272-4329-7-git-send-email-sfking@fdwdc.com>
References: <1245460272-4329-1-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-2-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-3-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-4-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-5-git-send-email-sfking@fdwdc.com>
	<1245460272-4329-6-git-send-email-sfking@fdwdc.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <1245460272-4329-6-git-send-email-sfking@fdwdc.com>
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

Add support for the 5249.

Signed-off-by: Steven King <sfking@fdwdc.com>
---
 arch/m68k/include/asm/m5249sim.h      |   23 +++++++-----
 arch/m68knommu/platform/5249/Makefile |    2 +-
 arch/m68knommu/platform/5249/gpio.c   |   65 +++++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+), 10 deletions(-)
 create mode 100644 arch/m68knommu/platform/5249/gpio.c

diff --git a/arch/m68k/include/asm/m5249sim.h b/arch/m68k/include/asm/m5249sim.h
index 366eb86..2c23a83 100644
--- a/arch/m68k/include/asm/m5249sim.h
+++ b/arch/m68k/include/asm/m5249sim.h
@@ -73,14 +73,14 @@
 /*
  *	General purpose IO registers (in MBAR2).
  */
-#define	MCFSIM2_GPIOREAD	0x0		/* GPIO read values */
-#define	MCFSIM2_GPIOWRITE	0x4		/* GPIO write values */
-#define	MCFSIM2_GPIOENABLE	0x8		/* GPIO enabled */
-#define	MCFSIM2_GPIOFUNC	0xc		/* GPIO function */
-#define	MCFSIM2_GPIO1READ	0xb0		/* GPIO1 read values */
-#define	MCFSIM2_GPIO1WRITE	0xb4		/* GPIO1 write values */
-#define	MCFSIM2_GPIO1ENABLE	0xb8		/* GPIO1 enabled */
-#define	MCFSIM2_GPIO1FUNC	0xbc		/* GPIO1 function */
+#define	MCFSIM2_GPIOREAD	(MCF_MBAR2 + 0x000)	/* GPIO read values */
+#define	MCFSIM2_GPIOWRITE	(MCF_MBAR2 + 0x004)	/* GPIO write values */
+#define	MCFSIM2_GPIOENABLE	(MCF_MBAR2 + 0x008)	/* GPIO enabled */
+#define	MCFSIM2_GPIOFUNC	(MCF_MBAR2 + 0x00C)	/* GPIO function */
+#define	MCFSIM2_GPIO1READ	(MCF_MBAR2 + 0x0B0)	/* GPIO1 read values */
+#define	MCFSIM2_GPIO1WRITE	(MCF_MBAR2 + 0x0B4)	/* GPIO1 write values */
+#define	MCFSIM2_GPIO1ENABLE	(MCF_MBAR2 + 0x0B8)	/* GPIO1 enabled */
+#define	MCFSIM2_GPIO1FUNC	(MCF_MBAR2 + 0x0BC)	/* GPIO1 function */
 
 #define	MCFSIM2_GPIOINTSTAT	0xc0		/* GPIO interrupt status */
 #define	MCFSIM2_GPIOINTCLEAR	0xc0		/* GPIO interrupt clear */
@@ -100,7 +100,12 @@
 #define	MCFSIM2_IDECONFIG1	0x18c		/* IDEconfig1 */
 #define	MCFSIM2_IDECONFIG2	0x190		/* IDEconfig2 */
 
-
+/*
+ * Generic GPIO support
+ */
+#define MCFGPIO_PIN_MAX		64
+#define MCFGPIO_IRQ_MAX		-1
+#define MCFGPIO_IRQ_VECBASE	-1
 /*
  *	Macro to set IMR register. It is 32 bits on the 5249.
  */
diff --git a/arch/m68knommu/platform/5249/Makefile b/arch/m68knommu/platform/5249/Makefile
index a439d9a..113c333 100644
--- a/arch/m68knommu/platform/5249/Makefile
+++ b/arch/m68knommu/platform/5249/Makefile
@@ -14,5 +14,5 @@
 
 asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
 
-obj-y := config.o
+obj-y := config.o gpio.o
 
diff --git a/arch/m68knommu/platform/5249/gpio.c b/arch/m68knommu/platform/5249/gpio.c
new file mode 100644
index 0000000..69e7866
--- /dev/null
+++ b/arch/m68knommu/platform/5249/gpio.c
@@ -0,0 +1,65 @@
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
+			.label			= "GPIO0",
+			.request		= mcf_gpio_request,
+			.free			= mcf_gpio_free,
+			.direction_input	= mcf_gpio_direction_input,
+			.direction_output	= mcf_gpio_direction_output,
+			.get			= mcf_gpio_get_value,
+			.set			= mcf_gpio_set_value,
+			.ngpio			= 32,
+		},
+		.pddr				= MCFSIM2_GPIOENABLE,
+		.podr				= MCFSIM2_GPIOWRITE,
+		.ppdr				= MCFSIM2_GPIOREAD,
+	},
+	{
+		.gpio_chip			= {
+			.label			= "GPIO1",
+			.request		= mcf_gpio_request,
+			.free			= mcf_gpio_free,
+			.direction_input	= mcf_gpio_direction_input,
+			.direction_output	= mcf_gpio_direction_output,
+			.get			= mcf_gpio_get_value,
+			.set			= mcf_gpio_set_value,
+			.base			= 32,
+			.ngpio			= 32,
+		},
+		.pddr				= MCFSIM2_GPIO1ENABLE,
+		.podr				= MCFSIM2_GPIO1WRITE,
+		.ppdr				= MCFSIM2_GPIO1READ,
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
