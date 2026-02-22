Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E81D79CD
	for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Feb 2026 17:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771781562; cv=none; b=jG0V8Yrzapf4svyXvTl+fbz2Cl5dYu7bSQlzQ3xoFIxrjMnSi4NfKUXSRQRdRrbFHkwaUR85COBglzjjlErzZnWSLquhBtorN0EEQDqBVjYPCtZakezsIKKRbuHLSsdUrDhv7z0BttIvRdQn7zyn1PxLC6QkY/GJurLYy1DEeQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771781562; c=relaxed/simple;
	bh=84RpaymkYjedYJkOTZPTM2j0/+tI4Ix62BDTCGBRBsE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wswvt/gq/j6vwDC5a+jfhpF2//Cq+hYsIJzPzTu5BTuGUukioY0meEWi3E7/O3mdehRkmjJpqsVUSw06/JGLl5nlxBzv196xWVM/ZUVwWvOoOZt0FZ2OK4EbhdYCxVFSyQv2k1BtE8Vw9jnY4LDE9fDLvfaPCKOpmHtyAqgrWzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sf1tgrXw; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sf1tgrXw"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c6e72d7a4d7so2346769a12.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Feb 2026 09:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771781561; x=1772386361; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0C5225Erxu+gYNOcbLKnNHNXfo0Dpl+lzsBtZrdkm/8=;
        b=Sf1tgrXw1PyI98U6mrq/NS8HC89r2MkshTM7w/kTEgGj5+RWlYQIFE+piDmh0bQiNh
         qVydwd+oCIAYcXWQGiW6RsA0/k2U/J15ZAIbdEcY5wyPE7NLrRs7zgWmaT9mOWiN4q6z
         I/RWszstSwZb92Tq7xB+am6tpUz/mzr35WYdMXtoFB65YsLGGbsm0vOLDFAorENsuHC+
         KmEvZwGuYKpqV6yYl34Wt9ppUVQa/E+yrAp7Na/zGMv24XV8xf7H98QSxEeZWTAeEu1z
         iw+GGJblZ+AYSMhpNtaoEMglZvLFc9b2ca2bnSVYzUQqecy5K0rpgp4VmVopS6iT4ID4
         buow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771781561; x=1772386361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0C5225Erxu+gYNOcbLKnNHNXfo0Dpl+lzsBtZrdkm/8=;
        b=WiYe1nfG2ipfPcryvF822SfX20gIVYGVm8qoH6wRj2uUT+AQghkXEryOFTJQabr5m4
         gjIaIvo0P+8sIVwAQVhRd0RdcCB7Ue2XXHreUeJM4gL5UeWO/KUxXaiNAJ5DeQKi16f/
         mKgr4uwXvEFIe9u4zsAA0VMAWVuqQP4325FDVgHf55o+2DXXcWLQrMavC/laKDDicIlL
         aVPq8N1gZPASEFBTaguhBwgy+DwqcUx4IeLRSSloAl516wjIDWRJRjvKLcahiLQ/Q8Zv
         dBKYq0KK9rMFq4rLVmCf0GEdRTnomTCliiHnSkyLLcW26qT2ElluC7oC0qWqD77mHH2A
         XbTA==
X-Forwarded-Encrypted: i=1; AJvYcCU13J4ScWzbgPMIFbJ5qwyS4jUKlW4zwjKlziAQHFRJiOcOIz+yY2koTr9jckX837tTW/JGN9l3ZxvH@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwenEdtWuCES8szp8d0vYXw/GegBqEHzjhqBiG3XLV/7gKlo1hT
	lkVg1MbjE7Q1DFAujTwSLh7aAaVRLqCHcicY0TDkEJE11fM0qRyFvS7u
X-Gm-Gg: AZuq6aIGUZTo6X720x1h0zkRCsfubBx1ARVBPPzf1f2+VBNALni2ic0daJ9okHL4H6+
	JoFrr0quUs/ICBwKDH7RPYuoe3N9Xh5tyddHwElghmeGB1tz0wEfVusuwdyoCB31d/aesCeDi6l
	geiwrC96IIImdp5+sdAxpsr69X4u3tiyZvpXxIrAPLEsGwJNmS2H9pHLUDodhcx4lkOTif1K7ei
	Gsbbm92HFfMStsh6TjC3NFqj0OQLJyyvEirccnG+tLgHxuk8VlLmGaVe/hoFpVV4yPbqr+rl6Db
	TVuI/psCl1PPjew38++Hwu7nGNXoZ7hji0jrPKJ2votJ4FQar0pVNOu6E+AerD1ndCVrnakw2uP
	ZxtjZoy6fNw23Ofk67Fu84JmxO+PnrwS+d1jqX+DJDk9CYalGxwrqgA005YMmaZnvlqTu4zcVsD
	dJs977Kdeizv5V9VyzMpLAHolzKdIuq6z/inPjZTrkNsopul0cv9YPLLRoKhsVDat1XdjDwj6yz
	3vj7YfAYD4TYUI2m+e0gW8Rx1vBc7M0JSSJ
X-Received: by 2002:a05:6a21:3389:b0:35f:46d3:f28e with SMTP id adf61e73a8af0-39545f8d743mr5588261637.43.1771781560668;
        Sun, 22 Feb 2026 09:32:40 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (7.162.199.104.bc.googleusercontent.com. [104.199.162.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b726cbf2sm5275750a12.34.2026.02.22.09.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 09:32:39 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	sre@kernel.org
Cc: jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	daniel@0x0f.com,
	laurent@vivier.eu,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-pm@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v3 0/2] Add QEMU virt-ctrl driver and update m68k virt
Date: Sun, 22 Feb 2026 17:32:23 +0000
Message-ID: <20260222173225.1105572-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.345.g96ddfc5eaa-goog
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
confirmed functional by invoking 'reboot(LINUX_REBOOT_CMD_RESTART)',
'reboot(LINUX_REBOOT_CMD_POWER_OFF)', and
'reboot(LINUX_REBOOT_CMD_HALT)' from userspace.

Link: https://gitlab.com/qemu-project/qemu/-/blob/v10.2.0/hw/misc/virt_ctrl.c [1]
---
Changes in v3:
- Add a reboot notifier in the driver to handle LINUX_REBOOT_CMD_HALT.
- Handle native endianness in the driver instead of hardcoding
  big-endian I/O writes.
- Select POWER_RESET and POWER_RESET_QEMU_VIRT_CTRL in m68k
  Kconfig.machine.

Changes in v2:
- Use devm_register_sys_off_handler() instead of register_restart_handler()
  and global pm_power_off.
- Switch Kconfig to tristate to support modular build.
- Add .id_table to platform_driver and use MODULE_DEVICE_TABLE() to correct
  module auto-loading.

v2: https://lore.kernel.org/lkml/20260203170824.2968045-1-visitorckw@gmail.com/
v1: https://lore.kernel.org/lkml/20260112182258.1851769-1-visitorckw@gmail.com/

Kuan-Wei Chiu (2):
  power: reset: Add QEMU virt-ctrl driver
  m68k: virt: Switch to qemu-virt-ctrl driver

 MAINTAINERS                          |   6 ++
 arch/m68k/Kconfig.machine            |   2 +
 arch/m68k/virt/config.c              |  42 +--------
 arch/m68k/virt/platform.c            |  20 ++++-
 drivers/power/reset/Kconfig          |  10 +++
 drivers/power/reset/Makefile         |   1 +
 drivers/power/reset/qemu-virt-ctrl.c | 122 +++++++++++++++++++++++++++
 7 files changed, 159 insertions(+), 44 deletions(-)
 create mode 100644 drivers/power/reset/qemu-virt-ctrl.c

-- 
2.53.0.345.g96ddfc5eaa-goog

