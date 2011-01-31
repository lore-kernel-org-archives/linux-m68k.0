From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: build warnings
Date: Mon, 31 Jan 2011 15:03:24 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1101311424100.6256@nippy.intranet>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de> <alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de> <AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com> <AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com>
 <Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org> <AANLkTimcvXaCqRrn+uZ9eVjxg0UyncSF1YL=Xpz2FiNF@mail.gmail.com> <Pine.BSM.4.64L.1101162226120.11797@herc.mirbsd.org> <AANLkTi=QH7=6ddP=KoTywDpYrwnB21XGnmwhmFkZganD@mail.gmail.com> <4D44F92C.2050707@gmail.com>
 <AANLkTimB1fpvMsSeTbRn5ZTU1NCpZpjrAXQ+xRShAsZN@mail.gmail.com> <4D461512.8080609@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from wormhole.pha.com.au ([203.3.69.5]:52804 "EHLO mail.pha.com.au"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754005Ab1AaEKp (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 30 Jan 2011 23:10:45 -0500
In-Reply-To: <4D461512.8080609@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org


On Mon, 31 Jan 2011, Michael Schmitz wrote:

> Geert,
> > > 
> > > Whatever the reason - the SLUB allocator either is buggy outright 
> > > for m68k, or we run into memory pressure a lot sooner than other 
> > > architectures and the VM subsystem needs optimizing for SLUB.
> > > 
> > > I'd just replace the Debian default for the m68k kernels....
> > >     
> > 
> > If switching from SLUB to SLAB fixes the problem, please enable 
> > CONFIG_SLUB_DEBUG and bring it up on lkml/with the SLUB people.
> >   
> Can do that - I'll try and collect debug data from another case I know 
> has had trouble with SLUB. I'll probably have to build a custom kernel 
> for them and test that on the live mail server. Fun ... :-)

I haven't compared the log from Thorsten's kernel failure with the 
failures I saw, but (anecdotally) my experience was the same: SLUB on m68k 
was not usable, going back some years.

The introduction of the SLUB allocator was 2.6.22, but I can't help you 
bisect because I don't recall that it worked ever (?)

Anyway, I do recall building SLUB kernels at the time that would fail more 
often than they booted ... maybe the old releases could offer some clues?

Finn

> 
> Cheers,
> 
>  Michael
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
