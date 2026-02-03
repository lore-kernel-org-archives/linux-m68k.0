Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3FB3D3D09
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Feb 2026 17:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770138522; cv=none; b=alcF2UZcBuagehiOWWTRYFvKExRChHEsnSdGFILMQ5zj/GjPsrECRTJ82sne1OgUr/nDt0RDp7oY3Bx815rbspT7oz5QMHLODQQkVSldq8eDtRW+v/muxl578iWiPdB0JmB+yApV1vaCbsxcDGnzEAlK2y1vOTWDrFr7PQnb/iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770138522; c=relaxed/simple;
	bh=/fH3+b9yDcS1GIgeZS0m79tZEAT4nkei8lSgwKowqvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NhJ7iTTa/hv7LZjeyKdRBeK6FXwzfbVj+8EeyFE1UP5kTUyVCtlD3U1sZEHz09uAVm3535kfj/rQ8F9JakuX4qxtvoVPtE/tDcrB/RtNr0i6XRsHc2NRtnnInWTF9bu2AR2aB6jUNW0aE9OyG3z+hLAznioDtOH2xhZEMOTpXGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxQQpfiM; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxQQpfiM"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c0c24d0f4ceso2298221a12.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 03 Feb 2026 09:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770138520; x=1770743320; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTHfF0XW7B+7Ih5DzZqFm1iLafo8D1AWNlp8qH8D6r0=;
        b=WxQQpfiMrldeFut/TtM7Tg9QVIN67QswECOFRjbKKvHHS0LZ5rQZtG0WHJw4Ooxxpl
         6hWEmraZJZlrellTNY+7/4Q3dv1EXyEESmAnizw5qe3L0FCFjKa5syuPEeL9wFlsFez8
         R+JCS6j/cundaAjnT/6a5aXTjJskIiWBhqdou/XTSVWrpsrxZUzDVnyJ0cJxZ3p0A+5H
         82q5yp/Dk9fsSIqtD5tzU3NCxsZhpQzpqTCWRx2RpX+Wrd28PrLPqC/BpsqNvV8cZmJ6
         ILojnvnNfupQ4y1iWl3RcCYPo1k5+atKz+sIuVQvJPZv/+7tyTgsVAJ+T0S5GXpmXshw
         +WYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770138520; x=1770743320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CTHfF0XW7B+7Ih5DzZqFm1iLafo8D1AWNlp8qH8D6r0=;
        b=cN93PM8864WIEn1x15d9KboUtX1+c/V9pppvs8EOLHSLGh1jBaEg+tSScoOc37UuAd
         sc6VHj4iidJOlaCEmDfMhAI+oKsKv4N6St3OMTIn+J+w/9oEeBX61OmaT5RyHSnY4MUH
         /oR53itbGWRK98KmZI1yTaWKmBEHkD1uIBsQPdNGBGK7OXaQ/zTCxFXxYeL7U5rHyHWI
         nY67lIOR8+XT80ihy0SQsiiWw+uJlQlbT+9GSfVI79w4Zu61VqCm+3a5TqsWX4+3cX0u
         9H2e9aUIpaPqIGLSWWhtfXHGJNnYtNaKQmv7hL9Co6PAwUx8hRBOzfIDj2u4qtvaKSQO
         2IuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW7vKDa+JjMWZhfXqa9AEa3awDfUz7R/RrXk6pUMTODrJNvfR0n8BR2yW9aoXM1OFxquW4kU+gWFvK@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yzy30/+w3Lk5kiyk+O92c50+RtedaEFmtcBr7wmmf0yWYCA/p0s
	Tf5Z0T41i5mGSOmkC4WknUy4ZpjPis2DO5YTVe59YjZCIpsKS55aIpOI
X-Gm-Gg: AZuq6aKKyGE8wp5Ch5qxP6HWsfPIFzxAs2gEb8qAyW+El9c1szK1y1l+qTqex03CPeH
	WCglBvtlUmtJjafSIPzsgCG0cBqdKnFQ5on5bs6wj6dGjNrsezrzfzzlqO12Eu0qs7IshFT3HST
	UwJahl33++E62JV7nUUY1Y4aKya9JrxaKuFnDEdiiCZOHHFT/6VlPwmfVCOyOIqH4pyChv+aI4I
	vEfJlV+Fns7i6hywBAOEZkpqWv/h3Ak8Gp9MrhlvVSHFiVyuLiUw1S8or1+yU1Scc0yno+zHAzt
	8mnVRxno3wG7Kvx+bhevstNj+ncWaibVDdQEypcArJ6YNB45SZqM4PP+W8O0gmZiQbLIqSlPWBO
	muXC+bRQK+giTEjYPcwy25ycoMxut6H7KMyVL5NvSOOzpDH5ZGRi1j2uUdlq9kw5HnAUhfkVqOM
	t1Me7+FJbLMXVWwR/doTn9evG1eEorUojlEMvB/fBG+S7YEY3dyZmS+7+/MoQ3cW1f9hd8E5BfL
	RB5cKmw7Ux+wQ3arN9o8b0oRDk=
X-Received: by 2002:a05:6a21:a4c9:b0:38d:f08d:b349 with SMTP id adf61e73a8af0-39372427382mr82350637.43.1770138520086;
        Tue, 03 Feb 2026 09:08:40 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (118.239.201.35.bc.googleusercontent.com. [35.201.239.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3548633616csm177520a91.17.2026.02.03.09.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 09:08:39 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	sre@kernel.org
Cc: jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	daniel@0x0f.com,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-pm@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 1/2] power: reset: Add QEMU virt-ctrl driver
Date: Tue,  3 Feb 2026 17:08:23 +0000
Message-ID: <20260203170824.2968045-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
In-Reply-To: <20260203170824.2968045-1-visitorckw@gmail.com>
References: <20260203170824.2968045-1-visitorckw@gmail.com>
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
for both system restart and power off. It is designed to be generic and
can be reused by other architectures utilizing this QEMU device.

Link: https://gitlab.com/qemu-project/qemu/-/blob/v10.2.0/hw/misc/virt_ctrl.c [1]
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v2:
- Use devm_register_sys_off_handler() instead of register_restart_handler()
  and global pm_power_off.
- Switch Kconfig to tristate to support modular build.
- Add .id_table to platform_driver and use MODULE_DEVICE_TABLE() to correct
  module auto-loading.

 MAINTAINERS                          |  6 ++
 drivers/power/reset/Kconfig          | 10 ++++
 drivers/power/reset/Makefile         |  1 +
 drivers/power/reset/qemu-virt-ctrl.c | 89 ++++++++++++++++++++++++++++
 4 files changed, 106 insertions(+)
 create mode 100644 drivers/power/reset/qemu-virt-ctrl.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0efa8cc6775b..57b403dae375 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21190,6 +21190,12 @@ S:	Maintained
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
index 000000000000..2192ead56ca0
--- /dev/null
+++ b/drivers/power/reset/qemu-virt-ctrl.c
@@ -0,0 +1,89 @@
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
+static int qemu_virt_ctrl_power_off(struct sys_off_data *data)
+{
+	void __iomem *base = data->cb_data;
+
+	iowrite32be(CMD_HALT, base + VIRT_CTRL_REG_CMD);
+
+	return NOTIFY_DONE;
+}
+
+static int qemu_virt_ctrl_restart(struct sys_off_data *data)
+{
+	void __iomem *base = data->cb_data;
+
+	iowrite32be(CMD_RESET, base + VIRT_CTRL_REG_CMD);
+
+	return NOTIFY_DONE;
+}
+
+static int qemu_virt_ctrl_probe(struct platform_device *pdev)
+{
+	void __iomem *base;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	ret = devm_register_sys_off_handler(&pdev->dev,
+					    SYS_OFF_MODE_RESTART,
+					    SYS_OFF_PRIO_DEFAULT,
+					    qemu_virt_ctrl_restart,
+					    base);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "cannot register restart handler\n");
+
+	ret = devm_register_sys_off_handler(&pdev->dev,
+					    SYS_OFF_MODE_POWER_OFF,
+					    SYS_OFF_PRIO_DEFAULT,
+					    qemu_virt_ctrl_power_off,
+					    base);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "cannot register power-off handler\n");
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
2.53.0.rc1.225.gd81095ad13-goog

