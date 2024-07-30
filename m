Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F89A18C90C
	for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Jul 2024 23:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722383166; cv=none; b=jrEUM+D/fgMulFzPMnXPqXiN8Rf+Nc5Hq7z3lw2KLxjKNYM+rrM6nz32ijYlDKAZrufGxAhfzkQhKydtddNYk1FwJeM8DVDiP2xpimPkBgVPEC0/zI85344MPkevTTInYEpzRRjB5Aa2l/sicgluD0JV8NWGS4ZCigIJKHVXbeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722383166; c=relaxed/simple;
	bh=/F2IkqN6onhi8bqBg+Ffra8tWyO9XNvT/nQhWcfnN24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rfnkG6N4XQ5gBaD5ftTs+bDuEXKbzMLwuZTlaBDwsxG27aV2/aeODqZ3CYllr9k4b/nrWuugWzIKAT9FxNMhTu2CnmE7Z0ubhE+kG5cqcX//3JPoi2Q0GZ0eiPiVzo+k8LAeIL3hf7CEnOCxC0pCijwu6fhRGS2ar8J76i/hFz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=WT/3006X; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="WT/3006X"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5b5b67d0024so236288a12.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Jul 2024 16:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1722383161; x=1722987961; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1I1Xf39ndiqFsWjFiF87exVBTjo0QTgARXHDppQr8z0=;
        b=WT/3006Xfd3Mn1M+ULHL0DmCu/qfpNBOU7vUS20ufPJtugbCoI78cRa6AfiTcZKN3/
         AOWOU8tMmsfUR5bk7XdbnIENTg0IfBu03kMx9HZ93n2/heh9ApPVkcY4evXpXTpden9W
         8ZPpZXYDFlYyse0BZte/iPN1T0UUVXEv78RMSLyiDdjNA3WCTGRFg59j4rRgtV7V/b6v
         C+qDo50Z1lvo6/8cBV0hc++SeocKKDYJCJEZX+ic07PshyXfoYC5kupqkYpm8L0SwSUj
         Go4nfbHZLN9UlPZUg4tKHLmQFTuid26BittRM05bqiTyRcQ54LfSIvvuYwCP+kV2IV97
         mpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722383161; x=1722987961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1I1Xf39ndiqFsWjFiF87exVBTjo0QTgARXHDppQr8z0=;
        b=cHCXnZ/kwZVtUjAGPV5qd+6cTc521Q+V6ut37s3dA+hZYwvIXIpi7N1InPFpuee6hR
         icy6Ouju1SjcJKpGxqt/2Zdc2NJWKGFR5jlA370drAO54yNhCGMAljAKQUOKfVEZcLCH
         mVQ9WyzwPo5UX3MG0c5USfxOQKy5555VqN6o6/E34B74snIF4LGOhh1CNvFD+YEJYoHU
         5dRPaX0ah/sm8XZa/Z7C1b+oaXD/s15JpGuwcb93D2mr1TabylZ76QZJS1HEQR282LsT
         44gJSyS/gnk8LI0CmtyRiNCvDLByeS1+XSZZaJpLD7PYUgD/rrVdW/4WHqZdXbwAN+9W
         +u9Q==
X-Gm-Message-State: AOJu0YzCA66ojM/3V35LJYMukIuDogWrOhRL6WRBBQlb891keZGuEmWq
	Cs32RSXn4KL994FRFiHisV5wkXemBE2Ovl66+7OgLzocE7aqwQNlkZyPUNyataQ=
X-Google-Smtp-Source: AGHT+IFAqKafX8aRVJKcPGIDXAPBt1l3roBbIwncVQu/DpqAKoun9DJpA1Bn0XY2A7WL+ctL0IkviA==
X-Received: by 2002:a05:6402:35d6:b0:5a2:2fa5:f146 with SMTP id 4fb4d7f45d1cf-5b021f0dcfbmr8913623a12.28.1722383161200;
        Tue, 30 Jul 2024 16:46:01 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-26.dynamic.mnet-online.de. [82.135.80.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac63c50fdesm7861299a12.56.2024.07.30.16.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 16:46:00 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [RESEND PATCH] m68k: cmpxchg: Use swap() to improve code
Date: Wed, 31 Jul 2024 01:45:07 +0200
Message-ID: <20240730234506.492743-2-thorsten.blum@toblux.com>
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

