Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716690;
	b=Zbp72rdkGZbFipo6XwMAWYPmgIocuNSRqrvN5kQIpm/S4faT4RnyuaFoJBJhlr1+NHPO
	 Gvi9a/Il68tIe3b4TgIL67nZYEAgTUROKCcSqRUoE+dsdMS9hhnUPIKDL1QmK7W8xRzo4
	 ZzvhxBXf7dGMZRbdL9AecY4GisnsZh1BgsbRB5MqYGA5H1htsPEW668FlFDN362j6zBta
	 RNgUfEy+VSJvYrOXTBLTujilM7LrGmQKjGcnwgYOM5/yiozUbrlO7hnLAWXksqhElqASF
	 avxq7g+nHytMhACVhEzbM2d/9ZUmQqLVzyGpI7RZMFH88QofkFzO8aK9Db6wY4HHMLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6F8UENk1fuxOmw1JD+w3Chipk8eAZUCmgorWcN045W0=;
	b=CG/ZoVbJYxU17ipvhZYxObsZAIu4aGzHAz0i00GpPz0NWixaoXbAADjt//G5ZgV+eOQK
	 RQYwo4Uuf2zvlSKoDAMHlu6sLZ1Wj3IeOUuACf218oqGzOw8DzPncZj/4FimStBZ+G9oz
	 204VBKBBSY5P4vSjRWeTGNxplbokwIVMZkoG2fW1GdFNULvzA6tL1+limzzjrYpsISdg8
	 QtiFRaE6QBhHFlHMySvZLMCunE4noBygRP1zJL2X3qPIQ0n1DQzCTyLihlxcUrbZh2pvs
	 rZzAj2CWEuXtsGJlU0CXIFz9VstqVcaT0jJe5EybS4aHWULVbOnfzTqMRBwchIqWn9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HgWIbYoW;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA04D606A321
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 18:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA04D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HgWIbYoW
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b546061d58so16748187c88.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 10:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716689; x=1796321489; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6F8UENk1fuxOmw1JD+w3Chipk8eAZUCmgorWcN045W0=;
        b=HgWIbYoWNuXU2hFJ1VM5nO1WkUi8c5K6VywIdNclcBlz3mnUu+g5GSNdypV9g6Cmac
         NjPblXSfln7wYYNJPN3Cq+qAiYjsa+sRE8wwjMjxhLaJJlfk82JpDvir+CnL93pDlN0b
         A8zD3fCP2JiCpNIPqDDkAo/rctMe2R/4MQBw/YNbE9cM+RicM3hYbzZz5kZ/RbOxrYpy
         4QFNAngTnigRwrUNO6n7YcwkRGotg6knj8eWA5dh6mXAEsTMixy6ax82YLE8Y6AZDcoI
         Mk05VISML84zk2OsbAAondX4n+UfXQ73dze/SU8zvbaB9EoIQxBPiKlQGmR1qTG+ow7C
         Wf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716689; x=1796321489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6F8UENk1fuxOmw1JD+w3Chipk8eAZUCmgorWcN045W0=;
        b=te9UxErAcM7cZaAw9GJjvN7A/YLCUG4OP1Zo03UdJe2ZP5MJB4dMEZYkImWVYA+HR/
         MQjavwkAaGrwXtCT7ax6ZU/9+v2pW1vXFJssytlSYt62d8UO2HwOLzyfNybvkfdGwyS4
         vVRoUu8zTISxTTwVft5vysnpDtrvPEpd45Qx2EvUOWrFoeX8dcswOcvI1vmuVmHoXST7
         I6ZA1f64udIvBoHAi0PljKWpbid8/iqQe+CqwEL42Li+9BCq+qdV9+fWejA3jGVyWj4C
         sMxpVMOpCr4cjaQYWK6aLJ8VC2tCn7FUHFek9W8Qa8EiYCayvWe3TKIPy4AcGRX7/PgR
         Ocow==
X-Forwarded-Encrypted: i=1; AL+hErGMG/UvEevNtcgpzLjwieUK02fza3xzXgM1EyO9kw/VZnxVJUr2UqyUDof08AZzTLaFn1BE9uS/QoeX@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z9C+urCE4P6w+G1TmM7pASrYjNM3n40Rf0ydjJJ1/QU93BWXQe1
	xfEnDHLwPORXxn/P4f+H0qLuGTCMQ1yHFFMT17eIlFEQghMwNy3o6LbW
X-Gm-Gg: AZFdTZe+rtOZIF6IrCdjr35n1wq1yxl0MWqGOKh6ZzqusprgVd8BgBKnoGJoltnOYsP
	gMHYCa55jkdSRZMli9jkVWLfRzujyoXzS6gOq76vWbxeuTOHxvlEv1frQARmILLWp8ysiZGcQmX
	hY/2VYrm1isnOas/g+uOSkNeLn4Sif8lfiym5ylNY9CECixvpIcaXpVUBajIFQ6XA+lIicsLTtU
	wHatuecY8dk4dQr/0fzDJV9xephDLomAn0VO7qr7+DoFIQcXIczmFejxZngFm4J5raZeYe+YYF8
	Ekx3VTtJtF+rrH1eZxV/y8gw8hMrrqHSJISWUKxuhHKUPirvRG0k1Ml88j2Yu3W3n0m0TT+W4a6
	Ie/va+LyBGGULD2HgHC0ZTreOFK4sxmJDJB7gOQC9FFvggAEmIzIHXdyS/r5cJh3AYZ9dWAreR3
	Eiir8h0t+VsccwNfKMgq4S6FOgX5n8vRTDSyYseO8RaFFfmwNUCXRVc0Z5kE8EEtPI3IzUxws/W
	vsjPHrafKe5QpCmWSIKwkaDl/J19JOi/8Tn3OD1K8X6iIn17aQaONgSGb7x9IlZ+ZgEEoX6GHF/
	p8+g9gdqBiD9lYe1XHpuQiUC01kAypOJQ/r6Y4nzKH+g0UnC0x+1blaVo26RKi/0Y74cirAt5Ho
	BEM8ybxBi+V4zIyFgwDD6OVE=
X-Received: by 2002:a05:701a:cc84:10b0:1b5:709f:d510 with SMTP id a92af1059eb24-1b5709fd63fmr14492602c88.22.1795716688687;
        Thu, 26 Nov 2026 10:11:28 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:28 -0800 (PST)
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
Subject: [PATCH v2 2/9] clocksource/drivers/timer-goldfish: Fix oneshot mode spurious interrupt
Date: Thu, 26 Nov 2026 18:10:54 +0000
Message-ID: <20261126181101.3715754-3-visitorckw@gmail.com>
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
2.56.1.839.g22a8290db9-goog

