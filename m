Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75907267AF6
	for <linux-m68k@lists.linux-m68k.org>; Sun, 14 Sep 2025 03:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822268; cv=none; b=fJ5VLXS0ZEV+fPWJ/omkNp3fA7epFn/fZxpz2eGIzdVN0WUBFQkfmEiLzVbUq+2Z7nps/kAAR+VaWLRLey5vat9wyeHGcaK15J4lrmqVHw2XCr4f4pd6F2TlDgIJLSy3SBqpTN6gquz0tmqjCwmiAs8wpMSmcznj355lnbukIm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822268; c=relaxed/simple;
	bh=oKU/He6fgnkGxFwiXzfMSQvpywViA2YaDdh3D2HgJ0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WeBh0kZb7xHhInvs6SnAxlopQxe54QOxJg74+IULy5pbGs9hMkv66JaASUIxNIXyX/9ZKpdtUcW9wLy+LQSai+GtgxWj7MeQ+rI+nRwa7DyO1YUlY5nYHgl/JGO8J5Yp8SxsKx0Q++S3D6+kOMmCjw5jXK6bp9i51WIbHJ3edQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ce99Y6Cs; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce99Y6Cs"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b04ba3de760so404121566b.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 20:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822264; x=1758427064; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLgSWRUhBJ+Eb73oE0EhwiwscJ+skfUSjN5GwJ3O/gU=;
        b=ce99Y6CsQ8IEiKevvvUvC2CR4z3a8rarKHrLCDxYywl38osi1EMAneXNMc95Mv1gOB
         pWcdiSk3JcMyFevp8zdEia94oebFlhZ0K6uhWAVNbk4EztHHdYBJPxOC50BfX8ZeGvoY
         jkvWHLpfCtKUR5xLdAJKJltgx88siV33N0pnTbr+jdPLVdnxlgdq5Rsb1eF4FEduvWfR
         j4kWVdWcR3GcF5v8B8QEHTeCAdyDcxMmOn2jHL06PZhwwn6hlhOAtEZVJiPhA7bitZu1
         T84QFLssV+B4tSt4pooMLmQLzgunebx77N4LBv0mGeuVKi5pMolCbpzrhqdUQyEPudDE
         fxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822264; x=1758427064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLgSWRUhBJ+Eb73oE0EhwiwscJ+skfUSjN5GwJ3O/gU=;
        b=w1seEECnpXTXhUILMR/FqdMADAyib4jwdQrlF5t9t/RPoymIDGUDWsGliO/VeOQS0/
         manoI5esTT7mbaQi0xUgxkD0n0K8R/LCV6SJuT6KH+QySuH0EIR8cyp4m57UH0ohC24C
         6PGDJ5jDT+cd6P2B2X1B5nfl2xbh2Jp/VMYM79J6Z93u24RumYragHY+bn9fw6bbORQI
         OoSceZzttjY9Z/NAM7hS78KqHLSNg+r8PoCWRmgyUyJMI/rra2DvYWal+y2W8HySczrC
         mOy/g5+ADHSIBcjq1j4IJ7FSPMKT0RUx+h66wpkLCpIYPhH0pmKXR42tkmVO05ZW0011
         Z57A==
X-Forwarded-Encrypted: i=1; AJvYcCWUNhnpEocmGPRclfyaz9uPvefVLfqsRKFC8MVM42TluNgoZHZep8dzKRYLRYGPvzCSByolYfv5iwEN@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxvovF/Bh6idSsc1QZlE6yBw/PvRxZC5zxwKDi1UAsyFbPZKfOn
	QpNfbVGrW1eYCmAMzpRvKbBQCu7L8IEAqFA/4H8Us1uOJqaRPJ7f5505
X-Gm-Gg: ASbGncuDIZ+uVVNkD4SGYfVaU6VEHYm4ioA0VBlMJWWePZ0Ch31UNtXJJa/zgRn5V9d
	m+8pAdqEMmXAkRQ43OUXuNvpqSw5uJqFmoVPRxHbYzFRU3MEFTMkGkj2Y92W9UpgRxVWmWTjMD2
	wwqqhly6K/jS2RDdhnI9gMSKnT4xcRbkg6xT9ind5eFeSW0a7EAARSAaIb33slkwPg/Yti3YCCC
	dDR4zgG6EWtdJsEd41wz3TcoAF88/iStL1DxDfc4vvSTYlNTbTi4tvNTjqIeZed4AAeb+OL6TKz
	u9EECpYIxFQPIAp+GGgL+cjWWwMCuWDnZnFJq+Xj7nADJ8WzwGsHokSiLHrGNnVKEJpFfj77uOm
	++yMo8T0NIV6ZJgvUifCFHR6GjZefrQ==
X-Google-Smtp-Source: AGHT+IGOdPvfXOVddm8G6LJhfH2nNJDoTTLKR/3NE7kowNRoQPIuzhxmV+feQvXrrMYzfjsz5Ubcxg==
X-Received: by 2002:a17:906:a84d:b0:b07:cf04:8a43 with SMTP id a640c23a62f3a-b07cf049441mr520202566b.41.1757822263792;
        Sat, 13 Sep 2025 20:57:43 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b31287cesm676665366b.30.2025.09.13.20.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:57:43 -0700 (PDT)
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
Subject: [PATCH RESEND 50/62] init: rename ramdisk_command_access to initramfs_command_access
Date: Sun, 14 Sep 2025 06:57:38 +0300
Message-ID: <20250914035738.3741007-1-safinaskar@gmail.com>
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
 init/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/init/main.c b/init/main.c
index cbebd64f523c..a42f1f0fce84 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1587,11 +1587,11 @@ static noinline void __init kernel_init_freeable(void)
 	 * check if there is an early userspace init.  If yes, let it do all
 	 * the work
 	 */
-	int ramdisk_command_access;
-	ramdisk_command_access = init_eaccess(initramfs_execute_command);
-	if (ramdisk_command_access != 0) {
+	int initramfs_command_access;
+	initramfs_command_access = init_eaccess(initramfs_execute_command);
+	if (initramfs_command_access != 0) {
 		pr_warn("check access for rdinit=%s failed: %i, ignoring\n",
-			initramfs_execute_command, ramdisk_command_access);
+			initramfs_execute_command, initramfs_command_access);
 		initramfs_execute_command = NULL;
 		prepare_namespace();
 	}
-- 
2.47.2

