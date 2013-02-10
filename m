From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 11/17] [m68k] Atari: add interrupt chip definition for
 EtherNAT CPLD interrupts (ethernet and USB)
Date: Sun, 10 Feb 2013 17:03:01 +0100
Message-ID: <CAMuHMdU3-qy1+mp7HRc9pxTWCZ3T0Zm00go009NqVZY+1MD5nw@mail.gmail.com>
References: <20130131002753.D0C79360095@xplor.waratah.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ia0-f172.google.com ([209.85.210.172]:63666 "EHLO
	mail-ia0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754799Ab3BJQDC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Feb 2013 11:03:02 -0500
Received: by mail-ia0-f172.google.com with SMTP id u8so5789847iag.31
        for <linux-m68k@vger.kernel.org>; Sun, 10 Feb 2013 08:03:01 -0800 (PST)
In-Reply-To: <20130131002753.D0C79360095@xplor.waratah.dyndns.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org

On Thu, Jan 31, 2013 at 1:27 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> --- a/arch/m68k/atari/ataints.c
> +++ b/arch/m68k/atari/ataints.c
> @@ -177,6 +178,74 @@ static struct irq_chip atari_mfptimer_chip = {
>         .irq_disable    = atari_mfptimer_disable,
>  };
>
> +
> +/*
> + * EtherNAT CPLD interrupt handling
> + * CPLD interrupt register is at phys. 0x80000023
> + * Need this mapped in at interrupt startup time
> + */
> +
> +#define ATARI_ETHERNAT_PHYS_ADDR       0x80000000

We also have this definition in arch/m68k/atari/ataints.c.
Can you move it to a header file?

> +unsigned char *enat_cpld;

static

> +
> +static unsigned int atari_ethernat_startup(struct irq_data *data)
> +{
> +       int enat_num = 140 - data->irq + 1;
> +
> +       m68k_irq_startup(data);
> +       /*
> +       * map and probe CPLD interrupt register
> +       * - note we don't need to probe here; already done in config.c
> +       */
> +       enat_cpld = (unsigned char *)ioremap((ATARI_ETHERNAT_PHYS_ADDR+0x23), 0x2);

I don't like ioremap() being called in this context. It can fail.
Can this function be called multiple times without calls to
atari_ethernat_shutdown()?
In that case we leak mappings.

Perhaps we should just keep the mapping from atari_platform_init() and
reuse that?

> +       /*
> +        * do _not_ enable the USB chip interrupt here - causes interrupt storm
> +        * and triggers dead interrupt watchdog
> +        * Need to reset the USB chip to a sane state in early startup before removing this hack
> +        */
> +       if (enat_num == 1)
> +               *enat_cpld |= 1 << enat_num;
> +       /*
> +        * debug printk will go away once driver is debugged
> +        */
> +       /* barrier();
> +       printk(KERN_INFO "atari_ethernat_startup: cpld io %p mask %x\n", enat_cpld, *enat_cpld); */

Remove the commented-out code.

> +       return 0;
> +}
> +
> +static void atari_ethernat_enable(struct irq_data *data)
> +{
> +       int enat_num = 140 - data->irq + 1;
> +       *enat_cpld |= 1 << enat_num;
> +       /* barrier();
> +       printk(KERN_INFO "atari_ethernat_enable: irq %d num %d mask %x\n", data->irq, enat_num, *enat_cpld); */

Remove the commented-out code.

> +}
> +
> +static void atari_ethernat_disable(struct irq_data *data)
> +{
> +       int enat_num = 140 - data->irq + 1;
> +       *enat_cpld &= ~(1 << enat_num);
> +       /* barrier();
> +       printk(KERN_INFO "atari_ethernat_disable: irq %d num %d mask %x\n", data->irq, enat_num, *enat_cpld); */

Remove the commented-out code.

> +}
> +
> +static void atari_ethernat_shutdown(struct irq_data *data)
> +{
> +       int enat_num = 140 - data->irq + 1;
> +       *enat_cpld &= ~(1 << enat_num);
> +       /* barrier();
> +       printk(KERN_INFO "atari_ethernat_shutdown: irq %d num %d mask %x\n", data->irq, enat_num, *enat_cpld); */

Remove the commented-out code.

> +       iounmap(enat_cpld);
> +}
> +
> +static struct irq_chip atari_ethernat_chip = {
> +       .name           = "ethernat",
> +       .irq_startup    = atari_ethernat_startup,
> +       .irq_shutdown   = atari_ethernat_shutdown,
> +       .irq_enable     = atari_ethernat_enable,
> +       .irq_disable    = atari_ethernat_disable,
> +};
> +
>  /*
>   * void atari_init_IRQ (void)
>   *
> @@ -255,6 +324,11 @@ void __init atari_init_IRQ(void)
>         sound_ym.rd_data_reg_sel = 7;
>         sound_ym.wd_data = 0xff;
>
> +       /*
> +        * EtherNEC / NetUSBee timer D multiplexer - need to use polled_irq
> +        * to avoid unhandled interrupts triggering dead interrupt watchdog
> +        */
> +

This comment should have been added in patch 10/17.

>         m68k_setup_irq_controller(&atari_mfptimer_chip, handle_polled_irq,
>                                   IRQ_MFP_TIMER1, 8);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
