From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: atarimouse (was: Re: [git pull] m68k SLUB fix for 2.6.39)
Date: Wed, 4 May 2011 11:33:27 +0200
Message-ID: <BANLkTinjTOGR3-ONZTxqCQFJdq7_TsKOAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:60854 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752636Ab1EDJd2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 4 May 2011 05:33:28 -0400
Received: by bwz15 with SMTP id 15so811973bwz.19
        for <linux-m68k@vger.kernel.org>; Wed, 04 May 2011 02:33:27 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Michael,

On Sat, Apr 30, 2011 at 01:35, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
> Falcon CT60, 14MB/512MB no swap:
>
> Out of memory: Kill process 8644 (malloctest) score 967 or sacrifice =
child
> Killed process 8644 (malloctest) total-vm:512244kB, anon-rss:510088kB=
,
> file-rss:284kB

Ah, real hardware ;-)

Any chance you can try the mouse (e.g. with gpm), and check if
http://permalink.gmane.org/gmane.linux.ports.m68k/1867 is needed, so we=
 know
if this is an ARAnyM issue or not?

Thx!

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
