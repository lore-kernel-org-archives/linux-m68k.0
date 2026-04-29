Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335103176EF
	for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Apr 2026 14:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472702; cv=none; b=X20XoIb0LQPTskfQF0IknoX73G5WXn7KV5AR6zGWYQir+83g+3E9DhOiW6uMbeBmjstz5giuSif9Watl/WoVPfJNUuXHV77TxInNXbXQPrrxDfxrEsRajkSlZjypQ1pD+vN7Ix3RQkjnGLz6CysPFGK63cgoDWBo34CnjX/f/lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472702; c=relaxed/simple;
	bh=l0iajub1dlIe83K9rZhnSFyiZXF6rUs6CluFGV/xId8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ocSSWv7leMzT5tP1Sjleggog4hInChEvt2Sv5CixAWojEYXX2I2cpQKs+rCY9evwCyJ5d28ihFDWAQk8v5BHedfxDPxMAB7McwAKP6u35gw8nfT6jVOcdbl9qRMgp6kPN0dkjYoWsTiZvj0Kvqkdkg+6biQSzs0TtoUOntBUW70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8026A6015B;
	Wed, 29 Apr 2026 14:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A851C2BCB8;
	Wed, 29 Apr 2026 14:24:59 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 2/4] m68k: defconfig: add config for M54418EVB board
Date: Thu, 30 Apr 2026 00:24:06 +1000
Message-ID: <20260429142452.1200856-3-gerg@linux-m68k.org>
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

Add a default configuration for a basic M54418 based EVB board.
The SoC has been supported for a long time but there is no default
configuration. Create one to improve build and test coverage.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/configs/m54418evb_defconfig | 70 +++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 arch/m68k/configs/m54418evb_defconfig

diff --git a/arch/m68k/configs/m54418evb_defconfig b/arch/m68k/configs/m54418evb_defconfig
new file mode 100644
index 000000000000..be1bc29ad90e
--- /dev/null
+++ b/arch/m68k/configs/m54418evb_defconfig
@@ -0,0 +1,70 @@
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
+CONFIG_COLDFIRE=y
+CONFIG_M5441x=y
+CONFIG_CLOCK_FREQ=250000000
+# CONFIG_4KSTACKS is not set
+CONFIG_RAMBASE=0x40000000
+CONFIG_RAMSIZE=0x02000000
+CONFIG_VECTORBASE=0x40000000
+CONFIG_KERNELBASE=0x40020000
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_IOSCHED_BFQ is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_INET_DIAG is not set
+# CONFIG_IPV6 is not set
+CONFIG_UEVENT_HELPER=y
+# CONFIG_FW_LOADER is not set
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_RAM=y
+CONFIG_MTD_UCLINUX=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_NETDEVICES=y
+CONFIG_PPP=y
+# CONFIG_WLAN is not set
+# CONFIG_INPUT is not set
+# CONFIG_VT is not set
+# CONFIG_UNIX98_PTYS is not set
+CONFIG_SERIAL_MCF=y
+CONFIG_SERIAL_MCF_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_SPI=y
+CONFIG_SPI_FSL_DSPI=y
+# CONFIG_PTP_1588_CLOCK is not set
+# CONFIG_HWMON is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_ESDHC_MCF=y
+CONFIG_DMADEVICES=y
+CONFIG_MCF_EDMA=y
+# CONFIG_NVMEM is not set
+CONFIG_VALIDATE_FS_PARSER=y
+CONFIG_EXT2_FS=y
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+CONFIG_ROMFS_FS=y
+CONFIG_ROMFS_BACKED_BY_MTD=y
+# CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_CRYPTO=y
+CONFIG_CRYPTO_NULL=y
+CONFIG_CRYPTO_AES=y
+CONFIG_CRYPTO_HMAC=y
+CONFIG_CRYPTO_SHA256=y
+CONFIG_FRAME_WARN=1024
-- 
2.54.0

