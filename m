From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: What ISA hardware is integrated into m68k bridges
Date: Tue, 22 May 2012 21:52:47 +0200
Message-ID: <CAMuHMdWZb1=R8Wc=hyxbGSzBJ8BzSOaXOcyW1Pgj9EPoJZsBFw@mail.gmail.com>
References: <20120520163105.GC21177@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:63551 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932198Ab2EVTws convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 22 May 2012 15:52:48 -0400
Received: by yhmm54 with SMTP id m54so5846970yhm.19
        for <linux-m68k@vger.kernel.org>; Tue, 22 May 2012 12:52:48 -0700 (PDT)
In-Reply-To: <20120520163105.GC21177@windriver.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-m68k@vger.kernel.org, Alan Cox <alan@linux.intel.com>

Hi Paul,

On Sun, May 20, 2012 at 6:31 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> A discussion is underway with respect to the future of the various IS=
A
> drivers[1], and Alan suggested checking with the m68k folks:
>
> =C2=A0Check with the M68K people however. 3c501 won't matter to them =
but I'm
> =C2=A0not sure which of the other chips ended up on Amiga ISA bridges=
=2E I know
> =C2=A0NE2000 clones did.
>
> I know you've currently got that "almost ne2k" driver that runs IRQ-l=
ess. =C2=A0Are
> there other "ISA-like" onboard devices in the M68k harware scope that=
 rely on
> existing (x86) ISA drivers?

IIRC, the only m68k machines (supported by Linux) with ISA slots are:
  - Q40/Q60, probably used with NE2000 cards only,
  - Various Amiga bridgeboards, none of which are supported,
  - Apollo DN, used with a 3Com 3c505 ISA Ethernet card (preferably the
    version with an Apollo boot ROM), but the (changes to the existing)=
 driver
    never entered mainline, witnessed by the orphan APOLLO_ELPLUS confi=
g
    option we removed a few years ago.

Apart from that, several "ISA" (Ethernet) chips were/are used, as
typically that's
the simplest solution to add peripheral support to a CPU local bus usin=
g a
minimum of glue logic.

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
