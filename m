From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Sun3 SCSI DMA, was Re: converting the NCR5380 drivers away from
 scsi_register
Date: Thu, 14 Aug 2014 11:43:07 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1408141114530.26526@nippy.intranet>
References: <53DB4C98.8020907@gmail.com> <alpine.LNX.2.00.1408021106030.28603@nippy.intranet> <53DCA6AE.5060801@gmail.com> <alpine.LNX.2.00.1408031314200.545@nippy.intranet> <53DDFBC0.4050906@gmail.com> <alpine.LNX.2.00.1408041146400.21367@nippy.intranet>
 <53E09EAE.70308@gmail.com> <alpine.LNX.2.00.1408051948330.16933@nippy.intranet> <20140806144252.GJ21346@anhedonia> <53E48E50.8010600@gmail.com> <20140811151045.GO21346@anhedonia> <alpine.LNX.2.00.1408131511150.12942@nippy.intranet>
 <53EB2C8C.3070608@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:45355 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751984AbaHNBoM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 13 Aug 2014 21:44:12 -0400
In-Reply-To: <53EB2C8C.3070608@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Sam Creasey <sammy@sammy.net>, Christoph Hellwig <hch@infradead.org>, Michael Schmitz <schmitz@debian.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Wed, 13 Aug 2014, Michael Schmitz wrote:

> > For NCR5380_information_transfer() and PHASE_DATAIN, atari will use 
> > PIO for transfersize <= 31 bytes whereas sun3 will use PIO for <= 128 
> > bytes.
> >   
> 
> IIRC the ST-DMA can't be programmed for shorter transfers than 512 
> bytes. The condition
> 
> (transfersize = NCR5380_dma_xfer_len(instance,cmd,phase)) > 31)
> 
> enforces that - transfersize will be 0 on reads that are not multiples 
> of 512 bytes (and even some where the advertised transfer size does meet 
> that condition, but the command is not guranteed to be a block mode 
> command (tape reads).

I see.

> 
> > However, atari never uses DMA here if cmd->device->borken.
> >   
> 
> Different semantics of borken, I presume. On Atari, this means a DMA 
> transfer has failed earlier.

Right. I suppose the question of using PIO in this situation on sun3 would 
have to be put to the test.

> 
> > When cmd->device->borken, I assume sun3_NCR5380 inhibits PIO because 
> > PIO was itself expected to be problematic?
> >
> > OTOH, if PIO works up to 128 bytes in all cases, why not larger 
> > transfers?
> >   
> 
> Performance, perhaps.

Well, sun3_scsi has this:

static inline unsigned long sun3scsi_dma_xfer_len(unsigned long wanted,
                                                  struct scsi_cmnd *cmd,
                                                  int write_flag)
{
        if (cmd->request->cmd_type == REQ_TYPE_FS)
                return wanted;
        else
                return 0;
}

This does suggest that PIO does work beyond 128 bytes, even if it is 
avoided for filesystem requests. Which suggests that the atari reselect 
code might work on sun3.

(As for performance, I don't know why the REQ_TYPE_FS is significant: why 
not just raise the DMA size limit to 512 instead?)

> PIO would work, but hog the CPU. In fact, PIO for everything _does_ 
> work, on Falcon as well as Mac (I tried the PIO only mode on the Falcon 
> before trying on Mac). Did I eve mention how reallly incredibly 
> painfully slow that is?
> 
> > Does the sun3_scsi driver still work after removing #define REAL_DMA?
> >
> > For NCR5380_information_transfer() and PHASE_CMDOUT, the sun3 version 
> > applies the same size limit but only does DMA setup if cmd type is 
> > REQ_TYPE_FS (i.e. filesystem request). This command is then sent by 
> > PIO, so the DMA setup here seems to assume that the next phase will 
> > always be PHASE_DATAIN...
> >   
> 
> Might be a similar limitation to certain transfer sizes here. Block mode 
> vs. char mode.

That suggests that the test for REQ_TYPE_FS in 
NCR5380_information_transfer() in sun3_NCR5380 could be improved upon by 
using NCR5380_dma_xfer_len() when checking the size limit. That way it 
would work on atari as well, without #ifdefs.

-- 
