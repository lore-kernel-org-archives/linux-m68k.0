From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: [PATCH/RFC 4/5] powerpc: Enable rtc-generic, and kill rtc-ppc
Date: Fri, 20 Feb 2009 16:46:48 +0100
Message-ID: <1235144809-32468-5-git-send-email-Geert.Uytterhoeven__26684.7934377894$1235144966$gmane$org@sonycom.com>
References: <1235144809-32468-1-git-send-email-Geert.Uytterhoeven@sonycom.com>
 <1235144809-32468-2-git-send-email-Geert.Uytterhoeven@sonycom.com>
 <1235144809-32468-3-git-send-email-Geert.Uytterhoeven@sonycom.com>
 <1235144809-32468-4-git-send-email-Geert.Uytterhoeven@sonycom.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1235144809-32468-4-git-send-email-Geert.Uytterhoeven@sonycom.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>
Cc: rtc-linux@googlegroups.com, Kyle McMartin <kyle@mcmartin.ca>, David Woodhouse <dwmw2@infradead.org>, Richard Zidlicky <rz@linux-m68k.org>, linux-parisc@vger.kernel.org, linuxppc-dev@ozlabs.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>

Create the "rtc-generic" platform device if ppc_md.get_rtc_time is set.
Kill rtc-ppc, as rtc-generic offers the same functionality in a more ge=
neric
way.

Signed-off-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
---
 arch/powerpc/Kconfig       |    4 ++
 arch/powerpc/kernel/time.c |   22 ++++++++++++++
 drivers/rtc/Kconfig        |    8 -----
 drivers/rtc/Makefile       |    1 -
 drivers/rtc/rtc-ppc.c      |   69 ------------------------------------=
--------
 5 files changed, 26 insertions(+), 78 deletions(-)
 delete mode 100644 drivers/rtc/rtc-ppc.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 40b7981..82e47b0 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -85,6 +85,10 @@ config ARCH_HAS_ILOG2_U64
 	bool
 	default y if 64BIT
=20
+config ARCH_HAS_GENERIC_RTC
+	bool
+	default y
+
 config GENERIC_HWEIGHT
 	bool
 	default y
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index c956403..616c7d3 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -1127,3 +1127,25 @@ void div128_by_32(u64 dividend_high, u64 dividen=
d_low,
 	dr->result_low  =3D ((u64)y << 32) + z;
=20
 }
+
+static struct platform_device rtc_generic_dev =3D {
+	.name =3D "rtc-generic",
+	.id =3D -1,
+};
+
+static int __init rtc_init(void)
+{
+	int ret;
+
+	if (!ppc_md.get_rtc_time)
+		return -ENODEV;
+
+	ret =3D platform_device_register(&rtc_generic_dev);
+	if (ret < 0)
+		pr_err("Unable to register rtc device...\n");
+
+	/* not necessarily an error */
+	return 0;
+}
+
+module_init(rtc_init);
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 3e58182..9964a72 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -685,14 +685,6 @@ config RTC_DRV_GENERIC
 	  RTC abstraction. If you do not know what you are doing, you should
 	  just say Y.
=20
-config RTC_DRV_PPC
-       tristate "PowerPC machine dependent RTC support"
-       depends on PPC
-       help
-	 The PowerPC kernel has machine-specific functions for accessing
-	 the RTC. This exposes that functionality through the generic RTC
-	 class.
-
 config RTC_DRV_PXA
        tristate "PXA27x/PXA3xx"
        depends on ARCH_PXA
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 9c18a01..bd209a5 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -56,7 +56,6 @@ obj-$(CONFIG_RTC_DRV_PCF8583)	+=3D rtc-pcf8583.o
 obj-$(CONFIG_RTC_DRV_PL030)	+=3D rtc-pl030.o
 obj-$(CONFIG_RTC_DRV_PL031)	+=3D rtc-pl031.o
 obj-$(CONFIG_RTC_DRV_GENERIC)	+=3D rtc-generic.o
-obj-$(CONFIG_RTC_DRV_PPC)	+=3D rtc-ppc.o
 obj-$(CONFIG_RTC_DRV_PXA)	+=3D rtc-pxa.o
 obj-$(CONFIG_RTC_DRV_R9701)	+=3D rtc-r9701.o
 obj-$(CONFIG_RTC_DRV_RS5C313)	+=3D rtc-rs5c313.o
diff --git a/drivers/rtc/rtc-ppc.c b/drivers/rtc/rtc-ppc.c
deleted file mode 100644
index c8e97e2..0000000
--- a/drivers/rtc/rtc-ppc.c
+++ /dev/null
@@ -1,69 +0,0 @@
-/*
- * RTC driver for ppc_md RTC functions
- *
- * =C2=A9 2007 Red Hat, Inc.
- *
- * Author: David Woodhouse <dwmw2@infradead.org>
- *
- * This program is free software; you can redistribute it and/or modif=
y
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
-
-
-#include <linux/module.h>
-#include <linux/err.h>
-#include <linux/rtc.h>
-#include <linux/platform_device.h>
-#include <asm/machdep.h>
-
-static int ppc_rtc_read_time(struct device *dev, struct rtc_time *tm)
-{
-	ppc_md.get_rtc_time(tm);
-	return 0;
-}
-
-static int ppc_rtc_set_time(struct device *dev, struct rtc_time *tm)
-{
-	return ppc_md.set_rtc_time(tm);
-}
-
-static const struct rtc_class_ops ppc_rtc_ops =3D {
-	.set_time =3D ppc_rtc_set_time,
-	.read_time =3D ppc_rtc_read_time,
-};
-
-static struct rtc_device *rtc;
-static struct platform_device *ppc_rtc_pdev;
-
-static int __init ppc_rtc_init(void)
-{
-	if (!ppc_md.get_rtc_time || !ppc_md.set_rtc_time)
-		return -ENODEV;
-
-	ppc_rtc_pdev =3D platform_device_register_simple("ppc-rtc", 0, NULL, =
0);
-	if (IS_ERR(ppc_rtc_pdev))
-		return PTR_ERR(ppc_rtc_pdev);
-
-	rtc =3D rtc_device_register("ppc_md", &ppc_rtc_pdev->dev,
-				  &ppc_rtc_ops, THIS_MODULE);
-	if (IS_ERR(rtc)) {
-		platform_device_unregister(ppc_rtc_pdev);
-		return PTR_ERR(rtc);
-	}
-
-	return 0;
-}
-
-static void __exit ppc_rtc_exit(void)
-{
-	rtc_device_unregister(rtc);
-	platform_device_unregister(ppc_rtc_pdev);
-}
-
-module_init(ppc_rtc_init);
-module_exit(ppc_rtc_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
-MODULE_DESCRIPTION("Generic RTC class driver for PowerPC");
--=20
1.6.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
