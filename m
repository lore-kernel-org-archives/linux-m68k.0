From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 10/17] [m68k] Atari: use dedicated irq_chip for timer D interrupts
Date: Sun, 10 Feb 2013 16:50:53 +0100
Message-ID: <CAMuHMdUC0kMpg09MtD2DYHCviBkF-OuLKznJHqDu5n6-wioKpw@mail.gmail.com>
References: <20130131002433.90B12360095@xplor.waratah.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:37400 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755581Ab3BJPuy (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Feb 2013 10:50:54 -0500
Received: by mail-ie0-f182.google.com with SMTP id k14so6838260iea.27
        for <linux-m68k@vger.kernel.org>; Sun, 10 Feb 2013 07:50:54 -0800 (PST)
In-Reply-To: <20130131002433.90B12360095@xplor.waratah.dyndns.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org

On Thu, Jan 31, 2013 at 1:24 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> --- a/arch/m68k/atari/ataints.c
> +++ b/arch/m68k/atari/ataints.c

> @@ -198,6 +254,26 @@ void __init atari_init_IRQ(void)
>         /* Initialize the PSG: all sounds off, both ports output */
>         sound_ym.rd_data_reg_sel = 7;
>         sound_ym.wd_data = 0xff;
> +
> +       m68k_setup_irq_controller(&atari_mfptimer_chip, handle_polled_irq,
> +                                 IRQ_MFP_TIMER1, 8);
> +       /* possibly unneeded */
> +       m68k_setup_irq_controller(&atari_irq_chip, handle_simple_irq,
> +                                 IRQ_MFP_TIMD, 1);

Indeed, this is already handled for all NUM_ATARI_SOURCES at the top of
the function.

> +       /* prepare timer D data for use as poll interrupt */
> +       /* set Timer D data Register - needs to be > 0 */
> +       st_mfp.tim_dt_d = 254;  /* < 100 Hz */
> +       /* start timer D, div = 1:100 */
> +       st_mfp.tim_ct_cd = (st_mfp.tim_ct_cd & 0xf0) | 0x6;
> +
> +       /* do we need this one ? */
> +       m68k_irq_startup_irq(IRQ_MFP_TIMD);

Probably not, as you remove it again in patch 12/17.

> --- a/arch/m68k/atari/config.c
> +++ b/arch/m68k/atari/config.c
> @@ -692,7 +692,7 @@ static struct platform_device *atari_ethernat_devices[] __initdata = {
>
>  #define ATARI_ETHERNEC_PHYS_ADDR       0xfffa0000
>  #define ATARI_ETHERNEC_BASE            0x300
> -#define ATARI_ETHERNEC_IRQ             IRQ_MFP_TIMD
> +#define ATARI_ETHERNEC_IRQ             IRQ_MFP_TIMER1

This part belongs in patch 06/17. Please reorder the patches so this one, which
adds the Timer D infrastructure), comes before the patches that add its users.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
