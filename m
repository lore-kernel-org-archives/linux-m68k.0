From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 06/35] m68k: modify user space access functions to support
 ColdFire CPUs
Date: Sun, 25 Dec 2011 20:56:51 +0100
Message-ID: <CAMuHMdWHPKP6+qn+5qp7q9nmL685c+gg0ppbLD=eHrOWBqTnYA@mail.gmail.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
	<1324610148-20666-7-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:50540 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750947Ab1LYT4x convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 25 Dec 2011 14:56:53 -0500
Received: by wgbdr13 with SMTP id dr13so19410756wgb.1
        for <linux-m68k@vger.kernel.org>; Sun, 25 Dec 2011 11:56:51 -0800 (PST)
In-Reply-To: <1324610148-20666-7-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Dec 23, 2011 at 04:15,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> Modify the user space access functions to support the ColdFire V4e co=
res
> running with MMU enabled.
>
> The ColdFire processors do not support the "moves" instruction used b=
y
> the traditional 680x0 processors for moving data into and out of anot=
her
> address space. They only support the notion of a single address space=
,
> and you use the usual "move" instruction to access that.
>
> Create a new config symbol (CONFIG_CPU_HAS_ADDRESS_SPACES) to mark th=
e
> CPU types that support separate address spaces, and thus also support
> the sfc/dfc registers and the "moves" instruction that go along with =
that.
>
> The code is almost identical for user space access, so lets just use =
a
> define to choose either the "move" or "moves" in the assembler code.
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
