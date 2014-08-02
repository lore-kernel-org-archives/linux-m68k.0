From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: converting the NCR5380 drivers away from scsi_register
Date: Sat, 2 Aug 2014 11:27:08 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1408021106030.28603@nippy.intranet>
References: <20140616141853.GA32399@infradead.org> <alpine.LNX.2.00.1406171756040.17715@nippy.intranet> <CAMuHMdUkMHoMahyppwttnm7qs6etoqMGtvk77HezUBj-GOeMKg@mail.gmail.com> <alpine.LNX.2.00.1407301726430.9554@nippy.intranet> <53D9D4B2.9080801@gmail.com>
 <alpine.LNX.2.00.1408011307120.6796@nippy.intranet> <53DB4C98.8020907@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:37783 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752255AbaHBB2N (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 1 Aug 2014 21:28:13 -0400
In-Reply-To: <53DB4C98.8020907@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Michael Schmitz <schmitz@debian.org>, Sam Creasey <sammy@sammy.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Fri, 1 Aug 2014, Michael Schmitz wrote:

> 
> Thanks, much appreciated. I can supply the platform device setup in 
> arch/m68k/atari/config.c once you have decided what kind of resources or 
> platform data will be needed.
> 
> If you rather want to do this - either use the ATARIHW_PRESENT() macros 
> to test for ST_SCSI (Falcon, interrupt no. IRQ_MFP_FSCSI) or TT_SCSI 
> (TT, interrupt no. IRQ_TT_MFP_SCSI). Or else, replicate the logic from 
> config_atari()

Yes, that was my plan. A patch that replicates that logic is easier to 
review and less likely to cause regressions (of course, I'd follow the 
existing conventions in arch/m68k/atari/config.c).

Converting three drivers at once is a win because the first conversion is 
always the more difficult one. Therefore I'm planning to use the same 
logic three times over and therefore I'm not intending to address the 
peculiarities of different ports (that would be better done by you, me and 
Sam separately).

However, I'll will need you and Sam to test some patches (if they meet 
with approval once you and Sam get to review them, of course).

> - the SCSI chip directly mapped only in the TT integration, the Falcon 
> needs to access SCSI registers through the ST-DMA chip, and needs the 
> weird ST-DMA locking scheme plus a few other quirks.
> 
> Looking at atari_scsi.c - the code is full of IS_A_TT() macros and other 
> Atari specfic macros that could be replaced by testing bits in a feature 
> map. One bit (TT or Falcon style SCSI integration) rather - that still 
> leaves the register access functions for TT and Falcon to sort out.  Do 
> you plan to do all that in one go?

No, not in one go. That would be a separate patch, so that each patch has 
a single well defined purpose.

I'm not particularly concerned about atari_scsi.c. I am concerned about 
the three forks of the core driver (not least because of the shared 
header) that's why I've sent patches for sun3_NCR5380 and atari_NCR5380 in 
the past.

> Might need another platform device for the ST-DMA as well ...

I don't think that relates to scsi_register() deprecation.

-- 
