From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k: Convert to genirq (WIP)
Date: Thu, 16 Jun 2011 21:45:11 +0200
Message-ID: <BANLkTinDvLqHChPUpG9v1AXp0E=iRLteDg@mail.gmail.com>
References: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>, Michael Schmitz <schmitzmic@googlemail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

On Sat, May 28, 2011 at 20:32, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> | ------------[ cut here ]------------
> | WARNING: at linux/kernel/irq/handle.c:130 handle_irq_event_percpu+0=
xe6/0x148()
> | irq 3 handler nfeth_interrupt+0x0/0x126 enabled interrupts
> | Modules linked in:
> | Call Trace: [<00027670>] warn_slowpath_common+0x3e/0x64
> | =C2=A0[<0002767e>] warn_slowpath_common+0x4c/0x64
> | =C2=A0[<0002770c>] warn_slowpath_fmt+0x2a/0x32
> | =C2=A0[<0004d01a>] handle_irq_event_percpu+0xe6/0x148
> | =C2=A0[<0004d01a>] handle_irq_event_percpu+0xe6/0x148
> | =C2=A0[<00009d64>] nfeth_interrupt+0x0/0x126
> | =C2=A0[<00027dc8>] printk+0x0/0x1a
> | =C2=A0[<0004d09c>] handle_irq_event+0x20/0x2c
> | =C2=A0[<0004ecce>] handle_level_irq+0x50/0x9c
> | =C2=A0[<002496b8>] schedule+0x0/0x31e
> | =C2=A0[<00006782>] do_IRQ+0x2e/0x44
> | =C2=A0[<00027dc8>] printk+0x0/0x1a
> | =C2=A0[<00003eb4>] __m68k_handle_int+0xe/0x12
> | =C2=A0[<000026e2>] auto_irqhandler_fixup+0x4/0x6
> | =C2=A0[<00027dc8>] printk+0x0/0x1a
> | =C2=A0[<00002c46>] default_idle+0x0/0xe
> | =C2=A0[<00002b0c>] cpu_idle+0x16/0x22
> | =C2=A0[<00002b18>] kernel_thread+0x0/0x4e
> | =C2=A0[<00248610>] rest_init+0x5c/0x62
> | =C2=A0[<0031a220>] start_kernel+0x3a4/0x3b0
> | =C2=A0[<000106aa>] ssincos+0x27e/0x2ac
> | =C2=A0[<000106aa>] ssincos+0x27e/0x2ac
> | =C2=A0[<0031931e>] _sinittext+0x31e/0x9c0
> |
> | ---[ end trace 139ce121c98e96cb ]---

This is the WARN_ONCE(!irqs_disabled()) check.

static inline bool arch_irqs_disabled_flags(unsigned long flags)
{
        return (flags & ~ALLOWINT) !=3D 0;
}

with flags =3D 0x2300. Due to the "special" value of ALLOWINT on Atari:

#if defined(MACH_ATARI_ONLY)
        /* block out HSYNC on the atari */
#define ALLOWINT        (~0x400)
#define MAX_NOINT_IPL   3
#else
        /* portable version */
#define ALLOWINT        (~0x700)
#define MAX_NOINT_IPL   0
#endif /* machine compilation types */

the test fails.

Would it harm to always use the "portable" version?
That one is used on multi-platform kernels anyway?
Or would it cause too many HBLANK interrupts?

BTW, MAX_NOINT_IPL is no longer used.

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
