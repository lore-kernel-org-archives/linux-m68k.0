From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Trouble compiling stock Linux-3.0.8 for m68k using gcc-4.2.4
Date: Fri, 11 Nov 2011 19:54:38 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1111111948210.3282@herc.mirbsd.org>
References: <4EBD76B7.4010505@infraleap.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <4EBD76B7.4010505@infraleap.com>
Resent-Message-ID: <-MhiWmhFJhH.A.qn.s2XvOB@liszt>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Enver Haase <enver.haase@mauerkinder.co.uk>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org
List-Id: linux-m68k@vger.kernel.org

Enver Haase dixit:

>so I got a cross tool-chain set up on an x86_64 host.

I build only natively, regular proper Debian packages, but
from what I=E2=80=99ve seen, this was no error source.

On the other hand, a patched gcc-4.4 really helps; 4.3 and
below had more issues.

>Are there any patches for m68k somewhere?

Yes, we have some in Debian.

http://patch-tracker.debian.org/package/linux-2.6/3.0.0-6

linux-2.6 (3.0.0-6) is a Linux 3.0.8 in upstream versioning.

They=E2=80=99re not really needed to build =E2=80=9Ca=E2=80=9D kernel, thou=
gh;
in the current version we seem to only have the ST-RAM
patch (which is in 3.1 anyway). So this might be a config
issue. I suggest you have a look at the configs in the
Debian packages (just download a linux-image-*.deb and
look inside it, they have the generated Config there).

On the Debian side, ever since 3.0, there have been no
technical problems any more.

Maybe this helps, too:
deb https://www.freewrt.org/~tg/debs68k/ cross main

That=E2=80=99s a cross toolchain from Debian sid/amd64 to
Debian sid/m68k. I haven=E2=80=99t used it in a while, though=E2=80=A6
Index: https://www.freewrt.org/~tg/debs68k/debidx.htm

bye,
//mirabilos
--=20
  =E2=80=9CHaving a smoking section in a restaurant is like having
          a peeing section in a swimming pool.=E2=80=9D
=09=09=09=09=09=09-- Edward Burr
