Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A0B38D6B1
	for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Apr 2026 17:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775496394; cv=none; b=DaSCjgrmeFOlD1HEr7kUbzZ6JQy75XcZw6bZzoVxpI8+mPwH5Dn9fIg9MwaEvpzGhrPzPNYC5cJdhFQOKzdJ3lnamutJ1WStj9Ngv3alg2GeFWNBMuo3tIJmdlNqPKgrpakL9M51uBE0vJt3et4gAoknOHyAQb3ZARRuH8PAGAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775496394; c=relaxed/simple;
	bh=mgjDDgeH0x4EVuhQimea+DX6s2DvVAfFB2qapG7gPds=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NPz3Z0NWj0LwZkMhrZ6uwzzI+B2q94JsOOsXuIqAaFDvrbUpKRQCqvhGQ3ML9hwUEEwXLGB6tSsT7zz0Iem248KxmSdLciJ+C5AFO0OfVmXmJzEeDyoTNkuXe9hmq2X05v2Zuo0Go2H1lLCxQjC+zwYSXaIviOze1oZ805+/w94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMeBO8HA; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMeBO8HA"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48374014a77so55602885e9.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 06 Apr 2026 10:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775496391; x=1776101191; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Skuus9RganfOPMgEetpN1SoBWyQoPxIpdph5xO1FpyI=;
        b=RMeBO8HA8ffIJwQPOqpJrtgsHQA3z8nErDWYHxsOlzeMyeLeJYswVI/v/s7AoC/o0V
         /tK314ffOVbO3I73TzywgS2B/YepvnyXohC28CGoJPXcZKJqhhkUFM1oRwimLJqvlnbc
         /dbkwYPm3zWAXZ2HV/1jBga71z0qN8+ippHepl6Nmg2DEmp5AETBFBKiPehwKDsbAzUq
         pJ3tixK0rE0bRNws5iRzGzuWa80gemcWCxith5Lp40F/1jcidAditcGTtUTT65OzNPQw
         5Rqlwsv8QNgwZFXF3F9GIH3k0SGSF5g77p4UFJtOwnEOfBxBaCOoVecLcGopmsEg02xy
         Brzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775496391; x=1776101191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Skuus9RganfOPMgEetpN1SoBWyQoPxIpdph5xO1FpyI=;
        b=LSzSPSkFxQITlxteuxHumHeRtIlFBkN4ua5F4irBpQIKj1lhzsqjwSfujtOM/6Qcl0
         w3uKMhwxicD0poqn0+eI6jKCID30A1Z15L3m0qsMOq3WtRe4vHVa/2IHqNUkKrD52AdW
         X2sp72qyORBalVWt94sOi+ELq2P5juR2ftGf98rjKDRJszb/fZSWGaq7EqzY9nsEo4kv
         p2550hKAefryzckRLjjRk5XSQIm8QY7mhsE3aZdHdok7fTHfB3cqR4fvJBmzGEnt+vDg
         eo6ofGrFymUmhpODM0qPBlDO/Bc8VW8tnd6boTcbP6HfyOV0C53pbEXwTzXayxXn1aMl
         X3aw==
X-Gm-Message-State: AOJu0YxsJPD5Irf2GeCDf5kec0vPW0I6D331BCzEl4JtumGLSjchfuD1
	+Z5JKqpUy54la0opoXuX7DGsan62tpWDuKRjvOXHRHhsbSrB8NbwQV7f
X-Gm-Gg: AeBDieuOc+qorpS4C2g0BopVsnA9hP/KfkVBYT9yT1zlx/tBngK8wtghHiyJFYvnQbQ
	bdkR7gNqnQG6X2cv6fFiBC8VcIJ3mbjBBE4NYcWvhLRYyBQtzIBqRd4kpUSOCau2dozMGbPbkaz
	kZdsHi8YpEtbJo1U4/beMnKw2uB//Nrb0OGDI7QiglZRCmHd3CgwyYVeSVtb2/anltUgp1u80rA
	fkBQWb9F90S8FoRO3YOt23qBe5UrhgVNRvfs1EJViQz4B2a9Wd8tnGsW+TJC/lFVE7XIUxUjY2x
	YlUEhAZOTDJSZgdkN79GGF2Zd1qnOjIKOOjaTqpq7btpZOQTo190wkHW7/6ULe77SlkSII5YO/y
	N7idZtk+RUddYcxXjJOlhHvUFzxx86SSOiLRXh9vFWxoD3JfTpyEpw5cKII56o6kRvEDBSUH3Dq
	QhWvcXl+FFGQWDOWk4bNkeYgqNB1Ytqumt9uHSw4+9s/xlXAihQrrRFIt6JXv2XvWsgBNHbJL+C
	25paRFX
X-Received: by 2002:a05:600c:8b46:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-4889978e1f8mr204119905e9.18.1775496390590;
        Mon, 06 Apr 2026 10:26:30 -0700 (PDT)
Received: from localhost.localdomain (046125137238.public.t-mobile.at. [46.125.137.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm204931415e9.10.2026.04.06.10.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 10:26:29 -0700 (PDT)
From: Stefan Pedratscher <pedratscher.stefan@gmail.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Stefan Pedratscher <pedratscher.stefan@gmail.com>
Subject: [PATCH] zorro: sysfs: replace sprintf with sysfs_emit
Date: Mon,  6 Apr 2026 19:25:12 +0200
Message-Id: <20260406172512.6693-1-pedratscher.stefan@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert sysfs show functions from sprintf to sysfs_emit as recommended
by Documentation/filesystems/sysfs.rst. This ensures proper buffer
handling and avoids potential buffer overflows.

Signed-off-by: Stefan Pedratscher <pedratscher.stefan@gmail.com>
---
 drivers/zorro/zorro-sysfs.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/zorro/zorro-sysfs.c b/drivers/zorro/zorro-sysfs.c
index 4e967754d8ad..f9a9bcb59e62 100644
--- a/drivers/zorro/zorro-sysfs.c
+++ b/drivers/zorro/zorro-sysfs.c
@@ -15,6 +15,7 @@
 #include <linux/zorro.h>
 #include <linux/stat.h>
 #include <linux/string.h>
+#include <linux/sysfs.h>
 
 #include <asm/byteorder.h>
 
@@ -29,7 +30,7 @@ static ssize_t name##_show(struct device *dev,				\
 	struct zorro_dev *z;						\
 									\
 	z = to_zorro_dev(dev);						\
-	return sprintf(buf, format_string, z->field);			\
+	return sysfs_emit(buf, format_string, z->field);		\
 }									\
 static DEVICE_ATTR_RO(name);
 
@@ -44,7 +45,7 @@ static ssize_t serial_show(struct device *dev, struct device_attribute *attr,
 	struct zorro_dev *z;
 
 	z = to_zorro_dev(dev);
-	return sprintf(buf, "0x%08x\n", be32_to_cpu(z->rom.er_SerialNumber));
+	return sysfs_emit(buf, "0x%08x\n", be32_to_cpu(z->rom.er_SerialNumber));
 }
 static DEVICE_ATTR_RO(serial);
 
@@ -53,10 +54,10 @@ static ssize_t resource_show(struct device *dev, struct device_attribute *attr,
 {
 	struct zorro_dev *z = to_zorro_dev(dev);
 
-	return sprintf(buf, "0x%08lx 0x%08lx 0x%08lx\n",
-		       (unsigned long)zorro_resource_start(z),
-		       (unsigned long)zorro_resource_end(z),
-		       zorro_resource_flags(z));
+	return sysfs_emit(buf, "0x%08lx 0x%08lx 0x%08lx\n",
+			(unsigned long)zorro_resource_start(z),
+			(unsigned long)zorro_resource_end(z),
+			zorro_resource_flags(z));
 }
 static DEVICE_ATTR_RO(resource);
 
@@ -65,7 +66,7 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
 {
 	struct zorro_dev *z = to_zorro_dev(dev);
 
-	return sprintf(buf, ZORRO_DEVICE_MODALIAS_FMT "\n", z->id);
+	return sysfs_emit(buf, ZORRO_DEVICE_MODALIAS_FMT "\n", z->id);
 }
 static DEVICE_ATTR_RO(modalias);
 
-- 
2.25.1

