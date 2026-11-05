Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895480;
	b=akuH7hkexk3Gk6nvOtNC55ExvmPMMPFslaJNage36SAG6Yu/aVIuodeVQvsc78uPtoUt
	 X3nb01NmRfICLubQhRmO8RScbVRy7k+acuARgeEL4c2dTGAjgF9iU4UCXUHbMI6zI75ex
	 qw6dFnmgl4+uIB6IPe7ET6mvmnQRyGTwU0o6gTYAYuLumoz/bkNo2K8wGWoCNhatD7Ib0
	 ju/8cj61jsybHMAnIKwGbQh4X6vvma3Dt9O8KZvR1AnMs7B8OWNK7O02MG3KlqPP6UnIa
	 sKM8S6SUwunLwToI0IQ5I4rzH0O+R3PMDuGfxauOQZqVWsuLzvv8qIo2tNX9apELJ7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SrmULYxl+TwwnBiId1/h/KU7Rxvetx2iu6+IpbiBV3g=;
	b=pYbpjN5P2BJ8i755ClG5CZ4WQSjcz/YFB63OIKh/MJu5NNP4fkRFeO1kYWSxnvwGKq5R
	 ZHwU9Gk7HNJF6AV7mLIusZ8KRwJEKwS7Ib2cfxv39gFOfgQ4tcSY1acLY0WgGrnbI3byg
	 BNqYHIz2vY4hvHVgXlk18uS5eDJ0fDCCz4CK449oXshzJOtbWb8wqq0GQANkl4f3ywvMg
	 NjxwkPOrQqnMhXNWuiJnrHJuNnfDVOi1VbyAdrOxOqruqO/4ffalzr01ecH8wnAAtg4ip
	 lagW449nc4k5ZE4Wd5NurQm0D3j4jSPC8uBIKiQwJX466cXFwhPkHIY+r90SO7BLl/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VHcfe9eC;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72665606A31B
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 16:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72665606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VHcfe9eC
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so597625a91.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Nov 2026 08:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895480; x=1794500280; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SrmULYxl+TwwnBiId1/h/KU7Rxvetx2iu6+IpbiBV3g=;
        b=VHcfe9eC7PCTZ/IYluRYmWl/CYjGnDWGeuWGrHwiAmtxkPOUmxkCi5HiNUNPs7KHdi
         9Hzx+U7g6qwmoSlcA7BPmgf8JoUsG3FzDEllZjWadvlZpbf/pRzqTTPDGQF1dBMJ0JbY
         4JWXHmAnO/0xW6OeNrN61kdu/GErSE6Asrg1ypPuxEqq4vLGsvcN4JrAobRF9pnSjiNL
         RGtIKq+vS9muu2QIzkUJYC5oSRicbHSylsbPMPYrr3QvocqKsie1od7SUMKGbwT3ggXO
         QhFH3bI6q6L2ZXndJsOH1ScgfPL9+qClBkSPdcUMmR5Ku94sOJdBA+C2kDCftQhjB1g9
         I07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895480; x=1794500280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SrmULYxl+TwwnBiId1/h/KU7Rxvetx2iu6+IpbiBV3g=;
        b=sFvlHoFMuuCmX9betcFJZ0DpuomVbji03z/tPAQvfSbu5FN7N8lpc1gXdvR67yNRgU
         LdEZVpJvyum43bOJ9bSc1MUS6bCWSz9UanfwRx83hDvgJpLbDsgYGWSHVu2bM1B8SKI+
         Vhovo9jLQVVgxI58F2kglRXSovfKFH2w+k6qyEvkGQ8zheD6JipxeHRmOLRpNsxdexZO
         wsghbFa0HfSp51bmk20vMODIJBP9r+uRbbgVeUIRXtiySQAUchFVPl39f6pDN9XLAH4K
         EFbRu2n2A6C5BQO36uiFMl1eVIfmakVPi+yMnZcbWqlBgmzd9Sz+V3atWqtpdjoH+v+7
         yvBA==
X-Forwarded-Encrypted: i=1; AKwUvBxM91GMoMze00Ee6clEtKy7/GksJUKx3UmrKGXhgt1jn0F3m1r7/ceWyZbpbiICFUoO4M76yxyNyzlu@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z+oN05kXjnjoRlLjIoIQrAs1Epbdeq9rK+JcEcPZfeMTFSAWAhb
	QP4riUuYs70FJU/u1MiEyAwvp7hh2bEw31MTskuhiYBPCKaR7NDaT0si
X-Gm-Gg: AYBFou3N/Btpii3ueRS0d28zOcdQsRkVNvS4SQb2u2XCQE6y8ISo+hhyFlWLAGEP1iC
	gr0Wq4qpngkBmm1hGscPltUeDdyFIihwehqgW2dEIWQAXFJ3zOCUFq0YzGFOrtoJoiVMUBfawIu
	qtz133IILsWr5PViG9bZuJdReCkpa7Y/r40NUC9IBij2MR3C9iBBoBh4OjbgQgYFw+Ed+kgtCWb
	kViYad+Clj5HVXst3M+fTfJzXrFtxG1PgUC1iYM5tud13io2jUqR8kYGucRDTDoBvXyY/iN8XO1
	J443kQpnA5SVGRU9hS+JE9XGUv/jfqj+k59k12aF08fV15AkDEm1OBhi7U5x8CFBxdxACItmW5B
	dfgW40OH635yQ0VaHJshd6h7uuQDzQ/bcjbfrUVMN9Oco2oirv6pbEFiQ5Zh68+VS0uO4fLOxiA
	BpaZ9knULmET04lRM7kcgsMzz18nHHEneUSGYa9+y6EPaE7bLx8kcHXp3CeY8Sm/Fpv4e49fWDi
	ks88YFNLi172FXTiplSuJV3dv3DyEiX1cf4DyhlqZLPUYLXzAjAAwn6Ct3EpTBza3qvpEW7YXuK
	ncfm1mI2SPqx1msEHhbqN5A9Cjnd2FH/0P9gbQVfogKdYGUzghadRoIC18WP33wSDl7Qsx1oUtY
	o53CMMh2dXWtwq/1e3P6475/8
X-Received: by 2002:a17:90b:4486:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b0afbf69a0mr1776647a91.8.1793895479717;
        Thu, 05 Nov 2026 08:17:59 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:17:59 -0800 (PST)
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
Subject: [PATCH 5/8] clocksource/drivers/timer-goldfish: Drop redundant max_idle_ns setting
Date: Thu,  5 Nov 2026 16:16:59 +0000
Message-ID: <20261105161702.3515900-6-visitorckw@gmail.com>
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

clocksource_register_hz() automatically calculates cs->max_idle_ns, so
the explicit max_idle_ns assignment in goldfish_timer_init() is
redundant and overwritten during registration.

Remove the redundant assignment.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index 88253bd1f569..bac84e0f9b7b 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -140,7 +140,6 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		.read		= goldfish_timer_read,
 		.mask		= CLOCKSOURCE_MASK(64),
 		.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
-		.max_idle_ns	= LONG_MAX,
 	};
 
 	ret = clocksource_register_hz(&timerdrv->cs, NSEC_PER_SEC);
-- 
2.56.0.398.g882cbad275-goog

