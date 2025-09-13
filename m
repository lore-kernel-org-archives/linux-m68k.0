Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B368718991E
	for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 01:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757725711; cv=none; b=ib+bCgxzdyQt5gtz/SnQUydaOOooA8i6R4ehS6y5L7jbKN37U/otkd/NR6dHtFgMqpuTYiKcPhxe1hCm8EqCA1o5zaVT75/e/hWZcKuIjdfTYhE5OBtj0Z1Mz6K/L46L9LsdEwHUkByMArWatp003LoFw+HBpl8/mNc34f9Cds4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757725711; c=relaxed/simple;
	bh=gH7Rddwu9MUu/+t3B7A94tjqEJhL770gz/5Md0mQZOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rojh4ts563D0zzoiZbvD2lBP99Mfukl99+lkYig8FWSb2Xv4Azi7CrJ86463oXez+s39pDaN/tU6hP8E1ppztBAniyKaUpmkfAi2bfkaPT8SVjRxFyjAig5elM5m+sq3h0vd9UL0RFYiJDbNI26Tp7X5N3/Pk7IRNXHCKJCMq5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HppIoUc+; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HppIoUc+"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61cb4374d2fso3678396a12.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Sep 2025 18:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725706; x=1758330506; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=076xoEVbaVUh2WXJ09mT2DE1QkI5WvxeMmJOzlrP1Zs=;
        b=HppIoUc+fOJfopSn4XBKwlOBehoTB1omBwtdJjSUcrTRrYQbwO2P7JOxaVVRLrXykY
         4tQyGHuskATsrzIndkHwhIoz8xhrHs2NPMttNgTHRlFBP/si15yaG0JWXpKV9eknwoJd
         gwYkvbfiWLUplB3+dGgnIQW7D1h4EahGiPuNLnN1tMe8j+nYt4/VyXE95HCM7eN7C0Ah
         BaH88p2P39MGWIOR4H1ppDWX6XDPwEE7DuSmD0/teOHm0TRIV8pNB47dv/B2ecgK5yhl
         G8KzW/4597Gi+bvLbcEctIqRrBkwvGHZS6spfiy24EujTn1RbILAkREqSx0xgVIyoMwm
         Uqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725706; x=1758330506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=076xoEVbaVUh2WXJ09mT2DE1QkI5WvxeMmJOzlrP1Zs=;
        b=O2dI+tTnPSkVcQE36diF5s0UbEY0nA8jPlNlkFoxVPn65pgHIFSUVEKAPnIw71b8/Q
         HcP6RUzt1wMxiza/fEq4RS8trcYtF8SwEvK4rrHgNJa+yapR7t+tjDuobAG8xnppcKL9
         crzz8P5c3XB6sCeqmwjpdGXfeaFPucNv6odWGx1bstU+Y0EQKL9MtrVFTIrLfe4gUVSV
         ISlc+uhnSViRGG1H/+m76aD66cRxhbRwqo7dCch1PG55wFjiKRjSJpqyOOuXVG0q0GAg
         in3DnLEDzgV4LHnx73GSGMWRDVQ3TWs8YfA5mVybdCaSwm13QXPyWnenvEFO9Q8t2nM6
         eT8g==
X-Forwarded-Encrypted: i=1; AJvYcCV2zsyGmiRBHhxi5i9SyNzSw4HJDqHW9M7djJez9bhekQgdys7vMWIDoTo9WWq1zbvDdjVlui8lvzTC@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyD3F+LbMdbsZHpqAJqV9Xa5R1LBHTSgVownx61CCOeh36WUGiD
	BADTS5NXTeAFEtjJcQLe+1fcaiGQu6MeqplpgWDUrKmRIfGQnGec4exC
X-Gm-Gg: ASbGncuEXmyvNTtDqf/JB9H+5jtuOiYHb/jD7TIjuce3ua4FmVHpQ/e5vFqlIodgR6S
	h87zRE3YDiijFlyRMPTWkXqPl6ULXD98l7jZq9KnmxIhQzi2TUPYjLlhrti33aWuiw/+62PzWcf
	3Dhp9xFGXs2ml2ub9ZrWNceYCeNVTNcV54TfE5HVStmuaQNzkERlFyk3chnPSC5i/Y/zJ90mkId
	fFrzRgk6Dl/ChO1QCKj8cWAdhDxBMVu9nGyuUqRSz6fCxZwbdLFBhLe/s2aNm/8BYc5cQyrzSDl
	yOr418WtAENCIt6vD2iPro03GXb+K6pycgKJax1coYfGTzUTCXsLWUuJev3kkKPhSkiR45UncEw
	FsXWTWX0/wjCmikzXJnbQyPXGMSYgUA==
X-Google-Smtp-Source: AGHT+IGdk3XVuMADNouJH/aBQO3dgisawWr0ra1gK5dmtwng/BJ+8DUWD+mdbhpnTmhbFrSAIQbncg==
X-Received: by 2002:a05:6402:26d0:b0:62e:e5b3:6388 with SMTP id 4fb4d7f45d1cf-62ee5b367b9mr3462166a12.19.1757725706048;
        Fri, 12 Sep 2025 18:08:26 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62eff1a5c6esm720024a12.50.2025.09.12.18.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:08:24 -0700 (PDT)
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
Subject: [PATCH RESEND 26/62] init: move phys_external_initramfs_{start,size} to init/initramfs.c
Date: Sat, 13 Sep 2025 00:38:05 +0000
Message-ID: <20250913003842.41944-27-safinaskar@gmail.com>
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

Move definitions of phys_external_initramfs_start and
phys_external_initramfs_size to init/initramfs.c

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/do_mounts_initrd.c | 3 ---
 init/initramfs.c        | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index 444182a76999..06be76aa602c 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -15,9 +15,6 @@
 unsigned long initrd_start, initrd_end;
 int initrd_below_start_ok;
 
-phys_addr_t phys_external_initramfs_start __initdata;
-unsigned long phys_external_initramfs_size __initdata;
-
 static int __init early_initrdmem(char *p)
 {
 	phys_addr_t start;
diff --git a/init/initramfs.c b/init/initramfs.c
index 6abe0a3ca4ce..5242d851e839 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -600,6 +600,9 @@ __setup("initramfs_async=", initramfs_async_setup);
 #include <linux/initrd.h>
 #include <linux/kexec.h>
 
+phys_addr_t phys_external_initramfs_start __initdata;
+unsigned long phys_external_initramfs_size __initdata;
+
 static BIN_ATTR(initrd, 0440, sysfs_bin_attr_simple_read, NULL, 0);
 
 void __init reserve_initrd_mem(void)
-- 
2.47.2

