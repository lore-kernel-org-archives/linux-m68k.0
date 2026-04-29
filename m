Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61383176EF
	for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Apr 2026 14:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472705; cv=none; b=adNo0b+RaS8VjdUmYpA/hYRZOGCF9P5WFmM3y3/zDSNAZeX2InoazNdJCk5rphX8wRIRfZgD9YhoKBHx7jEcWVNWpKnCf4X3Z3be1b4iIVxE+MnBFWVXgsAtFesXxUTAS8VlWnGZtEs6J94T5HitwpM678fdovEE0urWpCYpQOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472705; c=relaxed/simple;
	bh=jf/CmgLperXzBS0JM2LGAAOJQLkyVcagMrIdq9of0c0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ANHrabOYPoF0qR12UjGuLQVxVWeNYzeAhzaqYki5k9B2NkDKqB+MBIDHjWWdWKLHPJGYgEtSBvICIEgLRsT0JeF5jITJFx0Ydk5wVOWzNaRj556UKLGDCzeEEK4VkbcGQrEOaCbU7MXAsRlzmqCoq9NKEb1CphhcXBS7ZzLRSbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E21260139;
	Wed, 29 Apr 2026 14:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C9AC19425;
	Wed, 29 Apr 2026 14:25:01 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 4/4] m68k: defconfig: update all ColdFire defconfigs
Date: Thu, 30 Apr 2026 00:24:08 +1000
Message-ID: <20260429142452.1200856-5-gerg@linux-m68k.org>
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

Refresh all ColdFire base defconfig files, making sure that modules
is turned on for all targets.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/configs/m5208evb_defconfig |  9 +++++----
 arch/m68k/configs/m5249evb_defconfig |  9 +++++----
 arch/m68k/configs/m5272c3_defconfig  |  9 +++++----
 arch/m68k/configs/m5275evb_defconfig |  9 +++++----
 arch/m68k/configs/m5307c3_defconfig  | 10 +++++-----
 arch/m68k/configs/m5407c3_defconfig  |  9 ++++-----
 arch/m68k/configs/m5475evb_defconfig | 12 ++++++------
 7 files changed, 35 insertions(+), 32 deletions(-)

diff --git a/arch/m68k/configs/m5208evb_defconfig b/arch/m68k/configs/m5208evb_defconfig
index 31035a0b9247..cc17d3cdcab1 100644
--- a/arch/m68k/configs/m5208evb_defconfig
+++ b/arch/m68k/configs/m5208evb_defconfig
@@ -1,22 +1,23 @@
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
-# CONFIG_KALLSYMS is not set
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SIGNALFD is not set
 # CONFIG_TIMERFD is not set
 # CONFIG_EVENTFD is not set
 # CONFIG_AIO is not set
-# CONFIG_VM_EVENT_COUNTERS is not set
-# CONFIG_COMPAT_BRK is not set
-# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_KALLSYMS is not set
 # CONFIG_MMU is not set
 # CONFIG_4KSTACKS is not set
 CONFIG_RAMBASE=0x40000000
 CONFIG_RAMSIZE=0x2000000
 CONFIG_VECTORBASE=0x40000000
 CONFIG_KERNELBASE=0x40020000
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
 CONFIG_BINFMT_FLAT=y
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_VM_EVENT_COUNTERS is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/m68k/configs/m5249evb_defconfig b/arch/m68k/configs/m5249evb_defconfig
index 5706d7a1daba..65d006c4d29f 100644
--- a/arch/m68k/configs/m5249evb_defconfig
+++ b/arch/m68k/configs/m5249evb_defconfig
@@ -1,15 +1,12 @@
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
-# CONFIG_KALLSYMS is not set
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SIGNALFD is not set
 # CONFIG_TIMERFD is not set
 # CONFIG_EVENTFD is not set
 # CONFIG_AIO is not set
-# CONFIG_VM_EVENT_COUNTERS is not set
-# CONFIG_SLUB_DEBUG is not set
-# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_KALLSYMS is not set
 # CONFIG_MMU is not set
 CONFIG_M5249=y
 CONFIG_M5249C3=y
@@ -17,7 +14,10 @@ CONFIG_RAMBASE=0x00000000
 CONFIG_RAMSIZE=0x00800000
 CONFIG_VECTORBASE=0x00000000
 CONFIG_KERNELBASE=0x00020000
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
 CONFIG_BINFMT_FLAT=y
+# CONFIG_VM_EVENT_COUNTERS is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -45,5 +45,6 @@ CONFIG_EXT2_FS=y
 CONFIG_ROMFS_FS=y
 CONFIG_ROMFS_BACKED_BY_MTD=y
 # CONFIG_NETWORK_FILESYSTEMS is not set
+# CONFIG_SLUB_DEBUG is not set
 CONFIG_BOOTPARAM=y
 CONFIG_BOOTPARAM_STRING="root=/dev/mtdblock0"
diff --git a/arch/m68k/configs/m5272c3_defconfig b/arch/m68k/configs/m5272c3_defconfig
index f02fe144f4ad..40572e719b27 100644
--- a/arch/m68k/configs/m5272c3_defconfig
+++ b/arch/m68k/configs/m5272c3_defconfig
@@ -1,15 +1,12 @@
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
-# CONFIG_KALLSYMS is not set
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SIGNALFD is not set
 # CONFIG_TIMERFD is not set
 # CONFIG_EVENTFD is not set
 # CONFIG_AIO is not set
-# CONFIG_VM_EVENT_COUNTERS is not set
-# CONFIG_SLUB_DEBUG is not set
-# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_KALLSYMS is not set
 # CONFIG_MMU is not set
 CONFIG_M5272=y
 CONFIG_M5272C3=y
@@ -17,7 +14,10 @@ CONFIG_RAMBASE=0x00000000
 CONFIG_RAMSIZE=0x00800000
 CONFIG_VECTORBASE=0x00000000
 CONFIG_KERNELBASE=0x00020000
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
 CONFIG_BINFMT_FLAT=y
+# CONFIG_VM_EVENT_COUNTERS is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -46,5 +46,6 @@ CONFIG_EXT2_FS=y
 CONFIG_ROMFS_FS=y
 CONFIG_ROMFS_BACKED_BY_MTD=y
 # CONFIG_NETWORK_FILESYSTEMS is not set
+# CONFIG_SLUB_DEBUG is not set
 CONFIG_BOOTPARAM=y
 CONFIG_BOOTPARAM_STRING="root=/dev/mtdblock0"
diff --git a/arch/m68k/configs/m5275evb_defconfig b/arch/m68k/configs/m5275evb_defconfig
index 781f307ff330..6856848b3fbb 100644
--- a/arch/m68k/configs/m5275evb_defconfig
+++ b/arch/m68k/configs/m5275evb_defconfig
@@ -1,15 +1,12 @@
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
-# CONFIG_KALLSYMS is not set
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SIGNALFD is not set
 # CONFIG_TIMERFD is not set
 # CONFIG_EVENTFD is not set
 # CONFIG_AIO is not set
-# CONFIG_VM_EVENT_COUNTERS is not set
-# CONFIG_SLUB_DEBUG is not set
-# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_KALLSYMS is not set
 # CONFIG_MMU is not set
 CONFIG_M5275=y
 # CONFIG_4KSTACKS is not set
@@ -17,7 +14,10 @@ CONFIG_RAMBASE=0x00000000
 CONFIG_RAMSIZE=0x00000000
 CONFIG_VECTORBASE=0x00000000
 CONFIG_KERNELBASE=0x00020000
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
 CONFIG_BINFMT_FLAT=y
+# CONFIG_VM_EVENT_COUNTERS is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -47,5 +47,6 @@ CONFIG_EXT2_FS=y
 CONFIG_ROMFS_FS=y
 CONFIG_ROMFS_BACKED_BY_MTD=y
 # CONFIG_NETWORK_FILESYSTEMS is not set
+# CONFIG_SLUB_DEBUG is not set
 CONFIG_BOOTPARAM=y
 CONFIG_BOOTPARAM_STRING="root=/dev/mtdblock0"
diff --git a/arch/m68k/configs/m5307c3_defconfig b/arch/m68k/configs/m5307c3_defconfig
index 6eac482356ca..4e67e48c85a4 100644
--- a/arch/m68k/configs/m5307c3_defconfig
+++ b/arch/m68k/configs/m5307c3_defconfig
@@ -1,15 +1,12 @@
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
-# CONFIG_KALLSYMS is not set
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SIGNALFD is not set
 # CONFIG_TIMERFD is not set
 # CONFIG_EVENTFD is not set
 # CONFIG_AIO is not set
-# CONFIG_VM_EVENT_COUNTERS is not set
-# CONFIG_SLUB_DEBUG is not set
-# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_KALLSYMS is not set
 # CONFIG_MMU is not set
 CONFIG_M5307=y
 CONFIG_M5307C3=y
@@ -17,7 +14,10 @@ CONFIG_RAMBASE=0x00000000
 CONFIG_RAMSIZE=0x00800000
 CONFIG_VECTORBASE=0x00000000
 CONFIG_KERNELBASE=0x00020000
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
 CONFIG_BINFMT_FLAT=y
+# CONFIG_VM_EVENT_COUNTERS is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -34,7 +34,6 @@ CONFIG_NETDEVICES=y
 CONFIG_PPP=y
 CONFIG_SLIP=y
 CONFIG_SLIP_COMPRESSED=y
-# CONFIG_INPUT_MOUSEDEV is not set
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
@@ -50,6 +49,7 @@ CONFIG_EXT2_FS=y
 CONFIG_ROMFS_FS=y
 CONFIG_ROMFS_BACKED_BY_MTD=y
 # CONFIG_NETWORK_FILESYSTEMS is not set
+# CONFIG_SLUB_DEBUG is not set
 CONFIG_BOOTPARAM=y
 CONFIG_BOOTPARAM_STRING="root=/dev/mtdblock0"
 CONFIG_FULLDEBUG=y
diff --git a/arch/m68k/configs/m5407c3_defconfig b/arch/m68k/configs/m5407c3_defconfig
index 496dcccb1c18..47712498d7dc 100644
--- a/arch/m68k/configs/m5407c3_defconfig
+++ b/arch/m68k/configs/m5407c3_defconfig
@@ -1,16 +1,12 @@
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
-# CONFIG_KALLSYMS is not set
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SIGNALFD is not set
 # CONFIG_TIMERFD is not set
 # CONFIG_EVENTFD is not set
 # CONFIG_AIO is not set
-# CONFIG_VM_EVENT_COUNTERS is not set
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_KALLSYMS is not set
 # CONFIG_MMU is not set
 CONFIG_M5407=y
 CONFIG_M5407C3=y
@@ -18,7 +14,10 @@ CONFIG_RAMBASE=0x00000000
 CONFIG_RAMSIZE=0x00000000
 CONFIG_VECTORBASE=0x00000000
 CONFIG_KERNELBASE=0x00020000
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
 CONFIG_BINFMT_FLAT=y
+# CONFIG_VM_EVENT_COUNTERS is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/m68k/configs/m5475evb_defconfig b/arch/m68k/configs/m5475evb_defconfig
index 9be4dae84ebf..818cbdf65ce3 100644
--- a/arch/m68k/configs/m5475evb_defconfig
+++ b/arch/m68k/configs/m5475evb_defconfig
@@ -1,6 +1,5 @@
-# CONFIG_SWAP is not set
 CONFIG_LOG_BUF_SHIFT=14
-# CONFIG_KALLSYMS is not set
+CONFIG_EXPERT=y
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SIGNALFD is not set
@@ -8,9 +7,7 @@ CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_EVENTFD is not set
 # CONFIG_SHMEM is not set
 # CONFIG_AIO is not set
-CONFIG_EXPERT=y
-CONFIG_MODULES=y
-# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_KALLSYMS is not set
 CONFIG_COLDFIRE=y
 # CONFIG_4KSTACKS is not set
 CONFIG_RAMBASE=0x0
@@ -18,8 +15,11 @@ CONFIG_RAMSIZE=0x2000000
 CONFIG_VECTORBASE=0x0
 CONFIG_MBAR=0xff000000
 CONFIG_KERNELBASE=0x20000
-CONFIG_PCI=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+# CONFIG_SWAP is not set
+CONFIG_PCI=y
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
-- 
2.54.0

