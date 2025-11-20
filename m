Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD572326D74
	for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Nov 2025 10:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763635157; cv=none; b=aVTWBfvlU7XUXKhUpAeyqgfaN6ZfSQPvxGQSvGC+4v7lKOPKk6p2XOKMk5xm6mQQMD/RSFelPJvxl++Tx9pAHRzZnmKzWBIFV7FAy/xNmToyoxfyfxiH/SjZ6dAhprVdryaBfoU2muIISejfU5fNYlQ8M5srWWTnAXN/G/+99/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763635157; c=relaxed/simple;
	bh=f0/uki5EzGG44sjpg0JOxo2PoUjLyt2xKQZb7d7uTGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n8cFRZ1ZkImcgiMDQ9BCCasjblmtuXkItjrH8o7Nsw1DO0AiJ3kAdEoWPlpXXSbmTV1Ihwgk9G6CUrBqoN9PRWH5ipFsOM8NdtQS3of4rVL8p6lLKmqQUhDYjYgjgyEw22sS7z7bgMKG0JEFUI76qcpncK3cAO0PaAzgaf0i9DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=du+76vms; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="du+76vms"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29845b06dd2so9323365ad.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Nov 2025 02:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1763635154; x=1764239954; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKvo2ug97afE0QhdFIBgI/kt9ZU7d+HYhjXUxEbOmO8=;
        b=du+76vmsjc1v4wa/FOWBNLrh20IhseR+cdLIIX32BYP+C2rRwfTspe8+8U6/I3etkW
         /IO3N3hSvwlyXi9veowjD9e8TEQgBjQDuoaiR4AJNIzWrwP8JWAVxg9RGWN+QYNV79UF
         XJOjZqi+v1OVjNiNtaqDPfftm9/v9NgJsyuqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763635154; x=1764239954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKvo2ug97afE0QhdFIBgI/kt9ZU7d+HYhjXUxEbOmO8=;
        b=Lc1V0rvOPxcFAKUqC1Ps+xNyk0wQdF2pf0HbAWaToUF7J4pvcGLE8GoNse58NzgLBz
         wf5vu6FRbVwHK7t1ptb6TiIGhpAk60IuNq4SiHp59RuTWYhNCC9YRhfZVLkLCc41E/aY
         4J2aAiMLvHPcqAtbWmSFQDd8MVHq8zV7jbDy6sOzfmwg6fkTTgTOZQiPugK+nElMDBlj
         hnLFS2wxqQBAnzuYRc8U0qh+Y1/gUY/2y9p4MZLVlJgCeceuiUCv8MzBIVbjkFwgOz8I
         mdRNBgAvE6GW9VQuvdvP/X3m7tZaKa1xN5GjDebqisojtb2fIF/CdVcDBx+1v6rs1E2q
         YaCg==
X-Forwarded-Encrypted: i=1; AJvYcCUXmui+0txz9TxmBfijlPqjQcPW0sxhnLR9RojbrElW/+L0Ec2uNM4duDtS//WZhwkecUxg/bveZh0Z@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwPpfTkaivl4uithRA2TPOKFC5GIcjL9skesyk83cn+zeSGI/n+
	OWDDOrOiSCqOXEUUzINSlS2NP+K2DkDUkt8Bt0Bu8zzQQQYdd9YCkEi40CaXOhW+puY=
X-Gm-Gg: ASbGnctMLC/WAESY9EOigk32hy0xd1knaF50ndeWnYjbDFfmGiyG46F4lq+CcJt3vm9
	pYn7J+HgPQghKjKCkPQosa7ratcilssOmvjYRuT7pvyJAnEWEbVLnRnGcGEEBhc98QDQrZ6DwEE
	yjq/s+Mz+W6JOHu+hEY8OP8LwuxZPLqXrWozDeep/S0fSLGAhlp3Y9ZFTaBqA3QePs6aeBP6WNy
	HbdVY6ZqoIgtGezwVAm7orWmf/t25/I9Ud3Abck5lquVnN0uhput5lwTDSM/OWAV5iz4g2Q3Muv
	j8BlALgRKBGgXVY/r/kHuloIgHGBv1wwSn+P8cb9Elev92Cb0QubdaeyToRaVau+Tx3VZHggG9i
	LtvJfFv85uSwxMPmLiTGtqMxzFaL/hKXjzv/2eZ1hMlGCJ74mOpj8Kre+mfJ7L1W3lfLkkqj5Yf
	86OHGl+IIxD1450lUtTVpdrsplMIpZCFQBRtxyt+S17fqoD2OE8ISwzBZDyjz5l/Vy0WAs0VYy7
	A==
X-Google-Smtp-Source: AGHT+IFwD8WapQgw3wt0pIPIQfuOLLyaX8VJDzSWN9rHr59He+h15IYtmSKPBp7hkNPDxxCm9KP7OQ==
X-Received: by 2002:a17:902:fc48:b0:298:3e3a:ae6 with SMTP id d9443c01a7336-29b5b139668mr37728825ad.48.1763635154042;
        Thu, 20 Nov 2025 02:39:14 -0800 (PST)
Received: from kinako.work.home.arpa (p1352012-ipxg00a01sizuokaden.shizuoka.ocn.ne.jp. [114.145.28.12])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29b5b1387e3sm22381035ad.24.2025.11.20.02.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 02:39:13 -0800 (PST)
From: Daniel Palmer <daniel@thingy.jp>
To: geert@linux-m68k.org,
	schmitzmic@gmail.com,
	gerg@kernel.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH v2 0/2] kernel memory protection for m68k, 030 users too!
Date: Thu, 20 Nov 2025 19:38:52 +0900
Message-ID: <20251120103854.1630306-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This implements kernel memory protection for m68k.

Changes since v1:

- Add a patch to split the early termination that the tail of the ro
  data is on 020/030 so that we can get at the juicy pages on the inside.
- Since __ex_table is RO after init we can just mark from the start of
  the kernel to the end of the ro data in one pass so do that.
- While setting the WP bit if we find that we'd be marking too much
  memory, warn and abort.

Daniel Palmer (2):
  m68k: mm: motorola: Split the early term containing the end of the RO
    region
  m68k: Implement kernel memory protection

 arch/m68k/Kconfig       |  1 +
 arch/m68k/mm/init.c     | 73 +++++++++++++++++++++++++++++++++++++++++
 arch/m68k/mm/motorola.c | 47 ++++++++++++++++++++------
 3 files changed, 111 insertions(+), 10 deletions(-)

-- 
2.51.0

