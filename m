Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0D3387370
	for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 18:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768242195; cv=none; b=h+yu5bGtJBOYPnJqHgMzcXdyXO4qhzZPEC4DX/7yEXhQsB1T913EkyvGFw/CodAw3j9PcA2aNzj2JOHE7MQw0jvKxT7SDcW5PX7xAfdQQZ/3qFFZOL8FFMZVTYU/kNRIlW75+fxTHwl5B8us4m7R6Odxhae+4506NDs36/cjcTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768242195; c=relaxed/simple;
	bh=2QtKLjJUQEoCJQaHKjpnH3IwdHEGqEsfUmEqicyo0ss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QMf+M9B12CzbuxO+i16IGJu2gpKR9YtdDQKm0RGKR59c8Q4ukOQH5YYURGvnb2uU7jEkrqZ8drZuNQOgatpKR96r7ng5Ie+o45ygUSay338MnS+XB3/Ur6xvc52/WJsH5tyU/Rjyqz/ZZwg162fMF+SpIpQk3sjudM31ToxHMyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsYR/Xgw; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsYR/Xgw"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c0bccb8037eso2892983a12.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 10:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768242191; x=1768846991; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YF3AVkxsTcjAysM3wvWeUS9ZoFA004AjKvMbKLzO3IY=;
        b=AsYR/XgwAejEAZdg4dxJuLnKyEVsQXBaEmSR0Ri4lgkzdGfbLenCtj37pygKOGoJXB
         Jxsz1dY8qb5lJDSSXCBdar7hxxH9S3l1XdbOkDeeB40nX0Y9K1DccBpT66og8k07IUKB
         AGvpvrY/v09/ZQZP2ch5sJZ7XauKEuSIiMbxYbLEo9gar8gX4o3c7wXvE7aMoaQbYzea
         7evINmO3wN86z3wq+rSh6iJ+eplPIsPv7YAr8t1t2w/xxO/bs4Tprv6HMVLnIqJRknaB
         ow9aMvvI5v5xGT644DJcj3q2CWHRC171/CHIBFipkKOAL7BlRvGxSSZkkOljigrx5nxV
         nYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768242191; x=1768846991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YF3AVkxsTcjAysM3wvWeUS9ZoFA004AjKvMbKLzO3IY=;
        b=fRY8lPwK3PRvwnewLBAUcqaeDwqpoKzsjjLZ4aD5hI9Ki29J6kXmdmO1tV5P2bbRDf
         clnd7EO6OFsakAdm25RfJOHWbO2eRQWDUknejXErf707Jz2VScljFSNdnHoi116jShgZ
         eoRdFwj23rRdDX+psRxtHcbwmXJysK0K2MZSYDwHkl8cFt/1C8RWZuiKmZ2003t1fJa5
         MmzPbk6yMZfV7bQQsBSWHhImKocIbhd9SsEED4hlFl+xMeTNAyz/E9sBSKM+Y4o6fLsx
         2ip2PfUdkwfRVkWXi1sF7ctfzxVr6qm8I4akobbI2t63XUT/svZUbctkXwGl2dmPHs3y
         vKnw==
X-Forwarded-Encrypted: i=1; AJvYcCXT6uTvVmseM71et8q7MB0PrZKc6SolZRW7TGs36Jekb0J35j9IsZn+kaLBYGfBPP6PqFBnbugjNTLI@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yzxy+15s5KKL24Atf8yAFFxNLBOenurxfPo50T2p4MewFJjDqa2
	skZLw5teorNGysMGZ5Cm7VcgDg3tfuqXRXnbrMHiVZemU7CUtZGJuUj4
X-Gm-Gg: AY/fxX4QEjT1hZfv3Fd+cHTSMjLD1yeFY12JrOYcp4ipNF7GayzTCJ8pTjBX8Rg8MRz
	AyGff+IYOwEX3b89/LiDgwJxj9g7xgKq40q5MnUSVaL2AV6XJgSFxzIKT1wfBStggUxMnR0TNFo
	EklpGlNjox4MKMkuOU9mg/TKp6Itl0URMlDHnGlu42btDKAmzeF76U+voKdbq4aqrhpHJWTR1p+
	co/UcxHkOF4j4oLuTgw1bf/cpMHF3H7w+TB32zMX0H7yADF8NpwRe1QzQUPUFW/ehqI2SG5gGDC
	8C2yJvktii+m4jcfqVas8Y5/sMBe+blnFrattaQ8MswpmpIR7IgHYH8bZ844Ns6K2QGpFjBLqMq
	Rpg2ItSZ01YNjfQX53XVqv+uExa+4tB++fnqyVdzx8Q7nP6k/uOwf7sLzdfSsc9Gp6CYYhBopQF
	+VtGTC8+5FKtn2thv3C8wH6pFkVWAZhpw+kLKM0vuobpmBb2UKaI7GyPev/VJUFnNZZbiyQEu5C
	ZUOofcQL/X6DCjJLZKHyA==
X-Google-Smtp-Source: AGHT+IEmRo9q8nqLipvVwRTR8qCLNp9eYKwhxSb0S8NZW7a9hoCVY9lEmri2jzPiLwH8s8Uer0RLlw==
X-Received: by 2002:a17:903:3884:b0:295:290d:4afa with SMTP id d9443c01a7336-2a3ee46179fmr167389495ad.23.1768242190608;
        Mon, 12 Jan 2026 10:23:10 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc794asm180981205ad.70.2026.01.12.10.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:23:10 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	sre@kernel.org
Cc: jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-pm@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 0/2] Add QEMU virt-ctrl driver and update m68k virt
Date: Mon, 12 Jan 2026 18:22:55 +0000
Message-ID: <20260112182258.1851769-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a generic platform driver for the QEMU 'virt-ctrl' device [1]
and transitions the m68k 'virt' machine to use it, replacing
architecture-specific hooks.

The new driver ('qemu-virt-ctrl') registers a restart handler and
populates the global 'pm_power_off' callback.

On the m68k side, the platform initialization is updated to register
the 'qemu-virt-ctrl' platform device. Additionally, the 'mach_reset'
hook is bridged to 'do_kernel_restart()' to ensure the kernel's restart
handler chain is correctly invoked.

Verified on QEMU m68k virt. Both system reset and power-off were
confirmed functional by invoking 'reboot(LINUX_REBOOT_CMD_RESTART)' and
'reboot(LINUX_REBOOT_CMD_POWER_OFF)' from userspace.

Link: https://gitlab.com/qemu-project/qemu/-/blob/v10.2.0/hw/misc/virt_ctrl.c [1]

Kuan-Wei Chiu (2):
  power: reset: Add QEMU virt-ctrl driver
  m68k: virt: Switch to qemu-virt-ctrl driver

 MAINTAINERS                          |  6 ++
 arch/m68k/virt/config.c              | 42 +-----------
 arch/m68k/virt/platform.c            | 20 +++++-
 drivers/power/reset/Kconfig          | 10 +++
 drivers/power/reset/Makefile         |  1 +
 drivers/power/reset/qemu-virt-ctrl.c | 98 ++++++++++++++++++++++++++++
 6 files changed, 133 insertions(+), 44 deletions(-)
 create mode 100644 drivers/power/reset/qemu-virt-ctrl.c

-- 
2.52.0.457.g6b5491de43-goog

