From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68knommu: clean up uClinux boot log output
Date: Fri, 9 Sep 2016 08:21:58 +0200
Message-ID: <CAMuHMdWyQ_8He0MYr81cQ+mfSHMQBU-BLh8HmFNAFzZK_NwTVA@mail.gmail.com>
References: <1473383446-4861-1-git-send-email-gerg@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:35696 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751096AbcIIGV7 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 9 Sep 2016 02:21:59 -0400
Received: by mail-oi0-f66.google.com with SMTP id 2so8364646oif.2
        for <linux-m68k@vger.kernel.org>; Thu, 08 Sep 2016 23:21:59 -0700 (PDT)
In-Reply-To: <1473383446-4861-1-git-send-email-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Fri, Sep 9, 2016 at 3:10 AM, Greg Ungerer <gerg@linux-m68k.org> wrote:
> --- a/arch/m68k/kernel/setup_no.c
> +++ b/arch/m68k/kernel/setup_no.c
> @@ -106,7 +106,7 @@ void __init setup_arch(char **cmdline_p)
>         process_uboot_commandline(&command_line[0], sizeof(command_line));
>  #endif /* CONFIG_UBOOT */
>
> -       printk(KERN_INFO "\x0F\r\n\nuClinux/" CPU_NAME "\n");
> +       printk(KERN_INFO "uClinux with CPU " CPU_NAME "\n");

pr_info() while you're at it?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
