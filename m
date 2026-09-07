Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040122F1FDF
	for <linux-m68k@lists.linux-m68k.org>; Mon,  7 Sep 2026 04:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756353; cv=none; b=JPKx6e7ydePQx9KOrdL9PscN9J9G16AZQyvfeJOr2ofPD4t9HxuYnWSwMQ2gpUyAj481wkuSaOLusG+v9u3mGTekr/EcWx/KPiriON2aKPujYH98SK9dzK4Zhy/k3FKl0RHBpLSXpMv3pMB5YL6i4j9sgAFN4WLr1d3iVC8JzPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756353; c=relaxed/simple;
	bh=o7CbGYsOIDmcanU8fUfnUx3eOhhddfQxRpFPLq1F7Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VRPmmeZ0VBpDQtp20vftXENphArNiB5FkGjzO/p0D5gLlqX150vzpXia5iNaq1d6rGS3wQlrKKAzy9zQA9mgLKRXglbkyhFq44GekvM1xgXMkzVL9rP0emJ05a0qFzCaRbw+Sc5oxtLE0117rtP+sQyfiJlfbesmfRezJjxrWYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjTRlVuI; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjTRlVuI"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39b52169dacso850012a91.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 06 Sep 2026 21:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756350; x=1789361150; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5L23rxTi9KX1MKDBMSVdzl0h+OzIwSK7RKLIboLG0w=;
        b=DjTRlVuIvwI7UaFBOIrHVsZd2TIIEuz4CUMYgwShAmU54fs81itKh3ZzTB5Abo0ZCs
         IrMdq5X97F3hLGBL0wX9+wcuZFbaQRGukFBxlsj7Bpv+ipi/U8sZLHZDD/kWyY6rulQX
         OrTabFfAM0fEstdviYCKoxK4wo0OxvATEblvTAaygJyUH/5PnLbhLkLuOHDNoj79k2dE
         046IfWrgDe73SIrZryg2RAXSLkSWKzdS7hJqoY4KHwjrZ92EtWKIwVKd3EBaYQZiB7uB
         NNo/Cm0QtFSblPtP8TA5y36KElNHGOeP5WYPdVMgsGQwWeTcvd9IP5NVh335oyfXfaTR
         NFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756350; x=1789361150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5L23rxTi9KX1MKDBMSVdzl0h+OzIwSK7RKLIboLG0w=;
        b=PlMddDJ4tF3NsgFbmsDHq9QxAqQir0vSJQtRGqsWdQyMSmXaQMisinmEeZ4oocYF8h
         DKex8fIu65oXT9IJ/miocw47hxcxZTu8J3MN/Oi6zkMnNtggUSw2OVmmj5G4jJqmX02E
         hQ/p46nZrOX2rjnN48OYdvYvJmi0W+ttsyx0oZJtLx44W6Iu/o9ETBoit85Yo3KcmBU1
         Wmy1TXb/O6Py/Pv2Mtes+7uxfArPkD9QfLIvKkypiUo0kCMsHR2CRoeu5ncBJJfrXvet
         3wpLfZEJdPhySctTNXp2uuUbJGJa9MaPh1FAGy96SOYWkeMhAVE7CCFU8fcTyZlHVpTg
         dqjA==
X-Gm-Message-State: AFuF++nTtOufPiCGzHKcZqq5es2T2JFiEE21FVKGz6J4vcK90vcmBlVs
	e5vk1U0AyAKdasdh5c7kuMbYT9M5k6uzbv/7NwF6miuJOy28Zo5W+5Fh
X-Gm-Gg: AYBFou2eBh5rDLrst8ITinlYu8be++4top6QxD7ReMVkB4Md/B1fZa7xxrcMvd5VtSv
	UVBoxcmo9LZtN0Y/pDjDIInurfC5gZ98ncY0CgJ+CbbmAjGkf2nfzyXiqh/+fxXJ7j5UZcxo4sO
	VOre0XrhA9x9jBSk10WeWbK7ybXfTlwHjMd4bEH9GCtxmvwBoKItN1NqnUPc8XM8sSC9EWY3bMv
	1LfjPWfdIzt1vZK2G1SMA5ssrLhtKbmgEq+KFQeKXl0q++5pJeYL54OPXdmIDJ8UXmwxRobFJ0/
	e+bVGsTBUtq1bQz4KsF3uDIqmQD32zqoCNbbXhjsVldSqY9NTcciN4Sgx8BqqVcLvMoG9cm1aRW
	1we8hbmr8GL/zxonQWmiwFQX4ujJZDQKvsv8Uc+kHUPsfR6fUkhVMHtGUtAFtFHe1ZH/DZ8EDVF
	mf+qemt4sRIfIyWola2Iet00vkd1Oel25Iqh9rfLb11HSP11XE0w3eGQGcouzA+67KAsezcVw//
	E02jFiLfYdEfg==
X-Received: by 2002:a17:90b:2b4e:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-39b261d0d8emr32120271a91.15.1788756350296;
        Sun, 06 Sep 2026 21:45:50 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm25491660eec.24.2026.09.06.21.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:45:49 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] m68k: coldfire: fix typos in reset.c comment
Date: Mon,  7 Sep 2026 10:15:45 +0530
Message-ID: <20260907044545.6187-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "reseting" to "resetting" and "ColdFure" to "ColdFire".

v1 fixed only "reseting", which checkpatch had flagged, and left
"ColdFure" two words earlier untouched.  Josh Juran spotted it.

Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/m68k/coldfire/reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/coldfire/reset.c b/arch/m68k/coldfire/reset.c
index 6e5f8ab39f32..079c92593eff 100644
--- a/arch/m68k/coldfire/reset.c
+++ b/arch/m68k/coldfire/reset.c
@@ -16,7 +16,7 @@
 #include <asm/mcfsim.h>
 
 /*
- *	There are 2 common methods amongst the ColdFure parts for reseting
+ *	There are 2 common methods amongst the ColdFire parts for resetting
  *	the CPU. But there are couple of exceptions, the 5272 and the 547x
  *	have something completely special to them, and we let their specific
  *	subarch code handle them.
