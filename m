Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CF119258E
	for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 01:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757725908; cv=none; b=NSz0NKM4210rJEckmpuHi+FW85WtxWUp5nL9ASh9soq4Rt1Fiq6+5FlTMKAMUz7dkhPYB9f+tt8u32LjsMJnI10ctV3qexlavihs+bkDaSrOqAMHUVttAnfw+vJu8EDQaX8+UNwUWvrpJ5UNr/+8wutdrChzMYHYPTYxaT63VFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757725908; c=relaxed/simple;
	bh=KpML4fn90471dg944P+9+9FByq3Xjb/jBBYn5xTeENA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bCEM+yw66UQTJfGinwr4cc66vV3WxboWIs0O99wywELXK7LX38+RGRvQWcs/dKZUwPLkYPCGmaw36OWsYtGEDp3qEx5PMfytYexnelM4sj2gDgFKaGbmUhB4Al+kPjM2rk/bq1XspqDmdqbSGbOOvqOrGs8Z2nbre4EfSkCUTRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfMonIRb; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfMonIRb"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad4f0so3994996a12.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Sep 2025 18:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725904; x=1758330704; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6O+lfSZLBCLtFpNKL/1anVub0eApVizJE0pmHD2kMo=;
        b=YfMonIRbwtAlxyLDMh0xubeeY8cFr2Cq5HPo11ICGxX04pB59ocaTJALHwd3P4xhku
         aN9aG9ib7xprza8cvEbxC7Gju7iPus26w5yR07upn/j/DcXU8Fg2Ji4yS14QHmqLXLkO
         kNcgoawKeSCVtwsB8vu/gSqG0w4dTz6aghe3s3048w4DqCiEy+QUVh3sQTW7l05s5Dx0
         rqdFT01c8CuK7PxNa3c0cBPp4K+tQaCsVCVRa2rGCjAkeMc/EbkTyBlkrdQ447zeGnpx
         2JH1ZHgrvqSfX6xLLuKzYgOBHj2W5y/wRlT4pbeTodUlQRqh1jHwTfu8/kXKZ07jOYuU
         FpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725904; x=1758330704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6O+lfSZLBCLtFpNKL/1anVub0eApVizJE0pmHD2kMo=;
        b=ODtQmLUyiXsSi8l2mwDEDj6pUxfjPcrBizR6nEavfZ0bBUV4PHKjKmUotk+NB9kApG
         oMZ2GP9oq6Sikbjo3vDRtpmCpQRTwbEDnpspZFWMOG1RhTd/Hob1wjAmcztpuV/MfeJD
         TyuGVhveeOkCDehD0ORzpU3YSBl5J6Cmg7FGIkeMvX71BJse2WLCaBfiwujVxmuHiYJS
         35TWJpUrBNowRHdM7PB0SZYOc4t+0c4z6aXqF9LgavKI4rBkjn4rph6E/VqoarMNnVIk
         +5OK74a8SiwxvQvvvPxmo77xJgeK+3hNkoBDSTH21yD73Qi9sWXvpLdiSleBNiH0XW0S
         /U9w==
X-Forwarded-Encrypted: i=1; AJvYcCWLj9BojkRhryO9z5R5MgFCgoGWhQLW/YHef267fwUz4Nx41LfjdwHXZcApMmP52oYGPSmHULdCpFnn@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yyo300Q0RzEpLuVZ4l1brvupiQfFARUGrX2OkLE7NQQ5Lkq6o42
	OACbwUv9KJ+BplbllVqpnuMkjB8CLrVVMLgd33DZnx0V+r68O0ymp7Hd
X-Gm-Gg: ASbGncs1K5K3jiwBCmLaDLYdSTajUcBswUzrfC/65hKgbxBketIgRvGghC5TqD7de3i
	nxrCZRhSrAR7owG+26zZDLFLZCJXmb0q10NinkhTUv8ij5BAag0a2rrrrlgHIRYQhnDw+wbPMmZ
	z4FbAp6qYWOu/ysSAH2eoql1q5n1ePit+K5GkUzpfd1QLO0JJAhf4KJ4xCzfxrgxRFi8VF/hTgn
	bEHQif8CAG3xeXk4AtDPkIfU4v/1KCZuU5DPLVrUL20ANi7S88tcs3/u3lGFeEqqFCSD/lk5Pnb
	XswjGaawe0JeMLX0C7uzE9xj/7VFp0eOtlaUYketyzMxeCOCLyPWbGHFVyc16PIJ/D3/RCAP5Rc
	pXlMRWkuLGNMA5lJsLvE=
X-Google-Smtp-Source: AGHT+IEEs4w0VYWOrTZ2mf5mPdRdgIBBMsi5zMJEle+Jt2EK6Q+4TbCNWtdbvmdxcJfUUMXxxDwLfQ==
X-Received: by 2002:a05:6402:5242:b0:628:a4fb:3b44 with SMTP id 4fb4d7f45d1cf-62ed825998fmr4990182a12.1.1757725904210;
        Fri, 12 Sep 2025 18:11:44 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62efb5b8b0asm913566a12.20.2025.09.12.18.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:11:43 -0700 (PDT)
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
Subject: [PATCH RESEND 29/62] init: move virt_external_initramfs_{start,end} to init/initramfs.c
Date: Sat, 13 Sep 2025 00:38:08 +0000
Message-ID: <20250913003842.41944-30-safinaskar@gmail.com>
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

Move definitions of virt_external_initramfs_start and
virt_external_initramfs_end to init/initramfs.c

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/do_mounts_initrd.c | 1 -
 init/initramfs.c        | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index 8bdeb205a0cd..535ce459ab94 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -12,7 +12,6 @@
 
 #include "do_mounts.h"
 
-unsigned long virt_external_initramfs_start, virt_external_initramfs_end;
 int initrd_below_start_ok;
 
 static int __init early_initrdmem(char *p)
diff --git a/init/initramfs.c b/init/initramfs.c
index 9a221c713c60..d2301cc6c470 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -600,6 +600,8 @@ __setup("initramfs_async=", initramfs_async_setup);
 #include <linux/initrd.h>
 #include <linux/kexec.h>
 
+unsigned long virt_external_initramfs_start, virt_external_initramfs_end;
+
 phys_addr_t phys_external_initramfs_start __initdata;
 unsigned long phys_external_initramfs_size __initdata;
 
-- 
2.47.2

