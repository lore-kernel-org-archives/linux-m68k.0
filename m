Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38323F99ED
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Jul 2026 13:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429848; cv=none; b=c4wI95YIgTICob5UCgFchYoILZ34ueBFnNm0bfeF1cAVY+a+kNjn2f/EZvQnmeTB6juzd+S0LRFhHtv+TiLW8v498Ge9H9pIN5Fvnyre5jsQ4CSu3sFFGiq1gTncR6PQ7NSqKd0yakwFpR9s/EGizMncKPt4ps8mlaoyzXz0pqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429848; c=relaxed/simple;
	bh=r1CibfDlLIizzp1KFfPyqgM9Ln627zTM8sR6d95xVmE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UzcaIBz8O4ojySSYPI89azhJhrlTBd74AavxSqEr9rZmRuFvoTAqDXxdXQmihJiTBIvdF0to0xRt5S1xeF2OL3hI1Smo4DU8hPj4dpRhKmsRG/5fW8voEwr2yMrUv8ssMYc4QHaYaOIm2G1KdkMvxtUV+iwTNRwl/6p9nbQDLhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGYoMdCt; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGYoMdCt"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BD9260018;
	Tue,  7 Jul 2026 13:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 109EC1F000E9;
	Tue,  7 Jul 2026 13:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783429845;
	bh=QiC9ufNjBXY0qojfR83y3Db/3q5EQizqdZU46z2U4WI=;
	h=From:To:Cc:Subject:Date;
	b=bGYoMdCtEAsfxkyDB8d++V7SrjrzlER8EFkaYBVOofI2RrBkofefssQcvb+4ckHH6
	 0qtOj+Q3SsumJrT6TJvHny+FUQ0U1TbxCUwAzmnEt35SIxIEv6RYW7ofYIQeZMxWT6
	 8gLXClonoUze5LSM3gztKGxj5kSrvwiihYscOLi1XA/ySocSo98VycdB7+vJi0NxYO
	 GY1aCT9/9egcboz3hCv55B2YwMZq6v74k7ng6APjN/P6yS5wIRCHdI3mwt9E2uIDsK
	 xxUlGh2oHU3XRYep3DslKfXyDH2ELDkPc1AZSCcMQCEKJ9Rd7jYBneFGPO8JWMMqN/
	 tPmTBB8HP4yiw==
From: Greg Ungerer <gerg@kernel.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68k: defconfig: add config for M5282EVB board
Date: Tue,  7 Jul 2026 23:10:41 +1000
Message-ID: <20260707131041.2631541-1-gerg@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Greg Ungerer <gerg@linux-m68k.org>

Add a default configuration for a basic M5282 based EVB board.
The SoC has been supported for a long time but there is no default
configuration. Create one to improve build and test coverage.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/configs/m5282evb_defconfig | 51 ++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 arch/m68k/configs/m5282evb_defconfig

diff --git a/arch/m68k/configs/m5282evb_defconfig b/arch/m68k/configs/m5282evb_defconfig
new file mode 100644
index 000000000000..85040dc3e45e
--- /dev/null
+++ b/arch/m68k/configs/m5282evb_defconfig
@@ -0,0 +1,51 @@
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
+CONFIG_M528x=y
+CONFIG_RAMBASE=0x00000000
+CONFIG_RAMSIZE=0x00800000
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

