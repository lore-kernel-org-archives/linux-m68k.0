From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v4 7/9] net-next: ax88796: set IRQF_SHARED flag when IRQ resource is marked as shareable
Date: Thu, 19 Apr 2018 14:05:24 +1200
Message-ID: <1524103526-12240-8-git-send-email-schmitzmic@gmail.com>
References: <1524025616-3722-1-git-send-email-schmitzmic@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1524025616-3722-1-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch, fthain@telegraphics.com.au, geert@linux-m68k.org, f.fainelli@gmail.com, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>
List-Id: linux-m68k@vger.kernel.org

From: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>

On the Amiga X-Surf100, the network card interrupt is shared with many
other interrupt sources, so requires the IRQF_SHARED flag to register.

Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/ax88796.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index d283ed0..229279f 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -872,6 +872,9 @@ static int ax_probe(struct platform_device *pdev)
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
