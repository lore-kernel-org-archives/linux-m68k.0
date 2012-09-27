From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: ICE
Date: Thu, 27 Sep 2012 21:19:55 +0200
Message-ID: <CAMuHMdU9ezFb2x5Fgzaqkg-OjmiCS8+j5uHFZA3cSc8DroLh6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:42994 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752320Ab2I0TT4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 27 Sep 2012 15:19:56 -0400
Received: by vcbfo13 with SMTP id fo13so2450760vcb.19
        for <linux-m68k@vger.kernel.org>; Thu, 27 Sep 2012 12:19:56 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

JFYI, I'm getting an ICE when doing a m68k allmodconfig on next-2012092=
7:

fs/gfs2/rgrp.c: In function =E2=80=98try_rgrp_unlink=E2=80=99:
fs/gfs2/rgrp.c:1625: internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://gcc.gnu.org/bugs.html> for instructions.
=46or Debian GNU/Linux specific bug reporting instructions,
see <URL:file:///usr/share/doc/gcc-4.1/README.Bugs>.
Preprocessed source stored into /tmp/ccWSprPJ.out file, please attach
this to your bugreport.
make[2]: *** [fs/gfs2/rgrp.o] Error 1

The offending line has:

struct gfs2_rbm rbm =3D { .rgd =3D rgd, .bi =3D rgd->rd_bits, .offset =3D=
 0 };

Smaller failing case:

#include <linux/gfs2_ondisk.h>
#include "glock.h"

static void try_rgrp_unlink(struct gfs2_rgrpd *rgd, u64
*last_unlinked, u64 skip)
{
        struct gfs2_rbm rbm =3D { .rgd =3D rgd, .bi =3D rgd->rd_bits, .=
offset =3D 0 };
        return;
}

Interestingly, it compiles fine if I replace "glock.h" by "incore.h"
(the former includes
the latter). If both are include (first incore.h), it also fails.

$ m68k-linux-gnu-gcc -
m68k-linux-gnu-gcc: -E or -x required when input is from standard input
ayla$ m68k-linux-gnu-gcc -v
Using built-in specs.
Target: m68k-linux-gnu
Configured with: ../src/configure -v --enable-languages=3Dc,c++
--prefix=3D/usr --enable-shared --with-system-zlib --libexecdir=3D/usr/=
lib
--without-included-gettext --enable-threads=3Dposix --enable-nls
--with-gxx-include-dir=3D/usr/m68k-linux-gnu/include/c++/4.1.2
--program-suffix=3D-4.1 --enable-__cxa_atexit --enable-clocale=3Dgnu
--enable-libstdcxx-debug --disable-libssp --disable-werror
--enable-checking=3Drelease --program-prefix=3Dm68k-linux-gnu-
--includedir=3D/usr/m68k-linux-gnu/include --build=3Dx86_64-linux-gnu
--host=3Dx86_64-linux-gnu --target=3Dm68k-linux-gnu
Thread model: posix
gcc version 4.1.2 20061115 (prerelease) (Ubuntu 4.1.1-21)

Yeah, I know it's an old compiler...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
