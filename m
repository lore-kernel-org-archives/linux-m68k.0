Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC223F1AB7
	for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Aug 2026 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910597; cv=none; b=rXdjP9XM97wa/i+4xACPsn0yrYbUipP1bkowA6qhWjPz1aozF5BZRMN0mQ53rrhR3y3K83YkuU1VkLJ+jM8VSzXXaiC1KGQ+Ey+eJjNG2B9BuKJqbZXa5o1YzGVdmQZ9RLj8jjHUtC7QhMXU7JEUDn+gwkH0VLF2GnjrVpEcV9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910597; c=relaxed/simple;
	bh=7qPUDI6FmCUeaOHJjOzTvxSJgNUso5rGsUAh6pdNtvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q34QpXJxpqIDD50GukHXpNjVkR7sh6RJ/359G3IihD/ZTLYAtARWciaTApwu5QQ9Oqw0jjiUfj+6ElAkJG+06mS1T0JpdB89LnxvmqhP1ZwqEs4UjsaaQgLcRjPm4Y7qN1FWcJdYoMLIu1BkflkaCjtljNU27aOwhBhXDosdBLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=Dgp+zcWO; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Dgp+zcWO"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d560775ca2so4983335ad.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Aug 2026 02:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1787910588; x=1788515388; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dKk+6KhjtlpyHrBbt0MDu8KMzxulCaoETO1fRLHo+Zc=;
        b=Dgp+zcWOEwD0dTHk1/7DgrEpxpt+LqJ5d4EpdF+wbXF+SQ2rApe2+GCd/1oped1bBQ
         MCPQ413t3oO4wKKNSjkC1gOvl07rYO3QFp2L/gXc5XDKkKzx9tPnlw4TE/Ka3PVY4khN
         IhONwnlhB769hIg9t8jSQxAseTxOkRfM5bm88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787910588; x=1788515388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dKk+6KhjtlpyHrBbt0MDu8KMzxulCaoETO1fRLHo+Zc=;
        b=UFw8fQWywR15Q3iAgL4G8s58/szFFptUw5kMn5PSwyCCPa7mFSVNHePRlGXfyXKzUd
         bl+gKCeKni79NXSS3Z30NsfPnRty0gTMIO7ZSFIk583YzNpDmICOYC4TLvWlCh9CVO5x
         OnSqCk9TwTDaBxGSgOX4Hi+9r8SgJFMXsihPHbqqKlyXfzVErUBJOvWAJYuPyC7zZDnh
         O/vy0KDxtocR4dmoUCnbviWJXQrCNiLi8C3pGkZzrOUahDt31a1zoYq6YJ9O3q21tdik
         hstrtWD53SO503vRCx4dG5/O/okU6ROVIM5raea+t3W8EZMkw2bX2itwuXs0pGaBcoaw
         17rQ==
X-Forwarded-Encrypted: i=1; AHgh+RpdeLtRHnYQwrRklBGOYVDUkCDNgL/S89t6o0YfenHxZVhh3UsUShdhGD8Z68GihFyXJxPlcibT45rm@lists.linux-m68k.org
X-Gm-Message-State: AFuF++lAJbCuCWe5N60EyPd1t+9pOR7KSd6AUY9zAxTHJOsaeNeBYa5n
	aPpxisTMVJMAsZp95EnkyVbrQbIqEfctaYElhCq24uu1+2q638bkKzHh6vB3yfbLmXQ=
X-Gm-Gg: AR+sD10glpwxDDU76JbXksmF3t5RcmAwBj7zi2oTQtqlMg9CnV1Z4F+TkH57gv0FD1s
	B2N6K2II+VP95Eye5txoImn3Vt+CPn41+8FF6CrnANP1e8n/gr5j5LPPz1bLds8GBUwrZvqcuyW
	8tv/v5mm7+S9GW+iflo3mt/sQRdU4AaGCgCIpoXgQHY1ky0PNeFsXzJFOiVO2cii7ny2zLehrXd
	DiWKzCA72G6XCfL+d9cnZeuROu1I23Lid3BGAuGpVR5IM6D5JeANtWkAKPDpbxdzsCcShAKJYVu
	OGY2eahba43in1bAQmMjCFSMxylnZPHkIZuio+TaItFOnYcH1hPhGR6XE/mX2YGTftTcg0YrNwc
	BzgMumoFjuT/NuYKTAVawQ95pUBHIygZDnLeDXzmNWGCOynMv9vvCGJyrU519o7CjFf3Gwl3oN+
	b3tOMmdxIQbrEJyk9LSl99E89VcBPdNJnPz7mKu8EogDv5BT1LeP82sWqTR3cf
X-Received: by 2002:a17:903:4b08:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d74dc51c7cmr120792245ad.5.1787910588476;
        Fri, 28 Aug 2026 02:49:48 -0700 (PDT)
Received: from shiro ([2400:4162:2428:2ffe:2418:f47b:8c1b:c157])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2d7596412c2sm3821965ad.37.2026.08.28.02.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:49:47 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] m68k: apollo: Fix interrupt setup
Date: Fri, 28 Aug 2026 18:49:40 +0900
Message-ID: <20260828094940.3882602-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The user interrupt vector needs to be installed before the interrupts
are unmasked otherwise the timer tick isn't handled and boot up gets
stuck in calibrate_delay().

Assisted-by: Claude:claude-fable-5 # Wrote Apollo DN3000 emulator using QEMU
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---

Backstory: I have Claude creating a version of QEMU that can emulate
every supported m68k machine. Its still working on getting Domain/OS
booting but it found that Linux locked up on boot and I used gdb to
find the cause.

 arch/m68k/apollo/dn_ints.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/m68k/apollo/dn_ints.c b/arch/m68k/apollo/dn_ints.c
index ba96a92f8f18..89bfb5aaad9d 100644
--- a/arch/m68k/apollo/dn_ints.c
+++ b/arch/m68k/apollo/dn_ints.c
@@ -2,6 +2,7 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 
+#include <asm/irq.h>
 #include <asm/traps.h>
 #include <asm/apollohw.h>
 
@@ -11,10 +12,13 @@ static unsigned int apollo_irq_startup(struct irq_data *data)
 {
 	unsigned int irq = data->irq;
 
+	m68k_irq_startup(data);
+
 	if (irq < 8)
 		*(volatile unsigned char *)(pica+1) &= ~(1 << irq);
 	else
 		*(volatile unsigned char *)(picb+1) &= ~(1 << (irq - 8));
+
 	return 0;
 }
 
@@ -26,6 +30,8 @@ static void apollo_irq_shutdown(struct irq_data *data)
 		*(volatile unsigned char *)(pica+1) |= (1 << irq);
 	else
 		*(volatile unsigned char *)(picb+1) |= (1 << (irq - 8));
+
+	m68k_irq_shutdown(data);
 }
 
 static void apollo_irq_eoi(struct irq_data *data)
-- 
2.53.0

