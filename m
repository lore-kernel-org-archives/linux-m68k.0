From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 03/11] m68k: Atari EtherNAT - Fix irq flags
Date: Wed, 26 May 2010 19:48:45 +0200
Message-ID: <1274896133-19590-4-git-send-email-geert@linux-m68k.org>
References: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from jacques.telenet-ops.be ([195.130.132.50]:34022 "EHLO
	jacques.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757380Ab0EZRtR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 26 May 2010 13:49:17 -0400
In-Reply-To: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit d5ccd67bb77ced5249067d05171992a7d5020393 ("NET: smc91x: Fix irq
flags")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/atari_91C111.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/atari_91C111.c b/drivers/net/atari_91C111.c
index d902c10..7cfb9d3 100644
--- a/drivers/net/atari_91C111.c
+++ b/drivers/net/atari_91C111.c
@@ -2253,7 +2253,7 @@ static int __devinit smc_drv_probe(struct platform_device *pdev)
 	printk("atari_91C111: IRQ forced to irq=%d\n", ndev->irq);
 	}
 
-	if (ires->flags & IRQF_TRIGGER_MASK)
+	if (irq_flags == -1 || ires->flags & IRQF_TRIGGER_MASK)
 		irq_flags = ires->flags & IRQF_TRIGGER_MASK;
 
 
-- 
1.7.0.4
