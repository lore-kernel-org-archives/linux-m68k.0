From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: Falcon IDE breakage [patch]
Date: Sun, 18 Jan 2009 02:45:50 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0901180219340.9820@zirkon.biophys.uni-duesseldorf.de>
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
Received: from mailout-venus.uni-duesseldorf.de ([134.99.128.32]:57013 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755330AbZARBpv (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sat, 17 Jan 2009 20:45:51 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KDN00N008WE4100@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Sun, 18 Jan 2009 02:45:50 +0100 (MET)
In-reply-to: <Pine.LNX.4.64.0901171258170.25319@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, linux-m68k@vger.kernel.org

Hi,

> > your commit 5b31f855f10d0053e738baa6d91fb6a3fad35119 (introduction of IDE lock 
> > helpers) breaks Atari Falcon IDE on the first request going out to the drive, if 
> > I remove the request_irq() call from ide-probe.c (as it should be).
> 
> I assume this is on real hardware, as I didn't notice on ARAnyM?

Followup: never mind, I found out that this patch fixes the problem for me:
(NB: still on ARAnyM, having two IDE drivers didn't matter, and I still have to 
test the interaction of new IDE locking with SCSI)

Any other side effects of IDE_HFLAG_SERIALIZE ??

(Actually I realize I could have stuck the flag in 
falconide_port_info.host_flags instead - works just as well. Pick whatever suits 
the IDE guys best)

	Michael

[m68k] Falcon IDE: always serialize, in order to force execution of 
       ide_get_lock() and friends.

Signed-off-By: Michael Schmitz <schmitz@debian.org>
---
diff --git a/drivers/ide/falconide.c b/drivers/ide/falconide.c
index a5ba820..7223dc3 100644
--- a/drivers/ide/falconide.c
+++ b/drivers/ide/falconide.c
@@ -132,6 +132,8 @@ static int __init falconide_init(void)
                goto err;
        }
 
+       host->host_flags |= IDE_HFLAG_SERIALIZE;
+
        ide_get_lock(NULL, NULL);
        rc = ide_host_register(host, &falconide_port_info, hws);
        ide_release_lock();
