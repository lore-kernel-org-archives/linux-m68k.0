From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Aranym, more than 244MB FastRAM, garbled display
Date: Tue, 5 Oct 2010 08:47:25 +0200
Message-ID: <AANLkTinq7CXPpYVfAYhgH9ea1FQs_f+AhYsU1-+ZdUx+@mail.gmail.com>
References: <alpine.LNX.2.00.1010011728270.4788@halbrend.uninett.no>
	<m2tyl5u9hu.fsf@igel.home>
	<alpine.LNX.2.00.1010011908550.4788@halbrend.uninett.no>
	<Pine.BSM.4.64L.1010041947160.3776@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:59866 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757493Ab0JEGr0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 5 Oct 2010 02:47:26 -0400
Received: by iwn5 with SMTP id 5so7925754iwn.19
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 23:47:26 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1010041947160.3776@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

On Mon, Oct 4, 2010 at 21:49, Thorsten Glaser <tg@mirbsd.de> wrote:
> Kolbj=C3=B8rn Barmen dixit:
>
>>Anything other than default in video settings or anything?
>
> I=E2=80=99m now seeing this too, with the vmlinuz-2.6.32-5-atari
> (Debian 2.6.32-24+m68k) just built.
>
> This WFM:
> [GLOBAL]
> FastRAM =3D 768
> [LILO]
> Kernel =3D vmlinuz-2.6.32-5-atari
> # these Args for normal X operation
> Args =3D root=3D/dev/hda1 console=3Dtty debug=3Dpar video=3Datafb:vga=
2

Confirmed with yesterday's 2.6.36-rc6.
The problem starts happening as soon as FastRAM >=3D 512.

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
