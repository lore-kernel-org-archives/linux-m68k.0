From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Falcon IDE breakage
Date: Sat, 17 Jan 2009 04:13:14 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0901170354200.1528@zirkon.biophys.uni-duesseldorf.de>
References: <1b1304130901131349n6b67eac5j1c17f4791dd6718e@mail.gmail.com>
 <20090114003245.GA4419@cynthia.pants.nu>
 <Pine.LNX.4.64.0901141224080.16246@loopy.telegraphics.com.au>
 <alpine.DEB.1.00.0901170022250.27520@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
In-reply-to: <alpine.DEB.1.00.0901170022250.27520@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org

Bartlomiej,

your commit 5b31f855f10d0053e738baa6d91fb6a3fad35119 (introduction of IDE lock 
helpers) breaks Atari Falcon IDE on the first request going out to the drive, if 
I remove the request_irq() call from ide-probe.c (as it should be).

ide_get_lock has the important side effect of registering the IDE interrupt as 
the current valid interrupt handler for the 'shared' ST-DMA  interrupt dispatch. 
The lock must be held for all operations on the host that expect an interrupt to 
be taken.

In the current form, the lock helpers only register the interrupt if the 
IDE_HFLAG_SERIALIZE host flag is set. This does not appear to be the case for 
the Falcon IDE host. 

Consequently, the lock does not seem to be taken at all times when IDE should be 
passed the interrupt. If I remove the extra request_irq() in ide-probe.c, the 
first request reading from the drive times out with hda: lost interrupt.

Even if request_irq() is called in ide-probe.c for Falcon, the current code 
would open races with other users of the ST-DMA lock (in a worse way than the 
previous code did, i.e. by registering the IDE interrupt handler in addition to 
the ST-DMA dispatch for the IDE/SCSI/DMA/Floppy interrupt). I am currently 
working to eliminate such races in the interaction of IDE and SCSI drivers, and 
the duplicated interrupt has been shown up as a suspect there (incidentially, 
that's why the problem never showed in Geert's ARAnyM tests).

Can you make sure the IDE_HFLAG_SERIALIZE is set for Falcon IDE, or the 
problematic test is removed in that case?

Thanks,

	Michael
