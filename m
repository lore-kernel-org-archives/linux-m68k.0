From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: aranym bug, manifests as "ida_remove called for id=13" on recent kernels
Date: Tue, 2 Nov 2010 16:30:52 +0100
Message-ID: <AANLkTinbD+32635CYBhFGVmCrj8YxfjbR4dfSGiTQOsw@mail.gmail.com>
References: <AANLkTin4886D+-yo=zrf2Yj2R5NM9qdRkc3M9cG2rN_F@mail.gmail.com>
	<20101010144952.GF19804@ZenIV.linux.org.uk>
	<AANLkTinuA3AzMoJ82pvCuhmo59DZxL2F1j3xhXUkjj7z@mail.gmail.com>
	<20101010235256.GG19804@ZenIV.linux.org.uk>
	<20101011024103.GH19804@ZenIV.linux.org.uk>
	<20101011043632.GA2566@cynthia.pants.nu>
	<20101011044808.GI19804@ZenIV.linux.org.uk>
	<Pine.BSM.4.64L.1010111218040.23471@herc.mirbsd.org>
	<20101011133545.GJ19804@ZenIV.linux.org.uk>
	<m3wrpo24u0.fsf@hase.home>
	<20101011142428.GK19804@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:33173 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753624Ab0KBPax convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 2 Nov 2010 11:30:53 -0400
In-Reply-To: <20101011142428.GK19804@ZenIV.linux.org.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org

On Mon, Oct 11, 2010 at 16:24, Al Viro <viro@zeniv.linux.org.uk> wrote:
> BTW, any comments on signal patchset? =C2=A0Seems to work here, inclu=
ding the
> stack expansion fixes, but that's on aranym. =C2=A0I'll try to resurr=
ect the
> real hardware, but that may take a while. =C2=A0If somebody could giv=
e it a beating
> in the meanwhile...

I tried it on my Amiga 4000/040.
Without your patches, gdb gets stuck in state D+ when reaching a breakp=
oint:

| cassandra:~# gdb /tmp/hello
| GNU gdb 6.4.90-debian
| Copyright (C) 2006 Free Software Foundation, Inc.
| GDB is free software, covered by the GNU General Public License, and =
you are
| welcome to change it and/or distribute copies of it under certain con=
ditions.
| Type "show copying" to see the conditions.
| There is absolutely no warranty for GDB.  Type "show warranty" for de=
tails.
| This GDB was configured as "m68k-linux-gnu"...Using host
libthread_db library "/lib/libthread_db.so.1".
|
| (gdb) break main
| Breakpoint 1 at 0x800003fc: file /home/geert/hello.c, line 6.
| (gdb) run
| Starting program: /tmp/hello
|
| Breakpoint 1, main (argc=3D1, argv=3D0xefbeedb4) at /home/geert/hello=
=2Ec:6

With your patches, it works a bit better:

| cassandra:~# gdb /tmp/hello
| GNU gdb 6.4.90-debian
| Copyright (C) 2006 Free Software Foundation, Inc.
| GDB is free software, covered by the GNU General Public License, and =
you are
| welcome to change it and/or distribute copies of it under certain con=
ditions.
| Type "show copying" to see the conditions.
| There is absolutely no warranty for GDB.  Type "show warranty" for de=
tails.
| This GDB was configured as "m68k-linux-gnu"...Using host
libthread_db library "/lib/libthread_db.so.1".
|
| (gdb) break main
| Breakpoint 1 at 0x800003fc: file /home/geert/hello.c, line 6.
| (gdb) run
| Starting program: /tmp/hello
|
| Breakpoint 1, main (argc=3D1, argv=3D0xefcc5db4) at /home/geert/hello=
=2Ec:6
| 6	    printf("Hello, world! [C]\n");
| (gdb) cont
| Continuing.
| Hello, world! [C]
|
| Program exited normally.
| (gdb) run
| Starting program: /tmp/hello
|
| Breakpoint 1, main (argc=3D1, argv=3D0xef85bdb4) at /home/geert/hello=
=2Ec:6
| 6	    printf("Hello, world! [C]\n");
| (gdb) next
| Hello, world! [C]

After which gdb is stuck in S+, and /tmp/hello in t.

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
