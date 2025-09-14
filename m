Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E570267AF6
	for <linux-m68k@lists.linux-m68k.org>; Sun, 14 Sep 2025 03:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822306; cv=none; b=CeODbiTZEZgsJb9CVKIo1CYxaVwxFzVmDsEEN8KLYiBikziP9E1/ONynaB/9cDd3FxQ44uDQDFnbmm8BegoC+b20yLQn86QP+llHJqLKPPuFqEqkIOW9yF8ua61/rLhOM5oT5vbsnOHIM0erl5+WI04nhNELRQaGrjZqCkeHT/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822306; c=relaxed/simple;
	bh=FYF9OqnW1oqjULxwM3aAWnQiXFUGSps55/Nt+hFxJ0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UZEe2dRCDvUtX3z2J46SAZclIz76UiofzB15GvhMB+ta0BFBHLPz/APIjG0L1XW+TN54csEnTVBQmljHenNtnifvGM8niawTS9judyMnIdTVnLOQsM8FsLZYOJE1fS69Owjw499z43d43KvbxmdZOtvMhbtZDn/j8C28hNOkBjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1p9pyym; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1p9pyym"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-62f261a128cso707179a12.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 20:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822300; x=1758427100; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PVDclpYQ6Nji01yBeit38rRV0WhZ/F6Ahkj7S8LBJ4=;
        b=i1p9pyymWAVKm6piesnjm+Bi0oABe58DDNKjDCsrzqAf4x7dJ/6K5G5KZdO0sYFK7r
         mNiL4DxA6gXDck2YG168AcOuErRlkoPHV55mRaNMIeSnMv1M+dw99p/liaPqhIXDL6TI
         GoXCERQMp+x0kt8TlbMWphP0fk47TG1HZyIpGCIIVry0Jg7m9N+bRv6/+xPn0RTgWuO7
         k/PHCB7PQhM02XOZ6y8g+awpi8YdAw1Zuu0FOow2+DkE/gSmxtzPnkA20bJdFgsDW9k8
         EyjYn7ypX6PtgXasF4INNsgYpW6sDmyvHDE6ZXBPLOPSLpg281KBn1T8dNDlaYFpNC0b
         FMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822300; x=1758427100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PVDclpYQ6Nji01yBeit38rRV0WhZ/F6Ahkj7S8LBJ4=;
        b=oH1i7x2s743CD8+r89TdYYTOs5z/gMDSvAiHLjnaWRPpxOO7BfBEdnnpmFWqtiQSH9
         xPM+y4y/MYmo/oa4Rbkp81qHCY1DQl2XyhtwacZCJjIuAt4jznTSermLGxSX7RL9tnvf
         lkBdyHLAnNwbl/YzNt2z6g4/RlVKjHGVffEc9V42G/pQN+BzReUVz5CS7vrlaAyxSrXL
         wO+1xQj7Mk1Z9RnLTPg8ETp3v/gdSNBEXz5pkrj4ydJx0T4lIoGJHUBovmdyz+T+t8gE
         8j6gJgmgapHx6AVQr2Z2kon7cZMr8YU1Qr6gUSg5qTfnHuK+txatTE7SundSliA1BdpC
         AZIA==
X-Forwarded-Encrypted: i=1; AJvYcCWXEt+/NaE1oMyCFmmnuo81836bB3G2jYPP1UQ9OHJCmNVAn8ETX5PCaTYiGViQP29qJegeOiDOKwbT@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx/D5Qk78GFrORsY0Gl+FRur1vLnVGRfwE2AfqDQruH/+nVYouc
	/252zuKTaueiLjQJ8c0wfmuQSs2bgQuiYXNFkPa57lNtDab19SYAmzwn
X-Gm-Gg: ASbGncu9SLSCYoOjiQzy73/uTQi2+ts0fq84wL/zgjEtIF9C+SVUoA85tThClQw0iFE
	LfI5wgKqMSjrjfccNMZH7Jq7hCWAdYJcF+DIk/lbbTAxrtXl0L/8JOOVK0d1O9Dp9+mUiOh8Yr0
	m1fN0zViZrPTl2TCs5zLyu0Cuk5idV7Tuh/r9kHnnN7JcvEKeF0FsK7Z9cEuzmMTIxqvSyvthtT
	veeNa0x1/94FwrXqWea+qPWVwjzZ8eCRANQ1HckNpqwYw1N6U2jh7rIFz9c7fvrAi0FSIn+XEml
	bD8CxT+0fE4l6RmLsgNw6p++PdWSivbM1lTXnkDN1ofooJQlAn2nNHcuI/6v4tS8rXMfb3DSHX8
	X6x/3VpkRlKj/WAurgQw=
X-Google-Smtp-Source: AGHT+IEs7a72WksMtWatD4lSFnDxnNg7+5MS1D9GOkH6MKg4k8K6DTsXjCx54xq6hKPtDzIS4c8/bw==
X-Received: by 2002:a05:6402:42d2:b0:627:f47c:b199 with SMTP id 4fb4d7f45d1cf-62ed82599f7mr8759493a12.8.1757822299751;
        Sat, 13 Sep 2025 20:58:19 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62edb7d9cbbsm4735738a12.15.2025.09.13.20.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:58:18 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 51/62] init: rename get_boot_config_from_initrd to get_boot_config_from_initramfs
Date: Sun, 14 Sep 2025 06:58:14 +0300
Message-ID: <20250914035814.3752803-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is cleanup after initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/init/main.c b/init/main.c
index a42f1f0fce84..c535e0613df8 100644
--- a/init/main.c
+++ b/init/main.c
@@ -264,7 +264,7 @@ static int __init loglevel(char *str)
 early_param("loglevel", loglevel);
 
 #ifdef CONFIG_BLK_DEV_INITRD
-static void * __init get_boot_config_from_initrd(size_t *_size)
+static void * __init get_boot_config_from_initramfs(size_t *_size)
 {
 	u32 size, csum;
 	char *data;
@@ -311,7 +311,7 @@ static void * __init get_boot_config_from_initrd(size_t *_size)
 	return data;
 }
 #else
-static void * __init get_boot_config_from_initrd(size_t *_size)
+static void * __init get_boot_config_from_initramfs(size_t *_size)
 {
 	return NULL;
 }
@@ -420,7 +420,7 @@ static void __init setup_boot_config(void)
 	char *err;
 
 	/* Cut out the bootconfig data even if we have no bootconfig option */
-	data = get_boot_config_from_initrd(&size);
+	data = get_boot_config_from_initramfs(&size);
 	/* If there is no bootconfig in initrd, try embedded one. */
 	if (!data)
 		data = xbc_get_embedded_bootconfig(&size);
@@ -479,7 +479,7 @@ static void __init exit_boot_config(void)
 static void __init setup_boot_config(void)
 {
 	/* Remove bootconfig data from initrd */
-	get_boot_config_from_initrd(NULL);
+	get_boot_config_from_initramfs(NULL);
 }
 
 static int __init warn_bootconfig(char *str)
-- 
2.47.2

