Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FC212A177
	for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Apr 2024 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713270155; cv=none; b=creXy1uhX5fsSzQDOtnjJrTsNOQFERfAFcg7sXLdVzp2PjnSt/1+qczuNDwKtHw/4TqeonnDF2CPOnmYcePTxjo4w8ZwHrydx1YZG3zvjlwIftxy608GQ9/6xL1TupjxKy943ZWqal9X6dEbvz0hFifcGrNx5OVGnRiyggeaVR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713270155; c=relaxed/simple;
	bh=K7xhnvZpmdN2MuOixIDWglSN3H8jS49clJFrbDjMbxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LJC9UBnOXD26oFQDxqcZCIvahq1gzaSZ662g4rulAv/Nfn9XiuvnPemrmnU1/RIlPBsXUquVWZ2+eTagSm51KU89Pi8i+A87OtQatqga2nRnOFdm1T5p6Hk3NsVMakzWTDLS4pqN/bv34bMXo8RHP0fa4uoZyPlkACDoK9M9d6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=YlYCVClv; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="YlYCVClv"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57042f84cabso909788a12.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Apr 2024 05:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1713270151; x=1713874951; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DvoNQ5luSTO7Ksur3Peu5AAvJo33qeP0AozWIJMD134=;
        b=YlYCVClvZ+k4UxP9aNnijMK+wSdpgVoVL+Qxpgqp2bedzNcMxisg/DhfRY0l61nve7
         yeR408Q9RI5B0ETncroxVuKJWTW5qIHcJDzDulRDSdtlV6Rzzf1ymc30KrwfbYKbU2eB
         8KkluOG2nIg54RkgbkiX6Ao9N17UqDWTFppNzClsKL7mUt0ADTHs5oRk+6QqFm0xkBB9
         yZWM62qMEPTCuVk9aNhRMvQuVif0zYlxwWlfc9IatP9GNGWYYlsKegkiDtAfq4DOiZTe
         DFz4aTaXDR9XbqaOecmV5LpgKR0ydUA/uiyXN8ajJT47Zh0FVf8aE4UIoTHC/bXCwEo/
         lWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713270151; x=1713874951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DvoNQ5luSTO7Ksur3Peu5AAvJo33qeP0AozWIJMD134=;
        b=FTVCFgC0l1lCBdMP3327g9KuDXdv0UZUY9NJS3xUObIaOwY1P5/31BTWD8uRruydrZ
         Y9+R3+pjfXoqbTpLdQ/mtuGIbiKrd3fxU2BM8vGMx6ZMoLUY9q1eVUuK97KLaTgTmK0d
         zCR7nXqZjdVaJdxMHrM7JDMkHz+8NxFDiALbbLw5P6IiFWmosb+D/VNC5I8dT+llS+Yj
         7fIO+eeiGod1OpZlfRtv2oDkue7k0vh2UAbY9WbBWoS21nXEZnPNWHkOlvv1NPNIbLjv
         wvm3/6Hm1wOLP5Dcd2fuCDWShoiOdM0GQC2BqYI4S80eerPEt8FKlTFJIkC6SjpVK048
         z1dA==
X-Forwarded-Encrypted: i=1; AJvYcCX/BcH/ywOVX/09HZwZ4s/lZhR3EIuguuof0zSR93G3tVFyXdkwPfZFe/ye8PnPSrIi0utVZBj0X9pSWqmnl2d6kuE4UA6pf0tT8SfdTyWd
X-Gm-Message-State: AOJu0YwaovG1ABN8Kvlpf3Dd+9KygJzK0QH7YWC2hBuR9IXPgi/oeLnN
	/9ilYRuHBG4Nd0B2MflPxjLeqKhSmc/HaBGXc/BhHLtsMWZX0X/MLs6fRDaZBrw=
X-Google-Smtp-Source: AGHT+IFXMK2JgeE2MzQKKtGuebiKjEBxheRz9qFC8MlOFHALwKnDL20B8xRND/c8fnSFs9gVkB4DNQ==
X-Received: by 2002:a17:907:5c1:b0:a52:2d83:1483 with SMTP id wg1-20020a17090705c100b00a522d831483mr9724208ejb.53.1713270150620;
        Tue, 16 Apr 2024 05:22:30 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-212.dynamic.mnet-online.de. [82.135.80.212])
        by smtp.gmail.com with ESMTPSA id bm23-20020a170906c05700b00a52331dc082sm5844162ejb.11.2024.04.16.05.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 05:22:30 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] m68k: bitops: Fix typo in comment
Date: Tue, 16 Apr 2024 14:21:56 +0200
Message-ID: <20240416122155.313400-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

s/Coldfire/ColdFire/

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 arch/m68k/include/asm/bitops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/bitops.h b/arch/m68k/include/asm/bitops.h
index 14c64a6f1217..621533b3858e 100644
--- a/arch/m68k/include/asm/bitops.h
+++ b/arch/m68k/include/asm/bitops.h
@@ -482,7 +482,7 @@ static inline unsigned long ffz(unsigned long word)
 
 /*
  *	The newer ColdFire family members support a "bitrev" instruction
- *	and we can use that to implement a fast ffs. Older Coldfire parts,
+ *	and we can use that to implement a fast ffs. Older ColdFire parts,
  *	and normal 68000 parts don't have anything special, so we use the
  *	generic functions for those.
  */
-- 
2.44.0

