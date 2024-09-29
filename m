Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12AFAD2F
	for <linux-m68k@lists.linux-m68k.org>; Sun, 29 Sep 2024 02:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727578516; cv=none; b=EJlGT5CkeckBV81M/sBNHtE7VqAYto9B6n+UJbsH1WWQ44RY9kndOwo8tlq2vloyimx87iu4p7aVnH7EVK3MDIEgDyRs5SDZhdd9ZmEaJUWPOxwYq8JfTjchSCPv26Xe3FiF72VRzNMYr0R9Lq9W4tmXmR64dIWwm4Lh1RGg7R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727578516; c=relaxed/simple;
	bh=4B+kpENM2KamWunn1VtNumHTJypu13muex8nBDOgblQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X1bEKLMFHwcuPWg9yEiUX/s2rIRyzIb55zZbhqyyB18gNYla534aN9IHEOdNbx7OcyJtO/gZNCJCJDfk5LtQLryruA5wj5jNPq1Ry1Q1bhl9hUcNB+aFAVIb5m2Y2Ykxrtl1616mPn3K76IiwbXAuZItGtqG3TPSxdofDCnZLkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=ZTCaJOSl; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="ZTCaJOSl"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-6e7b121be30so2226396a12.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 28 Sep 2024 19:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1727578513; x=1728183313; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GnPgRh7QFS/ZB4mm9ibjD9Mb0Rxz3mufuNvInEFJ1j0=;
        b=ZTCaJOSlE8o3y3xHnpVh3gv9BUDBCNE7p/nXF/p9mwGa8m/Aq7ro0JuIpm7XzEkFHP
         x3ArXFxxFiIzH6bpOmwrkKbrOr+joiG9XiCWO77Jyezqyjo8FcAjaByseSyijnPQNCak
         GAGyO/oCF1yJ23TrHXqYS7ccA590YQterT4GA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727578513; x=1728183313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnPgRh7QFS/ZB4mm9ibjD9Mb0Rxz3mufuNvInEFJ1j0=;
        b=K3dnl8zfvDKJJIgiB0tbAMXUJU8lembbu7apPB0yOO6JRllhUIoQg5H9MLpZZxmeWQ
         ugSGcay/FuCot0V8xbdDU3imLDGPbK81x1/ccsh7py8vuH+d5Sbgn3lFQg8RFhewe1Av
         AGg69YvOE0rVsrX6IOHQIoUoeHzDEuGefvu02RsCo6pKQgdtJP1wZTS484ZeHHkgbARC
         FAyk+9rl71HQB73qonC4ww/MD6sj/UCGFjaKfeZN8xSV4+Qzq2Ew31gdfPlomQp+a50v
         ktWV9oNUEGMgeakzemhZ4b/C3VA7/NM2a9SBJrRl6xWnc4/7GeQ6qsIT7II59fHVoCan
         AVAw==
X-Forwarded-Encrypted: i=1; AJvYcCULElFjAtwFGkVliM/CFxu6ifULZnT54zsAJPfwX88Kj8iFXqzF/OZtNDe8hvc+6sgltURoNPsD1lVY@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyqQ8hZhgRhKX+jiMJJlQlncCq2sd/L9r6bUs3aFXAOjF24IiT1
	GnNfFsE99Vvol6bYGqJJC9Z4DbJmig7BO5LBsD6Fj8rnt9Os6uVcixwCXxAUWm4=
X-Google-Smtp-Source: AGHT+IGMBewkv5Tr2rkT9P0ANjIRY4VbuoQf93g8wX6wDvbVycvUQkG3zPgRoumtVZxN7/2BlPKkvg==
X-Received: by 2002:a17:90a:fc85:b0:2e0:8dbc:3ead with SMTP id 98e67ed59e1d1-2e0b8ed3968mr9574605a91.33.1727578512948;
        Sat, 28 Sep 2024 19:55:12 -0700 (PDT)
Received: from shiro.work.home.arpa ([2400:4162:2428:2ffe:355d:54b6:cddd:c153])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e0b6e1479esm4876326a91.45.2024.09.28.19.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 19:55:12 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org
Cc: gerg@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	fthain@linux-m68k.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] m68k: mvme147: Make mvme147_sched_init() __init
Date: Sun, 29 Sep 2024 11:55:06 +0900
Message-ID: <20240929025506.1212237-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mvme147_sched_init() is only used once at init time
so it can be made __init and save a few bytes of memory.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/mvme147/config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/mvme147/config.c b/arch/m68k/mvme147/config.c
index 8b5dc07f0811..4279069fbb6e 100644
--- a/arch/m68k/mvme147/config.c
+++ b/arch/m68k/mvme147/config.c
@@ -34,7 +34,7 @@
 
 
 static void mvme147_get_model(char *model);
-extern void mvme147_sched_init(void);
+static void __init mvme147_sched_init(void);
 extern int mvme147_hwclk (int, struct rtc_time *);
 extern void mvme147_reset (void);
 
@@ -123,7 +123,7 @@ static irqreturn_t mvme147_timer_int (int irq, void *dev_id)
 }
 
 
-void mvme147_sched_init (void)
+static void __init mvme147_sched_init(void)
 {
 	if (request_irq(PCC_IRQ_TIMER1, mvme147_timer_int, IRQF_TIMER,
 			"timer 1", NULL))
-- 
2.43.0

