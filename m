Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D67B2E975E
	for <linux-m68k@lists.linux-m68k.org>; Sat, 14 Mar 2026 03:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773457592; cv=none; b=RKpVrA+llDTEy9Uljw7FVzCwRKgGBqs9Cl5WEUYNprJByn37Fd/LgKb5gJreIXaLsw6xREXsk3gvtpY4206KF/4A1/R1gOiUSc7dxppljam46wIyUaslN4FBCAo5DyTd/f8vyvyO2n7C+f+PlM09NsRi4ddLKhHYa/dGjY4rjN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773457592; c=relaxed/simple;
	bh=JsCdI1j27/Q008Y0RmTqKbhlwiwYDL29o+1VwGYzKdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d7+EOUKwOj7Ri7ve0D2Qbfy6AnAGDs9PcmYRwxzeHogDgo0OsbviN33P/sy/7rD5WsBt8tOiLeFLIjqaPV8KJRyQSHVh/J2uHlU7xXeCCU65al8C6+Ba6cCWa7hiBxi7KUjlXtaEXVfYqnGrrOTh8+bYObSmQ8XX0z5utYlYeQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=Iwu4WVMA; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="Iwu4WVMA"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82a13374cf6so2153118b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 13 Mar 2026 20:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1773457589; x=1774062389; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ldpGN4CH7HTJ/1fz9XHIFnVyO2fAyaEcw1ZFiYgdj0=;
        b=Iwu4WVMAeHD7SBeIgvXwwbsvTU9a5zf5Fkd1yH/SQjJqD72ZjVfEWu58t576sFu9aM
         +OC72ra4QCdjtkhABSjMwOuhb2iG0G0j3nPgz4ddh1AjXuGQ6oegJICMHMZldNqCEmDx
         lz2np6t1TJsxEWtwhp3ApPLz4sd+gIcgxEIrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773457589; x=1774062389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ldpGN4CH7HTJ/1fz9XHIFnVyO2fAyaEcw1ZFiYgdj0=;
        b=i4ZAyiaRJQLB7xlSZAvct4GX985SpdlaXUiWCrvKHQIuM6rGLT0i5Lr64ZQbMJesZD
         KbsThpO8MtM/h7efkcuray3JBTs9MPfvvWT0UfTlIoKS0dwM+qGwaE33BOjbjGCEn1yt
         7mqzh/Uk4NSJCWBPpZUeDG60MVXFAx0dJdjC0umY+x0f9VQQhgWO7ZSYa9HJqxFiPlY5
         pFA2h+D/+gsBHyg9FSpbBEp4EgE24ooy+maDSJ6AwOjFDHm+tiAJz3DE7fpAIZYZZSn8
         uqueDHfIypWVIXTXEFHHxj+7pX5e3KojEXSdSFrRp5CRj7Tsrf+zgdJuOd6F8nFTRPf4
         WdXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxnoFRpB9kugOs6klEwfnbZMaThqFgaZrdbqj2GTbVcyheZZFKinqsbGH7qN3FFDAUbXxVt5puyAeY@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz9GZ6ft0iactsq/lwW4i6Z0dy3uA/U9/n4bgC967RfZXl5tvZ9
	xPjkGCpQ5uDBnd2C9JbqsZuddA76BiFCENpNSEHUl208+zQ7SJ6mKURW4x2N8lKqIaw=
X-Gm-Gg: ATEYQzzmf+n1gTxMg0Q67s/rEXXuSBtfAjF9OsPf9D4Z0FkfTmmXJO9D0QSDzuVFRxa
	k4eLPMob6mHyPQhnQAgY6hWiUO4ppQHktLO/yL8BUcGZn9WAxo95GbXt8b1BKoaVbPnky3G1X57
	XlK+rPJUX9RuPMvyxtpvvOc22LcM5/7xZW1JKzT6s172IPE2djcKFUlNmTqJfTm1QvNHMx9w5eI
	yDTB7/n9JNU2pCe8pbDa477EfOCsni8148xHkAraieHOwYr9SSOK25j9UgXFiz1bkIMTfJeVpOX
	1hbjmPeBp2gDDHogPXaQHdUvDWk5bWSr1VICa+d8LjE1G4036SrBDunsZat+5qtHpis5T6I4PLm
	x7+D1/Rrm1HXPqwRMefjlMx/OH41XUMNuxVsQBpl/klTYf1IYO8VZnxQix3V6CL7It49JdbZny4
	zfNaMMAgxRNOSwap8WFbDJzDnnJZ7ZIO+1BpZbRxKwFpLx3yCIW1v/KJ/ZsFtu6BFMWjL930EEe
	+d/+M3zEPrtmyxf
X-Received: by 2002:a05:6a00:1586:b0:81a:857b:f944 with SMTP id d2e1a72fcca58-82a19866231mr4000648b3a.26.1773457588857;
        Fri, 13 Mar 2026 20:06:28 -0700 (PDT)
Received: from kinako.work.home.arpa (p1766150-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.167.218.150])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82a13a2f2d6sm8630734b3a.9.2026.03.13.20.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 20:06:27 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: mst@redhat.com,
	jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com
Cc: virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	arnd@kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH 0/2] Allow virtio-mmio to work on m68k nommu 68000
Date: Sat, 14 Mar 2026 12:06:09 +0900
Message-ID: <20260314030612.1949420-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- First patch just cleans up sizeof usage so that checkpatch complains
  less about the second patch.

- Second patch replaces uses of readl()/writel() with raw io access +
  explict endian conversion to avoid getting the wrong values where
  readl()/writel() are abnormal like m68k nommu for non-coldfire.

Tested on QEMU + patches to make a 68000 virt machine possible.

Daniel Palmer (2):
  virtio-mmio: Replace sizeof x with sizeof(x)
  virtio-mmio: Use raw io accessors to avoid arch issues

 drivers/virtio/virtio_mmio.c | 140 ++++++++++++++++++-----------------
 1 file changed, 74 insertions(+), 66 deletions(-)

-- 
2.51.0

