Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A59F14287
	for <linux-m68k@lists.linux-m68k.org>; Thu, 14 Nov 2024 14:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731592980; cv=none; b=GM+oVmdUjby3IS7osvd4FNStmba5xjNTX5Tof1DfThN/WuK5wFS41PH5IbHy5Hu2vZayXxi8gCpAQvNAc/+blI+g76ZUJ02FdmhwaIJz1cSVbWCLLluXYiqhsRwNJ1fdfRGhUqzUWnvogLo88usTsRU0Ufgooi9QEcWGsXeZnE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731592980; c=relaxed/simple;
	bh=0wAeApnUKyCVKM5MRZVBPy3utx/mIrOVvNj7LIKkZ4o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pZKUBVWcd4wrmLMV12SkraRV0v5SurekI8dtM1g0hYFNuD1riBe072AXGTQ5bZG2zrYSzhgCOmwsY//1vCfWTVHj87K9p4VrUOe+DbV4sPM9jMHW5Hlez/QIv8qsUcbZvptKvxxDQpZ58gq++/2ByLVDBilLkVHkKQsQD/tKmYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ab77:b6e5:88e8:df20])
	by laurent.telenet-ops.be with cmsmtp
	id ce2u2D0020Ss59E01e2uFY; Thu, 14 Nov 2024 15:02:54 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tBaQZ-0070p0-Ka;
	Thu, 14 Nov 2024 15:02:53 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tBaQv-004tBU-RJ;
	Thu, 14 Nov 2024 15:02:53 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH/RFC] m68k: defconfig: Enable options needed for systemd
Date: Thu, 14 Nov 2024 15:02:48 +0100
Message-Id: <e93e50b85422cdb04e800f5008abf92babf6d509.1731591904.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CONFIG_CGROUPS, CONFIG_DEBUG_FS, and CONFIG_USER_NS, which are
needed for systemd 257~rc1-4.

Reduce kernel size by disabling CONFIG_BLK_DEBUG_FS and
CONFIG_OCFS2_FS_STATS, which default to enabled if CONFIG_DEBUG_FS is
enabled, but are not really needed.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Tested with Debian sid and atari_defconfig on ARAnyM.  This increases
kernel size for atari_defconfig by ca. 76 KiB, according to
bloat-o-meter.

With CONFIG_CGROUPS disabled:

    systemd[1]: Failed to mount tmpfs (type tmpfs) on /sys/fs/cgroup (MS_NOSUID|MS_NODEV|MS_NOEXEC|MS_STRICTATIME "mode=0755,size=4m,nr_inodes=1k"): No such file or directory
    [!!!!!!] Failed to mount cgroup v1 hierarchy.
    systemd[1]: Freezing execution.

With CONFIG_DEBUG_FS disabled:

    systemd[1]: sys-kernel-debug.mount: Failed to create mount point '/sys/kernel/debug', ignoring: Operation not permitted
    systemd[1]: sys-kernel-debug.mount: Failed to check directory /sys/kernel/debug: No such file or directory
    systemd[1]: sys-kernel-debug.mount: Mount process exited, code=exited, status=32/n/a
    systemd[1]: sys-kernel-debug.mount: Failed with result 'exit-code'.
    systemd[1]: Failed to mount sys-kernel-debug.mount - /sys/kernel/debug.
    systemd[1]: Dependency failed for local-fs.target - Local File Systems.
    systemd[1]: local-fs.target: Job local-fs.target/start failed with result 'dependency'.
    systemd[1]: local-fs.target: Triggering OnFailure= dependencies.

and the system asks for the root password, to drop into an emergency
shell.

With CONFIG_USER_NS disabled:

    (journald)[59]: systemd-journald.service: Failed to set up special execution directory in /run: Invalid argument
    (journald)[59]: systemd-journald.service: Failed at step RUNTIME_DIRECTORY spawning /usr/lib/systemd/systemd-journald: Invalid argument
    systemd[1]: systemd-journald.service: Main process exited, code=exited, status=233/RUNTIME_DIRECTORY
    systemd[1]: systemd-journald.service: Failed with result 'exit-code'.
    systemd[1]: Failed to start systemd-journald.service - Journal Service.
    systemd[1]: systemd-journald.service: Scheduled restart job, restart counter is at 1.
    ...

The systemd docs[1] say CONFIG_NET_NS is also needed, but it seems to
work fine without.

[1] https://github.com/systemd/systemd/blob/main/README
---
 arch/m68k/configs/amiga_defconfig    | 5 +++++
 arch/m68k/configs/apollo_defconfig   | 5 +++++
 arch/m68k/configs/atari_defconfig    | 5 +++++
 arch/m68k/configs/bvme6000_defconfig | 5 +++++
 arch/m68k/configs/hp300_defconfig    | 5 +++++
 arch/m68k/configs/mac_defconfig      | 5 +++++
 arch/m68k/configs/multi_defconfig    | 5 +++++
 arch/m68k/configs/mvme147_defconfig  | 5 +++++
 arch/m68k/configs/mvme16x_defconfig  | 5 +++++
 arch/m68k/configs/q40_defconfig      | 5 +++++
 arch/m68k/configs/sun3_defconfig     | 5 +++++
 arch/m68k/configs/sun3x_defconfig    | 5 +++++
 12 files changed, 60 insertions(+)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index d01dc47d52ea2ffd..e19a44a3c0a0bcb7 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -4,8 +4,10 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
+CONFIG_CGROUPS=y
 # CONFIG_UTS_NS is not set
 # CONFIG_IPC_NS is not set
+CONFIG_USER_NS=y
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
@@ -27,6 +29,7 @@ CONFIG_SERIAL_CONSOLE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_TRIM_UNUSED_KSYMS=y
+# CONFIG_BLK_DEBUG_FS is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_ATARI_PARTITION=y
 CONFIG_MAC_PARTITION=y
@@ -452,6 +455,7 @@ CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
 CONFIG_OCFS2_FS=m
+# CONFIG_OCFS2_FS_STATS is not set
 # CONFIG_OCFS2_DEBUG_MASKLOG is not set
 CONFIG_BCACHEFS_FS=m
 CONFIG_FANOTIFY=y
@@ -612,6 +616,7 @@ CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 CONFIG_TEST_LOCKUP=m
 CONFIG_WW_MUTEX_SELFTEST=m
 CONFIG_EARLY_PRINTK=y
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index 46808e581d7b4709..32bede8511a34f3b 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -4,8 +4,10 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
+CONFIG_CGROUPS=y
 # CONFIG_UTS_NS is not set
 # CONFIG_IPC_NS is not set
+CONFIG_USER_NS=y
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
@@ -22,6 +24,7 @@ CONFIG_PROC_HARDWARE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_TRIM_UNUSED_KSYMS=y
+# CONFIG_BLK_DEBUG_FS is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_AMIGA_PARTITION=y
 CONFIG_ATARI_PARTITION=y
@@ -409,6 +412,7 @@ CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
 CONFIG_OCFS2_FS=m
+# CONFIG_OCFS2_FS_STATS is not set
 # CONFIG_OCFS2_DEBUG_MASKLOG is not set
 CONFIG_BCACHEFS_FS=m
 CONFIG_FANOTIFY=y
@@ -569,6 +573,7 @@ CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 CONFIG_TEST_LOCKUP=m
 CONFIG_WW_MUTEX_SELFTEST=m
 CONFIG_EARLY_PRINTK=y
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index d113ef760835a2f7..65a0fd8cf8462e9d 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -4,8 +4,10 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
+CONFIG_CGROUPS=y
 # CONFIG_UTS_NS is not set
 # CONFIG_IPC_NS is not set
+CONFIG_USER_NS=y
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
@@ -30,6 +32,7 @@ CONFIG_ATARI_DSP56K=m
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_TRIM_UNUSED_KSYMS=y
+# CONFIG_BLK_DEBUG_FS is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_AMIGA_PARTITION=y
 CONFIG_MAC_PARTITION=y
@@ -436,6 +439,7 @@ CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
 CONFIG_OCFS2_FS=m
+# CONFIG_OCFS2_FS_STATS is not set
 # CONFIG_OCFS2_DEBUG_MASKLOG is not set
 CONFIG_BCACHEFS_FS=m
 CONFIG_FANOTIFY=y
@@ -596,6 +600,7 @@ CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 CONFIG_TEST_LOCKUP=m
 CONFIG_WW_MUTEX_SELFTEST=m
 CONFIG_EARLY_PRINTK=y
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index c0719322c0283751..69bdabd71d762c71 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -4,8 +4,10 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
+CONFIG_CGROUPS=y
 # CONFIG_UTS_NS is not set
 # CONFIG_IPC_NS is not set
+CONFIG_USER_NS=y
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
@@ -20,6 +22,7 @@ CONFIG_PROC_HARDWARE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_TRIM_UNUSED_KSYMS=y
+# CONFIG_BLK_DEBUG_FS is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_AMIGA_PARTITION=y
 CONFIG_ATARI_PARTITION=y
@@ -401,6 +404,7 @@ CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
 CONFIG_OCFS2_FS=m
+# CONFIG_OCFS2_FS_STATS is not set
 # CONFIG_OCFS2_DEBUG_MASKLOG is not set
 CONFIG_BCACHEFS_FS=m
 CONFIG_FANOTIFY=y
@@ -561,6 +565,7 @@ CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 CONFIG_TEST_LOCKUP=m
 CONFIG_WW_MUTEX_SELFTEST=m
 CONFIG_EARLY_PRINTK=y
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 8d429e63f8f21471..4f09fc4c67fba3b5 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -4,8 +4,10 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
+CONFIG_CGROUPS=y
 # CONFIG_UTS_NS is not set
 # CONFIG_IPC_NS is not set
+CONFIG_USER_NS=y
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
@@ -21,6 +23,7 @@ CONFIG_PROC_HARDWARE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_TRIM_UNUSED_KSYMS=y
+# CONFIG_BLK_DEBUG_FS is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_AMIGA_PARTITION=y
 CONFIG_ATARI_PARTITION=y
@@ -411,6 +414,7 @@ CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
 CONFIG_OCFS2_FS=m
+# CONFIG_OCFS2_FS_STATS is not set
 # CONFIG_OCFS2_DEBUG_MASKLOG is not set
 CONFIG_BCACHEFS_FS=m
 CONFIG_FANOTIFY=y
@@ -571,6 +575,7 @@ CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 CONFIG_TEST_LOCKUP=m
 CONFIG_WW_MUTEX_SELFTEST=m
 CONFIG_EARLY_PRINTK=y
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index bafd33da27c1101a..998c088666d3f401 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -4,8 +4,10 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
+CONFIG_CGROUPS=y
 # CONFIG_UTS_NS is not set
 # CONFIG_IPC_NS is not set
+CONFIG_USER_NS=y
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
@@ -21,6 +23,7 @@ CONFIG_PROC_HARDWARE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_TRIM_UNUSED_KSYMS=y
+# CONFIG_BLK_DEBUG_FS is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_AMIGA_PARTITION=y
 CONFIG_ATARI_PARTITION=y
@@ -428,6 +431,7 @@ CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
 CONFIG_OCFS2_FS=m
+# CONFIG_OCFS2_FS_STATS is not set
 # CONFIG_OCFS2_DEBUG_MASKLOG is not set
 CONFIG_BCACHEFS_FS=m
 CONFIG_FANOTIFY=y
@@ -588,6 +592,7 @@ CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 CONFIG_TEST_LOCKUP=m
 CONFIG_WW_MUTEX_SELFTEST=m
 CONFIG_EARLY_PRINTK=y
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 6f5ca3f85ea16028..1540e04c223e2b90 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -4,8 +4,10 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
+CONFIG_CGROUPS=y
 # CONFIG_UTS_NS is not set
 # CONFIG_IPC_NS is not set
+CONFIG_USER_NS=y
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
@@ -45,6 +47,7 @@ CONFIG_SERIAL_CONSOLE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_TRIM_UNUSED_KSYMS=y
+# CONFIG_BLK_DEBUG_FS is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_BSD_DISKLABEL=y
 CONFIG_MINIX_SUBPARTITION=y
@@ -514,6 +517,7 @@ CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
 CONFIG_OCFS2_FS=m
+# CONFIG_OCFS2_FS_STATS is not set
 # CONFIG_OCFS2_DEBUG_MASKLOG is not set
 CONFIG_BCACHEFS_FS=m
 CONFIG_FANOTIFY=y
@@ -674,6 +678,7 @@ CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 CONFIG_TEST_LOCKUP=m
 CONFIG_WW_MUTEX_SELFTEST=m
 CONFIG_EARLY_PRINTK=y
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index d16b328c71363f51..c6063a6dd4f6e8e9 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -4,8 +4,10 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
+CONFIG_CGROUPS=y
 # CONFIG_UTS_NS is not set
 # CONFIG_IPC_NS is not set
+CONFIG_USER_NS=y
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
@@ -19,6 +21,7 @@ CONFIG_PROC_HARDWARE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_TRIM_UNUSED_KSYMS=y
+# CONFIG_BLK_DEBUG_FS is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_AMIGA_PARTITION=y
 CONFIG_ATARI_PARTITION=y
@@ -400,6 +403,7 @@ CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
 CONFIG_OCFS2_FS=m
+# CONFIG_OCFS2_FS_STATS is not set
 # CONFIG_OCFS2_DEBUG_MASKLOG is not set
 CONFIG_BCACHEFS_FS=m
 CONFIG_FANOTIFY=y
@@ -560,6 +564,7 @@ CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 CONFIG_TEST_LOCKUP=m
 CONFIG_WW_MUTEX_SELFTEST=m
 CONFIG_EARLY_PRINTK=y
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 80f6c15a5ed5c8f8..857bfce4a67e9b4c 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -4,8 +4,10 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
+CONFIG_CGROUPS=y
 # CONFIG_UTS_NS is not set
 # CONFIG_IPC_NS is not set
+CONFIG_USER_NS=y
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
@@ -20,6 +22,7 @@ CONFIG_PROC_HARDWARE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_TRIM_UNUSED_KSYMS=y
+# CONFIG_BLK_DEBUG_FS is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_AMIGA_PARTITION=y
 CONFIG_ATARI_PARTITION=y
@@ -401,6 +404,7 @@ CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
 CONFIG_OCFS2_FS=m
+# CONFIG_OCFS2_FS_STATS is not set
 # CONFIG_OCFS2_DEBUG_MASKLOG is not set
 CONFIG_BCACHEFS_FS=m
 CONFIG_FANOTIFY=y
@@ -561,6 +565,7 @@ CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 CONFIG_TEST_LOCKUP=m
 CONFIG_WW_MUTEX_SELFTEST=m
 CONFIG_EARLY_PRINTK=y
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 0e81589f0ee26d76..ee4e65f7f6aeb6fe 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -4,8 +4,10 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
+CONFIG_CGROUPS=y
 # CONFIG_UTS_NS is not set
 # CONFIG_IPC_NS is not set
+CONFIG_USER_NS=y
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
@@ -20,6 +22,7 @@ CONFIG_PROC_HARDWARE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_TRIM_UNUSED_KSYMS=y
+# CONFIG_BLK_DEBUG_FS is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_AMIGA_PARTITION=y
 CONFIG_ATARI_PARTITION=y
@@ -418,6 +421,7 @@ CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
 CONFIG_OCFS2_FS=m
+# CONFIG_OCFS2_FS_STATS is not set
 # CONFIG_OCFS2_DEBUG_MASKLOG is not set
 CONFIG_BCACHEFS_FS=m
 CONFIG_FANOTIFY=y
@@ -578,6 +582,7 @@ CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 CONFIG_TEST_LOCKUP=m
 CONFIG_WW_MUTEX_SELFTEST=m
 CONFIG_EARLY_PRINTK=y
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index 8cd785290339db25..63449665f924ccf1 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -4,8 +4,10 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
+CONFIG_CGROUPS=y
 # CONFIG_UTS_NS is not set
 # CONFIG_IPC_NS is not set
+CONFIG_USER_NS=y
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
@@ -17,6 +19,7 @@ CONFIG_PROC_HARDWARE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_TRIM_UNUSED_KSYMS=y
+# CONFIG_BLK_DEBUG_FS is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_AMIGA_PARTITION=y
 CONFIG_ATARI_PARTITION=y
@@ -399,6 +402,7 @@ CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
 CONFIG_OCFS2_FS=m
+# CONFIG_OCFS2_FS_STATS is not set
 # CONFIG_OCFS2_DEBUG_MASKLOG is not set
 CONFIG_BCACHEFS_FS=m
 CONFIG_FANOTIFY=y
@@ -559,6 +563,7 @@ CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 CONFIG_TEST_LOCKUP=m
 CONFIG_WW_MUTEX_SELFTEST=m
 CONFIG_KUNIT=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index 78035369f60f1b4b..00b553490b82f767 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -4,8 +4,10 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
+CONFIG_CGROUPS=y
 # CONFIG_UTS_NS is not set
 # CONFIG_IPC_NS is not set
+CONFIG_USER_NS=y
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
@@ -17,6 +19,7 @@ CONFIG_PROC_HARDWARE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_TRIM_UNUSED_KSYMS=y
+# CONFIG_BLK_DEBUG_FS is not set
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_AMIGA_PARTITION=y
 CONFIG_ATARI_PARTITION=y
@@ -399,6 +402,7 @@ CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
 CONFIG_OCFS2_FS=m
+# CONFIG_OCFS2_FS_STATS is not set
 # CONFIG_OCFS2_DEBUG_MASKLOG is not set
 CONFIG_BCACHEFS_FS=m
 CONFIG_FANOTIFY=y
@@ -559,6 +563,7 @@ CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 CONFIG_TEST_LOCKUP=m
 CONFIG_WW_MUTEX_SELFTEST=m
 CONFIG_EARLY_PRINTK=y
-- 
2.34.1

