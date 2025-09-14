Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F39272E6A
	for <linux-m68k@lists.linux-m68k.org>; Sun, 14 Sep 2025 04:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757823573; cv=none; b=R31+5BosjTKSCsZzgZUolpdv3JTgpGij0c+RhL5WucoS5Qtab5DZFTb7vEOoPgAb4LoN8BNb2ADyppAq8ky2bkYkaHyG3dR3g+Lv52Wq18NRBang8/M77L7YZX/7KP6zKhA4PtI3tYvx5XiDOWIyjYozXvFDCfmlyTSgoAowYec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757823573; c=relaxed/simple;
	bh=nKH8BykbZ/NG2ohjRy0QYNVXxhFKK6pBLbFy0ufJ1Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVU/qzcmQTVe1hVRHlmMShjxhYtTrXDMyU8jizAqrFZp+D5wB30pKjsi6Y7/vPq7qEONsfc+OOKZ5FQgqrHWMEWEcPry3NaMMrN2nN1TMvBJymD7njxVmYkmT2BaUQW9/iml9KD9y21fgYTm6v7JBeNS81jAP+URIQeCxGfvSgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhHIee48; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhHIee48"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b04b55d5a2cso549146866b.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Sep 2025 21:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757823569; x=1758428369; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXtvCmrZRR9OgP0sG11mqG9m/nOQIjqm8VdJ9uLACjc=;
        b=OhHIee48I/poCD7P1A/NEL459fEhAUQvePTm+7xY1L008o4U5SJ2XxcPZz2U8pPSgk
         5rNFBFZavB4rpB7JMiZeBkk+m97ch6TgN/ioHdkMKooMisaA+iba3Injrlu1ez0JGjAX
         dTt8ufk5dUzdiaYEx2cOCk1xx7uJ6lsiA90pY8s+zl1fBN5jy2Y9nV4iaqRN8qg1UvOT
         rZnhui2x0FtkBFsoXTVAeSamkOL0pdwn2cEaMBKbZ/vIg+A2uIiPueMTwP2hSzDj9LvA
         R0luxacGv0XpTBUWj4kA/5GJvJHqGf5G/9cTk4txaqwNkBCy18+09OAuZs4rphxfYXdJ
         Hs2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757823569; x=1758428369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXtvCmrZRR9OgP0sG11mqG9m/nOQIjqm8VdJ9uLACjc=;
        b=Ijn+nYRT/W9hYa+mP4t6T2hZdHAMyeEhHPwok2I8AqBcjyAZoya3UeJVPN19k/b2+8
         MC0H2buQ+O/LzhMXvyWLle3BvFEsBgPVHVnB36UHUUA7d0dTiBSgMQadTEUJFjCnoJDd
         n273np/6Haqcjsf58UCLuaaU8iTnZF1yk8KrltXuueu0SoaZ2fMeeALd/oUoeY2g/j/P
         VKPfFLWaTwBMB+K8MNRS8MMRGri1AXVe2vIjEWNIyvFi5alsE+vdaeYyi61T70bYjIOb
         DZdS5OncSteRako0o4tX9U9sCqnlFG329/otqHKQow9Fmm6FVhQvkIWZnEGFuAKfehey
         ZWBA==
X-Forwarded-Encrypted: i=1; AJvYcCWIhlJYn6qYTt8PDNaS0FrEkLZgdLdWR0KEDfKCd8f+RVj0eDxVglqsGv0/EkieJf1AtqAvW2TggT/A@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx5I/YY/h7n02my54Ms6g/0g0boFBzAOOJsdZu/QFbVWuIRmcA8
	8FKuBAIWPaq86hY6DQfjEhPeC9Utg4wNTR1bm3Sue17ZdSNC86Ctad71
X-Gm-Gg: ASbGncv/tIJznBI0wJ1y5lgioJeE8r/6HDRh4sgEjx64A7PEL7x3mVJi+NMYZQYtSIV
	RHbNkKPBaKZCz4JaZvbBriz6tNWpUECHJTfrpM+BTngdZCHORC+WIp/RHEtXVrHKEYSrHXxEfQ7
	IoNHXRpQBvED9tY8q3k9n4PGHSZNsjKTb1oBi3ClpQoev4F8q67VcOU4k7zVYKWYYXOFpcAIcHD
	lOdkOH/JZZJDv/oaDQGls6RRgZff2rOP7+9++H/6eh5TxBw+8JjwTnr/FjkGBPcAbqG/zfwY6HB
	VSq9+JJfsniPggOj38Kvp04CkBqY/xeArkSJ6guYHLnXyZHWeIU76BQR1UKLR2aJGBQEZniRNDC
	ZDBz9zdGOp5LrTWeWHXfEy8Nqz5S3/Q==
X-Google-Smtp-Source: AGHT+IF6mujdx9qWAhF6oXDc9ZfcQYBKEdRbKR8jum+cm7upWvg9UYWarRjAWufJtq6SFHzRS8+jpA==
X-Received: by 2002:a17:907:9809:b0:b04:25e6:2ddc with SMTP id a640c23a62f3a-b07c353a723mr763099266b.8.1757823568595;
        Sat, 13 Sep 2025 21:19:28 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07c28f190fsm504796666b.39.2025.09.13.21.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 21:19:28 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: safinaskar@gmail.com
Cc: akpm@linux-foundation.org,
	andy.shevchenko@gmail.com,
	axboe@kernel.dk,
	brauner@kernel.org,
	cyphar@cyphar.com,
	devicetree@vger.kernel.org,
	ecurtin@redhat.com,
	email2tema@gmail.com,
	graf@amazon.com,
	gregkh@linuxfoundation.org,
	hca@linux.ibm.com,
	hch@lst.de,
	hsiangkao@linux.alibaba.com,
	initramfs@vger.kernel.org,
	jack@suse.cz,
	julian.stecklina@cyberus-technology.de,
	kees@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	mcgrof@kernel.org,
	mingo@redhat.com,
	monstr@monstr.eu,
	mzxreary@0pointer.de,
	patches@lists.linux.dev,
	rob@landley.net,
	sparclinux@vger.kernel.org,
	thomas.weissschuh@linutronix.de,
	thorsten.blum@linux.dev,
	torvalds@linux-foundation.org,
	tytso@mit.edu,
	viro@zeniv.linux.org.uk,
	x86@kernel.org
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
Date: Sun, 14 Sep 2025 07:19:23 +0300
Message-ID: <20250914041923.4119219-1-safinaskar@gmail.com>
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

Gmail banned me after first bunch of letters.
Just now I sent remaining letters.
So now the patchset is ready for review

-- 
Askar Safin
