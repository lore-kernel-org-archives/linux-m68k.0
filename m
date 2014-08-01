From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: converting the NCR5380 drivers away from scsi_register
Date: Fri, 1 Aug 2014 13:13:57 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1408011307120.6796@nippy.intranet>
References: <20140616141853.GA32399@infradead.org> <alpine.LNX.2.00.1406171756040.17715@nippy.intranet> <CAMuHMdUkMHoMahyppwttnm7qs6etoqMGtvk77HezUBj-GOeMKg@mail.gmail.com> <alpine.LNX.2.00.1407301726430.9554@nippy.intranet> <53D9D4B2.9080801@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:57070 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750978AbaHADPA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 31 Jul 2014 23:15:00 -0400
In-Reply-To: <53D9D4B2.9080801@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Michael Schmitz <schmitz@debian.org>, Sam Creasey <sammy@sammy.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Thu, 31 Jul 2014, Michael Schmitz wrote:

> atari_scsi is only used on TT and Falcon Atari variants. 'Testing' for 
> hardware presence is just checking bits from a bitmap populated at 
> arch_init time, that can easily be moved into a platform device setup, 
> much like I already do for the network drivers. Does that answer your 
> question?

Yes. I'll convert {atari,mac,sun3}_scsi to platform devices and 
scsi_host_alloc/scsi_add_host.

-- 
