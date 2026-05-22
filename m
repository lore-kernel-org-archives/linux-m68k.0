Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57B7389118
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 21:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484883; cv=none; b=haveIl1C+Q457xEnOTYXDaVHaDor1YA/co5J3TzthNEVp19TP/8/rqDs1Qp+CCad8SzSerBTAJYs+G+u/IDgJoSxBDmOSuROAPjmlcZsOnitDzDhZVKPdYkKLZ09sBUIbp98jNmE6idRiK72BCxTZPSMTX7itF4U9/7W2sCUv5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484883; c=relaxed/simple;
	bh=0FPRuvNNSFiFkawKVCalHb3yLDUTC8vh4qdYQm7Z9t4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nfu9oeIrX1b4bRrIDDep5mEaJ6M69j5P1NMgbz+zAEP+2nb4xu3DKx3tPqYzQNSrkfN8B44GkJRGz2YuvFJeLD0Nafb7FQG47AcufvykY1YWd3LehGX+ULn6GyzwohmXXIsMQgZX0bnb5WgHa2IUcLfjZMBFXBmkC+QohiC/mf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=aorcKtFc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="aorcKtFc"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so43262195e9.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 May 2026 14:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484880; x=1780089680; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00ruy8kpQH+b21j+wCBZYocT5CVhNgJL2HRPgVpHHfE=;
        b=aorcKtFc2TYNk4vCLaAsegBUbEH2nURQxQnCk0vTOHsr/bPsgpaEX77TCJRjvT8YGU
         s4XBA7w1E6f33WaZ7RRptqwk+I1jHpRLteY9sfK6ATwKLZU3KOQZtoGD110bG5eNVsqj
         14Kjcy6njhlxCu75YJXi9meblXtJa75/amcyzwfbD+RN+OLRA1OK3+8bhYxzbmI4VCGw
         7INh2bZvV+b8XFMWi+OzV8Bv1/FKbzHW1sNUN7bKFlH+b+J05k+liFrQAGQvGumQjEYB
         TbXrfY9N4dcGH4PA+/J/l+husd0HWpFaOBLN+M5glLkGVbYqJOHxsqVm52AkhqwwwpmW
         T7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484880; x=1780089680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=00ruy8kpQH+b21j+wCBZYocT5CVhNgJL2HRPgVpHHfE=;
        b=Q+Q9pcjxLd63t7wZP6EFnyFav5ldsL7l4BOam6yxDTt+ceFolTQx+dsnehjZqt3jK5
         F08E+67/LD0gylamMxloV8Cxpx9b1L99DP2XRtG9M6fSUhwD7Fwg4wCKhc/q82bKx+lj
         B+msSMo12SBMlU2qNsK+1yFya1K/OiZqELIogBM6QAVYITy720cPr0xB3g4HQ7RbaOhT
         dz/a1BXUJO5ge9X89vdPKlKT4vlIZgmEL0Q+noCsyZwTcxeApsLMtF1UFao2G/3GbFqI
         VSRzSysjIKQyEVrVR2dAUX1/VBW/HGrQVu7Uuwb4d16TajIWP0UG5nZBnJ/GbmJPV8Bg
         M5uw==
X-Forwarded-Encrypted: i=1; AFNElJ+GsrmR60uvFjAkTxR9IQOVS9jp++VOSBsrp5P4lIqbHGYgLkD111AIVEqlquhxSEGopvp6t5gjGJcz@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz9H9hq5jFtPWNPe+cMtVm8LrdE+GqjegnVvlIx640cLaXknJEA
	jb8BkVwYWuuGoQL9zM+M6GPE9eq4aV9HmZtNZ4vle6BCyzcBbRrsv3eLEY+9N6Ci0DY=
X-Gm-Gg: Acq92OGNeBczX2DH61hDfqzvgRxJVHiz2pOsN0+qQ71jasrE2zNFuNanYIWO/O9s7F9
	sPlx17v/cLw+oq9QNyps4ltp/XCgxjsbJ+t4v1QD+w6wI58l5oKhPobH+I+HP2FTNisGnxHH8NX
	ZJRI/bPav75y1s7a9qX32N5KDz2eXbAZskkoRZ0f8qByY3SqWFdwpGqGUcRKZAMwDaObByYOMB9
	41OFNo/J9Gj+1CJJzuIytgiTAlTmn4QeAf15uTu5LwcbLvFemX6RkBSIp/zZf/BKmbyMRQgmyAW
	5rsOEdGdXe227Y4+Wtv2DH1o9p9oAa7Iku/a9hKs3B2FoiCE32uQb6uvAWjXQxjIUWdDy2JBaoA
	0nvXgZc/307ojW35ImPo6Ow6Tgzb4UGYldZ+eNQ+AX1KMFgnuHQBovV/xxVQ0I6BCLJzLK+hHPN
	UEHYbNONtYJmLcARjuweZ9/Hxgx1ig/ko=
X-Received: by 2002:a05:600c:a402:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-490426b0c92mr54271465e9.16.1779484880243;
        Fri, 22 May 2026 14:21:20 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:19 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:32 +0200
Subject: [PATCH v3 04/11] m68k: defconfig: update stmark2 defconfig
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-4-16be0ad35a67@baylibre.com>
References: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
In-Reply-To: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2

From: Angelo Dureghello <adureghello@baylibre.com>

Update stmark2 defconfig enabling MCF5441X DACs.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/configs/stmark2_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
index b3fb95f73a95..3941113bc60b 100644
--- a/arch/m68k/configs/stmark2_defconfig
+++ b/arch/m68k/configs/stmark2_defconfig
@@ -76,6 +76,8 @@ CONFIG_DMADEVICES=y
 CONFIG_MCF_EDMA=y
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_VHOST_MENU is not set
+CONFIG_IIO=y
+CONFIG_MCF54415_DAC=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y

-- 
2.54.0

