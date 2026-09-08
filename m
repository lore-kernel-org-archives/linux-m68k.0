Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585B44C9007
	for <linux-m68k@lists.linux-m68k.org>; Tue,  8 Sep 2026 09:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860438; cv=none; b=bPwwJY41P749TP//3ULQjJHXS8fvxC0bbfjGIh0Or/j8y7b5xMmmynkFJv0rdJR/0HQ+B84J9FQ0occX/ugl7dS6MghG/16xDINkioXhbRTo17ViRsDBZMZZsbnUkcINQurVEyzTb7Datb9zDuvXuSB1stPZ7efuADkXMA+4ZGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860438; c=relaxed/simple;
	bh=1ZQPoNVnUuiMVJVjYzNnasQG1+hpCiPhDHvHiw/xNsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M8zyJhEZ+UrqvEJFhb6uJ6zCLY0FNcpfyyTs4EerrPJtnlMTYjK0qnK5MtEKVNQsVWw6e5keqzlt91hV/b0lnUXQTkVIYUU28Prnc0XZBtzYScAbbk3RMmUqyBuSEwVeax8NUxyv/6YhzaS78YpF+BCiDdJUIEwE7j1EkTJ3im0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhEaIiGM; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhEaIiGM"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38511175ad3so3745150a91.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 08 Sep 2026 02:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788860437; x=1789465237; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QSADaGKPLGDmms0JzztEisv6wj1yn15y4i/vNr1IM14=;
        b=jhEaIiGM2nsaVsEJnGqJkEC16/lGz3vfIsp72XdN42LZXjhxvcWZBBYorNPk1Wc4Ne
         V6T/N7NE+DZV4L9fofOm4BnIyIIs23k/qWPE2U+zSDCFElGx3nqz0RmSScGc88eZ9RdF
         1DuTbC5UrzGTvM3bGDyAswJL1UbRPoqgBacQG50HBwgqG9tuxQLCo+Qtjg7AntA7H5np
         OXUILRY5D/niN2qJPKb/i6ECg9/83idQrcRiJf3+V47wOhGPAPbj1hccXgiiuTwBG8d2
         gBHk6XjHpgoLpxb7KyHH4GkJn+ZKaI0GDoUkpwbg4MmlLBkPUP87gH2YC7FxCHOw9cu9
         BT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860437; x=1789465237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QSADaGKPLGDmms0JzztEisv6wj1yn15y4i/vNr1IM14=;
        b=UKfEGy58CsNOITk76m2v//j6LRkM44W6LZO4wYcUfK8iI4T0GkYfZJwDYMACR7nCxu
         rVpu/c5eZ+/JgZjVnvildxcPVTf9ZfOLayrrv6qDCv6MN8jOyLkE98jADygViUKyLQX0
         tCI18Gx3Qi3TsszFzbo6m5gjkPiK5dgJ+JzjiPfqmNro0fFxfFCoXzjumLhXu8xrn4zb
         4dhdBv413bNnMZAigq3wUgLzMD+y8kOS9oBbivXEvUBNUoqAktlg+hwUzzpy0SDgN+4r
         zdarf3XieRSZwDDutT+WSiNnrJfPmEIKdvbu2UGIKzPWEPHl0ZKsQ5eoeWLtkCJnFeci
         NhcA==
X-Forwarded-Encrypted: i=1; AKwUvBzUrA6RMe3efl1O4npkicvQXj5pPhZX8ojEtUAj66jMlkKRQeUmmrenjXQOsjkH06oKYjfxkwOoXhUC@lists.linux-m68k.org
X-Gm-Message-State: AFuF++ngkWbaTAMcPBqhuG8HnVi7H6TTAdR/huHLJY0DWxilq2SinpaX
	6EiNhWR1rxH3wNkiWB2TjpqH1ZneoSELJGXKUIS+V5ch0EWTJE2isEmX
X-Gm-Gg: AYBFou35+bXhT7rWFCzD03ZwCcXzfwpXJTqEx8UITWjtZKIXNH3jveLWyx+SgeoiStg
	sMM5ApsvTCcXHj2nwpDFcYzLhahydI78a/0oPCd7Hh+YTBEggeY1Fj9yo8WyeQbaGHXoJArST4z
	sYHuQYjHRNwd9SBUMTU/3AW2s5CEtS+eaTw+jctGdCqzQHB/BMvFtXRvE6f8//OXpn9oWZXtG8B
	BD7nXZd3QP2OyJ6FU3kfxwDxU5lBPksG3xvbvOo75ZL+lkSYk4JpXcWc5kz9PZxB5OFeC1vbuhu
	9SsM2D4h6NHW8Hfwz2rtCQ/PAR0AGuH6ObLUixU9ibxFrAAjGEE7SCxSkeKHQ9EM/dk+w7EPEGo
	5p/ciJxFv305/5z4xjZhJaJ5YoIWMTbfNY3Lgg68miUbYngA+RB749+bUWQ/obTYtusObSwE4ZX
	6tiJJOeDSbq1HZFz+RwnmMcOxE0w2HnVaUuq8TSNtLcEVfiDLPcpIeLqvtTVXilsAiRteQlUfdo
	yjsbcROUWI0RtrciOSP6ERv04HrFiUU4E54ANjCZkHEqrO53WtEJU2jdQ3SRnyIuw==
X-Received: by 2002:a17:90b:1d45:b0:398:9bd4:d1a with SMTP id 98e67ed59e1d1-39b262995b8mr41799602a91.25.1788860436531;
        Tue, 08 Sep 2026 02:40:36 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm31999240a91.13.2026.09.08.02.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:40:35 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org,
	miodrag.dinic@mips.com
Cc: radu@rendec.net,
	zewenchen@google.com,
	jamiechen@google.com,
	edwardwchen@google.com,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 0/6] m68k: virt: Switch to generic goldfish PIC driver
Date: Tue,  8 Sep 2026 09:40:10 +0000
Message-ID: <20260908094016.1997918-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the m68k virt machine to use the generic goldfish PIC irqchip
driver instead of maintaining a duplicate, platform-specific interrupt
controller implementation in arch/m68k/virt/.

The whole patchset is tested on  qemu-system-m68k -M virt and verified
that interrupts across multiple goldfish PIC instances fire and
increment properly in /proc/interrupts.
---
P.S. From a quick search on lore, Miodrag has been inactive on LKML for
a while. His last appearance was just handing over the goldfish-rtc
driver 6 years ago, and prior to that it goes all the way back to 2017.

With tglx's recent call for irqchip reviews in mind, I actually use and
care about goldfish devices on qemu for both linux and u-boot, so I'm
happy to help review future patches for this driver. I can follow up
with a MAINTAINERS patch if that sounds good.

Kuan-Wei Chiu (6):
  irqchip/goldfish-pic: Use gf_ioread32/gf_iowrite32 for MMIO access
  irqchip/goldfish-pic: Use for_each_set_bit() to iterate pending IRQ
  irqchip/goldfish-pic: Allow selecting CONFIG_GOLDFISH_PIC on other
    architectures
  irqchip/goldfish-pic: Add goldfish_pic_init() for non DT platforms
  m68k/irq: Add empty irq_eoi callback to auto/user IRQ chips
  m68k: virt: Switch to generic goldfish-pic driver

 MAINTAINERS                              |   1 +
 arch/m68k/Kconfig.machine                |   1 +
 arch/m68k/kernel/ints.c                  |   6 ++
 arch/m68k/virt/ints.c                    |  89 ++----------------
 drivers/irqchip/Kconfig                  |   2 +-
 drivers/irqchip/irq-goldfish-pic.c       | 113 +++++++++++++++--------
 include/linux/irqchip/irq-goldfish-pic.h |  15 +++
 7 files changed, 105 insertions(+), 122 deletions(-)
 create mode 100644 include/linux/irqchip/irq-goldfish-pic.h

-- 
2.55.0.979.g7e5102b832-goog

