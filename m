Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE10B1C8FBA
	for <linux-m68k@lists.linux-m68k.org>; Sun, 14 Sep 2025 03:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757821837; cv=none; b=Dj44jpZiPq5dRzpe25uD+HuQtXj0IoNkIGatSC522d2NTnises+pxOXGP1h1WEXOvHxP29JCtY8HwjqblKIiUjuoK9xnHA38zeuYWjX7IOvE2LnyoFdBgfjygDOo9MxZASXWFAeUxDbFHsXMMlWu/lJe8WAN0Zf+bjzcA/TeOM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757821837; c=relaxed/simple;
	bh=UKYo3sZQHTOBTzj/ZrSKU3L73PiTPpOmU1LUHeX039A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GK6AhrT4CtFzV4yCkiV41beqDIC4yxxvM2bMGNXClfOMmlnigFT6eG9QP3KP97Wr3CoF2fcLr1exOmUFwk5PKKcI/K2r3JcrAtfvWBw53VoYYGjOgwzBmmNG688p8tUIB3XXz7Fp8XBPmYezjVC3sLj5rMg1vtCcbnvG7r8LL+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFF1+8PH; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFF1+8PH"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62ee43b5e5bso3292142a12.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 20:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757821833; x=1758426633; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xULsRy9EzPzDuVUBFXoTlnqFZHMdg+FSwp5f1Vonn0Q=;
        b=LFF1+8PHdU62Dm4ysr+iLdE/gHqKrp6TwIr22PgeYX3DSHv0s9jUASTw0/26wjVwLx
         YdSib2sMa/Ff3jiITSSDsN7lv3gIx1nDo7ZFaohD2I68IGSMNJ6cv+i8EQtfzUtphyem
         AUiH20u0NxJ+OZn2GYIDNID5dC415LWWMzGkaoMEBl2uT7Uan5ynjEt7iYX2HKAhbmXg
         GDJlI3o8s8F2ZLW4GBY4e4OPrlsn5b9Y40/3mPqID4VhoArnwooMLgZupS16vVUs8uvs
         3j5ko7hCyL7qa3yNDt2Xuwh6YMnkYnMjW6+HMxx4qklJ7NRVyrdi9BFq1C0G1Dsy/DZO
         U5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757821833; x=1758426633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xULsRy9EzPzDuVUBFXoTlnqFZHMdg+FSwp5f1Vonn0Q=;
        b=wmBPzicjrxDHze/k6KPbqnLk8p0smyRtToUzCkG8/36v91GQ7jFSbmybcnMfFEVCM0
         0BD3w180hdW1OE9OrmYZ6O7mMXiwlGGB2mcIs6yuC2x/Ar1g+MPm1VWfFOHei4g25e+s
         /oKijCLJ3rUOZbjjljToHiq/y9LXROHr2uOq1A5s+UmWs5vrDa7F0zS4VlpNwmNnyuMb
         8fYfOXltmwZA/ed74zKpvbbC9TWsiJcWKeG0QMe6/jGA86Ae1TPX+4/OkIsen2/mGQe5
         tpX4g8LTqgMyj/nyvJmj+bSVfTEAkysDls2eDcS1diy2NYSxnUaWwWbOKEnoqM9CJ7+Y
         uf2A==
X-Forwarded-Encrypted: i=1; AJvYcCWEBIZsZcGYAoPVWuuWD47hANvBARwde7lUv7osxi6RyMI/+JDb5MLzXixOLoQMZ/hOhVf9dM1iE+Y2@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxA0zorJxM1yigsMgrTg4+8mtGWesipwzgRECXwL2y0XRGgz+nK
	XejCyxBi3ba9DF/NP7tIV4dpcO55PdtEUJ00aQwGfeIRz1QcEn/8Q3E/
X-Gm-Gg: ASbGncvw7oNOXJ/WkvTonSJEevBRyUUkVnYGf0G/8Wx1Q4H4S7e4FxIhlz74LmxsUtT
	9l1iudyQhWThbDzJ6ppTy14hvG8+uwl13JQhZuM26KxNZIt8B3PY2NH7WhDRU/1h5O2KjCrok8/
	ycbPjjgTYvnhWYzahQRaVnXtdZnKd3kujgZC3BvAhJy7x06/DohvdCPd28Y8mG4wU5vTK1Ov5sd
	xZukr6DtTs2tIL+w76p7/+gTHzLLR0fAX1ok8yqKg9Y8UGgemgPU6OSZEuiW8THrt7dmD0sgbl2
	DdCNMPsNxMuQ85LXIvBZIdMAPitvPu1PJ85wxK/pPxmEUGqLtUyn7gR9Ujy20+Sa4BZ1qaoGkh4
	dkKTY4NQjfvWrt7hWMZyA8vq641GYLw==
X-Google-Smtp-Source: AGHT+IHE3K7efxQ+hk8pVBE6YY31PD4G3LjwwPuEi1DqCDNI+Ud0foCSPIjpPnt40T661VaNMc1/Ow==
X-Received: by 2002:a17:907:3e8c:b0:b07:8836:dea9 with SMTP id a640c23a62f3a-b07c3819dc5mr855439466b.39.1757821832889;
        Sat, 13 Sep 2025 20:50:32 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd3efsm668828766b.55.2025.09.13.20.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:50:32 -0700 (PDT)
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
Subject: [PATCH RESEND 38/62] init: remove most headers from init/do_mounts.h
Date: Sun, 14 Sep 2025 06:50:27 +0300
Message-ID: <20250914035027.3609569-1-safinaskar@gmail.com>
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
 init/do_mounts.c |  2 ++
 init/do_mounts.h | 10 ----------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index 7ec5ee5a5c19..5b55d0035e03 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -5,12 +5,14 @@
 #include <linux/fd.h>
 #include <linux/tty.h>
 #include <linux/suspend.h>
+#include <linux/blkdev.h>
 #include <linux/root_dev.h>
 #include <linux/security.h>
 #include <linux/delay.h>
 #include <linux/mount.h>
 #include <linux/device.h>
 #include <linux/init.h>
+#include <linux/init_syscalls.h>
 #include <linux/fs.h>
 #include <linux/initrd.h>
 #include <linux/async.h>
diff --git a/init/do_mounts.h b/init/do_mounts.h
index e225d594dd06..53e60add795a 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -1,14 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#include <linux/kernel.h>
-#include <linux/blkdev.h>
-#include <linux/init.h>
-#include <linux/syscalls.h>
-#include <linux/unistd.h>
-#include <linux/slab.h>
-#include <linux/mount.h>
-#include <linux/major.h>
-#include <linux/root_dev.h>
-#include <linux/init_syscalls.h>
 #include <linux/task_work.h>
 #include <linux/file.h>
 
-- 
2.47.2

