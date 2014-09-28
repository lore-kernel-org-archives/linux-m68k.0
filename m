From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 4/5] natsemi/macsonic: Remove superfluous interrupt disable/restore
Date: Sun, 28 Sep 2014 11:26:24 +0200
Message-ID: <1411896385-25384-4-git-send-email-geert__10679.8181812794$1411896475$gmane$org@linux-m68k.org>
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
 drivers/net/ethernet/natsemi/macsonic.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/natsemi/macsonic.c b/drivers/net/ethernet/natsemi/macsonic.c
index 9e4ddbba70363b8f..66c2d50d5b8d12df 100644
--- a/drivers/net/ethernet/natsemi/macsonic.c
+++ b/drivers/net/ethernet/natsemi/macsonic.c
@@ -326,13 +326,9 @@ static int mac_onboard_sonic_probe(struct net_device *dev)
 	    macintosh_config->ident == MAC_MODEL_P588 ||
 	    macintosh_config->ident == MAC_MODEL_P575 ||
 	    macintosh_config->ident == MAC_MODEL_C610) {
-		unsigned long flags;
 		int card_present;
 
-		local_irq_save(flags);
 		card_present = hwreg_present((void*)ONBOARD_SONIC_REGISTERS);
-		local_irq_restore(flags);
-
 		if (!card_present) {
 			printk("none.\n");
 			return -ENODEV;
-- 
1.9.1
