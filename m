From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Fwd: [PATCH 36/91] arch/m68k/mac/macboing.c Update broken web
 addresses in the arch directory.
Date: Fri, 3 Sep 2010 18:32:17 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1009031823590.344@localhost>
References: <1283461746-7905-1-git-send-email-justinmattock@gmail.com> <1283461746-7905-6-git-send-email-justinmattock@gmail.com> <AANLkTikTeznNoS0CMEpMe+mJKgrjpsGf-z798vA0chbB@mail.gmail.com> <4C80AE79.2040805@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:55185 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755660Ab0ICIcS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Sep 2010 04:32:18 -0400
In-Reply-To: <4C80AE79.2040805@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Justin P. Mattock" <justinmattock@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Fri, 3 Sep 2010, Justin P. Mattock wrote:

> On 09/03/2010 12:52 AM, Geert Uytterhoeven wrote:
> > linux-alpha was the wrong list?
> 
> it is... I became overwhelmed with who to send these too i.e. having too 
> many Cc's was in question, so I used getmaintainer.pl on the first patch 
> to give me some direction on who/what/where to send these too. first was 
> --to trivial@ then from there I became hesitant on what todo.

linux-2.6.35$ ./scripts/get_maintainer.pl -f arch/m68k/mac
./scripts/get_maintainer.pl: No supported VCS found.  Add --nogit to options?
Using a git repository produces better results.
Try Linus Torvalds' latest git repository using:
git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
Joshua Thompson <funaho@jurai.org>
Geert Uytterhoeven <geert@linux-m68k.org>
Roman Zippel <zippel@linux-m68k.org>
linux-m68k@lists.linux-m68k.org
linux-kernel@vger.kernel.org

Indeed, the MAINTAINERS file says that the list for arch/m68k/mac/ is 
linux-m68k@lists.linux-m68k.org. Is this alias still working? Perhaps it 
should be changed to linux-m68k@vger.kernel.org?

I'll send another email to "funaho@jurai.org" and see what happens... but 
I think this address should be removed in favour of the the mailing list 
address because it never worked for me before.

Finn

> 
> > 
> > ---------- Forwarded message ----------
> > From: Justin P. Mattock<justinmattock@gmail.com>
> > Date: Thu, Sep 2, 2010 at 23:08
> > Subject: [PATCH 36/91] arch/m68k/mac/macboing.c Update broken web
> > addresses in the arch directory.
> > To: trivial@kernel.org
> > Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
> > jkosina@suse.cz, "Justin P. Mattock"<justinmattock@gmail.com>
> > 
> > 
> > The below patch updates a broken web address that is no longer
> > working due to company buyout, and/or change of location.
> > (Please have a look through, and let me know if any of them
> > need to be changed, and I'll resend an updated patch).
> > 
> > Signed-off-by: Justin P. Mattock<justinmattock@gmail.com>
> > 
> > ---
> >   arch/m68k/mac/macboing.c |    2 +-
> >   1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/arch/m68k/mac/macboing.c b/arch/m68k/mac/macboing.c
> > index 8f06408..e1e3377 100644
> > --- a/arch/m68k/mac/macboing.c
> > +++ b/arch/m68k/mac/macboing.c
> > @@ -114,7 +114,7 @@ static void mac_init_asc( void )
> >                          *   16-bit I/O functionality.  The PowerBook
> > 500 series computers
> >                          *   support 16-bit stereo output, but only mono
> > input."
> >                          *
> > -                        *
> > http://til.info.apple.com/techinfo.nsf/artnum/n16405
> > +                        *   http://www.apple.com/
> >                          *
> >                          * --David Kilzer
> >                          */
> > --
> > 1.7.2.1
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > Please read the FAQ at  http://www.tux.org/lkml/
> > 
> > 
> > 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
