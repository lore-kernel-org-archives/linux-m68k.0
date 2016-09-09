From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: generalize uboot command line support
Date: Fri, 9 Sep 2016 08:20:05 +0200
Message-ID: <CAMuHMdVTKUNy49py59+PTAT+DBhgewj1cShW7qT=1zjXnzpD9Q@mail.gmail.com>
References: <1473383418-4824-1-git-send-email-gerg@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:36071 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751096AbcIIGbq (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 9 Sep 2016 02:31:46 -0400
Received: by mail-oi0-f66.google.com with SMTP id s71so5430564oih.3
        for <linux-m68k@vger.kernel.org>; Thu, 08 Sep 2016 23:31:46 -0700 (PDT)
In-Reply-To: <1473383418-4824-1-git-send-email-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Greg,

On Fri, Sep 9, 2016 at 3:10 AM, Greg Ungerer <gerg@linux-m68k.org> wrote:
> --- a/arch/m68k/include/asm/bootinfo.h
> +++ b/arch/m68k/include/asm/bootinfo.h
> @@ -22,6 +22,10 @@ extern void save_bootinfo(const struct bi_record *bi);
>  static inline void save_bootinfo(const struct bi_record *bi) {}
>  #endif
>
> +#ifdef CONFIG_UBOOT
> +void process_uboot_commandline(char *commandp, int size);
> +#endif

What about providing a dummy for the !CONFIG_UBOOT case..

> --- a/arch/m68k/kernel/setup_mm.c
> +++ b/arch/m68k/kernel/setup_mm.c
> @@ -274,6 +274,9 @@ void __init setup_arch(char **cmdline_p)
>         strncpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
>         m68k_command_line[CL_SIZE - 1] = 0;
>  #endif /* CONFIG_BOOTPARAM */
> +#if defined(CONFIG_UBOOT)
> +       process_uboot_commandline(&m68k_command_line[0], CL_SIZE);
> +#endif

... so you can drop the #if and #endif here?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
