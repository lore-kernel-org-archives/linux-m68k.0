Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603756;
	b=hAjZPPjINRhVgR2aujTKDozo2NTVpu7wbIjAzr0URYEVzLbT8pAOcNRmAgn6YnJIeYvy
	 ykqXiZUX8bwJNW/22HtjfJqLldktrtonstW5pCZkLMoqFkQT1IO6SQNPXgmx0NyKiW60u
	 GREhiwNbvuhxvu0RT+9NJZd7EFQZAAp0900/+aWTtCtBwxc1kqGVh21w91+ywcjlCCapN
	 4Ab0CflK+nFZuiwiQXuNf1RAFuh8IioQrTZ+rl7n3fdfxx+rONs5bhN4gZF5n7ob6mVNt
	 laJJHvptRzY3WowlID1tM/6lyMMj+HN7+au90hqM56CVwFu+GgNHZIMzqWHeWTHreYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eBEzfc/MvRpY3aj+6lLCYQwoPWS8+v4+nAF5AjeNiUk=;
	b=xUNKCeQKIJ0T/f4D/hLTaqkauFsfkHte2cgWQ9LYPnVaeEGOnm4/XCDK1CXDSQBNuvyC
	 xNForEp2+y8RQmtqq9Yqt0u4+ld9s/YWkOY0V+jWYASnAiOaMPLgG4FiW24k5N1hp5o3e
	 YNBn6tpek1MEV6H5h4DA+L/YdnjGfuObTcMKg/ETHidNgHse0uqwwcbobgUJR+QfV7iXH
	 cJeiz4khJhslKjwKxaX5ImRlMrA7czCuO5boTaW6GoBbFovBEndyj9KljmyvS0Wgmg5cM
	 QslBXT/F+RWUPAI3/1JVYftn9AuT2FLhplKc4DyfS1H89VpKW5HPzqyF6etSOH+WHLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nGF3qrIR;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23976606A326
	for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2026 17:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23976606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nGF3qrIR
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4956869750eso7571145e9.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Oct 2026 10:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792603754; x=1793208554; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBEzfc/MvRpY3aj+6lLCYQwoPWS8+v4+nAF5AjeNiUk=;
        b=nGF3qrIRuCRStxV5H007iwlAgn36Zs4N28aO86dFMWk+2ZbGeEQJHeroZqrcdGZinr
         R1qaZXcJcQFowYVwtrWvzlXVdH+MX5iOSUTsIa/NHiFhXpBE0Vt/MA3xJqfOaMWqmFJ8
         r+aUuEmMoPRb6oHLgJSx8T1zmIye8kQ/MaMf9JKAzvpI34dXdN/TlznFsNHM+5AN61K3
         dRa8qRjLBnQxwt3r4IiQVvFOhZU9TuW2FI9tQxWifldhvCJKH0XvrQU+9hIs0m0qq/I6
         ouYUAnQcXMUMj/ezvj8Caz4E1RUYoXJtutIJzGtZp37iGLaPxpu+zvhQE6MwWGD6qEai
         fuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603754; x=1793208554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBEzfc/MvRpY3aj+6lLCYQwoPWS8+v4+nAF5AjeNiUk=;
        b=zxqEslErp3cdAvFGKKL2BeV5wifR38RLgeX8EMCjGNVnbi16vAfUhrh5nVSYPLO5sZ
         Yczj8oGJS8w+8U1qp87KK+CNvY3PGWOGbbOd+xglJrCPSb5Nxf7ek/if35YbkH77nqgh
         RC8KjAapD+mIwNxO06XXdYjlH8/Y0myPrkY3e1U7NwmMYfcsG+OpTMYd4I1jk9MCyTli
         IGoSAWRyspVSy+25m8v2V3yVAfuQqalH1jt4jVAMomjYLvrTeqpzZP9kfgN5XG5H2gSt
         oW6YMhM1q59hFBZ9M9T44KnRE8SkYeTXkfUhkxXtBkhiPqgZtABFzT46qV1VHcDrrBY8
         YqWA==
X-Gm-Message-State: AFq9FYJeP4l8LvFVIGooTBySmofcdu4HCIVaw7hqk4zuZbXfaWw/T5aO
	4XWSr/TV6q266TWI53lzWvZVav2JXW2VeSy2B5dO+M51oAHG5zi9CbbZWZ+Nzg==
X-Gm-Gg: AYBFou1z04TcoER3N8OS0s2KEF6pf2UMshaVBjAfE346TuodYte3pXC+SiAnklaBfOE
	B3Rvyq7AdAnLNljmQe1JYaQgM6Kek+/YPbyc0i97GQbCFYlwiKarhM4h2bp0p61mcuuVkiE6cx1
	c5N/aacn2RyQOjFL7HiTbSGKkwAYbkif8HUUK7W/KphvUF7M6iNz1z9w4S8SGclqOqL54MZDK8r
	kG0g9W+OaVr9nPfBizvFLX8DdZkQMHnP5RUK9TdUPkc/UhKWCScMNzuElgo2ghvd8xHRq28/EoB
	YKzgeNyunm+0IzNk2npYy8Vn7qf7H6lrwcHEm5GdzKyJD4R8c+Q6L+uD2OerV2FMy9wywrc3jwy
	BOXU+Ej6i+2u3skW+7nfK3Yxp4pbKamjfkYNSjt5+hoz1BBEEdmSyQ0/63YCvURJRgfTaET4H29
	zR7pJ5lrEYWzuNYxhu/eWPrBbRX7D9V+b7pfNf1Je8OBCW5zeY/mdSDJYAPP1CyK6NpNM1EZpci
	oAQUlGg/R/jpCIMDZce0Ol0xcjAw1gU/tC8T/pZjVzw3GHFw3hfG1qVyyiat7iMiocG4Iqv0SFH
	psde2XzqLPPUgZkrm4Q1YgBW/qjh+rhS8BIK/9s=
X-Received: by 2002:a05:600c:4fd4:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4a1fdd53c8cmr58165225e9.27.1792603754023;
        Wed, 21 Oct 2026 10:29:14 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:6d99:38f4:72d4:7bf7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828e54sm7117199f8f.27.2026.10.21.10.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:29:13 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [RFC PATCH 1/8] zorro: warp mfd: add the CS-Lab Warp multifunction parent
Date: Wed, 21 Oct 2026 19:29:03 +0200
Message-ID: <20261021172910.134838-2-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021172910.134838-1-p.pisati@gmail.com>
References: <20261021172910.134838-1-p.pisati@gmail.com>
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
 drivers/zorro/Kconfig    | 31 ++++++++++++++
 drivers/zorro/Makefile   |  2 +
 drivers/zorro/warp-mfd.c | 87 ++++++++++++++++++++++++++++++++++++++++
 drivers/zorro/warp-mfd.h | 19 +++++++++
 4 files changed, 139 insertions(+)
 create mode 100644 drivers/zorro/warp-mfd.c
 create mode 100644 drivers/zorro/warp-mfd.h

diff --git a/drivers/zorro/Kconfig b/drivers/zorro/Kconfig
index 41475ad46e45..9060b659b13d 100644
--- a/drivers/zorro/Kconfig
+++ b/drivers/zorro/Kconfig
@@ -17,3 +17,34 @@ config ZORRO_NAMES
 
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
+	  RAM in sysfs: voltages, temperatures, fan, firmware version,
+	  Kickstart slot and WiFi credentials. Nothing else on the list has a
+	  driver yet.
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
index 000000000000..0e80e82ab0d1
--- /dev/null
+++ b/drivers/zorro/warp-mfd.c
@@ -0,0 +1,87 @@
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
+#include <linux/init.h>
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
+	unsigned long base = z->resource.start;
+	int error;
+
+	dev_info(&z->dev, "Warp at 0x%08lx\n", base);
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

