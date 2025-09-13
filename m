Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F912199FAB
	for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 01:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757725777; cv=none; b=AsfSj4Ky9ZiCu9vGFCGdHqZQxrnetJFOBQvPkV7OIRvGBxJkP3ybmLqdOd4R4vow+n10FabaoNhHCyOhlngGx/nGlXRhzmcCYu0N5pu8uh2d7FM86oSZoddoi4Iv8OUUJCxbc8l84JgzdTbCVCk9P4iqAAfnZQ+dLOd6/w1D4yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757725777; c=relaxed/simple;
	bh=OB8rvKJ/i9Py5pg6KTYPvKorTOVHkmUl23UIALP6A5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H3IkuMcnIeGC81+XI0L3eYRWmSWrdtQbdlUKa0b5RCYPM5BHKdko85vatgT6LacGJOkv4Wr/8W5V1+Z6d5cFdhGWV2TXR4CdJNhG7E1J9rvz7Mefr64rQh30A5ht/gCqQC2su/9839mkDeSML3LMWuWT/lQm6IO1/ShaCtPQqaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6wh5NYf; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6wh5NYf"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b042cc39551so393281866b.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Sep 2025 18:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725772; x=1758330572; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pGfjPJCmTgFBTQIPRnE53dxXo3SbfDBvMh6uq5akyU=;
        b=C6wh5NYfrCROFauN580akYyVD5oKh5qTVh5agBNmQQYM4NYi51tQNjuoCvvY7xO13p
         W23Kp5gjhoMWsDFowrZNzmMcKBp2fLI1011vMpsV2cI29MjJHH6CoRFF6BvTGemFeANk
         3fdcyXx0JOENuDlaMNu7xWwH2gZr/k8WtZduQK94yJFlk3hhWiLI9pglEykJXm1UqvJq
         MojECzvOvmcVC0F7vNM7HTE8RTSLkJ+9gGcNGjTTig4Nh5/lLxoO7Psccp0w36Gf2Waj
         fEIHBc2Ug4UzZ8XROGgekeo2zhrCLdZtinI7yFHV7xsFRcYTSl84GXN6kMAjG069xbqn
         YZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725772; x=1758330572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pGfjPJCmTgFBTQIPRnE53dxXo3SbfDBvMh6uq5akyU=;
        b=D0fe7CePrBuMcqHcdH3vth35NqvPS9/IReS0Ah6G3DmkhHf62rxTGx/UJb+KdRt3zf
         z/gP0Bu/S77W3zC1oMska45tb/CSKpH50KhsQGSvyqGL947UASjNwcqkDjvGkSe2Ypdf
         /hVStcUfkdZyuDubeNayw65HyU+wFM9cC0WsVZClEUha4zoisWODAJDZdK8+pFHCBYkH
         GguCDjOkt0k+0yV7wkagdviPzG5L+DWCiN7q5XVzArAHQDi09UqcAJV5uvs8zyYaZPJf
         x6Lj/Leq49FFGSHOrFM0gnUBCRIKAhclFMvrOXNSL44QWkMFxe4vNi5oA32+z4Bq8J56
         9ASw==
X-Forwarded-Encrypted: i=1; AJvYcCWDGAjh+uTc5dubFkH6iZ+O7oOe5HNO0unyUzhubsoIgCYkfCztuJnOxei1tedlZa2/Ugt2/bLkumSI@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwgvwETZIKpQC1i4bTBWZIeo/UItRq2+gWqzeUg9sKI5Xi+qBo1
	F4Y/3SplZbTGkjVZFt+96yc/ny9hrjAl7q42j/JcQ0QLxB6RkCTPrWkA
X-Gm-Gg: ASbGncuSj1Bju/psQQI/ObwkOYOlsKFy4zcM9OXQqf5adCVZnuxjbXSSaxw6ugIR099
	N4j7axgB0kWtPEyg7gus0TPiU93K0l5tsL15HzrbdIrCabYx6W+7+zm4nAohPVdjp8DI05xp3pR
	/g3+QVVasNPd2a7AJzDi9FxPAngGoDJLvVxSgUEIwoZ9lq4aB3VBG3JiBra2k+RsOlEO5RY3wJ7
	88EOUT3VtBWxpcBtRomzdNx1J6eYlCieS4B1JrQ/nZ+S1KLX2GA0NTORGn6WvQ/x0oxMngRR7G5
	AUR03hJ2wthsJ2UwWXB5yiVu1HXS13aMKSJXhlagX4asnXWeQm0Ksq8sFgUjtyyC56KxIuMOzGa
	uBL5W/V9k1tQ3YxAxxVQ=
X-Google-Smtp-Source: AGHT+IHrHcZIQpP/M06nOcq3Snl8FXkxUTmgmKKbhKMXWfrO9iWe4P5Ilwjf7ocqvFrLGTk9+k818w==
X-Received: by 2002:a17:907:3d0c:b0:b04:250d:ee7 with SMTP id a640c23a62f3a-b07c37dca1emr487688066b.31.1757725771595;
        Fri, 12 Sep 2025 18:09:31 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07da7a8918sm104574066b.56.2025.09.12.18.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:09:31 -0700 (PDT)
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
Subject: [PATCH RESEND 27/62] init: alpha: remove "extern unsigned long initrd_start, initrd_end"
Date: Sat, 13 Sep 2025 00:38:06 +0000
Message-ID: <20250913003842.41944-28-safinaskar@gmail.com>
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

These variables already declared in <linux/initrd.h>, which is
included

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/alpha/kernel/core_irongate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/alpha/kernel/core_irongate.c b/arch/alpha/kernel/core_irongate.c
index 05dc4c1b9074..3411564144ae 100644
--- a/arch/alpha/kernel/core_irongate.c
+++ b/arch/alpha/kernel/core_irongate.c
@@ -225,8 +225,6 @@ albacore_init_arch(void)
 	alpha_mv.min_mem_address = pci_mem;
 	if (memtop > pci_mem) {
 #ifdef CONFIG_BLK_DEV_INITRD
-		extern unsigned long initrd_start, initrd_end;
-
 		/* Move the initrd out of the way. */
 		if (initrd_end && __pa(initrd_end) > pci_mem) {
 			unsigned long size;
-- 
2.47.2

