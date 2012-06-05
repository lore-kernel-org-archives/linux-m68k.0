From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 6/11] Atari: new EtherNEC driver (ne.c)
Date: Tue, 5 Jun 2012 22:16:29 +0200
Message-ID: <CAMuHMdVSJ0etRcKUZTPKh_mq8Lz-GK+Ys5QWfq3e9BrsNoN=cA@mail.gmail.com>
References: <E1SXMG4-0002Xo-BD@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gh0-f174.google.com ([209.85.160.174]:53223 "EHLO
	mail-gh0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751559Ab2FEUQa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 5 Jun 2012 16:16:30 -0400
Received: by ghrr11 with SMTP id r11so4692451ghr.19
        for <linux-m68k@vger.kernel.org>; Tue, 05 Jun 2012 13:16:30 -0700 (PDT)
In-Reply-To: <E1SXMG4-0002Xo-BD@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

On Thu, May 24, 2012 at 2:50 AM, Michael Schmitz
<schmitz@zirkon.biophys.uni-duesseldorf.de> wrote:
> diff --git a/drivers/net/ethernet/8390/Makefile b/drivers/net/etherne=
t/8390/Makefile
> index 8513e8d..f1ef3b8 100644
> --- a/drivers/net/ethernet/8390/Makefile
> +++ b/drivers/net/ethernet/8390/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_MAC8390) +=3D mac8390.o
> =C2=A0obj-$(CONFIG_AC3200) +=3D ac3200.o 8390.o
> =C2=A0obj-$(CONFIG_APNE) +=3D apne.o 8390.o
> =C2=A0obj-$(CONFIG_ARM_ETHERH) +=3D etherh.o
> +obj-$(CONFIG_ATARI_ETHERNEC) +=3D ne.o 8390p.o

This duplicates the line for CONFIG_NE2000. You can remove it, if you
make CONFIG_NE2000 selectable on Atari (see below).

> =C2=A0obj-$(CONFIG_ATARI_ETHERNEC_OLD) +=3D atari_ethernec.o 8390.o
> =C2=A0obj-$(CONFIG_AX88796) +=3D ax88796.o
> =C2=A0obj-$(CONFIG_E2100) +=3D e2100.o 8390.o

> diff --git a/drivers/net/ethernet/8390/Kconfig b/drivers/net/ethernet=
/8390/Kconfig
> index 4501c75..3a03d50 100644
> --- a/drivers/net/ethernet/8390/Kconfig
> +++ b/drivers/net/ethernet/8390/Kconfig
> @@ -223,6 +223,17 @@ config APNE
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0To compile this driver as a module,=
 choose M here: the module
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will be called apne.
>
> +config ATARI_ETHERNEC
> + =C2=A0 =C2=A0 =C2=A0 tristate "Atari EtherNEC Ethernet support"

I would make this bool, and move this section to arch/m68k/Kconfig.devi=
ces.
Then CONFIG_ATARI_ETHERNEC can control the creation of the platform
devices.

After that, you still need a way to make CONFIG_NE2000 selectable. E.g.
in drivers/net/ethernet/8390/Kconfig:

 config NE2000
         tristate "NE2000/NE1000 support"
-        depends on (ISA || (Q40 && m) || M32R || MACH_TX49XX)
+        depends on (ISA || (Q40 && m) || M32R || MACH_TX49XX || ATARI_=
ETHERNEC)

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
