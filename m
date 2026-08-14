Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0A926FA60
	for <linux-m68k@vger.kernel.org>; Fri, 14 Aug 2026 03:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786677477; cv=none; b=gYl5/MAdNkfU9qVWo0qjou8mG6L4ihBmkLM7suU/heSnhxkQKr33EjRGXdwSyC5bUAjqjyKYnhumr1l35Z3Ua177bR5tGcUq1z6Zic5P1RMdacC1lX2duMiPh61XTVB+36N3OfhJtlXwjwBs0FrMe2XRe357mM3/NFLO+Au0ZzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786677477; c=relaxed/simple;
	bh=leSZIVxSpa6e2br0Ja18t4UCVQW9UgNN4WHyftjPXxg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=bLZKos3SpYZ+O0ge9+6Nt95gNQ1IB08+zXT92hvHpLJOfT6KebMd7iFcWo+xLQBebEMK2ZhdhsJfym42WxxyqDTkVLxu8aKRIZQEFFAWQw6ZTcRZA2rHq5WE5pEUIh3rAg2vpXTXZ43fRKfjSx1xsGqIsbfsmLURW6jSYHMNofA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8gqMQr4; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8gqMQr4"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so752599a91.1
        for <linux-m68k@vger.kernel.org>; Thu, 13 Aug 2026 20:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786677475; x=1787282275; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oG7/fwKd/lTbxeHS7TE5zx9FE8RhrZ1meXkyFMI3nSk=;
        b=U8gqMQr4lf09yrJbxXWI2nAjfaZg/THwgpsBD9JOd+agI4OPpq0NlzXSglMraf6Z3Y
         8SEv6FkhCT78yMVguxpkvF3pHbzDxqmMvigGaXfcxqXLVKGFChGn/BL+s7L0hFFjQAn3
         m+GYzB5x9Vb/K23oMxvPl7gmvIzef8SjO9nhz3l2sco5enwJoY5tTBqFrA8Zavwna6cU
         0hQhtj6Moaku1BP27eopORWi/rdZeMIPQBGIMVcPSTrUWBckk3C8Yl438ICAT84G8Jgy
         FcvXthvLmw88ZcMGKO7GIoUGqIz7iuRDzUBvxxC+v4mEWG/qXYu6niTiwNMxMQmmGB0a
         qrFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786677475; x=1787282275;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oG7/fwKd/lTbxeHS7TE5zx9FE8RhrZ1meXkyFMI3nSk=;
        b=fKHtnREur0ufl+SsqbuHDmK7wxDHIXGVGFXGDTy/mbliadpsnEx/w8lL3fUn4rJeB6
         1rh+Il8W4+hsfrBzCwlCoq4Vt9EpwL7/FTYH/xVeVT3SvWgj04dwldrsEQCCMhx4C1xQ
         dzC+JuC8AJYD2AcbA0pdF1wgMWgvDxprzGwX1NgYI1CtMv/1v13dlm/NGA68vSaaEg9u
         p5IKlgnyKbTWoUFAVMULO0BJxP/mVp9zmhzh+3J2H3zUHbM/kfssK3ACOI81HpVWNWng
         mQytAVLNL2ZuzQGNfRw2E2YOi/D8a1rBamcRHIuTj+ZtZbiuYTxtYEOm8MYcXmEaFCSF
         9RXg==
X-Gm-Message-State: AOJu0YyGLKMD10xLroxMVH2cA64cL8YHl9VdFMO6tYvKPMl+VuMuAzM9
	W39RapVjowj82WrQYRCqbpuLDDuwrqJBR0HLvQDBrHclihHjhxY4zwej
X-Gm-Gg: AR+sD11uX7aw03qtwPvKvDKs42Lh8nE1dSK1wkikrQcsQa+66IvsEZ4Tt8lNdPZ5hZf
	aPCDcatPgXtfod+hKayK3Z7PCoYWcuwMwVDSST9wjtdwYr29exeemmXuvtnDjtf/Bj85kisehOr
	3rggIPcgGpxripZ2gh0/ME+8hBiioZgndSXQylgHOIS2lkrwWOtl+66GSjB46LR67116u4jNClu
	DI+DJnjPF/7K4tFjBD1NrE4+E74B01CMi7Wr/2aR131ROfBU7Q4GSS2V3BcAOm72vtWiC2jNQCf
	UChFSTGgvoRCKTcfR1HoT9m+15f7Ak1chmtEBCtob8Srnztk54ckQ3jwRxSfq6Xe32NUxb6JUzk
	yIawi7+3DJaEvkJP5d6OuGNDx32E8KbUzY+RnoHhqpdOAhV3DHxT5M4g/HP5+yfBsC0N72NxGiv
	zUc2O2eBfSIZAejq90flaFk5z4egxxDUN3wwlQ0v0wgSD4qTMj07WkpYoL22+NcadmK3B0ad2R2
	n3gWy9D0FA7SYlml/eYN0sw8QrIpFvZ/7B9SmdYxpHNC47/W9ZjwA==
X-Received: by 2002:a17:90a:dfd0:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-3933b77f054mr3053597a91.4.1786677475446;
        Thu, 13 Aug 2026 20:17:55 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-170-159-fibre.sparkbb.co.nz. [222.152.170.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387c6f95sm4911356c88.6.2026.08.13.20.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 20:17:55 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 5783E360445; Fri, 14 Aug 2026 15:17:51 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: schmitzmic@gmail.com,
	Miro Kropacek <miro.kropacek@gmail.com>
Subject: [PATCH 1/5] m68k: Fix atari mouse movement
Date: Fri, 14 Aug 2026 15:17:41 +1200
Message-Id: <20260814031745.17140-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260814031745.17140-1-schmitzmic@gmail.com>
References: <20260814031745.17140-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

From: Miro Kropacek <miro.kropacek@gmail.com>

Kernels are built with -funsigned-char since version 6.2, resulting
in signed mouse position deltas getting misinterpreted as unsigned.

Cast deltas passed in (unsigned) scancode buffer to correctly
interpret sign.

Fixes: 3bc753c06dd02a35 ("kbuild: treat char as always unsigned")
Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/input/mouse/atarimouse.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/input/mouse/atarimouse.c b/drivers/input/mouse/atarimouse.c
index b1219cc4d9a2..351aab69e905 100644
--- a/drivers/input/mouse/atarimouse.c
+++ b/drivers/input/mouse/atarimouse.c
@@ -70,9 +70,12 @@ static void atamouse_interrupt(char *buf)
 	atari_mouse_buttons = buttons;
 #endif
 
-	/* only relative events get here */
-	dx = buf[1];
-	dy = buf[2];
+	/* only relative events get here; the IKBD sends signed 8-bit
+	 * deltas, and the kernel builds with -funsigned-char since 6.2,
+	 * so an explicit signed cast is required
+	 */
+	dx = (s8)buf[1];
+	dy = (s8)buf[2];
 
 	input_report_rel(atamouse_dev, REL_X, dx);
 	input_report_rel(atamouse_dev, REL_Y, dy);
-- 
2.17.1

