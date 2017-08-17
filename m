From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: [PATCH] m68k: allow ColdFire m5441x parts to run with MMU enabled
Date: Thu, 17 Aug 2017 17:02:53 +0200
Message-ID: <f7d80fbd-3b99-66c5-38f5-592780703f96@sysam.it>
References: <bc3dc168-aaae-1271-b73b-4d649db5e301@sysam.it>
 <d1ce1669-0286-ebad-7c6c-e9dfe37c266c@sysam.it>
 <30318b18-e955-1615-975e-9b378d3201b8@westnet.com.au>
 <c095233b-15fc-53f7-c21d-a6c805711040@sysam.it>
 <0e1723eb-0724-7007-5b63-7d80112268a2@westnet.com.au>
 <d4e220c9-f607-cf9a-2e63-910e745dbea9@sysam.it>
 <c5dfd7b3-3266-1ecd-1dbf-e66bd9f5aa32@westnet.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:33112 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751637AbdHQPC4 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Thu, 17 Aug 2017 11:02:56 -0400
In-Reply-To: <c5dfd7b3-3266-1ecd-1dbf-e66bd9f5aa32@westnet.com.au>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gregungerer@westnet.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Greg,

On 14/08/2017 06:16, Greg Ungerer wrote:
> Hi Angelo,
> 
> On 12/08/17 21:17, Angelo Dureghello wrote:
>> On 10/08/2017 09:06, Greg Ungerer wrote:
>>> On 10/08/17 01:32, Angelo Dureghello wrote:
>>> [snip]
>>>> sure, on this board  http://sysam.it/cff_stmark2.html
>>>> there are 128MB of ddr2.
>>>>
>>>> External SDRAM is accessible, at least without any mmc support enabled,
>>>> from 0x40000000.
>>>>
>>>> I have following test config:
>>>>
>>>>     GNU nano 2.8.6                                                                              File: arch/m68k/configs/stmark2_defconfig
>>>>
>>>> CONFIG_LOCALVERSION="stmark2-001"
>>> [snip]
>>>>
>>>>
>>>> I tried still yesterday a bit, but seems there is no much support for
>>>> earlyprintk / low level debug for this architecture.
>>>>
>>>> In case i can try with a gpio toggling routine, at least to find
>>>> where kernel stops.
>>>
>>> The attached patch, is a quick and dirty early console output method.
>>> It works for me on the m5475, should work for you "as is" on the 5441x too.
>>>
>>> It is kind of an early printk. Of course it still needs the early
>>> kernel boot to have succeeded before you will get anything much coming out.
>>> But it is worth trying.
>>
>> Ok many thanks. Btw i used a __square(); function written in asm, so i am
>> sure i see the gpio toggling in very early stages.
>>
>>>
>>> I am wondering if the non-0 base RAM may be a problem. I have only run
>>> the MMU enabled code on platforms with 0 based RAM so far. But lets see if
>>> the early console trace attached gives us anything before digging into that.
>>>
>>
>> This MCU has sdram area physically mapped at 0x4000 0000 so U-Boot, to be
>> able to execute the kernel must load it to that location/area anyway.
>>
>> But i have seen that it is not a problem, after MMU is enabled in head.S
>> the jump
>>                  movel   #_vstart,%a0      /* jump to "virtual" space */
>>          jmp     %a0@
>>
>> works fine. Since that range is not hitting anything that is maintained
>> physical, it can be translated into virtual without any issue.
> 
> Yeah, it is not so much the initial start up that I think will
> be the problem. More the setup of the MMU mapping tables later
> in boot.
> 
> 
>> After some hard debug, i see the execution stops at:
>>
>> asmlinkage __visible void __init start_kernel(void)
>>     ...
>>     setup_arch(&command_line);      setup_mm.c
>>        ...
>>        paging_init();               mm/mcfmmu.c
>>           ...
>>           empty_zero_page = (void *) alloc_bootmem_pages(PAGE_SIZE);
>>           ^line 47 mcfmmu.c
>>
>> Inside alloc_bootmem_pages(), execution seems to end up finally to
>> mm/bootmem.c and likely to alloc_bootmem_bdata().
>> In case i can still proceed to find the exact place where execution stops,
>> but i suspect in the while(1), line 545.
>>
>> As a curious thing, i find in a different cf CPU code "m54xx.c"
>> the following:
>>
>> void __init config_BSP(char *commandp, int size)
>> {
>> #ifdef CONFIG_MMU
>>      cf_bootmem_alloc();
>>      mmu_context_init();
>> #endif
>>      
>> Do also m5441x.c maybe need this calls ?
> 
> Yes, you will need this. So that code above is only getting run when
> configured for a 547x CPU family. Attached is a rework of that code
> so that it will be run for all ColdFire MMU varients. Can you try
> that out?
> 
> 
>> Would be very nice to have MMU working. Strangely, i don't see any
>> board_config with it enabled. Was it ever tested on some Coldfire ?
> 
> Oh, yeah, I run this on a real M5475 EVB board for every kernel
> mainline release, with and without MMU enabled. See the
> arch/m68k/configs/m5475evb_defconfig, it will default to having
> the MMU enabled.
> 
> I have todays linux-4.13-rc5 running on it here now:
> 
> # cat /proc/version
> Linux version 4.13.0-rc5-00001-gb014090-dirty (gerg@goober) (gcc version 5.4.0 (GCC)) #1 Mon Aug 14 10:14:12 AEST 2017
> 
> # cat /proc/cpuinfo
> CPU:            ColdFire
> MMU:            ColdFire
> FPU:            ColdFire
> Clocking:       264.1MHz
> BogoMips:       264.19
> Calibration:    1320960 loops
> #
> 
> Regards
> Greg

Ok, i applied your patch, and still the kernel is hanging silently,
so i started up a new debug session again.

What is actually happening (after your patch has been applied) is:

setup_arch()                arch/m68k/kernel/setup_mm.c
  paging_init()
memmap_init()               mm/page_alloc.c
memmap_init_zone()
  __init_single_page()
      set_page_links()       include/linux/mm.h
         set_page_zone()
           kernel hangs silently on this line
           page->flags &= ~(ZONES_MASK << ZONES_PGSHIFT);

> 

I am wondering how mmu works, so at the moment mmu is enabled,
in head.S, i would expect that code compiled for 0x40001000 would
not run, since jumps would be translated to some different physical
addresses, but execution sill works.
At the same, after enabling mmu i would expect .data vars to be
invalid, since their address would be translated to a different
location, while not, the init values of .data variables are still
valid. In case, i am interested to understand this points.


Regards,
Angelo
