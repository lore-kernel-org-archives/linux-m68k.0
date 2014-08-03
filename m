From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: converting the NCR5380 drivers away from scsi_register
Date: Sun, 3 Aug 2014 13:43:46 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1408031314200.545@nippy.intranet>
References: <20140616141853.GA32399@infradead.org> <alpine.LNX.2.00.1406171756040.17715@nippy.intranet> <CAMuHMdUkMHoMahyppwttnm7qs6etoqMGtvk77HezUBj-GOeMKg@mail.gmail.com> <alpine.LNX.2.00.1407301726430.9554@nippy.intranet> <53D9D4B2.9080801@gmail.com>
 <alpine.LNX.2.00.1408011307120.6796@nippy.intranet> <53DB4C98.8020907@gmail.com> <alpine.LNX.2.00.1408021106030.28603@nippy.intranet> <53DCA6AE.5060801@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:46571 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755035AbaHCDot (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 2 Aug 2014 23:44:49 -0400
In-Reply-To: <53DCA6AE.5060801@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Michael Schmitz <schmitz@debian.org>, Sam Creasey <sammy@sammy.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Sat, 2 Aug 2014, Michael Schmitz wrote:

> > I'm not particularly concerned about atari_scsi.c. I am concerned 
> > about the three forks of the core driver (not least because of the 
> > shared header) that's why I've sent patches for sun3_NCR5380 and 
> > atari_NCR5380 in the past.
> >   
> 
> OK, forget about atari_scsi.c for now. From memory, the major difference 
> between atari_NCR5380.c and the others is handling of the ST-DMA/shared 
> interrupt locking.

Yes, sun3_NCR5380.c and NCR5380.c lack support for the ST-DMA chip.

And both NCR5380.c and sun3_NCR5380.c dropped the code to support ISA 
cards, as I mentioned.

Both NCR5380.c and sun3_NCR5380.c lack merge_contiguous_buffers().

NCR5380.c lacks support for tagged queueing, while sun3_NCR5380.c and 
atari_NCR5380.c have divergent implementations of this.

sun3_NCR5380.c and atari_NCR5380.c have divergent implementations of 
NCR5380_transfer_dma().

sun3_NCR5380.c and atari_NCR5380.c share the same implementation of the 
NCR5380_main() co-routine, but it differs significantly from the algorithm 
in NCR5380.c.

Each of sun3_NCR5380.c, atari_NCR5380.c and NCR5380.c have had some clean 
up and modernization work that does not appear in any of the others.

Despite all of that, I have a patch series that attempts to unify 
atari_NCR5380.c and sun3_NCR5380.c. This seems like a sensible idea (in 
theory) given that probably only the ISA cards actually need NCR5380.c.

At some point I'll send some patches for comment, so that we might discuss 
the issues with everyone on the same page. Until then, I'd prefer to focus 
on the scsi_register() conversion.

> We need to preserve that pretty much as is, or risk serious regressions. 
> I mean, more serious trouble than I already have with the current driver 
> because of the tendency of my Falcon to muck up the SCSI chip's clock 
> signal under heavy load. Also note that there is still one of my patches 
> unmerged (under review since early this year) that is necessary to avoid 
> 'scheduling in interrupt' style panic.

Can you re-send it please?

> The rest of the differences were tweaks added by the Atari SCSI author 
> to make the driver behave with borderline standards compliant hardware 
> (long reset delay for some CD drives, tweaks to bus settle delays). 
> Probably not that critical in the first instance.
> 
> > > Might need another platform device for the ST-DMA as well ...
> > >     
> >
> > I don't think that relates to scsi_register() deprecation.
> >   
> 
> Not at all - just to the platform device conversion. Not sure I fully 
> understand what you have in mind, though.

With regards to scsi_register() conversion I'll send some patches for you 
to review once complete and tested (in mac_scsi). They will probably need 
revision after review; I'm fine with that.

-- 
