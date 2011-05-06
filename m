From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table
Date: Fri, 6 May 2011 20:56:12 +0200
Message-ID: <BANLkTimreydRXQBURdxgZLxaa1XhUk5oOA@mail.gmail.com>
References: <alpine.DEB.2.00.1105042033190.9040@ayla.of.borg>
	<201105050824.34056.arnd@arndb.de>
	<alpine.DEB.2.00.1105052042590.17077@ayla.of.borg>
	<201105052237.11656.arnd@arndb.de>
	<BANLkTinqouGVWH8CmfM038TKFvhpJEczUQ@mail.gmail.com>
	<m38vuk9qzf.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <m38vuk9qzf.fsf@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, uClinux list <uclinux-dev@uclinux.org>

On Fri, May 6, 2011 at 10:24, Andreas Schwab <schwab@linux-m68k.org> wr=
ote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>
>> BTW, we have a hole at 218/219. I don't remember why, but it may hav=
e been
>> a placeholder for pselect6 and ppoll when that implementation was st=
ill in flux.
>> Couldn't find anything about it in git/cvs archives, so I'll check
>> have to check my
>> old mailing list archives...
>
> Probably it originated from the time when it was still deemed useful =
to
> keep the numbers in sync with the x86 ones. =C2=A0The hole is filled =
with

=46ound it. Originally we kept the numbers in sync with i386.
=46or 217/218/219 there was a brief period of overlap of up to 3 differ=
ent
syscalls for the same number: pivot_root, mincore, madvise, timer_* (wh=
ich
got accepted later), and sys_setenviron/sys_setarguments (which never
got accepted). So we kept the boat of, and never filled the
conflicting gap (except with pivot_root some time later), and lost
compatibility with i386
numbers from then on.

> mincore and madvice there (pselect6 and ppoll came much later).

Yep. pselect6 and ppoll were introduced in many archs in two steps (a
syscall number reservation and an actual hook up), because they need
TIF_RESTORE_SIGMASK. As m68k only got TIF_RESTORE_SIGMASK
last year, we never completed the second step.

Will fix.

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
