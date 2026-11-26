Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716711;
	b=VHOzcOhbHjb5TGcqGO/19XPn3MMvEf7FGa34WmX2ES+G+mwdOoBFeRWzvGg8J+V+qhp/
	 GY4KdJZF6F0b3VaPnTIbRe/t9KEEOpPIGihByQxpafH77Cltipnsh9ZX50KDeLUngIYkA
	 90y52+7E4gaDBYRpPmPSeGc6X7UjwzD00v72QVBWdd2vQ4i2bmacBdc+lvnpNtIW7iUgt
	 NjgDWBH2h9tjU+WDOqSi8AHB2rMNGpfhKHmI2yDMcVuhaGt2DRnNIRa6HqZYo8eZLQpYt
	 6QO3ZF9+4MnFjeXVKNMOtgdtGVjzwmtsaS46zeXxG3BymzJqjPWgCntXasCV2Nv6vEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f9o3b0+oQoioUWzaCRHNC1cHUP1GHa1Wt66/5L/P3jo=;
	b=xTsxF0G8dhtbNu1WsZkkMaa9UAcXua2xDbqFbtguSAOtKvDqLyQtBLHhwcYIuQcRgz9v
	 bvLVMqggWB3mbXBfALA3KcGZNB+dRNKSrWyBzX60YzctXFCvg6j5cX/ba9MmB4GFBi9tD
	 CzpxrqrTGYu20vNT0TfM/hy0X02C9prB7CeovwwLRe0P0ddUzoicKCpXb52MN40raO6Nf
	 RZkSOa9xFzZD2RCrmhYZuwvdM1J3VO06KZMulFOd3xFu3eoBoeXAr/iebUcZSC2axRUXv
	 7GGN/JuH7ow38jeukJO8OvnHEytBBwZx2mREJoqapJ6vd8zwGelpcImVwk9bAPLnX1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IZJ7w/VS";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943CA606A323
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 18:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 943CA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZJ7w/VS
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15dd124bbe7so10351761c88.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 10:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716710; x=1796321510; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9o3b0+oQoioUWzaCRHNC1cHUP1GHa1Wt66/5L/P3jo=;
        b=IZJ7w/VSPmGPfOZzpAxXLPtDXhjMHJqQizabB/iRSylDGILxl6ZNqgz15X02tCMiUp
         cQWX/701XVPwPv3Us3YmX5vijrmHG+TnDp9jZmCDFghO7jzBziGiaqmedvXjP2X7t746
         b9FIzXADP82W2zZ7YfWXTuRMHXlQWcuAjFD8n7YiV90lob/2dO10ZFpvfqRZ/53qJYJV
         D+SBg0mgOF08z4EBeUo0k5fCWGy21w4cvPMfen0HYr2OAGaPLvcZbUDRCf4y32dTML4f
         43I/aCafWveV8/x2S7ZRe1+1mlUdTcGuTQNsjC0c94yzz2idXldJxcR+eg1TjSkwW27a
         Lemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716710; x=1796321510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f9o3b0+oQoioUWzaCRHNC1cHUP1GHa1Wt66/5L/P3jo=;
        b=uolX9fgHy4PFSau1cJ+3M/43MS7Y5eGpJqtEvBk98VYO9JUv+/xkZu6qXbmjivrP1J
         U6kMp9U2IUssgqArKINLzjqznsmjETpcQM4eUb2ePEEb9YkKP2Thfn975BJKo51i+AGX
         1wa2piDY0rooTKy+0V54RRQdezGYEbZfRgOpodw+CmyPIG1Hkm10NPX3lFVdteXmExMS
         xf+P2IdiwDLmfMCVHQH1qwV3rIPHQXPoaxjU/SS3BuEqSSw8zTHucyuzYXT+GIDf4pUf
         4H1bGwOCDf6fYLKfe1faehKk2ndo7Md54F04ePkHOen+ynTuC8mdt0mbJ9W3y+EF1kT7
         xYFw==
X-Forwarded-Encrypted: i=1; AL+hErE9npwMI6esTKl5g4YATdI2w4Rf3bz1y+h3fejuPmKC5UAUxLYoRAC2WrIBSsya2qfIF998lRlN0X08@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z/Plz7IoeKbvqrBAMXu4KZlFrHDmMX1QqS4uab8sKjvP++KkVON
	wzPA0OW++tQ1i7Bvw9VPwZ3Z6+I8leZlKoR7onVTcM2RIpnzqyCi0czU
X-Gm-Gg: AZFdTZcBe8BqVa2mhQ9fVda8LgBvzdCDsZ8hTPR20GA38PPou5uDZZM0R3pY4l087dd
	59x3/d/SBcqGjQbTImZ9KP6w3AvBliytW9vFxhPzqnjKXfsuQMMQ9Vlfolg6DpRAM2Wpipr+XXi
	kARF+z0wTdTZDLTM1cyNnZyuLnsYIaODNoOG+RJ9uuW4ikTSvhNF1dW+GLkCAZZMI3H6N0H2wg3
	Qw0r6AqsT3UKKZl3DgLQ5NA2JOVqzWi0PTDyAmte0xnSQWePh85g4yf38Cu9YDvhTNUKXCZz9dm
	bWmgjNBXnKcGgJVYGI4R4IXhLozTa6QfcRWVz9VgkbzDpojskwjd5EKvE1AYFdjKBUO0jAjVf9r
	liI1tl/cuT43sq+xFsIS+XHmMwe5zV5cL1A5ZgALvF4eOM/oBpbPm4dnNijw5GKo5wR7zslNaAq
	o8i18P8vYWFZ48FNxxMlrqmuSQ6BVTOw9Cvzk/F15pPW36FdOmcFWuZUV8YPiAHsvrXxwrLu+80
	w8UgXS1oO0LisU1dYzJp9LYO26DCAe9VBW8Vd03f5G+oUv8AY7WDcHBhB6xeqMXtz/hpAxFkydp
	MDQnMvrruEllpWJ31h9jSORv4tAaGZ66I41GmMYs1kAbypD0b9lTuWX41DV4mRKBgsPOxUo1DYa
	HV1SQedG4dg5JAKnAySxUIG8=
X-Received: by 2002:a05:701a:cca1:20b0:1b5:86f9:69ea with SMTP id a92af1059eb24-1b586f96d38mr6533120c88.0.1795716709806;
        Thu, 26 Nov 2026 10:11:49 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:49 -0800 (PST)
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
Subject: [PATCH v2 7/9] clocksource/drivers/timer-goldfish: Set clock_event_device rating
Date: Thu, 26 Nov 2026 18:10:59 +0000
Message-ID: <20261126181101.3715754-8-visitorckw@gmail.com>
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

timerdrv->ced.rating is currently left uninitialized as 0, unlike
timerdrv->cs.rating.

Set .rating to 100 so the clockevent device has a valid base-level
rating without overriding higher-rated or architected timers on
platforms that already provide one.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index 93a92a823f8c..f5019a6bb340 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -117,6 +117,7 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 	timerdrv->ced = (struct clock_event_device){
 		.name			= "goldfish_timer",
 		.features		= CLOCK_EVT_FEAT_ONESHOT,
+		.rating			= 100,
 		.cpumask		= cpu_possible_mask,
 		.irq			= irq,
 		.set_state_shutdown	= goldfish_timer_shutdown,
-- 
2.56.1.839.g22a8290db9-goog

