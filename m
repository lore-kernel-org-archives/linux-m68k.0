From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v4 4/9] net-next: ax88796: Do not free IRQ in ax_remove() (already freed in ax_close()).
Date: Thu, 19 Apr 2018 14:05:21 +1200
Message-ID: <1524103526-12240-5-git-send-email-schmitzmic@gmail.com>
References: <1524025616-3722-1-git-send-email-schmitzmic@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1524025616-3722-1-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch, fthain@telegraphics.com.au, geert@linux-m68k.org, f.fainelli@gmail.com, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>
List-Id: linux-m68k@vger.kernel.org

From: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>

This complements the fix in 82533ad9a1c ("net: ethernet: ax88796:
don't call free_irq without request_irq first") that removed the
free_irq call in the error path of probe, to also not call free_irq
when remove is called to revert the effects of probe.

Fixes: 82533ad9a1c (net: ethernet: ax88796: don't call free_irq without request_irq first)
Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/ethernet/8390/ax88796.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index ab020e6..d3f30f1 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -790,7 +790,6 @@ static int ax_remove(struct platform_device *pdev)
 	struct resource *mem;
 
 	unregister_netdev(dev);
-	free_irq(dev->irq, dev);
 
 	iounmap(ei_local->mem);
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
1.7.0.4
