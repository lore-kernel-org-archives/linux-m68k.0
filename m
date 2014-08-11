From: Sam Creasey <sammy@sammy.net>
Subject: Re: Sun3 SCSI DMA, was Re: converting the NCR5380 drivers away from scsi_register
Date: Mon, 11 Aug 2014 11:10:45 -0400
Message-ID: <20140811151045.GO21346@anhedonia>
References: <53DB4C98.8020907@gmail.com> <alpine.LNX.2.00.1408021106030.28603@nippy.intranet> <53DCA6AE.5060801@gmail.com> <alpine.LNX.2.00.1408031314200.545@nippy.intranet> <53DDFBC0.4050906@gmail.com> <alpine.LNX.2.00.1408041146400.21367@nippy.intranet> <53E09EAE.70308@gmail.com> <alpine.LNX.2.00.1408051948330.16933@nippy.intranet> <20140806144252.GJ21346@anhedonia> <53E48E50.8010600@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from anhedonia.sammy.net ([174.143.180.86]:34117 "EHLO sammy.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753706AbaHKPLH (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 11 Aug 2014 11:11:07 -0400
Content-Disposition: inline
In-Reply-To: <53E48E50.8010600@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Sam Creasey <sammy@sammy.net>, Finn Thain <fthain@telegraphics.com.au>, Christoph Hellwig <hch@infradead.org>, Michael Schmitz <schmitz@debian.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Fri, Aug 08, 2014 at 08:46:08PM +1200, Michael Schmitz wrote:
> Hi Sam,
> >>>atari_NCR5390.c does things a bit different - instead of peeking at the 
> >>>message byte, NCR5380_transfer_pio() is used for the first message byte 
> >>>(ACK set there, cleared manually later). NCR5380_transfer_pio() sets the 
> >>>current phase, so the subsequent transfer of the tag message may work 
> >>>there (again ACK raised in NCR5380_transfer_pio(), cleared manually 
> >>>later).
> >>>      
> >>Yes, but why the discrepancy?
> >>
> >>Not unlike the use of DMA in NCR5380_reselect(), the sun3 version of 
> >>NCR5380_information_transfer() also uses DMA in one situation where the 
> >>atari version uses PIO. That is, when phase == PHASE_DATA_IN && 
> >>cmd->device->borken.
> >>
> >>Can we just use the PIO code from atari_NCR5380, or should we keep the 
> >>DMA versions with #ifdef CONFIG_SUN3? Sam?
> >>    
> >
> >Oof, my memory is hazy around this one, but I would strongly hesitate
> >to use the PIO version from the atari driver.  IIRC, the DMA
> >controller for the sun3's NCR5380 implementation is extremely fussy
> >about what happens in which phase, and it's quick to anger if you
> >don't handle everything exactly how it expects.
> >  
> 
> Does the DMA controller also sit in between the bus and the NCR chip, as 
> on Falcon? Otherwise, I can't see how it would matter if we just bypass 
> it and use PIO instead.
> 
> The PIO code from the Atari driver worked just fine for the Mac 5380 (in 
> fact, the first Mac driver used PIO for everything, including data in/out).

PIO definitely works on the Sun3 implementation under the right
circumstances, I ran it in PIO mode only for a while (much like the
Mac driver).

I can't remember the bus configuration offhand.

> >  
> >>>From what I've checked both should work, but the sun3 code never sets 
> >>>'phase' so it should never actually have worked. It should not even 
> >>>compile.
> >>>      
> >>I guess that's why sun3_scsi leaves SUPPORT_TAGS undefined. I suppose we 
> >>can ignore all the code in sun3_NCR5380.c that is conditional upon #ifdef 
> >>SUPPORT_TAGS. (That's actually how I did my preliminary merge patches.)
> >>
> >>I guess having two versions of the NCR5380_transfer_dma() routine is 
> >>reasonable but it would be nice if some of the other discrepancies could 
> >>be resolved. Without knowledge of the Sun 3 DMA hardware it is difficult 
> >>to avoid some questionable #ifdefs.
> >>    
> >
> >I definitely remember that the DMA setup logic from the atari version
> >did not work at all on sun3. 
> 
> No surprise there - DMA is implementation specific and needs to be 
> handled on a per-case basis.
> 
> > Unfortunatly working from 15 year old
> >memories, I can't quickly recall what the discrepencies were.  I never
> >did find any documentation for that DMA chip, so there was a heck of a
> >lot of trial and error on getting to a working driver.
> >  
> 
> Do you still have the hardware to test (PIO in reselection, to be 
> specific)?

Yes, I still have hardware.  I'll try to dig something out and make
sure the last kernel I've actually tested still works before trying
anything new...

-- Sam
 
> Cheers,
> 
>    Michael
> 
