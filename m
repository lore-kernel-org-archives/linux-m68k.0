From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 17/35] m68k: define PAGE_OFFSET_RAW for ColdFire CPU with
 MMU enabled
Date: Sun, 25 Dec 2011 21:15:54 +0100
Message-ID: <CAMuHMdUUAsHRWHh4PukFJBM187UB_xj-R5rrs1+WuhtJmEO7tQ@mail.gmail.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
	<1324610148-20666-18-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:42219 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750947Ab1LYUPz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 25 Dec 2011 15:15:55 -0500
Received: by wibhm6 with SMTP id hm6so4074631wib.19
        for <linux-m68k@vger.kernel.org>; Sun, 25 Dec 2011 12:15:54 -0800 (PST)
In-Reply-To: <1324610148-20666-18-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Dec 23, 2011 at 04:15,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> The ColdFire CPU configurations need PAGE_OFFSET_RAW set to the base =
of
> their RAM. It doesn't matter if they are running with the MMU enabled=
 or
> disabled, it is always set to the base of RAM.
>
> We can keep the choices simple here and key of CONFIG_RAMBASE. If it =
is
> defined we are on a plaftorm (ColdFire or other non-MMU systems) whic=
h
> have a configurable RAM base, just use it.
>
> Reported-by: Alexander Stein <alexander.stein@systec-electronic.com>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> Acked-by: Matt Waddel <mwaddel@yahoo.com>
> Acked-by: Kurt Mahan <kmahan@xmission.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

but see below ...

> -#ifdef CONFIG_MMU
> -#ifndef CONFIG_SUN3
> +#if defined(CONFIG_RAMBASE)
> +#define PAGE_OFFSET_RAW =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0CONFIG_RAMBASE
> +#elif !defined(CONFIG_SUN3)
> =C2=A0#define PAGE_OFFSET_RAW =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A00x00000000
> =C2=A0#else
> =C2=A0#define PAGE_OFFSET_RAW =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A00x0E000000
> =C2=A0#endif
> -#else
> -#define =C2=A0 =C2=A0 =C2=A0 =C2=A0PAGE_OFFSET_RAW =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 CONFIG_RAMBASE
> -#endif

To avoid alternating between defined and !defined, I'd suggest writing
it instead like:

#if defined(CONFIG_RAMBASE)
#define PAGE_OFFSET_RAW         CONFIG_RAMBASE
#elif defined(CONFIG_SUN3)
#define PAGE_OFFSET_RAW         0x0E000000
#else
#define PAGE_OFFSET_RAW         0x00000000
#endif

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
