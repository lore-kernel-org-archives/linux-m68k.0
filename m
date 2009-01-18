From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: [PATCH 2/3] m68k: section mismatch fixes: DMAsound
Date: Sun, 18 Jan 2009 03:17:33 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0901180312240.9820@zirkon.biophys.uni-duesseldorf.de>
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
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:55144 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753664AbZARCRf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sat, 17 Jan 2009 21:17:35 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KDN00200ADAUC00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Sun, 18 Jan 2009 03:17:34 +0100 (MET)
In-reply-to: <alpine.DEB.1.00.0901180302190.9820@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Part 2: DMAsound driver

commit 277d9bd7a6198e50fdaa841d3383a46a5cf2d185
Author: Michael Schmitz <schmitz@xplor.waratah.dyndns.org>
Date:   Fri Jan 2 08:06:17 2009 +0100

    [m68k] section mismatch fixes: add __initdata to driver presets struct
    
    Signed-off-By: Michael Schmitz <schmitz@debian.org>
---
diff --git a/sound/oss/dmasound/dmasound_atari.c b/sound/oss/dmasound/dmasound_atari.c
index 4d45bd6..43b10b1 100644
--- a/sound/oss/dmasound/dmasound_atari.c
+++ b/sound/oss/dmasound/dmasound_atari.c
@@ -1523,7 +1523,7 @@ static SETTINGS def_soft = {
 	.speed	= 8000
 } ;
 
-static MACHINE machTT = {
+static __initdata MACHINE machTT = {
 	.name		= "Atari",
 	.name2		= "TT",
 	.owner		= THIS_MODULE,
@@ -1552,7 +1552,7 @@ static MACHINE machTT = {
 	.capabilities	=  DSP_CAP_BATCH	/* As per SNDCTL_DSP_GETCAPS */
 };
 
-static MACHINE machFalcon = {
+static __initdata MACHINE machFalcon = {
 	.name		= "Atari",
 	.name2		= "FALCON",
 	.dma_alloc	= AtaAlloc,
