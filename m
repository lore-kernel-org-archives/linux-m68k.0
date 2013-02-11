From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 06/17] [m68k] Atari: add platform support for EtherNEC (conditionalized)
Date: Mon, 11 Feb 2013 10:09:30 +0100
Message-ID: <CAMuHMdUkKaJ3QH6T3Se8A-piMZ-UsVDyDVLMsuMb8aZH8aZ=yw@mail.gmail.com>
References: <20130131001944.C85C0360095@xplor.waratah.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:56817 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754285Ab3BKJJa (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 11 Feb 2013 04:09:30 -0500
Received: by mail-ie0-f178.google.com with SMTP id c13so7249257ieb.37
        for <linux-m68k@vger.kernel.org>; Mon, 11 Feb 2013 01:09:30 -0800 (PST)
In-Reply-To: <20130131001944.C85C0360095@xplor.waratah.dyndns.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org

On Thu, Jan 31, 2013 at 1:19 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> +static struct resource rtl8019_resources[] = {
> +       [0] = {
> +               .name   = "rtl9019-regs",

rtl8019-regs

> +               .start  = ATARI_ETHERNEC_BASE,
> +               .end    = ATARI_ETHERNEC_BASE + 0x20 - 1,
> +               .flags  = IORESOURCE_IO,
> +       },
> +       [1] = {
> +               .name   = "rtl9019-irq",

rtl8019-irq

> +               .start  = ATARI_ETHERNEC_IRQ,
> +               .end    = ATARI_ETHERNEC_IRQ,
> +               .flags  = IORESOURCE_IRQ,
> +       },
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
