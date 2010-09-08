From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] m68k/m68knommu: merge MMU and non-MMU atomic.h
Date: Wed, 8 Sep 2010 21:45:37 +0200
Message-ID: <AANLkTi=_cyyD8ub0vzqf9fbBFt4RoNPvJJCHUtVSgFqQ@mail.gmail.com>
References: <201009080031.o880VBpV031375@goober.internal.moreton.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:64392 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753497Ab0IHTpi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Sep 2010 15:45:38 -0400
Received: by iwn5 with SMTP id 5so261908iwn.19
        for <linux-m68k@vger.kernel.org>; Wed, 08 Sep 2010 12:45:38 -0700 (PDT)
In-Reply-To: <201009080031.o880VBpV031375@goober.internal.moreton.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org

On Wed, Sep 8, 2010 at 02:31, Greg Ungerer <gerg@snapgear.com> wrote:
> From 31b4a9fff37587b571f24b005cee47e3ac8485ac Mon Sep 17 00:00:00 200=
1
> From: Greg Ungerer <gerg@uclinux.org>
> Date: Mon, 6 Sep 2010 12:49:41 +1000
> Subject: [PATCH 6/8] m68k/m68knommu: merge MMU and non-MMU atomic.h
>
> The only difference between the MMU and non-MMU versions of atomic.h
> is some extra support needed by ColdFire family processors. So merge
> this into the MMU version of atomic.h.

[...]

> @@ -197,4 +207,5 @@ static __inline__ int atomic_add_unless(atomic_t =
*v, int a, int u)
> =C2=A0#define smp_mb__after_atomic_inc() =C2=A0 =C2=A0 barrier()
>
> =C2=A0#include <asm-generic/atomic-long.h>
> +#include <asm-generic/atomic64.h>
> =C2=A0#endif /* __ARCH_M68K_ATOMIC __ */

Thanks, the new one builds fine.

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
