From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: gnat-7 native builds failing with linker errors
Date: Sun, 16 Jul 2017 10:01:58 +0200
Message-ID: <ad2704fc-cd42-c5d5-33d4-3b4123ff5014@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:56717 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751087AbdGPICC (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 16 Jul 2017 04:02:02 -0400
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Debian m68k <debian-68k@lists.debian.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi!

I managed to cross-compile gnat-7 for m68k after getting a small fix merged
upstream [1]. Then I tried to build gnat-7 natively on qemu-m68k which failed
with [2]:

if [ xinfo = xinfo ]; then \
	makeinfo --split-size=5000000 --split-size=5000000 --split-size=5000000 --no-split -I ../../src/gcc/doc \
		-I ../../src/gcc/doc/include -o doc/gccinstall.info ../../src/gcc/doc/install.texi; \
fi
/usr/lib/gcc/m68k-linux-gnu/7/../../../m68k-linux-gnu/crt1.o: In function `_start':
(.text+0x1c): undefined reference to `main'
./xtreeprs.o: In function `_ada_xtreeprs':
xtreeprs.adb:(.text+0x4a6): undefined reference to `xtreeprs__TnamesBIP.1929'
xtreeprs.adb:(.text+0x4cc): undefined reference to `xtreeprs__TnamesBDI.1932'
xtreeprs.adb:(.text+0x168c): undefined reference to `xtreeprs__put_line__2.2465'
xtreeprs.adb:(.text+0x16b0): undefined reference to `xtreeprs__put_line__2.2465'
xtreeprs.adb:(.text+0x17d0): undefined reference to `xtreeprs__put_line__2.2465'
xtreeprs.adb:(.text+0x1802): undefined reference to `xtreeprs__put_line.2461'
xtreeprs.adb:(.text+0x23f4): undefined reference to `xtreeprs__put_line__2.2465'
xtreeprs.adb:(.text+0x26ae): undefined reference to `xtreeprs__put_line__2.2465'
xtreeprs.adb:(.text+0x28de): undefined reference to `xtreeprs__put_line__2.2465'
xtreeprs.adb:(.text+0x29a8): undefined reference to `xtreeprs__put_line.2461'
xtreeprs.adb:(.text+0x29d8): undefined reference to `xtreeprs__put_line.2461'
xtreeprs.adb:(.text+0x2a08): undefined reference to `xtreeprs__put_line.2461'
xtreeprs.adb:(.text+0x2a38): undefined reference to `xtreeprs__put_line.2461'
xtreeprs.adb:(.text+0x2cb2): undefined reference to `xtreeprs__put_line__2.2465'
xtreeprs.adb:(.text+0x2fca): undefined reference to `xtreeprs__put_line__2.2465'
xtreeprs.adb:(.text+0x309e): undefined reference to `xtreeprs__put_line.2461'
xtreeprs.adb:(.text+0x30ce): undefined reference to `xtreeprs__put_line.2461'
xtreeprs.adb:(.text+0x30ea): undefined reference to `xtreeprs___finalizer.1652'
xtreeprs.adb:(.text+0x314e): undefined reference to `xtreeprs__TnamesBDF.1940'
collect2: error: ld returned 1 exit status
gnatlink-7: error when calling /usr/bin/gcc-7
gnatmake: *** link failed.
/bin/bash: ./xtreeprs: No such file or directory
../../src/gcc/ada/Make-generated.in:28: recipe for target 'ada/treeprs.ads' failed
make[5]: *** [ada/treeprs.ads] Error 127
make[5]: *** Waiting for unfinished jobs....

Does anyone have an idea how to fix this?

Adrian

> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81446
> [2] https://people.debian.org/~glaubitz/gcc-7_7.1.0-9+b2_m68k.build

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
