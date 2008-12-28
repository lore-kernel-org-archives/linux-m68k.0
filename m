From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: [PATCH] m68k: Fix atarimouse init
Date: Sun, 28 Dec 2008 23:00:45 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0812282252230.10733@zirkon.biophys.uni-duesseldorf.de>
References: <20081217165557.b4898a4b.sfr@canb.auug.org.au>
 <Pine.LNX.4.64.0812170915400.29433@anakin>
 <Pine.LNX.4.64.0812211205270.3499@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:39560 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754034AbYL1WAt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sun, 28 Dec 2008 17:00:49 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KCL00K00X5AG200@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Sun, 28 Dec 2008 23:00:46 +0100 (MET)
In-reply-to: <Pine.LNX.4.64.0812211205270.3499@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi,

following up on Geert's report that atarimouse does fail to load as a module 
(with ENODEV), here's the fix. 

Brown paper bag, well and truely. Got the semantics of the atari_keyb_init 
return reversed (not that atari_keyb_init ever returns anything but success, but 
that's for another day).

I still get no mouse events in either /dev/input/mice or .../mouse0, though. I 
suspect the mouse open hook never gets called. Same bug might affect amimouse 
(though the open function does do the full hardware setup there).

	Michael

 drivers/input/mouse/atarimouse.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/input/mouse/atarimouse.c b/drivers/input/mouse/atarimouse.c
index a57143c..1b5f4dd 100644
--- a/drivers/input/mouse/atarimouse.c
+++ b/drivers/input/mouse/atarimouse.c
@@ -118,7 +118,7 @@ static int __init atamouse_init(void)
 	if (!MACH_IS_ATARI || !ATARIHW_PRESENT(ST_MFP))
 		return -ENODEV;
 
-	if (!atari_keyb_init())
+	if (atari_keyb_init())
 		return -ENODEV;
 
 	atamouse_dev = input_allocate_device();

Signed-off-by: Michael Schmitz <schmitz@debian.org>


