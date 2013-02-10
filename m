From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 01/17] [m68k] Atari: declare original EtherNEC driver obsolete
Date: Sun, 10 Feb 2013 10:48:44 +0100
Message-ID: <CAMuHMdWUwDaaJ=3jebKdrtzU2bs04obskLCqP62Z+hcfZSUofA@mail.gmail.com>
References: <20130131001454.07088360095@xplor.waratah.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ia0-f169.google.com ([209.85.210.169]:34031 "EHLO
	mail-ia0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751362Ab3BJJsp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Feb 2013 04:48:45 -0500
Received: by mail-ia0-f169.google.com with SMTP id j5so5723527iaf.0
        for <linux-m68k@vger.kernel.org>; Sun, 10 Feb 2013 01:48:44 -0800 (PST)
In-Reply-To: <20130131001454.07088360095@xplor.waratah.dyndns.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org

On Thu, Jan 31, 2013 at 1:14 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>  drivers/net/Space.c                        |    2 +-
>  drivers/net/ethernet/8390/Kconfig          |    4 ++--
>  drivers/net/ethernet/8390/Makefile         |    2 +-
>  drivers/net/ethernet/8390/atari_ethernec.c |    6 +++---
>  4 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/net/Space.c b/drivers/net/Space.c
> index 77a43b1..fd183d2 100644
> --- a/drivers/net/Space.c
> +++ b/drivers/net/Space.c
> @@ -231,7 +231,7 @@ static struct devprobe2 m68k_probes[] __initdata = {
>  #ifdef CONFIG_ATARILANCE       /* Lance-based Atari ethernet boards */
>         {atarilance_probe, 0},
>  #endif
> -#ifdef CONFIG_ATARI_ETHERNEC   /* NE2000 based ROM port ethernet cards */
> +#ifdef CONFIG_ATARI_ETHERNEC_OLD       /* NE2000 based ROM port ethernet cards */
>         {atari_ethernec_probe, 0},
>  #endif
>  #ifdef CONFIG_SUN3LANCE         /* sun3 onboard Lance chip */
> diff --git a/drivers/net/ethernet/8390/Kconfig b/drivers/net/ethernet/8390/Kconfig
> index f3efe71..30acd4f 100644
> --- a/drivers/net/ethernet/8390/Kconfig
> +++ b/drivers/net/ethernet/8390/Kconfig
> @@ -226,8 +226,8 @@ config APNE
>           To compile this driver as a module, choose M here: the module
>           will be called apne.
>
> -config ATARI_ETHERNEC
> -       tristate "Atari EtherNEC Ethernet support"
> +config ATARI_ETHERNEC_OLD
> +       tristate "Atari EtherNEC Ethernet support - obsolete driver"
>         depends on ATARI_ROM_ISA
>         help
>           Say Y to include support for the EtherNEC network adapter for the
> diff --git a/drivers/net/ethernet/8390/Makefile b/drivers/net/ethernet/8390/Makefile
> index 73692bd..383f2be 100644
> --- a/drivers/net/ethernet/8390/Makefile
> +++ b/drivers/net/ethernet/8390/Makefile
> @@ -6,7 +6,7 @@ obj-$(CONFIG_MAC8390) += mac8390.o
>  obj-$(CONFIG_AC3200) += ac3200.o 8390.o
>  obj-$(CONFIG_APNE) += apne.o 8390.o
>  obj-$(CONFIG_ARM_ETHERH) += etherh.o
> -obj-$(CONFIG_ATARI_ETHERNEC) += atari_ethernec.o 8390.o
> +obj-$(CONFIG_ATARI_ETHERNEC_OLD) += atari_ethernec.o 8390.o
>  obj-$(CONFIG_AX88796) += ax88796.o
>  obj-$(CONFIG_E2100) += e2100.o 8390.o
>  obj-$(CONFIG_EL2) += 3c503.o 8390p.o

Please remove all CONFIG_ATARI_ETHERNEC_OLD hunks instead, including removing
drivers/net/ethernet/8390/atari_ethernec.c.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
