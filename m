From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table
Date: Wed, 13 Apr 2011 20:16:15 +0200
Message-ID: <BANLkTinc8x5ehq-H3RUU9+=X75FbVOpbVg@mail.gmail.com>
References: <alpine.DEB.2.00.1104062231190.11240@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1104062231190.11240@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, uClinux list <uclinux-dev@uclinux.org>

On Wed, Apr 6, 2011 at 22:33, Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
> +#ifndef CONFIG_MMU
> +#define sys_swapon =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys_ni_=
syscall
> +#define sys_swapoff =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys_ni_=
syscall
> +#define sys_mprotect =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys_ni_sysca=
ll
> +#define sys_msync =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sy=
s_ni_syscall
> +#define sys_mlock =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sy=
s_ni_syscall
> +#define sys_munlock =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys_ni_=
syscall
> +#define sys_mlockall =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys_ni_sysca=
ll
> +#define sys_munlockall =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys_ni_syscall
> +#define sys_mremap =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys_ni_=
syscall
> +#define sys_nfsservctl =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys_ni_syscall
> +#define sys_mincore =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys_ni_=
syscall
> +#define sys_madvise =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys_ni_=
syscall
> +#define sys_remap_file_pages =C2=A0 sys_ni_syscall
> +
> +#define sys_mmap2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sy=
s_mmap_pgoff
> +#endif

When comparing this to the MMU comments in include/asm-generic/unistd.h=
,
I noticed this:

M68knommu does have:
  - sys_mbind
  - sys_get_mempolicy
  - sys_set_mempolicy
  - sys_migrate_pages
  - sys_move_pages
  - sys_fork, although it returns -EINVAL, not -ENOSYS

M68knommu does not implement:
  - sys_mremap
  - sys_nfsservctl

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
