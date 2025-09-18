Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A0730BF65
	for <linux-m68k@lists.linux-m68k.org>; Thu, 18 Sep 2025 19:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758225500; cv=none; b=erHqxRY3zX20GDdw6BqyV1hUS75VAcMl0SqqDIo2kkv3UKkgvcBVNV7h+QqW8gL76kOqlanUno6nHWJGdio5CSYDtUiXcZMtLSzB2RRfV5KQXGBk3Za6VXbhGE54UylBGMZcfIPFnmGdXYCsweG++CykyBwvzA32HazPeqh+F88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758225500; c=relaxed/simple;
	bh=hrTKVKMuOKbLilzSA+VEl+XSSF0VIocT2KvCzkuRjcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f1t2Uut8X0vjHihrfCxVizQx3oAuiXtbEMNuxUGbeTeANElP+n+8kVqPaX5vSXPNhpixLZ4XTUGM7jyyz80nSDh/C9k9foNUqACygyJ6Y5+tUQ1/Mk7uUAwRPZVV5Q5FTUWQYFvTUFJFp4p801sMMc1U4qqh7Ec9drnq0SsFgxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OU7xqzX1; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OU7xqzX1"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b0787fdb137so211167466b.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 18 Sep 2025 12:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758225496; x=1758830296; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9McvDjxp1cOQ8m8DQ7zr8KAOkClRv+R613f7KwPZqLk=;
        b=OU7xqzX1e2Kg8a+zUMAq/1Bob3amVa/ebwiVi3SWgZfEF+fyMnrfwlJD3vLjTD4rXp
         ddi/eZAJXojNs+2zwQHOkp0d3hXckOAPDsI4D4YxSQlrGFLyMb7Trb8NjObOS64taB7u
         EijtiQSYPL18yLP0kJwSnohgD8UozYRakQZMtDUdPfstBdfu2GnLAivXRaEoa9lj8HEY
         OxCVf4Jf8sv4c1OAF2EfHRQr6SWvqy3cn5AFCN1jgIuR1EcQOIaSfbpJ3MQuYYgZO3Mu
         sRCSqkpq8KEPQcQdEVgpGmYTmhWaVN37BU035p9qMwZwJdpKfmT0xgc7wv78FO7SXjR+
         gHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758225496; x=1758830296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9McvDjxp1cOQ8m8DQ7zr8KAOkClRv+R613f7KwPZqLk=;
        b=TmtaaQ1BuoMIWVErquyco1BhjzBjfRK/QP6OD0IGZdDAuZmqGruI9QqaIW0TG/tutQ
         bz5X8omDCdQ/RpwoQCc4bfW2u9KGdyIspHxcMVgptCP4fAKJ+4WHZOdhQqQD6jkUw8KB
         PIz80j/bqDqcvX7c1tFj5sfsX6Qmzg1X1ccmJoEH0JojnM9eMoE5OD3oiP+qTQZTDtZy
         vdKGXfxcOM6RCJdLxrN1UjgfjaFKvcfeVutSv3OluEZnp+Lawz2Ql3FZ5J0YhjsylAbr
         SknL5US8pu5rYRr6VeRkKADqAU9xIfLIByLbUtJo+dLAJQgOaqa0WvkngqDV8K7bH0Xy
         wJaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM0+ByAaEG+jIbq9BqkQ1hVIBQl6fNbklGQrSOgfk21UFeInaZmZURqExuSdYju6IB9J+aSFkYssfa@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxW3Siez/Lg7SSmfBDfF3b9ue+tX1xIPpQjt9sZTt8NMg8ETF1s
	jrwloxDqQK1mPyG3nybEw9tuo+WXbMYkor4mSIHdn2rZbw87m04/aF5m
X-Gm-Gg: ASbGncsHuwLwDS2BgfXeCVa04oLfX8lmOIXnOLfoN0Vr6CYEzYbinTM8gaPPnAh6hyG
	ihQJd2++OexuVLZ+HjaPwDyu5ryyjOTX+HjEXtaGCHcFi2M0l4+cz38sdz8Mc7S1S3f90FdqIH6
	50J/mXTBXVABrpU1FQ/IGW+IB/1SM4XxkT4jMqmtrSQ1EFe8JYVvCQ5ugxfQeTKI+IKAMK8Fs1N
	Ho1v9xSvk/uWOzv2tB3rmC0jBW0/5EYbflLiA4fNK5exmXaty0bMftR9Mc8+J0Dz2XO9E6kKqOg
	VlLHQXOMDNheBYIY54lvrxLZFC/kxdtaTw2cKhYK7UVZZzqIT905mzwy4vOGvn7NMblhaGq1h/d
	w2PvXYREHWWhzuSJEz8BLd95khpsztnT+lvzDmQ==
X-Google-Smtp-Source: AGHT+IH2NBu6L+bASXNqg9sJUcZ42MFCB2aqzEFiqoDEW6um54A4CtHcJnO37auTgFbi6nwycKDm8A==
X-Received: by 2002:a17:907:a089:b0:b19:969a:86 with SMTP id a640c23a62f3a-b24f35aa177mr45885966b.37.1758225496090;
        Thu, 18 Sep 2025 12:58:16 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b1fd1101c44sm264530466b.82.2025.09.18.12.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 12:58:15 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: nschichan@freebox.fr
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
	safinaskar@gmail.com,
	sparclinux@vger.kernel.org,
	thomas.weissschuh@linutronix.de,
	thorsten.blum@linux.dev,
	torvalds@linux-foundation.org,
	tytso@mit.edu,
	viro@zeniv.linux.org.uk,
	x86@kernel.org
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
Date: Thu, 18 Sep 2025 22:58:06 +0300
Message-ID: <20250918195806.6337-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918152830.438554-1-nschichan@freebox.fr>
References: <20250918152830.438554-1-nschichan@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> When booting with root=/dev/ram0 in the kernel commandline,
> handle_initrd() where the deprecation message resides is never called,
> which is rather unfortunate (init/do_mounts_initrd.c):

Yes, this is unfortunate.

I personally still think that initrd should be removed.

I suggest using workaround I described in cover letter.

Also, for unknown reasons I didn't get your letter in my inbox.
(Not even in spam folder.) I ocasionally found it on lore.kernel.org .

-- 
Askar Safin
