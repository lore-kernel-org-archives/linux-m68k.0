From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 01/11] m68k: Atari EtherNAT - request_irq - Remove unnecessary leading & from second arg
Date: Wed, 26 May 2010 19:48:43 +0200
Message-ID: <1274896133-19590-2-git-send-email-geert@linux-m68k.org>
References: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from gerard.telenet-ops.be ([195.130.132.48]:43386 "EHLO
	gerard.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754822Ab0EZRtM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 26 May 2010 13:49:12 -0400
In-Reply-To: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit a0607fd3a25ba1848a63a0d925e36d914735ab47 ("drivers/net: request_irq
- Remove unnecessary leading & from second arg")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/atari_91C111.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/atari_91C111.c b/drivers/net/atari_91C111.c
index 0b92b94..bb28b19 100644
--- a/drivers/net/atari_91C111.c
+++ b/drivers/net/atari_91C111.c
@@ -1981,7 +1981,7 @@ static int __devinit smc_probe(struct net_device *dev, void __iomem *ioaddr,
 	}
 
 	/* Grab the IRQ */
-	retval = request_irq(dev->irq, &atari_ethernat_interrupt, irq_flags, dev->name, dev);
+	retval = request_irq(dev->irq, atari_ethernat_interrupt, irq_flags, dev->name, dev);
 	if (retval)
 		goto err_out;
 
-- 
1.7.0.4
