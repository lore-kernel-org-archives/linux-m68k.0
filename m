Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8420B207A0A
	for <linux-m68k@lists.linux-m68k.org>; Tue, 29 Oct 2024 21:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730238191; cv=none; b=e+YVrcgFzL+8VKVS6+3fKCNyoz72v0DVw7gWmHh1TdW9Eaqw+9QfJUA1gDQrmoxeXFJ4jd+IHj1M1uPwvvhT6U9ieGujzYpKDPFo78l1OJ11puGbuqWbeE1CPbPjvUIM0pIQFkIx4QvYED3PwYKnow+siiNZ6PGEAHXxl57CkZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730238191; c=relaxed/simple;
	bh=w5jKC7IyDXKFeyn7ERMAdvanHn38cQ9zy1K2YLWaVOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uPHPZZGXJg4j4Ctv5N3SUesBUOu0EMxj3yasmDVbns39iQTopEUp+rXyUVu9NwxzPaJKO6dP6qZbRRXyPcCJ0H1/3Z7GfI/ejEaUtWbbgy07bchTSDEti49Q6MjxuwLRgJwsNSZOb//KVkMPn2Zz4kjDeoomqaiXTMulMEiG9tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com; spf=pass smtp.mailfrom=mandelbit.com; dkim=pass (2048-bit key) header.d=mandelbit.com header.i=@mandelbit.com header.b=Bp7w67XK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mandelbit.com header.i=@mandelbit.com header.b="Bp7w67XK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43158625112so58585385e9.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 29 Oct 2024 14:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mandelbit.com; s=google; t=1730238186; x=1730842986; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hcs5fqb96ycIMcokdiYuAt/6DUNMqB+pMWzri0juKvI=;
        b=Bp7w67XKnokdW1Y1GjWKjzPNh3bFR7ItSElNY1A2DuEmw9KUnK0WPk2mhGVbTRnK1A
         yIKAQ6CHvAFM3KGs4+a3432CUvp9r47gwt8jZYcmhhMSSiSgxYH8WE9NtZWxM4t1OZW0
         MZkh6uiYwRMjZyVPOi43lBm8d4nZDOzxjDKchgK6YMuMB3i7/ixECty9DV4DM5WoJ1kn
         B1hIgT3cLmECjPeXSzp8jeHgdCk8BCFaPNpG/u2BFgI++v4mogo611KammNV3rMb0d70
         FKnbkUs7wW6jMQ/YHTBuR6qhyEDn3sQ+MbfNDRBCWqCL90VdpL+mK/3u2I6KZxKiJEIR
         3JcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730238186; x=1730842986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hcs5fqb96ycIMcokdiYuAt/6DUNMqB+pMWzri0juKvI=;
        b=HbRx++mNd4vgqUfkTZvRbkE6D9oH9sMElG4m86eUSKzcnWelAvvi1bQQ7uX5pJy4PM
         G720kpTanVHaCmR0q/J7b9NtobdBF7S3saA9viKpE0H4V0Kxk/DSMvXLel/En0Mz85ue
         2OO7/SBBNU9TMoTHelHEQWf87wKrzpmsULtzmvaXi6zlRUgcdZNOe/PifQff/envJ2ji
         Niy1V+3xV/fB96oJnzCQPcCBItNEdSrMMT0fkDO308jVynhVi598OhVSqgUr1C9TwIYu
         sQV7Ob4wswlcGoTvxpUWEdTIbUP8FpxeQ55APS5PNWffCU7TYgb0/57nSJSMK2laRLSh
         fqfA==
X-Forwarded-Encrypted: i=1; AJvYcCXNjbpltu/nZJF3q6ZP+IRtRUJMKoVHxUUnOrhDCn5x+/eVwVZDjkOqrO0mU4cGaayB+lMDlWciNrA6@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxF0fOiYkSPU0wTqyxJVRsGH5VAzlgs9CqHzAFEE+hrFxRs4qlp
	vcCIq1dc0qNtNyeACkFjmQn5znNUeL/nnujStzzogcxDTguwkvhugI2asUlnZMI=
X-Google-Smtp-Source: AGHT+IE1+r+8wMyu6u1Pr3137wczmAuiaUVuSzCdfqbU6L+re41EZx4bAjP2dkFAXalc12q9O3LJvw==
X-Received: by 2002:a05:6000:1f06:b0:37d:481e:8e29 with SMTP id ffacd0b85a97d-38061159039mr8658048f8f.25.1730238185766;
        Tue, 29 Oct 2024 14:43:05 -0700 (PDT)
Received: from serenity.mandelbit.com ([2001:67c:2fbc:1:c559:9886:6c0b:569f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b1333bsm13565532f8f.14.2024.10.29.14.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 14:43:05 -0700 (PDT)
From: Antonio Quartulli <antonio@mandelbit.com>
To: gerg@linux-m68k.org
Cc: geert@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Antonio Quartulli <antonio@mandelbit.com>
Subject: [PATCH] m68k: coldfire/device.c: only build FEC when HW macros are defined
Date: Tue, 29 Oct 2024 22:43:15 +0100
Message-ID: <20241029214315.26710-1-antonio@mandelbit.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_FEC is set (due to COMPILE_TEST) along with
CONFIG_M54xx, coldfire/device.c has compile errors due to
missing MCFEC_* and MCF_IRQ_FEC_* symbols.

Make the whole FEC blocks dependent on having the HW macros
defined, rather than on CONFIG_FEC itself.

This fix is very similar to commit e6e1e7b19fa1 ("m68k: coldfire/device.c: only build for MCF_EDMA when h/w macros are defined")

Fixes: b7ce7f0d0efc ("m68knommu: merge common ColdFire FEC platform setup code")
To: Greg Ungerer <gerg@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
---
 arch/m68k/coldfire/device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
index 7dab46728aed..b6958ec2a220 100644
--- a/arch/m68k/coldfire/device.c
+++ b/arch/m68k/coldfire/device.c
@@ -93,7 +93,7 @@ static struct platform_device mcf_uart = {
 	.dev.platform_data	= mcf_uart_platform_data,
 };
 
-#if IS_ENABLED(CONFIG_FEC)
+#ifdef MCFFEC_BASE0
 
 #ifdef CONFIG_M5441x
 #define FEC_NAME	"enet-fec"
@@ -145,6 +145,7 @@ static struct platform_device mcf_fec0 = {
 		.platform_data		= FEC_PDATA,
 	}
 };
+#endif /* MCFFEC_BASE0 */
 
 #ifdef MCFFEC_BASE1
 static struct resource mcf_fec1_resources[] = {
@@ -182,7 +183,6 @@ static struct platform_device mcf_fec1 = {
 	}
 };
 #endif /* MCFFEC_BASE1 */
-#endif /* CONFIG_FEC */
 
 #if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 /*
@@ -624,12 +624,12 @@ static struct platform_device mcf_flexcan0 = {
 
 static struct platform_device *mcf_devices[] __initdata = {
 	&mcf_uart,
-#if IS_ENABLED(CONFIG_FEC)
+#ifdef MCFFEC_BASE0
 	&mcf_fec0,
+#endif
 #ifdef MCFFEC_BASE1
 	&mcf_fec1,
 #endif
-#endif
 #if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	&mcf_qspi,
 #endif
-- 
2.45.2

