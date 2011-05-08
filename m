From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: Debian kernel 2.6.38-5
Date: Sun, 8 May 2011 18:59:09 +0200
Message-ID: <20110508165909.GA16281@chumley.earth.sol>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
 <Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-in-11.arcor-online.net ([151.189.21.51]:51824 "EHLO
	mail-in-11.arcor-online.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751567Ab1EHQ5x (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 May 2011 12:57:53 -0400
Content-Disposition: inline
In-Reply-To: <Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

On Sun, May 08, 2011 at 12:58:10PM +0000, Thorsten Glaser wrote:
> Geert Uytterhoeven dixit:
> 
> >  1. The critical bugfixes will go in via v2.6.38-stable anyway,
> >  2. The ARAnyM/NatFeat support will be in v2.6.39, which may be a
> >sufficiently convincing argument for the Debian Kernel Team to accept
> >it in Debian's v2.6.38,
> 
> Good news: one of my ARAnyMs will be compiling kernels for the next
> full week or so, I think (CPU power provided by Thomas Goirand this
> time, the other VMs run on boxen at tarent GmbH, if someone is in-
> terested):
> 
> ??? Accepted linux-2.6 2.6.38-5 (source all i386) Ben Hutchings
> http://lists.debian.org/debian-devel-changes/2011/05/msg00736.html

Why don't you cross-compile it? I just managed to rebuild your previous
build after I spent a day setting up a cross-compiler. Took only a couple of
hours.
 
> >  3. If there's anything left that you really need, please tell us, so
> >"we" can get it in a good shape for v2.6.40.
> 
> Bad news: Christian T. Steigies has problems on real Amiga hardware:
> 
> > However, the current (TLS) kernels have problems with the ariadne2 network
> > card, which, I think all Amigas here but crest have (ariadne1 in crest).
> > I get error messages like this with 2.6.32 and 2.6.38
> >
> >  eth0: mismatched read page pointers 4f vs 4c.
> 
> Does that ring a bell anywhere? That???s running 2.6.38-4 plus
> my patches, I think, so I expect 2.6.38-5 won???t change this.

The network (zorro8390) worked with the kernel from Stephen's netinstall iso,
it was 2.6.26. I am trying to cross-build older kernel versions, maybe I can
locate the problem. However, now I have two new problems.

How do I get the older versions from Geert's git? I don't see any other
branches, I only see tags. What is the magic word to get for example the 2.6.30
tree? 

When crosscompiling Geert's tree, shouldn't make ARCH=m68k be sufficient
(after setting up a propper .config)?
After creating a symlink to m68k-linux-gnu-gcc-4.4, this seems to work now: 
make ARCH=m68k CROSS_COMPILE=m68k-linux-gnu-
It's been so long, is this the correct way to cross-build linux-m68k? I
should write that down somewhere...

Christian
