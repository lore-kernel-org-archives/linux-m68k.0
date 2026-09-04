Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1CE472F82
	for <linux-m68k@lists.linux-m68k.org>; Fri,  4 Sep 2026 11:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521024; cv=none; b=sCDw1CHm2/bf280dKw6xpCxokST2h++5EaKwBM+F+sssl9C9QSD/UPH/K2WGRtAs+SK9pD6I/GLPnRm2fZsmA3I3TrOCtZ0Ux0RC3PZhpFCil3PBvoHjUB/IU+U/a6s33HgX5ki+6h163cZJsKFu1Gf7atKFBZPEor9B5iyJOiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521024; c=relaxed/simple;
	bh=StVBaecbw/qexkMHKMpQQDVlI7NiRrCveI6gIEwSx8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d7GPsUxGAovqsjzo2/qeJUbvCXON0I5A8JuEmPaL8BW+Xm3dlWd3TcQxFoN2b+bRwPwu+7pDD0srbM3zvBZlOaUjZtctoEfCzhuAfrMroulIlRfrAziRAo3PSfiNOAOZj2nBCnpJ/x94JwnE5mn3FStysgr72J0W0diym4GQ2WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sktXe/hK; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sktXe/hK"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b7b4b08d78so262032eaf.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 04 Sep 2026 04:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521022; x=1789125822; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XsCUz8jN6OIGBgaXNx4RZxVRR29356V3qQ7t6ouu5Tw=;
        b=sktXe/hK87izkGvHW9BZ8FpsY08tDPvGt/4+agFj5LEGOA0ECu0ZcJOmLUcSl9+hJ/
         Ex8YQTlOOEoFWQvA9DO5rY9m16OSIHmtVV99NTHDMggInE2tnrsnlbE7HUdg3gHxaOE2
         Dkp9Otc0yGBwQPJSl66htHssxR8LUwjvoqQg4iIj+E2x07mWwS5aFBNzAwtJnyskoniV
         G4vzPmS9qCc0G1V+PIBzV16sAh6Z5D4wIrU0cNFXzaQ1RaSpAR0zvM3B7Sj9TzALEEVZ
         JOHoWLYFbP7B7Xneg4iCiF0h10s40LF7wyAY8jEQJisNVT+mGhk6qreQaEgqzNrnfJ6R
         +/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521022; x=1789125822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsCUz8jN6OIGBgaXNx4RZxVRR29356V3qQ7t6ouu5Tw=;
        b=mOnwEZHGtj3dNMqCzlEyV+C70rLJbD31zLDI9YQZu2s4ukpicW8guNQr/o56HKQ7CD
         Ht6KY5QuhewM3wIid3v97aW2mZFRem/d3WY1jmrkYq9QwuhCpkrwCQWNiwWr77waEWBT
         H0Jto49WHY2FJBI0CUK9ND6qR5TIWTC+Elt3fyLZ0Y5bAc3bfR8/kH7w4RhZLSjMB4AB
         Pl39encBYN8HX3VowL2EWPzDO4qlyCZR6cg8E5IZCtQ69LtVA+A9BelvfnopWkAZGQNl
         mErM55NtMRGemYGwvHqqy2AKG6rcUF5R+2CRkKEPOY0ROVTVZ4yS3XZx+4O6bNOaoAWv
         n2dg==
X-Forwarded-Encrypted: i=1; AKwUvBxy1MEpllK9BH3Mo4KzEEokrTloyWdP9VRinPhQ8UVCu8/Yj9RJHgLfm68ykhGqURwKxwBV5GcJaA8V@lists.linux-m68k.org
X-Gm-Message-State: AFuF++nfXInS/l/y76S2q0UlfQJNMxLZVPf242cMalJxGUwx4glITEeZ
	oJSttIXSXolZ7o4rH8jmv4BKZgTFxMSzDI1QAZiDx7I0Qs9wOF5s2Qg6
X-Gm-Gg: AYBFou3yhH+IELEj6tRoF5kr2WWl5mYeNx2eA/sxxjbP+ZBqCSYm2jb9xLfcE6Tvet2
	RaA4WIGdC6LxYIMeiyLNPQesDXUkNSjWMuXLnKnqXu3gWdcZ2LYos23iw6CjhwNeBOBd612cHUD
	fACvqwKh12qeWYwGRJtxcJaNqGgmuY6qNY+L9veUL3gfGv/7CmGur8ctrN56tHS7GywByuVXBtq
	OWczShxE1lfPhOv3sf+d3cyTeLAeCoGQ7RWkbIuSPLz/FKkiFqGSBwb6CfG4vQrASiiDkgKhM8H
	0lRZJWcd24RitMvIlBUERzUyeFW0BIWtknDYFDcwnuIqwDSR46q5f+8FrExw//QEwwcwyZRT0L+
	ZpoMbAgrHwM+toN9KvQM82BVq9bUWBtFIy/ddv85/g76lZNZdfmjEVx+qiMIQKCVkQBNoBKQkbL
	MGGjwD1jqOZ61M0w+AiGJ1rQa1aUYbcJIDkpkC+F+jljYbFBEgt+kXUKOOHp7WLmxWG3wbKox9R
	AiMJ1r8SQkevYE=
X-Received: by 2002:a05:6820:60e:b0:6b6:2de0:8616 with SMTP id 006d021491bc7-6b6fbcd0a77mr3870489eaf.20.1788521021600;
        Fri, 04 Sep 2026 04:23:41 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm5457281eec.6.2026.09.04.04.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:23:41 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH] m68k: coldfire: fix typo "reseting" in comment
Date: Fri,  4 Sep 2026 16:53:35 +0530
Message-ID: <20260904112336.38497-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "reseting" to "resetting", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/m68k/coldfire/reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/coldfire/reset.c b/arch/m68k/coldfire/reset.c
index 6e5f8ab39f32..9507d7810d98 100644
--- a/arch/m68k/coldfire/reset.c
+++ b/arch/m68k/coldfire/reset.c
@@ -16,7 +16,7 @@
 #include <asm/mcfsim.h>
 
 /*
- *	There are 2 common methods amongst the ColdFure parts for reseting
+ *	There are 2 common methods amongst the ColdFure parts for resetting
  *	the CPU. But there are couple of exceptions, the 5272 and the 547x
  *	have something completely special to them, and we let their specific
  *	subarch code handle them.
-- 
2.48.1

