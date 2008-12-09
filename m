From: Andreas Bombe <aeb@debian.org>
Subject: Re: [PATCH] amiflop: get rid of sleep_on calls
Date: Tue, 9 Dec 2008 18:34:12 +0000
Message-ID: <20081209183412.GA9318@infernal.debian.net>
References: <1228755578-26069-1-git-send-email-aeb@debian.org> <Pine.LNX.4.64.0812090927580.29640@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from infernal.debian.net ([87.230.26.131]:49420 "EHLO
	infernal.debian.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753547AbYLISeO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 9 Dec 2008 13:34:14 -0500
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0812090927580.29640@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

[Resend, vger appears not to like other smtp server]

On Tue, Dec 09, 2008 at 09:31:11AM +0100, Geert Uytterhoeven wrote:
> I'm afraid my Amiga floppy drive doesn't work anymore...
> Any other testers available?

I still have a long unused Amiga around.  However, it has not been
graced with Linux yet, has no network device, the harddisk wasn't
sounding very happy the last time I ran it those many years ago and that
probably didn't improve.  So I might be able to test it myself, but it
would take time to set up.

> > --- a/drivers/block/amiflop.c
> > +++ b/drivers/block/amiflop.c
> > @@ -220,19 +218,17 @@ static irqreturn_t ms_isr(int irq, void *dummy)
> >     A more generic routine would do a schedule a la timer.device */
> >  static void ms_delay(int ms)
> >  {
> > -	unsigned long flags;
> >  	int ticks;
> > +	static DECLARE_MUTEX(mutex);
>                ^^^^^^^^^^^^^
> Shouldn't this be a real mutex (declared using DEFINE_MUTEX(mutex)) instead of
> a semaphore used as a mutex?

Yes, it should be.  I came back to Linux kernel development only in the
recent months and totally missed these kind of locks.  I'll prepare a
new patch later.
