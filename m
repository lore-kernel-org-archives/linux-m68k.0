Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402C6C2FB
	for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 01:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757726308; cv=none; b=HH1Iz10fZncLwS3Al879Mu0xl/DgPTxJ1vnzoJeFIpJbhN1dxolCyzIvtwYifYJZTjpg5qu9bKT7avBLjjHjW1Du7l6hf7KubENXLpn8E38VrTS8lEf4C2DMO76YpkTE5bqcgXGq97/tETU2gWTkRQC2Fg4SBvPgPBwtKQjmowY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757726308; c=relaxed/simple;
	bh=gqqGfNEIy1h395KAAal0EqVTqfHBZvgS53UXMAzAIg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hgtbgRHxLn7rzVoi1txsoF8eqf2FjcBGmRP7Fnc2RwlKjTNbmQpg5NTlAf8lEMUTRl0IHLSBjVy3Mww9aq3yOBdnVYs37oj6oH8900CQnJ2s2PzrChQAqdSBbCwuoN8iJqAEpeIZcon7sGcDgZn1Y5lMIdZwFUadAIxsaQhGzGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkKI8qEj; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkKI8qEj"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so369261666b.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Sep 2025 18:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757726305; x=1758331105; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azZv/jvf6IRhG0wveCq5ECQcNHAHnPNLNif/IfsLlkA=;
        b=EkKI8qEjpmu8JId0zl/ohuTv5yQarJJS6Os/D8+89qoIJDIUcCWKi1sQBnkL4vzutE
         xsh1NVya64vDvNYQIW0TOpln6MoB7jOjw4XO7/E3THnnZOZ3jzC+T1QbNNxCBY74mf7H
         0eFrmptP2EaI0bnHWYIfIZaT7hixadh+5cvY+7GzJfuhppijXd/ZGeYpRIMr7gG8ob9T
         DiTKHcw00eZqzvBpY9sZzmtga9d00E+8Eu3hfG+bXHslPpyu2C0EpqW2xod8+UeoZJUx
         y8E6nhQy9fxAF7zErBsGR+ZvVLvKDKy41I3MmOcCREh+Vq8Yo/EtQNNyZTCWhEjAKR2p
         CBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757726305; x=1758331105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azZv/jvf6IRhG0wveCq5ECQcNHAHnPNLNif/IfsLlkA=;
        b=iJVYZvXWosVuYCJpXNnNlmAc/0DVkaYb6B64yeNBaVNN5THQQxrRwz0TP0eWSxQ6LN
         uN0yaSNLjyIWH35WnO3NDVYwjadwdCLvOkpxGHdY5QAEkYIN99BDQIoPtH5PMyd5n5Ta
         J8abwGm3ZxB0WCIJiQCWjD+/TQ6D0kP9vNAduZXyNfcZy6f8znlos5y/NwF1w9wCKkDF
         rrU14LcI8J+votsLWdUm08p08sZY4qV9b/wLf/rGUckNmrK0dKAWKD48CWasWLz2Oi+A
         Q0u+hoStgJuWVnpCmtGgvrWnoCPiXSZoOCK7ke35CGluHoG2mStSV42NPdxFsgvKE5yH
         kyOg==
X-Forwarded-Encrypted: i=1; AJvYcCWY9Mz6Qwg+Ip/0P7ypSJW1c94SWlZLeVenuM0oeWCfmxqNBjHTTIimEBMybueQwnKWdg13H5qZ8qca@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxhJDjx5QNlf/F22sCk/y2KmgT+cY4hXPiH65D8jxaQ25/ZSX2X
	FOWqVLZVRafYcFV3K+dHlMo+Rxty67ucM+hqqKSTkOh036I9NT2mmgBg
X-Gm-Gg: ASbGncvTnWoYDrP940YjpQVH32rNOBG/T6kafI3kp6jBk/Y4ItwXaocT7Eoml/NNJIh
	yh19gW1SGO8emvFiB1TlAWHzeyDIz+jwAjjpxLfJyjj/xC0HEnSX+cZnavfgvgKeUgvUF9Mo9Q1
	ItwkBYbO6M1R8hIzEzvDGuVvnCm9y0c0UIt7mz1zr+HeKwOJXqiZxQjRZc0oFsPUz5AjnrYgjZx
	eLlEZ75i71FB9CDOCxnApB722BTRhBNRno+JIJVYMaxbmGUZ5uTRQpXCsjWTgQnm9UdQqCeQRgD
	sFclTQ7Dn3/b9ziQpQ590MYIpvVz+RFqmAu5zvMNFeuLHdCZ+s/uY6QsM+Ybfx237WORXdWMzpd
	xR2uKAX7L6No4K6mcyKA=
X-Google-Smtp-Source: AGHT+IExQyu+Z7m4GD3MP2gVTN78xlktku98kUsQddou1aWuxY/hOtzAat6yYKAto7vnFggGkvcCIA==
X-Received: by 2002:a17:907:3f18:b0:b04:45e1:5929 with SMTP id a640c23a62f3a-b07c35cd746mr507554266b.28.1757726304508;
        Fri, 12 Sep 2025 18:18:24 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd309sm475244766b.53.2025.09.12.18.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:18:24 -0700 (PDT)
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
Subject: [PATCH RESEND 35/62] init: make mount_root_generic static
Date: Sat, 13 Sep 2025 00:38:14 +0000
Message-ID: <20250913003842.41944-36-safinaskar@gmail.com>
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
 init/do_mounts.c | 2 +-
 init/do_mounts.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index 60ba8a633d32..c722351c991f 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -174,7 +174,7 @@ static int __init do_mount_root(const char *name, const char *fs,
 	return ret;
 }
 
-void __init mount_root_generic(char *name, char *pretty_name, int flags)
+static void __init mount_root_generic(char *name, char *pretty_name, int flags)
 {
 	struct page *page = alloc_page(GFP_KERNEL);
 	char *fs_names = page_address(page);
diff --git a/init/do_mounts.h b/init/do_mounts.h
index f3df9d697304..f291c30f7407 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -12,7 +12,6 @@
 #include <linux/task_work.h>
 #include <linux/file.h>
 
-void  mount_root_generic(char *name, char *pretty_name, int flags);
 void  mount_root(char *root_device_name);
 extern int root_mountflags;
 
-- 
2.47.2

