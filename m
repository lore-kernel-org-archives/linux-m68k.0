From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table
Date: Tue, 19 Apr 2011 22:26:32 +1000
Message-ID: <4DAD7F78.9010308@snapgear.com>
References: <alpine.DEB.2.00.1104062231190.11240@ayla.of.borg> <201104172213.01258.arnd@arndb.de> <4DAD1062.2020309@snapgear.com> <201104191021.20293.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <201104191021.20293.arnd@arndb.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, uClinux list <uclinux-dev@uclinux.org>


Hi Arnd,

On 19/04/11 18:21, Arnd Bergmann wrote:
> On Tuesday 19 April 2011, Greg Ungerer wrote:
>> On 18/04/11 06:13, Arnd Bergmann wrote:
>
>>> If so, what are these
>>> syscalls supposed to do in that case? I assume that they don't actually
>>> change the physical location of a virtual address.
>>>
>>> Since the unistd.h file is shared with m68k, I see nothing wrong here,
>>> they should simply get stubbed out like the other NOMMU syscalls (swapon,
>>> mprotect, msync, ...)
>>
>> I have no objection to changing these to be sys_ni_syscall for the
>> CONFIG_MMU=n case of m68k. I am pretty sure they will never have
>> been used in any way on m68knommu systems. (It does look like uClibc
>> for example does support these even on no-mmu systems though. I just
>> don't think they will have actually been used by anyone).
>
> They are already sys_ni_syscall, by means of kernel/sys_ni.c.
> I wouldn't bother changing them. The real question is whether
> you should define the __NR_* macros for the syscalls that are
> not provided. For a new architecture I think you should not,
> but removing them might cause regressions. Then again, it's
> probably very useful to match the unistd.h file with the system
> call table.

Ok, then it looks like we don't need the long redefine list
for the non-mmu case in Geert's original patch.Those that are
not implemented by the non-mmu build will just end up being
sys_ni_syscall anyway.

I built (and run tested) that for m68knommu targets, removing
the redefine list - expect for sys_mmap2/sys_mmap_pgoff - and
that of course works fine.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
