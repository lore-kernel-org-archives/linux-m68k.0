Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED901CEACB
	for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Mar 2025 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742570063; cv=none; b=SmKqjVr14qFqzJ1QJzL/WFc1J6urZcvQ3XPmD4BnnsDeBVrPxfMF5/Fd3z+6WjDbKY81KFbSSKp3viq4drcq9aMTnAmblemZe83Wqb2XfrieSAsQYAxuVsBAuBR4sMgGKIBS2sUTo73IZy7jvjUzK7YJTbnG3Rz+uB5EzhVsvSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742570063; c=relaxed/simple;
	bh=LYmRH9Cq4K1QOssewGuoOledSXQRtypRIg8gqFLtk9k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wydk7rLuTp0lHwnZN84I1mDqLJcmBw7NkHw6UUfBZNPvjqAhZ34vMj+xQ4y3Nh7I5AObbZsP2irjdf5JWYcm3GQCnOzpf46zAMpmOmAkojHoVgXAl5FseP63ZB7CFSX7QfusSsqr7amhOYDUHFoxGPiGuYC/GSrG6tJuBiTLfcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kM/VbuYR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kM/VbuYR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so16454415e9.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Mar 2025 08:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742570059; x=1743174859; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2hyT5/ovzNQkIlW4tZIGwANWfne1WKXAckGUYStO4A=;
        b=kM/VbuYRdFVkhDZ0T3POtsP5YnmYskPGyhGAO7jFiTMHgPLnczMKm7f4UdrtXV7I/+
         /y39J2wwyAdlUlXZHZMxgEFiryeXobJeKgtNW499mItz1t1SBdc4QF0ZLCt8veM6mwqV
         m3cb6wzWKsLL1uZGGr0uG+sbEHCo+Vdtr4OTsdpLbPnrUw7YqsR8+6FmK6Bh4iTqP0aw
         3m/OtYXHjaehyrxSafVmqnn7vAm2R1PsA1f2dGP/PHrRmCZQ6TptTA3/fMaXTOytzbnh
         dKJU8X6edywWJlrvba47P3TnZJ+/8JHJN1QpNMQQhUucoDqTKepxy/WDVdvmPjIU8mMJ
         quWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570059; x=1743174859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2hyT5/ovzNQkIlW4tZIGwANWfne1WKXAckGUYStO4A=;
        b=Z1Vory7lR7e0ibGb28QF3ZvcOHZL19f2AatHmY7QgGhEcZRv5K83ugnrh4Q3KEV77a
         kwBD5cSmud5i5gQTLoP6sztaW+Cvf5AR+nEEqflFoN9Q9ualyhG6hfStVY6NvHckv98/
         D5eUacNutc699wwx3JQYlstP1iCZkPZ+I+1HHcBvodYba0szCo+LKY9dakC2zRGFMeMO
         SbGSfpYO++/TuizuX+UHRhd4r41Cktmi5mrUwSV14FCKk2ghTgU+UcBCG7hM4oAICguE
         EHR5HLflNdvXUMNKUtFH8C/GPN1NS+XpSWL9n/Oax8md9UJ398ICWYCjjZMQghs7u4Qb
         nDUA==
X-Forwarded-Encrypted: i=1; AJvYcCVjmlL8Qt9Cch8OXaxD/xCnfhvwg6EiaMrTeQyl3qpRSm7vlBfYsUFMR735ruDt1yGn1xsQIODRuHLh@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzUU0Jgm3kH6KOtHc1VlVhkQlpHI+uvuIqxDuQ9VXQuR/xaxlbC
	7dqmo6gahfMRUR7OsO8Xm7NBQEBIlujobZ4qeqAQDAY0NLMutg+w
X-Gm-Gg: ASbGncsVc17UAJpZxsdtb9tcB4A24YQc2Rt1Nzj5CrgkqB0ChfjnHfId+E/nokx/2G+
	F/i9eyiVdQotBUAkqtYxR8jIdQq/uKw+MrxkRhP5B51gySza2luTmYF7nbO1faum8QgT1UXCgbL
	FiLAOKo2uaSunAQ++HuVGVeo+pV0GsWYvKyOI8WtBn7LT8MEd18UB54ngTg//0kDRZrQcGcuppM
	j31PcOFQUFVcLkFC6vqeQ8ey5X9e8SRRyvlOQWSZPx/g7O8ENn0I5I1VB8W9YyY3Zb8N30IA23c
	gWe/uMGUrW0QlTgsXcAcCed585qYfmdg26nSGm36hA0=
X-Google-Smtp-Source: AGHT+IE9GCNJDGcMiMyFx90gLrAaHGK2esZea+Di+Tw8SPg76cVdqeh0akv06jz/IJ+Coh87d+ZkEQ==
X-Received: by 2002:a05:600c:5488:b0:43d:cc9:b09d with SMTP id 5b1f17b1804b1-43d50a2123emr38003705e9.20.1742570058384;
        Fri, 21 Mar 2025 08:14:18 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:91ef:3e94:acab:b42b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fcea6ecsm29700585e9.5.2025.03.21.08.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:14:17 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-ide@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH 0/3] m68k: amiga: CS-Lab Warp ata support (and a small zorro id refactor)
Date: Fri, 21 Mar 2025 16:14:13 +0100
Message-Id: <20250321151416.338756-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 01 is a small refactor of the CS-Lab Zorro ids
Patch 02 is the driver for the CS-Lab Warp pata/CF socket
Patch 03 enables the driver in amiga_defconfig

Paolo Pisati (3):
  include/uapi/linux/zorro_ids.h: add more cslab warp id
  amiga: cslab ata support
  m68k: amiga_defconfig: enable PATA_CSWARP

 arch/m68k/amiga/config.c          |   4 +-
 arch/m68k/configs/amiga_defconfig |   1 +
 drivers/ata/Kconfig               |  12 ++
 drivers/ata/Makefile              |   1 +
 drivers/ata/pata_cswarp.c         | 210 ++++++++++++++++++++++++++++++
 drivers/zorro/zorro.ids           |   5 +
 include/uapi/linux/zorro_ids.h    |  11 +-
 7 files changed, 241 insertions(+), 3 deletions(-)
 create mode 100644 drivers/ata/pata_cswarp.c

-- 
2.34.1

