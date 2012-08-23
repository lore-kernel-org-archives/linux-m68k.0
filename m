From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] Add support to broadcom 5222 PHY
Date: Thu, 23 Aug 2012 12:47:07 +0200
Message-ID: <CAMuHMdUo5UPLtUhf6_GafMj_kEnM25k+XYszdwsGwkGyCUC6zw__18465.4683144347$1345719232$gmane$org@mail.gmail.com>
References: <1345551531-15348-1-git-send-email-stany.marcel@novasys-ingenierie.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1345551531-15348-1-git-send-email-stany.marcel@novasys-ingenierie.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On Tue, Aug 21, 2012 at 2:18 PM, Stany MARCEL
<stany.marcel@novasys-ingenierie.com> wrote:
> Signed-off-by: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
> ---
>
>  This driver is an adaption of the one given by freescale for kernel 2.6.25.
>
>  Tested with kernel 3.4.8 with arch/m68k backported from linux-m68k head
>  2 FEC configured with shared phy
>
>  drivers/net/phy/Kconfig        |    7 +-
>  drivers/net/phy/Makefile       |    1 +
>  drivers/net/phy/broadcom522x.c |  171 ++++++++++++++++++++++++++++++++++++++++

This patch and "[PATCH 3/3] Add support to M54xx DMA FEC Driver" need to go
through the netdev tree, or collect acks there.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
