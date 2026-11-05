Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895461;
	b=rEvxH3XaFWSnYMII9v1davXv6651/J7GbbgdKgC/yKfNQwlwd7Qy8Sm/1iwMPjsFJHCv
	 xw/sYx2xMFC1Z1NGuVRuKwvCFUbeUA89Ks1nL9ALNfN35/2ySwnsD7gqNfyY5g9BAwL8Z
	 TBpUd2+ku3Lz+gU96BaIN6Sler7Oiub4aDkvIc1cNDWHgSJ0UT9CS7xIUpVxDG0M/7MVk
	 rocnTRDTc51jmrIITv4OeVzOC10rlyYZ+dlEJABfSdvGjc8vmKacCbRT5a7+EsGI0pxZf
	 +9DvcT7R+2lO7JPy0XMuGSb2iebXjFVC31tDj5RBDUwI/Yh5lhSAZRW1rYdzD27iPcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mPKBLlnM3LFTy4le1GdgYQ+LvOCf+Ky5Ifcj+VZbfQA=;
	b=AJnH5vjr6eXbo4RyWIqAC37QoOiq8f3qmLjtjo54JkqKXzDXYqRjSnB2fL3Dz179FCT2
	 yBkEA1SLaoyIdBg669F0eI9iwgQ5HhaSQW2Nlt1lfAPOQoLSLOZFdU+zmsG1lpbbw9CvY
	 sboQZWR/1wFz5JwgVuCckCBnL/N4LW3dzOcn0Iy9KOZ8wMiyxZ0Q2YNlC1+dHIIfjNbRM
	 DlfXzFCyxCr9CXtPZsUc68FCuU7Pz6MDKnz4/d3q1Zx40VevkJB1ws++QH3Un52P4pQlb
	 Q4OrVY229MI7tIAk7MAGP9hMmywmpAP6Tncq+5npiX9NgA0pILW/KhZfanDtRkGO5HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0U/+I8sx";
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA040606A31B
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 16:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA040606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0U/+I8sx
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb681db419so158405a12.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Nov 2026 08:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895460; x=1794500260; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mPKBLlnM3LFTy4le1GdgYQ+LvOCf+Ky5Ifcj+VZbfQA=;
        b=0U/+I8sxZMSmMv09t5mPYCDLeHM0f+CE5XH9ku8opGUNrqXaiBmW2iW/lsfuMdrcBz
         K4TuQmELQJRdiTgiBjRerckWETpODCa99QtOGN15AHCSzis3l1ru6adpduCtSBsFMVms
         19MV8hmgUuzIeYjlypUT6c5Dc3qwme+prcLaG4TdckheuU5YV1xRRpyBqQp1USE4HKaL
         1BjzVtGG8GNrTNW2dcWI1c1Ph53ns8LPM99JFUj5P8FM8a51qqQVSqh8VT2+RV9b2gq5
         YxsIFZYsdHyiqpp3eGtr1jt1InK6eckbCQkw4fx5g7pjXa9hP21Y2TylL892J4LiLq+i
         OaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895460; x=1794500260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mPKBLlnM3LFTy4le1GdgYQ+LvOCf+Ky5Ifcj+VZbfQA=;
        b=2NBCyN9QFJLLZwgDWWBwJlQ+HaAchiFv21nHEKflFa4XFKxuyAsHZqccINof5yBf+/
         2G5tQYjf+AdzgMnY1KifGAMIhvOIBHMUEsg8df+hU5WcDLFNT7lVMSVhJ/MgblE3aO1p
         8kqYLxGdbNAJiHSO95acKQXEsA9e6ztdN3yYsYwVxJ+TJQR4wXfDY/rTD40tFwvg4bpt
         wcCqSWqRa5naQkuQH258ySVf+LbOZn5Kz8m3UD26PTEEPmSu2vB/qulWhFq71ozYoMRd
         bMXMXZ30VGZ+1sR3j/EA/APjlOe16x9Ew63KJc2GEodB1emDkZkm+TLuq4aPCcSY9sfy
         LsNA==
X-Forwarded-Encrypted: i=1; AKwUvBwI+ptdadSyA29AfsltiNerehEdidNG1K2lZKi/DqICT/EwmD0+4o8xF0Gk+1dkWd9eCLfzBYYD2DDs@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z8CcKRfUm0/HGWqA5qJk6J2uRImn1A240sLNDECOz1LOPaSprhA
	dcFA5Scqny0TDKEmq+Q5JsfrgUVoOgPg5Jh0ixXZhOJpgZE5GgdJuNCr
X-Gm-Gg: AYBFou02GvZQqphgE+dX64He+kUZCxoyKkcvDxmRZc3Xt2e8Ut++2PBWOoTvCyRfkEY
	tjK0R6/gOYUbr5ACLMWfi/3dItaeKU/DiGdK/8PfRq2U8rQQ+mdJxOiqQ2Gtb5VyIAInP0/ot6y
	nQlqUIwsi4jjnFvVoUM49BPX8Po2BMs8ejeSSGW4AV1seIG5nheJk3rIZ0WLAGdR50zsUhT5T26
	RRx32B0xiVRJBM5VaMSmAnWSziUy/6TtQezqylLlFhnQGL1MiKjJPZqO6xm8L/kspnXRsbUkZmm
	77AiuhVegRjbsQjp+CdpDm2axErpXWI4CXvZzVn6OjIjCJjNYG4gsHZlFCoiP8HZ+CBx9iMwupU
	yefPpFKr1019YmYAw0DhMNX277qPrONFA7we9gsXiT3GlNutBdz/8NQMYQQO/eTk9+8747Z0hSJ
	lcduWDvuFFCx8bR9X10qi4b1SLMiQaZ5O8vTMROInDZEAf6GMuzXtqOz+F/oo5vjhDSxize5Fd5
	mj3NoI4Ystmjhxbfsq/XoYelT7W5rXcGyeHK7KWootecM6+NxXlpl9ZFe01aRTy1KRLyJ2GbW4w
	gYAnIYJNivtl9hemd7ORcLC3T5vAeTmIioR8ND1D4mqmZUwmQozU6heuSieRUOBGaPSzV7Rdqrm
	cUjdsqc58ne9Z433U75Efy+A=
X-Received: by 2002:a17:90b:3e4c:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3b0afc6476bmr1703983a91.28.1793895460202;
        Thu, 05 Nov 2026 08:17:40 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:17:39 -0800 (PST)
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
Subject: [PATCH 2/8] clocksource/drivers/timer-goldfish: Fix oneshot mode spurious interrupt
Date: Thu,  5 Nov 2026 16:16:56 +0000
Message-ID: <20261105161702.3515900-3-visitorckw@gmail.com>
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

goldfish_timer_set_oneshot() writes 0 to TIMER_ALARM_HIGH and
TIMER_ALARM_LOW. Writing TIMER_ALARM_LOW arms the alarm for timestamp 0,
which immediately triggers a spurious interrupt when TIMER_IRQ_ENABLED
is set. Meanwhile, goldfish_timer_shutdown() disables interrupts without
disarming the alarm.

Use TIMER_CLEAR_ALARM to disarm the alarm in both functions.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index cc02b012ff76..b1dc8b388470 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -55,8 +55,7 @@ static int goldfish_timer_set_oneshot(struct clock_event_device *evt)
 	struct goldfish_timer *timerdrv = ced_to_gf(evt);
 	void __iomem *base = timerdrv->base;
 
-	gf_iowrite32(0, base + TIMER_ALARM_HIGH);
-	gf_iowrite32(0, base + TIMER_ALARM_LOW);
+	gf_iowrite32(1, base + TIMER_CLEAR_ALARM);
 	gf_iowrite32(1, base + TIMER_IRQ_ENABLED);
 
 	return 0;
@@ -68,6 +67,7 @@ static int goldfish_timer_shutdown(struct clock_event_device *evt)
 	void __iomem *base = timerdrv->base;
 
 	gf_iowrite32(0, base + TIMER_IRQ_ENABLED);
+	gf_iowrite32(1, base + TIMER_CLEAR_ALARM);
 
 	return 0;
 }
-- 
2.56.0.398.g882cbad275-goog

