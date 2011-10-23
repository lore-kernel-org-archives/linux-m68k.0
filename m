From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table
Date: Sun, 23 Oct 2011 14:20:27 +0200
Message-ID: <CAMuHMdVWAcNFeWauj-DoB3btWY9UTOBDNMzRyTvYmYaYb15N4A@mail.gmail.com>
References: <alpine.DEB.2.00.1105042033190.9040@ayla.of.borg>
	<201105050824.34056.arnd@arndb.de>
	<alpine.DEB.2.00.1105052042590.17077@ayla.of.borg>
	<m2ty70ghk9.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:44746 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755491Ab1JWMU2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 23 Oct 2011 08:20:28 -0400
In-Reply-To: <m2ty70ghk9.fsf@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux/m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, uClinux list <uclinux-dev@uclinux.org>

On Sun, Oct 23, 2011 at 11:53, Andreas Schwab <schwab@linux-m68k.org> w=
rote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>
>> From 5739b340b334de21c6da4f65d5194957662a6dd0 Mon Sep 17 00:00:00 20=
01
>> From: Geert Uytterhoeven <geert@linux-m68k.org>
>> Date: Thu, 5 May 2011 20:33:02 +0200
>> Subject: [PATCH] m68k: unistd - Comment out definitions for unimplem=
ented syscalls
>
> This is not a good idea at least for the syscalls referenced by glibc=
=2E
> It means that a glibc compiled against this <asm/unistd.h> will lose =
the
> ability to call those syscalls even if the running kernel happens to
> implement them.

But is any of them likely to be ever implemented on m68k?
Perhaps AFS, vserver and {get,put}pmsg()?
All others seem to be old, obsolete, or i386-only.

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
