Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5188926463A
	for <linux-m68k@lists.linux-m68k.org>; Sun, 14 Sep 2025 03:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822198; cv=none; b=aBbg6JzcodM+AI2N0PWf2mVOa4eygNLq2clWYtC4PvhXs1ZQXORQRRwEMFKRUlEkAdPFuPKLBlg//zAyDILzE2jiYHee1HKnP550fvihB8OwYCnCxG/JsnqcsIi5QKB44dmxfZ2Q5I26OQAroSlLWoM4wonagm2MjgXYfvH+fv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822198; c=relaxed/simple;
	bh=Z/NLntZrolo0ykWAS3sXBn6sCvdr4Jv7RqhYT4lljv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8J9GWdL/8CRFw9wmb6KkKTMCbz6d02FPGtFicavFvKsALVYuwI4rANT9dWFnf2W6rG6o0w/yZNEfHJVhIAV19pk8muwmQ5LF0TZG0QhWbPN7QrxyhSTKHVIFGE0L2r1qkmGQpzZNyeP+ZKWiv3+/NxgZPygYS7iBnl1lWnKz5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kK2wm69a; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kK2wm69a"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62f0411577aso1757489a12.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 20:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822193; x=1758426993; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukssGXUYVXOD0e/noqLCBxDtEOgQieVYL/7Zl394zX0=;
        b=kK2wm69a0JnQPTy9XHY5Kot9zE0XLmGUFkMWyOjS9c0PWZ9QMSUjdoLf/xdrzFSFCC
         zhlNPbmNoh0NUnYYK0miKgoUv5H8CQX4v2qXn1niYmHzRn3wr8mU018XpIqAoNyRmbxe
         dn+yj3DkQxcBs+4V9aC/3mccRvgymicI44rU1kmrqOg+025HX46Qn7vLBtzH976NFBWv
         8sOWfwK1n345cIRo5o5E/2XBPIbhpC+15ijrenY/qxt7/da2l9gnDkWEQ9WbuzHr9Tdl
         mUKGrfKuzJBxB7pq1n0u3458DCEnDcHCMPP1Me0JwpDdKWeUIjILhOlfeykAWlr+37Sm
         +jTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822193; x=1758426993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukssGXUYVXOD0e/noqLCBxDtEOgQieVYL/7Zl394zX0=;
        b=ev17AC9MhByAWTADFN6TGquj4XIWNEVFhsAzNZu9VLwyQr/afvzj+MlRePyjJbpkwU
         HY1rfwtjMt7jf6vpNlix6HAbMNKcBh0Ab3SK0LHSbSqCsxsRJhE13gT1eXiW6QaDYBsj
         Re5RiXvhEBSSRj6iw6OTzOOzy1dLpBffyTL0WkrfZ71tXaUIV0Mp6/n+htjvzaM6pxJc
         f+/lQL7ZKSs0sqfXa0DlwlUkjvgX+CyK1XUp0st67fzAvwL4oz7PfvWhTNMEs1jcOPmN
         qwu1Ce0uILKeGGrhbH/zRNUD3KQkqJHndXNf8qXTLd3CeV7ZRlKnS+IwJmp8/U8qLp17
         QdRg==
X-Forwarded-Encrypted: i=1; AJvYcCXBheUaAW1R+UcSkEAq+7CcaK6BVnJNDgDuJMm2FsfmE1Vf/Bm3dfyYYgGSDFvPjhGlGbV9UtH8/qTy@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw0f7pm/b40OeqpPqOJWBmmx8tV3fN/wZCY2AXl4KvhWgrGfYPU
	rG6uGArQYp4+cRFq9IKoMhdVQneSYPEeOCXAB6ioX46pOd0MBn07+fZE
X-Gm-Gg: ASbGnctaUqak3dYK6Bt3esHsYFVxHmGKiuaZ9zMjSTlQ2A6DpbBKKL9xKpXrhXqVT8a
	zf/XZF3qpTE9XgotGyvVLLmUOABaLmA8Zt2ZTWD0qxXmzNL9yhMqSLC2f3gUc9dChNSvBH+1VMs
	nMBI+HA9OJW81IuJG1IOHKd3/oaKXqB19FGxr6Zu8zjSQS5ZXWcWdz5hp5vkSd+MyHHBW7k/b9+
	DsNrC+EsaTt4f1kQpoXQTe/6t01vtjnzfv8pwK5Vls/0yU6Jq16qEuQsdh4dG58KgcslqThsgIi
	A78Z11exLC8nN3ic4eNaZuvHTvLb/SClUVZUHMX+FTWA/84lQQCLMA8nEfcWQtKwE1xlD4z4hgA
	xeVN2X2uMCccM0nLeZ7Y=
X-Google-Smtp-Source: AGHT+IEh42ac6WqH282xp0DieWYXKfg+ycti4urbWWAb1GXqLLNoKNDdAlfHKjc5T4lrTIZzL6YLwA==
X-Received: by 2002:a05:6402:2815:b0:61c:e1d6:6bf6 with SMTP id 4fb4d7f45d1cf-62ed80fd3fdmr8226990a12.7.1757822192729;
        Sat, 13 Sep 2025 20:56:32 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33ad2d6sm6510443a12.18.2025.09.13.20.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:56:32 -0700 (PDT)
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
Subject: [PATCH RESEND 48/62] init: fix comment
Date: Sun, 14 Sep 2025 06:56:26 +0300
Message-ID: <20250914035626.3718268-1-safinaskar@gmail.com>
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

Make #endif match #ifdef

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/initramfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index cf19b7c0c358..30e94ebf4902 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -717,7 +717,7 @@ static inline bool kexec_free_initrd(void)
 {
 	return false;
 }
-#endif /* CONFIG_KEXEC_CORE */
+#endif /* CONFIG_CRASH_RESERVE */
 
 static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 {
-- 
2.47.2

