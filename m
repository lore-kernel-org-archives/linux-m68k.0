From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] aufs: Do not refer to AUFS_NAME in pr_fmt
Date: Sat, 31 Dec 2011 16:31:15 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1112311628570.14351@herc.mirbsd.org>
References: <1325264773.13595.133.camel@deadeye> <9569.1325306817@jrobl>
 <CAMuHMdXFrFqxjEBr5iG4s7naBRom6FzM6wPGi1f9HYVsv_c8dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:38898 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753179Ab1LaQhp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 31 Dec 2011 11:37:45 -0500
In-Reply-To: <CAMuHMdXFrFqxjEBr5iG4s7naBRom6FzM6wPGi1f9HYVsv_c8dg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: sfjro@users.sourceforge.net
Cc: aufs-users@lists.sourceforge.net, Debian kernel team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org

sfjro@users.sourceforge.net dixit:

>test this patch since I don't have m68k environment.

I can do that, but not too many patches at a time, since it takes
easily a whole day to compile it. (Also, my own hacking time is
limited atm.)

>It introduces a new separated file include/linux/aufs_name.h.

Isn=E2=80=99t that a bit overkill?

Geert Uytterhoeven dixit:

>On Sat, Dec 31, 2011 at 05:46,  <sfjro@users.sourceforge.net> wrote:
>> +/* fs/aufs/Makefile refers this macro */
>> +#define AUFS_NAME =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"=
aufs"
>
>If the Makefile refers to the macro, perhaps the Makefile should
>define it, and pass it with -D?

Indeed. I like Ben=E2=80=99s patch better. But if it must be a separate
file, please move the pr_fmt definition out of the Makefile and
into that file, too. Code doesn=E2=80=99t belong into a Makefile IMHO.

bye,
//mirabilos
--=20
=46WIW, I'm quite impressed with mksh interactively. I thought it was m=
uch
*much* more bare bones. But it turns out it beats the living hell out o=
f
ksh93 in that respect. I'd even consider it for my daily use if I hadn'=
t
wasted half my life on my zsh setup. :-) -- Frank Terbeck in #!/bin/mks=
h
