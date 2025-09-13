Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FDD2B9A7
	for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 00:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757724595; cv=none; b=ld5x3GPXGhmUyTEPK9VkMc6x+KSD4E5Z1BA/B8pBSu+mgZ95H1AiOQ1lbH/utG1k6WUt+CWrLyRo4p4PrH6DjgZakXK4yeIWFAcr616uJG+tynOV59gc0EhmFYtH2T41uOUCmUvv8diuCa/PZRMAqjP6pLbr4nyDVVJk4uB+9XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757724595; c=relaxed/simple;
	bh=aIH0UEBp9jrH7zT+VD2BpCtGu5L0ukANS11y+zY/wiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=USr4RZMgx1BbSo9A07bOMP9052cyxSVd4mN3ATerTYjU1DSXo4xBL8U9xkLxNDJaAvRRsizOdQ3/iKOdsGjr7JazjpfVBeHZ24pah+nMKL2aa/niTqiIVQTIH0RBFYBT7AqpVyYUK+T+IsQb7R6IGWff/++gKGJHFAW1Y5ZBlp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKVMc3Hp; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKVMc3Hp"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62f0411577aso364992a12.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Sep 2025 17:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724592; x=1758329392; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6cH8q1TrVQNxjzjuQXybOp7uw+/s7mQTk4MQOvceKM=;
        b=YKVMc3HpvzeYPlI2jPX/OPDSZ0BA8UvMIynStaHqyYv479Bti11eHR5Pjz8ROtkUIq
         uGUkMzQHK5Kbhwn68tToFh2uZ6se8W2pkxLbMI8a72RDZ00aLlBC3dZuhwgM/BRD1Spq
         b/TiUoXslWhPh7SybFR+r5a2xj4ZSeuGSFPtV+N8Z5Rsj3RW4J8Py9wr/TDeN/wXV/HM
         P9FtgiWdH4yebDtcQ6olIV0zcOGXhA6CKInUI7KJzLqNtF68qPhcxBrrWvm8vUfnZbqC
         o2fOagAI8brQBwF3OiqNxi1garIxhiMUGzUV0QF1Ro2KF0Xmvr9563LL284k1fYiNkpR
         QIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724592; x=1758329392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6cH8q1TrVQNxjzjuQXybOp7uw+/s7mQTk4MQOvceKM=;
        b=jRNGLs6GRicjsory8WKboKZDh0JcwONgx+xaJRVPytizyVuGfdesPMNj5c4fSpJzif
         6qq/uNBQCqbfUSkcM/44ETlX21IrUQvwNnfCXgrLugN1gPyGt5t7S6enbb8P6VcgzZhT
         81Rm32UqZYErR52XK9cEhME4UWYxVh5pAULoowLe26Be8GHX/Is/dS8BVpbI7I+6qrMI
         0RBnFKzSMMXITJjwiBNdNDnpTS77mczdSDoz5iVFsaD4PjxeNktlApKC1KBdxCQcfQlJ
         VlOXrCcwM5PS1YqoKxkqK7MR3rwTeOtaUbIrutOBYmVDMu7uVa2xvUBPgqc0WetHpSuT
         W2zQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9Jzmo08EpDJMw2b24uxItMH4hl9rCc9lRGoFDcIFSdqfYOTv+QvGJZc4Hyn3E7zveWDpZ0UA6BCTF@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzW4ioVjyFri0QQR4YuhXZ+24SEgXVGI+J8UyL5tDKi9t2iPOb8
	yk4v8Zv7i9I6/de2PxnnlseHiRnX+oAMLNgX496C46K6WxlTdMkKiKTG
X-Gm-Gg: ASbGncv3gGySrW4JSFQhCJdWBRXs4lQyiQBsctfSvJW241OqHUO5SEuvZ9ReVfzD0yB
	zuP6bqyTCTvsXb5cvpqu+ZZK9uLzd5La1kUC5UCibAcaATx82cEgnqZEbWB61hYachwjSRHae0Y
	SyTMunAJ7uJsH6gRiYmZIdtW+mCAuIUc/rYzs5p1SZTd51BiCM2Q9bp/DrFOTNmjVqZNDzjToJb
	c0ZpPr2O+zZsjEbXSCjcjKFLxt5oRLdF2fsl7weFOej7rOezTJwuECH9IgcYMl7nPpHdZtDPLz9
	eSR0pbUNHRRgfXDrg+zPrgVsl1qAY73J/xTA5kHwWhi1xQylNvQD8qHRBQzpsnvrzpJaWWycwEp
	R7fUBCei7SlNwJR7SUyxXZ85mrudd4A==
X-Google-Smtp-Source: AGHT+IFuaD6uE53o0kMUFqkBYFUIpIv4YZNYfnndGaXs7B0K4+B96SRU2dTVgEWhisS3xuLKgCtRtQ==
X-Received: by 2002:a05:6402:4316:b0:62e:df3b:79a6 with SMTP id 4fb4d7f45d1cf-62edf3b81cemr3814693a12.1.1757724591635;
        Fri, 12 Sep 2025 17:49:51 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33f3b6csm4149162a12.32.2025.09.12.17.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:49:51 -0700 (PDT)
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
Subject: [PATCH RESEND 09/62] arm: init: document rd_start (in param_struct) as obsolete
Date: Sat, 13 Sep 2025 00:37:48 +0000
Message-ID: <20250913003842.41944-10-safinaskar@gmail.com>
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

It is unused now

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/arch/arm/setup.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm/setup.rst b/Documentation/arch/arm/setup.rst
index be77d4b2aac1..01257f30d489 100644
--- a/Documentation/arch/arm/setup.rst
+++ b/Documentation/arch/arm/setup.rst
@@ -86,7 +86,7 @@ below:
    initial ramdisk.
 
  rd_start
-   Start address in sectors of the ramdisk image on a floppy disk.
+   This is now obsolete, and should not be used.
 
  system_rev
    system revision number.
-- 
2.47.2

