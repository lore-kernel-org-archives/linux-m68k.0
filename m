Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E2E23AB9D
	for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 15:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780241172; cv=none; b=FmhFOwRciuK12zNWwedzJ7mE3ilxPWKviy68oYXdO8wIpqzT9zg3fAVr7jLQR00qx4+dUYomi0CnzQ60Vl2c3Feo7RHj/1Ss8YOyVBd3eEBSDkmQvCpFla1xXL+9qYNjoSqPN5+Wm1Uzv/ic87BJmUBRIiEs2C0yFj6WMvdlCws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780241172; c=relaxed/simple;
	bh=n0b364dDBrWM4RGQrGIAbMsbTV+2t0ZGtLdE7nGAO9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QgLdn46uDGjuMp3ZV59jtg78Sa5ajXSmPIJjMAZGRrCeMUI72xJnI3lvG7HoBgiBI/45nOBMQb1Xzjd+QKHIZ4MyGiJkLCDHDfBu3rkfEzbM7yNhQ3JZHUtKrmELPXIkkGhATikaNfDYYRdraHPaRsZgqwUQ45L4rUX8+Dw2S/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RpXZjEjY; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RpXZjEjY"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4600ddc4017so370324f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 08:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241165; x=1780845965; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=;
        b=RpXZjEjYvCB6Fw2JGLXy4HjNTU5Jgv8mytSR6uJudM68WD9LVo5bPe4Hfav58G6omW
         U2QH6FjwuImSx4WvF3j8JjD65SBjJ++GYiOcjGhDYiTORFKnMtZjYh7I90zCZ5Z+1gw8
         VhcGL19gXxkceLSncFOLMF2pj7Wur24e1LE/uGS6nNDFg5ga4cSLFfFl/LvIsloi/l3d
         tTRa+U5Ic8ax05ZQ0L1W4TcnMZDLOgkWBTit8H93XXZbhpzOUS3sWbNx1XM+7sZmKSCV
         MU90fpHvvZSlFGaTw9KhJerQCucpBiAlTKrB4Jjoss54m3E3Hg92CcglTv2YC1Ex69Bm
         CJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241165; x=1780845965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mqVoCiMOeXwzd334lL+Kbbn+xeppyD+CHd7jRk3nty8=;
        b=OeAqrcSoMj4nhMl5ezCowGvYZ5+gac56//FGRb/4Aqie6OXGlbW7TrA4SeWu/D8qWK
         FWSl1IV/eyuKBaBEMIO4UGi0bLN4gmTt9HfaAa+TB8EM/huQlyHnEC1qoaoBCCjqM4yQ
         OmyN3Qr5deQpBgmWFadBOqb3mQP0sgHfZjfNi0x50uWOwDxMec1YQ85z6qTJgZkgAyVq
         S5zmE32RIuXw10D9dlVGaNJW1eKt/In2nS0GIydwVngbNYpceI+6QDcsDsLqRWiKUi7m
         bgarCL/PPqaDPt52UoZ9vzxq/+d406Cmrqv9AUbumHGZrMZZcLeKm+V6agwW+gdgl9+3
         86bQ==
X-Forwarded-Encrypted: i=1; AFNElJ8veyOPLmOUqj1oIDJCbRvnfF1F8lGBdZ1cRIhmKSHq4Tu286ZwwSiSXcLuEUrJN8zelXAwxzSWiLDK@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz0Ylic4aQpbmEeXiSvC/jW+6h6Bq7CE9NhcktMa56KB7Tr5yNT
	qdRLxsk0LuLC0BZn9Mh+Nx7j0xkX3dJWoCU0WQQe1ONbx9OUg5PDkb/aAK4HACH8cqY=
X-Gm-Gg: Acq92OFImOQMMuT5uic+Qq9eDi5RuyE+9iNQk3sVYtTSAaWnI1xnVgcgKW+s42XBUg+
	xGXTGALnm+H+oWzMxKD0AugI71bYaoImnTED6ZgZASgn3uyYLbAvmDUCrxr4x8Kd5LnCKojM7sP
	0gZJKaYrLvzZ6AbaMgl55qSFofzX1kzziu6iy1Tn9w03Cer9GepdvpWuN10VOIfERtMqrBHvvw1
	wFIm9ixs/q0o4FxvwMC6iw1fMMctqJ4bGFzVsV4piSm6oHvbmmrt8LA2Dw82lLejdWKgN7ZqLAY
	YO5tc1t0yLN43+PZVBr4jJ5ZG+Hu4vdb7U99B1W1VOdsCilnU3rngG5gdOYK+qh9SYoA8+Ew7QW
	Wa11dJBEvF4S7hxNa5OQu+FmW9j8cSmD+SC1+feKyrprwKr8NZcSx+5qFAqUay0rEy62fkHuK+w
	k5zJVW4xAyRxJId/SZAJLYtFIg+o4PH4kAwDx2Ybd82w==
X-Received: by 2002:a05:6000:228a:b0:45e:f780:6181 with SMTP id ffacd0b85a97d-45ef7806726mr11531989f8f.23.1780241164634;
        Sun, 31 May 2026 08:26:04 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:26:04 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:25:59 +0200
Subject: [PATCH v4 06/11] m68k: mcf5441x: add CCM registers
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-wip-stmark2-dac-v4-6-7e65ab4215dd@baylibre.com>
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

