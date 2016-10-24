From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2] M68K: Fine-tuning for two function implementations
Date: Mon, 24 Oct 2016 11:10:32 +0200
Message-ID: <CAMuHMdXauQCvyxCHD0vGmPe6SgO-M+J3PnQ9B3WoeSF9gJN+Eg__22020.0368938551$1477300275$gmane$org@mail.gmail.com>
References: <cc9b366d-4d5e-3ed6-4665-cbc577c69f74@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <cc9b366d-4d5e-3ed6-4665-cbc577c69f74@users.sourceforge.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Arnd Bergmann <arnd@arndb.de>, Finn Thain <fthain@telegraphics.com.au>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Sun, Oct 23, 2016 at 11:10 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 23 Oct 2016 23:05:23 +0200
>
> A few update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (2):
>   Use seq_puts() in amiga_get_hardware_list()
>   Use seq_puts() in atari_get_hardware_list()

Thanks, will apply and queue for v4.10, after changing the one line summary
prefixes with prefixes matching the subsystem
(e.g. "s@M68K-Amiga@m68k/amiga@").

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
