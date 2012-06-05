From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 7/11] Atari: new EtherNAT driver (smc91x.c)
Date: Tue, 5 Jun 2012 22:20:37 +0200
Message-ID: <CAMuHMdUQkwr4ppn_cd4CneRwP-zZ0D7ZL1+op0nuULuba_a94w@mail.gmail.com>
References: <E1SXMGd-0002Xs-JU@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:62286 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750899Ab2FEUUh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 5 Jun 2012 16:20:37 -0400
Received: by yenm10 with SMTP id m10so4390892yen.19
        for <linux-m68k@vger.kernel.org>; Tue, 05 Jun 2012 13:20:37 -0700 (PDT)
In-Reply-To: <E1SXMGd-0002Xs-JU@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

On Thu, May 24, 2012 at 2:51 AM, Michael Schmitz
<schmitz@zirkon.biophys.uni-duesseldorf.de> wrote:
> --- a/drivers/net/ethernet/smsc/Kconfig
> +++ b/drivers/net/ethernet/smsc/Kconfig
> @@ -19,6 +19,21 @@ config NET_VENDOR_SMSC
>
> =C2=A0if NET_VENDOR_SMSC
>
> +config ATARI_ETHERNAT
> + =C2=A0 =C2=A0 =C2=A0 tristate "Atari EtherNAT Ethernet support"

Same here like for ETHERNEC: Make it bool and move it to
arch/m68k/Kconfig.devices


> --- a/drivers/net/ethernet/smsc/Makefile
> +++ b/drivers/net/ethernet/smsc/Makefile
> @@ -2,6 +2,7 @@
> =C2=A0# Makefile for the SMSC network device drivers.
> =C2=A0#
>
> +obj-$(CONFIG_ATARI_ETHERNAT) +=3D smc91x.o

Duplicate of CONFIG_SMC91X, remove, and make
SMC91X depend on "|| ATARI_ETHERNAT" in
drivers/net/ethernet/smsc/Kconfig.

> --- a/drivers/net/ethernet/smsc/smc91x.h
> +++ b/drivers/net/ethernet/smsc/smc91x.h
> @@ -255,6 +255,8 @@ SMC_outw(u16 val, void __iomem *ioaddr, int reg)
> =C2=A0#define RPC_LSA_DEFAULT =C2=A0 =C2=A0 =C2=A0 =C2=A0 RPC_LED_100=
_10
> =C2=A0#define RPC_LSB_DEFAULT =C2=A0 =C2=A0 =C2=A0 =C2=A0 RPC_LED_TX_=
RX
>
> +#define SMC_IRQ_FLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(IRQF_SHARED=
)
> +
> =C2=A0#elif defined(CONFIG_ARCH_MSM)
>
> =C2=A0#define SMC_CAN_USE_8BIT =C2=A0 =C2=A0 =C2=A0 0

To be updated, as it depends on ETHERNAT_OLD being available.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
