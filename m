From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: [PATCH RESEND] m68k: add Sysam AMCORE open board support
Date: Fri, 30 Sep 2016 09:25:51 +0200
Message-ID: <3a52c3c9-1153-575e-3cb9-edeb509d9fbb@sysam.it>
References: <1475104970-25652-1-git-send-email-angelo@sysam.it>
 <23c7fe5e-4023-94ae-0436-6b393cbb490a@linux-m68k.org>
 <f37215cc-76e3-f88d-1eba-9be32b4ee107@sysam.it>
 <0242be97-6e31-fbb7-2159-c543d6938007@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:59258 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752451AbcI3HZ4 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Fri, 30 Sep 2016 03:25:56 -0400
In-Reply-To: <0242be97-6e31-fbb7-2159-c543d6938007@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>

Hi Greg,

On 29/09/2016 14:25, Greg Ungerer wrote:
> Hi Angelo,
>
> On 29/09/16 17:18, Angelo Dureghello wrote:
>> Hi Greg,
>> many thanks for the prompt review,
>>
>> On 29/09/2016 03:16, Greg Ungerer wrote:
>>> Hi Angelo,
>>>
>>> On 29/09/16 09:22, Angelo Dureghello wrote:
>>>> Add support for Sysam AMCORE board, an open hardware embedded Linux
>>>> board, see http://sysam.it/openzone/projects/amcore/amcore.html for
>>>> any info.
>>>
>>> Some comments below inline. My comments assume this patch
>>> was generated against a current or recent Linux head kernel.
>>> But I am not sure if that is the case?
>>
>> yes, i started from mainline master, pulled last status yesterday, this
>> since i would finally like to see the board support into mainline. I can
>> work of course in the linux-m68k repo as well, just let me know the more
>> correct way.
>
> Mainline master is definitely best, so that is good.
>
>

perfect.

>>> What bus driver does this use for i2c?
>>>
>>> Steven King had a patch set a couple of years back that did full
>>> ColdFire i2c support - but the sticking point was the i2c bus
>>> driver was not acceptable to the i2c driver folks.
>>>
>>> But, the ColdFire platform part was good, and I have had a patch
>>> that contains just those parts sitting in my m68knommu git tree
>>> awaiting testing and some motivation to push it up-stream.
>>>
>>>
>>> https://git.kernel.org/cgit/linux/kernel/git/gerg/m68knommu.git/commit/?h=i2c
>>>
>>>
>>> Of course it is not terribly useful without i2c driver support.
>>> The mcfi2c include in this patch may need to be removed for one thing.
>>>
>>
>> mainly i developed this board some years ago, and realized that without
>> any attempt to add related support to Linux, things get lost on the way,
>> and it's exactly what's happened.
>>
>>
>> I used i2c for a Dallas RTC, and it was working:
>>
>> ds1307 module init
>> i2c-core: driver [rtc-ds1307] registered
>> i2c /dev entries driver
>> i2c-core: driver [dev_driver] registered
>> i2c i2c-0: adapter [mcfi2c.0] registered
>> rtc-ds1307 0-0068: probe
>> i2c i2c-0: master_xfer[0] W, addr=0x68, len=1
>> i2c i2c-0: master_xfer[1] R, addr=0x68, len=8
>> ds1338: dev (254:0)
>> rtc-ds1307 0-0068: rtc core: registered ds1338 as rtc0
>> rtc-ds1307 0-0068: 56 bytes nvram
>> i2c i2c-0: client [ds1338] registered with bus id 0-0068
>> i2c-dev: adapter [mcfi2c.0] registered as minor 0
>> mcfi2c mcfi2c.0: Coldfire I2C bus driver
>> TCP cubic registered
>> NET: Registered protocol family 17
>> i2c i2c-0: master_xfer[0] W, addr=0x68, len=1
>> i2c i2c-0: master_xfer[1] R, addr=0x68, len=7
>> rtc-ds1307 0-0068: read: 13 04 23 06 16 09 11
>> rtc-ds1307 0-0068: read secs=13, mins=4, hours=23, mday=16, mon=8,
>> year=111, wday=5
>> rtc-ds1307 0-0068: setting system clock to 2011-09-16 23:04:13 UTC
>> (1316214253)
>>
>> But seems i can't find now the related changes i used.
>> No problem, i can leave out the i2c part for now, and i would work
>
> Was the above trace from your older kernel?
> Or with current master head?
>
> A bit of googling and you find find Steven Kings i2c driver
> for ColdFire. This is one version of it that I recall:
>
>   http://mailman.uclinux.org/pipermail/uclinux-dev/2012-May/051874.html
>
> Anyway, I recall that the issue is that the ColdFire i2c hardware module
> is very similar to the Freescale iMX i2c hardware module. And the i2c
> maintainers didn't want a separate i2c-coldfire.c - the imx i2c driver
> should be modified to support it in both cores.
>
>
>
>> to add it in a second future step, ok ?
>
> Yep, no problem at all. If you can build on that i2c Coldfire patch
> I reference that would be ideal. It covers i2c on all ColdFire SoC
> that have it, so it is a good base. And that would test that patch
> and I can push that to mainline too.
>
>

I finally could have the driver working in 4.8. Yes, as you have seen,
i used the Steven King driver that i updated now to work with the
last mainline.

U-Boot 2016.09-00092-g1ba96b1-dirty (Sep 20 2016 - 17:51:47)

CPU:   Freescale Coldfire MCF5307 at 90 MHz
DRAM:  16 MiB
Flash: 4 MiB
Hit any key to stop autoboot:  0
## Booting kernel from Legacy Image at ffc20000 ...
    Image Name:   mainline kernel
    Image Type:   M68K Linux Kernel Image (uncompressed)
    Data Size:    2914308 Bytes = 2.8 MiB
    Load Address: 00020000
    Entry Point:  00020000
    Verifying Checksum ... OK
    Loading Kernel Image ... OK
[    0.000000] Linux version 4.8.0-rc8amcore-001-00013-g53061af-dirty
   (angelo@jerusalem) (gcc version 4.9.0 (crosstools-sysam-2016.04.16) )
    #2 Fri Sep 30 01:56:50 CEST 2016
[    0.000000]
[    0.000000]
[    0.000000] uClinux/COLDFIRE(m5307)
[    0.000000] COLDFIRE port done by Greg Ungerer, gerg@snapgear.com
[    0.000000] Modified for M5307 by Dave Miller, dmiller@intellistor.com
...

[    1.090000] i2c /dev entries driver
[    1.110000] rtc-ds1307 0-0068: rtc core: registered ds1338 as rtc0
[    1.110000] rtc-ds1307 0-0068: 56 bytes nvram
[    1.120000] mcfi2c mcfi2c.0: Coldfire I2C bus driver
[    1.120000] NET: Registered protocol family 17
[    1.140000] rtc-ds1307 0-0068: setting system clock to
                  2000-01-01 06:27:17 UTC (946708037)
[    1.160000] VFS: Mounted root (romfs filesystem) readonly on device 31:3.
[    1.170000] Freeing unused kernel memory: 56K (0021a000 - 00228000)
[    1.170000] This architecture does not have kernel memory protection.

But still have an issue with the hwclock tool (not busybux), for some reason
can't apply rtc time:

~ # hwclock --hctosys
RTC_RD_TIME: Invalid argument
ioctl() to /dev/rtc to read the time failed.
~ # hwclock --hctosys -D
hwclock 2.4c/util-linux-2.11a
Using /dev/rtc interface to clock.
Assuming hardware clock is kept in local time.
Waiting for clock tick...
/dev/rtc does not have interrupt functions. Waiting in loop for time
         from /dev/rtc to change
RTC_RD_TIME: Invalid argument
ioctl() to /dev/rtc to read the time failed.


The hw part seems sane, so should be able to fix this later today.
All other issues below are fixed.
Then i would send a 2/2 patchset, one for the board support and
other for i2c.

Regards,
Angelo Dureghello

>> Ok to fix all issues below in a v.2.
>
> I don't see any problem with the base you have. So cleaned up
> should be no problem to pull in.
>
> Regards
> Greg
>
>
>
>>>> Signed-off-by: Angelo Dureghello <angelo@sysam.it>
>>>> ---
>>>>  arch/m68k/Kconfig.machine          |   6 ++
>>>>  arch/m68k/coldfire/Makefile        |   1 +
>>>>  arch/m68k/coldfire/amcore.c        | 191
>>>> +++++++++++++++++++++++++++++++++++++
>>>>  arch/m68k/configs/amcore_defconfig | 114 ++++++++++++++++++++++
>>>>  arch/m68k/include/asm/m5307sim.h   |   7 ++
>>>>  5 files changed, 319 insertions(+)
>>>>  create mode 100644 arch/m68k/coldfire/amcore.c
>>>>  create mode 100644 arch/m68k/configs/amcore_defconfig
>>>>
>>>> diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
>>>> index 2a5c7ab..9225b4a 100644
>>>> --- a/arch/m68k/Kconfig.machine
>>>> +++ b/arch/m68k/Kconfig.machine
>>>> @@ -259,6 +259,12 @@ config M5407C3
>>>>      help
>>>>        Support for the Motorola M5407C3 board.
>>>>
>>>> +config AMCORE
>>>> +    bool "Sysam AMCORE board support"
>>>> +    depends on M5307
>>>> +    help
>>>> +      Support for the Sysam AMCORE open-hardware generic board.
>>>> +
>>>>  config FIREBEE
>>>>      bool "FireBee board support"
>>>>      depends on M547x
>>>> diff --git a/arch/m68k/coldfire/Makefile b/arch/m68k/coldfire/Makefile
>>>> index 68f0fac..4aa2c57 100644
>>>> --- a/arch/m68k/coldfire/Makefile
>>>> +++ b/arch/m68k/coldfire/Makefile
>>>> @@ -34,6 +34,7 @@ obj-$(CONFIG_NETtel)    += nettel.o
>>>>  obj-$(CONFIG_CLEOPATRA)    += nettel.o
>>>>  obj-$(CONFIG_FIREBEE)    += firebee.o
>>>>  obj-$(CONFIG_MCF8390)    += mcf8390.o
>>>> +obj-$(CONFIG_AMCORE)    += amcore.o
>>>>
>>>>  obj-$(CONFIG_PCI)    += pci.o
>>>>
>>>> diff --git a/arch/m68k/coldfire/amcore.c b/arch/m68k/coldfire/amcore.c
>>>> new file mode 100644
>>>> index 0000000..d19a134
>>>> --- /dev/null
>>>> +++ b/arch/m68k/coldfire/amcore.c
>>>> @@ -0,0 +1,191 @@
>>>> +/*
>>>> + * amcore.c -- Support for Sysam AMCORE open board
>>>> + *
>>>> + * (C) Copyright 2016, Angelo Dureghello <angelo@sysam.it>
>>>> + *
>>>> + * This file is subject to the terms and conditions of the GNU
>>>> General Public
>>>> + * License.  See the file COPYING in the main directory of this archive
>>>> + * for more details.
>>>> + */
>>>> +
>>>> +#include <linux/device.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/dm9000.h>
>>>> +
>>>> +#include <linux/irq.h>
>>>> +#include <linux/interrupt.h>
>>>> +
>>>> +#ifdef CONFIG_COLDFIRE
>>>
>>> This file can only be compiled for a ColdFire (in fact only 5307
>>> based on your Kconfig.machine and Makefile changes). No need to
>>> wrap it in an "#ifdef".
>>>
>>>
>>>> +#include <asm/coldfire.h>
>>>> +#include <asm/mcfsim.h>
>>>> +#endif
>>>> +
>>>> +#include <asm/io.h>
>>>> +#include <linux/mtd/mtd.h>
>>>> +#include <linux/mtd/map.h>
>>>> +#include <linux/mtd/partitions.h>
>>>> +#include <linux/mtd/physmap.h>
>>>> +#include <linux/i2c.h>
>>>> +#include <asm/m5307sim.h>
>>>
>>> No need to include m5307sim.h, it is included from mcfsim.h.
>>>
>>> Normal practice is to list all the linux/*.h includes first,
>>> then the asm/*.h includes.
>>>
>>>
>>>> +/*
>>>> + * Name the Board for the /proc/cpuinfo
>>>> + */
>>>> +const char cf_board_name[] = "Sysam AMCORE";
>>>
>>> This doesn't appear to be used?
>>>
>>>
>>>> +
>>>> +#if defined(CONFIG_DM9000) || defined(CONFIG_DM9000_MODULE)
>>>
>>> #if IS_ENABLED(CONFIG_DM9000)
>>>
>>>
>>>> +#define DM9000_IRQ    25
>>>> +#define DM9000_ADDR    0x30000000
>>>> +
>>>> +/*
>>>> + * DEVICES and related device RESOURCES
>>>> + */
>>>> +static struct resource dm9000_resources[] = {
>>>> +    /* physical address of the address register (CMD [A2] to 0)*/
>>>> +    [0] = {
>>>> +        .start  = DM9000_ADDR,
>>>> +        .end    = DM9000_ADDR + 3,
>>>> +        .flags  = IORESOURCE_MEM,
>>>> +    },
>>>> +    /* physical address of the data register (CMD [A2] to 1)*/
>>>> +    [1] = {
>>>> +        .start  = DM9000_ADDR + 4,
>>>> +        .end    = DM9000_ADDR + 4 + 0xff,
>>>> +        .flags  = IORESOURCE_MEM,
>>>> +    },
>>>> +    /* IRQ line the device's interrupt pin is connected to */
>>>> +    [2] = {
>>>> +        .start  = DM9000_IRQ,
>>>> +        .end    = DM9000_IRQ,
>>>> +        .flags  = IORESOURCE_IRQ,
>>>> +    },
>>>> +};
>>>> +
>>>> +static struct dm9000_plat_data dm9000_platdata = {
>>>> +    .flags        = DM9000_PLATF_32BITONLY,
>>>> +};
>>>> +
>>>> +static struct platform_device dm9000_device = {
>>>> +    .name           = "dm9000",
>>>> +    .id             = 0,
>>>> +    .num_resources  = ARRAY_SIZE(dm9000_resources),
>>>> +    .resource       = dm9000_resources,
>>>> +    .dev = {
>>>> +        .platform_data = &dm9000_platdata,
>>>> +    }
>>>> +};
>>>> +#endif
>>>> +
>>>> +static void __init dm9000_pre_init(void)
>>>> +{
>>>> +    /* Set the dm9000 interrupt to be auto-vectored */
>>>> +    mcf_autovector(DM9000_IRQ);
>>>> +}
>>>> +
>>>> +/*
>>>> + * Partitioning of parallel NOR flash (39VF3201B)
>>>> + */
>>>> +static struct mtd_partition amcore_partitions[] = {
>>>> +{
>>>> +    .name        = "U-Boot (128K)",
>>>> +    .size        = 0x20000,
>>>> +    .offset        = 0x0
>>>> +},
>>>> +{
>>>> +    .name        = "Kernel+ROMfs (2994K)",
>>>> +    .size        = 0x2E0000,
>>>> +    .offset        = MTDPART_OFS_APPEND
>>>> +},
>>>> +{
>>>> +    .name        = "Flash Free Space (1024K)",
>>>> +    .size        = MTDPART_SIZ_FULL,
>>>> +    .offset        = MTDPART_OFS_APPEND
>>>> +}
>>>> +};
>>>> +
>>>> +static struct physmap_flash_data flash_data = {
>>>> +    .parts        = amcore_partitions,
>>>> +    .nr_parts    = ARRAY_SIZE(amcore_partitions),
>>>> +    .width        = 2,
>>>> +};
>>>> +
>>>> +static struct resource flash_resource = {
>>>> +    .start        = 0xffc00000,
>>>> +    .end        = 0xffffffff,
>>>> +    .flags        = IORESOURCE_MEM,
>>>> +};
>>>> +
>>>> +static struct platform_device flash_device = {
>>>> +    .name        = "physmap-flash",
>>>> +    .id        = -1,
>>>> +    .resource    = &flash_resource,
>>>> +    .num_resources    = 1,
>>>> +    .dev        = {
>>>> +    .platform_data    = &flash_data,
>>>> +    },
>>>> +};
>>>> +
>>>> +static struct resource i2c_resources[] = {
>>>> +    {
>>>> +        .start    = MCFI2C_IOBASE,
>>>> +        .end    = MCFI2C_IOBASE + 0x40,
>>>> +        .flags    = IORESOURCE_MEM,
>>>> +    },
>>>> +    {
>>>> +        .start    = MCF_IRQ_I2C,
>>>> +        .end    = MCF_IRQ_I2C,
>>>> +        .flags    = IORESOURCE_IRQ,
>>>> +    },
>>>> +};
>>>> +
>>>> +static struct platform_device i2c_device = {
>>>> +    .name        = "mcfi2c",
>>>> +    .id        = 0,
>>>> +    .num_resources    = ARRAY_SIZE(i2c_resources),
>>>> +    .resource    = i2c_resources,
>>>> +};
>>>> +
>>>> +static void __init i2c_init(void)
>>>> +{
>>>> +    writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL5 | MCFSIM_ICR_PRI0,
>>>> +        MCF_MBAR + MCFSIM_I2CICR);
>>>
>>> MCF_MBAR should not be added in here.
>>> The current definition of your MCFSIM_I2CICR to MCFSIM_ICR3 is then
>>> "(MCF_MBAR + 0x4f)" in m5307sim.h. (This was not the case many years
>>> back, but it has been for a while now. If you just up-ported this
>>> patch from your 2.6 development work you might have missed this).
>>>
>>>
>>>> +    mcf_mapirq2imr(MCF_IRQ_I2C, MCFINTC_I2C);
>>>> +}
>>>> +
>>>> +static struct platform_device rtc_device = {
>>>> +    .name    = "rtc-ds1307",
>>>> +    .id    = -1,
>>>> +};
>>>> +
>>>> +static struct i2c_board_info amcore_i2c_info[] __initdata = {
>>>> +    {
>>>> +        I2C_BOARD_INFO("ds1338", 0x68),
>>>> +    },
>>>> +};
>>>> +
>>>> +static struct platform_device *amcore_devices[] __initdata = {
>>>> +#if defined(CONFIG_DM9000) || defined(CONFIG_DM9000_MODULE)
>>>> +    &dm9000_device,
>>>> +#endif
>>>> +    &flash_device,
>>>> +    &rtc_device,
>>>> +    &i2c_device,
>>>> +};
>>>> +
>>>> +static int __init init_amcore(void)
>>>> +{
>>>> +    dm9000_pre_init();
>>>> +
>>>> +    /* Add i2c RTC Dallas chip supprt */
>>>> +    i2c_register_board_info(0, amcore_i2c_info,
>>>> +                ARRAY_SIZE(amcore_i2c_info));
>>>> +
>>>> +    platform_add_devices(amcore_devices, ARRAY_SIZE(amcore_devices));
>>>> +
>>>> +    i2c_init();
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +arch_initcall(init_amcore);
>>>> diff --git a/arch/m68k/configs/amcore_defconfig
>>>> b/arch/m68k/configs/amcore_defconfig
>>>> new file mode 100644
>>>> index 0000000..e94eb24
>>>> --- /dev/null
>>>> +++ b/arch/m68k/configs/amcore_defconfig
>>>> @@ -0,0 +1,114 @@
>>>> +CONFIG_LOCALVERSION="amcore-001"
>>>> +CONFIG_DEFAULT_HOSTNAME="amcore"
>>>> +CONFIG_SYSVIPC=y
>>>> +# CONFIG_FHANDLE is not set
>>>> +# CONFIG_USELIB is not set
>>>> +CONFIG_LOG_BUF_SHIFT=14
>>>> +CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>>>> +# CONFIG_AIO is not set
>>>> +# CONFIG_ADVISE_SYSCALLS is not set
>>>> +# CONFIG_MEMBARRIER is not set
>>>> +CONFIG_EMBEDDED=y
>>>> +# CONFIG_VM_EVENT_COUNTERS is not set
>>>> +# CONFIG_COMPAT_BRK is not set
>>>> +# CONFIG_LBDAF is not set
>>>> +# CONFIG_BLK_DEV_BSG is not set
>>>> +# CONFIG_MMU is not set
>>>> +CONFIG_M5307=y
>>>> +CONFIG_AMCORE=y
>>>> +CONFIG_UBOOT=y
>>>> +CONFIG_RAMSIZE=0x1000000
>>>> +CONFIG_KERNELBASE=0x20000
>>>> +CONFIG_NOMMU_INITIAL_TRIM_EXCESS=0
>>>> +CONFIG_BINFMT_FLAT=y
>>>> +# CONFIG_COREDUMP is not set
>>>> +CONFIG_NET=y
>>>> +CONFIG_PACKET=y
>>>> +CONFIG_UNIX=y
>>>> +CONFIG_INET=y
>>>> +# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
>>>> +# CONFIG_INET_XFRM_MODE_TUNNEL is not set
>>>> +# CONFIG_INET_XFRM_MODE_BEET is not set
>>>> +# CONFIG_IPV6 is not set
>>>> +# CONFIG_WIRELESS is not set
>>>> +# CONFIG_UEVENT_HELPER is not set
>>>> +CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
>>>> +# CONFIG_ALLOW_DEV_COREDUMP is not set
>>>> +CONFIG_CONNECTOR=y
>>>> +CONFIG_MTD=y
>>>> +CONFIG_MTD_BLOCK=y
>>>> +CONFIG_MTD_CFI=y
>>>> +CONFIG_MTD_JEDECPROBE=y
>>>> +CONFIG_MTD_CFI_ADV_OPTIONS=y
>>>> +CONFIG_MTD_CFI_LE_BYTE_SWAP=y
>>>> +CONFIG_MTD_CFI_GEOMETRY=y
>>>> +# CONFIG_MTD_CFI_I2 is not set
>>>> +CONFIG_MTD_CFI_AMDSTD=y
>>>> +CONFIG_MTD_CFI_STAA=y
>>>> +CONFIG_MTD_ROM=y
>>>> +CONFIG_MTD_COMPLEX_MAPPINGS=y
>>>> +CONFIG_MTD_PHYSMAP=y
>>>> +CONFIG_MTD_UCLINUX=y
>>>> +CONFIG_MTD_PLATRAM=y
>>>> +CONFIG_BLK_DEV_RAM=y
>>>> +CONFIG_NETDEVICES=y
>>>> +# CONFIG_NET_VENDOR_ARC is not set
>>>> +# CONFIG_NET_CADENCE is not set
>>>> +# CONFIG_NET_VENDOR_BROADCOM is not set
>>>> +CONFIG_DM9000=y
>>>> +# CONFIG_NET_VENDOR_EZCHIP is not set
>>>> +# CONFIG_NET_VENDOR_INTEL is not set
>>>> +# CONFIG_NET_VENDOR_MARVELL is not set
>>>> +# CONFIG_NET_VENDOR_MICREL is not set
>>>> +# CONFIG_NET_VENDOR_NATSEMI is not set
>>>> +# CONFIG_NET_VENDOR_NETRONOME is not set
>>>> +# CONFIG_NET_VENDOR_QUALCOMM is not set
>>>> +# CONFIG_NET_VENDOR_RENESAS is not set
>>>> +# CONFIG_NET_VENDOR_ROCKER is not set
>>>> +# CONFIG_NET_VENDOR_SAMSUNG is not set
>>>> +# CONFIG_NET_VENDOR_SEEQ is not set
>>>> +# CONFIG_NET_VENDOR_SMSC is not set
>>>> +# CONFIG_NET_VENDOR_STMICRO is not set
>>>> +# CONFIG_NET_VENDOR_SYNOPSYS is not set
>>>> +# CONFIG_NET_VENDOR_VIA is not set
>>>> +# CONFIG_NET_VENDOR_WIZNET is not set
>>>> +# CONFIG_WLAN is not set
>>>> +# CONFIG_INPUT is not set
>>>> +# CONFIG_SERIO is not set
>>>> +# CONFIG_VT is not set
>>>> +# CONFIG_UNIX98_PTYS is not set
>>>> +# CONFIG_DEVMEM is not set
>>>> +# CONFIG_DEVKMEM is not set
>>>> +CONFIG_SERIAL_MCF=y
>>>> +CONFIG_SERIAL_MCF_BAUDRATE=115200
>>>> +CONFIG_SERIAL_MCF_CONSOLE=y
>>>> +# CONFIG_HW_RANDOM is not set
>>>> +CONFIG_I2C=y
>>>> +# CONFIG_I2C_COMPAT is not set
>>>> +# CONFIG_I2C_HELPER_AUTO is not set
>>>> +CONFIG_PPS=y
>>>> +# CONFIG_HWMON is not set
>>>> +# CONFIG_USB_SUPPORT is not set
>>>> +CONFIG_RTC_CLASS=y
>>>> +CONFIG_EXT2_FS=y
>>>> +CONFIG_EXT2_FS_XATTR=y
>>>> +# CONFIG_FILE_LOCKING is not set
>>>> +# CONFIG_DNOTIFY is not set
>>>> +# CONFIG_INOTIFY_USER is not set
>>>> +CONFIG_FSCACHE=y
>>>> +# CONFIG_PROC_SYSCTL is not set
>>>> +# CONFIG_SYSFS is not set
>>>> +CONFIG_JFFS2_FS=y
>>>> +CONFIG_ROMFS_FS=y
>>>> +CONFIG_ROMFS_BACKED_BY_BOTH=y
>>>> +# CONFIG_NETWORK_FILESYSTEMS is not set
>>>> +CONFIG_PRINTK_TIME=y
>>>> +# CONFIG_ENABLE_WARN_DEPRECATED is not set
>>>> +# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>>>> +CONFIG_PANIC_ON_OOPS=y
>>>> +# CONFIG_SCHED_DEBUG is not set
>>>> +# CONFIG_DEBUG_BUGVERBOSE is not set
>>>> +# CONFIG_CRYPTO_ECHAINIV is not set
>>>> +CONFIG_CRYPTO_ANSI_CPRNG=y
>>>> +# CONFIG_CRYPTO_HW is not set
>>>> +CONFIG_CRC16=y
>>>> diff --git a/arch/m68k/include/asm/m5307sim.h
>>>> b/arch/m68k/include/asm/m5307sim.h
>>>> index 5d0bb7e..81f1afd 100644
>>>> --- a/arch/m68k/include/asm/m5307sim.h
>>>> +++ b/arch/m68k/include/asm/m5307sim.h
>>>> @@ -131,6 +131,11 @@
>>>>  #define MCFGPIO_IRQ_MAX        -1
>>>>  #define MCFGPIO_IRQ_VECBASE    -1
>>>>
>>>> +/*
>>>> + * I2C module.
>>>> + */
>>>> +#define MCFI2C_IOBASE        (MCF_MBAR + 0x280)
>>>> +
>>>>
>>>>  /* Definition offset address for CS2-7  -- old mask 5307 */
>>>>
>>>> @@ -148,6 +153,7 @@
>>>>  #define    MCFSIM_SWDICR        MCFSIM_ICR0    /* Watchdog timer ICR */
>>>>  #define    MCFSIM_TIMER1ICR    MCFSIM_ICR1    /* Timer 1 ICR */
>>>>  #define    MCFSIM_TIMER2ICR    MCFSIM_ICR2    /* Timer 2 ICR */
>>>> +#define MCFSIM_I2CICR        MCFSIM_ICR3    /* I2C ICR */
>>>>  #define    MCFSIM_UART1ICR        MCFSIM_ICR4    /* UART 1 ICR */
>>>>  #define    MCFSIM_UART2ICR        MCFSIM_ICR5    /* UART 2 ICR */
>>>>  #define    MCFSIM_DMA0ICR        MCFSIM_ICR6    /* DMA 0 ICR */
>>>> @@ -174,6 +180,7 @@
>>>>  /*
>>>>   *    Define system peripheral IRQ usage.
>>>>   */
>>>> +#define MCF_IRQ_I2C        29        /* I2C */
>>>>  #define    MCF_IRQ_TIMER        30        /* Timer0, Level 6 */
>>>>  #define    MCF_IRQ_PROFILER    31        /* Timer1, Level 7 */
>>>>  #define    MCF_IRQ_UART0        73        /* UART0 */
>>>>
>>>
>>
>
