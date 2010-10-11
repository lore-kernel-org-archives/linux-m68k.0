From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: aranym bug, manifests as "ida_remove called for id=13" on recent
 kernels
Date: Mon, 11 Oct 2010 15:24:28 +0100
Message-ID: <20101011142428.GK19804@ZenIV.linux.org.uk>
References: <AANLkTin4886D+-yo=zrf2Yj2R5NM9qdRkc3M9cG2rN_F@mail.gmail.com>
 <20101010144952.GF19804@ZenIV.linux.org.uk>
 <AANLkTinuA3AzMoJ82pvCuhmo59DZxL2F1j3xhXUkjj7z@mail.gmail.com>
 <20101010235256.GG19804@ZenIV.linux.org.uk>
 <20101011024103.GH19804@ZenIV.linux.org.uk>
 <20101011043632.GA2566@cynthia.pants.nu>
 <20101011044808.GI19804@ZenIV.linux.org.uk>
 <Pine.BSM.4.64L.1010111218040.23471@herc.mirbsd.org>
 <20101011133545.GJ19804@ZenIV.linux.org.uk>
 <m3wrpo24u0.fsf@hase.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:54731 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754709Ab0JKOYj (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 11 Oct 2010 10:24:39 -0400
Content-Disposition: inline
In-Reply-To: <m3wrpo24u0.fsf@hase.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org

On Mon, Oct 11, 2010 at 04:15:35PM +0200, Andreas Schwab wrote:
> Al Viro <viro@ZenIV.linux.org.uk> writes:
> 
> > Below is what I'm using on top of mainline kernel; it's a combination of
> > couple of patches in debian m68k kernel plus compile fixes.
> 
> Try Geert's linux-m68k tree.
> 
> > This kind of miscompile is definitely triggered in a lot of places -
> > anything that does return ERR_PTR(error) right after error = foo(...);
> > is going to get fscked and it's not a rare thing.
> 
> Only if they are optimized into tail calls.

And with -O2 4.3 does exactly that.

BTW, any comments on signal patchset?  Seems to work here, including the
stack expansion fixes, but that's on aranym.  I'll try to resurrect the
real hardware, but that may take a while.  If somebody could give it a beating
in the meanwhile...
