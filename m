From: Angelo Dureghello <angelo@sysam.it>
Subject: Fwd: Re: mcf54415, spi nor and SD drivers
Date: Sat, 7 Oct 2017 00:27:00 +0200
Message-ID: <cde25488-6241-51df-702f-82a8988d8397@sysam.it>
References: <461bb3c3-822b-98d7-45cf-268cb2a764d5@sysam.it>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------84492521E7315B8CF7ADA95D"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:46171 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752095AbdJFW1D (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Fri, 6 Oct 2017 18:27:03 -0400
In-Reply-To: <461bb3c3-822b-98d7-45cf-268cb2a764d5@sysam.it>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

This is a multi-part message in MIME format.
--------------84492521E7315B8CF7ADA95D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Greg,

On 06/10/2017 06:04, Greg Ungerer wrote:
> Hi Angelo,
> 
> On 06/10/17 09:06, Angelo Dureghello wrote:
>> jfyi, i finally have dspi working on mcf54415.
>>
>> [    8.310000] m25p80 spi0.1: is25lp128 (16384 Kbytes)
>> [    8.320000] Creating 3 MTD partitions on "is25lp128":
>> [    8.330000] 0x000000000000-0x000000100000 : "U-Boot (1024K)"
>> [    9.750000] ftl_cs: FTL header not found.
>> [    9.800000] 0x000000100000-0x000000800000 : "Kernel+initramfs (7168K)"
>> [   11.230000] ftl_cs: FTL header not found.
>> [   11.270000] 0x000000800000-0x000001000000 : "Flash Free Space (8192K)"
>> [   12.010000] random: crng init done
>> [   12.710000] ftl_cs: FTL header not found.
>> [   12.800000] Freeing unused kernel memory: 264K
>>
>>
>> / # cat /proc/mtd
>> dev:    size   erasesize  name
>> mtd0: 00100000 00001000 "U-Boot (1024K)"
>> mtd1: 00700000 00001000 "Kernel+initramfs (7168K)"
>> mtd2: 00800000 00001000 "Flash Free Space (8192K)"
>> / #
> 
> Nice work!
> 

welcome

>   
>> Changes to spi-fsl-dspi.c driver is minimal, just mainly had to
>> get some few settings from board c file.
>>
>> Now the issue is how to proceed, likely, spi-list gouys would complain
>> i add board/platform support to the driver.
>>
>> Is it better i send a patch for this stmark2 board.c before ?
> 
> Sure, start with that. I don't mind if you send spi changes relevant to
> the 54411 here either for review.
> 

well, to post the stmark2 patch there is only one issue btw:
stmark2.c contains a dspi-patch reference.

#include <linux/spi/spi-fsl-dspi.h>

The above is a new file of few lines i created for the dspi
board.c support.

So, maybe i should start posting the dspi patch. I attach the patches for
your review, the patch n2 (spi-nor.c) is already under testing, so you can
ignore it.


> Regards
> Greg
> 
Regards,
Angelo

> 
> 
>> Regards,
>> Angelo Dureghello
>>
>> On 06/07/2017 15:07, Greg Ungerer wrote:
>>> Hi Angelo,
>>>
>>> On 06/07/17 18:36, angelo wrote:
>>>> i designed here a new board with mcf54415. Testing a first mainline kernel.
>>>> I would like to load a cramfs rootfs from SPI NOR (mtd, ftl) but actually
>>>> i don't see the SPI NOR flash detected from dmesg.
>>>>
>>>> Next future step then would be load rootfs from SD.
>>>>
>>>> Seems there is no selectable driver for
>>>>
>>>> - SPI controller
>>>> - SD (MMC) controller
>>>>
>>>> Those should be similar to existing drivers of some other freescale chip,
>>>> or some new implementation is required ? Attaching dmesg.
>>>
>>> Most other ColdFire parts use the QSPI hardware module, and its driver
>>> is at drivers/spi/spi-coldfire-qspi.c. But, looking at the hardware
>>> reference manual for the mcf5441x family it contains a DSPI hardware
>>> module - and it looks quite different.
>>>
>>> That DSPI module looks to be similar to the one in the Freescale iMX
>>> parts, and its driver is at drivers/spi/spi-fsl-dspi.c. I don't know
>>> that anyone has used that on ColdFire with the mcf5441x parts,
>>> but that is where you should start I think.
>>>
>>> I haven't used any SD/MMC drivers on ColdFire so no advice on where
>>> to look for that one.
>>>
>>> If you are feeling adventurous you may want to look at:
>>>
>>>     https://www.spinics.net/lists/linux-m68k/msg10057.html
>>>
>>> With a reasonably recent kernel you don't even need to generate a
>>> different user space filesystem and binaries. You can run your flat
>>> format non-MMU binaries on an MMU configured ColdFire system (as long
>>> as you have CONFIG_BINFMT_FLAT=y in your kernel config). I would love
>>> to be able to push this patch to mainline.
>>>
>>> Regards
>>> Greg
>>>
>>>
>>>
>>>> Regards,
>>>> Angelo Dureghello
>>>>
>>>>
>>>> U-Boot 2017.05-00709-g9d9f074dfe-dirty (Jul 02 2017 - 19:50:16 +0200)
>>>>
>>>> CPU:   Freescale MCF54410 (Mask:9f Version:2)
>>>>          CPU CLK 240 MHz BUS CLK 120 MHz FLB CLK 60 MHz
>>>>          INP CLK 30 MHz VCO CLK 480 MHz
>>>> SPI:   ready
>>>> DRAM:  128 MiB
>>>> SF: Detected is25lp128 with page size 256 Bytes, erase size 64 KiB, total 16 MiB
>>>> In:    serial
>>>> Out:   serial
>>>> Err:   serial
>>>> Hit any key to stop autoboot:  0
>>>> SF: Detected is25lp128 with page size 256 Bytes, erase size 64 KiB, total 16 MiB
>>>> device 0 offset 0x100000, size 0x200000
>>>> SF: 2097152 bytes @ 0x100000 Read: OK
>>>> ## Booting kernel from Legacy Image at 40001000 ...
>>>>      Image Name:   mainline kernel
>>>>      Created:      2017-07-05  23:58:53 UTC
>>>>      Image Type:   M68K Linux Kernel Image (uncompressed)
>>>>      Data Size:    1642496 Bytes = 1.6 MiB
>>>>      Load Address: 40001000
>>>>      Entry Point:  40001000
>>>>      Verifying Checksum ... OK
>>>>      Loading Kernel Image ... OK
>>>> [    0.000000] Linux version 4.10.0-rc2stmark2-001-00020-g0f64df301240 (angelo@jerusalem) (gcc version 4.9.0 (crosstools-sysam-2016.04.16) ) #16 Thu Jul 6 01:58:52 CEST 2017
>>>> [    0.000000] uClinux with CPU COLDFIRE(m5441x)
>>>> [    0.000000] COLDFIRE port done by Greg Ungerer, gerg@snapgear.com
>>>> [    0.000000] Flat model support (C) 1998,1999 Kenneth Albanowski, D. Jeff Dionne
>>>> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on. Total pages: 16320
>>>> [    0.000000] Kernel command line: console=ttyS0,115200 root=/dev/mtdblock3 mtdparts=spi-flash.0:1m(u-boot),7m(kernel),-(rootfs) rw rootwait
>>>> [    0.000000] PID hash table entries: 512 (order: -2, 2048 bytes)
>>>> [    0.000000] Dentry cache hash table entries: 16384 (order: 3, 65536 bytes)
>>>> [    0.000000] Inode-cache hash table entries: 8192 (order: 2, 32768 bytes)
>>>> [    0.000000] Memory: 128664K/131072K available (1154K kernel code, 92K rwdata, 304K rodata, 48K init, 121K bss, 2408K reserved, 0K cma-reserved)
>>>> [    0.000000] Virtual kernel memory layout:
>>>> [    0.000000]     vector  : 0x40000000 - 0x40000400   (   1 KiB)
>>>> [    0.000000]     kmap    : 0x00000000 - 0xffffffff   (4095 MiB)
>>>> [    0.000000]     vmalloc : 0x00000000 - 0xfffff ----- Message truncated -----
>>>> -- 
>>>> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>
>>>
>>
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


--------------84492521E7315B8CF7ADA95D
Content-Type: text/x-patch;
 name="0001-m68k-add-Sysam-stmark2-open-board-support.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-m68k-add-Sysam-stmark2-open-board-support.patch"

>From 64c152bda7c2e4664eb389341388aad40adcae7f Mon Sep 17 00:00:00 2001
From: Angelo Dureghello <angelo@sysam.it>
Date: Fri, 6 Oct 2017 23:56:42 +0200
Subject: [PATCH 1/3] m68k: add Sysam stmark2 open board support

Add support for Sysam stmark2 board, an open hardware embedded
Linux board, see http://sysam.it/cff_stmark2.html for any info.

Signed-off-by: Angelo Dureghello <angelo@sysam.it>
---
 arch/m68k/Kconfig.machine           |   6 ++
 arch/m68k/coldfire/Makefile         |   3 +-
 arch/m68k/coldfire/stmark2.c        | 120 ++++++++++++++++++++++++++++++++++++
 arch/m68k/configs/stmark2_defconfig |  88 ++++++++++++++++++++++++++
 4 files changed, 216 insertions(+), 1 deletion(-)
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
index 000000000000..09d073fcb4a1
--- /dev/null
+++ b/arch/m68k/configs/stmark2_defconfig
@@ -0,0 +1,88 @@
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
+# CONFIG_HWMON is not set
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


--------------84492521E7315B8CF7ADA95D
Content-Type: text/x-patch;
 name="0002-mtd-spi-nor-Add-support-for-ISSI-is25lp128.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0002-mtd-spi-nor-Add-support-for-ISSI-is25lp128.patch"

>From a47c1a4708906617aff1e9555a8448b5115cba0e Mon Sep 17 00:00:00 2001
From: Angelo Dureghello <angelo@sysam.it>
Date: Fri, 6 Oct 2017 23:58:24 +0200
Subject: [PATCH 2/3] mtd: spi-nor: Add support for ISSI is25lp128

Signed-off-by: Angelo Dureghello <angelo@sysam.it>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 19c000722cbc..3312f53a6a80 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1005,6 +1005,7 @@ static const struct flash_info spi_nor_ids[] = {
 
 	/* ISSI */
 	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
+	{ "is25lp128", INFO(0x9d6018, 0, 32 * 1024,   512, SECT_4K) },
 
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
-- 
2.14.1


--------------84492521E7315B8CF7ADA95D
Content-Type: text/x-patch;
 name="0003-spi-enable-Freescale-DSPI-driver-for-Coldfire-mcf544.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0003-spi-enable-Freescale-DSPI-driver-for-Coldfire-mcf544.pa";
 filename*1="tch"

>From 1e0953fad1675c3b6987b0b67db2f722d5417403 Mon Sep 17 00:00:00 2001
From: Angelo Dureghello <angelo@sysam.it>
Date: Sat, 7 Oct 2017 00:07:57 +0200
Subject: [PATCH 3/3] spi: enable Freescale DSPI driver for Coldfire mcf5441x
 family

This patch slightly modify spi-fsl-dspi.c to allow the driver to be
used also by the Coldfire mcf5441x family of CPU's, that are still
using board files.

Signed-off-by: Angelo Dureghello <angelo@sysam.it>
---
 arch/m68k/coldfire/m5441x.c       |  3 +-
 arch/m68k/include/asm/m5441xsim.h |  6 ++++
 drivers/spi/Kconfig               |  2 +-
 drivers/spi/spi-fsl-dspi.c        | 68 ++++++++++++++++++++++++++-------------
 include/linux/spi/spi-fsl-dspi.h  | 31 ++++++++++++++++++
 5 files changed, 86 insertions(+), 24 deletions(-)
 create mode 100644 include/linux/spi/spi-fsl-dspi.h

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 04fd7fde9fb3..dc48bb1cf3e3 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -26,7 +26,7 @@ DEFINE_CLK(0, "intc.0", 18, MCF_CLK);
 DEFINE_CLK(0, "intc.1", 19, MCF_CLK);
 DEFINE_CLK(0, "intc.2", 20, MCF_CLK);
 DEFINE_CLK(0, "imx1-i2c.0", 22, MCF_CLK);
-DEFINE_CLK(0, "mcfdspi.0", 23, MCF_CLK);
+DEFINE_CLK(0, "fsl-dspi.0", 23, MCF_CLK);
 DEFINE_CLK(0, "mcfuart.0", 24, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfuart.1", 25, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfuart.2", 26, MCF_BUSCLK);
@@ -139,6 +139,7 @@ static struct clk * const enable_clks[] __initconst = {
 	&__clk_0_18, /* intc0 */
 	&__clk_0_19, /* intc0 */
 	&__clk_0_20, /* intc0 */
+	&__clk_0_23, /* dspi.0 */
 	&__clk_0_24, /* uart0 */
 	&__clk_0_25, /* uart1 */
 	&__clk_0_26, /* uart2 */
diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index 64f60be47066..211724a81d93 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -277,4 +277,10 @@
 #define MCFGPIO_IRQ_VECBASE	(MCFINT_VECBASE - MCFGPIO_IRQ_MIN)
 #define MCFGPIO_PIN_MAX		87
 
+/* DSPI module */
+#define MCFDSPI_BASE0		0xfc05c000
+
+#define MCF_IRQ_DSPI0		(MCFINT0_VECBASE + MCFINT0_DSPI0)
+
+
 #endif /* m5441xsim_h */
diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index a75f2a2cf780..a8b761979673 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -379,7 +379,7 @@ config SPI_FSL_DSPI
 	tristate "Freescale DSPI controller"
 	select REGMAP_MMIO
 	depends on HAS_DMA
-	depends on SOC_VF610 || SOC_LS1021A || ARCH_LAYERSCAPE || COMPILE_TEST
+	depends on SOC_VF610 || SOC_LS1021A || ARCH_LAYERSCAPE || M5441x || COMPILE_TEST
 	help
 	  This enables support for the Freescale DSPI controller in master
 	  mode. VF610 platform uses the controller.
diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index d89127f4a46d..c879b64ea701 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -32,6 +32,7 @@
 #include <linux/regmap.h>
 #include <linux/sched.h>
 #include <linux/spi/spi.h>
+#include <linux/spi/spi-fsl-dspi.h>
 #include <linux/spi/spi_bitbang.h>
 #include <linux/time.h>
 
@@ -151,6 +152,11 @@ static const struct fsl_dspi_devtype_data ls2085a_data = {
 	.max_clock_factor = 8,
 };
 
+static const struct fsl_dspi_devtype_data coldfire_data = {
+	.trans_mode = DSPI_EOQ_MODE,
+	.max_clock_factor = 8,
+};
+
 struct fsl_dspi_dma {
 	/* Length of transfer in words of DSPI_FIFO_SIZE */
 	u32 curr_xfer_len;
@@ -665,6 +671,7 @@ static int dspi_transfer_one_message(struct spi_master *master,
 	message->actual_length = 0;
 
 	list_for_each_entry(transfer, &message->transfers, transfer_list) {
+
 		dspi->cur_transfer = transfer;
 		dspi->cur_msg = message;
 		dspi->cur_chip = spi_get_ctldata(spi);
@@ -741,6 +748,7 @@ static int dspi_setup(struct spi_device *spi)
 {
 	struct chip_data *chip;
 	struct fsl_dspi *dspi = spi_master_get_devdata(spi->master);
+	struct fsl_dspi_platform_data *pdata;
 	u32 cs_sck_delay = 0, sck_cs_delay = 0;
 	unsigned char br = 0, pbr = 0, pcssck = 0, cssck = 0;
 	unsigned char pasc = 0, asc = 0, fmsz = 0;
@@ -761,11 +769,18 @@ static int dspi_setup(struct spi_device *spi)
 			return -ENOMEM;
 	}
 
-	of_property_read_u32(spi->dev.of_node, "fsl,spi-cs-sck-delay",
-			&cs_sck_delay);
+	pdata = dev_get_platdata(&dspi->pdev->dev);
+
+	if (!pdata) {
+		of_property_read_u32(spi->dev.of_node, "fsl,spi-cs-sck-delay",
+				&cs_sck_delay);
 
-	of_property_read_u32(spi->dev.of_node, "fsl,spi-sck-cs-delay",
-			&sck_cs_delay);
+		of_property_read_u32(spi->dev.of_node, "fsl,spi-sck-cs-delay",
+				&sck_cs_delay);
+	} else {
+		cs_sck_delay = pdata->cs_sck_delay;
+		sck_cs_delay = pdata->sck_cs_delay;
+	}
 
 	chip->mcr_val = SPI_MCR_MASTER | SPI_MCR_PCSIS |
 		SPI_MCR_CLR_TXF | SPI_MCR_CLR_RXF;
@@ -819,7 +834,6 @@ static irqreturn_t dspi_interrupt(int irq, void *dev_id)
 	regmap_read(dspi->regmap, SPI_SR, &spi_sr);
 	regmap_write(dspi->regmap, SPI_SR, spi_sr);
 
-
 	if (spi_sr & (SPI_SR_EOQF | SPI_SR_TCFQF)) {
 		tx_word = is_double_byte_mode(dspi);
 
@@ -949,6 +963,7 @@ static int dspi_probe(struct platform_device *pdev)
 	struct fsl_dspi *dspi;
 	struct resource *res;
 	void __iomem *base;
+	struct fsl_dspi_platform_data *pdata;
 	int ret = 0, cs_num, bus_num;
 
 	master = spi_alloc_master(&pdev->dev, sizeof(struct fsl_dspi));
@@ -969,25 +984,34 @@ static int dspi_probe(struct platform_device *pdev)
 	master->bits_per_word_mask = SPI_BPW_MASK(4) | SPI_BPW_MASK(8) |
 					SPI_BPW_MASK(16);
 
-	ret = of_property_read_u32(np, "spi-num-chipselects", &cs_num);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "can't get spi-num-chipselects\n");
-		goto out_master_put;
-	}
-	master->num_chipselect = cs_num;
+	pdata = dev_get_platdata(&pdev->dev);
+	if (pdata) {
+		master->num_chipselect = pdata->cs_num;
+		master->bus_num = pdata->bus_num;
 
-	ret = of_property_read_u32(np, "bus-num", &bus_num);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "can't get bus-num\n");
-		goto out_master_put;
-	}
-	master->bus_num = bus_num;
+		dspi->devtype_data = &coldfire_data;
+	} else {
 
-	dspi->devtype_data = of_device_get_match_data(&pdev->dev);
-	if (!dspi->devtype_data) {
-		dev_err(&pdev->dev, "can't get devtype_data\n");
-		ret = -EFAULT;
-		goto out_master_put;
+		ret = of_property_read_u32(np, "spi-num-chipselects", &cs_num);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "can't get spi-num-chipselects\n");
+			goto out_master_put;
+		}
+		master->num_chipselect = cs_num;
+
+		ret = of_property_read_u32(np, "bus-num", &bus_num);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "can't get bus-num\n");
+			goto out_master_put;
+		}
+		master->bus_num = bus_num;
+
+		dspi->devtype_data = of_device_get_match_data(&pdev->dev);
+		if (!dspi->devtype_data) {
+			dev_err(&pdev->dev, "can't get devtype_data\n");
+			ret = -EFAULT;
+			goto out_master_put;
+		}
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
diff --git a/include/linux/spi/spi-fsl-dspi.h b/include/linux/spi/spi-fsl-dspi.h
new file mode 100644
index 000000000000..6c8dfa65de21
--- /dev/null
+++ b/include/linux/spi/spi-fsl-dspi.h
@@ -0,0 +1,31 @@
+/*
+ * Freescale DSPI controller driver
+ *
+ * Copyright (c) 2017 Angelo Dureghello <angelo@sysam.it>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef SPI_FSL_DSPI_HEADER_H
+#define SPI_FSL_DSPI_HEADER_H
+
+/**
+ * struct fsl_dspi_platform_data - platform data for the Freescale DSPI driver
+ * @bus_num: board specific identifier for this DSPI driver.
+ * @cs_num: number of chip selects supported by this DSPI driver.
+*/
+struct fsl_dspi_platform_data {
+	u32 cs_num;
+	u32 bus_num;
+	u32 sck_cs_delay;
+	u32 cs_sck_delay;
+};
+
+#endif /* SPI_FSL_DSPI_HEADER_H */
-- 
2.14.1


--------------84492521E7315B8CF7ADA95D--
