From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table
Date: Tue, 19 Apr 2011 10:21:19 +0200
Message-ID: <201104191021.20293.arnd@arndb.de>
References: <alpine.DEB.2.00.1104062231190.11240@ayla.of.borg> <201104172213.01258.arnd@arndb.de> <4DAD1062.2020309@snapgear.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4DAD1062.2020309@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, uClinux list <uclinux-dev@uclinux.org>

On Tuesday 19 April 2011, Greg Ungerer wrote:
> On 18/04/11 06:13, Arnd Bergmann wrote:

> > If so, what are these
> > syscalls supposed to do in that case? I assume that they don't actually
> > change the physical location of a virtual address.
> >
> > Since the unistd.h file is shared with m68k, I see nothing wrong here,
> > they should simply get stubbed out like the other NOMMU syscalls (swapon,
> > mprotect, msync, ...)
> 
> I have no objection to changing these to be sys_ni_syscall for the
> CONFIG_MMU=n case of m68k. I am pretty sure they will never have
> been used in any way on m68knommu systems. (It does look like uClibc
> for example does support these even on no-mmu systems though. I just
> don't think they will have actually been used by anyone).

They are already sys_ni_syscall, by means of kernel/sys_ni.c.
I wouldn't bother changing them. The real question is whether
you should define the __NR_* macros for the syscalls that are
not provided. For a new architecture I think you should not,
but removing them might cause regressions. Then again, it's
probably very useful to match the unistd.h file with the system
call table.

> >>    - sys_fork, although it returns -EINVAL, not -ENOSYS
> 
> I can't recall why it is that way :-)
> For one thing uClibc doesn't even generate a library symbol for it.
> So the only way someone would be able to get to it normally on an
> m68knommu system is to code the raw system call. And even then all
> they will ever get is a fail. I doubt the change in errno return
> type would be a problem.
> 
> I have no problem with being consistent with asm-generic/unistd.h,
> and stubbing this to a sys_ni_syscall as well.

Makes sense. Note that the man page defines neither return code.

> >> M68knommu does not implement:
> >>    - sys_mremap
> >>    - sys_nfsservct
> >
> > Shouldn't you get a warning about these from scripts/checksyscalls.sh ?
> 
> It doesn't complain.

Ah, you actually define the syscall numbers for these, so it will not warn,
despite the fact that the entry is missing.

> > mremap should really work, except for MREMAP_FIXED, as documented in mm/nommu.c.
> > nfsservctl is probably not needed, but I see no reason to leave it out either.
> 
> They should work exactly the same as any other non-mmu arch.
> I just compile tested with those enabled (as per asm-generic/unistd.h)
> and it worked fine. So I would be happy to see those removed from the
> stub list for m68k/m68knommu.

Ok, good.

	Arnd
