From: Stephen R Marenka <stephen@marenka.net>
Subject: Re: toolchain, was Re: bogl: don't know screen type 1
Date: Fri, 4 Sep 2009 20:08:30 -0500
Message-ID: <20090905010830.GA14809@marenka.net>
References: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com> <20090831120617.GA1114@marenka.net> <8259f0250908310558l3ddd5fam7d15946a7c1e8572@mail.gmail.com> <8259f0250908311511h77270544vb2dc3dd383f1add8@mail.gmail.com> <8259f0250908311516r49e54c7fi44ead0f040cade30@mail.gmail.com> <20090901151747.GB27514@marenka.net> <alpine.OSX.2.00.0909050045330.383@silk.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp.knology.net ([24.214.63.101]:60133 "EHLO smtp.knology.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933982AbZIEBIa (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Fri, 4 Sep 2009 21:08:30 -0400
Content-Disposition: inline
In-Reply-To: <alpine.OSX.2.00.0909050045330.383@silk.local>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: debian-68k@lists.debian.org, linux-m68k@vger.kernel.org

On Sat, Sep 05, 2009 at 01:43:14AM +1000, Finn Thain wrote:
> 
> On Tue, 1 Sep 2009, Stephen R Marenka wrote:
> 
> > On Tue, Sep 01, 2009 at 12:16:27AM +0200, mike wrote:
> > > Btw, i noticed an error
> > > http://people.debian.org/~smarenka/d-i/m68k/images/daily/build_nativehd.log
> > > E: Couldn't find package libnss-dns-udeb
> > > make[2]: *** [stamps/get_udebs-nativehd-stamp] Error 100
> > > make[1]: *** [_build] Error 2
> > > make: *** [build_nativehd] Error 2
> > 
> > Yep. debian-installer dailies are now *dead* until we get a modern libc
> > working.
> 
> I wonder whether there are debian source packages for binutils, gcc and 
> glibc having TLS/NPTL support for m68k.

I'd be surprised if that were the case.

> The patches posted to the binutils mailing list are incomplete. The 
> binutils patch at
> http://people.debian.org/~smarenka/m68k/tls/
> is broken according to Kolla:
> http://lists.debian.org/debian-68k/2009/07/msg00001.html
> 
> But in that post (June 28) Maxim recommends using mainline binutils, and 
> since then we have HJL binutils-2.19.51.0.14 released, "...based on 
> binutils 2009 0722 in CVS on sourceware.org..." So I guess I should start 
> there.
> 
> I understand that the current GCC (4.4) lacks the necessary patches, and 
> 4.5 is still uncooked (and that's a scary prospect). Can someone confirm 
> that this is the necessary patch for 4.4:
> http://gcc.gnu.org/ml/gcc-patches/2009-05/msg01024.html
> Presumably not this one?
> http://people.debian.org/~smarenka/m68k/tls/gcc_patch2
> (and gcc_patch1 is clearly broken... perhaps it was actually the same 
> thing before being mangled... Stephen, I don't think this "/tls" directory 
> is helping any.)

Shall I remove it then?

> Or perhaps there is a known-good gcc 4.5 snapshot (FWIW, I'd much rather 
> patch a debian compiler instead, which means 4.4 or preferably older.)

It would be wonderful to have debian gcc 4.4 building on m68k. It 
never has.

> As for eglibc, there are a number of branches listed here, 
> http://www.eglibc.org/repository
> The question is, which branch, snapshot or release might meet be suitable?
> 
> With this information, I could attempt to build a toolchain from upstream 
> sources, or figure out whether or not the debian archive has the necessary 
> source packages...

The life is fast ebbing from debian/m68k as far as I can tell. I'm not
sure if there is sufficient energy to revitalize it. I'd be delighted to
be proven wrong.

Peace,

Stephen

-- 
Stephen R. Marenka     If life's not fun, you're not doing it right!
<stephen@marenka.net>
