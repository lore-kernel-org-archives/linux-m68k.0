Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367A138C423
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 21:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484885; cv=none; b=eMBgGAuzjTQLV+8Jpqs1Zh3/RffPyUQb4TVEqNgQwPMqlC1SdMdxPBRpYTx6dznOSVyozvCcpVPggsgPSfKWl15XGS0Sio6gSZkfiEQGUrAP4LfuF6LLsnYHl0WsgzN92yTnfNVr35JJFi+aZkgeEhDhY727ZCBJdd/8vITc7UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484885; c=relaxed/simple;
	bh=n0b364dDBrWM4RGQrGIAbMsbTV+2t0ZGtLdE7nGAO9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YOJ3aDfdERc1GHb55LCDaU0vJQvPO/cJ4QMm5aol/fKqG5EUzyXW9m9SOzSN3hKu4o9gWLqwImFQanC4jwQZp1gE1onlacOCzUaji0ggvVCmmM8BpGNtcHNB99Ipi05A6rJMDXN1j/sVMlrra0+daAtPtfGugrexLXFRp1xixYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RlounK5d; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RlounK5d"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d75312379so6564376f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 14:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484883; x=1780089683; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=;
        b=RlounK5d0JQLWtNUXoWdzTFV/MNOh1eFeJSKFypEkGgwnhUlj+yCaOh6RtXz1aYb5o
         gZgzMbRpd+Dhp6WD7QhoSVE4Nh7gqObHc3xMB/3FBrMURD6nPLfciAJ7sjfHuuGJC23c
         yBbe5VUaUX5c6Hrg7tkhEpr25iItD+4C5hKraqnUqGaXGzQ8GYmafWfYJWmTRUdCASqT
         fGl8ntEpTpJ2jS0YUO7k0ufPjPSm1/p47J7gXXp6SIPqjJk++d8sq2Jx6cO8/5qZ61Lr
         DZlrINnDli8uwkOj4q33VLXlZwo3FypsjjkVv7pYsSSfi1/J2K5DUTh8er6yThFWrJi0
         FCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484883; x=1780089683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=;
        b=F8pNYZllOsGVICLILPT0eA8kFAvwQQs7YuZi92XtDvSBgTcbQHiOjliSbG+tqE0upF
         OKc6lwEVILCrvt/k2mplmvYaVus9wtl7vAiqhBxQoJ4O06ml4+ODQKMqV7yOQxSIdCNU
         c17hQaflzRvimLv+3g/iLHWoWhU5W3qX+yDLINdXMmbT8YGJtVgEXCBfcE21kzLKu1wF
         6HLVoIe/WeLHYctopuVBjYfQFMKV286oX0jKwwc7ZBDWlew6spTnlgvzViSV/gKAllTj
         +l6+aC2fGyGNh0oo1+pxi64anTUHz/Jk1+cBkbOBl/eHBWB23ChXQHmRGBNOtxfkHPNT
         L/rg==
X-Forwarded-Encrypted: i=1; AFNElJ/QGt8avZx1rOtgKOfgYL7So6j2tlrVAvREa3dHXHWQLH3hH9xHX+zDpL52K7OSGlmlcJdNdzf1qf+L@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzGpvYFCWM59lCVwqbdj+bvYYE+Dc2JRW1YePTmBsFDtZtmRbEX
	ePkG0CCwCrqPTg53YJcmPD918as0VxLLQZrTNbR9HPXwZXwPRuGESQKWHGLYl3pvkYY=
X-Gm-Gg: Acq92OG/DOVLkTt3Ft3uGMigfBUetKx7FEIIAaTfPgBwcmhjXhOcaV7xU7h3qVVTfuv
	4cUWq0BPqmiWEWrNZZizxwoDXsjzTgfS5KiOL1cG9pNJZF2HrX2J0EXQPyuF0hrBhTSyUaaF1uU
	usVR4g82M6d9CLvTJTQwKGPm9/N2JQDnZPSsKmBhrNAYQCikIAP+zEOMmaE5zxTqHOh3rw6y45s
	+FIo4zlxBqNMraIfegmBaiHaSfH6JNUqGtNYB9/cTObJZi5i5tU5OKRWCLZfZoTgVhlX3AhKXYi
	04QzcxXOpegR173t+L8rffq9tZ6eVGNjOiCn1xFC88mTLupgW2BLyuUO6aX9r+0+aiY8eQv9SxG
	JBVM8mNZKYg9UfKxpIZH6kNhyMW8tMrAeS/q/4/6NXF2U/wH1AJKwNbF53xyWkUuj4mZOlvwAe3
	adnduZEes4oanJacbTd13b/godu4zxOeA=
X-Received: by 2002:a05:600c:3b07:b0:490:f7c:b19 with SMTP id 5b1f17b1804b1-490420f67f5mr63502345e9.0.1779484882631;
        Fri, 22 May 2026 14:21:22 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:22 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:34 +0200
Subject: [PATCH v3 06/11] m68k: mcf5441x: add CCM registers
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-6-16be0ad35a67@baylibre.com>
References: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
In-Reply-To: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2

From: Angelo Dureghello <adureghello@baylibre.com>

Add CCM module register offsets.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/include/asm/m5441xsim.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index f5acc962bb95..9ce2cbb05316 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -125,6 +125,26 @@
 #define MCFPM_PPMHR1		0xfc040038
 #define MCFPM_PPMLR1		0xfc04003c
 #define MCFPM_LPCR		0xec090007
+
+/*
+ * Chip Configuration Module (CCM).
+ */
+#define MCF_CCM_CCR		0xec090004
+#define MCF_CCM_RCON		0xec090008
+#define MCF_CCM_CIR		0xec09000a
+#define MCF_CCM_MISCCR		0xec09000e
+#define MCF_CCM_CDRH		0xec090010
+#define MCF_CCM_CDRL		0xec090012
+#define MCF_CCM_UOCSR		0xec090014
+#define MCF_CCM_UHCSR		0xec090016
+#define MCF_CCM_MISCCR3		0xec090018
+#define MCF_CCM_MISCCR2		0xec09001a
+#define MCF_CCM_ADCTSR		0xec09001c
+#define MCF_CCM_DACTSR		0xec09001e
+#define MCF_CCM_SBFSR		0xec090020
+#define MCF_CCM_SBFCR		0xec090022
+#define MCF_CCM_FNACR		0xec090024
+
 /*
  *  UART module.
  */

-- 
2.54.0

