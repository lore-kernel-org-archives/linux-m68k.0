From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Fwd: [PATCH 35/91] arch/m68k/q40/README Update broken web
 addresses in the arch directory.
Date: Fri, 3 Sep 2010 18:47:24 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1009031837380.344@localhost>
References: <1283461746-7905-1-git-send-email-justinmattock@gmail.com> <1283461746-7905-5-git-send-email-justinmattock@gmail.com> <AANLkTimyRsVmeeM-mNwAm8uwhAEYZx4Wx56=ARy=tttO@mail.gmail.com> <alpine.OSX.2.00.1009031821450.344@localhost>
 <4C80B350.6050006@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:55368 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750852Ab0ICIrZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Sep 2010 04:47:25 -0400
In-Reply-To: <4C80B350.6050006@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Justin P. Mattock" <justinmattock@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Fri, 3 Sep 2010, Justin P. Mattock wrote:

> On 09/03/2010 01:23 AM, Finn Thain wrote:
> > 
> > URLs can't be split across lines usefully, so disregard the checkpatch
> > complaint.
> > 
> > Finn
> > 
> 
> with the coding style, what files should ignore coding style with the tab rule
> i.e. Kconfig *.c, *.h, README, etc...
> (from here Kconfig make sense due to the ncurses interface..)

I'm not sure what you mean (?)

Kconfig seems to use the <...> syntax for URLs. checkpatch doesn't 
complain about the ~90 character long URL in ./drivers/scsi/Kconfig...

Finn

> 
> > On Fri, 3 Sep 2010, Geert Uytterhoeven wrote:
> > 
> > > ---------- Forwarded message ----------
> > > From: Justin P. Mattock<justinmattock@gmail.com>
> > > Date: Thu, Sep 2, 2010 at 23:08
> > > Subject: [PATCH 35/91] arch/m68k/q40/README Update broken web
> > > addresses in the arch directory.
> > > To: trivial@kernel.org
> > > Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
> > > jkosina@suse.cz, "Justin P. Mattock"<justinmattock@gmail.com>
> > > 
> > > 
> > > The below patch updates a broken web address that is no longer
> > > working due to company buyout, and/or change of location.
> > > (Please have a look through, and let me know if any of them
> > > need to be changed, and I'll resend an updated patch).
> > > 
> > > Signed-off-by: Justin P. Mattock<justinmattock@gmail.com>
> > > 
> > > ---
> > >   arch/m68k/q40/README |    8 ++++----
> > >   1 files changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/arch/m68k/q40/README b/arch/m68k/q40/README
> > > index 6bdbf48..0d26762 100644
> > > --- a/arch/m68k/q40/README
> > > +++ b/arch/m68k/q40/README
> > > @@ -1,10 +1,10 @@
> > >   Linux for the Q40
> > >   =================
> > > 
> > > -You may try http://www.geocities.com/SiliconValley/Bay/2602/ for
> > > -some up to date information. Booter and other tools will be also
> > > -available from this place or ftp.uni-erlangen.de/linux/680x0/q40/
> > > -and mirrors.
> > > +You may try http://web.archive.org/web/*/http://geocities.com/
> > > +SiliconValley/Bay/2602/ for some up to date information. Booter
> > > +and other tools will be also available from this place or
> > > +http://www.linux-m68k.org/mail.html and mirrors.
> > > 
> > >   Hints to documentation usually refer to the linux source tree in
> > >   /usr/src/linux/Documentation unless URL given.
> > > --
> > > 1.7.2.1
> > > 
> > > --
> > > To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> > > the body of a message to majordomo@vger.kernel.org
> > > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > > Please read the FAQ at  http://www.tux.org/lkml/
> > > 
> > > 
> > > 
> 
> 
