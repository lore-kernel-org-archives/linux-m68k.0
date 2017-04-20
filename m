From: Michael Jeanson <mjeanson@ubuntu.com>
Subject: Re: gcc possibly generating invalid assembler
Date: Thu, 20 Apr 2017 17:00:35 -0400
Message-ID: <87479900-ca57-fd8c-bd74-004ec5db2a29@ubuntu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:33179 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1034224AbdDTVAr (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 20 Apr 2017 17:00:47 -0400
Received: by mail-io0-f180.google.com with SMTP id k87so86990801ioi.0
        for <linux-m68k@vger.kernel.org>; Thu, 20 Apr 2017 14:00:42 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, Apr 13, 2017 at 01:08:59PM +0200, John Paul Adrian Glaubitz wrote:
> 
> I have unsuccessfully been trying to build liburcu on Debian/m68k. After
> adding "m68k" as a detected architecture in configure.ac, the build
> fails with the assembler generating syntax error messages [1]:
> 
> gcc -DHAVE_CONFIG_H -I. -I../.. -I../../urcu   -Wdate-time -D_FORTIFY_SOURCE=2 -I../.. -I../.. -I../../tests/common -g -g -O2
> -fdebug-prefix-map=/<<PKGBUILDDIR>>=. -fstack-protector-strong -Wformat -Werror=format-security -pthread -c -o test_urcu_defer.o test_urcu_defer.c
> /tmp/ccXHVXOc.s: Assembler messages:
> /tmp/ccXHVXOc.s:312: Error: syntax error -- statement `add.l %d1,nr_writes@TLSLE+4(%a0)' ignored
> /tmp/ccXHVXOc.s:440: Error: syntax error -- statement `add.l %d1,nr_writes@TLSLE+4(%a0)' ignored

The invalid asm is related to Thread Local Storage and liburcu has a
compat layer that can be enabled at configure for platforms that don't
have it.

With './configure --disable-compiler-tls' the build succeeds and the
regression test suite completes without having to disable optimisations.

Hope this helps,

Michael
