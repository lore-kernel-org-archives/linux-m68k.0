Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716685;
	b=QOqMlqhPzCqemz0XBv/BYw9yE82Tw/b/vW+c74RK95RDiqGG0Rmru10j3cfmb9U1bWgj
	 dO6sIYYyUjMSF4C1Z8eYGwjO75xAGYPGSauSmk7VGyZhCd3MYA+nmOu+7xCdJyB3g4K1J
	 bKaV3FNRKJILcd/xY1H0+UdJb0SAJu29JeC/ddoUYbg7WSnHuLXSkePaa/ongjRcQOIqS
	 17PQxq/WXhffHA23KCD8rL/QAYfX2KczYIaoTR/Zoa1VEiGhsrwl4gRVs0XwC+vsNDzJ9
	 +KMsis1XdpZCLTRdz8+82GG9nor6rtdAEMv8I3sL6lIrJ/j3flnBwUroZj8yA7PXv2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sv7Rf1rucixu4R1GE8Wfa1cFo464t6/j9QkDaOQ/q4A=;
	b=R8018ELxGRy2FKrkPyYLe8XtGRFJ7aWyZ4GDzYO1L20WSXWvRbdz18/0I023fj/wJOZv
	 J6FdCwjYKtutBIO5N2jTCpD5RKwugoM0LL3Cin1Wg/oclxaDL3JXoI92H7j2v+ZBRsQ9k
	 pMIifkVL6owz1Yom0nYGXsGTitzQr3Wclv16OXyMSMHkeSfC1LhDYVbFW3GT7+3eoMtfb
	 XfAnMKU83NdMl1Pq9bYgRXC5gVbLcvWYaZcnrgWUajEHOYeMypExYb5IUSlMXqCqCuppG
	 FgB5cjd5hguVbMfX/UYJte9hm66mNl4oPU2PEhZhuE9nY6D9wAcZR7keJHUS3voxZTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GabHE7Kd;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60832606A31E
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 18:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60832606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GabHE7Kd
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a3c08d6928so10849811c88.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 10:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716684; x=1796321484; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sv7Rf1rucixu4R1GE8Wfa1cFo464t6/j9QkDaOQ/q4A=;
        b=GabHE7Kdxc8mu5vctb3DspN8pohLsLq0a9NiQFiGGOMdeGPNpsN+JQZ0oTOKSIqFnu
         N/wo/BIX/D5tl7CtFvCoZ3o2sZo9mlcVX63T5q/TEc4qd2ZGeZu8fePI3YoXt0SK5qlQ
         Ofodwz79IHPygvX4T+TsrhfzusSKkJfmwOfRBqT9R9vDxVknWQK19cgTieXrTtaqUFhl
         ofhY8sYa76onsZ6ev3iO+N95ljCJ2EzMqrIbVPwAywULBgQ5nr3XdZ1XB+trPePhlN3m
         ljBc6QqzwPnP/q11vWQ1Ao+AozQUBJ/oUmqn2AzZ6VHgRcP8x8BIz2wJjpZwPluvDRKI
         p8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716684; x=1796321484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sv7Rf1rucixu4R1GE8Wfa1cFo464t6/j9QkDaOQ/q4A=;
        b=ByZlRYwWuNHBKD+aJPpKNJc7CyLa4ITq7rdYsb6MBxpzusgiV/8EbQTGH++/HQFEAc
         r3FFJu6qGjRKo4uAp8ZexZNZi5GEwmuuyXLSbjZG0ARdOyoIrf/Wa2RdFQpyXe3Lr3EG
         iq9t06d1gjOMXGBIMVzv6PvHhxVkuCMRQX18voE4HQv/tYa52vsXr68eTaTltwaSIteq
         clcey4WQrONDD8WnAKI+VGR7hZ5BH9i14qfEjppRy2HJLBUrHgLLoE/+m8irtNDZ2QEm
         PFgYkgNIkXdrDPU5eC8T4FGJUotEstz8xRGOsA6jTJNl9up8UvuCsN7LQ5CPPDnrO17/
         dL0g==
X-Forwarded-Encrypted: i=1; AL+hErHYqwYYFz6Efl5CQxQ2fIpdupS3DggCHg8UCLoAiLdo8ENGQnTlhilIMPi2dFwOpSSY8ebfXdf4Ia26@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z/YlO8ZBjqvCKBBDHKu4dCo6UVecVr+xjPMQM9AOuWhuM9eJwHF
	1QTdIdz5xQCVD7DdOtvP9ARBZjE+r4QxrT/z9vCQxjx+Txs0G64u3NL2
X-Gm-Gg: AZFdTZeG4J3ChDoRI0ekT0NNudQrZnk/QAYhn4kNJlrO8NZYfVGaHn4ZZf6ydKcG6iF
	7L2H92OXV3R0zDRJvW94Gnr5qLcSlBRc23RFXPQHQS2y+tNvdiDOhk6oUlPr1YvG8L7JgbRqbY7
	w1bojJ6DOMA4/44EAu6rEXkJ/o7qjcb+N8PpKLhU0/ARj1g7k+Ggd+3b2rU7PxqaUM1BYBd5TD2
	ISJ1YgEm+LyDgEjJz8Rtclf9kMSxoD6mrqd/L5UA353zPx5HGudbK2WZwgvWUSpMPtI6pL4fvmK
	8t509xix98Wd9sie6crvf1HyrW0m+3n1NZlu5LwL3j2zjDCaBC8gIOlzXRDrkIk6W8VY6S7YzRA
	6Bt8yQbcQfVcM9kxqffxvkCCBeGFZRFmbUQaQyf0y7UomYmiiMABOebew/UKgxI2AJBarytbj1z
	cjT0rII3CCBoBk/ZB06qfh441hhz/F060GsyyXHvyDhoTpPulPMpAtiLGiw08cQxgzX7O7hv0Gr
	MwnIZz3Z5M+nY7riohNuo9soErw5dVWX0c7WjfOdLVGDt+AcZFjEgtuWl0bG24fUr1hvH+JoWfD
	16vDetdbcKRkcZV57Mc66cJfKIbPEfJ4/IhRxKYEJTmbxKyUlhrtoBhxOUBEIZa6v5QRPBr7j5y
	26aTSGQGqNY4Q4pUcNLeD7S4KrzEkAQCn+Yd1NonDQMrE
X-Received: by 2002:a05:701b:2604:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1b5568b9037mr21805969c88.27.1795716684439;
        Thu, 26 Nov 2026 10:11:24 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:24 -0800 (PST)
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
Subject: [PATCH v2 1/9] clocksource/drivers/timer-goldfish: Fix latch corruption with spinlock
Date: Thu, 26 Nov 2026 18:10:53 +0000
Message-ID: <20261126181101.3715754-2-visitorckw@gmail.com>
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
2.56.1.839.g22a8290db9-goog

