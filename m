Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716706;
	b=FA7vRtbSyQUX99NvhCGCjPUzhO7VNsMpNbLNTYYPWk0HigqbIUZqvXT7wuE9PC7xZJHe
	 OJNRoT1UCYA8Ww704cCi18JtSAM60mK005rXkNbNShCDxabnQlP9ymshCDWty1KAqRxCd
	 KJmONPDg9Zc1NTa3MKLAM6leYhaCC9h/3aM/zaUyL3eXw9QLnzxvYhNUg8m8tnvon2W18
	 RrfL4+pZs2OLnUdbwSahm2+/A5P4361h0riopTbwTpjR/8DMXRzlUBmsDm6QfUAXg8eJ5
	 PIKdLbOuC502bE3YiEqrlmUvJtaHRHD6Yx0RawViklgQ2/MPYriRh6Ydcl4IpHzhLwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tTqdS1wkhoOx4s8KNOVkD5SGCfJqX6Ojt+FCLZbfQm4=;
	b=Aw/hpRMEsoWIXH//PIuYDP3gRk9i1lJWgO8hzxE+zPUrfKHF5/mByXDJjSfKKec9YWUi
	 5+S3WtoYbVhZSTtLu2+hx8t5SlZHjC6l4HR8J2jrF2OfI05hV5dJlFTsqrnnRxgtD8jS6
	 Oz0krb3yljSeab9hh8bMUUEvrQztSOC3Tl/Il+Z3uDTYoYrJQ6PN9zDAfjqKRDqtW8LI4
	 IEfeFRfeuVgyk+fbHRw58x0cwI3fvFNOFouiK9U1GeqyfJf6caZPxi7pXJ4azZ9+nqt+y
	 NILvXLkF3GBL/JqmcqGFDnvdLCju8+VXNBPRBq5NkH0YPNPpkP/3cZmzRy2cE9+pgVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CNZqTIAf;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69888606A321
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 18:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69888606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CNZqTIAf
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b589050416so1452010c88.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 10:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716705; x=1796321505; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tTqdS1wkhoOx4s8KNOVkD5SGCfJqX6Ojt+FCLZbfQm4=;
        b=CNZqTIAfIohla+HVudwo5docsbYj1slUm8hnUUBqQHOjPgcwqj7Noh3w6kJdYjLDDM
         vE3HiUHHLQDzFekYVnZ/JHITB/KCSx2DeOJvimSDoChAYeKWxSHrKUWRf58beIIk6bLt
         hNpfTkS9fWfe+ytwBWT4OOc+Gp5tD1nEx6hgKua9oGGNDikpAQ9yu7JHpPGz1uoE83Ij
         HSiGywlOVe2/MFE0p7OqHLW0mN5nZsIT9TnEYpul1RZIF4pT+xJzQoHrLZzD9o7ZecQf
         dalo7bxIsGtMyvJnPDzwg+4K9vt7NZ/o5n0SSljr6dUeuCwUrMLSfsATwC6Lg4CRGWKv
         59Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716705; x=1796321505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tTqdS1wkhoOx4s8KNOVkD5SGCfJqX6Ojt+FCLZbfQm4=;
        b=XbrvbnNVqY3iNk5TMTCkdSbh/2+1z6It/ypuOgwnRaJlUJ/R3JKmcr3oeDos3b/jG2
         5zJJhn9ZmLR+83mLjdrrEi/F0JS1Hp/dC2lMmluXta16rmZJ9DSk6Jx1Hq/ZXa7vQvTi
         QDmXdexIHB0qH+5uJLReD/d6GgCh//F2lc2nXcLnYmuarRRltLLxkd3uSCSl7fsAfOIz
         d+XBAPOYNU0s7+osirhrIR0kM//pK56Zlm4G7ldODLMnh/qt4TvniMuP8igqDCyngOe/
         Gk3TgqEp8ig5rdplMKo+9ibEMpDqqOAIW5gVjX/guumpeSWpuqQ7/FlBFWSYEbqsW3ye
         V0nA==
X-Forwarded-Encrypted: i=1; AL+hErHhPqNCb3sjOhfnSK/nzsXkdzLSd5wnIV0cpBbtl/yYxwm4VQqsQc48GkpCnJ5kujfX9eNF3hRjyYFv@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z+oNX4/fnDtbtw4+iDrghPlPcIcsaVsqfEURUva0P8Oj1ydgIa5
	2up0N7iJRl0y+eqzzyppyinR3PYRi482DL6dzR5VnVH+fPALjLtiG3Az
X-Gm-Gg: AZFdTZePCF9DSl6t0GvguKo1EUlZUQPPVO+DkwHCj0QjXW0bPhdzRxsxj3jtU9sKExS
	gOkbssvNO2gYZCY8OAAqK0dwVBLmRE22kRvUV7/sSGsa3iRs6yRncYSpwwAa+kPc6l8HquxBjrj
	tLxPTEDtWJYZtDQgg6fyA1a+iDetcuYp9qmV1VE9rFV9uwun1h/+X42JGfb68JT3VcjEAkxKOTV
	tLZsGTzHK5RghvxvijUQ/uIXC7mehMw6YqmS5VirfdHrswxi7Tt2RAgmH8grOnsQWLrD4adwtNj
	kaYSoF1m9CfndDz2elhdDucKO4+/qbXNP2i0HtYTIUETmJ5X9NjHEoCGSMUf07lB3rr42J87K53
	c5C9QrbUr0GorrFYOMSUWBUUIrCgLcaiS/rA2AA14bqM9E6VYQ77f05s0j20fwV0hbdL1kb7QDZ
	DSghlGen0r97gQuH5xbC264EnAm/HFywXsLI0aukIaypzdsu6fzTfy9YMNiVfgCklpRLXodXUNK
	Kjc+Q8EG82ykkvYFS4zTjpFANAI/JD7DlwMlfrmDC0M3ZHAc2bV3FdT/93VU2OXUlREB7jMvfZ0
	W2sfQi+xg8vp2otvYbA+9x3ZuF2BCZgRvj91q+4ToA82PExpTIn6OTDxsYASW5x1f4Da7uZLBhP
	sC62Le0FUplvQoHdQhx9dKXw=
X-Received: by 2002:a05:701a:ca09:b0:176:2095:1ac4 with SMTP id a92af1059eb24-1b5568cf673mr23372420c88.18.1795716705591;
        Thu, 26 Nov 2026 10:11:45 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:45 -0800 (PST)
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
Subject: [PATCH v2 6/9] clocksource/drivers/timer-goldfish: Set clockevent cpumask and irq
Date: Thu, 26 Nov 2026 18:10:58 +0000
Message-ID: <20261126181101.3715754-7-visitorckw@gmail.com>
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

Leaving timerdrv->ced.cpumask uninitialized triggers a warning in
clockevents_register_device() when num_possible_cpus() > 1. Once
.cpumask is set to cpu_possible_mask, leaving .irq zero-initialized
causes tick_check_percpu() and tick_setup_device() to operate on IRQ 0
instead of the timer IRQ on SMP systems.

Initialize .cpumask to cpu_possible_mask and .irq to irq.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index bac84e0f9b7b..93a92a823f8c 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -117,6 +117,8 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 	timerdrv->ced = (struct clock_event_device){
 		.name			= "goldfish_timer",
 		.features		= CLOCK_EVT_FEAT_ONESHOT,
+		.cpumask		= cpu_possible_mask,
+		.irq			= irq,
 		.set_state_shutdown	= goldfish_timer_shutdown,
 		.set_state_oneshot      = goldfish_timer_set_oneshot,
 		.set_next_event		= goldfish_timer_next_event,
-- 
2.56.1.839.g22a8290db9-goog

