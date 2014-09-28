From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 5/5] nubus: Remove superfluous interrupt disable/restore
Date: Sun, 28 Sep 2014 11:26:25 +0200
Message-ID: <1411896385-25384-5-git-send-email-geert@linux-m68k.org>
References: <1411896385-25384-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1411896385-25384-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

As of commit XXX ("m68k: Disable/restore interrupts in
hwreg_present()/hwreg_write()"), this is no longer needed.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Do not apply before commit XXX has been applied.
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
