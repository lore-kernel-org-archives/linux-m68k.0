From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH RESEND] m68k: add Sysam AMCORE open board support
Date: Thu, 29 Sep 2016 11:16:02 +1000
Message-ID: <23c7fe5e-4023-94ae-0436-6b393cbb490a@linux-m68k.org>
References: <1475104970-25652-1-git-send-email-angelo@sysam.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:30886
        "EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754724AbcI2BQJ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 28 Sep 2016 21:16:09 -0400
In-Reply-To: <1475104970-25652-1-git-send-email-angelo@sysam.it>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>, linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

Hi Angelo,

On 29/09/16 09:22, Angelo Dureghello wrote:
> Add support for Sysam AMCORE board, an open hardware embedded Linux
> board, see http://sysam.it/openzone/projects/amcore/amcore.html for
> any info.

Some comments below inline. My comments assume this patch
was generated against a current or recent Linux head kernel.
But I am not sure if that is the case?

What bus driver does this use for i2c?

Steven King had a patch set a couple of years back that did full
ColdFire i2c support - but the sticking point was the i2c bus
driver was not acceptable to the i2c driver folks.

But, the ColdFire platform part was good, and I have had a patch
that contains just those parts sitting in my m68knommu git tree
awaiting testing and some motivation to push it up-stream.

  https://git.kernel.org/cgit/linux/kernel/git/gerg/m68knommu.git/commit/?h=i2c

Of course it is not terribly useful without i2c driver support.
The mcfi2c include in this patch may need to be removed for one thing.


> Signed-off-by: Angelo Dureghello <angelo@sysam.it>
> ---
>  arch/m68k/Kconfig.machine          |   6 ++
>  arch/m68k/coldfire/Makefile        |   1 +
>  arch/m68k/coldfire/amcore.c        | 191 +++++++++++++++++++++++++++++++++++++
>  arch/m68k/configs/amcore_defconfig | 114 ++++++++++++++++++++++
>  arch/m68k/include/asm/m5307sim.h   |   7 ++
>  5 files changed, 319 insertions(+)
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
> index 0000000..d19a134
> --- /dev/null
> +++ b/arch/m68k/coldfire/amcore.c
> @@ -0,0 +1,191 @@
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
> +
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +
> +#ifdef CONFIG_COLDFIRE

This file can only be compiled for a ColdFire (in fact only 5307
based on your Kconfig.machine and Makefile changes). No need to
wrap it in an "#ifdef".


> +#include <asm/coldfire.h>
> +#include <asm/mcfsim.h>
> +#endif
> +
> +#include <asm/io.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/map.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/mtd/physmap.h>
> +#include <linux/i2c.h>
> +#include <asm/m5307sim.h>

No need to include m5307sim.h, it is included from mcfsim.h.

Normal practice is to list all the linux/*.h includes first,
then the asm/*.h includes.


> +/*
> + * Name the Board for the /proc/cpuinfo
> + */
> +const char cf_board_name[] = "Sysam AMCORE";

This doesn't appear to be used?


> +
> +#if defined(CONFIG_DM9000) || defined(CONFIG_DM9000_MODULE)

#if IS_ENABLED(CONFIG_DM9000)


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
> +		.end    = DM9000_ADDR + 3,
> +		.flags  = IORESOURCE_MEM,
> +	},
> +	/* physical address of the data register (CMD [A2] to 1)*/
> +	[1] = {
> +		.start  = DM9000_ADDR + 4,
> +		.end    = DM9000_ADDR + 4 + 0xff,
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
> +{
> +	.name		= "U-Boot (128K)",
> +	.size		= 0x20000,
> +	.offset		= 0x0
> +},
> +{
> +	.name		= "Kernel+ROMfs (2994K)",
> +	.size		= 0x2E0000,
> +	.offset		= MTDPART_OFS_APPEND
> +},
> +{
> +	.name		= "Flash Free Space (1024K)",
> +	.size		= MTDPART_SIZ_FULL,
> +	.offset		= MTDPART_OFS_APPEND
> +}
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
> +	.platform_data	= &flash_data,
> +	},
> +};
> +
> +static struct resource i2c_resources[] = {
> +	{
> +		.start	= MCFI2C_IOBASE,
> +		.end	= MCFI2C_IOBASE + 0x40,
> +		.flags	= IORESOURCE_MEM,
> +	},
> +	{
> +		.start	= MCF_IRQ_I2C,
> +		.end	= MCF_IRQ_I2C,
> +		.flags	= IORESOURCE_IRQ,
> +	},
> +};
> +
> +static struct platform_device i2c_device = {
> +	.name		= "mcfi2c",
> +	.id		= 0,
> +	.num_resources	= ARRAY_SIZE(i2c_resources),
> +	.resource	= i2c_resources,
> +};
> +
> +static void __init i2c_init(void)
> +{
> +	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL5 | MCFSIM_ICR_PRI0,
> +		MCF_MBAR + MCFSIM_I2CICR);

MCF_MBAR should not be added in here.
The current definition of your MCFSIM_I2CICR to MCFSIM_ICR3 is then
"(MCF_MBAR + 0x4f)" in m5307sim.h. (This was not the case many years
back, but it has been for a while now. If you just up-ported this
patch from your 2.6 development work you might have missed this). 


> +	mcf_mapirq2imr(MCF_IRQ_I2C, MCFINTC_I2C);
> +}
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
> +#if defined(CONFIG_DM9000) || defined(CONFIG_DM9000_MODULE)
> +	&dm9000_device,
> +#endif
> +	&flash_device,
> +	&rtc_device,
> +	&i2c_device,
> +};
> +
> +static int __init init_amcore(void)
> +{
> +	dm9000_pre_init();
> +
> +	/* Add i2c RTC Dallas chip supprt */
> +	i2c_register_board_info(0, amcore_i2c_info,
> +				ARRAY_SIZE(amcore_i2c_info));
> +
> +	platform_add_devices(amcore_devices, ARRAY_SIZE(amcore_devices));
> +
> +	i2c_init();
> +
> +	return 0;
> +}
> +
> +arch_initcall(init_amcore);
> diff --git a/arch/m68k/configs/amcore_defconfig b/arch/m68k/configs/amcore_defconfig
> new file mode 100644
> index 0000000..e94eb24
> --- /dev/null
> +++ b/arch/m68k/configs/amcore_defconfig
> @@ -0,0 +1,114 @@
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
> +# CONFIG_I2C_HELPER_AUTO is not set
> +CONFIG_PPS=y
> +# CONFIG_HWMON is not set
> +# CONFIG_USB_SUPPORT is not set
> +CONFIG_RTC_CLASS=y
> +CONFIG_EXT2_FS=y
> +CONFIG_EXT2_FS_XATTR=y
> +# CONFIG_FILE_LOCKING is not set
> +# CONFIG_DNOTIFY is not set
> +# CONFIG_INOTIFY_USER is not set
> +CONFIG_FSCACHE=y
> +# CONFIG_PROC_SYSCTL is not set
> +# CONFIG_SYSFS is not set
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
> diff --git a/arch/m68k/include/asm/m5307sim.h b/arch/m68k/include/asm/m5307sim.h
> index 5d0bb7e..81f1afd 100644
> --- a/arch/m68k/include/asm/m5307sim.h
> +++ b/arch/m68k/include/asm/m5307sim.h
> @@ -131,6 +131,11 @@
>  #define MCFGPIO_IRQ_MAX		-1
>  #define MCFGPIO_IRQ_VECBASE	-1
>  
> +/*
> + * I2C module.
> + */
> +#define MCFI2C_IOBASE		(MCF_MBAR + 0x280)
> +
>  
>  /* Definition offset address for CS2-7  -- old mask 5307 */
>  
> @@ -148,6 +153,7 @@
>  #define	MCFSIM_SWDICR		MCFSIM_ICR0	/* Watchdog timer ICR */
>  #define	MCFSIM_TIMER1ICR	MCFSIM_ICR1	/* Timer 1 ICR */
>  #define	MCFSIM_TIMER2ICR	MCFSIM_ICR2	/* Timer 2 ICR */
> +#define MCFSIM_I2CICR		MCFSIM_ICR3	/* I2C ICR */
>  #define	MCFSIM_UART1ICR		MCFSIM_ICR4	/* UART 1 ICR */
>  #define	MCFSIM_UART2ICR		MCFSIM_ICR5	/* UART 2 ICR */
>  #define	MCFSIM_DMA0ICR		MCFSIM_ICR6	/* DMA 0 ICR */
> @@ -174,6 +180,7 @@
>  /*
>   *	Define system peripheral IRQ usage.
>   */
> +#define MCF_IRQ_I2C		29		/* I2C */
>  #define	MCF_IRQ_TIMER		30		/* Timer0, Level 6 */
>  #define	MCF_IRQ_PROFILER	31		/* Timer1, Level 7 */
>  #define	MCF_IRQ_UART0		73		/* UART0 */
> 
