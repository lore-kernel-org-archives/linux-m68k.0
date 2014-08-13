From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Sun3 SCSI DMA, was Re: converting the NCR5380 drivers away from
 scsi_register
Date: Wed, 13 Aug 2014 15:29:24 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1408131511150.12942@nippy.intranet>
References: <53DB4C98.8020907@gmail.com> <alpine.LNX.2.00.1408021106030.28603@nippy.intranet> <53DCA6AE.5060801@gmail.com> <alpine.LNX.2.00.1408031314200.545@nippy.intranet> <53DDFBC0.4050906@gmail.com> <alpine.LNX.2.00.1408041146400.21367@nippy.intranet>
 <53E09EAE.70308@gmail.com> <alpine.LNX.2.00.1408051948330.16933@nippy.intranet> <20140806144252.GJ21346@anhedonia> <53E48E50.8010600@gmail.com> <20140811151045.GO21346@anhedonia>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:37970 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750759AbaHMFa0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 13 Aug 2014 01:30:26 -0400
In-Reply-To: <20140811151045.GO21346@anhedonia>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sam Creasey <sammy@sammy.net>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Christoph Hellwig <hch@infradead.org>, Michael Schmitz <schmitz@debian.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Mon, 11 Aug 2014, Sam Creasey wrote:

> On Fri, Aug 08, 2014 at 08:46:08PM +1200, Michael Schmitz wrote:
> > >IIRC, the DMA controller for the sun3's NCR5380 implementation is 
> > >extremely fussy about what happens in which phase, and it's quick to 
> > >anger if you don't handle everything exactly how it expects.
> > >  
> > 
> > Does the DMA controller also sit in between the bus and the NCR chip, 
> > as on Falcon? Otherwise, I can't see how it would matter if we just 
> > bypass it and use PIO instead.
> > 
> > The PIO code from the Atari driver worked just fine for the Mac 5380 
> > (in fact, the first Mac driver used PIO for everything, including data 
> > in/out).
> 
> PIO definitely works on the Sun3 implementation under the right 
> circumstances, I ran it in PIO mode only for a while (much like the Mac 
> driver).
> 
> I can't remember the bus configuration offhand.

It might not be a big problem: sun3_scsi does a lot of PIO a lot as it is.

For NCR5380_reselect(), atari_NCR5380.c apparently uses only PIO whereas 
sun3_NCR5380.c will use PIO up to a 128 byte size limit (beyond which, 
only DMA is used).

For NCR5380_information_transfer() and PHASE_DATAIN, atari will use PIO 
for transfersize <= 31 bytes whereas sun3 will use PIO for <= 128 bytes. 
However, atari never uses DMA here if cmd->device->borken.

When cmd->device->borken, I assume sun3_NCR5380 inhibits PIO because PIO 
was itself expected to be problematic?

OTOH, if PIO works up to 128 bytes in all cases, why not larger transfers? 

Does the sun3_scsi driver still work after removing #define REAL_DMA?

For NCR5380_information_transfer() and PHASE_CMDOUT, the sun3 version 
applies the same size limit but only does DMA setup if cmd type is 
REQ_TYPE_FS (i.e. filesystem request). This command is then sent by PIO, 
so the DMA setup here seems to assume that the next phase will always be 
PHASE_DATAIN...

This would seem to imply that PIO always works when not REQ_TYPE_FS, such 
that no size limit is applicable...

BTW, testing sun3_dma_setup_done against cmd pointers looks very 
unreliable to me: unique cmds only have unique pointers until freed by the 
scsi mid-layer. After that, the same pointer is likely be re-used.

> > >
> > >I definitely remember that the DMA setup logic from the atari version 
> > >did not work at all on sun3.
> > 
> > No surprise there - DMA is implementation specific and needs to be 
> > handled on a per-case basis.

Perhaps atari_NCR5380 could use some of the sun3_NCR5380 code. E.g. atari 
avoids DMA entirely for reselect, and (only in some phases) when 
cmd->device->borken.

-- 
