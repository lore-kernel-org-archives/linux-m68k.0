From: Wouter Verhelst <wouter@debian.org>
Subject: Re: gcc possibly generating invalid assembler
Date: Fri, 14 Apr 2017 09:36:51 +0200
Message-ID: <20170414073651.bwpg7plhfz23v24b@grep.be>
References: <5db978c6-15ce-c60e-d350-f9e87154e0b2@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from latin.grep.be ([46.4.76.168]:54792 "EHLO latin.grep.be"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750784AbdDNIR0 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Fri, 14 Apr 2017 04:17:26 -0400
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

Interesting.

> Since the source code file in question doesn't contain any m68k inline
> assembly, I would suspect this to be a problem with the code generated
> by gcc.
> 
> Any suggestions?

I wanted to have a closer look, so added a line saying "[m68k],
[ARCHTYPE="gcc"]," to the AS_CASE statement in configure.ac (which I'm
assuming is what you did, too; next time it would be useful if you
shared your patches ;-) ). Then I ran make until it encountered the
above error.

Then I ran 'make CFLAGS=-save-temps' to see whether it perhaps did add
some inline assembly somewhere but you missed the #include and this time
it... worked?

Not sure what's going on here.

-- 
< ron> I mean, the main *practical* problem with C++, is there's like a dozen
       people in the world who think they really understand all of its rules,
       and pretty much all of them are just lying to themselves too.
 -- #debian-devel, OFTC, 2016-02-12
