Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612313CF40
	for <linux-m68k@vger.kernel.org>; Thu,  1 Feb 2024 20:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706820218; cv=none; b=TdtB6t1jZ1hLAJCspNAkH+DjzH+k46r2MUrV/00dq2n2D4d+Gx5Qx3PEqfvyzLg5pIj2gclK6JPjGwQZ8N5/Kuv6+hhNt9qivoQJ8aixh2zo+hwfdxAl/V6g6rQDGqA6wLdy1ogueIjNAWEff2eiTy57QCnppowhiuymOkj0IAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706820218; c=relaxed/simple;
	bh=tpMg/EBe7U1SigMRHLPr9qvAHXv+iYSQ2JPTu6rDBJw=;
	h=From:To:Cc:Subject:Date:Message-Id; b=NSTzSO2HzhN0A5cHJempYii6yO9eJharok55wEPf4l2gimjYARudLqnRCe7VEuqiZq7/Y8qMwyQ75O2biKp9MtvEni3NYKUJDTJJlHNWEkT7R5PQaTIKn41++5JUabRDDQ+CtShgZsFaSxZmhMJyww/Gm62JoZq35J1QB2W4ny0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7DxnMVZ; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7DxnMVZ"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-59a1a03d067so594384eaf.1
        for <linux-m68k@vger.kernel.org>; Thu, 01 Feb 2024 12:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706820216; x=1707425016; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqE6uH8/Cq6TCWIinemSe0QCaBK2NUC2RCn1iBCFHF4=;
        b=h7DxnMVZkNtGjiwDrBM8UT4VbCXqD+OMtCdbmmL+cSvvMUjr1/Z0uHZc3icGcfbcFX
         Oeir5Rq8zi2i5AvjXbSbGlLMbMxdTXBz+H8gjMO4yXp7jZFZCXvJbAasxmUTYMH0rQml
         iDYov301Ri9JlqJeNX65bQUAuVi0C0VpEMUK31ZCnxhkBP+5efVWOmsPg17BNbmTAdS8
         xG+IhL11mH87RK0ZMzOPmqC9RCzlSNnB7FwoVBc2a2ehoxVecsBeqLhoKDZBFjpdf3xy
         XSX5r1hFCy6rsrZMCZXLmwtAjBHLTHRKFNG2RvY+WBnqPTuodKt10aQkZmTeehO2BHYJ
         IA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706820216; x=1707425016;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqE6uH8/Cq6TCWIinemSe0QCaBK2NUC2RCn1iBCFHF4=;
        b=g8pRTYw37IuYMQEHuUW1xr41MfSYoxn/BRlRoBsdRZ2Yjo6ulhHlnUjd3RmPh3Aed2
         dumnREQ5dBvIk3b5kfmzNIu4FTpR92w5/AbyzAZ/R/IiDNNizDcd7/MPN//7JbmhMkYd
         cyrhoatXUuh478kk3AWcv0k3EZ9SreAr60Pwmts+UGlSTLy+oa6ODGjWlWKFV1WEsJiv
         c8O1CEaQ31dk2JpnghFAQnPun5u6nF/0d+7A9GaoZvSGl1wOCcomymQZYGg5+c1wx6DP
         ztB7lePeNHp55WRO8fqjRwc2eZXvrfkZ+jlAf/7+jbUHAvVaLqf8IiDLxbyWORLGFpBq
         jnNw==
X-Gm-Message-State: AOJu0YzP2exBiBpcvomHKu10sm2h5wJSkoEyW+U3+4W/8DdJOUGzVMCe
	pvD/x9Qg3apUqM01r4WN/cvrmhBZhIxJA5NIMnclsgqlZm+eoNcPAjJoaa5t
X-Google-Smtp-Source: AGHT+IElUOpekOWXInWPuFamxcNU9k2n56BCl4uiPwqSeuPqOByMHhac26XcajXOoDDuLtfCmEwtPQ==
X-Received: by 2002:a05:6359:4c25:b0:16b:9480:41c8 with SMTP id kj37-20020a0563594c2500b0016b948041c8mr2715859rwc.1.1706820216251;
        Thu, 01 Feb 2024 12:43:36 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVxTkcQEsDuA7Qso2jciEebYEiXSAgj8RN9c7v682ZB1gi6DXWik7/BKFc+ISQ0qrIvZntEF0zoiW2y+PD7t/J4DSBlasjSpBSJkm0LsZgj7kaNnYdXMFD3Cmzq33yOovyEkp6R02tZx2yFXr+1xZHRLQ==
Received: from xplor.waratah.dyndns.org (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id d32-20020a631d60000000b005d30550f954sm270803pgm.31.2024.02.01.12.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 12:43:35 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id E662A36031A; Fri,  2 Feb 2024 09:43:30 +1300 (NZDT)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org
Cc: schmitzmic@gmail.com,
	cip-dev@lists.cip-project.org,
	Ulrich Hecht <uli@fpond.eu>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: include module.h to make use of exception handling in traps.c
Date: Fri,  2 Feb 2024 09:43:29 +1300
Message-Id: <20240201204329.24202-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

Backporting commit 513138a14063760e (m68k: Only force 030
bus error if PC not in exception table) to v4.4 by the CIP
project revealed a build error due to extable.h not yet
available.

extable.h was split off module.h in v4.8 (commit
0ef7653797addea8) so amend 513138a14063760e accordingly.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401302324.d3o6tgup-lkp@intel.com/
Cc: <cip-dev@lists.cip-project.org> # 4.4
Cc: Ulrich Hecht <uli@fpond.eu>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 arch/m68k/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index c547140b8325..2209214cf91c 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -29,7 +29,7 @@
 #include <linux/init.h>
 #include <linux/ptrace.h>
 #include <linux/kallsyms.h>
-#include <linux/extable.h>
+#include <linux/module.h>
 
 #include <asm/setup.h>
 #include <asm/fpu.h>
-- 
2.17.1

