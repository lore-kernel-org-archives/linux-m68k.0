Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CFE37883E
	for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Jul 2026 04:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784779972; cv=none; b=cH6ksDCe0iCB9T6qp52dAbKKEwsXa54QmZpTcyYkhrWCkgjVLOext8x8z5/onITn30ChFwyO2ZUlBkB35zgOrDAxhGAlsFEl47z8+48ols1cj6knBSvN0mBiP3LCpkgm78puYhJ+AwdtHJUccbUUhUxkXGeLRNRn6QMdZw35hpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784779972; c=relaxed/simple;
	bh=DjXitF+XoVBxHCCVQ/mtjK6kMoGXqia2u+WN23kmYBs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZMlK7E5f0/Xog+R29hTA1z/NTcC6Ty3vXkoAu8xVh3bwxyhpEETXXejRqx3CkBYaK+WH94xafmRftPHvw4jZp2M4yhJhLs6v35LPEOw/qIDVS1+1GNrltbDX0r0cwTHIVx4LvTaFX2qxrKZWcO3o9yPu/giJdHK35ChZU0SUtUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zp2KBera; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zp2KBera"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495437bb891so174445e9.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 22 Jul 2026 21:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784779937; x=1785384737; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T6OzZdMAxXlnTM6MrOoQNQBm7GehK9soUFsnMduaI+o=;
        b=Zp2KBeraKZxeSNqeTM1WQWKl+U3TG4P4RVuNHzLTkBxK6zDSkxr0zPi9gjPwgdVmrK
         K+qGYe9xaDOAYfr6XW+NXhVFVrf5M1rjQrXKK8H5G3hARMlKxSdcDrsEb8GNvK8MJRLw
         s/u04vzFClfMUT7t9GdtdJVUZX00rAL/ea4D8hJHrIoYeJE3OmCUMQwEjuXDySyMwR6Y
         4Lt1whoMCRKeL4b4C13DTg919ZRRoARRV3aVhE8Viz2CDgxZkRulXDigTis23PngaOp1
         Im4xSnh/nfj6BnLxvnMZAU7wfHBVTplEhSQHSCTckdJzLurGBfYCB4z01l0z5UDwrQ73
         6u5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784779937; x=1785384737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T6OzZdMAxXlnTM6MrOoQNQBm7GehK9soUFsnMduaI+o=;
        b=Nc0KHS1VgiMajpNZgPLaLb5yJQlkHGZwCfrel8aS3I9se3U1DsdghDGnGEomYJk5BO
         iukTFHapqu0FzTV5Nwo62Eva3p+QOh86K3U2WwCvzoBCta+OBlKqai60TGc80CHWPUoi
         SWEvc6sGvJU/yZp/EjpPlnm8PoyQFe0Rh+KQt08UDtFOVEg01LHUiuvX6yNyOnRgmODS
         TxKrr4L8r7kJnyGweokknIknzFBRNg0s59G20cxywVa7UmzD2Mu52vsPWkbjv9fM0BQj
         cg8fLrNAyubAXafZUbtesCPWj/7zylvg/Y9lTqCLQzl8gkt+yU3FdXSTtb0cU0PDiPGC
         ifxQ==
X-Forwarded-Encrypted: i=1; AHgh+RosvrQmPk9n7baLxwrh4LgxhvuKuYO3zHnqY+2Y4HxXeJBSqRvwN0KieE/9Cz01sSuiu9lxskmyIWfH@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzEBU8R60wN5AVjT4Zv+/nCnsj0syUj2lLytq+Sy+7YFGnUKKbm
	W/Pam3NLA9uxpm/HmptAbNo9hUg5uQzy6nY+7KoG7OqK8pqcVR8mXBnc
X-Gm-Gg: AR+sD11pmCcIt8EF8ia6wkTCYudqavsBvku5dk7kq23Kkn8mMOC1vfGkSQpDYWuyIC4
	Z0W0Tq6a9XafyMm+mgJZ1cwiJiqDNVjHdHOdIr0WSvjjPzFppqK6nIGDoCnIwTydH/ssqhPqum2
	GMDN67V/6iBEKtg0SJnDysIdpud7pq6h2o8CtbYbhZACsmPU81qGX9eguL+NT7u70QUfk+aAROy
	wwSpPrsumLsI7suzgFMcmzgSwpFWgegBs9ENJYdbnQqw/nG5ePbdYroIhlNkrsZHuJA7Akmck6X
	DRiBvast47k1Nh3PfOMXB5F/mokuZaXkSRTkO8wqT3+XCocVZD4VM8VpmY3sLkVfiLCqxvB7hVH
	fLzay2uTys0m+CSpbrUxZ1DFuZX5m5kL2oRsfWoYR01fDjXk8sOq3PQqt2AI/faYSBRZt0KhXgf
	szt7bYfuWeo0D/KL2f30b7Cc0s+rhIeTOIrTQMq7do/P6dxyR6VGzIMigsnK+3QPTJ/iiJr9h1l
	SU9jhYTpaFbd1lW2ORiiT06/oZlq5R7jAB0YMZWKwcOCRBnwj5FAfHK+w==
X-Received: by 2002:a05:600c:8b6f:b0:494:1f7:8057 with SMTP id 5b1f17b1804b1-49574581059mr8014825e9.1.1784779937140;
        Wed, 22 Jul 2026 21:12:17 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-077-002-057-064.77.2.pool.telefonica.de. [77.2.57.64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c98ebsm175819785e9.13.2026.07.22.21.12.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jul 2026 21:12:15 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: Fix backtraces for non-running tasks
Date: Thu, 23 Jul 2026 06:10:55 +0200
Message-Id: <20260723041055.47289-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When no stack pointer is supplied, show_stack() starts at thread.esp0.
This is the saved userspace register frame, not where a task was switched
out. For kernel threads it points to the zeroed frame created by
copy_thread(), so sched_show_task() prints no useful backtrace.

Use thread.ksp for non-current tasks. It is saved by switch_to() and is
already used by __get_wchan(). For current, start at the current stack
frame, as is already done when no task is supplied.

Tested on qemu-system-m68k -M virt using SysRq-t. All task dumps contained
resolved frames.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index d2f25e8895e5..60759ba3cbd4 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -936,8 +936,8 @@ void show_stack(struct task_struct *task, unsigned long *stack,
 	int i;
 
 	if (!stack) {
-		if (task)
-			stack = (unsigned long *)task->thread.esp0;
+		if (task && task != current)
+			stack = (unsigned long *)task->thread.ksp;
 		else
 			stack = (unsigned long *)&stack;
 	}
