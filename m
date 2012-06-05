From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/11] Atari: change number of interrupt sources
Date: Tue, 5 Jun 2012 22:42:04 +0200
Message-ID: <CAMuHMdVXZGJmhLvQ-rfPGXHd7p90dDuSd95SZT0uBnShbYY5Rg@mail.gmail.com>
References: <E1SXMBV-0002XQ-JI@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:56659 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751888Ab2FEUmF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 5 Jun 2012 16:42:05 -0400
Received: by yhmm54 with SMTP id m54so4286353yhm.19
        for <linux-m68k@vger.kernel.org>; Tue, 05 Jun 2012 13:42:05 -0700 (PDT)
In-Reply-To: <E1SXMBV-0002XQ-JI@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

On Thu, May 24, 2012 at 2:45 AM, Michael Schmitz
<schmitz@zirkon.biophys.uni-duesseldorf.de> wrote:
> diff --git a/arch/m68k/include/asm/atariints.h b/arch/m68k/include/as=
m/atariints.h
> index 5fc13bd..12c759a 100644
> --- a/arch/m68k/include/asm/atariints.h
> +++ b/arch/m68k/include/asm/atariints.h
> @@ -32,7 +32,7 @@
> =C2=A0#define VME_SOURCE_BASE =C2=A0 =C2=A056
> =C2=A0#define VME_MAX_SOURCES =C2=A0 =C2=A016
>
> -#define NUM_ATARI_SOURCES =C2=A0 (VME_SOURCE_BASE+VME_MAX_SOURCES-ST=
MFP_SOURCE_BASE)
> +#define NUM_ATARI_SOURCES =C2=A0141

This warrants a comment.

> diff --git a/arch/m68k/include/asm/irq.h b/arch/m68k/include/asm/irq.=
h
> index c1155f0..8bd9c7f 100644
> --- a/arch/m68k/include/asm/irq.h
> +++ b/arch/m68k/include/asm/irq.h
> @@ -9,9 +9,11 @@
> =C2=A0*/
> =C2=A0#if defined(CONFIG_COLDFIRE)
> =C2=A0#define NR_IRQS 256
> -#elif defined(CONFIG_VME) || defined(CONFIG_SUN3) || defined(CONFIG_=
SUN3X)
> +#elif defined(CONFIG_VME) || defined(CONFIG_SUN3) || defined(CONFIG_=
SUN3X)

Bogus whitespace change (checkpatch should have told you).

> =C2=A0#define NR_IRQS 200
> -#elif defined(CONFIG_ATARI) || defined(CONFIG_MAC)
> +#elif defined(CONFIG_ATARI)
> +#define NR_IRQS 141

This is the (not configurable) EtherNAT interrupt number + 1?

> +#elif defined(CONFIG_MAC)
> =C2=A0#define NR_IRQS 72
> =C2=A0#elif defined(CONFIG_Q40)
> =C2=A0#define NR_IRQS =C2=A0 =C2=A0 =C2=A0 =C2=A043

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
