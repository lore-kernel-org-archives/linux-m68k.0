Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895491;
	b=Lt1l2JP1d6V36W0SRrojYrDBZaW/fdq/7IprE1FQPyH9wePpbhWehmJnMFtSrirYnRoz
	 hmLObvMu8G2ZnIN4SzXo2fKz2wBBXh6uAsgP6M1MhYy/MEEE6UZeJRlesHAsq0K8aYSSr
	 1ZONYL8lBfSZKv3XYvJH1dIdpq0HC5DOQFaxCwzql0W4nFFp4TJMCtx4WGFsVXcMMEj7/
	 rX5zhzu2gPrI66lEXXZtSowfa+OWGY+fXr0JdIQXJz4M4NzqGS1kYgjm9rG0PIp6bZ4JO
	 ekd7ZBB4utMRL1pPjEBNKR6v7IwGj5dvVgxU6p9+dQHOiMLWJ/obljvA9pQkHh4zpsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p6xbLk8s6rCDjjBqfhBuH/lvaFd3o0UZuWtoGiq0X/8=;
	b=ggp+b6jbx2nVBJxtUNXuwMfJIkl5J3WdTd5ryjl16WNkWtmCqp/yScezvADPccgS54RC
	 a5czP3Q8Szeh2/A6Rwle1iqfEkxCCsPFV4gXJy1OecKK4GkiFypiQauEHvp9NhrzWMSMt
	 ycsa5uA4/BNRE6ZsChXMqje0uLOHaPgwalL1jZG5J1pYc8rDiU3wXiSNPzwIiLGDC5YwN
	 rcDxVZvugv5FqClKn6XpL/Chkr68eFZSLzgGYzZ0ZVEXOB4m8j7FXUeIj3UNi7+r4i/Xg
	 4LwDWAN/1v8+RefgABPwp5YZRq/Rdoc6F0oUykdoL962QTevTR8UCBtWj2yTpCgYOBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QIVrNwB4;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE6D606D81C
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 16:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEE6D606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QIVrNwB4
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso1108510a12.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Nov 2026 08:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895490; x=1794500290; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6xbLk8s6rCDjjBqfhBuH/lvaFd3o0UZuWtoGiq0X/8=;
        b=QIVrNwB4b6Es2GrQ+yf9FPP9hQMiZyjMagp79YtgkSaNgn4qq59EmiH10jX0ovDUm4
         Vge84/eloz/MjYyGkNbUKb/a/Y8EjwaRkC3l5D7aT3Cms5cAXVbUdLw8HfN0EFx26qlw
         P6kk0A5+2Xsn9AA4j2cRZp+KFa1N83lpOkeJE46boOgeBSWw/xGPPPFP8A7/RN+KriuR
         50s03AhkIB780ymVR4xweh+MrqJtyTa1GCH1fqQ6D110hcU7byWNULwCXG56uo7OMaYX
         aJuHDpNd3UU8LGn5244eSX7jf6tEzYnF+9RJhPHtouqOb4ReV9dgiNvdUnHAjgY0Aj6W
         tyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895490; x=1794500290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6xbLk8s6rCDjjBqfhBuH/lvaFd3o0UZuWtoGiq0X/8=;
        b=YuyNmddrIOyWBeavAbHULppSMYvDXr6mRs1DEwtfcnkNyluPYkWTDDvbAxobndTOod
         gdP6R3zPwtgnPfmZPv8OmeEGhQBtfa4Ff6lic8XUCh4evDuKYamYP30bVRoLYU+TvwFn
         eLX7Kj5dACu52OXWlkM6cGbbfb+WZPUAmwLx+kJ2mpfcNto/GEp7zWqfuGaOtfsssXIj
         J2kLR6VI5cf0BIFeNgsT6mnx4RKI4gXuEzz70qrJqRagcFNMaTsRW5iqNODfC14/NLLp
         gs1SLGNC1QQBRJDq9610/13HfU2OGwSE8NZI8JLPdf4dczGaeHwMfNFEFyAk7mIjhzzw
         qHlA==
X-Forwarded-Encrypted: i=1; AKwUvBzmtM2z9zqe3km+AYkBVZzMyBZQaHj4DuziGq8X/AD7gwAdQffcbpHjQy3rYGxDBLRlK8dPzmmwOZ68@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z/kNNNApEr3HDXVD0EStUhlABiS/RL4mSyMhtS74pOoekUVPX4F
	aKNiB9KPIJqexpNpF8muIShCq3lGMwj5bINESkYGabpxaKxG7DI8dFRZ
X-Gm-Gg: AYBFou1qlqrnRL3bhhT2fsY8hWdW4Uxr6TY3QA1m03QsmcaoBOMzcxvEqEeMcpfo7B0
	+VLO/T07chV5E5WKHyn7DPcAaTZ+9xOI+VrYEeAC1ILOp5okx5fMo0o8/KGOZTeZJc9el/9JTLi
	NgQRGc3c2R8c0zcrjOiJsGJlLhJ4NkLbZoDw9saBf1i0zWY428F6dA7sITCEamBbBb7WU9Bs2Xa
	VPhNhj3kZOqxLNeVdEj4CH3X9Ec8vNObt0oSZviXuBXr38GcuvdOOlUGilwKMxNA6SkoIB4gQSf
	wRwdSeqOMOtDyDC3wTpWqb9LRuGTp8eC2aXPeQJsKIgbz26vyZhvHc1Bo/HNiJaZq9Ly3Lfd5G0
	r9OfgqzA+p2RgwQTkVMnx+GU/fkW9bwN3ZgOUAgjPipS6xZ4hSX40mxQziCoq015erN6C+qOk06
	ThJCnsay5yldf1cXsNQrW8Agsgeb3sScNBaqPKs25g6UzJb2G6z4wnwUSiA1ChSREi0GZw4Z363
	hz5BFxTcUUpoQMM7wkzOE4SyqQa7KxLUKyAHDZksnCN5a6DzEdztdihPvy3Ww06Ya3zRu4QcaGe
	Pcgth+xidbNiQlKKMz6nR28fZhvk/P6DJ/lmp8GdPXEwNkH6k27jguxG0d/6PUKL8/tqHV+RieX
	R1LRCUN5P8rdipHQcewgZtwM=
X-Received: by 2002:a17:90b:3b46:b0:3ad:d4aa:8559 with SMTP id 98e67ed59e1d1-3ae896f8266mr15023561a91.17.1793895490199;
        Thu, 05 Nov 2026 08:18:10 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:18:09 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 7/8] clocksource/drivers/timer-goldfish: Add device tree probing support
Date: Thu,  5 Nov 2026 16:17:01 +0000
Message-ID: <20261105161702.3515900-8-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105161702.3515900-1-visitorckw@gmail.com>
References: <20261105161702.3515900-1-visitorckw@gmail.com>
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
drivers at once, depend on M68K || !RTC_DRV_GOLDFISH in Kconfig to
avoid conflicting with rtc-goldfish.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/Kconfig          |  5 +-
 drivers/clocksource/timer-goldfish.c | 93 +++++++++++++++++++++-------
 2 files changed, 74 insertions(+), 24 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index da83483296d5..3a94feb377a5 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -760,8 +760,9 @@ config MICROCHIP_PIT64B
 
 config GOLDFISH_TIMER
 	bool "Clocksource using goldfish-rtc"
-	depends on M68K || COMPILE_TEST
-	depends on RTC_DRV_GOLDFISH
+	depends on M68K || OF || COMPILE_TEST
+	depends on M68K || !RTC_DRV_GOLDFISH
+	depends on HAS_IOMEM
 	help
 	  Support for the timer/counter of goldfish-rtc
 
diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index 208b80c46193..563390012b89 100644
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
 
@@ -123,18 +121,6 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
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
@@ -146,26 +132,89 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
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
2.56.0.398.g882cbad275-goog

