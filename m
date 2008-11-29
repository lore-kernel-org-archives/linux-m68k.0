From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: m68k: Any plans to move over to arch/m68k/include?
Date: Sat, 29 Nov 2008 14:21:23 +0100
Message-ID: <20081129132123.GA13985@uranus.ravnborg.org>
References: <20081125201135.GB7128@uranus.ravnborg.org> <Pine.LNX.4.64.0811252134180.1823@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:49863 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751306AbYK2NYK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 29 Nov 2008 08:24:10 -0500
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0811252134180.1823@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Roman Zippel <zippel@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@vger.kernel.org, uClinux list <uclinux-dev@uclinux.org>

On Tue, Nov 25, 2008 at 09:36:37PM +0100, Geert Uytterhoeven wrote:
> On Tue, 25 Nov 2008, Sam Ravnborg wrote:
> > Almost all other architectures has moved over to arch/$ARCH/include
> > 
> > Are you planning to do so for m68k for next merge window?
> 
> So far _I_ don't have those plans.
> 
> > Remaining ones: frv, h8300, m32r, m68k and mn10300
> > The other are done or have patches queued for next merge window to do so.
> > 
> > Can I be of any help?
> 
> However, m68k keeps working fine after `mv include/asm-m68k
> arch/m68k/include/asm'. The problem is m68knommu, which includes header files
> from m68k. The m68k and m68knommu headers have to be merged first, cfr. Arnd
> Bergmann's comments and suggestions on linux-arch a while ago.

This one (and the thread following it)
http://marc.info/?l=linux-arch&m=121753383713553&w=2

I agree this is the correct approach.
Looks reasonable simple to do for anyone having the relevant toolchains
and assuming only few  pending patches in this area.

I do not have time to do it for now :-(

	Sam

