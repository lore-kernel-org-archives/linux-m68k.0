From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 02/17] [m68k] Atari: declare original EtherNAT driver obsolete
Date: Sun, 10 Feb 2013 10:48:38 +0100
Message-ID: <CAMuHMdVdr+DoKBZe2bo_p4CZXRXHMpP-T1yNVdo5wRkSdQdbzg@mail.gmail.com>
References: <20130131001559.AFEFE360095@xplor.waratah.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ie0-f179.google.com ([209.85.223.179]:52995 "EHLO
	mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751362Ab3BJJsl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Feb 2013 04:48:41 -0500
Received: by mail-ie0-f179.google.com with SMTP id k11so6565789iea.38
        for <linux-m68k@vger.kernel.org>; Sun, 10 Feb 2013 01:48:40 -0800 (PST)
In-Reply-To: <20130131001559.AFEFE360095@xplor.waratah.dyndns.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org

On Thu, Jan 31, 2013 at 1:15 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> [PATCH 02/17] [m68k] Atari: declare original EtherNAT driver obsolete
>
>
> Signed-off-by: Michael Schmitz <schmitz@debian.org>
> ---
>  drivers/net/ethernet/smsc/Kconfig  |    4 ++--
>  drivers/net/ethernet/smsc/Makefile |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/ethernet/smsc/Kconfig b/drivers/net/ethernet/smsc/Kconfig
> index 01893aa..c273eac 100644
> --- a/drivers/net/ethernet/smsc/Kconfig
> +++ b/drivers/net/ethernet/smsc/Kconfig
> @@ -19,8 +19,8 @@ config NET_VENDOR_SMSC
>
>  if NET_VENDOR_SMSC
>
> -config ATARI_ETHERNAT
> -       tristate "Atari EtherNAT Ethernet support"
> +config ATARI_ETHERNAT_OLD
> +       tristate "Atari EtherNAT Ethernet support - obsolete driver"
>         select CRC32
>         select MII
>         depends on ATARI
> diff --git a/drivers/net/ethernet/smsc/Makefile b/drivers/net/ethernet/smsc/Makefile
> index ef228db..a1992fa 100644
> --- a/drivers/net/ethernet/smsc/Makefile
> +++ b/drivers/net/ethernet/smsc/Makefile
> @@ -2,7 +2,7 @@
>  # Makefile for the SMSC network device drivers.
>  #
>
> -obj-$(CONFIG_ATARI_ETHERNAT) += atari_91C111.o
> +obj-$(CONFIG_ATARI_ETHERNAT_OLD) += atari_91C111.o
>  obj-$(CONFIG_SMC9194) += smc9194.o
>  obj-$(CONFIG_SMC91X) += smc91x.o
>  obj-$(CONFIG_PCMCIA_SMC91C92) += smc91c92_cs.o
> --
> 1.7.0.4
>

Please remove all CONFIG_ATARI_ETHERNAT_OLD hunks instead, including removing
drivers/net/ethernet/smsc/atari_91C111.c.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
