Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5158192D8A
	for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 01:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757726110; cv=none; b=pRQSiLBttoG7ccBSIq3TkkcQbKzZnki+oKjNl5l+NODvcvFEVG0hkArzUHq8Io20K8J2YhxkSuDK5mCNYTQK8FREWyMYfyNQwTEml5nWHOlWlcLb2DkEDeN+j8eSAQuFW5jRVbHVPO2fY5lTcwK2wfY71JjPXFtet1v8QxhJDZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757726110; c=relaxed/simple;
	bh=YCPpMauct/lx0d7FW5hIc0XQ6n2+DOQok3eBS/uAsZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KY8HoNttfYeaHEeqSe4eZ+1fXrwsxmxdnOMqb0KsD+CiVnArlNKLItIHaZHkE7S3sAE3RiBa+0puDNdvL8zvMn+7wg7dX9zJTfIKkO73dd9E5AOT1aqm+5+veoODm4PpYFb+HpxccC9tYGPt+JrOTdTEubcZsHLBfljdQklZRhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nse6PnhX; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nse6PnhX"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b07dac96d1eso101248766b.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Sep 2025 18:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757726106; x=1758330906; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGsRGTypi9NqdtciySRZZEpkGgKS+BdOkJag/Ax3VcI=;
        b=nse6PnhXzC0qaZVSlONuEGEQmzV/zP6NWyhdpLMbJ+vXJvobAfsAFTn//zJvS6PYh6
         i5ipHJUASfv59Y/9Ar223pf3iwPn1MKY8ZAbSfNg5qJNBnD/LNzxg0rS4RHzbHW8Du2e
         TRTzcc8MlzmZfxLcfHkciOrj68298UV/nySG3oODiZtxMkOrJUGrqTrEzVnUKrpAEfe7
         t3WHSWVi63bRv7cQ6f27Iqv0LsftgmESiAL/hGfL7fu23kDvI6UC59qwB1NGGHgq3HYY
         Edsj8ntxZ5a13bFcfGRv38B2uWIsG9yTOfR3XxAtFFapgjfbRFPshp5+kIpQSVDoXkNk
         Om8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757726106; x=1758330906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGsRGTypi9NqdtciySRZZEpkGgKS+BdOkJag/Ax3VcI=;
        b=WkbSNhclziy7VCz5eIxbiHg5lek4g9lPDw9IaQ2D3TlvCpkczlRhS2JQOX5JHkGNs0
         sQHI3dZfRF3BwG1w8bRI8U7pI+T7dpVh0QL5kEiB74mRXNFGBTglC8Omw2zMdKdNPZr4
         TZVf5rddZExhcMDqTf5dwLLwDOsIAEAXQTme1lZfWDrKhk++VyFZWT3YDsuTAORZGapH
         00tuuIN1gYH1mDAcZaszLB1tKPNXUeZRF7xtUmDEH3pMOXHPz5V1tglm1oRkA8MvU91S
         moyk7skRNWxgegK8I+Qpe4vPSLjQHgCMq0hu8VPi/kYTStmHiW6pzW/LIYTM6VNTf6Gp
         DJlg==
X-Forwarded-Encrypted: i=1; AJvYcCXFXbKGEQSHFf2ZO7oDsDTp8b9nAR6WVSfcsBgOSSjfyVJLJq8JH8B564cf7tHp2wLPd90KZIz0vRW8@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy3pHIX7aob4D6VeyC8WL+X9w86GlgR8aMTDgclh8mV/tkqnBTJ
	NuKmpq73F3mBB+0FQa9WSuafHcHF68QvcUgdlFbcVL466u49DSAgWXo4
X-Gm-Gg: ASbGncskG4pAM6tW808k4GuA/WH48yePgorffp91svIYm0EWCGcd5eQ8L8GFzqmeml4
	mQ2Y+bizvWtvw7wR//YxzFeNvn0t77b1LbktDCV2Ih/zHmNpKwB+8xCE27WX8Wj5W10dD0Dqajm
	tIZNUmzGtREVu1D+YhWAK4DPIkOykl4YmnKt0D3HXQLP96lFQj4092cqQ4dx7WMS2Tv8T5o/8C3
	t2g7NIrbu6jCE/VnFjSrnmQp6Ocoeq1ftgKJMSf3pEz2D9GyefuclqIvdu1keL78k/tG7cy+OxQ
	e8fgayFvxckn0szT3vJmtaCAyispzK4QY2d5K+gFNPoFRA4cdSj7Lzvz6aFeHReWiyqtHwYagSV
	KFrjogfC4TDr2xYYViBk=
X-Google-Smtp-Source: AGHT+IF9BfFXzJCfAH1j6Whgn4db4w3JHUdrGBSr/SBtjDaVKK8KXKnwXgawQKNvW2//sA4Wp0ETBg==
X-Received: by 2002:a17:906:794f:b0:b07:b19c:1389 with SMTP id a640c23a62f3a-b07c2543931mr499914966b.23.1757726105874;
        Fri, 12 Sep 2025 18:15:05 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b334e4fesm475799966b.106.2025.09.12.18.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:15:05 -0700 (PDT)
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
Subject: [PATCH RESEND 32/62] init: move initramfs_below_start_ok to init/initramfs.c
Date: Sat, 13 Sep 2025 00:38:11 +0000
Message-ID: <20250913003842.41944-33-safinaskar@gmail.com>
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
 init/do_mounts_initrd.c | 2 --
 init/initramfs.c        | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index d8b809ced11b..509f912c0fce 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -12,8 +12,6 @@
 
 #include "do_mounts.h"
 
-int initramfs_below_start_ok;
-
 static int __init early_initrdmem(char *p)
 {
 	phys_addr_t start;
diff --git a/init/initramfs.c b/init/initramfs.c
index a9c5d211665d..90096177a867 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -601,6 +601,7 @@ __setup("initramfs_async=", initramfs_async_setup);
 #include <linux/kexec.h>
 
 unsigned long virt_external_initramfs_start, virt_external_initramfs_end;
+int initramfs_below_start_ok;
 
 phys_addr_t phys_external_initramfs_start __initdata;
 unsigned long phys_external_initramfs_size __initdata;
-- 
2.47.2

