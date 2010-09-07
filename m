From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/m68knommu: merge MMU and non-MMU atomic.h
Date: Tue, 7 Sep 2010 22:42:33 +0200
Message-ID: <AANLkTikp0W54UDhrtxEiWMtUJ8adQMt1tMd3ckRrE=55@mail.gmail.com>
References: <201009070549.o875nKHX008042@goober.internal.moreton.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:53086 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758128Ab0IGUme convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Sep 2010 16:42:34 -0400
Received: by ywh1 with SMTP id 1so2099574ywh.19
        for <linux-m68k@vger.kernel.org>; Tue, 07 Sep 2010 13:42:34 -0700 (PDT)
In-Reply-To: <201009070549.o875nKHX008042@goober.internal.moreton.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org

On Tue, Sep 7, 2010 at 07:49, Greg Ungerer <gerg@snapgear.com> wrote:
> m68k/m68knommu: merge MMU and non-MMU atomic.h
>
> The only difference between the MMU and non-MMU versions of atomic.h
> is in the extra support ColdFire family processors. So merge this int=
o
> the MMU version of atomic.h.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> ---
> =C2=A0arch/m68k/include/asm/{atomic_mm.h =3D> atomic.h} | =C2=A0 16 +=
+-
> =C2=A0arch/m68k/include/asm/atomic_no.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0155 -----------------------
> =C2=A02 files changed, 13 insertions(+), 158 deletions(-)
> =C2=A0rename arch/m68k/include/asm/{atomic_mm.h =3D> atomic.h} (92%)
> =C2=A0delete mode 100644 arch/m68k/include/asm/atomic_no.h
>
> diff --git a/arch/m68k/include/asm/atomic_mm.h b/arch/m68k/include/as=
m/atomic.h
> similarity index 92%
> rename from arch/m68k/include/asm/atomic_mm.h
> rename to arch/m68k/include/asm/atomic.h
> index 6a223b3..3db3c93 100644
> --- a/arch/m68k/include/asm/atomic_mm.h
> +++ b/arch/m68k/include/asm/atomic.h

arch/m68k/include/asm/atomic.h had a line

| #include <asm-generic/atomic64.h>

before, which is now gone? This break lib/atomic64.c.

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
