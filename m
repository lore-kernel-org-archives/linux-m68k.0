From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: BUG: workqueue lockup
Date: Mon, 21 Mar 2016 09:29:58 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1603210921330.15763@nippy.intranet>
References: <87oaa9upgl.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:49066 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750942AbcCTWaH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 20 Mar 2016 18:30:07 -0400
In-Reply-To: <87oaa9upgl.fsf@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org


On Sun, 20 Mar 2016, Andreas Schwab wrote:

> I'm getting this hangup with 4.5 in aranym:

Are you using this aranym patch?

https://sourceforge.net/p/aranym/bugs/40/

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

It also has to do with the assumption that aranym is the same as an atari.

Aranym doesn't actually implement a 5380 device. Instead it attempts to 
fool the operating system that runs on it. Presumably this is done to 
avoid having to modify existing operating systems.

Does Geert's "initcall_blacklist=atari_scsi_driver_init" workaround help?

-- 

> 
> Andreas.
> 
> 
