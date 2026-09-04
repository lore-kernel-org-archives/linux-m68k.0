Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A016946D579
	for <linux-m68k@lists.linux-m68k.org>; Fri,  4 Sep 2026 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520973; cv=none; b=GAZ0RoqMX/GNGmXIp8bqq/iH7n3bf7GArQzn7N31A+C8qi23WA5e+D6/uLl7Co389EfLoyXIcli8tjLSOnUvCelrTZHMU7xok39PlPnr12q3RWpiLtE/eFkEdYLr7ij7CFVUbbkug4VP+NaK+vrlpG0aKn2Ki0VLudEanzxSeEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520973; c=relaxed/simple;
	bh=wz6YM46xHkXs4il6af+Vt1ZkBsZHlLckbjXtp0VAzrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nQaDuJfSCgw7SotPlwk74PTkvnivZwEGdUr+ije+p01omAaHmGcWTctUwmRr8nAOi5lGsYCSrwmxoZ+32i1rcjkxNSeqk+7rf0zuZTq+vr/pR6fpYU99mZyzMB5fMKJI5qgyilxOk7aBqQW10qLLSSfXEbVoxr6C6ehW2SzP41I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ry5tJjdE; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ry5tJjdE"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7f4e596e393so924535a34.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 04 Sep 2026 04:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520970; x=1789125770; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZZs6p2NyvyQpcXi5jWHBOyk2COwmthPP9SgDVrLOsXY=;
        b=ry5tJjdEY73a7YZe2nI8mO510HkrT0Um/lcW/IKVNrhClkcGdZdIXwLHKc9whUx4US
         QxiHOkaTd9ji/tsznSf4W3BFFm+RFAxQTvFcCLdexmnGpqaI+DV4VYuuaW3SaHHYmrGD
         Ae2sJ8/eAgiW6s9C3+eUBlMhkwTxZ9y6buFExQEBQp7xyMw7zVKpilyXunVOfjL54IdL
         twn42u2y53q4BF//M3Wynh7z31yd/Gu17pG5yEBf16Q2ZtwjUmFexIaif6lQp9oKRlVd
         YzRubQOcGONVzlyXgfH5t/XlEunsqGz7OhuborDsnurOTS6QbjPBnYj//w8NiUHgIFWF
         A9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520970; x=1789125770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZZs6p2NyvyQpcXi5jWHBOyk2COwmthPP9SgDVrLOsXY=;
        b=W/UvDqFPbMU4kIaQbH1rg3BgFcrpyDkE9CY6adjhGXmfAlyrLggK4oICA4LM8POVl4
         YUu3oq463/PUOeqkA+cXh3IhyTJwPcVoDXKHFpCAMY1GMs2ZeyO55v0mppHoro5f78uW
         UMUS9W+2m5xcGYe4afuK/yLdiQmnWuBAZqjXoctUONKjX/r/0bscylWuuE3FInJ91sre
         JpBH9KbFA51emXmXKmz1w7IBnvYkQn4zYLWaiOO4TEDrhPSBbZVLVzrIWO5oZaOm93n9
         qCPm/MinRENdhLD944kNUWM+Dqsk0zfQ3Rk7QErChV73ibYKijT582o24Jky8gIKgSz8
         TFLw==
X-Forwarded-Encrypted: i=1; AKwUvBzFZKHU688FLHgIt5HErOtSd6VWyd6U1K2pcA9VIs6CFuqD9jGtHe0TSq1iLsUQ4X+ukbQmHZhZkM8w@lists.linux-m68k.org
X-Gm-Message-State: AFuF++lPKxio/XvtP4uG9ACQmAmAR3Xo/H6zgJDP0TakFSNp/XjhCG+n
	8psoeAKbcSrt17ncAdzX2ou56Ya32U0k5F4mniDpqiyA5LDaKk40BZgV
X-Gm-Gg: AYBFou3YIBTHwl7FyjpWjUsPmb8RzOHUjjVWQjs4qYUvNsDefb+A85TKquYvcdrgRWJ
	86LH1Ic6KKuFg3XjUrniWejXxsnbdLN1eO94RKf11nE0AxRDEe0UM0UsODvSlAzU1aXt0D+B6k7
	1Hp1fU4sdpfuIPlnxPBACt3rOkJeLdzG5o1HL0YEPXzf1QGr6iwRIFnWU1DJHrzBMiPKkW56kFj
	K6hDbNsq8w5qjG7/Se/jAdyMx7AiyOblkHEebdgtxRJsAv+idWTI7MSVluJUVc3mi4W4hnh1Jjc
	BjJz2MAyBlhp1BqjTHN7vhi/cuuFLSeyvGnDnW+TXull+Do6UBopx5+oNB2hzU4T0qHpIMEMOuN
	LCMFfBW/cqIIYojKOBGxTEbW/SUYUeLNOQuc9MKp2rKxQDuwEgaKCvi/l1UXI8FEvsBtDBeTJDT
	qrucrfoTRFTDoGLY9XUEhW4TolVrFyEzfKTp2ZbS6lC8dm1y5KcVJ/1Wnt7h2+BVSYhTxKgLm4Z
	edrGsWv5vQ323U=
X-Received: by 2002:a05:6820:8108:b0:6b1:b771:bc43 with SMTP id 006d021491bc7-6b6fc5ce9b6mr3961712eaf.23.1788520970208;
        Fri, 04 Sep 2026 04:22:50 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d0asm6398612eec.8.2026.09.04.04.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:22:49 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH] m68k: fix typo "eanble" in comment
Date: Fri,  4 Sep 2026 16:52:44 +0530
Message-ID: <20260904112245.37109-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "eanble" to "Enable", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/m68k/include/asm/m53xxacr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/m53xxacr.h b/arch/m68k/include/asm/m53xxacr.h
index 692f90e7fecc..a29ad33aaf05 100644
--- a/arch/m68k/include/asm/m53xxacr.h
+++ b/arch/m68k/include/asm/m53xxacr.h
@@ -32,7 +32,7 @@
 #define CACR_DCM_PRE	0x00000200	/* Cache inhibited, precise */
 #define CACR_DCM_IMPRE	0x00000300	/* Cache inhibited, imprecise */
 #define CACR_WPROTECT	0x00000020	/* Write protect*/
-#define CACR_EUSP	0x00000010	/* Eanble separate user a7 */
+#define CACR_EUSP	0x00000010	/* Enable separate user a7 */
 
 /*
  * Define the Access Control register flags.
-- 
2.48.1

