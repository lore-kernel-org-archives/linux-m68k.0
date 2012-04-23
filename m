From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC/PATCH] m68k: fix compiler warning by properly inlining flat_set_persistent()
Date: Mon, 23 Apr 2012 23:07:39 +0200
Message-ID: <CAMuHMdVtaDB_NpwxMFmosp7r=y-f=_PF1m0xC2-Rg50CLsTm3Q@mail.gmail.com>
References: <1335189010-8875-1-git-send-email-elezegarcia@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1335189010-8875-1-git-send-email-elezegarcia@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Ezequiel Garcia <elezegarcia@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, uClinux development list <uclinux-dev@uclinux.org>

On Mon, Apr 23, 2012 at 15:50, Ezequiel Garcia <elezegarcia@gmail.com> =
wrote:
> Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
> ---
> To define or to inline that is the question:
> The current definition of flat_set_persistent produces a compiler
> warning; arch/sh/ does it in a different way defining it to
> a macro that uses persistent var. IMHO, an inline is easier to read.

What's the compiler warning?
It seems several other nommu arches use the same definition for
flat_set_persistent()?

> ---
> =C2=A0arch/m68k/include/asm/flat.h | =C2=A0 =C2=A07 ++++++-
> =C2=A01 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/arch/m68k/include/asm/flat.h b/arch/m68k/include/asm/fla=
t.h
> index a0e2907..f9454b8 100644
> --- a/arch/m68k/include/asm/flat.h
> +++ b/arch/m68k/include/asm/flat.h
> @@ -11,6 +11,11 @@
> =C2=A0#define =C2=A0 =C2=A0 =C2=A0 =C2=A0flat_get_addr_from_rp(rp, re=
lval, flags, p) =C2=A0 =C2=A0 get_unaligned(rp)
> =C2=A0#define =C2=A0 =C2=A0 =C2=A0 =C2=A0flat_put_addr_at_rp(rp, val,=
 relval) =C2=A0 =C2=A0put_unaligned(val,rp)
> =C2=A0#define =C2=A0 =C2=A0 =C2=A0 =C2=A0flat_get_relocate_addr(rel) =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (rel)
> -#define =C2=A0 =C2=A0 =C2=A0 =C2=A0flat_set_persistent(relval, p) =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00
> +
> +static inline int flat_set_persistent(unsigned long relval,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long =
*persistent)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
>
> =C2=A0#endif /* __M68KNOMMU_FLAT_H__ */
> --
> 1.7.3.4

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
