Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B0A3E5A0E
	for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 09:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663686; cv=none; b=q2iOk0Y4fymI+Shc6fV1/NnJ67Z+eDTBTnNC0V2ccQmscl+gAK/2iNxKgJADBKXW8aXxPuOdTNIwHiSK7qfUVk9HpaJKTo0igNp1AnlZZS3GODq0EJrL2WqzN88H73RbPPYWCy93JUANe4bQYRbi5rwXXpIswThyDrvr0uSMEb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663686; c=relaxed/simple;
	bh=cCfgqnRnFnpsCU7wcsZn8o9ArxI6gMZX+08aJp/mfDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NnSRx1c+wotoBDRUtLXnOmzVJm0gTJ86jAiVhiBqdQ3yA4JOy2Wq0RGqDGw1z8zMiNCdigPieDnGQm6bjT/5yhs0/mY1vBS5G+5dlA5xOVhW0jaOc7yLJMvCOhTj/t9N1hPI0urEEA3JdFalfHA66aGPOQVjHih/9+xpcUQb2Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=uTkjwdb6; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="uTkjwdb6"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so109405205e9.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 May 2026 02:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663684; x=1779268484; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VB4PgcZ01Fib8r6PBjxZYMBn+UiSZUTB5bok31SdtI=;
        b=uTkjwdb6VJvGQ9w1JBnMi2aqBra/2urB34EpDfP1GePQYD8YNELRx61iM4scUPttFB
         CeOH6iVnp0eszKJvuTflWnaFxNGz8dPbNT6O2JGDWwpc5gTqRvrfnVjZLML6HeD4ubC+
         O5VtgoKffZIuMMLo46XkwbK+cGs1dfktbsgKO+IDL4SnTi+U3mqQP66ddpRwDckwgMeH
         rhR32Un1exoTwte74sEJeGpD80N8j4Wz0qNPfmC7/lTsliEGSNiXxSPdmaxqriDTa66Z
         WI8u66Mh8eBneRw1tRdcKjxbN4mVMSY7CYkcNjVpq6IX4ECQKidxRQ50RoXFqj7HhDC5
         1Srw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663684; x=1779268484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7VB4PgcZ01Fib8r6PBjxZYMBn+UiSZUTB5bok31SdtI=;
        b=FnZgFvsSybPjKuHMFp92a/XZuU4oBLS9GJcIAx9tvbomDPPSviRHMtdpgNTHmM8/us
         qcr1pBHVhdPYO9ZLhyihYewTmoibb6Tql6LvlDBfCJ5pHtUWhZSyVa6naPQGoBtCB5w6
         EFihCyfTG/nt5365bBWTM4FGFHlWzrGcTASuB/K0DVLKpzcDd+yqwIqp/TmtxccGjhaj
         ovMhqxDdb5yTUe7imtnKEUGn8TFHlyT2M7KHxmzkqYCHD38VY49gR71f8q3Hua5nnxZl
         D11tXJii/xYGfC/AHcZhMteSex3x63Jjv8XVLpEeByCL5mJETD+M47PSjkk1NKTltF5q
         B+JQ==
X-Forwarded-Encrypted: i=1; AFNElJ9MDS/BB9t2zdka09as3/dqxD9mPPp8QmbJ1Bno7BzbpmuyeWd3082ReO/y9s2lH6zNtIsBHvzU2G9v@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw3Yxp2OOiH1isj0F7F1CEoOJ+Y/vzXU0pTCIFmfNBRotAUV5kv
	3EdX5VdLhMCe1cOtgHWckHBDvplWqM5y/Zd4K5QYFHiYhpajEX/zkyn1/3eupmf+D0k=
X-Gm-Gg: Acq92OGABc7/atJQ1AbVNIxlOFt5KSc0jtP+thNmfZMSxGBuYHNJIuqkxd0e93d9T5J
	ymUPctLPgMwLkUHcLjkEZBtIYIHzDVNkVjj46CtQ6tA8GvA08BV/guOuHKec3VxBiwG1dGGQRNY
	h7LR9LWDF9K69pKf2RQgUz7MR5H0mg5qfiTPTwII9AsCd3KROLYER6TVgM/jt0ITD1EPdwiRNm5
	dXYdll/0AbzDBxC/rthH2js9uG97uwUaenJfkrAwArt7Aw43112yKXky3ftrf/LUBs9flBMHxXY
	4ry6qsjFgTuqfbg7QGXGmuZU4ZYKM9m4ypUb4WU9uhIw8yFKBmcCMMWBGd1fPO8leZLlYr/FNU3
	naf3cpQdn5glLeJW7QKZrEN6ZHwTbxAIsMNC0Io8dMAIHU8t+kVH+mRUa+4spLct9UGH7x6NdOS
	cl3BpXtrDPHCizB5d7PgmuUkBZzbExX1I=
X-Received: by 2002:a05:600c:19ca:b0:48d:46a:6e5b with SMTP id 5b1f17b1804b1-48fce9b9fb4mr24088665e9.7.1778663683583;
        Wed, 13 May 2026 02:14:43 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:43 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:27 +0200
Subject: [PATCH v2 03/11] m68k: mcf5441x: setup DAC clock name as per
 driver name
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wip-stmark2-dac-v2-3-fcdae50cf51a@baylibre.com>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
In-Reply-To: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
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

Later in this patchset, the mcf54415 DAC driver is added.
Considering some other different ColdFire cpu DACs exists, the DAC driver
is named as "mcf54415_dac", related to the mcf5441x family SoCs with
DACs (mcf54415/6/7/8).

So updating DAC clock names to bind with proper driver name.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/coldfire/m5441x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 5b5e09ecf487..b724d7fc1a08 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -43,8 +43,8 @@ DEFINE_CLK(0, "mcfpit.2", 34, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
 DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
-DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
-DEFINE_CLK(0, "mcfdac.1", 39, MCF_CLK);
+DEFINE_CLK(0, "mcf54415_dac.0", 38, MCF_CLK);
+DEFINE_CLK(0, "mcf54415_dac.1", 39, MCF_CLK);
 DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
 DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
 DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
@@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
 	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
 	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
 	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
-	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
-	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
+	CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
+	CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
 	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
 	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
 	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),

-- 
2.54.0

