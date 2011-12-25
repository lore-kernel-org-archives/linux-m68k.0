From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 10/35] m68k: set register a2 to current if MMU enabled on ColdFire
Date: Sun, 25 Dec 2011 21:09:11 +0100
Message-ID: <CAMuHMdU-+_70djrESxPRR-vAV_SCirdJpig9Rkwb6jcbnRGmMw@mail.gmail.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
	<1324610148-20666-11-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:40170 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750947Ab1LYUJN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 25 Dec 2011 15:09:13 -0500
Received: by wibhm6 with SMTP id hm6so4073056wib.19
        for <linux-m68k@vger.kernel.org>; Sun, 25 Dec 2011 12:09:12 -0800 (PST)
In-Reply-To: <1324610148-20666-11-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Dec 23, 2011 at 04:15,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> Virtual memory m68k systems build with register a2 dedicated to being=
 the
> current proc pointer (non-MMU don't do this). Add code to the ColdFir=
e
> interrupt and exception processing to set this on entry, and at conte=
xt
> switch time. We use the same GET_CURRENT() macro that MMU enabled cod=
e
> uses - modifying it so that the assembler is ColdFire clean.
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
