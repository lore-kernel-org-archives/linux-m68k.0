From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: Fwd: [PATCH] [RFC] ataflop: remove buggy IRQ disable from
	do_fd_request()
Date: Mon, 12 Oct 2009 09:58:50 +0200
Message-ID: <20091012075850.GX9228@kernel.dk>
References: <alpine.LSU.2.00.0910091141150.19284@wotan.suse.de> <10f740e80910100201n30367714uc57ec3c9c39b92af@mail.gmail.com> <alpine.DEB.2.00.0910110846420.20140@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from brick.kernel.dk ([93.163.65.50]:53983 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753110AbZJLH71 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 12 Oct 2009 03:59:27 -0400
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.0910110846420.20140@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>

On Sun, Oct 11 2009, Michael Schmitz wrote:
> Hi Geert,
> 
> > There is a nice gem in drivers/block/ataflop.c::do_fd_request()
> > 
> > 	void do_fd_request(struct request_queue * q)
> > 	{
> > 		unsigned long flags;
> > 
> > 		DPRINT(("do_fd_request for pid %d\n",current->pid));
> > 		while( fdc_busy ) sleep_on( &fdc_wait );
> > 		fdc_busy = 1;
> > 		stdma_lock(floppy_irq, NULL);
> > 
> > 		atari_disable_irq( IRQ_MFP_FDC );
> > 		local_save_flags(flags);        /* The request function is called with ints
> > 		local_irq_disable();             * disabled... so must save the IPL
> > for later */
> > 		redo_fd_request();
> > 		local_irq_restore(flags);
> > 		atari_enable_irq( IRQ_MFP_FDC );
> > 	}
> > 
> > If you look at the code long enough, you will notioce that the
> > local_irq_disable() call is actually commented out. This has been
> > introduced back in 2002 in [1], but as you can see, the same bug has been
> > there even before, with the sti() call being commented out in the very
> > same way :)
> > 
> > I am not familiar with the code myself at all, but I guess that the whole
> > stuff can just be removed. Why do we need save_flags/restore_flags at all,
> > without actually disabling the local IRQs afterwards? The
> 
> The IRQ source has been disabled in the MFC by the atari_disable_irq(
> IRQ_MFP_FDC ) call just before local_save_flags(flags).  For that
> reason, the fact that local_irq_disable is commented out will not
> usually matter (a timer interrupt that would result in retrying the
> floppy request or removing the request from the queue excepted).
> 
> I would rather suggest to leave the code in, and fix the buggy
> comments instead.

What buggy comments? The comments states that interrupts are already
disabled when entering this function, which is correct. The point is
that doing a flags save and then an irq disable is pointless, since we
KNOW that interrupts are already disabled.

-- 
Jens Axboe

