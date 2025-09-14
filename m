Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75644267B01
	for <linux-m68k@lists.linux-m68k.org>; Sun, 14 Sep 2025 04:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822703; cv=none; b=tqGhp96TJennPR8HeETEIfc6mpU5R/NqNV08ewvjbiQPuEW1YwdxWIF3nGBuS6iGJRPEPKqNXPZXqUUSYfZ4EyNj7+EsbNUdm4FoEOvs1m5fLufoaY4e5HQGq5KVxIq8QI/L7RGOWvfE84YpN5zPNLmsZRdUI1HPxBVU3Onj/0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822703; c=relaxed/simple;
	bh=K5eh5PFkTwqgMsR/pgApUC7mRgd5tIkIjFvctye1Fsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ncaGdBTlgWXKUNvSpPnBiSoc+ocv33vaY2HUtQlRZQImGNgnn9XdUJZNKhuEXMypfYw4sLD6AUvuvG/anrmbFHBS4yifwBnSi78qV7FGKyyFwYLXnXrAjpiLF9eVabdQfh+3OD7v6GfoAuzTzGZxdRt3U7TeiWBRaqds0WzHPTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jef1Ui0t; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jef1Ui0t"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b07883a5feeso549745966b.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 21:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822698; x=1758427498; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mw6NNXq6XfJ0FNmZ5frjZGClHo0iZVSxbFf+bMTHIN8=;
        b=jef1Ui0ttSjwtYcBQhIMVSZeEtg9easUXWrQ1QkL8f2pP/Tg73PuF7/z0IxEGOU2ET
         AM5658X2CcpjOlKa5hSPnWKlGjD9AmBDfr9ByomBeLuf0IlXqgaoKeD4NiCosqqyzZPG
         FlVfrJGLInGULHWqon2UJWpNrSOn7GK812mHfiE9/MQFyOvt9S75aCupqvynH5LR9dyW
         w/fZ27O0JYtp8nvQ0DWCTOKfAjn2VgrgS7VjOGPQ1GIQxjHqmw619nVJ8lkEoJsnjSIH
         /BKbG+A2B5hajJwwLRin8Fa2Q7oKU1rwUiDB57SejJvfWC3/D21vUD1e85PbIQWC6/pF
         VI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822698; x=1758427498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mw6NNXq6XfJ0FNmZ5frjZGClHo0iZVSxbFf+bMTHIN8=;
        b=wyh0xdaM9cljT+48VgOjhnk8WfuYOpfRS+BW4T4tMzZfZ1hFho/4wbqMnLW26+atJ8
         7VDSJOfbelXPv2ZNnIrqPa2NUG+TTuFLozzTqigkYkx71lOv/gM6XpXjti/VI6hL5yAg
         Sy4SHPVeFVjIbchilEaWhPgNVgVUQwdR+5aWTTT52B+GE6i/xZWbM0KNGCN808tJL3uz
         pDLVtANHTEI9s8UQM9LizpkAkx+5BkUqw9S3n4vXjJ2czwSegmM52vXhSx1saNz7LAiZ
         M2PqSI/0k3S3OHGyhBYZ6Bnc4eb3nqs2lhAE7UyDYQWE4LS6c5xkVkCjbRFBTxh/+3Yo
         gV7A==
X-Forwarded-Encrypted: i=1; AJvYcCWeCz4Jpgu89LSeDUJ2RREoRasKN/jvO3v6j9g7Ieog/YKhty8TDpbMtyKVB0idSR0nWusIMyfBPBY/@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx/QKRp6PGabmvmZv8kW1owY3mxXMEoVaVbBukKBcmcIoTUy6ta
	5R9fOxo+TFWJEq74ngfb/XGKSD+fnJHjsts5ZYXdY1VqDLiBRlRZSA1A
X-Gm-Gg: ASbGncuNph5dScLG8JARaZt1aR2AeIRNnEryGtwRJcPYYv9G8gAegKtlOzK1ZKwM90C
	ErU4pbo4dCptgF9DBSu6lUvBv9KWftBF0lnGYjT5lKElbsoim6TCGM3qa7mkTEQzno9f3TUDRGQ
	lyt2bH+VTEtsOYUmr3l+e0HijRlyY6YBImL4dzbVIa0J2CJj7f0ZYhVisiuJ2otBmXo7M2Re95A
	uya8mSx0YUURCJexiOTfE8J6Qj05WdLEQA0n+ulnYC3NeKmM8N777CMoO8LEMgZEjk6ftR2dvEw
	BBeS9CqxV+UnH9fzlfZsu/Xl4INpbcJkGfmZvPt2Bwfn+zFs/7auvgf5icTZcx6sQAXaBLXspJE
	yfmNr0bJZH4+MbvrU5ww=
X-Google-Smtp-Source: AGHT+IEha/cEycx+vu0xF7TxjEegwfvZABBYj962u8Q3zWPEYF1LD+BxwewIqIoCpytaOJDSx3nrIQ==
X-Received: by 2002:a17:907:3d8e:b0:b04:706a:bcfc with SMTP id a640c23a62f3a-b07c37fd45cmr876333266b.33.1757822697695;
        Sat, 13 Sep 2025 21:04:57 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07dbf5dbf5sm308085466b.79.2025.09.13.21.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 21:04:57 -0700 (PDT)
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
Subject: [PATCH RESEND 62/62] init: rename CONFIG_RD_ZSTD to CONFIG_INITRAMFS_DECOMPRESS_ZSTD
Date: Sun, 14 Sep 2025 07:04:51 +0300
Message-ID: <20250914040451.3848715-1-safinaskar@gmail.com>
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

Initrd support was removed,
and CONFIG_RD_ZSTD has nothing to do with ramdisks.

Update your configs

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/riscv/configs/nommu_k210_defconfig | 2 +-
 usr/Kconfig                             | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 6e961256a941..68cae0496b54 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -7,7 +7,7 @@ CONFIG_INITRAMFS=y
 # CONFIG_INITRAMFS_DECOMPRESS_XZ is not set
 # CONFIG_INITRAMFS_DECOMPRESS_LZO is not set
 # CONFIG_INITRAMFS_DECOMPRESS_LZ4 is not set
-# CONFIG_RD_ZSTD is not set
+# CONFIG_INITRAMFS_DECOMPRESS_ZSTD is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_SYSFS_SYSCALL is not set
 # CONFIG_FHANDLE is not set
diff --git a/usr/Kconfig b/usr/Kconfig
index 3a891a0c9ef4..06e1c1474b68 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -100,7 +100,7 @@ config INITRAMFS_DECOMPRESS_LZ4
 	  Support loading of a LZ4 encoded initial ramfs.
 	  If unsure, say N.
 
-config RD_ZSTD
+config INITRAMFS_DECOMPRESS_ZSTD
 	bool "Support initial ramfs compressed using ZSTD"
 	default y
 	select DECOMPRESS_ZSTD
@@ -206,7 +206,7 @@ config INITRAMFS_COMPRESSION_LZ4
 
 config INITRAMFS_COMPRESSION_ZSTD
 	bool "ZSTD"
-	depends on RD_ZSTD
+	depends on INITRAMFS_DECOMPRESS_ZSTD
 	help
 	  ZSTD is a compression algorithm targeting intermediate compression
 	  with fast decompression speed. It will compress better than GZIP and
-- 
2.47.2

