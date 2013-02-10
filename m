From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 06/17] [m68k] Atari: add platform support for EtherNEC (conditionalized)
Date: Sun, 10 Feb 2013 11:25:11 +0100
Message-ID: <CAMuHMdUjaJKNq7J909hF=L5=61ay8F38Dx=7MJSpti0nmy3sCg@mail.gmail.com>
References: <20130131001944.C85C0360095@xplor.waratah.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:49168 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753308Ab3BJKZM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Feb 2013 05:25:12 -0500
Received: by mail-ie0-f178.google.com with SMTP id c13so6796845ieb.9
        for <linux-m68k@vger.kernel.org>; Sun, 10 Feb 2013 02:25:11 -0800 (PST)
In-Reply-To: <20130131001944.C85C0360095@xplor.waratah.dyndns.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org

On Thu, Jan 31, 2013 at 1:19 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> --- a/arch/m68k/atari/config.c
> +++ b/arch/m68k/atari/config.c
>  int __init atari_platform_init(void)
>  {
> -       unsigned char *enatc_virt;
> -       int rv = -ENODEV;
> +       unsigned char *enatc_virt, *enec_virt;

enec_virt should be protected by #ifdef CONFIG_ATARI_ETHERNEC, cfr. my
comment for enatc_virt.

> +       int rv = -ENODEV, rv2 = -ENODEV;

0, not -ENODEV.

>
>         if (!MACH_IS_ATARI)
>                 return -ENODEV;
> @@ -706,6 +736,17 @@ int __init atari_platform_init(void)
>         iounmap(enatc_virt);
>  #endif
>
> +#if IS_ENABLED(CONFIG_ATARI_ETHERNEC)
> +       enec_virt = (unsigned char *)ioremap((ATARI_ETHERNEC_PHYS_ADDR), 0xf);
> +       if (hwreg_present(enec_virt)) {
> +               rv2 = platform_add_devices(atari_ethernec_devices, ARRAY_SIZE(atari_ethernec_devices));
> +       }
> +       iounmap(enec_virt);
> +#endif
> +
> +       if (rv2)
> +               return rv2;
> +
>         return rv;
>  }

I don't think it makes much sense to remember all this rv/rv2 errors.
The only things that can go wrong are -ENOMEM (no recovery possible anyway)
or -EBUSY (resource busy). If it was only the former, I would suggest
to immediately
return the error if platform_add_devices() fails.

If you think -EBUSY is something that can happen, I would handle multiple
registration like:

        int rv = 0;

        error = platform_add_devices(...);
        if (error && !rv)
                rv = error;

        error = platform_add_devices(...);
        if (error && !rv)
                rv = error;

        ...

        return rv;

so it returns the first error.

BTW, have you considered using platform_device_register_simple() instead of
platform_add_devices()? Cfr. arch/m68k/amiga/platform.c.
That will save memory if the hardware is not present:
  - the platform_device will be allocated dynamically, if needed,
  - the resources can be const and __initconst, so they are freed when initmem
    is freed, and they will also be allocated dynamically if needed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
