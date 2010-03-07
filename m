From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] M68K: Simplify param.h by using <asm-generic/param.h>
Date: Sun, 7 Mar 2010 13:41:48 +0100
Message-ID: <10f740e81003070441i80edc65qeb842367eb999cd1@mail.gmail.com>
References: <alpine.LFD.2.00.0912311534590.6952@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f46.google.com ([74.125.82.46]:38995 "EHLO
	mail-ww0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753084Ab0CGMlt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 7 Mar 2010 07:41:49 -0500
Received: by wwa36 with SMTP id 36so2815643wwa.19
        for <linux-m68k@vger.kernel.org>; Sun, 07 Mar 2010 04:41:48 -0800 (PST)
In-Reply-To: <alpine.LFD.2.00.0912311534590.6952@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Linux M68K mailing list <linux-m68k@vger.kernel.org>

On Thu, Dec 31, 2009 at 21:35, Robert P. J. Day <rpjday@crashcourse.ca>=
 wrote:
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

Thx, applied.

 diff --git a/arch/m68k/include/asm/param.h b/arch/m68k/include/asm/par=
am.h
> index 85c41b7..36265cc 100644
> --- a/arch/m68k/include/asm/param.h
> +++ b/arch/m68k/include/asm/param.h
> @@ -1,26 +1,12 @@
> =C2=A0#ifndef _M68K_PARAM_H
> =C2=A0#define _M68K_PARAM_H
>
> -#ifdef __KERNEL__
> -# define HZ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_HZ =C2=A0=
 =C2=A0 =C2=A0 /* Internal kernel timer frequency */
> -# define USER_HZ =C2=A0 =C2=A0 =C2=A0 100 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /* .. some user interfaces are in "ticks" */
> -# define CLOCKS_PER_SEC =C2=A0 =C2=A0 =C2=A0 =C2=A0(USER_HZ) =C2=A0 =
=C2=A0 =C2=A0 /* like times() */
> -#endif
> -
> -#ifndef HZ
> -#define HZ 100
> -#endif
> -
> =C2=A0#ifdef __uClinux__
> =C2=A0#define EXEC_PAGESIZE =C2=A04096
> =C2=A0#else
> =C2=A0#define EXEC_PAGESIZE =C2=A08192
> =C2=A0#endif
>
> -#ifndef NOGROUP
> -#define NOGROUP =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(-1)
> -#endif
> -
> -#define MAXHOSTNAMELEN 64 =C2=A0 =C2=A0 =C2=A0/* max length of hostn=
ame */
> +#include <asm-generic/param.h>
>
> =C2=A0#endif /* _M68K_PARAM_H */

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
