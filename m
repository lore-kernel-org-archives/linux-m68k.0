Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A729215BB
	for <linux-m68k@vger.kernel.org>; Fri, 22 Mar 2024 01:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711072094; cv=none; b=azlZSUVIWZ8UvX2dp08KC8uEHOOe+gmfaIwjCdhZTWGWm3ap6eZJU3tiocKVBtCmbge5IMDwsrhIAx9UX6jKj/sMgz2t9zfsxSHGk2YdIbacqmQ0QhuXLS0VjNWVgr8G+l/ddDRgOOXzMkKaoVaOUV6T0SpCG2Zn9iL/1q/BONw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711072094; c=relaxed/simple;
	bh=NaysRas5V1kOn9pC9h1X0pKCP5LfHBN8vSevDLRmHl8=;
	h=From:To:Cc:Subject:Date:Message-Id; b=LyLHFC1XSKNXJlY43iBwDdkNYkSyEQJoX/sUd0rV9STSLKe+U/62j2Q5AI/iAzYz156uZAEPDEcOOIdRG+ZF+J+NYty5i2IcbkXpuCJQzEJIzhak898MT0I48r0Ng5jJlS29pLmZ+9Clfu+a/V1DihqfNveI2S84U31IrUR5uH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAdN1fbp; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAdN1fbp"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1e04ac200a6so12209705ad.1
        for <linux-m68k@vger.kernel.org>; Thu, 21 Mar 2024 18:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711072092; x=1711676892; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vucysGyy0u5NnivNm3RzWc5/18jyEcI5AbxWZPy5oZY=;
        b=KAdN1fbplTsV/deefgqKlFeTM2BbDLziXHUw2Kvcp85fyg/iODUh/MxWrzY6/I49FI
         wugyCpvK7SiO0k0+z7YegfcvNgKZ4wIqiQgKRDkEO47UNY2af1/1nLuy52jZgl+PrzGr
         yUuJVXA3qo8ulQukKGmcPmB3v1hBa27rQwYvCJlYRRPFi+VNHMlAeHS83I/nIjA6zpCN
         /3edr1reCXuf/F91DC8NjS3LsbZaBe540usOGQzQo/04pPNh/z1M2vp5EuUdQ4nWc5kL
         Vy5tsCsSNmtAsr4GCIWJi8OSigPfTuPJ/K0tRDcoyzMctK1+qA7RZXYOTSzI1ObUQNXn
         uZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711072092; x=1711676892;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vucysGyy0u5NnivNm3RzWc5/18jyEcI5AbxWZPy5oZY=;
        b=koMufQ88VhiJV+gbfHt6US/foGh8FMRQTpgVIfaNPQzdTaP3HFIqAfZUpeTdPDG7DZ
         6nDXATSh9IMKqFLlC5PdJfwoU7SvuEEUcDhoVaFW/+d/+ayCggHLK8an0ek8MGHb1AHB
         YQxFGLY1WSh6gTng4xav5x7pcbLZUwWNwDoIqy4IstXi+DJ/2TMRpBK2rZK9VMN7+UBO
         VvCBYduo09uaLUgt0dQmK+7YexHncFcvk+ncfXVHn5JHlpjDn9FnmEHLhT4zN5Y8jGlm
         F9ng+GgVelO5ajm9kmtIkajkx0STl5depKjp3fFHAAv9k5r13N5bPDcOkt3ogdoLbYYn
         4c9Q==
X-Gm-Message-State: AOJu0YwYGSFt6aKe+q5nIMaKABWBV8RQh9nxGhWGmtGukOSl/vU3MEPC
	UMBfOGVSsKbj1nlLkcv4j8soTJ1elibrcIGi+1aPqKGjh+0dlzAq3oJt+siW
X-Google-Smtp-Source: AGHT+IFfPCKHwzCzefaGxGsDwkMRFH0QsEW+SrAasr2QQznVDH0av3XILDSJHy7sCtpfMsBPuUNNOg==
X-Received: by 2002:a17:903:1247:b0:1de:f0f0:90ac with SMTP id u7-20020a170903124700b001def0f090acmr980005plh.11.1711072091851;
        Thu, 21 Mar 2024 18:48:11 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id v3-20020a170902b7c300b001dd5f5b1ca4sm541791plz.309.2024.03.21.18.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 18:48:11 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 751F336031A; Fri, 22 Mar 2024 14:48:07 +1300 (NZDT)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: schmitzmic@gmail.com,
	Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH RFC] m68k: skip kernel premption if interrupts were disabled
Date: Fri, 22 Mar 2024 14:48:05 +1300
Message-Id: <20240322014805.30606-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

Comparing m68k with mips, we are missing the tests for
disabled interrupts present in the low level kernel
preemption code for mips.

Adding that test results in no more 'table already freed'
messages when running stress-ng --zombie (on ARAnyM).

Needs testing on qemu / Mac as this test result may be
Atari specific due to the hsync interrupt disable scheme
there.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
Link: https://lore.kernel.org/all/7858a184cda66e0991fd295c711dfed7e4d1248c.1696603287.git.geert@linux-m68k.org/
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>
---
 arch/m68k/kernel/entry.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 9933679ea28b..f2cdea3cbc93 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -249,6 +249,10 @@ ENTRY(ret_from_exception)
 	jpl	1f
 
 	movel	%a0@(TINFO_PREEMPT),%d1
+	jne	1f
+
+					| check if interrupts disabled
+	bfextu	%sp@(PT_OFF_SR){#0,#3},%d1
 	jne	1f
 
 	pea	1f
-- 
2.17.1

