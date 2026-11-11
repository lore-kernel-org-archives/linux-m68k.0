Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415060;
	b=NULDXgHwLuvN2Btt+Sws4BTqT9QvoWnesBJ/qFc9T/7dxa4jChR2WUEdsnpx2Bo0OfsL
	 lMN1IlZ+Kc0AVUg5cYmBBZz/tzJ4A3gBSMGgcntAonY6UWl1K1obJho5LENeWcvRSFWTr
	 Reh5VhRXRGC91JQeevB1h9zDxycO6XXoOV9HtzDJsX7dhDJvFYZUSIF5StsZ3Y4wV2N9L
	 hbgx+pGYkri+5KithuPgxEGoTSzr097yo5+2envip10FlbPK080yehHn8wh49gi75LyUg
	 1GaVbR3VLPCEnh+gZqEmfdmfCIkBP/ysYP2406TzYZUJmDfUOWFZO5A7/IWPA5EUmVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wuyvace6ciytd5jUR1xreUhLnUkhsuMz/ZH/NBTGYXo=;
	b=vqoYUYKp3nYUbYBuPwvocmZmu3tG4p8GXHYX9zRO0C6uk0CZnMh/85MLn4gOnE8RU8KG
	 wTBfHyjzhoIydd7BJaBB/ooTZN9iuVtUAZNy+vstlYivu1GMLVmVZXP41OEl6GR7hCB31
	 rrRG4Hv0osgmq5q/j3P1DOy/2o9MxUusRnzpKW5D/dOT3kvBm9y4q7EvW8Al0WQfdAqKo
	 QGCJ7oqe0kaLj7GGzt0BL4h2f9JiGLj4cs6LrfNDpwjvnK914KZ0B7sSaX4W92AHNmMwF
	 DDo/yxn8VWGgeS5N3IqGLYvK7YldtsuGMeDhrPeRf7D51ayfzHgeFie4WQg1To5Oskw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OwVGTHfD;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596BE606A32E
	for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Nov 2026 16:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 596BE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OwVGTHfD
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so25099585e9.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Nov 2026 08:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415058; x=1795019858; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wuyvace6ciytd5jUR1xreUhLnUkhsuMz/ZH/NBTGYXo=;
        b=OwVGTHfDclh2ZRS+s31VMWCD9xn9DhEUkF0Uueg/X93HkSEU169r38JJonsvD66waa
         Zhb3wHifmCrnTcYly/dUUT40pfzkUugWHa/JdKaZht/ydW6eP53S1OXnAlYI0gsg7RWx
         rx6Dzsm4zCZpkfnokHRu7XAXUHboyYPhekeiJ8wF+6SQQm7L0FOScM3rQd47kKtaOemr
         IgMtko50igzGgrsaDbgAgmO+qMkg8rG/Ka2V0E1XYln5JrOUezJDkr53/hqc1C6yhhzT
         KwjqlO5uXN5q7onJfHlVTLvmnFmRcNAsQemlGa0rov194gdmXER1tdd8eGdj2cPWXbVP
         wPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415058; x=1795019858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wuyvace6ciytd5jUR1xreUhLnUkhsuMz/ZH/NBTGYXo=;
        b=iB3rffJqKDcbNrJfK+kiBUXAIiPp7Mhg/njspMpx39hRDd6LxFnvvIisn4C60/+t68
         AJDmgXVObnEZk9PHPcXgNZT3psr4NOMAFcx1UXfdaWCGo9tXFuFaoK95J++ujFDsEiWv
         4xdb6l/7l1tFwCZ4sw28KRTIBQrjg9INP3YyDoYVon5EiC3xs1MPCRrpBESH54ExYGUv
         X934LRPMBaePlHHpDGXKrNVOibQZFDa6Nl1O/e2exHt+0rT9N2LOb2pnztuRpbvA1cPb
         vOZMDjSnIwSuq1YyVmIl41Fby8NGo1cxyKpbb+FR4BLm07qMIoyzS0EsZGyuPwBtC4zK
         CJ5w==
X-Gm-Message-State: APuU4Z8r0xVqUOYJFk9Ps2+Ka1qg5AEYhk9v1O2kvVmH67Spg5H9os3r
	wsAQuPtyvuQN4uyErs+m1c1tGrMNQSyUl/BHM/FvY93ZtLasv7nDCKk7
X-Gm-Gg: AYBFou38ysaVY3IgvUJGa2QuZGMMJvCOa51+VAkByl3Ms7ed1rjHum1XQr8UvCcGZsK
	LTPpie84uD+0VeS5CCw/bEFMKIro//F7JjqQTdtPemUTAU3EnSw9zrJS7dJO2mZevrCbwAgMj5r
	+2pV3y/wdVUWC2ZIxhaaN53YURf7/oLPWpiqhZOjBROkOjf7zoWMbVAL7geyqdH4d6aVMLMRmwo
	L7hOqGjOI8hzwmWlyEmg/k4Ys3pQhs1UFrlxZ7/rX8dxUmicPzhSBi1GJSxJO5p1ABCsr6n6oEd
	rFnKWm8dd+q6bbYSHhn8AFoTQd7KTYsvkmO075MRuuQf/EVte0aUE+G935Dke/xHHFOdaLeKr4F
	1K2LNEi54Z4PdGJxyu7mHaCxh0I3YPFShz72ACDI5Ct8ujwzUrbhxCEIIj02pjsgrCVYST/2nEE
	l4VZfJX4FFXFhkIM7dYTqW0BpmP18/JlS1cscQR3i0LTNPtZO76cuT/9Y6EX9NOiSceotiKUKye
	90iKaVgRWZt7PdPzHKnEmwAcda+jTVSY7juUAcAUhHbwhvjcEhdu5yofxx+nTov6FIVd9VyD3uY
	yK+zxp8tUzlbckEv8nEdMNMoK8j/y3DZmtPxkq7yuKRoNFwkyyyAhGsjZ+NcvECn5FRw+jnhflq
	rResbF76ZjHJLvg==
X-Received: by 2002:a05:600c:310b:b0:4ba:a5:b920 with SMTP id 5b1f17b1804b1-4ba0936d8dcmr54021965e9.16.1794415057486;
        Wed, 11 Nov 2026 08:37:37 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:6e81:13fe:ca06:8db8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e258e8dsm825955e9.4.2026.11.11.08.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:37:37 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v1 1/7] zorro: warp mfd: add the CS-Lab Warp multifunction parent
Date: Wed, 11 Nov 2026 17:37:28 +0100
Message-ID: <20261111163735.227286-2-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111163735.227286-1-p.pisati@gmail.com>
References: <20261111163735.227286-1-p.pisati@gmail.com>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Warp 1260 is an A1200 trapdoor accelerator whose single Zorro device
fronts several functions: an ARM co-processor reached through a
dual-port RAM window, and an IDE interface and an RTG display controller
that the 68k drives directly.
pata_cswarp claims the whole device for the IDE window alone, which
leaves no way for anything else on the board to get a driver.

Add a parent that owns the Zorro device and describes the functions as
mfd cells, starting with the IDE window as a "warp-pata" cell.

Only the window layout is described here; the dual-port RAM protocol
arrives with its first user.
pata_cswarp is converted in the next patch.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 MAINTAINERS              |  7 ++++
 drivers/zorro/Kconfig    | 30 ++++++++++++++
 drivers/zorro/Makefile   |  2 +
 drivers/zorro/warp-mfd.c | 89 ++++++++++++++++++++++++++++++++++++++++
 drivers/zorro/warp-mfd.h | 19 +++++++++
 5 files changed, 147 insertions(+)
 create mode 100644 drivers/zorro/warp-mfd.c
 create mode 100644 drivers/zorro/warp-mfd.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..cfabc4609c9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7173,6 +7173,13 @@ L:	linux-crypto@vger.kernel.org
 S:	Maintained
 F:	tools/crypto/tcrypt/tcrypt_speed_compare.py
 
+CS-LAB WARP MULTIFUNCTION DRIVER
+M:	Paolo Pisati <p.pisati@gmail.com>
+L:	linux-m68k@lists.linux-m68k.org
+S:	Maintained
+F:	drivers/zorro/warp-mfd.c
+F:	drivers/zorro/warp-mfd.h
+
 CS3308 MEDIA DRIVER
 M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/zorro/Kconfig b/drivers/zorro/Kconfig
index 41475ad46e45..c9ab9fb4b9ee 100644
--- a/drivers/zorro/Kconfig
+++ b/drivers/zorro/Kconfig
@@ -17,3 +17,33 @@ config ZORRO_NAMES
 
 	  When in doubt, say Y.
 
+# Zorro multifunction drivers
+
+config WARP_MFD
+	tristate "CS-Lab Warp multifunction driver"
+	depends on ZORRO
+	select MFD_CORE
+	help
+	  The CS-Lab Warp 1260 is an A1200 trapdoor accelerator. Besides the
+	  68060 it carries an FPGA and an ARM co-processor; its control
+	  registers, the dual-port RAM and the IDE interface share one Zorro
+	  device, which this driver binds to.
+
+	  The 68k drives these through the FPGA: the on-board IDE interface and
+	  an RTG display controller.
+
+	  The co-processor owns the rest, reached over the dual-port RAM: two
+	  USB host ports, an SD card slot, an ESP32 WiFi bridge,
+	  an audio mixer, the Kickstart slot selection, the CPU clock and turbo
+	  levels, thermal regulation of the fan, and the board telemetry.
+
+	  This driver hands the IDE window to pata_cswarp - which needs
+	  idemode=native set in Warp Configuration to be of any use - and
+	  exposes the configuration and telemetry reachable over the dual-port
+	  RAM in sysfs: voltages, temperatures, fan, firmware version and
+	  Kickstart slot. Nothing else on the list has a driver yet.
+
+	  If you have a CS-Lab Warp 1260 board, say Y. Otherwise, say N.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called warp-mfd.
diff --git a/drivers/zorro/Makefile b/drivers/zorro/Makefile
index 91ba82e633e7..6fe7cc1822dc 100644
--- a/drivers/zorro/Makefile
+++ b/drivers/zorro/Makefile
@@ -7,6 +7,8 @@ obj-$(CONFIG_ZORRO)	+= zorro.o zorro-driver.o zorro-sysfs.o
 obj-$(CONFIG_PROC_FS)	+= proc.o
 obj-$(CONFIG_ZORRO_NAMES) +=  names.o
 
+obj-$(CONFIG_WARP_MFD) += warp-mfd.o
+
 hostprogs		:= gen-devlist
 
 # Files generated that shall be removed upon make clean
diff --git a/drivers/zorro/warp-mfd.c b/drivers/zorro/warp-mfd.c
new file mode 100644
index 000000000000..94af7c9d0ea5
--- /dev/null
+++ b/drivers/zorro/warp-mfd.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CS-Lab Warp multifunction driver
+ *
+ * Copyright 2026 Paolo Pisati <p.pisati@gmail.com>
+ *
+ * The Warp 1260 is an A1200 trapdoor accelerator made by CS-Lab. Besides the
+ * 68060 it carries an ARM co-processor which owns most of the peripherals,
+ * and the IDE interface and RTG display controller, which the 68k drives
+ * directly.
+ *
+ * This driver claims the Zorro device and hands the IDE window to pata_cswarp
+ * as an mfd cell.
+ */
+
+#include <linux/array_size.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+
+#include <linux/zorro.h>
+
+#include <linux/mfd/core.h>
+
+#include "warp-mfd.h"
+
+static const struct mfd_cell warp_mfd_cells[] = {
+	{
+		.name		= "warp-pata",
+		.num_resources  = 1,
+		.resources	= (const struct resource []) {
+			DEFINE_RES_MEM_NAMED(WARP_OFFSET_ATA, WARP_ATA_SIZE,
+					     "pata"),
+		}
+	}
+};
+
+static int warp_mfd_probe(struct zorro_dev *z,
+			  const struct zorro_device_id *ent)
+{
+	int error;
+
+	dev_info(&z->dev, "Warp at %pR\n", &z->resource);
+
+	error = mfd_add_devices(&z->dev, z->dev.id, warp_mfd_cells,
+				ARRAY_SIZE(warp_mfd_cells), &z->resource,
+				0, NULL);
+	if (error) {
+		dev_err(&z->dev, "mfd_add_devices() failed %d\n", error);
+		return error;
+	}
+	return 0;
+}
+
+static void warp_mfd_remove(struct zorro_dev *z)
+{
+	mfd_remove_devices(&z->dev);
+}
+
+static const struct zorro_device_id warp_mfd_ids[] = {
+	{ .id = ZORRO_PROD_CSLAB_WARP_1260 },
+	{ }
+};
+MODULE_DEVICE_TABLE(zorro, warp_mfd_ids);
+
+static struct zorro_driver warp_mfd_driver = {
+	.name		= "warp-mfd",
+	.id_table	= warp_mfd_ids,
+	.probe		= warp_mfd_probe,
+	.remove		= warp_mfd_remove
+};
+
+static int __init warp_mfd_init(void)
+{
+	return zorro_register_driver(&warp_mfd_driver);
+}
+
+static void __exit warp_mfd_exit(void)
+{
+	zorro_unregister_driver(&warp_mfd_driver);
+}
+
+module_init(warp_mfd_init);
+module_exit(warp_mfd_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Paolo Pisati <p.pisati@gmail.com>");
+MODULE_DESCRIPTION("CS-Lab Warp multifunction driver");
diff --git a/drivers/zorro/warp-mfd.h b/drivers/zorro/warp-mfd.h
new file mode 100644
index 000000000000..3f44f2b57c76
--- /dev/null
+++ b/drivers/zorro/warp-mfd.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * CS-Lab Warp - board window layout
+ *
+ * Copyright 2026 Paolo Pisati <p.pisati@gmail.com>
+ */
+
+#ifndef _WARP_MFD_H
+#define _WARP_MFD_H
+
+/* Offsets from the start of the board's Zorro window. */
+#define WARP_OFFSET_DPREG_CR	0x1000	/* dual-port interrupt control reg */
+#define WARP_OFFSET_DPRAM	0x2000	/* dual-port RAM */
+#define WARP_OFFSET_ATA		0x6000	/* on-board IDE interface */
+
+#define WARP_DPRAM_SIZE		0x2000
+#define WARP_ATA_SIZE		0x1800
+
+#endif /* _WARP_MFD_H */
-- 
2.43.0

