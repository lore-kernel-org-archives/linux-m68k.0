From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Fwd: [PATCH] [RFC] ataflop: remove buggy IRQ disable from
	do_fd_request()
Date: Sat, 10 Oct 2009 11:01:52 +0200
Message-ID: <10f740e80910100201n30367714uc57ec3c9c39b92af@mail.gmail.com>
References: <alpine.LSU.2.00.0910091141150.19284@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.00.0910091141150.19284@wotan.suse.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>

---------- Forwarded message ----------
From: Jiri Kosina <jkosina@suse.cz>
Date: Fri, 9 Oct 2009 11:53:21 +0200 (CEST)
Subject: [PATCH] [RFC] ataflop: remove buggy IRQ disable from do_fd_request()
To: Geert Uytterhoeven <geert@linux-m68k.org>, Tejun Heo
<tj@kernel.org>, Jens Axboe <jens.axboe@oracle.com>
Cc: linux-kernel@vger.kernel.org

There is a nice gem in drivers/block/ataflop.c::do_fd_request()

	void do_fd_request(struct request_queue * q)
	{
		unsigned long flags;

		DPRINT(("do_fd_request for pid %d\n",current->pid));
		while( fdc_busy ) sleep_on( &fdc_wait );
		fdc_busy = 1;
		stdma_lock(floppy_irq, NULL);

		atari_disable_irq( IRQ_MFP_FDC );
		local_save_flags(flags);        /* The request function is called with ints
		local_irq_disable();             * disabled... so must save the IPL
for later */
		redo_fd_request();
		local_irq_restore(flags);
		atari_enable_irq( IRQ_MFP_FDC );
	}

If you look at the code long enough, you will notioce that the
local_irq_disable() call is actually commented out. This has been
introduced back in 2002 in [1], but as you can see, the same bug has been
there even before, with the sti() call being commented out in the very
same way :)

I am not familiar with the code myself at all, but I guess that the whole
stuff can just be removed. Why do we need save_flags/restore_flags at all,
without actually disabling the local IRQs afterwards? The
redo_fd_request() doesn't seem to do anything that would mess with flags
inconsistently.

But I'd rather anyone who has touched the surrounding code in past years
Ack it. I can then take it through trivial tree or submit to akpm.

[1] http://lkml.org/lkml/2002/12/27/58

Signed-off-by: Jiri Kosina <jkosina@suse.cz>

---
 drivers/block/ataflop.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/block/ataflop.c b/drivers/block/ataflop.c
index 847a9e5..a5af1d6 100644
--- a/drivers/block/ataflop.c
+++ b/drivers/block/ataflop.c
@@ -1478,10 +1478,7 @@ void do_fd_request(struct request_queue * q)
 	stdma_lock(floppy_irq, NULL);

 	atari_disable_irq( IRQ_MFP_FDC );
-	local_save_flags(flags);	/* The request function is called with ints
-	local_irq_disable();		 * disabled... so must save the IPL for later */
 	redo_fd_request();
-	local_irq_restore(flags);
 	atari_enable_irq( IRQ_MFP_FDC );
 }

-- 
1.5.6




-- 
Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
