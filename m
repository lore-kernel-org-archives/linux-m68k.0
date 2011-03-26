From: Jens Axboe <jaxboe@fusionio.com>
Subject: Re: [GIT PULL] Core block IO bits for 2.6.39
Date: Sat, 26 Mar 2011 07:29:04 +0100
Message-ID: <4D8D87B0.3080107@fusionio.com>
References: <4D8B4A89.80608@fusionio.com> <AANLkTi=zJbUpcT+vbLARyxhA34F1se8pYq9No799Zqzh@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx2.fusionio.com ([64.244.102.31]:39413 "EHLO mx2.fusionio.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751146Ab1CZG3R (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sat, 26 Mar 2011 02:29:17 -0400
In-Reply-To: <AANLkTi=zJbUpcT+vbLARyxhA34F1se8pYq9No799Zqzh@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Linux/m68k <linux-m68k@vger.kernel.org>

On 2011-03-25 22:35, Geert Uytterhoeven wrote:
> Hi Jens,
> 
> On Thu, Mar 24, 2011 at 14:43, Jens Axboe <jaxboe@fusionio.com> wrote:
>> Jens Axboe (20):
>>      block: remove per-queue plugging
> 
> This one (commit 7eaceaccab5f40bbfda044629a6298616aeaed50) breaks IDE
> on Atari/m68k under ARAnyM. It hangs on:
> 
> | ide: Falcon IDE controller
> | Probing IDE interface ide0...
> | hda: Sarge m68k, ATA DISK drive
> | ide0 at 0xfff00000 on irq 15 (serialized)
> | ide-gd driver 1.18
> | hda: max request size: 128KiB
> | hda: 2118816 sectors (1084 MB) w/256KiB Cache, CHS=2102/16/63
> 
> The next expected line is the partition parsing:
> 
> | hda: AHDI hda1 hda2

Geert, does this work for you?

diff --git a/drivers/ide/ide-io.c b/drivers/ide/ide-io.c
index f407784..381017c 100644
--- a/drivers/ide/ide-io.c
+++ b/drivers/ide/ide-io.c
@@ -549,6 +549,9 @@ plug_device_2:
 
 	if (rq)
 		blk_requeue_request(q, rq);
+
+	/* Use 3ms as that was the old plug delay */
+	blk_delay_queue(q, msecs_to_jiffies(3));
 }
 
 void ide_requeue_and_plug(ide_drive_t *drive, struct request *rq)
@@ -561,6 +564,8 @@ void ide_requeue_and_plug(ide_drive_t *drive, struct request *rq)
 	if (rq)
 		blk_requeue_request(q, rq);
 
+	/* Use 3ms as that was the old plug delay */
+	blk_delay_queue(q, msecs_to_jiffies(3));
 	spin_unlock_irqrestore(q->queue_lock, flags);
 }
 

-- 
Jens Axboe
