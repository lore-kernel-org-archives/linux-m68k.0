From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table
Date: Tue, 19 Apr 2011 14:32:34 +1000
Message-ID: <4DAD1062.2020309@snapgear.com>
References: <alpine.DEB.2.00.1104062231190.11240@ayla.of.borg> <BANLkTinc8x5ehq-H3RUU9+=X75FbVOpbVg@mail.gmail.com> <201104172213.01258.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <201104172213.01258.arnd@arndb.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, uClinux list <uclinux-dev@uclinux.org>

On 18/04/11 06:13, Arnd Bergmann wrote:
> On Wednesday 13 April 2011, Geert Uytterhoeven wrote:
>> When comparing this to the MMU comments in include/asm-generic/unistd.h,
>> I noticed this:
>>
>> M68knommu does have:
>>    - sys_mbind
>>    - sys_get_mempolicy
>>    - sys_set_mempolicy
>>    - sys_migrate_pages
>>    - sys_move_pages
>
> scripts/checksyscalls.sh ignores these on NOMMU, so I did not list them.
> Are there any NOMMU system with NUMA support?

Certainly no m68k/ColdFire ones...


> If so, what are these
> syscalls supposed to do in that case? I assume that they don't actually
> change the physical location of a virtual address.
>
> Since the unistd.h file is shared with m68k, I see nothing wrong here,
> they should simply get stubbed out like the other NOMMU syscalls (swapon,
> mprotect, msync, ...)

I have no objection to changing these to be sys_ni_syscall for the
CONFIG_MMU=n case of m68k. I am pretty sure they will never have
been used in any way on m68knommu systems. (It does look like uClibc
for example does support these even on no-mmu systems though. I just
don't think they will have actually been used by anyone).


>>    - sys_fork, although it returns -EINVAL, not -ENOSYS

I can't recall why it is that way :-)
For one thing uClibc doesn't even generate a library symbol for it.
So the only way someone would be able to get to it normally on an
m68knommu system is to code the raw system call. And even then all
they will ever get is a fail. I doubt the change in errno return
type would be a problem.

I have no problem with being consistent with asm-generic/unistd.h,
and stubbing this to a sys_ni_syscall as well.


>> M68knommu does not implement:
>>    - sys_mremap
>>    - sys_nfsservct
>
> Shouldn't you get a warning about these from scripts/checksyscalls.sh ?

It doesn't complain.


> mremap should really work, except for MREMAP_FIXED, as documented in mm/nommu.c.
> nfsservctl is probably not needed, but I see no reason to leave it out either.

They should work exactly the same as any other non-mmu arch.
I just compile tested with those enabled (as per asm-generic/unistd.h)
and it worked fine. So I would be happy to see those removed from the
stub list for m68k/m68knommu.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
