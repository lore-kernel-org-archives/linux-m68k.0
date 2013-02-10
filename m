From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 05/17] [m68k] Atari: fix EtherNAT interrupt number;
 conditionalize EtherNAT platform device register
Date: Sun, 10 Feb 2013 11:06:41 +0100
Message-ID: <CAMuHMdWnEMVbzmkJVNDU+AJ6vSY+JFXgqRJvoCx=jZXo+M-fFg@mail.gmail.com>
References: <20130131001847.C4D70360095@xplor.waratah.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ia0-f171.google.com ([209.85.210.171]:44645 "EHLO
	mail-ia0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751480Ab3BJKGm (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Feb 2013 05:06:42 -0500
Received: by mail-ia0-f171.google.com with SMTP id z13so5658647iaz.30
        for <linux-m68k@vger.kernel.org>; Sun, 10 Feb 2013 02:06:41 -0800 (PST)
In-Reply-To: <20130131001847.C4D70360095@xplor.waratah.dyndns.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org

On Thu, Jan 31, 2013 at 1:18 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> [PATCH 05/17] [m68k] Atari: fix EtherNAT interrupt number; conditionalize EtherNAT platform device register

To be folded into

m68k-queue/m68k-atari-Initial-EtherNAT-SMC91C111-driver.patch
m68k-queue/m68k-atari-Add-missing-platform-check-before-registe.patch

> --- a/arch/m68k/atari/config.c
> +++ b/arch/m68k/atari/config.c
> @@ -686,16 +686,27 @@ static struct platform_device smc91x_device = {
>         .resource       = smc91x_resources,
>  };
>
> -static struct platform_device *atari_platform_devices[] __initdata = {
> +static struct platform_device *atari_ethernat_devices[] __initdata = {
>         &smc91x_device
>  };
>
>  int __init atari_platform_init(void)
>  {
> +       unsigned char *enatc_virt;

This should be protected by #ifdef CONFIG_ATARI_ETHERNAT too, else you
get an unused
compiler warning if CONFIG_ATARI_ETHERNAT is disabled.
Move it to the block below, inside "{ ... }"?

> +       int rv = -ENODEV;

0? Else it will return -ENODEV if ETHERNAT is disabled or not found.

> +
>         if (!MACH_IS_ATARI)
>                 return -ENODEV;
>
> -       return platform_add_devices(atari_platform_devices, ARRAY_SIZE(atari_platform_devices));
> +#if IS_ENABLED(CONFIG_ATARI_ETHERNAT)
> +       enatc_virt = (unsigned char *)ioremap((ATARI_ETHERNAT_PHYS_ADDR+0x23), 0xf);
> +       if (hwreg_present(enatc_virt)) {
> +               rv = platform_add_devices(atari_ethernat_devices, ARRAY_SIZE(atari_ethernat_devices));
> +       }
> +       iounmap(enatc_virt);
> +#endif
> +
> +       return rv;
>  }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
