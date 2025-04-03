Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C542517B5
	for <linux-m68k@lists.linux-m68k.org>; Thu,  3 Apr 2025 18:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743703955; cv=none; b=JyGddYPWBenGZneLTpM38t3dG+LGqlL7qed4JSGV4V7iAhIJpHtStsJRcBinnjiXSnN0QI51X82CTqPbLNWjfN2zNI7kJgsuV3UClAxLTUk09QWBYrJuXyRSti+IW76yuoiwv6zIhmvV7vs0QwSQiiriR7RDfr/8zQGLkFzXDRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743703955; c=relaxed/simple;
	bh=7f40mJ8LnqL7CspekV7TYFbVToX0I2pz85INXUfPxGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WTqOK8ZHq/UTyMxNBf+xou/zkBBVXCw3CiZOHDWUwsU3ZwxcUfzjxJ0Fw2hmT51onxH4D+FxBIW/JxizNvhzBG5Bcy09voo4IOUVfBgxamqXRfrK0iBKQeHSgJsYTHbVN/lENn1tG2JodH3quxPMYOuvK0Y9ijKuLmHpAV5lCVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esI0OABM; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esI0OABM"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-39129fc51f8so1041193f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 03 Apr 2025 11:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743703952; x=1744308752; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cylaq/MJ4Q4v84obWEALM9f5r/Eyjhy9D/KWsJ7EmiM=;
        b=esI0OABM+BG31CxNLfOac1jjju/H15xf5arQhOFusIUrp7VVS+smWp7bWVmgkIkynt
         J5KFOdJWBRKW5pZ86x7surUNyNSeTgUM8ktOC2Mqr8WL+HsbzVu9+PeiKSNWBNQK3HP8
         WgIi8T0/ho19c7fiB817FGMYPOnv25+8t1Fr6LAr+xgVQ9NW4lfYj6lk81uzNQMxYgNm
         uuljAhA3AhbsljyGQ8AVYjGssas4fNn+pmEyNXGv2kQY4heLxK3f+q4YYzlUEf6Ga5rd
         1j0Wm/ZAJ4VqQpriuiP/V5Wkabmj8cb2jmJse1p7+/z7z4EwzOKMyvSpjFLryDg4xrR2
         428A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743703952; x=1744308752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cylaq/MJ4Q4v84obWEALM9f5r/Eyjhy9D/KWsJ7EmiM=;
        b=LaQRV66tR4U0p8DPtk4AN35wGi50f/LLnfZDSirRBOHbuHGVqHWXL4yMzXq0mZU3mI
         cERANjRz/7uLlxD/a0YdlYit9JY7G7G7yd0gifL/jY6dYc8ui8zlmkPma263BPrXd7hH
         2JNosarHsy7T238a6pOG+4Qun+SzqgvOUp3feOfKL2tUugCUSoYMgAIym5Ne9bu0ez8y
         LcCKkh/i2uzGnf5xNltObS96AGSl50G9x4JjH/Ac8+2QGnSgcHNj3DYn5virJhxZZbYa
         alUsPMEQzRH5/1Lp5qLqTy9j0eQ3BFv+t/3m+wLdt8caOwaOknIpJKTRbgYWLqPOC4nT
         UDEQ==
X-Gm-Message-State: AOJu0Ywk519cK4qbBE3UpZyqJPN5ofbbh1TedKetaszluwV2hdVrcYEX
	YaD1JNS9lOOtD5qmYOZCkPTgo2/0mTlJtwFNb9W09uKFkQDtJyCW
X-Gm-Gg: ASbGncuFvaK5JPMddh3jhvUgpuz1WJL/vwV98a6Klk5bXqgCpEJ69ALeR/rB1ylhPOy
	ZGtHmIMr6PS1k7WjwuvssZrOgqCFD54uYg3Q2muTJbOclkBsixUkeGKcqvh7aPBH0YxkjkL7EkS
	LwUqDhwjJ8RwXdrdrjpem4UgQX4TM/F6rxHUSDQ93m/EgxkIO0v9cb0FusiSgQ1FoxbQQv6aC+3
	UGKqZo5ScGoDoO/EqF9faCTq+Ygbg3pP5pzCR/DgZJMMu2L/+PS8p4EQCOdqniBJFbNaIF6awQj
	dAvtyTqxYR2hWyhm0ueDXA/F5e6q+6m7yPwJQmNn30jHT1SVXfeMbhmHe7YxHqixZA==
X-Google-Smtp-Source: AGHT+IHyXAUeqGJBGFg7iPU2HIIZy892949Sn08g2mxKXvCfsycA+m0o+Md+hRj6Zysr32oFr5cyPQ==
X-Received: by 2002:a05:6000:184d:b0:390:f358:85db with SMTP id ffacd0b85a97d-39cba93531emr209714f8f.30.1743703951905;
        Thu, 03 Apr 2025 11:12:31 -0700 (PDT)
Received: from localhost.localdomain ([87.106.214.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d975sm2438079f8f.75.2025.04.03.11.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 11:12:31 -0700 (PDT)
From: Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>
Subject: [PATCH v2] m68k/kernel: replace strncpy() with strscpy()
Date: Thu,  3 Apr 2025 21:41:59 +0330
Message-ID: <20250403181200.34418-1-m.mahdianbaraki@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Swapped out strncpy() for strscpy() in parse_uboot_commandline() while
copying to commandp. strscpy() makes sure the string is properly null-
terminated and gives a more useful return value so it's just a safer 
choice overall.

Link: https://github.com/KSPP/linux/issues/90
Signed-off-by: Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>
---
Changes in v2:
- s/m64/m68

 arch/m68k/kernel/uboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
index 5e52ea150..fa7c279ea 100644
--- a/arch/m68k/kernel/uboot.c
+++ b/arch/m68k/kernel/uboot.c
@@ -73,7 +73,7 @@ static void __init parse_uboot_commandline(char *commandp, int size)
 	uboot_cmd_end = sp[5];
 
 	if (uboot_cmd_start && uboot_cmd_end)
-		strncpy(commandp, (const char *)uboot_cmd_start, size);
+		strscpy(commandp, (const char *)uboot_cmd_start, size);
 
 #if defined(CONFIG_BLK_DEV_INITRD)
 	uboot_initrd_start = sp[2];
-- 
2.43.0

