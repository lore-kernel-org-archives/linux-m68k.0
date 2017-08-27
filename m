From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: [PATCH] m68k: allow ColdFire m5441x parts to run with MMU enabled
Date: Sun, 27 Aug 2017 02:31:21 +0200
Message-ID: <7544f20e-a999-cf50-74cf-b45513c6eed3@sysam.it>
References: <bc3dc168-aaae-1271-b73b-4d649db5e301@sysam.it>
 <d1ce1669-0286-ebad-7c6c-e9dfe37c266c@sysam.it>
 <30318b18-e955-1615-975e-9b378d3201b8@westnet.com.au>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:35192 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751121AbdH0AbY (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Sat, 26 Aug 2017 20:31:24 -0400
In-Reply-To: <f0fad6b5-96a9-6025-1fd3-7a1a0b6679d4@westnet.com.au>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gregungerer@westnet.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Greg,

sorry for the late reply,
i decided to study inside the mmu code, working on a separate branch,
and after a long hard fight i have the prompt.

So good news, seems i probably have mmu working. See below for
further details.

On 23/08/2017 09:06, Greg Ungerer wrote:
> Hi Angelo,
> 
> On 22/08/17 10:35, Angelo Dureghello wrote:
>> On 21/08/2017 09:15, Greg Ungerer wrote:
>>> On 20/08/17 23:26, Angelo Dureghello wrote:
>>>> On 20/08/2017 14:44, Greg Ungerer wrote:
>>>>> On 18/08/17 01:02, Angelo Dureghello wrote:
>>>>>> On 14/08/2017 06:16, Greg Ungerer wrote:
>>>>>>> On 12/08/17 21:17, Angelo Dureghello wrote:
>>>>>>>> On 10/08/2017 09:06, Greg Ungerer wrote:
>>>>>>>>> On 10/08/17 01:32, Angelo Dureghello wrote:
>>>>>>>>> [snip]
>>>>>>>>>> sure, on this board  http://sysam.it/cff_stmark2.html
>>>>>>>>>> there are 128MB of ddr2.
>>>>>>>>>>
>>>>>>>>>> External SDRAM is accessible, at least without any mmc support enabled,
>>>>>>>>>> from 0x40000000.
>>>>>>>>>>
>>>>>>>>>> I have following test config:
>>>>>>>>>>
>>>>>>>>>>       GNU nano 2.8.6 File: arch/m68k/configs/stmark2_defconfig
>>>>>>>>>>
>>>>>>>>>> CONFIG_LOCALVERSION="stmark2-001"
>>>>>>>>> [snip]
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> I tried still yesterday a bit, but seems there is no much support for
>>>>>>>>>> earlyprintk / low level debug for this architecture.
>>>>>>>>>>
>>>>>>>>>> In case i can try with a gpio toggling routine, at least to find
>>>>>>>>>> where kernel stops.
>>>>>>>>>
>>>>>>>>> The attached patch, is a quick and dirty early console output method.
>>>>>>>>> It works for me on the m5475, should work for you "as is" on the 5441x too.
>>>>>>>>>
>>>>>>>>> It is kind of an early printk. Of course it still needs the early
>>>>>>>>> kernel boot to have succeeded before you will get anything much coming out.
>>>>>>>>> But it is worth trying.
>>>>>>>>
>>>>>>>> Ok many thanks. Btw i used a __square(); function written in asm, so i am
>>>>>>>> sure i see the gpio toggling in very early stages.
>>>>>>>>
>>>>>>>>>
>>>>>>>>> I am wondering if the non-0 base RAM may be a problem. I have only run
>>>>>>>>> the MMU enabled code on platforms with 0 based RAM so far. But lets see if
>>>>>>>>> the early console trace attached gives us anything before digging into that.
>>>>>>>>>
>>>>>>>>
>>>>>>>> This MCU has sdram area physically mapped at 0x4000 0000 so U-Boot, to be
>>>>>>>> able to execute the kernel must load it to that location/area anyway.
>>>>>>>>
>>>>>>>> But i have seen that it is not a problem, after MMU is enabled in head.S
>>>>>>>> the jump
>>>>>>>>                    movel   #_vstart,%a0      /* jump to "virtual" space */
>>>>>>>>            jmp     %a0@
>>>>>>>>
>>>>>>>> works fine. Since that range is not hitting anything that is maintained
>>>>>>>> physical, it can be translated into virtual without any issue.
>>>>>>>
>>>>>>> Yeah, it is not so much the initial start up that I think will
>>>>>>> be the problem. More the setup of the MMU mapping tables later
>>>>>>> in boot.
>>>>>>>
>>>>>>>
>>>>>>>> After some hard debug, i see the execution stops at:
>>>>>>>>
>>>>>>>> asmlinkage __visible void __init start_kernel(void)
>>>>>>>>       ...
>>>>>>>>       setup_arch(&command_line);      setup_mm.c
>>>>>>>>          ...
>>>>>>>>          paging_init();               mm/mcfmmu.c
>>>>>>>>             ...
>>>>>>>>             empty_zero_page = (void *) alloc_bootmem_pages(PAGE_SIZE);
>>>>>>>>             ^line 47 mcfmmu.c
>>>>>>>>
>>>>>>>> Inside alloc_bootmem_pages(), execution seems to end up finally to
>>>>>>>> mm/bootmem.c and likely to alloc_bootmem_bdata().
>>>>>>>> In case i can still proceed to find the exact place where execution stops,
>>>>>>>> but i suspect in the while(1), line 545.
>>>>>>>>
>>>>>>>> As a curious thing, i find in a different cf CPU code "m54xx.c"
>>>>>>>> the following:
>>>>>>>>
>>>>>>>> void __init config_BSP(char *commandp, int size)
>>>>>>>> {
>>>>>>>> #ifdef CONFIG_MMU
>>>>>>>>        cf_bootmem_alloc();
>>>>>>>>        mmu_context_init();
>>>>>>>> #endif
>>>>>>>> Do also m5441x.c maybe need this calls ?
>>>>>>>
>>>>>>> Yes, you will need this. So that code above is only getting run when
>>>>>>> configured for a 547x CPU family. Attached is a rework of that code
>>>>>>> so that it will be run for all ColdFire MMU varients. Can you try
>>>>>>> that out?
>>>>>>>
>>>>>>>
>>>>>>>> Would be very nice to have MMU working. Strangely, i don't see any
>>>>>>>> board_config with it enabled. Was it ever tested on some Coldfire ?
>>>>>>>
>>>>>>> Oh, yeah, I run this on a real M5475 EVB board for every kernel
>>>>>>> mainline release, with and without MMU enabled. See the
>>>>>>> arch/m68k/configs/m5475evb_defconfig, it will default to having
>>>>>>> the MMU enabled.
>>>>>>>
>>>>>>> I have todays linux-4.13-rc5 running on it here now:
>>>>>>>
>>>>>>> # cat /proc/version
>>>>>>> Linux version 4.13.0-rc5-00001-gb014090-dirty (gerg@goober) (gcc version 5.4.0 (GCC)) #1 Mon Aug 14 10:14:12 AEST 2017
>>>>>>>
>>>>>>> # cat /proc/cpuinfo
>>>>>>> CPU:            ColdFire
>>>>>>> MMU:            ColdFire
>>>>>>> FPU:            ColdFire
>>>>>>> Clocking:       264.1MHz
>>>>>>> BogoMips:       264.19
>>>>>>> Calibration:    1320960 loops
>>>>>>> #
>>>>>>>
>>>>>>> Regards
>>>>>>> Greg
>>>>>>
>>>>>> Ok, i applied your patch, and still the kernel is hanging silently,
>>>>>> so i started up a new debug session again.
>>>>>>
>>>>>> What is actually happening (after your patch has been applied) is:
>>>>>>
>>>>>> setup_arch()                arch/m68k/kernel/setup_mm.c
>>>>>>     paging_init()
>>>>>> memmap_init()               mm/page_alloc.c
>>>>>> memmap_init_zone()
>>>>>>     __init_single_page()
>>>>>>         set_page_links()       include/linux/mm.h
>>>>>>            set_page_zone()
>>>>>>              kernel hangs silently on this line
>>>>>>              page->flags &= ~(ZONES_MASK << ZONES_PGSHIFT);
>>>>>>
>>>>>>>
>>>>>>
>>>
>>> Can you run your current code with the console debug code I sent
>>> a little while back?
>>>
>>> I ask because I suspect it should give something based on your debug
>>> above. I played around a little trying to fake out my configuration
>>> to make it look like the RAM was non-zero based. I couldn't get a fail,
>>> but I would like to add some more debug to see what is going on with
>>> the page pointers from your debug.
>>>
>>> Can you apply the attached patch and get any extra debug?
>>>
>>>
>>>>>> I am wondering how mmu works, so at the moment mmu is enabled,
>>>>>> in head.S, i would expect that code compiled for 0x40001000 would
>>>>>> not run, since jumps would be translated to some different physical
>>>>>> addresses, but execution sill works.
>>>>>> At the same, after enabling mmu i would expect .data vars to be
>>>>>> invalid, since their address would be translated to a different
>>>>>> location, while not, the init values of .data variables are still
>>>>>> valid. In case, i am interested to understand this points.
>>>>>
>>>>> On the ColdFire the kernel relies on all RAM and IO peripheral
>>>>> addresses) to "hit" the ACR registers - and essentially be passed
>>>>> through as an identity physical = virtual mapping. If you look at
>>>>> the operation of the memory address translation when virtual mode
>>>>> is enabled (in the ColdFire MMU sections of the 5475 and 54411
>>>>> reference manual) you will see that addresses are checked in order
>>>>> to be for the MMUBAR, RAMBAR, ACR, then MMU.
>>>>>
>>>>> For example a kernel address when in supervisor mode will hit
>>>>> ACR1 or ACR3 the way we set them up in arch/m68k/coldfire/head.S.
>>>>> And that is why you see kernel code and data still being valid after
>>>>> the MMU is enabled in virtual mode. No TLB entries required for this.
>>>>>
>>>>> Looking at your call sequence above I can see that the physical
>>>>> RAM start address being non-zero is going to come into play. I'll
>>>>> dig into this a little more tomorrow see if I can figure out what
>>>>> is going on.
>>>>>
>>>>
>>>> Thanks for the kind clarifications.
>>>>
>>>> I'll look in this things too in next days, learning is always nice.
>>>> Btw, about load/entry address, i have noticed a possible basic
>>>> difference betweeen mcf5441x and mcf547x series:
>>>>
>>>> The second one (your cpu) is v4e and probably more recent i guess, and
>>>> one major difference from datasheet seems to be that it is Harvard.
>>>> So probably, for this reason, you can address ram from 0 there.
>>>
>>> IIRC the 5475 was the first ColdFire with MMU, it is pretty old. Pretty
>>> sure the 54411 came later. Not sure what the thinking was on the different
>>> default memory layout though.
>>>
>>
>> Finally, cleaning out my debug lines, i found i removed an important line.
>> So i am back to original "second" error we was trying to understand.
>>
>>
>> So current more clear status is:
>>
>> U-Boot 2017.09-rc2-00151-g2d7cb5b426-dirty (Aug 22 2017 - 00:22:46 +0200)
>>
>> CPU:   Freescale MCF54410 (Mask:9f Version:2)
>>         CPU CLK 240 MHz BUS CLK 120 MHz FLB CLK 60 MHz
>>         INP CLK 30 MHz VCO CLK 480 MHz
>> SPI:   ready
>> DRAM:  128 MiB
>> SF: Detected is25lp128 with page size 256 Bytes, erase size 64 KiB, total 16 MiB
>> In:    serial
>> Out:   serial
>> Err:   serial
>> Hit any key to stop autoboot:  0
>> SF: Detected is25lp128 with page size 256 Bytes, erase size 64 KiB, total 16 MiB
>> device 0 offset 0x100000, size 0x1d9728
>> SF: 1939240 bytes @ 0x100000 Read: OK
>> ## Booting kernel from Legacy Image at 40001000 ...
>>     Image Name:   mainline kernel
>>     Created:      2017-08-22   0:07:25 UTC
>>     Image Type:   M68K Linux Kernel Image (uncompressed)
>>     Data Size:    1939176 Bytes = 1.8 MiB
>>     Load Address: 40001000
>>     Entry Point:  40001000
>>     Verifying Checksum ... OK
>>     Loading Kernel Image ... OK
>> Linux version 4.12.0stmark2-001-11691-g571d81b2b55f-dirty (angelo@jerusalem) (gcc version 4.9.0 (crosstools-sysam-2016.04.16)) #182 Tue Aug 22 02:07:24 CEST 2017
>> ------------[ cut here ]------------
>> WARNING: CPU: 0 PID: 0 at mm/page_alloc.c:6219 free_area_init_node+0x2f4/0x2fa
>> CPU: 0 PID: 0 Comm: swapper Not tainted 4.12.0stmark2-001-11691-g571d81b2b55f-dirty #182
>> Stack from 4017deec:
>>
>>          4017deec
>>   4017b3dd
>>   40007972
>>   00000000
>>   00000000
>>   47d9f62c
>>   00020000
>>   00000000
>>
>>          00000000
>>   4017df9c
>>   40007a14
>>   4016dd8e
>>   0000184b
>>   4019caca
>>   00000009
>>   00000000
>>
>>          00000000
>>   4019caca
>>   4016dd8e
>>   0000184b
>>   48000000
>>   40204000
>>   47d9f62c
>>   40001000
>>
>>          00000000
>>   47d9ef1c
>>   40001480
>>   4013010c
>>   4012cd16
>>   4017dfa8
>>   4019ecc0
>>   00012000
>>
>>          00002000
>>   4019ccb4
>>   00000000
>>   4017df9c
>>   00020000
>>   00000000
>>   4019a3f2
>>   4017df9c
>>
>>          00000001
>>   401da8c0
>>   401da774
>>   4019ebc8
>>   00004000
>>   00000000
>>   00000000
>>   4017dfc8
>>
>> Call Trace:
>>   [<40007972>] __warn+0xa4/0xc0
>>   [<40007a14>] warn_slowpath_null+0x1a/0x22
>>   [<4019caca>] free_area_init_node+0x2f4/0x2fa
>>   [<4019caca>] free_area_init_node+0x2f4/0x2fa
>>   [<40001000>] kernel_pg_dir+0x0/0x1000
>>   [<40001480>] kernel_pg_dir+0x480/0x1000
>>   [<4013010c>] memset+0x0/0x80
>>   [<4012cd16>] strlen+0x0/0x14
>>   [<4019ecc0>] __alloc_bootmem+0x16/0x3c
>>   [<4019ccb4>] free_area_init+0x20/0x26
>>   [<4019a3f2>] paging_init+0xee/0xfa
>>   [<4019ebc8>] free_bootmem_node+0x0/0x34
>>   [<40199fbc>] setup_arch+0xcc/0x16e
>>   [<40024eb2>] printk+0x0/0x18
>>   [<4019ecaa>] __alloc_bootmem+0x0/0x3c
>>   [<40198550>] start_kernel+0x68/0x3ae
>>   [<40001000>] kernel_pg_dir+0x0/0x1000
>>   [<400020f2>] _exit+0x0/0x6
>>
>> ---[ end trace 0000000000000000 ]---
>> On node 0 totalpages: 16384
>> free_area_init_node: node 0, pgdat 401da8c0, node_mem_map a8c0401d
>>    DMA zone: 72 pages used for memmap
>>    DMA zone: 0 pages reserved
>>    DMA zone: 16384 pages, LIFO batch:3
>> /page_alloc.c(1171): page=a8c0401d pfn=131072
> 
> Another patch attached that digs a little deeper into why that page
> pointer ends up being invalid. If you could run with this and send
> the output that would be great.
> 
First of all, this is the trace you required me:

mm/page_alloc.c(1171): page=a8d0401d pfn=131072
mm/page_alloc.c(1172): __va(pfn=131072)=00020000
mm/page_alloc.c(1173): pfn_to_virt(pfn=131072)=40000000
mm/page_alloc.c(1174): __virt_to_node(pfn_to_virt(pfn=131072))=401da8d0
mm/page_alloc.c(1175): pg_data_map[0].node_start_pfn=131072
mm/page_alloc.c(1176): pg_data_map[0].node_present_pages=16384

---------------------------------------------------------------------------------

Mainly, as you have suspected initially, the issue is related the
the _rambase that has to be 0x40000000 for mcf5441x.

Initially i tried by the m68k_fixup, setting an offset of 0x40000000,
with something like

m68k_memoffset = 0x40000000;

but kernel in itial stages seems to need to access memory with logical
addresses to be the same as physical, or it hangs at first memset.

So i just found the way to fix the issue tuning the node related pg_data
pointer table, it is:

pg_data_t *pg_data_table[65];  

This table was accessed at pg_data_table[0x200] for the first node, so the
boot was crashing for an out of bounds.
So, since the slot calculation is done by the logical address, i subtracted
there the _rambase (0x40000000) and the table is accessed properly now.

Linux version 4.12.0stmark2-001-11692-gc54cfe5cf339-dirty (angelo@jerusalem) (gcc version 5.2.0 (crosstools-sysam-2016.04.16)) #29 Sun Aug 27 02:18:49 CEST 2017
On node 0 totalpages: 16384
free_area_init_node: node 0, pgdat 401d88b0, node_mem_map 40204000
   DMA zone: 72 pages used for memmap
   DMA zone: 0 pages reserved
   DMA zone: 16384 pages, LIFO batch:3
pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768

pcpu-alloc:
[0]
0

Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16312
Kernel command line: console=ttyS0,115200 root=/dev/ram0 rw rootfstype=ramfs rdinit=/bin/init devtmpfs.mount=1
PID hash table entries: 512 (order: -2, 2048 bytes)
Dentry cache hash table entries: 16384 (order: 3, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 2, 32768 bytes)
Sorting __ex_table...
PID hash table entries: 512 (order: -2, 2048 bytes)
Dentry cache hash table entries: 16384 (order: 3, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 2, 32768 bytes)
Sorting __ex_table...
Memory: 128288K/131072K available (1219K kernel code, 103K rwdata, 288K rodata, 264K init, 79K bss, 2784K reserved, 0K cma-reserved)
Virtual kernel memory layout:
vector  : 0x40000000 - 0x40000400   (   1 KiB)
kmap    : 0xe0000000 - 0xf0000000   ( 256 MiB)
vmalloc : 0xd0000000 - 0xe0000000   ( 256 MiB)
lowmem  : 0x40000000 - 0x48000000   ( 128 MiB)
   .init : 0x40196000 - 0x401d8000   ( 264 KiB)
   .text : 0x40001000 - 0x40131d50   (1220 KiB)
   .data : 0x40131d50 - 0x40193a00   ( 392 KiB)
   .bss  : 0x401d86e0 - 0x401ec674   (  80 KiB)
...

/ # cat /proc/meminfo
MemTotal:         128552 kB
MemFree:          124336 kB
MemAvailable:     122728 kB
Buffers:               0 kB
Cached:             1264 kB
SwapCached:            0 kB
Active:             1440 kB
Inactive:            888 kB
Active(anon):       1064 kB
Inactive(anon):      216 kB
Active(file):        376 kB
Inactive(file):      672 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:          1080 kB
Mapped:              216 kB
Shmem:               216 kB
Slab:                  0 kB
SReclaimable:          0 kB
SUnreclaim:            0 kB
KernelStack:         144 kB
PageTables:          208 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:       64272 kB
Committed_AS:       1680 kB
VmallocTotal:     262144 kB
VmallocUsed:           0 kB
VmallocChunk:          0 kB



So for now i solved in this way:

diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index e7a1946455a8..4f3cb6218b8a 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -142,7 +142,9 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
         return shift;
  }
  
-#define __virt_to_node(addr)   (pg_data_table[(unsigned long)(addr) >> __virt_to_node_shift()])
+#define __virt_to_node(addr) \
+       pg_data_table[((unsigned long)(addr) - _rambase) \
+       >> __virt_to_node_shift()]
  #endif
  
  #define virt_to_page(addr) ({                                          \
diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index a6ffead9bef5..61df1a1c8986 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -61,15 +61,24 @@ void __init m68k_setup_node(int node)
  #ifndef CONFIG_SINGLE_MEMORY_CHUNK
         struct m68k_mem_info *info = m68k_memory + node;
         int i, end;
+       unsigned long addr_relative = info->addr - _rambase;
  
-       i = (unsigned long)phys_to_virt(info->addr) >> __virt_to_node_shift();
-       end = (unsigned long)phys_to_virt(info->addr + info->size - 1) >> __virt_to_node_shift();
+       i = (unsigned long)phys_to_virt(addr_relative) >> __virt_to_node_shift();
+       end = (unsigned long)phys_to_virt(addr_relative + info->size - 1) >> __virt_to_node_shift();
         for (; i <= end; i++) {
                 if (pg_data_table[i])
                         pr_warn("overlap at %u for chunk %u\n", i, node);
                 pg_data_table[i] = pg_data_map + node;
         }
  #endif
+       /*
+        * alloc_node_mem_map() in mm/page_alloc.c will setup
+        * node_mem_map member only if it is set to 0,
+        * otherwise it is considered already set properly
+        * before (i.e. as per ia64).
+        * So we need to zero node data here.
+        */
+       memset(NODE_DATA(node), 0, sizeof(pg_data_t));
         pg_data_map[node].bdata = bootmem_node_data + node;
         node_set_online(node);
  }
diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index c7efdf8e8eae..79af9a478f35 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -176,6 +176,8 @@ void __init cf_bootmem_alloc(void)
         m68k_memory[0].addr = _rambase;
         m68k_memory[0].size = _ramend - _rambase;
  
+       m68k_memoffset = m68k_memory[0].addr - PAGE_OFFSET;
+
         /* compute total pages in system */
         num_pages = PFN_DOWN(_ramend - _rambase);
  
(m68k_memoffset = m68k_memory[0].addr - PAGE_OFFSET;) is there but not needed
i guess so i would remove it.

This is not probably the best patch, let me know how do we proceed.

> Regards
> Greg
> 
> 
Regards,
Angelo
