Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB4728A73F
	for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Jul 2025 03:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753155553; cv=none; b=EnQE/azBcZCSfURChUfcyuVOUP/XDQ0nnfwzGxINYjSRRiIj1j1zNHfu7pFL4yl6sI7JFREvG/9wkmnWyAYKSqCNeAf5eTgIj/8WF0TcbvPYNWimqlHrlaR+gou+9MsoEMCzoaDaxwRFwwbuA1j1TqV2YzFA96Tqfi1jQQgct88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753155553; c=relaxed/simple;
	bh=a8ZDCKvk1z9V4mWSqgga4htHIEnZXgftQcODAhyHbhI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S0HDHAhOV/G1J73NrmpWTI75YHkRqLe0NFQJ9YXej6WZloA6FWuBF+jP/j4U9ujwWkz249mD1IjkpI3DTckTjyjCsmFCaExm95yEs/mFpawQSlU70UWKh007S13jsqOjEy6LHqjID8eC3Ci6CLYhiEPsfqZLULwTch9lhyq/KK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TY05xoLQ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TY05xoLQ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23dea2e01e4so58438025ad.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Jul 2025 20:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753155551; x=1753760351; darn=lists.linux-m68k.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2HxvgsGdyX3E0xq2IbH1R0rlYmLQG970WtCL2FPZRg4=;
        b=TY05xoLQ8HzLdrl5TP2Hq9bITQ+cq2Fhc3Q3nP1o6FPfC1yJnW+Vk6uYs7ut7aWg+V
         Sfymbaq2PqfEJYuewng6CtzyfS7RV7XjV7S2oXGorzPxcsT7uwgSozlhp1RcTCw7cZ1H
         QtTjij76Pvf7IuGNU65W/CO1pODWQg4kVZS7Kbq6H0kX3r6UfWFmjhxOeFXGb5/SObrG
         4S6+q4/BpDTLbh604VkLX5Zhyn3te9JyYp+ZXnQQWyTnSLQktVgS7hC1CoMmYxa44Px0
         gl1nSzBf30y4ZmJOsj0d8ZjZ25INxVUqo5kLz5OTQl5hgW7mj1a0yT4ej3KSYQRavr9j
         g3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753155551; x=1753760351;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2HxvgsGdyX3E0xq2IbH1R0rlYmLQG970WtCL2FPZRg4=;
        b=E3x3gZVzsH11SvUsQyEjP+F5Iz57piaqGBSfevnET30raG9uaUyH66KFlJ0Ha6r+9h
         ftwwdPvhTmSNfQ3sRJvS8W5A+UVsNmbxTDW6frf6OFV4MGXYe6WR3k1WYo2tptX2C74R
         pamZBbNtLekCYGhBJqCXL/JuxnWu+uGjyU2ryXIk67Tam3zP/q8Z5xn5dFGWs5WvncSJ
         hRcNKQIu3l+7yewUW/U9ZvXrevHKjwq37pOpGU8k6eOCWdCHGGuLutx6k9K8T7gKflbA
         2Cy2YXfZV+JMhn+XeCvL5UUqhePOx/474csccNXl+5IonESgdlauZhvws9NCxCe+ql6g
         v6FQ==
X-Gm-Message-State: AOJu0YyLW4HCTnaeJNAClFpcxWnlXMMlSMQItHEqWryXeoty6pShXv/t
	UvyXK043k9AeP5S2ZGlY/17J8l5NZpf7fw8thodwsZ5OSJaTRRS1i7pr
X-Gm-Gg: ASbGnct+q3ObWewbQtvwJjHrYyk4Yn2K41o12aRHDz2odOwvhhYHX4uBOr8/kKYvcIE
	UxQnxhPsUPb2IXYXwbvux+8U7Z02XZaGw6+0fu4e7ceQdlekOwgsc1RFeHYbexHeW/JRMmR3Pai
	o4ddp8rBOoCl4CDHzzgvWMlfZiETjQY5p3vY4tyUzOaixLMOSq7kvXsE4n839xXIJups8uvlSMx
	16mAdeaY8lcm+SpACei6RXLnuID1cFI8uaAaWziQdPyDLZgfixE1a/z/ZmUOF3InAXIc+Emh+po
	NLQe2dk8xWqq0LKYcZctRmbV6Y6cH5K1MGeetFwSs0mImON5c5kharGrjQPGmACiQ3ulHuC0A5Y
	TjukabDgocFPmczT+pUxIqJgwrE2AEcM=
X-Google-Smtp-Source: AGHT+IELXenhGbrXs3GHqpCXNMZRZtfRAufEp0joWU/yATfc1Fkd0qA6Op2/PITBrKGg0UU01VXk1w==
X-Received: by 2002:a17:903:faf:b0:235:799:eca5 with SMTP id d9443c01a7336-23e2576e67cmr337988305ad.44.1753155551546;
        Mon, 21 Jul 2025 20:39:11 -0700 (PDT)
Received: from brak3rDesk ([115.96.77.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6f309fsm65886665ad.223.2025.07.21.20.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:39:11 -0700 (PDT)
Date: Tue, 22 Jul 2025 09:09:08 +0530
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] drivers:zorro:zorro-sysfs.c Replace sprintf() with
 sysfs_emit()
Message-ID: <aH8H3D0WRrqqZYc4@brak3rDesk>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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

