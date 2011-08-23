From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: fix __page_to_pfn for a const struct page argument
Date: Tue, 23 Aug 2011 09:56:09 +0200
Message-ID: <CAMuHMdXB+mUu6LfFVynM_VRgb6YErtSQLrZyAt5ke7SgRRhDog@mail.gmail.com>
References: <1313656622-25975-1-git-send-email-ian.campbell@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f170.google.com ([209.85.210.170]:44597 "EHLO
	mail-iy0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754104Ab1HWH4K convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 23 Aug 2011 03:56:10 -0400
Received: by iye16 with SMTP id 16so11680966iye.1
        for <linux-m68k@vger.kernel.org>; Tue, 23 Aug 2011 00:56:09 -0700 (PDT)
In-Reply-To: <1313656622-25975-1-git-send-email-ian.campbell@citrix.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Ian Campbell <ian.campbell@citrix.com>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-m68k@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Thu, Aug 18, 2011 at 10:37, Ian Campbell <ian.campbell@citrix.com> w=
rote:
> Fixes fallout due to the removal of the cast in
> mm-fix-__page_to_pfn-for-a-const-struct-page-argument.patch
>
> (akpm: this should probably be folded into that patch. I glanced over=
 the other
> =C2=A0 =C2=A0 =C2=A0 architectures which appear not to use include/as=
m-generic/memory_model.h
> =C2=A0 =C2=A0 =C2=A0 and they appear to follow the other pattern (usi=
ng ptr arithmetic) and
> =C2=A0 =C2=A0 =C2=A0 hence I think aren't susceptible to this issue).
>
> Signed-off-by: Ian Campbell <ian.campbell@citrix.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

The original patch claimed to fix the callers of __page_to_pfn(),
while it actually changed (and thus broke) the caller of page_to_pfn().=
=2E.
Please put this on the fast track.

> Cc: linux-m68k@lists.linux-m68k.org
> ---
> =C2=A0arch/m68k/include/asm/page_mm.h | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/=
page_mm.h
> index 31d5570..89f2014 100644
> --- a/arch/m68k/include/asm/page_mm.h
> +++ b/arch/m68k/include/asm/page_mm.h
> @@ -162,7 +162,7 @@ static inline __attribute_const__ int __virt_to_n=
ode_shift(void)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pgdat->node_mem_map + (__pfn - pgdat->node=
_start_pfn); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0})
> =C2=A0#define page_to_pfn(_page) ({ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> - =C2=A0 =C2=A0 =C2=A0 struct page *__p =3D (_page); =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 const struct page *__p =3D (_page); =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pglist_data *pgdat; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pgdat =3D &pg_data_map[page_to_nid(__p)]; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0((__p) - pgdat->node_mem_map) + pgdat->nod=
e_start_pfn; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> --
> 1.7.2.5

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
