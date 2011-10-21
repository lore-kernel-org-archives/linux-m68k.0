From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: use of 64 div instruction is chip specific
Date: Fri, 21 Oct 2011 17:00:48 +0200
Message-ID: <CAMuHMdVjYdj6RVeVQ1ijGsrue6X26sAEtT+-4cGwGmBnWnBAWg@mail.gmail.com>
References: <1319180885-11145-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:52810 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751055Ab1JUPAt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Oct 2011 11:00:49 -0400
Received: by iaek3 with SMTP id k3so4828661iae.19
        for <linux-m68k@vger.kernel.org>; Fri, 21 Oct 2011 08:00:49 -0700 (PDT)
In-Reply-To: <1319180885-11145-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Oct 21, 2011 at 09:08,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> The use of the 64 div instruction should not be based on whether we
> are running MMU enabled or not. It is chip specific. The original
> 68000 family and the ColdFire CPU family do not support it, the
> other 680x0 CPU varients do. So make the conditional check based on
> that, not CONFIG_MMU.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> ---
> =C2=A0arch/m68k/include/asm/div64.h | =C2=A0 =C2=A08 ++++----
> =C2=A01 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/m68k/include/asm/div64.h b/arch/m68k/include/asm/di=
v64.h
> index edb6614..7265e40 100644
> --- a/arch/m68k/include/asm/div64.h
> +++ b/arch/m68k/include/asm/div64.h
> @@ -1,7 +1,9 @@
> =C2=A0#ifndef _M68K_DIV64_H
> =C2=A0#define _M68K_DIV64_H
>
> -#ifdef CONFIG_MMU
> +#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
> +#include <asm-generic/div64.h>
> +#else
>
> =C2=A0#include <linux/types.h>
>
> @@ -27,8 +29,6 @@
> =C2=A0 =C2=A0 =C2=A0 =C2=A0__rem; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0})
>
> -#else
> -#include <asm-generic/div64.h>
> -#endif /* CONFIG_MMU */
> +#endif /* CONFIG_M68000 || CONFIG_COLDFIRE */
>
> =C2=A0#endif /* _M68K_DIV64_H */

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
