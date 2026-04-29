Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBD31922F5
	for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Apr 2026 14:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472700; cv=none; b=XpLnnp0wyUmWH2lu/sUFoSEYNHLwEGQzbjSh7F5vXJ+qDe8FXT/+B4p8MIKs/29uSNf5K92Zd978Lj71kzDFqbpZPYfW+CZTSgaFLdZJaBgnfSRZRsnb8J5GFbg1JG9967wVdxfhv47mMoK6xyIwHJfvHQNplVk94adpcJPmMlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472700; c=relaxed/simple;
	bh=cyiCug8xBn4xLrTqJKuUa2c5NZB4/EooJzkBJcc7ujE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Peefn9RErOkSfwoQS5m+hZnX20WG9htOAxDsQRKm2TL3xMkg1kvE3M8n37qq3wdUfGPP3WMMbgdScaASlGwjImkPmNsCCuY8hsLljTRqaTYanve8C+TKLBpPFiHhJdZodOrOYa+//mAFTJBUrlJAT1mewkXpDFQNKeUfS/V6ykM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E58BF442F6;
	Wed, 29 Apr 2026 14:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE840C4AF09;
	Wed, 29 Apr 2026 14:24:57 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 1/4] m68k: defconfig: add config for M5329EVB board
Date: Thu, 30 Apr 2026 00:24:05 +1000
Message-ID: <20260429142452.1200856-2-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429142452.1200856-1-gerg@linux-m68k.org>
References: <20260429142452.1200856-1-gerg@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Greg Ungerer <gerg@kernel.org>

Add a default configuration file for the Freescale M5329EVB board.
Although the SoC type has been supported for a long time there has been
no defconfig for the base platform. Create one to give better build
and test coverage.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/configs/m5329evb_defconfig | 77 ++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 arch/m68k/configs/m5329evb_defconfig

diff --git a/arch/m68k/configs/m5329evb_defconfig b/arch/m68k/configs/m5329evb_defconfig
new file mode 100644
index 000000000000..3ef24a0c834a
--- /dev/null
+++ b/arch/m68k/configs/m5329evb_defconfig
@@ -0,0 +1,77 @@
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_SYSFS_SYSCALL=y
+CONFIG_EXPERT=y
+# CONFIG_FHANDLE is not set
+# CONFIG_FUTEX is not set
+# CONFIG_EPOLL is not set
+# CONFIG_SIGNALFD is not set
+# CONFIG_TIMERFD is not set
+# CONFIG_EVENTFD is not set
+# CONFIG_AIO is not set
+# CONFIG_KALLSYMS is not set
+# CONFIG_MMU is not set
+CONFIG_M532x=y
+CONFIG_CLOCK_FREQ=240000000
+CONFIG_RAMBASE=0x40000000
+CONFIG_RAMSIZE=0x02000000
+CONFIG_VECTORBASE=0x40000000
+CONFIG_KERNELBASE=0x40020000
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_BINFMT_FLAT=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_IPV6 is not set
+CONFIG_UEVENT_HELPER=y
+# CONFIG_FW_LOADER is not set
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_RAM=y
+CONFIG_MTD_UCLINUX=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_NBD=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_NETDEVICES=y
+CONFIG_FEC=y
+# CONFIG_WLAN is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+# CONFIG_VT_CONSOLE is not set
+# CONFIG_UNIX98_PTYS is not set
+CONFIG_SERIAL_MCF=y
+CONFIG_SERIAL_MCF_BAUDRATE=115200
+CONFIG_SERIAL_MCF_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_SPI=y
+CONFIG_SPI_COLDFIRE_QSPI=y
+# CONFIG_PTP_1588_CLOCK is not set
+# CONFIG_HWMON is not set
+CONFIG_FB=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_LOGO=y
+CONFIG_LOGO_LINUX_MONO=y
+CONFIG_LOGO_LINUX_VGA16=y
+CONFIG_VALIDATE_FS_PARSER=y
+CONFIG_EXT2_FS=y
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+CONFIG_JFFS2_FS=m
+CONFIG_ROMFS_FS=y
+CONFIG_ROMFS_BACKED_BY_MTD=y
+# CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_CRYPTO=y
+CONFIG_CRYPTO_NULL=m
+CONFIG_CRYPTO_AES=y
+CONFIG_CRYPTO_ECHAINIV=m
+CONFIG_CRYPTO_SHA256=m
+CONFIG_FONTS=y
+CONFIG_FONT_8x8=y
+CONFIG_FONT_8x16=y
+CONFIG_FONT_MINI_4x6=y
+CONFIG_FRAME_WARN=1024
+CONFIG_FULLDEBUG=y
-- 
2.54.0

