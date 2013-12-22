From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/irq - use polled IRQ flag for MFP timer cascaded interrupts
Date: Sun, 22 Dec 2013 12:53:07 +0100
Message-ID: <CAMuHMdXwXi6jeKz0TJPm9iHBBC8vfXrJnG19+Vogq32zr79zmw@mail.gmail.com>
References: <1387611538-18305-1-git-send-email-schmitz@debian.org>
	<1387611538-18305-2-git-send-email-schmitz@debian.org>
	<CAMuHMdWirPo7HSsBiLdQDKdMmP4sjKEhcB1hfW0HabhkpQ-Jxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWirPo7HSsBiLdQDKdMmP4sjKEhcB1hfW0HabhkpQ-Jxg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

>

Missing SoB.

> ---
>  arch/m68k/atari/ataints.c |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/arch/m68k/atari/ataints.c b/arch/m68k/atari/ataints.c
> index 90f7a48..3e73a63 100644
> --- a/arch/m68k/atari/ataints.c
> +++ b/arch/m68k/atari/ataints.c
> @@ -330,9 +330,12 @@ void __init atari_init_IRQ(void)
>         sound_ym.rd_data_reg_sel = 7;
>         sound_ym.wd_data = 0xff;
>
> -       m68k_setup_irq_controller(&atari_mfptimer_chip, handle_polled_irq,
> +       m68k_setup_irq_controller(&atari_mfptimer_chip, handle_simple_irq,
>                                   IRQ_MFP_TIMER1, 8);
>
> +       irq_set_status_flags(IRQ_MFP_TIMER1, IRQ_IS_POLLED);
> +       irq_set_status_flags(IRQ_MFP_TIMER2, IRQ_IS_POLLED);

Why do you set this flag for timer 2, too? Timer D is timer1, right?

> +
>         /* prepare timer D data for use as poll interrupt */
>         /* set Timer D data Register - needs to be > 0 */
>         st_mfp.tim_dt_d = 254;  /* < 100 Hz */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
