From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Futex problems with firebird3.0 and openjdk-8 on m68k
Date: Wed, 10 May 2017 22:43:48 +0200
Message-ID: <1628e911-c94f-2cdd-6c48-5a54829a032f@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:50906 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751182AbdEJUoE (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 10 May 2017 16:44:04 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Thorsten Glaser <tg@mirbsd.de>

Hi!

We're having an odd issue on Debian/m68k with both firebird3.0 and openjdk-8
hanging during build until the build process is killed.

With openjdk-8, it looks like this [1]:

checking if we are using ecj as javac... [debian/buildwatch.sh] compiler/java/jar running ...
[debian/buildwatch.sh] compiler/java/jar running ...
[debian/buildwatch.sh] compiler/java/jar running ...
[debian/buildwatch.sh] compiler/java/jar running ...
[debian/buildwatch.sh] compiler/java/jar running ...
[debian/buildwatch.sh] compiler/java/jar running ...
E: ABORT: Received INT signal (requesting cleanup and shutdown)

Which means that running "javac" just hangs forever. It seems that Thorsten Glaser
has seen this problem in the past before [2] but I don't know whether he ever
managed to fix it. The openjdk-8 package that currently exists for m68k was
actually re-packed by me by replacing libjvm.so from Andreas Schwab's build
(see below why).

And with firebird3.0 we have [3]:

make[4]: Entering directory '/<<PKGBUILDDIR>>/gen'
sh -x -c "lockfile -1 /<<PKGBUILDDIR>>/gen/Release/firebird/bin/build-db.lock && /<<PKGBUILDDIR>>/gen/Release/firebird/bin/gpre_current -m -z -n
/<<PKGBUILDDIR>>/src/misc/codes.epp /<<PKGBUILDDIR>>/temp/Release/misc/codes.cpp; res=\$?; rm -f /<<PKGBUILDDIR>>/gen/Release/firebird/bin/build-db.lock; exit
\$res"
+ lockfile -1 /<<PKGBUILDDIR>>/gen/Release/firebird/bin/build-db.lock
+ /<<PKGBUILDDIR>>/gen/Release/firebird/bin/gpre_current -m -z -n /<<PKGBUILDDIR>>/src/misc/codes.epp /<<PKGBUILDDIR>>/temp/Release/misc/codes.cpp
gpre version LI-V3.0.1.32609 Firebird 3.0
    Version(s) for database "msg.fdb"
        Firebird/Linux/M68k (access method), version "LI-V3.0.1.32609 Firebird 3.0"
        on disk structure version 12.0
+ res=0
+ rm -f /<<PKGBUILDDIR>>/gen/Release/firebird/bin/build-db.lock
+ exit 0
g++ -I/<<PKGBUILDDIR>>/src/include/gen -I/<<PKGBUILDDIR>>/src/include -Wdate-time -D_FORTIFY_SOURCE=2 -ggdb -O3 -DLINUX -pipe -MMD -fPIC
-DFB_SEND_FLAGS=MSG_NOSIGNAL -pthread -fno-rtti -g -O2 -fdebug-prefix-map=/<<PKGBUILDDIR>>=. -fstack-protector-strong -Wformat -Werror=format-security
-std=gnu++98 -fno-lifetime-dse -fno-delete-null-pointer-checks -fno-strict-aliasing  -c /<<PKGBUILDDIR>>/temp/Release/misc/codes.cpp -o
/<<PKGBUILDDIR>>/temp/Release/misc/codes.o
g++  -g -O2 -fdebug-prefix-map=/<<PKGBUILDDIR>>=. -fstack-protector-strong -Wformat -Werror=format-security -std=gnu++98 -fno-lifetime-dse
-fno-delete-null-pointer-checks -fno-strict-aliasing -fPIE -pie -Wl,-z,relro -Wl,-z,now -pthread    -Wl,--version-script,empty.vers
/<<PKGBUILDDIR>>/temp/Release/misc/codes.o /<<PKGBUILDDIR>>/temp/Release/common.a -o /<<PKGBUILDDIR>>/gen/Release/firebird/bin/codes
-L/<<PKGBUILDDIR>>/gen/Release/firebird/lib -lfbclient -ltommath -latomic_ops -lm -ldl   -lcurses
sh -x -c "lockfile -1 /<<PKGBUILDDIR>>/gen/Release/firebird/bin/build-db.lock && /<<PKGBUILDDIR>>/gen/Release/firebird/bin/codes
/<<PKGBUILDDIR>>/src/include/gen /<<PKGBUILDDIR>>/lang_helpers; res=\$?; rm -f /<<PKGBUILDDIR>>/gen/Release/firebird/bin/build-db.lock; exit \$res"
+ lockfile -1 /<<PKGBUILDDIR>>/gen/Release/firebird/bin/build-db.lock
+ /<<PKGBUILDDIR>>/gen/Release/firebird/bin/codes /<<PKGBUILDDIR>>/src/include/gen /<<PKGBUILDDIR>>/lang_helpers
(hangs here)

In both cases, attaching to the running process shows we're hanging in the futex() system call:

root@mama:~# strace -p 28109
strace: Process 28109 attached
futex(0xc5aff4f8, FUTEX_WAIT, 28113, NULL

For the openjdk-8, the issue can be worked around by replacing libjvm.so with a copy
from Andreas Schwab's openjdk-8 build for openSUSE/m68k, so it seems like the JVM
gets miscompiled on Debian/m68k.

Something similar applies to firebird3.0. When building the package in an older
change root (with glibc2.19), the problem [4].

I have tested both on Aranym and qemu-m68k, both show the same behavior. I have
also rebuilt glibc with an upstream patch from Andreas which fixed 64-bit
atomics in glibc [5] but that didn't help either. I also tried rebuilding
glibc on Aranym to make sure it wasn't miscompiled on qemu-m68k on the
buildds.

Does anyone have a suggestion where to look for problems here? I am really
running out of ideas. It's one of the weirdest problems I have ever seen.

Adrian

> [1] https://people.debian.org/~glaubitz/openjdk-8_8u131-b11-1_m68k.build
> [2] https://lists.debian.org/debian-68k/2012/08/msg00023.html
> [3] https://people.debian.org/~glaubitz/firebird3.0_3.0.1.32609.ds4-14_m68k.build
> [4] https://buildd.debian.org/status/fetch.php?pkg=firebird3.0&arch=m68k&ver=3.0.1.32609.ds4-12%2Bb1&stamp=1481424918&raw=0
> [5] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=64ae9fe45662c8994b0e56ab469b01967408a154

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
