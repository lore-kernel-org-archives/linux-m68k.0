From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [patch 158/200] m68k: convert to asm-generic/hardirq.h
Date: Wed, 23 Sep 2009 10:19:49 +0200
Message-ID: <10f740e80909230119x612e6f4arf5a8b007702b2e7a@mail.gmail.com>
References: <200909220004.n8M047d1000607@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754531AbZIWITs@vger.kernel.org>
In-Reply-To: <200909220004.n8M047d1000607@imap1.linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, torvalds@linux-foundation.org, hch@lst.de
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Tue, Sep 22, 2009 at 02:04,  <akpm@linux-foundation.org> wrote:
> From: Christoph Hellwig <hch@lst.de>
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

This one broke the m68k build, cfr.
http://kisskb.ellerman.id.au/kisskb/buildresult/1295096/.
I guess including <asm-generic/hardirq.h> here exposes us to Include He=
ll...

`git revert 45d80eea87c9f8292d2d33173d6866c0ec57238a` fixes it.

> ---
>
> =C2=A0arch/m68k/include/asm/hardirq_mm.h | =C2=A0 12 ++----------
> =C2=A01 file changed, 2 insertions(+), 10 deletions(-)
>
> diff -puN arch/m68k/include/asm/hardirq_mm.h~m68k-convert-to-asm-gene=
ric-hardirqh arch/m68k/include/asm/hardirq_mm.h
> --- a/arch/m68k/include/asm/hardirq_mm.h~m68k-convert-to-asm-generic-=
hardirqh
> +++ a/arch/m68k/include/asm/hardirq_mm.h
> @@ -1,16 +1,8 @@
> =C2=A0#ifndef __M68K_HARDIRQ_H
> =C2=A0#define __M68K_HARDIRQ_H
>
> -#include <linux/threads.h>
> -#include <linux/cache.h>
> -
> -/* entry.S is sensitive to the offsets of these fields */
> -typedef struct {
> - =C2=A0 =C2=A0 =C2=A0 unsigned int __softirq_pending;
> -} ____cacheline_aligned irq_cpustat_t;
> -
> -#include <linux/irq_cpustat.h> /* Standard mappings for irq_cpustat_=
t above */
> -
> =C2=A0#define HARDIRQ_BITS =C2=A0 8
>
> +#include <asm-generic/hardirq.h>
> +
> =C2=A0#endif

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
