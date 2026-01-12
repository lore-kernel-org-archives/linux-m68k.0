Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6DE38759D
	for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 18:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768242203; cv=none; b=Wcq3mO2Ju4J4gjMAUTAYbQ+TcCiok6TWy+yNhnprEEjGFMJ1aUjg8T6JQ8xgeuqLLu8FoeIdZM8OxRUI17YIvzTyLs/0i37XR3Hivd1yeuSQ/+n6UuWlo2e+KUCuGIh2Ao4hCufH26BxzUXtV2tINpo96/nniewNkswTERvYIfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768242203; c=relaxed/simple;
	bh=JixI5MKXXHfbCAOb4sZTT/q9s6LOvmfZnYyMilwvDNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ceQCO6QW6roDUhblCsxwaoBY53bwpTFrIOQj68nBrvyqd3oVOyufbVlu3H8JxgD5O6whumF6CGWqm4LwFWLPIJsAqy5bfclMaS08FUzjmAY/wXy1x8n+7SH9en60UG/R3aGHvPtYwDUmkLuW7TQEwRr014CcuHKaNi+xQ1xsnOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldKXE3uf; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldKXE3uf"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29efd139227so47383715ad.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 10:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768242199; x=1768846999; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4oM9+6NMg5ZQ1ImC64TO0sq8NspPgsBXi1LprWrWHQ=;
        b=ldKXE3ufcMEic416T4X5PoT7bvhbhMF7Q7Q8nGBzLXwn0LOUPPdN1wxiq4znYq7G8h
         TNGO1Lje+bgMN46P3RQFa/gcaNEIFcxuEM+57v/h3aPiAlrtNY2IA8FWYmROBJs1vThG
         eAVsdk+h2kmu5Xyihhi9Hcn1vBAYsIjeyjAGbPJnPiq1eVe1wAcZLYGJAPZP4vswBxuG
         DYrBGK9oopJct6aywxUany7dfpiubcYSEONBVlMCH1Cu8+QAaJp1Ix1AhZErRg8L0gBk
         AHk74pJYdWV3N3tKU7vZT5nvYFGlk1/vf7LDJ1X7ip1TO6wgpAS74nFHi+DYlSF1+USD
         WATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768242199; x=1768846999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X4oM9+6NMg5ZQ1ImC64TO0sq8NspPgsBXi1LprWrWHQ=;
        b=C5iYRy8lMHAVrmStBuJFhgfg05ci2UVdKnm76IQ3Lv4VXRdKNYW31IL0n4/u5QNnB9
         R7NtU2PBzboC8HGbBUrimvvB3ByxBI1C5awKbdNq/v14BywM0zJgDYVBdzyOpiyrwtk9
         coFqe9ZIwzp0e2BaEGpO1uw7+jcnbMP0GxRBA68GEqJCGMGZgkcnO+pI66p5vMYxx0m4
         N9chop34wSNYS1VK2pFscpf1hbiiByXR6MT3q0F5KVtRvc2IPLglW9y7SSLotYuPLwbh
         raL3UKrQSxE2u4uqlN4KZZC5HOdze07hVZFLlN3uK9aY9noJndRJRnnC9xdMTy/V+PMO
         tYvw==
X-Forwarded-Encrypted: i=1; AJvYcCUWRuwA0kIxAglPuvbTVPi2//hvE72iviZ1MtaMc+RggK694axotRd7JWV53hQmgN8TVUmEkvnh/7yb@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx03SKVZgNhOPnhdto/r60mSUzwqnBKI6YtQ9Qt06UT8vmkW0zj
	JjuwF/UwU+SUixAU08tfDQY/U8okyTAW14gpG/zIeerX/aKXFUoLaVe+
X-Gm-Gg: AY/fxX6xG5xuWYqD+6sHRJF7JDNMzam5D4ffWHf+0CL60d5GzxM53sEOaNnlvcnIY9m
	X7QK+AarjnqIi7Y5LVAGiE/P7hOue+gdMMEcPneEKMcWUsS8XTmsTNF3cbWesBvjqiDFJC60MR7
	ZEMQxZEwtUkqTRzkR8GbazI4OjRdL/Ox0ZUWAOthUZ6rRchFpaLXtsZ2JF4z/Hzb2OMLSMsk3hQ
	IaBvqmfuZwYmkOMuk3cOIbINvIbjxI0P/cbcQWhedDMLtMkbjyE6wkSwXNkDKqeh6G6g6EXF77Q
	luCfnzfT9d9EiIPZ0mslL6XcOZxtB/wIamT32561wykg43H0DzEgKw8IEnVrWgWZCU/NsLajlKV
	W95XlrE9iPJDSjK5v44ggR9IozdOVbDpiCBifJ8fzLPGsVaKxQ+MUJ57HCwVkGkhbqxO0T46w+4
	gvoitrcB631082snj71Vqaa5z4SA9jGV68K6NMS1Llpa807hfWtwF2t6raqgz/FQDmF7f/MpVir
	vXCOoopLiZVmDAj3BFglNzpGD2tXCv0
X-Google-Smtp-Source: AGHT+IFt8RVpeeOtq9O9bSM2ksXYcn2EaNgWu8GverPZh2BzB+VspJTa4/pMhcKRNs5POXbaKfo/GQ==
X-Received: by 2002:a17:903:13ce:b0:295:560a:e499 with SMTP id d9443c01a7336-2a3ee43316amr164992035ad.5.1768242198685;
        Mon, 12 Jan 2026 10:23:18 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc794asm180981205ad.70.2026.01.12.10.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:23:18 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	sre@kernel.org
Cc: jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-pm@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 1/2] power: reset: Add QEMU virt-ctrl driver
Date: Mon, 12 Jan 2026 18:22:56 +0000
Message-ID: <20260112182258.1851769-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260112182258.1851769-1-visitorckw@gmail.com>
References: <20260112182258.1851769-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new driver for the 'virt-ctrl' device found on QEMU virt machines
(e.g. m68k). This device provides a simple interface for system reset
and power off [1].

This driver registers a restart handler for system reboot and sets the
global pm_power_off callback for system shutdown. It is designed to be
generic and can be reused by other architectures utilizing this QEMU
device.

Link: https://gitlab.com/qemu-project/qemu/-/blob/v10.2.0/hw/misc/virt_ctrl.c [1]
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 MAINTAINERS                          |  6 ++
 drivers/power/reset/Kconfig          | 10 +++
 drivers/power/reset/Makefile         |  1 +
 drivers/power/reset/qemu-virt-ctrl.c | 98 ++++++++++++++++++++++++++++
 4 files changed, 115 insertions(+)
 create mode 100644 drivers/power/reset/qemu-virt-ctrl.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0d044a58cbfe..2586e4162304 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21179,6 +21179,12 @@ S:	Maintained
 F:	drivers/firmware/qemu_fw_cfg.c
 F:	include/uapi/linux/qemu_fw_cfg.h
 
+QEMU VIRT MACHINE SYSTEM CONTROLLER DRIVER
+M:	Kuan-Wei Chiu <visitorckw@gmail.com>
+L:	linux-pm@vger.kernel.org
+S:	Maintained
+F:	drivers/power/reset/qemu-virt-ctrl.c
+
 QLOGIC QL41xxx FCOE DRIVER
 M:	Saurav Kashyap <skashyap@marvell.com>
 M:	Javed Hasan <jhasan@marvell.com>
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index f6c1bcbb57de..1ca1c2913cbc 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -354,4 +354,14 @@ config POWER_MLXBF
 	help
 	  This driver supports reset or low power mode handling for Mellanox BlueField.
 
+config POWER_RESET_QEMU_VIRT_CTRL
+	bool "QEMU Virt Machine System Controller"
+	depends on HAS_IOMEM
+	help
+	  This driver supports the system reset and power off functionality
+	  provided by the QEMU 'virt-ctrl' device.
+
+	  Say Y here if you are running Linux on a QEMU virtual machine that
+	  provides this controller, such as the m68k virt machine.
+
 endif
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index 0e4ae6f6b5c5..d7ae97241a83 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -41,3 +41,4 @@ obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
 obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
 obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
 obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
+obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
diff --git a/drivers/power/reset/qemu-virt-ctrl.c b/drivers/power/reset/qemu-virt-ctrl.c
new file mode 100644
index 000000000000..f1acd22172ce
--- /dev/null
+++ b/drivers/power/reset/qemu-virt-ctrl.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * QEMU Virt Machine System Controller Driver
+ *
+ * Copyright (C) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/reboot.h>
+
+/* Registers */
+#define VIRT_CTRL_REG_FEATURES	0x00
+#define VIRT_CTRL_REG_CMD	0x04
+
+/* Commands */
+#define CMD_NOOP	0
+#define CMD_RESET	1
+#define CMD_HALT	2
+#define CMD_PANIC	3
+
+struct qemu_virt_ctrl {
+	void __iomem *base;
+	struct notifier_block restart_nb;
+};
+
+static void __iomem *qemu_virt_ctrl_base;
+
+static void qemu_virt_ctrl_power_off(void)
+{
+	if (qemu_virt_ctrl_base)
+		iowrite32be(CMD_HALT, qemu_virt_ctrl_base + VIRT_CTRL_REG_CMD);
+}
+
+static int qemu_virt_ctrl_restart(struct notifier_block *nb, unsigned long action,
+				  void *data)
+{
+	struct qemu_virt_ctrl *vc = container_of(nb, struct qemu_virt_ctrl, restart_nb);
+
+	iowrite32be(CMD_RESET, vc->base + VIRT_CTRL_REG_CMD);
+
+	return NOTIFY_DONE;
+}
+
+static int qemu_virt_ctrl_probe(struct platform_device *pdev)
+{
+	struct qemu_virt_ctrl *vc;
+	int ret;
+
+	vc = devm_kzalloc(&pdev->dev, sizeof(*vc), GFP_KERNEL);
+	if (!vc)
+		return -ENOMEM;
+
+	vc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vc->base))
+		return PTR_ERR(vc->base);
+
+	qemu_virt_ctrl_base = vc->base;
+
+	vc->restart_nb.notifier_call = qemu_virt_ctrl_restart;
+	vc->restart_nb.priority = 128;
+
+	ret = register_restart_handler(&vc->restart_nb);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "cannot register restart handler\n");
+
+	if (!pm_power_off)
+		pm_power_off = qemu_virt_ctrl_power_off;
+
+	platform_set_drvdata(pdev, vc);
+
+	return 0;
+}
+
+static void qemu_virt_ctrl_remove(struct platform_device *pdev)
+{
+	struct qemu_virt_ctrl *vc = platform_get_drvdata(pdev);
+
+	unregister_restart_handler(&vc->restart_nb);
+
+	if (pm_power_off == qemu_virt_ctrl_power_off)
+		pm_power_off = NULL;
+}
+
+static struct platform_driver qemu_virt_ctrl_driver = {
+	.probe = qemu_virt_ctrl_probe,
+	.remove = qemu_virt_ctrl_remove,
+	.driver = {
+		.name = "qemu-virt-ctrl",
+	},
+};
+module_platform_driver(qemu_virt_ctrl_driver);
+
+MODULE_AUTHOR("Kuan-Wei Chiu <visitorckw@gmail.com>");
+MODULE_DESCRIPTION("QEMU Virt Machine System Controller Driver");
+MODULE_LICENSE("GPL");
-- 
2.52.0.457.g6b5491de43-goog

