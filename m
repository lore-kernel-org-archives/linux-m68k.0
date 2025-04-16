Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E23E23E33C
	for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Apr 2025 11:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744803769; cv=none; b=R94Afu3+wDYbYSn6NLowhbi2+7KzkRrUsnbjSgWPhHyBe0TMEzXQPAb1s3nG8iuHR+av7DRWL+zxIlx5oBj//eHjAiWQt6+foGGlaWzoXOXjB+f9fZxpaZBi3g2amAG0PqIne6OFG5LEBY0j31hyzTRqBoUFil0EkcdbKvNDUBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744803769; c=relaxed/simple;
	bh=2LhwZRPX3le1pcDWgaebmjYcBMNO+zwSm1AT5T+GXjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cSpudYhHr1dv3UwKlm3pZ5o8sjbfsaGhN8wYi17AbGACGBps+pgTgqoGz6H3J5o7P/LCM3ZaZ96DHM+WkW9A1UjDwfkN34mINaRRm/FqHIH+K1EHqlDEcV/X+0yNrekpySurlw6DLj+F1r0XCPOJ+4y2bJQz30iGz+q+g8ogsv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=tVUBOzfJ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="tVUBOzfJ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7398d65476eso479200b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Apr 2025 04:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1744803766; x=1745408566; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QZ1kKIALmvRJch4ZVaRl0p94OzYXnQT7EpkhRUXULZI=;
        b=tVUBOzfJEKzi/2b+l7otqKE4ad3CniycHnq/WsQW7zcqHjQDjXjGkpZ3wBH97sdLp3
         ucqbQFSrRLHWTGxGnwUci85hJB/rr6jPrEM1enjSOSCZtPiy1JlBcCxcgF3AfKq5lRPh
         dM3myhiX1gu2ckPWPgGQrMyjjkn1JC9BAxYuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744803766; x=1745408566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZ1kKIALmvRJch4ZVaRl0p94OzYXnQT7EpkhRUXULZI=;
        b=WTav9O/S8kENEsxbmDqeOIBleLLB4bqKTI5hMVoplHfApA0yMw1Z/uObBmB11c2g1u
         Dg0wp0pgl7oHkWYzKFYOo3Vus/px7Fbv/iUZIQjozMx/NUtFS85RoY10qTWB6Pa/pLGA
         Njte+6bN1YJgf0y3ZKaodHk63jExejPOwfj+ZTAZJaCbbk9SnOliSGTHUi7dRRknuocv
         s3F7JQMfz84yZeTxYXXNlhZDejCCTqCmIP/fPjaprZOVmXSvHOWogRtynciFu8SMLdEg
         h67P5WpS1nFg4XFIugS2MQaDWwMhn3kepMMYPbiAMy/uiIzq01C3AXCowupG/oF3jS7a
         P1VA==
X-Forwarded-Encrypted: i=1; AJvYcCU0vh+wb77dOlGFYWvs7nAQOoJpFw3HmNhN9NtPyw3ArHP3TBbDv3hq+HpvKY59BzgFzDrFRVe6fmCe@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy/QGecIDv/6KHXI3DWcYRfmhAblapylDfEfFSWdAWQyJ6DUIwk
	cPjhFAOebFwHDVBQ4Di4Kr1UhWXTEMi/MmeDRVBEw8ojOi7qj+eC/BDhWvtVBZQ=
X-Gm-Gg: ASbGncs98cx0HSmXJY1iG4DMY+DSGPf/Idq4FNcE43jbzUOmgYWYdycfKzl/FEuqscc
	chfGAat5UmMOb/gHW+04BCHu3bPdgGUhjE85eTo+YXVPUuexCZafldGe/lxB2jsL8y+KGpUf41S
	0AJ78iRpxwPHd0dJa/XtmGPZhWMqTR9KPSz4R61tS0G0RGn0E1ZPNi/bfqkR9UHMWzQLaF/Ff9W
	VvTJAujBYMBJBlYEXaGKHxU7yPXQZa9wgM9meHyk7PleBv3m7lWve3Movma7lgDmiGLMMfR2ltN
	e9cq5zIEi9cxILLu+wUV/NS8AXIHmFglVZjCe8BmbajDdcGx/x+OoowrKfcc4u6w
X-Google-Smtp-Source: AGHT+IESZmQwnLlyeDHw9qMDSKTCYjAyPNnhbiBsQon2uT22cUwcOGjEHw6IbbM4+RMjOBEJeKwL7A==
X-Received: by 2002:a05:6a00:3b8b:b0:732:56a7:a935 with SMTP id d2e1a72fcca58-73c26e42522mr1976219b3a.12.1744803765956;
        Wed, 16 Apr 2025 04:42:45 -0700 (PDT)
Received: from shiro.work.home.arpa. ([2400:4162:2428:2ffe:79a9:b58a:259c:e1fa])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73bd21e14e9sm10171722b3a.77.2025.04.16.04.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 04:42:45 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] m68k: Enable dead code elimination
Date: Wed, 16 Apr 2025 20:42:40 +0900
Message-ID: <20250416114240.2929832-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow the experimental dead code elimination config to be enabled.

For my 68000 nommu config this frees up a few hundred K of memory
so seems worth while.

Boot and build tested on nommu and mmu enabled configs.

Before:
Memory: 5388K/8192K available (1986K kernel code, 114K rwdata,
244K rodata, 92K init, 41K bss, 2624K reserved, 0K cma-reserved)

After
Memory: 5684K/8192K available (1714K kernel code, 112K rwdata,
228K rodata, 92K init, 37K bss, 2328K reserved, 0K cma-reserved)

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index eb5bb6d36899..11835eb59d94 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -32,6 +32,7 @@ config M68K
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_BUGVERBOSE
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS if !CPU_HAS_NO_UNALIGNED
+	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_UID16
 	select MMU_GATHER_NO_RANGE if MMU
-- 
2.47.2

