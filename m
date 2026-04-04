Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B841DE4F1
	for <linux-m68k@lists.linux-m68k.org>; Sat,  4 Apr 2026 02:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775270897; cv=none; b=ACpZ7wNb8D9JNZ0+9W25t5czpYd1ROXWz9tb5rbz/6FE1dvMY/gALj+BURRbASwtKO9pELtFbweQsmgCTPMHrq3CVavyFrt8ONE9ujCq26CDgTcSrMQ/Ofa6IL/oXq0VLhjBmznUL+8eSj1hLoChhAYgiwy445Y/T9eW+e9MlxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775270897; c=relaxed/simple;
	bh=fgQQNOKuMueE/ZyLNmfMw1R9kcNQ7aWmpI5+3SGW3xA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u7dDOCQ25j3NPQUaQ1/CK+gotZ4PNnJX8yDIoI5TDWBdqpPvg3xm0Bivo6lItHE78QbuHtJN8W6gxz37iU49ly40mX8WVZB5n/42oPxrtK8VlGuHfqGVoGoD28Ad5cIgwt/bxk8BGaGNOqDXx0hQU7XfnEKz5kP4ewVEqw+hafc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=lg2tlgBd; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="lg2tlgBd"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a9296b3926so13035595ad.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 03 Apr 2026 19:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1775270896; x=1775875696; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u5S8YJhXct8ojk8Eesx8KNau+uZSviPOz1KIfLqMfKg=;
        b=lg2tlgBdrVWgrJRg0kHH3OFFBjmsF5nIWfAyW+71eTpz2U09Ywg25zGtrorhb6Zy/t
         fgp4A0s6FFTRfjJd0glA7/p4TZ7x6bRgb6fKSrBl5GzeGaFZ0iSahivf840fjxzEbQC6
         Y6wDGRv4tYEnWoyMwvvGTMJaievbrd5OUZDaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775270896; x=1775875696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5S8YJhXct8ojk8Eesx8KNau+uZSviPOz1KIfLqMfKg=;
        b=UJgXwXIeOpjgyCG7WoTplZK05ibkDwnXNsOIuILkqwIMUo5H233mgXTXdJYpcnFoWr
         FU8L7pnrBA+SIiJScrcFBNVfqwQuEGMfwJKYAV4za94Bni1LmNsqKgzztKVm5BpZQJNP
         L6BFFwyTEDJ2x3a6T9NYcPjKLxrjfAfcBycqJAgADCQExRyW2D2hoHUoKgAQGnaIRCHw
         agIYBTu22wC2zz+sy8D8lpa76rew3QcxejUkXYyO25SjuxS4+IXXA9BbRxdvrxQ2syvB
         OZCU+wSPoj9fe0evKvnd32O2tsVF5dxuIla3+iNNZVTGVo5pwPm8HTEyRmipBNn3iFg2
         fdJA==
X-Forwarded-Encrypted: i=1; AJvYcCWsf+Osg/FTFZ01pIwBfQH3XJTU05671mgJDWyLkhO1SPUjcsBz3W18Nv0jWWgZVhKsutMLGTeZLKwR@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YznbRTW66kmwvJQ92zORLdQhsxslG61VyPMiqk91ectmdB4FMbP
	dC8ilgIcDfyN3keKs7vPWUPbL2DasIVFeotgkcnxxvkovjprtlyvHyT+lTmK7pod4NUExLkyMbx
	FJLu9QxI=
X-Gm-Gg: AeBDiesD4zMaGIkVrP4tfo/2yXa4qQR1NEOzr4Q6Pom1vk9kv3m2HJ30LkaJr2kKemJ
	W/JZ8WzMS8ggxCJ8KE84PuUuquLy3AnTYC60a3wRM8CinbNpLBmOdz1zX/rXLppWEiDEskueO8Z
	v+IdJHmJaFRx5QSWy2MiaJv6tzUmlu73fYl21SANaLD2q5deZJicV7YSstapWdetELUbmlqxYNl
	h1l8gARyiPYrtK84C2E9Ilz7gJBExpw057th1npOPE4bawmR8I7ffmBKR+l6F2qouqtFwf2nF3y
	USUmyNErjKYtefLer3IOHFu24pNNqUQx5dY/MSq4BeHri4aNOg9ovy911SB+8aT3Fg84t3sTltm
	osALIsIoO7R1JoB3rNaooRbf8TfNPMqyP2kaBnGZOofPaK/vd40GtAOCCJz1PgAHvrYX1ripb5Q
	2aFEJkd4E8do6FmO3ss4DDBc3NWsf07i8UppuAhRQE2l21LWox7eMxknlsYQCl
X-Received: by 2002:a17:903:1968:b0:2b2:4fc1:f657 with SMTP id d9443c01a7336-2b2817d8be9mr51638695ad.6.1775270895908;
        Fri, 03 Apr 2026 19:48:15 -0700 (PDT)
Received: from shiro (p1866070-ipxg00f01sizuokaden.shizuoka.ocn.ne.jp. [180.1.30.70])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b27479d0fbsm91568895ad.35.2026.04.03.19.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 19:48:15 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: gerg@linux-m68k.org
Cc: geert@linux-m68k.org,
	christoph.plattner@gmx.at,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	arnd@kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [RFC PATCH] m68k: nommu: Fix behaviour of io macros on non-CF
Date: Sat,  4 Apr 2026 11:46:58 +0900
Message-ID: <20260404024658.2496519-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently for 68000 readl() and friends are broken in that they
return the value from the bus as-is but should be reading a little
endian value and swapping it to big endian.

This was found using virtio-mmio on a 68000 virt machine. virtio-mmio
is little endian even if the emulated machine is big endian. This works
for MMU m68k because the io macros do what is expected there, but if
the kernel was built for nommu it breaks.

Potentially this will break some stuff for nommu non-CF m68k users
but since there are probably 2 or 3 of us in the world I think we
can work it out.

Suggested-by: Arnd Bergmann <arnd@kernel.org>
Link: https://lore.kernel.org/lkml/ada73dc9-edf5-458c-8849-9f9db23ff304@app.fastmail.com/
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/include/asm/io_no.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/m68k/include/asm/io_no.h b/arch/m68k/include/asm/io_no.h
index 516371d5587a..c39db8798ef2 100644
--- a/arch/m68k/include/asm/io_no.h
+++ b/arch/m68k/include/asm/io_no.h
@@ -96,15 +96,6 @@ static inline void writel(u32 value, volatile void __iomem *addr)
 		__raw_writel(swab32(value), addr);
 }
 
-#else
-
-#define readb __raw_readb
-#define readw __raw_readw
-#define readl __raw_readl
-#define writeb __raw_writeb
-#define writew __raw_writew
-#define writel __raw_writel
-
 #endif /* IOMEMBASE */
 
 #if defined(CONFIG_PCI)
-- 
2.51.0

