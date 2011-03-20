From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k,m68knommu: Wire up name_to_handle_at, open_by_handle_at, clock_adjtime
Date: Sun, 20 Mar 2011 13:28:49 +0100
Message-ID: <AANLkTikbmXoAh5r=GAdSY667APRb8kpUi4F2n7SghWOL__513.111768714403$1300624512$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, uClinux list <uclinux-dev@uclinux.org>

Oops, lost the subject

On Sun, Mar 20, 2011 at 13:11, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> =C2=A0arch/m68k/include/asm/unistd.h =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A05 ++++-
> =C2=A0arch/m68k/kernel/entry.S =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A03 +++
> =C2=A0arch/m68knommu/kernel/syscalltable.S | =C2=A0 =C2=A03 +++
> =C2=A03 files changed, 10 insertions(+), 1 deletions(-)
>
> diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/u=
nistd.h
> index 26d851d..f69f7ce 100644
> --- a/arch/m68k/include/asm/unistd.h
> +++ b/arch/m68k/include/asm/unistd.h
> @@ -343,10 +343,13 @@
> =C2=A0#define __NR_fanotify_init =C2=A0 =C2=A0 337
> =C2=A0#define __NR_fanotify_mark =C2=A0 =C2=A0 338
> =C2=A0#define __NR_prlimit64 =C2=A0 =C2=A0 =C2=A0 =C2=A0 339
> +#define __NR_name_to_handle_at 340
> +#define __NR_open_by_handle_at 341
> +#define __NR_clock_adjtime =C2=A0 =C2=A0 342
>
> =C2=A0#ifdef __KERNEL__
>
> -#define NR_syscalls =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0340
> +#define NR_syscalls =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0343
>
> =C2=A0#define __ARCH_WANT_IPC_PARSE_VERSION
> =C2=A0#define __ARCH_WANT_OLD_READDIR
> diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
> index 1559dea..8f9524a 100644
> --- a/arch/m68k/kernel/entry.S
> +++ b/arch/m68k/kernel/entry.S
> @@ -750,4 +750,7 @@ sys_call_table:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.long sys_fanotify_init
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.long sys_fanotify_mark
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.long sys_prlimit64
> + =C2=A0 =C2=A0 =C2=A0 .long sys_name_to_handle_at =C2=A0 =C2=A0 /* 3=
40 */
> + =C2=A0 =C2=A0 =C2=A0 .long sys_open_by_handle_at
> + =C2=A0 =C2=A0 =C2=A0 .long sys_clock_adjtime
>
> diff --git a/arch/m68knommu/kernel/syscalltable.S b/arch/m68knommu/ke=
rnel/syscalltable.S
> index 79b1ed1..605bbbe 100644
> --- a/arch/m68knommu/kernel/syscalltable.S
> +++ b/arch/m68knommu/kernel/syscalltable.S
> @@ -358,6 +358,9 @@ ENTRY(sys_call_table)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.long sys_fanotify_init
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.long sys_fanotify_mark
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.long sys_prlimit64
> + =C2=A0 =C2=A0 =C2=A0 .long sys_name_to_handle_at =C2=A0 =C2=A0 /* 3=
40 */
> + =C2=A0 =C2=A0 =C2=A0 .long sys_open_by_handle_at
> + =C2=A0 =C2=A0 =C2=A0 .long sys_clock_adjtime
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.rept NR_syscalls-(.-sys_call_table)/4
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.long sys_ni_s=
yscall
> --
> 1.7.0.4

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
