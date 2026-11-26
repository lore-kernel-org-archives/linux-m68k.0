Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719111;
	b=2rcflQ0EFCnfF0ixiBX7FfxcuRi550dUO699wqlXzPkzPkcYeLVWSVc4hLG+CG+ftnjP
	 6LKwjVDcI2PMLymZsEkWE56wYt0ujLAvXUhSmw8TNKKsCtfssDBJpGplTrBIJWjd4zVYb
	 P1BlUstkOr/wXf/kng45a2DqRPDq7uvMvWaLz0eDOlBv8KGKJLBV5TQgXbybGoaUvI4Uh
	 UjWeymULx4xAuUQCV9k7rfSdt8af041TcUFgv+9fsF0T+qYQJsm0U8sJEOMT7415A+hdV
	 w9mOgEgObdskAd5BBGzOJJPC+DwsQzneVPFSgbV+piC4AzyzS9QUUdo/AkQCmJA7Ecg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kYGOzbA1I+QklP7wQmqOkXCiyHLJXI88dbU0zIHviR0=;
	b=xYDyXpFeDq1dUZ3NFoNeJBxMzPB3nsWKTxx/NhYwLJMKos8Nm6mhgGkuPQ/FittLJXvZ
	 ZsN8iQCjEY2nAnsMVoSKPEleO429I/G2OY/tDphk19mnjrZgqOMdpu9w6JMnm6uj/E9yv
	 FyM9hHM2ywCqkE+wpTbWJZoScbfZ6cOdPcaru16c40Cf9/HjbdWyzYY+3cjIEEXpPwQiW
	 fB8hulC5TWM/8xPMInSRR1M5YkT0VjcWN2reLVDZCLyqhXhrckVEHDqndN9z5mqkJjDai
	 kAuSEy969vnHVnZOwx1cpXqnvWNmdG5Lk7zqqL7ECRXa+N4lCgLPhTijPJf5iaehpPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Af/8wpx6";
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F785606A326
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 18:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F785606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Af/8wpx6
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f03920c4a0so45855575ad.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 10:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795719111; x=1796323911; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYGOzbA1I+QklP7wQmqOkXCiyHLJXI88dbU0zIHviR0=;
        b=Af/8wpx6Lr/EAX3wJzZrL0qhjXHLtJnC6sS58O/S6T6YVL6kMR8r6P7ahzPBOfpCG0
         2XfNZkhN9YdoH/m149n/vGycGdRt/vzRk4odFoZjjjATYqWgNlLZiz5+OA9wvPVA/uAr
         UX2joeyTSMb3sBoekaUWbJBobdbUa3C/TInJO/anz0qYpF7XoJ3ryIR55mFiSqfuHsQ0
         EINcaj3oziMe49p0tqGEx4pOG0nkbbUf2SmwlknDd2/1xSH5Msxu1EEKxf/p8agVaVNK
         OL5tIwwEN7lQl0NJHzcwipHrXI8PlUBoiF3tK4T2y7AoeeitmqZObGBiuvIxQviOFjEu
         DgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719111; x=1796323911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kYGOzbA1I+QklP7wQmqOkXCiyHLJXI88dbU0zIHviR0=;
        b=d1tysgF1W52eA8VgJlLxXW/ASoIEWF6PFTGefIyykYIOOib4FqxluuH/86QSjRge/y
         DjMIfixcg5YhMewmjsWi728fA8odMbLZmYDDFDextIOvNt/XD3X28zIF7GjmKr9hSFt/
         sPbnorwZjTHVI3nN9Ok+503lqTKn71wvlGsQ4d90/qnZydjPgJg8NFBfDFWfE7bUigJD
         AVCHs+nf1meWwtkE7w6ZRqd8DdENOty8fvSUN9QhjQHIkKhkbQ4QR2mG1bmWgrVAgcL2
         I4mtFHRU3fBCwG+zwC1+I/MXTps2Q3wZLuYQ33ZcSuq+IS4Jci8qml2QBidRLQ+p4oMs
         fhFQ==
X-Forwarded-Encrypted: i=1; AL+hErEijTSQoZFIve4m5dwn6MCyjHmIOJILUpMv894cMIBfp6f2RPqj2kjke8qWmwlnZHSxTbfcD0YnGH/P@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z9oXYcKdkljrgq1g1+8RhXFm5oSPkv07GWfKzZfjZi4I9U3blvO
	NCtohyRzBxdV5axDHu5vDtVeyzAt3E2Dvca24gWYVBMPw8B23DuqI8SoSW4zig==
X-Gm-Gg: AZFdTZdDUrmiDcEkC03KAlXZVSw8Je0JR9qe7kifA68nS9CD/hx+2cFT4/S7oEfqYjk
	/BqISx2K48uhnJuTGGlqlgph35U/C/9qyVOFFp4xpBz7ATk20QfanpPOwSQ60roTqfiq7wEltWQ
	O0kzOfQPgJKAmNVQGoWw5x4Ujd/fz7SvDYbXjkDcXa8QGIQ2C9EWWApfk4fA9cExLYSdEeNVRoI
	gYPJtV1It3qtoNWYrwb3iRgkBjWXXpoHD+up3YE1aXgzDAdXlRUDZmHFTEuhlUSvw9c5wU1vg91
	gSSy92qQfeN8uu5dxtWeXZQXh6RrR3eHg67cYzqsVT45vuqHboIDdxpEdwL8PwK8smH0G68KyeQ
	Ntu9ratXspNJOaxfCsC7FG+1QM+XAfTJLdDok968jViekPNsFqhPTKLnl4O+ql8jgQsJc5rxCGN
	VGo6Llxog9EwZGht2locvsBmB5U+qLhL48XEhd+geMrQN7tLhppk47KpBTOshb//auEn3PqaSc8
	lRs6FeJfb7fSQmow30H0KPH7kHtH2SUSRv9+bt9rLRw+50exziou3StkuGIZQNesGOsy9sVlj3e
	fFnyysotJohDdYpmY3/kBG7wRiRXRkHBJvKQsc5NcQFVmcjOnHC4FvIWh0E4KdkcycUcujFlyGv
	QgrAyIOsvb7PTDxwF7QaRP/I=
X-Received: by 2002:a17:902:cf08:b0:2f0:59dd:4d07 with SMTP id d9443c01a7336-2f059dd50f7mr194323705ad.38.1795719110931;
        Thu, 26 Nov 2026 10:51:50 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1276c5sm112041665ad.67.2026.11.26.10.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:51:50 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 5/7] m68k/irq: Add empty irq_eoi callback to auto/user IRQ chips
Date: Thu, 26 Nov 2026 18:51:18 +0000
Message-ID: <20261126185120.3815699-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126185120.3815699-1-visitorckw@gmail.com>
References: <20261126185120.3815699-1-visitorckw@gmail.com>
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

When an irq_chip lacks an irq_eoi callback, chained_irq_enter() falls
back to invoking chip->irq_mask(). On auto_irq_chip and user_irq_chip,
this leads to a NULL pointer dereference because autovector interrupts
are masked via the CPU SR rather than dedicated mask registers.

Add a no-op m68k_irq_eoi() callback to auto_irq_chip and user_irq_chip
so chained interrupt handlers can safely attach to these chips.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/m68k/kernel/ints.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/m68k/kernel/ints.c b/arch/m68k/kernel/ints.c
index cf2b13488476..731d04ac95bd 100644
--- a/arch/m68k/kernel/ints.c
+++ b/arch/m68k/kernel/ints.c
@@ -33,16 +33,22 @@ extern u16 user_irqvec_fixup[];
 
 static int m68k_first_user_vec;
 
+static void m68k_irq_eoi(struct irq_data *data)
+{
+}
+
 static struct irq_chip auto_irq_chip = {
 	.name		= "auto",
 	.irq_startup	= m68k_irq_startup,
 	.irq_shutdown	= m68k_irq_shutdown,
+	.irq_eoi	= m68k_irq_eoi,
 };
 
 static struct irq_chip user_irq_chip = {
 	.name		= "user",
 	.irq_startup	= m68k_irq_startup,
 	.irq_shutdown	= m68k_irq_shutdown,
+	.irq_eoi	= m68k_irq_eoi,
 };
 
 /*
-- 
2.56.1.839.g22a8290db9-goog

