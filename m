From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 06/10] net: ax88796: set IRQF_SHARED flag when IRQ resource is marked as shareable
Date: Tue, 17 Apr 2018 10:04:41 +1200
Message-ID: <1523916285-6057-7-git-send-email-schmitzmic@gmail.com>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>
List-Id: linux-m68k@vger.kernel.org

From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

On the Amiga X-Surf100, the network card interrupt is shared with many
other interrupt sources, so requires the IRQF_SHARED flag to register.

Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/ax88796.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index b6d5bec..b09cdc6 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -873,6 +873,9 @@ static int ax_probe(struct platform_device *pdev)
 	dev->irq = irq->start;
 	ax->irqflags = irq->flags & IRQF_TRIGGER_MASK;
 
+	if (irq->flags &  IORESOURCE_IRQ_SHAREABLE)
+		ax->irqflags |= IRQF_SHARED;
+
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!mem) {
 		dev_err(&pdev->dev, "no MEM specified\n");
-- 
1.7.0.4
