Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B59218DF78
	for <linux-m68k@lists.linux-m68k.org>; Tue, 20 Aug 2024 23:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724194809; cv=none; b=eICXIbSfeRrnX6QwFIZ1PuWHcQteVBNYF+qFurcvIV+4u0pge0g1PR/jjwkg+K8wQQDmd4JkmofoP2Px7qZdD04TV0ScysVfe7ZscNnIFyDT+08iVF/gwB9kslOVPgacy4igMs6wvDd2I8mteu4APhg/ZESm1m95BHtV4UUqJOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724194809; c=relaxed/simple;
	bh=4ezca/HbuzIwMSXgMe2LRyvA8up1CSnzxc4yOt6pysQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JmQgzPgSwf8ZaXA9fv4UTKaBxHXfM1Eq2zoy2CbAvLSapWGDYqhaKtVNUrIjqtg4LNhG1NBGuxB4+cPSLhwBONWaviMX11j6MFzSBcfsRO5JE6VX6e3Wj+qQQ+CrvvgAjkd2Xkl51ahVs4l797hZ0BzXyrAubfMuETBLajfSOvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=SHSb37pm; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="SHSb37pm"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7abaa983bcso271066b.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 20 Aug 2024 16:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1724194805; x=1724799605; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Job/uX2MYzjKTJ++ttBnOuppDpxmyaGi0fl4BcognWk=;
        b=SHSb37pmSQJfCn3nf7D+EhCMncjWRrsjtQxhirRGl8ic+MC3Erw0Dn/KbCHX21catN
         hpuf0p8xdboGdDf1LSF15Y2yPQHaz+mUPWcxGwj7JZ2QerW969kuCGXeL8uujz3HQyXM
         KL0StR10cX3edRVAolPvj9bL5ulXIkLLY+PyqaeWGv3Zg12xZYEzcKl3E7DLcOpnp5zI
         vo8SSmvzvttTT8Jake+xkXaZsD9kqEPcSlW8iP354wjzvFNyfyAww4lDsvvIuewmC2JU
         OOooQJqsDm0t5cG9RjfhH0qeogqFpszQknzobs99aoyB3tXwzv1FkXtoPq/X+b9g7p6o
         13HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724194805; x=1724799605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Job/uX2MYzjKTJ++ttBnOuppDpxmyaGi0fl4BcognWk=;
        b=tqgn547BL9tTfASLmXXDOO6k25Y6GhuQCH/cXwM7GedHFrDWvroERxdacI01GTuOLe
         INUS7Dt9mWnGXPve++qFH5K7upg1D4g+3J7qWn9JF4s7XvQ8npmMFImpG+qd8TGTdwtl
         bTJVrABAuZ6ydxnpb0GZs1ouNWXDsEm/nPstxOFV8hpPyh8hsHGLEYKaG3IfPGvXI+Sg
         xFHcjuATsjoMQJ29y9aosUyy21XflV9KsRBuDVoUdDqlZ5wVZ7nWVVUsuJPrP3DSP/AG
         DmmvqODB38+zty/2awRdIvizGCsa9HgiBpmyNZL1Ky+YzReS/YNJA+oFYBQYXnxb6aCD
         /m+Q==
X-Gm-Message-State: AOJu0YzNWXWV9EkWmFelF3yMYF3ctfRNl4BXQZXcFRl75Yi6wLi6XT16
	rU44f0nrIy7B1h9Uo4piBuN7Q5sWMZYHNufwdND5rOx2yr+U1zgZLQwSVgWIHZM=
X-Google-Smtp-Source: AGHT+IGqlEEXsKqpcS5s1O+/2//UMr4x9harZHJcj+McT1D6iUWdMCWzBCLr14d0F+fhlfTlzbQ8Bw==
X-Received: by 2002:a17:907:94d4:b0:a7a:9d1e:3b28 with SMTP id a640c23a62f3a-a866f8b3545mr10983666b.5.1724194805029;
        Tue, 20 Aug 2024 16:00:05 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-228.dynamic.mnet-online.de. [82.135.80.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8667cb4ae8sm48779866b.192.2024.08.20.16.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 16:00:04 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [RESEND PATCH] m68k: cmpxchg: Use swap() to improve __arch_xchg()
Date: Wed, 21 Aug 2024 00:59:02 +0200
Message-ID: <20240820225901.135628-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the local variable tmp and use the swap() macro.

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
2.46.0

