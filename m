From: Sam Creasey <sammy@sammy.net>
Subject: Re: Sun3 SCSI DMA, was Re: converting the NCR5380 drivers away from scsi_register
Date: Wed, 6 Aug 2014 10:42:52 -0400
Message-ID: <20140806144252.GJ21346@anhedonia>
References: <53D9D4B2.9080801@gmail.com> <alpine.LNX.2.00.1408011307120.6796@nippy.intranet> <53DB4C98.8020907@gmail.com> <alpine.LNX.2.00.1408021106030.28603@nippy.intranet> <53DCA6AE.5060801@gmail.com> <alpine.LNX.2.00.1408031314200.545@nippy.intranet> <53DDFBC0.4050906@gmail.com> <alpine.LNX.2.00.1408041146400.21367@nippy.intranet> <53E09EAE.70308@gmail.com> <alpine.LNX.2.00.1408051948330.16933@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from anhedonia.sammy.net ([174.143.180.86]:33645 "EHLO sammy.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751306AbaHFPf3 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 6 Aug 2014 11:35:29 -0400
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1408051948330.16933@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Sam Creasey <sammy@sammy.net>, Michael Schmitz <schmitzmic@gmail.com>, Christoph Hellwig <hch@infradead.org>, Michael Schmitz <schmitz@debian.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Aug 06, 2014 at 11:25:18AM +1000, Finn Thain wrote:
> 
> On Tue, 5 Aug 2014, Michael Schmitz wrote:
> 
> > 
> > On Sun3, the code is not even configured from what I've seen 
> > (SUPPORT_TAGS not defined)
> > 
> [...]
> > 
> > That's what I meant to say before - sun3_NCR5380.c does peek at the 
> > message byte without invoking NCR5380_transfer_pio() (needs to manually 
> > set/clear ACK for that resason, finds the disconnected command at issue, 
> > does some DMA setup stuff for that command, and then goes ahead to fetch 
> > the tag message bytes if the phase is still at message in. No idea where 
> > the variable 'phase' gets set in that routine so it might never get to 
> > read tag messages.
> > 
> > atari_NCR5390.c does things a bit different - instead of peeking at the 
> > message byte, NCR5380_transfer_pio() is used for the first message byte 
> > (ACK set there, cleared manually later). NCR5380_transfer_pio() sets the 
> > current phase, so the subsequent transfer of the tag message may work 
> > there (again ACK raised in NCR5380_transfer_pio(), cleared manually 
> > later).
> 
> Yes, but why the discrepancy?
> 
> Not unlike the use of DMA in NCR5380_reselect(), the sun3 version of 
> NCR5380_information_transfer() also uses DMA in one situation where the 
> atari version uses PIO. That is, when phase == PHASE_DATA_IN && 
> cmd->device->borken.
> 
> Can we just use the PIO code from atari_NCR5380, or should we keep the DMA 
> versions with #ifdef CONFIG_SUN3? Sam?

Oof, my memory is hazy around this one, but I would strongly hesitate
to use the PIO version from the atari driver.  IIRC, the DMA
controller for the sun3's NCR5380 implementation is extremely fussy
about what happens in which phase, and it's quick to anger if you
don't handle everything exactly how it expects.
 
> > From what I've checked both should work, but the sun3 code never sets 
> > 'phase' so it should never actually have worked. It should not even 
> > compile.
> 
> I guess that's why sun3_scsi leaves SUPPORT_TAGS undefined. I suppose we 
> can ignore all the code in sun3_NCR5380.c that is conditional upon #ifdef 
> SUPPORT_TAGS. (That's actually how I did my preliminary merge patches.)
> 
> I guess having two versions of the NCR5380_transfer_dma() routine is 
> reasonable but it would be nice if some of the other discrepancies could 
> be resolved. Without knowledge of the Sun 3 DMA hardware it is difficult 
> to avoid some questionable #ifdefs.

I definitely remember that the DMA setup logic from the atari version
did not work at all on sun3.  Unfortunatly working from 15 year old
memories, I can't quickly recall what the discrepencies were.  I never
did find any documentation for that DMA chip, so there was a heck of a
lot of trial and error on getting to a working driver.

-- Sam
