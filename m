From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: don't comment out syscalls used by glibc
Date: Fri, 11 Nov 2011 09:53:07 +0100
Message-ID: <CAMuHMdW-6W3+nZsLb2xgNX3aJczo8TpvK3Qh01Q2BwBggcNgwg@mail.gmail.com>
References: <m2d3dbd1kg.fsf@igel.home>
	<CAMuHMdVkmZs60OrQRYVGbjX8Wh86Op1kRb2gcvphUDGA5s-7Cg@mail.gmail.com>
	<m3ehxfavyp.fsf@hase.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:38629 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757235Ab1KKIxI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 11 Nov 2011 03:53:08 -0500
Received: by fagn18 with SMTP id n18so1496629fag.19
        for <linux-m68k@vger.kernel.org>; Fri, 11 Nov 2011 00:53:07 -0800 (PST)
In-Reply-To: <m3ehxfavyp.fsf@hase.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

Hi Andreas,

On Fri, Nov 11, 2011 at 09:45, Andreas Schwab <schwab@linux-m68k.org> w=
rote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> On Tue, Nov 1, 2011 at 21:34, Andreas Schwab <schwab@linux-m68k.org>=
 wrote:
>>> Define again the syscalls that are used by glibc so that it is poss=
ible to
>>> compile a feature-complete glibc with the newest kernel headers.
>>
>> I'm a bit puzzled by this. What exactly is your objective? To build =
a glibc that
>> runs on any possible kernel version ever released?
>
> When building glibc it needs to know these numbers. =C2=A0Otherwise o=
nly
> stubs are generated that never try to use them.

Yes, I know that.

What's the user experience advantage of glibc knowing about the syscall
numbers for (never implemented) streams?

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
