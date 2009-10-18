From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: Fwd: [PATCH] [RFC] ataflop: remove buggy IRQ disable from
 do_fd_request()
Date: Sun, 18 Oct 2009 10:24:30 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0910180956400.17222@zirkon.biophys.uni-duesseldorf.de>
References: <alpine.LSU.2.00.0910091141150.19284@wotan.suse.de>
 <10f740e80910100201n30367714uc57ec3c9c39b92af@mail.gmail.com>
 <alpine.DEB.2.00.0910110846420.20140@zirkon.biophys.uni-duesseldorf.de>
 <20091012075850.GX9228@kernel.dk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:36682 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751180AbZJRKPe (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sun, 18 Oct 2009 06:15:34 -0400
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KRP00702DPIRU00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Sun, 18 Oct 2009 11:15:18 +0200 (MEST)
In-reply-to: <20091012075850.GX9228@kernel.dk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Jens Axboe <jens.axboe@oracle.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>

Hi Jens, Geert,

> > > 
> > > If you look at the code long enough, you will notioce that the
> > > local_irq_disable() call is actually commented out. This has been
> > > introduced back in 2002 in [1], but as you can see, the same bug has been
> > > there even before, with the sti() call being commented out in the very
> > > same way :)

Please note above: the commented out line used to be sti() - this is still 
present in 2.4.30 which I've been running for a long time. The driver uses 
timers for various tasks, and this was to ensure timer interrupts are on during 
redo_fd_request. 

The change in 2002 substituted local_irq_disable() for the sti() which seems 
clearly wrong.

> > I would rather suggest to leave the code in, and fix the buggy
> > comments instead.
> 
> What buggy comments? The comments states that interrupts are already
> disabled when entering this function, which is correct. The point is
> that doing a flags save and then an irq disable is pointless, since we
> KNOW that interrupts are already disabled.

That's what is worrying me - enabling interrupts for the sake of getting timers 
working used to be necessary at one time.

There is something else wrong with do_fd_request - if indeed interrupts are 
disabled, stdma_lock may attempt to sleep and would deadlock. 

I guess scheduling redo_fd_request as bottom half or delayed work would be 
required here. I need to look into this more closely.

	Michael
