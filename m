From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream
 and debian-kernel
Date: Fri, 29 Mar 2013 23:47:31 +0100
Message-ID: <20130329224731.GA22830@chumley.earth.sol>
References: <5152996E.50800@gmail.com>
 <20130328211747.GA10917@chumley.earth.sol>
 <5154C5E0.3040608@gmail.com>
 <20130328231039.GA14587@chumley.earth.sol>
 <CAMuHMdWxCW0Gp8jYYk7R3WDJ8u-LJBZJ5d9jjaPAf27vXv3jDA@mail.gmail.com>
 <20130329080629.GB14587@chumley.earth.sol>
 <CAMuHMdXcy8Apvm58m4XudxfRTRa9aiTojRVanPtY3M=mTUUxqg@mail.gmail.com>
 <5155E1A3.7060307@gmail.com>
 <20130329193323.GD14587@chumley.earth.sol>
 <Pine.BSM.4.64L.1303292135220.3992@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-in-05.arcor-online.net ([151.189.21.45]:43567 "EHLO
	mail-in-05.arcor-online.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757183Ab3C2Wrh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Fri, 29 Mar 2013 18:47:37 -0400
Content-Disposition: inline
In-Reply-To: <Pine.BSM.4.64L.1303292135220.3992@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Wouter Verhelst <w@uter.be>, linux-m68k@vger.kernel.org, Ingo J?rgensmann <ij@2012.bluespice.org>

On Fri, Mar 29, 2013 at 09:38:31PM +0000, Thorsten Glaser wrote:
> 
> Avoiding gotos for the purpose of avoiding gotos is absolutely
> silly (as the compiler translates them to jumps, which are the
> same in asm) and positively harmful (for the legibility of the
> code; I wish I had goto in mksh???).

>From my Commodore Basic days I still know gotos and spaghetti. I know it
will be translated to jumps, but I thought we are programming in C and not
asm, because the readability is better. But maybe I just read too much about
python recently ;-)
 
> >I managed to build an amiga kernel from linux-source-3.8 (in experimental)
> >with this command:
> >
> >make KBUILD_DEBARCH=m68k ARCH=m68k CROSS_COMPILE=m68k-linux-gnu- deb-pkg
> 
> You can just run dpkg-buildpackage -am68k???

Because linux-source, just like linux-m68k git, does not contain a debian
directory. The linux source package (note the missing dash) does contain a
debian directory, but that fails because gencontrol.py does not run on my
box (OSError: missing file or directory with no hint what file is missing).

> >With this is should be easy to (cross-) build kernel-images for m68k with
> >additional patches and minimized config, since this does not use Debian's
> >gencontrol.py. Maybe I will try to understand that later.
> 
> I don???t think that???s a good thing. And patches can be added to the
> normal process with not too much difficulty??? but YMMV, and it???s up
> to the person doing the work.

You are right, that this is not the way to build official debian kernels,
but as far as I understand it is the correct way to build local kernels from
linux-source. This has the nice benefit, that it works identically with the
linux-m68k source, and it does not run gencontrol.py.

> IMHO we should try to get to as close to the normal Debian processes
> as possible though. I???d wager a guess and say that, if you ask, for
> example, waldi or bwh in IRC, they???d be happy to help (as opposed to
> see you doing some n??n-standard stuff).

The kernels I am building are not for official use, only for testing of new
patches. In the long run I want to understand how the offical Debian images
are built again, but unfortunately my vacation comes to an end and the new
semester is starting... it will be at least a month before I will have time
to study the Debian processes again. I may try to get crest running again
with the IDE disk before that.

Christian
