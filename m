From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 8/11] Atari: add ISP16x host controller support
Date: Tue, 5 Jun 2012 22:37:31 +0200
Message-ID: <CAMuHMdUWygr2yVjgFxFTu+-GC-xXLv1+zsKstGZgYuZ_9=3SUA@mail.gmail.com>
References: <E1SXMHc-0002Xx-7A@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:45465 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750994Ab2FEUhc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 5 Jun 2012 16:37:32 -0400
Received: by yenm10 with SMTP id m10so4407496yen.19
        for <linux-m68k@vger.kernel.org>; Tue, 05 Jun 2012 13:37:32 -0700 (PDT)
In-Reply-To: <E1SXMHc-0002Xx-7A@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

On Thu, May 24, 2012 at 2:52 AM, Michael Schmitz
<schmitz@zirkon.biophys.uni-duesseldorf.de> wrote:
> --- a/arch/m68k/Kconfig.bus
> +++ b/arch/m68k/Kconfig.bus
> @@ -55,6 +55,17 @@ config ATARI_ROM_ISA
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The only driver currently using thi=
s adapter is the EtherNEC
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0driver for RTL8019AS based NE2000 c=
ompatible network cards.
>
> +config ATARI_USB
> + =C2=A0 =C2=A0 =C2=A0 bool "Atari USB host controller support"
> + =C2=A0 =C2=A0 =C2=A0 depends on ATARI
> + =C2=A0 =C2=A0 =C2=A0 select USB_SUPPORT
> + =C2=A0 =C2=A0 =C2=A0 select USB_ARCH_HAS_HCD

Nothing actually uses CONFIG_ATARI_USB, it's just used to select USB_SU=
PPORT
and USB_ARCH_HAS_HCD?
Perhaps you can make the platform device creation depend on this?

> diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
> index adfc901..52bc0ce 100644
> --- a/arch/m68k/atari/config.c
> +++ b/arch/m68k/atari/config.c

> +/*
> + * EtherNEC: ISA NE2000 compatible card (i.e. Realtek 8019) via ROM-=
port adapter
> + */
> +
> =C2=A0#define ATARI_ETHERNEC_PHYS_ADDR =C2=A0 =C2=A0 =C2=A0 0xfffa000=
0
> =C2=A0#define ATARI_ETHERNEC_BASE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x300
> =C2=A0#define ATARI_ETHERNEC_IRQ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 IRQ_MFP_TIMD

This doesn't belong in this patch.

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
