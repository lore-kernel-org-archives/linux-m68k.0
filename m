From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: toolchain, was Re: bogl: don't know screen type 1
Date: Sun, 6 Sep 2009 15:07:02 +1000 (EST)
Message-ID: <alpine.OSX.2.00.0909061457300.415@silk.local>
References: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com> <20090831120617.GA1114@marenka.net> <8259f0250908310558l3ddd5fam7d15946a7c1e8572@mail.gmail.com> <8259f0250908311511h77270544vb2dc3dd383f1add8@mail.gmail.com>
 <8259f0250908311516r49e54c7fi44ead0f040cade30@mail.gmail.com> <20090901151747.GB27514@marenka.net> <alpine.OSX.2.00.0909050045330.383@silk.local> <20090905010830.GA14809@marenka.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:33295 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751312AbZIFFHD (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 6 Sep 2009 01:07:03 -0400
In-Reply-To: <20090905010830.GA14809@marenka.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Stephen R Marenka <stephen@marenka.net>
Cc: debian-68k@lists.debian.org, linux-m68k@vger.kernel.org



On Fri, 4 Sep 2009, Stephen R Marenka wrote:

> On Sat, Sep 05, 2009 at 01:43:14AM +1000, Finn Thain wrote:
> > 
> > The patches posted to the binutils mailing list are incomplete. The 
> > binutils patch at
> > http://people.debian.org/~smarenka/m68k/tls/
> > is broken according to Kolla:
> > http://lists.debian.org/debian-68k/2009/07/msg00001.html
> > 
> > But in that post (June 28) Maxim recommends using mainline binutils, and 
> > since then we have HJL binutils-2.19.51.0.14 released, "...based on 
> > binutils 2009 0722 in CVS on sourceware.org..." So I guess I should start 
> > there.
> > 
> > I understand that the current GCC (4.4) lacks the necessary patches, and 
> > 4.5 is still uncooked (and that's a scary prospect). Can someone confirm 
> > that this is the necessary patch for 4.4:
> > http://gcc.gnu.org/ml/gcc-patches/2009-05/msg01024.html
> > Presumably not this one?
> > http://people.debian.org/~smarenka/m68k/tls/gcc_patch2
> > (and gcc_patch1 is clearly broken... perhaps it was actually the same 
> > thing before being mangled... Stephen, I don't think this "/tls" directory 
> > is helping any.)
> 
> Shall I remove it then?

I'd remove it.

The gcc commit in question is this one,
http://gcc.gnu.org/viewcvs?view=revision&revision=147654
which appears to be the very one in the mailing list archive at the URL 
above (you can download a raw version at that URL).

A quick visual shows that tls/gcc_patch2 doesn't match the commit (the 
revision numbers in the diff confirm that it is older).

Finn
