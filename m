Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD282459F3
	for <linux-m68k@lists.linux-m68k.org>; Sun, 14 Sep 2025 03:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822052; cv=none; b=Yc5fyQGiIMWhLAYXx/szWDagbym5baQhFY7hnLo9E1wIeGRxituFxYFovX+Mq7tg90WlY0pBrA5n7ysJ4v6BdyTOLUxw81J9C8ajbjd6r415m6+t1Agkvf95bnihyhtWqbLYSEtlZDjwhguDVozxpgMjHZDNIsOy6tv6HZ2Lvx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822052; c=relaxed/simple;
	bh=E3G8T/3zLMm3x5kad8USEbJCkxfjt487WTCm3NfxUQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xfxj5nwo0ieU4X9yw0BBbBLm62/97S3r35DT1ol9IQxLRIJDvngmg2sK3i8sFqdn6TVUODlUpvSKpXdVV37aH3MNtfnqxEPLsQL0ZzSO1ihV9esJoj8kjjl1n+t0QDCnARmiZJ1jau5K3VvxWi/28cZ/2Chg/mnsg1VHwAecFbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTwYKul7; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTwYKul7"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b042cc3954fso566981066b.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 20:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822048; x=1758426848; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0YiDU4Bzw7IKNW2/fgCfvKW6iRx1DQ4l7Ssn455PQA=;
        b=lTwYKul7TcBjIL4ZE6HzXFXbe0M68PLV6SphD6I7xCQqLhH61f5uU70/O33apZ04Cn
         oqH0oUwO8khKsMsuQSdvBNBerDLud+j/0ePXCSVTo7L+5Myr45UDV23zD11/BX6niIOH
         KBCzvT9eRF8XYa0oxY2SWd3wWF6nWgWsqIX8ohrdd478Jocl5cr1zF3bhfLPDqowtLzC
         7InaGLBMh0MKxYLx8MuqP7dWPX9qAJI1939zYwQxWj/lsTTjXNARcMG7DoB4NCsPT8aP
         ajSghs8opsWMU28Y4MgYWatXyOyhKd8+/Nv0/gqWqs/W6Oqd3RmcDWB9wRp352c9VA2P
         EwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822048; x=1758426848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0YiDU4Bzw7IKNW2/fgCfvKW6iRx1DQ4l7Ssn455PQA=;
        b=Xr9qgvVYIqqP47mdGrfF97N0V4l2A9iff8J8/XzCkF31inWlRHMZifc5IhHed0mzFO
         WNzOPheiRn55VQm40sl9sb2kDrclx/Tsy53MpwTFyBgAJoQUnz2Qxcz+U2oslmH6apOy
         VXbh4WLyIjoOf67W0FoFlgZFxai/uWse6V0aKZvlQwuZ3/GrTjPtICB1FAdIRy+KlJHB
         LPKZh0uOJJk3Uv2g09R6R7+9mtQTFheCZjKCcCHxvQpYxeyV2xEWNXxlNIKdX7bImCnp
         S5367S3ngQRdlXXghPCBAE0QlvlNCs5qLo40pMgz+BK23SiYwD1MZatMghO/s0fMATHD
         teUA==
X-Forwarded-Encrypted: i=1; AJvYcCXPB2IDuXvDhL1rtVh3R7ngWI2f/ZGOwgPCknriQqDuoO78NELuLAdKTcf9bdWNaSEH5kebNLYhYiix@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyjtDXCAqadNST2r6FwPL+X2jCEahS8ZSTO6yX2Ri677jcvyVru
	AqMcDjHj1JGbmzdt9yWBNTCqejXapmhUL+NFReUxvZDa1Ub5TTcnpllZ
X-Gm-Gg: ASbGncsNmt13H31PeVetde6cfXv+96D5Bw5KWiTqquDf/FXDsspmG+s0XEdnYTEU7Ya
	Glu0E5kujNdjE+ura9DWB28hbZd5M5YnTuaP4hOxwnSo5nsAJGNvoWq9nJUfvSl06XfKUTKZEMg
	RrV7yNW4zVyINSQla3eYCq/k4cMEKt2s6a0WnDnS9IUUUXRxS0aFI16yeOFycvCIEacu5c2uqk0
	e1KFVVXn8tHWwiJY9QHES5rwKQr2d6duuqMLj+7VogPhmGGl7QgB8qmUgVPBxlnJ8y9KtErP3te
	9Lci9FgYCix0qMN1pVUFB11m4CHfXMv2TVsEpunQEAyPj0h+YMHOmenL3jJpFfAP970gOTriN2H
	G/NdiQaPoqqKGDxSt9WrelI6F4nDtEA==
X-Google-Smtp-Source: AGHT+IEVLkeZlLSkzoTpPLzlBRvNTQ9m/bl133jXYp2zZldNvB+tlYKH8pXYzZ5ISfOO2+UjGM6RFg==
X-Received: by 2002:a17:907:e8d:b0:b0e:3d88:27fd with SMTP id a640c23a62f3a-b0e3d97e027mr75192266b.8.1757822048020;
        Sat, 13 Sep 2025 20:54:08 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07da7a8918sm303079766b.56.2025.09.13.20.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:54:07 -0700 (PDT)
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
Subject: [PATCH RESEND 44/62] doc: kernel-parameters: remove [RAM] from reserve_mem=
Date: Sun, 14 Sep 2025 06:54:02 +0300
Message-ID: <20250914035402.3670906-1-safinaskar@gmail.com>
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

This parameter has nothing to do with ramdisk

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a259f2bdba0f..0805d3ebc75a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6277,8 +6277,7 @@
 			them.  If <base> is less than 0x10000, the region
 			is assumed to be I/O ports; otherwise it is memory.
 
-	reserve_mem=	[RAM]
-			Format: nn[KMG]:<align>:<label>
+	reserve_mem=	Format: nn[KMG]:<align>:<label>
 			Reserve physical memory and label it with a name that
 			other subsystems can use to access it. This is typically
 			used for systems that do not wipe the RAM, and this command
-- 
2.47.2

