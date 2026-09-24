Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D087407CDF
	for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Sep 2026 11:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248754; cv=none; b=ZXPlZaNGfSlQM1w9eEW0OS5J9RwLkUpEeiF06iXu4U6T6ZG8pO2fdWfkedVFR5xefIgx1qRo+okpMXNxuEix5TO4TntCtQ+8CjXK0dSWQHAva7BJaFIgngA3dmBdMXkOLxvovS2+Y6kpAH86o/X6gTuPsMSuzrXDRe/WGh23YI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248754; c=relaxed/simple;
	bh=C+ScBriWGoEl0XwGmvaCbB2BXiOvlk6aDCMb0cBOw1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tvqlm2qWokuA5Rx7d3gAwBB/RQU4K5wGccep2plCny5jXQCZaYZg6uPiTyJzUym0Jwyzz03rMRaXtLReQBJO3tIgoPWORU7eZfBTm1yciL9D8MkbCVBAaZA+5qjyS5RG3iERhyfHNaz9L2x4AcfGaRXKcQPFV/4q3Gllvn2Pa70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=NKOJ9ddc; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="NKOJ9ddc"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caced6038eso5363385ad.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Sep 2026 04:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1790248752; x=1790853552; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwJHDWyJoZK+JbHCcj0VJjr2MaNEet26f54ykPfe9Ug=;
        b=NKOJ9ddcDeYmcGxWqnTsg/qFzffwqqiUxc1n9W2mzO7keGS9/6Jxn1LPBIL/Hkuts3
         yF9aR+7d/6lvs94htuenNJRWviUdqpuHCDx/8/YZM8Gv6niGOsn/MK/Pe1CXekp9KCAQ
         hZcBxKL0w8qCMHWU+dKHSh9/dA4rXEkIFuzrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248752; x=1790853552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hwJHDWyJoZK+JbHCcj0VJjr2MaNEet26f54ykPfe9Ug=;
        b=nnBqDbG1auflTs4+wSZDFTtAEVei9Nz9FNPHrLdQdBvMaH/lx0J3dZJP0Ju+rWhGC2
         tnsPZPOy4GDUOVv9rEjWwQVjU5NwExJqWE6waD3kZ765ZSMHeRKJhqyli4L1d7zb5JcM
         d7fPmmMebhKJLVQmHe1IkVkiPZ7t3wLLXlCQxIqPptBj+6tekVgtmU4K5qxjXVRzWleM
         +JBIgXlaSjksx1opNj+VCw3xbxN/TbESxS4gtecTvwLmAjHMz8Jb0Ma9PyoPM9kZmoit
         15/q3P04ane0svrym2IDxU+ewU62meamp2tSm+vXIKwW7SBYK7H2oLZPvyNMefapEnJ3
         uNxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiyzmGJhd+YsroactWfyYfTso+MTLm1H0cl0XF2zVkWGz0XdRWldtqUlClypgjEC1OpIWX9Ro8ojHb@lists.linux-m68k.org
X-Gm-Message-State: AFuF++n2R1UYia6OcjxZ2L75BcmUqn+jkauHQ6YL3GUxvG6gJFoEEH45
	x+wTgI7WYIC00AUSiFcTPVa23EeG516LP0SYFOSVWL/XrsxymZRl3SDbajrqOo16Cm0=
X-Gm-Gg: AYBFou0FOh9FmeFLMmQYq/EpZuwBUEMLIWOJfbKggvcuHZ8GuFdXwvMnzOlRjGvm9X5
	wkUk+pgFQ5FpjCZrXvXcmzMAZVeUHB3mLDw0S0m5RXRuIvylvLwHz+EO6enMFJJTAo618/Eegbx
	QHZuVq/qb+/qrWQ18+VPtLh/o3WCIGHFp8f1I/aO5pK4Hygy7K+blNe7VjBS10AYi3k7GkzqcM+
	vHnbgeo8v+4vtnRnbmEmmzDTgE9bOkGRo5dDNrXtDyJigs16ByZMFV8WSXAIY8SScF2rQkETUsV
	IwDX+QbstfoMDG6wM6E6ULcuAZkpZvdwdmSmGHDxZyMDH8m6d6coOdWkW7JjJhBD+VAAL0eekP2
	bOzerKixKoQPmPzp1O4avLNmZRXKRzfsx/W005FtR/hO9mbY3L6hnGqBvn0GFk31SEuQtz/fsus
	9idv9odtXobMc0BOh9xlb1DMV/28G+23SENm0Nzqt3UUmR5IrmNi614bMoZd4x2OOAsyccBseAi
	eRnCOELIjRCR8hFCuoW15PrCId5dkFTcG4QeYI=
X-Received: by 2002:a17:902:f683:b0:2df:34c0:7300 with SMTP id d9443c01a7336-2df7e29e0f7mr12516735ad.37.1790248751832;
        Thu, 24 Sep 2026 04:19:11 -0700 (PDT)
Received: from shiro (p1935159-ipxg00g01sizuokaden.shizuoka.ocn.ne.jp. [153.129.99.159])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2df6a5c18c1sm24683465ad.36.2026.09.24.04.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:19:11 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: sammy@sammy.net,
	geert@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 2/2] m68k: sun3: add an early boot console over the PROM
Date: Thu, 24 Sep 2026 20:18:51 +0900
Message-ID: <20260924111851.3501100-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924111851.3501100-1-daniel@0x0f.com>
References: <20260924111851.3501100-1-daniel@0x0f.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register a CON_BOOT console that writes through the resident PROM's
polled character output (prom_putchar()).

Assisted-by: Claude:claude-fable-5.1
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/sun3/config.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/m68k/sun3/config.c b/arch/m68k/sun3/config.c
index cb4e19b95a1b..49821c28a641 100644
--- a/arch/m68k/sun3/config.c
+++ b/arch/m68k/sun3/config.c
@@ -145,11 +145,33 @@ static void __init sun3_bootmem_alloc(unsigned long memory_start,
 	m68k_setup_node(0);
 }
 
+/* Early boot console over the resident PROM's polled character output. */
+static void sun3_early_console_write(struct console *con, const char *s,
+				     unsigned int n)
+{
+	while (n-- > 0) {
+		if (*s == '\n')
+			prom_putchar('\r');
+		prom_putchar(*s++);
+	}
+}
+
+static struct console sun3_early_console = {
+	.name  = "sun3prom",
+	.write = sun3_early_console_write,
+	.flags = CON_PRINTBUFFER | CON_BOOT,
+	.index = -1,
+};
 
 void __init config_sun3(void)
 {
 	unsigned long memory_start, memory_end;
 
+	if (!sun3_early_console.data) {
+		sun3_early_console.data = &sun3_early_console;
+		register_console(&sun3_early_console);
+	}
+
 	pr_info("ARCH: SUN3\n");
 	idprom_init();
 
-- 
2.55.0

