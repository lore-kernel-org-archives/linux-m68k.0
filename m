From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH RESEND 3/4] m68k/mvme16x: adopt common boot console
Date: Fri, 11 Apr 2014 11:19:32 +0200
Message-ID: <CAMuHMdVVHbyQQq8-OVTOmzNzSzco6jUu7YpVDcLUKw4s1tKiUg@mail.gmail.com>
References: <20140411052757.888960081@telegraphics.com.au>
	<20140411052758.849384587@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:37801 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756340AbaDKJTe (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 11 Apr 2014 05:19:34 -0400
Received: by mail-la0-f41.google.com with SMTP id gl10so3333496lab.0
        for <linux-m68k@vger.kernel.org>; Fri, 11 Apr 2014 02:19:32 -0700 (PDT)
In-Reply-To: <20140411052758.849384587@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Michael Schmitz <schmitz@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,

On Fri, Apr 11, 2014 at 7:28 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> In a multi-platform kernel binary we only need one early console instance.
> The difficulty here is that the common early console gets started by
> early_param(), whereas the MVME16x instance would be started later by
> config_mvme16x(). That means some interrupt setup must be done earlier.

Thanks!

> --- linux-m68k.orig/arch/m68k/kernel/early_printk.c     2014-03-03 10:29:59.000000000 +1100
> +++ linux-m68k/arch/m68k/kernel/early_printk.c  2014-03-03 10:30:01.000000000 +1100

> +#ifdef CONFIG_MVME16X
> +static struct console early_console_instance = {
> +#else
>  static struct console early_console_instance __initdata = {
> +#endif

> +       if (MACH_IS_MVME16x)
> +               early_console_instance.write = mvme16x_cons_write;
> +       else
> +               early_console_instance.write = debug_cons_write;

> +       if (!early_console || MACH_IS_MVME16x)
>                 return 0;

I don't like these tests for MVME16X in (presumably) generic code.
Is there a way we can avoid this?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
