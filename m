From: schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH 1/2] m68k/atari - stram: alloc ST-RAM pool even if kernel
 not in ST-RAM
Date: Sat, 22 Mar 2014 14:32:58 +1300
Message-ID: <532CE84A.8090305@biophys.uni-duesseldorf.de>
References: <1395213784-3249-1-git-send-email-schmitz@debian.org>	<CAMuHMdXksY0Sfq-AN-1hi42=-yHYqgRnH0RM5z0k2oR-hPcOtQ@mail.gmail.com>	<532AA57E.70506@biophys.uni-duesseldorf.de> <CAMuHMdXOwhE9WU1QK2mjHbwwA4iaS1vsROPNgLwR0ggz9ruW9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:37868 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881AbaCVBdI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Mar 2014 21:33:08 -0400
Received: by mail-pa0-f42.google.com with SMTP id fb1so3112156pad.29
        for <linux-m68k@vger.kernel.org>; Fri, 21 Mar 2014 18:33:07 -0700 (PDT)
In-Reply-To: <CAMuHMdXOwhE9WU1QK2mjHbwwA4iaS1vsROPNgLwR0ggz9ruW9Q@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, Michael Schmitz <schmitz@debian.org>

Hi Geert
>
>>> That's not true. E.g. I/O memory is never mapped by mem_init().
>>>       
>> Why, then, does the ioremap() of ST-RAM fail? Because the physical address
>> is lower than the lowest currently mapped physical address?
>>     
>
> I don't know. How does it fail?
>   
Example:

Unable to handle kernel access at virtual address 5f435059
Oops: 00000000
Modules linked in:
PC: [<00089552>] kmem_cache_alloc+0x12/0x9a
SR: 2700  SP: 0029dec0  a2: 002a42d8
d0: 000080d0    d1: 00000013    d2: 000080d0    d3: 0007fe3c
d4: 00000001    d5: 000000d0    a0: 5f435055    a1: 002a75ee
Process swapper (pid: 0, task=002a42d8)
Frame format=4 fault addr=5f435059 fslw=01051000
Stack from 0029defc:
        000ff000 00080000 00216f06 00216f06 0007fe3c 00000000 000080d0 
000ff000
        00000000 00000001 00001000 00216f06 00080a6a 000ff000 00000001 
00000001
        00800000 d0000000 000000d0 00006bb4 00006bb4 000ff000 00000001 
04300601
        00000008 00216f06 002b9030 000b3ef4 00216f06 00216f06 002d55e0 
0029dfc8
        002d61cc 00001000 000ff000 00000001 000070dc 002d5bfc 00267189 
04300601
        002ec0ac 0012b010 002d4776 002eb0ae 00000000 00000000 00000000 
003bee10
Call Trace: [<000ff000>] keyctl_instantiate_key_iov+0x24/0xcc
 [<00080000>] vm_unmap_aliases+0x14/0x11a
 [<00216f06>] printk+0x0/0x24
 [<00216f06>] printk+0x0/0x24
 [<0007fe3c>] __get_vm_area_node.isra.33+0x5c/0x114
 [<000080d0>] atari_tt_hwclk+0x288/0x384
 [<000ff000>] keyctl_instantiate_key_iov+0x24/0xcc
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<00216f06>] printk+0x0/0x24
 [<00080a6a>] get_vm_area+0x30/0x38
 [<000ff000>] keyctl_instantiate_key_iov+0x24/0xcc
 [<00006bb4>] __ioremap+0x42/0x16a
 [<00006bb4>] __ioremap+0x42/0x16a
 [<000ff000>] keyctl_instantiate_key_iov+0x24/0xcc
 [<00216f06>] printk+0x0/0x24
 [<000b3ef4>] __block_write_begin+0x26c/0x41e
 [<00216f06>] printk+0x0/0x24
 [<00216f06>] printk+0x0/0x24
 [<002d55e0>] atari_parse_bootinfo+0x0/0x30
 [<002d61cc>] atari_stram_init+0xbc/0xfe
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<000ff000>] keyctl_instantiate_key_iov+0x24/0xcc
 [<000070dc>] hwreg_present+0x0/0x28
 [<002d5bfc>] config_atari+0x5ec/0x628
 [<0012b010>] strlcpy+0x0/0x64
 [<002d4776>] setup_arch+0x1ca/0x29c
 [<00216f06>] printk+0x0/0x24
 [<002d2da2>] start_kernel+0x6c/0x3ac
 [<000d3880>] devinfo_show+0x50/0x88
 [<002d2360>] _sinittext+0x360/0x9fa

Code: 3018 286f 0014 242f 0018 262f 0010 2054 <2228> 0004 2650 4a8b 6764 
202c 0014 2273 0800 40c0 007c 0700 2054 b7d0 6716 4281

I'll have to try that again with a fresh version that I can still 
correlate to a symbol map and object...

Cheers,

    Michael
