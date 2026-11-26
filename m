Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719093;
	b=MCKRqIE/qlAUL37Huzw80OCcAbgQ0FNIcA16HcodNYsKlbzuqmmChmXC9QQyca4aaAmY
	 w+ljnJPYI1Q+9/Rgh7fC7zqSEbfrQf5jSnQmVZv3FW4Gr3su4ku6FXCU5Alays9NG8nwB
	 IrATee3AZEDV0L0DYPueibjtM+ys0ltnSERefQ6vZ8hpcuD6zgoPPoy4+2ui9rZ1zML6C
	 WgdC23BFXyuKipoJVjIeG+aMeUmBRkhAtesTgKvtdFRTwBXe1nDtImmE95EVJVewGDGQ7
	 /cVnhbuXrwpbP6yar3FQsIScwLKrn4J97o+/kO910Nzj03H38hXxSxQ8wJAo494IRPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UdCYIM2C5CRKg0+w9ZHLQevjQ1zBFoWTXLA/jRWFBSE=;
	b=Cno7issE5nWNmha02CLOxE3T+J9wpQ2iL/I4bztYIAvueExNXgI7f5eLT1CgB8c46jIr
	 b//IbrtvpHxUbG+OwCjrRxfI/wa3311Eh7CoM6gsR/T8ov4vEvhitVeSp9AxdYucFN19G
	 PLB+IyGGxCxxK31EfywTfHvXmgFLV6GGHbgeoQwB4xSQ4Dfu2P9X1nrfbcY3PBdDTTsfl
	 4cR4pGkJwH82I6QhRR+GBv6M7XKk9suPgU2LhRuIXu+bWkCT5oVcsaD/RkHNo8JR9QXry
	 hBOQA0uAufLItLAZerLJo7V0muWYzrDMuv6VK3Q0uv7sz+dgGrJP4pyaxEZHcZO+b+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vgUuMXvp;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E806C606A321
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 18:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E806C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vgUuMXvp
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f0414c1062so44236235ad.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 10:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795719092; x=1796323892; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UdCYIM2C5CRKg0+w9ZHLQevjQ1zBFoWTXLA/jRWFBSE=;
        b=vgUuMXvpjLHF57nzcAJw64qr3Lon6d87XcV98JiCxOZSbTEBSKudqEppqer0RMogZK
         FjkJmoYiQMSuDuFZkpvyZM2dBIRtiyabRdKee/cC+u+VnIFfZMUJ8kPvtr5xZjnhPuRA
         7P8stw/xQKtALW4SzTymjPIcF+TRStpjoqVzH0hzjFxTtRH6mFh1WOizjgaHt0n2EwG0
         CRhvhByfj/D9+FGALuOxmXd3o0HMwRzoNL19oqW/CMrXMPF6RF3dZL9hlHDDnc9cxFlZ
         /v8cZjqGtZdDsW2m9fKIvPLjUSdfOQYul9fvoDCorMXmXC4hsOGSaemIfpbdjKTJgfTD
         sY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719092; x=1796323892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UdCYIM2C5CRKg0+w9ZHLQevjQ1zBFoWTXLA/jRWFBSE=;
        b=gpilML2Iv/tVdUp7zrVy7KW6Q2RoYgMp6uI/SAZV0oawhfA1KkmSWkTGx+d4LZ2qIV
         MwfT00V5xlORdG59Wse5CpJQgLR6X1fNb1nlII9MD6GVspyJ3G8j3YCZxHcQiA7/N9YG
         rFfzEQPfFFLid9tG1K1Y6DB/EqmBPy60Hs53QLeD3LsCShBOrlk7Ls9oeE9Xh3V57xyc
         xdBbtbNzSLbq8Y1y7AIgyKe0GJJjyzrVcevvpNKdF3xDX55YZmTe7OcBeLJuLbA448jI
         oo86WxjXTl93zQz67AH2fO6/sdyxMwQKagr02iD1P2BFNpGx9uNQVkTz0gcsc4UTf+QJ
         XLSg==
X-Forwarded-Encrypted: i=1; AL+hErHS1OKof/1LVuuUYcyuHRiRtkWBrBHIVuhnxNngyrQswLRqaHyvKtEZg1/6l1vb2qG9RAh7W5TNwGdw@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z9Mv2e/NicpB/Dkzk9tqc1LkOUrT8v8IxSMKQpQETK3o52gkPjk
	KxTk/ih1z3+uTBPzTVtjCKb+brZAnwSQOLq1/mWtLse2aOlHSTDcitRG
X-Gm-Gg: AZFdTZfzzu4bn6FnONWEIHKLnHrrQM+jjeslf4ajYjuveFDpP/LRaMUlgM60OuwR3Hd
	HWDyL4EPD9mXjj9aHNAzGMR9xCohhipDUeNZKpjBdOvW00FTyQroF5Jwnp0qXErgywi5ZZUeB2f
	CNoZzj7QbyabIUSvLdAvaSGC0mw1tKHv1D215og/5yTR+bFq7wTRZ3z+/8PrzlGKfFK+RJ8DGZ8
	Ho3PCs2pxEfBUtkOOWvGBVm/OJQ/pRbhJ9Mn0mOmovjiLuw7zacap3h8AccbXuSYnLYGtN2Lob9
	dmic9wsvop+Bb9go2hMde5+YLTxFmuzBrtwBtCufhFbQ4VqbbWwNuSIlVy/nZrWEzwIpUhFfVG/
	6fI+BVk6UBdyfCrcAzut/Mcq43bB3WMq3alYedMFTcauVsLCVnMO1WJWjAmX/y89NeaQJSBtvY+
	eQaH8nRa0y21oL4ZFNp+wJl3v2C9gHVhS9YB6ctlc08S65DSjA/SfuRgKZ5yyThTDAFxH7KYdJC
	Y+EUPGHzQDUP5kfIC1H/smLxCMat8vsfhcSsbaqpNkPJNhGPGOMepzXrl/m53ImeJglefkpKdw9
	DC0c5YADn1BCxD/SZdUI9K9ld51QLWPXPZ8xjFvbzK+or5eXBQ3cWKqnp5ecZxG7Ui1DktGLrK4
	XKb0NJFBN5qHGTnpHYL3UXn42
X-Received: by 2002:a17:903:19c5:b0:2dd:ad73:5b6c with SMTP id d9443c01a7336-2f0ea5af0acmr35718495ad.28.1795719092175;
        Thu, 26 Nov 2026 10:51:32 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1276c5sm112041665ad.67.2026.11.26.10.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:51:31 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 0/7] m68k: virt: Switch to generic goldfish PIC driver
Date: Thu, 26 Nov 2026 18:51:13 +0000
Message-ID: <20261126185120.3815699-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the m68k virt machine to use the generic goldfish PIC irqchip
driver instead of maintaining a duplicate, platform-specific interrupt
controller implementation in arch/m68k/virt/.

The whole patchset is tested on  qemu-system-m68k -M virt and verified
that interrupts across multiple goldfish PIC instances fire and
increment properly in /proc/interrupts.
---
Changes in v2:
- Add depends on HAS_IOMEM
- Add patch 7 to take over maintainership

Link to v1: https://lore.kernel.org/all/20260908094016.1997918-1-visitorckw@gmail.com/

Kuan-Wei Chiu (7):
  irqchip/goldfish-pic: Use gf_ioread32/gf_iowrite32 for MMIO access
  irqchip/goldfish-pic: Use for_each_set_bit() to iterate pending IRQ
  irqchip/goldfish-pic: Allow selecting CONFIG_GOLDFISH_PIC on other
    architectures
  irqchip/goldfish-pic: Add goldfish_pic_init() for non DT platforms
  m68k/irq: Add empty irq_eoi callback to auto/user IRQ chips
  m68k: virt: Switch to generic goldfish-pic driver
  MAINTAINERS: Update maintainer for goldfish PIC driver

 MAINTAINERS                              |   5 +-
 arch/m68k/Kconfig.machine                |   1 +
 arch/m68k/kernel/ints.c                  |   6 ++
 arch/m68k/virt/ints.c                    |  89 ++----------------
 drivers/irqchip/Kconfig                  |   3 +-
 drivers/irqchip/irq-goldfish-pic.c       | 113 +++++++++++++++--------
 include/linux/irqchip/irq-goldfish-pic.h |  15 +++
 7 files changed, 108 insertions(+), 124 deletions(-)
 create mode 100644 include/linux/irqchip/irq-goldfish-pic.h

-- 
2.56.1.839.g22a8290db9-goog

