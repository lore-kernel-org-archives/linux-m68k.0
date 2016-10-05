From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: [PATCH 1/2] m68k: add Sysam AMCORE open board support
Date: Wed, 5 Oct 2016 14:51:07 +0200
Message-ID: <8d50761d-2c8d-1509-394f-104c3818c310@sysam.it>
References: <1475367526-20169-1-git-send-email-angelo@sysam.it>
 <1ed14396-ce6a-7e01-9bb2-5486ab7c7d1c@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:60114 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751754AbcJEMvL (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 5 Oct 2016 08:51:11 -0400
In-Reply-To: <1ed14396-ce6a-7e01-9bb2-5486ab7c7d1c@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@vger.kernel.org

Hi Greg,

thanks for the review.

On 05/10/2016 13:42, Greg Ungerer wrote:
> Hi Angelo,
>
> On 02/10/16 10:18, Angelo Dureghello wrote:
>> Add support for Sysam AMCORE board, an open hardware embedded Linux
>> board, see http://sysam.it/openzone/projects/amcore/amcore.html for
>> any info.
>
> Just a couple of pedantic points below.
> This is a good separation. Almost there.
>
Very good :)

>
>> Signed-off-by: Angelo Dureghello <angelo@sysam.it>
>> ---
>>  arch/m68k/Kconfig.machine          |   6 ++
>>  arch/m68k/coldfire/Makefile        |   1 +
>>  arch/m68k/coldfire/amcore.c        | 151 +++++++++++++++++++++++++++++++++++++
>>  arch/m68k/configs/amcore_defconfig | 117 ++++++++++++++++++++++++++++
>>  4 files changed, 275 insertions(+)
>>  create mode 100644 arch/m68k/coldfire/amcore.c
>>  create mode 100644 arch/m68k/configs/amcore_defconfig
>>
>> diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
>> index 2a5c7ab..9225b4a 100644
>> --- a/arch/m68k/Kconfig.machine
>> +++ b/arch/m68k/Kconfig.machine
>> @@ -259,6 +259,12 @@ config M5407C3
>>      help
>>        Support for the Motorola M5407C3 board.
>>
>> +config AMCORE
>> +    bool "Sysam AMCORE board support"
>> +    depends on M5307
>> +    help
>> +      Support for the Sysam AMCORE open-hardware generic board.
>> +
>>  config FIREBEE
>>      bool "FireBee board support"
>>      depends on M547x
>> diff --git a/arch/m68k/coldfire/Makefile b/arch/m68k/coldfire/Makefile
>> index 68f0fac..4aa2c57 100644
>> --- a/arch/m68k/coldfire/Makefile
>> +++ b/arch/m68k/coldfire/Makefile
>> @@ -34,6 +34,7 @@ obj-$(CONFIG_NETtel)    += nettel.o
>>  obj-$(CONFIG_CLEOPATRA)    += nettel.o
>>  obj-$(CONFIG_FIREBEE)    += firebee.o
>>  obj-$(CONFIG_MCF8390)    += mcf8390.o
>> +obj-$(CONFIG_AMCORE)    += amcore.o
>>
>>  obj-$(CONFIG_PCI)    += pci.o
>>
>> diff --git a/arch/m68k/coldfire/amcore.c b/arch/m68k/coldfire/amcore.c
>> new file mode 100644
>> index 0000000..e6bfba9
>> --- /dev/null
>> +++ b/arch/m68k/coldfire/amcore.c
>> @@ -0,0 +1,151 @@
>> +/*
>> + * amcore.c -- Support for Sysam AMCORE open board
>> + *
>> + * (C) Copyright 2016, Angelo Dureghello <angelo@sysam.it>
>> + *
>> + * This file is subject to the terms and conditions of the GNU General Public
>> + * License.  See the file COPYING in the main directory of this archive
>> + * for more details.
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/dm9000.h>
>> +#include <linux/irq.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/map.h>
>> +#include <linux/mtd/partitions.h>
>> +#include <linux/mtd/physmap.h>
>> +#include <linux/i2c.h>
>> +
>> +#include <asm/coldfire.h>
>> +#include <asm/mcfsim.h>
>> +#include <asm/io.h>
>> +
>> +#if IS_ENABLED(CONFIG_DM9000)
>> +
>> +#define DM9000_IRQ    25
>> +#define DM9000_ADDR    0x30000000
>> +
>> +/*
>> + * DEVICES and related device RESOURCES
>> + */
>> +static struct resource dm9000_resources[] = {
>> +    /* physical address of the address register (CMD [A2] to 0)*/
>> +    [0] = {
>> +        .start  = DM9000_ADDR,
>> +        .end    = DM9000_ADDR + 3,
>> +        .flags  = IORESOURCE_MEM,
>> +    },
>> +    /* physical address of the data register (CMD [A2] to 1)*/
>> +    [1] = {
>> +        .start  = DM9000_ADDR + 4,
>> +        .end    = DM9000_ADDR + 4 + 0xff,
>
> Just checking... Is it the case that the end address is
> really 0x30000103?
>

Good catch. dm9000 allows only 2 IO port accesses, "index" and "data"
ports. I guess that 0xff is there since copied from other similar dm9000
board support code that was adding a "range" for some reason.
Btw, ports are only 2 DM9000_ADDR and DM9000_ADDR + 4,
and the index/data port switch in this board is node trough A2 wire.
So correct code should be:

	/* physical address of the data register (CMD [A2] to 0) */
	[0] = {
		.start  = DM9000_ADDR,
		.end    = DM9000_ADDR,
		.flags  = IORESOURCE_MEM,
	}	
	/* physical address of the data register (CMD [A2] to 1) */
	[1] = {
        		.start  = DM9000_ADDR + 4,
        		.end    = DM9000_ADDR + 4,
		.flags  = IORESOURCE_MEM,


>
>> +        .flags  = IORESOURCE_MEM,
>> +    },
>> +    /* IRQ line the device's interrupt pin is connected to */
>> +    [2] = {
>> +        .start  = DM9000_IRQ,
>> +        .end    = DM9000_IRQ,
>> +        .flags  = IORESOURCE_IRQ,
>> +    },
>> +};
>> +
>> +static struct dm9000_plat_data dm9000_platdata = {
>> +    .flags        = DM9000_PLATF_32BITONLY,
>> +};
>> +
>> +static struct platform_device dm9000_device = {
>> +    .name           = "dm9000",
>> +    .id             = 0,
>> +    .num_resources  = ARRAY_SIZE(dm9000_resources),
>> +    .resource       = dm9000_resources,
>> +    .dev = {
>> +        .platform_data = &dm9000_platdata,
>> +    }
>> +};
>> +#endif
>> +
>> +static void __init dm9000_pre_init(void)
>> +{
>> +    /* Set the dm9000 interrupt to be auto-vectored */
>> +    mcf_autovector(DM9000_IRQ);
>> +}
>> +
>> +/*
>> + * Partitioning of parallel NOR flash (39VF3201B)
>> + */
>> +static struct mtd_partition amcore_partitions[] = {
>> +{
>> +    .name        = "U-Boot (128K)",
>> +    .size        = 0x20000,
>> +    .offset        = 0x0
>> +},
>
> Formating of these blocks is inconsistent with the
> layout of dm9000_resources above. Most common layout
> has nested structs indented a tab.
>
Ok, will tab it.

>
>> +{
>> +    .name        = "Kernel+ROMfs (2994K)",
>> +    .size        = 0x2E0000,
>> +    .offset        = MTDPART_OFS_APPEND
>> +},
>> +{
>> +    .name        = "Flash Free Space (1024K)",
>> +    .size        = MTDPART_SIZ_FULL,
>> +    .offset        = MTDPART_OFS_APPEND
>> +}
>> +};
>> +
>> +static struct physmap_flash_data flash_data = {
>> +    .parts            = amcore_partitions,
>> +    .nr_parts        = ARRAY_SIZE(amcore_partitions),
>> +    .width            = 2,
>> +};
>> +
>> +static struct resource flash_resource = {
>> +    .start            = 0xffc00000,
>> +    .end            = 0xffffffff,
>> +    .flags            = IORESOURCE_MEM,
>> +};
>                        ^^^^^^^^^
> Might look better if these had he same alignment as
> the structures above and below.
>
>
Ok, sure.

>> +static struct platform_device flash_device = {
>> +    .name        = "physmap-flash",
>> +    .id        = -1,
>> +    .resource    = &flash_resource,
>> +    .num_resources    = 1,
>> +    .dev        = {
>> +    .platform_data    = &flash_data,
>> +    },
>> +};
>> +
>> +static struct platform_device rtc_device = {
>> +    .name    = "rtc-ds1307",
>> +    .id    = -1,
>> +};
>> +
>> +static struct i2c_board_info amcore_i2c_info[] __initdata = {
>> +    {
>> +        I2C_BOARD_INFO("ds1338", 0x68),
>> +    },
>> +};
>> +
>> +static struct platform_device *amcore_devices[] __initdata = {
>> +#if defined(CONFIG_DM9000) || defined(CONFIG_DM9000_MODULE)
>
> #if IS_ENABLED(CONFIG_DM9000)
>

Ok.

>
>> +    &dm9000_device,
>> +#endif
>> +    &flash_device,
>> +    &rtc_device,
>> +};
>> +
>> +static int __init init_amcore(void)
>> +{
>> +    dm9000_pre_init();
>
> Given that the platform io and irq data is conditionally compiled
> in on CONFIG_DM9000 should this call also be conditional?
>
> There is no bad side effects from always having the io and irq
> data compiled in - irrespective of the driver actually be built
> or not. Your call, I don't mind too much either way.
>
>

Ok. Sure i agree it is more clean to ifdef it.

>> +    /* Add i2c RTC Dallas chip supprt */
>> +    i2c_register_board_info(0, amcore_i2c_info,
>> +                ARRAY_SIZE(amcore_i2c_info));
>> +
>> +    platform_add_devices(amcore_devices, ARRAY_SIZE(amcore_devices));
>> +
>> +    return 0;
>> +}
>> +
>> +arch_initcall(init_amcore);
>> diff --git a/arch/m68k/configs/amcore_defconfig b/arch/m68k/configs/amcore_defconfig
>> new file mode 100644
>> index 0000000..2bf02e9
>> --- /dev/null
>> +++ b/arch/m68k/configs/amcore_defconfig
>> @@ -0,0 +1,117 @@
>> +CONFIG_LOCALVERSION="amcore-001"
>> +CONFIG_DEFAULT_HOSTNAME="amcore"
>> +CONFIG_SYSVIPC=y
>> +# CONFIG_FHANDLE is not set
>> +# CONFIG_USELIB is not set
>> +CONFIG_LOG_BUF_SHIFT=14
>> +CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>> +# CONFIG_AIO is not set
>> +# CONFIG_ADVISE_SYSCALLS is not set
>> +# CONFIG_MEMBARRIER is not set
>> +CONFIG_EMBEDDED=y
>> +# CONFIG_VM_EVENT_COUNTERS is not set
>> +# CONFIG_COMPAT_BRK is not set
>> +# CONFIG_LBDAF is not set
>> +# CONFIG_BLK_DEV_BSG is not set
>> +# CONFIG_MMU is not set
>> +CONFIG_M5307=y
>> +CONFIG_AMCORE=y
>> +CONFIG_UBOOT=y
>> +CONFIG_RAMSIZE=0x1000000
>> +CONFIG_KERNELBASE=0x20000
>> +CONFIG_NOMMU_INITIAL_TRIM_EXCESS=0
>> +CONFIG_BINFMT_FLAT=y
>> +# CONFIG_COREDUMP is not set
>> +CONFIG_NET=y
>> +CONFIG_PACKET=y
>> +CONFIG_UNIX=y
>> +CONFIG_INET=y
>> +# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
>> +# CONFIG_INET_XFRM_MODE_TUNNEL is not set
>> +# CONFIG_INET_XFRM_MODE_BEET is not set
>> +# CONFIG_IPV6 is not set
>> +# CONFIG_WIRELESS is not set
>> +# CONFIG_UEVENT_HELPER is not set
>> +CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
>> +# CONFIG_ALLOW_DEV_COREDUMP is not set
>> +CONFIG_CONNECTOR=y
>> +CONFIG_MTD=y
>> +CONFIG_MTD_BLOCK=y
>> +CONFIG_MTD_CFI=y
>> +CONFIG_MTD_JEDECPROBE=y
>> +CONFIG_MTD_CFI_ADV_OPTIONS=y
>> +CONFIG_MTD_CFI_LE_BYTE_SWAP=y
>> +CONFIG_MTD_CFI_GEOMETRY=y
>> +# CONFIG_MTD_CFI_I2 is not set
>> +CONFIG_MTD_CFI_AMDSTD=y
>> +CONFIG_MTD_CFI_STAA=y
>> +CONFIG_MTD_ROM=y
>> +CONFIG_MTD_COMPLEX_MAPPINGS=y
>> +CONFIG_MTD_PHYSMAP=y
>> +CONFIG_MTD_UCLINUX=y
>> +CONFIG_MTD_PLATRAM=y
>> +CONFIG_BLK_DEV_RAM=y
>> +CONFIG_NETDEVICES=y
>> +# CONFIG_NET_VENDOR_ARC is not set
>> +# CONFIG_NET_CADENCE is not set
>> +# CONFIG_NET_VENDOR_BROADCOM is not set
>> +CONFIG_DM9000=y
>> +# CONFIG_NET_VENDOR_EZCHIP is not set
>> +# CONFIG_NET_VENDOR_INTEL is not set
>> +# CONFIG_NET_VENDOR_MARVELL is not set
>> +# CONFIG_NET_VENDOR_MICREL is not set
>> +# CONFIG_NET_VENDOR_NATSEMI is not set
>> +# CONFIG_NET_VENDOR_NETRONOME is not set
>> +# CONFIG_NET_VENDOR_QUALCOMM is not set
>> +# CONFIG_NET_VENDOR_RENESAS is not set
>> +# CONFIG_NET_VENDOR_ROCKER is not set
>> +# CONFIG_NET_VENDOR_SAMSUNG is not set
>> +# CONFIG_NET_VENDOR_SEEQ is not set
>> +# CONFIG_NET_VENDOR_SMSC is not set
>> +# CONFIG_NET_VENDOR_STMICRO is not set
>> +# CONFIG_NET_VENDOR_SYNOPSYS is not set
>> +# CONFIG_NET_VENDOR_VIA is not set
>> +# CONFIG_NET_VENDOR_WIZNET is not set
>> +# CONFIG_WLAN is not set
>> +# CONFIG_INPUT is not set
>> +# CONFIG_SERIO is not set
>> +# CONFIG_VT is not set
>> +# CONFIG_UNIX98_PTYS is not set
>> +# CONFIG_DEVMEM is not set
>> +# CONFIG_DEVKMEM is not set
>> +CONFIG_SERIAL_MCF=y
>> +CONFIG_SERIAL_MCF_BAUDRATE=115200
>> +CONFIG_SERIAL_MCF_CONSOLE=y
>> +# CONFIG_HW_RANDOM is not set
>> +CONFIG_I2C=y
>> +# CONFIG_I2C_COMPAT is not set
>> +CONFIG_I2C_CHARDEV=y
>> +# CONFIG_I2C_HELPER_AUTO is not set
>> +CONFIG_I2C_COLDFIRE=y
>> +CONFIG_PPS=y
>> +# CONFIG_HWMON is not set
>> +# CONFIG_USB_SUPPORT is not set
>> +CONFIG_RTC_CLASS=y
>> +# CONFIG_RTC_SYSTOHC is not set
>> +CONFIG_RTC_DRV_DS1307=y
>> +CONFIG_EXT2_FS=y
>> +CONFIG_EXT2_FS_XATTR=y
>> +# CONFIG_FILE_LOCKING is not set
>> +# CONFIG_DNOTIFY is not set
>> +# CONFIG_INOTIFY_USER is not set
>> +CONFIG_FSCACHE=y
>> +# CONFIG_PROC_SYSCTL is not set
>> +CONFIG_JFFS2_FS=y
>> +CONFIG_ROMFS_FS=y
>> +CONFIG_ROMFS_BACKED_BY_BOTH=y
>> +# CONFIG_NETWORK_FILESYSTEMS is not set
>> +CONFIG_PRINTK_TIME=y
>> +# CONFIG_ENABLE_WARN_DEPRECATED is not set
>> +# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>> +CONFIG_PANIC_ON_OOPS=y
>> +# CONFIG_SCHED_DEBUG is not set
>> +# CONFIG_DEBUG_BUGVERBOSE is not set
>> +# CONFIG_CRYPTO_ECHAINIV is not set
>> +CONFIG_CRYPTO_ANSI_CPRNG=y
>> +# CONFIG_CRYPTO_HW is not set
>> +CONFIG_CRC16=y
>
> Regards
> Greg
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

So v3 will follow with fixes above.

Thanks,
Best regards,
Angelo Dureghello
