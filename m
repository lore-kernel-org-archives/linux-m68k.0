From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: remove arch specific non-optimized memcmp()
Date: Tue, 15 Feb 2011 20:50:00 +0100
Message-ID: <AANLkTi=FOcs4KDJ51Rsx+DwU9zW2Hn1F6EB0tUny3EXQ@mail.gmail.com>
References: <201102070057.p170vUMO009007@goober.internal.moreton.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:57068 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755353Ab1BOTuB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 15 Feb 2011 14:50:01 -0500
Received: by fxm20 with SMTP id 20so552624fxm.19
        for <linux-m68k@vger.kernel.org>; Tue, 15 Feb 2011 11:50:00 -0800 (PST)
In-Reply-To: <201102070057.p170vUMO009007@goober.internal.moreton.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org, gregungerer@westnet.com.au

On Mon, Feb 7, 2011 at 01:57, Greg Ungerer <gerg@snapgear.com> wrote:
> m68k: remove arch specific non-optimized memcmp()
>
> The m68k arch implements its own memcmp() function. It is not optimiz=
ed
> in any way (it is the most strait forward coding of memcmp you can ge=
t).
> Remove it and use the kernels standard memcmp() implementation.
>
> This also goes part of the way to fixing a regression caused by commi=
t
> ea61bc461d09e8d331a307916530aaae808c72a2 ("m68k/m68knommu: merge MMU =
and
> non-MMU string.h"), which breaks non-coldfire non-mmu builds (which i=
s
> the 68x328 and 68360 families). They currently have no memcmp() funct=
ion
> defined, since there is none in the m68knommu/lib functions.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Go ahead!

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> ---
> =C2=A0arch/m68k/include/asm/string.h | =C2=A0 =C2=A04 +---
> =C2=A0arch/m68k/lib/string.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 11 =
-----------
> =C2=A02 files changed, 1 insertions(+), 14 deletions(-)
>
> diff --git a/arch/m68k/include/asm/string.h b/arch/m68k/include/asm/s=
tring.h
> index 65b1312..ffc3c3f 100644
> --- a/arch/m68k/include/asm/string.h
> +++ b/arch/m68k/include/asm/string.h
> @@ -102,11 +102,9 @@ static inline int strcmp(const char *cs, const c=
har *ct)
>
> =C2=A0#define __HAVE_ARCH_MEMMOVE
> =C2=A0extern void *memmove(void *, const void *, __kernel_size_t);
> +#endif /* CONFIG_COLDFIRE */
>
> -#define __HAVE_ARCH_MEMCMP
> -extern int memcmp(const void *, const void *, __kernel_size_t);
> =C2=A0#define memcmp(d, s, n) __builtin_memcmp(d, s, n)
> -#endif /* CONFIG_COLDFIRE */
>
> =C2=A0#define __HAVE_ARCH_MEMSET
> =C2=A0extern void *memset(void *, int, __kernel_size_t);
> diff --git a/arch/m68k/lib/string.c b/arch/m68k/lib/string.c
> index 4253f87..d399c5f 100644
> --- a/arch/m68k/lib/string.c
> +++ b/arch/m68k/lib/string.c
> @@ -243,14 +243,3 @@ void *memmove(void *dest, const void *src, size_=
t n)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return xdest;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(memmove);
> -
> -int memcmp(const void *cs, const void *ct, size_t count)
> -{
> - =C2=A0 =C2=A0 =C2=A0 const unsigned char *su1, *su2;
> -
> - =C2=A0 =C2=A0 =C2=A0 for (su1 =3D cs, su2 =3D ct; count > 0; ++su1,=
 ++su2, count--)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*su1 !=3D *su2=
)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return *su1 < *su2 ? -1 : +1;
> - =C2=A0 =C2=A0 =C2=A0 return 0;
> -}
> -EXPORT_SYMBOL(memcmp);

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
