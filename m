From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 5/5] m68k: merge non-mmu and mmu versions of m68k_ksyms.c
Date: Thu, 21 Apr 2011 10:16:01 +0200
Message-ID: <BANLkTikwQZXjzXEZma41+Z0x4JRjZ1c6Dg@mail.gmail.com>
References: <1303346890-28249-1-git-send-email-gerg@snapgear.com>
	<1303346890-28249-2-git-send-email-gerg@snapgear.com>
	<1303346890-28249-3-git-send-email-gerg@snapgear.com>
	<1303346890-28249-4-git-send-email-gerg@snapgear.com>
	<1303346890-28249-5-git-send-email-gerg@snapgear.com>
	<1303346890-28249-6-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:40821 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753923Ab1DUIQD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 21 Apr 2011 04:16:03 -0400
Received: by bwz15 with SMTP id 15so1225730bwz.19
        for <linux-m68k@vger.kernel.org>; Thu, 21 Apr 2011 01:16:01 -0700 (PDT)
In-Reply-To: <1303346890-28249-6-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Thu, Apr 21, 2011 at 02:48,  <gerg@snapgear.com> wrote:
> +#ifndef CONFIG_MMU

While we're at it, that should also be a test for not '020-'060/CPU32?

> +/*
> + * Simpler 68k and ColdFire parts also need a few other gcc function=
s.
> + */
> +extern long long __divsi3(long long, long long);
> +extern long long __modsi3(long long, long long);
> +extern long long __mulsi3(long long, long long);
> +extern long long __udivsi3(long long, long long);
> +extern long long __umodsi3(long long, long long);
> +
> +EXPORT_SYMBOL(__divsi3);
> +EXPORT_SYMBOL(__modsi3);
> +EXPORT_SYMBOL(__mulsi3);
> +EXPORT_SYMBOL(__udivsi3);
> +EXPORT_SYMBOL(__umodsi3);
> =C2=A0#endif

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
