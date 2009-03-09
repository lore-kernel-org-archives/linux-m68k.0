From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [rtc-linux] [PATCH 7/7] powerpc/ps3: Add rtc-ps3
Date: Mon, 9 Mar 2009 16:24:27 +0100 (CET)
Message-ID: <alpine.LRH.2.00.0903091622150.19484@vixen.sonytel.be>
References: <1236605183-22718-1-git-send-email-Geert.Uytterhoeven@sonycom.com> <1236605183-22718-2-git-send-email-Geert.Uytterhoeven@sonycom.com> <1236605183-22718-3-git-send-email-Geert.Uytterhoeven@sonycom.com> <1236605183-22718-4-git-send-email-Geert.Uytterhoeven@sonycom.com>
 <1236605183-22718-5-git-send-email-Geert.Uytterhoeven@sonycom.com> <1236605183-22718-6-git-send-email-Geert.Uytterhoeven@sonycom.com> <1236605183-22718-7-git-send-email-Geert.Uytterhoeven@sonycom.com> <1236605183-22718-8-git-send-email-Geert.Uytterhoeven@sonycom.com>
 <20090309151216.17f13862@i1501.lan.towertech.it>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vervifontaine.sonytel.be ([80.88.33.193]:38510 "EHLO
	vervifontaine.sonycom.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751182AbZCIPYa (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 9 Mar 2009 11:24:30 -0400
In-Reply-To: <20090309151216.17f13862@i1501.lan.towertech.it>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alessandro Zummo <alessandro.zummo@towertech.it>
Cc: rtc-linux@googlegroups.com, Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org, linuxppc-dev@ozlabs.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>, Dann Frazier <dannf@dannf.org>, Geoff Levand <geoffrey.levand@am.sony.com>

On Mon, 9 Mar 2009, Alessandro Zummo wrote:
> On Mon,  9 Mar 2009 14:26:23 +0100
> Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com> wrote:
> > +
> > +static int ps3_get_time(struct device *dev, struct rtc_time *tm)
> > +{
> > +	to_tm(read_rtc() + ps3_os_area_get_rtc_diff(), tm);
> > +	tm->tm_year -=3D 1900;
> > +	tm->tm_mon -=3D 1;
> > +	return 0;
> > +}
>=20
>  this should be return rtc_valid_tm() .

=46ixed.

>  can't you use functions from rtc-lib.c instead of=20
>  that to_tm ?

Ah, those pesky PPC-specific functions... switched to rtc_time_to_tm() =
and
rtc_tm_to_time().

> > +
> > +MODULE_AUTHOR("Sony Corporation");
>=20
>  real name, if possible and a contact address
>  here . Just in case I need someone to bother :)

All PS3-specific drivers have this. But there's an official PS3 platfor=
m
maintainer in MAINTAINERS.

=46rom 41020647c3e2b07e0302a905a926d6221061a128 Mon Sep 17 00:00:00 200=
1
=46rom: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Date: Tue, 24 Feb 2009 14:04:20 +0100
Subject: powerpc/ps3: Add rtc-ps3

Create a real RTC driver for PS3, and unhook the deprecated
ppc_md.[gs]et_rtc_time.

Signed-off-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Acked-by: Alessandro Zummo <a.zummo@towertech.it>
---
 arch/powerpc/include/asm/ps3.h        |    3 +
 arch/powerpc/platforms/ps3/os-area.c  |    2 +
 arch/powerpc/platforms/ps3/platform.h |    2 -
 arch/powerpc/platforms/ps3/setup.c    |    2 -
 arch/powerpc/platforms/ps3/time.c     |   26 ++++-----
 drivers/rtc/Kconfig                   |    9 +++
 drivers/rtc/Makefile                  |    1 +
 drivers/rtc/rtc-ps3.c                 |  104 +++++++++++++++++++++++++=
++++++++
 8 files changed, 131 insertions(+), 18 deletions(-)
 create mode 100644 drivers/rtc/rtc-ps3.c

diff --git a/arch/powerpc/include/asm/ps3.h b/arch/powerpc/include/asm/=
ps3.h
index 67f1812..cdb6fd8 100644
--- a/arch/powerpc/include/asm/ps3.h
+++ b/arch/powerpc/include/asm/ps3.h
@@ -50,6 +50,9 @@ enum ps3_param_av_multi_out {
=20
 enum ps3_param_av_multi_out ps3_os_area_get_av_multi_out(void);
=20
+extern u64 ps3_os_area_get_rtc_diff(void);
+extern void ps3_os_area_set_rtc_diff(u64 rtc_diff);
+
 /* dma routines */
=20
 enum ps3_dma_page_size {
diff --git a/arch/powerpc/platforms/ps3/os-area.c b/arch/powerpc/platfo=
rms/ps3/os-area.c
index e1c83c2..86e392b 100644
--- a/arch/powerpc/platforms/ps3/os-area.c
+++ b/arch/powerpc/platforms/ps3/os-area.c
@@ -808,6 +808,7 @@ u64 ps3_os_area_get_rtc_diff(void)
 {
 	return saved_params.rtc_diff;
 }
+EXPORT_SYMBOL(ps3_os_area_get_rtc_diff);
=20
 /**
  * ps3_os_area_set_rtc_diff - Set the rtc diff value.
@@ -823,6 +824,7 @@ void ps3_os_area_set_rtc_diff(u64 rtc_diff)
 		os_area_queue_work();
 	}
 }
+EXPORT_SYMBOL(ps3_os_area_set_rtc_diff);
=20
 /**
  * ps3_os_area_get_av_multi_out - Returns the default video mode.
diff --git a/arch/powerpc/platforms/ps3/platform.h b/arch/powerpc/platf=
orms/ps3/platform.h
index 235c13e..136aa06 100644
--- a/arch/powerpc/platforms/ps3/platform.h
+++ b/arch/powerpc/platforms/ps3/platform.h
@@ -64,8 +64,6 @@ int ps3_set_rtc_time(struct rtc_time *time);
=20
 void __init ps3_os_area_save_params(void);
 void __init ps3_os_area_init(void);
-u64 ps3_os_area_get_rtc_diff(void);
-void ps3_os_area_set_rtc_diff(u64 rtc_diff);
=20
 /* spu */
=20
diff --git a/arch/powerpc/platforms/ps3/setup.c b/arch/powerpc/platform=
s/ps3/setup.c
index 3331ccb..6618182 100644
--- a/arch/powerpc/platforms/ps3/setup.c
+++ b/arch/powerpc/platforms/ps3/setup.c
@@ -270,8 +270,6 @@ define_machine(ps3) {
 	.init_IRQ			=3D ps3_init_IRQ,
 	.panic				=3D ps3_panic,
 	.get_boot_time			=3D ps3_get_boot_time,
-	.set_rtc_time			=3D ps3_set_rtc_time,
-	.get_rtc_time			=3D ps3_get_rtc_time,
 	.set_dabr			=3D ps3_set_dabr,
 	.calibrate_decr			=3D ps3_calibrate_decr,
 	.progress			=3D ps3_progress,
diff --git a/arch/powerpc/platforms/ps3/time.c b/arch/powerpc/platforms=
/ps3/time.c
index d0daf7d..b178a1e 100644
--- a/arch/powerpc/platforms/ps3/time.c
+++ b/arch/powerpc/platforms/ps3/time.c
@@ -19,6 +19,7 @@
  */
=20
 #include <linux/kernel.h>
+#include <linux/platform_device.h>
=20
 #include <asm/rtc.h>
 #include <asm/lv1call.h>
@@ -74,23 +75,20 @@ static u64 read_rtc(void)
 	return rtc_val;
 }
=20
-int ps3_set_rtc_time(struct rtc_time *tm)
+unsigned long __init ps3_get_boot_time(void)
 {
-	u64 now =3D mktime(tm->tm_year + 1900, tm->tm_mon + 1, tm->tm_mday,
-		tm->tm_hour, tm->tm_min, tm->tm_sec);
-
-	ps3_os_area_set_rtc_diff(now - read_rtc());
-	return 0;
+	return read_rtc() + ps3_os_area_get_rtc_diff();
 }
=20
-void ps3_get_rtc_time(struct rtc_time *tm)
+static int __init ps3_rtc_init(void)
 {
-	to_tm(read_rtc() + ps3_os_area_get_rtc_diff(), tm);
-	tm->tm_year -=3D 1900;
-	tm->tm_mon -=3D 1;
-}
+	struct platform_device *pdev;
=20
-unsigned long __init ps3_get_boot_time(void)
-{
-	return read_rtc() + ps3_os_area_get_rtc_diff();
+	pdev =3D platform_device_register_simple("rtc-ps3", -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	return 0;
 }
+
+module_init(ps3_rtc_init);
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 6488c50..7b6b63a 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -730,4 +730,13 @@ config RTC_DRV_MV
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-mv.
=20
+config RTC_DRV_PS3
+	tristate "PS3 RTC"
+	depends on PPC_PS3
+	help
+	  If you say yes here you will get support for the RTC on PS3.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-ps3.
+
 endif # RTC_CLASS
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index bd209a5..d161d1d 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -75,3 +75,4 @@ obj-$(CONFIG_RTC_DRV_VR41XX)	+=3D rtc-vr41xx.o
 obj-$(CONFIG_RTC_DRV_WM8350)	+=3D rtc-wm8350.o
 obj-$(CONFIG_RTC_DRV_X1205)	+=3D rtc-x1205.o
 obj-$(CONFIG_RTC_DRV_PCF50633)	+=3D rtc-pcf50633.o
+obj-$(CONFIG_RTC_DRV_PS3)	+=3D rtc-ps3.o
diff --git a/drivers/rtc/rtc-ps3.c b/drivers/rtc/rtc-ps3.c
new file mode 100644
index 0000000..968133c
--- /dev/null
+++ b/drivers/rtc/rtc-ps3.c
@@ -0,0 +1,104 @@
+/*
+ * PS3 RTC Driver
+ *
+ * Copyright 2009 Sony Corporation
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License as published b=
y
+ * the Free Software Foundation; version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.
+ * If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+
+#include <asm/lv1call.h>
+#include <asm/ps3.h>
+
+
+static u64 read_rtc(void)
+{
+	int result;
+	u64 rtc_val;
+	u64 tb_val;
+
+	result =3D lv1_get_rtc(&rtc_val, &tb_val);
+	BUG_ON(result);
+
+	return rtc_val;
+}
+
+static int ps3_get_time(struct device *dev, struct rtc_time *tm)
+{
+	rtc_time_to_tm(read_rtc() + ps3_os_area_get_rtc_diff(), tm);
+	return rtc_valid_tm(tm);
+}
+
+static int ps3_set_time(struct device *dev, struct rtc_time *tm)
+{
+	unsigned long now;
+
+	rtc_tm_to_time(tm, &now);
+	ps3_os_area_set_rtc_diff(now - read_rtc());
+	return 0;
+}
+
+static const struct rtc_class_ops ps3_rtc_ops =3D {
+	.read_time =3D ps3_get_time,
+	.set_time =3D ps3_set_time,
+};
+
+static int __init ps3_rtc_probe(struct platform_device *dev)
+{
+	struct rtc_device *rtc;
+
+	rtc =3D rtc_device_register("rtc-ps3", &dev->dev, &ps3_rtc_ops,
+				  THIS_MODULE);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
+
+	platform_set_drvdata(dev, rtc);
+	return 0;
+}
+
+static int __exit ps3_rtc_remove(struct platform_device *dev)
+{
+	rtc_device_unregister(platform_get_drvdata(dev));
+	return 0;
+}
+
+static struct platform_driver ps3_rtc_driver =3D {
+	.driver =3D {
+		.name =3D "rtc-ps3",
+		.owner =3D THIS_MODULE,
+	},
+	.remove =3D __exit_p(ps3_rtc_remove),
+};
+
+static int __init ps3_rtc_init(void)
+{
+	return platform_driver_probe(&ps3_rtc_driver, ps3_rtc_probe);
+}
+
+static void __exit ps3_rtc_fini(void)
+{
+	platform_driver_unregister(&ps3_rtc_driver);
+}
+
+module_init(ps3_rtc_init);
+module_exit(ps3_rtc_fini);
+
+MODULE_AUTHOR("Sony Corporation");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("ps3 RTC driver");
+MODULE_ALIAS("platform:rtc-ps3");
--=20
1.6.0.4

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village =B7 Da Vincilaan 7-D1 =B7 B-1935 Zaventem =B7 Bel=
gium

Phone:    +32 (0)2 700 8453
=46ax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 =B7 RPR Brussels
=46ortis =B7 BIC GEBABEBB =B7 IBAN BE41293037680010
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
