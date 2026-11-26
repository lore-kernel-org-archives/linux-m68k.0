Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716698;
	b=lntbEuXEpTNq9YIQ6KTv42HiyX5bMFsG7RW2vhr1UnkqJWwU5FANwIDDC1VC1GlWKp6j
	 Y2PjtFzVf8+V9sl+F2oDZLWJ+ojgisG6ql20K8GGQ756kwvthdeAmDRQ2HEYkLwMMyDb9
	 O1Z7g59WbQrbP8+pis5v2TCLNXGMyFH2fSYk84A8LgPW3JWyIw4AvfQVTC+KPcaUFluZi
	 fXr0eXSOpRch45nHv5jwR3btzf1cHQpfe2HNeuT6+grNcBF71b3w6bgGQUUf/Rc9xJ4wP
	 2v3f+C3U/sSWjb++7Q3FoUwmVu8CIt41xyl5zIQYVbmEq4EC0qownZZZIjt0O1MGvcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sbsm1O/Ieag9dY8M3YCLGdU176C6qc/f0JKOmTZPEHE=;
	b=TH3qXg7jRbMRqsssJjbeXGTCeDRTScq39tn9rMdAiGKnrK/wO0o9VRm1tONwQqxyjg6J
	 mXgLZ/f8RH5cK4qa2QC+yNYPIvu2xJCErHs+hzy1NAH2Nf+0h0KEbspJUyu6HNcfYOIBA
	 tZZheNJTLF385W2A6+RiY4w0oGDSfNeWNQukVwQGyseIlxhU9s6TopCWJSXe/7TvJ1ceI
	 HfNzSSU9GklHl/anLRahpB8Wf1vKPy1J8v9ijajXtMXZnQ/MoxBj42keaCcIrPj0kgmhp
	 K8Gbo78zlLOuPhOZrXITd3KY0zHjX3v8rrnc3gqFi1YXfC1roGP10nW1kSXPKSmFSLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YsZ75emF;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29524606A31C
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 18:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29524606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YsZ75emF
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-18818daa3e7so4098325c88.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 10:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716697; x=1796321497; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sbsm1O/Ieag9dY8M3YCLGdU176C6qc/f0JKOmTZPEHE=;
        b=YsZ75emFdt0Qw8h4m2vJunNZ/vVFMD7Q+Fmo9nWwnRc9iROOS/fuwYodG8QDTnsLfy
         +2W0+OYU5M+Jb9x/aywxE2Xcv5yyz4EBRcrWTyKwuKABqaVp3ASD0jz+k1AhQiKex2LV
         RCcgweQVkiNUAYWimsVUENGCBPxWlfHVgnGbfoqgioKwtRkFfoCuEGsOJ8c/PINDaB1r
         KX8GjcCgBFBRl+zetfsN9MjP5OUcS6RQtTwLO8Z1vw9UO+EY2IkkMX06kn/CmtY8ytmq
         pvoNx6PpFVHlO50Vsb9YYxctxkgo+w34uzxWmUH/SGERaLt5n1QGcbhJnz4dKQviAsIf
         DRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716697; x=1796321497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sbsm1O/Ieag9dY8M3YCLGdU176C6qc/f0JKOmTZPEHE=;
        b=SMPYq3Q3lj9VFCPgRW5Lx+ifyai9uc1rqb6CYVEReprLJvxkqwJOKcJgG/UE7T65jk
         jFdxhvRyROWVuRX2wNzHkifw7Bqz32ZpV2dcHKyj96X1pP6ZmvE/O58/VmewFlpurSN/
         LnfH43fJhjzdeSGJfh+FRnc7KxPnkoFKf/OHEsmqtAAiU5WzPB1cKuzt8oUiCvIM8kfr
         fbV1bGVbBZF/2kFNuH7m17rYD/W2DWnxY7M/bydaekeFESKk9ZEgcDV2jgZu4E6Yed0y
         ar1YgH2wTOKGZbKL3ad3sl4EefojDQ8LvaSh92yDenvXPo/E4F0yVKeDa08oCn6szn9l
         1+Vg==
X-Forwarded-Encrypted: i=1; AL+hErFKBNMIKR04fPB8/UX1ZJRkuJZhTq0ZMrbSM6+lxCGZp4p4M+A46IXBkqrYySfqhFeZ+VvcievUfSTG@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z8vMR67GIV3m7vUWDdScIQDf+Rovq7U3cAb7wAOtprbg1yn4/BM
	Lh0S/8I5lRnqKqWUwrFZ7kbPVWKBe4WIHP0O4WFqroOE996N/1Vyxb/Q
X-Gm-Gg: AZFdTZcyj5cY40P4QqUFy5y3CMhgN+dF+8kDnflYNT74lBibcq71WqnBxzNaBzy/R0Z
	HP6hqFy/rwhcwl/2wHMxDJSm02457OjwEuZHZVuxzUTQBzSUqwnM3SS3YwQn/k+2c5K5dWI8t9l
	F0eQFpRBPzlXxsbfH/XzeWAxo4NHYF8TsPxvKH1vXno5sLIt7B3kqSCOvQL28VIBqXpZLNFzbr6
	6RlJ3QODvTI0+ChkHeFa8kDb9ku7MUvop9MnwpvWB08KslVWmUIO9eXNoRJQxy4/OKCf6imk0Ix
	MRXSjikCib3NDtwv8XTUjy41BwfG5IqbyH1ChIwcpRGn9YGMaL8ZaXaq/FnfB6E1n/LV2j6O4hb
	SdQqqR2dHs+1sTvnHqOL7UdNl58a/gZ6sBHae310yUZfDZqTO5XzMEXVVnfkIKxMzdnNkgxeeVJ
	+5GP/QuT4hBNuAv0F+hrPURi/98MZAVdMJppWBhiJMeYwFVjy24hiaxflJn3cyIUsTEVBluqt92
	MQ38nnnUCR1Fm3hmRnxtwg3uR7JpK4ua1fRsGdficVTK8YxcW3SHR9lYL9zGSy/nXKqm6l77Oig
	3Sm61V2P0ZWyYs088/xEcMBZJdXRY2zOEtnADUBWhBmqY45r0tjEMjawoJekykH/ChN/KWBYiRm
	YkSDaoM4r7dvhRuai5RoSa38F
X-Received: by 2002:a05:7022:1703:b0:1b5:64c0:d2be with SMTP id a92af1059eb24-1b564c0d31fmr16340401c88.19.1795716697184;
        Thu, 26 Nov 2026 10:11:37 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:36 -0800 (PST)
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
Subject: [PATCH v2 4/9] clocksource/drivers/timer-goldfish: Set CLOCK_SOURCE_IS_CONTINUOUS flag
Date: Thu, 26 Nov 2026 18:10:56 +0000
Message-ID: <20261126181101.3715754-5-visitorckw@gmail.com>
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

The goldfish timer is a free-running counter, but timerdrv->cs.flags is
set to 0. Without CLOCK_SOURCE_IS_CONTINUOUS, the clocksource core does
not mark it as valid for high-resolution timers, preventing the kernel
from switching to it when oneshot mode is active:

  [    0.751173] clocksource: Override clocksource goldfish_timer is not currently HRT compatible - deferring

Set .flags to CLOCK_SOURCE_IS_CONTINUOUS.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index 8c312c3a64a6..88253bd1f569 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -139,7 +139,7 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		.rating		= 400,
 		.read		= goldfish_timer_read,
 		.mask		= CLOCKSOURCE_MASK(64),
-		.flags		= 0,
+		.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 		.max_idle_ns	= LONG_MAX,
 	};
 
-- 
2.56.1.839.g22a8290db9-goog

