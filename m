From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: _ebss == _edata if MMU
Date: Wed, 18 Apr 2012 22:38:48 +1000
Message-ID: <4F8EB5D8.7010500@snapgear.com>
References: <CAMuHMdXefcfjetrLAtnsqONRT1WefEFU3Ztv0=2itP+sjGJDrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:52995 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752021Ab2DRMjN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 18 Apr 2012 08:39:13 -0400
In-Reply-To: <CAMuHMdXefcfjetrLAtnsqONRT1WefEFU3Ztv0=2itP+sjGJDrg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

On 04/18/2012 05:55 PM, Geert Uytterhoeven wrote:
> On ARAnyM:
>
> Virtual kernel memory layout:
>      vector  : 0x002f4d10 - 0x002f5110   (   1 KiB)
>      kmap    : 0xd0000000 - 0xf0000000   ( 512 MiB)
>      vmalloc : 0x11800000 - 0xd0000000   (3048 MiB)
>      lowmem  : 0x00000000 - 0x11000000   ( 272 MiB)
>        .init : 0x00319000 - 0x0033c000   ( 140 KiB)
>        .text : 0x00001000 - 0x002487b8   (2334 KiB)
>        .data : 0x0024b540 - 0x00318a40   ( 822 KiB)
>        .bss  : 0x002f4ae0 - 0x00318a40   ( 144 KiB)
>
> End of data and end of bss are identical, as arch/m68k/kernel/vmlinux-std.lds
> says bss is a subset of data:
>
>    _sdata = .;                   /* Start of data section */
>
>    RODATA
>
>    RW_DATA_SECTION(16, PAGE_SIZE, THREAD_SIZE)
>
>    _sbss = .;
>    BSS_SECTION(0, 0, 0)
>    _ebss = .;
>
>    _edata = .;                   /* End of data section */
>
> On !MMU, bss is not embedded in data.

I noticed the same ending of .data and .bss when I put that memory
table print out code in :-)  I didn't want to change the linker
script just to make it seem more logical.

But now that you have bought it up... It seems a quick check of ARM
and x86 have _edata really at the end of the .data, and the .bss is
separate. Should we change it to be consistent with other arches?

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
