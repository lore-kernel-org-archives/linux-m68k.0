From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Atari TT (next)
Date: Mon, 9 Jan 2012 13:14:16 +0100
Message-ID: <CAMuHMdXjWyEEOS4fJEaY1dg_cZWLyTps85jaQzsvbO_44-UhqA@mail.gmail.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:60980 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753911Ab2AIMOR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 9 Jan 2012 07:14:17 -0500
Received: by wibhm6 with SMTP id hm6so2491110wib.19
        for <linux-m68k@vger.kernel.org>; Mon, 09 Jan 2012 04:14:16 -0800 (PST)
In-Reply-To: <m2wr91yxa4.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>, Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Cc: Alan Hourihane <alanh@fairlite.co.uk>, Michael Schmitz <schmitzmic@googlemail.com>, Linux/m68k <linux-m68k@vger.kernel.org>

On Mon, Jan 9, 2012 at 11:40, Andreas Schwab <schwab@linux-m68k.org> wr=
ote:
> Alan Hourihane <alanh@fairlite.co.uk> writes:
>
>> *** FORMAT ERROR *** =C2=A0 FORMAT=3D0
>> Current process id is 768
>> BAD KERNEL TRAP: 00000000
>> Modules linked in:
>> PC: [<000029de>] flush_thread+0x8/0xe
>
> void flush_thread(void)
> {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long zero =3D 0;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0current->thread.fs =3D __USER_DS;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!FPU_IS_EMU)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0asm volatile (=
".chip 68k/68881\n\t"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"frestore %0@\n\t"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0".chip 68k" : : "a" (&zero));
> }
>
> GCC is optimizing away the initialisation of zero, since nothing visi=
ble
> is using its value.
>
> Andreas.
>
> --------------------------->8----------------------------------------
> From bbf7451db90fcec5eade9d8bc913b78829192b9c Mon Sep 17 00:00:00 200=
1
> From: Andreas Schwab <schwab@linux-m68k.org>
> Date: Mon, 9 Jan 2012 11:36:18 +0100
> Subject: [PATCH] m68k: fix assembler constraint to prevent overeager =
gcc
> =C2=A0optimisation
>
> Passing the address of a variable as an operand to an asm statement
> doesn't mark the value of this variable as used, so gcc optimized its
> initialisation away. =C2=A0Fix this by using a "m" constraint instead=
=2E
> ---
> =C2=A0arch/m68k/kernel/process_mm.c | =C2=A0 =C2=A04 ++--
> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>
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
> --
> 1.7.8.3

Thanks!

Tuomas: I think this will fix your problem, too?

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
