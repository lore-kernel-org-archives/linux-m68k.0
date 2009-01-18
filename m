From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: Falcon IDE breakage
Date: Sun, 18 Jan 2009 01:58:07 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0901180144530.8392@zirkon.biophys.uni-duesseldorf.de>
References: <1b1304130901131349n6b67eac5j1c17f4791dd6718e@mail.gmail.com>
 <20090114003245.GA4419@cynthia.pants.nu>
 <Pine.LNX.4.64.0901141224080.16246@loopy.telegraphics.com.au>
 <alpine.DEB.1.00.0901170022250.27520@zirkon.biophys.uni-duesseldorf.de>
 <alpine.DEB.1.00.0901170354200.1528@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0901171258170.25319@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-venus.uni-duesseldorf.de ([134.99.128.32]:50141 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752789AbZARA6J (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sat, 17 Jan 2009 19:58:09 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KDN00J006OWX900@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Sun, 18 Jan 2009 01:58:08 +0100 (MET)
In-reply-to: <Pine.LNX.4.64.0901171258170.25319@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, linux-m68k@vger.kernel.org

> On Sat, 17 Jan 2009, Michael Schmitz wrote:
> > your commit 5b31f855f10d0053e738baa6d91fb6a3fad35119 (introduction of IDE lock 
> > helpers) breaks Atari Falcon IDE on the first request going out to the drive, if 
> > I remove the request_irq() call from ide-probe.c (as it should be).
> 
> I assume this is on real hardware, as I didn't notice on ARAnyM?

No, this was on ARAnyM (my git tree had the IDE irq request #ifdef'ed out for a 
while now). I'm sure it would work the same on hardware. 

Did you still get the IDE driver to work after taking out request_irq in 
ide-probe?

diff --git a/drivers/ide/ide-probe.c b/drivers/ide/ide-probe.c
index 0ccbb44..1571ab7 100644
--- a/drivers/ide/ide-probe.c
+++ b/drivers/ide/ide-probe.c
@@ -968,8 +968,10 @@ static int init_irq (ide_hwif_t *hwif)
        if (io_ports->ctl_addr)
                hwif->tp_ops->set_irq(hwif, 1);
 
+#if !defined(CONFIG_BLK_DEV_FALCON_IDE) && !defined(CONFIG_BLK_DEV_FALCON_IDE_M
        if (request_irq(hwif->irq, &ide_intr, sa, hwif->name, hwif))
                goto out_up;
+#endif
 
        if (!hwif->rqsize) {
                if ((hwif->host_flags & IDE_HFLAG_NO_LBA48) ||

If so, do you perchance have two IDE drivers defined in the ARAnyM config file?

	Michael

