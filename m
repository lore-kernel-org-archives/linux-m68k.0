From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table
Date: Tue, 19 Apr 2011 10:52:24 +0200
Message-ID: <201104191052.24878.arnd@arndb.de>
References: <alpine.DEB.2.00.1104062231190.11240@ayla.of.borg> <4DAD1062.2020309@snapgear.com> <201104191021.20293.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <201104191021.20293.arnd@arndb.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, uClinux list <uclinux-dev@uclinux.org>

On Tuesday 19 April 2011, Arnd Bergmann wrote:
> They are already sys_ni_syscall, by means of kernel/sys_ni.c.
> I wouldn't bother changing them. The real question is whether
> you should define the __NR_* macros for the syscalls that are
> not provided. For a new architecture I think you should not,
> but removing them might cause regressions. Then again, it's
> probably very useful to match the unistd.h file with the system
> call table.

I've just looked at the diff between the m68k and m68knommu
syscall tables, and it seems that you should be able to just
use the m68k variant, with a slight adaptation for mmap2/mmap_pgoff.

You might want to use the same method as asm-generic, in order
to provide a way to better synchronize unistd.h and syscalltable.

	Arnd
