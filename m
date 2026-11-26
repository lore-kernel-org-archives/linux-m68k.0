Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716694;
	b=5DQP41lctvl9Y/phC7nCWsE+Q13fhkViR4Vf/it3AsO1D6/NoI0rfsXnLWNecEiOLSmO
	 yLM+6DjL4S5c2dK+KnX1QSz6tYauaCJ7EEYpvlJ+oZn2pxKu7HfK0kbHLLunalFSe32tx
	 0S/F1amkIrKpELjxIhsYLigCf/yvboPXU8GrqianTKqFP84ZUN+t0t3XqE96+P9WD+txR
	 GCsPdnR5m/RsH7S5JSIcLvaUokUKFBo3Mp6n/huL9mA6EF6bvYPR12JaE3WHaMOmvp5Zc
	 dmEUq30INYtXIYyPz0Kig616V7M5G56zIK2u6p9EixiZtvP2Q89BmS6nNSiul9gelMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zDitXAnv7fxGLpnaofjPJIWFBZy9yTpXRjN80rolNbg=;
	b=CwjYqCyZZJ6nNwRfg15ax1z3h48IOJj3Ezm8GpJkKmcPZpu8LzHqQ9KvptGjenwNz7sU
	 4WOp9f92E98eXHyXVgDXsZwGktDFdQbNoCvdH/JAqVDk65/LBsWOBXk9Qi0oxepCKK7dj
	 QYLJuV49icsPL0sFh2VQBJZW744/zI92KHTKMbzW9+Cend/ggVBPsDFTkIO9W1Kftmu11
	 Ag2i9MJLwFCRbS+IDhSWg+yrWkMO3MQCFDg0zZf3DRE2BXuBFoTa6MOLcrBz9OdFsrvEf
	 OKYmxNCnxFeySw0YHo/xvkW8aGNyZ9ZCtHlu73xG3Uo0wzad1NGkvBiqrQqk+CYVQxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XjLf+XXx;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F84606A327
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 18:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4F84606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XjLf+XXx
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1ae58d17cd9so8174504c88.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 10:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716693; x=1796321493; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDitXAnv7fxGLpnaofjPJIWFBZy9yTpXRjN80rolNbg=;
        b=XjLf+XXxKcgPo17vE1NlZ7WJVo8RHZaUB5vXtWs2nd3Io09m3KJvVZKDGTLOxvJ7+U
         BHXGzbna178i5BfjGUppMnDvw6dVoRr5c0QxNbfLtvkiEUPEc76uutWkN5xKfPuzHygy
         7/Z/Gpy0ju120rHqldVcaZMOu6/YOmDDJPQluDLrtu61VpDnlKhMMwdS6EA+QVuXqjsc
         NoFmjnSKJpn+PypmiMfU4SUXvifJGEvJ3rA2LXHN+cr3Oc0Wq+rMeHfktONAQ210ddSG
         mVAw4FWpU7UzYg/n1LMgLgZtaN3BytVNnKaWj255lQefGpY6kHvQ3US3l4ZlZ8Mpl4qn
         hjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716693; x=1796321493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zDitXAnv7fxGLpnaofjPJIWFBZy9yTpXRjN80rolNbg=;
        b=nOY7w90nFI1jy71X88i1oUct1bV8+6dNRmR7IG3iAJ86lSvfaZbcdp882iYfn+ZWC1
         BiJr5ADPUtwTpAmP4quByy/aCSpB03/j/irbH4IIXZ4aBSRmTA7G0IO7GEfi75S6demr
         B/jK9FQQQwbWP0dtZV2w//YneXbRdjfA/7AfN9jNO3yYPOLUjOpiVIGRN/IfZZMTQpUn
         GsoE+B+3DBPl2VM2c2+2pUWmmDR6fC2As0fdtjGId9vISk/FXM2bbgbpgp9Fwtg1zUjE
         D3Inz8ARkz/T64Ct0aBY/eQWCwfeNBrC/YmnSN4J9dyCLojj1STmsbQAfLp/y+8PyJUt
         8yxQ==
X-Forwarded-Encrypted: i=1; AL+hErFn1sQGhyTU+Bgps98W+qB4wqEaWGbT3TSpY6PKEIBBc6nFkAdKJqNaVyA6eplLEHYmfHkBWkiRavUu@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z86P/mCITyX6C2zLXHU820ZfsQH0mPyUo3Sha5WEXhtMfGbdJCG
	f9/bMfyo9wv9WCjeNJY481sojHjqkKiiQSFMnQawbsU9lqsI6C5K7JLf
X-Gm-Gg: AZFdTZfRJe83xmaxMJD4WakmGC+RP+OWIe1tbbAzxVAQL6IjbnjVGODgQoOx3wrQL+0
	hVMumOd1eZIB72jOxRW1SLxOqKZ5NwQ9Tiy9tf4OpHs2IMIUzELo++J7cnJofeK1lGKYQBBSMlc
	vzsrI/EWtjp+Zaan6YObAMeoWF77gdc9lHifL/LPp1id8HJ72Nk4swNJDCCigO5ahtcBggrYzXe
	ukLO2epJ5lUvEwEo9g1WXS1ugU9KgfT4A56y7jWi5q9CU9xRtLJneCki0XfFznwH88TbtTETxAG
	59gGQ4x5Wz4CnuXcpF6W6zs4wQ6nTvhgSyscChppWx8z70e7gahRFT05+AREuAp7f8n4HFO5Eks
	KGsb58MpxBbIx+//w941IY0MjaanjuAVL4qzLQ4BIpS5g8nFOVm+lVWPbcL3k3sFR2S4kerxl59
	OZUxrt3ZWSVbFnYEsT5hk4fVxND+BR+mYvLdnPqq3t7D8iSCLNJEcw9OyTftTIFQuujw2WzCTtR
	6mpYxDc4cP2eUfz1YtmR/eLez4f7Xz/HfgxcIhdDJAiNUWoNjxsqg1AKUMguQ94M1HgW1r9T5Ul
	LqwHqDXOYSSnkol8DaHhoPTXDRtyPVw1xSIPzT+mO5YJYQyxm2n7gZiGZg8b/weNvMT5689GieG
	Awet2CDEKsrljYV+UOmbklKPdufIvXJfTKNoUcbjjXy9/
X-Received: by 2002:a05:701b:4588:10b0:195:76af:b810 with SMTP id a92af1059eb24-1b5972b4691mr510797c88.25.1795716692917;
        Thu, 26 Nov 2026 10:11:32 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:32 -0800 (PST)
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
Subject: [PATCH v2 3/9] clocksource/drivers/timer-goldfish: Fix resource leaks in init
Date: Thu, 26 Nov 2026 18:10:55 +0000
Message-ID: <20261126181101.3715754-4-visitorckw@gmail.com>
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

goldfish_timer_init() ignores the return value of
clocksource_register_hz() and fails to release allocated resources when
initialization fails.

Check the return value of clocksource_register_hz() and clean up
allocated resources on error.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index b1dc8b388470..8c312c3a64a6 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -131,7 +131,7 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 	ret = request_resource(&iomem_resource, &timerdrv->res);
 	if (ret) {
 		pr_err("Cannot allocate '%s' resource\n", timerdrv->res.name);
-		return ret;
+		goto err_free;
 	}
 
 	timerdrv->cs = (struct clocksource){
@@ -143,17 +143,29 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		.max_idle_ns	= LONG_MAX,
 	};
 
-	clocksource_register_hz(&timerdrv->cs, NSEC_PER_SEC);
+	ret = clocksource_register_hz(&timerdrv->cs, NSEC_PER_SEC);
+	if (ret) {
+		pr_err("Couldn't register goldfish-timer clocksource\n");
+		goto err_release_res;
+	}
 
 	ret = request_irq(irq, goldfish_timer_irq, IRQF_TIMER,
 			  "goldfish_timer", timerdrv);
 	if (ret) {
 		pr_err("Couldn't register goldfish-timer interrupt\n");
-		return ret;
+		goto err_unregister_cs;
 	}
 
 	clockevents_config_and_register(&timerdrv->ced, NSEC_PER_SEC,
 					1, 0xffffffff);
 
 	return 0;
+
+err_unregister_cs:
+	clocksource_unregister(&timerdrv->cs);
+err_release_res:
+	release_resource(&timerdrv->res);
+err_free:
+	kfree(timerdrv);
+	return ret;
 }
-- 
2.56.1.839.g22a8290db9-goog

