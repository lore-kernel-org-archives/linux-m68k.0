From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/4] Implement gpio support for m54xx.
Date: Thu, 22 May 2014 08:39:07 +0200
Message-ID: <CAMuHMdVUNSJEGMFC2sM_=nqxt8_QXgaErX71cHA7VQGAXsQVeA@mail.gmail.com>
References: <1400713233-9155-1-git-send-email-sfking@fdwdc.com>
	<1400713233-9155-5-git-send-email-sfking@fdwdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ig0-f180.google.com ([209.85.213.180]:58731 "EHLO
	mail-ig0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751038AbaEVGjI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 May 2014 02:39:08 -0400
Received: by mail-ig0-f180.google.com with SMTP id c1so3138882igq.7
        for <linux-m68k@vger.kernel.org>; Wed, 21 May 2014 23:39:07 -0700 (PDT)
In-Reply-To: <1400713233-9155-5-git-send-email-sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: steven king <sfking@fdwdc.com>
Cc: greg@uclinux.org, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, May 22, 2014 at 1:00 AM,  <sfking@fdwdc.com> wrote:
> +#define MCFGPIO_PODR           (MCF_MBAR + 0xA00)
> +#define MCFGPIO_PDDR           (MCF_MBAR + 0xA10)
> +#define MCFGPIO_PPDR           (MCF_MBAR + 0xA20)
> +#define MCFGPIO_SETR           (MCF_MBAR + 0xA20)

The above two are identical. Is that intentional?

> +#define MCFGPIO_CLRR           (MCF_MBAR + 0xA30)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
