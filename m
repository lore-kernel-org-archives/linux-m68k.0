Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE293911CA
	for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 15:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780241170; cv=none; b=ih/CrNvEQfsLgfptgnC0f75wcig2jrIbcTJbRbT4c/kz98ktC5ITXiNu/TxMrfAAg1+MPiALyx7KYmCPNwU5AgpVDnGnnsgkMQGscpyml2rstarSlWvP6AZFQ+rcnStjGryfypPWEQlnkF2prk+kWX1yyfU5BQQeDjkLAx5kdH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780241170; c=relaxed/simple;
	bh=BTzMq5e9Ct1iS05RorpLyh1aN78tCIlpP86CvhH3+is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qFufN9Em8N5+tP19uVJ4GBN8uiX9P7YPNNzKvkXE6soeNQxZEsxbxivuME9kuPi976DZXe7HaC8QP1qjnaEtceW5TSgvErv2oMpCutBC4DJ6MgJQPOwH7CKBCiuNLwH3EXZYrZg/bqlre4TIupn9AYDjQv9NshEEuBix+AKZsxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KrDEtEaH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KrDEtEaH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso82239155e9.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 08:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241163; x=1780845963; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
        b=KrDEtEaHDnxTdj/Ot9ftDF1WOCxDxSSUK68BhenzKQYmw8SSXg8iVQbm0Kfnn5FoLU
         8WSoXmXrcBA24/26V2xsmGm822W8EdXyZoZIwfecvB2amz5snmWB0UWRLu0oucnfe0bK
         AsLavJnmCWoNB05TZjTktik8Kg5DJ46PoDbLcQGLaR6MS2YHKLuatCibu2KEwtUS0qHi
         AuBXdkqwZOojzXOfQayG0Vajjx0757k52yqYrjNwUi4DjtCjYhy3jraO9RK7pBKeIV/T
         Q33pmcyTaCOc8fPNZe1LqRhSerApiqi1jWCZ1cmAtRMGIVRMVq7nQ+1g/Hb7GRvYrIYv
         xZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241163; x=1780845963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
        b=ZPhEFD9c3dpqgJDuYbPh1x7vJ/oF4/c4Hjf4lss3aaVjsnQc/1C+E7IPRtu96w9GnI
         SdEHxNldfBdNYg6jRt5rZHapcXatL5ARyhrDziGaIRzbItDbM8aI3a7Y/0JhSI5AnFaH
         ajJT06C+AxT5g3T8DOT3Fy0wqZMqaoTKEz4ymyHJmF6pJczfOuxQ7fTin2dRvgfnyFaX
         F1hkaOCsOuL5qSMe+LUneMdUIjMLvW8PtsSILCkc5Gbm/qgvOWzQSPZ9beY/M8RiEj75
         W4Lukx/cTWY2eF15PavhUYnUUUKbk0Wg4pIuNXeJwiA02/5Zoa1unwD2Xg0ZPZbJAym8
         pyCg==
X-Forwarded-Encrypted: i=1; AFNElJ8lGVVdNUyVdB5g2fiOIWh6VFZjn5XSsmwnhO/2FHTPNJoYINCByD5TFMbRYiOirQ74fVO1xJY1g1Lg@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YySClBpl4cl63huKRqxSNPab+bIE2Nzgq7rvlXIxe6SYAqNlA0+
	5mH/ugKLlG3cBlI4oy0r/47BZ8+obCSA0qME2BK3JmGI+qfAgw05yqdrqQUiLy7vsrU=
X-Gm-Gg: Acq92OGGV+2Jp7VYYodG1r8hvzHblpcp/dDySyX3dUDYJfcqJGow2PwVwhWbSUNn0l5
	nY4qeXMO1cBewbVlOJrZ5uAcRPqzOff1VvQfNYghRQHBZv54swkkxNfpSC5DKOnFh97ZBvGyMzL
	GjlyMNNPn5xcuCluYnoHsULaP98uO2R8j21XYuZvKyJ6lfD9vf5iw9nw020wJEUQ5p523fHG8+L
	QCJQQq6WhlkLoiDMV3EFluMIpBsq5ffB3GSk1cZISng+IasjfGg0icqsHydQLLcwNXyNelfYr0o
	w9U/KmVSqlwp2hO8CMN1gXbGrfEEw3dInCAuXjUagctY6B/ZCw4ed+/8BqqN1kUNL9kSZjZ28C1
	jBffbEHdognUcVJyCYret+U+fdnmRn3iHGSiZaHqHR++FV0POdcWQ+vfX9mEzW4/Ob+H0v/NaT+
	wLpsiGECDOhNgR0UOlGL35gqDeLV2eO93FrnbpTw1VMg==
X-Received: by 2002:a05:600c:8b77:b0:48a:9428:5522 with SMTP id 5b1f17b1804b1-490a293a0b1mr146990245e9.16.1780241163614;
        Sun, 31 May 2026 08:26:03 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:26:03 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:25:58 +0200
Subject: [PATCH v4 05/11] m68k: add DAC modules base addresses
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-wip-stmark2-dac-v4-5-7e65ab4215dd@baylibre.com>
References: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
In-Reply-To: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
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

Add DAC controller 0 and 1 base addresses.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/include/asm/m5441xsim.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index f48cf63bd782..f5acc962bb95 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -191,6 +191,11 @@
 #define MCFEPORT_EPPAR		0xfc090000
 #define MCFEPORT_EPIER		0xfc090003
 #define MCFEPORT_EPFR		0xfc090006
+/*
+ * DAC Modules.
+ */
+#define MCFDAC_BASE0		0xfc098000
+#define MCFDAC_BASE1		0xfc09c000
 /*
  *  RTC Module.
  */

-- 
2.54.0

