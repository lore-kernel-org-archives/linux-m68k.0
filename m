From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: fix assembler constraint to prevent overeager gcc optimisation
Date: Sun, 22 Jan 2012 11:15:57 +0100
Message-ID: <CAMuHMdVd7opSitKs82Q6N5Yi6eGBvhOsE9USVFiE81dXmGAHTg@mail.gmail.com>
References: <4F079F6B.8080502@fairlite.co.uk>
	<4F07EA66.6020603@gmail.com>
	<4F08E748.4020305@fairlite.co.uk>
	<4F0917E9.9090600@gmail.com>
	<4F0964EC.2080505@fairlite.co.uk>
	<CAOmrzkLH18VCY0dzJPM14dn5ccWmSBkiPzq8EFqnCDHiM3bECQ@mail.gmail.com>
	<4F0A2DD0.4000707@fairlite.co.uk>
	<CAOmrzk+P3mPXu_Q_KxgEk_jx-JNhXY4ydrKoGM+43LpD5icTHw@mail.gmail.com>
	<4F0A3CDE.7070308@fairlite.co.uk>
	<4F0A421C.9000600@fairlite.co.uk>
	<m2wr91yxa4.fsf@igel.home>
	<CAMuHMdXjWyEEOS4fJEaY1dg_cZWLyTps85jaQzsvbO_44-UhqA@mail.gmail.com>
	<m2obudynjs.fsf_-_@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:59210 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750877Ab2AVKP7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 22 Jan 2012 05:15:59 -0500
Received: by werb13 with SMTP id b13so1461710wer.19
        for <linux-m68k@vger.kernel.org>; Sun, 22 Jan 2012 02:15:58 -0800 (PST)
In-Reply-To: <m2obudynjs.fsf_-_@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Tuomas Vainikka <tuomas.vainikka@aalto.fi>, Alan Hourihane <alanh@fairlite.co.uk>, Michael Schmitz <schmitzmic@googlemail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@snapgear.com>

On Mon, Jan 9, 2012 at 15:10, Andreas Schwab <schwab@linux-m68k.org> wr=
ote:
> Passing the address of a variable as an operand to an asm statement
> doesn't mark the value of this variable as used, so gcc may optimize =
its
> initialisation away. =C2=A0Fix this by using the "m" constraint inste=
ad.

Thanks! I'll apply and queue for -stable.

> diff --git a/arch/m68k/kernel/process_mm.c b/arch/m68k/kernel/process=
_mm.c
> index 1bc223a..aa4ffb8 100644
> --- a/arch/m68k/kernel/process_mm.c
> +++ b/arch/m68k/kernel/process_mm.c
> @@ -189,8 +189,8 @@ void flush_thread(void)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0current->thread.fs =3D __USER_DS;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!FPU_IS_EMU)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0asm volatile (=
".chip 68k/68881\n\t"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "frestore %0@\n\t"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ".chip 68k" : : "a" (&zero));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "frestore %0\n\t"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ".chip 68k" : : "m" (zero));
> =C2=A0}
>
> =C2=A0/*

This one was changed to:

| asm volatile ("frestore %0@" : : "a" (&zero) : "memory");

in v3.3-rc1.

I take it (but I prefer to ask, asm constraints always make me nervous)
the "memory" is no longer needed with your fix?

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
