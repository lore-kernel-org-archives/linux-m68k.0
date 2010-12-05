From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k atari: reserve some ST-RAM early on for device
 buffer use (was: Re: Aranym, more than 244MB FastRAM, garbled display)
Date: Sun, 5 Dec 2010 12:11:20 +0100
Message-ID: <AANLkTim+C7kkf-m0NpnBBUuN07vd5uw1cWDc_B8LJdBJ@mail.gmail.com>
References: <alpine.LNX.2.00.1010011728270.4788@halbrend.uninett.no>
	<m2tyl5u9hu.fsf@igel.home>
	<alpine.LNX.2.00.1010011908550.4788@halbrend.uninett.no>
	<Pine.BSM.4.64L.1010041947160.3776@herc.mirbsd.org>
	<AANLkTinq7CXPpYVfAYhgH9ea1FQs_f+AhYsU1-+ZdUx+@mail.gmail.com>
	<Pine.BSM.4.64L.1010060910520.21623@herc.mirbsd.org>
	<AANLkTi=ZrDoFPxFNZ3OKurvcrBuN3fS0gTvAeYpLQqCi@mail.gmail.com>
	<AANLkTin+_c=Luvns2MYkVhBksB8vD3reDh8W6a8Bje2o@mail.gmail.com>
	<AANLkTikumgbPW12gcsUML-JqyCUUaws2=r1gY7NT4fgJ@mail.gmail.com>
	<4CC14067.8090903@gmail.com>
	<m3hbged2d2.fsf@hase.home>
	<AANLkTi=YEmB5hKiDYcLie8OnkySyEoQLC_qiXoVzTT8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:64018 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755118Ab0LELLV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 5 Dec 2010 06:11:21 -0500
Received: by mail-fx0-f46.google.com with SMTP id 20so3451454fxm.19
        for <linux-m68k@vger.kernel.org>; Sun, 05 Dec 2010 03:11:20 -0800 (PST)
In-Reply-To: <AANLkTi=YEmB5hKiDYcLie8OnkySyEoQLC_qiXoVzTT8w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Sun, Oct 24, 2010 at 06:11, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
> On Fri, Oct 22, 2010 at 10:05 PM, Andreas Schwab <schwab@linux-m68k.o=
rg> wrote:
>> Michael Schmitz <schmitzmic@googlemail.com> writes:
>>
>>> +static int __init atari_stram_setup(char *arg)
>>> +{
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0int rc=3D0;
>>> +
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!MACH_IS_ATARI)
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>>> +
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(rc =3D sscanf(arg, "%d", &pool_s=
ize))) {
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pool_size =3D memparse(arg, NULL)=
;
>
> Thanks, that's a lot more elegant.

Applied, but I'm wondering if there's no way to reuse an existing
allocator instead
of writing our own...

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
