Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86191154C17
	for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Apr 2025 05:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744781494; cv=none; b=kfr+EuEXE64PUJ8ODwJlkmZ0BgL+RzeHUbBjbaREX0LDmkyISZ0zesaTDlw+lmRBQksk1XusoDerySrRu38PWxsUGGzCCY0scjS8MSvMMnA+6vI2qRWQaoV2r3/1lTUiwHPwcgdKHcxhetqxNuzBB6OmscxGYJjGr9nRPMtgXpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744781494; c=relaxed/simple;
	bh=vZmMqwCoPGEpbjlYgVrbWq7PQvmeQqOpFND4sSyhKNI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vC7Oo79+0qaHkNBtqidgwzaGb/ZWdiTMduxO3MHySKhysrUIoVEN95Mo91M+2lcoTvBQcIFjB7sswwpfxvgv9ce9McNvLZOMDnYirnz3eN2qm0B8Rs4DRORcSH1111yuRkK4Fc21ju/LTqPOG6JZBCG2eGUcLsHHnJZSkhYdrr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jdU+/vOr; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdU+/vOr"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-226185948ffso67803895ad.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Apr 2025 22:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744781493; x=1745386293; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=00U42ZzUOxNRO4D8XKQxhoyIsJ3n5fks4Eku3muMMVM=;
        b=jdU+/vOrsBRmtlokxfUVF25Agw1QXafdMEXGcAI+LXoV2LvrtjXsso+dkj8KgS7IUu
         jLR1HSYeNpmYDuOR6i60SDFTo9t39G7LLm0fI4iBL1VtxdQIYi4cdZRrnzuSgiZ+t1Zc
         vs76ri8EUTiJrLNsDs4gcd7WqdZxrkE5ANfwrRAm7BwzUvfRm6fxQxWDfHfKEfGP0F89
         nPG6phfJn/Fs3JPRKBsQoUEgiYCDB+uXCps/VQ0fQmm9nIOLZOmu+Tl9BKUgPTJqodtl
         JUwk9lrngk7VmnZuUlEgYLFRzavCHCSXrHJy72BUHQS3FfdARwL2G3DkmIspKLXQIRzP
         YhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744781493; x=1745386293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00U42ZzUOxNRO4D8XKQxhoyIsJ3n5fks4Eku3muMMVM=;
        b=o3T6t+07vzWjnd6Tuo8UllMnfIYtbKJ5b7/81DMtaJe8bxBJWfcx3BiaFY4OsGNg7z
         Xv5QOUHZMrmufzbtdQwvgSEXFFA621jjiRm2c7544+YeWjFHiDTuv1ckmOMZ8+nZCL4A
         QTmP5szlNUvHHPPPiBBAmBwAVbujlxrbGqZsz8MlKY969KpshpsTfhHPSvB9ChKSwm9X
         WJ7IXXAbsoRgtQiE5O460pnxQx0BAl1IN0hLOl/FesNRk3jC5eSSNGBISZFV+UL6db+F
         YwkXAquYfVJrzKnQ2kH0oUZDRJVdDFD99JchGiG9OSzuRYdUJ13HbIv77eCx+QthP2qB
         DynQ==
X-Gm-Message-State: AOJu0Yw4NwLbXmqFL6UeLNB+p7RM0ARRq7g311M2sZY8qyTLCaA2ECCU
	4oTZ6bAuaCYeRJTHOYw8RSwiV+r/AZBFA381wRYt8nLAPzMCzeIM
X-Gm-Gg: ASbGncs5YspdpGj/iXq9iHTyrKIhWmmdlAd+HDAH+14kRirf5Fcy4yTSDJkRWLVeyAL
	v79dQSRXs7jJeJ81z+2M6ejPYN7wHr+TFQRAiIUwBVeUwskqY8k5ei3bzZ26AGnYHb5voOUpH2c
	MZdbhZScPPX6SV6parvRcbZq++WhIjdAnwROHnDiHwGmD9rE8DaqO6x0473ew91dgk9QAmralip
	evEyV+/Ut8wVP2cEXjR72RcW8gPZAB3NqXwrP5W7szWiUcq1wERjQSqJtQfE9IZ/TUa5G0r3dd0
	0PKm9nMx+/uIX6KMtDylqjlLvHVNnhX4g8C/w2ZfWJBbMsUwes8SQhqu
X-Google-Smtp-Source: AGHT+IGzBezkIxVCJzUUB+qdYid6a8gIORMDZApggDa4nKeAbIQxX3qnx8Tko90P0qOPsoR+muKfZA==
X-Received: by 2002:a17:902:ea04:b0:223:5ada:88ff with SMTP id d9443c01a7336-22c3590cd65mr11156435ad.24.1744781492715;
        Tue, 15 Apr 2025 22:31:32 -0700 (PDT)
Received: from shankari-IdeaPad.. ([103.24.60.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33f1bceasm5212715ad.62.2025.04.15.22.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 22:31:32 -0700 (PDT)
From: Shankari02 <shankari.ak0208@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org,
	skhan@linuxfoundation.org,
	Shankari02 <shankari.ak0208@gmail.com>
Subject: [PATCH] m68k: replace deprecated strncpy with strscpy
Date: Wed, 16 Apr 2025 11:01:14 +0530
Message-Id: <20250416053114.693917-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of strncpy() does not guarantee NUL-termination and is deprecated
in the Linux kernel. This code manually terminates the buffer afterward,
but using strscpy() is simpler and safer.

This change replaces the strncpy() + NUL termination pattern with strscpy().

Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 arch/m68k/kernel/setup_mm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 15c1a595a1de..48ce67947678 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -243,8 +243,7 @@ void __init setup_arch(char **cmdline_p)
 	setup_initial_init_mm((void *)PAGE_OFFSET, _etext, _edata, _end);
 
 #if defined(CONFIG_BOOTPARAM)
-	strncpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
-	m68k_command_line[CL_SIZE - 1] = 0;
+	strscpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
 #endif /* CONFIG_BOOTPARAM */
 	process_uboot_commandline(&m68k_command_line[0], CL_SIZE);
 	*cmdline_p = m68k_command_line;
-- 
2.34.1

