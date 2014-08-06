From: Finn Thain <fthain@telegraphics.com.au>
Subject: Sun3 SCSI DMA, was Re: converting the NCR5380 drivers away from
 scsi_register
Date: Wed, 6 Aug 2014 11:25:18 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1408051948330.16933@nippy.intranet>
References: <20140616141853.GA32399@infradead.org> <alpine.LNX.2.00.1406171756040.17715@nippy.intranet> <CAMuHMdUkMHoMahyppwttnm7qs6etoqMGtvk77HezUBj-GOeMKg@mail.gmail.com> <alpine.LNX.2.00.1407301726430.9554@nippy.intranet> <53D9D4B2.9080801@gmail.com>
 <alpine.LNX.2.00.1408011307120.6796@nippy.intranet> <53DB4C98.8020907@gmail.com> <alpine.LNX.2.00.1408021106030.28603@nippy.intranet> <53DCA6AE.5060801@gmail.com> <alpine.LNX.2.00.1408031314200.545@nippy.intranet> <53DDFBC0.4050906@gmail.com>
 <alpine.LNX.2.00.1408041146400.21367@nippy.intranet> <53E09EAE.70308@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:52179 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751981AbaHFB0V (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 5 Aug 2014 21:26:21 -0400
In-Reply-To: <53E09EAE.70308@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sam Creasey <sammy@sammy.net>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Christoph Hellwig <hch@infradead.org>, Michael Schmitz <schmitz@debian.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Tue, 5 Aug 2014, Michael Schmitz wrote:

> 
> On Sun3, the code is not even configured from what I've seen 
> (SUPPORT_TAGS not defined)
> 
[...]
> 
> That's what I meant to say before - sun3_NCR5380.c does peek at the 
> message byte without invoking NCR5380_transfer_pio() (needs to manually 
> set/clear ACK for that resason, finds the disconnected command at issue, 
> does some DMA setup stuff for that command, and then goes ahead to fetch 
> the tag message bytes if the phase is still at message in. No idea where 
> the variable 'phase' gets set in that routine so it might never get to 
> read tag messages.
> 
> atari_NCR5390.c does things a bit different - instead of peeking at the 
> message byte, NCR5380_transfer_pio() is used for the first message byte 
> (ACK set there, cleared manually later). NCR5380_transfer_pio() sets the 
> current phase, so the subsequent transfer of the tag message may work 
> there (again ACK raised in NCR5380_transfer_pio(), cleared manually 
> later).

Yes, but why the discrepancy?

Not unlike the use of DMA in NCR5380_reselect(), the sun3 version of 
NCR5380_information_transfer() also uses DMA in one situation where the 
atari version uses PIO. That is, when phase == PHASE_DATA_IN && 
cmd->device->borken.

Can we just use the PIO code from atari_NCR5380, or should we keep the DMA 
versions with #ifdef CONFIG_SUN3? Sam?

> From what I've checked both should work, but the sun3 code never sets 
> 'phase' so it should never actually have worked. It should not even 
> compile.

I guess that's why sun3_scsi leaves SUPPORT_TAGS undefined. I suppose we 
can ignore all the code in sun3_NCR5380.c that is conditional upon #ifdef 
SUPPORT_TAGS. (That's actually how I did my preliminary merge patches.)

I guess having two versions of the NCR5380_transfer_dma() routine is 
reasonable but it would be nice if some of the other discrepancies could 
be resolved. Without knowledge of the Sun 3 DMA hardware it is difficult 
to avoid some questionable #ifdefs.

-- 
