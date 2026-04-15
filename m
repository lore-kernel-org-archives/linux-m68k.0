Received: from mail.kernel-space.org (v2202511311555398556.powersrv.de [46.38.245.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F0D19D8BC
	for <linux-m68k@vger.kernel.org>; Wed, 15 Apr 2026 21:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.245.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776287861; cv=none; b=UnHcBP0eMsXeF7k6/6jJ4mheOoQXhRsRxia/OOBUS0ZQnf5YNPzT06QpOQhupROERhtinaWedv4GR9WCU9AZ1/GiYIoRcHjuBEq+Zom9IgpbNS1qt1/nHPyMhin5W3A+Vaif5yNUDbWXaCzW9r7Qwnz39jtRcY7IY3y6hVCyS1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776287861; c=relaxed/simple;
	bh=UUmfoT4sTRQWI9jzx0PcGK2PjZIrqyFY8abYyxArgxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ITe8wjoXopaZJYBxceRAeCingSQ6peWFq0W7MqYjLntEzYjsAsIunw5tiuMh/Wf0d3P/25rEXfsm/sOtWnWuCXNqzvqlS4p/APd+yS1rzyJF7y8IXgHXAWSBRcxsKZ7NeqmD3JwGZZ0P/FZuXzn07bkji72mK9ok34AXs9r9ZGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernel-space.org; spf=pass smtp.mailfrom=kernel-space.org; dkim=pass (1024-bit key) header.d=kernel-space.org header.i=@kernel-space.org header.b=qi5WqlKP; arc=none smtp.client-ip=46.38.245.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernel-space.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel-space.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel-space.org header.i=@kernel-space.org header.b="qi5WqlKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
	s=s1; t=1776286257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cGttkKn/QoemJEixO46wvfRLhN5KEgKRUduR75Z5IX0=;
	b=qi5WqlKPD5GDttEzuEUnMB8r8cCVkONFIUmrweOR7+1GwTCycU8oU8KfsbPTigqo4hCxuu
	btB1ahIFixIIjFS/X89GqSwkY70b8bJFNu6iQ2yAUWyJ33jn/4M9GM3r4ANE+svtxjqC4p
	y6Y+txIP11dmPODiGLX3TNwmlYAKC14=
Received: from archlinux (<unknown> [2a07:7e81:7daa:0:62cf:84ff:feee:627])
	by oreshnik (OpenSMTPD) with ESMTPSA id da9c74a7 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 15 Apr 2026 20:50:57 +0000 (UTC)
From: Angelo Dureghello <angelo@kernel-space.org>
To: gerg@linux-m68k.org
Cc: geert@linux-m68k.org,
	linux-m68k@vger.kernel.org,
	Angelo Dureghello <angelo@kernel-space.org>
Subject: [PATCH 1/2] config: stmark2: defconfig updates
Date: Wed, 15 Apr 2026 22:50:41 +0200
Message-ID: <20260415205042.20930-1-angelo@kernel-space.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Various updates, mainly to reduce kernel size.

Signed-off-by: Angelo Dureghello <angelo@kernel-space.org>
---
 arch/m68k/configs/stmark2_defconfig | 33 +++++++++++++++++------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
index 515d9b208b10..b3fb95f73a95 100644
--- a/arch/m68k/configs/stmark2_defconfig
+++ b/arch/m68k/configs/stmark2_defconfig
@@ -2,16 +2,20 @@ CONFIG_LOCALVERSION="stmark2-001"
 CONFIG_DEFAULT_HOSTNAME="stmark2"
 CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
-CONFIG_NAMESPACES=y
 CONFIG_BLK_DEV_INITRD=y
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZO is not set
+# CONFIG_RD_LZ4 is not set
+# CONFIG_RD_ZSTD is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_EXPERT=y
 # CONFIG_FHANDLE is not set
 # CONFIG_AIO is not set
 # CONFIG_ADVISE_SYSCALLS is not set
 # CONFIG_MEMBARRIER is not set
-CONFIG_EXPERT=y
-# CONFIG_VM_EVENT_COUNTERS is not set
-# CONFIG_COMPAT_BRK is not set
+# CONFIG_KALLSYMS is not set
 CONFIG_COLDFIRE=y
 CONFIG_M5441x=y
 CONFIG_CLOCK_FREQ=240000000
@@ -21,10 +25,12 @@ CONFIG_RAMBASE=0x40000000
 CONFIG_RAMSIZE=0x8000000
 CONFIG_VECTORBASE=0x40000000
 CONFIG_KERNELBASE=0x40001000
-# CONFIG_BLK_DEV_BSG is not set
 CONFIG_BINFMT_FLAT=y
 CONFIG_BINFMT_ZFLAT=y
 CONFIG_BINFMT_MISC=y
+# CONFIG_COREDUMP is not set
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_VM_EVENT_COUNTERS is not set
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_ALLOW_DEV_COREDUMP is not set
@@ -47,11 +53,11 @@ CONFIG_MTD_SPI_NOR=y
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_SERIO_LIBPS2=y
 # CONFIG_UNIX98_PTYS is not set
-# CONFIG_DEVMEM is not set
 CONFIG_SERIAL_MCF=y
 CONFIG_SERIAL_MCF_BAUDRATE=115200
 CONFIG_SERIAL_MCF_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
+# CONFIG_DEVMEM is not set
 CONFIG_SPI=y
 CONFIG_SPI_DEBUG=y
 CONFIG_SPI_FSL_DSPI=y
@@ -59,7 +65,7 @@ CONFIG_DEBUG_GPIO=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_GENERIC_PLATFORM=y
 # CONFIG_HWMON is not set
-# CONFIG_HID is not set
+# CONFIG_HID_SUPPORT is not set
 # CONFIG_USB_SUPPORT is not set
 CONFIG_MMC=y
 CONFIG_MMC_DEBUG=y
@@ -68,6 +74,8 @@ CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_ESDHC_MCF=y
 CONFIG_DMADEVICES=y
 CONFIG_MCF_EDMA=y
+# CONFIG_VIRTIO_MENU is not set
+# CONFIG_VHOST_MENU is not set
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y
@@ -79,14 +87,13 @@ CONFIG_EXT4_FS_SECURITY=y
 # CONFIG_DNOTIFY is not set
 # CONFIG_INOTIFY_USER is not set
 CONFIG_OVERLAY_FS=y
-CONFIG_FSCACHE=y
 # CONFIG_PROC_SYSCTL is not set
-CONFIG_CRAMFS=y
 CONFIG_SQUASHFS=y
-CONFIG_ROMFS_FS=y
-# CONFIG_CRYPTO_HW is not set
+CONFIG_XZ_DEC=y
 CONFIG_PRINTK_TIME=y
-# CONFIG_DEBUG_BUGVERBOSE is not set
+CONFIG_DYNAMIC_DEBUG_CORE=y
+# CONFIG_DEBUG_MISC is not set
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
-CONFIG_SLUB_DEBUG_ON=y
+# CONFIG_SLUB_DEBUG is not set
 CONFIG_PANIC_ON_OOPS=y
+# CONFIG_RUNTIME_TESTING_MENU is not set
-- 
2.53.0

