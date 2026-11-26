Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716702;
	b=47ljbicjX/RLZab2gLEQdxqshxXAlPsIHH2f1XceWVRiCNad/dgL/zjIZjmoLV7XcG5D
	 /xMlNQp6UJAsDy61ppxRspibQxq095dAO3uFdhcibriYVJcCY00f9sHQnjZnJbsxRF3Xn
	 1vuJ6kZiO8CHBpSe3uqVz2PruAfMXD2FWUQDMFy2008k0eqrP7CvewoWnHoJ0dHNsHG5v
	 lB0aY5evvZeIurPkdYF+Qa9Z0n+H9ML9JRZ8Im5to25U1goHQ5jpHR69ugDckW+af9rAK
	 zhc8CsJ8PVkwlW/uRs6M8IoV9bOSnzRsysHex0REO7VwYoexsNV+4dbp7BeLUJhQ6xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4TDqJAeKArMi1TG5kQFBzJAxGea716ROZkpS4fTDkSM=;
	b=qGESc+2sIhkfOxgZR8CStdOjdM1qFhhh/EUrgAAyS0uUGbctPv5HpjEDqVZOfm4HrCSQ
	 VXLnY78qfHAIS4HiuEGjHNv2+2PbtDBp6Nufjd9A3LQBUHZd4qtqgTIQzV9gAeRbAT42P
	 ANJkHUJAjg6ssKo2qS0+mrDzqssgEgynvPybnaITfAp0emrb7a4IjQGRHp0ry1xrOEeXP
	 1qnnyMpGkV96s0jsY8RcD8aHusw2BKRddUtynKG2ykqqFgx2lkxejlAsyv8Bs5xpC/zpE
	 w1hnvqrPbFPbmAV0uDGh7UdD9GvfM1eBJ7B8gRUpEZ1VlPqHSKtYXeYbDAlRkkmK86g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oC2AXLIS;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB8A606A31E
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 18:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BB8A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oC2AXLIS
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15dd124bbe7so10351501c88.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 10:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716701; x=1796321501; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4TDqJAeKArMi1TG5kQFBzJAxGea716ROZkpS4fTDkSM=;
        b=oC2AXLISoWVg8lwMzH3Pglbmniiwwxm1jLtvFQBG4ZNLKK7TPuFPg4rPkeDEM0N34d
         0Iejxuy3s1+vzNRwTXNnNgQibFHdQ9YLuP8/ismL+JLjn1e4jq+gXHTdWe/qqhFp/HXw
         cstWibTgdOFr0E7XbVhYM+R9MCtXkdDf0cExPkwG8LIDTFrXdo8Xm1sQMLE+aVQ0pGQc
         VfuMEUuqJJsV9nPMfwOFe678floInq7aaOK81laTbf66EWKOv9cqgZkdh4iqW25Pe4Ha
         yggr2ewy2ohi/AocXcPK2+YckAs9eSwm+C18fMVuxFu3npl/BnrHEHHcXH8yseAfxHKW
         QY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716701; x=1796321501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4TDqJAeKArMi1TG5kQFBzJAxGea716ROZkpS4fTDkSM=;
        b=zmqCO96G0lasxhSvUyrkRDjnF2GnNq7WUKp4QrzU7iToT5oHRyIDCKI9igBI2ZkaNJ
         hdGxCWfTYUY4N9JtbIuNH1CyWisSP4Cq0PXnY2qibiKwpybDASwx84rNq+6eEnWZaDS+
         hX/cbawn6+yITgD/Wpf+lgf+4x131XRzyuns2EbljzXbUcDsKVeQeAYdHuCdi53TpWDp
         bTUjuMCb7iPtFOTgkJNFATdvg8JyX21iu0dsGJfYpHvUgeEzM4DST2tzq2ZmOPkE6o+M
         CFiiVQf9FpsI44pWa4bh0zI41B0EjQgiHqRIt57LKwxiDWGEuq2vWjpGe95PyLgyFX5n
         aAdA==
X-Forwarded-Encrypted: i=1; AL+hErExB+cXZIAM0mJbNGz2Yzt8Yb5oIOPJB3X+FDRneyEUcQ/Y6x4hob5tF+nAYkd5IoPcpMjD6fQINSLH@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z9qAupoYJdbtAmCEs5CHdDZXQueedEcpiM6JsKhORqic238YQBr
	/6gnkDnBCF+Aa0m2gAZGxFMtWdJvWgpmWc8syTVKh9PK/vASDTVMVuTQ
X-Gm-Gg: AZFdTZfy31mwMJ57IPJVp7AbC2vjokiODHmF2KiWIRMLrgj5jUTU4M3Ptz2ZD9uiOhT
	+tXEUIGBtGj0f3b1Fm0u4kX92sy3z5tAu58+AQThv+9qwx6iSHvd1qphG1yZ6gUpuNaOOCtqrWB
	oo4WRRcLcDa0Lj4og5mWtxrxgssEY5QLb+9P18GIX9IgFTXb0/eoCyDXk2ziAhxwa0gw1HfHpMm
	UFW3evepCf2svNpDhn2jJe/LYx67+zsP1F0sLAXFttx10MnLpP8aj4NGxU087DdEnFFu+/oAVe1
	+5ePHCk6sz7ohtPK/sa6HAIDAowouwzPYSnuWSIO0yuQ3G8DE/3YIKKN4ur4+PSy0aNbotE/Ydc
	YsGe+U0MG2e2pJJOXI27iK0EXAOp+Gwn/nocE02Yd2i9+PzdGd0fayrKI1oO62L6MnumHNMJdrt
	O8rdiV/KhO7LkhMnLNSW69SpIqE7ZkN5TpcmJ3sd1tUb3VE+Vc8+eTDF/4lHFsTjdqfjF/SqzkE
	OAFTmBwLKi0WM0N8L+FQGm00TCpS3ra2tt+0h8LBcV65wpNTyCcqvTZ85CNywNbssM2NKWt8nr/
	XqZIL6lqzhHUv6LLXMpAhMRo9I2/TTGm0rZ37LWlXMXBbv7c95xhXhhvZ1Ig6NXrZQqYffPVwHu
	9fQ5dKrjynssmr4pmf6y0Z+k=
X-Received: by 2002:a05:701a:844d:10b0:1b5:888a:a1ab with SMTP id a92af1059eb24-1b5888aa35bmr6831377c88.15.1795716701414;
        Thu, 26 Nov 2026 10:11:41 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:41 -0800 (PST)
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
Subject: [PATCH v2 5/9] clocksource/drivers/timer-goldfish: Drop redundant max_idle_ns setting
Date: Thu, 26 Nov 2026 18:10:57 +0000
Message-ID: <20261126181101.3715754-6-visitorckw@gmail.com>
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

clocksource_register_hz() automatically calculates cs->max_idle_ns, so
the explicit max_idle_ns assignment in goldfish_timer_init() is
redundant and overwritten during registration.

Remove the redundant assignment.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index 88253bd1f569..bac84e0f9b7b 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -140,7 +140,6 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		.read		= goldfish_timer_read,
 		.mask		= CLOCKSOURCE_MASK(64),
 		.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
-		.max_idle_ns	= LONG_MAX,
 	};
 
 	ret = clocksource_register_hz(&timerdrv->cs, NSEC_PER_SEC);
-- 
2.56.1.839.g22a8290db9-goog

