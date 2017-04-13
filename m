From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: gcc possibly generating invalid assembler
Date: Thu, 13 Apr 2017 13:08:59 +0200
Message-ID: <5db978c6-15ce-c60e-d350-f9e87154e0b2@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:54311 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751131AbdDMLJN (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Thu, 13 Apr 2017 07:09:13 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Debian m68k <debian-68k@lists.debian.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi!

I have unsuccessfully been trying to build liburcu on Debian/m68k. After
adding "m68k" as a detected architecture in configure.ac, the build
fails with the assembler generating syntax error messages [1]:

gcc -DHAVE_CONFIG_H -I. -I../.. -I../../urcu   -Wdate-time -D_FORTIFY_SOURCE=2 -I../.. -I../.. -I../../tests/common -g -g -O2
-fdebug-prefix-map=/<<PKGBUILDDIR>>=. -fstack-protector-strong -Wformat -Werror=format-security -pthread -c -o test_urcu_defer.o test_urcu_defer.c
/tmp/ccXHVXOc.s: Assembler messages:
/tmp/ccXHVXOc.s:312: Error: syntax error -- statement `add.l %d1,nr_writes@TLSLE+4(%a0)' ignored
/tmp/ccXHVXOc.s:440: Error: syntax error -- statement `add.l %d1,nr_writes@TLSLE+4(%a0)' ignored

Since the source code file in question doesn't contain any m68k inline
assembly, I would suspect this to be a problem with the code generated
by gcc.

Any suggestions?

Adrian

> [1] https://people.debian.org/~glaubitz/liburcu_0.9.3-3_m68k.build

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
