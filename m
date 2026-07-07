Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0773F99ED
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Jul 2026 13:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429818; cv=none; b=TVpfF62a+3oCYBdn/DlzUkAz0Tc6/DNzd9wEZ86vntp8WoXvU4jGNfWMjrCOBDvE6/QLe97chlSFkQf+y23rNw73k4Zzo03fddNeaBbHEq1H6F/Tk+rqcrwI+0SNvDs1HiItCB3X8NQ7eyITQ8EQIoePtk5eGd3Jaw8asvKtkM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429818; c=relaxed/simple;
	bh=IIa3hDQatRrqekipLsd92O/37AZX6wcSGd7hHIX2xjs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ba8hEwhQHSq1IJhdqKbaVbqUE6cHUmQUgkApC5fXfasULFi6iJo+BLUSSpgRl7Mp5LAxskdyDoa0oCuOB3U3ga+lEd5Yl5ecfAA5gnuDSIzA84thVCZS4ZYp7n5BR3tSK0xzOVUV3D2lM9CXoYWkfkX16mCIrQZzJtx4Nk9ZR6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mfy4ciim; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mfy4ciim"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ADFE560018;
	Tue,  7 Jul 2026 13:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AFFC1F000E9;
	Tue,  7 Jul 2026 13:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783429816;
	bh=klH9EdGi9gUpn4EA/F5PnVVZ9TA3alylXKJq6Ubkk70=;
	h=From:To:Cc:Subject:Date;
	b=Mfy4ciim7l/Dn9ZpY7wzvS7mwx1sJdPj2Uc5BpYeKyMgTiwrSlDce615lIypLOrpN
	 05MmNjTMFO++Z4i8O+/eDY1BicCAQCCAvNnuCzPy/7X0gNkZR3gXK/0SD+W9Eo7uL+
	 LdMd7PaUo+8H0gEC4NQsea7mzNnO0AMSgf6NKk780BvFo1RR1OXXd0pvPhbL4cs5A6
	 XQImZ0fNklxWTgqyCTkpjGO9Wu9zQr2CM2nPMXdf1yuOcAb+BOkXpjLsbBfYYzk/qa
	 Y/f92cArOOyAdXxQpS9PwWd3897msS2hrlmzyK7RjXLKuuHhG/q39NkdEpxAaXL//u
	 8ytKxPUNfs1hg==
From: Greg Ungerer <gerg@kernel.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68k: defconfig: add config for M52358EVB board
Date: Tue,  7 Jul 2026 23:10:11 +1000
Message-ID: <20260707131011.2631502-1-gerg@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Greg Ungerer <gerg@linux-m68k.org>

Add a default configuration for a basic M5235 based EVB board.
The SoC has been supported for a long time but there is no default
configuration. Create one to improve build and test coverage.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/configs/m5235evb_defconfig | 52 ++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 arch/m68k/configs/m5235evb_defconfig

diff --git a/arch/m68k/configs/m5235evb_defconfig b/arch/m68k/configs/m5235evb_defconfig
new file mode 100644
index 000000000000..fcac4ccd332d
--- /dev/null
+++ b/arch/m68k/configs/m5235evb_defconfig
@@ -0,0 +1,52 @@
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_EXPERT=y
+# CONFIG_FUTEX is not set
+# CONFIG_EPOLL is not set
+# CONFIG_SIGNALFD is not set
+# CONFIG_TIMERFD is not set
+# CONFIG_EVENTFD is not set
+# CONFIG_AIO is not set
+# CONFIG_KALLSYMS is not set
+# CONFIG_MMU is not set
+CONFIG_M523x=y
+CONFIG_M5235EVB=y
+CONFIG_RAMBASE=0x00000000
+CONFIG_RAMSIZE=0x01000000
+CONFIG_VECTORBASE=0x00000000
+CONFIG_IPSBAR=0x40000000
+CONFIG_KERNELBASE=0x00020000
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_BINFMT_FLAT=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_INET_DIAG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_FW_LOADER is not set
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_RAM=y
+CONFIG_MTD_UCLINUX=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_NETDEVICES=y
+CONFIG_FEC=y
+# CONFIG_INPUT is not set
+# CONFIG_SERIO is not set
+# CONFIG_VT is not set
+# CONFIG_UNIX98_PTYS is not set
+CONFIG_SERIAL_MCF=y
+CONFIG_SERIAL_MCF_CONSOLE=y
+# CONFIG_HWMON is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_EXT2_FS=y
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+CONFIG_ROMFS_FS=y
+CONFIG_ROMFS_BACKED_BY_MTD=y
+# CONFIG_NETWORK_FILESYSTEMS is not set
+# CONFIG_SLUB_DEBUG is not set
+CONFIG_BOOTPARAM=y
+CONFIG_BOOTPARAM_STRING="root=/dev/mtdblock0"
-- 
2.54.0

