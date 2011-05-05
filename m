From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table
Date: Thu, 5 May 2011 17:55:14 +1000
Message-ID: <4DC257E2.3030704__20048.8201379359$1304582492$gmane$org@snapgear.com>
References: <alpine.DEB.2.00.1105042033190.9040@ayla.of.borg> <201105050824.34056.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <201105050824.34056.arnd@arndb.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, uClinux list <uclinux-dev@uclinux.org>

Hi Arnd,

On 05/05/11 16:24, Arnd Bergmann wrote:
> On Wednesday 04 May 2011, Geert Uytterhoeven wrote:
>> Impact for nommu:
>>    - Store table in .rodata instead of .text,
>>    - Let kernel/sys_ni.c handle the stubbing of MMU-only syscalls,
>>    - Implement sys_mremap and sys_nfsservct,
>>    - Remove unused padding at the end of the table.
>>
>> Impact for mmu:
>>    - Store table in .rodata instead of .data.
>>
>> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>
>
> What happened to the mmap syscall? IIRC, nommu is pointing to
> a different symbol (sys_mmap_pgoff/sys_mmap2).

Thats taken care of in this patch with:

 > diff --git a/arch/m68k/kernel/syscalltable.S 
b/arch/m68k/kernel/syscalltable.S
 > index 9b8393d..0284192 100644
 > --- a/arch/m68k/kernel/syscalltable.S
 > +++ b/arch/m68k/kernel/syscalltable.S
 > @@ -1,6 +1,4 @@
[snip]
 > +#ifndef CONFIG_MMU
 > +#define sys_mmap2		sys_mmap_pgoff
 > +#endif
 > +

Regards
Greg


> Did you check the macros in unistd to see if they match the
> actual table? I guess it would be a good time to comment out
> the ones that are not implemented in either of the two ABIs.
>
> Otherwise, this patch looks good to me.
>
> 	Arnd
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
