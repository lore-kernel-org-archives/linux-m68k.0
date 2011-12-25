From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 29/35] m68k: ColdFire with MMU enabled uses same clocking
 code as non-MMU
Date: Sun, 25 Dec 2011 21:24:51 +0100
Message-ID: <CAMuHMdV2L_1oS36cbnBxsxtsZ12Ve_Fe2OXTFQmyeqbSX4GZmg@mail.gmail.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
	<1324610148-20666-30-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:58100 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751129Ab1LYUYw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 25 Dec 2011 15:24:52 -0500
Received: by werm1 with SMTP id m1so4739844wer.19
        for <linux-m68k@vger.kernel.org>; Sun, 25 Dec 2011 12:24:51 -0800 (PST)
In-Reply-To: <1324610148-20666-30-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Dec 23, 2011 at 04:15,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> We want to use the same timer support code for ColdFire CPU's when
> running with MMU enabled or not. So use the same time_no.c code even
> when the MMU is enabled for ColdFire. This also means we do not want
> CONFIG_ARCH_USES_GETTIMEOFFSET set, since that code is only in time_m=
m.c.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> Acked-by: Matt Waddel <mwaddel@yahoo.com>
> Acked-by: Kurt Mahan <kmahan@xmission.com>

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
