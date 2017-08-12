From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] m68k/mac: Avoid soft-lockup warning after mach_power_off
Date: Sat, 12 Aug 2017 17:12:12 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1708121021120.1762@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:58612 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750941AbdHLHST (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 12 Aug 2017 03:18:19 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Disable interrupts for power-off, like other platforms do. This prevents 
meaningless warnings from the soft-lockup detector on models with a power 
supply unit not under software control.

Reported-by: Stan Johnson <userm57@yahoo.com>
Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

diff --git a/arch/m68k/mac/misc.c b/arch/m68k/mac/misc.c
index 8aa8792e3174..0f3ba726e8a9 100644
--- a/arch/m68k/mac/misc.c
+++ b/arch/m68k/mac/misc.c
@@ -463,8 +463,9 @@ void mac_poweroff(void)
 		pmu_shutdown();
 #endif
 	}
-	local_irq_enable();
+
 	pr_crit("It is now safe to turn off your Macintosh.\n");
+	local_irq_disable();
 	while(1);
 }
 
@@ -554,8 +555,8 @@ void mac_reset(void)
 	}
 
 	/* should never get here */
-	local_irq_enable();
 	pr_crit("Restart failed. Please restart manually.\n");
+	local_irq_disable();
 	while(1);
 }
 
