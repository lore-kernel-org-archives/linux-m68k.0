From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k: Convert to genirq (WIP)
Date: Tue, 31 May 2011 10:35:06 +0200
Message-ID: <BANLkTikxb_tJvXoHma7U41TrZKmZr=4u0g__34325.3696374179$1306830963$gmane$org@mail.gmail.com>
References: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Sat, May 28, 2011 at 20:32, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> | NR_IRQS:72
> | ------------[ cut here ]------------
> | WARNING: at linux/kernel/irq/chip.c:559 0x2a191a()
> | Modules linked in:
> | Call Trace: [<0002767e>] warn_slowpath_common+0x4c/0x64
> | =C2=A0[<0004e81c>] irq_set_chip+0x0/0x66
> | =C2=A0[<000276aa>] warn_slowpath_null+0x14/0x1a
> | =C2=A0[<0004e728>] __irq_set_handler+0x11c/0x13c
> | =C2=A0[<0004ec7e>] handle_level_irq+0x0/0x9c
> | =C2=A0[<00003ef4>] m68k_setup_irq_controller+0x3c/0x50
> | =C2=A0[<0004ec7e>] handle_level_irq+0x0/0x9c
> | =C2=A0[<0004e81c>] irq_set_chip+0x0/0x66
> | =C2=A0[<00027dc8>] printk+0x0/0x1a
> | =C2=A0[<00322022>] __alloc_bootmem+0x0/0x1a
> | =C2=A0[<0031dea4>] atari_init_IRQ+0x2a/0xe8
> | =C2=A0[<0004ec7e>] handle_level_irq+0x0/0x9c
> | =C2=A0[<0031c450>] init_IRQ+0x28/0x2e
> | =C2=A0[<00027dc8>] printk+0x0/0x1a
> | =C2=A0[<0031a012>] start_kernel+0x196/0x3b0
> | =C2=A0[<0031931e>] _sinittext+0x31e/0x9c0
> |
> | ---[ end trace 139ce121c98e96c9 ]---

whitespace-challenged diff --git a/arch/m68k/kernel/ints.c
b/arch/m68k/kernel/ints.c
index f4804f3..8d8a1e9 100644
--- a/arch/m68k/kernel/ints.c
+++ b/arch/m68k/kernel/ints.c
@@ -285,7 +285,7 @@ void m68k_setup_irq_controller(struct irq_chip *chi=
p,
        for (i =3D 0; i < cnt; i++) {
                irq_set_chip(irq + i, chip);
                if (handle)
-                       irq_set_handler(i, handle);
+                       irq_set_handler(irq + i, handle);
        }
 }

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
