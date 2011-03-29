From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [regression v2.6.38] Re: [PATCH v2] brk: fix min_brk lower bound
 computation for COMPAT_BRK
Date: Tue, 29 Mar 2011 22:24:21 +0200
Message-ID: <AANLkTi=pNxVY8NZjRhT_aJMQNiTpfkmECqc-ZnTD7ynW@mail.gmail.com>
References: <alpine.LNX.2.00.1101030002390.26685@pobox.suse.cz>
	<alpine.LNX.2.00.1101031237210.26685@pobox.suse.cz>
	<alpine.LNX.2.00.1101031421470.26685@pobox.suse.cz>
	<AANLkTinK-TYnY70Wst_FTbEtn7Dwm8wEQoWMewsYM8dh@mail.gmail.com>
	<alpine.LNX.2.00.1103251119120.26754@pobox.suse.cz>
	<AANLkTi=g5z+GYkbOGbdLQcLaQkpY6yQ6tjGRjjk1H59R@mail.gmail.com>
	<alpine.LNX.2.00.1103281619320.26754@pobox.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:43505 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752537Ab1C2UYX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Mar 2011 16:24:23 -0400
In-Reply-To: <alpine.LNX.2.00.1103281619320.26754@pobox.suse.cz>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Jiri Kosina <jkosina@suse.cz>
Cc: Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Jiri,

On Mon, Mar 28, 2011 at 16:20, Jiri Kosina <jkosina@suse.cz> wrote:
> On Sat, 26 Mar 2011, Geert Uytterhoeven wrote:
>> >> | RAMDISK: gzip image found at block 0
>> >> | VFS: Mounted root (ext2 filesystem) readonly on device 1:0.
>> >> | warning: process `update' used the obsolete bdflush system call
>> >> | Fix your initscripts?
>> >> | init: cannot open inittab
>> >> | Kernel panic - not syncing: Attempted to kill init!

> Hmm, I think we'd need some refresh on what the ancient libc5-based
> binaries are actually doing.
>
> Could you please send me strace of this application (restricting it t=
o
> brk()/mmap() calls should be enough).

I managed to reproduce it inside ARAnyM, by chrooting into the ramdisk =
image.
After adding strace, "strace /sbin/init" for the success case gives:

old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) =3D 0xc0004000
old_mmap(NULL, 578, PROT_READ, MAP_SHARED, 3, 0) =3D 0xc0007000
old_mmap(NULL, 663552, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =3D=
 0xc0008000
old_mmap(0xc0008000, 426908, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED, 3, 0) =3D 0xc0008000
old_mmap(0xc0072000, 24256, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED, 3, 0x68000) =3D 0xc0072000
old_mmap(0xc0078000, 204696, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0xc0078000
brk(0x80005c8e)                         =3D 0x80005c8e
brk(0x80006000)                         =3D 0x80006000
old_mmap(NULL, 1024, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) =3D 0xc0007000

=46or the failure case:

old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) =3D 0xc0004000
old_mmap(NULL, 578, PROT_READ, MAP_SHARED, 3, 0) =3D 0xc0007000
old_mmap(NULL, 663552, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =3D=
 0xc0008000
old_mmap(0xc0008000, 426908, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED, 3, 0) =3D 0xc0008000
old_mmap(0xc0072000, 24256, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED, 3, 0x68000) =3D 0xc0072000
old_mmap(0xc0078000, 204696, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0xc0078000
brk(0x80005c8e)                         =3D 0x80006000

Major difference:

-brk(0x80005c8e)                         =3D 0x80005c8e
-brk(0x80006000)                         =3D 0x80006000
-open("/etc/inittab", O_RDONLY)          =3D 3
-fstat(3, {st_mode=3DS_IFREG|0644, st_size=3D140, ...}) =3D 0
-old_mmap(NULL, 1024, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) =3D 0xc0007000
-read(3, "tty1:console:/sbin/getty 9600 tt"..., 1024) =3D 140
-read(3, "", 1024)                       =3D 0
+brk(0x80005c8e)                         =3D 0x80006000
+open("/dev/console", O_WRONLY)          =3D 3
+write(3, "init: ", 6)                   =3D 6
+write(3, "cannot open inittab\n", 20)   =3D 20
 close(3)                                =3D 0

Seems like the binary doesn't like brk() rounding up the requested
value to the next page...

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
