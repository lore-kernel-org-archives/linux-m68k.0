From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] mac68k: fix mac_irq_pending() for PSC MACE and SCC
Date: Mon, 18 Jul 2011 19:44:17 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1107181939190.145@ibook.local>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:47424 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755202Ab1GRJmy (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 18 Jul 2011 05:42:54 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>


Add missing return statement. The docs say that the level 4 PSC IRQs 
relate to MACE DMA and SCC. Since those drivers don't call 
mac_irq_pending() this patch has no affect. But it should be fixed all the 
same, since it can be useful for MACE debugging.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

---
 arch/m68k/mac/macints.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6.39/arch/m68k/mac/macints.c
===================================================================
--- linux-2.6.39.orig/arch/m68k/mac/macints.c	2011-07-18 19:22:54.000000000 +1000
+++ linux-2.6.39/arch/m68k/mac/macints.c	2011-07-18 19:29:37.000000000 +1000
@@ -370,7 +370,7 @@ int mac_irq_pending(unsigned int irq)
 		break;
 	case 4:
 		if (psc_present)
-			psc_irq_pending(irq);
+			return psc_irq_pending(irq);
 		break;
 	}
 	return 0;
