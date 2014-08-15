From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Sun3 SCSI DMA, was Re: converting the NCR5380 drivers away from
 scsi_register
Date: Fri, 15 Aug 2014 12:09:35 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1408151203210.10537@nippy.intranet>
References: <53DB4C98.8020907@gmail.com> <alpine.LNX.2.00.1408021106030.28603@nippy.intranet> <53DCA6AE.5060801@gmail.com> <alpine.LNX.2.00.1408031314200.545@nippy.intranet> <53DDFBC0.4050906@gmail.com> <alpine.LNX.2.00.1408041146400.21367@nippy.intranet>
 <53E09EAE.70308@gmail.com> <alpine.LNX.2.00.1408051948330.16933@nippy.intranet> <20140806144252.GJ21346@anhedonia> <53E48E50.8010600@gmail.com> <20140811151045.GO21346@anhedonia> <alpine.LNX.2.00.1408131511150.12942@nippy.intranet> <53EB2C8C.3070608@gmail.com>
 <alpine.LNX.2.00.1408141114530.26526@nippy.intranet> <53EC7A0B.4080807@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:55264 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752742AbaHOCKi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 14 Aug 2014 22:10:38 -0400
In-Reply-To: <53EC7A0B.4080807@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Sam Creasey <sammy@sammy.net>, Christoph Hellwig <hch@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Thu, 14 Aug 2014, Michael Schmitz wrote:

> 
> The DMA setup early on may save time if the next phase is indeed DATAIN 
> or DATAOUT - if a command disconnects the DMA just won't be started. I 
> would have thought the DMA setup could just as easily be done inside 
> NCR5380_transfer_dma instead of splitting it in DMA setup and DMA start
> - any particular reason for this, Sammy?

Doing the DMA setup early on may not work for atari_NCR5380 given 
merge_contiguous_buffers() takes place prior to NCR5380_transfer_dma() and 
may alter the length of the tranfer. (sun3_NCR5380 doesn't have 
merge_contiguous_buffers()).

-- 
