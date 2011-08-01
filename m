From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: watchdog (?) on linux 3.0.0 and 2.6.39.3
Date: Mon, 1 Aug 2011 21:03:33 +0200
Message-ID: <CAMuHMdWF9aB_4pzZsoX7q9MrpX6+Yx8tK7CFWFcEv8YoCEG6HA@mail.gmail.com>
References: <4E369834.9070707@aalto.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4E369834.9070707@aalto.fi>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

On Mon, Aug 1, 2011 at 14:12, Tuomas Vainikka <tuomas.vainikka@aalto.fi=
> wrote:
> This happens with both stable 3.0.0 and 2.6.39.3 kernels:
>
> ------------[ cut here ]------------
> WARNING: at net/sched/sch_generic.c:255 dev_watchdog+0x1a4/0x1c4()
> NETDEV WATCHDOG: eth0 (): transmit queue 0 timed out
> Modules linked in: nfsd exportfs ipv6 gayle parport_amiga amiflop
> dmasound_paula ide_core parport dmasound_core amimouse soundcore
> Call Trace: [<0001c134>] warn_slowpath_common+0x48/0x6a
> =C2=A0[<0001c142>] warn_slowpath_common+0x56/0x6a
> =C2=A0[<0001c1ce>] warn_slowpath_fmt+0x2a/0x32
> =C2=A0[<001cbff6>] dev_watchdog+0x1a4/0x1c4
> =C2=A0[<001cbff6>] dev_watchdog+0x1a4/0x1c4
> =C2=A0[<00025b9c>] run_timer_softirq+0xce/0x224
> =C2=A0[<0000ffff>] _060_fpsp_effadd+0x83e3/0xd518
> =C2=A0[<00044424>] rcu_bh_qs+0x0/0x2e
> =C2=A0[<0023eb90>] printk+0x0/0x18
> =C2=A0[<000208fc>] __do_softirq+0x88/0xc8
> =C2=A0[<002406b4>] schedule+0x0/0x34e
> =C2=A0[<00020a0c>] do_softirq+0x28/0x2c
> =C2=A0[<000025f0>] ret_from_exception+0x0/0xc
> =C2=A0[<00002892>] default_idle+0x0/0xc
> =C2=A0[<000028e2>] cpu_idle+0x16/0x20
> =C2=A0[<0023eb90>] printk+0x0/0x18
> =C2=A0[<002fefd0>] start_kernel+0x33a/0x348
> =C2=A0[<0000f9a2>] _060_fpsp_effadd+0x7d86/0xd518
> =C2=A0[<0000f9a2>] _060_fpsp_effadd+0x7d86/0xd518
> =C2=A0[<002fe2fc>] _sinittext+0x2fc/0x988
>
> ---[ end trace 9649de43a8c19796 ]---
>
> The message above comes only once.
>
> Then, there's a lot of these:
>
> eth0: Tx timed out, lost interrupt? TSR=3D0x4, ISR=3D0x15, t=3D52.
> eth0: Tx timed out, lost interrupt? TSR=3D0x5, ISR=3D0x3, t=3D33.
> eth0: Tx timed out, lost interrupt? TSR=3D0x5, ISR=3D0x3, t=3D36.
>
> but the PCMCIA network card of mine can also be flakey.

This is the apne driver? Another 8390 driver that has tx timeouts :-(

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
