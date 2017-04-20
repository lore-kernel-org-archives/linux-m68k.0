From: Wouter Verhelst <wouter@debian.org>
Subject: Re: gcc possibly generating invalid assembler
Date: Thu, 20 Apr 2017 23:43:59 +0200
Message-ID: <20170420214359.footaikwxt4mscal@grep.be>
References: <87479900-ca57-fd8c-bd74-004ec5db2a29@ubuntu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from latin.grep.be ([46.4.76.168]:35813 "EHLO latin.grep.be"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1031619AbdDTVoK (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Thu, 20 Apr 2017 17:44:10 -0400
Content-Disposition: inline
In-Reply-To: <87479900-ca57-fd8c-bd74-004ec5db2a29@ubuntu.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Jeanson <mjeanson@ubuntu.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, Apr 20, 2017 at 05:00:35PM -0400, Michael Jeanson wrote:
> On Thu, Apr 13, 2017 at 01:08:59PM +0200, John Paul Adrian Glaubitz wrote:
> > 
> > I have unsuccessfully been trying to build liburcu on Debian/m68k. After
> > adding "m68k" as a detected architecture in configure.ac, the build
> > fails with the assembler generating syntax error messages [1]:
> > 
> > gcc -DHAVE_CONFIG_H -I. -I../.. -I../../urcu   -Wdate-time -D_FORTIFY_SOURCE=2 -I../.. -I../.. -I../../tests/common -g -g -O2
> > -fdebug-prefix-map=/<<PKGBUILDDIR>>=. -fstack-protector-strong -Wformat -Werror=format-security -pthread -c -o test_urcu_defer.o test_urcu_defer.c
> > /tmp/ccXHVXOc.s: Assembler messages:
> > /tmp/ccXHVXOc.s:312: Error: syntax error -- statement `add.l %d1,nr_writes@TLSLE+4(%a0)' ignored
> > /tmp/ccXHVXOc.s:440: Error: syntax error -- statement `add.l %d1,nr_writes@TLSLE+4(%a0)' ignored
> 
> The invalid asm is related to Thread Local Storage and liburcu has a
> compat layer that can be enabled at configure for platforms that don't
> have it.

Last I checked, m68k does have TLS, though. It is a requirement for
recent versions of glibc, and although the m68k port was stuck on it for
a while, recent versions should have it.

In fact, when checking the generated asm code, it shows that the
nr_writes@TLSLE indirection is used in other locations too; but those
don't have the "+4" bit right after that. I suspect that's the problem.

(then again, trying to use gcc5 rather than gcc6 does not fix the issue,
so meh)

> With './configure --disable-compiler-tls' the build succeeds and the
> regression test suite completes without having to disable optimisations.

Well, that's good to know :-)

-- 
< ron> I mean, the main *practical* problem with C++, is there's like a dozen
       people in the world who think they really understand all of its rules,
       and pretty much all of them are just lying to themselves too.
 -- #debian-devel, OFTC, 2016-02-12
