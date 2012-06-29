From: <gerg@snapgear.com>
Subject: [PATCH 3/3] m68knommu: platform support for 8390 based ethernet used on some boards
Date: Fri, 29 Jun 2012 10:09:24 +1000
Message-ID: <1340928564-12116-4-git-send-email-gerg@snapgear.com>
References: <1340928564-12116-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:31882 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752786Ab2F2AJW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 28 Jun 2012 20:09:22 -0400
In-Reply-To: <1340928564-12116-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Quite a few of Freescale's older ColdFire development boards used an NS8390
based ethernet interface. Add a platform definition for the resources used
by these devices so we can use it on these boards.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/Makefile  |    1 +
 arch/m68k/platform/coldfire/mcf8390.c |   38 +++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 arch/m68k/platform/coldfire/mcf8390.c

diff --git a/arch/m68k/platform/coldfire/Makefile b/arch/m68k/platform/coldfire/Makefile
index 76d389d..e62de37 100644
--- a/arch/m68k/platform/coldfire/Makefile
+++ b/arch/m68k/platform/coldfire/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_M54xx)	+= m54xx.o sltimers.o intc-2.o
 obj-$(CONFIG_NETtel)	+= nettel.o
 obj-$(CONFIG_CLEOPATRA)	+= nettel.o
 obj-$(CONFIG_FIREBEE)	+= firebee.o
+obj-$(CONFIG_MCF8390)	+= mcf8390.o
 
 obj-y			+= pinmux.o gpio.o
 extra-y := head.o
diff --git a/arch/m68k/platform/coldfire/mcf8390.c b/arch/m68k/platform/coldfire/mcf8390.c
new file mode 100644
index 0000000..23a6874
--- /dev/null
+++ b/arch/m68k/platform/coldfire/mcf8390.c
@@ -0,0 +1,38 @@
+/*
+ * mcf8390.c  -- platform support for 8390 ethernet on many boards
+ *
+ * (C) Copyright 2012, Greg Ungerer <gerg@uclinux.org>
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file COPYING in the main directory of this archive
+ * for more details.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/resource.h>
+#include <linux/platform_device.h>
+#include <asm/mcf8390.h>
+
+static struct resource mcf8390_resources[] = {
+	{
+		.start	= NE2000_ADDR,
+		.end	= NE2000_ADDR + NE2000_ADDRSIZE - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	{
+		.start	= NE2000_IRQ_VECTOR,
+		.end	= NE2000_IRQ_VECTOR,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+static int __init mcf8390_platform_init(void)
+{
+	platform_device_register_simple("mcf8390", -1, mcf8390_resources,
+		ARRAY_SIZE(mcf8390_resources));
+	return 0;
+}
+
+arch_initcall(mcf8390_platform_init);
-- 
1.7.0.4
