Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F3E25DCF8
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 12:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742818611; cv=none; b=X51Zd7Y9oV2MgnPU/awc5Bjbdl4DDwt6jxsw7iyi9wyUZxVzD/iJrb5WxSjERKLEeWUrw6ZwrFlN9VnUpd1+BqycL83Lq2LwIy3q8hvRz5vV63bOZP7HuO2GIEgX5atehWwMoyj1pG0/BDi3tzDedA8Epd0YoTKKOyZ1WPGSmfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742818611; c=relaxed/simple;
	bh=Zd9O3wgUBveXcpIkFGnAl7IKOr8i7o+05htXPaF/MPE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CPtmyHW7EcgJ9y16Nsw8hZpilcLRAqN42LnelxU9rDeEUMVGwuJfk0JmKDH50gM2Lx5aEHft7DON5KlJtFEGZPqaBRp/C5+CJschQClByU9zz1i0CyvUdVSA3mlLFE1rU+C+8yzt1TrtM+yqPT5bqeS+l+8rlCoJTNyQI5roFJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzStN9+u; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzStN9+u"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39143200ddaso2472656f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 05:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742818608; x=1743423408; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+H8UDgPvKl0q0KE4YlI6KMrCDjDegTtPX3i53ZqeH7U=;
        b=LzStN9+ujcupcxmFB95GyqOWBuNbMA8Ii2LmYN4BjhdqgtPTzpwBmir0IysiyZUHyc
         dX5FJo5vH2R/uQntp5h74WBPcXwm50P6ab4FdGr7weP1uIsECsXv3q4HxLi3+asPJcTi
         ctffGKvr5urGSv71J6w/Qvw77H5+TqZOrLUyd1Pb6u+1KCViP+zY8BoiyuocVIDEsOcr
         POzGwz9M+/PFMBf7icyx/09UlAlNry+l6W66ArhqhgpFKzc5CeA/BLkWLE8HYEG5eC/Y
         XCP16SoE9qsf8zlEpDvQs69VTBCcVaY3Zgk8KGP/HNnwZgooMPPN0JMY2BjJks+BoHax
         hGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742818608; x=1743423408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+H8UDgPvKl0q0KE4YlI6KMrCDjDegTtPX3i53ZqeH7U=;
        b=CM1uWmlQJk0zt2dQ3fhWOsUmhqTmt7DQOQ5L0+3Bu4O6CkokY4CzBF4OKWDDl2r9yT
         DoR+X/1nBWOEdxrguDUBNR7UyEt6BIPttsQdcx42+ZiSElj6rGnSovVSE6ncLuqZmiX8
         cxooeHbWxAp6p6smpGtHihYElfrmNNELhv6fvFYEcQPDAyrJNX9QBAbMGn1KWuCoazmm
         3m1axt9c/gxU57hLno7GrZ6wbao072CbV3oQ4a9QpKfBVgc0Zbti+eKA3iEHR0Jp3WIC
         AfpT1k0KeXaj4Y2mhlkt6ozHJYAN4wafnrmBmbuMwdWTgeWdLcn0bDIJBAjMpkE4fIkp
         awfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUopGc77W0Uj+8B5vGBnOqEUSzV15EMuMCaRK1z2ecdb2JEEaKcuwowJb1fXZItsj9jEcnSSTMwKL3x@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwwzIPs5nPbMnDUnjcjBmwDUf8LeuH39yMujg3J76yjMx56lp0W
	V1Zbqkeffx+ETGGFN4f6W6vj8bED1B58QZctTkHLLq3OkXY93bPj
X-Gm-Gg: ASbGncsKjg16QtP4n0/p3VPh1Dufb+2qM1r0/kR9y1oVZP6KaFAQSWGbr5DSIjSG9TJ
	5eb7X+iwHv6aZ03GXmKeB4JyHCcxfRc6SxUk9Z1qIdrvsulESo7g3jwrBcOtVDjJqkLgE6G9dQI
	5hORluFBmK9oq9yuMOE+0BLSHmOyamZBHFfl5qIzdfWv/a2TX8eP1mUHHq56iHDEfHRMqXa7I+G
	YMv10D7P+uCXf20aIL6F1g8fLRBtbbqcV8m5+MOi9GNDH+umRDcvlKpF6oWqOZIfD/tTHRBbqum
	TCZysZZKPyX/z238qL4MtL0anTTtQkwHomVolWqQOys=
X-Google-Smtp-Source: AGHT+IG/6kcJD1oo8dsIlQAJ4NNfzobfsMiNQ9/vxprxO69/IzfHBZ5ZIAbDY3eVWJuy5oV008sXvg==
X-Received: by 2002:a05:6000:4009:b0:391:300f:749e with SMTP id ffacd0b85a97d-3997f8f5d96mr9692105f8f.11.1742818607412;
        Mon, 24 Mar 2025 05:16:47 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:fd58:9303:2c1b:4279])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6651sm10824083f8f.75.2025.03.24.05.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 05:16:46 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-ide@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH v3 0/2] m68k: pata_cswarp: Add Amiga cslab ata support
Date: Mon, 24 Mar 2025 13:16:43 +0100
Message-Id: <20250324121645.208368-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here is a driver (and the subsequent defconfig change) for the pata/CF socket in
the CS-Lab Warp series of Amiga boards.

Changes in v3:
 - suppress a comment
 - properly return ata_host_activate() error code

Change in v2:
 - fix style, remove duplicate swap macro, driver version, etc
 - rework the zorro attach mechanism
 - remove the unnecessary zorro ids refactor

Paolo Pisati (2):
  ata: pata_cswarp: Add Amiga cslab ata support
  m68k: amiga_defconfig: enable PATA_CSWARP

 arch/m68k/configs/amiga_defconfig |   1 +
 drivers/ata/Kconfig               |  11 ++
 drivers/ata/Makefile              |   1 +
 drivers/ata/pata_cswarp.c         | 186 ++++++++++++++++++++++++++++++
 4 files changed, 199 insertions(+)
 create mode 100644 drivers/ata/pata_cswarp.c

-- 
2.34.1

