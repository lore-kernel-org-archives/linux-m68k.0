Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010FB267B01
	for <linux-m68k@lists.linux-m68k.org>; Sun, 14 Sep 2025 03:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757821873; cv=none; b=iv33lQGT/dLpRdpfP/1ZK9JWXcK2RY2C2rpQ3h99mRfJx4JzIDIHlhkuPR++PcSUxiZ+rXbPh4/Ff+im9dOMtnGRpJLLuZl0Z1W4yDjJ2ozOYGY2JlyxChHoNnbOvUbUu/hIpBaY+7jXEiosfWq3TmM0s4FhQfh6d8Jmwwf5Gck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757821873; c=relaxed/simple;
	bh=0pa06GJsqjKCCDz/UM3o5nwPqkgP4CqvzP324rR3v40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A+Qf2KqQ6H7LhFaPET+9CXi6f3H+8ybOtrm7PiHZAnel9S7dBpFV4puokuYWZiPbBTJAcDnX01fVkR8bxh25x2v3AlIh3F6BoQFIIXjSV/m9mxzrUN7sMuQG/ej9wv7ncpB+bEpIxJRViJq9aigVC8X77IfufXje6yi0fbHqeHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MR16B3k6; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MR16B3k6"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b0aaa7ea90fso92709466b.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 20:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757821868; x=1758426668; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgyNirakXvU+05rXEnyXXLzO67oYWYN1IcZHpjjqHUg=;
        b=MR16B3k6q8Fn3wWMaDUID3y8rXe25ndkwlTjCbYIyuGjROsjEE49nnrEj4mgbPlQbA
         0ek9XWcXs81qglV+E/emmfvs8CBVGRLCyHXXh2CAeBuTJCbeqFdyjVTSl+qc3J1QWmey
         DHsocrN2XWqylzl1FYm40QNzqdLI01ysEa11ahh7nHCGnS8kV9GeeMvJ3hWb5FmfVigt
         EjWm0Utycn+M70t8lpPDLh0s9waxFsDcQrd1MD8PJXaEKjU3dENT174Jek4d+BXrgIid
         k3Puyyigubo30dfLnrhfkFUfTVv8CMCwmQWLFWULkNKOUf5fCfSgR2n4IJO+jV1LHzve
         TKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757821868; x=1758426668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgyNirakXvU+05rXEnyXXLzO67oYWYN1IcZHpjjqHUg=;
        b=QTIvIs1oEmz31KVuz2Txe6uu8+wwv8UjOdk57k+/yzVxRrAFVdNa1gNIMuVMjGRi3Q
         uZfP4sz0vrsC2Qlw7vZ2GWSs56UGDVoOY2jZAeDv56rN+fd1OzEPNJWmw4e/bGyxtYjH
         xVWTzR/90WQopMyYnivxgHZPDQZr79gp3etIdyB4lk1AwYFwFZp5rWGG58jbeRQA5Wdj
         6H4JLZgD14SaNPLfm6szXWuAkcLK0GABGNGoXBFN26RB/3RPoPhxAAiZcesuFnDZUAV3
         piTkFMyBpk7Wq0Wd9Mu0/11YQ9B5yJ8W0UNIb1S7A5e8NBdWbL0aCi5M8NWY6z3dyO23
         sJEg==
X-Forwarded-Encrypted: i=1; AJvYcCVpF5UXjKUFA166j/pztFtZbwyt/JLXfxCuvUNKCh5WqxgFSlYnPo/qoWWB6qf3ANYQZZ9W/cCa5uKE@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwGiJi1WM566IKbbTKQWQaDLi4l+CdigXJ1kOrl6s1BmP9fBrS/
	60uPPYy8qAqa0IhL+oGvL9YJeKAxZD1zvWynYpHIsb7rpFk/yf++f3qp
X-Gm-Gg: ASbGncvO4wV/xMm5q5j2jsdjch1awfi/YXPastVIaDFM7dD0Tc/jziZIhWwKKh1Kj86
	4eLetIugJRKEybpcsp7bDZq0FzbnaFqTOZUBBphxXja3X7URGMXPrcGowRWnj83RIZ7hVooug9b
	C3k+tlTFS3T1PE4Dyjh75fCD9z2q6QKPMovLxB/DGzy8wC3DXO6rhghx5VBR3G+qQNrwg5dsxIV
	N8MSo615etg8FHzJUkhDxGeMxeqJfbmavf4GQlySr5u8ef4LoM3mz5g0CzwU0gWgZtnhtNzm/Lx
	mjtJ2mdzdRtS5SHcQ90hVkM9Ii57KIM5zt62HEz3/325bdnczE8YhjCqItSSLDSCaoKwSGa8QbE
	wd/WdKKItQJJQeSFALNU=
X-Google-Smtp-Source: AGHT+IGYiK6likOM/TjE1BLl/jI3UX22nGT0EQIxF87CUWohx3tkGnMcAa8PzC4lwu+rbC2577QTfw==
X-Received: by 2002:a17:906:46c7:b0:b07:da17:79fd with SMTP id a640c23a62f3a-b07da178367mr507229866b.17.1757821868321;
        Sat, 13 Sep 2025 20:51:08 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b3347b6fsm679031866b.111.2025.09.13.20.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:51:07 -0700 (PDT)
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
Subject: [PATCH RESEND 39/62] init: make console_on_rootfs static
Date: Sun, 14 Sep 2025 06:51:03 +0300
Message-ID: <20250914035103.3619203-1-safinaskar@gmail.com>
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
 include/linux/initrd.h | 2 --
 init/main.c            | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index 364b603215ac..55239701c4e0 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -23,6 +23,4 @@ extern unsigned long phys_external_initramfs_size;
 extern char __builtin_initramfs_start[];
 extern unsigned long __builtin_initramfs_size;
 
-void console_on_rootfs(void);
-
 #endif /* __LINUX_INITRD_H */
diff --git a/init/main.c b/init/main.c
index 58a7199c81f7..f119460bf8e1 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1533,7 +1533,7 @@ static int __ref kernel_init(void *unused)
 }
 
 /* Open /dev/console, for stdin/stdout/stderr, this should never fail */
-void __init console_on_rootfs(void)
+static void __init console_on_rootfs(void)
 {
 	struct file *file = filp_open("/dev/console", O_RDWR, 0);
 
-- 
2.47.2

