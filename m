From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 11/11] m68k: Atari EtherNAT - trans_start cleanups
Date: Wed, 26 May 2010 19:48:53 +0200
Message-ID: <1274896133-19590-12-git-send-email-geert@linux-m68k.org>
References: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from gerard.telenet-ops.be ([195.130.132.48]:43426 "EHLO
	gerard.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757430Ab0EZRtV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 26 May 2010 13:49:21 -0400
In-Reply-To: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit 1ae5dc342ac78d7a42965fd1f323815f6f5ef2c1 ("net: trans_start
cleanups")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/atari_91C111.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/atari_91C111.c b/drivers/net/atari_91C111.c
index 31b4777..5c10fd9 100644
--- a/drivers/net/atari_91C111.c
+++ b/drivers/net/atari_91C111.c
@@ -1416,7 +1416,7 @@ static void smc_timeout(struct net_device *dev)
 		schedule_work(&lp->phy_configure);
 
 	/* We can accept TX packets again */
-	dev->trans_start = jiffies;
+	dev->trans_start = jiffies; /* prevent tx timeout */
 	netif_wake_queue(dev);
 }
 
-- 
1.7.0.4
