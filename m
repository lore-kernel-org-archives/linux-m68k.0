From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 159/199] arch/m68k/hp300/hp300map.map: Checkpatch cleanup
Date: Sun, 6 Jun 2010 13:48:59 +0200
Message-ID: <AANLkTinO1TU-TRPUm00tehhjECCkyVV_0xEVJtyaU_ya@mail.gmail.com>
References: <1274644930-26600-1-git-send-email-andrea.gelmini@gelma.net>
	<1274644930-26600-11-git-send-email-andrea.gelmini@gelma.net>
	<m2y6esqtyv.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f46.google.com ([74.125.82.46]:57997 "EHLO
	mail-ww0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750991Ab0FFLtA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 6 Jun 2010 07:49:00 -0400
Received: by wwc33 with SMTP id 33so473455wwc.19
        for <linux-m68k@vger.kernel.org>; Sun, 06 Jun 2010 04:48:59 -0700 (PDT)
In-Reply-To: <m2y6esqtyv.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Andrea Gelmini <andrea.gelmini@gelma.net>, Philip Blundell <philb@gnu.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org

On Sun, Jun 6, 2010 at 13:30, Andreas Schwab <schwab@linux-m68k.org> wr=
ote:
> Andrea Gelmini <andrea.gelmini@gelma.net> writes:
>
>> diff --git a/arch/m68k/hp300/hp300map.map b/arch/m68k/hp300/hp300map=
=2Emap
>> index 6b45f0a..621c076 100644
>> --- a/arch/m68k/hp300/hp300map.map
>> +++ b/arch/m68k/hp300/hp300map.map
>> @@ -182,71 +182,71 @@ string Prior =3D "\033[5~"
>> =C2=A0string Next =3D "\033[6~"
>> =C2=A0string Macro =3D "\033[M"
>> =C2=A0string Pause =3D "\033[P"
>> -compose '`' 'A' to '=C3=80'
> [...]
>> +compose '`' 'A' to '=C3=83=E2=82=AC'
>
> This is obviously wrong. =C2=A0The composed character is supposed to =
be a
> single latin-1 character (namely '\300').

Sorry, you're right. Loadkeys is indeed not yet aware of UTF-8.

> A patch subject containing "checkpatch" should always ring the alarm
> bells.

;-)

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
