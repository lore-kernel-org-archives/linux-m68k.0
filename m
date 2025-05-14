Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3A93EA98
	for <linux-m68k@lists.linux-m68k.org>; Wed, 14 May 2025 05:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747200216; cv=none; b=HHs+JxKNeCkaOro9GO/iDpvwB5Rtz7vTMtia+y9CpED+2reuvOrNrmlAyUdjGRdHnjfW7dlYCHDPG585QLEu16toNZh2YgSDYHqjMvNqXqet2mRqaO7hOG8LZS+gY+HC138RjUZCsBMmX1pd01fFyM9yUg06lerVaTrK6OQnoZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747200216; c=relaxed/simple;
	bh=zfRw9Q6wMM5hfi/a/N4gYjmSXwSiWk60aFMz9qmobxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fXekazEqrrumg5c7vLSBF+YkRlyZ4GjylTKwxToQ/JGWPpNYhTJ5t82Z0XIkzLAogom09eqhG8KE4EePRKDZxAaQ9x/smG6NotWDph7m6syCldSNO+tn7Elr3Kmd2YfgrfcIVfyndstYLgtAAwPa/yaw+uKXMgCDcleTmaGfpOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WK1QZlC9; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WK1QZlC9"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7423fb98c5aso4032366b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 13 May 2025 22:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747200214; x=1747805014; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=goylnnXwS8ybZyEks8opAvaKL8A6WtBVF6S/CDmfx2I=;
        b=WK1QZlC9v+0dJ6yycW8Ra2LG3VXwawaSq5qLIpl8OeFrBrnI9dDljLNUtx9cmS2/8C
         L02g/X2cTSx9U0K0gQC1ipCci2V1fCnYMRqdFSJY+dMNA2oUYU1MW+/y85I34bGQsmZo
         bv0t5Ycx3pLuKsDeYNA06qBuJC/3VTR+ylZYurqWk/zvLPric2U7+CfG+CNjqJcGPgqS
         o5cF454mirmVjMeH8f8TgZIl/kNLJnzywpHYBO2QP8vp+hZC3p2lm2h49UZaV7GcUEaZ
         nM89bvUsIesaUTl+JNZZhVtogprTVFE46MQ2H0IetBNBKdP1sDuQfXNxQusTsnH9W6/8
         pNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747200214; x=1747805014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=goylnnXwS8ybZyEks8opAvaKL8A6WtBVF6S/CDmfx2I=;
        b=ku5By6F6mQlQGXSSDRoI5uFUBAJR5S/In93R1kXT1deKW+jxHwmyJQMHZXfJN6cBbC
         6eOBMRWCes3CDbG01MxOe0/0KKEHMUTawJUrabUPrHEHY1AVuP3W1Kc1eHjUHGWKAflW
         2VijQxUhDx+efOCHMKKisajzQYCAESrmVSctzWdGNuYOQbpSx6pdhSPSOZ9wyez4wy9q
         GpjnNCyqkJVQObqnZr4Rmz9k5BhY8vGsqP3AM54M8mRUYJcZJA90OuczGq666SlF9rC1
         8FyQh68zJ1YSBAG4gO4DGnIRUUTUnA1OnGg26nVtePLJ7l6KTPlo97WsKkhgQtVIeZqC
         W3Hg==
X-Gm-Message-State: AOJu0YzV0vxJJPZRuFHtUCnS3eXRDZM8KvOhRBKl/M/pIOn5PLcdRonf
	XIxEyzZNxUfthe8DgV89YKka9M/9XrXR4upTkH75PZ61qYeuiAO8
X-Gm-Gg: ASbGncv+yxLbar1iv31/x3po5M9LxW73ESg3Nr/kRKPVeOTQAjm3P6dOhRH5PY2yd9o
	spc44qSCK5dOIe1b8mmHQZosZWN9/Nb/ItEfMnyn8uLeUvVPEkijTQbm61SWQ7N2mT+h2toqOxd
	6rS2Q+5piV1Se79yEqtGzE4kFG46EOG87ddBZ2ypWut4JjAzw0maGltyu38CqBYHzbDVPnZCEpx
	IpuFOgwlt4KOzFlY8FB0bbzPIMtlbo+rUsJq4ZwOwwkgCMQtdItPV8UvwVEc6k+cTebS05RSDtp
	wlomF16fd8Clg5BU582atiNzFoYaCwzam/2wRdL/G6bA664LJHuPaauWubqtjczStS0eyQ==
X-Google-Smtp-Source: AGHT+IElzChTEhLjYwx8jW3A4q9KnQyI3f1Xl4EGUUaR9HnsdocrPUlzzgKm0VhWDIL9nynTBByXJQ==
X-Received: by 2002:a05:6a21:398c:b0:1f3:3ca3:8216 with SMTP id adf61e73a8af0-215ff0abd4bmr2898128637.5.1747200214365;
        Tue, 13 May 2025 22:23:34 -0700 (PDT)
Received: from sid-Inspiron-15-3525.. ([106.222.228.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b235199034esm6864786a12.66.2025.05.13.22.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 22:23:33 -0700 (PDT)
From: Siddarth Gundu <siddarthsgml@gmail.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Siddarth Gundu <siddarthsgml@gmail.com>
Subject: [PATCH] m68k: apollo: replace strcpy() with strscpy()
Date: Wed, 14 May 2025 10:53:27 +0530
Message-ID: <20250514052327.96537-1-siddarthsgml@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strcpy() is deprecated; use strscpy() instead.

strscpy was chosen because the code expects a NUL-terminated string
without zero-padding.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Siddarth Gundu <siddarthsgml@gmail.com>
---
 arch/m68k/apollo/config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/apollo/config.c b/arch/m68k/apollo/config.c
index e161ecd76035..d4cc145e1611 100644
--- a/arch/m68k/apollo/config.c
+++ b/arch/m68k/apollo/config.c
@@ -7,6 +7,7 @@
 #include <linux/rtc.h>
 #include <linux/vt_kern.h>
 #include <linux/interrupt.h>
+#include <linux/string.h>
 
 #include <asm/setup.h>
 #include <asm/bootinfo.h>
@@ -218,7 +219,7 @@ static void dn_dummy_reset(void)
 
 static void dn_get_model(char *model)
 {
-    strcpy(model, "Apollo ");
+    strscpy(model, "Apollo ");
     if (apollo_model >= APOLLO_DN3000 && apollo_model <= APOLLO_DN4500)
         strcat(model, apollo_models[apollo_model - APOLLO_DN3000]);
 }
-- 
2.43.0

