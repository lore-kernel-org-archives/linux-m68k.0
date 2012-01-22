From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: fix assembler constraint to prevent overeager gcc optimisation
Date: Sun, 22 Jan 2012 11:53:31 +0100
Message-ID: <CAMuHMdUAj5QtOXQqV96xBCnjvzXGpQLu2Nv46=+1rcRHi-Yn7A@mail.gmail.com>
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
	<CAMuHMdVd7opSitKs82Q6N5Yi6eGBvhOsE9USVFiE81dXmGAHTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:64015 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750870Ab2AVKxd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 22 Jan 2012 05:53:33 -0500
Received: by wgbed3 with SMTP id ed3so1875281wgb.1
        for <linux-m68k@vger.kernel.org>; Sun, 22 Jan 2012 02:53:31 -0800 (PST)
In-Reply-To: <CAMuHMdVd7opSitKs82Q6N5Yi6eGBvhOsE9USVFiE81dXmGAHTg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Tuomas Vainikka <tuomas.vainikka@aalto.fi>, Alan Hourihane <alanh@fairlite.co.uk>, Michael Schmitz <schmitzmic@googlemail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@snapgear.com>

On Sun, Jan 22, 2012 at 11:15, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> On Mon, Jan 9, 2012 at 15:10, Andreas Schwab <schwab@linux-m68k.org> =
wrote:
>> Passing the address of a variable as an operand to an asm statement
>> doesn't mark the value of this variable as used, so gcc may optimize=
 its
>> initialisation away. =C2=A0Fix this by using the "m" constraint inst=
ead.
>
> Thanks! I'll apply and queue for -stable.

BTW, is it reasonable to assume we never saw the problem before because
there used to be a set_fs() call in flush_thread()?
Cfr. commit b7de110044b4e26adcb7b278d14da93133692ed7 ("m68k, exec:
remove redundant set_fs(USER_DS)"),
http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux.git;a=3Dcomm=
itdiff;h=3Db7de110044b4e26adcb7b278d14da93133692ed7

That would mean it happens in 3.1 and later only.

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
