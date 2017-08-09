From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: [PATCH] m68k: allow ColdFire m5441x parts to run with MMU enabled
Date: Wed, 9 Aug 2017 17:32:25 +0200
Message-ID: <c095233b-15fc-53f7-c21d-a6c805711040@sysam.it>
References: <bc3dc168-aaae-1271-b73b-4d649db5e301@sysam.it>
 <d1ce1669-0286-ebad-7c6c-e9dfe37c266c@sysam.it>
 <30318b18-e955-1615-975e-9b378d3201b8@westnet.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:58238 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753421AbdHIPc1 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 9 Aug 2017 11:32:27 -0400
In-Reply-To: <30318b18-e955-1615-975e-9b378d3201b8@westnet.com.au>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>
Cc: Greg Ungerer <gregungerer@westnet.com.au>

Hi Greg,

On 09/08/2017 15:04, Greg Ungerer wrote:
> Hi Angelo,
> 
> On 15/07/17 09:47, Angelo Dureghello wrote:
>> On 15/07/2017 01:21, Angelo Dureghello wrote:
>>> The Freescale ColdFire M5441x system-on-chip parts have full paged MMU
>>> hardware support. So far though we have only allowed them to be
>>> configured for use in non-MMU mode.
>>>
>>> All required kernel changes to support operation of the M5441x parts
>>> with MMU enabled have been pushed into the kernel, so now we can allow
>>> it to be configured and used with the MMU enabled.
>>>
>>> I don't actually have any M5441x based hardware so I can't do any real
>>> testing on this. The changes up to now were based on Yannick Gicquel
>>> initial patches to support this. Is anybody out there able to test
>>> this properly?  I won't push this any further until we have some
>>> confirmation that it all works as expected.
>>>
>>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
>>> ---
>>>   arch/m68k/Kconfig.cpu | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
>>> index d2219f30..4dc51c0 100644
>>> --- a/arch/m68k/Kconfig.cpu
>>> +++ b/arch/m68k/Kconfig.cpu
>>> @@ -283,7 +283,7 @@ config M548x
>>>
>>>   config M5441x
>>>       bool "MCF5441x"
>>> -    depends on !MMU
>>> +    select MMU_COLDFIRE if MMU
>>>       select GENERIC_CLOCKEVENTS
>>>       select HAVE_CACHE_CB
>>>       help
>>
>> forgot some useful info on my test:
>>
>> - i built a 4.12 kernel from mainline (just pulled git master) and tested
>> to boot properly as no-mmu
>>
>> - i have those entries in my defconfig:
>> ....
>> CONFIG_BINFMT_FLAT=y
>> CONFIG_BINFMT_ZFLAT=y
>> CONFIG_BINFMT_SHARED_FLAT=y
>> CONFIG_BINFMT_MISC=y
>> ....
>>
>>
>> I can help on debug when back from holidays, in 3 weeks.
> 
> Thanks for trying this out.
> 
> Let me know when you have some time to debug further.
> First up I would like to know what your RAM setup looks like.
> Is it mapped from a base address of 0?
> What is the RAM size?
> 

sure, on this board  http://sysam.it/cff_stmark2.html
there are 128MB of ddr2.

External SDRAM is accessible, at least without any mmc support enabled,
from 0x40000000.

I have following test config:

   GNU nano 2.8.6                                                                              File: arch/m68k/configs/stmark2_defconfig

CONFIG_LOCALVERSION="stmark2-001"
CONFIG_DEFAULT_HOSTNAME="stmark2"
CONFIG_SYSVIPC=y
# CONFIG_FHANDLE is not set
CONFIG_LOG_BUF_SHIFT=14
CONFIG_NAMESPACES=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE="../uClinux-dist/romfs"
# CONFIG_RD_BZIP2 is not set
# CONFIG_RD_LZMA is not set
# CONFIG_RD_XZ is not set
# CONFIG_RD_LZO is not set
# CONFIG_RD_LZ4 is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
# CONFIG_AIO is not set
# CONFIG_ADVISE_SYSCALLS is not set
# CONFIG_MEMBARRIER is not set
CONFIG_EMBEDDED=y
# CONFIG_VM_EVENT_COUNTERS is not set
# CONFIG_COMPAT_BRK is not set
# CONFIG_LBDAF is not set
# CONFIG_BLK_DEV_BSG is not set
CONFIG_BLK_CMDLINE_PARSER=y
CONFIG_COLDFIRE=y
CONFIG_M5441x=y
CONFIG_CLOCK_FREQ=240000000
CONFIG_STMARK2=y
CONFIG_RAMBASE=0x40000000
CONFIG_RAMSIZE=0x8000000
CONFIG_VECTORBASE=0x40000000
CONFIG_KERNELBASE=0x40001000
CONFIG_BINFMT_FLAT=y
CONFIG_BINFMT_ZFLAT=y
CONFIG_BINFMT_SHARED_FLAT=y
CONFIG_BINFMT_MISC=y
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
# CONFIG_ALLOW_DEV_COREDUMP is not set
CONFIG_MTD=y
CONFIG_MTD_CMDLINE_PARTS=y
CONFIG_MTD_BLOCK=y
CONFIG_FTL=y
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_LE_BYTE_SWAP=y
CONFIG_MTD_CFI_GEOMETRY=y
# CONFIG_MTD_CFI_I2 is not set
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_STAA=y
CONFIG_MTD_ROM=y
CONFIG_MTD_COMPLEX_MAPPINGS=y
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PLATRAM=y
CONFIG_MTD_SPI_NOR=y
# CONFIG_INPUT_KEYBOARD is not set
# CONFIG_INPUT_MOUSE is not set
CONFIG_SERIO_LIBPS2=y
# CONFIG_UNIX98_PTYS is not set
# CONFIG_DEVMEM is not set
CONFIG_SERIAL_MCF=y
CONFIG_SERIAL_MCF_BAUDRATE=115200
CONFIG_SERIAL_MCF_CONSOLE=y
# CONFIG_HW_RANDOM is not set
CONFIG_SPI=y
# CONFIG_HWMON is not set
# CONFIG_HID is not set
# CONFIG_USB_SUPPORT is not set
# CONFIG_FILE_LOCKING is not set
# CONFIG_DNOTIFY is not set
# CONFIG_INOTIFY_USER is not set
CONFIG_FSCACHE=y
# CONFIG_PROC_SYSCTL is not set
CONFIG_PRINTK_TIME=y
# CONFIG_ENABLE_WARN_DEPRECATED is not set
# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
CONFIG_PANIC_ON_OOPS=y
# CONFIG_SCHED_DEBUG is not set
# CONFIG_DEBUG_BUGVERBOSE is not set
CONFIG_BOOTPARAM=y
CONFIG_BOOTPARAM_STRING="console=ttyS0,115200 root=/dev/ram0 rw rootfstype=ramfs rdinit=/bin/init devtmpfs.mount=1"
CONFIG_CRYPTO=y
# CONFIG_CRYPTO_ECHAINIV is not set
CONFIG_CRYPTO_ANSI_CPRNG=y
# CONFIG_CRYPTO_HW is not set
CONFIG_CRC16=y


I tried still yesterday a bit, but seems there is no much support for
earlyprintk / low level debug for this architecture.

In case i can try with a gpio toggling routine, at least to find
where kernel stops.


> Regards
> Greg
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Regards,
Angelo
