From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: [PATCH 3/3] m68k: section mismatch fixes: Atari SCSI
Date: Sun, 18 Jan 2009 03:22:15 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0901180319130.9820@zirkon.biophys.uni-duesseldorf.de>
References: <1b1304130901131349n6b67eac5j1c17f4791dd6718e@mail.gmail.com>
 <20090114003245.GA4419@cynthia.pants.nu>
 <Pine.LNX.4.64.0901141224080.16246@loopy.telegraphics.com.au>
 <alpine.DEB.1.00.0901170022250.27520@zirkon.biophys.uni-duesseldorf.de>
 <alpine.DEB.1.00.0901170354200.1528@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0901171258170.25319@anakin>
 <alpine.DEB.1.00.0901180302190.9820@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-venus.uni-duesseldorf.de ([134.99.128.32]:61963 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752671AbZARCWR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sat, 17 Jan 2009 21:22:17 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KDN00200AL4GV00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Sun, 18 Jan 2009 03:22:16 +0100 (MET)
In-reply-to: <alpine.DEB.1.00.0901180302190.9820@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Part 3: Atari SCSI

There's one remaining section mismatch that I cannot fix:

WARNING: vmlinux.o(.text+0x69fc): Section mismatch in reference from the 
function atari_stram_alloc() to the function .init.text:__alloc_bootmem_low()
The function atari_stram_alloc() references
the function __init __alloc_bootmem_low().
This is often because atari_stram_alloc lacks a __init 
annotation or the annotation of __alloc_bootmem_low is wrong.

atari_stram_alloc() is needed after kernel init, and __alloc_bootmem_low is 
never called after MMU init, so that seems harmless.

commit 0937bf535329004b055dacdaf4d06fa424f716a2
Author: Michael Schmitz <schmitz@xplor.waratah.dyndns.org>
Date:   Fri Jan 2 23:44:01 2009 +0100

    [m68k] Atari SCSI: add __init annotations to probe routines
    
    Signed-off-by: Michael Schmitz <schmitz@debian.org>

diff --git a/drivers/scsi/atari_NCR5380.c b/drivers/scsi/atari_NCR5380.c
index 00f944d..a3d5371 100644
--- a/drivers/scsi/atari_NCR5380.c
+++ b/drivers/scsi/atari_NCR5380.c
@@ -844,7 +844,7 @@ static char *lprint_Scsi_Cmnd(Scsi_Cmnd *cmd, char *pos, char *buffer, int lengt
  *
  */
 
-static int NCR5380_init(struct Scsi_Host *instance, int flags)
+static int __init NCR5380_init(struct Scsi_Host *instance, int flags)
 {
 	int i;
 	SETUP_HOSTDATA(instance);
diff --git a/drivers/scsi/atari_scsi.c b/drivers/scsi/atari_scsi.c
index d97ab66..03541e3 100644
--- a/drivers/scsi/atari_scsi.c
+++ b/drivers/scsi/atari_scsi.c
@@ -619,7 +619,7 @@ int atari_queue_command(Scsi_Cmnd *cmd, void (*done)(Scsi_Cmnd *))
 #endif
 
 
-int atari_scsi_detect(struct scsi_host_template *host)
+int __init atari_scsi_detect(struct scsi_host_template *host)
 {
 	static int called = 0;
 	struct Scsi_Host *instance;
