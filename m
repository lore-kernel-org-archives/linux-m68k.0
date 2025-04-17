Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99C91DDA2F
	for <linux-m68k@lists.linux-m68k.org>; Thu, 17 Apr 2025 20:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744920628; cv=none; b=LvLfxCh6FEjf+evd5sxFNmIEhGjqIIChbSMlkH9hOmN6rds70X2Mo5+sv2pob5yP6s0WpK3hz73FHC0DOWC3o8NzWdHmRwC0Hnz1Q79hdbYTWEyq4hCZ3Npm5jGtjxx/DAHnQlWHd6riWBaZvv7bH/oBqDzTG73jFz37k59ZwNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744920628; c=relaxed/simple;
	bh=vZmMqwCoPGEpbjlYgVrbWq7PQvmeQqOpFND4sSyhKNI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ka9JkTPmABJqpATwH7DrBnjy08yvcpHtYhqhiUQk4UlwDYIikoBDscJZYdNxwbr3jIjIJjzVN1XmyBC4d7AwOyu/05FNhRkawF1FTkIbXCPUJRi/WN6LLXyN2+x+pGZFk8oUh6fFHvHDAWaH6FLagEG/sMysxEGsNVK9x30fhzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5VSkVYx; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5VSkVYx"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso1664436b3a.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 17 Apr 2025 13:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744920626; x=1745525426; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=00U42ZzUOxNRO4D8XKQxhoyIsJ3n5fks4Eku3muMMVM=;
        b=m5VSkVYxVT0IRcCfg2MIX/KQJ6HxIgQaJSELYuA/C4yQhJM0SeLK0LGhf6pQHZKz6m
         OSCEKcnMCMKtDqD5Kz/J0ifxvcQHNHQEuF4jQ7cg0Vu7EXf/0+fd6d0SQtaF4CjkjCsa
         hdfHWH1S+BupAmkpRumMoBo0HJqD858Y05H9c5QhPhpi16Yhws3O3vOCG28rp8G/mmBE
         IPPXvihCMFzYKx/m+LFnkhIXwmdXgDlemdg1UzWJggzWHuUWNZPZMpKcpLVLd/bjxh3L
         Rj1ZRjoU+yNRrKT0ephLWqWKJ5sUSxmFiFSQ1TneB5D3rVjvJ5t08zkqJOQHiMU4VbsK
         u+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744920626; x=1745525426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00U42ZzUOxNRO4D8XKQxhoyIsJ3n5fks4Eku3muMMVM=;
        b=dZlxAfJLgOtybjBCJ8HOjYKkzwjGAJvelXSZmHtpgRCMXFUfNOxRDnQavYI43Q4Agu
         2UkURqlLV69W/xiMFRYprH+6v+V6pTTzDcYjRAwDkbFCWcpnA+/cu3QJ/fjGZwto7Omk
         lFgFYUK9AiNte+gQYr9X07FyYhOMm9rYBy6Q5K48cLih7/IM8jpeAr+v93G+T1Nut5EM
         wBXUFTwlkng1XJso5EfPfKL83r2PrqEaC11xbf6RilUZN10YuY7NTP8V6gDf1TTbvp8N
         cDs7qnGQ+EhGH6YVEh97Iu9tHr13rvdSNBRrCItQUWcG/uVLFp30JN6C3XAURvl9pkO8
         EZmA==
X-Gm-Message-State: AOJu0YybOTVw8eS1D716phgl/DMFvVM424SpEtz+9nEwL0pJfgEUU0h3
	fdLToim9ihRZ0grpecY+cNn3uFK1ezxDcWj6tIhlkAxzMJZaiWuE/KpPBpvE
X-Gm-Gg: ASbGncsuu+bgyNwwe1TMOJ0SyBovhZHACZ62GEkCrXr0v5WB2UZg0Xfzk9LM8VHEI8/
	aYL5Q3+8ozEiA0hfXxn0AlfTxRwi6z1GfDpA18QMIP504XiIjTNM/1qrsWezUOmXYGrb28UYir2
	ppF0nvSYKIGNcyL131LTnKZPc6MRoUW2233DEKt9tM3QxqZ4phX2SXjBBrj201AuXpJsmKtjIuj
	9fjX4WAssAasoWbPn5nA0+Up3i279UC4woaKL78ipRVt45M1uDWRbFsc03njGxlvRWiQ3UpTOMi
	kK9QJv0qd99b2EhbnUFET+aq0EKs7ElvaEZbCy7fGNjt5tLHK0w97USU
X-Google-Smtp-Source: AGHT+IHTIeTqkv2kU0/IWAaXMHgtiz8AgY4S3VtE/Cqb3w1Cv+7qFDcHszvpDKiqbnqxIyPaTdCMzw==
X-Received: by 2002:a05:6a00:1d9d:b0:737:e73:f64b with SMTP id d2e1a72fcca58-73dc1452c12mr228516b3a.1.1744920625544;
        Thu, 17 Apr 2025 13:10:25 -0700 (PDT)
Received: from shankari-IdeaPad.. ([103.24.60.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa5885bsm279915b3a.108.2025.04.17.13.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 13:10:25 -0700 (PDT)
From: Shankari02 <shankari.ak0208@gmail.com>
To: linux-m68k@lists.linux-m68k.org
Cc: geert@linux-m68k.org,
	jeanmichel.hautbois@yoseli.org,
	Shankari02 <shankari.ak0208@gmail.com>
Subject: [PATCH] m68k: replace deprecated strncpy with strscpy
Date: Fri, 18 Apr 2025 01:40:13 +0530
Message-Id: <20250417201013.46384-1-shankari.ak0208@gmail.com>
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

