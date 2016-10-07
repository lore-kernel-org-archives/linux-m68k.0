From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH v3] m68k: add Sysam AMCORE open board support
Date: Fri, 7 Oct 2016 10:27:30 +1000
Message-ID: <e7f75518-be08-812c-edfb-5a8634be5c5d@westnet.com.au>
References: <1475779295-30252-1-git-send-email-angelo@sysam.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out1.external.iinet.net.au ([203.59.1.210]:2465
        "EHLO icp-osb-irony-out1.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751749AbcJGAgq (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 6 Oct 2016 20:36:46 -0400
In-Reply-To: <1475779295-30252-1-git-send-email-angelo@sysam.it>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>, linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

Hi Angelo,

On 07/10/16 04:41, Angelo Dureghello wrote:
> Add support for Sysam AMCORE board, an open hardware embedded Linux
> board, see http://sysam.it/openzone/projects/amcore/amcore.html for
> any info.
> 
> Signed-off-by: Angelo Dureghello <angelo@sysam.it>

Looks good, thanks.
I will apply to m68knommu git tree, for-next branch.
It would become visible until after the current merge window
closes (so about a week from now).

Regards
Greg


> ---
> Changes in v3:
>   - removed the 2/2 i2c related part.
> ---
>  arch/m68k/Kconfig.machine          |   6 ++
>  arch/m68k/coldfire/Makefile        |   1 +
>  arch/m68k/coldfire/amcore.c        | 156 +++++++++++++++++++++++++++++++++++++
>  arch/m68k/configs/amcore_defconfig | 117 ++++++++++++++++++++++++++++
>  4 files changed, 280 insertions(+)
>  create mode 100644 arch/m68k/coldfire/amcore.c
>  create mode 100644 arch/m68k/configs/amcore_defconfig
> 
> diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
> index 2a5c7ab..9225b4a 100644
> --- a/arch/m68k/Kconfig.machine
> +++ b/arch/m68k/Kconfig.machine
> @@ -259,6 +259,12 @@ config M5407C3
>  	help
>  	  Support for the Motorola M5407C3 board.
>  
> +config AMCORE
> +	bool "Sysam AMCORE board support"
> +	depends on M5307
> +	help
> +	  Support for the Sysam AMCORE open-hardware generic board.
> +
>  config FIREBEE
>  	bool "FireBee board support"
>  	depends on M547x
> diff --git a/arch/m68k/coldfire/Makefile b/arch/m68k/coldfire/Makefile
> index 68f0fac..4aa2c57 100644
> --- a/arch/m68k/coldfire/Makefile
> +++ b/arch/m68k/coldfire/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_NETtel)	+= nettel.o
>  obj-$(CONFIG_CLEOPATRA)	+= nettel.o
>  obj-$(CONFIG_FIREBEE)	+= firebee.o
>  obj-$(CONFIG_MCF8390)	+= mcf8390.o
> +obj-$(CONFIG_AMCORE)    += amcore.o
>  
>  obj-$(CONFIG_PCI)	+= pci.o
>  
> diff --git a/arch/m68k/coldfire/amcore.c b/arch/m68k/coldfire/amcore.c
> new file mode 100644
> index 0000000..c6cb1a5
> --- /dev/null
> +++ b/arch/m68k/coldfire/amcore.c
> @@ -0,0 +1,156 @@
> +/*
> + * amcore.c -- Support for Sysam AMCORE open board
> + *
> + * (C) Copyright 2016, Angelo Dureghello <angelo@sysam.it>
> + *
> + * This file is subject to the terms and conditions of the GNU General Public
> + * License.  See the file COPYING in the main directory of this archive
> + * for more details.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <linux/dm9000.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/map.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/mtd/physmap.h>
> +#include <linux/i2c.h>
> +
> +#include <asm/coldfire.h>
> +#include <asm/mcfsim.h>
> +#include <asm/io.h>
> +
> +#if IS_ENABLED(CONFIG_DM9000)
> +
> +#define DM9000_IRQ	25
> +#define DM9000_ADDR	0x30000000
> +
> +/*
> + * DEVICES and related device RESOURCES
> + */
> +static struct resource dm9000_resources[] = {
> +	/* physical address of the address register (CMD [A2] to 0)*/
> +	[0] = {
> +		.start  = DM9000_ADDR,
> +		.end    = DM9000_ADDR,
> +		.flags  = IORESOURCE_MEM,
> +	},
> +	/*
> +	 * physical address of the data register (CMD [A2] to 1),
> +	 * driver wants a range >=4 to assume a 32bit data bus
> +	 */
> +	[1] = {
> +		.start  = DM9000_ADDR + 4,
> +		.end    = DM9000_ADDR + 7,
> +		.flags  = IORESOURCE_MEM,
> +	},
> +	/* IRQ line the device's interrupt pin is connected to */
> +	[2] = {
> +		.start  = DM9000_IRQ,
> +		.end    = DM9000_IRQ,
> +		.flags  = IORESOURCE_IRQ,
> +	},
> +};
> +
> +static struct dm9000_plat_data dm9000_platdata = {
> +	.flags		= DM9000_PLATF_32BITONLY,
> +};
> +
> +static struct platform_device dm9000_device = {
> +	.name           = "dm9000",
> +	.id             = 0,
> +	.num_resources  = ARRAY_SIZE(dm9000_resources),
> +	.resource       = dm9000_resources,
> +	.dev = {
> +		.platform_data = &dm9000_platdata,
> +	}
> +};
> +#endif
> +
> +static void __init dm9000_pre_init(void)
> +{
> +	/* Set the dm9000 interrupt to be auto-vectored */
> +	mcf_autovector(DM9000_IRQ);
> +}
> +
> +/*
> + * Partitioning of parallel NOR flash (39VF3201B)
> + */
> +static struct mtd_partition amcore_partitions[] = {
> +	{
> +		.name	= "U-Boot (128K)",
> +		.size	= 0x20000,
> +		.offset	= 0x0
> +	},
> +	{
> +		.name	= "Kernel+ROMfs (2994K)",
> +		.size	= 0x2E0000,
> +		.offset	= MTDPART_OFS_APPEND
> +	},
> +	{
> +		.name	= "Flash Free Space (1024K)",
> +		.size	= MTDPART_SIZ_FULL,
> +		.offset	= MTDPART_OFS_APPEND
> +	}
> +};
> +
> +static struct physmap_flash_data flash_data = {
> +	.parts		= amcore_partitions,
> +	.nr_parts	= ARRAY_SIZE(amcore_partitions),
> +	.width		= 2,
> +};
> +
> +static struct resource flash_resource = {
> +	.start		= 0xffc00000,
> +	.end		= 0xffffffff,
> +	.flags		= IORESOURCE_MEM,
> +};
> +
> +static struct platform_device flash_device = {
> +	.name		= "physmap-flash",
> +	.id		= -1,
> +	.resource	= &flash_resource,
> +	.num_resources	= 1,
> +	.dev		= {
> +		.platform_data	= &flash_data,
> +	},
> +};
> +
> +static struct platform_device rtc_device = {
> +	.name	= "rtc-ds1307",
> +	.id	= -1,
> +};
> +
> +static struct i2c_board_info amcore_i2c_info[] __initdata = {
> +	{
> +		I2C_BOARD_INFO("ds1338", 0x68),
> +	},
> +};
> +
> +static struct platform_device *amcore_devices[] __initdata = {
> +#if IS_ENABLED(CONFIG_DM9000)
> +	&dm9000_device,
> +#endif
> +	&flash_device,
> +	&rtc_device,
> +};
> +
> +static int __init init_amcore(void)
> +{
> +#if IS_ENABLED(CONFIG_DM9000)
> +	dm9000_pre_init();
> +#endif
> +
> +	/* Add i2c RTC Dallas chip supprt */
> +	i2c_register_board_info(0, amcore_i2c_info,
> +				ARRAY_SIZE(amcore_i2c_info));
> +
> +	platform_add_devices(amcore_devices, ARRAY_SIZE(amcore_devices));
> +
> +	return 0;
> +}
> +
> +arch_initcall(init_amcore);
> diff --git a/arch/m68k/configs/amcore_defconfig b/arch/m68k/configs/amcore_defconfig
> new file mode 100644
> index 0000000..2bf02e9
> --- /dev/null
> +++ b/arch/m68k/configs/amcore_defconfig
> @@ -0,0 +1,117 @@
> +CONFIG_LOCALVERSION="amcore-001"
> +CONFIG_DEFAULT_HOSTNAME="amcore"
> +CONFIG_SYSVIPC=y
> +# CONFIG_FHANDLE is not set
> +# CONFIG_USELIB is not set
> +CONFIG_LOG_BUF_SHIFT=14
> +CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> +# CONFIG_AIO is not set
> +# CONFIG_ADVISE_SYSCALLS is not set
> +# CONFIG_MEMBARRIER is not set
> +CONFIG_EMBEDDED=y
> +# CONFIG_VM_EVENT_COUNTERS is not set
> +# CONFIG_COMPAT_BRK is not set
> +# CONFIG_LBDAF is not set
> +# CONFIG_BLK_DEV_BSG is not set
> +# CONFIG_MMU is not set
> +CONFIG_M5307=y
> +CONFIG_AMCORE=y
> +CONFIG_UBOOT=y
> +CONFIG_RAMSIZE=0x1000000
> +CONFIG_KERNELBASE=0x20000
> +CONFIG_NOMMU_INITIAL_TRIM_EXCESS=0
> +CONFIG_BINFMT_FLAT=y
> +# CONFIG_COREDUMP is not set
> +CONFIG_NET=y
> +CONFIG_PACKET=y
> +CONFIG_UNIX=y
> +CONFIG_INET=y
> +# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> +# CONFIG_INET_XFRM_MODE_TUNNEL is not set
> +# CONFIG_INET_XFRM_MODE_BEET is not set
> +# CONFIG_IPV6 is not set
> +# CONFIG_WIRELESS is not set
> +# CONFIG_UEVENT_HELPER is not set
> +CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
> +# CONFIG_ALLOW_DEV_COREDUMP is not set
> +CONFIG_CONNECTOR=y
> +CONFIG_MTD=y
> +CONFIG_MTD_BLOCK=y
> +CONFIG_MTD_CFI=y
> +CONFIG_MTD_JEDECPROBE=y
> +CONFIG_MTD_CFI_ADV_OPTIONS=y
> +CONFIG_MTD_CFI_LE_BYTE_SWAP=y
> +CONFIG_MTD_CFI_GEOMETRY=y
> +# CONFIG_MTD_CFI_I2 is not set
> +CONFIG_MTD_CFI_AMDSTD=y
> +CONFIG_MTD_CFI_STAA=y
> +CONFIG_MTD_ROM=y
> +CONFIG_MTD_COMPLEX_MAPPINGS=y
> +CONFIG_MTD_PHYSMAP=y
> +CONFIG_MTD_UCLINUX=y
> +CONFIG_MTD_PLATRAM=y
> +CONFIG_BLK_DEV_RAM=y
> +CONFIG_NETDEVICES=y
> +# CONFIG_NET_VENDOR_ARC is not set
> +# CONFIG_NET_CADENCE is not set
> +# CONFIG_NET_VENDOR_BROADCOM is not set
> +CONFIG_DM9000=y
> +# CONFIG_NET_VENDOR_EZCHIP is not set
> +# CONFIG_NET_VENDOR_INTEL is not set
> +# CONFIG_NET_VENDOR_MARVELL is not set
> +# CONFIG_NET_VENDOR_MICREL is not set
> +# CONFIG_NET_VENDOR_NATSEMI is not set
> +# CONFIG_NET_VENDOR_NETRONOME is not set
> +# CONFIG_NET_VENDOR_QUALCOMM is not set
> +# CONFIG_NET_VENDOR_RENESAS is not set
> +# CONFIG_NET_VENDOR_ROCKER is not set
> +# CONFIG_NET_VENDOR_SAMSUNG is not set
> +# CONFIG_NET_VENDOR_SEEQ is not set
> +# CONFIG_NET_VENDOR_SMSC is not set
> +# CONFIG_NET_VENDOR_STMICRO is not set
> +# CONFIG_NET_VENDOR_SYNOPSYS is not set
> +# CONFIG_NET_VENDOR_VIA is not set
> +# CONFIG_NET_VENDOR_WIZNET is not set
> +# CONFIG_WLAN is not set
> +# CONFIG_INPUT is not set
> +# CONFIG_SERIO is not set
> +# CONFIG_VT is not set
> +# CONFIG_UNIX98_PTYS is not set
> +# CONFIG_DEVMEM is not set
> +# CONFIG_DEVKMEM is not set
> +CONFIG_SERIAL_MCF=y
> +CONFIG_SERIAL_MCF_BAUDRATE=115200
> +CONFIG_SERIAL_MCF_CONSOLE=y
> +# CONFIG_HW_RANDOM is not set
> +CONFIG_I2C=y
> +# CONFIG_I2C_COMPAT is not set
> +CONFIG_I2C_CHARDEV=y
> +# CONFIG_I2C_HELPER_AUTO is not set
> +CONFIG_I2C_COLDFIRE=y
> +CONFIG_PPS=y
> +# CONFIG_HWMON is not set
> +# CONFIG_USB_SUPPORT is not set
> +CONFIG_RTC_CLASS=y
> +# CONFIG_RTC_SYSTOHC is not set
> +CONFIG_RTC_DRV_DS1307=y
> +CONFIG_EXT2_FS=y
> +CONFIG_EXT2_FS_XATTR=y
> +# CONFIG_FILE_LOCKING is not set
> +# CONFIG_DNOTIFY is not set
> +# CONFIG_INOTIFY_USER is not set
> +CONFIG_FSCACHE=y
> +# CONFIG_PROC_SYSCTL is not set
> +CONFIG_JFFS2_FS=y
> +CONFIG_ROMFS_FS=y
> +CONFIG_ROMFS_BACKED_BY_BOTH=y
> +# CONFIG_NETWORK_FILESYSTEMS is not set
> +CONFIG_PRINTK_TIME=y
> +# CONFIG_ENABLE_WARN_DEPRECATED is not set
> +# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
> +CONFIG_PANIC_ON_OOPS=y
> +# CONFIG_SCHED_DEBUG is not set
> +# CONFIG_DEBUG_BUGVERBOSE is not set
> +# CONFIG_CRYPTO_ECHAINIV is not set
> +CONFIG_CRYPTO_ANSI_CPRNG=y
> +# CONFIG_CRYPTO_HW is not set
> +CONFIG_CRC16=y
> 
