From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table
Date: Sun, 17 Apr 2011 22:13:01 +0200
Message-ID: <201104172213.01258.arnd@arndb.de>
References: <alpine.DEB.2.00.1104062231190.11240@ayla.of.borg> <BANLkTinc8x5ehq-H3RUU9+=X75FbVOpbVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <BANLkTinc8x5ehq-H3RUU9+=X75FbVOpbVg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, uClinux list <uclinux-dev@uclinux.org>

On Wednesday 13 April 2011, Geert Uytterhoeven wrote:
> When comparing this to the MMU comments in include/asm-generic/unistd.h,
> I noticed this:
> 
> M68knommu does have:
>   - sys_mbind
>   - sys_get_mempolicy
>   - sys_set_mempolicy
>   - sys_migrate_pages
>   - sys_move_pages

scripts/checksyscalls.sh ignores these on NOMMU, so I did not list them.
Are there any NOMMU system with NUMA support? If so, what are these
syscalls supposed to do in that case? I assume that they don't actually
change the physical location of a virtual address.

Since the unistd.h file is shared with m68k, I see nothing wrong here,
they should simply get stubbed out like the other NOMMU syscalls (swapon,
mprotect, msync, ...)

>   - sys_fork, although it returns -EINVAL, not -ENOSYS
> 
> M68knommu does not implement:
>   - sys_mremap
>   - sys_nfsservct

Shouldn't you get a warning about these from scripts/checksyscalls.sh ?

mremap should really work, except for MREMAP_FIXED, as documented in mm/nommu.c.
nfsservctl is probably not needed, but I see no reason to leave it out either.

	Arnd
