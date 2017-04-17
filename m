From: Richard Z <rz@linux-m68k.org>
Subject: Re: gcc possibly generating invalid assembler
Date: Mon, 17 Apr 2017 22:01:53 +0200
Message-ID: <20170417200153.GB4475@rz.localhost.localdomain>
References: <5db978c6-15ce-c60e-d350-f9e87154e0b2@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:37394 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752904AbdDQUCH (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 17 Apr 2017 16:02:07 -0400
Received: by mail-wm0-f43.google.com with SMTP id u2so39099267wmu.0
        for <linux-m68k@vger.kernel.org>; Mon, 17 Apr 2017 13:02:07 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5db978c6-15ce-c60e-d350-f9e87154e0b2@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, Apr 13, 2017 at 01:08:59PM +0200, John Paul Adrian Glaubitz wrote:
> Hi!
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
> 
> Since the source code file in question doesn't contain any m68k inline
> assembly, I would suspect this to be a problem with the code generated
> by gcc.
> 
> Any suggestions?

The comments in gcc/config/m68k/m68k.c:m68k_final_prescan_insn() mention 
this as potential problem but I have no deep insight or clue why the solution
doesn't work.



Richard

-- 
Name and OpenPGP keys available from pgp key servers
