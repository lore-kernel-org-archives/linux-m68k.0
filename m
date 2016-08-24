From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68knommu: switch to using IO access methods in WildFire board code
Date: Wed, 24 Aug 2016 15:52:49 +1000
Message-ID: <1472017969-9228-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out6.external.iinet.net.au ([203.59.1.106]:19610
        "EHLO icp-osb-irony-out6.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750933AbcHXFxA (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 24 Aug 2016 01:53:00 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>

Most ColdFire support code has switched to using IO memory access
methods (readb/writeb/etc) when reading and writing internal peripheral
device registers. The WildFire board specific halt code was missed.

As it is now the WildFire code is broken, since all register definitions
were changed to be register addresses only some time ago.

Fix the WildFire board code to use the appropriate IO access functions.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/m528x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/coldfire/m528x.c b/arch/m68k/coldfire/m528x.c
index 45e947a..12f9e37 100644
--- a/arch/m68k/coldfire/m528x.c
+++ b/arch/m68k/coldfire/m528x.c
@@ -102,14 +102,14 @@ void wildfiremod_halt(void)
 	printk(KERN_INFO "WildFireMod hibernating...\n");
 
 	/* Set portE.5 to Digital IO */
-	MCF5282_GPIO_PEPAR &= ~(1 << (5 * 2));
+	writew(readw(MCFGPIO_PEPAR) & ~(1 << (5 * 2)), MCFGPIO_PEPAR);
 
 	/* Make portE.5 an output */
-	MCF5282_GPIO_DDRE |= (1 << 5);
+	writeb(readb(MCFGPIO_PDDR_E) | (1 << 5), MCFGPIO_PDDR_E);
 
 	/* Now toggle portE.5 from low to high */
-	MCF5282_GPIO_PORTE &= ~(1 << 5);
-	MCF5282_GPIO_PORTE |= (1 << 5);
+	writeb(readb(MCFGPIO_PODR_E) & ~(1 << 5), MCFGPIO_PODR_E);
+	writeb(readb(MCFGPIO_PODR_E) | (1 << 5), MCFGPIO_PODR_E);
 
 	printk(KERN_EMERG "Failed to hibernate. Halting!\n");
 }
-- 
1.9.1
