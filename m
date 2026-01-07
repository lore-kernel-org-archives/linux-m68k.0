Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A842FB97B
	for <linux-m68k@lists.linux-m68k.org>; Wed,  7 Jan 2026 09:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767777670; cv=none; b=XgMMNyEvJ8oFzvEstIhLjC+y8vavndlv1G4mKG4eRN5OCx9gwKimT6yb0Pd6fIuA2pqCTF7wYnNA/GRTyKxB58yO/jpqRequGPrFUTljyYS+KLqqqRsj0jSaqPw0ZO0yVeo4KXwAqGcDh4vxLQxm5MYqqPQ/IWWWQShCaGJCcME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767777670; c=relaxed/simple;
	bh=xEXgqx3dcUa1lKogMhPMSQMMTLOBA0IUou8y32c2rvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=EYg7uPe1xoQdky6bW+Ko8S2hVmxzRDEaPxAjFtskEYP7yCM4hWDf5t0CXVVhoGP5vD2gh6qiWMZUjppS2ZoNfMP/wI7jXPk3fI+rlXOSDELDGMwxauLH8Wp9NegoGwSlKs4YF/jJUpvX+tmfWEUMdW+CMozcWI5LaO4mweU7c9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Di4Is2Uu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Di4Is2Uu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767777667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Urp9ek3RCDTEdf2Hlje2SMO9RndJdD1iaFZVb1j4mwc=;
	b=Di4Is2Uu5nwe7ZwS3LyAJbJkg9pAwmI2CXIaIz4srI5KcWT3T+5zXSLrBl+mW+eB9ZkDbO
	jPTIK7gpP6skTua9drAFemGVhG+Ujz0ic+S9a2dKV3PZYG+Slf+CWGrSpOqJxbSFch//8V
	+J2boqnwBKmyFRcNd/QGTm3rQCEiKKg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-N0t3-Un6MUGCTio23jXxaA-1; Wed, 07 Jan 2026 04:21:06 -0500
X-MC-Unique: N0t3-Un6MUGCTio23jXxaA-1
X-Mimecast-MFC-AGG-ID: N0t3-Un6MUGCTio23jXxaA_1767777665
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4779edba8f3so14002435e9.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jan 2026 01:21:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767777665; x=1768382465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Urp9ek3RCDTEdf2Hlje2SMO9RndJdD1iaFZVb1j4mwc=;
        b=wLE4HloQcwdCww+fl8dKJBxQMaqn+TzP8u/gLdfmodiM046aIYb2rYmFmz7LIF+xq7
         tRqpTkE643qV6d4Xg++RTnYCE8jqpvyzk/Z9Qa1gNj2/4y7uvuFdO/D6Lh1tBtUNTSYJ
         BGkmlLmz7v6cYM5buscvT7nvxUkzoPIAyOt8n6LkMkP9DaItRstLmgZyYUWgpRvFQRM/
         4QCU8FZetZvJRavQT0hCdzStptc5O5TM8SpcdrtQ3m6vwsQnTnF1+RCkmvENicnweFuQ
         3xuVvZgX9V5PWwU5xNKXghPhrqcQ1J++Sp7bjCmm2VSVhGmhZkn+naQw01vLi6eG64L8
         uj5A==
X-Forwarded-Encrypted: i=1; AJvYcCWIbOSVv78ig46aVfs1LPPSZI6ZvSywmG2pYuAQj//8toDBiC4NsaPn0POv9F5bC4dCXXdU10iogspS@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzFl7CdjFLOAuDoTehVp2Go1ycD2cCkAGODFbwGy5tvF1aBtBxM
	k1lqwORMFAFn5g0p6Tx7lDsvGlGTShATge1rxCGY25w1pA9wSUge0IjsTUM65IdTASjytw8DQok
	PofUn7CJTZLxCh99eF1LiGaQA0XfWjb8qiOL2D4z9BdlEY3cVOyUziZj78BcPrDQvhZ77XA==
X-Gm-Gg: AY/fxX5xLUNviH7z1fZ9dxiQh3368ePPwU+UtUZcWuyUQPUDAAEMQLa0Uq2pDScD1Kj
	BOvHDt8VetmS7wmffvww87/dVtFcfvZwFOauZCmeU90nQ5O1b7ytc+LRbHx5/mvUtLWl9lpX8eq
	yDJrMtY6dUKanUEs3KXe6byjl5w1sYCHPJluzY1GGE1m70VfsmEgXe2wOmfwx83WQC4wJjUDM2O
	azwf4TsFzgIXDGlAKo3747Xstsr5N5NcVPxjERgbn0xLBLpgZ3N8cUBQLxKt9vIME1BVjg2bKju
	DCh9BqCdhsXc/0nnGvYqWdaES74+/CEKF13CzqkQCot2i70p6WofgQWh2Ld71e/WM/ibNiwDXVj
	6+DVQ3LldhEXerUVCXF530NZjYz44bAPxhav1ud1dQDS39gy3hOAD2yDXA+s=
X-Received: by 2002:a05:600c:3556:b0:477:63b5:6f76 with SMTP id 5b1f17b1804b1-47d84b3b3d7mr18299125e9.25.1767777664986;
        Wed, 07 Jan 2026 01:21:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIduPPwDQFsu66VMJZrtw+FNO75/ACDwxg1ZBu88BJXbQ6099VTPtu5Sx1R2fTSkLUtjYGWg==
X-Received: by 2002:a05:600c:3556:b0:477:63b5:6f76 with SMTP id 5b1f17b1804b1-47d84b3b3d7mr18298765e9.25.1767777664647;
        Wed, 07 Jan 2026 01:21:04 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8662c09bsm9377715e9.2.2026.01.07.01.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:21:04 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] m68k: defconfig: Clean up references to non-existing configs
Date: Wed,  7 Jan 2026 10:21:01 +0100
Message-ID: <20260107092101.24545-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2IyyMjiNzHFkVJePs0pIOs4sfYdj-kmAGavnqqIYhg8_1767777665
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

  - Drop 'CONFIG_I2C_COMPAT is not set' (removed in commit 7e722083fcc3
    ("i2c: Remove I2C_COMPAT config symbol and related code"))
  - Drop 'CONFIG_SCHED_DEBUG is not set' (removed in commit b52173065e0a
    ("sched/debug: Remove CONFIG_SCHED_DEBUG"))

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/m68k/configs/amcore_defconfig   | 2 --
 arch/m68k/configs/m5475evb_defconfig | 1 -
 arch/m68k/configs/stmark2_defconfig  | 1 -
 3 files changed, 4 deletions(-)

diff --git a/arch/m68k/configs/amcore_defconfig b/arch/m68k/configs/amcore_defconfig
index 88832e9cd7cb..f310b5dacfd8 100644
--- a/arch/m68k/configs/amcore_defconfig
+++ b/arch/m68k/configs/amcore_defconfig
@@ -61,7 +61,6 @@ CONFIG_SERIAL_MCF_BAUDRATE=115200
 CONFIG_SERIAL_MCF_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
-# CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
 # CONFIG_I2C_HELPER_AUTO is not set
 CONFIG_I2C_IMX=y
@@ -83,7 +82,6 @@ CONFIG_ROMFS_BACKED_BY_BOTH=y
 CONFIG_PRINTK_TIME=y
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_PANIC_ON_OOPS=y
-# CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_BUGVERBOSE is not set
 # CONFIG_CRYPTO_ECHAINIV is not set
 # CONFIG_CRYPTO_HW is not set
diff --git a/arch/m68k/configs/m5475evb_defconfig b/arch/m68k/configs/m5475evb_defconfig
index 2473dc30228e..9be4dae84ebf 100644
--- a/arch/m68k/configs/m5475evb_defconfig
+++ b/arch/m68k/configs/m5475evb_defconfig
@@ -46,6 +46,5 @@ CONFIG_EXT2_FS=y
 # CONFIG_PROC_PAGE_MONITOR is not set
 CONFIG_ROMFS_FS=y
 CONFIG_ROMFS_BACKED_BY_MTD=y
-# CONFIG_SCHED_DEBUG is not set
 CONFIG_BOOTPARAM=y
 CONFIG_BOOTPARAM_STRING="root=/dev/mtdblock0"
diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
index f9ecb1dcc060..515d9b208b10 100644
--- a/arch/m68k/configs/stmark2_defconfig
+++ b/arch/m68k/configs/stmark2_defconfig
@@ -90,4 +90,3 @@ CONFIG_PRINTK_TIME=y
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_SLUB_DEBUG_ON=y
 CONFIG_PANIC_ON_OOPS=y
-# CONFIG_SCHED_DEBUG is not set
-- 
2.52.0

