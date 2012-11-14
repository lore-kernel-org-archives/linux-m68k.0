From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] SUN3: Get interrupts working again
Date: Wed, 14 Nov 2012 08:46:31 +0100
Message-ID: <CAMuHMdXYj5fwcM9ef7eujmzb7hrMpOfVcJANEhi3FdQW0kAbcw@mail.gmail.com>
References: <20121111122833.B5FB71DBC2@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20121111122833.B5FB71DBC2@solo.franken.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-m68k@lists.linux-m68k.org, sammy@sammy.net

On Sun, Nov 11, 2012 at 1:28 PM, Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> SUN3 Intregister is not for enabling individual interrupts, but to enable
> special interrupts. So using it for interrupt enable/disable was wrong.
> The clock interrupt needs some special treatment to keep ticking.
>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Thanks, will queue for 3.8.

> ---
>
>  arch/m68k/sun3/sun3ints.c |   29 ++++-------------------------
>  1 files changed, 4 insertions(+), 25 deletions(-)
>
> diff --git a/arch/m68k/sun3/sun3ints.c b/arch/m68k/sun3/sun3ints.c
> index 78b60f5..6bbca30 100644
> --- a/arch/m68k/sun3/sun3ints.c
> +++ b/arch/m68k/sun3/sun3ints.c
> @@ -66,6 +66,8 @@ static irqreturn_t sun3_int5(int irq, void *dev_id)
>  #ifdef CONFIG_SUN3
>         intersil_clear();
>  #endif
> +       sun3_disable_irq(5);
> +       sun3_enable_irq(5);
>  #ifdef CONFIG_SUN3
>         intersil_clear();
>  #endif
> @@ -79,41 +81,18 @@ static irqreturn_t sun3_int5(int irq, void *dev_id)
>
>  static irqreturn_t sun3_vec255(int irq, void *dev_id)
>  {
> -//     intersil_clear();
>         return IRQ_HANDLED;
>  }
>
> -static void sun3_irq_enable(struct irq_data *data)
> -{
> -    sun3_enable_irq(data->irq);
> -};
> -
> -static void sun3_irq_disable(struct irq_data *data)
> -{
> -    sun3_disable_irq(data->irq);
> -};
> -
> -static struct irq_chip sun3_irq_chip = {
> -       .name           = "sun3",
> -       .irq_startup    = m68k_irq_startup,
> -       .irq_shutdown   = m68k_irq_shutdown,
> -       .irq_enable     = sun3_irq_enable,
> -       .irq_disable    = sun3_irq_disable,
> -       .irq_mask       = sun3_irq_disable,
> -       .irq_unmask     = sun3_irq_enable,
> -};
> -
>  void __init sun3_init_IRQ(void)
>  {
>         *sun3_intreg = 1;
>
> -       m68k_setup_irq_controller(&sun3_irq_chip, handle_level_irq, IRQ_AUTO_1,
> -                                 7);
>         m68k_setup_user_interrupt(VEC_USER, 128);
>
> -       if (request_irq(IRQ_AUTO_5, sun3_int5, 0, "int5", NULL))
> +       if (request_irq(IRQ_AUTO_5, sun3_int5, 0, "clock", NULL))
>                 pr_err("Couldn't register %s interrupt\n", "int5");
> -       if (request_irq(IRQ_AUTO_7, sun3_int7, 0, "int7", NULL))
> +       if (request_irq(IRQ_AUTO_7, sun3_int7, 0, "nmi", NULL))
>                 pr_err("Couldn't register %s interrupt\n", "int7");
>         if (request_irq(IRQ_USER+127, sun3_vec255, 0, "vec255", NULL))
>                 pr_err("Couldn't register %s interrupt\n", "vec255");

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
