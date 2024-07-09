Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E5E15747F
	for <linux-m68k@lists.linux-m68k.org>; Tue,  9 Jul 2024 11:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720523257; cv=none; b=lx+nFOBX8LX9McLJ7FO6sSUtni52LBlhW3+3Uss5EFKaitPCk6oZyCcIp39Y6exnwUWjRpm42+QzKEJ/eLqGnr/2WWr84Ilz/kKgUiVt72h92MyBKHgzNrp9zBTzBu0VSuKTlfeYn3qF1+H3qxlM5lz7JAJWisXY++k6Y9bDOsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720523257; c=relaxed/simple;
	bh=/F2IkqN6onhi8bqBg+Ffra8tWyO9XNvT/nQhWcfnN24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lxSr7ysCFYW+VGFz+hzfGxRKvPuke+05+WjrFk+x0JM8YDkN/sLwwVBK+od8FRQ21uNA+MFXgckz1jpEbjasF8GFODHmdG4BjwR5ptAyEcVAqWMbbSGs9mc87SC5W8k0GE2Ssal0kZOSVbPbXZyazR7aWXS7yPYsxqgz346WLGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=Bi//Rg0t; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="Bi//Rg0t"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a77c25beae1so529143166b.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 09 Jul 2024 04:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1720523254; x=1721128054; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1I1Xf39ndiqFsWjFiF87exVBTjo0QTgARXHDppQr8z0=;
        b=Bi//Rg0t/lbqcKWMR9MIj6sC1yqi84jJF1JPOtOFO+kH7YKIGOUOB7kisGLDexfnY3
         do/SKkbfF2NgxW+FpAHg4XoyaiG3cMaiAuSOx18UA4ZeoNg/Jsh5tiMJvbSprQtS87oQ
         tkWjPHcW/3Oym6UGb9CbwLHQuI4zSJ+3CQLg8VFOi1DDbqUDUhQK1K92UgXOtz40S5cN
         jaXuzbDzNpHu50v5l5QByU3yQ8vSQn9DQ+s1ZYIQhSrCDsxHuqOs8SYOJ6RJBtdNdFjK
         l5GKPVdeFQlcip/YKIWj8nS0O6n4BTRYLNISwmssMB5/UmoKuzSMXdCKhvYW6Eu+xJXW
         t6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720523254; x=1721128054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1I1Xf39ndiqFsWjFiF87exVBTjo0QTgARXHDppQr8z0=;
        b=ueYoiLmHUrPkPHyw4bzl5tCTaV59w1HARPE5VfxH1ZadUqj/EvEA04Mub1SssYsOEO
         aDgwHcRd9OSlB6HjhWWn25Va8AFVeXSmMTE/+Lel69Rfw0RjnH23QFaqL4cEDGUQdwtq
         k4gKw4D0rowH75hbL/N0Lhv7/gZlaQLMPMrakIRsG5gGQc7d6FINq+DwtjefeRJGdoys
         pBZuIMDB6y/Cr+OwMps8s57+G721Vw9UXIoiBdml4l7V8IWZhyjw8quxOVOuPQlsXFvT
         avF1jdr5wj43T4aWMLufhxrNqXj+4HvNnm+NmwTeFMl322HUVSzjpr8pM+w97uXURvnk
         ruig==
X-Gm-Message-State: AOJu0YxEjATW1mEqqs4l4HfirFiMHW/22eF2nXEvaOw5Wp94tp8quz28
	b1lq9zf0Ner54d7vCzsB9/24Sob0mtWRRsR98P12Rr/NWztYpPiLqBwNp8pR1hM=
X-Google-Smtp-Source: AGHT+IEkC6Gi8bnVVlEoW+KjySdnk0g6ZRKfC91eeq9IoFsCYK+Vmj3FZQuIZi13296mSsrR6orb0w==
X-Received: by 2002:a17:906:46c9:b0:a77:e2b2:8ec with SMTP id a640c23a62f3a-a780b68899dmr145995466b.3.1720523253801;
        Tue, 09 Jul 2024 04:07:33 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-224.dynamic.mnet-online.de. [82.135.80.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bc8b8sm69164366b.30.2024.07.09.04.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 04:07:33 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] m68k: cmpxchg: Use swap() to improve code
Date: Tue,  9 Jul 2024 13:07:04 +0200
Message-ID: <20240709110703.66166-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the local variable tmp and use the swap() macro instead.

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 arch/m68k/include/asm/cmpxchg.h | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/include/asm/cmpxchg.h b/arch/m68k/include/asm/cmpxchg.h
index 4ba14f3535fc..71fbe5c5c564 100644
--- a/arch/m68k/include/asm/cmpxchg.h
+++ b/arch/m68k/include/asm/cmpxchg.h
@@ -3,6 +3,7 @@
 #define __ARCH_M68K_CMPXCHG__
 
 #include <linux/irqflags.h>
+#include <linux/minmax.h>
 
 #define __xg(type, x) ((volatile type *)(x))
 
@@ -11,25 +12,19 @@ extern unsigned long __invalid_xchg_size(unsigned long, volatile void *, int);
 #ifndef CONFIG_RMW_INSNS
 static inline unsigned long __arch_xchg(unsigned long x, volatile void * ptr, int size)
 {
-	unsigned long flags, tmp;
+	unsigned long flags;
 
 	local_irq_save(flags);
 
 	switch (size) {
 	case 1:
-		tmp = *(u8 *)ptr;
-		*(u8 *)ptr = x;
-		x = tmp;
+		swap(*(u8 *)ptr, x);
 		break;
 	case 2:
-		tmp = *(u16 *)ptr;
-		*(u16 *)ptr = x;
-		x = tmp;
+		swap(*(u16 *)ptr, x);
 		break;
 	case 4:
-		tmp = *(u32 *)ptr;
-		*(u32 *)ptr = x;
-		x = tmp;
+		swap(*(u32 *)ptr, x);
 		break;
 	default:
 		x = __invalid_xchg_size(x, ptr, size);
-- 
2.45.2

