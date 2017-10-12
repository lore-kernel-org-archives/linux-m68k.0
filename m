From: Angelo Dureghello <angelo@sysam.it>
Subject: [PATCH] m68k: add Sysam stmark2 open board support
Date: Fri, 13 Oct 2017 00:42:51 +0200
Message-ID: <20171012224251.1015-1-angelo@sysam.it>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:48063 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753203AbdJLWm4 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Thu, 12 Oct 2017 18:42:56 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: gregungerer@westnet.com.au, Angelo Dureghello <angelo@sysam.it>

Add support for Sysam stmark2 board, an open hardware embedded
Linux board, see http://sysam.it/cff_stmark2.html for any info.

Signed-off-by: Angelo Dureghello <angelo@sysam.it>
---
 arch/m68k/Kconfig.machine           |   6 ++
 arch/m68k/coldfire/Makefile         |   3 +-
 arch/m68k/coldfire/stmark2.c        | 120 ++++++++++++++++++++++++++++++++++++
 arch/m68k/configs/stmark2_defconfig |  92 +++++++++++++++++++++++++++
 4 files changed, 220 insertions(+), 1 deletion(-)
 create mode 100644 arch/m68k/coldfire/stmark2.c
 create mode 100644 arch/m68k/configs/stmark2_defconfig

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index 9225b4ad9aeb..00698404b97f 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -265,6 +265,12 @@ config AMCORE
 	help
 	  Support for the Sysam AMCORE open-hardware generic board.
 
+config STMARK2
+        bool "Sysam stmark2 board support"
+        depends on M5441x
+        help
+          Support for the Sysam stmark2 open-hardware generic board.
+
 config FIREBEE
 	bool "FireBee board support"
 	depends on M547x
diff --git a/arch/m68k/coldfire/Makefile b/arch/m68k/coldfire/Makefile
index 4aa2c57afc35..e45baeaadac8 100644
--- a/arch/m68k/coldfire/Makefile
+++ b/arch/m68k/coldfire/Makefile
@@ -34,7 +34,8 @@ obj-$(CONFIG_NETtel)	+= nettel.o
 obj-$(CONFIG_CLEOPATRA)	+= nettel.o
 obj-$(CONFIG_FIREBEE)	+= firebee.o
 obj-$(CONFIG_MCF8390)	+= mcf8390.o
-obj-$(CONFIG_AMCORE)    += amcore.o
+obj-$(CONFIG_AMCORE)	+= amcore.o
+obj-$(CONFIG_STMARK2)	+= stmark2.o
 
 obj-$(CONFIG_PCI)	+= pci.o
 
diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
new file mode 100644
index 000000000000..8eaf869de8e2
--- /dev/null
+++ b/arch/m68k/coldfire/stmark2.c
@@ -0,0 +1,120 @@
+/*
+ * stmark2.c -- Support for Sysam AMCORE open board
+ *
+ * (C) Copyright 2017, Angelo Dureghello <angelo@sysam.it>
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file COPYING in the main directory of this archive
+ * for more details.
+ */
+
+#include <linux/platform_device.h>
+#include <linux/mtd/partitions.h>
+#include <linux/spi/spi.h>
+#include <linux/spi/spi-fsl-dspi.h>
+#include <linux/spi/flash.h>
+#include <asm/mcfsim.h>
+
+/*
+ * Partitioning of parallel NOR flash (39VF3201B)
+ */
+static struct mtd_partition stmark2_partitions[] = {
+	{
+		.name = "U-Boot (1024K)",
+		.size = 0x100000,
+		.offset = 0x0
+	}, {
+		.name = "Kernel+initramfs (7168K)",
+		.size = 0x700000,
+		.offset = MTDPART_OFS_APPEND
+	}, {
+		.name = "Flash Free Space (8192K)",
+		.size = MTDPART_SIZ_FULL,
+		.offset = MTDPART_OFS_APPEND
+	}
+};
+
+static struct flash_platform_data stmark2_spi_flash_data = {
+	.name = "is25lp128",
+	.parts = stmark2_partitions,
+	.nr_parts = ARRAY_SIZE(stmark2_partitions),
+	.type = "is25lp128",
+};
+
+static struct spi_board_info stmark2_board_info[] __initdata = {
+	{
+		.modalias = "m25p80",
+		.max_speed_hz = 5000000,
+		.bus_num = 0,
+		.chip_select = 1,
+		.platform_data = &stmark2_spi_flash_data,
+		.mode = SPI_MODE_3,
+	}
+};
+
+/* SPI controller data, SPI (0) */
+static struct fsl_dspi_platform_data dspi_spi0_info = {
+	.cs_num = 4,
+	.bus_num = 0,
+	.sck_cs_delay = 100,
+	.cs_sck_delay = 100,
+};
+
+static struct resource dspi_spi0_resource[] = {
+	[0] = {
+		.start = MCFDSPI_BASE0,
+		.end   = MCFDSPI_BASE0 + 0xFF,
+		.flags = IORESOURCE_MEM,
+		},
+	[1] = {
+		.start = 12,
+		.end   = 13,
+		.flags = IORESOURCE_DMA,
+	},
+	[2] = {
+		.start = MCF_IRQ_DSPI0,
+		.end   = MCF_IRQ_DSPI0,
+		.flags = IORESOURCE_IRQ,
+	},
+};
+
+/* SPI controller, id = bus number */
+static struct platform_device dspi_spi0_device = {
+	.name = "fsl-dspi",
+	.id = 0,
+	.num_resources = ARRAY_SIZE(dspi_spi0_resource),
+	.resource = dspi_spi0_resource,
+	.dev = {
+		.platform_data = &dspi_spi0_info,
+	},
+};
+
+static struct platform_device *stmark2_devices[] __initdata = {
+	&dspi_spi0_device,
+};
+
+/*
+ * Note: proper pin-mux setup is mandatory for proper SPI functionality.
+ */
+static int __init init_stmark2(void)
+{
+	/* DSPI0, all pins as DSPI, and using CS1 */
+	__raw_writeb(0x80, MCFGPIO_PAR_DSPIOWL);
+	__raw_writeb(0xfc, MCFGPIO_PAR_DSPIOWH);
+
+	/* Board gpio setup */
+	__raw_writeb(0x00, MCFGPIO_PAR_BE);
+	__raw_writeb(0x00, MCFGPIO_PAR_FBCTL);
+	__raw_writeb(0x00, MCFGPIO_PAR_CS);
+	__raw_writeb(0x00, MCFGPIO_PAR_CANI2C);
+
+	platform_add_devices(stmark2_devices, ARRAY_SIZE(stmark2_devices));
+
+	spi_register_board_info(stmark2_board_info,
+				ARRAY_SIZE(stmark2_board_info));
+
+	return 0;
+}
+
+late_initcall(init_stmark2);
+
diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
new file mode 100644
index 000000000000..55e55dbc2fb6
--- /dev/null
+++ b/arch/m68k/configs/stmark2_defconfig
@@ -0,0 +1,92 @@
+CONFIG_LOCALVERSION="stmark2-001"
+CONFIG_DEFAULT_HOSTNAME="stmark2"
+CONFIG_SYSVIPC=y
+# CONFIG_FHANDLE is not set
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_NAMESPACES=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="../uClinux-dist/romfs"
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZO is not set
+# CONFIG_RD_LZ4 is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+# CONFIG_AIO is not set
+# CONFIG_ADVISE_SYSCALLS is not set
+# CONFIG_MEMBARRIER is not set
+CONFIG_EMBEDDED=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_LBDAF is not set
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_BLK_CMDLINE_PARSER=y
+# CONFIG_MMU is not set
+CONFIG_M5441x=y
+CONFIG_CLOCK_FREQ=240000000
+CONFIG_STMARK2=y
+CONFIG_RAMBASE=0x40000000
+CONFIG_RAMSIZE=0x8000000
+CONFIG_VECTORBASE=0x40000000
+CONFIG_KERNELBASE=0x40001000
+CONFIG_BINFMT_FLAT=y
+CONFIG_BINFMT_MISC=y
+# CONFIG_UEVENT_HELPER is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
+# CONFIG_ALLOW_DEV_COREDUMP is not set
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_JEDECPROBE=y
+CONFIG_MTD_CFI_ADV_OPTIONS=y
+CONFIG_MTD_CFI_LE_BYTE_SWAP=y
+CONFIG_MTD_CFI_GEOMETRY=y
+# CONFIG_MTD_CFI_I2 is not set
+CONFIG_MTD_CFI_AMDSTD=y
+CONFIG_MTD_CFI_STAA=y
+CONFIG_MTD_ROM=y
+CONFIG_MTD_COMPLEX_MAPPINGS=y
+CONFIG_MTD_PLATRAM=y
+CONFIG_MTD_M25P80=y
+CONFIG_MTD_SPI_NOR=y
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_SERIO_LIBPS2=y
+# CONFIG_UNIX98_PTYS is not set
+# CONFIG_DEVMEM is not set
+CONFIG_SERIAL_MCF=y
+CONFIG_SERIAL_MCF_BAUDRATE=115200
+CONFIG_SERIAL_MCF_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_SPI=y
+CONFIG_SPI_DEBUG=y
+CONFIG_SPI_FSL_DSPI=y
+CONFIG_DEBUG_GPIO=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_GENERIC_PLATFORM=y
+# CONFIG_HWMON is not set
+# CONFIG_RC_CORE is not set
+# CONFIG_HID is not set
+# CONFIG_USB_SUPPORT is not set
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+CONFIG_FSCACHE=y
+# CONFIG_PROC_SYSCTL is not set
+CONFIG_PRINTK_TIME=y
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
+CONFIG_SLUB_DEBUG_ON=y
+CONFIG_PANIC_ON_OOPS=y
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+CONFIG_BOOTPARAM=y
+CONFIG_BOOTPARAM_STRING="console=ttyS0,115200 root=/dev/ram0 rw rootfstype=ramfs rdinit=/bin/init devtmpfs.mount=1"
+CONFIG_CRYPTO=y
+# CONFIG_CRYPTO_ECHAINIV is not set
+CONFIG_CRYPTO_ANSI_CPRNG=y
+# CONFIG_CRYPTO_HW is not set
+CONFIG_CRC16=y
-- 
2.14.1
