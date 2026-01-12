Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE512387341
	for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 18:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768242209; cv=none; b=WxlQb8G7SmOTpMmfyafFPrBHKCZGJkbXGyqR+No8FZpqUa+TncyGHl7KfHiO+TzfEktaQYcLaViGDbFEPh98rqAcrU6++6FMwQltu7xChdueG986s0XxhT5oJAYvBIioq/TRE+PpZzM+R5SIva46zFuzUvyylysReCB3yEymtD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768242209; c=relaxed/simple;
	bh=Kxc48WP3JMgRcgbxaB+vq6PuqCnjrP3YyAQS4BlYEQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WH+cVOgdf2Mt9wneHRzzs4M8EjQxDE7T9rA+LQCotSPCO75q/r6K7fuGp0eyweslqmuJwKfOLNrykajL5B5TVtQTTtQVdbhLKek3/3bgY87Ml+gY06fMl6j2jFlL+/WpGzbCo+JK0JQOxiOJcuN7yLd/uwiVM7vYotjjVma1BUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dp0SsSQd; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dp0SsSQd"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29efd139227so47383905ad.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 10:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768242202; x=1768847002; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoCe2UhjfoZKQZoLbe4Gba2T09UGHCeiBMJ/gxSy8bI=;
        b=dp0SsSQdbNEnnljMuMyU8TlBUXjolUPLGTe3y9jmzwOu4lVwIwuM2oHfVoYbzmJE/J
         HKQSkBNdhZ+Vq5WoFLAwrw/i0wqoJBUrBMiy4GJHThMS8Y2yvKuQh+htt28KYH/9sKHz
         DLPef7Uu8iSzt+5KvksfCW5bAqebEZs3qGJubkNNwg0GdHDNJToIE88NQlkHbxfYpdT9
         oTtSR3KUNumE8mDOGBFGbKZg1KbuVmssw5tayL2C91qh7VWbXczZpbhfXXRCSXo4LSyQ
         NZbzDxB/jHIUQ3W/+uzDRgCKLGmdn1bWwXVdMDAGvkNePmgfnR1sEQnDOqO0ao5O8tvp
         1UbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768242202; x=1768847002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yoCe2UhjfoZKQZoLbe4Gba2T09UGHCeiBMJ/gxSy8bI=;
        b=dpg5Et30ZTaErQjFPU5RngX3E1iT90JJIrAVpE8/VY4nyXlx4CMMtiHjs7q0PwDHYh
         GSf1YtSVFriGjH1v+APrtUNucoctZai2wSbKv7CPp+z9LWTrplCUhcvY0bQqYbe+U730
         SqspmFS3Ans5psyFofnnWVBIeh5fbwhKJFaLFf327IVW2f8+DpcPlBX2Umt2ziTdACKH
         yI43NDLJZUzf0PuoDSNpQFTThUNa/599zvycvjovX7uprJd8KW9CrhM5QUIRtmG3Z2nF
         k+4UQJyvxGsDiaL79y+YvhgRMf1YXkpKZvdiFC7Pe5HaQ1fJoHIGouZoq/BZ/YP0jhnH
         KRAw==
X-Forwarded-Encrypted: i=1; AJvYcCXunTC7dwJxA04IKdAXcl0wW1s4ilUNoWXKFDObcPal0OTFkG/yO2RR9amy8T1QLjHJRLP4q82mymUn@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzqRWhUsn9+ahR13daQerA30T3tLDKR4sJWP9rcT6U83l8JClJP
	rh9W5cooe6Ad8QiEF7UcymxkKUtKpI5suhHWrg1I5ZWhYqdHo/5Up+71
X-Gm-Gg: AY/fxX7OuYOp1j8H31fqPgiloF+5EzJZxefa+8v9ysYhSL/JwAviGJxjJZYcOSy4pt7
	xsQa6oifSPGbS/NeR1OCiMT0tiJZkzC3+jFBhd0nUSTlA9gIDfhyF+I+3Gvmt8t0FCKJTLXyQ72
	JTbzgMtdKwx9FhSN7weCOvmGtYm/pamzkXXcBL5/bKAiqgYRpZc8YY+7Tct/dlI0bzydoDtJ3Cw
	61rbIiC5LWyjmN3jQksEC65cNBg3yHQWS5u73sz6nUFWz0DcNlhhJkh5Ye4Kd8iODe2pD05NJL9
	6a8tbzIobvlKsUueF5+7GbNSjmiYzbPAClvI3/RyYyK3y8+Ufg2+KO8WRyYHWoXqI09dpFigfpP
	G37IhMdeBLdfAdMkZz0fdoxDoOdVWZj2xQsbSX1jeIsFK/sx/csy7MQUnh0IMfBrHtVx5wz30AI
	/T1l4LRAYHke2vdRXu6bHgC6x4fU6RInMma5qMr5awGGnLoxn1tmMz0+Z75YOmNr57vBL1HIHWo
	DYKI/u9ljz0t+6djefHOmbISAC/AQYN
X-Google-Smtp-Source: AGHT+IFOhUPoNBwog45Pm9TL7FzCA1sp3oukPpoTWT6iUCTMKypbSZPVqb0VZiOgYc5YjqZK29Rrkw==
X-Received: by 2002:a17:903:291:b0:2a0:afeb:fbb2 with SMTP id d9443c01a7336-2a3ee4f5a79mr156866405ad.60.1768242201853;
        Mon, 12 Jan 2026 10:23:21 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc794asm180981205ad.70.2026.01.12.10.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:23:21 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	sre@kernel.org
Cc: jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-pm@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 2/2] m68k: virt: Switch to qemu-virt-ctrl driver
Date: Mon, 12 Jan 2026 18:22:57 +0000
Message-ID: <20260112182258.1851769-3-visitorckw@gmail.com>
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

Register the "qemu-virt-ctrl" platform device during board
initialization to utilize the new generic power/reset driver.

Consequently, remove the legacy reset and power-off implementations
specific to the virt machine. The platform's mach_reset callback is
updated to call do_kernel_restart(), bridging the legacy m68k reboot
path to the generic kernel restart handler framework for this machine.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
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
2.52.0.457.g6b5491de43-goog

