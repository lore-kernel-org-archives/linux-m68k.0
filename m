From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: m68k: Convert to genirq (WIP)
Date: Tue, 31 May 2011 22:10:57 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1105312208030.3078@ionos>
References: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg> <BANLkTinsMhQZSeO_ujtYEJuOcAa=FRh-6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <BANLkTinsMhQZSeO_ujtYEJuOcAa=FRh-6g@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

Geert,

On Tue, 31 May 2011, Geert Uytterhoeven wrote:
> On Sat, May 28, 2011 at 20:32, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Next on my list is Amiga, which will cover autovectored and chained interrupts.
> 
> Plain chained interrupts should be handled by calling irq_set_chained_handler()
> to register an irq_flow_handler_t, and let the handler call
> generic_handle_irq() for
> each successive interrupt, right?
> 
> However, on Amiga we have interrupts (IRQ_AMIGA_PORTS and
> IRQ_AMIGA_EXTER) that are a combination of chained (for the CIA interrupt
> controllers) and shared level interrupts (for motherboard hardware and
> Zorro expansion
> boards).
> But irq_set_chained_handler() sets IRQ_NOREQUEST, i.e. the interrupt cannot
> be requested anymore via request_irq(), so this rules out using it with shared
> level interrupts.
> 
> What's the preferred way to handle this? Is there are standard way, or should I
> write my own specialized irq_flow_handler_t that handles both?
> 
> In the old scheme, we just registered the chain handlers with
> request_irq(), so they
> worked nicely together with the shared level interrupts (cfr.
> arch/m68k/amiga/cia.c)

You still can setup all those handlers setup via request_irq() and
handle the demux part by calling generic_handle_irq() from the handler
which deals with that demux hardware. irq_set_chained_handler() is
merily an optimization which does not apply to potentially shared
primary interrupts.

Thanks,

	tglx
