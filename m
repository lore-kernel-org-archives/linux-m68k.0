From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: [PATCH] m68k: handle Atari interrupts in multi-platform kernels
Date: Mon, 26 Aug 2013 17:25:30 +0200
Message-ID: <20130826152530.GA10146@chumley.earth.sol>
References: <201308092135.r79LZwL1013105@herc.mirbsd.org>
 <Pine.BSM.4.64L.1308092147300.28970@herc.mirbsd.org>
 <f853f42622f9fd3b1f832a3b2b1d04ae@biophys.uni-duesseldorf.de>
 <CAMuHMdWNHyTUYrcn9M2wn5-1+KYi+momBKHE2t9y4zXAEvygrw@mail.gmail.com>
 <Pine.BSM.4.64L.1308221903570.2722@herc.mirbsd.org>
 <162721916.231588.1377514666818.open-xchange@ox-webdesk.1and1.fr>
 <Pine.BSM.4.64L.1308261107520.19888@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-in-04.arcor-online.net ([151.189.21.44]:37298 "EHLO
	mail-in-04.arcor-online.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752002Ab3HZPZd (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Mon, 26 Aug 2013 11:25:33 -0400
Content-Disposition: inline
In-Reply-To: <Pine.BSM.4.64L.1308261107520.19888@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Laurent Vivier <laurent@vivier.eu>, Geert Uytterhoeven <geert@linux-m68k.org>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Mon, Aug 26, 2013 at 11:12:38AM +0000, Thorsten Glaser wrote:
> Laurent Vivier dixit:
> 
> >I'd like to test this on my Quadra 800, where can I find the .deb ?
> 
> In Debian unstable: apt-get install linux-image-3.10-2-m68k
> (or better linux-image-m68k which is the metapackage).
> 
> The .deb is not usable outside of a running unstable installation.
> 
> If you ???just??? want to test the kernel:
> http://www.freewrt.org/~tg/f/vmlinux-3.10-2-m68k.gz
> 
> Maybe this initrd (generated on the Atari VM buildd) can
> work for you somewhat (but this is totally unsupported,
> and you really must install the kernel in an up-to-date
> Debian unstable system for reliable operation):
> http://zigo.mirbsd.org:8080/t/initrd.img-3.10-2-m68k

Do you get segfaults on aranym when you create the initrd? I get lots on
crest and kullervo, I am not sure iif it is always in the same place.
Probably some modules are not working then, so maybe one initrd for all
would be a good option. I do have the impression that with 3.10 there are
less segfaults than before, but I can not quantify that...

Christian
