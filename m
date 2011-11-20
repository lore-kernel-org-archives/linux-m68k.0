From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: don't comment out syscalls used by glibc
Date: Sun, 20 Nov 2011 10:47:34 +0100
Message-ID: <CAMuHMdU3U2aGExbmC=aYg7p1raUSYv+nCEQC3y5iTmV0Rj-MuA@mail.gmail.com>
References: <m2d3dbd1kg.fsf@igel.home>
	<CAMuHMdVkmZs60OrQRYVGbjX8Wh86Op1kRb2gcvphUDGA5s-7Cg@mail.gmail.com>
	<m3ehxfavyp.fsf@hase.home>
	<CAMuHMdW-6W3+nZsLb2xgNX3aJczo8TpvK3Qh01Q2BwBggcNgwg@mail.gmail.com>
	<m362irav4x.fsf@hase.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:63689 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752315Ab1KTJrf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 20 Nov 2011 04:47:35 -0500
Received: by iage36 with SMTP id e36so5853689iag.19
        for <linux-m68k@vger.kernel.org>; Sun, 20 Nov 2011 01:47:34 -0800 (PST)
In-Reply-To: <m362irav4x.fsf@hase.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

Hi Andreas,

On Fri, Nov 11, 2011 at 10:03, Andreas Schwab <schwab@linux-m68k.org> w=
rote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>
>> What's the user experience advantage of glibc knowing about the sysc=
all
>> numbers for (never implemented) streams?
>
> It will try to use them, instead of denying their existence.
>
> There is no advantage in removing these definitions.

You convinced me. Queued for 3.3.

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
