Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882012882DE
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Oct 2025 09:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759829016; cv=none; b=K3dekRidY0YO6iWBQJNO7IxaNdZwdY64kthfdnmxZqPthJoEFrOkYutLZR/BL6C4T/mHfLzXkp5yGXMaN3qURwW0oJosw6waCliznrgdEbvmytQyFQaLd9j/wJ0Wh+AmCU+JyGgQ6nqWA75g9HC2gnxAUAK5M3KYt9D8mGH8EeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759829016; c=relaxed/simple;
	bh=OyjOTab8mpNvoOfusTuJ3kewJnbeyW2Tdc9RzvHdAeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q59BXHFYyskPS2QixgOqK+Bak3U2mYHJCr8YdTr0yRngKVabYFxFsHGr1v7IOimVulT7IEPSKXaWtsrhQvUxjSVK6wXxWmji7c0jh/OE4bcgp1x41/yR2aPOo+si1hYIA+9kkizk3SkvbqTFMDtBlpCuDBIw/f+eTAQ2EiB5tK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=JfOWVWX0; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="JfOWVWX0"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7833765433cso7311869b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Oct 2025 02:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1759829013; x=1760433813; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8BMrreGYaM+ETQ7wh1dqgwXsdvPXSRmjMBiX7/QH9P8=;
        b=JfOWVWX0P70KERNXRmp0NkG6qDyd/NU9yMX+KwaBMenGNH5asXbul0n0ajVdicqQgo
         5KgOfXiCgEtjeo5Yh0F+a4Y0wOzYBv2jVAAfFr6LdHDXwayQR5+Fkfnh7Y5gqXGORLfy
         JiALDLB3kndD/ev0ETpGEQjgrs/35Y6blGZyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759829013; x=1760433813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BMrreGYaM+ETQ7wh1dqgwXsdvPXSRmjMBiX7/QH9P8=;
        b=xC9NZbw//vLTtCyBX+v9s3gU6erXjag9DQEPeDOUotxY20+gacWXb4WmB2o/7aXOVV
         9DBdGATEVI79oTWpUIOxpqqGutuLmS16U8Q3qzmAU8+CnpToMOuxLR9Tqy9kxBpuAU8P
         /936iFY247JK+lH0VAqpW1vKdjGf/sa0WNOH9YTTLR5AuQB7S7c8RIbZF0v0SIjONpfp
         9Dn7wkLDpfAMD/dGAGWyFzLxSx6/YKM6XgqYx9fY0oq49fWHWjIsYHfGj8KAEiHIl49p
         HAhRRPCbfLhLDL0brGCWjjP7cZddkNqbKoOJZb2UtrpnnWZdRSTTMBFV1CIH+U9Fw/BG
         1YIg==
X-Gm-Message-State: AOJu0YzXZgWm03A3inj6m9rMYZrIcJUQ+s25v4O0XrV/02X6OWZPPBMA
	rVvnSmfN+dSqpNElITWEpCJEY4c4iJDe6NimuFEiH5Sgb1c+B5XyPKuZF+iiDu16RzDxj5NQQgg
	2moGyedM=
X-Gm-Gg: ASbGnct++IiwEFjeLtqlPuViTkJZFmaQj/yi+Jh/8ug4lhiC773kb4zJvJQtoe3BZ33
	ULsEzDNSVcyQVZ/XjSZRFLGHiaefFrKERWOVrKP1siFa7MPuOi9cWqKGQNW2fWYh1jU1TyH6guO
	qb4C344zIzGn+mRCj7DJ+NHiSHuDZ5ilVBK2rLABIWEqha+wvu2Rx4+6iMCEEI5xhrsR263/OKF
	n/QUCPeoviGOOTMb05vqtXkpDM4jZLdvgvQXDKCOGIvuVPjCpcVCd2jHhDqO4z1qG04mUIrv/1k
	sQQtXe5mEDt/qFMsWdeEaQ+rxp6iWkklYhz79MKEumjxQBvosJhuDQ+Oio+b7MQbEVGzq0zf2wJ
	UIqJD0S1q9TmskgfepgLegATraoqgkcQFqzV8BW2HhIbH8Eg73zf35KGwuuSE1ZKW6de3bNxNOW
	kTn4lUtFcoDYS6Os/qYvQtO26ugkTHdwHaUjc=
X-Google-Smtp-Source: AGHT+IG2M1roqWj3uq0lJ8nnzGjIVwpT4KjTyGoeZ+ChvFAl/lA0gtYsMYOlp2/3j2ZlBG1u6YV22A==
X-Received: by 2002:aa7:8dcd:0:b0:792:52ab:d9fe with SMTP id d2e1a72fcca58-79252abe295mr2218766b3a.0.1759829013136;
        Tue, 07 Oct 2025 02:23:33 -0700 (PDT)
Received: from kinako.work.home.arpa (p1522181-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.198.181])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-78b01f99acesm15123273b3a.5.2025.10.07.02.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:23:32 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-m68k@lists.linux-m68k.org,
	linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [RFC PATCH 0/5] PCI on the Amiga 4000
Date: Tue,  7 Oct 2025 18:23:08 +0900
Message-ID: <20251007092313.755856-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a driver for the Mediator 4000 PCI
bridge for the Amiga 4000.

Since this is my first PCI driver it's probably awful
so this is an RFC and also there is one interesting
unsolved bit:

As far as I can tell the Mediator 4000 cannot do DMA
between the normal memory and the PCI cards but PCI cards
can DMA between themselves. In the AmigaOS drivers a
bounce buffer is allocated on one of the cards that contains
memory, like a graphics card, and that is used for PCI
DMA. I'm not sure if that's even possible to do in Linux?

I've managed to use a network card that doesn't need DMA
so far, but I'm having trouble getting a Voodoo 3000 or
Radeon 9250 graphics card to come up properly. I guess
no one tests their cutting edge graphics drivers on non-x86
machines. ;)

Daniel Palmer (5):
  m68k: Adjust the pci io range
  m68k: Increase number of IRQs for Amiga to allow for PCI
  m68k: amiga: Allow PCI
  zorro: Add ids for Elbox Mediator 4000
  PCI: Add driver for Elbox Mediator 4000 Zorro->PCI bridge

 arch/m68k/Kconfig.machine                 |   1 +
 arch/m68k/include/asm/io_mm.h             |   9 +-
 arch/m68k/include/asm/irq.h               |   4 +-
 drivers/pci/controller/Kconfig            |  11 +
 drivers/pci/controller/Makefile           |   1 +
 drivers/pci/controller/pci-mediator4000.c | 314 ++++++++++++++++++++++
 drivers/zorro/zorro.ids                   |   2 +
 7 files changed, 338 insertions(+), 4 deletions(-)
 create mode 100644 drivers/pci/controller/pci-mediator4000.c

-- 
2.51.0

