From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v2 3/8] net: ax88796: Do not free IRQ in ax_remove() (already freed in ax_close()).
Date: Tue, 17 Apr 2018 14:08:10 +1200
Message-ID: <1523930895-6973-4-git-send-email-schmitzmic@gmail.com>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

This complements the fix in 82533ad9a1c that removed the free_irq
call in the error path of probe, to also not call free_irq when
remove is called to revert the effects of probe.

Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
---
 drivers/net/ethernet/8390/ax88796.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index 83e59ae..ecf104c 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -793,7 +793,6 @@ static int ax_remove(struct platform_device *pdev)
 	struct resource *mem;
 
 	unregister_netdev(dev);
-	free_irq(dev->irq, dev);
 
 	iounmap(ei_local->mem);
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
1.7.0.4
