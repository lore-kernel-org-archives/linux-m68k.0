Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151D53CDBD3
	for <linux-m68k@vger.kernel.org>; Sun, 16 Aug 2026 07:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786865884; cv=none; b=sqTwFCpns/fWICSGmKibzxVFZEQLnV9BvhYrknCPDZDvmSzDS+6KUTPDrm96MOgE7JnbHzAYLBO4Hf6cf9jUPf5q3peYkWTV+FczAB6kryuF+bjSonGbpH+tuzSipeDIFrx79caAIy1R2Lb5xWakDfIOQY4eKH7UgOFbdjRchJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786865884; c=relaxed/simple;
	bh=6p0KUKOvqhpzwnEMabN6JsRFez3Atv297O+0llpMI7o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Ol3uXsNcAh4PcgWDcZ90yjbA7rmsV3X9Cx+IP2UyS5SeO05uob9Ho7BcFRe318e/owOZj7la9eH0qRfneT8c24ZLET1EtFx8m5cIV2MraZBBWD6+tNJxAn5RBuLKHLSBdokw0GhAToQ5930lvPLXDu7lmZjYjLncnkZU5wtC2cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rfuEf3od; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rfuEf3od"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84874b52eabso3166029b3a.0
        for <linux-m68k@vger.kernel.org>; Sun, 16 Aug 2026 00:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786865882; x=1787470682; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EWLdfVwIK8p9qDUnqOt56ytabxmXxZOehZL3bwR5nVw=;
        b=rfuEf3odTetK68l9mgUv6bC+XYV3Hb9XBzL5DGF/ZzhONhViH4gTA0qP6fFcD6C1EJ
         M6q8QjItxvti07gba2GGP2zbeW6iefsYNFTRcQF7eeh+rH4CTOPGiZ0e0e1+budtPutT
         EJ+gKbxiqYGzrrNJoNk6BXFSrDgoIgFtY9bCtWU1lMzyeym4qgyGEGXyu3URFFcqyajV
         +WGwzxkm3pxJs6XT0E0lXsAcrNVgxS6mfSdO7ee1u2JIWReIQFFPJeNhDf5IVcipv4uC
         fP6McceyEiB2WEUNBOsyUJgBQJpW0RxHqG7dgsm2FMVlOV0bg23U4+aFugmWOG8Pjt/4
         MsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786865882; x=1787470682;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EWLdfVwIK8p9qDUnqOt56ytabxmXxZOehZL3bwR5nVw=;
        b=OMWJDJC1gKrNse+mI1R96Sy5PVICCJVb4stEjRHQTREYCpUyNh+xIpyr3NHi7Jlv4v
         3WHZ3mQWtTdMzLl+3rqOVCnRBoJWQ6JPesYB4nqjErFE1Fk1hZ8WT+aGa6T6ujjl2kTn
         jbQAbU/me8LwgdNXwPYkXQUyrpb3isVjeKc/m+432UoH3B2d6YMF/tn7HwcPigrsMyKf
         pYcRI1fi5ElNP8lT1pVShDgsSNlfeYdX9VfdslEea5j50sX2X5UGDd1NL3qmqbwCbU2d
         b3EZJn4SleDXVDs3hYNoSADZbYrV6l3uRvgNGlwo5U3CovHRwE6VdmE0K/cXwbk500MU
         CM4g==
X-Gm-Message-State: AOJu0YzwGw9ukAtlfMEOVdQjWW10auKV936I1u50ZbnuBxR/EA0mrS8M
	J8hQhV+hopiwS/IjtbJ7pJdakspEN/qCd+pFGeLtGHvDbA+EHuBAYBdN
X-Gm-Gg: AR+sD13Vmp/ThybD17f+yC++CesZuBzhUN6nPAOwXZNrqqTMxbI0RBsU2YeON2zFEu4
	BCRBBDTzWrEhw70yX03ZRjlbZrhbKeT08zJDwCSq1lJ5uy+o6Sukz64nTlhEw1Bf/lPhbGZ2O99
	4LM3AczGa5tWsirUXT5Tao0voXXOjJxZb2MIHNZC9yxw7ORDvJj4wi/FJd4+cro7IDAG9gWgrXA
	RfioMOfZUc7NDorgxRchl/7bHJzVchjLQFFiSDmemt1vfyn1evVhQOH42FePyuZbq4HYaSw+88z
	dn74VxnrTSjNTbp0pEhhv3arZGZi52RkanemMM10SqqEiHxbM/0WSKZYzhnh4DDuc1X2o1+Jk8D
	mgcGy5ateP+LtKttTQi/kVeNSLQ+ZRZmR+9hrtK9HB5jDO5A0Lp+5QKbJuOlz6uuXWrdP3O9jw9
	UZauJyvC80e1OpmMt/9c4y77dFPK6+2IinG9SFBI64BMlak7lLELJCLrz6GacwH+xa64v1Zodra
	gOBtOeyRn4IwOmWwF543u8TmxI5cnz1E20qE8WAX73nz6KznOdfvXMXc/nSjgIm
X-Received: by 2002:a05:6a00:4654:b0:848:4faa:480b with SMTP id d2e1a72fcca58-84fddfce887mr16321511b3a.12.1786865882275;
        Sun, 16 Aug 2026 00:38:02 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-170-159-fibre.sparkbb.co.nz. [222.152.170.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517cfeb3d9sm1749977b3a.11.2026.08.16.00.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 00:38:01 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 3E635360489; Sun, 16 Aug 2026 19:37:57 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: schmitzmic@gmail.com,
	Miro Kropacek <miro.kropacek@gmail.com>,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v2 2/5] fbdev: Give atafb proper parent
Date: Sun, 16 Aug 2026 19:37:49 +1200
Message-Id: <20260816073752.16656-3-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260816073752.16656-1-schmitzmic@gmail.com>
References: <20260816073752.16656-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

From: Miro Kropacek <miro.kropacek@gmail.com>

The atafb fb device registers no parent, causing a missing symlink
(/sys/class/graphics/fb0/device). Xorg fbdevhw driver looks for that
symlink when scanning for devices, so add a parent node for atafb.

Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
Cc: <linux-fbdev@vger.kernel.org>
Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
---
 drivers/video/fbdev/atafb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index b8ed1c537293..3d540803dc2b 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -3101,6 +3101,11 @@ static int __init atafb_probe(struct platform_device *pdev)
 #endif /* ATAFB_EXT */
 
 //	strcpy(fb_info.mode->name, "Atari Builtin ");
+	/* Parent the fb device properly: without this fb0 registers as a
+	 * virtual sysfs device with no /sys/class/graphics/fb0/device link,
+	 * which makes Xorg's fbdevhw reject it ("No devices detected").
+	 */
+	fb_info.device = &pdev->dev;
 	fb_info.fbops = &atafb_ops;
 	// try to set default (detected; requested) var
 	do_fb_set_var(&atafb_predefined[default_par - 1], 1);
-- 
2.17.1

