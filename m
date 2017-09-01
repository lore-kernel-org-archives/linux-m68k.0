From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: [PATCH] m68k: allow ColdFire m5441x parts to run with MMU enabled
Date: Sat, 2 Sep 2017 00:08:18 +0200
Message-ID: <72e95591-c47d-153c-693e-0bf7ad6bb535@sysam.it>
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
 <7544f20e-a999-cf50-74cf-b45513c6eed3@sysam.it>
 <8eedc7bb-db70-9ae3-2304-300591a8d2bb@sysam.it>
 <CAMuHMdWMrC7EMER0ifz+5RjPov3BOjhjAbVmWHDbTEHFcCOUbQ@mail.gmail.com>
 <bda55359-b4b8-1af7-52bc-d00ef1dd78c4@westnet.com.au>
 <CAMuHMdW-yih8Cm3TnXNHxpCOr-UnbT+NARTKiQS8zyaU3fWL+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:36549 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752400AbdIAWIU (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Fri, 1 Sep 2017 18:08:20 -0400
In-Reply-To: <CAMuHMdW-yih8Cm3TnXNHxpCOr-UnbT+NARTKiQS8zyaU3fWL+Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gregungerer@westnet.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Greg and Geert,

about my patch sent yesterday, unfortunately, i found btw
at least 1 issue: the busybox "cd" doesn't change directory :)

/ # cat /proc/vmallocinfo
0xd0006000-0xd000c000   24576 n_tty_open+0x16/0xae pages=2 vmalloc
/ # ls
bin    etc    lib    mnt    proc   sbin   usr
dev    home   media  opt    root   sys    var
/ # cd bin
/ # ls
bin    etc    lib    mnt    proc   sbin   usr
dev    home   media  opt    root   sys    var
/ # cat /proc/vm
vmallocinfo  vmstat
/ # cat /proc/vm
vmallocinfo  vmstat
/ # cat /proc/vmallocinfo
0xd0000000-0xd0006000   24576 unpurged vm_area
0xd0006000-0xd000c000   24576 n_tty_open+0x16/0xae pages=2 vmalloc

And after each "cd" attempt, another "unpurged" message is added.
Removing MMU cd works as expected.

On 01/09/2017 15:30, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Fri, Sep 1, 2017 at 3:21 PM, Greg Ungerer <gregungerer@westnet.com.au> wrote:
>> On 01/09/17 17:49, Geert Uytterhoeven wrote:
>>> On Fri, Sep 1, 2017 at 12:38 AM, Angelo Dureghello <angelo@sysam.it>
>>> wrote:
>>>> did some additional study and tests.
>>>>
>>>> Actually i cannot find any simpler patch, i just adjusted it a
>>>> bit. I believe this patch will work on your cpu with 0-based
>>>> memoryas well.
>>>> I attach it for your comments.
>>>
>>>
>>> I think your issue is caused by arch/m68k/include/asm/page_offset.h:
>>>
>>>       #if defined(CONFIG_RAMBASE)
>>>       #define PAGE_OFFSET_RAW         CONFIG_RAMBASE
>>>       #elif defined(CONFIG_SUN3)
>>>       #define PAGE_OFFSET_RAW         0x0E000000
>>>       #else
>>>       #define PAGE_OFFSET_RAW         0x00000000
>>>       #endif
>>>
>>> and arch/m68k/Kconfig.machine:
>>>
>>> if !MMU || COLDFIRE
>>>
>>>       config RAMBASE
>>>               hex "Address of the base of RAM"
>>>               default "0"
>>>
>>> So on MC680[2346]0 with MMU (and ignoring Sun-3, which is special),
>>> PAGE_OFFSET == PAGE_OFFSET_RAW == 0.
>>>
>>> On Greg's zero-based Coldfire with MMU, CONFIG_RAMBASE is zero, and thus
>>> PAGE_OFFSET is also zero.
>>>
>>> On your board CONFIG_RAMBASE is non-zero, hence PAGE_OFFSET is also
>>> non-zero,
>>> and thus you have to compensate for that, cfr. your second patch.
>>>
>>> Does it work if you force PAGE_OFFSET_RAW to zero?
>>>
>>> If yes, we either need:
>>>
>>> --- a/arch/m68k/include/asm/page_offset.h
>>> +++ b/arch/m68k/include/asm/page_offset.h
>>> @@ -1,6 +1,6 @@
>>>    /* This handles the memory map.. */
>>>
>>> -#if defined(CONFIG_RAMBASE)
>>> +#if !defined(CONFIG_MMU)
>>>    #define PAGE_OFFSET_RAW                CONFIG_RAMBASE
>>>    #elif defined(CONFIG_SUN3)
>>>    #define PAGE_OFFSET_RAW                0x0E000000
>>>

I tested this patch, (removed mine) and kernel hangs somewhere silently at
first init, i don't have the debug enabled now, but i suspect it still
hangs at some initial "memset" since 0 area for kernel should
be allocated before access.

Isn't PAGE_OFFSET the starting area for the virtual kernel address space ?
At least so it seems to be for the famous 3G + 1G of x86.


This is what i see at boot with my patch of yesterday:

[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0x40000000 - 0x40000400   (   1 KiB)
[    0.000000]     kmap    : 0xe0000000 - 0xf0000000   ( 256 MiB)
[    0.000000]     vmalloc : 0xd0000000 - 0xe0000000   ( 256 MiB)
[    0.000000]     lowmem  : 0x40000000 - 0x48000000   ( 128 MiB)
[    0.000000]       .init : 0x40196000 - 0x401d8000   ( 264 KiB)
[    0.000000]       .text : 0x40001000 - 0x40131e70   (1220 KiB)
[    0.000000]       .data : 0x40131e70 - 0x40193900   ( 391 KiB)
[    0.000000]       .bss  : 0x401d86d8 - 0x401ec680   (  80 KiB)





>>> or
>>>
>>> --- a/arch/m68k/Kconfig.machine
>>> +++ b/arch/m68k/Kconfig.machine
>>> @@ -325,6 +325,7 @@ comment "RAM configuration"
>>>
>>>    config RAMBASE
>>>           hex "Address of the base of RAM"
>>> +       depends on MMU
>>
>>
>> Did you mean "depends on !MMU" here?
> 
> Sorry, yes, depends on !MMU.
> 
>>> depending on whether anything else in the Coldfire code needs RAMBASE.
>>
>> There are a couple of places we depend on CONFIG_RAMBASE even
>> when running with the MMU enabled. Most importantly in setting
>> the cachable regions in arch/m68k/include/asm/m54xxacr.h.
>> So this is probably not going to work on its own.
> 
> OK, as I already feared/expected...
> 
>> But the first patch above should be ok. It should certainly work on
>> my 0 address base 5475 ColdFire setup. Angelo can you try that one?
> 
> Right.
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

Regards,
Angelo
