From: <gerg@snapgear.com>
Subject: [PATCH] m68k: add a defconfig for the M5475EVB
	ColdFire with MMU board
Date: Tue, 15 May 2012 16:42:58 +1000
Message-ID: <1337064178-656-1-git-send-email-gerg@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: uclinux-dev@uclinux.org, linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

From: Greg Ungerer <gerg@uclinux.org>

Add a default configuration for the newly supported ColdFire CPUs running
with MMU enabled. This is based on Freescales own M5475EVB demo board.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/configs/m5475evb_defconfig |   62 ++++++++++++++++++++++++++++++++++
 1 files changed, 62 insertions(+), 0 deletions(-)
 create mode 100644 arch/m68k/configs/m5475evb_defconfig

diff --git a/arch/m68k/configs/m5475evb_defconfig b/arch/m68k/configs/m5475evb_defconfig
new file mode 100644
index 0000000..c5018a6
--- /dev/null
+++ b/arch/m68k/configs/m5475evb_defconfig
@@ -0,0 +1,62 @@
+CONFIG_EXPERIMENTAL=y
+# CONFIG_SWAP is not set
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_SYSFS_DEPRECATED=y
+CONFIG_SYSFS_DEPRECATED_V2=y
+CONFIG_SYSCTL_SYSCALL=y
+# CONFIG_KALLSYMS is not set
+# CONFIG_HOTPLUG is not set
+# CONFIG_FUTEX is not set
+# CONFIG_EPOLL is not set
+# CONFIG_SIGNALFD is not set
+# CONFIG_TIMERFD is not set
+# CONFIG_EVENTFD is not set
+# CONFIG_SHMEM is not set
+# CONFIG_AIO is not set
+CONFIG_EMBEDDED=y
+CONFIG_MODULES=y
+# CONFIG_LBDAF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_COLDFIRE=y
+CONFIG_M547x=y
+CONFIG_CLOCK_SET=y
+CONFIG_CLOCK_FREQ=266000000
+# CONFIG_4KSTACKS is not set
+CONFIG_RAMBASE=0x0
+CONFIG_RAMSIZE=0x2000000
+CONFIG_VECTORBASE=0x0
+CONFIG_MBAR=0xff000000
+CONFIG_KERNELBASE=0x20000
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+# CONFIG_FW_LOADER is not set
+CONFIG_MTD=y
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_JEDECPROBE=y
+CONFIG_MTD_CFI_AMDSTD=y
+CONFIG_MTD_RAM=y
+CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_UCLINUX=y
+CONFIG_BLK_DEV_RAM=y
+# CONFIG_INPUT is not set
+# CONFIG_VT is not set
+# CONFIG_UNIX98_PTYS is not set
+CONFIG_SERIAL_MCF=y
+CONFIG_SERIAL_MCF_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+# CONFIG_USB_SUPPORT is not set
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_EXT2_FS=y
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+# CONFIG_PROC_PAGE_MONITOR is not set
+CONFIG_ROMFS_FS=y
+CONFIG_ROMFS_BACKED_BY_MTD=y
+# CONFIG_SCHED_DEBUG is not set
+CONFIG_BOOTPARAM=y
+CONFIG_BOOTPARAM_STRING="root=/dev/mtdblock0"
-- 
1.7.0.4

_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
