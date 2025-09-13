Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E291A9FBE
	for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 01:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757726375; cv=none; b=gOFLFRUadaNKOxhiC+Fj7uJvfumHvAKE3xQQXx5ExvHaEnFIrQr7wVM0MEYvk82pcxv/ySXB1busISS4YcYXziN2LY1DUlb4S8JCiKc49VWGiEcZOWMMMsI4QGgcttL2E9+lefRbv3gfs7CgTd5BWvlRwRFczIVI3rVB7LKn/G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757726375; c=relaxed/simple;
	bh=0dZBfgRsarIoSXxUVt0yhSx8VT0ilXZcRzH3UEVxVxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E68ljv0wItd3NHhW7Yf2NO4FPE/SbGYwvOcSiXkiuVprey53+ZUUSdwkt+LT2tne/zTPQdfIHOVm6l3wVEn2mDLYAYd4j6mnniDM4z+Ihkgebe1TeqAGRUx//h0u5GKJeo8Utzypumq27RyWr6TxJ8CbpI+h/VK/Pp5tZaHKhqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PeyWwonY; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PeyWwonY"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b07c38680b3so228178566b.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Sep 2025 18:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757726370; x=1758331170; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01GQX+A5wcxVOfa45EtHUSgPI4YB4B2sFvA+zw7J76I=;
        b=PeyWwonY6qR7e9I0t7uzEOkQlcULH+tbHB2tBKyhA8jUwhIQG5LkGlTyCUYR3VqA5o
         jXoYHqiUxXhY/C4M1GQPVE3ukrfZxNOd2O+4zs1taJvxdH30/dJcEfjyh2Psc5kgv68V
         ZiypKWPO2BQgr00NJisRvZCgg9L/J44k9grqj4abpPS7qjRaSvCviBstcvJBavHOQo07
         KQdI5YN07I66SWRpIwTWtmU8EpZE3RZQeFUjxSqZeJso6YAXNMtQFS+bD9ttuCFpL+Dw
         sEbnb9YOoR8L0maweoIb/lXLyzY3zA+I7tALt1KGh6Fk86UJDAygzyAP3EFwDKpdkZD2
         JwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757726370; x=1758331170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01GQX+A5wcxVOfa45EtHUSgPI4YB4B2sFvA+zw7J76I=;
        b=i8sgo9iMDGLvheUByVa7yiDqIbGLPmTt0lv8aY1wxgwEU2fS6kWQvX8eQ7r73KSs1j
         dJiMeQkERcq4spWHQXKaQ1O/kPkOYxLoOoKWam0ymHO1dsukFk21xv9N2ADJ5L0OGKUl
         RhMR9flS1hT9gwD6zCah2ESQqI28tUK8z/2T0Ze4iDruOKoQC46dmhKels9CxbYEFkjI
         NUTJ2mteC+kySzIdM50z3edxNSVBf7h0jmbcJq2mA2DDj/wWOaOYdDoIp2DDKTKM0x31
         px7sHYDkuMqz+DWAPhRm/Vks/75HTsU4JcZBnR1df3wnGdB0mZ58pN5APnBq56xh8lqO
         ZhSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYsIGwddcUkjOZsuUINZNy7RgJoe++eWtI6oxg5mYBix+SyH6IyDc3Xrtr4oUHpmOW2jR5RQV6KvY+@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy7EYaaioSU6QVGCNyIM5zaILycQ90GaulexvvVEWvBSAdbV7Gq
	0k2aSvLZM43JjosU6QgtWTwC1vcq3+A8USxFDI4y/zodaWUZZXOR+2gA
X-Gm-Gg: ASbGncvHWYoPi3j4R5+dSVVnB2J3ND9ajFjroYo/chPr0i9971IebtJnXzu/6Nz2Atc
	Gfwk7MeXkyl7RLQETVeBF/7f7Ytme2oSTSQ8hLdEWEY4WzoYczfIKBgqCjwMWwJWiZXerumApvV
	PN6PLonNr1hPW6yGEC7bojjnjJEf+TB8uBHDekGs8N7nKY53qrRmuUDL4RGn2HV8LnDga2UXVM9
	5BLgizzUCyBU2g9aGI6Y/qZdiXXlHREgeI2/37yZ/26Fx2QEwAx7xDacZdI1PDQ/kOyacwv3dD/
	f+HlQc7iXtuaiT+2WhWGn+GPziUbXWBcyYrYJuU/zKq8Rg/HKDgWcY9Pb1dsBGjNmjRO3Q7PYxe
	LsfvF0v62v3UEAz9wtxFYMe4KRQyWKA==
X-Google-Smtp-Source: AGHT+IEzeVwYKpSq5hVwsza+AqQmwMGGceGxnApLyMFPwDCsoulMW4PoMJQ37ACnH/5BZ1euJLookQ==
X-Received: by 2002:a17:906:2493:b0:b04:9822:1ab4 with SMTP id a640c23a62f3a-b07c35fb2e4mr458597866b.27.1757726369974;
        Fri, 12 Sep 2025 18:19:29 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd5bfsm465661666b.63.2025.09.12.18.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:19:29 -0700 (PDT)
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
Subject: [PATCH RESEND 36/62] init: make mount_root static
Date: Sat, 13 Sep 2025 00:38:15 +0000
Message-ID: <20250913003842.41944-37-safinaskar@gmail.com>
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
index c722351c991f..7ec5ee5a5c19 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -381,7 +381,7 @@ static inline void mount_block_root(char *root_device_name)
 }
 #endif /* CONFIG_BLOCK */
 
-void __init mount_root(char *root_device_name)
+static void __init mount_root(char *root_device_name)
 {
 	switch (ROOT_DEV) {
 	case Root_NFS:
diff --git a/init/do_mounts.h b/init/do_mounts.h
index f291c30f7407..90422fb07c02 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -12,7 +12,6 @@
 #include <linux/task_work.h>
 #include <linux/file.h>
 
-void  mount_root(char *root_device_name);
 extern int root_mountflags;
 
 /* Ensure that async file closing finished to prevent spurious errors. */
-- 
2.47.2

