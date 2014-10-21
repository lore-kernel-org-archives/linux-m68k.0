From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] nubus: Remove superfluous interrupt disable/restore
Date: Tue, 21 Oct 2014 19:55:20 +0200
Message-ID: <1413914120-23894-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

As of commit e4dc601bf99ccd1c ("m68k: Disable/restore interrupts in
hwreg_present()/hwreg_write()"), this is no longer needed.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/nubus/nubus.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index 5066a7ef7b6c38a2..3319cf19deebe0f2 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -920,14 +920,10 @@ void __init nubus_probe_slot(int slot)
 	rp = nubus_rom_addr(slot);	
 	for(i = 4; i; i--)
 	{
-		unsigned long flags;
 		int card_present;
 
 		rp--;
-		local_irq_save(flags);
 		card_present = hwreg_present(rp);
-		local_irq_restore(flags);
-	       
 		if (!card_present)
 			continue;
 
-- 
1.9.1
