Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895472;
	b=DVtYvRIk/UUbiTMmOT5eeYaRy5SYNuY6hX/9AhLhFScgsaj45NohrcGrDKEwu0PyzqYN
	 29FUnowY4rnoupjFpIszt4UCJjx6b3F4XyC8o/n0YEDJnShpVzZzS0iT81DylhrHcKhPi
	 NPIm0UjIQyP7SWdhvFVcBUgiLy6Odfan/VF4UtEf1IFzkbEUgi7b2dnSNutPTqf2Dx9o0
	 Op+H+JZ19Enu1jYV9yrBtjoS7TxalwN4TMobEh56ngJhRFA97hi+7isDdz4jwcjEzvybs
	 w0B5rOCSVRbNFfXyqfkXHbgylIZWxm7bCll7Jqq/zbai/Sq8obXDGqwEs5vGkXzRsZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1d0Bz7grZ5N14ov6UkXjfbPvCgrK/lOG24d5Ad8AHHw=;
	b=PWO6dFOQKUJjC1qfHTQxIvP1CVjZWScogYU/2aFzTILMnq1++K84DytR1v/WbD3EZEyF
	 crjP2prpumaGo1Gozwrl8aTB1fNBwomcPhXyGgVkfPORyqS6FsgwAPo1cZX4zhLvFNY3m
	 3cbKZ5VqD75TbVjpYhxISD0ZkySLoaM55o7h+KS93fj97OeNxX938sPEx2arVRqsfGJPS
	 8kgPovmIQW6RK3WkddQb9BXgriH4FNxkCGSQhM75sESCPxuqOw2ZhPpy9s88HJLaQx6sX
	 hk4j7N4w5fsXXUyWKIYXdUpEm2dgkhY2MN4nkEYU64XFHYifkWmobbY5nvIdaa7rBSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wNqKm6hi;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65C4606A331
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 16:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D65C4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wNqKm6hi
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so1391320a91.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Nov 2026 08:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895471; x=1794500271; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1d0Bz7grZ5N14ov6UkXjfbPvCgrK/lOG24d5Ad8AHHw=;
        b=wNqKm6hivrWnq6W+lR+8MXAG05uYLB1NQvjWd60Ietg+SMpzFzRFI5O3dc3uKAuexn
         WG8RnQwjKHEmHhYGhrNlsJMtbatvuCZFEuG4MT5JGNoCmwblI1miZl32/5LEEcEdkozP
         Hmjhic0n1K+RsjH6wJxvFN1bb5W5yPaP+rrO+GiU5gisYW+I6ER0IStXZaQYCi7r0dDr
         pZlzAGuzAjChgNQ5TYlzKlLjcaZUf01QcucjAkb9Le/m9brczfeuimiCN08CqsC5EQD1
         XvK1cUiM+fmqwma5zENRKFr7FrdjHBBz4JrEG+dCNhJPja6D0bTEBfz/uD907c5cxjKO
         Ngzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895471; x=1794500271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1d0Bz7grZ5N14ov6UkXjfbPvCgrK/lOG24d5Ad8AHHw=;
        b=UGtpwk4mMTcyQZUec9oF4H3CBiOoe/nHdO71LV5xnepBu61ypf3FcNaen8unk1Nf92
         eUtPLh8mjIddeEbOL6t2yV6QyBeOX4gTzFpnDUc/1Y6804qPpFLAJYNBb9AbDHybWiWR
         8N9w3QA+HTH8OngkQPxiV/VMbmrc8BmBTcWmyIwq0peFhblf3gLyZG16JsUSm70OgHsS
         diy4XZq43Fz2vNLUNrZanvuPWLvGjRIBE2wplRn2kGGH2rspa5/TRqTGHnRHkAdI2Y61
         HcCJhgapVFpD5DQQbu2ftDwmXi0pSocweV76aajjKQ9+96c0LXN6U+p67funs6QCoDE2
         v/VQ==
X-Forwarded-Encrypted: i=1; AKwUvByLqKpHLcFSL1u8fKxyIfin5f6BxJua3xtES8r2W3qJGpLjd3LtYXg3MYfWD4aJzMB5XNfOQNARIff6@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z+3xw0ie36SJ/MJjny0p3TG58amCz5KFAVyWVKueABIpFmfrBaI
	CiSugOVeBmyqkrHRw1D4et2mKdnGdj3bMABh4xfMO29alY6k7bracUOq
X-Gm-Gg: AYBFou004N0DukbqpESPgvLy0sCMm+5yieuSL8T36pYh6mYO6x3ALEjHUnyN+Kc8ahQ
	qXkGhEyZcQwLs/r9bYrUmYIK2kkBYH7cMgj8ELA0O8jKAKIs6J50OnY8enOJi+fbhiHwDhPS0VK
	Vl4P0rKODkPspzUJvxhCIdUcPgRk8KMVRQBkJH708vvL1RhyC7FkxMKNBjxP+CAekSFVEVclGG7
	Ejyiw2CqEK+v1WD/UU0uW4PvONTcX09c5/RAZ+SpAOz0Cd7XTWUUExCvd+5A57MrMLtkq/YVEVo
	1A3jUKmEUTKJFIPwawlNkV4EwutQdELJF9jdlALoCZnTty9QKq81yQMF4PWQxz1zdZfhrFTpE6Y
	kpEt67oed4Bvv0m+BqaIBFf/4zParkeXQslom9FuvCR6nO1FPu6qEQeapFWzAtShfzCYzDEI5by
	zcsu0AOdBlzHvkSs6EovzbPAwmh4w4Td99br7sugXTUND7uAOs0Eogqn9MhzrMSoKJougtq7WPg
	QIngGQl+87loxNmYQebv7mWxcd0K9XdeaTMYtZWVa3xnuRFPT2QqfFITpkT/ZBU9U74Fqd24Yks
	OMBYIRaz4jTucYdIa+zukRWN5yMBnRHrb19nSikj5s1PpPnc7mInSfkAdjMAr3riEnivKLiqfnD
	xNzfmRA4RK+9V0my6fVdBsjI=
X-Received: by 2002:a17:90b:3844:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3ae89814e4fmr17090993a91.30.1793895471151;
        Thu, 05 Nov 2026 08:17:51 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:17:50 -0800 (PST)
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
Subject: [PATCH 4/8] clocksource/drivers/timer-goldfish: Set CLOCK_SOURCE_IS_CONTINUOUS flag
Date: Thu,  5 Nov 2026 16:16:58 +0000
Message-ID: <20261105161702.3515900-5-visitorckw@gmail.com>
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
2.56.0.398.g882cbad275-goog

