Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF3E1459F7
	for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 00:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757725056; cv=none; b=C5HfsF7iwIghpdUQcRKYvXF4t48QQa3XFtQMTIaifX4OrN5knCnrFL2jCnZQlncUPtoMZVXFscKNFrnNnqxAwFOGhmvRCP3GB3+LbTQSGOZw+UlmgDeOj1PO+C4pU1/BzlJYGbD1chLu1zPOgmHHyxKjqG5zClOnzBc8xxU4+2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757725056; c=relaxed/simple;
	bh=icqv9qJHo4M/f4BybNZRp4QArCkqmFyOuQeqTRdwg0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=krYDbs3IA6LGz5qGMs8BSKFnK1XEPpvRNy2anR/1lzf8lZxgdh/NDrIEq5Y+VKztXqtbq95M9pp9IJYDF+enDUMI/moU/a2bi38ykZWwQwVphGWYWkWVUTFOxD1ypdH8dpmK7+BPaBzwzc/DJEk0xDwqIVO6F5SFWT6PW8VaoIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hS8xHdFm; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hS8xHdFm"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-62f125e5303so6216a12.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Sep 2025 17:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725050; x=1758329850; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezI+jX/C/Y112e/n5Rz3xR2Z7MqtqGJhurNzHRBUkc4=;
        b=hS8xHdFm879UX4s2pD+itLsM3+AK7yez0muP6EkQ2B3cR7hNfLSzKkX6Qzgv+U24eo
         eTLUg8rUaksti7vHn2tdxd6zPNE2zEG1Nzlkx2MJJGVdt7xEWQJEo3VU0DEzQ2i+0kZK
         G+gh1GMexXeFK2WFuR5Fu/CT3TttZaDQECxSkNeoMZmzHwzVexanmUwII0oIlGkP5H4k
         ePznkSxpACfozgD1LH0RaUedlgPeoH89rfTwui7lPjcG5NPzYaaUYgor70/bZY/pPcP4
         LplPvZJR7U2LZuaCVgklV9OoEjVgpAnG0XARP2i6sNKECgCE9UZzX5wIuo+6Jqw2uh2X
         3EoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725050; x=1758329850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezI+jX/C/Y112e/n5Rz3xR2Z7MqtqGJhurNzHRBUkc4=;
        b=rS6SX8nAHk7Mz4gwiAhBQuLrRxDdQZsTvw1gwlOEAKvnR/tx3ZAMJq/cO6SW2KFLBc
         imQM7tRXEJAIOdbbIqvfN5gLrDg21dWB5/VSop6VooAaNYUIZdFgeG+b/TGg5obAzggM
         3WLt/FAXYtTYKjKWNZX/H38blKVlW0MPsr1IuvvORvoU5QsasV3Ad8JMm5utCwlCPZ9D
         jnw8X9eVIrK4ajwsyREwxbCT8TAtI+MtFWiLNrvsFtE9X5juvZkIuYvhuJxAVNGzBxzf
         3sLo80wXrPSwsJhi7h5L+IiiCmJINyH7s3eRwXTwGGYN7Gzn7depxSIiE/lqJ8Qf3C8e
         kkgA==
X-Forwarded-Encrypted: i=1; AJvYcCUUJ2BobqRYxRY0b4Xfn4A8shxBXSCDbcPZ1ElOFKq7kWkDfGdVxsHQO69LlwuuJuPugdDJs6CdBAgS@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzztPZsbzi3wEVYLbaAAiiy9VrvLq8RiRKdSsN2G3/0zpv7W9eD
	QjwKKJmZgQt0MWlDb3WXYK04Ou29VhSjjF6WHLPAzk1/DseAQhK0oDG5
X-Gm-Gg: ASbGnctf/2Jl0X3tVW/x3eNZhL1hTzMepQHyhjXF1iHzdnTC6ex67uHxTyIsQzDGJGL
	wroulMEuJ9tr3xemIozzzMgZ9cWvNzIQDTp2kZb79jJXNGlEdMdp6YJE9HOHz8RGaCXDzTQ1Y63
	r9+OnIQKbVi3cooavaqjez0puOdoIsdKS+EJdxjIYlH9ZRqjyiAL7mGcD64eyWbPAk+wmri8Tr7
	XaDJB90gP38+bDNNdF5IUTpY4/AbUVDEkP5pmKQbVVgqjhQBOlL0ie5FS2GUpONjnpo3F099sWw
	res7r//IuKvCmu+dtiz6eANLwsGBHyHk5mFhmBfjRVOMrvm1xcHHoCB0Fm1fklvVHDaJGfZtbj8
	AqgxFtJU+9dWWFYsdQu6TCGHzNSeutA==
X-Google-Smtp-Source: AGHT+IGnRtXHmAlBOGcWImQD5jsKfQTyCdy3QliDqyqREaJdsFoBMJl1utqd/JT9F2sOVlrjQyooHw==
X-Received: by 2002:a17:907:944b:b0:b04:ad1c:59e4 with SMTP id a640c23a62f3a-b07c35328admr535751966b.12.1757725049282;
        Fri, 12 Sep 2025 17:57:29 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd47bsm478662366b.58.2025.09.12.17.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:57:28 -0700 (PDT)
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
Subject: [PATCH RESEND 16/62] brd: remove "ramdisk_size" command line parameter
Date: Sat, 13 Sep 2025 00:37:55 +0000
Message-ID: <20250913003842.41944-17-safinaskar@gmail.com>
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

It was used mostly for initrd. It could be used only if
brd is built-in. Use "brd.rd_size" instead

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         |  3 ---
 Documentation/arch/m68k/kernel-options.rst    | 20 ++-----------------
 arch/arm/configs/s3c6400_defconfig            |  2 +-
 drivers/block/brd.c                           | 10 ----------
 4 files changed, 3 insertions(+), 32 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index ad52e3d26014..e862a7b1d2ec 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5279,9 +5279,6 @@
 	raid=		[HW,RAID]
 			See Documentation/admin-guide/md.rst.
 
-	ramdisk_size=	[RAM] Sizes of RAM disks in kilobytes
-			See Documentation/admin-guide/blockdev/ramdisk.rst.
-
 	random.trust_cpu=off
 			[KNL,EARLY] Disable trusting the use of the CPU's
 			random number generator (if available) to
diff --git a/Documentation/arch/m68k/kernel-options.rst b/Documentation/arch/m68k/kernel-options.rst
index 2008a20b4329..f6469ebeb2c7 100644
--- a/Documentation/arch/m68k/kernel-options.rst
+++ b/Documentation/arch/m68k/kernel-options.rst
@@ -215,27 +215,11 @@ Devices possible for Atari:
            seconds.
 
 
-2.6) ramdisk_size=
-------------------
-
-:Syntax: ramdisk_size=<size>
-
-This option instructs the kernel to set up a ramdisk of the given
-size in KBytes. Do not use this option if the ramdisk contents are
-passed by bootstrap! In this case, the size is selected automatically
-and should not be overwritten.
-
-The only application is for root filesystems on floppy disks, that
-should be loaded into memory. To do that, select the corresponding
-size of the disk as ramdisk size, and set the root device to the disk
-drive (with "root=").
-
-
-2.7) swap=
+2.5) swap=
 
   I can't find any sign of this option in 2.2.6.
 
-2.8) buff=
+2.6) buff=
 -----------
 
   I can't find any sign of this option in 2.2.6.
diff --git a/arch/arm/configs/s3c6400_defconfig b/arch/arm/configs/s3c6400_defconfig
index a37e6ac40825..23635d5b9322 100644
--- a/arch/arm/configs/s3c6400_defconfig
+++ b/arch/arm/configs/s3c6400_defconfig
@@ -4,7 +4,7 @@ CONFIG_ARCH_MULTI_V6=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_S3C64XX=y
 CONFIG_MACH_WLF_CRAGG_6410=y
-CONFIG_CMDLINE="console=ttySAC0,115200 root=/dev/ram init=/linuxrc initrd=0x51000000,6M ramdisk_size=6144"
+CONFIG_CMDLINE="console=ttySAC0,115200 root=/dev/ram init=/linuxrc initrd=0x51000000,6M"
 CONFIG_VFP=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index 72f02d2b8a99..05c4325904d2 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -222,16 +222,6 @@ MODULE_LICENSE("GPL");
 MODULE_ALIAS_BLOCKDEV_MAJOR(RAMDISK_MAJOR);
 MODULE_ALIAS("rd");
 
-#ifndef MODULE
-/* Legacy boot options - nonmodular */
-static int __init ramdisk_size(char *str)
-{
-	rd_size = simple_strtol(str, NULL, 0);
-	return 1;
-}
-__setup("ramdisk_size=", ramdisk_size);
-#endif
-
 /*
  * The device scheme is derived from loop.c. Keep them in synch where possible
  * (should share code eventually).
-- 
2.47.2

