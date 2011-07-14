From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: Revive reporting of spurious interrupts
Date: Thu, 14 Jul 2011 13:47:54 +1000
Message-ID: <4E1E66EA.8070508@snapgear.com>
References: <alpine.DEB.2.00.1107132028080.31317@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1107132028080.31317@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, uClinux list <uclinux-dev@uclinux.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

Hi Geert,

On 14/07/11 04:29, Geert Uytterhoeven wrote:
> commit 2502b667ea835ee16685c74b2a0d89ba8afe117a ("Change the m68knommu irq
> handling to use the generic irq framework.") removed the reporting of spurious
> interrupts on nommu (68328 and 68360).
>
> Bring it back in a generic way, using "atomic_t irq_err_count", as that's what
> most of the other architectures are using.
>
> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>

Looks good. Applied to the m68knommu git tree.
(I'll push in the 3.1 merge window).

Thanks
Greg


> ---
> Will build on top of this for m68k genirq.
>
>   arch/m68k/kernel/irq.c           |   10 ++++++++++
>   arch/m68k/platform/68328/entry.S |    2 +-
>   arch/m68k/platform/68328/ints.c  |    3 ---
>   arch/m68k/platform/68360/entry.S |    2 +-
>   arch/m68k/platform/68360/ints.c  |    3 ---
>   5 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/arch/m68k/kernel/irq.c b/arch/m68k/kernel/irq.c
> index 544b871..c73988c 100644
> --- a/arch/m68k/kernel/irq.c
> +++ b/arch/m68k/kernel/irq.c
> @@ -28,3 +28,13 @@ asmlinkage void do_IRQ(int irq, struct pt_regs *regs)
>
>   	set_irq_regs(oldregs);
>   }
> +
> +
> +/* The number of spurious interrupts */
> +atomic_t irq_err_count;
> +
> +int arch_show_interrupts(struct seq_file *p, int prec)
> +{
> +	seq_printf(p, "%*s: %10u\n", prec, "ERR", atomic_read(&irq_err_count));
> +	return 0;
> +}
> diff --git a/arch/m68k/platform/68328/entry.S b/arch/m68k/platform/68328/entry.S
> index f68dce7..a6aa7b7 100644
> --- a/arch/m68k/platform/68328/entry.S
> +++ b/arch/m68k/platform/68328/entry.S
> @@ -236,7 +236,7 @@ ret_from_interrupt:
>    * Handler for uninitialized and spurious interrupts.
>    */
>   ENTRY(bad_interrupt)
> -	addql	#1,num_spurious
> +	addql	#1,irq_err_count
>   	rte
>
>   /*
> diff --git a/arch/m68k/platform/68328/ints.c b/arch/m68k/platform/68328/ints.c
> index a90288c..41753a2 100644
> --- a/arch/m68k/platform/68328/ints.c
> +++ b/arch/m68k/platform/68328/ints.c
> @@ -70,9 +70,6 @@ asmlinkage irqreturn_t inthandler7(void);
>
>   extern e_vector *_ramvec;
>
> -/* The number of spurious interrupts */
> -volatile unsigned int num_spurious;
> -
>   /* The 68k family did not have a good way to determine the source
>    * of interrupts until later in the family.  The EC000 core does
>    * not provide the vector number on the stack, we vector everything
> diff --git a/arch/m68k/platform/68360/entry.S b/arch/m68k/platform/68360/entry.S
> index a07b14f..53b6027 100644
> --- a/arch/m68k/platform/68360/entry.S
> +++ b/arch/m68k/platform/68360/entry.S
> @@ -157,7 +157,7 @@ ret_from_interrupt:
>    * Handler for uninitialized and spurious interrupts.
>    */
>   bad_interrupt:
> -	addql	#1,num_spurious
> +	addql	#1,irq_err_count
>   	rte
>
>   /*
> diff --git a/arch/m68k/platform/68360/ints.c b/arch/m68k/platform/68360/ints.c
> index 4af0f4e..2cd5462 100644
> --- a/arch/m68k/platform/68360/ints.c
> +++ b/arch/m68k/platform/68360/ints.c
> @@ -34,9 +34,6 @@ asmlinkage void inthandler(void);
>
>   extern void *_ramvec[];
>
> -/* The number of spurious interrupts */
> -volatile unsigned int num_spurious;
> -
>   static void intc_irq_unmask(struct irq_data *d)
>   {
>   	pquicc->intr_cimr |= (1<<  d->irq);


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
