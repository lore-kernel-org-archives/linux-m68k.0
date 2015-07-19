From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: New maintainer and hosting needed for linux-m68k.org services
 (DNS, Email, Web)
Date: Sun, 19 Jul 2015 13:20:38 +0200
Message-ID: <20150719112038.GA9976@guido.earth.sol>
References: <20150716094407.GH14954@ancienthardware.org>
 <CAMuHMdULThNpYzHQuoHiuC0qmc9=OrC3f24d4i_g_ftG4V69bQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-in-08.arcor-online.net ([151.189.21.48]:49488 "EHLO
	mail-in-08.arcor-online.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752610AbbGSLVc (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sun, 19 Jul 2015 07:21:32 -0400
Content-Disposition: inline
In-Reply-To: <CAMuHMdULThNpYzHQuoHiuC0qmc9=OrC3f24d4i_g_ftG4V69bQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arno Griffioen <arno@ancienthardware.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, Jul 19, 2015 at 11:25:59AM +0200, Geert Uytterhoeven wrote:
> On Thu, Jul 16, 2015 at 11:44 AM, Arno Griffioen
> <arno@ancienthardware.org> wrote:
> > It looks like in about a year I'll be losing the option to keep on
> > hosting the linux-m68k.org services as far as DNS, email(-forwarding)
> > and webpages goes. Also I'm no longer in a position to have the option
> > of setting it up again somewhere else.
> >
> > I'm quite happy to keep sponsoring the yearly registration fees for the
> > domain itself, but the technical/operational side will need a new home to
> > keep running.
> >
> > So i'm asking for someone to take over these services. I can provide copies of
> > the relevant data (DNS zone files, current email aliases, HTML files, etc.) so
> > everything can be migrated in due time.
> >
> > If anyone wants to take this on, let me know! Thanks!
> 
> Thanks a lot for taking care of linux-m68k.org for the past (almost) 18 years!

Lets buy Arno some beers at debconf as a little thank you. Are you still in
The Hague as listed on mirrors.html?  Maybe they have reasonable beer as
well, I'll be there in a couple of weeks.  BTW why is there a link to
discover instead of Chris' homepage?  I think the pages need some attention,
last updated 1999/2000, potato is just released. Some of the links are
outdated: Geocities closed in 2009.
 
> As one of the big users of the email service, I can offer to have
> linux-m68k.org hosted at Gandi (I have my company domain there, too).
> That would include DNS and email forwarding.

We can start a little collection at our next meeting perhaps, or is there a
way to donate money to linux-m68k? As DD a domain costs only 7 or 8EUR per
year, two beers...

> For the website (This is static pages only, right? How big is it currently?),
> I have to check whether I can easily add a vhost for that.
> It could easily point elsewhere, too.
> I do not have time to actively maintain the website's pages, though.
> 
> Is there anything else than DNS, email forwarding, and website, cfr. the
> "etc."?

A long time ago cvs.linux-m68k was hosted on kullervo (it's still pointing
there, but kullervo is not online). I tried to convert this to git, it is
now on people.d.o:
https://people.debian.org/~cts/m68kboot.git/
If the website is not too big (and if it is allowed by debian), we could put
a copy of it on a debian server. But something that could be editable by a
few more people (mabye not a CMS) would be nice to keep it a bit more up to
date?

Christian
