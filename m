Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431652576
	for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Jul 2025 03:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753155351; cv=none; b=N+osnKDh+0MF3sveWz37ETmrRgwcKtGXN22Wq2VFkuUDCLJyV9NCqJEX3wjqPSX0neo9lvSrmhD9h74JW96lFNgNRY2LG5OWwShFHVoXeNHrQwALbq71rI12nrUboC0Um+yU3CQfMpdL3iObBMUYzScWCZHd56gFMsMTQFOdPKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753155351; c=relaxed/simple;
	bh=9XEHvf4vG1D4yyvbE6MLh31skmRGLDLGj0AHdpDV6CQ=;
	h=Date:From:To:Cc:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oJuaWkATWuEmS6OoCKnw0l91F+/qDOLXtz47V8OAFTMQQ1BSZR3Wwr2ydqvejN/E8mEq8P+AwqFTlwXqOiZB/38Cb2gn+aoeuguuu6KZ/M7OqzSyN94pzf7Dz8kwCO1r98w7murIvDR3IPhSm4nrEvqJa5F4valsluQjKsHoqXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5OF/VPd; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5OF/VPd"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7426c44e014so4640336b3a.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Jul 2025 20:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753155349; x=1753760149; darn=lists.linux-m68k.org;
        h=content-disposition:mime-version:message-id:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F2LbdLcacR9W8sqqUGkM7qsaJ4maKUnitzkAiJJt3Aw=;
        b=A5OF/VPddXkc7D3ZwI55anZiY3fcz1XMCr6kzglQxTxs+KC6Mmv/SUjRjaNmdR7B+c
         +avIGSg5MCGg1NhnR4eX9JfCormR29grq67seW39oMsq5KQIRUjDUeiUI59ig0lyjQzr
         eOGoosXNQpNzVaYUvC+gaw0VFaeHbMqPDrINs7GIPoca/V11zoDhi1RZ2c8XVSGyjgW1
         hyAWM7LSHQrB9nCFJul7yQgL6z2ufME/cLDXc9clKZZ20bk2neX/2rcd4cjf2OY69Qao
         1yakjVlSJO6beUOD8vP7M1PfHcK9o3L+SRNZGSu0XMn7FORzaXDTQwE+EPAY8Sy7mGvV
         +XnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753155349; x=1753760149;
        h=content-disposition:mime-version:message-id:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F2LbdLcacR9W8sqqUGkM7qsaJ4maKUnitzkAiJJt3Aw=;
        b=MfssgvtloS5uJN7ra/QGMZnBK6hYQDp47tVB0pMMarM7ypW2YFGEzA3VS808v/flS/
         RJhM30rFgMvbDSLdbeY5WUESbU9VnulBwxn5NiWZs3UzJhfV9r2R0nhEh6GQSdwSO+Rm
         VWV3MQGvOTRFs03nf3o3+gYAdj7mdpvRXcugt2cdxnQT47CI3uGrlmZwy/hsw87kbvEX
         y5S1hkdD/kRDxERoJV0/Zr3zF+tz4MrhVSRbeQJxBXtk+QYvoxQ1JQn+qbGWNCsIaqi+
         M/vLMhR/RFa/Gzn1tvJF6AioNQLjKDoGGunAjq2q1ketaWTdi1rQkyaZJq0bSzu3VeAp
         xA6g==
X-Gm-Message-State: AOJu0Ywmco1LXXjoJi+FKZq+qz4rnwp+u9iKU0UpCWDz5UXEL/3H0mFJ
	v8Wb3s1Zana+8jUzPCKj6LW/Rynm89pJl3HAIoNjH5VD7TepqmMH1UZT
X-Gm-Gg: ASbGncsyJlERZveccM4JplsrsT8NEb4k1p5Na8+KPmA1ElRM5AJ6Q/ls2MCkymBBiX/
	/rfvW6vdrhupo7vKaD3kfL9yQnLHwtc1s6NuWqArxKRP7AFvZ6Sq0Y3WSkByLNA45k3728lOZ/d
	HV21vX+SKxtvZgKk/JUoOiROST3S9XeJxrdIXr6b+DgFLPeOha8w1u6zlst93LloANBo+F3EgHq
	wQROLwq0iBBY1q3X3UsoGeu03c9xHkrUMmvVGIHedkRKvtu3qxv7XA99RnSZsn1HQmDfd8lCLV8
	OIRwab+5Z2BsoB46MD+SfHZbiXyO7+4BrA3EJiXZbCpFxTwVXv6cNxSyHw2WswGxYa6ZoPIyc1j
	/tnZqbm8grCm9rDM1suUQElBRvrvGzZU=
X-Google-Smtp-Source: AGHT+IHv2JveUKY4jPAPdg0y0FEpCFWmS72cA64bGwD9nQdsd9BsKzCXCJ4dAYh7/e8A0baYOoHK7A==
X-Received: by 2002:a05:6a21:6da8:b0:239:c7c:8de8 with SMTP id adf61e73a8af0-2390c7cf703mr28643449637.12.1753155349537;
        Mon, 21 Jul 2025 20:35:49 -0700 (PDT)
Received: from brak3rDesk ([115.96.77.246])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2ff61ff2sm5028368a12.35.2025.07.21.20.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:35:49 -0700 (PDT)
Date: Tue, 22 Jul 2025 09:05:45 +0530
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Message-ID: <aH8HEQoqGhSN9AJ9@brak3rDesk>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

linux-kernel-mentees@lists.linux.dev 
Bcc: 
Subject: [PATCH] drivers:zorro:zorro-sysfs.c Replace sprintf() with
 sysfs_emit()
Reply-To: 

replace sprintf() with sysfs_emit() in sysfs
*_show() functions in zorro-sysfs.c to follow the kernel's guidelines
from Documentation/filesystems/sysfs.rst.

This improves consistency, safety, and makes the code easier to
maintain and update in the future.

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 drivers/zorro/zorro-sysfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/zorro/zorro-sysfs.c b/drivers/zorro/zorro-sysfs.c
index 10aedcd21363..a552724b7fc7 100644
--- a/drivers/zorro/zorro-sysfs.c
+++ b/drivers/zorro/zorro-sysfs.c
@@ -29,7 +29,7 @@ static ssize_t name##_show(struct device *dev,				\
 	struct zorro_dev *z;						\
 									\
 	z = to_zorro_dev(dev);						\
-	return sprintf(buf, format_string, z->field);			\
+	return sysfs_emit(buf, format_string, z->field);			\
 }									\
 static DEVICE_ATTR_RO(name);
 
@@ -44,7 +44,7 @@ static ssize_t serial_show(struct device *dev, struct device_attribute *attr,
 	struct zorro_dev *z;
 
 	z = to_zorro_dev(dev);
-	return sprintf(buf, "0x%08x\n", be32_to_cpu(z->rom.er_SerialNumber));
+	return sysfs_emit(buf, "0x%08x\n", be32_to_cpu(z->rom.er_SerialNumber));
 }
 static DEVICE_ATTR_RO(serial);
 
@@ -53,7 +53,7 @@ static ssize_t resource_show(struct device *dev, struct device_attribute *attr,
 {
 	struct zorro_dev *z = to_zorro_dev(dev);
 
-	return sprintf(buf, "0x%08lx 0x%08lx 0x%08lx\n",
+	return sysfs_emit(buf, "0x%08lx 0x%08lx 0x%08lx\n",
 		       (unsigned long)zorro_resource_start(z),
 		       (unsigned long)zorro_resource_end(z),
 		       zorro_resource_flags(z));
@@ -65,7 +65,7 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
 {
 	struct zorro_dev *z = to_zorro_dev(dev);
 
-	return sprintf(buf, ZORRO_DEVICE_MODALIAS_FMT "\n", z->id);
+	return sysfs_emit(buf, ZORRO_DEVICE_MODALIAS_FMT "\n", z->id);
 }
 static DEVICE_ATTR_RO(modalias);
 
-- 
2.43.0

