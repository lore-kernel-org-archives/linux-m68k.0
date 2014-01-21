From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: v3.13 panic in init_bootmem_core
Date: Tue, 21 Jan 2014 14:27:35 +0100
Message-ID: <87fvohihx4.fsf@igel.home>
References: <87sishiqmg.fsf@igel.home>
	<CAMuHMdUcGzFsnaxpLfvhEXyHc79c7e7Hd6RjmSFj1nk++zS00g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:36937 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754358AbaAUN1j (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 21 Jan 2014 08:27:39 -0500
In-Reply-To: <CAMuHMdUcGzFsnaxpLfvhEXyHc79c7e7Hd6RjmSFj1nk++zS00g@mail.gmail.com>
	(Geert Uytterhoeven's message of "Tue, 21 Jan 2014 11:27:36 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Andreas,
>
> On Tue, Jan 21, 2014 at 11:19 AM, Andreas Schwab <schwab@linux-m68k.org> wrote:
>> When trying to boot 3.13 with the attached .config in aranym I get a
>> panic during init_bootmem_core once I try to set FastRAM to anything
>> bigger than 256.  With 3.12 and pretty much the same config I could go
>> up to 932 while still having enough room in ST-RAM for the frame buffer.
>> The static kernel size only grew by about 45k.
>
> Can you please post the panic message?

There are actually two types of panics, one with CONFIG_KEXEC, the other
without it:

[    0.000000] Unable to handle kernel access at virtual address 00400000
[    0.000000] Oops: 00000000
[    0.000000] Modules linked in:
[    0.000000] PC: [<0016e6f6>] memset+0x5a/0x8c
[    0.000000] SR: 2708  SP: 0038becc  a2: 003922e0
[    0.000000] d0: 00002300    d1: ffffffff    d2: 00000117    d3: 00000000
[    0.000000] d4: 00012800    d5: 00000400    a0: 00400000    a1: 00400004
[    0.000000] Process swapper (pid: 0, task=003922e0)
[    0.000000] Frame format=7 eff addr=00400000 ssw=0405 faddr=00400000
[    0.000000] wb 1 stat/addr/data: 0000 00000000 00000000
[    0.000000] wb 2 stat/addr/data: 0000 00000000 00000000
[    0.000000] wb 3 stat/addr/data: 0085 00400000 ffffffff
[    0.000000] push data: 00000000 00000000 00000000 00000000
[    0.000000] Stack from 0038bf34:
        00001000 00002300 003e38da 00400000 000000ff 00002300 00000001 003ae8e0
        00001000 00012800 0038bfa0 003adac8 003e402a 003ddcf8 003f4ffe 00000400
        00001000 00012800 00000001 00000000 00000008 002d7014 00000000 003f90b0
        0016b060 003ddfc4 0038bfcc 00000000 00000000 00000000 003dd2c2 00000000
        00000000 00000000 00000000 00000000 002d7014 00000000 0038bff8 003dad74
        0038bff4 003391ff 002e0061 00000000 00000000 00000000 00000000 00000000
[    0.000000] Call Trace: [<00001000>] kernel_pg_dir+0x0/0x1000
[    0.000000]  [<00002300>] name_to_dev_t+0x60/0x39c
[    0.000000]  [<003e38da>] init_bootmem_core+0xa0/0xe6
[    0.000000]  [<00002300>] name_to_dev_t+0x60/0x39c
[    0.000000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[    0.000000]  [<00012800>] fpsp_snan+0xb8/0x20c
[    0.000000]  [<003e402a>] init_bootmem_node+0x0/0xe
[    0.000000]  [<003ddcf8>] paging_init+0x172/0x29a
[    0.000000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[    0.000000]  [<00012800>] fpsp_snan+0xb8/0x20c
[    0.000000]  [<002d7014>] printk+0x0/0x24
[    0.000000]  [<0016b060>] strlcpy+0x0/0x66
[    0.000000]  [<003ddfc4>] atari_parse_bootinfo+0x0/0x2e
[    0.000000]  [<003dd2c2>] setup_arch+0x188/0x24c
[    0.000000]  [<002d7014>] printk+0x0/0x24
[    0.000000]  [<003dad74>] start_kernel+0x72/0x39e
[    0.000000]  [<003da31e>] _sinittext+0x31e/0x9c0
[    0.000000] 
[    0.000000] Code: 2602 0243 0007 e68a 4443 4efb 3212 22c1 <22c1> 22c1 22c1 22c1 22c1 22c1 22c1 51ca ffee 4242 5382 6ae6 0800 0001 6702 32c1


[    0.000000] bootmem alloc of 4096 bytes failed!
[    0.000000] Kernel panic - not syncing: Out of memory
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 3.13.0 #6
[    0.000000] Stack from 00389efc:
        00389efc 0034a53d 002d53a4 00c00000 00c00439 00000439 00e00000 000012c0
        003dfd2e 003f5000 003dfd66 0033e184 003400de 00001000 003d9968 00001000
        00001000 00000000 00000000 003ad0b0 00001000 00012800 00000000 00000000
        00389fa0 00e00000 003d97b8 003dfa36 003d9c02 00000000 003abf40 003fd300
        00002d00 00000000 00000008 002d5890 00000000 003f40b0 00169928 003d9e78
        00389fcc 00000000 00000000 00000000 003d9248 00000000 00000000 00000000
[    0.000000] Call Trace: [<002d53a4>] panic+0x70/0x1ae
[    0.000000]  [<000012c0>] kernel_pg_dir+0x2c0/0x1000
[    0.000000]  [<003dfd2e>] __alloc_bootmem_low+0x0/0x3a
[    0.000000]  [<003dfd66>] __alloc_bootmem_low+0x38/0x3a
[    0.000000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[    0.000000]  [<003d9968>] map_node+0x1b0/0x282
[    0.000000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[    0.000000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[    0.000000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[    0.000000]  [<00012800>] store+0x2c/0x98
[    0.000000]  [<003d97b8>] map_node+0x0/0x282
[    0.000000]  [<003dfa36>] free_bootmem_node+0x0/0x34
[    0.000000]  [<003d9c02>] paging_init+0x1c8/0x29a
[    0.000000]  [<00002d00>] apply_relocate+0x98/0xca
[    0.000000]  [<002d5890>] printk+0x0/0x24
[    0.000000]  [<00169928>] strlcpy+0x0/0x66
[    0.000000]  [<003d9e78>] atari_parse_bootinfo+0x0/0x2e
[    0.000000]  [<003d9248>] setup_arch+0x17a/0x23e
[    0.000000]  [<002d5890>] printk+0x0/0x24
[    0.000000]  [<003d6d74>] start_kernel+0x72/0x39e
[    0.000000]  [<003d631e>] _sinittext+0x31e/0x9c0
[    0.000000] 

> At first sight, I don't see a relevant difference with the .config I'm using.
> Did the kernel size grow above 4 MiB? If not, can you please bisect?

The size is 4089118 vs. 4135192, so still below 4M, though already
pretty close.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
