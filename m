Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716681;
	b=VUPttY4vO7e/1Il3VZ6X1VumjRcfegEtEDio9T6gUcL9euy23TYcqOPe8hF8vQQVd/l2
	 AxgPDkIJLe8bCp/eNdOHWKCApaAHyMxLylgMcs1DYAScg+K2SERmfcX76Ttv46Jsb2lD0
	 nAK6sSLlY7mbQTZ77ZyJpTQkfPWQNfUmTAlV0GQc70jXpKA2XpAO5dqSgnggLTsXlO6HM
	 zXhoPKCbQKiP+cb3CiUxhLn3aBJV8gW/ynE2/H/BIU8YA88MebJTKklyMoOHDeInmU209
	 UlnrxN74vg3Bf/7OqSXx7Qo/yautASNGb+HBRTgk+dXz4ipWi2Ra5MBJGOPKL/Wi7dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xFsTNbg6lSpPb9VHhNPoPU7xGJLiib7jmQ/aLuF0bIU=;
	b=HiezOZr2qLH9OcDiCSSwB5bzgYlPQZITFRbsNZQzZ4O1NaPqOqMsaLJ28ZZvzf7H+ONe
	 J0isEX6Gyg/2oVP9GcdrenwbAQImScd50gcqpm5hbxYtinJb/BqD05cdPB30istEwePEc
	 l/1F0vzZNaVDNCaZ4SGL9+g5dk3o2Fv7Bf714CpBP4J5zPFRapo/zBbwaUPwbOUMO1TSn
	 SCxNWHaRI5b13vRWnE7SR/z0qIx9L3Gh0M3Qta6QBl0A1uIP6A+KhAIqoOz9xklnRDAIk
	 NhWTDQyUAHeQBkPZzGJkbIaJZ6uYITUdbnxev3zos//c0YP99Bs1Opi6bbs00TEzEcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gfa+cjGk;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E982606A31C
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 18:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E982606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gfa+cjGk
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b546061d58so16747857c88.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 10:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716680; x=1796321480; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFsTNbg6lSpPb9VHhNPoPU7xGJLiib7jmQ/aLuF0bIU=;
        b=gfa+cjGkyQlhKhADQcoE+O3KMI6VSF0fu4xL+duO8ggaJsWG5Xwps7yRhOuCngMKAd
         guklqjJHTcanhK8nzaMGKIfgmbwvu2IZ3KubhVWjGlauccIaRIbE0m2TRcfzmZWsR252
         rLy5EJ4HmO7Kt8uQZdXlcwSLdD4u3Kq7jOih+NAJsfjpUwe0D6zUVhkADVgloRK9rTUM
         P3UBqm82OImjmknSa9YL0e+eyyxJfbFeYi0YZO8s9jOPq/wvw7ywnWwCeSHCE6jDJ18D
         QXkAgNeNV2Jizv5DxnnojARawyKaaIIxGkIYhEYzRSnTwwzzAIsqXkUZpgCQZUIUyR6b
         ExwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716680; x=1796321480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFsTNbg6lSpPb9VHhNPoPU7xGJLiib7jmQ/aLuF0bIU=;
        b=Dk2UTMzSR4gMcw/2q1WtIcNXrGGP5YPkqmt2K+88x1HopCy23XooSETeLvd6sDmmcG
         r6v+eeX0pevxauZKV+JvF0wvs3WCc9Aa6rCfySkh/2IV1Lhfp7XwUbTsLj0SpWgSM1O/
         U5KsOO++Dlf9mb7p3Sxl8F9/j/ZoXbpSQfIRLxg04b6jP+NW2BZbfBqG8JhTRR3AegrW
         q+H1j/+vQV41sDyT3xr1ipid7XkiNVb0w5ykIeAEyfV+uaH7Gz/3ZYe5PuemRkCHdX2S
         +n6dYNUnw/XJttzfAl3szaQsop/KCem8Sy7fZlMciukIlvnxTXA3wYgBityMjw2ltzFD
         YxrA==
X-Forwarded-Encrypted: i=1; AL+hErHy/G2GyU9SUgSb8amnyZZ25MtK27LZNXrwHrk9mUOsIvYqRKF9KV9KDz/sbEfNV/KE5KOHRhSfqGXt@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z/qEqNcn7MgomT0ICx4OlfvdV+CS3vDtDdXnDoBTl0Vnm+D+J0y
	/WuIykZ5wHLVTSlWrWH1ZsrrC1jz6pgp2rnuhVldCAsJTPlo/2vcsPb1
X-Gm-Gg: AZFdTZdFR7mCxEbZFrBVCGMhNhumZ1gVXR+5OP7aS+5V4eCgAKDRobs4iN21uXDiMLq
	nIrKYTADIWTvzjcy9swRpBHtwZcQtL5Jp/KsRk80/xq3ISWydYr/Mfku2UbtXgxh72nu432MGbV
	JkugIZJjoXfIvISFY2h/nnKKz/5yK+YYO8uH6vyiPhghrmWXuplXiDZsYYuxDmKq+tc8IGUHvYf
	qwfC/dWRk0kpNUtZmWZpaGEfEPoPrdV6cat2aQGCGFOD81AxZdsk2MUzhJIbyBrUzG2PLtg3XSw
	w24NoLAoXTt+fDiUbFYJEh3YJClLA2e/bqcdcD8s66On3nGznzsAHHLWy1jrqLds94Mhh2/G8sw
	IK1OIpaAz5ykKVTXZnqqrkOQX/2nyR8niiqFPJIb/z9Iu1CyV+bN8sX7PW71OitLOWNIH1dFKc7
	xHUslzMxNXhXInLI2V6OkM5Afh9hBe1liv33nNGrwPVVJXg/eqrfPMQJwg9LSWw1QOM7c2ow2sC
	4XevPiNh3GDTa11qjf1ZhrIgvRaIYGTAIGIIjOYYu5PhipkOT3xTvTKkFEByzkNXael/Q4QWiFE
	Jc9aeprNuoJ1JGEklgHm6rZTHCp3pYb/DGOAR5Lagg2drb6/MS7AhEDNNinfSmDBsk1TVhQiqtd
	Hm998ZA9D1RrHAljzoYci6EE=
X-Received: by 2002:a05:7022:3b8e:b0:1b5:32d7:7d73 with SMTP id a92af1059eb24-1b5568f3283mr26472626c88.30.1795716680250;
        Thu, 26 Nov 2026 10:11:20 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:19 -0800 (PST)
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
Subject: [PATCH v2 0/9] clocksource/drivers/timer-goldfish: Fix bugs and add DT support
Date: Thu, 26 Nov 2026 18:10:52 +0000
Message-ID: <20261126181101.3715754-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
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

The goldfish timer driver was previously only used and tested on
single core m68k virt, but the same device is also present on other
qemu virt machines such as riscv and or1k, where running on SMP exposes
several issues.

Fix the concurrency, oneshot, and registration bugs in the driver, add
device tree probing support so it can be used across these platforms,
and add a MAINTAINERS entry.

Tested on qemu m68k virt and on qemu riscv64 virt with 4 SMP cores. On
riscv64, testing was done by passing clocksource=goldfish_timer on the
kernel command line and locally bumping the clock_event_device rating
above the architected timer to verify both clocksource and oneshot
clockevent operation.
---
Changes in v2:
- Initialize timerdrv->ced.irq alongside cpumask so SMP tick
registration operates on the timer IRQ instead of IRQ 0.
- Set timerdrv->ced.rating to 100 as a base-level rating.
- Change the Kconfig dependency from !RTC_DRV_GOLDFISH to
RTC_DRV_GOLDFISH=n to also exclude the module case.
- Rebase onto latest master.

Link to v1: https://lore.kernel.org/r/20261105161702.3515900-1-visitorckw@gmail.com

Kuan-Wei Chiu (9):
  clocksource/drivers/timer-goldfish: Fix latch corruption with spinlock
  clocksource/drivers/timer-goldfish: Fix oneshot mode spurious
    interrupt
  clocksource/drivers/timer-goldfish: Fix resource leaks in init
  clocksource/drivers/timer-goldfish: Set CLOCK_SOURCE_IS_CONTINUOUS
    flag
  clocksource/drivers/timer-goldfish: Drop redundant max_idle_ns setting
  clocksource/drivers/timer-goldfish: Set clockevent cpumask and irq
  clocksource/drivers/timer-goldfish: Set clock_event_device rating
  clocksource/drivers/timer-goldfish: Add device tree probing support
  MAINTAINERS: Add entry for goldfish timer driver

 MAINTAINERS                          |   6 ++
 drivers/clocksource/Kconfig          |   5 +-
 drivers/clocksource/timer-goldfish.c | 115 +++++++++++++++++++++------
 3 files changed, 101 insertions(+), 25 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

