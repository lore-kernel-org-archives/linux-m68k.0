From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 08/11] m68k: Atari EtherNAT - remove trailing space in messages
Date: Wed, 26 May 2010 19:48:50 +0200
Message-ID: <1274896133-19590-9-git-send-email-geert@linux-m68k.org>
References: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from jacques.telenet-ops.be ([195.130.132.50]:34022 "EHLO
	jacques.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757420Ab0EZRtV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 26 May 2010 13:49:21 -0400
In-Reply-To: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit 84d57bd61866c06aee5658fabe43292a231a5992 ("net/smc91xx: remove
trailing space in messages")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/atari_91C111.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/atari_91C111.c b/drivers/net/atari_91C111.c
index ac15c3f..ce8bd22 100644
--- a/drivers/net/atari_91C111.c
+++ b/drivers/net/atari_91C111.c
@@ -1342,7 +1342,7 @@ static irqreturn_t smc_interrupt(int irq, void *dev_id)
 			smc_phy_interrupt(dev);
 		} else if (status & IM_ERCV_INT) {
 			SMC_ACK_INT(lp, IM_ERCV_INT);
-			PRINTK("%s: UNSUPPORTED: ERCV INTERRUPT \n", dev->name);
+			PRINTK("%s: UNSUPPORTED: ERCV INTERRUPT\n", dev->name);
 		}
 	} while (--timeout);
 
-- 
1.7.0.4
