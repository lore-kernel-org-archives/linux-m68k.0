From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v2 6/8] net: ax88796: set IRQF_SHARED flag when IRQ resource is marked as shareable
Date: Tue, 17 Apr 2018 14:08:13 +1200
Message-ID: <1523930895-6973-7-git-send-email-schmitzmic@gmail.com>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>
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
index c799441..a72dfbc 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -875,6 +875,9 @@ static int ax_probe(struct platform_device *pdev)
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
