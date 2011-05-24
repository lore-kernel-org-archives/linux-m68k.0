From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 5/6] m68k: remove duplicate memcpy() implementation
Date: Tue, 24 May 2011 09:51:15 +0200
Message-ID: <BANLkTinjZMVF5q11dORUMUDPkuYPPO=qJQ@mail.gmail.com>
References: <1303345491-27888-1-git-send-email-gerg@snapgear.com>
	<1303345491-27888-2-git-send-email-gerg@snapgear.com>
	<1303345491-27888-3-git-send-email-gerg@snapgear.com>
	<1303345491-27888-4-git-send-email-gerg@snapgear.com>
	<1303345491-27888-5-git-send-email-gerg@snapgear.com>
	<1303345491-27888-6-git-send-email-gerg@snapgear.com>
	<BANLkTi=3K=J_UrG5f-sRZDG2oiWcjejkKg@mail.gmail.com>
	<m2sjs542hh.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:63749 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753359Ab1EXHvR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 24 May 2011 03:51:17 -0400
Received: by bwz15 with SMTP id 15so5379988bwz.19
        for <linux-m68k@vger.kernel.org>; Tue, 24 May 2011 00:51:16 -0700 (PDT)
In-Reply-To: <m2sjs542hh.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: gerg@snapgear.com, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Mon, May 23, 2011 at 21:54, Andreas Schwab <schwab@linux-m68k.org> w=
rote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>
>> FWIW, my m68k-linux-gnu-gcc (4.1.2 20061115 (prerelease)) always def=
ines
>> __mc68000__ and __mc68020__, even when specifying -m68000 on the com=
mand
>> line.
>
> m68k-linux has always defined __mc68020__ unconditionally, because it
> does not support anything less.

Sorry, I'm just using my good old m68k-linux-gnu toolchain is a devil
for all ;-)

What exactly do you mean by "does not support anything less"? It seems =
it does
restrict instruction generation to 68000 if you ask for it.

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
