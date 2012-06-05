From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/11] Atari: obsolete old EtherNAT driver
Date: Tue, 5 Jun 2012 22:03:23 +0200
Message-ID: <CAMuHMdXYEBcKrXi-9X2wW9niNt+K2-2i2MKh4RGUCEz0HFL3Ug@mail.gmail.com>
References: <E1SXMCw-0002XZ-2q@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:33793 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751559Ab2FEUDY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 5 Jun 2012 16:03:24 -0400
Received: by yenm10 with SMTP id m10so4373758yen.19
        for <linux-m68k@vger.kernel.org>; Tue, 05 Jun 2012 13:03:24 -0700 (PDT)
In-Reply-To: <E1SXMCw-0002XZ-2q@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

On Thu, May 24, 2012 at 2:47 AM, Michael Schmitz
<schmitz@zirkon.biophys.uni-duesseldorf.de> wrote:
> diff --git a/drivers/net/ethernet/smsc/smc91x.h b/drivers/net/etherne=
t/smsc/smc91x.h
> index 799d494..7a536ff 100644
> --- a/drivers/net/ethernet/smsc/smc91x.h
> +++ b/drivers/net/ethernet/smsc/smc91x.h
> @@ -231,7 +231,7 @@ SMC_outw(u16 val, void __iomem *ioaddr, int reg)
>
> =C2=A0#include <unit/smc91111.h>
>
> -#elif defined(CONFIG_ATARI_ETHERNAT) || defined(CONFIG_ATARI_ETHERNA=
T_MODULE)
> +#elif defined(CONFIG_ATARI)
>
> =C2=A0#define SMC_CAN_USE_8BIT =C2=A0 =C2=A0 =C2=A0 =C2=A01
> =C2=A0#define SMC_CAN_USE_16BIT =C2=A0 =C2=A0 =C2=A0 1
> @@ -255,8 +255,6 @@ SMC_outw(u16 val, void __iomem *ioaddr, int reg)
> =C2=A0#define RPC_LSA_DEFAULT =C2=A0 =C2=A0 =C2=A0 =C2=A0 RPC_LED_100=
_10
> =C2=A0#define RPC_LSB_DEFAULT =C2=A0 =C2=A0 =C2=A0 =C2=A0 RPC_LED_TX_=
RX
>
> -#define SMC_DYNAMIC_BUS_CONFIG
> -
> =C2=A0#elif defined(CONFIG_ARCH_MSM)
>
> =C2=A0#define SMC_CAN_USE_8BIT =C2=A0 =C2=A0 =C2=A0 0
> @@ -1142,7 +1140,7 @@ static const char * chip_ids[ 16 ] =3D =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0} while (0)
>
> -#if defined(CONFIG_ATARI_ETHERNAT) || defined(CONFIG_ATARI_ETHERNAT_=
MODULE)
> +#if defined(CONFIG_ATARI)
> =C2=A0/*
> =C2=A0* MSch: EtherNAT is 32 bit, so the misaligned data buffer hack =
applies.
> =C2=A0* This appears to hurt quite a lot ... we actually need to byte=
 swap the

This part we'll have to do differently, as it depends on the old EtherN=
AT
driver having been present first, which is not true for mainline.

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
