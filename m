Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF18D3A16B9
	for <linux-m68k@vger.kernel.org>; Wed, 19 Aug 2026 22:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787178535; cv=none; b=tOPoECmXyQdpuOaokRm9ExhY//1IA/wdvj+U3VmzTHS97WJtuRyBvU7dKNBIsGrtAMrOObTByaSFweNG3GFL7GgLRrPycdZ4hOIBI38df/MmEWtGgyt6CyAAhLAZb8sZq8/ZsGFvLZvMCo2pZgkUZU6oGJHEhQo47z2A3m2EjaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787178535; c=relaxed/simple;
	bh=zY+gW1lXxfK7kqtIXgYpm9NhsrQnedavPShq5FhgfcE=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Ve7wvFKSb2BQHA8Fe9e99JURbzhEKriyzgrywkN1NBTzXqBnoW1vDn2uSid49Mx1NPUjT+P6wuqu4sTwfosPfV6dWKxuInA0gvRI/SAORBQmr3LJEaxofdYK+wp/lKd4C1O/LMwnVZ/ggXeLGSJQAITwJBcxfsoL2SPMifOJ21Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NoqZQC7A; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NoqZQC7A"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d530328efbso13742875ad.0
        for <linux-m68k@vger.kernel.org>; Wed, 19 Aug 2026 15:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787178534; x=1787783334; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yyf8P0B/y8zIH+Mmhiq8iXp175Fg2OnIXEWNkWxUosA=;
        b=NoqZQC7AN1VOjGunB+DXvheM2lqStZmscomDxYqCca5uAOn3sQy9GYy70XVGN0WQgv
         g0C5Et8CurQoWg//zBfQIyKl9HHPGiCzUxpgfqR7NdOHFdYJiwdf50AZkS1HezglKxpr
         yoeONI+oZX3ItzLCtf3ccQmECX9JcXT8r033Ud+5bWUQm4iC2+4+oc6uejWQDHqP5Ugs
         Y4Tv4Pt7R8q2GXGOH8fxBc8YNgdvRl8qKF0TALeGvikgniRq08pX6KXrDjRyKw38mJPw
         5P+3vNtwyXaEAZTCFaTQFXPHXEOzOiAPO8ehGJbGT8GtJFlwujbvmOL71Zc/qszBUdGk
         VWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787178534; x=1787783334;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yyf8P0B/y8zIH+Mmhiq8iXp175Fg2OnIXEWNkWxUosA=;
        b=qeItSW26+KQUHa4ZpTzD680cKAx2zznGlLkLyuoPVdeQ6uZnxTo9M1RWX2pt6w4Esv
         ONPLiaJBjYQck94kuMcSM5l03qPUIG+VSxZgA4d2rci3CZ/JJ1GkOEZRffDmFOFfYFYt
         ax+wfjg9yBR56Zs4tifq6mPrdiLIN/lJvnFvWXxn33iO+uA3N53V83bAf0bLmIHkc4PB
         NQoXtW0w0XxC/5/h3vEVb4Yw+77ZC2T8lVL26oRsowCvJBCs/tBPsMxpLBiMFunPMyRI
         AG2Z68hfvGuybypF4C/7M9bUwbhwONm7OYUxiwa+5+XYzK8br3JIWaAwp1JHhOCw5kAV
         uqUw==
X-Gm-Message-State: AFuF++nRa6wnmeYoWZRz5Yd8pBcjnFr90gPqa82M+eh15Rv9hrsIxgDl
	B/KBXHMaibF8+A12SMCBdvhCk6fhPVAO13MZ0K0ANxYp15KJVIX68a+qLGMqJQ==
X-Gm-Gg: AR+sD12lUvvwxlO7XBe+ASp840Jjb0rGpUs6zC/pRpiMzTo8BCliagBl0EtdTf76g69
	e4ZsjTccJGQUJp2VxyIaQmSwFdoxEKIPEaLzzwx3v2rZo5AdMGjgBt66VWecdTYLq/SywdKYzb4
	/tlwZfS4U+qr1tlUtYWN3sFaVX0ZmGyxOFm7n5Lslbxfy+qU0XcwPOf9qzEKs+s0nFDTOvgd88+
	I3I7idyMr1QbrjTX4pM46lUA5vmyTTIseAJXl4aPy3IAYkBZi6kkYhuuwF8TIdWG/0F+pEvZnu/
	lcTe0OqE4CXQ9O1ZrGVAnAu6c/B2r43QioRnEEELNT/f62hEHHGJnWuMmheyovuJZ4M3LzQEAZc
	F3ts4rALZswP9eVyoYxPovEzW6K9flXDm5qy1gDSJQHK3PzEmPG+AiqO2hgAcf5GV0Lc7izKWwI
	pVzgmHybUROw4eQFOoVzxw7SkExDWHGG+9fHuBK366r1eYxfZEd4WQ8KN+sdaljW4gnCWKFC8JQ
	hdiGBiZTHic8t7APj9pjZPmM2sSJuDSVUORDzRXxPUpXlNUVA==
X-Received: by 2002:a17:90b:5624:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-39580a7c3dbmr15590880a91.6.1787178533810;
        Wed, 19 Aug 2026 15:28:53 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (122-59-250-182-adsl.sparkbb.co.nz. [122.59.250.182])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad564bcsm10629116c88.5.2026.08.19.15.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 15:28:53 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 810D436035C; Thu, 20 Aug 2026 10:28:48 +1200 (NZST)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org,
	geert@linux-m68k.org
Cc: schmitzmic@gmail.com,
	Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v3 0/5] m68k SuperVidel patches
Date: Thu, 20 Aug 2026 10:28:33 +1200
Message-Id: <20260819222838.21256-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

Version 3 of Miro Kropacek's patches for Atari SuperVidel.

Patch 1 is a bugfix for the Atari mouse input device driver
(miscompiled since v6.2 with use of -funsigned_char). Geert's
suggestion to change the mouse interrupt function signature
adopted (generates equivalent code as seen by inspection and
testing on my 030 Falcon).

Patches 2-4 are fbdev hardware support patches for the SuperVidel
blitter hardware. Patch 2 has been replaced by a version addressing
the root cause of the missing parent device (i.e. atafb failing
to use framebuffer_alloc()). Patches 3 and 4 have been updated
to reflect changes introduced by patch 2.

Patch 5 is adding support to make use of the ethoc hardware also
in the SuperVidel. Platform device register error handling (reported
by Geert) hopefully fixed.

Cheers,

   Michael

Cc: Helge Deller <deller@gmx.de>
Cc: <linux-fbdev@vger.kernel.org>GIT: [PATCH v3 1/5] m68k: Fix atari mouse movement

