From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: m68k: Convert to genirq (WIP)
Date: Tue, 31 May 2011 11:50:31 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1105311146360.3078@ionos>
References: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

Geert,

On Sat, 28 May 2011, Geert Uytterhoeven wrote:

> 	Hi all,
> 
> Now sparc32 has beaten me, I pushed out my work in progress of converting m68k
> to use the generic hardirq framework:

That leaves only s390 in the rain, but I don't expect that they
replace their magic interrupt opcode ever :)

> git://git.kernel.org:/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-genirq
> http://git.kernel.org/?p=linux/kernel/git/geert/linux-m68k.git;a=shortlog;h=refs/heads/m68k-genirq
> 
> It contains the following commits:
> 
>   [1] ide-{cd,floppy,tape}, keyboard: Do not include <linux/irq.>
>   [2] m68k/irq: Rename irq_controller to irq_chip
>   [3] m68k/irq: Kill irq_node_t typedef, always use struct irq_node
>   [4] m68k/irq: Rename irq_node to irq_data
>   [5] m68k/irq: Switch irq_chip methods to "struct irq_data *data"
>   [6] m68k/irq: Rename setup_irq() to m68k_setup_irq() and make it static
>   [7] m68k/irq: Extract irq_set_chip()
>   [8] m68k/irq: Add genirq support
>   [9] m68k/atari: Convert Atari to genirq
> 
>   [1] is a temporary(?) fix to avoid redefinitions during the remainder of
>       the series,
>   [2-7] refactor the current m68k irq framework to match the generic hardirq
>         framework more closely w.r.t. to its (platform) users,
>   [8] adds generic hardirq support to the core, which can be enabled through
>       a config option, so both legacy and generic hardirq can coexist at the
>       source level during the migration,
>   [9] converts Atari to use generic hardirqs.

Very sensible approach! Patches are looking good so far! Feel free to
add Acked-by-me!

Thanks,

	tglx
