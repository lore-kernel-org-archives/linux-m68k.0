From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k, exec: remove redundant set_fs(USER_DS)
Date: Wed, 15 Jun 2011 16:40:28 +0200
Message-ID: <BANLkTin214-RYxJUQ-uM6iYz1NQLBKRH2Q@mail.gmail.com>
References: <BANLkTiknCeAxe30MJdVTxDom+ko8+EDQ4A@mail.gmail.com>
	<1307642718-22257-1-git-send-email-minipli@googlemail.com>
	<20110609155630.0f734351.akpm@linux-foundation.org>
	<BANLkTinv1teZEHMK0qymaVdcxPOErpqSyg@mail.gmail.com>
	<1307711394-7827-1-git-send-email-minipli@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1307711394-7827-1-git-send-email-minipli@googlemail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mathias Krause <minipli@googlemail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Jun 10, 2011 at 15:09, Mathias Krause <minipli@googlemail.com> =
wrote:
> The address limit is already set in flush_old_exec() so those calls t=
o
> set_fs(USER_DS) are redundant.
>
> Signed-off-by: Mathias Krause <minipli@googlemail.com>
> Cc: Greg Ungerer <gerg@uclinux.org>
> ---
>
> Note: I'm not sure about the assignment to current->thread.fs in
> flush_thread() -- shouldn't this be done in set_fs() itself?

set_fs() is used to temporary set the address space to be used from the
kernel.
current->thread.fs is the address space that will be used when the
thread returns
to userspace.
So I think it's correct.

=46or nommu, thread.fs is set, but not really used.

> =C2=A0arch/m68k/include/asm/processor.h | =C2=A0 =C2=A04 ----
> =C2=A0arch/m68k/kernel/process_mm.c =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0arch/m68k/kernel/process_no.c =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A03 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/arch/m68k/include/asm/processor.h b/arch/m68k/include/as=
m/processor.h
> index f111b02..d8ef53a 100644
> --- a/arch/m68k/include/asm/processor.h
> +++ b/arch/m68k/include/asm/processor.h
> @@ -105,9 +105,6 @@ struct thread_struct {
> =C2=A0static inline void start_thread(struct pt_regs * regs, unsigned=
 long pc,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long usp)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 /* reads from user space */
> - =C2=A0 =C2=A0 =C2=A0 set_fs(USER_DS);
> -
> =C2=A0 =C2=A0 =C2=A0 =C2=A0regs->pc =3D pc;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0regs->sr &=3D ~0x2000;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0wrusp(usp);
> @@ -129,7 +126,6 @@ extern int handle_kernel_fault(struct pt_regs *re=
gs);
>
> =C2=A0#define start_thread(_regs, _pc, _usp) =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0do { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> - =C2=A0 =C2=A0 =C2=A0 set_fs(USER_DS); /* reads from user space */ =C2=
=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0(_regs)->pc =3D (_pc); =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0((struct switch_stack *)(_regs))[-1].a6 =3D=
 0; =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0reformat(_regs); =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\
> diff --git a/arch/m68k/kernel/process_mm.c b/arch/m68k/kernel/process=
_mm.c
> index c2a1fc2..1bc223a 100644
> --- a/arch/m68k/kernel/process_mm.c
> +++ b/arch/m68k/kernel/process_mm.c
> @@ -185,7 +185,7 @@ EXPORT_SYMBOL(kernel_thread);
> =C2=A0void flush_thread(void)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long zero =3D 0;
> - =C2=A0 =C2=A0 =C2=A0 set_fs(USER_DS);
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0current->thread.fs =3D __USER_DS;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!FPU_IS_EMU)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0asm volatile (=
".chip 68k/68881\n\t"
> diff --git a/arch/m68k/kernel/process_no.c b/arch/m68k/kernel/process=
_no.c
> index 9b86ad1..69c1803 100644
> --- a/arch/m68k/kernel/process_no.c
> +++ b/arch/m68k/kernel/process_no.c
> @@ -158,7 +158,7 @@ void flush_thread(void)
> =C2=A0#ifdef CONFIG_FPU
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long zero =3D 0;
> =C2=A0#endif
> - =C2=A0 =C2=A0 =C2=A0 set_fs(USER_DS);
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0current->thread.fs =3D __USER_DS;
> =C2=A0#ifdef CONFIG_FPU
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!FPU_IS_EMU)

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
