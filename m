Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA86E267B12
	for <linux-m68k@lists.linux-m68k.org>; Sun, 14 Sep 2025 03:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757821427; cv=none; b=Bc/bzmeM1OEi2pqAJ4ixppDlXttOMSegrS1ESDKrmrrRl4wTODudxc2tR7ip53JrNXuhVqAjHJB4A7k9NyMQKfpRfWBj/v2pDQHKitB19yAV7z/sRVz2PVFssxH/Q0ultnnSsMx3SVeXfF9WmnTYkNrdEsbgNUgDdyvJLGu930w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757821427; c=relaxed/simple;
	bh=Rey/ebl7WFu2BHJpZO0tlGb9Yvux/yHNtNSpgXJUf3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YC6JZeQBDKQW75LKnp82kGV52M+PmZw0iiVQy+JC9W/PnJwn+6VqDv1/PL+9E6aartdu5gTG45+7ZvoyrrWNM4PCFtvi3v95pVp7hcrBkg7aMMYuVY7a/2StmEUKqf6izkxWiJrbxWvzxq58txd3Aj0SAFzUTiuMdjE3h8EzrSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4vr3YMo; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4vr3YMo"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b07c38680b3so313489366b.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 20:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757821422; x=1758426222; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Edp+OfqM1e00xcpSWGvAGWC/LGQGu+BMiq7TC0KqX/w=;
        b=A4vr3YMosVn9QrY6p/f86VWyvKSbyZdbV8jj6zZs+pJqwXJESh996kQKSQ/uG5UQQm
         fWTvTY+q5XHcGY4YkRpfws+RkbjojWf6lNvLi/Ovi/dqin3+uFcC+yfNkTRLjdRreaAv
         g/mTAX7YqqNjVbQcxRnx8lJDjyJtVEX1ygBT3futnER2VTggSQZX7WNx01QESDL0BnFK
         0X4lsofFk80sqwkQsDQRS2dsnFB5LHcYg16NYmoVT7/SryOO6zNmCxE1j7Ihhph2huV0
         M+GQdKBa7GNjVxw5n1YnfiARjERrxMHo7d2nevGVX4s2k3DuN4KFY5UtVhmNxxoavzFb
         xKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757821422; x=1758426222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Edp+OfqM1e00xcpSWGvAGWC/LGQGu+BMiq7TC0KqX/w=;
        b=FKn54WgMx5fYZrbdloojgd8koVef+jfNgr6RDNMiLYFgYKweoc7oFJEl0/n1rW0Ag7
         zz78+YfYBQzCrymyCtioFdJQaKvZeOjLHV+HlfE3rOJKBS5pykhGpHSiXFy0028+IJnl
         /mHud3a9T4fYr+fyKYtuNqy/G/BrK1az8/l8Z+nzXg975We9ZU5V90onVFmSiBd7BgPh
         uZS7Taj0gddbzKV8m2gcEkjmT5oWh9RU/X6/ZI4p8i5gheoj+Y4jVaEhX9bHrWbt6Yb9
         Tby0lx5+TnKKqhjy/b2qhI13OK4bsPK6CGoM2lFe0ku+BWaDNDX6vmi3U+T15Ih5hcgq
         KoHQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5t4hNmtNVh64pp/1OGedDfBR4+VgNhBfq8uDw2ZpWslSZk5KZaj2Sbd641+hEnULdBn5EWHsKbK3U@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwiY+Fw0nV4aUU9grcTdAXdPaYRBqE1uNCndgh98V62lg80fEhu
	20Fes1b4E3sN/3WjYv/JiKyL/augwghRgIaQjsNVx2MGPjZajk8Me7CD
X-Gm-Gg: ASbGnctetdio3Xh9scEokNHUXwLK8Ks+eAHLSrpFdp/nJNR8U2MxHUvnGeIV9/vsMYy
	2JW5n95W6dJvMOBTGHjyZ2cubaLJ3aioUPrRL918olZU0uVnOnByLwbE42gTctcvu9GtE7Dz+Xr
	suCDS1KwcqXwoiFaSzu19ZEg77q6py0z39qR7fPNAgGnB2Y690Ioi3/eT7qTukQFTNmW1TzoZi/
	DiNjgkdiyamD9/ZXk3OWWzPbTo0WPVezqmC6LJeSDxddvONP/bwDCV7uvKXQC5JE6FQ7MNq0Wx6
	M73yrbnc+7FAnEIRPQFqLgGCQdQIEk/4Gx3ALezTqsDJtNk9wE8FGSZUw9cR9uf9BlfgwbaCPlh
	swIe1rsr0SwPtQKIRjmw=
X-Google-Smtp-Source: AGHT+IET6lw3qY9XyvNvb3pybcnRN4nnQ2bci5TeiF0EBvfDGIL/USbY9x3ZkIUotRlW6z+hFZZ7Dw==
X-Received: by 2002:a17:907:72c9:b0:af9:6bfb:58b7 with SMTP id a640c23a62f3a-b07c354e9b4mr721980466b.5.1757821422077;
        Sat, 13 Sep 2025 20:43:42 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07d2870da1sm345137366b.13.2025.09.13.20.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:43:40 -0700 (PDT)
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
Subject: [PATCH RESEND 37/62] init: remove root_mountflags from init/do_mounts.h
Date: Sun, 14 Sep 2025 06:43:35 +0300
Message-ID: <20250914034335.3506706-1-safinaskar@gmail.com>
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

It is already declared in include/linux/kernel.h

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/do_mounts.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/init/do_mounts.h b/init/do_mounts.h
index 90422fb07c02..e225d594dd06 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -12,8 +12,6 @@
 #include <linux/task_work.h>
 #include <linux/file.h>
 
-extern int root_mountflags;
-
 /* Ensure that async file closing finished to prevent spurious errors. */
 static inline void init_flush_fput(void)
 {
-- 
2.47.2

