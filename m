Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EAB3D3D02
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Feb 2026 17:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770138526; cv=none; b=Smmt6ry4mR7hwYyPRMQNNnpnwh5aTM3slgRusy8RpXwbC1n5/rBSk9CvFMa4znJ3htm8GFBhsTuLc5wPSzy3P/EjZph8pRFrNH+W1yb3t6UIkCF9MdRt/RpG4O0QpzKBckgJ4dDlHCA86KliJ5ddWjTr4j8Fe7HYud1dBaQQt0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770138526; c=relaxed/simple;
	bh=T6tIZRJUpiLEl+8c9MJZV1DBe1EhMpSZLJGZ8wivEa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bYsOF3TQhL9fZ15kR5P7Wc0Jq5uzL9IPASkXGdAKxhYqvC9KeTU8Ucjcx+GONNUZeG/+Edked/2jYOuRFap7aOSAEIBaNu2x/q4Imqcm9nY+qMYbsSZMxZ4ejNYc7sw0mfYfBeoJDeFkgglC7t0+rEi8VOgMdabFtk6X1wK3Rtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geltEC61; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geltEC61"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3532aa9a77eso2748230a91.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 03 Feb 2026 09:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770138524; x=1770743324; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zD7pq3hW6e61IJuUPkSkjm+44mDvpuhBJ6/ipMbijs=;
        b=geltEC61d3W/D6q9feBRu1k2LhsxqkZXLGk0cL8CnQDOss+Lxg8K0mjzsQYK3EHHPh
         1YPuu4vXCqTbWyv6Bzn3XEPWXn/HfLgADFvDwqwhZ3DQ3978d/qJAFXAcUuC0aIollmm
         uENf1o820ilKRQDtDj4xS/IUcxu4+CdQCKSiP4coMnZX87SkbbWyAMjMLz5N0w+3RaYF
         GQ+fI7Mm3P6DzJJqSEZXZ+QAwLul9iKrW5EJPXWLUjmp/O/eAhLKc3hyUxgLBZTSYgVs
         o5WqOolw5GH4fSISow8scUZ4cowsCQpNjCYwPMIvPuUASQakR0mK5KvrBkSUUcZ51+ws
         mkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770138524; x=1770743324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9zD7pq3hW6e61IJuUPkSkjm+44mDvpuhBJ6/ipMbijs=;
        b=e2NHI3aFIWMu4dByStiZ/2/T+vn3ymnioS8KrA13X5vX/qUgE/W3cs3MXvqlSl1RSM
         IiBSe06Dizc6x77pEK9231Tb+6KO4i4PKKovOY/3SZq4TSJQ7KsFpfkKNw/zu/vrojnj
         B+S0L8Pc+yoImlxY2jtN9NnoD/lvA2RF2kOMQhoiG89OSRL9rEM8TVkKhJuvq2xJX7PN
         kfCcrMQ0XpQeEiY1OdrAYkJI0F4WkGlCkuAr2r7kcJQT0oYyRJom57tarXxVOmnsIlER
         Qh8Y8/3CJODLdM5cNd6MBp0g2Mgb+N+rm8YM2g2upEHyRaTtWcMKyzO6awrGtM2R45Xv
         atUw==
X-Forwarded-Encrypted: i=1; AJvYcCWmVQ6ukQAxMXh+AQhkhJDYUzhxexNyTtzDf6X7ZAWZXGWujkafkLIeKq5Co0naz8IF9GjK2JWh8X4V@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzjLK+0Q6Bq7dL4S19yo15HcdrQaMUW37ZeenSPiZfYBk5In1TI
	cEIW1tGERREFZdpvipQSWwhzqA3yiYUjomRhQGWeu98uzxaiEYAfv4kV
X-Gm-Gg: AZuq6aLrXCF38RlYUVEf4AHvZIRqkwK4V5YLd8I2cNpN7IxIXNnmPUIN44O7sUekUKU
	x5LL3H/gkP5HLPX1U7TZwh7zJKesUtjIwQYddcrq8uhCzY0Cov4+KEDaut2z/1ICTFpHSLrzLKF
	e+NDvtwTXYhork5NfSSaAKt9QjZqRDzoaJ7ocgaakoL6knsBVUpPhRyvvtGLWo+ajsv1mPxJFsp
	9D+dQY9IRmhfqyhefZuXiiksjRdMBYg3DRUkyiOsO4RgTr0mnEhZ+qV5H9tY8TWAIuQ35zSBT+N
	wHTTWKYSNvav4LM/58md430C5k4CsSbeUkF4c05R7RLGknCJ4gnohWSLiYUlNGqLMnQnUvxlagv
	LFlo7i8Johb/JIoTOGxdMSlAdBjxX3CZgG5YuzC3MFllsjjsyVPO0x8o6ezPz57W+K7EEOUGFVn
	7Us7yutq61XH7rqBD8KEzYOYFOOOY9DFDrnWPFXci9ifHBpd4dAAPfjI7JLd8zr+oAAtB60SXdG
	B/cws2zQ8Xou2YOmxgogcKqbUU=
X-Received: by 2002:a17:90b:3905:b0:340:f05a:3ed3 with SMTP id 98e67ed59e1d1-3543b3b21d6mr15984672a91.17.1770138523661;
        Tue, 03 Feb 2026 09:08:43 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (118.239.201.35.bc.googleusercontent.com. [35.201.239.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3548633616csm177520a91.17.2026.02.03.09.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 09:08:43 -0800 (PST)
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
Subject: [PATCH v2 2/2] m68k: virt: Switch to qemu-virt-ctrl driver
Date: Tue,  3 Feb 2026 17:08:24 +0000
Message-ID: <20260203170824.2968045-3-visitorckw@gmail.com>
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

Register the "qemu-virt-ctrl" platform device during board
initialization to utilize the new generic power/reset driver.

Consequently, remove the legacy reset and power-off implementations
specific to the virt machine. The platform's mach_reset callback is
updated to call do_kernel_restart(), bridging the legacy m68k reboot
path to the generic kernel restart handler framework for this machine.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
No Changes in v2.

 arch/m68k/virt/config.c   | 42 +--------------------------------------
 arch/m68k/virt/platform.c | 20 ++++++++++++++++---
 2 files changed, 18 insertions(+), 44 deletions(-)

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
2.53.0.rc1.225.gd81095ad13-goog

