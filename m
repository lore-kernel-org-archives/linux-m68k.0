From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table
Date: Thu, 5 May 2011 08:24:33 +0200
Message-ID: <201105050824.34056.arnd@arndb.de>
References: <alpine.DEB.2.00.1105042033190.9040@ayla.of.borg>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1105042033190.9040@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, uClinux list <uclinux-dev@uclinux.org>

On Wednesday 04 May 2011, Geert Uytterhoeven wrote:
> Impact for nommu:
>   - Store table in .rodata instead of .text,
>   - Let kernel/sys_ni.c handle the stubbing of MMU-only syscalls,
>   - Implement sys_mremap and sys_nfsservct,
>   - Remove unused padding at the end of the table.
> 
> Impact for mmu:
>   - Store table in .rodata instead of .data.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

What happened to the mmap syscall? IIRC, nommu is pointing to
a different symbol (sys_mmap_pgoff/sys_mmap2).

Did you check the macros in unistd to see if they match the
actual table? I guess it would be a good time to comment out
the ones that are not implemented in either of the two ABIs.

Otherwise, this patch looks good to me.

	Arnd
