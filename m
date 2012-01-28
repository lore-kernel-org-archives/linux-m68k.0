From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible
 patch)
Date: Sat, 28 Jan 2012 20:43:36 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1201282041180.31292@herc.mirbsd.org>
References: <4F1C577D.3040908@sigon.net> <CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com>
 <CAOmrzkJO8hiMJhN5eanXpjjGnaLYrCDAbekX2=FY394+Vt1UHw@mail.gmail.com>
 <loom.20120127T184202-114@post.gmane.org> <4F245963.9070605@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:25535 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752545Ab2A1UrI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 28 Jan 2012 15:47:08 -0500
In-Reply-To: <4F245963.9070605@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: linux-m68k@vger.kernel.org

Michael Schmitz dixit:

>> Actually, it should be /dev/rtc0 (according to my Debian system)
> hwclock attempts to open /dev/rtc which is symlinked to rtc0 if udev =
is used.

Oh, fun. Good to know, then. (I just use NTP, always=E2=80=A6)

> With no helpers at all, the devices need to be static files present i=
n /dev.

Yeah, but devtmpfs creates /dev/rtc0 just fine ;-)

> rc.local hacks are always possible as a last resort :-) Good one, tho=
ugh.

They are better than having to use udev, I guess.
Probably should place the symlink for /dev/rtc in there, too=E2=80=A6
on the other hand, nope, not needed:

open("/dev/rtc", O_RDONLY|O_LARGEFILE)  =3D -1 ENOENT (No such file or =
directory)
SYS_333(0x8000520d, 0x20000, 0, 0x8000520d, 0) =3D -1072368512
SYS_333(0x2d, 0xc00182e0, 0x80000724, 0, 0) =3D -1072368512
SYS_333(0, 0xc00182e0, 0x800007d7, 0, 0) =3D -1072368512
SYS_333(0x2, 0x8000520d, 0, 0, 0)       =3D -1072368512
SYS_333(0x2, 0, 0, 0x8000668e, 0)       =3D -1072368512
open("/dev/rtc0", O_RDONLY|O_LARGEFILE) =3D 3

(What=E2=80=99s SYS_333, and why does strace not know it?)

bye,
//mirabilos
--=20
  =E2=80=9CHaving a smoking section in a restaurant is like having
          a peeing section in a swimming pool.=E2=80=9D
						-- Edward Burr
