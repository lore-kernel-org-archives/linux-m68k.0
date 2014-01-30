From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/atari - ide: do not register interrupt if
 host->get_lock is set
Date: Thu, 30 Jan 2014 16:03:27 +0100
Message-ID: <CAMuHMdXNfcE8r4L9D=FkhjCubimsA45UjRPmfpgKwri2eGNJfQ@mail.gmail.com>
References: <1390896466-16446-1-git-send-email-schmitz@debian.org>
	<1390896466-16446-2-git-send-email-schmitz@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:35958 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751433AbaA3PD2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 30 Jan 2014 10:03:28 -0500
Received: by mail-pd0-f175.google.com with SMTP id w10so3095511pde.34
        for <linux-m68k@vger.kernel.org>; Thu, 30 Jan 2014 07:03:27 -0800 (PST)
In-Reply-To: <1390896466-16446-2-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Michael Schmitz <schmitz@debian.org>

On Tue, Jan 28, 2014 at 9:07 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> --- a/drivers/ide/ide-probe.c
> +++ b/drivers/ide/ide-probe.c
> @@ -853,8 +853,9 @@ static int init_irq (ide_hwif_t *hwif)
>         if (irq_handler == NULL)
>                 irq_handler = ide_intr;
>
> -       if (request_irq(hwif->irq, irq_handler, sa, hwif->name, hwif))
> -               goto out_up;
> +       if (!host->get_lock)
> +               if (request_irq(hwif->irq, irq_handler, sa, hwif->name, hwif))
> +                       goto out_up;

Don't you need a similar check for free_irq()?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
