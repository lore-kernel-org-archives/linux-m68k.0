From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Signal patchset (was: Re: aranym bug, manifests as "ida_remove called
 for id=13" on recent kernels)
Date: Sun, 5 Dec 2010 12:15:10 +0100
Message-ID: <AANLkTi=9B-8KN0oiXoiU+KqPt6B8Vs=d7yu9cui-7e1r@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:51920 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754353Ab0LELPN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 5 Dec 2010 06:15:13 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org

On Tue, Nov 2, 2010 at 16:30, Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
> On Mon, Oct 11, 2010 at 16:24, Al Viro <viro@zeniv.linux.org.uk> wrot=
e:
>> BTW, any comments on signal patchset? =C2=A0Seems to work here, incl=
uding the
>> stack expansion fixes, but that's on aranym. =C2=A0I'll try to resur=
rect the
>> real hardware, but that may take a while. =C2=A0If somebody could gi=
ve it a beating
>> in the meanwhile...
>
> I tried it on my Amiga 4000/040.
> Without your patches, gdb gets stuck in state D+ when reaching a brea=
kpoint:
>
> | cassandra:~# gdb /tmp/hello
> | GNU gdb 6.4.90-debian
> | Copyright (C) 2006 Free Software Foundation, Inc.
> | GDB is free software, covered by the GNU General Public License, an=
d you are
> | welcome to change it and/or distribute copies of it under certain c=
onditions.
> | Type "show copying" to see the conditions.
> | There is absolutely no warranty for GDB. =C2=A0Type "show warranty"=
 for details.
> | This GDB was configured as "m68k-linux-gnu"...Using host
> libthread_db library "/lib/libthread_db.so.1".
> |
> | (gdb) break main
> | Breakpoint 1 at 0x800003fc: file /home/geert/hello.c, line 6.
> | (gdb) run
> | Starting program: /tmp/hello
> |
> | Breakpoint 1, main (argc=3D1, argv=3D0xefbeedb4) at /home/geert/hel=
lo.c:6
>
> With your patches, it works a bit better:
>
> | cassandra:~# gdb /tmp/hello
> | GNU gdb 6.4.90-debian
> | Copyright (C) 2006 Free Software Foundation, Inc.
> | GDB is free software, covered by the GNU General Public License, an=
d you are
> | welcome to change it and/or distribute copies of it under certain c=
onditions.
> | Type "show copying" to see the conditions.
> | There is absolutely no warranty for GDB. =C2=A0Type "show warranty"=
 for details.
> | This GDB was configured as "m68k-linux-gnu"...Using host
> libthread_db library "/lib/libthread_db.so.1".
> |
> | (gdb) break main
> | Breakpoint 1 at 0x800003fc: file /home/geert/hello.c, line 6.
> | (gdb) run
> | Starting program: /tmp/hello
> |
> | Breakpoint 1, main (argc=3D1, argv=3D0xefcc5db4) at /home/geert/hel=
lo.c:6
> | 6 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf("Hello, world! [C]\n");
> | (gdb) cont
> | Continuing.
> | Hello, world! [C]
> |
> | Program exited normally.
> | (gdb) run
> | Starting program: /tmp/hello
> |
> | Breakpoint 1, main (argc=3D1, argv=3D0xef85bdb4) at /home/geert/hel=
lo.c:6
> | 6 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf("Hello, world! [C]\n");
> | (gdb) next
> | Hello, world! [C]
>
> After which gdb is stuck in S+, and /tmp/hello in t.

Unless someone objects, I'm inclined to apply Al's patchset, as it impr=
oves the
situation anyway.

OK?

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
