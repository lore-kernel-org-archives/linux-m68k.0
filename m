From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 5/10] ide: move ack_intr() method into 'struct
	ide_port_ops' (take 2)
Date: Sun, 14 Jun 2009 13:37:35 +1000
Message-ID: <20090614033735.GB374@telegraphics.com.au>
References: <200702140101.26639.sshtylyov@ru.mvista.com> <200906131731.19917.sshtylyov@ru.mvista.com> <20090613161545.GB633@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:34438 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751390AbZFNDhh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 13 Jun 2009 23:37:37 -0400
Content-Disposition: inline
In-Reply-To: <20090613161545.GB633@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: bzolnier@gmail.com, linux-ide@vger.kernel.org, linux-m68k@vger.kernel.org

On 14/06/09 02:15, Finn Thain wrote:
> 
> > +++ ide-2.6/drivers/ide/ide-io.c
> > @@ -789,7 +789,8 @@ irqreturn_t ide_intr (int irq, void *dev
> >  
> >  	spin_lock_irqsave(&hwif->lock, flags);
> >  
> > -	if (hwif->ack_intr && hwif->ack_intr(hwif) == 0)
> > +	if (hwif->port_ops && hwif->port_ops->test_irq &&
> > +	    hwif->port_ops->test_irq(hwif) == 0)
> 
> Wouldn't that be 
> 
> +     if (hwif->port_ops && hwif->port_ops->test_irq(hwif) &&
> +         hwif->port_ops->clear_irq(hwif) == 0)
> 
> (this was never compiled?)

My bad.
(Note to self: don't try to quickly understand patches at 2am.)

> >  	case MAC_IDE_BABOON:
> >  		base = BABOON_BASE;
> > -		ack_intr = NULL;
> 
> I think you mean:
> 
> 	case MAC_IDE_BABOON:
> 		base = BABOON_BASE;
> -		ack_intr = NULL;
> +		macide_port_ops.clear_irq = NULL;
> 
> Why is this broken into two patches? Bisecting in between doesn't work.

Same here.

Sorry for the noise.

Finn
