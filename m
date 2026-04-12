Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1E7382383
	for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Apr 2026 21:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776028815; cv=none; b=SYinUf7XPbnvYqSIaQXB5I541Xg6dsGyXuOiuLgmZH/xduYC7y32ZJSoe1Fg/6dhUi6cQCgIMs6j8mMp+7Po+GeFvnKlvHC6vBAQaDoR3wIXNBVzqwk76oL/sRD3y6zow3kvxjM4lkOafWba1JXddph4ni/t/3lKzp/mX4dF3zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776028815; c=relaxed/simple;
	bh=k8VI7MRV0RzMVUJwg6fgfku3HWrwyDhLnGC8Egha3XI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hURm6o0fR/mlrYUQ6UPNPPU7i+YeR6gYfjduSQruNK/IIlQPu+mhaZ9la6MZx6ixeVQXdC5dFYVXIDX51eTlC+Tb76+Bi+1VS9QG1/zkNT7IqNTtlUtdJSAH9dhLm+nNSMq0BI18fvE67FnzbUz++qfIPxAgqDuPCkRWDyFkxvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZYhKglk; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZYhKglk"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35e576110adso439952a91.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Apr 2026 14:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776028812; x=1776633612; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hv96ERjBO9/NiOyiLL/BGaUYHQpO00Dknp/iQI1oqNE=;
        b=RZYhKglkYjKHemSaivPvDPKTSe07sMXsrOS2rC0VqOT2kc7a+yYRUdpyi5337LoFMe
         /psnSYMMhaqCPPMAaiW6R+fCs7hzbTv9ZlldxtaGE1RiArn/oVvtOTZIRNgVcoFiujNC
         3oa3MQvhj/uGM9aJPVmKF8eso+tH6ki1ft35YKUqa5u4OE4vVLE/DiWRpJW8aUftbuGa
         kZLqG6vUc4KnFlZiwyV53r4qqpvHPacQjxVzmZT5knTpQxUt3FUMQZ9q+s6htyTx7mSP
         j339+OOjJbY0WGOqvKkRxK/+ylMsBupNuaPJXD9pr9N5mE9Gb27ESQ/9MCDmaxXEUQU0
         sM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776028812; x=1776633612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hv96ERjBO9/NiOyiLL/BGaUYHQpO00Dknp/iQI1oqNE=;
        b=B92UcGof0AI3xXp3euJRFd6q+9HsU5vLm3vJqly0cMW3wKliXiL5QfPJ0/cqHeUQQ1
         uSEPyTFV6NZHVbkMRINYJsPUHb1sny2lkgC6g1Z6RAa0jQsrb2ixxET6kMIi0uIxbIuM
         sRS8kRqmxaiwlYl6VOPVveh0fxJLq1G1aws4g+UbDOcr9S+pfjyLjvXNc02zJqBzf0xQ
         8EYyODTcLoAEcANVqsxld0/hFtWcSx6L3MmhZ2C0WPhZ296iNCmltU2i00ZLchNXock0
         un1BFhOS/fOQe+7Tz/1IM2bliVmmrwpsYSvnUG+U4Pf98TCocmscrkh5T78oYHoY6ewW
         CvXw==
X-Forwarded-Encrypted: i=1; AFNElJ/b2IC7TfV9UwhpnEI7P1cW6BvZz3iFeTy9c+YxQgHV1AVoiJfZKIOUjwLNyUuF9gTEfZnih6UfWVZs@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyC2xh4WfpLoSCLvs4RIMfzI2+3CAFWLYwEWqqijd5rW/2ccmoU
	fBNtzQXV84E6gOJBDkE81dAhsCM+y+NNISalDPPAMoE4tRhFr7b26kW0
X-Gm-Gg: AeBDiet5EKOIn7VFc2NXk3MJD3U6zr4tyluBcoUwrwkQ+DytW6fRErHVyp2dUy2O3Z7
	Wl8e2nanULS4JuykeEVqpmZcAhj/gD0BnaGRShwXCxC34H/dnIzpW3uvZph51T3v9dDMKwzow/6
	zQdhx07RVVY9IN/GxdiarFRnTiFg8FuQpuCsTJNKqPOndb/b8//vLJicmp3gAABJDlcwnNjiaM6
	81p1+0py+QCyQURl/u9vlX7CyjZXNtm5qk3QTHRwGjB4ZrAFNX8q6J586yhaP+M7MmMqxTidr03
	GkoNzBpIUgmoMBPXENwX9Oa6EtmXBKOpAE/LvpyrJTG64npFvKTjeDwrfWfcwBmFFpdmDpnv47i
	J8Sidzy3uodUi40gpg8wIhQdRvCp6KZySIIohp98fqfL/HVNFT9L8bZIBxW+YceV10g+bY2l/9W
	Q3UntAZYAsTtXvgdxMco732mgxrZTxvDiQMAxKvRnWjgyuq4n/Z+uBpV0JdtkatSRZvOK5jCiGQ
	kQFBaNKyr7qWax3kw5PNRlNgTYQZzYhpXmrQtI=
X-Received: by 2002:a17:90b:164d:b0:35a:2ed:9b6f with SMTP id 98e67ed59e1d1-35e351f6d14mr14899912a91.0.1776028812173;
        Sun, 12 Apr 2026 14:20:12 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (100.130.194.35.bc.googleusercontent.com. [35.194.130.100])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a3e6d2sm7615779a12.32.2026.04.12.14.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 14:20:11 -0700 (PDT)
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
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v4 1/2] power: reset: Add QEMU virt-ctrl driver
Date: Sun, 12 Apr 2026 21:19:51 +0000
Message-ID: <20260412211952.3564033-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
In-Reply-To: <20260412211952.3564033-1-visitorckw@gmail.com>
References: <20260412211952.3564033-1-visitorckw@gmail.com>
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
Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Changes in v4:
- Fix sparse warning caught by kernel test robot.
- Pass the struct qemu_virt_ctrl context to sys-off handlers instead of
  the __iomem pointer.

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
index 000000000000..01409dfe2265
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
+	struct qemu_virt_ctrl *ctrl = data->cb_data;
+
+	virt_ctrl_write32(CMD_HALT, ctrl->base + VIRT_CTRL_REG_CMD);
+
+	return NOTIFY_DONE;
+}
+
+static int qemu_virt_ctrl_restart(struct sys_off_data *data)
+{
+	struct qemu_virt_ctrl *ctrl = data->cb_data;
+
+	virt_ctrl_write32(CMD_RESET, ctrl->base + VIRT_CTRL_REG_CMD);
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
+					    ctrl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "cannot register restart handler\n");
+
+	ret = devm_register_sys_off_handler(&pdev->dev,
+					    SYS_OFF_MODE_POWER_OFF,
+					    SYS_OFF_PRIO_DEFAULT,
+					    qemu_virt_ctrl_power_off,
+					    ctrl);
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
2.53.0.1213.gd9a14994de-goog

