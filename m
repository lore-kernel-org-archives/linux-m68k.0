Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B881922F5
	for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Apr 2026 14:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472703; cv=none; b=X9sM83GsFoqQyphOzDSunk4eeUJaV3hgFWB9ilIlaGhY+Zu2B9bmMqUZk5T80w2GTTM2HAP8ARUzP9jzfKJ7Y2ATro6hefLVhf/AZcdUMMPyn+wBx9ei3KoRpudaidOkAP+s4yEhwZ4eANERnKBuL+7uUyLRTGrvZ6n8+GMu5oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472703; c=relaxed/simple;
	bh=bIGMMU3ZW7DjhM1Pbi6gLPCXD3jnVOZunPfTnJztJhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOsoZqCSkFfYj9fguJKi3HnCUwbfMrthE93hD3yqPNZl1e/wP8X3phfM7FlacJin7bYxECGVmFt1Ga82a1Q7LIPKSkGiezFbNQNIQuDBqpFLuKr2AmcKrm0aP2hQ5kOaRNNt6+/9EKN1rWVILEex26goIzsHOD4VazEXoireq5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B4856440B5;
	Wed, 29 Apr 2026 14:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB38BC2BCC4;
	Wed, 29 Apr 2026 14:25:00 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 3/4] m68k: defconfig: add config for SnapGear/NETtel board
Date: Thu, 30 Apr 2026 00:24:07 +1000
Message-ID: <20260429142452.1200856-4-gerg@linux-m68k.org>
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

Add a default configuration for a basic M5307 based NETtel board.
This is primarily to improve defconfig build coverage. This platforms
uses the SMSC ethernet drivers for network ports, and has a few other
minor quirks that make it different from other ColdFire platforms.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/configs/nettel_defconfig | 56 ++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 arch/m68k/configs/nettel_defconfig

diff --git a/arch/m68k/configs/nettel_defconfig b/arch/m68k/configs/nettel_defconfig
new file mode 100644
index 000000000000..ee787b5729e4
--- /dev/null
+++ b/arch/m68k/configs/nettel_defconfig
@@ -0,0 +1,56 @@
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
+CONFIG_M5307=y
+CONFIG_NETtel=y
+CONFIG_RAMBASE=0x00000000
+CONFIG_RAMSIZE=0x00800000
+CONFIG_VECTORBASE=0x00000000
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
+CONFIG_SMC91X=y
+CONFIG_PPP=y
+CONFIG_SLIP=y
+CONFIG_SLIP_COMPRESSED=y
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+# CONFIG_VT is not set
+# CONFIG_LEGACY_PTYS is not set
+CONFIG_SERIAL_MCF=y
+CONFIG_SERIAL_MCF_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_EXT2_FS=y
+# CONFIG_DNOTIFY is not set
+CONFIG_ROMFS_FS=y
+CONFIG_ROMFS_BACKED_BY_MTD=y
+# CONFIG_NETWORK_FILESYSTEMS is not set
+# CONFIG_SLUB_DEBUG is not set
+CONFIG_BOOTPARAM=y
+CONFIG_BOOTPARAM_STRING="root=/dev/mtdblock0"
+CONFIG_FULLDEBUG=y
-- 
2.54.0

