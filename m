From: Arno Griffioen <arno@ancienthardware.org>
Subject: Re: New maintainer and hosting needed for linux-m68k.org services
 (DNS, Email, Web)
Date: Mon, 20 Jul 2015 07:30:54 +0200
Message-ID: <20150720053054.GA4121@attic.nerdnet.nl>
References: <20150716094407.GH14954@ancienthardware.org>
 <CAMuHMdULThNpYzHQuoHiuC0qmc9=OrC3f24d4i_g_ftG4V69bQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cpsmtpb-ews01.kpnxchange.com ([213.75.39.4]:63320 "EHLO
	cpsmtpb-ews01.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754058AbbGTFa6 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Mon, 20 Jul 2015 01:30:58 -0400
Content-Disposition: inline
In-Reply-To: <CAMuHMdULThNpYzHQuoHiuC0qmc9=OrC3f24d4i_g_ftG4V69bQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arno Griffioen <arno@ancienthardware.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, Jul 19, 2015 at 11:25:59AM +0200, Geert Uytterhoeven wrote:
> Thanks a lot for taking care of linux-m68k.org for the past (almost) 18 years!

No prob! Case of having the resources available at the time and just 
fun doing it.

The resources may come to an end and life is sorta getting in the way at the
moment so I want to make sure things are moved to a new site and maintainer 
before things start to break :)

> As one of the big users of the email service, I can offer to have
> linux-m68k.org hosted at Gandi (I have my company domain there, too).
> That would include DNS and email forwarding.

First I'd lke to thank everyone who has already offered (virtual-)server 
capacity to host this! Looks like it should not be an issue to move this
over to a different location/site.

But to keep things easily maintainable, a solution like Geert proposes is 
probably the most practical.

'Hitch-hiking' on top of an existing service means that it removed most of
the secondary work like keeping the underlying setup (OS, spamfilters, etc.)
up to date for the person administering the forwarding adresses.

The email forwarding itself is little or no work as modifications/update on 
the adresses are few and far between. Once it's set up it's mostly done..

> For the website (This is static pages only, right? How big is it currently?),
> I have to check whether I can easily add a vhost for that.
> It could easily point elsewhere, too.
> I do not have time to actively maintain the website's pages, though.

Website is as far as I know all static pages with perhaps an ancient CGI
script that's probably broken anyway. Also there's the mac FTP site data but 
that has already been moved to a HTTP setup in the past so that's plain files 
too.

We haven't had an active webmaster for the last 8 to 10 years I think so 
yeah.. It's pretty ancient :)

I hate doing HTML or most *ML stuff myself so I have not really touched 
it.

> Is there anything else than DNS, email forwarding, and website, cfr. the
> "etc."?

Not as far as I can see.

Mailing list(s) have been on vger for ages and other services like CVS 
trees and the like have always been hosted on various other machines
in different locations over time. Same for some of the subdomains like
the NeXT stuff.

So it's basically:

- DNS zones
- Email alias forwarding (no local mailboxes)
- (static) Webpages

I agree that putting DNS+email forwarding with a domain registry is
probably the easiest to do. 

The webpages could be hosted on a simple virtual server or at some time
moved to some content-management setup to make it more easily maintainable
for others if.

							Bye, Arno.
