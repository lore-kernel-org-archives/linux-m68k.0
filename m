From: Finn Thain <fthain@telegraphics.com.au>
Subject: toolchain, was Re: bogl: don't know screen type 1
Date: Sat, 5 Sep 2009 01:43:14 +1000 (EST)
Message-ID: <alpine.OSX.2.00.0909050045330.383@silk.local>
References: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com> <20090831120617.GA1114@marenka.net> <8259f0250908310558l3ddd5fam7d15946a7c1e8572@mail.gmail.com> <8259f0250908311511h77270544vb2dc3dd383f1add8@mail.gmail.com>
 <8259f0250908311516r49e54c7fi44ead0f040cade30@mail.gmail.com> <20090901151747.GB27514@marenka.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:36359 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753226AbZIDPym (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 4 Sep 2009 11:54:42 -0400
In-Reply-To: <20090901151747.GB27514@marenka.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Stephen R Marenka <stephen@marenka.net>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org


On Tue, 1 Sep 2009, Stephen R Marenka wrote:

> On Tue, Sep 01, 2009 at 12:16:27AM +0200, mike wrote:
> > Btw, i noticed an error
> > http://people.debian.org/~smarenka/d-i/m68k/images/daily/build_nativehd.log
> > E: Couldn't find package libnss-dns-udeb
> > make[2]: *** [stamps/get_udebs-nativehd-stamp] Error 100
> > make[1]: *** [_build] Error 2
> > make: *** [build_nativehd] Error 2
> 
> Yep. debian-installer dailies are now *dead* until we get a modern libc
> working.

I wonder whether there are debian source packages for binutils, gcc and 
glibc having TLS/NPTL support for m68k.

The patches posted to the binutils mailing list are incomplete. The 
binutils patch at
http://people.debian.org/~smarenka/m68k/tls/
is broken according to Kolla:
http://lists.debian.org/debian-68k/2009/07/msg00001.html

But in that post (June 28) Maxim recommends using mainline binutils, and 
since then we have HJL binutils-2.19.51.0.14 released, "...based on 
binutils 2009 0722 in CVS on sourceware.org..." So I guess I should start 
there.

I understand that the current GCC (4.4) lacks the necessary patches, and 
4.5 is still uncooked (and that's a scary prospect). Can someone confirm 
that this is the necessary patch for 4.4:
http://gcc.gnu.org/ml/gcc-patches/2009-05/msg01024.html
Presumably not this one?
http://people.debian.org/~smarenka/m68k/tls/gcc_patch2
(and gcc_patch1 is clearly broken... perhaps it was actually the same 
thing before being mangled... Stephen, I don't think this "/tls" directory 
is helping any.)
Or perhaps there is a known-good gcc 4.5 snapshot (FWIW, I'd much rather 
patch a debian compiler instead, which means 4.4 or preferably older.)

As for eglibc, there are a number of branches listed here, 
http://www.eglibc.org/repository
The question is, which branch, snapshot or release might meet be suitable?

With this information, I could attempt to build a toolchain from upstream 
sources, or figure out whether or not the debian archive has the necessary 
source packages...

Finn
