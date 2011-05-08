From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: atarimouse (was: Re: [git pull] m68k SLUB fix for 2.6.39)
Date: Sun, 8 May 2011 10:44:31 +0200
Message-ID: <BANLkTi=uba-DyJQ9dXD6B2LoSZcZDfzs1w@mail.gmail.com>
References: <BANLkTinjTOGR3-ONZTxqCQFJdq7_TsKOAA@mail.gmail.com>
	<BANLkTimLx0PkUUhL+HY1vDoL=SB5QZPweQ@mail.gmail.com>
	<BANLkTikrv3HpX47sGbLH462-WKO0bTqMXg@mail.gmail.com>
	<BANLkTi=NcU7Z5qg-tZHkPaiYKTRXO-B-qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:64776 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751361Ab1EHIof convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 May 2011 04:44:35 -0400
Received: by bwz15 with SMTP id 15so3351705bwz.19
        for <linux-m68k@vger.kernel.org>; Sun, 08 May 2011 01:44:34 -0700 (PDT)
In-Reply-To: <BANLkTi=NcU7Z5qg-tZHkPaiYKTRXO-B-qg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Fri, May 6, 2011 at 10:42, Michael Schmitz <schmitzmic@googlemail.co=
m> wrote:
>> I've installed gpm but all I ever get when I move the mouse is
>> keyboard overruns. Does that ring a bell, anyone?
>
> Looks like I need to move the mouse real slow - it appears the patch
> is still needed. Moving the mouse down moves the cursor up. The
> buttons are reversed as well.
>
> I'll have to put the actual input interface call in a tasklet perhaps=
,
> to shorten the time spent in the mouse interrupt handler.

Thanks, will apply and queue for 2.6.40.

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
