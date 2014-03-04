From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] m68k/atari - ide: do not register interrupt if
 host->get_lock is set
Date: Tue, 04 Mar 2014 15:59:06 -0500 (EST)
Message-ID: <20140304.155906.221185723445733090.davem@davemloft.net>
References: <1391215693-2880-1-git-send-email-schmitz@debian.org>
	<1391215693-2880-2-git-send-email-schmitz@debian.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:36958 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757072AbaCDU7I (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 4 Mar 2014 15:59:08 -0500
In-Reply-To: <1391215693-2880-2-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: schmitzmic@gmail.com
Cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org, linux-ide@vger.kernel.org, schmitz@debian.org

From: Michael Schmitz <schmitzmic@gmail.com>
Date: Sat,  1 Feb 2014 13:48:13 +1300

> On m68k, host->get_lock is used to both lock and register the interrupt
> that the IDE host shares with other device drivers. Registering the
> IDE interrupt handler in ide-probe.c results in duplicating the
> interrupt registered (once via host->get lock, and also via init_irq()),
> and may result in IDE accepting interrupts even when another driver has
> locked the interrupt hardware. This opens the whole locking scheme up
> to races.
> 
> host->get_lock is set on m68k only, so other drivers' behaviour is not
> changed.
> 
> Signed-off-by: Michael Schmitz <schmitz@debian.org>

It's a bit kludgy, but minimal and correct.

Applied, thank you.
