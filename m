Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9EB35B64F
	for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Feb 2026 17:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771781568; cv=none; b=picacnTCui4i7taYIJAJ8MbeZf5+PKhK5Fh3fof//TOprvkCWfEVCqUPToWZPK3dajHKQmeh6PPIgkRTtg6anue8lkaKbtPWxX1AFE5H1Mx+Dah9hr7KexyjbOdWachH+7Hl0aQNEXoPrtgzOpz/z6ny7MKeFiebpp9D9hJansg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771781568; c=relaxed/simple;
	bh=1m0uQK6CF91pCqxZ05R2dJ2x/VRhrWU9g6QLkLHuA+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jBB04uUYK2iJoTpZ9IJq2NLi4c6a/Vlu9U53Ckgekh9ndQXf5nQOcKXbvZH/PD3z2r++I1NOrJ4lMbJZf4YVKYp6z2M/d9K6Cfe8heX6eo4wDEgiKUU4lnbrEY305xGGRSaeMidSxN3zYlTyVJRrd2GNo2+IuLx2MZI1+L9VE1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZL7nvKQW; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZL7nvKQW"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c70c112cb61so403423a12.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Feb 2026 09:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771781567; x=1772386367; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wImU8utWXre1Uxo904gEyPqXxKNFzEXRXMuF4CHFNE=;
        b=ZL7nvKQW2Gzuo8+FySDrZUmo7it4xM11Gu7274vioC+qka4Lq86Ub9rcV3JAbD0Q77
         QWejPuYJ5JPfooJGKB0iWrwG778wBxGeqqIB0I7PaPL+LzF1MXydfPLKhUQX93pER0l3
         wMwRfA3J5faj8R5OlvpJe+Ky7J/u2Ar2P+MFqQt+D7D3kG2JgSFrNgnRXoIoLlFj8jBR
         E5bA8xqoeoCVDPmpT7vRmjCKO3ucWs8CRwMW4g6RG+NP6S04TqVFYFiZKIGluvjOD603
         KSn8XzlTu5hcXKkxgUjGQZx0ZES/BvcWC+pCTBERi5SeuEdnYA/LsF3x0t5L3Ys1zbHW
         A7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771781567; x=1772386367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0wImU8utWXre1Uxo904gEyPqXxKNFzEXRXMuF4CHFNE=;
        b=mFtqo7g+TEgsnagasB9EsM4ACaqyDi8RTcBkwE7ycxFieEYSP+sUuWIu876/ss/Tb0
         zHHpw5U5IpPYunhMptqsue7xrw9P2G7qicxpDR+PDpwN1CXmvQltqWP9nIKNAeK6tJ3D
         1dsmE5o6bhiaWBf1lE/dLqxoqblFsFrlAk4yp5UhODP5KHZPs0jgRohyH2lW13H6Uu8n
         Snnl+oNBdBFPod+YsemPSWjXMt3x+CbVg9YDiSskYIDEgtSjFyR3VVhP/8QU65byRGFL
         sI768THkEr363jIbh5d1yQvRXhoh8VJUPX6UjDMq0JZUuP5VMQxnHLT2D6X0o3BRKMFh
         M+TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVny7xpmZbBUxiELD5QTM8TaDj30pG0Gpg8vD1TnljcBb6JZSGmFkonTMKPMgbHVJxRPu1j1uE31m4A@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyZNX9sbl/IcSH5VDrDeaHn41G3ay0QKLXzjkm+PYVYeFXjuP5j
	kyVORZqz5DAyiUS2XTwmVgX/pVRugu7B4MkNXHS5nODGo0BWIUCzTA7L
X-Gm-Gg: AZuq6aIieY/aHheNQW3P9OGD3pFwiGOTBPSKudukFFEG7T8bG40g6NpRGslkyTcqWAY
	LdBHsrnYmvZdlK0+GB0z826bZzPZZf84helu0cNT4lz/MsBnxH1RdzpER9NSO3PSWxAzHhv68RD
	9VzKmpnLs5+PPB3BWUEPLIV8WJnMM2arvhl3Gw6mupEkWKYaPlJiNFCBm+4lrHs5kqBmws17LJQ
	2e9/MFIBBVxi1XJFbYdlDFNsBv1YUacqzNh7z3NqGGlduAnPdjSZz11bs8nSuuWYXsZF5JR/edz
	rY7lXqFzEBYueMaQsl9uNkcEDpWBxYcGrUfLKH22YdTs2dtWn0mJHdmfrMRWIZKgCTM3ktmTFf3
	7U+49WqrAmWgOesQsOWbfgpOxWclaVrHk7ht95P6yItBaTESv2+VjaaGpo5f+GkcpZiZGQn1c3a
	GnzEYReRLs6fptjFOd2QtcPkhcemu4PjO78oZ2Rot4Rw9mIDEkTkOUWYDPe787bn/Cl8cV8/Ub1
	btbv9tZmr1Go6e1bCMmML+TS3U+pU7sKsg+
X-Received: by 2002:a05:6a20:3d19:b0:394:6344:e5c4 with SMTP id adf61e73a8af0-39545dc00f1mr5380438637.3.1771781566900;
        Sun, 22 Feb 2026 09:32:46 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (7.162.199.104.bc.googleusercontent.com. [104.199.162.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b726cbf2sm5275750a12.34.2026.02.22.09.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 09:32:46 -0800 (PST)
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
Subject: [PATCH v3 2/2] m68k: virt: Switch to qemu-virt-ctrl driver
Date: Sun, 22 Feb 2026 17:32:25 +0000
Message-ID: <20260222173225.1105572-3-visitorckw@gmail.com>
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

Register the "qemu-virt-ctrl" platform device during board
initialization to utilize the new generic power/reset driver.

Consequently, remove the legacy reset and power-off implementations
specific to the virt machine. The platform's mach_reset callback is
updated to call do_kernel_restart(), bridging the legacy m68k reboot
path to the generic kernel restart handler framework for this machine.

To prevent any regressions in reboot or power-off functionality when
the driver is not built-in, explicitly select POWER_RESET and
POWER_RESET_QEMU_VIRT_CTRL for the VIRT machine in Kconfig.machine.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v3:
- Add 'select POWER_RESET' and 'select POWER_RESET_QEMU_VIRT_CTRL' in
  Kconfig.machine to avoid restart/power-off regressions.

 arch/m68k/Kconfig.machine |  2 ++
 arch/m68k/virt/config.c   | 42 +--------------------------------------
 arch/m68k/virt/platform.c | 20 ++++++++++++++++---
 3 files changed, 20 insertions(+), 44 deletions(-)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index de39f23b180e..624e6b27f394 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -133,6 +133,8 @@ config VIRT
 	select GOLDFISH_TIMER
 	select GOLDFISH_TTY
 	select M68040
+	select POWER_RESET
+	select POWER_RESET_QEMU_VIRT_CTRL
 	select RTC_CLASS
 	select RTC_DRV_GOLDFISH
 	select TTY
diff --git a/arch/m68k/virt/config.c b/arch/m68k/virt/config.c
index 632ba200ad42..b338e2a8da6a 100644
--- a/arch/m68k/virt/config.c
+++ b/arch/m68k/virt/config.c
@@ -13,18 +13,6 @@
 
 struct virt_booter_data virt_bi_data;
 
-#define VIRT_CTRL_REG_FEATURES	0x00
-#define VIRT_CTRL_REG_CMD	0x04
-
-static struct resource ctrlres;
-
-enum {
-	CMD_NOOP,
-	CMD_RESET,
-	CMD_HALT,
-	CMD_PANIC,
-};
-
 static void virt_get_model(char *str)
 {
 	/* str is 80 characters long */
@@ -33,25 +21,9 @@ static void virt_get_model(char *str)
 		(u8)(virt_bi_data.qemu_version >> 16),
 		(u8)(virt_bi_data.qemu_version >> 8));
 }
-
-static void virt_halt(void)
-{
-	void __iomem *base = (void __iomem *)virt_bi_data.ctrl.mmio;
-
-	iowrite32be(CMD_HALT, base + VIRT_CTRL_REG_CMD);
-	local_irq_disable();
-	while (1)
-		;
-}
-
 static void virt_reset(void)
 {
-	void __iomem *base = (void __iomem *)virt_bi_data.ctrl.mmio;
-
-	iowrite32be(CMD_RESET, base + VIRT_CTRL_REG_CMD);
-	local_irq_disable();
-	while (1)
-		;
+	do_kernel_restart(NULL);
 }
 
 /*
@@ -113,20 +85,8 @@ void __init config_virt(void)
 		 virt_bi_data.tty.mmio);
 	setup_earlycon(earlycon);
 
-	ctrlres = (struct resource)
-		   DEFINE_RES_MEM_NAMED(virt_bi_data.ctrl.mmio, 0x100,
-					"virtctrl");
-
-	if (request_resource(&iomem_resource, &ctrlres)) {
-		pr_err("Cannot allocate virt controller resource\n");
-		return;
-	}
-
 	mach_init_IRQ = virt_init_IRQ;
 	mach_sched_init = virt_sched_init;
 	mach_get_model = virt_get_model;
 	mach_reset = virt_reset;
-	mach_halt = virt_halt;
-
-	register_platform_power_off(virt_halt);
 }
diff --git a/arch/m68k/virt/platform.c b/arch/m68k/virt/platform.c
index 1560c4140ab9..764f556b4b32 100644
--- a/arch/m68k/virt/platform.c
+++ b/arch/m68k/virt/platform.c
@@ -30,7 +30,10 @@ static int __init virt_platform_init(void)
 		DEFINE_RES_MEM(virt_bi_data.rtc.mmio + 0x1000, 0x1000),
 		DEFINE_RES_IRQ(virt_bi_data.rtc.irq + 1),
 	};
-	struct platform_device *pdev1, *pdev2;
+	const struct resource virt_ctrl_res[] = {
+		DEFINE_RES_MEM(virt_bi_data.ctrl.mmio, 0x100),
+	};
+	struct platform_device *pdev1, *pdev2, *pdev3;
 	struct platform_device *pdevs[VIRTIO_BUS_NB];
 	unsigned int i;
 	int ret = 0;
@@ -57,19 +60,30 @@ static int __init virt_platform_init(void)
 		goto err_unregister_tty;
 	}
 
+	pdev3 = platform_device_register_simple("qemu-virt-ctrl",
+						PLATFORM_DEVID_NONE,
+						virt_ctrl_res,
+						ARRAY_SIZE(virt_ctrl_res));
+	if (IS_ERR(pdev3)) {
+		ret = PTR_ERR(pdev3);
+		goto err_unregister_rtc;
+	}
+
 	for (i = 0; i < VIRTIO_BUS_NB; i++) {
 		pdevs[i] = virt_virtio_init(i);
 		if (IS_ERR(pdevs[i])) {
 			ret = PTR_ERR(pdevs[i]);
-			goto err_unregister_rtc_virtio;
+			goto err_unregister_virtio;
 		}
 	}
 
 	return 0;
 
-err_unregister_rtc_virtio:
+err_unregister_virtio:
 	while (i > 0)
 		platform_device_unregister(pdevs[--i]);
+	platform_device_unregister(pdev3);
+err_unregister_rtc:
 	platform_device_unregister(pdev2);
 err_unregister_tty:
 	platform_device_unregister(pdev1);
-- 
2.53.0.345.g96ddfc5eaa-goog

