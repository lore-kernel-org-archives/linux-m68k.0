Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716715;
	b=LSBB8/upcv0WiRaKVGgRrlq/54H1CfPkfT/3mElMOTmZ043+/Zpc6Ek6bVZa+Y4FAq1N
	 NC/LfA9dWCLZLFbg6mBdohv4N6/mLberBU3sPH7jbNvMVqnUyXjldoe+BDlPKXNZHSW5s
	 2DputDmdQmH3cia9LJI/drN6AycBQZDp4V5f3Hul4h16dlIgfBiFOuWi03rMDmaEUIcf1
	 3nRCMAasceyhC8ZZ0PX3bpOFjNoYDoRlhLPY16Y0sLZo5pOlv3V7rGPRT8K+KON8kZgde
	 3jTf51QoVgRAGEwk3+DDEakBeOXRo6pVw58yEO5XlL4zjhXdJhcTwTHF4F320thIRhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ohcenfLUMndMbNU9mTZepLoct+4NVwlucM8NCOZrsDE=;
	b=ANL1FQa+Xc0kH69e0+HmYHMaaGy6NGDlOCpwU/v8No1VLONpJ5E/ANeUa+TSgsXQzNZk
	 CdR+2/PRNzTjhhE+mEB6CjM9+aZWzmWEC7mapE/MHgb9m9D4e5igKEIXAHnE3LO+fgYks
	 Dq8JycUrQ2bKGXLbNyQ1k85fUT6ThEh+AcFmPiqR9OBHspkJNzzFlZ4BqQmPyZloKUgHx
	 jz0ZwbDlZyi+qWGAVYVFncBvuFlrKh5oW92ttDiTlC5bjD4Ksm6PtyjcdI45t4c6ucRZS
	 QMzr6zup7nr8+Bk8eHqrbeW9vCskSyNTha9NLFRmAmLpjzquBYgCxK2VOPAK6XJtSiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ExrzfVyN;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3467606A33E
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 18:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3467606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ExrzfVyN
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3ada81853so8467217c88.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 10:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716714; x=1796321514; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ohcenfLUMndMbNU9mTZepLoct+4NVwlucM8NCOZrsDE=;
        b=ExrzfVyNjJCs2ZxzZ6siPKHIhtUQrDBY2yqVmoJONBeFa3fxxC8VVhNYQhEH1ah/I/
         PJaV7GWjh5AsKPgOiUMHcRfAuOYuYh3Ndf+E0nmJ2vFcO+S6AiG5Tw5qEeycvIFQd5dp
         4/OOm4+ycejvejgEoKJiPrFSwEObBCZhG5BBI90J/yVoOX73g9kam06x7XZBYL2IHPgb
         oBNp7wnNw4KWOkYOmyqiA2W+q8+Q72cGZjKrmG5wVjRuz3PbFxEWc8jDjmOFxVMLHugG
         rCJVVcLy/gofcKxjS9Uz5t/mia5+XGmmNdJbyIKv3ppudYB2+tNAFyNNGYLy1+F8RdvG
         wm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716714; x=1796321514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ohcenfLUMndMbNU9mTZepLoct+4NVwlucM8NCOZrsDE=;
        b=RYn5rvv8JQFQMYLWEi/hkPi+MzowrHyd6fHF6QqkiWlM9Kx9LZyvzHd6PZoymCKLCs
         oXt2hrBu41rpzq1KJWcRQHY8VCzVJnuWBlf5GPNt7/0A1pKX1K3OQu7oVompawJRg8tZ
         2Mhs9Q3oK3HF1ut2OXaekq6ksCgkRiI8DI48uoLghfz2TRRMzRD1xNcb9IWbwobGCUld
         ZFCbEeRYBGG4lltDpmv5pHaDRRG4ZGcS3o45Dp9o03M/nY/GpssCemqgH1x2V9GZ9E/m
         LDCSX0q5iGRZwmnTusj4zUDED3xOniDcSd2g+hOvwPOSQ+Jabo92u8suOqOM4JLFJA98
         xEQQ==
X-Forwarded-Encrypted: i=1; AL+hErFchu2uMR32EDaBBYKWAtKQkDKLEg8g56OLTmWFWEqrnGnptAQ58mXrCh4St+k8fEgnN8Mc5qfi2KeL@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z+LMFihuCx5/5RNZ3RmzWBvToVnrJooibAuXyvDF8eFONog3ep4
	s1DBA3NoCuAoPdrdb0Pm0ECw6rb9UgcIufjZQ04nc/r6mbRslPFs5eTR
X-Gm-Gg: AZFdTZeqOzGOWJH5TdXQmWpUafW5H4gzGTrXgBTdSg1U8yNCQ7RJ2aoe3hz8mcYxS0g
	Ul7o4rGi5pNzABF9MphKYm+EOq0S3agZnDBz3w+WY0z6lNF/D4m2kpca/9qJyOrhsOpilfwOJ8g
	kVg9MMfidXsyyiletGQaIa9a8NJQCll6Z5DpAIiotJduE5Aea+M5LHfFTAzuqxKu8LuHOuXwm8B
	tb7UQXIKu77mVOeLIGK7OMw6pMNueB9TF8rV5ySAJbAlM1RG5O/CrRPIdutYGRwO6WcALiNWaKv
	C70tWMHNC2MXI0pOsUCbGgTSC9MgA2CHfQbNvmGOPGeu0MmbBajqz90eE7nELiB4I1C7Duz2XqI
	oAetpjwT6J5zYGMIfDYb412OJ0shRr/O8N9TziYQ6yYVPF4CIpJ1B4kyC8ItQkumez8wWqlCGLD
	QQwwDRhpdkoyXv6EGLsnHUpg330MDHi7k8TV7Hiyx+QqQWb+lS6/4Ndte8YbbVjfuZJ1qM/zUhg
	pdb76B7M4d6F/XrWjrSoTL3Gr8L5JygYOW6gX4QY0+s/VT++2yW5jc5WKrSKyPqIHkgz/NmbwFk
	NJ0uLK0rFN+wU5r0r+Ja9d17YqWQTw1AQIFvafI2RYRe2kv06nUtyLyldBcPPdZSc3yUsVulTw0
	I+63xxQN5dRtLFqSojnWucNs=
X-Received: by 2002:a05:7022:f111:b0:1a8:ff0b:a4e1 with SMTP id a92af1059eb24-1b55688ee19mr25310636c88.18.1795716714042;
        Thu, 26 Nov 2026 10:11:54 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:53 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 8/9] clocksource/drivers/timer-goldfish: Add device tree probing support
Date: Thu, 26 Nov 2026 18:11:00 +0000
Message-ID: <20261126181101.3715754-9-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126181101.3715754-1-visitorckw@gmail.com>
References: <20261126181101.3715754-1-visitorckw@gmail.com>
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

The driver currently only supports board-level initialization via
goldfish_timer_init() on m68k virt.

Register a platform driver matching "google,goldfish-rtc" so device
tree platforms can also probe the timer. Since DT platforms typically
expose a single goldfish-rtc device that cannot be bound by both
drivers at once, depend on M68K || RTC_DRV_GOLDFISH=n in Kconfig to
avoid conflicting with rtc-goldfish whether built-in or as a module.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/Kconfig          |  5 +-
 drivers/clocksource/timer-goldfish.c | 93 +++++++++++++++++++++-------
 2 files changed, 74 insertions(+), 24 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index da83483296d5..852fb1f2d8d2 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -760,8 +760,9 @@ config MICROCHIP_PIT64B
 
 config GOLDFISH_TIMER
 	bool "Clocksource using goldfish-rtc"
-	depends on M68K || COMPILE_TEST
-	depends on RTC_DRV_GOLDFISH
+	depends on M68K || OF || COMPILE_TEST
+	depends on M68K || RTC_DRV_GOLDFISH=n
+	depends on HAS_IOMEM
 	help
 	  Support for the timer/counter of goldfish-rtc
 
diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index f5019a6bb340..b4b0388c01f9 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -5,6 +5,8 @@
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/goldfish.h>
@@ -102,15 +104,11 @@ static irqreturn_t goldfish_timer_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-int __init goldfish_timer_init(int irq, void __iomem *base)
+static int goldfish_timer_common_init(struct goldfish_timer *timerdrv,
+				      int irq, void __iomem *base)
 {
-	struct goldfish_timer *timerdrv;
 	int ret;
 
-	timerdrv = kzalloc_obj(*timerdrv);
-	if (!timerdrv)
-		return -ENOMEM;
-
 	timerdrv->base = base;
 	raw_spin_lock_init(&timerdrv->lock);
 
@@ -125,18 +123,6 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		.set_next_event		= goldfish_timer_next_event,
 	};
 
-	timerdrv->res = (struct resource){
-		.name  = "goldfish_timer",
-		.start = (unsigned long)base,
-		.end   = (unsigned long)base + 0xfff,
-	};
-
-	ret = request_resource(&iomem_resource, &timerdrv->res);
-	if (ret) {
-		pr_err("Cannot allocate '%s' resource\n", timerdrv->res.name);
-		goto err_free;
-	}
-
 	timerdrv->cs = (struct clocksource){
 		.name		= "goldfish_timer",
 		.rating		= 400,
@@ -148,26 +134,89 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 	ret = clocksource_register_hz(&timerdrv->cs, NSEC_PER_SEC);
 	if (ret) {
 		pr_err("Couldn't register goldfish-timer clocksource\n");
-		goto err_release_res;
+		return ret;
 	}
 
 	ret = request_irq(irq, goldfish_timer_irq, IRQF_TIMER,
 			  "goldfish_timer", timerdrv);
 	if (ret) {
 		pr_err("Couldn't register goldfish-timer interrupt\n");
-		goto err_unregister_cs;
+		clocksource_unregister(&timerdrv->cs);
+		return ret;
 	}
 
 	clockevents_config_and_register(&timerdrv->ced, NSEC_PER_SEC,
 					1, 0xffffffff);
 
 	return 0;
+}
+
+int __init goldfish_timer_init(int irq, void __iomem *base)
+{
+	struct goldfish_timer *timerdrv;
+	int ret;
+
+	timerdrv = kzalloc_obj(*timerdrv);
+	if (!timerdrv)
+		return -ENOMEM;
+
+	timerdrv->res = (struct resource){
+		.name  = "goldfish_timer",
+		.start = (unsigned long)base,
+		.end   = (unsigned long)base + 0xfff,
+	};
+
+	ret = request_resource(&iomem_resource, &timerdrv->res);
+	if (ret) {
+		pr_err("Cannot allocate '%s' resource\n", timerdrv->res.name);
+		goto err_free;
+	}
+
+	ret = goldfish_timer_common_init(timerdrv, irq, base);
+	if (ret)
+		goto err_release_res;
+
+	return 0;
 
-err_unregister_cs:
-	clocksource_unregister(&timerdrv->cs);
 err_release_res:
 	release_resource(&timerdrv->res);
 err_free:
 	kfree(timerdrv);
 	return ret;
 }
+
+static int goldfish_timer_probe(struct platform_device *pdev)
+{
+	struct goldfish_timer *timerdrv;
+	void __iomem *base;
+	int irq;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	timerdrv = devm_kzalloc(&pdev->dev, sizeof(*timerdrv), GFP_KERNEL);
+	if (!timerdrv)
+		return -ENOMEM;
+
+	return goldfish_timer_common_init(timerdrv, irq, base);
+}
+
+static const struct of_device_id goldfish_timer_of_match[] = {
+	{ .compatible = "google,goldfish-rtc", },
+	{},
+};
+
+static struct platform_driver goldfish_timer_driver = {
+	.probe = goldfish_timer_probe,
+	.driver = {
+		.name = "goldfish_timer",
+		.of_match_table = goldfish_timer_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(goldfish_timer_driver);
-- 
2.56.1.839.g22a8290db9-goog

