Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71030359705
	for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Feb 2026 17:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771781566; cv=none; b=Dhbk4ZErjtJpNtjcAhxjM6pZ0z2YErAxKdbe7GyAKyTzSo2XMwMmI+Dou9V5Uis+I9nv9UWeGV7V0oSmeWFguUhT1j8HisbFqFMI9y0lfdHnmTb+RK+CwVu/fNiKeHXUjcAoRo+qcToxgusIzVqkYY2rKxQi4UXDwcjo7xxcg4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771781566; c=relaxed/simple;
	bh=hIGKj/FGC8Gh/lZO2wAX9+uKoIqF6oc1pUcFUMBWm3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sf0pPow4YZ+G9MocofsxilffukXyyZGIuql/HCKUi/uqGtDfXHNSbASIX9hi/mU5fouPIlE3YfEHDIag99WcpBug5BEvBlvqxwKoydaB13MCHwaeD1hq+5VcOv9cZBgB29LhAR3XO6weHx1pWwij7atSCdAmQjua98v+s5uH3C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCMdv6lg; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCMdv6lg"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3562212b427so1436128a91.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Feb 2026 09:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771781564; x=1772386364; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1btUeakV5x2bdwZTY0fXlY/DrEgaFMrytEHGtVsI2A=;
        b=KCMdv6lg3+GDv3ypniAFX/5p5fPr/knG+rL6ZD6EJZgDSvvHax8XadjF5CCtDJxaMA
         BbORBxuicJ6qtX1XmVoTXjeAEgjCZIQDfx0EXiZa8FMpnWy+5G8qX5waT0gxfYDOAeXm
         jAN3hMv2UFBznTidmx5xMOE3wkHEl0VE0jnJkCdpQv465mhPJzp+4ateg3bL7T4mbYs/
         ml4QmmBVugSnLzy+auflxs0EJl1/4HXlSpqDCjSSHcyAboAKLF75d4gfE7bzurjotD9q
         bZTP9R5CudrW/9AZuyqpsvMPfO3uHK3QE9VAldREJY41qka8HzqXXwK56Z/lvCjALcLo
         uDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771781564; x=1772386364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V1btUeakV5x2bdwZTY0fXlY/DrEgaFMrytEHGtVsI2A=;
        b=kggrjDpRIMguW2mjRaBtVpTTc4pErootFIdrUfBgrbpuviqQJ09iYk+lvyYuLGnVXM
         DOzA/DBc2BlvrrXtJWZfnGLRf7alKbmmL56njNZP4kjB6F9QQ866fEb6d9d+rKM36Pdo
         g6aGpwAHobwrVCgvDv9mYFhuvnWpQtHGgYKiSFZ0H3eIy3jUrNoKRzsPKq3kLSmRH3pz
         jIbhzHRKpplCf56AaBVVn84Iq84xVInspxd8V7B73zBPCXUCv6vpvy9NKwJtvGTDTMyZ
         xg8mZpOKvW3DrIc1K9jGv+n6zZp4D40tTsbJ19ipIQtTbu6ybCgmYgo74GClTixRIMxc
         WX8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWozkWSq8u0z+rTN7QZjG78lgxCcXDOPISN1k2B7iLspV6VJxsTif84nqG49cidoE5Sx2CyXNSuVTqs@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwfIFlsXzwVMhhGM6wMqbw/+PaandcFcFAY+ulH/mzQjS3Ynpb4
	NO8ppwi8rYYdEBZ6kpll1yDtItmeb1sAJMEEjQHmKp5wKgaPztNB25oh
X-Gm-Gg: AZuq6aIgqZUnRoyNH6+/T6yOcZ2ebjVgGyw+Q+lxRjbBBZaVTBxOTo39/wb1TNgByd5
	p2LmeASy/EjlYhm7GckSJl8D/JOpi4xr1MTFZXvmp/3RHQoH13o1b6mQ+ojOEFtOfTGL4ndwDM5
	NTEtFEkOqwNRQVJmDEPflm+1eMbxiWlX9a8+UXsj4UEwIKp+IohxD3rLGbyIaIez+G7dwGAyF2/
	GVdvPphxlVhHiyKXHspeIM4lYny7YbXtLvCl8h5Rb/B+Eu4L17abx+p9bxCTq0LNEeImt6dKwag
	MGZgAZ1FpOnuLypkWyVs11Fhj2FAFq6njVZKBvAlnh0LnmMD/+3oYXVySaO+2VfLxHwltXK8UAc
	kEOvTbfWQae6B3hIp42l5iL3XfNNAzKEYUwYi23oHhu/Ah3yb0tiDesOhQRntXXuw0BIcsfcbBM
	fqovmBhvufgTsEkjXw5CnijY+2B4TgFe+96gOW5+DcgQVkz9TJvoX+vM3ATjqZcWT0tbI8wt0cV
	DGs8YNDIdw5WMGg2SZIc1UQX8h0F04i2Z2y
X-Received: by 2002:a17:90b:268b:b0:356:7917:236 with SMTP id 98e67ed59e1d1-358ae8c6a26mr4779794a91.26.1771781563791;
        Sun, 22 Feb 2026 09:32:43 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (7.162.199.104.bc.googleusercontent.com. [104.199.162.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b726cbf2sm5275750a12.34.2026.02.22.09.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 09:32:43 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	sre@kernel.org
Cc: jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	daniel@0x0f.com,
	laurent@vivier.eu,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-pm@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v3 1/2] power: reset: Add QEMU virt-ctrl driver
Date: Sun, 22 Feb 2026 17:32:24 +0000
Message-ID: <20260222173225.1105572-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.345.g96ddfc5eaa-goog
In-Reply-To: <20260222173225.1105572-1-visitorckw@gmail.com>
References: <20260222173225.1105572-1-visitorckw@gmail.com>
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

This driver utilizes the modern system-off API to register callbacks
for both system restart and power off. It also registers a reboot
notifier to catch SYS_HALT events, ensuring that LINUX_REBOOT_CMD_HALT
is properly handled. It is designed to be generic and can be reused by
other architectures utilizing this QEMU device.

Link: https://gitlab.com/qemu-project/qemu/-/blob/v10.2.0/hw/misc/virt_ctrl.c [1]
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v3:
- Add a reboot notifier to handle SYS_HALT.
- Implement virt_ctrl_write32() to handle native endianness.

I noticed devm_register_sys_off_handler() currently lacks a
SYS_OFF_MODE_HALT. Therefore, I registered a standard reboot notifier
for SYS_HALT, while keeping restart and power-off on the sys-off API.

 MAINTAINERS                          |   6 ++
 drivers/power/reset/Kconfig          |  10 +++
 drivers/power/reset/Makefile         |   1 +
 drivers/power/reset/qemu-virt-ctrl.c | 122 +++++++++++++++++++++++++++
 4 files changed, 139 insertions(+)
 create mode 100644 drivers/power/reset/qemu-virt-ctrl.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..aa9eb8540637 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21441,6 +21441,12 @@ S:	Maintained
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
index f6c1bcbb57de..99e3334726a5 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -354,4 +354,14 @@ config POWER_MLXBF
 	help
 	  This driver supports reset or low power mode handling for Mellanox BlueField.
 
+config POWER_RESET_QEMU_VIRT_CTRL
+	tristate "QEMU Virt Machine System Controller"
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
index 000000000000..f40d04afd4e3
--- /dev/null
+++ b/drivers/power/reset/qemu-virt-ctrl.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * QEMU Virt Machine System Controller Driver
+ *
+ * Copyright (C) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
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
+	struct notifier_block reboot_nb;
+};
+
+static inline void virt_ctrl_write32(u32 val, void __iomem *addr)
+{
+	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
+		iowrite32be(val, addr);
+	else
+		iowrite32(val, addr);
+}
+
+static int qemu_virt_ctrl_power_off(struct sys_off_data *data)
+{
+	void __iomem *base = data->cb_data;
+
+	virt_ctrl_write32(CMD_HALT, base + VIRT_CTRL_REG_CMD);
+
+	return NOTIFY_DONE;
+}
+
+static int qemu_virt_ctrl_restart(struct sys_off_data *data)
+{
+	void __iomem *base = data->cb_data;
+
+	virt_ctrl_write32(CMD_RESET, base + VIRT_CTRL_REG_CMD);
+
+	return NOTIFY_DONE;
+}
+
+static int qemu_virt_ctrl_reboot_notify(struct notifier_block *nb,
+					unsigned long action, void *data)
+{
+	struct qemu_virt_ctrl *ctrl = container_of(nb, struct qemu_virt_ctrl, reboot_nb);
+
+	if (action == SYS_HALT)
+		virt_ctrl_write32(CMD_HALT, ctrl->base + VIRT_CTRL_REG_CMD);
+
+	return NOTIFY_DONE;
+}
+
+static int qemu_virt_ctrl_probe(struct platform_device *pdev)
+{
+	struct qemu_virt_ctrl *ctrl;
+	int ret;
+
+	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	ctrl->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ctrl->base))
+		return PTR_ERR(ctrl->base);
+
+	ret = devm_register_sys_off_handler(&pdev->dev,
+					    SYS_OFF_MODE_RESTART,
+					    SYS_OFF_PRIO_DEFAULT,
+					    qemu_virt_ctrl_restart,
+					    ctrl->base);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "cannot register restart handler\n");
+
+	ret = devm_register_sys_off_handler(&pdev->dev,
+					    SYS_OFF_MODE_POWER_OFF,
+					    SYS_OFF_PRIO_DEFAULT,
+					    qemu_virt_ctrl_power_off,
+					    ctrl->base);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "cannot register power-off handler\n");
+
+	ctrl->reboot_nb.notifier_call = qemu_virt_ctrl_reboot_notify;
+	ret = devm_register_reboot_notifier(&pdev->dev, &ctrl->reboot_nb);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "cannot register reboot notifier\n");
+
+	return 0;
+}
+
+static const struct platform_device_id qemu_virt_ctrl_id[] = {
+	{ "qemu-virt-ctrl", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, qemu_virt_ctrl_id);
+
+static struct platform_driver qemu_virt_ctrl_driver = {
+	.probe = qemu_virt_ctrl_probe,
+	.driver = {
+		.name = "qemu-virt-ctrl",
+	},
+	.id_table = qemu_virt_ctrl_id,
+};
+module_platform_driver(qemu_virt_ctrl_driver);
+
+MODULE_AUTHOR("Kuan-Wei Chiu <visitorckw@gmail.com>");
+MODULE_DESCRIPTION("QEMU Virt Machine System Controller Driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0.345.g96ddfc5eaa-goog

