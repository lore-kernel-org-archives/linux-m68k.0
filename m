Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A33146A66
	for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Apr 2026 21:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776028810; cv=none; b=iYeq7N1wW7EQFoEtywCdDeLN9auM9DaVSZTza0EGR267KlljhrkCQoRg5hdqCtQAfzj2tmzb/9dKALIDBUJKTQCB2m2AClLGWsdm1gmKmP6p5ZnRm1MHIKZaBpkypnM5yuqxR08S59PHDZKYl+Ft4wuiEGjeB25nYJzLRoQH3wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776028810; c=relaxed/simple;
	bh=tMkRUfTN8Bncs3EGHrvIFw8FiA2N2/PBiKt5eJsmrek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PzBYgXPkGICQfu2LJL8o/fPrdlRRxrhBwcnjX4reMLgDy8W9pfp/ksQJVm/BhFIYhaFRpCQ56yJDXTP44eCtst5Hfgdov2f71C6sSAYAdE1bq0eWzdJIo/hyoPh6Xo/NRdQU8fIRmCCpepmRpJ3DrM+4ZCHoHGfsg5byhEuUkxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2sgO2c6; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2sgO2c6"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c76ffd06593so2599304a12.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Apr 2026 14:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776028808; x=1776633608; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gdpHnJzsZ54JHVpvw0E3kldQ22xP3xvLv/vXHJI/JDg=;
        b=S2sgO2c6YMj4crzrAqPHzNWSKuFgp3OxDy9YK1KRUsc7tigH2xQJumB47h1BYzv5Ie
         btBtKjUT1YFoIqRrb1Su07aIC0MFFQxxSwgm87oWxtaAwJxyzN9E8qrP4UGpMGbGICAO
         I9Q+5nwzwwNDrjUaE3BChaYnOc/EqpZ+vSLAIjqX7ifJbhyyScx9WrZFmZclzHYUxr8D
         kVpAIX961H/r93PlzFEGAVdBLsVI7qoBRkT1sZ8wf5Pdr9Yo4me0Ku2t8isb3OvUEi2A
         3YgZqzQW3wDSk9TkLC8XDmj8R3w+4VSpHq9LCXqOv3uN/7+X9Ek40F6ZhpZhaF8ETe0N
         2CQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776028808; x=1776633608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdpHnJzsZ54JHVpvw0E3kldQ22xP3xvLv/vXHJI/JDg=;
        b=MuusAp7oYqoHwYDHjS3wNGRZlMkssdjr3/Edpr16PEMpV5/cxonvWiQn1VoolPHRmj
         vMzLPNF6sFGPONfUoU4NPBc1DXgciDwpHw+iKXFa0tP/6jxHjwGfPQkDGkRBpSDarTDJ
         YUURBNKCPcJ42ohE9HOD58JUKXshrANwXl0evrID/cT2akZ6321nsB4Lam4RRPXXmLqD
         yUksMhMuvvL/ABtphsKdlu+UPa9DMnx0ANrqd4khdPmi8mEsntlxMcyYrw/qCewaSoC5
         ulenpttFAMBH6xvmbmhfjhrWvuim6F3yGuUa8Z6SXxmMEpsyXP5Y1DcFsxZAUJHzaCZI
         fFCA==
X-Forwarded-Encrypted: i=1; AJvYcCVx46vpanbvOsnL6rhbCsmnBYtUML2iGz4A7szVDqW2/24t8TzqbLbMdfXlXIPkexZ6THhlqALKLgTx@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzF6SNn407lnD4JAFzaNoN7oJRMFWr72ZsGX9s77vWY9J/CQMX1
	pu0gKOlHxT2T7pTdT2enQvn4jQc7vGMm5lwZH2c86xYPS23LGRFjlFIv
X-Gm-Gg: AeBDieuMJVCEfACIMXzO+Pq+LtEiFnjDS3aPxXmkpUrtJR3tUYLzwvdFLAFUMHeWcz8
	kgaxZrkg0BmkBdrw1NQNFkBm4Zb0p69fN8eZVFg/scmP0YoeZ/hsOLwQ3j9h15ATepd0LXDKwtM
	JLReOhd34QcXLtoFN7hFww7ATLpv/9Brj65wG+n6vaswJ/Cw5Kwy4AAStuGVYf6SBkhVxCTizBO
	GjzFRsfSbynyxYNacHz2AcST2VNfjybtAf+nCpY/GXRflcdGElzHrnRWGCh2FJyElxlbu+UiI7v
	VoEEYPfDKylKpqk9z+icOzl8OR+8EQB5S4zJlTWtN2QMxzcZIlkDofjrXR7ykqPjrIJRpNj4N/D
	V9HBn38cP9T2Vm3DTVs1dpZhuijMuYIbBGnPz4x+rqGxo2vQAsHy8fnADLHvvWNqzGPhYFa3x5u
	gPtv9BWliUGmFkXiNmha1w78onMjwJCjfSBfP7ybpPSPFd/AU3uhm4svJkKuYI3yxU/W1PqBq1E
	oes7fIcdB8jvlXRA6zxrKoSWSU4NurrxwL9tC4=
X-Received: by 2002:a05:6300:210d:b0:39f:c48d:fcd2 with SMTP id adf61e73a8af0-39fe3ddd0bdmr11728694637.27.1776028808178;
        Sun, 12 Apr 2026 14:20:08 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (100.130.194.35.bc.googleusercontent.com. [35.194.130.100])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a3e6d2sm7615779a12.32.2026.04.12.14.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 14:20:07 -0700 (PDT)
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
Subject: [PATCH v4 0/2] Add QEMU virt-ctrl driver and update m68k virt
Date: Sun, 12 Apr 2026 21:19:50 +0000
Message-ID: <20260412211952.3564033-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
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
Changes in v4:
- Fix sparse warning caught by kernel test robot.
- Pass the struct qemu_virt_ctrl context to sys-off handlers instead of
  the __iomem pointer.

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
2.53.0.1213.gd9a14994de-goog

