From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: Fix for SLUB?
Date: Sat, 23 Apr 2011 20:57:25 +0200
Message-ID: <20110423185725.GA16947@chumley.earth.sol>
References: <BANLkTi=6T8SxqnsXTY5ceyikg2NTKLVSKw@mail.gmail.com>
 <BANLkTimN4vbAPJVKgH8iTZy7B5Fr8B+ibA@mail.gmail.com>
 <BANLkTikSRStQO6cyE+L2vHHe0TnkoBe8=A@mail.gmail.com>
 <BANLkTim_A-r4Khdx20tLKFU8ybtB+=wcyg@mail.gmail.com>
 <BANLkTin4=QFyQUT95d7eoXXrdkNJc=T9Tw@mail.gmail.com>
 <Pine.BSM.4.64L.1104231534340.3979@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-in-08.arcor-online.net ([151.189.21.48]:52559 "EHLO
	mail-in-08.arcor-online.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754471Ab1DWTA7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sat, 23 Apr 2011 15:00:59 -0400
Content-Disposition: inline
In-Reply-To: <Pine.BSM.4.64L.1104231534340.3979@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

On Sat, Apr 23, 2011 at 03:39:15PM +0000, Thorsten Glaser wrote:
> >On Sat, Apr 23, 2011 at 05:47, Michael Schmitz
> ><schmitzmic@googlemail.com> wrote:
> 
> >> i.e. ignoring the node_present_pages return value does result in a
> >> booting kernel even with the problematic commit included.
> 
> I???m trying now (using a cross compiler, to speed up testing).
> Sorry for not doing anything for a while, the ???air has left
> me??? (generally and due to lack of progress with m68k as one
> can only be the only fighter for ever so long).

I can understand this, but I am very impressed by all the work you have done
for m68k recently! Please don't give up.
 
> But I was just told by a member of the Debian Kernel Team on
> IRC that the patches from m68k-v2.6.38 will (probably) not be
> accepted, unless they go in via Linus??? tree. How are chances
> of that happening? (He says they had told that years ago al-
> ready.) I???ll need at least the ARAnyM/NatFeat support and some
> of the bugfixes. Otherwise I fear this keeps getting obsolete
> very fast. ???

As Geert wrote, almost all patches will make it into the official kernel
tree, only m68k usually needs them a little sooner. Is there no m68k DD left
who works on the kernel? When I was still submitting patches, there never
was a problem, but I made sure that m68k patches only got applied to the
m68k tree. Of course, the smaller the patches, the better, and Geert was
very good with sending m68k patches upstream. In case you can not get those
small patches in, I can give it a try (when I have a properly working DSL
again, and more time, so I can also set up crest and kullervo...).

Christian
