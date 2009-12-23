From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Atari EtherNAT - use NETDEV_TX_OK instead of 0 in ndo_start_xmit()
Date: Wed, 23 Dec 2009 20:15:44 +0100
Message-ID: <1261595749-23531-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit 6ed106549d17474ca17a16057f4c0ed4eba5a7ca ("net: use NETDEV_TX_OK
instead of 0 in ndo_start_xmit() functions")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/atari_91C111.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/atari_91C111.c b/drivers/net/atari_91C111.c
index 87e2327..3b53ff9 100644
--- a/drivers/net/atari_91C111.c
+++ b/drivers/net/atari_91C111.c
@@ -711,7 +711,7 @@ static int smc_hard_start_xmit(struct sk_buff *skb, struct net_device *dev)
 		dev->stats.tx_errors++;
 		dev->stats.tx_dropped++;
 		dev_kfree_skb(skb);
-		return 0;
+		return NETDEV_TX_OK;
 	}
 
 	smc_special_lock(&lp->lock);
@@ -748,7 +748,7 @@ static int smc_hard_start_xmit(struct sk_buff *skb, struct net_device *dev)
 		smc_hardware_send_pkt((unsigned long)dev);
 	}
 
-	return 0;
+	return NETDEV_TX_OK;
 }
 
 /*
-- 
1.6.0.4
