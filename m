From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: converting the NCR5380 drivers away from scsi_register
Date: Mon, 4 Aug 2014 13:28:04 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1408041146400.21367@nippy.intranet>
References: <20140616141853.GA32399@infradead.org> <alpine.LNX.2.00.1406171756040.17715@nippy.intranet> <CAMuHMdUkMHoMahyppwttnm7qs6etoqMGtvk77HezUBj-GOeMKg@mail.gmail.com> <alpine.LNX.2.00.1407301726430.9554@nippy.intranet> <53D9D4B2.9080801@gmail.com>
 <alpine.LNX.2.00.1408011307120.6796@nippy.intranet> <53DB4C98.8020907@gmail.com> <alpine.LNX.2.00.1408021106030.28603@nippy.intranet> <53DCA6AE.5060801@gmail.com> <alpine.LNX.2.00.1408031314200.545@nippy.intranet> <53DDFBC0.4050906@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:58859 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751242AbaHDD3H (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 3 Aug 2014 23:29:07 -0400
In-Reply-To: <53DDFBC0.4050906@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Michael Schmitz <schmitz@debian.org>, Sam Creasey <sammy@sammy.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Sun, 3 Aug 2014, Michael Schmitz wrote:

> > NCR5380.c lacks support for tagged queueing, while sun3_NCR5380.c and 
> > atari_NCR5380.c have divergent implementations of this.
> >   
> 
> Might be equivalent for all I've seen - just array vs. bitmap to store 
> tags..

It is messier than that. setup_use_tagged_queuing is disabled by default 
on atari, and enabled by default on sun3. If we don't disable it by 
default everywhere then we need to resolve a change to the algorithm: the 
following code appears at the beginning of NCR5380_reselect() in 
atari_NCR5380.c but appears at the end of that routine in sun3_NCR5380.c. 
I still have to try to figure out the implications of this change.

#ifdef SUPPORT_TAGS
    /* If the phase is still MSGIN, the target wants to send some more
     * messages. In case it supports tagged queuing, this is probably a
     * SIMPLE_QUEUE_TAG for the I_T_L_Q nexus.
     */
    tag = TAG_NONE;
    if (phase == PHASE_MSGIN && setup_use_tagged_queuing) {
        /* Accept previous IDENTIFY message by clearing ACK */
        NCR5380_write( INITIATOR_COMMAND_REG, ICR_BASE );
        len = 2;
        data = msg+1;
        if (!NCR5380_transfer_pio(instance, &phase, &len, &data) &&
            msg[1] == SIMPLE_QUEUE_TAG)
            tag = msg[2];
        dprintk(NDEBUG_TAGS, "scsi%d: target mask %02x, lun %d sent tag %d at "
                             "reselection\n", HOSTNO, target_mask, lun, tag);
    }
#endif

> 
> Changes to NCR5380. are rather major though. I need to carefully go 
> through the diff again. ISTR trying to run the coroutine as delayed 
> workqueue instead of immediate but dropped that again for some reason.

I don't think it makes sense to unify NCR5380.c and atari_NCR5380.c at 
this stage. The ISA cards' requirements together are more peculiar than, 
say, ST-DMA, and are mostly irrelevant to the M68k, ARM and PCI devices.

As an aside, forking NCR5380.c into atari_NCR5380.c, sun3_NCR5380.c and 
mac_NCR5380.c (deleted in v2.6.3) was clearly misguided as it never 
actually produced a good alternative to NCR5380.c.

Forking just multiplied the maintenance demands, and diminishing man-power 
of course lead to neglect and breakage. So I can sympathise with 
Christoph's comment in NCR5380.c:

 * (Note from hch:  unfortunately it was not enough for the different
 * m68k folks and instead of improving this driver they copied it
 * and hacked it up for their needs.  As a consequence they lost
 * most updates to this driver.  Maybe someone will fix all these
 * drivers to use a common core one day..)

But one core is hard, even if you have all the hardware. Two cores is 
better than three.

-- 
