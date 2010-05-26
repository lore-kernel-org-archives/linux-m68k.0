From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 05/11] m68k: Atari EtherNAT - Fix up type mismatch in smc_drv_resume().
Date: Wed, 26 May 2010 19:48:47 +0200
Message-ID: <1274896133-19590-6-git-send-email-geert@linux-m68k.org>
References: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from brigitte.telenet-ops.be ([195.130.137.66]:43288 "EHLO
	brigitte.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757390Ab0EZRtS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 26 May 2010 13:49:18 -0400
In-Reply-To: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit 5fc3441349936ea6f1f95a1ef17492223c76a695 ("net: smc91x: Fix up type
mismatch in smc_drv_resume().")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/atari_91C111.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/atari_91C111.c b/drivers/net/atari_91C111.c
index 40b251c..40a3774 100644
--- a/drivers/net/atari_91C111.c
+++ b/drivers/net/atari_91C111.c
@@ -2387,7 +2387,7 @@ static int smc_drv_resume(struct device *dev)
 
 	if (ndev) {
 		struct smc_local *lp = netdev_priv(ndev);
-		smc_enable_device(dev);
+		smc_enable_device(pdev);
 		if (netif_running(ndev)) {
 			smc_reset(ndev);
 			smc_enable(ndev);
-- 
1.7.0.4
