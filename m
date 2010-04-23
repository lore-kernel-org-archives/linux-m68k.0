From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH -mm 06/12] m68k: use asm-generic/scatterlist.h
Date: Fri, 23 Apr 2010 10:29:04 +0200
Message-ID: <p2q10f740e81004230129rd5b07889m5ec7f453efd46403@mail.gmail.com>
References: <1270511567-18567-1-git-send-email-fujita.tomonori@lab.ntt.co.jp>
	 <1270511567-18567-7-git-send-email-fujita.tomonori@lab.ntt.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:52107 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750876Ab0DWI3J convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 23 Apr 2010 04:29:09 -0400
In-Reply-To: <1270511567-18567-7-git-send-email-fujita.tomonori@lab.ntt.co.jp>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Tue, Apr 6, 2010 at 01:52, FUJITA Tomonori
<fujita.tomonori@lab.ntt.co.jp> wrote:
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Roman Zippel <zippel@linux-m68k.org>
> ---
> =C2=A0arch/m68k/include/asm/scatterlist.h | =C2=A0 16 +--------------=
-
> =C2=A01 files changed, 1 insertions(+), 15 deletions(-)
>
> diff --git a/arch/m68k/include/asm/scatterlist.h b/arch/m68k/include/=
asm/scatterlist.h
> index e27ad90..175da06 100644
> --- a/arch/m68k/include/asm/scatterlist.h
> +++ b/arch/m68k/include/asm/scatterlist.h
> @@ -1,23 +1,9 @@
> =C2=A0#ifndef _M68K_SCATTERLIST_H
> =C2=A0#define _M68K_SCATTERLIST_H
>
> -#include <linux/types.h>
> -
> -struct scatterlist {
> -#ifdef CONFIG_DEBUG_SG
> - =C2=A0 =C2=A0 =C2=A0 unsigned long sg_magic;
> -#endif
> - =C2=A0 =C2=A0 =C2=A0 unsigned long page_link;
> - =C2=A0 =C2=A0 =C2=A0 unsigned int offset;
> - =C2=A0 =C2=A0 =C2=A0 unsigned int length;
> -
> - =C2=A0 =C2=A0 =C2=A0 dma_addr_t dma_address; /* A place to hang hos=
t-specific addresses at. */
> -};
> +#include <asm-generic/scatterlist.h>

This include should be ...

> =C2=A0/* This is bogus and should go away. */
> =C2=A0#define ISA_DMA_THRESHOLD (0x00ffffff)

=2E.. below this definition, else you get duplicate definition errors
(and the wrong definition).

> -#define sg_dma_address(sg) =C2=A0 =C2=A0 ((sg)->dma_address)
> -#define sg_dma_len(sg) =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((sg)->length)
> -
> =C2=A0#endif /* !(_M68K_SCATTERLIST_H) */
> --
> 1.7.0

Will apply (incl. the fix).

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
