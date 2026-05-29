Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1D71F130B
	for <linux-m68k@lists.linux-m68k.org>; Fri, 29 May 2026 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780047661; cv=none; b=SeZXUp3RsYg+9AOf7zLuNLQQTI4pfy+IEOYJbWikV+eK9XcDj02vF/osQF6r5yzO1tHhO+eF67dAV9vB/oR64sOhFpOMjby3EWnHZ2ZwtOhgEljgJrs3UTPiNJWBkC28acFLj5aLQNGWy2ELXiaPMcNpSuNCv878QNrHWuUW9HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780047661; c=relaxed/simple;
	bh=0uZqe+NXUPzk9AoU29J90aR6YOlih3MkIkmZzO997ik=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=loghdFLfoEpn7+um9WxBnE8eO2ar8Sgmd6miiQtxx+F8AB9t0BYQhfBCwwcLXC9yCZGjUyvwJjO8muIr51K/QF3q/bngC1lNJApv6XPvqDv43iqTfFSKo6BvqpXZwsjicoGO0tKX9ounlEdESBlxBRONQE8dNq+fH2ad126oaEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYheVQqQ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYheVQqQ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-837b704783bso1249398b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 May 2026 02:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780047657; x=1780652457; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vnw0/SoZFAvCCGA9LWkYqPGq7SPvUsRGSkJoKPybuIc=;
        b=AYheVQqQGV8YLbAGRRkeV+lQnqLER4G8qGS57Rld4uEJT3AzDezlb3g2y/VrRntnq+
         fSH1db8TC+6VCn6+bmEWuS4M0olGEy6vdxz8gnxYzvKWdJdjK7Xe9ZTXCgiGb9Jbr/Dv
         VULKltRZRyT1iy+YDOrR122tepcLL6TdgqTWX1H6wmaon0ybo9KUwdFJXNA0WcMedjmy
         5BSZ0rwGbGPNUMMQS2KqbxpzOexhQHoZZxXMiHTLr4fOku9KdS4TgP3nDq8YIMI36iJH
         L3JyM7JCp3WYTWmEqBuoE25jRs59tuKbwh5YG1BYyIbdQ+dkuSQ8FE3otY8nR4r0/xIk
         ExUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780047657; x=1780652457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vnw0/SoZFAvCCGA9LWkYqPGq7SPvUsRGSkJoKPybuIc=;
        b=FZrQhFCc0dPaQmlwAUuAmtpnwDWQkTIPyxxrFwXvfEY32d7OluMflpicRRDK7YIeeE
         wkedG8bz1GfxhW+5VwsvIYuaIfdm+8lwH5FB0XXs8wyqHAQ1ECYmkEsyX2Ei4uBQYV6f
         RXXbAc2janUUkcepbKg8QvipDs5dMNcBRU8cPfZx/kRZyEEg+uMcgyDZKwu4Xe616PBu
         fF8dIDl5jxUlBjTj8Pso5jJqzrrKSjhmSGrIXLHUHbCA1ov/2bTJwpRAfYwPblqeR0l4
         Wbb16+GNW/oNag/g7sGvKvEXs8i+6JmKUVXDnS2JZn7sGkQ4E5YghIAHeZs200YJkrlN
         XRkw==
X-Gm-Message-State: AOJu0YwwP6Kk25unULaT/rXk/p3RwXa1QPz/7pEbJ4fQ7YVSdXUIZpnV
	yvs6O4rgtJVNEeNVZ+sgK4YgameFz+XPe8qI2LVS2s8WszWAWNHP9Isnh/jCe6aE
X-Gm-Gg: Acq92OHZ/EIE+9Q4t+iV92qtSdiT6gz0RUjf15kAKqAObgXtYA3jAbuMfLk2QAkfDke
	3MzyHECRwytsNS41JP3nrDpJmlggZ6CAJqdylUkRxUDnplIZeM+yAhpS22jPjEvAze3blHHmNAI
	+nqHGiHDSRuWiPIIbMIPMbF4AQDdnjFjCa9S4iV/5Ix2FcXHey8dPvml/f+P9eO1qRDRC6FwRaU
	4s20fHN+2DdhPEDImyRqJPPaJM/Ui2rjmT5VpiXhljXcUHg1rfAzyXIQFxh2lKgqcHliYF7fpZv
	Zcbl7UezIHnfrruzEl/g47m9U5eOQ25sMyBbXQL6ACfS9kEVBbTmXJTd4Wuyrd4ImnZBIQETaHC
	V/2F0o3KqZwSrGuUM/mlmIC0xsFRDtqIbcBFHD7AkPpxPZd+go0XVBuW4b+T8pxfuZ3z3PxOOjs
	0+merhi6p02mRWj5myhGn4BT+dDIok1UJ0LA7BJlrfo3o=
X-Received: by 2002:a05:6a21:46c5:b0:3a2:ea40:c93c with SMTP id adf61e73a8af0-3b411c9dc49mr1089250637.1.1780047657247;
        Fri, 29 May 2026 02:40:57 -0700 (PDT)
Received: from localhost.localdomain ([189.1.242.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b32f2fsm1292233b3a.22.2026.05.29.02.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 02:40:56 -0700 (PDT)
From: Yiqi Sun <sunyiqixm@gmail.com>
To: linux-m68k@lists.linux-m68k.org,
	geert@linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Yiqi Sun <sunyiqixm@gmail.com>
Subject: [PATCH] m68k: syscall: fix syscall_get_arguments() argument mapping
Date: Fri, 29 May 2026 17:40:23 +0800
Message-Id: <20260529094023.1428008-1-sunyiqixm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On m68k, syscall_get_arguments() currently returns orig_d0 as args[0],
followed by d1-d5 as args[1..5].

However, syscall arguments are passed in d1-d5 and a0, so args[0]
should reflect d1, and the full argument set should include a0.

Fix the mapping by copying all six arguments from the saved register
block starting at d1.

Fixes: 6baaade15594 ("m68k: Add kernel seccomp support")
Signed-off-by: Yiqi Sun <sunyiqixm@gmail.com>
---
 arch/m68k/include/asm/syscall.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/syscall.h b/arch/m68k/include/asm/syscall.h
index bf84b160c2eb..2e268eeedad3 100644
--- a/arch/m68k/include/asm/syscall.h
+++ b/arch/m68k/include/asm/syscall.h
@@ -52,10 +52,7 @@ static inline void syscall_get_arguments(struct task_struct *task,
 					 struct pt_regs *regs,
 					 unsigned long *args)
 {
-	args[0] = regs->orig_d0;
-	args++;
-
-	memcpy(args, &regs->d1, 5 * sizeof(args[0]));
+	memcpy(args, &regs->d1, 6 * sizeof(args[0]));
 }
 
 static inline void syscall_set_arguments(struct task_struct *task,
-- 
2.34.1

