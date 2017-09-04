From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: [PATCH] m68k: allow ColdFire m5441x parts to run with MMU enabled
Date: Mon, 4 Sep 2017 16:42:46 +0200
Message-ID: <04bfbf62-232e-30b3-fe0f-5205c674ee30@sysam.it>
References: <bc3dc168-aaae-1271-b73b-4d649db5e301@sysam.it>
 <c095233b-15fc-53f7-c21d-a6c805711040@sysam.it>
 <0e1723eb-0724-7007-5b63-7d80112268a2@westnet.com.au>
 <d4e220c9-f607-cf9a-2e63-910e745dbea9@sysam.it>
 <c5dfd7b3-3266-1ecd-1dbf-e66bd9f5aa32@westnet.com.au>
 <f7d80fbd-3b99-66c5-38f5-592780703f96@sysam.it>
 <590226cf-890a-449b-6bd4-f461fff2938b@westnet.com.au>
 <c8916578-7f5a-707d-e59d-d4d274cbf7a1@sysam.it>
 <702374e9-7c94-1cbe-306a-d39a1fb70fdd@westnet.com.au>
 <c3357a3f-e429-8ae5-9340-064ed09e1f67@sysam.it>
 <f0fad6b5-96a9-6025-1fd3-7a1a0b6679d4@westnet.com.au>
 <7544f20e-a999-cf50-74cf-b45513c6eed3@sysam.it>
 <8eedc7bb-db70-9ae3-2304-300591a8d2bb@sysam.it>
 <CAMuHMdWMrC7EMER0ifz+5RjPov3BOjhjAbVmWHDbTEHFcCOUbQ@mail.gmail.com>
 <bda55359-b4b8-1af7-52bc-d00ef1dd78c4@westnet.com.au>
 <CAMuHMdW-yih8Cm3TnXNHxpCOr-UnbT+NARTKiQS8zyaU3fWL+Q@mail.gmail.com>
 <72e95591-c47d-153c-693e-0bf7ad6bb535@sysam.it>
 <1f6469b9-9592-80bd-b635-4fafe8d46c19@westnet.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:37068 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753736AbdIDOms (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 4 Sep 2017 10:42:48 -0400
In-Reply-To: <1f6469b9-9592-80bd-b635-4fafe8d46c19@westnet.com.au>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gregungerer@westnet.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Greg,


On 04/09/2017 08:08, Greg Ungerer wrote:
> Hi Angelo,
> 
> I have attached a patch with a slightly different approach to
> fixing this. Can you try this one out?
> 
> I have a feel for what is going on, based in particular on
> the changes you made in 0002-m68k-fix-mmu-for-coldfire-mcf5441x.patch.
> I see that the virt_node_shift and accessing pg_data_map when
> not 0 based is going to be problematic with the code as it is.
> 
> 
Great catch, the patch works,
i maintaind btw the

memset(NODE_DATA(node), 0, sizeof(pg_data_t));

inside void __init m68k_setup_node(int node) since otherwise
there was that warning we've seen initially.

About the "cd" issue, it seems to be a hush issue, maybe
becouse hush is built as nommu. Re-executing hush, i can now cd
to a subfolder, but i get then a SEGV on "cd ..".
	

This the boot log:

## Booting kernel from Legacy Image at 40001000 ...
    Image Name:   mainline kernel
    Created:      2017-09-04  14:19:47 UTC
    Image Type:   M68K Linux Kernel Image (uncompressed)
    Data Size:    1930976 Bytes = 1.8 MiB
    Load Address: 40001000
    Entry Point:  40001000
    Verifying Checksum ... OK
    Loading Kernel Image ... OK
[    0.000000] Linux version 4.13.0-rc7stmark2-001-00039-g96e88773601f-dirty (angelo@jerusalem) (gcc version 5.2.0 (crosstools-sysam-2016.04.16)) #56 Mon Sep 4 16:19:46 CEST 2017
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16312
[    0.000000] Kernel command line: console=ttyS0,115200 root=/dev/ram0 rw rootfstype=ramfs rdinit=/bin/init devtmpfs.mount=1
[    0.000000] PID hash table entries: 512 (order: -2, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 3, 65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 2, 32768 bytes)
[    0.000000] Sorting __ex_table...
[    0.000000] Memory: 128288K/131072K available (1219K kernel code, 103K rwdata, 288K rodata, 264K init, 79K bss, 2784K reserved, 0K cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0x40000000 - 0x40000400   (   1 KiB)
[    0.000000]     kmap    : 0xe0000000 - 0xf0000000   ( 256 MiB)
[    0.000000]     vmalloc : 0xd0000000 - 0xe0000000   ( 256 MiB)
[    0.000000]     lowmem  : 0x40000000 - 0x48000000   ( 128 MiB)
[    0.000000]       .init : 0x40196000 - 0x401d8000   ( 264 KiB)
[    0.000000]       .text : 0x40001000 - 0x40131cb0   (1220 KiB)
[    0.000000]       .data : 0x40131cb0 - 0x40193900   ( 392 KiB)
[    0.000000]       .bss  : 0x401d86e0 - 0x401ec680   (  80 KiB)
[    0.000000] SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=8
[    0.000000] NR_IRQS: 256
[    0.000000] clocksource: pit: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1019338904850 ns
[    0.000000] Console: colour dummy device 80x25
[    0.070000] Calibrating delay loop... 238.38 BogoMIPS (lpj=1191936)
[    0.070000] pid_max: default: 32768 minimum: 301
[    0.070000] Mount-cache hash table entries: 2048 (order: 0, 8192 bytes)
[    0.070000] Mountpoint-cache hash table entries: 2048 (order: 0, 8192 bytes)
[    0.080000] devtmpfs: initialized
[    0.090000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.090000] futex hash table entries: 256 (order: -2, 3072 bytes)
[    0.110000] clocksource: Switched to clocksource pit
[    0.110000] FS-Cache: Loaded
[    0.380000] workingset: timestamp_bits=27 max_order=14 bucket_order=0
[    0.430000] io scheduler noop registered
[    0.430000] io scheduler deadline registered
[    0.430000] io scheduler cfq registered (default)
[    0.430000] io scheduler mq-deadline registered
[    0.430000] io scheduler kyber registered
[    0.920000] ColdFire internal UART serial driver
[    0.920000] mcfuart.0: ttyS0 at MMIO 0xfc060000 (irq = 90, base_baud = 7500000) is a ColdFire UART
[    1.110000] console [ttyS0] enabled
[    1.110000] mcfuart.0: ttyS1 at MMIO 0xfc064000 (irq = 91, base_baud = 7500000) is a ColdFire UART
[    1.120000] mcfuart.0: ttyS2 at MMIO 0xfc068000 (irq = 92, base_baud = 7500000) is a ColdFire UART
[    1.130000] mcfuart.0: ttyS3 at MMIO 0xfc06c000 (irq = 93, base_baud = 7500000) is a ColdFire UART
[    1.150000] random: get_random_bytes called from init_oops_id+0x26/0x46 with crng_init=0
[    1.160000] Freeing unused kernel memory: 264K
[    1.170000] This architecture does not have kernel memory protection.
[    1.410000] random: fast init done

/ #


> On 02/09/17 08:08, Angelo Dureghello wrote:
>> about my patch sent yesterday, unfortunately, i found btw
>> at least 1 issue: the busybox "cd" doesn't change directory :)
>>
>> / # cat /proc/vmallocinfo
>> 0xd0006000-0xd000c000   24576 n_tty_open+0x16/0xae pages=2 vmalloc
>> / # ls
>> bin    etc    lib    mnt    proc   sbin   usr
>> dev    home   media  opt    root   sys    var
>> / # cd bin
>> / # ls
>> bin    etc    lib    mnt    proc   sbin   usr
>> dev    home   media  opt    root   sys    var
>> / # cat /proc/vm
>> vmallocinfo  vmstat
>> / # cat /proc/vm
>> vmallocinfo  vmstat
>> / # cat /proc/vmallocinfo
>> 0xd0000000-0xd0006000   24576 unpurged vm_area
>> 0xd0006000-0xd000c000   24576 n_tty_open+0x16/0xae pages=2 vmalloc
>>
>> And after each "cd" attempt, another "unpurged" message is added.
>> Removing MMU cd works as expected.
> 
> I setup a configuration with my 5475 where I moved the build
> RAM base to be 32MB - so it was no longer 0 based. Then I could run
> some tests to at least simulate what you have on the 54411. (The
> only catch is my code could still access 0 and surrounding memory
> addresses without faulting...)
> 
> Running with my attached patch I didn't see any odd behavior with
> cd/ls like you see above.
> 
> Geert: interested if you have any thoughts on problems around
>         virt_to_node_shift. Changing CONFIG_RAMBASE I don't think is
>         going to resolve the problem in m68k_setup_node(). We access
>         of the end of the array since it was divided up based on the
>         size of the RAM, but we access it using an index derrived
>         directly from the absolute address.
> 
> 
>> On 01/09/2017 15:30, Geert Uytterhoeven wrote:
>>> Hi Greg,
>>>
>>> On Fri, Sep 1, 2017 at 3:21 PM, Greg Ungerer <gregungerer@westnet.com.au> wrote:
>>>> On 01/09/17 17:49, Geert Uytterhoeven wrote:
>>>>> On Fri, Sep 1, 2017 at 12:38 AM, Angelo Dureghello <angelo@sysam.it>
>>>>> wrote:
>>>>>> did some additional study and tests.
>>>>>>
>>>>>> Actually i cannot find any simpler patch, i just adjusted it a
>>>>>> bit. I believe this patch will work on your cpu with 0-based
>>>>>> memoryas well.
>>>>>> I attach it for your comments.
>>>>>
>>>>>
>>>>> I think your issue is caused by arch/m68k/include/asm/page_offset.h:
>>>>>
>>>>>        #if defined(CONFIG_RAMBASE)
>>>>>        #define PAGE_OFFSET_RAW         CONFIG_RAMBASE
>>>>>        #elif defined(CONFIG_SUN3)
>>>>>        #define PAGE_OFFSET_RAW         0x0E000000
>>>>>        #else
>>>>>        #define PAGE_OFFSET_RAW         0x00000000
>>>>>        #endif
>>>>>
>>>>> and arch/m68k/Kconfig.machine:
>>>>>
>>>>> if !MMU || COLDFIRE
>>>>>
>>>>>        config RAMBASE
>>>>>                hex "Address of the base of RAM"
>>>>>                default "0"
>>>>>
>>>>> So on MC680[2346]0 with MMU (and ignoring Sun-3, which is special),
>>>>> PAGE_OFFSET == PAGE_OFFSET_RAW == 0.
>>>>>
>>>>> On Greg's zero-based Coldfire with MMU, CONFIG_RAMBASE is zero, and thus
>>>>> PAGE_OFFSET is also zero.
>>>>>
>>>>> On your board CONFIG_RAMBASE is non-zero, hence PAGE_OFFSET is also
>>>>> non-zero,
>>>>> and thus you have to compensate for that, cfr. your second patch.
>>>>>
>>>>> Does it work if you force PAGE_OFFSET_RAW to zero?
>>>>>
>>>>> If yes, we either need:
>>>>>
>>>>> --- a/arch/m68k/include/asm/page_offset.h
>>>>> +++ b/arch/m68k/include/asm/page_offset.h
>>>>> @@ -1,6 +1,6 @@
>>>>>     /* This handles the memory map.. */
>>>>>
>>>>> -#if defined(CONFIG_RAMBASE)
>>>>> +#if !defined(CONFIG_MMU)
>>>>>     #define PAGE_OFFSET_RAW                CONFIG_RAMBASE
>>>>>     #elif defined(CONFIG_SUN3)
>>>>>     #define PAGE_OFFSET_RAW                0x0E000000
>>>>>
>>
>> I tested this patch, (removed mine) and kernel hangs somewhere silently at
>> first init, i don't have the debug enabled now, but i suspect it still
>> hangs at some initial "memset" since 0 area for kernel should
>> be allocated before access.
>>
>> Isn't PAGE_OFFSET the starting area for the virtual kernel address space ?
>> At least so it seems to be for the famous 3G + 1G of x86.
> 
> Well, for the current working ColdFire with MMU that is the case.
> The kernel virtual addresses start at 0...
> 
> 
>> This is what i see at boot with my patch of yesterday:
>>
>> [    0.000000] Virtual kernel memory layout:
>> [    0.000000]     vector  : 0x40000000 - 0x40000400   (   1 KiB)
>> [    0.000000]     kmap    : 0xe0000000 - 0xf0000000   ( 256 MiB)
>> [    0.000000]     vmalloc : 0xd0000000 - 0xe0000000   ( 256 MiB)
>> [    0.000000]     lowmem  : 0x40000000 - 0x48000000   ( 128 MiB)
>> [    0.000000]       .init : 0x40196000 - 0x401d8000   ( 264 KiB)
>> [    0.000000]       .text : 0x40001000 - 0x40131e70   (1220 KiB)
>> [    0.000000]       .data : 0x40131e70 - 0x40193900   ( 391 KiB)
>> [    0.000000]       .bss  : 0x401d86d8 - 0x401ec680   (  80 KiB)
> 
> For whatever it is worth this is what I see now on my debug setup:
> 
> Virtual kernel memory layout:
>      vector  : 0x02000000 - 0x02000400   (   1 KiB)
>      kmap    : 0xe0000000 - 0xf0000000   ( 256 MiB)
>      vmalloc : 0xd0000000 - 0xe0000000   ( 256 MiB)
>      lowmem  : 0x02000000 - 0x04000000   (  32 MiB)
>        .init : 0x02288000 - 0x02296000   (  56 KiB)
>        .text : 0x02020000 - 0x0221f270   (2045 KiB)
>        .data : 0x0221f270 - 0x02284140   ( 404 KiB)
>        .bss  : 0x022967a0 - 0x022ae60c   (  96 KiB)
> 
> Regards
> Greg
> 
> 
> 
>>>>> or
>>>>>
>>>>> --- a/arch/m68k/Kconfig.machine
>>>>> +++ b/arch/m68k/Kconfig.machine
>>>>> @@ -325,6 +325,7 @@ comment "RAM configuration"
>>>>>
>>>>>     config RAMBASE
>>>>>            hex "Address of the base of RAM"
>>>>> +       depends on MMU
>>>>
>>>>
>>>> Did you mean "depends on !MMU" here?
>>>
>>> Sorry, yes, depends on !MMU.
>>>
>>>>> depending on whether anything else in the Coldfire code needs RAMBASE.
>>>>
>>>> There are a couple of places we depend on CONFIG_RAMBASE even
>>>> when running with the MMU enabled. Most importantly in setting
>>>> the cachable regions in arch/m68k/include/asm/m54xxacr.h.
>>>> So this is probably not going to work on its own.
>>>
>>> OK, as I already feared/expected...
>>>
>>>> But the first patch above should be ok. It should certainly work on
>>>> my 0 address base 5475 ColdFire setup. Angelo can you try that one?
>>>
>>> Right.
>>>
>>> Gr{oetje,eeting}s,
>>>
>>>                           Geert
>>>
>>> -- 
>>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>>>
>>> In personal conversations with technical people, I call myself a hacker. But
>>> when I'm talking to journalists I just say "programmer" or something like that.
>>>                                   -- Linus Torvalds
>>> -- 
>>> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>
>> Regards,
>> Angelo
>>
> 

Regards,
Angelo
