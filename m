From: Jens Axboe <jaxboe@fusionio.com>
Subject: Re: [GIT PULL] Core block IO bits for 2.6.39
Date: Sat, 26 Mar 2011 19:48:32 +0100
Message-ID: <4D8E3500.6090208@fusionio.com>
References: <4D8B4A89.80608@fusionio.com> <AANLkTi=zJbUpcT+vbLARyxhA34F1se8pYq9No799Zqzh@mail.gmail.com> <4D8D87B0.3080107@fusionio.com> <AANLkTi=jcm8pLQCTwYPK_Ey1SbMYSqQhYD4fJmCNz7sS@mail.gmail.com> <4D8E1A1A.8010300@fusionio.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx1.fusionio.com ([64.244.102.30]:50528 "EHLO mx1.fusionio.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753703Ab1CZSsi (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sat, 26 Mar 2011 14:48:38 -0400
In-Reply-To: <4D8E1A1A.8010300@fusionio.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Linux/m68k <linux-m68k@vger.kernel.org>

On 2011-03-26 17:53, Jens Axboe wrote:
> On 2011-03-26 17:48, Linus Torvalds wrote:
>> On Fri, Mar 25, 2011 at 11:29 PM, Jens Axboe <jaxboe@fusionio.com> wrote:
>>> +
>>> +       /* Use 3ms as that was the old plug delay */
>>> +       blk_delay_queue(q, msecs_to_jiffies(3));
>>
>> That's bogus. blk_delay_queue() already takes msecs, not jiffies.
> 
> You are right, braino.
> 
>> Also, do we really need to delay every unplug like this? It seems sad.
>> A 3ms delay is a long time these days - admittedly most people
>> hopefully use ATA these days if they have an SSD or something, but
>> still..
> 
> Depends on whether you want the 'call me back, I ran into busy this
> time' or the 'recall me immediately'.
> 
> I'll take a look at the IDE case tonight and submit a real fix.

It's not completely clear cut what the delays should be in the various
old replug cases. Only for the drive sleeping can I make an educated
guess since we now the timeout period.

So something like this. Retains the same recall delay as we had before.
Someone who cares is free to go and optimize this, if the queue rerun
delay should be shorter in some cases.

diff --git a/drivers/ide/ide-io.c b/drivers/ide/ide-io.c
index f407784..0e406d73 100644
--- a/drivers/ide/ide-io.c
+++ b/drivers/ide/ide-io.c
@@ -440,6 +440,7 @@ void do_ide_request(struct request_queue *q)
 	struct ide_host *host = hwif->host;
 	struct request	*rq = NULL;
 	ide_startstop_t	startstop;
+	unsigned long queue_run_ms = 3; /* old plug delay */
 
 	spin_unlock_irq(q->queue_lock);
 
@@ -459,6 +460,9 @@ repeat:
 		prev_port = hwif->host->cur_port;
 		if (drive->dev_flags & IDE_DFLAG_SLEEPING &&
 		    time_after(drive->sleep, jiffies)) {
+			unsigned long left = jiffies - drive->sleep;
+
+			queue_run_ms = jiffies_to_msecs(left + 1);
 			ide_unlock_port(hwif);
 			goto plug_device;
 		}
@@ -547,8 +551,10 @@ plug_device:
 plug_device_2:
 	spin_lock_irq(q->queue_lock);
 
-	if (rq)
+	if (rq) {
 		blk_requeue_request(q, rq);
+		blk_delay_queue(q, queue_run_ms);
+	}
 }
 
 void ide_requeue_and_plug(ide_drive_t *drive, struct request *rq)
@@ -562,6 +568,10 @@ void ide_requeue_and_plug(ide_drive_t *drive, struct request *rq)
 		blk_requeue_request(q, rq);
 
 	spin_unlock_irqrestore(q->queue_lock, flags);
+
+	/* Use 3ms as that was the old plug delay */
+	if (rq)
+		blk_delay_queue(q, 3);
 }
 
 static int drive_is_ready(ide_drive_t *drive)


-- 
Jens Axboe
