From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: Fwd: [PATCH] [RFC] ataflop: remove buggy IRQ disable from
 do_fd_request()
Date: Mon, 19 Oct 2009 09:35:30 +0200 (CEST)
Message-ID: <alpine.LSU.2.00.0910190932030.8582@wotan.suse.de>
References: <alpine.LSU.2.00.0910091141150.19284@wotan.suse.de> <10f740e80910100201n30367714uc57ec3c9c39b92af@mail.gmail.com> <alpine.DEB.2.00.0910110846420.20140@zirkon.biophys.uni-duesseldorf.de> <alpine.LSU.2.00.0910121106330.19284@wotan.suse.de>
 <alpine.DEB.2.00.0910182126120.6395@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0910182126120.6395@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Tejun Heo <tj@kernel.org>, Jens Axboe <jens.axboe@oracle.com>, linux-kernel@vger.kernel.org

On Sun, 18 Oct 2009, Michael Schmitz wrote:

> > The patch is not removing any locking. It only
> > 
> > 1) removes the local_irq_disable() that has been commented out for many 
> >    years already anyway
> > 2) removes the saving and restoring of CPU flags around do_fd_request(), 
> >    which is rather clearly a nop than any kind of "locking"
> > 
> > > > [1] http://lkml.org/lkml/2002/12/27/58
> > > > 
> > > > Signed-off-by: Jiri Kosina <jkosina@suse.cz>
> > > 
> > > NAck for my part. 
> > 
> > Please elaborate a little bit more which of the two points above you base 
> > your NACK on.
> 
> The removal of local_irq_disable() (which should have been local_irq_enable()) 
> just raised a flag, and I didn't immediately see why the interrupt enable had 
> been commented out. 

Yes, it has been commented out in a very non-intuitive way.

> With a bit of further thought on the matter I am satisfied that this patch will 
> not impact on driver function at all, and do not wish to sustain my objection.
> 
> IOW: Ack, and my sincere apologies for wasting your time. 

Thanks, I have added

	Acked-by: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>

to the patch changelog in my tree.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
