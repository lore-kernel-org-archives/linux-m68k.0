From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Sun3 SCSI DMA, was Re: converting the NCR5380 drivers away from
 scsi_register
Date: Fri, 15 Aug 2014 11:46:28 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1408151138260.28678@nippy.intranet>
References: <53DB4C98.8020907@gmail.com> <alpine.LNX.2.00.1408021106030.28603@nippy.intranet> <53DCA6AE.5060801@gmail.com> <alpine.LNX.2.00.1408031314200.545@nippy.intranet> <53DDFBC0.4050906@gmail.com> <alpine.LNX.2.00.1408041146400.21367@nippy.intranet>
 <53E09EAE.70308@gmail.com> <alpine.LNX.2.00.1408051948330.16933@nippy.intranet> <20140806144252.GJ21346@anhedonia> <53E48E50.8010600@gmail.com> <20140811151045.GO21346@anhedonia> <alpine.LNX.2.00.1408131511150.12942@nippy.intranet> <53EB2C8C.3070608@gmail.com>
 <alpine.LNX.2.00.1408141114530.26526@nippy.intranet> <53EC7A0B.4080807@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:54811 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751448AbaHOBrb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 14 Aug 2014 21:47:31 -0400
In-Reply-To: <53EC7A0B.4080807@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Sam Creasey <sammy@sammy.net>, Christoph Hellwig <hch@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Thu, 14 Aug 2014, Michael Schmitz wrote:

> >   
> > > > When cmd->device->borken, I assume sun3_NCR5380 inhibits PIO 
> > > > because PIO was itself expected to be problematic?
> > > >       
> 
> The sun3 driver does set the borken flag but never uses it later - can't 
> see where it will inhibit PIO.

It inhibited PIO when it forked the atari code and commented out the test 
for cmd->device->borken, to ensure that PIO would never be used here.

Hence my suggestion that PIO itself was expected was problematic. OTOH, 
PIO is used up to 128 bytes, and beyond 128 bytes if !REQ_TYPE_FS...

-- 
