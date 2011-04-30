From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68knommu: Use generic show_interrupts()
Date: Sun, 1 May 2011 09:00:21 +1000
Message-ID: <4DBC9485.1060601@snapgear.com>
References: <alpine.DEB.2.00.1104302312320.24942@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1104302312320.24942@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, uClinux list <uclinux-dev@uclinux.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>

Hi Geert,

On 01/05/11 07:15, Geert Uytterhoeven wrote:
> Apart from whitespace differences, /proc/interrupts doesn't change by
> enabling GENERIC_IRQ_SHOW.
>
> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>

Works fine on m68knommu, so:

Acked-by: Greg Ungerer <gerg@uclinux.org>

Do you want me to push this via the m68knommu git tree?

Regards
Greg



> ---
> _not_ tested on m68knommu.
> Observations done on work-in-progress Atari genirq.
>
>   arch/m68k/Kconfig      |    1 +
>   arch/m68k/kernel/irq.c |   28 ----------------------------
>   2 files changed, 1 insertions(+), 28 deletions(-)
>
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index dee2796..c23af0a 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -5,6 +5,7 @@ config M68K
>   	select HAVE_AOUT if MMU
>   	select GENERIC_ATOMIC64 if MMU
>   	select HAVE_GENERIC_HARDIRQS if !MMU
> +	select GENERIC_IRQ_SHOW if !MMU
>
>   config RWSEM_GENERIC_SPINLOCK
>   	bool
> diff --git a/arch/m68k/kernel/irq.c b/arch/m68k/kernel/irq.c
> index 15dbc3e..544b871 100644
> --- a/arch/m68k/kernel/irq.c
> +++ b/arch/m68k/kernel/irq.c
> @@ -28,31 +28,3 @@ asmlinkage void do_IRQ(int irq, struct pt_regs *regs)
>
>   	set_irq_regs(oldregs);
>   }
> -
> -int show_interrupts(struct seq_file *p, void *v)
> -{
> -	struct irqaction *ap;
> -	int irq = *((loff_t *) v);
> -
> -	if (irq == 0)
> -		seq_puts(p, "           CPU0\n");
> -
> -	if (irq<  NR_IRQS) {
> -		struct irq_desc *desc = irq_to_desc(irq);
> -
> -		ap = desc->action;
> -		if (ap) {
> -			seq_printf(p, "%3d: ", irq);
> -			seq_printf(p, "%10u ", kstat_irqs(irq));
> -			seq_printf(p, "%14s  ", irq_desc_get_chip(desc)->name);
> -
> -			seq_printf(p, "%s", ap->name);
> -			for (ap = ap->next; ap; ap = ap->next)
> -				seq_printf(p, ", %s", ap->name);
> -			seq_putc(p, '\n');
> -		}
> -	}
> -
> -	return 0;
> -}
> -


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
