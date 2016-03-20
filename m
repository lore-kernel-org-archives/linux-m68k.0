From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: BUG: workqueue lockup
Date: Mon, 21 Mar 2016 11:02:09 +1300
Message-ID: <CAOmrzkKn5Cgqai_5F4rqqotmZazMKQanMjmW6L416=JxK11C=w@mail.gmail.com>
References: <87oaa9upgl.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:34569 "EHLO
	mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750942AbcCTWCK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 20 Mar 2016 18:02:10 -0400
Received: by mail-io0-f173.google.com with SMTP id m184so192541215iof.1
        for <linux-m68k@vger.kernel.org>; Sun, 20 Mar 2016 15:02:10 -0700 (PDT)
In-Reply-To: <87oaa9upgl.fsf@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Finn Thain <fthain@telegraphics.com.au>

Hi Andreas,

that's correct - the driver loops forever, retrying unsuccessful
selection attempts.

Finn had submitted a patch to ARAnyM to rectify that. I have prepared
another patch to the kernel (using presence of the natfeatures driver
to detect we're running on ARAnyM, then skipping all platform device
setup) but haven't submitted that yet.

Cheers,

  Michael


On Mon, Mar 21, 2016 at 4:41 AM, Andreas Schwab <schwab@linux-m68k.org> wrote:
> I'm getting this hangup with 4.5 in aranym:
>
> [    2.060000] scsi host0: Atari native SCSI, io_port 0x0, n_io_port 0, base 0x0, irq 15, can_queue 8, cmd_per_lun 1, sg_tablesize 0, this_id 7, flags { }, options { REAL_DMA SUPPORT_TAGS }
> [    2.110000] blk_queue_max_segments: set to minimum 1
> [   55.130000] random: nonblocking pool is initialized
> [   60.240000] BUG: workqueue lockup - pool cpus=0 node=0 flags=0x0 nice=0 stuck for 58s!
> [   60.270000] BUG: workqueue lockup - pool cpus=0 node=0 flags=0x0 nice=-20 stuck for 52s!
> [   60.300000] Showing busy workqueues and worker pools:
> [   60.310000] workqueue events: flags=0x0
> [   60.340000]   pwq 0: cpus=0 node=0 flags=0x0 nice=0 active=2/256
> [   60.340000]     pending: cache_reap, do_cache_clean
> [   60.380000] workqueue events_power_efficient: flags=0x80
> [   60.410000]   pwq 0: cpus=0 node=0 flags=0x0 nice=0 active=2/256
> [   60.410000]     pending: fb_flashcursor, neigh_periodic_work
> [   60.450000] workqueue kblockd: flags=0x18
> [   60.470000]   pwq 1: cpus=0 node=0 flags=0x0 nice=-20 active=1/256
> [   60.470000]     pending: blk_mq_timeout_work
> [   60.500000] workqueue ncr5380_0: flags=0xa
> [   60.530000]   pwq 2: cpus=0 node=0 flags=0x4 nice=0 active=1/1
> [   60.530000]     in-flight: 6:NCR5380_main
> [   60.560000] pool 2: cpus=0 node=0 flags=0x4 nice=0 hung=58s workers=2 idle: 57
>
> I assume that this has something to do with the ncr5380 updates.
>
> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
> "And now for something completely different."
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
