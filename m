Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EE12AF16
	for <linux-m68k@lists.linux-m68k.org>; Tue,  2 Jul 2024 03:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719891728; cv=none; b=Dfc2h0aEJ3FPFZNam64ZYInM7JG0W2oRV+yWuq+oxAjlVAWaK99Id8pdyN3ZpFpiyhgDcSDEq6nbi7lu72EldIr/gPfpmgjXHOAObeBcISWaLqYDxYEokPRmd9mNNaL4aEyrolaVUF2iBWS7VzkqphjF/TMkYfkMUAqNI3CENoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719891728; c=relaxed/simple;
	bh=VT+xgDApO93xrdz4374Uv9pxQU4bO2YjGscqme+ykbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vt7HeRr4WyMPz7JU1Ms9MeN+w0/uFslRgfEqcUtEMOizftr15u6xhVTJHgYsYj7MWmTw5J5W6TtuAu/1tePpGATeHldLEbckUAeow5f+/YFCYcUdCwbNmzp3ZZqq+fQ2iF07+fdByjqS02uU9w9pW0wzqqZ5y6Gi01/jkg6tW1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=MaG1C/1u; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="MaG1C/1u"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2c1a4192d55so2156726a91.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 01 Jul 2024 20:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1719891726; x=1720496526; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qXwS5FNu142LeFbX+kvv8eX9edjrwrcGHefzN76Waeg=;
        b=MaG1C/1u1zXLzSS8RbWR6TCP4gwPdeoqImX9KR8tsiQ98nqrU2AL6ZMzEbouN5bUlx
         dmwBW3dK/8F5vcpG7w0sk/tFMjDfZV0Jk1eZqisI2KpGnCLJrXU8ObWip7hHyEwoX/9o
         JCYHWziOjXpe/pa4HFJU0ZgQOVaiA7byUd3R+guZU/bNyDP7xiCgV6cDDq5YNUPHDgf+
         i6n6fWSvnjCl274u86I6UVhAnvwuEQwIZF3cBHnxEvT8dVnPOXFpauoS8Hv3AOMeM4cu
         SPEBr6yTmgf+S0UE/S4TtGjQhe7MK+lTeQl1D0r/Ub5gpOMwu47eJc1c5NheV710Cj+k
         remg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719891726; x=1720496526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXwS5FNu142LeFbX+kvv8eX9edjrwrcGHefzN76Waeg=;
        b=EpFjK5LRVX2GMPrALzQLBhr4ZQQaUf7JeWIIQyM9UjVlebOg+7eccfjcZpBEvAJwlG
         0RcBa58v4MQWUQ4n5XcE8lXAPDZ1PceWNS8WhlRy8iExm8WwaWQyxTFvcA46gYwHQVi8
         Mi25gw626xS6VGhiDWpxOOOgGFujC9KXvGXZIzBgQ1N6ZkEcJ3CR2p2wn7G2F/243IBY
         w7SGCSoY/RinRmtn4F2QcC2MITxJG1Nj1IXIzOQ9b4rdC0mJwUuVaOLzqNyE++yKbYH5
         XQZU5lz2rhdbI+VVtunPBK6ORxuk81hTR6M8AsbPj4GIE9SJp/WpRIaV31R73yrtcw4e
         yTsg==
X-Gm-Message-State: AOJu0YwMb5ovVAa8EksDNtoTpBK1VydiC/Yr6N4h4vfZITeGo26dGWfM
	kaT3G0WejOu8DcFSREHI8PrqOtbkmh7cGG2fvXA9y3tDMFX7mLbHlkMK03uUmJw=
X-Google-Smtp-Source: AGHT+IGef8Rs5zQSAanq33h/aAXIXAYTVkzd76pQ0aVFTjWRzYWESFvs4EqqePkjtQ8ctjkDKPJzhw==
X-Received: by 2002:a17:90b:3449:b0:2c8:6a9d:5060 with SMTP id 98e67ed59e1d1-2c93d6c654emr4234627a91.7.1719891725870;
        Mon, 01 Jul 2024 20:42:05 -0700 (PDT)
Received: from fedora.vc.shawcable.net (S0106c09435b54ab9.vc.shawcable.net. [24.85.107.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce6ec6asm7683610a91.26.2024.07.01.20.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 20:42:05 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: geert@linux-m68k.org,
	gerg@uclinux.org,
	dhowells@redhat.com
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] m68k: cmpxchg: Fix return value for default case in __arch_xchg()
Date: Tue,  2 Jul 2024 05:41:17 +0200
Message-ID: <20240702034116.140234-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value of __invalid_xchg_size() is assigned to tmp instead of
the return variable x. Assign it to x instead.

Fixes: 803f69144f0d ("Disintegrate asm/system.h for M68K")
Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 arch/m68k/include/asm/cmpxchg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/cmpxchg.h b/arch/m68k/include/asm/cmpxchg.h
index d7f3de9c5d6f..4ba14f3535fc 100644
--- a/arch/m68k/include/asm/cmpxchg.h
+++ b/arch/m68k/include/asm/cmpxchg.h
@@ -32,7 +32,7 @@ static inline unsigned long __arch_xchg(unsigned long x, volatile void * ptr, in
 		x = tmp;
 		break;
 	default:
-		tmp = __invalid_xchg_size(x, ptr, size);
+		x = __invalid_xchg_size(x, ptr, size);
 		break;
 	}
 
-- 
2.45.2

