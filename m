Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F7533D6EB
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Feb 2026 17:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770138518; cv=none; b=HUMDnYjjgF5nDHQRD10iZNUyyyo/v3GEc8jGvMOB5dujHfCzrBvRz0ccFeSOH6+lA6EQVJZkux/4y3n9PMgZeXAA1RldyRaumkfR+mOIu4qSRf5YtB4pxutCleavJHGaaLST6Ttj1P9CY1RcTXdNdKWSF+9tGxY3m6zsxXAZ5GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770138518; c=relaxed/simple;
	bh=9d2BGazhIYXPwhBFBoQUyC6ZxxKt0RrvnVioMb0m0gc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZOk1QUCHre5Mi4iixx9NtJWKGDd77qKKpuJCAEhZTE7r79v8V80DS43bq8qOp0e/Ljdal+ZTa32aGe/w7U0/MxJLC03FSPmTw+ubq6jxhB2IHQ2lSrxgbav1bX1PD71lsMxH9qhkUDkwL7XUDkaWIHOcaBxa4Mxxw9N9O2CWtoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQeBi9G/; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQeBi9G/"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34c3259da34so3654958a91.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 03 Feb 2026 09:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770138516; x=1770743316; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X75L+uiZCaHBsd3xEjw6pILEYYmRHS59ChoDO8zTouY=;
        b=bQeBi9G/3skhtOBrBrf4BG9swneG0msnECzj44tLt7SSImkwtWvGkKfW1D3Q48awhz
         mPfgPIlKc952X3PL0gMwWkJ0Y1QJFJuNa0IapqHPnzyAk3KUh9VLfwybC1bFuvYFlnwa
         XOxiRIq6HzvL+a/m3zhjSmczZKYaayQxs0MNf+ASNpm8CuMcuUXjvbu0i4qQUz0tHwiq
         N8Yd4orVEKCM1PCCkGQsFwWeyaAb4RLuWrg5sYU2Euv914haPah4KkF2rcrEk2JY6kEW
         uvCd5yHb3N1iI+k4QLJVeVmbWepuoyIfHLhMQbFH4m8lc+azLr2ODIHt9nsHjeiTiLAA
         Zx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770138516; x=1770743316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X75L+uiZCaHBsd3xEjw6pILEYYmRHS59ChoDO8zTouY=;
        b=tPOxVQcpWmzWsMJQMbQsVOO1D0QlOVnVeOLQpWHb86ZMMhe7iBGLY0wFqf2mV+pL8L
         kkKyow8uCTsZOHKwxPEa+TllCZF0W+yCzrObPjQvif9drCC/Kfu0s4Wb0BvNgyh/tkbh
         q5vSDB/SjniMGeeDpw0l0hfhPRD6kbOuEcgT9Lcd0dQwkCRMoVcKFXi+PeC+kbf0CHam
         K7V6aRPlpxPch00WfxId4ChQcvTlu3uKesK++6oThLn1XUd+m5VT3M6qJfICoZ90DCuo
         ak4LZSuFcATJt/QMkGD+sgkH+ST/VSu0qSi5ZrO+lssM4D8BiW3g1l8mxTQbGkqfF88I
         1uEA==
X-Forwarded-Encrypted: i=1; AJvYcCX+Kn121rD4NqSJtx5CXPNer7kEIwexf1wrejlj3AXPg57yTqo/A+KkVEhRmt9vTXd2Tcdo/igvIYxI@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw9ay+4dC7MLS20xOcG7R/bIpZO5mA7TewPazZSM9Rkotu344bB
	6iKM24X/bjbBtIeUMHnlkdyPdXLGW3WaMe5VK3ICRf5dkVsXVWuslpQm
X-Gm-Gg: AZuq6aLrDx6PJ4bBgPbsaiynSxz3ZxSPQIHtAXCvvvChD5Esx1rg9fprmv7EZh/agI9
	Om6ZgZkO3EzjjlLdVU5obolgjt5NDT6/aertrY9CtPQ/0dRt7PH4ZswZuar7eSqzSdSJKAfU8OE
	1xN/7N5x4AeP23RZIevUdO+dCcnwe/eh5+vwDH/4csoDEYdqJhjb7CoH3aksH9LsZVBReBBhb/i
	EG8LgS1pZqB7Qj+WJAb3tbHXULCkIFoOKJ+hTWNT7//AJu3rteJO9sQa5xZn2+TCUt+5lEKfkNO
	7kGC+4RZF0ZIL66t6QoxHnjIx4d/k+jVne45IOPCtrrJ9a1XYEAGsaECfJRJ4gadZelZVIKDsM5
	DPwHoWwLu4AyXsod93yInu4N4F9MRqt3jGtzy8jiGlmXhOKSocOZd8VZw1HsXTurW5SldUUomT/
	Kj/W+qqBYtT9qm980TtpIIQc+RPHZaiB29MuBduNCxcVeT4ILw4oaXKpXInINoFvd8Y2LaSwoQu
	xw1sip5PrTt7jkli7YiUaTiJ6E=
X-Received: by 2002:a17:90a:ec87:b0:34c:c866:81ec with SMTP id 98e67ed59e1d1-3543b3f1ccdmr13696817a91.36.1770138516527;
        Tue, 03 Feb 2026 09:08:36 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (118.239.201.35.bc.googleusercontent.com. [35.201.239.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3548633616csm177520a91.17.2026.02.03.09.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 09:08:36 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	sre@kernel.org
Cc: jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	daniel@0x0f.com,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-pm@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 0/2] Add QEMU virt-ctrl driver and update m68k virt
Date: Tue,  3 Feb 2026 17:08:22 +0000
Message-ID: <20260203170824.2968045-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
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
---
Changes in v2:
- Use devm_register_sys_off_handler() instead of register_restart_handler()
  and global pm_power_off.
- Switch Kconfig to tristate to support modular build.
- Add .id_table to platform_driver and use MODULE_DEVICE_TABLE() to correct
  module auto-loading.

v1: https://lore.kernel.org/lkml/20260112182258.1851769-1-visitorckw@gmail.com/

Kuan-Wei Chiu (2):
  power: reset: Add QEMU virt-ctrl driver
  m68k: virt: Switch to qemu-virt-ctrl driver

 MAINTAINERS                          |  6 ++
 arch/m68k/virt/config.c              | 42 +------------
 arch/m68k/virt/platform.c            | 20 ++++++-
 drivers/power/reset/Kconfig          | 10 ++++
 drivers/power/reset/Makefile         |  1 +
 drivers/power/reset/qemu-virt-ctrl.c | 89 ++++++++++++++++++++++++++++
 6 files changed, 124 insertions(+), 44 deletions(-)
 create mode 100644 drivers/power/reset/qemu-virt-ctrl.c

-- 
2.53.0.rc1.225.gd81095ad13-goog

