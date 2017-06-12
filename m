From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: remove ptrace_signal_deliver
Date: Mon, 12 Jun 2017 09:40:15 +0200
Message-ID: <CAMuHMdXSG_js64tdosFa6ofHrk=Z5u3oUDwHn-TQ6VnjXK1U8w@mail.gmail.com>
References: <877f0oojfj.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <877f0oojfj.fsf@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Roland McGrath <roland@hack.frob.com>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Hi Roland, Oleg, Al,

If you don't mind, I plan to queue this up in the m68k tree for v4.13.
There are no conflicts with current linux-next.

If you prefer to take this through a signal tree with my
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
please let me know.

Thanks!

On Wed, Jun 7, 2017 at 12:11 AM, Andreas Schwab <schwab@linux-m68k.org> wrote:
> This fixes debugger syscall restart interactions.  A debugger that
> modifies the tracee's program counter is expected to set the orig_d0
> pseudo register to -1, to disable a possible syscall restart.
>
> This removes the last user of the ptrace_signal_deliver hook in the ptrace
> signal handling, so remove that as well.
>
> Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
> ---
>  arch/m68k/include/asm/signal.h |  5 -----
>  arch/m68k/kernel/signal.c      | 16 ----------------
>  include/linux/ptrace.h         |  4 ----
>  kernel/signal.c                |  1 -
>  4 files changed, 26 deletions(-)
>
> diff --git a/arch/m68k/include/asm/signal.h b/arch/m68k/include/asm/signal.h
> index 8c8ce5e1ee..3bc64d02ba 100644
> --- a/arch/m68k/include/asm/signal.h
> +++ b/arch/m68k/include/asm/signal.h
> @@ -62,9 +62,4 @@ static inline int __gen_sigismember(sigset_t *set, int _sig)
>
>  #endif /* !CONFIG_CPU_HAS_NO_BITFIELDS */
>
> -#ifndef __uClinux__
> -extern void ptrace_signal_deliver(void);
> -#define ptrace_signal_deliver ptrace_signal_deliver
> -#endif /* __uClinux__ */
> -
>  #endif /* _M68K_SIGNAL_H */
> diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
> index 093b7c42fb..098fa7185b 100644
> --- a/arch/m68k/kernel/signal.c
> +++ b/arch/m68k/kernel/signal.c
> @@ -109,22 +109,6 @@ int handle_kernel_fault(struct pt_regs *regs)
>         return 1;
>  }
>
> -void ptrace_signal_deliver(void)
> -{
> -       struct pt_regs *regs = signal_pt_regs();
> -       if (regs->orig_d0 < 0)
> -               return;
> -       switch (regs->d0) {
> -       case -ERESTARTNOHAND:
> -       case -ERESTARTSYS:
> -       case -ERESTARTNOINTR:
> -               regs->d0 = regs->orig_d0;
> -               regs->orig_d0 = -1;
> -               regs->pc -= 2;
> -               break;
> -       }
> -}
> -
>  static inline void push_cache (unsigned long vaddr)
>  {
>         /*
> diff --git a/include/linux/ptrace.h b/include/linux/ptrace.h
> index 422bc2e4cb..9a2e04be06 100644
> --- a/include/linux/ptrace.h
> +++ b/include/linux/ptrace.h
> @@ -388,10 +388,6 @@ static inline void user_single_step_siginfo(struct task_struct *tsk,
>  #define current_pt_regs() task_pt_regs(current)
>  #endif
>
> -#ifndef ptrace_signal_deliver
> -#define ptrace_signal_deliver() ((void)0)
> -#endif
> -
>  /*
>   * unlike current_pt_regs(), this one is equal to task_pt_regs(current)
>   * on *all* architectures; the only reason to have a per-arch definition
> diff --git a/kernel/signal.c b/kernel/signal.c
> index 7e59ebc2c2..742c08b409 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -2092,7 +2092,6 @@ static void do_jobctl_trap(void)
>
>  static int ptrace_signal(int signr, siginfo_t *info)
>  {
> -       ptrace_signal_deliver();
>         /*
>          * We do not check sig_kernel_stop(signr) but set this marker
>          * unconditionally because we do not know whether debugger will
> --
> 2.13.1

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
