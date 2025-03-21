Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4691DB92C
	for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Mar 2025 15:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742570064; cv=none; b=eD3BswygYTq/kY+u1rGXWJl5Z00I4pNWdRbaz4vBc0Cg97knSVsHY1AkmuCh3LA1E73xsZMJiAS5FJekIyKVQJUFDc24L3CmPeE4S4i2ZGB+2woN+24JupysgUiTHgvLUHV17GRIeKDqDWxTsAI+Sswl1s1PL6G167l9VLmRuOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742570064; c=relaxed/simple;
	bh=PcjryRlrJ0EzTEA0KQuSX5b/a9W1a1f8F2Cggo9W6AM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V+PZpTNNove8UFt3e2/uVcSxxpo+11qI7FDG8LKC1xfBcq37rKgT2Juiq2k2Rb+fOU+QL4buf/J0h8O5nue5+KO9TzTg0cyqAKmN1XSaU0+omTmAedIPwACcuxjgTWKHz4fdqUBS/lKf5CKZhGcDHWJ3kQ6wRRrPhuV1WH53L5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZhS92+Po; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZhS92+Po"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so1292670f8f.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Mar 2025 08:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742570061; x=1743174861; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bw4PtT/lB2aWDcr15yYUQR1jwUEUAys+a1iOBtSSp1Q=;
        b=ZhS92+PoBzCvQNtF+N+gW81YO+Qb+qbL5x6jeNH/op+zsI5eneEEg23bDb5k5ni4hh
         I4bRq/EmAh1p0w40qxS04IhjN6I4PWpVx9IiNtPV1ypFRLb5FQQ8Sj6l8DEatRVPLdWs
         j1CMQS9Y4eD42JpcZ48VHwCdUToNF3fxLc4N5iDHQi2oy5ZXUHrCnWJxdOuG5H2pxJDC
         k5WBX4g/8IKur0EJLRNnaoCd31TvGjMfbjOC/mlstkrfl6x8uC8/eIEiLta/0YS6U/XB
         bXwNek0syOD4sdmt751nzC4kw67bDhclQCD5gkWZ6ncDfrTM6hEPXT9JxaaJUyDLjC+a
         GApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570061; x=1743174861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bw4PtT/lB2aWDcr15yYUQR1jwUEUAys+a1iOBtSSp1Q=;
        b=Ol0j/oUe8ihcVHKY0VfFE4FdiC+4dapzx+HemZK8mzstqXlST7kGCd+hroW4BoAFyo
         KJ0PolmCocssaPK5BAvxLIsK18LX06a3tC4y4kSTAqDUv0iREPYaIhpKi1trTiBxaGKV
         SkyD+c4vBzBvtZqfkB9S4OLi+y1JXCzmg61/IF+bxHMe7gj/WTFDm4LfJl7/zgdmxreb
         as8lfNNA5b2Gw4V7nRderg7D7Gy++UqXnZPpeL0w6nuoCYeMssLlaq2axKY8jCZmuieK
         t96ObCeuKMVbNqV525Vz8OxMOXaDRiraS9nLTUDRGJvHao1dRRmsmVkUVIivH8p1Jx0Z
         3CZA==
X-Forwarded-Encrypted: i=1; AJvYcCUd/IWHY9brqs73dKLW8oGirvBK6Rub6T07QOxlWlsLTVgnUiCQLXM0y+xA6k20ricYDx8yGq4vWHH/@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxXSAOj6Nggw5VXYdGb+evFqTl9jGJOIsOPdd9Fz5v4xlGVt0p/
	WLGBcY+nkNi9XQ1qyb7eEMiJ1+89F5b0FoU1AtGvX4fCPQOW6D4i
X-Gm-Gg: ASbGncuY4ypDcqFbYHarTPc7/YUL0D5f5ayL/3EIKSEWXeoQMPitApGBJmpgBSneMS5
	CYIUrLXsrF05dnjlbjMHW3Arf/gFEQTQj/bM8WCnRM9DY5pWdaXtXgdN32UR9ArKYuvSTufL0el
	mgl7rUbF4SC7Ur02CrOLF/8OSon8qRY1RAHUj57ArGJs3iMReESa3Gt6TWglMGnEwxOEKcu3/Fx
	GyvRz9zPCf5hRoa3chkZvNveT0XFhV7wSu+KBz3/LjYoSqrT2H6bIpkyZy6YQ7C3xNhTyimCC54
	Wm48KqW2U2XsGAYZB1gEVPeBZsVnuyN5XO4vSjtnmbU=
X-Google-Smtp-Source: AGHT+IFb+0/dKo1TFb+Bbop6PqLIYlIpYGZM0/yO4W/9OX7j50q+loM7JMu4FwIcxCMdHv+UYNsMRA==
X-Received: by 2002:a05:6000:1ac8:b0:390:e853:85bd with SMTP id ffacd0b85a97d-3997f9371f1mr4613702f8f.48.1742570060076;
        Fri, 21 Mar 2025 08:14:20 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:91ef:3e94:acab:b42b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f32fcdsm82352145e9.7.2025.03.21.08.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:14:19 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-ide@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH 1/3] include/uapi/linux/zorro_ids.h: add more cslab warp id
Date: Fri, 21 Mar 2025 16:14:14 +0100
Message-Id: <20250321151416.338756-2-p.pisati@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250321151416.338756-1-p.pisati@gmail.com>
References: <20250321151416.338756-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 arch/m68k/amiga/config.c       | 4 ++--
 include/uapi/linux/zorro_ids.h | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/amiga/config.c b/arch/m68k/amiga/config.c
index 0147130dc34e..a76bc9daf38a 100644
--- a/arch/m68k/amiga/config.c
+++ b/arch/m68k/amiga/config.c
@@ -182,8 +182,8 @@ int __init amiga_parse_bootinfo(const struct bi_record *record)
 			dev->boardsize = be32_to_cpu(cd->cd_BoardSize);
 
 			/* CS-LAB Warp 1260 workaround */
-			if (be16_to_cpu(dev->rom.er_Manufacturer) == ZORRO_MANUF(ZORRO_PROD_CSLAB_WARP_1260) &&
-			    dev->rom.er_Product == ZORRO_PROD(ZORRO_PROD_CSLAB_WARP_1260)) {
+			if (be16_to_cpu(dev->rom.er_Manufacturer) == ZORRO_MANUF(ZORRO_PROD_CSLAB_WARP_CTRL) &&
+			    dev->rom.er_Product == ZORRO_PROD(ZORRO_PROD_CSLAB_WARP_CTRL)) {
 
 				/* turn off all interrupts */
 				pr_info("Warp 1260 card detected: applying interrupt storm workaround\n");
diff --git a/include/uapi/linux/zorro_ids.h b/include/uapi/linux/zorro_ids.h
index 393f2ee9c042..0be1fb0c3915 100644
--- a/include/uapi/linux/zorro_ids.h
+++ b/include/uapi/linux/zorro_ids.h
@@ -450,7 +450,10 @@
 #define  ZORRO_PROD_VMC_HYPERCOM_4				ZORRO_ID(VMC, 0x02, 0)
 
 #define ZORRO_MANUF_CSLAB					0x1400
-#define  ZORRO_PROD_CSLAB_WARP_1260				ZORRO_ID(CSLAB, 0x65, 0)
+#define ZORRO_PROD_CSLAB_WARP_DDR3				ZORRO_ID(CSLAB, 0x3c, 0)
+#define ZORRO_PROD_CSLAB_WARP_VRAM				ZORRO_ID(CSLAB, 0x64, 0)
+#define ZORRO_PROD_CSLAB_WARP_CTRL				ZORRO_ID(CSLAB, 0x65, 0)
+#define ZORRO_PROD_CSLAB_WARP_XROM				ZORRO_ID(CSLAB, 0x66, 1)
 
 #define ZORRO_MANUF_INFORMATION					0x157C
 #define  ZORRO_PROD_INFORMATION_ISDN_ENGINE_I			ZORRO_ID(INFORMATION, 0x64, 0)
-- 
2.34.1

