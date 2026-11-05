Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895456;
	b=ObgMH+z/pcLdJWTx7L6WoaTy22YAyk0dkdcsQ3g+d5skkdRNZ6r5k5J4xDZlcFpvxgjJ
	 bI0jOR6x4whINvsgbIV8Z6LUs++fGQJbaSMwDayr5QNSHS0s3leqMVbLmjvOUVEppOs8X
	 ujzP1mCt/FjwbyXVKmH7p2aPHNRrZXhQhBpJKJnhH8+01vsykqItZ81/VCyc5RB7TAI8l
	 wc+yQGTNKm313e2miwvCSrbORE//U8gYQWgYAaKnCvpu9NlA7VIXRH4p4Z1+xfDbo7Xhz
	 tIcrpsMKFh3oiPeZq3LdWxQbyWkjYaHUf79e6dxsU74svUmK3rkqAHlgLu+4AfKm7iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Sbmd56cc2B8bxAxFxQAEiOtDnzrJfFeIJKzZDYlgN4Q=;
	b=EnBhC3jwWpgAXsAoNJN0pjwMKXy3Frcl8QT0JJ+07XQuFsWTplmzeLGy93ZzHuYs8/03
	 czCbOsLlxCJAPYuCraVPvVILgkRiFmI55ADTrZ3sGfHiMVeJfKy+l6OBupLdCqfY47OVF
	 KQivzKpAhWDMv5P6p6U1t0g7lihS4rHXXul/5xfpaIwy0rFfEBW2yXiXJJndtYN96FYzU
	 N50Gk4xwe5TMRSBtRjgCKS0vW2wxSZJOlgotjnrer81W0CoEhMlLDWyXgSlW75Sw3q5T1
	 ObPjpl3fmcknreaT3kwPm0iax4OYc3PgPAgc7/jmwxHaRizoTk8gTBAT0GIza8bAfrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DrvzQIq/";
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E092D606A328
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 16:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E092D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DrvzQIq/
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so1663227a91.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Nov 2026 08:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895455; x=1794500255; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sbmd56cc2B8bxAxFxQAEiOtDnzrJfFeIJKzZDYlgN4Q=;
        b=DrvzQIq/Lghxhl/km91w3nA1NpyiYBbgO9ii7NTkxNxK8Kr0eo0tlOB+nONe+Ko5hF
         6gfJCjzYrk3lRJInsD6tMkaBM/9WXcNoTMAkn9XbeDxuN6NFpbdx7vqXe+T77llNiYrv
         EUPgsQbA621+wqtV6GntpJZu+h2+DdB5WcTo8Ww3ssXbMsPevga5L6bAM7wuwGueGiVN
         jWaRE1WHwU0kvihu7wSlBnxk4l0/QFp+klV0nUeRkZO0FJIbGq84CbxTvcdjNH8MbCpI
         HmoicA8xnNnyzVLjhnTMTsNK+M98HPaeJQxoxaaJb1Z2QEDYf/4W0URKcB6fFMb+zGJZ
         cWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895455; x=1794500255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sbmd56cc2B8bxAxFxQAEiOtDnzrJfFeIJKzZDYlgN4Q=;
        b=KfTqSh6U8QxYqlTlJkr0GsYXE3EICVlkG7ODKfsJ7OiRvwNrjjdqua4eLTvGgICsgR
         oVhngl8w+FHuDte6B2vUT6ELOYpvpdrdHrVIaHIRTSMURLIFWI2FLd20pNIsPhHE11u9
         XGZqVzipB8LAArig8mUfVNXnF4JEiVdGOaslHSv+pvqNtiwg6LXGPtLyQW5xtJtDBgIm
         Cf4AT5oFeGr43tR2Fw2K7EUJShywoB2QhaiGgFzsV9fghlRGddXSZVkixNltHO/zf5f7
         CA6ANJFuBF1MbRmpisgwyz2hTQSbkSJOY85xwNu95uSoYbGpSNj/KGkS/1lUxo62kbsy
         4asg==
X-Forwarded-Encrypted: i=1; AKwUvBwGO5D+24xt2FPftAGU/k2UuN0Wz4tlA0nmVmWpsfeWbuqYTljUUHFAaMJILWzaDxp0danY918/Q3qo@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z/1RF+rUIoTfpaZG0yosYQU8P4KQbOyrAu2fqAf3cfV2B4VXtE+
	B8adsT+lBdnJiWV+w5s3W15iTJRsaAeNCdVM51OfPlwLZLpUmZsMRi9R
X-Gm-Gg: AYBFou2GWWVLZdrtWTsvLOckm6JjI9kyl+Rdd3wWK8ebPpEP/7nvIYZFLr9PfvJL7ta
	oOq3u6colUCQ0foM2+o19/+QbRw1NcGJQ9gO75uCJcoRxLoGIx4CzGRdR4k0qOf2TldFq/cOabv
	/iVEz52S0tzX0THDtx9xa2XpeZO7tMXVAgokls9lGxAjxzgVbH1BxTvONJfaDHpdv57aOZxIo5m
	9kGiLbQzJGrRYPerf5YElvqudMSeYoLvIRF6ZHzAw8KEp7YAab7UpUK9/APJ+RgqjymIpZvqnzd
	ykPJAONzX+dACbyzTrlTMOC/GNJJ8XkF4tzOQdDcL1moe8XUUmji5B/pWzuelUfc224A/deCwch
	YRWoEfZDrhOtKQiHugRq8E/yhW61dcZPkiCjG9vcFZeBorSnDqA4n6EIhjpgPhXIFbZ0VMnJZDb
	Vh4U7/ZI3Vs75mSvaRpm8chCJR6FIvvmpPmW1dPovRpiq8hYtKx+PNn/sUnoRDp0Ft7ovoXGkjz
	HzRan8ljJO5S1QwOUKtDjbRHGkk8ISiXpyeuOHohNeQXZnhMzID9Kr7T8I3/+vrnl270CPjJ6Vq
	nKcfhNl0fgKPrLwcuziR+f2LGVo1agm1U2epwXMQ9V91LHy2ABz+7QzBAt7IXj5jnjJiC8Acg4T
	Rb3iQtmsI50CBWvXh7KaIXu0eqN+6sKP9NzLUG6cXLe3T
X-Received: by 2002:a17:90b:4b90:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3ae8984b662mr17099226a91.58.1793895455036;
        Thu, 05 Nov 2026 08:17:35 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:17:33 -0800 (PST)
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
Subject: [PATCH 1/8] clocksource/drivers/timer-goldfish: Fix latch corruption with spinlock
Date: Thu,  5 Nov 2026 16:16:55 +0000
Message-ID: <20261105161702.3515900-2-visitorckw@gmail.com>
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

Reading TIMER_TIME_LOW latches the upper 32 bits of the current time
into TIMER_TIME_HIGH. Because goldfish_timer_read() reads these two
registers without synchronization, a concurrent reader from an interrupt
or another CPU can read TIMER_TIME_LOW in between and overwrite the
latched high bits.

Protect the register read sequence with a raw spinlock.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index 3fe12c7ee7b7..cc02b012ff76 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -6,6 +6,7 @@
 #include <linux/clockchips.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/goldfish.h>
 #include <clocksource/timer-goldfish.h>
 
@@ -14,6 +15,7 @@ struct goldfish_timer {
 	struct clock_event_device ced;
 	struct resource res;
 	void __iomem *base;
+	raw_spinlock_t lock;
 };
 
 static struct goldfish_timer *ced_to_gf(struct clock_event_device *ced)
@@ -30,6 +32,7 @@ static u64 goldfish_timer_read(struct clocksource *cs)
 {
 	struct goldfish_timer *timerdrv = cs_to_gf(cs);
 	void __iomem *base = timerdrv->base;
+	unsigned long flags;
 	u32 time_low, time_high;
 	u64 ticks;
 
@@ -37,8 +40,10 @@ static u64 goldfish_timer_read(struct clocksource *cs)
 	 * time_low: get low bits of current time and update time_high
 	 * time_high: get high bits of time at last time_low read
 	 */
+	raw_spin_lock_irqsave(&timerdrv->lock, flags);
 	time_low = gf_ioread32(base + TIMER_TIME_LOW);
 	time_high = gf_ioread32(base + TIMER_TIME_HIGH);
+	raw_spin_unlock_irqrestore(&timerdrv->lock, flags);
 
 	ticks = ((u64)time_high << 32) | time_low;
 
@@ -107,6 +112,7 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		return -ENOMEM;
 
 	timerdrv->base = base;
+	raw_spin_lock_init(&timerdrv->lock);
 
 	timerdrv->ced = (struct clock_event_device){
 		.name			= "goldfish_timer",
-- 
2.56.0.398.g882cbad275-goog

