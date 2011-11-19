From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: handle presence of 64bit mul/div instructions cleanly
Date: Sat, 19 Nov 2011 22:19:43 +0100
Message-ID: <CAMuHMdVyTiGBBHvKNqdHKL+nUBbwhc5mE6GJ=QATiDN_Y8i2nA@mail.gmail.com>
References: <1321597960-23782-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:33849 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752640Ab1KSVTo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 19 Nov 2011 16:19:44 -0500
Received: by iage36 with SMTP id e36so5282986iag.19
        for <linux-m68k@vger.kernel.org>; Sat, 19 Nov 2011 13:19:44 -0800 (PST)
In-Reply-To: <1321597960-23782-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Nov 18, 2011 at 07:32,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> The traditional 68000 processors and the newer reduced instruction se=
t
> ColdFire processors do not support the 32*32->64 multiply or the 64/3=
2->32
> divide instructions. This is not a difference based on the presence o=
f
> a hardware MMU or not.
>
> Create a new config symbol to mark that a CPU type doesn't support th=
e
> longer multiply/divide instructions. Use this then as a basis for usi=
ng
> the fast 64bit based divide (in div64.h) and for linking in the extra
> libgcc functions that may be required (mulsi3, divsi3, etc).
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Looks fine.
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
