From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: m68k: Convert to genirq (WIP)
Date: Thu, 16 Jun 2011 22:03:29 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1106162201390.11814@ionos>
References: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg> <BANLkTimebx56-Wb5JPWxYVnND9gG8OVdsQ@mail.gmail.com> <BANLkTin+gp2Cnxj8kHbHRmuoEgyDR8YeaQ@mail.gmail.com> <BANLkTik5-H1fc2rk3QrwvQiF=7fELmE2CA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <BANLkTik5-H1fc2rk3QrwvQiF=7fELmE2CA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Thu, 16 Jun 2011, Geert Uytterhoeven wrote:
> > Seems like everything (Atari/ARAnyM and Amiga) still works when using
> > handle_simple_irq instead of handle_level_irq.
> > As a bonus, BogoMIPS is above 16 again.
> 
> With handle_simple_irq(), we no longer need to define irq_{,un}mask() methods
> in our irq_chips. Hence the "old" m68k platform interrupt code seems to be much
> closer to genirq than I thought...
> 
> Does this make sense?

It makes sense, when your interrupt chips do not require any action
when an interrupt is handled. In that case you can avoid the hardware
access.

Thanks,

	tglx
